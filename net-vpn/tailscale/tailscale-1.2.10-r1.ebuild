# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7
inherit go-module systemd tmpfiles
# This is obtained using ./version/version.sh in the upstream repo and
# substituting ${PV} appropriately.
VERSION_SHORT="${PV}"
VERSION_LONG="${PV}-te480f8ddf"
VERSION_GIT_HASH="e480f8ddf6f7334fda1b3d0dd1b500f2f01f961b"

DESCRIPTION="Tailscale vpn client"
HOMEPAGE="https://tailscale.com"

EGO_SUM=(
	"cloud.google.com/go v0.34.0/go.mod"
	"github.com/BurntSushi/toml v0.3.1"
	"github.com/BurntSushi/toml v0.3.1/go.mod"
	"github.com/Masterminds/semver/v3 v3.0.3"
	"github.com/Masterminds/semver/v3 v3.0.3/go.mod"
	"github.com/alecthomas/kingpin v2.2.6+incompatible/go.mod"
	"github.com/alecthomas/template v0.0.0-20190718012654-fb15b899a751/go.mod"
	"github.com/alecthomas/units v0.0.0-20190924025748-f65c72e2690d/go.mod"
	"github.com/alexbrainman/sspi v0.0.0-20180613141037-e580b900e9f5"
	"github.com/alexbrainman/sspi v0.0.0-20180613141037-e580b900e9f5/go.mod"
	"github.com/anmitsu/go-shlex v0.0.0-20161002113705-648efa622239"
	"github.com/anmitsu/go-shlex v0.0.0-20161002113705-648efa622239/go.mod"
	"github.com/apenwarr/fixconsole v0.0.0-20191012055117-5a9f6489cc29"
	"github.com/apenwarr/fixconsole v0.0.0-20191012055117-5a9f6489cc29/go.mod"
	"github.com/apenwarr/w32 v0.0.0-20190407065021-aa00fece76ab"
	"github.com/apenwarr/w32 v0.0.0-20190407065021-aa00fece76ab/go.mod"
	"github.com/blakesmith/ar v0.0.0-20190502131153-809d4375e1fb"
	"github.com/blakesmith/ar v0.0.0-20190502131153-809d4375e1fb/go.mod"
	"github.com/cavaliercoder/go-cpio v0.0.0-20180626203310-925f9528c45e"
	"github.com/cavaliercoder/go-cpio v0.0.0-20180626203310-925f9528c45e/go.mod"
	"github.com/coreos/go-iptables v0.4.5"
	"github.com/coreos/go-iptables v0.4.5/go.mod"
	"github.com/davecgh/go-spew v1.1.0/go.mod"
	"github.com/davecgh/go-spew v1.1.1"
	"github.com/davecgh/go-spew v1.1.1/go.mod"
	"github.com/flynn/go-shlex v0.0.0-20150515145356-3f9db97f8568"
	"github.com/flynn/go-shlex v0.0.0-20150515145356-3f9db97f8568/go.mod"
	"github.com/gliderlabs/ssh v0.2.2"
	"github.com/gliderlabs/ssh v0.2.2/go.mod"
	"github.com/go-multierror/multierror v1.0.2"
	"github.com/go-multierror/multierror v1.0.2/go.mod"
	"github.com/go-ole/go-ole v1.2.4"
	"github.com/go-ole/go-ole v1.2.4/go.mod"
	"github.com/godbus/dbus/v5 v5.0.3"
	"github.com/godbus/dbus/v5 v5.0.3/go.mod"
	"github.com/golang/groupcache v0.0.0-20200121045136-8c9f03a8e57e"
	"github.com/golang/groupcache v0.0.0-20200121045136-8c9f03a8e57e/go.mod"
	"github.com/golang/protobuf v1.2.0"
	"github.com/golang/protobuf v1.2.0/go.mod"
	"github.com/google/go-cmp v0.2.0/go.mod"
	"github.com/google/go-cmp v0.3.1/go.mod"
	"github.com/google/go-cmp v0.4.0"
	"github.com/google/go-cmp v0.4.0/go.mod"
	"github.com/google/renameio v0.1.0/go.mod"
	"github.com/google/rpmpack v0.0.0-20191226140753-aa36bfddb3a0"
	"github.com/google/rpmpack v0.0.0-20191226140753-aa36bfddb3a0/go.mod"
	"github.com/goreleaser/nfpm v1.1.10"
	"github.com/goreleaser/nfpm v1.1.10/go.mod"
	"github.com/imdario/mergo v0.3.8"
	"github.com/imdario/mergo v0.3.8/go.mod"
	"github.com/jsimonetti/rtnetlink v0.0.0-20190606172950-9527aa82566a/go.mod"
	"github.com/jsimonetti/rtnetlink v0.0.0-20200117123717-f846d4f6c1f4"
	"github.com/jsimonetti/rtnetlink v0.0.0-20200117123717-f846d4f6c1f4/go.mod"
	"github.com/kisielk/gotool v1.0.0/go.mod"
	"github.com/klauspost/compress v1.10.10"
	"github.com/klauspost/compress v1.10.10/go.mod"
	"github.com/kr/pretty v0.1.0"
	"github.com/kr/pretty v0.1.0/go.mod"
	"github.com/kr/pty v1.1.1"
	"github.com/kr/pty v1.1.1/go.mod"
	"github.com/kr/text v0.1.0"
	"github.com/kr/text v0.1.0/go.mod"
	"github.com/lxn/walk v0.0.0-20191128110447-55ccb3a9f5c1/go.mod"
	"github.com/lxn/win v0.0.0-20191128105842-2da648fda5b4/go.mod"
	"github.com/mattn/go-zglob v0.0.1"
	"github.com/mattn/go-zglob v0.0.1/go.mod"
	"github.com/mdlayher/netlink v0.0.0-20190409211403-11939a169225/go.mod"
	"github.com/mdlayher/netlink v1.0.0/go.mod"
	"github.com/mdlayher/netlink v1.1.0"
	"github.com/mdlayher/netlink v1.1.0/go.mod"
	"github.com/miekg/dns v1.1.30"
	"github.com/miekg/dns v1.1.30/go.mod"
	"github.com/op/go-logging v0.0.0-20160315200505-970db520ece7"
	"github.com/op/go-logging v0.0.0-20160315200505-970db520ece7/go.mod"
	"github.com/pborman/getopt v0.0.0-20190409184431-ee0cd42419d3"
	"github.com/pborman/getopt v0.0.0-20190409184431-ee0cd42419d3/go.mod"
	"github.com/pelletier/go-toml v1.6.0/go.mod"
	"github.com/peterbourgon/ff/v2 v2.0.0"
	"github.com/peterbourgon/ff/v2 v2.0.0/go.mod"
	"github.com/pkg/diff v0.0.0-20200914180035-5b29258ca4f7"
	"github.com/pkg/diff v0.0.0-20200914180035-5b29258ca4f7/go.mod"
	"github.com/pkg/errors v0.8.1"
	"github.com/pkg/errors v0.8.1/go.mod"
	"github.com/pmezard/go-difflib v1.0.0"
	"github.com/pmezard/go-difflib v1.0.0/go.mod"
	"github.com/rogpeppe/go-internal v1.3.0/go.mod"
	"github.com/sassoftware/go-rpmutils v0.0.0-20190420191620-a8f1baeba37b"
	"github.com/sassoftware/go-rpmutils v0.0.0-20190420191620-a8f1baeba37b/go.mod"
	"github.com/sergi/go-diff v1.0.0"
	"github.com/sergi/go-diff v1.0.0/go.mod"
	"github.com/stretchr/objx v0.1.0/go.mod"
	"github.com/stretchr/testify v1.4.0"
	"github.com/stretchr/testify v1.4.0/go.mod"
	"github.com/tailscale/depaware v0.0.0-20201003033024-5d95aab075be"
	"github.com/tailscale/depaware v0.0.0-20201003033024-5d95aab075be/go.mod"
	"github.com/tailscale/wireguard-go v0.0.0-20200921221757-11a958a67bdd"
	"github.com/tailscale/wireguard-go v0.0.0-20200921221757-11a958a67bdd/go.mod"
	"github.com/tailscale/wireguard-go v0.0.0-20201008164108-2c83f43a9859"
	"github.com/tailscale/wireguard-go v0.0.0-20201008164108-2c83f43a9859/go.mod"
	"github.com/tailscale/wireguard-go v0.0.0-20201021041318-a6168fd06b3f"
	"github.com/tailscale/wireguard-go v0.0.0-20201021041318-a6168fd06b3f/go.mod"
	"github.com/tcnksm/go-httpstat v0.2.0"
	"github.com/tcnksm/go-httpstat v0.2.0/go.mod"
	"github.com/toqueteos/webbrowser v1.2.0"
	"github.com/toqueteos/webbrowser v1.2.0/go.mod"
	"github.com/ulikunitz/xz v0.5.6"
	"github.com/ulikunitz/xz v0.5.6/go.mod"
	"github.com/xi2/xz v0.0.0-20171230120015-48954b6210f8"
	"github.com/xi2/xz v0.0.0-20171230120015-48954b6210f8/go.mod"
	"github.com/yuin/goldmark v1.2.1/go.mod"
	"go4.org/mem v0.0.0-20200706164138-185c595c3ecc"
	"go4.org/mem v0.0.0-20200706164138-185c595c3ecc/go.mod"
	"golang.org/x/crypto v0.0.0-20190308221718-c2843e01d9a2/go.mod"
	"golang.org/x/crypto v0.0.0-20190510104115-cbcb75029529/go.mod"
	"golang.org/x/crypto v0.0.0-20191002192127-34f69633bfdc/go.mod"
	"golang.org/x/crypto v0.0.0-20191011191535-87dc89f01550/go.mod"
	"golang.org/x/crypto v0.0.0-20200429183012-4b2356b1ed79/go.mod"
	"golang.org/x/crypto v0.0.0-20200622213623-75b288015ac9"
	"golang.org/x/crypto v0.0.0-20200622213623-75b288015ac9/go.mod"
	"golang.org/x/crypto v0.0.0-20200709230013-948cd5f35899"
	"golang.org/x/crypto v0.0.0-20200709230013-948cd5f35899/go.mod"
	"golang.org/x/mod v0.0.0-20190513183733-4bf6d317e70e/go.mod"
	"golang.org/x/mod v0.1.1-0.20191105210325-c90efee705ee/go.mod"
	"golang.org/x/mod v0.3.0"
	"golang.org/x/mod v0.3.0/go.mod"
	"golang.org/x/net v0.0.0-20180724234803-3673e40ba225/go.mod"
	"golang.org/x/net v0.0.0-20190108225652-1e06a53dbb7e/go.mod"
	"golang.org/x/net v0.0.0-20190311183353-d8887717615a/go.mod"
	"golang.org/x/net v0.0.0-20190404232315-eb5bcb51f2a3/go.mod"
	"golang.org/x/net v0.0.0-20190620200207-3b0461eec859/go.mod"
	"golang.org/x/net v0.0.0-20190827160401-ba9fcec4b297/go.mod"
	"golang.org/x/net v0.0.0-20190923162816-aa69164e4478/go.mod"
	"golang.org/x/net v0.0.0-20191003171128-d98b1b443823/go.mod"
	"golang.org/x/net v0.0.0-20191007182048-72f939374954/go.mod"
	"golang.org/x/net v0.0.0-20200202094626-16171245cfb2/go.mod"
	"golang.org/x/net v0.0.0-20200501053045-e0ff5e5a1de5/go.mod"
	"golang.org/x/net v0.0.0-20200707034311-ab3426394381/go.mod"
	"golang.org/x/net v0.0.0-20200822124328-c89045814202"
	"golang.org/x/net v0.0.0-20200822124328-c89045814202/go.mod"
	"golang.org/x/oauth2 v0.0.0-20200107190931-bf48bf16ab8d"
	"golang.org/x/oauth2 v0.0.0-20200107190931-bf48bf16ab8d/go.mod"
	"golang.org/x/sync v0.0.0-20181221193216-37e7f081c4d4/go.mod"
	"golang.org/x/sync v0.0.0-20190423024810-112230192c58/go.mod"
	"golang.org/x/sync v0.0.0-20200625203802-6e8e738ad208"
	"golang.org/x/sync v0.0.0-20200625203802-6e8e738ad208/go.mod"
	"golang.org/x/sys v0.0.0-20190215142949-d0b11bdaac8a/go.mod"
	"golang.org/x/sys v0.0.0-20190312061237-fead79001313/go.mod"
	"golang.org/x/sys v0.0.0-20190405154228-4b34438f7a67/go.mod"
	"golang.org/x/sys v0.0.0-20190411185658-b44545bcd369/go.mod"
	"golang.org/x/sys v0.0.0-20190412213103-97732733099d/go.mod"
	"golang.org/x/sys v0.0.0-20190826190057-c7b8b68b1456/go.mod"
	"golang.org/x/sys v0.0.0-20190904154756-749cb33beabd/go.mod"
	"golang.org/x/sys v0.0.0-20190924154521-2837fb4f24fe/go.mod"
	"golang.org/x/sys v0.0.0-20191003212358-c178f38b412c/go.mod"
	"golang.org/x/sys v0.0.0-20191008105621-543471e840be/go.mod"
	"golang.org/x/sys v0.0.0-20200202164722-d101bd2416d5/go.mod"
	"golang.org/x/sys v0.0.0-20200323222414-85ca7c5b95cd/go.mod"
	"golang.org/x/sys v0.0.0-20200501145240-bc7a7d42d5c3/go.mod"
	"golang.org/x/sys v0.0.0-20200728102440-3e129f6d46b1/go.mod"
	"golang.org/x/sys v0.0.0-20200812155832-6a926be9bd1d"
	"golang.org/x/sys v0.0.0-20200812155832-6a926be9bd1d/go.mod"
	"golang.org/x/text v0.3.0/go.mod"
	"golang.org/x/text v0.3.2/go.mod"
	"golang.org/x/text v0.3.3"
	"golang.org/x/text v0.3.3/go.mod"
	"golang.org/x/time v0.0.0-20191024005414-555d28b269f0"
	"golang.org/x/time v0.0.0-20191024005414-555d28b269f0/go.mod"
	"golang.org/x/tools v0.0.0-20180917221912-90fa682c2a6e/go.mod"
	"golang.org/x/tools v0.0.0-20191119224855-298f0cb1881e/go.mod"
	"golang.org/x/tools v0.0.0-20191130070609-6e064ea0cf2d/go.mod"
	"golang.org/x/tools v0.0.0-20191216052735-49a3e744a425/go.mod"
	"golang.org/x/tools v0.0.0-20201001230009-b5b87423c93b/go.mod"
	"golang.org/x/tools v0.0.0-20201002184944-ecd9fd270d5d"
	"golang.org/x/tools v0.0.0-20201002184944-ecd9fd270d5d/go.mod"
	"golang.org/x/xerrors v0.0.0-20190717185122-a985d3407aa7/go.mod"
	"golang.org/x/xerrors v0.0.0-20191011141410-1b5146add898/go.mod"
	"golang.org/x/xerrors v0.0.0-20191204190536-9bdfabe68543/go.mod"
	"golang.org/x/xerrors v0.0.0-20200804184101-5ec99f83aff1"
	"golang.org/x/xerrors v0.0.0-20200804184101-5ec99f83aff1/go.mod"
	"golang.zx2c4.com/wireguard v0.0.20200321-0.20200715051853-507f148e1c42"
	"golang.zx2c4.com/wireguard v0.0.20200321-0.20200715051853-507f148e1c42/go.mod"
	"golang.zx2c4.com/wireguard/windows v0.1.2-0.20201004085714-dd60d0447f81"
	"golang.zx2c4.com/wireguard/windows v0.1.2-0.20201004085714-dd60d0447f81/go.mod"
	"google.golang.org/appengine v1.4.0"
	"google.golang.org/appengine v1.4.0/go.mod"
	"gopkg.in/check.v1 v0.0.0-20161208181325-20d25e280405/go.mod"
	"gopkg.in/check.v1 v1.0.0-20180628173108-788fd7840127/go.mod"
	"gopkg.in/check.v1 v1.0.0-20190902080502-41f04d3bba15"
	"gopkg.in/check.v1 v1.0.0-20190902080502-41f04d3bba15/go.mod"
	"gopkg.in/errgo.v2 v2.1.0/go.mod"
	"gopkg.in/yaml.v2 v2.2.2/go.mod"
	"gopkg.in/yaml.v2 v2.2.4/go.mod"
	"gopkg.in/yaml.v2 v2.2.7"
	"gopkg.in/yaml.v2 v2.2.7/go.mod"
	"honnef.co/go/tools v0.0.1-2020.1.4"
	"honnef.co/go/tools v0.0.1-2020.1.4/go.mod"
	"inet.af/netaddr v0.0.0-20200810144936-56928fe48a98"
	"inet.af/netaddr v0.0.0-20200810144936-56928fe48a98/go.mod"
	"rsc.io/goversion v1.2.0"
	"rsc.io/goversion v1.2.0/go.mod"
	)
go-module_set_globals
SRC_URI="https://github.com/tailscale/tailscale/archive/v${PV}.tar.gz -> ${P}.tar.gz
	${EGO_SUM_SRC_URI}"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm"

RDEPEND="net-firewall/iptables"

# This translates the build command from upstream's build_dist.sh to an
# ebuild equivalent.
build_dist() {
	go build -tags xversion -ldflags "
		-X tailscale.com/version.Long=${VERSION_LONG}
		-X tailscale.com/version.Short=${VERSION_SHORT}
		-X tailscale.com/version.GitCommit=${VERSION_GIT_HASH}" "$@"
}

src_compile() {
	build_dist ./cmd/tailscale || die
	build_dist ./cmd/tailscaled || die
}

src_install() {
	dosbin tailscaled
	dobin tailscale

	systemd_dounit cmd/tailscaled/tailscaled.service
	insinto /etc/default
	newins cmd/tailscaled/tailscaled.defaults tailscaled
	keepdir /var/lib/${PN}
	fperms 0750 /var/lib/${PN}

	newtmpfiles "${FILESDIR}/${PN}.tmpfiles" ${PN}.conf

	newinitd "${FILESDIR}/${PN}d.initd" ${PN}
	newconfd "${FILESDIR}/${PN}d.confd" ${PN}
}
