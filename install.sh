#!/bin/bash
# file: install protoc
cd models/research/
wget -O protobuf.zip https://github.com/google/protobuf/releases/download/v3.0.0/protoc-3.0.0-linux-x86_64.zip
unzip -o protobuf.zip
./bin/protoc object_detection/protos/*.proto --python_out=.
cd ../..