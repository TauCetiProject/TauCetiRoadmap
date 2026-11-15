module

public import Mathlib
public import TauCeti.Probability.Distributions.ChiSquared.Basic
public import TauCeti.Probability.Distributions.Gaussian.Projection
public import TauCeti.Probability.Distributions.Gaussian.Conditional.Basic
public import TauCeti.Probability.Distributions.MarchenkoPastur.Basic
public import TauCeti.InformationTheory.KullbackLeibler.Pinsker
public import TauCeti.Analysis.Matrix.SampleSecondMoment
public import TauCeti.Analysis.Matrix.EntrywiseOpNorm
public import TauCeti.Analysis.InnerProductSpace.CourantFischer
public import TauCeti.Analysis.InnerProductSpace.UnitarilyInvariantSeminorm.KyFan
public import TauCeti.Analysis.InnerProductSpace.UnitarilyInvariantSeminorm.Frobenius
public import TauCeti.Analysis.InnerProductSpace.UnitarilyInvariantSeminorm.SinTheta.Basic
public import TauCeti.Analysis.InnerProductSpace.UnitarilyInvariantSeminorm.OpNorm
public import TauCeti.Analysis.Convex.Subdifferential
public import TauCeti.Analysis.Normed.Module.CoveringNumber

/-!
# High-dimensional statistics: target signatures

This file is not the roadmap: the roadmap is `README.md`, and this file is not an exhaustive
checklist. It states, against the pinned Mathlib and Tau Ceti and each with `sorry`, the
headlines of Layers 1–8 that the README gives a Lean name, each with every conclusion the README
attaches to it, together with the definitions their statements need. Every headline whose
carriers exist at the pins is stated. The bullets of the README without a Lean name are results
consumed from other roadmaps (the Gaussian divergence and the one-coordinate soft-threshold
bounds of `MathematicalStatisticsNonparametric`, 1.3 and 6.4), definitions given in prose, or
facts about a single definition that follow in one step from it (the translation of the sample
covariance into `sampleSecondMoment`, the closed form of `spikeOverlap`, the ridge solution on an
orthogonal design, the `∞ → ∞` row-sum bound, the binomial bound `C(p, k) ≤ (ep/k)^k`, the
identification of the step-up count for `β(k) = k` with the Benjamini–Hochberg count, the limits
of the Tracy–Widom centring and scaling, and the range and limits of `spikeOverlap`); these are
API lemmas, not headlines.

The conventions of the README are used throughout: parameters live in `EuclideanSpace ℝ ι`, a
design `X : Matrix (Fin n) ι ℝ` acts by `Matrix.toEuclideanLin`, the lasso objective is
`‖y - Xβ‖²/(2n) + λ‖β‖₁`, sub-Gaussian noise means Mathlib's `HasSubgaussianMGF` with variance
proxy `σ²`, minimax risks are Mathlib's `minimaxRisk`, and the false discovery proportion is
`V / max(R, 1)`. Probabilistic lasso theorems are deterministic statements on an event together
with a bound for the probability of the event.

The restricted `ℓ¹` norm, the best `s`-sparse `ℓ¹` error and the restricted isometry property
are owned by `MathematicalStatisticsFoundations` (9.3), the
soft-threshold map and its one-coordinate risk by `MathematicalStatisticsNonparametric` (6.4), and
the sub-exponential definition by `RandomMatrices` (§2.1); they appear here as local copies. The
implementation namespace of the README is `TauCeti`; the prototypes live in this roadmap's
namespace. The block of `#check` commands at the end pins the library declarations the README
cites.
-/

@[expose] public section

noncomputable section

open MeasureTheory ProbabilityTheory Filter Set Topology
open scoped ENNReal NNReal RealInnerProductSpace Matrix

namespace TauCetiRoadmap.MathematicalStatisticsHighDimensional

attribute [local instance] Classical.propDecidable

/-! ## Shared vocabulary (local copies) -/

section Vocabulary

variable {ι : Type*} [Fintype ι]

/-- The restricted `ℓ¹` norm `∑_{j ∈ S} |xⱼ|`. Local copy: owned by
`MathematicalStatisticsFoundations`, 9.3. On `Finset.univ` it is the `ℓ¹` norm. -/
def restrictedL1Norm (S : Finset ι) (x : EuclideanSpace ℝ ι) : ℝ :=
  ∑ j ∈ S, |x j|

/-- The restricted isometry property of order `s` and constant `δ`. Local copy: owned by
`MathematicalStatisticsFoundations`, 9.3. -/
def HasRIP {m : Type*} [Fintype m] (A : Matrix m ι ℝ) (s : ℕ) (δ : ℝ) : Prop :=
  ∀ x : EuclideanSpace ℝ ι, hammingNorm (WithLp.ofLp x) ≤ s →
    (1 - δ) * ‖x‖ ^ 2 ≤ ‖Matrix.toEuclideanLin A x‖ ^ 2 ∧
      ‖Matrix.toEuclideanLin A x‖ ^ 2 ≤ (1 + δ) * ‖x‖ ^ 2

/-- The best `s`-sparse `ℓ¹` error `σₛ(x)₁`. Local copy: owned by
`MathematicalStatisticsFoundations`, 9.3. -/
def bestSparseL1Error (s : ℕ) (x : EuclideanSpace ℝ ι) : ℝ :=
  ⨅ y : {y : EuclideanSpace ℝ ι // hammingNorm (WithLp.ofLp y) ≤ s},
    restrictedL1Norm Finset.univ (x - y.1)

/-- The soft-threshold map `η_λ(y) = sign(y)(|y| - λ)₊`. Local copy: owned by
`MathematicalStatisticsNonparametric`, 6.4. -/
def softThreshold (l y : ℝ) : ℝ :=
  Real.sign y * max (|y| - l) 0

/-- The `j`-th column of a design, as a vector of `EuclideanSpace ℝ (Fin n)`. -/
def designCol {n : ℕ} (X : Matrix (Fin n) ι ℝ) (j : ι) : EuclideanSpace ℝ (Fin n) :=
  WithLp.toLp 2 (fun i ↦ X i j)

end Vocabulary

/-! ## Layer 1: probabilistic and linear-algebra toolkit -/

section Layer1

variable {Ω : Type*} [MeasurableSpace Ω] {μ : Measure Ω}

/-- **1.1** A centred Gaussian variable of variance `v` is sub-Gaussian with proxy `v`. -/
theorem hasSubgaussianMGF_gaussianReal {X : Ω → ℝ} {v : ℝ≥0}
    (hX : HasLaw X (gaussianReal 0 v) μ) : HasSubgaussianMGF X v μ := sorry

/-- **1.1** Maximal inequality for finitely many sub-Gaussian variables, without independence.
The exceedance is strict, so that the proxy-zero case (`Zⱼ = 0` a.e.) is covered. -/
theorem measure_max_abs_gt_le [IsProbabilityMeasure μ] {N : ℕ} [NeZero N] {Z : Fin N → Ω → ℝ}
    {c : ℝ≥0} (hZ : ∀ j, HasSubgaussianMGF (Z j) c μ) {t : ℝ} (ht : 0 ≤ t) :
    μ.real {ω | √(2 * c * (Real.log N + t)) <
      Finset.univ.sup' Finset.univ_nonempty (fun j ↦ |Z j ω|)} ≤ 2 * Real.exp (-t) := sorry

/-- **1.1** A sub-Gaussian random vector with proxy `c`: every linear form `⟪u, x⟫` is
sub-Gaussian with proxy `c‖u‖²`. -/
def IsSubgaussianVector {E : Type*} [NormedAddCommGroup E] [InnerProductSpace ℝ E]
    (μ : Measure Ω) (x : Ω → E) (c : ℝ≥0) : Prop :=
  ∀ u : E, HasSubgaussianMGF (fun ω ↦ ⟪u, x ω⟫) (c * ‖u‖₊ ^ 2) μ

/-- **1.2** The upper chi-squared tail (Boucheron–Lugosi–Massart, §2.4 and Example 2.7). -/
theorem chiSquared_tail_upper (k : ℕ) {t : ℝ} (ht : 0 ≤ t) :
    (TauCeti.Probability.chiSquaredMeasure k).real
      {z | k + 2 * √(k * t) + 2 * t ≤ z} ≤ Real.exp (-t) := sorry

/-- **1.2** The lower chi-squared tail. The event is strict, so that `k = 0`
(`chiSquaredMeasure 0 = dirac 0`) is covered. -/
theorem chiSquared_tail_lower (k : ℕ) {t : ℝ} (ht : 0 ≤ t) :
    (TauCeti.Probability.chiSquaredMeasure k).real
      {z | z < k - 2 * √(k * t)} ≤ Real.exp (-t) := sorry

/-- A sub-exponential variable with parameter `K > 0`: `exp(t(X - EX))` is integrable and
`E exp(t(X - EX)) ≤ exp(K²t²)` for `|t| ≤ 1/K`. Local copy: owned by `RandomMatrices`, §2.1. -/
def IsSubexponential (μ : Measure Ω) (X : Ω → ℝ) (K : ℝ) : Prop :=
  0 < K ∧ ∀ t : ℝ, |t| ≤ K⁻¹ →
    Integrable (fun ω ↦ Real.exp (t * (X ω - ∫ ω', X ω' ∂μ))) μ ∧
      mgf (fun ω ↦ X ω - ∫ ω', X ω' ∂μ) μ t ≤ Real.exp (K ^ 2 * t ^ 2)

/-- **1.3** The centred product of two sub-Gaussian variables with proxy `σ² > 0`, not
necessarily independent, is sub-exponential with parameter `Cσ²`. -/
theorem isSubexponential_mul_sub :
    ∃ C : ℝ, 0 < C ∧
      ∀ {Ω : Type*} [MeasurableSpace Ω] (μ : Measure Ω) [IsProbabilityMeasure μ] (U V : Ω → ℝ)
        (σ : ℝ≥0), 0 < σ → HasSubgaussianMGF U (σ ^ 2) μ → HasSubgaussianMGF V (σ ^ 2) μ →
        IsSubexponential μ (fun ω ↦ U ω * V ω) (C * σ ^ 2) := sorry

/-- **1.3** Entrywise concentration of a sample covariance with sub-Gaussian coordinates. The
exceedance is strict, so that the proxy-zero case is covered. -/
theorem measure_max_abs_sampleCovariance_sub_gt_le :
    ∃ c₀ c₁ c₂ : ℝ, 0 < c₀ ∧ 0 < c₁ ∧ 0 < c₂ ∧
      ∀ {Ω : Type*} [MeasurableSpace Ω] (μ : Measure Ω) [IsProbabilityMeasure μ] (n p : ℕ)
        (x : Fin n → Ω → EuclideanSpace ℝ (Fin p)) (Sig : Matrix (Fin p) (Fin p) ℝ) (σ : ℝ≥0)
        (δ : ℝ), iIndepFun x μ → (∀ i, Measurable (x i)) →
        (∀ i j, HasSubgaussianMGF (fun ω ↦ x i ω j) (σ ^ 2) μ) →
        (∀ i j k, ∫ ω, x i ω j * x i ω k ∂μ = Sig j k) →
        Real.log p < n → 0 < δ →
        μ.real {ω | ∃ j k, (σ : ℝ) ^ 2 * (c₀ * √(Real.log p / n) + δ) <
          |(n : ℝ)⁻¹ * ∑ i, x i ω j * x i ω k - Sig j k|} ≤
          c₁ * Real.exp (-c₂ * n * min δ (δ ^ 2)) := sorry

end Layer1

section Layer1Norms

open scoped Matrix.Norms.L2Operator

/-- **1.3** Operator-norm concentration of the sample second moment of independent centred
isotropic sub-Gaussian vectors with proxy `K²`. -/
theorem norm_sampleCovariance_sub_le :
    ∃ C c : ℝ, 0 < C ∧ 0 < c ∧
      ∀ {Ω : Type*} [MeasurableSpace Ω] (μ : Measure Ω) [IsProbabilityMeasure μ] (n p : ℕ)
        (w : Fin n → Ω → EuclideanSpace ℝ (Fin p)) (K : ℝ≥0) (t : ℝ), 0 < n → 0 ≤ t →
        iIndepFun w μ → (∀ i, Measurable (w i)) → (∀ i, IsSubgaussianVector μ (w i) (K ^ 2)) →
        (∀ i u v, ∫ ω, ⟪u, w i ω⟫ * ⟪v, w i ω⟫ ∂μ = ⟪u, v⟫) →
        1 - 2 * Real.exp (-c * t ^ 2) ≤ μ.real {ω |
          ‖TauCeti.sampleSecondMoment (fun i ↦ WithLp.ofLp (w i ω)) - 1‖ ≤
            3 * max (C * K ^ 2 * (√(p : ℝ) + t) / √(n : ℝ))
              ((C * K ^ 2 * (√(p : ℝ) + t) / √(n : ℝ)) ^ 2)} := sorry

/-- **1.4** Entrywise domination of the operator norm by a nonnegative matrix. -/
theorem norm_le_norm_of_abs_le {m n : Type*} [Fintype m] [Fintype n] [DecidableEq n]
    {M B : Matrix m n ℝ} (h : ∀ i j, |M i j| ≤ B i j) : ‖M‖ ≤ ‖B‖ := sorry

/-- **1.4** The Schur test: if every absolute row sum is at most `r` and every absolute column
sum at most `c`, then `‖A‖ ≤ √(rc)`. -/
theorem norm_le_sqrt_maxRowSum_mul_maxColSum {m n : Type*} [Fintype m] [Fintype n]
    [DecidableEq n] {A : Matrix m n ℝ} {r c : ℝ} (hr : ∀ i, ∑ j, |A i j| ≤ r)
    (hc : ∀ j, ∑ i, |A i j| ≤ c) : ‖A‖ ≤ √(r * c) := sorry

/-- **1.4** The Schur test for a symmetric matrix: the operator norm is at most the largest
absolute row sum. -/
theorem norm_le_of_rowSum_le {n : Type*} [Fintype n] [DecidableEq n] {A : Matrix n n ℝ}
    (hA : A.IsSymm) {b : ℝ} (hb0 : 0 ≤ b) (hb : ∀ i, ∑ j, |A i j| ≤ b) : ‖A‖ ≤ b := sorry

/-- **1.4** The `∞ → ∞` bound for an inverse: if `M` is positive definite with every
eigenvalue at least `c > 0`, every absolute row sum of `M⁻¹` is at most `√k/c`, where `k` is the
size of `M`. -/
theorem sum_abs_inv_apply_le {k : Type*} [Fintype k] [DecidableEq k] {M : Matrix k k ℝ}
    (hM : M.PosDef) {c : ℝ} (hc : 0 < c) (hmin : ∀ i, c ≤ hM.isHermitian.eigenvalues₀ i)
    (i : k) : ∑ j, |M⁻¹ i j| ≤ √(Fintype.card k : ℝ) / c := sorry

/-- **1.4** The nuclear norm of a `d₁ × d₂` real matrix: Tau Ceti's nuclear seminorm of its
action, the sum of its singular values. -/
def nuclearNorm {d₁ d₂ : ℕ} (Θ : Matrix (Fin d₁) (Fin d₂) ℝ) : ℝ :=
  TauCeti.UnitarilyInvariantSeminorm.nuclear ℝ (EuclideanSpace ℝ (Fin d₂))
    (EuclideanSpace ℝ (Fin d₁)) (Matrix.toEuclideanLin Θ)

/-- **1.4** The Frobenius inner product `⟪A, B⟫_F = ∑ᵢⱼ Aᵢⱼ Bᵢⱼ`. -/
def frobInner {m n : Type*} [Fintype m] [Fintype n] (A B : Matrix m n ℝ) : ℝ :=
  ∑ i, ∑ j, A i j * B i j

/-- **1.4** The squared Frobenius norm `∑ᵢⱼ Aᵢⱼ²`. -/
def frobNormSq {a b : Type*} [Fintype a] [Fintype b] (A : Matrix a b ℝ) : ℝ :=
  ∑ i, ∑ j, A i j ^ 2

/-- **1.4** Trace duality between the operator and nuclear norms. -/
theorem abs_frobInner_le_norm_mul_nuclearNorm {d₁ d₂ : ℕ} (A B : Matrix (Fin d₁) (Fin d₂) ℝ) :
    |frobInner A B| ≤ ‖A‖ * nuclearNorm B := sorry

/-- **1.4** Orthogonal additivity of the nuclear norm. -/
theorem nuclearNorm_add_of_orthogonal {d₁ d₂ : ℕ} {A B : Matrix (Fin d₁) (Fin d₂) ℝ}
    (h₁ : Aᵀ * B = 0) (h₂ : A * Bᵀ = 0) :
    nuclearNorm (A + B) = nuclearNorm A + nuclearNorm B := sorry

/-- **1.4** The low-rank decomposition of `Δ` relative to `Θ*` of rank at most `r`, and the
resulting lower bound for `nuclear(Θ* + Δ)` (Wainwright, §10.2.1). -/
theorem exists_lowRank_decomposition {d₁ d₂ r : ℕ} {Θs : Matrix (Fin d₁) (Fin d₂) ℝ}
    (hr : Θs.rank ≤ r) (Δ : Matrix (Fin d₁) (Fin d₂) ℝ) :
    ∃ Δ₁ Δ₂ : Matrix (Fin d₁) (Fin d₂) ℝ, Δ₁ + Δ₂ = Δ ∧ Δ₁.rank ≤ 2 * r ∧ Θsᵀ * Δ₂ = 0 ∧
      Θs * Δ₂ᵀ = 0 ∧ frobInner Δ₁ Δ₂ = 0 ∧
      nuclearNorm Θs + nuclearNorm Δ₂ - nuclearNorm Δ₁ ≤ nuclearNorm (Θs + Δ) ∧
      nuclearNorm Δ₁ ≤ √(2 * r : ℝ) * √(frobNormSq Δ) := sorry

/-- **1.5** The sparse Varshamov–Gilbert packing (Giraud, Lemma 3.7). -/
theorem exists_sparse_packing {p D : ℕ} (hD : 1 ≤ D) (hDp : 5 * D < p) :
    ∃ C : Finset (Fin p → ℝ),
      (∀ ω ∈ C, (∀ j, ω j = 0 ∨ ω j = 1) ∧ hammingNorm ω = D) ∧
      (∀ ω ∈ C, ∀ ω' ∈ C, ω ≠ ω' → D < hammingDist ω ω') ∧
      (D : ℝ) / 2 * Real.log (p / (5 * D)) ≤ Real.log C.card := sorry

/-- **1.5** An `ε`-net, in the Frobenius norm and contained in the set, of the matrices of rank at
most `r` and Frobenius norm `1`, with at most `(9/ε)^((d₁ + d₂ + 1) r)` points
(Candès–Plan 2011). -/
theorem exists_net_lowRank {d₁ d₂ r : ℕ} {ε : ℝ} (hε : 0 < ε) (hε1 : ε ≤ 1) :
    ∃ N : Finset (Matrix (Fin d₁) (Fin d₂) ℝ), (∀ M ∈ N, M.rank ≤ r ∧ frobNormSq M = 1) ∧
      (∀ A : Matrix (Fin d₁) (Fin d₂) ℝ, A.rank ≤ r → frobNormSq A = 1 →
        ∃ M ∈ N, frobNormSq (A - M) ≤ ε ^ 2) ∧
      (N.card : ℝ) ≤ (9 / ε) ^ ((d₁ + d₂ + 1) * r) := sorry

end Layer1Norms

/-! ## Layer 2: exact and stable sparse recovery -/

section Layer2

variable {n p : ℕ}

/-- **2.1** The restricted nullspace property with respect to `S`. -/
def HasRestrictedNullspace (X : Matrix (Fin n) (Fin p) ℝ) (S : Finset (Fin p)) : Prop :=
  ∀ δ : EuclideanSpace ℝ (Fin p), Matrix.toEuclideanLin X δ = 0 →
    restrictedL1Norm Sᶜ δ ≤ restrictedL1Norm S δ → δ = 0

/-- **2.1** Basis pursuit: `b` satisfies `Xb = y` and minimizes the `ℓ¹` norm on that affine
set. Mathlib's `IsMinOn f s b` does not ask for `b ∈ s`, so feasibility is a separate
conjunct. -/
def IsBasisPursuitSolution (X : Matrix (Fin n) (Fin p) ℝ) (y : EuclideanSpace ℝ (Fin n))
    (b : EuclideanSpace ℝ (Fin p)) : Prop :=
  Matrix.toEuclideanLin X b = y ∧
    IsMinOn (restrictedL1Norm Finset.univ) {b' | Matrix.toEuclideanLin X b' = y} b

/-- **2.1** Exact recovery of every vector supported in `S` by basis pursuit is the restricted
nullspace property (Wainwright, Thm 7.8). -/
theorem hasRestrictedNullspace_iff_basisPursuit (X : Matrix (Fin n) (Fin p) ℝ)
    (S : Finset (Fin p)) :
    HasRestrictedNullspace X S ↔
      ∀ β : EuclideanSpace ℝ (Fin p), (∀ j ∉ S, β j = 0) →
        ∀ b, IsBasisPursuitSolution X (Matrix.toEuclideanLin X β) b ↔ b = β := sorry

/-- **2.2** Restricted isometry of order `2s` with constant below `1/3` gives the restricted
nullspace property for every `S` with `|S| ≤ s` (Wainwright, Prop 7.11). -/
theorem hasRestrictedNullspace_of_rip (X : Matrix (Fin n) (Fin p) ℝ) {s : ℕ} {δ : ℝ}
    (hδ : δ < 1 / 3) (hX : HasRIP ((√(n : ℝ))⁻¹ • X) (2 * s) δ) (S : Finset (Fin p))
    (hS : S.card ≤ s) : HasRestrictedNullspace X S := sorry

/-- **2.3** The `ℓ²`-robust nullspace property of order `s` with constants `ρ` and `τ`
(Foucart–Rauhut, Def 4.21): `‖v_S‖ ≤ ρ‖v_{Sᶜ}‖₁/√s + τ‖Av‖` for every `v` and every `S` with
`|S| ≤ s`. It is used only for `s ≥ 1`; at `s = 0` the term `/ √0` is the junk value `0`. -/
def HasRobustNullspace (A : Matrix (Fin n) (Fin p) ℝ) (s : ℕ) (ρ τ : ℝ) : Prop :=
  ∀ (v : EuclideanSpace ℝ (Fin p)) (S : Finset (Fin p)), S.card ≤ s →
    √(∑ j ∈ S, v j ^ 2) ≤
      ρ * restrictedL1Norm Sᶜ v / √(s : ℝ) + τ * ‖Matrix.toEuclideanLin A v‖

/-- **2.3** Restricted isometry of order `2s` with `δ < 4/√41` gives the `ℓ²`-robust nullspace
property with constants depending only on `δ` (Foucart–Rauhut, Thm 6.13). -/
theorem hasRobustNullspace_of_rip {δ : ℝ} (hδ : δ < 4 / √41) :
    ∃ ρ τ : ℝ, 0 < ρ ∧ ρ < 1 ∧ 0 < τ ∧
      ∀ (n p s : ℕ) (A : Matrix (Fin n) (Fin p) ℝ), 0 < s → HasRIP A (2 * s) δ →
        HasRobustNullspace A s ρ τ := sorry

/-- **2.3** Stable recovery under the `ℓ²`-robust nullspace property (Foucart–Rauhut,
Thm 4.22, with the constants of Thm 4.25). The minimizer is feasible: `IsMinOn` alone does not
say so. The constant `τ` is nonnegative: for `p = 0` every matrix has the property with every
`τ`, and a negative `τ` would make the right-hand sides negative. -/
theorem stable_recovery {n p s : ℕ} (hs : 0 < s) {A : Matrix (Fin n) (Fin p) ℝ} {ρ τ : ℝ}
    (hρ0 : 0 ≤ ρ) (hρ : ρ < 1) (hτ : 0 ≤ τ) (hA : HasRobustNullspace A s ρ τ)
    (β : EuclideanSpace ℝ (Fin p)) (y : EuclideanSpace ℝ (Fin n)) {η : ℝ}
    (hβ : ‖Matrix.toEuclideanLin A β - y‖ ≤ η) {βs : EuclideanSpace ℝ (Fin p)}
    (hβs : ‖Matrix.toEuclideanLin A βs - y‖ ≤ η)
    (hmin : IsMinOn (restrictedL1Norm Finset.univ) {b | ‖Matrix.toEuclideanLin A b - y‖ ≤ η} βs) :
    restrictedL1Norm Finset.univ (βs - β) ≤
        2 * (1 + ρ) ^ 2 / (1 - ρ) * bestSparseL1Error s β +
          2 * (3 + ρ) * τ / (1 - ρ) * √(s : ℝ) * η ∧
      ‖βs - β‖ ≤ 2 * (1 + ρ) ^ 2 / (1 - ρ) * bestSparseL1Error s β / √(s : ℝ) +
          2 * (3 + ρ) * τ / (1 - ρ) * η := sorry

/-- **2.3** Stable recovery under `δ₂ₛ < 4/√41` (Foucart–Rauhut, Thm 6.12): the constants depend
only on the restricted isometry constant. The sparsity is positive: at `s = 0` the restricted
isometry hypothesis is empty and `/ √0 = 0`. -/
theorem stable_recovery_of_rip {δ : ℝ} (hδ : δ < 4 / √41) :
    ∃ C D : ℝ, 0 < C ∧ 0 < D ∧
      ∀ (n p s : ℕ) (A : Matrix (Fin n) (Fin p) ℝ), 0 < s → HasRIP A (2 * s) δ →
        ∀ (β : EuclideanSpace ℝ (Fin p)) (y : EuclideanSpace ℝ (Fin n)) (η : ℝ),
          ‖Matrix.toEuclideanLin A β - y‖ ≤ η →
          ∀ βs, ‖Matrix.toEuclideanLin A βs - y‖ ≤ η → IsMinOn (restrictedL1Norm Finset.univ)
              {b | ‖Matrix.toEuclideanLin A b - y‖ ≤ η} βs →
            restrictedL1Norm Finset.univ (βs - β) ≤
                C * bestSparseL1Error s β + D * √(s : ℝ) * η ∧
              ‖βs - β‖ ≤ C * bestSparseL1Error s β / √(s : ℝ) + D * η := sorry

/-- **2.4** The restricted isometry property of designs with independent sub-Gaussian entries
(Foucart–Rauhut, Thm 9.2), with constants depending only on the proxy `K²`. -/
theorem rip_of_subgaussian (K : ℝ≥0) :
    ∃ C c : ℝ, 0 < C ∧ 0 < c ∧
      ∀ {Ω : Type*} [MeasurableSpace Ω] (μ : Measure Ω) [IsProbabilityMeasure μ] (n p s : ℕ)
        (X : Ω → Matrix (Fin n) (Fin p) ℝ) (δ : ℝ),
        iIndepFun (fun ij : Fin n × Fin p ↦ fun ω ↦ X ω ij.1 ij.2) μ →
        (∀ i j, HasSubgaussianMGF (fun ω ↦ X ω i j) (K ^ 2) μ) →
        (∀ i j, ∫ ω, X ω i j ^ 2 ∂μ = 1) →
        0 < δ → δ < 1 → 1 ≤ s → s ≤ p → C / δ ^ 2 * s * Real.log (Real.exp 1 * p / s) ≤ n →
        1 - 2 * Real.exp (-c * δ ^ 2 * n) ≤
          μ.real {ω | HasRIP ((√(n : ℝ))⁻¹ • X ω) s δ} := sorry

/-- **2.4** Exact recovery from sub-Gaussian designs: with probability at least
`1 - 2exp(-cn)`, every vector supported on a set of at most `s` coordinates is the unique basis
pursuit solution for its measurements, once `n ≥ Cs log(ep/s)`. It is `rip_of_subgaussian` at
order `2s` with `δ = 1/4`, followed by `hasRestrictedNullspace_of_rip` and
`hasRestrictedNullspace_iff_basisPursuit`. -/
theorem basisPursuit_of_subgaussian (K : ℝ≥0) :
    ∃ C c : ℝ, 0 < C ∧ 0 < c ∧
      ∀ {Ω : Type*} [MeasurableSpace Ω] (μ : Measure Ω) [IsProbabilityMeasure μ] (n p s : ℕ)
        (X : Ω → Matrix (Fin n) (Fin p) ℝ),
        iIndepFun (fun ij : Fin n × Fin p ↦ fun ω ↦ X ω ij.1 ij.2) μ →
        (∀ i j, HasSubgaussianMGF (fun ω ↦ X ω i j) (K ^ 2) μ) →
        (∀ i j, ∫ ω, X ω i j ^ 2 ∂μ = 1) →
        1 ≤ s → 2 * s ≤ p → C * s * Real.log (Real.exp 1 * p / s) ≤ n →
        1 - 2 * Real.exp (-c * n) ≤ μ.real {ω | ∀ S : Finset (Fin p), S.card ≤ s →
          ∀ β : EuclideanSpace ℝ (Fin p), (∀ j ∉ S, β j = 0) →
            ∀ b, IsBasisPursuitSolution (X ω) (Matrix.toEuclideanLin (X ω) β) b ↔ b = β} := sorry

end Layer2

/-! ## Layer 3: the lasso -/

section Layer3

variable {n : ℕ} {ι : Type*} [Fintype ι]

/-- **Layer 3** The noise event `∀ j, 2|⟪X_j, ε⟫|/n ≤ λ`. -/
def LassoNoiseEvent (X : Matrix (Fin n) ι ℝ) (ε : EuclideanSpace ℝ (Fin n)) (lam : ℝ) : Prop :=
  ∀ j, 2 * |⟪designCol X j, ε⟫| / n ≤ lam

/-- **3.1** The lasso objective `‖y - Xβ‖²/(2n) + λ‖β‖₁`. -/
def lassoObjective (X : Matrix (Fin n) ι ℝ) (y : EuclideanSpace ℝ (Fin n)) (lam : ℝ)
    (β : EuclideanSpace ℝ ι) : ℝ :=
  ‖y - Matrix.toEuclideanLin X β‖ ^ 2 / (2 * n) + lam * restrictedL1Norm Finset.univ β

/-- **3.1** A lasso solution is any minimizer of the lasso objective. -/
def IsLassoSolution (X : Matrix (Fin n) ι ℝ) (y : EuclideanSpace ℝ (Fin n)) (lam : ℝ)
    (βh : EuclideanSpace ℝ ι) : Prop :=
  IsMinOn (lassoObjective X y lam) univ βh

/-- **3.1** Existence of a lasso solution. -/
theorem exists_isLassoSolution (hn : 0 < n) (X : Matrix (Fin n) ι ℝ)
    (y : EuclideanSpace ℝ (Fin n)) {lam : ℝ} (hlam : 0 < lam) :
    ∃ βh, IsLassoSolution X y lam βh := sorry

/-- **3.1** The optimality conditions of the lasso. -/
theorem isLassoSolution_iff (hn : 0 < n) (X : Matrix (Fin n) ι ℝ)
    (y : EuclideanSpace ℝ (Fin n)) {lam : ℝ} (hlam : 0 < lam) (βh : EuclideanSpace ℝ ι) :
    IsLassoSolution X y lam βh ↔
      ∀ j, (βh j ≠ 0 →
          ⟪designCol X j, y - Matrix.toEuclideanLin X βh⟫ / n = lam * Real.sign (βh j)) ∧
        (βh j = 0 → |⟪designCol X j, y - Matrix.toEuclideanLin X βh⟫ / n| ≤ lam) := sorry

/-- **3.1** Any two lasso solutions have the same fit and the same `ℓ¹` norm. -/
theorem IsLassoSolution.fit_eq (hn : 0 < n) {X : Matrix (Fin n) ι ℝ}
    {y : EuclideanSpace ℝ (Fin n)} {lam : ℝ} (hlam : 0 < lam) {βh βh' : EuclideanSpace ℝ ι}
    (h : IsLassoSolution X y lam βh) (h' : IsLassoSolution X y lam βh') :
    Matrix.toEuclideanLin X βh = Matrix.toEuclideanLin X βh' ∧
      restrictedL1Norm Finset.univ βh = restrictedL1Norm Finset.univ βh' := sorry

/-- **3.1** The variational inequality of a lasso solution. -/
theorem IsLassoSolution.variational (hn : 0 < n) {X : Matrix (Fin n) ι ℝ}
    {y : EuclideanSpace ℝ (Fin n)} {lam : ℝ} (hlam : 0 < lam) {βh : EuclideanSpace ℝ ι}
    (h : IsLassoSolution X y lam βh) (b : EuclideanSpace ℝ ι) :
    ‖Matrix.toEuclideanLin X (βh - b)‖ ^ 2 / n ≤
      ⟪y - Matrix.toEuclideanLin X b, Matrix.toEuclideanLin X (βh - b)⟫ / n +
        lam * (restrictedL1Norm Finset.univ b - restrictedL1Norm Finset.univ βh) := sorry

/-- **3.2** The slow rate: no sparsity or design condition. -/
theorem lasso_slow_rate (hn : 0 < n) {X : Matrix (Fin n) ι ℝ} {β : EuclideanSpace ℝ ι}
    {ε : EuclideanSpace ℝ (Fin n)} {lam : ℝ} (hlam : 0 < lam) (hε : LassoNoiseEvent X ε lam)
    {βh : EuclideanSpace ℝ ι} (h : IsLassoSolution X (Matrix.toEuclideanLin X β + ε) lam βh) :
    ‖Matrix.toEuclideanLin X (βh - β)‖ ^ 2 / n ≤
      3 * lam / 2 * restrictedL1Norm Finset.univ β - lam / 2 * restrictedL1Norm Finset.univ βh :=
  sorry

/-- **3.2** The cone condition, and `Δ ∈ C_3(S)`. -/
theorem lasso_cone (hn : 0 < n) {X : Matrix (Fin n) ι ℝ} {S : Finset ι}
    {β : EuclideanSpace ℝ ι} (hβ : ∀ j ∉ S, β j = 0) {ε : EuclideanSpace ℝ (Fin n)} {lam : ℝ}
    (hlam : 0 < lam) (hε : LassoNoiseEvent X ε lam) {βh : EuclideanSpace ℝ ι}
    (h : IsLassoSolution X (Matrix.toEuclideanLin X β + ε) lam βh) :
    ‖Matrix.toEuclideanLin X (βh - β)‖ ^ 2 / n + lam / 2 * restrictedL1Norm Sᶜ (βh - β) ≤
        3 * lam / 2 * restrictedL1Norm S (βh - β) ∧
      restrictedL1Norm Sᶜ (βh - β) ≤ 3 * restrictedL1Norm S (βh - β) := sorry

/-- **3.2** The compatibility constant `φ(S, L)`, the infimum of `|S|‖Xδ‖²/(n‖δ_S‖₁²)` over the
nonzero vectors of the cone `‖δ_{Sᶜ}‖₁ ≤ L‖δ_S‖₁`. -/
def compatibilityConstant (X : Matrix (Fin n) ι ℝ) (S : Finset ι) (L : ℝ) : ℝ :=
  ⨅ δ : {δ : EuclideanSpace ℝ ι // δ ≠ 0 ∧ restrictedL1Norm Sᶜ δ ≤ L * restrictedL1Norm S δ},
    S.card * ‖Matrix.toEuclideanLin X δ.1‖ ^ 2 / (n * restrictedL1Norm S δ.1 ^ 2)

/-- **3.2** The restricted eigenvalue condition with constant `κ` on the cone `C_L(S)`. -/
def HasRestrictedEigenvalue (X : Matrix (Fin n) ι ℝ) (S : Finset ι) (L κ : ℝ) : Prop :=
  ∀ δ : EuclideanSpace ℝ ι, restrictedL1Norm Sᶜ δ ≤ L * restrictedL1Norm S δ →
    κ * ‖δ‖ ^ 2 ≤ ‖Matrix.toEuclideanLin X δ‖ ^ 2 / n

/-- **3.2** Prediction and `ℓ¹` rates under compatibility. -/
theorem lasso_compatibility (hn : 0 < n) {X : Matrix (Fin n) ι ℝ} {S : Finset ι}
    (hS : S.Nonempty) (hφ : 0 < compatibilityConstant X S 3) {β : EuclideanSpace ℝ ι}
    (hβ : ∀ j ∉ S, β j = 0) {ε : EuclideanSpace ℝ (Fin n)} {lam : ℝ} (hlam : 0 < lam)
    (hε : LassoNoiseEvent X ε lam) {βh : EuclideanSpace ℝ ι}
    (h : IsLassoSolution X (Matrix.toEuclideanLin X β + ε) lam βh) :
    ‖Matrix.toEuclideanLin X (βh - β)‖ ^ 2 / n ≤
        9 * lam ^ 2 * S.card / (4 * compatibilityConstant X S 3) ∧
      restrictedL1Norm Finset.univ (βh - β) ≤ 2 * lam * S.card / compatibilityConstant X S 3 :=
  sorry

/-- **3.2** The `ℓ²` rate under the restricted eigenvalue condition, and `φ(S, 3) ≥ κ`. -/
theorem lasso_restrictedEigenvalue (hn : 0 < n) {X : Matrix (Fin n) ι ℝ} {S : Finset ι}
    (hS : S.Nonempty) {κ : ℝ} (hκ : 0 < κ) (hRE : HasRestrictedEigenvalue X S 3 κ)
    {β : EuclideanSpace ℝ ι} (hβ : ∀ j ∉ S, β j = 0) {ε : EuclideanSpace ℝ (Fin n)} {lam : ℝ}
    (hlam : 0 < lam) (hε : LassoNoiseEvent X ε lam) {βh : EuclideanSpace ℝ ι}
    (h : IsLassoSolution X (Matrix.toEuclideanLin X β + ε) lam βh) :
    ‖βh - β‖ ≤ 3 * lam * √(S.card : ℝ) / (2 * κ) ∧ κ ≤ compatibilityConstant X S 3 := sorry

/-- **3.3** The probability of the noise event for sub-Gaussian noise. -/
theorem measure_lassoNoiseEvent_ge {Ω : Type*} [MeasurableSpace Ω] {μ : Measure Ω}
    [IsProbabilityMeasure μ] (hn : 0 < n) [Nonempty ι] (X : Matrix (Fin n) ι ℝ) {b : ℝ}
    (hX : ∀ j, ‖designCol X j‖ ^ 2 / n ≤ b) {ε : Ω → EuclideanSpace ℝ (Fin n)} {σ : ℝ≥0}
    (hind : iIndepFun (fun i ω ↦ ε ω i) μ) (hsub : ∀ i, HasSubgaussianMGF (fun ω ↦ ε ω i) (σ ^ 2) μ)
    {t : ℝ} (ht : 0 ≤ t) :
    1 - 2 * Real.exp (-t) ≤ μ.real {ω | LassoNoiseEvent X (ε ω)
      (2 * σ * √(2 * b * (Real.log (Fintype.card ι) + t) / n))} := sorry

/-- **3.4** Restricted eigenvalues from restricted isometry, by the block argument. -/
theorem hasRestrictedEigenvalue_of_rip {p : ℕ} (X : Matrix (Fin n) (Fin p) ℝ)
    {S : Finset (Fin p)} (hS : S.Nonempty)
    (hX : HasRIP ((√(n : ℝ))⁻¹ • X) (37 * S.card) (1 / 2)) :
    HasRestrictedEigenvalue X S 3 (((2 / 3) * (1 / √2 - √6 / 4)) ^ 2) := sorry

/-- **3.5** Restricted eigenvalues of sub-Gaussian designs, simultaneously for all small
supports. -/
theorem hasRestrictedEigenvalue_of_subgaussian (K : ℝ≥0) :
    ∃ C c : ℝ, 0 < C ∧ 0 < c ∧
      ∀ {Ω : Type*} [MeasurableSpace Ω] (μ : Measure Ω) [IsProbabilityMeasure μ] (n p s : ℕ)
        (X : Ω → Matrix (Fin n) (Fin p) ℝ),
        iIndepFun (fun ij : Fin n × Fin p ↦ fun ω ↦ X ω ij.1 ij.2) μ →
        (∀ i j, HasSubgaussianMGF (fun ω ↦ X ω i j) (K ^ 2) μ) →
        (∀ i j, ∫ ω, X ω i j ^ 2 ∂μ = 1) →
        1 ≤ s → s ≤ p → C * s * Real.log (Real.exp 1 * p / s) ≤ n →
        1 - 2 * Real.exp (-c * n) ≤
          μ.real {ω | ∀ S : Finset (Fin p), S.Nonempty → S.card ≤ s →
            HasRestrictedEigenvalue (X ω) S 3 (((2 / 3) * (1 / √2 - √6 / 4)) ^ 2)} := sorry

/-- **3.6** For an orthogonal design the lasso is soft thresholding of `z = Xᵀy/n`. -/
theorem isLassoSolution_iff_softThreshold (hn : 0 < n) {X : Matrix (Fin n) ι ℝ}
    (hX : (n : ℝ)⁻¹ • (Xᵀ * X) = 1) (y : EuclideanSpace ℝ (Fin n)) {lam : ℝ} (hlam : 0 < lam)
    (βh : EuclideanSpace ℝ ι) :
    IsLassoSolution X y lam βh ↔ ∀ j, βh j = softThreshold lam (⟪designCol X j, y⟫ / n) := sorry

/-- **3.7** Support recovery by the primal–dual witness (Wainwright, Thm 7.21). `G` is the Gram
matrix of the columns in `S`; its smallest eigenvalue is at least `c_min`. -/
theorem lasso_support_recovery {p : ℕ} (hn : 0 < n) (X : Matrix (Fin n) (Fin p) ℝ)
    (S : Finset (Fin p)) (hS : S.Nonempty) {β : EuclideanSpace ℝ (Fin p)}
    (hβ : ∀ j ∉ S, β j = 0) (ε : EuclideanSpace ℝ (Fin n)) {cmin α lam : ℝ} (hcmin : 0 < cmin)
    (hmin : ∀ v : S → ℝ, cmin * ∑ k, v k ^ 2 ≤
      (n : ℝ)⁻¹ * ∑ i, (∑ k : S, X i k * v k) ^ 2)
    (hα : 0 ≤ α) (hα1 : α < 1)
    (hinc : ∀ j ∉ S, ∑ k : S, |(((Xᵀ * X).submatrix (Subtype.val : S → Fin p) Subtype.val)⁻¹ *ᵥ
      (fun l : S ↦ ∑ i, X i l * X i j)) k| ≤ α)
    (Pr : EuclideanSpace ℝ (Fin n) →L[ℝ] EuclideanSpace ℝ (Fin n))
    (hPr : Pr = (LinearMap.range (Matrix.toEuclideanLin
      (X.submatrix id (Subtype.val : S → Fin p))))ᗮ.starProjection)
    (hlam : ∀ j ∉ S, 2 / (1 - α) * (|⟪designCol X j, Pr ε⟫| / n) ≤ lam) (hlam0 : 0 < lam) :
    let G : Matrix S S ℝ := (n : ℝ)⁻¹ • (Xᵀ * X).submatrix Subtype.val Subtype.val
    let B : ℝ := Finset.univ.sup' (Finset.univ_nonempty_iff.2 hS.coe_sort)
        (fun j : S ↦ |(G⁻¹ *ᵥ (fun l : S ↦ ⟪designCol X l, ε⟫ / n)) j| +
          lam * ∑ k, |G⁻¹ j k|)
    ∃ βh, (∀ b, IsLassoSolution X (Matrix.toEuclideanLin X β + ε) lam b ↔ b = βh) ∧
      (∀ j ∉ S, βh j = 0) ∧ (∀ j ∈ S, |βh j - β j| ≤ B) ∧
      (∀ j ∈ S, B < |β j| → Real.sign (βh j) = Real.sign (β j)) := sorry

/-- **3.7** Support recovery for sub-Gaussian noise (Wainwright, Cor 7.22): with
`λ = (2Cσ/(1 - α))(√(2 log(p - s)/n) + δ)`, the conclusions of `lasso_support_recovery` hold and
the noise term of `B` is at most `c_min^{-1/2} σ(√(2 (log s)/n) + δ)`, with probability at least
`1 - 4 exp(-nδ²/2)`. -/
theorem lasso_support_recovery_prob {Ω : Type*} [MeasurableSpace Ω] {μ : Measure Ω}
    [IsProbabilityMeasure μ] {p : ℕ} (hn : 0 < n) (X : Matrix (Fin n) (Fin p) ℝ)
    (S : Finset (Fin p)) (hS : S.Nonempty) (hSp : S.card < p) {β : EuclideanSpace ℝ (Fin p)}
    (hβ : ∀ j ∉ S, β j = 0) {cmin α Cc δ : ℝ} (hcmin : 0 < cmin)
    (hmin : ∀ v : S → ℝ, cmin * ∑ k, v k ^ 2 ≤
      (n : ℝ)⁻¹ * ∑ i, (∑ k : S, X i k * v k) ^ 2)
    (hα : 0 ≤ α) (hα1 : α < 1)
    (hinc : ∀ j ∉ S, ∑ k : S, |(((Xᵀ * X).submatrix (Subtype.val : S → Fin p) Subtype.val)⁻¹ *ᵥ
      (fun l : S ↦ ∑ i, X i l * X i j)) k| ≤ α)
    (hcol : ∀ j, ‖designCol X j‖ ≤ Cc * √(n : ℝ)) (hδ : 0 < δ)
    {ε : Ω → EuclideanSpace ℝ (Fin n)} {σ : ℝ≥0} (hσ : 0 < σ)
    (hind : iIndepFun (fun i ω ↦ ε ω i) μ)
    (hsub : ∀ i, HasSubgaussianMGF (fun ω ↦ ε ω i) (σ ^ 2) μ) :
    let lam : ℝ := 2 * Cc * σ / (1 - α) * (√(2 * Real.log ((p : ℝ) - S.card) / n) + δ)
    let G : Matrix S S ℝ := (n : ℝ)⁻¹ • (Xᵀ * X).submatrix Subtype.val Subtype.val
    let B : EuclideanSpace ℝ (Fin n) → ℝ := fun e ↦
      Finset.univ.sup' (Finset.univ_nonempty_iff.2 hS.coe_sort)
        (fun j : S ↦ |(G⁻¹ *ᵥ (fun l : S ↦ ⟪designCol X l, e⟫ / n)) j| +
          lam * ∑ k, |G⁻¹ j k|)
    1 - 4 * Real.exp (-n * δ ^ 2 / 2) ≤ μ.real {ω |
      (∃ βh, (∀ b, IsLassoSolution X (Matrix.toEuclideanLin X β + ε ω) lam b ↔ b = βh) ∧
        (∀ j ∉ S, βh j = 0) ∧ (∀ j ∈ S, |βh j - β j| ≤ B (ε ω)) ∧
        (∀ j ∈ S, B (ε ω) < |β j| → Real.sign (βh j) = Real.sign (β j))) ∧
      ∀ j : S, |(G⁻¹ *ᵥ (fun l : S ↦ ⟪designCol X l, ε ω⟫ / n)) j| ≤
        σ / √cmin * (√(2 * Real.log S.card / n) + δ)} := sorry

/-- **3.8** The debiased estimator `β̃ = β̂ + Θ̂Xᵀ(y - Xβ̂)/n`. -/
def debiasedEstimator (X : Matrix (Fin n) ι ℝ) (Θ : Matrix ι ι ℝ) (y : EuclideanSpace ℝ (Fin n))
    (βh : EuclideanSpace ℝ ι) : EuclideanSpace ℝ ι :=
  βh + (n : ℝ)⁻¹ • Matrix.toEuclideanLin Θ (Matrix.toEuclideanLin Xᵀ
    (y - Matrix.toEuclideanLin X βh))

/-- **3.8** The exact decomposition of the debiased estimator, and the bound of its remainder
when every entry of `Θ̂Σ̂ - I` is at most `b` in absolute value. -/
theorem debiased_decomposition (X : Matrix (Fin n) ι ℝ) (Θ : Matrix ι ι ℝ)
    (β βh : EuclideanSpace ℝ ι) (ε : EuclideanSpace ℝ (Fin n)) :
    let Sh : Matrix ι ι ℝ := (n : ℝ)⁻¹ • (Xᵀ * X)
    let βt := debiasedEstimator X Θ (Matrix.toEuclideanLin X β + ε) βh
    √(n : ℝ) • (βt - β) =
        (√(n : ℝ))⁻¹ • Matrix.toEuclideanLin Θ (Matrix.toEuclideanLin Xᵀ ε) +
          √(n : ℝ) • Matrix.toEuclideanLin (1 - Θ * Sh) (βh - β) ∧
      ∀ b : ℝ, (∀ j k, |(Θ * Sh - 1) j k| ≤ b) →
        ∀ j, |(√(n : ℝ) • Matrix.toEuclideanLin (1 - Θ * Sh) (βh - β)) j| ≤
          √(n : ℝ) * b * restrictedL1Norm Finset.univ (βh - β) := sorry

/-- **3.8** The conditional law of the main term of the debiased estimator given the design. -/
theorem condDistrib_debiased_main {Ω : Type*} [MeasurableSpace Ω] {μ : Measure Ω}
    [IsProbabilityMeasure μ] {p : ℕ} {X : Ω → Matrix (Fin n) (Fin p) ℝ}
    {ε : Ω → EuclideanSpace ℝ (Fin n)} (hX : Measurable X) (hε : Measurable ε)
    (hind : IndepFun X ε μ) {σ : ℝ}
    (hlaw : HasLaw ε ((stdGaussian (EuclideanSpace ℝ (Fin n))).map (fun z ↦ σ • z)) μ)
    {Θ : Matrix (Fin n) (Fin p) ℝ → Matrix (Fin p) (Fin p) ℝ} (hΘ : Measurable Θ) :
    condDistrib (fun ω ↦ (√(n : ℝ))⁻¹ •
        Matrix.toEuclideanLin (Θ (X ω)) (Matrix.toEuclideanLin (X ω)ᵀ (ε ω))) X μ =ᵐ[μ.map X]
      fun x ↦ multivariateGaussian 0
        (σ ^ 2 • (Θ x * ((n : ℝ)⁻¹ • (xᵀ * x)) * (Θ x)ᵀ)) := sorry

/-- **3.8** Coverage of the studentized debiased interval for the coordinate `j n`, along
`n → ∞` with `p = p n`: the design `X n` is independent of the Gaussian noise `ε n`, `β̂ = βh n`
is any measurable estimator, `Θ n` a measurable function of the design, and `σh n` a consistent
scale estimate. -/
theorem tendsto_debiased_coverage {Ω : Type*} [MeasurableSpace Ω] {μ : Measure Ω}
    [IsProbabilityMeasure μ] {p : ℕ → ℕ} (j : ∀ n, Fin (p n))
    {X : ∀ n, Ω → Matrix (Fin n) (Fin (p n)) ℝ} {ε : ∀ n, Ω → EuclideanSpace ℝ (Fin n)}
    (hX : ∀ n, Measurable (X n)) (hε : ∀ n, Measurable (ε n))
    (hind : ∀ n, IndepFun (X n) (ε n) μ) {σ : ℝ} (hσ : 0 < σ)
    (hlaw : ∀ n, HasLaw (ε n) ((stdGaussian (EuclideanSpace ℝ (Fin n))).map (fun z ↦ σ • z)) μ)
    (β : ∀ n, EuclideanSpace ℝ (Fin (p n))) {βh : ∀ n, Ω → EuclideanSpace ℝ (Fin (p n))}
    (hβh : ∀ n, Measurable (βh n))
    {Θ : ∀ n, Matrix (Fin n) (Fin (p n)) ℝ → Matrix (Fin (p n)) (Fin (p n)) ℝ}
    (hΘ : ∀ n, Measurable (Θ n)) {σh : ℕ → Ω → ℝ} (hσhm : ∀ n, Measurable (σh n))
    (hσh : TendstoInMeasure μ σh atTop (fun _ ↦ σ)) {α z c : ℝ} (hα : α ∈ Ioo (0 : ℝ) 1)
    (hz : cdf (gaussianReal 0 1) z = 1 - α / 2) (hc : 0 < c)
    (hrem : TendstoInMeasure μ (fun (n : ℕ) ω ↦ √(n : ℝ) *
        (⨆ k, |(Θ n (X n ω) * ((n : ℝ)⁻¹ • ((X n ω)ᵀ * X n ω)) -
          (1 : Matrix (Fin (p n)) (Fin (p n)) ℝ)) (j n) k|) *
          restrictedL1Norm Finset.univ (βh n ω - β n)) atTop (fun _ ↦ 0))
    (hv : Tendsto (fun n : ℕ ↦ μ.real {ω | c ≤
        (Θ n (X n ω) * ((n : ℝ)⁻¹ • ((X n ω)ᵀ * X n ω)) * (Θ n (X n ω))ᵀ) (j n) (j n)})
      atTop (𝓝 1)) :
    Tendsto (fun n : ℕ ↦ μ.real {ω |
        |debiasedEstimator (X n ω) (Θ n (X n ω)) (Matrix.toEuclideanLin (X n ω) (β n) + ε n ω)
            (βh n ω) (j n) - β n (j n)| ≤
          z * σh n ω * √((Θ n (X n ω) * ((n : ℝ)⁻¹ • ((X n ω)ᵀ * X n ω)) * (Θ n (X n ω))ᵀ)
            (j n) (j n) / n)}) atTop (𝓝 (1 - α)) := sorry

end Layer3

/-! ## Layer 4: model selection in the Gaussian regression model -/

section Layer4

variable {n : ℕ}

/-- **4.1** The penalized criterion `‖Y - P_{S_m} Y‖ₙ² + pen(m)`. -/
def penalizedCriterion {M : Type*} (S : M → Submodule ℝ (EuclideanSpace ℝ (Fin n)))
    (pen : M → ℝ) (Y : EuclideanSpace ℝ (Fin n)) (m : M) : ℝ :=
  ‖Y - (S m).starProjection Y‖ ^ 2 / n + pen m

/-- **4.1** A measurable selector of a minimizer of the penalized criterion exists when the
penalty dominates `κσ²(d_m + log(1/π_m))/n`. -/
theorem exists_measurable_penalizedSelector (hn : 0 < n) {M : Type*} [Countable M] [Nonempty M]
    [MeasurableSpace M] [MeasurableSingletonClass M]
    (S : M → Submodule ℝ (EuclideanSpace ℝ (Fin n)))
    (π pen : M → ℝ) {κ σ : ℝ} (hκ : 0 < κ) (hσ : 0 < σ) (hπ : ∀ m, 0 < π m) (hsum : Summable π)
    (hsum1 : ∑' m, π m ≤ 1)
    (hpen : ∀ m, κ * σ ^ 2 * (Module.finrank ℝ (S m) + Real.log (1 / π m)) / n ≤ pen m) :
    ∃ mh : EuclideanSpace ℝ (Fin n) → M, Measurable mh ∧
      ∀ Y m, penalizedCriterion S pen Y (mh Y) ≤ penalizedCriterion S pen Y m := sorry

/-- **4.1** The oracle inequality for penalized model selection (Giraud, Thm 2.2). -/
theorem penalized_model_selection :
    ∃ κ₀ : ℝ, 0 < κ₀ ∧ ∀ κ > κ₀, ∃ C : ℝ, 0 < C ∧
      ∀ (n : ℕ), 0 < n → ∀ {M : Type} [Countable M] [MeasurableSpace M]
        [MeasurableSingletonClass M] (S : M → Submodule ℝ (EuclideanSpace ℝ (Fin n)))
        (π pen : M → ℝ) (σ : ℝ) (f : EuclideanSpace ℝ (Fin n))
        (mh : EuclideanSpace ℝ (Fin n) → M),
        0 < σ → (∀ m, 0 < π m) → Summable π → ∑' m, π m ≤ 1 →
        (∀ m, κ * σ ^ 2 * (Module.finrank ℝ (S m) + Real.log (1 / π m)) / n ≤ pen m) →
        Measurable mh → (∀ Y m, penalizedCriterion S pen Y (mh Y) ≤ penalizedCriterion S pen Y m) →
        Integrable (fun ξ ↦ ‖(S (mh (f + σ • ξ))).starProjection (f + σ • ξ) - f‖ ^ 2)
            (stdGaussian (EuclideanSpace ℝ (Fin n))) ∧
          ∫ ξ, ‖(S (mh (f + σ • ξ))).starProjection (f + σ • ξ) - f‖ ^ 2 / n
              ∂(stdGaussian (EuclideanSpace ℝ (Fin n))) ≤
            C * ((⨅ m, (‖f - (S m).starProjection f‖ ^ 2 / n + pen m)) + σ ^ 2 / n) := sorry

/-- **4.2** The Gaussian log-likelihood of the mean `g` at the observation `Y`, with known `σ²`. -/
def gaussLogLik (σ : ℝ) (g Y : EuclideanSpace ℝ (Fin n)) : ℝ :=
  -(n / 2 : ℝ) * Real.log (2 * Real.pi * σ ^ 2) - ‖Y - g‖ ^ 2 / (2 * σ ^ 2)

/-- **4.2** The optimism identity behind Akaike's criterion: `Y = f + σξ`, `Y' = f + σξ'` with
`ξ, ξ'` independent standard Gaussian. -/
theorem aic_optimism (S : Submodule ℝ (EuclideanSpace ℝ (Fin n))) (f : EuclideanSpace ℝ (Fin n))
    {σ : ℝ} (hσ : 0 < σ) :
    ∫ q, (gaussLogLik σ (S.starProjection (f + σ • q.1)) (f + σ • q.1) -
        gaussLogLik σ (S.starProjection (f + σ • q.1)) (f + σ • q.2))
      ∂((stdGaussian (EuclideanSpace ℝ (Fin n))).prod (stdGaussian (EuclideanSpace ℝ (Fin n)))) =
      Module.finrank ℝ S := sorry

/-- **4.2** The smallest index minimizing `c`. -/
def smallestArgmin {J : ℕ} [NeZero J] (c : Fin J → ℝ) : Fin J :=
  (Finset.univ.filter (fun j ↦ ∀ i, c j ≤ c i)).min' (by
    obtain ⟨j, -, hj⟩ := Finset.univ.exists_min_image c Finset.univ_nonempty
    exact ⟨j, Finset.mem_filter.2 ⟨Finset.mem_univ _, fun i ↦ hj i (Finset.mem_univ _)⟩⟩)

/-- **4.2** The Akaike selector over a finite family of models. -/
def aicSelector {J : ℕ} [NeZero J] (S : Fin J → Submodule ℝ (EuclideanSpace ℝ (Fin n))) (σ : ℝ)
    (Y : EuclideanSpace ℝ (Fin n)) : Fin J :=
  smallestArgmin (fun j ↦ ‖Y - (S j).starProjection Y‖ ^ 2 / σ ^ 2 + 2 * Module.finrank ℝ (S j))

/-- **4.2** The Schwarz (BIC) selector over a finite family of models. -/
def bicSelector {J : ℕ} [NeZero J] (S : Fin J → Submodule ℝ (EuclideanSpace ℝ (Fin n))) (σ : ℝ)
    (Y : EuclideanSpace ℝ (Fin n)) : Fin J :=
  smallestArgmin (fun j ↦ ‖Y - (S j).starProjection Y‖ ^ 2 / σ ^ 2 +
    Module.finrank ℝ (S j) * Real.log n)

/-- **4.2** Akaike's selector overfits with probability bounded below. -/
theorem aic_overfit {J : ℕ} [NeZero J] (k : Fin J → ℕ) (hk : StrictMono k)
    (S : (n : ℕ) → Fin J → Submodule ℝ (EuclideanSpace ℝ (Fin n))) (hS : ∀ n, Monotone (S n))
    (hdim : ∀ᶠ n in atTop, ∀ j, Module.finrank ℝ (S n j) = k j)
    (f : (n : ℕ) → EuclideanSpace ℝ (Fin n)) (j₀ j₁ : Fin J) (hj : (j₁ : ℕ) = j₀ + 1)
    (hf : ∀ n, f n ∈ S n j₀)
    (hsep : ∀ j < j₀, Tendsto (fun n ↦ ‖f n - (S n j).starProjection (f n)‖ ^ 2 / Real.log n)
      atTop atTop) {σ : ℝ} (hσ : 0 < σ) :
    (TauCeti.Probability.chiSquaredMeasure (k j₁ - k j₀ : ℕ)).real
        {x | 2 * ((k j₁ - k j₀ : ℕ) : ℝ) < x} ≤
      liminf (fun n ↦ (stdGaussian (EuclideanSpace ℝ (Fin n))).real
        {ξ | j₀ < aicSelector (S n) σ (f n + σ • ξ)}) atTop ∧
    0 < (TauCeti.Probability.chiSquaredMeasure (k j₁ - k j₀ : ℕ)).real
        {x | 2 * ((k j₁ - k j₀ : ℕ) : ℝ) < x} := sorry

/-- **4.2** The Schwarz selector is consistent. -/
theorem bic_consistent {J : ℕ} [NeZero J] (k : Fin J → ℕ) (hk : StrictMono k)
    (S : (n : ℕ) → Fin J → Submodule ℝ (EuclideanSpace ℝ (Fin n))) (hS : ∀ n, Monotone (S n))
    (hdim : ∀ᶠ n in atTop, ∀ j, Module.finrank ℝ (S n j) = k j)
    (f : (n : ℕ) → EuclideanSpace ℝ (Fin n)) (j₀ : Fin J) (hf : ∀ n, f n ∈ S n j₀)
    (hsep : ∀ j < j₀, Tendsto (fun n ↦ ‖f n - (S n j).starProjection (f n)‖ ^ 2 / Real.log n)
      atTop atTop) {σ : ℝ} (hσ : 0 < σ) :
    Tendsto (fun n ↦ (stdGaussian (EuclideanSpace ℝ (Fin n))).real
      {ξ | bicSelector (S n) σ (f n + σ • ξ) = j₀}) atTop (𝓝 1) := sorry

/-- **4.3** The span of the columns of `X` indexed by `m`. -/
def columnSpan {p : ℕ} (X : Matrix (Fin n) (Fin p) ℝ) (m : Finset (Fin p)) :
    Submodule ℝ (EuclideanSpace ℝ (Fin n)) :=
  Submodule.span ℝ (designCol X '' (m : Set (Fin p)))

/-- **4.3** The model weights `π_m = 2^{-|m|-1} C(p, |m|)⁻¹` over subsets of columns. -/
def subsetWeight (p : ℕ) (m : Finset (Fin p)) : ℝ :=
  (2 : ℝ)⁻¹ ^ (m.card + 1) / (p.choose m.card)

/-- **4.3** The upper bound for sparse regression by penalized selection over column subsets
(Giraud, (3.16), by the same argument). -/
theorem sparse_regression_upper :
    ∃ κ₀ : ℝ, 0 < κ₀ ∧ ∀ κ > κ₀, ∃ C : ℝ, 0 < C ∧
      ∀ (n p D : ℕ) (X : Matrix (Fin n) (Fin p) ℝ) (σ : ℝ)
        (mh : EuclideanSpace ℝ (Fin n) → Finset (Fin p)), 0 < n → 0 < σ → 1 ≤ D → D ≤ p →
        Measurable mh →
        (∀ Y m, penalizedCriterion (columnSpan X)
            (fun m ↦ κ * σ ^ 2 * (Module.finrank ℝ (columnSpan X m) +
              Real.log (1 / subsetWeight p m)) / n) Y (mh Y) ≤
          penalizedCriterion (columnSpan X)
            (fun m ↦ κ * σ ^ 2 * (Module.finrank ℝ (columnSpan X m) +
              Real.log (1 / subsetWeight p m)) / n) Y m) →
        ∀ β : EuclideanSpace ℝ (Fin p), hammingNorm (WithLp.ofLp β) = D →
          Integrable (fun ξ ↦
              ‖(columnSpan X (mh (Matrix.toEuclideanLin X β + σ • ξ))).starProjection
                (Matrix.toEuclideanLin X β + σ • ξ) - Matrix.toEuclideanLin X β‖ ^ 2)
            (stdGaussian (EuclideanSpace ℝ (Fin n))) ∧
          ∫ ξ, ‖(columnSpan X (mh (Matrix.toEuclideanLin X β + σ • ξ))).starProjection
              (Matrix.toEuclideanLin X β + σ • ξ) - Matrix.toEuclideanLin X β‖ ^ 2
            ∂(stdGaussian (EuclideanSpace ℝ (Fin n))) ≤
            C * σ ^ 2 * D * Real.log (Real.exp 1 * p / D) := sorry

end Layer4

/-! ## Layer 5: sparse minimax rates -/

section Layer5

/-- **5.1** The risk of soft thresholding at `λ` for one standard Gaussian observation of mean
`μ`. Local copy: owned by `MathematicalStatisticsNonparametric`, 6.4. -/
def softThresholdRisk (l μ : ℝ) : ℝ :=
  ∫ z, (softThreshold l (μ + z) - μ) ^ 2 ∂(gaussianReal 0 1)

/-- **5.1** The Gaussian location experiment `θ ↦ N(θ, σ²I)` on a Euclidean space. -/
def gaussianLocationKernel (E : Type*) [NormedAddCommGroup E] [InnerProductSpace ℝ E]
    [FiniteDimensional ℝ E] [MeasurableSpace E] [BorelSpace E] (σ : ℝ) : Kernel E E :=
  (Kernel.deterministic id measurable_id ×ₖ Kernel.const E (stdGaussian E)).map
    (fun q ↦ q.1 + σ • q.2)

/-- **5.1** Coordinatewise soft thresholding of a vector. -/
def softThresholdVec {p : ℕ} (l : ℝ) (y : EuclideanSpace ℝ (Fin p)) : EuclideanSpace ℝ (Fin p) :=
  WithLp.toLp 2 (fun j ↦ softThreshold l (y j))

/-- **5.1** The vectors `Θ_s` with at most `s` nonzero coordinates. -/
def sparseVectors (p s : ℕ) : Set (EuclideanSpace ℝ (Fin p)) :=
  {θ | hammingNorm (WithLp.ofLp θ) ≤ s}

/-- **5.1** The scaled vector form of the soft-threshold risk: the exact coordinatewise
identity and the bound from the one-coordinate bounds of `MathematicalStatisticsNonparametric`,
6.4. -/
theorem softThreshold_vec_risk_le {p : ℕ} {σ l : ℝ} (hσ : 0 < σ) (hl : 0 ≤ l)
    (θ : EuclideanSpace ℝ (Fin p)) :
    ∫ y, ‖softThresholdVec (σ * l) y - θ‖ ^ 2
        ∂(gaussianLocationKernel (EuclideanSpace ℝ (Fin p)) σ θ) =
        σ ^ 2 * ∑ j, softThresholdRisk l (θ j / σ) ∧
      σ ^ 2 * ∑ j, softThresholdRisk l (θ j / σ) ≤
        σ ^ 2 * ∑ j, (Real.exp (-l ^ 2 / 2) + min (1 + l ^ 2) (θ j ^ 2 / σ ^ 2)) := sorry

/-- **5.1** The risk of soft thresholding at `σ√(2 log(p/s))` over `s`-sparse vectors
(Johnstone, (8.44)). -/
theorem softThreshold_sparse_risk_le {p s : ℕ} (hs : 1 ≤ s) (hsp : 2 * s ≤ p) {σ : ℝ}
    (hσ : 0 < σ) {θ : EuclideanSpace ℝ (Fin p)} (hθ : θ ∈ sparseVectors p s) :
    ∫ y, ‖softThresholdVec (σ * √(2 * Real.log (p / s))) y - θ‖ ^ 2
        ∂(gaussianLocationKernel (EuclideanSpace ℝ (Fin p)) σ θ) ≤
        2 * σ ^ 2 * s * (1 + Real.log (p / s)) ∧
      ∫ y, ‖softThresholdVec (σ * √(2 * Real.log (p / s))) y - θ‖ ^ 2
        ∂(gaussianLocationKernel (EuclideanSpace ℝ (Fin p)) σ θ) ≤
        (2 + 2 / Real.log 2) * σ ^ 2 * s * Real.log (p / s) := sorry

/-- **5.1** The risk of soft thresholding at the universal threshold `σ√(2 log p)`. -/
theorem softThreshold_universal_risk_le {p s : ℕ} (hp : 1 ≤ p) {σ : ℝ} (hσ : 0 < σ)
    {θ : EuclideanSpace ℝ (Fin p)} (hθ : θ ∈ sparseVectors p s) :
    ∫ y, ‖softThresholdVec (σ * √(2 * Real.log p)) y - θ‖ ^ 2
        ∂(gaussianLocationKernel (EuclideanSpace ℝ (Fin p)) σ θ) ≤
      σ ^ 2 * (1 + s * (1 + 2 * Real.log p)) := sorry

/-- **5.2** The minimax lower bound for sparse regression over `V_D(X)`, with a universal
constant (Giraud, Thm 3.5). -/
theorem sparse_regression_lower :
    ∃ c : ℝ, 0 < c ∧
      ∀ (n p D Dmax : ℕ) (X : Matrix (Fin n) (Fin p) ℝ) (clo chi σ : ℝ), 0 < clo → 0 < σ →
        (∀ β : EuclideanSpace ℝ (Fin p), hammingNorm (WithLp.ofLp β) ≤ 2 * Dmax →
          clo * ‖β‖ ≤ ‖Matrix.toEuclideanLin X β‖ ∧ ‖Matrix.toEuclideanLin X β‖ ≤ chi * ‖β‖) →
        5 * Dmax ≤ p → 1 ≤ D → D ≤ Dmax →
        ENNReal.ofReal (c * (clo / chi) ^ 2 * σ ^ 2 * D * Real.log (p / (5 * D))) ≤
          minimaxRisk
            (fun (f : {f : EuclideanSpace ℝ (Fin n) // ∃ β : EuclideanSpace ℝ (Fin p),
                hammingNorm (WithLp.ofLp β) = D ∧ f = Matrix.toEuclideanLin X β})
              (a : EuclideanSpace ℝ (Fin n)) ↦ ENNReal.ofReal (‖a - f.1‖ ^ 2))
            ((gaussianLocationKernel (EuclideanSpace ℝ (Fin n)) σ).comap Subtype.val
              measurable_subtype_coe) := sorry

/-- **5.2** The minimax rate of sparse regression over `V_D(X)` for `25D ≤ p`: the lower bound
of `sparse_regression_lower` and the upper bound of the estimator of 4.3. -/
theorem sparse_regression_minimax_rate :
    ∃ c C : ℝ, 0 < c ∧ 0 < C ∧
      ∀ (n p D Dmax : ℕ) (X : Matrix (Fin n) (Fin p) ℝ) (clo chi σ : ℝ), 0 < clo → 0 < σ →
        (∀ β : EuclideanSpace ℝ (Fin p), hammingNorm (WithLp.ofLp β) ≤ 2 * Dmax →
          clo * ‖β‖ ≤ ‖Matrix.toEuclideanLin X β‖ ∧ ‖Matrix.toEuclideanLin X β‖ ≤ chi * ‖β‖) →
        5 * Dmax ≤ p → 1 ≤ D → D ≤ Dmax → 25 * D ≤ p →
        ENNReal.ofReal (c * (clo / chi) ^ 2 * σ ^ 2 * D * Real.log (p / (5 * D))) ≤
            minimaxRisk
              (fun (f : {f : EuclideanSpace ℝ (Fin n) // ∃ β : EuclideanSpace ℝ (Fin p),
                  hammingNorm (WithLp.ofLp β) = D ∧ f = Matrix.toEuclideanLin X β})
                (a : EuclideanSpace ℝ (Fin n)) ↦ ENNReal.ofReal (‖a - f.1‖ ^ 2))
              ((gaussianLocationKernel (EuclideanSpace ℝ (Fin n)) σ).comap Subtype.val
                measurable_subtype_coe) ∧
          minimaxRisk
              (fun (f : {f : EuclideanSpace ℝ (Fin n) // ∃ β : EuclideanSpace ℝ (Fin p),
                  hammingNorm (WithLp.ofLp β) = D ∧ f = Matrix.toEuclideanLin X β})
                (a : EuclideanSpace ℝ (Fin n)) ↦ ENNReal.ofReal (‖a - f.1‖ ^ 2))
              ((gaussianLocationKernel (EuclideanSpace ℝ (Fin n)) σ).comap Subtype.val
                measurable_subtype_coe) ≤
            ENNReal.ofReal (C * σ ^ 2 * D * Real.log (p / (5 * D))) := sorry

/-- **5.3** The minimax rate `σ² s log(p/s)` over `s`-sparse vectors in the Gaussian sequence
model (Johnstone, Prop 8.20). -/
theorem sparse_minimax_rate :
    ∃ c C : ℝ, 0 < c ∧ 0 < C ∧
      ∀ (p s : ℕ) (σ : ℝ), 0 < σ → 1 ≤ s → 2 * s ≤ p →
        ENNReal.ofReal (c * σ ^ 2 * s * Real.log (p / s)) ≤
            minimaxRisk (fun (θ : sparseVectors p s) (a : EuclideanSpace ℝ (Fin p)) ↦
                ENNReal.ofReal (‖a - θ.1‖ ^ 2))
              ((gaussianLocationKernel (EuclideanSpace ℝ (Fin p)) σ).comap Subtype.val
                measurable_subtype_coe) ∧
          minimaxRisk (fun (θ : sparseVectors p s) (a : EuclideanSpace ℝ (Fin p)) ↦
                ENNReal.ofReal (‖a - θ.1‖ ^ 2))
              ((gaussianLocationKernel (EuclideanSpace ℝ (Fin p)) σ).comap Subtype.val
                measurable_subtype_coe) ≤
            ENNReal.ofReal (C * σ ^ 2 * s * Real.log (p / s)) := sorry

/-- **5.3** Soft thresholding at the universal threshold `σ√(2 log p)` is within a factor
depending only on `a` of the minimax risk over `Θ_s` when `s ≤ p^a`, `a < 1`. -/
theorem softThreshold_universal_near_minimax {a : ℝ} (ha : 0 ≤ a) (ha1 : a < 1) :
    ∃ C : ℝ, 0 < C ∧
      ∀ (p s : ℕ) (σ : ℝ), 0 < σ → 3 ≤ p → 1 ≤ s → (s : ℝ) ≤ (p : ℝ) ^ a →
        ∀ θ ∈ sparseVectors p s,
          ENNReal.ofReal (∫ y, ‖softThresholdVec (σ * √(2 * Real.log p)) y - θ‖ ^ 2
              ∂(gaussianLocationKernel (EuclideanSpace ℝ (Fin p)) σ θ)) ≤
            ENNReal.ofReal C *
              minimaxRisk (fun (θ : sparseVectors p s) (x : EuclideanSpace ℝ (Fin p)) ↦
                  ENNReal.ofReal (‖x - θ.1‖ ^ 2))
                ((gaussianLocationKernel (EuclideanSpace ℝ (Fin p)) σ).comap Subtype.val
                  measurable_subtype_coe) := sorry

end Layer5

/-! ## Layer 6: multiple testing -/

section Layer6

variable {m : ℕ} {Ω : Type*} [MeasurableSpace Ω]

/-- **6.1** The false discovery proportion `|R ∩ I₀| / max(|R|, 1)`. -/
def falseDiscoveryProportion (I₀ R : Finset (Fin m)) : ℝ :=
  ((R ∩ I₀).card : ℝ) / max (R.card : ℝ) 1

/-- **6.1** A valid (super-uniform) p-value. -/
def IsValidPValue (μ : Measure Ω) (q : Ω → ℝ) : Prop :=
  ∀ t ∈ Icc (0 : ℝ) 1, μ.real {ω | q ω ≤ t} ≤ t

/-- **6.1** The step-up count with thresholds `αβ(k)/m`: the largest `k ≤ m` with at least `k`
p-values at most `αβ(k)/m`. -/
def stepUpCount (β : ℕ → ℝ) (α : ℝ) (x : Fin m → ℝ) : ℕ :=
  ((Finset.range (m + 1)).filter
    (fun k ↦ k ≤ (Finset.univ.filter (fun i ↦ x i ≤ α * β k / m)).card)).sup id

/-- **6.1** The rejection set of the step-up procedure. -/
def stepUpRejections (β : ℕ → ℝ) (α : ℝ) (x : Fin m → ℝ) : Finset (Fin m) :=
  if stepUpCount β α x = 0 then ∅
  else Finset.univ.filter (fun i ↦ x i ≤ α * β (stepUpCount β α x) / m)

/-- **6.1** An increasing set of p-value vectors. -/
def IsIncreasingSet (D : Set (Fin m → ℝ)) : Prop :=
  ∀ x y, x ∈ D → x ≤ y → y ∈ D

/-- **6.1** Weak positive regression dependence on the null coordinates (Giraud, (10.14)). -/
def IsWPRD (μ : Measure Ω) (p : Ω → Fin m → ℝ) (I₀ : Finset (Fin m)) : Prop :=
  ∀ i ∈ I₀, ∀ D : Set (Fin m → ℝ), MeasurableSet D → IsIncreasingSet D →
    MonotoneOn (fun u ↦ μ.real ({ω | p ω ∈ D} ∩ {ω | p ω i ≤ u}) / μ.real {ω | p ω i ≤ u})
      {u | 0 < μ.real {ω | p ω i ≤ u}}

/-- **6.1** Positive regression dependence on the subset of null coordinates (Dickhaus,
Def 5.1): a version of the conditional law of `p` given `pᵢ` is monotone on increasing sets. -/
def IsPRDS (μ : Measure Ω) [IsFiniteMeasure μ] (p : Ω → Fin m → ℝ) (I₀ : Finset (Fin m)) :
    Prop :=
  ∀ i ∈ I₀, ∃ κ : Kernel ℝ (Fin m → ℝ),
    condDistrib p (fun ω ↦ p ω i) μ =ᵐ[μ.map (fun ω ↦ p ω i)] κ ∧
      ∀ D : Set (Fin m → ℝ), MeasurableSet D → IsIncreasingSet D → Monotone (fun t ↦ κ t D)

/-- **6.1** Independence of each null p-value from the others gives PRDS. -/
theorem isPRDS_of_indepFun {μ : Measure Ω} [IsProbabilityMeasure μ] {p : Ω → Fin m → ℝ}
    (hp : Measurable p) {I₀ : Finset (Fin m)}
    (hind : ∀ i ∈ I₀, IndepFun (fun ω ↦ p ω i) (fun ω (j : {j // j ≠ i}) ↦ p ω j) μ) :
    IsPRDS μ p I₀ := sorry

/-- **6.1** PRDS gives weak positive regression dependence. -/
theorem isWPRD_of_isPRDS {μ : Measure Ω} [IsProbabilityMeasure μ] {p : Ω → Fin m → ℝ}
    (hp : Measurable p) {I₀ : Finset (Fin m)} (h : IsPRDS μ p I₀) : IsWPRD μ p I₀ := sorry

/-- **6.2** The Benjamini–Hochberg procedure controls the false discovery rate under weak
positive regression dependence (Giraud, Thm 10.5; Dickhaus, Thm 5.3). -/
theorem bh_fdr_le {μ : Measure Ω} [IsProbabilityMeasure μ] {p : Ω → Fin m → ℝ}
    (hp : Measurable p) {I₀ : Finset (Fin m)} {α : ℝ} (hα : α ∈ Ioo (0 : ℝ) 1)
    (hvalid : ∀ i ∈ I₀, IsValidPValue μ (fun ω ↦ p ω i)) (hW : IsWPRD μ p I₀) :
    ∫ ω, falseDiscoveryProportion I₀ (stepUpRejections (fun k ↦ (k : ℝ)) α (p ω)) ∂μ ≤
      α * I₀.card / m := sorry

/-- **6.2** Exactness under independent uniform null p-values (Dickhaus, Thm 5.3, (5.13)). -/
theorem bh_fdr_eq {μ : Measure Ω} [IsProbabilityMeasure μ] {p : Ω → Fin m → ℝ}
    (hp : Measurable p) {I₀ : Finset (Fin m)} {α : ℝ} (hα : α ∈ Ioo (0 : ℝ) 1)
    (hunif : ∀ i ∈ I₀, ∀ t ∈ Icc (0 : ℝ) 1, μ.real {ω | p ω i ≤ t} = t)
    (hind : ∀ i ∈ I₀, IndepFun (fun ω ↦ p ω i) (fun ω (j : {j // j ≠ i}) ↦ p ω j) μ) :
    ∫ ω, falseDiscoveryProportion I₀ (stepUpRejections (fun k ↦ (k : ℝ)) α (p ω)) ∂μ =
      α * I₀.card / m := sorry

/-- **6.3** The general step-up bound under arbitrary dependence (Giraud, Thm 10.2). -/
theorem stepUp_fdr_le {μ : Measure Ω} [IsProbabilityMeasure μ] {p : Ω → Fin m → ℝ}
    (hp : Measurable p) {I₀ : Finset (Fin m)} {α : ℝ} (hα : 0 < α) {β : ℕ → ℝ}
    (hβ : Monotone β) (hβ0 : ∀ k, 0 ≤ β k)
    (hvalid : ∀ i ∈ I₀, IsValidPValue μ (fun ω ↦ p ω i)) :
    ∫ ω, falseDiscoveryProportion I₀ (stepUpRejections β α (p ω)) ∂μ ≤
      α * I₀.card / m *
        (∑ j ∈ Finset.Ico 1 m, β j / (j * (j + 1)) + β m / m) := sorry

/-- **6.3** The Benjamini–Yekutieli procedure controls the false discovery rate for every
joint law of valid null p-values (Dickhaus, Thm 5.5). -/
theorem by_fdr_le {μ : Measure Ω} [IsProbabilityMeasure μ] {p : Ω → Fin m → ℝ}
    (hp : Measurable p) {I₀ : Finset (Fin m)} {α : ℝ} (hα : 0 < α)
    (hvalid : ∀ i ∈ I₀, IsValidPValue μ (fun ω ↦ p ω i)) :
    ∫ ω, falseDiscoveryProportion I₀
        (stepUpRejections (fun k ↦ k / ∑ j ∈ Finset.Icc 1 m, (j : ℝ)⁻¹) α (p ω)) ∂μ ≤
      α * I₀.card / m := sorry

end Layer6

/-! ## Layer 7: low-rank and structured matrices -/

section Layer7

open scoped Matrix.Norms.L2Operator

variable {n d₁ d₂ : ℕ}

/-- The trace-regression observation operator `Θ ↦ (⟪Xᵢ, Θ⟫_F)ᵢ`. -/
def traceObs (Xs : Fin n → Matrix (Fin d₁) (Fin d₂) ℝ) (Θ : Matrix (Fin d₁) (Fin d₂) ℝ) :
    EuclideanSpace ℝ (Fin n) :=
  WithLp.toLp 2 (fun i ↦ frobInner (Xs i) Θ)

/-- The nuclear-norm penalized least-squares objective of trace regression. -/
def traceObjective (Xs : Fin n → Matrix (Fin d₁) (Fin d₂) ℝ) (y : EuclideanSpace ℝ (Fin n))
    (lam : ℝ) (Θ : Matrix (Fin d₁) (Fin d₂) ℝ) : ℝ :=
  ‖y - traceObs Xs Θ‖ ^ 2 / (2 * n) + lam * nuclearNorm Θ

/-- The component `Δ'' = P_{U⊥} Δ P_{V⊥}` of `Δ` relative to `Θ*`, with `U` the column space and
`V` the row space of `Θ*`. -/
def lowRankCompl (T D : Matrix (Fin d₁) (Fin d₂) ℝ) :
    EuclideanSpace ℝ (Fin d₂) →ₗ[ℝ] EuclideanSpace ℝ (Fin d₁) :=
  ((LinearMap.range (Matrix.toEuclideanLin T))ᗮ.starProjection).toLinearMap ∘ₗ
    Matrix.toEuclideanLin D ∘ₗ
      ((LinearMap.ker (Matrix.toEuclideanLin T)).starProjection).toLinearMap

/-- The nuclear cone `C(Θ*) = {Δ | nuclear(Δ'') ≤ 3 nuclear(Δ')}`. -/
def InNuclearCone (T D : Matrix (Fin d₁) (Fin d₂) ℝ) : Prop :=
  TauCeti.UnitarilyInvariantSeminorm.nuclear ℝ _ _ (lowRankCompl T D) ≤
    3 * TauCeti.UnitarilyInvariantSeminorm.nuclear ℝ _ _
      (Matrix.toEuclideanLin D - lowRankCompl T D)

/-- **7.1** The deterministic theorem for nuclear-norm trace regression. -/
theorem nuclear_trace_regression_det (hn : 0 < n) (Xs : Fin n → Matrix (Fin d₁) (Fin d₂) ℝ)
    (Θs : Matrix (Fin d₁) (Fin d₂) ℝ) {r : ℕ} (hr : Θs.rank ≤ r) (w : EuclideanSpace ℝ (Fin n))
    {lam κ : ℝ} (hlam : 0 < lam) (hκ : 0 < κ)
    (hG : 2 * ‖(n : ℝ)⁻¹ • ∑ i, w i • Xs i‖ ≤ lam)
    (hrsc : ∀ D, InNuclearCone Θs D → κ * frobNormSq D ≤ ‖traceObs Xs D‖ ^ 2 / n)
    {Θh : Matrix (Fin d₁) (Fin d₂) ℝ} (hΘh : IsMinOn (traceObjective Xs (traceObs Xs Θs + w) lam)
      univ Θh) :
    InNuclearCone Θs (Θh - Θs) ∧ √(frobNormSq (Θh - Θs)) ≤ 3 * lam * √(2 * r) / (2 * κ) := sorry

/-- **7.1** The rank-restricted isometry of the Gaussian ensemble with constant `1/2`
(Candès–Plan 2011). -/
theorem rankRIP_gaussian :
    ∃ C c : ℝ, 0 < C ∧ 0 < c ∧
      ∀ {Ω : Type*} [MeasurableSpace Ω] (μ : Measure Ω) [IsProbabilityMeasure μ] (n d₁ d₂ R : ℕ)
        (Xs : Ω → Fin n → Matrix (Fin d₁) (Fin d₂) ℝ),
        iIndepFun (fun ijk : Fin n × Fin d₁ × Fin d₂ ↦ fun ω ↦ Xs ω ijk.1 ijk.2.1 ijk.2.2) μ →
        (∀ i j k, HasLaw (fun ω ↦ Xs ω i j k) (gaussianReal 0 1) μ) →
        C * R * (d₁ + d₂) ≤ n →
        1 - 2 * Real.exp (-c * n) ≤ μ.real {ω | ∀ D : Matrix (Fin d₁) (Fin d₂) ℝ, D.rank ≤ R →
          frobNormSq D / 2 ≤ ‖traceObs (Xs ω) D‖ ^ 2 / n ∧
            ‖traceObs (Xs ω) D‖ ^ 2 / n ≤ 3 * frobNormSq D / 2} := sorry

/-- **7.1** Restricted strong convexity on the nuclear cone from the rank-restricted isometry of
order `74r` with constant `1/2`, with the constant `κ₀` of 3.4. -/
theorem rsc_of_rankRIP (Xs : Fin n → Matrix (Fin d₁) (Fin d₂) ℝ)
    {Θs : Matrix (Fin d₁) (Fin d₂) ℝ} {r : ℕ} (hr : Θs.rank ≤ r)
    (hRIP : ∀ D : Matrix (Fin d₁) (Fin d₂) ℝ, D.rank ≤ 74 * r →
      frobNormSq D / 2 ≤ ‖traceObs Xs D‖ ^ 2 / n ∧ ‖traceObs Xs D‖ ^ 2 / n ≤ 3 * frobNormSq D / 2)
    (D : Matrix (Fin d₁) (Fin d₂) ℝ) (hD : InNuclearCone Θs D) :
    ((2 / 3) * (1 / √2 - √6 / 4)) ^ 2 * frobNormSq D ≤ ‖traceObs Xs D‖ ^ 2 / n := sorry

/-- **7.1** Nuclear-norm trace regression for the Gaussian ensemble (Wainwright, Cor 10.10, with
universal constants). -/
theorem nuclear_trace_regression_gaussian :
    ∃ c₀ c C c₁ c₂ : ℝ, 0 < c₀ ∧ 0 < c ∧ 0 < C ∧ 0 < c₁ ∧ 0 < c₂ ∧
      ∀ {Ω : Type*} [MeasurableSpace Ω] (μ : Measure Ω) [IsProbabilityMeasure μ] (n d₁ d₂ r : ℕ)
        (Xs : Ω → Fin n → Matrix (Fin d₁) (Fin d₂) ℝ) (w : Ω → EuclideanSpace ℝ (Fin n))
        (Θs : Matrix (Fin d₁) (Fin d₂) ℝ) (σ δ : ℝ),
        iIndepFun (fun ijk : Fin n × Fin d₁ × Fin d₂ ↦ fun ω ↦ Xs ω ijk.1 ijk.2.1 ijk.2.2) μ →
        (∀ i j k, HasLaw (fun ω ↦ Xs ω i j k) (gaussianReal 0 1) μ) →
        iIndepFun (fun i ω ↦ w ω i) μ →
        (∀ i, HasLaw (fun ω ↦ w ω i) (gaussianReal 0 (σ ^ 2).toNNReal) μ) →
        IndepFun Xs w μ → 0 < σ → Θs.rank ≤ r → c * r * (d₁ + d₂) < n → 0 < δ → δ ≤ 1 →
        μ {ω | ¬ ∀ Θh, IsMinOn (traceObjective (Xs ω) (traceObs (Xs ω) Θs + w ω)
            (c₀ * σ * (√((d₁ + d₂ : ℝ) / n) + δ))) univ Θh →
              frobNormSq (Θh - Θs) ≤ C * σ ^ 2 * (r * (d₁ + d₂) / n + r * δ ^ 2)} ≤
          ENNReal.ofReal (c₁ * Real.exp (-c₂ * n * δ ^ 2)) := sorry

/-- **7.2** The hard-threshold operator `T_λ`. -/
def hardThreshold {p : ℕ} (lam : ℝ) (M : Matrix (Fin p) (Fin p) ℝ) : Matrix (Fin p) (Fin p) ℝ :=
  Matrix.of fun j k ↦ if lam < |M j k| then M j k else 0

/-- The `0–1` support pattern of a matrix. -/
def supportPattern {p : ℕ} (M : Matrix (Fin p) (Fin p) ℝ) : Matrix (Fin p) (Fin p) ℝ :=
  Matrix.of fun j k ↦ if M j k ≠ 0 then 1 else 0

/-- **7.2** The deterministic thresholding bound (Wainwright, Thm 6.23; Bickel–Levina). -/
theorem norm_hardThreshold_sub_le {p s : ℕ} {Sig Sh : Matrix (Fin p) (Fin p) ℝ} (hSig : Sig.IsSymm)
    (hs : ∀ j, (Finset.univ.filter (fun k ↦ Sig j k ≠ 0)).card ≤ s) {lam : ℝ}
    (h : ∀ j k, |Sh j k - Sig j k| ≤ lam) :
    ‖hardThreshold lam Sh - Sig‖ ≤ 2 * lam * ‖supportPattern Sig‖ ∧
      ‖supportPattern Sig‖ ≤ s := sorry

/-- **7.2** Thresholded covariance estimation with sub-Gaussian coordinates, at
`δ = √((log p)/n)`. -/
theorem hardThreshold_covariance_prob :
    ∃ c₀ c₁ c₂ : ℝ, 0 < c₀ ∧ 0 < c₁ ∧ 0 < c₂ ∧
      ∀ {Ω : Type*} [MeasurableSpace Ω] (μ : Measure Ω) [IsProbabilityMeasure μ] (n p s : ℕ)
        (x : Fin n → Ω → EuclideanSpace ℝ (Fin p)) (Sig : Matrix (Fin p) (Fin p) ℝ) (σ : ℝ≥0),
        iIndepFun x μ → (∀ i, Measurable (x i)) →
        (∀ i j, HasSubgaussianMGF (fun ω ↦ x i ω j) (σ ^ 2) μ) →
        (∀ i j k, ∫ ω, x i ω j * x i ω k ∂μ = Sig j k) → Sig.IsSymm →
        (∀ j, (Finset.univ.filter (fun k ↦ Sig j k ≠ 0)).card ≤ s) → Real.log p < n →
        1 - c₁ * (p : ℝ) ^ (-c₂) ≤ μ.real {ω |
          ‖hardThreshold ((σ : ℝ) ^ 2 * (c₀ + 1) * √(Real.log p / n))
              (Matrix.of fun j k ↦ (n : ℝ)⁻¹ * ∑ i, x i ω j * x i ω k) - Sig‖ ≤
            2 * (c₀ + 1) * s * (σ : ℝ) ^ 2 * √(Real.log p / n)} := sorry

/-- The neighbourhood `N(j) = {k ≠ j | Θⱼₖ ≠ 0}` of `j` in the graph of `Θ = Σ⁻¹`. -/
def neighbourhood {p : ℕ} (Sig : Matrix (Fin p) (Fin p) ℝ) (j : Fin p) : Finset (Fin p) :=
  Finset.univ.filter (fun k ↦ k ≠ j ∧ Sig⁻¹ j k ≠ 0)

/-- **7.3** Gaussian regression of one coordinate on the others: the residual of the regression
with coefficients `-Θⱼₖ/Θⱼⱼ` is `N(0, 1/Θⱼⱼ)` and independent of the other coordinates. -/
theorem gaussian_regression_coeff {Ω : Type*} [MeasurableSpace Ω] {μ : Measure Ω}
    [IsProbabilityMeasure μ] {p : ℕ} {Sig : Matrix (Fin p) (Fin p) ℝ} (hSig : Sig.PosDef)
    {x : Ω → EuclideanSpace ℝ (Fin p)} (hx : HasLaw x (multivariateGaussian 0 Sig) μ) (j : Fin p) :
    HasLaw (fun ω ↦ x ω j + ∑ k ∈ Finset.univ.erase j, Sig⁻¹ j k / Sig⁻¹ j j * x ω k)
        (gaussianReal 0 (1 / Sig⁻¹ j j).toNNReal) μ ∧
      IndepFun (fun ω ↦ x ω j + ∑ k ∈ Finset.univ.erase j, Sig⁻¹ j k / Sig⁻¹ j j * x ω k)
        (fun ω (k : {k // k ≠ j}) ↦ x ω k) μ ∧
      1 / Sig⁻¹ j j ≤ Sig j j := sorry

/-- **7.3** Neighbourhood selection by node-wise lasso (Wainwright, Thm 11.12, by the same
argument: the edge condition bounds the regression coefficients, the constants other than `c₀`
depend on `α` and `b`, and the sample size is `n ≥ c₁ m max(m, log p)`). The data matrix has
rows `x i ω`; the regression of coordinate `j` uses the design of the other coordinates. -/
theorem neighbourhood_selection :
    ∃ c₀ : ℝ, 0 < c₀ ∧ ∀ α b : ℝ, 0 < α → α ≤ 1 → 1 ≤ b →
    ∃ c₁ c₂ c₃ : ℝ, 0 < c₁ ∧ 0 < c₂ ∧ 0 < c₃ ∧
      ∀ {Ω : Type*} [MeasurableSpace Ω] (μ : Measure Ω) [IsProbabilityMeasure μ] (n p m : ℕ)
        (Sig : Matrix (Fin p) (Fin p) ℝ) (x : Fin n → Ω → EuclideanSpace ℝ (Fin p)) (δ : ℝ),
        Sig.PosDef → (∀ j, Sig j j ≤ 1) → iIndepFun x μ →
        (∀ i, HasLaw (x i) (multivariateGaussian 0 Sig) μ) →
        1 ≤ m → (∀ j, (neighbourhood Sig j).card ≤ m) →
        c₁ * m * max (m : ℝ) (Real.log p) ≤ n → 0 < δ → δ ≤ 1 →
        (∀ j, ∀ k ∉ neighbourhood Sig j, k ≠ j →
          ∑ l : neighbourhood Sig j, |∑ l' : neighbourhood Sig j,
            Sig k l' * ((Sig.submatrix (Subtype.val : neighbourhood Sig j → Fin p)
              Subtype.val)⁻¹) l' l| ≤ 1 - α) →
        (∀ j, ∀ k : neighbourhood Sig j, ∑ l : neighbourhood Sig j,
          |((Sig.submatrix (Subtype.val : neighbourhood Sig j → Fin p) Subtype.val)⁻¹) k l| ≤ b) →
        μ {ω | ¬ ∀ βh : (j : Fin p) → EuclideanSpace ℝ {k // k ≠ j},
            (∀ j, IsLassoSolution (Matrix.of fun i (k : {k // k ≠ j}) ↦ x i ω k)
              (WithLp.toLp 2 (fun i ↦ x i ω j))
              (c₀ / α * (√(Real.log p / n) + δ)) (βh j)) →
            ∀ j k (hjk : j ≠ k),
              ((βh j ⟨k, hjk.symm⟩ ≠ 0 ∨ βh k ⟨j, hjk⟩ ≠ 0) → Sig⁻¹ j k ≠ 0) ∧
              (7 * b * (c₀ / α * (√(Real.log p / n) + δ)) * max (Sig⁻¹ j j) (Sig⁻¹ k k) <
                  |Sig⁻¹ j k| →βh j ⟨k, hjk.symm⟩ ≠ 0 ∧ βh k ⟨j, hjk⟩ ≠ 0)} ≤
          ENNReal.ofReal (c₂ * Real.exp (-c₃ * n * min (δ ^ 2) (1 / m))) := sorry

/-- **7.4** The graphical lasso objective `tr(ΘΣ̂) - log det Θ + λ ∑_{j ≠ k} |Θⱼₖ|`. -/
def glassoObjective {p : ℕ} (Sh : Matrix (Fin p) (Fin p) ℝ) (lam : ℝ)
    (Θ : Matrix (Fin p) (Fin p) ℝ) : ℝ :=
  (Θ * Sh).trace - Real.log Θ.det + lam * ∑ j, ∑ k, if j ≠ k then |Θ j k| else 0

/-- **7.4** Existence and uniqueness of the graphical lasso estimate. -/
theorem existsUnique_graphicalLasso {p : ℕ} {Sh : Matrix (Fin p) (Fin p) ℝ}
    (hSh : Sh.PosSemidef) (hdiag : ∀ j, 0 < Sh j j) {lam : ℝ} (hlam : 0 < lam) :
    ∃! Θh, Θh.PosDef ∧ IsMinOn (glassoObjective Sh lam) {Θ | Θ.PosDef} Θh := sorry

/-- **7.4** The deterministic Frobenius bound for the graphical lasso (Wainwright, Prop 11.9). -/
theorem graphicalLasso_frobenius_det {p m : ℕ} {Θs Sh : Matrix (Fin p) (Fin p) ℝ}
    (hΘs : Θs.PosDef) (hm : ∀ j, (Finset.univ.filter (fun k ↦ Θs j k ≠ 0)).card ≤ m) {lam : ℝ}
    (hlam : 0 < lam) (hev : ∀ j k, |Sh j k - Θs⁻¹ j k| ≤ lam / 2)
    (hsmall : 3 * (‖Θs‖ + 1) ^ 2 * lam * √(m * p) < 1) {Θh : Matrix (Fin p) (Fin p) ℝ}
    (hΘh : Θh.PosDef) (hmin : IsMinOn (glassoObjective Sh lam) {Θ | Θ.PosDef} Θh) :
    frobNormSq (Θh - Θs) ≤ 9 * (‖Θs‖ + 1) ^ 4 * m * p * lam ^ 2 := sorry

/-- **7.4** The covariance-error event `maxⱼₖ |Σ̂ⱼₖ - Σⱼₖ| ≤ λ/2` for sub-Gaussian coordinates,
at `λ = c₀σ²(√((log p)/n) + δ)`. This is the `hev` hypothesis of
`graphicalLasso_frobenius_det` only; the smallness hypothesis `hsmall` is separate and
deterministic. -/
theorem graphicalLasso_covarianceEvent_prob :
    ∃ c₀ c₁ c₂ : ℝ, 0 < c₀ ∧ 0 < c₁ ∧ 0 < c₂ ∧
      ∀ {Ω : Type*} [MeasurableSpace Ω] (μ : Measure Ω) [IsProbabilityMeasure μ] (n p : ℕ)
        (x : Fin n → Ω → EuclideanSpace ℝ (Fin p)) (Sig : Matrix (Fin p) (Fin p) ℝ) (σ : ℝ≥0)
        (δ : ℝ), iIndepFun x μ → (∀ i, Measurable (x i)) →
        (∀ i j, HasSubgaussianMGF (fun ω ↦ x i ω j) (σ ^ 2) μ) →
        (∀ i j k, ∫ ω, x i ω j * x i ω k ∂μ = Sig j k) → Real.log p < n → 0 < δ → δ ≤ 1 →
        1 - c₁ * Real.exp (-c₂ * n * δ ^ 2) ≤ μ.real {ω | ∀ j k,
          |(n : ℝ)⁻¹ * ∑ i, x i ω j * x i ω k - Sig j k| ≤
            c₀ * (σ : ℝ) ^ 2 * (√(Real.log p / n) + δ) / 2} := sorry

end Layer7

/-! ## Layer 8: principal components -/

section Layer8

/-- A leading unit eigenvector of a symmetric operator: a unit maximizer of the Rayleigh
quotient. -/
def IsLeadingUnitEigenvector {E : Type*} [NormedAddCommGroup E] [InnerProductSpace ℝ E]
    (M : E →ₗ[ℝ] E) (u : E) : Prop :=
  ‖u‖ = 1 ∧ ∀ v, ⟪v, M v⟫ ≤ ⟪u, M u⟫ * ‖v‖ ^ 2

/-- **8.1** Davis–Kahan for the leading eigenvector (Wainwright, Thm 8.5). -/
theorem leading_eigenvector_perturbation {E : Type*} [NormedAddCommGroup E]
    [InnerProductSpace ℝ E] [FiniteDimensional ℝ E] {Sig P : E →L[ℝ] E} (hSig : IsSelfAdjoint Sig)
    (hP : IsSelfAdjoint P) {θ : E} (hθ : ‖θ‖ = 1) {γ ν : ℝ} (hγ : Sig θ = γ • θ) (hν : 0 < ν)
    (hgap : ∀ u, ⟪u, θ⟫ = 0 → ⟪u, Sig u⟫ ≤ (γ - ν) * ‖u‖ ^ 2) (hPν : ‖P‖ < ν / 2) :
    ∃ θh, IsLeadingUnitEigenvector ((Sig + P : E →L[ℝ] E) : E →ₗ[ℝ] E) θh ∧ 0 ≤ ⟪θh, θ⟫ ∧
      (∀ u, IsLeadingUnitEigenvector ((Sig + P : E →L[ℝ] E) : E →ₗ[ℝ] E) u → u = θh ∨ u = -θh) ∧
      ‖θh - θ‖ ≤ √2 * ‖P θ - ⟪θ, P θ⟫ • θ‖ / (ν - 2 * ‖P‖) := sorry

/-- **8.2** The leading sample eigenvector in the spiked sub-Gaussian ensemble (corrects
Wainwright, Cor 8.7, whose exponent `n min(√ν δ, νδ²)` fails for large `ν`). The observations
are `xᵢ = √ν ξᵢ θ + wᵢ`. -/
theorem spiked_leading_eigenvector :
    ∃ c₀ c₁ c₂ : ℝ, 0 < c₀ ∧ 0 < c₁ ∧ 0 < c₂ ∧
      ∀ {Ω : Type*} [MeasurableSpace Ω] (μ : Measure Ω) [IsProbabilityMeasure μ] (n p : ℕ)
        (θ : EuclideanSpace ℝ (Fin p)) (ν δ : ℝ) (ξ : Fin n → Ω → ℝ)
        (w : Fin n → Ω → EuclideanSpace ℝ (Fin p)),
        ‖θ‖ = 1 → 0 < ν → p < n → (ν + 1) / ν ^ 2 * (p / n) ≤ 1 / 128 → 0 < δ →
        (∀ i, Measurable (ξ i) ∧ Measurable (w i)) →
        iIndepFun (fun i ω ↦ (ξ i ω, w i ω)) μ → (∀ i, IndepFun (ξ i) (w i) μ) →
        (∀ i, HasSubgaussianMGF (ξ i) 1 μ) → (∀ i, ∫ ω, ξ i ω ^ 2 ∂μ = 1) →
        (∀ i, IsSubgaussianVector μ (w i) 1) →
        (∀ i u v, ∫ ω, ⟪u, w i ω⟫ * ⟪v, w i ω⟫ ∂μ = ⟪u, v⟫) →
        μ {ω | ¬ ∀ θh, IsLeadingUnitEigenvector (Matrix.toEuclideanLin (Matrix.of fun j k ↦
              (n : ℝ)⁻¹ * ∑ i, (√ν * ξ i ω * θ j + w i ω j) * (√ν * ξ i ω * θ k + w i ω k))) θh →
            0 ≤ ⟪θh, θ⟫ → ‖θh - θ‖ ≤ c₀ * √((ν + 1) / ν ^ 2 * (p / n)) + δ} ≤
          ENNReal.ofReal (c₁ * Real.exp (-c₂ * n * min 1 (min (ν * δ ^ 2) (ν ^ 2 * δ ^ 2)))) :=
          sorry

/-- **8.3** The Marchenko–Pastur law for the sample covariance of the `n × p(n)` corners of an
infinite i.i.d. array, as weak convergence of the empirical spectral measures, simultaneously for
all bounded continuous test functions. The matrix `XᵀX/n` is Tau Ceti's sample second moment of
the rows. -/
theorem marchenkoPastur_sampleCov_ae {Ω : Type*} [MeasurableSpace Ω] {μ : Measure Ω}
    [IsProbabilityMeasure μ] {x : ℕ → ℕ → Ω → ℝ} (hmeas : ∀ i j, Measurable (x i j))
    (hind : iIndepFun (fun ij : ℕ × ℕ ↦ x ij.1 ij.2) μ)
    (hid : ∀ i j, IdentDistrib (x i j) (x 0 0) μ μ) (hmean : ∫ ω, x 0 0 ω ∂μ = 0)
    (hvar : ∫ ω, x 0 0 ω ^ 2 ∂μ = 1) {p : ℕ → ℕ} (hp : ∀ n, 1 ≤ p n) {y : ℝ≥0} (hy : 0 < y)
    (hpy : Tendsto (fun n ↦ (p n : ℝ) / n) atTop (𝓝 (y : ℝ))) :
    ∀ᵐ ω ∂μ, ∀ f : BoundedContinuousFunction ℝ ℝ, Tendsto (fun n ↦ (p n : ℝ)⁻¹ * ∑ k,
        f ((TauCeti.isHermitian_sampleSecondMoment
          (fun i : Fin n ↦ fun j : Fin (p n) ↦ x i j ω)).eigenvalues₀ k))
      atTop (𝓝 (∫ t, f t ∂(TauCeti.Probability.marchenkoPastur y))) := sorry

/-- **8.3** The largest eigenvalue of the sample covariance of the `n × p(n)` corners of an
infinite i.i.d. array with a finite fourth moment tends to `(1 + √y)²` almost surely. -/
theorem largest_eigenvalue_sampleCov_ae {Ω : Type*} [MeasurableSpace Ω] {μ : Measure Ω}
    [IsProbabilityMeasure μ] {x : ℕ → ℕ → Ω → ℝ} (hmeas : ∀ i j, Measurable (x i j))
    (hind : iIndepFun (fun ij : ℕ × ℕ ↦ x ij.1 ij.2) μ)
    (hid : ∀ i j, IdentDistrib (x i j) (x 0 0) μ μ) (hmean : ∫ ω, x 0 0 ω ∂μ = 0)
    (hvar : ∫ ω, x 0 0 ω ^ 2 ∂μ = 1) (h4 : MemLp (x 0 0) 4 μ) {p : ℕ → ℕ} (hp : ∀ n, 1 ≤ p n)
    {y : ℝ} (hy : 0 < y) (hpy : Tendsto (fun n ↦ (p n : ℝ) / n) atTop (𝓝 y)) :
    ∀ᵐ ω ∂μ, Tendsto (fun n ↦ (TauCeti.isHermitian_sampleSecondMoment
        (fun i : Fin n ↦ fun j : Fin (p n) ↦ x i j ω)).eigenvalues₀
          ⟨0, by rw [Fintype.card_fin]; exact hp n⟩)
      atTop (𝓝 ((1 + √y) ^ 2)) := sorry

/-- The limiting squared overlap `((ℓ - 1)² - y)/((ℓ - 1)(ℓ - 1 + y))` of the leading sample
eigenvector with the spike direction. -/
def spikeOverlap (y ℓ : ℝ) : ℝ :=
  ((ℓ - 1) ^ 2 - y) / ((ℓ - 1) * (ℓ - 1 + y))

/-- **8.3** The spiked Gaussian sample covariance with population covariance
`diag(ℓ, 1, …, 1)`, `ℓ > 1`, and `p(n)/n → y ∈ (0, 1)`: the largest eigenvalue and the squared
overlap of every leading unit eigenvector with `e₀` converge almost surely. -/
theorem spiked_sampleCov_ae {Ω : Type*} [MeasurableSpace Ω] {μ : Measure Ω}
    [IsProbabilityMeasure μ] {x : ℕ → ℕ → Ω → ℝ} (hmeas : ∀ i j, Measurable (x i j))
    (hind : iIndepFun (fun ij : ℕ × ℕ ↦ x ij.1 ij.2) μ) {ℓ : ℝ≥0} (hℓ : 1 < ℓ)
    (hlaw0 : ∀ i, HasLaw (x i 0) (gaussianReal 0 ℓ) μ)
    (hlaw : ∀ i j, j ≠ 0 → HasLaw (x i j) (gaussianReal 0 1) μ) {p : ℕ → ℕ} (hp : ∀ n, 1 ≤ p n)
    {y : ℝ} (hy : 0 < y) (hy1 : y < 1) (hpy : Tendsto (fun n ↦ (p n : ℝ) / n) atTop (𝓝 y)) :
    ∀ᵐ ω ∂μ,
      Tendsto (fun n ↦ (TauCeti.isHermitian_sampleSecondMoment
          (fun i : Fin n ↦ fun j : Fin (p n) ↦ x i j ω)).eigenvalues₀
            ⟨0, by rw [Fintype.card_fin]; exact hp n⟩)
        atTop (𝓝 (if 1 + √y < ℓ then ℓ * (1 + y / (ℓ - 1)) else (1 + √y) ^ 2)) ∧
      ∀ u : (n : ℕ) → EuclideanSpace ℝ (Fin (p n)),
        (∀ n, IsLeadingUnitEigenvector (Matrix.toEuclideanLin (TauCeti.sampleSecondMoment
          (fun i : Fin n ↦ fun j : Fin (p n) ↦ x i j ω))) (u n)) →
        Tendsto (fun n ↦ u n ⟨0, hp n⟩ ^ 2) atTop
          (𝓝 (if 1 + √y < ℓ then spikeOverlap y ℓ else 0)) := sorry

/-- **8.3** Inconsistency of the leading sample eigenvector in the spiked Gaussian model: for
every `ℓ > 1`, almost surely no choice of leading unit eigenvectors has `|⟪ûₙ, e₀⟫| → 1`. -/
theorem spiked_sampleEigenvector_not_tendsto_one {Ω : Type*} [MeasurableSpace Ω] {μ : Measure Ω}
    [IsProbabilityMeasure μ] {x : ℕ → ℕ → Ω → ℝ} (hmeas : ∀ i j, Measurable (x i j))
    (hind : iIndepFun (fun ij : ℕ × ℕ ↦ x ij.1 ij.2) μ) {ℓ : ℝ≥0} (hℓ : 1 < ℓ)
    (hlaw0 : ∀ i, HasLaw (x i 0) (gaussianReal 0 ℓ) μ)
    (hlaw : ∀ i j, j ≠ 0 → HasLaw (x i j) (gaussianReal 0 1) μ) {p : ℕ → ℕ} (hp : ∀ n, 1 ≤ p n)
    {y : ℝ} (hy : 0 < y) (hy1 : y < 1) (hpy : Tendsto (fun n ↦ (p n : ℝ) / n) atTop (𝓝 y)) :
    ∀ᵐ ω ∂μ, ∀ u : (n : ℕ) → EuclideanSpace ℝ (Fin (p n)),
      (∀ n, IsLeadingUnitEigenvector (Matrix.toEuclideanLin (TauCeti.sampleSecondMoment
        (fun i : Fin n ↦ fun j : Fin (p n) ↦ x i j ω))) (u n)) →
      ¬ Tendsto (fun n ↦ |u n ⟨0, hp n⟩|) atTop (𝓝 1) := sorry

end Layer8

-- Library declarations cited in the README

#check @ProbabilityTheory.HasSubgaussianMGF
#check @ProbabilityTheory.HasSubgaussianMGF.measure_ge_le
#check @ProbabilityTheory.HasSubgaussianMGF.const_mul
#check @ProbabilityTheory.HasSubgaussianMGF.sum_of_iIndepFun
#check @ProbabilityTheory.mgf
#check @ProbabilityTheory.gaussianReal
#check @ProbabilityTheory.mgf_id_gaussianReal
#check @ProbabilityTheory.stdGaussian
#check @ProbabilityTheory.multivariateGaussian
#check @ProbabilityTheory.iIndepFun
#check @ProbabilityTheory.IndepFun
#check @ProbabilityTheory.HasLaw
#check @ProbabilityTheory.condDistrib
#check @ProbabilityTheory.cdf
#check @MeasureTheory.TendstoInMeasure
#check @ProbabilityTheory.minimaxRisk
#check @ProbabilityTheory.Kernel.deterministic
#check @ProbabilityTheory.Kernel.map
#check @ProbabilityTheory.Kernel.comap
#check @InformationTheory.klDiv
#check @MeasureTheory.tvDist
#check @hammingNorm
#check @hammingDist
#check @Matrix.toEuclideanLin
#check @Matrix.l2_opNorm_def
#check @Matrix.l2_opNorm_mulVec
#check @Matrix.IsHermitian.eigenvalues₀
#check @LinearMap.singularValues
#check @Matrix.PosDef
#check @Matrix.PosSemidef
#check @Submodule.starProjection
#check @Matrix.det
#check @IsMinOn
#check @ConvexOn
#check @StrictConvexOn
#check @TauCeti.Probability.chiSquaredMeasure
#check @TauCeti.Probability.mgf_id_chiSquaredMeasure
#check @ProbabilityTheory.HasLaw.norm_sq_orthogonalProjectionOnto_stdGaussian
#check @ProbabilityTheory.HasLaw.iIndepFun_norm_sq_orthogonalProjectionOnto_stdGaussian
#check @EuclideanSpace.gaussianCondMean
#check @TauCeti.Probability.condDistrib_multivariateGaussian
#check @ProbabilityTheory.HasLaw.indepFun_gaussianResidual
#check @TauCeti.Probability.marchenkoPastur
#check @TauCeti.etvDist_sq_le_two_mul_klDiv
#check @TauCeti.sampleSecondMoment
#check @TauCeti.isHermitian_sampleSecondMoment
#check @Matrix.norm_toEuclideanLin_le_of_entry_le
#check @LinearMap.IsSymmetric.abs_eigenvalue_sub_eigenvalue_le_norm
#check @TauCeti.UnitarilyInvariantSeminorm.nuclear
#check @TauCeti.UnitarilyInvariantSeminorm.nuclear_apply
#check @TauCeti.UnitarilyInvariantSeminorm.nuclear_apply_le_sqrt_finrank_range_mul_frobenius_apply
#check @TauCeti.UnitarilyInvariantSeminorm.mul_map_starProjection_comp_le_map_sylvester_apply
#check @TauCeti.UnitarilyInvariantSeminorm.opNorm
#check @TauCeti.subdifferential
#check @TauCeti.mem_subdifferential_coe_iff_isMinOn_sub
#check @TauCeti.exists_finset_isCover_sphere
#check @Nat.choose_le_pow_div
#check @TauCeti.exists_finset_isCover_of_subset_closedBall

end TauCetiRoadmap.MathematicalStatisticsHighDimensional
