# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/media-libs/jpeg/jpeg-8d-r1.ebuild,v 1.17 2014/06/09 23:22:38 vapier Exp $

EAPI=5
inherit eutils libtool toolchain-funcs multilib-minimal

DESCRIPTION="Library to load, handle and manipulate images in the JPEG format"
HOMEPAGE="http://jpegclub.org/ http://www.ijg.org/"
SRC_URI="http://www.ijg.org/files/${PN}src.v${PV}.tar.gz
	mirror://debian/pool/main/libj/lib${PN}8/lib${PN}8_8d-1.debian.tar.gz"

LICENSE="IJG"
SLOT="0"
KEYWORDS="alpha amd64 arm arm64 hppa ia64 m68k ~mips ppc ppc64 s390 sh sparc x86 ~sparc-fbsd ~x86-fbsd ~x64-freebsd ~x86-freebsd ~x86-interix ~amd64-linux ~x86-linux ~ppc-macos ~x64-macos ~x86-macos ~m68k-mint ~sparc-solaris ~sparc64-solaris ~x64-solaris ~x86-solaris"
IUSE="static-libs"

RDEPEND="!media-libs/libjpeg-turbo:0
	abi_x86_32? ( !<=app-emulation/emul-linux-x86-baselibs-20130224-r5
		!app-emulation/emul-linux-x86-baselibs[-abi_x86_32(-)] )"
DEPEND="${RDEPEND}"

src_prepare() {
	epatch \
		"${FILESDIR}"/${PN}-7-maxmem_sysconf.patch \
		"${FILESDIR}"/${P}-CVE-2013-6629.patch
	elibtoolize
}

multilib_src_configure() {
	# Fix building against this library on eg. Solaris and DragonFly BSD, see:
	# http://mail-index.netbsd.org/pkgsrc-bugs/2010/01/18/msg035644.html
	local ldverscript=
	[[ ${CHOST} # Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/media-libs/jpeg/jpeg-8d-r1.ebuild,v 1.17 2014/06/09 23:22:38 vapier Exp $

EAPI=5
inherit eutils libtool toolchain-funcs multilib-minimal

DESCRIPTION="Library to load, handle and manipulate images in the JPEG format"
HOMEPAGE="http://jpegclub.org/ http://www.ijg.org/"
SRC_URI="http://www.ijg.org/files/${PN}src.v${PV}.tar.gz
	mirror://debian/pool/main/libj/lib${PN}8/lib${PN}8_8d-1.debian.tar.gz"

LICENSE="IJG"
SLOT="0"
KEYWORDS="alpha amd64 arm arm64 hppa ia64 m68k ~mips ppc ppc64 s390 sh sparc x86 ~sparc-fbsd ~x86-fbsd ~x64-freebsd ~x86-freebsd ~x86-interix ~amd64-linux ~x86-linux ~ppc-macos ~x6