# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-db/virtuoso-server/virtuoso-server-6.1.6.ebuild,v 1.7 2014/03/07 03:28:22 creffett Exp $

EAPI=4

inherit virtuoso

DESCRIPTION="Server binaries for Virtuoso, high-performance object-relational SQL database"

KEYWORDS="amd64 ~arm ppc ppc64 x86 ~amd64-fbsd ~x86-fbsd ~amd64-linux ~x86-linux"
IUSE="kerberos ldap readline"

# Bug 305077
RESTRICT="test"

# zeroconf support looks like broken - disabling - last checked around 5.0.12
# mono support fetches mono source and compiles it manually - disabling for now
# mono? ( dev-lang/mono )
COMMON_DEPEND="
	dev-libs/libxml2:2
	>=dev-libs/openssl-0.9.7i:0
	>=sys-libs/zlib-1.2.5.1-r2:0[minizip]
	kerberos? ( app-crypt/mit-krb5 )
	ldap? ( net-nds/openldap )
	readline? ( sys-libs/readline:0 )
"
DEPEND="${COMMON_DEPEND}
	>=dev-util/gperf-2.7.2
	sys-apps/gawk
	>=sys-devel/bison-# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-db/virtuoso-server/virtuoso-server-6.1.6.ebuild,v 1.7 2014/03/07 03:28:22 creffett Exp $

EAPI=4

inherit virtuoso

DESCRIPTION="Server binaries for Virtuoso, high-performance object-relational SQL database"

KEYWORDS="amd64 ~arm ppc ppc64 x86 ~amd64-fbsd ~x86-fbsd ~amd64-linux ~x86-linux"
IUSE="kerberos ldap readline"

# Bug 305077
RESTRICT="test"

# zeroconf support looks like broken - disabling - last checked around 5.0.12
# mono support fetches mono source and compiles it manually - disabling for now
# mono? ( dev-lang/mono )
COMMON_DEPEND="
	dev-libs/libxml2:2
	>=dev-libs/openssl-0.9.7i:0
	>=sys-libs/zlib-1.2.5.1-r2:0[minizip]
	kerberos? ( app-crypt/mit-krb5 )
	ldap? ( net-nds/openldap )
	readline? ( sys-libs/readline:0 )
"
DEPEND="${COMMON_DEPEND}
	>=dev-util/gperf-2.7.2
	sys-apps/gawk
	>=sys-devel/bison-2.3
	>=sys