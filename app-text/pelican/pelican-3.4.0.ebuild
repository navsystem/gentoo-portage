# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/app-text/pelican/pelican-3.4.0.ebuild,v 1.3 2014/08/10 18:28:34 slyfox Exp $

EAPI=5
PYTHON_COMPAT=( python{2_7,3_3} )

inherit distutils-r1

DESCRIPTION="A tool to generate a static blog, with restructured text (or markdown) input files"
HOMEPAGE="http://pelican.notmyidea.org/ http://pypi.python.org/pypi/pelican"
SRC_URI="https://github.com/getpelican/pelican/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="AGPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="examples markdown"

DEPEND="dev-python/feedgenerator[${PYT# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/app-text/pelican/pelican-3.4.0.ebuild,v 1.3 2014/08/10 18:28:34 slyfox Exp $

EAPI=5
PYTHON_COMPAT=( python{2_7,3_3} )

inherit distutils-r1

DESCRIPTION="A tool to generate a static blog, with restructured text (or markdown) input files"
HOMEPAGE="http://pelican.notmyidea.org/ http://pypi.python.org/pypi/pelican"
SRC_URI="https://github.com/getpelican/pelican/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="AGPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="examples markdown"

DEPEND="dev-python/feedgenerator[${PYTHON_USEDEP}]
	>=dev-