# Copyright 2022-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{8..11} )

inherit distutils-r1

DESCRIPTION="Travel through time in your tests"
HOMEPAGE="
	https://github.com/adamchainz/time-machine/
	https://pypi.org/project/time-machine/
"
SRC_URI="
	https://github.com/adamchainz/time-machine/archive/${PV}.tar.gz
		-> ${P}.gh.tar.gz
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~ppc ~riscv"

RDEPEND="
	dev-python/python-dateutil[${PYTHON_USEDEP}]
"
BDEPEND="
	test? (
		$(python_gen_cond_dep '
			dev-python/backports-zoneinfo[${PYTHON_USEDEP}]
		' 3.8)
	)
"

distutils_enable_tests pytest
