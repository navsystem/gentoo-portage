# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cmake xdg

DESCRIPTION="GPS mapping utility"
HOMEPAGE="https://github.com/Maproom/qmapshack/wiki"
SRC_URI="https://github.com/Maproom/${PN}/archive/V_${PV}.tar.gz -> ${P}.tar.gz"
LICENSE="GPL-3+"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE=""
RDEPEND="dev-qt/qtwebengine:5[widgets]
	dev-qt/qtdeclarative:5[widgets]
	dev-qt/qtprintsupport:5
	dev-qt/qtdbus:5
	dev-qt/qttest:5
	dev-qt/designer:5
	dev-qt/qtnetwork:5[ssl]
	dev-qt/qtsql:5
	dev-qt/qthelp:5
	dev-libs/quazip
	>=sci-geosciences/routino-3.1.1
	sci-libs/gdal
	>=sci-libs/proj-6.0.0:=
	sci-libs/alglib"
DEPEND="${RDEPEND}
	dev-qt/linguist-tools:5"

S="${WORKDIR}"/${PN}-V_${PV}

src_prepare() {
	eapply "${S}"/FindPROJ4.patch
	cmake_src_prepare
	xdg_environment_reset
}

src_install() {
	docompress -x /usr/share/doc/${PF}/html
	cmake_src_install
	mv "${D}"/usr/share/doc/HTML "${D}"/usr/share/doc/${PF}/html || die "mv Qt help failed"
}
