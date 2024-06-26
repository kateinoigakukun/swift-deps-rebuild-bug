This repository reproduces a project where a Swift build bug occurs.

The Swift build system can sometimes skip necessary rebuilds and result in link errors when using local packages.

# Easy Reproduction

You can reproduce the issue by following these steps:

```sh
$ git clone https://github.com/omochi/swift-deps-rebuild-bug
$ cd swift-deps-rebuild-bug
$ ./repro.bash
```

If a link error appears at the end of the script execution, the issue has occurred.

Below, the repository structure and the script’s process are explained.

# Detailed Explanation

This project consists of two packages:
the `AppPackage` package, which implements the main application,
and the `ToyboxPackage` package, which is referenced as a dependency via a local relative path.

Initially, `AppPackage` can be built with `$ swift build`.

Next, add `b: Int = 0` as an argument to `ToyboxCore.toyDebug`.
Since this is a source-compatible change, it is expected that `AppPackage` can be built again without modification using `$ swift build`.

However, in practice, a link error occurs as shown below:

```
error: link command failed with exit code 1 (use -v to see invocation)
Undefined symbols for architecture arm64:
  "ToyboxCore.toyDebug(a: Swift.Int) -> ()", referenced from:
      AppModule.App.main() -> () in App.swift.o
ld: symbol(s) not found for architecture arm64
clang: error: linker command failed with exit code 1 (use -v to see invocation)
error: fatalError
[9/14] Linking app
```

In this state, you cannot proceed without performing `$ swift package clean`.
In a practical setting, this breaks incremental builds and forces a rebuild of thousands of files, which is very inconvenient.
