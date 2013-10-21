[STACK](http://css.csail.mit.edu/stack/) code analyzer
----
#### find optimization-unstable code

This is a fork of STACK which uses CMake as the build system and
builds the dependencies (including llvm and clang) automatically
and with the correct options - no more having to go through the
many steps necessary to get special builds of llvm and clang
working without interfering with the system versions.

__Once this works well__, I will approach STACK's authors about merging
my changes.

INSTALL will contain build instructions - this isn't in a working
state yet.

Make sure STACK binaries are in the PATH.


Preparation
-----------

STACK works on LLVM bitcode.  To analyze a software project, the
first step is to generate LLVM bitcode.  STACK provides a script
called `stack-build`, which both calls gcc (or g++) and in parallel
uses Clang to obtain LLVM bitcode from your source code, stored in
.ll files.  For example:

	$ cd /path/to/your/project
	$ stack-build ./configure
	$ stack-build make

or if analyzing a project that is configured using CMake:

	$ cd /path/to/your/project
	$ stack-build cmake
	$ stack-build make


Unstable code checker
---------------------

To find unstable code that can be eliminated due to undefined behavior,
simply run the following command in the project directory after building
LLVM bitcode:

	$ poptck

You can find bug reports in `pstack.txt`, in the YAML format.

Here's one example:

	bug: anti-simplify
	model: |
	  %tobool = icmp ne i8* %p, null, !dbg !14
	  -->  true
	stack: 
	  - p.c:4:0
	ncore: 1
	core: 
	  - p.c:3:0
	    - null pointer dereference

This means the null pointer check at line 4 ("stack:") may be simplified
into true ("model:") due to the pointer dereference at line 3 ("core:").


Contact
-------

If you find any bugs in STACK, feel free to contact us: you can send
us email at int`@`pdos.csail.mit.edu.
