import Mathlib

/-!
# Geometric representation categories and coherent local transport: target signatures

This file is not the roadmap: the roadmap is `README.md`. This file states the roadmap's headline
theorems against the pinned Mathlib and Tau Ceti, each with `sorry`, as far as they are statable
there.

The headline results of the roadmap are:

* the coherent action of the loop group `G(ℂ((t)))` on each critical fibre `Ccrit(p)`, and the
  family of these fibres over the action groupoid of `G(ℂ((t))) ⋊ Aut(ℂ[[t]])` on opers
  (README §§3.2–3.4);
* objectwise congruence invariance of finitely generated critical-level smooth modules, with the
  family `Q_M` separating coherent weak equivariance from rational integration (README §3.5);
* the biequivalence between equivariant groupoid lifts and normalized transport data on the
  prescribed fibres (README §4.2);
* descent of a lift along the equivalence from the groupoid of opers and isomorphisms of their
  underlying local systems to the groupoid of local systems on the punctured disc (README §5.1);
* the map `θ : Ω¹_cont(Z) → OutDer_cont(A)` for the critical completed enveloping algebra `A` and its
  centre `Z`, with anchor the Poisson bracket, the Lie–Rinehart identities, and the induced map
  `Ω¹_cont(Z) → Ext¹(M, M)` (README §5.2).

None of them is statable at the pins, and nothing is stated in their place:

* the critical fibres and their symmetries need the loop-group action on the completed algebra
  (AffineLieAlgebras A4.2), the Feigin–Frenkel isomorphism of its centre with the functions on opers
  (AffineLieAlgebras A8) and the opers with their evaluation characters (FormalConnectionsOpers §5.2),
  none of which is at the pins; the completed algebra itself
  (`TauCeti.CurrentAlgebra.CompletedEnveloping`) and its coordinate automorphisms
  (`TauCeti.CurrentAlgebra.coordinateCompletedEnvelopingAut`) are at the pins;
* the congruence invariance theorem needs the same loop-group action and the congruence subgroups
  of FormalConnectionsOpers §3.1;
* the biequivalence needs a notion of biequivalence of bicategories, which Mathlib lacks, and the
  morphisms of normalized transport data, which the pinned Tau Ceti lacks: it has
  `TauCeti.EquivariantGroupoidLift.NormalizedTransport` only as objects, while the lifts form the
  bicategory `TauCeti.EquivariantGroupoidLift.instBicategory`;
* descent needs the groupoid `IsomOp` and the gauge groupoid of local systems on the punctured disc
  (FormalConnectionsOpers §§3.4, 8.1);
* the map `θ` needs the deformation of the critical level with its section, divided commutators and
  Poisson bracket (AffineLieAlgebras A6.3) and the continuous cotangent module of the centre through
  the Feigin–Frenkel chart (AffineLieAlgebras A8.1, FormalConnectionsOpers §5.2); its target
  `TauCeti.ContinuousOuterDerivation` and the class map `TauCeti.DerivationExtension.outerExtClass`
  are at the pins.

The critical categorical-lift conjecture (README §4.4) and the formal refinement question
(README §5.3) are conjectures, stated in the README as precise types and never as theorems; their
types also need `IsomOp`. The generic constructions the roadmap consumes, such as the lifts
`TauCeti.EquivariantGroupoidLift`, the twisting actions and the self-extensions
`TauCeti.DerivationExtension`, are declarations of the pinned Tau Ceti and are not restated here.
-/

namespace TauCetiRoadmap.GeometricRepresentationCategories

end TauCetiRoadmap.GeometricRepresentationCategories
