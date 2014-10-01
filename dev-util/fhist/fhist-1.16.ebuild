# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-util/fhist/fhist-1.16.ebuild,v 1.7 2012/10/27 17:18:55 armin76 Exp $

DESCRIPTION="File history and comparison tools"
HOMEPAGE="http://fhist.sourceforge.net/fhist.html"
SRC_URI="http://fhist.sourceforge.net/${P}.tar.gz"

SLOT="0"
LICENSE="GPL-2"
KEYWORDS="~ppc x86"
IUSE="test"

RDEPEND="sys-devel/gettext
		sys-apps/groff"
DEPEND="${RDEPEND}
		test? ( app-arch/sharutils )
		sys-devel/bison"

MAKEOPTS+=" -j1"

src_compile() {
	econf
	emake || d# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-util/fhist/fhist-1.16.ebuild,v 1.7 2012/10/27 17:18:55 armin76 Exp $

DESCRIPTION="File history and comparison tools"
HOMEPAGE="http://fhist.sourceforge.net/fhist.html"
SRC_URI="http://fhist.sourceforge