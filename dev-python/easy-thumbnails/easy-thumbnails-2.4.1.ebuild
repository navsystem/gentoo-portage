# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI="5"

PYTHON_COMPAT=( python3_{5,6} )

inherit distutils-r1

DESCRIPTION="Easy thumbnails for Django"
HOMEPAGE="https://pypi.org/project/easy-thumbnails/"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"

LICENSE="BSD"
KEYWORDS="~amd64 ~x86"
SLOT="0"
IUSE=""

RDEPEND="
	>=dev-python/django-1.4.2[${PYTHON_USEDEP}]
"

DEPEND="
	${RDEPEND}
	dev-python/setuptools[${PYTHON_USEDEP}]
"
