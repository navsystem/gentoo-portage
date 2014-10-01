# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-python/celery/celery-3.1.14.ebuild,v 1.1 2014/09/14 16:07:34 xmw Exp $

EAPI=5

PYTHON_COMPAT=( python{2_7,3_3,3_4} )

inherit distutils-r1

DESCRIPTION="Celery is an open source asynchronous task queue/job queue based on distributed message passing"
HOMEPAGE="http://celeryproject.org/ http://pypi.python.org/pypi/celery"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="doc examples redis test"

PY2_USEDEP=$(python_gen_usedep python2_7)
RDEPEND="<dev-python/kombu-3.1[${PYTHON_USEDEP}]
		>=dev-python/kombu-3.0.21[${PYTHON_USEDEP}]
		>=dev-python/python-dateutil-1.5[${PYTHON_USEDEP}]
		>=dev-python/anyjson-0.3.3[${PYTHON_USEDEP}]
		dev-python/pyparsing[${PYTHON_USEDEP}]
		>=dev-python/billiard-3.3.0.18[${PYTHON_USEDEP}]
		<dev-python/billiard-3.4[${PYTHON_USEDEP}]
		dev-python/pytz[${PYTHON_USEDEP}]
		dev-python/greenlet[${PYTHON_USEDEP}]"

DEPEND="dev-# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-python/celery/celery-3.1.14.ebuild,v 1.1 2014/09/14 16:07:34 xmw Exp $

EAPI=5

PYTHON_COMPAT=( python{2_7,3_3,3_4} )

inherit distutils-r1

DESCRIPTION="Celery is an open source asynchronous task queue/job queue based on distributed message passing"
HOMEPAGE="http://celeryproject.org/ http://pypi.python.org/pypi/celery"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="doc examples redis test"

PY2_USEDEP=$(python_gen_usedep python2_7)
RDEPEND="<dev-python/kombu-3.1[${PYTHON_USEDEP}]
		>=dev-python/kombu-3.0.21[${PYTHON_USEDEP}]
		>=dev-python/python-dateutil-1.5[${PYTHON_USEDEP}]
		>=dev-python/anyjson-0.3.3[${PYTHON_USEDEP}]
		dev-python/pyparsing[${PYTHON_USEDEP}]
		>=dev-python/billiard-3.3.0.18[${PYTHON_USEDEP}]
		<dev-python/billiard-3.4[${PYTHON_USEDEP}]
		dev-python/pytz[${PYTHON_USEDEP}]
		dev-python/greenlet[${PYTHON_USEDEP}]"

DEPEND="dev-python/setuptools[${PYTHON_USEDEP}]
	test? ( ${RDEPEND}
		dev-python/gevent[${P