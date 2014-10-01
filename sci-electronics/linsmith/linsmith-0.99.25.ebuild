# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/sci-electronics/linsmith/linsmith-0.99.25.ebuild,v 1.4 2014/08/10 20:28:03 slyfox Exp $

EAPI=5

inherit eutils autotools

DESCRIPTION="Smith charting program, mainly designed for educational use"
HOMEPAGE="http://www.jcoppens.com/soft/linsmith/index.en.php"
SRC_URI="mirror://sourceforge/${PN}/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE="doc examples"

RDEPEND="
	x11-libs/gtk+:2
	dev-libs/libxml2:2
	dev-libs/glib:2
	dev-libs/atk
	gnome-base/libgnome
	gnome-base/libgnomecanvas
	gnome-base/libgnomeui"
DEPEND="${RDEPEND}
	virtual/pkgconfig"

src_prepare() {
	# This patch is to prevent make install copying
	# the examples in /usr/share/linsmith
	# Now they are cp to the correct location.
	epatch \
		"${FILESDIR}"/${PN}-datafiles.patch
# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/sci-electronics/linsmith/linsmith-0.99.25.ebuild,v 1.4 2014/08/10 20:28:03 slyfox Exp $

EAPI=5

inherit eutils autotools

DESCRIPTION="Smith charting program, mainly designed for educational use"
HOMEPAGE="http://www.jcoppens.com/soft/linsmith/index.en.php"
SRC_URI="mirror://sourceforge/${PN}/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE="doc examples"

RDEPEND="
	x11-libs/gtk+:2
	dev-libs/libxml2:2
	dev-libs/glib:2
	dev-libs/atk
	gnome-base/libgnome
	gnome-base/libgnomecanvas
	gnome-base/libgnomeui"
DEPE