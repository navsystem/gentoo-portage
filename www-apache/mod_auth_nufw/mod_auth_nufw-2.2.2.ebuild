# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/www-apache/mod_auth_nufw/mod_auth_nufw-2.2.2.ebuild,v 1.3 2014/08/10 20:14:07 slyfox Exp $

EAPI="2"

inherit autotools confutils apache-module

DESCRIPTION="A NuFW authentication module for Apache"
HOMEPAGE="http://software.inl.fr/trac/wiki/EdenWall/mod_auth_nufw"
SRC_URI="http://software.inl.fr/releases/${PN}/${P}.tar.bz2"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="+mysql postgres"

DEPEND="mysql? ( virtual/mysql )
	postgres? ( dev-db/postgresql-server )"
RDEPEND="${DEPEND}"

APACHE2_MOD_FILE="mod_auth_nufw.so"# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/www-apache/mod_auth_nufw/mod_auth_nufw-2.2.2.ebuild,v 1.3 2014/08/10 20:14:07 slyfox Exp $

EAPI="2"

inherit autotools confutils apache-module

DESCRIPTION="A NuFW authentication module for Apache"
HOMEPAGE="http://software.inl.fr/trac/wiki/EdenWall/mod_auth_nufw"
