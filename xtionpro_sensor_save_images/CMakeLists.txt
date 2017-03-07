# project
SET(PROJECT_NAME xtionpro_sensor_save_images)
PROJECT(${PROJECT_NAME} CXX C)
CMAKE_MINIMUM_REQUIRED(VERSION 2.8.3)
SET(OpenCV_DIR /home/icsl-rover-01/Documents/xtionpro_install/opencv-2.4.9/build/)
SET(Boost_USE_MULTITHREADED ON)


# Add plain cmake packages
FIND_PACKAGE(OpenCV REQUIRED core highgui imgproc video)
FIND_PACKAGE(Boost COMPONENTS system filesystem thread REQUIRED)


# Include dirs
INCLUDE_DIRECTORIES(
  include
  ${OpenCV_INCLUDE_DIRS}
  ${Boost_INCLUDE_DIRS}
)


# Set link libraries
LIST(APPEND LINK_LIBS
  ${OpenCV_LIBS}
  ${Boost_LIBRARIES}
)


# Set sourcefiles
LIST(APPEND SOURCEFILES
     src/main_script.cpp)


# Set build flags, set ARM_ARCHITECTURE environment variable on Odroid
set(CMAKE_CXX_FLAGS "-msse3")
set(CMAKE_BUILD_TYPE Release) # Release, RelWithDebInfo
set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -std=c++11")
set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -m64 -Ofast -flto -march=native")


################################################################################
# TESTS


ADD_EXECUTABLE(xtionpro_sensor_save_images ${SOURCEFILES})
TARGET_LINK_LIBRARIES(xtionpro_sensor_save_images ${LINK_LIBS})
