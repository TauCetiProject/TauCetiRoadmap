module

public import Mathlib
public import TauCeti.AlgebraicTopology.EilenbergMacLane.Basic
public import TauCeti.AlgebraicTopology.Cohomology.Twisted.Basic
public import TauCeti.AlgebraicTopology.LocalCoefficient.Representation
public import TauCeti.AlgebraicTopology.Singular.Twisted.Basic

/-!
# Classifying spaces of discrete groups: target signatures

The roadmap is `README.md`; this file is not the roadmap. It states the roadmap's headline
theorems against the pinned Mathlib and Tau Ceti, each with `sorry`, so that the finished roadmap
is tested against them: the realization of homomorphisms by pointed maps out of a path-connected
Hausdorff CW complex into an aspherical space, unique up to homotopy relative to the base point;
the pointed uniqueness of aspherical Hausdorff CW complexes; and the identification of the
homology and cohomology of a Hausdorff CW `K(G, 1)` with coefficients in the local system of a
representation of `G` with Mathlib's `groupHomology` and `groupCohomology`.

Headline theorems that are theorems of the pinned Tau Ceti, and therefore not stated here:

* the existence of a Hausdorff CW `K(G, 1)` for every group, and of a path-connected Hausdorff
  CW complex with no cells above dimension two whose fundamental group is `G`:
  `TauCeti.classifyingSpace G` with `TauCeti.isEilenbergMacLaneSpaceOne_classifyingSpace`,
  `TauCeti.instCWComplexClassifyingSpace` and `TauCeti.instT2SpaceClassifyingSpace`, the
  existence theorems `TauCeti.exists_isEilenbergMacLaneSpaceOne` and
  `TauCeti.exists_isEilenbergMacLaneSpaceOne_cellularClassifyingSpace`, and the presentation
  complex `TauCeti.PresentationComplex` of the tautological presentation
  `Group.Presentation.ofFreeGroupHom`, with `TauCeti.PresentationComplex.fundamentalGroupMulEquiv`
  and `TauCeti.PresentationComplex.isEmpty_cell`;
* the agreement of the Milnor and cellular models, the uniqueness of `K(G, 1)` spaces of CW type
  up to a change of base point, the functoriality, the two resolutions and the comparison with
  Mathlib's standard resolution, and the (co)homology comparisons for the Milnor model:
  `TauCeti.cellularHomotopyEquivClassifyingSpace`, `TauCeti.IsAspherical.exists_homotopyEquiv`,
  `TauCeti.classifyingSpaceHomotopyFunctor`, `TauCeti.universalGSpaceResolution`,
  `TauCeti.cellularClassifyingSpaceResolution`, `TauCeti.universalGSpaceStandardHomotopyEquiv`,
  `TauCeti.classifyingSpaceSingularHomologyIsoGroupHomology`,
  `TauCeti.classifyingSpaceSingularCohomologyIsoGroupCohomology`,
  `TauCeti.classifyingSpaceTwistedHomologyIsoGroupHomology` and
  `TauCeti.classifyingSpaceTwistedCohomologyIsoGroupCohomology`;
* the existence of an isomorphism between the singular homology, or cohomology, of an arbitrary
  Hausdorff CW `K(G, 1)` with trivial coefficients and group (co)homology: it is the transport
  of the two pinned isomorphisms for the Milnor model along the pinned homotopy equivalence
  `TauCeti.IsEilenbergMacLaneSpaceOne.nonempty_homotopyEquiv`, by the homotopy invariance of
  singular (co)homology. The roadmap's Layer 2 items 2.1 and 2.2 fix the transported isomorphism
  through the chosen identification of the fundamental group and state its naturality; those are
  constructions and prose targets of `README.md` only.

The nerve model of the algebraic-topology roadmap and its comparison with the pinned models
belong to that roadmap and are not stated here.

The base point of a CW complex is a vertex throughout, a point of the `0`-skeleton
`Topology.RelCWComplex.skeletonLT (Set.univ : Set X) 1`, as in Hatcher's proof; the base point
of an aspherical target is arbitrary. The two Layer 1 headlines keep the source and the target
in one universe, the universe in which the pinned `TauCeti.exists_mapOfEq_cellularClassifyingSpace`
keeps a presentation and the target of its map. The local-coefficient headlines are stated with
coefficients in a commutative ring `k` in the universe of `G` and `X`, because Mathlib's
`Rep k G` keeps `k` and `G` in one universe; the integral statement is the case `k = ℤ`,
`G : Type`.
-/

public section

namespace TauCetiRoadmap.ClassifyingSpaces

open TauCeti

universe u

/-! ## Layer 1: maps into aspherical spaces and pointed uniqueness -/

/-- **Maps out of a CW complex into an aspherical space** (Layer 1 items 1.1 and 1.2; Hatcher,
Proposition 1B.9, p. 90): for a path-connected Hausdorff CW complex `X` with base point a vertex
`x` and an aspherical space `Y` with base point `y`, in one universe, every homomorphism
`π₁(X, x) →* π₁(Y, y)` is induced by a pointed map, and two pointed maps inducing the same
homomorphism are homotopic relative to the base point. The pinned library proves the existence
clause for the source `TauCeti.cellularClassifyingSpace R`
(`TauCeti.exists_mapOfEq_cellularClassifyingSpace`) and the uniqueness clause for a CW complex
with a single `0`-cell (`TauCeti.homotopicRel_singleton_of_mapOfEq_eq_of_cwComplex`); the
headline is the general source. -/
theorem exists_continuousMap_mapOfEq_eq_of_isAspherical
    {X : Type u} [TopologicalSpace X] [T2Space X] [Topology.CWComplex (Set.univ : Set X)]
    [PathConnectedSpace X] (x : X) (_hx : x ∈ Topology.RelCWComplex.skeletonLT (Set.univ : Set X) 1)
    {Y : Type u} [TopologicalSpace Y] {y : Y} (_hY : IsAspherical Y y)
    (φ : FundamentalGroup X x →* FundamentalGroup Y y) :
    ∃ (f : C(X, Y)) (hf : f x = y),
      (∀ γ, FundamentalGroup.mapOfEq f hf γ = φ γ) ∧
        ∀ (g : C(X, Y)) (hg : g x = y), (∀ γ, FundamentalGroup.mapOfEq g hg γ = φ γ) →
          ContinuousMap.HomotopicRel f g {x} := sorry

/-- **Pointed uniqueness** (Layer 1 item 1.3; Hatcher, Theorem 1B.8, p. 90): two aspherical
Hausdorff CW complexes in one universe, the first based at a vertex, are homotopy equivalent by
an equivalence whose forward map preserves the base points and induces a prescribed isomorphism
of fundamental groups; for two `K(G, 1)` CW complexes any isomorphism through `G` is such a
prescription. The pinned `TauCeti.IsAspherical.exists_homotopyEquiv` realizes the isomorphism
only after a change of base point along a path; the headline is the pointed form. Both CW
hypotheses are needed: a point and the Warsaw circle are both `K(1, 1)` spaces. -/
theorem exists_homotopyEquiv_of_isAspherical
    {X Y : Type u} [TopologicalSpace X] [TopologicalSpace Y] [T2Space X] [T2Space Y]
    [Topology.CWComplex (Set.univ : Set X)] [Topology.CWComplex (Set.univ : Set Y)]
    {x : X} (_hx : x ∈ Topology.RelCWComplex.skeletonLT (Set.univ : Set X) 1) {y : Y}
    (_hX : IsAspherical X x) (_hY : IsAspherical Y y)
    (e : FundamentalGroup X x ≃* FundamentalGroup Y y) :
    ∃ (F : ContinuousMap.HomotopyEquiv X Y) (hF : F.toFun x = y),
      ∀ γ, FundamentalGroup.mapOfEq F.toFun hF γ = e γ := sorry

/-! ## Layer 2: group homology and cohomology of a CW `K(G, 1)` -/

/-- **Homology with local coefficients** (Layer 2 item 2.3): for an aspherical Hausdorff CW
complex `X` whose fundamental group at a vertex `x` is identified with `G` by `Ψ`, and a representation
`A` of `G` over `k`, the homology of `X` with coefficients in the local system of the
representation `A ∘ Ψ` of `π₁(X, x)` is Mathlib's group homology of `A`. For the Milnor model and
the local system of the orbit map this is the pinned
`TauCeti.classifyingSpaceTwistedHomologyIsoGroupHomology`; the headline is stated for the local
system `TauCeti.LocalCoefficientSystem.ofRepresentation` of the monodromy representation, on any
such space. Asphericity cannot be dropped: for `X = S² ∨ S¹`, `G = ℤ` and `A` trivial the two
sides differ in degree two. -/
theorem nonempty_twistedHomology_iso_groupHomology
    (k : Type u) [CommRing k] (G : Type u) [Group G]
    {X : Type u} [TopologicalSpace X] [T2Space X] [Topology.CWComplex (Set.univ : Set X)]
    [PathConnectedSpace X] {x : X} (_hx : x ∈ Topology.RelCWComplex.skeletonLT (Set.univ : Set X) 1)
    (_hX : IsAspherical X x) (Ψ : FundamentalGroup X x ≃* G)
    (A : Rep k G) (n : ℕ) :
    Nonempty (groupHomology A n ≅
      LocalCoefficientSystem.twistedHomology
        (LocalCoefficientSystem.ofRepresentation (X := TopCat.of X) x
          (A.ρ.comp Ψ.toMonoidHom)) n) := sorry

/-- **Cohomology with local coefficients** (Layer 2 item 2.3): with `X`, `Ψ` and `A` as in
`nonempty_twistedHomology_iso_groupHomology` and a `k`-module `N`, the cohomology of `X` with
coefficients in the local system of `A ∘ Ψ` and values in `N` is Mathlib's group cohomology of
the internal hom `Homₖ(A, N)`, `N` carrying the trivial action. For the Milnor model this is the
pinned `TauCeti.classifyingSpaceTwistedCohomologyIsoGroupCohomology`. -/
theorem nonempty_twistedCohomology_iso_groupCohomology
    (k : Type u) [CommRing k] (G : Type u) [Group G]
    {X : Type u} [TopologicalSpace X] [T2Space X] [Topology.CWComplex (Set.univ : Set X)]
    [PathConnectedSpace X] {x : X} (_hx : x ∈ Topology.RelCWComplex.skeletonLT (Set.univ : Set X) 1)
    (_hX : IsAspherical X x) (Ψ : FundamentalGroup X x ≃* G)
    (A : Rep k G) (N : Type u) [AddCommGroup N] [Module k N] (n : ℕ) :
    Nonempty (groupCohomology ((Rep.ihom A).obj (Rep.trivial k G N)) n ≅
      (LocalCoefficientSystem.ofRepresentation (X := TopCat.of X) x
        (A.ρ.comp Ψ.toMonoidHom)).twistedCohomology k (ModuleCat.of k N) n) := sorry

end TauCetiRoadmap.ClassifyingSpaces
