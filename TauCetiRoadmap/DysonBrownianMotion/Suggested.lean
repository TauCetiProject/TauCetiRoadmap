import Mathlib
import TauCeti.Analysis.Matrix.SpectralMeasure

/-!
# Dyson Brownian motion: target signatures

This file is not the roadmap: the roadmap is `README.md`. This file states the roadmap's
headline theorems that are statable against the pinned Mathlib and Tau Ceti, each with `sorry`,
together with the three definitions their statements need. It writes the noise matrix with
the GOE and GUE coordinates of RandomMatrices §5.1 and uses Tau Ceti's `Matrix.spectralMeasure`.

Stated here: pathwise existence and uniqueness for the Dyson system with real `β ≥ 1` from an
ordered start (Layer 1); the eigenvalue equation from an ordered real diagonal start and the
absence of eigenvalue collisions at positive times from any real diagonal start, for symmetric
and Hermitian matrix Brownian motion (Layer 2); and the hydrodynamic limit of its
empirical spectral measures, uniformly on compact time intervals, with the limit characterized by
its Stieltjes equation (Layer 3). The Dyson noise is additive, so the system is a pathwise
integral identity, `IsDysonSolution`, and needs no stochastic integral.

Not statable at the pins, each for the carrier named:
* adaptedness of the solution to the Brownian filtration (a strong solution) and uniqueness in
  law: they need a filtration-relative Brownian predicate and a weak-solution notion, which
  StochasticCalculus supplies and the pins do not have;
* the identification of the hydrodynamic limit as `ν ⊞ SC_t`: the pins have no free convolution
  of probability measures.
-/

noncomputable section

open MeasureTheory ProbabilityTheory Matrix Filter
open scoped ENNReal NNReal Topology BoundedContinuousFunction

namespace TauCetiRoadmap.DysonBrownianMotion

variable {Ω : Type*}

/-! ## Layer 1: the Dyson system -/

/-- A continuous process, in the open chamber at positive times, solving the Dyson system of size
`n` and parameter `β` from `x`, driven by `B`, as a pathwise integral identity with integrable
drift. Adaptedness to the filtration of `B` is not part of it. -/
def IsDysonSolution [MeasurableSpace Ω] (β : ℝ) (n : ℕ) (x : Fin n → ℝ) (P : Measure Ω)
    (B : Fin n → ℝ≥0 → Ω → ℝ) (X : ℝ≥0 → Ω → Fin n → ℝ) : Prop :=
  ∀ᵐ ω ∂P, Continuous (fun t ↦ X t ω) ∧ (∀ t, 0 < t → StrictAnti (X t ω)) ∧
    ∀ (t : ℝ≥0) (i : Fin n),
      IntervalIntegrable (fun s : ℝ ↦ ∑ j ∈ Finset.univ.erase i,
        (X s.toNNReal ω i - X s.toNNReal ω j)⁻¹) volume 0 t ∧
      X t ω i = x i + Real.sqrt (2 / (β * n)) * B i t ω +
        ∫ s in (0 : ℝ)..t, (n : ℝ)⁻¹ * ∑ j ∈ Finset.univ.erase i,
          (X s.toNNReal ω i - X s.toNNReal ω j)⁻¹

/-- **The Dyson system for `β ≥ 1`** (AGZ Lemma 4.3.3 and Proposition 4.3.5, without the
filtration). From an ordered start, coincident coordinates included, independent Brownian motions
drive a solution that lies in the open chamber at positive times, and any two solutions agree
almost surely. Adaptedness and uniqueness in law are not stated here. -/
theorem dysonSystem_exists_unique [MeasurableSpace Ω] (β : ℝ) (hβ : 1 ≤ β) (n : ℕ)
    (x : Fin n → ℝ) (hx : Antitone x) (P : Measure Ω) [IsProbabilityMeasure P]
    (B : Fin n → ℝ≥0 → Ω → ℝ) (hB : ∀ i, IsBrownianReal (B i) P)
    (hindep : iIndepFun (fun i ω t ↦ B i t ω) P) :
    (∃ X : ℝ≥0 → Ω → Fin n → ℝ, IsDysonSolution β n x P B X) ∧
    ∀ X Y : ℝ≥0 → Ω → Fin n → ℝ, IsDysonSolution β n x P B X → IsDysonSolution β n x P B Y →
      ∀ᵐ ω ∂P, ∀ t, X t ω = Y t ω := by
  sorry

/-! ## Layer 2: matrix Brownian motion and Dyson's theorem -/

/-- The noise matrix built from real coordinates `g`, normalised by `√n`, with the coordinates of
RandomMatrices §5.1. For `β = 1` it is real symmetric with off-diagonal entries `g(i, j)` and
diagonal entries `√2 g(i, i)`; otherwise the entry above the diagonal is
`(g(i, j) + i g(j, i))/√2`, its conjugate sits below, and `g(i, i)` is on the diagonal. -/
def matrixBrownianNoise (β n : ℕ) (g : Fin n × Fin n → ℝ) : Matrix (Fin n) (Fin n) ℂ :=
  Matrix.of fun i j ↦ ((Real.sqrt n)⁻¹ : ℂ) *
    if β = 1 then
      (if i < j then (g (i, j) : ℂ) else if j < i then (g (j, i) : ℂ)
        else (Real.sqrt 2 * g (i, i) : ℝ))
    else
      (if i < j then ((g (i, j) : ℂ) + g (j, i) * Complex.I) / (Real.sqrt 2 : ℂ)
        else if j < i then ((g (j, i) : ℂ) - g (i, j) * Complex.I) / (Real.sqrt 2 : ℂ)
        else (g (i, i) : ℂ))

/-- The noise matrix is Hermitian for every coordinate family. -/
theorem matrixBrownianNoise_isHermitian (β n : ℕ) (g : Fin n × Fin n → ℝ) :
    (matrixBrownianNoise β n g).IsHermitian := by
  ext i j
  simp only [matrixBrownianNoise, conjTranspose_apply, of_apply, star_mul', star_inv₀,
    Complex.star_def, Complex.conj_ofReal]
  rcases lt_trichotomy i j with h | rfl | h
  · split_ifs <;> simp_all [h.not_gt, map_div₀]
  · split_ifs <;> simp_all
  · split_ifs <;> simp_all [Complex.ext_iff, h.not_gt, map_div₀]

/-- Matrix Brownian motion started at the real diagonal matrix `diag d`: at time `t` it is
`diag d + matrixBrownianNoise β n (B · t ω)`, so for independent standard Brownian coordinates
`B` it is real symmetric (`β = 1`) or complex Hermitian (`β ≠ 1`) Brownian motion in the
normalisation of AGZ Definition 4.3.1, and at time `1` from `d = 0` it is GOE or GUE. -/
def matrixBrownian (β n : ℕ) (d : Fin n → ℝ) (B : Fin n × Fin n → ℝ≥0 → Ω → ℝ) (t : ℝ≥0)
    (ω : Ω) : Matrix (Fin n) (Fin n) ℂ :=
  Matrix.diagonal (fun i ↦ (d i : ℂ)) + matrixBrownianNoise β n (fun ij ↦ B ij t ω)

/-- Matrix Brownian motion is Hermitian at every time and for every path. -/
theorem matrixBrownian_isHermitian (β n : ℕ) (d : Fin n → ℝ)
    (B : Fin n × Fin n → ℝ≥0 → Ω → ℝ) (t : ℝ≥0) (ω : Ω) :
    (matrixBrownian β n d B t ω).IsHermitian :=
  (Matrix.isHermitian_diagonal_of_self_adjoint _ (by ext i; simp [Complex.conj_ofReal])).add
    (matrixBrownianNoise_isHermitian β n _)

/-- **No collisions at positive times** (AGZ Theorem 4.3.2, the case of a real diagonal start).
For `β ∈ {1, 2}`, independent standard Brownian coordinates and any real diagonal start, almost
surely the ordered eigenvalues of matrix Brownian motion are distinct at every positive time,
even when entries of `d` coincide. -/
theorem matrixBrownian_eigenvalues_strictAnti [MeasurableSpace Ω] (β : ℕ) (hβ : β = 1 ∨ β = 2)
    (n : ℕ) (d : Fin n → ℝ) (P : Measure Ω) [IsProbabilityMeasure P]
    (B : Fin n × Fin n → ℝ≥0 → Ω → ℝ) (hB : ∀ ij, IsBrownianReal (B ij) P)
    (hindep : iIndepFun (fun ij ω t ↦ B ij t ω) P) :
    ∀ᵐ ω ∂P, ∀ t : ℝ≥0, 0 < t →
      StrictAnti (matrixBrownian_isHermitian β n d B t ω).eigenvalues₀ := by
  sorry

/-- **The eigenvalue equation** (AGZ Theorem 4.3.2, the case of a real diagonal start with
decreasing entries, without the filtration). For `β ∈ {1, 2}` the ordered eigenvalues of matrix
Brownian motion solve the Dyson system for some independent Brownian motions on the same
probability space. -/
theorem matrixBrownian_eigenvalues_dyson [MeasurableSpace Ω] (β : ℕ) (hβ : β = 1 ∨ β = 2)
    (n : ℕ) (d : Fin n → ℝ) (hd : Antitone d) (P : Measure Ω) [IsProbabilityMeasure P]
    (B : Fin n × Fin n → ℝ≥0 → Ω → ℝ) (hB : ∀ ij, IsBrownianReal (B ij) P)
    (hindep : iIndepFun (fun ij ω t ↦ B ij t ω) P) :
    ∃ W : Fin n → ℝ≥0 → Ω → ℝ, (∀ i, IsBrownianReal (W i) P) ∧
      iIndepFun (fun i ω t ↦ W i t ω) P ∧
      IsDysonSolution (β : ℝ) n d P W (fun t ω i ↦
        (matrixBrownian_isHermitian β n d B t ω).eigenvalues₀ (Fin.cast (by simp) i)) := by
  sorry

/-! ## Layer 3: the hydrodynamic limit -/

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
