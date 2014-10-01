# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/media-libs/x264/x264-0.0.20120327.ebuild,v 1.2 2012/05/15 13:12:19 aballier Exp $

EAPI=4

if [ "${PV#9999}" != "${PV}" ] ; then
	V_ECLASS="git-2"
else
	V_ECLASS="versionator"
fi

inherit multilib toolchain-funcs flag-o-matic ${V_ECLASS}

if [ "${PV#9999}" = "${PV}" ]; then
	MY_P="x264-snapshot-$(get_version_component_range 3)-2245"
fi
DESCRIPTION="A free library for encoding X264/AVC streams"
HOMEPAGE="http://www.videolan.org/developers/x264.html"
if [ "${PV#9999}" != "${PV}" ] ; then
	EGIT_REPO_URI="git://git.videolan.org/x264.git"
	SRC_URI=""
else
	SRC_URI="http://download.videolan.org/pub/videolan/x264/snapshots/${MY_P}.tar.bz2"
fi

LICENSE="GPL-2"
SLOT="0"
if [ "${PV#9999}" != "${PV}" ]; then
	KEYWORDS=""
else
	KEYWORDS="~alpha ~amd64 ~mips ~ppc ~ppc64 ~sparc ~x86 ~amd64# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/media-libs/x264/x264-0.0.20120327.ebuild,v 1.2 2012/05/15 13:12:19 aballier Exp $

EAPI=4

if [ "${PV#9999}" != "${PV}" ] ; then
	V_ECLASS="git-2"
else
	V_ECLASS="versionator"
fi

inherit multilib toolchain-funcs flag-o-matic ${V_ECLASS}

if [ "${PV#9999}" = "${PV}" ]; then
	MY_P="x264-snapshot-$(get_version_component_range 3)-2245"
fi
DESCRIPTION="A free library for encoding X264/AVC streams"
HOMEPAGE="http://www.videolan.org/developers/x264.html"
if [ "${PV#9999}" != "${PV}" ] ; then
	EGIT_REPO_URI="git://git.videolan.org/x264.git"
	SRC_URI=""
else
	SRC_URI="http://download.videolan.org/pub/videolan/x264/snapshots/${MY_P}.tar.bz2"
fi

LICENSE="GPL-2"
SLOT="0"
if [ "${PV#9999}" != "${PV}" ]; then
	KEYWORDS=""
else
	KEYWORDS="~alpha ~amd64 ~mips ~ppc ~ppc64 ~sparc ~x86 ~amd64-fbsd ~x86-fbsd ~amd64-linux ~x86-linux ~ppc-macos ~x64-macos ~x86-macos"
fi
IUSE="10bit custom-cflags debug +interlaced pic static-libs +threads"

RDEPEND=""
DEPEND="amd64? ( >=dev-lang/yasm-1 )
	x86? ( >=dev-lang/yasm-1 )
	x86-fbsd? ( >=dev-lang/yasm-1 )"

if [ "${PV#9999}" = "${PV}" ]; then
	S="${WORKDIR}/${MY_P}"
fi

DOCS="AUTHORS doc/*.txt"

src_configure() {
	tc-export CC

	local myconf=""
	use 10bit && myconf+=" --bit-depth=10"
	use debug && myconf+=" --enable-debug"
	use interlaced || myconf+=" --dis