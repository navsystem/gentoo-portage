# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/games-action/hotline-miami/hotline-miami-1.0.9a_p20140221.ebuild,v 1.3 2014/06/25 13:03:31 mgorny Exp $

# TODO: unbundle Qt5
#		remove emul-linux-x86* deps (bug 484060)

EAPI=5

inherit eutils games

DESCRIPTION="High-octane action game overflowing with raw brutality"
HOMEPAGE="http://www.devolverdigital.com/games/view/hotline-miami"
SRC_URI="HotlineMiami_linux_1392944501.tar.gz"

LICENSE="all-rights-reserved"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="bundl# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/games-action/hotline-miami/hotline-miami-1.0.9a_p20140221.ebuild,v 1.3 2014/06/25 13:03:31 mgorny Exp $

# TODO: unbundle Qt5
#		remove emul-linux-x86* deps (bug 484060)

EAPI=5

inherit eutils games

DESCRIPTION="High-octane action game overflowing with raw brutality"
HOMEPAGE="http://www.devolverdigital.com/games/view/hotline-miami"
SRC_URI="HotlineMiami_linux_1392944501.tar.gz"

LICENSE="all-rights-reserved"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="bundled-libs +launcher"
RESTRICT="bindist fetch splitdebug"

MYGAMEDIR=${GAMES_PREFIX_OPT}/${PN}
QA_PREBUILT="${MYGAMEDIR#/}/lib/*
	${MYGAMEDIR#/}/Hotline
	${MYGAMEDIR#/}/hotline_launcher"

RDEPEND="
	amd64? (
		|| (
			>=x11-libs/libX11-1.6.2[abi_x86_32(-)]
			app-emulation/emul-linux-x86-xlibs[-abi_x86_32(-)]
		)
		!bundled-libs? (
			media-gfx/nvidia-cg-toolkit[multilib]
			|| (
				( app-emulation/emul-linux-x86-soundlibs[-abi_x86_32(-)] )
				(
					>=media-libs/libogg-1.3.0[abi_x86_32(-)]
					>=media-libs/libvorbis-1.3.3-r1[abi_x86_32(-)]
					>=media-libs/openal-1.15.1[abi_x86_32(-)]
				)
			)
		)
		launcher? (
			|| (
				( app-emulation/emul-linux-x86-xlibs[-abi_x86_32(-)] )
				(
					>=media-libs/freetype-2.5.0.1[abi_x86_32(-)]
					>=x11-libs/libXext-1.3.2[abi_x86_32(-)]
					>=x11-libs/libXrandr-1.4.2[abi_x86_32(-)]
					>=x11-libs/libXrender-0.9.8[abi_x86_32(-)]
					>=x11-libs/libxcb-1.9.1[abi_x86_32(-)]
				)
			)
		)
	)
	x86? (
		x11-libs/libX11
		!bundled-libs? (
			media-gfx/nvidia-cg-toolkit
			media-libs/libogg
			media-libs/libvorbis
			media-libs/openal
		)
		launcher? (
			media-libs/freetype
			x11-libs/libXext
			x11-libs/libXrandr
			x11-libs/libXrender
			x11-libs/libxcb
		)
	)"

S=${WORKDIR}

pkg_nofetch() {
	einfo "Please buy & download ${SRC_URI} from:"
	einfo "  https://www.humblebundle.co