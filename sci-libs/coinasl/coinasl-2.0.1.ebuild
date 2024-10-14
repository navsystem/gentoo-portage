# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="Ampl Solver Library (ASL)"
HOMEPAGE="https://github.com/coin-or-tools/ThirdParty-ASL"
SOLVERS_SHA="64919f75f"
SRC_URI="https://coin-or-tools.github.io/ThirdParty-ASL/solvers-${SOLVERS_SHA}.tgz
	https://github.com/coin-or-tools/ThirdParty-ASL/archive/refs/tags/releases/${PV}.tar.gz -> ${P}.tar.gz"
S="${WORKDIR}/ThirdParty-ASL-releases-${PV}"

LICENSE="EPL-1.0"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~amd64-linux ~x86-linux"

PATCHES=(
	"${FILESDIR}/${P}-getrusage.patch"
	"${FILESDIR}/${P}-dtoa.patch"
)

src_unpack() {
	default
	mv solvers "${S}" || die
}

src_compile() {
	econf --enable-shared
}

src_install() {
	default
	rm "${D}/usr/$(get_libdir)/libcoinasl.la" || die
}
