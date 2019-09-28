# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI="7"

TEXLIVE_MODULE_CONTENTS="12many SIstyle SIunits alg algobox algorithm2e algorithmicx algorithms aligned-overset amstex apxproof autobreak axodraw2 backnaur begriff binomexp biocon bitpattern bohr boldtensors bosisio bpchem bropd bussproofs bussproofs-extra bytefield calculation cascade ccfonts chemarrow chemcompounds chemcono chemexec chemformula chemgreek chemmacros chemnum chemschemex chemsec chemstyle clrscode clrscode3e commath complexity computational-complexity concmath concrete conteq correctmathalign cryptocode delim delimseasy delimset diffcoeff digiconfigs dijkstra drawmatrix drawstack dyntree ebproof econometrics eltex emf endiagram engtlc eqexpl eqnarray eqnnumwarn extarrows extpfeil faktor fascicules fnspe fouridx functan galois gastex gene-logic ghsystem gotoh grundgesetze gu hep hepnames hepparticles hepthesis hepunits includernw interval ionumbers isomath jkmath karnaugh karnaugh-map karnaughmap kvmap logicproof longdivision lpform lplfitch lstbayes mathcommand mathcomp mathfixs mathpartir mathpunctspace matlab-prettifier mattens memorygraphs mgltex mhchem mhequ miller mismath multiobjective mychemistry natded nath nicematrix nuc nucleardata objectz oplotsymbl ot-tableau oubraces perfectcut physics pm-isomath polexpr prftree proba proof-at-the-end prooftrees pseudocode pythonhighlight qsharp rank-2-roots rec-thy revquantum ribbonproofs rmathbr sasnrdisplay sciposter sclang-prettifier scratchx sesamanuel sfg shuffle simpler-wick simplewick siunitx skmath spalign stanli statex statex2 statistics statistik statmath steinmetz stmaryrd structmech struktex substances subsupscripts subtext susy syllogism sympytexpackage synproof t-angles tablor tensor tex-ewd textgreek textopo thmbox turnstile ulqda unitsdef venn witharrows xymtex yhmath youngtab ytableau collection-mathscience
"
TEXLIVE_MODULE_DOC_CONTENTS="12many.doc SIstyle.doc SIunits.doc alg.doc algobox.doc algorithm2e.doc algorithmicx.doc algorithms.doc aligned-overset.doc amstex.doc apxproof.doc autobreak.doc axodraw2.doc backnaur.doc begriff.doc binomexp.doc biocon.doc bitpattern.doc bohr.doc boldtensors.doc bosisio.doc bpchem.doc bropd.doc bussproofs.doc bussproofs-extra.doc bytefield.doc calculation.doc cascade.doc ccfonts.doc chemarrow.doc chemcompounds.doc chemcono.doc chemexec.doc chemformula.doc chemgreek.doc chemmacros.doc chemnum.doc chemschemex.doc chemsec.doc chemstyle.doc clrscode.doc clrscode3e.doc commath.doc complexity.doc computational-complexity.doc concmath.doc concrete.doc conteq.doc correctmathalign.doc cryptocode.doc delim.doc delimseasy.doc delimset.doc diffcoeff.doc digiconfigs.doc dijkstra.doc drawmatrix.doc drawstack.doc dyntree.doc ebproof.doc econometrics.doc eltex.doc emf.doc endiagram.doc engtlc.doc eqexpl.doc eqnarray.doc eqnnumwarn.doc extarrows.doc extpfeil.doc faktor.doc fascicules.doc fnspe.doc fouridx.doc functan.doc galois.doc gastex.doc gene-logic.doc ghsystem.doc gotoh.doc grundgesetze.doc gu.doc hep.doc hepnames.doc hepparticles.doc hepthesis.doc hepunits.doc includernw.doc interval.doc ionumbers.doc isomath.doc jkmath.doc karnaugh.doc karnaugh-map.doc karnaughmap.doc kvmap.doc logicproof.doc longdivision.doc lpform.doc lplfitch.doc lstbayes.doc mathcommand.doc mathcomp.doc mathfixs.doc mathpartir.doc mathpunctspace.doc matlab-prettifier.doc mattens.doc memorygraphs.doc mgltex.doc mhchem.doc mhequ.doc miller.doc mismath.doc multiobjective.doc mychemistry.doc natded.doc nath.doc nicematrix.doc nuc.doc nucleardata.doc objectz.doc oplotsymbl.doc ot-tableau.doc oubraces.doc perfectcut.doc physics.doc pm-isomath.doc polexpr.doc prftree.doc proba.doc proof-at-the-end.doc prooftrees.doc pseudocode.doc pythonhighlight.doc qsharp.doc rank-2-roots.doc rec-thy.doc revquantum.doc ribbonproofs.doc rmathbr.doc sasnrdisplay.doc sciposter.doc sclang-prettifier.doc scratchx.doc sesamanuel.doc sfg.doc shuffle.doc simpler-wick.doc simplewick.doc siunitx.doc skmath.doc spalign.doc stanli.doc statex.doc statex2.doc statistics.doc statistik.doc statmath.doc steinmetz.doc stmaryrd.doc structmech.doc struktex.doc substances.doc subsupscripts.doc subtext.doc susy.doc syllogism.doc sympytexpackage.doc synproof.doc t-angles.doc tablor.doc tensor.doc tex-ewd.doc textgreek.doc textopo.doc thmbox.doc turnstile.doc ulqda.doc unitsdef.doc venn.doc witharrows.doc xymtex.doc yhmath.doc youngtab.doc ytableau.doc "
TEXLIVE_MODULE_SRC_CONTENTS="12many.source SIstyle.source SIunits.source alg.source algobox.source algorithms.source aligned-overset.source apxproof.source autobreak.source axodraw2.source backnaur.source binomexp.source bitpattern.source bosisio.source bpchem.source bropd.source bussproofs-extra.source bytefield.source calculation.source cascade.source ccfonts.source chemarrow.source chemcompounds.source chemschemex.source chemsec.source chemstyle.source computational-complexity.source concmath.source conteq.source delim.source delimset.source drawmatrix.source dyntree.source eqnarray.source extpfeil.source faktor.source fascicules.source fouridx.source functan.source galois.source gotoh.source grundgesetze.source ionumbers.source karnaugh-map.source karnaughmap.source kvmap.source logicproof.source lplfitch.source lstbayes.source mathcommand.source mathcomp.source mathfixs.source mathpartir.source matlab-prettifier.source mattens.source mgltex.source miller.source mismath.source multiobjective.source nicematrix.source nucleardata.source objectz.source pm-isomath.source proba.source proof-at-the-end.source qsharp.source revquantum.source rmathbr.source sclang-prettifier.source sesamanuel.source shuffle.source simplewick.source siunitx.source skmath.source spalign.source statistics.source statistik.source statmath.source steinmetz.source stmaryrd.source struktex.source sympytexpackage.source tensor.source textgreek.source textopo.source thmbox.source turnstile.source ulqda.source unitsdef.source witharrows.source xymtex.source yhmath.source youngtab.source ytableau.source "
inherit  texlive-module
DESCRIPTION="TeXLive Mathematics, natural sciences, computer science packages"

LICENSE=" BSD BSD-2 CC-BY-SA-4.0 GPL-1 GPL-2 GPL-3 GPL-3+ "
SLOT="0"
KEYWORDS="~alpha amd64 ~arm ~arm64 ~hppa ia64 ~mips ~ppc ppc64 ~s390 ~sh ~sparc x86 ~amd64-fbsd ~x86-fbsd ~amd64-linux ~x86-linux ~ppc-macos ~x64-macos ~x86-macos ~sparc-solaris ~x64-solaris ~x86-solaris"
IUSE=""
DEPEND=">=dev-texlive/texlive-fontsrecommended-2019
>=dev-texlive/texlive-latex-2019
!<dev-texlive/texlive-latexextra-2017
!dev-texlive/texlive-mathextra
!dev-texlive/texlive-science
!=dev-texlive/texlive-latexextra-2017*
"
RDEPEND="${DEPEND} dev-texlive/texlive-pstricks
"
TEXLIVE_MODULE_BINSCRIPTS="texmf-dist/scripts/ulqda/ulqda.pl"
