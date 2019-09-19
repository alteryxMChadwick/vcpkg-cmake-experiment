
SCRIPTPATH="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
CMAKE_DIR=$SCRIPTPATH/build-dir/linux/cmake

mkdir -p $CMAKE_DIR
cd $CMAKE_DIR

# find vcpkg in $PATH
#   if vcpkg is not in $PATH, then the cmake script will download and install vcpkg
VCPKG_ROOT="$( dirname "$( which vcpkg )" )"

cmake -G "Unix Makefiles" $SCRIPTPATH \
    -DAUTO_VCPKG_ROOT=$VCPKG_ROOT \
    -DVCPKG_TEST_ROOT=$SCRIPTPATH \
    -DCMAKE_TOOLCHAIN_FILE=$VCPKG_ROOT/scripts/buildsystems/vcpkg.cmake \
    -DVCPKG_CHAINLOAD_TOOLCHAIN_FILE=$SCRIPTPATH/MyWSLToolchain.cmake \
    && make && ./vcpkg_test

cd $SCRIPTPATH
