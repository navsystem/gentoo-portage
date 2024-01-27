# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit desktop pax-utils xdg optfeature

# Usage: arch_src_uri <gentoo arch> <upstream arch>
arch_src_uri() {
	echo "${1}? (
		https://github.com/VSCodium/${PN}/releases/download/${PV}/VSCodium-linux-${2}-${PV}.tar.gz
			-> ${P}-${1}.tar.gz
	)"
}

DESCRIPTION="A community-driven, freely-licensed binary distribution of Microsoft's VSCode"
HOMEPAGE="https://vscodium.com/"
SRC_URI="
	$(arch_src_uri amd64 x64)
	$(arch_src_uri arm armhf)
	$(arch_src_uri arm64 arm64)
"
S="${WORKDIR}"

LICENSE="
	Apache-2.0
	BSD
	BSD-1
	BSD-2
	BSD-4
	CC-BY-4.0
	ISC
	LGPL-2.1+
	MIT
	MPL-2.0
	openssl
	PYTHON
	TextMate-bundle
	Unlicense
	UoI-NCSA
	W3C
"
SLOT="0"
KEYWORDS="-* amd64 ~arm ~arm64"
IUSE="egl kerberos wayland"
RESTRICT="strip bindist"

RDEPEND="
	>=app-accessibility/at-spi2-core-2.46.0:2
	app-crypt/libsecret[crypt]
	app-misc/ca-certificates
	dev-libs/expat
	dev-libs/glib:2
	dev-libs/nspr
	dev-libs/nss
	media-libs/alsa-lib
	media-libs/libcanberra[gtk3]
	media-libs/libglvnd
	media-libs/mesa
	net-misc/curl
	net-print/cups
	sys-apps/dbus
	sys-libs/zlib
	sys-process/lsof
	x11-libs/cairo
	x11-libs/gtk+:3
	x11-libs/libdrm
	x11-libs/libnotify
	x11-libs/libX11
	x11-libs/libxcb
	x11-libs/libXcomposite
	x11-libs/libXdamage
	x11-libs/libXext
	x11-libs/libXfixes
	x11-libs/libxkbcommon
	x11-libs/libxkbfile
	x11-libs/libXrandr
	x11-libs/libXScrnSaver
	x11-libs/pango
	x11-misc/xdg-utils
	kerberos? ( app-crypt/mit-krb5 )
"

QA_PREBUILT="*"

src_install() {
	# Cleanup
	rm "${S}/resources/app/LICENSE.txt" || die

	if ! use kerberos; then
		rm -r "${S}/resources/app/node_modules.asar.unpacked/kerberos" || die
	fi

	# Install
	pax-mark m codium
	mkdir -p "${ED}/opt/${PN}" || die
	cp -r . "${ED}/opt/${PN}" || die
	fperms 4711 /opt/${PN}/chrome-sandbox

	dosym -r "/opt/${PN}/bin/codium" "usr/bin/vscodium"
	dosym -r "/opt/${PN}/bin/codium" "usr/bin/codium"

	local EXEC_EXTRA_FLAGS=()
	if use wayland; then
		EXEC_EXTRA_FLAGS+=( "--ozone-platform-hint=auto" )
	fi
	if use egl; then
		EXEC_EXTRA_FLAGS+=( "--use-gl=egl" )
	fi

	sed "s|@exec_extra_flags@|${EXEC_EXTRA_FLAGS[*]}|g" \
		"${FILESDIR}/vscodium-url-handler.desktop" \
		> "${T}/vscodium-url-handler.desktop" || die

	sed "s|@exec_extra_flags@|${EXEC_EXTRA_FLAGS[*]}|g" \
		"${FILESDIR}/vscodium.desktop" \
		> "${T}/vscodium.desktop" || die

	domenu "${T}/vscodium.desktop"
	domenu "${T}/vscodium-url-handler.desktop"
	newicon "resources/app/resources/linux/code.png" "vscodium.png"
}

pkg_postinst() {
	xdg_pkg_postinst
	elog "When compared to the regular VSCode, VSCodium has a few quirks"
	elog "More information at: https://github.com/VSCodium/vscodium/blob/master/DOCS.md"
	optfeature "keyring support inside vscode" "virtual/secret-service"
}
