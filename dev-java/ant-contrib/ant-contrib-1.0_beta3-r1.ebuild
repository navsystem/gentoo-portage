# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-java/ant-contrib/ant-contrib-1.0_beta3-r1.ebuild,v 1.2 2014/08/10 20:07:08 slyfox Exp $

EAPI="5"

JAVA_PKG_IUSE="doc source"
WANT_ANT_TASKS="ant-ivy"

inherit java-pkg-2 java-ant-2

DESCRIPTION="A collection of tasks (and at one point maybe types and other tools) for Apache Ant"
HOMEPAGE="http://ant-contrib.sourceforge.net/"
SRC_URI="mirror://sourceforge/ant-contrib/${PN}-${PV/_beta/b}-src.tar.bz2"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~ppc ~ppc64 ~x86 ~x86-fbsd ~x86-freebsd ~amd64-linux ~x86-linux ~x86-macos"

#	test? ( dev-java/ant-junit dev-java/ant-testutil )
RDEPEND=">=virtual/jre-1.4
	>=dev-java/bcel-5.1:0
	dev-java/commons-httpclient:3
	dev-java/xerces:2
	dev-java/ant-ivy:0
	>=dev-java/ant-core-1.7.0"

# javatoolkit for cElementTree
DEPEND=">=virtual/jdk-1.4
	>=dev-java/javatoolkit-0.3.0-r2
	${RDEPEND}"

S="${WORKDIR}/${PN}"

rewrite_build_xml() {
	python <<EOF
import xml.etree.cElementTree as et
tree = et.Elem# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-java/ant-contrib/ant-contrib-1.0_beta3-r1.ebuild,v 1.2 2014/08/10 20:07:08 slyfox Exp $

EAPI="5"

JAVA_PKG_IUSE="doc source"
WANT_ANT_TASKS="ant-ivy"

inherit java-pkg-2 java-ant-2

DESCRIPTION="A collection of tasks (and at one point maybe types and other tools) for Apache Ant"
HOMEPAGE="http://ant-contrib.sourceforge.net/"
SRC_URI="mirror://sourceforge/ant-contrib/${PN}-${PV/_beta/b}-src.tar.bz2"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~ppc ~ppc64 ~x86 ~x86-fbsd ~x86-freebsd ~amd64-linux ~x86-linux ~x86-macos"

#	test? ( dev-java/ant-junit dev-java/ant-testutil )
RDEPEND=">=virtual/jre-1.4
	>=dev-java/bcel-5.1:0
	dev-java/commons-httpclient:3
	dev-java/xerces:2
	dev-java/ant-ivy:0
	>=dev-java/ant-core-1.7.0"

# javatoolkit for cElementTree
DEPEND=">=virtual/jdk-1.4
	>=dev-java/javatoolkit-0.3.0-r2
	${RDEPEND}"

S="$