# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=5

# ebuild generated by hackport 0.3.4.9999

CABAL_FEATURES="lib profile haddock hoogle hscolour test-suite"
inherit haskell-cabal

DESCRIPTION="A typeclass-based Prelude"
HOMEPAGE="https://github.com/snoyberg/classy-prelude"
SRC_URI="mirror://hackage/packages/archive/${PN}/${PV}/${P}.tar.gz"

LICENSE="MIT"
SLOT="0/${PV}"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND=">=dev-haskell/async-2.0:=[profile?]
	>=dev-haskell/basic-prelude-0.3.6:=[profile?] <dev-haskell/basic-prelude-0.4:=[profile?]
	dev-haskell/hashable:=[profile?]
	>=dev-haskell/lifted-base-0.2:=[profile?]
	dev-haskell/monad-control:=[profile?]
	dev-haskell/mono-traversable:=[profile?]
	dev-haskell/semigroups:=[profile?]
	>=dev-haskell/system-filepath-0.4:=[profile?] <dev-haskell/system-filepath-0.5:=[profile?]
	dev-haskell/text:=[profile?]
	dev-haskell/transformers:=[profile?]
	dev-haskell/unordered-containers:=[profile?]
	dev-haskell/vector:=[profile?]
	dev-haskell/vector-instances:=[profile?]
	>=dev-lang/ghc-7.4.1:=
"
DEPEND="${RDEPEND}
	>=dev-haskell/cabal-1.8
	test? ( >=dev-haskell/hspec-1.3
		dev-haskell/quickcheck )
"
