# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit dune

DESCRIPTION="Cram like framework for OCaml"
HOMEPAGE="https://github.com/janestreet/ppx_expect"
SRC_URI="https://github.com/janestreet/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0/${PV}"
KEYWORDS="~amd64 ~arm ~arm64 ~x86"
IUSE="+ocamlopt test"
RESTRICT="!test? ( test )"

DEPEND="
	dev-ml/base:=
	dev-ml/ppx_assert:=
	dev-ml/ppx_compare:=
	dev-ml/ppx_custom_printf:=
	dev-ml/ppx_fields_conv:=
	dev-ml/ppx_here:=
	dev-ml/ppx_inline_test:=
	dev-ml/ppx_sexp_conv:=
	dev-ml/ppx_variants_conv:=
	dev-ml/stdio:=
	>=dev-ml/ppxlib-0.18.0:=
		dev-ml/ocaml-compiler-libs:=
		dev-ml/ocaml-migrate-parsetree:=
			dev-ml/result:=
	dev-ml/re:=
"
RDEPEND="${DEPEND}"
DEPEND="${DEPEND}
	test? (
		dev-ml/ppx_jane
	)"

PATCHES=( "${FILESDIR}"/${P}-ppxlib-0.18.0.patch )
