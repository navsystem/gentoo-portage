# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/sys-cluster/ploop/ploop-1.12.ebuild,v 1.1 2014/08/20 17:29:19 maksbotan Exp $

EAPI=5

inherit eutils toolchain-funcs multilib systemd

DESCRIPTION="openvz tool and a library to control ploop block devices"
HOMEPAGE="http://wiki.openvz.org/Download/ploop"
SRC_URI="http://download.openvz.org/utils/ploop/${PV}/src/${P}.tar.bz2"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="deb# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/sys-cluster/ploop/ploop-1.12.ebuild,v 1.1 2014/08/20 17:29:19 maksbotan Exp $

EAPI=5

inherit eutils toolchain-funcs multilib systemd

DESCRIPTION="openvz tool and a library to control ploop block devices"
HOMEPAGE="http://wiki.openvz.org/Download/ploop"
SRC_URI="http://download.openvz.org/utils/ploop/${PV}/src/${P}.tar.bz2"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="debug static-libs"

DEPEND="
	dev-libs/libxml2
	virtual/pkgconfig
	"

RDEPEND="dev-libs/libxml2
	!<sys-cluster/vzctl-4.5
	sys-block/parted
	sys-fs/e2fsprogs
	sys-process/lsof
	sys-apps/findutils
	"

DOCS=( tools/README )

src_prepare() {
	# Respect CFLAGS and CC, do not add debug by default
	sed -i \
		-e 's|CFLAGS =|CFLAGS +=|' \
		-e '/CFLAGS/s/-g -O0 //' \
		-e '/CFLAGS/s/-O2//' \
		-e 's|CC=|CC?=|' \
		-e 's/-W