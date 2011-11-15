# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="2"

inherit qt4-r2 git

EGIT_REPO_URI="git://gitorious.org/inbiza-labs/qserialport.git"

DESCRIPTION="Unofficial Qt Serial Port Library"
HOMEPAGE="http://www.inbiza.com/"
LICENSE="LGPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="debug"

src_prepare(){
	epatch "${FILESDIR}"/fix_gentoo.patch || die
}

src_configure(){
	eqmake4 -r || die
}
