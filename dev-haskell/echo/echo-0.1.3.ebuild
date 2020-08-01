# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=6

# ebuild generated by hackport 0.5.3.9999
#hackport: flags: example:examples

CABAL_FEATURES="lib profile haddock hoogle hscolour"
inherit haskell-cabal

DESCRIPTION="A cross-platform, cross-console way to handle echoing terminal input"
HOMEPAGE="https://github.com/RyanGlScott/echo"
SRC_URI="https://hackage.haskell.org/package/${P}/${P}.tar.gz"

LICENSE="BSD"
SLOT="0/${PV}"
KEYWORDS="~amd64 ~x86"
IUSE="examples"

RDEPEND=">=dev-lang/ghc-7.4.1:=
"
DEPEND="${RDEPEND}
	>=dev-haskell/cabal-1.10
"

src_prepare() {
	default

	cabal_chdeps \
		'process >= 1.0.1.1 && < 1.5' 'process >= 1.0.1.1'
}

src_configure() {
	haskell-cabal_src_configure \
		$(cabal_flag examples example)
}
