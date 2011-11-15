# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="2"

inherit qt4-r2

SRC_URI="http://downloads.sourceforge.net/project/qextserialport/qextserialport/1.1/qextserialport-1.1.tar.gz"

DESCRIPTION="A cross-platform serial port class"
HOMEPAGE="http://sourceforge.net/projects/qextserialport/"
LICENSE="GPL-2"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE="debug"

DEPEND="x11-libs/qt-core:4"

RDEPEND=${DEPEND}

S="${WORKDIR}/${PN}"

src_install(){
	dolib.so build/*.so* || die "Install falied"
	dodir /usr/include/qextserialport || die
	insinto /usr/include/qextserialport || die
	doins qextserialbase.h || die
	doins posix_qextserialport.h || die
	doins qextserialport.h || die
}