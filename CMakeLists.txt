cmake_minimum_required(VERSION 3.0)

# General note:
# ${} references only local variables <-> gnu MAKE
# message("${AVR_ROOT}")
# this references env variable
# message("$ENV{AVR_ROOT}")

# Disable in-source builds to prevent source tree corruption.
# confusingly, binary_dir is the top of the build tree, which
# contains binaries by default, but does not have too
if(" ${CMAKE_SOURCE_DIR}" STREQUAL " ${CMAKE_BINARY_DIR}")
  message(FATAL_ERROR "
FATAL: In-source builds are not allowed.
       You should create a separate directory for build files.
")
endif()

# intializes for every target the output directory to /bin
set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${CMAKE_SOURCE_DIR}/bin)

set(CMAKE_TOOLCHAIN_FILE "./cmake-avr-toolchain/avr-gcc.toolchain.cmake")

# Generate a compilation database
# only works with GNU make or ninja
set(CMAKE_EXPORT_COMPILE_COMMANDS ON)

project(AVR_test_flow C CXX)

# where to look for headers
include_directories(
	include/
	src/
	)

# Macro used by avr-gcc to define clock speed
add_definitions(-DF_CPU=16000000)

add_avr_executable(${PROJECT_NAME} "atmega328p"
	src/main.cpp
	src/foo.cpp
	)

