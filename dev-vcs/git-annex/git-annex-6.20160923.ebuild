# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

# ebuild generated by hackport 0.4.7.9999
#hackport: flags: -production,-android,-androidsplice,-testsuite

CABAL_FEATURES="bin"
inherit haskell-cabal bash-completion-r1

DESCRIPTION="manage files with git, without checking their contents into git"
HOMEPAGE="http://git-annex.branchable.com/"
SRC_URI="mirror://hackage/packages/archive/${PN}/${PV}/${P}.tar.gz"
RESTRICT="test"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~amd64-linux"
IUSE="+assistant benchmark +concurrentoutput +cryptonite doc +dbus +magicmime +network-uri +pairing +s3 +torrentparser +webapp +webdav +xmpp"

RDEPEND="dev-haskell/aeson:=
	dev-haskell/async:=
	dev-haskell/bloomfilter:=
	dev-haskell/case-insensitive:=
	dev-haskell/data-default:=
	dev-haskell/disk-free-space:=
	dev-haskell/dlist:=
	dev-haskell/edit-distance:=
	dev-haskell/esqueleto:=
	>=dev-haskell/exceptions-0.6:=
	dev-haskell/feed:=
	dev-haskell/hslogger:=
	dev-haskell/http-client:=
	dev-haskell/http-conduit:=
	dev-haskell/http-types:=
	dev-haskell/ifelse:=
	dev-haskell/missingh:=
	dev-haskell/monad-control:=
	dev-haskell/monad-logger:=
	>=dev-haskell/mtl-2:=
	dev-haskell/old-locale:=
	>=dev-haskell/optparse-applicative-0.11.0:=
	dev-haskell/persistent:=
	dev-haskell/persistent-sqlite:=
	dev-haskell/persistent-template:=
	>=dev-haskell/quickcheck-2.1:2=
	dev-haskell/random:=
	dev-haskell/regex-tdfa:=
	dev-haskell/resourcet:=
	dev-haskell/safesemaphore:=
	dev-haskell/sandi:=
	>=dev-haskell/stm-2.3:=
	dev-haskell/text:=
	dev-haskell/transformers:=
	dev-haskell/unix-compat:=
	dev-haskell/unordered-containers:=
	dev-haskell/utf8-string:=
	>=dev-haskell/uuid-1.2.6:=
	>=dev-lang/ghc-7.6.1:=
	assistant? ( dev-haskell/dns:=
			dev-haskell/hinotify:=
			dev-haskell/mountpoints:=
			sys-process/lsof )
	benchmark? ( dev-haskell/criterion:= )
	concurrentoutput? ( >=dev-haskell/concurrent-output-1.6:= )
	cryptonite? ( dev-haskell/cryptonite:= )
	!cryptonite? ( >=dev-haskell/cryptohash-0.11.0:= )
	dbus? ( >=dev-haskell/dbus-0.10.7:=
		>=dev-haskell/fdo-notify-0.3:= )
	magicmime? ( dev-haskell/magic:= )
	network-uri? ( >=dev-haskell/network-2.6:=
			>=dev-haskell/network-uri-2.6:= )
	!network-uri? ( >=dev-haskell/network-2.4:= <dev-haskell/network-2.6:= )
	pairing? ( dev-haskell/network-info:=
			dev-haskell/network-multicast:= )
	s3? ( >=dev-haskell/aws-0.9.2:=
		dev-haskell/conduit:=
		dev-haskell/conduit-extra:= )
	torrentparser? ( >=dev-haskell/torrent-10000.0.0:= )
	webapp? ( dev-haskell/blaze-builder:=
			dev-haskell/byteable:=
			dev-haskell/clientsession:=
			dev-haskell/crypto-api:=
			>=dev-haskell/path-pieces-0.1.4:=
			dev-haskell/securemem:=
			>=dev-haskell/shakespeare-2.0.0:=
			dev-haskell/wai:=
			dev-haskell/wai-extra:=
			>=dev-haskell/warp-3.0.0.5:=
			>=dev-haskell/warp-tls-1.4:=
			>=dev-haskell/yesod-1.2.6:=
			>=dev-haskell/yesod-core-1.2.19:=
			>=dev-haskell/yesod-default-1.2.0:=
			>=dev-haskell/yesod-form-1.3.15:=
			>=dev-haskell/yesod-static-1.2.4:= )
	webdav? ( >=dev-haskell/dav-1.0:= )
	xmpp? ( >=dev-haskell/gnutls-0.1.4:=
		dev-haskell/network-protocol-xmpp:=
		dev-haskell/xml-types:= )
"
# not generated by hackport:
RDEPEND="${RDEPEND}
	dev-vcs/git
"

DEPEND="${RDEPEND}
	>=dev-haskell/cabal-1.16.0
"

# not generated by hackport:
DEPEND="${DEPEND}
	dev-lang/perl
	doc? ( www-apps/ikiwiki net-misc/rsync )
"

PATCHES=(
	# does not respect staging dir
	"${FILESDIR}"/${PN}-5.20150731-no-strange-installs.patch
	"${FILESDIR}"/${PN}-6.20160114-QC-2.8.2.patch
)

src_prepare() {
	default

	cabal_chdeps \
		'http-conduit (<2.2.0)' 'http-conduit' \
		'persistent (< 2.5)' 'persistent'
}

src_configure() {
	haskell-cabal_src_configure \
		--flag=-android \
		--flag=-androidsplice \
		$(cabal_flag assistant assistant) \
		$(cabal_flag benchmark benchmark) \
		$(cabal_flag concurrentoutput concurrentoutput) \
		$(cabal_flag cryptonite cryptonite) \
		$(cabal_flag dbus dbus) \
		$(cabal_flag magicmime magicmime) \
		$(cabal_flag network-uri network-uri) \
		$(cabal_flag pairing pairing) \
		--flag=-production \
		$(cabal_flag s3 s3) \
		--flag=-testsuite \
		$(cabal_flag torrentparser torrentparser) \
		$(cabal_flag webapp webapp) \
		$(cabal_flag webdav webdav) \
		$(cabal_flag xmpp xmpp)
}

src_test() {
	if use webapp; then
		export GIT_CONFIG=${T}/temp-git-config
		git config user.email "git@src_test"
		git config user.name "Mr. ${P} The Test"

		emake test
	fi
}

src_install() {
	haskell-cabal_src_install
	dosym git-annex /usr/bin/git-annex-shell # standard make install does more, than needed

	newbashcomp "${FILESDIR}"/${PN}.bash ${PN}

	dodoc CHANGELOG README
	if use webapp ; then
		doicon "${FILESDIR}"/${PN}.xpm
		make_desktop_entry "${PN} webapp" "git-annex" ${PN}.xpm "Office"
	fi
}
