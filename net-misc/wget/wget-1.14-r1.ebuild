# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/net-misc/wget/wget-1.14-r1.ebuild,v 1.3 2014/01/18 05:35:17 vapier Exp $

EAPI="4"

inherit flag-o-matic toolchain-funcs autotools

DESCRIPTION="Network utility to retrieve files from the WWW"
HOMEPAGE="http://www.gnu.org/software/wget/"
SRC_URI="mirror://gnu/wget/${P}.tar.xz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~alpha ~amd64 ~arm ~arm64 ~hppa ~ia64 ~m68k ~mips ~ppc ~ppc64 ~s390 ~sh ~sparc ~x86 ~ppc-aix ~amd64-fbsd ~sparc-fbsd ~x86-fbsd ~x64-freebsd ~x86-freebsd ~hppa-hpux ~ia64-hpux ~x86-interix ~amd64-linux ~arm-linux ~ia64-linux ~x86-linux ~ppc-macos ~x64-macos ~x86-macos ~m68k-mint ~sparc-solaris ~sparc64-solaris ~x64-solaris ~x86-solaris"
IUSE="debug gnutls idn ipv6 nls ntlm pcre +ssl static uuid zlib"

LIB_DEPEND="idn? ( net-dns/libidn[static-libs(+)] )
	pcre? ( dev-libs/libpcre[static-libs(+)] )
	ssl? (
		gnutls? ( net-libs/gnutls[static-libs(+)] )
		!gnutls? ( dev-libs/openssl:0[static-libs(+)] )
	)
	uuid? ( # Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/net-misc/wget/wget-1.14-r1.ebuild,v 1.3 2014/01/18 05:35:17 vapier Exp $

EAPI="4"

inherit flag-o-matic toolchain-funcs autotools

DESCRIPTION="Network utility to retrieve files from the WWW"
HOMEPAGE="http://www.gnu.org/software/wget/"
SRC_URI="mirror://gnu/wget/${P}.tar.xz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~alpha ~amd64 ~arm ~arm64 ~hppa ~ia64 ~m68k ~mips ~ppc ~ppc64 ~s390 ~sh ~sparc ~x86 ~ppc-aix ~amd64-fbsd ~sparc-fbsd ~x86-fbsd ~x64-freebsd ~x86-freebsd ~hppa-hpux ~ia64-hpux ~x86-interix ~amd64-linux ~arm-linux ~ia64-linux ~x86-linux ~ppc-macos ~x64-macos ~x86-macos ~m68k-mint ~sparc-solaris ~sparc64-solaris ~x64-solaris ~x86-solaris"
IUSE="debug gnutls idn ipv6 nls ntlm pcre +ssl static uuid zlib"

LIB_DEPEND="idn? ( net-dns/libidn[static-libs(+)] )
	pcre? ( dev-libs/libpcre[static-libs(+)] )
	ssl? (
		gnutls? ( net-libs/gnutls[static-libs(+)] )
		!gnutls? ( dev-libs/openssl:0[static-libs(+)] )
	)
	uuid? ( sys-apps/util-linux[static-libs(+)] )
	zlib? ( sys-libs/zlib[static-libs(+)] )"
RDEPEND="!static? ( ${LIB_DEPEND//\[static-libs(+)]} )"
DEPEND="${RDEPEND}
	app-arch/xz-utils
	virtual/pkgconfig
	static? ( ${LIB_DEPEND} )
	nls? ( sys-devel/gettext )"

REQUIRED_USE="ntlm? ( !gnutls ssl ) gnutls? ( ssl )"

DOCS=( AUTHORS MAILING-LIST NEWS README doc/sample.wgetrc )

src_prepare() {
	epatch "${FILESDIR}"/${PN}-1.14-pkg-config.patch
	epatch "${FILESDIR}"/${P}-texi2pod.patch
	epatch "${FILESDIR}"/${PN}-1.14-gnutls-ssl.patch #479948
	epatch "${FILESDIR}"/${PN}-1.14-wgetrc.patch #327229
	# We patch the wgetrc sample file which goes into the info p