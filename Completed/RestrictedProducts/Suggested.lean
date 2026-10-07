import Mathlib
import TauCeti.Topology.Algebra.RestrictedProduct.Away.Basic
import TauCeti.Topology.Algebra.RestrictedProduct.Away.Decomposition
import TauCeti.Topology.Algebra.RestrictedProduct.Basic
import TauCeti.Topology.Algebra.RestrictedProduct.Congr.Basic
import TauCeti.Topology.Algebra.RestrictedProduct.Congr.DoubleCoset
import TauCeti.Topology.Algebra.RestrictedProduct.Congr.Left
import TauCeti.Topology.Algebra.RestrictedProduct.Congr.Right
import TauCeti.Topology.Algebra.RestrictedProduct.Diagonal
import TauCeti.Topology.Algebra.RestrictedProduct.Finite
import TauCeti.Topology.Algebra.RestrictedProduct.Map
import TauCeti.Topology.Algebra.RestrictedProduct.NotContinuousMul
import TauCeti.Topology.Algebra.RestrictedProduct.Sum
import TauCeti.Topology.Algebra.RestrictedProduct.TopologicalSpace

/-!
# Restricted products of topological groups and rational diagonals: target signatures

**This file is not the roadmap and is not exhaustive.** The definitive document is `README.md`.
The statements here suggest Lean forms for the milestones, so that contributors and reviewers
converge on names and signatures; discharging all of them finishes neither a layer nor the roadmap.

Every milestone of `README.md` has a statement here, in the form the roadmap asks for, closed by
the Tau Ceti declaration in `TauCeti/Topology/Algebra/RestrictedProduct/` that realizes it, so the
correspondence is checked by the Lean kernel rather than asserted in prose: every name of the
export contract, the map, inverse and both coordinate formulas of each of the three equivalences
and of the two steps they are assembled from, and the worked examples and rejection tests 1–11.
Every statement is closed. That is evidence for completion, not its criterion: completion is
judged by a milestone-by-milestone audit against `README.md`, which a fully discharged file of
suggested forms cannot replace.

The earlier version of this file proposed its own definitions and left thirty proof obligations
open. Those definitions now live in Tau Ceti under the same names in the `TauCeti` namespace, so
the statements below are made about the Tau Ceti objects. The definitions are re-exported into
this namespace, because `IntegralLattices` and `OrthogonalSpinGroups` cite them from here. The
following differences from the README's forms are deliberate.

* `restrictedProductReindex U e` and `restrictedProductCongrLeft U e` take the reference family
  before the equivalence; §*The three equivalences* writes `restrictedProductReindex e U`.
* `restrictedProductSum U h₁ h₂` is stated for every filter `𝓕` on `ι₁ ⊕ ι₂`, with the factor
  family implicit and the summand filters given by the equations `𝓕.comap Sum.inl = 𝓕₁` and
  `𝓕.comap Sum.inr = 𝓕₂`. This is the comap form rejection test 10 asks for; at the cofinite
  filter the equations are `Sum.inl_injective.comap_cofinite_eq` and
  `Sum.inr_injective.comap_cofinite_eq`.
* `CompactOpenSubgroups.subgroup` is `OpenSubgroup`-valued, so openness is carried by the type
  rather than by a separate field.
* `isOpen_forall_mem_of_eventually_eq` and `isCompact_forall_mem_of_eventually_subset` do not
  assume the reference family open, a hypothesis Layer 0.1 takes from FLT. So
  `isCompact_integralSubgroup` is proved as the `V = U` case of the second, and caution 2 of
  §*Relation to FLT* does not arise; both theorems are stated here, as the README asks.
* The roadmap's `awayDecomposition_snd`, that the second component is `restrictAway S U x`, is
  Tau Ceti's `awayDecomposition_snd_eq_restrictAway`; Tau Ceti's `awayDecomposition_snd` is the
  pointwise form.
* `restrictedProductCongr_naturality` and `restrictedProductMap_comp_rationalDiagonal` derive the
  second `Set.MapsTo` hypothesis and the composed integrality evidence rather than taking them as
  arguments, and `rationalDiagonal` needs only `MulOneClass Γ`.

Left out: the constructors of `CompactOpenSubgroups` from an integral model, which Layer 0.2
assigns to `AlgebraicGroupStrongApproximation`; the topics of §*Future consumers*, which the
README says are not milestones; and the aliasing onto FLT's names of §*Relation to FLT*, which
applies once FLT's second restricted-product layer reaches Mathlib. It has not: Mathlib's
`Topology/Algebra/RestrictedProduct/` still has only `Basic`, `TopologicalSpace` and `Units`.
-/

namespace TauCetiRoadmap.RestrictedProducts

open Filter
open scoped RestrictedProduct

/- The definitions of the export contract are the Tau Ceti ones, under the README's names. -/
export TauCeti (integralSubgroupOf integralSubgroup CompactOpenSubgroups restrictedProductMap
  restrictedProductMapOfForall restrictedProductCongrRight restrictedProductCongr doubleCosetCongr
  restrictedProductCongrLeft restrictedProductReindex RestrictedProductGroup
  RestrictedProductGroupAway RestrictedProductGroupWithFactor restrictAway restrictedProductSum
  restrictedProductOfFinite awayDecomposition rationalDiagonal)

universe u v w z

variable {ι : Type u} {G : ι → Type v} [∀ i, Group (G i)]

/-! ## Layer 0: reference families and the integral subgroup -/

section Layer0

/-- **0.1** The subgroup cut out by a **second** family `V`. -/
theorem mem_integralSubgroupOf (U V : ∀ i, Subgroup (G i))
    (x : Πʳ i, [G i, (U i : Set (G i))]) :
    x ∈ integralSubgroupOf U V ↔ ∀ i, x i ∈ V i :=
  TauCeti.mem_integralSubgroupOf U V x

/-- The everywhere-integral subgroup is the diagonal case `V = U`. -/
theorem integralSubgroup_eq_integralSubgroupOf (U : ∀ i, Subgroup (G i)) :
    integralSubgroup U = integralSubgroupOf U U :=
  rfl

theorem mem_integralSubgroup (U : ∀ i, Subgroup (G i))
    (x : Πʳ i, [G i, (U i : Set (G i))]) :
    x ∈ integralSubgroup U ↔ ∀ i, x i ∈ U i :=
  TauCeti.mem_integralSubgroup U x

variable [∀ i, TopologicalSpace (G i)]

/-- **0.1** Openness for a second family only **eventually** equal to the reference family. -/
theorem isOpen_forall_mem_of_eventually_eq (U V : ∀ i, Subgroup (G i))
    (hV : ∀ i, IsOpen (V i : Set (G i))) (hUV : ∀ᶠ i in cofinite, U i = V i) :
    IsOpen (integralSubgroupOf U V : Set (Πʳ i, [G i, (U i : Set (G i))])) :=
  TauCeti.isOpen_forall_mem_of_eventually_eq U V hV hUV

/-- **0.1** Compactness for a second family only **eventually** inside the reference family. -/
theorem isCompact_forall_mem_of_eventually_subset (U V : ∀ i, Subgroup (G i))
    (hV : ∀ i, IsCompact (V i : Set (G i)))
    (hUV : ∀ᶠ i in cofinite, (V i : Set (G i)) ⊆ (U i : Set (G i))) :
    IsCompact (integralSubgroupOf U V : Set (Πʳ i, [G i, (U i : Set (G i))])) :=
  TauCeti.isCompact_forall_mem_of_eventually_subset U V hV hUV

theorem isOpen_integralSubgroup (U : ∀ i, Subgroup (G i))
    (hU : ∀ i, IsOpen (U i : Set (G i))) :
    IsOpen (integralSubgroup U : Set (Πʳ i, [G i, (U i : Set (G i))])) :=
  TauCeti.isOpen_integralSubgroup U hU

/-- Compactness of the everywhere-integral subgroup, with **no** openness hypothesis. -/
theorem isCompact_integralSubgroup (U : ∀ i, Subgroup (G i))
    (hK : ∀ i, IsCompact (U i : Set (G i))) :
    IsCompact (integralSubgroup U : Set (Πʳ i, [G i, (U i : Set (G i))])) :=
  TauCeti.isCompact_integralSubgroup U hK

/-- **0.2** A `CompactOpenSubgroups G` is exactly a family of subgroups each open and compact. It
is a structure passed as a parameter, not an instance, so no global choice is hidden. -/
theorem exists_compactOpenSubgroups_iff (U : ∀ i, Subgroup (G i)) :
    (∃ K : CompactOpenSubgroups G, ∀ i, (K.subgroup i : Subgroup (G i)) = U i) ↔
      (∀ i, IsOpen (U i : Set (G i))) ∧ ∀ i, IsCompact (U i : Set (G i)) := by
  constructor
  · rintro ⟨K, hK⟩
    refine ⟨fun i ↦ ?_, fun i ↦ ?_⟩
    · rw [← hK i]
      exact (K.subgroup i).isOpen
    · rw [← hK i]
      exact K.isCompact_subgroup i
  · rintro ⟨hU, hK⟩
    exact ⟨⟨fun i ↦ ⟨U i, hU i⟩, hK⟩, fun _ ↦ rfl⟩

end Layer0

/-! ## Layer 1: componentwise maps -/

section Maps

variable {H : ι → Type w} {K : ι → Type z} [∀ i, Group (H i)] [∀ i, Group (K i)]

/-- **1.1** The componentwise map, from **eventual** preservation of the reference subgroups. -/
theorem restrictedProductMap_apply (U : ∀ i, Subgroup (G i)) (U' : ∀ i, Subgroup (H i))
    (φ : ∀ i, G i →* H i) (hφ : ∀ᶠ i in cofinite, Set.MapsTo (φ i) (U i) (U' i))
    (x : Πʳ i, [G i, (U i : Set (G i))]) (i : ι) :
    restrictedProductMap U U' φ hφ x i = φ i (x i) :=
  TauCeti.restrictedProductMap_apply U U' φ hφ x i

/-- **Example 4.** A family preserving the reference subgroups off a finite set induces a map of
restricted products. -/
theorem exists_restrictedProductMap_of_finite (U : ∀ i, Subgroup (G i))
    (U' : ∀ i, Subgroup (H i)) (φ : ∀ i, G i →* H i) {T : Set ι} (hT : T.Finite)
    (hφ : ∀ i ∉ T, Set.MapsTo (φ i) (U i) (U' i)) :
    ∃ f : (Πʳ i, [G i, (U i : Set (G i))]) →* Πʳ i, [H i, (U' i : Set (H i))],
      ∀ x i, f x i = φ i (x i) :=
  ⟨restrictedProductMap U U' φ (hT.eventually_cofinite_notMem.mono hφ),
    TauCeti.restrictedProductMap_apply U U' φ _⟩

theorem continuous_restrictedProductMap [∀ i, TopologicalSpace (G i)]
    [∀ i, TopologicalSpace (H i)] (U : ∀ i, Subgroup (G i)) (U' : ∀ i, Subgroup (H i))
    (φ : ∀ i, G i →* H i) (hφ : ∀ᶠ i in cofinite, Set.MapsTo (φ i) (U i) (U' i))
    (hφcont : ∀ i, Continuous (φ i)) :
    Continuous (restrictedProductMap U U' φ hφ) :=
  TauCeti.continuous_restrictedProductMap U U' φ hφ hφcont

/-- The everywhere-preserving constructor is the eventual one at `.of_forall`. -/
theorem restrictedProductMapOfForall_eq (U : ∀ i, Subgroup (G i)) (U' : ∀ i, Subgroup (H i))
    (φ : ∀ i, G i →* H i) (hφ : ∀ i, Set.MapsTo (φ i) (U i) (U' i)) :
    restrictedProductMapOfForall U U' φ hφ = restrictedProductMap U U' φ (.of_forall hφ) :=
  rfl

theorem restrictedProductMapOfForall_apply (U : ∀ i, Subgroup (G i))
    (U' : ∀ i, Subgroup (H i)) (φ : ∀ i, G i →* H i)
    (hφ : ∀ i, Set.MapsTo (φ i) (U i) (U' i)) (x : Πʳ i, [G i, (U i : Set (G i))]) (i : ι) :
    restrictedProductMapOfForall U U' φ hφ x i = φ i (x i) :=
  TauCeti.restrictedProductMapOfForall_apply U U' φ hφ x i

theorem restrictedProductMap_id (U : ∀ i, Subgroup (G i)) :
    restrictedProductMap U U (fun i ↦ MonoidHom.id (G i)) (.of_forall fun _ _ hx ↦ hx) =
      MonoidHom.id (Πʳ i, [G i, (U i : Set (G i))]) :=
  TauCeti.restrictedProductMap_id U

theorem restrictedProductMap_comp (U : ∀ i, Subgroup (G i)) (U' : ∀ i, Subgroup (H i))
    (U'' : ∀ i, Subgroup (K i)) (φ : ∀ i, G i →* H i) (ψ : ∀ i, H i →* K i)
    (hφ : ∀ᶠ i in cofinite, Set.MapsTo (φ i) (U i) (U' i))
    (hψ : ∀ᶠ i in cofinite, Set.MapsTo (ψ i) (U' i) (U'' i)) :
    (restrictedProductMap U' U'' ψ hψ).comp (restrictedProductMap U U' φ hφ) =
      restrictedProductMap U U'' (fun i ↦ (ψ i).comp (φ i))
        (by filter_upwards [hφ, hψ] with i hφi hψi using hψi.comp hφi) :=
  TauCeti.restrictedProductMap_comp U U' U'' φ ψ hφ hψ

theorem mapsTo_integralSubgroup_of_forall (U : ∀ i, Subgroup (G i))
    (U' : ∀ i, Subgroup (H i)) (φ : ∀ i, G i →* H i)
    (hφ : ∀ i, Set.MapsTo (φ i) (U i) (U' i)) :
    (integralSubgroup U).map (restrictedProductMapOfForall U U' φ hφ) ≤ integralSubgroup U' :=
  TauCeti.mapsTo_integralSubgroup_of_forall U U' φ hφ

/-- **Example 5**, the README's witness: `ι = ℕ`, factors `Multiplicative ℤ`, `U = ⊤`, `U'` equal
to `⊥` at `0` and `⊤` elsewhere, identity coordinate maps. -/
theorem exists_not_map_integralSubgroup_le :
    ∃ (U U' : ℕ → Subgroup (Multiplicative ℤ)) (h : ∀ᶠ i in cofinite, U i = U' i),
      ¬ (integralSubgroup U).map
          (restrictedProductMap U U' (fun _ ↦ MonoidHom.id _)
            (h.mono fun _ hi _ hx ↦ hi ▸ hx)) ≤
        integralSubgroup U' :=
  TauCeti.exists_not_map_integralSubgroup_le

/-- **⚠ Rejection test for 1.1:** the eventual constructor need not preserve the integral
subgroup. -/
theorem not_forall_mapsTo_integralSubgroup :
    ¬ ∀ (U U' : ℕ → Subgroup (Multiplicative ℤ))
        (φ : ∀ _ : ℕ, Multiplicative ℤ →* Multiplicative ℤ)
        (hφ : ∀ᶠ i in cofinite, Set.MapsTo (φ i) (U i) (U' i)),
        (integralSubgroup U).map (restrictedProductMap U U' φ hφ) ≤ integralSubgroup U' :=
  TauCeti.not_forall_mapsTo_integralSubgroup

end Maps

/-! ## Layer 1: change of factors and change of reference family -/

section Congr

variable {H : ι → Type w} [∀ i, Group (H i)]

/-- **1.2** Change of factors from an **eventual** coordinatewise `Set.BijOn`: `φ i` forwards. -/
theorem restrictedProductCongrRight_apply (U : ∀ i, Subgroup (G i)) (U' : ∀ i, Subgroup (H i))
    (φ : ∀ i, G i ≃* H i) (hφ : ∀ᶠ i in cofinite, Set.BijOn (φ i) (U i) (U' i))
    (x : Πʳ i, [G i, (U i : Set (G i))]) (i : ι) :
    restrictedProductCongrRight U U' φ hφ x i = φ i (x i) :=
  TauCeti.restrictedProductCongrRight_apply U U' φ hφ x i

/-- … and `(φ i).symm` backwards. -/
theorem restrictedProductCongrRight_symm_apply (U : ∀ i, Subgroup (G i))
    (U' : ∀ i, Subgroup (H i)) (φ : ∀ i, G i ≃* H i)
    (hφ : ∀ᶠ i in cofinite, Set.BijOn (φ i) (U i) (U' i))
    (y : Πʳ i, [H i, (U' i : Set (H i))]) (i : ι) :
    (restrictedProductCongrRight U U' φ hφ).symm y i = (φ i).symm (y i) :=
  TauCeti.restrictedProductCongrRight_symm_apply U U' φ hφ y i

theorem continuous_restrictedProductCongrRight [∀ i, TopologicalSpace (G i)]
    [∀ i, TopologicalSpace (H i)] (U : ∀ i, Subgroup (G i)) (U' : ∀ i, Subgroup (H i))
    (φ : ∀ i, G i ≃* H i) (hφ : ∀ᶠ i in cofinite, Set.BijOn (φ i) (U i) (U' i))
    (hcont : ∀ i, Continuous (φ i)) :
    Continuous (restrictedProductCongrRight U U' φ hφ) :=
  TauCeti.continuous_restrictedProductCongrRight U U' φ hφ hcont

theorem continuous_restrictedProductCongrRight_symm [∀ i, TopologicalSpace (G i)]
    [∀ i, TopologicalSpace (H i)] (U : ∀ i, Subgroup (G i)) (U' : ∀ i, Subgroup (H i))
    (φ : ∀ i, G i ≃* H i) (hφ : ∀ᶠ i in cofinite, Set.BijOn (φ i) (U i) (U' i))
    (hcont : ∀ i, Continuous (φ i).symm) :
    Continuous (restrictedProductCongrRight U U' φ hφ).symm :=
  TauCeti.continuous_restrictedProductCongrRight_symm U U' φ hφ hcont

/-- **⚠ Rejection test 9**, the README's witness: identity maps on `Multiplicative ℤ` with `U = ⊥`
and `U' = ⊤` satisfy `Set.MapsTo` everywhere, but the induced map is not surjective. -/
theorem not_forall_restrictedProductMap_surjective :
    ¬ ∀ (U U' : ℕ → Subgroup (Multiplicative ℤ))
        (φ : ∀ _ : ℕ, Multiplicative ℤ ≃* Multiplicative ℤ)
        (hφ : ∀ᶠ i in cofinite, Set.MapsTo (φ i) (U i) (U' i)),
        Function.Surjective (restrictedProductMap U U' (fun i ↦ (φ i).toMonoidHom) hφ) :=
  TauCeti.not_forall_restrictedProductMap_surjective

/-- For coordinatewise isomorphisms, eventual `Set.BijOn` is exactly what surjectivity needs. -/
theorem restrictedProductMap_surjective_iff_eventually_bijOn (U : ∀ i, Subgroup (G i))
    (U' : ∀ i, Subgroup (H i)) (φ : ∀ i, G i ≃* H i)
    (hφ : ∀ᶠ i in cofinite, Set.MapsTo (φ i) (U i) (U' i)) :
    Function.Surjective (restrictedProductMap U U' (fun i ↦ (φ i).toMonoidHom) hφ) ↔
      ∀ᶠ i in cofinite, Set.BijOn (φ i) (U i) (U' i) :=
  TauCeti.restrictedProductMap_surjective_iff_eventually_bijOn U U' φ hφ

/-- **1.2a** Change of reference family is the `φ = id` case of `restrictedProductCongrRight`. -/
theorem restrictedProductCongr_eq (U U' : ∀ i, Subgroup (G i))
    (h : ∀ᶠ i in cofinite, U i = U' i) :
    restrictedProductCongr U U' h =
      restrictedProductCongrRight U U' (fun i ↦ MulEquiv.refl (G i)) (by
        filter_upwards [h] with i hi
        simp only [MulEquiv.coe_refl, hi]
        exact Set.bijOn_id _) :=
  rfl

/-- **Example 2.** Both directions are coordinatewise the identity … -/
theorem restrictedProductCongr_apply (U U' : ∀ i, Subgroup (G i))
    (h : ∀ᶠ i in cofinite, U i = U' i) (x : Πʳ i, [G i, (U i : Set (G i))]) (i : ι) :
    restrictedProductCongr U U' h x i = x i :=
  TauCeti.restrictedProductCongr_apply U U' h x i

theorem restrictedProductCongr_symm_apply (U U' : ∀ i, Subgroup (G i))
    (h : ∀ᶠ i in cofinite, U i = U' i) (y : Πʳ i, [G i, (U' i : Set (G i))]) (i : ι) :
    (restrictedProductCongr U U' h).symm y i = y i :=
  TauCeti.restrictedProductCongr_symm_apply U U' h y i

/-- … and continuous, for every pair of families. -/
theorem continuous_restrictedProductCongr [∀ i, TopologicalSpace (G i)]
    (U U' : ∀ i, Subgroup (G i)) (h : ∀ᶠ i in cofinite, U i = U' i) :
    Continuous (restrictedProductCongr U U' h) :=
  TauCeti.continuous_restrictedProductCongr U U' h

theorem continuous_restrictedProductCongr_symm [∀ i, TopologicalSpace (G i)]
    (U U' : ∀ i, Subgroup (G i)) (h : ∀ᶠ i in cofinite, U i = U' i) :
    Continuous (restrictedProductCongr U U' h).symm :=
  TauCeti.continuous_restrictedProductCongr_symm U U' h

theorem restrictedProductCongr_refl (U : ∀ i, Subgroup (G i)) :
    restrictedProductCongr U U (.of_forall fun _ ↦ rfl) =
      MulEquiv.refl (Πʳ i, [G i, (U i : Set (G i))]) :=
  TauCeti.restrictedProductCongr_refl U

theorem restrictedProductCongr_symm (U U' : ∀ i, Subgroup (G i))
    (h : ∀ᶠ i in cofinite, U i = U' i) :
    (restrictedProductCongr U U' h).symm =
      restrictedProductCongr U' U (h.mono fun _ hi ↦ hi.symm) :=
  TauCeti.restrictedProductCongr_symm U U' h

theorem restrictedProductCongr_trans (U U' U'' : ∀ i, Subgroup (G i))
    (h : ∀ᶠ i in cofinite, U i = U' i) (h' : ∀ᶠ i in cofinite, U' i = U'' i) :
    (restrictedProductCongr U U' h).trans (restrictedProductCongr U' U'' h') =
      restrictedProductCongr U U'' (by
        filter_upwards [h, h'] with i hi hi'
        exact hi.trans hi') :=
  TauCeti.restrictedProductCongr_trans U U' U'' h h'

theorem restrictedProductCongr_naturality (U U' : ∀ i, Subgroup (G i))
    (V V' : ∀ i, Subgroup (H i)) (φ : ∀ i, G i →* H i)
    (hφ : ∀ᶠ i in cofinite, Set.MapsTo (φ i) (U i) (V i))
    (h : ∀ᶠ i in cofinite, U i = U' i) (h' : ∀ᶠ i in cofinite, V i = V' i) :
    (restrictedProductCongr V V' h' : _ →* _).comp (restrictedProductMap U V φ hφ) =
      (restrictedProductMap U' V' φ (by
        filter_upwards [hφ, h, h'] with i hi hU hV
        rwa [← hU, ← hV])).comp (restrictedProductCongr U U' h : _ →* _) :=
  TauCeti.restrictedProductCongr_naturality U U' V V' φ hφ h h'

/-- **Change of family and double cosets.** The bijection of double-coset spaces is along the
**transported** subgroups `Γ.map` and `K.map`, pinned in both directions. -/
theorem doubleCosetCongr_apply_mk (U U' : ∀ i, Subgroup (G i))
    (h : ∀ᶠ i in cofinite, U i = U' i) (Γ K : Subgroup (Πʳ i, [G i, (U i : Set (G i))]))
    (x : Πʳ i, [G i, (U i : Set (G i))]) :
    doubleCosetCongr U U' h Γ K (DoubleCoset.mk Γ K x) =
      DoubleCoset.mk
        (Γ.map (restrictedProductCongr U U' h :
          (Πʳ i, [G i, (U i : Set (G i))]) →* Πʳ i, [G i, (U' i : Set (G i))]))
        (K.map (restrictedProductCongr U U' h :
          (Πʳ i, [G i, (U i : Set (G i))]) →* Πʳ i, [G i, (U' i : Set (G i))]))
        (restrictedProductCongr U U' h x) :=
  TauCeti.doubleCosetCongr_apply_mk U U' h Γ K x

theorem doubleCosetCongr_symm_apply_mk (U U' : ∀ i, Subgroup (G i))
    (h : ∀ᶠ i in cofinite, U i = U' i) (Γ K : Subgroup (Πʳ i, [G i, (U i : Set (G i))]))
    (y : Πʳ i, [G i, (U' i : Set (G i))]) :
    (doubleCosetCongr U U' h Γ K).symm
        (DoubleCoset.mk
          (Γ.map (restrictedProductCongr U U' h :
            (Πʳ i, [G i, (U i : Set (G i))]) →* Πʳ i, [G i, (U' i : Set (G i))]))
          (K.map (restrictedProductCongr U U' h :
            (Πʳ i, [G i, (U i : Set (G i))]) →* Πʳ i, [G i, (U' i : Set (G i))]))
          y) =
      DoubleCoset.mk Γ K ((restrictedProductCongr U U' h).symm y) :=
  TauCeti.doubleCosetCongr_symm_apply_mk U U' h Γ K y

/-- **⚠ Example 6**, the README's witness: the change of family need not carry
`integralSubgroup U` onto `integralSubgroup U'`. -/
theorem exists_map_integralSubgroup_ne :
    ∃ (U U' : ℕ → Subgroup (Multiplicative ℤ)) (h : ∀ᶠ i in cofinite, U i = U' i),
      (integralSubgroup U).map (restrictedProductCongr U U' h) ≠ integralSubgroup U' :=
  TauCeti.exists_map_integralSubgroup_ne

end Congr

/-! ## Layer 1: reindexing along an equivalence of index types

No filter hypothesis appears: `e` carries `cofinite` to `cofinite`. -/

section Reindex

variable {ι' : Type w} (U : ∀ i, Subgroup (G i)) (e : ι' ≃ ι)

/-- **1.3** FLT's orientation, pinned by FLT's equation `… y (e j) = y j`. -/
theorem restrictedProductCongrLeft_apply_apply
    (y : Πʳ j, [G (e j), (U (e j) : Set (G (e j)))]) (j : ι') :
    restrictedProductCongrLeft U e y (e j) = y j :=
  TauCeti.restrictedProductCongrLeft_apply_apply U e y j

theorem restrictedProductCongrLeft_symm_apply (x : Πʳ i, [G i, (U i : Set (G i))]) (j : ι') :
    (restrictedProductCongrLeft U e).symm x j = x (e j) :=
  TauCeti.restrictedProductCongrLeft_symm_apply U e x j

/-- `restrictedProductReindex` is the inverse of `restrictedProductCongrLeft`. -/
theorem restrictedProductReindex_eq :
    restrictedProductReindex U e = (restrictedProductCongrLeft U e).symm :=
  rfl

/-- **The three equivalences: reindexing.** Forward, `x ↦ (j ↦ x (e j))` … -/
theorem restrictedProductReindex_apply (x : Πʳ i, [G i, (U i : Set (G i))]) (j : ι') :
    restrictedProductReindex U e x j = x (e j) :=
  TauCeti.restrictedProductReindex_apply U e x j

/-- … and the inverse, pinned by its values at `e j`. -/
theorem restrictedProductReindex_symm_apply
    (y : Πʳ j, [G (e j), (U (e j) : Set (G (e j)))]) (j : ι') :
    (restrictedProductReindex U e).symm y (e j) = y j :=
  TauCeti.restrictedProductReindex_symm_apply U e y j

variable [∀ i, TopologicalSpace (G i)]

theorem continuous_restrictedProductReindex : Continuous (restrictedProductReindex U e) :=
  TauCeti.continuous_restrictedProductReindex U e

theorem continuous_restrictedProductReindex_symm :
    Continuous (restrictedProductReindex U e).symm :=
  TauCeti.continuous_restrictedProductReindex_symm U e

end Reindex

/-! ## Layer 2: names and restriction away from `S` -/

section Away

/-- **2.1** The three index-generic names. -/
example (U : ∀ i, Subgroup (G i)) :
    RestrictedProductGroup U = Πʳ i, [G i, (U i : Set (G i))] :=
  rfl

/-- `RestrictedProductGroupAway` needs no finiteness of `S`. -/
example (S : Set ι) (U : ∀ i, Subgroup (G i)) :
    RestrictedProductGroupAway S U = Πʳ i : {i // i ∉ S}, [G i.1, (U i.1 : Set (G i.1))] :=
  rfl

example (H : Type w) (U : ∀ i, Subgroup (G i)) :
    RestrictedProductGroupWithFactor H U = (H × RestrictedProductGroup U) :=
  rfl

/-- **2.2** Restriction away from `S`. -/
theorem restrictAway_apply (S : Set ι) (U : ∀ i, Subgroup (G i))
    (x : RestrictedProductGroup U) (i : {i // i ∉ S}) :
    restrictAway S U x i = x i.1 :=
  TauCeti.restrictAway_apply S U x i

theorem restrictAway_restrictAway (S T : Set ι) (hST : S ⊆ T) (U : ∀ i, Subgroup (G i))
    (x : RestrictedProductGroup U) (i : {i // i ∉ T}) :
    restrictAway T U x i = restrictAway S U x ⟨i.1, fun hi ↦ i.2 (hST hi)⟩ :=
  TauCeti.restrictAway_restrictAway hST U x i

end Away

/-! ## Layer 2: splitting over a `Sum` -/

section Sum

variable {ι₁ : Type u} {ι₂ : Type w} {G' : ι₁ ⊕ ι₂ → Type v} [∀ k, Group (G' k)]
  {𝓕 : Filter (ι₁ ⊕ ι₂)} {𝓕₁ : Filter ι₁} {𝓕₂ : Filter ι₂}
  (U : ∀ k, Subgroup (G' k)) (h₁ : 𝓕.comap Sum.inl = 𝓕₁) (h₂ : 𝓕.comap Sum.inr = 𝓕₂)

/-- **2.3** The four coordinate formulas, for every filter with the comap summand filters. -/
theorem restrictedProductSum_apply_inl (x : Πʳ k, [G' k, (U k : Set (G' k))]_[𝓕]) (i : ι₁) :
    (restrictedProductSum U h₁ h₂ x).1 i = x (Sum.inl i) :=
  TauCeti.restrictedProductSum_apply_inl U h₁ h₂ x i

theorem restrictedProductSum_apply_inr (x : Πʳ k, [G' k, (U k : Set (G' k))]_[𝓕]) (j : ι₂) :
    (restrictedProductSum U h₁ h₂ x).2 j = x (Sum.inr j) :=
  TauCeti.restrictedProductSum_apply_inr U h₁ h₂ x j

theorem restrictedProductSum_symm_apply_inl
    (y : (Πʳ i, [G' (Sum.inl i), (U (Sum.inl i) : Set (G' (Sum.inl i)))]_[𝓕₁]) ×
      (Πʳ j, [G' (Sum.inr j), (U (Sum.inr j) : Set (G' (Sum.inr j)))]_[𝓕₂])) (i : ι₁) :
    (restrictedProductSum U h₁ h₂).symm y (Sum.inl i) = y.1 i :=
  TauCeti.restrictedProductSum_symm_apply_inl U h₁ h₂ y i

theorem restrictedProductSum_symm_apply_inr
    (y : (Πʳ i, [G' (Sum.inl i), (U (Sum.inl i) : Set (G' (Sum.inl i)))]_[𝓕₁]) ×
      (Πʳ j, [G' (Sum.inr j), (U (Sum.inr j) : Set (G' (Sum.inr j)))]_[𝓕₂])) (j : ι₂) :
    (restrictedProductSum U h₁ h₂).symm y (Sum.inr j) = y.2 j :=
  TauCeti.restrictedProductSum_symm_apply_inr U h₁ h₂ y j

/-- **⚠ Rejection test 10.** The summand filters are comaps, not `cofinite` by fiat: at
`𝓟 (Set.range Sum.inl)` the right-hand comap is `⊥` and the right factor is the unrestricted
product. -/
noncomputable example :
    (Πʳ k, [G' k, (U k : Set (G' k))]_[𝓟 (Set.range Sum.inl)]) ≃*
      (Πʳ i, [G' (Sum.inl i), (U (Sum.inl i) : Set (G' (Sum.inl i)))]_[⊤]) ×
        (Πʳ j, [G' (Sum.inr j), (U (Sum.inr j) : Set (G' (Sum.inr j)))]_[⊥]) :=
  restrictedProductSum U (by rw [comap_principal, Set.preimage_range, principal_univ])
    (by rw [comap_principal, Set.preimage_inr_range_inl, principal_empty])

variable [∀ k, TopologicalSpace (G' k)]

/-- The splitting is continuous for every filter and every reference family. -/
theorem continuous_restrictedProductSum : Continuous (restrictedProductSum U h₁ h₂) :=
  TauCeti.continuous_restrictedProductSum U h₁ h₂

/-- At the cofinite filter the inverse is continuous when every `U k` is open. -/
theorem continuous_restrictedProductSum_symm (hU : ∀ k, IsOpen (U k : Set (G' k))) :
    Continuous (restrictedProductSum U Sum.inl_injective.comap_cofinite_eq
      Sum.inr_injective.comap_cofinite_eq).symm :=
  TauCeti.continuous_restrictedProductSum_symm U hU

end Sum

/-- **⚠ Rejection test 11.** With factors `Multiplicative ℚ` (topology of `ℚ ⊆ ℝ`) and trivial
reference subgroups, multiplication on `Πʳ n : ℕ, [Multiplicative ℚ, ⊥]` is not continuous … -/
theorem not_continuousMul_restrictedProduct_rat_bot :
    ¬ ContinuousMul (Πʳ _ : ℕ, [Multiplicative ℚ,
      ((⊥ : Subgroup (Multiplicative ℚ)) : Set (Multiplicative ℚ))]) :=
  TauCeti.not_continuousMul_restrictedProduct_rat_bot

/-- … so the inverse of the `Sum` splitting is not continuous: openness cannot be dropped. -/
theorem not_continuous_restrictedProductSum_symm :
    ¬ Continuous (restrictedProductSum (G := fun _ : ℕ ⊕ ℕ ↦ Multiplicative ℚ)
      (fun _ ↦ (⊥ : Subgroup (Multiplicative ℚ))) Sum.inl_injective.comap_cofinite_eq
      Sum.inr_injective.comap_cofinite_eq).symm :=
  TauCeti.not_continuous_restrictedProductSum_symm

/-! ## Layer 2: the finite collapse -/

section Finite

variable {κ : Type w} [Finite κ] {F : κ → Type v} [∀ i, Group (F i)] (U : ∀ i, Subgroup (F i))

/-- **Example 1.** Over a finite index type the restricted product is the plain product `Π i, F i`
(not Mathlib's `homeoTop`, which gives `Π i, U i`) … -/
theorem restrictedProductOfFinite_apply (x : Πʳ i, [F i, (U i : Set (F i))]) (i : κ) :
    restrictedProductOfFinite U x i = x i :=
  TauCeti.restrictedProductOfFinite_apply U x i

theorem restrictedProductOfFinite_symm_apply (x : ∀ i, F i) (i : κ) :
    (restrictedProductOfFinite U).symm x i = x i :=
  TauCeti.restrictedProductOfFinite_symm_apply U x i

/-- … and the integral subgroup is the product of the reference subgroups. -/
theorem map_restrictedProductOfFinite_integralSubgroup :
    (integralSubgroup U).map (restrictedProductOfFinite U) = Subgroup.pi Set.univ U :=
  TauCeti.map_restrictedProductOfFinite_integralSubgroup U

variable [∀ i, TopologicalSpace (F i)]

/-- A homeomorphism for every reference family. -/
theorem continuous_restrictedProductOfFinite : Continuous (restrictedProductOfFinite U) :=
  TauCeti.continuous_restrictedProductOfFinite U

theorem continuous_restrictedProductOfFinite_symm :
    Continuous (restrictedProductOfFinite U).symm :=
  TauCeti.continuous_restrictedProductOfFinite_symm U

end Finite

/-! ## Layer 2: the away-`S` decomposition -/

section Decomposition

variable (S : Set ι) (hS : S.Finite) (U : ∀ i, Subgroup (G i))

/-- **2.4** The decomposition is assembled, not built from scratch: it is reindexing along
`Equiv.sumCompl (· ∈ S)`, then the `Sum` splitting, then the finite collapse on the `S` factor. -/
theorem awayDecomposition_eq_comp [DecidablePred (· ∈ S)] [Finite S]
    (x : RestrictedProductGroup U) :
    awayDecomposition S hS U x =
      (restrictedProductOfFinite (fun i : S ↦ U (Equiv.sumCompl (· ∈ S) (Sum.inl i)))
          (restrictedProductSum (fun k ↦ U (Equiv.sumCompl (· ∈ S) k))
            Sum.inl_injective.comap_cofinite_eq Sum.inr_injective.comap_cofinite_eq
            (restrictedProductReindex U (Equiv.sumCompl (· ∈ S)) x)).1,
        (restrictedProductSum (fun k ↦ U (Equiv.sumCompl (· ∈ S) k))
            Sum.inl_injective.comap_cofinite_eq Sum.inr_injective.comap_cofinite_eq
            (restrictedProductReindex U (Equiv.sumCompl (· ∈ S)) x)).2) := by
  refine Prod.ext (funext fun i ↦ ?_) ?_
  · exact (TauCeti.awayDecomposition_fst S hS U x i).trans
      (TauCeti.restrictedProductReindex_apply U (Equiv.sumCompl (· ∈ S)) x (Sum.inl i)).symm
  · ext j
    exact (TauCeti.awayDecomposition_snd S hS U x j).trans
      (TauCeti.restrictedProductReindex_apply U (Equiv.sumCompl (· ∈ S)) x (Sum.inr j)).symm

/-- **The three equivalences: the away-`S` decomposition.** Forward,
`x ↦ ((x i)_{i ∈ S}, (x i)_{i ∉ S})` … -/
theorem awayDecomposition_fst (x : RestrictedProductGroup U) (i : S) :
    (awayDecomposition S hS U x).1 i = x i :=
  TauCeti.awayDecomposition_fst S hS U x i

theorem awayDecomposition_snd (x : RestrictedProductGroup U) :
    (awayDecomposition S hS U x).2 = restrictAway S U x :=
  TauCeti.awayDecomposition_snd_eq_restrictAway S hS U x

/-- … and the inverse reads `y ⟨i, _⟩` at `i ∈ S` and `z ⟨i, _⟩` at `i ∉ S`. -/
theorem awayDecomposition_symm_apply_of_mem
    (y : RestrictedProductGroupWithFactor (∀ i : S, G i) fun j : {i // i ∉ S} ↦ U j.1)
    (i : ι) (hi : i ∈ S) :
    (awayDecomposition S hS U).symm y i = y.1 ⟨i, hi⟩ :=
  TauCeti.awayDecomposition_symm_apply_of_mem S hS U y i hi

theorem awayDecomposition_symm_apply_of_notMem
    (y : RestrictedProductGroupWithFactor (∀ i : S, G i) fun j : {i // i ∉ S} ↦ U j.1)
    (i : ι) (hi : i ∉ S) :
    (awayDecomposition S hS U).symm y i = y.2 ⟨i, hi⟩ :=
  TauCeti.awayDecomposition_symm_apply_of_notMem S hS U y i hi

variable [∀ i, TopologicalSpace (G i)]

/-- Continuous for every reference family. -/
theorem continuous_awayDecomposition : Continuous (awayDecomposition S hS U) :=
  TauCeti.continuous_awayDecomposition S hS U

/-- The inverse is continuous when `U i` is open for every `i ∉ S`. -/
theorem continuous_awayDecomposition_symm (hU : ∀ i ∉ S, IsOpen (U i : Set (G i))) :
    Continuous (awayDecomposition S hS U).symm :=
  TauCeti.continuous_awayDecomposition_symm S hS U hU

end Decomposition

/-- **⚠ Rejection test 11 at `S = {0}`:** the openness hypothesis cannot be dropped. -/
theorem not_continuous_awayDecomposition_symm :
    ¬ Continuous (awayDecomposition ({0} : Set ℕ) (Set.finite_singleton 0)
      fun _ : ℕ ↦ (⊥ : Subgroup (Multiplicative ℚ))).symm :=
  TauCeti.not_continuous_awayDecomposition_symm

/-! ## Layer 3: diagonals -/

section Diagonal

variable {Γ : Type w} {H : ι → Type z} [∀ i, Group (H i)]

/-- **3.1** The diagonal; the eventual-integrality evidence `h` is an argument (**Example 8**). -/
theorem rationalDiagonal_apply [MulOneClass Γ] (φ : ∀ i, Γ →* G i) (U : ∀ i, Subgroup (G i))
    (h : ∀ γ : Γ, ∀ᶠ i in cofinite, φ i γ ∈ U i) (γ : Γ) (i : ι) :
    rationalDiagonal φ U h γ i = φ i γ :=
  TauCeti.rationalDiagonal_apply φ U h γ i

/-- **3.2** Compatibility with change of reference family … -/
theorem rationalDiagonal_change_family [MulOneClass Γ] (φ : ∀ i, Γ →* G i)
    (U U' : ∀ i, Subgroup (G i)) (hU : ∀ γ : Γ, ∀ᶠ i in cofinite, φ i γ ∈ U i)
    (hU' : ∀ γ : Γ, ∀ᶠ i in cofinite, φ i γ ∈ U' i) (h : ∀ᶠ i in cofinite, U i = U' i) :
    (restrictedProductCongr U U' h : _ →* _).comp (rationalDiagonal φ U hU) =
      rationalDiagonal φ U' hU' :=
  TauCeti.rationalDiagonal_change_family φ U U' hU hU' h

/-- … and with componentwise maps. -/
theorem restrictedProductMap_comp_rationalDiagonal [MulOneClass Γ] (φ : ∀ i, Γ →* G i)
    (ψ : ∀ i, G i →* H i) (U : ∀ i, Subgroup (G i)) (V : ∀ i, Subgroup (H i))
    (hU : ∀ γ : Γ, ∀ᶠ i in cofinite, φ i γ ∈ U i)
    (hψ : ∀ᶠ i in cofinite, Set.MapsTo (ψ i) (U i) (V i)) :
    (restrictedProductMap U V ψ hψ).comp (rationalDiagonal φ U hU) =
      rationalDiagonal (fun i ↦ (ψ i).comp (φ i)) V
        (fun γ ↦ by filter_upwards [hU γ, hψ] with i hi hψi using hψi hi) :=
  TauCeti.restrictedProductMap_comp_rationalDiagonal φ ψ U V hU hψ

/-- Injectivity from coordinate separation. -/
theorem injective_rationalDiagonal [MulOneClass Γ] (φ : ∀ i, Γ →* G i)
    (U : ∀ i, Subgroup (G i)) (h : ∀ γ : Γ, ∀ᶠ i in cofinite, φ i γ ∈ U i)
    (hsep : ∃ i, Function.Injective (φ i)) :
    Function.Injective (rationalDiagonal φ U h) :=
  TauCeti.injective_rationalDiagonal φ U h hsep

/-- Continuity from a **uniform** integrality set: one cofinite `S` serving every `γ`. -/
theorem continuous_rationalDiagonal [MulOneClass Γ] [TopologicalSpace Γ]
    [∀ i, TopologicalSpace (G i)] (φ : ∀ i, Γ →* G i) (U : ∀ i, Subgroup (G i))
    (h : ∀ γ : Γ, ∀ᶠ i in cofinite, φ i γ ∈ U i) (hcont : ∀ i, Continuous (φ i))
    (S : Set ι) (hS : S ∈ cofinite) (huniform : ∀ γ : Γ, ∀ i ∈ S, φ i γ ∈ U i) :
    Continuous (rationalDiagonal φ U h) :=
  TauCeti.continuous_rationalDiagonal φ U h hcont S hS huniform

/-- **Example 3.** The additive diagonal of a supplied family of maps. -/
theorem addRationalDiagonal_apply [AddZeroClass Γ] {A : ι → Type v} [∀ i, AddGroup (A i)]
    (φ : ∀ i, Γ →+ A i) (U : ∀ i, AddSubgroup (A i))
    (h : ∀ γ : Γ, ∀ᶠ i in cofinite, φ i γ ∈ U i) (γ : Γ) (i : ι) :
    TauCeti.addRationalDiagonal φ U h γ i = φ i γ :=
  TauCeti.addRationalDiagonal_apply φ U h γ i

end Diagonal

section Topology

variable [∀ i, TopologicalSpace (G i)]

/-- **⚠ Example 7.** The restricted-product topology is finer than the one induced from
`Π i, G i`, and strictly finer for discrete groups with trivial reference subgroups, infinitely
many of them nontrivial … -/
theorem continuous_coe_and_not_isInducing_coe_bot [∀ i, DiscreteTopology (G i)]
    (hG : {i | Nontrivial (G i)}.Infinite) :
    Continuous ((↑) : Πʳ i, [G i, ((⊥ : Subgroup (G i)) : Set (G i))] → ∀ i, G i) ∧
      ¬ Topology.IsInducing ((↑) : Πʳ i, [G i, ((⊥ : Subgroup (G i)) : Set (G i))] → ∀ i, G i) :=
  ⟨RestrictedProduct.continuous_coe, TauCeti.not_isInducing_coe_bot hG⟩

/-- … so coordinatewise continuity does not make the diagonal continuous: on the finitely
supported elements of `Π i, G i`, with the induced topology, the coordinate maps are continuous
and the diagonal is not. -/
theorem continuous_eval_and_not_continuous_rationalDiagonal_range_coeMonoidHom
    [∀ i, DiscreteTopology (G i)] (hG : {i | Nontrivial (G i)}.Infinite) :
    (∀ i, Continuous ((Pi.evalMonoidHom G i).comp (Subgroup.subtype
      (RestrictedProduct.coeMonoidHom :
        Πʳ i, [G i, ((⊥ : Subgroup (G i)) : Set (G i))] →* ∀ i, G i).range))) ∧
    ¬ Continuous (rationalDiagonal
      (fun i ↦ (Pi.evalMonoidHom G i).comp (Subgroup.subtype (RestrictedProduct.coeMonoidHom :
        Πʳ i, [G i, ((⊥ : Subgroup (G i)) : Set (G i))] →* ∀ i, G i).range))
      (fun _ ↦ ⊥) fun γ ↦ by obtain ⟨_, x, rfl⟩ := γ; exact x.2) :=
  TauCeti.continuous_eval_and_not_continuous_rationalDiagonal_range_coeMonoidHom hG

end Topology

end TauCetiRoadmap.RestrictedProducts
