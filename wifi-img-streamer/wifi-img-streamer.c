// PMSIS (Pulp Microcontroller Software Interface Standard)
#include "pmsis.h"

// BSP (Board Support Package) For Bitcraze AI-Deck
// #include "cl_pmsis_types.h"
#include "bsp/bsp.h"
#include "bsp/buffer.h"
#include "bsp/camera/himax.h"

// GAPLIB
// #include "gaplib/jpeg_encoder.h"


// STD Include
#include "stdio.h"
#include "stdint.h"

// Local Include
#include "cpx.h"
#include "wifi.h"

//OUR INCLUDE
#include <uxr/client/client.h>
#include <ucdr/microcdr.h>


// Macros
#define CAM_WIDTH 324
#define CAM_HEIGHT 244
#define CAM_DEPTH 1
#define RESOLUTION (CAM_WIDTH*CAM_HEIGHT)
#define CAPTURE_SIZE (RESOLUTION*CAM_DEPTH)
#define GAP8_FREQUENCY 250 *1000 *1000
#define GAP8_CLUSTER_FREQUENCY 150 *1000 *1000
#define GAP8_VOLTAGE 1200  // 1200
#define GAP8_UART_BAUDRATE 115200
#define LED_PIN 2

// Extern prototypes
extern void *cluster_init(pi_device_t *);
extern void encrypt(char *data, size_t len, char *key, char *iv, void* wrapper, pi_device_t* ram, int cipher);

// Local prototypes
static void task_main(void);
void task_camera();


static int wifiConnected = 0;
static int wifiClientConnected = 0;

static CPXPacket_t rxp;  // Deve essere fuori stack!
static CPXPacket_t txp;  // Deve essere fuori stack!

// task_camera
#define WIFI_CONNECT_STA 0x00
#define WIFI_CONNECT_AP 0x01
#define CAMERA_ORIENTATION_REGISTER 0x0101
#define CAMERA_ORIENTATION_VALUE 3

static char ssid[] = "ecslab";
static char key[] = "C79CJ2Y7h5DHdWa";

static struct pi_device camera_device;
static struct pi_device cluster_device;


typedef struct {
    uint8_t magic;
    uint16_t width;
    uint16_t height;
    uint8_t depth;
    uint8_t type;
    uint32_t size;
} __attribute__((packed)) img_header_t;


typedef enum {
    ENCODING_RAW = 0,
    ENCODING_JPEG = 1,
    ENCODING_CHACHA20 = 2
} __attribute__((packed)) StreamerMode_t;
static StreamerMode_t streamer_mode = ENCODING_RAW;


static int camera_open(struct pi_device *device){
    struct pi_himax_conf cam_conf;

    pi_himax_conf_init(&cam_conf);
    cam_conf.format = PI_CAMERA_QVGA;

    pi_open_from_conf(device, &cam_conf);
    if (pi_camera_open(device)) {
        cpxPrintToConsole(LOG_TO_CRTP, "Failed to open camera device\n");
        return -1;
    }

    // Rotate image
    pi_camera_control(device, PI_CAMERA_CMD_START, 0);
    uint8_t set_value = CAMERA_ORIENTATION_VALUE;
    uint8_t reg_value = 0;

    // Set
    pi_camera_reg_set(device, CAMERA_ORIENTATION_REGISTER, &set_value);
    pi_time_wait_us(1000000);

    // Test
    pi_camera_reg_get(device, CAMERA_ORIENTATION_REGISTER, &reg_value);
    if (set_value != reg_value) {
        cpxPrintToConsole(LOG_TO_CRTP, "Failed to rotate camera image\n");
        return -1;
    }

    // Commands
    pi_camera_control(device, PI_CAMERA_CMD_STOP, 0);
    pi_camera_control(device, PI_CAMERA_CMD_AEG_INIT, 0);

    return 0;
}


struct pi_cluster_conf cluster_conf;

static int cluster_open(struct pi_device *device) {

    pi_cluster_conf_init(&cluster_conf);
    cluster_conf.id = 0;
    cluster_conf.heap_size = 40*1024;
    cluster_conf.flags = PI_CLUSTER_FLAGS_FORK_BASED;
    // conf->cc_stack_size = 2*1024*8;

    cpxPrintToConsole(LOG_TO_CRTP, "Cluster id: %d heap_size: %d flags: %d\n",
                      cluster_conf.id, cluster_conf.heap_size, cluster_conf.flags);

    pi_open_from_conf(device, &cluster_conf);
    if (pi_cluster_open(device)) {
        cpxPrintToConsole(LOG_TO_CRTP, "Failed to open cluster\n");
        return -1;
    }
    return 0;
}


static void send_buffer(CPXPacket_t *pkt, uint8_t *buf, uint32_t buf_size) {
    uint32_t pkt_size = 0;
    uint32_t buf_offset = 0;

    do {
        pkt_size = sizeof(pkt->data);
        if (buf_offset + pkt_size > buf_size) {
            pkt_size = buf_size - buf_offset;
        }
        memcpy(pkt->data, &buf[buf_offset], sizeof(pkt->data));
        pkt->dataLength = pkt_size;
        cpxSendPacketBlocking(pkt);
        buf_offset += pkt_size;
    } while (buf_offset < buf_size);

    return;
}


int main(void) {
    pi_bsp_init();
    pi_freq_set(PI_FREQ_DOMAIN_FC, GAP8_FREQUENCY);
    pi_pmu_voltage_set(PI_PMU_DOMAIN_FC, GAP8_VOLTAGE);
    pmsis_kickoff((void *)task_main);

    return 0;
}

struct pi_device uart_device;
struct pi_uart_conf uart_conf;

void task_main() {
    pi_uart_conf_init(&uart_conf);
    uart_conf.baudrate_bps = GAP8_UART_BAUDRATE;

    pi_open_from_conf(&uart_device, &uart_conf);
    if (pi_uart_open(&uart_device)) {
        printf("[UART] open failed !\n");
        pmsis_exit(-1);
    }

    // Open Led
    pi_device_t led_gpio_dev;

    // Initialize the LED pin
    pi_gpio_pin_configure(&led_gpio_dev, LED_PIN, PI_GPIO_OUTPUT);
    pi_gpio_pin_write(&led_gpio_dev, LED_PIN, 1);

    // CPX
    cpxInit();
    cpxEnableFunction(CPX_F_WIFI_CTRL);
    cpxPrintToConsole(LOG_TO_CRTP, "[SpyFi][task_main] Welcome!\n");
    cpxPrintToConsole(LOG_TO_CRTP, "[SpyFi][task_main] configMINIMAL_STACK_SIZE = %d\n", configMINIMAL_STACK_SIZE);
    cpxPrintToConsole(LOG_TO_CRTP, "[SpyFi][task_main] tskIDLE_PRIORITY = %d\n", tskIDLE_PRIORITY);

    BaseType_t xTask;

    xTask = xTaskCreate(
            task_camera,
            "task_camera",
            configMINIMAL_STACK_SIZE*4,
            NULL,
            tskIDLE_PRIORITY + 1,
            NULL);

    if (xTask != pdPASS) {
        cpxPrintToConsole(LOG_TO_CRTP, "[SpyFi][task_main] Error: task_camera did not start!\n");
        pmsis_exit(-1);
    }

    while (1) {
        pi_yield();
    }
}

#define KEY_SIZE 32  // 32
#define IV_SIZE 12  // 12

void *rust_wrapper;
char *camera_buffer;
char *cipher_key;
char *cipher_iv;

PI_L2 uint32_t camera_buffer_len;


void task_camera(void *param) {

    pi_task_t capture_done_task;
    WiFiCTRLPacket_t *wifiCtrl;
    img_header_t *img_header;

    uint32_t startTime, captureTime, transferTime;
    uint64_t startCycles, captureCycles, transferCycles, wrapperCycles;

    vTaskDelay(2000);

    cpxPrintToConsole(LOG_TO_CRTP, "[SpyFi][task_camera] Welcome!\n");

    // Alloc buffers
    camera_buffer_len = CAPTURE_SIZE;
    camera_buffer = (char *)pmsis_l2_malloc(CAPTURE_SIZE);
    cipher_key = (char *)pmsis_l2_malloc(KEY_SIZE);
    cipher_iv = (char *)pmsis_l2_malloc(IV_SIZE); // 12 per CHACHA20 16 per AES256

    // CPX setup for WiFi Setup
    cpxInitRoute(CPX_T_GAP8, CPX_T_ESP32, CPX_F_WIFI_CTRL, &txp.route);

    // WiFi Setup
    wifiCtrl = (WiFiCTRLPacket_t*) txp.data;

    wifiCtrl->cmd = WIFI_CTRL_SET_SSID;
    memcpy(wifiCtrl->data, ssid, sizeof(ssid));
    txp.dataLength = sizeof(ssid);
    cpxSendPacketBlocking(&txp);

    wifiCtrl->cmd = WIFI_CTRL_SET_KEY;
    memcpy(wifiCtrl->data, key, sizeof(key));
    txp.dataLength = sizeof(key);
    cpxSendPacketBlocking(&txp);

    wifiCtrl->cmd = WIFI_CTRL_WIFI_CONNECT;
    wifiCtrl->data[0] = WIFI_CONNECT_STA;
    txp.dataLength = 2;
    cpxSendPacketBlocking(&txp);

    // Camera setup
    cpxPrintToConsole(LOG_TO_CRTP, "[SpyFi][task_camera] Camera Init... \n");
    if (camera_open(&camera_device)) {
        cpxPrintToConsole(LOG_TO_CRTP, "[SpyFi][task_camera] Camera Init... Fail!\n");
        return;
    }
    pi_camera_control(&camera_device, PI_CAMERA_CMD_STOP, 0);
    cpxPrintToConsole(LOG_TO_CRTP, "[SpyFi][task_camera] Camera Init... Done!\n");

    // Enable perf counter
    pi_perf_conf(1 << PI_PERF_CYCLES);
    pi_perf_reset();
    pi_perf_start();

    // CPX setup for Camera Stream
    cpxInitRoute(CPX_T_GAP8, CPX_T_WIFI_HOST, CPX_F_APP, &txp.route);
    cpxPrintToConsole(LOG_TO_CRTP, "-- Welcome in the SpyFi [wifi_open] --\n");
    rxp.route.source = CPX_T_GAP8;

    // Wait for connections
    wifiClientConnected = 0;
    while (wifiClientConnected == 0) {
        cpxReceivePacketBlocking(CPX_F_WIFI_CTRL, &rxp);
        wifiCtrl = (WiFiCTRLPacket_t*) rxp.data;
        switch (wifiCtrl->cmd) {
            case WIFI_CTRL_STATUS_WIFI_CONNECTED:
                wifiConnected = 1;
                cpxPrintToConsole(LOG_TO_CRTP,
                                  "Wifi connected (%u.%u.%u.%u)\n",
                                  wifiCtrl->data[0], wifiCtrl->data[1],
                                  wifiCtrl->data[2], wifiCtrl->data[3]);
                break;
            case WIFI_CTRL_STATUS_CLIENT_CONNECTED:
                wifiClientConnected = wifiCtrl->data[0];
                cpxPrintToConsole(LOG_TO_CRTP,
                                  "Wifi client connection status: %u\n",
                                  wifiCtrl->data[0]);
                break;
            default:
                break;
        }

    }

    for (int i=0; i<KEY_SIZE; i++) { cipher_key[i] = 0; }
    for (int i=0; i<IV_SIZE; i++) { cipher_iv[i] = 0; }


    // Camera Stream
    while (1) {
        // Get freertos time with xTaskGetTickCount();

        // Take Camera Frame
        startCycles = pi_perf_read(PI_PERF_CYCLES);

        pi_camera_control(&camera_device, PI_CAMERA_CMD_START, 0);
        pi_camera_capture(&camera_device, camera_buffer, RESOLUTION);
        pi_camera_control(&camera_device, PI_CAMERA_CMD_STOP, 0);

        captureCycles = pi_perf_read(PI_PERF_CYCLES) - startCycles;

        // Send Camera Frame
        startCycles = pi_perf_read(PI_PERF_CYCLES);

        img_header = (img_header_t *) txp.data;
        img_header->magic = 0xBC;
        img_header->width = CAM_WIDTH;
        img_header->height = CAM_HEIGHT;
        img_header->depth = CAM_DEPTH;
        img_header->type = streamer_mode;
        img_header->size = camera_buffer_len;
        txp.dataLength = sizeof(img_header_t);

        // -- Send Header
        cpxSendPacketBlocking(&txp);

        // -- Send Body
        send_buffer(&txp, (uint8_t*)camera_buffer, camera_buffer_len);

        transferCycles = pi_perf_read(PI_PERF_CYCLES) - startCycles;

        // End
        cpxPrintToConsole(LOG_TO_CRTP,
                          "capture=%d - wrapper=%d - transfer=%d\n",
                          (uint32_t)captureCycles, (uint32_t)wrapperCycles, (uint32_t)transferCycles);
    }
}
