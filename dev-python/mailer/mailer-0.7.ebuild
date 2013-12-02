# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-python/beaker/beaker-1.5.3.ebuild,v 1.3 2010/04/16 19:33:34 hwoarang Exp $

EAPI=5

PYTHON_COMPAT=( python{2_6,2_7,3_2,3_3} )

inherit eutils distutils-r1

DESCRIPTION="A module that simplifies sending email"
HOMEPAGE="http://pypi.python.org/pypi/mailer/"
SRC_URI="http://pypi.python.org/packages/source/m/${PN}/${P}.zip"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND="dev-python/setuptools[${PYTHON_USEDEP}]"

src_prepare() {
	epatch "${FILESDIR}"/"${P}"-fix-queue.patch || die
}
