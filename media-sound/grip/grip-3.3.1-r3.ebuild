# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/media-sound/grip/grip-3.3.1-r3.ebuild,v 1.11 2012/11/22 15:31:19 polynomial-c Exp $

EAPI=2
inherit eutils flag-o-matic toolchain-funcs libtool

DESCRIPTION="GTK+ based Audio CD Player/Ripper"
HOMEPAGE="http://sourceforge.net/projects/grip/"
SRC_URI="mirror://sourceforge/grip/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="alpha amd64 ia64 ppc ppc64 sparc x86 ~x86-fbsd"
IUSE="nls vorbis"

RDEPEND=">=x11-libs/gtk+-2.2:2
	x11-libs/vte:0
	media-sound/lame
	media-sound/cdparanoia
	>=media-libs/id3lib-3.8.3
	>=gn# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/media-sound/grip/grip-3.3.1-r3.ebuild,v 1.11 2012/11/22 15:31:19 polynomial-c Exp $

EAPI=2
inherit eutils flag-o-matic toolchain-funcs libtool

DESCRIPTION="GTK+ based Audio CD Player/Ripper"
HOMEPAGE="http://sourceforge.net/projects/grip/"
SRC_URI="mirror://sourceforge/grip/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="alpha amd64 ia64 ppc ppc64 sparc x86 ~x86-fbsd"
IUSE="nls vorbis"

RDEPEND=">=x11-libs/gtk+-2.2:2
	x11-libs/vte:0
	media-sound/lame
	media-sound/cdparanoia
	>=media-libs/id3lib-3.8.3
	>=gnome-base/libgnomeui-2.2.0
	>=gnome-base/orbit-2
	net-misc/curl
	vorbis? ( media-sound/vorbis-tools )"
# gnome-extra/yelp, see bug 416843
DEPEND="${RDEPEND}
	vi