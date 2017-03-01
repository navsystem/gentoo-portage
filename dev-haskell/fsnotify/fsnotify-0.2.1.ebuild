# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=5

# ebuild generated by hackport 0.4.5

CABAL_FEATURES="lib profile haddock hoogle hscolour test-suite"
inherit haskell-cabal

DESCRIPTION="Cross platform library for file change notification"
HOMEPAGE="https://github.com/haskell-fswatch/hfsnotify"
SRC_URI="mirror://hackage/packages/archive/${PN}/${PV}/${P}.tar.gz"

LICENSE="BSD"
SLOT="0/${PV}"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND=">=dev-haskell/async-2.0.1:=[profile?]
	>=dev-haskell/hinotify-0.3.7:=[profile?]
	>=dev-haskell/text-0.11.0:=[profile?]
	>=dev-haskell/unix-compat-0.2:=[profile?]
	>=dev-lang/ghc-7.4.1:=
"
DEPEND="${RDEPEND}
	>=dev-haskell/cabal-1.8
	test? ( >=dev-haskell/tasty-0.5
		dev-haskell/tasty-hunit
		dev-haskell/temporary-rc )
"
