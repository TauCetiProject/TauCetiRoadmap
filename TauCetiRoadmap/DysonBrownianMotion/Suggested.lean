import Mathlib
import TauCeti.Analysis.Matrix.SpectralMeasure
import TauCetiRoadmap.RandomMatrices.Suggested

/-!
# Dyson Brownian motion: target signatures

This file is not the roadmap: the roadmap is `README.md`. This file states the roadmap's
headline theorems that are statable against the pinned Mathlib and Tau Ceti, each with `sorry`,
together with the one definition their statements need. It imports the RandomMatrices
prototype for `gaussianEnsemble` and uses Tau Ceti's `Matrix.spectralMeasure`.

Stated here: the absence of eigenvalue collisions at positive times for symmetric and Hermitian
matrix Brownian motion started at a real diagonal matrix (Layer 2), and the hydrodynamic limit
of its empirical spectral measures, uniformly on compact time intervals, with the limit
characterized by its Stieltjes equation (Layer 3).

Not statable at the pins, each for the carrier named:
* the `β ≥ 1` particle system of Layer 1 and the eigenvalue stochastic differential equation of
  Layer 2: Mathlib has no Itô integral and no strong solution of a stochastic differential
  equation;
* the identification of the hydrodynamic limit as `ν ⊞ SC_t`: Mathlib has no free convolution.
-/

noncomputable section

open MeasureTheory ProbabilityTheory Matrix Filter
open scoped ENNReal NNReal Topology BoundedContinuousFunction

namespace TauCetiRoadmap.DysonBrownianMotion

open TauCetiRoadmap.RandomMatrices

variable {Ω : Type*}

/-- Matrix Brownian motion started at the real diagonal matrix `diag d`: at time `t` it is
`diag d + gaussianEnsemble β n (B · t ω)`, so for independent standard Brownian coordinates `B`
it is real symmetric (`β = 1`) or complex Hermitian (`β ≠ 1`) Brownian motion in the
normalisation of AGZ Definition 4.3.1, and at time `1` from `d = 0` it is GOE or GUE. -/
def matrixBrownian (β n : ℕ) (d : Fin n → ℝ) (B : Fin n × Fin n → ℝ≥0 → Ω → ℝ) (t : ℝ≥0)
    (ω : Ω) : Matrix (Fin n) (Fin n) ℂ :=
  Matrix.diagonal (fun i ↦ (d i : ℂ)) + gaussianEnsemble β n (fun ij ↦ B ij t ω)

/-- Matrix Brownian motion is Hermitian at every time and for every path. -/
theorem matrixBrownian_isHermitian (β n : ℕ) (d : Fin n → ℝ)
    (B : Fin n × Fin n → ℝ≥0 → Ω → ℝ) (t : ℝ≥0) (ω : Ω) :
    (matrixBrownian β n d B t ω).IsHermitian :=
  (Matrix.isHermitian_diagonal_of_self_adjoint _ (by ext i; simp [Complex.conj_ofReal])).add
    (gaussianEnsemble_isHermitian β n _)

/-- **No collisions at positive times** (AGZ Theorem 4.3.2). For `β ∈ {1, 2}`, independent
standard Brownian coordinates and any real diagonal start, almost surely the ordered eigenvalues
of matrix Brownian motion are distinct at every positive time, even when entries of `d`
coincide. -/
theorem matrixBrownian_eigenvalues_strictAnti [MeasurableSpace Ω] (β : ℕ) (hβ : β = 1 ∨ β = 2)
    (n : ℕ) (d : Fin n → ℝ) (P : Measure Ω) [IsProbabilityMeasure P]
    (B : Fin n × Fin n → ℝ≥0 → Ω → ℝ) (hB : ∀ ij, IsBrownianReal (B ij) P)
    (hindep : iIndepFun (fun ij ω t ↦ B ij t ω) P) :
    ∀ᵐ ω ∂P, ∀ t : ℝ≥0, 0 < t →
      StrictAnti (matrixBrownian_isHermitian β n d B t ω).eigenvalues₀ := by
  sorry

/-- **Hydrodynamic limit** (AGZ Proposition 4.3.10 and Corollary 4.3.11). For `β ∈ {1, 2}` let
the starting diagonals `dₙ` have empirical measures converging weakly to `ν` with
`sup_n n⁻¹ ∑ᵢ log(1 + dₙ(i)²) < ∞`. Then there is a family `μ` of probability measures with
`μ₀ = ν` whose Stieltjes transforms `G_t(z) = ∫ (z - x)⁻¹ dμ_t(x)` satisfy
`G_t(z) = G_0(z) - ∫₀ᵗ G_s(z) G_s'(z) ds` off the real line, and for every `T` and `ε > 0` the
probability that the Lévy–Prokhorov distance between the empirical spectral measure at some
time `t ≤ T` and `μ_t` exceeds `ε` tends to `0`. -/
theorem matrixBrownian_hydrodynamic_limit [MeasurableSpace Ω] (β : ℕ) (hβ : β = 1 ∨ β = 2)
    (d : ∀ n : ℕ, Fin (n + 1) → ℝ) (ν : Measure ℝ) [IsProbabilityMeasure ν]
    (hd : ∀ f : ℝ →ᵇ ℝ, Tendsto (fun n ↦ ((n + 1 : ℕ) : ℝ)⁻¹ * ∑ i, f (d n i)) atTop
      (𝓝 (∫ x, f x ∂ν)))
    (hlog : ∃ C : ℝ, ∀ n, ((n + 1 : ℕ) : ℝ)⁻¹ * ∑ i, Real.log (1 + d n i ^ 2) ≤ C)
    (P : Measure Ω) [IsProbabilityMeasure P]
    (B : ∀ n : ℕ, Fin (n + 1) × Fin (n + 1) → ℝ≥0 → Ω → ℝ)
    (hB : ∀ n ij, IsBrownianReal (B n ij) P)
    (hindep : ∀ n, iIndepFun (fun ij ω t ↦ B n ij t ω) P) :
    ∃ μ : ℝ≥0 → Measure ℝ, (∀ t, IsProbabilityMeasure (μ t)) ∧ μ 0 = ν ∧
      (∀ z : ℂ, z.im ≠ 0 → ∀ t : ℝ≥0,
        ∫ x, (z - x)⁻¹ ∂μ t = ∫ x, (z - x)⁻¹ ∂ν -
          ∫ s in (0 : ℝ)..t, (∫ x, (z - x)⁻¹ ∂μ s.toNNReal) *
            deriv (fun w : ℂ ↦ ∫ x : ℝ, (w - x)⁻¹ ∂μ s.toNNReal) z) ∧
      ∀ T : ℝ≥0, ∀ ε : ℝ, 0 < ε →
        Tendsto (fun n ↦ P {ω | ∃ t ≤ T, ε < levyProkhorovDist
            (Matrix.spectralMeasure (matrixBrownian β (n + 1) (d n) (B n) t ω)
              (matrixBrownian_isHermitian β (n + 1) (d n) (B n) t ω) : Measure ℝ) (μ t)})
          atTop (𝓝 0) := by
  sorry

end TauCetiRoadmap.DysonBrownianMotion
