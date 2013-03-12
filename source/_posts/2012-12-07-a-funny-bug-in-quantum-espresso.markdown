---
layout: post
title: "A funny bug in Quantum Espresso"
date: 2012-12-07 22:11
comments: true
categories: QE
---

Recently I am running metadynamics simulations on MgSiO3 Perovkite with
Quantum Espresso + PLUMED. However, the MD part of the PWscf code in QE is
rather unstable (compared to some non-free alternatives, such as VASP). I
encountered many problems using QE and PLUMED, and the bug discussed in this
post made me suffer a lot.

I think the this combination (PW + metadynamics with PLUMED) is rarely used by
people, since I found a bug that appears again and again, and no one complains
about it. This bug exists in 4.3.2 and the latest 5.0.1 version.

When I start a MD run with the PLUMED plugin enabled, most of the time, the
code fails, reporting a message:

>       from randy : error #      1038
>       j out of range

before entering the MD loop.

I sought through the source code, and found that this error is reported by the
random number generator of QE. If the random number generator, which is so
fundamental and frequently used by the code, is buggy, then why does not
anyone experienced this bug before? Actually, when I first reported this bug
to the maintainer of the code, he was doubting the possibility of the bug.

After studying the code for a while, I finally figured out why the bug
happened.

In function `randy`, it first processes the seed as `idum` using:

``` fortran random_numbers.f90 line 53
idum = MOD( ic - idum, m )
```

The maintainer does not remember who wrote this code, and the reason why. It
indeed causes problems if the seed is larger than ic (which is a fixed
parameter).

I  think this is the source of generating many negetive numbers. The random
seed must be too large. Where is the seed generated?

I found that `set_random_seed` uses current time components to generate a
seed:

``` fortran random_numbers.f90 lines 83-85
! itime contains: year, month, day, time difference in minutes, hours,
!                 minutes, seconds and milliseconds.
iseed = ( itime(8) + itime(6) ) * ( itime(7) + itime(4) )
```

Here in China we have `itime(4)` as 480 (timezone UTC+8), which is a constant
for any particular region, whereas in Europe `itime(4)` is much smaller. And
quite likely `iseed` will be larger than the `ic =150889` in China. So
depending on the value of `itime(8)` in milliseconds, which changes rapidly
and may be a large number, in China we got large seed, thus negative random
numbers.

If I remove the `itime(4)` in `set_random_seed`, PWscf never crashes with or
without `-plumed`. I believe this correction has no problem since it is what a
British user (UTC time, with itime(4) = 0) would get.

The maintainer corrected the buggy `randy` code. The problem seems to be
solved. However, I still do not understand the problem completely. Why the
error is always 1038, as the seed should be random? Why without `-plumed`,
does this apparent error not show? This is rather confusing, yet I do not have
the time and knowledge to dig into it.
