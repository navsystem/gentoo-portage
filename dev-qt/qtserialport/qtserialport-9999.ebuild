# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="4"

inherit qt4-r2 git-2

EGIT_REPO_URI="git://gitorious.org/qt/qtserialport.git"
EGIT_BRANCH="stable"

DESCRIPTION="Qt library for access to serial ports"
HOMEPAGE="http://qt.gitorious.org/qt/qtserialport"
LICENSE="GPL-3 LGPL-2.1"
SLOT="4"
KEYWORDS="~amd64 ~x86"
IUSE="debug"

DEPEND="dev-qt/qtcore:4"
RDEPEND="${DEPEND}"
