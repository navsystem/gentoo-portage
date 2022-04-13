# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
PHP_EXT_NAME="${PN}"
PHP_EXT_INI="yes"
PHP_EXT_ZENDEXT="no"
PHP_EXT_ECONF_ARGS=( --enable-${PN} )
PHP_EXT_S="${S}/src"

USE_PHP="php7-4 php8-0"

inherit php-ext-source-r3

KEYWORDS="~amd64"

DESCRIPTION="A PHP module to drastically raise the cost of attacks against websites"
HOMEPAGE="https://snuffleupagus.readthedocs.io/index.html"
SRC_URI="https://github.com/jvoisin/${PN}/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="LGPL-3 PHP-3.01"
SLOT="0"

src_prepare() {
	# fix file locations tests look for
	ln -s "${P}/config" "${WORKDIR}/config" || die
	# Fix path dependent tests
	sed -i -e 's~src/tests/~~' \
		src/tests/session_encryption/crypt_session_read_uncrypt.phpt || die
	sed -i -e 's~%a/src~%a~' \
		src/tests/disable_function/disabled_functions_runtime.phpt || die
	php-ext-source-r3_src_prepare
}

src_install() {
	einstalldocs
	local slot x cfgdir
	php-ext-source-r3_src_install
	# Add the rules file which vary by install version
	for slot in $(php_get_slots); do
		php_init_slot_env "${slot}"
		for x in ${PHP_EXT_SAPIS} ; do
			cfgdir="/etc/php/${x}-${slot}"
			php-ext-source-r3_addtoinifile "${cfgdir}/ext/${PHP_INI_NAME}.ini" \
				 "sp.configuration_file" "${cfgdir}/${PN}.rules"
			insinto "${cfgdir}"
			case ${PHP_CURRENTSLOT:0:1} in
				8) newins "${S}/config/default_php8.rules" "${PN}.rules" ;;
				*) newins "${S}/config/default.rules" "${PN}.rules" ;;
			esac
		done
	done
}

pkg_postinst() {
	elog "This extension is configured with recommended rules enabled by default."
	elog "Feel free to customize as necessary.  Please test outside of production first."
	elog "Failure to test may cause unexpected results to loosely coded sites."
}
