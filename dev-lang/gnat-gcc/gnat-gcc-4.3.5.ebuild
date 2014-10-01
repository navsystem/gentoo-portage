# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-lang/gnat-gcc/gnat-gcc-4.3.5.ebuild,v 1.7 2014/08/05 11:42:10 armin76 Exp $

# Need to let configure know where to find stddef.h
#EXTRA_CONFGCC="${WORKDIR}/usr/lib/include/"

inherit gnatbuild

DESCRIPTION="GNAT Ada Compiler - gcc version"
HOMEPAGE="http://gcc.gnu.org/"
LICENSE="GMGPL"

IUSE=""

# using new bootstrap
BOOT_SLOT="4.3"

# SLOT is set in gnatbuild.eclass, depends only on PV (basically SLOT=GCCBRANCH)
# so the URI's are static.
SRC_URI="ftp://gcc.gnu.org/pub/gcc/releases/gcc-${PV}/gcc-core-${PV}.tar.bz2
	ftp://gcc.gnu.org/pub/gcc/releases/gcc-${PV}/gcc-ada-${PV}.tar.bz2
	amd64? ( http://dev.gentoo.org/~george/src/gnatboot-${BOOT_SLOT}-amd64.tar.bz2 )
	sparc? ( http://dev.gentoo.org/~george/src/gnatboot-${BOOT_SLOT}-sparc.tar.bz2 )
	x86?   ( http://dev.gentoo.org/~george/src/gnatboot-${BOOT_SLOT}-i686.tar.bz2 )
	ppc?   ( http://dev.gentoo.org/~george/src/gnatboot-4.1-ppc.tar.bz2 )"

KEYWORDS="amd64 ~ppc x86"

# starting with 4.3.0 gnat needs these libs
DEPEND=">=dev-libs/mpfr-2.3.1
	<sys-apps/texinfo-5.1
	>=dev-libs/gmp-4.2.2"
RDEPEND="${DEPEND}"

#QA_EXECSTACK="${BINPATH:1}/gnatls ${BINPATH:1}/gnatbind ${BINPATH:1}/gnatmake
#	${LIBEXECPATH:1}/gnat1 ${LIBPATH:1}/adalib/libgnat-${SLOT}.so"

src_unpack() {
	gnatbuild_src_unpack

	# newly added zlib dir is processed by configure even with
	# --with-systtem-zlib passed, causing toruble on multilib
	rm -# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-lang/gnat-gcc/gnat-gcc-4.3.5.ebuild,v 1.7 2014/08/05 11:42:10 armin76 Exp $

# Need to let configure know where to find stddef.h
#EXTRA_CONFGCC="${WORKDIR}/usr/lib/include/"

inherit gnatbuild

DESCRIPTION="GNAT Ada Compiler - gcc version"
HOMEPAGE="http://gcc.gnu.org/"
LICENSE="GMGPL"

IUSE=""

# using new bootstrap
BOOT_SLOT="4.3"

# SLOT is set in gnatbuild.eclass, depends only on PV (basically SLOT=GCCBRANCH)
# so the URI's are static.
SRC_URI="ftp://gcc.gnu.org/pub/gcc/releases/gcc-${PV}/gcc-core-${PV}.tar.bz2
	ftp://gcc.gnu.org/pub/gcc/releases/gcc-${PV}/gcc-ada-${PV}.tar.bz2
	amd64? ( http://dev.gentoo.org/~george/src/gnatboot-${BOOT_SLOT}-amd64.tar.bz2 )
	sparc? ( http://dev.gentoo.org/~george/src/gnatboot-${BOOT_SLOT}-sparc.tar.bz2 )
	x86?   ( http://dev.gentoo.org/~george/src/gnatboot-${BOOT_SLOT}-i686.tar.bz2 )
	ppc?  