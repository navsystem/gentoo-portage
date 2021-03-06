# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

# rafaelmartins: Please try to keep the live ebuild synchronized with
# the latest snapshot ebuild. e.g.:
# cp kicad-YYYYMMDD_pXXXX.ebuild kicad-99999999.ebuild

EAPI=5

WX_GTK_VER="2.8"

inherit cmake-utils wxwidgets fdo-mime gnome2-utils git-2

DESCRIPTION="Electronic Schematic and PCB design tools."
HOMEPAGE="http://kicad.sourceforge.net"
EGIT_REPO_URI="git://github.com/KiCAD/kicad.git"

SRC_URI=""

LICENSE="GPL-2"
SLOT="0"

KEYWORDS=""
if [[ "${PV}" != "99999999" ]]; then
	KEYWORDS="~amd64 ~ppc ~ppc64 ~x86"
fi

IUSE="debug examples minimal python"

CDEPEND="x11-libs/wxGTK:2.8[X,opengl,gnome]"
DEPEND="${CDEPEND}
	>=dev-util/cmake-2.6.0
	>=dev-libs/boost-1.40[python?]
	app-arch/xz-utils"
RDEPEND="${CDEPEND}
	sys-libs/zlib
	sci-electronics/electronics-menu"

src_unpack() {
	EGIT_REPO_URI="git://github.com/KiCAD/kicad.git" git-2_src_unpack
	if ! use minimal; then
		EGIT_REPO_URI="git://github.com/musa/kicad-library.git" \
		EGIT_SOURCEDIR="${S}/kicad-library" \
		EGIT_CACHE_DIR="kicad-library" \
		git-2_src_unpack
	fi
}
src_prepare() {
	sed -i \
		-e '/add_subdirectory(template)/ a \
			add_subdirectory(kicad-doc)\
			add_subdirectory(kicad-library)' \
		-e 's/create_svn_version_header()/#create_svn_version_header()/' \
		-e 's/ -O2 / /' \
		CMakeLists.txt || die 'sed failed'

	sed -i \
		-e 's/Scientific;Development/Engineering;Electronics/' \
		resources/linux/mime/applications/*.desktop || die 'sed failed'

	# Use native boost
	sed -i -e '/Boost/s/^#check_find_package/check_find_package/' \
		-e '/Boost/s/^#find_package/find_package/' CMakeLists.txt || die "sed failed"

	# Add important doc files
	sed -i -e 's/INSTALL.txt/AUTHORS.txt CHANGELOG.txt README.txt TODO.txt/' CMakeLists.txt || die "sed failed"

	# Fix desktop files
	rm resources/linux/mime/applications/eeschema.desktop
	sed -i -e 's/Development;//' resources/linux/mime/applications/kicad.desktop || die "sed failed"

	# Handle optional minimal install
	if use minimal ; then
		sed -i -e '/add_subdirectory(template)/d' \
			-e '/add_subdirectory(kicad-library)/d' CMakeLists.txt || die "sed failed"
	fi

	sed -i -e '/add_subdirectory(kicad-doc)/d' CMakeLists.txt || die "sed failed"

	# Install examples in the right place if requested
	if use examples ; then
		sed -i -e 's:${KICAD_DATA}/demos:${KICAD_DOCS}/examples:' CMakeLists.txt || die "sed failed"
	else
		sed -i -e '/add_subdirectory(demos)/d' CMakeLists.txt || die "sed failed"
	fi
}

src_configure() {
	need-wxwidgets unicode

	mycmakeargs="${mycmakeargs}
		-DKICAD_MINIZIP=OFF
		-DKICAD_CYRILLIC=ON
		-DwxUSE_UNICODE=ON
		-DKICAD_GOST=OFF
		-DKICAD_AUIMANAGER=OFF
		-DKICAD_AUITOOLBAR=OFF
		-DKICAD_DOCS=/usr/share/doc/${PF}
		-DKICAD_HELP=/usr/share/doc/${PF}
		$(cmake-utils_use python KICAD_PYTHON)"

	if [[ "${PV}" = "99999999" ]]; then
		mycmakeargs="${mycmakeargs} -DKICAD_TESTING_VERSION=ON"
	else
		mycmakeargs="${mycmakeargs} -DKICAD_STABLE_VERSION=ON"
	fi

	cmake-utils_src_configure
}

src_compile() {
	cmake-utils_src_compile
}

src_install() {
	cmake-utils_src_install
}

pkg_preinst() {
	gnome2_icon_savelist
}

pkg_postinst() {
	fdo-mime_desktop_database_update
	fdo-mime_mime_database_update
	gnome2_icon_cache_update

	if use minimal ; then
		ewarn "If the schematic and/or board editors complain about missing libraries when you"
		ewarn "open old projects, you will have to take one or more of the following actions :"
		ewarn "- Install the missing libraries manually."
		ewarn "- Remove the libraries from the 'Libs and Dir' preferences."
		ewarn "- Fix the libraries' locations in the 'Libs and Dir' preferences."
		ewarn "- Emerge kicad without the 'minimal' USE flag."
		elog
	fi
	elog "You may want to emerge media-gfx/wings if you want to create 3D models of components."
}

pkg_postrm() {
	fdo-mime_desktop_database_update
	fdo-mime_mime_database_update
	gnome2_icon_cache_update
}
