# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

ROS_REPO_URI="https://github.com/ros/xacro"
KEYWORDS="~amd64"

inherit ros-catkin

DESCRIPTION="XML macro language"
LICENSE="BSD"
SLOT="0"
IUSE=""

RDEPEND="dev-ros/roslint[${PYTHON_SINGLE_USEDEP}]"
DEPEND="${RDEPEND}
	test? (
		dev-ros/rostest[${PYTHON_SINGLE_USEDEP}]
		$(python_gen_cond_dep "dev-python/nose[\${PYTHON_USEDEP}]")
	)
"
RDEPEND="${RDEPEND}
	dev-ros/roslaunch[${PYTHON_SINGLE_USEDEP}]"
PATCHES=( "${FILESDIR}/tests.patch" )

src_test() {
	export ROS_PACKAGE_PATH="${S}:${ROS_PACKAGE_PATH}"
	ros-catkin_src_test
}
