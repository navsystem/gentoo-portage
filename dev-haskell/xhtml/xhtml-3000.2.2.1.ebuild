# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

# ebuild generated by hackport 0.3.2.9999

CABAL_FEATURES="lib profile haddock hoogle hscolour"
inherit haskell-cabal

DESCRIPTION="An XHTML combinator library"
HOMEPAGE="https://github.com/haskell/xhtml"
SRC_URI="https://hackage.haskell.org/package/${P}/${P}.tar.gz"

LICENSE="BSD"
SLOT="0/${PV}"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND=">=dev-lang/ghc-8.4.2:="
DEPEND="${RDEPEND}
	>=dev-haskell/cabal-1.6"

CABAL_CORE_LIB_GHC_PV="PM:8.4.2_rc1 PM:8.4.2 PM:8.4.3 PM:8.4.4 PM:8.6.1 PM:8.6.2 PM:8.6.3 PM:8.6.4 PM:8.6.5 PM:8.8.1 PM:8.8.2 PM:8.8.3 PM:8.8.4 PM:8.8.4-r1 PM:8.10.1 PM:8.10.2 PM:8.10.3 PM:8.10.4 PM:8.10.4-r1 PM:8.10.5 PM:8.10.5-r1 PM:9.0.1 PM:9.0.1-r1 PM:9999"
