# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/net-irc/eggdrop/eggdrop-1.6.21.ebuild,v 1.4 2012/10/08 16:59:53 blueness Exp $

EAPI=4

inherit eutils

MY_P="eggdrop${PV}"
PATCHSET_V="1.0"

DESCRIPTION="An IRC bot extensible with C or TCL"
HOMEPAGE="http://www.eggheads.org/"
SRC_URI="ftp://ftp.eggheads.org/pub/eggdrop/source/1.6/${MY_P}.tar.bz2
	http://dev.gentoo.org/~binki/distfiles/${CATEGORY}/${PN}/${P}-patches-${PATCHSET_V}.tar.bz2"

KEYWORDS="alpha amd64 ia64 ~mips ppc sparc x86"
LICENSE="GPL-2"
SLOT="0"
IUSE="debug mysql postgres ssl static vanilla"
REQUIRED_USE="vanilla? ( !mysql !postgres !ssl )"

DEPEND="dev-lang/tcl
	!vanilla? (
		mysql? ( virtual/mysql )
		postgres? ( dev-db/postgresql-server )
		ssl? ( dev-libs/openssl )
	)"
RDEPEND="${DEPEND}"

S=${WORKDIR}/${MY_P}

src_prepare()  {
	if use vanilla; then
		rm -f "${WORKDIR}"/patch/[1-6]*.patch || die
	fi

	EPATCH_SUFFIX="patch" epatch

	# fix bug #335230
	sed -i \
		-e '/\$(LD)/s/-o/$(CFLAGS) $(LDFLAGS) &/' \
		src/mod/*.mod/Makefile* src/Makefile.in || die
}

src_configure() {
	use mysql    || ( echo mysql ; echo mystats ) >>disabled_modules# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/net-irc/eggdrop/eggdrop-1.6.21.ebuild,v 1.4 2012/10/08 16:59:53 blueness Exp $

EAPI=4

inherit eutils

MY_P="eggdrop${PV}"
PATCHSET_V="1.0"

DESCRIPTION="An IRC bot extensible with C or TCL"
HOMEPAGE="http://www.eggheads.org/"
SRC_URI="ftp://ftp.eggheads.org/pub/eggdrop/source/1.6/${MY_P}.tar.bz2
	http://dev.gentoo.org/~binki/distfiles/${CATEGORY}/${PN}/${P}-patches-${PATCHSET_V}.tar.bz2"

KEYWORDS="alpha amd64 ia64 ~mips ppc sparc x86"
LICENSE="GPL-2"
SLOT="0"
IUSE="debug mysql postgres ssl static vanilla"
REQUIRED_USE="vanilla? ( !mysql !postgres !ssl )"

DEPEND="dev-lang/tcl
	!vanilla? (
		mysql? ( virtual/mysql )
		postgres? ( dev-db/postgresql-server )
		ssl? ( dev-libs/openssl )
	)"
RDEPEND="${DEPEND}"

S=${WORKDIR}/${MY_P}

src_prepare()  {
	if use vanilla; then
		rm -f "${WORKDIR}"/patch/[1-6]*.patch || die
	fi

	EPATCH_SUFFIX="patch" epatch

	# fix bug #335230
	sed -i \
		-e '/\$(LD)/s/-o/$(CFLAGS) $(LDFLAGS) &/' \
		src/mod/*.mod/Makefile* src/Makefile.in || die
}

src_configure() {
	use mysql    |