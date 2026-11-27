import Mathlib

/-!
# Fast and nonequispaced Fourier transforms: target signatures

**This file is not the roadmap and is not exhaustive.** The definitive document is `README.md`.
This file states the headlines of `README.md` that carry a Lean name, each with every conclusion
the README attaches to it, against the pinned Mathlib, with `sorry` proofs, together with the
definitions those statements need; every definition has a real body. The README's other
headlines are targets of the same standing, stated in prose.

Conventions (README, Conventions). Vectors of length `N` are functions `ZMod N → ℂ` with
`[NeZero N]`. The discrete Fourier transform is Mathlib's `ZMod.dft`,
`ZMod.dft a k = ∑ j, ZMod.stdAddChar (-(j * k)) • a j`, that is `âₖ = ∑ⱼ aⱼ w_N^{jk}` with
`w_N = exp (-2πi/N)`, unnormalized. Its matrix is `dftMatrix N`, with entry `w_N^{jk}` in row `k`
and column `j`. Cyclic convolution is Mathlib's `DiscreteConvolution.addRingConvolution`
(notation `⋆ᵣ₊`), whose value at `x` is `∑_{a + b = x} f a * g b`. Circulant matrices are
Mathlib's `Matrix.circulant v`, with entry `v (i - j)`; the cyclic shift is
`circulant (Pi.single 1 1)`. The `n`-th Fourier coefficient of a function `u : ℝ → ℂ` is
`periodicCoeff u n = (2π)⁻¹ ∫₀^{2π} exp (-i n x) u x dx`, Mathlib's `fourierCoeffOn` on
`[0, 2π]`. Arithmetic cost is counted by `mulVecCost`, a pair (real multiplications, real
additions) attached to a matrix read as a sparse matrix-vector product.

Local copy. `dftMatrix` is a verbatim copy of the definition of SamplingAndDiscreteFourierAnalysis
(its 2.1). It lives in this roadmap's namespace under its short name.
-/

noncomputable section

open Complex Real Matrix Polynomial Function Finset
open scoped Kronecker DiscreteConvolution ENNReal NNReal

namespace TauCetiRoadmap.FastAndNonequispacedFourierTransforms

attribute [local instance] Classical.propDecidable

/-! ## Local copy of a definition owned elsewhere -/

variable (N) in
/-- Local copy of SamplingAndDiscreteFourierAnalysis 2.1: the matrix of the discrete Fourier
transform; the entry in row `k` and column `j` is `e(-j k / N)`, so that
`dftMatrix N *ᵥ Φ = ZMod.dft Φ`. -/
def dftMatrix (N : ℕ) [NeZero N] : Matrix (ZMod N) (ZMod N) ℂ :=
  Matrix.of fun k j => (ZMod.stdAddChar (-(j * k)) : ℂ)

/-! ## Layer 1: the Fourier matrix -/

section Layer1

variable {N : ℕ} [NeZero N]

/-- 1.1 The Fourier matrix is symmetric, `Fᴴ F = F Fᴴ = N • 1`, `F⁻¹ = N⁻¹ • Fᴴ`, and
`N^{-1/2} • F` is unitary. -/
theorem dftMatrix_unitary :
    (dftMatrix N)ᵀ = dftMatrix N ∧
      (dftMatrix N)ᴴ * dftMatrix N = (N : ℂ) • 1 ∧
      dftMatrix N * (dftMatrix N)ᴴ = (N : ℂ) • 1 ∧
      (dftMatrix N)⁻¹ = (N : ℂ)⁻¹ • (dftMatrix N)ᴴ ∧
      ((Real.sqrt N)⁻¹ : ℂ) • dftMatrix N ∈ Matrix.unitaryGroup (ZMod N) ℂ := by
  sorry

/-- 1.2 The product formula: the transform of a pointwise product is `N⁻¹` times the cyclic
convolution of the transforms. -/
theorem dft_mul_eq_addRingConvolution (a b : ZMod N → ℂ) :
    (N : ℂ) • ZMod.dft (a * b) = ZMod.dft a ⋆ᵣ₊ ZMod.dft b := by
  sorry

/-- 1.2 The shift relation `F V = diag (w_N^k) F`, `V` the cyclic forward shift. -/
theorem dftMatrix_mul_shift :
    dftMatrix N * circulant (Pi.single 1 1) =
      diagonal (fun k : ZMod N => (ZMod.stdAddChar (-k) : ℂ)) * dftMatrix N := by
  sorry

/-- 1.3 A circulant matrix is a polynomial in the cyclic shift: `circ a = ∑ₖ aₖ Vᵏ`. -/
theorem circulant_eq_sum_smul_shift_pow (a : ZMod N → ℂ) :
    circulant a = ∑ k : ZMod N, a k • circulant (Pi.single (1 : ZMod N) (1 : ℂ)) ^ k.val := by
  sorry

/-- 1.3 The `k`-th column of `Fᴴ`, the character `j ↦ e(j k / N)`, is an eigenvector of
`circulant a` for the eigenvalue `âₖ`. -/
theorem hasEigenvector_circulant (a : ZMod N → ℂ) (k : ZMod N) :
    Module.End.HasEigenvector (Matrix.toLin' (circulant a)) (ZMod.dft a k)
      (fun j => (ZMod.stdAddChar (j * k) : ℂ)) := by
  sorry

end Layer1

/-! ## Layer 2: index maps and fast factorizations -/

section Layer2

/-- 2.1 The Cooley–Tukey factorization for `N = N₁ N₂`. Input index `j = j₁ + N₁ j₂` and output
index `k = N₂ k₁ + k₂`, both pairs listed as `(major, minor) = (j₂, j₁)` and `(k₂, k₁)`: the
reindexed Fourier matrix is `(I_{N₂} ⊗ F_{N₁}) D (F_{N₂} ⊗ I_{N₁})` with the twiddle factors
`D(k₂, j₁) = w_N^{j₁ k₂}`. -/
theorem dftMatrix_submatrix_cooleyTukey {N₁ N₂ : ℕ} [NeZero N₁] [NeZero N₂] [NeZero (N₁ * N₂)] :
    let inIdx : ZMod N₂ × ZMod N₁ → ZMod (N₁ * N₂) :=
      fun j => ((j.2.val + N₁ * j.1.val : ℕ) : ZMod (N₁ * N₂))
    let outIdx : ZMod N₂ × ZMod N₁ → ZMod (N₁ * N₂) :=
      fun k => ((N₂ * k.2.val + k.1.val : ℕ) : ZMod (N₁ * N₂))
    let tw : ZMod N₂ × ZMod N₁ → ℂ :=
      fun p => (ZMod.stdAddChar (-((p.2.val * p.1.val : ℕ) : ZMod (N₁ * N₂))) : ℂ)
    Bijective inIdx ∧ Bijective outIdx ∧
      (dftMatrix (N₁ * N₂)).submatrix outIdx inIdx =
        ((1 : Matrix (ZMod N₂) (ZMod N₂) ℂ) ⊗ₖ dftMatrix N₁) * diagonal tw *
          (dftMatrix N₂ ⊗ₖ (1 : Matrix (ZMod N₁) (ZMod N₁) ℂ)) := by
  sorry

/-- 2.2 The prime factor (Good–Thomas) factorization for coprime `N₁`, `N₂`: with the input map
`(j₁, j₂) ↦ N₂ j₁ + N₁ j₂` and the Chinese remainder map on the output, the reindexed Fourier
matrix is `F_{N₁} ⊗ F_{N₂}`, without twiddle factors. -/
theorem dftMatrix_submatrix_goodThomas {N₁ N₂ : ℕ} [NeZero N₁] [NeZero N₂] [NeZero (N₁ * N₂)]
    (h : N₁.Coprime N₂) :
    let inIdx : ZMod N₁ × ZMod N₂ → ZMod (N₁ * N₂) :=
      fun j => ((N₂ * j.1.val + N₁ * j.2.val : ℕ) : ZMod (N₁ * N₂))
    Bijective inIdx ∧
      (dftMatrix (N₁ * N₂)).submatrix (ZMod.chineseRemainder h).symm inIdx =
        dftMatrix N₁ ⊗ₖ dftMatrix N₂ := by
  sorry

/-- 2.3 Rader's reduction: for a prime `p` and a generator `g` of `(ZMod p)ˣ`, the values of the
transform at the nonzero frequencies `g^v` are `a 0` plus a cyclic convolution of length `p - 1`
of `u ↦ a (g^{-u})` with `u ↦ w_p^{g^u}`. -/
theorem dft_rader {p : ℕ} [Fact p.Prime] [NeZero (p - 1)] (g : (ZMod p)ˣ)
    (hg : orderOf g = p - 1) (a : ZMod p → ℂ) (v : ZMod (p - 1)) :
    ZMod.dft a ((g ^ v.val : (ZMod p)ˣ) : ZMod p) =
      a 0 + ((fun u : ZMod (p - 1) => a ((g ^ (-u).val : (ZMod p)ˣ) : ZMod p)) ⋆ᵣ₊
        (fun u : ZMod (p - 1) =>
          (ZMod.stdAddChar (-((g ^ u.val : (ZMod p)ˣ) : ZMod p)) : ℂ))) v := by
  sorry

/-- The chirp `t ↦ exp (-π i t² / N)`, a square root of `t ↦ w_N^{t²}`. -/
def chirp (N : ℕ) (t : ℤ) : ℂ :=
  cexp (-(π * I * (t : ℂ) ^ 2 / N))

/-- 2.4 Bluestein's identity `âₖ = χ(k) ∑ⱼ aⱼ χ(j) conj χ(k - j)`, from
`j k = (j² + k² - (k - j)²) / 2`. -/
theorem dft_eq_chirp_mul_sum {N : ℕ} [NeZero N] (a : ZMod N → ℂ) (k : ZMod N) :
    ZMod.dft a k = chirp N k.val *
      ∑ j : ZMod N, a j * chirp N j.val * starRingEnd ℂ (chirp N ((k.val : ℤ) - j.val)) := by
  sorry

/-- 2.4 Bluestein's algorithm: for `M ≥ 2N - 2` the sum of `dft_eq_chirp_mul_sum` is the first
`N` values of a cyclic convolution of length `M`. -/
theorem dft_eq_chirp_mul_addRingConvolution {N M : ℕ} [NeZero N] [NeZero M] (hM : 2 * N ≤ M + 2)
    (a : ZMod N → ℂ) (k : ℕ) (hk : k < N) :
    let b : ZMod M → ℂ := fun t => if t.val < N then a (t.val : ZMod N) * chirp N t.val else 0
    let h : ZMod M → ℂ := fun t =>
      if t.val < N then starRingEnd ℂ (chirp N t.val)
      else if M < N + t.val then starRingEnd ℂ (chirp N (M - t.val : ℕ)) else 0
    ZMod.dft a (k : ZMod N) = chirp N k * (b ⋆ᵣ₊ h) (k : ZMod M) := by
  sorry

end Layer2

/-! ## Layer 3: the radix-2 fast Fourier transform -/

section Layer3

/-- The bit reversal of a `t`-digit binary number: bit `i` of `k` becomes bit `t - 1 - i`. -/
def bitReverse (t k : ℕ) : ℕ :=
  ∑ i ∈ range t, if k.testBit i then 2 ^ (t - 1 - i) else 0

/-- 3.1 Bit reversal maps `{0, …, 2^t - 1}` to itself and is an involution there. -/
theorem bitReverse_lt_and_involutive (t k : ℕ) (hk : k < 2 ^ t) :
    bitReverse t k < 2 ^ t ∧ bitReverse t (bitReverse t k) = k := by
  sorry

/-- The bit-reversal permutation matrix `R_N`, `N = 2^t`: `(R_N a) i = a (bitReverse t i)`. -/
def bitReversalMatrix (t : ℕ) : Matrix (ZMod (2 ^ t)) (ZMod (2 ^ t)) ℂ :=
  Matrix.of fun i j => if j.val = bitReverse t i.val then 1 else 0

/-- The butterfly factor `I_{N/2^n} ⊗ F₂ ⊗ I_{2^{n-1}}` of stage `n`, `1 ≤ n ≤ t`. -/
def butterflyMatrix (t n : ℕ) : Matrix (ZMod (2 ^ t)) (ZMod (2 ^ t)) ℂ :=
  Matrix.of fun i j =>
    if i.val / 2 ^ n = j.val / 2 ^ n ∧ i.val % 2 ^ (n - 1) = j.val % 2 ^ (n - 1) then
      (if i.val.testBit (n - 1) && j.val.testBit (n - 1) then -1 else 1)
    else 0

/-- The twiddle factor `I_{N/2^n} ⊗ diag (I_{2^{n-1}}, W_{2^{n-1}})` of stage `n`, with
`W_{2^{n-1}} = diag (w_{2^n}^r)_{r < 2^{n-1}}`. -/
def twiddleMatrix (t n : ℕ) : Matrix (ZMod (2 ^ t)) (ZMod (2 ^ t)) ℂ :=
  diagonal fun i =>
    if 2 ^ (n - 1) ≤ i.val % 2 ^ n then
      cexp (-(2 * π * I * ((i.val % 2 ^ n - 2 ^ (n - 1) : ℕ) : ℂ) / (2 ^ n : ℕ)))
    else 1

/-- The factors of the Sande–Tukey FFT with natural input order:
`R_N, T₁, B₁, T₂, B₂, …, T_t, B_t`. -/
def sandeTukeyFactors (t : ℕ) : List (Matrix (ZMod (2 ^ t)) (ZMod (2 ^ t)) ℂ) :=
  bitReversalMatrix t ::
    (List.range t).flatMap fun i => [twiddleMatrix t (i + 1), butterflyMatrix t (i + 1)]

/-- The factors of the Cooley–Tukey FFT with bit-reversed input order:
`B_t, T_t, …, B₁, T₁, R_N`. -/
def cooleyTukeyFactors (t : ℕ) : List (Matrix (ZMod (2 ^ t)) (ZMod (2 ^ t)) ℂ) :=
  ((List.range t).reverse.flatMap fun i => [butterflyMatrix t (i + 1), twiddleMatrix t (i + 1)])
    ++ [bitReversalMatrix t]

/-- 3.2 The radix-2 factorizations: `F_N = R_N ∏ₙ Tₙ Bₙ` (Sande–Tukey) and its transpose
`F_N = (∏ₙ B_{t+1-n} T_{t+1-n}) R_N` (Cooley–Tukey). -/
theorem dftMatrix_eq_prod_sandeTukeyFactors_and_cooleyTukeyFactors (t : ℕ) :
    dftMatrix (2 ^ t) = (sandeTukeyFactors t).prod ∧
      dftMatrix (2 ^ t) = (cooleyTukeyFactors t).prod := by
  sorry

end Layer3

/-! ## Layer 4: arithmetic cost -/

section Layer4

/-- The cost (real multiplications, real additions) of multiplying a complex number by the
constant `c`: free for `±1` and `±i`, `(2, 2)` for a primitive eighth root of unity, `(3, 3)`
otherwise. -/
def constMulCost (c : ℂ) : ℕ × ℕ :=
  if c = 1 ∨ c = -1 ∨ c = I ∨ c = -I then (0, 0) else if c ^ 4 = -1 then (2, 2) else (3, 3)

/-- The cost of `x ↦ A *ᵥ x` evaluated row by row over the nonzero entries of each row: one
multiplication by each nonzero entry and `(number of nonzero entries - 1)` complex additions,
each of `2` real additions. -/
def mulVecCost {ι : Type*} [Fintype ι] (A : Matrix ι ι ℂ) : ℕ × ℕ :=
  ∑ i, ((0, 2 * ((univ.filter fun j => A i j ≠ 0).card - 1)) +
    ∑ j ∈ univ.filter (fun j => A i j ≠ 0), constMulCost (A i j))

/-- The cost of applying the factors of a factorization one after another. -/
def factorizationCost {ι : Type*} [Fintype ι] (l : List (Matrix ι ι ℂ)) : ℕ × ℕ :=
  (l.map mulVecCost).sum

/-- 4.2 The cost of the radix-2 FFTs: for `N = 2^t`, `t ≥ 2`, both factorizations of 3.2 cost
`(3/2) N t - 5 N + 8` real multiplications and `(7/2) N t - 5 N + 8` real additions. -/
theorem factorizationCost_sandeTukey_and_cooleyTukey (t : ℕ) (ht : 2 ≤ t) :
    ((factorizationCost (sandeTukeyFactors t)).1 : ℤ) = 3 * 2 ^ (t - 1) * t - 5 * 2 ^ t + 8 ∧
      ((factorizationCost (sandeTukeyFactors t)).2 : ℤ) = 7 * 2 ^ (t - 1) * t - 5 * 2 ^ t + 8 ∧
      factorizationCost (cooleyTukeyFactors t) = factorizationCost (sandeTukeyFactors t) := by
  sorry

end Layer4

/-! ## Layer 5: aliasing and trigonometric interpolation -/

section Layer5

/-- The `n`-th Fourier coefficient `(2π)⁻¹ ∫₀^{2π} exp (-i n x) u x dx`. -/
def periodicCoeff (u : ℝ → ℂ) (n : ℤ) : ℂ :=
  fourierCoeffOn Real.two_pi_pos u n

/-- The trapezoidal approximation `N⁻¹ ∑_{j < N} f (2πj/N) w_N^{jk}` of the `k`-th Fourier
coefficient, written with `ZMod.dft` of the samples. -/
def sampleDFT (N : ℕ) [NeZero N] (f : ℝ → ℂ) (k : ℤ) : ℂ :=
  (N : ℂ)⁻¹ * ZMod.dft (fun j : ZMod N => f (2 * π * j.val / N)) (k : ZMod N)

/-- 5.1 The aliasing formula and its error bound, for a continuous `f` with absolutely summable
Fourier coefficients. -/
theorem hasSum_sampleDFT_and_norm_sub_le {N : ℕ} [NeZero N] (f : ℝ → ℂ) (hf : Continuous f)
    (hs : Summable fun n => ‖periodicCoeff f n‖) (k : ℤ) :
    HasSum (fun l : ℤ => periodicCoeff f (k + l * N)) (sampleDFT N f k) ∧
      ‖sampleDFT N f k - periodicCoeff f k‖ ≤
        ∑' l : ℤ, if l = 0 then 0 else ‖periodicCoeff f (k + l * N)‖ := by
  sorry

/-- 5.1 No aliasing for band-limited data: if the coefficients vanish for `2|n| ≥ N`, then the
trapezoidal values are the coefficients for `2|k| < N`. -/
theorem sampleDFT_eq_of_band {N : ℕ} [NeZero N] (f : ℝ → ℂ) (hf : Continuous f)
    (hband : ∀ n : ℤ, (N : ℤ) ≤ 2 * |n| → periodicCoeff f n = 0) (k : ℤ)
    (hk : 2 * |k| < N) :
    sampleDFT N f k = periodicCoeff f k := by
  sorry

/-- The band `-N ≤ k < N` of `2N` frequencies. -/
def band (N : ℕ) : Finset ℤ := Finset.Ico (-(N : ℤ)) N

/-- A trigonometric polynomial with coefficients `d` on the band. -/
def bandTrigPoly (N : ℕ) (d : ℤ → ℂ) (x : ℝ) : ℂ :=
  ∑ k ∈ band N, d k * cexp (k * x * I)

/-- The coefficients `ũₖ = (2N)⁻¹ ∑_{j < 2N} u(xⱼ) exp (-i k xⱼ)`, `xⱼ = π j / N`. -/
def trigInterpCoeff (N : ℕ) (u : ℝ → ℂ) (k : ℤ) : ℂ :=
  ((2 * N : ℕ) : ℂ)⁻¹ * ∑ j ∈ range (2 * N), u (π * j / N) * cexp (-(k * (π * j / N) * I))

/-- The trigonometric interpolant `I_N u` in the band, at the nodes `π j / N`. -/
def trigInterp (N : ℕ) (u : ℝ → ℂ) : ℝ → ℂ :=
  bandTrigPoly N (trigInterpCoeff N u)

/-- The truncated Fourier series `P_N u` on the band. -/
def fourierTrunc (N : ℕ) (u : ℝ → ℂ) : ℝ → ℂ :=
  bandTrigPoly N (periodicCoeff u)

/-- 5.2 `I_N u` interpolates `u` at the `2N` nodes `π j / N`, and it is the only trigonometric
polynomial on the band that does. -/
theorem trigInterp_interpolates_and_unique {N : ℕ} (hN : 0 < N) (u : ℝ → ℂ) :
    (∀ j < 2 * N, trigInterp N u (π * j / N) = u (π * j / N)) ∧
      ∀ d : ℤ → ℂ, (∀ j < 2 * N, bandTrigPoly N d (π * j / N) = u (π * j / N)) →
        ∀ k ∈ band N, d k = trigInterpCoeff N u k := by
  sorry

/-- The periodic Sobolev seminorm `|u|_m = (∑ₖ |k|^{2m} |cₖ(u)|²)^{1/2}`, in `ℝ≥0∞`. -/
def fourierSobolevSeminorm (m : ℕ) (u : ℝ → ℂ) : ℝ≥0∞ :=
  (∑' k : ℤ, ((‖(k : ℂ)‖₊ : ℝ≥0∞) ^ (2 * m) * (‖periodicCoeff u k‖₊ : ℝ≥0∞) ^ 2)) ^ (1 / 2 : ℝ)

/-- The periodic Sobolev norm `‖u‖_l = (∑ₖ (1 + |k|^{2l}) |cₖ(u)|²)^{1/2}`, in `ℝ≥0∞`. -/
def fourierSobolevNorm (l : ℕ) (u : ℝ → ℂ) : ℝ≥0∞ :=
  (∑' k : ℤ, ((1 + (‖(k : ℂ)‖₊ : ℝ≥0∞) ^ (2 * l)) * (‖periodicCoeff u k‖₊ : ℝ≥0∞) ^ 2)) ^
    (1 / 2 : ℝ)

/-- 5.3 For a `2π`-periodic `u` of class `C^m`, `|u|_m² = (2π)⁻¹ ∫₀^{2π} |u^{(m)}|²`. -/
theorem fourierSobolevSeminorm_sq_eq_integral (m : ℕ) (u : ℝ → ℂ) (hu : ContDiff ℝ m u)
    (hper : Periodic u (2 * π)) :
    fourierSobolevSeminorm m u ^ 2 =
      ENNReal.ofReal ((2 * π)⁻¹ * ∫ x in (0 : ℝ)..2 * π, ‖iteratedDeriv m u x‖ ^ 2) := by
  sorry

/-- 5.3 Truncation and interpolation errors: for `1 ≤ m` and `l ≤ m` there is `C` with
`‖u - P_N u‖_l + ‖u - I_N u‖_l ≤ C N^{l - m} |u|_m` for every continuous `u` and `N ≥ 1`. -/
theorem fourierSobolevNorm_trunc_add_interp_le (m l : ℕ) (hm : 1 ≤ m) (hl : l ≤ m) :
    ∃ C : ℝ≥0, ∀ N : ℕ, 0 < N → ∀ u : ℝ → ℂ, Continuous u →
      fourierSobolevNorm l (u - fourierTrunc N u) + fourierSobolevNorm l (u - trigInterp N u) ≤
        C * ((N : ℝ≥0∞)⁻¹) ^ (m - l) * fourierSobolevSeminorm m u := by
  sorry

end Layer5

/-! ## Layer 6: nonequispaced fast Fourier transforms -/

section Layer6

/-- The centred cardinal B-spline of order `n + 1`: `M₁` is the indicator of `[-1/2, 1/2)` and
`M_{n+2} = M_{n+1} * M₁`. -/
def centredBSpline : ℕ → ℝ → ℝ
  | 0 => (Set.Ico (-(1 / 2 : ℝ)) (1 / 2)).indicator 1
  | n + 1 => MeasureTheory.convolution (centredBSpline n) (centredBSpline 0)
      (ContinuousLinearMap.lsmul ℝ ℝ) MeasureTheory.volume

/-- 6.1 `M_{n+1}` is nonnegative, vanishes outside `[-(n+1)/2, (n+1)/2]`, and its Fourier
integral is `sinc (ω/2)^{n+1}`. -/
theorem centredBSpline_nonneg_support_fourier (n : ℕ) :
    (∀ x, 0 ≤ centredBSpline n x) ∧
      (∀ x, (n + 1 : ℝ) / 2 < |x| → centredBSpline n x = 0) ∧
      ∀ ω : ℝ, ∫ x, (centredBSpline n x : ℂ) * cexp (-(x * ω * I)) =
        (Real.sinc (ω / 2) : ℂ) ^ (n + 1) := by
  sorry

/-- The `2π`-periodization `x ↦ ∑ᵣ φ (x + 2πr)` of a window. -/
def periodize (φ : ℝ → ℝ) (x : ℝ) : ℂ :=
  ∑' r : ℤ, (φ (x + 2 * π * r) : ℂ)

/-- The coefficients `g_l = n'⁻¹ ∑_{k ∈ band n} f̂ₖ / cₖ(w) e^{2πi k l / n'}` of the window
method, for a `2π`-periodic window `w` and an oversampled grid of `n'` points. -/
def nfftCoeffs (n n' : ℕ) (w : ℝ → ℂ) (fh : ℤ → ℂ) (l : ℕ) : ℂ :=
  (n' : ℂ)⁻¹ * ∑ k ∈ band n, fh k / periodicCoeff w k * cexp (2 * π * I * k * l / n')

/-- The approximation `s(x) = ∑_{l < n'} g_l w (x - 2πl/n')` of the window method. -/
def nfftApprox (n n' : ℕ) (w : ℝ → ℂ) (fh : ℤ → ℂ) (x : ℝ) : ℂ :=
  ∑ l ∈ range n', nfftCoeffs n n' w fh l * w (x - 2 * π * l / n')

/-- 6.2 The aliasing error of the window method for a general continuous window with absolutely
summable Fourier coefficients that do not vanish on the band, on a grid of `n' ≥ 1` points. -/
theorem norm_sub_nfftApprox_le (n n' : ℕ) (hn' : 0 < n') (w : ℝ → ℂ) (hw : Continuous w)
    (hwper : Periodic w (2 * π)) (hws : Summable fun k => ‖periodicCoeff w k‖)
    (hw0 : ∀ k ∈ band n, periodicCoeff w k ≠ 0) (fh : ℤ → ℂ) (x : ℝ) :
    ‖bandTrigPoly n fh x - nfftApprox n n' w fh x‖ ≤
      ∑ k ∈ band n, ‖fh k‖ *
        ∑' r : ℤ, if r = 0 then 0 else ‖periodicCoeff w (k + r * n')‖ / ‖periodicCoeff w k‖ := by
  sorry

/-- The B-spline window `φ(x) = M_{2m}(n' x / (2π))`. -/
def bsplineWindow (n' m : ℕ) (x : ℝ) : ℝ :=
  centredBSpline (2 * m - 1) (n' * x / (2 * π))

/-- 6.3 The periodized B-spline window is continuous and `2π`-periodic, its Fourier coefficients
are `cₖ = n'⁻¹ sinc (kπ/n')^{2m}`, absolutely summable, and positive for `|k| < n'`. -/
theorem periodicCoeff_periodize_bsplineWindow (n' m : ℕ) (hn' : 0 < n') (hm : 1 ≤ m) :
    Continuous (periodize (bsplineWindow n' m)) ∧
      Periodic (periodize (bsplineWindow n' m)) (2 * π) ∧
      (∀ k : ℤ, periodicCoeff (periodize (bsplineWindow n' m)) k =
        (n' : ℂ)⁻¹ * (Real.sinc (k * π / n') : ℂ) ^ (2 * m)) ∧
      Summable (fun k => ‖periodicCoeff (periodize (bsplineWindow n' m)) k‖) ∧
      ∀ k : ℤ, |k| < n' → 0 < (Real.sinc (k * π / n')) ^ (2 * m) := by
  sorry

/-- 6.3 The error bound of the NFFT with the B-spline window:
`|f(x) - s(x)| ≤ 4 (n / (n' - n))^{2m} ‖f̂‖₁`, that is `4 / (2σ - 1)^{2m} ‖f̂‖₁` with
`σ = n' / (2n)`. -/
theorem norm_sub_nfftApprox_bspline_le (n n' m : ℕ) (hn : 2 * n ≤ n') (hm : 1 ≤ m)
    (fh : ℤ → ℂ) (x : ℝ) :
    ‖bandTrigPoly n fh x - nfftApprox n n' (periodize (bsplineWindow n' m)) fh x‖ ≤
      4 * ((n : ℝ) / (n' - n)) ^ (2 * m) * ∑ k ∈ band n, ‖fh k‖ := by
  sorry

/-- 6.3 Locality: for each `x` at most `2m + 1` terms of the sum defining `s(x)` are nonzero. -/
theorem card_bsplineWindow_ne_zero_le (n' m : ℕ) (x : ℝ) :
    ((range n').filter fun l => periodize (bsplineWindow n' m) (x - 2 * π * l / n') ≠ 0).card ≤
      2 * m + 1 := by
  sorry

/-- The adjoint window method: an approximation of `h(k) = ∑ⱼ fⱼ exp (i k xⱼ)` at the band
frequencies from the data `fⱼ` at arbitrary nodes `xⱼ`. -/
def nfftAdjointApprox (n' : ℕ) (w : ℝ → ℂ) {J : ℕ} (x : Fin J → ℝ) (f : Fin J → ℂ) (k : ℤ) : ℂ :=
  ((n' : ℂ)⁻¹ * ∑ l ∈ range n',
      (∑ j, f j * w (x j - 2 * π * l / n')) * cexp (2 * π * I * k * l / n')) /
    periodicCoeff w k

/-- 6.4 The error bound of the adjoint NFFT with the B-spline window. -/
theorem norm_sub_nfftAdjointApprox_bspline_le (n n' m : ℕ) (hn : 2 * n ≤ n') (hm : 1 ≤ m)
    {J : ℕ} (x : Fin J → ℝ) (f : Fin J → ℂ) (k : ℤ) (hk : k ∈ band n) :
    ‖(∑ j, f j * cexp (k * x j * I)) -
        nfftAdjointApprox n' (periodize (bsplineWindow n' m)) x f k‖ ≤
      4 * ((n : ℝ) / (n' - n)) ^ (2 * m) * ∑ j, ‖f j‖ := by
  sorry

end Layer6

/-! ## Layer 7: exponential sums -/

section Layer7

/-- 7.1 Prony's method: for distinct nodes `z` and nonzero weights `c`, with samples
`h(k) = ∑ⱼ cⱼ zⱼ^k`, the Hankel matrix factors as `V diag(c) Vᵀ` with `V = (zₖ^j)`, it is
invertible, the Hankel system has exactly one solution, its solution gives the Prony polynomial
`∏ⱼ (X - zⱼ)`, and `c` is the unique solution of `V c = (h(0), …, h(M-1))`. -/
theorem prony {M : ℕ} (z c : Fin M → ℂ) (hz : Injective z) (hc : ∀ j, c j ≠ 0) :
    let h : ℕ → ℂ := fun k => ∑ j, c j * z j ^ k
    let V : Matrix (Fin M) (Fin M) ℂ := (Matrix.vandermonde z)ᵀ
    let H : Matrix (Fin M) (Fin M) ℂ := Matrix.of fun k l => h (k.val + l.val)
    H = V * diagonal c * Vᵀ ∧ H.det ≠ 0 ∧
      (∃! p : Fin M → ℂ, ∀ l : Fin M, ∑ k, p k * h (k.val + l.val) = -h (M + l.val)) ∧
      (∀ p : Fin M → ℂ, (∀ l : Fin M, ∑ k, p k * h (k.val + l.val) = -h (M + l.val)) →
        X ^ M + ∑ k, C (p k) * X ^ k.val = ∏ j, (X - C (z j))) ∧
      ∀ d : Fin M → ℂ, V *ᵥ d = (fun k => h k.val) ↔ d = c := by
  sorry

/-- 7.1 An exponential sum of known order `M` with nonzero coefficients and distinct exponents
whose imaginary parts lie in `[-π, π)` is determined, up to relabelling, by its values at
`0, 1, …, 2M - 1`. -/
theorem exists_perm_eq_of_expSum_eq {M : ℕ} (φ ψ c d : Fin M → ℂ) (hφ : Injective φ)
    (hψ : Injective ψ) (hc : ∀ j, c j ≠ 0) (hd : ∀ j, d j ≠ 0)
    (hφim : ∀ j, (φ j).im ∈ Set.Ico (-π) π) (hψim : ∀ j, (ψ j).im ∈ Set.Ico (-π) π)
    (hsamples : ∀ k : ℕ, k < 2 * M →
      ∑ j, c j * cexp (φ j * k) = ∑ j, d j * cexp (ψ j * k)) :
    ∃ e : Equiv.Perm (Fin M), ∀ j, φ j = ψ (e j) ∧ c j = d (e j) := by
  sorry

/-- 7.2 The rank of the Hankel (trajectory) matrices of the samples is the order `M`: for
`M ≤ L` and `L + M ≤ N + 1` the `L × (N - L + 1)` matrix `(h(l + m))` has rank `M`, and for
`L + M ≤ N` so do the `L × (N - L)` matrices `(h(s + l + m))`, `s ∈ {0, 1}`, for `s = 1`
provided the nodes are nonzero. -/
theorem rank_trajectoryHankel {M N L : ℕ} (z c : Fin M → ℂ) (hz : Injective z)
    (hc : ∀ j, c j ≠ 0) (hL : M ≤ L) :
    let h : ℕ → ℂ := fun k => ∑ j, c j * z j ^ k
    (L + M ≤ N + 1 →
        (Matrix.of fun (l : Fin L) (m : Fin (N - L + 1)) => h (l.val + m.val)).rank = M) ∧
      (L + M ≤ N → ∀ s ≤ 1, (s = 1 → ∀ j, z j ≠ 0) →
        (Matrix.of fun (l : Fin L) (m : Fin (N - L)) => h (s + l.val + m.val)).rank = M) := by
  sorry

/-- The companion matrix `(e₂ | … | e_K | -q)` of the monic polynomial with lower coefficients
`q`. -/
def companionMatrix {K : ℕ} (q : Fin K → ℂ) : Matrix (Fin K) (Fin K) ℂ :=
  Matrix.of fun i j => if j.val + 1 = K then -q i else if i.val = j.val + 1 then 1 else 0

/-- 7.2 The matrix pencil: for `L + M ≤ N`, `H(0) C(q) = H(1)` with `C(q)` the
companion matrix of `q = X^{N-L-M} ∏ⱼ (X - zⱼ)`, and every node `zⱼ` is an eigenvalue of the
pencil `z H(0) - H(1)`. -/
theorem hankel_mul_companionMatrix {M N L : ℕ} (z c : Fin M → ℂ) (hLN : L + M ≤ N) :
    let h : ℕ → ℂ := fun k => ∑ j, c j * z j ^ k
    let H : ℕ → Matrix (Fin L) (Fin (N - L)) ℂ :=
      fun s => Matrix.of fun l m => h (s + l.val + m.val)
    let q : Fin (N - L) → ℂ := fun i => (X ^ (N - L - M) * ∏ j, (X - C (z j))).coeff i.val
    H 0 * companionMatrix q = H 1 ∧
      ∀ j, ∃ v : Fin (N - L) → ℂ, v ≠ 0 ∧ z j • (H 0 *ᵥ v) = H 1 *ᵥ v := by
  sorry

/-- 7.2 The square pencil: `det (ζ H(0) - H(1)) = det H(0) ∏ⱼ (ζ - zⱼ)` for the `M × M` Hankel
matrices, for all nodes and weights. -/
theorem det_smul_hankel_sub_hankel {M : ℕ} (z c : Fin M → ℂ) (ζ : ℂ) :
    let h : ℕ → ℂ := fun k => ∑ j, c j * z j ^ k
    let H : ℕ → Matrix (Fin M) (Fin M) ℂ := fun s => Matrix.of fun l m => h (s + l.val + m.val)
    (ζ • H 0 - H 1).det = (H 0).det * ∏ j, (ζ - z j) := by
  sorry

end Layer7

/-! ## Upstream declarations named in the README -/

#check @ZMod.dft
#check @ZMod.dft_apply
#check @ZMod.dft_apply_zero
#check @ZMod.stdAddChar
#check @ZMod.invDFT_apply
#check @AddChar.sum_mulShift
#check @DiscreteConvolution.addRingConvolution
#check @Matrix.circulant
#check @Matrix.kroneckerMap
#check @Matrix.submatrix
#check @Matrix.unitaryGroup
#check @Matrix.inv_eq_left_inv
#check @Module.End.HasEigenvector
#check @ZMod.chineseRemainder
#check @Nat.testBit
#check @fourierCoeffOn
#check @fourierCoeffOn_of_hasDerivAt
#check @hasSum_sq_fourierCoeffOn
#check @MeasureTheory.convolution
#check @ContinuousLinearMap.lsmul
#check @Real.sinc
#check @Matrix.vandermonde
#check @Matrix.det_vandermonde_ne_zero_iff
#check @Matrix.rank

end TauCetiRoadmap.FastAndNonequispacedFourierTransforms
