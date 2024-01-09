# Testing googletest on QNX

googletest normally wants to be tested on the same machine it was built on. This obviously doesn't work when cross-compiling for QNX. The gist is to build, then copy the whole googletest source tree on a target. This will include all the relevant files and directory structure which googletest expects when running its test suite.

# Running the Test Suite
Compile the googletest source for the desired architecture, e.g.

    OSLIST=nto CPULIST=x86_64 make -C qnx/build install

Then build your QNX image using mkqnximage and the following options:

    # <repo_path> is where the code was checked out e.g. /mnt/dev/googletest
    mkdir test_image
    cd test_image
    mkqnximage --extra-dirs=<repo_path>/qnx/test/mkqnximage --clean --run --force --test-googletest=<repo_path>

Once the target has booted, the googletest source tree will be located in /data/googletest:

    # cd /data/googletest/qnx/test
    # ./qnxtest.sh
    ...
    ...
