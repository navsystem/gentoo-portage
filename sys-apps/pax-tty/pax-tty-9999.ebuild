# Copyright 1999-2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit linux-mod-r1 git-r3

DESCRIPTION="Kernel module for PAX Pos terminals"
HOMEPAGE="https://github.com/eegorov/pax-tty/"
EGIT_REPO_URI="https://github.com/eegorov/pax-tty.git"

S=${WORKDIR}/${P}

LICENSE="GPL-2+"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE=""


src_compile() {
	local modlist=( ttyPos=extra )
	linux-mod-r1_src_compile
}
