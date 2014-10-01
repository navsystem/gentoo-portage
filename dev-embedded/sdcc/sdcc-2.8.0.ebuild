# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-embedded/sdcc/sdcc-2.8.0.ebuild,v 1.4 2014/08/10 20:06:17 slyfox Exp $

inherit eutils autotools

DESCRIPTION="Small device C compiler (for various microprocessors)"
HOMEPAGE="http://sdcc.sourceforge.net/"
SRC_URI="mirror://sourceforge/sdcc/${PN}-src-${PV}.tar.bz2
	doc? ( mirror://sourceforge/sdcc/${PN}-doc-${PV}.tar.bz2 )"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~ppc ~x86"
IUSE="boehm-gc doc"

DEPEND=">=dev-embedded/gputils-0.13.2
	boehm-gc? ( dev-libs/boehm-gc )"
RDEPEND="!dev-embedded/sdcc-svn"

S=${WORKDIR}/${PN}

src_unpack() {
	unpack ${A}
	cd "${S}"

	# Fix conflicting variable names between Gentoo and sdcc
	find ./ -type f -exec sed -i s:PORTDIR:PORTINGDIR:g  {} \; || die "sed failed"
	find device/lib/pic*/ -type f -exec sed -i s:ARCH:SDCCARCH:g  {} \; || die "sed failed"
	find device/lib/pic/libdev/ -type f -exec sed -i s:CFLAGS:SDCCFLAGS:g  {} \; || die "sed failed"

	# Fix automagic C{,XX}FLAGS
	epatch "${FILESDIR}"/${P}-flags.patch
	epatch "${FILESDIR}"/${P}-gcc44.patch

	# We'll install doc manually
	sed -i -e '/SDCC_DOC/d' Makefile.in || die "sed failed"
	sed -i -e 's/all install-doc/all/' as/Makefile.in || die "sed failed"
	sed -i -e 's/ doc//' s# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-embedded/sdcc/sdcc-2.8.0.ebuild,v 1.4 2014/08/10 20:06:17 slyfox Exp $

inherit eutils autotools

DESCRIPTION="Small device C compiler (for various microprocessors)"
HOMEPAGE="http://sdcc.sourceforge.net/"
SRC_URI="mirror://sourceforge/sdcc/${PN}-src-${PV}.tar.bz2
	doc? ( mirror://sourceforge/sdcc/${PN}-doc-${PV}.tar.bz2 )"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~ppc ~x86"
IUSE="boehm-gc doc"

DEPEND=">=dev-embedded/gputils-0.13.2
	boehm-gc? ( dev-libs/boehm-gc )"
RDEPEND="!dev-embedded/sdcc-svn"

S=${WORKDIR}/${PN}

src_unpack() {
	unpack ${A}
	cd "${S}"

	# Fix conflicting variable names between Gent