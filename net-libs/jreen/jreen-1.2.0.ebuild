# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/net-libs/jreen/jreen-1.2.0.ebuild,v 1.4 2014/07/18 11:42:25 nimiux Exp $

EAPI=5

if [[ ${PV} != *9999* ]]; then
	SRC_URI="https://github.com/euroelessar/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"
	KEYWORDS="amd64 ~ppc x86"
else
	GIT_ECLASS="git-r3"
	EGIT_REPO_URI=( "git://github.com/euroelessar/${PN}" )
	KEYWORDS=""
fi

inherit cmake-utils multibuild ${GIT_ECLASS}

DESCRIPTION="Qt XMPP library"
HOMEPAGE="https://github.com/euroelessar/jreen"

LICENSE="GPL-2"
SLOT="0"
IUSE="debug +qt4 qt5"

REQUIRED_USE="|| ( qt4 qt5 )"

DEPEND="
	media-libs/speex
	net-libs/libgsasl
	sys-libs/zl# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/net-libs/jreen/jreen-1.2.0.ebuild,v 1.4 2014/07/18 11:42:25 nimiux Exp $

EAPI=5

if [[ ${PV} != *9999* ]]; then
	SRC_URI="https://github.com/euroelessar/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"
	KEYWORDS="amd64 ~ppc x86"
else
	GIT_ECLASS="git-r3"
	EGIT_REPO_URI=( "git://github.com/euroelessar/${PN}" )
	KEYWORDS=""
fi

inherit cmake-utils multibuild ${GIT_ECLASS}

DESCRIPTION="Qt XMPP library"
HOMEPAGE="https://github.com/euroelessar/jreen"

LICENSE="GPL-2"
SLOT="0"
IUSE="debug +qt4 qt5"

REQUIRED_USE="|| ( qt4 qt5 )"

DEPEND="
	media-libs/speex
	net-libs/libgsasl
	sys-libs/zlib
	qt4? (
		>=dev-qt/qtcore-4.6.0:4
		>=dev-qt/qtgui-4.6.0:4
	)
	qt5? (
		dev-qt/qtcore:5
		dev-qt/qtnetwork:5
	)
"