# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: Exp $

EAPI=4

inherit eutils qt4-r2

SRC_URI="https://qxbsql.googlecode.com/files/${P}.tar.bz2"

DESCRIPTION="A dbf database driver for qt4 using xbsql library"
HOMEPAGE="https://code.google.com/p/qxbsql/"
LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="debug"

DEPEND="dev-qt/qtcore:4
	dev-qt/qtsql:4
	dev-db/xbase
	dev-db/xbsql"
RDEPEND="${DEPEND}"

src_prepare() {
	epatch "${FILESDIR}"/use-system-xbase64-and-xbsql-libs.patch
}
