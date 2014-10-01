# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-ruby/rspec-core/rspec-core-2.99.2.ebuild,v 1.1 2014/08/20 05:40:55 graaff Exp $

EAPI=5
USE_RUBY="ruby19 ruby20 ruby21 jruby"

RUBY_FAKEGEM_TASK_TEST="none"
RUBY_FAKEGEM_TASK_DOC="none"

RUBY_FAKEGEM_EXTRADOC="Changelog.md README.md"

# Also install this custom path since internal paths depend on it.
RUBY_FAKEGEM_EXTRAINSTALL="exe"

RUBY_FAKEGEM_GEMSPEC="rspec-core.gemspec"

inherit ruby-fakegem

DESCRIPTION="A Behaviour Driven Development (BDD) framework for Ruby"
HOMEPAGE="http://rspec.rubyforge.org/"
SRC_URI="https://github.com/rspec/${PN}/archive/v${PV}.tar.gz -> ${P}-git.tgz"

LICENSE="MIT"
SLOT="2"
KEYWORDS="~alpha ~amd64 ~arm ~hppa ~ia64 ~ppc ~ppc64 ~sparc ~x86 ~x86-fbsd ~amd64-linux ~x86-linux ~ppc-macos ~x64-macos ~x86-macos ~sparc-solaris ~sparc64-solaris ~x64-solaris ~x86-solaris"
IUSE=""

ruby_add_bdepend "test? (
		>=dev-ruby/nokogiri-1.5.2
		dev-ruby/syntax
		>=dev-ruby/zentest-4.6.2
		>=dev-ruby/rspec-expectations-2.14.0:2
		>=dev-ruby/rspec-mocks-2.99.0:2
	)"
# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-ruby/rspec-core/rspec-core-2.99.2.ebuild,v 1.1 2014/08/20 05:40:55 graaff Exp $

EAPI=5
USE_RUBY="ruby19 ruby20 ruby21 jruby"

RUBY_FAKEGEM_TASK_TEST="none"
RUBY_FAKEGEM_TASK_DOC="none"

RUBY_FAKEGEM_EXTRADOC="Changelog.md README.md"

# Also install this custom path since internal paths depend on it.
RUBY_FAKEGEM_EXTRAINSTALL="exe"

RUBY_FAKEGEM_GEMSPEC="rspec-core.gemspec"

inherit ruby-fakegem

DESCRIPTION="A Behaviour Driven Development (BDD) framework for Ruby"
HOMEPAGE="http://rspec.rubyforge.org/"
SRC_URI="https://github.com/rspec/${PN}/archive/v${PV}.tar.gz -> ${P}-git.tgz"

LICENSE="MIT"
SLOT="2"
KEYWORDS="~alpha ~amd64 ~arm ~hppa ~ia64 ~ppc ~ppc64 ~sparc ~x86 ~x86-fbsd ~amd64-linux ~x86-linux ~ppc-macos ~x64-macos ~x86-macos ~sparc-solaris ~sparc64-solaris ~x64-solaris ~x86-solaris"
IUSE=""

ruby_add_bdepend "test? (
		>=dev-ruby/nokogiri-1.5.2
		dev-ruby/syntax
		>=dev-ruby/zentest-4.6.2
		>=dev-ruby/rspec-expectations-2.14.0:2
		>=dev-ruby/rspec-mocks-2.99.0:2
	)"

# Skip yard for ruby20 for now since we don't support ruby20 eselected
# yet and we can't bootstrap otherwise.
USE_RUBY=${USE_RUBY/ruby20/} ruby_add_bdepend "doc? ( dev-ruby/yard )"

all_ruby_prepare() {
	# Don't set up bundler: it doesn't understand our setup.
	