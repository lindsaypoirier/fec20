## Resubmission 

This is a resubmission. In this version (v0.1.2):

* Updated some issues with dependencies and imports

## Test environments

* local OS X install, R 4.0.0
* R-hub
  - Ubuntu Linux 16.04 LTS, R-release, GCC
  - Fedora Linux, R-devel, clang, gfortran
  - Windows Server 2008 R2 SP1, R-devel, 32/64 bit
* win-builder (devel and release)

## R CMD check results

There are no Errors or Warnings in the R cmd check.

* There is a NOTE about the presence of non-ASCII in the included data:
```
checking data for non-ASCII characters ... NOTE
Note: found 33 marked UTF-8 strings
```
