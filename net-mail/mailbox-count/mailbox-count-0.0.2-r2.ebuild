# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=6

# ebuild generated by hackport 0.4.2

CABAL_FEATURES="bin test-suite"
inherit haskell-cabal

DESCRIPTION="Count mailboxes in a SQL database"
HOMEPAGE="http://hackage.haskell.org/package/mailbox-count"
SRC_URI="https://hackage.haskell.org/package/${P}/${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RESTRICT=test # Could not find module ‘Paths_mailbox_count’

RDEPEND=""
DEPEND="${RDEPEND}
	>=dev-haskell/cabal-1.16.0
	>=dev-haskell/cmdargs-0.10
	>=dev-haskell/configurator-0.2
	>=dev-haskell/hdbc-2.4
	>=dev-haskell/hdbc-postgresql-2.3
	>=dev-haskell/hdbc-sqlite3-2.3
	>=dev-haskell/missingh-1.2
	>=dev-haskell/tasty-0.8
	>=dev-haskell/tasty-hunit-0.8
	>=dev-lang/ghc-7.6.1
	test? ( >=dev-haskell/doctest-0.9
		>=dev-haskell/filemanip-0.3.6 )
"

PATCHES=(
	"${FILESDIR}"/${P}-ghc84.patch
)
