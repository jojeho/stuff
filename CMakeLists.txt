cmake_minimum_required(VERSION 2.8)

set(CMAKE_CXX_COMPILER /usr/bin/c++)
set(CMAKE_CXX_FLAGS ${CMAKE_CSS_FLAGS} "-fPIC")

##########################################
############## compile  option ###########
##########################################
ADD_DEFINITIONS("-std=c++1y")

set(CMAKE_THREAD_PREFER_PTHREAD TRUE)
find_package(Threads REQUIRED)
if(CMAKE_USE_PTHREADS_INIT)
  set(CMAKE_C_FLAGS ${CMAKE_C_FLAGS} "-lpthread")
endif()

##### disable specific warning
ADD_DEFINITIONS("-Wno-redeclared-class-member")
ADD_DEFINITIONS("-Wno-deprecated")

###### inhibit all warning
ADD_DEFINITIONS("-w")


##########################################
############ setting this project ########
##########################################

set(DEV_DIR "/home/jojeho/dev")
include_directories("${PRJ_ROOT_DIR}/")
include_directories("${DEV_DIR}/prj2/jeho/src/")
include_directories("${DEV_DIR}/src/boost_1_61_0/")
include_directories("usr/include/")

include_directories("${DEV_DIR}/prj2/sv2/app/src/")

link_directories("${DEV_DIR}/src/boost_1_61_0/stage/lib")
LINK_LIBRARIES(boost_system)	

#################### add sub directory ########
##############################################

add_subdirectory(src)


