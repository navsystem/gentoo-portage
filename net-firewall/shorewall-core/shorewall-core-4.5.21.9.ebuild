# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/net-firewall/shorewall-core/shorewall-core-4.5.21.9.ebuild,v 1.8 2014/09/19 09:17:43 ago Exp $

EAPI="5"

inherit eutils prefix versionator

MY_URL_PREFIX=
case ${P} in
	*_beta* | \
	*_rc*)
		MY_URL_PREFIX='development/'
		;;
esac

MY_PV=${PV/_rc/-RC}
MY_PV=${MY_PV/_beta/-Beta}
MY_P=${PN}-${MY_PV}

MY_MAJOR_RELEASE_NUMBER=$(get_version_component_range 1-2)
MY_MAJORMINOR_RELEASE_NUMBER=$(get_version_component_range 1-3)

DESCRIPTION="Core libraries of shorewall / shorewall(6)-lite"
HOMEPAGE="http://www.shorewall.net/"
SRC_URI="http://www1.shorewall.net/pub/shorewall/${MY_URL_PREFIX}${MY_MAJOR_RELEASE_NUMBER}/shorewall-${MY_MAJORMINOR_RELEASE_NUMBER}/${MY_P}.tar.bz2"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="alpha amd64 hppa ppc ppc64 sparc x86"
IUSE="selinux"

DEPEND="
	>=dev-lang/perl-5.10# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/net-firewall/shorewall-core/shorewall-core-4.5.21.9.ebuild,v 1.8 2014/09/19 09:17:43 ago Exp $

EAPI="5"

inherit eutils prefix versionator

MY_URL_PREFIX=
case ${P} in
	*_beta* | \
	*_rc*)
		MY_URL_PREFIX='development/'
		;;
esac

MY_PV=${PV/_rc/-RC}
MY_PV=${MY_PV/_beta/-Beta}
MY_P=${PN}-${MY_PV}

MY_MAJOR_RELEASE_NUMBER=$(get_version_component_range 1-2)
MY_MAJORMINOR_RELEASE_NUMBER=$(get_version_component_range 1-3)

DESCRIPTION="Core libraries of shorewall / shorewall(6)-lite"
HOMEPAGE="http://www.shorewall.net/"
SRC_URI="http://www1.shorewall.net/pub/shorewall/${MY_URL_PREFIX}${MY_MAJOR_RELEASE_NUMBER}/shorewall-${MY_MAJORMINOR_RELEASE_NUMBER}/${MY_P}.tar.bz2"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="alpha amd64 hppa ppc ppc64 sparc x86"
IUSE="selinux"

DEPEND="