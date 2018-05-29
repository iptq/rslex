cmake_minimum_required(VERSION 3.0.0)
project(crslex C)

add_library(
    rslex
    src/nfa.c
)

add_executable(
    crslex
    src/main.c
)

target_include_directories(rslex PUBLIC include)
target_include_directories(crslex PUBLIC include)
target_link_libraries(crslex PUBLIC rslex)
