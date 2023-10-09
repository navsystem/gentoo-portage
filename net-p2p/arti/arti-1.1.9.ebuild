# Copyright 2022-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

CRATES="
	addr2line@0.21.0
	adler@1.0.2
	aes@0.8.3
	ahash@0.8.3
	aho-corasick@1.1.1
	allocator-api2@0.2.16
	amplify@4.1.1
	amplify_derive@3.0.1
	amplify_num@0.5.0
	amplify_syn@2.0.1
	android-tzdata@0.1.1
	android_system_properties@0.1.5
	anstream@0.6.1
	anstyle-parse@0.2.2
	anstyle-query@1.0.0
	anstyle-wincon@3.0.0
	anstyle@1.0.4
	anyhow@1.0.75
	approx@0.5.1
	arbitrary@1.3.0
	arrayvec@0.7.4
	ascii@1.1.0
	assert-impl@0.1.3
	async-broadcast@0.5.1
	async-channel@1.9.0
	async-compression@0.4.3
	async-ctrlc@1.2.0
	async-executor@1.5.4
	async-global-executor@2.3.1
	async-io@1.13.0
	async-lock@2.8.0
	async-native-tls@0.5.0
	async-process@1.7.0
	async-rustls@0.4.1
	async-std@1.12.0
	async-task@4.4.1
	async-trait@0.1.73
	async_executors@0.7.0
	asynchronous-codec@0.6.2
	atomic-waker@1.1.2
	atomic@0.5.3
	atty@0.2.14
	autocfg@1.1.0
	axum-core@0.3.4
	axum@0.6.20
	backtrace@0.3.69
	base16ct@0.2.0
	base64@0.13.1
	base64@0.21.4
	base64ct@1.6.0
	bitflags@1.3.2
	bitflags@2.4.0
	blake2@0.10.6
	blanket@0.3.0
	block-buffer@0.10.4
	block-buffer@0.9.0
	blocking@1.4.0
	bounded-vec-deque@0.1.1
	bumpalo@3.14.0
	by_address@1.1.0
	bytemuck@1.14.0
	byteorder@1.4.3
	bytes@1.5.0
	cc@1.0.83
	cfg-if@1.0.0
	chrono@0.4.31
	cipher@0.4.4
	clap@3.2.25
	clap@4.4.6
	clap_builder@4.4.6
	clap_derive@4.4.2
	clap_lex@0.2.4
	clap_lex@0.5.1
	coarsetime@0.1.28
	colorchoice@1.0.0
	concurrent-queue@2.3.0
	config@0.13.3
	const-oid@0.9.5
	convert_case@0.4.0
	core-foundation-sys@0.8.4
	core-foundation@0.9.3
	cpufeatures@0.2.9
	crc32fast@1.3.2
	crossbeam-channel@0.5.8
	crossbeam-queue@0.3.8
	crossbeam-utils@0.8.16
	crunchy@0.2.2
	crypto-bigint@0.5.3
	crypto-common@0.1.6
	ctr@0.9.2
	ctrlc@3.4.1
	curve25519-dalek@3.2.0
	darling@0.14.4
	darling@0.20.3
	darling_core@0.14.4
	darling_core@0.20.3
	darling_macro@0.14.4
	darling_macro@0.20.3
	dashmap@5.5.3
	data-encoding@2.4.0
	der@0.7.8
	deranged@0.3.8
	derive-adhoc-macros@0.7.3
	derive-adhoc@0.7.3
	derive_arbitrary@1.3.1
	derive_builder_core_fork_arti@0.11.2
	derive_builder_fork_arti@0.11.2
	derive_builder_macro_fork_arti@0.11.2
	derive_more@0.99.17
	digest@0.10.7
	digest@0.9.0
	directories@5.0.1
	dirs-sys@0.4.1
	dirs@5.0.1
	displaydoc@0.2.4
	downcast-rs@1.2.0
	dyn-clone@1.0.14
	dynasm@2.0.0
	dynasmrt@2.0.0
	ecdsa@0.16.8
	ed25519-dalek@1.0.1
	ed25519@1.5.3
	educe@0.4.23
	either@1.9.0
	elliptic-curve@0.13.5
	enum-as-inner@0.6.0
	enum-ordinalize@3.1.13
	env_logger@0.5.13
	equivalent@1.0.1
	erased-serde@0.3.31
	errno-dragonfly@0.1.2
	errno@0.3.3
	event-listener@2.5.3
	event-listener@3.0.0
	fallible-iterator@0.2.0
	fallible-streaming-iterator@0.1.9
	fast-socks5@0.9.1
	fastrand@1.9.0
	fastrand@2.0.1
	ff@0.13.0
	filetime@0.2.22
	fixed-capacity-vec@1.0.1
	flate2@1.0.27
	float-cmp@0.9.0
	float-ord@0.3.2
	float_eq@1.0.1
	fluid-let@1.0.0
	fnv@1.0.7
	foreign-types-shared@0.1.1
	foreign-types@0.3.2
	form_urlencoded@1.2.0
	fslock@0.2.1
	futures-await-test-macro@0.3.0
	futures-await-test@0.3.0
	futures-channel@0.3.28
	futures-core@0.3.28
	futures-executor@0.3.28
	futures-io@0.3.28
	futures-lite@1.13.0
	futures-macro@0.3.28
	futures-sink@0.3.28
	futures-task@0.3.28
	futures-util@0.3.28
	futures@0.3.28
	generational-arena@0.2.9
	generic-array@0.14.7
	getrandom@0.1.16
	getrandom@0.2.10
	gimli@0.28.0
	gloo-timers@0.2.6
	group@0.13.0
	hashbrown@0.12.3
	hashbrown@0.14.0
	hashlink@0.8.4
	heck@0.4.1
	hermit-abi@0.1.19
	hermit-abi@0.3.3
	hex-literal@0.4.1
	hex@0.4.3
	hkdf@0.12.3
	hmac@0.12.1
	hostname-validator@1.1.1
	http-body@0.4.5
	http@0.2.9
	httparse@1.8.0
	httpdate@1.0.3
	humantime-serde@1.1.1
	humantime@1.3.0
	humantime@2.1.0
	hyper@0.14.27
	iana-time-zone-haiku@0.1.2
	iana-time-zone@0.1.57
	ident_case@1.0.1
	idna@0.4.0
	indexmap@1.9.3
	indexmap@2.0.1
	inotify-sys@0.1.5
	inotify@0.9.6
	inout@0.1.3
	instant@0.1.12
	inventory@0.3.12
	io-lifetimes@1.0.11
	ipnet@2.8.0
	itertools@0.11.0
	itoa@1.0.9
	jobserver@0.1.26
	js-sys@0.3.64
	keccak@0.1.4
	kqueue-sys@1.0.4
	kqueue@1.0.8
	kv-log-macro@1.0.7
	lazy_static@1.4.0
	libc@0.2.148
	libm@0.2.7
	libsqlite3-sys@0.26.0
	linux-raw-sys@0.3.8
	linux-raw-sys@0.4.7
	lock_api@0.4.10
	log@0.4.20
	lzma-sys@0.1.20
	matchers@0.1.0
	matchit@0.7.3
	matrixmultiply@0.3.8
	memchr@2.6.3
	memmap2@0.5.10
	memmap2@0.8.0
	merlin@2.0.1
	mime@0.3.17
	minimal-lexical@0.2.1
	miniz_oxide@0.7.1
	mio@0.8.8
	nalgebra-macros@0.1.0
	nalgebra@0.29.0
	native-tls@0.2.11
	nix@0.27.1
	nom@7.1.3
	notify@6.1.1
	nu-ansi-term@0.46.0
	num-bigint-dig@0.8.4
	num-bigint@0.4.4
	num-complex@0.4.4
	num-integer@0.1.45
	num-iter@0.1.43
	num-rational@0.4.1
	num-traits@0.2.16
	num_cpus@1.16.0
	num_enum@0.7.0
	num_enum_derive@0.7.0
	object@0.32.1
	once_cell@1.18.0
	opaque-debug@0.3.0
	openssl-macros@0.1.1
	openssl-probe@0.1.5
	openssl-src@300.1.5+3.1.3
	openssl-sys@0.9.93
	openssl@0.10.57
	option-ext@0.2.0
	ordered-float@2.10.0
	os_str_bytes@6.5.1
	overload@0.1.1
	p256@0.13.2
	p384@0.13.0
	parking@2.1.1
	parking_lot@0.12.1
	parking_lot_core@0.9.8
	paste@1.0.14
	pathdiff@0.2.1
	pem-rfc7468@0.7.0
	pem@0.8.3
	percent-encoding@2.3.0
	permutohedron@0.2.4
	phf@0.11.2
	phf_generator@0.11.2
	phf_macros@0.11.2
	phf_shared@0.11.2
	pin-project-internal@1.1.3
	pin-project-lite@0.2.13
	pin-project@1.1.3
	pin-utils@0.1.0
	piper@0.2.1
	pkcs1@0.7.5
	pkcs8@0.10.2
	pkg-config@0.3.27
	polling@2.8.0
	postage@0.5.0
	ppv-lite86@0.2.17
	primeorder@0.13.2
	proc-macro-crate@1.3.1
	proc-macro-error-attr@1.0.4
	proc-macro-error@1.0.4
	proc-macro2@1.0.67
	pwd-grp@0.1.1
	quick-error@1.2.3
	quote@1.0.33
	rand@0.7.3
	rand@0.8.5
	rand_chacha@0.2.2
	rand_chacha@0.3.1
	rand_core@0.5.1
	rand_core@0.6.4
	rand_distr@0.4.3
	rand_hc@0.2.0
	rangemap@1.4.0
	rawpointer@0.2.1
	redox_syscall@0.2.16
	redox_syscall@0.3.5
	redox_users@0.4.3
	regex-automata@0.1.10
	regex-automata@0.3.8
	regex-syntax@0.6.29
	regex-syntax@0.7.5
	regex@1.9.5
	retain_mut@0.1.9
	rfc6979@0.4.0
	ring@0.16.20
	rlimit@0.10.1
	rmp-serde@1.1.2
	rmp@0.8.12
	rsa@0.9.2
	rusqlite@0.29.0
	rustc-demangle@0.1.23
	rustc_version@0.4.0
	rustix@0.37.23
	rustix@0.38.14
	rustls-webpki@0.101.6
	rustls@0.21.7
	rustversion@1.0.14
	ryu@1.0.15
	safe_arch@0.7.1
	same-file@1.0.6
	sanitize-filename@0.5.0
	schannel@0.1.22
	scopeguard@1.2.0
	sct@0.7.0
	sec1@0.7.3
	secmem-proc@0.3.2
	security-framework-sys@2.9.1
	security-framework@2.9.2
	semver@1.0.19
	serde-value@0.7.0
	serde@1.0.188
	serde_derive@1.0.188
	serde_ignored@0.1.9
	serde_json@1.0.107
	serde_path_to_error@0.1.14
	serde_repr@0.1.16
	serde_spanned@0.6.3
	serde_test@1.0.176
	serde_urlencoded@0.7.1
	serde_with@3.3.0
	serde_with_macros@3.3.0
	serial_test@2.0.0
	serial_test_derive@2.0.0
	sha1-asm@0.5.2
	sha1@0.10.6
	sha2@0.10.8
	sha2@0.9.9
	sha3@0.10.8
	sharded-slab@0.1.6
	shellexpand@3.1.0
	signal-hook-async-std@0.2.2
	signal-hook-registry@1.4.1
	signal-hook@0.3.17
	signature@1.6.4
	signature@2.1.0
	simba@0.6.0
	simple_asn1@0.6.2
	siphasher@0.3.11
	slab@0.4.9
	slotmap@1.0.6
	smallvec@1.11.1
	socket2@0.4.9
	socket2@0.5.4
	spin@0.5.2
	spki@0.7.2
	ssh-cipher@0.2.0
	ssh-encoding@0.2.0
	ssh-key@0.6.1
	static_assertions@1.1.0
	statrs@0.16.0
	strsim@0.10.0
	strum@0.25.0
	strum_macros@0.25.2
	subtle@2.5.0
	syn@1.0.109
	syn@2.0.37
	sync_wrapper@0.1.2
	tempfile@3.8.0
	termcolor@1.3.0
	test-cert-gen@0.9.0
	textwrap@0.16.0
	thiserror-impl@1.0.49
	thiserror@1.0.49
	thread_local@1.1.7
	time-core@0.1.2
	time-macros@0.2.15
	time@0.3.29
	tiny-keccak@2.0.2
	tinystr@0.7.1
	tinyvec@1.6.0
	tinyvec_macros@0.1.1
	tls-api-native-tls@0.9.0
	tls-api-openssl@0.9.0
	tls-api-test@0.9.0
	tls-api@0.9.0
	tokio-macros@2.1.0
	tokio-socks@0.5.1
	tokio-stream@0.1.14
	tokio-util@0.7.9
	tokio@1.32.0
	toml@0.5.11
	toml@0.7.8
	toml_datetime@0.6.3
	toml_edit@0.19.15
	tower-layer@0.3.2
	tower-service@0.3.2
	tower@0.4.13
	tracing-appender@0.2.2
	tracing-attributes@0.1.26
	tracing-core@0.1.31
	tracing-journald@0.3.0
	tracing-log@0.1.3
	tracing-subscriber@0.3.17
	tracing-test-macro@0.2.4
	tracing-test@0.2.4
	tracing@0.1.37
	trust-dns-proto@0.23.0
	try-lock@0.2.4
	typed-index-collections@3.1.0
	typenum@1.17.0
	typetag-impl@0.2.13
	typetag@0.2.13
	unicode-bidi@0.3.13
	unicode-ident@1.0.12
	unicode-normalization@0.1.22
	untrusted@0.6.2
	untrusted@0.7.1
	url@2.4.1
	utf8parse@0.2.1
	valuable@0.1.0
	value-bag@1.4.1
	vcpkg@0.2.15
	version_check@0.9.4
	visibility@0.1.0
	visible@0.0.1
	void@1.0.2
	waker-fn@1.1.1
	walkdir@2.4.0
	want@0.3.1
	wasi@0.11.0+wasi-snapshot-preview1
	wasi@0.9.0+wasi-snapshot-preview1
	wasm-bindgen-backend@0.2.87
	wasm-bindgen-futures@0.4.37
	wasm-bindgen-macro-support@0.2.87
	wasm-bindgen-macro@0.2.87
	wasm-bindgen-shared@0.2.87
	wasm-bindgen@0.2.87
	weak-table@0.3.2
	web-sys@0.3.64
	webpki@0.22.1
	wide@0.7.11
	winapi-i686-pc-windows-gnu@0.4.0
	winapi-util@0.1.6
	winapi-x86_64-pc-windows-gnu@0.4.0
	winapi@0.3.9
	windows-sys@0.48.0
	windows-targets@0.48.5
	windows@0.48.0
	windows_aarch64_gnullvm@0.48.5
	windows_aarch64_msvc@0.48.5
	windows_i686_gnu@0.48.5
	windows_i686_msvc@0.48.5
	windows_x86_64_gnu@0.48.5
	windows_x86_64_gnullvm@0.48.5
	windows_x86_64_msvc@0.48.5
	winnow@0.5.15
	x25519-dalek@2.0.0-pre.1
	x509-signature@0.5.0
	xz2@0.1.7
	zeroize@1.6.0
	zeroize_derive@1.4.2
	zstd-safe@6.0.6
	zstd-sys@2.0.8+zstd.1.5.5
	zstd@0.12.4
"

inherit cargo

MY_P="${PN}-${PN}-v${PV}"

DESCRIPTION="An implementation of Tor, in Rust."
HOMEPAGE="https://gitlab.torproject.org/tpo/core/arti/"

if [[ "${PV}" == *9999 ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://gitlab.torproject.org/tpo/core/arti"
else
	SRC_URI="https://gitlab.torproject.org/tpo/core/${PN}/-/archive/${PN}-v${PV}/${PN}-${PN}-v${PV}.tar.bz2 -> ${P}.tar.bz2
		${CARGO_CRATE_URIS}"
	KEYWORDS="~amd64"
	S="${WORKDIR}/${MY_P}"
fi

LICENSE="MIT Apache-2.0"
# Dependent crate licenses
LICENSE+="
	Apache-2.0 BSD CC0-1.0 ISC MIT MPL-2.0 Unicode-DFS-2016 Unlicense
	ZLIB
"
SLOT="0"

DEPEND="app-arch/xz-utils
	dev-db/sqlite:3
	dev-libs/openssl:="
RDEPEND="${DEPEND}"

QA_FLAGS_IGNORED="usr/bin/arti"

src_unpack() {
	if [[ "${PV}" == *9999 ]]; then
		git-r3_src_unpack
		cargo_live_src_unpack
	else
		cargo_src_unpack
	fi
}

src_compile() {
	for crate in crates/*; do
		pushd crates/arti || die
		cargo_src_compile
		popd >/dev/null || die
	done
}

src_install() {
	pushd crates/arti >/dev/null || due

	cargo_src_install
	newdoc src/arti-example-config.toml arti.toml

	popd >/dev/null || die

	dodoc -r doc/*
}
