
message( "FIXME!!! AM_CXXFLAGS = `llvm-config --cxxflags` -Werror -Wall -std=c++11 -fno-strict-aliasing\nbuild llvm first, then use llvm-config?" )


#also includes what was identified as libsat_la in autotools files
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

