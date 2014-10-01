# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/kde-base/smokeqt/smokeqt-4.14.0.ebuild,v 1.1 2014/08/20 16:02:41 johu Exp $

EAPI=5

DECLARATIVE_REQUIRED="optional"
MULTIMEDIA_REQUIRED="optional"
QTHELP_REQUIRED="optional"
OPENGL_REQUIRED="optional"
KDE_REQUIRED="never"

inherit kde4-base

DESCRIPTION="Scripting Meta Object Kompiler Engine - Qt bindings"
KEYWORDS=" ~amd64 ~arm ~ppc ~ppc64 ~x86 ~amd64-linux ~x86-linux"
IUSE="debug +phonon qimageblitz qscintilla qwt webkit"
HOMEPAGE="http://techbase.kde.org/Development/Languages/Smoke"

# Maybe make more of Qt optional?
DEPEND="
	$(add_kdebase_dep smokegen)
	dev-qt/qtcore:4
	dev-qt/qtdbus:4
	|| ( ( >=dev-qt/qtgui-4.8.5:4 dev-qt/designer:4 ) <dev-qt/qtgui-4.8.5:4 )
	dev-qt/qtscript:4
	dev-qt/qtsql:4
	dev-qt/qtsvg# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/kde-base/smokeqt/smokeqt-4.14.0.ebuild,v 1.1 2014/08/20 16:02:41 johu Exp $

EAPI=5

DECLARATIVE_REQUIRED="optional"
MULTIMEDIA_REQUIRED="optional"
QTHELP_REQUIRED="optional"
OPENGL_REQUIRED="optional"
KDE_REQUIRED="never"

inherit kde4-base

DESCRIPTION="Scripting Meta Object Kompiler Engine - Qt bindings"
KEYWORDS=" ~amd64 ~arm ~ppc ~ppc64 ~x86 ~amd64-linux ~x86-linux"
IUSE="debug +phonon qimageblitz qscintilla qwt webkit"
HOMEPAGE="http://techbase.kde.org/Development/Languages/Smoke"

# Maybe make more of Qt optional?
DEPEND="
	$(add_kdebase_dep smokegen)
	dev-qt/qtcore:4
	dev-qt/qtdbus:4
	|| ( ( >=dev-qt/