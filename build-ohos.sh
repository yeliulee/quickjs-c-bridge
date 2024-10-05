#!/bin/bash

_SCRIPT_DIR=$(cd "$(dirname "$0")" && pwd)

# 使用环境变量和find命令动态查找toolchain文件
if [ -z "$DEVECO_SDK_HOME" ]; then
    echo "Error: DEVECO_SDK_HOME environment variable is not set."
    exit 1
fi

OHOS_TOOLCHAIN=$(find "$DEVECO_SDK_HOME" -path "*/openharmony/*/cmake/ohos.toolchain.cmake" -print -quit)

if [ -z "$OHOS_TOOLCHAIN" ]; then
    echo "Error: Unable to find ohos.toolchain.cmake file."
    exit 1
fi

echo "Using toolchain: $OHOS_TOOLCHAIN"

# Set your specific variables here
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

echo "build result located at:\n $_SCRIPT_DIR/build/ohos/libquickjs_c_bridge.so"