# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

# ebuild generated by hackport 0.8.4.0.9999

CABAL_FEATURES="lib profile haddock hoogle"
# avoid Cabal dependency as it's a dependency of most packages
# including cabal depends.
CABAL_FEATURES+=" nocabaldep"
inherit haskell-cabal

DESCRIPTION="Colourise Haskell code"
HOMEPAGE="https://code.haskell.org/~malcolm/hscolour/"

LICENSE="LGPL-2.1"
SLOT="0/${PV}"
KEYWORDS="~amd64 ~arm64 ~ppc64 ~riscv ~x86"

RDEPEND=">=dev-lang/ghc-8.10.6:=
"
DEPEND="${RDEPEND}
"

src_configure() {
	# llvm-general-pure passes rtsopts
	haskell-cabal_src_configure --ghc-options=-rtsopts
}

src_install() {
	cabal_src_install
	if use doc; then
		docinto html
		dodoc hscolour.css
	fi
}
