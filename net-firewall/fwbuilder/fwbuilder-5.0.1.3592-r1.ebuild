# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/net-firewall/fwbuilder/fwbuilder-5.0.1.3592-r1.ebuild,v 1.8 2013/03/02 22:49:59 hwoarang Exp $

EAPI="4"

inherit eutils base qt4-r2 multilib autotools

DESCRIPTION="A firewall GUI"
HOMEPAGE="http://www.fwbuilder.org/"
SRC_URI="mirror://sourceforge/fwbuilder/${P}.tar.gz"
LICENSE="GPL-2"
SLOT="0"
KEYWORDS="amd64 ppc ppc64 x86"
IUSE=""

DEPEND=">=dev-qt/qtgui-4.3:4
	dev-libs/openssl
	dev-libs/elfutils"
RDEPEND="${DEPEND}"

PATCHES=(
	"${FILESDIR}/${PN}-5.0# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/net-firewall/fwbuilder/fwbuilder-5.0.1.3592-r1.ebuild,v 1.8 2013/03/02 22:49:59 hwoarang Exp $

EAPI="4"

inherit eutils base qt4-r2 multilib autotools

DESCRIPTION="A firewall GUI"
HOMEPAGE="http://www.fwbuilder.org/"
SRC_URI="mirror://sourceforge/fwbuilder/${P}.tar.gz"
LICENSE="GPL-2"
SLOT="0"
KEYWORDS="amd64 ppc ppc64 x86"
IUSE=""

DEPEND=">=dev-qt/qtgui-4.3:4
	dev-libs/openssl
	dev-libs/elfutils"
RDEPEND="${DEPEND}"

PATCHES=(
	"${FILESDIR}/${PN}-5.0.0.3568-ldflags.patch"
	"${FILESDIR}/${PN}-5.0.1.3592-gcc47.patch"
)

sr