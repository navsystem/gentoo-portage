# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/net-wireless/irda-utils/irda-utils-0.9.18-r3.ebuild,v 1.11 2013/02/10 15:23:21 floppym Exp $

inherit eutils toolchain-funcs flag-o-matic udev

DESCRIPTION="IrDA management and handling utilities"
HOMEPAGE="http://irda.sourceforge.net"
SRC_URI="mirror://sourceforge/irda/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="amd64 ~arm ppc ~sh x86"
IUSE=""

RDEPEND="=dev-libs/glib-2*
	>=sys-apps/pciutils-2.2.7-r1
	sys-process/procps
	sys-apps/setserial
	sys-apps/grep
	virtual/udev"
DEPEND="${RDEPEND}
	virtual/pkgconfig
	!app-laptop/smcinit"

src_unpack() {
	unpack ${A}

	cd "${S}"
	epatch "${FILESDIR}"/irda-utils-rh1.patch \
		"${FILESDIR}"/${P}-makefile.diff \
		"${FILESDIR}"/${P}-smcinit.diff \
		"${FILESDIR}"/${P}-io.h.diff \
		"${FILESDIR}"/${P}-dofail.patch \
		"${FILESDIR}"/${P}-asneeded.patch

	# fix crosscompile, respect CFLAGS (Bug 200295)
	sed -i -e "/^CC/s:gcc:$(tc-getCC):" \
		-e "/^LD/s:ld:$(tc-getLD):" \
		-e "/^AR/s:ar:$(tc-getAR):" \
		-e "/^RANLIB/s:ranlib:$(tc-getRANLIB):" \
		-e "/^CFLAGS/s:-O2:${CFLAGS}:" Makefile */Makefile

	# fix compile when pciutils is compiled with USE=zlib (Bug 200295)# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/net-wireless/irda-utils/irda-utils-0.9.18-r3.ebuild,v 1.11 2013/02/10 15:23:21 floppym Exp $

inherit eutils toolchain-funcs flag-o-matic udev

DESCRIPTION="IrDA management and handling utilities"
HOMEPAGE="http://irda.sourceforge.net"
SRC_URI="mirror://sourceforge/irda/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="amd64 ~arm ppc ~sh x86"
IUSE=""

RDEPEND="=dev-libs/glib-2*
	>=sys-apps/pciutils-2.2.7-r1
	sys-process/procps
	sys-apps/setserial
	sys-apps/grep
	virtual/udev"
DEPEND="${RDEPEND}
	virtual/pkgconfig
	!app-laptop/smcinit"

src_unpack() {
	unpack ${A}

	cd "${S}"
	epatch "${FILESDIR}"/irda-utils-rh1.patch \
		"${FILESDIR}"/${P}-makefile.diff \
		"${FILESDIR}"/${P}-smcinit.diff \
		"${FILESDIR}"/${P}-io.h.diff \
		"${FILESDIR}"/${P}-dofail.patch \
		"${FILESDIR}"/${P}-asneeded.patch

	# fix crosscompile, respect CFLAGS (Bug 200295)
	sed -i -e "/^CC/s:gcc:$(tc-getCC):" \
		-e "/^LD/s:ld:$(tc-getLD):" \
		-e "/^AR/s:ar:$(tc-getAR):" \
		-e "/^RANLIB/s:ranlib:$(tc-getRANLIB):" \
		-e "/^CFLAGS/s:-O2:${CFLAGS}:" Makefile */Makefile

	# fix compile when pciutils is compiled with USE=zlib (Bug 200295)
	sed -i -e "s:-lpci:$(pkg-config --libs libpci):g" smcinit/Makefile

	# disable etc subdir in Makefile
	sed -i -e "s:^\(DIRS.*=.* \)etc \(.*\):\1\2:g" Makefile

	# disable write_pid(), because we don't need it
	sed -i -e "s:\(write_pid();\):/* \1 */:g" irattach/util.c

	append-flags "-