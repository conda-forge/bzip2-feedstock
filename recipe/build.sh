#!/bin/sh

# toolchain flags + bzip flags + fpic
export CFLAGS="${CFLAGS} -Wall -Winline -O2 -g -D_FILE_OFFSET_BITS=64 -fPIC"

make install PREFIX=${PREFIX} CFLAGS="$CFLAGS"

# build shared library
make -f Makefile-libbz2_so CFLAGS="$CFLAGS"
ln -s libbz2.so.${PKG_VERSION} libbz2.so
cp -d libbz2.so* $PREFIX/lib/
