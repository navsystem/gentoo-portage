# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=5

inherit cmake-utils toolchain-funcs

DESCRIPTION="A powerful cross-platform raw image processing program"
HOMEPAGE="http://www.rawtherapee.com/"
SRC_URI="http://rawtherapee.com/shared/source/${P}.tar.xz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="bzip2 openmp"

RDEPEND="bzip2? ( app-arch/bzip2 )
	>=x11-libs/gtk+-2.24.18:2
	>=dev-cpp/gtkmm-2.12:2.4
	>=dev-cpp/glibmm-2.16:2
	dev-libs/expat
	dev-libs/libsigc++:2
	media-libs/libcanberra[gtk]
	media-libs/tiff:0
	media-libs/libpng:0
	media-libs/libiptcdata
	media-libs/lcms:2
	sci-libs/fftw:3.0
	sys-libs/zlib
	virtual/jpeg:0"
DEPEND="${RDEPEND}
	app-arch/xz-utils
	virtual/pkgconfig"

PATCHES=(
	# Upstream patches for fixing build with current libstdc++
	# A newer snapshot/version will make this unneeded
	"${FILESDIR}"/${P}-cxx11.patch
	"${FILESDIR}"/${P}-CVE-2015-3885.patch
	"${FILESDIR}"/${P}-build-cxx11.patch
	"${FILESDIR}"/${P}-build-cxx11-2.patch
	"${FILESDIR}"/${P}-sigc26.patch
)

pkg_pretend() {
	if use openmp ; then
		tc-has-openmp || die "Please switch to an openmp compatible compiler"
	fi
}

src_configure() {
	local mycmakeargs=(
		$(cmake-utils_use openmp OPTION_OMP)
		$(cmake-utils_use_with bzip2 BZIP)
		-DDOCDIR=/usr/share/doc/${PF}
		-DCREDITSDIR=/usr/share/${PN}
		-DLICENCEDIR=/usr/share/${PN}
		-DCACHE_NAME_SUFFIX=""
	)
	cmake-utils_src_configure
}
