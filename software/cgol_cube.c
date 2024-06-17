#include <stdio.h>
#include <SDL2/SDL.h>

#define WIDTH   320
#define HEIGHT  64

uint32_t palette[256];

uint32_t pack_color(uint8_t a, uint8_t r, uint8_t g, uint8_t b)
{
    return (a << 24) | (r << 16) | (g << 8) | b;
}

void interpolate_colors(int start_index, uint8_t start_r, uint8_t start_g, uint8_t start_b,
            uint8_t end_r, uint8_t end_g, uint8_t end_b, int steps)
{
    for(int t = 0; t < steps; ++t) {
        uint8_t r = start_r + (end_r - start_r) * t / (steps - 1);
        uint8_t g = start_g + (end_g - start_g) * t / (steps - 1);
        uint8_t b = start_b + (end_b - start_b) * t / (steps - 1);
        uint8_t a = 255; // Alpha channel is always 255 (opaque)
        palette[start_index + t] = pack_color(a, r, g, b);
    }
}

void initialize_grid(uint8_t *grid)
{
    memset(grid, 0, WIDTH * HEIGHT * sizeof(uint8_t));

    for(int y = 0; y < HEIGHT; y++) {
        for(int x = 0; x < WIDTH; x++) {
            if (rand() % 2) {
                *(grid + x + (y * WIDTH)) = 255;
            } 
        }
    }
}

int count_neighbors(uint8_t *grid, int x, int y)
{
    int count = 0;
    int nx, ny;

    // when counting neighbors we have to account for the wrap arounds and movement 
    // to the top panel...
    for(int dy = -1; dy <= 1; dy++) {
        for(int dx= -1; dx <= 1; dx++) {
            if (dx == 0 && dy == 0) 
                continue;

            nx = x + dx;
            ny = y + dy;

            // calculate the new coordinate based upon edge wraps
            // remembering that the sides are actually treated like a rectangle 320x64

            if (x < 256) {
                // this is on one of the sides check for edge wrap 0<->3
                if (nx == -1) {
                    nx = 255;
                } else if (nx == 256) {
                    nx = 0;
                }

                // check for wrapping to the top
                if (ny == -1) {
                    // transform edge coordinates to top based upon which side this is
                    switch (x / 64) {
                        case 0: // 0 ^ 4
                            nx = nx + 256;
                            ny = 63;
                            break;
                        case 1: // 1 ^ 4
                            ny = 63 - (nx - 64);
                            nx = 319;
                            break;
                        case 2: // 2 ^ 4
                            nx = 319 - (nx - 128);
                            ny = 0;
                            break;
                        case 3: // 3 ^ 4
                            ny = nx - 192;
                            nx = 256;
                            break;
                        default:
                            break;
                    }
                }
            } else {
                // these coordinates are on panel 4 (top)
                if (nx == 255) {
                    // 4 v 3
                    nx = ny + 192;
                    ny = 0;
                } else if (nx == 320) {
                    // 4 v 1
                    nx = (63 - ny) + 64;
                    ny = 0;
                }

                if (ny == -1) {
                    // 4 v 2
                    nx = (319 - nx) + 128;
                    ny = 0;
                } else if (ny == 64) {
                    // 4 v 0
                    nx = nx - 256;
                    ny = 0;
                }
            }

            if (nx >= 0 && nx < WIDTH && ny >= 0 && ny < HEIGHT && *(grid + nx + (ny * WIDTH)) > 0) {
                count++;
            }
        }
    }

    return count;
}

int update_grid(uint8_t *grid)
{
    int neighbors;
    uint8_t new_grid[HEIGHT][WIDTH];

    memset(new_grid, 0, sizeof(new_grid));

    for(int y = 0; y < HEIGHT; y++) {
        for(int x = 0; x < WIDTH; x++) {
            neighbors = count_neighbors(grid, x, y);
            if (*(grid + x + (y * WIDTH)) > 0) {
                if ((neighbors == 2) || (neighbors == 3)) 
                    new_grid[y][x] = 1;
                else
                    new_grid[y][x] = 0;
            } else {
                if (neighbors == 3) 
                    new_grid[y][x] = 1;
                else
                    new_grid[y][x] = 0;
            }
        }
    }

    // copy the new grid to the old, updating lifetimes
    int total_cells = 0;
    uint8_t current_value, new_value;
    for(int y = 0; y < HEIGHT; y++) {
        for(int x = 0; x < WIDTH; x++) {
            current_value = *(grid + x + (y * WIDTH));

            if (new_grid[y][x] == 1) {
                // cell currently alive or newly alive
                if (current_value > 0) {
                    new_value = (current_value > 8) ? current_value - 1 : 8;
                } else {
                    new_value = 255;
                }

                total_cells++;
            } else {
                // cell is now dead
                new_value = 0;
            }

            // write it into the current cell
            *(grid + x + (y * WIDTH)) = new_value;
        }
    }

    return total_cells;
}


int main()
{
    int previousCellCount0, previousCellCount1; // record last two readings
    int staticCellCount = 0;
    uint8_t grid[HEIGHT][WIDTH] = {0};

    if (SDL_Init(SDL_INIT_VIDEO) != 0) {
        fprintf(stderr, "Could not init SDL: %s\n", SDL_GetError());
        return 1;
    }   

    SDL_Window *screen = SDL_CreateWindow("My Application", 
        SDL_WINDOWPOS_UNDEFINED,
        SDL_WINDOWPOS_UNDEFINED,
        320, 64, SDL_WINDOW_SHOWN | SDL_WINDOW_BORDERLESS | SDL_WINDOW_FULLSCREEN);

    if (!screen) {
        fprintf(stderr, "Could not create window\n");
        return 1;
    }

    SDL_Renderer *renderer = SDL_CreateRenderer(screen, -1, SDL_RENDERER_SOFTWARE);
    if (!renderer) {
        fprintf(stderr, "Could not create renderer\n");
        return 1;
    }

    SDL_Texture *sdlTexture = SDL_CreateTexture(renderer, SDL_PIXELFORMAT_ABGR8888,
                                SDL_TEXTUREACCESS_STREAMING, 320, 64);             

    uint8_t start_r1 = 8, start_g1 = 0, start_b1 = 0; 
    uint8_t end_r1 = 192, end_g1 = 96, end_b1 = 96;   
    uint8_t start_r2 = 192, start_g2 = 96, start_b2 = 96;        
    uint8_t end_r2 = 255, end_g2 = 255, end_b2 = 255;       

    interpolate_colors(0, start_r1, start_g1, start_b1, end_r1, end_g1, end_b1, 128);
    interpolate_colors(128, start_r2, start_g2, start_b2, end_r2, end_g2, end_b2, 128);

    uint32_t screenBuffer[HEIGHT][WIDTH];
    int total_cells = 0;

    initialize_grid(&grid[0][0]);
    SDL_SetRenderDrawColor(renderer, 0, 0, 0, 255);
    SDL_SetTextureBlendMode(sdlTexture, SDL_BLENDMODE_NONE);

    SDL_Rect sdlRect;
    sdlRect.x = 0;
    sdlRect.y = 0;
    sdlRect.w = WIDTH;
    sdlRect.h = HEIGHT;

    previousCellCount0 = 0;
    previousCellCount1 = 0;

    uint32_t pixel;
    uint8_t bPart;
    do
    {
        // copy the grid to the screenBuffer
        for(int y = 0; y < HEIGHT; y++) {
            for(int x = 0; x < WIDTH; x++) {
                bPart = grid[y][x];

                if (bPart > 0)
                    pixel = palette[bPart]; // 0xFF000000 | (bPart << 16) | (bPart << 8) | bPart;
                else
                    pixel = 0xFF000000;  

                screenBuffer[y][x] = pixel;
            }
        }

        SDL_RenderClear(renderer);
        SDL_UpdateTexture(sdlTexture, &sdlRect, screenBuffer, WIDTH * sizeof(uint32_t));

        SDL_RenderCopy(renderer, sdlTexture, NULL, NULL);
        SDL_RenderPresent(renderer);
        SDL_Delay(50);
   
        total_cells = update_grid(&grid[0][0]);

        // check last two readings in case of oscillations at end
        if ((total_cells == previousCellCount0) || (total_cells == previousCellCount1)) {
            staticCellCount++;
        } else {
            staticCellCount = 0;
        }

        // record the current cell counts
        previousCellCount1 = previousCellCount0;
        previousCellCount0 = total_cells;
    } while (staticCellCount < 50);         

    SDL_DestroyWindow(screen);
    SDL_Quit();
    return 0;
}
