module

public import Mathlib

/-!
# Higher local class field theory: suggested signatures

These signatures are suggested forms, not an exhaustive checklist. `README.md` is the definitive
specification.

The file states Layer 0 on Mathlib's valuative relations: the predicate `IsHigherLocalField n F`,
the uniqueness of the valuative relation on the residue field, the comparison with
`IsNonarchimedeanLocalField` in dimension one, and the standard fields `LaurentField K`, a type
synonym of `K⸨X⸩` without topology instances, which raise the dimension by one.

The remaining headlines are README targets and are not stated here. Reciprocity, reciprocity at
finite level, the existence theorem, separation and injectivity are statements about the
topological Milnor K-group `K_n^top(F)` and the norm on it. Its carrier is Milnor K-theory, and
the norm is Kato's norm on Milnor K-groups: K2SymbolsBrauer §5.4 and §10.24, which have no
declaration at the pins. They also need the higher topology on `F` and the topology on `Fˣ`
(Layer 1), which are constructions through standard fields, not definitions on Mathlib carriers.
Fesenko's theorem `Λ_n(F) = ⋂_{l ≥ 1} l K_n(F)` needs both.
-/

@[expose] public section

open ValuativeRel
open scoped WithZero

namespace TauCetiRoadmap.HigherLocalClassFieldTheory

/-- `F` is an **`n`-dimensional local field** for its valuative relation. Dimension `0` is a finite
field. In dimension `n + 1` the valuation is discrete and nontrivial of rank one, `F` is complete
for its valuation uniformity, and the residue field `𝓀[F]` is an `n`-dimensional local field for
some valuative relation, which is unique (`existsUnique_residue_valuativeRel`). The valuation
uniformity is not an instance on `F`: in dimension at least two the topology of `F` is the higher
topology, not the valuation topology. -/
def IsHigherLocalField : ℕ → (F : Type) → [Field F] → [ValuativeRel F] → Prop
  | 0, F, _, _ => Finite F
  | n + 1, F, _, _ =>
      IsDiscrete F ∧ IsNontrivial F ∧ IsRankLeOne F ∧
        @CompleteSpace F (Valued.mk' (valuation F)).toUniformSpace ∧
        ∃ _ : ValuativeRel 𝓀[F], IsHigherLocalField n 𝓀[F]

variable {F : Type} [Field F] [ValuativeRel F]

/-- The valuative relation on the residue field is unique (F. K. Schmidt). -/
theorem existsUnique_residue_valuativeRel {n : ℕ} (h : IsHigherLocalField (n + 1) F) :
    ∃! _ : ValuativeRel 𝓀[F], IsHigherLocalField n 𝓀[F] :=
  sorry

/-- **Dimension one** is a nonarchimedean local field. -/
theorem isHigherLocalField_one_iff [TopologicalSpace F] [IsValuativeTopology F] :
    IsHigherLocalField 1 F ↔ IsNonarchimedeanLocalField F :=
  sorry

/-- The **standard Laurent field** `K⸨X⸩` as a type synonym carrying no topology: Mathlib's
`LaurentSeries.valued` is a global instance on `K⸨X⸩`, which would clash with the higher
topology. -/
def LaurentField (K : Type) [Field K] : Type := LaurentSeries K

namespace LaurentField

variable (K : Type) [Field K]

noncomputable instance : Field (LaurentField K) := inferInstanceAs (Field (LaurentSeries K))

noncomputable instance : Algebra K (LaurentField K) :=
  inferInstanceAs (Algebra K (LaurentSeries K))

/-- The `X`-adic valuative relation. -/
noncomputable instance : ValuativeRel (LaurentField K) :=
  ValuativeRel.ofValuation (Valued.v : Valuation (LaurentSeries K) ℤᵐ⁰)

end LaurentField

/-- `K⸨X⸩` over an `n`-dimensional local field is `(n + 1)`-dimensional. -/
theorem isHigherLocalField_laurentField {K : Type} [Field K] [ValuativeRel K] {n : ℕ}
    (h : IsHigherLocalField n K) : IsHigherLocalField (n + 1) (LaurentField K) :=
  sorry

end TauCetiRoadmap.HigherLocalClassFieldTheory
