# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python3_{6,7,8} )

inherit distutils-r1

DESCRIPTION="WebSockets state-machine based protocol implementation"
HOMEPAGE="https://github.com/python-hyper/wsproto https://pypi.python.org/pypi/wsproto"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

RDEPEND="
	>=dev-python/h11-0.8[${PYTHON_USEDEP}]
	$(python_gen_cond_dep '
		dev-python/dataclasses[${PYTHON_USEDEP}]
	' python3_6)
"

distutils_enable_tests pytest
