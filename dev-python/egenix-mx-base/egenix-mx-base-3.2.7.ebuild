# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-python/egenix-mx-base/egenix-mx-base-3.2.7.ebuild,v 1.1 2014/03/28 12:45:47 idella4 Exp $

EAPI=5
PYTHON_COMPAT=( python{2_6,2_7} )

inherit distutils-r1

DESCRIPTION="eGenix utils for Python"
HOMEPAGE="http://www.egenix.com/products/python/mxBase http://pypi.python.org/pypi/egenix-mx-base"
SRC_URI="http://downloads.egenix.com/python/${P}.tar.gz"

LICENSE="eGenixPublic-1.1"
SLOT="0"
KEYWORDS="~alpha ~amd64 ~arm ~hppa ~ia64 ~mips ~ppc ~ppc64 ~s390 ~sh ~sparc ~x86 ~sparc-fbsd ~x86-fbsd ~amd64-linux ~x86-linux ~ppc-macos ~x64-macos ~x86-macos ~sparc-solaris ~x86-solaris"
IUSE=""
# Correct broken tests
PATCHES=( "${FILESDIR}"/${PN}-3.2.6-tests.patch )

# distutils.command.config writes to CWD, bug #450516
# mxSetup.py is broken with --build-lib
DISTUTILS_NO_PARALLEL_BUILD=1

python_prepare_all() {
	# Don't install documentation in site-packages directories.
	sed -e "/\.pdf/d" -i egenix_mx_base.py || die

	distutils-r# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-python/egenix-mx-base/egenix-mx-base-3.2.7.ebuild,v 1.1 2014/03/28 12:45:47 idella4 Exp $

EAPI=5
PYTHON_COMPAT=( python{2_6,2_7} )

inherit distutils-r1

DESCRIPTION="eGenix utils for Python"
HOMEPAGE="http://www.egenix.com/products/python/mxBase http://pypi.python.org/pypi/egenix-mx-base"
SRC_URI="http://downloads.egenix.com/python/${P}.tar.gz"

LICENSE="eGenixPublic-1.1"
SLOT="0"
KEYWORDS="~alpha ~amd64 ~arm ~hppa ~ia64 ~mips ~ppc ~ppc64 ~s390 ~sh ~sparc ~x86 ~sparc-fbsd ~x86-fbsd ~amd64-linux ~x86-linux ~ppc-macos ~x64-macos ~x86-macos ~sparc-solaris ~x86-solaris"
IUSE=""
# Correct broken tests
PATCHES=( "${FILESDIR}"/${PN}-3.2.6-tests.patch )

