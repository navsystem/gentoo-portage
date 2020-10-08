# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

QTMIN=5.14.2
VIRTUALX_REQUIRED="test"
inherit ecm kde.org optfeature

DESCRIPTION="Provider for platform independent hardware discovery, abstraction and management"
LICENSE="LGPL-2.1+"
KEYWORDS="amd64 ~arm arm64 ~ppc64 x86"
IUSE="nls"

BDEPEND="
	sys-devel/bison
	sys-devel/flex
	nls? ( >=dev-qt/linguist-tools-${QTMIN}:5 )
"
RDEPEND="
	>=dev-qt/qtdbus-${QTMIN}:5
	>=dev-qt/qtgui-${QTMIN}:5
	>=dev-qt/qtdeclarative-${QTMIN}:5
	>=dev-qt/qtxml-${QTMIN}:5
	sys-fs/udisks:2
	virtual/libudev:=
"
DEPEND="${RDEPEND}
	test? ( >=dev-qt/qtconcurrent-${QTMIN}:5 )
"

pkg_postinst() {
	if [[ -z "${REPLACING_VERSIONS}" ]]; then
		elog "Optional dependencies:"
		optfeature "Media player devices support" app-misc/media-player-info
	fi
	ecm_pkg_postinst
}
