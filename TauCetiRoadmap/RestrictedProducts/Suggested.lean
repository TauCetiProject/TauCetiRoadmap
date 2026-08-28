import Mathlib

/-!
# Restricted products of topological groups: target signatures

**This file is not the roadmap and is not exhaustive.** `README.md` is the definitive
specification.

Everything here is generic: a family of topological groups, a family of subgroups used as
reference data, and the maps, equivalences and diagonals between the resulting restricted
products. It imports only Mathlib and introduces no group-scheme, local-field, integral-model or
measure interface. The arithmetic and measure-theoretic applications belong to the successor
roadmaps named in `README.md`, §*Future consumers* — `AlgebraicGroupStrongApproximation`,
`ArithmeticReductionTheory`, `TamagawaMeasures`, `AdelicFourierAnalysis` and
`OrthogonalTamagawaAndLatticeMass` — so that each of them has exactly one owner.

Mathlib owns the restricted product itself (`RestrictedProduct`), its topology, its algebraic
instances, `RestrictedProduct.mapAlong`/`mapAlongMonoidHom`, `mapAlong_continuous`,
`continuous_dom` and `locallyCompactSpace_of_group`. This roadmap owns the layer indexed by a
reference family on top of those: the integral subgroup, change of reference family, reindexing,
the away-`S` decomposition, and the diagonal.

Where FLT already carries a declaration that Mathlib has not yet absorbed, the signature below is
FLT's, under FLT's name inside this namespace: `restrictedProductCongrRight` with the eventual
`Set.BijOn` hypothesis, `restrictedProductCongrLeft` with `restrictedProductCongrLeft_apply_apply`,
and `isOpen_forall_mem_of_eventually_eq` / `isCompact_forall_mem_of_eventually_subset`. When that
layer of FLT reaches Mathlib these become one-line aliases rather than duplicates. `README.md`,
§*Relation to FLT*, says which is which and which statements here have no FLT counterpart.

No signature below needs `IsTopologicalGroup` on the factors: a restricted product of topological
groups is one by Mathlib's `RestrictedProduct.isTopologicalGroup`, and a consumer that needs the
group topology has that instance at its own site.
-/

namespace TauCetiRoadmap.RestrictedProducts

open Filter
open scoped RestrictedProduct

-- The topological setting is declared once for the whole file; the purely algebraic signatures
-- below do not use it, and the roadmap keeps them in the same reading order as the layers.
set_option linter.unusedSectionVars false

noncomputable section

universe u v w

variable {ι : Type u} {G : ι → Type v}
variable [Π i, Group (G i)] [Π i, TopologicalSpace (G i)]

/-! ## Layer 0: reference families and the integral subgroup -/

/-- The subgroup of `Πʳ i, [G i, U i]` cut out by a **second** family `V`: the elements lying in
`V i` at every index. A change of integral model produces exactly this shape — the new family `V`
is not the family the ambient restricted product was formed with, and is comparable to it only
eventually.

FLT states the corresponding point-set facts for a bare set `{v | ∀ i, v i ∈ V i}`; there is no
`Subgroup`-valued packaging of it upstream, because FLT's `RestrictedProduct.structureSubring` is
`Subring`-valued and needs `Ring`/`SubringClass` on the factors. -/
def integralSubgroupOf (U V : Π i, Subgroup (G i)) :
    Subgroup (Πʳ i, [G i, (U i : Set (G i))]) where
  carrier := {f | ∀ i, f.1 i ∈ V i}
  mul_mem' := by sorry
  one_mem' := by sorry
  inv_mem' := by sorry

@[simp]
theorem mem_integralSubgroupOf (U V : Π i, Subgroup (G i))
    (x : Πʳ i, [G i, (U i : Set (G i))]) :
    x ∈ integralSubgroupOf U V ↔ ∀ i, x i ∈ V i := Iff.rfl

/-- The everywhere-integral subgroup of a restricted product: the elements lying in the chosen
subgroup at **every** index, not merely at all but finitely many. It is `integralSubgroupOf` at
`V = U`. -/
def integralSubgroup (U : Π i, Subgroup (G i)) :
    Subgroup (Πʳ i, [G i, (U i : Set (G i))]) :=
  integralSubgroupOf U U

@[simp]
theorem mem_integralSubgroup (U : Π i, Subgroup (G i))
    (x : Πʳ i, [G i, (U i : Set (G i))]) :
    x ∈ integralSubgroup U ↔ ∀ i, x i ∈ U i := Iff.rfl

/-- Openness of the subgroup cut out by a family only **eventually** equal to the reference
family. This is FLT's `RestrictedProduct.isOpen_forall_mem_of_eventually_eq` at a
`Subgroup`-valued family; the hypotheses are FLT's, including openness of the reference family
`U` itself. -/
theorem isOpen_forall_mem_of_eventually_eq (U V : Π i, Subgroup (G i))
    (hU : ∀ i, IsOpen (U i : Set (G i))) (hV : ∀ i, IsOpen (V i : Set (G i)))
    (hUV : ∀ᶠ i in Filter.cofinite, U i = V i) :
    IsOpen (integralSubgroupOf U V : Set (Πʳ i, [G i, (U i : Set (G i))])) := sorry

/-- Compactness of the subgroup cut out by a family only **eventually** contained in the reference
family. This is FLT's `RestrictedProduct.isCompact_forall_mem_of_eventually_subset` at a
`Subgroup`-valued family.

⚠ Unlike `isCompact_integralSubgroup`, this needs `hU`: openness of the **reference** family. The
proof route is the open embedding of `Πʳ i, [G i, U i]_[𝓟 S]` for a cofinite `S`, which is where
that hypothesis is spent, and it is not removable by taking `V = U` in the argument — it is
removable only by the different `structureMap` argument that `isCompact_integralSubgroup` uses.
So neither statement subsumes the other and both are milestones. -/
theorem isCompact_forall_mem_of_eventually_subset (U V : Π i, Subgroup (G i))
    (hU : ∀ i, IsOpen (U i : Set (G i))) (hV : ∀ i, IsCompact (V i : Set (G i)))
    (hUV : ∀ᶠ i in Filter.cofinite, (V i : Set (G i)) ⊆ (U i : Set (G i))) :
    IsCompact (integralSubgroupOf U V : Set (Πʳ i, [G i, (U i : Set (G i))])) := sorry

theorem isOpen_integralSubgroup (U : Π i, Subgroup (G i))
    (hU : ∀ i, IsOpen (U i : Set (G i))) :
    IsOpen (integralSubgroup U : Set (Πʳ i, [G i, (U i : Set (G i))])) :=
  RestrictedProduct.isOpen_forall_mem (A := fun i => (U i : Set (G i))) hU

/-- Compactness needs only compactness of each reference subgroup: the integral subgroup is the
range of Mathlib's `structureMap`, which is an embedding with no hypothesis on the family. ⚠ In
particular this is **not** the `V = U` case of `isCompact_forall_mem_of_eventually_subset`, which
additionally assumes each `U i` open; that hypothesis is genuinely absent here. -/
theorem isCompact_integralSubgroup (U : Π i, Subgroup (G i))
    (hK : ∀ i, IsCompact (U i : Set (G i))) :
    IsCompact (integralSubgroup U : Set (Πʳ i, [G i, (U i : Set (G i))])) := sorry

/-- A family of compact open subgroups, one in each factor. It records no compatibility with an
integral model: that field cannot even be stated before a functor-of-points carrier exists, and
belongs to `AlgebraicGroupStrongApproximation`. -/
structure CompactOpenSubgroups (G : ι → Type v) [Π i, Group (G i)]
    [Π i, TopologicalSpace (G i)] where
  subgroup : Π i, Subgroup (G i)
  isOpen_subgroup : ∀ i, IsOpen (subgroup i : Set (G i))
  isCompact_subgroup : ∀ i, IsCompact (subgroup i : Set (G i))

/-! ## Layer 1: componentwise maps

⚠ The hypothesis is **eventual**, not universal. A family of coordinate homomorphisms induces a
map of restricted products as soon as it preserves the reference subgroups outside a finite set
of indices, and that is the generality arithmetic needs: after choosing an integral model one
controls the local groups only away from a finite bad set. Demanding
`Set.MapsTo (φ i) (U i) (U' i)` at every `i` would exclude those maps. -/

/-- Componentwise functoriality for restricted products, from **eventual** preservation of the
reference subgroups. Restrictedness of the image is derived, not assumed: if `x i ∈ U i` for all
but finitely many `i` and `φ i` maps `U i` into `U' i` for all but finitely many `i`, then
`φ i (x i) ∈ U' i` for all but finitely many `i`.

This is Mathlib's `RestrictedProduct.mapAlongMonoidHom` at the identity reindexing, specialized to
a `Subgroup`-valued reference family. It is named here because the consumers cite it, and it is
not to be rebuilt. -/
def restrictedProductMap {H : ι → Type v} [Π i, Group (H i)]
    [Π i, TopologicalSpace (H i)]
    (U : Π i, Subgroup (G i)) (U' : Π i, Subgroup (H i))
    (φ : ∀ i, G i →* H i)
    (hφ : ∀ᶠ i in Filter.cofinite, Set.MapsTo (φ i) (U i) (U' i)) :
    (Πʳ i, [G i, (U i : Set (G i))]) →*
      (Πʳ i, [H i, (U' i : Set (H i))]) :=
  RestrictedProduct.mapAlongMonoidHom G H id Filter.tendsto_id φ hφ

@[simp]
theorem restrictedProductMap_apply {H : ι → Type v} [Π i, Group (H i)]
    [Π i, TopologicalSpace (H i)]
    (U : Π i, Subgroup (G i)) (U' : Π i, Subgroup (H i))
    (φ : ∀ i, G i →* H i)
    (hφ : ∀ᶠ i in Filter.cofinite, Set.MapsTo (φ i) (U i) (U' i))
    (x : Πʳ i, [G i, (U i : Set (G i))]) (i : ι) :
    restrictedProductMap U U' φ hφ x i = φ i (x i) := rfl

theorem continuous_restrictedProductMap {H : ι → Type v} [Π i, Group (H i)]
    [Π i, TopologicalSpace (H i)]
    (U : Π i, Subgroup (G i)) (U' : Π i, Subgroup (H i))
    (φ : ∀ i, G i →* H i)
    (hφ : ∀ᶠ i in Filter.cofinite, Set.MapsTo (φ i) (U i) (U' i))
    (hφcont : ∀ i, Continuous (φ i)) :
    Continuous (restrictedProductMap U U' φ hφ) :=
  RestrictedProduct.mapAlong_continuous G H id Filter.tendsto_id
    (fun i => (φ i : G i → H i)) hφ hφcont

/-- The everywhere-preserving constructor, a corollary of the eventual one. It is the version
whose image lands in the integral subgroup (`mapsTo_integralSubgroup_of_forall`); the eventual
constructor does **not** have that property. -/
def restrictedProductMapOfForall {H : ι → Type v} [Π i, Group (H i)]
    [Π i, TopologicalSpace (H i)]
    (U : Π i, Subgroup (G i)) (U' : Π i, Subgroup (H i))
    (φ : ∀ i, G i →* H i) (hφ : ∀ i, Set.MapsTo (φ i) (U i) (U' i)) :
    (Πʳ i, [G i, (U i : Set (G i))]) →*
      (Πʳ i, [H i, (U' i : Set (H i))]) :=
  restrictedProductMap U U' φ (.of_forall hφ)

@[simp]
theorem restrictedProductMapOfForall_apply {H : ι → Type v} [Π i, Group (H i)]
    [Π i, TopologicalSpace (H i)]
    (U : Π i, Subgroup (G i)) (U' : Π i, Subgroup (H i))
    (φ : ∀ i, G i →* H i) (hφ : ∀ i, Set.MapsTo (φ i) (U i) (U' i))
    (x : Πʳ i, [G i, (U i : Set (G i))]) (i : ι) :
    restrictedProductMapOfForall U U' φ hφ x i = φ i (x i) := rfl

theorem restrictedProductMap_id (U : Π i, Subgroup (G i)) :
    restrictedProductMap U U (fun i => MonoidHom.id (G i))
        (.of_forall fun _ _ hx => hx) =
      MonoidHom.id (Πʳ i, [G i, (U i : Set (G i))]) := sorry

theorem restrictedProductMap_comp {H K : ι → Type v}
    [Π i, Group (H i)] [Π i, TopologicalSpace (H i)]
    [Π i, Group (K i)] [Π i, TopologicalSpace (K i)]
    (U : Π i, Subgroup (G i)) (U' : Π i, Subgroup (H i)) (U'' : Π i, Subgroup (K i))
    (φ : ∀ i, G i →* H i) (ψ : ∀ i, H i →* K i)
    (hφ : ∀ᶠ i in Filter.cofinite, Set.MapsTo (φ i) (U i) (U' i))
    (hψ : ∀ᶠ i in Filter.cofinite, Set.MapsTo (ψ i) (U' i) (U'' i)) :
    (restrictedProductMap U' U'' ψ hψ).comp (restrictedProductMap U U' φ hφ) =
      restrictedProductMap U U'' (fun i => (ψ i).comp (φ i))
        (by filter_upwards [hφ, hψ] with i h1 h2 using fun _ hx => h2 (h1 hx)) := sorry

/-- Only the everywhere-preserving constructor carries the integral subgroup into the integral
subgroup. -/
theorem mapsTo_integralSubgroup_of_forall {H : ι → Type v} [Π i, Group (H i)]
    [Π i, TopologicalSpace (H i)]
    (U : Π i, Subgroup (G i)) (U' : Π i, Subgroup (H i))
    (φ : ∀ i, G i →* H i) (hφ : ∀ i, Set.MapsTo (φ i) (U i) (U' i)) :
    (integralSubgroup U).map (restrictedProductMapOfForall U U' φ hφ) ≤
      integralSubgroup U' := sorry

/-- ⚠ Rejection test for `mapsTo_integralSubgroup_of_forall`: an eventually-preserving family need
not carry the integral subgroup into the integral subgroup, so `restrictedProductMapOfForall` is
not a redundant duplicate. Witness: `ι = ℕ`, every factor `Multiplicative ℤ`, `U i = ⊤` for all
`i`, `U' i = ⊤` for `i ≠ 0` and `U' 0 = ⊥`, and `φ i` the identity. The hypothesis holds off `{0}`,
the image of `integralSubgroup U = ⊤` is everything, and `integralSubgroup U'` is not. -/
theorem not_forall_mapsTo_integralSubgroup :
    ¬ ∀ (U U' : ℕ → Subgroup (Multiplicative ℤ))
        (φ : ∀ _ : ℕ, Multiplicative ℤ →* Multiplicative ℤ)
        (hφ : ∀ᶠ i in Filter.cofinite, Set.MapsTo (φ i) (U i) (U' i)),
        (integralSubgroup U).map (restrictedProductMap U U' φ hφ) ≤
          integralSubgroup U' := sorry

/-! ## Layer 1: change of factors at a fixed index type

This is FLT's `CongrRight` shape: a coordinatewise family of isomorphisms `φ i : G i ≃* H i` that
is a bijection `U i → U' i` for all but finitely many `i`. The change of reference family at
finitely many indices is the case `H = G`, `φ = id`, `U i = U' i` off a finite set; it keeps its
own name below, because the consumers cite it and because its coordinate formulas hold by `rfl`
only in that form. -/

/-- The equivalence of restricted products induced by a coordinatewise family of isomorphisms that
**eventually** carries the reference subgroups bijectively onto each other. This is FLT's
`MulEquiv.restrictedProductCongrRight` at the cofinite filter and a `Subgroup`-valued family; the
hypothesis is FLT's `∀ᶠ i in 𝓕, Set.BijOn (φ i) (A₁ i) (A₂ i)` verbatim.

⚠ `Set.MapsTo (φ i) (U i) (U' i)` — the hypothesis of `restrictedProductMap` — is **not** enough,
even for an isomorphism `φ i`. Witness: `ι = ℕ`, every factor `Multiplicative ℤ`, `φ` the
identity, `U i = ⊥`, `U' i = ⊤`. The `MapsTo` hypothesis holds everywhere, `φ i` is an
isomorphism, and the induced map is the inclusion of the finitely-supported elements into
`Π i, G i`, which is not surjective. What carries the inverse is that `φ i` maps `U i` **onto**
`U' i`; for an isomorphism `Set.BijOn` is equivalent to `Set.MapsTo` in both directions
(`Equiv.bijOn'`), and `BijOn` is the form FLT states.

Like FLT's, this declaration and its two coordinate formulas take **no** topology on the factors;
the topological content is the two continuity theorems below. That is FLT's file split
(`Equiv.lean` versus `TopologicalSpace.lean`) and it keeps the specialization
`restrictedProductCongr` purely algebraic. -/
def restrictedProductCongrRight {H : ι → Type v} [Π i, Group (H i)]
    (U : Π i, Subgroup (G i)) (U' : Π i, Subgroup (H i))
    (φ : ∀ i, G i ≃* H i)
    (hφ : ∀ᶠ i in Filter.cofinite,
      Set.BijOn (φ i) (U i : Set (G i)) (U' i : Set (H i))) :
    (Πʳ i, [G i, (U i : Set (G i))]) ≃*
      (Πʳ i, [H i, (U' i : Set (H i))]) where
  toFun x := ⟨fun i => φ i (x i), by
    filter_upwards [x.2, hφ] with i hx hb using hb.mapsTo hx⟩
  invFun y := ⟨fun i => (φ i).symm (y i), by
    filter_upwards [y.2, hφ] with i hy hb
    obtain ⟨a, ha, hae⟩ := hb.surjOn hy
    have hae' : (φ i) a = y i := hae
    rw [← hae']
    simpa using ha⟩
  left_inv x := by ext i; exact (φ i).symm_apply_apply (x i)
  right_inv y := by ext i; exact (φ i).apply_symm_apply (y i)
  map_mul' x y := by ext i; exact map_mul (φ i) (x i) (y i)

@[simp]
theorem restrictedProductCongrRight_apply {H : ι → Type v} [Π i, Group (H i)]
    (U : Π i, Subgroup (G i)) (U' : Π i, Subgroup (H i))
    (φ : ∀ i, G i ≃* H i)
    (hφ : ∀ᶠ i in Filter.cofinite,
      Set.BijOn (φ i) (U i : Set (G i)) (U' i : Set (H i)))
    (x : Πʳ i, [G i, (U i : Set (G i))]) (i : ι) :
    restrictedProductCongrRight U U' φ hφ x i = φ i (x i) := rfl

@[simp]
theorem restrictedProductCongrRight_symm_apply {H : ι → Type v} [Π i, Group (H i)]
    (U : Π i, Subgroup (G i)) (U' : Π i, Subgroup (H i))
    (φ : ∀ i, G i ≃* H i)
    (hφ : ∀ᶠ i in Filter.cofinite,
      Set.BijOn (φ i) (U i : Set (G i)) (U' i : Set (H i)))
    (y : Πʳ i, [H i, (U' i : Set (H i))]) (i : ι) :
    (restrictedProductCongrRight U U' φ hφ).symm y i = (φ i).symm (y i) := rfl

/-- Continuity of `restrictedProductCongrRight`. Together with the next theorem this is the
content of FLT's bundled `ContinuousMulEquiv.restrictedProductCongrRight`; the roadmap states the
two directions separately because that is how every other equivalence here is pinned. -/
theorem continuous_restrictedProductCongrRight {H : ι → Type v} [Π i, Group (H i)]
    [Π i, TopologicalSpace (H i)]
    (U : Π i, Subgroup (G i)) (U' : Π i, Subgroup (H i))
    (φ : ∀ i, G i ≃* H i)
    (hφ : ∀ᶠ i in Filter.cofinite,
      Set.BijOn (φ i) (U i : Set (G i)) (U' i : Set (H i)))
    (hcont : ∀ i, Continuous (φ i)) :
    Continuous (restrictedProductCongrRight U U' φ hφ) :=
  RestrictedProduct.mapAlong_continuous G H id Filter.tendsto_id
    (fun i => (φ i : G i → H i)) (hφ.mono fun _ hb => hb.mapsTo) hcont

theorem continuous_restrictedProductCongrRight_symm {H : ι → Type v} [Π i, Group (H i)]
    [Π i, TopologicalSpace (H i)]
    (U : Π i, Subgroup (G i)) (U' : Π i, Subgroup (H i))
    (φ : ∀ i, G i ≃* H i)
    (hφ : ∀ᶠ i in Filter.cofinite,
      Set.BijOn (φ i) (U i : Set (G i)) (U' i : Set (H i)))
    (hcont : ∀ i, Continuous (φ i).symm) :
    Continuous (restrictedProductCongrRight U U' φ hφ).symm :=
  RestrictedProduct.mapAlong_continuous H G id Filter.tendsto_id
    (fun i => ((φ i).symm : H i → G i))
    (hφ.mono fun _ hb => by
      intro z hz
      obtain ⟨a, ha, hae⟩ := hb.surjOn hz
      rw [← hae]
      simpa using ha) hcont

/-! ### Change of reference family at finitely many indices

The specialization of `restrictedProductCongrRight` to `H = G` and `φ = id`. It is the form the
consumers cite, and the form in which the coordinate formulas are `rfl`. -/

/-- The canonical equivalence for two reference families that agree outside a finite set. It is
coordinatewise the identity; that formula, not the bare existence of an equivalence, is the
milestone.

⚠ FLT's root-namespace `MulEquiv.restrictedProductCongr` denotes something **else** — reindexing
and change of factors in one step. A port must map this declaration onto
`MulEquiv.restrictedProductCongrRight`, not onto the similarly spelt `restrictedProductCongr`. -/
def restrictedProductCongr (U U' : Π i, Subgroup (G i))
    (h : ∀ᶠ i in Filter.cofinite, U i = U' i) :
    (Πʳ i, [G i, (U i : Set (G i))]) ≃*
      (Πʳ i, [G i, (U' i : Set (G i))]) :=
  restrictedProductCongrRight U U' (fun i => MulEquiv.refl (G i)) <| by
    filter_upwards [h] with i hi
    simp only [MulEquiv.coe_refl, hi]
    exact Set.bijOn_id _

@[simp]
theorem restrictedProductCongr_apply (U U' : Π i, Subgroup (G i))
    (h : ∀ᶠ i in Filter.cofinite, U i = U' i)
    (x : Πʳ i, [G i, (U i : Set (G i))]) (i : ι) :
    restrictedProductCongr U U' h x i = x i := rfl

@[simp]
theorem restrictedProductCongr_symm_apply (U U' : Π i, Subgroup (G i))
    (h : ∀ᶠ i in Filter.cofinite, U i = U' i)
    (y : Πʳ i, [G i, (U' i : Set (G i))]) (i : ι) :
    (restrictedProductCongr U U' h).symm y i = y i := rfl

theorem continuous_restrictedProductCongr (U U' : Π i, Subgroup (G i))
    (h : ∀ᶠ i in Filter.cofinite, U i = U' i) :
    Continuous (restrictedProductCongr U U' h) :=
  continuous_restrictedProductCongrRight U U' (fun i => MulEquiv.refl (G i)) _
    fun _ => continuous_id

theorem continuous_restrictedProductCongr_symm (U U' : Π i, Subgroup (G i))
    (h : ∀ᶠ i in Filter.cofinite, U i = U' i) :
    Continuous (restrictedProductCongr U U' h).symm :=
  continuous_restrictedProductCongrRight_symm U U' (fun i => MulEquiv.refl (G i)) _
    fun _ => continuous_id

theorem restrictedProductCongr_refl (U : Π i, Subgroup (G i)) :
    restrictedProductCongr U U (Filter.Eventually.of_forall fun _ => rfl) =
      MulEquiv.refl (Πʳ i, [G i, (U i : Set (G i))]) := rfl

theorem restrictedProductCongr_symm (U U' : Π i, Subgroup (G i))
    (h : ∀ᶠ i in Filter.cofinite, U i = U' i) :
    (restrictedProductCongr U U' h).symm =
      restrictedProductCongr U' U (h.mono fun _ hi => hi.symm) := rfl

theorem restrictedProductCongr_trans (U U' U'' : Π i, Subgroup (G i))
    (h : ∀ᶠ i in Filter.cofinite, U i = U' i)
    (h' : ∀ᶠ i in Filter.cofinite, U' i = U'' i) :
    (restrictedProductCongr U U' h).trans (restrictedProductCongr U' U'' h') =
      restrictedProductCongr U U'' (by
        filter_upwards [h, h'] with i hi hi'
        exact hi.trans hi') := rfl

/-- Naturality of the change-of-family equivalence in a componentwise map: the two routes from one
restricted product to another agree. -/
theorem restrictedProductCongr_naturality {H : ι → Type v} [Π i, Group (H i)]
    [Π i, TopologicalSpace (H i)]
    (U U' : Π i, Subgroup (G i)) (V V' : Π i, Subgroup (H i))
    (φ : ∀ i, G i →* H i)
    (hφ : ∀ᶠ i in Filter.cofinite, Set.MapsTo (φ i) (U i) (V i))
    (hφ' : ∀ᶠ i in Filter.cofinite, Set.MapsTo (φ i) (U' i) (V' i))
    (h : ∀ᶠ i in Filter.cofinite, U i = U' i)
    (h' : ∀ᶠ i in Filter.cofinite, V i = V' i) :
    (restrictedProductCongr V V' h').toMonoidHom.comp (restrictedProductMap U V φ hφ) =
      (restrictedProductMap U' V' φ hφ').comp
        (restrictedProductCongr U U' h).toMonoidHom := sorry

/-! ### ⚠ Change of family does not transport double cosets by itself

`restrictedProductCongr` is an isomorphism of the **ambient** restricted products and nothing
more. A double-coset space `Γ \ X / K` also depends on `K`, and the equivalence does not carry
`integralSubgroup U` to `integralSubgroup U'`: at the finitely many indices where the two families
differ the coordinate condition changes. A bijection of double-coset spaces therefore exists only
once the compact opens are transported along the same equivalence, which is what
`doubleCosetCongr` records and `exists_map_integralSubgroup_ne` shows cannot be avoided. -/

/-- Transport of a double-coset space along a change of reference family. The subgroups on the
right are the **images** of those on the left, not the integral subgroups of the new family. -/
def doubleCosetCongr (U U' : Π i, Subgroup (G i))
    (h : ∀ᶠ i in Filter.cofinite, U i = U' i)
    (Γ K : Subgroup (Πʳ i, [G i, (U i : Set (G i))])) :
    DoubleCoset.Quotient (Γ : Set (Πʳ i, [G i, (U i : Set (G i))]))
        (K : Set (Πʳ i, [G i, (U i : Set (G i))])) ≃
      DoubleCoset.Quotient
        ((Γ.map (restrictedProductCongr U U' h).toMonoidHom :
            Subgroup (Πʳ i, [G i, (U' i : Set (G i))])) :
          Set (Πʳ i, [G i, (U' i : Set (G i))]))
        ((K.map (restrictedProductCongr U U' h).toMonoidHom :
            Subgroup (Πʳ i, [G i, (U' i : Set (G i))])) :
          Set (Πʳ i, [G i, (U' i : Set (G i))])) := sorry

/-- ⚠ Why `doubleCosetCongr` cannot be stated with `integralSubgroup U'` on the right: the
transported integral subgroup is generally a different subgroup. Witness: `ι = ℕ`, every factor
`Multiplicative ℤ`, `U i = ⊤` for all `i`, `U' i = ⊤` for `i ≠ 0` and `U' 0 = ⊥`. The families
agree off `{0}`, the image of `integralSubgroup U` is the whole group, and `integralSubgroup U'`
is not. -/
theorem exists_map_integralSubgroup_ne :
    ∃ (U U' : ℕ → Subgroup (Multiplicative ℤ)) (h : ∀ᶠ i in Filter.cofinite, U i = U' i),
      (integralSubgroup U).map (restrictedProductCongr U U' h).toMonoidHom ≠
        integralSubgroup U' := sorry

/-! ## Layer 1: reindexing along an equivalence of index types

FLT's `CongrLeft` shape. FLT's hypothesis is `h : 𝓕₁ = 𝓕₂.comap e` for general filters; here both
filters are `Filter.cofinite`, and the hypothesis is not assumed but **discharged** by Mathlib's
`Function.Injective.comap_cofinite_eq`, which gives
`Filter.comap e Filter.cofinite = Filter.cofinite` for any injective `e`. That is why this roadmap
takes no filter argument: `e.injective.comap_cofinite_eq.symm` proves FLT's `h` outright here, and
restating it as a local lemma would duplicate Mathlib. -/

/-- Reindexing along an equivalence of index types, in FLT's `CongrLeft` orientation: from the
restricted product over `ι'` at the pulled-back family to the restricted product over `ι`. This is
`MulEquiv.restrictedProductCongrLeft e (e.injective.comap_cofinite_eq.symm)`. -/
def restrictedProductCongrLeft {ι' : Type*} (e : ι' ≃ ι) (U : Π i, Subgroup (G i)) :
    (Πʳ j : ι', [G (e j), (U (e j) : Set (G (e j)))]) ≃*
      (Πʳ i, [G i, (U i : Set (G i))]) := sorry

/-- FLT's `restrictedProductCongrLeft_apply_apply`, verbatim in this setting: the value at `e j` is
the value at `j`. This pins the map, `e` being surjective. -/
@[simp]
theorem restrictedProductCongrLeft_apply_apply {ι' : Type*} (e : ι' ≃ ι)
    (U : Π i, Subgroup (G i))
    (x : Πʳ j : ι', [G (e j), (U (e j) : Set (G (e j)))]) (j : ι') :
    restrictedProductCongrLeft e U x (e j) = x j := sorry

/-- The inverse of `restrictedProductCongrLeft`, pinned coordinatewise. -/
@[simp]
theorem restrictedProductCongrLeft_symm_apply {ι' : Type*} (e : ι' ≃ ι)
    (U : Π i, Subgroup (G i))
    (y : Πʳ i, [G i, (U i : Set (G i))]) (j : ι') :
    (restrictedProductCongrLeft e U).symm y j = y (e j) := sorry

/-- Reindexing a restricted product along an equivalence of index types, in the orientation the
consumers use. It is `restrictedProductCongrLeft` run backwards, and carries no content beyond it;
both coordinate formulas below are the two FLT equations above. -/
def restrictedProductReindex {ι' : Type*} (e : ι' ≃ ι) (U : Π i, Subgroup (G i)) :
    (Πʳ i, [G i, (U i : Set (G i))]) ≃*
      (Πʳ j : ι', [G (e j), (U (e j) : Set (G (e j)))]) :=
  (restrictedProductCongrLeft e U).symm

@[simp]
theorem restrictedProductReindex_apply {ι' : Type*} (e : ι' ≃ ι) (U : Π i, Subgroup (G i))
    (x : Πʳ i, [G i, (U i : Set (G i))]) (j : ι') :
    restrictedProductReindex e U x j = x (e j) :=
  restrictedProductCongrLeft_symm_apply e U x j

/-- The inverse, characterised on the image of `e`; that determines it, `e` being surjective. -/
theorem restrictedProductReindex_symm_apply {ι' : Type*} (e : ι' ≃ ι)
    (U : Π i, Subgroup (G i))
    (y : Πʳ j : ι', [G (e j), (U (e j) : Set (G (e j)))]) (j : ι') :
    (restrictedProductReindex e U).symm y (e j) = y j :=
  restrictedProductCongrLeft_apply_apply e U y j

theorem continuous_restrictedProductReindex {ι' : Type*} (e : ι' ≃ ι)
    (U : Π i, Subgroup (G i)) :
    Continuous (restrictedProductReindex e U) := sorry

theorem continuous_restrictedProductReindex_symm {ι' : Type*} (e : ι' ≃ ι)
    (U : Π i, Subgroup (G i)) :
    Continuous (restrictedProductReindex e U).symm := sorry

/-! ## Layer 2: packaging -/

/-- The restricted product of the family `G` relative to the reference subgroups `U`. Arithmetic
consumers alias this as their finite adelic point group. -/
abbrev RestrictedProductGroup (U : Π i, Subgroup (G i)) :=
  Πʳ i, [G i, (U i : Set (G i))]

/-- The restricted product over the indices **outside** `S`. This is `RestrictedProductGroup` at
the index type `{i // i ∉ S}`; no finiteness of `S` is needed to form it, and none is assumed.
Which indices a number-field consumer must put into `S` — in particular that `S` contains every
archimedean place — is a theorem of that consumer, not of this index-generic abbreviation. -/
abbrev RestrictedProductGroupAway (S : Set ι) (U : Π i, Subgroup (G i)) :=
  Πʳ i : {i // i ∉ S}, [G i.1, (U i.1 : Set (G i.1))]

/-- A restricted product together with a distinguished factor carrying **no** integrality
condition. Arithmetic consumers instantiate `H` with the product of the archimedean local groups
and alias the result as their full adelic point group. -/
abbrev RestrictedProductGroupWithFactor (H : Type w) (U : Π i, Subgroup (G i)) :=
  H × RestrictedProductGroup U

/-! ## Layer 2: away-`S` restriction and decomposition -/

/-- Restriction of a restricted product to the indices outside `S`: Mathlib's
`RestrictedProduct.mapAlongMonoidHom` along `Subtype.val`, which tends to `cofinite` because that
map is injective. -/
def restrictAway (S : Set ι) (U : Π i, Subgroup (G i)) :
    RestrictedProductGroup U →* RestrictedProductGroupAway S U :=
  RestrictedProduct.mapAlongMonoidHom G (fun i : {i // i ∉ S} => G i.1) Subtype.val
    Subtype.val_injective.tendsto_cofinite (fun i => MonoidHom.id (G i.1))
    (.of_forall fun _ _ hx => hx)

@[simp]
theorem restrictAway_apply (S : Set ι) (U : Π i, Subgroup (G i))
    (x : RestrictedProductGroup U) (i : {i // i ∉ S}) :
    restrictAway S U x i = x i.1 := rfl

/-- Nested index sets: restricting away from the larger set factors through the smaller one. -/
theorem restrictAway_restrictAway (S T : Set ι) (hST : S ⊆ T) (U : Π i, Subgroup (G i))
    (x : RestrictedProductGroup U) (i : {i // i ∉ T}) :
    restrictAway T U x i = restrictAway S U x ⟨i.1, fun hi => i.2 (hST hi)⟩ := rfl

/-! ### The restricted product over a `Sum` index type

⚠ **Owned here, not ported.** FLT has nothing of this shape. Its `principalEquivProd` and
`Homeomorph.restrictedProductPrincipal` split a restricted product over a **principal** filter as
`Πʳ i, [R i, A i]_[𝓟 J] ≃ₜ (Π i : J, A i) × (Π i : Jᶜ, R i)` — two plain products, with no
restricted product left and with the integrality condition landing on `J` rather than on its
complement — and `flattenEquiv` splits along the fibres of a map of index types, a different
factorization again. The two statements below are over the **cofinite** filter and are what turns
`awayDecomposition` into a composition of named steps. -/

/-- A restricted product over a `Sum` index type is the product of the two restricted products
over the summands.

A subset of `ι₁ ⊕ ι₂` is finite exactly when both of its preimages are
(`Set.finite_preimage_inl_and_inr`); that is the whole content.

⚠ The summand filters are **not** `Filter.cofinite` by fiat. The statement that generalizes is the
one with `Filter.comap Sum.inl 𝓕` and `Filter.comap Sum.inr 𝓕` on the right for an arbitrary `𝓕`;
it degenerates for filters that ignore a summand — at `𝓕 = 𝓟 (Set.range Sum.inl)` the right-hand
filter is `⊥` and that factor is the *unrestricted* product. Cofinite is the case where both
comaps are cofinite again, by `Function.Injective.comap_cofinite_eq`. Only the cofinite case is
stated here, because that is the only filter this roadmap uses; an implementer sending this
upstream should state the comap form. -/
def restrictedProductSum {ι₁ ι₂ : Type*} (G' : ι₁ ⊕ ι₂ → Type*)
    [Π k, Group (G' k)] (U : Π k, Subgroup (G' k)) :
    (Πʳ k, [G' k, (U k : Set (G' k))]) ≃*
      (Πʳ i : ι₁, [G' (Sum.inl i), (U (Sum.inl i) : Set (G' (Sum.inl i)))]) ×
        (Πʳ j : ι₂, [G' (Sum.inr j), (U (Sum.inr j) : Set (G' (Sum.inr j)))]) where
  toFun x :=
    (⟨fun i => x (Sum.inl i), Sum.inl_injective.tendsto_cofinite.eventually x.2⟩,
      ⟨fun j => x (Sum.inr j), Sum.inr_injective.tendsto_cofinite.eventually x.2⟩)
  invFun y := ⟨Sum.rec (motive := fun k => G' k) (fun i => y.1 i) (fun j => y.2 j), by
    rw [Filter.eventually_cofinite, ← Set.finite_preimage_inl_and_inr]
    exact ⟨Filter.eventually_cofinite.1 y.1.2, Filter.eventually_cofinite.1 y.2.2⟩⟩
  left_inv x := by ext k; cases k <;> rfl
  right_inv y := by ext <;> rfl
  map_mul' _ _ := by ext <;> rfl

@[simp]
theorem restrictedProductSum_apply_inl {ι₁ ι₂ : Type*} (G' : ι₁ ⊕ ι₂ → Type*)
    [Π k, Group (G' k)] (U : Π k, Subgroup (G' k))
    (x : Πʳ k, [G' k, (U k : Set (G' k))]) (i : ι₁) :
    (restrictedProductSum G' U x).1 i = x (Sum.inl i) := rfl

@[simp]
theorem restrictedProductSum_apply_inr {ι₁ ι₂ : Type*} (G' : ι₁ ⊕ ι₂ → Type*)
    [Π k, Group (G' k)] (U : Π k, Subgroup (G' k))
    (x : Πʳ k, [G' k, (U k : Set (G' k))]) (j : ι₂) :
    (restrictedProductSum G' U x).2 j = x (Sum.inr j) := rfl

@[simp]
theorem restrictedProductSum_symm_apply_inl {ι₁ ι₂ : Type*} (G' : ι₁ ⊕ ι₂ → Type*)
    [Π k, Group (G' k)] (U : Π k, Subgroup (G' k))
    (y : (Πʳ i : ι₁, [G' (Sum.inl i), (U (Sum.inl i) : Set (G' (Sum.inl i)))]) ×
      (Πʳ j : ι₂, [G' (Sum.inr j), (U (Sum.inr j) : Set (G' (Sum.inr j)))])) (i : ι₁) :
    (restrictedProductSum G' U).symm y (Sum.inl i) = y.1 i := rfl

@[simp]
theorem restrictedProductSum_symm_apply_inr {ι₁ ι₂ : Type*} (G' : ι₁ ⊕ ι₂ → Type*)
    [Π k, Group (G' k)] (U : Π k, Subgroup (G' k))
    (y : (Πʳ i : ι₁, [G' (Sum.inl i), (U (Sum.inl i) : Set (G' (Sum.inl i)))]) ×
      (Πʳ j : ι₂, [G' (Sum.inr j), (U (Sum.inr j) : Set (G' (Sum.inr j)))])) (j : ι₂) :
    (restrictedProductSum G' U).symm y (Sum.inr j) = y.2 j := rfl

theorem continuous_restrictedProductSum {ι₁ ι₂ : Type*} (G' : ι₁ ⊕ ι₂ → Type*)
    [Π k, Group (G' k)] [Π k, TopologicalSpace (G' k)] (U : Π k, Subgroup (G' k)) :
    Continuous (restrictedProductSum G' U) := sorry

theorem continuous_restrictedProductSum_symm {ι₁ ι₂ : Type*} (G' : ι₁ ⊕ ι₂ → Type*)
    [Π k, Group (G' k)] [Π k, TopologicalSpace (G' k)] (U : Π k, Subgroup (G' k)) :
    Continuous (restrictedProductSum G' U).symm := sorry

/-- Over a **finite** index type the restricted product is the plain product: the cofinite filter
is `⊥` and the integrality condition is vacuous. ⚠ Mathlib's `RestrictedProduct.homeoTop` is the
`⊤`-filter statement and gives `Π i, U i`, the everywhere-integral product; this is the opposite
end of the filter lattice and gives `Π i, G i`. Neither Mathlib nor FLT has this one. -/
def restrictedProductOfFinite {ι' : Type*} [Finite ι'] (G' : ι' → Type*)
    [Π i, Group (G' i)] (U : Π i, Subgroup (G' i)) :
    (Πʳ i, [G' i, (U i : Set (G' i))]) ≃* (Π i, G' i) where
  toFun x i := x i
  invFun x := ⟨x, by simp [Filter.cofinite_eq_bot]⟩
  left_inv _ := rfl
  right_inv _ := rfl
  map_mul' _ _ := rfl

@[simp]
theorem restrictedProductOfFinite_apply {ι' : Type*} [Finite ι'] (G' : ι' → Type*)
    [Π i, Group (G' i)] (U : Π i, Subgroup (G' i))
    (x : Πʳ i, [G' i, (U i : Set (G' i))]) (i : ι') :
    restrictedProductOfFinite G' U x i = x i := rfl

@[simp]
theorem restrictedProductOfFinite_symm_apply {ι' : Type*} [Finite ι'] (G' : ι' → Type*)
    [Π i, Group (G' i)] (U : Π i, Subgroup (G' i))
    (x : Π i, G' i) (i : ι') :
    (restrictedProductOfFinite G' U).symm x i = x i := rfl

theorem continuous_restrictedProductOfFinite {ι' : Type*} [Finite ι'] (G' : ι' → Type*)
    [Π i, Group (G' i)] [Π i, TopologicalSpace (G' i)] (U : Π i, Subgroup (G' i)) :
    Continuous (restrictedProductOfFinite G' U) := sorry

theorem continuous_restrictedProductOfFinite_symm {ι' : Type*} [Finite ι'] (G' : ι' → Type*)
    [Π i, Group (G' i)] [Π i, TopologicalSpace (G' i)] (U : Π i, Subgroup (G' i)) :
    Continuous (restrictedProductOfFinite G' U).symm := sorry

/-- **The away-`S` decomposition.** For a *finite* `S`, a restricted product is the plain product
over `S` times the restricted product away from `S`; that is, it is a
`RestrictedProductGroupWithFactor` whose distinguished factor is `Π i : S, G i`. The map and its
inverse are pinned coordinatewise by the four lemmas below: "canonically equivalent" is not enough
for the double-coset and measure calculations downstream.

It is not built from scratch: it is `restrictedProductReindex` along `Equiv.sumCompl (· ∈ S)`
(FLT's `CongrLeft`, run backwards), then `restrictedProductSum`, then `restrictedProductOfFinite`
on the `S` factor. Only the middle step is new relative to FLT. -/
def awayDecomposition (S : Set ι) (hS : S.Finite) (U : Π i, Subgroup (G i)) :
    RestrictedProductGroup U ≃*
      RestrictedProductGroupWithFactor (Π i : S, G i.1)
        (fun i : {i // i ∉ S} => U i.1) :=
  letI : DecidablePred (· ∈ S) := Classical.decPred _
  haveI : Finite S := hS.to_subtype
  ((restrictedProductReindex (Equiv.sumCompl (· ∈ S)) U).trans
      (restrictedProductSum (fun k => G (Equiv.sumCompl (· ∈ S) k))
        (fun k => U (Equiv.sumCompl (· ∈ S) k)))).trans
    (MulEquiv.prodCongr
      (restrictedProductOfFinite (fun i : S => G i.1) (fun i : S => U i.1))
      (MulEquiv.refl _))

@[simp]
theorem awayDecomposition_fst (S : Set ι) (hS : S.Finite) (U : Π i, Subgroup (G i))
    (x : RestrictedProductGroup U) (i : S) :
    (awayDecomposition S hS U x).1 i = x i.1 := sorry

@[simp]
theorem awayDecomposition_snd (S : Set ι) (hS : S.Finite) (U : Π i, Subgroup (G i))
    (x : RestrictedProductGroup U) :
    (awayDecomposition S hS U x).2 = restrictAway S U x := sorry

theorem awayDecomposition_symm_apply_of_mem (S : Set ι) (hS : S.Finite)
    (U : Π i, Subgroup (G i))
    (y : RestrictedProductGroupWithFactor (Π i : S, G i.1) (fun i : {i // i ∉ S} => U i.1))
    (i : ι) (hi : i ∈ S) :
    (awayDecomposition S hS U).symm y i = y.1 ⟨i, hi⟩ := sorry

theorem awayDecomposition_symm_apply_of_notMem (S : Set ι) (hS : S.Finite)
    (U : Π i, Subgroup (G i))
    (y : RestrictedProductGroupWithFactor (Π i : S, G i.1) (fun i : {i // i ∉ S} => U i.1))
    (i : ι) (hi : i ∉ S) :
    (awayDecomposition S hS U).symm y i = y.2 ⟨i, hi⟩ := sorry

theorem continuous_awayDecomposition (S : Set ι) (hS : S.Finite) (U : Π i, Subgroup (G i)) :
    Continuous (awayDecomposition S hS U) := sorry

theorem continuous_awayDecomposition_symm (S : Set ι) (hS : S.Finite)
    (U : Π i, Subgroup (G i)) :
    Continuous (awayDecomposition S hS U).symm := sorry

/-! ## Layer 3: the rational diagonal -/

/-- The diagonal homomorphism into a restricted product, from coordinate homomorphisms whose
values are eventually integral. ⚠ The eventual-integrality evidence is an **argument**: this
roadmap never manufactures it, since doing so is an arithmetic theorem about the consumer's
groups. -/
def rationalDiagonal {Γ : Type w} [Group Γ] (φ : ∀ i, Γ →* G i)
    (U : Π i, Subgroup (G i))
    (h : ∀ γ : Γ, ∀ᶠ i in Filter.cofinite, φ i γ ∈ U i) :
    Γ →* RestrictedProductGroup U where
  toFun γ := ⟨fun i => φ i γ, h γ⟩
  map_one' := by ext i; exact map_one (φ i)
  map_mul' a b := by ext i; exact map_mul (φ i) a b

@[simp]
theorem rationalDiagonal_apply {Γ : Type w} [Group Γ] (φ : ∀ i, Γ →* G i)
    (U : Π i, Subgroup (G i))
    (h : ∀ γ : Γ, ∀ᶠ i in Filter.cofinite, φ i γ ∈ U i)
    (γ : Γ) (i : ι) :
    rationalDiagonal φ U h γ i = φ i γ := rfl

theorem rationalDiagonal_change_family {Γ : Type w} [Group Γ]
    (φ : ∀ i, Γ →* G i) (U U' : Π i, Subgroup (G i))
    (hU : ∀ γ : Γ, ∀ᶠ i in Filter.cofinite, φ i γ ∈ U i)
    (hU' : ∀ γ : Γ, ∀ᶠ i in Filter.cofinite, φ i γ ∈ U' i)
    (h : ∀ᶠ i in Filter.cofinite, U i = U' i) :
    (restrictedProductCongr U U' h).toMonoidHom.comp (rationalDiagonal φ U hU) =
      rationalDiagonal φ U' hU' := sorry

/-- Compatibility of the diagonal with a componentwise map. -/
theorem restrictedProductMap_comp_rationalDiagonal {Γ : Type w} [Group Γ]
    {H : ι → Type v} [Π i, Group (H i)] [Π i, TopologicalSpace (H i)]
    (φ : ∀ i, Γ →* G i) (ψ : ∀ i, G i →* H i)
    (U : Π i, Subgroup (G i)) (V : Π i, Subgroup (H i))
    (hU : ∀ γ : Γ, ∀ᶠ i in Filter.cofinite, φ i γ ∈ U i)
    (hV : ∀ γ : Γ, ∀ᶠ i in Filter.cofinite, (ψ i) (φ i γ) ∈ V i)
    (hψ : ∀ᶠ i in Filter.cofinite, Set.MapsTo (ψ i) (U i) (V i)) :
    (restrictedProductMap U V ψ hψ).comp (rationalDiagonal φ U hU) =
      rationalDiagonal (fun i => (ψ i).comp (φ i)) V hV := sorry

/-- Injectivity of the diagonal needs a coordinate-separation hypothesis; it does not follow from
the construction. -/
theorem injective_rationalDiagonal {Γ : Type w} [Group Γ] (φ : ∀ i, Γ →* G i)
    (U : Π i, Subgroup (G i))
    (h : ∀ γ : Γ, ∀ᶠ i in Filter.cofinite, φ i γ ∈ U i)
    (hsep : ∃ i, Function.Injective (φ i)) :
    Function.Injective (rationalDiagonal φ U h) := sorry

/-! ## Continuity criteria

⚠ The restricted-product topology is finer than the topology induced from `Π i, G i`, and in
general strictly finer, so coordinatewise continuity of a map **into** one is not enough. Mathlib's
`RestrictedProduct.continuous_rng_of_principal` is the usable criterion: such a map is continuous
once it factors continuously through `Πʳ i, [G i, U i]_[𝓟 S]` for a cofinite `S`. For the diagonal
that means a *uniform* integrality set — one cofinite `S` serving every `γ` at once, strictly
stronger than the pointwise `∀ γ, ∀ᶠ i, φ i γ ∈ U i` that builds the map.

Continuity **out of** a restricted product is Mathlib's `RestrictedProduct.continuous_dom`, and
local compactness is Mathlib's `RestrictedProduct.locallyCompactSpace_of_group`. Neither is
restated here. -/

theorem continuous_rationalDiagonal {Γ : Type w} [Group Γ] [TopologicalSpace Γ]
    (φ : ∀ i, Γ →* G i) (U : Π i, Subgroup (G i))
    (h : ∀ γ : Γ, ∀ᶠ i in Filter.cofinite, φ i γ ∈ U i)
    (hcont : ∀ i, Continuous (φ i))
    (S : Set ι) (hS : S ∈ Filter.cofinite) (huniform : ∀ γ : Γ, ∀ i ∈ S, φ i γ ∈ U i) :
    Continuous (rationalDiagonal φ U h) := sorry

end

end TauCetiRoadmap.RestrictedProducts
