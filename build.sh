
# cmake ../my/project \
#   -DCMAKE_TOOLCHAIN_FILE=C:/vcpkg/scripts/buildsystems/vcpkg.cmake \
#   -DVCPKG_CHAINLOAD_TOOLCHAIN_FILE=../my/project/compiler-settings-toolchain.cmake

cmake . -DAUTO_VCPKG_ROOT=/w/vcpkg -DCMAKE_TOOLCHAIN_FILE=${AUTO_VCPKG_ROOT}/scripts/buildsystems/vcpkg.cmake -DVCPKG_CHAINLOAD_TOOLCHAIN_FILE=./MyWSLToolchain.cmake
