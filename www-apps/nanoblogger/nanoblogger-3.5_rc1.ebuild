# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/www-apps/nanoblogger/nanoblogger-3.5_rc1.ebuild,v 1.1 2011/10/02 05:06:15 radhermit Exp $

EAPI=4

inherit bash-completion-r1

MY_P="${P/_/-}"
DESCRIPTION="Small and simple weblog engine written in Bash for the command-line"
HOMEPAGE="http://nanoblogger.sourceforge.net/"
SRC_URI="mirror://sourceforge/${PN}/${MY_P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~alpha ~amd64 ~hppa ~ia64 ~mips ~ppc ~x86"
IUSE=""

RDEPEND="app-shells/bash"

S="${WORKDIR}/${MY_P}"

src_prepare() {
	sed -i \
		-e 's|^\(NB_BASE_DIR=\).*$|\1"/usr/share/nanoblogger"|' \
		-e 's|^\(NB_CFG_DIR=\).*$|\1"/etc"|' \
		-e "s|\$NB_BASE_DIR.*\(nano.*html\)|/usr/share/doc/${PF}/html/\1|" \
			nb || die "sed nb failed"
}

src_install() {
	dobin nb
	insinto /usr/share/nanoblogger
	doins -r default moods plugins lib lang docs welcome-to-nb.txt
	insinto /etc
	doins nb.conf
	dodoc ChangeLog
	dohtml docs/nanoblogger.html
	dobashcomp "${FILESDIR}"/nb.bashcomp
}# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/www-apps/nanoblogger/nanoblogger-3.5_rc1.ebuild,v 1.1 2011/10/02 05:06:15 radhermit Exp $

EAPI=4

inherit bash-completion-r1

MY_P="${P/_/-}"
DESCRIPTION="Small and simple weblog engine written in Bash for the command-line"
HOMEPAGE="http://nanoblogger.sourceforge.net/"
SRC_URI="mirror://sourceforge/${PN}/${MY_P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~alpha ~amd64 ~hppa ~ia64 ~mips ~ppc ~x86"
IUSE=""

RDEPEND="app-shells/bash"

S="${WORKDIR}/${MY_P}"

src_prepare() {
	sed -i \
		-e 's|^\(NB_BASE_DIR=\).*$|\1"/usr/share/nanoblogger"|' \
		-e 's|^\(NB_CFG_DIR=\).*$|\1"/etc"|' \
		-e "s|\$NB_BASE_DIR.*\(nano.*html\)|/usr/share/doc/${PF}/html/\1|" \
			nb || die "sed nb failed"
}

src_install() {
	dobin nb
	insinto /usr/share/nanoblogger
	doins -r default moods plugins lib lang docs welcome-to-nb.txt
	insinto /etc
	doins nb.conf
	dodoc ChangeLog
	dohtml docs/nanoblogger.html
	dobashcomp "${FILESDIR}"/nb.bashcomp
}

pkg_postinst() {
	elog
	elog "Documentation for getting started with nanoblogger may be found at"
	elog "/usr/share/doc/${PF}/html/nanoblogger.html or by running 'nb --manual;."
	elog
	elog "To cr