# Roadmap: Chebyshev series, Haar spaces and rational approximation

**Summary.** This roadmap develops uniform approximation on an interval beyond the polynomial
theory of best approximation. It starts from Haar spaces, the finite-dimensional spaces of
continuous functions in which interpolation at any admissible set of points is unique: their
determinant and zero-count characterizations, the theorem of Mairhuber and Curtis that they
exist only in one dimension, alternation, and Haar's theorem that they are exactly the spaces of
unique best approximation; the trigonometric polynomials and the complex polynomials on an
interval are treated as instances. It then builds Chebyshev series: coefficients, projections
and interpolants in the Chebyshev points, aliasing, algebraic rates for functions with a
derivative of bounded variation, geometric rates on Bernstein ellipses and Bernstein's converse.
It proves that the Chebyshev projection is near-best with a logarithmic Lebesgue constant, that
no projection onto the polynomials does better than half of it, and Faber's theorem that no
system of interpolation nodes converges for every continuous function. Jackson and Favard
estimates with explicit constants and Bernstein's inverse theorem relate smoothness to rates.
The rational part proves existence, uniqueness and the defect form of equioscillation for best
rational approximation, the algebraic structure of the Padé table with its square blocks, the
theorem of de Montessus de Ballore, and the Padé theory of Stieltjes series.

The polynomial theory comes from
[PolynomialInterpolationAndBestApproximation][PIBA]:
the error of best approximation, Lebesgue constants, Bernstein's inequality for trigonometric
polynomials and the trigonometric polynomials themselves; this roadmap passes back the general
Haar-space versions of its alternation theory. [RungePhenomenonAndLebesgueConstants][RPL]
supplies the identification of a Lebesgue constant with the norm of the interpolation operator,
from which the node-independent lower bound and Faber's theorem follow here.
[ClassicalApproximationSpaces][CAS] supplies the Hölder and Zygmund characterization of the
periodic best-approximation rates of order at most one, which Bernstein's inverse theorem lifts to
higher smoothness here.
[SpecialFunctionsOrthogonalPolynomialsGeneral][OPG]
and [HankelFormsAndRealMomentProblems][HANKEL] supply the
zeros, Gauss quadrature, Markov's theorem and the Stieltjes moment problem behind the Padé
approximants of Stieltjes series. The roadmap is a synthesis of Trefethen, DeVore and Lorentz,
Baker and Graves-Morris, Wendland, Han and Atkinson, and Canuto, Hussaini, Quarteroni and Zang;
it follows none of them section by section.

## How to read the build

Each layer has numbered subsections. Each subsection lists its targets as bold headlines with
their Lean names, a source locator for a headline that restates a source result and a proof route
for a corollary or adaptation, a *Needs:* line, and **Checks**, sanity checks of the key
definitions and theorems with the values computed for them. The Lean forms are in
`Suggested.lean`; every headline with a Lean name is stated there with every conclusion attached
to it here.

Layer 1 (Haar spaces) and Layer 3 (Chebyshev series) are the two foundations. Layer 2 uses
Layer 1. Layer 4 uses Layer 3 and the supplier contracts for interpolation. Layer 5 uses Layer 3
and the aliasing of §3.3. Layer 6 is independent of Layers 1–5 apart from the error of best
approximation. Layer 7 uses the alternation machinery of §1.4 in a nonlinear setting. Layer 8 is
algebraic and independent of everything before it; Layer 9 uses Layer 8 and complex analysis;
Layer 10 uses Layer 8 and the orthogonal-polynomial suppliers.

## Conventions

- Uniform approximation is posed in `C(K, ℝ)` for a compact space K, or in `C(K, ℂ)`, with the
  supremum norm. The error of best approximation from a set A is `Metric.infDist f A`; for the
  polynomials of degree at most n on [a, b] it is the local copy `bestApproxError` of the
  polynomial roadmap's error. A supremum over an unbounded set never occurs: bounds for functions
  on ℝ (periodic functions, rational functions) are pointwise, for all arguments.
- A function on [−1, 1] is a function `f : ℝ → ℝ` (or into a real Banach space E) used only on
  [−1, 1]; continuity is `ContinuousOn` on `Icc (-1) 1`, and the element of `C(Icc (-1) 1, ℝ)` it
  defines is its restriction.
- The Chebyshev polynomials are Mathlib's `Polynomial.Chebyshev.T`, and T_k(cos θ) = cos kθ
  (`Polynomial.Chebyshev.T_real_cos`). The Chebyshev points of degree n ≥ 1 are Mathlib's
  `Polynomial.Chebyshev.node`, cos(jπ/n) for j = 0, …, n (the extreme points of T_n, called
  Chebyshev points of the second kind or Chebyshev–Lobatto points).
- The Chebyshev coefficient `chebyshevCoeff f k` is (c_k/π) ∫₀^π cos(kθ) f(cos θ) dθ with c₀ = 1
  and c_k = 2 for k ≥ 1. This is the integral against the Chebyshev weight (1 − x²)^(−1/2) of the
  sources, written through θ = arccos x so that it is a proper integral. It takes values in any
  real Banach space, so that analytic functions with complex values are covered without a second
  definition.
- The Lebesgue constant of an interpolation scheme is the local copy `lebesgueConstant` of the
  polynomial roadmap's definition, the supremum over [a, b] of the Lebesgue function, which is
  continuous, so the supremum is over a compact image.
- A trigonometric polynomial of degree at most n is the local copy `trigPoly n a b` on ℝ, of
  period 2π. On the circle the same space is `trigPolyDegLE n`, a submodule of
  `C(AddCircle (2 * π), ℝ)` spanned by the real and imaginary parts of Mathlib's characters
  `fourier k`, k ≤ n.
- Padé approximation is formal: f is a power series over an arbitrary field K, and the
  approximants are elements of `RatFunc K`. The Padé approximant `pade f m n` follows
  Frobenius and Trefethen (it always exists); the Baker approximant `IsBakerPade` follows Baker
  and Graves-Morris (normalized by B(0) = 1, it need not exist). The two agree whenever the Baker
  approximant exists (§8.4).
- The Stieltjes series of a measure μ on [0, ∞) is Σ_j (−1)^j μ_j z^j with moments
  μ_j = ∫ u^j dμ, the expansion at 0 of the Stieltjes function ∫ dμ(u)/(1 + zu). The measures are
  the local copy `IsOrthogonalityMeasure` of the orthogonal-polynomial roadmap: every moment is
  finite and the support is infinite.

## Layer 1: Haar spaces

### 1.1 Haar spaces and their characterizations

Sources: [W, Definition 2.1 and Theorem 2.2, p. 18]; [DL, Ch. 3, §§3–4, pp. 68–72].

- **Haar space** (`IsHaarSpace`). A subspace V of `C(K, ℝ)`, K a topological space, is a Haar
  space of dimension N if data at any N distinct points of K are interpolated by exactly one
  element of V [W, Definition 2.1, p. 18], [DL, Ch. 3, p. 68].
- **Zero count** (`isHaarSpace_iff_forall_eq_zero`). If V has dimension N, it is a Haar space iff
  no nonzero element of V vanishes at N distinct points [W, Theorem 2.2, p. 18].
- **Collocation determinant** (`isHaarSpace_iff_det_ne_zero`). For any basis b₁, …, b_N of V, V
  is a Haar space iff det(b_j(x_i)) ≠ 0 at every N distinct points [W, Theorem 2.2, p. 18].

*Needs:* Mathlib linear algebra in finite dimension (rank–nullity, determinants).

**Checks.**

- The constants on any K with at least one point form a Haar space of dimension 1.
- Negative control: V = span{x} on [−1, 1] has dimension 1 but x vanishes at 0, so it is not a
  Haar space; correspondingly f = 1 − |x| has every c·x with |c| ≤ 1 as a best approximation
  (error 1 for c ∈ {−1, −0.5, 0, 0.5, 1}, error 1.2 for c = 1.2), the failure of uniqueness that
  Haar's theorem (§1.5) predicts.
- N = 0: V = 0 and the condition is vacuous on both sides.

### 1.2 Polynomial Haar spaces

- **The polynomial Haar spaces** (`polyRestrict`, `isHaarSpace_polyRestrict`). On a set s ⊆ ℝ
  with at least N points (or infinite), the restrictions of the polynomials of degree less than N
  form a Haar space of dimension N [W, p. 18, after Definition 2.1]. Route: the
  restriction map from `Polynomial.degreeLT` through `Polynomial.toContinuousMapOnAlgHom` is
  injective on a set with at least N points, and the collocation matrix of the monomials is a
  Vandermonde matrix (`Matrix.det_vandermonde_ne_zero_iff`).

*Needs:* 1.1.

**Checks.**

- s = {0, 1}, N = 2: the collocation determinant of {1, x} is 1 − 0 = 1.
- Negative control: s = {0, 1}, N = 3: the restriction map has a kernel (x² − x), the dimension
  is 2, not 3; the hypothesis on the number of points is needed.

### 1.3 The Mairhuber–Curtis theorem

- **No Haar spaces in higher dimension** (`not_isHaarSpace_of_interior_nonempty`). A subset of
  ℝ^d, d ≥ 2, with an interior point carries no Haar space of dimension N ≥ 2 [W, Theorem 2.3,
  p. 19]. Route: exchange two points along disjoint paths inside a ball avoiding the other N − 2
  points; the collocation determinant changes sign continuously, so it vanishes somewhere.

*Needs:* 1.1; Mathlib path-connectedness of balls minus finite sets.

**Checks.**

- N = 1 is excluded rightly: the constants are a Haar space of dimension 1 on every set.
- d = 1 is excluded rightly: §1.2 gives Haar spaces of every dimension on an interval, where two
  points cannot be exchanged without colliding.

### 1.4 Alternation in a Haar space

Sources: [DL, Ch. 3, Theorems 5.1–5.2, pp. 74–75]; [T, Theorem 10.1, p. 93] for polynomials.

- **Equioscillation** (`Equioscillates`). g ∈ `C(Icc a b, ℝ)` equioscillates between k extreme
  points if it takes the values σ(−1)^i ‖g‖ at k increasing points, σ = ±1.
- **de la Vallée Poussin's bound** (`inf'_abs_le_infDist_of_isHaarSpace`). If V is a Haar space
  of dimension n + 1 on [a, b] and f − v alternates strictly in sign at n + 2 increasing points,
  the least of the |f − v| there is at most the distance from f to V [DL, Ch. 3, Theorem 5.2,
  p. 74].
- **Alternation theorem** (`norm_sub_eq_infDist_iff_equioscillates`). For a Haar space V of
  dimension n + 1 on [a, b], a < b, v ∈ V is a best approximation of f iff f − v equioscillates
  between n + 2 extreme points, and the best approximation is unique [DL, Ch. 3, Theorem 5.1,
  p. 74, with Theorem 4.2, p. 72].

These generalize 2.2–2.4 of the polynomial roadmap from the polynomials to every Haar space on an
interval.

*Needs:* 1.1.

**Checks.**

- V = polynomials of degree ≤ 1, f = x² on [−1, 1]: the best approximation is 1/2, and x² − 1/2
  equioscillates at −1, 0, 1 with error 1/2.
- f ∈ V: f − f = 0 equioscillates trivially (any n + 2 points, value 0), and the infimum is 0.
- Negative control: n + 1 points do not suffice. For V the constants (n = 0), f = x on [−1, 1]
  and v = 0.9, the single point −1 gives |f − v| = 1.9, above the distance 1 from f to V.

### 1.5 Haar's theorem

- **Unique best approximation characterizes Haar spaces**
  (`forall_existsUnique_bestApprox_iff_isHaarSpace`). On a compact Hausdorff space K, every
  continuous function has exactly one best uniform approximation from the N-dimensional subspace
  V iff V is a Haar space [DL, Ch. 3, Theorems 4.2 and 4.3 (Haar), p. 72]. The source assumes K
  has at least N points; that is automatic, since `C(K, ℝ)` has dimension at most the number of
  points of K when K is finite.

*Needs:* 1.1; Mathlib compactness of closed bounded sets in a finite-dimensional space.

**Checks.**

- span{x} on [−1, 1] (§1.1, Checks) is not Haar and f = 1 − |x| has many best approximations.
- K a single point, N = 1: both sides hold.

## Layer 2: trigonometric and complex best approximation

### 2.1 Trigonometric polynomials on the circle

- **Trigonometric polynomials on the circle** (`cosCircle`, `sinCircle`, `trigPolyDegLE`). The
  real trigonometric polynomials of degree at most n, as a submodule of
  `C(AddCircle (2 * π), ℝ)`.
- **A Haar space of dimension 2n + 1** (`isHaarSpace_trigPolyDegLE`). Its dimension is 2n + 1
  and it is a Haar space [DL, Ch. 3, p. 68, for the zero count]. Route: with z = eⁱᶿ, a
  trigonometric polynomial of degree n is z⁻ⁿ times a complex polynomial of degree ≤ 2n, so
  it has at most 2n zeros on the circle unless it vanishes; §1.1.
- **Unique best trigonometric approximation** (`existsUnique_bestApprox_trigPolyDegLE`). Every
  continuous 2π-periodic function has exactly one best uniform approximation of degree at most n.
  Route: §1.5 on the compact circle.

*Needs:* 1.1, 1.5; Mathlib `fourier`.

**Checks.**

- n = 0: the constants; the best constant for g is (max g + min g)/2.
- |sin θ|: the best approximations of degree 0 and 1 have error 1/2 (the constant 1/2; the terms
  of degree 1 do not help, since |sin| has period π), computed by linear programming.
- Negative control: cos θ and sin θ alone (no constant) span a space of dimension 2 in which
  cos θ vanishes at ±π/2, so it is not a Haar space of dimension 2.

### 2.2 Complex polynomials on an interval

- **Complex polynomials on [−1, 1]** (`complexPolyDegLE`) and **unique best complex
  approximation** (`existsUnique_bestApprox_complexPoly`). A continuous complex function on
  [−1, 1] has exactly one best uniform approximation by complex polynomials of degree at most n
  [T, Theorem 10.1, p. 93]. Uniqueness is the complex Haar argument: the complex polynomials of
  degree ≤ n on [−1, 1] are a complex Haar space (§1.2 over ℂ), and the uniqueness part of [DL,
  Ch. 3, Theorem 4.2, p. 72] holds for complex Haar systems.

*Needs:* 1.2.

**Checks.**

- f real: the best complex approximation is real (by uniqueness and conjugation symmetry), and it
  is the real best approximation of the polynomial roadmap.
- f(x) = e^(iπx), n = 0: f takes every value on the unit circle, so ‖f − c‖ = 1 + |c| for every
  constant c; the best constant is 0, with error 1.

## Layer 3: Chebyshev series

### 3.1 Coefficients, projections and interpolants

- **Chebyshev coefficient** (`chebyshevCoeff`), **Chebyshev projection** (`chebyshevProj`), the
  truncation f_n = Σ_(k ≤ n) a_k T_k, and **Chebyshev interpolant** (`chebyshevInterp`), the
  interpolant p_n in the Chebyshev points cos(jπ/n) written with `Lagrange.basis` so that f may be
  vector valued [T, (3.12), p. 20, for the coefficients].
- **The weighted form** (`chebyshevCoeff_eq_integral_measureT`, proved). For real f the
  coefficient is (c_k/π) ∫ f T_k against Mathlib's Chebyshev measure
  `Polynomial.Chebyshev.measureT`. Proof: `Polynomial.Chebyshev.integral_measureT_eq_integral_cos`
  and `Polynomial.Chebyshev.T_real_cos`.

*Needs:* Mathlib `Polynomial.Chebyshev.T_real_cos`, `Polynomial.Chebyshev.node`,
`Polynomial.Chebyshev.measureT`, `Lagrange.basis`.

**Checks.**

- f = |x|: a₀ = 2/π = 0.636620, a₂ = 4/(3π) = 0.424413, a₄ = −0.084883, a₆ = 0.036378, odd
  coefficients 0.
- f = T_m: a_k = δₖₘ. Negative control: with c₀ = 2 instead of 1, f = 1 would get a₀ = 2.
- n = 1: the Chebyshev points are ±1 and p₁ is the chord.

### 3.2 Convergence and uniqueness

- **Lipschitz functions** (`hasSum_chebyshevCoeff_of_lipschitzOnWith`). If f is Lipschitz on
  [−1, 1], Σ|a_k| < ∞, the Chebyshev series converges to f at every point, and f_n → f uniformly
  [T, Theorem 3.1, pp. 19–20].
- **Uniqueness of the expansion** (`eq_chebyshevCoeff_of_hasSum`). If Σ|c_k| < ∞ and
  Σ c_k T_k(x) = f(x) on [−1, 1], then c_k = a_k [T, Theorem 3.1, pp. 19–20]. Route: uniform
  convergence and the orthogonality of the T_k against `Polynomial.Chebyshev.measureT`, with the
  Hilbert basis `TauCeti.chebyshevTHilbertBasis` and its expansion
  `TauCeti.hasSum_chebyshevT_expansion` for the L² identification.

*Needs:* 3.1; Tau Ceti `TauCeti.chebyshevTHilbertBasis`, `TauCeti.hasSum_chebyshevT_expansion`.

**Checks.**

- f = |x| (Lipschitz with constant 1): Σ|a_k| converges, a_k = O(k⁻²).
- Negative control for the Lipschitz hypothesis: the step f = 1 on [0, 1], f = 0 on [−1, 0),
  has a₀ = 1/2 and a_k = (2/(πk)) sin(kπ/2) for k ≥ 1; at x = 0 the Chebyshev series sums to
  1/2 ≠ f(0) = 1 (the partial sums of degree 400 give 0.5000).

### 3.3 Aliasing and the error expansions

- **Aliasing index** (`chebyshevAlias`) and **aliasing** (`eval_T_node_eq_chebyshevAlias`). For
  n ≥ 1, T_k agrees on the n + 1 Chebyshev points with T_m, m = |(k + n − 1) mod 2n − (n − 1)|,
  and 0 ≤ m ≤ n [T, Theorem 4.1 and (4.4), p. 30].
- **Error expansions** (`hasSum_sub_chebyshevProj_and_chebyshevInterp`). For Lipschitz f and
  n ≥ 1, f − f_n = Σ_(k > n) a_k T_k and f − p_n = Σ_(k > n) a_k (T_k − Tₘ₍ₖ₎) on [−1, 1]
  [T, Theorem 4.2, p. 31; (4.8)–(4.9), p. 32].

*Needs:* 3.2.

**Checks.**

- The alias sequence for n = 2, k = 0, …, 5 is 0, 1, 2, 1, 0, 1, and T_k = Tₘ₍ₖ₎ at the nodes
  for k < 60, n = 1, …, 5 (numerically).
- f = e^x, n = 4, x = 0.3: f − p₄ = 0.0010166302825 by direct interpolation and by the series.
- Negative control: n = 0 is excluded rightly; the formula gives m = k, and the second expansion
  would make f − p₀ vanish identically.

### 3.4 Functions with a derivative of bounded variation

- **Coefficient decay** (`abs_chebyshevCoeff_le_of_boundedVariation`). Let f, …, f^((ν−1)) be
  absolutely continuous on [−1, 1] and let f^((ν)) agree almost everywhere with a function g of
  finite total variation V (`AbsolutelyContinuousOnInterval`, `eVariationOn`). Then for
  k ≥ ν + 1, |a_k| ≤ 2V/(π k(k − 1)⋯(k − ν)) ≤ 2V/(π (k − ν)^(ν+1)) [T, Theorem 7.1, (7.2),
  pp. 62–63].
- **Algebraic convergence** (`abs_sub_chebyshevProj_le_of_boundedVariation`). Under the same
  hypotheses with ν ≥ 1 and n > ν, |f − f_n| ≤ 2V/(πν(n − ν)^ν) and |f − p_n| ≤ 4V/(πν(n − ν)^ν)
  on [−1, 1] [T, Theorem 7.2, (7.4)–(7.5), p. 64]. Route: sum the coefficient bound over k > n in
  the expansions of §3.3; |T_k − T_m| ≤ 2 doubles the constant.

*Needs:* 3.3; Mathlib `AbsolutelyContinuousOnInterval`, `eVariationOn`.

**Checks.**

- f = |x|, ν = 1, V = 2: |a_k| ≤ 4/(π k(k − 1)) holds for 2 ≤ k < 80; at k = 2,
  0.424413 ≤ 0.636620.
- f = |x|: ‖f − f_n‖ = 0.21221, 0.12732, 0.05787, 0.03032 for n = 2, 5, 10, 20, against the
  bounds 1.27324, 0.31831, 0.14147, 0.06701; ‖f − p_n‖ = 0.25, 0.2, 0.05922, 0.02979 against
  2.54648, 0.63662, 0.28294, 0.13403.
- Negative control: ν = 0 is excluded from the convergence bound rightly; a jump function has
  ‖f − f_n‖ ≥ half the jump for every n (Gibbs), while the formula with ν = 0 would be 2V/0.

## Layer 4: the Chebyshev projection, minimal projections and Faber's theorem

### 4.1 The Lebesgue constant of the Chebyshev projection

- **Lebesgue constant of the projection** (`chebyshevProjLebesgue`). Λ_n is (1/2π) times the
  integral over [−π, π] of |1 + 2(cos t + ⋯ + cos nt)| dt, the L¹ norm of the Dirichlet kernel
  sin((n + ½)t)/sin(t/2) [T, Theorem 15.3, (15.10), p. 145].
- **Norm and upper bound** (`abs_chebyshevProj_le_chebyshevProjLebesgue`). |f_n| ≤ Λ_n ‖f‖ on
  [−1, 1]; the bound is approached at x = 1 by continuous f with |f| ≤ 1; and
  Λ_n ≤ (4/π²) log(n + 1) + 3 [T, Theorem 15.3, (15.10)–(15.11a), p. 145, which cites Rivlin;
  DL, Ch. 9, §5, p. 282 for the trigonometric form]. Route: f_n(cos φ) is the convolution of
  θ ↦ f(cos θ) with the Dirichlet kernel; at φ = 0, take f(cos θ) close to the even function
  sign D_n(θ). The source states n ≥ 1; n = 0 gives Λ₀ = 1.
- **Lower bound** (`four_div_pi_sq_mul_log_le_chebyshevProjLebesgue`). Λ_n ≥ (4/π²) log(n + 1).
  Route: |sin(t/2)| ≤ |t|/2 and the integral of |sin((n + ½)t)| over each of the n intervals
  between consecutive zeros gives Λ_n ≥ (4/π²) Σ_(k ≤ n) 1/k ≥ (4/π²) log(n + 1); the asymptotics
  Λ_n ∼ (4/π²) log n is [T, (15.11b), p. 145].

*Needs:* 3.1.

**Checks.**

- Λ₀ = 1, Λ₁ = 1.435991, Λ₂ = 1.642188, Λ₁₀ = 2.223357, Λ₁₀₀ = 3.138780.
- Upper bound at n = 1, 10, 100: 3.280922, 3.971830, 4.870438; lower bound: 0.280922, 0.971830,
  1.870438; harmonic bound (4/π²) H_n: 0.405285, 1.187066, 2.102365.
- Λ_n − (4/π²) log n = 1.290 at n = 10, 1.272 at n = 100, 1.2706 at n = 1000.
- Negative control: without the absolute value the integral is 1 for every n (the kernel has
  mean 1), so Λ_n is not the integral of the kernel itself.

### 4.2 Near-best approximation

- **The projection is near-best** (`abs_sub_chebyshevProj_le_bestApproxError`).
  |f − f_n| ≤ (4 + (4/π²) log(n + 1)) E_n(f) on [−1, 1] [T, Theorem 16.1, (16.1), p. 154, from
  Theorems 15.1 and 15.3, pp. 136, 145]. Route: f − f_n = (f − p*) − (f − p*)_n gives the factor
  1 + Λ_n. The source states n ≥ 1; the route covers n = 0, where the factor is 2.

*Needs:* 4.1; PolynomialInterpolationAndBestApproximation 2.1 (`bestApproxError`, local copy).

**Checks.**

- f a polynomial of degree ≤ n: both sides vanish.
- f = |x|, n = 2: ‖f − f₂‖ = 0.21221 and E₂(|x|) = 1/8 (the best quadratic is x² + 1/8), and
  0.21221 ≤ (4 + 0.445251)·0.125 = 0.555656.

### 4.3 Minimal projections

- **No projection beats half the Chebyshev constant** (`chebyshevProjLebesgue_div_two_le_opNorm`).
  Every bounded linear projection U of `C(Icc (-1) 1, ℝ)` onto the polynomials of degree at most n
  has ‖U‖ ≥ Λ_n/2 [DL, Ch. 9, Theorem 5.1, p. 282, and Corollary 5.4, p. 284]. Route
  (Berman–Marcinkiewicz, Faber): average the conjugates of the trigonometric lift of U by the
  rotations of the circle; the average is the Fourier projection, whose norm Λ_n is at most
  2‖U‖ (the factor 2 from the even/odd splitting under x = cos θ).

*Needs:* 4.1; Mathlib Haar integration on the circle.

**Checks.**

- n = 0: every projection onto the constants has norm ≥ 1 ≥ Λ₀/2 = 1/2.
- Chebyshev-point interpolation at n = 8 has Lebesgue constant 2.2747 ≥ Λ₈/2 = 1.0689.
- Negative control: without the factor 1/2 the bound fails for n = 1. The interpolation
  projection at the nodes ±1 (the chord) has norm 1 < Λ₁ = 1.4360, so no factor larger than
  1/Λ₁ = 0.6964 can replace 1/2 at n = 1.

### 4.4 Lower bounds for interpolation and Faber's theorem

- **Every node set is logarithmically bad** (`two_div_pi_sq_mul_log_le_lebesgueConstant`). For
  any n + 1 distinct nodes in [−1, 1], `lebesgueConstant` ≥ (2/π²) log(n + 1). Route: the
  Lebesgue constant is the norm of the interpolation projection (RungePhenomenonAndLebesgueConstants
  2.1), and §4.3 with §4.1 bounds that norm below. The sharp form, (2/π) log(n + 1) + 0.52125…,
  is [T, Theorem 15.2, (15.7), p. 137], listed under Beyond this roadmap.
- **Faber's theorem** (`exists_not_tendsto_uniform_lagrange`). For every triangular array of
  distinct nodes in [a, b] (which forces a < b), the Lebesgue constants are unbounded and some
  continuous f has interpolants that do not converge to it uniformly on [a, b] [DL, Ch. 9, Corollary
  5.4, p. 284, and the Banach–Steinhaus argument; T, p. 55]. Route: transport the bound of the
  previous headline affinely to [a, b], then `banach_steinhaus`.

*Needs:* 4.1, 4.3; RungePhenomenonAndLebesgueConstants 2.1;
PolynomialInterpolationAndBestApproximation 3.1 (`lebesgueFunction`, `lebesgueConstant`, local
copies); Mathlib `banach_steinhaus`.

**Checks.**

- n = 1, 2, 4, 8, 16: the bounds (2/π²) log(n + 1) = 0.1405, 0.2226, 0.3261, 0.4453, 0.5741 lie
  below the Lebesgue constants of the Chebyshev points (1, 1.25, 1.7988, 2.2747, 2.7247) and of
  the equispaced points of [−1, 1] (1, 1.25, 2.2078, 10.9456, 934.53).
- n = 0: the bound is 0 and every one-point constant is 1.
- Negative control: the function in Faber's theorem depends on the array. For the Chebyshev
  points and f = |x| the interpolants converge uniformly, with errors 0.25, 0.2, 0.05922,
  0.02979 for n = 2, 5, 10, 20 (§3.4), so the conclusion cannot hold for every continuous f.

## Layer 5: analytic functions and Bernstein ellipses

### 5.1 Bernstein ellipses

- **The ellipse** (`bernsteinEllipse`). E_ρ = {z : |z − 1| + |z + 1| < ρ + ρ⁻¹}, the open
  region bounded by the image of the circle |w| = ρ under w ↦ (w + w⁻¹)/2 [T, Chapter 8,
  p. 68].
- **Ellipse parameters** (`mem_bernsteinEllipse_iff`). For ρ > 1: a real point α > 1 lies in
  E_ρ iff α + √(α² − 1) < ρ; an imaginary point iβ, β > 0, lies in E_ρ iff β + √(β² + 1) < ρ
  [T, (8.4)–(8.5), p. 71].
- **Bernstein's lemma** (`norm_eval_le_of_mem_bernsteinEllipse`). A complex polynomial of degree
  at most d bounded by M on [−1, 1] is bounded by ρ^d M on E_ρ [T, proof of Theorem 8.3,
  p. 73]. Route: q(w) = p((w + w⁻¹)/2) w^d is a polynomial in w with |q| ≤ M on |w| = 1, so
  |q| ≤ M on |w| ≤ 1 by the maximum principle, and the circle |w| = 1/s is mapped onto the
  boundary of E_s, where therefore |p| ≤ s^d M.

*Needs:* Mathlib complex analysis (the maximum modulus principle).

**Checks.**

- α = 2: ρ = 2 + √3 = 3.732051 and ρ + ρ⁻¹ = 4 = 2α; β = 1: ρ = 1 + √2 and
  ρ + ρ⁻¹ = 2√2 = 2√(1 + β²); β = 0.2: ρ = 1.219804.
- p = 1 + z, d = 1, ρ = 2: the maximum of |p| on [−1, 1] is 2 and on the boundary of E₂ it is
  1 + 5/4 = 2.25, below ρ·2 = 4.
- T₅ on ∂E₂: max |T₅| = (2⁵ + 2⁻⁵)/2 = 16.0156 ≤ 2⁵ = 32; the lemma is not sharp for T_d, the
  sharp value being (ρ^d + ρ⁻ᵈ)/2.

### 5.2 Geometric convergence

- **Coefficients** (`norm_chebyshevCoeff_le_of_analyticOnEllipse`). If f is analytic on E_ρ,
  ρ > 1, and |f| ≤ M there, then |a₀| ≤ M and |a_k| ≤ 2Mρ⁻ᵏ for k ≥ 1 [T, Theorem 8.1, (8.1),
  p. 69].
- **Projections and interpolants** (`norm_sub_chebyshevProj_le_of_analyticOnEllipse`). Under the
  same hypotheses, for every n, |f − f_n| ≤ 2Mρ⁻ⁿ/(ρ − 1) and |f − p_n| ≤ 4Mρ⁻ⁿ/(ρ − 1) on
  [−1, 1] [T, Theorem 8.2, (8.2)–(8.3), p. 70]. Route: sum §5.2's coefficient bound in the
  expansions of §3.3; for n = 0, p₀ = f(1) and |T_k − 1| ≤ 2 give the same bound.

*Needs:* 3.3, 5.1.

**Checks.**

- f = 1/(x − 2): the singularity at α = 2 gives ρ < 2 + √3, and the coefficients decay like
  (2 + √3)⁻ᵏ.
- f constant M: a₀ = M, a_k = 0, f_n = f.
- Negative control: f(z) = z on E_ρ has M = (ρ + ρ⁻¹)/2 and a₁ = 1; the bound 2Mρ⁻¹ =
  1 + ρ⁻² holds, while Mρ⁻¹ = (1 + ρ⁻²)/2 < 1 would fail, so the factor 2 is needed.

### 5.3 Bernstein's converse

- **Geometric approximation gives analyticity** (`exists_analyticOnNhd_of_geometric_polyApprox`).
  If polynomials q_n of degree ≤ n satisfy |f − q_n| ≤ Cρ⁻ⁿ on [−1, 1], ρ > 1, then f extends
  analytically to E_ρ [T, Theorem 8.3, p. 73]. Route: q_n − qₙ₋₁ is bounded by 2Cρ¹⁻ⁿ on
  [−1, 1], so by Bernstein's lemma (§5.1) by 2C s^n ρ¹⁻ⁿ on E_s; the telescoping series
  converges locally uniformly on E_ρ.
- **Characterization** (`exists_geometric_polyApprox_iff`). f has geometrically convergent
  polynomial approximations iff it extends analytically to an open neighbourhood of [−1, 1]
  [T, Theorem 8.2 with Theorem 8.3, pp. 70–73]. Route: an open neighbourhood of [−1, 1] contains
  some E_ρ (compactness), and Theorem 8.2 on a slightly smaller ellipse gives the bound.

*Needs:* 5.1, 5.2.

**Checks.**

- q_n = Taylor sections of 1/(x − 2) at 0 have error ≤ 2⁻ⁿ; the converse gives analyticity on
  E₂, which is contained in the largest ellipse of analyticity, E_ρ with ρ = 2 + √3.
- Contrapositive: |x| is not analytic at 0, and accordingly its best errors are not geometric:
  by §4.2, E_n(|x|) ≥ ‖|x| − f_n‖/(4 + (4/π²) log(n + 1)), and with the projection errors of
  §3.4 this gives n E_n(|x|) ≥ 0.0955, 0.1164, 0.1159 for n = 2, 10, 20.

## Layer 6: Jackson, Favard and inverse theorems

### 6.1 Jackson's theorems with explicit constants

- **Periodic Jackson** (`exists_trigPoly_sub_le_jackson`). If g is 2π-periodic and `ContDiff ℝ k`,
  and g⁽ᵏ⁾ is α-Hölder with constant M, 0 < α ≤ 1, then for n ≥ 1 some trigonometric
  polynomial of degree at most n is within (1 + π²/2)ᵏ⁺¹ M/nᵏ⁺ᵅ of g on ℝ [HA, Theorem
  3.7.1, p. 159, stated without proof with a reference to Meinardus]. Route: the Jackson kernel
  gives E_n(g) ≤ (1 + π²/2) M n⁻ᵅ for k = 0, and for k ≥ 1 the reduction
  E_n(g) ≤ (π/2)(n + 1)⁻¹ E_n(g′) (Favard's estimate of §6.2 for the error of g′) is applied
  k times.
- **Algebraic Jackson** (`exists_polynomial_uniform_error_le_jackson`). If f is `ContDiffOn ℝ k`
  on [−1, 1] and its k-th derivative is α-Hölder with constant M, then for n > k,
  E_n(f) ≤ (1 + π²/2)ᵏ⁺¹ M/(n(n − 1)⋯(n − k + 1)(n − k)^α) [HA, Theorem 3.7.2, p. 159].
  Route: x = cos θ and the periodic theorem, with the derivative-of-polynomial reduction of
  degree.

These sharpen PolynomialInterpolationAndBestApproximation 5.2 (E_n(f) ≤ 6ω(f, 1/n) for
continuous f) by the smoothness order, and are the explicit-constant counterparts of the Jackson
theorem with an unspecified constant in ClassicalApproximationSpaces (its CA-C04).

*Needs:* PolynomialInterpolationAndBestApproximation 4.1 (`trigPoly`, local copy), 5.1–5.2.

**Checks.**

- k = 0, α = 1, M = 1, g = |sin θ|: E_n = 0.5, 0.125, 0.06762, 0.03469 for n = 1, 2, 4, 8,
  against (1 + π²/2)/n = 5.9348, 2.9674, 1.4837, 0.74185.
- g = sin θ, k = 1, α = 1, M = 1: E_n = 0 for n ≥ 1, below every bound.
- Negative control: n = k is excluded rightly. For f = |x|, k = 0, α = 1, M = 1 and n = 0 the
  denominator (n − k)^α is 0, Lean's junk value makes the right side 0, while E₀(|x|) = 1/2.

### 6.2 Favard's estimate

- **Favard** (`exists_trigPoly_sub_le_favard`). If u is 2π-periodic, m ≥ 1, and u⁽ᵐ⁻¹⁾ is
  B-Lipschitz, then some trigonometric polynomial of degree at most N − 1 is within
  (π/2) B/N^m of u on ℝ [DL, Ch. 7, Theorem 4.3, p. 214, with the Favard constants K_m ≤ π/2,
  p. 214; CHQZ, (5.1.11), p. 271, for the larger space spanned by e^(ijx), −N ≤ j < N].

*Needs:* PolynomialInterpolationAndBestApproximation 4.1.

**Checks.**

- m = 1, B = 1: the 2π/N-periodic zigzag of slope ±1 and amplitude π/(2N) has only frequencies
  divisible by N, so its best approximation of degree N − 1 is its mean and the error is
  π/(2N) = 1.5708, 0.7854, 0.5236, 0.3927 for N = 1, 2, 3, 4; the constant is sharp.
- |sin θ| (B = 1): E₀ = 0.5 ≤ π/2.
- Negative control: the constant 1 (instead of π/2) fails for the zigzag at N = 1.

### 6.3 Bernstein's inverse theorem

- **Inverse theorem** (`contDiff_and_holder_of_trigPoly_error_le`). If a continuous 2π-periodic g
  has best trigonometric errors at most M/nʳ⁺ᵅ for n ≥ 1, with r ≥ 1 and 0 < α < 1, then g is
  `ContDiff ℝ r` and g⁽ʳ⁾ is α-Hölder [DL, Ch. 7, Theorem 3.3 and the remark after it, p. 210, with
  Ch. 2, Theorem 9.1, p. 52, which identifies the class Lip*(r + α) for non-integer r + α]. Route:
  write g as the telescoping sum of the differences t(2ʲ⁺¹) − t(2ʲ) of best approximations t(n) of
  degree n; Bernstein's inequality (PolynomialInterpolationAndBestApproximation 4.1) bounds the r-th
  derivatives of the blocks by C 2⁻ʲᵅ, so g⁽ʳ⁾ exists and has errors O(n⁻ᵅ); the case r = 0
  (ClassicalApproximationSpaces CA-C07, transported from period 1 to period 2π) gives the Hölder
  condition.
- **Failure at α = 1** (`exists_trigPoly_error_le_not_lipschitz`). For every r there is a
  2π-periodic `ContDiff ℝ r` function with best errors O(n⁻ʳ⁻¹) whose r-th derivative is not
  Lipschitz. Route: the r-fold integral of the Weierstrass-type series Σ 2⁻ʲ cos(2^j θ), which
  lies in the Zygmund class but is not Lipschitz; the Zygmund half of CA-C07 and the periodic
  Jackson estimate of §6.1 for derivatives give the rate [DL, Ch. 2, p. 52, Example 1, for
  the distinction between the Zygmund and the Lipschitz class].

*Needs:* 6.1; PolynomialInterpolationAndBestApproximation 4.1; ClassicalApproximationSpaces
CA-C07.

**Checks.**

- g = cos θ: errors 0 for n ≥ 1; the conclusion holds for every r.
- Negative control: α = 1 is excluded from the first headline by the second.

## Layer 7: best rational approximation

### 7.1 Rational functions and the defect

- **The defect** (`rationalDefect`). For r ∈ Rₘₙ of exact type (μ, ν), d = min(m − μ, n − ν);
  for r = 0, d = n [T, p. 260, before Theorem 24.1].
- **Pole-free rational functions** (`IsRationalOn`, `rationalSet`). Rational functions of type
  (m, n) whose denominator in lowest terms (`RatFunc.num`, `RatFunc.denom`) does not vanish on
  [a, b], as elements of `C(Icc a b, ℝ)`.

*Needs:* Mathlib `RatFunc.num`, `RatFunc.denom`.

**Checks.**

- r = (1 − x²)/(1 + x²) in R₂₂: exact type (2, 2), d = 0; in R₃₂: d = min(1, 0) = 0; in
  R₃₃: d = 1.
- r = 0 in Rₘₙ: d = n, so m + n + 2 − d = m + 2.
- Negative control: x/x is the rational function 1 in `RatFunc ℝ`, of exact type (0, 0) and
  defect 1 in R₁₁; the unreduced quotient, of type (1, 1), would give defect 0.

### 7.2 Existence, uniqueness and equioscillation

- **Existence and uniqueness** (`exists_best_rational_uniform`). On [a, b] every
  continuous f has exactly one best uniform approximation in `rationalSet a b m n`
  [T, Theorem 24.1, p. 260, on [−1, 1], transported to [a, b] by the affine change of
  variable; Achieser, as cited there].
- **Equioscillation with defect** (`norm_sub_eq_infDist_rationalSet_iff`). A pole-free r of type
  (m, n) is the best approximation iff f − r equioscillates between m + n + 2 − d extreme points,
  d its defect [T, Theorem 24.1, (24.1), p. 260].

*Needs:* 1.4 (`Equioscillates`), 7.1.

**Checks.**

- n = 0: Rₘ₀ is the polynomials of degree ≤ m, a nonzero polynomial of exact degree μ ≤ m has
  defect min(m − μ, 0) = 0 there, and the theorem is the polynomial alternation theorem with
  m + 2 points.
- f = x² on [−1, 1], (m, n) = (1, 1): the best approximation is even (by uniqueness), and the
  only even elements of R₁₁ are constants; it is the constant 1/2, of defect 1, and x² − 1/2
  equioscillates at the m + n + 2 − d = 3 points −1, 0, 1 (a numerical minimization over
  R₁₁ returns error 0.5 at a quotient equal to 1/2).
- Negative control: a criterion without the defect (always m + n + 2 = 4 points) would reject
  the true best approximation in the example above.

## Layer 8: Padé approximants and the Padé table

### 8.1 Padé pairs, the Padé approximant and the Baker approximant

- **Padé pair** (`IsPadePair`). p, q ∈ K[X] with deg p ≤ m, deg q ≤ n, q ≠ 0 and
  p − fq = O(zᵐ⁺ⁿ⁺¹) [T, (27.5), p. 309].
- **Padé approximant** (`pade`). The rational function p/q of any Padé pair [T, Theorem 27.3,
  p. 311].
- **Baker approximant** (`IsBakerPade`). A/B with B(0) = 1 and A − fB = O(zᵐ⁺ⁿ⁺¹)
  [BGM, (4.6)–(4.7), p. 21].
- **Hankel determinant** (`coeffZ`, `padeHankel`). C(m/n) is the determinant of the n × n
  matrix with entries cₘ₋ₙ₊ᵢ₊ⱼ₊₁, 0 ≤ i, j < n, where c_k = 0 for k < 0 [BGM, (4.8), p. 22].

*Needs:* Mathlib power series and `RatFunc`.

**Checks.**

- f = e^z: [1/1] = (2 + z)/(2 − z), and C(m/n) ≠ 0 for 0 ≤ m, n ≤ 2 (C(2/2) = −1/12).
- f = cos z: C(1/1) = c₁ = 0, and the Baker [1/1] does not exist; the Padé approximant r₁₁ = 1.
- n = 0: the Hankel matrix is empty with determinant 1, and [m/0] is the Taylor section.

### 8.2 Existence, uniqueness and lowest terms

- **Existence and uniqueness** (`exists_padePair_and_eq_cross`). Padé pairs exist and any two
  give the same rational function, p Q = P q [T, Theorems 27.1 and 27.3, pp. 307, 311]. Route:
  n homogeneous linear equations in n + 1 unknown coefficients of q; for two pairs,
  pQ − Pq = O(zᵐ⁺ⁿ⁺¹) has degree ≤ m + n.
- **Lowest terms** (`pade_lowest_terms`). In lowest terms rₘₙ = p̂/q̂ with q̂(0) ≠ 0 and of type
  (m, n), and every Padé pair is (c p̂, c q̂) with deg c at most the defect [T, Theorem 27.4,
  (27.12), pp. 312–313]. The source also shows c is divisible by z^λ, λ the deficiency; that
  refinement is not stated.

*Needs:* 7.1 (`rationalDefect`), 8.1.

**Checks.**

- f = cos z, (m, n) = (1, 1): the pairs are (1, 1) and (z, z) up to scaling, c ∈ {1, z} of degree
  ≤ d = 1.
- Negative control: q(0) can vanish for a pair (q = z for cos z), but not for q̂.

### 8.3 Characterization by order of contact

- **Characterization** (`eq_pade_iff`). r ∈ Rₘₙ with r regular at 0 is rₘₙ iff
  f − r = O(zᵐ⁺ⁿ⁺¹⁻ᵈ), d the defect of r [T, Theorem 27.1, p. 307].

*Needs:* 8.2.

**Checks.**

- cos z, (1, 1): r = 1 has d = 1 and cos z − 1 = O(z²) = O(z¹⁺¹⁺¹⁻¹).
- r = 0: d = n and the condition is f = O(zᵐ⁺¹).
- Negative control: without the defect (order m + n + 1 always), r = 1 for cos z at (1, 1) would
  be rejected, since cos z − 1 is not O(z³).

### 8.4 The Baker approximant

- **Baker exists iff the order is full** (`exists_isBakerPade_iff`). The Baker approximant [m/n]
  exists iff f − rₘₙ = O(zᵐ⁺ⁿ⁺¹) (in lowest-terms form), it then equals rₘₙ, and it
  exists whenever C(m/n) ≠ 0 [BGM, Theorem 1.4.3, p. 28, and (4.8), p. 22]. Route for the
  first part: a Baker pair is a Padé pair, so A/B = rₘₙ, and B(0) = 1 forces the lowest-terms
  denominator to be a unit at 0.

*Needs:* 8.2.

**Checks.**

- e^z: C(m/n) ≠ 0 and every [m/n] exists for m, n ≤ 2 (verified symbolically).
- cos z, (2, 1): C(2/1) = c₂ = −1/2 ≠ 0 and [2/1] = 1 − z²/2 exists.
- Negative control: cos z at (1, 1), C = 0 and no Baker approximant; the converse of the Hankel
  criterion fails in general (C = 0 with a Baker approximant occurs inside blocks).

### 8.5 Square blocks

- **Block structure** (`pade_eq_iff_mem_block`). If a nonzero entry r of exact type (λ, μ) has
  f − r of exact order λ + μ + k + 1, then rₘₙ = r exactly for λ ≤ m ≤ λ + k,
  μ ≤ n ≤ μ + k, and on that square the Baker approximant exists exactly when
  m + n ≤ λ + μ + k [T, Theorem 27.2, p. 308; BGM, Theorem 1.4.3, p. 28].
- **Rational functions** (`pade_eq_of_rational`). A rational f = p₀/q₀ in lowest terms with
  q₀(0) ≠ 0 is its own approximant rₘₙ for m ≥ deg p₀, n ≥ deg q₀ [T, Theorem 27.2, p. 308,
  the infinite block].

*Needs:* 8.3, 8.4; Mathlib `PowerSeries.order`.

**Checks.**

- cos z: r = 1 has (λ, μ) = (0, 0) and cos z − 1 has exact order 2 = 0 + 0 + 1 + 1, so k = 1 and
  r₀₀ = r₀₁ = r₁₀ = r₁₁ = 1 (all computed); Baker exists at (0,0), (0,1), (1,0) and
  not at (1,1), where m + n = 2 > 1.
- (1 + 2z + z² + z³)/(1 + z + z³), the BGM example: its own approximant for m, n ≥ 3.
- Negative control: r₀₂ = 2/(2 + z²) ≠ 1 for cos z; the block is exactly 2 × 2.

## Layer 9: the theorem of de Montessus de Ballore

- **Maclaurin series** (`maclaurin`) of a complex function at 0.
- **de Montessus de Ballore** (`exists_pade_row_tendstoUniformlyOn`). Let f = H/Q on the closed
  disk of radius R > 0, H analytic on a neighbourhood of it, Q(0) ≠ 0, deg Q = M, the zeros of Q
  in the open disk and H nonzero at them. Then the Baker approximants [L/M] exist for all large L
  and converge to f uniformly on every compact subset of the closed disk on which Q does not
  vanish [BGM, Theorem 6.2.1, p. 282, for simple poles, with its proof, pp. 283–286, and
  Theorem 6.2.2, pp. 286–287, for poles of higher multiplicity; T, p. 321]. Route: the
  denominators of [L/M], normalized, converge to Q (BGM (2.23), p. 285, from the Hankel
  determinants of the row), and the error formula (2.26), p. 286, gives the convergence.

*Needs:* 8.4.

**Checks.**

- f = e^z/(1 − z), M = 1: the pole of [L/1] is 0.9375, 0.999489, 0.99999999, 1 for
  L = 2, 5, 10, 20, and |f − [L/1]| at z = 2 is 3.57, 0.211, 1.13·10⁻⁴, 8.6·10⁻¹⁴
  (at z = 2.5i: 0.612, 0.0955, 1.85·10⁻⁴, 1.46·10⁻¹²).
- M = 0: Q constant, the row is the Taylor sections, and the theorem is Taylor's theorem on the
  disk.
- Negative control: the denominator degree must be the number of poles. For f = e^z/(1 − z)
  the row M = 0, the Taylor sections, diverges at z = 2, where |f(2) − T_L(2)| = 22.39, 174.0,
  5567, 5.70·10⁶ for L = 2, 5, 10, 20.

## Layer 10: Stieltjes series

### 10.1 Stieltjes functions and series

- **Stieltjes function** (`stieltjesFun`) and **Stieltjes series** (`stieltjesSeries`)
  [BGM, §5.1, (1.1)–(1.2), p. 193].
- **Analyticity and remainder** (`analyticOnNhd_stieltjesFun`). For μ an orthogonality measure on
  [0, ∞), the Stieltjes function is analytic on `Complex.slitPlane` and equals the N-th section of
  the series plus (−z)^N ∫ u^N/(1 + zu) dμ. Route:
  1/(1 + zu) = Σ_(j<N) (−zu)^j + (−zu)^N/(1 + zu), and |1 + zu| is bounded below for u ≥ 0 off
  the cut.

*Needs:* SpecialFunctionsOrthogonalPolynomialsGeneral 2.1 (`IsOrthogonalityMeasure`, local copy).

**Checks.**

- μ = Lebesgue on [0, 1]: f(z) = log(1 + z)/z, moments 1/(j + 1).
- Negative control: z = −2 for μ on [0, 1] lies on the cut, where 1 + zu vanishes at u = 1/2.

### 10.2 Existence and poles

- **Existence** (`exists_padePair_of_stieltjes`). Every Baker approximant [L/M] with M ≤ L + 1
  exists [BGM, Theorem 5.1.2, Corollary 1, p. 199]. Route: the Hankel determinants C(L/M) are,
  up to sign, the Hankel determinants of the moments of uᴸ⁻ᴹ⁺¹ dμ, positive by
  HankelFormsAndRealMomentProblems 3.1; then §8.4.
- **Poles** (`poles_isBakerPade_stieltjesSeries`). For M ≤ L + 1 the denominator has degree M and
  simple negative zeros, and the residues A(t_i)/B′(t_i) are positive [BGM, Theorem 5.2.1,
  p. 201]. Route: B(z) = z^M q_M(−1/z) for the monic orthogonal polynomial q_M of the measure
  uᴸ⁻ᴹ⁺¹ dμ, whose zeros are real, simple and positive
  (SpecialFunctionsOrthogonalPolynomialsGeneral 5.1); the residues are Christoffel numbers
  (5.3) up to positive factors.

*Needs:* 8.4, 10.1; SpecialFunctionsOrthogonalPolynomialsGeneral 5.1, 5.3;
HankelFormsAndRealMomentProblems 3.1.

**Checks.**

- μ = Lebesgue on [0, 1]: [0/1] has pole −2 and residue 2; [1/2] has poles −4.732051, −1.267949
  with residues 2.366025, 0.633975; [3/3] has poles −4.709416, −1.693385, −1.097199 with residues
  1.548665, 0.657361, 0.241891.
- M = 0: [L/0] is the Taylor section and exists; the pole statement is vacuous.
- Negative control for the infinite support: μ = δ₁ + δ₂ has the rational Stieltjes function
  1/(1 + z) + 1/(1 + 2z), of type (1, 2), so the Baker approximant [2/3] exists and equals it,
  with a denominator of degree 2, not 3.

### 10.3 Paradiagonal convergence

- **Convergence** (`tendstoUniformlyOn_isBakerPade_stieltjesSeries`). For fixed j ≥ 0, the
  approximants [M + j − 1/M] converge as M → ∞, uniformly on every bounded set at positive
  distance from (−∞, 0], to a function analytic on `Complex.slitPlane` [BGM, Theorem 5.2.6,
  p. 211, with its region 𝒟(Δ)]. The limit may depend on j when the moment problem is
  indeterminate.

*Needs:* 10.2.

**Checks.**

- μ = Lebesgue on [0, 1], z = 1: [0/1], [1/1], [1/2], [2/2], [3/3] give 0.666667, 0.7, 0.692308,
  0.693333, 0.693152 against log 2 = 0.693147.
- The even and odd paradiagonals bracket the limit at z = 1 (0.692308 < log 2 < 0.693333).

### 10.4 Convergence to the Stieltjes function

- **Positive radius** (`tendstoUniformlyOn_stieltjesFun_of_radius`). If μ is concentrated on
  [0, 1/R], R > 0, the poles of the paradiagonal approximants lie in (−∞, −R) and the
  approximants converge to the Stieltjes function on bounded sets at positive distance from
  (−∞, 0] [BGM, Theorems 5.4.1, p. 220, and 5.4.2, p. 221]. Route: compact support makes the
  moment problem determinate (SpecialFunctionsOrthogonalPolynomialsGeneral 7.4) and the poles are
  the reciprocals of the orthogonal-polynomial zeros in (0, 1/R) (5.1); for j = 0 the
  approximants are the J-fraction convergents of 9.2 and 9.3 of the same roadmap.
- **Carleman's condition** (`tendstoUniformlyOn_stieltjesFun_of_carleman`). If
  Σ_j μ_j^(−1/(2j)) = ∞, the paradiagonal approximants converge to the Stieltjes function
  [BGM, Theorem 5.5.1, p. 240, with Carleman's criterion, p. 239].

*Needs:* 10.3; SpecialFunctionsOrthogonalPolynomialsGeneral 5.1, 7.4, 9.2, 9.3.

**Checks.**

- μ = Lebesgue on [0, 1] (R = 1): all poles above lie below −1, and the approximants tend to
  log(1 + z)/z.
- μ = e⁻ᵘ du on [0, ∞) (moments j!): Σ (j!)^(−1/(2j)) diverges (terms ∼ √(e/j)), so Carleman
  applies though the radius is 0.
- Negative control: the moments of a lognormal measure grow like e^(j²/2), Σ μ_j^(−1/(2j))
  converges, and the moment problem is indeterminate; the theorem rightly assumes divergence.

## Downstream consumers

- Quadrature: the Gauss and Clenshaw–Curtis error rates on [−1, 1] for functions of bounded
  variation and analytic functions use the Chebyshev coefficient bounds of §§3.4 and 5.2 and the
  aliasing of §3.3.
- Spectral methods: Chebyshev collocation and Galerkin error estimates use the projection and
  interpolant bounds of Layers 3–5 and the Jackson and Favard estimates of Layer 6.
- Rational and Padé methods for differential equations and acceleration of series use Layers 8–10.

## Scope and ownership

The roadmap is complete when Tau Ceti proves every statement of `Suggested.lean` and the prose
targets of the layers above.

Inputs:
- [PolynomialInterpolationAndBestApproximation][PIBA]:
  the error of best approximation (2.1), Lebesgue functions and constants (3.1), trigonometric
  polynomials and Bernstein's inequality (4.1), the modulus of continuity and Jackson's theorem
  for continuous functions (5.1–5.2).
- [RungePhenomenonAndLebesgueConstants][RPL]: the Lebesgue constant as the norm of the interpolation
  operator (2.1).
- [ClassicalApproximationSpaces][CAS]: the Hölder and Zygmund characterizations of periodic rates
  (CA-C07).
- [SpecialFunctionsOrthogonalPolynomialsGeneral][OPG]:
  orthogonality measures (2.1), zeros (5.1), Gauss quadrature (5.3), determinacy (7.4), the
  J-fraction and Markov's theorem (9.2–9.3).
- [HankelFormsAndRealMomentProblems][HANKEL]: Stieltjes's
  theorem (3.1).
- Mathlib's Chebyshev polynomials, measure and nodes; Tau Ceti's Chebyshev Hilbert basis.

Owned here:
- Haar spaces on topological spaces, their characterizations, Mairhuber–Curtis, alternation and
  de la Vallée Poussin in a Haar space on an interval, and Haar's theorem;
- best approximation by real trigonometric polynomials on the circle and by complex polynomials
  on [−1, 1];
- Chebyshev coefficients, projections and interpolants, aliasing, the error expansions, and the
  bounded-variation and analytic rates with Bernstein ellipses and Bernstein's converse;
- the Lebesgue constant of the Chebyshev projection, near-best approximation by it, the lower
  bound for projections onto the polynomials, the node-independent logarithmic lower bound and
  Faber's theorem;
- Jackson's theorems with explicit constants for smooth functions, Favard's estimate, and
  Bernstein's inverse theorem for r ≥ 1 with the counterexample at α = 1;
- best rational approximation with defect; the Padé table, Baker approximants, Hankel
  determinants and block structure; de Montessus de Ballore; Padé approximants of Stieltjes
  series.

Not owned:
- polynomial interpolation, polynomial alternation and uniqueness, the Lebesgue constant of the
  Chebyshev roots, Bernstein's and Markov's inequalities, Jackson for continuous functions
  (PolynomialInterpolationAndBestApproximation);
- Hermite interpolation, the Lebesgue constant as an operator norm, equispaced and Chebyshev-root
  lower bounds, Runge's phenomenon (RungePhenomenonAndLebesgueConstants);
- approximation spaces, Besov spaces, Jackson and Bernstein inequalities in L_p with unspecified
  constants, Stechkin's inverse theorem and the r = 0 Hölder and Zygmund characterizations
  ([ClassicalApproximationSpaces][CAS], and the abstract theory of [ApproximationSpaces][AS]);
- orthogonal polynomials, Gauss quadrature, continued fractions and moment problems
  (SpecialFunctionsOrthogonalPolynomialsGeneral, HankelFormsAndRealMomentProblems).

Boundary in one sentence: this roadmap owns uniform approximation results on an interval that
need Chebyshev series, Haar spaces other than the polynomials, or rational functions; the
polynomial theory with its classical inequalities and the L_p and Besov theory stay with their
owners.

## Exact supplier contracts

### From [PolynomialInterpolationAndBestApproximation][PIBA]

- 2.1: the definitions `polyDegLE` and `bestApproxError`, copied verbatim (§§4.2, 6.1).
- 3.1: the definitions `lebesgueFunction` and `lebesgueConstant`, copied verbatim (§4.4).
- 4.1: the definition `trigPoly`, copied verbatim (Layer 6), and Bernstein's inequality for
  trigonometric polynomials in the supremum norm (§6.3).
- 5.1–5.2: the modulus of continuity and E_n(f) ≤ 6ω(f, 1/n), compared in §6.1.

### From [RungePhenomenonAndLebesgueConstants][RPL]

- 2.1: for nodes in [a, b], the interpolant satisfies ‖p_f‖ ≤ Λ‖f‖ with Λ the Lebesgue
  constant of the polynomial roadmap, and the bound is attained; so Λ is the operator norm of
  interpolation (§4.4).

### From [ClassicalApproximationSpaces][CAS]

- CA-C07 at d = 1 and p = ∞: for 0 < α < 1, E_n(f) = O(n⁻ᵅ) iff f is α-Hölder, and
  E_n(f) = O(1/n) iff f is in the Zygmund class; consumed on the circle of length 2π by the
  rescaling θ = 2πt and for real functions as real parts (§6.3).

### From [SpecialFunctionsOrthogonalPolynomialsGeneral][OPG]

- 2.1: the definition `IsOrthogonalityMeasure`, copied verbatim (Layer 10).
- 5.1: the zeros of the monic orthogonal polynomials are real, simple and in the interior of the
  convex hull of the support (§10.2, §10.4).
- 5.3: Gauss quadrature with positive Christoffel numbers (§10.2).
- 7.4: determinacy for compact support (§10.4).
- 9.2–9.3: the J-fraction as a partial fraction and Markov's theorem (§10.4).

### From [HankelFormsAndRealMomentProblems][HANKEL]

- 3.1: Stieltjes's theorem, positivity of the Hankel determinants of the moments and of the
  shifted moments of a measure on [0, ∞) with infinite support (§10.2).

### From Mathlib and Tau Ceti

- Mathlib: `Polynomial.Chebyshev.T_real_cos`, `Polynomial.Chebyshev.node`,
  `Polynomial.Chebyshev.measureT`, `Polynomial.Chebyshev.integral_measureT_eq_integral_cos`,
  `Polynomial.toContinuousMapOnAlgHom`, `Polynomial.degreeLT`, `Matrix.det_vandermonde_ne_zero_iff`,
  `Lagrange.basis`, `Lagrange.interpolate`, `Metric.infDist`, `fourier`,
  `AbsolutelyContinuousOnInterval`, `eVariationOn`, `Complex.slitPlane`, `RatFunc.num`,
  `RatFunc.denom`, `PowerSeries.order`, `banach_steinhaus`.
- Tau Ceti: `TauCeti.chebyshevTHilbertBasis`, `TauCeti.hasSum_chebyshevT_expansion`.

## Beyond this roadmap

These topics are not targets here; each is material for a further roadmap built on this one.

- The sharp node-independent bound Λ_n ≥ (2/π) log(n + 1) + 0.52125… of Erdős and Brutman, and the
  bound Λ_n ≤ (2/π) log(n + 1) + 1 for the Chebyshev points with the near-best factor
  2 + (2/π) log(n + 1) of the interpolant [T, Theorems 15.2 and 16.1, (15.7), (15.8a), (16.2),
  pp. 137, 154]; Trefethen cites them without proof.
- The Chebyshev barycentric formula and its stability [T, Chapter 5].
- Newman's theorem on the rational approximation of |x| and the Stahl asymptotics [T,
  Chapter 25].
- Rational interpolation, the Walsh and Gonchar–Rakhmanov theory, Nuttall–Pommerenke convergence
  in capacity [BGM, Chapter 6].
- Multipoint Padé, Chebyshev–Padé and Carathéodory–Fejér approximation [T, Chapters 20, 27].
- The full characterization of Padé pairs with the deficiency factor z^λ [T, Theorem 27.4,
  pp. 312–313].

## Prior formalization

[lean-NASC](https://github.com/bjbraams/lean-NASC) at commit 92a6dba (Apache-2.0), by the
author of this roadmap, states several targets of this roadmap in `NASC/Approximation.lean` and
proves one without `sorry`:

- §1.1: NASC.isHaarSpace_iff_forall_eq_zero, for the same definition NASC.IsHaarSpace.

The same module states, with `sorry`, the counterparts of §4.4 (Faber, without the unbounded
Lebesgue constants), §6.1 (algebraic Jackson, for globally smooth f), §5.2 and §5.3 (analytic
coefficients and Bernstein's converse), §7.2 (existence on [a, b]), §8.2 (Padé pairs for a
coefficient sequence), Layer 9 and §10.2 (existence); the names here follow it.

## References

- [T] L. N. Trefethen, *Approximation Theory and Approximation Practice*, SIAM (1st ed. 2013,
  extended ed. 2019), Chapters 3–4, 7–8, 10, 15–16, 24, 27. Theorem, equation and page numbers
  are those of the author's manuscript dated January 30, 2018.
- [DL] R. A. DeVore, G. G. Lorentz, *Constructive Approximation*, Grundlehren 303, Springer,
  1993, Chapters 2–4, 7, 9.
- [BGM] G. A. Baker, Jr., P. Graves-Morris, *Padé Approximants*, 2nd ed., Encyclopedia of
  Mathematics and its Applications 59, Cambridge University Press, 1996, Chapters 1, 5, 6.
- [W] H. Wendland, *Scattered Data Approximation*, Cambridge University Press, 2004, §2.1.
- [HA] W. Han, K. Atkinson, *Theoretical Numerical Analysis*, 3rd ed., Springer, 2009, §3.7.
- [CHQZ] C. Canuto, M. Y. Hussaini, A. Quarteroni, T. A. Zang, *Spectral Methods: Fundamentals in
  Single Domains*, Springer, 2006, §5.1.

[PIBA]: ../PolynomialInterpolationAndBestApproximation/README.md
[OPG]: ../SpecialFunctionsOrthogonalPolynomialsGeneral/README.md
[HANKEL]: ../HankelFormsAndRealMomentProblems/README.md
[RPL]: ../RungePhenomenonAndLebesgueConstants/README.md
[CAS]: ../ClassicalApproximationSpaces/README.md
[AS]: ../ApproximationSpaces/README.md
