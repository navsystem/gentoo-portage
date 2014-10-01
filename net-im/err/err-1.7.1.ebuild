# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/net-im/err/err-1.7.1.ebuild,v 1.2 2014/08/05 18:34:16 mrueg Exp $

EAPI=5

PYTHON_COMPAT=( python2_7 )
inherit distutils-r1 eutils user

DESCRIPTION="Plugin based XMPP chatbot designed to be easily deployable, extensible and maintainable"
HOMEPAGE="http://gbin.github.com/err/"

SRC_URI="mirror://pypi/e/${PN}/${P}.tar.gz"
KEYWORDS="~amd64 ~x86"
LICENSE="GPL-3"
SLOT="0"
IUSE="irc qt4 +plugins"

DEPEND="dev-python/setuptools[${PYTHON_USEDEP}]"
RDEPEND="dev-python/dnspython[${PYTHON_USEDEP}]
	dev-python/flask[${PYTHON_USEDEP}]
	dev-python/jinja[${PYTHON_USEDEP}]
	dev-python/pyfire[${PYTHON_USEDEP}]
	dev-python/python-daemon[${PYTHON_USEDEP}]
	dev-python/xmpppy
	dev-python/yapsy[${PYTHON_USEDEP}]
	irc? (
		dev-python/pyopenssl[${PYTHON_USEDEP}]
		dev-python/twisted-core[${PYTHON_USEDEP}]
		dev-python/twisted-words[${PYTHON_USEDEP}]
	)
	qt4? ( dev-python/pyside[${PYTHON_USEDEP},X,webkit] )
	plugins? ( dev-vcs/git )"

# Testsuite is broken since 1.6.3
RESTRICT="test"

# NOTES:
# 1. It has bundled libs - for example exrex(see 'errbot/bundled' subfolder)
# 2. Need to add PYTHON_USED# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/net-im/err/err-1.7.1.ebuild,v 1.2 2014/08/05 18:34:16 mrueg Exp $

EAPI=5

PYTHON_COMPAT=( python2_7 )
inherit distutils-r1 eutils user

DESCRIPTION="Plugin based XMPP chatbot designed to be easily deployable, extensible and maintainable"
HOMEPAGE="http://gbin.github.com/err/"

SRC_URI="mirror://pypi/e/${PN}/${P}.tar.gz"
KEYWORDS="~amd64 ~x86"
LICENSE="GPL-3"
SLOT="0"
IUSE="irc qt4 +plugins"

DEPEND="dev-python/setuptools[${PYTHON_USEDEP}]"
RDEPEND="dev-python/dnspython[${PYTHON_USEDEP}]
	dev-python/flask[${PYTHON_USEDEP}]
	dev-python/jinja[${PYTHON_USEDEP}]
	dev-python/pyfire[${PYTHON_USEDEP}]
	dev-python/python-daemon[${PYTHON_USEDEP}]
	dev-python/xmpppy
	dev-python/yapsy[${PYTHON_USEDEP}]
	irc? (
		dev-python/pyopenssl[${PYTHON_USEDEP}]
		dev-python/twisted-core[${PYTHON_USEDEP}]
		dev-python/twisted-words[${PYTHON_USEDEP}]
	)
	qt4? ( dev-python/pyside[${PYTHON_USEDEP},X,webkit] )
	plugins? ( dev-vcs/git )"

# Testsuite is broken since 1.6.3
RESTRICT="test"

# NOTES:
# 1. It has bundled libs - for example exrex(see 'errbot/bundled' subfolder)
