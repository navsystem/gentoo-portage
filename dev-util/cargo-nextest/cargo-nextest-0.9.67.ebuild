# Copyright 2023-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

# Autogenerated by pycargoebuild 0.6.1

EAPI=8

CRATES="
	addr2line@0.21.0
	adler@1.0.2
	ahash@0.8.6
	aho-corasick@1.1.2
	android-tzdata@0.1.1
	android_system_properties@0.1.5
	anstream@0.6.5
	anstyle-parse@0.2.3
	anstyle-query@1.0.2
	anstyle-wincon@3.0.2
	anstyle@1.0.4
	anyhow@1.0.75
	async-scoped@0.8.0
	async-stream-impl@0.3.5
	async-stream@0.3.5
	async-trait@0.1.74
	atomicwrites@0.4.3
	autocfg@1.1.0
	axum-core@0.3.4
	axum@0.6.20
	backtrace-ext@0.2.1
	backtrace@0.3.69
	base64@0.13.1
	base64@0.21.5
	base64ct@1.6.0
	bit-set@0.5.3
	bit-vec@0.6.3
	bitflags@1.3.2
	bitflags@2.4.1
	block-buffer@0.10.4
	bstr@0.2.17
	bstr@1.9.0
	bumpalo@3.14.0
	bytecount@0.6.7
	byteorder@1.5.0
	bytes@1.5.0
	camino-tempfile@1.1.1
	camino@1.1.6
	cargo-platform@0.1.5
	cargo_metadata@0.18.1
	cc@1.0.83
	cfg-expr@0.15.5
	cfg-if@1.0.0
	chrono@0.4.31
	clap@4.4.14
	clap_builder@4.4.14
	clap_derive@4.4.7
	clap_lex@0.6.0
	color-eyre@0.6.2
	colorchoice@1.0.0
	config@0.13.4
	console-api@0.6.0
	console-subscriber@0.2.0
	console@0.15.7
	const-oid@0.9.6
	core-foundation-sys@0.8.6
	core-foundation@0.9.4
	cpufeatures@0.2.11
	crc32fast@1.3.2
	crossbeam-channel@0.5.9
	crossbeam-utils@0.8.17
	crypto-common@0.1.6
	curve25519-dalek-derive@0.1.1
	curve25519-dalek@4.1.1
	debug-ignore@1.0.5
	der@0.7.8
	dialoguer@0.11.0
	diff@0.1.13
	digest@0.10.7
	display-error-chain@0.2.0
	duct@0.13.7
	dunce@1.0.4
	ed25519-dalek@2.1.0
	ed25519@2.2.3
	either@1.9.0
	enable-ansi-support@0.2.1
	encode_unicode@0.3.6
	encoding_rs@0.8.33
	env_logger@0.10.1
	equivalent@1.0.1
	errno@0.3.8
	eyre@0.6.11
	fastrand@1.9.0
	fastrand@2.0.1
	fiat-crypto@0.2.5
	filetime@0.2.23
	fixedbitset@0.4.2
	flate2@1.0.28
	fnv@1.0.7
	foreign-types-shared@0.1.1
	foreign-types@0.3.2
	form_urlencoded@1.2.1
	future-queue@0.3.0
	futures-channel@0.3.30
	futures-core@0.3.30
	futures-executor@0.3.30
	futures-io@0.3.30
	futures-macro@0.3.30
	futures-sink@0.3.30
	futures-task@0.3.30
	futures-util@0.3.30
	futures@0.3.30
	generic-array@0.14.7
	getrandom@0.2.11
	gimli@0.28.1
	globset@0.4.14
	goldenfile@1.6.0
	guppy-workspace-hack@0.1.0
	guppy@0.17.4
	h2@0.3.22
	hashbrown@0.12.3
	hashbrown@0.14.3
	hdrhistogram@7.5.4
	heck@0.4.1
	hermit-abi@0.3.3
	home@0.5.9
	http-body@0.4.6
	http@0.2.11
	httparse@1.8.0
	httpdate@1.0.3
	humantime-serde@1.1.1
	humantime@2.1.0
	hyper-rustls@0.24.2
	hyper-timeout@0.4.1
	hyper-tls@0.5.0
	hyper@0.14.27
	iana-time-zone-haiku@0.1.2
	iana-time-zone@0.1.58
	idna@0.5.0
	indent_write@2.2.0
	indenter@0.3.3
	indexmap@1.9.3
	indexmap@2.1.0
	indicatif@0.17.7
	indoc@2.0.4
	insta@1.34.0
	instant@0.1.12
	ipnet@2.9.0
	is-terminal@0.4.9
	is_ci@1.1.1
	itertools@0.11.0
	itertools@0.12.0
	itoa@1.0.10
	jobserver@0.1.27
	js-sys@0.3.66
	lazy_static@1.4.0
	libc@0.2.152
	libm@0.2.8
	linked-hash-map@0.5.6
	linux-raw-sys@0.4.12
	log@0.4.20
	maplit@1.0.2
	matchers@0.1.0
	matchit@0.7.3
	memchr@2.7.1
	miette-derive@5.10.0
	miette@5.10.0
	mime@0.3.17
	minimal-lexical@0.2.1
	miniz_oxide@0.7.1
	mio@0.8.10
	mukti-metadata@0.2.1
	native-tls@0.2.11
	nested@0.1.1
	nix@0.27.1
	nom-tracable-macros@0.9.1
	nom-tracable@0.9.1
	nom@7.1.3
	nom_locate@4.2.0
	num-traits@0.2.17
	num_cpus@1.16.0
	number_prefix@0.4.0
	object@0.32.1
	once_cell@1.19.0
	openssl-macros@0.1.1
	openssl-probe@0.1.5
	openssl-sys@0.9.97
	openssl@0.10.61
	os_pipe@1.1.4
	owo-colors@3.5.0
	owo-colors@4.0.0
	pathdiff@0.2.1
	percent-encoding@2.3.1
	petgraph@0.6.4
	pin-project-internal@1.1.3
	pin-project-lite@0.2.13
	pin-project@1.1.3
	pin-utils@0.1.0
	pkcs8@0.10.2
	pkg-config@0.3.27
	platforms@3.2.0
	portable-atomic@1.6.0
	ppv-lite86@0.2.17
	pretty_assertions@1.4.0
	proc-macro2@1.0.76
	proptest@1.4.0
	prost-derive@0.12.3
	prost-types@0.12.3
	prost@0.12.3
	quick-error@1.2.3
	quick-xml@0.23.1
	quick-xml@0.31.0
	quote@1.0.35
	rand@0.8.5
	rand_chacha@0.3.1
	rand_core@0.6.4
	rand_xorshift@0.3.0
	recursion@0.5.1
	redox_syscall@0.4.1
	regex-automata@0.1.10
	regex-automata@0.4.3
	regex-syntax@0.6.29
	regex-syntax@0.8.2
	regex@1.10.2
	reqwest@0.11.22
	ring@0.17.7
	ron@0.7.1
	rustc-demangle@0.1.23
	rustc_version@0.4.0
	rustix@0.38.28
	rustls-pemfile@1.0.4
	rustls-webpki@0.101.7
	rustls@0.21.10
	rustversion@1.0.14
	rusty-fork@0.3.0
	ryu@1.0.16
	schannel@0.1.22
	scopeguard@1.2.0
	sct@0.7.1
	security-framework-sys@2.9.1
	security-framework@2.9.2
	self-replace@1.3.7
	self_update@0.39.0
	semver@1.0.21
	serde@1.0.195
	serde_derive@1.0.195
	serde_ignored@0.1.10
	serde_json@1.0.111
	serde_path_to_error@0.1.15
	serde_spanned@0.6.4
	serde_urlencoded@0.7.1
	sha2@0.10.8
	sharded-slab@0.1.7
	shared_child@1.0.0
	shell-words@1.1.0
	signal-hook-registry@1.4.1
	signature@2.2.0
	similar-asserts@1.5.0
	similar@2.3.0
	slab@0.4.9
	smallvec@1.11.2
	smawk@0.3.2
	smol_str@0.2.0
	socket2@0.4.10
	socket2@0.5.5
	spin@0.9.8
	spki@0.7.3
	static_assertions@1.1.0
	strip-ansi-escapes@0.2.0
	strsim@0.10.0
	structmeta-derive@0.2.0
	structmeta@0.2.0
	subtle@2.5.0
	supports-color@2.1.0
	supports-hyperlinks@2.1.0
	supports-unicode@2.0.0
	syn@1.0.109
	syn@2.0.48
	sync_wrapper@0.1.2
	system-configuration-sys@0.5.0
	system-configuration@0.5.1
	tar@0.4.40
	target-lexicon@0.12.12
	target-spec-miette@0.3.0
	target-spec@3.0.1
	tempfile@3.8.1
	terminal_size@0.1.17
	test-case-core@3.3.1
	test-case-macros@3.3.1
	test-case@3.3.1
	test-strategy@0.3.1
	textwrap@0.15.2
	thiserror-impl@1.0.56
	thiserror@1.0.56
	thread_local@1.1.7
	tinyvec@1.6.0
	tinyvec_macros@0.1.1
	tokio-io-timeout@1.2.0
	tokio-macros@2.2.0
	tokio-native-tls@0.3.1
	tokio-rustls@0.24.1
	tokio-stream@0.1.14
	tokio-util@0.7.10
	tokio@1.35.1
	toml@0.5.11
	toml@0.8.8
	toml_datetime@0.6.5
	toml_edit@0.21.0
	tonic@0.10.2
	tower-layer@0.3.2
	tower-service@0.3.2
	tower@0.4.13
	tracing-attributes@0.1.27
	tracing-core@0.1.32
	tracing-subscriber@0.3.18
	tracing@0.1.40
	try-lock@0.2.5
	twox-hash@1.6.3
	typenum@1.17.0
	unarray@0.1.4
	unicode-bidi@0.3.14
	unicode-ident@1.0.12
	unicode-linebreak@0.1.5
	unicode-normalization@0.1.22
	unicode-segmentation@1.10.1
	unicode-width@0.1.11
	untrusted@0.9.0
	url@2.5.0
	urlencoding@2.1.3
	utf8parse@0.2.1
	uuid@1.6.1
	valuable@0.1.0
	vcpkg@0.2.15
	version_check@0.9.4
	vte@0.11.1
	vte_generate_state_changes@0.1.1
	wait-timeout@0.2.0
	want@0.3.1
	wasi@0.11.0+wasi-snapshot-preview1
	wasm-bindgen-backend@0.2.89
	wasm-bindgen-futures@0.4.39
	wasm-bindgen-macro-support@0.2.89
	wasm-bindgen-macro@0.2.89
	wasm-bindgen-shared@0.2.89
	wasm-bindgen@0.2.89
	web-sys@0.3.66
	webpki-roots@0.25.3
	win32job@1.0.2
	winapi-i686-pc-windows-gnu@0.4.0
	winapi-x86_64-pc-windows-gnu@0.4.0
	winapi@0.3.9
	windows-core@0.51.1
	windows-sys@0.42.0
	windows-sys@0.45.0
	windows-sys@0.48.0
	windows-sys@0.52.0
	windows-targets@0.42.2
	windows-targets@0.48.5
	windows-targets@0.52.0
	windows_aarch64_gnullvm@0.42.2
	windows_aarch64_gnullvm@0.48.5
	windows_aarch64_gnullvm@0.52.0
	windows_aarch64_msvc@0.42.2
	windows_aarch64_msvc@0.48.5
	windows_aarch64_msvc@0.52.0
	windows_i686_gnu@0.42.2
	windows_i686_gnu@0.48.5
	windows_i686_gnu@0.52.0
	windows_i686_msvc@0.42.2
	windows_i686_msvc@0.48.5
	windows_i686_msvc@0.52.0
	windows_x86_64_gnu@0.42.2
	windows_x86_64_gnu@0.48.5
	windows_x86_64_gnu@0.52.0
	windows_x86_64_gnullvm@0.42.2
	windows_x86_64_gnullvm@0.48.5
	windows_x86_64_gnullvm@0.52.0
	windows_x86_64_msvc@0.42.2
	windows_x86_64_msvc@0.48.5
	windows_x86_64_msvc@0.52.0
	winnow@0.5.28
	winreg@0.50.0
	xattr@1.1.3
	yaml-rust@0.4.5
	yansi@0.5.1
	yansi@1.0.0-rc.1
	zerocopy-derive@0.7.31
	zerocopy@0.7.31
	zeroize@1.7.0
	zipsign-api@0.1.1
	zstd-safe@7.0.0
	zstd-sys@2.0.9+zstd.1.5.5
	zstd@0.13.0
"

inherit cargo

DESCRIPTION="Next-generation test runner for Rust"
HOMEPAGE="https://nexte.st/"
SRC_URI=" https://github.com/nextest-rs/nextest/archive/refs/tags/${P}.tar.gz"
SRC_URI+=" ${CARGO_CRATE_URIS}"
S="${WORKDIR}"/nextest-${P}/${PN}

LICENSE="|| ( Apache-2.0 MIT )"
# Dependent crate licenses
LICENSE+="
	Apache-2.0 Apache-2.0-with-LLVM-exceptions BSD ISC MIT MPL-2.0
	Unicode-DFS-2016
"
SLOT="0"
KEYWORDS="~amd64 ~arm64"

QA_FLAGS_IGNORED="usr/bin/cargo-nextest"
