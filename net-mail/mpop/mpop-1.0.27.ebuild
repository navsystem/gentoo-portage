# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/net-mail/mpop/mpop-1.0.27.ebuild,v 1.2 2012/05/03 04:18:36 jdhore Exp $

EAPI="4"

inherit python

DESCRIPTION="A small, fast, and portable POP3 client"
HOMEPAGE="http://mpop.sourceforge.net/"
SRC_URI="mirror://sourceforge/${PN}/${P}.tar.bz2"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="gnome-keyring gnutls idn nls sasl ssl vim-syntax"

RDEPEND="
	gnome-keyring? (
		dev-python/gnome-keyring-python
		gnome-base/libgnome-keyring
	)
	idn? ( net-dns/libidn )
	nls? ( virtual/libintl )
	sasl? ( virtual/gsasl )
	ssl? (
		gnutls? ( net-libs/gnutls )
		!gnutls? ( dev-libs/openssl )
	)"
DEPEND="${RDEPEND}
	nls? ( sys-devel/gettext )
	virtual/pkgconfig"

REQUIRED_USE="gnutls? ( ssl )"

DOCS="AUTHORS ChangeLog NEWS NOTES README THANKS"

src_prepare() {
	python_convert_shebangs 2 scripts/mpop-gnome-tool/mpop-gnome-tool.py
}

src_configure() {
	econf \
		$(use_with gnome-keyring ) \
		$(use_with i# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/net-mail/mpop/mpop-1.0.27.ebuild,v 1.2 2012/05/03 04:18:36 jdhore Exp $

EAPI="4"

inherit python

DESCRIPTION="A small, fast, and portable POP3 client"
HOMEPAGE="http://mpop.sourceforge.net/"
SRC_URI="mirror://sourceforge/${PN}/${P}.tar.bz2"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="gnome-keyring gnutls idn nls sasl ssl vim-syntax"

RDEPEND="
	gnome-keyring? (
		dev-python/gnome-keyring-python
		gnome-base/libgnome-keyring
	)
	idn? ( net-dns/libidn )
	nls