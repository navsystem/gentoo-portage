# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{10..11} )

inherit distutils-r1 multiprocessing

DESCRIPTION="Low-level, data-driven core of boto 3"
HOMEPAGE="
	https://github.com/boto/botocore/
	https://pypi.org/project/botocore/
"
LICENSE="Apache-2.0"
SLOT="0"

if [[ "${PV}" == "9999" ]]; then
	EGIT_REPO_URI="https://github.com/boto/botocore"
	inherit git-r3
else
	SRC_URI="
		https://github.com/boto/botocore/archive/${PV}.tar.gz
			-> ${P}.gh.tar.gz
	"
	KEYWORDS="amd64 arm arm64 ppc ppc64 ~riscv sparc x86 ~amd64-linux ~x86-linux"
fi

RDEPEND="
	dev-python/six[${PYTHON_USEDEP}]
	<dev-python/jmespath-2[${PYTHON_USEDEP}]
	dev-python/python-dateutil[${PYTHON_USEDEP}]
	>=dev-python/urllib3-1.25.4[${PYTHON_USEDEP}]
"
BDEPEND="
	test? (
		dev-python/jsonschema[${PYTHON_USEDEP}]
		dev-python/pytest-xdist[${PYTHON_USEDEP}]
	)
"

distutils_enable_sphinx docs/source \
	'dev-python/guzzle_sphinx_theme'
distutils_enable_tests pytest

src_prepare() {
	# unpin deps
	sed -i -e "s:>=.*':':" setup.py || die

	# unbundle deps
	rm -r botocore/vendored || die
	find -name '*.py' -exec sed -i \
		-e 's:from botocore[.]vendored import:import:' \
		-e 's:from botocore[.]vendored[.]:from :' \
		{} + || die

	distutils-r1_src_prepare
}

python_test() {
	local EPYTEST_DESELECT=(
		# rely on bundled six
		tests/functional/test_six_imports.py::test_no_bare_six_imports
		tests/functional/test_six_threading.py::test_six_thread_safety
		# fails on unrelated warnings
		tests/unit/test_client.py::TestAutoGeneratedClient::test_BOTO_DISABLE_COMMONNAME
		tests/unit/test_client.py::TestClientErrors::test_BOTO_DISABLE_COMMONNAME
		# TODO
		tests/functional/test_credentials.py::SSOSessionTest::test_token_chosen_from_provider
	)

	epytest tests/{functional,unit} -n "$(makeopts_jobs)"
}
