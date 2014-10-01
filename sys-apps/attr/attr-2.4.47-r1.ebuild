# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/sys-apps/attr/attr-2.4.47-r1.ebuild,v 1.15 2014/07/13 20:30:00 tgall Exp $

EAPI="4"

inherit eutils toolchain-funcs multilib-minimal

DESCRIPTION="Extended attributes tools"
HOMEPAGE="http://savannah.nongnu.org/projects/attr"
SRC_URI="mirror://nongnu/${PN}/${P}.src.tar.gz"

LICENSE="LGPL-2.1"
SLOT="0"
KEYWORDS="alpha amd64 arm arm64 hppa ia64 ~m68k ~mips ppc ppc64 ~s390 ~sh sparc x86 ~amd64-linux ~arm-linux ~x86-linux"
IUSE="nls static-libs"

DEPEND="nls? ( sys-devel/gettext )
	sys-devel/autoconf"
RDEPEND="abi_x86_32? (
		!<=app-emulation/emul-linux-x86-baselibs-20130224-r9
		!app-emulation/emul-linux-x86-baselibs[-abi_x86_32(-)]
	)"

src_prepare() {
	sed -i \
		-e "/^PKG_DOC_DIR/s:@pkg_name@:${PF}:" \
		-e '/HAVE_ZIPPED_MANPAGES/s:=.*:=false:' \
		include/builddefs.in \
		|| die
	strip-linguas -u po
	multilib_copy_sources # https://savannah.nongnu.org/bugs/index.php?39736
}

multilib_src_configure() {
	unset PLATFORM #184564
	export OPTIMIZER=${CFLAGS}
	export DEBUG=-DNDEBUG

	econf \
		$(use_enable nls gettext) \
		--enable-shared $(use_enable static-libs static) \
		--l# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/sys-apps/attr/attr-2.4.47-r1.ebuild,v 1.15 2014/07/13 20:30:00 tgall Exp $

EAPI="4"

inherit eutils toolchain-funcs multilib-minimal

DESCRIPTION="Extended attributes tools"
HOMEPAGE="http://savannah.nongnu.org/projects/attr"
SRC_URI="mirror://nongnu/${PN}/${P}.src.tar.gz"

LICENSE="LGPL-2.1"
SLOT="0"
KEYWORDS="alpha amd64 arm arm64 hppa ia64 ~m68k ~mips ppc ppc64 ~s390 ~sh sparc x86 ~amd64-linux ~arm-linux ~x86-linux"
IUSE="nls static-libs"

DEPEND="nls? ( sys-devel/gettext )
	sys-devel/autoconf"
RDEPEND="abi_x86_32