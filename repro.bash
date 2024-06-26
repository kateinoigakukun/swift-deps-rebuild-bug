#!/bin/bash
set -ue

set -x
pwd

rm -rf AppPackage/.build
cp Debug.step1.swift ToyboxPackage/Sources/ToyboxCore/Debug.swift

swift build --package-path ./AppPackage

# Source compatible change
cp Debug.step2.swift ToyboxPackage/Sources/ToyboxCore/Debug.swift

# Curious link error
swift build --package-path ./AppPackage
