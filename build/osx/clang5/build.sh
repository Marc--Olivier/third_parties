CURRENT_DIR=`pwd`
INSTALL_DIR=$CURRENT_DIR/install
BUILD_AUX_DIR=$CURRENT_DIR/build_aux
ROOT_DIR=$CURRENT_DIR/../../..
SRC_DIR=$ROOT_DIR/src

mkdir -p $INSTALL_DIR
mkdir -p $BUILD_AUX_DIR

# boost
# http://www.boost.org/doc/libs/1_64_0/more/getting_started/unix-variants.html
cd $SRC_DIR/boost
# mkdir -p $BUILD_AUX_DIR/boost_bootstrap
# ./bootstrap.sh --prefix=$BUILD_AUX_DIR/boost_bootstrap 
./bootstrap.sh
./b2 headers # https://marc.info/?l=boost-users&m=141745580221500&w=2
./b2 link=shared cxxflags=-std=c++1z --build-type=minimal --build-dir=$BUILD_AUX_DIR/boost --prefix=$INSTALL_DIR install headers

cd $BUILD_AUX_DIR
cmake -G "CodeBlocks - Ninja" -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=$INSTALL_DIR -DCMAKE_CXX_FLAGS="-std=c++1z" $SRC_DIR
ninja
ninja install
