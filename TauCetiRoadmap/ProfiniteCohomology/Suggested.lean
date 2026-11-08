module

public import Mathlib
public import TauCeti.RepresentationTheory.Homological.ContCohomology.CohomologicalDimension.Basic

/-!
# Continuous cohomology of profinite groups: target signatures

The roadmap is `README.md`; this file is not the roadmap. It states, against the pinned Mathlib
and Tau Ceti, the headline theorems of the roadmap that the pinned libraries do not yet prove, each
with `sorry`.

Most headline theorems of the roadmap are already proved at the Tau Ceti pin, and `README.md`
cites them by name in its supplier contracts instead of restating them here: the comparison
isomorphisms between the explicit and the canonical model, the finite-quotient colimit, the long
exact and five-term sequences, Shapiro's lemma in every degree, dimension shifting, all-degree
corestriction with `cor ∘ res`, its transitivity and the Mackey formula, Hilbert 90 and the Kummer
isomorphism, the ordinary cohomological-dimension criteria, the strict-dimension criterion
(NSW (3.3.4), `TauCeti.strictCohomologicalDimensionAt_le_iff_forall_openSubgroup`), the
class-module theorem for a group of strict `p`-cohomological dimension at most two
(NSW (3.6.4), `TauCeti.subsingleton_h1_abelianizationProP` and
`TauCeti.abelianizationProPClass_generates`), the graded cup product with associativity, graded
commutativity and the projection formula, and the index-two Evens norm: the graph construction on
continuous characters, its descent to degree-one classes (`TauCeti.ContCohomology.evensNormIndexTwo`),
its identities, the class-level `D₁₆` pullback formula, its transport to a quadratic field extension
(`TauCeti.galoisEvens`) and the index-two exact sequence.

One family of headline theorems remains, and it is stated below (Layer 11 of `README.md`): the
independence of `cd_p` and `scd_p` from the extra coefficient universe of Tau Ceti's invariants,
between the value `v = u` used by the Tau Ceti theorems on subgroups and the value `v = 0`, which
quantifies over the same coefficient universe.

One headline theorem is not statable at the pins. The general Evens norm
`H^{2q}(U, A) → H^{2lq}(G, A)` of an open subgroup `U` of index `l` with coefficients in a discrete
commutative `G`-ring `A`, its characteristic-two form in every degree, and their multiplicativity,
transitivity, double-coset, inflation and expansion laws (Layer 13) all need the norm map itself.
That map is the multiplicative transfer, built from tensor induction at the level of resolutions.
Tau Ceti has tensor induction of representations (`Subgroup.tensorInductionFunctor`) but no
cohomological norm built from it, and the map is a construction, not a short definition on native
carriers.

The comparison isomorphism between the two canonical cohomology objects that underlies the
remaining family is likewise a construction (a chain isomorphism of homogeneous cochain complexes
and its homology classes). `README.md` specifies it as a target, and only its consequence for the
invariants is stated here.
-/

public section

universe u

namespace TauCetiRoadmap.ProfiniteCohomology

open TauCeti

/-! ## Layer 11: cohomological dimension -/

/-- **`cd_p` does not depend on the extra coefficient universe.** For a topological group
`G : Type u`, Tau Ceti's `cohomologicalDimensionAt.{v} p G` quantifies over discrete
`p`-primary coefficient modules in `Type (max u v)`. At `v = u` and at `v = 0` these are the same
modules in `Type u`, but the two canonical cohomology objects `continuousCohomology i M` are
formed with different universe parameters and are not definitionally equal. The theorem says the
two invariants agree. Route: an isomorphism of the homogeneous cochain complexes of
`ofDiscreteModule ℤ G M` at the two parameters, the identity on `M` in resolution degree zero and
postcomposition with the previous degree's isomorphism on `C(G, -)` after that, followed by its
homology classes. -/
theorem cohomologicalDimensionAt_universe_eq (p : ℕ) (G : Type u) [Group G] [TopologicalSpace G]
    [IsTopologicalGroup G] :
    cohomologicalDimensionAt.{u} p G = cohomologicalDimensionAt.{0} p G := by
  sorry

/-- **`scd_p` does not depend on the extra coefficient universe**, for the same reason and by
the same comparison as `cohomologicalDimensionAt_universe_eq`. The comparison isomorphisms are
additive, so they preserve `p`-primary components. -/
theorem strictCohomologicalDimensionAt_universe_eq (p : ℕ) (G : Type u) [Group G]
    [TopologicalSpace G] [IsTopologicalGroup G] :
    strictCohomologicalDimensionAt.{u} p G = strictCohomologicalDimensionAt.{0} p G := by
  sorry

end TauCetiRoadmap.ProfiniteCohomology

end
