#!/bin/sh

git clean -Xdf
git reset --hard HEAD
autoreconf --install --verbose
rm ../*.tar.xz ../*.deb ../*.tar.gz ../*.build
dh_make --multi --createorig
debuild -us -uc
