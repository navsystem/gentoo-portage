# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/sys-apps/lm_sensors/lm_sensors-3.3.1.ebuild,v 1.10 2012/10/18 18:58:50 maekke Exp $

EAPI=3
inherit eutils linux-info toolchain-funcs multilib

DESCRIPTION="Hardware Monitoring user-space utilities"
HOMEPAGE="http://www.lm-sensors.org/"
SRC_URI="http://dl.lm-sensors.org/lm-sensors/releases/${P}.tar.bz2"

LICENSE="GPL-2 LGPL-2.1"
SLOT="0"
KEYWORDS="alpha amd64 ~arm ~mips ppc sparc x86 ~amd64-linux ~x86-linux"
IUSE="sensord static-libs"

RDEPEND="dev-lang/perl
	sensord? (
		net-analyzer/rrdtool
		virtual/logger
		)"
DEPEND="${RDEPEND}
	sys-apps/sed
	sys-devel/bison
	sys-devel/flex"

CONFIG_CHECK="~HWMON ~I2C_CHARDEV ~I2C"
WARNING_HWMON="${PN} requires CONFIG_HWMON to be enabled for use."
WARNING_I2C_CHARDEV="sensors-detect requires CONFIG_I2C_CHARDEV to be enabled."
WARNING_I2C="${PN} requires CONFIG_I2C to be enabled for most sensors."

src_prepare() {
	epatch "${FILESDIR}"/${PN}-3.3.1-sensors-detect-gentoo.patch

	if use sensord; then
		sed -i -e 's:^#\(PROG_EXTRA.*\):\1:' Makefile || die
	fi

	# Respect LDFLAGS
	sed -i -e 's/\$(LIBDIR)$/\$(LIBDIR) \$(LDFLAGS)/g' Makefile || die

	if ! use static-libs; then
		sed -i -e '/^BUILD_STATIC_LIB/d' Makefile || die
	fi
}

src_compile() {
	einfo
	einfo "You may safely ignore any errors from compilation"
	einfo "that contain \"No such file or directory\" references."
	einfo

	emake CC="$(tc-getCC)" || die
}

src_install() {
	emake \
		DESTDIR="${D}" \
		PREFIX="${EPREFIX}/usr" \
		MANDIR="${EPREFIX}/usr/share/man" \
		ETCDIR="${EPREFIX}/etc" \
		LIBDIR="${EPREFIX}/usr/$(get_libdir)" \
		install || die

	newinitd "${FILESDIR}"/lm_sensors-3-init.d lm_sensors || die
	newinitd "${FILESDIR}"/fancontrol-init.d fancontrol || die

	if use sensord; then
		newconfd "${FILESDIR}"/sensord-conf.d sensord || die
		newinitd "${FIL# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/sys-apps/lm_sensors/lm_sensors-3.3.1.ebuild,v 1.10 2012/10/18 18:58:50 maekke Exp $

EAPI=3
inherit eutils linux-info toolchain-funcs multilib

DESCRIPTION="Hardware Monitoring user-space utilities"
HOMEPAGE="http://www.lm-sensors.org/"
SRC_URI="http://dl.lm-sensors.org/lm-sensors/releases/${P}.tar.bz2"

LICENSE="GPL-2 LGPL-2.1"
SLOT="0"
KEYWORDS="alpha amd64 ~arm ~mips ppc sparc x86 ~amd64-linux ~x86-linux"
IUSE="sensord static-libs"

RDEPEND="dev-lang/perl
	sensord? (
		net-analyzer/rrdtool
		virtual/logger
		)"
DEPEND="${RDEPEND}
	sys-apps/sed
	sys-devel/bison
	sys-devel/flex"

CONFIG_CHECK="~HWMON ~I2C_CHARDEV ~I2C"
WARNING_HWMON="${PN} requires CONFIG_HWMON to be enabled for use."
WARNING_I2C_CHARDEV="sensors-detect requires CONFIG_I2C_CHARDEV to be enabled."
WARNING_I2C="${PN} requires CONFIG_I2C to be enabled for most sensors."

src_prepare() {
	epatch "${FILESDIR}"/${PN}-3.3.1-sensors-detect-gentoo.patch

	if use sensord; then
		sed -i -e 's:^#\(PROG_EXTRA.*\):\1:' Makefile || die
	fi

	# Respect LDFLAGS
	sed -i -e 's/\$(LIBDIR)$/\$(LIBDIR) \$(LDFLAGS)/g' Makefile || die

	if ! use static-libs; then
		sed -i -e '/^BUILD_STATI