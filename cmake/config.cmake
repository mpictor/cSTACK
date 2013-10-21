# create configuration header stack_cfg.h from stack_cfg_h.in

#push/pop check state isn't really necessary with a single macro, but will be if more are added
include( CMakePushCheckState )
include( CheckFunctionExists )

#input file name
set( CONFIG_H_FILE "${CMAKE_CURRENT_SOURCE_DIR}/cmake/stack_cfg_h.in" )

# check for timer_create function
CMAKE_PUSH_CHECK_STATE()
CHECK_FUNCTION_EXISTS( timer_create HAVE_TIMER )
CMAKE_POP_CHECK_STATE()

configure_file( ${CONFIG_H_FILE} "${CMAKE_BINARY_DIR}/include/stack_cfg.h" )
