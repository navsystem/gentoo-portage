# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/net-dns/nsd/nsd-3.2.18.ebuild,v 1.1 2014/09/28 18:12:51 floppym Exp $

EAPI=5

inherit user

DESCRIPTION="An authoritative only, high performance, open source name server"
HOMEPAGE="http://www.nlnetlabs.nl/projects/nsd"
MY_PV=${PV/_rc/rc}
MY_PV=${MY_PV/_beta/b}
MY_P=${PN}-${MY_PV}
S="${WORKDIR}/${MY_P}"
SRC_URI="http://www.nlnetlabs.nl/downloads/${PN}/${MY_P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="bind8-stats ipv6 minimal-responses mmap +nsec3 ratelimit root-server runtime-checks zone-stats"

RDEPEND="
	dev-libs/openssl
	virtual/yacc
"
DEPEND="
	${RDEPEND}
	sys-devel/flex
"

src_configure() {
	# ebuild.sh sets localstatedir to /var/lib, but nsd expects /var in several locations
	# some of these cannot be changed by argumen# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/net-dns/nsd/nsd-3.2.18.ebuild,v 1.1 2014/09/28 18:12:51 floppym Exp $

EAPI=5

inherit user

DESCRIPTION="An authoritative only, high performance, open source name server"
HOMEPAGE="http://www.nlnetlabs.nl/projects/nsd"
MY_PV=${PV/_rc/rc}
MY_PV=${MY_PV/_beta/b}
MY_P=${PN}-${MY_PV}
S="${WORKDIR}/${MY_P}"
SRC_URI="http://www.nlnetlabs.nl/downloads/${PN}/${MY_P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="bind8-stats ipv6 minimal-responses mmap +nsec3 ratelimit root-server runtime-checks zone-stats"

RDEPEND="
	dev-libs/openssl
	virtual/yacc
"
DEPEND="
	${RDEPEND}
	sys-devel/flex
"

src_configure() {
	# ebuild.sh sets localstatedir to /var/lib, but nsd expects /var in several locations
	# some of these cannot be changed by arguments to econf/configure, f.i. logfile
	econf \
		--localstatedir="${EPREFIX}/var" \
		--with-pidfile="${EPREFIX}/var/run/nsd/nsd.pid" \
		--with-zonesdir="${EPREFIX}/var/lib/nsd" \
		--enable-largefile \
		$(use_enable bind8-stats) \
		$(use_enable ipv6) \
		$(use_enable minimal-responses) \
		$(use_enable mmap) \
		$(use_enable n