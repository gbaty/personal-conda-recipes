
export CXXFLAGS="-s -O0"

mkdir build
cd build
../configure --prefix=$PREFIX --enable-metis --enable-mpi \
--enable-hdf5 --with-HDF5-lib=$PREFIX/lib --with-HDF5-include=$PREFIX/include \
--enable-zlib --with-ZLIB-lib=$PREFIX/lib --with-ZLIB-include=$PREFIX/include \

make
make install
