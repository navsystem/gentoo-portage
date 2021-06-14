# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

MY_P="${PN}-parent-${PV}"
JAVA_PKG_IUSE="doc source"

inherit java-pkg-2 java-pkg-simple

DESCRIPTION="Java library to convert JSON to Java objects and vice-versa"
HOMEPAGE="https://github.com/google/gson"
SRC_URI="https://github.com/google/${PN}/archive/${MY_P}.tar.gz"
LICENSE="Apache-2.0"
SLOT="2.6"
KEYWORDS="~amd64 ~ppc64 ~x86"

DEPEND=">=virtual/jdk-1.8:*"
RDEPEND=">=virtual/jre-1.8:*"

S="${WORKDIR}/${PN}-${MY_P}"
JAVA_SRC_DIR="${PN}/src/main/java"
