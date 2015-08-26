# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI="5"

inherit oasis

DESCRIPTION="Platform-independent core of Async RPC library"
HOMEPAGE="https://bitbucket.org/yminsky/ocaml-core/wiki/Home"
SRC_URI="http://ocaml.janestreet.com/ocaml-core/${PV%.*}/files/${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0/${PV}"
KEYWORDS="~amd64"
IUSE=""

DEPEND="dev-ml/camlp4:=
	dev-ml/async_kernel:=
	dev-ml/bin-prot:=
	dev-ml/comparelib:=
	dev-ml/core_kernel:=
	dev-ml/custom_printf:=
	dev-ml/fieldslib:=
	dev-ml/pa_ounit:=
	dev-ml/sexplib:="
RDEPEND="${DEPEND}"

DOCS=( "CHANGES.md" )
