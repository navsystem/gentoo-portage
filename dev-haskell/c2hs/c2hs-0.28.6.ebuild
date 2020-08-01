# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=6

# ebuild generated by hackport 0.5.6.9999

CABAL_FEATURES="" # test-suite fails to build: https://github.com/haskell/c2hs/issues/245
inherit haskell-cabal

DESCRIPTION="C->Haskell FFI tool that gives some cross-language type safety"
HOMEPAGE="https://github.com/haskell/c2hs"
SRC_URI="https://hackage.haskell.org/package/${P}/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="regression"

RESTRICT=test # broken against shelly-1.9: https://github.com/haskell/c2hs/issues/245

RDEPEND="dev-haskell/dlist:=
	dev-haskell/fail:=
	>=dev-haskell/language-c-0.7.1:= <dev-haskell/language-c-0.9:=
	>=dev-lang/ghc-7.4.1:=
	regression? ( >=dev-haskell/shelly-1.0:=
			dev-haskell/text:=
			>=dev-haskell/yaml-0.8:= )
"
DEPEND="${RDEPEND}
	>=dev-haskell/cabal-1.10
"

src_configure() {
	haskell-cabal_src_configure \
		$(cabal_flag regression regression)
}
