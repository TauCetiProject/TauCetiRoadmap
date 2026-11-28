# Roadmap: Fast and nonequispaced Fourier transforms

**Summary.** This roadmap develops the discrete Fourier transform as an object of numerical
computation. It starts from the Fourier matrix: its unitarity up to a factor, the product
formula and the shift relation, and the diagonalization of circulant matrices by the characters.
It then proves the index-map factorizations that make the transform fast: the Cooley–Tukey
splitting of a composite length with twiddle factors, the prime-factor splitting of a length
with coprime factors without twiddle factors, Rader's reduction of a prime length to a cyclic
convolution, and Bluestein's reduction of an arbitrary length to a convolution of any length at
least about twice as long. For lengths that are powers of two it states the radix-2 algorithms
as explicit products of sparse factors, bit reversal, butterflies and twiddle factors, and counts
their real multiplications and additions exactly in an explicit cost model. On the analytic side
it proves the aliasing formula for the trapezoidal approximation of Fourier coefficients, the
existence and uniqueness of the trigonometric interpolant, and the truncation and interpolation
error in the periodic Sobolev norms. It builds the nonequispaced fast Fourier transform by the
window method, with the error of a general window and the explicit error bound and locality of
the B-spline window, for the transform and its adjoint. It ends with exponential sums: Prony's
method, uniqueness of the parameters, the rank of the Hankel matrices of the samples and the
matrix pencil whose eigenvalues are the nodes.

The discrete Fourier transform itself, its inversion, Parseval's identity, the convolution
theorem and the diagonalization of circulant matrices as a matrix identity come from
[SamplingAndDiscreteFourierAnalysis][SDFA], which also owns the Poisson summation and sampling
theorems on the line; this roadmap takes its Fourier matrix and returns the fast algorithms, the
cost counts, the periodic error theory and the window method. QuadratureRulesAndPeanoKernels
treats the trapezoidal rule for analytic periodic integrands, which is the zero frequency of the
aliasing formula here; nothing passes between the two. The roadmap is a synthesis of Plonka,
Potts, Steidl and Tasche, Stoer and Bulirsch, Iserles, Canuto, Hussaini, Quarteroni and Zang,
Shen, Tang and Wang, and Kress; it follows none of them section by section.

## How to read the build

Each layer has numbered subsections. Each subsection lists its targets as bold headlines with
their Lean names, a source locator for a headline that restates a source result and a proof route
for a corollary or adaptation, a *Needs:* line, and **Checks**, sanity checks of the key
definitions and theorems with the values computed for them. The Lean forms are in
`Suggested.lean`; every headline with a Lean name is stated there with every conclusion attached
to it here.

Layer 1 (the Fourier matrix) is the foundation of the algebraic part. Layer 2 (index maps) uses
Layer 1 and Mathlib's cyclic convolution. Layer 3 (radix-2) is a specialization of the
splitting of §2.1 carried out to the end, and Layer 4 (cost) counts the factors of Layer 3.
Layer 5 (aliasing and interpolation) is analytic and uses only the definition of the transform
and Fourier coefficients on [0, 2π]. Layer 6 (the window method) uses Layer 5. Layer 7
(exponential sums) is linear algebra on the samples and is independent of Layers 2–6.

## Conventions

- A vector of length N is a function `ZMod N → ℂ`, with `[NeZero N]`. The discrete Fourier
  transform is Mathlib's `ZMod.dft`, âₖ = Σⱼ aⱼ wʲᵏ with w = w(N) = exp(−2πi/N) and no
  normalizing factor; its kernel is `ZMod.stdAddChar`. The Fourier matrix F(N), or F when N is
  fixed, is the local copy `dftMatrix N` of the supplier's definition, with wʲᵏ in row k and
  column j. Id(n) is the identity matrix of size n. The inverse
  transform is Mathlib's `ZMod.invDFT_apply`, and the orthogonality of the characters is
  `AddChar.sum_mulShift`; both are library facts and no target here.
- Cyclic convolution is Mathlib's `DiscreteConvolution.addRingConvolution`, notation `⋆ᵣ₊`;
  (a ⋆ b)(x) is the sum of a(y) b(z) over y + z = x. A circulant matrix is Mathlib's
  `Matrix.circulant`, with entry v(i − j); the cyclic forward shift V is
  `circulant (Pi.single 1 1)`, so that (V a)(i) = a(i − 1). Kronecker products are Mathlib's
  `Matrix.kroneckerMap`, notation `⊗ₖ`, with pairs of indices ordered (major, minor).
- A fast algorithm is a factorization F(N) = A₁ A₂ ⋯ Aᵣ of the Fourier matrix, possibly after a
  reindexing of rows and columns by explicit bijections (`Matrix.submatrix`). Its arithmetic cost
  is a natural-number function of the factor list, `factorizationCost`, never a running time:
  each factor is applied as a sparse matrix-vector product, row by row over its nonzero entries,
  and a complex multiplication by a constant c costs nothing for c ∈ {±1, ±i}, 2 real
  multiplications and 2 real additions for a primitive eighth root of unity, and 3 and 3
  otherwise (`constMulCost`). This is the counting rule of Plonka et al. in matrix form.
- Bit reversal `bitReverse t k` reverses the t binary digits of k < 2ᵗ, read with
  `Nat.testBit`.
- A 2π-periodic function is a function `u : ℝ → ℂ`; its Fourier coefficients are
  `periodicCoeff u k`, Mathlib's `fourierCoeffOn` on [0, 2π]. The samples are taken at 2πj/N,
  j < N, for the aliasing formula and at πj/N, j < 2N, for the interpolant of Canuto et al. on
  the band −N ≤ k < N (`band`). The coefficient cₖ(u) is written c(u, k) when the index is an
  expression. Quantities that may be infinite, the periodic Sobolev seminorm
  `fourierSobolevSeminorm` and norm `fourierSobolevNorm`, take values in ℝ≥0∞ and are defined on
  the Fourier side, so they are meaningful for every u. The norm has the weights 1 + |k|²ˡ of
  Canuto et al., with 0⁰ = 1, so that ‖u‖₀ is √2 times the L² norm normalized by (2π)⁻¹. Tau
  Ceti's Sobolev space on the circle, `TauCeti.CircleSobolev`, has the weights (1 + |k|)²ˡ; the
  two norms are equivalent, and §5.3 states the comparison.
- The centred cardinal B-spline `centredBSpline n` is Mₙ₊₁, of order n + 1: M₁ is the
  indicator of [−1/2, 1/2) and Mₙ₊₂ = Mₙ₊₁ ∗ M₁ is Mathlib's `MeasureTheory.convolution`
  with `ContinuousLinearMap.lsmul`. It is the window of the nonequispaced transform. The
  B-splines on general knots defined by divided differences are a different object and are not
  used.
- The sinc function is Mathlib's `Real.sinc`, sin x / x.
- Exponential sums have nodes zⱼ ∈ ℂ and weights cⱼ, samples h(k) = Σⱼ cⱼ zⱼᵏ. The
  Vandermonde matrix is Mathlib's `Matrix.vandermonde` and rank is `Matrix.rank`.

## Layer 1: the Fourier matrix

### 1.1 Unitarity

Sources: [PPST, §3.2, (3.28), pp. 119–120, and Theorem 3.16, (3.31), p. 124]; [I, Lemma 10.2,
p. 215].

- **Unitarity** (`dftMatrix_unitary`). The Fourier matrix is symmetric, Fᴴ F = F Fᴴ = N · 1, its
  inverse is N⁻¹ Fᴴ, and F/√N lies in `Matrix.unitaryGroup` [PPST, (3.28), pp. 119–120,
  and Theorem 3.16, p. 124]. Route: the supplier notes Fᴴ F = N · 1 in the prose of its 2.1, as a
  consequence of its Parseval identity 1.1; directly, the entries are the sums over l of w⁽ʲ⁻ᵏ⁾ˡ,
  which is `AddChar.sum_mulShift` [PPST, Lemma 3.2, p. 110], and the other conjuncts follow by
  symmetry of the kernel and `Matrix.inv_eq_left_inv`.

*Needs:* the local copy `dftMatrix`.

**Checks.**

- N = 1: F = (1), and every conjunct holds with N = 1.
- N = 4, a = (1, 2, 0, 0): F a = (3, 1 − 2i, −1, 1 + 2i), and ‖F a‖² = 9 + 5 + 1 + 5 = 20 =
  4 · ‖a‖².
- Negative control: F itself is not unitary for N = 2, since Fᴴ F = 2 · 1.

### 1.2 The product formula and the shift

Sources: [PPST, §3.2, (3.43), p. 133, and Theorem 3.26, property 5, p. 134].

- **Product formula** (`dft_mul_eq_addRingConvolution`). N times the transform of the pointwise
  product a b is â ⋆ b̂ [PPST, Theorem 3.26, property 5, p. 134]. Route: the dual of the supplier's
  convolution theorem; expand both sides and use the orthogonality of the characters.
- **Shift relation** (`dftMatrix_mul_shift`). F V = diag(wᵏ) F [PPST, (3.43), p. 133], where
  diag(wᵏ) is the modulation matrix. Route: the supplier's diagonalization of circulants (its
  2.1) at v = δ₁, whose transform is k ↦ wᵏ by `ZMod.dft_apply`. The content is the supplier's;
  the target is kept as the witness of the direction of the shift, (V a)(i) = a(i − 1), against
  which Layers 2 and 3 are read.

*Needs:* 1.1; the supplier's 1.2 and 2.1.

**Checks.**

- N = 2, a = b = (1, 0): the transform of a b is (1, 1) and â ⋆ b̂ = (2, 2) = 2 · (1, 1).
- Negative control: without the factor N the product formula fails at the same data, (1, 1)
  against (2, 2).
- N = 3, a = (0, 1, 0): V a = (0, 0, 1), and the transform of V a is (1, w², w⁴) = diag(1, w, w²) â
  with w = w₃.

### 1.3 Circulant matrices

Sources: [PPST, §3.3, Corollary 3.33, (3.48), pp. 138–139, and (3.50), p. 139].

- **Circulants are polynomials in the shift** (`circulant_eq_sum_smul_shift_pow`).
  circ a = Σₖ aₖ Vᵏ, k = 0, …, N − 1 [PPST, (3.50), p. 139]. Route: the (i, j) entry of Vᵐ is 1
  iff i − j = m, by induction on m.
- **Eigenvectors** (`hasEigenvector_circulant`). The character j ↦ w⁻ʲᵏ, the k-th column of
  Fᴴ, is an eigenvector of circ a with eigenvalue âₖ, in the sense of
  `Module.End.HasEigenvector` [PPST, Corollary 3.33, (3.48), pp. 138–139]. Route: the supplier's
  2.1 multiplied on the right by Fᴴ, with Fᴴ F = N · 1 from §1.1; or one reindexing of the sum,
  (circ a v)(i) = w⁻ⁱᵏ Σₘ aₘ wᵐᵏ.

The supplier's 2.1 is the matrix form of the same fact and mentions the eigenvector columns in
its prose; the vector form is stated here. Its 2.2 and 2.4 (the characteristic polynomial and the
algebra of circulants) are not restated here.

*Needs:* 1.2.

**Checks.**

- N = 2, a = (1, 2): circ a = [[1, 2], [2, 1]], eigenvectors (1, 1) and (1, −1), eigenvalues 3
  and −1 = â₀ and â₁.
- N = 1: circ a = (a₀) = a₀ V⁰.
- Negative control: the column k of F itself, j ↦ wʲᵏ, is the eigenvector for â₋ₖ, not
  âₖ; at N = 3, a = (0, 1, 0) the two eigenvalues are w and w² and differ.

## Layer 2: index maps

### 2.1 The Cooley–Tukey splitting

Sources: [PPST, §5.3.2, (5.24)–(5.27), Algorithm 5.16, pp. 256–259, and (5.30), p. 261];
[SB, §2.3.2, pp. 80–83].

- **Cooley–Tukey** (`dftMatrix_submatrix_cooleyTukey`). For N = N₁ N₂, the input map
  (j₂, j₁) ↦ j₁ + N₁ j₂ and the output map (k₂, k₁) ↦ N₂ k₁ + k₂ are bijections, and after
  these reindexings F(N) = (Id(N₂) ⊗ F(N₁)) D (F(N₂) ⊗ Id(N₁)) with the diagonal of twiddle
  factors D(k₂, j₁) = exp(−2πi j₁k₂/N) [PPST, (5.27), p. 258, and (5.30), p. 261].
- **Radix 2 in one step.** At N₁ = n, N₂ = 2 this is F(2n) = Πᵀ (Id(2) ⊗ F(n)) D (F₂ ⊗ Id(n)) with
  Π the even–odd sort [PPST, (5.9), p. 243]; it is the prose corollary that Layer 3 iterates.

*Needs:* 1.1; `Matrix.kroneckerMap`.

**Checks.**

- N₁ = N₂ = 2: D = diag(1, 1, 1, −i) in the order (k₂, j₁) = (0,0), (0,1), (1,0), (1,1), and the
  product reproduces F₄.
- N₁ = 3, N₂ = 2, a = (1, 2, 3, 4, 5, 6): F₆ a = (21, −3 + 3√3 i, −3 + √3 i, −3, −3 − √3 i,
  −3 − 3√3 i), and the three factors applied in turn to a give the same vector in the output
  order (k₂, k₁).
- N₁ = 1 or N₂ = 1: D = 1 and the identity reduces to F(N) = F(N).
- Negative control: with the twiddle factors omitted the identity fails already for N = 4.

### 2.2 The prime-factor splitting

Sources: [PPST, Theorem 5.13, p. 254], the Chinese remainder theorem behind the index maps; the
factorization itself is cited, not proved, in [PPST, §5.3.2, p. 262].

- **Good–Thomas** (`dftMatrix_submatrix_goodThomas`). For coprime N₁ and N₂, the input map
  (j₁, j₂) ↦ N₂ j₁ + N₁ j₂ mod N is a bijection, and with the inverse of
  `ZMod.chineseRemainder` on the output, F(N) = F(N₁) ⊗ F(N₂) with no twiddle factors. Route:
  exp(−2πi K(N₂j₁ + N₁j₂)/N) = exp(−2πi Kj₁/N₁) exp(−2πi Kj₂/N₂), and K ≡ kᵢ mod Nᵢ.

*Needs:* 1.1; the Chinese remainder theorem.

**Checks.**

- N₁ = 2, N₂ = 3: the input map sends (j₁, j₂) to 3 j₁ + 2 j₂ mod 6, which takes the six values
  0, 2, 4, 3, 5, 1.
- Negative control: N₁ = 2, N₂ = 4 are not coprime, and the image of the input map has 4
  elements, not 8.

### 2.3 Rader's reduction

Sources: [PPST, §5.3.4, (5.35)–(5.43), pp. 271–273].

- **Rader** (`dft_rader`). For a prime p and a generator g of the units of `ZMod p`,
  â(gᵛ) = a₀ + (A ⋆ B)(v) for v in `ZMod (p - 1)`, with the cyclic convolution of length p − 1 of
  A(u) = a(g⁻ᵘ) and B(u) = exp(−2πi gᵘ/p) [PPST, (5.38)–(5.40), pp. 271–272].

The remaining value â₀ = Σⱼ aⱼ is Mathlib's `ZMod.dft_apply_zero`.

*Needs:* the cyclicity of the unit group of `ZMod p`.

**Checks.**

- p = 2, g = 1: â₁ = a₀ + a₁ · w₂ = a₀ − a₁.
- p = 5, g = 2, a = (1, 2, 3, 4, 5), v = 1: â(2) = −2.5 + 0.8123 i, and a₀ + (A ⋆ B)(1) takes
  the same value.
- Negative control: p = 7, g = 2, of order 3, a = (1, …, 7), v = 1: â(2) = −3.5 + 2.7912 i, while
  a₀ + (A ⋆ B)(1) = 0.9390 − 9.1147 i; the hypothesis on the order of g is needed.

### 2.4 Bluestein's reduction

Sources: [PPST, §5.3.4, (5.44)–(5.45), Algorithm 5.21, pp. 274–275].

- **Chirp identity** (`dft_eq_chirp_mul_sum`). With the chirp χ(t) = exp(−πi t²/N) (`chirp`),
  âₖ = χ(k) Σⱼ aⱼ χ(j) conj χ(k − j) [PPST, (5.44), p. 274]. Route:
  2jk = j² + k² − (k − j)².
- **Bluestein** (`dft_eq_chirp_mul_addRingConvolution`). For M with 2N ≤ M + 2, the sum is the
  value at k < N of the cyclic convolution of length M of b(t) = aₜ χ(t) (t < N, else 0) and
  h(t) = conj χ(t) for t < N, conj χ(M − t) for t > M − N, and 0 otherwise. Route: for t < N the
  wrapped index M + k − j lies in the second range, and the two ranges meet at most in
  t = N − 1 = M − t. Plonka et al. take M a power of two with 2N − 2 ≤ M < 4N, with the same
  overlap at N − 1 in their embedding (5.45) [PPST, pp. 274–275]; the identity needs only the
  lower bound.

*Needs:* 1.1.

**Checks.**

- N = 1: χ = 1 and both sides are a₀.
- N = 3, M = 4, a = (1, 2, 3): â = (6, −1.5 + 0.8660 i, −1.5 − 0.8660 i), and χ(k) (b ⋆ h)(k)
  takes the same three values.
- Negative control: N = 3, M = 3, below the bound 2N ≤ M + 2: at k = 0 the right side is −4
  against â₀ = 6.

## Layer 3: the radix-2 fast Fourier transform

### 3.1 Bit reversal

Sources: [PPST, Lemma 5.1, p. 238]; [SB, (2.3.2.8), p. 85].

- **Bit reversal** (`bitReverse_lt_and_involutive`). For k < 2ᵗ, `bitReverse t k` < 2ᵗ and
  bit reversal is an involution there [PPST, Lemma 5.1, p. 238].

*Needs:* `Nat.testBit`.

**Checks.**

- t = 3: the sequence is 0, 4, 2, 6, 1, 5, 3, 7.
- t = 0: the only argument is 0, and `bitReverse 0 0` = 0.
- Negative control: the hypothesis k < 2ᵗ is needed; `bitReverse 1 2` = 0, so 2 is not
  recovered.

### 3.2 The radix-2 factorizations

Sources: [PPST, §5.2.3, (5.10), p. 244, Corollary 5.7 and the transposed factorizations,
pp. 246–247]; [SB, (2.3.2.4)–(2.3.2.5), pp. 82–83].

The factors of size N = 2ᵗ are the bit-reversal permutation R (`bitReversalMatrix`), the
butterfly Bₙ = Id(N/2ⁿ) ⊗ F₂ ⊗ Id(2ⁿ⁻¹) (`butterflyMatrix`) and the twiddle factor
Tₙ = Id(N/2ⁿ) ⊗ diag(Id(2ⁿ⁻¹), Wₙ) with Wₙ = diag(exp(−2πi r/2ⁿ)), r < 2ⁿ⁻¹
(`twiddleMatrix`), for 1 ≤ n ≤ t, each given by an entry formula in binary arithmetic.

- **Sande–Tukey and Cooley–Tukey**
  (`dftMatrix_eq_prod_sandeTukeyFactors_and_cooleyTukeyFactors`). F(N) = R T₁ B₁ T₂ B₂ ⋯ Tₜ Bₜ
  (`sandeTukeyFactors`) [PPST, (5.10), p. 244], and its transpose
  F(N) = Bₜ Tₜ ⋯ B₁ T₁ R (`cooleyTukeyFactors`), the transpose of (5.10) [PPST, p. 246].
  Route: induction on t through
  §2.1 with N₁ = 2ᵗ⁻¹, N₂ = 2, and the identification of the iterated even–odd sorts with R.

*Needs:* 2.1, 3.1.

**Checks.**

- t = 0: both products are the 1 × 1 matrix (1).
- t = 1: R₂ = T₁ = I and B₁ = F₂, so F₂ = B₁.
- t = 3, a = (1, …, 8): the stages B₃, T₃, B₂, T₂, B₁, T₁ give (36, −4, −4 + 4i, −4 − 4i,
  −4 + 9.6569 i, −4 − 1.6569 i, −4 + 1.6569 i, −4 − 9.6569 i), and R reorders it to F₈ a = (36,
  −4 + 9.6569 i, −4 + 4i, −4 + 1.6569 i, −4, −4 − 1.6569 i, −4 − 4i, −4 − 9.6569 i).
- Negative control: without R the Sande–Tukey product at t = 2 differs from F₄ (rows 1 and 2
  exchanged).

## Layer 4: arithmetic cost

### 4.1 The cost model

Sources: [PPST, §5.2.5, Remark 5.10 and the counting rules, pp. 250–251].

The cost of a factor is `mulVecCost`: in each row, `constMulCost` of each nonzero entry and two
real additions for each complex addition, one fewer than the nonzero entries of the row. The cost
of a factorization is the sum over its factors (`factorizationCost`). The counting rules of
Plonka et al. charge nothing for ±1 and ±i, (2, 2) for (±1 ± i)/√2 and (3, 3) for a general
constant; `constMulCost` is the same rule.

**Checks.**

- `constMulCost 1` = (0, 0), and for c = exp(−πi/4), c⁴ = −1 gives (2, 2); c = exp(−πi/8)
  costs (3, 3).
- The dense matrix F(N), applied as one factor, costs (0, 24) at N = 4, (32, 144) at N = 8 and
  (320, 800) at N = 16.
- Negative control: charging one complex addition for every nonzero entry of a row, instead of
  one fewer, gives (0, 32) for the dense F₄ and (0, 16) for F₂ ⊗ I₂ at N = 4, against (0, 24) and
  (0, 8).

### 4.2 The cost of the radix-2 FFT

Sources: [PPST, (5.12)–(5.13), p. 251, and Example 5.11, (5.17)–(5.18) and Theorem 5.12,
p. 253].

- **Radix-2 cost** (`factorizationCost_sandeTukey_and_cooleyTukey`). For t ≥ 2 both
  factorizations of §3.2 cost (3/2) N t − 5N + 8 real multiplications and (7/2) N t − 5N + 8 real
  additions, N = 2ᵗ [PPST, (5.17)–(5.18), p. 253]. The statement is in ℤ, where the subtraction
  does not truncate. Theorem 5.12 of Plonka et al. states the sum of the two counts for every
  t ∈ ℕ, but their recursion starts at μ(2) = 0, and at t = 1 their own counts μ(1) = 0,
  α(1) = 4 (p. 251) differ from the formulas.

*Needs:* 3.2, 4.1.

**Checks.**

- The costs (multiplications, additions) are (0, 16), (4, 52), (24, 152), (88, 408), (264, 1032),
  (712, 2504) and (1800, 5896) for t = 2, …, 8, each equal to the formula.
- Negative control: at t = 1 the count is (0, 4) and the formula gives (1, 5); the hypothesis
  t ≥ 2 is needed.
- At N = 16 the FFT costs (24, 152) against (320, 800) for the dense matrix.

## Layer 5: aliasing and trigonometric interpolation

### 5.1 Aliasing

Sources: [PPST, §3.1, Theorem 3.3, (3.6), and Corollary 3.4, (3.7), pp. 111–112]; [CHQZ,
(2.1.36), p. 50].

- **Aliasing** (`hasSum_sampleDFT_and_norm_sub_le`). If f is continuous and its Fourier
  coefficients are absolutely summable, then the trapezoidal value `sampleDFT N f k`, the sum
  N⁻¹ Σⱼ f(2πj/N) wʲᵏ over j < N, is the sum of c(f, k + lN) over l ∈ ℤ, and its distance to
  cₖ(f) is at most the sum of |c(f, k + lN)| over l ≠ 0 [PPST, Theorem 3.3 and Corollary 3.4,
  pp. 111–112]. Plonka et al. state the bound for −N/2 ≤ k < N/2; it holds for every k. No
  periodicity hypothesis is needed: a continuous function on [0, 2π] with summable coefficients
  agrees with its Fourier series there.
- **Band-limited data** (`sampleDFT_eq_of_band`). If cₙ(f) = 0 for 2|n| ≥ N, then
  `sampleDFT N f k` = cₖ(f) for 2|k| < N. Route: the aliasing formula, since 2|k + lN| > N for
  l ≠ 0.

*Needs:* `fourierCoeffOn`; the uniform convergence of an absolutely convergent Fourier series.

**Checks.**

- N = 1: `sampleDFT 1 f k` = f(0) = Σₙ cₙ(f) for every k.
- For c₀ = 1 and cₖ = 1/(1 + k²) + i/(2(1 + |k|³)) for 0 < |k| ≤ 200, N = 4 and k = 2: the
  trapezoidal value and the alias sum are both 0.5126 + 0.1176 i, and its distance 0.3187 to
  c₂ = 0.2 + 0.0556 i is below the bound 0.3204.
- Negative control: for a trigonometric polynomial of degree 3 and N = 6 the value at k = 3 is
  c₃ + c₋₃, not c₃; the strict inequality 2|k| < N is needed.

### 5.2 Trigonometric interpolation

Sources: [CHQZ, (2.1.25) and (2.1.28), p. 48]; [K, §11.3, p. 204]; [SB, Theorems (2.3.1.5)
and (2.3.1.9), pp. 76–77].

- **Interpolation** (`trigInterp_interpolates_and_unique`). For N ≥ 1, the interpolant
  `trigInterp N u` with coefficients ũₖ = (2N)⁻¹ Σⱼ u(xⱼ) exp(−ikxⱼ) over j < 2N, xⱼ = πj/N, on the
  band −N ≤ k < N, interpolates u at the 2N nodes, and it is the only trigonometric polynomial on
  the band that does [CHQZ, (2.1.25), (2.1.28), p. 48]. Route: the coefficients are
  (2N)⁻¹ times `ZMod.dft` of length 2N of the samples, reindexed to the band, and Layer 1 inverts
  it.

*Needs:* 1.1.

**Checks.**

- N = 1: the nodes are 0 and π, the band is {−1, 0}, and the interpolant of u is
  (u(0) + u(π))/2 + (u(0) − u(π))/2 · exp(−ix).
- u = exp(sin x) + |sin x|³, N = 2: ũ₋₂ = −0.7715, ũ₋₁ = 0.5876 i, ũ₀ = 1.7715,
  ũ₁ = −0.5876 i, and the interpolant takes the values 1, e + 1, 1, e⁻¹ + 1 of u at 0, π/2, π,
  3π/2; at π/4 it is 2.6025 + 0.7715 i against u(π/4) = 2.3817.
- Negative control: the symmetric band −N ≤ k ≤ N has 2N + 1 coefficients for 2N nodes, and
  uniqueness fails (exp(iNx) − exp(−iNx) vanishes at every node).

### 5.3 Error in the periodic Sobolev norms

Sources: [CHQZ, §5.1, (5.1.7), p. 269, (5.1.9)–(5.1.10), p. 270, (5.1.16) and (5.1.19),
p. 272]; [STW, Theorems 2.1 and 2.3, pp. 34 and 36]; [K, Theorem 11.8, p. 209].

- **The seminorm on the physical side** (`fourierSobolevSeminorm_sq_eq_integral`). For a
  2π-periodic u of class Cᵐ, |u|ₘ² is (2π)⁻¹ times the integral of |u⁽ᵐ⁾|² over [0, 2π]. Route:
  cₖ(u⁽ᵐ⁾) = (ik)ᵐ cₖ(u) by `fourierCoeffOn_of_hasDerivAt` m times, then Parseval,
  `hasSum_sq_fourierCoeffOn`.
- **Comparison with the Sobolev space on the circle**
  (`fourierSobolevNorm_comparable_circleSobolev`). ‖u‖ₗ is finite exactly when the coefficients
  of u form an element a of `TauCeti.CircleSobolev` of order l, and then ‖u‖ₗ ≤ √2 ‖a‖ and
  ‖a‖ ≤ 2ˡ ‖u‖ₗ. Route: termwise, 1 + |k|²ˡ ≤ 2 (1 + |k|)²ˡ and (1 + |k|)²ˡ ≤ 2²ˡ⁻¹ (1 + |k|²ˡ) by
  convexity, with `TauCeti.CircleSobolev.norm_sq_eq_tsum`.
- **Truncation and interpolation error** (`fourierSobolevNorm_trunc_add_interp_le`). For
  1 ≤ m and l ≤ m there is C such that, for every continuous u and N ≥ 1,
  ‖u − P(N)u‖ₗ + ‖u − I(N)u‖ₗ ≤ C Nˡ⁻ᵐ |u|ₘ, with P(N) the truncation `fourierTrunc` and
  I(N) the interpolant [CHQZ, (5.1.10), p. 270, and (5.1.19), p. 272], [STW, Theorems 2.1 and 2.3,
  pp. 34 and 36]. Route: the coefficients of I(N)u are ũₖ = Σᵣ c(u, k + 2Nr) by the aliasing
  formula; every frequency outside the band and every alias k + 2Nr, r ≠ 0, has modulus at least
  N; Cauchy–Schwarz against Σᵣ |k + 2Nr|⁻²ᵐ. When |u|ₘ = ∞ the bound is trivial, and when it
  is finite with m ≥ 1 the coefficients are summable.

*Needs:* 5.1, 5.2; Parseval on [0, 2π]; Tau Ceti's `TauCeti.CircleSobolev`.

**Checks.**

- u = 1 + exp(ix): |u|ₘ = 1 for every m ≥ 1, ‖u‖₀ = 2 and ‖u‖ₗ = √3 for l ≥ 1; the weight at k = 0
  is 1 + 0²ˡ, which is 2 at l = 0 by 0⁰ = 1. A reader expecting ‖u‖₀ to be the normalized L²
  norm √2 is off by the factor √2.
- Comparison, u = 1 + exp(ix): at l = 0, ‖u‖₀ = 2 = √2 ‖a‖ with ‖a‖ = √2, so the constant √2
  is attained; at l = 1, ‖u‖₁ = √3 and ‖a‖ = √5 (weights 1 and 4). Negative control: without
  the factor 2ˡ the second inequality fails at l = 1, since √5 > √3.
- l = m: the bound says that P(N) and I(N) are bounded in the seminorm uniformly in N.
- m = 1 and cₖ = (1 + |k|) to the power −1.6 for every k ∈ ℤ, with no cut-off: the ratio of the
  left side to Nˡ⁻ᵐ |u|ₘ lies between 1.09 and 1.35 for l = 0 and between 1.69 and 2.25 for
  l = 1, N = 1, …, 32. At N = 1 and l = 0, ‖u − P(1)u‖₀ = 0.670, ‖u − I(1)u‖₀ = 2.343 and
  |u|₁ = 2.748, so the ratio is 1.096.
- Negative control: the rate cannot be improved. For u = exp(iNx), frequency N lies outside the
  band, P(N)u = 0, |u|ₘ = Nᵐ and ‖u − P(N)u‖ₗ = √(1 + N²ˡ) ≥ Nˡ⁻ᵐ |u|ₘ.

## Layer 6: nonequispaced fast Fourier transforms

### 6.1 The centred cardinal B-spline

Sources: [PPST, §7.2, (7.29), p. 388, and the Fourier transform of M₂ₘ, p. 389].

- **B-spline** (`centredBSpline_nonneg_support_fourier`). Mₙ₊₁ is nonnegative, vanishes for
  |x| > (n + 1)/2, and the integral of Mₙ₊₁(x) exp(−ixω) over ℝ is sinc(ω/2)ⁿ⁺¹ [PPST, p. 389].
  Route: the convolution theorem for the Fourier integral and the transform sinc(ω/2) of M₁.

*Needs:* `MeasureTheory.convolution`; the Fourier integral of a convolution.

**Checks.**

- M₁(0.3) = 1, M₂(0) = 1, M₄(0) = 2/3.
- Order 4, ω = 3: the integral of M₄(x) exp(−3ix) is 0.19556 = sinc(1.5)⁴; order 2, ω = 7.5:
  0.023231 = sinc(3.75)².
- Negative control: sinc(ω)ⁿ⁺¹ (without the half) is wrong; at order 1 and ω = π the integral
  is 2/π and sinc(π) = 0.

### 6.2 The window method

Sources: [PPST, §7.1, (7.1)–(7.11), pp. 377–379, and §7.2, (7.24)–(7.25), pp. 385–386].

For a 2π-periodic window w and n' grid points, the coefficients
gₗ = n'⁻¹ Σₖ f̂ₖ / cₖ(w) · exp(2πikl/n'), over the band −n ≤ k < n (`nfftCoeffs`), define
s(x) = Σₗ gₗ w(x − 2πl/n') over l < n' (`nfftApprox`), the approximation of the trigonometric
polynomial f(x) = Σₖ f̂ₖ exp(ikx) over the same band (`bandTrigPoly`). The grid index runs over
0, …, n' − 1; by periodicity this is the centred index set of Plonka et al.

- **Aliasing error of the window method** (`norm_sub_nfftApprox_le`). If w is continuous and
  2π-periodic with absolutely summable Fourier coefficients that do not vanish on the band, and
  n' ≥ 1, then |f(x) − s(x)| ≤ Σₖ |f̂ₖ| Σᵣ |c(w, k + rn')| / |cₖ(w)|, with r ≠ 0 in the inner sum
  [PPST, (7.25), p. 386]. Route: expand w in its Fourier series; the sum over l selects the
  frequencies k + rn'. No oversampling hypothesis is needed for this identity.

*Needs:* 5.1.

**Checks.**

- n = 0: the band is empty and both sides are 0.
- w = the Dirichlet kernel of the band with n' = 2n: c(w, k + rn') = 0 for r ≠ 0 and the window
  method is exact.
- Negative control: at n' = 0 the approximation s is 0, while the inner sum over r ≠ 0 of 1 is
  not summable and takes the junk value 0, so the bound would claim f = 0; the hypothesis
  n' ≥ 1 is needed.

### 6.3 The B-spline window

Sources: [PPST, §7.2, (7.29), p. 388, (7.30)–(7.31) and Lemma 7.6, (7.32)–(7.34),
pp. 389–390].

The window is φ(x) = M₂ₘ(n'x/(2π)) (`bsplineWindow`), periodized as
φ̃(x) = Σᵣ φ(x + 2πr) (`periodize`).

- **Coefficients of the window** (`periodicCoeff_periodize_bsplineWindow`). For n' ≥ 1 and
  m ≥ 1, φ̃ is continuous and 2π-periodic, cₖ(φ̃) = n'⁻¹ sinc(kπ/n')²ᵐ, these are absolutely
  summable, and sinc(kπ/n')²ᵐ > 0 for |k| < n' [PPST, (7.30)–(7.31), pp. 389–390].
- **Error bound** (`norm_sub_nfftApprox_bspline_le`). For 2n ≤ n' and m ≥ 1,
  |f(x) − s(x)| ≤ 4 (n/(n' − n))²ᵐ Σₖ |f̂ₖ|, that is 4/(2σ − 1)²ᵐ ‖f̂‖₁ with the
  oversampling factor σ = n'/(2n) [PPST, Lemma 7.6, pp. 389–390]. Plonka et al. assume
  σ > 1 and 2m ≪ σN, so that the support of φ lies in [−π, π]; the proof uses only
  |k|/n' ≤ 1/2, so 2n ≤ n' suffices. Route: 6.2 with the
  ratio c(φ̃, k + rn')/cₖ(φ̃) = (u/(u + r))²ᵐ, u = k/n', and the sum of (u/(u + r))²ᵐ over
  r ≠ 0 is at most 4 (|u|/(1 − |u|))²ᵐ for |u| ≤ 1/2. The proof of Plonka et al. reaches the factor
  2 (1 + (1 − |u|)/(2m − 1)) ≤ 4m/(2m − 1) before it weakens it to the 4 of their statement
  (7.32) [PPST, pp. 389–390]; the target keeps the constant 4 of the statement.
- **Locality** (`card_bsplineWindow_ne_zero_le`). For each x at most 2m + 1 of the n' terms of
  s(x) are nonzero [PPST, §7.1, p. 380]. Route: φ vanishes outside |x| ≤ 2πm/n', an interval
  that meets at most 2m + 1 grid translates.

By locality, s(x) is evaluated in O(m) operations after one FFT of length n'.

*Needs:* 6.1, 6.2.

**Checks.**

- In the next three Checks f̂ₖ = 1 on the band and x = 0.3.
- n = 4, n' = 16, m = 2 (σ = 2): the error is 1.76 · 10⁻³ ‖f̂‖₁, against the bound
  4/81 ≈ 4.94 · 10⁻².
- σ = 1 (n = 4, n' = 8, m = 1): the error 0.117 ‖f̂‖₁ is below the bound 4.
- n = 1, n' = 2, m = 2, where 2m > n': the error 0.507 ‖f̂‖₁ is below the bound 4.
- Locality, n' = 16, m = 2, x = 0.3: the nonzero terms are those of l = 15, 0, 1, 2, four of the
  at most 2m + 1 = 5.
- The ratio of the sum of (u/(u + r))²ᵐ over r ≠ 0 to 4 (u/(1 − u))²ᵐ is at most 0.83 for
  u ∈ (0, 1/2] and m = 1, …, 6.
- n' = 16, m = 2, k = 3: the integral defining c₃(φ̃) and the closed form 16⁻¹ sinc(3π/16)⁴ are
  both 0.049457.
- Negative control: at k = n' the coefficient sinc(π)²ᵐ = 0, so the band must stay inside
  |k| < n'.

### 6.4 The adjoint transform

Sources: [PPST, §7.1, Algorithm 7.3, p. 382, and (7.18)–(7.23), pp. 383–384].

For nodes xⱼ and data fⱼ, j < J, the adjoint approximates h(k) = Σⱼ fⱼ exp(ikxⱼ) on the band
by h̃(k) = c̃ₖ / cₖ(w), where g̃ₗ = Σⱼ fⱼ w(xⱼ − 2πl/n') and c̃ₖ = n'⁻¹ Σₗ g̃ₗ exp(2πikl/n')
(`nfftAdjointApprox`).

- **Adjoint error bound** (`norm_sub_nfftAdjointApprox_bspline_le`). For 2n ≤ n', m ≥ 1 and k
  in the band, |h(k) − h̃(k)| ≤ 4 (n/(n' − n))²ᵐ Σⱼ |fⱼ|. Route: the same expansion as 6.2 gives
  h̃(k) − h(k) = Σⱼ fⱼ Σᵣ (c(w, k + rn')/cₖ(w)) exp(i(k + rn')xⱼ), with r ≠ 0, and the estimate
  of 6.3.

*Needs:* 6.3.

**Checks.**

- J = 0: both sides are 0.
- Nodes 0.3, 1.0, 2.5 and fⱼ = 1: for n = 4, n' = 16, m = 2 the largest error over the band,
  at k = −4, is 8.12 · 10⁻³ Σⱼ |fⱼ|, below 4/81; for σ = 1, n = 3, n' = 6, m = 1 it is
  0.654 Σⱼ |fⱼ|, at k = −3, below 4.

The operation count of the transform and its adjoint, O(n' log n' + mJ), stays in prose [PPST,
Algorithm 7.1, pp. 380–381]. The adjoint sums h(k) carry the sign exp(+ikxⱼ) of [PPST, (7.15),
p. 381].

## Layer 7: exponential sums

### 7.1 Prony's method

Sources: [PPST, §10.1, (10.1)–(10.9) and Algorithm 10.1, pp. 523–526].

- **Prony** (`prony`). For distinct nodes zⱼ and nonzero weights cⱼ, j < M, the M × M Hankel matrix
  (h(k + l)) factors as V diag(c) Vᵀ with V the matrix with entry zₖʲ in row j and column k, it is
  invertible, the linear system Σₖ pₖ h(k + l) = −h(M + l) has exactly one solution, every
  solution gives the Prony polynomial Xᴹ + Σₖ pₖ Xᵏ = Πⱼ (X − zⱼ), and c is the unique solution
  of V c = (h(0), …, h(M − 1)) [PPST, §10.1, (10.1)–(10.9), pp. 523–526].
- **Uniqueness of the parameters** (`exists_perm_eq_of_expSum_eq`). An exponential sum
  Σⱼ cⱼ exp(φⱼ x) with M distinct exponents of imaginary part in [−π, π) and nonzero
  coefficients is determined up to relabelling by its values at x = 0, 1, …, 2M − 1 [PPST, §10.1,
  pp. 523–526]. Route: Prony at zⱼ = exp(φⱼ), which are distinct by the strip condition.

*Needs:* `Matrix.vandermonde`, `Matrix.det_vandermonde_ne_zero_iff`.

**Checks.**

- M = 1: h(k) = c zᵏ, H = (c), p₀ = −h(1)/h(0) = −z, and the Prony polynomial is X − z.
- M = 2, z = (1, 2), c = (1, 1): h = (2, 3, 5, 9), H = [[2, 3], [3, 5]] with det H = 1, the
  system gives p = (2, −3), and X² − 3X + 2 = (X − 1)(X − 2).
- Negative control: φ = 0 and φ = 2πi give the same samples; the strip condition is needed.

### 7.2 Hankel ranks and the matrix pencil

Sources: [PPST, §10.2, Lemma 10.6, p. 531, Lemma 10.9 and (10.23), pp. 536–537].

- **Rank** (`rank_trajectoryHankel`). For distinct nodes, nonzero weights and M ≤ L, the
  L × (N − L + 1) matrix (h(l + m)) has rank M when L + M ≤ N + 1, and the L × (N − L) matrices
  H(s) = (h(s + l + m)), s ∈ {0, 1}, have rank M when L + M ≤ N, for s = 1 provided the nodes are
  nonzero [PPST, Lemma 10.6, p. 531]. A zero node is allowed in the other two cases; Plonka et
  al. take the nodes on the unit circle.
- **Companion relation** (`hankel_mul_companionMatrix`). For L + M ≤ N,
  H(0) C(q) = H(1), with C(q) the companion matrix (`companionMatrix`) of
  q = Xᴺ⁻ᴸ⁻ᴹ Πⱼ (X − zⱼ), and every node is an eigenvalue of the pencil
  z H(0) − H(1) [PPST, Lemma 10.9, p. 536]. That every node is an eigenvalue has content only
  for L + M = N (see below); for L + M = N, M ≤ L, distinct nodes and nonzero weights the
  statement adds that the eigenvalues of the pencil are exactly the nodes. Route for this last
  conjunct: H(s) = V diag(c) diag(zˢ) W
  with V the L × M matrix of entries zⱼˡ, injective since M ≤ L, and W the invertible M × M
  Vandermonde matrix of entries zⱼᵐ, so that ζ H(0) v = H(1) v exactly when
  (ζ − zⱼ)(W v)ⱼ = 0 for every j.
- **Square pencil** (`det_smul_hankel_sub_hankel`). For the M × M matrices,
  det(ζ H(0) − H(1)) = det H(0) · Πⱼ (ζ − zⱼ), for all nodes and weights. Route:
  H(s) = V diag(c) diag(zˢ) Vᵀ.

With distinct nodes and nonzero weights det H(0) ≠ 0 by §7.1, so the eigenvalues of the square
pencil are exactly the nodes.

In the rectangular case L + M < N the pencil z H(0) − H(1) has the common kernel of H(0) and
H(1), of dimension N − L − M, so every z ∈ ℂ is an eigenvalue in the sense of a nonzero kernel;
the nodes are singled out only after the kernel is split off, which is the content of the ESPRIT
reduction left to Beyond. Misprint: the proof of Lemma 10.9 [PPST, p. 537] gives L − M
independent eigenvectors for the eigenvalue 0; the kernel of the L × (N − L) matrix of rank M has
dimension N − L − M, as the statement of the lemma on p. 536 has it.

*Needs:* 7.1; `Matrix.rank`.

**Checks.**

- M = 2, N = 6: the L × (N − L + 1) matrices have rank 2 for L = 2, …, 5, and the L × (N − L)
  matrices for L = 2, 3, 4.
- The kernel of H(1) has dimension N − L − M = 2, 1, 0 for M = 2, N = 6, L = 2, 3, 4, and a
  random ζ has pencil nullity equal to the same number.
- With the nodes 0, 1.5 and −0.7 and N = 6, 7, 8, the L × (N − L + 1) matrices and H(0) keep
  rank 3.
- Negative control: with a zero node, z₁ = 0, the matrix H(1) loses rank (rank 2 in the same
  example); at M = 1 it is the zero matrix.
- L + M = N, nodes 0 and 1.5, L = 3: the pencil is singular at ζ = 0 and ζ = 1.5 (nullity 1) and
  regular at ζ = 1 and ζ = 0.3 + 0.1 i. Negative control: for L = 2 < M = 3 and N = 5 the matrix
  H(0) is 2 × 3 and every ζ is an eigenvalue; the hypothesis M ≤ L is needed.

## Downstream consumers

- Spectral methods for periodic problems use the interpolation error of §5.3 and the
  aliasing formula of §5.1; their cost estimates use Layer 4.
- Fast summation and the inversion of nonequispaced transforms use Layer 6.
- Parameter estimation for exponential sums and signal processing use Layer 7.

## Scope and ownership

The roadmap is complete when Tau Ceti proves every statement of `Suggested.lean` and the prose
targets of the layers above.

Inputs:
- [SamplingAndDiscreteFourierAnalysis][SDFA]: the Fourier matrix (2.1), the convolution theorem
  (1.2) and the diagonalization of circulants (2.1); its Parseval identity (1.1) is compared with
  §1.1, not consumed.
- Mathlib's discrete Fourier transform on `ZMod N`, its inverse, the orthogonality of
  characters, circulant and Kronecker matrices, the Chinese remainder theorem, Fourier
  coefficients on an interval, convolution of functions on ℝ, and Vandermonde determinants.
- Tau Ceti's Sobolev space on the circle, `TauCeti.CircleSobolev`, compared in §5.3.

Owned here:
- the unitarity of the Fourier matrix with all its conjuncts, the product formula, the shift
  relation, circulants as polynomials in the shift and their eigenvectors as vectors;
- the Cooley–Tukey, prime-factor, Rader and Bluestein reductions;
- bit reversal, the radix-2 Sande–Tukey and Cooley–Tukey factorizations, the cost model and the
  exact cost of the radix-2 FFT;
- the aliasing formula for the trapezoidal Fourier coefficients, trigonometric interpolation on
  the band, and the truncation and interpolation errors in the periodic Sobolev norms;
- the centred cardinal B-spline, the window method with a general window and with the B-spline
  window, its locality and the adjoint;
- Prony's method, uniqueness of exponential sums, the Hankel ranks and the matrix pencil.

Not owned:
- the discrete Fourier transform, inversion, Parseval, the convolution theorem, the
  characteristic polynomial and algebra of circulants, Poisson summation and the sampling
  theorems (SamplingAndDiscreteFourierAnalysis);
- the trapezoidal rule for analytic periodic integrands (QuadratureRulesAndPeanoKernels §5.2);
  its zero-frequency case of §5.1 is proved here independently and nothing is consumed;
- B-splines on general knots defined by divided differences, which are a different object from
  the cardinal B-spline window here;
- trigonometric polynomials as a space for best approximation and Bernstein's inequality
  (PolynomialInterpolationAndBestApproximation), not used;
- the Fourier-coefficient Sobolev spaces on the circle of real order, their Hilbert structure,
  density of trigonometric polynomials and Rellich's theorem (Tau Ceti, `TauCeti.CircleSobolev`);
  §5.3 compares its norm with the one here and consumes nothing else.

Boundary in one sentence: this roadmap owns the computational theory of the discrete Fourier
transform (fast factorizations, operation counts, periodic interpolation error, nonequispaced
transforms and exponential-sum recovery), and the transform itself and its algebraic identities
stay with their owner.

## Exact supplier contracts

### From [SamplingAndDiscreteFourierAnalysis][SDFA]

- 2.1: the definition `dftMatrix`, copied verbatim; the identity
  dftMatrix N · circulant v = diagonal(v̂) · dftMatrix N, consumed in §1.2.
- 1.1: Σₖ conj(Φ̂ₖ) Ψ̂ₖ = N Σⱼ conj(Φⱼ) Ψⱼ, compared in §1.1.
- 1.2: the transform of a cyclic convolution is the product of the transforms, consumed in §1.2.

### From Tau Ceti

- `TauCeti.CircleSobolev` (the Sobolev space of order s on the circle, by Fourier coefficients,
  with squared norm Σₙ (1 + |n|)²ˢ ‖aₙ‖²) and `TauCeti.CircleSobolev.norm_sq_eq_tsum` (that
  formula for the squared norm), consumed in §5.3.

### From Mathlib

- `ZMod.dft`, `ZMod.dft_apply`, `ZMod.dft_apply_zero`, `ZMod.stdAddChar`, `ZMod.invDFT_apply`,
  `AddChar.sum_mulShift`, `DiscreteConvolution.addRingConvolution`, `Matrix.circulant`,
  `Matrix.kroneckerMap`,
  `Matrix.submatrix`, `Matrix.unitaryGroup`, `Matrix.inv_eq_left_inv`,
  `Module.End.HasEigenvector`, `ZMod.chineseRemainder`, `Nat.testBit`, `fourierCoeffOn`,
  `fourierCoeffOn_of_hasDerivAt`, `hasSum_sq_fourierCoeffOn`, `MeasureTheory.convolution`,
  `ContinuousLinearMap.lsmul`, `Real.sinc`, `Matrix.vandermonde`,
  `Matrix.det_vandermonde_ne_zero_iff`, `Matrix.rank`.

## Beyond this roadmap (a roadmap for a roadmap; do not implement)

No Tau Ceti roadmap owns these topics; each is material for a further roadmap built on this one.

- Radix-4 and split-radix algorithms and the lower operation counts they reach [PPST, §5.3.3,
  pp. 263–269].
- Numerical stability of the FFT in floating-point arithmetic [PPST, §5.5, p. 295].
- Multidimensional and sparse FFTs [PPST, §5.3.5, p. 276, and §5.4, p. 281].
- Multidimensional NFFTs, and the Gaussian and Kaiser–Bessel windows with their exponential error
  bounds [PPST, §7.2, Lemma 7.7, p. 390].
- The inverse nonequispaced transform and fast summation [PPST, §§7.3–7.6, pp. 394–410].
- ESPRIT and MUSIC with noisy data, and the conditioning of Vandermonde matrices with
  nonequispaced nodes [PPST, §10.2, p. 529, and §10.3, p. 542].

## Prior formalization

[lean-NASC](https://github.com/bjbraams/lean-NASC) at commit 8efdbf7 (Apache-2.0), by the
author of this roadmap, states several targets of this roadmap in `NASC/DiscreteFourier.lean` and
proves six without `sorry` (their axioms are only propext, Classical.choice and Quot.sound):

- §1.1: NASC.fourierMatrix_gram_mulVec, the conjunct Fᴴ F = N · 1;
- §1.2: NASC.dft_cyclicConvolution_and_mul, with its own cyclic convolution;
- §1.3: NASC.fourierMatrix_mul_circulant, the matrix form owned by the supplier;
- §5.2: NASC.existsUnique_trigonometricInterpolate;
- §7.1: NASC.prony_annihilator_unique and NASC.prony_exp_eq_up_to_reindexing.

The same module states, with `sorry`, a radix-2 recursion (§3.2, in recursive rather than
factored form), aliasing (§5.1) and the Shannon sum owned by the supplier.

## References

- [PPST] G. Plonka, D. Potts, G. Steidl, M. Tasche, *Numerical Fourier Analysis*, Applied and
  Numerical Harmonic Analysis, Birkhäuser, 2018, Chapters 3, 5, 7, 10.
- [SB] J. Stoer, R. Bulirsch, *Introduction to Numerical Analysis*, 3rd ed., Texts in Applied
  Mathematics 12, Springer, 2002, §§2.3.1–2.3.2.
- [I] A. Iserles, *A First Course in the Numerical Analysis of Differential Equations*, 2nd ed.,
  Cambridge University Press, 2008, §10.3.
- [CHQZ] C. Canuto, M. Y. Hussaini, A. Quarteroni, T. A. Zang, *Spectral Methods: Fundamentals in
  Single Domains*, Springer, 2006, §§2.1, 5.1.
- [STW] J. Shen, T. Tang, L.-L. Wang, *Spectral Methods: Algorithms, Analysis and Applications*,
  Springer Series in Computational Mathematics 41, Springer, 2011, §2.2.
- [K] R. Kress, *Linear Integral Equations*, 3rd ed., Applied Mathematical Sciences 82,
  Springer, 2014, §11.3.

[SDFA]: ../SamplingAndDiscreteFourierAnalysis/README.md
