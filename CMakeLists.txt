# CMake
cmake_minimum_required(VERSION 3.1)
project(main)

# Sources
set(SRC_DIR "${CMAKE_CURRENT_SOURCE_DIR}/src")
set(LIB_DIR "${CMAKE_CURRENT_SOURCE_DIR}/lib")
file (GLOB_RECURSE SOURCES ${SRC_DIR}/*.cpp
                                ${SRC_DIR}/*.c
                                ${SRC_DIR}/*.hpp
                                ${SRC_DIR}/*.h)

file (GLOB_RECURSE SHADERS ${SRC_DIR}/shaders/*.frag
				${SRC_DIR}/shaders/*.vert)

# Executable
add_executable(${PROJECT_NAME} ${SOURCES} ${SHADERS})
target_include_directories(${PROJECT_NAME} PRIVATE "${SRC_DIR}")
set_property(TARGET ${PROJECT_NAME} PROPERTY CXX_STANDARD 11)

# glfw
set(GLFW_DIR "${LIB_DIR}/glfw")
set(GLFW_BUILD_EXAMPLES OFF CACHE INTERNAL "Build the GLFW example programs")
set(GLFW_BUILD_TESTS OFF CACHE INTERNAL "Build the GLFW test programs")
set(GLFW_BUILD_DOCS OFF CACHE INTERNAL "Build the GLFW documentation")
set(GLFW_INSTALL OFF CACHE INTERNAL "Generate installation target")
add_subdirectory("${GLFW_DIR}")
target_link_libraries(${PROJECT_NAME} "glfw" "${GLFW_LIBRARIES}")
target_include_directories(${PROJECT_NAME} PRIVATE "${GLFW_DIR}/include")
target_compile_definitions(${PROJECT_NAME} PRIVATE "GLFW_INCLUDE_NONE")

# glad
set(GLAD_DIR "${LIB_DIR}/glad")
add_library("glad" "${GLAD_DIR}/src/glad.c")
target_include_directories("glad" PRIVATE "${GLAD_DIR}/include")
target_include_directories(${PROJECT_NAME} PRIVATE "${GLAD_DIR}/include")
target_link_libraries(${PROJECT_NAME} "glad" "${CMAKE_DL_LIBS}")

# glm
set(GLM_DIR "${LIB_DIR}/glm")
add_subdirectory("${GLM_DIR}")
target_link_libraries(${PROJECT_NAME} "glm" "${GLM_LIBRARIES}")
target_include_directories(${PROJECT_NAME} PRIVATE "${GLM_DIR}/include")
target_compile_definitions(${PROJECT_NAME} PRIVATE "GLM_INCLUDE_NONE")

# assimp
set(ASSIMP_DIR "${LIB_DIR}/assimp")
set(ASSIMP_BUILD_TESTS OFF CACHE INTERNAL "Build the ASSIMP test programs")
set(ASSIMP_BUILD_ASSIMP_TOOLS OFF CACHE INTERNAL "Build the ASSIMP tools")
set(ASSIMP_NO_EXPORT ON CACHE INTERNAL "Disable ASSIMP Export")
set(ASSIMP_BUILD_COLLADA_IMPORTER ON)
set(ASSIMP_BUILD_FBX_IMPORTER ON)

set(ASSIMP_BUILD_AMF_IMPORTER OFF)
set(ASSIMP_BUILD_3DS_IMPORTER OFF)
set(ASSIMP_BUILD_AC_IMPORTER OFF)
set(ASSIMP_BUILD_ASE_IMPORTER OFF)
set(ASSIMP_BUILD_ASSBIN_IMPORTER OFF)
set(ASSIMP_BUILD_B3D_IMPORTER OFF)
set(ASSIMP_BUILD_BVH_IMPORTER OFF)
set(ASSIMP_BUILD_DXF_IMPORTER OFF)
set(ASSIMP_BUILD_CSM_IMPORTER OFF)
set(ASSIMP_BUILD_HMP_IMPORTER OFF)
set(ASSIMP_BUILD_IRRMESH_IMPORTER OFF)
set(ASSIMP_BUILD_IRR_IMPORTER OFF)
set(ASSIMP_BUILD_LWO_IMPORTER OFF)
set(ASSIMP_BUILD_LWS_IMPORTER OFF)
set(ASSIMP_BUILD_MD2_IMPORTER OFF)
set(ASSIMP_BUILD_MD3_IMPORTER OFF)
set(ASSIMP_BUILD_MD5_IMPORTER OFF)
set(ASSIMP_BUILD_MDC_IMPORTER OFF)
set(ASSIMP_BUILD_MDL_IMPORTER OFF)
set(ASSIMP_BUILD_NFF_IMPORTER OFF)
set(ASSIMP_BUILD_NDO_IMPORTER OFF)
set(ASSIMP_BUILD_OFF_IMPORTER OFF)
set(ASSIMP_BUILD_OBJ_IMPORTER OFF)
set(ASSIMP_BUILD_OGRE_IMPORTER OFF)
set(ASSIMP_BUILD_OPENGEX_IMPORTER OFF)
set(ASSIMP_BUILD_PLY_IMPORTER OFF)
set(ASSIMP_BUILD_MS3D_IMPORTER OFF)
set(ASSIMP_BUILD_COB_IMPORTER OFF)
set(ASSIMP_BUILD_BLEND_IMPORTER OFF)
set(ASSIMP_BUILD_IFC_IMPORTER OFF)
set(ASSIMP_BUILD_XGL_IMPORTER OFF)
set(ASSIMP_BUILD_Q3D_IMPORTER OFF)
set(ASSIMP_BUILD_Q3BSP_IMPORTER OFF)
set(ASSIMP_BUILD_RAW_IMPORTER OFF)
set(ASSIMP_BUILD_SIB_IMPORTER OFF)
set(ASSIMP_BUILD_SMD_IMPORTER OFF)
set(ASSIMP_BUILD_STL_IMPORTER OFF)
set(ASSIMP_BUILD_TERRAGEN_IMPORTER OFF)
set(ASSIMP_BUILD_3D_IMPORTER OFF)
set(ASSIMP_BUILD_X_IMPORTER OFF)
set(ASSIMP_BUILD_X3D_IMPORTER OFF)
set(ASSIMP_BUILD_GLTF_IMPORTER OFF)
set(ASSIMP_BUILD_3MF_IMPORTER OFF)
set(ASSIMP_BUILD_MMD_IMPORTER OFF)
set(ASSIMP_BUILD_STEP_IMPORTER OFF)
add_subdirectory("${ASSIMP_DIR}")
target_link_libraries(${PROJECT_NAME} "assimp" "${ASSIMP_LIBRARIES}")
target_include_directories(${PROJECT_NAME} PRIVATE "${ASSIMP_DIR}/include")
target_compile_definitions(${PROJECT_NAME} PRIVATE "ASSIMP_INCLUDE_NONE")
