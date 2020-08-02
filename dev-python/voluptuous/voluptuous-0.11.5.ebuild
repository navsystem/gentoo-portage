# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7
PYTHON_COMPAT=( python3_{6..9} )

inherit distutils-r1

DESCRIPTION="A Python data validation library."
HOMEPAGE="https://github.com/alecthomas/voluptuous"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~alpha amd64 ~arm arm64 hppa ~ia64 ~mips ~ppc ~ppc64 s390 sparc x86 ~amd64-linux ~x86-linux"

python_test() {
	unset PYTHONPATH
	nosetests -v || die "Tests failed"
}
