# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/x11-wm/i3/i3-4.8.ebuild,v 1.4 2014/09/24 19:43:35 maekke Exp $

EAPI=5

inherit eutils toolchain-funcs

DESCRIPTION="An improved dynamic tiling window manager"
HOMEPAGE="http://i3wm.org/"
SRC_URI="http://i3wm.org/downloads/${P}.tar.bz2"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE="+pango"

CDEPEND="dev-libs/libev
	dev-libs/libpcre
	>=dev-libs/yajl-2.0.3
	x11-libs/libxcb
	x11-libs/libX11
	x11-libs/startup-notification
	x11-libs/xcb-util
	x11-libs/xcb-util-cursor
	x11-libs/x# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/x11-wm/i3/i3-4.8.ebuild,v 1.4 2014/09/24 19:43:35 maekke Exp $

EAPI=5

inherit eutils toolchain-funcs

DESCRIPTION="An improved dynamic tiling window manager"
HOMEPAGE="http://i3wm.org/"
SRC_URI="http://i3wm.org/downloads/${P}.tar.bz2"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE="+pango"

CDEPEND="dev-libs/libev
	dev-libs/libpcre
	>=dev-libs/yajl-2.0.3
	x11-libs/libxcb
	x11-libs/libX11
	x11-libs/startup-notification
	x11-libs/xcb-util
	x11-libs/xcb-util-cursor
	x11-libs/xcb-util-keysyms
	x11-libs/xcb-util-wm
	pango? (
		>=x11-libs/pango-1.30.0[X]
		>=x11-libs/cairo-1.12.2[X,xcb]
	)"
DEPEND="${CDEPEND}
	virtual/pkgconfig"
RDEPEND="${CDEPEND}
	dev-lang/perl
	dev-perl/AnyEvent-I3
	dev-perl/JSON-XS"

DOCS=( RELEASE-NOTES-${PV} )

src_prepare() {
	if ! 