# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-libs/opencryptoki/opencryptoki-2.3.3-r5.ebuild,v 1.4 2012/06/06 03:43:03 zmedico Exp $

EAPI="2"

# backports are maintained as tags on Diego's repository on gitorious:
# http://gitorious.org/~flameeyes/opencryptoki/flameeyess-opencryptoki
BACKPORTS=3

inherit autotools eutils multilib flag-o-matic user

DESCRIPTION="PKCS#11 provider cryptographic hardware"
HOMEPAGE="http://sourceforge.net/projects/opencryptoki"
SRC_URI="mirror://sourceforge/opencryptoki/${P}.tar.bz2
	${BACKPORTS:+
		http://dev.gentoo.org/~flameeyes/${PN}/${P}-backports-${BACKPORTS}.tar.bz2}"

# Upstream is looking into relicensing it into CPL-1.0 entirely; the CCA
# token sources are under CPL-1.0 already.
LICENSE="CPL-0.5"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"

RDEPEND="tpm? ( app-crypt/trousers )
		 dev-libs/openssl"
DEPEND="${RDEPEND}"

IUSE="+tpm debug"

# tests right now basically don't exist; the only available thing would
# test against an installed copy and would kill a running pcscd, all
# things that we're not interested to.
RESTRICT=test

pkg_setup() {
	enewgroup pkcs11
}

src_prepare() {
	[[ -n ${BACKPORTS} ]] && \
		EPATCH_MULTI_MSG="Applying backports patches #${BACKPORTS} ..." \
		EPATCH_FORCE=yes EPATCH_SUFFIX="patch" EPATCH_SOURCE="${S}/patches" \
			epatch

	eautoreconf
}

src_configure() {
	# package uses ${localstatedir}/lib as the default path, so if we
	# leave it to econf, it'll create /var/lib/lib.

	# Since upstream by default seem to enable any possible token, even
	# when they don't seem to be used, we limit ourselves to the
	# software emulation token (swtok) and if the user enabled the tpm
	# USE flag, tpmtok.  The rest of the tokens seem to be hardware- or
	# software-dependent even when they build fine without their
	# requirements, but until somebody asks for those, I'd rather not
	# enable them.

	# We don't use --enable-debug because that tinkers with the CFLAGS
	# and we don't want that. Instead we append -DDEBUG which enables
	# debug information.
	use debug && append-flags -DDEBUG

	econf \
		--localstatedir=/var \
		--enable-fast-install \
		--disable-dependency# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-libs/opencryptoki/opencryptoki-2.3.3-r5.ebuild,v 1.4 2012/06/06 03:43:03 zmedico Exp $

EAPI="2"

# backports are maintained as tags on Diego's repository on gitorious:
# http://gitorious.org/~flameeyes/opencryptoki/flameeyess-opencryptoki
BACKPORTS=3

inherit autotools eutils multilib flag-o-matic user

DESCRIPTION="PKCS#11 provider cryptographic hardware"
HOMEPAGE="http://sourceforge.net/projects/opencryptoki"
SRC_URI="mirror://sourceforge/opencryptoki/${P}.tar.bz2
	${BACKPORTS:+
		http://dev.gentoo.org/~flameeyes/${PN}/${P}-backports-${BACKPORTS}.tar.bz2}"

# Upstream is looking into relicensing it into CPL-1.0 entirely; the CCA
# token sources are under CPL-1.0 already.
LICENSE="CPL-0.5"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"

RDEPEND="tpm? ( app-crypt/trousers )
		 dev-libs/openssl"
DEPEND="${RDEPEND}"

IUSE="+tpm debug"

# tests right now basically don't exist; the only available thing would
# test against an installed copy and would kill a running pcscd, all
# things that we're not interested to.
RESTRICT=test

pkg_setup() {
	enewgroup pkcs11
}

src_prepare() {
	[[ -n ${BACKPORTS} ]] && \
		EPATCH_MULTI_MSG="Applying backports patches #${BACKPORTS} ..." \
		EPATCH_FORCE=yes EPATCH_SUFFIX="patch" EPATCH_SOURCE