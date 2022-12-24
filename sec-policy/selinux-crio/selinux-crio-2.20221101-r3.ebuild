# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI="7"

IUSE=""
MODS="crio"

inherit selinux-policy-2

DESCRIPTION="SELinux policy for cri-o"

if [[ ${PV} != 9999* ]] ; then
	KEYWORDS="amd64 arm arm64 ~mips x86"
fi

DEPEND="${DEPEND}
	sec-policy/selinux-kubernetes
"
RDEPEND="${RDEPEND}
	sec-policy/selinux-kubernetes
"
