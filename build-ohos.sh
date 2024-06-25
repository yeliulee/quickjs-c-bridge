#!/bin/bash

# Set your specific paths and variables here
OHOS_TOOLCHAIN="CUSTOM_PATH_TO_OHOS_TOOLCHAIN_FILE"
OHOS_ARCH="arm64-v8a"

# clear previous build
if [ -d "./build/ohos" ]; then
  rm -rf ./build/ohos
fi

cmake \
  -DCMAKE_TOOLCHAIN_FILE="${OHOS_TOOLCHAIN}" \
  -DOHOS_ARCH="${OHOS_ARCH}" \
  -S ./ohos -B ./build/ohos

# Build the project
cmake --build ./build/ohos

echo "build result located at ./build/ohos/libquickjs_c_bridge.so"