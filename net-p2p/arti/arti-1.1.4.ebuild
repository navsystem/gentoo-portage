# Copyright 2022-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

CRATES="
	addr2line-0.19.0
	adler-1.0.2
	aes-0.8.2
	ahash-0.7.6
	aho-corasick-1.0.1
	android_system_properties-0.1.5
	anyhow-1.0.70
	approx-0.5.1
	arbitrary-1.3.0
	arrayref-0.3.7
	assert-impl-0.1.3
	async-broadcast-0.5.1
	async-channel-1.8.0
	async-compression-0.3.15
	async-ctrlc-1.2.0
	async-executor-1.5.1
	async-global-executor-2.3.1
	async-io-1.13.0
	async-lock-2.7.0
	async-native-tls-0.5.0
	async-process-1.7.0
	async-rustls-0.3.0
	async-std-1.12.0
	async-task-4.4.0
	async-trait-0.1.68
	async_executors-0.6.0
	asynchronous-codec-0.6.1
	atomic-0.5.1
	atomic-waker-1.1.1
	atty-0.2.14
	autocfg-1.1.0
	backtrace-0.3.67
	base64-0.13.1
	base64ct-1.6.0
	bitflags-1.3.2
	bitflags-2.2.1
	blanket-0.2.0
	block-buffer-0.10.4
	block-buffer-0.9.0
	blocking-1.3.1
	bounded-vec-deque-0.1.1
	bumpalo-3.12.1
	by_address-1.1.0
	bytemuck-1.13.1
	byteorder-1.4.3
	bytes-1.4.0
	cc-1.0.79
	cfg-if-1.0.0
	chrono-0.4.24
	cipher-0.4.4
	clap-3.2.25
	clap_lex-0.2.4
	coarsetime-0.1.23
	codespan-reporting-0.11.1
	concurrent-queue-2.2.0
	config-0.13.3
	const-oid-0.9.2
	convert_case-0.4.0
	core-foundation-0.9.3
	core-foundation-sys-0.8.4
	cpufeatures-0.2.7
	crc32fast-1.3.2
	crossbeam-channel-0.5.8
	crossbeam-queue-0.3.8
	crossbeam-utils-0.8.15
	crypto-common-0.1.6
	ctor-0.1.26
	ctor-0.2.0
	ctr-0.9.2
	ctrlc-3.2.5
	curve25519-dalek-3.2.0
	cxx-1.0.94
	cxx-build-1.0.94
	cxxbridge-flags-1.0.94
	cxxbridge-macro-1.0.94
	darling-0.14.4
	darling-0.20.0
	darling_core-0.14.4
	darling_core-0.20.0
	darling_macro-0.14.4
	darling_macro-0.20.0
	dashmap-5.4.0
	data-encoding-2.3.3
	der-0.6.1
	derive_arbitrary-1.3.0
	derive_builder_core_fork_arti-0.11.2
	derive_builder_fork_arti-0.11.2
	derive_builder_macro_fork_arti-0.11.2
	derive_more-0.99.17
	digest-0.10.6
	digest-0.9.0
	directories-5.0.0
	dirs-5.0.0
	dirs-sys-0.4.0
	displaydoc-0.2.3
	downcast-rs-1.2.0
	dyn-clone-1.0.11
	ed25519-1.5.3
	ed25519-dalek-1.0.1
	educe-0.4.22
	either-1.8.1
	enum-as-inner-0.5.1
	enum-ordinalize-3.1.12
	env_logger-0.5.13
	erased-serde-0.3.25
	errno-0.3.1
	errno-dragonfly-0.1.2
	event-listener-2.5.3
	fallible-iterator-0.2.0
	fallible-streaming-iterator-0.1.9
	fastrand-1.9.0
	filetime-0.2.21
	flate2-1.0.26
	float-cmp-0.9.0
	float-ord-0.3.2
	float_eq-1.0.1
	fluid-let-1.0.0
	fnv-1.0.7
	foreign-types-0.3.2
	foreign-types-shared-0.1.1
	form_urlencoded-1.1.0
	fslock-0.2.1
	futures-0.3.28
	futures-await-test-0.3.0
	futures-await-test-macro-0.3.0
	futures-channel-0.3.28
	futures-core-0.3.28
	futures-executor-0.3.28
	futures-io-0.3.28
	futures-lite-1.13.0
	futures-macro-0.3.28
	futures-sink-0.3.28
	futures-task-0.3.28
	futures-util-0.3.28
	generic-array-0.14.7
	getrandom-0.1.16
	getrandom-0.2.9
	ghost-0.1.9
	gimli-0.27.2
	gloo-timers-0.2.6
	hashbrown-0.12.3
	hashlink-0.8.1
	heck-0.4.1
	hermit-abi-0.1.19
	hermit-abi-0.2.6
	hermit-abi-0.3.1
	hex-0.4.3
	hex-literal-0.4.1
	hkdf-0.12.3
	hmac-0.12.1
	hostname-validator-1.1.1
	http-0.2.9
	http-body-0.4.5
	httparse-1.8.0
	httpdate-1.0.2
	humantime-1.3.0
	humantime-2.1.0
	humantime-serde-1.1.1
	hyper-0.14.26
	iana-time-zone-0.1.56
	iana-time-zone-haiku-0.1.1
	ident_case-1.0.1
	idna-0.2.3
	idna-0.3.0
	indexmap-1.9.3
	inotify-0.9.6
	inotify-sys-0.1.5
	inout-0.1.3
	instant-0.1.12
	inventory-0.3.5
	io-lifetimes-1.0.10
	ipnet-2.7.2
	itertools-0.10.5
	itoa-1.0.6
	jobserver-0.1.26
	js-sys-0.3.61
	keccak-0.1.3
	kqueue-1.0.7
	kqueue-sys-1.0.3
	kv-log-macro-1.0.7
	lazy_static-1.4.0
	libc-0.2.142
	libm-0.2.6
	libsqlite3-sys-0.26.0
	link-cplusplus-1.0.8
	linux-raw-sys-0.1.4
	linux-raw-sys-0.3.6
	lock_api-0.4.9
	log-0.4.17
	lzma-sys-0.1.20
	matchers-0.1.0
	matches-0.1.10
	matrixmultiply-0.3.4
	memchr-2.5.0
	memmap2-0.5.10
	merlin-2.0.1
	minimal-lexical-0.2.1
	miniz_oxide-0.6.2
	miniz_oxide-0.7.1
	mio-0.8.6
	nalgebra-0.29.0
	nalgebra-macros-0.1.0
	native-tls-0.2.11
	nix-0.26.2
	nom-7.1.3
	notify-5.1.0
	nu-ansi-term-0.46.0
	num-bigint-0.4.3
	num-bigint-dig-0.8.2
	num-complex-0.4.3
	num-integer-0.1.45
	num-iter-0.1.43
	num-rational-0.4.1
	num-traits-0.2.15
	num_cpus-1.15.0
	num_enum-0.6.1
	num_enum_derive-0.6.1
	object-0.30.3
	once_cell-1.17.1
	opaque-debug-0.3.0
	openssl-0.10.52
	openssl-macros-0.1.1
	openssl-probe-0.1.5
	openssl-src-111.25.3+1.1.1t
	openssl-sys-0.9.87
	os_str_bytes-6.5.0
	overload-0.1.1
	parking-2.1.0
	parking_lot-0.12.1
	parking_lot_core-0.9.7
	paste-1.0.12
	pathdiff-0.2.1
	pem-0.8.3
	pem-rfc7468-0.6.0
	percent-encoding-2.2.0
	phf-0.11.1
	phf_generator-0.11.1
	phf_macros-0.11.1
	phf_shared-0.11.1
	pin-project-1.0.12
	pin-project-internal-1.0.12
	pin-project-lite-0.2.9
	pin-utils-0.1.0
	pkcs1-0.4.1
	pkcs8-0.9.0
	pkg-config-0.3.26
	polling-2.8.0
	postage-0.5.0
	ppv-lite86-0.2.17
	proc-macro-crate-1.3.1
	proc-macro2-1.0.56
	quick-error-1.2.3
	quote-1.0.26
	rand-0.7.3
	rand-0.8.5
	rand_chacha-0.2.2
	rand_chacha-0.3.1
	rand_core-0.5.1
	rand_core-0.6.4
	rand_distr-0.4.3
	rand_hc-0.2.0
	rawpointer-0.2.1
	redox_syscall-0.2.16
	redox_syscall-0.3.5
	redox_users-0.4.3
	regex-1.8.1
	regex-automata-0.1.10
	regex-syntax-0.6.29
	regex-syntax-0.7.1
	retain_mut-0.1.9
	ring-0.16.20
	rlimit-0.9.1
	rmp-0.8.11
	rmp-serde-1.1.1
	rsa-0.8.2
	rusqlite-0.29.0
	rustc-demangle-0.1.23
	rustc_version-0.4.0
	rustix-0.36.13
	rustix-0.37.17
	rustls-0.20.8
	rustversion-1.0.12
	ryu-1.0.13
	safe_arch-0.6.0
	same-file-1.0.6
	sanitize-filename-0.4.0
	schannel-0.1.21
	scopeguard-1.1.0
	scratch-1.0.5
	sct-0.7.0
	secmem-proc-0.3.0
	security-framework-2.8.2
	security-framework-sys-2.8.0
	semver-1.0.17
	serde-1.0.160
	serde_derive-1.0.160
	serde_ignored-0.1.7
	serde_json-1.0.96
	serde_repr-0.1.12
	serde_spanned-0.6.1
	serde_test-1.0.160
	serde_with-2.3.3
	serde_with_macros-2.3.3
	serial_test-2.0.0
	serial_test_derive-2.0.0
	sha1-0.10.5
	sha1-asm-0.5.1
	sha2-0.10.6
	sha2-0.9.9
	sha3-0.10.7
	sharded-slab-0.1.4
	shellexpand-3.1.0
	signal-hook-0.3.15
	signal-hook-async-std-0.2.2
	signal-hook-registry-1.4.1
	signature-1.6.4
	signature-2.1.0
	simba-0.6.0
	simple_asn1-0.6.2
	siphasher-0.3.10
	slab-0.4.8
	slotmap-1.0.6
	smallvec-1.10.0
	socket2-0.4.9
	spin-0.5.2
	spki-0.6.0
	static_assertions-1.1.0
	statrs-0.16.0
	strsim-0.10.0
	strum-0.24.1
	strum_macros-0.24.3
	subtle-2.4.1
	syn-1.0.109
	syn-2.0.15
	tempfile-3.5.0
	termcolor-1.2.0
	test-cert-gen-0.9.0
	textwrap-0.16.0
	thiserror-1.0.40
	thiserror-impl-1.0.40
	thread_local-1.1.7
	time-0.3.20
	time-core-0.1.0
	time-macros-0.2.8
	tinystr-0.7.1
	tinyvec-1.6.0
	tinyvec_macros-0.1.1
	tls-api-0.9.0
	tls-api-native-tls-0.9.0
	tls-api-openssl-0.9.0
	tls-api-test-0.9.0
	tokio-1.28.0
	tokio-macros-2.1.0
	tokio-socks-0.5.1
	tokio-util-0.7.8
	toml-0.5.11
	toml-0.7.3
	toml_datetime-0.6.1
	toml_edit-0.19.8
	tower-service-0.3.2
	tracing-0.1.37
	tracing-appender-0.2.2
	tracing-attributes-0.1.24
	tracing-core-0.1.30
	tracing-journald-0.3.0
	tracing-log-0.1.3
	tracing-subscriber-0.3.17
	tracing-test-0.2.4
	tracing-test-macro-0.2.4
	trust-dns-proto-0.22.0
	try-lock-0.2.4
	typed-index-collections-3.1.0
	typenum-1.16.0
	typetag-0.2.8
	typetag-impl-0.2.8
	unicode-bidi-0.3.13
	unicode-ident-1.0.8
	unicode-normalization-0.1.22
	unicode-width-0.1.10
	untrusted-0.6.2
	untrusted-0.7.1
	url-2.3.1
	users-0.11.0
	valuable-0.1.0
	value-bag-1.0.0-alpha.9
	vcpkg-0.2.15
	version_check-0.9.4
	visibility-0.0.1
	visible-0.0.1
	void-1.0.2
	waker-fn-1.1.0
	walkdir-2.3.3
	want-0.3.0
	wasi-0.11.0+wasi-snapshot-preview1
	wasi-0.9.0+wasi-snapshot-preview1
	wasm-bindgen-0.2.84
	wasm-bindgen-backend-0.2.84
	wasm-bindgen-futures-0.4.34
	wasm-bindgen-macro-0.2.84
	wasm-bindgen-macro-support-0.2.84
	wasm-bindgen-shared-0.2.84
	weak-table-0.3.2
	web-sys-0.3.61
	webpki-0.22.0
	wide-0.7.8
	winapi-0.3.9
	winapi-i686-pc-windows-gnu-0.4.0
	winapi-util-0.1.5
	winapi-x86_64-pc-windows-gnu-0.4.0
	windows-0.43.0
	windows-0.48.0
	windows-sys-0.42.0
	windows-sys-0.45.0
	windows-sys-0.48.0
	windows-targets-0.42.2
	windows-targets-0.48.0
	windows_aarch64_gnullvm-0.42.2
	windows_aarch64_gnullvm-0.48.0
	windows_aarch64_msvc-0.42.2
	windows_aarch64_msvc-0.48.0
	windows_i686_gnu-0.42.2
	windows_i686_gnu-0.48.0
	windows_i686_msvc-0.42.2
	windows_i686_msvc-0.48.0
	windows_x86_64_gnu-0.42.2
	windows_x86_64_gnu-0.48.0
	windows_x86_64_gnullvm-0.42.2
	windows_x86_64_gnullvm-0.48.0
	windows_x86_64_msvc-0.42.2
	windows_x86_64_msvc-0.48.0
	winnow-0.4.4
	x25519-dalek-2.0.0-pre.1
	x509-signature-0.5.0
	xz2-0.1.7
	zeroize-1.6.0
	zeroize_derive-1.4.2
	zstd-0.11.2+zstd.1.5.2
	zstd-safe-5.0.2+zstd.1.5.2
	zstd-sys-2.0.8+zstd.1.5.5
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
		$(cargo_crate_uris ${CRATES})"
	KEYWORDS="~amd64"
	S="${WORKDIR}/${MY_P}"
fi

LICENSE="MIT Apache-2.0"
# Dependent crate licenses
LICENSE+="
	Apache-2.0 BSD-2 BSD ISC MIT Unicode-DFS-2016 Unlicense ZLIB
	|| ( Artistic-2 CC0-1.0 )
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
