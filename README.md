# AVR example project with CMake 

This is an example for setting up a C(++) project with AVR-GCC and CMake as
build system. It outlines a simple project structure and provides the build
scripts to get started quickly.

## Requirements

* CMake >3.9 (perhaps any CMake 3.x)
* GNU Make
* AVR-GCC

## Demo application
The generated demo application is a simple *blink* program, making an LED flash. It
targets an Arduino UNO (ATmega328p) and blinks the LED at digital pin 13 (PB5).

## Usage

### Setup
Modify the `AVR_ROOT` environment variable in the sourcing script to point to
your local avr-gcc installation folder.

### Usage

```shell
# run cmake: it generates the necessary makefiles in build\
make cmake
# build the project
make
# upload the 
make flash
```

You will probably need to update the COM port in the `Makefile` in order to
successfully flash, or run `make flash PORT=COMx` to override the PORT in the
script. 

Update `Makefile` and `CMakeLists.txt` to target you platform and programmer.

The root folder has two kind of build scripts:
1) `CMakeLists.txt` : Contains the instructions for building
2) a `Makefile` for convenience. It contains:
	- A command to run the CMake script.		`make cmake`
	- A command to program the microcontroller	`make flash`
	- Passes all other commands to the CMake-generated `build/Makefile`
		* Run `make help` to see available commands in that Makefile

Aside from these files, there is also a pure `make` flow, described by
`Makefile.manual.version`. It does not rely on `CMake`.
I built this an exercise and to better understand to build flow.

## CMake Toolchain
The project relies on a submodule containing the CMake AVR Toolchain. It is
separated in a different repo because it will possibly undergo many iterations.

## Linting configuration

The CMake build script generates a `conpilation_database.json` under `build/`.
IDEs and Vim plugins (like e.g. ALE) can use this to analyse your code.

`.clangd` is a YAML configuration file for `clangd`. It's purpose is to tell
`clangd` where to find the AVR system headers.

## Special Thanks
Natesh Narain for making the CMake AVR toolchain, which was an excellent starting
point.

