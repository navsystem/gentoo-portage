# Copyright 2023-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake git-r3

DESCRIPTION="SObjectizer"
HOMEPAGE="https://github.com/Stiffstream/sobjectizer"
EGIT_REPO_URI="https://github.com/Stiffstream/sobjectizer"

S=${WORKDIR}/${P}/dev

LICENSE="AS IS"
SLOT="0"
KEYWORDS="amd64"
IUSE="static"

src_prepare() {
	eapply_user
	use static || sed -e "/OBJECTIZER_BUILD_STATIC/s/ON/OFF/g" -i ${S}/CMakeLists.txt
	sed -e "s|LIBRARY DESTINATION lib|LIBRARY DESTINATION $(get_libdir)|" -i ${S}/so_5/CMakeLists.txt || die
	sed -e "s|ARCHIVE DESTINATION lib|ARCHIVE DESTINATION $(get_libdir)|" -i ${S}/so_5/CMakeLists.txt || die
	cmake_src_prepare
}
