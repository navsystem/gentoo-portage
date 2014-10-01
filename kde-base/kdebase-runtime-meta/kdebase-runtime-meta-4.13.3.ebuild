# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/kde-base/kdebase-runtime-meta/kdebase-runtime-meta-4.13.3.ebuild,v 1.1 2014/07/16 17:41:00 johu Exp $

EAPI=5
inherit kde4-meta-pkg

DESCRIPTION="Merge this to pull in all kdebase-runtime-derived packages"
KEYWORDS=" ~amd64 ~arm ~ppc ~ppc64 ~x86 ~amd64-linux ~x86-linux"
IUSE="+crash-reporter +handbook nepomuk"

RDEPEND="
	$(add_kdebase_dep attica)
	$(add_kdebase_dep kcmshell)
	$(add_kdebase_dep kcontrol)
	$(add_kdebase_dep kdebase-data)
	$(add_kdebase_dep kdebase-desktoptheme)
	$(add_kdebase_dep kdebase-kioslaves)
	$(add_kdebase_dep kdebase-menu)
	$(add_kdebase_dep kdebase-menu-icons)
	$(add_kdebase_dep kdebugdialog)
	$(add_kdebase_dep kdesu)
	$(add_kdebase_dep kdontchangethehostname)
	$(add_kdebase_dep keditfiletype)
	$(add_kdebase_dep kfile)
	$(add_kdebase_d# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/kde-base/kdebase-runtime-meta/kdebase-runtime-meta-4.13.3.ebuild,v 1.1 2014/07/16 17:41:00 johu Exp $

EAPI=5
inherit kde4-meta-pkg

DESCRIPTION="Merge this to pull in all kdebase-runtime-derived packages"
KEYWORDS=" ~amd64 ~arm ~ppc ~ppc64 ~x86 ~amd64-linux ~x86-linux"
IUSE="+crash-reporter +handbook nepomuk"

RDEPEND="
	$(add_kdebase_dep attica)
	$(add_kdebase_dep kcmshell)
	$(add_kdebase_dep kcontrol)
	$(add_kdebase_dep kdebase-data)
	$(add_kdebase_dep kdebase-desktoptheme)
	$(add_kdebase_dep kdebase-kioslaves)
	$(add_kdebase_dep kdebase-menu)
	$(add_kdebase_dep kdebase-menu-icons)
	$