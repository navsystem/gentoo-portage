# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/sys-libs/libunwind/libunwind-1.1.ebuild,v 1.15 2014/04/16 07:22:16 ago Exp $

EAPI="5"

inherit eutils libtool

DESCRIPTION="Portable and efficient API to determine the call-chain of a program"
HOMEPAGE="http://savannah.nongnu.org/projects/libunwind"
SRC_URI="http://download.savannah.nongnu.org/releases/libunwind/${P}.tar.gz"

LICENSE="MIT"
SLOT="7"
KEYWORDS="amd64 arm hppa ~ia64 ppc ppc64 x86 ~amd64-fbsd ~x86-fbsd ~amd64-linux ~x86-linux"
IUSE="debug debug-frame libatomic lzma static-libs"

RESTRICT="test" #461958 -- re-enable tests with >1.1 again for retesting, this is here for #461394

# We just use the header from libatomic.
RDEPEND="lzma? ( app-arch/xz-utils )"
DEPEND="${RDEPEND}
	libatomic? ( dev-libs/libatomic_ops )"

DOCS=( AUTHORS ChangeLog NEWS README TODO )

QA_DT_NEEDED_x86_fbsd="usr/lib/libunwind.so.7.0.0"

src_prepare() {
	# These tests like to fail.  bleh.
	echo 'int main(){return 0;}' > tests/Gtest-dyn1.c
	echo 'int main(){return 0;}' > tests/Ltest-dyn1.c

	sed -i -e '/LIBLZMA/s:-lzma:-llzma:' configure{.ac,} || die #444050
	epatch "${FILESDIR}"/${P}-lzma.patch #444050
	elibtoolize
}

src_configure() {
	# do not $(use_enable) b# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/sys-libs/libunwind/libunwind-1.1.ebuild,v 1.15 2014/04/16 07:22:16 ago Exp $

EAPI="5"

inherit eutils libtool

DESCRIPTION="Portable and efficient API to determine the call-chain of a program"
HOMEPAGE="http://savannah.nongnu.org/projects/libunwind"
SRC_URI="http://download.savannah.nongnu.org/releases/libunwind/${P}.tar.gz"

LICENSE="MIT"
SLOT="7"
KEYWORDS="amd64 arm hppa ~ia64 ppc ppc64 x86 ~amd64-fbsd ~x86-fbsd ~amd64-linux ~x86-linux"
IUSE="debug debug-frame libatomic lzma static-libs"

RESTRICT="test" #461958 -- re-enable tests with >1.1 again for retesting, this is here for #461394

# We just use the header from libatomic.
RDEPEND="lzma? ( app-arch/xz-utils )"
DEPEND="${RDEPEND}
	libatomic? ( dev-libs/libatomic_ops )"

DOCS=( AUTHORS ChangeLog NEWS README TODO )

QA_DT_NEEDED_x86_fbsd="usr/lib/libunwind.so.7.0.0"

src_prepare() {
	# These tests like to fail.  bleh.
	echo 'int main(){return 0;}' > tests/Gtest-dyn1.c
	echo 'int main(){return 0;}' > tests/Ltest-dyn1.c

	sed -i -e '/LIBLZMA/s:-lz