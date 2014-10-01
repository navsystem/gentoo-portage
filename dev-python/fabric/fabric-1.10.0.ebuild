# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-python/fabric/fabric-1.10.0.ebuild,v 1.1 2014/09/18 09:17:55 idella4 Exp $

EAPI=5
PYTHON_COMPAT=( python2_7 )   # py2 only

inherit distutils-r1

MY_PN="Fabric"
MY_P="${MY_PN}-${PV}"

DESCRIPTION="A simple pythonic tool for remote execution and deployment"
HOMEPAGE="http://fabfile.org http://pypi.python.org/pypi/Fabric"
SRC_URI="mirror://pypi/${MY_PN:0:1}/${MY_PN}/${MY_P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="doc test"

# since 'paramiko>=1.10' is what we have in portage, paramiko can be set unversioned
RDEPEND="dev-python/paramiko[${PYTHON_USEDEP}]"
DEPEND="${RDEPEND}
	dev-python/setuptools[${PYTHON_USEDEP}]
	doc? ( dev-python/sphinx[${PYTHON_USEDEP}]
			>=dev-python/python-docs-2.7.6-r1:2.7
			dev-python/alabaster[${PYTHON_USEDEP}] )
	test? ( dev-python/nose[${PYTHON_USEDEP}]
			<dev-python/fudge-1.0[${PYTHON_USEDEP}]
			dev-python/jinja[${PYTHON_USEDEP}] )"

S=# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-python/fabric/fabric-1.10.0.ebuild,v 1.1 2014/09/18 09:17:55 idella4 Exp $

EAPI=5
PYTHON_COMPAT=( python2_7 )   # py2 only

inherit distutils-r1

MY_PN="Fabric"
MY_P="${MY_PN}-${PV}"

DESCRIPTION="A simple pythonic tool for remote execution and deployment"
HOMEPAGE="http://fabfile.org http://pypi.python.org/pypi/Fabric"
SRC_URI="mirror://pypi/${MY_PN:0:1}/${MY_PN}/${MY_P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="doc test"

# since 'paramiko>=1.10' is what we have in portage, paramiko can be set unversioned
RDEPEND="dev-python/paramiko[${PYTHON_USEDEP}]"
DEPEND="${RDEPEND}
	dev-python/setuptools[${PYTHON_USEDEP}]
	doc? ( dev-python/sphinx[${PYTHON_USEDEP}]
			>=dev-python/python-docs-2.7.6-r1:2.7
			dev-python/alabaster[${PYTHON_USEDEP}] )
	test? ( dev-python/nose[${PYTHON_USEDEP}]
			<dev-python/fudge-1.0[${PYTHON_USEDEP}]
			dev-python/j