# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-util/biew/biew-5.6.2.ebuild,v 1.11 2014/08/10 21:25:20 slyfox Exp $

inherit eutils flag-o-matic

DESCRIPTION="A portable viewer of binary files, hexadecimal and disassembler modes"
HOMEPAGE="http://biew.sourceforge.net"
SRC_URI="mirror://sourceforge/biew/${PN}${PV//./}.tar.bz2"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE="slang ncurses"

DEPEND="ncurses? ( >=sys-libs/ncurses-5.3 )
	slang? ( >=sys-libs/slang-1.4 )"

S=${WORKDIR}/${PN}-${PV//./}

src_unpack() {
	unpack ${A}
	cd "${S}"
	epatch "${FILESDIR}"/biew-562-lvalue-casts.patch

	sed -i "s/USE_MOUSE=.*/USE_MOUSE=y/" makefile
	sed -i 's:/usr/local:/usr:' biewlib/sysdep/generic/unix/os_dep.c
	sed -i "s/CFLAGS += -O2 -fomit-frame-pointer/CFLAGS +=/" makefile.inc
	sed -i 's/bool/__bool/g' plugins/bin/ne.c
#	sed -i "s/TAR# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-util/biew/biew-5.6.2.ebuild,v 1.11 2014/08/10 21:25:20 slyfox Exp $

inherit eutils flag-o-matic

DESCRIPTION="A portable viewer of binary files, hexadecimal and disassembler modes"
HOMEPAGE="http://biew.sourceforge.net"
SRC_URI="mirror://sourceforge/biew/${PN}${PV//./}.tar.bz2"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE="slang ncurses"

DEPEND="ncurses? ( >=sys-libs/ncurses-5.3 )
	slang? ( >=sys-libs/slang-1.4 )"

S=${WORKDIR}/${PN}-${PV//./}

src_unpack() {
	unpack $