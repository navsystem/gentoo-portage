# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/sci-biology/emboss/emboss-6.0.1.ebuild,v 1.12 2014/07/30 01:12:51 grknight Exp $

EAPI=1

inherit eutils

DESCRIPTION="The European Molecular Biology Open Software Suite - A sequence analysis package"
HOMEPAGE="http://emboss.sourceforge.net/"
SRC_URI="ftp://${PN}.open-bio.org/pub/EMBOSS/old/${PV}/EMBOSS-${PV}.tar.gz"
LICENSE="GPL-2 LGPL-2"

SLOT="0"
KEYWORDS="amd64 ppc x86"
IUSE="X png minimal"

DEPEND="
	X? ( x11-libs/libXt )
	png? (
		sys-libs/zlib
		media-libs/libpng
		media-libs/gd
		)
	!minimal? (
		sci-biology/primer3
		sci-biology/clustalw
		)"

RDEPEND="${DEPEND}
	!sys-devel/cons"

PDEPEND="
	!minimal? (
		sci-biology/aaindex
		sci-biology/cutg
		sci-biology/prints
		sci-biology/prosite
		sci-biology/rebase
		sci-biology/transfac
	)"

S="${WORKDIR}/EMBOSS-${PV}"

src_unpack() {
	unpack ${A}
	cd "${S}"
	epatch "${FILESDIR}"/${PN}-5.0.0-as-needed.patch

	local link_string="$(pkg-config --libs x11)"
	if use png; then
		link_string="${link_string} -lgd $(pkg-config --libs libpng)"
	fi
	sed -e "s:PATCH_PLPLOT:${link_string}:" -i plplot/Makefile.in \
		|| die "Failed to patch ajax Makefile"
}

src_compile() {
	local myconf
	myconf="--includedir=${D}/usr/include/emboss"
	use X || myconf="${EXTRA_CONF} --without-x"
	use png || myconf="${EXTRA_CONF} --without-pngdriver"

	econf ${myconf}
	# Do not install the JEMBOSS component (the --without-java configure option
	# does not work). JEMBOSS will eventually be available as a separate package.
	sed -i -e "s/SUBDIRS = plplot ajax nucleus emboss test doc jemboss/SUBDIRS = plplot ajax nucleus emboss test doc/" \
			Makefile || die
	emake || die
}

src_install() {
	einstall || die "Failed to install program files."

	dodoc AUTHORS ChangeLog FAQ NEWS README THANKS \
			|| die "Failed to install documentation."
	newdoc "${FILESDIR}"/${PN}-README.Gentoo-1 README.Gentoo \
			|| die "Faile# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/sci-biology/emboss/emboss-6.0.1.ebuild,v 1.12 2014/07/30 01:12:51 grknight Exp $

EAPI=1

inherit eutils

DESCRIPTION="The European Molecular Biology Open Software Suite - A sequence analysis package"
HOMEPAGE="http://emboss.sourceforge.net/"
SRC_URI="ftp://${PN}.open-bio.org/pub/EMBOSS/old/${PV}/EMBOSS-${PV}.tar.gz"
LICENSE="GPL-2 LGPL-2"

SLOT="0"
KEYWORDS="amd64 ppc x86"
IUSE="X png minimal"

DEPEND="
	X? ( x11-libs/libXt )
	png? (
		sys-libs/zlib
		media-libs/libpng
		media-libs/gd
		)
	!minimal? (
		sci-biology/primer3
		sci-biology/clustalw
		)"

RDEPEND="${DEPEND}
	!sys-devel/cons"

PDEPEND="
	!minimal? (
		sci-biology/aaindex
		sci-biology/cutg
		sci-biology/prints
		sci-biology/prosite
		sci-biology/rebase
		sci-biology/transfac
	)"

S="${WORKDIR}/EMBOSS-${PV}"

src_unpack() {
	unpack ${A}
	cd "${S}"
	epatch "${FILESDIR}"/${PN}-5.0.0-as-needed.patch

	local link_string="$(pkg-config --libs x11)"
	if use png; then
		link_string="${link_string} -lgd $(pkg-config --libs libpng)"
	fi
	sed -e "s:PATCH_PLPLOT:${link_string}:" -i plplot/Makefile.in \
		|| die "Failed to patch ajax Makefile"
}

src_compile() {
	local myconf
	myconf="--includedir=${D}/usr/include/emboss"
	use X || myconf="${EXTRA_CONF} --without-x"
	use png || myconf="${EXTRA_CONF} --without-pngdriver"

	econf ${myconf}
	# Do not in