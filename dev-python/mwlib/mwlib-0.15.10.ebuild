# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-python/mwlib/mwlib-0.15.10.ebuild,v 1.1 2013/07/26 14:25:40 idella4 Exp $

EAPI=5

PYTHON_COMPAT=( python{2_6,2_7} )

inherit distutils-r1 user

DESCRIPTION="Tools for parsing Mediawiki content to other formats"
HOMEPAGE="http://code.pediapress.com/wiki/wiki http://pypi.python.org/pypi/mwlib"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.zip"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="doc server"

RDEPEND="dev-python/lxml[${PYTHON_USEDEP}]
	>=dev-python/odfpy-0.9[${PYTHON_USEDEP}]
	<dev-python/odfpy-0.10[${PYTHON_USEDEP}]
	>=dev-python/pyPdf-1.12[${PYTHON_USEDEP}]
	>=dev-python/pyparsing-1.5.5
	<dev-python/pyparsing-1.6[${PYTHON_USEDEP}]
	>=dev-python/timelib-0.2[${PYTHON_USEDEP}]
	virtual/latex-base
	>=dev-python/simplejson-2.3[${PYTHON_USEDEP}]
	dev-python/gevent[${PYTHON_USEDEP}]
	>=dev-python/bottle-0.10[${PYTHON_USEDEP}]
	>=dev-python/apipkg-1.2[${PYTHON_USEDEP}]
	>=dev-python/qserve-0.2.7[${# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-python/mwlib/mwlib-0.15.10.ebuild,v 1.1 2013/07/26 14:25:40 idella4 Exp $

EAPI=5

PYTHON_COMPAT=( python{2_6,2_7} )

inherit distutils-r1 user

DESCRIPTION="Tools for parsing Mediawiki content to other formats"
HOMEPAGE="http://code.pediapress.com/wiki/wiki http://pypi.python.org/pypi/mwlib"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.zip"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="doc server"

RDEPEND="dev-python/lxml[${PYTHON_USEDEP}]
	>=dev-python/odfpy-0.9[${PYTHON_USEDEP}]
	<dev-python/odfpy-0.10[${PYTHON_USEDEP}]
	>=dev-python/pyPdf-1.12[${PYTHON_USEDEP}]
	>=dev-python/pyparsing-1.5.5
	<dev-python/pyparsing-1.6[${PYTHON_USEDEP}]
	>=dev-python/timelib-0.2[${PYTHON_USEDEP}]
	virtual/latex-base
	>=dev-python/simplejson-2.3[${PYTHON_USEDEP}]
	dev-python/gevent[${PYTHON_USEDEP}]
	>=dev-python/bottle-0.10[${PYTHON_USEDEP}]
	>=dev-python/apipkg-1.2[${PYTHON_USEDEP}]
	>=dev-python/qserve-0.2.7[${PYTHON_USEDEP}]
	dev-python/roman[${PYTHON_USEDEP}]
	>=dev-python/py-1.4[${PYTHON_USEDEP}]
	dev-python/sqlite3dbm[${PYTHON_USEDEP}]
	dev-python/pillow[${PYTHON_USEDEP}]
	server? ( app-admin/sudo )"
DEPEND="${RDEPEND}
	dev-python/setuptools[${PYTHON_USEDEP}]
	app-arch/unzip
	doc? ( dev-python/sphinx )"

# TODO: requires ploticus to generate timelines

DOCS=(changelog.rst)

pkg_setup() {
	if use server ;  then
		enewgroup mwlib
		enewuser mwlib -1 -1 -1 mwlib
	fi
}

python_prepare_all() {
	# mwlib.apipkg is actually used.
	sed -e 's/, "apipkg"//' -i setup.py || die

	# Execute odflint script.
	sed \
		-e "/def _get_odflint_module():/,/odflint =	_get_odflint_module()/d" \
		-e "s/odflint.lint(path)/os.system('odflint %s' % path)/" \
		-i tests/test_odfwriter.py || die

	# Disable test which requires installed mw-zip script.
	rm -f tests/test_{nuwiki,redirect,zipwiki}.py || die
	# Disable render test that fails for no apparent reason
	rm -f tests/test_render.py || die
	# Disable nserve test that fails for an apparent reason
	# Bug 474874
	rm -f tests/test_nserve.py || die

	distutils-r1_python_prepare_all
}

python_compile() {
	if [[ ${EPYTHON} == python2* ]] ; then
		local CFLAGS="${CFLAGS} -fno-strict-aliasing"
		export CFLAGS
	fi

	distutils-r1_python_compile
}

python_compile_all() {
	use doc && emake -C docs html
}

python_test() {
	py.test || die
}

python_install_all() {
	use doc && local HTML_DOCS=( docs/_build/html/. )
	distutils-r1_python_install_all

	if use server ; then
		keepdir /var/log/mwlib
		keepdir /var/cache/mwlib

		fowners mwlib:mwlib /var/l