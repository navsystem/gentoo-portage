# Copyright 1999-2007 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=2

inherit eutils flag-o-matic linux-mod linux-info

DESCRIPTION="HASP driver parallel port"
HOMEPAGE="http://www.aladdin.com"

MY_PN="aksparlnx"
MY_P="${MY_PN}-${PV}"
[[ ${ARCH} == "amd64" ]] && MY_ARCH="x86_64"
[[ ${ARCH} == "x86" ]] && MY_ARCH="i386"

SRC_URI="ftp://ftp.aladdin.com/pub/aladdin.de/hardlock/linux/v1.7/${MY_ARCH}/${MY_P}-${MY_ARCH}.tar.gz"
LICENSE="Proprietary"
SLOT="0"
KEYWORDS="-* amd64"
IUSE="kernel_linux"

DEPEND="kernel_linux? ( virtual/linux-sources )"

S="${WORKDIR}/${MY_P}-${MY_ARCH}"

pkg_setup() {
	if use kernel_linux ; then
		MODULE_NAMES="${MY_PN}(${MY_PN}:${S})"
		CONFIG_CHECK="PARPORT PARPORT_PC"

		linux-mod_pkg_setup
		if kernel_is 3 ; then 
			BUILD_PARAMS="KERNSRC=${KERNEL_DIR}" BUILD_TARGETS="kernel26" || die
		elif kernel_is 2 6 ; then
			BUILD_PARAMS="KERNSRC=${KERNEL_DIR}" BUILD_TARGETS="kernel26" || die
		elif kernel_is 2 4 ; then
			BUILD_PARAMS="KERNSRC=${KERNEL_DIR}" BUILD_TARGETS="kernel24" || die
		fi
	fi
}

src_prepare() {
	epatch "${FILESDIR}"/eter-fix.patch \
		"${FILESDIR}"/eter-3-fix.patch \
		"${FILESDIR}"/fix-makefile.patch \
		"${FILESDIR}"/fix-with-kernel-3.0-and-older.patch || die
}


src_compile() {
	if use kernel_linux ; then
		ARCH="${MY_ARCH}" emake "${BUILD_PARAMS}" "${BUILD_TARGETS}" || die
	fi
}

src_install() {
	if use kernel_linux ; then
		linux-mod_src_install || die
	fi
}

pkg_postinst() {
	[ -c /lib/udev/devices/Hardlock ] || mknod /lib/udev/devices/Hardlock c 42 0
	[ -c /lib/udev/devices/Hardlock ] && chmod 666 /lib/udev/devices/Hardlock
}

