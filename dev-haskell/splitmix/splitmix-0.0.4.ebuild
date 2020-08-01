# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

# ebuild generated by hackport 0.6.4

CABAL_FEATURES="lib profile haddock hoogle hscolour" # circular deps: test-suite"
inherit haskell-cabal

DESCRIPTION="Fast Splittable PRNG"
HOMEPAGE="http://hackage.haskell.org/package/splitmix"
SRC_URI="https://hackage.haskell.org/package/${P}/${P}.tar.gz"

LICENSE="BSD"
SLOT="0/${PV}"
KEYWORDS="~amd64 ~x86"
IUSE="optimised-mixer +random"

RESTRICT=test # circular deps: dev-haskell/splitmix[test]->dev-haskell/base-compat-batteries->dev-haskell/quickcheck->dev-haskell/splitmix

RDEPEND=">=dev-lang/ghc-7.4.1:=
	random? ( >=dev-haskell/random-1.0:=[profile?] <dev-haskell/random-1.2:=[profile?] )
"
DEPEND="${RDEPEND}
	>=dev-haskell/cabal-1.10
"

src_configure() {
	haskell-cabal_src_configure \
		$(cabal_flag optimised-mixer optimised-mixer) \
		$(cabal_flag random random)
}
