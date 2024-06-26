#!/bin/bash
set -ue -o pipefail

set -x
pwd

for flavor in direct indirect; do

  rm -rf AppPackage/.build
  cp Package.$flavor.swift AppPackage/Package.swift
  cp Debug.step1.swift AppPackage/Sources/ToyboxCore/Debug.swift
  
  swift build -j 1 --package-path ./AppPackage -v | tee step1.$flavor.log

  cp -R AppPackage/.build .build.$flavor
  
  # Source compatible change
  cp Debug.step2.swift AppPackage/Sources/ToyboxCore/Debug.swift
  
  # Curious link error
  swift build -j 1 --package-path ./AppPackage -v | tee step2.$flavor.log
done
