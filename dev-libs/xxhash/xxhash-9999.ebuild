# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake-multilib git-r3

DESCRIPTION="Extremely fast non-cryptographic hash algorithm"
HOMEPAGE="https://xxhash.com/"
EGIT_REPO_URI="https://github.com/Cyan4973/xxHash.git"
#SRC_URI="https://github.com/Cyan4973/xxHash/archive/v${PV}.tar.gz -> ${P}.tar.gz"
#S=${WORKDIR}/xxHash-${PV}

LICENSE="BSD-2 GPL-2+"
SLOT="0"
KEYWORDS="~alpha amd64 ~arm ~arm64 ~hppa ~loong ~mips ~ppc ~ppc64 ~riscv ~s390 ~sparc ~x86 ~x64-macos"

src_prepare() {
    cp -a ${S}/build/cmake/* ${S}
    sed -i ${S}/CMakeLists.txt -e 's:get_filename_component(XXHASH_DIR "${CMAKE_CURRENT_SOURCE_DIR}/../..":get_filename_component(XXHASH_DIR "${CMAKE_CURRENT_SOURCE_DIR}":' || die
    cmake_src_prepare
}