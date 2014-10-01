# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-libs/xalan-c/xalan-c-1.11.0_pre797991.ebuild,v 1.7 2011/12/18 17:26:24 armin76 Exp $

EAPI="2"

inherit toolchain-funcs eutils flag-o-matic multilib

DESCRIPTION="XSLT processor for transforming XML into HTML, text, or other XML types"
HOMEPAGE="http://xml.apache.org/xalan-c/"
SRC_URI="mirror://gentoo/Xalan-C_r${PV#*_pre}-src.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="amd64 ~ppc x86"
IUSE="doc examples nls threads"

RDEPEND=">=dev-libs/xerces-c-2.8.0"
#	icu? ( dev-libs/icu )"
DEPEND="${RDEPEND}
	doc? ( app-doc/doxygen )"

S="${WORKDIR}/xml-xalan/c"

pkg_setup() {
#	export ICUROOT="/usr"
	export XALANCROOT="${S}"
}

src_prepare() {
	epatch \
		"${FILESDIR}/${PV}-as-needed.patch" \
		"${FILESDIR}/${PV}-bugfixes.patch" \
		"${FILESDIR}/${PV}-parallel-build.patch"

	# - do not run configure in runConfigure
	# - echo the export commands instead exporting the vars
	# - remove -O3
	# - make sure our {C,CXX}FLAGS get respected
	sed -i \
		-e '/\/configure/d' \
		-e 's/^export \([a-zA-Z_]*\)/echo export \1=\\"$\1\\"/' \
		-e 's/\(debugflag\)="-O.\? /\1="/' \
		-e 's/^\(CXXFLAGS\)="$compileroptions/\1="${\1}/' \
		-e 's/^\(CFLAGS\)="$compileroptions/\1="${\1}/' \
		runConfigure || die "sed failed"
}

src_configure() {
	export XERCESCROOT="/usr"

	local target="linux"
	## Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-libs/xalan-c/xalan-c-1.11.0_pre797991.ebuild,v 1.7 2011/12/18 17:26:24 armin76 Exp $

EAPI="2"

inherit toolchain-funcs eutils flag-o-matic multilib

DESCRIPTION="XSLT processor for transforming XML into HTML, text, or other XML types"
HOMEPAGE="http://xml.apache.org/xalan-c/"
SRC_URI="mirror://gentoo/Xalan-C_r${PV#*_pre}-src.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="amd64 ~ppc x86"
IUSE="doc examples nls threads"

RDEPEND=">=dev-libs/xerces-c-2.8.0"
#	icu? ( dev-libs/icu )"
DEPEND="${RDEPEND}
	doc? ( app-doc/doxygen )"

S="${WORKDIR}/xml-xalan/c"

pkg_setup() {
#	export ICUROOT="/usr"
	export XALANCROOT="${S}"
}

src_prepare() {
	epatch \
		"${FILESDIR}/${PV}-as-needed.patch" \
		"${FILESDIR}/${PV}-bugfixes.patch" \
		"${FILESDIR}/${PV}-parallel-build.patch"

	# - do not run configure in runConfigure
	# - echo the export commands instead exporting the vars
	# - remove -O3
	# - make sure our {C,CXX}FLAGS get respected
	sed -i \
		-e '/\/configure/d' \
		-e 's/^export \([a-zA-Z_]*\)/ec