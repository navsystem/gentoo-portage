# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=5

# ebuild generated by hackport 0.3.6.9999

CABAL_FEATURES="lib profile haddock hoogle hscolour test-suite"
inherit haskell-cabal

DESCRIPTION="Stick your haskell variables into javascript/coffeescript at compile time"
HOMEPAGE="http://www.yesodweb.com/book/shakespearean-templates"
SRC_URI="mirror://hackage/packages/archive/${PN}/${PV}/${P}.tar.gz"

LICENSE="MIT"
SLOT="0/${PV}"
KEYWORDS="~amd64 ~x86"
IUSE="test_coffee test_export test_roy"

RDEPEND=">=dev-haskell/aeson-0.5:=[profile?]
	>=dev-haskell/shakespeare-1.2:=[profile?] <dev-haskell/shakespeare-1.3:=[profile?]
	>=dev-haskell/text-0.7:=[profile?]
	>=dev-lang/ghc-6.10.4:=
"
DEPEND="${RDEPEND}
	>=dev-haskell/cabal-1.8
	test? ( >=dev-haskell/hspec-1.3
		dev-haskell/hunit )
"

src_configure() {
	haskell-cabal_src_configure \
		$(cabal_flag test_coffee test_coffee) \
		$(cabal_flag test_export test_export) \
		$(cabal_flag test_roy test_roy)
}
