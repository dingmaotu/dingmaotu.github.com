---
layout: post
title: "Compiling Emacs 24.3 on Windows"
date: 2013-03-12 11:42
comments: true
categories: Emacs
---

Emacs 24.3, a new release, has come out! The official win32 build however has
not. So we are gonna do it by ourselves. Building Emacs on windows is not that
hard, but you must be careful about choosing the correct tools, or your
building experience will be full of bumps.

If I am going to build a project on Windows, I will consider using a free
version of Visual C++. But for Emacs, the support for VC is very poor! You are
not going to succeed with it. Maybe there are few Emacs developers interested
in M$ products, I definitely want Emacs is VC friendly nonetheless.

I am going to state some problems of Emacs when buiding with M$VC, which
I tried several times, and then elaborate upon the process of successfully
building it with MinGW tools.

Emacs developers ignore the M$VC toolchain
==========================================

Many open source projects, such as Python and VIM, are compiled with Visual
C++ compilers on Windows. M$VC is indeed a litter better for native Win32
programs than MinGW port of GCC: it produces smaller executables and may use
more windows specific optimisations. Emacs, however, though with support for
VC toolchains, has never been successfully compiled by me with msvc. And guess
what, a small syntax error in nmake Makefile is still in the official release,
making a scaring error message when you run nmake, which means that they never
tried even once building Emacs with the VC toolchain!

And another problem is that, the Emacs garbage collector seems to have
problems when compiled with VC, and this problem has previously shown on
Mac. It is compiler specific. After you have a temacs executable, in the
dumping process, an `Invalid function: "DEAD"` error message shows when temacs
is loading elisp files. So the closest point I have reached in succeeding in
compiling Emacs with VC is getting a temacs executable.

Compiling with MinGW
====================

What is needed:
---------------

1. MinGW C Compiler
2. `cp` and `rm` from gnuwin32 `coreutils` (to handle special directory names
with the unix convention used in makefiles, and I think `del` and `copy` is
better if converting all these unix dir names to windows)
3. `makeinfo` from MSYS, because gnuwin32 version will break when compiling
the large Emacs Manual. If you are ok without manuals, this is not needed. (I
guess a elisp version of this program will be very good, as temacs can be used
to generate these info files)

Notice:
-------

1. Do NOT use MSYS bash shell, or `cp` and `rm` from MSYS (as recommended
by the Emacs nt install instructions)
2. Use the cmd.exe shell

I decieded not to include any external libraries (Emacs can use some external
libraries to show images), thus minimizes the requirements and complexity of
compiling.

Now the process:
----------------

1. Open cmd, add the required bin directories to your path

        set path=%path%;%gnuwin32root%\bin;%mingwroot%\bin;%msysroot%\bin
2. cd to the Emacs source root, and then cd to `nt` sub directory
3. `configure --help` to read options, as you may need feed all `--without-*`
options to `configure`
4. `configure --with-gcc --no-debug --without-*`
5. `make`
6. `make info` if you want info manuals
7. `make install` if you want related programs to be grouped together, and add
Emacs to `Start Menu` and registry (typically I don't want this)

Note that I do not add `--prefix` option to the `configure` script, the
default is installing Emacs to the same directory as the source code. You just
need to copy the bin and related files to a new folder, then you are
done. `addpm.exe` adds in the registry a bunch of values concerning the
locations of Emacs intallation, which is not needed. So I usually do not run
`addpm.exe`.

