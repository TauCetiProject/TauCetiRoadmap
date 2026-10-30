module

import Mathlib
import TauCeti.RepresentationTheory.Homological.ContCohomology.TrivialFp

/-!
# Scholze's functor and mod-p tower cohomology: target signatures

The roadmap is README.md; this file is not the roadmap. It states the roadmap's
headline theorems against the pinned APIs.

The following headlines are not statable at the pins:
* Equivariant limit/descent and Hochschild–Serre: equivariant analytic étale
  sites and the tower-descent functors are missing.
* The component-action convention comparison: the Lubin–Tate tower and
  its component map are missing.
* Scholze finiteness with complete noetherian local coefficients: the sheaf on
  the Gross–Hopkins torsor is missing.
* Almost finite images under strict restriction: the analytic étale integral
  sheaf O⁺/p and the valuatively strict open immersion of adic spaces are
  missing.
* Frobenius rigidity: valuation-ring almost modules and their scalar-extension
  interface are missing.
* Fust's Ext comparison and reductive finiteness: the derived smooth category
  and the general reductive rational-point carrier are missing.
* SL₂(ℚ_p)-cohomology vanishing outside the excluded twists: absolutely
  irreducible smooth mod-p representations of GL₂(ℚ_p), the Steinberg
  representation and the principal series Ind_B^G α, with their twist
  classes, are not carriers at the pins.
* Cartan–Leray, its multiplicity form and the degree-one comparison: tower
  étale cohomology and Scholze's functor are missing.
* Ludwig's quotient and vanishing: the perfectoid Borel quotient and its
  associated principal-series sheaf are missing.
* Residual globalisation and block occurrence: automorphic representations and
  the completed quaternionic module are missing.
* The generic principal-series Galois criterion: the smooth principal-series
  objects and S¹ are missing.
* Arithmetic finite support and finite length, general-local-field finite
  multiplicities, geometric multiplicity finite length/vanishing/supersingular
  support, and Lubin–Tate smooth-vector finiteness: the arithmetic and geometric
  tower cohomology objects with their group actions are missing.

No abstract predicates or arbitrary complexes replace these geometric objects.
-/

namespace TauCetiRoadmap.ScholzeFunctorAndModpCohomologyOfTheLubinTateTower

open CategoryTheory
open scoped Manifold ContDiff

universe u

/-! ## Layer 0: compact p-adic Lie cohomology -/

/-- For bounded coefficient modules, admissibility tests finite generation of
fixed submodules for every compact open subgroup, using the native operators.
Smoothness and the annihilating ideal power are explicit theorem hypotheses. -/
def AdmissibleCompactInvariants
    {A H : Type u} [CommRing A] [TopologicalSpace A]
    [Group H] [TopologicalSpace H] (X : TopRep.{u} A H) : Prop :=
  ∀ K : Subgroup H, IsOpen (K : Set H) → IsCompact (K : Set H) →
    Module.Finite A (X.ρ.restrict K.subtype).invariants

/-- Every continuous cohomology group of a compact finite-dimensional analytic
p-adic Lie group with bounded maximal-ideal-power torsion admissible coefficients
is finite, and finitely generated over the complete noetherian local ring A.
A has finite residue field of characteristic p. The discrete scalar topology
models the same smooth coefficient module; adic completeness is algebraic.
See SCH18, Lemma 3.13 and Theorem 4.3; FUST22, Lemma 6.2. -/
theorem compactLie_cohomology_finite (p d : ℕ) [Fact p.Prime]
    (H : Type u) [Group H] [TopologicalSpace H] [IsTopologicalGroup H]
    [T2Space H] [CompactSpace H] [ChartedSpace (Fin d → Padic p) H]
    [LieGroup 𝓘(Padic p, Fin d → Padic p) ω H]
    (A : Type u) [CommRing A] [IsLocalRing A] [IsNoetherianRing A]
    [IsAdicComplete (IsLocalRing.maximalIdeal A) A]
    [Finite (IsLocalRing.ResidueField A)] [CharP (IsLocalRing.ResidueField A) p]
    [TopologicalSpace A] [DiscreteTopology A]
    (X : TopRep.{u} A H) (hX : TauCeti.IsSmoothDiscrete A X)
    (hAdm : AdmissibleCompactInvariants X)
    (j : ℕ) (hj : 0 < j)
    (hkill : ∀ a ∈ (IsLocalRing.maximalIdeal A) ^ j, ∀ x : X, a • x = 0)
    (i : ℕ) :
    Module.Finite A (continuousCohomology i X) ∧ Finite (continuousCohomology i X) := by
  sorry

/-! ## Layer 2: continuous cohomology and tower comparison -/

/-- Shapiro's lemma for continuous induction along a closed subgroup with a
continuous section of the right-coset quotient. Here H is locally profinite,
X is a topological R[J]-module whose action map J × X → X is jointly
continuous, and the induced module is Mathlib's continuous coinduction: the
continuous f : H → X with f(jh) = j f(h), with the compact-open topology and
right translation. Its continuous cohomology is isomorphic, as a topological
R-module in every degree, to that of X; the isomorphism is restriction followed
by evaluation at 1. See BW00, Chapter IX, Proposition 2.3; FUST22, §2,
p. 281; CDN23, proof of Corollary 3.13, p. 37. -/
theorem continuousCohomology_coind_iso
    (R H : Type u) [CommRing R] [TopologicalSpace R] [IsTopologicalRing R]
    [Group H] [TopologicalSpace H] [IsTopologicalGroup H] [T2Space H]
    [LocallyCompactSpace H] [TotallyDisconnectedSpace H]
    (J : Subgroup H) (hJ : IsClosed (J : Set H))
    (X : TopRep.{u} R J)
    (hact : Continuous (fun z : J × X => X.ρ z.1 z.2))
    (s : Quotient (QuotientGroup.rightRel J) → H) (hs : Continuous s)
    (hsec : Function.RightInverse s (Quotient.mk (QuotientGroup.rightRel J)))
    (i : ℕ) :
    Nonempty (continuousCohomology i
      (TopRep.of (X.ρ.coind ⟨J.subtype, continuous_subtype_val⟩)) ≅
        continuousCohomology i X) := by
  sorry

/-- For an odd prime p, continuous degree-two cohomology of SL₂(ℚ_p)
with trivial discrete 𝔽_p coefficients vanishes. Moore's local covering
classification identifies it with Hom(μ(ℚ_p), 𝔽_p); μ(ℚ_p) has order p - 1.
See MOO68, Theorem 10.3, printed p. 51; CDN23, proof of Lemma 4.28, p. 49. -/
theorem moore_sl2_h2_vanishes (p : ℕ) [Fact p.Prime] (hp : 2 < p) :
    Subsingleton (continuousCohomology 2
      (TauCeti.trivialFp p
        (Matrix.SpecialLinearGroup (Fin 2) (Padic p)))) := by
  sorry

end TauCetiRoadmap.ScholzeFunctorAndModpCohomologyOfTheLubinTateTower
