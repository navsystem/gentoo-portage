# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

inherit cmake-utils git-r3

EGIT_REPO_URI="git://github.com/openstreetmap/osm2pgsql.git"

DESCRIPTION="Converts OSM data to SQL and insert into PostgreSQL db"
HOMEPAGE="http://wiki.openstreetmap.org/wiki/Osm2pgsql"
SRC_URI=""

LICENSE="GPL-2"
SLOT="0"
KEYWORDS=""
IUSE="+lua +pbf"

DEPEND="
	app-arch/bzip2
	dev-libs/libxml2:2
	sci-libs/geos
	sci-libs/proj
	sys-libs/zlib
	dev-db/postgresql:=
	lua? ( dev-lang/lua:= )
	pbf? ( dev-libs/protobuf-c )
"
RDEPEND="${DEPEND}"

DOCS=( README 900913.sql )
