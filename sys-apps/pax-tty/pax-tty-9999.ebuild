# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit linux-mod git-r3

DESCRIPTION="Kernel module for PAX Pos terminals"
HOMEPAGE="https://github.com/eegorov/pax-tty/"
EGIT_REPO_URI="https://github.com/eegorov/pax-tty.git"

MODULE_NAMES="ttyPos(extra:${S}:${S}"
BUILD_TARGETS=modules

S=${WORKDIR}/${P}

LICENSE="GPL-2+"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE=""


src_compile() {
	linux-mod_src_compile
}