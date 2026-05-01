# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake git-r3

DESCRIPTION="Better Blur"
#EGIT_REPO_URI="https://github.com/taj-ny/kwin-effects-forceblur.git"
EGIT_REPO_URI="https://github.com/xarblu/kwin-effects-better-blur-dx.git"

KEYWORDS="amd64"

LICENSE="GPL-3"
SLOT="0"

DEPEND="kde-frameworks/extra-cmake-modules
		kde-frameworks/breeze-icons
		kde-frameworks/karchive
		kde-frameworks/kauth
		kde-frameworks/kcmutils
		kde-frameworks/kcodecs
		kde-frameworks/kcolorscheme
		kde-frameworks/kconfig
		kde-frameworks/kconfigwidgets
		kde-frameworks/kcoreaddons
		kde-frameworks/kcrash
		kde-frameworks/kglobalaccel
		kde-frameworks/kguiaddons
		kde-frameworks/ki18n
		kde-frameworks/kiconthemes
		kde-frameworks/kidletime
		kde-frameworks/kio
		kde-frameworks/kitemviews
		kde-frameworks/kjobwidgets
		kde-frameworks/knotifications
		kde-frameworks/kpackage
		kde-frameworks/kservice
		kde-frameworks/kwidgetsaddons
		kde-frameworks/kwindowsystem
		kde-frameworks/kxmlgui
		kde-frameworks/solid"
