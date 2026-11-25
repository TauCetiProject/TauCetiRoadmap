import Mathlib

/-!
# Sampling and discrete Fourier analysis: target signatures

**This file is not the roadmap.** The roadmap is `README.md`. This file states the roadmap's
headline theorems against the pinned Mathlib and Tau Ceti, each with `sorry`, together with the
three definitions they need; every definition has a real body. Every headline theorem of the README
is statable at the pins and is stated here. The README's remaining API lists and Checks are not
restated.

The discrete Fourier transform is Mathlib's `ZMod.dft`, `ZMod.dft Φ k = ∑ j, e(-j k / N) Φ j` with
`e(x) = exp (2 π i x)`, unnormalized. Circulant matrices are Mathlib's `Matrix.circulant`, with
entries `v (i - j)`. Convolution on `ZMod N` and on `ℤ` is Mathlib's discrete convolution
`DiscreteConvolution.addRingConvolution` (notation `⋆ᵣ₊`), whose value at `x` is the sum of
`f a * g b` over the pairs with `a + b = x`; on `ℤ` that sum is a `tsum`, so a statement about it
carries the existence of the convolution. The Fourier transform on `ℝ` is Mathlib's
`𝓕 f ξ = ∫ x, exp (-2 π i x ξ) f x`, in ordinary frequency, with inverse `𝓕⁻`. Mathlib's
`Real.sinc x` is `sin x / x`, so the normalized cardinal sine of the sampling series is
`Real.sinc (π x)`.
-/

noncomputable section

open Complex Real MeasureTheory Filter Topology Matrix Polynomial Function
open scoped FourierTransform DiscreteConvolution SchwartzMap

namespace TauCetiRoadmap.SamplingAndDiscreteFourierAnalysis

variable {N : ℕ} [NeZero N]

/-! ## Layer 1: the discrete Fourier transform on ZMod N -/

/-- 1.1 Parseval's identity for the unnormalized discrete Fourier transform:
`∑ₖ conj (𝓕Φ k) 𝓕Ψ k = N ∑ⱼ conj (Φ j) Ψ j`. -/
theorem dft_inner (Φ Ψ : ZMod N → ℂ) :
    ∑ k, starRingEnd ℂ (ZMod.dft Φ k) * ZMod.dft Ψ k =
      N * ∑ j, starRingEnd ℂ (Φ j) * Ψ j := by
  sorry

/-- 1.2 The cyclic convolution theorem: the discrete Fourier transform of the convolution
`(Φ ⋆ Ψ) x = ∑_{a + b = x} Φ a Ψ b` on `ZMod N` is the pointwise product of the transforms. -/
theorem dft_addRingConvolution (Φ Ψ : ZMod N → ℂ) :
    ZMod.dft (Φ ⋆ᵣ₊ Ψ) = ZMod.dft Φ * ZMod.dft Ψ := by
  sorry

/-! ## Layer 2: circulant matrices -/

variable (N) in
/-- 2.1 The matrix of the discrete Fourier transform: the entry in row `k` and column `j` is
`e(-j k / N)`, so that `dftMatrix N *ᵥ Φ = ZMod.dft Φ`. -/
def dftMatrix : Matrix (ZMod N) (ZMod N) ℂ :=
  Matrix.of fun k j => (ZMod.stdAddChar (-(j * k)) : ℂ)

/-- 2.1 The discrete Fourier transform diagonalizes every circulant matrix:
`F C(v) = diag (𝓕 v) F`, where `F` is the DFT matrix and `C(v)` the circulant matrix with first
column `v`. -/
theorem dftMatrix_mul_circulant (v : ZMod N → ℂ) :
    dftMatrix N * circulant v = diagonal (ZMod.dft v) * dftMatrix N := by
  sorry

/-- 2.2 The characteristic polynomial of a circulant matrix is `∏ₖ (X - 𝓕 v k)`, and its
determinant is `∏ₖ 𝓕 v k`. -/
theorem charpoly_circulant (v : ZMod N → ℂ) :
    (circulant v).charpoly = ∏ k, (X - C (ZMod.dft v k)) ∧
      (circulant v).det = ∏ k, ZMod.dft v k := by
  sorry

/-- 2.3 A matrix commutes with the cyclic shift `circulant (Pi.single 1 1)` if and only if it is
circulant. -/
theorem commute_circulant_single_iff (M : Matrix (ZMod N) (ZMod N) ℂ) :
    Commute M (circulant (Pi.single 1 1)) ↔ ∃ v, M = circulant v := by
  sorry

/-- 2.4 The map sending an element of the group algebra `ℂ[ZMod N]` to the circulant matrix of
its coefficients is an injective homomorphism of `ℂ`-algebras; its range is the set of circulant
matrices. -/
theorem exists_algHom_circulant :
    ∃ φ : AddMonoidAlgebra ℂ (ZMod N) →ₐ[ℂ] Matrix (ZMod N) (ZMod N) ℂ,
      Injective φ ∧ ∀ a, φ a = circulant fun i => a.coeff i := by
  sorry

/-! ## Layer 3: uncertainty principles on ZMod N -/

/-- 3.1 The uncertainty principle of Donoho and Stark: a nonzero `f` on `ZMod N` satisfies
`N ≤ |supp f| · |supp 𝓕f|`. -/
theorem le_ncard_support_mul (f : ZMod N → ℂ) (hf : f ≠ 0) :
    N ≤ (support f).ncard * (support (ZMod.dft f)).ncard := by
  sorry

/-- 3.2 Tao's uncertainty principle for a prime modulus: a nonzero `f` on `ZMod p` satisfies
`p + 1 ≤ |supp f| + |supp 𝓕f|` (Tao, Theorem 1.1). -/
theorem add_one_le_ncard_support_add {p : ℕ} [Fact p.Prime] (f : ZMod p → ℂ) (hf : f ≠ 0) :
    p + 1 ≤ (support f).ncard + (support (ZMod.dft f)).ncard := by
  sorry

/-- 3.3 The converse of 3.2: for `A`, `B ⊆ ZMod p` with `p + 1 ≤ |A| + |B|` (so that both are
nonempty) there is `f` with `supp f = A` and `supp 𝓕f = B` (Tao, Theorem 1.1). -/
theorem exists_support_eq {p : ℕ} [Fact p.Prime] (A B : Finset (ZMod p))
    (h : p + 1 ≤ A.card + B.card) :
    ∃ f : ZMod p → ℂ, support f = A ∧ support (ZMod.dft f) = B := by
  sorry

/-! ## Layer 4: convolution systems on ℤ -/

/-- 4.1 Stability of convolution systems: `h : ℤ → ℂ` is absolutely summable if and only if, for
every bounded `x : ℤ → ℂ`, the convolution `h ⋆ x` exists at every point and is bounded. -/
theorem summable_norm_iff_bounded_convolution (h : ℤ → ℂ) :
    Summable (fun n => ‖h n‖) ↔
      ∀ x : ℤ → ℂ, BddAbove (Set.range fun n => ‖x n‖) →
        DiscreteConvolution.AddConvolutionExists (LinearMap.mul ℕ ℂ) h x ∧
          BddAbove (Set.range fun n => ‖(h ⋆ᵣ₊ x) n‖) := by
  sorry

/-- 4.2 The gain of a stable convolution system: for absolutely summable `h`, the largest value
of `‖(h ⋆ x) n‖` over all `n` and all `x` bounded by `1` is `∑ₙ ‖h n‖`. -/
theorem isGreatest_norm_addRingConvolution (h : ℤ → ℂ) (hh : Summable fun n => ‖h n‖) :
    IsGreatest {c | ∃ (x : ℤ → ℂ) (n : ℤ), (∀ m, ‖x m‖ ≤ 1) ∧ c = ‖(h ⋆ᵣ₊ x) n‖}
      (∑' n, ‖h n‖) := by
  sorry

/-! ## Layer 5: aliasing -/

/-- 5.1 The aliasing formula: for a continuous `f : ℝ → ℂ` such that `f` and `𝓕 f` are both
`O(|x| ^ (-b))` at infinity for some `b > 1`, and a sampling step `T > 0`, the periodization of
the spectrum with period `1 / T` is `T` times the Fourier series of the samples `f (n T)`:
`∑ₖ 𝓕 f (ξ + k / T) = T ∑ₙ f (n T) exp (-2 π i n T ξ)`. -/
theorem tsum_fourier_add_div_eq (f : ℝ → ℂ) (hc : Continuous f) {b : ℝ} (hb : 1 < b)
    (hf : f =O[cocompact ℝ] (|·| ^ (-b))) (hFf : 𝓕 f =O[cocompact ℝ] (|·| ^ (-b)))
    {T : ℝ} (hT : 0 < T) (ξ : ℝ) :
    ∑' k : ℤ, 𝓕 f (ξ + k / T) =
      T * ∑' n : ℤ, f (n * T) * cexp (-(2 * π * I * n * T * ξ)) := by
  sorry

/-! ## Layer 6: band-limited functions and the sampling theorem -/

/-- 6.1 `f` is band-limited to `[-B, B]`: it is the inverse Fourier transform of a
square-integrable function vanishing outside `[-B, B]`. Such a spectrum is integrable, so `f` is
given pointwise by the integral `f t = ∫ ξ, exp (2 π i t ξ) G ξ`. -/
def IsBandLimited (B : ℝ) (f : ℝ → ℂ) : Prop :=
  ∃ G : ℝ → ℂ, MemLp G 2 ∧ (∀ ξ, B < |ξ| → G ξ = 0) ∧ f = 𝓕⁻ G

/-- 6.1 The partial sum over a finite set `S` of the sampling series at rate `2 B`:
`∑_{n ∈ S} f (n / (2 B)) sinc (2 B t - n)`, with the normalized cardinal sine. -/
def samplingSum (B : ℝ) (f : ℝ → ℂ) (S : Finset ℤ) (t : ℝ) : ℂ :=
  ∑ n ∈ S, f (n / (2 * B)) * (Real.sinc (π * (2 * B * t - n)) : ℂ)

/-- 6.2 The energy identity: a function band-limited to `[-B, B]` is square-integrable, and the
squares of its samples at rate `2 B` sum to `2 B ∫ |f|²`. -/
theorem memLp_and_hasSum_norm_sq {B : ℝ} {f : ℝ → ℂ} (hf : IsBandLimited B f) :
    MemLp f 2 ∧ HasSum (fun n : ℤ => ‖f (n / (2 * B))‖ ^ 2) (2 * B * ∫ t, ‖f t‖ ^ 2) := by
  sorry

/-- 6.3 The Whittaker–Shannon sampling theorem, uniform form: the sampling series of a function
band-limited to `[-B, B]` converges to it unconditionally and uniformly on `ℝ`. -/
theorem tendstoUniformly_samplingSum {B : ℝ} {f : ℝ → ℂ} (hf : IsBandLimited B f) :
    TendstoUniformly (samplingSum B f) f atTop := by
  sorry

/-- 6.3 The Whittaker–Shannon sampling theorem, `L²` form: the sampling series of a function
band-limited to `[-B, B]` converges to it unconditionally in `L²(ℝ)`. -/
theorem tendsto_eLpNorm_samplingSum {B : ℝ} {f : ℝ → ℂ} (hf : IsBandLimited B f) :
    Tendsto (fun S => eLpNorm (f - samplingSum B f S) 2) atTop (𝓝 0) := by
  sorry

/-- 6.4 Interpolation of square-summable data: for `B > 0`, every square-summable `c : ℤ → ℂ` is
the sequence of samples `f (n / (2 B))` of exactly one function `f` band-limited to `[-B, B]`. -/
theorem existsUnique_isBandLimited {B : ℝ} (hB : 0 < B) (c : ℤ → ℂ)
    (hc : Summable fun n => ‖c n‖ ^ 2) :
    ∃! f : ℝ → ℂ, IsBandLimited B f ∧ ∀ n : ℤ, f (n / (2 * B)) = c n := by
  sorry

/-- 6.5 Oversampling with a rapidly decaying kernel: let `T > 0` and let `φ` be a Schwartz
function with `𝓕 φ = 1` on `[-B, B]` and `𝓕 φ ξ = 0` for `|ξ| ≥ 1 / T - B`. Then every `f`
band-limited to `[-B, B]` satisfies `f t = T ∑ₙ f (n T) φ (t - n T)`, the series converging
unconditionally. -/
theorem hasSum_oversampling {B T : ℝ} (hT : 0 < T) (φ : 𝓢(ℝ, ℂ))
    (h1 : ∀ ξ, |ξ| ≤ B → 𝓕 (φ : ℝ → ℂ) ξ = 1)
    (h0 : ∀ ξ, 1 / T - B ≤ |ξ| → 𝓕 (φ : ℝ → ℂ) ξ = 0)
    {f : ℝ → ℂ} (hf : IsBandLimited B f) (t : ℝ) :
    HasSum (fun n : ℤ => (T : ℂ) * f (n * T) * φ (t - n * T)) (f t) := by
  sorry

end TauCetiRoadmap.SamplingAndDiscreteFourierAnalysis
