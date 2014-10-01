# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-java/nailgun/nailgun-0.7.1-r1.ebuild,v 1.3 2012/06/25 05:57:35 jdhore Exp $

EAPI="2"

JAVA_PKG_IUSE="doc source"

inherit java-pkg-2 java-ant-2

DESCRIPTION="a client, protocol, and server for running Java apps without incurring the JVM startup overhead"
HOMEPAGE="http://martiansoftware.com/nailgun/index.html"
SRC_URI="mirror://sourceforge/${PN}/${PN}-src-${PV}.zip"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="amd64 ~ppc x86"
IUSE="test"

RDEPEND=">=virtual/jre-1.4
	!app-editors/ng"
DEPEND=">=virtual/jdk-1.4
	dev-java/java-getopt:1
	dev-java/bcel:0
	dev-java/jakarta-oro:2.0
	dev# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-java/nailgun/nailgun-0.7.1-r1.ebuild,v 1.3 2012/06/25 05:57:35 jdhore Exp $

EAPI="2"

JAVA_PKG_IUSE="doc source"

inherit java-pkg-2 java-ant-2

DESCRIPTION="a client, protocol, and server for running Java apps without incurring the JVM startup overhead"
HOMEPAGE="http://martiansoftware.com/nailgun/index.html"
SRC_URI="mirror://sourceforge/${PN}/${PN}-src-${PV}.zip"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="amd64 ~ppc x86"
IUSE="test"

RDEPEND=">=virtual/jre-1.4
	!app-editors/ng"
DEPEND=">=virtual/jdk-1.4
	dev-java/java-getopt:1
	dev-java/bcel:0
	dev-java/jakarta-oro:2.0
	dev-java/log4j:0
	app-arch/unzip
	dev-java/junit:0
	test? (
		dev-java/ant-junit:0
	)"

#need jcoverage
RESTRICT="test"

java_prepare() {
	rm -vf ng* beansh
	find . -iname '*.jar' -delete

	epatch "${FILESDIR}/${PV}-r1-Makefile.patch"

	sed -i '/<arg line="ng.exe/d' build.xml || die
	sed -i 's/