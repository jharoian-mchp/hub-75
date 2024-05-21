// fb_test2.c
// MUST BE RUN FROM SUDO ./A.OUT
//

// THIS IS THE BASE ADDRESS OF THE CAPE
#define CAPE_BASE 0x41100000

#include <stdio.h>
#include <stdlib.h>
#include <fcntl.h>
#include <sys/mman.h>
#include <unistd.h>

#define PAGE_SIZE (4*1024)
#define BLOCK_SIZE (256*1024)

int  mem_fd;    // used only in setup_io
void *cape_map; // used only in setup_io
volatile unsigned *cape_starting_addr; // set in setup_io

void setup_io();

int main(int argc, char **argv)
{
    int x, y;
    
    // Set up gpi pointer for direct register access
    setup_io();

    // zero all the ram
    for(y = 0; y < 64; y++) {
        for(x = 0; x < 512; x++) {
            cape_starting_addr[x + (y * 512)] = 0x00000000;
        }
    }
  return 0;
}

// ============================================================================

// Set up CAPE memory region
void setup_io()
{
  /* open /dev/mem */
  if ((mem_fd = open("/dev/mem", O_RDWR|O_SYNC) ) < 0) {
    printf("Error. Could not open /dev/mem. Try running with 'sudo'. \n");
    exit(-1);
  }

  /* mmap cape */
  cape_map = mmap(
    NULL,             //Any adddress in our space will do
    BLOCK_SIZE,       //Map length
    PROT_READ|PROT_WRITE,// Enable reading & writing to mapped memory
    MAP_SHARED,       //Shared with other processes
    mem_fd,           //File to map
    CAPE_BASE         //Offset to CAPE peripheral
  );

  close(mem_fd); //No need to keep mem_fd open after mmap
   if (cape_map == MAP_FAILED) {
     printf("mmap error\n"); 
     exit(-1);
  }

  // Always use volatile pointer!
  cape_starting_addr = (volatile unsigned *)cape_map;
} 
