# Roadmap: the circle method and Vinogradov's three-primes theorem

This roadmap develops the Hardy–Littlewood circle method for three primes over `ℕ`. It bounds
exponential sums over primes on the minor arcs by Vaughan's identity and bilinear estimates,
evaluates them on the major arcs from Siegel–Walfisz in residue classes, and proves the singular
series and singular integral facts that the asymptotic formula needs. The headline is
**Vinogradov's theorem**: every sufficiently large odd integer is a sum of three primes, together
with the asymptotic count of representations weighted by the singular series.

Everything here is over the rational integers. The roadmap owns no sieve, no large sieve, no
L-function and no zero of an L-function. Vaughan's identity is consumed from
`SieveMethodsAndPrimePatterns`, and Siegel–Walfisz from `AnalyticNumberTheoryPartI`. The second input
is also stated here as the proposition `SiegelWalfiszBound`, so that Layers 3 and 4 are stated and
proved against it, and Layer 4.9 discharges it.

Suggested home: `TauCeti/NumberTheory/CircleMethod/`. [`Suggested.lean`](Suggested.lean) states the
milestones against Mathlib; it is not the roadmap.

---

## Scope and boundaries

### Owned here

- the additive character `e(α) = exp(2πiα)` on `ℝ`, the distance to the nearest integer, geometric
  sums and orthogonality on `[0, 1]`;
- Ramanujan sums;
- the type I and type II bilinear estimates for additive twists, for arbitrary coefficients;
- Vinogradov's minor-arc bound for `∑ Λ(n) e(nα)`, and Parseval for this sum;
- the major-arc approximation of `∑ Λ(n) e(nα)`;
- the circle method for three primes: the integral representation, the major and minor arcs, the
  singular series and the singular integral, the asymptotic formula for the weighted count, and
  Vinogradov's three-primes theorem.

### Consumed, not redefined

From Mathlib (exact contracts in the supplier table below): `ArithmeticFunction` with `vonMangoldt`
and `moebius`, `Chebyshev.psi` and its upper bound, `Nat.totient`, Dirichlet's approximation theorem
`Real.exists_int_int_abs_mul_sub_le`, Abel summation `sum_mul_eq_sub_sub_integral_mul`, interval
integrals, `HasProd` and `Real.fourierChar`.

From `SieveMethodsAndPrimePatterns`, Layer 2 §2.4: Vaughan's identity and its coefficient energies.

From `AnalyticNumberTheoryPartI`, §0.32: Siegel–Walfisz for `ψ` in reduced residue classes.

### Not owned here

- every sieve, the large sieve, Vaughan's identity, dyadic bilinear character estimates and the
  Bombieri–Vinogradov theorem (`SieveMethodsAndPrimePatterns`). The bilinear estimates here are
  additive twists and are not in that roadmap;
- Davenport's uniform Möbius exponential cancellation and the Möbius form of Vaughan's identity
  (`AnalyticNumberTheoryPartI`, §1.2). The type I and type II bounds of Layer 1 have arbitrary
  coefficients and supply a route to its Möbius estimates; this roadmap states no Möbius exponential sum;
- zero-free regions, Siegel's theorem, the prime number theorem with an error term and the proof of
  Siegel–Walfisz (`ImaginaryQuadraticClassNumber`, `ZerosOfLFunctions`, `AnalyticNumberTheoryPartI`);
- contour integration and residues (`ContourIntegration`): the circle method here integrates over
  `[0, 1]` with Mathlib's interval integral and uses no contour.

### Not part of this roadmap

The binary Goldbach problem and its exceptional-set estimates, Waring's problem and Weyl sums of
polynomial phases, the Hardy–Littlewood prime-tuples asymptotics, and every explicit or effective
form of the three-primes theorem (Helfgott's ternary Goldbach theorem and all numerical values of
`N₀`). The three-primes theorem here has an existential threshold `N₀`.

---

## Exact supplier contracts

### Mathlib

| Declaration | Use here |
| --- | --- |
| `ArithmeticFunction.vonMangoldt` | `Λ`, real-valued, `Λ 0 = 0`. Every prime sum in this roadmap is a sum of `Λ`, `Real.log p · 1_{p prime}` or `1_{p prime}` over an explicit `Finset` |
| `ArithmeticFunction.moebius` | `μ`, integer-valued, `μ 0 = 0`; cast to `ℝ` or `ℂ` at the use site |
| `Chebyshev.psi`, `Chebyshev.psi_le_const_mul_self` | `ψ` with the Pinned cutoffs and `ψ(x) ≤ C x` |
| `Nat.totient` | `φ` |
| `Real.exists_int_int_abs_mul_sub_le` | Dirichlet's approximation theorem: for `n ≥ 1` there are `j, k` with `0 < k ≤ n` and `|kξ − j| ≤ 1/(n+1)`; it places every `α` on a major or a minor arc in Layer 4 |
| `sum_mul_eq_sub_sub_integral_mul` | Abel summation |
| `HasProd` over `Nat.Primes` | the Euler product of the singular series |
| `Real.fourierChar` | `e(α)` is its coercion to `ℂ`; Layer 0.1 proves the comparison |

### `SieveMethodsAndPrimePatterns`

| Declaration | Use here |
| --- | --- |
| `SieveVaughan.vaughan_identity`, §2.4 | for natural `U, V` and `n ≥ 1`, `Λ(n) = 1_{n ≤ V} Λ(n) + ∑_{b ∣ n, b ≤ U} μ(b) log(n/b) − ∑_{b ∣ n, b ≤ U} μ(b) ∑_{c ∣ n/b, c ≤ V} Λ(c) + ∑_{b ∣ n, U < b} μ(b) ∑_{c ∣ n/b, V < c} Λ(c)`; the decomposition of Layer 2.1 |
| incomplete logarithm `λ_V`, §2.4 | `λ_V(n) = ∑_{d ∣ n, V < d} Λ(d)`, with `0 ≤ λ_V(n) ≤ log n`; the long coefficient of Layer 2.1 |
| coefficient energies, §2.4 | `∑_{ℓ ∈ Ioc(L, M)} λ_V(ℓ)² ≤ (M − L)(log M)²` for `L ≤ M` |

### `AnalyticNumberTheoryPartI`

| Declaration | Use here |
| --- | --- |
| `siegel_walfisz`, §0.32 | for each `A, B > 0` there is `C > 0` such that eventually in `x`, for every `q > 0` with `q ≤ (log x)^B` and `a` a unit modulo `q`, `|ψ(x; q, a) − x/φ(q)| ≤ C x (log x)^{−A}`. The constant and threshold may be ineffective. Layer 4.9 restates it as `SiegelWalfiszBound` |

### The proposition `SiegelWalfiszBound`

| Proposition | Exact statement | Use here |
| --- | --- | --- |
| `SiegelWalfiszBound` | For all `A, B > 0` there is `C` such that for every real `x ≥ 2`, every `q ≥ 1` with `q ≤ (log x)^B` and every unit `a` modulo `q`, `|ψ(x; q, a) − x/φ(q)| ≤ C x (log x)^{−A}`. The constant `C` depends on `A` and `B` and is not computable from the proof | Layer 3, and through it Layer 4 |

A logarithmic saving is all the circle method uses. The theorems of Layers 3 and 4 take this
proposition as a hypothesis, so that those layers can be built and reviewed without importing the
supplier; Layer 4.9 supplies it.

---

## Pinned conventions

| Subject | Convention |
| --- | --- |
| cutoffs | A sum over `n ≤ x` for real `x` is over `Finset.Ioc 0 ⌊x⌋₊`; a sum over `n ≤ N` for natural `N` is over `Finset.Icc 1 N`. The index `0` is never included. `ψ(x) = ∑_{n ≤ x} Λ(n)`. |
| residue classes | `ψ(x; q, a) = ∑_{n ≤ x, (n : ZMod q) = a} Λ(n)` with `a : ZMod q`; coprimality is `IsUnit a`, as in Mathlib's Dirichlet theorem. |
| additive character | `e(α) = Complex.exp (2 * π * I * α)` for `α : ℝ`, equal to `(Real.fourierChar α : ℂ)`. |
| distance to `ℤ` | `‖α‖ = |α − round α|`, Mathlib's `round`. |
| reciprocal of `‖α‖` | Every bound of the shape `min(X, 1/‖α‖)` is stated with the value `X` when `‖α‖ = 0`, by an explicit `if`. Lean's `1/0 = 0` would make the minimum `0`, and the geometric-sum bound false at integers (rejection test 4). |
| uniformity | A bound uniform in a parameter (the modulus `q`, the point `α`) is stated with its constants quantified before that parameter: `∃ C, ∀ q x, …`. `Asymptotics.IsBigO` along `atTop` is used only for statements in one variable. A family of `IsBigO` statements indexed by `q` does not supply Siegel–Walfisz (rejection test 5). |
| ineffective constants | An ineffective constant is an existential. Nothing asserts computability, and no statement depending on `SiegelWalfiszBound` exhibits a numerical constant. |
| circle integrals | Integrals over `ℝ/ℤ` are `∫ α in (0 : ℝ)..1`, with orthogonality `∫₀¹ e(mα) dα = 1_{m = 0}` for `m : ℤ`. |
| three-primes count | `r(N) = ∑_{n₁ + n₂ + n₃ = N, nᵢ ≥ 1} Λ(n₁) Λ(n₂) Λ(n₃)`; `R(N)` is the number of ordered triples of primes with sum `N`. |
| singular series | `𝔖(N) = ∑_{q ≥ 1} μ(q) c_q(N) / φ(q)³`, `c_q` the Ramanujan sum, with Euler product `∏_{p ∣ N} (1 − (p − 1)⁻²) ∏_{p ∤ N} (1 + (p − 1)⁻³)`. |

---

## Export contract

| Object or theorem | Layer | Required declaration | Contract |
| --- | ---: | --- | --- |
| additive character | 0 | `expTwoPiI`, `expTwoPiI_eq_fourierChar`, `norm_sum_expTwoPiI_le` | `e`, its identification with `Real.fourierChar`, and `|∑_{n=1}^N e(nβ)| ≤ min(N, 1/(2‖β‖))` |
| Ramanujan sums | 0 | `ramanujanSum`, `ramanujanSum_eq_sum_divisors`, `ramanujanSum_mul` | `c_q(n) = ∑_{d ∣ (q, n)} d μ(q/d)` and multiplicativity in `q` |
| bilinear estimates | 1 | `sum_min_inv_distInt_le`, `norm_typeII_le` | the type I and type II bounds of 1.1–1.2 |
| exponential sums over primes | 2 | `primeExpSum`, `norm_primeExpSum_le`, `integral_norm_sq_primeExpSum` | Vinogradov's bound `(N q^{-1/2} + N^{4/5} + (Nq)^{1/2}) (log N)^4` and Parseval |
| major arcs | 3 | `psiAP`, `SiegelWalfiszBound`, `primeExpSum_majorArc` | the approximation of 3.2 |
| circle method | 4 | `singularSeries`, `singularSeries_hasProd`, `singularSeries_eq_zero_of_even`, `singularSeries_lower_bound_of_odd`, `threePrimeWeight`, `threePrimeWeight_eq_integral`, `threePrimeWeight_asymptotic` | `r(N) = ½ 𝔖(N) N² + O_A(N² (log N)^{−A})` |
| Vinogradov's theorem | 4 | `threePrimeCount_asymptotic`, `vinogradov_threePrimes`, `siegelWalfiszBound`, `vinogradov_threePrimes_unconditional` | `R(N) ∼ 𝔖(N) N² / (2 (log N)³)` over odd `N`, and every sufficiently large odd `N` is a sum of three primes |

---

## The build, in layers

### Layer 0: the additive toolkit

**0.1 The additive character and geometric sums.** Define `expTwoPiI α = e(α)` and prove
`expTwoPiI_eq_fourierChar`, periodicity, `e(α + β) = e(α) e(β)`, `|e(α)| = 1`, conjugation, and the
orthogonality `∫₀¹ e(mα) dα = 1_{m = 0}` for `m : ℤ`. Define `distInt α = |α − round α|` and prove
`distInt` is `1`-periodic, even, at most `1/2`, and `2‖α‖ ≤ |sin(πα)|`. Prove
`|∑_{n=1}^N e(nβ)| ≤ min(N, 1/(2‖β‖))` with the Pinned convention at `‖β‖ = 0`, and the identity
`∑_{n=1}^N e(nβ) = e(β)(e(Nβ) − 1)/(e(β) − 1)` off the integers.

**0.2 Ramanujan sums.** Define `ramanujanSum q n = ∑_{0 ≤ b < q, gcd(b, q) = 1} e(bn/q)`
for `q ≥ 1` and `n : ℤ`. Prove `c_q(n) = ∑_{d ∣ q, d ∣ n} d μ(q/d)`, hence `c_q(n)` is an integer,
`c_q(0) = φ(q)`, `c_q(1) = μ(q)`, `c_q(n) = μ(q)` when `gcd(n, q) = 1`, `|c_q(n)| ≤ gcd(n, q)`,
multiplicativity in `q` for coprime moduli, `c_p(n) = p − 1` or `−1` according as `p ∣ n`, and
`c_{p^k}(n) = 0` for `k ≥ 2` and `p ∤ n`.

*Needs:* Mathlib `Real.fourierChar`, `ArithmeticFunction.moebius`, `Nat.totient`.

### Layer 1: bilinear estimates for additive twists

**1.1 Type I sums.** For `|α − a/q| ≤ q⁻²` with `gcd(a, q) = 1`, `q ≥ 1`, and `M, X ≥ 1`:
`∑_{m=1}^{M} min(X/m, 1/‖mα‖) ≤ C (X/q + M + q) log(2Mq)` (with the Pinned convention at
`‖mα‖ = 0`), the standard counting of `mα` modulo `1` in blocks of length `q`.

**1.2 Type II sums.** For complex `a` on `(M, 2M]` and `b` on `(0, N/M]`, and the same `α`,
`|∑_{M < m ≤ 2M} ∑_{n ≤ N/m} a(m) b(n) e(αmn)| ≤ C ‖a‖₂ ‖b‖₂ (N/M + M + N/q + q)^{1/2} (log(2Nq))^{1/2}`,
with `‖·‖₂` the `ℓ²` norms, by Cauchy–Schwarz in `m`, expansion of the square, the geometric-sum
bound of 0.1 and the counting argument of 1.1.

*Needs:* Layer 0.1.

### Layer 2: exponential sums over primes

**2.1 Vinogradov's minor-arc bound.** Define `primeExpSum N α = ∑_{n=1}^N Λ(n) e(nα)`. There is an
absolute `C` such that for `N ≥ 2`, `q ≥ 1`, `gcd(a, q) = 1` and `|α − a/q| ≤ q⁻²`,
`|primeExpSum N α| ≤ C (N q^{−1/2} + N^{4/5} + (Nq)^{1/2}) (log N)^4`. Apply
`SieveVaughan.vaughan_identity` with `U = V = ⌊N^{2/5}⌋`. The first term is bounded by `ψ(V)`. The
second and third are type I sums, bounded by 1.1 after partial summation in the logarithm. The
fourth has `μ(b)` on `b > U` against `λ_V(ℓ)` on `ℓ > V`; bound it dyadically by 1.2 and the
coefficient energies.

**2.2 Parseval and trivial bounds.** `∫₀¹ |primeExpSum N α|² dα = ∑_{n ≤ N} Λ(n)² ≤ N log N` and
`|primeExpSum N α| ≤ ψ(N)`.

*Needs:* `SieveMethodsAndPrimePatterns` §2.4; Layers 0.1, 1; Mathlib `Chebyshev.psi_le_const_mul_self`.

### Layer 3: the major arcs

**3.1 Reduced fractions and residue classes.** Define `psiAP x q a`. For `gcd(a, q) = 1`,
`|∑_{n ≤ x} Λ(n) e(an/q) − ∑_{b unit mod q} e(ab/q) ψ(x; q, b)| ≤ log q · log x / log 2` for
`x ≥ 2`: the difference is the prime powers `n ≤ x` with `gcd(n, q) > 1`.

**3.2 The major-arc form.** From `SiegelWalfiszBound`: for all `A, B > 0` there is `C` such that for
`N ≥ 2`, `1 ≤ q ≤ (log N)^B`, `gcd(a, q) = 1` and real `β`,
`|primeExpSum N (a/q + β) − (μ(q)/φ(q)) ∑_{n=1}^N e(nβ)| ≤ C (1 + |β| N) N (log N)^{−A}`.
For `√N ≤ t ≤ N`, combine 3.1 with `SiegelWalfiszBound`, applied at `t` with `A + B` for `A` and
`B + 1` for `B` once `N` is large, and `c_q(a) = μ(q)` from 0.2 to get
`∑_{n ≤ t} Λ(n) e(an/q) = (μ(q)/φ(q)) t + O(N (log N)^{−A})`. For `t < √N` use the trivial bound.
Then apply Abel summation in `β`.

*Needs:* `SiegelWalfiszBound`; Layers 0.2, 2.1's notation; Mathlib `sum_mul_eq_sub_sub_integral_mul`.

### Layer 4: the circle method and Vinogradov's three-primes theorem

**4.1 The integral representation.** `threePrimeWeight N = r(N)` as defined in the Pinned
conventions; prove `r(N) = ∫₀¹ primeExpSum N α ³ e(−Nα) dα` from orthogonality 0.1.

**4.2 Arcs.** For `N ≥ 2` and `B > 0` put `Q = (log N)^B`. Integrate over `I = [Q/N, 1 + Q/N]`,
which gives the same integral as `[0, 1]` by periodicity. The major arc `𝔐(q, a)` is
`{α ∈ I : |α − a/q| ≤ Q/N}` for `1 ≤ q ≤ Q`, `1 ≤ a ≤ q`, `gcd(a, q) = 1`; the major arcs `𝔐` are
their union, pairwise disjoint once `2Q² < N`; the minor arcs are `𝔪 = I ∖ 𝔐`. Prove from
`Real.exists_int_int_abs_mul_sub_le` with `n = ⌊N/Q⌋` that every `α ∈ 𝔪` has a reduced
approximation `|α − a/q| ≤ q⁻²` with `Q < q ≤ N/Q`.

**4.3 Minor arcs.** By 2.1 and 4.2, `sup_{α ∈ 𝔪} |primeExpSum N α| ≤ C N (log N)^{4 − B/2}`; with
2.2, `∫_𝔪 |primeExpSum N α|³ dα ≤ C N² (log N)^{5 − B/2}`.

**4.4 The singular series.** Define `singularSeries N = ∑_{q ≥ 1} μ(q) c_q(N) / φ(q)³`, the `tsum`
of a family that is absolutely summable uniformly in `N`: for squarefree `q`,
`|c_q(N)| ≤ φ(gcd(q, N)) ≤ φ(q)`, so each term is at most `φ(q)⁻²`. Prove: the Euler product
`𝔖(N) = ∏_p (1 + μ(p) c_p(N)/(p − 1)³)` (`singularSeries_hasProd`, as Mathlib `HasProd` over
`Nat.Primes`), whose factor is `1 − (p − 1)⁻²` for `p ∣ N` and `1 + (p − 1)⁻³` for `p ∤ N`;
`𝔖(N) = 0` for even `N`; there is `c > 0` with `𝔖(N) ≥ c` for every odd `N`; `𝔖(N) ≤ C` for all
`N`; and the truncation `|∑_{q ≤ Q} μ(q) c_q(N)/φ(q)³ − 𝔖(N)| ≤ C Q^{−1/2}` (any fixed saving
suffices; this one follows from the term bound `φ(q)⁻²` and `φ(q) ≥ c q^{3/4}`).

**4.5 The singular integral.** With `T(β) = ∑_{n=1}^N e(nβ)`,
`∫₀¹ T(β)³ e(−Nβ) dβ = (N − 1)(N − 2)/2` for `N ≥ 1` (the number of ordered positive triples with
sum `N`), and `∫_{|β| > Q/N, β ∈ [−1/2, 1/2]} |T(β)|³ dβ ≤ C N² Q^{−2}`.

**4.6 Major arcs.** By 3.2, `∫_𝔐 primeExpSum N α ³ e(−Nα) dα =
(∑_{q ≤ Q} μ(q) c_q(N)/φ(q)³) · (N²/2) + O(N² (log N)^{−A})` for every `A`, from
`SiegelWalfiszBound`.

**4.7 The asymptotic formula.** For every `A > 0` there is `C` with
`|r(N) − ½ 𝔖(N) N²| ≤ C N² (log N)^{−A}` for `N ≥ 2` (`threePrimeWeight_asymptotic`), choosing `B`
in terms of `A`.

**4.8 Vinogradov's theorem from the proposition.** Removing prime powers (their contribution to
`r(N)` is `O(N^{3/2} (log N)³)`) and the logarithmic weights by partial summation:
`R(N) (log N)³ / N² − ½ 𝔖(N) → 0` as `N → ∞` (`threePrimeCount_asymptotic`), and
`vinogradov_threePrimes`: there is `N₀` such that every odd `N ≥ N₀` is `p₁ + p₂ + p₃` with
`p₁, p₂, p₃` prime. Both are from `SiegelWalfiszBound`, and `N₀` is existential.

**4.9 The headline.** Prove `siegelWalfiszBound : SiegelWalfiszBound` from `siegel_walfisz`, whose
statement is eventual in `x`: on the bounded range of `x`, `ψ(x; q, a) ≤ ψ(x) ≤ C x` gives the bound
after enlarging `C`. Deduce `vinogradov_threePrimes_unconditional`.

*Needs:* Layers 0.1, 0.2, 2, 3.2; `AnalyticNumberTheoryPartI` §0.32 for 4.9; Mathlib `HasProd`,
`intervalIntegral`, `Real.exists_int_int_abs_mul_sub_le`.

---

## Worked examples and rejection tests

1. **Ramanujan sums.** `c₄(2) = e(1/2) + e(3/2) = −2 = μ(4) + 2μ(2)`; `c_q(0) = φ(q)`;
   `c_q(1) = μ(q)`.
2. **Singular series parity.** For even `N` the Euler factor at `2` is `1 − (2 − 1)⁻² = 0`, so
   `𝔖(N) = 0`, consistent with the fact that an even `N > 6` is a sum of three primes only with a
   `2` among them, a set of size `O(N / log N)`; for odd `N` the factor at `2` is `2`.
3. **Singular integral.** `∫₀¹ T(β)³ e(−5β) dβ = 6 = (5 − 1)(5 − 2)/2`. A geometric sum indexed from
   `n = 0` gives `binom(7, 2) = 21` at `N = 5` (the nonnegative triples), which is why the Pinned
   cutoffs start at `1`.
4. **The reciprocal convention.** At `β = 0`, `|∑_{n=1}^N e(nβ)| = N`. With Lean's `1/0 = 0`, the
   expression `min(N, 1/(2‖β‖))` evaluates to `0`, and the bound is false; the Pinned `if` gives `N`.
5. **Uniformity.** The statement "for each `q`, `ψ(x; q, a) − x/φ(q) = O(x (log x)^{−A})` as
   `x → ∞`" allows the implied constant to grow arbitrarily with `q`; it does not bound the major
   arcs, where `q` grows with `N`. Siegel–Walfisz must be stated with its constants before `q`.
6. **The `N q^{−1/2}` term of 2.1.** At `α = 1/2` (`a = 1`, `q = 2`),
   `primeExpSum N (1/2) = ∑ Λ(n)(−1)^n = −ψ(N) + 2 log 2 · ⌊log₂ N⌋`, of size `N`; a bound without
   the `N q^{−1/2}` term is false.

---

## Ordering

```text
Mathlib ─→ 0 ─→ 1 ─→ 2 (with Vaughan's identity) ─→ 4.3
           0.2 + SiegelWalfiszBound ─→ 3 ─→ 4.6
           4.1, 4.2, 4.4, 4.5 from Layer 0
           4.3 + 4.6 ─→ 4.7 ─→ 4.8 ─→ 4.9 (with siegel_walfisz)
```

Layers 0 and 1 need only Mathlib. Layer 2 needs Vaughan's identity. Layer 3 and Layers 4.1 to 4.8
are built against the proposition `SiegelWalfiszBound`, and need no L-function. The summit is 4.9.

---

## Prior work

- [github.com/sthubbar/lean-lab-ci](https://github.com/sthubbar/lean-lab-ci) is an existing Lean 4
  repository of AI-written analytic number theory formalizations. It is a cited source, not the
  specification: material taken from it is restated to this roadmap's conventions and generality,
  credited in the ported files, and integrated with its author's agreement.

---

## References

- H. Iwaniec and E. Kowalski, *Analytic Number Theory*, AMS Colloquium Publications 53, 2004:
  Chapter 13 (Vaughan's identity, Theorem 13.6, and the three-primes theorem).
- H. Davenport, *Multiplicative Number Theory*, 3rd ed., revised by H. L. Montgomery, GTM 74,
  Springer, 2000: Chapters 24–26 (Vaughan's identity, Vinogradov's bound, the three-primes theorem).
- R. C. Vaughan, *The Hardy–Littlewood Method*, 2nd ed., Cambridge Tracts in Mathematics 125, 1997:
  Chapter 2 (Lemma 2.2, the type I sum bound) and Chapter 3 (Goldbach's ternary problem, the
  singular series and the singular integral).
- R. C. Vaughan, "Sommes trigonométriques sur les nombres premiers", *C. R. Acad. Sci. Paris Sér. A*
  285 (1977), 981–983.
- I. M. Vinogradov, "Representation of an odd number as a sum of three primes", *Dokl. Akad. Nauk
  SSSR* 15 (1937), 291–294.
