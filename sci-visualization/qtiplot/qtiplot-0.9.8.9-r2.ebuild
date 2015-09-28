# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

PYTHON_COMPAT=( python2_7 )

inherit eutils qt4-r2 fdo-mime python-single-r1 toolchain-funcs

DESCRIPTION="Qt based clone of the Origin plotting package"
HOMEPAGE="http://soft.proindependent.com/qtiplot.html
	http://www.staff.science.uu.nl/~zeven101/qtiplot.html"
SRC_URI="
	https://dev.gentoo.org/~dilfridge/distfiles/${P}.tar.bz2
	https://dev.gentoo.org/~dilfridge/distfiles/${P}-origin.patch.bz2"

LICENSE="GPL-2 GPL-3"
SLOT="0"
KEYWORDS="amd64 x86 ~amd64-linux ~x86-linux"
IUSE="bindist doc mono latex python"

LANGS="cn cz de es fr ja ro ru sv"
for l in ${LANGS}; do
	lu=${l/cz/cs}
	lu=${lu/cn/zh_CN}
	IUSE="${IUSE} linguas_${lu}"
done

REQUIRED_USE="python? ( ${PYTHON_REQUIRED_USE} )"

# qwtplot3d much modified from original upstream
# >=x11-libs/qwt-5.3 they are using trunk checkouts
CDEPEND="
	media-libs/libemf
	dev-qt/qthelp:4
	dev-qt/qtgui:4
	dev-qt/qtopengl:4
	dev-qt/qt3support:4
	dev-qt/qthelp:4[compat]
	dev-qt/qtsvg:4
	>=x11-libs/gl2ps-1.3.5[png]
	>=dev-cpp/muParser-1.32
	>=dev-libs/boost-1.35.0:=
	dev-libs/quazip
	media-libs/libpng:=
	sci-libs/alglib:=
	sci-libs/gsl
	sci-libs/tamu_anova
	latex? ( dev-tex/qtexengine )
	mono? ( dev-dotnet/libgdiplus )
	python? ( ${PYTHON_DEPS} )"
DEPEND="${CDEPEND}
	virtual/pkgconfig
	python? ( >=dev-python/sip-4.9[${PYTHON_USEDEP}] )
	doc? (
		>=app-text/docbook-sgml-utils-0.6.14-r1
		>=app-text/docbook-xml-dtd-4.4-r2:4.4 )"

RDEPEND="${CDEPEND}
	python? ( dev-python/PyQt4[X,${PYTHON_USEDEP}] )"

PATCHES=(
	"${DISTDIR}"/${P}-origin.patch.bz2
	"${FILESDIR}"/${P}-origin-2.patch
	"${FILESDIR}"/${P}-qt48.patch
	"${FILESDIR}"/${PN}-0.9.8.8-system-gl2ps.patch
	"${FILESDIR}"/${PN}-0.9.7.10-dont-install-qwt.patch
	"${FILESDIR}"/${PN}-0.9.8.6-gold.patch
	"${FILESDIR}"/${PN}-0.9.8.7-kde.patch
	"${FILESDIR}"/${P}-set_col_values.patch
	"${FILESDIR}"/${P}-adopt_to_alglib3.patch
	"${FILESDIR}"/${P}-crasher_without_internet.patch
	"${FILESDIR}"/${P}-private.patch
	"${FILESDIR}"/${P}-sip-4.15.patch
	"${FILESDIR}"/${P}-PyQt4-4.10.patch
	)

RESTRICT="!bindist? ( bindist )"

pkg_setup() {
	use python && python-single-r1_pkg_setup
}

src_prepare() {
	local mylibs

	qt4-r2_src_prepare

	rm -rf 3rdparty/{liborigin,QTeXEngine,/qwtplot3d/3rdparty/gl2ps/,boost,alglib} || die
	sed \
		-e "s:dll:static:g" \
		-e "/INSTALLS/d" \
		-i 3rdparty/qwtplot3d/*.pro

	mylibs="${mylibs} -lquazip"
	use mono && mylibs="${mylibs} $($(tc-getPKG_CONFIG) --libs libgdiplus)"

	# Check build.conf for changes on bump.
	cat > build.conf <<-EOF
	# Automatically generated by Gentoo ebuild
	isEmpty( QTI_ROOT ) {
	  message( "each file including this config needs to set QTI_ROOT to the dir containing this file!" )
	}

	MUPARSER_LIBS = $($(tc-getPKG_CONFIG) --libs muparser)
	GSL_LIBS = $($(tc-getPKG_CONFIG) --libs gsl)
	QWT_INCLUDEPATH = \$\$QTI_ROOT/3rdparty/qwt/src
	QWT_LIBS = \$\$QTI_ROOT/3rdparty/qwt/lib/libqwt.a
	QWT3D_INCLUDEPATH = \$\$QTI_ROOT/3rdparty/qwtplot3d/include
	QWT3D_LIBS = \$\$QTI_ROOT/3rdparty/qwtplot3d/lib/libqwtplot3d.a
	EMF_INCLUDEPATH = "${EPREFIX}/usr/include/libEMF
	SYS_LIBS = -lgl2ps ${mylibs} -lGLU

	LUPDATE = lupdate
	LRELEASE = lrelease

	SCRIPTING_LANGS += muParser

	CONFIG          += release
	CONFIG          += CustomInstall
	DEFINES         += SCRIPTING_CONSOLE

	LIBPNG_LIBS = $($(tc-getPKG_CONFIG) --libs libpng)
	TAMUANOVA_LIBS = -ltamuanova
	TAMUANOVA_INCLUDEPATH = "${EPREFIX}/usr/include/tamu_anova"
	ALGLIB_LIBS = -lalglib

	EOF

	use bindist && echo "DEFINES         += QTIPLOT_SUPPORT" >> build.conf
	use bindist || echo "DEFINES         += QTIPLOT_PRO" >> build.conf
	use python && echo "SCRIPTING_LANGS += Python" >> build.conf
	use python && echo "PYTHON = ${EPYTHON}" >> build.conf
	use latex && echo "TEX_ENGINE_LIBS = -lQTeXEngine" >> build.conf

	sed \
		-e "s:doc/${PN}/manual:doc/${PN}/html:" \
		-e '/INSTALLS.*documentation/d' \
		-e '/INSTALLS.*manual/d' \
		-e "/INSTALLBASE/s: /usr: ${EPREFIX}/usr:g" \
		-e 's:/usr/local/qtiplot:$$INSTALLBASE:g' \
		-i qtiplot/qtiplot.pro || die

	if use python; then
		sed \
			-e "s:/usr/local/${PN}:${EPREFIX}$(python_get_sitedir)/qtiplot:" \
			-i qtiplot/qtiplot.pro || die
	fi

	sed \
		-e "/^target.path/s:/usr:${EPREFIX}/usr:g" \
		-i fitPlugins/*/*.pro || die

	sed -e '/manual/d' -i qtiplot.pro || die

	sed -e "s:QTIPLOT_PRO:QTIPLOT_PROFESSIONAL:g" -i qtiplot/src/core/main.cpp || die

	# Drop langs only if LINGUAS is not empty
	if [[ -n ${LINGUAS} ]]; then
		for l in ${LANGS}; do
			lu=${l/cz/cs}
			lu=${lu/cn/zh_CN}
			use linguas_${lu} || \
				sed -e "s:translations/qtiplot_${l}.[tq][sm]::" \
						-i qtiplot/qtiplot.pro || die
		done
	fi

	sed \
		-e "s:d_python_config_folder + \":\"${EPREFIX}/usr/share/qtiplot:g" \
		-i qtiplot/src/core/ApplicationWindow.cpp || die

	chmod -x qtiplot/qti_wordlist.txt

	# sed out debian paths
	sed -e 's:\(/usr/share/sgml/\)docbook/stylesheet/dsssl/modular\(/html/docbook.dsl\):\1stylesheets/dsssl/docbook\2:' \
		-i manual/qtiplot.dsl || die
	sed -e 's:\(/usr/share/\)xml/docbook/stylesheet/nwalsh\(/html/chunk.xsl\):\1sgml/docbook/xsl-stylesheets\2:' \
		-i manual/qtiplot_html.xsl || die

	sed \
		-e '1i#define OF(x) x' \
		-i 3rdparty/zlib/minigzip.c || die
}

src_configure() {
	use amd64 && export QMAKESPEC="linux-g++-64"
	eqmake4
}

src_compile() {
	emake
	lrelease qtiplot/qtiplot.pro || die
	if use doc; then
		cd manual
		emake web
	fi
}

src_install() {
	qt4-r2_src_install

	insinto /usr/share/qtiplot
	doins qtiplot/qti_wordlist.txt

	newicon qtiplot_logo.png qtiplot.png
	make_desktop_entry qtiplot "QtiPlot Scientific Plotting" qtiplot

	use doc && dohtml -r manual/html/*

	use python && python_optimize

	if [[ -n ${LINGUAS} ]]; then
		insinto /usr/share/${PN}/translations
		for l in ${LANGS}; do
			lu=${l/cz/cs}
			lu=${lu/cn/zh_CN}
			use linguas_${lu} && \
				doins qtiplot/translations/qtiplot_${l}.qm
		done
	fi
}

pkg_postinst() {
	if use python; then
		optfeature "Enhanced python support" \
			dev-python/pygsl dev-python/rpy sci-libs/scipy dev-python/sympy
	fi

	fdo-mime_desktop_database_update
}

pkg_postrm() {
	fdo-mime_desktop_database_update
}
