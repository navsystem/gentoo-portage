# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/xfce-extra/xfce-theme-manager/xfce-theme-manager-0.3.5.ebuild,v 1.1 2014/03/21 07:37:00 ssuominen Exp $

EAPI=5
inherit xfconf

MY_PN=Xfce-Theme-Manager
MY_P=${MY_PN}-${PV}

DESCRIPTION="An alternative theme manager for The Xfce Desktop Environment"
HOMEPAGE="http://keithhedger.hostingsiteforfree.com/pages/apps.html#themeed"
SRC_URI="http://keithhedger.hostingsiteforfree.com/zips/xfc# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/xfce-extra/xfce-theme-manager/xfce-theme-manager-0.3.5.ebuild,v 1.1 2014/03/21 07:37:00 ssuominen Exp $

EAPI=5
inherit xfconf

MY_PN=Xfce-Theme-Manager
MY_P=${MY_PN}-${PV}

DESCRIPTION="An alternative theme manager for The Xfce Desktop Environment"
HOMEPAGE="http://keithhedger.hostingsiteforfree.com/pages/apps.html#themeed"
SRC_URI="http://keithhedger.hostingsiteforfree.com/zips/xfcethememanager/${MY_P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND=">=dev-libs/glib-2.30
	>=x11-libs/gtk+-2.24:2
	x11-libs/libXcursor
	>=xfce-base/libxfce4ui-4.10
	>=xfce-base/xfconf-4.10
	>=xfce-base/xfdesktop-4.10"
DEPEND="${RDEPEND}
	virtual/pkgconfig"

S=${WORKDIR}/${MY_P}

pkg_setup() {
	DOCS=( ChangeLog )
}

src_prepare() {
	sed -i \
		-e '/^Ca