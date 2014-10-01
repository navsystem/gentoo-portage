# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/sys-auth/nss-pam-ldapd/nss-pam-ldapd-0.9.4.ebuild,v 1.1 2014/06/15 03:51:12 prometheanfire Exp $

EAPI=5

inherit eutils multilib user

DESCRIPTION="NSS module for name lookups using LDAP"
HOMEPAGE="http://arthurdejong.org/nss-pam-ldapd/"
SRC_URI="http://arthurdejong.org/nss-pam-ldapd/${P}.tar.gz"

LICENSE="LGPL-2.1"
SLOT="0"
KEYWORDS=""
IUSE="debug kerberos sasl +pam"

DEPEND="
	net-nds/openldap
	sasl? ( dev-libs/cyrus-sasl )
	kerberos? ( virtual/krb5 )
	pam? ( virtual/pam )
	!sys-auth/nss_ldap
	!sys-auth/pam_ldap"
RDEPEND="${DEPEND}"

pkg_setup() {
	enewgroup nslcd
	enewuser nslcd -1 -1 -1 nslcd
}

src_prepare() {
	# support user patches
	epatch_user
}

src_configure() {
	# nss libraries always go in /lib on Gentoo
	myconf="
		--enable-warnings
		--with-ldap-lib=openldap
		--with-ldap-conf-file=/etc/nslcd.conf
		# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/sys-auth/nss-pam-ldapd/nss-pam-ldapd-0.9.4.ebuild,v 1.1 2014/06/15 03:51:12 prometheanfire Exp $

EAPI=5

inherit eutils multilib user

DESCRIPTION="NSS module for name lookups using LDAP"
HOMEPAGE="http://arthurdejong.org/nss-pam-ldapd/"
SRC_URI="http://arthurdejong.org/nss-pam-ldapd/${P}.tar.gz"

LICENSE="LGPL-2.1"
SLOT="0"
KEYWORDS=""
IUSE="debug kerberos sasl +pam"

DEPEND="
	net-nds/openldap
	sasl? ( dev-libs/cyrus-sasl )
	kerberos? ( virtual/krb5 )
	pam? ( virtual/pam )
	!sys-auth/nss_ldap
	!sys-auth/pam_ldap"
RDEPEND="${DEPEND}"

pkg_setup() {
	enewgroup nslcd
	enewuser nslcd -1 -1 -1 nslcd
}

src_prepare() {
	# support user patches
	epatch_user
}

src_configure() {
	# nss libraries always go in /lib on Gentoo
	myconf="
		--enable-warnings
		--with-ldap-lib=openldap
		--with-ldap-conf-file=/etc/nslcd.conf
		--with-nslcd-pidfile=/run/nslcd/nslcd.pid
		--with-nslcd-socket=/run/nslcd/socket
		--with-pam-seclib-dir=/$(get_libdir)/security
		--libdir=/$(get_libdir)
		$(use_enable debug)
		$(use_enable