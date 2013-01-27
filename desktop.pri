# OS-dependent variables

win32 {
DEFINES += _WIN32_WINNT=0x0501
DEFINES += WINVER=0x0501
}

# Subprojects names

UTIL_PROJ = util
TESTS_HELPER_PROJ = tests-helper
CONSOLE_PROJ = console
FILE_PROJ = file
NETWORK_PROJ = network

SERVER_EMULATOR_PROJ = server-emulator

DEVICE_LINK_PROJ = device-link
DEVICE_LINK_DEBUGGER_PROJ = debugger

# Targets

CORE_TARGET = Core
APP_TARGET = Application
TEST_TARGET = Test

TESTS_HELPER_TARGET = TestsHelper
CONSOLE_TARGET = Console

FILE_TARGET = File
FILE_TEST_TARGET = $${FILE_TARGET}$$TEST_TARGET

NETWORK_TARGET = Network
NETWORK_TEST_TARGET = $${NETWORK_TARGET}$$TEST_TARGET

SERVER_EMULATOR_TARGET = ServerEmulator
SERVER_EMULATOR_CORE_TARGET = $${SERVER_EMULATOR_TARGET}$$CORE_TARGET
SERVER_EMULATOR_CORE_TEST_TARGET = $${SERVER_EMULATOR_CORE_TARGET}$$TEST_TARGET

SERVER_EMULATOR_APP_TARGET = $${SERVER_EMULATOR_TARGET}$$APP_TARGET
SERVER_EMULATOR_APP_TEST_TARGET = $${SERVER_EMULATOR_APP_TARGET}$$TEST_TARGET

DEVICE_LINK_TARGET = DeviceLink
DEVICE_LINK_DEBUGGER_APP_TARGET = $${DEVICE_LINK_TARGET}Debugger

# Project structure helpers

SRC_DIR = src
BIN_DIR = bin
TARGET_DIR = target
TESTS_DIR = tests
CORE_DIR = core
APP_DIR = app

# Paths

ROOT_DIR = $$PWD
ROOT_BIN_DIR = $$ROOT_DIR/$$BIN_DIR

APP_BIN_DIR = $$ROOT_BIN_DIR/$$APP_DIR

## util

UTIL_DIR = $$ROOT_DIR/$$UTIL_PROJ
UTIL_BIN_DIR = $$ROOT_BIN_DIR/$$UTIL_PROJ

### tests-helper

TESTS_HELPER_ROOT_DIR = $$UTIL_DIR/$$TESTS_HELPER_PROJ
TESTS_HELPER_BIN_ROOT_DIR = $$UTIL_BIN_DIR/$$TESTS_HELPER_PROJ

TESTS_HELPER_INCL_DIR = $$TESTS_HELPER_ROOT_DIR/$$SRC_DIR
TESTS_HELPER_BIN_DIR = $$TESTS_HELPER_BIN_ROOT_DIR/$$TARGET_DIR

TESTS_HELPER_LD = -L$$TESTS_HELPER_BIN_DIR -l$$TESTS_HELPER_TARGET

### console

CONSOLE_ROOT_DIR = $$UTIL_DIR/$$CONSOLE_PROJ
CONSOLE_BIN_ROOT_DIR = $$UTIL_BIN_DIR/$$CONSOLE_PROJ

CONSOLE_INCL_DIR = $$CONSOLE_ROOT_DIR/$$SRC_DIR
CONSOLE_BIN_DIR = $$CONSOLE_BIN_ROOT_DIR/$$TARGET_DIR

CONSOLE_LD = -L$$CONSOLE_BIN_DIR -l$$CONSOLE_TARGET

### file

FILE_ROOT_DIR = $$UTIL_DIR/$$FILE_PROJ
FILE_BIN_ROOT_DIR = $$UTIL_BIN_DIR/$$FILE_PROJ

FILE_INCL_DIR = $$FILE_ROOT_DIR/$$SRC_DIR
FILE_BIN_DIR = $$FILE_BIN_ROOT_DIR/$$TARGET_DIR
FILE_TEST_BIN_DIR = $$FILE_BIN_ROOT_DIR/$$TESTS_DIR

FILE_LD = -L$$FILE_BIN_DIR -l$$FILE_TARGET

### network

NETWORK_ROOT_DIR = $$UTIL_DIR/$$NETWORK_PROJ
NETWORK_BIN_ROOT_DIR = $$UTIL_BIN_DIR/$$NETWORK_PROJ

NETWORK_INCL_DIR = $$NETWORK_ROOT_DIR/$$SRC_DIR
NETWORK_BIN_DIR = $$NETWORK_BIN_ROOT_DIR/$$TARGET_DIR
NETWORK_TEST_BIN_DIR = $$NETWORK_BIN_ROOT_DIR/$$TESTS_DIR

unix:NETWORK_DEPS  = -L/usr/lib -lboost_system -lboost_thread
win32:NETWORK_DEPS = -lboost_system-mgw44-mt-1_52 \
    -lboost_thread-mgw44-mt-1_52 -lws2_32 -lmswsock

NETWORK_LD = -L$$NETWORK_BIN_DIR -l$$NETWORK_TARGET $$NETWORK_DEPS

## server-emulator

SERVER_EMULATOR_DIR = $$ROOT_DIR/$$SERVER_EMULATOR_PROJ
SERVER_EMULATOR_BIN_DIR = $$ROOT_BIN_DIR/$$SERVER_EMULATOR_PROJ

### server-emulator core

SERVER_EMULATOR_CORE_ROOT_DIR = $$SERVER_EMULATOR_DIR/$$CORE_DIR
SERVER_EMULATOR_CORE_BIN_ROOT_DIR = $$SERVER_EMULATOR_BIN_DIR/$$CORE_DIR

SERVER_EMULATOR_CORE_INCL_DIR = $$SERVER_EMULATOR_CORE_ROOT_DIR/$$SRC_DIR $$NETWORK_INCL_DIR
SERVER_EMULATOR_CORE_BIN_DIR = $$SERVER_EMULATOR_CORE_BIN_ROOT_DIR/$$TARGET_DIR
SERVER_EMULATOR_CORE_TEST_BIN_DIR = $$SERVER_EMULATOR_CORE_BIN_ROOT_DIR/$$TESTS_DIR

SERVER_EMULATOR_CORE_LD = -L$$SERVER_EMULATOR_CORE_BIN_DIR -l$$SERVER_EMULATOR_CORE_TARGET $$NETWORK_LD

## device-link

DEVICE_LINK_DIR = $$ROOT_DIR/$$DEVICE_LINK_PROJ
DEVICE_LINK_BIN_DIR = $$ROOT_BIN_DIR/$$DEVICE_LINK_PROJ
