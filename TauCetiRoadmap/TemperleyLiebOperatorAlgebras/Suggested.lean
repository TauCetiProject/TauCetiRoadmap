/-
Copyright (c) 2026 Kim Morrison. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
-/
import Mathlib
import TauCeti.Algebra.TemperleyLieb.MarkovTrace

/-!
# Temperley–Lieb operator algebras: target signatures

The roadmap is `README.md`; this file is not the roadmap. It states the roadmap's headline
theorems against the pinned Mathlib and Tau Ceti, each with `sorry`.

The one headline statable at the pins is the negative-loop-parameter positivity theorem of
Layer 2 (`markovTrace_neg_one_pow_nonneg_iff`): for `δ < 0` the signed closure forms
`(-1)^n T_n(x† x)` are nonnegative at every level exactly when `|δ|` is a Jones loop parameter.
It is stated on Tau Ceti's presentation `TauCeti.TemperleyLieb ℂ δ n` with its Markov trace,
for an arbitrary conjugate-linear star fixing the generators, which Subfactors 3.1 constructs
and proves unique. The positive-parameter theorem itself, `markovTrace_nonneg_iff`, is
Subfactors 3.2's headline and is not restated here.

Not statable at the pins:

* Layer 1's comparisons (the analytic adjoint against the vertical reflection of diagrams, the
  Hermitian cell forms against the bilinear cell forms, the trace radical against the negligible
  ideal, the path model against the block idempotents): they need the diagram category, cell
  modules, Jones–Wenzl projections and negligible ideal of TemperleyLieb Layers 3–7, none of
  which exist at the pins.
* Layer 2's Bratteli-diagram presentation of the Jones tower: it needs Subfactors 3.3's
  C*-inductive limit `B_δ` and CStarClassification CL2's Bratteli diagrams, neither at the pins.
* Layer 3's unitary Temperley–Lieb category and its C*-tensor and unitary-duality axioms: they
  need the diagram category and CategoricalOperatorAlgebras CA1a and CA2a.
* Layer 4's affine classification and affine Gram determinant: no affine diagram category or
  algebra exists at the pins.
-/

noncomputable section

open scoped ComplexOrder

namespace TauCetiRoadmap.TemperleyLiebOperatorAlgebras

open TauCeti TauCeti.TemperleyLieb

/-! ## Layer 2: Sign isomorphism and negative loop parameters -/

/-- **Positivity at negative loop parameters.** Let `δ < 0` be real and let `q` be a unit with
`δ = -(q + q⁻¹)`, the sign convention of `TauCeti.TemperleyLieb.markovTrace`. Give each
`TL_n(ℂ, δ)` a conjugate-linear star-ring structure fixing the generators (Subfactors 3.1
constructs it and proves it unique). Then the signed closure forms `(-1)^n T_n(x† x)` are real
and nonnegative for every `n` and every `x` exactly when `|δ| = -δ` lies in the Jones loop
parameters `{2cos(π/m) : m ≥ 3} ∪ [2,∞)`. The sign isomorphism `TL_n(δ) ≅ TL_n(-δ)`,
`e_i ↦ -e_i`, carries `T_n^δ` to `(-1)^n T_n^(-δ)`, and the theorem then reduces to Subfactors
3.2's `markovTrace_nonneg_iff` at the parameter `-δ > 0`. The sign of the trace is Penneys,
*Unitary Quantum Symmetries Lite*, Chapter 4, Facts 4.4.14 (TB6), printed p. 155. -/
theorem markovTrace_neg_one_pow_nonneg_iff {δ : ℝ} (hδ : δ < 0) (q : ℂˣ)
    (hq : (δ : ℂ) = -((q : ℂ) + ((q⁻¹ : ℂˣ) : ℂ)))
    [∀ n, StarRing (TemperleyLieb ℂ (δ : ℂ) n)] [∀ n, StarModule ℂ (TemperleyLieb ℂ (δ : ℂ) n)]
    (he : ∀ (n : ℕ) (i : Fin (n - 1)), star (e (δ : ℂ) i) = e (δ : ℂ) i) :
    (∀ (n : ℕ) (x : TemperleyLieb ℂ (δ : ℂ) n),
        0 ≤ (-1 : ℂ) ^ n * markovTrace q hq (star x * x)) ↔
      (∃ m : ℕ, 3 ≤ m ∧ -δ = 2 * Real.cos (Real.pi / m)) ∨ 2 ≤ -δ := by
  sorry

end TauCetiRoadmap.TemperleyLiebOperatorAlgebras

end
