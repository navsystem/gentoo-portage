# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( pypy3 python3_{6,7,8,9} )

inherit distutils-r1

DESCRIPTION="Python interface to LevelDB"
HOMEPAGE="https://github.com/wbolster/plyvel"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="test"
RESTRICT="!test? ( test )"

RDEPEND=">=dev-libs/leveldb-1.20:="
DEPEND="
	${RDEPEND}
	test? (
		dev-python/pytest[${PYTHON_USEDEP}]
	)
"

distutils_enable_sphinx doc

python_test() {
	# We need to copy the extension to the package folder
	local ext="$(ls "${BUILD_DIR}/lib/${PN}/"*.so | head -n1 || die)"
	ln -s "${ext}" "${PN}" || die
	pytest -vv || die "tests failed with ${EPYTHON}"
	rm "${PN}/$(basename "${ext}")" || die
}
