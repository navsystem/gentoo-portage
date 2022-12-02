# Copyright 2017-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

# Auto-Generated by cargo-ebuild 0.3.1

EAPI=7

CRATES="
addr2line-0.12.2
adler32-1.1.0
aho-corasick-0.7.13
arrayvec-0.5.1
autocfg-1.0.0
backtrace-0.3.49
bit-set-0.5.2
bit-vec-0.6.2
bitflags-1.2.1
block-0.1.6
byteorder-1.3.4
cc-1.0.57
cfg-if-0.1.10
chrono-0.4.15
clap-2.33.3
curl-sys-0.4.36+curl-7.71.1
fnv-1.0.7
getrandom-0.1.14
gettext-rs-0.5.0
gettext-sys-0.19.9
gimli-0.21.0
idna-0.2.0
lazy_static-1.4.0
lexical-core-0.7.4
libc-0.2.77
libz-sys-1.1.0
locale_config-0.3.0
malloc_buf-0.0.6
matches-0.1.8
memchr-2.3.3
miniz_oxide-0.3.7
natord-1.0.9
nom-5.1.2
num-integer-0.1.43
num-traits-0.2.12
objc-0.2.7
objc-foundation-0.1.1
objc_id-0.1.1
object-0.20.0
once_cell-1.4.1
openssl-sys-0.9.58
percent-encoding-2.1.0
pkg-config-0.3.17
ppv-lite86-0.2.8
proptest-0.10.1
quick-error-1.2.3
rand-0.7.3
rand_chacha-0.2.2
rand_core-0.5.1
rand_hc-0.2.0
rand_xorshift-0.2.0
redox_syscall-0.1.56
regex-1.3.9
regex-syntax-0.6.18
remove_dir_all-0.5.3
rustc-demangle-0.1.16
rusty-fork-0.3.0
ryu-1.0.5
section_testing-0.0.4
static_assertions-1.1.0
tempfile-3.1.0
textwrap-0.11.0
thread_local-1.0.1
time-0.1.43
tinyvec-0.3.3
unicode-bidi-0.3.4
unicode-normalization-0.1.13
unicode-width-0.1.8
url-2.1.1
vcpkg-0.2.10
version_check-0.9.2
wait-timeout-0.2.0
wasi-0.9.0+wasi-snapshot-preview1
winapi-0.3.9
winapi-i686-pc-windows-gnu-0.4.0
winapi-x86_64-pc-windows-gnu-0.4.0
xdg-2.2.0
"

inherit toolchain-funcs cargo

DESCRIPTION="An RSS/Atom feed reader for text terminals"
HOMEPAGE="https://newsboat.org/ https://github.com/newsboat/newsboat"
SRC_URI="
	https://newsboat.org/releases/${PV}/${P}.tar.xz
	$(cargo_crate_uris ${CRATES})
"

LICENSE="Apache-2.0 Apache-2.0-with-LLVM-exceptions Boost-1.0 MIT Unlicense ZLIB"
SLOT="0"
KEYWORDS="amd64 ~arm ~ppc64 x86"

RDEPEND="
	>=dev-db/sqlite-3.5:3
	>=dev-libs/stfl-0.21
	>=net-misc/curl-7.21.6
	>=dev-libs/json-c-0.11:=
	dev-libs/libxml2
	sys-libs/ncurses:=[unicode(+)]
	sys-libs/zlib
	dev-libs/openssl
"
DEPEND="${RDEPEND}
	sys-devel/gettext
"
BDEPEND="
	dev-ruby/asciidoctor
	app-alternatives/awk
	virtual/pkgconfig
	>=virtual/rust-1.42.0
"

PATCHES=(
	"${FILESDIR}/${PN}-2.11-flags.patch"
)

src_configure() {
	./config.sh || die
}

src_compile() {
	export CARGO_HOME="${ECARGO_HOME}"
	emake prefix="/usr" CC="$(tc-getCC)" CXX="$(tc-getCXX)" AR="$(tc-getAR)" RANLIB="$(tc-getRANLIB)"
}

src_test() {
	# tests require UTF-8 locale
	emake CC="${tc-getCC}" CXX="$(tc-getCXX)" AR="$(tc-getAR)" RANLIB="$(tc-getRANLIB)" test
	# Tests fail if in ${S} rather than in ${S}/test
	cd "${S}"/test || die
	./test || die
}

src_install() {
	emake DESTDIR="${D}" prefix="/usr" docdir="/usr/share/doc/${PF}" install
	einstalldocs
}
