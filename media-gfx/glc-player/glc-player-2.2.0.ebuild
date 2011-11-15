# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: glc-player-2.1.0.ebuild $

EAPI="2"

inherit qt4-r2

SRC_URI="mirror://sourceforge/${PN}/GLC_Player_src_${PV}.zip"

DESCRIPTION="Open Source 3D viewer used to view 3d models"
HOMEPAGE="http://www.glc-player.net/"
LICENSE="GPL-2"
SLOT="0"
KEYWORDS="-*"
IUSE="debug"

DEPEND=">=media-libs/glc-lib-2.1.0"

RDEPEND=${DEPEND}

S="${WORKDIR}/GLC_Player_src_${PV}"

#src_configure() {
#	sed "/TARGET/s/glc_player/${PN}/" -i ${project_file} || die
#}
#
#src_install(){
#	insinto /usr
#	dobin ${PN} || die
#}
