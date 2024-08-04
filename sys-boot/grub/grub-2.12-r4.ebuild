# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

# This ebuild uses 3 special global variables:
# GRUB_BOOTSTRAP: Depend on python and invoke bootstrap (gnulib).
# GRUB_AUTOGEN: Depend on python and invoke autogen.sh.
# GRUB_AUTORECONF: Inherit autotools and invoke eautoreconf.
#
# When applying patches:
# If gnulib is updated, set GRUB_BOOTSTRAP=1
# If gentpl.py or *.def is updated, set GRUB_AUTOGEN=1
# If gnulib, gentpl.py, *.def, or any autotools files are updated, set GRUB_AUTORECONF=1
#
# If any of the above applies to a user patch, the user should set the
# corresponding variable in make.conf or the environment.

GRUB_AUTORECONF=1
PYTHON_COMPAT=( python3_{10..12} )
WANT_LIBTOOL=none
VERIFY_SIG_OPENPGP_KEY_PATH=/usr/share/openpgp-keys/dkiper.gpg

if [[ -n ${GRUB_AUTORECONF} ]]; then
	inherit autotools
fi

inherit bash-completion-r1 flag-o-matic multibuild optfeature python-any-r1 toolchain-funcs

DESCRIPTION="GNU GRUB boot loader"
HOMEPAGE="https://www.gnu.org/software/grub/"

MY_P=${P}
if [[ ${PV} != 9999 ]]; then
	inherit verify-sig

	if [[ ${PV} == *_alpha* || ${PV} == *_beta* || ${PV} == *_rc* ]]; then
		# The quote style is to work with <=bash-4.2 and >=bash-4.3 #503860
		MY_P=${P/_/'~'}
		SRC_URI="
			https://alpha.gnu.org/gnu/${PN}/${MY_P}.tar.xz
			verify-sig? ( https://alpha.gnu.org/gnu/${PN}/${MY_P}.tar.xz.sig )
		"
		S=${WORKDIR}/${MY_P}
	else
		SRC_URI="
			mirror://gnu/${PN}/${P}.tar.xz
			https://dev.gentoo.org/~floppym/dist/${P}-bash-completion.patch.gz
			verify-sig? ( mirror://gnu/${PN}/${P}.tar.xz.sig )
		"
		S=${WORKDIR}/${P%_*}
	fi
	BDEPEND="verify-sig? ( sec-keys/openpgp-keys-danielkiper )"
	KEYWORDS="amd64 arm arm64 ~ia64 ~loong ppc ppc64 ~riscv sparc x86"
else
	inherit git-r3
	EGIT_REPO_URI="https://git.savannah.gnu.org/git/grub.git"
fi

DEJAVU=dejavu-sans-ttf-2.37
UNIFONT=unifont-15.0.06
SRC_URI+=" fonts? ( mirror://gnu/unifont/${UNIFONT}/${UNIFONT}.pcf.gz )
	themes? ( https://downloads.sourceforge.net/dejavu/${DEJAVU}.zip )"

# Includes licenses for dejavu and unifont
LICENSE="GPL-3+ BSD MIT fonts? ( GPL-2-with-font-exception ) themes? ( CC-BY-SA-3.0 BitstreamVera )"
SLOT="2/${PVR}"
IUSE="device-mapper doc efiemu +fonts mount nls sdl test +themes truetype libzfs"

GRUB_ALL_PLATFORMS=( coreboot efi-32 efi-64 emu ieee1275 loongson multiboot
	qemu qemu-mips pc uboot xen xen-32 xen-pvh )
IUSE+=" ${GRUB_ALL_PLATFORMS[@]/#/grub_platforms_}"

REQUIRED_USE="
	grub_platforms_coreboot? ( fonts )
	grub_platforms_qemu? ( fonts )
	grub_platforms_ieee1275? ( fonts )
	grub_platforms_loongson? ( fonts )
"

BDEPEND+="
	${PYTHON_DEPS}
	>=sys-devel/flex-2.5.35
	sys-devel/bison
	sys-apps/help2man
	sys-apps/texinfo
	fonts? (
		media-libs/freetype:2
		virtual/pkgconfig
	)
	test? (
		app-admin/genromfs
		app-alternatives/cpio
		app-arch/lzop
		app-emulation/qemu
		dev-libs/libisoburn
		sys-apps/miscfiles
		sys-block/parted
		sys-fs/squashfs-tools
	)
	themes? (
		app-arch/unzip
		media-libs/freetype:2
		virtual/pkgconfig
	)
	truetype? ( virtual/pkgconfig )
"
DEPEND="
	app-arch/xz-utils
	>=sys-libs/ncurses-5.2-r5:0=
	grub_platforms_emu? (
		sdl? ( media-libs/libsdl2 )
	)
	device-mapper? ( >=sys-fs/lvm2-2.02.45 )
	libzfs? ( sys-fs/zfs:= )
	mount? ( sys-fs/fuse:3 )
	truetype? ( media-libs/freetype:2= )
	ppc? ( >=sys-apps/ibm-powerpc-utils-1.3.5 )
	ppc64? ( >=sys-apps/ibm-powerpc-utils-1.3.5 )
"
RDEPEND="${DEPEND}
	kernel_linux? (
		grub_platforms_efi-32? ( sys-boot/efibootmgr )
		grub_platforms_efi-64? ( sys-boot/efibootmgr )
	)
	!sys-boot/grub:0
	nls? ( sys-devel/gettext )
"

RESTRICT="!test? ( test ) test? ( userpriv )"

QA_EXECSTACK="usr/bin/grub-emu* usr/lib/grub/*"
QA_PRESTRIPPED="usr/lib/grub/.*"
QA_MULTILIB_PATHS="usr/lib/grub/.*"
QA_WX_LOAD="usr/lib/grub/*"

pkg_setup() {
	:
}

src_unpack() {
	if [[ ${PV} == 9999 ]]; then
		git-r3_src_unpack
		pushd "${P}" >/dev/null || die
		local GNULIB_URI="https://git.savannah.gnu.org/git/gnulib.git"
		local GNULIB_REVISION=$(source bootstrap.conf >/dev/null; echo "${GNULIB_REVISION}")
		git-r3_fetch "${GNULIB_URI}" "${GNULIB_REVISION}"
		git-r3_checkout "${GNULIB_URI}" gnulib
		popd >/dev/null || die
	elif use verify-sig; then
		verify-sig_verify_detached "${DISTDIR}"/${MY_P}.tar.xz{,.sig}
	fi
	default
}

src_prepare() {
	local PATCHES=(
		"${FILESDIR}"/gfxpayload.patch
		"${FILESDIR}"/grub-2.02_beta2-KERNEL_GLOBS.patch
		"${FILESDIR}"/grub-2.06-test-words.patch
		"${FILESDIR}"/grub-2.12-fwsetup.patch
		"${WORKDIR}"/grub-2.12-bash-completion.patch
	)

	default

	python_setup

	if [[ -n ${GRUB_BOOTSTRAP} ]]; then
		eautopoint --force
		AUTOPOINT=: AUTORECONF=: ./bootstrap || die
	elif [[ -n ${GRUB_AUTOGEN} ]]; then
		FROM_BOOTSTRAP=1 ./autogen.sh || die
	fi

	if [[ -n ${GRUB_AUTORECONF} ]]; then
		eautoreconf
	fi

	# Avoid error due to extra_deps.lst missing from source tarball:
	#       make[3]: *** No rule to make target 'grub-core/extra_deps.lst', needed by 'syminfo.lst'.  Stop.
	echo "depends bli part_gpt" > grub-core/extra_deps.lst || die
}

grub_do() {
	multibuild_foreach_variant run_in_build_dir "$@"
}

grub_do_once() {
	multibuild_for_best_variant run_in_build_dir "$@"
}

grub_configure() {
	local platform

	case ${MULTIBUILD_VARIANT} in
		efi*) platform=efi ;;
		xen-pvh) platform=xen_pvh ;;
		xen*) platform=xen ;;
		guessed) ;;
		*) platform=${MULTIBUILD_VARIANT} ;;
	esac

	case ${MULTIBUILD_VARIANT} in
		*-32)
			if [[ ${CTARGET:-${CHOST}} == x86_64* ]]; then
				local CTARGET=i386
			fi ;;
		*-64)
			if [[ ${CTARGET:-${CHOST}} == i?86* ]]; then
				local CTARGET=x86_64
				local -x TARGET_CFLAGS="-Os -march=x86-64 ${TARGET_CFLAGS}"
				local -x TARGET_CPPFLAGS="-march=x86-64 ${TARGET_CPPFLAGS}"
			fi ;;
	esac

	local myeconfargs=(
		--disable-werror
		--program-prefix=
		--libdir="${EPREFIX}"/usr/lib
		$(use_enable device-mapper)
		$(use_enable mount grub-mount)
		$(use_enable nls)
		$(use_enable themes grub-themes)
		$(use_enable truetype grub-mkfont)
		$(use_enable libzfs)
		--enable-grub-emu-sdl=no
		$(use_enable sdl grub-emu-sdl2)
		${platform:+--with-platform=}${platform}

		# Let configure detect this where supported
		$(usex efiemu '' '--disable-efiemu')
	)

	if use fonts; then
		ln -rs "${WORKDIR}/${UNIFONT}.pcf" unifont.pcf || die
	fi

	if use themes; then
		ln -rs "${WORKDIR}/${DEJAVU}/ttf/DejaVuSans.ttf" DejaVuSans.ttf || die
	fi

	local ECONF_SOURCE="${S}"
	econf "${myeconfargs[@]}"
}

src_configure() {
	# Bug 508758.
	replace-flags -O3 -O2

	# Workaround for bug 829165.
	filter-ldflags -pie

	# We don't want to leak flags onto boot code.
	export HOST_CCASFLAGS=${CCASFLAGS}
	export HOST_CFLAGS=${CFLAGS}
	export HOST_CPPFLAGS=${CPPFLAGS}
	export HOST_LDFLAGS=${LDFLAGS}
	unset CCASFLAGS CFLAGS CPPFLAGS LDFLAGS

	tc-ld-disable-gold #439082 #466536 #526348
	export TARGET_LDFLAGS="${TARGET_LDFLAGS} ${LDFLAGS}"
	unset LDFLAGS

	tc-export CC NM OBJCOPY RANLIB STRIP
	tc-export BUILD_CC BUILD_PKG_CONFIG

	# Force configure to use flex & bison, bug 887211.
	export LEX=flex
	unset YACC

	MULTIBUILD_VARIANTS=()
	local p
	for p in "${GRUB_ALL_PLATFORMS[@]}"; do
		use "grub_platforms_${p}" && MULTIBUILD_VARIANTS+=( "${p}" )
	done
	[[ ${#MULTIBUILD_VARIANTS[@]} -eq 0 ]] && MULTIBUILD_VARIANTS=( guessed )
	grub_do grub_configure
}

src_compile() {
	# Sandbox bug 404013.
	use libzfs && { addpredict /etc/dfs; addpredict /dev/zfs; }

	grub_do emake
	use doc && grub_do_once emake -C docs html
}

src_test() {
	# The qemu dependency is a bit complex.
	# You will need to adjust QEMU_SOFTMMU_TARGETS to match the cpu/platform.
	local SANDBOX_WRITE=${SANDBOX_WRITE}
	addwrite /dev
	grub_do emake -j1 check
}

src_install() {
	grub_do emake install DESTDIR="${D}" bashcompletiondir="$(get_bashcompdir)"
	use doc && grub_do_once emake -C docs install-html DESTDIR="${D}"

	einstalldocs

	insinto /etc/default
	newins "${FILESDIR}"/grub.default-4 grub

	# https://bugs.gentoo.org/231935
	dostrip -x /usr/lib/grub

	sed -e "s/%PV%/${PV}/" "${FILESDIR}/sbat.csv" > "${T}/sbat.csv" || die
	insinto /usr/share/grub
	doins "${T}/sbat.csv"

	if use elibc_musl; then
		# https://bugs.gentoo.org/900348
		QA_CONFIG_IMPL_DECL_SKIP=( re_{compile_pattern,match,search,set_syntax} )
	fi
}

pkg_postinst() {
	elog "For information on how to configure GRUB2 please refer to the guide:"
	elog "    https://wiki.gentoo.org/wiki/GRUB2_Quick_Start"

	if [[ -n ${REPLACING_VERSIONS} ]]; then
		local v
		for v in ${REPLACING_VERSIONS}; do
			if ver_test -gt ${v}; then
				ewarn
				ewarn "Re-run grub-install to update installed boot code!"
				ewarn "Re-run grub-mkconfig to update grub.cfg!"
				ewarn
				break
			fi
		done
	else
		elog
		optfeature "detecting other operating systems (grub-mkconfig)" sys-boot/os-prober
		optfeature "creating rescue media (grub-mkrescue)" dev-libs/libisoburn sys-fs/mtools
		optfeature "enabling RAID device detection" sys-fs/mdadm
		optfeature "automatically updating GRUB's configuration on each kernel installation" "sys-kernel/installkernel[grub]"
	fi

	if has_version 'sys-boot/grub:0'; then
		elog "A migration guide for GRUB Legacy users is available:"
		elog "    https://wiki.gentoo.org/wiki/GRUB2_Migration"
	fi

	if has_version sys-boot/os-prober; then
		ewarn "Due to security concerns, os-prober is disabled by default."
		ewarn "Set GRUB_DISABLE_OS_PROBER=false in /etc/default/grub to enable it."
	fi
}
