# Roadmap: the circle method and Vinogradov's three-primes theorem

**Summary.** This roadmap develops the Hardy–Littlewood circle method for sums of three primes,
over the rational integers, and proves Vinogradov's theorem: every sufficiently large odd integer
is a sum of three primes. Its objects are the additive character `e(α) = exp(2πiα)` on `ℝ` and the
distance `‖α‖` from `α` to the nearest integer; the Ramanujan sums `c_q(n)`; the exponential sum
over primes `S(α) = ∑_{n ≤ N} Λ(n) e(nα)`, with `Λ` the von Mangoldt function; the weighted count
`r(N)`, the sum of `Λ(n₁) Λ(n₂) Λ(n₃)` over ordered triples of positive integers with sum `N`, and
the number `R(N)` of ordered triples of primes with sum `N`; and the singular series
`𝔖(N) = ∑_{q ≥ 1} μ(q) c_q(N) / φ(q)³`.

The first headline theorem is Vinogradov's bound on the minor arcs: there is an absolute constant
`C` such that for `N ≥ 2`, `q ≥ 1`, an integer `a` coprime to `q` and a real `α` with
`|α − a/q| ≤ q⁻²`, `|S(α)| ≤ C (N q^(−1/2) + N^(4/5) + (Nq)^(1/2)) (log N)⁴`. The second is the
asymptotic formula: for every `A > 0` there is `C` with `|r(N) − ½ 𝔖(N) N²| ≤ C N² (log N)^(−A)`
for all `N ≥ 2`, and `R(N) (log N)³ / N² − ½ 𝔖(N)` tends to `0`. The third is Vinogradov's theorem:
the singular series vanishes at even integers and is bounded below by a positive constant on the
odd ones, and there is an `N₀` such that every odd `N ≥ N₀` is `p₁ + p₂ + p₃` with `p₁, p₂, p₃`
prime. The threshold `N₀` is existential.

The arithmetic input is the Siegel–Walfisz theorem in a logarithmic range of moduli: for all
`A, B > 0` there is `C` with `|ψ(x; q, a) − x/φ(q)| ≤ C x (log x)^(−A)` for `x ≥ 2`,
`1 ≤ q ≤ (log x)^B` and `a` coprime to `q`, where `ψ(x; q, a)` is the sum of `Λ(n)` over `n ≤ x`
with `n ≡ a mod q`. The roadmap states it as a proposition, proves the major-arc approximation and
the asymptotic formula under it, and discharges it last.

SieveMethodsAndPrimePatterns supplies Vaughan's identity, which splits `S(α)` into sums of type I
and type II. AnalyticNumberTheoryPartI supplies `ψ(x; q, a)` and the Siegel–Walfisz theorem.
AutomorphicSpectralTheory defines the Kloosterman sum, whose value `S(n, 0; q)` is the Ramanujan
sum. Mathlib supplies the arithmetic functions, Chebyshev's bound, Dirichlet's approximation theorem
and Abel summation. The roadmap uses no sieve, no L-function and no contour integral.

Layer 0 builds the additive character, the geometric-sum bound and the Ramanujan sums. Layer 1
bounds the type I and type II sums twisted by `e(αmn)`. Layer 2 proves the minor-arc bound and
Parseval's identity for `S`. Layer 3 approximates `S` near rationals with small denominator, under
the Siegel–Walfisz proposition. Layer 4 runs the circle method, from the integral representation of
`r(N)` through the arcs, the singular series and the singular integral to the asymptotic formula
and Vinogradov's theorem.

## How to read the build

Each layer states its targets in numbered sections, each with its source and its own *Needs:*
line, and ends with `### Examples` and `### Dependencies`. Key definitions carry **Checks.**
Layers 0 and 1 need only Mathlib. Layer 2 adds Vaughan's identity. §3.2 and §§4.6–4.8 are stated
and proved against the proposition `SiegelWalfiszBound` of §3.1 and need no L-function; §4.9
proves the proposition from AnalyticNumberTheoryPartI §0.32 and concludes.

```text
Mathlib ─→ 0.1 ─→ 0.2
           0.1 ─→ 1.1 ─→ 1.2
           0.1, 1.1, 1.2 + Vaughan's identity ─→ 2.1 ─→ 2.2
           3.1 (psiAP, SiegelWalfiszBound) + 0.2, 2.1 ─→ 3.2
           4.1 from 0.1, 2.1;  4.2 from Mathlib;  4.4 from 0.2;  4.5 from 0.1
           2.1, 2.2, 4.2 ─→ 4.3;  0.2, 3.2, 4.2, 4.5 ─→ 4.6
           4.1, 4.3, 4.4, 4.6 ─→ 4.7 ─→ 4.8 ─→ 4.9 (with siegel_walfisz)
```

## Conventions

1. **Setting.** Everything is over the rational integers. `Λ` is Mathlib's
   `ArithmeticFunction.vonMangoldt`, real-valued; `μ` is `ArithmeticFunction.moebius`,
   integer-valued and cast to `ℝ` or `ℂ` where it is used; `φ` is `Nat.totient`. Both arithmetic
   functions vanish at `0`.
2. **Cutoffs.** A sum over `n ≤ x` for real `x` runs over `Finset.Ioc 0 ⌊x⌋₊`; a sum over `n ≤ N`
   for natural `N` runs over `Finset.Icc 1 N`. The index `0` never occurs. `ψ(x) = ∑_{n ≤ x} Λ(n)`
   is Mathlib's `Chebyshev.psi`.
3. **Residue classes.** `ψ(x; q, a) = ∑_{n ≤ x, (n : ZMod q) = a} Λ(n)` with `a : ZMod q`;
   coprimality of `a` and `q` is `IsUnit a`, as in Mathlib's Dirichlet theorem. An integer
   numerator `a` coprime to `q` is `Int.gcd a q = 1`.
4. **Additive character.** `e(α) = Complex.exp (2 * π * I * α)` for `α : ℝ`, equal to
   `(Real.fourierChar α : ℂ)`.
5. **Distance to the nearest integer.** `‖α‖ = |α − round α|`, with Mathlib's `round`, which rounds
   half up. It is the norm of `α` in Mathlib's `UnitAddCircle`.
6. **Reciprocals of `‖α‖`.** Every bound of the shape `min(X, 1/‖α‖)` takes the value `X` when
   `‖α‖ = 0`, by an explicit `if`. Lean's `1/0 = 0` would make the minimum `0`, and the
   geometric-sum bound false at the integers (Layer 0, Examples).
7. **Uniformity.** A bound uniform in a parameter (the modulus `q`, the point `α`) is stated with
   its constants quantified before that parameter: `∃ C, ∀ q x, …`. `Asymptotics.IsBigO` along
   `atTop` is used only for statements in one variable. A family of `IsBigO` statements indexed by
   `q` does not supply Siegel–Walfisz (Layer 3, Examples).
8. **Ineffective constants.** An ineffective constant is an existential. Nothing asserts
   computability, and no statement depending on `SiegelWalfiszBound` exhibits a numerical constant.
9. **Circle integrals.** Integrals over `ℝ/ℤ` are `∫ α in (0 : ℝ)..1`, with orthogonality
   `∫₀¹ e(mα) dα = 1_{m = 0}` for `m : ℤ`.
10. **Three-primes counts.** `r(N) = ∑_{n₁ + n₂ + n₃ = N, nᵢ ≥ 1} Λ(n₁) Λ(n₂) Λ(n₃)`; `R(N)` is the
    number of ordered triples of primes with sum `N`.
11. **Singular series.** `𝔖(N) = ∑_{q ≥ 1} μ(q) c_q(N) / φ(q)³` for `N ∈ ℤ`, `c_q` the Ramanujan
    sum, with Euler product `∏_{p ∣ N} (1 − (p − 1)⁻²) ∏_{p ∤ N} (1 + (p − 1)⁻³)`.
12. **The Siegel–Walfisz proposition.** The theorems of §3.2 and §§4.6–4.8 take the proposition
    `SiegelWalfiszBound` of §3.1 as a hypothesis, so that those sections are stated and proved
    without the supplier; §4.9 proves it. A logarithmic saving is all the circle method uses.
13. **Names.** The declarations of [`Suggested.lean`](Suggested.lean) live in
    `TauCetiRoadmap.CircleMethodThreePrimes`. A backticked name of this roadmap is declared there;
    the other targets are described in prose. The suggested home in Tau Ceti is
    `TauCeti/NumberTheory/CircleMethod/`.

## Layer 0: the additive toolkit

### 0.1 The additive character and geometric sums

Define `expTwoPiI α = e(α) = exp(2πiα)` for real `α`, and `distInt α = ‖α‖ = |α − round α|`, the
distance from `α` to the nearest integer (Conventions 4 and 5).

- For every real `α`, `e(α)` is the coercion to `ℂ` of `Real.fourierChar α`.
- `e(α + β) = e(α) e(β)` and `e(α + m) = e(α)` for every integer `m`; `|e(α)| = 1`, and the complex
  conjugate of `e(α)` is `e(−α)`.
- Orthogonality (`integral_expTwoPiI_intCast`): for every integer `m`, `∫₀¹ e(mα) dα` is `1` if
  `m = 0` and `0` otherwise.
- `distInt α` is the norm of `α` in `UnitAddCircle`. It is `1`-periodic and even, lies in
  `[0, 1/2]`, vanishes exactly at the integers, and satisfies `2‖α‖ ≤ |sin(πα)|`.

Prove the geometric-sum identity `∑_{n=1}^N e(nβ) = e(β)(e(Nβ) − 1)/(e(β) − 1)` for every natural
`N` and every real `β` that is not an integer, and the bound `norm_sum_expTwoPiI_le`: for every
natural `N` and real `β`, `|∑_{n=1}^N e(nβ)|` is at most `N` when `‖β‖ = 0` and at most
`min(N, 1/(2‖β‖))` otherwise (Convention 6). Route: the identity, `|e(Nβ) − 1| ≤ 2` and
`|e(β) − 1| = 2|sin(πβ)| ≥ 4‖β‖`.

**Checks.**

- `expTwoPiI`: `e(0) = 1`, `e(1/2) = −1`, `e(1/4) = i`. A character `exp(iα)` without the factor
  `2π` would not be `1`-periodic, and its value at `1/2` is not `−1`.
- `distInt`: `distInt (1/2) = 1/2` (Mathlib's `round` rounds `1/2` up to `1`), `distInt (−0.3) = 0.3`
  and `distInt 7 = 0`. The fractional part `α − ⌊α⌋` would give `0.7` at `−0.3`.

*Needs:* Mathlib `Real.fourierChar`, `Real.fourierChar_apply`, `round`, `UnitAddCircle.norm_eq`,
interval integrals.

### 0.2 Ramanujan sums

Define `ramanujanSum q n = c_q(n) = ∑_{0 ≤ b < q, gcd(b, q) = 1} e(bn/q)` for `q : ℕ` and `n : ℤ`,
with values in `ℂ`; for `q = 0` the sum is empty, so `c_0(n) = 0`. Prove (Davenport, Chapter 26):

- `ramanujanSum_eq_sum_divisors`: for `q ≥ 1` and every integer `n`,
  `c_q(n) = ∑_{d ∣ q, d ∣ n} d μ(q/d)`. Hence `c_q(n)` is an integer, depends only on `n` modulo
  `q`, and `c_q(−n) = c_q(n)`.
- For `q ≥ 1`, `c_q(0) = φ(q)` and `c_q(1) = μ(q)`; more generally `c_q(n) = μ(q)` when
  `gcd(n, q) = 1`.
- `|c_q(n)| ≤ gcd(n, q)` for `q ≥ 1`, with `gcd(0, q) = q`.
- `ramanujanSum_mul`: `c_q(n)` is multiplicative in `q`: for all coprime natural `q₁, q₂` and every
  integer `n`, `c_{q₁q₂}(n) = c_{q₁}(n) c_{q₂}(n)` (the degenerate pair `{0, 1}` included).
- For a prime `p`, `c_p(n) = p − 1` if `p ∣ n` and `c_p(n) = −1` otherwise; and `c_{p^k}(n) = 0`
  for `k ≥ 2` and `p ∤ n`.
- For `q ≥ 1`, `ramanujanSum q n` is the Kloosterman sum `S(n, 0; q)` of AutomorphicSpectralTheory
  §1.16, the sum of `e(nd/q)` over the units `d` modulo `q`.

**Checks.**

- `ramanujanSum`: `c₁(n) = 1` for every `n` (the only `b` is `0`, and `gcd(0, 1) = 1`);
  `c₂(1) = −1`; `c₆(0) = 2 = φ(6)`. A sum over all residues `b` modulo `q`, coprime or not, would give
  `6` at `c₆(0)` and `0` at `c₄(2)`, whose value is `−2`.
- With `q = 12`, the defining sum, the divisor formula and `S(n, 0; 12)` all give
  `0, 2, 0, −2, −4, 4` at `n = 1, 2, 3, 4, 6, 0`.
- `c₉(3) = μ(9) + 3 μ(3) = −3` attains the bound `|c_q(n)| ≤ gcd(n, q) = 3`, and `c₉(1) = 0`
  illustrates the vanishing at `p^k` with `k ≥ 2`.

*Needs:* 0.1; Mathlib `ArithmeticFunction.moebius`, `Nat.totient`, `Nat.divisors`;
AutomorphicSpectralTheory §1.16 for the identification with `S(n, 0; q)`.

### Examples

- `c₄(2) = e(1/2) + e(3/2) = −2 = μ(4) + 2μ(2)`; `c_q(0) = φ(q)`; `c_q(1) = μ(q)`.
- **The reciprocal convention.** At `β = 0`, `|∑_{n=1}^N e(nβ)| = N`. With Lean's `1/0 = 0`, the
  expression `min(N, 1/(2‖β‖))` evaluates to `0`, and the bound is false; the `if` of Convention 6
  gives `N`.

### Dependencies

Mathlib; AutomorphicSpectralTheory §1.16 for the identification in 0.2.

## Layer 1: bilinear estimates for additive twists

### 1.1 Type I sums

Prove `sum_min_inv_distInt_le`: there is an absolute constant `C` such that for every natural
`M ≥ 1`, real `X ≥ 1`, natural `q ≥ 1`, integer `a` with `gcd(a, q) = 1` and real `α` with
`|α − a/q| ≤ q⁻²`,
`∑_{m=1}^{M} min(X/m, 1/‖mα‖) ≤ C (X/q + M + q) log(2Mq)`, where the summand is `X/m` when
`‖mα‖ = 0` (Convention 6). Route: the standard counting of the points `mα` modulo `1` in blocks of
`q` consecutive values of `m`, which are spaced about `1/q` apart (Davenport, Chapter 25; Vaughan,
*The Hardy–Littlewood Method*, Lemma 2.2).

*Needs:* 0.1.

### 1.2 Type II sums

Prove `norm_typeII_le`: there is an absolute constant `C` such that for natural numbers
`1 ≤ M ≤ N`, complex sequences `a, b` on `ℕ`, and `α` as in 1.1 (an integer `c` and a natural
`q ≥ 1` with `gcd(c, q) = 1` and `|α − c/q| ≤ q⁻²`),
`|∑_{M < m ≤ 2M} ∑_{n ≤ N/m} a(m) b(n) e(αmn)| ≤ C ‖a‖₂ ‖b‖₂ (N/M + M + N/q + q)^(1/2) (log(2Nq))^(1/2)`,
where `n ≤ N/m` means `n ≤ ⌊N/m⌋`, `‖a‖₂² = ∑_{M < m ≤ 2M} |a(m)|²` and
`‖b‖₂² = ∑_{0 < n ≤ N/M} |b(n)|²`. Route: Cauchy–Schwarz in `m`, expansion of the square, the
geometric-sum bound of 0.1 for the sum over `m`, which runs over an interval, and the counting of
1.1 with `X = N` for the sum over `h = n − n′` (Davenport, Chapter 25).

*Needs:* 0.1, 1.1.

### Examples

- 1.1 at `α = 0`, `q = 1`, `a = 0`: every `‖mα‖` is `0`, so the left side is `X ∑_{m ≤ M} 1/m`, which
  the `if` of Convention 6 keeps finite and nonzero; the term `X/q` pays for it.
- 1.2 at `M = N`: the inner sums over `n ≤ N/m` with `m > N` are empty, and the left side is `0`.

### Dependencies

Layer 0.1.

## Layer 2: exponential sums over primes

### 2.1 Vinogradov's minor-arc bound

Define `primeExpSum N α = S(α) = ∑_{n=1}^N Λ(n) e(nα)`. It is `1`-periodic in `α`,
`S(−α)` is the complex conjugate of `S(α)`, and `S(0) = ψ(N)`.

Prove `norm_primeExpSum_le`: there is an absolute constant `C` such that for `N ≥ 2`, `q ≥ 1`, an
integer `a` with `gcd(a, q) = 1` and a real `α` with `|α − a/q| ≤ q⁻²`,
`|primeExpSum N α| ≤ C (N q^(−1/2) + N^(4/5) + (Nq)^(1/2)) (log N)⁴`. Route: apply
`SieveVaughan.vaughan_identity` with `U = V = ⌊N^(2/5)⌋`. The first term is bounded by `ψ(V)`. The
second and third are type I sums, bounded by 1.1 after partial summation in the logarithm. The
fourth has `μ(b)` on `b > U` against the incomplete logarithm `λ_V(ℓ)` on `ℓ > V`; bound it
dyadically by 1.2 and the coefficient energies (Davenport, Chapter 25; Iwaniec–Kowalski §13.5;
Vaughan 1977).

**Checks.**

- `primeExpSum`: `primeExpSum N 0 = ψ(N)`; `primeExpSum 1 α = 0`, since `Λ(1) = 0`;
  `primeExpSum 2 α = (log 2) e(2α)`.
- `primeExpSum 4 0 = Λ(2) + Λ(3) + Λ(4) = log 12`. A sum of `log p` over the primes `p ≤ N` would
  miss the prime power `4` and give `log 6`.

*Needs:* SieveMethodsAndPrimePatterns §2.4 (`SieveVaughan.vaughan_identity`, the incomplete
logarithm and its coefficient energies); 0.1, 1.1, 1.2; Mathlib `ArithmeticFunction.vonMangoldt`,
`Chebyshev.psi`, `sum_mul_eq_sub_sub_integral_mul`.

### 2.2 Parseval and trivial bounds

Prove `integral_norm_sq_primeExpSum`: for every natural `N`,
`∫₀¹ |primeExpSum N α|² dα = ∑_{n=1}^N Λ(n)²`. Prove that this sum is at most `(log 4 + 4) N log N`,
from `Λ(n) ≤ log N` for `n ≤ N` and `ψ(N) ≤ (log 4 + 4) N`, and that `|primeExpSum N α| ≤ ψ(N)`
for every real `α`. The constant `1` is not available in place of `log 4 + 4`:
`ψ(19) ≈ 19.27 > 19` and `ψ(113) ≈ 117.39 > 113`.

*Needs:* 0.1, 2.1 for the definition; Mathlib `Chebyshev.psi_le_const_mul_self`,
`ArithmeticFunction.vonMangoldt_le_log`.

### Examples

- **The `N q^(−1/2)` term of 2.1.** At `α = 1/2` (`a = 1`, `q = 2`),
  `primeExpSum N (1/2) = ∑ Λ(n)(−1)^n = −ψ(N) + 2 log 2 · ⌊log₂ N⌋`, of size `N`; a bound without
  the `N q^(−1/2)` term is false. At `N = 10` both sides equal `−log 2520 + 6 log 2 ≈ −3.673`.

### Dependencies

SieveMethodsAndPrimePatterns §2.4, Layers 0.1 and 1; Mathlib's Chebyshev bound.

## Layer 3: the major arcs

### 3.1 Reduced fractions, residue classes and the Siegel–Walfisz proposition

Take `psiAP q a x = ψ(x; q, a)`, the sum of `Λ(n)` over `n ≤ x` with `(n : ZMod q) = a`, for
`q : ℕ`, `a : ZMod q` and real `x` (Convention 3); it is AnalyticNumberTheoryPartI's `psiAP`.
It is nonnegative, at most `ψ(x)`, and for `q ≥ 1` its sum over `a : ZMod q` is `ψ(x)`.

Define `SiegelWalfiszBound` as the proposition that for all real `A, B > 0` there is a real `C`
such that for every real `x ≥ 2`, every natural `q ≥ 1` with `q ≤ (log x)^B` and every unit `a` of
`ZMod q`, `|ψ(x; q, a) − x/φ(q)| ≤ C x / (log x)^A`. The constant `C` depends only on `A` and `B`
and is chosen before `x`, `q` and `a` (Convention 7); the classical proof gives no way to compute
it (Convention 8).

Prove: for `q ≥ 1`, an integer `a` with `gcd(a, q) = 1` and real `x ≥ 2`,
`|∑_{n ≤ x} Λ(n) e(an/q) − ∑_{b ∈ (ℤ/qℤ)^×} e(ab/q) ψ(x; q, b)| ≤ log q · log x / log 2`. The
difference is the sum over the prime powers `n ≤ x` with `gcd(n, q) > 1`, which are powers of the
at most `log q / log 2` primes dividing `q`, each contributing at most `log x`.

**Checks.**

- `psiAP`: `ψ(x; 1, 0) = ψ(x)`; `ψ(10; 2, 0) = 3 log 2`, from the terms `n = 2, 4, 8`, where a sum
  over primes only would give `log 2`; `ψ(x; q, a) ≤ ψ(x)`.
- `SiegelWalfiszBound`: at `q = 1` it is the prime number theorem with a logarithmic saving. At
  `q = 2`, `a = 0` is not a unit and is excluded, rightly: `ψ(x; 2, 0) = log 2 · ⌊log₂ x⌋` is
  `O(log x)`, not of size `x`. At `q = 2`, `a = 1`, `φ(2) = 1` and
  `ψ(x; 2, 1) = ψ(x) − log 2 · ⌊log₂ x⌋`, so the bound reads `|ψ(x; 2, 1) − x| ≤ C x (log x)^(−A)`;
  a definition with `x/q` in place of `x/φ(q)` would assert `|ψ(x; 2, 1) − x/2| ≤ C x (log x)^(−A)`,
  false since `ψ(x; 2, 1) ∼ x`.

*Needs:* 0.1; AnalyticNumberTheoryPartI §0.32 for `ψ(x; q, a)`; Mathlib
`ArithmeticFunction.vonMangoldt`, `Nat.totient`.

### 3.2 The major-arc form

Prove `primeExpSum_majorArc`: assume `SiegelWalfiszBound`. For all real `A, B > 0` there is `C`
such that for every natural `N ≥ 2`, natural `q` with `1 ≤ q ≤ (log N)^B`, integer `a` with
`gcd(a, q) = 1` and real `β`,
`|primeExpSum N (a/q + β) − (μ(q)/φ(q)) ∑_{n=1}^N e(nβ)| ≤ C (1 + |β| N) N (log N)^(−A)`.
Route: for `√N ≤ t ≤ N`, combine 3.1 with `SiegelWalfiszBound`, applied at `t` with `A + B` for
`A` and `B + 1` for `B` once `N` is large, and `c_q(a) = μ(q)` from 0.2, to get
`∑_{n ≤ t} Λ(n) e(an/q) = (μ(q)/φ(q)) t + O(N (log N)^(−A))`. For `t < √N` use the trivial bound.
Then apply Abel summation in `β` (Davenport, Chapter 26; Iwaniec–Kowalski §19.4).

**Checks.**

- At `q = 1`, `a = 0`, `β = 0` the statement is `|ψ(N) − N| ≤ C N (log N)^(−A)` for `N ≥ 3`, the
  prime number theorem with a logarithmic saving. At `q = 2`, `a = 1`, `β = 0`, for the `N` with
  `2 ≤ (log N)^B`, the left side compares
  `primeExpSum N (1/2) = −ψ(N) + 2 log 2 · ⌊log₂ N⌋` with `(μ(2)/φ(2)) N = −N`, again the prime
  number theorem. A main term `T(β)/φ(q)` without the factor `μ(q)` would give `+N`, of the wrong
  sign.

*Needs:* `SiegelWalfiszBound` (3.1); 0.2, 2.1 for the definition, 3.1; Mathlib
`sum_mul_eq_sub_sub_integral_mul`.

### Examples

- **Uniformity.** The statement "for each `q`, `ψ(x; q, a) − x/φ(q) = O(x (log x)^(−A))` as
  `x → ∞`" allows the implied constant to grow arbitrarily with `q`; it does not bound the major
  arcs, where `q` grows with `N`. Siegel–Walfisz must be stated with its constants before `q`.

### Dependencies

`SiegelWalfiszBound`, Layers 0.1, 0.2 and 2.1; AnalyticNumberTheoryPartI §0.32 for `ψ(x; q, a)`.

## Layer 4: the circle method and Vinogradov's three-primes theorem

Throughout, `S(α) = primeExpSum N α`, `T(β) = ∑_{n=1}^N e(nβ)`, and for `B > 0`, `Q = (log N)^B`.
Source for 4.1 to 4.8: Davenport, Chapter 26; Iwaniec–Kowalski §19.4.

### 4.1 The integral representation

Define `threePrimeWeight N = r(N)` and `threePrimeCount N = R(N)` as in Convention 10: `r(N)` is the
sum of `Λ(n₁) Λ(n₂) Λ(N − n₁ − n₂)` over `n₁, n₂ ≥ 1` with `n₁ + n₂ < N`, and `R(N)` is the number of
pairs of primes `(p₁, p₂)` with `p₁ + p₂ < N` and `N − p₁ − p₂` prime. Both vanish for `N ≤ 5`, and
`R(N) > 0` exactly when `N` is a sum of three primes. Prove `threePrimeWeight_eq_integral`: for
every natural `N`, `r(N) = ∫₀¹ S(α)³ e(−Nα) dα`, from orthogonality (0.1).

**Checks.**

- `threePrimeWeight`: `r(3) = Λ(1)³ = 0`; `r(6) = (log 2)³`, from `(2, 2, 2)` only;
  `r(7) = 3 (log 2)² log 3`, the three orders of `(2, 2, 3)`.
- `threePrimeCount`: `R(5) = 0`, `R(6) = 1`, `R(7) = 3`, `R(9) = 4`, from `(2, 2, 5)` in three orders
  and `(3, 3, 3)`. A count of unordered triples would give `R(9) = 2`.

*Needs:* 0.1, 2.1 for the definition; Mathlib `ArithmeticFunction.vonMangoldt`, `Nat.Prime`.

### 4.2 Arcs

For `N ≥ 2` and `B > 0` put `Q = (log N)^B`, and take `N` so large that `2Q³ < N`. Integrate over
`I = [Q/N, 1 + Q/N]`, which gives the same integral as `[0, 1]` by periodicity. The major arc
`𝔐(q, a)` is `{α ∈ I : |α − a/q| ≤ Q/N}` for `1 ≤ q ≤ Q`, `1 ≤ a ≤ q`, `gcd(a, q) = 1`; the major
arcs `𝔐` are their union, pairwise disjoint because distinct fractions with denominators at most
`Q` differ by at least `Q⁻²`, which exceeds `2Q/N`; the minor arcs are `𝔪 = I ∖ 𝔐`. Prove from
`Real.exists_int_int_abs_mul_sub_le` with `n = ⌊N/Q⌋` that every `α ∈ 𝔪` has a reduced
approximation `|α − a/q| ≤ q⁻²` with `gcd(a, q) = 1` and `Q < q ≤ N/Q`. Reduce the returned `j/k`;
then `|α − j/k| ≤ 1/(k(n + 1)) < Q/(kN)`, since `n + 1 > N/Q`. The fraction `0/1` cannot occur,
since it would give `α < Q/N`; a fraction with denominator at most `Q` lies in `[1/Q, 1]`, so it puts
`α` on a major arc.

*Needs:* Mathlib `Real.exists_int_int_abs_mul_sub_le`.

### 4.3 Minor arcs

For every `B > 0` there is `C` such that for every `N ≥ 2` with `2Q³ < N`,
`sup_{α ∈ 𝔪} |S(α)| ≤ C N (log N)^(4 − B/2)` and `∫_𝔪 |S(α)|³ dα ≤ C N² (log N)^(5 − B/2)`. The
first bound is 2.1 at the approximation `Q < q ≤ N/Q` of 4.2; the second is the first times the
Parseval bound of 2.2.

*Needs:* 2.1, 2.2, 4.2.

### 4.4 The singular series

Define `singularSeries N` for an integer `N` as `∑_{q ≥ 1} μ(q) c_q(N) / φ(q)³`, the `tsum` over
`q : ℕ` of `μ(q) Re(c_q(N)) / φ(q)³` (the term at `q = 0` is `0`, and `c_q(N)` is an integer). The
family is absolutely summable uniformly in `N`: for squarefree `q`, `|c_q(N)| ≤ φ(gcd(q, N)) ≤ φ(q)`,
so each term is at most `φ(q)⁻²`. Prove:

- `singularSeries_hasProd`: for every integer `N`, the product over the primes `p` of the factors
  `1 + μ(p) c_p(N)/(p − 1)³`, which are `1 − (p − 1)⁻²` for `p ∣ N` and `1 + (p − 1)⁻³` for `p ∤ N`,
  converges to `𝔖(N)` in the sense of Mathlib's `HasProd` over `Nat.Primes`.
- `singularSeries_eq_zero_of_even`: `𝔖(N) = 0` for every even integer `N`, `0` included.
- `singularSeries_lower_bound_of_odd`: there is `c > 0` with `𝔖(N) ≥ c` for every odd integer `N`.
- `𝔖(N) ≤ C` for every integer `N`; indeed `0 ≤ 𝔖(N) ≤ 𝔖(1)`.
- The truncation bound: there is `C` such that for every integer `N` and real `Q ≥ 1`,
  `|∑_{q ≤ Q} μ(q) c_q(N)/φ(q)³ − 𝔖(N)| ≤ C Q^(−1/2)`. Any fixed saving suffices; this one follows
  from the term bound `φ(q)⁻²` and `φ(q) ≥ c q^(3/4)`.

**Checks.**

- `singularSeries`: `𝔖(0) = 0`; `𝔖(1) = 2 ∏_{p ≥ 3} (1 + (p − 1)⁻³) ≈ 2.3010`; the truncation at
  `Q = 1` is `1`.
- `𝔖(3) = (2/3) 𝔖(1) ≈ 1.5340`: the factor at `3` is `1 − 1/4` in place of `1 + 1/8`. A series that
  did not depend on `N` through `c_q(N)` would give `𝔖(3) = 𝔖(1)`.
- With `q³` in place of `φ(q)³`, the factor at `2` for even `N` would be `1 − 1/8` and `𝔖(0)` would
  not vanish.

*Needs:* 0.2; Mathlib `HasProd`, `tsum`, `Nat.Primes`.

### 4.5 The singular integral

Prove `integral_geomSum_cube`: for every natural `N ≥ 1`,
`∫₀¹ T(β)³ e(−Nβ) dβ = (N − 1)(N − 2)/2`, the number of ordered triples of positive integers with
sum `N`. Prove that there is an absolute constant `C` such that for `N ≥ 1` and real `Q > 0`,
`∫_{β ∈ [−1/2, 1/2], |β| > Q/N} |T(β)|³ dβ ≤ C N² Q⁻²`, from `|T(β)| ≤ 1/(2|β|)` on `[−1/2, 1/2]`.

*Needs:* 0.1.

### 4.6 Major arcs

Assume `SiegelWalfiszBound`. For all real `A, B > 0` there is `C` such that for every `N ≥ 2` with
`2Q³ < N`,

```text
| ∫_𝔐 S(α)³ e(−Nα) dα − (∑_{q ≤ Q} μ(q) c_q(N)/φ(q)³) · N²/2 | ≤ C N² ((log N)^(−A) + Q^(−2))
```

Route: on `𝔐(q, a)` write `α = a/q + β` with `|β| ≤ Q/N`; 3.2, with a larger `A`, replaces `S(α)`
by `(μ(q)/φ(q)) T(β)`, and the resulting error in `S(α)³`, integrated over the major arcs, whose
total length is at most `2Q³/N`, is `O(N² (log N)^(−A))`. The sum of `e(−aN/q)` over the `a`
coprime to `q` is `c_q(−N) = c_q(N)` (0.2), and by 4.5 the integral of `T(β)³ e(−Nβ)` over
`|β| ≤ Q/N` is
`(N − 1)(N − 2)/2 + O(N² Q⁻²)`. The term `N² Q⁻² = N² (log N)^(−2B)` is the cost of truncating the
singular integral; it is why 4.7 chooses `B` in terms of `A`.

*Needs:* 0.2, 3.2, 4.2, 4.5.

### 4.7 The asymptotic formula

Prove `threePrimeWeight_asymptotic`: assume `SiegelWalfiszBound`. For every `A > 0` there is `C`
with `|r(N) − ½ 𝔖(N) N²| ≤ C N² (log N)^(−A)` for every natural `N ≥ 2`. Route: split the integral
of 4.1 over `I` into `𝔐` and `𝔪`, and choose `B` in terms of `A`, for instance `B = 2A + 10`. The
minor arcs (4.3) contribute `O(N² (log N)^(5 − B/2))`, the major arcs (4.6) the truncated singular
series times `N²/2` up to `O(N² ((log N)^(−A) + (log N)^(−2B)))`, and the truncation of the singular
series (4.4) costs `O(N² (log N)^(−B/2))`. The finitely many `N` with `2Q³ ≥ N` are absorbed in `C`.

*Needs:* 4.1, 4.3, 4.4, 4.6.

### 4.8 Vinogradov's theorem from the proposition

Prove `threePrimeCount_asymptotic`: assume `SiegelWalfiszBound`; then
`R(N) (log N)³ / N² − ½ 𝔖(N) → 0` as `N → ∞`. In particular `R(N) ∼ 𝔖(N) N² / (2 (log N)³)` along
the odd `N`, where `𝔖(N)` is bounded below (4.4). Route: remove the prime powers, whose contribution
to `r(N)` is `O(N^(3/2) (log N)³)`, and the logarithmic weights by partial summation. Prove
`vinogradov_threePrimes`: assume `SiegelWalfiszBound`; then there is `N₀` such that every odd
`N ≥ N₀` is `p₁ + p₂ + p₃` with `p₁, p₂, p₃` prime. `N₀` is existential, as in Vinogradov's proof;
see Helfgott, *The ternary Goldbach problem*, arXiv:1501.05438, Chapter 1.

*Needs:* 4.4, 4.7; Mathlib `sum_mul_eq_sub_sub_integral_mul`.

### 4.9 The headline

Prove `siegelWalfiszBound : SiegelWalfiszBound` from `siegel_walfisz` of AnalyticNumberTheoryPartI
§0.32, whose statement is eventual in `x`: on the bounded range of `x`, `ψ(x; q, a) ≤ ψ(x) ≤ C x`
gives the bound after enlarging `C`. The local `psiAP` of `Suggested.lean` has the supplier's
arguments and body, so the identification is definitional. Deduce
`vinogradov_threePrimes_unconditional`: there is `N₀` such that every odd `N ≥ N₀` is a sum of three
primes.

*Needs:* AnalyticNumberTheoryPartI §0.32, 4.8; Mathlib `Chebyshev.psi_le_const_mul_self`.

### Examples

- **Singular series parity.** For even `N` the Euler factor at `2` is `1 − (2 − 1)⁻² = 0`, so
  `𝔖(N) = 0`, consistent with the fact that an even `N > 6` is a sum of three primes only with a
  `2` among them, a set of size `O(N / log N)`; for odd `N` the factor at `2` is `2`.
- **Singular integral.** `∫₀¹ T(β)³ e(−5β) dβ = 6 = (5 − 1)(5 − 2)/2`. A geometric sum indexed from
  `n = 0` gives `binom(7, 2) = 21` at `N = 5` (the nonnegative triples), which is why the cutoffs of
  Convention 2 start at `1`.

### Dependencies

Layers 0.1, 0.2, 2, 3.2; AnalyticNumberTheoryPartI §0.32 for 4.9.

## Prior work

- [github.com/sthubbar/lean-lab-ci](https://github.com/sthubbar/lean-lab-ci) is an existing Lean 4
  repository of AI-written analytic number theory formalizations. It is a cited source, not the
  specification: material taken from it is restated to this roadmap's conventions and generality,
  credited in the ported files, and integrated with its author's agreement.

## Scope and ownership

**This roadmap owns**

- the additive character `e(α) = exp(2πiα)` on `ℝ`, the distance to the nearest integer, geometric
  sums and orthogonality on `[0, 1]` (§0.1);
- the Ramanujan sum on native carriers, with the properties that §1.16 of
  AutomorphicSpectralTheory does not state (§0.2);
- the type I and type II bilinear estimates for additive twists, for arbitrary coefficients
  (Layer 1);
- Vinogradov's minor-arc bound for `∑ Λ(n) e(nα)`, and Parseval for this sum (Layer 2);
- the proposition `SiegelWalfiszBound` and the major-arc approximation of `∑ Λ(n) e(nα)` (Layer 3);
- the circle method for three primes: the integral representation, the major and minor arcs, the
  singular series and the singular integral, the asymptotic formula for the weighted count, and
  Vinogradov's three-primes theorem (Layer 4).

**Kept variants.**

- `ramanujanSum` is the specialisation `S(n, 0; q)` of the Kloosterman sum of
  AutomorphicSpectralTheory §1.16 on native carriers (`q : ℕ`, `n : ℤ`, values in `ℂ`). It is kept
  here because the circle method needs its multiplicativity in `q`, the bound
  `|c_q(n)| ≤ gcd(n, q)` and the vanishing `c_{p^k}(n) = 0`, none of which §1.16 states; §0.2 proves
  the identification.
- `psiAP` is AnalyticNumberTheoryPartI's `psiAP` (§0.32). `Suggested.lean` keeps a local copy with
  the same argument order and body only because the supplier is not importable at the pins.
- `SiegelWalfiszBound` is that roadmap's `siegel_walfisz` for all `x ≥ 2` rather than eventually in
  `x`; §4.9 derives it.

**Consumed, not redefined.** The exact declarations are listed under the supplier contracts below.

- From Mathlib: `ArithmeticFunction` with `vonMangoldt` and `moebius`, `Chebyshev.psi` and its upper
  bound, `Nat.totient`, Dirichlet's approximation theorem `Real.exists_int_int_abs_mul_sub_le`, Abel
  summation `sum_mul_eq_sub_sub_integral_mul`, interval integrals, `HasProd`, `Real.fourierChar` and
  the norm of `UnitAddCircle`.
- From SieveMethodsAndPrimePatterns, Layer 2 §2.4: Vaughan's identity, the incomplete logarithm and
  its coefficient energies.
- From AnalyticNumberTheoryPartI, §0.32: the function `ψ(x; q, a)`, there named `psiAP`, and
  Siegel–Walfisz for it in reduced residue classes.
- From AutomorphicSpectralTheory, §1.16: the Kloosterman sum, whose value `S(n, 0; q)` is the
  Ramanujan sum, with the divisor formula `S(n, 0; q) = ∑_{d ∣ (n, q)} μ(q/d) d` and the values
  `S(0, 0; q) = φ(q)` and `S(n, 0; p) = p − 1` or `−1`.
- No declaration of the Tau Ceti library is consumed. Neither Mathlib nor Tau Ceti has at the pins
  the Ramanujan sum, the type I or type II bounds for additive twists, an exponential sum over
  primes, Siegel–Walfisz or any part of the circle method; the objects and theorems above that are
  not consumed are targets here.

**Not owned here.**

- Every sieve, the large sieve, Vaughan's identity, dyadic bilinear character estimates and the
  Bombieri–Vinogradov theorem belong to SieveMethodsAndPrimePatterns. The bilinear estimates here
  are additive twists and are not in that roadmap.
- Davenport's uniform Möbius exponential cancellation and the Möbius form of Vaughan's identity
  belong to AnalyticNumberTheoryPartI, §1.2. The type I and type II bounds of Layer 1 have arbitrary
  coefficients and give a route to its Möbius estimates; this roadmap states no Möbius exponential
  sum.
- Zero-free regions, Siegel's theorem, the prime number theorem with an error term and the proof of
  Siegel–Walfisz belong to ImaginaryQuadraticClassNumber, ZerosOfLFunctions and
  AnalyticNumberTheoryPartI.
- Contour integration and residues belong to ContourIntegration: the circle method here integrates
  over `[0, 1]` with Mathlib's interval integral and uses no contour.

**Not part of this roadmap.** The binary Goldbach problem and its exceptional-set estimates,
Waring's problem and Weyl sums of polynomial phases, the Hardy–Littlewood prime-tuples asymptotics,
and every explicit or effective form of the three-primes theorem (Helfgott's ternary Goldbach
theorem and all numerical values of `N₀`). The three-primes theorem here has an existential
threshold `N₀`.

## Exact supplier contracts

### From Mathlib

- `ArithmeticFunction.vonMangoldt`: `Λ`, an `ArithmeticFunction ℝ` with `Λ 0 = 0`; with
  `ArithmeticFunction.vonMangoldt_le_log` (`Λ n ≤ log n` for every natural `n`, used in 2.2). Every
  prime sum in this roadmap is a sum of `Λ`, of `Real.log p · 1_{p prime}` or of `1_{p prime}` over
  an explicit `Finset`.
- `ArithmeticFunction.moebius`: `μ`, an `ArithmeticFunction ℤ` with `μ 0 = 0`, cast to `ℝ` or `ℂ` at
  the use site.
- `Chebyshev.psi`: `ψ(x) = ∑_{n ∈ Finset.Ioc 0 ⌊x⌋₊} Λ(n)`, the cutoff of Convention 2; and
  `Chebyshev.psi_le_const_mul_self`: `ψ(x) ≤ (log 4 + 4) x` for real `x ≥ 0`.
- `Nat.totient` (`φ`), `Nat.divisors`, `ZMod` with `IsUnit` for reduced residues, `Int.gcd`.
- `Real.exists_int_int_abs_mul_sub_le`: Dirichlet's approximation theorem; for real `ξ` and natural
  `n ≥ 1` there are integers `j, k` with `0 < k ≤ n` and `|kξ − j| ≤ 1/(n + 1)`. It places every
  `α` on a major or a minor arc in 4.2.
- `sum_mul_eq_sub_sub_integral_mul`: Abel summation; for `c : ℕ → 𝕜` with `𝕜` an `RCLike` field,
  reals `0 ≤ a ≤ b` and `f` differentiable at every point of `[a, b]` with `deriv f` integrable on
  `[a, b]`, `∑_{⌊a⌋ < k ≤ ⌊b⌋} f(k) c(k) = f(b) A(b) − f(a) A(a) − ∫_a^b f′(t) A(t) dt`, where
  `A(t) = ∑_{0 ≤ k ≤ ⌊t⌋} c(k)`. Used in 2.1, 3.2 and 4.8.
- `Real.fourierChar` with `Real.fourierChar_apply`: its value at `x`, coerced to `ℂ`, is
  `Complex.exp (2πx · I)`; 0.1 compares `expTwoPiI` with it.
- `round` and `UnitAddCircle.norm_eq`: the norm of `x` in `UnitAddCircle` is `|x − round x|`; 0.1
  compares `distInt` with it.
- `HasProd` over `Nat.Primes`, the convergence of the finite partial products for the unconditional
  summation filter: the Euler product of 4.4. `tsum` for the singular series.
- Interval integrals `∫ α in a..b`, and `Filter.Tendsto` along `atTop` for 4.8.

### From TauCetiRoadmap.SieveMethodsAndPrimePatterns

- `SieveVaughan.vaughan_identity` (§2.4): for natural `U, V` and `n ≥ 1`,
  `Λ(n) = 1_{n ≤ V} Λ(n) + ∑_{b ∣ n, b ≤ U} μ(b) log(n/b) − ∑_{b ∣ n, b ≤ U} μ(b) ∑_{c ∣ n/b, c ≤ V} Λ(c) + ∑_{b ∣ n, U < b} μ(b) ∑_{c ∣ n/b, V < c} Λ(c)`;
  the decomposition of 2.1.
- The incomplete logarithm `λ_V` (§2.4): `λ_V(n) = ∑_{d ∣ n, V < d} Λ(d)`, with
  `0 ≤ λ_V(n) ≤ log n`; the long coefficient of 2.1.
- The coefficient energies (§2.4): `∑_{ℓ ∈ Ioc(L, M)} λ_V(ℓ)² ≤ (M − L)(log M)²` for `L ≤ M`.

### From TauCetiRoadmap.AnalyticNumberTheoryPartI

- `psiAP` (§0.32): `ψ(x; q, a)`,
  `psiAP (q : ℕ) (a : ZMod q) (x : ℝ) = ∑ n ∈ (Finset.Ioc 0 ⌊x⌋₊).filter (fun n => (n : ZMod q) = a), vonMangoldt n`.
  This roadmap does not own it. `Suggested.lean` keeps a local copy with the same argument order
  and body only because the supplier is not importable at the pins.
- `siegel_walfisz` (§0.32): for each `A, B > 0` there is `C > 0` such that eventually in `x`, for
  every `q > 0` with `q ≤ (log x)^B` and every unit `a` modulo `q`,
  `|ψ(x; q, a) − x/φ(q)| ≤ C x (log x)^(−A)`. The constant and the threshold may be ineffective;
  nothing more is assumed of them. 4.9 derives `SiegelWalfiszBound` from it.

The theorems of §3.2 and §§4.6–4.8 take `SiegelWalfiszBound` (§3.1) as a hypothesis, so that those
sections are stated and proved without importing the supplier; 4.9 supplies it.

### From TauCetiRoadmap.AutomorphicSpectralTheory

- The Kloosterman sum `S(m, n; c)` (§1.16):
  `S(m, n; c) = ∑_{d ∈ (ℤ/cℤ)^×} e((md + n d̄)/c)` for `c ≥ 1`, with its Checks `S(0, 0; c) = φ(c)`,
  `S(m, 0; p) = p − 1` or `−1` according as `p ∣ m` or not, and
  `S(m, 0; c) = ∑_{d ∣ (m, c)} μ(c/d) d`. That roadmap's `Suggested.lean` declares no Lean name for
  it; 0.2 identifies `ramanujanSum q n` with `S(n, 0; q)`.

## References

- H. Iwaniec and E. Kowalski, *Analytic Number Theory*, AMS Colloquium Publications 53, 2004:
  Chapter 13, §§13.4–13.5 (Vaughan's identity, exponential sums over primes), and Chapter 19, §19.4
  (the three-primes theorem).
- H. Davenport, *Multiplicative Number Theory*, 3rd ed., revised by H. L. Montgomery, GTM 74,
  Springer, 2000: Chapter 25 (An Exponential Sum Formed with Primes) and Chapter 26 (Sums of Three
  Primes).
- R. C. Vaughan, *The Hardy–Littlewood Method*, 2nd ed., Cambridge Tracts in Mathematics 125, 1997:
  Chapter 2 (Lemma 2.2, the type I sum bound) and Chapter 3 (Goldbach's ternary problem, the
  singular series and the singular integral).
- H. A. Helfgott, *The ternary Goldbach problem*, arXiv:1501.05438.
- R. C. Vaughan, "Sommes trigonométriques sur les nombres premiers", *C. R. Acad. Sci. Paris Sér. A*
  285 (1977), 981–983.
- I. M. Vinogradov, "Representation of an odd number as a sum of three primes", *Dokl. Akad. Nauk
  SSSR* 15 (1937), 291–294.
