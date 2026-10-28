/-
Copyright (c) 2026 Kim Morrison. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
-/
import Mathlib
import TauCeti.Algebra.TemperleyLieb.MarkovTrace

/-!
# Subfactors: target signatures

The roadmap is `README.md`; this file is not the roadmap. It states the roadmap's headline
theorems that are statable against the pinned Mathlib and Tau Ceti, each with `sorry`.

Stated here (Layer 3): Jones's positivity theorem for the Temperley–Lieb closure trace, in its
all-level form and in its first-bad-level form. The trace is Tau Ceti's
`TauCeti.TemperleyLieb.markovTrace`. The analytic adjoint is an argument of the statement, as a
conjugate-linear star-ring structure fixing every generator. For real `δ` exactly one such
structure exists, and Layer 3.1 constructs it.

Not statable at the pins, because the carrier named in parentheses is missing:

* Jones index restriction, `[M:N] ∈ {4cos²(π/m) : m ≥ 3} ∪ [4,∞]` for every II₁ subfactor
  (Layer 3). Mathlib has `VonNeumannAlgebra`, but no II₁ factor, no faithful normal tracial
  state, no coupling dimension and no Jones index.
* Realisation of every allowed index in the hyperfinite II₁ factor (Layer 4). There is no
  hyperfinite II₁ factor and no Jones index.
* Connes fusion and its coherence, the basic construction, Pimsner–Popa bases, the minimal
  index and statistical dimension (Layers 1–2). There are no normal correspondences, no
  standard form and no conditional expectation onto a von Neumann subalgebra.
* The Pimsner–Popa entropy formula and its equality criteria (Layer 2). There is no normal
  trace on a von Neumann algebra and no trace-preserving conditional expectation.
* Ocneanu compactness and the principal-graph bounds (Layers 4–5). There are no commuting
  squares, no weak-closure tower and no standard invariant.
* Planar-algebra reconstruction, the Burns rigid–spherical correspondence and the embedding
  theorems (Layers 6–8). There is no shaded planar operad and no planar algebra.
* Popa's classification of finite-depth hyperfinite inclusions and the ADE list below
  index 4 (Layer 9). There is no standard invariant and no Popa standard model.
* Penneys's extended-cone tangle action and the Burns rotation theorems, and Burns's type III
  relative-commutant example (Layer 10). There is no extended positive cone and no Connes
  fusion of bimodules over a II₁ factor.
-/

noncomputable section

open scoped ComplexOrder

namespace TauCetiRoadmap.Subfactors

open TauCeti TauCeti.TemperleyLieb

/-! ## Layer 3: Temperley–Lieb positivity and Jones index restriction -/

/-- The admissible loop parameters `{2cos(π/m) : m ≥ 3} ∪ [2,∞)`. A positive real `δ` lies in
this set exactly when the Temperley–Lieb closure trace with loop value `δ` is positive at every
level. The Jones index values `4cos²(π/m)` and `[4,∞)` are the squares `δ²` of its members. -/
def jonesLoopParameters : Set ℝ :=
  {δ | (∃ m : ℕ, 3 ≤ m ∧ δ = 2 * Real.cos (Real.pi / m)) ∨ 2 ≤ δ}

/-- **Jones's positivity theorem.** Let `δ > 0`, and let `q` be a unit with `δ = -(q + q⁻¹)`,
the sign convention of `TauCeti.TemperleyLieb.markovTrace`. Give each Temperley–Lieb algebra
`TL_n(ℂ, δ)` a conjugate-linear star-ring structure fixing the generators. Then the closure
trace `T_n(x⋆x)` is real and nonnegative for every `n` and every `x` exactly when `δ` is
admissible. Necessity is Penneys, *Unitary Quantum Symmetries Lite*, Chapter 4,
Theorem 4.3.17, printed p. 150. Sufficiency uses the positive path weights of §§4.4–4.5 there. -/
theorem markovTrace_nonneg_iff {δ : ℝ} (hδ : 0 < δ) (q : ℂˣ)
    (hq : (δ : ℂ) = -((q : ℂ) + ((q⁻¹ : ℂˣ) : ℂ)))
    [∀ n, StarRing (TemperleyLieb ℂ (δ : ℂ) n)] [∀ n, StarModule ℂ (TemperleyLieb ℂ (δ : ℂ) n)]
    (he : ∀ (n : ℕ) (i : Fin (n - 1)), star (e (δ : ℂ) i) = e (δ : ℂ) i) :
    (∀ (n : ℕ) (x : TemperleyLieb ℂ (δ : ℂ) n), 0 ≤ markovTrace q hq (star x * x)) ↔
      δ ∈ jonesLoopParameters := by
  sorry

/-- **The first bad level.** Let `0 < δ < 2` be inadmissible, write `δ = 2cos θ` with
`0 < θ < π/2`, and put `k = ⌊π/θ⌋`. Then the closure trace on `TL_n(ℂ, δ)` is positive
semidefinite exactly when `n < k`. The witness at level `k` is the Jones–Wenzl projection
`f_k`, whose trace is the negative quantum integer `[k+1]`. Its image at every higher level stays
negative, because adding a strand multiplies the trace by `δ > 0`. The value of `k` is
Penneys, *Unitary Quantum Symmetries Lite*, Chapter 4, Lemma 4.3.8, and positivity below `k`
is the semisimple tree-basis trace of §4.4 there. -/
theorem markovTrace_nonneg_iff_lt_floor {δ : ℝ} (hδ₀ : 0 < δ) (hδ₂ : δ < 2)
    (hδ : δ ∉ jonesLoopParameters) (q : ℂˣ) (hq : (δ : ℂ) = -((q : ℂ) + ((q⁻¹ : ℂˣ) : ℂ)))
    (n : ℕ) [StarRing (TemperleyLieb ℂ (δ : ℂ) n)] [StarModule ℂ (TemperleyLieb ℂ (δ : ℂ) n)]
    (he : ∀ i : Fin (n - 1), star (e (δ : ℂ) i) = e (δ : ℂ) i) :
    (∀ x : TemperleyLieb ℂ (δ : ℂ) n, 0 ≤ markovTrace q hq (star x * x)) ↔
      n < ⌊Real.pi / Real.arccos (δ / 2)⌋₊ := by
  sorry

end TauCetiRoadmap.Subfactors

end
