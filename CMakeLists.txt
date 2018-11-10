cmake_minimum_required(VERSION 3.12)
project(opengl_learning)


set (CMAKE_LIBRARY_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR})
set (CMAKE_RUNTIME_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR})

set(CMAKE_CXX_STANDARD 14)
set(${CMAKE_CXX_FLAGS} -lglfw -lglew -lgl -framework OpenGL)

find_package(OpenGL REQUIRED)
find_package(GLEW REQUIRED)

include_directories(${GLFW_INCLUDE_ES3})
link_libraries(${GLFW_LIBRARY})

include_directories(${OpenGL_INCLUDE_DIRS})
link_libraries(${OPENGL_LIBRARIES})


include_directories(${GLEW_INCLUDE_DIRS})
link_libraries(${GLEW_LIBRARIES})


file(COPY ${CMAKE_CURRENT_SOURCE_DIR}/src/res
        DESTINATION ${CMAKE_CURRENT_BINARY_DIR})

add_executable(opengl_learning src/main.cpp)
target_link_libraries(opengl_learning glfw ${GLEW_LIBRARIES})