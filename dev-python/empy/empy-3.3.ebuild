# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-python/empy/empy-3.3.ebuild,v 1.13 2010/03/28 17:31:31 arfrever Exp $

EAPI="3"
PYTHON_DEPEND="2"
SUPPORT_PYTHON_ABIS="1"

inherit distutils

DESCRIPTION="A powerful and robust templating system for Python"
HOMEPAGE="http://www.alcyone.com/software/empy/"
SRC_URI="http://www.alcyone.com/software/${PN}/${P}.tar.gz"

LICENSE="LGPL-2.1"
SLOT="0"
KEYWORDS="amd64 ia64 ppc x86"
IUSE="doc"

DEPEND=""
RDEPEND=""
RESTRICT_PYTHON_ABIS="3.*"

PYTHON_MODNAME="em.py"

src_prepare() {
	distutils_src_prepare
	sed -e "s:/usr/local/bin/python:/usr/bin/python:g" -i em.py || die "sed failed"
}

src_test() {
	testing() {
		./test.sh "$(PYTHON)"
	}
	python_execute_function testing
}

src_install() {
	distutils_src_install

	dodir# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-python/empy/empy-3.3.ebuild,v 1.13 2010/03/28 17:31:31 arfrever Exp $

EAPI="3"
PYTHON_DEPEND="2"
SUPPORT_PYTHON_ABIS="1"

inherit distutils

DESCRIPTION="A powerful and robust templating system for Python"
HOMEPAGE="http://www.alcyone.com/software/empy/"
SRC_URI="http://www.alcyone.com/software/${PN}/${P}.tar.gz"

LICENSE="LGPL-2.1"
SLOT="0"
KEYWORDS="amd64 ia64 ppc x86"
IUSE="doc"

DEPEND=""
RDEPEND=""
RESTRICT_PYTHON_ABIS="3.*"

PYTHON_MODNAME="em.py"

src_prepare() {
	distutils_src_prepare
