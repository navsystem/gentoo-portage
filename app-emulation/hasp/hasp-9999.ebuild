# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=3

inherit eutils git-2 linux-info

DESCRIPTION="Hardware Against Software Piracy for access to parallel and usb keys"
HOMEPAGE="http://www.etersoft.ru"
EGIT_REPO_URI="http://git.etersoft.ru/projects/haspd.git"

LICENSE="Alladin"
SLOT="0"
KEYWORDS=""

IUSE="+net_hasp wine usb lpt"

DEPEND="${RDEPEND}"

QA_PREBUILT="usr/sbin/aksusbd usr/sbin/haspdemo usr/sbin/winehasp
usr/sbin/hasplm usr/sbin/hasplmd usr/sbin/nethaspdemo"

S=${WORKDIR}/haspd-3.2

#CONFIG_CHECK="CONFIG_USB_DEVICEFS CONFIG_USB_DEVICEFS"

pkg_config() {
	if use usb; then
		CONFIG_CHECK="CONFIG_USB_DEVICEFS CONFIG_USB_DEVICEFS"
		linux-info_pkg_setup
	fi
	if use lpt; then
		CONFIG_CHECK="PARPORT_PC UNUSED_SYMBOLS"
	fi
}

src_prepare() {
	epatch ${FILESDIR}/eegorov_modifed.patch
}

src_compile() {
	if use lpt; then
		cd ${S}/aksparlnx
		make kernel26 || die
	fi
}

src_install() {
	dodir "/usr/sbin"
	dodir "/etc/init.d"
	cd ${S}/aksusbd
	dosbin aksusbd
	dosbin ${S}/hasptest/haspdemo

	if use wine; then
		dosbin ${S}/winehasp/winehasp
		newinitd "${FILESDIR}"/winehasp.init winehasp
	fi
	newinitd "${FILESDIR}"/aksusbd.init aksusbd

	if use net_hasp ; then
		insinto /etc/haspd
		doins hasplm/hasplm.conf

		newconfd  "${FILESDIR}"/hasplm.conf hasplm
		cp "${FILESDIR}"/hasplmd.conf ${D}/etc/conf.d/hasplmd
		dosbin ${S}/hasplm/hasplm
		dosbin ${S}/hasplmd/hasplmd
		dosbin ${S}/hasptest/nethaspdemo
	    newinitd "${FILESDIR}"/hasplm.init-8.30 hasplm
	    newinitd "${FILESDIR}"/hasplmd.init hasplmd
	fi
}
