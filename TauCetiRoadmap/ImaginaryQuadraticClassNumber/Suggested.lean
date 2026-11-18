import Mathlib
import TauCeti.NumberTheory.ClassNumberOne.HeegnerNumbers
import TauCeti.NumberTheory.NumberField.Global.Orders.Discriminant
import TauCeti.NumberTheory.NumberField.Global.Orders.Picard

/-!
# Imaginary quadratic class numbers: target signatures

The roadmap is README.md; this file is not the roadmap. It states the roadmap's headline theorems
against the pinned Mathlib and Tau Ceti, each with `sorry`: Siegel's ineffective lower bound for
`L(1, χ)` over all primitive real characters and its two class-number consequences for every
imaginary quadratic field (H2.4), the class-number-one theorem in its discriminant and radicand
forms (H3.6), and the classification of the thirteen imaginary quadratic orders of Picard number
one (H3.6). Every carrier is native: `NumberField.classNumber`, `NumberField.discr`,
`DirichletCharacter.LFunction`, `TauCeti.heegnerDiscriminants`, `TauCeti.heegnerNumbers` and
`TauCeti.GlobalNumberFields.NumberFieldOrder` with its discriminant and Picard group. No headline
of the roadmap is unstatable at the pins.
-/

noncomputable section
open scoped NumberField
open Polynomial

namespace TauCetiRoadmap.ImaginaryQuadraticClassNumber

universe u

/-! ## H2: Siegel's theorem and uniform finiteness -/

/-- **Siegel's theorem** (H2.4, Davenport Chapter 21). For every `ε > 0` there is `c_ε > 0` with
`c_ε q^(-ε) ≤ Re L(1, χ)` for every primitive nonprincipal real character `χ` modulo `q`. One
constant serves the whole family of conductors; it is ineffective. Native nonvanishing at `1`
gives no such uniformity. -/
theorem quadratic_LFunction_siegel (ε : ℝ) (hε : 0 < ε) :
    ∃ c : ℝ, 0 < c ∧ ∀ (q : ℕ) [NeZero q] (χ : DirichletCharacter ℂ q),
      χ.IsPrimitive → χ.IsQuadratic → χ ≠ 1 →
        c * Real.rpow (q : ℝ) (-ε) ≤ (DirichletCharacter.LFunction χ 1).re := by
  sorry

/-- **The uniform class-number lower bound** (H2.4): for every `ε > 0` there is `C_ε > 0` with
`h(K) ≥ C_ε |disc K|^(1/2 - ε)` for every imaginary quadratic field `K`, from Siegel's theorem
and the pinned class-number formula `h = w √|D| L(1, χ_D) / (2π)` with `w ≥ 2`. The constant is
uniform over every imaginary quadratic field, not over one fixed class group. -/
theorem imaginary_classNumber_lower_bound (ε : ℝ) (hε : 0 < ε) :
    ∃ c : ℝ, 0 < c ∧ ∀ (L : Type u) [Field L] [NumberField L]
      [NumberField.IsTotallyComplex L], Module.finrank ℚ L = 2 →
      c * Real.rpow (|NumberField.discr L| : ℝ) (1 / 2 - ε) ≤
        (NumberField.classNumber L : ℝ) := by
  sorry

/-- **Finiteness of imaginary quadratic fields of bounded class number** (H2.4): for each bound
`B` there is a discriminant bound `C_B`, from the lower bound at `ε = 1/4`; isomorphism and
radicand finiteness follow through H1.1 and Hermite. The bound is ineffective. -/
theorem imaginary_discr_bounded_of_classNumber_le (B : ℕ) :
    ∃ C : ℝ, ∀ (L : Type u) [Field L] [NumberField L]
      [NumberField.IsTotallyComplex L], Module.finrank ℚ L = 2 →
      NumberField.classNumber L ≤ B → (|NumberField.discr L| : ℝ) ≤ C := by
  sorry

/-! ## H3: the nine fields and the thirteen orders -/

variable (K : Type u) [Field K] [NumberField K]

/-- **The class-number-one theorem** (H3.6, Heegner–Stark): an imaginary quadratic field has
class number one exactly when its discriminant is `-3, -4, -7, -8, -11, -19, -43, -67` or
`-163`, the negatives of the pinned `TauCeti.heegnerDiscriminants`. The converse direction is
the pinned `TauCeti.NumberField.classNumber_eq_one_of_mem_heegnerDiscriminants`. -/
theorem classNumber_eq_one_iff_discr_mem [NumberField.IsTotallyComplex K]
    (hdeg : Module.finrank ℚ K = 2) :
    NumberField.classNumber K = 1 ↔
      ∃ n ∈ TauCeti.heegnerDiscriminants, NumberField.discr K = -(n : ℤ) := by
  sorry

/-- **The class-number-one theorem in radicand form** (H3.6): a field presented by an algebraic
integer `θ` with `minpoly ℤ θ = X² - d`, `d` squarefree, has class number one exactly when `-d` is
one of the nine pinned `TauCeti.heegnerNumbers` `1, 2, 3, 7, 11, 19, 43, 67, 163`. Squarefreeness
is needed: `θ = 2i` presents `ℚ(i)` with `d = -4`. -/
theorem classNumber_eq_one_iff_negative_squarefree_mem [NumberField.IsTotallyComplex K]
    (hdeg : Module.finrank ℚ K = 2) (d : ℤ) (θ : 𝓞 K) (hd : Squarefree d)
    (hmin : minpoly ℤ θ = X ^ 2 - C d) (hgen : Algebra.adjoin ℚ {(θ : K)} = ⊤) :
    NumberField.classNumber K = 1 ↔ ∃ n ∈ TauCeti.heegnerNumbers, d = -(n : ℤ) := by
  sorry

/-- **The thirteen imaginary quadratic orders of Picard number one** (H3.6): an order `O` of an
imaginary quadratic field has trivial Picard group exactly when its discriminant is one of
`-3, -4, -7, -8, -11, -12, -16, -19, -27, -28, -43, -67, -163`. From the field theorem and the
pinned conductor criterion `card_pic_intAddMulOrder_eq_one_iff`: the nonmaximal cases are
`f = 2` in `ℚ(√-7)` (discriminant `-28`), `f = 2, 3` in `ℚ(√-3)` (`-12`, `-27`) and `f = 2` in
`ℚ(i)` (`-16`). -/
theorem pic_eq_one_iff_discr_mem [NumberField.IsTotallyComplex K]
    (hdeg : Module.finrank ℚ K = 2) (O : TauCeti.GlobalNumberFields.NumberFieldOrder K) :
    Nat.card (TauCeti.GlobalNumberFields.Pic O) = 1 ↔
      O.discr ∈ ({-3, -4, -7, -8, -11, -12, -16, -19, -27, -28, -43, -67, -163} : Finset ℤ) := by
  sorry

end TauCetiRoadmap.ImaginaryQuadraticClassNumber
