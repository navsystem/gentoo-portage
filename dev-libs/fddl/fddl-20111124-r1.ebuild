# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cmake vcs-snapshot

DESCRIPTION="Free Decision Diagram Library"
HOMEPAGE="http://itval.sourceforge.net/ https://github.com/atomopawn/FDDL"
SRC_URI="https://dev.gentoo.org/~pinkbyte/distfiles/snapshots/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="amd64 x86"

DOCS=( AUTHORS ChangeLog INSTALL RELEASE )

src_prepare() {
	cmake_src_prepare

	# Remove references to files that were not shipped,
	# prefer dynamic linking
	sed -i \
		-e 's|unaryoperation.cpp||g' \
		-e 's|unaryoperation.h||g' \
		-e 's|binaryoperation.cpp||g' \
		-e 's|binaryoperation.h||g' \
		-e '/add_library/s/FDDL /FDDL SHARED /' \
		-e '/add_library/s/FDDL /FDDL SHARED /' \
		-e "/^install/s:DESTINATION lib:DESTINATION $(get_libdir):" \
		src/CMakeLists.txt || die
	# Do not build tests that depend on above files
	sed -i   \
		{,tests/}CMakeLists.txt \
		-e '/test_unaryop/d' \
		-e '/test_binaryop/d' \
		|| die
}
