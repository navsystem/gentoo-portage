# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-db/postgresql-docs/postgresql-docs-9.2.9.ebuild,v 1.10 2014/09/19 10:40:02 ago Exp $

EAPI="4"

inherit versionator

KEYWORDS="alpha amd64 arm hppa ia64 ~mips ppc ppc64 ~s390 ~sh sparc x86 ~amd64-fbsd ~sparc-fbsd ~x86-fbsd ~ppc-macos ~x86-solaris"

RESTRICT="test"

DESCRIPTION="PostgreSQL documentation"
HOMEPAGE="http://www.postgresql.org/"
LICENSE="POSTGRESQL"

SLOT="$(get_version_component_range 1-2)"

# Comment the following four lines when not a beta or rc.
#MY_PV="${PV//_}"
#MY_FILE_PV="${SLOT}$(get_version_component_range 4)"
#S="${WORKDIR}/postgresql-${MY_FILE_PV}"
#SRC_URI="mirror://postgresql/source/v${MY_FILE_PV}/postgresql-${MY_FILE_PV}.tar.bz# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-db/postgresql-docs/postgresql-docs-9.2.9.ebuild,v 1.10 2014/09/19 10:40:02 ago Exp $

EAPI="4"

inherit versionator

KEYWORDS="alpha amd64 arm hppa ia64 ~mips ppc ppc64 ~s390 ~sh sparc x86 ~amd64-fbsd ~sparc-fbsd ~x86-fbsd ~ppc-macos ~x86-solaris"

RESTRICT="test"

DESCRIPTION="PostgreSQL documentation"
HOMEPAGE="http://www.postgresql.org/"
LICENSE="POSTGRESQL"

SLOT="$(get_version_component_range 1-2)"

# Comment the following four lines when not a beta or rc.
#MY_PV="${PV//_}"
#MY_FILE_PV="${SLOT}$(get_version_component_range 4)"
#S="${WORKDIR}/postgresql-${MY_FILE_PV}"
#SRC_URI="mirror://postgresql/source/v${MY_FILE_PV}/postgresql-${MY_FILE_PV}.tar.bz2"