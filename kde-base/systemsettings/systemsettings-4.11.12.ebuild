# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/kde-base/systemsettings/systemsettings-4.11.12.ebuild,v 1.1 2014/09/16 18:17:26 johu Exp $

EAPI=5

KDE_HANDBOOK="optional"
KMNAME="kde-workspace"
OPENGL_REQUIRED="optional"
VIRTUALX_REQUIRED="test"
VIRTUALDBUS_TEST="true"
inherit kde4-meta

DESCRIPTION="System settings utility"
HOMEPAGE+=" http://userbase.kde.org/System_Settings"
IUSE="debug gtk nepomuk +usb"
KEYWORDS="~amd64 ~arm ~ppc ~ppc64 ~x86 ~x86-fbsd ~amd64-linux ~x86-linux"

COMMONDEPEND="
	app-misc/strigi
	dev-libs/glib:2
	$(add_kdebase_dep kwin)
	$(add_kdebase_dep libkworkspace)
	media-libs/fontconfig
	>=media-libs/freetype-2
	>=x11-libs/libxklavier-3.2
	x11-libs/libX11
	x11-libs/libXcursor
	x11-libs/libXext
	x11-libs/libXfixes
	x11-libs/libXft
	x11-libs/libXi
	x11-libs/libxkbfile
	x11-libs/libXrandr
	x11-libs/libXtst
	opengl? ( virtual/opengl )
	usb? ( virtual/libusb:0 )
"
DEPEND="${COMMONDEPEND}
	x11-proto/kbproto
	x11-proto/xextproto
"
RDEPEND="${COMMONDEPEND}
	sys-libs/timezone-data
	x11-app# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/kde-base/systemsettings/systemsettings-4.11.12.ebuild,v 1.1 2014/09/16 18:17:26 johu Exp $

EAPI=5

KDE_HANDBOOK="optional"
KMNAME="kde-workspace"
OPENGL_REQUIRED="optional"
VIRTUALX_REQUIRED="test"
VIRTUALDBUS_TEST="true"
inherit kde4-meta

DESCRIPTION="System settings utility"
HOMEPAGE+=" http://userbase.kde.org/System_Settings"
IUSE="debug gtk nepomuk +usb"
KEYWORDS="~amd64 ~arm ~ppc ~ppc64 ~x86 ~x86-fbsd ~amd64-linux ~x86-linux"

COMMONDEPEND="
	app-misc/strigi
	dev-libs/glib:2
	$(add_kdebase_dep kwin)
	$(add_kdebase_dep libkworkspace)
	media-libs/fontconfig
	>=media-libs/freetype-2
	>=x11-libs/libxklavier-3.2
	x11-libs/libX11
	x11-libs/libXcursor
	x11-libs/libXext
	x11-libs/libXfixes
	x11-libs/libXft
	x11-libs/libXi
	x11-libs/libxkbfile
	x11-libs/libXrandr
	x11-libs/libXtst
	opengl? ( virtual/opengl )
	usb? ( virtual/libusb:0 )
"
DEPEND="${COMMONDEPEND}
	x11-proto/kbproto
	x11-proto/xextproto
"
RDEPEND="${COMMONDEPEND}
	sys-libs/timezone-data
	x11-app