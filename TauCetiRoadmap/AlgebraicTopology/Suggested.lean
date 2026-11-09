module

public import Mathlib
public import TauCeti.AlgebraicTopology.Singular.Twisted.Relative
public import TauCeti.AlgebraicTopology.Singular.Twisted.Functoriality
public import TauCeti.AlgebraicTopology.Cohomology.Basic
public import TauCeti.AlgebraicTopology.Cohomology.HomotopyInvariance
public import TauCeti.AlgebraicTopology.Cohomology.Cap.Basic
public import TauCeti.AlgebraicTopology.Cohomology.Cup
public import TauCeti.AlgebraicTopology.Cohomology.Kronecker
public import TauCeti.AlgebraicTopology.EilenbergMacLane.Basic
public import TauCeti.AlgebraicTopology.Cellular.Comparison
public import TauCeti.AlgebraicTopology.Cellular.EulerCharacteristic.FiniteCWType
public import TauCeti.AlgebraicTopology.Singular.Kunneth.Basic
public import TauCeti.AlgebraicTopology.Singular.LocalHomology.Compact
public import TauCeti.AlgebraicTopology.Singular.LocalHomology.FundamentalClass
public import TauCeti.AlgebraicTopology.Singular.LocalHomology.Orientation.Homological
public import TauCeti.AlgebraicTopology.Singular.Homotopy.WeakHomotopyEquivalence
public import TauCeti.AlgebraicTopology.Homotopy.Hurewicz.One.Basic
public import TauCeti.AlgebraicTopology.Homotopy.Hurewicz.Absolute
public import TauCeti.AlgebraicTopology.Homotopy.Hurewicz.Relative
public import TauCeti.AlgebraicTopology.Homotopy.Whitehead
public import TauCeti.AlgebraicTopology.Homotopy.CWApproximation.Naturality
public import TauCeti.AlgebraicTopology.Homotopy.Relative.CellDimension
public import TauCeti.AlgebraicTopology.Homotopy.KillHomotopyGroups
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
public import TauCeti.Topology.Homotopy.HomotopyGroup.Product
public import TauCeti.Topology.Homotopy.HomotopyGroup.LoopSpace
public import TauCeti.Topology.Homotopy.Extension.DeformationRetract
public import TauCeti.Topology.Homotopy.Extension.MappingCylinder
public import TauCeti.Topology.Homotopy.Extension.Prod
public import TauCeti.Topology.Homotopy.Extension.HomotopyEquivRel
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
public import TauCeti.Topology.Category.TopCat.ClosedEmbedding
public import TauCeti.Algebra.Homology.SpectralSequence.Filtered.Exhaustive
public import TauCeti.Algebra.Homology.SpectralSequence.Filtered.FirstPage
public import TauCeti.Algebra.Homology.SpectralSequence.Filtered.Naturality
public import TauCeti.Algebra.Homology.SpectralSequence.Filtered.Comparison

/-!
# Algebraic topology of spaces and manifolds: target signatures

The roadmap is `README.md`; this file is not the roadmap. It states, against the pinned Mathlib
and Tau Ceti, the roadmap's headline theorems that are statable on native carriers, each with
`sorry`, together with the simple definitions they need:

* the pair-quotient comparisons `H_n(X, B) ≅ H̃_n(X/B)` and `H^n(X, B) ≅ H̃^n(X/B)` for closed
  cofibered pairs (Stage 4.5);
* CW approximation of an arbitrary space (Stage 4.8);
* the compact-support theorem for locally represented top sections with local coefficients
  (Stage 6.3), and Poincaré duality for closed manifolds with `ℤ/2` coefficients and for closed
  oriented manifolds with integer coefficients (Stage 6.4);
* the cup-length lower bound for the Lusternik–Schnirelmann category (the categorical
  supplement after Stage 6.2);
* relative Hurewicz in degrees at least three with only the subspace simply connected
  (Stage 8.4);
* homological Whitehead for simply connected spaces of CW type (Stage 8.5) and proper homotopy
  rectification (Stage 8.5);
* finite CW type of compact smooth manifolds, without and with boundary (Stage 8.7);
* the `K(π, 1)` property of the bar model (Stage 8.8a);
* Hurewicz modulo a Serre class satisfying Serre's tensor, `Tor` and `K(A, 1)` axioms, with
  Mathlib's isomorphisms and epimorphisms modulo a Serre class (Stage 8.8d);
* the existence of a `K(A, n)` model for every abelian `A` and `n ≥ 1` (Stages 8.8c and 8.10),
  and representability of `H^n(-; A)` by every such model through its normalized universal class
  (Stage 8.10);
* CW type of mapping spaces out of compact Hausdorff spaces and of based loop spaces (Stage 8.11a);
* the ordinary EM loop comparison: for `n ≥ 1` a pointed weak equivalence from a `K(A, n)` model
  to the loop space of a `K(A, n + 1)` model inducing the identity of `A` (Stage 8.11b).

Several results the roadmap states as targets are proved by the pinned Tau Ceti and are not
restated: the no-retraction theorem and Brouwer's fixed-point theorem in its disk, compact
convex, closed-ball and finite-span forms, Strøm's cylinder theorem for closed cofibrations,
homotopy inverses relative to subspaces and to points with the extension property, the cobase
change of a closed embedding along a pushout of spaces, the spectral sequence of a filtered
complex with its first page, naturality and its convergence for finite filtrations and, under a
vanishing hypothesis, for exhaustive ones, the degree-one and absolute Hurewicz theorems, relative Hurewicz for highly connected pairs,
Whitehead's theorem, the homology invariance of weak equivalences, CW approximation of
path-connected spaces, the connectivity of a CW pair from its cell dimensions, the killing of
homotopy groups by cell attachment with the extension of maps over the killing tower, the cellular
comparison in every dimension for module coefficients, Künneth over a field, the Euler
characteristic of spaces of finite CW type with its homotopy invariance, its multiplicativity
on products and finite covers, its additivity along open covers and its values on spheres, tori
and complex projective spaces, real projective space with its CW structure and cellular
incidences, the deck formula and coinvariant description of the chains of a quotient cover, the
homology of a torus as an exterior algebra, the commutativity of the fundamental group of a
topological monoid, the local-coefficient pair and triple sequences with homotopy invariance,
Moore's theorem that simplicial groups are Kan with the Moore comparison for simplicial modules,
basepoint change of relative homotopy groups, the ends of a space, the `lim`/`lim¹` algebra
of towers, the unnormalized Lusternik–Schnirelmann category, proper homotopy equivalences,
simple connectivity at infinity, the constant-coefficient compact-support theorem and the
integral fundamental class, the torsion Serre classes, the transfer of a finite cover with its
degree formulas and permutation local system, universal coefficients over a hereditary ring,
the Bockstein, the cochain Mayer–Vietoris sequences, graded commutativity of the cup product,
the determinant-sign action on local orientations and their chart, open-embedding and transport
comparisons, the relative cylinder CW structure, cellular approximation, the cohomology of a
contractible free quotient cover and of Milnor's classifying space, the torsion `K(A, 1)` axioms
for finite groups, the uniqueness of `K(G, 1)` spaces of CW type and the circle comparison. The
`#check` lines below pin them, and the README cites each by file.

Headline theorems not statable at the pins, and what each lacks:

* the Serre spectral sequence with its monodromy local system (Stage 5.5): the spectral sequence
  of the skeletal-preimage filtration is the native `TauCeti.filteredSpaceSpectralSequence`, but
  its `E²` identification needs the fibre-homology local system of a Serre fibration, which the
  pins have only for a Hurewicz fibration with a chosen lifting function
  (`TauCeti.fiberLocalSystem`, on cubical chains);
* the Cartan–Leray spectral sequence of a regular cover (Stage 5.3): the deck formula, the
  coinvariant description of the base chains and the equivariant chain complex in `Rep R G` are
  native, but the pins have no spectral sequence from the group homology of a chain complex of
  representations;
* the cellular–singular chain comparison with local coefficients and chosen chain
  representatives (Stage 4.3): the chain map is data built on the roadmap's cellular
  representatives;
* twisted Poincaré duality, Poincaré–Lefschetz duality for compact manifolds with boundary and
  the twisted relative fundamental class (Stages 6.3–6.4): the orientation local system of a
  boundaryless manifold is native (`TauCeti.localHomologySystem`), but the pins have no cap
  product of cohomology with coefficients in a local system against twisted homology and no
  relative cap product on pairs, only the absolute constant-coefficient `TopCat.singularCap`,
  so the duality maps cannot be written; and the orientation system of a manifold with boundary
  over the half-space model is a construction of the roadmap;
* the proper Whitehead theorem (Stage 8.5): the pinned libraries have no compactly supported
  cohomology, so its hypothesis cannot be written;
* the relative obstruction class with local coefficients (Stage 8.9): the cochain is data built
  on the roadmap's cellular cochains with local coefficients (Stage 6.1), which the pins lack;
  the action of `π₁` on `π_n` it uses is native (`TauCeti.homotopyGroupMulAction`);
* the coefficient-natural family of normalized maps `K(A, n) → K(A', n)` induced by
  homomorphisms `A → A'` (Stage 8.8c), the degree-zero loop map from discrete `A` and the
  cohomology suspension `σ_right` (Stage 8.11b): they are data, and `σ_right` is defined on the
  roadmap's unreduced suspension carrier, which the pins lack.
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
#check TauCeti.killHomotopyGroups
#check TauCeti.bijective_homotopyGroupMap_killHomotopyGroupsIncl
#check TauCeti.subsingleton_homotopyGroup_killHomotopyGroups
#check TopCat.Hom.exists_killHomotopyGroupsIncl_comp_eq
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
#check TauCeti.TopCat.isClosedEmbedding_of_isPushout
#check CochainComplex.spectralSequenceFirstPageXIsoCokernel
#check CochainComplex.spectralSequence_first_page_d_eq
#check CochainComplex.filtrationAbutmentIso
#check CochainComplex.exists_mem_range_filtrationAbutmentFiltrationι
#check CochainComplex.filtrationSpectralSequencePageXIsoGradedOfFinite
#check CochainComplex.filtrationSpectralSequencePageXIsoGradedOfExhaustive
#check CochainComplex.isIso_homologyMap_of_isIso_spectralSequence_page
#check CochainComplex.isIso_homologyMap_of_isIso_spectralSequence_page_of_exhaustive
#check CochainComplex.filtrationFunctorMap
#check CategoryTheory.Abelian.SpectralObject.EInftyIsoCokernel
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

/-! ## Stage 4.5: pair quotients of closed cofibrations -/

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

/-- Stage 4.5, the closed-cofibration quotient comparison: for a closed subset `B` of `X` with the
homotopy extension property, the collapse induces `H_n(X, B; M) ≅ H̃_n(X/B; M)` for every `n` and
every constant coefficient module `M` over any ring `R`. No separation axiom and no CW structure is
assumed. The
inclusion of the cone `CB` into the mapping cone `X ∪ CB` is the cobase change of `B → X`, so the
collapse `X ∪ CB → X/B` is a homotopy equivalence (Hatcher, Proposition 0.17, p. 15), and
`H_n(X, B) ≅ H̃_n(X ∪ CB)` for every pair (Hatcher, Section 2.1, p. 125). For `B = ∅` the quotient is
`X` with an added basepoint. The base of a Hausdorff relative CW pair is such a subset, by the
native `TauCeti.hasHomotopyExtensionProperty_base` and Mathlib's `RelCWComplex.isClosedBase`. -/
theorem ordinaryPairQuotientComparison (R : Type u) [Ring R] (M : ModuleCat.{u} R)
    (X : Type u) [TopologicalSpace X] (B : Set X) (hB : IsClosed B)
    (hHEP : TauCeti.HasHomotopyExtensionProperty B) (n : ℕ) :
    IsIso (TopPair.singularHomologyMap (ordinaryPairQuotientPairMap X B) M n) := by
  sorry

/-- Stage 4.5, the cohomological form: for a closed subset `B` of `X` with the homotopy extension
property, the collapse induces `H^n(X, B; M) ≅ H̃^n(X/B; M)` through the native contravariant pair
map, for every module `M` over any ring `R`. The cochains `Hom_R(C_n(-; R), M)` are taken as
abelian groups, the scalars `k = ℤ`, so that `R` need not be commutative. -/
theorem ordinaryPairQuotientCohomologyComparison (R : Type u) [Ring R]
    (M : ModuleCat.{u} R) (X : Type u) [TopologicalSpace X] (B : Set X) (hB : IsClosed B)
    (hHEP : TauCeti.HasHomotopyExtensionProperty B) (n : ℕ) :
    IsIso (TopPair.singularCohomologyMap (R := ModuleCat.of R R) (k := ℤ) (M := M)
      (ordinaryPairQuotientPairMap X B) n) := by
  sorry

/-! ## Stage 4.8: CW approximation of an arbitrary space -/

/-- Stage 4.8 (Hatcher, Proposition 4.13): every space is the target of a weak homotopy
equivalence from a space of CW type. The path-connected case is native,
`TauCeti.isWeakHomotopyEquivalence_cwApproximationMap`; the general case approximates each path
component. -/
theorem exists_cwApproximation (X : Type u) [TopologicalSpace X] :
    ∃ (Z : Type u) (_ : TopologicalSpace Z), TauCeti.CWType Z ∧
      ∃ f : C(Z, X), f.IsWeakHomotopyEquivalence := by
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
    (TopPair.ofSubset Bᶜ).twistedHomology L n ⟶ (puncturedPair X x).twistedHomology L n :=
  (TopPair.ofSubset Bᶜ).twistedHomologyCoefficientMap
    ((TauCeti.LocalCoefficientSystem.pullbackIdIso X).app L).inv n ≫
    TopPair.twistedHomologyMap (supportLocalPairMap X B x hx) L n

/-- A section of local top homology over `V` that is locally represented: each point of `V` has
an open neighbourhood `B ⊆ V` and one class supported in `B` whose local images are the given
values on `B`. On a manifold these neighbourhoods may be refined to coordinate balls. -/
structure LocallyRepresentedTopSection (R : Type u) [CommRing R]
    (X : TopCat.{u}) (L : LocalCoefficientSystem R X) (n : ℕ) (V : Set X) where
  /-- The value of the section at each point of `V`. -/
  localValue : ∀ x : X, x ∈ V → (puncturedPair X x).twistedHomology L n
  /-- The values are locally the images of one supported class. -/
  locally_represented : ∀ x : X, x ∈ V →
    ∃ B : Set X, ∃ hBV : B ⊆ V, IsOpen B ∧ x ∈ B ∧
      ∃ c : (TopPair.ofSubset Bᶜ).twistedHomology L n,
        ∀ y : X, ∀ hy : y ∈ B,
          twistedSupportLocalMap R X L n B y hy c = localValue y (hBV hy)

/-- Twisted homology supported in `K`: the native relative twisted homology of the pair
`(X, X ∖ K)`. -/
abbrev supportedTwistedHomology (R : Type u) [CommRing R] (X : TopCat.{u})
    (L : LocalCoefficientSystem R X) (n : ℕ) (K : Set X) : ModuleCat.{u} R :=
  (TopPair.ofSubset Kᶜ).twistedHomology L n

/-- Existence half of the compact-support theorem of Stage 6.3 with local coefficients (Hatcher,
Lemma 3.27(a), extended to local systems): on a Hausdorff space charted on a real normed space of
dimension `m`, a locally represented top section on an open `V` is the family of local images of
one class supported in a compact `K ⊆ V`. The constant-coefficient case is native,
`TauCeti.exists_localHomologyRestriction_eq_of_isCompact`, under the same hypotheses. -/
theorem compactSupportTopClass_exists (R : Type) [CommRing R] (m : ℕ) {E : Type}
    [NormedAddCommGroup E] [NormedSpace ℝ E] [FiniteDimensional ℝ E]
    (hm : Module.finrank ℝ E = m) (M : Type) [TopologicalSpace M] [T2Space M] [ChartedSpace E M]
    (L : LocalCoefficientSystem R (TopCat.of M)) (K V : Set (TopCat.of M))
    (hK : IsCompact K) (hV : IsOpen V) (hKV : K ⊆ V)
    (s : LocallyRepresentedTopSection R (TopCat.of M) L m V) :
    ∃ c : supportedTwistedHomology R (TopCat.of M) L m K,
      ∀ x : TopCat.of M, ∀ hx : x ∈ K,
        twistedSupportLocalMap R (TopCat.of M) L m K x hx c = s.localValue x (hKV hx) := by
  sorry

/-- Uniqueness half of the compact-support theorem with local coefficients: on a Hausdorff space
charted on a real normed space of dimension `m`, a top-degree class supported in a compact `K` is
determined by its local images at the points of `K`. The constant-coefficient case is native,
`TauCeti.localHomology_ext_of_isCompact`, under the same hypotheses. -/
theorem compactSupportTopClass_unique (R : Type) [CommRing R] (m : ℕ) {E : Type}
    [NormedAddCommGroup E] [NormedSpace ℝ E] [FiniteDimensional ℝ E]
    (hm : Module.finrank ℝ E = m) (M : Type) [TopologicalSpace M] [T2Space M] [ChartedSpace E M]
    (L : LocalCoefficientSystem R (TopCat.of M)) (K : Set (TopCat.of M)) (hK : IsCompact K)
    (c c' : supportedTwistedHomology R (TopCat.of M) L m K)
    (h : ∀ x : TopCat.of M, ∀ hx : x ∈ K,
      twistedSupportLocalMap R (TopCat.of M) L m K x hx c =
        twistedSupportLocalMap R (TopCat.of M) L m K x hx c') :
    c = c' := by
  sorry

/-- Stage 6.4 with `ℤ/2` coefficients, where every manifold is orientable: a closed
topological `n`-manifold, a compact Hausdorff space charted on a real normed space of dimension
`n`, has a class `c ∈ H_n(M; ℤ/2)` such that capping with `c` is an isomorphism
`H^p(M; ℤ/2) ≅ H_(n-p)(M; ℤ/2)` for every `p ≤ n` (Hatcher, Theorem 3.30, with `R = ℤ/2`). The
class is the `ℤ/2` fundamental class of Stage 6.3. -/
theorem poincareDuality_zmodTwo (n : ℕ) (M E : Type) [TopologicalSpace M] [T2Space M]
    [CompactSpace M] [NormedAddCommGroup E] [NormedSpace ℝ E] [FiniteDimensional ℝ E]
    [ChartedSpace E M] (hn : Module.finrank ℝ E = n) :
    ∃ c : SingularHomology (ZMod 2) (ModuleCat.of (ZMod 2) (ZMod 2)) (TopCat.of M) n,
      ∀ (p : ℕ) (hp : p ≤ n),
        Function.Bijective (fun a : singularCohomology (ZMod 2) (TopCat.of M) p =>
          (capProduct (ZMod 2) (TopCat.of M) p n hp).hom a c) := by
  sorry

/-- Stage 6.4, integral Poincaré duality (Hatcher, Theorem 3.30, with `R = ℤ`): for a compact
Hausdorff space `M` charted on a real normed space of dimension `n` with a homological
orientation `o`, capping with the native fundamental class `[M]` of `o`, moved from the
coefficients `ULift ℤ` to `ℤ`, is an isomorphism `H^p(M; ℤ) ≅ H_(n-p)(M; ℤ)` for every `p ≤ n`. -/
theorem poincareDuality_int (n : ℕ) (M E : Type) [TopologicalSpace M] [T2Space M]
    [CompactSpace M] [NormedAddCommGroup E] [NormedSpace ℝ E] [FiniteDimensional ℝ E]
    [ChartedSpace E M] (o : TauCeti.HomologicalOrientation M E n)
    (hn : Module.finrank ℝ E = n) (p : ℕ) (hp : p ≤ n) :
    Function.Bijective fun a : singularCohomology ℤ (TopCat.of M) p =>
      (capProduct ℤ (TopCat.of M) p n hp).hom a
        ((((AlgebraicTopology.singularHomologyFunctor (ModuleCat.{0} ℤ) n).map
          (ModuleCat.ofHom (ULift.moduleEquiv (R := ℤ) (M := ℤ)).toLinearMap)).app
            (TopCat.of M)).hom (o.fundamentalClass hn)) := by
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
`TauCeti.lsCategoryCount` (Hatcher, Section 3.2, Exercise 2, p. 229, for covers by contractible
open sets; the relative-cup argument needs only that each inclusion is nullhomotopic). -/
theorem lsCupLength_add_one_le_categoryCount (X : TopCat.{u}) [Nonempty X]
    (R : Type u) [CommRing R] :
    lsCupLength X R + 1 ≤ TauCeti.lsCategoryCount X Set.univ := by
  sorry

/-! ## Stage 8.4: relative Hurewicz with only the subspace simply connected -/

/-- Stage 8.4 (Hatcher, Theorem 4.37): for a path-connected `Y`, a simply connected subspace `B`
with `b ∈ B`, and the relative homotopy sets `π_i(Y, B, b)` trivial for `1 ≤ i ≤ n + 2`, the
native relative Hurewicz map `π_{n+3}(Y, B, b) → H_{n+3}(Y, B; ℤ)`, `[p] ↦ p_*[Iⁿ⁺³]`, is
bijective. The native `RelHomotopyGroup (Fin k)` is `π_{k+1}`. The native theorem
`TauCeti.RelHomotopyGroup.bijective_hurewicz_of_subsingleton_homotopyGroup` assumes instead
that `Y` is also highly connected. -/
theorem relHurewicz_bijective_of_simplyConnected_subspace {Y : TopCat.{0}} (B : Set Y) (b : B)
    [PathConnectedSpace Y] (n : ℕ)
    (hB : ∀ k < 2, Subsingleton (HomotopyGroup (Fin k) B b))
    (hrel : ∀ k ≤ n + 1, Subsingleton (TauCeti.RelHomotopyGroup (Fin k) ⟨TopPair.ofSubset B, b⟩)) :
    Function.Bijective fun a : TauCeti.RelHomotopyGroup (Fin (n + 2)) ⟨TopPair.ofSubset B, b⟩ ↦
      (TauCeti.RelHomotopyGroup.hurewicz (ModuleCat.of ℤ ℤ) (n + 2) a).hom 1 := by
  sorry

/-! ## Stage 8.5: homological Whitehead and proper homotopy rectification -/

/-- Stage 8.5: a map between simply connected spaces of CW type inducing isomorphisms on
integral singular homology is the forward map of a homotopy equivalence (Hatcher, Corollary 4.33,
p. 367, for CW complexes; spaces of CW type follow by transport along their models). Whitehead's
theorem itself is native, `ContinuousMap.IsWeakHomotopyEquivalence.homotopyEquiv`. -/
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
Stage 8.5 proves it for every subcomplex of a strongly locally finite CW complex and for the
product pairs `(I × X, ∂I × X ∪ I × A)` (Farrell–Taylor–Wagoner, Theorem 1.6). The hypothesis is
on the ambient complex: the wedge point of a countable wedge of intervals fails the property. -/
def HasProperHomotopyExtensionProperty {X : Type u} [TopologicalSpace X]
    (A : Set X) : Prop :=
  ∀ (Y : Type u) [TopologicalSpace Y],
    ∀ (f : C(X, Y)), IsProperMap f →
    ∀ (H : C(unitInterval × A, Y)), IsProperMap H →
      (∀ a : A, H (0, a) = f (a : X)) →
      ∃ K : C(unitInterval × X, Y), IsProperMap K ∧
        (∀ x : X, K (0, x) = f x) ∧
        (∀ (t : unitInterval) (a : A), K (t, (a : X)) = H (t, a))

/-- Stage 8.5, proper homotopy rectification: for a Hausdorff locally compact `X` and a subspace
`A` with the proper homotopy extension property, if the inclusion of `A` is a proper homotopy
equivalence in the native sense `ContinuousMap.HasProperHomotopyInverse` (so it is proper, and
`A` is closed), then `A` is a proper strong deformation retract of `X`: there is a proper
retraction and a jointly proper homotopy from the identity to it, fixed on `A`. Every subcomplex
of a strongly locally finite CW complex satisfies the extension hypothesis by Stage 8.5's proper
homotopy extension theorem. This is the proper form of Hatcher, Proposition 0.19 and
Corollary 0.20, p. 16, proved along the same route with proper extensions
(Farrell–Taylor–Wagoner, Theorem 1.6). -/
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
native sense `TauCeti.FiniteCWType`, through GeometricTopology 11.3 (the Cairns–Whitehead smooth
triangulation) and the native `TauCeti.IsTriangulable.finiteCWType`. Its Euler characteristic is then the native
`TauCeti.eulerChar`. -/
theorem compactManifoldFiniteCWType (n : ℕ)
    (M : Type u) [TopologicalSpace M] [T2Space M] [SecondCountableTopology M]
    [CompactSpace M] [ChartedSpace (EuclideanSpace ℝ (Fin n)) M]
    [IsManifold (modelWithCornersSelf ℝ (EuclideanSpace ℝ (Fin n))) ∞ M] :
    TauCeti.FiniteCWType M := by
  sorry

open scoped Manifold ContDiff in
/-- Stage 8.7 with boundary: a compact Hausdorff smooth manifold with boundary, modelled on the
half-space `𝓡∂ n` with `n ≥ 1`, has finite CW type, through GeometricTopology 11.3 (the Cairns–Whitehead
smooth triangulation, in its half-space form) and the native
`TauCeti.IsTriangulable.finiteCWType`. -/
theorem compactManifoldWithBoundaryFiniteCWType (n : ℕ) [NeZero n]
    (M : Type u) [TopologicalSpace M] [T2Space M] [CompactSpace M]
    [ChartedSpace (EuclideanHalfSpace n) M] [IsManifold (𝓡∂ n) ∞ M] :
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
p. 89, there for the Δ-complex on the same bar simplices). -/
theorem groupClassifyingSpace_isEMOne (G : Type u) [Group G] :
    TauCeti.IsEilenbergMacLaneSpaceOne G (groupClassifyingSpace G)
      (groupClassifyingSpaceBasepoint G) := by
  sorry

/-! ## Stage 8.8d: Serre classes and Hurewicz modulo a class -/

/-- Serre's axioms on a class `C` of abelian groups beyond closure under subobjects, quotients
and extensions: `A ⊗ B` and `Tor₁(A, B)` lie in `C` for `A, B ∈ C`, and the positive-degree
integral homology of `K(A, 1)`, taken on Milnor's classifying space of `A`, lies in `C` for
`A ∈ C` (Serre 1953, Chapter I, axioms II_A and III). The native torsion classes satisfy the
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

/-- Stage 8.8d, Hurewicz modulo a Serre class (Serre 1953, Chapter III, Theorem 1): for a Serre
class `C` satisfying Serre's axioms and a simply connected `X` whose homotopy groups
`π_i(X)` for `2 ≤ i < n + 2` lie in `C`, the integral homology `H_i(X; ℤ)` lies in `C` for
`0 < i < n + 2`, the native Hurewicz homomorphism in degree `n + 2` is an isomorphism modulo `C`
(Mathlib's `isoModSerre`: kernel and cokernel in `C`), and the one in degree `n + 3` is an
epimorphism modulo `C` (`epiModSerre`: cokernel in `C`). For `C = 0` this is the absolute Hurewicz
theorem. -/
theorem hurewicz_isoModSerre (C : ObjectProperty AddCommGrpCat.{0}) [C.IsSerreClass]
    (hC : SatisfiesSerreAxioms C) (X : Type) [TopologicalSpace X] [SimplyConnectedSpace X]
    (x : X) (n : ℕ)
    (hπ : ∀ i < n, C (AddCommGrpCat.of (Additive (HomotopyGroup (Fin (i + 2)) X x)))) :
    (∀ i, 0 < i → i < n + 2 →
      C (AddCommGrpCat.of (SingularHomology ℤ (ModuleCat.of ℤ ℤ) (TopCat.of X) i))) ∧
    C.isoModSerre (AddCommGrpCat.ofHom
      (HomotopyGroup.hurewiczHom (X := X) (x := x) (ModuleCat.of ℤ ℤ) (n + 1))) ∧
    C.epiModSerre (AddCommGrpCat.ofHom
      (HomotopyGroup.hurewiczHom (X := X) (x := x) (ModuleCat.of ℤ ℤ) (n + 2))) := by
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

/-- Stages 8.8c and 8.10: every abelian group `A` has a `K(A, n)` model for every `n ≥ 1`
(Hatcher, Section 4.2, p. 365: an `(n - 1)`-connected complex with `π_n ≅ A` from a presentation
of `A`, followed by cells killing the higher homotopy groups). Stage 8.8c's bar and Dold–Kan models
are such models. -/
theorem nonempty_ordinaryEMModel (A : Type u) [AddCommGroup A] (n : ℕ) [NeZero n] :
    Nonempty (OrdinaryEMModel A n) := by
  sorry

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

/-- Stage 8.10 (Hatcher, Theorem 4.57, there for basepoint-preserving maps of CW complexes;
`π₁(K)` acts trivially on them, by `TauCeti.fundamentalGroup_smul_eq_self` for `n ≥ 1` and because
the degree-one action is conjugation in the abelian group `A` for `n = 0`, so the free form follows
componentwise): every `K(A, n + 1)` model
`K` carries a universal class `ι ∈ H^(n+1)(K; A)`, normalized by evaluating on the Hurewicz image
of each `γ ∈ π_(n+1)(K)` to the element of `A` that the model's identification assigns to `γ`,
and pulling `ι` back along
free homotopy classes of maps is a bijection `[X, K] ≅ H^(n+1)(X; A)` on arbitrary Hausdorff CW
complexes `X`, of any dimension and with any number of components. -/
theorem ordinaryEMRepresentability (A : Type u) [AddCommGroup A] (n : ℕ)
    (K : OrdinaryEMModel A (n + 1)) :
    ∃ ι : K.space.singularCohomology (ModuleCat.of ℤ (ULift.{u} ℤ)) ℤ (ModuleCat.of ℤ A) (n + 1),
      (∀ γ : HomotopyGroup (Fin (n + 1)) K.space K.point,
        ((HomotopyGroup.hurewiczHom (ModuleCat.of ℤ (ULift.{u} ℤ)) n (Additive.ofMul γ)) ≫
          (K.space.singularKronecker ℤ (n + 1) ι)).hom (ULift.up 1) =
            (K.homotopyIdentification γ).toAdd) ∧
      ∀ (X : TopCat.{u}) [T2Space X] [CWComplex (Set.univ : Set X)],
        Function.Bijective (ordinaryEMPullback A (n + 1) K.space ι X) := by
  sorry

/-! ## Stage 8.11a: CW type of mapping spaces -/

/-- Stage 8.11a (Milnor 1959, Theorem 3, p. 276): for a compact Hausdorff space `K` and a space
`X` of CW type, the mapping space `C(K, X)` with the compact-open topology has CW type. A finite
Hausdorff CW complex is such a `K`; the Cantor set is another, for which `C(K, S⁰)` is a countable
discrete space. -/
theorem finiteSourceMappingCWType (K X : Type u) [TopologicalSpace K] [TopologicalSpace X]
    [CompactSpace K] [T2Space K] [TauCeti.CWType X] :
    TauCeti.CWType C(K, X) := by
  sorry

open scoped Topology.Homotopy in
/-- Stage 8.11a (Milnor 1959, Corollary 3, p. 276): the based loop space of a Hausdorff CW complex
at any of its points, Mathlib's generalized loops `Ω^ (Fin 1) X x`, has CW type. At a 0-cell this
is Corollary 3 for the pair `(X, {x})`; at any other point a path to a 0-cell of its path component
gives a homotopy equivalence of the two loop spaces. -/
theorem basedLoopCWType (X : Type u) [TopologicalSpace X] [T2Space X]
    [CWComplex (Set.univ : Set X)] (x : X) :
    TauCeti.CWType (Ω^ (Fin 1) X x) := by
  sorry

/-! ## Stage 8.11b: the ordinary EM loop comparison -/

open scoped Topology.Homotopy in
/-- Stage 8.11b: for `n = m + 1 ≥ 1`, a `K(A, n)` model `K` and a `K(A, n + 1)` model `K'`, there is
a pointed weak homotopy equivalence `f` from `K` to Mathlib's loop space `Ω K'` at the basepoint
that induces the identity of `A`: for every `γ ∈ π_n(K)`, the identification of `K'` applied to
the native loop-space shift `HomotopyGroup.pathLoopSpaceMulEquiv` of `f_* γ` is the identification
of `γ`. The loop space is path connected with `π_j(Ω K') ≅ π_(j+1)(K')`, so it has the homotopy
groups of `K(A, n)`, and a map from the CW complex `K` realizing the given isomorphism on `π_n`
exists (Hatcher, Lemma 4.31 and Proposition 4.30, p. 366). -/
theorem exists_ordinaryEMLoopEquivalence (A : Type u) [AddCommGroup A] (m : ℕ)
    (K : OrdinaryEMModel A (m + 1)) (K' : OrdinaryEMModel A (m + 2)) :
    ∃ (f : C(K.space, Ω K'.space K'.point)) (hf : f K.point = Path.refl K'.point),
      f.IsWeakHomotopyEquivalence ∧
        ∀ γ : HomotopyGroup (Fin (m + 1)) K.space K.point,
          K'.homotopyIdentification
              (HomotopyGroup.pathLoopSpaceMulEquiv m (HomotopyGroup.map f hf γ)) =
            K.homotopyIdentification γ := by
  sorry

end

end TauCetiRoadmap.AlgebraicTopology
