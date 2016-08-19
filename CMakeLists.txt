cmake_minimum_required(VERSION 2.6)

project(mm C CXX)
find_package(Threads)
set(CMAKE_MODULE_PATH ${CMAKE_MODULE_PATH} "${CMAKE_SOURCE_DIR}/cmake/Modules/")
find_package(AOCL REQUIRED)
find_package(AAL REQUIRED)
find_package(MCP REQUIRED)
set(MM_SRCS "${CMAKE_SOURCE_DIR}/src/main.cpp"
            "${CMAKE_SOURCE_DIR}/src/opencl.cpp"
            "${CMAKE_SOURCE_DIR}/src/options.cpp")
include_directories("${CMAKE_SOURCE_DIR}/include/" ${AOCL_INCLUDE_DIRS})
add_executable(mm ${MM_SRCS})
target_link_libraries(mm
                      ${CMAKE_THREAD_LIBS_INIT}
                      ${AOCL_LIBRARIES}
                      ${AAL_LIBRARIES}
                      ${MCP_LIBRARIES})
