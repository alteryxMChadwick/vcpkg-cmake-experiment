
# cmake ../my/project \
#   -DCMAKE_TOOLCHAIN_FILE=C:/vcpkg/scripts/buildsystems/vcpkg.cmake \
#   -DVCPKG_CHAINLOAD_TOOLCHAIN_FILE=../my/project/compiler-settings-toolchain.cmake

SCRIPTPATH="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
CMAKE_DIR=$SCRIPTPATH/build-dir/linux/cmake

mkdir -p $CMAKE_DIR
cd $CMAKE_DIR

VCPKG_ROOT=/w/vcpkg

cmake -G "Unix Makefiles" $SCRIPTPATH \
    -DAUTO_VCPKG_ROOT=$VCPKG_ROOT \
    -DCMAKE_TOOLCHAIN_FILE=$VCPKG_ROOT/scripts/buildsystems/vcpkg.cmake \
    -DVCPKG_CHAINLOAD_TOOLCHAIN_FILE=$SCRIPTPATH/MyWSLToolchain.cmake

cd $SCRIPTPATH
