# Roadmap: sampling and discrete Fourier analysis

**Summary.** This roadmap develops the mathematics of sampling and of finite and discrete
convolution that underlies signal processing: the discrete Fourier transform on the cyclic group
`ℤ/N` with its Parseval identity and convolution theorem, circulant matrices, the uncertainty
principles for the cyclic group, the stability of convolution systems on `ℤ`, the aliasing formula
that relates the samples of a function to the periodization of its spectrum, and the sampling
theorem for band-limited functions. Fourier transforms on `ℝ` use ordinary frequency, so a function
band-limited to `[−B, B]` has no frequencies above `B` cycles per unit of time and is sampled at the
rate `2B`. Every target is a theorem about a defined mathematical object; no procedure for computing
a transform is specified.

The headline theorems are these.

- *Circulant matrices.* For every `v : ℤ/N → ℂ`, the matrix of the discrete Fourier transform
  conjugates the circulant matrix with first column `v` to the diagonal matrix of the transform of
  `v`; so its eigenvalues, with multiplicity, are the values of the transform, and its determinant
  is their product. A matrix commutes with the cyclic shift exactly when it is circulant.
- *Uncertainty.* A nonzero function `f` on `ℤ/N` satisfies `|supp f| · |supp f̂| ≥ N`. If `N = p`
  is prime, `|supp f| + |supp f̂| ≥ p + 1`, and every pair of nonempty sets `A`, `B` with
  `|A| + |B| ≥ p + 1` occurs as `(supp f, supp f̂)`.
- *Stability.* Convolution with `h : ℤ → ℂ` sends every bounded sequence to a bounded sequence,
  the convolution existing at every point, if and only if `h` is absolutely summable; the largest
  gain over inputs bounded by `1` is then `∑ |h(n)|`.
- *Sampling.* Let `f` be the inverse Fourier transform of a square-integrable function vanishing
  outside `[−B, B]`. Then `f(t) = ∑ f(n/2B) sinc(2Bt − n)`, with the normalized cardinal sine, the
  series converging unconditionally both uniformly in `t` and in `L²(ℝ)`, and
  `∑ |f(n/2B)|² = 2B ∫ |f|²`. For `B > 0` every square-summable sequence is the sequence of samples
  of exactly one such `f`.

The roadmap builds on Mathlib's discrete Fourier transform on `ℤ/N`, its circulant matrices and
its discrete convolution, on Mathlib's Fourier transform on `ℝ` with Poisson summation and the
Parseval identity for Fourier series on an interval, and on Tau Ceti's `ℓᵖ` estimates for discrete
convolution. The Paley–Wiener spaces of DiracScatteringAndNonlinearFourierTransform supply the
Plancherel identity for band-limited functions. AnalyticNumberTheoryPartIII bounds the error of the
sampling series for integrable spectra pointwise; the theorems here concern square-integrable
spectra, unconditional convergence and the identification with square-summable sequences.

The layers are in build order. Layer 1 proves Parseval's identity and the convolution theorem for
the discrete Fourier transform; Layer 2 treats circulant matrices and Layer 3 the uncertainty
principles, both on top of Layer 1. Layer 4, convolution systems on `ℤ`, Layer 5, the aliasing
formula, and Layer 6, band-limited functions and the sampling theorem, depend on no other layer.

## Conventions

- **The discrete Fourier transform.** `N ≥ 1` and `ℤ/N` is `ZMod N`. The transform is Mathlib's
  `ZMod.dft`, written `f̂` or `𝓕f`: `f̂(k) = ∑_j e(−jk/N) f(j)` with `e(x) = exp(2πix)`, through
  `ZMod.stdAddChar`; it is unnormalized, and Mathlib's inversion `ZMod.dft_dft` reads
  `𝓕(𝓕f)(j) = N f(−j)`.
- **Convolution.** On `ℤ/N` and on `ℤ` the convolution is Mathlib's
  `DiscreteConvolution.addRingConvolution`, written `f ⋆ g`: `(f ⋆ g)(x)` is the sum of
  `f(a) g(b)` over the pairs with `a + b = x`. On `ℤ/N` this is the finite sum
  `∑_a f(a) g(x − a)`. On `ℤ` it is a `tsum` over the pairs, which is `0` when the family is not
  summable; Mathlib's `DiscreteConvolution.AddConvolutionExists` says that it is summable at every
  point, and every statement on `ℤ` that uses the value of a convolution carries this condition.
- **Circulant matrices.** Mathlib's `Matrix.circulant v` has entry `v(i − j)` in row `i` and
  column `j`, so its first column is `v` and `circulant v *ᵥ x = v ⋆ x`. The cyclic shift is
  `circulant (Pi.single 1 1)`, which sends `x` to `i ↦ x(i − 1)`.
- **Supports.** `supp f` is `Function.support f`, the set of points where `f` is nonzero, and
  `|S|` is `Set.ncard S`.
- **The Fourier transform on `ℝ`.** `𝓕f(ξ) = ∫ exp(−2πixξ) f(x) dx` and
  `𝓕⁻G(x) = ∫ exp(2πixξ) G(ξ) dξ` (Mathlib's `Real.fourier_real_eq`, `Real.fourierInv_eq`).
  Frequencies are in cycles per unit of time; a source written in angular frequency `ω = 2πξ`
  has band limit `2πB` where this roadmap has `B`.
- **The cardinal sine.** Mathlib's `Real.sinc x` is `sin x / x`, with value `1` at `0`. The
  normalized cardinal sine is `sinc(x) = Real.sinc(πx)`, which vanishes at the nonzero integers;
  every formula below that writes `sinc` means the normalized one.
- **Unconditional convergence.** A series indexed by `ℤ` converges unconditionally to `s` when its
  sums over finite sets `S ⊆ ℤ` tend to `s` along the filter of finite sets (Mathlib's `HasSum`,
  or `atTop` on `Finset ℤ`). Uniform and `L²` convergence of the sampling series are stated in
  this sense.

## Layer 1: the discrete Fourier transform on ZMod N

### 1.1 Parseval's identity

Prove `dft_inner`: for `Φ`, `Ψ : ℤ/N → ℂ`,
`∑_k conj(Φ̂(k)) Ψ̂(k) = N ∑_j conj(Φ(j)) Ψ(j)`. Taking `Ψ = Φ` gives `∑ |Φ̂|² = N ∑ |Φ|²`
(Vetterli–Kovačević–Goyal, equation (3.179), p. 258, in this norm form; the form with two
functions follows by polarization).

Route: expand `Φ̂` on the left; exchanging the finite sums gives
`∑_j conj(Φ(j)) 𝓕(Ψ̂)(−j)`, and Mathlib's inversion `ZMod.dft_dft` gives `𝓕(Ψ̂)(−j) = N Ψ(j)`.

**Checks.**
- `N = 3`, `Φ = Ψ = δ₀`: `Φ̂ = (1, 1, 1)`, so the left side is `3 = 3 · 1`. A transform
  normalized by `N^(−1/2)` would give `1` on the left, and one normalized by `N^(−1)` would give
  `1/3`: the factor `N` fixes Mathlib's normalization.
- `N = 1`: the transform is the identity and both sides are `conj(Φ(0)) Ψ(0)`.

*Needs:* Mathlib `ZMod.dft`, `ZMod.dft_apply`, `ZMod.dft_dft`, `ZMod.stdAddChar`. (Proved
here.)

### 1.2 The cyclic convolution theorem

Prove `dft_addRingConvolution`: for `Φ`, `Ψ : ℤ/N → ℂ`, `𝓕(Φ ⋆ Ψ) = Φ̂ · Ψ̂` pointwise
(Vetterli–Kovačević–Goyal, equation (3.171), p. 257, the circular convolution property).

Route: the fibre `{(a, b) | a + b = x}` is finite, so by Mathlib's
`DiscreteConvolution.addRingConvolution_apply` and `tsum_fintype` the convolution is the finite
sum `∑_a Φ(a) Ψ(x − a)`; substitute and use `e(−(a + b)k/N) = e(−ak/N) e(−bk/N)`.

**Checks.**
- `N = 2`, `Φ = Ψ = (1, 1)`: `Φ ⋆ Ψ = (2, 2)`, whose transform is `(4, 0) = (2, 0) · (2, 0)`.
- `N = 3`, `Φ = δ₁`, `Ψ = δ₁`: `Φ ⋆ Ψ = δ₂`, with transform `k ↦ e(−2k/3)`, the square of
  `k ↦ e(−k/3)`. A convolution defined with `x + a` in place of `x − a` would give `δ₀`, whose
  transform is constant.

*Needs:* Mathlib `ZMod.dft_apply`, `DiscreteConvolution.addRingConvolution_apply`,
`tsum_fintype`. (Proved here.)

### Examples

`N = 4` and `Φ = (1, 2, 0, 0)`: `Φ̂ = (3, 1 − 2i, −1, 1 + 2i)`,
`∑ |Φ̂|² = 9 + 5 + 1 + 5 = 20 = 4 · 5`, and `Φ ⋆ Φ = (1, 4, 4, 0)` has transform
`(9, −3 − 4i, 1, −3 + 4i)`, the squares of the values of `Φ̂`.

### Dependencies

Mathlib `ZMod.dft`, `ZMod.dft_apply`, `ZMod.dft_dft`, `ZMod.stdAddChar`,
`DiscreteConvolution.addRingConvolution`, `DiscreteConvolution.addRingConvolution_apply`,
`tsum_fintype`. No other layer.

## Layer 2: circulant matrices

### 2.1 Diagonalization by the discrete Fourier transform

Define `dftMatrix N`, the matrix indexed by `ℤ/N` with entry `e(−jk/N)` in row `k` and column
`j`, so that `dftMatrix N *ᵥ Φ = Φ̂`. Prove `dftMatrix_mul_circulant`: for every
`v : ℤ/N → ℂ`, `dftMatrix N * circulant v = diagonal v̂ * dftMatrix N`. Since
`dftMatrixᴴ * dftMatrix = N · 1` by 1.1, this is `circulant v = F⁻¹ diag(v̂) F` with
`F = dftMatrix N`, and the columns of `F⁻¹`, the characters `j ↦ e(jk/N)`, are eigenvectors of
`circulant v` with eigenvalues `v̂(k)` (Vetterli–Kovačević–Goyal, equations (3.181a) and (3.181b),
p. 259).

Route: apply both sides to a vector `x`. The left side is `𝓕(v ⋆ x)` by the identity
`circulant v *ᵥ x = v ⋆ x`, and the right side is `v̂ · x̂`; 1.2 identifies them.

**Checks.**
- `N = 2`, `v = (a, b)`: `circulant v` has rows `(a, b)` and `(b, a)`, `F` has rows `(1, 1)` and
  `(1, −1)`, and `v̂ = (a + b, a − b)`. Both sides have rows `(a + b, a + b)` and
  `(a − b, b − a)`.
- `N = 3`, `v = δ₁`: `circulant v` is the cyclic shift `x ↦ x(· − 1)`, and `v̂(k) = e(−k/3)`. The
  eigenvector `j ↦ e(j/3)` is sent to `j ↦ e((j − 1)/3) = e(−1/3) e(j/3)`. With the transposed
  convention `v(j − i)` the same vector would have eigenvalue `e(1/3)`, so the identity fixes the
  orientation of Mathlib's circulant matrices.

*Needs:* 1.1, 1.2; Mathlib `Matrix.circulant`, `Matrix.diagonal`, `Matrix.mulVec`. (Proved
here, except as cited.)

### 2.2 Characteristic polynomial and determinant

Prove `charpoly_circulant`: `charpoly(circulant v) = ∏_k (X − v̂(k))` and
`det(circulant v) = ∏_k v̂(k)`. In particular `circulant v` is invertible exactly when `v̂` has no
zero.

Route: by 2.1 and 1.1, `circulant v` is conjugate by the invertible matrix `F` to the diagonal
matrix of `v̂`; conjugate matrices have the same characteristic polynomial
(`Matrix.charpoly_units_conj`), that of a diagonal matrix is the product of the linear factors
(`Matrix.charpoly_diagonal`), and the determinant of a diagonal matrix is the product of its
entries (`Matrix.det_diagonal`).

**Checks.**
- `N = 2`, `v = (a, b)`: `det = a² − b² = (a + b)(a − b)`.
- `N = 3`, `v = δ₁`: the cyclic shift is an even permutation matrix, with determinant `1`, and
  `∏_k e(−k/3) = e(−1) = 1`. For `N = 2`, `v = δ₁` the shift is a transposition, with determinant
  `−1 = 1 · (−1)`.
- `N = 3`, `v = (1, 1, 1)`: `v̂ = (3, 0, 0)`, `charpoly = X² (X − 3)`, and the all-ones matrix is
  singular.

*Needs:* 2.1, 1.1; Mathlib `Matrix.charpoly_units_conj`, `Matrix.charpoly_diagonal`,
`Matrix.det_diagonal`. (Proved here.)

### 2.3 The commutant of the cyclic shift

Prove `commute_circulant_single_iff`: a matrix `M` indexed by `ℤ/N` commutes with the cyclic
shift `circulant (Pi.single 1 1)` if and only if `M = circulant v` for some `v`, namely its first
column. So the linear maps of `ℂ^(ℤ/N)` that commute with translation are exactly the convolutions.

Route: `M` commutes with the shift `P` exactly when `M(i + 1, j + 1) = M(i, j)` for all `i`, `j`,
that is when `M(i, j)` depends only on `i − j`. The converse direction is Mathlib's
`Matrix.circulant_mul_comm`.

**Checks.**
- `N = 1`: the shift is the identity and every `1 × 1` matrix is circulant.
- `N = 2`: `M` with rows `(1, 0)` and `(0, 0)` does not commute with the shift, whose rows are
  `(0, 1)` and `(1, 0)`: `M P` has rows `(0, 1)`, `(0, 0)` and `P M` has rows `(0, 0)`, `(1, 0)`.
- The commutant has dimension `N`: the numerical rank of the linear map `M ↦ MP − PM` is
  `N² − N` for `N = 1, …, 8`.

*Needs:* Mathlib `Matrix.circulant`, `Matrix.circulant_apply`, `Matrix.circulant_mul_comm`.
(Proved here.)

### 2.4 Circulant matrices and the group algebra

Prove `exists_algHom_circulant`: there is an injective homomorphism of `ℂ`-algebras from the
group algebra `ℂ[ℤ/N]` (Mathlib's `AddMonoidAlgebra ℂ (ZMod N)`) to the `N × N` matrices that
sends each element to the circulant matrix of its coefficients. Its range is the set of circulant
matrices, which is therefore a commutative subalgebra isomorphic to `ℂ[ℤ/N]`.

Route: Mathlib's `Matrix.circulant_mul` gives `circulant v * circulant w = circulant (v ⋆ w)`, which
is the multiplication of `ℂ[ℤ/N]`; `circulant (Pi.single 0 1) = 1`; injectivity is
`Matrix.circulant_injective`. The map is `AddMonoidAlgebra.lift` applied to
`a ↦ circulant (Pi.single a 1)`, which is a monoid homomorphism from `Multiplicative (ZMod N)` to
the matrices under multiplication by `Matrix.circulant_mul`.

**Checks.**
- The basis element `single a 1` goes to the permutation matrix of `x ↦ x(· − a)`; the product of
  the images of `single a 1` and `single b 1` is the image of `single (a + b) 1`.
- Commutativity of the range is Mathlib's `Matrix.circulant_mul_comm`; the full matrix algebra is
  not commutative for `N ≥ 2`, so the range is a proper subalgebra.

*Needs:* Mathlib `AddMonoidAlgebra`, `AddMonoidAlgebra.lift`, `Matrix.circulant_mul`,
`Matrix.circulant_single`, `Matrix.circulant_injective`, `Matrix.circulant_mul_comm`. (Proved
here.)

### Examples

The `4 × 4` circulant matrix with first column `(1, 2, 0, 0)`: its eigenvalues `3`, `1 − 2i`,
`−1`, `1 + 2i` (the transform of Layer 1's example), its determinant `3 · 5 · (−1) = −15`, and the
four characters of `ℤ/4` as eigenvectors.

### Dependencies

Layer 1 (1.1, 1.2). Mathlib `Matrix.circulant`, `Matrix.circulant_apply`, `Matrix.circulant_mul`,
`Matrix.circulant_mul_comm`, `Matrix.circulant_single`, `Matrix.circulant_injective`,
`Matrix.diagonal`, `Matrix.mulVec`, `Matrix.charpoly_units_conj`, `Matrix.charpoly_diagonal`,
`Matrix.det_diagonal`, `AddMonoidAlgebra`, `AddMonoidAlgebra.lift`.

## Layer 3: uncertainty principles on ZMod N

### 3.1 The uncertainty principle of Donoho and Stark

Prove `le_ncard_support_mul`: if `f : ℤ/N → ℂ` is not zero, then
`N ≤ |supp f| · |supp f̂|` (Vetterli–Kovačević–Goyal, Theorem 7.9, p. 637; Tao, inequality (1),
p. 2, for every finite abelian group). The inequality is due to Donoho and Stark. By the
inequality of arithmetic and geometric means it gives `|supp f| + |supp f̂| ≥ 2√N`.

Route (Tao's): `|f̂(k)| ≤ ∑ |f| ≤ |supp f|^(1/2) (∑ |f|²)^(1/2)` by Cauchy–Schwarz; by 1.1,
`∑ |f|² = N⁻¹ ∑ |f̂|² ≤ N⁻¹ |supp f̂| max |f̂|²`. Combining at a point where `|f̂|` is largest,
which is nonzero since `f ≠ 0` and the transform is injective, gives the inequality.

**Checks.**
- Equality for subgroups: `N = 4`, `f` the indicator of `{0, 2}`: `f̂ = (2, 0, 2, 0)`, and
  `2 · 2 = 4`. `N = 6`, `f` the indicator of `{0, 3}`: `f̂ = (2, 0, 2, 0, 2, 0)`, and `2 · 3 = 6`.
- `f = δ₀`: `f̂` is constant `1`, and `1 · N = N`.
- Exhaustive search over all nonzero `f` with values in `{0, 1, −1, i}` for `N = 1, …, 8` finds
  the least value of `|supp f| · |supp f̂|` equal to `N` each time.
- `f = 0` is excluded: both supports are empty and `0 < N`.

*Needs:* 1.1; Mathlib `ZMod.dft`, `ZMod.dft_dft`, `Function.support`, `Set.ncard`,
`Finset.sum_mul_sq_le_sq_mul_sq`.
(Proved here, except as cited.)

### 3.2 Tao's uncertainty principle for a prime modulus

Prove `add_one_le_ncard_support_add`: if `p` is prime and `f : ℤ/p → ℂ` is not zero, then
`|supp f| + |supp f̂| ≥ p + 1` (Tao, Theorem 1.1, p. 2). The inequality is also due to Biró.

Route (Tao's): every square minor of the matrix `(e(jk/p))` is nonzero, by Chebotarev's theorem on
roots of unity (Tao, Lemma 1.3, p. 3). Tao derives it from Lemma 1.2, p. 3: if a polynomial with
integer coefficients vanishes at a tuple of `p`-th roots of unity, its value at `(1, …, 1)` is a
multiple of `p`, because `1 + z + … + z^(p−1)` is the minimal polynomial of a primitive `p`-th
root of unity; the value at `(1, …, 1)` of the relevant quotient of the minor is computed by a
Vandermonde determinant. If `|supp f| + |supp f̂| ≤ p`, choose a set `Ã`
disjoint from `supp f̂` with `|Ã| = |supp f|`; the restriction of the transform from functions on
`supp f` to functions on `Ã` is the square minor with rows `Ã` and columns `supp f` of the matrix
`(e(−jk/p))`, the complex conjugate of the corresponding minor of `(e(jk/p))`; it is invertible
(Tao, Corollary 1.4, p. 4), and it kills `f`, a contradiction. Chebotarev's theorem is
not in the pinned libraries and is proved here as a step of this target.

**Checks.**
- Primality is needed: `N = 4` and `f` the indicator of `{0, 2}` give `2 + 2 = 4 < 5`; `N = 6` and
  the indicator of `{0, 3}` give `2 + 3 = 5 < 7`.
- `p = 2`: `f = δ₀` gives `1 + 2 = 3`, and `f = (1, 1)` gives `f̂ = (2, 0)` and `2 + 1 = 3`.
- Exhaustive search over all nonzero `f` with values in `{0, 1, −1, i}` finds the least value of
  `|supp f| + |supp f̂|` equal to `p + 1` for `p = 2, 3, 5, 7`, and equal to `4`, `5` and `6` for
  `N = 4, 6, 8`.

*Needs:* Mathlib `ZMod.dft`, `ZMod.dft_apply`, `Function.support`, `Set.ncard`, `Matrix.det`,
`Matrix.det_vandermonde`, `Polynomial.cyclotomic.irreducible_rat`. (Proved here, except as
cited.)

### 3.3 Every pair of supports allowed by 3.2 occurs

Prove `exists_support_eq`: if `p` is prime and `A`, `B` are subsets of `ℤ/p` with
`|A| + |B| ≥ p + 1`, there is `f` with `supp f = A` and `supp f̂ = B` (Tao, Theorem 1.1, p. 2,
second statement, where `A` and `B` are assumed nonempty; this follows from the bound, since
neither set has more than `p` elements).

Route (Tao's, p. 5): for `|A| + |B| = p + 1` choose `Ã` with `|Ã| = |A|` meeting `B` in one point
`ξ`; by the invertible minor of 3.2 there is a nonzero `f` supported in `A` whose transform
vanishes on `Ã \ {ξ}`, so outside `B`, and 3.2 forces `supp f = A` and `supp f̂ = B`. For
`|A| + |B| > p + 1` take a generic linear combination of the functions so obtained for subsets
`A′ ⊆ A`, `B′ ⊆ B` with `|A′| + |B′| = p + 1`.

**Checks.**
- The bound cannot be lowered: with `p + 1` replaced by `p`, the pair `A = ℤ/p`, `B = ∅` would
  qualify, but `supp f = ℤ/p` forces `f ≠ 0` and so `f̂ ≠ 0`.
- `p = 2`, `A = {0}`, `B = ℤ/2`: `f = δ₀`.
- `p = 5`, `|A| = 2`: 3.2 requires `|supp f̂| ≥ 4`, so `f̂` has at most one zero. For random
  complex values on `A` the transform vanishes at no point, while `f = δ₀ − δ₁` has `f̂(0) = 0` and
  `f̂(k) ≠ 0` for `k ≠ 0`, so the pair `({0, 1}, ℤ/5 ∖ {0})`, with `2 + 4 = 6 = p + 1`, occurs.

*Needs:* 3.2; Mathlib `ZMod.dft`, `Function.support`, `Finset.card`. (Proved here, except as
cited.)

### Examples

On `ℤ/5`: `f = (1, 1, 0, 0, 0)` has `f̂(k) = 1 + e(−k/5)`, which vanishes only where
`e(−k/5) = −1`, never; so `|supp f| + |supp f̂| = 2 + 5 = 7 ≥ 6`. On `ℤ/4` the same `f` has
`f̂ = (2, 1 − i, 0, 1 + i)`, so `2 · 3 = 6 ≥ 4` and `2 + 3 = 5`.

### Dependencies

Layer 1 (1.1). Mathlib `ZMod.dft`, `ZMod.dft_apply`, `ZMod.dft_dft`, `Function.support`,
`Set.ncard`, `Finset.card`, `Finset.sum_mul_sq_le_sq_mul_sq`, `Matrix.det`,
`Matrix.det_vandermonde`, `Polynomial.cyclotomic.irreducible_rat`.

## Layer 4: convolution systems on ℤ

### 4.1 Bounded-input bounded-output stability

Prove `summable_norm_iff_bounded_convolution`: for `h : ℤ → ℂ`, the sequence `n ↦ |h(n)|` is
summable if and only if for every bounded `x : ℤ → ℂ` the convolution `h ⋆ x` exists at every
point (`DiscreteConvolution.AddConvolutionExists`) and is bounded (Vetterli–Kovačević–Goyal,
Theorem 3.8, p. 208).

Route: if `h` is absolutely summable, Tau Ceti's `DiscreteConvolution.addConvolutionExists_of_memℓp`
gives existence and `DiscreteConvolution.enorm_addConvolution_le` gives
`|(h ⋆ x)(n)| ≤ ‖x‖_∞ ∑ |h|`. Conversely, let `x(m) = conj(h(−m))/|h(−m)|` where `h(−m) ≠ 0` and
`x(m) = 0` elsewhere; then `x` is bounded by `1` and the family whose sum is `(h ⋆ x)(0)` consists
of the numbers `|h(a)|`, which are summable as soon as the convolution exists at `0`.

**Checks.**
- The existence clause is needed. For `h` constant `1` and any bounded `x`, the family whose sum is
  `(h ⋆ x)(n)` is `(x(b))_b` at every `n`, summable exactly when `x` is absolutely summable; so
  `h ⋆ x` is either the constant `∑ x(b)` or the junk value `0` at every point, bounded in both
  cases, although `h` is not absolutely summable.
- `h = δ₀`: `h ⋆ x = x`.
- The difference filter `h = δ₀ − δ₁` is stable, with `∑ |h| = 2`.

*Needs:* Tau Ceti `DiscreteConvolution.addConvolutionExists_of_memℓp`,
`DiscreteConvolution.enorm_addConvolution_le`; Mathlib `DiscreteConvolution.AddConvolutionExists`,
`DiscreteConvolution.addRingConvolution_apply`, `memℓp_infty_iff`, `memℓp_gen_iff`. (Proved here,
except as cited.)

### 4.2 The gain of a stable system

Prove `isGreatest_norm_addRingConvolution`: if `h` is absolutely summable, then `∑ |h(n)|` is the
greatest element of the set of numbers `|(h ⋆ x)(n)|` with `n ∈ ℤ` and `x` bounded by `1`. So
convolution with `h` is a bounded operator on bounded sequences with norm exactly `∑ |h|`.

Route: the bound is that of 4.1; the input of the converse of 4.1 attains it at `n = 0`.

**Checks.**
- `h = δ₀ − δ₁`: the input `x(m) = (−1)^m` gives `(h ⋆ x)(n) = 2(−1)^n`, of modulus `2 = ∑ |h|`,
  while the constant input gives `0`.
- `h = 0`: the set is `{0}` and the sum is `0`.

*Needs:* 4.1; Tau Ceti `DiscreteConvolution.enorm_addConvolution_le`. (Proved here, except as
cited.)

### Examples

The moving average `h = (δ₀ + δ₁)/2` has gain `1`, attained by the constant input; the
exponentially decaying `h(n) = 2^(−n)` for `n ≥ 0` has gain `2`.

### Dependencies

Tau Ceti `DiscreteConvolution.addConvolutionExists_of_memℓp`,
`DiscreteConvolution.enorm_addConvolution_le`; Mathlib `DiscreteConvolution.AddConvolutionExists`,
`DiscreteConvolution.addRingConvolution_apply`, `memℓp_infty_iff`, `memℓp_gen_iff`. No other layer.

## Layer 5: aliasing

### 5.1 The aliasing formula

Prove `tsum_fourier_add_div_eq`: let `f : ℝ → ℂ` be continuous, let `b > 1`, and suppose that `f`
and `𝓕f` are both `O(|x|^(−b))` at infinity. Then for every sampling step `T > 0` and every
`ξ ∈ ℝ`,

    ∑_{k ∈ ℤ} 𝓕f(ξ + k/T) = T ∑_{n ∈ ℤ} f(nT) exp(−2πi nTξ).

The left side is the periodization of the spectrum with period `1/T`; the right side is `T` times
the Fourier series of the samples. Both series converge absolutely. If `𝓕f` vanishes outside
`[−B, B]`, the left side is `𝓕f(ξ)` whenever `|ξ| < 1/T − B`, a range that contains the open
interval `(−B, B)` when `2BT ≤ 1`, so the samples determine `𝓕f`; if `2BT > 1` shifted copies
overlap and the samples see their sum (Vetterli–Kovačević–
Goyal, equations (5.72) to (5.74), pp. 455–456, in angular frequency and with Dirac combs;
Unser, Appendix A, equations (A.6) and (A.7), p. 583, with `T = 1`).

Route: apply Mathlib's `Real.tsum_eq_tsum_fourier_of_rpow_decay` at the point `Tξ` to
`F(u) = 𝓕f(u/T)`, which is continuous (`f` is integrable by
`MeasureTheory.LocallyIntegrable.integrable_of_isBigO_cocompact` and `integrableOn_Ioi_rpow_of_lt`,
so `𝓕f` is continuous by Tau Ceti's `MeasureTheory.Integrable.continuous_fourier`) and is
`O(|u|^(−b))`. By the change of variables `MeasureTheory.Measure.integral_comp_mul_left`,
`𝓕F(n) = T 𝓕(𝓕f)(Tn)`, and Fourier inversion (`Continuous.fourierInv_fourier_eq` with
`Real.fourierInv_eq_fourier_neg`; `𝓕f` is integrable since it is continuous and `O(|ξ|^(−b))`) gives
`𝓕(𝓕f)(x) = f(−x)`; so `𝓕F` is `O(|u|^(−b))` as well. Reindexing `n ↦ −n` gives the formula.

**Checks.**
- `f(x) = exp(−π(x − 1/2)²)`, with `𝓕f(ξ) = exp(−πiξ) exp(−πξ²)`, `T = 1`, `ξ = 1/4`: both sides
  are `0.455087 (1 − i)`. With `exp(+2πinTξ)` on the right the value is the conjugate
  `0.455087 (1 + i)`, so the formula fixes the sign of the phase for a function that is not even.
- `f(x) = sinc(x)²`, whose transform is the triangle `max(0, 1 − |ξ|)` (band limit `B = 1`, decay
  with `b = 2`), at `ξ = 0.3`: with `T = 1/2` (`2BT = 1`) both sides are `0.7 = 𝓕f(0.3)`; with
  `T = 1` they are `1.0 = 0.7 + 0.3`, the aliased copy `𝓕f(0.3 − 1)` added.
- `T` is a step, not a rate: with `T = 1/2` the copies are spaced by `1/T = 2`.

*Needs:* Mathlib `Real.tsum_eq_tsum_fourier_of_rpow_decay`, `Continuous.fourierInv_fourier_eq`,
`Real.fourierInv_eq_fourier_neg`, `MeasureTheory.LocallyIntegrable.integrable_of_isBigO_cocompact`,
`integrableOn_Ioi_rpow_of_lt`, `MeasureTheory.Measure.integral_comp_mul_left`,
`Real.fourier_real_eq`; Tau Ceti `MeasureTheory.Integrable.continuous_fourier`. (Proved here,
except as cited.)

### Examples

The Gaussian `exp(−πx²)` is its own transform; at `T = 1`, `ξ = 0` the formula is the classical
identity `∑ exp(−πk²) = ∑ exp(−πn²)`, and at `ξ = 1/2` it reads
`∑ exp(−π(k + 1/2)²) = ∑ (−1)^n exp(−πn²)`.

### Dependencies

Mathlib Poisson summation (`Real.tsum_eq_tsum_fourier_of_rpow_decay`), Fourier inversion
(`Continuous.fourierInv_fourier_eq`, `Real.fourierInv_eq_fourier_neg`),
`MeasureTheory.LocallyIntegrable.integrable_of_isBigO_cocompact`, `integrableOn_Ioi_rpow_of_lt`,
`MeasureTheory.Measure.integral_comp_mul_left`, `Real.fourier_real_eq`; Tau Ceti
`MeasureTheory.Integrable.continuous_fourier`. No other layer.

## Layer 6: band-limited functions and the sampling theorem

### 6.1 Band-limited functions and sampling sums

Define `IsBandLimited B f`: there is `G : ℝ → ℂ`, square-integrable, with `G(ξ) = 0` whenever
`|ξ| > B`, and `f = 𝓕⁻G`. A square-integrable function vanishing outside a bounded interval is
integrable, so `f(t) = ∫_{−B}^{B} exp(2πitξ) G(ξ) dξ` is defined pointwise and continuous. Define
`samplingSum B f S t = ∑_{n ∈ S} f(n/2B) sinc(2Bt − n)` for a finite set `S ⊆ ℤ`, with
`sinc(x) = Real.sinc(πx)`.

Relation to the Paley–Wiener spaces of DiracScatteringAndNonlinearFourierTransform §2.7. That
section defines `PW_t` as the entire functions `F(z) = ∫_{−t}^{t} φ(s) exp(isz) ds` with
`φ ∈ L²(−t, t)`, for `t ≥ 0`. For `B ≥ 0` the substitution `s = 2πξ` shows that `f` is band-limited
to `[−B, B]` exactly when it is the restriction to `ℝ` of the function of `PW_(2πB)` with density
`φ(s) = G(s/2π)/(2π)`. The class is defined here directly by the support of the spectrum, in
Mathlib's convention, and §2.7 is consumed only through this identification.

**Checks.**
- `f(t) = sinc(t)²` is band-limited to `[−1, 1]`, with `G(ξ) = max(0, 1 − |ξ|)`.
- `f(t) = 2B Real.sinc(2πBt)`, that is `sin(2πBt)/(πt)`, is band-limited to `[−B, B]`, with `G`
  the indicator of `[−B, B]`.
- For `B > 0`, `f(t) = sin(2πBt)` is not band-limited in this sense for any band limit: it is not
  square-integrable (6.2), its spectrum being a pair of point masses at `±B`. It vanishes at every
  sample point `n/2B`, so admitting it would break the uniqueness of 6.4: this is the boundary case
  of sampling at exactly the rate `2B`, excluded by the square-integrability of the spectrum.
- For `B < 0` only `G = 0` qualifies, and for `B = 0` the spectrum vanishes outside `{0}`, so its
  integral is `0`; in both cases only `f = 0` is band-limited.

*Needs:* Mathlib `MeasureTheory.MemLp`, `Real.fourierInv_eq`, `Real.sinc`;
DiracScatteringAndNonlinearFourierTransform §2.7 for the identification only. (Proved here.)

### 6.2 The energy identity

Prove `memLp_and_hasSum_norm_sq`: if `f` is band-limited to `[−B, B]`, then `f` is
square-integrable and `∑_n |f(n/2B)|² = 2B ∫ |f|²`, the series converging. No hypothesis on the
sign of `B` is needed: for `B ≤ 0` both sides are `0`.

Route: for `B > 0`, `f(m/2B) = ∫_{−B}^{B} exp(2πiξm/2B) G(ξ) dξ = 2B ĉ(−m)`, where `ĉ` are the
Fourier coefficients of `G` on the interval `[−B, B]` (Mathlib's `fourierCoeffOn`). Mathlib's
Parseval identity `hasSum_sq_fourierCoeffOn` gives `∑ |ĉ(m)|² = (2B)⁻¹ ∫_{−B}^{B} |G|²`, so
`∑ |f(m/2B)|² = 2B ∫ |G|²`. The Plancherel identity of DiracScatteringAndNonlinearFourierTransform
§2.7 (`‖F‖²_{L²(ℝ)} = 2π ‖φ‖²`), read through the identification of 6.1, gives
`∫ |f|² = ∫ |G|²` and the square-integrability of `f`.

**Checks.**
- `f = sinc²`, `B = 1`: `f(0) = 1`, `f(n/2) = 0` for even `n ≠ 0` and `4/(π² n²)` for odd `n`, so
  `∑ f(n/2)² = 1 + (32/π⁴)(π⁴/96) = 4/3`, while `∫ sinc⁴ = 2/3` and `2B · 2/3 = 4/3`. A factor
  `(2B)⁻¹` in place of `2B` would give `1/3`.
- `f = sin(2πBt)/(πt)`: the samples are `2B` at `n = 0` and `0` elsewhere, so the sum is `4B²`, and
  `∫ |f|² = ∫_{−B}^{B} 1 = 2B`.

*Needs:* 6.1; Mathlib `fourierCoeffOn`, `hasSum_sq_fourierCoeffOn`, `Real.fourierInv_eq`;
DiracScatteringAndNonlinearFourierTransform §2.7 (the Plancherel identity of `PW_t`). (Proved here,
except as cited.)

### 6.3 The Whittaker–Shannon sampling theorem

Prove, for `f` band-limited to `[−B, B]`:

- `tendstoUniformly_samplingSum`: `samplingSum B f S` tends to `f` uniformly on `ℝ` along the
  filter of finite sets `S ⊆ ℤ`;
- `tendsto_eLpNorm_samplingSum`: the `L²` norm of `f − samplingSum B f S` tends to `0` along the
  same filter.

The functions `t ↦ sinc(2Bt − n)` form an orthogonal basis of the band-limited functions in `L²(ℝ)`,
each of squared norm `1/2B`, and the sampling series is the expansion of `f` in it
(Vetterli–Kovačević–Goyal, Theorem 5.15, p. 457, for the identity, and Theorem 5.14 with the
orthonormality computation following (5.68), p. 454, for the basis; Unser, Theorem 1, p. 569, and
Section II, equations (4) to (6), p. 571, with sampling step `1`). The uniform statement is proved
here. The theorem is due to Whittaker, Kotelnikov and Shannon. No hypothesis on the sign of `B` is
needed: for `B ≤ 0`, `f = 0` and every sampling sum is `0`.

Route: the sampling sum over `S` is `𝓕⁻` of the partial Fourier series of `G` on `[−B, B]` over
`−S`, restricted to `[−B, B]`, since `𝓕⁻` of `exp(−2πiξn/2B)` times the indicator of `[−B, B]` is
`2B sinc(2Bt − n)` (after a change of variables, Mathlib's `integral_exp_mul_I_eq_sinc`,
`∫_{−r}^{r} exp(it) dt = 2r Real.sinc(r)`). Mathlib's `hasSum_fourier_series_L2` gives unconditional
convergence of these partial series to `G` in `L²(−B, B)`; the Plancherel identity of §2.7 carries
it to `L²(ℝ)`, and the bound `|g(t)| ≤ ∫ |Γ| ≤ (2B)^(1/2) ‖Γ‖₂` for `g = 𝓕⁻Γ` with `Γ` vanishing
outside `[−B, B]` carries it to uniform convergence. With 6.2 the uniform error over the complement
of `S` is at most `(∑_{n ∉ S} |f(n/2B)|²)^(1/2)`.

**Checks.**
- At a sample point `t = m/2B` the term with `n = m` is `f(m/2B)` and every other term vanishes.
- `f = sinc²`, `B = 1`, `S = {−20000, …, 20000}`: at `t = 0.1, 0.33, 1.7, −3.25` the sampling sum
  agrees with `f(t)` to within `10⁻⁴`.
- The band limit is a hypothesis on `f`, not a choice: `f(t) = Real.sinc(2πt)` is band-limited to
  `[−1, 1]` and not to `[−1/2, 1/2]`; its samples at the integers are `δ₀`, so the series for
  `B = 1/2` is `Real.sinc(πt)`, which at `t = 1/4` is `2√2/π ≈ 0.9003`, while
  `f(1/4) = 2/π ≈ 0.6366`. This is aliasing (5.1).
- At each fixed `t` the series converges absolutely, by Cauchy–Schwarz, since the samples and
  `n ↦ sinc(2Bt − n)` are both square-summable. The example of AnalyticNumberTheoryPartIII §7.4 of
  a sampling series that is not absolutely convergent has an integrable spectrum that is not
  square-integrable, so it lies outside this class.

*Needs:* 6.1, 6.2; Mathlib `hasSum_fourier_series_L2`, `fourierCoeffOn`, `Real.sinc`,
`integral_exp_mul_I_eq_sinc`, `TendstoUniformly`, `MeasureTheory.eLpNorm`;
DiracScatteringAndNonlinearFourierTransform §2.7 (the Plancherel identity of `PW_t`). (Proved here,
except as cited.)

### 6.4 Interpolation of square-summable data

Prove `existsUnique_isBandLimited`: for `B > 0` and every `c : ℤ → ℂ` with `∑ |c(n)|²` finite,
there is exactly one `f` band-limited to `[−B, B]` with `f(n/2B) = c(n)` for all `n`. With 6.2 and
6.3 this says that `f ↦ (f(n/2B))_n` is a bijection from the band-limited functions onto `ℓ²(ℤ)`,
`(2B)^(1/2)` times an isometry, with inverse the sampling series (Vetterli–Kovačević–Goyal,
Theorem 5.11, p. 452, where the interpolation operator is defined on all of `ℓ²(ℤ)`, and
Theorem 5.14, p. 454, which applies it to the cardinal sine).

Route: existence: by Riesz–Fischer on the interval (the Hilbert basis `fourierBasis` of `L²` of the
circle of length `2B`), there is `G ∈ L²(−B, B)` with Fourier coefficients `ĉ(−m) = c(m)/2B`, and
`f = 𝓕⁻G` has `f(m/2B) = 2B ĉ(−m) = c(m)`. Uniqueness: if a band-limited `f` vanishes at every
`n/2B`, then `∑ |f(n/2B)|² = 0`, so `∫ |f|² = 0` by 6.2, and `f`, being continuous, is `0`.

**Checks.**
- `B > 0` is needed: for `B ≤ 0` the only band-limited function is `0`, and `c = δ₀` is not its
  sequence of samples.
- Square-summability is needed: by 6.2 the samples of a band-limited function are square-summable,
  so the constant sequence `1` is not a sequence of samples.
- `c = δ₀` gives `f(t) = sinc(2Bt)`, band-limited with `G = (2B)⁻¹` times the indicator of
  `[−B, B]`.
- The sign convention: `G(ξ) = (2B)⁻¹ ∑ c(n) exp(−2πiξn/2B)` on `[−B, B]` gives
  `f(m/2B) = (2B)⁻¹ ∑ c(n) ∫_{−B}^{B} exp(2πiξ(m − n)/2B) dξ = c(m)`; with `exp(+2πiξn/2B)` the
  samples would be `c(−m)`.

*Needs:* 6.1, 6.2; Mathlib `fourierBasis`, `fourierCoeffOn`. (Proved here, except as cited.)

### 6.5 Oversampling with a rapidly decaying kernel

Prove `hasSum_oversampling`: let `T > 0` and let `φ` be a Schwartz function whose transform is `1`
on `[−B, B]` and `0` where `|ξ| ≥ 1/T − B`. Then every `f` band-limited to `[−B, B]` satisfies
`f(t) = T ∑_n f(nT) φ(t − nT)` for every `t`, the series converging unconditionally. Such a `φ`
exists exactly when `2BT < 1`: if `B ≥ 0` and `2BT ≥ 1` the two conditions on `𝓕φ` contradict
each other at `ξ = B`; if `0 ≤ B < 1/2T`, the inverse transform of a smooth function equal to `1`
on `[−B, B]` and to `0` where `|ξ| ≥ 1/T − B` qualifies; and if `B < 0`, `φ = 0` qualifies (and
only `f = 0` is band-limited). Sampling faster than the rate
`2B` thus allows a kernel decaying faster than every power, in place of the cardinal sine, which
decays like `1/|t|`. (Proved here.)

Route: the series converges absolutely by Cauchy–Schwarz, the samples `f(nT)` being
square-summable (6.2 applied with the band limit `1/2T`, which is at least `B`) and
`φ` decaying rapidly. Write `φ(t − nT) = ∫ 𝓕φ(ξ) exp(2πiξ(t − nT)) dξ` (Fourier inversion for
Schwartz functions). The Fourier series `T ∑_n f(nT) exp(−2πinTξ)` converges in `L²` on each
period to the `1/T`-periodization of `G` (Mathlib's `hasSum_fourier_series_L2`, on an interval of
length `1/T`), and on the support of `𝓕φ` that periodization is `G` itself, since the shifted
copies `G(ξ + k/T)`, `k ≠ 0`, vanish where `|ξ| < 1/T − B`. Hence the sum is
`∫ 𝓕φ G exp(2πiξt) dξ = ∫ G exp(2πiξt) dξ = f(t)`.

**Checks.**
- `B = 1`, `T = 0.4` (`2BT = 0.8`), `f = sinc²`, and `𝓕φ` a smooth function equal to `1` on
  `[−1, 1]` and `0` for `|ξ| ≥ 1.5`: at `t = 0.13, 0.9, −2.2` the series over `|n| ≤ 300` agrees
  with `f(t)` to within `10⁻⁶`.
- `T = 1/2B` is excluded by the hypotheses, as above; there the only admissible kernel would be
  the cardinal sine of 6.3, which is not a Schwartz function.

*Needs:* 6.1, 6.2; Mathlib `SchwartzMap`, `Continuous.fourierInv_fourier_eq`,
`hasSum_fourier_series_L2`, `fourierCoeffOn`. (Proved here, except as cited.)

### Examples

For `f = sinc²` and `B = 1`: the samples `f(n/2)`, their energy `4/3 = 2 · 2/3`, the uniform
error of the truncated sampling series over `|n| ≤ M`, bounded by the square root of the tail sum
`∑_{|n| > M} f(n/2)²`, and the oversampled expansion at step `T = 0.4`.

### Dependencies

DiracScatteringAndNonlinearFourierTransform §2.7 (the identification of 6.1 and the Plancherel
identity of `PW_t`). Mathlib `MeasureTheory.MemLp`, `Real.fourierInv_eq`, `Real.sinc`,
`fourierCoeffOn`, `hasSum_sq_fourierCoeffOn`, `hasSum_fourier_series_L2`, `fourierBasis`,
`integral_exp_mul_I_eq_sinc`,
`TendstoUniformly`, `MeasureTheory.eLpNorm`, `SchwartzMap`, `Continuous.fourierInv_fourier_eq`. No
other layer.

## Scope and ownership

This roadmap owns the targets stated above: Parseval's identity and the convolution theorem for
`ZMod.dft`; the DFT matrix, the diagonalization of circulant matrices, their characteristic
polynomial and determinant, the commutant of the cyclic shift and the identification of the
circulant matrices with `ℂ[ℤ/N]`; the uncertainty principles of Donoho–Stark and of Tao with its
converse; the stability theorem for convolution on `ℤ` and the gain of a stable system; the
aliasing formula; and band-limited functions with the energy identity, the sampling theorem in its
uniform and `L²` forms, the interpolation of square-summable data and oversampling.

Already in the libraries and therefore not targets:

- The discrete Fourier transform with its inversion (`ZMod.dft`, `ZMod.dft_dft`,
  `ZMod.invDFT_apply`, in `Mathlib/Analysis/Fourier/ZMod.lean`) and the orthogonality of
  characters of finite abelian groups (`Mathlib/Analysis/Fourier/FiniteAbelian/`). Parseval's
  identity and the convolution theorem for `ZMod.dft` are not in the pinned libraries.
- Circulant matrices with their products and commutativity (`Matrix.circulant_mul`,
  `Matrix.circulant_mul_comm`, in `Mathlib/LinearAlgebra/Matrix/Circulant.lean`).
- Discrete convolution on monoids (`Mathlib/Topology/Algebra/InfiniteSum/DiscreteConvolution.lean`),
  and Tau Ceti's existence of the convolution of a bounded and a summable family and its pointwise
  bound (`TauCeti/Analysis/Normed/Lp/DiscreteConvolution.lean`), which are the sufficiency half of
  4.1.
- The aliasing formula of 5.1 for Schwartz functions: Tau Ceti's Poisson summation over a full
  lattice, `SchwartzMap.tsum_eq_tsum_dual_fourier`
  (`TauCeti/Analysis/Fourier/PoissonSummation.lean`), applied to the Schwartz function `𝓕f` and the
  lattice `T⁻¹ℤ`, whose covolume is `1/T` and whose dual is `Tℤ`, gives it. 5.1 is stated under the
  decay hypotheses of Mathlib's Poisson summation instead, which admit functions that are not
  Schwartz functions, such as `sinc²` in its Check.
- The Fourier transform on `ℝ`, its inversion, Poisson summation
  (`Mathlib/Analysis/Fourier/PoissonSummation.lean`), the `L²` Fourier transform
  (`MeasureTheory.Lp.fourierTransformₗᵢ`) and Parseval's identity for Fourier series
  (`Mathlib/Analysis/Fourier/AddCircle.lean`).

Left to other roadmaps:

- DiracScatteringAndNonlinearFourierTransform §2.7 owns the Paley–Wiener spaces `PW_t` with their
  Plancherel identity and reproducing kernel; 6.1 identifies the band-limited functions with the
  restrictions to `ℝ` of `PW_(2πB)` and consumes the Plancherel identity, and nothing of §2.7 is
  restated. AutomorphicSpectralTheory §1.6 records the Paley–Wiener theorem for smooth compactly
  supported functions on a Euclidean space; it is not used here.
- AnalyticNumberTheoryPartIII §7.4 owns Brown's bound for the error of the symmetric partial
  sums of the sampling series of `f = 𝓕⁻G` with `G` integrable, `|f(t) − S(t)| ≤ 2 ∫_{|ξ|>B} |G|`,
  pointwise; when `G` vanishes outside `[−B, B]` it gives the pointwise sampling theorem for
  integrable spectra. Here the spectra are square-integrable, a narrower class, and the statements
  are different: unconditional convergence uniformly and in `L²`, the energy identity and the
  bijection with `ℓ²(ℤ)`. Brown's bound is not restated.
- FourierDeligneTransform §0.2 owns the finite Fourier transform of functions on a
  finite-dimensional vector space over a finite field, with its inversion, Plancherel and
  convolution identities. For `N = p` prime, 1.1 and 1.2 follow from it through the comparison
  stated there (its transform at `k` is `ZMod.dft` at `−k`): 1.2 directly, and 1.1 from its
  bilinear Plancherel identity applied to `conj Φ` and `Ψ(−·)`; for composite `N`, `ℤ/N` is not
  such a vector space, and 1.1 and 1.2 are stated here for every `N`.

Not treated here: wavelets and multiresolution analysis; frames and irregular sampling; sampling of
random processes; the discrete-time Fourier transform and the `z`-transform as objects of their
own; uncertainty principles on `ℝ` and the uncertainty principles of Meshulam for general finite
abelian groups; fast algorithms for the discrete Fourier transform and the design of filters,
which are procedures and not theorems.

## Exact supplier contracts

### From Mathlib

- `Mathlib/Analysis/Fourier/ZMod.lean`: `ZMod.dft : (ZMod N → E) ≃ₗ[ℂ] (ZMod N → E)` for
  `[NeZero N]`; `ZMod.dft_apply` (`ZMod.dft Φ k = ∑ j, ZMod.stdAddChar (-(j * k)) • Φ j`, by
  definition); `ZMod.dft_dft` (`ZMod.dft (ZMod.dft Φ) = fun j ↦ N • Φ (-j)`).
  `Mathlib/Analysis/SpecialFunctions/Complex/CircleAddChar.lean`: `ZMod.stdAddChar`, the character
  `j ↦ exp(2πij/N)`.
- `Mathlib/Topology/Algebra/InfiniteSum/DiscreteConvolution.lean`:
  `DiscreteConvolution.addRingConvolution` (notation `⋆ᵣ₊`), with
  `DiscreteConvolution.addRingConvolution_apply` (`(f ⋆ᵣ₊ g) x` is the `tsum` of `f a * g b` over
  the pairs with `a + b = x`); `DiscreteConvolution.AddConvolutionExists L f g` (the family is
  summable at every `x`). `tsum_fintype` (a `tsum` over a finite type is the finite sum).
- `Mathlib/LinearAlgebra/Matrix/Circulant.lean`: `Matrix.circulant` (`circulant v i j = v (i - j)`,
  `Matrix.circulant_apply`); `Matrix.circulant_mul` (for a finite additive group index,
  `circulant v * circulant w = circulant (circulant v *ᵥ w)`); `Matrix.circulant_mul_comm` (for a
  commutative index group and commutative coefficients, circulant matrices commute);
  `Matrix.circulant_single` (`circulant (Pi.single 0 a) = scalar n a`);
  `Matrix.circulant_injective`. `Matrix.diagonal`, `Matrix.mulVec`, `Matrix.det`.
- `Mathlib/LinearAlgebra/Matrix/Charpoly/Basic.lean` and `Coeff.lean`: `Matrix.charpoly_diagonal`
  (the characteristic polynomial of `diagonal d` is `∏ i, (X - C (d i))`),
  `Matrix.charpoly_units_conj` (conjugation by a unit preserves the characteristic polynomial);
  `Matrix.det_diagonal`.
- `Mathlib/Algebra/MonoidAlgebra/Defs.lean` and `Basic.lean`: `AddMonoidAlgebra ℂ (ZMod N)`, the
  group algebra, with coefficients `a.coeff`; `AddMonoidAlgebra.lift` (algebra homomorphisms out of
  it correspond to monoid homomorphisms from `Multiplicative (ZMod N)`).
- `Polynomial.cyclotomic.irreducible_rat` (the `n`-th cyclotomic polynomial is irreducible over
  `ℚ`, for `0 < n`) and `Matrix.det_vandermonde` (the Vandermonde determinant is
  `∏_{i < j} (v j − v i)`), used in 3.2 for Chebotarev's theorem.
  `Finset.sum_mul_sq_le_sq_mul_sq` (Cauchy–Schwarz for finite sums). `Function.support`,
  `Set.ncard`, `Finset.card`.
- `Mathlib/Analysis/Normed/Lp/lpSpace.lean`: `memℓp_infty_iff` (a family is in `ℓ^∞` exactly when
  its norms are bounded above); `memℓp_gen_iff` (for `0 < p < ∞`, a family is in `ℓ^p` exactly when
  the `p`-th powers of its norms are summable), used with `p = 1`.
- `Mathlib/Analysis/Fourier/FourierTransform.lean`: the Fourier transform `𝓕` and its inverse
  `𝓕⁻` on functions `ℝ → ℂ`; `Real.fourier_real_eq` (`𝓕 f w = ∫ v, 𝐞 (-(v * w)) • f v`);
  `Real.fourierInv_eq` (`𝓕⁻ f w = ∫ v, 𝐞 ⟪v, w⟫ • f v`); `Real.fourierInv_eq_fourier_neg`
  (`𝓕⁻ f w = 𝓕 f (-w)`).
- `Mathlib/Analysis/Fourier/Inversion.lean`: `Continuous.fourierInv_fourier_eq` (for continuous
  integrable `f` with integrable `𝓕 f`, `𝓕⁻ (𝓕 f) = f`).
- `Mathlib/Analysis/Fourier/PoissonSummation.lean`: `Real.tsum_eq_tsum_fourier_of_rpow_decay` (for
  continuous `f : ℝ → ℂ` with `f` and `𝓕 f` both `O(|x| ^ (-b))` at `cocompact ℝ`, `1 < b`,
  `∑' n : ℤ, f (x + n) = ∑' n : ℤ, 𝓕 f n * fourier n (x : UnitAddCircle)`).
- `Mathlib/MeasureTheory/Integral/Asymptotics.lean`:
  `MeasureTheory.LocallyIntegrable.integrable_of_isBigO_cocompact` (a locally integrable function
  that is `O(g)` at `cocompact` for an integrable `g` is integrable).
  `Mathlib/Analysis/SpecialFunctions/ImproperIntegrals.lean`: `integrableOn_Ioi_rpow_of_lt` (`t ^ a`
  is integrable on `(c, ∞)` for `a < −1` and `c > 0`), which makes `|x| ^ (-b)` integrable at
  `cocompact ℝ` for `b > 1`. `Mathlib/MeasureTheory/Measure/Haar/NormedSpace.lean`:
  `MeasureTheory.Measure.integral_comp_mul_left` (`∫ x, g (a * x) = |a⁻¹| • ∫ y, g y` on `ℝ`).
- `Mathlib/Analysis/Fourier/AddCircle.lean`: `fourierCoeffOn` (for `a < b`, the `n`-th Fourier
  coefficient on `[a, b]`, `(b - a)⁻¹ ∫_a^b exp(−2πinx/(b − a)) f x dx`);
  `hasSum_sq_fourierCoeffOn` (for `f` square-integrable on `Ioc a b`,
  `∑ |fourierCoeffOn f n|² = (b − a)⁻¹ ∫_a^b |f|²`); `hasSum_fourier_series_L2` (the Fourier series
  of an `L²` function on the circle converges to it in `L²`, unconditionally); `fourierBasis` (the
  monomials as a Hilbert basis of `L²` of the circle).
- `Mathlib/Analysis/SpecialFunctions/Trigonometric/Sinc.lean`: `Real.sinc` (`sin x / x`, `1` at
  `0`). `Mathlib/Analysis/SpecialFunctions/Integrals/Basic.lean`: `integral_exp_mul_I_eq_sinc`
  (`∫ t in -r..r, exp (t * I) = 2 * r * Real.sinc r`). `MeasureTheory.MemLp`, `MeasureTheory.eLpNorm`,
  `TendstoUniformly`, `SchwartzMap`.

### From Tau Ceti

- `TauCeti/Analysis/Normed/Lp/DiscreteConvolution.lean`:
  `DiscreteConvolution.addConvolutionExists_of_memℓp` (on a right-cancellative additive monoid,
  for a continuous bilinear `L`, `f ∈ ℓ^∞` and `g ∈ ℓ¹`, the convolution of `f` and `g` through
  `L` exists at every point; with `L` the multiplication of `ℂ` its summands are those of
  `DiscreteConvolution.addRingConvolution`); `DiscreteConvolution.enorm_addConvolution_le`
  (`‖(f ⋆ g) x‖ₑ ≤ ‖L‖ₑ ((‖f ·‖ₑ) ⋆ (‖g ·‖ₑ)) x`). Both are used with `ℤ` and the multiplication
  of `ℂ`, and with the factors in either order, convolution on `ℤ` being commutative
  (Mathlib's `DiscreteConvolution.addRingConvolution_comm`).
- `TauCeti/Analysis/Fourier/Continuous.lean`: `MeasureTheory.Integrable.continuous_fourier` (the
  Fourier transform of an integrable function on a finite-dimensional real inner product space is
  continuous).

### From TauCetiRoadmap.DiracScatteringAndNonlinearFourierTransform

- §2.7, Paley–Wiener spaces: for `t ≥ 0`, `PW_t` is the set of `F(z) = ∫_{−t}^{t} φ(s) exp(isz) ds`
  with `φ ∈ L²(−t, t)`, and `‖F‖²_{L²(ℝ)} = 2π ‖φ‖²`. Used in 6.1 for the identification of the
  band-limited functions with `PW_(2πB)` and in 6.2 and 6.3 for the Plancherel identity
  `∫ |𝓕⁻G|² = ∫ |G|²` for square-integrable `G` vanishing outside `[−B, B]`.

## References

- Martin Vetterli, Jelena Kovačević and Vivek K Goyal, *Foundations of Signal Processing*,
  Cambridge University Press, 2014; free version 1.1 of May 2014 from fourierandwavelets.org. The
  page numbers above are those of that version.
- Michael Unser, *Sampling—50 years after Shannon*, Proceedings of the IEEE 88 (2000), 569–587;
  author's copy from the Biomedical Imaging Group, EPFL.
- Terence Tao, *An uncertainty principle for cyclic groups of prime order*, arXiv:math/0308286,
  version 4 of September 2003; the theorem, lemma and page numbers above are those of that
  version.
- Attributions made in prose without a locator: David L. Donoho and Philip B. Stark (the
  uncertainty principle of 3.1, SIAM Journal on Applied Mathematics 49, 1989); András Biró (the
  inequality of 3.2, independently); E. T. Whittaker, V. A. Kotelnikov and C. E. Shannon (the
  sampling theorem).
