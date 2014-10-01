# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/sci-chemistry/molrep/molrep-11.0.02.ebuild,v 1.10 2013/02/21 22:00:47 jlec Exp $

EAPI=4

inherit eutils fortran-2 multilib toolchain-funcs

DESCRIPTION="molecular replacement program"
HOMEPAGE="http://www.ysbl.york.ac.uk/~alexei/molrep.html"
SRC_URI="mirror://gentoo/${P}.tar.gz"

LICENSE="ccp4"
SLOT="0"
KEYWORDS="amd64 ppc x86 ~amd64-linux ~x86-linux"
IUSE=""

RDEPEND="
	>=sci-libs/ccp4-libs-6.1.3
# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/sci-chemistry/molrep/molrep-11.0.02.ebuild,v 1.10 2013/02/21 22:00:47 jlec Exp $

EAPI=4

inherit eutils fortran-2 multilib toolchain-funcs

DESCRIPTION="molecular replacement program"
HOMEPAGE="http://www.ysbl.york.ac.uk/~alexei/molrep.html"
SRC_URI="mirror://gentoo/${P}.tar.gz"

LICENSE="ccp4"
SLOT="0"
KEYWORDS="amd64 ppc x86 ~amd64-linux ~x86-linux"
IUSE=""

RDEPEND="
	>=sci-libs/ccp4-libs-6.1.3
	sci-libs/mmdb
	virtual/lapack"
DEPEND="${RDEPEND}
	virtual/pkgconfig"

S="${WORKDIR}/${PN}"

src_prepare() {
	epatch \
		"${FILESDIR}"/11.0.00-respect-FLAGS.patch \
		"${FILESDIR}"/11.0.00-test.patch
}

src_co