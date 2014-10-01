# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/net-misc/axel/axel-2.3-r1.ebuild,v 1.8 2011/02/26 18:14:47 xarthisius Exp $

inherit eutils toolchain-funcs

DESCRIPTION="light Unix download accelerator"
HOMEPAGE="http://axel.alioth.debian.org/"
SRC_URI="http://alioth.debian.org/frs/download.php/2718/${P}.tar.bz2"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="amd64 ~hppa ppc ~ppc64 sparc x86 ~x86-fbsd"
IUSE="debug nls"

RDEPEND="nls? ( virtual/libintl )"
DEPEND="${RDEPEND}
	nls? ( sys-devel/gettext )"
RD# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/net-misc/axel/axel-2.3-r1.ebuild,v 1.8 2011/02/26 18:14:47 xarthisius Exp $

inherit eutils toolchain-funcs

DESCRIPTION="light Unix download accelerator"
HOMEPAGE="http://axel.alioth.debian.org/"
SRC_URI="http://alioth.debian.org/frs/download.php/2718/${P}.tar.bz2"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="amd64 ~hppa ppc ~ppc64 sparc x86 ~x86-fbsd"
IUSE="debug nls"

RDEPEND="nls? ( virtual/libintl )"
DEPEND="${RDEPEND}
	nls? ( sys-devel/gettext )"
RDEPEND="${RDEPEND}"

#S="${WORKDIR}/${PN}-1.1"

src_unpack() {
	unpack ${A}
	cd "${S}"
	# Set LDFLAGS and fix expr
	sed -i -e 's/expr/& --/' -e "s/^LFLAGS=$/&${LDFLAGS}/" configure
}

src_compile() {
	local myconf

	use debug && my