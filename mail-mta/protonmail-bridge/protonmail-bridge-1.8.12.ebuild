# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit go-module systemd xdg-utils

EGO_SUM=(
	"cloud.google.com/go v0.26.0/go.mod"
	"cloud.google.com/go v0.34.0/go.mod"
	"cloud.google.com/go v0.38.0/go.mod"
	"cloud.google.com/go v0.44.1/go.mod"
	"cloud.google.com/go v0.44.2/go.mod"
	"cloud.google.com/go v0.45.1/go.mod"
	"cloud.google.com/go v0.46.3/go.mod"
	"cloud.google.com/go/bigquery v1.0.1/go.mod"
	"cloud.google.com/go/datastore v1.0.0/go.mod"
	"cloud.google.com/go/firestore v1.1.0/go.mod"
	"cloud.google.com/go/pubsub v1.0.1/go.mod"
	"cloud.google.com/go/storage v1.0.0/go.mod"
	"dmitri.shuralyov.com/gpu/mtl v0.0.0-20190408044501-666a987793e9/go.mod"
	"github.com/0xAX/notificator v0.0.0-20191016112426-3962a5ea8da1"
	"github.com/0xAX/notificator v0.0.0-20191016112426-3962a5ea8da1/go.mod"
	"github.com/AndreasBriese/bbloom v0.0.0-20190306092124-e2d15f34fcf9/go.mod"
	"github.com/BurntSushi/toml v0.3.1/go.mod"
	"github.com/BurntSushi/xgb v0.0.0-20160522181843-27f122750802/go.mod"
	"github.com/CloudyKit/fastprinter v0.0.0-20200109182630-33d98a066a53/go.mod"
	"github.com/CloudyKit/jet/v3 v3.0.0/go.mod"
	"github.com/Joker/hpp v1.0.0/go.mod"
	"github.com/Masterminds/semver/v3 v3.1.0"
	"github.com/Masterminds/semver/v3 v3.1.0/go.mod"
	"github.com/OneOfOne/xxhash v1.2.2/go.mod"
	"github.com/ProtonMail/bcrypt v0.0.0-20210511135022-227b4adcab57"
	"github.com/ProtonMail/bcrypt v0.0.0-20210511135022-227b4adcab57/go.mod"
	"github.com/ProtonMail/docker-credential-helpers v1.1.0"
	"github.com/ProtonMail/docker-credential-helpers v1.1.0/go.mod"
	"github.com/ProtonMail/go-autostart v0.0.0-20181114175602-c5272053443a"
	"github.com/ProtonMail/go-autostart v0.0.0-20181114175602-c5272053443a/go.mod"
	"github.com/ProtonMail/go-crypto v0.0.0-20210428141323-04723f9f07d7/go.mod"
	"github.com/ProtonMail/go-crypto v0.0.0-20210512092938-c05353c2d58c/go.mod"
	"github.com/ProtonMail/go-crypto v0.0.0-20210707164159-52430bf6b52c"
	"github.com/ProtonMail/go-crypto v0.0.0-20210707164159-52430bf6b52c/go.mod"
	"github.com/ProtonMail/go-imap v0.0.0-20201228133358-4db68cea0cac"
	"github.com/ProtonMail/go-imap v0.0.0-20201228133358-4db68cea0cac/go.mod"
	"github.com/ProtonMail/go-imap-id v0.0.0-20190926060100-f94a56b9ecde"
	"github.com/ProtonMail/go-imap-id v0.0.0-20190926060100-f94a56b9ecde/go.mod"
	"github.com/ProtonMail/go-message v0.0.0-20210611055058-fabeff2ec753"
	"github.com/ProtonMail/go-message v0.0.0-20210611055058-fabeff2ec753/go.mod"
	"github.com/ProtonMail/go-mime v0.0.0-20190923161245-9b5a4261663a"
	"github.com/ProtonMail/go-mime v0.0.0-20190923161245-9b5a4261663a/go.mod"
	"github.com/ProtonMail/go-rfc5322 v0.8.0"
	"github.com/ProtonMail/go-rfc5322 v0.8.0/go.mod"
	"github.com/ProtonMail/go-srp v0.0.0-20210910093455-a843a0b9adff"
	"github.com/ProtonMail/go-srp v0.0.0-20210910093455-a843a0b9adff/go.mod"
	"github.com/ProtonMail/go-srp v0.0.1"
	"github.com/ProtonMail/go-srp v0.0.1/go.mod"
	"github.com/ProtonMail/go-vcard v0.0.0-20180326232728-33aaa0a0c8a5"
	"github.com/ProtonMail/go-vcard v0.0.0-20180326232728-33aaa0a0c8a5/go.mod"
	"github.com/ProtonMail/gopenpgp/v2 v2.2.2"
	"github.com/ProtonMail/gopenpgp/v2 v2.2.2/go.mod"
	"github.com/PuerkitoBio/goquery v1.5.1"
	"github.com/PuerkitoBio/goquery v1.5.1/go.mod"
	"github.com/Shopify/goreferrer v0.0.0-20181106222321-ec9c9a553398/go.mod"
	"github.com/abiosoft/ishell v2.0.0+incompatible"
	"github.com/abiosoft/ishell v2.0.0+incompatible/go.mod"
	"github.com/abiosoft/readline v0.0.0-20180607040430-155bce2042db"
	"github.com/abiosoft/readline v0.0.0-20180607040430-155bce2042db/go.mod"
	"github.com/ajg/form v1.5.1/go.mod"
	"github.com/alecthomas/template v0.0.0-20160405071501-a0175ee3bccc/go.mod"
	"github.com/alecthomas/units v0.0.0-20151022065526-2efee857e7cf/go.mod"
	"github.com/allan-simon/go-singleinstance v0.0.0-20160830203053-79edcfdc2dfc"
	"github.com/allan-simon/go-singleinstance v0.0.0-20160830203053-79edcfdc2dfc/go.mod"
	"github.com/andybalholm/cascadia v1.1.0"
	"github.com/andybalholm/cascadia v1.1.0/go.mod"
	"github.com/antlr/antlr4 v0.0.0-20201029161626-9a95f0cc3d7c"
	"github.com/antlr/antlr4 v0.0.0-20201029161626-9a95f0cc3d7c/go.mod"
	"github.com/armon/circbuf v0.0.0-20150827004946-bbbad097214e/go.mod"
	"github.com/armon/consul-api v0.0.0-20180202201655-eb2c6b5be1b6/go.mod"
	"github.com/armon/go-metrics v0.0.0-20180917152333-f0300d1749da/go.mod"
	"github.com/armon/go-radix v0.0.0-20180808171621-7fddfc383310/go.mod"
	"github.com/aymerick/raymond v2.0.3-0.20180322193309-b565731e1464+incompatible/go.mod"
	"github.com/beorn7/perks v0.0.0-20180321164747-3a771d992973/go.mod"
	"github.com/beorn7/perks v1.0.0/go.mod"
	"github.com/bgentry/speakeasy v0.1.0/go.mod"
	"github.com/bketelsen/crypt v0.0.3-0.20200106085610-5cbc8cc4026c/go.mod"
	"github.com/cespare/xxhash v1.1.0/go.mod"
	"github.com/chzyer/logex v1.1.10"
	"github.com/chzyer/logex v1.1.10/go.mod"
	"github.com/chzyer/test v0.0.0-20180213035817-a1ea475d72b1"
	"github.com/chzyer/test v0.0.0-20180213035817-a1ea475d72b1/go.mod"
	"github.com/client9/misspell v0.3.4/go.mod"
	"github.com/codegangsta/inject v0.0.0-20150114235600-33e0aa1cb7c0/go.mod"
	"github.com/coreos/bbolt v1.3.2/go.mod"
	"github.com/coreos/etcd v3.3.10+incompatible/go.mod"
	"github.com/coreos/etcd v3.3.13+incompatible/go.mod"
	"github.com/coreos/go-etcd v2.0.0+incompatible/go.mod"
	"github.com/coreos/go-semver v0.2.0/go.mod"
	"github.com/coreos/go-semver v0.3.0/go.mod"
	"github.com/coreos/go-systemd v0.0.0-20190321100706-95778dfbb74e/go.mod"
	"github.com/coreos/pkg v0.0.0-20180928190104-399ea9e2e55f/go.mod"
	"github.com/cpuguy83/go-md2man v1.0.10"
	"github.com/cpuguy83/go-md2man v1.0.10/go.mod"
	"github.com/cpuguy83/go-md2man/v2 v2.0.0-20190314233015-f79a8a8ca69d/go.mod"
	"github.com/cpuguy83/go-md2man/v2 v2.0.0"
	"github.com/cpuguy83/go-md2man/v2 v2.0.0/go.mod"
	"github.com/creack/pty v1.1.9/go.mod"
	"github.com/cronokirby/saferith v0.31.0"
	"github.com/cronokirby/saferith v0.31.0/go.mod"
	"github.com/cucumber/gherkin-go/v19 v19.0.3"
	"github.com/cucumber/gherkin-go/v19 v19.0.3/go.mod"
	"github.com/cucumber/godog v0.12.1"
	"github.com/cucumber/godog v0.12.1/go.mod"
	"github.com/cucumber/messages-go/v16 v16.0.0/go.mod"
	"github.com/cucumber/messages-go/v16 v16.0.1"
	"github.com/cucumber/messages-go/v16 v16.0.1/go.mod"
	"github.com/danieljoos/wincred v1.1.0"
	"github.com/danieljoos/wincred v1.1.0/go.mod"
	"github.com/davecgh/go-spew v1.1.0/go.mod"
	"github.com/davecgh/go-spew v1.1.1"
	"github.com/davecgh/go-spew v1.1.1/go.mod"
	"github.com/dgraph-io/badger v1.6.0/go.mod"
	"github.com/dgrijalva/jwt-go v3.2.0+incompatible/go.mod"
	"github.com/dgryski/go-farm v0.0.0-20190423205320-6a90982ecee2/go.mod"
	"github.com/dgryski/go-sip13 v0.0.0-20181026042036-e10d5fee7954/go.mod"
	"github.com/dustin/go-humanize v1.0.0/go.mod"
	"github.com/eknkc/amber v0.0.0-20171010120322-cdade1c07385/go.mod"
	"github.com/emersion/go-imap-appendlimit v0.0.0-20190308131241-25671c986a6a"
	"github.com/emersion/go-imap-appendlimit v0.0.0-20190308131241-25671c986a6a/go.mod"
	"github.com/emersion/go-imap-move v0.0.0-20190710073258-6e5a51a5b342"
	"github.com/emersion/go-imap-move v0.0.0-20190710073258-6e5a51a5b342/go.mod"
	"github.com/emersion/go-imap-quota v0.0.0-20210203125329-619074823f3c"
	"github.com/emersion/go-imap-quota v0.0.0-20210203125329-619074823f3c/go.mod"
	"github.com/emersion/go-imap-unselect v0.0.0-20171113212723-b985794e5f26"
	"github.com/emersion/go-imap-unselect v0.0.0-20171113212723-b985794e5f26/go.mod"
	"github.com/emersion/go-mbox v1.0.2"
	"github.com/emersion/go-mbox v1.0.2/go.mod"
	"github.com/emersion/go-sasl v0.0.0-20191210011802-430746ea8b9b/go.mod"
	"github.com/emersion/go-sasl v0.0.0-20200509203442-7bfe0ed36a21"
	"github.com/emersion/go-sasl v0.0.0-20200509203442-7bfe0ed36a21/go.mod"
	"github.com/emersion/go-smtp v0.14.0"
	"github.com/emersion/go-smtp v0.14.0/go.mod"
	"github.com/emersion/go-textwrapper v0.0.0-20200911093747-65d896831594"
	"github.com/emersion/go-textwrapper v0.0.0-20200911093747-65d896831594/go.mod"
	"github.com/emersion/go-vcard v0.0.0-20190105225839-8856043f13c5"
	"github.com/emersion/go-vcard v0.0.0-20190105225839-8856043f13c5/go.mod"
	"github.com/etcd-io/bbolt v1.3.3/go.mod"
	"github.com/fasthttp-contrib/websocket v0.0.0-20160511215533-1f3b11f56072/go.mod"
	"github.com/fatih/color v1.7.0/go.mod"
	"github.com/fatih/color v1.9.0"
	"github.com/fatih/color v1.9.0/go.mod"
	"github.com/fatih/structs v1.1.0/go.mod"
	"github.com/flynn-archive/go-shlex v0.0.0-20150515145356-3f9db97f8568"
	"github.com/flynn-archive/go-shlex v0.0.0-20150515145356-3f9db97f8568/go.mod"
	"github.com/fsnotify/fsnotify v1.4.7/go.mod"
	"github.com/gavv/httpexpect v2.0.0+incompatible/go.mod"
	"github.com/getsentry/sentry-go v0.8.0"
	"github.com/getsentry/sentry-go v0.8.0/go.mod"
	"github.com/ghodss/yaml v1.0.0/go.mod"
	"github.com/gin-contrib/sse v0.0.0-20190301062529-5545eab6dad3/go.mod"
	"github.com/gin-gonic/gin v1.4.0/go.mod"
	"github.com/go-check/check v0.0.0-20180628173108-788fd7840127/go.mod"
	"github.com/go-errors/errors v1.0.1"
	"github.com/go-errors/errors v1.0.1/go.mod"
	"github.com/go-gl/glfw v0.0.0-20190409004039-e6da0acd62b1/go.mod"
	"github.com/go-kit/kit v0.8.0/go.mod"
	"github.com/go-logfmt/logfmt v0.3.0/go.mod"
	"github.com/go-logfmt/logfmt v0.4.0/go.mod"
	"github.com/go-martini/martini v0.0.0-20170121215854-22fa46961aab/go.mod"
	"github.com/go-resty/resty/v2 v2.6.0"
	"github.com/go-resty/resty/v2 v2.6.0/go.mod"
	"github.com/go-stack/stack v1.8.0/go.mod"
	"github.com/gobwas/httphead v0.0.0-20180130184737-2c6c146eadee/go.mod"
	"github.com/gobwas/pool v0.2.0/go.mod"
	"github.com/gobwas/ws v1.0.2/go.mod"
	"github.com/gofrs/uuid v4.0.0+incompatible"
	"github.com/gofrs/uuid v4.0.0+incompatible/go.mod"
	"github.com/gogo/protobuf v1.1.1/go.mod"
	"github.com/gogo/protobuf v1.2.1/go.mod"
	"github.com/golang/glog v0.0.0-20160126235308-23def4e6c14b/go.mod"
	"github.com/golang/groupcache v0.0.0-20190129154638-5b532d6fd5ef/go.mod"
	"github.com/golang/mock v1.1.1/go.mod"
	"github.com/golang/mock v1.2.0/go.mod"
	"github.com/golang/mock v1.3.1/go.mod"
	"github.com/golang/mock v1.4.4"
	"github.com/golang/mock v1.4.4/go.mod"
	"github.com/golang/protobuf v1.2.0/go.mod"
	"github.com/golang/protobuf v1.3.1/go.mod"
	"github.com/golang/protobuf v1.3.2/go.mod"
	"github.com/gomodule/redigo v1.7.1-0.20190724094224-574c33c3df38/go.mod"
	"github.com/google/btree v0.0.0-20180813153112-4030bb1f1f0c/go.mod"
	"github.com/google/btree v1.0.0/go.mod"
	"github.com/google/go-cmp v0.2.0/go.mod"
	"github.com/google/go-cmp v0.3.0/go.mod"
	"github.com/google/go-cmp v0.4.0/go.mod"
	"github.com/google/go-cmp v0.5.1"
	"github.com/google/go-cmp v0.5.1/go.mod"
	"github.com/google/go-querystring v1.0.0/go.mod"
	"github.com/google/gofuzz v1.0.0/go.mod"
	"github.com/google/martian v2.1.0+incompatible/go.mod"
	"github.com/google/pprof v0.0.0-20181206194817-3ea8567a2e57/go.mod"
	"github.com/google/pprof v0.0.0-20190515194954-54271f7e092f/go.mod"
	"github.com/google/renameio v0.1.0/go.mod"
	"github.com/google/uuid v1.1.1"
	"github.com/google/uuid v1.1.1/go.mod"
	"github.com/googleapis/gax-go/v2 v2.0.4/go.mod"
	"github.com/googleapis/gax-go/v2 v2.0.5/go.mod"
	"github.com/gopherjs/gopherjs v0.0.0-20181017120253-0766667cb4d1/go.mod"
	"github.com/gopherjs/gopherjs v0.0.0-20190411002643-bd77b112433e/go.mod"
	"github.com/gopherjs/gopherjs v0.0.0-20190430165422-3e4dfb77656c"
	"github.com/gopherjs/gopherjs v0.0.0-20190430165422-3e4dfb77656c/go.mod"
	"github.com/gorilla/websocket v1.4.1/go.mod"
	"github.com/gorilla/websocket v1.4.2/go.mod"
	"github.com/grpc-ecosystem/go-grpc-middleware v1.0.0/go.mod"
	"github.com/grpc-ecosystem/go-grpc-prometheus v1.2.0/go.mod"
	"github.com/grpc-ecosystem/grpc-gateway v1.9.0/go.mod"
	"github.com/hashicorp/consul/api v1.1.0/go.mod"
	"github.com/hashicorp/consul/sdk v0.1.1/go.mod"
	"github.com/hashicorp/errwrap v1.0.0"
	"github.com/hashicorp/errwrap v1.0.0/go.mod"
	"github.com/hashicorp/go-cleanhttp v0.5.1/go.mod"
	"github.com/hashicorp/go-immutable-radix v1.0.0/go.mod"
	"github.com/hashicorp/go-immutable-radix v1.3.0"
	"github.com/hashicorp/go-immutable-radix v1.3.0/go.mod"
	"github.com/hashicorp/go-memdb v1.3.0"
	"github.com/hashicorp/go-memdb v1.3.0/go.mod"
	"github.com/hashicorp/go-msgpack v0.5.3/go.mod"
	"github.com/hashicorp/go-multierror v1.0.0/go.mod"
	"github.com/hashicorp/go-multierror v1.1.0"
	"github.com/hashicorp/go-multierror v1.1.0/go.mod"
	"github.com/hashicorp/go-rootcerts v1.0.0/go.mod"
	"github.com/hashicorp/go-sockaddr v1.0.0/go.mod"
	"github.com/hashicorp/go-syslog v1.0.0/go.mod"
	"github.com/hashicorp/go-uuid v1.0.0/go.mod"
	"github.com/hashicorp/go-uuid v1.0.1/go.mod"
	"github.com/hashicorp/go-uuid v1.0.2"
	"github.com/hashicorp/go-uuid v1.0.2/go.mod"
	"github.com/hashicorp/go-version v1.2.0/go.mod"
	"github.com/hashicorp/go.net v0.0.1/go.mod"
	"github.com/hashicorp/golang-lru v0.5.0/go.mod"
	"github.com/hashicorp/golang-lru v0.5.1/go.mod"
	"github.com/hashicorp/golang-lru v0.5.4"
	"github.com/hashicorp/golang-lru v0.5.4/go.mod"
	"github.com/hashicorp/hcl v1.0.0/go.mod"
	"github.com/hashicorp/logutils v1.0.0/go.mod"
	"github.com/hashicorp/mdns v1.0.0/go.mod"
	"github.com/hashicorp/memberlist v0.1.3/go.mod"
	"github.com/hashicorp/serf v0.8.2/go.mod"
	"github.com/hpcloud/tail v1.0.0/go.mod"
	"github.com/imkira/go-interpol v1.1.0/go.mod"
	"github.com/inconshreveable/mousetrap v1.0.0/go.mod"
	"github.com/iris-contrib/blackfriday v2.0.0+incompatible/go.mod"
	"github.com/iris-contrib/go.uuid v2.0.0+incompatible/go.mod"
	"github.com/iris-contrib/jade v1.1.3/go.mod"
	"github.com/iris-contrib/pongo2 v0.0.1/go.mod"
	"github.com/iris-contrib/schema v0.0.1/go.mod"
	"github.com/jaytaylor/html2text v0.0.0-20200412013138-3577fbdbcff7"
	"github.com/jaytaylor/html2text v0.0.0-20200412013138-3577fbdbcff7/go.mod"
	"github.com/jonboulle/clockwork v0.1.0/go.mod"
	"github.com/json-iterator/go v1.1.6/go.mod"
	"github.com/json-iterator/go v1.1.9/go.mod"
	"github.com/jstemmer/go-junit-report v0.0.0-20190106144839-af01ea7f8024/go.mod"
	"github.com/jtolds/gls v4.20.0+incompatible"
	"github.com/jtolds/gls v4.20.0+incompatible/go.mod"
	"github.com/julienschmidt/httprouter v1.2.0/go.mod"
	"github.com/k0kubun/colorstring v0.0.0-20150214042306-9440f1994b88/go.mod"
	"github.com/kataras/golog v0.0.10/go.mod"
	"github.com/kataras/iris/v12 v12.1.8/go.mod"
	"github.com/kataras/neffos v0.0.14/go.mod"
	"github.com/kataras/pio v0.0.2/go.mod"
	"github.com/kataras/sitemap v0.0.5/go.mod"
	"github.com/keybase/go-keychain v0.0.0-20200502122510-cda31fe0c86d"
	"github.com/keybase/go-keychain v0.0.0-20200502122510-cda31fe0c86d/go.mod"
	"github.com/keybase/go.dbus v0.0.0-20200324223359-a94be52c0b03/go.mod"
	"github.com/kisielk/errcheck v1.1.0/go.mod"
	"github.com/kisielk/gotool v1.0.0/go.mod"
	"github.com/klauspost/compress v1.8.2/go.mod"
	"github.com/klauspost/compress v1.9.7/go.mod"
	"github.com/klauspost/cpuid v1.2.1/go.mod"
	"github.com/konsorten/go-windows-terminal-sequences v1.0.1/go.mod"
	"github.com/konsorten/go-windows-terminal-sequences v1.0.2/go.mod"
	"github.com/kr/logfmt v0.0.0-20140226030751-b84e30acd515/go.mod"
	"github.com/kr/pretty v0.1.0/go.mod"
	"github.com/kr/pretty v0.2.1"
	"github.com/kr/pretty v0.2.1/go.mod"
	"github.com/kr/pty v1.1.1/go.mod"
	"github.com/kr/text v0.1.0/go.mod"
	"github.com/kr/text v0.2.0"
	"github.com/kr/text v0.2.0/go.mod"
	"github.com/labstack/echo/v4 v4.1.11/go.mod"
	"github.com/labstack/gommon v0.3.0/go.mod"
	"github.com/logrusorgru/aurora v2.0.3+incompatible"
	"github.com/logrusorgru/aurora v2.0.3+incompatible/go.mod"
	"github.com/magiconair/properties v1.8.0/go.mod"
	"github.com/magiconair/properties v1.8.1/go.mod"
	"github.com/mattn/go-colorable v0.0.9/go.mod"
	"github.com/mattn/go-colorable v0.1.2/go.mod"
	"github.com/mattn/go-colorable v0.1.4"
	"github.com/mattn/go-colorable v0.1.4/go.mod"
	"github.com/mattn/go-isatty v0.0.3/go.mod"
	"github.com/mattn/go-isatty v0.0.7/go.mod"
	"github.com/mattn/go-isatty v0.0.8/go.mod"
	"github.com/mattn/go-isatty v0.0.9/go.mod"
	"github.com/mattn/go-isatty v0.0.11"
	"github.com/mattn/go-isatty v0.0.11/go.mod"
	"github.com/mattn/go-runewidth v0.0.7/go.mod"
	"github.com/mattn/go-runewidth v0.0.9"
	"github.com/mattn/go-runewidth v0.0.9/go.mod"
	"github.com/mattn/goveralls v0.0.2/go.mod"
	"github.com/matttproud/golang_protobuf_extensions v1.0.1/go.mod"
	"github.com/mediocregopher/radix/v3 v3.4.2/go.mod"
	"github.com/microcosm-cc/bluemonday v1.0.2/go.mod"
	"github.com/miekg/dns v1.0.14/go.mod"
	"github.com/miekg/dns v1.1.41"
	"github.com/miekg/dns v1.1.41/go.mod"
	"github.com/mitchellh/cli v1.0.0/go.mod"
	"github.com/mitchellh/go-homedir v1.0.0/go.mod"
	"github.com/mitchellh/go-homedir v1.1.0/go.mod"
	"github.com/mitchellh/go-testing-interface v1.0.0/go.mod"
	"github.com/mitchellh/gox v0.4.0/go.mod"
	"github.com/mitchellh/iochan v1.0.0/go.mod"
	"github.com/mitchellh/mapstructure v0.0.0-20160808181253-ca63d7c062ee/go.mod"
	"github.com/mitchellh/mapstructure v1.1.2/go.mod"
	"github.com/modern-go/concurrent v0.0.0-20180228061459-e0a39a4cb421/go.mod"
	"github.com/modern-go/concurrent v0.0.0-20180306012644-bacd9c7ef1dd/go.mod"
	"github.com/modern-go/reflect2 v0.0.0-20180701023420-4b7aa43c6742/go.mod"
	"github.com/modern-go/reflect2 v1.0.1/go.mod"
	"github.com/moul/http2curl v1.0.0/go.mod"
	"github.com/mwitkow/go-conntrack v0.0.0-20161129095857-cc309e4a2223/go.mod"
	"github.com/nats-io/jwt v0.3.0/go.mod"
	"github.com/nats-io/nats.go v1.9.1/go.mod"
	"github.com/nats-io/nkeys v0.1.0/go.mod"
	"github.com/nats-io/nuid v1.0.1/go.mod"
	"github.com/niemeyer/pretty v0.0.0-20200227124842-a10e7caefd8e/go.mod"
	"github.com/nsf/jsondiff v0.0.0-20200515183724-f29ed568f4ce"
	"github.com/nsf/jsondiff v0.0.0-20200515183724-f29ed568f4ce/go.mod"
	"github.com/oklog/ulid v1.3.1/go.mod"
	"github.com/olekukonko/tablewriter v0.0.4"
	"github.com/olekukonko/tablewriter v0.0.4/go.mod"
	"github.com/onsi/ginkgo v1.6.0/go.mod"
	"github.com/onsi/ginkgo v1.10.3/go.mod"
	"github.com/onsi/gomega v1.7.1/go.mod"
	"github.com/pascaldekloe/goe v0.0.0-20180627143212-57f6aae5913c/go.mod"
	"github.com/pelletier/go-toml v1.2.0/go.mod"
	"github.com/pingcap/errors v0.11.4"
	"github.com/pingcap/errors v0.11.4/go.mod"
	"github.com/pkg/errors v0.8.0/go.mod"
	"github.com/pkg/errors v0.8.1/go.mod"
	"github.com/pkg/errors v0.9.1"
	"github.com/pkg/errors v0.9.1/go.mod"
	"github.com/pmezard/go-difflib v1.0.0"
	"github.com/pmezard/go-difflib v1.0.0/go.mod"
	"github.com/posener/complete v1.1.1/go.mod"
	"github.com/prometheus/client_golang v0.9.1/go.mod"
	"github.com/prometheus/client_golang v0.9.3/go.mod"
	"github.com/prometheus/client_model v0.0.0-20180712105110-5c3871d89910/go.mod"
	"github.com/prometheus/client_model v0.0.0-20190129233127-fd36f4220a90/go.mod"
	"github.com/prometheus/common v0.0.0-20181113130724-41aa239b4cce/go.mod"
	"github.com/prometheus/common v0.4.0/go.mod"
	"github.com/prometheus/procfs v0.0.0-20181005140218-185b4288413d/go.mod"
	"github.com/prometheus/procfs v0.0.0-20190507164030-5867b95ac084/go.mod"
	"github.com/prometheus/tsdb v0.7.1/go.mod"
	"github.com/rogpeppe/fastuuid v0.0.0-20150106093220-6724a57986af/go.mod"
	"github.com/rogpeppe/go-internal v1.3.0/go.mod"
	"github.com/russross/blackfriday v1.5.2"
	"github.com/russross/blackfriday v1.5.2/go.mod"
	"github.com/russross/blackfriday/v2 v2.0.1"
	"github.com/russross/blackfriday/v2 v2.0.1/go.mod"
	"github.com/ryanuber/columnize v0.0.0-20160712163229-9b3edd62028f/go.mod"
	"github.com/ryanuber/columnize v2.1.0+incompatible/go.mod"
	"github.com/schollz/closestmatch v2.1.0+incompatible/go.mod"
	"github.com/sean-/seed v0.0.0-20170313163322-e2103e2c3529/go.mod"
	"github.com/sergi/go-diff v1.0.0/go.mod"
	"github.com/shurcooL/sanitized_anchor_name v1.0.0"
	"github.com/shurcooL/sanitized_anchor_name v1.0.0/go.mod"
	"github.com/sirupsen/logrus v1.2.0/go.mod"
	"github.com/sirupsen/logrus v1.4.1/go.mod"
	"github.com/sirupsen/logrus v1.4.2/go.mod"
	"github.com/sirupsen/logrus v1.7.0"
	"github.com/sirupsen/logrus v1.7.0/go.mod"
	"github.com/skratchdot/open-golang v0.0.0-20200116055534-eef842397966"
	"github.com/skratchdot/open-golang v0.0.0-20200116055534-eef842397966/go.mod"
	"github.com/smartystreets/assertions v0.0.0-20180927180507-b2de0cb4f26d"
	"github.com/smartystreets/assertions v0.0.0-20180927180507-b2de0cb4f26d/go.mod"
	"github.com/smartystreets/goconvey v1.6.4"
	"github.com/smartystreets/goconvey v1.6.4/go.mod"
	"github.com/soheilhy/cmux v0.1.4/go.mod"
	"github.com/spaolacci/murmur3 v0.0.0-20180118202830-f09979ecbc72/go.mod"
	"github.com/spf13/afero v1.1.2/go.mod"
	"github.com/spf13/cast v1.3.0/go.mod"
	"github.com/spf13/cobra v0.0.5/go.mod"
	"github.com/spf13/cobra v1.1.1/go.mod"
	"github.com/spf13/jwalterweatherman v1.0.0/go.mod"
	"github.com/spf13/pflag v1.0.3/go.mod"
	"github.com/spf13/pflag v1.0.5"
	"github.com/spf13/pflag v1.0.5/go.mod"
	"github.com/spf13/viper v1.3.2/go.mod"
	"github.com/spf13/viper v1.7.0/go.mod"
	"github.com/ssor/bom v0.0.0-20170718123548-6386211fdfcf"
	"github.com/ssor/bom v0.0.0-20170718123548-6386211fdfcf/go.mod"
	"github.com/stretchr/objx v0.1.0/go.mod"
	"github.com/stretchr/objx v0.1.1/go.mod"
	"github.com/stretchr/objx v0.2.0"
	"github.com/stretchr/objx v0.2.0/go.mod"
	"github.com/stretchr/testify v1.2.2/go.mod"
	"github.com/stretchr/testify v1.3.0/go.mod"
	"github.com/stretchr/testify v1.4.0/go.mod"
	"github.com/stretchr/testify v1.5.1/go.mod"
	"github.com/stretchr/testify v1.6.1/go.mod"
	"github.com/stretchr/testify v1.7.0"
	"github.com/stretchr/testify v1.7.0/go.mod"
	"github.com/subosito/gotenv v1.2.0/go.mod"
	"github.com/therecipe/qt v0.0.0-20200701200531-7f61353ee73e"
	"github.com/therecipe/qt v0.0.0-20200701200531-7f61353ee73e/go.mod"
	"github.com/therecipe/qt/internal/binding/files/docs/5.12.0 v0.0.0-20200904063919-c0c124a5770d"
	"github.com/therecipe/qt/internal/binding/files/docs/5.12.0 v0.0.0-20200904063919-c0c124a5770d/go.mod"
	"github.com/therecipe/qt/internal/binding/files/docs/5.13.0 v0.0.0-20200904063919-c0c124a5770d"
	"github.com/therecipe/qt/internal/binding/files/docs/5.13.0 v0.0.0-20200904063919-c0c124a5770d/go.mod"
	"github.com/tmc/grpc-websocket-proxy v0.0.0-20190109142713-0ad062ec5ee5/go.mod"
	"github.com/ugorji/go v1.1.4/go.mod"
	"github.com/ugorji/go v1.1.7/go.mod"
	"github.com/ugorji/go/codec v0.0.0-20181204163529-d75b2dcb6bc8/go.mod"
	"github.com/ugorji/go/codec v1.1.7/go.mod"
	"github.com/urfave/cli/v2 v2.2.0"
	"github.com/urfave/cli/v2 v2.2.0/go.mod"
	"github.com/urfave/negroni v1.0.0/go.mod"
	"github.com/valyala/bytebufferpool v1.0.0/go.mod"
	"github.com/valyala/fasthttp v1.6.0/go.mod"
	"github.com/valyala/fasttemplate v1.0.1/go.mod"
	"github.com/valyala/tcplisten v0.0.0-20161114210144-ceec8f93295a/go.mod"
	"github.com/vmihailenco/msgpack/v5 v5.1.3"
	"github.com/vmihailenco/msgpack/v5 v5.1.3/go.mod"
	"github.com/vmihailenco/tagparser v0.1.2"
	"github.com/vmihailenco/tagparser v0.1.2/go.mod"
	"github.com/xeipuuv/gojsonpointer v0.0.0-20180127040702-4e3ac2762d5f/go.mod"
	"github.com/xeipuuv/gojsonreference v0.0.0-20180127040603-bd5ef7bd5415/go.mod"
	"github.com/xeipuuv/gojsonschema v1.2.0/go.mod"
	"github.com/xiang90/probing v0.0.0-20190116061207-43a291ad63a2/go.mod"
	"github.com/xordataexchange/crypt v0.0.3-0.20170626215501-b2862e3d0a77/go.mod"
	"github.com/yalp/jsonpath v0.0.0-20180802001716-5cc68e5049a0/go.mod"
	"github.com/yudai/gojsondiff v1.0.0/go.mod"
	"github.com/yudai/golcs v0.0.0-20170316035057-ecda9a501e82/go.mod"
	"github.com/yudai/pp v2.0.1+incompatible/go.mod"
	"go.etcd.io/bbolt v1.3.2/go.mod"
	"go.etcd.io/bbolt v1.3.6"
	"go.etcd.io/bbolt v1.3.6/go.mod"
	"go.opencensus.io v0.21.0/go.mod"
	"go.opencensus.io v0.22.0/go.mod"
	"go.uber.org/atomic v1.4.0/go.mod"
	"go.uber.org/multierr v1.1.0/go.mod"
	"go.uber.org/zap v1.10.0/go.mod"
	"golang.org/x/crypto v0.0.0-20180904163835-0709b304e793/go.mod"
	"golang.org/x/crypto v0.0.0-20181029021203-45a5f77698d3/go.mod"
	"golang.org/x/crypto v0.0.0-20181203042331-505ab145d0a9/go.mod"
	"golang.org/x/crypto v0.0.0-20190308221718-c2843e01d9a2/go.mod"
	"golang.org/x/crypto v0.0.0-20190418165655-df01cb2cc480/go.mod"
	"golang.org/x/crypto v0.0.0-20190510104115-cbcb75029529/go.mod"
	"golang.org/x/crypto v0.0.0-20190605123033-f99c8df09eb5/go.mod"
	"golang.org/x/crypto v0.0.0-20190701094942-4def268fd1a4/go.mod"
	"golang.org/x/crypto v0.0.0-20191011191535-87dc89f01550/go.mod"
	"golang.org/x/crypto v0.0.0-20191227163750-53104e6ec876/go.mod"
	"golang.org/x/crypto v0.0.0-20200323165209-0ec3e9974c59/go.mod"
	"golang.org/x/crypto v0.0.0-20210322153248-0c34fe9e7dc2"
	"golang.org/x/crypto v0.0.0-20210322153248-0c34fe9e7dc2/go.mod"
	"golang.org/x/exp v0.0.0-20190121172915-509febef88a4/go.mod"
	"golang.org/x/exp v0.0.0-20190306152737-a1d7652674e8/go.mod"
	"golang.org/x/exp v0.0.0-20190510132918-efd6b22b2522/go.mod"
	"golang.org/x/exp v0.0.0-20190731235908-ec7cb31e5a56/go.mod"
	"golang.org/x/exp v0.0.0-20190829153037-c13cbed26979/go.mod"
	"golang.org/x/exp v0.0.0-20191030013958-a1ab85dbe136/go.mod"
	"golang.org/x/image v0.0.0-20190227222117-0694c2d4d067/go.mod"
	"golang.org/x/image v0.0.0-20190802002840-cff245a6509b/go.mod"
	"golang.org/x/lint v0.0.0-20181026193005-c67002cb31c3/go.mod"
	"golang.org/x/lint v0.0.0-20190227174305-5b3e6a55c961/go.mod"
	"golang.org/x/lint v0.0.0-20190301231843-5614ed5bae6f/go.mod"
	"golang.org/x/lint v0.0.0-20190313153728-d0100b6bd8b3/go.mod"
	"golang.org/x/lint v0.0.0-20190409202823-959b441ac422/go.mod"
	"golang.org/x/lint v0.0.0-20190909230951-414d861bb4ac/go.mod"
	"golang.org/x/lint v0.0.0-20190930215403-16217165b5de/go.mod"
	"golang.org/x/mobile v0.0.0-20190312151609-d3739f865fa6/go.mod"
	"golang.org/x/mobile v0.0.0-20190719004257-d2bd2a29d028/go.mod"
	"golang.org/x/mobile v0.0.0-20200801112145-973feb4309de/go.mod"
	"golang.org/x/mod v0.0.0-20190513183733-4bf6d317e70e/go.mod"
	"golang.org/x/mod v0.1.0/go.mod"
	"golang.org/x/mod v0.1.1-0.20191105210325-c90efee705ee/go.mod"
	"golang.org/x/mod v0.1.1-0.20191209134235-331c550502dd/go.mod"
	"golang.org/x/net v0.0.0-20180218175443-cbe0f9307d01/go.mod"
	"golang.org/x/net v0.0.0-20180724234803-3673e40ba225/go.mod"
	"golang.org/x/net v0.0.0-20180826012351-8a410e7b638d/go.mod"
	"golang.org/x/net v0.0.0-20180906233101-161cd47e91fd/go.mod"
	"golang.org/x/net v0.0.0-20181023162649-9b4f9f5ad519/go.mod"
	"golang.org/x/net v0.0.0-20181114220301-adae6a3d119a/go.mod"
	"golang.org/x/net v0.0.0-20181201002055-351d144fa1fc/go.mod"
	"golang.org/x/net v0.0.0-20181220203305-927f97764cc3/go.mod"
	"golang.org/x/net v0.0.0-20190108225652-1e06a53dbb7e/go.mod"
	"golang.org/x/net v0.0.0-20190213061140-3a22650c66bd/go.mod"
	"golang.org/x/net v0.0.0-20190311183353-d8887717615a/go.mod"
	"golang.org/x/net v0.0.0-20190327091125-710a502c58a2/go.mod"
	"golang.org/x/net v0.0.0-20190404232315-eb5bcb51f2a3/go.mod"
	"golang.org/x/net v0.0.0-20190420063019-afa5a82059c6/go.mod"
	"golang.org/x/net v0.0.0-20190501004415-9ce7a6920f09/go.mod"
	"golang.org/x/net v0.0.0-20190503192946-f4e77d36d62c/go.mod"
	"golang.org/x/net v0.0.0-20190603091049-60506f45cf65/go.mod"
	"golang.org/x/net v0.0.0-20190620200207-3b0461eec859/go.mod"
	"golang.org/x/net v0.0.0-20190827160401-ba9fcec4b297/go.mod"
	"golang.org/x/net v0.0.0-20191209160850-c0dbc17a3553/go.mod"
	"golang.org/x/net v0.0.0-20200202094626-16171245cfb2/go.mod"
	"golang.org/x/net v0.0.0-20210226172049-e18ecbb05110/go.mod"
	"golang.org/x/net v0.0.0-20210405180319-a5a99cb37ef4"
	"golang.org/x/net v0.0.0-20210405180319-a5a99cb37ef4/go.mod"
	"golang.org/x/oauth2 v0.0.0-20180821212333-d2e6202438be/go.mod"
	"golang.org/x/oauth2 v0.0.0-20190226205417-e64efc72b421/go.mod"
	"golang.org/x/oauth2 v0.0.0-20190604053449-0f29369cfe45/go.mod"
	"golang.org/x/sync v0.0.0-20180314180146-1d60e4601c6f/go.mod"
	"golang.org/x/sync v0.0.0-20181108010431-42b317875d0f/go.mod"
	"golang.org/x/sync v0.0.0-20181221193216-37e7f081c4d4/go.mod"
	"golang.org/x/sync v0.0.0-20190227155943-e225da77a7e6/go.mod"
	"golang.org/x/sync v0.0.0-20190423024810-112230192c58/go.mod"
	"golang.org/x/sync v0.0.0-20190911185100-cd5d95a43a6e/go.mod"
	"golang.org/x/sync v0.0.0-20210220032951-036812b2e83c"
	"golang.org/x/sync v0.0.0-20210220032951-036812b2e83c/go.mod"
	"golang.org/x/sys v0.0.0-20180823144017-11551d06cbcc/go.mod"
	"golang.org/x/sys v0.0.0-20180830151530-49385e6e1522/go.mod"
	"golang.org/x/sys v0.0.0-20180905080454-ebe1bf3edb33/go.mod"
	"golang.org/x/sys v0.0.0-20180909124046-d0be0721c37e/go.mod"
	"golang.org/x/sys v0.0.0-20181026203630-95b1ffbd15a5/go.mod"
	"golang.org/x/sys v0.0.0-20181107165924-66b7b1311ac8/go.mod"
	"golang.org/x/sys v0.0.0-20181116152217-5ac8a444bdc5/go.mod"
	"golang.org/x/sys v0.0.0-20181205085412-a5c9d58dba9a/go.mod"
	"golang.org/x/sys v0.0.0-20190215142949-d0b11bdaac8a/go.mod"
	"golang.org/x/sys v0.0.0-20190222072716-a9d3bda3a223/go.mod"
	"golang.org/x/sys v0.0.0-20190312061237-fead79001313/go.mod"
	"golang.org/x/sys v0.0.0-20190403152447-81d4e9dc473e/go.mod"
	"golang.org/x/sys v0.0.0-20190412213103-97732733099d/go.mod"
	"golang.org/x/sys v0.0.0-20190419153524-e8e3143a4f4a/go.mod"
	"golang.org/x/sys v0.0.0-20190422165155-953cdadca894/go.mod"
	"golang.org/x/sys v0.0.0-20190502145724-3ef323f4f1fd/go.mod"
	"golang.org/x/sys v0.0.0-20190507160741-ecd444e8653b/go.mod"
	"golang.org/x/sys v0.0.0-20190606165138-5da285871e9c/go.mod"
	"golang.org/x/sys v0.0.0-20190624142023-c5567b49c5d0/go.mod"
	"golang.org/x/sys v0.0.0-20190626221950-04f50cda93cb/go.mod"
	"golang.org/x/sys v0.0.0-20190813064441-fde4db37ae7a/go.mod"
	"golang.org/x/sys v0.0.0-20191026070338-33540a1f6037/go.mod"
	"golang.org/x/sys v0.0.0-20200202164722-d101bd2416d5/go.mod"
	"golang.org/x/sys v0.0.0-20200923182605-d9f96fdee20d/go.mod"
	"golang.org/x/sys v0.0.0-20201119102817-f84b799fce68/go.mod"
	"golang.org/x/sys v0.0.0-20210303074136-134d130e1a04/go.mod"
	"golang.org/x/sys v0.0.0-20210330210617-4fbd30eecc44"
	"golang.org/x/sys v0.0.0-20210330210617-4fbd30eecc44/go.mod"
	"golang.org/x/term v0.0.0-20201126162022-7de9c90e9dd1/go.mod"
	"golang.org/x/text v0.3.0/go.mod"
	"golang.org/x/text v0.3.1-0.20180807135948-17ff2d5776d2/go.mod"
	"golang.org/x/text v0.3.2/go.mod"
	"golang.org/x/text v0.3.3/go.mod"
	"golang.org/x/text v0.3.5-0.20201125200606-c27b9fd57aec"
	"golang.org/x/text v0.3.5-0.20201125200606-c27b9fd57aec/go.mod"
	"golang.org/x/time v0.0.0-20181108054448-85acf8d2951c/go.mod"
	"golang.org/x/time v0.0.0-20190308202827-9d24e82272b4/go.mod"
	"golang.org/x/tools v0.0.0-20180221164845-07fd8470d635/go.mod"
	"golang.org/x/tools v0.0.0-20180917221912-90fa682c2a6e/go.mod"
	"golang.org/x/tools v0.0.0-20181221001348-537d06c36207/go.mod"
	"golang.org/x/tools v0.0.0-20190114222345-bf090417da8b/go.mod"
	"golang.org/x/tools v0.0.0-20190226205152-f727befe758c/go.mod"
	"golang.org/x/tools v0.0.0-20190311212946-11955173bddd/go.mod"
	"golang.org/x/tools v0.0.0-20190312151545-0bb0c0a6e846/go.mod"
	"golang.org/x/tools v0.0.0-20190312170243-e65039ee4138/go.mod"
	"golang.org/x/tools v0.0.0-20190327201419-c70d86f8b7cf/go.mod"
	"golang.org/x/tools v0.0.0-20190328211700-ab21143f2384/go.mod"
	"golang.org/x/tools v0.0.0-20190420181800-aa740d480789/go.mod"
	"golang.org/x/tools v0.0.0-20190425150028-36563e24a262/go.mod"
	"golang.org/x/tools v0.0.0-20190506145303-2d16b83fe98c/go.mod"
	"golang.org/x/tools v0.0.0-20190606124116-d0a3d012864b/go.mod"
	"golang.org/x/tools v0.0.0-20190621195816-6e04913cbbac/go.mod"
	"golang.org/x/tools v0.0.0-20190628153133-6cdbf07be9d0/go.mod"
	"golang.org/x/tools v0.0.0-20190816200558-6889da9d5479/go.mod"
	"golang.org/x/tools v0.0.0-20190911174233-4f2ddba30aff/go.mod"
	"golang.org/x/tools v0.0.0-20191012152004-8de300cfc20a/go.mod"
	"golang.org/x/tools v0.0.0-20191112195655-aa38f8e97acc/go.mod"
	"golang.org/x/tools v0.0.0-20191119224855-298f0cb1881e/go.mod"
	"golang.org/x/tools v0.0.0-20200117012304-6edc0a871e69"
	"golang.org/x/tools v0.0.0-20200117012304-6edc0a871e69/go.mod"
	"golang.org/x/xerrors v0.0.0-20190717185122-a985d3407aa7/go.mod"
	"golang.org/x/xerrors v0.0.0-20191011141410-1b5146add898/go.mod"
	"golang.org/x/xerrors v0.0.0-20191204190536-9bdfabe68543"
	"golang.org/x/xerrors v0.0.0-20191204190536-9bdfabe68543/go.mod"
	"google.golang.org/api v0.4.0/go.mod"
	"google.golang.org/api v0.7.0/go.mod"
	"google.golang.org/api v0.8.0/go.mod"
	"google.golang.org/api v0.9.0/go.mod"
	"google.golang.org/api v0.13.0/go.mod"
	"google.golang.org/appengine v1.1.0/go.mod"
	"google.golang.org/appengine v1.4.0/go.mod"
	"google.golang.org/appengine v1.5.0/go.mod"
	"google.golang.org/appengine v1.6.1/go.mod"
	"google.golang.org/genproto v0.0.0-20180817151627-c66870c02cf8/go.mod"
	"google.golang.org/genproto v0.0.0-20190307195333-5fe7a883aa19/go.mod"
	"google.golang.org/genproto v0.0.0-20190418145605-e7d98fc518a7/go.mod"
	"google.golang.org/genproto v0.0.0-20190425155659-357c62f0e4bb/go.mod"
	"google.golang.org/genproto v0.0.0-20190502173448-54afdca5d873/go.mod"
	"google.golang.org/genproto v0.0.0-20190801165951-fa694d86fc64/go.mod"
	"google.golang.org/genproto v0.0.0-20190819201941-24fa4b261c55/go.mod"
	"google.golang.org/genproto v0.0.0-20190911173649-1774047e7e51/go.mod"
	"google.golang.org/genproto v0.0.0-20191108220845-16a3f7862a1a/go.mod"
	"google.golang.org/grpc v1.19.0/go.mod"
	"google.golang.org/grpc v1.20.1/go.mod"
	"google.golang.org/grpc v1.21.1/go.mod"
	"gopkg.in/alecthomas/kingpin.v2 v2.2.6/go.mod"
	"gopkg.in/check.v1 v0.0.0-20161208181325-20d25e280405/go.mod"
	"gopkg.in/check.v1 v1.0.0-20180628173108-788fd7840127/go.mod"
	"gopkg.in/check.v1 v1.0.0-20200227125254-8fa46927fb4f/go.mod"
	"gopkg.in/check.v1 v1.0.0-20201130134442-10cb98267c6c"
	"gopkg.in/check.v1 v1.0.0-20201130134442-10cb98267c6c/go.mod"
	"gopkg.in/errgo.v2 v2.1.0/go.mod"
	"gopkg.in/fsnotify.v1 v1.4.7/go.mod"
	"gopkg.in/go-playground/assert.v1 v1.2.1/go.mod"
	"gopkg.in/go-playground/validator.v8 v8.18.2/go.mod"
	"gopkg.in/ini.v1 v1.51.0/go.mod"
	"gopkg.in/ini.v1 v1.51.1/go.mod"
	"gopkg.in/mgo.v2 v2.0.0-20180705113604-9856a29383ce/go.mod"
	"gopkg.in/resty.v1 v1.12.0/go.mod"
	"gopkg.in/tomb.v1 v1.0.0-20141024135613-dd632973f1e7/go.mod"
	"gopkg.in/yaml.v2 v2.0.0-20170812160011-eb3733d160e7/go.mod"
	"gopkg.in/yaml.v2 v2.2.1/go.mod"
	"gopkg.in/yaml.v2 v2.2.2/go.mod"
	"gopkg.in/yaml.v2 v2.2.4/go.mod"
	"gopkg.in/yaml.v2 v2.2.8/go.mod"
	"gopkg.in/yaml.v3 v3.0.0-20191120175047-4206685974f2/go.mod"
	"gopkg.in/yaml.v3 v3.0.0-20200313102051-9f266ea9e77c/go.mod"
	"gopkg.in/yaml.v3 v3.0.0-20200615113413-eeeca48fe776"
	"gopkg.in/yaml.v3 v3.0.0-20200615113413-eeeca48fe776/go.mod"
	"honnef.co/go/tools v0.0.0-20190102054323-c2f93a96b099/go.mod"
	"honnef.co/go/tools v0.0.0-20190106161140-3f1c8253044a/go.mod"
	"honnef.co/go/tools v0.0.0-20190418001031-e561f6794a2a/go.mod"
	"honnef.co/go/tools v0.0.1-2019.2.3/go.mod"
	"rsc.io/binaryregexp v0.2.0/go.mod"
)

go-module_set_globals

MY_PN="proton-bridge"
MY_P="${MY_PN}-${PV}"

DESCRIPTION="Serves ProtonMail to IMAP/SMTP clients"
HOMEPAGE="https://protonmail.com/bridge/ https://github.com/ProtonMail/proton-bridge/"
SRC_URI="https://github.com/ProtonMail/proton-bridge/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz
	${EGO_SUM_SRC_URI}"

LICENSE="Apache-2.0 BSD BSD-2 GPL-3+ ISC LGPL-3+ MIT MPL-2.0 Unlicense"
SLOT="0"
KEYWORDS="~amd64"
IUSE="gui"

# Some of the tests fail without access to a keyring service
RESTRICT="test"

RDEPEND="app-crypt/libsecret"
DEPEND="${RDEPEND}"

S="${WORKDIR}"/${MY_P}

src_prepare() {
	xdg_environment_reset
	default
}

src_compile() {
	if use gui; then
		emake \
			QT_DOC_DIR="/usr/share/qt5-doc" \
			QT_PKG_CONFIG=true \
			build
	else
		emake build-nogui
	fi
}

src_test() {
	emake test
}

src_install() {
	exeinto /usr/bin
	newexe proton-bridge ${PN}

	systemd_douserunit "${FILESDIR}"/${PN}.service

	# FIXME: USE=gui will probably need more files

	einstalldocs
}

pkg_postinst() {
	use gui && xdg_icon_cache_update
}

pkg_postrm() {
	use gui && xdg_icon_cache_update
}
