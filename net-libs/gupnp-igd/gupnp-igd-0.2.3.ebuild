# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/net-libs/gupnp-igd/gupnp-igd-0.2.3.ebuild,v 1.1 2014/02/06 22:14:39 eva Exp $

EAPI=5

PYTHON_COMPAT=( python2_7 )
AUTOTOOLS_AUTORECONF=true

inherit autotools-utils gnome.org python-r1

DESCRIPTION="Library to handle UPnP IGD port mapping for GUPnP"
HOMEPAGE="http://gupnp.org"

LICENSE="LGPL-2"
SLOT="0"
KEYWORDS="~alpha ~amd64 ~arm ~hppa ~ia64 ~ppc ~ppc64 ~sparc ~x86"
IUSE="+introspection python"

RDEPEND="
	>=dev-libs/glib-2.26:2
	net-libs/gssdp
	>=net-libs/gupnp-0.18
	introspection? ( >=dev-libs/gobject-introspection-0.10 )
	python? (
		>=dev-libs/gobject-introspection-0.10
		>=dev-python/pygobject-2.16:2[${PYTHON_USEDEP}]
	)"
DEPEND="${RDEPEND}
	dev-util/gtk-doc-am
	sys-devel/gettext
	virtual/pkgconfig
"

# The only existing test is broken
RESTRICT="test"

PATCHES=(
	"${FILESDIR}"/${PN}-0.1.11-disable_static_modules.patch
)

src_prepare() {
	# Python bindings are built/installed manually.
	if use python; then
		sed -e "/PYTHON_SUBDIR =/s/ pytho# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/net-libs/gupnp-igd/gupnp-igd-0.2.3.ebuild,v 1.1 2014/02/06 22:14:39 eva Exp $

EAPI=5

PYTHON_COMPAT=( python2_7 )
AUTOTOOLS_AUTORECONF=true

inherit autotools-utils gnome.org python-r1

DESCRIPTION="Library to handle UPnP IGD port mapping for GUPnP"
HOMEPAGE="http://gupnp.org"

LICENSE="LGPL-2"
SLOT="0"
KEYWORDS="~alpha ~amd64 ~arm ~hppa ~ia64 ~ppc ~ppc64 ~sparc ~x86"
IUSE="+introspection python"

RDEPEND="
	>=dev-libs/glib-2.26:2
	net-libs/gssdp
	>=net-libs/gupnp-0.18
	introspection? ( >=dev-libs/gobject-introspection-0.10 )
	python? (
		>=dev-libs/gobject-introspection-0.10
		>=dev-python/pygobject-2.16:2[${PYTHON_USEDEP}]