#!/bin/bash
set -ue

set -x
pwd

cd AppPackage
swift package clean
swift build
cd ..

cd ToyboxPackage/Sources/ToyboxCore

# This change is source compatible
sed 's/a: Int = 0/a: Int = 0, b: Int = 0/' Debug.swift > Debug.2.swift
mv -f Debug.2.swift Debug.swift

cd ../../../AppPackage

# Curios link error
swift build
