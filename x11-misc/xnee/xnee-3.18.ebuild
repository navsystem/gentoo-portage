# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/x11-misc/xnee/xnee-3.18.ebuild,v 1.2 2014/08/10 20:05:05 slyfox Exp $

EAPI=5

inherit autotools eutils

DESCRIPTION="Program suite to record, replay and distribute user actions"
HOMEPAGE="http://www.sandklef.com/xnee/"
SRC_URI="mirror://gnu/${PN}/${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="gnome static-libs xosd"

RDEPEND="
	x11-libs/libX11
	x11-libs/libXau
	x11-libs/libXdmcp
	x11-libs/libXext
	x11-libs/libXi
	x11-libs/libXtst
	x11-libs/libxcb
	gnome? (
		x11-libs/gtk+:2
		>=gnome-base/libgnomeui-2
		>=gnome-base/gconf-2
	)
"
DEPEND="${RDEPEND}
	x11-proto/inputproto
	virtual/pkgconfig
	sys-devel/gettext
	gnome? ( || (
			media-gfx/imagemagick[jpeg,png]
			media-gfx/graphicsmagick[imagemagick,jpeg,png]
	) )
"

# This needs RECORD extension from X.org server which isn'# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/x11-misc/xnee/xnee-3.18.ebuild,v 1.2 2014/08/10 20:05:05 slyfox Exp $

EAPI=5

inherit autotools eutils

DESCRIPTION="Program suite to record, replay and distribute user actions"
HOMEPAGE="http://www.sandklef.com/xnee/"
SRC_URI="mirror://gnu/${PN}/${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="gnome static-libs xosd"

RDEPEND="
	x11-libs/libX11
	x11-libs/libXau
	x11-libs/libXdmcp
	x11-libs/libXext
	x11-libs/libXi
	x11-libs/libXtst
	x11-libs/libxcb
	gnome? (
		x11-libs/gtk+:2
		>=gnome-base/libgn