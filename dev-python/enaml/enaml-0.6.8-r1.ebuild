# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-python/enaml/enaml-0.6.8-r1.ebuild,v 1.2 2013/06/05 18:00:09 idella4 Exp $

EAPI=5

PYTHON_COMPAT=( python2_7 )

inherit distutils-r1 virtualx

DESCRIPTION="Enthought Tool Suite: framework for writing declarative interfaces"
HOMEPAGE="http://code.enthought.com/projects/enaml/ http://pypi.python.org/pypi/enaml# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-python/enaml/enaml-0.6.8-r1.ebuild,v 1.2 2013/06/05 18:00:09 idella4 Exp $

EAPI=5

PYTHON_COMPAT=( python2_7 )

inherit distutils-r1 virtualx

DESCRIPTION="Enthought Tool Suite: framework for writing declarative interfaces"
HOMEPAGE="http://code.enthought.com/projects/enaml/ http://pypi.python.org/pypi/enaml"
SRC_URI="http://www.enthought.com/repo/ets/${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~amd64-linux ~x86-linux"
IUSE="doc examples test"

RDEPEND="
	dev-python/casuarius[${PYTHON_USEDEP}]
	dev-python/ply[${PYTHON_USEDEP}]
	dev-python/traits[${PYTHON_USEDEP}]
	|| ( dev-python/wxpython[${PYTHON_USEDEP}] \
		dev-python/PyQt4[${PYTHON_USEDEP}] \
		dev-python/pyside[${PYTHON_USEDEP}] )"

DEPEND="${RDEPEND}
	dev-python/setuptools[${PYTHON_USEDEP}]
	doc? ( dev-python/sphinx[${PYTHON_USEDEP}] )
	test? ( dev-python/python-dateutil[${PYTHON_USEDEP}]
		dev-python/wxpython[${PYTHON_USEDEP}]
		dev-python/python-dateutil[${PYTHON_USEDEP}]
		dev-python/pyside[${PYTHON_USEDEP}]
		dev-python/nose[${PYTHON_USEDEP}] )"
