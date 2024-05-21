// fb_dumpreg.c
// MUST BE RUN FROM SUDO ./A.OUT
//

// THIS IS THE BASE ADDRESS OF THE CAPE
#define CAPE_BASE 0x41100000

#include <stdio.h>
#include <stdlib.h>
#include <argp.h>
#include <string.h>
#include <stdint.h>
#include <fcntl.h>
#include <sys/mman.h>
#include <unistd.h>

#define BLOCK_SIZE (256 * 1024)
#define FB_STATUS 0x8000    // Read register
#define FB_CONTROL_0 0x8001 // Read/write control register
#define FB_PPROW_0 0x8002   // Pixels per row
#define FB_BCM_7 0x8003     // BCM bit plane timing registers
#define FB_BCM_6 0x8004
#define FB_BCM_5 0x8005
#define FB_BCM_4 0x8006
#define FB_BCM_3 0x8007
#define FB_BCM_2 0x8008

int mem_fd;                            // used only in setup_io
void *cape_map;                        // used only in setup_io
volatile unsigned *cape_starting_addr; // set in setup_io

struct arguments
{
    char *arg_w;
    int has_arguments;
    int print_registers;
};

static struct argp_option options[] = {
    {"write", 'w', "ADDRESS=VALUE", 0, "Write value to register, ADDR can be hex or dec or one of the values: "
                        "STATUS, CONTROL, PPR, BCM_7, BCM_6, BCM_5, BCM_4, BCM_3, BCM_2"},
    {"print", 'p', 0, 0, "Print control registers"},
    {0}};

static error_t parse_opt(int key, char *arg, struct argp_state *state)
{
    struct arguments *arguments = state->input;

    switch (key)
    {
    case 'w':
        arguments->arg_w = arg;
        arguments->has_arguments = 1;
        break;
    case 'p':
        arguments->print_registers = 1;
        arguments->has_arguments = 1;
        break;
    default:
        return ARGP_ERR_UNKNOWN;
    }
    return 0;
}

// Function to map string address to actual address
long map_address(const char *address_str)
{
    if (strcmp(address_str, "STATUS") == 0)
    {
        return 0x8000;
    }
    else if (strcmp(address_str, "CONTROL") == 0)
    {
        return 0x8001;
    }
    else if (strcmp(address_str, "PPR") == 0)
    {
        return 0x8002;
    }
    else if (strcmp(address_str, "BCM7") == 0)
    {
        return 0x8003;
    }
    else if (strcmp(address_str, "BCM6") == 0)
    {
        return 0x8004;
    }
    else if (strcmp(address_str, "BCM5") == 0)
    {
        return 0x8005;
    }
    else if (strcmp(address_str, "BCM4") == 0)
    {
        return 0x8006;
    }
    else if (strcmp(address_str, "BCM3") == 0)
    {
        return 0x8007;
    }
    else if (strcmp(address_str, "BCM2") == 0)
    {
        return 0x8008;
    }
    else
    {
        // Try to interpret it as a numerical address
        return strtol(address_str, NULL, 0);
    }
}

static struct argp argp = {options, parse_opt, 0, 0};

void setup_io();

void print_regs()
{
    printf("[%0X] STATUS   = 0x%08x\n", FB_STATUS, cape_starting_addr[FB_STATUS]);
    printf("[%0X] CONTROL  = 0x%08x\n", FB_CONTROL_0, cape_starting_addr[FB_CONTROL_0]);
    printf("[%0X] PPR      = 0x%08x\n", FB_PPROW_0, cape_starting_addr[FB_PPROW_0]);
    printf("[%0X] BCM7     = 0x%08x\n", FB_BCM_7, cape_starting_addr[FB_BCM_7]);
    printf("[%0X] BCM6     = 0x%08x\n", FB_BCM_6, cape_starting_addr[FB_BCM_6]);
    printf("[%0X] BCM5     = 0x%08x\n", FB_BCM_5, cape_starting_addr[FB_BCM_5]);
    printf("[%0X] BCM4     = 0x%08x\n", FB_BCM_4, cape_starting_addr[FB_BCM_4]);
    printf("[%0X] BCM3     = 0x%08x\n", FB_BCM_3, cape_starting_addr[FB_BCM_3]);
    printf("[%0X] BCM2     = 0x%08x\n", FB_BCM_2, cape_starting_addr[FB_BCM_2]);
}

int main(int argc, char **argv)
{
    struct arguments arguments;
    arguments.arg_w = NULL;
    arguments.has_arguments = 0;
    arguments.print_registers = 0;

    // Set up gpi pointer for direct register access
    setup_io();

    argp_parse(&argp, argc, argv, 0, 0, &arguments);

    if (!arguments.has_arguments)
    {
        print_regs();
    }
    else
    {
        if (arguments.print_registers)
        {
            print_regs();
        }

        if (arguments.arg_w)
        {
            char *address_str = strtok(arguments.arg_w, "=");
            char *value_str = strtok(NULL, "=");

            if (address_str && value_str)
            {
                long address = map_address(address_str);
                uint32_t value = (uint32_t)strtol(value_str, NULL, 0);

                printf("Setting address: 0x%lX to %d\n", address, value);
                cape_starting_addr[address] = value;
            }
            else
            {
                fprintf(stderr, "Invalid format for -w. Expected format: -w ADDRESS=VALUE\n");
                return 1;
            }
        }
    }

    return 0;
}

// ============================================================================

// Set up CAPE memory region
void setup_io()
{
    /* open /dev/mem */
    if ((mem_fd = open("/dev/mem", O_RDWR | O_SYNC)) < 0)
    {
        printf("Error. Could not open /dev/mem. Try running with 'sudo'. \n");
        exit(-1);
    }

    /* mmap cape */
    cape_map = mmap(
        NULL,                   // Any adddress in our space will do
        BLOCK_SIZE,             // Map length
        PROT_READ | PROT_WRITE, // Enable reading & writing to mapped memory
        MAP_SHARED,             // Shared with other processes
        mem_fd,                 // File to map
        CAPE_BASE               // Offset to CAPE peripheral
    );

    close(mem_fd); // No need to keep mem_fd open after mmap
    if (cape_map == MAP_FAILED)
    {
        printf("mmap error\n");
        exit(-1);
    }

    // Always use volatile pointer!
    cape_starting_addr = (volatile unsigned *)cape_map;
}
