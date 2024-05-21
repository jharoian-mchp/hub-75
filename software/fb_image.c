// fb_image.c
// MUST BE RUN FROM SUDO ./A.OUT
//

// THIS IS THE BASE ADDRESS OF THE CAPE
#define CAPE_BASE 0x41100000

#include <SDL2/SDL.h>
#include <SDL2/SDL_image.h>
#include <stdio.h>
#include <stdlib.h>
#include <fcntl.h>
#include <sys/mman.h>
#include <unistd.h>

#define BLOCK_SIZE (256*1024)

int  mem_fd;    // used only in setup_io
void *cape_map; // used only in setup_io
volatile unsigned *cape_starting_addr; // set in setup_io

void setup_io();

int main(int argc, char **argv)
{
  FILE *file;
  const char *filename;
  int *array;
  uint32_t *pixel_array;
  uint32_t pixel;
  size_t num_elements;
  int x, y;

  if (argc != 2) {
      fprintf(stderr, "Usage: %s <filename>\n", argv[0]);
      return EXIT_FAILURE;
  }

  // Set up gpi pointer for direct register access
  setup_io();

  const char *input_image = argv[1];

  if (SDL_Init(SDL_INIT_VIDEO) != 0) {
    fprintf(stderr, "SDL_Init Error: %s\n", SDL_GetError());
    return EXIT_FAILURE;
  }

  if (IMG_Init(IMG_INIT_JPG | IMG_INIT_PNG) == 0) {
    fprintf(stderr, "IMG_Init Error: %s\n", IMG_GetError());
    return EXIT_FAILURE;
  }

  SDL_Surface *image = IMG_Load(input_image);
  if (!image) {
    fprintf(stderr, "IMG_Load Error: %s\n", IMG_GetError());
    SDL_Quit();
    return EXIT_FAILURE;
  }

  // Convert the surface to 32-bit ABGR format
  SDL_Surface *converted_image = SDL_ConvertSurfaceFormat(image, SDL_PIXELFORMAT_ABGR8888, 0);
  if (!converted_image) {
      fprintf(stderr, "SDL_ConvertSurfaceFormat Error: %s\n", SDL_GetError());
      SDL_FreeSurface(image);
      IMG_Quit();
      SDL_Quit();
      return EXIT_FAILURE;
  }

  int bpp = converted_image->format->BytesPerPixel; // this should be 4
  pixel_array = (uint32_t*) converted_image->pixels;

  for(y = 0; y < 64; y++) {
      for(x = 0; x < 64; x++) {
        pixel = pixel_array[x + (y * 64)];
        cape_starting_addr[x + (y * 512)] = pixel;
      }
  }

  SDL_FreeSurface(converted_image);
  SDL_FreeSurface(image);
  IMG_Quit();
  SDL_Quit();

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

