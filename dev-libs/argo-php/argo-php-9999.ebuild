# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: maloader-lib-9999.ebuild $

EAPI="2"

inherit qt4-r2 mercurial

DESCRIPTION="Client libs for QMapServer. Need for dev-php5/mapserver."
HOMEPAGE="http://navsystem.ru/"
LICENSE="NAVSYSTEM"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE="debug"

EHG_REPO_URI="ssh://hg@trac:5438/Inet_Loc"
RDEPEND="
    >=dev-qt/qtcore-4.6.0
"

src_unpack() {
    mercurial_src_unpack || die
    export S="${WORKDIR}/${P}/libs/ArgoPhp"
}

src_install(){
	cd build
	dolib *.so* || die
}
