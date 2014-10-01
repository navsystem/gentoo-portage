# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/net-analyzer/pnp4nagios/pnp4nagios-0.6.21.ebuild,v 1.6 2014/07/15 17:52:24 jer Exp $

EAPI="5"

inherit depend.apache eutils

DESCRIPTION="A performance data analyzer for nagios"
HOMEPAGE="http://www.pnp4nagios.org"

SRC_URI="mirror://sourceforge/${PN}/PNP-0.6/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
IUSE=""
KEYWORDS="amd64 ppc ppc64 ~sparc x86"

DEPEND="dev-lang/php[json,simplexml,zlib,xml,filter]
	>=dev-lang/php-5.3
	>=net-analyzer/rrdtool-1.2[graph,perl]
	|| ( net-analyzer/nagios-core net-analyzer/icinga )"
RDEPEND="${DEPEND}
	virtual/perl-Getopt-Long
	virtual/perl-Time-HiRes
	media-fonts/dejavu
	apache2? ( www-servers/apache[apache2_modules_rewrite] )"

want_apache2

pkg_setup() {
	depend.apache_pkg_setup
}

src_prepare() {
	epatch "${FILESDIR}"/${PN}-0.6.14-makefile.patch
}

src_configure() {
	local var_dir=
	local user_group=

	if has_version net-analyzer/nagios-core; then
		var_dir=/var/nagios/
		user_group=nagios
	else
		var_dir=/var/lib/icinga/
		user_group=icinga
	fi

	econf \
		--sysconfdir=/etc/pnp \
# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/net-analyzer/pnp4nagios/pnp4nagios-0.6.21.ebuild,v 1.6 2014/07/15 17:52:24 jer Exp $

EAPI="5"

inherit depend.apache eutils

DESCRIPTION="A performance data analyzer for nagios"
HOMEPAGE="http://www.pnp4nagios.org"

SRC_URI="mirror://sourceforge/${PN}/PNP-0.6/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
IUSE=""
KEYWORDS="amd64 ppc ppc64 ~sparc x86"

DEPEND="dev-lang/php[json,simplexml,zlib,xml,filter]
	>=dev-lang/php-5.3
	>=net-analyzer/rrdtool-1.2[graph,perl]
	|| ( net-analyzer/nagios-core net-analyzer/icinga )"
RDEPEND="${DEPEND}
	virtual/perl-Getopt-Long
	virtual/perl-Time-HiRes
	media-fonts/dejavu
	apache2? ( www-servers/apache[apache2_modules_rewrite] )"

want_apache2

pkg_setup() {
	depend.apache_pkg_setup
}

src_prepare() {
	epatch "${FILESDIR}"/${PN}-0.6.1