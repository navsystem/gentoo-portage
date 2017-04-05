# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit multilib multiprocessing

MYP=${PN}-gpl-${PV}

DESCRIPTION="GNAT Component Collection"
HOMEPAGE="http://libre.adacore.com"
SRC_URI="http://mirrors.cdn.adacore.com/art/5739942ac7a447658d00e1e7 -> ${MYP}-src.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64"
IUSE="gmp iconv postgresql projects pygobject python readline +shared sqlite static syslog"

RDEPEND="dev-lang/gnat-gpl
	gmp? ( dev-libs/gmp:* )
	postgresql? ( dev-db/postgresql:* )
	pygobject? (
	|| (
		dev-python/pygobject:2
		dev-python/pygobject:3
		)
	)
	python? ( dev-lang/python:2.7 )
	sqlite? ( dev-db/sqlite )
	projects? (
		dev-ada/gprbuild[static?]
		dev-ada/gprbuild[shared?]
	)"
DEPEND="${RDEPEND}
	dev-ada/gprbuild"

S="${WORKDIR}"/${MYP}-src

PATCHES=( "${FILESDIR}"/${P}-gentoo.patch )

src_configure() {
	local myConf=""
	if use sqlite; then
		myConf="$myConf --with-sqlite=$(get_libdir)"
	else
		myConf="$myConf --without-sqlite"
	fi
	econf \
		$(use_with gmp) \
		$(use_with iconv) \
		$(use_with postgresql) \
		$(use_enable projects) \
		$(use_enable pygobject) \
		$(use_with python) \
		$(use_enable readline gpl) \
		$(use_enable readline) \
		$(use_enable syslog) \
		--with-python-exec=python2 \
		--enable-shared-python \
		--without-gtk \
		--disable-pygtk \
		$myConf
}

src_compile() {
	if use shared; then
		emake PROCESSORS=$(makeopts_jobs) build_library_type/relocatable
	fi
	if use static; then
		emake PROCESSORS=$(makeopts_jobs) build_library_type/static
	fi
}

src_install() {
	if use shared; then
		emake DESTDIR="${D}" install_library_type/relocatable
	fi
	if use static; then
		emake DESTDIR="${D}" install_library_type/static
	fi
	emake DESTDIR="${D}" install_gps_plugin
	einstalldocs
}
