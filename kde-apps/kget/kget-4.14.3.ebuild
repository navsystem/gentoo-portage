# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

KDE_HANDBOOK="optional"
inherit kde4-base

DESCRIPTION="An advanced download manager for KDE"
HOMEPAGE="https://www.kde.org/applications/internet/kget/"
KEYWORDS="amd64 ~arm ppc ppc64 x86 ~amd64-linux ~x86-linux"
IUSE="debug bittorrent gpg mms sqlite webkit"

RDEPEND="
	app-crypt/qca:2[qt4]
	$(add_kdeapps_dep libkonq)
	$(add_kdebase_dep libkworkspace '' 4.11)
	bittorrent? ( >=net-libs/libktorrent-1.0.3 )
	gpg? ( $(add_kdebase_dep kdepimlibs) )
	mms? ( media-libs/libmms )
	sqlite? ( dev-db/sqlite:3 )
	webkit? ( >=kde-misc/kwebkitpart-0.9.6 )
"
DEPEND="${RDEPEND}
	dev-libs/boost
"

src_configure() {
	local mycmakeargs=(
		-DWITH_NepomukCore=OFF
		-DWITH_NepomukWidgets=OFF
		$(cmake-utils_use_with bittorrent KTorrent)
		$(cmake-utils_use_with gpg QGpgme)
		$(cmake-utils_use_with mms LibMms)
		$(cmake-utils_use_with sqlite)
		$(cmake-utils_use_with webkit KWebKitPart)
	)
	kde4-base_src_configure
}
