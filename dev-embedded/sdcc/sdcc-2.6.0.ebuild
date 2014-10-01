# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-embedded/sdcc/sdcc-2.6.0.ebuild,v 1.3 2014/08/10 20:06:17 slyfox Exp $

DESCRIPTION="Small device C compiler (for various microprocessors)"
HOMEPAGE="http://sdcc.sourceforge.net/"
SRC_URI="mirror://sourceforge/sdcc/${PN}-src-${PV}.tar.gz
	doc? ( mirror://sourceforge/sdcc/${PN}-doc-${PV}.tar.gz )"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~ppc ~x86"
IUSE="doc"

DEPEND=">=dev-embedded/gputils-0.13.2
	dev-libs/boehm-gc"
RDEPEND="!dev-embedded/sdcc-svn"

S=${WORKDIR}/${PN}

sr# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-embedded/sdcc/sdcc-2.6.0.ebuild,v 1.3 2014/08/10 20:06:17 slyfox Exp $

DESCRIPTION="Small device C compiler (for various microprocessors)"
HOMEPAGE="http://sdcc.sourceforge.net/"
SRC_URI="mirror://sourceforge/sdcc/${PN}-src-${PV}.tar.gz
	doc? ( mirror://sourceforge/sdcc/${PN}-doc-${PV}.tar.gz )"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~ppc ~x86"
IUSE="doc"

DEPEND=">=dev-embedded/gputils-0.13.2
	dev-libs/boehm-gc"
RDEPEND="!dev-embedded/sdcc-svn"

S=${WORKDIR}/${PN}

src_unpack() {
	unpack ${A}
	cd "${S}"

	# Fix conflicting variable names between Gentoo and sdcc
	find ./ -type f -exec sed -i s:PORTDIR:PORTINGDIR:g  {} \; || die "sed failed"
	find device/lib/pic*/ -type f -exec sed -i s:ARCH:SDCCARCH:g  {} \; || die "sed failed"
	find device/lib/pic/libdev/ -type f -exec sed -i s:CFLAGS:SDC