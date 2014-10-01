# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/media-libs/alsa-lib/alsa-lib-1.0.28.ebuild,v 1.5 2014/09/21 19:50:24 maekke Exp $

EAPI=5

# no support for python3_2 or above yet wrt #471326
PYTHON_COMPAT=( python2_7 )

inherit autotools eutils multilib multilib-minimal python-single-r1

DESCRIPTION="Advanced Linux Sound Architecture Library"
HOMEPAGE="http://www.alsa-project.org/"
SRC_URI="mirror://alsaproject/lib/${P}.tar.bz2"

LICENSE="LGPL-2.1"
SLOT="0"
KEYWORDS="~alpha ~amd64 arm hppa ~ia64 ~mips ~ppc ~ppc64 ~sh ~sparc ~x86 ~amd64-linux ~x86-linux"
IUSE="alisp debug doc elibc_uclibc python"

RDEPEND="python? ( ${PYTHON_DEPS} )
	abi_x86_32? (
		!<=app-emulation/emul-linux-x86-soundlibs-20130224-r1
		!app-emulation/emul-linux-x86-soundlibs[-abi_x86_32(-)]
	)"
DEPEND="${RDEPEND}
	doc? ( >=app-doc/doxygen-1.2.6 )"

REQUIRED_USE="python? ( ${PYTHON_REQUIRED_USE} )"

pkg_setup() {
	use python && python-single-r1_pkg_setup
}

src_prepare() {
	find . -name Makefile.am -exec sed -i -e '/CFLAGS/s:-g -O2::' {} + || die
	# http://bugs.gentoo.org/509886
	use elibc_uclibc && { sed -i -e 's:oldapi queue_timer:queue_timer:' test/Makefile.am || die; }
	epatch_user
	eautoreconf
}

multilib_src_configure() {
	loc# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/media-libs/alsa-lib/alsa-lib-1.0.28.ebuild,v 1.5 2014/09/21 19:50:24 maekke Exp $

EAPI=5

# no support for python3_2 or above yet wrt #471326
PYTHON_COMPAT=( python2_7 )

inherit autotools eutils multilib multilib-minimal python-single-r1

DESCRIPTION="Advanced Linux Sound Architecture Library"
HOMEPAGE="http://www.alsa-project.org/"
SRC_URI="mirror://alsaproject/lib/${P}.tar.bz2"

LICENSE="LGPL-2.1"
SLOT="0"
KEYWORDS="~alpha ~amd64 arm hppa ~ia64 ~mips ~ppc ~ppc64 ~sh ~sparc ~x86 ~amd64-linux ~x86-linux"
IUSE="alisp debug doc elibc_uclibc python"

RDEPEND="python? ( ${PYTHON_DEPS} )
	abi_x86_32? (
		!<=app-emulation/emul-linux-x86-soundlibs-20130224-r1
		!app-emulation/emul-linux-x86-soundlibs[-abi_x86_32(-)]
	)"
DEPEND="${RDEPEND}
	doc? ( >=app-