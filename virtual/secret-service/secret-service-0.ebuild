# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="Virtual for a freedesktop.org Secret Service API provider"
SLOT="0"
KEYWORDS="amd64 arm arm64 ~loong ~mips ppc ppc64 ~riscv sparc x86 ~amd64-linux ~x86-linux ~ppc-macos ~x86-solaris"

RDEPEND="|| (
	gnome-base/gnome-keyring
	app-admin/keepassxc
)"
# TODO: add the KDE provider here once ready, still WIP as of June 2021 though
# (see https://bugs.kde.org/show_bug.cgi?id=313216)
