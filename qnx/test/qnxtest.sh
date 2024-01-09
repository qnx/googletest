#! /bin/sh

# For testing, copy the whole googletest compiled source tree to the target in
# a specific location e.g. /data/googletest and then execute this script from
# the source tree

GOOGLETEST_DIR=/data/googletest/qnx/build/${GOOGLETEST_TEST_PREFIX}/build

# Set LD_LIBRARY_PATH
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$GOOGLETEST_DIR/lib

# Change directory to the test directory
cd $GOOGLETEST_DIR/googletest;

rm -rf CMakeFiles/ CTestTestfile.cmake  Makefile  cmake_install.cmake  generated/

for test in $(ls);
do
    ./"$test"
done

cd $GOOGLETEST_DIR/googlemock;

rm -rf CMakeFiles/ CTestTestfile.cmake  Makefile  cmake_install.cmake

for test in $(ls);
do
    ./"$test"
done
