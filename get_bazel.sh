#!/bin/bash

wget https://github.com/bazelbuild/bazelisk/releases/download/v1.25.0/bazelisk-linux-amd64 -O bazel

chmod +x bazel

echo "export PATH=$PATH:$PWD" >> ~/.bashrc
