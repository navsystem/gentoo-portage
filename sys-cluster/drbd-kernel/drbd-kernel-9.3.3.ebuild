# Copyright 1999-2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI="8"

inherit linux-mod-r1

LICENSE="GPL-2"
KEYWORDS="amd64"

HOMEPAGE="http://www.drbd.org"
DESCRIPTION="mirror/replicate block-devices across a network-connection"
#SRC_URI="https://pkg.linbit.com/downloads/drbd/9/drbd-9.3.3.tar.gz"
SRC_URI="drdb-9.3.3-compat.zip"

IUSE=""

S=${WORKDIR}

DEPEND="
	virtual/linux-sources
	dev-util/coccinelle
	"

SLOT="0"

RESTRICT="network-sandbox"

src_compile() {
	local modlist=( {drbd,drbd_transport_lb-tcp,drbd_transport_tcp}=block:${S}/drbd:${S}/drbd/build-${KV_FULL} )
	local modargs=( KERN_DIR="${KV_OUT_DIR}" KERN_VER="${KV_FULL}" SPAAS="false" )
	linux-mod-r1_src_compile
}
