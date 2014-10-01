# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/net-mail/ezmlm-idx/ezmlm-idx-0.40-r2.ebuild,v 1.22 2014/08/10 20:44:47 slyfox Exp $

# NOTE: ezmlm-idx, ezmlm-idx-mysql and ezmlm-idx-pgsql all supported by this single ebuild
# (Please keep them in sync)

inherit eutils fixheadtails

PB=ezmlm-idx
EZMLM_P=ezmlm-0.53

S2=${WORKDIR}/${PB}-${PV}
S=${WORKDIR}/${EZMLM_P}
DESCRIPTION="Simple yet powerful mailing list manager for qmail"
SRC_URI="
	http://gd.tuwien.ac.at/infosys/mail/qmail/ezmlm-patches/${PB}-${PV}.tar.gz
	http://cr.yp.to/software/${EZMLM_P}.tar.gz
"
HOMEPAGE="http://www.ezmlm.org"
SLOT="0"
LICENSE="GPL-2"
KEYWORDS="alpha amd64 hppa ~mips ppc sparc x86"
IUSE=""
DEPEND="sys-apps/grep sys-apps/groff"
RDEPEND="virtual/qmail"

if [ "$PN" = "${PB}-pgsql" ]
then
	DEPEND="$DEPEND dev-db/postgresql-se# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/net-mail/ezmlm-idx/ezmlm-idx-0.40-r2.ebuild,v 1.22 2014/08/10 20:44:47 slyfox Exp $

# NOTE: ezmlm-idx, ezmlm-idx-mysql and ezmlm-idx-pgsql all supported by this single ebuild
# (Please keep them in sync)

inherit eutils fixheadtails

PB=ezmlm-idx
EZMLM_P=ezmlm-0.53

S2=${WORKDIR}/${PB}-${PV}
S=${WORKDIR}/${EZMLM_P}
DESCRIPTION="Simple yet powerful mailing list manager for qmail"
SRC_URI="
	http://gd.tuwien.ac.at/infosys/mail/qmail/ezmlm-patches/${PB}-${PV}.tar.gz
	http://cr.yp.to/software/${EZMLM_P}.tar.gz
"
HOMEPAGE="http://www.ezmlm.org"
SLOT="0"
LICENSE="GPL-2"
KEYWORDS="alpha amd64 hppa ~mips ppc sparc x86"
IUSE=""
DEPEND="sys-apps/grep sys-apps/groff"
RDEPEND="virtual/qmail"

if [ "$PN" = "${PB}-pgsql" ]
then
	DEPEND="$DEPEND dev-db/postgresql-server"
	RDEPEND="$RDEPEND dev-db/postgresql-server"
elif [ "$PN" = "${PB}-mysql" ]
then
	DEPEND="$DEPEND virtual/mysql"
	RDEPEND="$RDEPEND virtual/mysql"
fi

src_unpack() {
	unpack ${A}
	cd ${S2}
	mv ${S2}/* ${S} || die

	cd ${S}
	patch < idx.patch || die
	#remove cat-man pages
	cp MAN MAN.orig
	cat MAN.orig | grep -v cat > MAN
	echo "/usr/bin" > conf-bin
	echo "/usr/share/man" > conf-man
	echo "gcc ${CFLAGS}" > conf-cc
	echo "gcc" > conf-ld
	#tweak the install to go to ${D}
	cp Makefile Makefile.orig
	sed -e "s:/install.*conf-bin\`\":/install ${D}usr/bin:" \
	-e "s:/install.*conf-man\`\":/install ${D}usr/share/man:" Makefile.orig > Makefile
	#apply patch from