# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/app-cdr/brasero/brasero-3.11.4.ebuild,v 1.1 2014/09/24 11:28:54 pacho Exp $

EAPI="5"
GCONF_DEBUG="no"
GNOME2_LA_PUNT="yes"

inherit gnome2

DESCRIPTION="CD/DVD burning application for the GNOME desktop"
HOMEPAGE="https://wiki.gnome.org/Apps/Brasero"

LICENSE="GPL-2+ CC-BY-SA-3.0"
SLOT="0/3.1" # subslot is 3.suffix of libbrasero-burn3
IUSE="+css +introspection +libburn mp3 nautilus packagekit playlist test tracker"
KEYWORDS="~alpha ~amd64 ~arm ~ia64 ~ppc ~ppc64 ~sparc ~x86"

COMMON_DEPEND="
	>=dev-libs/glib-2.29.14:2
	>=x11-libs/gtk+-3:3[introspection?]
	media-libs/gstreamer:1.0
	media-libs/gst-plugins-base:1.0
	>=dev-libs/libxml2-2.6:2
	>=x11-libs/libnotify-0.6.1:=

	media-libs/libcanberra[gtk3]
	x11-libs/libICE
	x11-libs/libSM

	introspection? ( >=dev-libs/gobject-introspection-0.6.3 )
	libburn? (
		>=dev-libs/libburn-0.4:=
		>=dev-libs/libisofs-0.6.4:= )
	nautilus? (# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/app-cdr/brasero/brasero-3.11.4.ebuild,v 1.1 2014/09/24 11:28:54 pacho Exp $

EAPI="5"
GCONF_DEBUG="no"
GNOME2_LA_PUNT="yes"

inherit gnome2

DESCRIPTION="CD/DVD burning application for the GNOME desktop"
HOMEPAGE="https://wiki.gnome.org/Apps/Brasero"

LICENSE="GPL-2+ CC-BY-SA-3.0"
SLOT="0/3.1" # subslot is 3.suffix of libbrasero-burn3
IUSE="+css +introspection +libburn mp3 nautilus packagekit playlist test tracker"
KEYWORDS="~alpha ~amd64 ~arm ~ia64 ~ppc ~ppc64 ~sparc ~x86"

COMMON_DEPEND="
	>=dev-libs/glib-2.29.14:2
	>=x11-libs/gtk+-3:3[introspection?]
	media-libs/gstreamer:1.0
	media-libs/gst-plugins-base:1.0
	>=dev-libs/libxml2-2.6:2
	>=x11-libs/libnotify-0.6.1:=

	media-libs/libcanberra[gtk3]
	x11-libs/libICE
	x11-libs/libSM

	introspection? ( >=dev-libs/gobject-introspection-0.6.3 )
	libburn? (
		>=dev-libs/libburn-0.4:=
		>=dev-libs/libisofs-0.6.4:= )
	nautilus? ( >=gnome-base/nautilus-2.91.90 )
	playlist? ( >=dev-libs/totem-pl-parser-2.29.1:= )
	tracker? ( >=app-misc/tracker-0.12:0= )
"
RDEPEND="${COMMON_DEPEND}
	