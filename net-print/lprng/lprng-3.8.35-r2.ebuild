# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/net-print/lprng/lprng-3.8.35-r2.ebuild,v 1.1 2013/05/05 07:09:26 mgorny Exp $

EAPI=4

inherit eutils flag-o-matic

MY_PN=LPRng
DESCRIPTION="Extended implementation of the Berkeley LPR print spooler"
HOMEPAGE="http://www.lprng.com/"
SRC_URI="ftp://ftp.lprng.com/pub/${MY_PN}/${MY_PN}/${MY_PN}-${PV}.tgz"

LICENSE="|| ( GPL-2 Artistic )"
SLOT="0"
KEYWORDS="alpha amd64 arm hppa ia64 ~mips ppc ppc64 sh sparc x86"
IUSE="foomaticdb kerberos nls ssl"

RDEPEND="sys-process/procps
	ssl? ( dev-libs/openssl )
	foomaticdb? ( net-print/foomatic-filters net-print/foomatic-db )
	!>=net-print/cups-1.6.2-r4[-lprng-compat]
	!<net-print/cups-1.6.2-r4"
DEPEND="${RDEPEND}
	nls? ( sys-devel/gettext )
	kerberos? ( app-crypt/mit-krb5 )"

S=${WORKDIR}/${MY_PN}-${PV}

src_prepare() {
	epatch "${FILESDIR}"/${PN}-3.8.27-certs.diff
	epatch "${FILESDIR}"/${PN}-3.8.28-make.diff
	epatch "${FILESDIR}"/${PN}-3.8.28-krb.diff
}

src_configure() {
	# wont compile with -O3, needs -O2
	replace-f# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/net-print/lprng/lprng-3.8.35-r2.ebuild,v 1.1 2013/05/05 07:09:26 mgorny Exp $

EAPI=4

inherit eutils flag-o-matic

MY_PN=LPRng
DESCRIPTION="Extended implementation of the Berkeley LPR print spooler"
HOMEPAGE="http://www.lprng.com/"
SRC_URI="ftp://ftp.lprng.com/pub/${MY_PN}/${MY_PN}/${MY_PN}-${PV}.tgz"

LICENSE="|| ( GPL-2 Artistic )"
SLOT="0"
KEYWORDS="alpha amd64 arm hppa ia64 ~mips ppc ppc64 sh sparc x86"
IUSE="foomaticdb kerberos nls ssl"

RDEPEND="sys-process/procps
	ssl? ( dev-libs/openssl )
	foomaticdb? ( net-print/foomatic-filters net-print/foomatic-db )
	!>=net-print/cups-1.6.2-r4[-lprng-compat]
	!<net-print/cups-1.6.2-r4"
DEPEND="${RDEPEND}
	nls? ( sys-devel/gettext )
	kerberos? ( app-crypt/mit-krb5 )"

S=${WORKDIR}/${MY_PN}-${PV}

src_prepare() {
	epatch "${FILESDIR}"/${PN}-3.8.27-certs.d