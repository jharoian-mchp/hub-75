// fb_image.c
// MUST BE RUN FROM SUDO ./A.OUT
//

// THIS IS THE BASE ADDRESS OF THE CAPE
#define CAPE_BASE 0x41100000

#include <SDL2/SDL.h>
#include <SDL2/SDL_image.h>
#include <stdio.h>
#include <stdlib.h>
#include <argp.h>
#include <fcntl.h>
#include <sys/mman.h>
#include <unistd.h>

#define BLOCK_SIZE (256*1024)

int  mem_fd;    // used only in setup_io
void *cape_map; // used only in setup_io
volatile unsigned *cape_starting_addr; // set in setup_io

struct arguments {
  char *s_input_file;
  int screen_num;
};

static struct argp_option options[] = {
  {"screen", 's', "SCREEN", 0, "Write the image to the specified screen [0-7], default is 1"},
  {"file", 'f', "FILE", 0, "Input file"},
  {0}
};

static error_t parse_opt(int key, char *arg, struct argp_state *state)
{
  struct arguments *arguments = state->input;

  switch (key) {
    case 's':
      arguments->screen_num = atoi(arg);
      if (arguments->screen_num < 0 || arguments->screen_num > 7) {
        argp_failure(state, 1, 0, "Screen number must be between 0 and 7");
      }
      break;
    case 'f':
      arguments->s_input_file = arg;
      break;
    case ARGP_KEY_ARG:
      if (arguments->s_input_file != NULL) {
        argp_failure(state, 1, 0, "Filename specified multiple times");
      }
      arguments->s_input_file = arg;
      break;
    case ARGP_KEY_END:
      if (arguments->s_input_file == NULL) {
        argp_failure(state, 1, 0, "Input filename not specified");
      }
      break;
    default:
      return ARGP_ERR_UNKNOWN;
  }
  return 0;
}

static struct argp argp = {options, parse_opt, 0, 0};

void setup_io();

int main(int argc, char **argv)
{
  uint32_t *pixel_array;
  uint32_t pixel;
  int x, y, x_offset;
  struct arguments arguments;
  arguments.s_input_file = NULL;
  arguments.screen_num = 0;

  // Set up gpi pointer for direct register access
  setup_io();

  argp_parse(&argp, argc, argv, 0, 0, &arguments);
  if (arguments.s_input_file == NULL) {
    return EXIT_FAILURE;
  }

  x_offset = arguments.screen_num * 64;

  if (SDL_Init(SDL_INIT_VIDEO) != 0) {
    fprintf(stderr, "SDL_Init Error: %s\n", SDL_GetError());
    return EXIT_FAILURE;
  }

  if (IMG_Init(IMG_INIT_JPG | IMG_INIT_PNG) == 0) {
    fprintf(stderr, "IMG_Init Error: %s\n", IMG_GetError());
    return EXIT_FAILURE;
  }

  SDL_Surface *image = IMG_Load(arguments.s_input_file);
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
        cape_starting_addr[x + (y * 512) + x_offset] = pixel;
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

