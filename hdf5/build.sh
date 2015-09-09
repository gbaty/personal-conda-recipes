#!/bin/bash

./configure --prefix=$PREFIX --enable-linux-lfs --with-zlib=$PREFIX --with-ssl --enable-cxx --enable-static --enable-shared
make
make install

