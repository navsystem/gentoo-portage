# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit meson

COMMIT_HASH="1d85870cc3b92690d42fa3e480961fb2f708388e"
MESON_DOCS_TAR=meson-docs-0.63.0-40-g280f3423b.tar.gz

DESCRIPTION="A meson-compatible build system"
HOMEPAGE="https://muon.build/"
SRC_URI="
	https://git.sr.ht/~lattis/muon/archive/${COMMIT_HASH}.tar.gz -> ${P}.tar.gz
	man? (
		https://mochiro.moe/wrap/${MESON_DOCS_TAR}
	)
"

# Apache-2.0 for meson-docs
LICENSE="GPL-3 man? ( Apache-2.0 )"
SLOT="0"
KEYWORDS="~amd64"
IUSE="+archive +curl +libpkgconf +man"

S="${WORKDIR}/${PN}-${COMMIT_HASH}"

DEPEND="
	curl? ( net-misc/curl )
	archive? ( app-arch/libarchive:= )
	libpkgconf? ( dev-util/pkgconf:= )
	man? ( app-text/scdoc )
"
RDEPEND="${DEPEND}"

src_prepare() {
	default

	if use man; then
		mv "${WORKDIR}/meson-docs" "${S}/subprojects" || die
	fi
}

src_configure() {
	local emesonargs=(
		$(meson_feature curl libcurl)
		$(meson_feature archive libarchive)
		$(meson_feature libpkgconf)
		$(meson_feature man docs)
		-Dsamurai=disabled  # patched version of samurai downloaded via wraps
		-Dbestline=enabled  # vendored bestline, an insignificant addition
	)
	meson_src_configure
}
