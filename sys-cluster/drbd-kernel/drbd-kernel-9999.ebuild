# Copyright 1999-2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI="8"

inherit linux-mod-r1 git-r3

LICENSE="GPL-2"
KEYWORDS="amd64"

HOMEPAGE="http://www.drbd.org"
DESCRIPTION="mirror/replicate block-devices across a network-connection"
EGIT_REPO_URI="https://github.com/LINBIT/drbd.git"

DEPEND="
	virtual/linux-sources
	dev-util/coccinelle
	"

SLOT="0"

CONFIG_CHECK="!BLK_DEV_DRBD"
ERROR_BLK_DEV_DRBD="You need to disable CONFIG_BLK_DEV_DRBD in your kernel"

S=${WORKDIR}/${P}/drbd

src_prepare() {
	sed -i Kbuild.drbd-module-sources -e "s:ifdef __drbd-module-sources:ifeq (0,1):" || die
	sed -i Makefile.cocci-sources -e "s:ifdef __git_ls_sources:ifeq (0,1):" || die
	default
}

src_compile() {
	emake V=1 ARCH=x86_64 KDIR=${KV_OUT_DIR} SPAAS="false" || die
}

src_install() {
	emake \
		V=1 \
		"${MODULES_MAKEARGS[@]}" \
		ARCH=x86_64 \
		DESTDIR="${ED}" \
		INSTALL_MOD_PATH="${ED}" \
		INSTALL_MOD_DIR=block \
		install || die

	modules_post_process
}
