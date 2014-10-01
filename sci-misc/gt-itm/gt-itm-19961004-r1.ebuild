# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/sci-misc/gt-itm/gt-itm-19961004-r1.ebuild,v 1.2 2014/04/16 22:19:34 ulm Exp $

inherit eutils toolchain-funcs

DESCRIPTION="Routines to generate and analyze graphs using different models for internetwork topology"
HOMEPAGE="http://www.cc.gatech.edu/fac/Ellen.Zegura/graphs.html
		  http://www.isi.edu/nsnam/ns/ns-topogen.html#gt-itm"
SRC_URI="http://www.cc.gatech.edu/fac/Ellen.Zegura/gt-itm/gt-itm.tar.gz
		 http://www.isi.edu/nsnam/dist/sgb2ns.tar.gz"

LICENSE="all-rights-reserved sgb2ns"
SLOT="0"
KEYWORDS="~x8# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/sci-misc/gt-itm/gt-itm-19961004-r1.ebuild,v 1.2 2014/04/16 22:19:34 ulm Exp $

inherit eutils toolchain-funcs

DESCRIPTION="Routines to generate and analyze graphs using different models for internetwork topology"
HOMEPAGE="http://www.cc.gatech.edu/fac/Ellen.Zegura/graphs.html
		  http://www.isi.edu/nsnam/ns/ns-topogen.html#gt-itm"
SRC_URI="http://www.cc.gatech.edu/fac/Ellen.Zegura/gt-itm/gt-itm.tar.gz
		 http://www.isi.edu/nsnam/dist/sgb2ns.tar.gz"

LICENSE="all-rights-reserved sgb2ns"
SLOT="0"
KEYWORDS="~x86 ~amd64"
RESTRICT="mirror bindist"

DEPEND="dev-util/sgb"
RDEPEND="${DEPEND}"

S="${WORKDIR}/${PN}"
S2="${WORKDIR}/sgb2ns"

src_unpack() {
	unpack sgb2ns.tar.gz

	mkdir "${S}"
	cd "${S}"
	unpack gt-itm.tar.gz

	sed -r -e '/^[[:alnum:]]+\.o:/d' \
		-e 's|LIBS = -lm -lgb.*|LIBS = -lm -lgb|' \
		-e 's/\$\(CC\)/& \$\(LDFLAGS\)/g' \
		-i "${S}"/src/Makefile || die
	sed -r -e '/^SYS = -DSYSV/d' \
		-e 's|LIBS = -lm -lgb.*|LIBS = -lm -lgb|' \
		-e 's/\$\(CC\)/& \$\(LDFLAGS\)/g' \
		-i ${S2}/Makefile  || die

	rm -f "${S}"/lib/*

	find "${S}"/sample-graphs/ -perm +111 -type f -name 'Run*' \
	| xargs -r -n1 sed -re 's|(\.\./)+bin/||g' -i || die

	sed -e 's|sys/types.h|sys/param.h|' -i "${S}"/src/geog.c || die
	sed -e '162 s/connected $/connected \\/' -i "${S}"/src/eval.c || die

	# fix implicit function declarations
	sed -e '/stdio.h/