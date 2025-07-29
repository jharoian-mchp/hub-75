#!/bin/bash
sudo apt-get -y update && sudo apt-get -y upgrade

sudo apt-get -y install libsdl2-dev libsdl2-image-2.0-0 libsdl2-image-dev \
                        meson libavl1t64 ffmpeg mplayer cmake

mkdir -p /home/beagle/Projects
cd /home/beagle/Projects

git clone https://github.com/DirectFB2/DirectFB2.git
git clone https://github.com/DirectFB2/DirectFB-examples.git
git clone https://github.com/DirectFB2/DirectFB2-tools.git
#git clone https://github.com/libsdl-org/SDL.git

cd DirectFB2
meson setup build
sudo meson install -C build
sudo ldconfig
cd ..

cd DirectFB-examples
meson setup build
sudo meson install -C build
cd ..

cd DirectFB2-tools
meson setup build
sudo meson install -C build
cd ..

#cd SDL
#mkdir build
#cd build
#cmake ..
#make 
#sudo make install
sudo ldconfig

cd /home/beagle/
