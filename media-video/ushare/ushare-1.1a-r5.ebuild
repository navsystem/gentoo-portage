# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/media-video/ushare/ushare-1.1a-r5.ebuild,v 1.5 2013/02/16 08:36:16 pacho Exp $

EAPI=4
inherit eutils multilib readme.gentoo toolchain-funcs user

DESCRIPTION="uShare is a UPnP (TM) A/V & DLNA Media Server"
HOMEPAGE="http://ushare.geexbox.org/"
SRC_URI="http://ushare.geexbox.org/releases/${P}.tar.bz2"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE="dlna nls"

RDEPEND=">=net-libs/libupnp-1.6.14
	dlna? ( >=media-libs/libdlna-0.2.4 )"
DEPEND="${RDEPEND}
	virtual/pkgconfig"

src_prepare() {
	EPATCH_SOURCE="${FILESDIR}" EPATCH_SUFFIX="patch" \
		EPATCH_OPTS="-p1" epatch

# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/media-video/ushare/ushare-1.1a-r5.ebuild,v 1.5 2013/02/16 08:36:16 pacho Exp $

EAPI=4
inherit eutils multilib readme.gentoo toolchain-funcs user

DESCRIPTION="uShare is a UPnP (TM) A/V & DLNA Media Server"
HOMEPAGE="http://ushare.geexbox.org/"
SRC_URI="http://ushare.geexbox.org/releases/${P}.tar.bz2"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE="dlna nls"

RDEPEND=">=net-libs/libupnp-1.6.14
	dlna? ( >=media-libs/libdlna-0.2.4 )"
DEPEND="${RDEPEND}
	virtual/pkgconfig"

src_prepare() {
	EPATCH_SOURCE="${FILESDIR}" EPATCH_SUFFIX="patch" \
		EPATCH_OPTS="-p1" epatch

	DOC_CONTENTS="Please edit /etc/conf.d/ushare to set the shared d