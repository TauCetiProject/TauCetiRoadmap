module

import Mathlib
import TauCeti.Analysis.OperatorIdeal.Family.Schatten
import TauCeti.Analysis.InnerProductSpace.UnitarilyInvariantSeminorm.Schatten
import TauCeti.Analysis.Fourier.L2Multiplier
import TauCeti.Analysis.Matrix.Frobenius
import TauCeti.MeasureTheory.Measure.Atom

/-!
# Schatten classes and Schur multipliers: target signatures

The roadmap is `README.md`; this file is not the roadmap. It states the roadmap's headline
theorems against the pinned Mathlib and Tau Ceti, each with `sorry`.

A Schur multiplier is stated through kernels, so that no operator is defined here whose
construction is itself a theorem: `IsKernelOperator μ k T` says that `T` is the integral
operator of the kernel `k`, and `schurNorm μ p M` is the supremum of `‖B‖_p` over pairs `(A, B)`
of integral operators with kernels `k ∈ L²(μ ⊗ μ)` and `M · k` with `‖A‖_p ≤ 1`. Through the
kernel theorem of README §2.1 (every Hilbert–Schmidt operator is the integral operator of a
unique `L²` kernel) this is the norm `‖S_M‖_{S_p → S_p}` of README §1.4 and §3.3. The Schatten
gauge is the extended gauge of README §1.1, whose `p = ∞` endpoint is the compact operators.

Stated here: the isometry of `M ↦ S_M` on `S₂` (README §3.2, §3.5), the invariance of the norms
under `p ↦ p'` and under transposition of the symbol (§4.1), their log-convexity in `1/p` and
monotonicity in `|1/p − 1/2|` (§4.2), the Schur product theorem with its norm formula (§6.1), the
Grothendieck–Haagerup characterisation on σ-finite measure spaces (§6.4), the Lafforgue–de la
Salle theorem on atomless spaces (§7.3), the continuous-symbol theorem on Radon measure spaces
(§8.2), Fourier–Schur transference on `ℝⁿ` (§9.5) and the Hörmander–Mikhlin–Schur theorem
(§11.5).

Not stated: that `M ↦ S_M` is multiplicative and `*`-preserving on `B(S₂)` (README §3.2). Its
statement needs the map `A ↦ S_M(A)` on Hilbert–Schmidt operators, that is the kernel `k_A` of a
Hilbert–Schmidt operator on an arbitrary σ-finite measure space, which neither Mathlib nor Tau
Ceti has at the pins (README §2.1 builds it). The isometry half is stated through `schurNorm`.
-/

noncomputable section

open MeasureTheory
open scoped ENNReal NNReal InnerProductSpace ComplexOrder Matrix.Norms.Frobenius

namespace TauCetiRoadmap.SchattenClassesAndSchurMultipliers

/-! ## Layer 1: the Schatten scale with its compact endpoint -/

section Gauge

variable {E F : Type*} [NormedAddCommGroup E] [InnerProductSpace ℂ E] [CompleteSpace E]
  [NormedAddCommGroup F] [InnerProductSpace ℂ F] [CompleteSpace F]

open Classical in
/-- The extended Schatten gauge `‖X‖_p ∈ [0, ∞]` of a bounded operator (README §1.1): for finite
`p ≥ 1` the Schatten gauge `(Σ' aₙ(X)^p)^{1/p}` of Tau Ceti's
`TauCeti.OperatorIdealFamily.schatten`, and for `p = ∞` the operator norm when `X` is compact and
`∞` otherwise, so that the operators of finite gauge at `p = ∞` form the compact endpoint `S_∞`
and not all of `B(H)`. -/
def schattenGauge (p : ℝ≥0∞) [Fact (1 ≤ p)] (X : E →L[ℂ] F) : ℝ≥0∞ :=
  if hp : p = ∞ then (if IsCompactOperator X then ‖X‖ₑ else ∞)
  else (TauCeti.OperatorIdealFamily.schatten ℂ p.toReal
    (by simpa using ENNReal.toReal_mono hp (Fact.out : 1 ≤ p))).gauge X

end Gauge

/-! ## Layers 2 and 3: kernels and Schur multipliers -/

section Schur

variable {Ω : Type*} [MeasurableSpace Ω]

/-- `T` is the integral operator on `L²(Ω, μ)` with kernel `k : Ω × Ω → ℂ`, first variable the
row (README §2.1, Conventions): `(T g)(x) = ∫ k(x, y) g(y) dμ(y)` for `μ`-almost every `x`, for
every `g ∈ L²(μ)`. -/
def IsKernelOperator (μ : Measure Ω) (k : Ω × Ω → ℂ) (T : Lp ℂ 2 μ →L[ℂ] Lp ℂ 2 μ) : Prop :=
  ∀ g : Lp ℂ 2 μ, (T g : Ω → ℂ) =ᵐ[μ] fun x => ∫ y, k (x, y) * g y ∂μ

/-- The norm `‖S_M‖_p ∈ [0, ∞]` of the Schur multiplier with symbol `M` on the Schatten class
`S_p(L²(Ω, μ))` (README §1.4, §3.1, §3.3): the supremum of `‖S_M(A)‖_p` over Hilbert–Schmidt
operators `A` with `‖A‖_p ≤ 1`, where `A` is the integral operator of a kernel `k ∈ L²(μ ⊗ μ)`
and `S_M(A)` is the integral operator of `M · k`. -/
def schurNorm (μ : Measure Ω) (p : ℝ≥0∞) [Fact (1 ≤ p)] (M : Ω × Ω → ℂ) : ℝ≥0∞ :=
  ⨆ (k : Ω × Ω → ℂ) (_ : MemLp k 2 (μ.prod μ)) (A : Lp ℂ 2 μ →L[ℂ] Lp ℂ 2 μ)
    (B : Lp ℂ 2 μ →L[ℂ] Lp ℂ 2 μ) (_ : IsKernelOperator μ k A)
    (_ : IsKernelOperator μ (M * k) B) (_ : schattenGauge p A ≤ 1), schattenGauge p B

/-- The completely bounded norm `‖S_M‖_{cb,p}` (README §3.5): the supremum over `m` of the norms
of the amplified symbols `M_m((x, i), (y, j)) = M(x, y)` on `Ω × Fin m`, with the product of `μ`
and counting measure; the level `m = 0` is the zero space and contributes `0`. -/
def schurCbNorm (μ : Measure Ω) (p : ℝ≥0∞) [Fact (1 ≤ p)] (M : Ω × Ω → ℂ) : ℝ≥0∞ :=
  ⨆ m : ℕ, schurNorm (μ.prod (Measure.count : Measure (Fin m))) p fun q => M (q.1.1, q.2.1)

variable {μ : Measure Ω}

/-- **`M ↦ S_M` is isometric on `S₂`** (README §3.2, §3.5): for σ-finite `μ` and
`M ∈ L^∞(μ ⊗ μ)`, the norm and the completely bounded norm of `S_M` on `S₂(L²(μ))` are the
essential supremum `‖M‖_∞` (lafforgue-delasalle-2011 lines 267–268). -/
theorem schurNorm_two_eq [SigmaFinite μ] {M : Ω × Ω → ℂ} (hM : MemLp M ∞ (μ.prod μ)) :
    schurNorm μ 2 M = eLpNorm M ∞ (μ.prod μ) ∧ schurCbNorm μ 2 M = eLpNorm M ∞ (μ.prod μ) := by
  sorry

/-! ## Layer 4: duality and interpolation -/

/-- **Duality and transposition** (README §4.1): for σ-finite `μ`, `M ∈ L^∞(μ ⊗ μ)` and conjugate
exponents `1/p + 1/q = 1`, the norm of `S_M` on `S_p` equals its norm on `S_q` and the norm on
`S_p` of the transposed symbol `M^t(x, y) = M(y, x)`; the same holds for the completely bounded
norms (lafforgue-delasalle-2011 Remarks 1.2 and 1.3). -/
theorem schurNorm_eq_of_holderConjugate [SigmaFinite μ] {M : Ω × Ω → ℂ}
    (hM : MemLp M ∞ (μ.prod μ)) (p q : ℝ≥0∞) [Fact (1 ≤ p)] [Fact (1 ≤ q)]
    (hpq : p.HolderConjugate q) :
    schurNorm μ p M = schurNorm μ q M ∧ schurNorm μ p (M ∘ Prod.swap) = schurNorm μ p M ∧
      schurCbNorm μ p M = schurCbNorm μ q M ∧
      schurCbNorm μ p (M ∘ Prod.swap) = schurCbNorm μ p M := by
  sorry

/-- **Log-convexity in `1/p`** (README §4.2): for σ-finite `μ`, `M ∈ L^∞(μ ⊗ μ)`,
`1 ≤ p₀, p₁ ≤ ∞`, `0 < θ < 1` and `1/p_θ = (1 − θ)/p₀ + θ/p₁`,
`‖S_M‖_{p_θ} ≤ ‖S_M‖_{p₀}^{1−θ} ‖S_M‖_{p₁}^θ` in `[0, ∞]`, and the same for the completely bounded
norms. No finiteness hypothesis is needed: a zero endpoint norm forces `M = 0` almost everywhere
(lafforgue-delasalle-2011 Remark 1.4). -/
theorem schurNorm_interpolation [SigmaFinite μ] {M : Ω × Ω → ℂ} (hM : MemLp M ∞ (μ.prod μ))
    (p₀ p₁ p : ℝ≥0∞) [Fact (1 ≤ p₀)] [Fact (1 ≤ p₁)] [Fact (1 ≤ p)] {θ : ℝ} (hθ₀ : 0 < θ)
    (hθ₁ : θ < 1) (hp : p⁻¹ = ENNReal.ofReal (1 - θ) * p₀⁻¹ + ENNReal.ofReal θ * p₁⁻¹) :
    schurNorm μ p M ≤ schurNorm μ p₀ M ^ (1 - θ) * schurNorm μ p₁ M ^ θ ∧
      schurCbNorm μ p M ≤ schurCbNorm μ p₀ M ^ (1 - θ) * schurCbNorm μ p₁ M ^ θ := by
  sorry

/-- **Monotonicity in `|1/p − 1/2|`** (README §4.2): for σ-finite `μ` and `M ∈ L^∞(μ ⊗ μ)`, if
`|1/p − 1/2| ≤ |1/q − 1/2|` then `‖S_M‖_p ≤ ‖S_M‖_q` and `‖S_M‖_{cb,p} ≤ ‖S_M‖_{cb,q}`; in
particular `‖M‖_∞ = ‖S_M‖₂ ≤ ‖S_M‖_p ≤ ‖S_M‖_∞` (lafforgue-delasalle-2011 Remark 1.4). -/
theorem schurNorm_mono_of_abs_inv_sub_le [SigmaFinite μ] {M : Ω × Ω → ℂ}
    (hM : MemLp M ∞ (μ.prod μ)) (p q : ℝ≥0∞) [Fact (1 ≤ p)] [Fact (1 ≤ q)]
    (hpq : |p⁻¹.toReal - 1 / 2| ≤ |q⁻¹.toReal - 1 / 2|) :
    schurNorm μ p M ≤ schurNorm μ q M ∧ schurCbNorm μ p M ≤ schurCbNorm μ q M := by
  sorry

/-! ## Layer 6: positive symbols and the Grothendieck–Haagerup characterisation -/

/-- **The Schur product theorem with norms** (README §6.1): for a finite type `ι` with counting
measure and a positive semidefinite matrix `M`, the norm and the completely bounded norm of the
Hadamard multiplier `A ↦ M ⊙ A` on `S_p(ℓ²(ι))` equal `max_j M(j, j)` for every `1 ≤ p ≤ ∞`, the
maximum over an empty `ι` being `0` (horn-johnson-topics-1991 Ch. 5; paulsen-2002 Ch. 3 and 8;
pisier-grothendieck-2012 lines 767–772). -/
theorem schurNorm_of_posSemidef {ι : Type*} [Fintype ι] [MeasurableSpace ι]
    [MeasurableSingletonClass ι] {M : Matrix ι ι ℂ} (hM : M.PosSemidef) (p : ℝ≥0∞)
    [Fact (1 ≤ p)] :
    schurNorm (Measure.count : Measure ι) p (fun q => M q.1 q.2) =
        ⨆ j, ENNReal.ofReal (M j j).re ∧
      schurCbNorm (Measure.count : Measure ι) p (fun q => M q.1 q.2) =
        ⨆ j, ENNReal.ofReal (M j j).re := by
  sorry

/-- The Haagerup factorisation constant `‖M‖_H ∈ [0, ∞]` (README §6.2), with the Hilbert space
fixed to `ℓ²(ℕ)`: the infimum of `‖ξ‖_∞ ‖η‖_∞` over almost everywhere strongly measurable
`ξ, η : Ω → ℓ²(ℕ)` with `M(x, y) = ⟨ξ(x), η(y)⟩` for `μ ⊗ μ`-almost every `(x, y)`; the infimum
of the empty set is `∞`. -/
def haagerupNorm (μ : Measure Ω) (M : Ω × Ω → ℂ) : ℝ≥0∞ :=
  ⨅ (ξ : Ω → lp (fun _ : ℕ => ℂ) 2) (η : Ω → lp (fun _ : ℕ => ℂ) 2)
    (_ : AEStronglyMeasurable ξ μ) (_ : AEStronglyMeasurable η μ)
    (_ : M =ᵐ[μ.prod μ] fun q => ⟪ξ q.1, η q.2⟫_ℂ), eLpNorm ξ ∞ μ * eLpNorm η ∞ μ

/-- **The Grothendieck–Haagerup characterisation** (README §6.4): for σ-finite `μ` and
`M ∈ L^∞(μ ⊗ μ)`, the norm and the completely bounded norm of `S_M` on `S_∞` and on `S₁` all equal
the Haagerup factorisation constant `‖M‖_H`, in `[0, ∞]` (lafforgue-delasalle-2011 Theorem 1.7;
pisier-grothendieck-2012 Proposition 3.3 for finite index sets). -/
theorem schurNorm_eq_haagerupNorm [SigmaFinite μ] {M : Ω × Ω → ℂ}
    (hM : MemLp M ∞ (μ.prod μ)) :
    schurNorm μ ∞ M = haagerupNorm μ M ∧ schurCbNorm μ ∞ M = haagerupNorm μ M ∧
      schurNorm μ 1 M = haagerupNorm μ M ∧ schurCbNorm μ 1 M = haagerupNorm μ M := by
  sorry

/-! ## Layer 7: atomless measure spaces -/

/-- **Lafforgue–de la Salle: norm equals completely bounded norm on atomless spaces**
(README §7.3): for a σ-finite `μ` without atoms (no set is a `MeasureTheory.Measure.IsAtom`),
every `M ∈ L^∞(μ ⊗ μ)` and every `1 ≤ p ≤ ∞`, `‖S_M‖_p = ‖S_M‖_{cb,p}`
(lafforgue-delasalle-2011 Theorem 1.18). -/
theorem schurNorm_eq_schurCbNorm_of_forall_not_isAtom [SigmaFinite μ]
    (hμ : ∀ s, ¬ μ.IsAtom s) {M : Ω × Ω → ℂ} (hM : MemLp M ∞ (μ.prod μ)) (p : ℝ≥0∞)
    [Fact (1 ≤ p)] :
    schurNorm μ p M = schurCbNorm μ p M := by
  sorry

end Schur

/-! ## Layer 8: continuous symbols on Radon measure spaces -/

section Continuous

variable {X : Type*} [TopologicalSpace X] [LocallyCompactSpace X] [T2Space X]
  [MeasurableSpace X] [BorelSpace X]

/-- **Continuous symbols** (README §8.2): on a locally compact Hausdorff space with a σ-finite
Radon measure `μ`, a continuous symbol `M` is essentially bounded with `‖S_M‖_p ≤ C` exactly when
every matrix `(M(s_i, s_j))` over finitely many distinct points `s_i` of the support of `μ` has
norm at most `C` on `S_p` (lafforgue-delasalle-2011 Theorem 1.19). -/
theorem schurNorm_le_iff_of_continuous (μ : Measure X) [SigmaFinite μ]
    [IsFiniteMeasureOnCompacts μ] [μ.InnerRegularCompactLTTop] {M : X × X → ℂ}
    (hM : Continuous M) (p : ℝ≥0∞) [Fact (1 ≤ p)] (C : ℝ≥0) :
    (MemLp M ∞ (μ.prod μ) ∧ schurNorm μ p M ≤ C) ↔
      ∀ (N : ℕ) (s : Fin N → X), Function.Injective s → (∀ i, s i ∈ μ.support) →
        schurNorm (Measure.count : Measure (Fin N)) p (fun q => M (s q.1, s q.2)) ≤ C := by
  sorry

/-- **Continuous symbols, completely bounded form** (README §8.2): the same equivalence for the
completely bounded norms of `S_M` and of the finite matrices (lafforgue-delasalle-2011
Theorem 1.19). -/
theorem schurCbNorm_le_iff_of_continuous (μ : Measure X) [SigmaFinite μ]
    [IsFiniteMeasureOnCompacts μ] [μ.InnerRegularCompactLTTop] {M : X × X → ℂ}
    (hM : Continuous M) (p : ℝ≥0∞) [Fact (1 ≤ p)] (C : ℝ≥0) :
    (MemLp M ∞ (μ.prod μ) ∧ schurCbNorm μ p M ≤ C) ↔
      ∀ (N : ℕ) (s : Fin N → X), Function.Injective s → (∀ i, s i ∈ μ.support) →
        schurCbNorm (Measure.count : Measure (Fin N)) p (fun q => M (s q.1, s q.2)) ≤ C := by
  sorry

end Continuous

/-! ## Layer 9: Fourier–Schur transference on `ℝⁿ` -/

section Transference

/-- The norm of `Lᵖ(ℝⁿ; S_p^k)`, `(∫ ‖f(x)‖_{S_p^k}^p dx)^{1/p}` (the essential supremum at
`p = ∞`), of a square-integrable `k × k`-matrix-valued function, with `‖·‖_{S_p^k}` Tau Ceti's
`TauCeti.UnitarilyInvariantSeminorm.schatten` of the operator on `ℂ^k` given by the matrix
(README §9.2). -/
def lpSchattenNorm (n : ℕ) (p : ℝ≥0∞) [Fact (1 ≤ p)] {k : ℕ}
    (f : Lp (Matrix (Fin k) (Fin k) ℂ) 2 (volume : Measure (EuclideanSpace ℝ (Fin n)))) :
    ℝ≥0∞ :=
  eLpNorm (fun x => TauCeti.UnitarilyInvariantSeminorm.schatten ℂ (EuclideanSpace ℂ (Fin k))
    (EuclideanSpace ℂ (Fin k)) p (Matrix.toEuclideanLin (f x))) p volume

/-- The completely bounded norm `‖T_m‖_{cb,p}` of the Fourier multiplier with symbol
`m ∈ L^∞(ℝⁿ)` on `Lᵖ(ℝⁿ)` (README §9.2): the supremum over `k` and over
`f ∈ L²(ℝⁿ; S₂^k)` with `‖f‖_{Lᵖ(S_p^k)} ≤ 1` of `‖T_m f‖_{Lᵖ(S_p^k)}`, where `T_m` is Tau Ceti's
`MeasureTheory.Lp.fourierMultiplierCLM` on the Hilbert space of `k × k` matrices with the
Frobenius inner product, acting entrywise. -/
def fourierMultiplierCbNorm (n : ℕ) (p : ℝ≥0∞) [Fact (1 ≤ p)]
    (m : Lp ℂ ∞ (volume : Measure (EuclideanSpace ℝ (Fin n)))) : ℝ≥0∞ :=
  ⨆ (k : ℕ) (f : Lp (Matrix (Fin k) (Fin k) ℂ) 2 (volume : Measure (EuclideanSpace ℝ (Fin n))))
    (_ : lpSchattenNorm n p f ≤ 1),
    lpSchattenNorm n p (Lp.fourierMultiplierCLM (Matrix (Fin k) (Fin k) ℂ) m f)

/-- **Fourier–Schur transference on `ℝⁿ`** (README §9.5): for every `n`, every `m ∈ L^∞(ℝⁿ)` and
every `1 ≤ p ≤ ∞`, the completely bounded norm of the Schur multiplier with Toeplitz symbol
`m(x − y)` on `S_p(L²(ℝⁿ))` equals the completely bounded norm of the Fourier multiplier `T_m` on
`Lᵖ(ℝⁿ)` (cgpt-2023 (FS); caspers-delasalle-2015 Theorem 4.2 and Corollary 5.3 for symbols in
`M_cbA(ℝⁿ)`, extended to `L^∞` symbols in README §9.5); for `n = 0`, where `ℝ⁰` is a point of
mass `1`, both sides are `|m(0)|`. -/
theorem schurCbNorm_toeplitz_eq_fourierMultiplierCbNorm (n : ℕ)
    (m : Lp ℂ ∞ (volume : Measure (EuclideanSpace ℝ (Fin n)))) (p : ℝ≥0∞) [Fact (1 ≤ p)] :
    schurCbNorm (volume : Measure (EuclideanSpace ℝ (Fin n))) p (fun q => m (q.1 - q.2)) =
      fourierMultiplierCbNorm n p m := by
  sorry

end Transference

/-! ## Layer 11: Hörmander–Mikhlin–Schur multipliers -/

section HMS

/-- The Hörmander–Mikhlin–Schur norm `|||M|||_{HMS} ∈ [0, ∞]` of a symbol on `ℝⁿ × ℝⁿ`
(README §11.1): `Σ_{k ≤ σ_n} ess sup |x − y|^k (‖D_x^k M(x, y)‖ + ‖D_y^k M(x, y)‖)` with
`σ_n = ⌊n/2⌋ + 1`, where `D_x^k` and `D_y^k` are the `k`-th Fréchet derivatives in the first and
in the second variable with their operator norms, and the essential supremum is for Lebesgue
measure on `ℝⁿ × ℝⁿ`, on which the diagonal is null when `n ≥ 1`. -/
def hmsNorm (n : ℕ) (M : EuclideanSpace ℝ (Fin n) × EuclideanSpace ℝ (Fin n) → ℂ) : ℝ≥0∞ :=
  ∑ k ∈ Finset.range (n / 2 + 2),
    essSup (fun q : EuclideanSpace ℝ (Fin n) × EuclideanSpace ℝ (Fin n) =>
      ‖q.1 - q.2‖ₑ ^ k * (‖iteratedFDeriv ℝ k (fun x => M (x, q.2)) q.1‖ₑ +
        ‖iteratedFDeriv ℝ k (fun y => M (q.1, y)) q.2‖ₑ))
      ((volume : Measure (EuclideanSpace ℝ (Fin n))).prod volume)

/-- **The Hörmander–Mikhlin–Schur theorem** (README §11.5; cgpt-2023 Theorem A and Remark 2.1):
for `n ≥ 1` there is a constant `C_n` such that for every symbol `M` on `ℝⁿ × ℝⁿ` of class
`C^{⌊n/2⌋+1}` off the diagonal with `|||M|||_{HMS} < ∞` and every `1 < p < ∞`, the norm and the
completely bounded norm of `S_M` on `S_p(L²(ℝⁿ))` agree and are at most
`C_n (p²/(p − 1)) |||M|||_{HMS}`. -/
theorem schurNorm_le_hmsNorm (n : ℕ) (hn : 1 ≤ n) :
    ∃ C : ℝ≥0, ∀ M : EuclideanSpace ℝ (Fin n) × EuclideanSpace ℝ (Fin n) → ℂ,
      ContDiffOn ℝ (n / 2 + 1 : ℕ) M {q | q.1 ≠ q.2} → hmsNorm n M < ∞ →
      ∀ (p : ℝ≥0∞) [Fact (1 ≤ p)], 1 < p → p ≠ ∞ →
        schurNorm (volume : Measure (EuclideanSpace ℝ (Fin n))) p M =
            schurCbNorm (volume : Measure (EuclideanSpace ℝ (Fin n))) p M ∧
          schurNorm (volume : Measure (EuclideanSpace ℝ (Fin n))) p M ≤
            C * ENNReal.ofReal (p.toReal ^ 2 / (p.toReal - 1)) * hmsNorm n M := by
  sorry

end HMS

end TauCetiRoadmap.SchattenClassesAndSchurMultipliers
