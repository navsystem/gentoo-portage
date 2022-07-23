# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

# ebuild generated by hackport 0.6.1.9999
#hackport: flags: +newbase,+splitbase,-_regex-posix-clib

CABAL_FEATURES="lib profile haddock hoogle hscolour"
inherit haskell-cabal

DESCRIPTION="Replaces/Enhances Text.Regex"
HOMEPAGE="https://hackage.haskell.org/package/regex-posix"
SRC_URI="https://hackage.haskell.org/package/${P}/${P}.tar.gz"

LICENSE="BSD"
SLOT="0/${PV}"
KEYWORDS="~amd64 ~ppc64 ~x86 ~amd64-linux ~x86-linux ~ppc-macos ~x86-solaris"
IUSE=""

RDEPEND=">=dev-haskell/fail-4.9:=[profile?] <dev-haskell/fail-4.10:=[profile?]
	>=dev-haskell/regex-base-0.94:=[profile?] <dev-haskell/regex-base-0.95:=[profile?]
	>=dev-lang/ghc-7.4.1:=
"
DEPEND="${RDEPEND}
	>=dev-haskell/cabal-1.12
"

src_prepare() {
	default

	cabal_chdeps \
		'base       >= 4.3 && < 4.14' 'base       >= 4.3'
}

src_configure() {
	haskell-cabal_src_configure \
		--flag=-_regex-posix-clib \
		--flag=newbase \
		--flag=splitbase
}
