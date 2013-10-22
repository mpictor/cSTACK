project( STACK )
cmake_minimum_required( VERSION 2.8.6 )

# use -march=native?
if( NOT DEFINED m_arch )
  set( m_arch "-march=native" CACHE string "compiler flag -march=native makes the code fast but unportable" )
  #print message after everything else so user will see it
  set( march_default TRUE )
else()
  set( m_arch "" CACHE string "compiler flag -march=native makes the code fast but unportable" )
endif( NOT DEFINED m_arch )

set( CMAKE_C_FLAGS "${m_arch} ${CMAKE_C_FLAGS}" )
set( CMAKE_CXX_FLAGS "${m_arch} -std=c++11 ${CMAKE_CXX_FLAGS}" )

# generate configuration header
include( ${CMAKE_CURRENT_SOURCE_DIR}/cmake/config.cmake )

# set output directories to bin and lib
include( ${CMAKE_CURRENT_SOURCE_DIR}/cmake/outdirs.cmake )

add_subdirectory( src )

#this needs to stay at the bottom of the file so that the message will be visible to the user
if( march_default )
  message( "** m_arch not set - defaulting to the non-portable '-march=native'!" )
endif( march_default )
