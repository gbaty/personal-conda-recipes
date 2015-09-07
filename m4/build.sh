#!/bin/sh

./configure --prefix=$PREFIX --infodir=$PREFIX/share/info --mandir=$PREFIX/share/man
make
make install

mkdir -p $PREFIX/etc/conda/activate.d
mkdir -p $PREFIX/etc/conda/deactivate.d

cp $RECIPE_DIR/activate.sh $PREFIX/etc/conda/activate.d/m4.sh
cp $RECIPE_DIR/deactivate.sh $PREFIX/etc/conda/deactivate.d/m4.sh

