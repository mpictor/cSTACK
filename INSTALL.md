This version of STACK uses CMake. When this works, building STACK will be as simple as

_extract stack to ~/stack_
$ `cd stack`
$ `mkdir build`
$ `cd build`
$ `cmake ..`
$ `make`  (or `make -jn`, where n is the number of cpus + 1)


Finally, add `<STACK_ROOT>/build/bin` to PATH.
