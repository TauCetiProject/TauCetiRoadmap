import Mathlib
import TauCetiRoadmap.ProfiniteCohomology.Suggested
import TauCetiRoadmap.LocalFieldsRamification.Suggested
import TauCetiRoadmap.GlobalNumberFields.Suggested
import TauCetiRoadmap.NumberFieldArithmetic.Suggested

set_option autoImplicit false

/-!
# Class field theory: class formations, Tate's theorem, Artin reciprocity, and their consequences

The normative roadmap is `README.md`. This file pins the structures and maps on which the rest of
the development depends, together with the acceptance tests of `README.md` §5. `sorry` marks a
target, not a result.

The file does **not** define a new Tate-cohomology carrier: `NormalLayer.TateH` is Mathlib's
`tateCohomology` of the finite quotient representation, and ordinary finite-layer cohomology is
Mathlib's `groupCohomology`. The few `sorry` definitions before `ClassFormation` are adapters from
the profinite formation module to the finite quotient representation; the Layer 0 supplier audit is
to replace them by the exact imported declarations.

The central design constraint is the definitional chain

```text
tateIso (-2)  →  nakayamaNegTwo  →  artinEquiv := nakayamaNegTwo.symm  →  artinMap.
```

`nakayamaNegTwo`, `artinEquiv` and `artinMap` are ordinary definitions with bodies, so the requested
Artin map is definitionally the inverse of cup product with the fundamental class in Tate degrees
`-2` and `0` after the canonical low-degree identifications; it is not an arbitrary equivalence of
two finite groups. The local and global maps are transports of this same abstract map, and the
material of Layers 8–10 (local invariants and Hilbert symbols, local duality and Euler
characteristics, conductors, the Hasse norm theorem, class fields, Hilbert reciprocity) consumes
those transports.

Everything is stated in universe `0`, because Mathlib's `tateCohomology` requires the group and the
coefficient ring `ℤ` to live in one universe. All continuous cohomology is Mathlib's carrier as
exposed by `ProfiniteCohomology`; valuation and ramification objects come from
`LocalFieldsRamification`; moduli, ray classes, ideles, orders and Picard groups come from
`GlobalNumberFields`; the ideal Artin map comes from `NumberFieldArithmetic`. There is no
quadratic-form import.
-/

namespace TauCetiRoadmap.ClassFieldTheory

open CategoryTheory NumberField IsDedekindDomain
open scoped MonoidalCategory nonZeroDivisors ValuativeRel TensorProduct

/-! ## Preliminaries: the invariant target `ℚ/ℤ` -/

/-- The target of the class-formation invariant. -/
abbrev RatModInt : Type := ℚ ⧸ AddSubgroup.zmultiples (1 : ℚ)

/-- The subgroup of elements of `ℚ/ℤ` killed by `n`. For `n > 0` this is the unique subgroup of
order `n`. -/
def ratModIntTorsion (n : ℕ) : AddSubgroup RatModInt where
  carrier := {x | n • x = 0}
  zero_mem' := by simp
  add_mem' {x y} (hx : n • x = 0) (hy : n • y = 0) := by
    show n • (x + y) = 0
    rw [nsmul_add, hx, hy, add_zero]
  neg_mem' {x} (hx : n • x = 0) := by
    show n • (-x) = 0
    rw [smul_neg, hx, neg_zero]

/-- The class of `1/n` in `ℚ/ℤ`. It is only applied to the positive degree of a finite normal
layer. -/
noncomputable def fundamentalInvariant (n : ℕ) : RatModInt :=
  QuotientAddGroup.mk' (AddSubgroup.zmultiples (1 : ℚ)) ((1 : ℚ) / (n : ℚ))

/-! ## Layer 1: formations and finite normal layers -/

/-- A formation in the topological form used by Artin–Tate: a profinite group together with a
smooth discrete continuous module. The levels are the fixed subgroups of open subgroups of `G`.
This is the modern equivalent of the triple `(G, {G_E}, A)` when `{G_E}` is the family of open
subgroups. -/
structure Formation (G : Type) [Group G] [TopologicalSpace G] [IsTopologicalGroup G]
    [CompactSpace G] [TotallyDisconnectedSpace G] where
  module : ProfiniteCohomology.TopRep ℤ G
  smooth : ProfiniteCohomology.IsSmoothDiscrete ℤ module

namespace Formation

variable {G : Type} [Group G] [TopologicalSpace G] [IsTopologicalGroup G]
  [CompactSpace G] [TotallyDisconnectedSpace G]

/-- The `U`-level `A^U` of a formation, as the invariants of the restricted representation. -/
abbrev level (F : Formation G) (U : OpenSubgroup G) : Type :=
  (F.module.res U.toSubgroup.subtype).invariants

end Formation

/-- A finite normal layer `V ◁ U` of a formation. In field notation this is the layer `K/F`,
with `U = G_F` and `V = G_K`. -/
structure NormalLayer (G : Type) [Group G] [TopologicalSpace G] [IsTopologicalGroup G]
    [CompactSpace G] [TotallyDisconnectedSpace G] where
  ground : OpenSubgroup G
  top : OpenSubgroup G
  top_le_ground : top ≤ ground
  normal : (top.toSubgroup.comap ground.toSubgroup.subtype).Normal

namespace NormalLayer

variable {G : Type} [Group G] [TopologicalSpace G] [IsTopologicalGroup G]
  [CompactSpace G] [TotallyDisconnectedSpace G]

/-- The subgroup `V` viewed inside `U`. -/
def relativeTop (L : NormalLayer G) : Subgroup L.ground :=
  L.top.toSubgroup.comap L.ground.toSubgroup.subtype

instance (L : NormalLayer G) : L.relativeTop.Normal := L.normal

/-- The finite Galois group `U/V` of the layer. -/
abbrev Gal (L : NormalLayer G) : Type := L.ground ⧸ L.relativeTop

/-- `V` is open in the compact group `U`, so the quotient is finite. -/
instance instFiniteGal (L : NormalLayer G) : Finite L.Gal :=
  Subgroup.quotient_finite_of_isOpen' L.ground.toSubgroup L.relativeTop L.ground.isOpen
    (L.top.isOpen.preimage continuous_subtype_val)

noncomputable instance instFintypeGal (L : NormalLayer G) : Fintype L.Gal :=
  Fintype.ofFinite _

/-- The degree `[U : V]` of a layer. -/
noncomputable def degree (L : NormalLayer G) : ℕ := Nat.card L.Gal

/-- The finite quotient representation of `U/V` on the top level `A^V`. Layer 1 implements this by
restricting `F.module` to `U`, taking `V`-invariants, and using the quotient action; it is not a
second coefficient module. -/
noncomputable def rep (F : Formation G) (L : NormalLayer G) : Rep ℤ L.Gal :=
  sorry

/-- Ordinary group cohomology of the finite layer, on Mathlib's carrier. The class-formation axioms
and the fundamental class are stated here, as in Artin–Tate. -/
noncomputable abbrev H (F : Formation G) (L : NormalLayer G) (n : ℕ) : Type :=
  groupCohomology (L.rep F) n

/-- Mathlib's Tate cohomology of the finite layer, in every integer degree. -/
noncomputable abbrev TateH (F : Formation G) (L : NormalLayer G) (r : ℤ) : Type :=
  tateCohomology (L.rep F) r

/-- Tate cohomology with trivial integral coefficients. -/
noncomputable abbrev TrivialTateH (L : NormalLayer G) (r : ℤ) : Type :=
  tateCohomology (Rep.trivial ℤ L.Gal ℤ) r

/-- The norm from the top level `A^V` to the ground level `A^U`. -/
noncomputable def norm (F : Formation G) (L : NormalLayer G) :
    F.level L.top →+ F.level L.ground :=
  sorry

/-- The norm subgroup of the ground level. -/
noncomputable def normSubgroup (F : Formation G) (L : NormalLayer G) :
    AddSubgroup (F.level L.ground) :=
  (L.norm F).range

/-- The finite-layer norm quotient `A^U / N_{U/V}(A^V)`. -/
noncomputable abbrev NormQuotient (F : Formation G) (L : NormalLayer G) : Type :=
  F.level L.ground ⧸ L.normSubgroup F

/-- The quotient map from the ground level to the norm quotient. -/
noncomputable def normQuotientMk (F : Formation G) (L : NormalLayer G) :
    F.level L.ground →+ L.NormQuotient F :=
  QuotientAddGroup.mk' (L.normSubgroup F)

/-- The layer `V ◁ ⊤` of an open normal subgroup: the finite Galois extensions of the ground field
of the formation. -/
def ofOpenNormal (V : OpenNormalSubgroup G) : NormalLayer G where
  ground := ⊤
  top := V.toOpenSubgroup
  top_le_ground := le_top
  normal := Subgroup.normal_comap _

/-- The intermediate normal layer corresponding to a subgroup of the finite Galois group: the
formation-theoretic Galois correspondence used in the proof of Tate's theorem. -/
noncomputable def subgroupLayer (L : NormalLayer G) (H : Subgroup L.Gal) : NormalLayer G :=
  sorry

/-- Its Galois group is the chosen subgroup. Layer 1 must also provide the representation
isomorphism identifying the restriction of `L.rep F` to `H` with `(L.subgroupLayer H).rep F`,
through the change-of-groups API selected in the Tate-cohomology supplier audit. -/
noncomputable def subgroupGalEquiv (L : NormalLayer G) (H : Subgroup L.Gal) :
    (L.subgroupLayer H).Gal ≃* H :=
  sorry

end NormalLayer

/-! The next structures name the actual changes of layer. They prevent later statements from
replacing restriction or inflation by an arbitrary map of the right type. -/

/-- Restrict the ground field while keeping the top field fixed: in field notation,
`F ⊆ E ⊆ K`, from `K/F` to `K/E`. -/
structure LayerRestriction {G : Type} [Group G] [TopologicalSpace G] [IsTopologicalGroup G]
    [CompactSpace G] [TotallyDisconnectedSpace G]
    (small big : NormalLayer G) : Prop where
  same_top : small.top = big.top
  ground_le : small.ground ≤ big.ground

/-- Refine the top field while keeping the ground field fixed: in field notation,
`F ⊆ K ⊆ L`, from `K/F` to `L/F`. -/
structure LayerRefinement {G : Type} [Group G] [TopologicalSpace G] [IsTopologicalGroup G]
    [CompactSpace G] [TotallyDisconnectedSpace G]
    (old new : NormalLayer G) : Prop where
  same_ground : old.ground = new.ground
  new_top_le : new.top ≤ old.top

namespace LayerRestriction

variable {G : Type} [Group G] [TopologicalSpace G] [IsTopologicalGroup G]
  [CompactSpace G] [TotallyDisconnectedSpace G]
  {small big : NormalLayer G}

/-- Restriction on ordinary finite-layer cohomology. -/
noncomputable def cohomologyRes (T : LayerRestriction small big) (F : Formation G) (n : ℕ) :
    big.H F n →+ small.H F n :=
  sorry

/-- Restriction on the finite-layer Tate groups. -/
noncomputable def tateRes (T : LayerRestriction small big) (F : Formation G) (r : ℤ) :
    big.TateH F r →+ small.TateH F r :=
  sorry

/-- Restriction on the trivial-coefficient Tate groups. -/
noncomputable def trivialTateRes (T : LayerRestriction small big) (r : ℤ) :
    big.TrivialTateH r →+ small.TrivialTateH r :=
  sorry

/-- The degree `[E:F]` by which the invariant changes under restriction from `K/F` to `K/E`. -/
noncomputable def relativeDegree (T : LayerRestriction small big) : ℕ :=
  sorry

/-- The inclusion of ground levels `A^U ⊆ A^{U'}` for `U' ≤ U`. -/
noncomputable def groundInclusion (T : LayerRestriction small big) (F : Formation G) :
    F.level big.ground →+ F.level small.ground :=
  sorry

/-- The norm `A^{U'} → A^U` for `U' ≤ U`. -/
noncomputable def groundNorm (T : LayerRestriction small big) (F : Formation G) :
    F.level small.ground →+ F.level big.ground :=
  sorry

/-- The group-theoretic transfer `(U/V)^ab → (U'/V)^ab`. -/
noncomputable def transferHom (T : LayerRestriction small big) :
    Additive (Abelianization big.Gal) →+ Additive (Abelianization small.Gal) :=
  sorry

/-- The map `(U'/V)^ab → (U/V)^ab` induced by the inclusion `U' ≤ U`. -/
noncomputable def inclusionHom (T : LayerRestriction small big) :
    Additive (Abelianization small.Gal) →+ Additive (Abelianization big.Gal) :=
  sorry

end LayerRestriction

namespace LayerRefinement

variable {G : Type} [Group G] [TopologicalSpace G] [IsTopologicalGroup G]
  [CompactSpace G] [TotallyDisconnectedSpace G]
  {old new : NormalLayer G}

/-- Inflation on ordinary finite-layer cohomology. -/
noncomputable def cohomologyInfl (T : LayerRefinement old new) (F : Formation G) (n : ℕ) :
    old.H F n →+ new.H F n :=
  sorry

/-- Inflation on the finite-layer Tate groups, in positive degrees only. -/
noncomputable def tateInfl (T : LayerRefinement old new) (F : Formation G) (r : ℕ)
    (_hr : 0 < r) :
    old.TateH F r →+ new.TateH F r :=
  sorry

/-- The relative top degree `[L:K]` for a refinement from `K/F` to `L/F`. -/
noncomputable def relativeDegree (T : LayerRefinement old new) : ℕ :=
  sorry

/-- The quotient map `(U/V')^ab → (U/V)^ab` for `V' ≤ V`. -/
noncomputable def quotientHom (T : LayerRefinement old new) :
    Additive (Abelianization new.Gal) →+ Additive (Abelianization old.Gal) :=
  sorry

/-- The identity of ground levels, transported along `same_ground`. -/
noncomputable def groundEquiv (T : LayerRefinement old new) (F : Formation G) :
    F.level old.ground ≃+ F.level new.ground :=
  sorry

end LayerRefinement

/-- The conjugate normal layer `gUg⁻¹ ⊇ gVg⁻¹`. -/
noncomputable def conjugateLayer {G : Type} [Group G] [TopologicalSpace G]
    [IsTopologicalGroup G] [CompactSpace G] [TotallyDisconnectedSpace G]
    (g : G) (L : NormalLayer G) : NormalLayer G :=
  sorry

/-- Conjugation on ordinary finite-layer cohomology. -/
noncomputable def layerCohomologyConj {G : Type} [Group G] [TopologicalSpace G]
    [IsTopologicalGroup G] [CompactSpace G] [TotallyDisconnectedSpace G]
    (F : Formation G) (g : G) (L : NormalLayer G) (n : ℕ) :
    L.H F n →+ (conjugateLayer g L).H F n :=
  sorry

/-- Conjugation on the finite-layer Tate groups. -/
noncomputable def layerTateConj {G : Type} [Group G] [TopologicalSpace G]
    [IsTopologicalGroup G] [CompactSpace G] [TotallyDisconnectedSpace G]
    (F : Formation G) (g : G) (L : NormalLayer G) (r : ℤ) :
    L.TateH F r →+ (conjugateLayer g L).TateH F r :=
  sorry

/-- Conjugation on ground levels and on abelianized Galois groups. -/
noncomputable def layerGroundConj {G : Type} [Group G] [TopologicalSpace G]
    [IsTopologicalGroup G] [CompactSpace G] [TotallyDisconnectedSpace G]
    (F : Formation G) (g : G) (L : NormalLayer G) :
    F.level L.ground →+ F.level (conjugateLayer g L).ground :=
  sorry

noncomputable def layerGalConj {G : Type} [Group G] [TopologicalSpace G]
    [IsTopologicalGroup G] [CompactSpace G] [TotallyDisconnectedSpace G]
    (g : G) (L : NormalLayer G) :
    Additive (Abelianization L.Gal) →+ Additive (Abelianization (conjugateLayer g L).Gal) :=
  sorry

/-! ## Layer 2: class formations and fundamental classes -/

/-- A class formation in the finite-layer form of Artin–Tate. The invariant is data. The
fundamental class is *not* a field of this structure; it is derived below as the unique class of
invariant `1 / degree`. -/
structure ClassFormation {G : Type} [Group G] [TopologicalSpace G] [IsTopologicalGroup G]
    [CompactSpace G] [TotallyDisconnectedSpace G] (F : Formation G) where
  h1_eq_zero : ∀ L : NormalLayer G, Subsingleton (L.H F 1)
  inv : ∀ L : NormalLayer G, L.H F 2 →+ RatModInt
  inv_injective : ∀ L : NormalLayer G, Function.Injective (inv L)
  inv_range : ∀ L : NormalLayer G,
    Set.range (inv L) = (ratModIntTorsion L.degree : Set RatModInt)
  inv_restrict : ∀ {small big : NormalLayer G} (T : LayerRestriction small big)
    (x : big.H F 2),
    inv small (T.cohomologyRes F 2 x) = T.relativeDegree • inv big x
  inv_infl : ∀ {old new : NormalLayer G} (T : LayerRefinement old new)
    (x : old.H F 2),
    inv new (T.cohomologyInfl F 2 x) = inv old x
  inv_conj : ∀ (g : G) (L : NormalLayer G) (x : L.H F 2),
    inv (conjugateLayer g L) (layerCohomologyConj F g L 2 x) = inv L x

namespace ClassFormation

variable {G : Type} [Group G] [TopologicalSpace G] [IsTopologicalGroup G]
  [CompactSpace G] [TotallyDisconnectedSpace G]
  {F : Formation G}

/-- The fundamental class of a finite normal layer: the unique class with invariant
`1 / [U:V]`. Its implementation must use `cf.inv_injective` and `cf.inv_range`; it is not a
choice added to `ClassFormation`. -/
noncomputable def fundamentalClass (cf : ClassFormation F) (L : NormalLayer G) : L.H F 2 :=
  sorry

/-- The defining normalization of the fundamental class. -/
theorem inv_fundamentalClass (cf : ClassFormation F) (L : NormalLayer G) :
    cf.inv L (cf.fundamentalClass L) = fundamentalInvariant L.degree :=
  sorry

/-- The fundamental class generates the two-dimensional cohomology group. -/
theorem fundamentalClass_generates (cf : ClassFormation F) (L : NormalLayer G)
    (x : L.H F 2) :
    ∃ m : ℤ, x = m • cf.fundamentalClass L :=
  sorry

/-- Restriction of the fundamental class is the fundamental class of the restricted layer. -/
theorem fundamentalClass_restrict (cf : ClassFormation F)
    {small big : NormalLayer G} (T : LayerRestriction small big) :
    T.cohomologyRes F 2 (cf.fundamentalClass big) = cf.fundamentalClass small :=
  sorry

/-- Under a refinement of the top field, inflation of the old fundamental class is the relative
degree times the new fundamental class: `inf u_{K/F} = [L:K] u_{L/F}`. This is the scaling in the
positive-degree inflation formula for Tate's theorem. -/
theorem fundamentalClass_infl (cf : ClassFormation F)
    {old new : NormalLayer G} (T : LayerRefinement old new) :
    T.cohomologyInfl F 2 (cf.fundamentalClass old) =
      T.relativeDegree • cf.fundamentalClass new :=
  sorry

/-- The corresponding conjugation formula. -/
theorem fundamentalClass_conj (cf : ClassFormation F) (g : G) (L : NormalLayer G) :
    layerCohomologyConj F g L 2 (cf.fundamentalClass L) =
      cf.fundamentalClass (conjugateLayer g L) :=
  sorry

/-! ## Layer 3: Tate's theorem (Artin–Tate's Main Theorem) -/

/-- The fundamental class transported from ordinary `H²` to positive Tate degree `2` through
Mathlib's canonical comparison. -/
noncomputable def tateFundamentalClass (cf : ClassFormation F) (L : NormalLayer G) :
    L.TateH F 2 :=
  ((TateCohomology.isoGroupCohomology (R := ℤ) (G := L.Gal) 2).app (L.rep F)).inv
    (cf.fundamentalClass L)

/-- Cup product with the fundamental class, after the tensor-unit identification
`ℤ ⊗ A^V ≅ A^V`. This is the named homomorphism to which `tateIso` must reduce; its
implementation is the generic Tate cup product of the supplier audit. -/
noncomputable def cupFundamentalClass (cf : ClassFormation F) (L : NormalLayer G) (r : ℤ) :
    L.TrivialTateH r →+ L.TateH F (r + 2) :=
  sorry

/-- Tate's theorem for a class formation, in every integer degree: cup product with the
fundamental class is an isomorphism `Ĥ^r(Γ,ℤ) ≃ Ĥ^{r+2}(Γ,A^V)` (Tate 1952; Artin–Tate's Main
Theorem, Chapter XIV §4). Its generalization to coefficients `M` with `Tor₁(M,A^V) = 0` is the
Tate–Nakayama theorem, which belongs to the generic supplier. -/
noncomputable def tateIso (cf : ClassFormation F) (L : NormalLayer G) (r : ℤ) :
    L.TrivialTateH r ≃+ L.TateH F (r + 2) :=
  sorry

/-- The isomorphism is the cup-product map, not an unrelated equivalence between groups of the
same cardinality. -/
theorem tateIso_toAddMonoidHom (cf : ClassFormation F)
    (L : NormalLayer G) (r : ℤ) :
    (cf.tateIso L r).toAddMonoidHom = cf.cupFundamentalClass L r :=
  sorry

/-- Compatibility of Tate's theorem with restriction to an intermediate ground field. -/
theorem tateIso_res (cf : ClassFormation F)
    {small big : NormalLayer G} (T : LayerRestriction small big) (r : ℤ)
    (x : big.TrivialTateH r) :
    T.tateRes F (r + 2) (cf.tateIso big r x) =
      cf.tateIso small r (T.trivialTateRes r x) :=
  sorry

/-! ## Layer 4: low Tate degrees and the abstract Artin map -/

/-- The canonical identification `Ĥ⁻²(Γ,ℤ) ≃ Γ^ab`, supplied by generic Tate cohomology. -/
noncomputable def tateHMinusTwoEquivAbelianization (L : NormalLayer G) :
    L.TrivialTateH (-2) ≃+ Additive (Abelianization L.Gal) :=
  sorry

/-- The canonical identification `Ĥ⁰(Γ,A^V) ≃ A^U / N(A^V)`, supplied by generic Tate cohomology
and the finite-layer coefficient dictionary. -/
noncomputable def tateHZeroEquivNormQuotient (F : Formation G) (L : NormalLayer G) :
    L.TateH F 0 ≃+ L.NormQuotient F :=
  sorry

/-- The degree `-2 → 0` cup-product direction, the Nakayama map `Γ^ab ≃ A^U / N(A^V)`. -/
noncomputable def nakayamaNegTwo (cf : ClassFormation F) (L : NormalLayer G) :
    Additive (Abelianization L.Gal) ≃+ L.NormQuotient F :=
  (tateHMinusTwoEquivAbelianization L).symm.trans
    ((cf.tateIso L (-2)).trans (tateHZeroEquivNormQuotient F L))

/-- **The Artin reciprocity direction.** Definitionally the inverse of `nakayamaNegTwo`; not a
new opaque choice. -/
noncomputable def artinEquiv (cf : ClassFormation F) (L : NormalLayer G) :
    L.NormQuotient F ≃+ Additive (Abelianization L.Gal) :=
  (cf.nakayamaNegTwo L).symm

/-- The Artin map on the ground level, with kernel the norm subgroup. -/
noncomputable def artinMap (cf : ClassFormation F) (L : NormalLayer G) :
    F.level L.ground →+ Additive (Abelianization L.Gal) :=
  (cf.artinEquiv L).toAddMonoidHom.comp (L.normQuotientMk F)

/-- Elementwise form of the definition of `artinMap`. -/
theorem artinMap_apply (cf : ClassFormation F) (L : NormalLayer G)
    (a : F.level L.ground) :
    cf.artinMap L a = cf.artinEquiv L (L.normQuotientMk F a) :=
  rfl

/-- The defining equality, recorded explicitly for downstream users and regression tests. -/
theorem artinEquiv_eq_tateIso (cf : ClassFormation F) (L : NormalLayer G) :
    cf.artinEquiv L =
      ((tateHMinusTwoEquivAbelianization L).symm.trans
        ((cf.tateIso L (-2)).trans
          (tateHZeroEquivNormQuotient F L))).symm :=
  rfl

/-- The kernel of the Artin map is exactly the norm subgroup. -/
theorem ker_artinMap (cf : ClassFormation F) (L : NormalLayer G) :
    (cf.artinMap L).ker = L.normSubgroup F :=
  sorry

/-- Elementwise norm-kernel criterion. -/
theorem artinMap_eq_zero_iff (cf : ClassFormation F) (L : NormalLayer G)
    (a : F.level L.ground) :
    cf.artinMap L a = 0 ↔ a ∈ L.normSubgroup F :=
  sorry

/-- The finite-level Artin map is onto the abelianized finite Galois group. -/
theorem surjective_artinMap (cf : ClassFormation F) (L : NormalLayer G) :
    Function.Surjective (cf.artinMap L) :=
  sorry

/-- The zero-dimensional Tate class of an element of the ground level. -/
noncomputable def zeroTateClass (F : Formation G) (L : NormalLayer G) :
    F.level L.ground →+ L.TateH F 0 :=
  sorry

/-- The connecting class `δχ ∈ Ĥ²(Γ,ℤ)` attached to a character `χ : Γ^ab → ℚ/ℤ` through
`0 → ℤ → ℚ → ℚ/ℤ → 0`. -/
noncomputable def characterConnectingClass (L : NormalLayer G)
    (χ : Additive (Abelianization L.Gal) →+ RatModInt) :
    L.TrivialTateH 2 :=
  sorry

/-- The class in `H²(Γ,A^V)` obtained by cupping the zero-dimensional class of `a` with `δχ`.
The eventual definition must use the imported Tate cup product. -/
noncomputable def artinCharacterCup (cf : ClassFormation F) (L : NormalLayer G)
    (a : F.level L.ground)
    (χ : Additive (Abelianization L.Gal) →+ RatModInt) :
    L.H F 2 :=
  sorry

/-- Artin–Tate's character characterization `χ(artinMap a) = inv(a₀ ∪ δχ)`. Together with the
transparent definition of `artinEquiv`, this pins the direction and the sign of the Artin map. -/
theorem character_artinMap (cf : ClassFormation F) (L : NormalLayer G)
    (a : F.level L.ground)
    (χ : Additive (Abelianization L.Gal) →+ RatModInt) :
    χ (cf.artinMap L a) = cf.inv L (cf.artinCharacterCup L a χ) :=
  sorry

/-- Uniqueness: a homomorphism satisfying the character formula for every character is the Artin
map. -/
theorem eq_artinMap_of_character (cf : ClassFormation F) (L : NormalLayer G)
    (φ : F.level L.ground →+ Additive (Abelianization L.Gal))
    (hφ : ∀ (a : F.level L.ground) (χ : Additive (Abelianization L.Gal) →+ RatModInt),
      χ (φ a) = cf.inv L (cf.artinCharacterCup L a χ)) :
    φ = cf.artinMap L :=
  sorry

/-! ### The four Artin–Tate functoriality diagrams -/

/-- Inclusion of ground levels corresponds to group-theoretic transfer. -/
theorem artinMap_groundInclusion (cf : ClassFormation F)
    {small big : NormalLayer G} (T : LayerRestriction small big) (a : F.level big.ground) :
    cf.artinMap small (T.groundInclusion F a) = T.transferHom (cf.artinMap big a) :=
  sorry

/-- The norm on ground levels corresponds to inclusion of Galois groups. -/
theorem artinMap_groundNorm (cf : ClassFormation F)
    {small big : NormalLayer G} (T : LayerRestriction small big) (b : F.level small.ground) :
    cf.artinMap big (T.groundNorm F b) = T.inclusionHom (cf.artinMap small b) :=
  sorry

/-- Conjugation corresponds to conjugation of Artin symbols. -/
theorem artinMap_conj (cf : ClassFormation F) (g : G) (L : NormalLayer G)
    (a : F.level L.ground) :
    cf.artinMap (conjugateLayer g L) (layerGroundConj F g L a) =
      layerGalConj g L (cf.artinMap L a) :=
  sorry

/-- Passage to a quotient extension corresponds to the quotient map on Galois groups. -/
theorem artinMap_quotient (cf : ClassFormation F)
    {old new : NormalLayer G} (T : LayerRefinement old new) (a : F.level old.ground) :
    cf.artinMap old a = T.quotientHom (cf.artinMap new (T.groundEquiv F a)) :=
  sorry

/-! ### Abstract acceptance tests -/

/-- Trivial layer: the Artin map of the layer `U/U` is the zero map between trivial groups. -/
theorem artinMap_trivialLayer (cf : ClassFormation F) (L : NormalLayer G)
    (hL : L.top = L.ground) :
    cf.artinMap L = 0 :=
  sorry

/-- In a cyclic layer the norm quotient has exactly `[U:V]` elements. -/
theorem card_normQuotient (cf : ClassFormation F) (L : NormalLayer G) [IsCyclic L.Gal] :
    Nat.card (L.NormQuotient F) = L.degree :=
  sorry

/-- The Artin symbol of `a` generates the abelianized Galois group exactly when the class of `a`
generates the norm quotient. -/
theorem isGenerator_artinMap_iff (cf : ClassFormation F) (L : NormalLayer G)
    (a : F.level L.ground) :
    AddSubgroup.zmultiples (cf.artinMap L a) = ⊤ ↔
      AddSubgroup.zmultiples (L.normQuotientMk F a) = ⊤ :=
  sorry

/-- In a quadratic layer, every nonzero element of the target is the Artin symbol of exactly the
non-norms: the abstract form of the first nontrivial regression test. -/
theorem artinMap_quadratic_eq_nontrivial_iff_not_norm
    (cf : ClassFormation F) (L : NormalLayer G)
    (hdegree : L.degree = 2)
    (σ : Additive (Abelianization L.Gal)) (hσ : σ ≠ 0)
    (a : F.level L.ground) :
    cf.artinMap L a = σ ↔ a ∉ L.normSubgroup F :=
  sorry

end ClassFormation

/-! ## Layer 5: local class formation, local reciprocity, and local invariants -/

/-- Coefficients for the absolute Galois group, on the imported continuous carrier. -/
abbrev GalRep (n : ℕ) (F : Type) [Field F] : Type 1 :=
  ProfiniteCohomology.TopRep (ZMod n) (Field.absoluteGaloisGroup F)

/-- `Hⁱ(G_F,A)` on Mathlib's continuous cohomology functor. -/
noncomputable abbrev H (n : ℕ) (F : Type) [Field F]
    (i : ℕ) (A : GalRep n F) : Type _ :=
  continuousCohomology i A

section Local

variable (K : Type) [Field K] [ValuativeRel K] [TopologicalSpace K]
  [IsNonarchimedeanLocalField K]
variable (L : Type) [Field L] [ValuativeRel L] [TopologicalSpace L]
  [IsNonarchimedeanLocalField L]

/-! ### Kummer coefficients, the local Brauer group, and the invariant map -/

/-- The coefficient object `μ_n(Fˢ)`, written additively. -/
def muNRep (n : ℕ) (F : Type) [Field F] : GalRep n F :=
  sorry

/-- Restriction identifies the algebraic-closure and separable-closure absolute Galois groups as
topological groups. This transport is not definitional over imperfect fields. -/
noncomputable def absoluteGaloisGroupComparison (F : Type) [Field F] :
    Field.absoluteGaloisGroup F ≃ₜ* ProfiniteCohomology.AbsoluteGaloisGroup F :=
  sorry

/-- Additive dictionary between the profinite roadmap's Kummer coefficient and `muNRep`. -/
noncomputable def muNRepCoeffDictionary (n : ℕ) (F : Type) [Field F] :
    ProfiniteCohomology.KummerCoeff F n ≃+ (muNRep n F).V :=
  sorry

theorem muNRepCoeffDictionary_continuous (n : ℕ) (F : Type) [Field F] :
    Continuous (muNRepCoeffDictionary n F) :=
  sorry

theorem muNRepCoeffDictionary_equivariant (n : ℕ) (F : Type) [Field F]
    (g : Field.absoluteGaloisGroup F) (x : ProfiniteCohomology.KummerCoeff F n) :
    muNRepCoeffDictionary n F (absoluteGaloisGroupComparison F g • x)
      = ((muNRep n F).ρ g) (muNRepCoeffDictionary n F x) :=
  sorry

/-- Tate dual `Hom(A,μ_n)` with its conjugation action. -/
def tateDual {n : ℕ} {F : Type} [Field F] (_A : GalRep n F) : GalRep n F :=
  sorry

/-- The transported Kummer class, not a second Kummer cocycle. -/
def kummerClass (n : ℕ) (F : Type) [Field F] (_a : Fˣ) : H n F 1 (muNRep n F) :=
  sorry

/-- Kummer equivalence when the exponent is invertible in the valuation ring. -/
noncomputable def kummerEquiv_unit (n : ℕ) (_hn : n ≠ 0)
    (_hn' : IsUnit (n : ↥𝒪[K])) :
    Additive (Kˣ ⧸ (powMonoidHom n : Kˣ →* Kˣ).range) ≃+ H n K 1 (muNRep n K) :=
  sorry

/-- Mixed-characteristic Kummer equivalence, including `n = p`. -/
noncomputable def kummerEquiv_mixed (p : ℕ) [Fact p.Prime] (F : Type) [Field F]
    [Algebra ℚ_[p] F] [Module.Finite ℚ_[p] F] (n : ℕ) (_hn : n ≠ 0) :
    Additive (Fˣ ⧸ (powMonoidHom n : Fˣ →* Fˣ).range) ≃+ H n F 1 (muNRep n F) :=
  sorry

/-- Multiplicative separable-closure coefficients `(Fˢ)ˣ`, written additively: the module of the
local formation and the coefficients of the local Brauer group. -/
def unitsRep (F : Type) [Field F] :
    ProfiniteCohomology.TopRep ℤ (Field.absoluteGaloisGroup F) :=
  sorry

/-- Local Brauer group on the imported continuous-cohomology carrier. -/
noncomputable abbrev Br (F : Type) [Field F] : Type _ :=
  continuousCohomology 2 (unitsRep F)

/-- Local invariant, normalized by arithmetic Frobenius. -/
noncomputable def invMap : Br K ≃+ RatModInt :=
  sorry

noncomputable def brRes [Algebra K L] [Module.Finite K L] [Algebra.IsSeparable K L]
    (_iota : L →ₐ[K] SeparableClosure K) : Br K →+ Br L :=
  sorry

noncomputable def brCor [Algebra K L] [Module.Finite K L] [Algebra.IsSeparable K L]
    (_iota : L →ₐ[K] SeparableClosure K) : Br L →+ Br K :=
  sorry

theorem invMap_brRes [Algebra K L] [Module.Finite K L] [Algebra.IsSeparable K L]
    (iota : L →ₐ[K] SeparableClosure K) (a : Br K) :
    invMap L (brRes K L iota a) = Module.finrank K L • invMap K a :=
  sorry

theorem invMap_brCor [Algebra K L] [Module.Finite K L] [Algebra.IsSeparable K L]
    (iota : L →ₐ[K] SeparableClosure K) (b : Br L) :
    invMap K (brCor K L iota b) = invMap L b :=
  sorry

/-- Trace isomorphism away from the residue characteristic. -/
theorem h2MuEquivZMod_unit (n : ℕ) (_hn : n ≠ 0) (_hn' : IsUnit (n : ↥𝒪[K])) :
    Nonempty (H n K 2 (muNRep n K) ≃+ ZMod n) :=
  sorry

/-- The mixed-characteristic invariant on `H²(F,μ_n)`. -/
theorem h2MuEquivZMod_mixed (p : ℕ) [Fact p.Prime] (F : Type) [Field F]
    [ValuativeRel F] [TopologicalSpace F] [IsNonarchimedeanLocalField F]
    [Algebra ℚ_[p] F] [Module.Finite ℚ_[p] F] (n : ℕ) (_hn : n ≠ 0) :
    Nonempty (H n F 2 (muNRep n F) ≃+ ZMod n) :=
  sorry

/-- The invariant transported to a coefficient object identified with `μ_p`. -/
theorem h2FpEquivZMod_of_mu (p : ℕ) [Fact p.Prime] (F : Type) [Field F]
    [ValuativeRel F] [TopologicalSpace F] [IsNonarchimedeanLocalField F]
    [Algebra ℚ_[p] F] [Module.Finite ℚ_[p] F]
    (ζ : F) (_hζ : IsPrimitiveRoot ζ p) (T : GalRep p F)
    (_hT : Nonempty (muNRep p F ≅ T)) :
    Nonempty (H p F 2 T ≃+ ZMod p) :=
  sorry

/-! ### The cohomological Hilbert symbol -/

/-- The coefficient pairing `μ_n × μ_n → μ_n` selected by a primitive root. -/
noncomputable def kummerCupPairing {n : ℕ} {F : Type} [Field F]
    (ζ : F) (_hζ : IsPrimitiveRoot ζ n) :
    ProfiniteCohomology.TopPairing (muNRep n F) (muNRep n F) (muNRep n F) :=
  sorry

/-- Canonical coefficient pairing for local Tate duality: evaluation `A' × A → μ_n`. -/
noncomputable def tateEvaluationPairing {n : ℕ} {F : Type} [Field F]
    (A : GalRep n F) :
    ProfiniteCohomology.TopPairing (tateDual A) A (muNRep n F) :=
  sorry

/-- The local cohomological symbol: cup followed by the invariant. -/
noncomputable def localSymbol {n : ℕ} {F : Type} [Field F]
    (P : ProfiniteCohomology.TopPairing (muNRep n F) (muNRep n F) (muNRep n F))
    (tr : H n F 2 (muNRep n F) ≃+ ZMod n)
    (x y : H n F 1 (muNRep n F)) : ZMod n :=
  tr (ProfiniteCohomology.degreeCast (by norm_num) (muNRep n F)
    (ProfiniteCohomology.cup P 1 1 x y))

/-- Bilinearity after transporting multiplicative Kummer classes. -/
theorem localSymbol_kummerClass_mul {n : ℕ}
    (P : ProfiniteCohomology.TopPairing (muNRep n K) (muNRep n K) (muNRep n K))
    (tr : H n K 2 (muNRep n K) ≃+ ZMod n)
    (_hn : n ≠ 0) (_hn' : IsUnit (n : ↥𝒪[K])) (a a' b : Kˣ) :
    localSymbol P tr (kummerClass n K (a * a')) (kummerClass n K b)
      = localSymbol P tr (kummerClass n K a) (kummerClass n K b)
        + localSymbol P tr (kummerClass n K a') (kummerClass n K b) :=
  sorry

/-- Steinberg relation at the named arithmetic coefficient pairing. -/
theorem localSymbol_kummerClass_steinberg {n : ℕ} (zeta : K)
    (hzeta : IsPrimitiveRoot zeta n) (tr : H n K 2 (muNRep n K) ≃+ ZMod n)
    (_hn : n ≠ 0) (_hn' : IsUnit (n : ↥𝒪[K])) (a b : Kˣ)
    (_hab : (a : K) + (b : K) = 1) :
    localSymbol (kummerCupPairing zeta hzeta) tr (kummerClass n K a) (kummerClass n K b) = 0 :=
  sorry

/-! ### Local Tate duality and the Euler characteristic -/

/-- Local Tate-duality evaluation pairing. -/
noncomputable def tateDualityPairing {n : ℕ} {F : Type} [Field F]
    (A : GalRep n F) (tr : H n F 2 (muNRep n F) ≃+ ZMod n)
    (i j : ℕ) (hij : i + j = 2)
    (x : H n F i (tateDual A)) (y : H n F j A) : ZMod n :=
  tr (ProfiniteCohomology.degreeCast hij (muNRep n F)
    (ProfiniteCohomology.cup (tateEvaluationPairing A) i j x y))

/-- Finiteness in local cohomological degrees zero through two. -/
theorem finite_H (p : ℕ) [Fact p.Prime] (F : Type) [Field F] [ValuativeRel F]
    [TopologicalSpace F] [IsNonarchimedeanLocalField F] [Algebra ℚ_[p] F]
    [Module.Finite ℚ_[p] F] (n : ℕ) (_hn : n ≠ 0) (A : GalRep n F)
    (_hA : Finite A.V) (i : ℕ) (_hi : i ≤ 2) :
    Finite (H n F i A) :=
  sorry

/-- Perfect local Tate duality in mixed characteristic, for the named evaluation pairing. -/
theorem tateDualityPairing_perfect_mixed (p : ℕ) [Fact p.Prime]
    (F : Type) [Field F] [ValuativeRel F] [TopologicalSpace F]
    [IsNonarchimedeanLocalField F] [Algebra ℚ_[p] F] [Module.Finite ℚ_[p] F]
    (n : ℕ) (_hn : n ≠ 0) (A : GalRep n F)
    (tr : H n F 2 (muNRep n F) ≃+ ZMod n) (_hA : Finite A.V)
    (_hdisc : DiscreteTopology A.V) (i j : ℕ) (hij : i + j = 2) :
    (∀ x : H n F i (tateDual A),
        (∀ y : H n F j A, tateDualityPairing A tr i j hij x y = 0) → x = 0) ∧
      (∀ φ : H n F j A →+ ZMod n, ∃ x : H n F i (tateDual A),
        ∀ y : H n F j A, tateDualityPairing A tr i j hij x y = φ y) :=
  sorry

/-- Cardinality form of the mixed-characteristic local Euler characteristic. -/
theorem eulerCharacteristic_mixed (p : ℕ) [Fact p.Prime]
    (F : Type) [Field F] [ValuativeRel F] [TopologicalSpace F]
    [IsNonarchimedeanLocalField F] [Algebra ℚ_[p] F] [Module.Finite ℚ_[p] F]
    (n : ℕ) (_hn : n ≠ 0) (A : GalRep n F) (_hA : Finite A.V)
    (_h0 : Finite (H n F 0 A)) (_h1 : Finite (H n F 1 A))
    (_h2 : Finite (H n F 2 A)) :
    Nat.card (H n F 1 A)
      = Nat.card (H n F 0 A) * Nat.card (H n F 2 A)
        * p ^ (Module.finrank ℚ_[p] F * padicValNat p (Nat.card A.V)) :=
  sorry

/-- The `𝔽_p` Euler-characteristic formula consumed by `LocalGaloisGroups`. -/
theorem eulerCharacteristic_finrank_fp (p : ℕ) [Fact p.Prime]
    (F : Type) [Field F] [ValuativeRel F] [TopologicalSpace F]
    [IsNonarchimedeanLocalField F] [Algebra ℚ_[p] F] [Module.Finite ℚ_[p] F]
    (A : GalRep p F) (_hA : Finite A.V) :
    Module.finrank (ZMod p) (H p F 1 A)
      = Module.finrank (ZMod p) (H p F 0 A)
        + Module.finrank (ZMod p) (H p F 2 A)
        + Module.finrank ℚ_[p] F * Module.finrank (ZMod p) A.V :=
  sorry

/-! ### The local class formation and finite local reciprocity -/

/-- The formation of multiplicative groups of finite separable extensions of `K`, written
additively: its module is `unitsRep K` transported to the separable-closure Galois group. -/
noncomputable def localFormation : Formation (ProfiniteCohomology.AbsoluteGaloisGroup K) :=
  sorry

/-- Hilbert 90 and the local Brauer invariant make `localFormation K` a class formation. -/
noncomputable def localClassFormation : ClassFormation (localFormation K) :=
  sorry

/-- Inflation from the two-dimensional cohomology of a finite layer of the local formation to the
local Brauer group `Br K = H²(G_K, (Kˢ)ˣ)`. -/
noncomputable def brInfl (L : NormalLayer (ProfiniteCohomology.AbsoluteGaloisGroup K))
    (hL : L.ground = ⊤) : L.H (localFormation K) 2 →+ Br K :=
  sorry

/-- The abstract invariant of a finite layer agrees with `invMap` on the local Brauer group after
inflation to `Br K`; the two normalizations are one. -/
theorem localClassFormation_inv (L : NormalLayer (ProfiniteCohomology.AbsoluteGaloisGroup K))
    (hL : L.ground = ⊤) (x : L.H (localFormation K) 2) :
    (localClassFormation K).inv L x = invMap K (brInfl K L hL x) :=
  sorry

/-- The normal layer attached to a finite Galois extension `L/K` embedded in the chosen separable
closure. -/
noncomputable def localLayer [Algebra K L] [Module.Finite K L] [IsGalois K L]
    (iota : L →ₐ[K] SeparableClosure K) :
    NormalLayer (ProfiniteCohomology.AbsoluteGaloisGroup K) :=
  sorry

/-- Identification of the concrete local norm quotient with the abstract norm quotient. -/
noncomputable def localNormQuotientEquiv [Algebra K L] [Module.Finite K L] [IsGalois K L]
    (iota : L →ₐ[K] SeparableClosure K) :
    Additive (Kˣ ⧸ LocalFieldsRamification.normGroup K L) ≃+
      (localLayer K L iota).NormQuotient (localFormation K) :=
  sorry

/-- Identification of the abstract finite Galois quotient with `Gal(L/K)`. -/
noncomputable def localGaloisAbelianizationEquiv [Algebra K L] [Module.Finite K L] [IsGalois K L]
    (iota : L →ₐ[K] SeparableClosure K) :
    Additive (Abelianization (localLayer K L iota).Gal) ≃+
      Additive (Abelianization (L ≃ₐ[K] L)) :=
  sorry

/-- Finite local reciprocity, transparently transported from the abstract Artin equivalence. -/
noncomputable def localArtinEquiv [Algebra K L] [Module.Finite K L] [IsGalois K L]
    (iota : L →ₐ[K] SeparableClosure K) :
    Additive (Kˣ ⧸ LocalFieldsRamification.normGroup K L) ≃+
      Additive (Abelianization (L ≃ₐ[K] L)) :=
  (localNormQuotientEquiv K L iota).trans
    (((localClassFormation K).artinEquiv (localLayer K L iota)).trans
      (localGaloisAbelianizationEquiv K L iota))

/-- The quotient map used to obtain the local Artin map on `Kˣ`. -/
noncomputable def localNormQuotientMk [Algebra K L] [Module.Finite K L] :
    Additive Kˣ →+ Additive (Kˣ ⧸ LocalFieldsRamification.normGroup K L) :=
  MonoidHom.toAdditive (QuotientGroup.mk' (LocalFieldsRamification.normGroup K L))

/-- The finite local Artin map on `Kˣ`. -/
noncomputable def localArtinMap [Algebra K L] [Module.Finite K L] [IsGalois K L]
    (iota : L →ₐ[K] SeparableClosure K) :
    Additive Kˣ →+ Additive (Abelianization (L ≃ₐ[K] L)) :=
  (localArtinEquiv K L iota).toAddMonoidHom.comp (localNormQuotientMk K L)

/-- The finite local Artin equivalence does not depend on the chosen embedding into the separable
closure: conjugate layers give the same map on `Kˣ / N`. -/
theorem localArtinEquiv_eq_of_iota [Algebra K L] [Module.Finite K L] [IsGalois K L]
    (iota iota' : L →ₐ[K] SeparableClosure K) :
    localArtinEquiv K L iota = localArtinEquiv K L iota' :=
  sorry

/-- **Frozen public name.** `normResidue` is the multiplicative form of `localArtinEquiv` for the
canonical embedding of `L` into the separable closure; it is not a second construction. -/
noncomputable def normResidue [Algebra K L] [Module.Finite K L] [IsGalois K L] :
    (Kˣ ⧸ LocalFieldsRamification.normGroup K L) ≃* Abelianization (L ≃ₐ[K] L) :=
  MulEquiv.toAdditive.symm (localArtinEquiv K L (IsSepClosed.lift : L →ₐ[K] SeparableClosure K))

/-- At an unramified extension, a uniformizer maps to **arithmetic** Frobenius. -/
theorem localArtinMap_uniformizer [Algebra K L] [ValuativeExtension K L]
    [Module.Finite K L] [IsGalois K L]
    (iota : L →ₐ[K] SeparableClosure K)
    (h : LocalFieldsRamification.ramificationIndex K L = 1)
    (pi : 𝒪[K]) (hpi : Irreducible pi) (hpi0 : (pi : K) ≠ 0) :
    localArtinMap K L iota (Additive.ofMul (Units.mk0 (pi : K) hpi0)) =
      Additive.ofMul
        (Abelianization.of (LocalFieldsRamification.frobeniusAlgEquiv K L h)) :=
  sorry

/-- **Frozen public name.** The multiplicative form of the uniformizer normalization. -/
theorem normResidue_uniformizer [Algebra K L] [ValuativeExtension K L]
    [Module.Finite K L] [IsGalois K L]
    (h : LocalFieldsRamification.ramificationIndex K L = 1)
    (pi : 𝒪[K]) (_hpi : Irreducible pi) (hpi0 : (pi : K) ≠ 0) :
    normResidue K L (QuotientGroup.mk (Units.mk0 (pi : K) hpi0))
      = Abelianization.of (LocalFieldsRamification.frobeniusAlgEquiv K L h) :=
  sorry

/-- Units are norms in an unramified finite extension, hence have trivial finite Artin symbol. -/
theorem localArtinMap_unit_of_unramified [Algebra K L] [ValuativeExtension K L]
    [Module.Finite K L] [IsGalois K L]
    (iota : L →ₐ[K] SeparableClosure K)
    (h : LocalFieldsRamification.ramificationIndex K L = 1)
    (u : Kˣ) (hu : ValuativeRel.valuation K (u : K) = 1) :
    localArtinMap K L iota (Additive.ofMul u) = 0 :=
  sorry

/-- In an unramified extension of degree `n`, the norm quotient is cyclic of order `n`, generated
by the class of a uniformizer. -/
theorem localNormQuotientEquivZMod_unramified [Algebra K L] [ValuativeExtension K L]
    [Module.Finite K L] [IsGalois K L]
    (h : LocalFieldsRamification.ramificationIndex K L = 1)
    (pi : 𝒪[K]) (_hpi : Irreducible pi) (hpi0 : (pi : K) ≠ 0) :
    ∃ e : Additive (Kˣ ⧸ LocalFieldsRamification.normGroup K L) ≃+ ZMod (Module.finrank K L),
      e (Additive.ofMul (QuotientGroup.mk (Units.mk0 (pi : K) hpi0))) = 1 :=
  sorry

/-- In an unramified extension the Artin symbol depends only on the normalized valuation modulo
the degree: `Art(x) = Frob^{v(x)}`. -/
theorem localArtinMap_eq_frobenius_pow_valuation [Algebra K L] [ValuativeExtension K L]
    [Module.Finite K L] [IsGalois K L]
    (iota : L →ₐ[K] SeparableClosure K)
    (h : LocalFieldsRamification.ramificationIndex K L = 1) (x : Kˣ) :
    localArtinMap K L iota (Additive.ofMul x) =
      Multiplicative.toAdd (LocalFieldsRamification.normalizedValuation K x) •
        Additive.ofMul
          (Abelianization.of (LocalFieldsRamification.frobeniusAlgEquiv K L h)) :=
  sorry

/-- Quadratic local test: a non-norm maps to the nontrivial automorphism. -/
theorem localArtinMap_quadratic_eq_nontrivial_iff_not_norm
    [Algebra K L] [Module.Finite K L] [IsGalois K L]
    (iota : L →ₐ[K] SeparableClosure K)
    (hdegree : Module.finrank K L = 2)
    (τ : L ≃ₐ[K] L) (hτ : τ ≠ 1) (a : Kˣ) :
    localArtinMap K L iota (Additive.ofMul a) =
        Additive.ofMul (Abelianization.of τ) ↔
      a ∉ LocalFieldsRamification.normGroup K L :=
  sorry

/-- The Hilbert-symbol form of the quadratic test, an integration test with `localSymbol`: for
`L = K(√d)`, the restriction of the Artin symbol of `a` is nontrivial exactly when the quadratic
symbol `(a,d)_K` is `-1`. -/
theorem localArtinMap_quadratic_eq_hilbertSymbol
    [Algebra K L] [Module.Finite K L] [IsGalois K L]
    (iota : L →ₐ[K] SeparableClosure K)
    (hdegree : Module.finrank K L = 2) (d : K) (hd : ∃ s : L, s * s = algebraMap K L d)
    (τ : L ≃ₐ[K] L) (hτ : τ ≠ 1) (a : Kˣ) (hd0 : d ≠ 0)
    (P : ProfiniteCohomology.TopPairing (muNRep 2 K) (muNRep 2 K) (muNRep 2 K))
    (tr : H 2 K 2 (muNRep 2 K) ≃+ ZMod 2) :
    localArtinMap K L iota (Additive.ofMul a) = Additive.ofMul (Abelianization.of τ) ↔
      localSymbol P tr (kummerClass 2 K a) (kummerClass 2 K (Units.mk0 d hd0)) = 1 :=
  sorry

/-- The local cyclotomic test: for `p ∤ m`, `ℚ_p(ζ_m)/ℚ_p` is unramified, and the Artin symbol of
`p` acts on `ζ_m` by `ζ_m ↦ ζ_m^p`. Stated for a general local field `K` in place of `ℚ_p`, with
`q` the residue cardinality. -/
theorem localArtinMap_cyclotomic_uniformizer [Algebra K L] [ValuativeExtension K L]
    [Module.Finite K L] [IsGalois K L]
    (iota : L →ₐ[K] SeparableClosure K)
    (h : LocalFieldsRamification.ramificationIndex K L = 1)
    (pi : 𝒪[K]) (_hpi : Irreducible pi) (hpi0 : (pi : K) ≠ 0)
    (m : ℕ) (ζ : L) (_hζ : IsPrimitiveRoot ζ m) (σ : L ≃ₐ[K] L)
    (hσ : localArtinMap K L iota (Additive.ofMul (Units.mk0 (pi : K) hpi0)) =
      Additive.ofMul (Abelianization.of σ)) :
    σ ζ = ζ ^ Nat.card 𝓀[K] :=
  sorry

/-! ### The absolute local Artin map, its normalizations, conductors, and the Weil group -/

/-- **Frozen public name.** The local Artin map into the topological abelianization of the absolute
Galois group, normalized by arithmetic Frobenius. It is the inverse limit of the finite maps
`localArtinMap` over the finite abelian extensions of `K`; it has dense image and is not
surjective. -/
noncomputable def artinMap : Kˣ →* Field.absoluteGaloisGroupAbelianization K :=
  sorry

/-- Restriction of an element of the absolute Galois group to a finite Galois subextension embedded
by `iota`. -/
noncomputable def restrictAbsolute [Algebra K L] [Module.Finite K L] [IsGalois K L]
    (iota : L →ₐ[K] SeparableClosure K) (σ : Field.absoluteGaloisGroup K) : L ≃ₐ[K] L :=
  sorry

/-- The finite maps are the restrictions of the absolute map. -/
theorem artinMap_restrict [Algebra K L] [Module.Finite K L] [IsGalois K L]
    (iota : L →ₐ[K] SeparableClosure K) (x : Kˣ)
    (σ : Field.absoluteGaloisGroup K)
    (hσ : (QuotientGroup.mk σ : Field.absoluteGaloisGroupAbelianization K) = artinMap K x) :
    localArtinMap K L iota (Additive.ofMul x) =
      Additive.ofMul (Abelianization.of (restrictAbsolute K L iota σ)) :=
  sorry

/-- Geometric normalization, defined by precomposing the arithmetic Artin map with inversion. -/
noncomputable def geometricArtinMap : Kˣ →* Field.absoluteGaloisGroupAbelianization K where
  toFun x := artinMap K x⁻¹
  map_one' := by simp
  map_mul' x y := by simp [mul_comm]

/-- Profinite completion of the additive integers, written multiplicatively. -/
noncomputable abbrev ZHat : Type :=
  ProfiniteGrp.profiniteCompletion.obj (GrpCat.of (Multiplicative ℤ))

noncomputable def zhatOfInt (m : ℤ) : ZHat :=
  ProfiniteGrp.ProfiniteCompletion.etaFn (GrpCat.of (Multiplicative ℤ))
    (Multiplicative.ofAdd m)

/-- Unramified coordinate, normalized to send arithmetic Frobenius to one. -/
noncomputable def unramifiedCoordinate :
    Field.absoluteGaloisGroupAbelianization K →* ZHat :=
  sorry

theorem unramifiedCoordinate_artinMap (x : Kˣ) :
    unramifiedCoordinate K (artinMap K x)
      = ProfiniteGrp.ProfiniteCompletion.etaFn (GrpCat.of (Multiplicative ℤ))
          (LocalFieldsRamification.normalizedValuation K x) :=
  sorry

theorem unramifiedCoordinate_geometricArtinMap (x : Kˣ) :
    unramifiedCoordinate K (geometricArtinMap K x)
      = (unramifiedCoordinate K (artinMap K x))⁻¹ :=
  sorry

/-- Cyclotomic orientation with the required field norm: for `K/ℚ_p` finite and a unit `u`,
`χ_cyc(Art_K(u)) = N_{K/ℚ_p}(u)⁻¹`. -/
theorem cyclotomicCharacter_artinMap (p : ℕ) [Fact p.Prime]
    (F : Type) [Field F] [ValuativeRel F] [TopologicalSpace F]
    [IsNonarchimedeanLocalField F] [Algebra ℚ_[p] F] [Module.Finite ℚ_[p] F]
    (u : Fˣ) (_hu : ValuativeRel.valuation F (u : F) = 1)
    (σ : Field.absoluteGaloisGroup F)
    (_hσ : (QuotientGroup.mk σ : Field.absoluteGaloisGroupAbelianization F) = artinMap F u) :
    Units.map (algebraMap ℤ_[p] ℚ_[p]).toMonoidHom
        (cyclotomicCharacter (AlgebraicClosure F) p σ.toRingEquiv)
      = (Units.map (Algebra.norm ℚ_[p] : F →* ℚ_[p]) u)⁻¹ :=
  sorry

/-- The specialization at `ℚ_p`. -/
theorem cyclotomicCharacter_artinMap_padic (p : ℕ) [Fact p.Prime]
    [IsNonarchimedeanLocalField ℚ_[p]] (u : ℤ_[p]ˣ)
    (σ : Field.absoluteGaloisGroup ℚ_[p])
    (_hσ : (QuotientGroup.mk σ : Field.absoluteGaloisGroupAbelianization ℚ_[p])
      = artinMap ℚ_[p] (Units.map (algebraMap ℤ_[p] ℚ_[p]).toMonoidHom u)) :
    cyclotomicCharacter (AlgebraicClosure ℚ_[p]) p σ.toRingEquiv = u⁻¹ :=
  sorry

/-- Least unit-filtration depth contained in the norm group. -/
noncomputable def conductorExponent [Algebra K L] [Module.Finite K L] : ℕ :=
  sInf {n : ℕ | LocalFieldsRamification.unitFiltration K n ≤
    LocalFieldsRamification.normGroup K L}

noncomputable def conductorIdeal [Algebra K L] [Module.Finite K L] : Ideal ↥𝒪[K] :=
  𝓂[K] ^ conductorExponent K L

theorem unitFiltration_conductorExponent_le_normGroup [Algebra K L]
    [Module.Finite K L] [IsGalois K L]
    (_hab : ∀ sigma tau : L ≃ₐ[K] L, sigma * tau = tau * sigma) :
    LocalFieldsRamification.unitFiltration K (conductorExponent K L)
      ≤ LocalFieldsRamification.normGroup K L :=
  sorry

theorem not_unitFiltration_pred_le_normGroup [Algebra K L] [Module.Finite K L]
    (hc : 0 < conductorExponent K L) :
    ¬ LocalFieldsRamification.unitFiltration K (conductorExponent K L - 1)
        ≤ LocalFieldsRamification.normGroup K L :=
  sorry

theorem conductorExponent_eq_zero_iff [Algebra K L] [ValuativeExtension K L]
    [Module.Finite K L] [IsGalois K L]
    (_hab : ∀ sigma tau : L ≃ₐ[K] L, sigma * tau = tau * sigma) :
    conductorExponent K L = 0 ↔ LocalFieldsRamification.ramificationIndex K L = 1 :=
  sorry

/-- Least unit-filtration depth killed by a continuous character. -/
noncomputable def characterConductorExp (chi : ContinuousMonoidHom Kˣ ℂˣ) : ℕ :=
  sInf {n | ∀ x ∈ LocalFieldsRamification.unitFiltration K n, chi x = 1}

/-- Attainment uses continuity together with the fact that `ℂˣ` has no small subgroups. -/
theorem unitFiltration_characterConductorExp_le_ker
    (chi : ContinuousMonoidHom Kˣ ℂˣ) :
    LocalFieldsRamification.unitFiltration K (characterConductorExp K chi)
      ≤ chi.toMonoidHom.ker :=
  sorry

/-- The local Weil group: the preimage in `G_K` of the powers of arithmetic Frobenius under the
map to the Galois group of the residue field, i.e. of `ℤ ⊆ ℤ̂` under `G_K → G_𝓀[K] ≅ ℤ̂`. -/
noncomputable def localWeilGroup : Subgroup (Field.absoluteGaloisGroup K) :=
  sorry

/-- The Weil-group form of local reciprocity is an isomorphism, unlike `artinMap`:
`Kˣ ≃ W_K^ab`. -/
noncomputable def localWeilArtinEquiv : Kˣ ≃* Abelianization (localWeilGroup K) :=
  sorry

/-- The Weil-group reciprocity map recovers `artinMap` after passing to `G_K^ab`. -/
theorem localWeilArtinEquiv_compat (x : Kˣ) (w : localWeilGroup K)
    (hw : Abelianization.of w = localWeilArtinEquiv K x) :
    (QuotientGroup.mk (w : Field.absoluteGaloisGroup K) :
      Field.absoluteGaloisGroupAbelianization K) = artinMap K x :=
  sorry

/-- The image of `Kˣ` under `artinMap` is the image of the Weil group: dense but not all of
`G_K^ab`. -/
theorem mem_range_artinMap_iff (y : Field.absoluteGaloisGroupAbelianization K) :
    y ∈ (artinMap K).range ↔
      ∃ w : localWeilGroup K,
        (QuotientGroup.mk (w : Field.absoluteGaloisGroup K) :
          Field.absoluteGaloisGroupAbelianization K) = y :=
  sorry

/-! ### Local existence -/

/-- The identification of the ground level `A^{G_K}` of the local formation with `Kˣ`. -/
noncomputable def localGroundEquiv :
    Additive Kˣ ≃+ (localFormation K).level ⊤ :=
  sorry

/-- The local existence theorem: every open finite-index subgroup of `Kˣ` is the norm subgroup of
a finite normal layer of the local formation. -/
theorem localExistence (N : Subgroup Kˣ) (hN : IsOpen (N : Set Kˣ)) [N.FiniteIndex] :
    ∃ V : OpenNormalSubgroup (ProfiniteCohomology.AbsoluteGaloisGroup K),
      ((NormalLayer.ofOpenNormal V).normSubgroup (localFormation K)).comap
          (localGroundEquiv K).toAddMonoidHom =
        Subgroup.toAddSubgroup N :=
  sorry

/-- The concrete `ℚ₂(ζ₅)/ℚ₂` test: unramified of degree four, and `2` maps to `ζ₅ ↦ ζ₅²`.
Replacing arithmetic Frobenius by geometric Frobenius would give the exponent `3`. -/
theorem localArtinMap_Q2_zeta5 [ValuativeRel ℚ_[2]] [IsNonarchimedeanLocalField ℚ_[2]]
    (E : Type) [Field E] [ValuativeRel E] [TopologicalSpace E] [IsNonarchimedeanLocalField E]
    [Algebra ℚ_[2] E] [Module.Finite ℚ_[2] E] [IsGalois ℚ_[2] E]
    [IsCyclotomicExtension {5} ℚ_[2] E]
    (iota : E →ₐ[ℚ_[2]] SeparableClosure ℚ_[2])
    (ζ : E) (_hζ : IsPrimitiveRoot ζ 5) (σ : E ≃ₐ[ℚ_[2]] E)
    (hσ : localArtinMap ℚ_[2] E iota (Additive.ofMul (Units.mk0 (2 : ℚ_[2]) two_ne_zero)) =
      Additive.ofMul (Abelianization.of σ)) :
    σ ζ = ζ ^ 2 :=
  sorry

end Local

/-! ## Layer 6: global idele-class formation and global Artin reciprocity -/

section Global

variable (K : Type) [Field K] [NumberField K]
variable (L : Type) [Field L] [NumberField L] [Algebra K L]

/-- The formation assembled from idele class groups of the finite separable extensions of `K`
inside a fixed separable closure. -/
noncomputable def globalFormation : Formation (ProfiniteCohomology.AbsoluteGaloisGroup K) :=
  sorry

/-- The global invariant theorem makes `globalFormation K` a class formation. -/
noncomputable def globalClassFormation : ClassFormation (globalFormation K) :=
  sorry

/-- The normal layer associated to a finite Galois extension `L/K`. -/
noncomputable def globalLayer [Module.Finite K L] [IsGalois K L]
    (iota : L →ₐ[K] SeparableClosure K) :
    NormalLayer (ProfiniteCohomology.AbsoluteGaloisGroup K) :=
  sorry

/-- Principal ideles, on the carrier owned by `GlobalNumberFields`. -/
noncomputable def principalIdele (F : Type) [Field F] [NumberField F] :
    Fˣ →* GlobalNumberFields.IdeleGroup F :=
  sorry

/-- The idele class group is commutative. Recorded as an instance so that quotients by norm
subgroups need no separate normality hypothesis; Mathlib's `CommGroup` instance on the quotient
carrier is not found by `IsMulCommutative` search through the `abbrev`. -/
instance instIsMulCommutativeIdeleClassGroup :
    IsMulCommutative (GlobalNumberFields.IdeleClassGroup K) :=
  ⟨⟨fun a b => mul_comm a b⟩⟩

/-- Norm on ideles in a finite extension; no idele carrier is redefined here. -/
noncomputable def ideleNormMap [Module.Finite K L] :
    GlobalNumberFields.IdeleGroup L →* GlobalNumberFields.IdeleGroup K :=
  sorry

/-- The induced norm on idele classes. -/
noncomputable def ideleClassNorm [Module.Finite K L] :
    GlobalNumberFields.IdeleClassGroup L →* GlobalNumberFields.IdeleClassGroup K :=
  sorry

/-- The concrete quotient map on idele classes, written additively. -/
noncomputable def globalNormQuotientMk [Module.Finite K L] :
    Additive (GlobalNumberFields.IdeleClassGroup K) →+
      Additive (GlobalNumberFields.IdeleClassGroup K ⧸ (ideleClassNorm K L).range) :=
  MonoidHom.toAdditive (QuotientGroup.mk' (ideleClassNorm K L).range)

/-- Identification of the concrete idele-class norm quotient with the abstract norm quotient. -/
noncomputable def globalNormQuotientEquiv [Module.Finite K L] [IsGalois K L]
    (iota : L →ₐ[K] SeparableClosure K) :
    Additive (GlobalNumberFields.IdeleClassGroup K ⧸ (ideleClassNorm K L).range) ≃+
      (globalLayer K L iota).NormQuotient (globalFormation K) :=
  sorry

/-- Identification of the abstract finite Galois quotient with `Gal(L/K)`. -/
noncomputable def globalGaloisAbelianizationEquiv [Module.Finite K L] [IsGalois K L]
    (iota : L →ₐ[K] SeparableClosure K) :
    Additive (Abelianization (globalLayer K L iota).Gal) ≃+
      Additive (Abelianization (L ≃ₐ[K] L)) :=
  sorry

/-- Finite global reciprocity, transparently transported from the abstract Artin equivalence. -/
noncomputable def globalArtinEquiv [Module.Finite K L] [IsGalois K L]
    (iota : L →ₐ[K] SeparableClosure K) :
    Additive (GlobalNumberFields.IdeleClassGroup K ⧸ (ideleClassNorm K L).range) ≃+
      Additive (Abelianization (L ≃ₐ[K] L)) :=
  (globalNormQuotientEquiv K L iota).trans
    (((globalClassFormation K).artinEquiv (globalLayer K L iota)).trans
      (globalGaloisAbelianizationEquiv K L iota))

/-- The finite global Artin map on the idele class group. -/
noncomputable def globalArtinMap [Module.Finite K L] [IsGalois K L]
    (iota : L →ₐ[K] SeparableClosure K) :
    Additive (GlobalNumberFields.IdeleClassGroup K) →+
      Additive (Abelianization (L ≃ₐ[K] L)) :=
  (globalArtinEquiv K L iota).toAddMonoidHom.comp (globalNormQuotientMk K L)

/-- The class of a principal idele in the idele class group is trivial, hence the global Artin map
kills principal ideles; this is the reciprocity law in idelic form. -/
theorem globalArtinMap_principal [Module.Finite K L] [IsGalois K L]
    (iota : L →ₐ[K] SeparableClosure K) (x : Kˣ) :
    globalArtinMap K L iota (Additive.ofMul (QuotientGroup.mk (principalIdele K x))) = 0 :=
  sorry

/-! ### Completions, local factors, and the ideal Artin map -/

/-- Local factor of the global Artin map at a finite place, using the unique local map owned by
this roadmap. -/
noncomputable def localArtinAt (v : HeightOneSpectrum (𝓞 K))
    [ValuativeRel (v.adicCompletion K)]
    [IsNonarchimedeanLocalField (v.adicCompletion K)] :
    (v.adicCompletion K)ˣ →*
      Field.absoluteGaloisGroupAbelianization (v.adicCompletion K) :=
  artinMap (v.adicCompletion K)

/-- Arithmetic unramified coordinate of the completion-local Artin factor. -/
theorem unramifiedCoordinate_localArtinAt (v : HeightOneSpectrum (𝓞 K))
    [ValuativeRel (v.adicCompletion K)]
    [IsNonarchimedeanLocalField (v.adicCompletion K)] (x : (v.adicCompletion K)ˣ) :
    unramifiedCoordinate (v.adicCompletion K) (localArtinAt K v x)
      = ProfiniteGrp.ProfiniteCompletion.etaFn (GrpCat.of (Multiplicative ℤ))
          (LocalFieldsRamification.normalizedValuation (v.adicCompletion K) x) :=
  unramifiedCoordinate_artinMap (v.adicCompletion K) x

/-- The idele class of a prime idele at `v`: a uniformizer at `v` and `1` elsewhere. Its Artin
image at an unramified place does not depend on the uniformizer. -/
noncomputable def primeIdeleClass (v : HeightOneSpectrum (𝓞 K)) :
    GlobalNumberFields.IdeleClassGroup K :=
  sorry

omit [NumberField K] [NumberField L] in
/-- The sole adapter from an abelian-Galois hypothesis to the supplier's explicit commutativity
argument. -/
theorem algEquiv_commute_of_isAbelianGalois [IsAbelianGalois K L] :
    ∀ σ τ : L ≃ₐ[K] L, Commute σ τ :=
  fun σ τ => IsMulCommutative.is_comm.comm σ τ

/-- The finite-level ideal Artin map is exactly the `NumberFieldArithmetic` map. -/
noncomputable abbrev abelianArtinHomAway [IsAbelianGalois K L]
    (S : Finset (HeightOneSpectrum (𝓞 K)))
    (hur : ∀ v : HeightOneSpectrum (𝓞 K), v ∉ S →
      ∀ (Q : Ideal (𝓞 L)) [Q.IsPrime] [Q.LiesOver v.asIdeal],
        Algebra.IsUnramifiedAt (𝓞 K) Q) :
    NumberFieldArithmetic.idealsAway (K := K) S →* (L ≃ₐ[K] L) :=
  NumberFieldArithmetic.artinHomAway (L := L)
    (algEquiv_commute_of_isAbelianGalois K L) S hur

/-- **Comparison with the ideal-theoretic Artin map.** At every unramified finite prime `v`, the
class-field-theory Artin symbol of the prime idele at `v` is the value of
`NumberFieldArithmetic.artinHomAway` on the prime `v`, i.e. the arithmetic Frobenius at `v`. -/
theorem globalArtinMap_ideal [Module.Finite K L] [IsAbelianGalois K L]
    (iota : L →ₐ[K] SeparableClosure K)
    (S : Finset (HeightOneSpectrum (𝓞 K)))
    (hur : ∀ v : HeightOneSpectrum (𝓞 K), v ∉ S →
      ∀ (Q : Ideal (𝓞 L)) [Q.IsPrime] [Q.LiesOver v.asIdeal],
        Algebra.IsUnramifiedAt (𝓞 K) Q)
    (v : HeightOneSpectrum (𝓞 K)) (hv : v ∉ S)
    (I : NumberFieldArithmetic.idealsAway (K := K) S)
    (hI : ((I : (FractionalIdeal (𝓞 K)⁰ K)ˣ) : FractionalIdeal (𝓞 K)⁰ K) =
      (v.asIdeal : FractionalIdeal (𝓞 K)⁰ K)) :
    globalArtinMap K L iota (Additive.ofMul (primeIdeleClass K v)) =
      Additive.ofMul (Abelianization.of (abelianArtinHomAway K L S hur I)) :=
  sorry

/-- The Artin symbol of an unramified prime is arithmetic Frobenius. -/
theorem globalArtinMap_isArithFrobAt [Module.Finite K L] [IsAbelianGalois K L]
    (iota : L →ₐ[K] SeparableClosure K)
    (v : HeightOneSpectrum (𝓞 K)) (Q : Ideal (𝓞 L)) [Q.IsPrime] [Q.LiesOver v.asIdeal]
    (hQ : Algebra.IsUnramifiedAt (𝓞 K) Q) (σ : L ≃ₐ[K] L)
    (hσ : globalArtinMap K L iota (Additive.ofMul (primeIdeleClass K v)) =
      Additive.ofMul (Abelianization.of σ)) :
    IsArithFrobAt (𝓞 K) σ Q :=
  sorry

/-- The idele class of a local unit at `v`: `x` at `v` and `1` at every other place. -/
noncomputable def ideleClassOfLocal (v : HeightOneSpectrum (𝓞 K)) :
    (v.adicCompletion K)ˣ →* GlobalNumberFields.IdeleClassGroup K :=
  sorry

/-- The map from the abelianized local Galois group at `v` to `Gal(L/K)^ab`, through the
decomposition group of a chosen place above `v`; independent of the choice up to conjugation, which
is invisible in the abelianization. -/
noncomputable def decompositionRestrict [Module.Finite K L] [IsGalois K L]
    (iota : L →ₐ[K] SeparableClosure K) (v : HeightOneSpectrum (𝓞 K)) :
    Field.absoluteGaloisGroupAbelianization (v.adicCompletion K) →*
      Abelianization (L ≃ₐ[K] L) :=
  sorry

/-- The global map restricted at a finite place is the local Artin map: the local factor of the
global reciprocity map is `localArtinAt`, transported through the decomposition group. -/
theorem globalArtinMap_local [Module.Finite K L] [IsGalois K L]
    (iota : L →ₐ[K] SeparableClosure K)
    (v : HeightOneSpectrum (𝓞 K)) [ValuativeRel (v.adicCompletion K)]
    [IsNonarchimedeanLocalField (v.adicCompletion K)]
    (x : (v.adicCompletion K)ˣ) :
    globalArtinMap K L iota (Additive.ofMul (ideleClassOfLocal K v x)) =
      Additive.ofMul (decompositionRestrict K L iota v (localArtinAt K v x)) :=
  sorry

/-! ### Global acceptance tests -/

/-- Quadratic global test: for `L = K(√d)` and an unramified prime, the Artin symbol is trivial
exactly when the prime splits, i.e. when the quadratic character is `+1`. -/
theorem globalArtinMap_quadratic_prime [Module.Finite K L] [IsAbelianGalois K L]
    (iota : L →ₐ[K] SeparableClosure K) (hdegree : Module.finrank K L = 2)
    (τ : L ≃ₐ[K] L) (hτ : τ ≠ 1)
    (v : HeightOneSpectrum (𝓞 K)) (Q : Ideal (𝓞 L)) [Q.IsPrime] [Q.LiesOver v.asIdeal]
    (hQ : Algebra.IsUnramifiedAt (𝓞 K) Q) :
    globalArtinMap K L iota (Additive.ofMul (primeIdeleClass K v)) =
        Additive.ofMul (Abelianization.of τ) ↔
      Q.inertiaDeg (𝓞 K) = 2 :=
  sorry

/-- The cyclotomic test, `m ≥ 1` and `ℓ ∤ m`: the Artin symbol of `(ℓ)` in `ℚ(ζ_m)/ℚ` acts on
`ζ_m` by `ζ_m ↦ ζ_m^ℓ`. This is a direct test that the roadmap uses arithmetic rather than
geometric Frobenius; a quadratic example alone cannot distinguish an automorphism from its
inverse. -/
theorem globalArtinMap_cyclotomic_prime (m : ℕ) [NeZero m]
    (E : Type) [Field E] [NumberField E] [Algebra ℚ E] [IsCyclotomicExtension {m} ℚ E]
    [Module.Finite ℚ E] [IsAbelianGalois ℚ E]
    (iota : E →ₐ[ℚ] SeparableClosure ℚ)
    (ζ : E) (_hζ : IsPrimitiveRoot ζ m)
    (ℓ : ℕ) [Fact ℓ.Prime] (hℓ : ¬ ℓ ∣ m)
    (v : HeightOneSpectrum (𝓞 ℚ)) (hv : v.asIdeal = Ideal.span {(ℓ : 𝓞 ℚ)})
    (σ : E ≃ₐ[ℚ] E)
    (hσ : globalArtinMap ℚ E iota (Additive.ofMul (primeIdeleClass ℚ v)) =
      Additive.ofMul (Abelianization.of σ)) :
    σ ζ = ζ ^ ℓ :=
  sorry

/-- The `ℚ(i)` test, `m = 4`: primes `ℓ ≡ 1 mod 4` have trivial Artin symbol and primes
`ℓ ≡ 3 mod 4` map to complex conjugation, i.e. `Art((ℓ))(i) = i^ℓ`. -/
theorem globalArtinMap_Qi_prime
    (E : Type) [Field E] [NumberField E] [Algebra ℚ E] [IsCyclotomicExtension {4} ℚ E]
    [Module.Finite ℚ E] [IsAbelianGalois ℚ E]
    (iota : E →ₐ[ℚ] SeparableClosure ℚ)
    (i : E) (_hi : IsPrimitiveRoot i 4)
    (ℓ : ℕ) [Fact ℓ.Prime] (hℓ : ℓ ≠ 2)
    (v : HeightOneSpectrum (𝓞 ℚ)) (hv : v.asIdeal = Ideal.span {(ℓ : 𝓞 ℚ)})
    (σ : E ≃ₐ[ℚ] E)
    (hσ : globalArtinMap ℚ E iota (Additive.ofMul (primeIdeleClass ℚ v)) =
      Additive.ofMul (Abelianization.of σ)) :
    (ℓ % 4 = 1 → σ = 1) ∧ (ℓ % 4 = 3 → σ i = -i) :=
  sorry

/-- The `ℚ(√5)` test: `ℓ ≡ ±1 mod 5` splits and `ℓ ≡ ±2 mod 5` is inert, so the Artin symbol is
trivial in the first case and the nontrivial automorphism in the second. -/
theorem globalArtinMap_Qsqrt5_prime
    (E : Type) [Field E] [NumberField E] [Algebra ℚ E] [Module.Finite ℚ E]
    [IsAbelianGalois ℚ E] (hdegree : Module.finrank ℚ E = 2)
    (s : E) (hs : s * s = 5)
    (iota : E →ₐ[ℚ] SeparableClosure ℚ)
    (ℓ : ℕ) [Fact ℓ.Prime] (hℓ : ℓ ≠ 5)
    (v : HeightOneSpectrum (𝓞 ℚ)) (hv : v.asIdeal = Ideal.span {(ℓ : 𝓞 ℚ)})
    (σ : E ≃ₐ[ℚ] E)
    (hσ : globalArtinMap ℚ E iota (Additive.ofMul (primeIdeleClass ℚ v)) =
      Additive.ofMul (Abelianization.of σ)) :
    (ℓ % 5 = 1 ∨ ℓ % 5 = 4 → σ = 1) ∧ (ℓ % 5 = 2 ∨ ℓ % 5 = 3 → σ s = -s) :=
  sorry

/-- The two `ℚ(ζ₅)` values that certify a non-involutive Artin symbol: `Art((2))(ζ₅) = ζ₅²`, of
order four. -/
theorem globalArtinMap_zeta5_two
    (E : Type) [Field E] [NumberField E] [Algebra ℚ E] [IsCyclotomicExtension {5} ℚ E]
    [Module.Finite ℚ E] [IsAbelianGalois ℚ E]
    (iota : E →ₐ[ℚ] SeparableClosure ℚ)
    (ζ : E) (_hζ : IsPrimitiveRoot ζ 5)
    (v : HeightOneSpectrum (𝓞 ℚ)) (hv : v.asIdeal = Ideal.span {(2 : 𝓞 ℚ)})
    (σ : E ≃ₐ[ℚ] E)
    (hσ : globalArtinMap ℚ E iota (Additive.ofMul (primeIdeleClass ℚ v)) =
      Additive.ofMul (Abelianization.of σ)) :
    σ ζ = ζ ^ 2 ∧ σ ^ 4 = 1 ∧ σ ^ 2 ≠ 1 :=
  sorry

/-- Compatibility of the cyclotomic and quadratic tests: restriction of the Artin symbol of `(ℓ)`
from `ℚ(ζ₅)` to `ℚ(√5)` is trivial exactly when `ℓ` is a square modulo `5`. -/
theorem globalArtinMap_zeta5_restrict_Qsqrt5
    (E : Type) [Field E] [NumberField E] [Algebra ℚ E] [IsCyclotomicExtension {5} ℚ E]
    [Module.Finite ℚ E] [IsAbelianGalois ℚ E]
    (iota : E →ₐ[ℚ] SeparableClosure ℚ)
    (M : IntermediateField ℚ E) (hM : Module.finrank ℚ M = 2)
    (ℓ : ℕ) [Fact ℓ.Prime] (hℓ : ℓ ≠ 5)
    (v : HeightOneSpectrum (𝓞 ℚ)) (hv : v.asIdeal = Ideal.span {(ℓ : 𝓞 ℚ)})
    (σ : E ≃ₐ[ℚ] E)
    (hσ : globalArtinMap ℚ E iota (Additive.ofMul (primeIdeleClass ℚ v)) =
      Additive.ofMul (Abelianization.of σ)) :
    (∀ x : M, σ x = x) ↔ (ℓ % 5 = 1 ∨ ℓ % 5 = 4) :=
  sorry

/-! ### Global existence, ray class fields, and class fields -/

/-- Reciprocity on the imported ray-class carrier. -/
noncomputable def rayClassArtinMap [IsAbelianGalois K L]
    (𝔪 : GlobalNumberFields.Modulus K) :
    GlobalNumberFields.RayClassGroup 𝔪 →* (L ≃ₐ[K] L) :=
  sorry

/-- The identification of the ground level of the global formation with the idele class group. -/
noncomputable def globalGroundEquiv :
    Additive (GlobalNumberFields.IdeleClassGroup K) ≃+ (globalFormation K).level ⊤ :=
  sorry

/-- The global existence theorem: every open finite-index subgroup of the idele class group is
the norm subgroup of a finite normal layer of the global formation. -/
theorem globalExistence
    (N : Subgroup (GlobalNumberFields.IdeleClassGroup K))
    (hN : IsOpen (N : Set (GlobalNumberFields.IdeleClassGroup K))) [N.FiniteIndex] :
    ∃ V : OpenNormalSubgroup (ProfiniteCohomology.AbsoluteGaloisGroup K),
      ((NormalLayer.ofOpenNormal V).normSubgroup (globalFormation K)).comap
          (globalGroundEquiv K).toAddMonoidHom =
        Subgroup.toAddSubgroup N :=
  sorry

/-- The norm-index theorem for finite abelian extensions: `[C_K : N C_L] = [L:K]`. -/
theorem card_ideleClassNormQuotient [Module.Finite K L] [IsAbelianGalois K L] :
    Nat.card (GlobalNumberFields.IdeleClassGroup K ⧸ (ideleClassNorm K L).range) =
      Module.finrank K L :=
  sorry

/-- **Frozen public name.** For a cyclic extension, being a global norm is equivalent to the
principal idele being an idele norm, hence to being a norm at every place. -/
theorem cyclicHasseNorm [Module.Finite K L] [IsGalois K L]
    [IsCyclic (L ≃ₐ[K] L)] (x : Kˣ) :
    (∃ y : Lˣ, Units.map (Algebra.norm K : L →* K) y = x) ↔
      principalIdele K x ∈ MonoidHom.range (ideleNormMap K L) :=
  sorry

/-- Coordinate-free spelling of “a norm at every place”. The local-coordinate theorem for
`ideleNormMap` identifies this predicate with membership in every completed-field norm range. -/
def IsLocalNormEverywhere [Module.Finite K L] (x : Kˣ) : Prop :=
  principalIdele K x ∈ MonoidHom.range (ideleNormMap K L)

/-- The cyclic Hasse norm theorem in the local-norm spelling used by quadratic-form consumers. -/
theorem isGlobalNorm_iff_isLocalNormEverywhere [Module.Finite K L] [IsGalois K L]
    [IsCyclic (L ≃ₐ[K] L)] (x : Kˣ) :
    (∃ y : Lˣ, Units.map (Algebra.norm K : L →* K) y = x) ↔
      IsLocalNormEverywhere K L x :=
  cyclicHasseNorm K L x

/-- Ring class field attached to the order carrier owned by `GlobalNumberFields`. -/
noncomputable def ringClassField (O : GlobalNumberFields.NumberFieldOrder K) :
    IntermediateField K (AlgebraicClosure K) :=
  sorry

/-- Reciprocity identifies the ring class field Galois group with the imported Picard group. -/
theorem gal_ringClassField_equiv_pic (O : GlobalNumberFields.NumberFieldOrder K) :
    Nonempty ((ringClassField K O ≃ₐ[K] ringClassField K O) ≃* GlobalNumberFields.Pic O) :=
  sorry

/-- The Hilbert class field: the class field of the trivial modulus. -/
noncomputable def hilbertClassField : IntermediateField K (AlgebraicClosure K) :=
  sorry

/-- The Hilbert class field is the ring class field of the maximal order, and its Galois group is
the class group. -/
theorem gal_hilbertClassField_equiv_classGroup :
    Nonempty ((hilbertClassField K ≃ₐ[K] hilbertClassField K) ≃* ClassGroup (𝓞 K)) :=
  sorry

/-- Kronecker–Weber, retained as a class-field-theory consequence. -/
theorem kroneckerWeber (E : Type) [Field E] [NumberField E]
    [IsAbelianGalois ℚ E] :
    ∃ n : ℕ, n ≠ 0 ∧ Nonempty (E →ₐ[ℚ] CyclotomicField n ℚ) :=
  sorry

/-! ### Hilbert reciprocity -/

/-- Finite-place cohomological Hilbert invariant, obtained from `localSymbol` at the
completion. -/
noncomputable def finiteHilbertInvariantAt
    (v : HeightOneSpectrum (𝓞 K)) (a b : Kˣ) : ZMod 2 :=
  sorry

/-- Archimedean cohomological Hilbert invariant; it is zero at complex places and detects two
negative arguments at a real place. -/
noncomputable def infiniteHilbertInvariantAt
    (w : InfinitePlace K) (a b : Kˣ) : ZMod 2 :=
  sorry

/-- The finite support of the finite-place Hilbert invariants. -/
noncomputable def finiteHilbertSupport (a b : Kˣ) :
    Finset (HeightOneSpectrum (𝓞 K)) :=
  sorry

theorem finiteHilbertInvariantAt_eq_zero_of_not_mem
    (a b : Kˣ) (v : HeightOneSpectrum (𝓞 K))
    (hv : v ∉ finiteHilbertSupport K a b) :
    finiteHilbertInvariantAt K v a b = 0 :=
  sorry

/-- **Frozen public name.** Hilbert reciprocity in additive cohomological form. The
multiplicative translation is the product of all local signs being `1`. -/
theorem hilbertProductFormula (a b : Kˣ) :
    (∑ v ∈ finiteHilbertSupport K a b, finiteHilbertInvariantAt K v a b) +
        ∑ w : InfinitePlace K, infiniteHilbertInvariantAt K w a b = 0 :=
  sorry

end Global

end TauCetiRoadmap.ClassFieldTheory
