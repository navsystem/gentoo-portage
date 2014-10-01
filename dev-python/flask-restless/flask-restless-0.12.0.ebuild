# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-python/flask-restless/flask-restless-0.12.0.ebuild,v 1.3 2014/07/06 12:41:46 mgorny Exp $

EAPI=5
PYTHON_COMPAT=( python{2_6,2_7} )

inherit distutils-r1

DESCRIPTION="Flask extension for easy ReSTful API generation"
HOMEPAGE="http://packages.python.org/Flask-Restless/"
SRC_URI="https://github.com/jfinkels/${PN}/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="|| ( AGPL-3 BSD )"
SLOT="0"
KEYWORDS="~amd64 ~x86"

IUSE="doc examples test"

RDEPEND=">=dev-python/flask-0.7[${PYTHON_USEDEP}]
	dev-python/flask-sqlalchemy[${PYTHON_USEDEP}]
	dev-python/sqlalchemy[${PYTHON_USEDEP}]
	dev-python/python-dateutil:0[${PYTHON_USEDEP}]"
DEPEND="${RDEPEND}
	dev-python/setuptools[${PYTHON_USEDEP}]
	test? ( dev-python/nose[${PYTHON_USEDEP}] )
	doc? ( dev-python/sphinx[${PYTHON_USEDEP}]
		>=dev-python/sphinxcontrib-httpdomain-1.1.7[${PYTHON_USEDEP}]
		>=dev-python/sphinxcontrib-issuetracker-0.11[${PYTHON_USEDEP}]
		dev-python/flask-themes[${PYTHON_USEDEP}] )"

PATCHES=( "${FILESDIR}"/docbuild.patch )

python_compile_all()# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-python/flask-restless/flask-restless-0.12.0.ebuild,v 1.3 2014/07/06 12:41:46 mgorny Exp $

EAPI=5
PYTHON_COMPAT=( python{2_6,2_7} )

inherit distutils-r1

DESCRIPTION="Flask extension for easy ReSTful API generation"
HOMEPAGE="http://packages.python.org/Flask-Restless/"
SRC_URI="https://github.com/jfinkels/${PN}/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="|| ( AGPL-3 BSD )"
SLOT="0"
KEYWORDS="~amd64 ~x86"

IUSE="doc examples test"

RDEPEND=">=dev-python/flask-0.7[${PYTHON_USEDEP}]
	dev-python/flask-sqlalchemy[${PYTHON_USEDEP}]
	dev-python/sqlalchemy[${PYTHON_USEDEP}]
	dev-python/python-dateutil:0[${PYTHON_USED