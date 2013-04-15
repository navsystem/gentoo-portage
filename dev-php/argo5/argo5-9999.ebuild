# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: Exp $

EAPI="5"

PHP_EXT_NAME="Argo5"
PHP_EXT_INI="yes"

inherit php-ext-source-r2 confutils mercurial

KEYWORDS="amd64 x86"

DESCRIPTION="PHP extention for QMapServer"
HOMEPAGE="http://navsystem.ru/"
EHG_REPO_URI="ssh://hg@trac:5438/Inet_Loc"
LICENSE="NAVSYSTEM"
SLOT="0"
IUSE=""

DEPEND="dev-libs/argo-php"
RDEPEND="${DEPEND}"

src_unpack() {
    mercurial_src_unpack || die
    export S="${WORKDIR}/${P}/php_ext"
}

src_prepare(){
	phpize && rm aclocal.m4 && autoreconf || die
}
