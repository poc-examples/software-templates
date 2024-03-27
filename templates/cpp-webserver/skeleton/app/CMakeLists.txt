cmake_minimum_required(VERSION 3.0.0)
project(app VERSION 0.1.0)

find_package(Boost REQUIRED COMPONENTS system thread)
include_directories(${Boost_INCLUDE_DIRS})

add_executable(app app.cpp)
target_link_libraries(app ${Boost_LIBRARIES} pthread)
