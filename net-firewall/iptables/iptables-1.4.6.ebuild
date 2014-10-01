# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/net-firewall/iptables/iptables-1.4.6.ebuild,v 1.9 2012/06/26 04:36:01 zmedico Exp $

inherit eutils multilib toolchain-funcs

DESCRIPTION="Linux kernel (2.4+) firewall, NAT and packet mangling tools"
HOMEPAGE="http://www.iptables.org/"
SRC_URI="http://iptables.org/projects/iptables/files/${P}.tar.bz2"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="alpha amd64 arm hppa ia64 m68k ~mips ppc ppc64 s390 sh sparc x86"
IUSE="ipv6"

DEPEND="virtual/os-headers
	!>=sys-kernel/linux-headers-2.6.33"
RDEPEND=""

src_unpack() {
	unpack ${P}.tar.bz2
	cd "${S}"
	epatch_user
}

src_compile() {
	econf \
		--sbindir=/sbin \
		--libexecdir=/$(get_libdir) \
		--enable-devel \
		--e# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/net-firewall/iptables/iptables-1.4.6.ebuild,v 1.9 2012/06/26 04:36:01 zmedico Exp $

inherit eutils multilib toolchain-funcs

DESCRIPTION="Linux kernel (2.4+) firewall, NAT and packet mangling tools"
HOMEPAGE="http://www.iptables.org/"
SRC_URI="http://iptables.org/projects/iptables/files/${P}.tar.bz2"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="alpha amd64 arm hppa ia64 m68k ~mips ppc ppc64 s390 sh sparc x86"
IUSE="ipv6"

DEPEND="virtual/os-headers
	!>=sys-kernel/linux-headers-2.6.33"
RDEPEND=""

src_unp