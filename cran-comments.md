## Test environments
* local R installation, R 4.1.1
* ubuntu 16.04 (on travis-ci), R 4.1.1
* win-builder (devel)

## R CMD check results

For a CRAN submission we recommend that you fix all NOTEs, WARNINGs and ERRORs.
## Test environments
- R-hub windows-x86_64-devel (r-devel)
- R-hub ubuntu-gcc-release (r-release)
- R-hub fedora-clang-devel (r-devel)

## R CMD check results
❯ On windows-x86_64-devel (r-devel), ubuntu-gcc-release (r-release), fedora-clang-devel (r-devel)
  checking CRAN incoming feasibility ... NOTE
  Maintainer: 'Tara Chari <tarachari3@gmail.com>'
  New submission

❯ On windows-x86_64-devel (r-devel), ubuntu-gcc-release (r-release), fedora-clang-devel (r-devel)
  checking examples ... NOTE
  Examples with CPU (user + system) or elapsed time > 5s
  test 2.36   0.58  211.45
       user system elapsed

❯ On ubuntu-gcc-release (r-release)
  checking for non-standard things in the check directory ... NOTE
  Found the following files/directories:
    ‘.empty’



* This is the first submission for this package. Note 2 refers to the examples taking longer than 5s to run though these examples are useful for the user to have.
