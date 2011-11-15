# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-python/beaker/beaker-1.5.3.ebuild,v 1.3 2010/04/16 19:33:34 hwoarang Exp $

EAPI="2"
SUPPORT_PYTHON_ABIS="1"

inherit distutils

DESCRIPTION="A module that simplifies sending email"
HOMEPAGE="http://pypi.python.org/pypi/mailer/"
SRC_URI="http://pypi.python.org/packages/source/m/${PN}/${P}.zip"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE="test"

DEPEND="dev-python/setuptools"
RDEPEND=""
