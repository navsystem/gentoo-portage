# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=5

DESCRIPTION="A openstack meta-package for installing the various openstack pieces"
HOMEPAGE="https://openstack.org"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS=""
IUSE="keystone swift neutron glance cinder nova"

DEPEND=""
RDEPEND="keystone? ( ~sys-auth/keystone-2016.1.9999 )
		swift? ( ~sys-cluster/swift-2.9.0 )
		neutron? ( ~sys-cluster/neutron-2016.1.9999 )
		glance? ( ~app-admin/glance-2016.1.9999 )
		cinder? ( ~sys-cluster/cinder-2016.1.9999 )
		nova? ( ~sys-cluster/nova-2016.1.9999 )"
