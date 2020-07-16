# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7
ROS_REPO_URI="https://github.com/ros-perception/image_common"
KEYWORDS="~amd64 ~arm"
ROS_SUBDIR=${PN}

inherit ros-catkin

DESCRIPTION="Routines for reading and writing camera calibration parameters"
LICENSE="BSD"
SLOT="0"
IUSE=""

RDEPEND="
	dev-ros/sensor_msgs[${CATKIN_MESSAGES_PYTHON_USEDEP}]
	dev-libs/boost:=[python,${PYTHON_USEDEP}]
	dev-ros/rosconsole
	>=dev-cpp/yaml-cpp-0.5:=
	dev-ros/roscpp
	dev-ros/roscpp_serialization
"
DEPEND="${RDEPEND}
	test? ( dev-python/nose )
	dev-ros/sensor_msgs[${CATKIN_MESSAGES_CXX_USEDEP}]
"
BDEPEND="
	virtual/pkgconfig
"
PATCHES=( "${FILESDIR}/boostpython.patch" )
