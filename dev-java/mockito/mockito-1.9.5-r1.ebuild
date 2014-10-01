# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-java/mockito/mockito-1.9.5-r1.ebuild,v 1.1 2013/11/30 17:39:59 ercpe Exp $

EAPI="5"

JAVA_PKG_IUSE="doc source"

inherit java-pkg-2 java-pkg-simple

DESCRIPTION="A mocking framework for Java"
HOMEPAGE="https://code.google.com/p/m# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-java/mockito/mockito-1.9.5-r1.ebuild,v 1.1 2013/11/30 17:39:59 ercpe Exp $

EAPI="5"

JAVA_PKG_IUSE="doc source"

inherit java-pkg-2 java-pkg-simple

DESCRIPTION="A mocking framework for Java"
HOMEPAGE="https://code.google.com/p/mockito/"
SRC_URI="https://${PN}.googlecode.com/files/${P}.zip"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

IUSE=""

CDEPEND="dev-java/junit:4
	dev-java/objenesis:0
	dev-java/hamcrest-core:0
	