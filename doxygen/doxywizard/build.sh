#!/bin/bash



mkdir build
cd build

source $PREFIX/etc/conda/activate.d/*.sh

$PREFIX/bin/cmake \
    -DCMAKE_INSTALL_PREFIX:PATH="$PREFIX" \
    -DCMAKE_INSTALL_RPATH:STRING="$PREFIX" \
    -DBUILD_SHARED_LIBS:BOOL=ON \
    -Dbuild_wizard:BOOL=ON \
    ..
    
make -j${CPU_COUNT}
make install

cp -v lib/* $PREFIX/lib/ # Else do not work with BUILD_SHARD_LIBS
# cp -rv include/* $PREFIX/include/
# cp -rv doc/* $PREFIX/doc/

source $PREFIX/etc/conda/deactivate.d/*.sh
