# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=0

inherit toolchain-funcs pam flag-o-matic eutils

DESCRIPTION="Linux-PAM module that allows a user to be chrooted in auth, account, or session"
HOMEPAGE="https://sourceforge.net/projects/pam-chroot/"
SRC_URI="mirror://sourceforge/pam-chroot/${P}.tar.bz2"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~alpha ~amd64 ~hppa ~ia64 ~ppc ~ppc64 ~sparc ~x86"
IUSE=""

DEPEND="sys-libs/pam"
RDEPEND="${DEPEND}"

doecho() {
	echo "$@"
	"$@" || die
}

src_compile() {
	# using the Makefile would require patching it to work properly, so
	# rather simply re-create it here.
	doecho $(tc-getCC) ${LDFLAGS} -shared -fPIC ${CFLAGS} ${PN}.c -o ${PN}.so -lpam
}

src_install() {
	dopammod pam_chroot.so
	dopamsecurity  . chroot.conf

	dodoc CREDITS README.history TROUBLESHOOTING options || die "dodoc failed"
}
