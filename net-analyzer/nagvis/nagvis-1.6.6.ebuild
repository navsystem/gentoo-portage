# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/net-analyzer/nagvis/nagvis-1.6.6.ebuild,v 1.4 2014/08/10 20:58:48 slyfox Exp $

EAPI=4

inherit eutils confutils depend.php depend.apache

DESCRIPTION="NagVis is a visualization addon for the well known network managment system Nagios"
HOMEPAGE="http://www.nagvis.org/"
SRC_URI="mirror://sourceforge/${PN}/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~ppc ~x86"
IUSE="apache2 automap"

DEPEND=""
RDEPEND="|| ( net-analyzer/nagios net-analyzer/icinga )
	automap? ( >=media-gfx/graphviz-2.14 )
	apache2? ( dev-lang/php[apache2] )
	net-analyzer/mk-livestatus
	dev-lang/php[gd,nls,json,session,pdo,sqlite,sockets,mysql,unicode,xml]"

need_php_httpd
want_apache2

pkg_setup() {
	confutils_require_built_with_all dev-lang/php gd nls json session pdo sqlite3 sockets mysql unicode xml
	depe# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/net-analyzer/nagvis/nagvis-1.6.6.ebuild,v 1.4 2014/08/10 20:58:48 slyfox Exp $

EAPI=4

inherit eutils confutils depend.php depend.apache

DESCRIPTION="NagVis is a visualization addon for the well known network managment system Nagios"
HOMEPAGE="http://www.nagvis.org/"
SRC_URI="mirror://sourceforge/${PN}/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~ppc ~x86"
IUSE="apache2 automap"

DEPEND=""
RDEPEND="|| ( net-analyzer/nagios net-analyzer/icinga )
	automap? ( >=media-gfx/graphviz-2.14 )
	apache2? ( dev-lang/php[apache2] )
	net-analyzer/mk-livestatus
	dev-lang/php[gd,nls,json,session,pdo,sqlite,sockets,mysql,unicode,xml]"

need_php_httpd
want_apache2

pkg_setup() {
	confutils_require_built_with_all dev-lang/php gd nls json session pdo sqlite3 sockets mysql unicode xml
	depend.apache_pkg_setup
}

src_prepare() {
	epatch "${FILESDIR}"/${P}-base-path.patch
	epatch "${FILESDIR}"/${P}-global-definitions.patch
	grep -Rl "/usr/local" "${S}"/* | xargs sed -i s:/usr/local:/usr:g ||die
	sed -i s:@NAGVIS_WEB@:/nagvis:g "${S}"/etc/apache2-nagvis.conf-sample ||die
	sed -i s:@NAGVIS_PATH@:/usr/share/nagvis/:g "${S}"/etc/apache2-nagvis.conf-sample ||die
	sed -i s:/usr/nagios/var/rw/live:/var/nagios/rw/live:g "${S}"/etc/nagvis.ini.php-sample ||die
}

src_install() {
	dodoc README INSTALL

	insinto /usr/share/nagvis
	doins -r share/{config.php,index.php,frontend,netmap,server,userfiles}
	doins -r docs

	diropts -o apache -g root
	dodir /var/nagvis/tmpl/{cache,compile}
	diropts
	dosym /var/nagvis /usr/share/nagvis/var

	if use apache2 ; then
		insinto "${APACHE_MODULES_CONFDIR}"
		newins etc/apache2-nagvis.conf-sample 98_${PN}.conf
	fi

	insinto /etc/nagvis
	doins -r etc/{conf.d,automaps,geomap,.htaccess,nagvis.ini.php-sample}
	fowners apache:root /etc/nagvis
	fperms 0664 /etc/nagvis/nagvis.ini.php-sample
	dosym /etc/nagvis /usr/share/nagvis/etc

	diropts -o apache -g root -m0775
	insopts -o apache -g roo