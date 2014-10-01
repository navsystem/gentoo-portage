# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/sci-mathematics/calc/calc-2.12.4.13.ebuild,v 1.1 2014/01/13 05:10:11 mrueg Exp $

EAPI=5

inherit eutils multilib toolchain-funcs

DESCRIPTION="Arbitrary precision C-like arithmetic system"
HOMEPAGE="http://www.isthe.com/chongo/tech/comp/calc/"
SRC_URI="http://www.isthe.com/chongo/src/calc/${P}.tar.bz2"

SLOT="0"
LICENSE="LGPL-2"
KEYWORDS="~alpha ~amd64 ~ppc ~ppc64 ~x86 ~amd64-linux ~x86-linux"

IUSE=""

DEPEND="
	sys-libs/ncurses
	sys-libs/readline"
RDEPEND="${DEPEND}"

src_pr# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/sci-mathematics/calc/calc-2.12.4.13.ebuild,v 1.1 2014/01/13 05:10:11 mrueg Exp $

EAPI=5

inherit eutils multilib toolchain-funcs

DESCRIPTION="Arbitrary precision C-like arithmetic system"
HOMEPAGE="http://www.isthe.com/chongo/tech/comp/calc/"
SRC_URI="http://www.isthe.com/chongo/src/calc/${P}.tar.bz2"

SLOT="0"
LICENSE="LGPL-2"
KEYWORDS="~alpha ~amd64 ~ppc ~ppc64 ~x86 ~amd64-linux ~x86-linux"

IUSE=""

DEPEND="
	sys-libs/ncurses
	sys-libs/readline"
RDEPEND="${DEPEND}"

src_prepare() {
	epatch "${FILESDIR}"/${PN}-2.12.4.13-prefix.patch\
		"${FILESDIR}"/2.12.4.0-ldflags.patch
	ln -sf libcustcalc.so.${PV} custom/libcustcalc.so || die
	sed -i -e "/DIR/s:/usr