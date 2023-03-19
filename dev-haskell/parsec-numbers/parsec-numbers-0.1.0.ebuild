# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

# ebuild generated by hackport 0.5.6.9999

CABAL_FEATURES="lib profile haddock hoogle hscolour"
inherit haskell-cabal

DESCRIPTION="Utilities for parsing numbers from strings"
HOMEPAGE="https://hackage.haskell.org/package/parsec-numbers"
SRC_URI="https://hackage.haskell.org/package/${P}/${P}.tar.gz"

LICENSE="BSD"
SLOT="0/${PV}"
KEYWORDS="amd64 ~arm64 ~ppc64 ~riscv ~x86"
IUSE="parsec1"

RDEPEND=">=dev-lang/ghc-7.4.1:=
	parsec1? ( dev-haskell/parsec1:=[profile?] )
	!parsec1? ( dev-haskell/parsec:=[profile?] )
"
DEPEND="${RDEPEND}
	>=dev-haskell/cabal-1.6
"

src_configure() {
	haskell-cabal_src_configure \
		$(cabal_flag parsec1 parsec1)
}
