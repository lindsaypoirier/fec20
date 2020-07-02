* This is a new release.

## Test environments
* local OS X install, R 4.0.0
* Ubuntu Linux 16.04 (R-release)
* Fedora Linux (R-devel)
* Windows Server 2008 (R-release)
* win-builder (R-devel)

## R CMD check results

There are no Errors, Warnings, or Notes in the local R cmd check.

There is a note for a new submission in the 3 following environments:
- Ubuntu: 1 error that package suggested but not available 'usethis'
- Fedora
- Windows Server: 1 warning that vignette re-building failed as "there is no package called 'utf8' "

- From win-builder: 
  - 1 note: R Under development (unstable)
