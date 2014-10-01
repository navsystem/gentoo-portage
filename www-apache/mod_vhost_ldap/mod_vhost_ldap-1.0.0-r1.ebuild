# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/www-apache/mod_vhost_ldap/mod_vhost_ldap-1.0.0-r1.ebuild,v 1.5 2014/08/10 20:18:29 slyfox Exp $

EAPI="2"

inherit eutils apache-module

DESCRIPTION="An Apache2 module for storing and configuring virtual hosts from LDAP"
HOMEPAGE="http://modvhostldap.alioth.debian.org/"
SRC_URI="http://alioth.debian.org/download.php/1422/${P}.tar.bz2"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

APACHE2_MOD_CONF="99_${PN}"
APACHE2_MOD_DEFINE="VHOST_LDAP LDAP"

DOCFILES="AUTHORS ChangeLog INSTALL README"

DEPEND="=www-servers/apache-2.2*[ldap]"
RDEPEND="${DEPEND}"

need_apache2_2

S="${WORKDIR}/mod-vhost-ldap-${PV}"

src_prepare() {
	epatch "${FILESDIR}"/${P}-apache22.patch
}

src_compile() {
	sed -i "s/MOD_VHOST_LDAP_VERSION/\"$(cat VERSION)\"/g" m# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/www-apache/mod_vhost_ldap/mod_vhost_ldap-1.0.0-r1.ebuild,v 1.5 2014/08/10 20:18:29 slyfox Exp $

EAPI="2"

inherit eutils apache-module

DESCRIPTION="An Apache2 module for storing and configuring virtual hosts from LDAP"
HOMEPAGE="http://modvhostldap.alio