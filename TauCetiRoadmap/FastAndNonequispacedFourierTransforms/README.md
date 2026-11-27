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
Layer 1 and the supplier's convolution theorem. Layer 3 (radix-2) is a specialization of the
splitting of §2.1 carried out to the end, and Layer 4 (cost) counts the factors of Layer 3.
Layer 5 (aliasing and interpolation) is analytic and uses only the definition of the transform
and Fourier coefficients on [0, 2π]. Layer 6 (the window method) uses Layer 5. Layer 7
(exponential sums) is linear algebra on the samples and is independent of Layers 2–6.

## Conventions

- A vector of length N is a function `ZMod N → ℂ`, with `[NeZero N]`. The discrete Fourier
  transform is Mathlib's `ZMod.dft`, â_k = Σ_j a_j w_N^{jk} with w_N = exp(−2πi/N) and no
  normalizing factor; its kernel is `ZMod.stdAddChar`. The Fourier matrix is the local copy
  `dftMatrix N` of the supplier's definition, with w_N^{jk} in row k and column j. The inverse
  transform is Mathlib's `ZMod.invDFT_apply`, and the orthogonality of the characters is
  `AddChar.sum_mulShift`; both are library facts and no target here.
- Cyclic convolution is Mathlib's `DiscreteConvolution.addRingConvolution`, notation `⋆ᵣ₊`,
  (a ⋆ b)(x) = Σ_{y + z = x} a(y) b(z). A circulant matrix is Mathlib's `Matrix.circulant`, with
  entry v(i − j); the cyclic forward shift V is `circulant (Pi.single 1 1)`, so that
  (V a)(i) = a(i − 1). Kronecker products are Mathlib's `Matrix.kroneckerMap`, notation `⊗ₖ`,
  with pairs of indices ordered (major, minor).
- A fast algorithm is a factorization F_N = A₁ A₂ ⋯ A_r of the Fourier matrix, possibly after a
  reindexing of rows and columns by explicit bijections (`Matrix.submatrix`). Its arithmetic cost
  is a natural-number function of the factor list, `factorizationCost`, never a running time:
  each factor is applied as a sparse matrix-vector product, row by row over its nonzero entries,
  and a complex multiplication by a constant c costs nothing for c ∈ {±1, ±i}, 2 real
  multiplications and 2 real additions for a primitive eighth root of unity, and 3 and 3
  otherwise (`constMulCost`). This is the counting rule of Plonka et al. in matrix form.
- Bit reversal `bitReverse t k` reverses the t binary digits of k < 2^t, read with
  `Nat.testBit`.
- A 2π-periodic function is a function `u : ℝ → ℂ`; its Fourier coefficients are
  `periodicCoeff u k`, Mathlib's `fourierCoeffOn` on [0, 2π]. The samples are taken at 2πj/N,
  j < N, for the aliasing formula and at πj/N, j < 2N, for the interpolant of Canuto et al. on
  the band −N ≤ k < N (`band`). Quantities that may be infinite, the periodic Sobolev seminorm
  `fourierSobolevSeminorm` and norm `fourierSobolevNorm`, take values in ℝ≥0∞ and are defined on
  the Fourier side, so they are meaningful for every u. The norm has the weights 1 + |k|^{2l} of
  Canuto et al., with 0⁰ = 1, so that ‖u‖₀ is √2 times the L² norm normalized by (2π)⁻¹.
- The centred cardinal B-spline `centredBSpline n` is M_{n+1}, of order n + 1: M₁ is the
  indicator of [−1/2, 1/2) and M_{n+2} = M_{n+1} ∗ M₁ is Mathlib's `MeasureTheory.convolution`
  with `ContinuousLinearMap.lsmul`. It is the window of the nonequispaced transform. The
  B-splines on general knots defined by divided differences are a different object and are not
  used.
- The sinc function is Mathlib's `Real.sinc`, sin x / x.
- Exponential sums have nodes z_j ∈ ℂ and weights c_j, samples h(k) = Σ_j c_j z_j^k. The
  Vandermonde matrix is Mathlib's `Matrix.vandermonde` and rank is `Matrix.rank`.

## Layer 1: the Fourier matrix

### 1.1 Unitarity

Sources: [PPST, §3.2, (3.28), pp. 119–120, and Theorem 3.16, (3.31), p. 124]; [I, Lemma 10.2,
p. 215].

- **Unitarity** (`dftMatrix_unitary`). The Fourier matrix is symmetric, Fᴴ F = F Fᴴ = N · 1, its
  inverse is N⁻¹ Fᴴ, and N^{−1/2} F lies in `Matrix.unitaryGroup` [PPST, (3.28), pp. 119–120,
  and Theorem 3.16, p. 124]. Route: the supplier notes Fᴴ F = N · 1 in the prose of its 2.1, as a
  consequence of its Parseval identity 1.1; directly, the entries are w_N^{(j−k)l} summed over l,
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

- **Product formula** (`dft_mul_eq_addRingConvolution`). N · (a b)^ = â ⋆ b̂ for pointwise
  products [PPST, Theorem 3.26, property 5, p. 134]. Route: the dual of the supplier's
  convolution theorem; expand both sides and use the orthogonality of the characters.
- **Shift relation** (`dftMatrix_mul_shift`). F V = diag(w_N^k) F [PPST, (3.43), p. 133], where
  diag(w_N^k) is the modulation matrix. Route: the supplier's diagonalization of circulants (its
  2.1) at v = δ₁, whose transform is k ↦ w_N^k.

*Needs:* 1.1; the supplier's 1.2 and 2.1.

**Checks.**

- N = 2, a = b = (1, 0): (a b)^ = (1, 1) and â ⋆ b̂ = (2, 2) = 2 · (1, 1).
- Negative control: without the factor N the product formula fails at the same data, (1, 1)
  against (2, 2).
- N = 3, a = (0, 1, 0): V a = (0, 0, 1), and (V a)^ = (1, w², w⁴) = diag(1, w, w²) â with
  w = w₃.

### 1.3 Circulant matrices

Sources: [PPST, §3.3, Corollary 3.33, (3.48), pp. 138–139, and (3.50), p. 139].

- **Circulants are polynomials in the shift** (`circulant_eq_sum_smul_shift_pow`).
  circ a = Σ_k a_k V^k, k = 0, …, N − 1 [PPST, (3.50), p. 139]. Route: (V^m)_{ij} = 1 iff
  i − j = m, by induction on m.
- **Eigenvectors** (`hasEigenvector_circulant`). The character j ↦ w_N^{−jk}, the k-th column of
  Fᴴ, is an eigenvector of circ a with eigenvalue â_k, in the sense of
  `Module.End.HasEigenvector` [PPST, Corollary 3.33, (3.48), pp. 138–139]. Route: the supplier's
  2.1 multiplied on the right by Fᴴ, with Fᴴ F = N · 1 from §1.1; or one reindexing of the sum,
  (circ a v)_i = w_N^{−ik} Σ_m a_m w_N^{mk}.

The supplier's 2.1 is the matrix form of the same fact and mentions the eigenvector columns in
its prose; the vector form is stated here. Its 2.2 and 2.4 (the characteristic polynomial and the
algebra of circulants) are not restated here.

*Needs:* 1.2.

**Checks.**

- N = 2, a = (1, 2): circ a = [[1, 2], [2, 1]], eigenvectors (1, 1) and (1, −1), eigenvalues 3
  and −1 = â₀ and â₁.
- N = 1: circ a = (a₀) = a₀ V⁰.
- Negative control: the column k of F itself, j ↦ w_N^{jk}, is the eigenvector for â_{−k}, not
  â_k; at N = 3, a = (0, 1, 0) the two eigenvalues are w and w² and differ.

## Layer 2: index maps

### 2.1 The Cooley–Tukey splitting

Sources: [PPST, §5.3.2, (5.24)–(5.27), Algorithm 5.16, pp. 256–259, and (5.30), p. 261];
[SB, §2.3.2, pp. 80–83].

- **Cooley–Tukey** (`dftMatrix_submatrix_cooleyTukey`). For N = N₁ N₂, the input map
  (j₂, j₁) ↦ j₁ + N₁ j₂ and the output map (k₂, k₁) ↦ N₂ k₁ + k₂ are bijections, and after
  these reindexings F_N = (I_{N₂} ⊗ F_{N₁}) D (F_{N₂} ⊗ I_{N₁}) with the diagonal of twiddle
  factors D(k₂, j₁) = w_N^{j₁ k₂} [PPST, (5.27), p. 258, and (5.30), p. 261].
- **Radix 2 in one step.** At N₁ = n, N₂ = 2 this is F_{2n} = Πᵀ (I₂ ⊗ F_n) D (F₂ ⊗ I_n) with
  Π the even–odd sort [PPST, (5.9), p. 243]; it is the prose corollary that Layer 3 iterates.

*Needs:* 1.1; `Matrix.kroneckerMap`.

**Checks.**

- N₁ = N₂ = 2: D = diag(1, 1, 1, −i) in the order (k₂, j₁) = (0,0), (0,1), (1,0), (1,1), and the
  product reproduces F₄; the radix-2 form was checked numerically for n = 1, 2, 4, 8.
- N₁ = 1 or N₂ = 1: D = 1 and the identity reduces to F_N = F_N.
- Negative control: with the twiddle factors omitted the identity fails already for N = 4.

### 2.2 The prime-factor splitting

Sources: [PPST, Theorem 5.13, p. 254], the Chinese remainder theorem behind the index maps; the
factorization itself is cited, not proved, in [PPST, §5.3.2, p. 262].

- **Good–Thomas** (`dftMatrix_submatrix_goodThomas`). For coprime N₁ and N₂, the input map
  (j₁, j₂) ↦ N₂ j₁ + N₁ j₂ mod N is a bijection, and with the inverse of
  `ZMod.chineseRemainder` on the output, F_N = F_{N₁} ⊗ F_{N₂} with no twiddle factors. Route:
  w_N^{K(N₂ j₁ + N₁ j₂)} = w_{N₁}^{K j₁} w_{N₂}^{K j₂}, and K ≡ k_i mod N_i.

*Needs:* 1.1; the Chinese remainder theorem.

**Checks.**

- N₁ = 2, N₂ = 3: the input map sends (j₁, j₂) to 3 j₁ + 2 j₂ mod 6, which takes the six values
  0, 2, 4, 3, 5, 1.
- Negative control: N₁ = 2, N₂ = 4 are not coprime, and the image of the input map has 4
  elements, not 8.

### 2.3 Rader's reduction

Sources: [PPST, §5.3.4, (5.35)–(5.43), pp. 271–273].

- **Rader** (`dft_rader`). For a prime p and a generator g of the units of `ZMod p`,
  â(g^v) = a₀ + (A ⋆ B)(v) for v in `ZMod (p - 1)`, with the cyclic convolution of length p − 1 of
  A(u) = a(g^{−u}) and B(u) = w_p^{g^u} [PPST, (5.38)–(5.40), pp. 271–272].

The remaining value â₀ = Σ_j a_j is Mathlib's `ZMod.dft_apply_zero`.

*Needs:* the cyclicity of the unit group of `ZMod p`.

**Checks.**

- p = 2, g = 1: â₁ = a₀ + a₁ · w₂ = a₀ − a₁.
- The identity was checked numerically for p = 3, 5, 7, 11, 13 with a primitive root.
- Negative control: p = 7 and g = 2, of order 3, give a wrong value; the hypothesis on the order
  of g is needed.

### 2.4 Bluestein's reduction

Sources: [PPST, §5.3.4, (5.44)–(5.45), Algorithm 5.21, pp. 274–275].

- **Chirp identity** (`dft_eq_chirp_mul_sum`). With the chirp χ(t) = exp(−πi t²/N) (`chirp`),
  â_k = χ(k) Σ_j a_j χ(j) conj χ(k − j) [PPST, (5.44), p. 274]. Route:
  2jk = j² + k² − (k − j)².
- **Bluestein** (`dft_eq_chirp_mul_addRingConvolution`). For M with 2N ≤ M + 2, the sum is the
  value at k < N of the cyclic convolution of length M of b(t) = a_t χ(t) (t < N, else 0) and
  h(t) = conj χ(t) for t < N, conj χ(M − t) for t > M − N, and 0 otherwise. Route: for t < N the
  wrapped index M + k − j lies in the second range, and the two ranges meet at most in
  t = N − 1 = M − t. Plonka et al. take M a power of two with 2N − 2 ≤ M < 4N, with the same
  overlap at N − 1 in their embedding (5.45) [PPST, pp. 274–275]; the identity needs only the
  lower bound.

*Needs:* 1.1.

**Checks.**

- N = 1: χ = 1 and both sides are a₀.
- The identity holds numerically for every M ≥ 2N − 2 and N ≤ 8.
- Negative control: M = 2N − 3 fails for every N from 2 to 8.

## Layer 3: the radix-2 fast Fourier transform

### 3.1 Bit reversal

Sources: [PPST, Lemma 5.1, p. 238]; [SB, (2.3.2.8), p. 85].

- **Bit reversal** (`bitReverse_lt_and_involutive`). For k < 2^t, `bitReverse t k` < 2^t and
  bit reversal is an involution there [PPST, Lemma 5.1, p. 238].

*Needs:* `Nat.testBit`.

**Checks.**

- t = 3: the sequence is 0, 4, 2, 6, 1, 5, 3, 7.
- t = 0: the only argument is 0, and `bitReverse 0 0` = 0.
- Negative control: the hypothesis k < 2^t is needed; `bitReverse 1 2` = 0, so 2 is not
  recovered.

### 3.2 The radix-2 factorizations

Sources: [PPST, §5.2.3, (5.10), p. 244, Corollary 5.7 and the transposed factorizations,
pp. 246–247]; [SB, (2.3.2.4)–(2.3.2.5), pp. 82–83].

The factors of size N = 2^t are the bit-reversal permutation R_N (`bitReversalMatrix`), the
butterfly B_n = I_{N/2^n} ⊗ F₂ ⊗ I_{2^{n−1}} (`butterflyMatrix`) and the twiddle factor
T_n = I_{N/2^n} ⊗ diag(I_{2^{n−1}}, W_{2^{n−1}}) with W_{2^{n−1}} = diag(w_{2^n}^r)
(`twiddleMatrix`), for 1 ≤ n ≤ t, each given by an entry formula in binary arithmetic.

- **Sande–Tukey and Cooley–Tukey**
  (`dftMatrix_eq_prod_sandeTukeyFactors_and_cooleyTukeyFactors`). F_N = R_N T₁ B₁ T₂ B₂ ⋯ T_t B_t
  (`sandeTukeyFactors`) [PPST, (5.10), p. 244], and its transpose
  F_N = B_t T_t ⋯ B₁ T₁ R_N (`cooleyTukeyFactors`), the transpose of (5.10) [PPST, p. 246].
  Route: induction on t through
  §2.1 with N₁ = 2^{t−1}, N₂ = 2, and the identification of the iterated even–odd sorts with R_N.

*Needs:* 2.1, 3.1.

**Checks.**

- t = 0: both products are the 1 × 1 matrix (1).
- t = 1: R₂ = T₁ = I and B₁ = F₂, so F₂ = B₁.
- Both identities were checked numerically for t = 0, …, 6, and the entry formula for B_n agrees
  with its Kronecker form.
- Negative control: without R_N the Sande–Tukey product at t = 2 differs from F₄ (rows 1 and 2
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
- The dense matrix F_N, applied as one factor, costs (0, 24) at N = 4, (32, 144) at N = 8 and
  (320, 800) at N = 16.
- Negative control: charging one complex addition for every nonzero entry of a row, instead of
  one fewer, gives (0, 32) for the dense F₄ and (0, 16) for F₂ ⊗ I₂ at N = 4, against (0, 24) and
  (0, 8).

### 4.2 The cost of the radix-2 FFT

Sources: [PPST, (5.12)–(5.13), p. 251, and Example 5.11, (5.17)–(5.18) and Theorem 5.12,
p. 253].

- **Radix-2 cost** (`factorizationCost_sandeTukey_and_cooleyTukey`). For t ≥ 2 both
  factorizations of §3.2 cost (3/2) N t − 5N + 8 real multiplications and (7/2) N t − 5N + 8 real
  additions, N = 2^t [PPST, (5.17)–(5.18), p. 253]. The statement is in ℤ, where the subtraction
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
  coefficients are absolutely summable, then the trapezoidal value `sampleDFT N f k`,
  N⁻¹ Σ_{j<N} f(2πj/N) w_N^{jk}, is the sum Σ_l c_{k+lN}(f), and its distance to c_k(f) is at most
  Σ_{l≠0} |c_{k+lN}(f)| [PPST, Theorem 3.3 and Corollary 3.4, pp. 111–112]. Plonka et al. state
  the bound for −N/2 ≤ k < N/2; it holds for every k. No periodicity hypothesis is needed: a
  continuous function on [0, 2π] with summable coefficients agrees with its Fourier series there.
- **Band-limited data** (`sampleDFT_eq_of_band`). If c_n(f) = 0 for 2|n| ≥ N, then
  `sampleDFT N f k` = c_k(f) for 2|k| < N. Route: the aliasing formula, since 2|k + lN| > N for
  l ≠ 0.

*Needs:* `fourierCoeffOn`; the uniform convergence of an absolutely convergent Fourier series.

**Checks.**

- N = 1: `sampleDFT 1 f k` = f(0) = Σ_n c_n(f) for every k.
- For c_k = 1/(1 + k²) + i/(2(1 + |k|³)) (k ≠ 0) truncated at |k| ≤ 200, the formula and the bound
  were checked for N = 1, 3, 4, 7 and k = −5, 0, 2, 9.
- Negative control: for a trigonometric polynomial of degree 3 and N = 6 the value at k = 3 is
  c₃ + c₋₃, not c₃; the strict inequality 2|k| < N is needed.

### 5.2 Trigonometric interpolation

Sources: [CHQZ, (2.1.25) and (2.1.28), p. 48]; [K, §11.3, p. 204]; [SB, Theorems (2.3.1.5)
and (2.3.1.9), pp. 76–77].

- **Interpolation** (`trigInterp_interpolates_and_unique`). For N ≥ 1, the interpolant
  `trigInterp N u` with coefficients ũ_k = (2N)⁻¹ Σ_{j<2N} u(x_j) e^{−ikx_j}, x_j = πj/N, on the
  band −N ≤ k < N, interpolates u at the 2N nodes, and it is the only trigonometric polynomial on
  the band that does [CHQZ, (2.1.25), (2.1.28), p. 48]. Route: the coefficients are
  (2N)⁻¹ times `ZMod.dft` of length 2N of the samples, reindexed to the band, and Layer 1 inverts
  it.

*Needs:* 1.1.

**Checks.**

- N = 1: the nodes are 0 and π, the band is {−1, 0}, and the interpolant of u is
  (u(0) + u(π))/2 + (u(0) − u(π))/2 · e^{−ix}.
- Interpolation at the nodes was checked numerically for u = e^{sin x} + |sin x|³ and N = 1, 2, 5.
- Negative control: the symmetric band −N ≤ k ≤ N has 2N + 1 coefficients for 2N nodes, and
  uniqueness fails (e^{iNx} − e^{−iNx} vanishes at every node).

### 5.3 Error in the periodic Sobolev norms

Sources: [CHQZ, §5.1, (5.1.7), p. 269, (5.1.9)–(5.1.10), p. 270, (5.1.16) and (5.1.19),
p. 272]; [STW, Theorems 2.1 and 2.3, pp. 34 and 36]; [K, Theorem 11.8, p. 209].

- **The seminorm on the physical side** (`fourierSobolevSeminorm_sq_eq_integral`). For a
  2π-periodic u of class C^m, |u|_m² = (2π)⁻¹ ∫₀^{2π} |u^{(m)}|². Route: c_k(u^{(m)}) =
  (ik)^m c_k(u) by `fourierCoeffOn_of_hasDerivAt` m times, then Parseval,
  `hasSum_sq_fourierCoeffOn`.
- **Truncation and interpolation error** (`fourierSobolevNorm_trunc_add_interp_le`). For
  1 ≤ m and l ≤ m there is C such that, for every continuous u and N ≥ 1,
  ‖u − P_N u‖_l + ‖u − I_N u‖_l ≤ C N^{l−m} |u|_m, with P_N the truncation `fourierTrunc` and
  I_N the interpolant [CHQZ, (5.1.10), p. 270, and (5.1.19), p. 272], [STW, Theorems 2.1 and 2.3,
  pp. 34 and 36]. Route: the coefficients of I_N u are ũ_k = Σ_r c_{k+2Nr}(u) by the aliasing
  formula; every frequency outside the band and every alias k + 2Nr, r ≠ 0, has modulus at least
  N; Cauchy–Schwarz against Σ_r |k + 2Nr|^{−2m}. When |u|_m = ∞ the bound is trivial, and when it
  is finite with m ≥ 1 the coefficients are summable.

*Needs:* 5.1, 5.2; Parseval on [0, 2π].

**Checks.**

- u = 1 + e^{ix}: |u|_m = 1 for every m ≥ 1, ‖u‖₀ = 2 and ‖u‖_l = √3 for l ≥ 1; the weight at k = 0
  is 1 + 0^{2l}, which is 2 at l = 0 by 0⁰ = 1. A reader expecting ‖u‖₀ to be the normalized L²
  norm √2 is off by the factor √2.
- l = m: the bound says that P_N and I_N are bounded in the seminorm uniformly in N.
- For c_k = (1 + |k|)^{−(m+0.6)} the ratio of the left side to N^{l−m} |u|_m stays between 1.2
  and 1.5 for m = 1, l = 0 and between 1.6 and 2.3 for m = 1, l = 1, N = 1, …, 32.
- Negative control: the rate cannot be improved. For u = e^{iNx}, frequency N lies outside the
  band, P_N u = 0, |u|_m = N^m and ‖u − P_N u‖_l = (1 + N^{2l})^{1/2} ≥ N^{l−m} |u|_m.

## Layer 6: nonequispaced fast Fourier transforms

### 6.1 The centred cardinal B-spline

Sources: [PPST, §7.2, (7.29), p. 388, and the Fourier transform of M_{2m}, p. 389].

- **B-spline** (`centredBSpline_nonneg_support_fourier`). M_{n+1} is nonnegative, vanishes for
  |x| > (n + 1)/2, and ∫ M_{n+1}(x) e^{−ixω} dx = sinc(ω/2)^{n+1} [PPST, p. 389]. Route: the
  convolution theorem for the Fourier integral and the transform sinc(ω/2) of M₁.

*Needs:* `MeasureTheory.convolution`; the Fourier integral of a convolution.

**Checks.**

- M₁(0.3) = 1, M₂(0) = 1, M₄(0) = 2/3.
- The Fourier formula was checked numerically for orders 1, 2, 3, 4, 6 at ω = 0, 0.7, 3, 7.5.
- Negative control: sinc(ω)^{n+1} (without the half) is wrong; at order 1 and ω = π the integral
  is 2/π and sinc(π) = 0.

### 6.2 The window method

Sources: [PPST, §7.1, (7.1)–(7.11), pp. 377–379, and §7.2, (7.24)–(7.25), pp. 385–386].

For a 2π-periodic window w and n' grid points, the coefficients
g_l = n'⁻¹ Σ_{k∈band n} f̂_k / c_k(w) e^{2πikl/n'} (`nfftCoeffs`) define
s(x) = Σ_{l<n'} g_l w(x − 2πl/n') (`nfftApprox`), the approximation of the trigonometric
polynomial f(x) = Σ_{k∈band n} f̂_k e^{ikx} (`bandTrigPoly`). The grid index runs over
0, …, n' − 1; by periodicity this is the centred index set of Plonka et al.

- **Aliasing error of the window method** (`norm_sub_nfftApprox_le`). If w is continuous and
  2π-periodic with absolutely summable Fourier coefficients that do not vanish on the band, and
  n' ≥ 1, then |f(x) − s(x)| ≤ Σ_k |f̂_k| Σ_{r≠0} |c_{k+rn'}(w)| / |c_k(w)| [PPST, (7.25), p. 386].
  Route: expand w in its Fourier series; the sum over l selects the frequencies k + rn'. No
  oversampling hypothesis is needed for this identity.

*Needs:* 5.1.

**Checks.**

- n = 0: the band is empty and both sides are 0.
- w = the Dirichlet kernel of the band with n' = 2n: c_{k+rn'}(w) = 0 for r ≠ 0 and the window
  method is exact.
- Negative control: at n' = 0 the approximation s is 0, while the inner sum over r ≠ 0 of 1 is
  not summable and takes the junk value 0, so the bound would claim f = 0; the hypothesis
  n' ≥ 1 is needed.

### 6.3 The B-spline window

Sources: [PPST, §7.2, (7.29), p. 388, (7.30)–(7.31) and Lemma 7.6, (7.32)–(7.34),
pp. 389–390].

The window is φ(x) = M_{2m}(n'x/(2π)) (`bsplineWindow`), periodized as
φ̃(x) = Σ_r φ(x + 2πr) (`periodize`).

- **Coefficients of the window** (`periodicCoeff_periodize_bsplineWindow`). For n' ≥ 1 and
  m ≥ 1, φ̃ is continuous and 2π-periodic, c_k(φ̃) = n'⁻¹ sinc(kπ/n')^{2m}, these are absolutely
  summable, and sinc(kπ/n')^{2m} > 0 for |k| < n' [PPST, (7.30)–(7.31), pp. 389–390].
- **Error bound** (`norm_sub_nfftApprox_bspline_le`). For 2n ≤ n' and m ≥ 1,
  |f(x) − s(x)| ≤ 4 (n/(n' − n))^{2m} Σ_k |f̂_k|, that is 4/(2σ − 1)^{2m} ‖f̂‖₁ with the
  oversampling factor σ = n'/(2n) [PPST, Lemma 7.6, pp. 389–390]. Plonka et al. assume
  σ > 1 and 2m ≪ σN, so that the support of φ lies in [−π, π]; the proof uses only
  |k|/n' ≤ 1/2, so 2n ≤ n' suffices. Route: 6.2 with the
  ratio c_{k+rn'}/c_k = (u/(u + r))^{2m}, u = k/n', and Σ_{r≠0} (u/(u + r))^{2m} ≤
  4 (|u|/(1 − |u|))^{2m} for |u| ≤ 1/2.
- **Locality** (`card_bsplineWindow_ne_zero_le`). For each x at most 2m + 1 of the n' terms of
  s(x) are nonzero [PPST, §7.1, p. 380]. Route: φ vanishes outside |x| ≤ 2πm/n', an interval
  that meets at most 2m + 1 grid translates.

By locality, s(x) is evaluated in O(m) operations after one FFT of length n'.

*Needs:* 6.1, 6.2.

**Checks.**

- n = 4, n' = 16, m = 2 (σ = 2): the observed error over random data is 1.6 · 10⁻³ ‖f̂‖₁ against
  the bound 4/81 ≈ 4.9 · 10⁻².
- σ = 1 (n = 4, n' = 8, m = 1): the observed error 0.46 ‖f̂‖₁ is below the bound 4.
- n = 1, n' = 2, m = 2, where 2m > n': the observed error 0.58 ‖f̂‖₁ is below the bound 4.
- The ratio of Σ_{r≠0} (u/(u + r))^{2m} to 4 (u/(1 − u))^{2m} is at most 0.83 for u ∈ (0, 1/2] and
  m = 1, …, 6.
- c_k(φ̃) was checked numerically against the closed form for several k.
- Negative control: at k = n' the coefficient sinc(π)^{2m} = 0, so the band must stay inside
  |k| < n'.

### 6.4 The adjoint transform

Sources: [PPST, §7.1, Algorithm 7.3, p. 382, and (7.18)–(7.23), pp. 383–384].

For nodes x_j and data f_j, j < J, the adjoint approximates h(k) = Σ_j f_j e^{ikx_j} on the band by
h̃(k) = c̃_k / c_k(w), where g̃_l = Σ_j f_j w(x_j − 2πl/n') and c̃_k = n'⁻¹ Σ_l g̃_l e^{2πikl/n'}
(`nfftAdjointApprox`).

- **Adjoint error bound** (`norm_sub_nfftAdjointApprox_bspline_le`). For 2n ≤ n', m ≥ 1 and k in
  the band, |h(k) − h̃(k)| ≤ 4 (n/(n' − n))^{2m} Σ_j |f_j|. Route: the same expansion as 6.2
  gives h̃(k) − h(k) = Σ_j f_j Σ_{r≠0} c_{k+rn'}/c_k e^{i(k+rn')x_j}, and the estimate of 6.3.

*Needs:* 6.3.

**Checks.**

- J = 0: both sides are 0.
- n = 4, n' = 16, m = 2: the observed error is 6.1 · 10⁻³ Σ|f_j|, below 4/81.
- σ = 1, n = 3, n' = 6, m = 1: the observed error 0.69 Σ|f_j| is below 4.

The operation count of the transform and its adjoint, O(n' log n' + mJ), stays in prose [PPST,
Algorithm 7.1, pp. 380–381]. The adjoint sums h(k) carry the sign e^{+ikx_j} of [PPST, (7.15),
p. 381].

## Layer 7: exponential sums

### 7.1 Prony's method

Sources: [PPST, §10.1, (10.1)–(10.9) and Algorithm 10.1, pp. 523–526].

- **Prony** (`prony`). For distinct nodes z_j and nonzero weights c_j, j < M, the M × M Hankel
  matrix (h(k + l)) factors as V diag(c) Vᵀ with V = (z_k^j), it is invertible, the linear
  system Σ_k p_k h(k + l) = −h(M + l) has exactly one solution, every solution gives the Prony
  polynomial X^M + Σ_k p_k X^k = Π_j (X − z_j), and c is the unique solution of
  V c = (h(0), …, h(M − 1)) [PPST, §10.1, (10.1)–(10.9), pp. 523–526].
- **Uniqueness of the parameters** (`exists_perm_eq_of_expSum_eq`). An exponential sum
  Σ_j c_j e^{φ_j x} with M distinct exponents of imaginary part in [−π, π) and nonzero
  coefficients is determined up to relabelling by its values at x = 0, 1, …, 2M − 1 [PPST, §10.1,
  pp. 523–526]. Route: Prony at z_j = e^{φ_j}, which are distinct by the strip condition.

*Needs:* `Matrix.vandermonde`, `Matrix.det_vandermonde_ne_zero_iff`.

**Checks.**

- M = 1: h(k) = c z^k, H = (c), p₀ = −h(1)/h(0) = −z, and the Prony polynomial is X − z.
- The factorization, the Prony polynomial and the weights were checked numerically for
  M = 1, 2, 3, 5.
- Negative control: φ = 0 and φ = 2πi give the same samples; the strip condition is needed.

### 7.2 Hankel ranks and the matrix pencil

Sources: [PPST, §10.2, Lemma 10.6, p. 531, Lemma 10.9 and (10.23), pp. 536–537].

- **Rank** (`rank_trajectoryHankel`). For distinct nonzero nodes, nonzero weights and M ≤ L, the
  L × (N − L + 1) matrix (h(l + m)) has rank M when L + M ≤ N + 1, and the L × (N − L) matrices
  H(s) = (h(s + l + m)), s ∈ {0, 1}, have rank M when L + M ≤ N, for s = 1 provided the nodes are
  nonzero [PPST, Lemma 10.6, p. 531]. A zero node is allowed in the other two cases; Plonka et
  al. take the nodes on the unit circle.
- **Companion relation** (`hankel_mul_companionMatrix`). For L + M ≤ N,
  H(0) C(q) = H(1), with C(q) the companion matrix (`companionMatrix`) of
  q = X^{N−L−M} Π_j (X − z_j), and every node is an eigenvalue of the pencil
  z H(0) − H(1) [PPST, Lemma 10.9, p. 536].
- **Square pencil** (`det_smul_hankel_sub_hankel`). For the M × M matrices,
  det(ζ H(0) − H(1)) = det H(0) · Π_j (ζ − z_j), for all nodes and weights. Route:
  H(s) = V diag(c) diag(z^s) Vᵀ.

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
- the Fourier spectral approximation theory of Galerkin methods (a roadmap on parabolic and
  spectral Galerkin methods): its interpolant on the symmetric band |k| ≤ N with the halved
  coefficients at ±N, and its truncation and interpolation bounds of real order with explicit
  constants, are a different object from the band −N ≤ k < N and the integer orders here.

Boundary in one sentence: this roadmap owns the computational theory of the discrete Fourier
transform (fast factorizations, operation counts, periodic interpolation error, nonequispaced
transforms and exponential-sum recovery), and the transform itself and its algebraic identities
stay with their owner.

## Exact supplier contracts

### From [SamplingAndDiscreteFourierAnalysis][SDFA]

- 2.1: the definition `dftMatrix`, copied verbatim; the identity
  dftMatrix N · circulant v = diagonal(v̂) · dftMatrix N, consumed in §1.2.
- 1.1: Σ_k conj(Φ̂_k) Ψ̂_k = N Σ_j conj(Φ_j) Ψ_j, compared in §1.1.
- 1.2: the transform of a cyclic convolution is the product of the transforms, consumed in §1.2
  and in the route of §2.3.

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
