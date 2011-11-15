# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="4"

inherit psiplus-plugin

MY_PN="${PN}"
DESCRIPTION="OTR Plugin for Psi"
HOMEPAGE="http://public.tfh-berlin.de/~s30935/"
SRC_URI="http://public.tfh-berlin.de/~s30935/files/${P}.tar.gz"

KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="
	app-text/htmltidy
	net-libs/libotr
"
RDEPEND="${DEPEND}"

PATCHES=( "${FILESDIR}"/trunk-compatibility.patch )
