module

public import Mathlib
public import TauCeti.AlgebraicTopology.EilenbergMacLane.Basic
public import TauCeti.AlgebraicTopology.Cohomology.Basic

/-!
# Classifying spaces of discrete groups: target signatures

The roadmap is `README.md`; this file is not the roadmap. It states the roadmap's headline
theorems against the pinned Mathlib and Tau Ceti, each with `sorry`, so that the finished roadmap
is tested against them: the existence of a Hausdorff CW `K(G, 1)` for every group, the
two-dimensional complex with fundamental group `G`, the realization of homomorphisms by pointed
maps out of a CW complex into an aspherical space, the uniqueness of CW `K(G, 1)` spaces, and the
identification of the singular homology and cohomology of a CW `K(G, 1)` with Mathlib's
`groupHomology` and `groupCohomology`.

Headline theorems not statable at the pins, and what each lacks:

* the Milnor model (Stage 1), the presentation complex and the cellular tower (Stage 2), and the
  agreement of the two models with each other and with the nerve model (Stage 3 item 14): the
  countable join, its realization, its orbit space and the attached cells are constructions
  whose formalisation is the library's work, so no declaration names them here;
* the direction of `π₁(BG) ≅ G` and the strict functoriality of the Milnor model (Stage 1 items 5
  and 6): they are statements about those constructions;
* the lifted and quotient CW structures along a free quotient covering (Stage 3 item 13): the
  pinned `Topology.CWComplex` has no notion of a cellular group action, so the cell-level
  statement cannot be written without the lifted cells themselves;
* the cellular chains of the universal cover as a projective resolution and its comparison with
  `Rep.standardResolution` (Stage 4 items 16 and 18): they need the models;
* the comparison with local coefficients (Stage 4 item 17): the pinned local coefficient
  systems are functors on the fundamental groupoid, and the system attached to a `G`-module
  through a chosen `π₁(X, x) ≃* G` is itself a construction of the roadmap.

The homology and cohomology comparisons are stated with coefficients in a commutative ring `k`
in the universe of `G`, because Mathlib's `Rep k G` keeps `k` and `G` in one universe; the
integral statement is the case `k = ℤ`, `G : Type`.
-/

public section

namespace TauCetiRoadmap.ClassifyingSpaces

open TauCeti

universe u v w

/-! ## Stages 1 and 2: existence of models -/

/-- **Existence of a CW `K(G, 1)` for every group** (Stage 1 item 5 and Stage 2 item 10): there
is a Hausdorff space with a CW structure and a point at which it is an Eilenberg–MacLane space
of type `K(G, 1)`, with no hypothesis on `G`. Either model of the roadmap, with the CW structure
of Stage 3 item 13 for the simplicial one, proves it. -/
theorem exists_cwComplex_isEilenbergMacLaneSpaceOne (G : Type u) [Group G] :
    ∃ (X : Type u) (_ : TopologicalSpace X) (_ : T2Space X)
      (_ : Topology.CWComplex (Set.univ : Set X)) (x : X),
      IsEilenbergMacLaneSpaceOne G X x := sorry

/-- **Every group is the fundamental group of a two-dimensional CW complex** (Stage 2 item 7
applied to the tautological presentation; Hatcher, Corollary 1.28, p. 52): a path-connected
Hausdorff CW complex with no cells of dimension above two whose fundamental group is `G`. -/
theorem exists_cwComplex_dim_le_two_fundamentalGroup_mulEquiv (G : Type u) [Group G] :
    ∃ (X : Type u) (_ : TopologicalSpace X) (_ : T2Space X)
      (_ : Topology.CWComplex (Set.univ : Set X)) (x : X),
      PathConnectedSpace X ∧
        (∀ n : ℕ, 2 < n → IsEmpty (Topology.CWComplex.cell (Set.univ : Set X) n)) ∧
        Nonempty (FundamentalGroup X x ≃* G) := sorry

/-! ## Stage 3: maps into aspherical spaces and uniqueness -/

/-- **Maps out of a CW complex into an aspherical space** (Stage 3 item 11; Hatcher,
Proposition 1B.9, p. 90): for a path-connected Hausdorff CW complex `X` with base point `x` and
an aspherical space `Y` with base point `y`, every homomorphism `π₁(X, x) →* π₁(Y, y)` is induced
by a pointed map, and two pointed maps inducing the same homomorphism are homotopic relative to
the base point. -/
theorem exists_continuousMap_mapOfEq_eq_of_isAspherical
    {X : Type u} [TopologicalSpace X] [T2Space X] [Topology.CWComplex (Set.univ : Set X)]
    [PathConnectedSpace X] (x : X)
    {Y : Type v} [TopologicalSpace Y] {y : Y} (_hY : IsAspherical Y y)
    (φ : FundamentalGroup X x →* FundamentalGroup Y y) :
    ∃ (f : C(X, Y)) (hf : f x = y),
      (∀ γ, FundamentalGroup.mapOfEq f hf γ = φ γ) ∧
        ∀ (g : C(X, Y)) (hg : g x = y), (∀ γ, FundamentalGroup.mapOfEq g hg γ = φ γ) →
          ContinuousMap.HomotopicRel f g {x} := sorry

/-- **Uniqueness** (Stage 3 item 12; Hatcher, Theorem 1B.8, p. 90): two aspherical Hausdorff CW
complexes are homotopy equivalent by an equivalence that preserves the base points and induces a
prescribed isomorphism of fundamental groups; for two `K(G, 1)` CW complexes any isomorphism
through `G` is such a prescription. The version for spaces of CW type follows by transport. Both
CW hypotheses are needed: a point and the Warsaw circle are both `K(1, 1)` spaces. -/
theorem exists_homotopyEquiv_of_isAspherical
    {X Y : Type u} [TopologicalSpace X] [TopologicalSpace Y] [T2Space X] [T2Space Y]
    [Topology.CWComplex (Set.univ : Set X)] [Topology.CWComplex (Set.univ : Set Y)]
    {x : X} {y : Y} (_hX : IsAspherical X x) (_hY : IsAspherical Y y)
    (e : FundamentalGroup X x ≃* FundamentalGroup Y y) :
    ∃ (F : ContinuousMap.HomotopyEquiv X Y) (hF : F.toFun x = y),
      ∀ γ, FundamentalGroup.mapOfEq F.toFun hF γ = e γ := sorry

/-! ## Stage 4: group homology and cohomology -/

/-- **Homology** (Stage 4 item 17): the singular homology of a Hausdorff CW `K(G, 1)` with
coefficients in a commutative ring `k` is Mathlib's group homology of the trivial module `k`.
Stated for any such space, not only the models, by Stage 3 item 12. -/
theorem nonempty_singularHomology_iso_groupHomology
    (k : Type u) [CommRing k] (G : Type u) [Group G]
    {X : Type u} [TopologicalSpace X] [T2Space X] [Topology.CWComplex (Set.univ : Set X)]
    {x : X} (_hX : IsEilenbergMacLaneSpaceOne G X x) (n : ℕ) :
    Nonempty (groupHomology (Rep.trivial k G k) n ≅
      ((AlgebraicTopology.singularHomologyFunctor (ModuleCat.{u} k) n).obj
        (ModuleCat.of k k)).obj (TopCat.of X)) := sorry

/-- **Cohomology** (Stage 4 item 17): the singular cohomology of a Hausdorff CW `K(G, 1)` with
coefficients in a commutative ring `k` is Mathlib's group cohomology of the trivial module `k`. -/
theorem nonempty_singularCohomology_iso_groupCohomology
    (k : Type u) [CommRing k] (G : Type u) [Group G]
    {X : Type u} [TopologicalSpace X] [T2Space X] [Topology.CWComplex (Set.univ : Set X)]
    {x : X} (_hX : IsEilenbergMacLaneSpaceOne G X x) (n : ℕ) :
    Nonempty (groupCohomology (Rep.trivial k G k) n ≅
      (TopCat.of X).singularCohomology (ModuleCat.of k k) k (ModuleCat.of k k) n) := sorry

end TauCetiRoadmap.ClassifyingSpaces
