# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

MY_PN="${PN%-*}"
MY_PV="${PV/_rc/-rc.}"

inherit desktop xdg

DESCRIPTION="Time Desktop application"
HOMEPAGE="https://downloads.time-messenger.ru/"

SRC_URI="
	amd64? ( https://downloads.time-messenger.ru/desktop/linux/time-desktop-linux-x64.tar.gz )
"
S="${WORKDIR}"

LICENSE="Apache-2.0 GPL-2+ LGPL-2.1+ MIT"
SLOT="0"
# Starting with 5.2.0 upstream dropped x86 for their binary release #879519
if [[ ${PV} != *rc* ]]; then
	KEYWORDS="amd64"
fi

RDEPEND="
	>=app-accessibility/at-spi2-core-2.46.0:2[X]
	dev-libs/expat
	dev-libs/glib:2
	dev-libs/nspr
	dev-libs/nss
	dev-libs/wayland
	media-libs/alsa-lib
	media-libs/mesa
	net-print/cups
	sys-apps/dbus
	sys-libs/glibc
	virtual/libudev
	x11-libs/cairo
	x11-libs/gdk-pixbuf:2
	x11-libs/gtk+:3[X]
	x11-libs/libX11
	x11-libs/libXcomposite
	x11-libs/libXdamage
	x11-libs/libXext
	x11-libs/libXfixes
	x11-libs/libXrandr
	x11-libs/libdrm
	x11-libs/libxcb
	x11-libs/libxkbcommon
	x11-libs/pango
"

QA_PREBUILT="
	opt/time-desktop/time-desktop
	opt/time-desktop/libnode.so
	opt/time-desktop/libffmpeg.so
	opt/time-desktop/libGLESv2.so
	opt/time-desktop/libEGL.so
	opt/time-desktop/libvk_swiftshader.so
	opt/time-desktop/libvulkan.so.1
	opt/time-desktop/resources/*
"

DOCS=(
	README.md
)

src_install() {
	if use amd64; then
		cd time-desktop-${PV}-linux-x64 || die
	fi
	newicon app_icon.png ${MY_PN}.png

	insinto "/opt/${MY_PN}/locales"
	doins locales/*.pak

	insinto "/opt/${MY_PN}/resources"
	doins -r resources/*.asar*

	insinto "/opt/${MY_PN}"
	doins *.pak *.bin *.dat
	exeinto "/opt/${MY_PN}"
	doexe *.so *.so.* "${MY_PN}"

	dosym -r "/opt/${MY_PN}/${MY_PN}" "/usr/bin/${MY_PN}"

	make_desktop_entry \
		"${MY_PN} --enable-features=WaylandWindowDecorations --ozone-platform-hint=auto %U" \
		Time "${MY_PN}" "Network;InstantMessaging;" \
		"MimeType=x-scheme-handler/Time;\nStartupWMClass=Time"

	einstalldocs
}
