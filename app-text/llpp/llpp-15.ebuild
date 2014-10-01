# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/app-text/llpp/llpp-15.ebuild,v 1.11 2014/01/19 08:51:00 pacho Exp $

EAPI=5

inherit eutils multilib toolchain-funcs vcs-snapshot

DESCRIPTION="a graphical PDF viewer which aims to superficially resemble less(1)"
HOMEPAGE="http://repo.or.cz/w/llpp.git"
SRC_URI="mirror://gentoo/${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="amd64 ~ppc ~x86"
IUSE="+ocamlopt static"

LIB_DEPEND="~app-text/mupdf-1.2:=[static-libs]
	media-libs/openjpeg:0[static-libs]
	media-libs/freetype:2[static-libs]
	media-libs/jbig2dec[static-libs]
	sys-libs/zlib[static-libs]
	virtual/jpeg:0[static-libs]
	x11-libs/libX11[static-libs]"
RDEPEND="x11-misc/xsel
	!static? ( ${LIB_DEPEND//\[static-libs]} )"
DEPEND="${RDEPEND}
	static? ( ${LIB_DEPEND}
		app-arch/bzip2[static-libs]
		media-libs/libXcm[static-libs]
		x11-libs/libXau[static-libs]
		x11-libs/libXdmcp[static-libs]
		x11-libs/libXmu[static-libs] )
	dev-lang/ocaml[ocamlopt?]
	dev-ml/lablgl[glut,ocamlopt?]"

RESTRICT="!ocamlopt? ( strip )"

src_prepare() {
	epatch "${FILESDIR}"/${PN}-11-WM_C# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/app-text/llpp/llpp-15.ebuild,v 1.11 2014/01/19 08:51:00 pacho Exp $

EAPI=5

inherit eutils multilib toolchain-funcs vcs-snapshot

DESCRIPTION="a graphical PDF viewer which aims to superficially resemble less(1)"
HOMEPAGE="http://repo.or.cz/w/llpp.git"
SRC_URI="mirror://gentoo/${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="amd64 ~ppc ~x86"
IUSE="+ocamlopt static"

LIB_DEPEND="~app-text/mupdf-1.2:=[static-libs]
	media-libs/openjpeg:0[static-libs]
	media-libs/freetype:2[static-libs]
	media-libs/jbig2dec[static-libs]
	sys-libs/zlib[static-libs]
	virtual/jpeg:0[static-libs]
	x11-libs/libX11[static-libs]"
RDEPEND="x11-misc/xsel
	!static? ( ${LIB_DEPEND//\[static-libs]} )"
DEPEND="${RDEPEND}
	static? ( ${LIB_DEPEND}
		app-arch/bzip2[static-libs]
		media-libs/libXcm[static-libs]
		x11-libs/libXau[static-libs]
		x11-libs/libXdmcp[static-libs]
		x11-libs/libXmu[static-libs] )
	dev-lang/ocaml[ocamlopt?]
	dev-ml/lablgl[glut,ocamlopt?]"

RESTRICT="!ocamlopt? ( strip )"

src_prepare() {
	epatch "${FILESDIR}"/${PN}-11-WM_CLASS.patch
}

src_compile() {
	local ocaml=$(usex ocamlopt ocamlopt.opt ocamlc.opt)
	local cmo=$(usex ocamlopt cmx cmo)
	local cma=$(usex ocamlopt cmxa cma)
	local ccopt="$(freetype-config --cflags ) -O -include ft2build.h -D_GNU_SOURCE"
	if use static ; then
		local cclib=""
		local slib=""
		local spath=( ${EROOT}usr/$(get_libdir) $($(tc-getPKG_CONFIG) --libs-only-L --static mupdf x11 | sed 's:-L::g'