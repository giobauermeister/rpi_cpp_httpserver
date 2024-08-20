# Define the system and toolchain
set(CMAKE_SYSTEM_NAME Linux)
set(CMAKE_SYSTEM_PROCESSOR arm)

set(RPI_GCC_TRIPLE "aarch64-linux-gnu")

# Specify the cross compiler
set(CMAKE_C_COMPILER ${RPI_GCC_TRIPLE}-gcc)
set(CMAKE_CXX_COMPILER ${RPI_GCC_TRIPLE}-g++)

set(RPI_SYSROOT /mnt/rpi-sysroot)

# Specify the location of the target sysroot (optional)
set(CMAKE_SYSROOT ${RPI_SYSROOT})

# Specify the location of the C and C++ standard libraries (optional)
set(CMAKE_FIND_ROOT_PATH ${CMAKE_SYSROOT})

# Specify the include directories and library paths
set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} --sysroot=${CMAKE_SYSROOT}")
include_directories(${CMAKE_SYSROOT}/usr/include ${CMAKE_SYSROOT}/usr/local/include)
link_directories(${CMAKE_SYSROOT}/usr/lib ${CMAKE_SYSROOT}/usr/local/lib)

# Set the rpath to ensure the executable can find the libraries at runtime
set(CMAKE_INSTALL_RPATH_USE_LINK_PATH TRUE)
set(CMAKE_BUILD_WITH_INSTALL_RPATH TRUE)
set(CMAKE_INSTALL_RPATH "/usr/lib;/usr/local/lib")

# Add the httpserver library
set(HTTP_SERVER_LIB httpserver)

# Ensure that only the files inside the sysroot are used
set(CMAKE_FIND_ROOT_PATH_MODE_PROGRAM NEVER)
set(CMAKE_FIND_ROOT_PATH_MODE_LIBRARY ONLY)
set(CMAKE_FIND_ROOT_PATH_MODE_INCLUDE ONLY)
set(CMAKE_FIND_ROOT_PATH_MODE_PACKAGE ONLY)