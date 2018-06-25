# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6
PYTHON_COMPAT=( python2_7 )
inherit multilib multiprocessing autotools python-single-r1

MYP=${PN}-gpl-${PV}

DESCRIPTION="GNAT Component Collection"
HOMEPAGE="http://libre.adacore.com"
SRC_URI="http://mirrors.cdn.adacore.com/art/5b0ce9cbc7a4475263382be6
	-> ${MYP}-src.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="gnat_2016 gnat_2017 +gnat_2018 gnatcoll_db2ada gnatinspect postgres
	+shared sql sqlite static-libs static-pic xref"

RDEPEND="dev-lang/gnat-gpl:7.3.1
	dev-ada/gnatcoll-core[gnat_2018,shared?,static-libs?,static-pic?]
	dev-ada/libgpr[gnat_2018,shared?,static-libs?,static-pic?]
	dev-ada/xmlada[gnat_2018,shared?,static-libs?,static-pic?]
	sqlite? ( dev-db/sqlite:3 )
	postgres? ( dev-db/postgresql:* )
	xref? (
		dev-ada/gnatcoll-bindings[iconv,shared?,static-libs?,static-pic?]
	)"
DEPEND="${RDEPEND}
	dev-ada/gprbuild[gnat_2018]"

REQUIRED_USE="!gnat_2016 !gnat_2017 gnat_2018
	sqlite? ( sql )
	xref? ( sqlite )
	gnatinspect? ( xref )
	gnatcoll_db2ada? ( sql )"

S="${WORKDIR}"/${MYP}-src

PATCHES=( "${FILESDIR}"/${P}-gentoo.patch )

src_compile() {
	GCC_PV=7.3.1
	build () {
		GCC=${CHOST}-gcc-${GCC_PV} \
			GPR_PROJECT_PATH="${S}/sql":"${S}/sqlite":"${S}/xref" \
			gprbuild -p -m -v -j$(makeopts_jobs) -XGNATCOLL_SQLITE=external \
			-XGNATCOLL_VERSION=2018 \
			-XBUILD=PROD -XLIBRARY_TYPE=$2 -XXMLADA_BUILD=$2 -XGPR_BUILD=$2 \
			-P $1/$3.gpr \
			-cargs:Ada ${ADAFLAGS} -cargs:C ${CFLAGS} || die "gprbuild failed"
	}
	for kind in shared static-libs static-pic ; do
		if use $kind; then
			lib=${kind%-libs}
			lib=${lib/shared/relocatable}
			for dir in sql sqlite xref postgres ; do
				if use $dir; then
					build $dir $lib gnatcoll_${dir}
				fi
			done
		fi
	done
	if use shared; then
		preflib=relocatable
	elif use static-libs; then
		preflib=static
	else
		preflib=static-pic
	fi
	for dir in gnatinspect gnatcoll_db2ada ; do
		if use $dir; then
			build $dir $lib ${dir}
		fi
	done
}

src_install() {
	build () {
		GPR_PROJECT_PATH="${D}/usr/share/gpr" gprinstall -p -f \
			-XBUILD=PROD -XGNATCOLL_VERSION=2018 \
			--prefix="${D}"/usr -XLIBRARY_TYPE=$2 -XXMLADA_BUILD=$2 \
			-XGPR_BUILD=$2 --build-name=$2 --build-var=LIBRARY_TYPE \
			-P $1/$3.gpr
	}
	for kind in shared static-libs static-pic ; do
		if use $kind; then
			lib=${kind%-libs}
			lib=${lib/shared/relocatable}
			for dir in sql sqlite xref postgres ; do
				if use $dir; then
					build $dir $lib gnatcoll_${dir}
				fi
			done
		fi
	done
	for dir in gnatinspect gnatcoll_db2ada ; do
		if use $dir; then
			build $dir $lib ${dir}
		fi
	done
	einstalldocs
}
