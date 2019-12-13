# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cmake-utils

DESCRIPTION="C++ libraries for building network-based applications"
HOMEPAGE="https://pocoproject.org/"
SRC_URI="https://github.com/pocoproject/${PN}/archive/${P}-release.tar.gz -> ${P}.tar.gz"
LICENSE="Boost-1.0"
SLOT="0"
KEYWORDS="amd64 arm x86"

IUSE="7z cppparser +crypto +data examples +file2pagecompiler iodbc +json libressl mariadb +mongodb mysql +net odbc +pagecompiler pdf pocodoc sqlite +ssl test +util +xml +zip"
RESTRICT="!test? ( test )"
REQUIRED_USE="
	7z? ( xml )
	file2pagecompiler? ( pagecompiler )
	iodbc? ( odbc )
	mongodb? ( data )
	mysql? ( data )
	odbc? ( data )
	pagecompiler? ( json net util xml )
	pocodoc? ( cppparser util xml )
	sqlite? ( data )
	ssl? ( util )
	test? ( data? ( sqlite ) json util xml )
"

BDEPEND="
	virtual/pkgconfig
"
RDEPEND="
	>=dev-libs/libpcre-8.42
	mysql? ( !mariadb? ( dev-db/mysql-connector-c:0= )
		 mariadb? ( dev-db/mariadb-connector-c:0= ) )
	odbc? ( iodbc? ( dev-db/libiodbc )
		!iodbc? ( dev-db/unixODBC ) )
	sqlite? ( dev-db/sqlite:3 )
	ssl? (
		!libressl? ( dev-libs/openssl:0= )
		libressl? ( dev-libs/libressl:0= )
	)
	xml? ( dev-libs/expat )
	zip? ( sys-libs/zlib )
"
DEPEND="${RDEPEND}"

S="${WORKDIR}/${PN}-${P}-release"

PATCHES=( "${FILESDIR}/${PN}-1.7.2-iodbc-incdir.patch" )

src_prepare() {
	cmake-utils_src_prepare

	if use test ; then
		# ignore missing tests on experimental library
		# and tests requiring running DB-servers, internet connections, etc.
		sed -i -e '/testsuite/d' \
			{Data/{MySQL,ODBC},MongoDB,Net,NetSSL_OpenSSL,PDF,Redis}/CMakeLists.txt || die
		# Poco expands ~ using passwd, which does not match $HOME in the build environment
		sed -i -e '/CppUnit_addTest.*testExpand/d' \
			Foundation/testsuite/src/PathTest.cpp || die
		# ignore failing Crypto test since upstream does not seem to care,
		# see https://github.com/pocoproject/poco/issues/1209
		sed -i -e '/RSATest, testRSACipherLarge/d' \
			Crypto/testsuite/src/RSATest.cpp || die
	fi

	if use mariadb ; then
		# Fix MariaDB detection
		sed -i -e 's~/usr/include/mysql~~' \
			-e 's/STATUS "Couldn/FATAL_ERROR "Couldn/' \
		cmake/FindMySQL.cmake || die
	else
		# Fix MySQL detection
		sed -i -e 's/mysqlclient_r/mysqlclient/' \
			-e 's/STATUS "Couldn/FATAL_ERROR "Couldn/' \
		cmake/FindMySQL.cmake || die
	fi

	# Add missing directory that breaks the build
	mkdir -p Encodings/testsuite/data || die

	if ! use iodbc ; then
		sed -i -e 's|iodbc||' cmake/FindODBC.cmake || die
	fi
}

src_configure() {
	# apache support is dead and buggy, https://github.com/pocoproject/poco/issues/1764
	local mycmakeargs=(
		-DPOCO_UNBUNDLED=ON
		-DENABLE_APACHECONNECTOR=OFF
		-DENABLE_CPPPARSER="$(usex cppparser)"
		-DENABLE_CRYPTO="$(usex ssl)"
		-DENABLE_DATA="$(usex data)"
		-DENABLE_DATA_MYSQL="$(usex mysql)"
		-DENABLE_DATA_ODBC="$(usex odbc)"
		-DENABLE_DATA_SQLITE="$(usex sqlite)"
		-DENABLE_JSON="$(usex util)"
		-DENABLE_MONGODB="$(usex mongodb)"
		-DENABLE_NET="$(usex net)"
		-DENABLE_NETSSL="$(usex ssl)"
		-DENABLE_NETSSL_WIN=OFF
		-DENABLE_PAGECOMPILER="$(usex pagecompiler)"
		-DENABLE_PAGECOMPILER_FILE2PAGE="$(usex file2pagecompiler)"
		-DENABLE_PDF="$(usex pdf)"
		-DENABLE_POCODOC="$(usex pocodoc)"
		-DENABLE_SEVENZIP="$(usex 7z)"
		-DENABLE_TESTS="$(usex test)"
		-DENABLE_UTIL="$(usex util)"
		-DENABLE_XML="$(usex xml)"
		-DENABLE_ZIP="$(usex zip)"
	)

	cmake-utils_src_configure
}

src_test() {
	POCO_BASE="${S}" cmake-utils_src_test
}

src_install() {
	cmake-utils_src_install

	if use examples ; then
		for sd in */samples ; do
			insinto /usr/share/doc/${PF}/examples/${sd%/samples}
			doins -r ${sd}
		done
		find "${D}/usr/share/doc/${PF}/examples" \
			-iname "*.sln" -or -iname "*.vcproj" -or \
			-iname "*.vmsbuild" -or -iname "*.properties" \
			| xargs rm
	fi
}
