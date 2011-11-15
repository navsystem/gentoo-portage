# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=3

inherit eutils flag-o-matic rpm

DESCRIPTION="Hardware Against Software Piracy for access to parallel and usb keys"
HOMEPAGE="http://www.etersoft.ru"
SRC_URI="http://download.etersoft.ru/pub/Etersoft/HASP/3.2/sources/Gentoo/2009/haspd-3.2-eter7gentoo.src.rpm"
LICENSE="Alladin"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="net_hasp wine lpt demo"

RDEPEND="lpt? ( >=app-emulation/hasp-par-1.7-r3 )"
DEPEND="${RDEPEND}"

S=${WORKDIR}/haspd-3.2

pkg_preinst() {
	if [ ! -f /proc/bus/usb/devices ]; then
		eerror "Check kernel for CONFIG_USB_DEVICEFS... "
	if [ ! -d /proc/bus/usb ] ; then
		eerror "You have to use kernel with CONFIG_USB_DEVICEFS enabled"
		die "You have to mount usbfs (usbdevfs) filesystem into /proc/bus/usb, f.i.: mount -t usbfs none /proc/bus/usb"
	fi
fi
}

src_unpack() {
	rpm_unpack
	#cd ${WORKDIR}
	unpack ./haspd-3.2.tar.bz2
}


src_install() {
	dodir "/usr/sbin"
	dodir "/etc/init.d"
	dosbin aksusbd/aksusbd || die
	use demo && ( dosbin hasptest/haspdemo || die )
	use wine && {
		dosbin winehasp/winehasp || die
		newinitd "${FILESDIR}"/winehasp.init winehasp || die
	}
	newinitd "${FILESDIR}"/aksusbd.init aksusbd || die

	use net_hasp && {
		dodir "/etc/haspd"
		dodir "/etc/conf.d"
		insinto /etc/haspd
		doins hasplm/hasplm.conf || die
		newconfd "${FILESDIR}"/hasplm.conf hasplm || die
		newconfd "${FILESDIR}"/hasplmd.conf hasplmd || die
		dosbin hasplm/hasplm || die
		dosbin hasplmd/hasplmd || die
		use demo && ( dosbin hasptest/nethaspdemo || die )
		newinitd "${FILESDIR}"/hasplm.init-8.30 hasplm || die
		newinitd "${FILESDIR}"/hasplmd.init hasplmd || die
	}
}
