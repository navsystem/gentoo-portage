# Copyright 2022-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

CRATES="
	adler@1.0.2
	ahash@0.8.11
	aho-corasick@1.1.3
	allocator-api2@0.2.18
	android-tzdata@0.1.1
	android_system_properties@0.1.5
	anstream@0.6.14
	anstyle-parse@0.2.4
	anstyle-query@1.1.0
	anstyle-wincon@3.0.3
	anstyle@1.0.7
	anyhow@1.0.86
	arc-swap@1.7.1
	arraydeque@0.5.1
	arrayvec@0.7.4
	async-broadcast@0.7.1
	async-channel@2.3.1
	async-executor@1.13.0
	async-fs@2.1.2
	async-io@2.3.3
	async-lock@3.4.0
	async-process@2.2.3
	async-recursion@1.1.1
	async-signal@0.2.9
	async-task@4.7.1
	async-trait@0.1.81
	atomic-waker@1.1.2
	autocfg@1.3.0
	base64@0.13.1
	base64@0.22.1
	bitflags@1.3.2
	bitflags@2.6.0
	block-buffer@0.10.4
	block-buffer@0.9.0
	block@0.1.6
	blocking@1.6.1
	bstr@1.9.1
	bumpalo@3.16.0
	bytesize@1.3.0
	cc@1.1.6
	cfg-if@1.0.0
	cfg_aliases@0.2.1
	chrono@0.4.38
	clap@4.5.11
	clap_builder@4.5.11
	clap_complete@4.5.11
	clap_derive@4.5.11
	clap_lex@0.7.1
	clru@0.6.2
	cmake@0.1.50
	colorchoice@1.0.1
	concurrent-queue@2.5.0
	const-random-macro@0.1.16
	const-random@0.1.18
	const_format@0.2.32
	const_format_proc_macros@0.2.32
	core-foundation-sys@0.8.6
	core-foundation@0.9.4
	cpufeatures@0.2.12
	crc32fast@1.4.2
	crossbeam-channel@0.5.13
	crossbeam-deque@0.8.5
	crossbeam-epoch@0.9.18
	crossbeam-queue@0.3.11
	crossbeam-utils@0.8.20
	crossbeam@0.8.4
	crunchy@0.2.2
	crypto-common@0.1.6
	deelevate@0.2.0
	deranged@0.3.11
	digest@0.10.7
	digest@0.9.0
	dirs-next@2.0.0
	dirs-sys-next@0.1.2
	dirs-sys@0.3.7
	dirs-sys@0.4.1
	dirs@4.0.0
	dirs@5.0.1
	dlv-list@0.5.2
	downcast@0.11.0
	dunce@1.0.4
	dyn-clone@1.0.17
	either@1.13.0
	encoding_rs@0.8.34
	endi@1.1.0
	enumflags2@0.7.10
	enumflags2_derive@0.7.10
	equivalent@1.0.1
	errno-dragonfly@0.1.2
	errno@0.2.8
	errno@0.3.9
	event-listener-strategy@0.5.2
	event-listener@5.3.1
	faster-hex@0.9.0
	fastrand@2.1.0
	filedescriptor@0.8.2
	filetime@0.2.23
	flate2@1.0.30
	fnv@1.0.7
	form_urlencoded@1.2.1
	fragile@2.0.0
	futures-core@0.3.30
	futures-io@0.3.30
	futures-lite@2.3.0
	futures-sink@0.3.30
	futures-task@0.3.30
	futures-util@0.3.30
	generic-array@0.14.7
	gethostname@0.5.0
	getrandom@0.2.15
	gix-actor@0.31.5
	gix-bitmap@0.2.11
	gix-chunk@0.4.8
	gix-commitgraph@0.24.3
	gix-config-value@0.14.7
	gix-config@0.38.0
	gix-date@0.8.7
	gix-diff@0.44.1
	gix-discover@0.33.0
	gix-features@0.38.2
	gix-fs@0.11.2
	gix-glob@0.16.4
	gix-hash@0.14.2
	gix-hashtable@0.5.2
	gix-index@0.33.1
	gix-lock@14.0.0
	gix-macros@0.1.5
	gix-object@0.42.3
	gix-odb@0.61.1
	gix-pack@0.51.1
	gix-path@0.10.9
	gix-quote@0.4.12
	gix-ref@0.45.0
	gix-refspec@0.23.1
	gix-revision@0.27.2
	gix-revwalk@0.13.2
	gix-sec@0.10.7
	gix-tempfile@14.0.1
	gix-trace@0.1.9
	gix-traverse@0.39.2
	gix-url@0.27.4
	gix-utils@0.1.12
	gix-validate@0.8.5
	gix@0.64.0
	guess_host_triple@0.1.3
	hashbrown@0.12.3
	hashbrown@0.14.5
	hashlink@0.8.4
	heck@0.5.0
	hermit-abi@0.4.0
	hex@0.4.3
	home@0.5.9
	iana-time-zone-haiku@0.1.2
	iana-time-zone@0.1.60
	idna@0.5.0
	indexmap@1.9.3
	indexmap@2.2.6
	is-docker@0.2.0
	is-wsl@0.4.0
	is_debug@1.0.1
	is_terminal_polyfill@1.70.0
	itertools@0.13.0
	itoa@1.0.11
	js-sys@0.3.69
	jwalk@0.8.1
	lazy_static@1.5.0
	lazycell@1.3.0
	libc@0.2.155
	libredox@0.1.3
	libz-ng-sys@1.1.15
	libz-sys@1.1.18
	linux-raw-sys@0.4.14
	lock_api@0.4.12
	log@0.4.22
	mac-notification-sys@0.6.1
	mach2@0.4.2
	malloc_buf@0.0.6
	memchr@2.7.4
	memmap2@0.9.4
	memmem@0.1.1
	memoffset@0.9.1
	minimal-lexical@0.2.1
	miniz_oxide@0.7.4
	mockall@0.13.0
	mockall_derive@0.13.0
	nix@0.29.0
	nom@5.1.3
	nom@7.1.3
	notify-rust@4.11.0
	nu-ansi-term@0.50.1
	num-conv@0.1.0
	num-derive@0.3.3
	num-traits@0.2.19
	num_threads@0.1.7
	objc-foundation@0.1.1
	objc@0.2.7
	objc_id@0.1.1
	once_cell@1.19.0
	opaque-debug@0.3.1
	open@5.3.0
	option-ext@0.2.0
	ordered-float@2.10.1
	ordered-multimap@0.7.3
	ordered-stream@0.2.0
	os_info@3.8.2
	parking@2.2.0
	parking_lot@0.12.3
	parking_lot_core@0.9.10
	path-slash@0.2.1
	pathdiff@0.2.1
	pathsearch@0.2.0
	percent-encoding@2.3.1
	pest@2.7.11
	pest_derive@2.7.11
	pest_generator@2.7.11
	pest_meta@2.7.11
	phf@0.11.2
	phf_codegen@0.11.2
	phf_generator@0.11.2
	phf_shared@0.11.2
	pin-project-lite@0.2.14
	pin-utils@0.1.0
	piper@0.2.3
	pkg-config@0.3.30
	plist@1.7.0
	polling@3.7.2
	powerfmt@0.2.0
	ppv-lite86@0.2.17
	predicates-core@1.0.6
	predicates-tree@1.0.9
	predicates@3.1.0
	proc-macro-crate@3.1.0
	proc-macro2@1.0.86
	process_control@4.1.0
	prodash@28.0.0
	quick-xml@0.31.0
	quick-xml@0.32.0
	quick-xml@0.36.1
	quote@1.0.36
	rand@0.8.5
	rand_chacha@0.3.1
	rand_core@0.6.4
	rayon-core@1.12.1
	rayon@1.10.0
	redox_syscall@0.4.1
	redox_syscall@0.5.3
	redox_users@0.4.5
	regex-automata@0.4.7
	regex-syntax@0.8.4
	regex@1.10.5
	rust-ini@0.21.0
	rustix@0.38.34
	ryu@1.0.18
	same-file@1.0.6
	schemars@0.8.21
	schemars_derive@0.8.21
	scopeguard@1.2.0
	semver-parser@0.10.2
	semver@0.11.0
	semver@1.0.23
	serde@1.0.204
	serde_derive@1.0.204
	serde_derive_internals@0.29.1
	serde_json@1.0.120
	serde_repr@0.1.19
	serde_spanned@0.6.7
	sha1-asm@0.5.3
	sha1@0.10.6
	sha1_smol@1.0.1
	sha2@0.10.8
	sha2@0.9.9
	shadow-rs@0.30.0
	shared_library@0.1.9
	shell-words@1.1.0
	signal-hook-registry@1.4.2
	signal-hook@0.1.17
	signal-hook@0.3.17
	siphasher@0.3.11
	slab@0.4.9
	smallvec@1.13.2
	starship@1.20.1
	starship-battery@0.9.1
	static_assertions@1.1.0
	strsim@0.11.1
	syn@1.0.109
	syn@2.0.72
	systemstat@0.2.3
	tauri-winrt-notification@0.2.1
	tempfile@3.10.1
	terminal_size@0.3.0
	terminfo@0.7.5
	termios@0.3.3
	termtree@0.4.1
	termwiz@0.15.0
	thiserror-impl@1.0.63
	thiserror@1.0.63
	time-core@0.1.2
	time-macros@0.2.18
	time@0.3.36
	tiny-keccak@2.0.2
	tinyvec@1.8.0
	tinyvec_macros@0.1.1
	toml@0.5.11
	toml@0.8.16
	toml_datetime@0.6.7
	toml_edit@0.21.1
	toml_edit@0.22.17
	tracing-attributes@0.1.27
	tracing-core@0.1.32
	tracing@0.1.40
	trim-in-place@0.1.7
	typenum@1.17.0
	ucd-trie@0.1.6
	uds_windows@1.1.0
	uluru@3.1.0
	unicase@2.7.0
	unicode-bidi@0.3.15
	unicode-bom@2.0.3
	unicode-ident@1.0.12
	unicode-normalization@0.1.23
	unicode-segmentation@1.11.0
	unicode-width@0.1.13
	unicode-xid@0.2.4
	uom@0.36.0
	url@2.5.2
	urlencoding@2.1.3
	utf8parse@0.2.2
	vcpkg@0.2.15
	version_check@0.9.4
	versions@6.3.0
	vtparse@0.6.2
	walkdir@2.5.0
	wasi@0.11.0+wasi-snapshot-preview1
	wasm-bindgen-backend@0.2.92
	wasm-bindgen-macro-support@0.2.92
	wasm-bindgen-macro@0.2.92
	wasm-bindgen-shared@0.2.92
	wasm-bindgen@0.2.92
	which@6.0.1
	winapi-i686-pc-windows-gnu@0.4.0
	winapi-util@0.1.8
	winapi-x86_64-pc-windows-gnu@0.4.0
	winapi@0.3.9
	windows-core@0.52.0
	windows-core@0.56.0
	windows-core@0.58.0
	windows-implement@0.56.0
	windows-implement@0.58.0
	windows-interface@0.56.0
	windows-interface@0.58.0
	windows-result@0.1.2
	windows-result@0.2.0
	windows-strings@0.1.0
	windows-sys@0.48.0
	windows-sys@0.52.0
	windows-targets@0.48.5
	windows-targets@0.52.6
	windows-version@0.1.1
	windows@0.56.0
	windows@0.58.0
	windows_aarch64_gnullvm@0.48.5
	windows_aarch64_gnullvm@0.52.6
	windows_aarch64_msvc@0.48.5
	windows_aarch64_msvc@0.52.6
	windows_i686_gnu@0.48.5
	windows_i686_gnu@0.52.6
	windows_i686_gnullvm@0.52.6
	windows_i686_msvc@0.48.5
	windows_i686_msvc@0.52.6
	windows_x86_64_gnu@0.48.5
	windows_x86_64_gnu@0.52.6
	windows_x86_64_gnullvm@0.48.5
	windows_x86_64_gnullvm@0.52.6
	windows_x86_64_msvc@0.48.5
	windows_x86_64_msvc@0.52.6
	winnow@0.5.40
	winnow@0.6.15
	winres@0.1.12
	winsafe@0.0.19
	xdg-home@1.2.0
	yaml-rust2@0.8.1
	zbus@4.4.0
	zbus_macros@4.4.0
	zbus_names@3.0.0
	zerocopy-derive@0.7.35
	zerocopy@0.7.35
	zvariant@4.2.0
	zvariant_derive@4.2.0
	zvariant_utils@2.1.0
"

inherit cargo

DESCRIPTION="The minimal, blazing-fast, and infinitely customizable prompt for any shell"
HOMEPAGE="https://starship.rs/"
SRC_URI="
	${CARGO_CRATE_URIS}"

LICENSE="ISC"
# Dependent crate licenses
LICENSE+="
	Apache-2.0 BSD CC0-1.0 ISC MIT MPL-2.0 Unicode-DFS-2016 Unlicense
	WTFPL-2 ZLIB
"

SLOT="0"
KEYWORDS="amd64 arm64"

BDEPEND="
	dev-build/cmake
	>=virtual/rust-1.74.1
"

QA_FLAGS_IGNORED="usr/bin/starship"

src_prepare() {
	sed -e '/strip/s/true/false/' -i Cargo.toml || die # bug 866133
	default
}

src_configure() {
	export PKG_CONFIG_ALLOW_CROSS=1
	export OPENSSL_NO_VENDOR=true

	cargo_src_configure
}

src_install() {
	cargo_src_install
	dodoc README.md
}

pkg_postinst() {
	local v
	for v in ${REPLACING_VERSIONS}; do
		if ver_test "${v}" -lt "1.9.0"; then
			einfo "Note that vicmd_symbol config option was renamed to vimcmd_symbol in version 1.9"
		fi
	done
}
