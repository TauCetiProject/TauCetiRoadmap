module

public import Mathlib
public import TauCeti.AlgebraicTopology.EilenbergMacLane.Basic
public import TauCeti.AlgebraicTopology.Cohomology.Basic
public import TauCeti.AlgebraicTopology.LocalCoefficient.Representation
public import TauCeti.AlgebraicTopology.Singular.Twisted.Basic
public import TauCeti.AlgebraicTopology.Cohomology.Twisted.Basic

/-!
# Classifying spaces of discrete groups: target signatures

The roadmap is `README.md`; this file is not the roadmap. It states the roadmap's headline
theorems against the pinned Mathlib and Tau Ceti, each with `sorry`, so that the finished roadmap
is tested against them: the pointed uniqueness of aspherical Hausdorff CW complexes (Layer 1), and
the identification of the singular homology and cohomology of every Hausdorff CW `K(G, 1)`, with
constant coefficients and with local coefficients given by a `G`-representation, with Mathlib's
`groupHomology` and `groupCohomology` (Layer 1).

The pinned Tau Ceti already proves the existence of a Hausdorff CW `K(G, 1)` for every group
(`TauCeti.isEilenbergMacLaneSpaceOne_classifyingSpace` with `TauCeti.instCWComplexClassifyingSpace`),
the two-dimensional complex with fundamental group a given presented group
(`TauCeti.PresentationComplex.fundamentalGroupMulEquiv`, `TauCeti.PresentationComplex.isEmpty_cell`),
the uniqueness of `K(G, 1)` spaces of CW type up to a change of base point
(`TauCeti.IsAspherical.exists_homotopyEquiv`), and the (co)homology comparisons for Milnor's model
(`TauCeti.classifyingSpaceSingularHomologyIsoGroupHomology` and its companions); these are not
restated. The classification of pointed maps from a connected CW complex into an aspherical space
(Hatcher, Proposition 1B.9) is a headline of the algebraic-topology roadmap, Stage 8 item 8b, and is
not restated either.

Headline theorems not statable at the pins, and what each lacks:

* the normalised comparisons of the nerve model with Milnor's model and with the cellular model,
  the agreement of their (co)homology comparisons, and the agreement of their resolution
  comparisons (Layer 2): the nerve model's identification of its fundamental group with `G` is a
  construction of the algebraic-topology roadmap (Stage 8 item 8a), not a pinned declaration.

The comparisons are stated with coefficients in a commutative ring `k` in the universe of `G`,
because Mathlib's `Rep k G` keeps `k` and `G` in one universe; the integral statements are the case
`k = ℤ`, `G : Type`.
-/

public section

namespace TauCetiRoadmap.ClassifyingSpaces

open TauCeti

universe u v

/-! ## Layer 1: pointed uniqueness and the comparison for every `K(G, 1)` -/

/-- **Pointed uniqueness of aspherical CW complexes** (Layer 1, 1.1; Hatcher, Theorem 1B.8,
p. 90): two aspherical Hausdorff CW complexes are homotopy equivalent by an equivalence whose
forward map sends the base point `x` to the base point `y` and induces the prescribed isomorphism
`e` of fundamental groups exactly, with no change of base point. The base points are arbitrary
points, not necessarily `0`-cells. Both CW hypotheses are needed: a point and the Warsaw circle
are both aspherical with trivial fundamental group. -/
theorem exists_homotopyEquiv_of_isAspherical
    {X : Type u} {Y : Type v} [TopologicalSpace X] [TopologicalSpace Y] [T2Space X] [T2Space Y]
    [Topology.CWComplex (Set.univ : Set X)] [Topology.CWComplex (Set.univ : Set Y)]
    {x : X} {y : Y} (_hX : IsAspherical X x) (_hY : IsAspherical Y y)
    (e : FundamentalGroup X x ≃* FundamentalGroup Y y) :
    ∃ (F : ContinuousMap.HomotopyEquiv X Y) (hF : F.toFun x = y),
      ∀ γ, FundamentalGroup.mapOfEq F.toFun hF γ = e γ := sorry

/-- **Homology of a `K(G, 1)`** (Layer 1, 1.2; Hatcher, Section 2.2, p. 148): the singular
homology of any Hausdorff CW `K(G, 1)` with coefficients in a commutative ring `k` is Mathlib's
group homology of the trivial representation `k`, in every degree. -/
theorem nonempty_singularHomology_iso_groupHomology
    (k : Type u) [CommRing k] (G : Type u) [Group G]
    {X : Type u} [TopologicalSpace X] [T2Space X] [Topology.CWComplex (Set.univ : Set X)]
    {x : X} (_hX : IsEilenbergMacLaneSpaceOne G X x) (n : ℕ) :
    Nonempty (((AlgebraicTopology.singularHomologyFunctor (ModuleCat.{u} k) n).obj
        (ModuleCat.of k k)).obj (TopCat.of X) ≅ groupHomology (Rep.trivial k G k) n) := sorry

/-- **Cohomology of a `K(G, 1)`** (Layer 1, 1.2): the singular cohomology of any Hausdorff CW
`K(G, 1)` with values in a module `M` over a commutative ring `k` is Mathlib's group cohomology of
the trivial representation `M`, in every degree. For `G = ℤ/2`, `k = ℤ` and `M = ℤ/2` both sides
are `ℤ/2` in degree one, where `M = ℤ` gives `0`. -/
theorem nonempty_singularCohomology_iso_groupCohomology
    (k : Type u) [CommRing k] (G : Type u) [Group G]
    {X : Type u} [TopologicalSpace X] [T2Space X] [Topology.CWComplex (Set.univ : Set X)]
    {x : X} (_hX : IsEilenbergMacLaneSpaceOne G X x)
    (M : Type u) [AddCommGroup M] [Module k M] (n : ℕ) :
    Nonempty ((TopCat.of X).singularCohomology (ModuleCat.of k k) k (ModuleCat.of k M) n ≅
      groupCohomology (Rep.trivial k G M) n) := sorry

/-- **Homology with local coefficients of an aspherical CW complex** (Layer 1, 1.3; Hatcher,
Proposition 3H.4, p. 331): for an aspherical Hausdorff CW complex `X` with an identification
`Ψ : π₁(X, x) ≃* G` and a representation `A` of `G` over a commutative ring `k`, the homology of
`X` with coefficients in the local system whose monodromy at `x` is `A` pulled back along `Ψ` is
Mathlib's group homology of `A`, in every degree. Asphericity is needed: for `S² ∨ S¹` and the
trivial representation `ℤ` of `ℤ`, the degree-two groups are `ℤ` and `0`. -/
theorem nonempty_twistedHomology_iso_groupHomology
    (k : Type u) [CommRing k] (G : Type u) [Group G]
    {X : Type u} [TopologicalSpace X] [T2Space X] [Topology.CWComplex (Set.univ : Set X)]
    [PathConnectedSpace X] {x : X} (_hX : IsAspherical X x)
    (Ψ : FundamentalGroup X x ≃* G) (A : Rep.{u} k G) (n : ℕ) :
    Nonempty (LocalCoefficientSystem.twistedHomology
        (LocalCoefficientSystem.ofRepresentation (X := TopCat.of X) x
          (A.ρ.comp Ψ.toMonoidHom)) n ≅
      groupHomology A n) := sorry

/-- **Cohomology with local coefficients of an aspherical CW complex** (Layer 1, 1.3): in the
setting of `nonempty_twistedHomology_iso_groupHomology`, the cohomology of `X` with coefficients in
the same local system and values in a `k`-module `N` is Mathlib's group cohomology of the internal
hom `Homₖ(A, N)` into the trivial representation `N`, in every degree. -/
theorem nonempty_twistedCohomology_iso_groupCohomology
    (k : Type u) [CommRing k] (G : Type u) [Group G]
    {X : Type u} [TopologicalSpace X] [T2Space X] [Topology.CWComplex (Set.univ : Set X)]
    [PathConnectedSpace X] {x : X} (_hX : IsAspherical X x)
    (Ψ : FundamentalGroup X x ≃* G) (A : Rep.{u} k G)
    (N : Type u) [AddCommGroup N] [Module k N] (n : ℕ) :
    Nonempty ((LocalCoefficientSystem.ofRepresentation (X := TopCat.of X) x
        (A.ρ.comp Ψ.toMonoidHom)).twistedCohomology k (ModuleCat.of k N) n ≅
      groupCohomology ((Rep.ihom A).obj (Rep.trivial k G N)) n) := sorry

end TauCetiRoadmap.ClassifyingSpaces
