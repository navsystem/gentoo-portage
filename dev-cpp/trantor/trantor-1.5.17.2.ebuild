EAPI=8

inherit cmake

DESCRIPTION="Non-blocking I/O tcp network lib based on c++14/17"
HOMEPAGE="https://github.com/an-tao/trantor"
SRC_URI="https://gitlab.promobit.loc/ozeron/${P}/-/tags/v${PV} -> ${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

RDEPEND="
	dev-libs/openssl
	dev-libs/spdlog
	dev-libs/libfmt"
DEPEND="${RDEPEND}"

S=${WORKDIR}/${P}-v${PV}

src_configure() {
	local -a mycmakeargs=(
		"-DBUILD_SHARED_LIBS=YES"
		"-DBUILD_DOC=NO"
		"-DBUILD_TESTING=NO"
		"-DBUILD_C-ARES=NO"
		"-DTRANTOR_USE_TLS=openssl"
		"-DUSE_SPDLOG=YES"
	)

	cmake_src_configure
}
