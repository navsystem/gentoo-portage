# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-java/jython/jython-2.1-r11.ebuild,v 1.11 2012/01/01 12:24:17 sera Exp $

inherit base java-pkg-2

DESCRIPTION="An implementation of Python written in Java"
HOMEPAGE="http://www.jython.org"
MY_PV="21"
#SRC_URI="mirror://sourceforge/${PN}/${PN}-${MY_PV}.class"
SRC_URI="mirror://gentoo/${P}.tar.bz2"
LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64 ppc ppc64 x86 ~x86-fbsd"
IUSE="readline source doc"
# servlet

CDEPEND="=dev-java/jakarta-oro-2.0*
	readline? ( >=dev-java/libreadline-java-0.8.0 )"
#	servlet? ( >=www-servers/tomcat-5.0 )
RDEPEND=">=virtual/jre-1.4
	${CDEPEND}"
DEPEND=">=virtual/jdk-1.4
	source? ( app-arch/zip )
	${CDEPEND}"

src_unpack() {
	unpack ${A}
	cd ${S}

	epatch ${FILESDIR}/${PV}-assert.patch
	epatch ${FILESDIR}/${PV}-assert-SimpleCompiler.py.patch

	# bug #160861
	rm -rf org/apache
}

src_compile() {
	local cp="$(java-pkg_getjars jakarta-oro-2.0)"
	local exclude=""

	if use readline ; then
		cp=${cp}:$(java-pkg_getjars libreadline-java)
	else
		exclude="${exclude} ! -name ReadlineConsole.java"
	fi

	#if use servlet; then
	#	cp=${cp}:$(java-pkg_getjars servlet)
	#else
		exclude="${exclude} ! -name PyServlet.java"
	#fi

	ejavac -classpath ${cp} -nowarn $(find org -name "*.java" ${exclude})

	find org -name "*.cla# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-java/jython/jython-2.1-r11.ebuild,v 1.11 2012/01/01 12:24:17 sera Exp $

inherit base java-pkg-2

DESCRIPTION="An implementation of Python written in Java"
HOMEPAGE="http://www.jython.org"
MY_PV="21"
#SRC_URI="mirror://sourceforge/${PN}/${PN}-${MY_PV}.class"
SRC_URI="mirror://gentoo/${P}.tar.bz2"
LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64 ppc ppc64 x86 ~x86-fbsd"
IUSE="readline source doc"
# servlet

CDEPEND="=dev-java/jakarta-oro-2.0*
	readline? ( >=dev-java/libreadline-java-0.8.0 )"
#	servlet? ( >=www-servers/tomcat-5.0 )
RDEPEND=">=virtual/jre-1.4
	${CDEPEND}"
DEPEND=">=virtual/jdk-1.4
	source? ( app-arch/zip )
	${CDEPEND}"

src_unpack() {
	unpack ${A}
	cd ${S}

	epatch ${FILESDIR}/${PV}-assert.patch
	epatch ${FILESDIR}/${PV}-assert-SimpleCompiler.py.patch

	# bug #160861
	rm -rf org/apache
}

src_compile() {
	local cp="$(java-pkg_getjars jakarta-oro-2.0)"
	local exclude=""

	if use readline ; then
		cp=${cp}:$(java-pkg_getjars libreadline-java)
	else
		exclude="${exclude} ! -name ReadlineConsole.java"
	fi

	#if use servlet; then
	#	cp=${cp}:$(java-pkg_getjars servlet)
	#else
		exclude="${exclude} ! -name PyServlet.java"
	#fi

	ejavac -classpath ${cp} -nowarn $(find org -name "*.java" ${exclude})

	find org -name "*.class" | xargs jar cf ${PN}.jar

	# bug 115551
	cd Lib/jxxload_help
	ejavac -classpath ${S}/${PN}.jar -nowarn *.java
	rm -f *.java Makefile
}

src_install() {
	java-pkg_