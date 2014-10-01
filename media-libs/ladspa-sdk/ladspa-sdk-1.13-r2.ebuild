# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/media-libs/ladspa-sdk/ladspa-sdk-1.13-r2.ebuild,v 1.9 2014/01/26 12:14:13 ago Exp $

EAPI=5

inherit eutils multilib toolchain-funcs portability flag-o-matic multilib-minimal

MY_PN=${PN/-/_}
MY_P=${MY_PN}_${PV}

DESCRIPTION="The Linux Audio Developer's Simple Plugin API"
HOMEPAGE="http://www.ladspa.org/"
SRC_URI="http://www.ladspa.org/download/${MY_P}.tgz"

LICENSE="LGPL-2.1"
SLOT="0"
KEYWORDS="alpha amd64 hppa ppc ppc64 sparc x86 ~amd64-fbsd ~x86-fbsd"
IUSE=""

RDEPEND="abi_x86_32? ( !<=app-emulation/emul-linux-x86-soundlibs-20130224-r2
	!app-emulation/emul-linux-x86-soundlibs[-abi_x86_32(-)] )"
DEPEND=">=sys-apps/sed-4"

S="${WORKDIR}/${MY_PN}"

src_prepare() {
	cd "${WORKDIR}/${MY_PN}/src"
	epatch "${FILESDIR}"/${P}-properbuild.patch \
		"${FILESDIR}"/${P}-asneeded.patch \
		"${FILESDIR}"/${P}-fbsd.patch \
		"${FILESDIR}"/${P}-no-LD.patch

	sed -i -e 's:-sndfile-play*:@echo Disabled \0:' \
		makefile || die "sed # Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/media-libs/ladspa-sdk/ladspa-sdk-1.13-r2.ebuild,v 1.9 2014/01/26 12:14:13 ago Exp $

EAPI=5

inherit eutils multilib toolchain-funcs portability flag-o-matic multilib-minimal

MY_PN=${PN/-/_}
MY_P=${MY_PN}_${PV}

DESCRIPTION="The Linux Audio Developer's Simple Plugin API"
HOMEPAGE="http://www.ladspa.org/"
SRC_URI="http://www.ladspa.org/download/${MY_P}.tgz"

LICENSE="LGPL-2.1"
SLOT="0"
KEYWORDS="alpha amd64 hppa ppc ppc64 sparc x86 ~amd64-fbsd ~x86-fbsd"
IUSE=""

RDEPEND="abi_x86_32? ( !<=app-emulation/emul-linux-x86-soundlibs-20130224-r2
	!app-emulation/emul-linux-x86-soun