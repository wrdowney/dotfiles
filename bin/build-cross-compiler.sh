sudo apt install -y build-essential bison flex libgmp3-dev libmpc-dev libmpfr-dev texinfo 


$GCC_V = gcc_12.2.0
$BINUTILS_V = binutils-2.39

mkdir -p $HOME/src
cd $HOME/src

wget https://ftp.gnu.org/gnu/binutils/binutils-2.39.tar.gz
wget https://ftp.gnu.org/gnu/gcc/gcc-12.2.0/gcc-12.2.0.tar.gz

tar xvf binutils*
tar xvf gcc*


mkdir -p $HOME/opt/cross
export PREFIX="$HOME/opt/cross"
export TARGET=i686-elf
export PATH="$PREFIX/bin:$PATH"

mkdir -p build-binutils
cd build-binutils
../binutils-2.39/configure --target=$TARGET --prefix="$PREFIX" --with-sysroot --disable-nls --disable-werror
make
make install

cd $HOME/src
mkdir build-gcc
cd build-gcc
../gcc-12.2.0/configure --target="$TARGET" --prefix="$PREFIX" --disable-nls --enable-languages=c,c++ --without-headers
make all-gcc
make all-target-libgcc
make install-gcc
make install-target-libgcc

export PATH="$HOME/opt/cross/bin:$PATH"

