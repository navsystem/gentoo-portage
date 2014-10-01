# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-embedded/libftdi/libftdi-0.19.ebuild,v 1.3 2011/10/20 15:40:57 vapier Exp $

EAPI="2"

if [[ ${PV} == 9999* ]] ; then
	EGIT_REPO_URI="git://developer.intra2net.com/${PN}"
	inherit git-2 autotools
else
	SRC_URI="http://www.intra2net.com/en/developer/${PN}/download/${P}.tar.gz"
	KEYWORDS="amd64 arm ppc ppc64 sparc x86"
fi

DESCRIPTION="Userspace access to FTDI USB interface chips"
HOMEPAGE="http://www.int# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-embedded/libftdi/libftdi-0.19.ebuild,v 1.3 2011/10/20 15:40:57 vapier Exp $

EAPI="2"

if [[ ${PV} == 9999* ]] ; then
	EGIT_REPO_URI="git://developer.intra2net.com/${PN}"
	inherit git-2 autotools
else
	SRC_URI="http://www.intra2net.com/en/developer/${PN}/download/${P}.tar.gz"
	KEYWORDS="amd64 arm ppc ppc64 sparc x86"
fi

DESCRIPTION="Userspace access to FTDI USB interface chips"
HOMEPAGE="http://www.intra2net.com/en/developer/libftdi/"

LICENSE="LGPL-2"
SLOT="0"
IUSE="cxx doc examples python static-libs"

RDEPEND="virtual/libusb:0
	cxx? ( dev-libs/boost )
	python? ( dev-lang/python )"
DEPEND="${RDEPEND}
	doc? ( app-d