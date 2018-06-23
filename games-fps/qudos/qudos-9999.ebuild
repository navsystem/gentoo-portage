# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $id$

EAPI=5
inherit eutils toolchain-funcs games git-r3

DESCRIPTION="Enhanced Quake 2 engine"
HOMEPAGE="https://github.com/eegorov/qudos"
EGIT_REPO_URI="https://github.com/eegorov/qudos.git"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="alsa cdinstall dedicated demo dga ipv6 joystick mods opengl qmax oss sdl textures"

UIDEPEND="alsa? ( media-libs/alsa-lib )
	opengl? (
		virtual/opengl
		virtual/glu )
	sdl? ( media-libs/libsdl )
	virtual/jpeg
	media-libs/libogg
	media-libs/libpng
	media-libs/libvorbis
	sys-libs/zlib
	x11-libs/libX11
	x11-libs/libXext
	x11-libs/libXxf86dga
	x11-libs/libXxf86vm"
RDEPEND="${UIDEPEND}
	cdinstall? ( games-fps/quake2-data )
	demo? ( games-fps/quake2-demodata )
	textures? ( games-fps/quake2-textures )"
DEPEND="${UIDEPEND}"

default_client() {
	if use opengl || use sdl || ! use dedicated ; then
		# Build default client
		return 0
	fi
	return 1
}

pkg_setup() {
	games_pkg_setup

	local alert_user

	if ! use qmax && $( use opengl || use sdl ) ; then
		elog "The 'qmax' graphical improvements are recommended."
		echo
		alert_user=y
	fi

	# Determine the default sound driver, in order of preference
	# snd_drv is not a local variable
	snd_drv=""
	[[ -z "${snd_drv}" ]] && use oss && snd_drv="oss"
	[[ -z "${snd_drv}" ]] && use sdl && snd_drv="sdl"
	[[ -z "${snd_drv}" ]] && use alsa && snd_drv="alsa"
	# Default if nothing else chosen
	[[ -z "${snd_drv}" ]] && snd_drv="oss"

	if default_client ; then
		elog "Selected the ${snd_drv} sound driver as the default."
		echo
		if [[ "${snd_drv}" = "alsa" ]] ; then
			ewarn "The ALSA sound driver for this game is incomplete."
			# OSS is the default sound driver in the Makefile
			ewarn "The 'oss' USE flag is recommended instead."
			echo
			alert_user=y
		fi
	fi

	if [[ -n "${alert_user}" ]] ; then
		ebeep
		epause
	fi
}

src_prepare() {
	# Change default sound driver and its location
	sed -i src/client/snd_dma.c \
		-e "s:\"oss\":\"${snd_drv}\":" \
		-e "s:\"\./snd:\"$(games_get_libdir)/${PN}/snd:" \
		|| die "sed snd_dma.c failed"

	sed -i \
		-e 's:jpeg_mem_src:qudos_jpeg_mem_src:g' \
		src/ref_gl/gl_image.c || die

	has_version '>=sys-libs/zlib-1.2.5.1-r1' && \
		sed -i -e '1i#define OF(x) x' src/qcommon/unzip/ioapi.h

	epatch \
		"${FILESDIR}"/qudos-0.40.1-libpng15.patch \
		"${FILESDIR}"/qudos-0.40.1-gnusource.patch
}

src_compile() {
	yesno() { use $1 && echo YES || echo NO ; }

	local client="YES"
	default_client || client="NO"

	local type="release"

	emake \
		BUILD_QUAKE2="${client}" \
		BUILD_DEDICATED=$(yesno dedicated) \
		BUILD_GLX=$(yesno opengl) \
		BUILD_SDLGL=$(yesno sdl) \
		BUILD_ALSA_SND=$(yesno alsa) \
		BUILD_SDL_SND=$(yesno sdl) \
		BUILD_OSS_SND=$(yesno oss) \
		WITH_XMMS=NO \
		WITH_DGA_MOUSE=$(yesno dga) \
		WITH_JOYSTICK=$(yesno joystick) \
		TYPE="${type}" \
		DATADIR="${dir}" \
		LOCALBASE=/usr \
		LIBDIR="$(games_get_libdir)"/${PN} \
		WITH_QMAX=$(yesno qmax) \
		BUILD_3ZB2=$(yesno mods) \
		BUILD_CTF=$(yesno mods) \
		BUILD_JABOT=$(yesno mods) \
		BUILD_ROGUE=$(yesno mods) \
		BUILD_XATRIX=$(yesno mods) \
		BUILD_ZAERO=$(yesno mods) \
		WITH_BOTS=$(yesno mods) \
		HAVE_IPV6=$(yesno ipv6) \
		CC="$(tc-getCC)" \
		WITH_X86_ASM=NO \
		WITH_DATADIR=YES \
		WITH_LIBDIR=YES \
		BUILD_DEBUG_DIR=release \
		BUILD_RELEASE_DIR=release \
		|| die "emake failed"
}

src_install() {
	if default_client ; then
		newgamesbin ${PN}/QuDos ${PN} \
			|| die "newgamesbin QuDos failed"
		newicon data/quake2.png ${PN}.png \
			|| die "newicon failed"
		make_desktop_entry ${PN} "QuDos" ${PN}
	fi

	if use dedicated ; then
		newgamesbin ${MY_PN}/QuDos-ded ${PN}-ded \
			|| die "newgamesbin QuDos-ded failed"
	fi

	insinto "$(games_get_libdir)"/${PN}
	doins -r ${PN}/* || die "doins libs failed"
	rm "${D}/$(games_get_libdir)"/${PN}/QuDos

	insinto "$(games_get_libdir)"/${PN}/baseq2
	newins quake2/baseq2/${PN}.pk3 ${PN}.pk3 || die "doins pk3 failed"

	dodoc $(find docs -name \*.txt) docs/q2_orig/README*

	prepgamesdirs
}

pkg_postinst() {
	games_pkg_postinst

	if use demo && ! has_version "games-fps/quake2-demodata[symlink]" ; then
		ewarn "To play the Quake 2 demo,"
		ewarn "emerge games-fps/quake2-demodata with the 'symlink' USE flag."
		echo
	fi
}
