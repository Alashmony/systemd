#!/bin/sh
# SPDX-License-Identifier: LGPL-2.1-or-later

set -eu

$1 -dM -include netinet/in.h - </dev/null | \
    awk '/^#define[ \t]+IPPROTO_[^ \t]+[ \t]+[^ \t]/ { print $2; }' | \
    sed -e 's/IPPROTO_//'
