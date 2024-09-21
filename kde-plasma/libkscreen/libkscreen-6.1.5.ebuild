# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

ECM_QTHELP="true"
ECM_TEST="forceoptional"
KFMIN=6.5.0
QTMIN=6.7.2
inherit ecm plasma.kde.org

DESCRIPTION="Plasma screen management library"

LICENSE="GPL-2" # TODO: CHECK
SLOT="6/8"
KEYWORDS="amd64 arm64 ~ppc64 ~riscv ~x86"
IUSE=""

# requires running session
RESTRICT="test"

# slot op: Uses Qt::GuiPrivate for qtx11extras_p.h
RDEPEND="
	dev-libs/wayland
	>=dev-qt/qtbase-${QTMIN}:6=[dbus,gui]
	>=dev-qt/qtwayland-${QTMIN}:6
	>=kde-frameworks/kconfig-${KFMIN}:6
	x11-libs/libxcb:=
"
DEPEND="${RDEPEND}
	>=dev-libs/plasma-wayland-protocols-1.13.0
"
BDEPEND="
	>=dev-qt/qttools-${QTMIN}:6[linguist]
	>=dev-qt/qtwayland-${QTMIN}:6
	dev-util/wayland-scanner
"
