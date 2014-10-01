# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/media-libs/ladspa-cmt/ladspa-cmt-1.16.ebuild,v 1.14 2012/11/27 11:55:17 aballier Exp $

inherit eutils multilib toolchain-funcs

IUSE=""

S="${WORKDIR}/cmt/src"
MY_P="cmt_src_${PV}"

DESCRIPTION="CMT (computer music toolkit) Lasdpa library plugins"
HOMEPAGE="http://www.ladspa.org/"
SRC_URI="http://www.ladspa.org/download/${MY_P}.tgz"

KEYWORDS="alpha amd64 hppa ppc ppc64 sparc x86 ~x86-fbsd"
LICENSE="LGPL-2.1"
SLOT="0"

DEPEND="media-libs/ladspa-sdk
	>=sys-apps/# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/media-libs/ladspa-cmt/ladspa-cmt-1.16.ebuild,v 1.14 2012/11/27 11:55:17 aballier Exp $

inherit eutils multilib toolchain-funcs

IUSE=""

S="${WORKDIR}/cmt/src"
MY_P="cmt_src_${PV}"

DESCRIPTION="CMT (computer music toolkit) Lasdpa library plugins"
HOMEPAGE="http://www.ladspa.org/"
SRC_URI="http://www.ladspa.org/download/${MY_P}.tgz"

KEYWORDS="alpha amd64 hppa ppc ppc64 sparc x86 ~x86-fbsd"
LICENSE="LGPL-2.1"
SLOT="0"

DEPEND="media-libs/ladspa-sdk
	>=sys-apps/sed-4"
RDEPEND=""

src_unpack() {
	unpack ${A}
	cd "${S}"

	sed -i \
		-e "/^CFLAGS/ s/-O3/${CFLAGS}/" \
		-e 's|/usr/local/include||g' \
		-e 's|/usr/local/lib||g' makefile \
			|| die "sed 