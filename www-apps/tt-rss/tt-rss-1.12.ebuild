# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/www-apps/tt-rss/tt-rss-1.12.ebuild,v 1.1 2014/04/04 11:22:05 tomka Exp $

EAPI=5

inherit user eutils webapp depend.php depend.apache vcs-snapshot

DESCRIPTION="Tiny Tiny RSS - A web-based news feed (RSS/Atom) aggregator using AJAX"
HOMEPAGE="http://tt-rss.org/"
SRC_URI="https://github.com/gothfox/Tiny-Tiny-RSS/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-3"
KEYWORDS="~amd64 ~mips ~x86"
IUSE="daemon +mysql postgres"

DEPEND="
	daemon? ( dev-lang/php[mysql?,postgres?,pcntl,curl] )
	!daemon? ( dev-lang/php[mysql?,postgres?,curl] )
"
RDEPEND="${DEPEND}"

REQUIRED_USE="|| ( mysql postgres )"

need_httpd_cgi
need_php_httpd

pkg_setup() {
	webapp_pkg_setup

	if use daemon; then
			enewgroup ttrssd
			enewuser ttrssd -1 /bin/sh /dev/null ttrssd
	fi
}

src_prepare() {
	# Customize config.php-dist so that the right 'DB_TYPE' is already set (according to the USE flag)
	einfo "Customizing config.php-dist..."

	if use mysql && ! use postgres; then
			sed -i \
				-e "/define('DB_TYPE',/{s:pgsql:mysql:}" \
				config.php-dist || die
	fi

	sed -i \
		-e "/define('DB_TYPE',/{s:// \(or mysql\):// pgsql \1:}" \
		config.php-dist || die

	# per 462578
	epatch_user
}

src_install() {
	webapp_src_preinst

	insinto "/${MY_HTDOCSDIR}"
	doins -r *
	keepdir "/${MY_HTDOCSDIR}"/feed-icons

	for DIR in cache lock feed-icons; do
			webapp_serverowned -R "${MY_HTDOCSDIR}/${DIR}"
	done

# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/www-apps/tt-rss/tt-rss-1.12.ebuild,v 1.1 2014/04/04 11:22:05 tomka Exp $

EAPI=5

inherit user eutils webapp depend.php depend.apache vcs-snapshot

DESCRIPTION="Tiny Tiny RSS - A web-based news feed (RSS/Atom) aggregator using AJAX"
HOMEPAGE="http://tt-rss.org/"
SRC_URI="https://github.com/gothfox/Tiny-Tiny-RSS/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-3"
KEYWORDS="~amd64 ~mips ~x86"
IUSE="daemon +mysql postgres"

DEPEND="
	daemon? ( de