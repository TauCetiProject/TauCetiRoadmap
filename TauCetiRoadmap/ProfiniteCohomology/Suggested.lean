import Mathlib
import TauCeti.RepresentationTheory.Homological.ContCohomology.CohomologicalDimension.Basic
import TauCeti.RepresentationTheory.Homological.ContCohomology.CohomologicalDimension.ClassModule.Basic

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
isomorphism, the ordinary cohomological-dimension criteria, the graded cup product
with associativity, graded commutativity and the projection formula, and the index-two graph
construction on continuous characters, its identities and the index-two exact sequence. The
cochain-level `D₁₆` pullback equation is supplied; descent to classes and its Galois transport
are README targets, elementary packaging of these graph results through the degree-one character
equivalence, rather than additional deep theorems.

Three families of headline theorems remain, and all are stated below (Layer 11 of `README.md`):

* the independence of `cd_p` and `scd_p` from the extra coefficient universe of Tau Ceti's
  invariants, between the value `v = u` used by the Tau Ceti theorems on subgroups and the value
  `v = 0`, which quantifies over the same coefficient universe;
* the strict-dimension criterion (NSW (3.3.4)), testing the primary part of integral
  cohomology of every open subgroup as well as the ordinary-dimension bound;
* the class-module theorem for a group of strict `p`-cohomological dimension at most two
  (NSW (3.6.4)) for an arbitrary open normal subgroup `V`, including the cyclic case.
  The carrier, extension class and change-of-group equivalences exist at the pin; the transfer,
  inflation exactness and cyclic reduction in the proof route are README targets.

One headline theorem is not statable at the pins. The general Evens norm
`H^{2q}(U, A) → H^{2lq}(G, A)` of an open subgroup `U` of index `l` with coefficients in a discrete
commutative `G`-ring `A`, its characteristic-two form in every degree, and their multiplicativity,
transitivity, double-coset, inflation and expansion laws (Layer 13) all need the norm map itself.
That map is the multiplicative transfer, built from tensor induction at the level of resolutions.
Tau Ceti has tensor induction of representations (`Subgroup.tensorInductionFunctor`) but no
cohomological norm built from it, and the map is a construction, not a short definition on native
carriers.

The comparison isomorphism between the two canonical cohomology objects that underlies the first
family is likewise a construction (a chain isomorphism of homogeneous cochain complexes and its
homology classes). `README.md` specifies it as a target, and only its consequence for the
invariants is stated here.
-/

universe u

namespace TauCetiRoadmap.ProfiniteCohomology

open TauCeti TauCeti.ContCohomology

attribute [local instance] TopRep.distribMulAction TopRep.smulCommClass

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

/-- **Strict dimension is detected by integral cohomology of open subgroups** (NSW (3.3.4)).
For a prime `p`, profinite `G` and `n ≥ 0`, strict dimension is at most `n` exactly when ordinary
p-dimension is at most `n` and every open subgroup has zero p-primary component in degree `n+1`
with trivial integral coefficients. `ULift` places those coefficients in the group universe. -/
theorem strictCriterion (p : ℕ) (hp : p.Prime) (G : Type u)
    [Group G] [TopologicalSpace G] [IsTopologicalGroup G]
    [CompactSpace G] [TotallyDisconnectedSpace G] (n : ℕ) :
    strictCohomologicalDimensionAt.{u} p G ≤ n ↔
      cohomologicalDimensionAt.{u} p G ≤ n ∧
        ∀ U : OpenSubgroup G, AddCommGroup.primaryComponent
          (continuousCohomology (n + 1)
            (TopRep.of (ContRepresentation.trivial ℤ U.toSubgroup
              (ULift.{u} ℤ)))) p = ⊥ := by
  sorry

/-- **The class module has trivial `H¹`** (NSW (3.6.4), degree one). Let `G` be a profinite group
with `scd_p G ≤ 2` for a prime `p`, and let `V` be an open normal subgroup. Then
`H¹(G ⧸ V, V^ab(p)) = 0`, where `V^ab(p)` is the maximal pro-`p` quotient of the topological
abelianization of `V` (`TauCeti.abelianizationProP`) with the conjugation action of `G ⧸ V`, and
`H¹` is Tau Ceti's explicit continuous `H¹` of the finite discrete group `G ⧸ V`. -/
theorem subsingleton_h1_abelianizationProP (p : ℕ) (hp : p.Prime) (G : Type u) [Group G]
    [TopologicalSpace G] [IsTopologicalGroup G] [CompactSpace G] [TotallyDisconnectedSpace G]
    (h : strictCohomologicalDimensionAt.{u} p G ≤ 2) (V : Subgroup G) [V.Normal]
    (hV : IsOpen (V : Set G)) :
    Subsingleton (H1 (G ⧸ V) (Additive (abelianizationProP p G V))) := by
  sorry

/-- **The class module has cyclic `H²` generated by its class** (NSW (3.6.4), degree two). Under
the hypotheses of `subsingleton_h1_abelianizationProP`, `H²(G ⧸ V, V^ab(p))` is cyclic of order the
`p`-part `p ^ v_p(G : V)` of the index, generated by the class `u_{G/V}(p)` of the extension
`1 → V^ab(p) → G ⧸ [V, V]‾ V(p) → G ⧸ V → 1` (`TauCeti.abelianizationProPClass`, the class of the
factor set of the representatives `Quotient.out`). Equivalently there is an additive isomorphism
with `ZMod (p ^ v_p(G : V))` sending the class to `1`. When `p` does not divide the index both
sides are zero. -/
theorem abelianizationProPClass_generates (p : ℕ) (hp : p.Prime) (G : Type u) [Group G]
    [TopologicalSpace G] [IsTopologicalGroup G] [CompactSpace G] [TotallyDisconnectedSpace G]
    (h : strictCohomologicalDimensionAt.{u} p G ≤ 2) (V : Subgroup G) [V.Normal]
    (hV : IsOpen (V : Set G)) :
    ∃ e : H2 (G ⧸ V) (Additive (abelianizationProP p G V)) ≃+ ZMod (p ^ V.index.factorization p),
      e (abelianizationProPClass p G V hV) = 1 := by
  sorry

end TauCetiRoadmap.ProfiniteCohomology

