# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

# please keep this ebuild at EAPI 7 -- sys-apps/portage dep
EAPI=7

DISTUTILS_USE_PEP517=flit
PYPI_NO_NORMALIZE=1
PYPI_PN=${PN/-/.}
PYTHON_COMPAT=( python3_{9..11} pypy3 )

inherit distutils-r1 pypi

DESCRIPTION="Text utilities used by other projects by developer jaraco"
HOMEPAGE="
	https://github.com/jaraco/jaraco.text/
	https://pypi.org/project/jaraco.text/
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~alpha amd64 arm arm64 hppa ~ia64 ~loong ~m68k ~mips ppc ppc64 ~riscv ~s390 sparc x86 ~amd64-linux ~x86-linux ~arm64-macos ~ppc-macos ~x64-macos ~sparc-solaris ~sparc64-solaris ~x64-solaris ~x86-solaris"

RDEPEND="
	>=dev-python/jaraco-context-4.1.1-r1[${PYTHON_USEDEP}]
	>=dev-python/jaraco-functools-3.5.0-r1[${PYTHON_USEDEP}]
"
# needed only for CLI tool, make it PDEPEND to reduce pain in setuptools
# bootstrap
PDEPEND="
	dev-python/autocommand[${PYTHON_USEDEP}]
	dev-python/inflect[${PYTHON_USEDEP}]
	dev-python/more-itertools[${PYTHON_USEDEP}]
"
BDEPEND="
	test? (
		${PDEPEND}
		$(python_gen_cond_dep '
			dev-python/pathlib2[${PYTHON_USEDEP}]
		' 3.9)
	)
"

distutils_enable_tests pytest

src_configure() {
	grep -q 'build-backend = "setuptools' pyproject.toml ||
		die "Upstream changed build-backend, recheck"
	# write a custom pyproject.toml to ease setuptools bootstrap
	cat > pyproject.toml <<-EOF || die
		[build-system]
		requires = ["flit_core >=3.2,<4"]
		build-backend = "flit_core.buildapi"

		[project]
		name = "jaraco.text"
		version = "${PV}"
		description = "Module for text manipulation"
	EOF
}

python_install() {
	distutils-r1_python_install
	# rename to workaround a bug in pkg_resources
	# https://bugs.gentoo.org/834522
	mv "${D}$(python_get_sitedir)"/jaraco{_,.}text-${PV}.dist-info || die
}
