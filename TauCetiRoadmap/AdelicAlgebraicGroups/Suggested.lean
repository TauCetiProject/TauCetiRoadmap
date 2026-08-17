import Mathlib
import TauCetiRoadmap.GlobalNumberFields.Suggested
import TauCetiRoadmap.LocalFieldsRamification.Suggested
import TauCetiRoadmap.ReductiveGroups.Suggested

/-!
# Adelic algebraic groups: target signatures

**This file is not the roadmap and is not exhaustive.** `README.md` is the definitive
specification. The generic restricted-product declarations below elaborate against the repository
pin. The final supplier namespaces are imported above. Scheme-level targets such as
`LocalPointGroup`, the algebraic refinement of `CompatibleCompactOpens`,
`strongApproximation`, `tamagawaMeasure`, and `tamagawaNumber` remain provisional milestone
names in the README until Reductive Groups publishes the required functor-of-points carrier.
The exact scheme-level consumer contract is therefore blocked. This file does not replace that
missing accepted carrier with an arbitrary private group-scheme interface.
-/

namespace TauCetiRoadmap.AdelicAlgebraicGroups

open Filter MeasureTheory
open scoped RestrictedProduct

noncomputable section

universe u v w

variable {ι : Type u} {G : ι → Type v}
variable [Π i, Group (G i)] [Π i, TopologicalSpace (G i)]
variable [∀ i, IsTopologicalGroup (G i)]

/-- The everywhere-integral subgroup of a restricted product. -/
def integralSubgroup (U : Π i, Subgroup (G i)) :
    Subgroup (Πʳ i, [G i, (U i : Set (G i))]) where
  carrier := {f | ∀ i, f.1 i ∈ U i}
  mul_mem' := by sorry
  one_mem' := by sorry
  inv_mem' := by sorry

theorem isOpen_integralSubgroup (U : Π i, Subgroup (G i))
    (hU : ∀ i, IsOpen (U i : Set (G i))) :
    IsOpen (integralSubgroup U : Set (Πʳ i, [G i, (U i : Set (G i))])) := sorry

theorem isCompact_integralSubgroup (U : Π i, Subgroup (G i))
    (hU : ∀ i, IsOpen (U i : Set (G i)))
    (hK : ∀ i, IsCompact (U i : Set (G i))) :
    IsCompact (integralSubgroup U : Set (Πʳ i, [G i, (U i : Set (G i))])) := sorry

/-- A generic family of compact-open subgroups. The future algebraic specialization additionally
records eventual agreement with one integral model; that field cannot be stated before the
Reductive Groups functor-of-points carrier exists. -/
structure CompatibleCompactOpens (G : ι → Type v) [Π i, Group (G i)]
    [Π i, TopologicalSpace (G i)] where
  subgroup : Π i, Subgroup (G i)
  isOpen_subgroup : ∀ i, IsOpen (subgroup i : Set (G i))
  isCompact_subgroup : ∀ i, IsCompact (subgroup i : Set (G i))

/-- Componentwise functoriality for restricted products. -/
def restrictedProductMap {H : ι → Type v} [Π i, Group (H i)]
    [Π i, TopologicalSpace (H i)] [∀ i, IsTopologicalGroup (H i)]
    (U : Π i, Subgroup (G i)) (U' : Π i, Subgroup (H i))
    (φ : ∀ i, G i →* H i) (hφ : ∀ i, ∀ g ∈ U i, φ i g ∈ U' i) :
    (Πʳ i, [G i, (U i : Set (G i))]) →*
      (Πʳ i, [H i, (U' i : Set (H i))]) := sorry

theorem restrictedProductMap_apply {H : ι → Type v} [Π i, Group (H i)]
    [Π i, TopologicalSpace (H i)] [∀ i, IsTopologicalGroup (H i)]
    (U : Π i, Subgroup (G i)) (U' : Π i, Subgroup (H i))
    (φ : ∀ i, G i →* H i) (hφ : ∀ i, ∀ g ∈ U i, φ i g ∈ U' i)
    (x : Πʳ i, [G i, (U i : Set (G i))]) (i : ι) :
    restrictedProductMap U U' φ hφ x i = φ i (x i) := sorry

theorem continuous_restrictedProductMap {H : ι → Type v} [Π i, Group (H i)]
    [Π i, TopologicalSpace (H i)] [∀ i, IsTopologicalGroup (H i)]
    (U : Π i, Subgroup (G i)) (U' : Π i, Subgroup (H i))
    (φ : ∀ i, G i →* H i) (hφ : ∀ i, ∀ g ∈ U i, φ i g ∈ U' i)
    (hφcont : ∀ i, Continuous (φ i)) :
    Continuous (restrictedProductMap U U' φ hφ) := sorry

/-- The canonical change-of-compact-open equivalence, coordinatewise the identity. -/
def restrictedProductCongr (U U' : Π i, Subgroup (G i))
    (h : ∀ᶠ i in Filter.cofinite, U i = U' i) :
    (Πʳ i, [G i, (U i : Set (G i))]) ≃*
      (Πʳ i, [G i, (U' i : Set (G i))]) := sorry

theorem restrictedProductCongr_apply (U U' : Π i, Subgroup (G i))
    (h : ∀ᶠ i in Filter.cofinite, U i = U' i)
    (x : Πʳ i, [G i, (U i : Set (G i))]) (i : ι) :
    restrictedProductCongr U U' h x i = x i := sorry

theorem continuous_restrictedProductCongr (U U' : Π i, Subgroup (G i))
    (h : ∀ᶠ i in Filter.cofinite, U i = U' i) :
    Continuous (restrictedProductCongr U U' h) := sorry

theorem continuous_restrictedProductCongr_symm (U U' : Π i, Subgroup (G i))
    (h : ∀ᶠ i in Filter.cofinite, U i = U' i) :
    Continuous (restrictedProductCongr U U' h).symm := sorry

theorem restrictedProductCongr_refl (U : Π i, Subgroup (G i)) :
    restrictedProductCongr U U (Filter.Eventually.of_forall fun _ => rfl) =
      MulEquiv.refl (Πʳ i, [G i, (U i : Set (G i))]) := sorry

theorem restrictedProductCongr_symm (U U' : Π i, Subgroup (G i))
    (h : ∀ᶠ i in Filter.cofinite, U i = U' i) :
    (restrictedProductCongr U U' h).symm =
      restrictedProductCongr U' U (h.mono fun _ hi => hi.symm) := sorry

theorem restrictedProductCongr_trans (U U' U'' : Π i, Subgroup (G i))
    (h : ∀ᶠ i in Filter.cofinite, U i = U' i)
    (h' : ∀ᶠ i in Filter.cofinite, U' i = U'' i) :
    (restrictedProductCongr U U' h).trans (restrictedProductCongr U' U'' h') =
      restrictedProductCongr U U'' (by
        filter_upwards [h, h'] with i hi hi'
        exact hi.trans hi') := sorry

/-- The rational diagonal into a generic restricted product. The arithmetic theorem proving the
eventual-integrality hypothesis is a separate roadmap milestone. -/
def rationalDiagonal {Γ : Type w} [Group Γ] (φ : ∀ i, Γ →* G i)
    (U : Π i, Subgroup (G i))
    (h : ∀ γ : Γ, ∀ᶠ i in Filter.cofinite, φ i γ ∈ U i) :
    Γ →* Πʳ i, [G i, (U i : Set (G i))] := sorry

theorem rationalDiagonal_apply {Γ : Type w} [Group Γ] (φ : ∀ i, Γ →* G i)
    (U : Π i, Subgroup (G i))
    (h : ∀ γ : Γ, ∀ᶠ i in Filter.cofinite, φ i γ ∈ U i)
    (γ : Γ) (i : ι) :
    rationalDiagonal φ U h γ i = φ i γ := sorry

theorem rationalDiagonal_change_family {Γ : Type w} [Group Γ]
    (φ : ∀ i, Γ →* G i) (U U' : Π i, Subgroup (G i))
    (hU : ∀ γ : Γ, ∀ᶠ i in Filter.cofinite, φ i γ ∈ U i)
    (hU' : ∀ γ : Γ, ∀ᶠ i in Filter.cofinite, φ i γ ∈ U' i)
    (h : ∀ᶠ i in Filter.cofinite, U i = U' i) :
    (restrictedProductCongr U U' h).toMonoidHom.comp (rationalDiagonal φ U hU) =
      rationalDiagonal φ U' hU' := sorry

/-- Generic finite adelic points relative to a compatible compact-open family. -/
abbrev FiniteAdelicPoints (U : Π i, Subgroup (G i)) :=
  Πʳ i, [G i, (U i : Set (G i))]

/-- Generic restricted-product points outside a finite set. Archimedean containment is a theorem
of the later number-field specialization, not part of this index-generic abbreviation. -/
abbrev AdelicPointsAway [DecidableEq ι] (S : Finset ι)
    (U : Π i, Subgroup (G i)) :=
  Πʳ i : {i // i ∉ S}, [G i.1, (U i.1 : Set (G i.1))]

/-- The full adelic product once the finite archimedean product is supplied. -/
abbrev AdelicPoints (Garch : Type w) (U : Π i, Subgroup (G i)) :=
  Garch × FiniteAdelicPoints U

end

end TauCetiRoadmap.AdelicAlgebraicGroups
