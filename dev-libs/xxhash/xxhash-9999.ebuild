# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake-multilib git-r3

DESCRIPTION="Extremely fast non-cryptographic hash algorithm"
HOMEPAGE="https://xxhash.com/"
#SRC_URI="https://github.com/Cyan4973/xxHash/archive/v${PV}.tar.gz -> ${P}.tar.gz"
EGIT_REPO_URI="https://github.com/Cyan4973/xxHash.git"

#S=${WORKDIR}/xxHash-${PV}

#CMAKE_USE_DIR=cmake_unofficial

LICENSE="BSD-2 GPL-2+"
# https://abi-laboratory.pro/tracker/timeline/xxhash
SLOT="0"
KEYWORDS="~alpha amd64 arm arm64 hppa ~ia64 ~loong ~mips ppc ppc64 ~riscv ~s390 sparc x86 ~x64-macos"

src_prepare() {
    cp -a ${S}/cmake_unofficial/* ${S}
    sed -i ${S}/CMakeLists.txt -e 's:set(XXHASH_DIR "${CMAKE_CURRENT_SOURCE_DIR}/.."):set(XXHASH_DIR "${CMAKE_CURRENT_SOURCE_DIR}"):'
    cmake_src_prepare
}
