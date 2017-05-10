CURRENT_DIR=`pwd`
INSTALL_DIR=$CURRENT_DIR/install
BUILD_AUX_DIR=$CURRENT_DIR/build_aux
ROOT_DIR=$CURRENT_DIR/../..
SRC_DIR=$ROOT_DIR/src

mkdir -p $INSTALL_DIR
mkdir -p $BUILD_AUX_DIR

# See http://www.boost.org/doc/libs/1_62_0/more/getting_started/windows.html
# About c++14 flags: http://stackoverflow.com/questions/23800450/using-boost-with-c14-compiler
# Problems compiling with mingw - https://svn.boost.org/trac/boost/ticket/12533
cd $SRC_DIR/boost
./bootstrap.sh mingw
# ./b2 toolset=gcc link=shared --build-type=complete --build-dir=../../build/mingw53_32/build_aux/boost
./b2 toolset=gcc link=shared cxxflags=-std=c++1z --build-type=minimal --build-dir=$BUILD_AUX_DIR/boost --prefix=$INSTALL_DIR install
#ln -s $INSTALL_DIR/include/boost-1_65/boost $INSTALL_DIR/include/boost
#cmd //C 'mklink /D include2 include'
#cp -Lr $SRC_DIR/boost/boost $INSTALL_DIR/include/boost
mv $INSTALL_DIR/include/boost-1_65/boost $INSTALL_DIR/include/
rm -rf $INSTALL_DIR/include/boost-1_65/
cd -

