@echo off
SETLOCAL enabledelayedexpansion

SET scriptLocation=%~dp0
cd /d "%scriptLocation%"

echo NOTE! Be sure to use "setx" to set VCPKG_DEFAULT_TRIPLET to your preferred Triplet, likely "x64-windows"

set ROOT_DIR=%CD%

set ROOT_DIR_FOR_CMAKE=%ROOT_DIR:\=/%

cd /d "%ROOT_DIR%"
if not exist "%ROOT_DIR%\build-dir" mkdir "%ROOT_DIR%\build-dir"
if not exist "%ROOT_DIR%\build-dir\windows" mkdir "%ROOT_DIR%\build-dir\windows"
if not exist "%ROOT_DIR%\build-dir\windows\cmake" mkdir "%ROOT_DIR%\build-dir\windows\cmake"

set CMAKE_DIR=%ROOT_DIR_FOR_CMAKE%/build-dir/windows/cmake

cd /d "%CMAKE_DIR%"

for /f %%i in ('where vcpkg.exe') do set VCPKG_ROOT=%%~dpi

if "%VisualStudioVersion%" == "" echo Setting up build environment. && call "C:\Program Files (x86)\Microsoft Visual Studio\2019\Professional\VC\Auxiliary\Build\vcvarsall.bat" x64 -vcvars_ver=14.22

call CMake -G "Visual Studio 16 2019" %ROOT_DIR% -DAUTO_VCPKG_ROOT=%VCPKG_ROOT% -DVCPKG_TEST_ROOT=%ROOT_DIR% -DCMAKE_TOOLCHAIN_FILE=%VCPKG_ROOT%/scripts/buildsystems/vcpkg.cmake -DVCPKG_CHAINLOAD_TOOLCHAIN_FILE=%ROOT_DIR%/MyWindowsToolchain.cmake && call msbuild .\vcpkg_test.sln /p:platform=x64 /t:build /maxcpucount /nodeReuse:True /nologo /verbosity:minimal && .\Debug\vcpkg_test.exe
