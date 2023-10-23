# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

# ebuild generated by hackport 0.8.0.0.9999
#hackport: flags: -allwarnings,+separatesyb,+usebytestrings,+splitbase,+iecfpextension

CABAL_FEATURES="lib profile haddock hoogle hscolour test-suite"
inherit haskell-cabal

DESCRIPTION="Analysis and generation of C code"
HOMEPAGE="https://visq.github.io/language-c/"

LICENSE="BSD"
SLOT="0/${PV}"
KEYWORDS="~amd64 ~arm64 ~ppc64 ~riscv ~x86"

RDEPEND="
	|| ( dev-lang/ghc dev-haskell/process[profile?] )
	>=dev-lang/ghc-8.4.3:=
"
DEPEND="${RDEPEND}
	dev-haskell/alex
	>=dev-haskell/cabal-2.2.0.1
	dev-haskell/happy
"

src_configure() {
	haskell-cabal_src_configure \
		--flag=-allwarnings \
		--flag=iecfpextension \
		--flag=separatesyb \
		--flag=splitbase \
		--flag=usebytestrings
}
