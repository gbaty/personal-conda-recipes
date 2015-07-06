#!/bin/bash

if [ `uname` == Linux ]; then
    CC=gcc
    CXX=g++
    CMAKE=cmake
    PY_LIB="libpython2.7.so"
fi
if [ `uname` == Darwin ]; then
    CC=cc
    CXX=c++
    CMAKE=$SYS_PREFIX/bin/cmake
    PY_LIB="libpython2.7.dylib"
    export DYLD_LIBRARY_PATH=$PREFIX/lib
fi

mkdir build
cd build
$CMAKE \
    -DCMAKE_INSTALL_PREFIX:PATH="$PREFIX" \
    -DCMAKE_INSTALL_RPATH:STRING="$PREFIX/lib" \
    -DVTK_HAS_FEENABLEEXCEPT:BOOL=OFF \
    -DBUILD_TESTING:BOOL=OFF \
    -DBUILD_EXAMPLES:BOOL=OFF \
    -DBUILD_SHARED_LIBS:BOOL=ON \
    -DPYTHON_EXECUTABLE:FILEPATH=$PYTHON \
    -DPYTHON_INCLUDE_PATH:PATH=$PREFIX/include/python2.7 \
    -DPYTHON_LIBRARY:FILEPATH=$PREFIX/lib/$PY_LIB \
    -DVTK_WRAP_PYTHON:BOOL=ON \
    ..

make -j${CPU_COUNT}
make install

if [ `uname` == Darwin ]; then
    $SYS_PYTHON $RECIPE_DIR/osx.py
fi
