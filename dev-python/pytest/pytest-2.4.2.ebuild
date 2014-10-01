# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-python/pytest/pytest-2.4.2.ebuild,v 1.16 2014/08/07 09:02:18 jer Exp $

EAPI="5"

PYTHON_COMPAT=( python{2_6,2_7,3_2,3_3} pypy pypy2_0 )
inherit distutils-r1 eutils

DESCRIPTION="py.test: simple powerful testing with Python"
HOMEPAGE="http://pytest.org/ http://pypi.python.org/pypi/pytest"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="alpha amd64 arm hppa ~ia64 ~mips ~ppc ~ppc64 ~s390 ~sh ~sparc x86 ~amd64-fbsd ~x86-fbsd ~amd64-linux ~ia64-linux ~x86-linux ~ppc-macos ~x64-macos ~x86-macos"
IUSE="doc test"

# When bumping, please check setup.py for the proper py version
PY_VER="1.4.17"
RDEPEND=">=dev-python/py-${PY_VER}[${PYTHON_USEDEP}]"

#pexpect dep based on https://bitbucket.org/hpk42/pytest/issue/386/tests-fail-with-pexpect-30
DEPEND="${RDEPEND}
	dev-python/setuptools[${PYTHON_USEDEP}]
	test? (
		$(python_gen_cond_dep 'dev-python/pexpect[${PYTHON_USEDEP}]' 'python*')
		dev-python/pyyaml[${PYTHON_USEDEP}]
	)
	doc? ( dev-python/sphinx[${PYTHON_USEDEP}# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-python/pytest/pytest-2.4.2.ebuild,v 1.16 2014/08/07 09:02:18 jer Exp $

EAPI="5"

PYTHON_COMPAT=( python{2_6,2_7,3_2,3_3} pypy pypy2_0 )
inherit distutils-r1 eutils

DESCRIPTION="py.test: simple powerful testing with Python"
HOMEPAGE="http://pytest.org/ http://pypi.python.org/pypi/pytest"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="alpha amd64 arm hppa ~ia64 ~mips ~ppc ~ppc64 ~s390 ~sh ~sparc x86 ~amd64-fbsd ~x86-fbsd ~amd64-linux ~ia64-linux ~x86-linux ~ppc-macos ~x64-macos ~x86-macos"
IUSE="doc test"

# When bumping, please check setup.py for the proper