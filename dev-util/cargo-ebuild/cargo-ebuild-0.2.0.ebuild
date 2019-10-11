# Copyright 2017-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

# Auto-Generated by cargo-ebuild 0.2.0

EAPI=7

CRATES="
adler32-1.0.4
aho-corasick-0.7.6
ansi_term-0.11.0
atty-0.2.13
autocfg-0.1.6
backtrace-0.3.38
backtrace-sys-0.1.31
bitflags-1.2.0
bstr-0.2.8
byteorder-1.3.2
bytes-0.4.12
bytesize-1.0.0
c2-chacha-0.2.2
cargo-0.37.0
cargo-ebuild-0.2.0
cc-1.0.45
cfg-if-0.1.10
clap-2.33.0
commoncrypto-0.2.0
commoncrypto-sys-0.2.0
core-foundation-0.6.4
core-foundation-sys-0.6.2
crates-io-0.25.0
crc32fast-1.2.0
crossbeam-channel-0.3.9
crossbeam-utils-0.6.6
crypto-hash-0.3.4
curl-0.4.25
curl-sys-0.4.23
env_logger-0.6.2
failure-0.1.5
failure_derive-0.1.5
filetime-0.2.7
flate2-1.0.12
fnv-1.0.6
foreign-types-0.3.2
foreign-types-shared-0.1.1
fs2-0.4.3
fwdansi-1.0.1
getrandom-0.1.12
git2-0.8.0
git2-curl-0.9.0
glob-0.3.0
globset-0.4.4
heck-0.3.1
hex-0.3.2
home-0.3.4
http-0.1.18
humantime-1.3.0
idna-0.1.5
ignore-0.4.10
im-rc-12.3.4
iovec-0.1.4
itoa-0.4.4
jobserver-0.1.17
lazy_static-1.4.0
lazycell-1.2.1
libc-0.2.62
libgit2-sys-0.7.11
libnghttp2-sys-0.1.2
libssh2-sys-0.2.12
libz-sys-1.0.25
log-0.4.8
matches-0.1.8
memchr-2.2.1
miniz_oxide-0.3.3
miow-0.3.3
num_cpus-1.10.1
opener-0.4.1
openssl-0.10.25
openssl-probe-0.1.2
openssl-sys-0.9.51
percent-encoding-1.0.1
pkg-config-0.3.16
ppv-lite86-0.2.5
proc-macro-error-0.2.6
proc-macro2-0.4.30
proc-macro2-1.0.5
quick-error-1.2.2
quote-0.6.13
quote-1.0.2
rand-0.7.2
rand_chacha-0.2.1
rand_core-0.5.1
rand_hc-0.2.0
redox_syscall-0.1.56
regex-1.3.1
regex-syntax-0.6.12
remove_dir_all-0.5.2
rustc-demangle-0.1.16
rustc-workspace-hack-1.0.0
rustc_version-0.2.3
rustfix-0.4.6
ryu-1.0.0
same-file-1.0.5
schannel-0.1.16
scopeguard-0.3.3
semver-0.9.0
semver-parser-0.7.0
serde-1.0.101
serde_derive-1.0.101
serde_ignored-0.0.4
serde_json-1.0.41
shell-escape-0.1.4
sized-chunks-0.1.3
smallvec-0.6.10
socket2-0.3.11
strsim-0.8.0
structopt-0.3.3
structopt-derive-0.3.3
syn-0.15.44
syn-1.0.5
synstructure-0.10.2
tar-0.4.26
tempfile-3.1.0
termcolor-1.0.5
textwrap-0.11.0
thread_local-0.3.6
time-0.1.42
toml-0.5.3
typenum-1.11.2
unicode-bidi-0.3.4
unicode-normalization-0.1.8
unicode-segmentation-1.3.0
unicode-width-0.1.6
unicode-xid-0.1.0
unicode-xid-0.2.0
url-1.7.2
url_serde-0.2.0
vcpkg-0.2.7
vec_map-0.8.1
walkdir-2.2.9
wasi-0.7.0
winapi-0.3.8
winapi-i686-pc-windows-gnu-0.4.0
winapi-util-0.1.2
winapi-x86_64-pc-windows-gnu-0.4.0
wincolor-1.0.2
"

inherit cargo

DESCRIPTION="Generates an ebuild for a package using the in-tree eclasses."
HOMEPAGE="https://github.com/cardoe/cargo-ebuild"
SRC_URI="$(cargo_crate_uris ${CRATES})"
RESTRICT="mirror"
LICENSE="|| ( MIT Apache-2.0 )"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND=""
RDEPEND=""
