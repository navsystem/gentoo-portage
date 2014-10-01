# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/sci-mathematics/cgal/cgal-4.3.ebuild,v 1.3 2014/01/06 14:11:39 jlec Exp $

EAPI=5

CMAKE_BUILD_TYPE=Release

inherit multilib cmake-utils

MY_P=CGAL-${PV}
PID=32995
DPID=33000

DESCRIPTION="C++ library for geometric algorithms and data structures"
HOMEPAGE="http://www.cgal.org/ https://gforge.inria.fr/projects/cgal/"
SRC_URI="
	http://gforge.inria.fr/frs/download.php/${PID}/${MY_P}.tar.xz
	doc? ( http://gforge.inria.fr/frs/download.php/${DPID}/${MY_P}-doc_html.tar.xz )"

LICENSE="LGPL-3 GPL-3 Boost-1.0"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~amd64-linux ~x86-linux"
IUSE="doc examples +gmp mpfi qt4"

RDEPEND="
	dev-libs/boost
	dev-libs/mpfr
	sys-libs/zlib
	x11-libs/libX11
	virtual/glu
	virtual/opengl
	gmp? ( dev-libs/gmp[cxx] )
	qt4? (
		dev-qt/qtgui:4
		dev-qt/qtopengl:4
	)
	mpfi? ( sci-libs/mpfi )"
DEPEND="${RDEPEND}
	app-arch/xz-utils
# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/sci-mathematics/cgal/cgal-4.3.ebuild,v 1.3 2014/01/06 14:11:39 jlec Exp $

EAPI=5

CMAKE_BUILD_TYPE=Release

inherit multilib cmake-utils

MY_P=CGAL-${PV}
PID=32995
DPID=33000

DESCRIPTION="C++ library for geometric algorithms and data structures"
HOMEPAGE="http://www.cgal.org/ https://gforge.inria.fr/projects/cgal/"
SRC_URI="
	http://gforge.inria.fr/frs/download.php/${PID}/${MY_P}.tar.xz
	doc? ( http://gforge.inria.fr/frs/download.php/${DPID}/${MY_P}-doc_html.tar.xz )"

LICENSE="LGPL-3 GPL-3 Boost-1.0"
SL