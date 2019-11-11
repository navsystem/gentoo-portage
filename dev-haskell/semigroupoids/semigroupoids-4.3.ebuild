# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=5

# ebuild generated by hackport 0.4.3

CABAL_FEATURES="lib profile haddock hoogle hscolour test-suite"
inherit haskell-cabal

DESCRIPTION="Semigroupoids: Category sans id"
HOMEPAGE="https://github.com/ekmett/semigroupoids"
SRC_URI="https://hackage.haskell.org/package/${P}/${P}.tar.gz"

LICENSE="BSD"
SLOT="0/${PV}"
KEYWORDS="amd64 x86"
IUSE="+comonad +containers +contravariant +distributive"
RESTRICT="test"

RDEPEND=">=dev-haskell/semigroups-0.8.3.1:=[profile?] <dev-haskell/semigroups-1:=[profile?]
	>=dev-haskell/transformers-0.2:=[profile?] <dev-haskell/transformers-0.6:=[profile?]
	>=dev-haskell/transformers-compat-0.3:=[profile?] <dev-haskell/transformers-compat-0.5:=[profile?]
	>=dev-lang/ghc-7.4.1:=
	comonad? ( >=dev-haskell/comonad-4:=[profile?] <dev-haskell/comonad-5:=[profile?] )
	contravariant? ( >=dev-haskell/contravariant-0.2.0.1:=[profile?] <dev-haskell/contravariant-2:=[profile?] )
	distributive? ( >=dev-haskell/distributive-0.2.2:=[profile?] <dev-haskell/distributive-1:=[profile?] )
"
DEPEND="${RDEPEND}
	>=dev-haskell/cabal-1.8
"

src_configure() {
	haskell-cabal_src_configure \
		$(cabal_flag comonad comonad) \
		$(cabal_flag containers containers) \
		$(cabal_flag contravariant contravariant) \
		$(cabal_flag distributive distributive)
}
