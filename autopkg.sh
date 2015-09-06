#!/bin/sh

set -e
git clean -Xdf
git reset --hard HEAD
autoreconf --install --verbose
rm -f ../*.tar.xz ../*.deb ../*.tar.gz ../*.build ../*.dsc ../*.changes
CURR_PKG_DIR=$(pwd)
tar -czvf ../$(basename $CURR_PKG_DIR)_$(cat ./configure.ac | grep AC_INIT | grep -o '[0-9]\.[0-9]\.[0-9]')+dfsg.orig.tar.gz . --exclude-vcs
#dh_make --multi --createorig --yes --copyright gpl3
debuild -us -uc
