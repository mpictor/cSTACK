add_subdirectory( boolector )
add_subdirectory( lingeling )

# ---- LLVM ----
# the equivalent of the following configure options are enabled - either by
# default, through variables, or editing llvm/CMakeLists.txt
#--enable-targets=host
#--enable-shared
#--enable-debug-symbols
#--enable-optimized
#--enable-cxx11
#--enable-bindings=none

add_subdirectory( llvm )
