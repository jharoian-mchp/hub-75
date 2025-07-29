progs := cgol_cube fb_cls fb_dumpreg fb_image fb_simpleimage

all: $(progs)
$(progs): % : %.o
	gcc -o $@ $< -lSDL2 -lSDL2_image

clean:
	rm -rf $(progs) *.o

install:
	cp $(progs) /usr/local/bin
