# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/app-text/dictd/dictd-1.12.1-r1.ebuild,v 1.8 2014/01/18 20:03:11 ago Exp $

EAPI=5
inherit eutils readme.gentoo systemd user

DESCRIPTION="Dictionary Client/Server for the DICT protocol"
HOMEPAGE="http://www.dict.org/ http://sourceforge.net/projects/dict/"
SRC_URI="mirror://sourceforge/dict/${P}.tar.gz"

SLOT="0"
# We install rfc so - ISOC-rfc
LICENSE="GPL-2 ISOC-rfc"
KEYWORDS="alpha amd64 ~hppa ia64 ~mips ppc ppc64 sparc x86 ~amd64-linux ~x86-linux ~ppc-macos ~x86-macos ~sparc-solaris"
IUSE="dbi judy minimal"

# <gawk-3.1.6 makes tests fail.
RDEPEND="
	sys-libs/zlib
	dev-libs/libmaa
	dbi? ( dev-db/libdbi )
	judy? ( dev-libs/judy )
	>=sys-apps/coreutils-6.10
"
DEPEND="${RDEPEND}
	>=sys-apps/gawk-3.1.6
	virtual/yacc
"

DOC_CONTENTS="
	To start and use ${PN} you need to emerge at least one dictionary from
	the app-dicts category with the package name starting with 'dictd-'.
	To install all available dictionaries, emerge app-dicts/dictd-dicts.
	${PN} will NOT start without at least one dictionary.\n
	\nIf you are running systemd, you will need to review the instructions
	explained in /etc/dict/dictd.conf comments.
"

pkg_setup() {
	enewgroup dictd # used in src_test()
	enewuser dictd -1 -1 -1 dictd
}

src_prepare() {
	epatch "${FILESDIR}"/dictd-1.10.11-colorit-nopp-# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/app-text/dictd/dictd-1.12.1-r1.ebuild,v 1.8 2014/01/18 20:03:11 ago Exp $

EAPI=5
inherit eutils readme.gentoo systemd user

DESCRIPTION="Dictionary Client/Server for the DICT protocol"
HOMEPAGE="http://www.dict.org/ http://sourceforge.net/projects/dict/"
SRC_URI="mirror://sourceforge/dict/${P}.tar.gz"

SLOT="0"
# We install rfc so - ISOC-rfc
LICENSE="GPL-2 ISOC-rfc"
KEYWORDS="alpha amd64 ~hppa ia64 ~mips ppc ppc64 sparc x86 ~amd64-linux ~x86-linux ~ppc-macos ~x86-macos ~sparc-solaris"
IUSE="dbi judy minimal"

# <gawk-3.1.6 makes tests fail.
RDEPEND="
	sys-libs/zlib
	dev-libs/libmaa
	dbi? ( dev-db/libdbi )
	judy? ( dev-libs/judy )
	>=sys-apps/coreutils-6.10
"
DEPEND="${RDEPEND}
	>=sys-apps/gawk-3.1.6
	virtual/yacc
"

DOC_CONTENTS="
	To start and use ${PN} you need to emerge at least one dictionary from
	the app-dicts category with the package name starting with 'dictd-'.
	To install all available dictionaries, emerge app-dicts/dictd-dicts.
	${PN} will NOT start without at least one dictionary.\n
	\nIf you are running systemd, you will need to review the instructions
	explained in /etc/dict/dictd.conf comments.
"

pkg_setup() {
	enewgroup dictd # used in src_test()
	enewuser dictd -1 -1 -1 dictd
}

src_prepare() {
	epatch "${FILESDIR}"/dictd-1.10.11-colorit-nopp-fix.patch
	epatch "${FILESDIR}"/dictd-1.12.0-build.p