# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5
inherit eutils fdo-mime gnome2-utils pax-utils unpacker

DESCRIPTION="Spotify is a social music platform"
HOMEPAGE="https://www.spotify.com/ch-de/download/previews/"
MY_PV_AMD64="${PV}.124.g4dfabc51"
MY_PV_I386="${PV}.122.gf29d9be0"
MY_P="${PN}-client_"
SRC_BASE="http://repository.spotify.com/pool/non-free/${PN:0:1}/${PN}-client/"
SRC_URI="amd64? ( ${SRC_BASE}${MY_P}${MY_PV_AMD64}_amd64.deb )
	x86? ( ${SRC_BASE}${MY_P}${MY_PV_I386}_i386.deb )"
LICENSE="Spotify"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="gnome pulseaudio"
RESTRICT="mirror strip"

DEPEND=""
RDEPEND="
	${DEPEND}
	dev-libs/nss
	gnome-base/gconf
	media-libs/alsa-lib
	media-libs/harfbuzz[fontconfig]
	media-libs/mesa
	net-misc/curl
	net-print/cups[ssl]
	sys-libs/glibc
	x11-libs/gtk+:2
	x11-libs/libXScrnSaver
	x11-libs/libXtst
	pulseaudio? ( media-sound/pulseaudio )
	gnome? ( gnome-extra/gnome-integration-spotify )"

S=${WORKDIR}/

QA_PREBUILT="opt/spotify/spotify-client/spotify"

src_prepare() {
	# Fix desktop entry to launch spotify-dbus.py for GNOME integration
	if use gnome ; then
	sed -i \
		-e 's/spotify \%U/spotify-dbus.py \%U/g' \
		usr/share/spotify/spotify.desktop || die "sed failed"
	fi
	#TODO: the semicolons will be fixed in 1.0.15, remove it then
	sed -i \
		-e 's/x-scheme-handler\/spotify$/x-scheme-handler\/spotify\;/g' \
		-e 's/AudioVideo$/AudioVideo\;/g' \
		usr/share/spotify/spotify.desktop || die "sed failed"
}

src_install() {
	dodoc usr/share/doc/spotify-client/changelog.Debian.gz

	SPOTIFY_PKG_HOME=usr/share/spotify
	insinto /usr/share/pixmaps
	doins ${SPOTIFY_PKG_HOME}/icons/*.png

	# install in /opt/spotify
	SPOTIFY_HOME=/opt/spotify/spotify-client
	insinto ${SPOTIFY_HOME}
	doins -r ${SPOTIFY_PKG_HOME}/*
	fperms +x ${SPOTIFY_HOME}/spotify

	dodir /usr/bin
	cat <<-EOF >"${D}"/usr/bin/spotify
		#! /bin/sh
		exec ${SPOTIFY_HOME}/spotify "\$@"
	EOF
	fperms +x /usr/bin/spotify

	for size in 16 22 24 32 48 64 128 256 512; do
		newicon -s ${size} "${S}${SPOTIFY_PKG_HOME}/icons/spotify-linux-${size}.png" \
			"spotify-client.png"
	done
	domenu "${S}${SPOTIFY_PKG_HOME}/spotify.desktop"
}

pkg_preinst() {
	gnome2_icon_savelist
}

pkg_postinst() {
	gnome2_icon_cache_update
	fdo-mime_mime_database_update
	fdo-mime_desktop_database_update

	ewarn "If Spotify crashes after an upgrade its cache may be corrupt."
	ewarn "To remove the cache:"
	ewarn "rm -rf ~/.cache/spotify"
	ewarn
	ewarn "If you use KDE and are upgrading from 0.9 to 1.0, you might still see the old icon."
	ewarn "Run"
	ewarn "$ rm /var/tmp/kdecache-\$USER/icon-cache.kcache"
	ewarn "Then log out and log in back to KDE."
}

pkg_postrm() {
	gnome2_icon_cache_update
	fdo-mime_mime_database_update
	fdo-mime_desktop_database_update
}
