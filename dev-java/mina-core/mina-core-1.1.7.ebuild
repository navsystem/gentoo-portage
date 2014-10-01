# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-java/mina-core/mina-core-1.1.7.ebuild,v 1.6 2011/03/25 19:28:22 xarthisius Exp $

JAVA_PKG_IUSE="doc source"

inherit eutils java-pkg-2 java-ant-2

DESCRIPTION="Apache MINA Project"
HOMEPAGE="http://mina.apache.org/"
SRC_URI="mirror://gentoo/${P}-sources.jar"
LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="amd64 ppc ppc64 x86"
IUSE=""

RDEPEND=">=virtual/jre-1.5
	dev-java/slf4j-api"
DEPEND=">=virtual/jdk-1.5
	dev-java/slf4j-api
	app-arch/unzi# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-java/mina-core/mina-core-1.1.7.ebuild,v 1.6 2011/03/25 19:28:22 xarthisius Exp $

JAVA_PKG_IUS