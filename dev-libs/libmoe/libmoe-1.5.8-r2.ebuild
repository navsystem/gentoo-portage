# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-libs/libmoe/libmoe-1.5.8-r2.ebuild,v 1.7 2013/10/03 07:55:17 naota Exp $

inherit eutils multilib toolchain-funcs

DESCRIPTION="multi octet character encoding handling library"
HOMEPAGE="http://pub.ks-and-ks.ne.jp/prog/libmoe/"
SRC_URI="http://pub.ks-and-ks.ne.jp/prog/pub/${P}.tar.gz"

LICENSE="public-domain"
SLOT="0"
KEYWORDS="amd64 ppc sparc x86"
IUSE=""

DEPEND="dev-lang/perl"

src_unpack() {
	unpack ${A}
	cd "${S}"

	epatch "${FILESDIR}/${P}-gentoo.patch"
	epatch "${FILESDIR}/${P}-make# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-libs/libmoe/libmoe-1.5.8-r2.ebuild,v 1.7 2013/10/03 07:55:17 naota Exp $

inherit eutils multilib toolchain-funcs

DESCRIPTION="multi octet character encoding handling library"
HOMEPAGE="http://pub.ks-and-ks.ne.jp/prog/libmoe/"
SRC_URI="http://