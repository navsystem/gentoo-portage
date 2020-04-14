# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=5

# ebuild generated by hackport 0.3.2.9999

CABAL_FEATURES="lib profile haddock hoogle hscolour"
inherit haskell-cabal

DESCRIPTION="A model for human colour/color perception"
HOMEPAGE="http://www.haskell.org/haskellwiki/Colour"
SRC_URI="https://hackage.haskell.org/package/${P}/${P}.tar.gz"

LICENSE="MIT"
SLOT="0/${PV}"
KEYWORDS="~amd64 ~x86 ~amd64-linux ~x86-linux"
IUSE=""

RDEPEND=">=dev-lang/ghc-6.10.4:="
DEPEND="${RDEPEND}
		>=dev-haskell/cabal-1.6"

src_prepare() {
	if has_version "<dev-haskell/haddock-2.9.2"; then
		# Workaround http://hackage.haskell.org/trac/hackage/ticket/626
		# The haddock --hoogle option does not like unicode characters, which causes
		# haddock 2.7.2 to fail like:
		# haddock: internal Haddock or GHC error: dist/doc/html/enumerator/enumerator.txt: commitAndReleaseBuffer: invalid argument (Invalid or incomplete multibyte or wide character)
		sed -e 's@&#176;@ degrees@g' \
			-i "${S}/Data/Colour/CIE.hs" \
			-i "${S}/Data/Colour/CIE/Chromaticity.hs"
		sed -e 's@&#8220;@"@g' \
			-e 's@&#8221;@"@g' \
			-i "${S}/Data/Colour/RGB.hs"
	fi
}
