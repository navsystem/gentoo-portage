# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/net-libs/gupnp-av/gupnp-av-0.12.5.ebuild,v 1.5 2014/03/09 12:03:14 pacho Exp $

EAPI="5"
GCONF_DEBUG="no"
VALA_MIN_API_VERSION="0.14"
VALA_USE_DEPEND="vapigen"

inherit eutils gnome2 vala

DESCRIPTION="Utility library aiming to ease the handling UPnP A/V profiles"
HOMEPAGE="http://gupnp.org/"

LICENSE="LGPL-2"
SLOT="0/2" # subslot: soname version
KEYWORDS="~alpha amd64 ~arm ~ia64 ~ppc ~ppc64 ~sparc x86"
IUSE="+introspection"

RDEPEND="
	>=dev-libs/glib-2.16:2
	>=net-libs/gssdp-# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/net-libs/gupnp-av/gupnp-av-0.12.5.ebuild,v 1.5 2014/03/09 12:03:14 pacho Exp $

EAPI="5"
GCONF_DEBUG="no"
VALA_MIN_API_VERSION="0.14"
VALA_USE_DEPEND="vapigen"

inherit eutils gnome2 vala

DESCRIPTION="Utility library aiming to ease the handling UPnP A/V profiles"
HOMEPAGE="http://gupnp.org/"

LICENSE="LGPL-2"
SLOT="0/2" # subslot: soname ver