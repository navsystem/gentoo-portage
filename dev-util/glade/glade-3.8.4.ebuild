# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-util/glade/glade-3.8.4.ebuild,v 1.12 2014/05/02 08:45:51 pacho Exp $

EAPI="5"
GCONF_DEBUG="yes"
GNOME_ORG_MODULE="glade3"
GNOME2_LA_PUNT="yes"
PYTHON_COMPAT=( python2_{6,7} )

inherit eutils gnome2 python-single-r1

DESCRIPTION="A user interface designer for GTK+ and GNOME"
HOMEPAGE="http://glade.gnome.org/"

LICENSE="GPL-2+ FDL-1.1+"
SLOT="3/11" # subslot = suffix of libgladeui-1.so
KEYWORDS="alpha amd64 arm ia64 ppc ppc64 ~sh sparc x86 ~amd64-fbsd ~x86-fbsd"
IUSE="gnome python"
REQUIRED_USE="python? ( ${PYTHON_REQUIRE# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-util/glade/glade-3.8.4.ebuild,v 1.12 2014/05/02 08:45:51 pacho Exp $

EAPI="5"
GCONF_DEBUG="yes"
GNOME_ORG_MODULE="glade3"
GNOME2_LA_PUNT="yes"
PYTHON_COMPAT=( python2_{6,7} )

inherit eutils gnome2 python-single-r1

DESCRIPTION="A user interface designer for GTK+ and GNOME"
HOMEPAGE="http://glade.gnome.org/"

LICENSE="GPL-2+ FDL-1.1+"
SLOT="3/11" # subslot = suffix of libgladeui-1.so
KEYWORDS="alpha amd64 arm ia64 ppc ppc64 ~sh sparc x86 ~amd