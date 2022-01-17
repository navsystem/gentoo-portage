# Copyright 2019-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit autotools

DESCRIPTION="Korn Shell Debugger"
HOMEPAGE="https://github.com/rocky/kshdb"
SRC_URI="https://github.com/rocky/kshdb/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-2+"
SLOT="0"
KEYWORDS="~amd64 ~ppc64"

RDEPEND="app-shells/ksh"

src_prepare() {
	default
	eautoreconf
}

src_test() {
	emake check-unit
}
