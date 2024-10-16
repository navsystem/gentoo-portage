# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit toolchain-funcs git-r3

DESCRIPTION="Support for printing to ZjStream-based printers"
HOMEPAGE="http://foo2zjs.rkkda.com/"

LICENSE="GPL-2"
SLOT="0"
PROPERTIES="live"
IUSE="test"

EGIT_REPO_URI="https://github.com/koenkooi/foo2zjs.git"

RESTRICT="bindist !test? ( test )"

RDEPEND="net-print/cups
	net-print/foomatic-db-engine
	>=net-print/cups-filters-1.0.43-r1[foomatic]
	virtual/udev"
DEPEND="${RDEPEND}"
BDEPEND="app-arch/unzip
	app-editors/vim
	net-misc/wget
	sys-apps/ed
	app-alternatives/bc
	test? ( sys-process/time )"

#S="${WORKDIR}/${PN}"

src_prepare() {
	eapply "${FILESDIR}/${PN}-udev.patch"\
		"${FILESDIR}/${PN}-usbbackend.patch"

	# Prevent an access violation.
	sed -e "s~/etc~${D}/etc~g" -i Makefile || die
	sed -e "s~/etc~${D}/etc~g" -i hplj1000 || die

	# Prevent an access violation, do not create symlinks on live file system
	# during installation.
	sed -e 's/ install-filter / /g' -i Makefile || die

	# Prevent an access violation, do not remove files from live filesystem
	# during make install
	sed -e '/rm .*LIBUDEVDIR)\//d' -i Makefile || die
	sed -e '/rm .*lib\/udev\/rules.d\//d' -i hplj1000 || die

	default
}

src_compile() {
	MAKEOPTS=-j1 CC="$(tc-getCC)" default
}

src_test() {
	# see bug 419787
	: ;
}

src_install() {
	# ppd files are installed automagically. We have to create a directory
	# for them.
	dodir /usr/share/ppd

	emake DESTDIR="${D}" -j1 install install-hotplug
}
