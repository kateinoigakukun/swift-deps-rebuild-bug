#!/bin/bash
set -ue

set -x
pwd

cd AppPackage
swift package clean
swift build
cd ..

cd ToyboxPackage/Sources/ToyboxCore

# Source compatible change
sed 's/a: Int = 0/a: Int = 0, b: Int = 0/' Debug.swift > Debug.2.swift
mv -f Debug.2.swift Debug.swift

cd ../../../AppPackage

# Curious link error
swift build
