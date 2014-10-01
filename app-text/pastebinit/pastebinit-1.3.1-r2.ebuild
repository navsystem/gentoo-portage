# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/app-text/pastebinit/pastebinit-1.3.1-r2.ebuild,v 1.3 2013/12/24 12:56:08 ago Exp $

EAPI=5
PYTHON_COMPAT=( python{2_6,2_7} )
PYTHON_REQ_USE="xml"

inherit python-r1

DESCRIPTION="A software that lets you send anything you want directly to a
pastebin from the command line."
HOMEPAGE="https://launchpad.net/pastebinit"
SRC_URI="https://lau# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/app-text/pastebinit/pastebinit-1.3.1-r2.ebuild,v 1.3 2013/12/24 12:56:08 ago Exp $

EAPI=5
PYTHON_COMPAT=( python{2_6,2_7} )
PYTHON_REQ_USE="xml"

inherit python-r1

DESCRIPTION="A software that lets you send anything you want directly to a
pastebin from the command line."
HOMEPAGE="https://launchpad.net/pastebinit"
SRC_URI="https://launchpad.net/${PN}/trunk/${PV}/+download/${P}.tar.bz2"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE="crypt"

RDEPEND="${PYTHON_DEPS}
	dev-python/configobj[${PYTHON_USEDEP}]
	crypt? ( app-crypt/gnupg )"
DEPEND="app-text/docbook-xsl-stylesheets"

src_prepare() {
	local mo=""

	for lang in ${LINGUAS}; do
		if [ -f po/${lang}.po ]; then
			mo="${mo} ${lang}.mo"
		fi
	done

	sed -i -e "/^build-mo/s/:.*/:${mo}