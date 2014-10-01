# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/net-voip/telepathy-gabble/telepathy-gabble-0.16.6.ebuild,v 1.9 2013/09/05 19:02:50 mgorny Exp $

EAPI="5"
PYTHON_COMPAT=( python2_{6,7} )

inherit eutils python-any-r1

DESCRIPTION="A Jabber/XMPP connection manager, with handling of single and multi user chats and voice calls"
HOMEPAGE="http://telepathy.freedesktop.org"
SRC_URI="http://telepathy.freedesktop.org/releases/${PN}/${P}.tar.gz"

LICENSE="LGPL-2.1"
SLOT="0"
KEYWORDS="alpha amd64 ~arm ia64 ppc ~ppc64 sparc x86 ~x86-linux"
IUSE="gnutls +jingle test"

# FIXME: missing sasl-2 for tests ? (automagic)
# missing libiphb for wocky ?
RDEPEND="
	>=dev-libs/glib-2.30:2
	>=sys-apps/dbus-1.1.0
	>=dev-libs/dbus-glib-0.82
	>=net-libs/telepathy-glib-0.18

	dev-db/sqlite:3
	dev-libs/libxml2

	gnutls? ( >=net-libs/gnutls-2.10.2 )
	!g# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/net-voip/telepathy-gabble/telepathy-gabble-0.16.6.ebuild,v 1.9 2013/09/05 19:02:50 mgorny Exp $

EAPI="5"
PYTHON_COMPAT=( python2_{6,7} )

inherit eutils python-any-r1

DESCRIPTION="A Jabber/XMPP connection manager, with handling of single and multi user chats and voice calls"
HOMEPAGE="http://telepathy.freedesktop.org"
SRC_URI="http://telepathy.freedesktop.org/releases/${PN}/${P}.tar.gz"

LICENSE="LGPL-2.1"
SLOT="0"
KEYWORDS="alpha amd64 ~arm ia64 ppc ~ppc64 sparc x86 ~x86-linux"
IUSE="gnutls +jingle test"

# FIXME: missing sasl-2 for tests ? (automagic)
# missing libiphb for wocky ?
RDEPEND="
	>=dev-libs/glib-2.30:2
	>=sys-apps/dbus-1.1.0
	>=dev-libs/dbus-glib-0.82
	>=net-libs/telepathy-glib-0.18

	dev