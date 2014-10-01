# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/net-p2p/litecoind/litecoind-0.8.7.1.ebuild,v 1.3 2014/08/28 22:34:06 blueness Exp $

EAPI=5

DB_VER="4.8"

inherit bash-completion-r1 db-use eutils systemd user

MyPV="${PV/_/-}"
MyPN="litecoin"
MyP="${MyPN}-${MyPV}"

DESCRIPTION="P2P Internet currency based on Bitcoin but easier to mine"
HOMEPAGE="https://litecoin.org/"
SRC_URI="https://github.com/${MyPN}-project/${MyPN}/archive/v${MyPV}.tar.gz -> ${MyP}.tar.gz"

LICENSE="MIT ISC GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="examples ipv6 logrotate upnp"

RDEPEND="
	dev-libs/boost[threads(+)]
	dev-libs/openssl:0[-bindist]
	logrotate? (
		app-admin/logrotate
	)
	upnp? (
		net-libs/miniupnpc
	)
	sys-libs/db:$(db_ver_to_slot "${DB_VER}")[cxx]
	<=dev-libs/leveldb-1.12.0[-snappy]
"
DEPEND="${RDEPEND}
	>=app-shells/bash-4.1
	sys-apps/sed
"

S="${WORKDIR}/${MyP}"

pkg_setup() {
	local UG='litecoin'
	enewgroup "${UG}"
	enewuser "${UG}" -1 -1 /var/lib/litecoin "${UG}"
}

src_prepare() {
	epatch "${FILESDIR}"/${MyPN}-sys_leveldb.patch
	rm -r src/l# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/net-p2p/litecoind/litecoind-0.8.7.1.ebuild,v 1.3 2014/08/28 22:34:06 blueness Exp $

EAPI=5

DB_VER="4.8"

inherit bash-completion-r1 db-use eutils systemd user

MyPV="${PV/_/-}"
MyPN="litecoin"
MyP="${MyPN}-${MyPV}"

DESCRIPTION="P2P Internet currency based on Bitcoin but easier to mine"
HOMEPAGE="https://litecoin.org/"
SRC_URI="https://github.com/${MyPN}-project/${MyPN}/archive/v${MyPV}.tar.gz -> ${MyP}.tar.gz"

LICENSE="MIT ISC GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="examples ipv6 logrotate upnp"

RDEPEND="
	dev-libs/boost[threads(+)]
	dev-libs/openssl:0[-bindist]
	logrotate? (
		app-admin/logrotate
	)
	upnp? (
		net-libs/miniupnpc
	)
	sys-libs/db:$(db_ver_to_slot "${DB_VER}")[cxx]
	<=dev-libs/leveldb-1.12.0[-snappy]
"
DEPEND="${RDEPEND}
	>=app-shells/bash-4.1
	sys-apps/sed
"

S="${WORKDIR}/${MyP}"

pkg_setup() {
	local UG='litecoin'
	enewgroup "${UG}"
	enewuser "${UG}" -1 -1 /var/lib/litecoin "${UG}"
}

src_prepare() {
	epatch "${FILESDIR}"/${MyPN}-sys_leveldb.patch
	rm -r src/leveldb

	if has_version '>=dev-libs/boost-1.52'; then
		sed -i 's/\(-l db_cxx\)/-l boost_chrono$(BOOST_LIB_SUFFIX) \1/' src/makefile.unix
	fi
}

src_configure() {
	OPTS=()

	OPTS+=("DEBUGFLAGS=")
	OPTS+=("CXXFLAGS=${CXXFLAGS}")
	OPTS+=("LDFLAGS=${LDFLAGS}")

	if use upnp; then
		OPTS+=("USE_UPNP=1")
	else
		OPTS+=("USE_UPNP=-")
	fi

	use ipv6 || OPTS+=("USE_IPV6=-")

	OPTS+=("USE_SYSTEM_LEVELDB=1")
	OPTS+=("BDB_INCLUDE_PATH=$(db_includedir "${DB_VER}")")
	OPTS+=("BDB_LIB_SUFFIX=-${DB_VER}")

	cd src || die
	emake CC="$(tc-getCC)" CXX="$(tc-getCXX)" -f makefile.unix "${OPTS[@]}" ${PN}
}

#Tests are broken with and without our litecoin-sys_leveldb.patch.
#When tests work, make sure to inherit toolchain-funcs
#src_test() {
#	cd src || die
#	emake CC="$(tc-getCC)" CXX="$(tc-getCXX)" -f makefile.unix "${OPTS[@]}" test_litecoin
#	.