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
tateTheorem  →  tateIso (-2)  →  nakayamaNegTwo  →  artinEquiv := nakayamaNegTwo.symm  →  artinMap.
```

`tateIso`, `nakayamaNegTwo`, `artinEquiv` and `artinMap` are ordinary definitions with bodies, so
the requested Artin map is definitionally the inverse of cup product with the fundamental class in
Tate degrees `-2` and `0` after the canonical low-degree identifications; it is not an arbitrary
equivalence of two finite groups. Tate's theorem itself is stated generically, with its three
hypotheses as separate explicit arguments rather than as an opaque bundle of class-formation
axioms, and `ClassFormation` discharges them one by one.

The layer order is the dependency order and there are no forward references. In particular the
local Brauer group and its invariant (Layer 5) precede the local class formation (Layer 6) that
consumes them; local existence (Layer 8) follows the Kummer theory it uses; the local Weil group
(Layer 9) follows local existence; and the sum-of-local-invariants map (Layer 10) precedes the
global class formation (Layer 11) whose invariant it *is*.

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

/-- Corestriction on ordinary finite-layer cohomology: the transfer `H^n(K/E) → H^n(K/F)`, in the
direction opposite to `cohomologyRes`. Corestriction is a separate named map, not a derived one:
the invariant normalizations of restriction and of corestriction differ, and both are used
downstream on their own. -/
noncomputable def cohomologyCor (T : LayerRestriction small big) (F : Formation G) (n : ℕ) :
    small.H F n →+ big.H F n :=
  sorry

/-- Corestriction on the finite-layer Tate groups, in every integer degree. -/
noncomputable def tateCor (T : LayerRestriction small big) (F : Formation G) (r : ℤ) :
    small.TateH F r →+ big.TateH F r :=
  sorry

/-- Corestriction on the trivial-coefficient Tate groups. -/
noncomputable def trivialTateCor (T : LayerRestriction small big) (r : ℤ) :
    small.TrivialTateH r →+ big.TrivialTateH r :=
  sorry

/-- **Restriction/corestriction normalization, first half:** `cor ∘ res = [E:F]`. -/
theorem cohomologyCor_cohomologyRes (T : LayerRestriction small big) (F : Formation G) (n : ℕ)
    (x : big.H F n) :
    T.cohomologyCor F n (T.cohomologyRes F n x) = T.relativeDegree • x :=
  sorry

/-- The Tate-degree form of `cor ∘ res = [E:F]`, valid in every integer degree. -/
theorem tateCor_tateRes (T : LayerRestriction small big) (F : Formation G) (r : ℤ)
    (x : big.TateH F r) :
    T.tateCor F r (T.tateRes F r x) = T.relativeDegree • x :=
  sorry

/-! ### Tower compatibility of restrictions

A tower `F ⊆ E ⊆ E' ⊆ K` of ground fields is a composite of two restrictions. The composite is
itself a restriction, and every map of this namespace is functorial along it. These are the
statements downstream tower arguments use; they are stated separately from the class-formation
axioms because they hold for any formation. -/

/-- Restrictions compose: a tower `F ⊆ E ⊆ E' ⊆ K` of ground fields. -/
theorem trans {mid : NormalLayer G} (S : LayerRestriction small mid)
    (T : LayerRestriction mid big) : LayerRestriction small big where
  same_top := S.same_top.trans T.same_top
  ground_le := le_trans S.ground_le T.ground_le

/-- The relative degree is multiplicative in a tower: `[E':F] = [E':E] · [E:F]`. -/
theorem relativeDegree_trans {mid : NormalLayer G} (S : LayerRestriction small mid)
    (T : LayerRestriction mid big) :
    (S.trans T).relativeDegree = S.relativeDegree * T.relativeDegree :=
  sorry

/-- Restriction is functorial in a tower. -/
theorem cohomologyRes_trans {mid : NormalLayer G} (S : LayerRestriction small mid)
    (T : LayerRestriction mid big) (F : Formation G) (n : ℕ) (x : big.H F n) :
    (S.trans T).cohomologyRes F n x = S.cohomologyRes F n (T.cohomologyRes F n x) :=
  sorry

/-- Corestriction is functorial in a tower. -/
theorem cohomologyCor_trans {mid : NormalLayer G} (S : LayerRestriction small mid)
    (T : LayerRestriction mid big) (F : Formation G) (n : ℕ) (x : small.H F n) :
    (S.trans T).cohomologyCor F n x = T.cohomologyCor F n (S.cohomologyCor F n x) :=
  sorry

/-- Tate restriction is functorial in a tower, in every integer degree. -/
theorem tateRes_trans {mid : NormalLayer G} (S : LayerRestriction small mid)
    (T : LayerRestriction mid big) (F : Formation G) (r : ℤ) (x : big.TateH F r) :
    (S.trans T).tateRes F r x = S.tateRes F r (T.tateRes F r x) :=
  sorry

/-- Tate corestriction is functorial in a tower, in every integer degree. -/
theorem tateCor_trans {mid : NormalLayer G} (S : LayerRestriction small mid)
    (T : LayerRestriction mid big) (F : Formation G) (r : ℤ) (x : small.TateH F r) :
    (S.trans T).tateCor F r x = T.tateCor F r (S.tateCor F r x) :=
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

/-- Refinements compose: a tower `F ⊆ K ⊆ L ⊆ M` of top fields. -/
theorem trans {newer : NormalLayer G} (S : LayerRefinement old new)
    (T : LayerRefinement new newer) : LayerRefinement old newer where
  same_ground := S.same_ground.trans T.same_ground
  new_top_le := le_trans T.new_top_le S.new_top_le

/-- The relative top degree is multiplicative in a tower. -/
theorem relativeDegree_trans {newer : NormalLayer G} (S : LayerRefinement old new)
    (T : LayerRefinement new newer) :
    (S.trans T).relativeDegree = S.relativeDegree * T.relativeDegree :=
  sorry

/-- Inflation is functorial in a tower of top fields. -/
theorem cohomologyInfl_trans {newer : NormalLayer G} (S : LayerRefinement old new)
    (T : LayerRefinement new newer) (F : Formation G) (n : ℕ) (x : old.H F n) :
    (S.trans T).cohomologyInfl F n x = T.cohomologyInfl F n (S.cohomologyInfl F n x) :=
  sorry

end LayerRefinement

namespace NormalLayer

variable {G : Type} [Group G] [TopologicalSpace G] [IsTopologicalGroup G]
  [CompactSpace G] [TotallyDisconnectedSpace G]

/-- **The finite quotient system.** The layer cut out by a subgroup `H ≤ U/V` has the same top
field and a smaller ground field, so it is a `LayerRestriction` of `L`; this is the datum through
which the hypotheses of Tate's theorem are checked subgroup by subgroup. -/
theorem subgroupRestriction (L : NormalLayer G) (H : Subgroup L.Gal) :
    LayerRestriction (L.subgroupLayer H) L :=
  sorry

/-- The relative degree of `subgroupRestriction` is the index `[U/V : H]`. -/
theorem relativeDegree_subgroupRestriction (L : NormalLayer G) (H : Subgroup L.Gal) :
    (L.subgroupRestriction H).relativeDegree = H.index :=
  sorry

/-- The degree of the layer cut out by `H` is `#H`. -/
theorem degree_subgroupLayer (L : NormalLayer G) (H : Subgroup L.Gal) :
    (L.subgroupLayer H).degree = Nat.card H :=
  sorry

end NormalLayer

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

/-- **Restriction/corestriction normalization, second half:** corestriction preserves invariants,
where restriction multiplies them by the relative degree. This is a theorem and not a field of
`ClassFormation`: it follows from `inv_restrict`, `inv_injective` and
`LayerRestriction.cohomologyCor_cohomologyRes`, and adding it as an axiom would let an
implementation satisfy it by fiat. -/
theorem inv_cor (cf : ClassFormation F) {small big : NormalLayer G}
    (T : LayerRestriction small big) (x : small.H F 2) :
    cf.inv big (T.cohomologyCor F 2 x) = cf.inv small x :=
  sorry

/-- Corestriction of a fundamental class: `cor u_{K/E} = [E:F] · u_{K/F}`. The scaling is the
mirror image of the one in `fundamentalClass_infl`, and it is what makes the corestriction square
for `tateIso` commute. -/
theorem fundamentalClass_cor (cf : ClassFormation F) {small big : NormalLayer G}
    (T : LayerRestriction small big) :
    T.cohomologyCor F 2 (cf.fundamentalClass small) =
      T.relativeDegree • cf.fundamentalClass big :=
  sorry

/-! ### The three hypotheses of Tate's theorem, verified for a class formation

These are the individually named facts that Layer 3 feeds to `tateTheorem`. They are stated one by
one, rather than being read off the `ClassFormation` structure at the point of use, because each is
consumed separately downstream: `h1_subgroupLayer` in the Hilbert-90 arguments,
`card_H2_subgroupLayer` in the norm-index computations, and
`fundamentalClass_restrict_generates` in the tower comparisons. -/

/-- `H¹` vanishes on every layer cut out by a subgroup of the Galois group. -/
theorem h1_subgroupLayer (cf : ClassFormation F) (L : NormalLayer G) (H : Subgroup L.Gal) :
    Subsingleton ((L.subgroupLayer H).H F 1) :=
  cf.h1_eq_zero _

/-- `H²` of the layer cut out by `H` has exactly `#H` elements. -/
theorem card_H2_subgroupLayer (cf : ClassFormation F) (L : NormalLayer G) (H : Subgroup L.Gal) :
    Nat.card ((L.subgroupLayer H).H F 2) = Nat.card H :=
  sorry

/-- The restriction of the fundamental class to the layer cut out by `H` generates that layer's
`H²`. This is the third hypothesis of Tate's theorem and the one that is not immediate from the
axioms: it combines `fundamentalClass_restrict` with `fundamentalClass_generates`. -/
theorem fundamentalClass_restrict_generates (cf : ClassFormation F) (L : NormalLayer G)
    (H : Subgroup L.Gal) (x : (L.subgroupLayer H).H F 2) :
    ∃ m : ℤ, x = m • (L.subgroupRestriction H).cohomologyRes F 2 (cf.fundamentalClass L) :=
  sorry

end ClassFormation

/-! ## Layer 3: Tate's theorem (Artin–Tate's Main Theorem)

⚠ Tate's theorem is stated **generically**, with each of its hypotheses a separate explicit
argument about a formation, a finite normal layer, and a chosen two-dimensional class. It is not
stated against an opaque bundle of "class-formation axioms". The hypotheses are used separately
downstream — the cyclic-layer Herbrand computations need only `h1`, the norm-index theorems only
`hcard`, the tower comparisons only `hgen` — and a consumer that has established them for one
layer applies the theorem directly. Layer 2's `ClassFormation` is one supplier of the three
hypotheses, through the individually named
`ClassFormation.h1_subgroupLayer`, `ClassFormation.card_H2_subgroupLayer` and
`ClassFormation.fundamentalClass_restrict_generates`. -/

section TateTheorem

variable {G : Type} [Group G] [TopologicalSpace G] [IsTopologicalGroup G]
  [CompactSpace G] [TotallyDisconnectedSpace G]

/-- Cup product with a chosen class `u : H²(U/V, A^V)`, after the tensor-unit identification
`ℤ ⊗ A^V ≅ A^V` and Mathlib's comparison of ordinary `H²` with Tate degree `2`. This is the named
homomorphism underlying Tate's theorem; its implementation is the generic Tate cup product of the
Layer 0 supplier audit. -/
noncomputable def cupClass (F : Formation G) (L : NormalLayer G) (u : L.H F 2) (r : ℤ) :
    L.TrivialTateH r →+ L.TateH F (r + 2) :=
  sorry

/-- **Tate's theorem** (J. Tate, *The higher dimensional cohomology groups of class field theory*,
Ann. of Math. 56 (1952); Artin–Tate, Chapter XIV §4), with its hypotheses stated one by one over
the finite quotient system `H ↦ L.subgroupLayer H`:

* `_h1` — `H¹(H, A^V) = 0` for every subgroup `H ≤ U/V`;
* `_hcard` — `H²(H, A^V)` has exactly `#H` elements;
* `_hgen` — the restriction of `u` to the layer of `H` generates that layer's `H²`.

Then cup product with `u` is an isomorphism `Ĥ^r(U/V,ℤ) ≃ Ĥ^{r+2}(U/V,A^V)` in every integer
degree. The Tate–Nakayama generalization replaces the trivial coefficients `ℤ` by a module `M`
with `Tor₁^ℤ(M,A^V) = 0`; it is the same three hypotheses plus that vanishing, and it belongs to
the generic Tate-cohomology supplier of Layer 0. -/
noncomputable def tateTheorem (F : Formation G) (L : NormalLayer G) (u : L.H F 2)
    (_h1 : ∀ H : Subgroup L.Gal, Subsingleton ((L.subgroupLayer H).H F 1))
    (_hcard : ∀ H : Subgroup L.Gal, Nat.card ((L.subgroupLayer H).H F 2) = Nat.card H)
    (_hgen : ∀ (H : Subgroup L.Gal) (x : (L.subgroupLayer H).H F 2),
      ∃ m : ℤ, x = m • (L.subgroupRestriction H).cohomologyRes F 2 u)
    (r : ℤ) :
    L.TrivialTateH r ≃+ L.TateH F (r + 2) :=
  sorry

/-- The isomorphism of Tate's theorem **is** cup product with `u`, not an unrelated equivalence
between two groups of the same cardinality. -/
theorem tateTheorem_toAddMonoidHom (F : Formation G) (L : NormalLayer G) (u : L.H F 2)
    (h1 : ∀ H : Subgroup L.Gal, Subsingleton ((L.subgroupLayer H).H F 1))
    (hcard : ∀ H : Subgroup L.Gal, Nat.card ((L.subgroupLayer H).H F 2) = Nat.card H)
    (hgen : ∀ (H : Subgroup L.Gal) (x : (L.subgroupLayer H).H F 2),
      ∃ m : ℤ, x = m • (L.subgroupRestriction H).cohomologyRes F 2 u)
    (r : ℤ) :
    (tateTheorem F L u h1 hcard hgen r).toAddMonoidHom = cupClass F L u r :=
  sorry

end TateTheorem

namespace ClassFormation

variable {G : Type} [Group G] [TopologicalSpace G] [IsTopologicalGroup G]
  [CompactSpace G] [TotallyDisconnectedSpace G]
  {F : Formation G}

/-- The fundamental class transported from ordinary `H²` to positive Tate degree `2` through
Mathlib's canonical comparison. -/
noncomputable def tateFundamentalClass (cf : ClassFormation F) (L : NormalLayer G) :
    L.TateH F 2 :=
  ((TateCohomology.isoGroupCohomology (R := ℤ) (G := L.Gal) 2).app (L.rep F)).inv
    (cf.fundamentalClass L)

/-- Cup product with the fundamental class: the generic `cupClass` at `u = fundamentalClass`. -/
noncomputable def cupFundamentalClass (cf : ClassFormation F) (L : NormalLayer G) (r : ℤ) :
    L.TrivialTateH r →+ L.TateH F (r + 2) :=
  cupClass F L (cf.fundamentalClass L) r

/-- Tate's theorem for a class formation, in every integer degree: the generic theorem applied to
the fundamental class, with the three hypotheses discharged by the three individually named
consequences of the axioms. This is Artin–Tate's Main Theorem (Chapter XIV §4). -/
noncomputable def tateIso (cf : ClassFormation F) (L : NormalLayer G) (r : ℤ) :
    L.TrivialTateH r ≃+ L.TateH F (r + 2) :=
  tateTheorem F L (cf.fundamentalClass L) (cf.h1_subgroupLayer L)
    (cf.card_H2_subgroupLayer L) (cf.fundamentalClass_restrict_generates L) r

/-- The isomorphism is the cup-product map, not an unrelated equivalence between groups of the
same cardinality. A closed proof: `tateIso` is definitionally the generic theorem, so this is the
generic statement, applied. -/
theorem tateIso_toAddMonoidHom (cf : ClassFormation F)
    (L : NormalLayer G) (r : ℤ) :
    (cf.tateIso L r).toAddMonoidHom = cf.cupFundamentalClass L r :=
  tateTheorem_toAddMonoidHom F L (cf.fundamentalClass L) (cf.h1_subgroupLayer L)
    (cf.card_H2_subgroupLayer L) (cf.fundamentalClass_restrict_generates L) r

/-- Compatibility of Tate's theorem with restriction to an intermediate ground field. -/
theorem tateIso_res (cf : ClassFormation F)
    {small big : NormalLayer G} (T : LayerRestriction small big) (r : ℤ)
    (x : big.TrivialTateH r) :
    T.tateRes F (r + 2) (cf.tateIso big r x) =
      cf.tateIso small r (T.trivialTateRes r x) :=
  sorry

/-- Compatibility of Tate's theorem with corestriction. ⚠ The corestriction square commutes
without a scaling factor, where the restriction square of `tateIso_res` also does but the
*inflation* square of `fundamentalClass_infl` does not. Asserting one shape for all three is the
standard error here. -/
theorem tateIso_cor (cf : ClassFormation F)
    {small big : NormalLayer G} (T : LayerRestriction small big) (r : ℤ)
    (x : small.TrivialTateH r) :
    T.tateCor F (r + 2) (cf.tateIso small r x) =
      cf.tateIso big r (T.trivialTateCor r x) :=
  sorry

/-- Compatibility of Tate's theorem with a tower of ground fields, `F ⊆ E ⊆ E' ⊆ K`. Together with
`LayerRestriction.relativeDegree_trans` this is the tower normalization the local and global
towers of Layers 6 and 11 consume. -/
theorem tateIso_res_trans (cf : ClassFormation F)
    {small mid big : NormalLayer G} (S : LayerRestriction small mid)
    (T : LayerRestriction mid big) (r : ℤ) (x : big.TrivialTateH r) :
    (S.trans T).tateRes F (r + 2) (cf.tateIso big r x) =
      cf.tateIso small r ((S.trans T).trivialTateRes r x) :=
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

/-! ## Layer 5: local coefficients, the Brauer group, the local invariant, and duality

⚠ The local Brauer group and its invariant map are built **before** the local class formation, not
after it. `localClassFormation` of Layer 6 consumes `invMap`; nothing in this layer may consume
`localArtinMap`, `normResidue`, `localExistence`, or the local class formation itself. -/

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

/-! ## Layer 6: the local class formation and finite local reciprocity -/

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

/-- The Hilbert-symbol form of the quadratic test, an integration test with `localSymbol`: for the
quadratic extension generated by a square root of a nonsquare `d`, the Artin symbol of `a` is the
nontrivial automorphism exactly when the quadratic symbol `(a,d)_K` is `-1` — additively, when
`localSymbol` returns `1 : ZMod 2`.

⚠ The extension must be *exactly* `K(√d)`, so the chosen square root `s` is data and generates
`L` over `K`. A bare hypothesis `∃ s : L, s * s = algebraMap K L d` does **not** pin `L`: it holds
for every extension of `K` that happens to contain a square root of `d`. The biquadratic field
`L = K(√d, √e)` satisfies it, has degree four, and has three nontrivial automorphisms, none of
which is determined by `(a,d)_K`; with only the existential hypothesis the statement is false. -/
theorem localArtinMap_quadratic_eq_hilbertSymbol
    [Algebra K L] [Module.Finite K L] [IsGalois K L]
    (iota : L →ₐ[K] SeparableClosure K)
    (d : Kˣ) (hd : ¬ IsSquare d)
    (s : L) (hs : s * s = algebraMap K L (d : K))
    (hgen : IntermediateField.adjoin K ({s} : Set L) = ⊤)
    (hdegree : Module.finrank K L = 2)
    (τ : L ≃ₐ[K] L) (hτ : τ ≠ 1) (hτs : τ s = -s) (a : Kˣ)
    (P : ProfiniteCohomology.TopPairing (muNRep 2 K) (muNRep 2 K) (muNRep 2 K))
    (tr : H 2 K 2 (muNRep 2 K) ≃+ ZMod 2) :
    localArtinMap K L iota (Additive.ofMul a) = Additive.ofMul (Abelianization.of τ) ↔
      localSymbol P tr (kummerClass 2 K a) (kummerClass 2 K d) = 1 :=
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

/-! ## Layer 7: the absolute local Artin map, its normalizations, and conductors -/

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

/-! ## Layer 8: separate arithmetic local existence

These targets are deliberately not methods of `ClassFormation`: reciprocity follows from the
class-formation axioms, but existence requires additional arithmetic input. Full existence is
stated only in mixed characteristic; the general local-field target below is prime to the residue
characteristic.
-/

/-- The identification of the ground level `A^{G_K}` of the local formation with `Kˣ`. -/
noncomputable def localGroundEquiv :
    Additive Kˣ ≃+ (localFormation K).level ⊤ :=
  sorry

/-- Full local existence in mixed characteristic: for a finite extension of `ℚ_p`, every open
finite-index subgroup of `Kˣ` is the norm subgroup of a finite normal layer. The `ℚ_p`-algebra
and finiteness hypotheses are load-bearing; equal-characteristic `p`-primary existence requires
Artin–Schreier–Witt theory and is outside this roadmap. -/
theorem localExistence (p : ℕ) [Fact p.Prime]
    [Algebra ℚ_[p] K] [Module.Finite ℚ_[p] K]
    (N : Subgroup Kˣ) (hN : IsOpen (N : Set Kˣ)) [N.FiniteIndex] :
    ∃ V : OpenNormalSubgroup (ProfiniteCohomology.AbsoluteGaloisGroup K),
      ((NormalLayer.ofOpenNormal V).normSubgroup (localFormation K)).comap
          (localGroundEquiv K).toAddMonoidHom =
        Subgroup.toAddSubgroup N :=
  sorry

/-- Prime-to-residue-characteristic local existence, valid also in equal characteristic: an open
finite-index subgroup whose index is coprime to the residue characteristic is a norm subgroup.
The coprimality hypothesis is part of the public signature, so this target cannot be used to claim
the excluded `p`-primary case. -/
theorem localExistence_primeToResidueCharacteristic
    (p : ℕ) [Fact p.Prime] [CharP 𝓀[K] p]
    (N : Subgroup Kˣ) (hN : IsOpen (N : Set Kˣ)) [N.FiniteIndex]
    (hindex : Nat.Coprime (Nat.card (Kˣ ⧸ N)) p) :
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

/-! ## Layer 9: the local Weil group

A layer of its own, and not a corollary of reciprocity: the Weil group has a carrier, a topology
that is **not** the one induced from `G_K`, functoriality in finite extensions, an exact sequence
with inertia, and only then the comparison of its topological abelianization with `Kˣ`. It sits
after local existence because `Kˣ ≃ W_K^ab` needs the injectivity of `artinMap`, i.e. that the
intersection of the norm groups is trivial, which is a consequence of `localExistence`. -/

/-- **The carrier.** The local Weil group as a subgroup of `G_K`: the preimage of the powers of
arithmetic Frobenius under `G_K → Gal(K^ur/K) ≅ Ẑ`, that is, the preimage of `ℤ ⊆ Ẑ`. The
surjection `G_K → Ẑ` and its kernel `LocalFieldsRamification.inertia` are owned by
`LocalFieldsRamification` — its maximal unramified extension and its exact sequence
`1 → I_K → G_K → Ẑ → 1` — and everything below is owned here. -/
noncomputable def localWeilGroup : Subgroup (Field.absoluteGaloisGroup K) :=
  sorry

/-- Inertia is the degree-zero part of the Weil group, hence contained in it. -/
theorem inertia_le_localWeilGroup :
    LocalFieldsRamification.inertia K ≤ localWeilGroup K :=
  sorry

/-- `W_K` is normal in `G_K`, being the preimage of a subgroup of an abelian quotient. -/
instance localWeilGroup_normal : (localWeilGroup K).Normal :=
  sorry

/-- `W_K` is dense in `G_K`, because `ℤ` is dense in `Ẑ`. -/
theorem dense_localWeilGroup :
    Dense (localWeilGroup K : Set (Field.absoluteGaloisGroup K)) :=
  sorry

/-- `W_K` is a proper subgroup: `ℤ ≠ Ẑ`. Together with `dense_localWeilGroup` this is why the
subspace topology cannot be the right one. -/
theorem localWeilGroup_ne_top : localWeilGroup K ≠ ⊤ :=
  sorry

/-- **The carrier with the Weil topology.** ⚠ `WeilGroup K` is a type synonym for the subgroup
`localWeilGroup K` precisely so that it does **not** inherit the subspace topology. Inertia is open
in the Weil topology and is *not* open in `G_K` (`not_isOpen_inertia`), so
`TopologicalAbelianization ↥(localWeilGroup K)` — the subtype with its induced topology — is a
different, and false, statement of `localWeilArtinEquiv` below. -/
def WeilGroup : Type := localWeilGroup K

noncomputable instance instGroupWeilGroup : Group (WeilGroup K) :=
  inferInstanceAs (Group (localWeilGroup K))

/-- **The topology.** The unique group topology on `W_K` in which `I_K`, with the topology it
carries as a closed subgroup of `G_K`, is an open subgroup. -/
noncomputable instance instTopologicalSpaceWeilGroup : TopologicalSpace (WeilGroup K) :=
  sorry

instance instIsTopologicalGroupWeilGroup : IsTopologicalGroup (WeilGroup K) :=
  sorry

/-- The inclusion `W_K → G_K`. -/
noncomputable def weilToAbsolute : WeilGroup K →* Field.absoluteGaloisGroup K :=
  (localWeilGroup K).subtype

omit [ValuativeRel K] [TopologicalSpace K] [IsNonarchimedeanLocalField K] in
theorem injective_weilToAbsolute : Function.Injective (weilToAbsolute K) :=
  Subtype.val_injective

/-- The inclusion is continuous, because the Weil topology is finer than the induced one. -/
theorem continuous_weilToAbsolute : Continuous (weilToAbsolute K) :=
  sorry

/-- Inertia, pulled back to `W_K`, is open. -/
theorem isOpen_inertia_weil :
    IsOpen {w : WeilGroup K | weilToAbsolute K w ∈ LocalFieldsRamification.inertia K} :=
  sorry

/-- ⚠ The same subgroup is **not** open in `G_K`: its image in `Ẑ` is the singleton `{0}`, which
is not open. This is exactly the difference between the Weil topology and the induced topology,
and it is why `W_K` is locally compact while `G_K` is compact. -/
theorem not_isOpen_inertia :
    ¬ IsOpen (LocalFieldsRamification.inertia K : Set (Field.absoluteGaloisGroup K)) :=
  sorry

instance instLocallyCompactSpaceWeilGroup : LocallyCompactSpace (WeilGroup K) :=
  sorry

instance instTotallyDisconnectedSpaceWeilGroup : TotallyDisconnectedSpace (WeilGroup K) :=
  sorry

/-- ⚠ `W_K` is **not** compact in the Weil topology, although `G_K` is compact and `W_K` is dense
in it. A proof of `localWeilArtinEquiv` that transports compactness across the inclusion is
wrong. -/
theorem not_compactSpace_weilGroup : ¬ CompactSpace (WeilGroup K) :=
  sorry

/-- **The exact sequence with inertia**, first map: the degree homomorphism `W_K → ℤ`, normalized
so that an arithmetic Frobenius lift has degree `1`. -/
noncomputable def weilDegree : WeilGroup K →* Multiplicative ℤ :=
  sorry

/-- Exactness on the right: every integer is the degree of an element of `W_K`. -/
theorem surjective_weilDegree : Function.Surjective (weilDegree K) :=
  sorry

/-- Exactness in the middle: the kernel of the degree is inertia. Together with
`surjective_weilDegree` and `injective_weilToAbsolute` this is `1 → I_K → W_K → ℤ → 1`. -/
theorem ker_weilDegree :
    (weilDegree K).ker =
      (LocalFieldsRamification.inertia K).comap (weilToAbsolute K) :=
  sorry

/-- Arithmetic normalization of the degree against the frozen `unramifiedCoordinate`: the
unramified coordinate of the image of `w` in `G_K^ab` is the image of its degree in `Ẑ`. This is
what forbids the geometric normalization on the Weil group. -/
theorem unramifiedCoordinate_weilDegree (w : WeilGroup K) :
    unramifiedCoordinate K
        (QuotientGroup.mk (weilToAbsolute K w) : Field.absoluteGaloisGroupAbelianization K) =
      zhatOfInt (Multiplicative.toAdd (weilDegree K w)) :=
  sorry

/-- **Functoriality in a finite extension**, the inclusion `W_L ↪ W_K` attached to an embedding of
`L` in the chosen separable closure. -/
noncomputable def weilTransfer [Algebra K L] [Module.Finite K L] [Algebra.IsSeparable K L]
    (_iota : L →ₐ[K] SeparableClosure K) : WeilGroup L →* WeilGroup K :=
  sorry

theorem injective_weilTransfer [Algebra K L] [Module.Finite K L] [Algebra.IsSeparable K L]
    (iota : L →ₐ[K] SeparableClosure K) :
    Function.Injective (weilTransfer K L iota) :=
  sorry

theorem continuous_weilTransfer [Algebra K L] [Module.Finite K L] [Algebra.IsSeparable K L]
    (iota : L →ₐ[K] SeparableClosure K) :
    Continuous (weilTransfer K L iota) :=
  sorry

/-- The image is open of index `[L:K]`; in particular `W_L` is an open subgroup of `W_K` of finite
index, which is what makes the Weil group of a finite extension a subobject of the Weil group. -/
theorem isOpen_range_weilTransfer [Algebra K L] [Module.Finite K L] [Algebra.IsSeparable K L]
    (iota : L →ₐ[K] SeparableClosure K) :
    IsOpen ((weilTransfer K L iota).range : Set (WeilGroup K)) :=
  sorry

theorem index_range_weilTransfer [Algebra K L] [Module.Finite K L] [Algebra.IsSeparable K L]
    (iota : L →ₐ[K] SeparableClosure K) :
    (weilTransfer K L iota).range.index = Module.finrank K L :=
  sorry

/-- ⚠ The degree map is **not** compatible with `weilTransfer` on the nose: it is multiplied by the
residue degree `f(L/K)`, so it agrees only for `L/K` totally ramified. Writing
`weilDegree K (weilTransfer K L iota w) = weilDegree L w` normalizes the Weil group of an
unramified extension incorrectly. -/
theorem weilDegree_weilTransfer [Algebra K L] [ValuativeExtension K L] [Module.Finite K L]
    [Algebra.IsSeparable K L] (iota : L →ₐ[K] SeparableClosure K) (w : WeilGroup L) :
    weilDegree K (weilTransfer K L iota w) =
      weilDegree L w ^ LocalFieldsRamification.inertiaDegree K L :=
  sorry

/-- Restriction of Weil elements to a finite Galois subextension. -/
noncomputable def weilRestrict [Algebra K L] [Module.Finite K L] [IsGalois K L]
    (_iota : L →ₐ[K] SeparableClosure K) : WeilGroup K →* (L ≃ₐ[K] L) :=
  sorry

/-- `weilRestrict` is the restriction of automorphisms, not another map of the same type. -/
theorem weilRestrict_apply [Algebra K L] [Module.Finite K L] [IsGalois K L]
    (iota : L →ₐ[K] SeparableClosure K) (w : WeilGroup K) :
    weilRestrict K L iota w = restrictAbsolute K L iota (weilToAbsolute K w) :=
  sorry

/-- `W_K → Gal(L/K)` is surjective — the Weil group is dense in `G_K`, so it already surjects onto
every finite quotient. -/
theorem surjective_weilRestrict [Algebra K L] [Module.Finite K L] [IsGalois K L]
    (iota : L →ₐ[K] SeparableClosure K) :
    Function.Surjective (weilRestrict K L iota) :=
  sorry

/-- The kernel of restriction to `L` is the Weil group of `L`: the two functorialities agree. -/
theorem range_weilTransfer_eq_ker_weilRestrict [Algebra K L] [Module.Finite K L] [IsGalois K L]
    (iota : L →ₐ[K] SeparableClosure K) :
    (weilTransfer K L iota).range = (weilRestrict K L iota).ker :=
  sorry

/-- **Frozen public name.** The Weil-group form of local reciprocity. Unlike `artinMap` it is an
isomorphism, and a topological one onto the **topological** abelianization
`W_K / closure ⁅W_K, W_K⁆`.
⚠ The algebraic `Abelianization (WeilGroup K)` is the wrong target: the commutator subgroup of
`W_K` need not be closed, and the algebraic quotient is not `Kˣ`. -/
noncomputable def localWeilArtinEquiv :
    Kˣ ≃ₜ* TopologicalAbelianization (WeilGroup K) :=
  sorry

/-- The Weil-group reciprocity map recovers `artinMap` after passing to `G_K^ab`. -/
theorem localWeilArtinEquiv_compat (x : Kˣ) (w : WeilGroup K)
    (hw : (QuotientGroup.mk w : TopologicalAbelianization (WeilGroup K)) =
      localWeilArtinEquiv K x) :
    (QuotientGroup.mk (weilToAbsolute K w) :
      Field.absoluteGaloisGroupAbelianization K) = artinMap K x :=
  sorry

/-- The image of `Kˣ` under `artinMap` is the image of the Weil group: dense but not all of
`G_K^ab`. -/
theorem mem_range_artinMap_iff (y : Field.absoluteGaloisGroupAbelianization K) :
    y ∈ (artinMap K).range ↔
      ∃ w : WeilGroup K,
        (QuotientGroup.mk (weilToAbsolute K w) :
          Field.absoluteGaloisGroupAbelianization K) = y :=
  sorry

end Local

/-! ## Layer 10: global carriers, the Brauer sequence, and the sum of local invariants -/

section Global

variable (K : Type) [Field K] [NumberField K]
variable (L : Type) [Field L] [NumberField L] [Algebra K L]

/-- The formation assembled from idele class groups of the finite separable extensions of `K`
inside a fixed separable closure. -/
noncomputable def globalFormation : Formation (ProfiniteCohomology.AbsoluteGaloisGroup K) :=
  sorry

/-- The formation assembled from the idele groups themselves, rather than the idele classes. The
sum of local invariants is defined on its layers, where `H²` splits as a direct sum of local Brauer
groups, and only then descends to the idele-class layers. -/
noncomputable def ideleFormation : Formation (ProfiniteCohomology.AbsoluteGaloisGroup K) :=
  sorry

/-! ### The global Brauer sequence and the sum of local invariants

⚠ This block comes **before** `globalClassFormation`, and is not a corollary of it. The invariant
map of the global class formation *is* the sum of the local invariants, so the sum map, its finite
support, and the exactness of

```text
0 → Br K → ⨁_v Br K_v → ℚ/ℤ → 0
```

exist before the structure that consumes them. Nothing in this block may use `globalArtinMap`,
`globalExistence`, or Chebotarev: those are downstream of the abstract Artin map, which is
downstream of the class formation, which is downstream of this block. The inputs are the local
invariants of Layer 5, the Herbrand computations on the `S`-idele and `S`-unit modules, the two
fundamental inequalities, and `H¹`-vanishing for idele classes. -/

/-- Restriction of a global Brauer class to a finite completion. -/
noncomputable def brFinite (v : HeightOneSpectrum (𝓞 K)) :
    Br K →+ Br (v.adicCompletion K) :=
  sorry

/-- Restriction of a global Brauer class to an archimedean completion. -/
noncomputable def brInfinite (w : NumberField.InfinitePlace K) :
    Br K →+ Br w.Completion :=
  sorry

/-- **The archimedean local invariant.** The archimedean half of the Layer 5 local package:
`Br ℂ` vanishes, and `Br ℝ` is cyclic of order two whose nontrivial class has invariant `1/2`. -/
noncomputable def infiniteInvMap (w : NumberField.InfinitePlace K) :
    Br w.Completion →+ RatModInt :=
  sorry

/-- At a complex place the Brauer group is trivial, so the invariant vanishes. -/
theorem infiniteInvMap_eq_zero_of_isComplex (w : NumberField.InfinitePlace K)
    (hw : w.IsComplex) (x : Br w.Completion) :
    infiniteInvMap K w x = 0 :=
  sorry

/-- At a real place the invariants are exactly the elements of order dividing two. ⚠ Real places
are not ignorable: dropping them already breaks the sum formula for `ℚ(i)/ℚ`. -/
theorem range_infiniteInvMap_of_isReal (w : NumberField.InfinitePlace K) (hw : w.IsReal) :
    Set.range (infiniteInvMap K w) = (ratModIntTorsion 2 : Set RatModInt) :=
  sorry

/-- The local invariant of a global Brauer class at a finite place. The instance arguments needed
to name `invMap` at the completion are carried by `finiteInvAt_eq_invMap` rather than by this
definition, so that the sum below can range over all places. -/
noncomputable def finiteInvAt (v : HeightOneSpectrum (𝓞 K)) (x : Br K) : RatModInt :=
  sorry

/-- `finiteInvAt` is the Layer 5 invariant of the restriction to the completion, not a second
normalization. -/
theorem finiteInvAt_eq_invMap (v : HeightOneSpectrum (𝓞 K))
    [ValuativeRel (v.adicCompletion K)] [IsNonarchimedeanLocalField (v.adicCompletion K)]
    (x : Br K) :
    finiteInvAt K v x = invMap (v.adicCompletion K) (brFinite K v x) :=
  sorry

/-- The local invariant of a global Brauer class at an archimedean place. -/
noncomputable def infiniteInvAt (w : NumberField.InfinitePlace K) (x : Br K) : RatModInt :=
  infiniteInvMap K w (brInfinite K w x)

/-- The finite places where a global Brauer class is ramified. -/
noncomputable def brauerSupport (x : Br K) : Finset (HeightOneSpectrum (𝓞 K)) :=
  sorry

theorem finiteInvAt_eq_zero_of_not_mem (x : Br K) (v : HeightOneSpectrum (𝓞 K))
    (hv : v ∉ brauerSupport K x) :
    finiteInvAt K v x = 0 :=
  sorry

/-- **The sum of local invariants**, the middle map of the global Brauer sequence. -/
noncomputable def sumLocalInv (x : Br K) : RatModInt :=
  (∑ v ∈ brauerSupport K x, finiteInvAt K v x) +
    ∑ w : NumberField.InfinitePlace K, infiniteInvAt K w x

/-- Exactness at `Br K` (Albert–Brauer–Hasse–Noether): a class trivial at every place is
trivial. -/
theorem eq_zero_of_localInv_eq_zero (x : Br K)
    (hf : ∀ v : HeightOneSpectrum (𝓞 K), finiteInvAt K v x = 0)
    (hi : ∀ w : NumberField.InfinitePlace K, infiniteInvAt K w x = 0) :
    x = 0 :=
  sorry

/-- Exactness in the middle: the local invariants of a global class sum to zero. -/
theorem sumLocalInv_eq_zero (x : Br K) : sumLocalInv K x = 0 :=
  sorry

/-- Exactness on the right: a finitely supported family of local invariants, two-torsion at the
real places and zero at the complex ones, summing to zero, is the family of a global class. -/
theorem exists_br_of_sum_eq_zero
    (S : Finset (HeightOneSpectrum (𝓞 K))) (f : HeightOneSpectrum (𝓞 K) → RatModInt)
    (hS : ∀ v ∉ S, f v = 0)
    (g : NumberField.InfinitePlace K → RatModInt)
    (hgr : ∀ w : NumberField.InfinitePlace K, w.IsReal → g w ∈ ratModIntTorsion 2)
    (hgc : ∀ w : NumberField.InfinitePlace K, w.IsComplex → g w = 0)
    (hsum : (∑ v ∈ S, f v) + ∑ w : NumberField.InfinitePlace K, g w = 0) :
    ∃ x : Br K, (∀ v : HeightOneSpectrum (𝓞 K), finiteInvAt K v x = f v) ∧
      ∀ w : NumberField.InfinitePlace K, infiniteInvAt K w x = g w :=
  sorry

/-! ### The global invariant of a finite layer

The layer invariant is the sum of local invariants, computed on the idele layer and descended to
the idele-class layer. It is *defined* here, before `globalClassFormation` consumes it. -/

/-- The comparison `H²(Gal(L/K), I_L) → H²(Gal(L/K), C_L)` induced by `I_L → C_L`. -/
noncomputable def ideleToClassH2 (Lay : NormalLayer (ProfiniteCohomology.AbsoluteGaloisGroup K)) :
    Lay.H (ideleFormation K) 2 →+ Lay.H (globalFormation K) 2 :=
  sorry

/-- Every idele-class layer class lifts to the idele layer. This uses `H¹(Gal(L/K), C_L) = 0` and
the fundamental inequalities, and it is what makes the sum of local invariants descend. -/
theorem surjective_ideleToClassH2
    (Lay : NormalLayer (ProfiniteCohomology.AbsoluteGaloisGroup K)) :
    Function.Surjective (ideleToClassH2 K Lay) :=
  sorry

/-- The local component of an idele-layer class at a finite place, in invariant coordinates. -/
noncomputable def ideleLocalInvAt (Lay : NormalLayer (ProfiniteCohomology.AbsoluteGaloisGroup K))
    (v : HeightOneSpectrum (𝓞 K)) : Lay.H (ideleFormation K) 2 →+ RatModInt :=
  sorry

/-- The local component of an idele-layer class at an archimedean place. -/
noncomputable def ideleInfiniteInvAt
    (Lay : NormalLayer (ProfiniteCohomology.AbsoluteGaloisGroup K))
    (w : NumberField.InfinitePlace K) : Lay.H (ideleFormation K) 2 →+ RatModInt :=
  sorry

/-- The finite places at which an idele-layer class is ramified. -/
noncomputable def ideleSupport (Lay : NormalLayer (ProfiniteCohomology.AbsoluteGaloisGroup K))
    (x : Lay.H (ideleFormation K) 2) : Finset (HeightOneSpectrum (𝓞 K)) :=
  sorry

theorem ideleLocalInvAt_eq_zero_of_not_mem
    (Lay : NormalLayer (ProfiniteCohomology.AbsoluteGaloisGroup K))
    (x : Lay.H (ideleFormation K) 2) (v : HeightOneSpectrum (𝓞 K))
    (hv : v ∉ ideleSupport K Lay x) :
    ideleLocalInvAt K Lay v x = 0 :=
  sorry

/-- **The sum of local invariants on an idele layer.** `H²(Gal(L/K), I_L) = ⨁_v Br(L_w/K_v)`, and
this is the sum of the local invariants of the components. -/
noncomputable def ideleSumLocalInv
    (Lay : NormalLayer (ProfiniteCohomology.AbsoluteGaloisGroup K))
    (x : Lay.H (ideleFormation K) 2) : RatModInt :=
  (∑ v ∈ ideleSupport K Lay x, ideleLocalInvAt K Lay v x) +
    ∑ w : NumberField.InfinitePlace K, ideleInfiniteInvAt K Lay w x

/-- **The global invariant of a finite layer**, the datum `globalClassFormation` is built from. -/
noncomputable def globalInv (Lay : NormalLayer (ProfiniteCohomology.AbsoluteGaloisGroup K)) :
    Lay.H (globalFormation K) 2 →+ RatModInt :=
  sorry

/-- **The sum formula, as the definition of the global invariant.** The invariant of an
idele-class layer class is the sum of the local invariants of any idele-layer lift; this is
well defined because the sum of local invariants kills the image of `H²(Gal(L/K), Lˣ)`, i.e.
because of `sumLocalInv_eq_zero`. -/
theorem globalInv_ideleToClassH2
    (Lay : NormalLayer (ProfiniteCohomology.AbsoluteGaloisGroup K))
    (x : Lay.H (ideleFormation K) 2) :
    globalInv K Lay (ideleToClassH2 K Lay x) = ideleSumLocalInv K Lay x :=
  sorry

theorem globalInv_injective (Lay : NormalLayer (ProfiniteCohomology.AbsoluteGaloisGroup K)) :
    Function.Injective (globalInv K Lay) :=
  sorry

theorem globalInv_range (Lay : NormalLayer (ProfiniteCohomology.AbsoluteGaloisGroup K)) :
    Set.range (globalInv K Lay) = (ratModIntTorsion Lay.degree : Set RatModInt) :=
  sorry

/-! ## Layer 11: the global class formation and global Artin reciprocity -/

/-- The global class formation, built from the sum-of-local-invariants map above. Its axioms are
`globalInv_injective`, `globalInv_range`, `H¹`-vanishing for idele classes, and the restriction,
inflation and conjugation formulae for `globalInv`. -/
noncomputable def globalClassFormation : ClassFormation (globalFormation K) :=
  sorry

/-- The invariant of the global class formation is the named sum-of-local-invariants map, not an
independently chosen normalization. -/
theorem globalClassFormation_inv
    (Lay : NormalLayer (ProfiniteCohomology.AbsoluteGaloisGroup K)) :
    (globalClassFormation K).inv Lay = globalInv K Lay :=
  sorry

/-- Local–global compatibility of the fundamental class. ⚠ This is a *later comparison* theorem,
stated once the class formation exists; it may not be used in the construction of
`globalClassFormation`, whose invariant is `globalInv` by definition. The local components of any
idele-layer lift of the global fundamental class sum to `1/[L:K]`. -/
theorem ideleSumLocalInv_fundamentalClass
    (Lay : NormalLayer (ProfiniteCohomology.AbsoluteGaloisGroup K))
    (x : Lay.H (ideleFormation K) 2)
    (hx : ideleToClassH2 K Lay x = (globalClassFormation K).fundamentalClass Lay) :
    ideleSumLocalInv K Lay x = fundamentalInvariant Lay.degree := by
  rw [← globalInv_ideleToClassH2, hx, ← globalClassFormation_inv,
    ClassFormation.inv_fundamentalClass]

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

/-- Quadratic global test: for a quadratic extension `L/K` and a prime unramified in it, the
Artin symbol is the nontrivial automorphism exactly when the prime is inert, i.e. when the
residue degree is `2`; it is trivial exactly when the prime splits. The extension is pinned by
its degree and the prime by its residue degree, so no square root has to be chosen here. -/
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

/-! ## Layer 12: separate arithmetic global existence, the norm index, and ray class fields

As on the local side, `globalExistence` is an arithmetic theorem about the idele-class formation,
not a formal consequence of an arbitrary `ClassFormation`.
-/

/-- Reciprocity on the imported ray-class carrier. -/
noncomputable def rayClassArtinMap [IsAbelianGalois K L]
    (𝔪 : GlobalNumberFields.Modulus K) :
    GlobalNumberFields.RayClassGroup 𝔪 →* (L ≃ₐ[K] L) :=
  sorry

/-- **The splitting law**: on the class of an unramified prime coprime to the modulus, the
ray-class reciprocity map is the Artin symbol of that prime.
⚠ Without this, `rayClassArtinMap` is a `def` with no characterising equation and constrains
nothing — a consumer counting primes by their Frobenius cannot connect the two. `ZerosOfLFunctions`
Layer 8.8 states its reciprocity dictionary as an explicit hypothesis precisely because this law
was missing; with it, that hypothesis is discharged here rather than assumed there. -/
theorem rayClassArtinMap_idealClass [IsAbelianGalois K L]
    (𝔪 : GlobalNumberFields.Modulus K)
    (I : GlobalNumberFields.integralIdealsPrimeTo 𝔪)
    [hI : (I : Ideal (𝓞 K)).IsMaximal]
    (hur : ∀ (Q : Ideal (𝓞 L)) [Q.IsPrime] [Q.LiesOver (I : Ideal (𝓞 K))],
      Algebra.IsUnramifiedAt (𝓞 K) Q) :
    ConjClasses.mk (rayClassArtinMap K L 𝔪 (GlobalNumberFields.idealClass 𝔪 I)) =
      NumberFieldArithmetic.artinSymbol (K := K) (L := L) (I : Ideal (𝓞 K)) hur :=
  sorry

/-- **Surjectivity of the ray-class reciprocity map**, for a modulus divisible by the conductor.
The companion the same consumers need: the splitting law identifies the image of one class, this
says the classes exhaust the Galois group. -/
theorem rayClassArtinMap_surjective [IsAbelianGalois K L]
    (𝔪 : GlobalNumberFields.Modulus K)
    (h𝔪 : ∀ v : IsDedekindDomain.HeightOneSpectrum (𝓞 K),
      (∃ (Q : Ideal (𝓞 L)) (_ : Q.IsPrime) (_ : Q.LiesOver v.asIdeal),
        ¬ Algebra.IsUnramifiedAt (𝓞 K) Q) → v ∈ 𝔪.support) :
    Function.Surjective (rayClassArtinMap K L 𝔪) :=
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

/-! ## Layer 13: norm theorems and class fields -/

/-- **Frozen public name.** For a cyclic extension, being a global norm is equivalent to the
principal idele being an idele norm, hence to being a norm at every place. -/
theorem cyclicHasseNorm [Module.Finite K L] [IsGalois K L]
    [IsCyclic (L ≃ₐ[K] L)] (x : Kˣ) :
    (∃ y : Lˣ, Units.map (Algebra.norm K : L →* K) y = x) ↔
      principalIdele K x ∈ MonoidHom.range (ideleNormMap K L) :=
  sorry

/-- The norm map of the finite étale algebra obtained from `L/K` at a finite place. Using the
scalar extension, rather than choosing a place of `L` above `v`, retains every local factor. -/
noncomputable def finiteLocalNormMap [Module.Finite K L]
    (v : HeightOneSpectrum (RingOfIntegers K)) :
    (v.adicCompletion K ⊗[K] L)ˣ →* (v.adicCompletion K)ˣ :=
  sorry

/-- The norm map of the finite étale algebra obtained from `L/K` at an infinite place. The
canonical carrier `w.Completion` is Mathlib's completion of `K` at `w`; in particular the real
and complex cases are not encoded by a second roadmap-local notion of infinite place. -/
noncomputable def infiniteLocalNormMap [Module.Finite K L]
    (w : NumberField.InfinitePlace K) :
    (w.Completion ⊗[K] L)ˣ →* w.Completionˣ :=
  sorry

/-- A principal element is a norm at the finite place `v`, stated on the canonical finite local
étale algebra `K_v ⊗_K L`. -/
def IsFiniteLocalNorm [Module.Finite K L]
    (v : HeightOneSpectrum (RingOfIntegers K)) (x : Kˣ) : Prop :=
  Units.map (algebraMap K (v.adicCompletion K)).toMonoidHom x ∈
    MonoidHom.range (finiteLocalNormMap K L v)

/-- A principal element is a norm at the infinite place `w`, stated on Mathlib's canonical
completion and the full étale algebra `K_w ⊗_K L`. -/
def IsInfiniteLocalNorm [Module.Finite K L]
    (w : NumberField.InfinitePlace K) (x : Kˣ) : Prop :=
  Units.map (algebraMap K w.Completion).toMonoidHom x ∈
    MonoidHom.range (infiniteLocalNormMap K L w)

/-- At a complex place the local norm condition is automatic. This theorem is recorded rather
than silently omitting complex places from `IsLocalNormEverywhere`. -/
theorem isInfiniteLocalNorm_of_isComplex [Module.Finite K L]
    (w : NumberField.InfinitePlace K) (hw : w.IsComplex) (x : Kˣ) :
    IsInfiniteLocalNorm K L w x :=
  sorry

/-- Genuine placewise spelling of “a norm everywhere”: every finite completion and every
archimedean completion occurs explicitly. -/
def IsLocalNormEverywhere [Module.Finite K L] (x : Kˣ) : Prop :=
  (∀ v : HeightOneSpectrum (RingOfIntegers K), IsFiniteLocalNorm K L v x) ∧
    ∀ w : NumberField.InfinitePlace K, IsInfiniteLocalNorm K L w x

/-- **The placewise description of the idelic norm, for an arbitrary idele**, stated against
the supplier's coordinate projections `GlobalNumberFields.ideleFiniteCoord` and
`ideleInfiniteCoord`. The principal case is the theorem below; Global Quadratic Forms' kernel
computation for `i ↦ ∏_v (i_v, b_v)_v` needs this one on `N(I_E)`, where the ideles are not
principal. Both directions are used: forward projects a norm to each coordinate; the converse
assembles local preimages, using that an unramified extension has surjective norm on local units
at all but finitely many finite places. -/
theorem mem_range_ideleNormMap_iff [Module.Finite K L]
    (i : GlobalNumberFields.IdeleGroup K) :
    i ∈ MonoidHom.range (ideleNormMap K L) ↔
      (∀ v : HeightOneSpectrum (RingOfIntegers K),
          GlobalNumberFields.ideleFiniteCoord v i ∈
            MonoidHom.range (finiteLocalNormMap K L v)) ∧
        ∀ w : NumberField.InfinitePlace K,
          GlobalNumberFields.ideleInfiniteCoord w i ∈
            MonoidHom.range (infiniteLocalNormMap K L w) := sorry

/-- Local-coordinate bridge for the idelic norm. Its proof projects an idele norm to each local
factor in the forward direction. Conversely it chooses local preimages, uses that an unramified
extension has surjective norm on local units at all but finitely many finite places, and assembles
the resulting restricted product; the real and complex archimedean factors are handled separately.
This is the public theorem consumers use to cross between ideles and placewise norm equations. -/
theorem principalIdele_mem_range_ideleNormMap_iff [Module.Finite K L] (x : Kˣ) :
    principalIdele K x ∈ MonoidHom.range (ideleNormMap K L) ↔
      IsLocalNormEverywhere K L x :=
  sorry

/-- The cyclic Hasse norm theorem in the local-norm spelling used by quadratic-form consumers. -/
theorem isGlobalNorm_iff_isLocalNormEverywhere [Module.Finite K L] [IsGalois K L]
    [IsCyclic (L ≃ₐ[K] L)] (x : Kˣ) :
    (∃ y : Lˣ, Units.map (Algebra.norm K : L →* K) y = x) ↔
      IsLocalNormEverywhere K L x :=
  (cyclicHasseNorm K L x).trans (principalIdele_mem_range_ideleNormMap_iff K L x)

/-- Ring class field of an order in a **quadratic** field. Its construction uses the congruence
subgroup `P_{K,ℤ}(𝔣)` of ideals prime to the conductor generated by principal ideals with a
rational generator modulo `𝔣`, whose quotient is `GlobalNumberFields.Pic O`, the group of classes
of **invertible proper** fractional ideals; raw proper ideals in the ideal class monoid do not
enter.

⚠ The hypothesis `hK : Module.finrank ℚ K = 2` is load-bearing, not decoration. The congruence
description of `Pic O` needs `O = ℤ + 𝔣𝒪_K`, which is exactly what holds for every order in a
quadratic field and fails in higher degree: in a cubic field `ℤ + f𝒪_K` has index `f²`, so orders
of index `f` are not of that form, and `Pic O` is then not a ray-class quotient of `K` cut out by
the conductor alone. This roadmap asserts no general-order ring class field and imports no
quadratic terminology into higher degrees. Cox, *Primes of the Form x² + ny²*, §7 (Prop. 7.22)
and §9 (Thm. 9.18). -/
noncomputable def ringClassField (O : GlobalNumberFields.NumberFieldOrder K)
    (hK : Module.finrank ℚ K = 2) :
    IntermediateField K (AlgebraicClosure K) :=
  sorry

/-- The ideal form of reciprocity for a ring class field. Its source is explicitly the supplier's
group of invertible proper fractional ideals, not the type of all proper fractional ideals; in the
quadratic case those are the same by
`GlobalNumberFields.NumberFieldOrder.isProper_iff_isUnit_of_finrank_eq_two`. -/
noncomputable def ringClassArtinMap (O : GlobalNumberFields.NumberFieldOrder K)
    (hK : Module.finrank ℚ K = 2) :
    O.invertibleProperFractionalIdeals →*
      (ringClassField K O hK ≃ₐ[K] ringClassField K O hK) :=
  sorry

/-- Ring-class reciprocity kills exactly the principal classes among the invertible proper
fractional ideals. -/
theorem ringClassArtinMap_eq_one_iff (O : GlobalNumberFields.NumberFieldOrder K)
    (hK : Module.finrank ℚ K = 2)
    (I : O.invertibleProperFractionalIdeals) :
    ringClassArtinMap K O hK I = 1 ↔ O.mkPic I = 1 :=
  sorry

/-- The ideal-form ring-class Artin map is surjective. -/
theorem ringClassArtinMap_surjective (O : GlobalNumberFields.NumberFieldOrder K)
    (hK : Module.finrank ℚ K = 2) :
    Function.Surjective (ringClassArtinMap K O hK) :=
  sorry

/-- Reciprocity identifies the ring class field Galois group with the imported Picard group. -/
theorem gal_ringClassField_equiv_pic (O : GlobalNumberFields.NumberFieldOrder K)
    (hK : Module.finrank ℚ K = 2) :
    Nonempty ((ringClassField K O hK ≃ₐ[K] ringClassField K O hK) ≃* GlobalNumberFields.Pic O) :=
  sorry

/-- The Hilbert class field: the class field of the trivial modulus. Defined for every number
field, in every degree; only the *ring* class field of a nonmaximal order is restricted to the
quadratic case. -/
noncomputable def hilbertClassField : IntermediateField K (AlgebraicClosure K) :=
  sorry

/-- The Galois group of the Hilbert class field is the class group. -/
theorem gal_hilbertClassField_equiv_classGroup :
    Nonempty ((hilbertClassField K ≃ₐ[K] hilbertClassField K) ≃* ClassGroup (𝓞 K)) :=
  sorry

/-- The maximal-order comparison: in a quadratic field the ring class field of the maximal order
is the Hilbert class field, so the two constructions agree where both are defined. -/
theorem ringClassField_maximal (O : GlobalNumberFields.NumberFieldOrder K)
    (hK : Module.finrank ℚ K = 2) (hO : O.conductor = ⊤) :
    ringClassField K O hK = hilbertClassField K :=
  sorry

/-- Kronecker–Weber, retained as a class-field-theory consequence. -/
theorem kroneckerWeber (E : Type) [Field E] [NumberField E]
    [IsAbelianGalois ℚ E] :
    ∃ n : ℕ, n ≠ 0 ∧ Nonempty (E →ₐ[ℚ] CyclotomicField n ℚ) :=
  sorry

/-! ## Layer 14: Hilbert reciprocity -/

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
