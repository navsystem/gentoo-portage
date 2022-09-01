# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

# ebuild generated by hackport 0.7.1.2.9999

CABAL_FEATURES="lib profile haddock hoogle hscolour"
inherit haskell-cabal

DESCRIPTION="Creation of type-safe, RESTful web applications"
HOMEPAGE="https://www.yesodweb.com/"

LICENSE="MIT"
SLOT="0/${PV}"
KEYWORDS="~amd64 ~arm64 ~ppc64 ~x86"

RDEPEND="dev-haskell/aeson:=[profile?]
	>=dev-haskell/conduit-1.3:=[profile?]
	dev-haskell/data-default-class:=[profile?]
	dev-haskell/fast-logger:=[profile?]
	dev-haskell/file-embed:=[profile?]
	dev-haskell/monad-logger:=[profile?]
	dev-haskell/shakespeare:=[profile?]
	dev-haskell/streaming-commons:=[profile?]
	dev-haskell/unordered-containers:=[profile?]
	>=dev-haskell/wai-1.3:=[profile?]
	>=dev-haskell/wai-extra-1.3:=[profile?]
	dev-haskell/wai-logger:=[profile?]
	>=dev-haskell/warp-1.3:=[profile?]
	>=dev-haskell/yaml-0.8.17:=[profile?]
	>=dev-haskell/yesod-core-1.6:=[profile?] <dev-haskell/yesod-core-1.7:=[profile?]
	>=dev-haskell/yesod-form-1.6:=[profile?] <dev-haskell/yesod-form-1.8:=[profile?]
	>=dev-haskell/yesod-persistent-1.6:=[profile?] <dev-haskell/yesod-persistent-1.7:=[profile?]
	>=dev-lang/ghc-8.4.3:=
"
DEPEND="${RDEPEND}
	>=dev-haskell/cabal-2.2.0.1
"
