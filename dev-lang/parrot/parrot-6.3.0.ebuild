# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-lang/parrot/parrot-6.3.0.ebuild,v 1.1 2014/04/18 02:52:04 patrick Exp $

EAPI=5

inherit eutils multilib

# weird failures
RESTRICT="test"

DESCRIPTION="Virtual machine designed to efficiently compile and execute bytecode for dynamic languages"
HOMEPAGE="http://www.parrot.org/"
SRC_URI="ftp://ftp.parrot.org/pub/parrot/releases/all/${PV}/${P}.tar.gz"

LICENSE="Artistic-2"
SLOT="0/6.1.0"
KEYWORDS="~amd64 ~ppc ~ppc64 ~sparc ~x86 ~amd64-linux ~x86-linux ~ppc-macos ~x64-macos ~x86-macos"
IUSE="opengl nls doc examples gdbm gmp ssl +unicode pcre"

RDEPEND="sys-libs/readline
	opengl? ( media-libs/freeglut )
	nls? ( sys-devel/gettext )
	unicode? ( >=dev-libs/icu-2.6:= )
	gdbm? ( >=sys-libs/gdbm-1.8.3-r1 )
	gmp? ( >=dev-libs/gmp-4.1.4 )
	ssl? ( dev-libs/openssl )
	pcre? ( dev-libs/libpcre )
	doc? ( dev-perl/JSON )"

DEPEND="dev-lang/perl[doc?]
	${RDEPEND}"

src_configure() {
	myconf="--disable-rpath"
	use unicode || myconf+=" --without-icu"
	use ssl     || myconf+=" --without-crypto"
	use gdbm    || myconf+=" --without-gdbm"
	use nls     || myconf+=" --without-gettext"
	use gmp     || myconf+=" --without-gmp"
	# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-lang/parrot/parrot-6.3.0.ebuild,v 1.1 2014/04/18 02:52:04 patrick Exp $

EAPI=5

inherit eutils multilib

# weird failures
RESTRICT="test"

DESCRIPTION="Virtual machine designed to efficiently compile and execute bytecode for dynamic languages"
HOMEPAGE="http://www.parrot.org/"
SRC_URI="ftp://ftp.parrot.org/pub/parrot/releases/all/${PV}/${P}.tar.gz"

LICENSE="Artistic-2"
SLOT="0/6.1.0"
KEYWORDS="~amd64 ~ppc ~ppc64 ~sparc ~x86 ~amd64-linux ~x86-linux ~ppc-macos ~x64-macos ~x86-macos"
IUSE="opengl nls doc examples gdbm gmp ssl +unicode pcre"

RDEPEND="sys-libs/readline
	opengl? ( media-libs/freeglut )
	nls? ( sys-devel/gettext )
	unicode? ( >=dev-libs/icu-2.6:= )
	gdbm? ( >=sys-libs/gdbm-1.8.3-r1 )
	gmp? ( >=dev-libs/gmp-4.1.4 )
	ssl? ( dev-libs/openssl )
	pcre? ( dev-libs/libpcre )
	doc? ( dev-perl/JSON )"

DEPEND="dev-lang/perl[doc?]
	${RDEPEND}"

src_configure() {
	myconf="--disable-rpath"
	use unicode || myconf+=" --without-icu"
	use ssl     || myconf+=" --without-crypto"
