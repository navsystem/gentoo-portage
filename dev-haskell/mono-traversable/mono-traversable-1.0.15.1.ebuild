# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

# ebuild generated by hackport 0.6.1.9999

CABAL_FEATURES="lib profile haddock hoogle hscolour test-suite"
inherit haskell-cabal

DESCRIPTION="Type classes for mapping, folding, and traversing monomorphic containers"
HOMEPAGE="https://github.com/snoyberg/mono-traversable#readme"
SRC_URI="https://hackage.haskell.org/package/${P}/${P}.tar.gz"

LICENSE="MIT"
SLOT="0/${PV}"
KEYWORDS="~amd64 ~arm64 ~ppc64 ~riscv ~x86"
IUSE=""

RDEPEND="dev-haskell/hashable:=[profile?]
	>=dev-haskell/split-0.2:=[profile?]
	>=dev-haskell/text-0.11:=[profile?]
	>=dev-haskell/unordered-containers-0.2:=[profile?]
	>=dev-haskell/vector-0.10:=[profile?]
	>=dev-haskell/vector-algorithms-0.6:=[profile?]
	>=dev-lang/ghc-8.2.1:= <dev-lang/ghc-9.1
"
DEPEND="${RDEPEND}
	>=dev-haskell/cabal-2.0.0.2
	test? ( dev-haskell/foldl
		dev-haskell/hspec
		dev-haskell/hunit
		dev-haskell/quickcheck
		dev-haskell/semigroups )
"
