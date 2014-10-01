# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/net-analyzer/symon/symon-2.86-r1.ebuild,v 1.2 2014/07/30 14:49:12 jer Exp $

EAPI=5

inherit eutils perl-module toolchain-funcs

DESCRIPTION="Performance and information monitoring tool"
HOMEPAGE="http://www.xs4all.nl/~wpd/symon/"
SRC_URI="http://www.xs4all.nl/~wpd/symon/philes/${P}.tar.gz"

LICENSE="BSD-2"
SLOT="0"
KEYWORDS="~amd64 ~sparc ~x86"
IUSE="perl +symon symux"

RDEPEND="perl? ( dev-lang/perl )
	symux? ( net-analyzer/rrdtool )"
DEPEND="${RDEPEND}
	virtual/pmake"

S=${WORKDIR}/${PN}

# Deletes the directory passed as an argument from the internal pmake
# variable SUBDIR.
zap_subdir() {
	sed -i "/^SUBDIR/s|$1||" Makefile || die
}

pkg_setup() {
	use symon && USE_SYMON=1 && return

	if ! use perl && ! use symon && ! use symux; then
		ewarn "You have all available USE flags disabled. Therefore, only the"
		ewarn "system monitor will be emerged. Please, enable at least one USE"
		ewarn "flag to avoid this message."
		USE_SYMON=1
	fi
}

src_prepare() {
	sed -i \
		-e '/^[ \t]*${CC}.*\${LIBS}/s:\${CC}:$(CC) $(LDFLAGS):' \
		sym*/Makefile || die

	epatch "${FILESDIR}"/${P}-perl-5.18.patch
}

src_configure() {
	# Do some sed magic in accordance with the USE flags.
	use perl && [[ -z ${USE_SYMON} ]] && ! use symux && zap_subdir lib
	! use perl && zap_subdir client
	! use symux && zap_subdir symux
	[[ -z ${USE_SYMON} ]] && zap# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/net-analyzer/symon/symon-2.86-r1.ebuild,v 1.2 2014/07/30 14:49:12 jer Exp $

EAPI=5

inherit eutils perl-module toolchain-funcs

DESCRIPTION="Performance and information monitoring tool"
HOMEPAGE="http://www.xs4all.nl/~wpd/symon/"
SRC_URI="http://www.xs4all.nl/~wpd/symon/philes/${P}.tar.gz"

LICENSE="BSD-2"
SLOT="0"
KEYWORDS="~amd64 ~sparc ~x86"
IUSE="perl +symon symux"

RDEPEND="perl? ( dev-lang/perl )
	symux? ( net-analyzer/rrdtool )"
DEPEND="${RDEPEND}
	virtual/pmake"

S=${WORKDIR}/${PN}

# Deletes the directory passed as an argument from the internal pmake
# variable SUBDIR.
zap_subdir() {
	sed -i "/^SUBDIR/s|$1||" Makefile || die
}

pkg_setup() {
	use symon && USE_SYMON=1 && return

	if ! use perl && ! use symon && ! use symux; then
		ewarn "You have all available USE flags disabled. Therefore, only the"
		ewarn "system monitor will be emerged. Please, enable at least one USE"
		ewarn "flag to avoid this message."
		USE_SYMON=1
	fi
}

src_prepare() {
	sed -i \
		-e '/^[ \t]*${CC}.*\${LIBS}/s:\${CC}:$(CC) $(LDFLAGS):' 