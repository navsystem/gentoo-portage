# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/sys-freebsd/freebsd-libexec/freebsd-libexec-8.2.ebuild,v 1.1 2011/07/06 06:01:18 aballier Exp $

EAPI=2

inherit bsdmk freebsd pam

DESCRIPTION="FreeBSD libexec things"
SLOT="0"
KEYWORDS="~sparc-fbsd ~x86-fbsd"

SRC_URI="mirror://gentoo/${LIBEXEC}.tar.bz2
	mirror://gentoo/${UBIN}.tar.bz2
	mirror://gentoo/${BIN}.tar.bz2
	mirror://gentoo/${CONTRIB}.tar.bz2
	mirror://gentoo/${LIB}.tar.bz2
	mirror://gentoo/${ETC}.tar.bz2
	mirror://gentoo/${USBIN}.tar.bz2"

RDEPEND="=sys-freebsd/freebsd-lib-${RV}*
	pam? ( virtual/pam )"
DEPEND="${RDEPEND}
	=sys-freebsd/freebsd-mk-defs-${RV}*
	=sys-freebsd/freebsd-sou# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/sys-freebsd/freebsd-libexec/freebsd-libexec-8.2.ebuild,v 1.1 2011/07/06 06:01:18 aballier Exp $

EAPI=2

inherit bsdmk freebsd pam

DESCRIPTION="FreeBSD libexec things"
SLOT="0"
KEYWORDS="~sparc-fbsd ~x86-fbsd"

SRC_URI="mirror://gentoo/${LIBEXEC}.tar.bz2
	mirror://gentoo/${UBIN}.tar.bz2
	mirror://gentoo/${BIN}.tar.bz2
	mirror://gentoo/${CONTRIB}.tar.bz2
	mirror://gentoo/${LIB}.tar.bz2
	mirror://gentoo/${ETC}.tar.bz2
	mirror://gentoo/${USBIN}.tar.bz2"

RDEPEND="=sys-freebsd/freebsd-lib-${RV}*
	pam? ( virtual/pam )"
DEPEND="${RDEPEND}
	=sys-freebsd/freebsd-mk-defs-${RV}*
	=sys-freebsd/freebsd-sources-${RV}*"
RDEPEND="${RDEPEND}
	xinetd? ( sys-apps/xinetd )"

S="${WORKDIR}/libexec"

PATCHES=( "${FILESDIR}/${PN}-7.2-pic.patch" )
# Remove sendmail, tcp_wrapper and other useless stuff
REMOVE_SUBDIRS="smrsh mail.local tcpd telnetd rshd rlogind lukemftpd ftpd"

IUSE="pam ssl kerberos ipv6 nis xinetd"

pkg_setup() {
	use ipv6 || mymakeopts="${mymakeopts} WITHOUT_IN