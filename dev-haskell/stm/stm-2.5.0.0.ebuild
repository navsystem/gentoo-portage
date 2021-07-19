# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

# ebuild generated by hackport 0.5.6.9999

CABAL_FEATURES="lib profile haddock hoogle hscolour"
inherit haskell-cabal

DESCRIPTION="Software Transactional Memory"
HOMEPAGE="https://wiki.haskell.org/Software_transactional_memory"
SRC_URI="https://hackage.haskell.org/package/${P}/${P}.tar.gz"

LICENSE="BSD"
SLOT="0/${PV}"
# keep in sync with ghc-8.6
KEYWORDS="~amd64 ~x86 ~amd64-linux ~x86-linux"
IUSE=""

RDEPEND=">=dev-lang/ghc-7.4.1:=
	>=dev-haskell/nats-0.1.3:=[profile?] <dev-haskell/nats-1.2:=[profile?]
"
DEPEND="${RDEPEND}
	>=dev-haskell/cabal-1.10
"

CABAL_CORE_LIB_GHC_PV="PM:8.6.1 PM:8.6.2 PM:8.6.3 PM:8.6.4 PM:8.6.5 PM:8.8.1 PM:8.8.2 PM:8.8.3 PM:8.8.4 PM:8.8.4-r1 PM:8.10.1_alpha1 PM:8.10.1_alpha2 PM:8.10.1 PM:8.10.2 PM:8.10.3 PM:8.10.4 PM:8.10.4-r1 PM:9.0.1 PM:9.0.1-r1 PM:9999"
