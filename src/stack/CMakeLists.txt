
message( "FIXME!!! AM_CXXFLAGS = `llvm-config --cxxflags`\nbuild llvm first, then use llvm-config?" )

include_directories( BEFORE ${CMAKE_BINARY_DIR}/src/3rdparty/
                            ${CMAKE_SOURCE_DIR}/src/3rdparty/
                            ${CMAKE_BINARY_DIR}/include
                            ${CMAKE_SOURCE_DIR}/src/3rdparty/llvm/include
                            ${CMAKE_BINARY_DIR}/src/3rdparty/llvm/include
                            ${CMAKE_SOURCE_DIR}/src/3rdparty/llvm/tools/clang/include/
                    )

# with autotools, apparently it wasn't necessary to define the following macros. not sure why.
add_definitions( -D__STDC_LIMIT_MACROS -D__STDC_CONSTANT_MACROS )

set( CMAKE_CXX_FLAGS "-Werror -Wall -fno-strict-aliasing ${CMAKE_CXX_FLAGS}")

# liboptck_SOURCES also includes what was identified as libsat_la in the autotools files
set( liboptck_SOURCES
        AntiAlgebra.cc       BugOnInt.cc           InlineOnly.cc
        AntiDCE.cc           BugOnLibc.cc          LoadElim.cc
        AntiFunctionPass.cc  BugOnLinux.cc         LoopPrepare.cc
        AntiSimplify.cc      BugOnLoop.cc          PHIRange.cc
        BugOn.cc             BugOnNull.cc          PathGen.cc
        BugOnAlias.cc        BugOnUndef.cc         SMTBoolector.cc
        BugOnAssert.cc       Diagnostic.cc         SMTSolver.cc
        BugOnBounds.cc       ElimAssert.cc         SimplifyDelete.cc
        BugOnFree.cc         GlobalTimeout.cc      ValueGen.cc
        BugOnGep.cc          IgnoreLoopInitial.cc
   )

set( liboptfe_SOURCES IntAction.cc )

set_source_files_properties( "${liboptck_SOURCES} ${liboptfe_SOURCES}"
                             PROPERTIES COMPILE_FLAGS  "${m_arch}" )

add_library( optck MODULE ${liboptck_SOURCES} )
target_link_libraries( optck boolector lgl )

add_library( optfe MODULE ${liboptfe_SOURCES} )

