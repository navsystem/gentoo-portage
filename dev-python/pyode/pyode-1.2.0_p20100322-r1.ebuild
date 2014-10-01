# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-python/pyode/pyode-1.2.0_p20100322-r1.ebuild,v 1.3 2014/03/31 21:20:46 mgorny Exp $

EAPI="5"
PYTHON_COMPAT=( python{2_6,2_7} pypy pypy2_0 )

inherit distutils-r1

MY_P="${P/pyode/PyODE}"
SNAPSHOT_DATE="2010-03-22"	# This is a snapshot

DESCRIPTION="Python bindings to the ODE physics engine"
HOMEPAGE="http://pyode.sourceforge.net/"
SRC_URI="mirror://sourceforge/${PN}/PyODE-snapshot-${SNAPSHOT_DATE}.tar.bz2"

LICENSE="L# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-python/pyode/pyode-1.2.0_p20100322-r1.ebuild,v 1.3 2014/03/31 21:20:46 mgorny Exp $

EAPI="5"
PYTHON_COMPAT=( python{2_6,2_7} pypy pypy2_0 )

inherit distutils-r1

MY_P="${P/pyode/PyODE}"
SNAPSHOT_DATE="2010-03-22"	# This is a snapshot

DESCRIPTION="Python bindings to the ODE physics engine"
HOMEPAGE="http://pyode.sourceforge.net/"
SRC_URI="mirror://sourceforge/${PN}/PyODE-snapshot-${SNAPSHOT_DATE}.tar.bz2"

LICENSE="LGPL-2.1"
SLOT="0"
KEYWORDS="~amd64 ~ppc ~x86 ~x86-fbsd"
IUSE="examples"

RDEPEND=">=dev-games/ode-0.7
	>=dev-pyt