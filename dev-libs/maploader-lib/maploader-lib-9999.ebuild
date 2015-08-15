# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: maloader-lib-9999.ebuild $

EAPI="2"

inherit subversion qt4-r2

DESCRIPTION="Client libs for QMapServer. Need for dev-php5/mapserver."
HOMEPAGE="http://navsystem.ru/"
LICENSE="NAVSYSTEM"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE="debug"

ESVN_REPO_URI=http://192.168.99.121/repos/SOFT/Qt/Argo5/MapLoader
RDEPEND="
    >=dev-qt/qtcore-4.6.0
"
src_unpack(){
	subversion_src_unpack || die
}

src_install(){
	dolib *.so* || die
}
