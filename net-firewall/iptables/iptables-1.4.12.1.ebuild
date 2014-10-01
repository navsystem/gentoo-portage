# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/net-firewall/iptables/iptables-1.4.12.1.ebuild,v 1.8 2012/06/26 04:36:01 zmedico Exp $

EAPI="4"

# Force users doing their own patches to install their own tools
AUTOTOOLS_AUTO_DEPEND=no

inherit eutils multilib toolchain-funcs autotools

DESCRIPTION="Linux kernel (2.4+) firewall, NAT and packet mangling tools"
HOMEPAGE="http://www.iptables.org/"
SRC_URI="http://iptables.org/projects/iptables/files/${P}.tar.bz2"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="alpha amd64 arm hppa ia64 m68k ~mips ppc ppc64 s390 sh sparc x86"
IUSE="ipv6 netlink"

COMMON_DEPEND="
	netlink? ( net-libs/libnfnetlink )
"
DEPEND="
	${COMMON_DEPEND}
	virtual/os-headers
	sys-devel/automake
"
RDEPEND="
	${COMMON_DEPEND}
"

src_prepare() {
	epatch "${FILESDIR}/iptables-1.4.12.1-lm.patch"
	eautomake

	# Only run autotools if user patched something
	epatch_user && eautoreconf || elibtoolize
}

src_configure() {
	sed -i \
		-e "/nfnetlink=[01]/s:=[01]:=$(use netlink && echo 1 || echo 0):" \
		configure || die
	econf \
		--sbindir=/sbin \
		--libexecdir=/$(get_libdir) \
		--enable-devel \
		--enable-libipq \
		--enable-shared \
		--enable-static \
		$(use_enable ipv6)
}

src_compile() {
	emake V=1
}

sr# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/net-firewall/iptables/iptables-1.4.12.1.ebuild,v 1.8 2012/06/26 04:36:01 zmedico Exp $

EAPI="4"

# Force users doing their own patches to install their own tools
AUTOTOOLS_AUTO_DEPEND=no

inherit eutils multilib toolchain-funcs autotools

DESCRIPTION="Linux kernel (2.4+) firewall, NAT and packet mangling tools"
HOMEPAGE="http://www.iptables.org/"
SRC_URI="http://iptables.org/projects/iptables/files/${P}.tar.bz2"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="alpha amd64 arm hppa ia64 m68k ~mips ppc ppc64 s390 sh sparc x86"
IUSE="ipv6 netlink"

COMMON_DEPEND="
	netlink? ( net-libs/libnfnetlink )
"
DEPEND="
	${COMMON_DEPEND}
	virtual/os-headers
	sys-devel/automake
"
RDEPEND="
	${COMMON_DEPEND}
"

src_prepare() {
	epatch "${FILESDIR}/iptables-1.4.12.1-lm.patch"
	eautomake

	# Only run 