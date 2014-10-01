# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/net-libs/libbtbb/libbtbb-2014.02.2.ebuild,v 1.2 2014/07/04 21:30:36 zerochaos Exp $

EAPI=5

inherit multilib cmake-utils

DESCRIPTION="A library to decode Bluetooth baseband packets"
HOMEPAGE="http://libbtbb.sourceforge.net/"

if [[ ${PV} == "9999" ]] ; then
	EGIT_REPO_URI="https://github.com/greatscottgadgets/libbtbb.git"
	inherit git-r3
	KEYWORDS=""
else
	MY_PV=${PV/\./-}
	MY_PV=${MY_PV/./-R}
	S=${WORKDIR}/${PN}-${MY_PV}
	SRC_URI="https://github.com/greatscottgadgets/${PN}/archive/${MY_PV}.tar.gz"
	KEYWORDS="~amd64 ~arm ~x86"
fi

LICENSE="GPL-2"
SLOT="0/${PV}"
IUSE="+pcap +wireshark-plugins"

RDEPEND="
	wireshark-plugins? (
		dev-libs/glib
		>=net-analyzer/wireshark-1.8.3-r1:=
	)
"
DEPEND="${RDEPEND}
	wireshark-plugins? ( virtual/pkgconfig )"

get_PV() { local pv=$(best_version $1); pv=${pv#$1-}; pv=${pv%-r*}; pv=${pv//_}; echo ${pv}; }

src_prepare(){
	CMAKE_USE_DIR="${S}"
	BUILD_DIR="${S}"_build
	cmake-utils_src_prepare

	if use wireshark-plugins; then
		for i in btbb btle btsm
		do
			sed -i 's#column_info#packet#' wireshark/plugins/${i}/cmake/FindWireshark.cm# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/net-libs/libbtbb/libbtbb-2014.02.2.ebuild,v 1.2 2014/07/04 21:30:36 zerochaos Exp $

EAPI=5

inherit multilib cmake-utils

DESCRIPTION="A library to decode Bluetooth baseband packets"
HOMEPAGE="http://libbtbb.sourceforge.net/"

if [[ ${PV} == "9999" ]] ; then
	EGIT_REPO_URI="https://github.com/greatscottgadgets/libbtbb.git"
	inherit git-r3
	KEYWORDS=""
else
	MY_PV=${PV/\./-}
	MY_PV=${MY_PV/./-R}
	S=${WORKDIR}/${PN}-${MY_PV}
	SRC_URI="https://github.com/greatscottgadgets/${PN}/archive/${MY_PV}.tar.gz"
	KEYWORDS="~amd64 ~arm ~x86"
fi

LICENSE="GPL-2"
SLOT="0/${PV}"
IUSE="+pcap +wireshark-plugins"

RDEPEND="
	wireshark-plugins? (
		dev-libs/glib
		>=net-analyzer/wireshark-1.8.3-r1:=
	)
"
DEPEND="${RDEPEND}
	wireshark-plugins? ( virtual/pkgconfig )"

get_PV() { local pv=$(best_version $1); pv=${pv#$1-}; pv=${pv%-r*}; pv=${pv//_}; echo ${pv}; }

src_prepare(){
	CMAKE_USE_DIR="${S}"
	BUILD_DIR="${S}"_build
	cmake-utils_src_prepare

	if use wireshark-plugins; then
		for i in btbb btle btsm
		do
			sed -i 's#column_info#packet#' wireshark/plugins/${i}/cmake/FindWireshark.cmake || die
			CMAKE_USE_DIR="${S}"/wireshark/plugins/${i}
			BUILD_DIR="${WORKDIR}"/${i}_build
			cmake-utils_src_prepare
		done
	fi
}

src_configure() {
	CMAKE_USE_DIR="${S}"
	BUILD_DIR="${S}"_build
	local mycmakeargs=(
	-DDISABLE_PYTHON=t