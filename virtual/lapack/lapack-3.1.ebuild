# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=5

DESCRIPTION="Virtual for Linear Algebra Package FORTRAN 77 (LAPACK) implementation"
SLOT="0"
KEYWORDS="alpha amd64 arm arm64 hppa ia64 ppc ppc64 s390 sparc x86 ~amd64-linux ~x86-linux ~ppc-macos ~x64-macos ~x86-macos"

RDEPEND="|| (
		>=sci-libs/lapack-reference-3.1
		>=sci-libs/mkl-10
	)"
