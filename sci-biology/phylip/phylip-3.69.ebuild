# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/sci-biology/phylip/phylip-3.69.ebuild,v 1.3 2010/01/01 21:38:17 fauli Exp $

inherit toolchain-funcs

DESCRIPTION="PHYLIP - The PHYLogeny Inference Package"
LICENSE="freedist"
HOMEPAGE="http://evolution.genetics.washington.edu/phylip.html"
SRC_URI="http://evolution.gs.washington.edu/${PN}/download/${P}.tar.gz"

SLOT="0"
IUSE=""
KEYWORDS="amd64 ~ppc x86 ~amd64-# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/sci-biology/phylip/phylip-3.69.ebuild,v 1.3 2010/01/01 21:38:17 fauli Exp $

inherit toolchain-funcs

DESCRIPTION="PHYLIP - The PHYLogeny Inference Package"
LICENSE="freedist"
HOMEPAGE="http://evolution.genetics.washington.edu/phylip.html"
SRC_URI="http://evolution.gs.washington.edu/${PN}/download/${P}.tar.gz"

SLOT="0"
IUSE=""
KEYWORDS="amd64 ~ppc x86 ~amd64-linux ~x86-linux ~ppc-macos"

RDEPEND="x11-libs/libXaw"

DEPEND="${RDEPEND}
	x11-proto/xproto"

S="${WORKDIR}/${P}/src"

src_compile() {
	sed -e "s/CFLAGS  = -O3 -fomit-frame-pointer/CFLAGS = ${CFLAGS}/" \
		-e "s/CC        = cc/CC        = $(tc-getCC)/" \
		-e "s/DC        = cc/DC        = $(tc-getCC)/" \
		-i Makefile || die "Patching Makefile failed."
	mkdir ../fonts
	emake -j1 all put || die "Compilation failed."
	mv ../exe/font* ../fonts || die "Font move fail