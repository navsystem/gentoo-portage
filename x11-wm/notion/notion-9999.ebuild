# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/x11-wm/notion/notion-9999.ebuild,v 1.8 2014/05/25 13:01:33 jer Exp $

EAPI=5

EGIT_REPO_URI="git://notion.git.sourceforge.net/gitroot/notion/notion"
EGIT_HAS_SUBMODULES="1"

inherit eutils git-2 multilib toolchain-funcs

DESCRIPTION="Notion is a tiling, tabbed window manager for the X window system"
HOMEPAGE="http://notion.sourceforge.net"

LICENSE="LGPL-2.1"
SLOT="0"
KEYWORDS=""
IUSE="nls xinerama +xrandr"

RDEPEND="dev-lang/lua
	x11-libs/libSM
	x11-libs/libX11
	x11-libs/libXext
	nls? ( sys-devel/gettext )
	xinerama? ( x11-libs/lib# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/x11-wm/notion/notion-9999.ebuild,v 1.8 2014/05/25 13:01:33 jer Exp $

EAPI=5

EGIT_REPO_URI="git://notion.git.sourceforge.net/gitroot/notion/notion"
EGIT_HAS_SUBMODULES="1"

inherit eutils git-2 multilib toolchain-funcs

DESCRIPTION="Notion is a tiling, tabbed window manager for the X window system"
HOMEPAGE="http://notion.sourceforge.net"

LICENSE="LGPL-2.1"
SLOT="0"
KEYWORDS=""
IUSE="nls xinerama +xrandr"

RDEPEND="dev-lang/lua
	x11-libs/libSM
	x11-libs/libX11
	x11-libs/libXext
	nls? ( sys-devel/gettext )
	xinerama? ( x11-libs/libXinerama )
	xrandr? ( x11-libs/libXrandr )"

DEPEND="${RDEPEND}
		virtual/pkgconfig"

src_prepare() {
	sed -e "/^CFLAGS=/s:=:+=:" \
		-e "/^CFLAGS/{s:-Os:: ; s:-g::}" \
		-e "/^LDFLAGS=/{s:=:+=: ; s:-Wl,--as-needed::}" \
		-e "/^CC=/s:=:?=:" \
		-e "/^PREFIX/s:=.*$:= \${ROOT}usr:" \
		-e "/^ETCDIR/s:=.*$:= \${ROOT}etc/notion:" \
		-e "/^LIBDIR/s:=.*:= \$(PREFIX)/$(get_libdir):" \
		-e "/^DOCDIR/s:=.*:= \$(PREFIX)/share/doc/${PF}:" \
		-e "/^LUA_DIR/s:=.*$:= \$(PREFIX)/usr:" \
		-e "/^VARDIR/s:=.*$:= \${ROOT}var/cache/${PN}:" \
		-e "s:^\(X11_PREFIX=\).*:\1\$(PREFIX)/usr:" \
		-i system-autodetect.mk || die
	sed -e 's/gcc/$(CC)/g' \
		-i ioncore/Makefile || die
	expor