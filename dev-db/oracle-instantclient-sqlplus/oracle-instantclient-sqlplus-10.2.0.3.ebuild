# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-db/oracle-instantclient-sqlplus/oracle-instantclient-sqlplus-10.2.0.3.ebuild,v 1.8 2012/06/04 06:43:20 zmedico Exp $

inherit eutils multilib

MY_P_x86="${PN/oracle-/}-linux32-${PV}-20061115"
MY_P_amd64="${PN/oracle-/}-linux-x86-64-${PV}-20070103"

S=${WORKDIR}
DESCRIPTION="Oracle 10g client installation for Linux: SQL*Plus"
HOMEPAGE="http://www.oracle.com/technology/tech/oci/instantclient/index.html"
SRC_URI="amd64? ( ${MY_P_# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-db/oracle-instantclient-sqlplus/oracle-instantclient-sqlplus-10.2.0.3.ebuild,v 1.8 2012/06/04 06:43:20 zmedico Exp $

inherit eutils multilib

MY_P_x86="${PN/oracle-/}-linux32-${PV}-20061115"
MY_P_amd64="${PN/oracle-/}-linux-x86-64-${PV}-20070103"

S=${WORKDIR}
DESCRIPTION="Oracle 10g client installation for Linux: SQL*Plus"
HOMEPAGE="http://www.oracle.com/technology/tech/oci/instantclient/index.html"
SRC_URI="amd64? ( ${MY_P_amd64}.zip )
		 x86? ( ${MY_P_x86}.zip )"

LICENSE="OTN"
SLOT="0"
KEYWORDS="-* amd64 x86"
RESTRICT="fetch"
IUSE=""

RDEPEND=">=dev-db/oracle-instantclient-basic-${PV}"
DEPEND="${RDEPEND}
	app-arch/unzip"

pkg_setup() {
	MY_P=MY_P_${ARCH}
	export MY_P=${!MY_P}
}

pkg_nofetch() {
	eerror "Please go to:"
	eerror "  ${HOMEPAGE}"
	eerror "select your platform and download the"
	eerror "SQL*Plus package.  Put it in:"
	eerror "  ${DISTDIR}"
	eerror "after downloading it."
}

src_unpack() {
	unzip "${DISTDIR}"/${MY_P}.zip
}

src_install() {
	dodir /usr/$(get_libdir)/oracle/${PV}/client/lib
	cd "${S}"/instantclient_10_2
	insinto /usr/$(get_libdir)/oracle/${PV}/client/lib
	doins glogin.sql libsqlplus.so libsqlplusic.so

	dodir /usr/$(get_libdir)/oracle/${PV}/client/bin
	cd "${S}"/instantclient_10_2
	exeinto /usr/$(get_libdir)/oracle/${PV}/client/bin
	doexe sqlplus

	dodir /usr/bin
	d