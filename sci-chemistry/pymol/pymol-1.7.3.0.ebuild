# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/sci-chemistry/pymol/pymol-1.7.3.0.ebuild,v 1.1 2014/09/15 08:20:08 jlec Exp $

EAPI=5

PYTHON_COMPAT=( python2_7 )
PYTHON_REQ_USE="tk"

inherit distutils-r1 fdo-mime versionator

DESCRIPTION="A Python-extensible molecular graphics system"
HOMEPAGE="http://www.pymol.org/"
SRC_URI="
	http://dev.gentoo.org/~jlec/distfiles/${PN}-1.7.0.0.png.xz
	http://dev.gentoo.org/~jlec/distfiles/${P}.tar.xz
"
#	mirror://sourceforge/project/${PN}/${PN}/$(get_version_component_range 1-2)/${PN}-v${PV}.tar.bz2
# git archive -v --prefix=${P}/ master -o ${P}.tar.xz

LICENSE="PSF-2.2"
SLOT="0"
KEYWORDS="~amd64 ~ppc ~x86 ~amd64-linux ~x86-linux ~x64-macos ~x86-macos"
IUSE="apbs web"

DEPEND="
	dev-python/numpy[${PYTHON_USEDEP}]
	dev-python/pmw[${PYTHON_USEDEP}]
	dev-python/pyopengl[${PYTHON_USEDEP}]
	media-libs/freetype:2
	media-libs/glew
	media-libs/libpng
	media-video/mpeg-tools
	sys-libs/zlib
	media-libs/freeglut
	apbs? (
		sci-chemistry/apbs
		sci-chemis# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/sci-chemistry/pymol/pymol-1.7.3.0.ebuild,v 1.1 2014/09/15 08:20:08 jlec Exp $

EAPI=5

PYTHON_COMPAT=( python2_7 )
PYTHON_REQ_USE="tk"

inherit distutils-r1 fdo-mime versionator

DESCRIPTION="A Python-extensible molecular graphics system"
HOMEPAGE="http://www.pymol.org/"
SRC_URI="
	http://dev.gentoo.org/~jlec/distfiles/${PN}-1.7.0.0.png.xz
	http://dev.gentoo.org/~jlec/distfiles/${P}.tar.xz
"
#	mirror://sourceforge/project/${PN}/${PN}/$(get_version_component_range 1-2)/${PN}-v${PV}.tar.bz2
# git archive -v --prefix=${P}/ master -o ${P}.tar.xz

LICENSE="PSF-2.2"
SLOT="0"
KEYWORDS="~amd64 ~ppc ~x86 ~amd64-linux ~x86-linux ~x64-macos ~x86-macos"
IUSE="apbs web"

DEPEND="
	dev-python/numpy[${PYTHON_USEDEP}]
	dev-python/pmw[${PYTHON_USEDEP}]
	dev-python/pyopengl[${PYTHON_USEDEP}]
	media-libs/freetype:2
	media-libs/glew
	media-libs/libpng
	media-video/mpeg-tools
	sys-libs/zlib
	media-libs/freeglut
	apbs? (
		sci-chemistry/apbs
		sci-chemistry/pdb2pqr
		sci-chemistry/pymol-apbs-plugin[${PYTHON_USEDEP}]
	)
	web? ( !dev-python/webpy[${PYTHON_USEDEP}] )"
RDEPEND="${DEPEND}"

S="${WORKDIR}"/${P}/${PN}

python_prepare_all() {
	sed \
		-e "s:\"/usr:\"${EPREFIX}/usr:g" \
		-e "/ext_comp_args/s:=\[.*\]$:= \[\]:g" \
		-e "/import/s:argparse:argparseX:g" \
		-i setup.py || die

	rm ./modules/pmg_tk/startup/apbs_tools.py || die

	sed \
		-e "s:/opt/local:${