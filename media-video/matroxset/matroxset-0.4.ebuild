# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/media-video/matroxset/matroxset-0.4.ebuild,v 1.6 2009/06/02 10:29:45 flameeyes Exp $

inherit toolchain-funcs

IUSE=""

DESCRIPTION="Matrox utility to switch output modes (activate tvout)"
HOMEPAGE="ftp://platan.vc.cvut.cz/pub/linux/matrox-latest/"
SRC_URI="ftp://platan.vc.cvut.cz/pub/linux/matrox-latest/${P}.tar.gz"

DEPEND="sys-libs/ncurses"
RDEPEND="${DEPEND}"

SLOT="0"
LICENSE="GPL-2"
KEYWORDS="amd64 ppc x86"

doecho() {
	echo "$@"
	"$@"
}

src_compile() {
	doecho $(tc-getCC) -o ${PN} \
		# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/media-video/matroxset/matroxset-0.4.ebuild,v 1.6 2009/06/02 10:29:45 flameeyes Exp $

inherit toolchain-funcs

IUSE=""

DESCRIPTION="Matrox utility to switch output modes (activate tvout)"
HOMEPAGE="ftp://platan.vc.cvut.cz/pub/linux/matrox-latest/"
SRC_URI="ftp://