# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/media-libs/libofa/libofa-0.9.3-r1.ebuild,v 1.8 2014/09/15 08:21:35 ago Exp $

EAPI=5

inherit eutils flag-o-matic multilib-minimal

DESCRIPTION="Open Fingerprint Architecture"
HOMEPAGE="http://code.google.com/p/musicip-libofa/"
SRC_URI="http://musicip-libofa.googlecode.com/files/${P}.tar.gz"

LICENSE="|| ( APL-1.0 GPL-2 )"
SLOT="0"
KEYWORDS="alpha amd64 hppa ppc ppc64 sparc x86 ~amd64-linux ~x86-linux"
IUSE=""

RDEPEND="dev-libs/expat
	net-misc/curl
	>=sci-libs/fftw-3.3.3-r2[${MULTILIB_USEDEP}]"
DEPEND="${RDEPEND}
	>=virtual/pkgconfig-0-r1[${MULTILIB_USEDEP}]"
RDEPEND="${RDEPEND}
	abi_x86_32? ( !<=app-emulation/emul-linux-x86-medialibs-201405# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/media-libs/libofa/libofa-0.9.3-r1.ebuild,v 1.8 2014/09/15 08:21:35 ago Exp $

EAPI=5

inherit eutils flag-o-matic multilib-minimal

DESCRIPTION="Open Fingerprint Architecture"
HOMEPAGE="http://code.google.com/p/musicip-libofa/"
SRC_URI="http://musicip-libofa.googlecode.com/files/${P}.tar.gz"

LICENSE="|| ( APL-1.0 GPL-2 )"
SLOT="0"
KEYWORDS="alpha amd64 hppa ppc ppc64 sparc x86 ~amd64-linux ~x86-linux"
IUSE=""

RDEPEND="dev-libs/expat
	net-misc/curl
	>=sci-libs/fftw-3.3.3-r2[${MULTILIB_USEDEP}]"
DEPEND="${RDEPEND}
	>=virtual/pkgconfig-0-r1[