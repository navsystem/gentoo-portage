# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( pypy3 python3_{6..9} )

inherit distutils-r1

DESCRIPTION="Log formatting with colors"
HOMEPAGE="https://pypi.org/project/colorlog/ https://github.com/borntyping/python-colorlog"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

distutils_enable_tests pytest
