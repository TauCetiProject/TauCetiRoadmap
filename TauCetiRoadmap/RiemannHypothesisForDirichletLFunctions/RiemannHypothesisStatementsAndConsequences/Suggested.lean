import Mathlib
import TauCeti.Analysis.Meromorphic.Continuation
import TauCeti.Analysis.SpecialFunctions.LogIntegral
import TauCeti.NumberTheory.ArithmeticDirichletSeries.Counting
import TauCeti.NumberTheory.ArithmeticDirichletSeries.Prime.Psi

/-!
# Statements of the Riemann hypotheses and their consequences: target signatures

This file is not the roadmap. The definitive document for this folder is `README.md`. This file
states the roadmap's headline theorems against the pinned Mathlib and Tau Ceti, with the
predicates, the instance and the definitions those statements need.

* The Riemann hypothesis for a Dirichlet L-function and its equivalent forms (9.2–9.4): stated,
  with the predicate `ZeroFreeRightOf` read through meromorphic orders, the predicate
  `DirichletCharacter.GeneralizedRiemannHypothesis` on Mathlib's continued
  `DirichletCharacter.LFunction`, and the instance `DirichletCharacter.instNeZeroConductor`, which
  makes the L-function of the primitive character well typed. The predicate is that of
  QuasiRiemannHypothesis §1.1 and the instance that of CharacterSumsOverFiniteFields §7.1; both are
  declared here with the same bodies, since a roadmap's module is not imported.
* The Riesz remainder of a primitive Dirichlet character under a zero-free half-plane (8.4a,
  9.6 (c)): stated, with the Riesz sum `rieszSum`, the bundle `PrimitiveDirichletCharacter` of 10.3
  and its remainder `PrimitiveDirichletCharacter.rieszRemainder`.
* Growth under a zero-free half-plane (9.7): the bounds for the Dedekind zeta function of a number
  field and for the L-function of a primitive ray-class character are stated in terms of the
  records `dedekindZetaData K` and `heckeData ψ` of LFunctions, their continued L-function
  (ZerosOfLFunctions §1.6) and their analytic conductor (ZerosOfLFunctions Layer 2), none of which
  is a declaration at the pins; that form is not stated. The instances at `ℚ` that 9.7 states, the
  bound for `log |ζ(1/2 + it)|` under `RiemannHypothesis` and Littlewood's bounds for `L(1, χ)`, are
  stated.
* Prime counts under a zero-free half-plane (9.9): stated for a number field (9.9 (i)), with Tau
  Ceti's `TauCeti.primePsi`, `TauCeti.primeCount` and `TauCeti.Real.logIntegral` and the Dedekind
  zeta function continued by `TauCeti.meromorphicContinuation`, and as von Koch's theorem at `ℚ`.

The predicates for analytic records, Dedekind zeta functions and ray-class characters (9.3, 9.5),
and the ray-class form of 9.6 (c), are statable with Tau Ceti's
`TauCeti.LFunctions.AnalyticLFunctionData` and `TauCeti.LFunctions.heckeLFunctionC`; they are
ingredients of the number-field statements, not headlines, and are not stated. The Grossencharacter
predicate of 9.5 is not statable: it is read on the record `grossencharacterData` of a
Grossencharacter of LFunctions Layer 6, and the pinned Tau Ceti has neither that carrier nor the
record, only the idele-class characters `TauCeti.GlobalNumberFields.HeckeCharacter`. The argument
bound 9.8 needs the argument lift of ZerosOfLFunctions §7.3, the exceptional zeros of 9.6 (a) the
predicate of ZerosOfLFunctions §6.3, and the Frobenius forms of 8.8a and 9.9 (iii) the reciprocity
dictionary of ZerosOfLFunctions §8.8, none of which is a declaration at the pins. The three-circles
theorem 3.2a, the explicit formula of 8.4a (b), Selberg's formula 8.4b, the independence 8.8, the
ray-class count 9.9 (ii) and the equivalence 11.1 are steps and tools of the routes, not headlines,
and are not stated.
-/

namespace TauCetiRoadmap.RiemannHypothesisForDirichletLFunctions.RiemannHypothesisStatementsAndConsequences

open Filter Asymptotics
open scoped ArithmeticFunction.vonMangoldt

/-! ## Layer 8: Riesz sums, smoothed explicit formulas, abelian character sums -/

/-- The Riesz sum (8.4a (a)): `∑_{1 ≤ n ≤ y} a(n) (y/n − 1)`, which is `0` for `y < 1`. -/
noncomputable def rieszSum (a : ℕ → ℂ) (y : ℝ) : ℂ :=
  ∑ n ∈ Finset.Icc 1 ⌊y⌋₊, a n * ((y : ℂ) / n - 1)

/-! ## Layer 9: Riemann hypotheses as predicates and their conditional consequences -/

/-- `f` is zero-free right of `σ` (QuasiRiemannHypothesis §1.1, used in 9.2): every `s` with
`σ < Re s` has order at most `0`, so that poles are allowed and no value of `f` is read. -/
def ZeroFreeRightOf (σ : ℝ) (f : ℂ → ℂ) : Prop :=
  ∀ s : ℂ, σ < s.re → meromorphicOrderAt f s ≤ 0

/-- The Riemann hypothesis is the absence of zeros of `ζ` right of the critical line, read
through orders (9.3). -/
theorem riemannHypothesis_iff_zeroFreeRightOf :
    RiemannHypothesis ↔ ZeroFreeRightOf (1 / 2) riemannZeta := by
  sorry

/-- The value form of the Riemann hypothesis (9.3); it needs no condition `s ≠ 1`, Mathlib's
value of `riemannZeta` at `1` being nonzero. -/
theorem riemannHypothesis_iff_riemannZeta_ne_zero :
    RiemannHypothesis ↔ ∀ s : ℂ, 1 / 2 < s.re → riemannZeta s ≠ 0 := by
  sorry

/-- The Riemann hypothesis for a Dirichlet character `χ` modulo `N ≥ 1`, primitive or not (9.4):
its continued L-function has no zero right of `1/2`. -/
def _root_.DirichletCharacter.GeneralizedRiemannHypothesis {N : ℕ} [NeZero N]
    (χ : DirichletCharacter ℂ N) : Prop :=
  ZeroFreeRightOf (1 / 2) χ.LFunction

/-- The value form (9.4): no value `L(s, χ)` with `1/2 < Re s` vanishes, the pole of the
principal character at `1` excepted. -/
theorem generalizedRiemannHypothesis_iff_LFunction_ne_zero {N : ℕ} [NeZero N]
    (χ : DirichletCharacter ℂ N) :
    χ.GeneralizedRiemannHypothesis ↔
      ∀ s : ℂ, 1 / 2 < s.re → (χ ≠ 1 ∨ s ≠ 1) → χ.LFunction s ≠ 0 := by
  sorry

/-- The strip form (9.4): every zero of `L(·, χ)` in the open critical strip lies on the critical
line. -/
theorem generalizedRiemannHypothesis_iff_re_eq_half {N : ℕ} [NeZero N]
    (χ : DirichletCharacter ℂ N) :
    χ.GeneralizedRiemannHypothesis ↔
      ∀ ρ : ℂ, 0 < ρ.re → ρ.re < 1 → χ.LFunction ρ = 0 → ρ.re = 1 / 2 := by
  sorry

/-- The hypothesis for the principal character modulo any `N ≥ 1` is `RiemannHypothesis` (9.4). -/
theorem generalizedRiemannHypothesis_one_iff (N : ℕ) [NeZero N] :
    (1 : DirichletCharacter ℂ N).GeneralizedRiemannHypothesis ↔ RiemannHypothesis := by
  sorry

/-- The hypothesis for every Dirichlet character is the hypothesis for every primitive one (9.4). -/
theorem forall_generalizedRiemannHypothesis_iff_forall_isPrimitive :
    (∀ (N : ℕ) [NeZero N] (χ : DirichletCharacter ℂ N), χ.GeneralizedRiemannHypothesis) ↔
      ∀ (N : ℕ) [NeZero N] (χ : DirichletCharacter ℂ N), χ.IsPrimitive →
        χ.GeneralizedRiemannHypothesis := by
  sorry

/-- The conductor of a Dirichlet character over a nonzero level is nonzero, as an instance
(CharacterSumsOverFiniteFields §7.1, from Mathlib's `DirichletCharacter.conductor_ne_zero`); it
makes `χ.primitiveCharacter.LFunction` well typed. -/
instance _root_.DirichletCharacter.instNeZeroConductor {R : Type*} [CommMonoidWithZero R] {N : ℕ}
    [NeZero N] (χ : DirichletCharacter R N) : NeZero χ.conductor :=
  ⟨χ.conductor_ne_zero⟩

/-- A Dirichlet character and its primitive character satisfy the hypothesis together (9.4). -/
theorem generalizedRiemannHypothesis_primitiveCharacter_iff {N : ℕ} [NeZero N]
    (χ : DirichletCharacter ℂ N) :
    χ.primitiveCharacter.GeneralizedRiemannHypothesis ↔ χ.GeneralizedRiemannHypothesis := by
  sorry

/-! ## Layer 10: Primitive Dirichlet characters, conductors and gamma factors -/

/-- A primitive Dirichlet character bundled with its conductor (10.3): a level, a character of that
level and a proof that it is primitive. -/
structure PrimitiveDirichletCharacter where
  /-- The level, which is the conductor. -/
  level : ℕ+
  /-- The character. -/
  character : DirichletCharacter ℂ level
  /-- The character is primitive. -/
  isPrimitive : character.IsPrimitive

/-- The Riesz remainder of a primitive Dirichlet character (8.4a (b)):
`∑_{n ≤ y} Λ(n) χ(n) (y/n − 1) + y · L′/L(1, χ)` for `χ ≠ 1`, and
`∑_{n ≤ y} Λ(n) (y/n − 1) − y log y + (1 + γ) y` at level `1`. -/
noncomputable def PrimitiveDirichletCharacter.rieszRemainder (χ : PrimitiveDirichletCharacter)
    (y : ℝ) : ℂ :=
  if χ.level = 1 then
    rieszSum (fun n ↦ (Λ n : ℂ)) y - y * Real.log y + (1 + Real.eulerMascheroniConstant) * y
  else
    rieszSum (fun n ↦ (Λ n : ℂ) * χ.character n) y + y * logDeriv χ.character.LFunction 1

/-! ## Layer 9: consequences -/

/-- The Riesz remainder under a zero-free half-plane (9.6 (c)): if `L(·, χ)` is zero-free right of
`σ ∈ [1/2, 1)`, then `‖rieszRemainder χ y‖ ≤ C y^σ` for `y ≥ 2`. -/
theorem PrimitiveDirichletCharacter.norm_rieszRemainder_le_of_zeroFreeRightOf
    (χ : PrimitiveDirichletCharacter) {σ : ℝ} (hσ : σ ∈ Set.Ico (1 / 2 : ℝ) 1)
    (h : ZeroFreeRightOf σ χ.character.LFunction) :
    ∃ C : ℝ, ∀ y : ℝ, 2 ≤ y → ‖χ.rieszRemainder y‖ ≤ C * y ^ σ := by
  sorry

/-- Under the Riemann hypothesis, `log |ζ(1/2 + it)| ≤ C log |t|/log log |t|` for `|t| ≥ 16`
(9.7 (ii), at `ℚ`). -/
theorem log_norm_riemannZeta_le_of_riemannHypothesis (h : RiemannHypothesis) :
    ∃ C : ℝ, ∀ t : ℝ, 16 ≤ |t| →
      Real.log ‖riemannZeta (1 / 2 + t * Complex.I)‖ ≤
        C * Real.log |t| / Real.log (Real.log |t|) := by
  sorry

/-- Littlewood's bounds (9.7 (ii) (d), at `ℚ`): with one absolute constant `C`, every primitive
`χ ≠ 1` modulo `q ≥ 3` satisfying its hypothesis has `(C log log q)⁻¹ ≤ |L(1, χ)| ≤ C log log q`
and `|L′/L(1, χ)| ≤ C log log q`. -/
theorem LFunction_one_bounds_of_generalizedRiemannHypothesis :
    ∃ C : ℝ, ∀ (q : ℕ) [NeZero q] (χ : DirichletCharacter ℂ q), 3 ≤ q → χ.IsPrimitive → χ ≠ 1 →
      χ.GeneralizedRiemannHypothesis →
        (C * Real.log (Real.log q))⁻¹ ≤ ‖χ.LFunction 1‖ ∧
          ‖χ.LFunction 1‖ ≤ C * Real.log (Real.log q) ∧
          ‖logDeriv χ.LFunction 1‖ ≤ C * Real.log (Real.log q) := by
  sorry

/-- Prime counts of a number field under a zero-free half-plane (9.9 (i)): if the continued
Dedekind zeta function of `K` is zero-free right of `σ ∈ [1/2, 1)`, then
`ψ_K(x) = x + O(x^σ log² x)` and `π_K(x) = Li x + O(x^σ log x)`, with a constant and a threshold
that depend on `K` and not on `σ`. -/
theorem primePsi_primeCount_of_zeroFreeRightOf (K : Type*) [Field K] [NumberField K] :
    ∃ C x₀ : ℝ, ∀ σ ∈ Set.Ico (1 / 2 : ℝ) 1,
      ZeroFreeRightOf σ (TauCeti.meromorphicContinuation 1 (NumberField.dedekindZeta K)) →
        ∀ x ≥ x₀, |TauCeti.primePsi K Set.univ x - x| ≤ C * x ^ σ * Real.log x ^ 2 ∧
          |TauCeti.primeCount K Set.univ x - TauCeti.Real.logIntegral x| ≤
            C * x ^ σ * Real.log x := by
  sorry

/-- Von Koch (9.9, at `ℚ`): under the Riemann hypothesis, `ψ(x) − x = O(√x log² x)`. -/
theorem psi_sub_self_isBigO_sqrt_mul_log_sq_of_riemannHypothesis (h : RiemannHypothesis) :
    (fun x : ℝ ↦ Chebyshev.psi x - x) =O[atTop] fun x ↦ √x * Real.log x ^ 2 := by
  sorry

/-- Von Koch (9.9, at `ℚ`): under the Riemann hypothesis, `π(x) − Li x = O(√x log x)`. -/
theorem primeCounting_sub_logIntegral_isBigO_of_riemannHypothesis (h : RiemannHypothesis) :
    (fun x : ℝ ↦ (Nat.primeCounting ⌊x⌋₊ : ℝ) - TauCeti.Real.logIntegral x) =O[atTop]
      fun x ↦ √x * Real.log x := by
  sorry

end TauCetiRoadmap.RiemannHypothesisForDirichletLFunctions.RiemannHypothesisStatementsAndConsequences
