# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/net-analyzer/vnstat/vnstat-1.11-r2.ebuild,v 1.12 2014/07/23 01:03:46 mrueg Exp $

EAPI=5
inherit toolchain-funcs user

DESCRIPTION="Console-based network traffic monitor that keeps statistics of network usage"
HOMEPAGE="http://humdi.net/vnstat/"
SRC_URI="http://humdi.net/vnstat/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="amd64 arm hppa ppc ppc64 sparc x86"
IUSE="gd"

DEPEND="
	gd? ( media-libs/gd[png] )"
RDEPEND="${DEPEND}"

pkg_setup() {
	enewgroup vnstat
	enewuser vnstat -1 -1 /dev/null vnstat
}

src_compile() {
	sed -i 's:vnstat[.]log:vnstatd.log:' cfg/vnstat.conf || die
	sed -i 's:vnstat[.]pid:vnstatd/vnstatd.pid:' cfg/vnstat.conf || die

	emake CC="$(tc-getCC)" CFLAGS="${CFLAGS}" $(usex gd all '')
}

src_install() {
	use gd && dobin src/vnstati
	dobin src/vnstat src/vnstatd
	exeinto /etc/cron.hourly
	newexe "${FILESDIR}"/vnstat.cron vnstat

	insinto /etc
	doins cfg/vnstat.conf
	fowners root:vnstat /etc/vnstat.conf

	newconfd "${FILESDIR}"/vnstatd.confd vnstatd
	newinitd "${FILESDIR}"/vnstatd.initd vnstatd

	keepdir /var/lib/vnstat
	fowners vnstat:vnstat /var/lib/vnstat

	use gd && doman man/vnstati.1
	doman man/vnstat.1 man/vnstatd.1

	newdoc examples/vnstat# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/net-analyzer/vnstat/vnstat-1.11-r2.ebuild,v 1.12 2014/07/23 01:03:46 mrueg Exp $

EAPI=5
inherit toolchain-funcs user

DESCRIPTION="Console-based network traffic monitor that keeps statistics of network usage"
HOMEPAGE="http://humdi.net/vnstat/"
SRC_URI="http://humdi.net/vnstat/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="amd64 arm hppa ppc ppc64 sparc x86"
IUSE="gd"

DEPEND="
	gd? ( media-libs/gd[png] )"
RDEPEND="${DEPEND}"

pkg_setup() {
	enewgroup vnstat
	enewuser vnstat -1 -1 /dev/null vnstat
}

src_compile() {
	sed -i 's:vnstat[.]log:vnstatd.log:' cfg/vnstat.conf || die
	sed -i 's:vnstat[.]pid:vnstatd/vnstatd.pid:' cfg/vnstat.conf || die

	emake CC="$(tc-getCC)" CFLAGS="${CFLAGS}" $(usex gd all '')
}

src_install() {
	use gd && dobin src/vnstati
	dobin src/vnstat src/vnstatd
	exeinto /etc/cron.hourly
	newexe "${FILESDIR}"/vnstat.cron vnstat

	insinto /etc
	doins cfg/vnstat.conf
	fow