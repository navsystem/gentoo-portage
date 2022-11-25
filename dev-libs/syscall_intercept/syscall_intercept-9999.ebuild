# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake git-r3

DESCRIPTION="Userspace syscall intercepting library."
HOMEPAGE="https://github.com/pmem/syscall_intercept"
EGIT_REPO_URI="https://github.com/eegorov/syscall_intercept.git"
EGIT_BRANCH="master"

LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64"

DEPEND="
	dev-libs/capstone
	app-text/pandoc
"

RDEPEND="${DEPEND}
"
BDEPEND="virtual/pkgconfig"

QA_EXECSTACK="usr/lib64/*"
QA_WX_LOAD="usr/lib64/*"
QA_FLAGS_IGNORED=".*"

PATCHES=(
	"${FILESDIR}"/${PN}-disable-static.patch
	)

