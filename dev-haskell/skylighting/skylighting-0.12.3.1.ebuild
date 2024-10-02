# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

# ebuild generated by hackport 0.7.1.1.9999
#hackport: flags: -bootstrap,+system-pcre

CABAL_FEATURES="lib profile haddock hoogle hscolour"
inherit haskell-cabal

DESCRIPTION="syntax highlighting library"
HOMEPAGE="https://github.com/jgm/skylighting"
SRC_URI="https://hackage.haskell.org/package/${P}/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0/${PV}"
KEYWORDS="~amd64 ~arm64 ~ppc64 ~riscv ~x86"
IUSE="executable"

RDEPEND="~dev-haskell/skylighting-core-0.12.3.1:=[profile?]
	>=dev-lang/ghc-8.4.3:=
	executable? ( >=dev-haskell/blaze-html-0.5:=[profile?]
			dev-haskell/pretty-show:=[profile?] )
"
DEPEND="${RDEPEND}
	>=dev-haskell/cabal-2.2.0.1
"

src_configure() {
	haskell-cabal_src_configure \
		--flag=-bootstrap \
		$(cabal_flag executable executable) \
		--flag=system-pcre
}
