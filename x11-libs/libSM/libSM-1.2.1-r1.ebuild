# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/x11-libs/libSM/libSM-1.2.1-r1.ebuild,v 1.3 2014/06/18 21:02:55 mgorny Exp $

EAPI=5

XORG_DOC=doc
XORG_MULTILIB=yes
inherit xorg-2

DESCRIPTION="X.Org Session Management library"

KEYWORDS="~alpha ~amd64 ~arm ~hppa ~ia64 ~mips ~ppc ~ppc64 ~s390 ~sh ~sparc ~x86 ~ppc-aix ~amd64-fbsd ~x86-fbsd ~x64-freebsd ~x86-freebsd ~hppa-hpux ~ia64-hpux ~x86-interix ~amd64-linux ~arm-linux ~x86-linux ~ppc-macos ~x64-macos ~x86-macos ~sparc-solaris ~sparc64-solaris ~x64-solaris ~x86-solaris ~x86-winnt"# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/x11-libs/libSM/libSM-1.2.1-r1.ebuild,v 1.3 2014/06/18 21:02:55 mgorny Exp $

EAPI=5

XORG_DOC=doc
XORG_MULTILIB=yes
inherit xorg-2

DESCRIPTION="X.Org Session Management library"

KEYWORDS="~alpha ~amd64 ~arm ~hppa ~ia64 ~mips ~ppc ~ppc64 ~s390 ~sh ~sparc ~x86 ~ppc-aix ~amd64-fbsd ~x86-fbsd ~x64-freebsd ~x86-freebsd ~hppa-hpux ~ia64-hpux ~x86-interix ~amd64-linux ~arm-linux ~x86-linux ~ppc-macos ~x64-macos ~x86-macos ~sparc-solaris ~sparc64-solaris ~x64-solaris ~x86-solaris ~x86-winnt"
IUSE="doc ipv6 +uuid"

RDEPEND=">=x11-libs/libICE-1.0.8-r1[${MULTILIB_USEDEP}]
	x11-libs/xtrans
	>=x11-proto/xproto-7.0.24[${MULTILIB_USEDEP}]
	!elibc_FreeBSD? ( !elibc_SunOS? (
		uuid? (
			>=sys-apps/util-linux-2.16
			amd64? ( abi_x86_32? (
				app-emulation/emul-linux-x86-baselibs[development] ) )
		)
	) )"
DEPEND="${RDEPEND}"

pkg_setup() {
	local withuuid=$(use_with uuid libuuid)
	xorg-2_pkg_setup

	# do not use uuid even if available in libc (like on FreeBSD)
	use uuid || export ac_cv_func_uuid_create=no

	if use uuid ; then
		case ${CHOST} in
			*-solaris*|*-darwin*)
				if [[ ! -d ${EROOT}usr/include/uuid ]] &&
					[[ -d ${ROOT}usr/include/uuid ]]
				then
					# Solaris and Darwin h