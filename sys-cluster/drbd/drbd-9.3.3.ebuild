# Copyright 1999-2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI="8"

inherit linux-mod-r1

LICENSE="GPL-2"
KEYWORDS="amd64"

HOMEPAGE="http://www.drbd.org"
DESCRIPTION="mirror/replicate block-devices across a network-connection"
SRC_URI="https://pkg.linbit.com/downloads/drbd/9/${P}.tar.gz"

IUSE=""

DEPEND="
	virtual/linux-sources
	dev-util/coccinelle
        "

SLOT="0"

CONFIG_CHECK="!BLK_DEV_DRBD"
ERROR_BLK_DEV_DRBD="You need to disable CONFIG_BLK_DEV_DRBD in your kernel"

S=${WORKDIR}/${P}/${PN}

src_compile() {
	emake V=1 "${MODULES_MAKEARGS[@]}" KDIR=${KV_OUT_DIR} SPAAS="false" || die
}

src_install() {
	emake \
		V=1 \
		"${MODULES_MAKEARGS[@]}" \
		DESTDIR="${ED}" \
		INSTALL_MOD_PATH="${ED}" \
		INSTALL_MOD_DIR=block \
		install || die

	modules_post_process
}