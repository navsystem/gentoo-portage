# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/gnome-extra/evolution-data-server/evolution-data-server-3.12.4.ebuild,v 1.3 2014/07/23 15:17:53 ago Exp $

EAPI="5"
GCONF_DEBUG="no"
# python3 not really supported, bug #478678
PYTHON_COMPAT=( python2_7 pypy pypy2_0 )
VALA_MIN_API_VERSION="0.18"
VALA_USE_DEPEND="vapigen"

inherit db-use flag-o-matic gnome2 python-any-r1 vala virtualx

DESCRIPTION="Evolution groupware backend"
HOMEPAGE="https://wiki.gnome.org/Apps/Evolution"

# Note: explicitly "|| ( LGPL-2 LGPL-3 )", not "LGPL-2+".
LICENSE="|| ( LGPL-2 LGPL-3 ) BSD Sleepycat"
SLOT="0/49" # subslot = libcamel-1.2 soname version
IUSE="api-doc-extras +gnome-online-accounts +gtk +introspection ipv6 ldap kerberos vala +weather"
REQUIRED_USE="vala? ( introspection )"

KEYWORDS="~alpha amd64 ~arm ~ia64 ~ppc ~ppc64 ~sparc x86 ~x86-fbsd ~x86-freebsd ~amd64-l# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/gnome-extra/evolution-data-server/evolution-data-server-3.12.4.ebuild,v 1.3 2014/07/23 15:17:53 ago Exp $

EAPI="5"
GCONF_DEBUG="no"
# python3 not really supported, bug #478678
PYTHON_COMPAT=( python2_7 pypy pypy2_0 )
VALA_MIN_API_VERSION="0.18"
VALA_USE_DEPEND="vapigen"

inherit db-use flag-o-matic gnome2 python-any-r1 vala virtualx

DESCRIPTION="Evolution groupware backend"
HOMEPAGE="https://wiki.gnome.org/Apps/Evolution"

# Note: explicitly "|| ( LGPL-2 LGPL-3 )", not "LGPL-2+".
LICENSE="|| ( LGPL-2 LGPL-3 ) BSD Sleepycat"
SLOT="0/49" # subslot = libcamel-1.2 soname version
IUSE="api-doc-extras +gnome-online-accounts +gtk +introspection ipv6 ldap kerberos vala +weather"
REQUIRED_USE="vala? ( introspection )"

KEYWORDS="~alpha amd64 ~arm ~ia64 ~ppc ~ppc64 ~sparc x86 ~x86-fbsd ~x86-freebsd ~amd64-linux ~ia64-linux ~x86-linux ~x86-solaris"

RDEPEND="
	>=app-crypt/gcr-3.4
	>=app-crypt/libsecret-0.5[crypt]
	>=dev-db/sqlite-3.5:=
	>=dev-libs/glib-2.36:2
	>=dev-libs/libgdata-0.10:=
	>=dev-libs/libical-0.43:=
	>=net-libs/libsoup-2.42:2.4
	>=dev-libs/libxml2-2
	>=dev-libs/nspr-4.4:=
	>=dev-libs/nss-3.9:=
	>=sys-libs/db-4:=

	dev-libs/icu:=
	sys-libs/zlib:=
	virtual/libiconv

	gtk? (
		>=app-crypt/gcr-3.4[gtk]
		>=x11-libs/gtk+-3.2:3
	)
	gnome-online-accounts? ( >=net-libs/gnome-online-accounts-3.8 )
	introspection? ( >=dev-libs/gobject-introspection-0.9.12 )
	kerberos? ( virtual/krb5:= )
	ldap? ( >=net-nds/openldap-2:= )
	weather? ( >=dev-libs/libgweather-3.8:2= )
"
DEPEND="${RDEPEND}
	${PYTHON_DEPS}
	dev-util/gperf
	>=dev-util/gtk-doc-am-1.14
	>=dev-util/intltool-0.35.5
	>=gnome-base/gnome-common-3.5.5
	>=sys-devel/gettext-0.17
	virtual/pkgconfig
	vala? ( $(vala_depend) )"
# eautoreconf needs:
#	>=gnome-base/gnome-common-2

# Some tests fail due to missings locales.
# Also, dbus tests are flacky, bugs #397975 #501834
# It looks like a nightmare to disable those for now.
RESTRICT="test"

pkg_setup() {
	python-any-r1_pkg_setup
}

src_prepare() {
	use vala && vala_src_prepare

	# Fix relink issues in src_install
	ELTCONF="--reverse-deps"

	gnome2_src_prepare

	# FIXME: Fix compilation flags crazyness
	sed 's/^\(AM_CFLAGS="\)$WARNING_FLAGS/\1/' \
		-i configure || die "sed failed"
}

src_configure() {
	# /usr/include/db.h is always db-1 on FreeBSD
	# so include the right dir in CPPFLAGS
	appe