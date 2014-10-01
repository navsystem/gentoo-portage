# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/x11-misc/xdg-utils/xdg-utils-1.1.0_rc2.ebuild,v 1.11 2014/03/24 15:11:02 ago Exp $

EAPI=5

MY_P=${P/_/-}

DESCRIPTION="Portland utils for cross-platform/cross-toolkit/cross-desktop interoperability"
HOMEPAGE="http://portland.freedesktop.org/"
SRC_URI="http://people.freedesktop.org/~rdieter/${PN}/${MY_P}.tar.gz"
#SRC_URI="http://portland.freedesktop.org/download/${MY_P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="alpha amd64 arm hppa ia64 ~mips ppc ppc64 ~s390 ~sh sparc x86 ~amd64-fbsd ~x86-fbsd ~x86-freebsd ~x86-interix ~amd64-linux ~x86-linux ~x86-macos ~sparc-solaris ~x64-solaris ~x86-solaris"
IUSE="doc +perl"

RDEPEND="dev-util/desktop-file-utils
	x11-misc/shared-mime-info
	x11-apps/xprop
	x11-apps/xset
	perl? ( dev-perl/File-MimeInfo )"
DEPEND="app-text/xmlto
	|| ( www-client/links www-client/lynx virtual/w3m )"

DOCS="README RELEASE_NOTES TODO" # ChangeLog is bogus, see git instead

RESTRICT="test" # Disabled because of sandbox violation(s)

S=${WORKDIR}/${MY_P}

src_configure() {
	export ac_cv_path_XMLTO="$(type -P xmlto) --skip-validation" #502166
	default
}

src_install() {
	default# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/x11-misc/xdg-utils/xdg-utils-1.1.0_rc2.ebuild,v 1.11 2014/03/24 15:11:02 ago Exp $

EAPI=5

MY_P=${P/_/-}

DESCRIPTION="Portland utils for cross-platform/cross-toolkit/cross-desktop interoperability"
HOMEPAGE="http://portland.freedesktop.org/"
SRC_URI="http://people.freedesktop.org/~rdieter/${PN}/${MY_P}.tar.gz"
#SRC_URI="http://portland.freedesktop.org/download/${MY_P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="alpha amd64 arm hppa ia64 