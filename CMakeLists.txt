project( STACK )
cmake_minimum_required( VERSION 2.8.6 )

if( NOT DEFINED m_arch )
  set( m_arch "-march=native" CACHE string "compiler flag -march=native makes the code fast but unportable" )
endif( NOT DEFINED m_arch )

set( CMAKE_C_FLAGS "${m_arch} ${CMAKE_C_FLAGS}"
set( CMAKE_CXX_FLAGS "${m_arch} ${CMAKE_CXX_FLAGS}"

# generate configuration header
include( ${CMAKE_CURRENT_SOURCE_DIR}/cmake/config.cmake )

# set output directories to bin and lib
include( ${CMAKE_CURRENT_SOURCE_DIR}/cmake/outdirs.cmake )

add_subdirectory( src )

