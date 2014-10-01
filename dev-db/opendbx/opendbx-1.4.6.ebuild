# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-db/opendbx/opendbx-1.4.6.ebuild,v 1.3 2014/03/10 21:15:06 swegener Exp $

EAPI="5"

inherit flag-o-matic multilib

DESCRIPTION="OpenDBX - A database abstraction layer"
HOMEPAGE="http://www.linuxnetworks.de/doc/index.php/OpenDBX"
SRC_URI="http://www.linuxnetworks.de/opendbx/download/${P}.tar.gz"

LICENSE="LGPL-2.1"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="bindist firebird +mysql oracle postgres sqlite sqlite3"

DEPEND="mysql? ( virtual/mysql )
	postgres? ( dev-db/postgresql-base )
	sqlite? ( <dev-db/sqlite-3 )
	sqlite3? ( =d# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-db/opendbx/opendbx-1.4.6.ebuild,v 1.3 2014/03/10 21:15:06 swegener Exp $

EAPI="5"

inherit flag-o-matic multilib

DESCRIPTION="OpenDBX - A database abstraction layer"
HOMEPAGE="http://www.linuxnetworks.de/doc/index.php/OpenDBX"
SRC_URI="http://www.linuxnetworks.de/opendbx/download/${P}.tar.gz"

LICENSE="LGPL-2.1"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="bindist firebird +mysql oracle postgres sqlite sqlite3"

DEPEND="mysql? ( virtual/mysql )
	postgres? ( dev-db/postgresql-base )
	sqlite? ( <dev-db/sqlite-3 )
	sqlite3? ( =dev-db/sqlite-3* )
	oracle? ( dev-db/oracle-instantclient-basic )
	firebird? ( dev-db/firebird )"
RDEPEND="${DEPEND}"

REQUIRED_USE="bindist? ( !firebird )"

pkg_setup() {
	if ! ( use firebird || use mysql || use oracle || use postgres || use sqlite || use sqlite3 )
	then
		ewarn "You should enable at least one of the following USE flags:"
		ewarn "firebird, mysql, oracle, postgres, sqlite or sqlite3"
	fi

	if use oracle && [[ ! -d ${ORACLE_HOME} ]]
	then
		die "Oracle support requested, but ORACLE_HOME not set to a valid directory!"
	fi

	use mysql && append-cppflags -I/usr/include/mysql
	use firebird && append-cppflags -I/opt/firebird/include
	use o