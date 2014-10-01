# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/sci-electronics/iverilog/iverilog-0.9.1.ebuild,v 1.6 2010/06/01 11:59:38 ssuominen Exp $

EAPI="2"

inherit eutils multilib

S="${WORKDIR}/verilog-${PV}"

DESCRIPTION="A Verilog simulation and synthesis tool"
SRC_URI="ftp://icarus.com/pub/eda/verilog/v${PV:0:3}/verilog-${PV}.tar.gz"
HOMEPAGE="http://www.icarus.com/eda/verilog/"

DEPEND=""
RDEPEND=""

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="amd64 ppc sparc x86"
IUSE=""

src_prepare() {
	# Fix for bug #172919
	sed -i -e '/#  include <asm\/page.h>/d' vvp/main.cc || die "sed failed"

	# Fix tests
	mkdir -p lib/ivl
	touch lib/ivl/ivl
	sed -i -e 's/driver\/iverilog -B./IVERILOG_ROOT="." driver\/iverilog -B./' Makefile.in || die

	# Fix LDFLAGS
	sed -i -e 's/@shared@/@shared@ $(LDFLAGS)/' {cadpli,tgt-vhdl,tgt-null,tgt-stub,tgt-vvp}/Makefile.in || die "sed faile# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/sci-electronics/iverilog/iverilog-0.9.1.ebuild,v 1.6 2010/06/01 11:59:38 ssuominen Exp $

EAPI="2"

inherit eutils multilib

S="${WORKDIR}/verilog-${PV}"

DESCRIPTION="A Verilog simulation and synthesis tool"
SRC_URI=