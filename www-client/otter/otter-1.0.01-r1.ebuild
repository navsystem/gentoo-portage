# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7
inherit cmake desktop xdg-utils

DESCRIPTION="Project aiming to recreate classic Opera (12.x) UI using Qt5"
HOMEPAGE="https://otter-browser.org/"
SRC_URI="https://github.com/OtterBrowser/${PN}-browser/archive/v${PV/_p/-dev}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~ppc64 ~x86"
IUSE="spell"

DEPEND="
	dev-qt/qtconcurrent:5
	dev-qt/qtcore:5
	dev-qt/qtdbus:5
	dev-qt/qtdeclarative:5
	dev-qt/qtgui:5
	dev-qt/qtmultimedia:5
	dev-qt/qtnetwork:5[ssl]
	dev-qt/qtprintsupport:5
	dev-qt/qtscript:5
	dev-qt/qtsql:5
	dev-qt/qtsvg:5
	dev-qt/qtwidgets:5
	dev-qt/qtxmlpatterns:5
	spell? ( kde-frameworks/sonnet )
	>=dev-qt/qtwebengine-5.9:5[widgets]
"
RDEPEND="
	${DEPEND}
"
DOCS=( CHANGELOG CONTRIBUTING.md TODO )
S=${WORKDIR}/${PN}-browser-${PV/_p/-dev}
PATCHES=(
	"${FILESDIR}"/${PN}-1.0.01-qtgui-5.15.0.patch
	"${FILESDIR}"/${PN}-1.0.01-webengine.patch
)

src_prepare() {
	cmake_src_prepare

	if [[ -n ${LINGUAS} ]]; then
		local lingua
		for lingua in resources/translations/*.qm; do
			lingua=$(basename ${lingua})
			lingua=${lingua/otter-browser_/}
			lingua=${lingua/.qm/}
			if ! has ${lingua} ${LINGUAS}; then
				rm resources/translations/otter-browser_${lingua}.qm || die
			fi
		done
	fi

	if ! use spell; then
		sed -i -e '/find_package(KF5Sonnet)/d' CMakeLists.txt || die
	fi
}

src_configure() {
	mycmakeargs=(
		-DENABLE_QTWEBENGINE=true
		-DENABLE_QTWEBKIT=false
	)

	cmake_src_configure
}

src_install() {
	cmake_src_install
	domenu ${PN}-browser.desktop
}

pkg_postinst() {
	xdg_desktop_database_update
	xdg_icon_cache_update
}

pkg_postrm() {
	xdg_desktop_database_update
	xdg_icon_cache_update
}
