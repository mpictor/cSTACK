
#STACK only needs liblgl.a, compiled from 2 files

set( lgl_SRCS lglib.c lglbnr.c )
set( lgl_cflags "-fPIC ${m_arch}" )
set_source_files_properties( ${lgl_SRCS} PROPERTIES COMPILE_FLAGS ${lgl_cflags} )

add_definitions( -DNLGLOG -DNDEBUG -DNCHKSOL -DNLGLPICOSAT )
include_directories( ${CMAKE_CURRENT_BINARY_DIR} )

add_library( lgl STATIC ${lgl_SRCS} )

execute_process( COMMAND uname -srmn OUTPUT_VARIABLE srmn OUTPUT_STRIP_TRAILING_WHITESPACE )
execute_process( COMMAND date OUTPUT_VARIABLE date OUTPUT_STRIP_TRAILING_WHITESPACE )

set( lglcfg_h "\n
/* do not edit - generated by ${CMAKE_CURRENT_LIST_FILE} */\n
#define LGL_OS \"${srmn}\"
#define LGL_COMPILED \"${date}\"
#define LGL_RELEASED \"Sat Sep 22 14:13:02 CEST 2012\"
#define LGL_VERSION \"al6\"
#define LGL_ID \"080d45d6fb97d421810f76538507c7d08a2ea701\"\n\n"
)

file( WRITE ${CMAKE_CURRENT_BINARY_DIR}/lglcfg.h ${lglcfg_h} )

execute_process( COMMAND ${CMAKE_C_COMPILER} --version
                 COMMAND head -1
                 OUTPUT_VARIABLE cc_vers
                 OUTPUT_STRIP_TRAILING_WHITESPACE )

set( lglcflags_h "
#define LGL_CC \"${cc_vers}\"
#define LGL_CFLAGS \"${lgl_cflags} ${CMAKE_C_FLAGS}\"
"
)

file( WRITE ${CMAKE_CURRENT_BINARY_DIR}/lglcflags.h ${lglcflags_h} )
