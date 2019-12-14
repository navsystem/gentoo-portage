# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

# ebuild generated by hackport 0.5.6.9999

CABAL_FEATURES="lib profile haddock hoogle hscolour"
inherit haskell-cabal

DESCRIPTION="Run tests by filtering the tests depending on the result of previous runs"
HOMEPAGE="https://github.com/ocharles/tasty-rerun"
SRC_URI="https://hackage.haskell.org/package/${P}/${P}.tar.gz"

LICENSE="BSD"
SLOT="0/${PV}"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND=">=dev-haskell/mtl-2.1.2:=[profile?]
	>=dev-haskell/optparse-applicative-0.6:=[profile?]
	>=dev-haskell/reducers-3.10.1:=[profile?]
	>=dev-haskell/split-0.1:=[profile?] <dev-haskell/split-0.3:=[profile?]
	>=dev-haskell/stm-2.4.2:=[profile?]
	>=dev-haskell/tagged-0.7:=[profile?] <dev-haskell/tagged-0.9:=[profile?]
	>=dev-haskell/tasty-0.10:=[profile?]
	>=dev-lang/ghc-7.8.2:=
"
DEPEND="${RDEPEND}
	>=dev-haskell/cabal-1.18.1.3
"

src_prepare() {
	default

	cabal_chdeps \
		'base >=4.6 && <4.13' 'base >=4.6' \
		'tasty >=0.10 && <1.2' 'tasty >=0.10'
}
