# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-ruby/mongo/mongo-1.6.2.ebuild,v 1.4 2014/08/05 16:00:35 mrueg Exp $

EAPI=4

USE_RUBY="ruby19"

RUBY_FAKEGEM_TASK_TEST="test:unit"

RUBY_FAKEGEM_TASK_DOC="rdoc"
RUBY_FAKEGEM_DOCDIR="html"
RUBY_FAKEGEM_EXTRADOC=""

RUBY_FAKEGEM_GEMSPEC="${PN}.gemspec"

GITHUB_USER="mongodb"
GITHUB_PROJECT="mongo-ruby-driver"
RUBY_S="${GITHUB_USER}-${GITHUB_PROJECT}-*"

inherit ruby-fakegem

DESCRIPTION="A Ruby driver for MongoDB"
HOMEPAGE="http://www.mongodb.org/"
SRC_URI="https://github.com/${GITHUB_USER}/${GITHUB_PROJECT}/tarball/${PV} -> ${GITHUB_PROJECT}-${PV}.tar.gz"

LICENSE="APSL-2"
SLOT="0"
KEYWORDS="~amd64"
IUSE="test"

# This is the same source package a# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-ruby/mongo/mongo-1.6.2.ebuild,v 1.4 2014/08/05 16:00:35 mrueg Exp $

EAPI=4

USE_RUBY="ruby19"

RUBY_FAKEGEM_TASK_TEST="test:unit"

RUBY_FAKEGEM_TASK_DOC="r