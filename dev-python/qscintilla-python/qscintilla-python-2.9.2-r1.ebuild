# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6
PYTHON_COMPAT=( python2_7 python3_{4,5} )

inherit python-r1 qmake-utils

MY_P=QScintilla_gpl-${PV}

DESCRIPTION="Python bindings for Qscintilla"
HOMEPAGE="https://www.riverbankcomputing.com/software/qscintilla/intro"
SRC_URI="mirror://sourceforge/pyqt/${MY_P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="alpha amd64 ia64 ppc ppc64 ~sparc x86"
IUSE="debug"

DEPEND="
	${PYTHON_DEPS}
	>=dev-python/sip-4.18:=[${PYTHON_USEDEP}]
	>=dev-python/PyQt4-4.11.3[X,${PYTHON_USEDEP}]
	dev-qt/qtcore:4
	dev-qt/qtgui:4
	~x11-libs/qscintilla-${PV}:=[qt4(-)]
"
RDEPEND="${DEPEND}"

REQUIRED_USE="${PYTHON_REQUIRED_USE}"

S=${WORKDIR}/${MY_P}/Python

src_prepare() {
	default
	python_copy_sources
}

src_configure() {
	configuration() {
		local myconf=(
			"${PYTHON}"
			configure.py
			--qmake="$(qt4_get_bindir)"/qmake
			--destdir="$(python_get_sitedir)"/PyQt4
			--sip-incdir="$(python_get_includedir)"
			--pyqt=PyQt4
			$(usex debug '--debug --trace' '')
			--verbose
		)
		echo "${myconf[@]}"
		"${myconf[@]}" || die

		# Run eqmake4 to respect toolchain, build flags, and prevent stripping
		eqmake4 -recursive
	}
	python_foreach_impl run_in_build_dir configuration
}

src_compile() {
	python_foreach_impl run_in_build_dir default
}

src_install() {
	installation() {
		emake INSTALL_ROOT="${D}" install
		python_optimize
	}
	python_foreach_impl run_in_build_dir installation
}
