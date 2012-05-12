# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: Exp $

EAPI="2"

PHP_EXT_NAME="MapServer"
PHP_EXT_INI="yes"

inherit php-ext-source-r2 confutils subversion

KEYWORDS="amd64 x86"

DESCRIPTION="PHP extention for QMapServer"
HOMEPAGE="http://navsystem.ru/"
ESVN_REPO_URI="http://192.168.99.121/repos/SOFT/Qt/Argo5/MapLoader/php_ext/MapServer"
LICENSE="NAVSYSTEM"
SLOT="0"
IUSE=""

RDEPEND="dev-libs/maploader-lib"

src_prepare(){
	phpize && rm aclocal.m4 && autoreconf || die
}
