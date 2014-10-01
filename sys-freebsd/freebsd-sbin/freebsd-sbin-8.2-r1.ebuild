# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/sys-freebsd/freebsd-sbin/freebsd-sbin-8.2-r1.ebuild,v 1.2 2014/07/24 01:58:41 naota Exp $

EAPI=2

inherit bsdmk freebsd

DESCRIPTION="FreeBSD sbin utils"
KEYWORDS="~sparc-fbsd ~x86-fbsd"
SLOT="0"

SRC_URI="mirror://gentoo/${SBIN}.tar.bz2
	mirror://gentoo/${CONTRIB}.tar.bz2
	mirror://gentoo/${LIB}.tar.bz2
	mirror://gentoo/${LIBEXEC}.tar.bz2
	mirror://gentoo/${USBIN}.tar.bz2
	mirror://gentoo/${ETC}.tar.bz2
	build? ( mirror://gentoo/${SYS}.tar.bz2 )"

RDEPEND="=sys-freebsd/freebsd-lib-${RV}*[ipv6?,atm?,netware?]
	=sys-freebsd/freebsd-libexec-${RV}*
	>=dev-libs/expat-2.0.1
	ssl? ( dev-libs/openssl )
	dev-libs/libedit
	sys-libs/readline
	|| (
		sys-process/cronie
		sys-process/vixie-cron
	)
	atm? ( net-analyzer/bsnmp )"
DEPEND="${RDEPEND}
	!build? ( =sys-freebsd/freebsd-sources-${RV}* )
	=sys-freebsd/freebsd-mk-defs-${RV}*"

S="${WORKDIR}/sbin"

IUSE="atm ipfilter +pf ipv6 # Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/sys-freebsd/freebsd-sbin/freebsd-sbin-8.2-r1.ebuild,v 1.2 2014/07/24 01:58:41 naota Exp $

EAPI=2

inherit bsdmk freebsd

DESCRIPTION="FreeBSD sbin utils"
KEYWORDS="~sparc-fbsd ~x86-fbsd"
SLOT="0"

SRC_URI="mirror://gentoo/${SBIN}.tar.bz2
	mirror://gentoo/${CONTRIB}.tar.bz2
	mirror://gentoo/${LIB}.tar.bz2
	mirror://gentoo/${LIBEXEC}.tar.bz2
	mirror://gentoo/${USBIN}.tar.bz2
	mirror://gentoo/${ETC}.tar.bz2
	build? ( mirror://gentoo/${SYS}.tar.bz2 )"

RDEPEND="=sys-freebsd/freebsd-lib-${RV}*[ipv6?,atm?,netware?]
	=sys-freebsd/freebsd-libexec-${RV}*
	>=dev-libs/expat-2.0.1
	ssl? ( dev-libs/openssl )
	dev-libs/libedit
	sys-libs/readline
	|| (
		sys-process/cronie
		sys-process/vixie-cron
	)
	atm? ( net-analyzer/bsnmp )"
DEPEND="${RDEPEND}
	!build? ( =sys-freebsd/freebsd-sources-${RV}* )
	=sys-freebsd/freebsd-mk-defs-${RV}*"

S="${WORKDIR}/sbin"

IUSE="atm ipfilter +pf ipv6 build ssl +cxx netware"

pkg_setup() {
	use atm || mymakeopts="${mymakeopts} WITHOUT_ATM= "
	use cxx || mymakeopts="${mymakeopts} WITHOUT_CXX="
	use ipfilter || mymakeopts="${mymakeopts} WITHOUT_IPFILTER= "
	use ipv6 || mymakeopts="${mymakeopts} WITHOUT_INET6= WITHOUT_INET6_SUPPORT="
	use netware || mymakeopts="${mymakeopts} WITHOUT_IPX= WITHOUT_IPX_SUPPORT= WITHOUT_NCP= "
	use pf || mymakeopts="${mymakeopts} WITHOUT_PF= "
	use ssl || mymakeopts="${mymakeopts} WITHOUT_OPENSSL="
}

REMOVE_SUBDIRS="dhclient pfctl pflogd rcorder"

PATCHES=( "${FILESDIR}/${PN}-setXid.patch"
	"${FILESDIR}/${PN}-7.1-zlib.patch"
	"${FILESDIR}/${PN