# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/net-analyzer/fwlogwatch/fwlogwatch-1.4.ebuild,v 1.4 2014/08/30 12:04:23 nimiux Exp $

EAPI=5

inherit eutils flag-o-matic toolchain-funcs

DESCRIPTION="A packet filter and firewall log analyzer"
HOMEPAGE="http://fwlogwatch.inside-security.de/"
SRC_URI="${HOMEPAGE}sw/${P}.tar.bz2"

KEYWORDS="amd64 ~ppc ~sparc x86"
LICENSE="GPL-1"
SLOT="0"
IUSE="nls zlib"

RDEPEND="
	zlib? ( sys-libs/zlib )
"
DEPEND="
	${RDEPEND}
	sys-devel/flex
	nls? ( sys-devel/gettext )
"

src_prepare(# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/net-analyzer/fwlogwatch/fwlogwatch-1.4.ebuild,v 1.4 2014/08/30 12:04:23 nimiux Exp $

EAPI=5

inherit eutils flag-o-matic toolchain-funcs

DESCRIPTION="A packet filter and firewall log analyzer"
HOMEPAGE="http://fwlogwatch.inside-security.de/"
SRC_URI="${HOMEPAGE}sw/${P}.tar.bz2"

KEYWORDS="amd64 ~ppc ~sparc x86"
LICENSE="GPL-1"
SLOT="0"
IUSE="nls zlib"

RDEPEND="
	zlib? ( sys-libs/zlib )
"
DEPEND="
	${RDEPEND}
	sys-devel/flex
	nls? ( sys-devel/gettext )
"

src_prepare() {
	if use nls; then
		strip-linguas -i po/
		local lingua pofile
		for pofile in po/*.po; do
			lingua=${pofile/po\/}
			lingua=${lingua/.po}
			if ! has ${lingua} ${LINGUAS}; then
				sed -i \
					-e "/${lingua}.[mp]o/d" \
					Makefile po/Makefile || die
			fi
		done
	fi

	sed -i \
		-e '/^INSTALL_/s|$| -D|g' \
		-e 's|make|$(MAKE)|g ' \
		Makefile || die
}

src_configure() {
	if ! use zlib; then
		sed -i Makefile -e '/^LIBS/ s|-lz||g' || die
	else
		append-cflags -DHAVE_ZLIB
