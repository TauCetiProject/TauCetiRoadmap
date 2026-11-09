module

public import Mathlib
public import TauCeti.AlgebraicTopology.Singular.Twisted.Relative
public import TauCeti.AlgebraicTopology.Singular.Twisted.Functoriality
public import TauCeti.AlgebraicTopology.Cohomology.Basic
public import TauCeti.AlgebraicTopology.Cohomology.HomotopyInvariance
public import TauCeti.AlgebraicTopology.Cohomology.Cap.Basic
public import TauCeti.AlgebraicTopology.Cohomology.Cup
public import TauCeti.AlgebraicTopology.EilenbergMacLane.Basic
public import TauCeti.AlgebraicTopology.Singular.DiskSphere
public import TauCeti.AlgebraicTopology.Cellular.Comparison
public import TauCeti.AlgebraicTopology.Cellular.EulerCharacteristic.FiniteCWType
public import TauCeti.AlgebraicTopology.Singular.Kunneth.Basic
public import TauCeti.AlgebraicTopology.Singular.LocalHomology.Compact
public import TauCeti.AlgebraicTopology.Singular.LocalHomology.FundamentalClass
public import TauCeti.AlgebraicTopology.Singular.Homotopy.WeakHomotopyEquivalence
public import TauCeti.AlgebraicTopology.Homotopy.Hurewicz.One.Basic
public import TauCeti.AlgebraicTopology.Homotopy.Hurewicz.Absolute
public import TauCeti.AlgebraicTopology.Homotopy.Hurewicz.Relative
public import TauCeti.AlgebraicTopology.Homotopy.Whitehead
public import TauCeti.AlgebraicTopology.Homotopy.CWApproximation.Naturality
public import TauCeti.AlgebraicTopology.Homotopy.Relative.CellDimension
public import TauCeti.AlgebraicTopology.Homotopy.SimplyConnectedAtInfinity
public import TauCeti.AlgebraicTopology.SerreClass.Torsion
public import TauCeti.AlgebraicTopology.SerreClass.PowerTorsion
public import TauCeti.Algebra.Category.ModuleCat.Tower.MittagLeffler
public import TauCeti.Algebra.Category.ModuleCat.Tower.Milnor.Basic
public import TauCeti.Topology.Category.BasedTopPair
public import TauCeti.Topology.CWComplex.Classical.CWType
public import TauCeti.Topology.CWComplex.Classical.FiniteCWType
public import TauCeti.Topology.Triangulable.FiniteCWType
public import TauCeti.Topology.Homotopy.LusternikSchnirelmann
public import TauCeti.Topology.Homotopy.Proper
public import TauCeti.Topology.Homotopy.HomotopyGroup.Map
public import TauCeti.Topology.Homotopy.HomotopyGroup.Product
public import TauCeti.Topology.Homotopy.Extension.CWComplex
public import TauCeti.Topology.Homotopy.Extension.DeformationRetract
public import TauCeti.Topology.Homotopy.Extension.MappingCylinder
public import TauCeti.Topology.Homotopy.Extension.Prod
public import TauCeti.Topology.Homotopy.Extension.HomotopyEquivRel
public import TauCeti.Topology.Homotopy.SerreFibration.Basic
public import TauCeti.AlgebraicTopology.Singular.BrouwerFixedPoint
public import TauCeti.AlgebraicTopology.Singular.Transfer.Degree
public import TauCeti.AlgebraicTopology.Singular.Transfer.PermutationLocalSystem
public import TauCeti.AlgebraicTopology.Cohomology.UniversalCoefficient
public import TauCeti.AlgebraicTopology.Cohomology.Bockstein
public import TauCeti.AlgebraicTopology.Cohomology.MayerVietoris.Basic
public import TauCeti.AlgebraicTopology.Cohomology.MayerVietoris.Pair
public import TauCeti.AlgebraicTopology.Cohomology.GradedCommutativity
public import TauCeti.AlgebraicTopology.Cohomology.GroupCohomology
public import TauCeti.AlgebraicTopology.Singular.LocalHomology.Orientation.Linear
public import TauCeti.AlgebraicTopology.Singular.LocalHomology.Orientation.Chart
public import TauCeti.AlgebraicTopology.Singular.LocalHomology.Orientation.OpenEmbedding
public import TauCeti.AlgebraicTopology.Singular.LocalHomology.Orientation.Transport
public import TauCeti.AlgebraicTopology.ClassifyingSpace.Cohomology
public import TauCeti.AlgebraicTopology.ClassifyingSpace.LocalCoefficients
public import TauCeti.AlgebraicTopology.ClassifyingSpace.Torsion
public import TauCeti.AlgebraicTopology.ClassifyingSpace.Uniqueness
public import TauCeti.AlgebraicTopology.ClassifyingSpace.Circle
public import TauCeti.Topology.CWComplex.Classical.Cylinder
public import TauCeti.Topology.CWComplex.Classical.CellularApproximation

/-!
# Algebraic topology of spaces and manifolds: target signatures

The roadmap is `README.md`; this file is not the roadmap. It states, against the pinned Mathlib
and Tau Ceti, the roadmap's headline theorems that are statable on native carriers, each with
`sorry`, together with the simple definitions they need:

* the pair-quotient comparisons, relative CW pushouts and the one-sided extension of homotopy
  inverses over cofibered pairs (Stage 4.5);
* CW approximation of an arbitrary space (Stage 4.8);
* the bijection `π_{n+1}(E, F, e) → π_{n+1}(B, {b}, b)` induced by a Serre fibration, Hatcher's
  relative form of the fibration homotopy sequence (Stage 5.5);
* the compact-support theorem for locally represented top sections with local coefficients
  (Stage 6.3), and Poincaré duality with `ℤ/2` coefficients and, for a closed manifold with a
  homological orientation, with integral coefficients (Stage 6.4);
* the cup-length lower bound for the Lusternik–Schnirelmann category (the categorical
  supplement after Stage 6.2);
* relative Hurewicz in degrees at least two with only the subspace simply connected
  (Stage 8.4);
* homological Whitehead for simply connected spaces of CW type (Stage 8.5) and proper homotopy
  rectification (Stage 8.5);
* finite CW type of compact manifolds (Stage 8.7);
* the `K(π, 1)` property of the bar model (Stage 8.8a);
* the classification of pointed maps from a connected Hausdorff CW complex into an aspherical
  space by homomorphisms of fundamental groups (Stage 8.8b);
* Hurewicz modulo a Serre class satisfying Serre's tensor, `Tor` and `K(A, 1)` axioms
  (Stage 8.8d);
* representability of `H^n(-; A)` by every `K(A, n)` model (Stage 8.10);
* CW type of mapping spaces out of finite CW complexes and of based loop spaces (Stage 8.11a).

Several results the roadmap states as targets are proved by the pinned Tau Ceti and are not
restated: the commutativity of the fundamental group of a topological monoid at its unit, the
no-retraction theorem and Brouwer's fixed-point theorem in its disk, compact
convex, closed-ball and finite-span forms, Strøm's cylinder theorem for closed cofibrations,
the closed embedding of the base into a pushout along a closed embedding, the spectral sequence
of a filtered complex with its convergence for exhaustive filtrations and the filtered-space
spectral sequence of singular chains, Hurewicz fibrations being Serre fibrations, the
restriction fibrations of mapping spaces along closed cofibrations, fibre transport and the
fibre-homology local system of a Hurewicz fibration, the action of `π₁` on `π_n`,
homotopy inverses relative to subspaces and to points with the extension property, the
degree-one and absolute Hurewicz theorems, relative Hurewicz for highly connected pairs,
Whitehead's theorem, the homology invariance of weak equivalences, CW approximation of
path-connected spaces, the connectivity of a CW pair from its cell dimensions, the cellular
comparison in every dimension for module coefficients, Künneth over a field, the Euler
characteristic of spaces of finite CW type with its homotopy invariance, the `lim`/`lim¹` algebra
of towers, the unnormalized Lusternik–Schnirelmann category, proper homotopy equivalences,
simple connectivity at infinity, the constant-coefficient compact-support theorem and the
integral fundamental class, the torsion Serre classes, the transfer of a finite cover with its
degree formulas and permutation local system, universal coefficients over a hereditary ring,
the Bockstein, the cochain Mayer–Vietoris sequences, graded commutativity of the cup product,
the determinant-sign action on local orientations and their chart, open-embedding and transport
comparisons, the relative cylinder CW structure, cellular approximation, the cohomology of a
contractible free quotient cover and of Milnor's classifying space, the torsion `K(A, 1)` axioms
for finite groups, the uniqueness of `K(G, 1)` spaces of CW type and the circle comparison. The
`#check` lines below pin the ones the stages consume most directly, and the README cites each by
file.

Headline theorems not statable at the pins, and what each lacks:

* the homological and cohomological Serre spectral sequences with their monodromy local systems
  (Stage 5.5): the pinned filtered-space spectral sequence `TauCeti.filteredSpaceSpectralSequence`
  carries the skeletal filtration, but the fibre-homology local system the `E²` page needs exists
  at the pins only for a Hurewicz fibration with a lifting function (`TauCeti.fiberLocalSystem`);
  the transport local system of a Serre fibration is a construction of the roadmap;
* the boundary map `π_{n+1}(B, b) → π_n(F, e)` of the fibration homotopy sequence (Stage 5.5):
  the pinned libraries have no such map; the roadmap constructs it by relative lifting and
  endpoint restriction, and its exactness is stated here only through the relative form above;
* the deck-sum formula and the Cartan–Leray spectral sequence of a regular cover (Stage 5.3):
  the deck action on the native transfer and the deck chain complex in `Rep R G` are
  constructions of the roadmap;
* the cellular–singular chain comparison with local coefficients and chosen chain
  representatives (Stage 4.3): the chain map is data built on the roadmap's cellular
  representatives;
* Poincaré duality with local coefficients, Poincaré–Lefschetz duality for compact manifolds with
  boundary and the twisted relative fundamental class (Stages 6.3–6.4): the homological
  orientation local system with coefficients in a local system and the relative fundamental class
  of a manifold with boundary are constructions of the roadmap;
* the proper Whitehead theorem (Stage 8.5): the pinned libraries have no compactly supported
  cohomology, so its hypothesis cannot be written;
* the relative obstruction class with local coefficients (Stage 8.9): the obstruction cochain,
  assembled from the characteristic-map boundary classes of the cells transported along chosen
  paths, is data the roadmap constructs; the action of `π₁` on `π_n` it uses is native;
* the functorial abelian family `K(A, n)` with its normalized identifications (Stage 8.8c) and
  the ordinary EM loop comparison and cohomology suspension (Stage 8.11b): they are data.
-/

@[expose] public section

namespace TauCetiRoadmap.AlgebraicTopology

open CategoryTheory ContinuousMap Topology
open CategoryTheory.Limits

noncomputable section

/-! The `#check` lines pin the native declarations the stages consume, in the order of the
Inventory of `README.md`. -/

#check HomotopyGroup.prodEquiv
#check HomotopyGroup.prodMulEquiv
#check TauCeti.HasHomotopyExtensionProperty.exists_strong_deformation_retraction
#check TauCeti.MappingCylinder.homotopyEquiv
#check TauCeti.MappingCylinder.hasHomotopyExtensionProperty_range_incl
#check isQuotientCoveringMap_iff_isCoveringMap_and
#check TauCeti.cellularSingularHomologyIsoUniv
#check TauCeti.isIso_singularHomologyMap_skeletonBasePairToComplex_succ_of_hasExactColimitsOfShape
#check TopCat.singularHomologyKunnethUnitIso
#check TauCeti.ModuleTower.shift
#check TauCeti.ModuleTower.limOne
#check TauCeti.ModuleTower.shift_surjective
#check TauCeti.ModuleTower.subsingleton_limOne_of_isMittagLeffler
#check TauCeti.LSCategoricalCover
#check TauCeti.lsCategoryCount
#check TauCeti.lsCategoryCount_le_of_homotopic_id
#check TauCeti.exists_localHomologyRestriction_eq_of_isCompact
#check TauCeti.localHomology_ext_of_isCompact
#check TauCeti.HomologicalOrientation.fundamentalClass
#check TauCeti.FiniteCWType
#check TauCeti.eulerChar
#check TauCeti.eulerChar_eq_cwEulerChar
#check ContinuousMap.HomotopyEquiv.eulerChar_eq
#check TauCeti.IsTriangulable.finiteCWType
#check TauCeti.BasedTopPair
#check TauCeti.RelHomotopyGroup
#check TauCeti.surjective_homotopyGroupMap_of_isEmpty_cell
#check TauCeti.injective_homotopyGroupMap_of_isEmpty_cell
#check TauCeti.surjective_homotopyGroupMap_of_isEmpty_cell_of_comp_eq
#check TauCeti.HurewiczOne.hurewiczHomologyAddEquiv
#check HomotopyGroup.hurewiczAddEquiv
#check TauCeti.RelHomotopyGroup.bijective_hurewicz_of_subsingleton_homotopyGroup
#check TauCeti.isWeakHomotopyEquivalence_cwApproximationMap
#check TauCeti.cwApproximationLift
#check ContinuousMap.IsWeakHomotopyEquivalence.isIso_singularHomologyMap
#check ContinuousMap.IsWeakHomotopyEquivalence.isIso_twistedHomologyMap
#check ContinuousMap.IsWeakHomotopyEquivalence.homotopyEquiv
#check ContinuousMap.HasProperHomotopyInverse
#check TauCeti.SimplyConnectedAtInfinity
#check AddCommGrpCat.isTorsion
#check AddCommGrpCat.isKilledBySomePower
#check TauCeti.noRetraction_diskBoundary
#check TauCeti.brouwerFixedPoint_topCatDisk
#check TauCeti.brouwerFixedPoint_compactConvex
#check TauCeti.brouwerFixedPoint_compactConvex_continuousOn
#check TauCeti.brouwerFixedPoint_closedBall
#check TauCeti.brouwerFixedPoint_compactConvex_finiteSpan
#check TauCeti.HasHomotopyExtensionProperty.zero_one_prod_univ_union_univ_prod
#check TauCeti.HasHomotopyExtensionProperty.exists_inverse_homotopicRel
#check TauCeti.HasHomotopyExtensionProperty.exists_basedInverse_homotopicRel
#check TauCeti.RelHomotopyGroup.hurewicz
#check HomotopyGroup.hurewiczHom
#check IsCoveringMap.singularTransfer
#check IsCoveringMap.singularTransfer_comp_chainComplexMap
#check IsCoveringMap.singularTransfer_comp_chainComplexMap_eq_locallyConstantNsmul
#check IsCoveringMap.singularHomologyPermutationIso
#check TopCat.singularUniversalCoefficientEquiv
#check TopCat.exact_singularExtToCohomology_singularKronecker
#check TopCat.singularCohomologyBockstein
#check TopPair.singularCohomologyBockstein
#check TopCat.singularCohomologyMayerVietorisδ
#check TopCat.singularCohomologyPairMayerVietorisδ
#check TopCat.singularCup_gradedComm
#check Orientation.localOrientation_map
#check TauCeti.localOrientationOfManifoldOrientation
#check Topology.IsOpenEmbedding.localOrientationEquiv
#check TauCeti.localOrientationTransport
#check TauCeti.relCWComplexCylinder
#check TauCeti.exists_isCellular_homotopicRel
#check IsQuotientCoveringMap.singularCohomologyIsoGroupCohomology
#check TauCeti.classifyingSpaceSingularCohomologyIsoGroupCohomology
#check TauCeti.classifyingSpaceTwistedCohomologyIsoGroupCohomology
#check TauCeti.isAddTorsion_classifyingSpace_singularHomology
#check TauCeti.isKilledBySomePower_classifyingSpace_singularHomology
#check TauCeti.IsEilenbergMacLaneSpaceOne.nonempty_homotopyEquiv
#check TauCeti.circleHomotopyEquivClassifyingSpace

universe u v

/-! ## Stage 4.5: pair quotients, relative CW pushouts and cofibration extensions -/

/-- The subset of `X ⊕ *` collapsed by the pointed pair quotient: `B` together with the added
point. -/
def ordinaryCofiberSupport {X : Type u} (B : Set X) : Set (X ⊕ PUnit) :=
  {p | p.elim (fun x => x ∈ B) (fun _ => True)}

/-- The equivalence relation on `X ⊕ *` identifying all points of `B` with the added point and
nothing else. -/
def ordinaryCofiberSetoid {X : Type u} (B : Set X) : Setoid (X ⊕ PUnit) where
  r x y := x = y ∨ (x ∈ ordinaryCofiberSupport B ∧ y ∈ ordinaryCofiberSupport B)
  iseqv := by
    constructor
    · intro x
      exact Or.inl rfl
    · intro x y h
      rcases h with h | ⟨hx, hy⟩
      · exact Or.inl h.symm
      · exact Or.inr ⟨hy, hx⟩
    · intro x y z hxy hyz
      rcases hxy with rfl | ⟨hx, hy⟩
      · exact hyz
      · rcases hyz with rfl | ⟨_, hz⟩
        · exact Or.inr ⟨hx, hy⟩
        · exact Or.inr ⟨hx, hz⟩

/-- Stage 4.4's pointed pair quotient `X/B`: collapse `B` together with a separately added
basepoint, with the quotient topology; for `B = ∅` it is `X₊`. -/
def ordinaryPairQuotient (X : Type u) [TopologicalSpace X] (B : Set X) : TopCat.{u} :=
  TopCat.of (Quotient (ordinaryCofiberSetoid B))

/-- The basepoint of the pair quotient, the class of the added point. -/
def ordinaryPairQuotientPoint (X : Type u) [TopologicalSpace X] (B : Set X) :
    ordinaryPairQuotient X B := Quotient.mk (ordinaryCofiberSetoid B) (Sum.inr PUnit.unit)

/-- The collapse map from `X` to the pair quotient. -/
def ordinaryPairQuotientMap (X : Type u) [TopologicalSpace X] (B : Set X) :
    TopCat.of X ⟶ ordinaryPairQuotient X B :=
  TopCat.ofHom ⟨fun x => Quotient.mk (ordinaryCofiberSetoid B) (Sum.inl x), by
    let : Setoid (X ⊕ PUnit.{u + 1}) := ordinaryCofiberSetoid B
    exact continuous_quotient_mk'.comp continuous_inl⟩

/-- The collapse as a map of pairs `(X, B) ⟶ (X/B, *)`, whose target pair computes reduced
homology of the quotient. -/
def ordinaryPairQuotientPairMap (X : Type u) [TopologicalSpace X] (B : Set X) :
    TopPair.ofSubset (X := TopCat.of X) B ⟶
      TopPair.ofSubset (X := ordinaryPairQuotient X B) {ordinaryPairQuotientPoint X B} :=
  TopPair.ofSubsetMap (ordinaryPairQuotientMap X B) (by
    intro x hx
    change Quotient.mk (ordinaryCofiberSetoid B) (Sum.inl x) = Quotient.mk (ordinaryCofiberSetoid B) (Sum.inr PUnit.unit)
    exact Quotient.sound (Or.inr ⟨hx, trivial⟩))

/-- Stage 4.5, the CW-pair case of the closed-cofibration quotient comparison (Hatcher,
Proposition 2.22, p. 124, for good pairs; CW pairs are good by Proposition A.5): for a Hausdorff
relative CW pair `(X, B)` the collapse induces `H_n(X, B; M) ≅ H̃_n(X/B; M)` for every `n` and
every constant coefficient module `M`. -/
theorem ordinaryPairQuotientComparison (R : Type u) [CommRing R] (M : ModuleCat.{u} R)
    (X : Type u) [TopologicalSpace X] [T2Space X] (B : Set X)
    [RelCWComplex (Set.univ : Set X) B] (n : ℕ) :
    IsIso (TopPair.singularHomologyMap (ordinaryPairQuotientPairMap X B) M n) := by
  sorry

/-- Stage 4.5, the cohomological form (Hatcher, §3.1, Exercise 8(b), p. 205): the collapse induces
`H^n(X, B; M) ≅ H̃^n(X/B; M)` through the native contravariant pair map. -/
theorem ordinaryPairQuotientCohomologyComparison (R : Type u) [CommRing R]
    (M : ModuleCat.{u} R) (X : Type u) [TopologicalSpace X] [T2Space X] (B : Set X)
    [RelCWComplex (Set.univ : Set X) B] (n : ℕ) :
    IsIso (TopPair.singularCohomologyMap (R := ModuleCat.of R R) (k := R) (M := M)
      (ordinaryPairQuotientPairMap X B) n) := by
  sorry

section RelativeCWPushouts

variable {Y Z : Type u} [TopologicalSpace Y] [TopologicalSpace Z]
    [T2Space Y] [T2Space Z] (B : Set Y)

/-- The inclusion `B ⟶ Y` of the subspace of a relative CW pair, as a morphism of `TopCat`. -/
abbrev relativeCWPushoutInclusion : TopCat.of B ⟶ TopCat.of Y :=
  TopCat.ofHom ⟨Subtype.val, continuous_subtype_val⟩

/-- Stage 4.5's relative CW pushout `Z ∪_a Y`: the categorical pushout in `TopCat` of the
inclusion `B ⟶ Y` and an attaching map `a : B → Z`, with its quotient topology. -/
abbrev relativeCWPushoutCarrier (a : C(B, Z)) : TopCat.{u} :=
  pushout (relativeCWPushoutInclusion B) (TopCat.ofHom a)

/-- Stage 4.5: for a Hausdorff relative CW pair `(Y, B)` and a Hausdorff `Z`, the pushout
`Z ∪_a Y` is Hausdorff. Route: the pushout is a relative CW complex relative to `Z`, and the
target of a categorical relative CW complex with Hausdorff source is Hausdorff by the native
`TopCat.RelativeCWComplex.t2Space`, which separates points cell by cell; for an empty base this
is the Hausdorff part of Hatcher, Proposition A.3 (p. 522). -/
theorem relativeCWPushout_t2Space [RelCWComplex (Set.univ : Set Y) B]
    (a : C(B, Z)) :
    T2Space (relativeCWPushoutCarrier B a) := by
  sorry

/-- Stage 4.5: for closed cofibered pairs `(X, A)` and `(X', A')` and a homotopy equivalence `e`
carrying `A` into `A'` by a homotopy equivalence `e₀`, prescribed one-sided inverse data `g₀`
and `H₀ : g₀ ∘ e₀ ≃ id_A` extend to a left inverse `g` of `e` with `g ∘ e ≃ id_X` restricting to
`g₀` and `H₀`, and `g` is also a right inverse up to homotopy (Brown, *Topology and Groupoids*,
7.4.2 and its Addendum, pp. 285–286, which extend `H₀` only up to a track sum; Vogt 1972,
Proposition, p. 627, makes that sum homotopic to `H₀` rel ends, and Strøm's Theorem 6 for the
cylinder pair makes the restriction exactly `H₀`). -/
theorem homotopyInversePairExtension_left
    {X X' : Type u} [TopologicalSpace X] [TopologicalSpace X']
    (A : Set X) (A' : Set X')
    (hAc : IsClosed A) (hAc' : IsClosed A')
    (hA : TauCeti.HasHomotopyExtensionProperty A)
    (hA' : TauCeti.HasHomotopyExtensionProperty A')
    (e : ContinuousMap.HomotopyEquiv X X')
    (e₀ : ContinuousMap.HomotopyEquiv A A')
    (he : ∀ a : A, e (a : X) = (e₀ a : X'))
    (g₀ : C(A', A))
    (H₀ : ContinuousMap.Homotopy (g₀.comp e₀.toFun) (ContinuousMap.id A)) :
    ∃ (g : C(X', X))
      (H : ContinuousMap.Homotopy (g.comp e.toFun) (ContinuousMap.id X)),
      (∀ a' : A', g (a' : X') = (g₀ a' : X)) ∧
      (∀ (t : unitInterval) (a : A), H (t, (a : X)) = (H₀ (t, a) : X)) ∧
      (e.toFun.comp g).Homotopic (ContinuousMap.id X') := by
  sorry

end RelativeCWPushouts

/-! ## Stage 4.8: CW approximation of an arbitrary space -/

/-- Stage 4.8 (Hatcher, Proposition 4.13): every space is the target of a weak homotopy
equivalence from a space of CW type. The path-connected case is native,
`TauCeti.isWeakHomotopyEquivalence_cwApproximationMap`; the general case approximates each path
component. -/
theorem exists_cwApproximation (X : Type u) [TopologicalSpace X] :
    ∃ (Z : Type u) (_ : TopologicalSpace Z), TauCeti.CWType Z ∧
      ∃ f : C(Z, X), f.IsWeakHomotopyEquivalence := by
  sorry

/-! ## Stage 5.5: the homotopy sequence of a Serre fibration -/

/-- Stage 5.5 (Hatcher, Theorem 4.41): for a Serre fibration `p : E ⟶ B`, a point `b` of `B` and
a point `e` of the fibre `F = p⁻¹(b)`, the map of based pairs `(E, F, e) ⟶ (B, {b}, b)` induced
by `p` is a bijection `π_{n+1}(E, F, e) → π_{n+1}(B, {b}, b)` of native relative homotopy sets
for every `n`; the native `RelHomotopyGroup (Fin n)` is `π_{n+1}`. With the native exact sequence
of the pair `(E, F)` this is the homotopy long exact sequence of the fibration. -/
theorem relHomotopyGroup_map_bijective_of_mem_serreFibrations {E B : TopCat.{u}} (p : E ⟶ B)
    (hp : TauCeti.TopCat.serreFibrations p) (b : B) (e : E) (he : p e = b) (n : ℕ) :
    Function.Bijective (TauCeti.RelHomotopyGroup.map (N := Fin n)
      (X := ⟨TopPair.ofSubset (X := E) (p ⁻¹' {b}), ⟨e, he⟩⟩)
      (Y := ⟨TopPair.ofSubset (X := B) {b}, ⟨b, rfl⟩⟩)
      ⟨TopPair.ofSubsetMap p (fun _ hx => hx),
        Subtype.ext ((TopPair.ofSubsetMap_snd_apply p _ _).trans he)⟩) := by
  sorry

/-! ## Stages 6.2–6.4: cohomology, cup and cap products, local coefficients and duality -/

/-- Singular homology with coefficients in a module, as a module. -/
abbrev SingularHomology (R : Type u) [CommRing R] (M : ModuleCat.{u} R)
    (X : TopCat.{u}) (n : ℕ) : ModuleCat.{u} R :=
  ((AlgebraicTopology.singularHomologyFunctor (ModuleCat.{u} R) n).obj M).obj X

/-- Singular cohomology with coefficients in the ring, the native `TopCat.singularCohomology`. -/
abbrev singularCohomology (R : Type u) [CommRing R]
    (X : TopCat.{u}) (n : ℕ) : ModuleCat.{u} R :=
  X.singularCohomology (ModuleCat.of R R) R (ModuleCat.of R R) n

/-- Cap product with the Alexander–Whitney sign convention.  With natural-number grading the
complementary-degree hypothesis prevents truncated subtraction from pretending that a negative
target degree is degree zero. -/
def capProduct (R : Type u) [CommRing R] (X : TopCat.{u}) (p q : ℕ)
    (hpq : p ≤ q) :
    singularCohomology R X p ⟶
      ModuleCat.of R (SingularHomology R (ModuleCat.of R R) X q →ₗ[R]
        SingularHomology R (ModuleCat.of R R) X (q - p)) :=
  ModuleCat.ofHom ((ModuleCat.homLinearEquiv (S := R)).toLinearMap.comp
    (X.singularCap R (MonoidalCategory.leftUnitor (ModuleCat.of R R)).inv (MonoidalCategory.leftUnitor (ModuleCat.of R R)).hom
      p (q - p) q (Nat.add_sub_of_le hpq)))

/-- The native cup product with the same Alexander–Whitney pairing and degree pin. -/
def cupProduct (R : Type u) [CommRing R] (X : TopCat.{u}) (p q : ℕ) :
    singularCohomology R X p →ₗ[R] singularCohomology R X q →ₗ[R]
      singularCohomology R X (p + q) :=
  X.singularCup R (MonoidalCategory.leftUnitor (ModuleCat.of R R)).inv
    (MonoidalCategory.leftUnitor (ModuleCat.of R R)).hom p q (p + q) rfl

/-- Tau Ceti's local coefficient systems on `X`, functors from the fundamental groupoid to
`R`-modules, in one universe. -/
abbrev LocalCoefficientSystem (R : Type u) [CommRing R] (X : TopCat.{u}) :=
  TauCeti.LocalCoefficientSystem.{u, u, u} R X

/-- The pair `(X, X ∖ {x})` whose relative homology is the local homology at `x`. -/
def puncturedPair (X : TopCat.{u}) (x : X) : TopPair.{u} :=
  TopPair.ofSubset ({x}ᶜ : Set X)

/-- Relative singular chains of a pair with coefficients in a local system on the ambient space:
a simplex carries its coefficient at its first vertex, and the zeroth face transports along the
first edge. -/
abbrev twistedRelativeSingularChainComplex (R : Type u) [CommRing R]
    (P : TopPair.{u}) (L : LocalCoefficientSystem R P.fst) :
    ChainComplex (ModuleCat.{u} R) ℕ := P.twistedChainComplex L

/-- Relative singular homology with local coefficients. -/
abbrev twistedRelativeHomology (R : Type u) [CommRing R]
    (P : TopPair.{u}) (L : LocalCoefficientSystem R P.fst) (n : ℕ) : ModuleCat.{u} R :=
  (twistedRelativeSingularChainComplex R P L).homology n

/-- The pair map `(X, X ∖ B) ⟶ (X, X ∖ {x})` for a point `x` of `B`. -/
def supportLocalPairMap (X : TopCat.{u}) (B : Set X) (x : X) (hx : x ∈ B) :
    TopPair.ofSubset Bᶜ ⟶ puncturedPair X x :=
  TopPair.ofHom (𝟙 X)
    (TopCat.ofHom ⟨fun y => ⟨y.val, fun h => y.prop (h.symm ▸ hx)⟩,
      continuous_subtype_val.subtype_mk _⟩)

/-- The local image at `x ∈ B` of a class supported in `B`, by native pair functoriality of
twisted homology. -/
def twistedSupportLocalMap (R : Type u) [CommRing R]
    (X : TopCat.{u}) (L : LocalCoefficientSystem R X) (n : ℕ)
    (B : Set X) (x : X) (hx : x ∈ B) :
    twistedRelativeHomology R (TopPair.ofSubset Bᶜ) L n ⟶
      twistedRelativeHomology R (puncturedPair X x) L n :=
  (TopPair.ofSubset Bᶜ).twistedHomologyCoefficientMap
    ((TauCeti.LocalCoefficientSystem.pullbackIdIso X).app L).inv n ≫
    TopPair.twistedHomologyMap (supportLocalPairMap X B x hx) L n

/-- A section of local top homology over `V` that is locally represented: each point of `V` has
an open neighbourhood `B ⊆ V` and one class supported in `B` whose local images are the given
values on `B`. On a manifold these neighbourhoods may be refined to coordinate balls. -/
structure LocallyRepresentedTopSection (R : Type u) [CommRing R]
    (X : TopCat.{u}) (L : LocalCoefficientSystem R X) (n : ℕ) (V : Set X) where
  /-- The value of the section at each point of `V`. -/
  localValue : ∀ x : X, x ∈ V →
    twistedRelativeHomology R (puncturedPair X x) L n
  /-- The values are locally the images of one supported class. -/
  locally_represented : ∀ x : X, x ∈ V →
    ∃ B : Set X, ∃ hBV : B ⊆ V, IsOpen B ∧ x ∈ B ∧
      ∃ c : twistedRelativeHomology R (TopPair.ofSubset Bᶜ) L n,
        ∀ y : X, ∀ hy : y ∈ B,
          twistedSupportLocalMap R X L n B y hy c = localValue y (hBV hy)

/-- Twisted homology supported in `K`: the relative group of the pair `(X, X ∖ K)`. -/
abbrev supportedTwistedHomology (R : Type u) [CommRing R] (X : TopCat.{u})
    (L : LocalCoefficientSystem R X) (n : ℕ) (K : Set X) : ModuleCat.{u} R :=
  twistedRelativeHomology R (TopPair.ofSubset Kᶜ) L n

/-- Existence half of the compact-support theorem of Stage 6.3 with local coefficients (Hatcher,
Lemma 3.27(a), extended to local systems): on a Hausdorff topological `m`-manifold without
boundary, a locally represented top section on an open `V` is the family of local images of one
class supported in a compact `K ⊆ V`. The constant-coefficient
case is native, `TauCeti.exists_localHomologyRestriction_eq_of_isCompact`. -/
theorem compactSupportTopClass_exists (R : Type) [CommRing R] (m : ℕ) (M : Type)
    [TopologicalSpace M] [T2Space M] [ChartedSpace (EuclideanSpace ℝ (Fin m)) M]
    (L : LocalCoefficientSystem R (TopCat.of M)) (K V : Set (TopCat.of M))
    (hK : IsCompact K) (hV : IsOpen V) (hKV : K ⊆ V)
    (s : LocallyRepresentedTopSection R (TopCat.of M) L m V) :
    ∃ c : supportedTwistedHomology R (TopCat.of M) L m K,
      ∀ x : TopCat.of M, ∀ hx : x ∈ K,
        twistedSupportLocalMap R (TopCat.of M) L m K x hx c = s.localValue x (hKV hx) := by
  sorry

/-- Uniqueness half of the compact-support theorem with local coefficients: on a Hausdorff
topological `m`-manifold without boundary, in the top degree a class supported in a compact `K` is
determined by its local images at the points of `K`. The
constant-coefficient case is native, `TauCeti.localHomology_ext_of_isCompact`. -/
theorem compactSupportTopClass_unique (R : Type) [CommRing R] (m : ℕ) (M : Type)
    [TopologicalSpace M] [T2Space M] [ChartedSpace (EuclideanSpace ℝ (Fin m)) M]
    (L : LocalCoefficientSystem R (TopCat.of M)) (K : Set (TopCat.of M)) (hK : IsCompact K)
    (c c' : supportedTwistedHomology R (TopCat.of M) L m K)
    (h : ∀ x : TopCat.of M, ∀ hx : x ∈ K,
      twistedSupportLocalMap R (TopCat.of M) L m K x hx c =
        twistedSupportLocalMap R (TopCat.of M) L m K x hx c') :
    c = c' := by
  sorry

/-- Stage 6.4 with `ℤ/2` coefficients, where every manifold is orientable (Hatcher, Theorem 3.30,
p. 241, with `R = ℤ/2`): a closed topological `n`-manifold has a class `c ∈ H_n(M; ℤ/2)` such that
capping with `c` is an isomorphism `H^p(M; ℤ/2) ≅ H_(n-p)(M; ℤ/2)` for every `p ≤ n`. The class is
the `ℤ/2` fundamental class of Stage 6.3; the integral form is `poincareDuality_int`, and the form
with local coefficients needs the orientation local system, which is data and is not stated
here. -/
theorem poincareDuality_zmodTwo (n : ℕ) (M : Type) [TopologicalSpace M] [T2Space M]
    [CompactSpace M] [ChartedSpace (EuclideanSpace ℝ (Fin n)) M] :
    ∃ c : SingularHomology (ZMod 2) (ModuleCat.of (ZMod 2) (ZMod 2)) (TopCat.of M) n,
      ∀ (p : ℕ) (hp : p ≤ n),
        Function.Bijective (fun a : singularCohomology (ZMod 2) (TopCat.of M) p =>
          (capProduct (ZMod 2) (TopCat.of M) p n hp).hom a c) := by
  sorry

/-- Stage 6.4, integral Poincaré duality (Hatcher, Theorem 3.30, p. 241, with `R = ℤ`): for a
closed topological `n`-manifold `M` with a homological orientation `o`, capping with the
fundamental class of `o` is an isomorphism `H^p(M; ℤ) ≅ H_(n-p)(M; ℤ)` for every `p ≤ n`. The
native class `TauCeti.HomologicalOrientation.fundamentalClass` lies in homology with coefficients
`ULift ℤ`; it is carried to coefficients `ℤ` by the coefficient isomorphism `ULift ℤ ≅ ℤ`. -/
theorem poincareDuality_int (n : ℕ) (M : Type) [TopologicalSpace M] [T2Space M]
    [CompactSpace M] [ChartedSpace (EuclideanSpace ℝ (Fin n)) M]
    (o : TauCeti.HomologicalOrientation M (EuclideanSpace ℝ (Fin n)) n) (p : ℕ) (hp : p ≤ n) :
    Function.Bijective (fun a : singularCohomology ℤ (TopCat.of M) p =>
      (capProduct ℤ (TopCat.of M) p n hp).hom a
        ((((AlgebraicTopology.singularHomologyFunctor (ModuleCat.{0} ℤ) n).map
            (ULift.moduleEquiv (R := ℤ) (M := ℤ)).toModuleIso.hom).app (TopCat.of M)).hom
          (o.fundamentalClass finrank_euclideanSpace_fin))) := by
  sorry

/-! ## The categorical supplement after Stage 6.2: cup length -/

/-- A nonzero-length cup product of positive-degree classes: `LSPositiveCupProduct X R r ⟨d, a⟩`
says that `a ∈ H^d(X; R)` is a product of `r` classes of positive degree. -/
inductive LSPositiveCupProduct (X : TopCat.{u}) (R : Type u) [CommRing R] :
    ℕ → (Σ d : ℕ, singularCohomology R X d) → Prop where
  | single (d : ℕ) (hd : 0 < d) (a : singularCohomology R X d) :
      LSPositiveCupProduct X R 1 ⟨d, a⟩
  | mul {r p q : ℕ} (a : singularCohomology R X p) (b : singularCohomology R X q)
      (ha : LSPositiveCupProduct X R r ⟨p, a⟩) (hq : 0 < q) :
      LSPositiveCupProduct X R (r + 1) ⟨p + q, cupProduct R X p q a b⟩

/-- The cup length of `X` over `R`: the supremum of the lengths of nonzero products of
positive-degree classes, `0` when there is none. -/
def lsCupLength (X : TopCat.{u}) (R : Type u) [CommRing R] : ℕ∞ :=
  sSup {m : ℕ∞ | ∃ r : ℕ, m = (r : ℕ∞) ∧
    ∃ d : ℕ, ∃ a : singularCohomology R X d,
      a ≠ 0 ∧ LSPositiveCupProduct X R r ⟨d, a⟩}

/-- The cup-length lower bound for the unnormalized Lusternik–Schnirelmann category: on a
nonempty space, `cupLength + 1 ≤ lsCategoryCount X X`, the count being Tau Ceti's native
`TauCeti.lsCategoryCount` (Hatcher, §3.2, Exercise 2, p. 229, for covers by contractible opens;
the relative cup product argument needs only that each open is contractible in `X`). -/
theorem lsCupLength_add_one_le_categoryCount (X : TopCat.{u}) [Nonempty X]
    (R : Type u) [CommRing R] :
    lsCupLength X R + 1 ≤ TauCeti.lsCategoryCount X Set.univ := by
  sorry

/-! ## Stage 8.4: relative Hurewicz with only the subspace simply connected -/

/-- Stage 8.4 (Hatcher, Theorem 4.37): for a path-connected `Y`, a simply connected subspace `B`
with `b ∈ B`, and the relative homotopy sets `π_i(Y, B, b)` trivial for `1 ≤ i ≤ n + 1`, the
native relative Hurewicz map `π_{n+2}(Y, B, b) → H_{n+2}(Y, B; ℤ)`, `[p] ↦ p_*[Iⁿ⁺²]`, is
bijective, in every degree at least two. The native `RelHomotopyGroup (Fin k)` is `π_{k+1}`.
The native theorem `TauCeti.RelHomotopyGroup.bijective_hurewicz_of_subsingleton_homotopyGroup`
assumes instead that `Y` is also highly connected; in degree two (`n = 0`) the two sets of
hypotheses agree, since `π₁(B) = 0` and `π₁(Y, B) = 0` force `π₁(Y) = 0` by the pair sequence. -/
theorem relHurewicz_bijective_of_simplyConnected_subspace {Y : TopCat.{0}} (B : Set Y) (b : B)
    [PathConnectedSpace Y] (n : ℕ)
    (hB : ∀ k < 2, Subsingleton (HomotopyGroup (Fin k) B b))
    (hrel : ∀ k ≤ n, Subsingleton (TauCeti.RelHomotopyGroup (Fin k) ⟨TopPair.ofSubset B, b⟩)) :
    Function.Bijective fun a : TauCeti.RelHomotopyGroup (Fin (n + 1)) ⟨TopPair.ofSubset B, b⟩ ↦
      (TauCeti.RelHomotopyGroup.hurewicz (ModuleCat.of ℤ ℤ) (n + 1) a).hom 1 := by
  sorry

/-! ## Stage 8.5: homological Whitehead and proper homotopy rectification -/

/-- Stage 8.5 (Hatcher, Corollary 4.33, p. 367): a map between simply connected spaces of CW
type inducing isomorphisms on integral singular homology is the forward map of a homotopy
equivalence. Whitehead's theorem itself is native,
`ContinuousMap.IsWeakHomotopyEquivalence.homotopyEquiv`. -/
theorem homologicalWhitehead
    {X Y : Type} [TopologicalSpace X] [TopologicalSpace Y]
    [SimplyConnectedSpace X] [SimplyConnectedSpace Y]
    [TauCeti.CWType X] [TauCeti.CWType Y]
    (f : C(X, Y))
    (_hf : ∀ n : ℕ,
      IsIso (((AlgebraicTopology.singularHomologyFunctor (ModuleCat.{0} ℤ) n).obj
        (ModuleCat.of ℤ ℤ)).map (TopCat.ofHom f))) :
    ∃ e : X ≃ₕ Y, e.toFun = f := by
  sorry

/-- The proper homotopy extension property of a subspace: a proper map on `X` and a proper
homotopy of its restriction to `A` extend to a jointly proper homotopy on the whole cylinder.
Stage 8.5 proves it for strongly locally finite CW pairs (Farrell–Taylor–Wagoner 1973,
Theorem 1.6, p. 3) and their product pairs. -/
def HasProperHomotopyExtensionProperty {X : Type u} [TopologicalSpace X]
    (A : Set X) : Prop :=
  ∀ (Y : Type u) [TopologicalSpace Y],
    ∀ (f : C(X, Y)), IsProperMap f →
    ∀ (H : C(unitInterval × A, Y)), IsProperMap H →
      (∀ a : A, H (0, a) = f (a : X)) →
      ∃ K : C(unitInterval × X, Y), IsProperMap K ∧
        (∀ x : X, K (0, x) = f x) ∧
        (∀ (t : unitInterval) (a : A), K (t, (a : X)) = H (t, a))

/-- Stage 8.5: proper extension for a closed pair `(X, A)` gives proper extension for the
cylinder-boundary pair `(I × X, (∂I × X) ∪ (I × A))`, in the native `I × X` order. This is the
proper form of Strøm's product theorem (*Note on cofibrations II*, Theorem 6, p. 135): proper
extension for `(X, A)` gives a proper retraction of `I × X` onto `({0} × X) ∪ (I × A)`, the
retraction criterion in the proof of Farrell–Taylor–Wagoner 1973, Theorem 1.6, and the retraction
of the square onto three sides keeps it proper because the square is compact. -/
theorem HasProperHomotopyExtensionProperty.cylinderBoundary
    {X : Type u} [TopologicalSpace X] [T2Space X] [LocallyCompactSpace X]
    {A : Set X} (hA : HasProperHomotopyExtensionProperty A) (hAc : IsClosed A) :
    HasProperHomotopyExtensionProperty
      ((({0, 1} : Set unitInterval).prod (Set.univ : Set X)) ∪
        (Set.univ : Set unitInterval).prod A) := by
  sorry

/-- Stage 8.5, proper homotopy rectification: if the inclusion of a closed `A` with the proper
homotopy extension property is a proper homotopy equivalence in the native sense
`ContinuousMap.HasProperHomotopyInverse`, then `A` is a proper strong deformation retract of
`X`: there is a proper retraction and a jointly proper homotopy from the identity to it, fixed on
`A`. This is the proper form of Hatcher, Proposition 0.19 and Corollary 0.20 (p. 16), with each
extension step made proper by `HasProperHomotopyExtensionProperty.cylinderBoundary`. -/
theorem properStrongDeformationRetract_of_inverse
    {X : Type u} [TopologicalSpace X] [T2Space X] [LocallyCompactSpace X]
    (A : Set X) (hA : HasProperHomotopyExtensionProperty A)
    (hInverse : ContinuousMap.HasProperHomotopyInverse
      (⟨Subtype.val, continuous_subtype_val⟩ : C(A, X))) :
    ∃ r : C(X, A), IsProperMap r ∧ (∀ a : A, r (a : X) = a) ∧
      ∃ H : (ContinuousMap.id X).HomotopyRel
        ((⟨Subtype.val, continuous_subtype_val⟩ : C(A, X)).comp r) A,
        IsProperMap H := by
  sorry

/-! ## Stage 8.7: finite CW type of compact manifolds -/

open scoped Manifold ContDiff in
/-- Stage 8.7: a compact Hausdorff second-countable smooth manifold has finite CW type, in the
native sense `TauCeti.FiniteCWType`, through GeometricTopology's smooth triangulation and the
native `TauCeti.IsTriangulable.finiteCWType` (alternatively Milnor, *Morse Theory*, Theorem 3.5,
applied to a Morse function, which has finitely many critical points on a compact manifold). Its
Euler characteristic is then the native `TauCeti.eulerChar`. -/
theorem compactManifoldFiniteCWType (n : ℕ)
    (M : Type u) [TopologicalSpace M] [T2Space M] [SecondCountableTopology M]
    [CompactSpace M] [ChartedSpace (EuclideanSpace ℝ (Fin n)) M]
    [IsManifold (modelWithCornersSelf ℝ (EuclideanSpace ℝ (Fin n))) ∞ M] :
    TauCeti.FiniteCWType M := by
  sorry

/-! ## Stage 8.8a: the bar model of `K(π, 1)` -/

/-- The bar/nerve realization `|N(π)|` of a discrete group, Stage 8.8a's generic classifying
space. -/
abbrev groupClassifyingSpace (G : Type u) [Group G] : TopCat.{u} :=
  SSet.toTop.obj (CategoryTheory.nerve (SingleObj G))

open scoped Simplicial in
/-- The unique bar vertex, realized. -/
def groupClassifyingSpaceBasepoint (G : Type u) [Group G] :
    groupClassifyingSpace G :=
  (SSet.toTop.map (SSet.const (X := SSet.stdSimplex.obj ⦋0⦌)
    (CategoryTheory.nerveEquiv.symm (SingleObj.star G))))
      ((SSet.toTopSimplex.app ⦋0⦌).inv
        (default : SimplexCategory.toTop.obj ⦋0⦌))

/-- Stage 8.8a: the bar model is a `K(G, 1)` in the native sense: aspherical with fundamental
group `G`, through the contractible free `G`-space `|E G|` covering it (Hatcher, Example 1B.7,
p. 89, for the Δ-complex with the same simplices; the contraction of `E G` and the free deck
action are the same on the realized nerve). -/
theorem groupClassifyingSpace_isEMOne (G : Type u) [Group G] :
    TauCeti.IsEilenbergMacLaneSpaceOne G (groupClassifyingSpace G)
      (groupClassifyingSpaceBasepoint G) := by
  sorry

/-! ## Stage 8.8b: pointed maps from a connected CW complex into an aspherical space -/

/-- Stage 8.8b (Hatcher, Proposition 1B.9): for a path-connected Hausdorff CW complex `X` with
base point `x` and a space `Y` with base point `y` that is aspherical in the native sense
(path connected with `π_k(Y, y) = 0` for `k ≥ 2`), every homomorphism `π₁(X, x) →* π₁(Y, y)`
is induced by a map sending `x` to `y`, and two such maps inducing the same homomorphism are
homotopic relative to `{x}`. Applied to the bar model `groupClassifyingSpace π`, aspherical by
`groupClassifyingSpace_isEMOne`, this is the bijection `[X, Bπ]_* ≃ Hom(π₁(X, x), π)`. -/
theorem exists_mapOfEq_eq_of_isAspherical_cwComplex
    {X : Type u} [TopologicalSpace X] [T2Space X] [CWComplex (Set.univ : Set X)]
    [PathConnectedSpace X] (x : X)
    {Y : Type v} [TopologicalSpace Y] {y : Y} (_hY : TauCeti.IsAspherical Y y)
    (φ : FundamentalGroup X x →* FundamentalGroup Y y) :
    ∃ (f : C(X, Y)) (hf : f x = y),
      (∀ γ, FundamentalGroup.mapOfEq f hf γ = φ γ) ∧
        ∀ (g : C(X, Y)) (hg : g x = y), (∀ γ, FundamentalGroup.mapOfEq g hg γ = φ γ) →
          ContinuousMap.HomotopicRel f g {x} := by
  sorry

/-! ## Stage 8.8d: Serre classes and Hurewicz modulo a class -/

/-- A homomorphism of abelian groups is a `C`-epimorphism when its cokernel lies in `C`. -/
def IsCEpi (C : ObjectProperty AddCommGrpCat.{0}) {A B : Type} [AddCommGroup A] [AddCommGroup B]
    (f : A →+ B) : Prop :=
  C (AddCommGrpCat.of (B ⧸ f.range))

/-- A homomorphism of abelian groups is a `C`-isomorphism when its kernel and its cokernel lie
in `C`. -/
def IsCIso (C : ObjectProperty AddCommGrpCat.{0}) {A B : Type} [AddCommGroup A] [AddCommGroup B]
    (f : A →+ B) : Prop :=
  C (AddCommGrpCat.of f.ker) ∧ IsCEpi C f

/-- Serre's axioms on a class `C` of abelian groups beyond closure under subobjects, quotients
and extensions: `A ⊗ B` and `Tor₁(A, B)` lie in `C` for `A, B ∈ C`, and the positive-degree
integral homology of `K(A, 1)`, taken on Milnor's classifying space of `A`, lies in `C` for
`A ∈ C` (Serre 1953, Chapter I, axioms (II_A) and (III)). The native torsion classes satisfy the
first two, and the third for finite `A`. -/
structure SatisfiesSerreAxioms (C : ObjectProperty AddCommGrpCat.{0}) : Prop where
  /-- Closure under tensor products of two members. -/
  tensor : ∀ A B : AddCommGrpCat.{0}, C A → C B → C (AddCommGrpCat.of (TensorProduct ℤ A B))
  /-- Closure under `Tor₁` of two members. -/
  tor : ∀ A B : AddCommGrpCat.{0}, C A → C B →
    C (AddCommGrpCat.of (((Tor (ModuleCat.{0} ℤ) 1).obj (ModuleCat.of ℤ A)).obj (ModuleCat.of ℤ B)))
  /-- The `K(A, 1)` axiom: the positive-degree homology of `B(Multiplicative A)` lies in `C`. -/
  eilenbergMacLane : ∀ A : AddCommGrpCat.{0}, C A → ∀ n : ℕ,
    C (AddCommGrpCat.of (((TauCeti.singularChains ℤ).obj
      (TopCat.of (TauCeti.classifyingSpace (Multiplicative A)))).homology (n + 1)))

/-- Stage 8.8d, Hurewicz modulo a Serre class: for a Serre class `C` satisfying Serre's axioms
and a simply connected `X` whose homotopy groups `π_i(X)` for `2 ≤ i < n + 2` lie in `C`, the
integral homology `H_i(X; ℤ)` lies in `C` for `0 < i < n + 2`, the native Hurewicz homomorphism in
degree `n + 2` is a `C`-isomorphism, and the one in degree `n + 3` is a `C`-epimorphism (Serre
1953, Chapter III, Theorem 1, for all three clauses; Hatcher, *Spectral Sequences in Algebraic
Topology*, Theorem 1.8, p. 14, proves the `C`-isomorphism clause for the finitely generated,
torsion and finite classes). For `C = 0` this is the absolute Hurewicz theorem. -/
theorem hurewicz_isCIso (C : ObjectProperty AddCommGrpCat.{0}) [C.IsSerreClass]
    (hC : SatisfiesSerreAxioms C) (X : Type) [TopologicalSpace X] [SimplyConnectedSpace X]
    (x : X) (n : ℕ)
    (hπ : ∀ i < n, C (AddCommGrpCat.of (Additive (HomotopyGroup (Fin (i + 2)) X x)))) :
    (∀ i, 0 < i → i < n + 2 →
      C (AddCommGrpCat.of (SingularHomology ℤ (ModuleCat.of ℤ ℤ) (TopCat.of X) i))) ∧
    IsCIso C (HomotopyGroup.hurewiczHom (X := X) (x := x) (ModuleCat.of ℤ ℤ) (n + 1)) ∧
    IsCEpi C (HomotopyGroup.hurewiczHom (X := X) (x := x) (ModuleCat.of ℤ ℤ) (n + 2)) := by
  sorry

/-! ## Stage 8.10: ordinary representability -/

/-- The data of a `K(A, n)` model: a path-connected Hausdorff CW space with a normalized
identification of `π_n` with `A`. Vanishing is for every other positive degree, with no
finite-dimension condition. -/
structure OrdinaryEMModel (A : Type u) [AddCommGroup A] (n : ℕ) [NeZero n] where
  /-- The model space. -/
  space : TopCat.{u}
  /-- Its basepoint. -/
  point : space
  /-- The model is Hausdorff. -/
  hausdorff : T2Space space
  /-- The model carries a CW structure. -/
  cw : CWComplex (Set.univ : Set space)
  /-- The model is path connected. -/
  connected : PathConnectedSpace space
  /-- The normalized identification of `π_n` with `A`. -/
  homotopyIdentification : HomotopyGroup (Fin n) space point ≃* Multiplicative A
  /-- Every other positive homotopy group vanishes. -/
  vanishing : ∀ j : ℕ, 0 < j → j ≠ n →
    Subsingleton (HomotopyGroup (Fin j) space point)

/-- Homotopy of continuous maps, as a setoid on `C(X, Y)`. -/
def continuousHomotopySetoid (X Y : TopCat.{u}) : Setoid C(X, Y) where
  r := ContinuousMap.Homotopic
  iseqv := ContinuousMap.Homotopic.equivalence

/-- Free homotopy classes of maps `[X, Y]`. -/
abbrev continuousHomotopyClasses (X Y : TopCat.{u}) :=
  Quotient (continuousHomotopySetoid X Y)

/-- Pullback of a fixed class `ι` along homotopy classes of maps into `K`, descended by the
native homotopy invariance of singular cohomology. -/
def ordinaryEMPullback (A : Type u) [AddCommGroup A] (n : ℕ) (K : TopCat.{u})
    (ι : K.singularCohomology (ModuleCat.of ℤ (ULift.{u} ℤ)) ℤ (ModuleCat.of ℤ A) n)
    (X : TopCat.{u}) :
    continuousHomotopyClasses X K →
      X.singularCohomology (ModuleCat.of ℤ (ULift.{u} ℤ)) ℤ (ModuleCat.of ℤ A) n :=
  Quotient.lift (fun f => TopCat.singularCohomologyMap (TopCat.ofHom f) n ι) (by
      intro f g h
      obtain ⟨H⟩ := h
      have heq := TopCat.Homotopy.congr_singularCohomologyMap
        (f := TopCat.ofHom f) (g := TopCat.ofHom g) H
        (ModuleCat.of ℤ (ULift.{u} ℤ)) ℤ (ModuleCat.of ℤ A) n
      exact congrArg (fun q => q.hom ι) heq)

/-- Stage 8.10 (Hatcher, Theorem 4.57, p. 393, with free and based classes compared by
Proposition 4A.2): every `K(A, n)` model represents `H^n(-; A)` on arbitrary Hausdorff CW
complexes, of any dimension and with any number of components. The README's universal class is
normalized through the Hurewicz map; the existence of a representing class is the statable
content. -/
theorem ordinaryEMRepresentability (A : Type u) [AddCommGroup A] (n : ℕ) [NeZero n]
    (K : OrdinaryEMModel A n) :
    ∃ ι : K.space.singularCohomology (ModuleCat.of ℤ (ULift.{u} ℤ)) ℤ (ModuleCat.of ℤ A) n,
      ∀ (X : TopCat.{u}) [T2Space X] [CWComplex (Set.univ : Set X)],
        Function.Bijective (ordinaryEMPullback A n K.space ι X) := by
  sorry

/-! ## Stage 8.11a: CW type of mapping spaces -/

/-- Stage 8.11a (Milnor 1959, Theorem 3, p. 276, the case of `1`-ads): for a finite Hausdorff CW
complex `K` and a space `X` of CW type, the mapping space `C(K, X)` with the compact-open topology
has CW type. -/
theorem finiteSourceMappingCWType (K X : Type u) [TopologicalSpace K] [TopologicalSpace X]
    [T2Space K] [CWComplex (Set.univ : Set K)] [CWComplex.Finite (Set.univ : Set K)]
    [TauCeti.CWType X] :
    TauCeti.CWType C(K, X) := by
  sorry

open scoped Topology.Homotopy in
/-- Stage 8.11a (Milnor 1959, Corollary 3, p. 276): the based loop space of a Hausdorff CW
complex at a 0-cell, Mathlib's generalized loops `Ω^ (Fin 1) X x`, has CW type. -/
theorem basedLoopCWType (X : Type u) [TopologicalSpace X] [T2Space X]
    [CWComplex (Set.univ : Set X)] (x : X)
    (hx : ∃ i : Topology.RelCWComplex.cell (Set.univ : Set X) 0,
      x ∈ Topology.RelCWComplex.openCell (C := (Set.univ : Set X)) 0 i) :
    TauCeti.CWType (Ω^ (Fin 1) X x) := by
  sorry

end

end TauCetiRoadmap.AlgebraicTopology
