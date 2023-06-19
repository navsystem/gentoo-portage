# Copyright 2021-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

CRATES="
	adler@1.0.2
	aead@0.5.2
	aes@0.8.2
	ahash@0.7.6
	aho-corasick@0.7.20
	aho-corasick@1.0.1
	aligned@0.4.1
	android-tzdata@0.1.1
	android_system_properties@0.1.5
	anyhow@1.0.71
	as-slice@0.2.1
	ascii-canvas@3.0.0
	assert_cmd@2.0.8
	async-trait@0.1.68
	autocfg@1.1.0
	base16ct@0.2.0
	base64@0.13.1
	base64@0.21.0
	base64ct@1.6.0
	bindgen@0.63.0
	bit-set@0.5.3
	bit-vec@0.6.3
	bitflags@1.3.2
	bitflags@2.2.1
	block-buffer@0.10.4
	block-buffer@0.9.0
	block-padding@0.3.3
	blowfish@0.9.1
	botan-sys@0.10.2
	botan@0.10.2
	bstr@1.4.0
	buffered-reader@1.2.0
	bumpalo@3.12.2
	byteorder@1.4.3
	bytes@1.4.0
	bzip2-sys@0.1.11+1.0.8
	bzip2@0.4.4
	cast5@0.11.1
	cc@1.0.79
	cexpr@0.6.0
	cfb-mode@0.8.2
	cfg-if@1.0.0
	chrono@0.4.26
	cipher@0.4.4
	clang-sys@1.6.1
	clap@4.0.32
	clap_complete@4.0.7
	clap_derive@4.0.21
	clap_lex@0.3.0
	clap_mangen@0.2.6
	cmac@0.7.2
	codespan-reporting@0.11.1
	const-oid@0.9.2
	core-foundation-sys@0.8.4
	core-foundation@0.9.3
	cpufeatures@0.2.7
	crc32fast@1.3.2
	crossbeam-channel@0.5.8
	crossbeam-deque@0.8.3
	crossbeam-epoch@0.9.14
	crossbeam-queue@0.3.8
	crossbeam-utils@0.8.15
	crossbeam@0.8.2
	crunchy@0.2.2
	crypto-bigint@0.5.2
	crypto-common@0.1.6
	ctr@0.9.2
	curve25519-dalek-ng@4.1.1
	curve25519-dalek@3.2.0
	cvt@0.1.2
	cxx-build@1.0.94
	cxx@1.0.94
	cxxbridge-flags@1.0.94
	cxxbridge-macro@1.0.94
	data-encoding@2.3.3
	dbl@0.3.2
	der@0.7.5
	des@0.8.1
	deunicode@0.4.3
	diff@0.1.13
	difflib@0.4.0
	digest@0.10.6
	digest@0.9.0
	dirs-next@2.0.0
	dirs-sys-next@0.1.2
	dirs-sys@0.3.7
	dirs-sys@0.4.1
	dirs@4.0.0
	dirs@5.0.1
	doc-comment@0.3.3
	dot-writer@0.1.3
	dyn-clone@1.0.11
	eax@0.5.0
	ecb@0.1.1
	ecdsa@0.16.6
	ed25519-dalek@1.0.1
	ed25519@1.5.3
	either@1.8.1
	elliptic-curve@0.13.4
	ena@0.14.2
	endian-type@0.1.2
	enum-as-inner@0.5.1
	enumber@0.3.0
	env_logger@0.10.0
	errno-dragonfly@0.1.2
	errno@0.3.1
	fallible-iterator@0.2.0
	fallible-streaming-iterator@0.1.9
	fastrand@1.9.0
	fd-lock@3.0.12
	fehler-macros@1.0.0
	fehler@1.0.0
	ff@0.13.0
	file_diff@1.0.0
	filetime@0.2.21
	fixedbitset@0.4.2
	flate2@1.0.26
	float-cmp@0.9.0
	fnv@1.0.7
	foreign-types-shared@0.1.1
	foreign-types@0.3.2
	form_urlencoded@1.1.0
	fs2@0.4.3
	fs_at@0.1.6
	futures-channel@0.3.28
	futures-core@0.3.28
	futures-io@0.3.28
	futures-macro@0.3.28
	futures-sink@0.3.28
	futures-task@0.3.28
	futures-util@0.3.28
	generator@0.7.4
	generic-array@0.14.7
	getopts@0.2.21
	getrandom@0.1.16
	getrandom@0.2.9
	git-testament-derive@0.1.14
	git-testament@0.2.4
	glob@0.3.1
	globset@0.4.10
	globwalk@0.8.1
	group@0.13.0
	h2@0.3.18
	hashbrown@0.12.3
	hashlink@0.8.1
	heck@0.4.1
	hermit-abi@0.2.6
	hermit-abi@0.3.1
	hkdf@0.12.3
	hmac@0.12.1
	hostname@0.3.1
	html-escape@0.2.13
	http-body@0.4.5
	http@0.2.9
	httparse@1.8.0
	httpdate@1.0.2
	humansize@2.1.3
	humantime@2.1.0
	hyper-tls@0.5.0
	hyper@0.14.26
	iana-time-zone-haiku@0.1.1
	iana-time-zone@0.1.56
	idea@0.5.1
	idna@0.2.3
	idna@0.3.0
	ignore@0.4.20
	indexmap@1.9.3
	inout@0.1.3
	instant@0.1.12
	io-lifetimes@1.0.10
	ipconfig@0.3.1
	ipnet@2.7.2
	is-terminal@0.4.7
	itertools@0.10.5
	itoa@1.0.6
	js-sys@0.3.61
	lalrpop-util@0.19.12
	lalrpop@0.19.12
	lazy_static@1.4.0
	lazycell@1.3.0
	libc@0.2.143
	libloading@0.7.4
	libm@0.2.6
	libsqlite3-sys@0.26.0
	line-col@0.2.1
	link-cplusplus@1.0.8
	linked-hash-map@0.5.6
	linux-raw-sys@0.3.7
	lock_api@0.4.9
	log@0.4.17
	loom@0.5.6
	lru-cache@0.1.2
	match_cfg@0.1.0
	matchers@0.1.0
	matches@0.1.10
	md-5@0.10.5
	memchr@2.5.0
	memoffset@0.8.0
	memsec@0.6.3
	minimal-lexical@0.2.1
	miniz_oxide@0.7.1
	mio@0.8.6
	native-tls@0.2.11
	nettle-sys@2.1.1
	nettle@7.2.2
	new_debug_unreachable@1.0.4
	nibble_vec@0.1.0
	nix@0.26.2
	no-std-compat@0.4.1
	nom@7.1.3
	normalize-line-endings@0.3.0
	normpath@1.1.1
	nu-ansi-term@0.46.0
	num-bigint-dig@0.8.2
	num-integer@0.1.45
	num-iter@0.1.43
	num-traits@0.2.15
	num_cpus@1.15.0
	once_cell@1.17.2
	opaque-debug@0.3.0
	openpgp-cert-d@0.1.0
	openssl-macros@0.1.1
	openssl-probe@0.1.5
	openssl-sys@0.9.87
	openssl@0.10.52
	option-ext@0.2.0
	os_str_bytes@6.5.0
	overload@0.1.1
	p256@0.13.2
	parking_lot@0.12.1
	parking_lot_core@0.9.7
	peeking_take_while@0.1.2
	pem-rfc7468@0.7.0
	percent-encoding@2.2.0
	pest@2.6.0
	pest_derive@2.6.0
	pest_generator@2.6.0
	pest_meta@2.6.0
	petgraph@0.6.3
	phf_shared@0.10.0
	pikchr@0.1.1
	pin-project-lite@0.2.9
	pin-utils@0.1.0
	pkcs1@0.7.5
	pkcs8@0.10.2
	pkg-config@0.3.27
	ppv-lite86@0.2.17
	precomputed-hash@0.1.1
	predicates-core@1.0.5
	predicates-tree@1.0.7
	predicates@2.1.5
	primeorder@0.13.1
	proc-macro-error-attr@1.0.4
	proc-macro-error@1.0.4
	proc-macro2@1.0.56
	pulldown-cmark@0.9.2
	quick-error@1.2.3
	quote@1.0.26
	radix_trie@0.2.1
	rand@0.7.3
	rand@0.8.5
	rand_chacha@0.2.2
	rand_chacha@0.3.1
	rand_core@0.5.1
	rand_core@0.6.4
	rand_hc@0.2.0
	rayon-core@1.11.0
	rayon@1.7.0
	redox_syscall@0.2.16
	redox_syscall@0.3.5
	redox_users@0.4.3
	regex-automata@0.1.10
	regex-syntax@0.6.29
	regex-syntax@0.7.1
	regex@1.8.1
	remove_dir_all@0.8.2
	resolv-conf@0.7.0
	rfc6979@0.4.0
	ripemd@0.1.3
	roadmap@0.5.0
	roff@0.2.1
	rpassword@6.0.1
	rsa@0.9.1
	rusqlite@0.29.0
	rustc-hash@1.1.0
	rustix@0.37.19
	rustversion@1.0.12
	ryu@1.0.13
	same-file@1.0.6
	schannel@0.1.21
	scoped-tls@1.0.1
	scopeguard@1.1.0
	scratch@1.0.5
	sec1@0.7.2
	security-framework-sys@2.8.0
	security-framework@2.8.2
	sequoia-autocrypt@0.25.1
	sequoia-cert-store@0.3.2
	sequoia-net@0.27.0
	sequoia-openpgp@1.16.0
	sequoia-policy-config@0.6.0
	sequoia-wot@0.8.1
	serde-aux@4.2.0
	serde@1.0.163
	serde_derive@1.0.163
	serde_json@1.0.96
	serde_yaml@0.8.26
	serde_yaml@0.9.21
	sha-1@0.10.1
	sha1collisiondetection@0.2.7
	sha2@0.10.6
	sha2@0.9.9
	sharded-slab@0.1.4
	shell-words@1.1.0
	shlex@1.1.0
	signature@1.6.4
	signature@2.1.0
	siphasher@0.3.10
	slab@0.4.8
	slug@0.1.4
	smallvec@1.10.0
	smart-default@0.7.1
	smawk@0.3.1
	socket2@0.4.9
	spin@0.5.2
	spki@0.7.2
	stable_deref_trait@1.2.0
	state@0.5.3
	static_assertions@1.1.0
	string_cache@0.8.7
	strsim@0.10.0
	subplot-build@0.7.1
	subplot@0.7.1
	subplotlib-derive@0.7.1
	subplotlib@0.7.1
	subtle-ng@2.5.0
	subtle@2.4.1
	syn@1.0.109
	syn@2.0.15
	tempfile-fast@0.3.4
	tempfile@3.5.0
	tera@1.18.1
	term@0.7.0
	termcolor@1.2.0
	terminal_size@0.2.6
	termtree@0.4.1
	textwrap@0.15.2
	thiserror-impl@1.0.40
	thiserror@1.0.40
	thread_local@1.1.4
	time-core@0.1.0
	time-macros@0.2.6
	time@0.1.45
	time@0.3.17
	tiny-keccak@2.0.2
	tinyvec@1.6.0
	tinyvec_macros@0.1.1
	tokio-macros@2.1.0
	tokio-native-tls@0.3.1
	tokio-util@0.7.8
	tokio@1.28.2
	toml@0.5.11
	tower-service@0.3.2
	tracing-attributes@0.1.24
	tracing-core@0.1.30
	tracing-log@0.1.3
	tracing-subscriber@0.3.17
	tracing@0.1.37
	trust-dns-client@0.22.0
	trust-dns-proto@0.22.0
	trust-dns-resolver@0.22.0
	try-lock@0.2.4
	twofish@0.7.1
	typenum@1.16.0
	ucd-trie@0.1.5
	unescape@0.1.0
	unic-char-property@0.9.0
	unic-char-range@0.9.0
	unic-common@0.9.0
	unic-segment@0.9.0
	unic-ucd-segment@0.9.0
	unic-ucd-version@0.9.0
	unicase@2.6.0
	unicode-bidi@0.3.13
	unicode-ident@1.0.8
	unicode-linebreak@0.1.4
	unicode-normalization@0.1.22
	unicode-width@0.1.10
	unicode-xid@0.2.4
	unsafe-libyaml@0.2.8
	url@2.3.1
	utf8-width@0.1.6
	valuable@0.1.0
	vcpkg@0.2.15
	version_check@0.9.4
	wait-timeout@0.2.0
	walkdir@2.3.3
	want@0.3.0
	wasi@0.10.0+wasi-snapshot-preview1
	wasi@0.11.0+wasi-snapshot-preview1
	wasi@0.9.0+wasi-snapshot-preview1
	wasm-bindgen-backend@0.2.84
	wasm-bindgen-macro-support@0.2.84
	wasm-bindgen-macro@0.2.84
	wasm-bindgen-shared@0.2.84
	wasm-bindgen@0.2.84
	widestring@0.5.1
	win-crypto-ng@0.5.0
	winapi-i686-pc-windows-gnu@0.4.0
	winapi-util@0.1.5
	winapi-x86_64-pc-windows-gnu@0.4.0
	winapi@0.3.9
	windows-sys@0.42.0
	windows-sys@0.45.0
	windows-sys@0.48.0
	windows-targets@0.42.2
	windows-targets@0.48.0
	windows@0.48.0
	windows_aarch64_gnullvm@0.42.2
	windows_aarch64_gnullvm@0.48.0
	windows_aarch64_msvc@0.42.2
	windows_aarch64_msvc@0.48.0
	windows_i686_gnu@0.42.2
	windows_i686_gnu@0.48.0
	windows_i686_msvc@0.42.2
	windows_i686_msvc@0.48.0
	windows_x86_64_gnu@0.42.2
	windows_x86_64_gnu@0.48.0
	windows_x86_64_gnullvm@0.42.2
	windows_x86_64_gnullvm@0.48.0
	windows_x86_64_msvc@0.42.2
	windows_x86_64_msvc@0.48.0
	winreg@0.10.1
	x25519-dalek-ng@1.1.1
	xxhash-rust@0.8.6
	yaml-rust@0.4.5
	zbase32@0.1.2
	zeroize@1.6.0
	zeroize_derive@1.4.2
"

LLVM_MAX_SLOT=16

inherit bash-completion-r1 cargo llvm

DESCRIPTION="CLI of the Sequoia OpenPGP implementation"
HOMEPAGE="https://sequoia-pgp.org/ https://gitlab.com/sequoia-pgp/sequoia-sq"
SRC_URI="
	https://gitlab.com/sequoia-pgp/sequoia-sq/-/archive/v${PV}/${PN}-v${PV}.tar.bz2
	${CARGO_CRATE_URIS}
"
S="${WORKDIR}"/${PN}-v${PV}

LICENSE="GPL-2+"
# Dependent crate licenses
LICENSE+="
	Apache-2.0 BSD Boost-1.0 CC0-1.0 ISC LGPL-2+ LGPL-3+ MIT MIT-0
	MPL-2.0 Unicode-DFS-2016
	|| ( GPL-2 GPL-3 LGPL-3 )
"
SLOT="0"
KEYWORDS="~amd64 ~ppc64"

QA_FLAGS_IGNORED="usr/bin/sq"

COMMON_DEPEND="
	dev-db/sqlite:3
	dev-libs/gmp:=
	dev-libs/nettle:=
	dev-libs/openssl:=
"
DEPEND="
	${COMMON_DEPEND}
	sys-devel/clang
"
RDEPEND="
	${COMMON_DEPEND}
"
# Clang needed for bindgen
BDEPEND="
	<sys-devel/clang-$((${LLVM_MAX_SLOT} + 1))
	virtual/pkgconfig
"

llvm_check_deps() {
	has_version -b "sys-devel/clang:${LLVM_SLOT}"
}

src_compile() {
	# Setting CARGO_TARGET_DIR is required to have the build system
	# create the bash and zsh completion files.
	CARGO_TARGET_DIR="${S}/target" cargo_src_compile
}

src_install() {
	cargo_src_install

	doman target/$(usex debug debug release)/build/sequoia-sq-*/out/*.1

	newbashcomp target/sq.bash sq

	insinto /usr/share/zsh/site-functions
	doins target/_sq

	insinto /usr/share/fish/vendor_completions.d
	doins target/sq.fish
}
