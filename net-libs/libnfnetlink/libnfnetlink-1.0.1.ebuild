# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/net-libs/libnfnetlink/libnfnetlink-1.0.1.ebuild,v 1.9 2014/08/01 18:48:38 tgall Exp $

EAPI=4
inherit linux-info eutils

DESCRIPTION="the low-level library for netfilter related kernel/userspace communication"
HOMEPAGE="http://www.netfilter.org/projects/libnfnetlink/"
SRC_URI="http://www.netfilter.org/projects/${PN}/files/${P}.tar.bz2"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="alpha amd64 arm arm64 hppa ia64 m68k ~mips ppc ppc64 s390 sh sparc x86"
IUSE="static-libs"

DOCS=( README )

pkg_setup() {
	linux-info_pkg_setup

	if kernel_is lt 2 6 18 ; then
		ewarn "${PN} requires at least 2.6.18 kernel version"
	fi

	#netf# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/net-libs/libnfnetlink/libnfnetlink-1.0.1.ebuild,v 1.9 2014/08/01 18:48:38 tgall Exp $

EAPI=4
inherit linux-info eutils

DESCRIPTION="the low-level library for netfilter related kernel/userspace communication"
HOMEPAGE="http://www.netfilter.org/projects/libnfnetlink/"
SRC_URI="http://www.netfilter.org/projects/${PN}/files/${P}.tar.bz2"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="alpha amd64 arm arm64 hppa ia64 m68k ~mips ppc