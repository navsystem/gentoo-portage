# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-tex/latex2html/latex2html-2008-r1.ebuild,v 1.3 2013/08/27 20:42:14 aballier Exp $

EAPI=4

inherit base eutils multilib

DESCRIPTION="convertor written in Perl that converts LATEX documents to HTML"
SRC_URI="http://saftsack.fs.uni-bayreuth.de/~latex2ht/current/${P}.tar.gz
	http://dev.gentoo.org/~dilfridge/distfiles/${PN}-match-multiline.patch.bz2"
HOMEPAGE="http://www.latex2html.org/"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~alpha ~amd64 ~arm ~hppa ~ia64 ~mips ~ppc ~ppc64 ~s390 ~sh ~sparc ~x86 ~amd64-fbsd ~x86-fbsd ~x86-freebsd ~amd64-linux ~x86-linux ~ppc-macos ~x64-macos ~x86-macos ~sparc-solaris ~x64-solaris ~x86-solaris"
IUSE="gif png"

DEPEND="app-text/ghostscript-gpl
	virtual/latex-base
	media-libs/netpbm
	dev-lang/perl
	gif? ( media-libs/giflib )
	png? ( media-libs/libpng )"
RDEPEND="${DEPEND}"

PATCHES=( "${FILESDIR}/${PN}"-{convert-length,perl_name,extract-major-version-2,destdir}.patch
	"${DISTDIR}/${PN}"-match-multiline.patch.bz2 )

src_prepare() {
	base_src_prepare

	# Dont install old url.sty and other files
	# Bug #240980
	rm -f texinputs/url.sty texinputs/latin9.def || die "failed to remove duplicate latex files"

	sed -ie 's%@PERL@%'"${EPREFIX}"'/usr/bin/perl%g' wrapper/unix.pin || die
}

src_configure() {
	local myconf

	use gif || use png || myconf="${myconf} --disable-images"

	econf --libdir="${EPREFIX}"/usr/$(get_libdir)/latex2html \
		--shlibdir="${EPREFIX}"/usr/$(get_libdir)/latex2html \
		--enable-pk \
		--enable-eps \
		--enable-reverse \
		--enable-pipes \
		--enable-paths \
		--enable-wrapper \
		--with-texpath="${EPREFIX}"/usr/share/texmf-site/tex/latex/html \
		--without-mktexlsr \
		$(# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-tex/latex2html/latex2html-2008-r1.ebuild,v 1.3 2013/08/27 20:42:14 aballier Exp $

EAPI=4

inherit base eutils multilib

DESCRIPTION="convertor written in Perl that converts LATEX documents to HTML"
SRC_URI="http://saftsack.fs.uni-bayreuth.de/~latex2ht/current/${P}.tar.gz
	http://dev.gentoo.org/~dilfridge/distfiles/${PN}-match-multiline.patch.bz2"
HOMEPAGE="http://www.latex2html.org/"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~alpha ~amd64 ~arm ~hppa ~ia64 ~mips ~ppc ~ppc64 ~s390 ~sh ~sparc ~x86 ~amd64-fbsd ~x86-fbsd ~x86-freebsd ~amd64-linux ~x86-linux ~ppc-macos ~x64-macos ~x86-macos ~sparc-solaris ~x64-solaris ~x86-solaris"
IUSE="gif png"

DEPEND="app-text/ghostscript-gpl
	virtual/latex-base
	media-libs/netpbm
	dev-lang/perl
	gif? ( media-libs/giflib )
	png? ( media-libs/libpng )"
RDEPEND="${DEPEND}"

PATCHES=( "${FILESDIR}/${PN}"-{convert-length,perl_name,extract-major-versi