# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/net-proxy/squidguard/squidguard-1.4-r4.ebuild,v 1.11 2014/08/10 20:35:44 slyfox Exp $

EAPI=2
WANT_AUTOMAKE=none

inherit eutils autotools user

DESCRIPTION="Combined filter, redirector and access controller plugin for Squid"
HOMEPAGE="http://www.squidguard.org"
SRC_URI="http://www.squidguard.org/Downloads/squidGuard-${PV}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="amd64 ~arm ppc ppc64 sparc x86"
IUSE="ldap"

RDEPEND=">=sys-libs/db-2
	ldap? ( net-nds/openldap )"
DEPEND="${RDEPEND}
	sys-devel/bison
	sys-devel/flex"

S="${WORKDIR}/squidGuard-${PV}"

pkg_setup() {
	enewgroup squid 31
	enewuser squid 31 -1 /var/cache/squid squid
}

src_prepare() {
	epatch "${FILESDIR}/${P}-gentoo.patch"
	epatch "${FILESDIR}/${P}-autoheader.patch"
	epatch "${FILESDIR}/${P}-vsnprintf.patch"
	epatch "${FILESDIR}/${P}-cross-compile.patch"
	epatch "${FILESDIR}/${P}-upstream-fixes.patch"
	eautoreconf
}

src_configure() {
	econf \
		$(use_with ldap) \
		--with-sg-config=/etc/squidGuard/squidGuard.conf \
		--with-sg-logdir=/var/log/squidGuard \
		|| die "configure has failed"
}

src_install() {
	emake prefix="/usr" INSTDIR="${D}" in# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/net-proxy/squidguard/squidguard-1.4-r4.ebuild,v 1.11 2014/08/10 20:35:44 slyfox Exp $

EAPI=2
WANT_AUTOMAKE=none

inherit eutils autotools user

DESCRIPTION="Combined filter, redirector and access controller plugin for Squid"
HOMEPAGE="http://www.squidguard.org"
SRC_URI="http://www.squidguard.org/Downloads/squidGuard-${PV}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="amd64 ~arm ppc ppc64 sparc x86"
IUSE="ldap"

RDEPEND=">=sys-libs/db-2
	ldap? ( net-nds/openldap )"
DEPEND="${RDEPEND}
	sys-devel/bison
	sys-devel/flex"