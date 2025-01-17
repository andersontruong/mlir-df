#!/bin/bash

git clone --recursive https://github.com/llvm/Polygeist
cd Polygeist

mkdir -p build
cd build

cmake -G Ninja ../llvm-project/llvm \
    -DLLVM_ENABLE_PROJECTS="clang;mlir" \
    -DLLVM_EXTERNAL_PROJECTS="polygeist" \
    -DLLVM_EXTERNAL_POLYGEIST_SOURCE_DIR=.. \
    -DLLVM_TARGETS_TO_BUILD="host" \
    -DLLVM_ENABLE_ASSERTIONS=ON \
    -DCMAKE_C_COMPILER=clang \
    -DCMAKE_CXX_COMPILER=clang++ \
    -DLLVM_USE_LINKER=lld \
    -DCMAKE_BUILD_TYPE=RelWithDebInfo \

ninja
ninja check-polygeist-opt && ninja check-cgeist

