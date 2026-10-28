/-
Copyright (c) 2026 Kim Morrison. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
-/
import Mathlib
import TauCeti.Algebra.TemperleyLieb.MarkovTrace

/-!
# Subfactors: target signatures

The roadmap is `README.md`; this file is not the roadmap and is not exhaustive. It states
interfaces that are statable against the pinned Mathlib and Tau Ceti.

Stated here (Layer 3): the index-parameter conclusion from a family of trace-preserving
TL actions into star-algebras with positive linear functionals. The positivity classification is an explicit
theorem argument supplied by TemperleyLiebOperatorAlgebras A4. The receiving algebras and
actions are arguments too; the actual Jones-tower construction remains Layer 2 and 3.4 work.
This proves the transfer step without assuming an injective action. It neither redeclares
nor proves the independent TL positivity classification. The separate roadmap prototypes
need not be imported before their future implementation modules exist.

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

/-! ## Layer 3: the index restriction from a trace-preserving TL action -/

/-- The numerical conclusion of the index argument. `hTL` is the positivity classification
supplied by TemperleyLiebOperatorAlgebras A4. For a Jones tower the actions `ρ` and their trace
comparisons are constructed in Subfactors 3.4, with `δ² = [M:N]`. No injectivity hypothesis is
needed. The present theorem proves the transfer and squaring steps; it does not construct a
Jones tower or establish the supplied positivity theorem. -/
theorem indexParameter_mem_of_tl_action {δ : ℝ} (hδ : 0 < δ) (q : ℂˣ)
    (hq : (δ : ℂ) = -((q : ℂ) + ((q⁻¹ : ℂˣ) : ℂ)))
    [∀ n, StarRing (TemperleyLieb ℂ (δ : ℂ) n)]
    (hTL : (∀ (n : ℕ) (x : TemperleyLieb ℂ (δ : ℂ) n),
        0 ≤ markovTrace q hq (star x * x)) →
      2 ≤ δ ∨ ∃ m : ℕ, 3 ≤ m ∧ δ = 2 * Real.cos (Real.pi / (m : ℝ)))
    (B : ℕ → Type*) [∀ n, Ring (B n)] [∀ n, Algebra ℂ (B n)] [∀ n, StarRing (B n)]
    (ρ : ∀ n, TemperleyLieb ℂ (δ : ℂ) n →⋆ₐ[ℂ] B n)
    (σ : ∀ n, B n →ₗ[ℂ] ℂ)
    (hσ : ∀ (n : ℕ) (b : B n), 0 ≤ σ n (star b * b))
    (htrace : ∀ (n : ℕ) (x : TemperleyLieb ℂ (δ : ℂ) n),
      (δ : ℂ) ^ n * σ n (ρ n x) = markovTrace q hq x) :
    (∃ m : ℕ, 3 ≤ m ∧ δ ^ 2 = 4 * Real.cos (Real.pi / (m : ℝ)) ^ 2) ∨ 4 ≤ δ ^ 2 := by
  have hpos : ∀ (n : ℕ) (x : TemperleyLieb ℂ (δ : ℂ) n),
      0 ≤ markovTrace q hq (star x * x) := by
    intro n x
    rw [← htrace n (star x * x)]
    apply mul_nonneg
    · exact pow_nonneg (Complex.zero_le_real.mpr hδ.le) n
    · simpa only [map_mul, map_star] using hσ n (ρ n x)
  rcases hTL hpos with hge | ⟨m, hm, hval⟩
  · right
    nlinarith
  · left
    refine ⟨m, hm, ?_⟩
    rw [hval]
    ring

end TauCetiRoadmap.Subfactors

end
