# Roadmap: explicit exponential sums, character sums and sieve bounds

**Summary.** This roadmap builds the numerically explicit inequalities of analytic number theory
that the later explicit roadmaps quote as tools: Arias de Reyna's iterated van der Corput
inequality for exponential sums `Σ e(f(n))` of a real function, with his real-part form of the
normalised van der Corput inequality; counts of integers `n` at which `f(n)` lies within `δ` of an
integer; explicit Pólya–Vinogradov inequalities
for Dirichlet characters, from the Gauss-sum expansion to the constants of Pomerance, Lapkova and
Frolenkov–Soundararajan; explicit Burgess inequalities for characters to a prime modulus, with
Burgess's moment bound and the constants of McGown and Treviño; and explicit sieve upper bounds:
Montgomery–Vaughan's weighted arithmetic large sieve and their sifted form of the Brun–Titchmarsh
inequality with the prime-power sums of Ramaré–Viswanadham, Büthe's weighted Brun–Titchmarsh
inequalities, Greaves's lower bound for Selberg's density sum and Fan's bounds for integers free
of small prime factors. Everything rests on Mathlib's Dirichlet characters, Gauss sums,
Selberg-sieve carrier and Fourier character, on Tau Ceti's Gauss-sum norm, partial-sum lemmas and
Hasse bound, on the forbidden-residue large sieve and Selberg's weights of
SieveMethodsAndPrimePatterns, the finite van der Corput inequality and the weighted large sieve of
ExplicitZetaBounds, Weil's bound of CharacterSumsOverFiniteFields, the character-sum point count of
EllipticLegendreCharacterInterfaces, the explicit prime-number estimates of
AnalyticNumberTheoryPartI, and the Brun–Titchmarsh inequality and Montgomery–Vaughan's lower bound
for the diagonal sum `Σ_{q ≤ u} μ²(q)/φ(q)` of ExplicitPrimeCounting. Every result that rests on a
table or on a finite verification takes that verification as a named hypothesis (Layer 6, or the
named input of the supplier section it comes from), and the analytic argument is proved from it.

The end theorems are:

- Arias de Reyna's iterated van der Corput inequality with the constant `2 + 2√2` (Layer 1);
- the first and second derivative tests for integers near a curve (Layer 2);
- the Pólya–Vinogradov inequalities `M_χ < (2/π)√q (log q + log(4/π) + π²/(12q²))` for primitive
  `χ`, Pomerance's and Lapkova's parity-dependent constants, and
  `|S_χ| ≤ (1/(π√2))√q (log q + 6) + √q` for every nonprincipal `χ` modulo `q ≥ 1000` (Layer 3);
- Burgess's moment bound `Σ_x |Σ_{b ≤ B} χ(x + b)|^{2r} ≤ (2r − 1)!! B^r p + (2r − 1) B^{2r} √p`
  for every `r ≥ 1`, and the Burgess inequalities of McGown (parametric and tabulated) and of
  Treviño (tabulated, and uniform with the constant `2.74`) (Layer 4);
- Greaves's density-sum bound, Büthe's weighted Brun–Titchmarsh inequalities, the
  Ramaré–Viswanadham prime-power sum `≤ 2B/(φ(d) log(B/d))` and Fan's `Φ(x, z) < x/log z`
  (Layer 5).

[`Suggested.lean`](Suggested.lean) states these headline theorems against the pinned libraries,
with the few definitions their statements need; it is not the roadmap.

## Scope and ownership

**Owned here.** The real-part form of the normalised van der Corput inequality (Layer 0), Arias de
Reyna's iterated van der Corput inequality (Layer 1), the explicit counts of integer points near a
curve by the first and second derivative and by exponential sums (Layer 2), the explicit
Pólya–Vinogradov inequalities and the elementary character-sum identities they use (Layers 0 and
3), the explicit Burgess inequalities for a prime modulus together with Burgess's moment bound and
McGown–Trudgian's refinement of it at `r = 2`, the multiplicative-energy counts and Burgess's
amplification inequality (Layer 4), the Selberg diagonal carriers with the coprime comparison,
Büthe's weight-mass asymptotic and the diagonal bound from `z = 3`, the weighted arithmetic large
sieve and the explicit sieve upper bounds (Layer 5), and the named computational hypotheses
(Layer 6).

**The van der Corput toolkit.** ExplicitZetaBounds, earlier in the order of supply, owns the
Kusmin–Landau inequality in its symmetric and asymmetric forms (§4.1), the finite van der Corput
inequality for complex coefficients with its `|C(h)|` and normalised forms and the A-process
(§4.2), Arias de Reyna's second derivative tests (§4.3), Patel's corrected third, fourth and fifth
derivative tests and the `k`-th derivative test with Yang's recursive constants (§4.4), and the
truncated Poisson formula, stationary phase and the B-process (§4.5); this roadmap consumes §4.2
and restates none of them. Kept here: Arias de Reyna's real-part form of the normalised inequality
(§0.3), which differs from the normalised form of ExplicitZetaBounds §4.2 in keeping the real part
of the weighted lag sum; and Arias de Reyna's iterated inequality (§1.1), which assumes no
derivative bound at all.

**Consumed, not restated.** Mathlib supplies Dirichlet characters with conductor, primitivity,
parity and primitive character, Gauss sums of multiplicative characters and their shift identity
for primitive characters, the quadratic character of a finite field, the native `BoundingSieve`
and `SelbergSieve` carriers, the von Mangoldt function, prime counting, totient, Möbius function,
absolutely continuous functions and `Real.fourierChar`. Tau Ceti supplies the norm of a primitive
Gauss sum, the vanishing of a nonprincipal character over a full period and the Hasse bound for
elliptic curves over finite fields. SieveMethodsAndPrimePatterns §2.9 owns the large sieve for
forbidden residues `J(Q)|Σ aₙ|² ≤ (H − 1 + Q²)Σ|aₙ|²`, consumed by Fan's bound, and §1.3 owns
Selberg's optimal weights on the native carrier, consumed by Büthe's weighted sieve; its §1.1
owns the qualitative asymptotics of Selberg diagonal sums, and §5.1 here differs from it in
having explicit constants. ExplicitZetaBounds §6.5 owns Montgomery–Vaughan's weighted large sieve
`Σ_x (N + (3/2)δ(x)⁻¹)⁻¹|S(x)|² ≤ Σ|aₙ|²` for an arbitrary finite set of points, consumed by the
weighted arithmetic large sieve of §5.5, which differs from it in being its sieve form, at the
Farey fractions and for sequences avoiding residue classes. CharacterSumsOverFiniteFields
§4.7 owns Weil's bound `|Σ_x χ(f(x))| ≤ (m − 1)√q`, consumed by Burgess's moment bound.
EllipticLegendreCharacterInterfaces §5.1 owns the identity between the Frobenius trace of a
Weierstrass equation `y² = x³ + a₂x² + a₄x + a₆` over an odd finite field and the quadratic
character sum of its cubic, consumed with Tau Ceti's Hasse bound in the quadratic case of the
`r = 2` moment bound. AnalyticNumberTheoryPartI §§0.5, 0.8, 0.19 and 0.20 own the explicit
Rosser–Schoenfeld estimates for `π(x)`, `Σ log p/p` and `Σ 1/p`, consumed by McGown's Burgess
inequality and by Fan's bound. ExplicitPrimeCounting §0.1 owns Montgomery–Vaughan's
Brun–Titchmarsh inequality `π(x + y; k, l) − π(x; k, l) ≤ 2y/(φ(k) log(y/k))` (`brun_titchmarsh`)
together with the inputs of its proof: the bound `S(u) > log u` from the kernel identity for the
diagonal sum `S(u) = Σ_{q ≤ u} μ²(q)/φ(q)`, Büthe's explicit asymptotic for `S`, Montgomery–Vaughan's
bound `S(u) ≥ log u + 1.07` for `u ≥ 6` with its finite-range proposition `MVDiagonalFiniteRange`,
the step from one prime to a squarefree modulus for a sequence avoiding one residue class modulo
each sieving prime, and the comparison `L₁(Q) ≤ (k/φ(k)) L_k(Q)` of the weighted diagonal sums;
§§5.1, 5.5 and 5.6 here consume them. §5.1 adds the bound `S(z) ≥ log z + 0.89` from `z = 3`,
which differs in reaching below `6` with a smaller constant; §5.5 owns the weighted arithmetic
large sieve, which differs from that step in allowing `ω(p)` forbidden classes modulo each prime
and an arbitrary sifted set, and the sifted form, which differs from `brun_titchmarsh` in counting
every integer of the progression free of prime factors up to a level `z`, with `π(z)` added, the
form that the prime-power sums need. No large-sieve constant, Selberg weight, diagonal bound,
Gauss-sum evaluation, Weil bound or Hasse bound is proved a second time.

**Not owned here.** The qualitative Brun–Titchmarsh bound with an unspecified constant and the
qualitative twin-prime and Goldbach upper bounds are SieveMethodsAndPrimePatterns §1.6; the
linear-sieve functions `F`, `f` and the Rosser–Iwaniec linear sieve with an unspecified error
constant are SieveMethodsAndPrimePatterns §5.2; the weighted finite Hilbert inequality with
constant `3π/2` is AnalyticNumberTheoryPartI §1.5a; the explicit Erdős–Turán inequality is
ProbabilisticAndMetricNumberTheory §2.7. Outside this roadmap and its Part II are: bounds for
`L(1, χ)` and class numbers; the least `k`-th power non-residue, primitive roots and
norm-Euclidean fields; Vinogradov's mean value theorem; every algorithm and every proof of a table.
None of the results here depends on zeros of `L`-functions, so the exclusion of Landau–Siegel
zeros (AnalyticNumberTheoryPartI §0.34) is not used.

**ExplicitCharacterSumsAndSieves, Part II.** The following explicit results are the subject of
ExplicitCharacterSumsAndSieves, Part II, a later roadmap that consumes Layers 0–6 of this one. This
roadmap stops at the derivative tests of Layer 1, the first and second derivative counts of Layer
2, the Pólya–Vinogradov inequalities of Layer 3, the Burgess inequalities for a prime modulus of
Layer 4 and the sieve bounds of Layer 5.

- Arias de Reyna's uniform explicit `d`-th derivative estimate for exponential sums
  (ariasdereyna2024 Theorem 11, line 555), built on §1.1.
- The explicit `k`-th derivative test (`k ≥ 3`) for integer points near a curve: Bordellès's
  explicit form of the theorem of Huxley and Sargos (bordelles2012 Theorem 5.12; the qualitative
  form is huxleysargos1995 Théorème 1, line 39), with the correction of the major-arc lemma and the
  corrected constants of zhao2024 Theorem 2.1 (line 84).
- Bachman–Rachakonda's bound `(1/(3 log 3))√q log q + 6.5√q` for nonprincipal characters of every
  modulus (bachmanrachakonda2001 Theorem 1); §3.5 implies it for primitive characters and §3.6
  for `q ≥ 1000`.
- Explicit partial Gaussian sums and the Pólya–Vinogradov bounds with leading constant reduced by
  them: Bordignon–Kerr for squarefree moduli (bordignonkerr2020 Theorem 2, Corollary 1 and
  Theorem 5, lines 156–220) and Bordignon for primitive characters of every large modulus
  (bordignon2022partial Theorem 1.1, lines 69–75, with its Tables 1–3, and the Burgess-type bound
  for twisted characters it uses, Theorem 1.3, lines 123–126).
- Booker's Burgess inequality for the quadratic character of a prime `d > 10²⁰` with
  `d ≡ 1 (mod 4)`, with its table of `α(r)` and `β(r)` (booker2006 Proposition 2 and Table 1,
  lines 350–379).
- Burgess inequalities for composite moduli (jainsharmakhaleliu2021 Theorem 1.1 and
  Corollary 1.2, lines 86–91).
- Francis's refined Burgess constants for a prime modulus (francis2021 Theorem 1.8, Tables 3
  and 6, lines 127–145 and 810).
- The dimension-two sieve bounds: Siebert's bound with leading constant `16C₂` for the primes `p`
  with `ap + b` prime, `C₂ = ∏_{p > 2}(1 − (p − 1)⁻²)` the twin-prime constant (siebert1976;
  tmeemt-art14 line 119), Riesel–Vaughan's Lemma 4 with its table of pairs `(L, A)`
  (rieselvaughan1983; tmeemt-art14 lines 126–155), the enclosure `0.66016 ≤ C₂ ≤ 0.66017`
  (platttrudgian2018 line 163 encloses `2C₂`) and Platt–Trudgian's upper bound for the twin-prime
  count (platttrudgian2018 display (11), line 188), built on the weighted arithmetic large sieve
  of §5.5.
- The explicit linear sieve of Bordignon–Johnston–Starichkova (bordignonjohnstonstarichkova2022
  Theorem 6, line 147).
- Yamada's Brun–Titchmarsh inequality with `log(y/k) + 0.8601` in place of `log(y/k)` (yamada2023
  Theorem 2, lines 104–106).

**Sources stated at second hand.** The Montgomery–Vaughan weighted sieve and sifted bound (5.5),
the Frolenkov–Soundararajan bound for nonprincipal characters (3.6), the integer-point first and
second derivative tests (2.2, 2.3) and Greaves's density-sum bound (5.2) are stated from the
TME-EMT pages and from papers that quote the primary statements; the primary texts are cited by
locator. For 2.2, 5.2 and 5.5 the proof route given here is complete in itself.

## Conventions

- `e(x) = exp(2πix)`, the complex value of Mathlib's `Real.fourierChar x` (which lands in
  `Circle`); `e(1/4) = i` and `e(1/2) = −1`.
- For real `a ≤ b` and `f : ℝ → ℝ`, the **interval exponential sum** is
  `S_f[a, b] = Σ_{n ∈ ℤ, a ≤ n ≤ b} e(f(n))`, a finite sum over `Finset.Icc ⌈a⌉ ⌊b⌋`
  (`intervalExpSum`). The half-open form `Σ_{X < n ≤ X+Y}` of several sources is the case
  `a = ⌊X⌋ + 1`, `b = X + Y`.
- "`f` has `k` continuous derivatives on `[a, b]`" means `ContDiffOn ℝ k f (Set.Icc a b)`, and the
  derivatives in hypotheses are the derivatives within `[a, b]` (`derivWithin`,
  `iteratedDerivWithin`; one-sided at the endpoints).
- `‖x‖` is the distance from `x` to the nearest integer, `|x − round x|`, which is Mathlib's norm
  on `UnitAddCircle` (`UnitAddCircle.norm_eq`).
- For real `a`, real `N ≥ 0`, `δ > 0` and `f : ℝ → ℝ`, the **near-integer count** `R(f, a, N, δ)`
  (`nearIntegerCount`) is the number of integers `n` with `a ≤ n ≤ a + N` and `‖f(n)‖ < δ` (strict
  inequality). The TME-EMT count on `[N, 2N]` is `R(f, N, N, δ)`.
- Characters: `χ : DirichletCharacter ℂ q`. For `M ∈ ℤ` and `N ∈ ℕ` the **character interval sum**
  is `S_χ(M, N) = Σ_{M < n ≤ M+N} χ(n)` (`charIntervalSum`), each integer cast to `ZMod q`. The
  **maximal interval sum** is `M_χ = max_{0 ≤ M < q, 0 ≤ N ≤ q} |S_χ(M, N)|`, a finite maximum; for
  `χ ≠ 1` it bounds `|S_χ(M, N)|` for all `M` and `N` (§0.4), so a bound for `M_χ` is the same
  statement as a bound for every interval sum, and `M_χ` equals Pomerance's `S(χ)` and Lapkova's
  `M_χ`. "Primitive", "even" and "odd" are Mathlib's `DirichletCharacter.IsPrimitive`,
  `DirichletCharacter.Even` (`χ(−1) = 1`) and `DirichletCharacter.Odd` (`χ(−1) = −1`).
- `ω(n)` is the number of distinct prime factors (`ArithmeticFunction.cardDistinctFactors`),
  `d(n)` the number of divisors, `σ(n)` the sum of divisors, `φ` the totient, `μ` the Möbius
  function, `Λ` the von Mangoldt function, `γ` Euler's constant
  (`Real.eulerMascheroniConstant`), `(2r − 1)!!` Mathlib's `Nat.doubleFactorial`.
- `π(x; k, ℓ)` is the number of primes `p ≤ x` with `p ≡ ℓ (mod k)`; `Φ(x, z)` (`roughCount`) is the
  number of integers `1 ≤ n ≤ x` with no prime factor `p ≤ z` (so `1` is counted);
  `S(z) = Σ_{1 ≤ n ≤ z} μ²(n)/φ(n)` (`selbergDiagonal`) and
  `S_k(z) = Σ_{1 ≤ n ≤ z, (n, k) = 1} μ²(n)/φ(n)` are the Selberg diagonal sums, and
  `H_k(z) = Σ_{1 ≤ n ≤ z, (n, k) = 1} μ²(n)σ(n)/φ(n)`, with `H₁` = `selbergWeightMass`.
- Real logarithms are natural; `log` of a nonpositive number never occurs in a stated bound
  (each statement carries the hypothesis making its arguments positive). Division by zero does not
  occur: every denominator in a stated bound is positive under the stated hypotheses.
- A table or finite verification enters only as a named hypothesis of Layer 6 or as the named
  input of a supplier section. A theorem that consumes AnalyticNumberTheoryPartI §0.5 carries that
  section's named input `RosserSchoenfeldFiniteRangeInput`, which `Suggested.lean` restates with
  the same content so that those theorems are statable at the pins: for every real
  `59 ≤ x < exp 10000`, `(x/log x)(1 + 1/(2 log x)) < π(x) < (x/log x)(1 + 3/(2 log x))`. A theorem
  that consumes the diagonal bound of ExplicitPrimeCounting §0.1 carries that section's named input
  `MVDiagonalFiniteRange`, which `Suggested.lean` restates in the same way: for every real
  `6 ≤ z < 10⁹`, `S(z) ≥ log z + 1.07`.

## Exact supplier contracts

### From Mathlib

At the pinned commit `1b1ccf4b088b32fa3f23f2de1127433254a81e1e`:

- `Real.fourierChar : AddChar ℝ Circle` and `Real.fourierChar_apply`
  (`Mathlib/Analysis/Complex/Circle.lean`, lines 221 and 232): `e(x) = exp(2πix)`.
- `UnitAddCircle.norm_eq` (`Mathlib/Analysis/Normed/Group/AddCircle.lean`, line 223):
  `‖(x : UnitAddCircle)‖ = |x − round x|`.
- `DirichletCharacter.conductor`, `DirichletCharacter.IsPrimitive`,
  `DirichletCharacter.primitiveCharacter`, `DirichletCharacter.primitiveCharacter_isPrimitive`,
  `DirichletCharacter.changeLevel_primitiveCharacter`, `DirichletCharacter.eq_one_iff_conductor_eq_one`,
  `DirichletCharacter.IsPrimitive.inv`, `DirichletCharacter.Even`, `DirichletCharacter.Odd`,
  `DirichletCharacter.even_or_odd`, `DirichletCharacter.Even.eval_neg`,
  `DirichletCharacter.Odd.eval_neg` (`Mathlib/NumberTheory/DirichletCharacter/Basic.lean`, lines
  245–572); `DirichletCharacter.norm_le_one` (`.../Bounds.lean`, line 44).
- `gaussSum` (`Mathlib/NumberTheory/GaussSum.lean`, line 72), `gaussSum_mulShift_of_isPrimitive`
  (`Mathlib/NumberTheory/DirichletCharacter/GaussSum.lean`, line 59): for primitive `χ` and every
  `a`, including non-units, `gaussSum χ (e.mulShift a) = χ⁻¹(a) gaussSum χ e`; `ZMod.stdAddChar`
  and `ZMod.isPrimitive_stdAddChar`
  (`Mathlib/Analysis/SpecialFunctions/Complex/CircleAddChar.lean`, lines 83 and 95).
- `BoundingSieve`, `SelbergSieve`, `BoundingSieve.siftedSum_le_mainSum_errSum_of_upperMoebius`,
  `BoundingSieve.upperMoebius_lambdaSquared` (`Mathlib/NumberTheory/SelbergSieve.lean`, lines 54,
  78, 217 and 251). The carrier records a finite weighted support, a squarefree prime product, a
  multiplicative density with `0 < ν(p) < 1` and an approximation `X`; it carries no remainder
  estimate.
- `quadraticChar` and `quadraticChar_ne_one`
  (`Mathlib/NumberTheory/LegendreSymbol/QuadraticChar/Basic.lean`, lines 120 and 207): the quadratic
  character of `ZMod p` for an odd prime `p`, which is the unique character of order two of the
  cyclic group `(ZMod p)ˣ`.
- `Nat.primeCounting`, `ArithmeticFunction.vonMangoldt`, `ArithmeticFunction.moebius`,
  `Nat.totient`, `ArithmeticFunction.cardDistinctFactors`, `ArithmeticFunction.sigma`,
  `Nat.doubleFactorial`, `Real.eulerMascheroniConstant`, `Real.eulerMascheroniSeq` (the sequence
  `H_n − log(n + 1)`) and `Real.eulerMascheroniSeq_lt_eulerMascheroniConstant`
  (`Mathlib/NumberTheory/Harmonic/EulerMascheroni.lean`, lines 50 and 159: `H_n − log(n + 1) < γ`
  for every `n`), `Real.log_le_sub_one_of_pos` (`Mathlib/Analysis/SpecialFunctions/Log/Basic.lean`,
  line 307), `Complex.re_le_norm` (`Mathlib/Analysis/Complex/Norm.lean`, line 45).
- `ContDiffOn`, `derivWithin`, `iteratedDerivWithin`, `exists_deriv_eq_slope`
  (`Mathlib/Analysis/Calculus/Deriv/MeanValue.lean`, line 155), `AbsolutelyContinuousOnInterval`
  (`Mathlib/MeasureTheory/Function/AbsolutelyContinuous.lean`, line 155) and
  `AbsolutelyContinuousOnInterval.integral_deriv_eq_sub`
  (`Mathlib/MeasureTheory/Integral/IntervalIntegral/AbsolutelyContinuousFun.lean`, line 227).
- `Finset.sum_mul_sq_le_sq_mul_sq` (`Mathlib/Algebra/Order/BigOperators/Ring/Finset.lean`, line
  171) and `Real.inner_le_Lp_mul_Lq_of_nonneg` (`Mathlib/Analysis/MeanInequalities.lean`, line
  954), the finite Cauchy–Schwarz and Hölder inequalities; `ConvexOn.map_integral_le`
  (`Mathlib/Analysis/Convex/Integral.lean`, line 196), Jensen's inequality for a probability
  measure, used in the tuple count of 4.1.
- `Complex.hasSum_taylorSeries_neg_log` (`Mathlib/Analysis/SpecialFunctions/Complex/LogBounds.lean`,
  line 280), `Complex.tendsto_tsum_powerSeries_nhdsWithin_stolzSet`
  (`Mathlib/Analysis/Complex/AbelLimit.lean`, line 162), `hasSum_fourier_series_of_summable`
  (`Mathlib/Analysis/Fourier/AddCircle.lean`, line 493), `strictConcaveOn_sin_Icc`
  (`Mathlib/Analysis/Convex/SpecificFunctions/Deriv.lean`, line 164), `Real.sin_le` and
  `Real.mul_le_sin` (`Mathlib/Analysis/SpecialFunctions/Trigonometric/Bounds.lean`, lines 56
  and 84), `ZMod.unitOfCoprime` (`Mathlib/Data/ZMod/Basic.lean`, line 794).

The pin has no Kusmin–Landau lemma, no derivative test, no Pólya–Vinogradov or Burgess
inequality, no Brun–Titchmarsh inequality and no large sieve.

### From Tau Ceti

At the pinned commit `2fd255d997f47c0b5d834ee416c7015d55444ce5`:

- `DirichletCharacter.gaussSum_mul_gaussSum_inv_eq_card_of_isPrimitive` and
  `DirichletCharacter.IsPrimitive.norm_gaussSum`
  (`TauCeti/NumberTheory/DirichletCharacter/GaussSum.lean`, lines 43 and 82): for primitive `χ`
  of level `n` and a primitive additive character `e`, `‖gaussSum χ e‖ = √n`.
- `DirichletCharacter.IsPrimitive.eq_one_iff`
  (`TauCeti/NumberTheory/DirichletCharacter/Conductor.lean`, line 25): a primitive character is
  principal exactly when its level is `1`; and `DirichletCharacter.even_of_le_two`
  (`TauCeti/NumberTheory/DirichletCharacter/Even.lean`, line 77): at levels `1` and `2` every
  character is even, because `−1 = 1` there.
- `DirichletCharacter.sum_range_level_eq_zero`, `DirichletCharacter.sum_range_eq_sum_range_mod`
  and `DirichletCharacter.norm_sum_Icc_le_level`
  (`TauCeti/NumberTheory/DirichletCharacter/PartialSum.lean`, lines 30, 37 and 49): a
  nonprincipal character sums to zero over a full period, its initial sums depend on the endpoint
  modulo the level, and they are bounded by the level.
- `WeierstrassCurve.hasse_bound` and `WeierstrassCurve.frobeniusTrace_sq_le_four_mul_card`
  (`TauCeti/AlgebraicGeometry/EllipticCurve/HasseBound.lean`, lines 57 and 44): an elliptic curve
  over a finite field with `q` elements has `(#E(𝔽_q) − (q + 1))² ≤ 4q`, the count including the
  point at infinity; `WeierstrassCurve.pointCount` and `WeierstrassCurve.frobeniusTrace_eq_card_point`
  (`TauCeti/AlgebraicGeometry/EllipticCurve/PointCount.lean`, lines 73 and 115).

### From TauCetiRoadmap.SieveMethodsAndPrimePatterns

- §2.9, "Large sieve for forbidden residues": for a finite prime set with forbidden residue sets
  `Ω_p`, `|Ω_p| < p`, and coefficients supported on `H ≥ 1` consecutive integers avoiding every
  forbidden residue, `J(Q)|Σ aₙ|² ≤ (H − 1 + Q²)Σ|aₙ|²` for `Q ≥ 1`, where
  `J(Q) = Σ_{d ≤ Q} μ²(d)∏_{p | d}|Ω_p|/(p − |Ω_p|)` over squarefree `d` composed of sieving
  primes. Consumed in 5.6 (the class `0`); in 5.5 it enters only the Check showing that it does
  not reach the constant `2`.
- §1.3, "Selberg optimal weights" and "Selberg upper-bound sieve": the optimal weights `λ_z` on a
  native `BoundingSieve` with `λ_z(1) = 1`, `|λ_z(d)| ≤ 1`, strict cutoff `d < z` and main term
  `1/G(s, z)`. Consumed in 5.3.

### From TauCetiRoadmap.CharacterSumsOverFiniteFields

- §4.7, `weil_mulChar_sum_bound`: for a finite field `F` with `q` elements, `χ ≠ 1` of order `d`
  and `f ∈ F[X]` nonzero, not of the form `c·h^d`, with `m` distinct roots in `F̄`,
  `|Σ_{x ∈ F} χ(f(x))| ≤ (m − 1)√q`. Consumed at `F = ZMod p` in 4.1.

### From TauCetiRoadmap.EllipticLegendreCharacterInterfaces

- §5.1, the character-sum point count: for a finite field `F` of odd characteristic with `q`
  elements and a Weierstrass equation with `a₁ = a₃ = 0` and cubic
  `f(x) = x³ + a₂x² + a₄x + a₆`, the point count is `q + 1 + Σ_x quadraticChar(F)(f(x))` and the
  Frobenius trace is `−Σ_x quadraticChar(F)(f(x))`, singular equations included. Consumed at
  `F = ZMod p` in the quadratic case of the `r = 2` moment bound of 4.1, with Tau Ceti's
  `WeierstrassCurve.hasse_bound` for a squarefree cubic.

### From TauCetiRoadmap.AnalyticNumberTheoryPartI

- §0.5: under `RosserSchoenfeldFiniteRangeInput`, for `x ≥ 59`,
  `(x/log x)(1 + 1/(2 log x)) < π(x) < (x/log x)(1 + 3/(2 log x))`.
- §0.8: an absolute constant `E` with
  `log x + E − 1/(2 log x) < Σ_{p ≤ x} log p/p < log x + E + 1/(2 log x)` for `x ≥ 319`, and
  §0.20, its interval form `Σ_{y < p ≤ x} log p/p > log(x/y) − 1/(2 log x) − 1/(2 log y)` for
  `x ≥ y ≥ 319`.
- §0.19: `|Σ_{p ≤ x} 1/p − log log x − B| < 1/(2 log² x)` for `x ≥ 286`.

All four are consumed in 5.6, at arguments at least `319`; smaller arguments are covered by the
finite-range hypothesis of Layer 6. §0.5 is consumed also in 4.4, for the lower bound
`π(A) > A/log A` at integers `A ≥ 59`, so the theorems of 4.4 carry
`RosserSchoenfeldFiniteRangeInput`.

### From TauCetiRoadmap.ExplicitZetaBounds

- §4.2, the finite van der Corput inequality: for integers `N, H ≥ 1` and complex `b_1, …, b_N`,
  with `C(h) = Σ_{n=1}^{N−h} b_{n+h} conj(b_n)` for `1 ≤ h < N` and `C(h) = 0` for `h ≥ N`,
  `H²|Σ_{n≤N} b_n|² ≤ (N + H − 1)(H Σ_{n≤N} |b_n|² + 2 Re Σ_{h=1}^{H−1} (H − h) C(h))`, proved by
  writing `H Σ_n b_n = Σ_m Σ_{j=0}^{H−1} b_{m−j}` (with `b` extended by zero) and applying
  Cauchy–Schwarz in `m`; consumed in 0.3. And its normalised form: for real `X`, `Y ≥ 1`, an
  integer `1 ≤ H ≤ Y` and complex `b_n` with `|b_n| ≤ 1` on the integers of `(X, X + Y]`,
  `|Y⁻¹ Σ_{X<n≤X+Y} b_n|² ≤ 4/H + (4/(HY)) Σ_{h=1}^{H−1} |Σ_{X<n, n+h≤X+Y} b_{n+h} conj(b_n)|`;
  consumed in 1.1 at `b_n = e(f(n))`, where the lag sum at `h` is `S_{g_h}[⌊X⌋ + 1, X + Y − h]`
  with `g_h(x) = f(x + h) − f(x)` (§0.1).
- §6.5, Montgomery–Vaughan's weighted large sieve with `c = 3/2`: for a finite set `X ⊂ ℝ/ℤ` with
  at least two points, `δ(x)` the distance from `x` to `X ∖ {x}`, an integer `M`, `N ≥ 1` and
  complex `a_n` on `M < n ≤ M + N`,
  `Σ_{x ∈ X} (N + (3/2)δ(x)⁻¹)⁻¹ |Σ_n a_n e(nx)|² ≤ Σ_n |a_n|²`. Consumed in 5.5.

### From TauCetiRoadmap.ExplicitPrimeCounting

Its §0.1 writes `S(u) = Σ_{q ≤ u} μ²(q)/φ(q)`, which is `selbergDiagonal` here, and
`L(Q, N) = Σ_{q ≤ Q} μ²(q)/(φ(q)(N + (3/2)qQ))` for integers `Q ≥ 2`, `N ≥ 1`.

- §0.1, the diagonal bound: `S(u) > log u` for every real `u ≥ 1`, from the kernel identity
  `S(u) = Σ_{rad m ≤ u} 1/m`; Büthe's explicit asymptotic
  `S(u) = log u + γ + Σ_p log p/(p(p − 1)) + θ · 58/√u` with `|θ| ≤ 1` for real `u ≥ 10⁹`
  (buthe2014 Lemma 4.5, lines 462–468), which gives `S(u) ≥ log u + 1.32` there; and, under
  `MVDiagonalFiniteRange` (for every real `6 ≤ u < 10⁹`, `S(u) ≥ log u + 1.07`),
  Montgomery–Vaughan's bound `S(u) ≥ log u + 1.07` for every real `u ≥ 6`. Consumed in 5.1, 5.4
  (the asymptotic), 5.5 and 5.6.
- §0.1, two steps of the proof of `brun_titchmarsh`: for a set of `Z` integers avoiding one residue
  class modulo each prime factor of a squarefree `q`, the sums `S(α) = Σ_{m in the set} e(mα)`
  satisfy `Σ*_{a mod q} |S(a/q)|² ≥ Z²/φ(q)`, which is the case `ω(p) = 1` of the step in 5.5; and
  the comparison `L₁(Q) ≤ (k/φ(k)) L_k(Q)` of `L₁(Q) = L(Q, N)` with
  `L_k(Q) = Σ_{q ≤ Q, (q, k) = 1} μ²(q)/(φ(q)(N + (3/2)qQ))`, consumed in 5.5.
- §0.1, `brun_titchmarsh`: under `MVDiagonalFiniteRange` and `BrunTitchmarshFiniteRange` (for every
  integer `25 ≤ n ≤ 2·10⁴` there is an integer `Q ≥ 2` with `1/L(Q, n + 1) + π(Q) ≤ 2n/log n`),
  for real `x, y > 0` and coprime positive integers `k`, `l` with `y > k`, the number of primes
  `p ≡ l (mod k)` in `(x, x + y]` is at most `2y/(φ(k) log(y/k))`. Consumed in the Checks of 5.4;
  the sifted form of 5.5 implies the same prime count without `BrunTitchmarshFiniteRange`.

## How to read the build

Layer 0 fixes the carriers (the exponential sum over the integers of an interval, the distance to
the nearest integer and the near-integer count, the character interval sum and its maximum),
proves the real-part form of the normalised van der Corput inequality from the finite inequality
of ExplicitZetaBounds, and the elementary identities for character sums (periodicity, the
symmetry of even characters, the reduction to the primitive character). Layer 1 proves Arias de
Reyna's iterated van der Corput inequality from the normalised form of ExplicitZetaBounds §4.2.
Layer 2 counts integer points near curves by the mean value theorem,
by Huxley's reduction and by Fejér's kernel. Layer 3 expands character sums in Gauss sums and
proves the explicit Pólya–Vinogradov inequalities. Layer 4 proves Burgess's moment bound from
Weil's bound (and, at `r = 2` for the quadratic character, from Hasse's bound), the
multiplicative-energy counts and Burgess's amplification inequality, and derives the tabulated
Burgess constants from the Layer 6 propositions. Layer 5 proves the explicit bounds for Selberg
diagonal sums that the sieves need beyond those of ExplicitPrimeCounting, the weighted arithmetic
large sieve and the explicit sieve upper bounds. Layer 6 names the computational hypotheses:
numerical inequalities over explicitly bounded ranges, and, for Treviño's two tables,
inequalities between explicit functions of `p ≥ p₀`; none is a statement about characters or
primes in general. Read each claim with its hypotheses and its *Needs:* line.

## Layer 0: carriers, the real-part van der Corput bound and character-sum identities

### 0.1 the exponential sum over the integers of an interval

Define `intervalExpSum` `f a b`, the interval exponential sum
`S_f[a, b] = Σ_{n ∈ ℤ, a ≤ n ≤ b} e(f(n))` for `f : ℝ → ℝ` and real `a`, `b`, as a finite sum
over `Finset.Icc ⌈a⌉ ⌊b⌋`, with `e(x)` the complex value of `Real.fourierChar x`.

- If `[a, b]` contains no integer (in particular if `b < a`), the sum is `0`.
- Adding a real constant to `f` multiplies the sum by a unit complex number; adding `k·x` with
  `k ∈ ℤ` leaves every term unchanged; replacing `f` by `−f` conjugates the sum.
- For an integer `c` with `a ≤ c < b`, `S_f[a, b] = S_f[a, c] + S_f[c + 1, b]`.
- `|S_f[a, b]| ≤ ⌊b⌋ − ⌈a⌉ + 1 ≤ b − a + 1` when `[a, b]` contains an integer.
- For real `X` and `Y ≥ 0`, `Σ_{X < n ≤ X+Y} e(f(n)) = S_f[⌊X⌋ + 1, X + Y]`.

**Checks.**

- `f ≡ 0` on `[0, 2]` gives `3`; on `[0.2, 0.8]` the sum is empty and equals `0`; a definition
  over the real interval's length instead of its integers would give a nonzero value here.
- `f(x) = x/2` on `[0, 3]` gives `1 − 1 + 1 − 1 = 0`, and on `[0, 2]` gives `1`; this pins
  `e(1/2) = −1`, which a convention `e(x) = exp(ix)` would fail.
- `f(x) = x` on `[0, 2]` equals the sum for `f ≡ 0`, namely `3`: integer slopes are invisible.
- The half-open sum over `0.5 < n ≤ 2.5` is `S_f[1, 2.5]`, with the two terms `n = 1, 2`; the
  closed sum `S_f[0.5, 2.5]` has the same two terms, while `S_f[0, 2]` has three.

*Needs:* Mathlib `Real.fourierChar`, `Int.ceil`, `Int.floor`, `Finset.Icc`.

### 0.2 the distance to the nearest integer and the near-integer count

The distance to the nearest integer is `|x − round x|`, Mathlib's norm on `UnitAddCircle` through
`UnitAddCircle.norm_eq`. Define `nearIntegerCount` `f a N δ`, the near-integer count
`R(f, a, N, δ)`, as the number of integers `n` with `a ≤ n ≤ a + N` and `‖f(n)‖ < δ`, for real `a`,
`N ≥ 0` and `δ > 0` (for `N = 0` the count is `1` or `0` according as `a` is an integer with
`‖f(a)‖ < δ` or not).

- `R(f, a, N, δ) ≤ N + 1`, and `R` is monotone in `δ` and in the interval.
- `R(f + k, a, N, δ) = R(f, a, N, δ)` for every integer `k`, and `R(−f, a, N, δ) = R(f, a, N, δ)`.
- If `δ > 1/2` every integer of the interval is counted.

**Checks.**

- `‖2.3‖ = 0.3`, `‖2.5‖ = 0.5`, `‖−0.2‖ = 0.2`; the fractional part would give `0.8` at `−0.2`.
- `f(x) = x/3`, `a = 0`, `N = 6`, `δ = 0.1`: the counted integers are `0, 3, 6`, so `R = 3`.
- Strictness: `f(x) = x/3`, `a = N = 1`, `δ = 1/3` does not count `n = 1`, since `‖1/3‖ = 1/3`;
  a non-strict count would.
- Length zero: `R(x/3, 3, 0, 0.1) = 1` (`‖1‖ = 0`) and `R(x/3, 2.5, 0, 0.5) = 0` (no integer);
  §2.3 evaluates `R` at length `N − h = 0` when `h = A = N`, so the domain includes `N = 0`.

*Needs:* Mathlib `UnitAddCircle.norm_eq`, `round`.

### 0.3 the real-part form of the normalised van der Corput inequality

Let `X` be real, `Y ≥ 1`, `1 ≤ H ≤ Y` a natural number and `b_n` complex numbers with `|b_n| ≤ 1`
on the integers `n` of `(X, X + Y]`; put `C(h) = Σ_{X<n, n+h≤X+Y} b_{n+h} conj(b_n)`. Prove

    |Y⁻¹ Σ_{X<n≤X+Y} b_n|² ≤ 4/H + (4/(HY)) Re(H⁻¹ Σ_{h=1}^{H−1} (H − h) C(h))

(ariasdereyna2024 Lemma 6, lines 224–227). It differs from the normalised form of
ExplicitZetaBounds §4.2, whose right side is `4/H + (4/(HY)) Σ_{h=1}^{H−1} |C(h)|`, in keeping the
real part of the weighted lag sum, and it implies that form because `(H − h)/H ≤ 1` and
`Re w ≤ |w|` (Mathlib `Complex.re_le_norm`). Proof: let `N` be the number of integers in
`(X, X + Y]`; then `1 ≤ N ≤ Y + 1 ≤ 2Y` and `N + H − 1 ≤ 2Y`. With `b` extended by zero, the
expansion behind the finite inequality of ExplicitZetaBounds §4.2 shows that its second factor is a
sum of squares,
`H Σ|b_n|² + 2 Re Σ_{h=1}^{H−1} (H − h) C(h) = Σ_m |Σ_{j=0}^{H−1} b_{m−j}|² ≥ 0`, because the
diagonal of the expanded square gives `H Σ|b_n|²` and each lag `h` occurs `H − h` times with its
conjugate. Since this factor is nonnegative, replacing `N + H − 1` by `2Y` in the finite inequality
keeps an upper bound, and with `H Σ|b_n|² ≤ HN ≤ 2HY` it gives
`H²|Σ b_n|² ≤ 4HY² + 4Y Re Σ_{h<H}(H − h)C(h)`; divide by `H²Y²`.

**Checks.**

- `b = (1, 1, 1)` on `(0, 3]`, `H = 2`: `C(1) = 2`, the left side is `|Σ b_n/3|² = 1`, the real-part
  bound is `4/2 + (4/6) · (1/2) · 2 = 2.67` and the `|C(h)|` form of ExplicitZetaBounds §4.2 gives
  `4/2 + (4/6) · 2 = 3.33`.
- A negative real part: at `b = (1, −1)` on `(0, 2]`, `H = Y = 2`, `C(1) = −1`, and the second
  factor of the finite inequality is `2 · 2 + 2 · (−1) = 2 = |b₁|² + |b₂ + b₁|² + |b₂|²`. The left
  side `|Σ b_n/2|²` is `0`; the finite inequality bounds it by `3 · 2/16 = 0.375`, the real-part form
  by `2 + 1 · (1/2)(−1) = 1.5` and the `|C(h)|` form by `2 + 1 = 3`. Enlarging `N + H − 1 = 3` to
  `2Y = 4` multiplies the whole nonnegative factor `2`, raising `6` to `8`; enlarging the factor in
  front of the real part `−1` alone would lower the bound, which is why the proof needs the
  sum-of-squares identity.
- The constant `4` is needed near `Y = 1`: at `H = 1` the lag sum is empty and the bound is `4`,
  while `b ≡ 1` on `(0.995, 2.005]` (`Y = 1.01`, the two integers `1, 2`) gives the left side
  `(2/1.01)² = 3.92`, above the value `2` that a constant `2/H` would allow.

*Needs:* ExplicitZetaBounds §4.2; Mathlib `Complex.normSq`, `Complex.re_le_norm`.

### 0.4 the character interval sum and its maximum

For `χ : DirichletCharacter ℂ q`, `q ≥ 1`, define `charIntervalSum` `χ M N`, the character
interval sum `S_χ(M, N) = Σ_{M < n ≤ M+N} χ(n)` for `M ∈ ℤ`, `N ∈ ℕ`, and the maximal interval sum
`M_χ = max_{0 ≤ M < q, 0 ≤ N ≤ q} |S_χ(M, N)|`.

- `S_χ(M + q, N) = S_χ(M, N)` and `S_χ(M, N + N′) = S_χ(M, N) + S_χ(M + N, N′)`.
- For `χ ≠ 1`, `S_χ(M, q) = 0` for every `M` (Tau Ceti `DirichletCharacter.sum_range_level_eq_zero`
  and periodicity), hence `S_χ(M, N)` depends only on `M` and `N` modulo `q`, and
  `|S_χ(M, N)| ≤ M_χ` for all `M ∈ ℤ`, `N ∈ ℕ`.
- `|S_χ(M, N)| ≤ min(N, q)` for `χ ≠ 1`; `M_χ = M_{χ⁻¹}`, since `χ⁻¹(n)` is the complex conjugate
  of `χ(n)`.
- For `χ ≠ 1`, `M_χ = max_{M ∈ ℤ, N ∈ ℕ} |Σ_{M ≤ n ≤ M+N} χ(n)|`, the maximum of Pomerance and
  Lapkova over closed intervals.

**Checks.**

- The quadratic character modulo `3` has values `1, −1, 0` at `1, 2, 3`: `S(0, 1) = 1`,
  `S(0, 2) = 0`, `S(0, 3) = 0`, and `M_χ = 1`.
- The quadratic character modulo `5` has values `1, −1, −1, 1, 0`: `S(1, 2) = −2`, and `M_χ = 2`.
- The principal character modulo `3`: `M_χ = 2` (attained at `N = 3`), but `S(0, 6) = 4 > M_χ`;
  the bound `|S_χ(M, N)| ≤ M_χ` needs `χ ≠ 1`.

*Needs:* Tau Ceti `DirichletCharacter.sum_range_level_eq_zero`,
`DirichletCharacter.sum_range_eq_sum_range_mod`, `DirichletCharacter.norm_sum_Icc_le_level`;
Mathlib `DirichletCharacter.norm_le_one`.

### 0.5 symmetry of even characters

Let `χ ≠ 1` be an even character modulo `q`. Prove
`Σ_{n=1}^{q−1−N} χ(n) = −Σ_{n=1}^{N} χ(n)` for `0 ≤ N ≤ q − 1`, and hence
`M_χ = 2 max_{0 ≤ N < q} |Σ_{n=1}^{N} χ(n)|` (pomerance2011 lines 89–95; tmeemt-art15
lines 126–129; frolenkov2011 lines 22–27, equation (1)). For every `χ ≠ 1`,
`M_χ ≤ 2 max_N |Σ_{n=1}^{N} χ(n)|`. Proof: substitute `n ↦ q − n`, use `χ(−n) = χ(n)` and the
vanishing of the full period sum; an interval from a point where the initial sum is `−A` to one
where it is `A` realises `2A`.

**Checks.**

- The quadratic character modulo `5` (even): initial sums `1, 0, −1, 0`, maximum `1`, and
  `M_χ = 2 = 2 · 1`, as in 0.4.
- The character `χ₄` modulo `4` (odd): initial sums `1, 1, 0`, maximum `1`, but `M_χ = 1 < 2`;
  the identity needs evenness.
- The principal character modulo `5` is even but satisfies `Σ_{n ≤ 4−N} = φ(5) − Σ_{n ≤ N}`
  instead; nonprincipality is needed.

*Needs:* Mathlib `DirichletCharacter.Even.eval_neg`; §0.4.

### 0.6 reduction to the primitive character

Let `χ` be a character modulo `q ≥ 1` with conductor `q*` and primitive character `χ*`
(Mathlib `DirichletCharacter.primitiveCharacter`), and let `r` be the product of the primes
dividing `q` but not `q*`. Prove that for `M ∈ ℤ`, `N ∈ ℕ`,

    S_χ(M, N) = Σ_{d | r} μ(d) χ*(d) Σ_{M/d < m ≤ (M+N)/d} χ*(m),

and hence `M_χ ≤ 2^{ω(r)} M_{χ*}` when `χ ≠ 1` (montgomeryvaughan2007 §9.4). Proof: `χ(n)`
equals `χ*(n)` when `gcd(n, r) = 1` and `0` otherwise (Mathlib
`DirichletCharacter.changeLevel_primitiveCharacter`, using that `χ*(n) = 0` when
`gcd(n, q*) > 1`), and `1_{gcd(n, r) = 1} = Σ_{d | gcd(n, r)} μ(d)`.

**Checks.**

- The principal character modulo `6` (`q* = 1`, `r = 6`): `S(0, 6) = 2`, and the formula gives
  `6 − 3 − 2 + 1 = 2`.
- The character modulo `12` induced by `χ₄` (`r = 3`): `S(0, 5) = χ₄(1) + χ₄(5) = 2`, and the
  formula gives `S_{χ₄}(0, 5) − χ₄(3) S_{χ₄}(0, 1) = 1 + 1 = 2`. Omitting the factor `χ*(d)`
  would give `0`.
- A primitive `χ` has `r = 1` and the identity is trivial; `r` is squarefree by definition, so
  `μ(d) ≠ 0` for every `d | r`.

*Needs:* Mathlib `DirichletCharacter.primitiveCharacter`,
`DirichletCharacter.changeLevel_primitiveCharacter`, `ArithmeticFunction.moebius`,
`ArithmeticFunction.cardDistinctFactors`; §0.4.

### Examples

The quadratic character modulo `5` has `M_χ = 2` and initial-sum maximum `1`; the real-part form
of §0.3 at `b = (1, −1)` on `(0, 2]`, `H = 2` bounds `0` by `1.5`; `R(x/3, 0, 6, 0.1) = 3`.

### Dependencies

Mathlib: `Real.fourierChar`, `UnitAddCircle.norm_eq`, Dirichlet characters, primitive characters,
Möbius function, `Complex.re_le_norm`. Tau Ceti: the partial-sum lemmas of
`TauCeti/NumberTheory/DirichletCharacter/PartialSum.lean`. ExplicitZetaBounds §4.2 (for §0.3).

## Layer 1: the iterated van der Corput inequality

Throughout, `S_f[a, b]` is the interval exponential sum of §0.1.

### 1.1 the iterated van der Corput inequality

Prove `iterated_vanDerCorput`: let `X` be real, `f : ℝ → ℝ`, `d ≥ 1`, and let `H₁, …, H_d ≥ 1` be
integers with `H₁ + ⋯ + H_d ≤ Y`. For `a = (a₁, …, a_d)` with `1 ≤ a_r ≤ H_r − 1` let
`f_a(x) = Σ_{J ⊆ {1,…,d}} (−1)^{d−|J|} f(x + Σ_{j ∈ J} a_j)` be the iterated forward difference,
defined on `(X, X + Y − Σ_r a_r]`, and let
`T_d = (Y H₁ ⋯ H_d)⁻¹ Σ_a |Σ_{X < n ≤ X+Y−Σa_r} e(f_a(n))|`. With `B = 2 + 2√2`,

    |Y⁻¹ Σ_{X < n ≤ X+Y} e(f(n))| ≤ B · max(H₁^{−1/2}, H₂^{−1/4}, …, H_d^{−1/2^d}, B^{−1/2^d} T_d^{1/2^d})

(ariasdereyna2024 Theorem 7, lines 398–404, with the constant `B` and its property
`4/H + 4T ≤ max(B²/H, BT)` at lines 384–391). Proof route: induction on `d` from the normalised
form of ExplicitZetaBounds §4.2 with `b_n = e(f(n))`, whose lag sum at `a₁` is the inner sum of
`f_{a₁}`, so that it reads `|Y⁻¹ Σ e(f(n))|² ≤ 4/H₁ + 4T₁` (the form used at ariasdereyna2024
lines 405–415), applying the induction hypothesis to each `f_{a₁}` and Hölder's inequality to the
average over `a₁`.

**Checks.**

- The property `4/H + 4T ≤ max(B²/H, BT)` at `H = 1`, `T = 6`: `28 ≤ max(23.31, 28.97)` for
  `B = 2 + 2√2`, while `B = 4.5` gives `28 > max(20.25, 27)`. The property holds for all
  `H ≥ 1`, `T ≥ 0` exactly when `(B² − 4)(B − 4) ≥ 16`, and `2 + 2√2` is the least such `B > 4`.
- `d = 1`, `H₁ = 1`: the range of `a` is empty, `T₁ = 0`, and the bound reads `B = 4.83…`,
  weaker than the trivial bound `(Y + 1)/Y ≤ 2` for `Y ≥ 1`.
- `d = 1`, `H₁ = Y = 2`, `X = 0`, `f ≡ 0`: the left side is `1`, `T₁ = 1/4`, and the right side is
  `B max(2^{−1/2}, B^{−1/2}/2) = 3.41`. The sign convention: `d = 1`, `J = ∅` gives `−f(x)`, so
  `f_a(x) = f(x + a) − f(x)`.
- `f(x) = x²`, `a = (1)`: `f_a(x) = 2x + 1`; `a = (1, 1)`: `f_a ≡ 2`, so for `d = 2` every inner
  sum is a sum of `e(2) = 1`.

*Needs:* ExplicitZetaBounds §4.2 (the normalised form); §0.1; Mathlib `Real.sqrt`, Hölder's
inequality for finite sums (`Real.inner_le_Lp_mul_Lq_of_nonneg`).

### Examples

The iterated inequality at `d = 1`, `H₁ = Y = 2`, `f ≡ 0` reads `1 ≤ 3.41`; the constant
`B = 2 + 2√2` satisfies `4/H + 4T ≤ max(B²/H, BT)` at `H = 1`, `T = 6` as `28 ≤ 28.97`.

### Dependencies

Layer 0 (§0.1). ExplicitZetaBounds §4.2. Mathlib: finite Hölder inequality.

## Layer 2: integer points near smooth curves

### 2.1 reduction to exponential sums

Let `a` be real, `N ≥ 1`, `δ ∈ (0, 1/4)`, `K = ⌊(8δ)⁻¹⌋ + 1`, and `1 ≤ H ≤ K` an integer. For
every `f : ℝ → ℝ`,

    R(f, a, N, δ) ≤ 4N/H + (4/H) Σ_{h=1}^{H} |S_{hf}[a, a + N]|

(tmeemt-art11 lines 183–186; filaseta1990, stated there on `[N, 2N]`). Proof route: for `H = 1`
the right side is at least `4N ≥ N + 1`. For `H ≥ 2` we have `δ ≤ 1/8` and `Hδ ≤ 1/4`. The Fejér
kernel `F_H(x) = Σ_{|h| < H}(1 − |h|/H) e(hx) = H⁻¹ |Σ_{j=0}^{H−1} e(jx)|²` is nonnegative, and
for `‖x‖ < δ` it is at least `H (sin(π/4)/(π/4))² > 0.81 H` (from `sin t ≥ t sin(π/4)/(π/4)` on
`[0, π/4]`, a consequence of the concavity of `sin` on `[0, π]`, and `|sin πx| ≤ π‖x‖`). Summing
`1_{‖f(n)‖ < δ} ≤ F_H(f(n))/(0.81H)` over the at most `N + 1 ≤ 2N` integers gives
`R ≤ (1/(0.81H))(2N + 2Σ_{h=1}^{H−1} |S_{hf}|)`, which is below the stated bound.

**Checks.**

- `f ≡ 0`, `a = 0`, `N = 4`, `δ = 0.1` (`K = 2`), `H = 2`: `4N/H = 8` and `S_f = S_{2f} = 5`, so
  `R = 5 ≤ 8 + 2(5 + 5) = 28`.
- `f(x) = x/2`, same data: `R = 3` (`n = 0, 2, 4`), `S_f = 1`, `S_{2f} = 5`, and
  `3 ≤ 8 + 2(1 + 5) = 20`.
- `δ = 0.2` gives `K = ⌊0.625⌋ + 1 = 1`: only `H = 1` is allowed. The TME-EMT form on `[N, 2N]`
  is the case `a = N`.

*Needs:* §0.1; §0.2; Mathlib `Real.sin_le`, `strictConcaveOn_sin_Icc`, `Complex.normSq`.
Jordan's inequality `Real.mul_le_sin` (constant `2/π`) is too weak here: it gives `4.93N/H`.

### 2.2 the first derivative test

Prove `first_derivative_test_points`: let `a` be real, `N ≥ 0`, `δ > 0`, and let `f` be
continuously differentiable on `[a, a + N]` with `λ₁ ≤ |f′(x)| ≤ c₁λ₁` there, `λ₁ > 0`,
`c₁ ≥ 1`. Then

    R(f, a, N, δ) ≤ 2c₁Nλ₁ + 4c₁Nδ + 2δ/λ₁ + 1

(tmeemt-art11 lines 114–119; zhao2024 Theorem 2.5, lines 211–216; bordelles2012 Theorem 5.6,
stated on `[N, 2N]`). Proof route: if `δ ≥ 1/4` the right side is at least `N + 1`. Otherwise
`f′` has constant sign, the image of `f` is an interval of length at most `c₁λ₁N`, and the
integers `m` with `‖f(x) − m‖ < δ` for some `x` number at most `c₁λ₁N + 2δ + 1`; for each such `m`
the set `{x : |f(x) − m| < δ}` is an interval of length at most `2δ/λ₁` (mean value theorem),
containing at most `2δ/λ₁ + 1` integers. If only one `m` occurs this gives `2δ/λ₁ + 1`; if two
occur then `c₁λ₁N ≥ 1 − 2δ > 1/2`, so `1/λ₁ < 2c₁N`, and the product
`(c₁λ₁N + 2δ + 1)(2δ/λ₁ + 1)` is at most the stated bound because `4δ²/λ₁ ≤ 8c₁Nδ² ≤ 2c₁Nδ` and
`2δ ≤ c₁λ₁N`.

**Checks.**

- `f(x) = x/10`, `a = 0`, `N = 20`, `λ₁ = 1/10`, `c₁ = 1`, `δ = 0.05`: `R = 3` (`n = 0, 10, 20`)
  and the bound is `4 + 4 + 1 + 1 = 10`.
- `δ = 0.49`, any data: every integer may count, `R ≤ N + 1`, and `4c₁Nδ + 1 ≥ 1.96N + 1`.
- A constant `f` violates `λ₁ > 0`; with `f ≡ 0`, `R = N + 1` for integer `a, N` and no bound
  independent of `N` and `δ` can hold.

*Needs:* §0.2; Mathlib `exists_deriv_eq_slope`, `Nat.card` of integer points in an interval.

### 2.3 Huxley's reduction and the second derivative test

*Reduction.* For any `f`, real `a`, `N ≥ 1`, `δ > 0` and real `1 ≤ A ≤ N`, with
`Δ_h f(x) = f(x + h) − f(x)`,

    R(f, a, N, δ) ≤ N/A + Σ_{1 ≤ h ≤ A} R(Δ_h f, a, N − h, 2δ) + 1

(zhao2024 Lemma 2.6, lines 284–319; bordelles2012 Lemma 5.7). Proof: list the counted integers
`n₁ < ⋯ < n_k`; consecutive gaps `h = n_{j+1} − n_j` sum to at most `N`, so at most `N/A` gaps
exceed `A`, and a gap `h ≤ A` starting at `n_j` gives `‖Δ_h f(n_j)‖ < 2δ`.

*Second derivative test.* Prove `second_derivative_test_points`: let `f` be twice continuously
differentiable on `[a, a + N]`, `N ≥ 1`, with `λ₂ ≤ |f″| ≤ c₂λ₂`, `λ₂ > 0`, `c₂ ≥ 1` and
`Nλ₂ ≥ c₂⁻¹`, and let `δ ∈ (0, 1/2)`. Then

    R(f, a, N, δ) ≤ 6((3c₂)^{1/3} N λ₂^{1/3} + (12c₂)^{1/2} N δ^{1/2} + 1)

(tmeemt-art11 lines 130–137; zhao2024 Theorem 2.7, lines 324–330; bordelles2012 Theorem 5.8,
stated on `[N, 2N]`). Proof route (zhao2024 lines 337–371): if `λ₂ ≥ (3c₂)⁻¹` or `δ ≥ (12c₂)⁻¹`
the right side is at least `N + 1`; otherwise the mean value theorem gives
`hλ₂ ≤ |(Δ_h f)′| ≤ c₂hλ₂` on `[a, a + N − h]`; apply §2.2 to each `Δ_h f` with `λ₁ = hλ₂`,
`c₁ = c₂` and `2δ` in place of `δ`, bound `4δ/(hλ₂) ≤ 4c₂Nδ` and `1 ≤ c₂Nhλ₂` by `Nλ₂ ≥ c₂⁻¹`, sum
over `h ≤ A`, and choose `A ∈ [1, N]` by Srinivasan's lemma as in the source.

**Checks.**

- Reduction with `f(x) = x/2`, `δ = 0.1`, `a = 0`, `N = 4`, `A = 2`: `R = 3`; `Δ₁f ≡ 1/2`
  counts nothing at `2δ = 0.2`, `Δ₂f ≡ 1` counts all three points of `[0, 2]`, and the right side
  is `2 + 0 + 3 + 1 = 6 ≥ 3`. Using `δ` instead of `2δ` in the differenced count would be false in
  general: `‖f(n + h) − f(n)‖` can be as large as `‖f(n + h)‖ + ‖f(n)‖`.
- `f(x) = x²/100` has `f″ ≡ 1/50`; with `c₂ = 1` and `N = 10`, `Nλ₂ = 0.2 < 1` violates the
  hypothesis, while `N = 50` satisfies it; at `a = 0`, `δ = 0.01` the count is `6` (the multiples of
  `10`), against the bound `6(19.57 + 17.32 + 1) = 227`.
- The TME-EMT statements on `[N, 2N]` are the case `a = N`; the proofs use only the length `N`.

*Needs:* §2.2; §0.2; Mathlib `exists_deriv_eq_slope`.

### Examples

`R(x/3, 0, 6, 0.1) = 3`; the first derivative test for `f(x) = x/10` on `[0, 20]` at `δ = 0.05`
gives `3 ≤ 10`; the exponential-sum reduction for `f(x) = x/2` on `[0, 4]` with `δ = 0.1`,
`H = 2` gives `3 ≤ 20`.

### Dependencies

Layer 0 (§§0.1, 0.2). Mathlib: mean value theorem, concavity of `sin`.

## Layer 3: explicit Pólya–Vinogradov inequalities

Throughout, `χ : DirichletCharacter ℂ q`, `ψ_q = ZMod.stdAddChar` (so `ψ_q(b) = e(b/q)`), and
`τ(χ) = gaussSum χ ψ_q`. The trivial character of level `1` is primitive, which is why the
statements below assume `q ≥ 2`; a primitive character of level `q ≥ 2` is nonprincipal (Tau Ceti
`DirichletCharacter.IsPrimitive.eq_one_iff`), so `q ≥ 3`, because the only character of level `2`
is the principal one.

### 3.1 the Gauss-sum expansion of a character interval sum

Let `χ` be primitive modulo `q ≥ 2`. Prove that for every integer `n`,
`χ(n) τ(χ⁻¹) = Σ_{b mod q} χ⁻¹(b) e(bn/q)`, and hence for `M ∈ ℤ`, `N ∈ ℕ`,

    S_χ(M, N) = τ(χ⁻¹)⁻¹ Σ_{b=1}^{q−1} χ⁻¹(b) Σ_{M < n ≤ M+N} e(bn/q),
    |S_χ(M, N)| ≤ q^{−1/2} Σ_{b=1}^{q−1} min(N, 1/sin(πb/q))

(pomerance2011 lines 229–240, displays (7)–(10); montgomeryvaughan2007 §9.4). Proof: Mathlib
`gaussSum_mulShift_of_isPrimitive` applied to the primitive character `χ⁻¹`
(`DirichletCharacter.IsPrimitive.inv`) gives the first identity, including non-units `n`, where
both sides vanish; `τ(χ⁻¹) ≠ 0` and `|τ(χ⁻¹)| = √q` by Tau Ceti
`DirichletCharacter.IsPrimitive.norm_gaussSum` with the primitive additive character `ψ_q`
(`ZMod.isPrimitive_stdAddChar`); the inner geometric sum has modulus
`|sin(πbN/q)|/sin(πb/q)` for `1 ≤ b ≤ q − 1`. For even `χ` only the cosine parts survive and for
odd `χ` only the sine parts (pomerance2011 displays (8)–(10)).

**Checks.**

- The quadratic character modulo `3`: `τ(χ) = e(1/3) − e(2/3) = i√3`, `|τ(χ)| = √3`, and
  `χ(1) τ(χ⁻¹) = χ(1)τ(χ) = i√3` matches `Σ_b χ(b) e(b/3)` (here `χ⁻¹ = χ`).
- `q = 3`, `M = 0`, `N = 1`: the right side is
  `(i√3)⁻¹(e(1/3) − e(2/3)) = 1 = χ(1)`; a version with `τ(χ)` in place of `τ(χ⁻¹)` agrees here
  because `χ` is real. For the quartic character `χ` modulo `5` with `χ(2) = i`,
  `τ(χ) = −1.1756 + 1.9021i` and `τ(χ⁻¹) = 1.1756 + 1.9021i`, whose product is
  `χ(−1) · 5 = −5` (CharacterSumsOverFiniteFields §7.1 checks); at `n = 1` the identity reads
  `τ(χ⁻¹) = Σ_b χ⁻¹(b) e(b/5)`, and the version with `τ(χ)` is off by the factor
  `τ(χ)/τ(χ⁻¹) = (1 + 2i)/√5 ≠ 1`.
- The principal character modulo `4` is not primitive and its Gauss sum is `0`; the expansion
  needs primitivity.

*Needs:* Mathlib `gaussSum_mulShift_of_isPrimitive`, `DirichletCharacter.IsPrimitive.inv`,
`ZMod.stdAddChar`, `ZMod.isPrimitive_stdAddChar`; Tau Ceti
`DirichletCharacter.IsPrimitive.norm_gaussSum`; §0.4.

### 3.2 the classical explicit Pólya–Vinogradov inequality

For `q ≥ 2`, `Σ_{b=1}^{q−1} 1/sin(πb/q) < (2q/π)(log q + log(4/π) + π²/(12q²))` (pomerance2011
proof of Lemma 4, displays (4)–(5), lines 183–203: convexity of `csc` on `(0, π)` and
`∫ csc = log cot`). Prove `polya_vinogradov_classical`: for primitive `χ` modulo `q ≥ 2` and all
`M ∈ ℤ`, `N ∈ ℕ`,

    |S_χ(M, N)| < (2/π) √q (log q + log(4/π) + π²/(12q²)),

equivalently `M_χ < (2/π)√q (log q + log(4/π) + π²/(12q²))`. For every nonprincipal `χ` modulo `q`
with conductor `q*` and `r` as in §0.6,
`M_χ < 2^{ω(r)}(2/π)√q* (log q* + log(4/π) + π²/(12q*²))` (montgomeryvaughan2007 §9.4). In
particular `|S_χ(M, N)| ≤ √p log p` for every nonprincipal `χ` modulo a prime `p ≥ 3` (modulo `2`
every character is principal).

**Checks.**

- `q = 3`: `Σ csc = 2 · 2/√3`, so `M_χ ≤ (1/√3)(4/√3) = 4/3`, against `M_χ = 1` for the quadratic
  character and the closed form `(2√3/π)(1.0986 + 0.2416 + 0.0914) ≈ 1.579`.
- `q = 5`: `Σ csc = 2(1.7013 + 1.0515) = 5.506`, so `M_χ ≤ 2.462`, against `M_χ = 2` for the
  quadratic character (§0.4).
- `√p log p` dominates for `p ≥ 3`: at `p = 3`,
  `(2/π)(1.0986 + 0.2416 + 0.0914) = 0.911 ≤ 1.0986`; at `p = 2` the left side `0.726` exceeds
  `log 2 = 0.693`, but there is no nonprincipal character modulo `2`. The nonprincipal hypothesis
  is needed: the principal character has `S(0, N)` of size about `N(1 − 1/p)`, unbounded in `N`.

*Needs:* §3.1; §0.6; Mathlib `ConvexOn` for `csc` on `(0, π)` (from the second derivative),
`intervalIntegral`, `DirichletCharacter.eq_one_iff_conductor_eq_one`.

### 3.3 trigonometric series and Pomerance's lemmas

- *Closed forms.* For `0 < x < 2π`, `Σ_{j ≥ 1} sin(jx)/j = (π − x)/2` and
  `Σ_{j ≥ 1} cos(jx)/j = −log(2 sin(x/2))`, the series converging (not absolutely), and the tail
  `R_n(x) = Σ_{j > n} sin(jx)/j` satisfies `|R_n(x)| ≤ 1/((n + 1) sin(x/2))` for `0 < x ≤ π`
  (pomerance2011 proof of Lemma 4, line 180). Proof: the series converge by Dirichlet's test, and
  Abel's limit theorem (Mathlib `Complex.tendsto_tsum_powerSeries_nhdsWithin_stolzSet`) applied
  to `Σ zʲ/j = −log(1 − z)` (Mathlib `Complex.hasSum_taylorSeries_neg_log`) at `z = e^{ix}` gives
  both closed forms; the tail bound is summation by parts against
  `|Σ_{j=a}^{b} e^{ijx}| ≤ 1/sin(x/2)`.
- *Lemma 2.* For all real `x` and integers `n ≥ 1`, `C_n(x) = Σ_{j=1}^{n} cos(jx)/j > −log 2 − 2/n`
  (pomerance2011 Lemma 2, lines 112–134). Proof route of the source: the minimum of `C_n` on
  `[0, π]` is at `x_n = ⌊(n + 1)/2⌋ · 2π/(n + 1)` (Young); an alternative route through the
  closed form and the same tail bound for the cosine series:
  `C_n(x) ≥ −log(2 sin(x/2)) − 1/((n + 1) sin(x/2))` for `0 < x ≤ π`, which is at
  least `−log 2 − 2/(n + 1)` for `x ≥ π/3`, while for `x ≤ π/(2n)` every term is nonnegative and
  for `π/(2n) ≤ x ≤ π/3` the function `−log(2s) − 1/((n + 1)s)` of `s = sin(x/2) ∈ [1/(2n), 1/2]`
  increases up to `s = 1/(n + 1)` and decreases after it, so it is at least its smaller endpoint
  value `min(log n − 2n/(n + 1), −2/(n + 1)) > −2/n`.
- *Lemma 3.* For all real `x` and `n ≥ 1`,
  `Σ_{j=1}^{n} |sin jx|/j < (2/π) log n + (2/π)(γ + log 2 + 3/n)` (pomerance2011 Lemma 3,
  lines 147–161). Proof: the absolutely convergent expansion
  `|sin θ| = 2/π − (4/π) Σ_{m ≥ 1} cos(2mθ)/(4m² − 1)` (Mathlib `hasSum_fourier_series_of_summable`
  after computing the Fourier coefficients of `|sin|`), Lemma 2 at `2mx`, `Σ 1/(4m² − 1) = 1/2`,
  and `H_n < log n + γ + 1/n`, which is `H_n − log(n + 1) < γ`
  (`Real.eulerMascheroniSeq_lt_eulerMascheroniConstant`) with `log(1 + 1/n) ≤ 1/n`
  (`Real.log_le_sub_one_of_pos`).
- *Lemma 4.* For `q ≥ 2` and `n ≥ 1`,
  `Σ_{a=1}^{q−1} |R_n(2πa/q)| < (2/π)(q/(n + 1))(log q + log(4/π) + π²/(12q²))`
  (pomerance2011 Lemma 4, lines 172–204), from the tail bound and §3.2's cosecant sum.

**Checks.**

- `C_1(π) = −1 > −log 2 − 2 = −2.69`; `C_3(π) = −1 + 1/2 − 1/3 = −5/6 > −log 2 − 2/3 = −1.36`;
  the limit `−log 2` is sharp as `n → ∞` (`C_n(π) → −log 2`).
- At `x = π/2`, `Σ sin(jx)/j = 1 − 1/3 + 1/5 − ⋯ = π/4 = (π − π/2)/2`, and
  `Σ cos(jx)/j = −1/2 + 1/4 − ⋯ = −(log 2)/2 = −log(2 sin(π/4))`.
- `n = 1`, `x = π/2`: `|sin x| = 1 < (2/π)(0 + 0.5772 + 0.6931 + 3) = 2.72`; Lemma 3's bound
  fails without the constant term: `(2/π) log 1 = 0 < 1`.
- The alternative route at `n = 2`: on `s ∈ [1/4, 1/2]` the endpoint values of
  `−log(2s) − 1/(3s)` are `log 2 − 4/3 = −0.640` and `−2/3 = −0.667`, so the minimum is at the right
  endpoint, below the left-endpoint value; both exceed `−2/n = −1`.

*Needs:* §3.2; Mathlib `Complex.hasSum_taylorSeries_neg_log`,
`Complex.tendsto_tsum_powerSeries_nhdsWithin_stolzSet`, `hasSum_fourier_series_of_summable`,
`Real.eulerMascheroniConstant`, `Real.eulerMascheroniSeq_lt_eulerMascheroniConstant`,
`Real.log_le_sub_one_of_pos`.

### 3.4 Pomerance's explicit Pólya–Vinogradov inequality

Prove `polya_vinogradov_pomerance`: for `χ` primitive modulo `q > 1` and every interval sum,

    |S_χ(M, N)| ≤ (2/π²)√q log q + (4/π²)√q log log q + (3/2)√q   (χ even),
    |S_χ(M, N)| ≤ (1/(2π))√q log q + (1/π)√q log log q + √q       (χ odd)

(pomerance2011 Theorem 1, lines 78–86, stated for `S(χ) = M_χ`; proof §§3–4, lines 263–438).
Proof route (the Landau–Bateman argument): for an initial interval `[0, N]`, write
`Σ_{a=0}^{N} χ(a)` as `χ(N)/2 + Σ_a χ(a)Φ(2πa/q)` with `Φ` the indicator of `(0, 2πN/q)` taking
the value `1/2` at the endpoints, expand `Φ` in its Fourier series (pointwise convergent at the
points `2πa/q` by the closed forms of §3.3), truncate at `n`, evaluate the main part with §3.1's
parity forms, bound it by Lemma 3 and the tail by Lemma 4, and choose `n`; for even `χ` double by
§0.5, for odd `χ` use `M_χ ≤ 2 max_N |Σ_{a ≤ N} χ(a)|` and the sharper odd main term.

**Checks.**

- `q = 3` (odd quadratic character, `M_χ = 1`): the odd bound is
  `0.1592 · 1.732 · 1.0986 + 0.3183 · 1.732 · 0.0940 + 1.732 = 2.087 ≥ 1`.
- `q = 5` (even, `M_χ = 2`): `0.2026 · 2.236 · 1.609 + 0.4053 · 2.236 · 0.4759 + 3.354 = 4.515 ≥ 2`.
- `log log q` is defined and positive for `q ≥ 3`, the least primitive level above `1`; at
  `q = 2` (no primitive character) `log log 2 < 0`.

*Needs:* §§0.5, 3.1, 3.3; Mathlib `DirichletCharacter.Even`, `DirichletCharacter.Odd`.

### 3.5 Lapkova's constants and the rounded Frolenkov–Soundararajan forms

Define `LapkovaBound` `χ`, the proposition that every interval sum of `χ` is at most
`(2/π²)√q log q + 0.9467√q + 1.668` if `χ` is even and at most
`(1/(2π))√q log q + 0.8204√q + 1.0285` if `χ` is odd. Prove `polya_vinogradov_lapkova`: under
`LapkovaSmallModuliVerified` (§6.1), every primitive `χ` modulo `q > 1` satisfies `LapkovaBound`,
that is,

    M_χ ≤ (2/π²)√q log q + 0.9467√q + 1.668    (χ even),
    M_χ ≤ (1/(2π))√q log q + 0.8204√q + 1.0285  (χ odd)

(lapkova2018 Lemma 3A, lines 245–282, proof lines 291–408). Consequences:

- *Rounded forms.* `M_χ ≤ (2/π²)√q log q + √q` for even `χ` and `q ≥ 980`, and
  `M_χ ≤ (1/(2π))√q log q + √q` for odd `χ` and `q ≥ 33` (tmeemt-art15 lines 114–118 and
  hunter2016 Theorem 1.3, lines 680–684, quote Frolenkov–Soundararajan's Theorem 2 with the ranges
  `q ≥ 1200` and `q ≥ 40`, which these contain), from `1.668 ≤ 0.0533√q` (`q ≥ 980`) and
  `1.0285 ≤ 0.1796√q` (`q ≥ 33`).
- *Initial sums with one constant.* Under `LapkovaSmallModuliVerified`, for real `q₀ > 1`, every
  primitive `χ` modulo `q ≥ q₀`, even or odd, and every real `M`,
  `|Σ_{1 ≤ n ≤ M} χ(n)| ≤ A(q₀)√q log q` with
  `A(q₀) = 1/(2π) + 0.8204/log q₀ + 1.0285/(√q₀ log q₀)` (the form of kerrmcgowntrudgian2020
  Lemma 3, lines 117–122). For odd `χ` the initial sum is an interval sum and the odd constant
  divided by `√q log q` decreases in `q`; for even `χ` the initial sums are at most `M_χ/2` (§0.5),
  and `(1/π²)√q log q + 0.4734√q + 0.834` is below the odd bound termwise. The source prints the
  middle term as `0.8204/√q₀`, which does not follow from Lemma 3A (Checks).

Proof route: for `q > 25`, the argument of frolenkovsoundararajan2013's proof of Theorem 2, a
Fejér-smoothed form of the expansion of §3.1, with the parameter `L = ⌊π²√q/4 + 9.15⌋` (even) or
`L = ⌊π√q + 9.15⌋` (odd), which satisfies `1 ≤ L ≤ q` for `q > 25`, the split used in
lapkova2018's proof of Lemma 3A (the inequality `L ≤ q` in fact holds from `q = 19` for even and
from `q = 24` for odd `χ`); for `q ≤ 25` the Layer 6 hypothesis `LapkovaSmallModuliVerified`.

**Checks.**

- Even, `q = 980`: `0.9467√980 + 1.668 = 29.637 + 1.668 = 31.305 ≤ √980 = 31.305`; at `q = 979`
  the rounded form does not follow from Lemma 3A.
- Odd, `q = 33`: `0.8204 · 5.745 + 1.0285 = 5.742 ≤ 5.745`; at `q = 32` it fails (`5.669 > 5.657`).
- The parameter `L` of the proof: for even `χ`, `q = 19` gives `π²√19/4 + 9.15 = 19.90` and
  `L = 19 ≤ 19`, while `q = 18` gives `L = 19 > 18`; for odd `χ`, `q = 24` gives
  `π√24 + 9.15 = 24.54` and `L = 24 ≤ 24`, while `q = 23` gives `L = 24 > 23`. The split at
  `q = 25` is sufficient, not the exact range of `1 ≤ L ≤ q`.
- Against §3.4 at `q = 10⁶`: beyond the common term `(2/π²)√q log q`, Pomerance's even bound adds
  `(4/π²)√q log log q + (3/2)√q ≈ 1064 + 1500`, Lapkova's adds `0.9467√q + 1.668 ≈ 948`.
- The constant `A(q₀)`: at `q = q₀ = 10⁶`, `A = 0.15915 + 0.05938 + 0.00007 = 0.21861` and
  `A√q log q = 3020.2`, which is Lapkova's odd bound exactly; with the printed `0.8204/√q₀` the
  constant would be `0.16005` and the bound `2211.2`, below Lapkova's, so that form is not a
  consequence of Lemma 3A. At `q₀ = 1200`, `A = 0.27905`.

*Needs:* §3.1; §0.5; Layer 6 `LapkovaSmallModuliVerified`.

### 3.6 the Frolenkov–Soundararajan bound for nonprincipal characters

Prove `polya_vinogradov_frolenkov_soundararajan`: for every nonprincipal `χ` modulo `q ≥ 1000`
and all `M ∈ ℤ`, `N ∈ ℕ`, `|S_χ(M, N)| ≤ (1/(π√2))√q(log q + 6) + √q` (tmeemt-art15 lines 106–109;
frolenkovsoundararajan2013 Corollary 1; hunter2016 Theorem 1.2, lines 651–664, quotes the same
constant for initial sums and `q > 100`). Proof route (frolenkovsoundararajan2013 Theorem 1 and
Corollary 1, as described by hunter2016 lines 646–650): a bound for the sums over an interval of a
`q`-periodic function in terms of its finite Fourier coefficients, obtained by smoothing the
indicator of the interval, applied to `χ` with the Gauss-sum expansion of an imprimitive character
(§§0.6, 3.1). The leading constant `1/(π√2) = 0.2251` is Landau's for imprimitive characters; for
primitive `χ` and `q ≥ 1000`, §3.5 is stronger.

**Checks.**

- `q = 1000`: the bound is `0.2251 · 31.62 · 12.908 + 31.62 = 123.5`, against the trivial
  `φ(1000)/2 = 200`.
- For primitive even `χ`, `q = 10⁴`: §3.5 gives `0.2026 · 100 · 9.21 + 94.67 + 1.67 = 283`, and
  this bound gives `0.2251 · 100 · 15.21 + 100 = 442`.
- The crude route `M_χ ≤ 2^{ω(r)} M_{χ*}` of §0.6 with §3.5 does not reach this constant: for
  `q = 6q*` with `χ*` even the factor `4 · (2/π²)/√6 = 0.331 > 0.2251`.
- Imprimitive witnesses: the character modulo `2310` induced by the quadratic character modulo
  `3` has `M_χ = 5` against the bound `196.8`; the one modulo `4620` induced by `χ₄` has
  `M_χ = 8` against `288.9`.

*Needs:* §§0.4, 0.6, 3.1.

### Examples

For the quadratic character modulo `5`: `M_χ = 2`, the cosecant-sum bound `q^{−1/2} Σ csc = 2.462`
of §3.1, the closed form `2.682` of §3.2, Pomerance's even bound `4.51`. The rounded
Frolenkov–Soundararajan even form starts at `q = 980` from Lemma 3A.

### Dependencies

Layer 0 (§§0.4–0.6). Mathlib: Gauss sums, primitive characters, Abel's limit theorem, Fourier
series of continuous periodic functions. Tau Ceti: the primitive Gauss-sum norm. Layer 6:
`LapkovaSmallModuliVerified`.

## Layer 4: explicit Burgess inequalities for a prime modulus

Throughout, `p` is prime, `χ ≠ 1` is a character modulo `p` (hence primitive), and for `r ≥ 1`
the double factorial is `(2r − 1)!! = 1 · 3 ⋯ (2r − 1) = (2r)!/(2^r r!)`.

### 4.1 Burgess's moment bound

*Degenerate tuples.* For integers `H ≥ 1`, `r ≥ 1` and `d ≥ 2`, call a tuple
`(b₁, …, b_{2r}) ∈ {1, …, H}^{2r}` `d`-degenerate when, for every value `v`, the number of `i ≤ r`
with `b_i = v` is congruent modulo `d` to the number of `i > r` with `b_i = v`. Prove that there
are at most `(2r − 1)!! H^r` `d`-degenerate tuples (the count behind trevino2015kth Theorem 1.2;
booker2006 lines 506–507 for `d = 2`). Proof route: the number of `d`-degenerate tuples equals the
moment `E|Z₁ + ⋯ + Z_H|^{2r}` for independent uniformly distributed `d`-th roots of unity `Z_v`,
because `E Z^a conj(Z)^c` is `1` when `d | a − c` and `0` otherwise. For even `d` every value
occurs an even number of times, and each such tuple arises from one of the `(2r − 1)!!` perfect
matchings of the `2r` positions and a value for each matched pair. For `d > r` the congruences
force equal counts, so the second half is a rearrangement of the first: at most
`r! H^r ≤ (2r − 1)!! H^r` tuples. For odd `d` with `3 ≤ d ≤ r`, rotating each `Z_v` by an
independent uniform angle in `[0, 2π/d)` makes it uniform on the circle, whose moment counts the
rearrangements, and Jensen's inequality bounds the count by `(π/(d sin(π/d)))^{2r} r! H^r`; the
factor is largest at `d = 3`, where it is `1.4622^r`, and `1.4622^r r! ≤ (2r − 1)!!` for `r ≥ 5`;
the two cases left, `d = 3` with `r = 3` or `4`, have the exact counts `6H³ − 8H² + 3H ≤ 15H³` and
`24H⁴ − 56H³ + 42H² − 9H ≤ 105H⁴`.

*Moment bound.* Prove `burgess_moment_bound`: for every real `B > 0` and integer `r ≥ 1`,

    Σ_{x mod p} |Σ_{1 ≤ b ≤ B} χ(x + b)|^{2r} ≤ (2r − 1)!! B^r p + (2r − 1) B^{2r} √p

(trevino2015 Theorem A, lines 57–63, stated there under `r ≤ 9B` and proved in trevino2015kth
Theorem 1.2; for quadratic `χ`, booker2006 displays (28)–(30), lines 494–510). Proof: a full
period of `χ` sums to zero, so the inner sum is unchanged when `⌊B⌋` is replaced by its residue
modulo `p`, and it suffices to take `H = ⌊B⌋` with `1 ≤ H < p` (for `H = 0` the left side is `0`).
Expand the `2r`-th power; with `d` the order of `χ`, the term of a tuple is `Σ_x χ(f(x))` with
`f(X) = ∏_{i ≤ r}(X + b_i) · ∏_{i > r}(X + b_i)^{d−1}` (because `conj χ(y) = χ(y^{d−1})` for every
`y`, both sides vanishing at `y = 0`). Since `H < p`, distinct `b_i` give distinct roots, and `f`
is a constant times a `d`-th power exactly when the tuple is `d`-degenerate; these tuples
contribute at most `p` each. For the others CharacterSumsOverFiniteFields §4.7 at `F = ZMod p`
bounds the inner sum by `(m − 1)√p ≤ (2r − 1)√p`, `m ≤ 2r` being the number of distinct `b_i`.
The source's hypothesis `r ≤ 9B` is not used. The shifted form
`Σ_x |Σ_{m=0}^{h−1} χ(x + m)|^{2r} ≤ ((2r)!/(2^r r!)) p h^r + (2r − 1)√p h^{2r}` for integers
`h ≥ 1` is the case `B = h` after the substitution `x ↦ x − 1`.

*The case `r = 2`.* For every integer `h ≥ 1`, with
`W₂(h) = Σ_{x mod p} |Σ_{m=0}^{h−1} χ(x + m)|⁴`,

    W₂(h) < (3h² − 2h) p + 2(h⁴ − 3h² + 2h) √p    if χ has order 2,
    W₂(h) < (2h² − h) p + 3(h⁴ − 2h² + h) √p      if χ has order greater than 2

(mcgowntrudgian2020 Proposition 1, display (3), lines 120–126). Proof route: as above, the sum
over `p` reduces `h` to its residue `h′` modulo `p` (both right sides increase with `h`, and
`W₂ = 0` when `h′ = 0`), so take `h < p`. For order greater than 2 the degenerate tuples are those
whose second half rearranges the first, `h + 2h(h − 1) = 2h² − h` of them, each contributing at
most `p − 1`, and every other tuple has at most four distinct values, so §4.7 gives `3√p`. For
order 2 (`χ` is then the quadratic character, Mathlib `quadraticChar (ZMod p)`), `f` is the product
of the four linear factors, and the tuples fall into five patterns: `aaaa` (`h` tuples, sum
`p − 1`), `aabb` (`3h(h − 1)`, sum `p − 2`), `aaab` (`4h(h − 1)`, sum `−1`), `aabc`
(`6h(h − 1)(h − 2)`, sum `−1 − χ((b − a)(c − a))`, of modulus at most `2`) and `abcd`
(`h(h − 1)(h − 2)(h − 3)`). For four distinct values the substitution `x = −a + 1/u` turns
`Σ_x χ(f(x))` into `Σ_u χ(g(u)) − 1` with `g` a squarefree cubic, which after scaling by its
leading coefficient is minus the Frobenius trace of an elliptic curve
(EllipticLegendreCharacterInterfaces §5.1), of modulus at most `2√p` by Tau Ceti's
`WeierstrassCurve.hasse_bound`; so `|Σ_x χ(f(x))| ≤ 2√p + 1`. The source bounds this sum by `2√p`
(line 180), which is false for single tuples (Checks), but the inequality survives: the difference
between the right side and `W₂` is at least
`h + 6h(h − 1) + 4h(h − 1)(2√p − 1) + 6h(h − 1)(h − 2)(2√p − 2) − h(h − 1)(h − 2)(h − 3)`, which is
positive when `h ≤ 12√p − 9`; and when `h > 12√p − 9`, the bound
`W₂ ≤ h² Σ_x |Σ_m χ(x + m)|² = h²(hp − h²) < h³p` is below `h⁴√p ≤ 2(h⁴ − 3h² + 2h)√p`.

**Checks.**

- `r = 1`, `B < p`: `Σ_x |Σ_{b ≤ B} χ(x + b)|² = ⌊B⌋p − ⌊B⌋²` exactly (for `b ≠ b′` the cross
  sum `Σ_x χ(x + b) conj χ(x + b′)` is `−1`), below `Bp + B²√p`.
- `r = 2`, `H = 2`: for `d = 2` the degenerate tuples in `{1, 2}⁴` are the `2` constant tuples and
  the `6` with two of each, `8 ≤ 3 · 4 = 12`; for every `d ≥ 3`, even or odd, the congruences force
  equal counts (`d > r`) and the degenerate tuples are the `6` whose second half rearranges the
  first, so `(1, 1, 2, 2)` is `2`-degenerate but not `4`-degenerate. With `H = 1` the count is
  `1 ≤ 3`.
- Odd multiplicities occur for odd `d`: at `d = 3`, `r = 3` the tuple `(1, 1, 1, 2, 2, 2)` is
  degenerate (`f = (X + 1)³(X + 2)⁶` is a cube) although no value occurs an even number of times;
  the exact count `6H³ − 8H² + 3H` is `22 ≤ 120` at `H = 2`.
- The larger set of tuples in which every value occurs at least twice contains every degenerate
  tuple but is too large: at `r = 6`, `H = 100` it has `1.0672 · 10¹⁶` elements, more than
  `11!! · 100⁶ = 1.0395 · 10¹⁶`, while the `2`-degenerate tuples number `9.398 · 10¹⁵`.
- `(2r − 1)!! = (2r)!/(2^r r!)`: `r = 3` gives `15 = 720/(8 · 6)`; the factor `(2r)!/r!` in its
  place would be `120`.
- `r = 2`, `p = 7`, the quadratic character, `h = 2`: the inner sums are
  `1, 2, 0, 0, 0, −2, −1`, so `W₂ = 34`, against `8 · 7 + 16√7 = 98.3` (refinement) and
  `3 · 4 · 7 + 3 · 16√7 = 211.0` (the general bound at `r = 2`). For the cubic character
  modulo `7` at `h = 2`, `W₂ = 22` against the order-`> 2` refinement `6 · 7 + 30√7 = 121.4`.
- Negative control for the per-tuple bound: at `p = 19`, `Σ_x χ((x + 1)(x + 2)(x + 4)(x + 9)) = −9`,
  of modulus above `2√19 = 8.72` and below `2√19 + 1 = 9.72`.
- `h = 1`: both refinements read `(3 − 2)p + 2(1 − 3 + 2)√p = (2 − 1)p + 3(1 − 2 + 1)√p = p`, while
  `W₂(1) = Σ_x |χ(x)|⁴ = p − 1`; the strict inequality holds with margin `1`, and a version with
  `p − 1` in place of `p` in the leading term would read `p − 1 < p − 1`, which is false.

*Needs:* CharacterSumsOverFiniteFields §4.7; EllipticLegendreCharacterInterfaces §5.1; Tau Ceti
`DirichletCharacter.sum_range_level_eq_zero`, `WeierstrassCurve.hasse_bound`; Mathlib `Polynomial`,
`ZMod`, `MulChar`, `quadraticChar`, `Nat.doubleFactorial`, `ConvexOn.map_integral_le` (Jensen's
inequality).

### 4.2 the multiplicative energy count

For an integer `1 ≤ A < p`, a nonempty set `𝒜` of integers in `[1, A]` (the multipliers),
`M ∈ ℤ` and `N ≥ 1`, let `v(x) = #{(a, n) : a ∈ 𝒜, M < n ≤ M + N, n ≡ a x (mod p)}` for
`x ∈ ZMod p`, `V₁ = Σ_x v(x) = |𝒜|N` and `V₂ = Σ_x v(x)²`. Prove, for `𝒜` the set of all integers
in `[1, A]`:

- if `N < p` and `28 ≤ A < N/12`, then `V₂ ≤ 2AN(AN/p + log(1.85A))` (trevino2015 Lemma 1,
  lines 210–219, proof lines 462–622);
- if `A ≥ 30`, `N > 7A` and `2AN < p`, then `V₂ ≤ 2AN log(1.85A)` (trevino2015 Lemma 6,
  lines 1088–1093);

and, for `𝒜` the set of primes in `[1, A]` with `A ≥ 2`:

- if `2AN ≤ p`, then
  `V₂ ≤ π(A)N + 2N Σ_{a ∈ 𝒜} (π(a) − 1)/a + 2 Σ_{a ∈ 𝒜} (π(a) − 1)` (mcgown2012 Lemma A.7,
  lines 1130–1142, with Lemma A.6, lines 1119–1129).

Proof route: `V₂` counts quadruples with `a₁n₂ ≡ a₂n₁ (mod p)`; the diagonal `a₁ = a₂` gives
`|𝒜|N` (for `N < p`); for `a₁ ≠ a₂` the pairs with `a₁n₂ − a₂n₁ = kp` number at most
`N gcd(a₁, a₂)/max(a₁, a₂) + 1` (trevino2015 Lemma 5, lines 419–423), and the resulting sums over
`a₁, a₂` are bounded by Treviño's explicit estimates for `Σ φ(d)/d` and `Σ log` (Lemmas 2–4,
lines 223–418); when `2AN ≤ p`, `k` is determined by `(a₁, a₂)` (it lies within
`(a₁ + a₂)N/(2p) < 1/2` of `(a₁ − a₂)(M + N/2)/p`), and for distinct primes the count is at most
`N/max(a₁, a₂) + 1`, which summed over the `π(a₂) − 1` primes `a₁ < a₂` gives McGown's bound.

**Checks.**

- `V₁ = |𝒜|N` because each pair `(a, n)` has exactly one `x = n a⁻¹` (`a < p` is invertible).
- `A = 28`, `N = 400`, `p = 10⁷`: Lemma 1 gives `V₂ ≤ 22400(0.00112 + 3.9474) = 88,447`
  (`log 51.8 = 3.94739`), while the trivial bound `v(x) ≤ A` gives `V₂ ≤ A · V₁ = 313,600`.
- The hypothesis `A < N/12` excludes `A = 28`, `N = 300` (`300/12 = 25`).
- Prime multipliers `𝒜 = {2, 3, 5}`, `M = 0`, `N = 100`, `p = 1009` (`2AN = 1000 ≤ p`): the
  quadruples are the `300` diagonal ones and, for each ordered pair of distinct primes, the
  solutions of `a₁n₂ = a₂n₁` with `n₁, n₂ ≤ 100`, namely `33`, `20` and `20` for `{2, 3}`, `{2, 5}`
  and `{3, 5}`; so `V₂ = 300 + 2 · 73 = 446`, below McGown's bound
  `300 + 200(0 + 1/3 + 2/5) + 2(0 + 1 + 2) = 452.7`.

*Needs:* Mathlib `ZMod`, `Nat.totient`, `Nat.gcd`, `Nat.primeCounting`.

### 4.3 Burgess's amplification inequality

Let `M ∈ ℤ`, `N ≥ 1`, `r ≥ 1`, reals `1 ≤ A < p` and `B ≥ 1`, and a nonempty set `𝒜` of integers
in `[1, A]`; put `H = |𝒜|⌊B⌋`, `E(h) = max_{K ∈ ℤ} |S_χ(K, h)|` and
`W = Σ_{x mod p} |Σ_{1 ≤ b ≤ B} χ(x + b)|^{2r}`. Prove

    |S_χ(M, N)| ≤ H⁻¹ V₁^{1−1/r} V₂^{1/(2r)} W^{1/(2r)} + (2/H) Σ_{a ∈ 𝒜, b ≤ B} E(ab)

with `v`, `V₁`, `V₂` as in §4.2 for `𝒜` and `⌊A⌋` (trevino2015 displays (26)–(29),
lines 643–700, where `𝒜` is the set of all integers in `[1, A]`; mcgown2012 Lemma A.5,
lines 1083–1118, where `𝒜` is the set of primes in `[1, A]`). Proof: for every `h ≥ 0`,
`S_χ(M, N) − Σ_{M<n≤M+N} χ(n + h) = S_χ(M, h) − S_χ(M + N, h)`, of modulus at most `2E(h)`; average
over `h = ab` with `a ∈ 𝒜` and `1 ≤ b ≤ B`; since `χ(n + ab) = χ(a)χ(a⁻¹n + b)`, the main part is
at most `Σ_x v(x)|Σ_b χ(x + b)|`; apply Hölder's inequality with exponents `(1 − 1/r)⁻¹`, `2r`,
`2r`.

**Checks.**

- `A = B = 1`, `N < p`: `𝒜 = {1}`, `H = 1`, `v` is the indicator of the residues of
  `(M, M + N]`, `V₁ = V₂ = N`, and with `r = 1`, `W = p − 1` the inequality reads
  `|S| ≤ √(N(p − 1)) + 2E(1)`, weaker than the trivial bound `N` whenever `N < p − 1`.
- Prime multipliers need `A ≥ 2`: for `1 ≤ A < 2` the set of primes in `[1, A]` is empty and
  `H = 0`, which the hypothesis that `𝒜` is nonempty excludes; at `A = 5`, `B = 3` it is
  `{2, 3, 5}` and `H = 9`, against `H = 15` for all multipliers.
- The shift identity at `h = N` gives `S(M, N) − S(M + N, N) = S(M, N) − S(M + N, N)`, a tautology;
  the identity holds for every `h`, not only `h < N`.
- `A ≥ p` is excluded: `a = p` is not invertible and `χ(n + pb) = χ(n)` gives no averaging.

*Needs:* §0.4; §4.2 (definitions); Mathlib `Real.inner_le_Lp_mul_Lq_of_nonneg` (three-factor
Hölder by iteration), `ZMod.unitOfCoprime`.

### 4.4 McGown's parametric Burgess inequality and his table

*Parametric form.* Prove `burgess_mcgown_parametric`: let `p` be an odd prime, `r ≥ 2`, and reals
`d > 4`, `C ≥ 1`, `p₀ ≥ 2` with

    (A.1)  C^r p₀^{1/4 − 1/(4r)} (log p₀)^{1/2} ≥ 4d(d + 1)r,
    (A.2)  C ≥ ((d + 1)(2r − 1)(4r − 1))^{1/(2r)} / (1 − 2 d^{−(1 − 1/r)}).

Then, under `RosserSchoenfeldFiniteRangeInput`, for `p ≥ p₀`, every integer `N₀` and every
integer `1 ≤ H ≤ √(rd) · p^{1/2 + 1/(4r)}`,
`|Σ_{N₀ < n ≤ N₀+H} χ(n)| ≤ C H^{1−1/r} p^{(r+1)/(4r²)} (log p)^{1/(2r)}` (mcgown2012
Theorem A.9, lines 1209–1233). Proof route (mcgown2012 lines 1234–1432): induction
on `H`, with the trivial bound for `H < C^r p^{1/4+1/(4r)}(log p)^{1/2}`; write `H₀ = AB` with
`H/(d + 1) < H₀ ≤ H/d` and `B = ⌊4r p^{1/(2r)}⌋ ≥ 4r`; apply §4.3 with `𝒜` the primes in
`[1, A]` (McGown's Lemma A.5) and the induction hypothesis in the error term; bound `W` by §4.1,
which with `(2r − 1)!! ≤ (4r)^r/4` and `B + 1 > 4r p^{1/(2r)}` gives `W ≤ (2r − 1/2)B^{2r}√p`;
bound `V₂ ≤ 2π(A)H` by the prime-multiplier count of §4.2 (`2AH ≤ p` holds by the choice of `A`),
using `Σ_{a prime ≤ X} (π(a) − 1)/a < π(X)/3` for every `X ≥ 2` (McGown's Lemma A.8,
lines 1192–1204: direct evaluation for `X ≤ 100`, and `π(n) − 1 ≤ n/3` for `n ≥ 100` because the
primes above `5` lie in the eight classes prime to `30`) and `π(A) ≤ (A + 1)/2 ≤ H/(2dB) + 1/2`;
and bound `H/π(A)` by `π(A) ≥ A/(1 + log A)` for integers `A ≥ 3`, which is AnalyticNumberTheoryPartI
§0.5 for `A ≥ 59` and a direct count of primes for `3 ≤ A ≤ 58`. The closing inequality is (A.5),
equivalent to (A.2).

*Table.* Define `mcgownConstant` `r`, the tabulated constant `C(r)` below for `2 ≤ r ≤ 15` (and
`0` outside that range). Prove `burgess_mcgown_table`: under `RosserSchoenfeldFiniteRangeInput`
and `McGownTableCertificate` (§6.5), for primes `p ≥ 2 · 10⁴`, `2 ≤ r ≤ 15`, every integer `N₀` and
every integer `1 ≤ H ≤ 4p^{1/2+1/(4r)}`,
`|Σ_{N₀ < n ≤ N₀+H} χ(n)| < C(r) H^{1−1/r} p^{(r+1)/(4r²)} (log p)^{1/(2r)}` with
`C(2) = 10.0366`, `C(3) = 4.9539`, `C(4) = 3.6493`, `C(5) = 3.0356`, `C(6) = 2.6765`,
`C(7) = 2.4400`, `C(8) = 2.2721`, `C(9) = 2.1467`, `C(10) = 2.0492`, `C(11) = 1.9712`,
`C(12) = 1.9073`, `C(13) = 1.8540`, `C(14) = 1.8088`, `C(15) = 1.7700` (mcgown2012 Theorem A.1,
lines 1030–1050; trevino2015 Theorem C, lines 113–128; tmeemt-art15 lines 291–338). Proof: the
parametric form at `d = 11`, `p₀ = 2 · 10⁴` (mcgown2012 line 1433) with `C = C₀(r)`, the right
side of (A.2); since `√(11r) ≥ 4` the range of `H` is covered, and `C₀(r) < C(r)` gives the strict
inequality.

**Checks.**

- `r = 2`, `d = 11`: `C₀(2) = (12 · 3 · 7)^{1/4}/(1 − 2/√11) = 3.98428/0.396977 = 10.03655`,
  rounded up to the tabulated `10.0366`; `r = 3`:
  `660^{1/6}/(1 − 2 · 11^{−2/3}) = 2.95067/0.59564 = 4.95382`, rounded up to `4.9539`.
- (A.1) at `r = 2`, `C = C₀(2)`, `p₀ = 2 · 10⁴`: `100.73 · 3.448 · 3.147 = 1093 ≥ 528 · 2 = 1056`.
- `d = 4` is excluded: `1 − 2 · 4^{−1/2} = 0` makes (A.2) undefined.
- The prime-count lower bound is the one with `1 + log A`: at `A = 4`, `π(4) = 2 ≥ 4/(1 + log 4)
  = 1.676`, while the bound `A/log A = 2.885` would fail there.

*Needs:* §§4.1, 4.2, 4.3; AnalyticNumberTheoryPartI §0.5; Mathlib `Real.rpow`, `Real.log`,
`Nat.primeCounting`; Layer 6 `McGownTableCertificate`.

### 4.5 Treviño's uniform and tabulated Burgess inequalities

Define `trevinoTable1` `e r`, the constant `c₁(r, p₀)` of Treviño's Table 1 at `p₀ = 10^e` for
`e ∈ {7, 10, 20}` and `2 ≤ r ≤ 10`, and `0` elsewhere: for `p₀ = 10⁷`:
`2.7381, 2.0197, 1.7308, 1.6107, 1.5482, 1.5052, 1.4703, 1.4411, 1.4160` (`r = 2, …, 10`); for
`10¹⁰`: `2.5173, 1.7385, 1.5151, 1.4572, 1.4274, 1.4042, 1.3846, 1.3662, 1.3495`; for `10²⁰`:
`2.3549, 1.3695, 1.3104, 1.2987, 1.2901, 1.2813, 1.2729, 1.2641, 1.2562` (trevino2015 Table 1,
lines 97–107). Define `trevinoTable3` `e r`, the constant `c₂(r, p₀)` of Table 3 at `p₀ = 10^e`
for `e ∈ {10, 15, 20}` and `2 ≤ r ≤ 10`, and `0` elsewhere: for `p₀ = 10¹⁰`:
`3.6529, 2.5888, 2.1914, 1.9841, 1.8508, 1.7586, 1.6869, 1.6283, 1.5794`; for `10¹⁵`:
`3.5851, 2.5144, 2.1258, 1.9231, 1.7959, 1.7066, 1.6384, 1.5857, 1.5410`; for `10²⁰`:
`3.5751, 2.4945, 2.1078, 1.9043, 1.7757, 1.6854, 1.6187, 1.5654, 1.5216` (lines 145–155).

*Theorem 1.* Prove `burgess_trevino_table1`: under `TrevinoTable1Certificate` (§6.6), for
`e ∈ {7, 10, 20}`, `2 ≤ r ≤ 10`, primes `p ≥ 10^e`, nonprincipal `χ` modulo `p`, `M ∈ ℤ` and
`N ≥ 1`, `|S_χ(M, N)| ≤ c₁(r, 10^e) N^{1−1/r} p^{(r+1)/(4r²)} (log p)^{1/r}` (trevino2015
Theorem 1, lines 83–88, stated for `M ≥ 0`, which is no restriction by the periodicity of §0.4).

*Corollary 1.* Prove `burgess_trevino_uniform`: under `TrevinoTable1Certificate`, for primes
`p ≥ 10⁷`, nonprincipal `χ` modulo `p`, every `r ≥ 1`, `M ∈ ℤ` and `N ≥ 1`,
`|S_χ(M, N)| ≤ 2.74 N^{1−1/r} p^{(r+1)/(4r²)} (log p)^{1/r}` (trevino2015 Corollary 1,
lines 91–94; tmeemt-art15 lines 154–157).

*Theorem 2 and Corollary 2.* Prove `burgess_trevino_table3`: under `TrevinoTable3Certificate`
(§6.7), for `e ∈ {10, 15, 20}`, `2 ≤ r ≤ 10`, primes `p ≥ 10^e`, nonprincipal `χ` modulo `p`,
`M ∈ ℤ` and `1 ≤ N ≤ 2p^{1/2+1/(4r)}`,
`|S_χ(M, N)| < c₂(r, 10^e) N^{1−1/r} p^{(r+1)/(4r²)} (log p)^{1/(2r)}` (trevino2015 Theorem 2,
lines 134–141). Prove `burgess_trevino_table3_unrestricted`: under both certificates, for
`3 ≤ r ≤ 10` the same strict bound holds for every `N ≥ 1` (Corollary 2, lines 156–161).

Proof route (trevino2015 §§3–4, lines 637–1025 and 1094–1323): induction on `N`; the trivial
bound and an upper bound on `N` (from §3.2's `|S| ≤ √p log p` for `r = 2`, from the case `r − 1`
for `r ≥ 3`, with the parameter `s` of display (36)) reduce to the ranges (37)–(38) (Theorem 1)
or (52)–(53) (Theorem 2); §4.3 with `𝒜` the set of all integers in `[1, A]`,
`B = ((2r − 3)!!(r − 1))^{1/r} p^{1/(2r)}` (display (33)) and `A = kN/B`, §4.1 for `W`, §4.2
(Lemma 1, resp. Lemma 6) for `V₂`, and the induction hypothesis in the error term (display (43))
give the closing inequality (46)/(47), resp. (58)/(59). The Layer 6 hypotheses
`TrevinoTable1Certificate` and `TrevinoTable3Certificate` assert that these closing inequalities
hold at the tabulated constants with the parameters of Tables 5 and 7 for every `p ≥ p₀`; the
source evaluates them at `p = p₀` (lines 1008–1012 and 1288–1310). Corollary 1: `r = 1` from
§3.2, `2 ≤ r ≤ 10` from Theorem 1 at `p₀ = 10⁷` (`c₁ ≤ 2.7381`), and `r ≥ 11` from (47) with
`s = 1` and `c₁(r) = c₁(r − 1) = 2.74`, an inequality in closed form for every `r ≥ 11` and
`p ≥ 10⁷` (trevino2015 lines 1026–1085). Corollary 2: Theorem 2 together with Theorem 1 at
`r = 2`, which gives `|S_χ(M, N)| ≤ 2.6N^{1/2}p^{3/16}(log p)^{1/2}` for `p ≥ 10¹⁰` and removes the
range restriction (lines 1324–1334).

**Checks.**

- `trevinoTable1 7 2 = 2.7381` and `trevinoTable1 10 2 = 2.5173`: the column is indexed by the
  exponent of `p₀`, and the larger `p₀` has the smaller constant; `trevinoTable1 7 11 = 0` and
  `trevinoTable3 7 2 = 0` lie outside the tables, where no theorem is stated.
- The two exponents of `log p`: at `r = 2`, `p = 10¹⁰`, Theorem 2's factor
  `3.6529 (log p)^{1/4} = 8.00` is below Theorem 1's `2.5173 (log p)^{1/2} = 12.08` despite the
  larger constant; with `(log p)^{1/r}` in Theorem 2 it would be `17.53`, worse than Theorem 1.
- The arXiv text tabulates `c₂` for `p₀ ∈ {10¹⁰, 10¹⁵, 10²⁰}`; the TME-EMT page prints a column
  `p₀ = 10⁷` with values `3.7451, …, 1.6260` (tmeemt-art15 lines 236–282) that matches neither
  heading nor values; at `r = 2`, `p₀ = 10²⁰` the page's `3.5341` is smaller than the arXiv
  `3.5751`. The table stated here is the arXiv one.
- Table 1 at `r = 2`, `p = 10⁷`: the bound is `2.7381 · p^{3/16}(log p)^{1/2}√N = 225.8√N`,
  below the trivial bound `N` exactly when `N > 5.1 · 10⁴`; this is the lower end
  `c₁(2)² p^{3/8} log p ≈ 5.1 · 10⁴` of the range (37) in which the induction works.
- Corollary 1 at `r = 1` reads `|S| ≤ 2.74√p log p`, implied by §3.2.

*Needs:* §§0.4, 3.2, 4.1, 4.2, 4.3; Mathlib `Real.rpow`, `Real.log`, `Nat.doubleFactorial`; Layer 6
`TrevinoTable1Certificate`, `TrevinoTable3Certificate`.

### Examples

McGown's constant at `r = 2` is the closed form `(252)^{1/4}/(1 − 2/√11) = 10.03655`. Burgess's
moment bound at `r = 1` is the orthogonality identity `⌊B⌋p − ⌊B⌋²`; at `r = 2`, `p = 7`, `h = 2`
the quadratic character gives `W₂ = 34 < 98.3`.

### Dependencies

Layer 0 (§0.4), Layer 3 (§3.2). CharacterSumsOverFiniteFields §4.7;
EllipticLegendreCharacterInterfaces §5.1; AnalyticNumberTheoryPartI §0.5 (for §4.4). Tau Ceti:
`DirichletCharacter.sum_range_level_eq_zero`, `WeierstrassCurve.hasse_bound`. Mathlib: Jensen's
inequality, `Nat.primeCounting`. Layer 6: `McGownTableCertificate`, `TrevinoTable1Certificate`,
`TrevinoTable3Certificate`.

## Layer 5: explicit sieve upper bounds

### 5.1 explicit bounds for Selberg diagonal sums

Define `selbergDiagonal` `z`, the diagonal sum `S(z) = Σ_{1 ≤ n ≤ z} μ²(n)/φ(n)`, and
`selbergWeightMass` `z`, the sum `H₁(z) = Σ_{1 ≤ n ≤ z} μ²(n)σ(n)/φ(n)`. The diagonal sum is the
sum `S(u)` of ExplicitPrimeCounting §0.1, from which the sieves below take `S(z) > log z` for
`z ≥ 1`, Büthe's explicit asymptotic `S(z) = log z + γ + Σ_p log p/(p(p − 1)) + θ · 58/√z`,
`|θ| ≤ 1`, for `z ≥ 10⁹`, and, under `MVDiagonalFiniteRange`, the bound `S(z) ≥ log z + 1.07` for
`z ≥ 6`.

- *Coprime comparison.* For integers `k ≥ 1` and real `z ≥ 1`,
  `S_k(z) ≥ (φ(k)/k) S(z)` (vanlintrichert1965, the inequality used in buthe2014 lines 226–236).
  Proof: `S(z) = Σ_{e | k} μ²(e)/φ(e) · S_k(z/e) ≤ S_k(z) Σ_{e | k} μ²(e)/φ(e)` and
  `Σ_{e | k} μ²(e)/φ(e) = k/φ(k)`.
- *Weight mass.* `H₁(z) = (15/π²) z + θ · 47√z` with `|θ| ≤ 1` for real `z ≥ 1` (buthe2014
  Lemma 4.4, lines 365–367; proof lines 368–461, by Dirichlet convolution and explicit Euler
  products with `ζ(2)` and `ζ(4)`).
- *The diagonal bound from `3`.* Under `MVDiagonalFiniteRange`, `S(z) ≥ log z + 0.89` for every
  real `z ≥ 3` (fan2022 lines 185–187, from montgomeryvaughan1973 Lemma 7 and the values of `S` on
  `[3, 6)`). Proof: for `z ≥ 6` the bound with `1.07` of ExplicitPrimeCounting §0.1; for
  `3 ≤ z < 6` direct evaluation, `S(z) = 2.5` on `[3, 5)` and `2.75` on `[5, 6)`.

**Checks.**

- `S(6) = 1 + 1 + 1/2 + 1/4 + 1/2 = 3.25`; with `n` in place of `φ(n)` the value would be
  `1 + 1/2 + 1/3 + 1/5 + 1/6 = 2.2`, and without the factor `μ²(n)` the term `n = 4` would add `1/2`.
- On `[3, 5)`, `S = 2.5 ≥ log 4.99 + 0.89 = 2.497`, a margin that tends to `0.0006` as `z → 5`;
  with `1.07` in place of `0.89` the bound fails there (`log 4.99 + 1.07 = 2.677 > 2.5`), so the
  smaller constant is what extends the bound below `6`.
- `k = 6`, `z = 7`: `S_6(7) = 1 + 1/4 + 1/6 = 1.4167 ≥ (1/3) S(7) = (1/3)(3.4167) = 1.139`.
- `H₁(1) = 1`, `H₁(2) = 1 + 3 = 4`, `H₁(3) = 4 + 4/2 = 6`: the weight `σ(n)/φ(n)` at the primes
  `2, 3` is `3` and `2`; with `σ` replaced by `d` the value at `n = 2` would be `2`.

*Needs:* ExplicitPrimeCounting §0.1 (the diagonal bound under `MVDiagonalFiniteRange`); Mathlib
`ArithmeticFunction.moebius`, `Nat.totient`, `ArithmeticFunction.sigma`.

### 5.2 Greaves's lower bound for Selberg's density sum

Prove `greaves_density_sum`: let `κ ≥ 0` be a function on the primes with `κ(p) < p`, let `z ≥ 2`
and `B > 0` with `Σ_{p < z} κ(p) log p/p ≤ B log z`, and let `s ≥ 2B`. With `P(z) = ∏_{p < z} p`,

    Σ_{d | P(z), d ≤ z^{s/2}} ∏_{p | d} κ(p)/(p − κ(p))
        ≥ (1 − exp(−((s/2) log(s/(2B)) − s/2 + B))) ∏_{p < z} (1 − κ(p)/p)⁻¹

(tmeemt-art14 lines 159–170; greaves2001 Theorem 1, p. 52). The TME-EMT form, summing over every
squarefree `d ≤ z^{s/2}`, follows because the added terms are nonnegative. Proof (Rankin's
method): with `g(p) = κ(p)/(p − κ(p))` and `G = Σ_{d | P(z)} g(d) = ∏_{p<z}(1 − κ(p)/p)⁻¹`, for
`σ ≥ 0`, `Σ_{d | P(z), d > y} g(d) ≤ y^{−σ} ∏_{p<z}(1 + g(p)p^σ)`, and
`∏_{p<z}(1 + g(p)p^σ)/(1 + g(p)) = ∏_{p<z}(1 + (κ(p)/p)(p^σ − 1)) ≤ exp(B(z^σ − 1))` because
`(p^σ − 1)/log p ≤ (z^σ − 1)/log z` for `p < z`; take `y = z^{s/2}` and `z^σ = s/(2B)`.

**Checks.**

- `s = 2B`: the exponent is `0` and the bound is `0`, the trivial case.
- `κ ≡ 1`, `z = 3`, `B = log 2/(2 log 3) = 0.3155`, `s = 2`: the factor is
  `1 − exp(−(log(1/0.3155) − 1 + 0.3155)) = 1 − e^{−0.469} = 0.374`, the right side `0.748`, and
  the left side `1 + 1 = 2`.
- `B = 0` is excluded: `log(s/(2B))` is undefined; for `κ ≡ 0` on `p < z` both sides are `1` and
  the statement is trivial.

*Needs:* Mathlib `Real.exp`, `Real.log`, `Real.rpow`, `ArithmeticFunction.moebius`.

### 5.3 Büthe's weighted sieves

Let `I = [x, x + y] ⊂ [0, ∞)`, let `f` be absolutely continuous on `I`
(`AbsolutelyContinuousOnInterval f x (x + y)`), and write `‖f‖₁ = ∫_I |f|`,
`‖f‖_∞ = max_I |f|`, `‖f′‖₁ = ∫_I |f′|`; for coprime positive integers `k`, `ℓ` put
`A = I ∩ (ℓ + kℤ)` and `P(z, k) = ∏_{p ≤ z, p ∤ k} p`.

- *Remainder.* For `d ≥ 1` coprime to `k`,
  `|(kd)⁻¹ ∫_I f − Σ_{n ∈ A, d | n} f(n)| ≤ ‖f‖_∞ + ‖f′‖₁` (buthe2014 Lemma 3.1, lines 69–73;
  proof lines 74–136 by the mean-value identity for absolutely continuous functions on unit
  intervals).
- *Weighted Selberg sieve.* For `f ≥ 0` and `z ≥ 1`,
  `Σ_{n ∈ A, (n, P(z,k)) = 1} f(n) ≤ ‖f‖₁/(k S_k(z)) + (‖f‖_∞ + ‖f′‖₁) H_k(z)²/S_k(z)²`
  (buthe2014 Proposition 3.2, lines 139–158). Proof: realise the weighted progression as a native
  `BoundingSieve` with total mass `‖f‖₁/k`, density `1/d` on divisors of `P(z, k)` and remainders
  bounded by the remainder lemma; apply `BoundingSieve.siftedSum_le_mainSum_errSum_of_upperMoebius`
  to Selberg's optimal weights at level `⌊z⌋ + 1/2` (SieveMethodsAndPrimePatterns §1.3, whose
  cutoff is strict; the density `1/d` makes its diagonal `Σ μ²(d)/φ(d)`), whose main term is
  `1/S_k(z)` and whose absolute sum is `Σ |λ_n| = H_k(z)/S_k(z)` (van Lint–Richert's evaluation,
  buthe2014 lines 226–236).
- *Weighted Eratosthenes sieve.* For `f ≥ 0` and `z ≥ 1`,
  `Σ_{n ∈ A, (n, P(z,k)) = 1} f(n) ≤ (‖f‖₁/k) ∏_{p ≤ z, p ∤ k}(1 − 1/p) + (‖f‖_∞ + ‖f′‖₁) 2^{π(z)}`
  (buthe2014 Proposition 3.3, lines 237–284), by Möbius inversion over the divisors of `P(z, k)`.

**Checks.**

- `f ≡ 1` on `I`: `‖f‖₁ = y`, `‖f‖_∞ = 1`, `‖f′‖₁ = 0`; the remainder lemma reduces to
  `|y/(kd) − #{n ∈ A : d | n}| ≤ 1`, the classical count of a progression in an interval.
- `k = 1`, `z = 1`: `S₁(1) = H₁(1) = 1`, `P(1, 1) = 1`, and the Selberg form reads
  `Σ_{n ∈ I} f(n) ≤ ‖f‖₁ + ‖f‖_∞ + ‖f′‖₁`, the remainder lemma at `d = 1`.
- Absolute continuity is needed: the step function equal to `1` within `ε` of each integer and
  `0` elsewhere on `I = [0, 3]` has `∫_I f = 6ε`, `Σ_{n ∈ I} f(n) = 4`, `‖f‖_∞ = 1` and almost
  everywhere derivative `0`, so the remainder bound would claim `|6ε − 4| ≤ 1`, which is false.

*Needs:* Mathlib `AbsolutelyContinuousOnInterval`,
`AbsolutelyContinuousOnInterval.integral_deriv_eq_sub`, `BoundingSieve`,
`BoundingSieve.siftedSum_le_mainSum_errSum_of_upperMoebius`; SieveMethodsAndPrimePatterns §1.3;
§5.1.

### 5.4 weighted Brun–Titchmarsh inequalities

With the notation of §5.3 define `butheRho` `f x y`, Büthe's functional
`ρ_I(f) = ‖f‖₁/(‖f‖_∞ + ‖f′‖₁)` for `f ≠ 0` and `ρ_I(0) = 0` (buthe2014 Definition 4.1,
lines 291–295), with `‖f′‖₁` the integral of the almost-everywhere derivative and `‖f‖_∞` the
supremum of `|f|` on `I`.

- `ρ_I(cf) = ρ_I(f)` for every real `c ≠ 0`, since all three norms scale by `|c|`.
- `ρ_I(f) ≤ y` for every `f`, since `‖f‖₁ ≤ y ‖f‖_∞`; and `ρ_I(1) = y` for the constant `1`.
- For `y > 0` and continuous `f`, `ρ_I(f) > 0` exactly when `f` is not identically `0` on `I`;
  for `y = 0` it is `0`.

Results:

- *General modulus.* Prove `buthe_weighted_brun_titchmarsh`: for coprime positive integers `k`,
  `ℓ` and every nonnegative absolutely continuous `f` on `I` with `ρ_I(f) > k`,
  `Σ_{p ∈ I, p ≡ ℓ (k)} f(p) < (2‖f‖₁/(φ(k) log(ρ_I(f)/k)))(1 + 8/log(ρ_I(f)/k))` and
  `Σ_{p ∈ I, p ≡ ℓ (k)} f(p) < 3‖f‖₁/(φ(k) log(ρ_I(f)/k))` (buthe2014 Theorem 4.2, lines 298–314).
  Proof route: normalise to `g = f/(‖f‖_∞ + ‖f′‖₁)`, pass to the odd progression modulo
  `k₁ = lcm(k, 2)` at the cost of `1`, apply the weighted Selberg sieve of §5.3 and choose `z` as
  in vanlintrichert1965 (buthe2014 lines 315–348).
- *Modulus one.* Prove `buthe_weighted_prime_sum`: under `ButheSmallRangeVerified` and
  `ButheMediumRangeVerified`, for every nonnegative absolutely continuous `f` on `I` with
  `ρ_I(f) > 1`, `Σ_{p ∈ I} f(p) < 2‖f‖₁/log ρ_I(f)` (buthe2014 Theorem 4.3, lines 354–362). Proof
  route (lines 602–655): for `Y = ρ_I(f) > 4 · 10^18`, §5.3's Selberg form with `z = √Y/2`,
  §5.1's asymptotic for `H₁`, Büthe's asymptotic for `S` (ExplicitPrimeCounting §0.1) and
  `π(z) ≤ z`; for `1 < Y < 20000`, §5.3's Eratosthenes form and
  `ButheSmallRangeVerified`; for `20000 ≤ Y ≤ 4 · 10^18`, §5.3's Selberg form and
  `ButheMediumRangeVerified`. In each case the primes `p ≤ z` contribute at most `π(z)` after the
  normalisation `‖g‖_∞ ≤ 1`.
- *Corollary.* Under the same hypotheses, for real `x ≥ 0` and `y > 1`, the number of primes in
  `[x, x + y]` is less than `2y/log y` (take `f ≡ 1`, so `ρ_I(f) = y`).

**Checks.**

- `f ≡ 1` on `I`: `ρ_I(f) = y`, and the general-modulus form is the van Lint–Richert inequality
  `π(x + y; k, ℓ) − π(x; k, ℓ) < (2y/(φ(k) log(y/k)))(1 + 8/log(y/k))` (buthe2014 lines 349–353),
  weaker than ExplicitPrimeCounting §0.1 by the factor `1 + 8/log(y/k)`.
- `I = [0, 10]`, `f ≡ 1`: the corollary gives `π(10) = 4 < 20/log 10 = 8.69`; at `I = [1.9, 5.1]`
  the primes `2, 3, 5` give `3 < 6.4/log 3.2 = 5.50`.
- The tent `f(t) = min(t − x, x + y − t)` on `I`: `‖f‖₁ = y²/4`, `‖f‖_∞ = y/2`, `‖f′‖₁ = y`,
  so `ρ_I(f) = y/6`; the weight costs a factor `6` inside the logarithm compared with `f ≡ 1`.

*Needs:* §§5.1, 5.3; ExplicitPrimeCounting §0.1 (Büthe's asymptotic for `S`); Layer 6
`ButheSmallRangeVerified`, `ButheMediumRangeVerified`.

### 5.5 the weighted arithmetic large sieve, the sifted Brun–Titchmarsh bound and the Ramaré–Viswanadham sums

*Weighted arithmetic large sieve.* Let `M` be an integer, `N ≥ 1`, and `𝒩` a nonempty set of `Z`
integers in `(M, M + N]`; for each prime `p` let `ω(p) < p` be the number of residue classes
modulo `p` containing no element of `𝒩`. Prove that for every real `Q ≥ 1`

    Z ≤ 1/L(Q),   L(Q) = Σ_{q ≤ Q} μ²(q) (N + (3/2) qQ)⁻¹ ∏_{p | q} ω(p)/(p − ω(p))

(montgomeryvaughan1973 Corollary 1; platttrudgian2018 Theorem 2, lines 131–139, quotes it). Proof: for
`Q < 2` only `q = 1` occurs and the bound `Z ≤ N + (3/2)Q` is trivial. Otherwise apply
ExplicitZetaBounds §6.5 to the indicator of `𝒩` at the reduced fractions `a/q` with `q ≤ Q`: two
of them lie at distance at least `1/(qq′) ≥ 1/(qQ)`, so `δ(a/q)⁻¹ ≤ qQ` and
`Σ_{q ≤ Q} (N + (3/2)qQ)⁻¹ Σ*_{a mod q} |S(a/q)|² ≤ Z`. It remains that
`Σ*_{a mod q} |S(a/q)|² ≥ Z² ∏_{p | q} ω(p)/(p − ω(p))` for squarefree `q`. For a prime `p` and any
sequence supported on `𝒩`, `Σ_{a mod p} |S(a/p)|² = p Σ_h |Σ_{n ≡ h} a_n|²`, and Cauchy–Schwarz
over the `p − ω(p)` classes meeting `𝒩` bounds this below by `p|S(0)|²/(p − ω(p))`, so the terms
with `a ≢ 0` give at least `|S(0)|² ω(p)/(p − ω(p))`; a squarefree `q = pq′` follows by induction,
applying the prime case to the twisted sequences `a_n e(nb/q′)`, `b` prime to `q′`, which are
supported on `𝒩`. ExplicitPrimeCounting §0.1 takes this step for a set avoiding one residue class
modulo each prime (`ω(p) = 1`, where the product is `1/φ(q)`); the weighted arithmetic large sieve
here differs in allowing `ω(p)` forbidden classes modulo each prime and an arbitrary set `𝒩`.

*Sifted form.* Under `MVDiagonalFiniteRange`, for coprime positive integers `k`, `ℓ` and reals
`x ≥ 0`, `y > k`, there is a real `z ≥ 1` such that the number of integers `n ∈ (x, x + y]` with
`n ≡ ℓ (mod k)` and no prime factor `p ≤ z`, `p ∤ k`, plus `π(z)`, is at most
`2y/(φ(k) log(y/k))` (montgomeryvaughan1973 proof of Theorem 2, display (3.3) and Lemma 10, as
described in ramareviswanadham2021 lines 660–666). The primes of the progression above `z` are
sifted and those up to `z` are counted by `π(z)`, so the prime count of ExplicitPrimeCounting §0.1
is read off from it. Proof route: put `t = y/k`. The members of the class in `(x, x + y]` are
`ℓ₀ + km` for `m` in at most `N = ⌊t⌋ + 1` consecutive integers, and for a prime `p ∤ k` the
condition `p | ℓ₀ + km` is one class of `m` modulo `p`. Since
`∏_{p ≤ z, p ∤ k}(1 − 1/p) ≤ (k/φ(k)) ∏_{p ≤ z}(1 − 1/p)`, each bound below is `k/φ(k)` times a
bound in `t` alone, to be compared with `2t/log t`.

- `1 < t ≤ 1000`, Eratosthenes (montgomeryvaughan1973 Lemma 10): by periodicity modulo
  `∏_{p ≤ z, p ∤ k} p`, the sifted `m` number at most
  `N ∏_{p ≤ z, p ∤ k}(1 − 1/p) + ∏_{p ≤ z}(p − 1)`, so the count plus `π(z)` is at most `k/φ(k)`
  times `(t + 1)/3 + 4` at `z = 3` and `4(t + 1)/15 + 11` at `z = 5`. The first is at most
  `2t/log t` for `1 < t ≤ 318`, the second for `42 ≤ t ≤ 1465`; for `t ≥ e²` the function
  `2t/log t` is concave, so each comparison with a linear function on an interval is decided at
  the endpoints, and on `(1, e²)` the first holds with margin at least `0.087` (attained near
  `t = 3.55`).
- `t ≥ 1000`, `z = Q`: the weighted arithmetic large sieve with `ω(p) ≥ 1` for `p ≤ Q`, `p ∤ k`
  bounds the sifted count by `1/L_k(Q)` with
  `L_k(Q) = Σ_{q ≤ Q, (q, k) = 1} μ²(q)/(φ(q)(N + (3/2)qQ))`; the comparison
  `L₁(Q) ≤ (k/φ(k)) L_k(Q)` of ExplicitPrimeCounting §0.1 and `π(Q) ≤ (k/φ(k))π(Q)` reduce to
  `k = 1`. It remains that `1/L₁(Q) + π(Q) ≤ 2t/log t` for some `Q`: partial summation from
  `S(u) ≥ log u + 1.07` for `u ≥ 6` (ExplicitPrimeCounting §0.1) and the values of `S` on `[1, 6)`,
  with `π(Q) ≤ Q/3 + 2`, gives it at `Q` near
  `√(2t/3)` for every `t ≥ 1000` (at `t = 1000`, `Q = 23`: `287.0 < 289.5`); there the weights cost
  `(1/2) log 6` against the main term `(1/2) log N`, the constant `1.07` repays it, and the saving
  over `2t/log t` grows like `t/log² t`.

*Corollaries.*

- *Prime powers.* Prove `ramare_viswanadham_prime_powers`: under `MVDiagonalFiniteRange`, for
  reals `A ≥ B > d ≥ 1` with `d` an integer and `a` prime to `d`,
  `Σ_{A < m ≤ A+B, m ≡ a (d)} Λ(m)/log m ≤ 2B/(φ(d) log(B/d))` (ramareviswanadham2021 Lemma 14,
  lines 650–666; tmeemt-art14 lines 97–104). Since `A ≥ B`, each prime has at most one power in
  `(A, A + B] ⊂ (A, 2A]`, and `Λ(m)/log m ≤ 1`; a power of a prime `p > z` is sifted and the powers
  of primes `p ≤ z` number at most `π(z)`, so the sifted form applies. The hypothesis `A ≥ B` is
  needed for this and is absent from Montgomery–Vaughan's statement.
- *Dyadic von Mangoldt sums* (ramareviswanadham2021 Lemma 15, lines 667–679; tmeemt-art14
  lines 106–111): under `MVDiagonalFiniteRange`, for `q ≥ 1`, `a` coprime to `q` and real
  `M ≥ max(121, q³)`,
  `Σ_{M < m ≤ 2M, m ≡ a (q)} Λ(m) ≤ 3(1 + log 2/log M) M/φ(q) ≤ (7/2) M/φ(q)`, which contains the
  source's `(9/2) M/φ(q)`. Proof: the prime-power corollary with `A = B = M`, `d = q` (`M > q`),
  `Λ(m) ≤ log(2M) · Λ(m)/log m`, and `log(M/q) ≥ (2/3) log M` from `q ≤ M^{1/3}`; then
  `log 2/log 121 = 0.1445`.

**Checks.**

- The weighted sieve on the odd integers of `(0, 10]`: `Z = 5`, `ω(2) = 1` and `ω(p) = 0` for odd
  `p`, so at `Q = 2`, `L = 1/13 + 1/16` and `1/L = 7.17 ≥ 5`. For `𝒩` the whole interval,
  `ω(p) = 0` for every `p ≤ N`, and for `Q ≤ N` the bound is the trivial `N + (3/2)Q`.
- The unweighted sieve does not reach the constant `2` (negative control): at `k = 1`,
  `t = 1000`, the forbidden-residue sieve of SieveMethodsAndPrimePatterns §2.9 gives at best
  `min_Q ((t + Q²)/S(Q) + π(Q)) = 301.77` (at `Q = 15`), above `2t/log t = 289.53`; the weighted
  sieve gives `1/L₁(22) + π(22) = 269.53` with `N = 1001`. With `S(Q) ≥ log Q + 1.07` and
  `Q² = εt`, the unweighted form needs `εL − log ε ≤ 2.14` (`L = log t`, before adding `π(Q)`),
  and the left side is at least `1 + log L`, which exceeds `2.14` for every `t > 23`.
- The Eratosthenes ranges: at `t = 318`, `(t + 1)/3 + 4 = 110.33 ≤ 2t/log t = 110.38`, and at
  `t = 319` the `z = 3` bound `110.67` exceeds `110.66`, where `z = 5` gives `96.33`.
- `k = 1`, `x = 0`, `y = 10`: the primes up to `10` are `2, 3, 5, 7`, so the prime count is
  `4 ≤ 20/log 10 = 8.69`; with `z = 3` the sifted integers of `(0, 10]` are `1, 5, 7` and the
  sifted count plus `π(3)` is `3 + 2 = 5 ≤ 8.69`.
- Prime powers, `d = 1`, `A = B = 10`: `(10, 20]` holds `11, 13, 16, 17, 19`, so the sum is
  `4 + 1/4 = 4.25 ≤ 20/log 10 = 8.69`; `d = 3`, `a = 1`, `A = B = 30`: `31, 37, 43` and `49 = 7²` give
  `3.5 ≤ 60/(2 log 10) = 13.03`.
- `M = 121`, `q = 1`: `3(1 + 0.1445) = 3.434 ≤ 3.5 ≤ 4.5`; `q = 5` needs `M ≥ 125`.
- Without `A ≥ B`: for `A = 1`, `B = 7`, `d = 1`, the interval `(1, 8]` contains `2, 4, 8`, three
  powers of one prime, so the reduction to one power per prime fails (the inequality happens to
  hold there, `4.83 ≤ 7.19`); the corollary is not claimed outside `A ≥ B`.

*Needs:* ExplicitZetaBounds §6.5; ExplicitPrimeCounting §0.1 (the diagonal bound under
`MVDiagonalFiniteRange`, and the comparison of `L₁` and `L_k`); §5.1 (the carrier
`selbergDiagonal`); Mathlib `Finset.sum_mul_sq_le_sq_mul_sq`, `ArithmeticFunction.vonMangoldt`,
`ArithmeticFunction.moebius`, `Nat.primeCounting`, `Nat.totient`.

### 5.6 integers free of small prime factors

Define `roughCount` `x z`, the count `Φ(x, z)` of the integers `1 ≤ n ≤ x` with no prime factor
`p ≤ z`. Prove `fan_rough_count`: under `RosserSchoenfeldFiniteRangeInput`,
`MVDiagonalFiniteRange` and `FanFiniteRange`, for reals `1 < z ≤ x`, `Φ(x, z) < x/log z`; if
moreover `x ≥ 8` and `z ≥ max(3, √x)`, `Φ(x, z) < x/log z − x/(2 log² z)`; and if
`max(2, x^{2/5}) ≤ z ≤ √x`, `Φ(x, z) < 2x/(3 log z)` (fan2022 Theorem, inequalities (4)–(6),
lines 157–163; tmeemt-art14 lines 181–191 state (4)). The source states (5) for every `x` with
`z ≥ max(3, √x)`; it fails at `x = 7` for `4.9910 < z < 5` (Checks), below the range `9 ≤ n < 289`
of its direct verification (fan2022 lines 215–222), and it holds for every real `x ≥ 8`. Proof
route (fan2022 lines 164–463): for `1 < z < 3` direct counting; for `3 ≤ z ≤ x^{2/5}`,
SieveMethodsAndPrimePatterns §2.9 with the class `0` forbidden at every prime `p ≤ z` gives
`Φ(x, z) ≤ (x + z²)/S(z)`, and §5.1 gives `S(z) ≥ log z + 0.89`; for `z ≥ x^{2/5}`,
`Φ(x, z) = 1 + π(x) − π(z) + #{pq ≤ x : z < p ≤ q}` (and its analogue for (6)) bounded with
AnalyticNumberTheoryPartI §0.5 for `π`, §0.19 for `Σ 1/p` and §0.20 for `Σ log p/p`, all at
arguments at least `319` when `x ≥ 2 · 10⁶`; for `x < 2 · 10⁶` the Layer 6 hypothesis
`FanFiniteRange`.

**Checks.**

- `x = 9`, `z = 3`: `Φ = 3` (`1, 5, 7`), `x/log z = 8.19`, and (5) gives `8.19 − 3.73 = 4.46`.
- `x = 32`, `z = 4`: `Φ = 11` (the integers coprime to `6` up to `32`) `< 64/(3 log 4) = 15.4`.
- `x = z = 1.5`: `Φ = 1 < 1.5/log 1.5 = 3.70`; at `z = 1` the bound `x/log 1` is undefined, which
  the hypothesis `z > 1` excludes.
- Negative control for (5): at `x = 7` and `z ∈ (4.9910, 5)`, `Φ(7, z) = 3` (`1, 5, 7`) while
  `7/log z − 7/(2 log² z) < 3`: the right side decreases in `z` (for `log z > 1`), equals `3` at
  `z = 4.99094…` (where `log z = (7 + √7)/6`) and tends to `2.99814…` as `z → 5`; at `z = 5` the count
  drops to `2`. At `x = 8` the right side is at least `3.42`, `3.05` and `2.92` on `[3, 5)`,
  `[5, 7)` and `[7, 8]`, where `Φ = 3, 2, 1`. The
  condition `z ≤ x` is needed in (5): at `x = 8`, `z = e^{10}`, `Φ = 1` exceeds `8/10 − 8/200 = 0.76`.

*Needs:* SieveMethodsAndPrimePatterns §2.9; AnalyticNumberTheoryPartI §§0.5, 0.8, 0.19, 0.20;
§5.1 (the bound from `z = 3`, under `MVDiagonalFiniteRange` of ExplicitPrimeCounting §0.1); Layer 6
`FanFiniteRange`.

### Examples

`S(6) = 3.25`; Greaves at `κ ≡ 1`, `z = 3`, `s = 2` gives `2 ≥ 0.748`; `π(10) = 4` against
Büthe's `8.69`; `Φ(32, 4) = 11 < 15.4`.

### Dependencies

Layer 0 is not needed. SieveMethodsAndPrimePatterns §§1.3, 2.9; ExplicitZetaBounds §6.5;
AnalyticNumberTheoryPartI §§0.5, 0.8, 0.19, 0.20; ExplicitPrimeCounting §0.1 (the diagonal bound
under `MVDiagonalFiniteRange` and Büthe's asymptotic for `S` in 5.1, 5.4, 5.5 and 5.6, the
comparison of `L₁` and `L_k` in 5.5, `brun_titchmarsh` in the Checks of 5.4); Mathlib
`BoundingSieve`, absolutely continuous functions. Layer 6: `ButheSmallRangeVerified`,
`ButheMediumRangeVerified`, `FanFiniteRange`.

## Layer 6: computational hypotheses

Each item is a `Prop` with no proof obligation in this roadmap. Items 6.1–6.5 are numerical
statements about explicitly given real numbers, or about integers and characters in an explicitly
bounded range. Items 6.6 and 6.7 are, for each of finitely many table rows, an inequality between
explicit elementary functions of one real variable `p` on the half-line `[p₀, ∞)`; they are not
finite verifications, and their Checks say why the value at `p = p₀` alone does not suffice. No
item mentions an unbounded family of characters or primes, and none contains the conclusion of the
theorem that consumes it.

### 6.1 small moduli in Lapkova's lemma

`LapkovaSmallModuliVerified`: for every `q` with `2 ≤ q ≤ 25` and every primitive character `χ`
modulo `q`, `LapkovaBound χ` holds (lapkova2018 lines 291–408, the Bober–Goldmakher data).

**Checks.**

- `q = 3`, the odd quadratic character: `M_χ = 1 ≤ 0.303 + 1.421 + 1.029 = 2.75`.
- `q = 5`, the even quadratic character: `M_χ = 2 ≤ 0.729 + 2.117 + 1.668 = 4.51`; `q = 4`, the odd
  character `χ₄`: `M_χ = 1 ≤ 3.11`.
- `q = 23`, the odd quadratic character: `M_χ = 5 ≤ 0.1592 · 4.796 · 3.135 + 0.8204 · 4.796 +
  1.0285 = 7.356` (worked example below). A modulus `q ≡ 2 (mod 4)`, such as `q = 6` or `22`, has
  no primitive character, so it imposes nothing.
- The range stops at `25`: for `q > 25` §3.5 is proved analytically, and a version of the
  hypothesis claiming every `q` would contain the conclusion of §3.5.

### 6.2 Büthe's small range

`ButheSmallRangeVerified`: for every real `Y` with `1 < Y < 20000` there is a real `z ≥ 1` with
`Y ∏_{p ≤ z}(1 − 1/p) + 2^{π(z)} + π(z) < 2Y/log Y` (buthe2014 lines 633–649).

**Checks.**

- `Y = 100`, `z = 7`: `22.86 + 16 + 4 = 42.86 < 200/log 100 = 43.43`.
- `Y = 1.5`, `z = 1` (empty product, `π(1) = 0`): `1.5 + 1 + 0 = 2.5 < 3/log 1.5 = 7.40`.
- The witness depends on `Y`: `z = 7` fails at `Y = 20` (`4.57 + 20 = 24.57 > 40/log 20 = 13.35`),
  where `z = 1` gives `20 + 1 = 21 > 13.35` and `z = 2` gives `10 + 2 + 1 = 13 < 13.35`.
- The proposition is a finite check. For fixed `z` the left side
  `Y ∏_{p ≤ z}(1 − 1/p) + 2^{π(z)} + π(z)` is affine in `Y`. For `Y ≥ e²` the right side `2Y/log Y`
  is concave, so a witness `z` at both ends of an interval `[Y₀, Y₁] ⊂ [e², 20000]` is a witness on
  the whole interval. On `(1, e²]` it is convex, hence above its tangent at `e²`, which is
  `Y/2 + e²/2`; so `z = 2`, with left side `Y/2 + 3`, is a witness on all of `(1, e²]`, with margin at
  least `e²/2 − 3 = 0.69`. A grid of points with no such interval argument would prove nothing
  between them.

### 6.3 Büthe's medium range

`ButheMediumRangeVerified`: for every real `Y` with `20000 ≤ Y ≤ 4 · 10^18` there is a real
`z ≥ 1` with `Y/S(z) + H₁(z)²/S(z)² + π(z) < 2Y/log Y` (buthe2014 lines 650–655).

**Checks.**

- For fixed `z` the condition holds on `[Y₀, Y₁]` once it holds at both ends, because `t/log t`
  is concave for `t > e²` and the left side is affine in `Y`; the hypothesis is therefore a finite
  check.
- At `Y = 20000` the right side is `2 · 20000/log 20000 = 4039.0`. The term `Y/S(z)` forbids small
  `z` and the term `H₁(z)²/S(z)²` forbids large `z`: `z = 65` (`S = 5.4714`, `H₁ = 99.386`,
  `π(65) = 18`) gives `3655.3 + 330.0 + 18 = 4003.3 < 4039.0`, while `z = 40` gives `4154.9` and
  `z = 100` gives `4073.0`; the three terms are constant on `[n, n + 1)`, and every witness at this
  `Y` lies in `[57, 85)`. `z = 1` gives `Y + 1 > 4039`.
- Above `4 · 10^18` the analytic argument of §5.4 applies; the hypothesis claims nothing there.

### 6.4 Fan's finite range

`FanFiniteRange`: inequalities (4), (5) and (6) of §5.6 for every real `x < 2 · 10⁶` and every `z`
in the respective ranges, (5) for `x ≥ 8`. It holds: on this range fan2022's Theorem is proved
analytically (lines 164–463) apart from three direct verifications, of (5) for `9 ≤ x < 289`
(lines 215–222), of (4) with `x^{2/5} ≤ z ≤ √x` for `9 ≤ x < 1024` (lines 290–292) and of (6) for
`9 ≤ x < 137 550` (lines 449–462), and apart from `3 ≤ z ≤ x < 9`, which those verifications do
not reach and §5.6 counts directly ((5) fails at `x = 7` and holds for `8 ≤ x < 9`). The
proposition takes the whole range `x < 2 · 10⁶`, below the point from which §5.6 uses
AnalyticNumberTheoryPartI, as one finite verification.

**Checks.**

- `x = 9`, `z = 3`: `Φ = 3 < 4.46` (inequality (5)).
- `x = 32`, `z = 4`: `Φ = 11 < 15.4` (inequality (6)).
- `Φ(x, z)` is constant in `z` between consecutive primes and in `x` between consecutive
  integers, and the right sides decrease in `z` and increase in `x`, so only finitely many pairs
  need checking. Without the restriction `x ≥ 8` the proposition would be false at `x = 7`,
  `z ∈ (4.9910, 5)` (§5.6).

### 6.5 McGown's table

`McGownTableCertificate`: for each `r ∈ {2, …, 15}`, with
`C₀(r) = (12(2r − 1)(4r − 1))^{1/(2r)}/(1 − 2 · 11^{−(1 − 1/r)})`, one has
`C₀(r) < mcgownConstant r` and `C₀(r)^r (2 · 10⁴)^{1/4 − 1/(4r)} (log(2 · 10⁴))^{1/2} ≥ 528r`.

**Checks.**

- `C₀(2) = 252^{1/4}/(1 − 2/√11) = 3.98428/0.396977 = 10.03655 < 10.0366`.
- `C₀(3) = 660^{1/6}/(1 − 2 · 11^{−2/3}) = 4.95382 < 4.9539`; the tightest row is `r = 8`, where
  `C₀(8) = 2.272099 < 2.2721`, a margin of about `10⁻⁶`.
- The second inequality at `r = 2`: `10.0365² · 3.448 · 3.147 = 1093 ≥ 1056`; at `r = 15`,
  `1.77^{15} · (2 · 10⁴)^{7/30} · 3.147 ≈ 1.66 · 10⁵ ≥ 7920`. All fourteen rows of both
  inequalities hold.

### 6.6 Treviño's Table 1

Define `trevinoTable5` `e r`, the pair `(k, c′₁)` of Treviño's Table 5 at `p₀ = 10^e` for
`e ∈ {7, 10, 20}` and `2 ≤ r ≤ 10` (trevino2015 lines 1013–1024), and `(0, 0)` elsewhere: for
`p₀ = 10⁷`: `(2/45, 2.738), (1/16, 2.019), (1/12, 1.729), (1/12, 1.610), (1/12, 1.548),
(11/150, 1.504), (19/300, 1.470), (19/300, 1.441), (4/75, 1.415)` (`r = 2, …, 10`); for `10¹⁰`:
`(1/30, 2.517), (11/150, 1.737), (31/300, 1.515), (7/75, 1.456), (1/12, 1.426), (11/150, 1.404),
(19/300, 1.383), (19/300, 1.366), (4/75, 1.349)`; for `10²⁰`: `(1/30, 2.354), (2/15, 1.369),
(37/300, 1.310), (31/300, 1.298), (7/75, 1.289), (1/12, 1.281), (1/12, 1.272), (11/150, 1.264),
(11/150, 1.256)`.

`TrevinoTable1Certificate`: for each `e ∈ {7, 10, 20}`, each `2 ≤ r ≤ 10` and every real
`p ≥ 10^e`, put `c = trevinoTable1 e r`, `(k, c′) = trevinoTable5 e r`,
`D = ((2r − 3)!!(r − 1))^{1/r}`, `B = D p^{1/(2r)}` (display (33)),
`A = k c′^r p^{1/4 − 1/(4r)} log p / D` (the least `A = kN/B` allowed by the range (37)–(38) when
`c′` replaces `c`), `s = 1` for `r = 2` and `s = (trevinoTable1 e (r − 1)/c′)^{r(r−1)}` for
`r ≥ 3` (the least `s` with `c₁(r − 1) ≤ s^{1/(r(r−1))} c′`, display (36) with `c′`),
`g = AB/((A − 1)(B − 1))`, `h = (A + 1)(B + 1)/(AB)`,

    num = g (2r(2r − 1)D/(r − 1))^{1/(2r)} (s²/(D p^{(r−2)/(2(r−1))}) + 1/(4k log p) +
            1/(4r(r − 1)k log p) + log(1.85 s k log p/D)/(k log² p))^{1/(2r)},
    den = 1 − (2r²/(2r − 1)²) k^{1−1/r} h^{2−1/r} g.

Then `A ≥ 29`, `c′ < c`, `den > 0` and `num ≤ c · den`: the right side `num/den` of display (47)
(`r ≥ 3`, lines 905–941) is at most `c`, and at `r = 2`, where `s = D = 1` and
`p^{(r−2)/(2(r−1))} = 1`, the same expression is display (46) (lines 889–903), whose bracket is
`1 + 3/(8k log p) + log(1.85k log p)/(k log² p)` and whose prefactor is `12^{1/4}`.

**Checks.**

- Every row reproduces Table 1 at `p = p₀`: `num/den` is `2.738070` at `r = 2`, `p₀ = 10⁷`
  (tabulated `2.7381`), `2.019615` at `r = 3` with `s = (2.7381/2.019)^6 = 6.221` (tabulated
  `2.0197`) and `1.256098` at `r = 10`, `p₀ = 10²⁰` (tabulated `1.2562`). A prefactor `(1/2)^{1/4}`
  in place of `12^{1/4}` would give `1.237` at `r = 2`, `p₀ = 10⁷`, far below the table.

- Table 4 (lines 996–1007) lists the least `c₁` compatible with `A ≥ 29`: `2.68289` at `r = 2`,
  `p₀ = 10⁷`, below the tabulated `2.7381`.
- At `r = 2` the factor `((2r − 3)!!(r − 1))^{1/r}` is `1`, so `B = p^{1/4}` and
  `A = k c′₁² p^{1/8} log p`; at `p = 10⁷`, `k = 2/45`, `c′₁ = 2.738`:
  `A = 0.0444 · 7.497 · 7.50 · 16.12 = 40.3 ≥ 29`.
- The right sides of (46) and (47) decrease in `A` and `B`, so the values at the least admissible
  `A` and at the stated `B` bound every case of the induction.
- At `r = 2`, `p = p₀ = 10⁷` the right side of (46) is `2.73807 ≤ 2.7381`. For `r = 2` the
  quantifier over `p` reduces to `p = p₀`: the bracket `1 + 3/(8ku) + log(1.85ku)/(ku²)` of (46),
  `u = log p`, has derivative `(1 − 3u/8 − 2 log(1.85ku))/(ku³)`, which is negative for `u ≥ 16`
  and `k ≥ 1/30` (at `u = log 10⁷`, `k = 1/30` the numerator is `−5.03`), and `A`, `B` increase
  with `p`.

### 6.7 Treviño's Table 3

Define `trevinoTable7` `e r`, the pair `(k, c′₂)` of Treviño's Table 7 at `p₀ = 10^e` for
`e ∈ {10, 15, 20}` and `2 ≤ r ≤ 10` (lines 1311–1322), and `(0, 0)` elsewhere: for `p₀ = 10¹⁰`:
`(0.124, 3.65), (0.126, 2.58), (0.106, 2.19), (0.091, 1.98), (0.080, 1.85), (0.072, 1.75),
(0.064, 1.68), (0.058, 1.625), (0.054, 1.579)`; for `10¹⁵`: `(0.124, 3.58), (0.131, 2.51),
(0.116, 2.12), (0.101, 1.92), (0.090, 1.79), (0.079, 1.70), (0.071, 1.635), (0.065, 1.58),
(0.060, 1.54)`; for `10²⁰`: `(0.124, 3.57), (0.135, 2.49), (0.120, 2.10), (0.107, 1.90),
(0.095, 1.77), (0.084, 1.68), (0.077, 1.61), (0.070, 1.56), (0.064, 1.52)`.

`TrevinoTable3Certificate`: for each `e ∈ {10, 15, 20}`, each `2 ≤ r ≤ 10` and every real
`p ≥ 10^e`, put `c = trevinoTable3 e r`, `(k, c′) = trevinoTable7 e r`, `D`, `B`, `g`, `h` and
`den` as in 6.6, `A = k c′^r p^{1/4 − 1/(4r)} √(log p)/D` (the least `A` allowed by the range
(52)–(53)), `s = (trevinoTable3 e (r − 1)/c′)^{r(r−1)}` for `r ≥ 3`, and

    num = g (2r(2r − 1)D/(r − 1))^{1/(2r)} · b^{1/(2r)},
    b = 3/(8k)                                                          (r = 2),
    b = log(1.85 s k √(log p)/D)/(k log p) + 1/(4k) + 1/(4r(r − 1)k)    (r ≥ 3).

Then `A ≥ 31` (so `⌊A⌋ ≥ 30`, as Lemma 6 needs), `8k < D` (so `2AN < p`, line 1280), `c′ < c`,
`den > 0` and `num < c · den`: the right side of display (58) (`r = 2`) or (59) (`r ≥ 3`),
lines 1218–1265, is less than `c`.

**Checks.**

- Every row reproduces Table 3 at `p = p₀`: `num/den` is `3.652847` at `r = 2`, `p₀ = 10¹⁰`
  (tabulated `3.6529`), `1.579302` at `r = 10`, `p₀ = 10¹⁰`, and `1.521507` at `r = 10`,
  `p₀ = 10²⁰` (tabulated `1.5216`).
- The condition `8k < D` is tightest at `r = 2`, where `D = 1` and `8 · 0.124 = 0.992`.

- Table 6 (lines 1296–1307) lists the least `c₂` compatible with `⌊A⌋ ≥ 30`: `2.78392` at `r = 2`,
  `p₀ = 10¹⁰`, below the tabulated `3.6529`.
- Table 7 uses `k = 0.124` at `r = 2` for every `p₀`, inside the admissible interval
  `[3/64, ((2r − 3)!!(r − 1))^{1/r}/8)` of the source (line 1289).
- The certificate concerns the range `N ≤ 2p^{1/2+1/(4r)}`; Corollary 2's extension to all `N`
  for `r ≥ 3` uses Theorem 1 at `r = 2`, not this certificate.
- The value at `p = p₀` does not by itself bound larger `p`. At `r = 10`, `p₀ = 10¹⁰` (`k = 0.054`,
  `c′₂ = 1.579`, `s = (1.6283/1.579)^{90} = 15.91`) the bracket of (59) is
  `log(c√u)/(ku) + 1/(4k) + 1/(360k)` with `c = 1.85sk/(17!! · 9)^{1/10} = 0.2250` and `u = log p`;
  it increases while `c√u < √e`, and `c√(log 10¹⁰) = 1.080 < 1.649`, so it grows from `4.7426` at
  `p = 10¹⁰` to `4.8535` at `p = 10^{23.3}`. The whole right side of (59) still falls, from
  `1.57930` to `1.51537`, because `A/(A − 1) · B/(B − 1)` falls from `1.0485` to `1.0097`; that is a
  property of the row, not of the display, so the certificate is stated for every `p ≥ p₀`.

### Examples

`McGownTableCertificate` at `r = 2` is the pair `10.03655 < 10.0366`, `1093 ≥ 1056`;
`ButheSmallRangeVerified` at `Y = 100` is witnessed by `z = 7`.

### Dependencies

None: Layer 6 states numerical facts. Its consumers are §§3.5, 4.4, 4.5, 5.4 and 5.6.

## Downstream consumers

- **ExplicitNumberFields**: Burgess's moment bound with its shifted form and the `r = 2`
  refinements (§4.1), the Burgess inequalities of §§4.4–4.5, and the Pólya–Vinogradov
  inequalities of Layer 3 with the initial-sum form of §3.5, for least primitive roots and
  norm-Euclidean fields.
- **ExplicitCharacterSumsAndSieves, Part II**: Layers 0–6, for the results listed under Scope and
  ownership.
- Any roadmap later in the order of supply that needs an iterated van der Corput bound, an
  explicit count of integer points near a curve, an explicit character-sum bound or an explicit
  sieve upper bound: Layers 1–5.

## Worked examples

- *The `r = 2` moment for the quadratic character modulo `7`.* The values `χ(0), …, χ(6)` are
  `0, 1, 1, −1, 1, −1, −1`, so the windows `χ(x) + χ(x + 1)` are `1, 2, 0, 0, 0, −2, −1` and
  `W₂(2) = 1 + 16 + 16 + 1 = 34`; the five patterns of §4.1 contribute `2 · 6 = 12` (`aaaa`),
  `6 · 5 = 30` (`aabb`) and `8 · (−1) = −8` (`aaab`), total `34`.
- *A Lapkova constant.* For the odd quadratic character modulo `23`, the initial sum over
  `1 ≤ n ≤ 9` is `5` (the residues `1, 2, 3, 4, 6, 8, 9` against the non-residues `5, 7`), and
  `M_χ = 5`; the half sum over `1 ≤ n ≤ 11` is `3`, the class number of `ℚ(√−23)`. Lemma 3A gives
  `0.1592 · 4.796 · 3.135 + 0.8204 · 4.796 + 1.0285 = 7.356`.

## References

- **ariasdereyna2024** — J. Arias de Reyna, *Explicit van der Corput's d-th derivative estimate*,
  arXiv:2407.02094 (2024): Lemma 6, Theorems 7 and 11.
- **bachmanrachakonda2001** — G. Bachman, L. Rachakonda, *On a problem of Dobrowolski and Williams
  and the Pólya–Vinogradov inequality*, Ramanujan J. 5 (2001): Theorem 1.
- **booker2006** — A. R. Booker, *Quadratic class numbers and character sums*, Math. Comp. 75
  (2006), 1481–1492: displays (28)–(30), the quadratic case of Burgess's moment bound;
  Proposition 2 and Table 1.
- **bordelles2012** — O. Bordellès, *Arithmetic Tales*, Universitext, 2012: Lemma 5.7,
  Theorems 5.6, 5.8 and 5.12.
- **bordignon2022partial** — M. Bordignon, *Partial Gaussian sums and the Pólya–Vinogradov
  inequality for primitive characters*, Rev. Mat. Iberoam. 38 (2022), 1101–1127: Theorems 1.1,
  1.3, Tables 1–3.
- **bordignonjohnstonstarichkova2022** — M. Bordignon, D. R. Johnston, V. Starichkova, *An explicit
  version of Chen's theorem and the linear sieve*, arXiv:2207.09452: Theorem 6.
- **bordignonkerr2020** — M. Bordignon, B. Kerr, *An explicit Pólya–Vinogradov inequality via
  partial Gaussian sums*, arXiv:1909.01052: Theorems 2, 5, Corollary 1.
- **buthe2014** — J. Büthe, *A Brun–Titchmarsh inequality for weighted sums over prime numbers*,
  Acta Arith. 166 (2014), 289–299; arXiv:1410.7561: Lemmas 3.1, 4.4, 4.5, Propositions 3.2, 3.3,
  Definition 4.1, Theorems 4.2, 4.3.
- **fan2022** — K. Fan, *An inequality for the distribution of numbers free of small prime
  factors*, Integers 22 (2022), A26: the Theorem, (4)–(6), and the diagonal bound from `z = 3`.
- **filaseta1990** — M. Filaseta, *Short interval results for squarefree numbers*, J. Number Theory
  35 (1990), 128–149: the reduction to exponential sums.
- **francis2021** — F. J. Francis, *An investigation into several explicit versions of Burgess'
  bound*, arXiv:1910.13669: Theorem 1.8, Tables 3 and 6.
- **frolenkov2011** — D. A. Frolenkov, *Numerically explicit version of the Pólya–Vinogradov
  inequality*, arXiv:1107.0381: equation (1).
- **frolenkovsoundararajan2013** — D. A. Frolenkov, K. Soundararajan, *A generalization of the
  Pólya–Vinogradov inequality*, Ramanujan J. 31 (2013), 271–279: Theorems 1, 2, Corollary 1.
- **greaves2001** — G. Greaves, *Sieves in Number Theory*, Springer, 2001: Theorem 1, p. 52.
- **hunter2016** — K. Hunter, *The least square-free primitive root modulo a prime*,
  arXiv:1701.05980: Theorems 1.2, 1.3 (quotations of Frolenkov–Soundararajan).
- **huxleysargos1995** — M. N. Huxley, P. Sargos, *Points entiers au voisinage d'une courbe plane
  de classe C^n*, Acta Arith. 69 (1995), 359–366: Théorème 1.
- **jainsharmakhaleliu2021** — N. Jain-Sharma, T. Khale, M. Liu, *Explicit Burgess bound for
  composite moduli*, Int. J. Number Theory 17 (2021), 2207–2219; arXiv:2010.09530: Theorem 1.1,
  Corollary 1.2.
- **kerrmcgowntrudgian2020** — B. Kerr, K. McGown, T. Trudgian, *The least primitive root modulo
  p²*, arXiv:1908.11497: Lemmas 2 and 3.
- **lapkova2018** — K. Lapkova, *Correction to: Explicit upper bound for the average number of
  divisors of irreducible quadratic polynomials*, Monatsh. Math. 186 (2018), 675–678: Lemma 3A.
- **mcgown2012** — K. J. McGown, *Norm-Euclidean cyclic fields of prime degree*, Int. J. Number
  Theory 8 (2012), 227–254; arXiv:1011.4501 ("Norm-Euclidean Galois fields"): Theorems A.1, A.9,
  Lemmas A.5–A.8.
- **mcgowntrudgian2020** — K. J. McGown, T. Trudgian, *Explicit upper bounds on the least
  primitive root*, arXiv:1904.12373: Proposition 1 and Lemma 1.
- **montgomeryvaughan1973** — H. L. Montgomery, R. C. Vaughan, *The large sieve*, Mathematika 20
  (1973), 119–134: Theorem 2, Corollary 1, Lemmas 7 and 10, display (3.3).
- **montgomeryvaughan2007** — H. L. Montgomery, R. C. Vaughan, *Multiplicative Number Theory I*,
  Cambridge, 2007: §9.4.
- **platttrudgian2018** — D. Platt, T. Trudgian, *Improved bounds on Brun's constant*,
  arXiv:1803.01925: Theorem 2, display (11).
- **pomerance2011** — C. Pomerance, *Remarks on the Pólya–Vinogradov inequality*, Integers 11
  (2011), 531–542: Lemmas 2–4, Theorem 1.
- **ramareviswanadham2021** — O. Ramaré, G. K. Viswanadham, *Modular ternary additive problems
  with irregular or prime numbers*, Proc. Steklov Inst. Math. 314 (2021), 203–237: Lemmas 14, 15.
- **rieselvaughan1983** — H. Riesel, R. C. Vaughan, *On sums of primes*, Ark. Mat. 21 (1983),
  45–74: Lemma 4.
- **siebert1976** — H. Siebert, *Montgomery's weighted sieve for dimension two*, Monatsh. Math.
  82 (1976), 327–336.
- **tmeemt-art11**, **tmeemt-art14**, **tmeemt-art15** — A. de Camargo, O. Ramaré, D. Benielli
  (eds.), TME-EMT wiki pages on integer points near curves, sieve bounds and character sums.
- **trevino2015** — E. Treviño, *The Burgess inequality and the least k-th power non-residue*, Int.
  J. Number Theory 11 (2015), 1653–1678; arXiv:1412.3062v2: Theorem A, Theorems 1, 2, Corollaries
  1, 2, Theorem C, Lemmas 1–6, Tables 1–7.
- **trevino2015kth** — E. Treviño, *The least k-th power non-residue*, J. Number Theory 149
  (2015), 201–224: Theorem 1.2 and its combinatorial count.
- **vanlintrichert1965** — J. H. van Lint, H.-E. Richert, *On primes in arithmetic progressions*,
  Acta Arith. 11 (1965), 209–216: the coprime comparison and the choice of `z`.
- **yamada2023** — T. Yamada, *Explicit improvements of the Brun–Titchmarsh theorem for arbitrary
  intervals*, arXiv:2312.16090: Theorem 2.
- **zhao2024** — Z. Zhao, *Integral points close to smooth plane curves*, arXiv:2407.01778:
  Theorems 2.1, 2.5, Lemma 2.6, Theorem 2.7.
