# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/net-wireless/gr-osmosdr/gr-osmosdr-0.1.3.ebuild,v 1.1 2014/08/28 19:58:13 zerochaos Exp $

EAPI=5
PYTHON_COMPAT=( python2_7 )

inherit cmake-utils python-single-r1

DESCRIPTION="GNU Radio source block for OsmoSDR and rtlsdr and hackrf"
HOMEPAGE="http://sdr.osmocom.org/trac/wiki/GrOsmoSDR"

if [[ ${PV} == 9999* ]]; then
	inherit git-r3
	SRC_URI=""
	EGIT_REPO_URI="git://git.osmocom.org/${PN}.git"
	KEYWORDS=""
else
	#git clone git://git.osmocom.org/gr-osmosdr.git
	#cd gr-osmosdr
	#git archive --format=tar --prefix=gr-osmosdr-${PV}/ v${PV} | xz > ../gr-osmosdr-${PV}.tar.xz
	SRC_URI="https://dev.gentoo.org/~zerochaos/distfiles/${P}.tar.xz"
	KEYWORDS="~amd64 ~arm ~x86"
fi

LICENSE="GPL-3"
SLOT="0/${PV}"
IUSE="bladerf fcd hackrf iqbalance mirisdr python rtlsdr uhd"

RDEPEND="${PYTHON_DEPS}
	dev-libs/boost:=
	>=net-wireless/gnuradio-3.7_rc:0=[fcd?,${PYTHON_USEDEP}]
	bladerf? ( net-wireless/bladerf:= )
	hackrf? ( net-libs/libhackrf:= )
	iqbalance? ( net-wireless/gr-iqbal:=[${PYTHON_USEDEP}] )
	mirisdr? ( net-libs/libmirisdr:= )# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/net-wireless/gr-osmosdr/gr-osmosdr-0.1.3.ebuild,v 1.1 2014/08/28 19:58:13 zerochaos Exp $

EAPI=5
PYTHON_COMPAT=( python2_7 )

inherit cmake-utils python-single-r1

DESCRIPTION="GNU Radio source block for OsmoSDR and rtlsdr and hackrf"
HOMEPAGE="http://sdr.osmocom.org/trac/wiki/GrOsmoSDR"

if [[ ${PV} == 9999* ]]; then
	inherit git-r3
	SRC_URI=""
	EGIT_REPO_URI="git://git.osmocom.org/${PN}.git"
	KEYWORDS=""
else
	#git clone git://git.osmocom.org/gr-osmosdr.git
	#cd gr-osmosdr
	#git archive --format=tar --prefix=gr-osmosdr-${PV}/ v${PV} | xz > ../gr-osmosdr-${PV}.tar.xz
	SRC_URI="https://dev.gentoo.org/~zerochaos/di