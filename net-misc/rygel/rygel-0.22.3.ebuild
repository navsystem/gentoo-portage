# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/net-misc/rygel/rygel-0.22.3.ebuild,v 1.1 2014/09/04 15:29:57 pacho Exp $

EAPI="5"
GCONF_DEBUG="no"

inherit gnome2 virtualx

DESCRIPTION="Rygel is an open source UPnP/DLNA MediaServer"
HOMEPAGE="https://wiki.gnome.org/Projects/Rygel"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="X +sqlite tracker test transcode"

# The deps for tracker? and transcode? are just the earliest available
# version at the time of writing this ebuild
RDEPEND="
	>=dev-libs/glib-2.34:2
	>=dev-libs/libgee-0.8:0.8
	>=dev-libs/libxml2-2.7:2
	>=media-libs/gupnp-dlna-0.9.4:2.0
	media-libs/gstreamer:1.0
	media-libs/gst-plugins-base:1.0
	media-plugins/gst-plugins-soup:1.0
	>=net-libs/gssdp-0.13
	>=net-libs/gupnp-0.19
	>=net-libs/gupnp-av-0.12.4
	>=net-libs/libsoup-2.44:2.4
	>=sys-apps/util-linux-2.20
	x11-misc/shared-mime# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/net-misc/rygel/rygel-0.22.3.ebuild,v 1.1 2014/09/04 15:29:57 pacho Exp $

EAPI="5"
GCONF_DEBUG="no"

inherit gnome2 virtualx

DESCRIPTION="Rygel is an open source UPnP/DLNA MediaServer"
HOMEPAGE="https://wiki.gnome.org/Projects/Rygel"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="X +sqlite tracker test transcode"

# The deps for tracker? and transcode? are just the earliest available
# version at the time of writing this ebuild
RDEPEND="
	>=dev-libs/glib-2.34:2
	>=dev-libs/libgee-0.8:0.8
	>=dev-libs/libxml2-2.7:2
	>=media-libs/gupnp-dlna-0.9.4:2.0
	media-libs/gstreamer:1.0
	media-libs/gst-plugins-base:1.0
	media-plugins/gst-plugins-soup:1.0
	>=net-libs/gssdp-0.13
	>=net-libs/gupnp-0.19
	>=net-libs/gupnp-av-0.12.4
	>=net-libs/libsoup-2.44:2.4
	>=sys-apps/util-linux-2.20
	x11-misc/shared-mime-info
	sqlite? (
		>=dev-db/sqlite-3.5:3
		dev-libs/libunistring
	)
	tracker? ( >=app-misc/tracker-0.16:= )
	transcode? (
		media-libs/gst-plugins-bad:1.0
		media-plugins/gst-plugins-twolame:1.0
		media-plugins/gst-plugins-libav:1.0
	)
	X? ( >=x11-libs/gtk+-3:3 )
"
DEPEND="${RDEPEND}
	dev-util/gtk-doc-am
	>=dev-util/intltool-0.40
	sys-devel/gettext
	virtual/pkgconfig
"
# Maintainer only
#	>=dev-lang/v