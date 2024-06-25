cmake_minimum_required(VERSION 3.15)

set(OHOS_STL "c++_shared")
# set(OHOS_ARCH "")
set(OHOS_PLATFORM "OHOS")
# set(CMAKE_TOOLCHAIN_FILE "")

include("${CMAKE_CURRENT_SOURCE_DIR}/../cxx/quickjs-ohos.cmake")

set(PROJECT_NAME "flutter_js")
project(${PROJECT_NAME} LANGUAGES CXX)
set(CMAKE_SHARED_LIBRARY_SUFFIX ".so")

set(PLUGIN_NAME "quickjs_c_bridge")

set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -std=c++17 -DANDROID_STL=c++_static -DDEBUGGER_SERVER_PORT=${DEBUGGER_SERVER_PORT}")
#set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -Wno-error=incompatible-pointer-types-discards-qualifiers")
set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -Wno-int-conversion")
set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -Wno-unused-variable")
set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -Wno-unused-but-set-variable")
set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -Wno-maybe-uninitialized")

add_library(${PLUGIN_NAME} SHARED
  "${CXX_LIB_DIR}/libfastdev_quickjs_runtime.cpp"
)
target_compile_options("${PLUGIN_NAME}" PRIVATE "-fPIC")
target_compile_features(${PLUGIN_NAME} PUBLIC cxx_std_17)
set_target_properties(${PLUGIN_NAME} PROPERTIES
  CXX_VISIBILITY_PRESET hidden
)

target_link_libraries(${PLUGIN_NAME} PRIVATE quickjs)

set(flutter_js_bundled_libraries
  ""
  PARENT_SCOPE
)
