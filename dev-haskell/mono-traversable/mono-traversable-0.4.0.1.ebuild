# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=5

# ebuild generated by hackport 0.3.6.9999

CABAL_FEATURES="lib profile haddock hoogle hscolour test-suite"
inherit haskell-cabal

DESCRIPTION="Type classes for mapping, folding, and traversing monomorphic containers"
HOMEPAGE="https://github.com/snoyberg/mono-traversable"
SRC_URI="https://hackage.haskell.org/package/${P}/${P}.tar.gz"

LICENSE="MIT"
SLOT="0/${PV}"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND=">=dev-haskell/comonad-3.0.3:=[profile?]
	dev-haskell/hashable:=[profile?]
	>=dev-haskell/semigroupoids-3.0:=[profile?]
	>=dev-haskell/semigroups-0.9:=[profile?]
	>=dev-haskell/text-0.11:=[profile?]
	>=dev-haskell/transformers-0.3:=[profile?]
	>=dev-haskell/unordered-containers-0.2:=[profile?]
	>=dev-haskell/vector-0.10:=[profile?]
	>=dev-haskell/vector-algorithms-0.6:=[profile?]
	dev-haskell/vector-instances:=[profile?]
	>=dev-lang/ghc-7.0.1:=
"
DEPEND="${RDEPEND}
	>=dev-haskell/cabal-1.10.0.0
	test? ( dev-haskell/foldl
		dev-haskell/hspec
		dev-haskell/quickcheck )
"
