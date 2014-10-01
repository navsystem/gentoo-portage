# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/app-text/cmigemo/cmigemo-1.3c.ebuild,v 1.7 2009/09/23 16:31:00 patrick Exp $

inherit eutils

DESCRIPTION="C/Migemo -- Migemo library implementation in C"
HOMEPAGE="http://www.kaoriya.net/#CMIGEMO"
SRC_URI="http://www.kaoriya.net/dist/var/${P}.tar.bz2"

LICENSE="cmigemo"
SLOT="0"
KEYWORDS="x86 alpha ppc"	# development branch
IUSE="emacs"

DEPEND="app-i18n/qkc
	app-dicts/migemo-dict"
RDEPEND="app-dicts/migemo-dict
	emacs? ( >=app-text/migemo-0.40-r1 )"

src_unpack() {
	unpack ${A}
	cd ${S}
	epatch ${FILESDIR}/${PN}-1.2-migemo-dict.diff
	touch ${S}/dict/SKK-JISYO.L

	# Bug #246953
	sed -i -e "s:-Wl,-rpath[^ ]*::" compile/Make_gcc.mak || die
}

src_compile() {
	emake CFLAGS="-fPIC ${CFLAGS}" gcc || die
}

src_install() {
	make \
		prefix=${D}/usr \
		docdir=${D}/usr/share/doc/${P} \
		gcc-install || die

	mv ${D}/usr/share/migemo/euc-jp/*.dat ${D}/usr/share/migemo
	rm -rf ${D}/usr/share/migemo/{cp932,euc-jp}

	if has_version 'app-editors/vim-core' ; then
		insinto /usr/share/vim/vim# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/app-text/cmigemo/cmigemo-1.3c.ebuild,v 1.7 2009/09/23 16:31:00 patrick Exp $

inherit eutils

DESCRIPTION="C/Migemo -- Migemo library implementation in C"
HOMEPAGE="http://www.kaoriya.net/#CMIGEMO"
SRC_URI="http://www.kaoriya.net/dist/var/${P}.tar.bz2"

LICENSE="cmigemo"
SLOT="0"
KEYWORDS="x86 alpha ppc"	# development branch
IUSE="emacs"

DEPEND="app-i18n/qkc
	app-dicts/migemo-dict"
RDEPEND="app-dicts/mig