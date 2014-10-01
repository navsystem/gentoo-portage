# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/net-im/ekg/ekg-1.8_rc1-r1.ebuild,v 1.3 2014/09/19 16:50:54 jer Exp $

EAPI=2
inherit autotools eutils

IUSE="gif gtk jpeg ncurses python readline spell ssl zlib"

DESCRIPTION="EKG (Eksperymentalny Klient Gadu-Gadu) - a text client for Polish instant messaging system Gadu-Gadu"
HOMEPAGE="http://ekg.chmurka.net/"
SRC_URI="http://ekg.chmurka.net/${P/_/}.tar.gz"

SLOT="0"
LICENSE="GPL-2"
KEYWORDS="~alpha ~amd64 ~ia64 ~mips ~ppc ~sparc ~x86"

S="${WORKDIR}/${P/_/}"

RDEPEND="net-libs/libgadu
	ssl? ( >=dev-libs/openssl-0.9.6 )
	ncurses? ( sys-libs/ncurses )
	readline? ( sys-libs/readline )
	zlib? ( sys-libs/zlib )
	python? ( dev-lang/python )
	spell? ( >=app-text/aspell-0.50.3 )
	gif? ( media-libs/giflib )
	jpeg? ( virtual/jpeg )
	gtk? ( x11-libs/gtk+:2 )"

DEPEND=">=sys-devel/automake-1.7
	>=sys-devel/autoconf-2.50
	${RDEPEND}"

src_prepare() {
	epatch "${FILESDIR}/"${P}-gtkutil-button-decl.patch \
		"${FILESDIR}/"${P}-as-needed.patch \
		"${FILESDIR}/"${P}-gtk.patch \
		"${FILESDIR}/"${P}-libgif.patch \
		"${FILESDIR}/"${P}-missing-prototypes.patch
	sed -i -e 's/ioctld.c -o/$(LDFLAGS) # Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/net-im/ekg/ekg-1.8_rc1-r1.ebuild,v 1.3 2014/09/19 16:50:54 jer Exp $

EAPI=2
inherit autotools eutils

IUSE="gif gtk jpeg ncurses python readline spell ssl zlib"

DESCRIPTION="EKG (Eksperymentalny Klient Gadu-Gadu) - a text client for Polish instant messaging system Gadu-Gadu"
HOMEPAGE="http://ekg.chmurka.net/"
SRC_URI="http://ekg.chmurka.net/${P/_/}.tar.gz"

SLOT="0"
LICENSE="GPL-2"
KEYWORDS="~alpha ~amd64 ~ia64 ~mips ~ppc ~sparc ~x86"

S="${WORKDIR}/${P/_/}"

RDEPEND="net-libs/libgadu
	ssl? ( >=dev-libs/openssl-0.9.6 )
	ncurses? ( sys-libs/nc