# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI="7"

TEXLIVE_MODULE_CONTENTS="aaai-named aichej ajl amsrefs annotate apacite apalike2 archaeologie authordate beebe besjournals bestpapers bib2gls bibarts biber bibexport bibhtml  biblatex-abnt biblatex-ajc2020unofficial biblatex-anonymous biblatex-apa biblatex-apa6 biblatex-archaeology biblatex-arthistory-bonn biblatex-bath biblatex-bookinarticle biblatex-bookinother biblatex-bwl biblatex-caspervector biblatex-chem biblatex-chicago biblatex-claves biblatex-dw biblatex-enc biblatex-ext biblatex-fiwi biblatex-gb7714-2015 biblatex-german-legal biblatex-gost biblatex-historian biblatex-ieee biblatex-ijsra biblatex-iso690 biblatex-jura2 biblatex-juradiss biblatex-license biblatex-lni biblatex-luh-ipw biblatex-manuscripts-philology biblatex-mla biblatex-morenames biblatex-multiple-dm biblatex-musuos biblatex-nature biblatex-nejm biblatex-nottsclassic biblatex-opcit-booktitle biblatex-oxref biblatex-philosophy biblatex-phys biblatex-publist biblatex-realauthor biblatex-sbl biblatex-science biblatex-shortfields biblatex-socialscienceshuberlin biblatex-software biblatex-source-division biblatex-subseries biblatex-swiss-legal biblatex-trad biblatex-true-citepages-omit biblatex-unified biblatex-vancouver biblatex2bibitem biblist bibtexperllibs bibtopic bibtopicprefix bibunits biolett-bst bookdb breakcites cell chbibref chicago chicagoa chicago-annote chembst chscite citeall citeref collref compactbib crossrefware custom-bib din1505 dk-bib doipubmed ecobiblatex econ-bst economic fbs figbib footbib francais-bst gbt7714 geschichtsfrkl harvard harvmac historische-zeitschrift icite ietfbibs ijqc inlinebib iopart-num is-bst jbact jmb jneurosci jurabib ksfh_nat ltb2bib listbib logreq luabibentry margbib multibib multibibliography munich nar nmbib notes2bib notex-bst oscola perception plainyr pnas2009 rsc showtags sort-by-letters splitbib turabian-formatting uni-wtal-ger uni-wtal-lin urlbst usebib vak windycity xcite zootaxa-bst collection-bibtexextra
"
TEXLIVE_MODULE_DOC_CONTENTS="amsrefs.doc apacite.doc archaeologie.doc authordate.doc besjournals.doc bestpapers.doc bib2gls.doc bibarts.doc biber.doc bibexport.doc bibhtml.doc biblatex-abnt.doc biblatex-ajc2020unofficial.doc biblatex-anonymous.doc biblatex-apa.doc biblatex-apa6.doc biblatex-archaeology.doc biblatex-arthistory-bonn.doc biblatex-bath.doc biblatex-bookinarticle.doc biblatex-bookinother.doc biblatex-bwl.doc biblatex-caspervector.doc biblatex-chem.doc biblatex-chicago.doc biblatex-claves.doc biblatex-dw.doc biblatex-enc.doc biblatex-ext.doc biblatex-fiwi.doc biblatex-gb7714-2015.doc biblatex-german-legal.doc biblatex-gost.doc biblatex-historian.doc biblatex-ieee.doc biblatex-ijsra.doc biblatex-iso690.doc biblatex-jura2.doc biblatex-juradiss.doc biblatex-license.doc biblatex-lni.doc biblatex-luh-ipw.doc biblatex-manuscripts-philology.doc biblatex-mla.doc biblatex-morenames.doc biblatex-multiple-dm.doc biblatex-musuos.doc biblatex-nature.doc biblatex-nejm.doc biblatex-nottsclassic.doc biblatex-opcit-booktitle.doc biblatex-oxref.doc biblatex-philosophy.doc biblatex-phys.doc biblatex-publist.doc biblatex-realauthor.doc biblatex-sbl.doc biblatex-science.doc biblatex-shortfields.doc biblatex-socialscienceshuberlin.doc biblatex-software.doc biblatex-source-division.doc biblatex-subseries.doc biblatex-swiss-legal.doc biblatex-trad.doc biblatex-true-citepages-omit.doc biblatex-unified.doc biblatex-vancouver.doc biblatex2bibitem.doc biblist.doc bibtopic.doc bibtopicprefix.doc bibunits.doc biolett-bst.doc bookdb.doc breakcites.doc cell.doc chbibref.doc chicago-annote.doc chembst.doc chscite.doc citeall.doc citeref.doc collref.doc crossrefware.doc custom-bib.doc din1505.doc dk-bib.doc doipubmed.doc ecobiblatex.doc econ-bst.doc economic.doc figbib.doc footbib.doc francais-bst.doc gbt7714.doc geschichtsfrkl.doc harvard.doc harvmac.doc historische-zeitschrift.doc icite.doc ietfbibs.doc ijqc.doc inlinebib.doc iopart-num.doc is-bst.doc jneurosci.doc jurabib.doc ltb2bib.doc listbib.doc logreq.doc luabibentry.doc margbib.doc multibib.doc multibibliography.doc munich.doc nmbib.doc notes2bib.doc oscola.doc perception.doc rsc.doc showtags.doc sort-by-letters.doc splitbib.doc turabian-formatting.doc uni-wtal-ger.doc uni-wtal-lin.doc urlbst.doc usebib.doc vak.doc windycity.doc xcite.doc zootaxa-bst.doc "
TEXLIVE_MODULE_SRC_CONTENTS="amsrefs.source apacite.source archaeologie.source bib2gls.source bibarts.source biber.source bibexport.source biblatex-archaeology.source biblatex-bath.source biblatex-nejm.source biblatex-oxref.source biblatex-philosophy.source biblatex-software.source bibtexperllibs.source bibtopic.source bibtopicprefix.source bibunits.source chembst.source chscite.source collref.source custom-bib.source dk-bib.source doipubmed.source footbib.source gbt7714.source geschichtsfrkl.source harvard.source icite.source jurabib.source ltb2bib.source listbib.source luabibentry.source margbib.source multibib.source multibibliography.source nmbib.source notes2bib.source rsc.source splitbib.source urlbst.source usebib.source xcite.source "
inherit  texlive-module
DESCRIPTION="TeXLive BibTeX additional styles"

LICENSE=" Artistic-2 GPL-2"
SLOT="0"
KEYWORDS="~alpha amd64 arm arm64 hppa ~ia64 ~loong ~mips ppc ppc64 ~riscv ~s390 sparc x86 ~amd64-linux ~x86-linux ~ppc-macos ~x64-macos ~sparc-solaris ~x64-solaris"
IUSE=""
DEPEND=">=dev-texlive/texlive-latex-2021
>=dev-texlive/texlive-latex-2019
"
RDEPEND="${DEPEND} "
TEXLIVE_MODULE_BINSCRIPTS="
	texmf-dist/scripts/bibexport/bibexport.sh
	texmf-dist/scripts/urlbst/urlbst
	texmf-dist/scripts/listbib/listbib
	texmf-dist/scripts/multibibliography/multibibliography.pl
	texmf-dist/scripts/crossrefware/ltx2crossrefxml.pl
	texmf-dist/scripts/crossrefware/bibzbladd.pl
	texmf-dist/scripts/crossrefware/bibdoiadd.pl
"
