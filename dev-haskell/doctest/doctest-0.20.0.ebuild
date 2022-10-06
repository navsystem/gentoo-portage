# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

# ebuild generated by hackport 0.7.1.1.9999

CABAL_FEATURES="lib profile haddock hoogle hscolour" # test-suite
inherit haskell-cabal

# Buggy tests
# May be related: <https://github.com/sol/doctest/pull/135>
RESTRICT="test"

DESCRIPTION="Test interactive Haskell examples"
HOMEPAGE="https://github.com/sol/doctest#readme"
HACKAGE_REV="5"
SRC_URI="https://hackage.haskell.org/package/${P}/${P}.tar.gz
	https://hackage.haskell.org/package/${P}/revision/${HACKAGE_REV}.cabal -> ${PF}.cabal"

LICENSE="MIT"
SLOT="0/${PV}"
KEYWORDS="~amd64 ~arm64 ~ppc64 ~riscv ~x86"

RDEPEND=">=dev-haskell/base-compat-0.7.0:=[profile?]
	>=dev-haskell/code-page-0.1:=[profile?]
	>=dev-haskell/ghc-paths-0.1.0.9:=[profile?]
	>=dev-haskell/syb-0.3:=[profile?]
	>=dev-lang/ghc-8.10.1:=
"
DEPEND="${RDEPEND}
	>=dev-haskell/cabal-3.2.0.0"
#	test? ( >=dev-haskell/hspec-2.3.0
#		>=dev-haskell/hspec-core-2.3.0
#		dev-haskell/hunit
#		dev-haskell/mockery
#		>=dev-haskell/quickcheck-2.13.1
#		dev-haskell/setenv
#		>=dev-haskell/silently-1.2.4
#		>=dev-haskell/stringbuilder-0.4 )
BDEPEND="app-text/dos2unix"

src_prepare() {
	# pull revised cabal from upstream
	cp "${DISTDIR}/${PF}.cabal" "${S}/${PN}.cabal" || die

	# Convert to unix line endings
	dos2unix "${S}/${PN}.cabal" || die

	# Apply patches *after* pulling the revised cabal
	default
}
