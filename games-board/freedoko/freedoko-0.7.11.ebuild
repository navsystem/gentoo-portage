# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/games-board/freedoko/freedoko-0.7.11.ebuild,v 1.4 2013/12/24 12:47:38 ago Exp $

EAPI=5
inherit eutils gnome2-utils games

DESCRIPTION="FreeDoko is a Doppelkopf-game"
HOMEPAGE="http://free-doko.sourceforge.net"
SRC_URI="mirror://sourceforge/free-doko/FreeDoko_${PV}.src.zip
	doc? ( mirror://sourceforge/free-doko/FreeDoko_${PV}.manual.zip )
	backgrounds? ( mirror://sourceforge/free-doko/backgrounds.zip -> ${PN}-backgrounds.zip )
	kdecards? ( mirror://sourceforge/free-doko/kdecarddecks.zip )
	xskatcards? ( mirror://sourceforge/free-doko/xskat.zip )
	pysolcards? ( mirror://sourceforge/free-doko/pysol.zip )
	gnomecards? ( mirror://sourceforge/free-doko/gnome-games.zip )
	openclipartcards? ( mirror://sourceforge/free-doko/openclipart.zip )
	!xskatcards? (
		!kdecards? (
			!gnomecards? (
				!openclipartcards? (
					!pysolcards? (
						mirror://sourceforge/free-doko/xskat.zip ) ) ) ) )"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="amd64 ppc x86"
IUSE="+xskatcards +gnomecards +kdecards +openclipartcards +pysolcards +backgrounds net doc"

RDEPEND="net? ( net-libs/gnet dev-libs/glib:2 )
	>=dev-cpp/gtkmm-2.4:2.4"
DEPEND="${RDEPEND}
	app-arch/unzip
	virtual/pkgconfig"

S=${WORKDIR}/FreeDoko_${PV}

src_unpack() {
	local cards=0

	unpack_cards() {
		use $1 && { unpack $2 ; cards=$(( $cards + 1 )); };
	}
	unpack FreeDoko_${PV}.src.zip
	use doc && unpack FreeDoko_${PV}.manual.zip
	cp /dev/null "${S}"/src/Makefile.local

	cd "${S}"/data/cardsets

	unpack_cards xskatcards       xskat.zip
	# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/games-board/freedoko/freedoko-0.7.11.ebuild,v 1.4 2013/12/24 12:47:38 ago Exp $

EAPI=5
inherit eutils gnome2-utils games

DESCRIPTION="FreeDoko is a Doppelkopf-game"
HOMEPAGE="http://free-doko.sourceforge.net"
SRC_URI="mirror://sourceforge/free-doko/FreeDoko_${PV}.src.zip
	doc? ( mirror://sourceforge/free-doko/FreeDoko_${PV}.manual.zip )
	backgrounds? ( mirror://sourceforge/free-doko/backgrounds.zip -> ${PN}-backgrounds.zip )
	kdecards? ( mirror://sourceforge/free-doko/kdecarddecks.zip )
	xskatcards? ( mirror://sourceforge/free-doko/xskat.zip )
	pysolcards? ( mirror://sourceforge/free-doko/pysol.zip )
	gnomecards? ( mirror://sourceforge/free-doko/gnome-games.zip )
	openclipartcards? ( mirror://sourceforge/free-doko/openclipart.zip )
	!xskatcards? (
		!kdecards? (
			!gnomecards? (
				!openclipartcards? (
					!pysolcards? (
						mirror://sourceforge/free-doko/xskat.zip ) ) ) ) )"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="amd64 ppc x86"
IUSE="+xskatcards +gnomecards +kdecards +openclipartcards +pysolcards +backgrounds net doc"

RDEPEND="net? ( net-libs/gnet dev-libs/glib:2 )
	>=dev-cpp/gtkmm-2.4:2.4"
DEPEND="${RDEPEND}
	app-arch/unzip
	virtual/pkg