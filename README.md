# melrose-osx

Scripts to build an Mac OSX application from the `melrose` sources.

## requirements

The pkg file is created using the `Packages` tool (version 1.2.9).
You need to clone the `melrose` repository in the parent folder as the `melrose-osx` repository.

## build

    make package

## changes since last tag

    git log --pretty=format:"%s" $(git describe --tags --abbrev=0 v0.43.0^)..@

&copy; 2022. http://ernestmicklei.com . MIT license