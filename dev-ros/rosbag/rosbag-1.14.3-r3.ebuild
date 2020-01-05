# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=5

ROS_REPO_URI="https://github.com/ros/ros_comm"
KEYWORDS="~amd64 ~arm"
ROS_SUBDIR=tools/${PN}
PYTHON_COMPAT=( python2_7 )

inherit ros-catkin

DESCRIPTION="Set of tools for recording from and playing back to ROS topics"
LICENSE="BSD"
SLOT="0"
IUSE="lz4"

RDEPEND="
	>=dev-ros/rosbag_storage-1.14
	dev-ros/rosconsole
	dev-ros/roscpp
	dev-ros/topic_tools
	dev-ros/xmlrpcpp
	dev-libs/boost:=
	app-arch/bzip2
	dev-ros/std_srvs[${CATKIN_MESSAGES_PYTHON_USEDEP}]
	dev-ros/roslib[${PYTHON_USEDEP}]
	dev-ros/genpy[${PYTHON_USEDEP}]
	dev-ros/rospy[${PYTHON_USEDEP}]
	dev-libs/console_bridge:=
	dev-python/pycryptodome[${PYTHON_USEDEP}]
	dev-python/python-gnupg[${PYTHON_USEDEP}]
"
DEPEND="${RDEPEND}"
RDEPEND="${RDEPEND}
	lz4? ( dev-ros/roslz4[${PYTHON_USEDEP}] )"
PATCHES=( "${FILESDIR}/yaml.patch" )
