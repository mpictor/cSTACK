#stack only needs libboolector

#-fPIC -march=native -W -Wall -Wextra -O3 -DNDEBUG -DBTOR_USE_LINGELING
add_definitions( -DNDEBUG -DBTOR_USE_LINGELING )

set( stack_boolector_SRCS
        btoraig.c     btorconst.c  btormain.c     btorsat.c   btorutil.c
        btoraigvec.c  btorexp.c    btormem.c      btorsmt.c
        btorbtor.c    btorhash.c   btorrewrite.c  btorsmt2.c
)
set_source_files_properties( ${stack_boolector_SRCS} PROPERTIES COMPILE_FLAGS  "-fPIC ${m_arch}")


add_library( boolector STATIC ${stack_boolector_SRCS} )