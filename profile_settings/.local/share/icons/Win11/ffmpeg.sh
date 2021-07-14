#!/bin/bash

#YASM Assembler
echo "Installing the YASM Assembler"
sudo apt-get install -y yasm

echo "Compiling and Installing FFmpeg Codecs"

#x264 Codec
cd ~/ffmpeg_sources
wget http://download.videolan.org/pub/x264/snapshots/last_x264.tar.bz2
tar xjvf last_x264.tar.bz2
cd x264-snapshot*
PATH="$PATH:$HOME/bin" ./configure --prefix="$HOME/ffmpeg_build" --bindir="$HOME/bin" --enable-static **--disable-opencl**
PATH="$PATH:$HOME/bin" make
make install
make distclean
#AAC Codec
echo "Libfdk-aac Codec"
cd ~/ffmpeg_sources
cd fdk-aac
make
make install
make clean
make distclean
#Libmp3lame Codec 
echo "Libmp3lame Codec"
sudo apt-get install -y libmp3lame-dev

#Libopus Codec
echo "Libopus Codec"
sudo apt-get install -y libopus-dev

# FFmpeg Suite
echo "Compiling and installing the FFmpeg Suite"
cd ~/ffmpeg_sources
cd ffmpeg

PATH="$HOME/bin:$PATH" ./configure \
  --enable-static --disable-opencl
  --pkg-config-flags="--static" \
  --extra-cflags="-fPIC -I $HOME/ffmpeg_build/include" \
  --extra-ldflags="-L $HOME/ffmpeg_build/lib" \
  --enable-gpl \
  --enable-libass \
  --enable-libfdk-aac \
  --enable-libfreetype \
  --enable-libmp3lame \
  --enable-libopus \
  --enable-libtheora \
  --enable-libvorbis \
  --enable-libvpx \
  --enable-libx264 \
  --enable-nonfree \
  --enable-pic \
  --extra-ldexeflags=-pie \
  --enable-shared

PATH="$HOME/bin:$PATH" make -j2
sudo make install
sudo make distclean
hash -r

#Update Shared Library Cache
echo "Updating Shared Library Cache"
sudo ldconfig

echo "FFmpeg and Codec Installation Complete"


