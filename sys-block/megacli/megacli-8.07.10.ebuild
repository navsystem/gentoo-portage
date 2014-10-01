# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/sys-block/megacli/megacli-8.07.10.ebuild,v 1.4 2014/03/21 11:53:47 xarthisius Exp $

EAPI=5

inherit rpm
MY_P=${PV}_MegaCLI_Linux

DESCRIPTION="LSI Logic MegaRAID Command Line Interface management tool"
HOMEPAGE="http://www.lsi.com/"
SRC_URI="http://www.lsi.com/downloads/Public/RAID%20Controllers/RAID%20Controllers%20Common%20Files/${MY_P}.zip"

LICENSE="LSI"
SLOT="0"
# This package can never enter stable, it can't be mirrored and upstream
# can remove the distfiles from their mirror anytime.
KEYWORDS="amd64 x86"
IUSE=""

DEPEND="app-arch/unzip
	app-admin/chrpath"
RDEPEND=""

S=${WORKDIR}/${MY_P}

RESTRICT="mirror fetch"
QA_PREBUILT="/opt/${PN}/${PN}
	/opt/${PN}/lib/*"

pkg_nofetch() {
	einfo "Upstream has implement a mandatory clickthrough EULA for distfile download"
	einfo "Please visit $SRC_URI"
	einfo "And place $A in ${DISTDIR}"
}

src_unpack() {
	unpack ${A}
	cd "${S}"
	rpm_unpack ./"Linux MegaCLI ${PV}"/MegaCli-${PV}-1.noarch.rpm
}

src_install() {
	newdoc "Linux MegaCLI ${PV}.txt" RELEASE.txt

	exeinto /opt/megacli
	libsysfs=libstorelibir-2.so.14.07-0
	case ${ARCH} in
		amd64) MegaCli=MegaCli64;;
		x86) MegaCli=MegaCli;;
		*) die "invalid ARCH";;
	esac
	newexe opt/MegaRAID/MegaCli/${MegaCli} ${PN}

	exeinto /opt/${PN}/lib
	doexe opt/MegaRAID/MegaCli/${libsysfs}

	into /opt
	newbin "${FILESDIR}"/${PN}-wrapper ${PN}
	dosym ${PN} /opt/# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/sys-block/megacli/megacli-8.07.10.ebuild,v 1.4 2014/03/21 11:53:47 xarthisius Exp $

EAPI=5

inherit rpm
MY_P=${PV}_MegaCLI_Linux

DESCRIPTION="LSI Logic MegaRAID Command Line Interface management tool"
HOMEPAGE="http://www.lsi.com/"
SRC_URI="http://www.lsi.com/downloads/Public/RAID%20Controllers/RAID%20Controllers%20Common%20Files/${MY_P}.zip"

LICENSE="LSI"
SLOT="0"
# This package can never enter stable, it can't be mirrored and upstream
# can remove the distfiles from their mirror anytime.
KEYWORDS="amd64 x86"
IUSE=""

DEPE