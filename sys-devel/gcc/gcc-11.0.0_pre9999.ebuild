# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI="7"

PATCH_GCC_VER="11.0.0"
PATCH_VER="1"

inherit toolchain

# Don't keyword live ebuilds
#KEYWORDS="~alpha ~amd64 ~arm ~arm64 ~hppa ~ia64 ~m68k ~mips ~ppc ~ppc64 ~riscv ~s390 ~sh ~sparc ~x86"

EGIT_BRANCH=master

RDEPEND=""
BDEPEND="${CATEGORY}/binutils"
