add_subdirectory( boolector )
add_subdirectory( lingeling )

# the equivalent of the following configure options are enabled - either by
# default, through setting variables, or editing llvm/CMakeLists.txt
#--enable-targets=host
#--enable-shared
#--enable-debug-symbols
#--enable-optimized
#--enable-cxx11
#--enable-bindings=none

set( CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -std=c++11" )
add_subdirectory( llvm )
