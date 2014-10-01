# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/net-misc/mediatomb/mediatomb-0.12.2_pre20140810.ebuild,v 1.2 2014/09/30 17:19:14 thev00d00 Exp $

EAPI=5
inherit autotools eutils linux-info user vcs-snapshot

DESCRIPTION="MediaTomb is an open source UPnP MediaServer"
HOMEPAGE="http://www.mediatomb.cc/"
SRC_URI="https://github.com/v00d00/${PN}/archive/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~arm ~ppc ~x86"

IUSE="curl debug +exif +ffmpeg flac id3tag +inotify +javascript lastfm
		+magic +mp4 mysql +sqlite +taglib thumbnail +zlib"
REQUIRED_USE="
	|| ( mysql sqlite )
	taglib? ( !id3tag )
	id3tag? ( !taglib )
	thumbnail? ( ffmpeg )
"

DEPEND="mysql? ( virtual/mysql )
	dev-libs/expat
	id3tag? ( media-libs/id3lib )
	javascript? ( >=dev-lang/spidermonkey-1.8.5:0 )
	taglib? ( media-libs/taglib )
	sqlite? ( >=dev-db/sqlite-3 )
	lastfm? ( >=media-libs/lastfmlib-0.4 )
	exif? ( media-libs/libexif )
	mp4? ( >=media-libs/libmp4v2-1.9.1_p479:0 )
	ffmpeg? ( virtual/ffmpeg )
	flac? ( media-libs/flac )
	thumbnail? ( media-video/ffmpegthumbnailer[jpeg] )
	curl? ( net-misc/curl net-misc/youtube-dl )
	magic? ( sys-apps/file )
	sys-apps/util-linux
	zlib? ( sys-libs/zlib )
	virtual/libiconv
"
RDEPEND="${DEPEND}"

CONFIG_CHECK="~INOTIFY_USER"

pkg_setup() {
	use inotify && linux-info_pkg_setup

	enewgro# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/net-misc/mediatomb/mediatomb-0.12.2_pre20140810.ebuild,v 1.2 2014/09/30 17:19:14 thev00d00 Exp $

EAPI=5
inherit autotools eutils linux-info user vcs-snapshot

DESCRIPTION="MediaTomb is an open source UPnP MediaServer"
HOMEPAGE="http://www.mediatomb.cc/"
SRC_URI="https://github.com/v00d00/${PN}/archive/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~arm ~ppc ~x86"

IUSE="curl debug +exif +ffmpeg flac id3tag +inotify +javascript lastfm
		+magic +mp4 mysql +sqlite +taglib thumbnail +zlib"
REQUIRED_USE="
	|| ( mysql sqlite )
	taglib? ( !id3tag )
	id3tag? ( !taglib )
	thumbnail? ( ffmpeg )
"

DEPEND="mysql? ( virtual/mysql )
	dev-libs/expat
	id3tag? ( media-libs/id3lib )
	javascript? ( >=dev-lang/spidermonkey-1.8.5:0 )
	taglib? ( media-libs/taglib )
	sqlite? ( >=dev-db/sqlite-3 )
	lastfm? ( >=media-libs/lastfmlib-0.4 )
	exif? ( media-libs/libexif )
	mp4? ( >=media-libs/libmp4v2-1.9.1_p479:0 )
	ffmpeg? ( virtual/ffmpeg )
	flac? ( media-libs/flac )
	thumbnail? ( media-video/ffmpegthumbnailer[jpeg] )
	curl? ( net-misc/curl net-misc/youtube-dl )
	magic? ( sys-apps/file )
	sys-apps/util-linux
	zlib? ( sys-libs/zlib )
	virtual/libiconv
"
RDEPEND="${DEPEND}"

CONFIG_CHECK="~INOTIFY_USER"

pkg_setup() {
	use inotify && linux-info_pkg_setup

	enewgroup mediatomb
	enewuser mediatomb -1 -1 /dev/null mediatomb
}

src_prepare() {
	# Support spidermonkey-187 #423991 #482392
	if has_version "~dev-lang/spidermonkey-1.8.7" ; then
		epatch "${FILESDIR}"/${PN}-0.12.1-mozjs187.patch
	fi

	epatch_user

	eautoreconf
}

src_configure() {
	econf \
		$(use_enable curl) \
		$(use_enable curl youtube) \
		$(use_enable 