# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-java/msv/msv-20050627-r2.ebuild,v 1.10 2012/01/01 15:35:16 sera Exp $

EAPI=1
JAVA_PKG_IUSE="doc source"

inherit java-pkg-2 eutils java-ant-2

DESCRIPTION="Multi-Schema XML Validator, a Java tool for validating XML documents"
HOMEPAGE="http://www.sun.com/software/xml/developers/multischema/ https://msv.dev.java.net/"
SRC_URI="mirror://gentoo/${PN}.${PV}.zip"

LICENSE="BSD Apache-1.1"
SLOT="0"
KEYWORDS="amd64 ppc ppc64 x86 ~x86-fbsd ~x86-freebsd ~amd64-linux ~x86-linux ~ppc-macos ~x86-macos ~sparc# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-java/msv/msv-20050627-r2.ebuild,v 1.10 2012/01/01 15:35:16 sera Exp $

EAPI=1
JAVA_PKG_IUSE="doc source"

inherit java-pkg-2 eutils java-ant-2

DESCRIPTION="Multi-Schema XML Validator, a Java tool for validating XML documents"
HOMEPAGE="http://www.sun.com/software/xml/developers/multischema/ https://msv.dev.java.net/"
SRC_URI="mirror://gentoo/${PN}.${PV}.zip"

LICENSE="BSD Apache-1.1"
SLOT="0"
KEYWORDS="amd64 ppc ppc64 x86 ~x86-fbsd ~x86-freebsd ~amd64-linux ~x86-linux ~ppc-macos ~x86-macos ~sparc-solaris ~x64-solaris ~x86-solaris"
IUSE=""

RDEPEND=">=virtual/jre-1