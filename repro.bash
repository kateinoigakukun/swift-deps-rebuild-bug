#!/bin/bash
set -ue

set -x
pwd

rm -rf AppPackage/.build
cp Debug.step1.swift ToyboxPackage/Sources/ToyboxCore/Debug.swift

swift build --package-path ./AppPackage -v | tee step1.log

# Source compatible change
cp Debug.step2.swift ToyboxPackage/Sources/ToyboxCore/Debug.swift

# Curious link error
swift build --package-path ./AppPackage -v | tee step2.log
