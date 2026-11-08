# Roadmap: explicit bounds for the zeta function and Dirichlet L-functions

**Summary.** This roadmap is the numerically explicit layer of analytic number theory above the
[zeros of L-functions roadmap](../ZerosOfLFunctions/README.md), which proves every shape used here
with existential constants and leaves decimal constants out of its scope. On Mathlib's
`riemannZeta` and `DirichletCharacter.LFunction`, on the analytic records of the
[L-functions roadmap](../LFunctions/README.md), and on Mathlib's `Complex.Gamma`, it builds: the
explicit error calculus `f = g + O*(h)`; the bounded-height Riemann hypotheses `RH(H)` and
`GRH(q, H)` with their bridge to Platt's finite-conductor theorem; Stirling's series for `log Γ` with
Stieltjes' sector remainder, the two-sided modulus bound for `Γ` and the real-axis brackets of Alzer,
Ramanujan–Mortici, Nemes and Diamond–Straub; the explicit Phragmén–Lindelöf principle and
Rademacher's convexity bound on records of finite-order type; Backlund's strip bounds, the bounds
right of the line one and an explicit approximate functional equation; the van der Corput
derivative tests with explicit constants, the explicit Vinogradov mean value theorem with the
Richert-type bounds it gives, the Riemann–Siegel formula with Gabcke's remainder and the
critical-line and one-line bounds that follow from them; Backlund's argument lemma for records of
any degree and the explicit Riemann–von Mangoldt formulas for `ζ` and `L(s, χ)`; weighted zero sums;
smoothed Perron formulas, mean values of Dirichlet polynomials and of `ζ`, and the weighted and
maximal large sieves; upper and lower bounds for `|L(1, χ)|`; classical, Littlewood-type and
Vinogradov–Korobov zero-free regions with their decimal constants, real-zero bounds for quadratic
characters and the numerical instance of the Landau–Siegel exclusion; and explicit zero-density
estimates. The end theorems are statements with literal constants: for instance `ζ(σ + it) ≠ 0`
for `|t| ≥ 2`, `σ ≥ 1 − 1/(5.558691 log |t|)` given `RH(3·10¹²)`,
`|N(T) − (T/2π) log(T/2πe)| ≤ 0.10076 log T + 0.24460 log log T + 8.08344` for
`T ≥ 30 610 046 000`, and for `T ≥ e` given the recorded bound for `S(T)` below that height, and
`|ζ(1/2 + it)| ≤ 0.618 t^{1/6} log t` for `t ≥ 3`.

Suggested home: `TauCeti/NumberTheory/ExplicitBounds/`, divided into `BigOStar/`, `VerifiedZeros/`,
`Gamma/`, `Convexity/`, `ExponentialSums/`, `ZeroCounting/`, `MeanValues/`, `LOne/`, `ZeroFree/` and
`ZeroDensity/`.
[`Suggested.lean`](Suggested.lean) states the headline theorems against the pinned libraries; it is
not the roadmap.

## Scope and ownership

### Owned here

- the explicit error predicate `f = g + O*(h)` and its calculus (Layer 0);
- the bounded-height Props `RH(H)` and `GRH(q, H)`, their monotonicity, their limits `RiemannHypothesis`
  and `DirichletGRH`, their agreement with *AllOnCriticalLine*, the bridge from Platt's
  finite-conductor theorem, the recorded verifications of `RH(H)` used as hypotheses, and the class
  of admissible cosine polynomials with the convention for named numerical certificates (Layer 0);
- Stirling's series for `log Γ` with every explicit remainder bound in a sector, in the right
  half-plane and on the positive axis, the Stirling coefficients of `Γ` and Nemes' bound, Binet's
  second formula and the two-sided modulus bound for `Γ`, and the real-axis inequalities for `log Γ`,
  `ψ` and the polygamma functions (Layers 1–2);
- the explicit Phragmén–Lindelöf principle with products of interpolating factors, the
  gamma-quotient bounds on vertical lines, Rademacher's convexity bound on records of finite-order
  type and its instances for `ζ` and primitive Dirichlet characters, Backlund's strip bounds, the
  bounds right of the line one and the Poisson–Jensen inequality on a strip (Layer 3);
- the explicit van der Corput toolkit — Kusmin–Landau in its symmetric and asymmetric forms, the
  finite van der Corput inequality for complex coefficients and its exponential-sum form (the
  A-process), the second-derivative tests, Patel's corrected third, fourth and fifth derivative
  tests, the `k`-th derivative test with recursive constants, truncated Poisson summation,
  stationary phase and the B-process, and an explicit approximate functional equation — together
  with the Riemann–Siegel formula with Gabcke's remainder and
  the explicit bounds for `|ζ(1/2 + it)|`, `|ζ(1 + it)|`, `|ζ|` on the lines `σ_k = 1 − k/(2^k − 2)`
  and `|L(1/2 + it, χ)|` that they give; the explicit Vinogradov mean value theorem for complete and
  incomplete systems, the bound for the short sums `Σ (n + u)^{−it}` that it gives, and the
  Richert-type bounds for `ζ` and the Hurwitz zeta function (Layer 4);
- Backlund's argument lemma for analytic records of any degree, the explicit Riemann–von Mangoldt
  formulas for `ζ` and primitive Dirichlet L-functions, Lehman's weighted zero sum and its
  derivative form, and the value of `Σ_{γ>0} γ⁻²` (Layer 5);
- the smoothed truncated Perron formulas and Landau's iterated Perron identity, the majorant
  principle, the explicit mean values of
  Dirichlet polynomials and of `ζ` on vertical lines, the weighted large sieve with the
  Montgomery–Vaughan and Preissmann constants and Elliott's maximal large sieve (Layer 6);
- the criteria behind the classical, Littlewood-type and Vinogradov–Korobov zero-free regions, the
  regions with decimal constants for `ζ` and `L(s, χ)`, the real-zero bounds for quadratic
  characters, the real-zero gap `(1 − β) log q ≥ c` for conductors up to a cap `Q` with its
  instances up to `10¹⁰` and, numerically, without a cap, and the explicit bounds for `1/ζ(σ + it)`
  on the line one, on `σ ≥ 1`, in the classical region and on `σ ≥ 3/4` below a verified height
  (Layer 7);
- the explicit zero-density estimates for `ζ` and for Dirichlet L-functions, including the log-free
  densities (Layer 8);
- upper bounds for `|L(1, χ)|` for every primitive character and their refinements under
  conditions on `χ(2)` and `χ(3)`, and lower bounds for non-quadratic characters and for quadratic
  characters of conductor at most `10¹⁰` (Layer 9).

The van der Corput toolkit and the explicit Vinogradov mean value theorem of Layer 4 are general
mathematics about exponential sums; they are stated here because the routes of 4.5a–4.10 use them,
every other consumer of them comes later in the merge order than this roadmap, and neither
Mathlib, Tau Ceti nor a roadmap on main or earlier in the merge order states Vinogradov's mean
value theorem in any form (`ExplicitCharacterSumsAndSieves` places it outside its scope). The
toolkit of 4.1–4.5 has one owner, this roadmap, and its later consumers cite it rather than restate
it: `ExplicitCharacterSumsAndSieves` consumes the finite van der Corput inequality and its
normalized form (4.2), and owns two variants built on them, Arias de Reyna's real-part form of the
normalized inequality (its §0.3, which keeps the real part of the weighted lag sum) and his
iterated inequality (its §1.1, which assumes no derivative bound); no route here uses either.
`ExplicitMultiplicativeFunctions` takes the Kusmin–Landau inequality (4.1) for the route of its
Dirichlet divisor remainder (its §7.4); the second-derivative test in Bordellès and Daval's form
that the same route uses differs from those of 4.3 and is that roadmap's.

### Consumed, not redefined

- analytic records, continuation, functional equation, the average coefficient growth predicate,
  `riemannZetaData`, `dirichletData`, `dedekindZetaData` and the Dirichlet factorizations: the
  [L-functions roadmap](../LFunctions/README.md), Layers 0, 3 and 4;
- the entire completion, *IsFiniteOrder*, the sector branch of `log Γ`, *continuedL*, the analytic
  conductor, the pole-cleared continued L-function, `zeroCount` with `N(T)` and `N±(T)`, Jensen's
  bound, Hadamard's factorization and its L-function corollaries, the exceptional-zero predicate,
  the argument principle on a rectangle with *S* `(T)`, *HasZerosInRects* and *AllOnCriticalLine*:
  the [zeros of L-functions roadmap](../ZerosOfLFunctions/README.md), Layers 0–7 and 9;
- the truncated Perron formula with the Davenport-type error, as Tau Ceti realizes
  [Arithmetic Dirichlet Series](../../Completed/ArithmeticDirichletSeries/README.md) §§6.3–6.4;
- the slit-plane branch of `log Γ` with its Stieltjes remainder and derivative bounds (§0.23a), the
  Dirichlet-polynomial mean square with error `6π Σ n|a_n|²` (§1.5), the weighted Hilbert
  inequality with constant `3π/2` (§1.5a), `DirichletGRH` and `GRH` (§1.6) and the effective
  Landau–Siegel exclusion (§0.34): `AnalyticNumberTheoryPartI`;
- the Euler–Maclaurin formula with periodic Bernoulli remainder: `AsymptoticExpansions` §13.1;
- Platt's finite-conductor zero theorem (§4.22) and the absence of real zeros for conductor at most
  `400 000` (§4.24): `ComputationalNumberTheory`;
- the sharp additive and primitive-character large sieves and the separated Hilbert inequality:
  `SieveMethodsAndPrimePatterns` §2.9;
- the Kronecker description of real primitive characters: `AnalyticNumberTheoryPartI` §0.34a.

### Not owned here

- the existential shapes of convexity, zero counting, zero-free regions and the explicit formula
  (`ZerosOfLFunctions`), the effective but non-numerical Landau–Siegel exclusion and lower bound
  `L(1, χ) ≥ c/log q` (`AnalyticNumberTheoryPartI` §§0.34 and 0.9), and the log-free density for
  the family of primitive characters with an unspecified constant `C_ε`
  (`AnalyticNumberTheoryPartI` §1.7, of which 8.4 is an explicit form): only decimal
  constants and the explicit arguments producing them live here;
- the sharp unweighted large sieves and the separated Hilbert inequality with constant `π/δ`
  (`SieveMethodsAndPrimePatterns` §2.9);
- explicit constants for Dedekind zeta functions with `K ≠ ℚ`, Hecke L-functions and number-field
  invariants (`ExplicitNumberFields`), which specializes the general convexity bound of Layer 3 and
  the general argument lemma of Layer 5; explicit bounds for `ψ`, `θ`, `π` and primes in
  progressions (`ExplicitPrimeCounting`); explicit Pólya–Vinogradov, Burgess and Brun–Titchmarsh
  inequalities (`ExplicitCharacterSumsAndSieves`); explicit means of multiplicative functions
  (`ExplicitMultiplicativeFunctions`);
- the theory of exponent pairs beyond the explicit A- and B-processes of Layer 4 (Huxley's discrete
  Hardy–Littlewood method and decoupling bounds): no statement here uses it;
- every algorithm, interval-arithmetic procedure and table: the README states what a recorded
  verification or a certificate asserts (Conventions), never how it is computed;
- the Barnes `G` remainder (`AnalyticNumberTheoryPartII` §4.3a);
- the asymptotic second moment
  `∫₀^T |ζ(1/2 + it)|² dt = T log(T/2π) + (2γ − 1)T + O(√T log T)` and its explicit error under a
  finite input (`AnalyticNumberTheoryPartI` §3.23): 6.6 states one-sided bounds with explicit
  constants from `T ≥ 4` and does not restate the asymptotic;
- the upper bounds for `L(1, χ)` at quadratic characters of large conductor that rest on explicit
  Pólya–Vinogradov inequalities (`johnstonramaretrudgian2023`, Theorems 1 and 2), which belong to a
  Part II of this roadmap placed after `ExplicitCharacterSumsAndSieves`; the explicit counts of zeros
  of Dedekind zeta functions (`kadiring2012`), which are `ExplicitNumberFields`'.
- the bound of at most four zeros of `∏_{χ mod q} L(s, χ)` with `|Im s| ≤ x/q` and
  `σ ≥ 1 − 1/(3.82 log x)` for `x ≥ 8·10⁹` that `ExplicitPrimeCounting` uses (Liu and Wang, as
  Kadiri's paper on short intervals quotes it): the quotation does not say how the principal
  factor, which carries the zeros of `ζ`, enters it, and Liu and Wang's paper is not among the
  sources here, so `ExplicitPrimeCounting` states the bound from that paper with the theorem that
  needs it. Ramaré and Rumely's region for the zeros of `L(s, χ)` with `|γ| ≥ 1000`, with the
  constant `C₁(k, H)`, is not of this kind: it is owned here (7.5, fifth item), and
  `ExplicitPrimeCounting` takes it from there;
- Ramaré's explicit density theorem (`ramare2016density` Theorem 1.1, lines 83–97): its averaged
  bound for `T ≥ 2000`, `T ≥ Q ≥ 10` and `σ ≥ 0.52`,
  `Σ_{q≤Q} (q/φ(q)) Σ_{χ mod* q} N(σ, T, χ) ≤ 20 (56 Q⁵ T³)^{1−σ} log^{5−2σ}(Q²T) + 32 Q² log²(Q²T)`
  (the inner sum over the primitive characters modulo `q`, `N(σ, T, χ)` the number of zeros with
  `β ≥ σ` and `|γ| ≤ T`), its bound for the zeros of `ζ` alone, and the revised form of the latter
  that `kadirilumleyng2018` quotes. Kadiri, Lumley and Ng record a mistake in the paper without
  locating it (lines 93–95, a footnote to their quotation, lines 63–66); the revision of the bound
  for `ζ`, with leading constant `965` against the printed `9.8/2 = 4.9` for the zeros with
  `γ > 0`, rests on a proof the author communicated to them and did not publish; and the bound for
  `ζ` is the case `Q = 1` of the argument that gives the averaged bound (`ramare2016density`
  lines 98–104 and 208–213). So no constant of that theorem is asserted here; the explicit
  densities here are 8.1, 8.3 and 8.5 for `ζ` and 8.4 for the family of primitive characters;
- Johnston and Yang's recomputed constants for the Kadiri–Lumley–Ng density, which change an input
  of Kadiri, Lumley and Ng's argument (a divisor-sum bound that no route here uses) and which
  `ExplicitPrimeCounting` states with the theorem that uses them; 8.3 states the Kadiri–Lumley–Ng
  theorem with its closed-form constants;
- the first branch `|N(T) − M(T)| ≤ 0.28 log T` for `T ≥ 2π` (with `M(T)` including `7/8`) of the
  form that `ExplicitPrimeCounting` quotes from Lee and Nosal, whose source is not among those
  here. From `T = 8008.3` on it follows from statements here: up to `30 610 046 000` from the
  recorded bound for `S(T)` (0.4) with the expansion of `ϑ` in 2.9, which give
  `|N(T) − M(T)| ≤ 2.5167 + 1/(40T)`, at most `0.28 log T` once `log T ≥ 8.98823`; and from
  `T = e^{20.455} = 7.65·10⁸` on from Rosser's bound (5.2): with `L = log T`,
  `0.137 L + 0.443 log L + 1.588 ≤ 0.28 L` exactly when `0.143 L − 0.443 log L ≥ 1.588`, whose
  left side increases for `L > 3.1` and reaches `1.588` at `L = 20.455` (at `T = 30 610 046 000`
  Rosser's bound is `6.306`, against `0.28 log T = 6.760`). On `[2π, 8008]` it is sharper than the
  recorded bound and rests on a computation with the zeros there, which `ExplicitPrimeCounting`
  carries as a hypothesis of the theorems that use it. Its second branch
  `0.1038 log T + 0.2573 log log T + 9.3675` holds as a consequence of 5.2 and is stated there. And
  Trudgian's bound in the normalization with `7/8`, which `bellottiwong2025` lines 61 and 83–84
  re-establish only in the normalization without `7/8` (5.2);
- the nonnegative trigonometric polynomials for Dedekind zeta functions that `ExplicitNumberFields`
  uses (Kadiri's for Dedekind zeta functions and those of Das, Gaba, Lee, Savalia and Wong, whose
  coefficients are optimised together with the other parameters of the region they serve): each is
  a polynomial certificate (the Prop of 0.5 at literal coefficients) of one of its theorems, and by
  the Conventions it is named with that theorem. The certificates of the regions here, Kadiri's
  polynomial `(0.91 + cos φ)²(0.265 + cos φ)²` and Mossinghoff and Trudgian's `F₁₆`, are named in
  7.3, where a consumer that uses the same polynomial cites them.

## Conventions

- **Explicit errors.** `a = b + O*(e)` means `‖a − b‖ ≤ e` (Layer 0). It is a statement, never an
  existential: the error `e` is a displayed real expression, and every theorem below states its
  error in this form or as a two-sided inequality.
- **Zeros.** "`ρ` is a zero of `ζ`" means `riemannZeta ρ = 0` with `0 < Re ρ < 1` (a nontrivial
  zero); `ρ = β + iγ`. For `L(s, χ)` the same with `DirichletCharacter.LFunction χ`. Counts with
  multiplicity are `zeroCount` of the completed function (`ZerosOfLFunctions` Layer 4):
  `N(T) = zeroCount completedRiemannZeta univ (Icc 0 1 ×ℂ Ioc 0 T)`, zeros with `0 < γ ≤ T`; and
  `N(T, χ) = zeroCount (DirichletCharacter.completedLFunction χ) univ (Icc 0 1 ×ℂ Icc (−T) T)`, zeros
  with `|γ| ≤ T`. Each counting theorem names its rectangle; `N(σ, T)` counts zeros of `ζ` with
  `β ≥ σ` and `0 < γ ≤ T`, and `N°(σ, T)` those with `σ < β < 1` and `0 < γ < T` (Layer 8).
  [`Suggested.lean`](Suggested.lean) writes the counts of its headline theorems with Mathlib's
  `meromorphicOrderAt` (the multiplicity of a zero of `riemannZeta` or of
  `DirichletCharacter.LFunction χ`): `zetaZeroCount` is `N(T)`, `zetaZeroCountRight` is `N(σ, T)`,
  `zetaZeroDensityCount` is `N°(σ, T)`, `dirichletZeroCount` is `N(T, χ)`, and
  `primitiveLZeroCount Q S` counts the zeros in `S` of the product of 8.4. They agree with the
  `zeroCount` forms because the completed function has the same zeros in the closed strip as `ζ`
  or `L(s, χ)` in the open strip (0.2).
- **Characters.** `χ` is a primitive Dirichlet character of conductor `q`, that is an element of
  `DirichletCharacter ℂ q` with `DirichletCharacter.IsPrimitive`; `a = 0` if `χ` is even and
  `a = 1` if `χ` is odd (`DirichletCharacter.Even`, `DirichletCharacter.Odd`). Mathlib's
  `DirichletCharacter.completedLFunction χ s` is `Gammaℝ(s + a) L(s, χ)` off the poles of the gamma
  factor, without the conductor power; the functional equation is
  `DirichletCharacter.IsPrimitive.completedLFunction_one_sub`. "Quadratic" is `MulChar.IsQuadratic`
  with `χ ≠ 1`.
- **Logarithms and branches.** `log` on positive reals is `Real.log`; `Log` on the slit plane is the
  principal `Complex.log`; `log Γ` on the slit plane is the branch of `AnalyticNumberTheoryPartI`
  §0.23a, real on `(0, ∞)`, which agrees with the sector branch of `ZerosOfLFunctions` 1.1 on its
  domain. `θ = arg s ∈ (−π, π]`.
- **Bernoulli numbers.** `B_n = bernoulli n` (Mathlib, `B₁ = −1/2`), `B_n(x)` is
  `Polynomial.bernoulli n` and the periodic Bernoulli function is `bernoulliFun n` applied to the
  fractional part. `T_j(z) = B_{2j}/(2j(2j − 1) z^{2j−1})` is the `j`-th Stirling term, and
  `r_n(z)` is the remainder of Stirling's series after `n − 1` terms (Olver's convention): `r₁ = ξ`.
- **Exponential sums.** `e(x) = exp(2πix)`; `‖x‖` is the distance from `x` to the nearest integer;
  `S_f(a, N) = |Σ_{a < n ≤ a+N} e(f(n))|` for integers `a` and `N ≥ 1` and a real phase `f` (Layer 4).
- **Heights.** `t ≥ t₀` thresholds are part of every statement; a bound stated for `t ≥ 3` is not
  asserted for `t < 3`. `log log t` appears only where `t ≥ e`.
- **Recorded verifications and certificates.** Where a source closes its argument by a computation,
  the README names that computation next to the theorem, with the source's equation, table or
  section numbers, and says what it asserts. A *recorded verification* is one of the bounded-height
  propositions about the zeros of `ζ` listed in 0.4 (`RH(H₀)` at a literal height, the absence of
  zeros up to height `14`, and the bound for `S(T)` up to `30 610 046 000`, which rests on the
  location of every zero of `ζ` below that height); it is a hypothesis of every theorem that uses
  it, also when the source uses it on part of its range only. Every other computation is a
  *certificate*: a *polynomial certificate*, the admissibility (0.5) of one cosine polynomial whose
  coefficients are literal rationals, or a *numerical certificate*, a finite list of inequalities
  at literal parameter values, between explicit closed-form real expressions or between values of
  `ζ`, `L(s, χ)` or `S(T)` on a bounded range of heights or conductors (the range `[2π, 168π]` of
  5.4, for instance), other than the propositions of 0.4. A certificate is a closed proposition.
  The general statements (the recursion of 4.4, Kadiri's criterion in 7.3) take the corresponding
  condition at free parameters as a hypothesis; an instance with literal constants is stated as its
  source states it, with the recorded verifications it uses as hypotheses, and its route names the
  certificate that discharges the criterion's condition. The README never reproduces a certificate
  or a procedure that checks one.
- **Uniformity.** A constant that is displayed is absolute. Quantifier order follows the source:
  "for `q ≥ 3` and `t ∈ ℝ`" means the displayed constant serves every such pair.

## Exact supplier contracts

### From Mathlib

- `riemannZeta`, `riemannZeta_zero`, `riemannZeta_one_sub`, `riemannZeta_ne_zero_of_one_lt_re`,
  `riemannZeta_ne_zero_of_one_le_re`, `riemannZeta_neg_two_mul_nat_add_one`, `completedRiemannZeta`,
  `completedRiemannZeta₀`, `RiemannHypothesis` (`∀ s, ζ(s) = 0 → s not a trivial zero → s ≠ 1 →
  Re s = 1/2`, `Mathlib/NumberTheory/LSeries/RiemannZeta.lean`);
- `DirichletCharacter.LFunction`, `DirichletCharacter.LFunction_eq_LSeries` (for `1 < Re s`),
  `DirichletCharacter.completedLFunction`, `DirichletCharacter.gammaFactor`,
  `DirichletCharacter.LFunction_eq_completed_div_gammaFactor`,
  `DirichletCharacter.IsPrimitive.completedLFunction_one_sub` (primitive characters),
  `DirichletCharacter.rootNumber`, `DirichletCharacter.changeLevel`,
  `DirichletCharacter.LFunction_changeLevel` (the Euler factors at the primes dividing the new level,
  for `χ ≠ 1` or `s ≠ 1`), `DirichletCharacter.primitiveCharacter`,
  `DirichletCharacter.changeLevel_primitiveCharacter`, `DirichletCharacter.LFunction_ne_zero_of_one_le_re`,
  `DirichletCharacter.LFunction_apply_one_ne_zero`, `DirichletCharacter.LFunction_modOne_eq`,
  `DirichletCharacter.completedLFunction_modOne_eq`, `DirichletCharacter.isPrimitive_one_level_one`,
  `DirichletCharacter.IsPrimitive` (`conductor χ = q`), `DirichletCharacter.conductor`,
  `DirichletCharacter.Even`, `DirichletCharacter.Odd`, `MulChar.IsQuadratic`, `gaussSum`;
- `Complex.Gamma`, `Real.Gamma`, `Complex.Gamma_conj`, `Complex.Gammaℝ`, `Complex.Gammaℂ`,
  `Complex.digamma`, `Complex.digamma_one`, `Complex.digamma_apply_add_one`,
  `Real.eulerMascheroniConstant`, `Stirling.le_factorial_stirling`;
- `bernoulli`, `Polynomial.bernoulli`, `bernoulliFun`, `hasSum_zeta_two`, `PowerSeries.exp`;
- `Complex.HadamardThreeLines.norm_le_interpStrip_of_mem_verticalClosedStrip` and
  `Complex.HadamardThreeLines.norm_le_interp_of_mem_verticalClosedStrip₀₁'` (the three-lines
  theorem for a function bounded and holomorphic on a closed strip),
  `PhragmenLindelof.vertical_strip`;
- `Real.fourierChar`, `UnitAddCircle`, `LSeries`, `LSeriesSummable`, `ArithmeticFunction.vonMangoldt`,
  `ArithmeticFunction.sigma`, `Nat.totient`, `MeromorphicOn.divisor`, `meromorphicOrderAt`,
  `HurwitzZeta.hurwitzZeta` (`ζ(s, u)` at the class of `u` in `UnitAddCircle`), `Fourier.fourierIntegral`.

### From Tau Ceti

- `TauCeti.trigonometricCombination` and `TauCeti.IsNonnegativeTrigonometricCombination`
  (`TauCeti/Analysis/SpecialFunctions/Trigonometric/NonnegCombination.lean`): the real part of a
  finite weighted sum of powers of a phase, and its nonnegativity on the unit circle;
  `TauCeti.trigonometricCombination_nonneg_of_boundary` and `TauCeti.sum_re_neg_log_one_sub_nonneg`;
  `TauCeti.LSeries.isNonnegativeTrigonometricCombination_threeFourOne`
  (`TauCeti/NumberTheory/LSeries/ThreeFourOne.lean`).
- `TauCeti.truncatedPerronKernel`, `TauCeti.truncatedPerronKernel_one`,
  `TauCeti.truncatedPerron_LSeries` and `TauCeti.norm_truncatedPerron_LSeries_sub_sum_le`
  (`TauCeti/NumberTheory/ArithmeticDirichletSeries/Perron/`): for `x > 0`, `c > 0`, `T > 0`, `x` off
  the support's integers and absolute convergence on `Re s = c`, the truncated integral differs from
  `Σ_{n < x} f(n)` by at most `Σ ‖f(n)‖ (x/n)^c/(πT|log(x/n)|)`.

### From TauCetiRoadmap.LFunctions

- Layer 0: `AnalyticLFunctionData` with `coeff`, `conductor`, `gammaR`, `gammaC`, `rootNumber`,
  `completed`, `polarOrder`; `AnalyticLFunctionData.degree`, `AnalyticLFunctionData.gammaFactor`,
  `AnalyticLFunctionData.dual`; the predicates `HasDirichletAgreement`, `HasMeromorphicContinuation`,
  `HasFunctionalEquation` and the average coefficient growth predicate; `riemannZetaData`.
- Layer 3: `dedekindZetaData` (named only where a Dedekind instance is a Check).
- Layer 4: `dirichletData`, with conductor `q`, real gamma shift `a` and Mathlib's completed function.

### From TauCetiRoadmap.ZerosOfLFunctions

- Layer 0: *entireCompletion*, `zetaEntireCompletion`, *IsFiniteOrder*.
- Layer 1: 1.1 (*logGamma* on `S_δ`), 1.4 (`logDeriv Gammaℝ s = ψ(s/2)/2 − (log π)/2`), 1.6
  (*continuedL* with `continuedL riemannZetaData = riemannZeta`).
- Layer 3: 3.4 (*poleClearedContinuedL*).
- Layer 4: `zeroCount`, *divisorCount*, 4.3 (Jensen's bound), 4.5 (`N(T)`, `N±(T)`, monotonicity and
  right-continuity).
- Layer 5: 5.5 (Hadamard's factorization at order at most one) and 5.6 (the positivity of
  `Σ_ρ Re 1/(s − ρ)` and `Re b = −Σ_ρ Re(1/ρ)` for real records).
- Layer 6: 6.3 (*IsExceptionalZero*), 6.4d (the partial-fraction bound for `−Re L'/L`), 6.5 (no
  zeros on `Re s = 0, 1`).
- Layer 7: 7.1 (*rectBoundary*), 7.2 (argument principle on a rectangle), 7.3 (*S* `(T)` and the
  argument variation), 7.4 (the route of Riemann–von Mangoldt for `ζ`).
- Layer 9: *HasZerosInRects*, *AllOnCriticalLine*, and the identification of its global form with
  `RiemannHypothesis`.

### From TauCetiRoadmap.ArithmeticDirichletSeries

- §§6.3–6.4 as realized in Tau Ceti (above): the truncated Perron formula with finite-height
  endpoint value `π⁻¹ arctan(T/c)` (`TauCeti.truncatedPerronKernel_one`).

### From TauCetiRoadmap.AnalyticNumberTheoryPartI

- §0.23a: the slit-plane `log Γ` (`gammaRemainder.slit_logGamma`), normalized by `log Γ(1) = 0`, with
  `R(z) = log Γ(z) − (z − 1/2) Log z + z − log(2π)/2 = ∫₀^∞ Q(t)(z + t)⁻² dt`,
  `Q(t) = ({t} − {t}²)/2`, and `|R^{(j)}(z)| ≤ j! sec^{j+2}(arg z/2)/(8|z|^{j+1})`.
- §1.5: for `N ≥ 0`, `T ≥ 0` and complex `a₁, …, a_N`,
  `|∫_{−T}^{T} |Σ a_n n^{−it}|² dt − 2T Σ |a_n|²| ≤ 6π Σ n|a_n|²`.
- §1.5a: for distinct real `λ_r` with local spacings `δ_r = min_{s≠r} |λ_r − λ_s|` and complex `u_r`,
  `|Σ_{r≠s} u_r ū_s/(λ_r − λ_s)| ≤ (3π/2) Σ |u_r|²/δ_r`.
- §1.6: `DirichletGRH χ` (every `s` with `Re s > 0`, `χ ≠ 1 ∨ s ≠ 1` and `L(s, χ) = 0` has
  `Re s = 1/2`) and `GRH`.
- §0.34 and §0.34a: `landau_siegel_exclusion`, an absolute effective `c_LS > 0` with
  `(1 − β) log q ≥ c_LS` for every real zero of every primitive real nonprincipal `L(s, χ)`, `q ≥ 3`;
  and the identification of such `χ` with a Kronecker character of fundamental discriminant
  `χ(−1) q`.

### From TauCetiRoadmap.AsymptoticExpansions

- §13.1: `sum_Icc_eq_eulerMaclaurin`, the Euler–Maclaurin formula for `f ∈ C^{2m}[a, n]`, integers
  `a < n`, `m ≥ 1`, with remainder `∫_a^n (B_{2m} − B̃_{2m}(x)) f^{(2m)}(x) dx/(2m)!`.

### From TauCetiRoadmap.ComputationalNumberTheory

- §4.22: `platt_bounded_height`: for primitive `χ` of modulus `2 ≤ q ≤ 400 000`, every zero of
  `L(s, χ)` with `0 < Re s < 1` and `|Im s| ≤ H(q)` has `Re s = 1/2`, where
  `H(q) = max(10⁸/q, 7.5·10⁷/q + 200)` for even `q` and `max(10⁸/q, 3.75·10⁷/q + 200)` for odd `q`.
  Only moduli `q ≥ 2` are consumed, and the supplier's range is required to start there: the
  modulus `1`, whose primitive character has L-function `riemannZeta`
  (`DirichletCharacter.isPrimitive_one_level_one`, `DirichletCharacter.LFunction_modOne_eq`), is not
  part of Platt's computation (0.3), and with it the statement would assert `RH(10⁸)`.
- §4.24: for primitive `χ` of modulus `2 ≤ q ≤ 400 000` and real `0 < s < 1`, `L(s, χ) ≠ 0`.

### From TauCetiRoadmap.SieveMethodsAndPrimePatterns

- §2.9: `SieveTaper.sharp_additive_largeSieve` (constant `N − 1 + δ⁻¹` for `δ`-separated
  frequencies, `0 < δ ≤ 1/2`, `N ≥ 1`), `SieveApplications.sharp_primitive_largeSieve` (constant
  `H − 1 + Q²`), and the separated Hilbert inequality with constant `π/δ`.

## How to read the build

Layer 0 fixes the language: the explicit error predicate, the bounded-height Riemann hypotheses with
the bridge from Platt's theorem and the recorded verifications, with the Riemann–Siegel theta
function as the integral that the recorded bound for `S(T)` uses, and admissible cosine polynomials.
Layers 1 and 2 are the Gamma function with explicit constants, on the positive axis and in the
complex plane, ending with the Stirling form of the theta function (2.9); everything later that
touches a gamma factor uses them. Layer 3 turns the Gamma bounds into pointwise bounds for `ζ` and
`L(s, χ)` by the explicit Phragmén–Lindelöf principle. Layer 4 is the explicit theory of exponential
sums, by van der Corput's and by Vinogradov's methods, and the subconvex, one-line and Richert-type
bounds it gives. Layer 5 counts zeros with explicit errors, from Layers 3 and 4 and the argument
principle of `ZerosOfLFunctions` Layer 7. Layer 6 is Perron's formula, mean values and large sieves.
Layer 7 proves the zero-free regions, from the partial-fraction identities, the Gamma bounds, the
zero counts and the pointwise bounds, bounds real zeros of quadratic L-functions and bounds `1/ζ`
near the line one. Layer 8 proves zero-density estimates from the mean values, the pointwise bounds
and the zero-free regions. Layer 9 bounds `L(1, χ)`, above from Ramaré's approximate formula and
below by Louboutin's method for non-quadratic characters and from the real-zero bounds of 7.8 for
quadratic ones. Layer 6 depends only on Layers 0–3, except the mean squares of `ζ` (6.6), which use
the approximate functional equation 4.5a; the rest of Layer 6 can be built in parallel with Layers 4
and 5.

## Layer 0: explicit errors, verified zeros and cosine polynomials

### 0.1 The explicit error predicate

Define *BigOStar* `a b e`, written `a = b + O*(e)`, for `a b` in a normed additive group `E` and
`e : ℝ`, as `‖a − b‖ ≤ e`; and for functions `f g : α → E`, `h : α → ℝ` and a set `S ⊆ α`, the
statement "`f = g + O*(h)` on `S`" as `∀ x ∈ S, f x = g x + O*(h x)` (Ramaré, *Excursions* §1, which
introduced the notation; `ramare2022excursions`).

- If `a = b + O*(e)` then `0 ≤ e`; and `a = a + O*(e)` holds if and only if `0 ≤ e`.
- Symmetry: `a = b + O*(e)` if and only if `b = a + O*(e)`.
- Transitivity: from `a = b + O*(e₁)` and `b = c + O*(e₂)` follows `a = c + O*(e₁ + e₂)`.
- Monotonicity: from `a = b + O*(e)` and `e ≤ e'` follows `a = b + O*(e')`.
- Additivity: from `a₁ = b₁ + O*(e₁)` and `a₂ = b₂ + O*(e₂)` follows
  `a₁ + a₂ = b₁ + b₂ + O*(e₁ + e₂)`, and for a finite family the errors add.
- Scaling: in a normed space over `𝕜`, from `a = b + O*(e)` follows `c • a = c • b + O*(‖c‖ e)`.
- Norms: from `a = b + O*(e)` follows `‖a‖ ≤ ‖b‖ + e` and `‖b‖ − e ≤ ‖a‖`.
- On `ℝ`: `a = b + O*(e)` if and only if `b − e ≤ a ≤ b + e`.
- Integrals: if `f = g + O*(h)` on a measurable set `S` of finite measure, with `f, g, h`
  integrable on `S`, then `∫_S f = ∫_S g + O*(∫_S h)`.

*Needs:* Mathlib `norm_sub_rev`, `norm_sub_le`, `norm_smul`, `abs_sub_le_iff`,
`MeasureTheory.norm_integral_le_integral_norm`.

**Checks.**

- `π = 3 + O*(0.1416)` holds (`π − 3 = 0.14159…`) and `π = 3 + O*(0.1415)` fails: the predicate is a
  two-sided bound on the absolute difference with the displayed constant.
- `π = 4 + O*(0)` fails although `π ≤ 4 + 0`: a one-sided reading `a ≤ b + e` would accept it.
- `1 = 1 + O*(−1)` fails: a negative error is never admissible, which a definition through
  `|a − b| ≤ |e|` would get wrong.
- `i = 0 + O*(1)` holds in `ℂ` with equality `‖i‖ = 1`, while `1 = 0 + O*(1)` shows that the
  predicate is an absolute, not a relative, error: the relative reading `‖a − b‖ ≤ e‖b‖` would
  require `1 ≤ 0`.

### 0.2 Bounded-height Riemann hypotheses

Define `RiemannHypothesisUpTo` `H`, written `RH(H)`, for `H : ℝ`, as: every `ρ` with `0 < Re ρ < 1`,
`|Im ρ| ≤ H` and `riemannZeta ρ = 0` has `Re ρ = 1/2`. Define *DirichletGRHUpTo* `q H`, written
`GRH(q, H)`, for `q ≥ 1` and `H : ℝ`, as: for every primitive `χ : DirichletCharacter ℂ q`, every
`ρ` with `0 < Re ρ < 1`, `|Im ρ| ≤ H` and `DirichletCharacter.LFunction χ ρ = 0` has `Re ρ = 1/2`.
The open strip excludes the trivial zeros and the junk value of `riemannZeta` at `1`.

- Antitonicity: if `H ≤ H'` then `RH(H')` implies `RH(H)` and `GRH(q, H')` implies `GRH(q, H)`.
- `RH(H)` if and only if `GRH(1, H)`, from `DirichletCharacter.LFunction_modOne_eq` and
  `DirichletCharacter.isPrimitive_one_level_one`.
- `(∀ H, RH(H))` if and only if `RiemannHypothesis`: zeros with `Re s ≥ 1` do not exist
  (`riemannZeta_ne_zero_of_one_le_re`), `riemannZeta 0 = −1/2`, and a zero with `Re s < 0` is a
  trivial zero by `riemannZeta_one_sub` and the zeros of `sin` and `1/Γ`.
- `(∀ H, GRH(q, H))` if and only if `DirichletGRH χ` (`AnalyticNumberTheoryPartI` §1.6) for every
  primitive `χ` modulo `q`: the extra clause `χ ≠ 1 ∨ s ≠ 1` and the half-plane `Re s > 0` of
  `DirichletGRH` are reconciled by `DirichletCharacter.LFunction_ne_zero_of_one_le_re`.
- Passage to imprimitive characters: for `q ≥ 1` and real `H`, every `χ : DirichletCharacter ℂ q`,
  primitive or not, has all its zeros with `0 < Re ρ < 1` and `|Im ρ| ≤ H` on `Re ρ = 1/2` if and
  only if `GRH(f, H)` holds for every divisor `f` of `q`. The L-function of `χ` is that of its
  primitive character `χ*` (`DirichletCharacter.primitiveCharacter`, of level `f = conductor χ`,
  which divides `q`) times `∏_{p ∣ q} (1 − χ*(p) p^{−s})` (`DirichletCharacter.LFunction_changeLevel`
  with `DirichletCharacter.changeLevel_primitiveCharacter`, valid for `s ≠ 1`); a factor with
  `χ*(p) = 0` is `1`, and one with `χ*(p) ≠ 0` vanishes only where `p^{Re s} = |χ*(p)| = 1`, that is
  on `Re s = 0`. So `χ` and `χ*` have the same zeros in the open strip; conversely a primitive
  character of level `f ∣ q` and its lift to level `q` (`DirichletCharacter.changeLevel`) have the
  same zeros there, by the same identity.
- Agreement with the certified-zero language: for `H ≥ 0`, `RH(H)` if and only if
  *AllOnCriticalLine* `completedRiemannZeta univ (Icc 0 1 ×ℂ Icc (−H) H)`, and `GRH(q, H)` if and only
  if *AllOnCriticalLine* `(DirichletCharacter.completedLFunction χ) univ (Icc 0 1 ×ℂ Icc (−H) H)` for
  every primitive `χ` modulo `q` (`ZerosOfLFunctions` Layer 9). The points of positive divisor of
  the completed function in the closed strip are the zeros of `L` in the open strip: the gamma
  factor is regular and nonzero for `Re s > 0`, there are no zeros on `Re s = 0, 1`
  (`ZerosOfLFunctions` 6.5), and the poles of `completedRiemannZeta` at `0` and `1` have divisor `−1`.
- Certificates: a *HasZerosInRects* certificate of `completedRiemannZeta` on
  `Icc 0 1 ×ℂ Icc (−H) H` all of whose rectangles satisfy *AllOnCriticalLine* gives `RH(H)`.

*Needs:* Mathlib `riemannZeta`, `riemannZeta_one_sub`, `riemannZeta_zero`,
`riemannZeta_ne_zero_of_one_le_re`, `RiemannHypothesis`, `DirichletCharacter.LFunction`,
`DirichletCharacter.IsPrimitive`, `DirichletCharacter.LFunction_modOne_eq`,
`DirichletCharacter.isPrimitive_one_level_one`, `DirichletCharacter.LFunction_ne_zero_of_one_le_re`,
`DirichletCharacter.LFunction_eq_completed_div_gammaFactor`, `DirichletCharacter.changeLevel`,
`DirichletCharacter.LFunction_changeLevel`, `DirichletCharacter.primitiveCharacter`,
`DirichletCharacter.changeLevel_primitiveCharacter`; `AnalyticNumberTheoryPartI` §1.6;
`ZerosOfLFunctions` 6.5 and Layer 9.

**Checks.**

- `RH(H)` holds vacuously for `H < 0`; and dropping the strip condition `0 < Re ρ < 1` would make
  `RH(0)` false, because `ζ(−2) = 0` (`riemannZeta_neg_two_mul_nat_add_one`) and `−2` has real
  part `−2`.
- `GRH(2, H)` holds for every `H`: the only character modulo `2` is trivial, of conductor `1 ≠ 2`, so
  no character modulo `2` is primitive. The same holds for every `q ≡ 2 (mod 4)`.
- `GRH(1, H)` and `RH(H)` are the same statement: the unique character modulo `1` is primitive and
  its L-function is `riemannZeta`.
- The passage to imprimitive characters at `q = 2`: the only character modulo `2` has L-function
  `(1 − 2^{−s}) ζ(s)`, whose extra zeros `2πik/log 2` lie on `Re s = 0`, outside the strip; the law
  reads "its zeros up to height `H` in the strip are on the line iff `GRH(1, H)` and `GRH(2, H)`",
  that is iff `RH(H)`. The same law with the closed condition `0 ≤ Re ρ` in place of `0 < Re ρ`
  would fail for every `H ≥ 9.07`, at the zero `ρ = 2πi/log 2` of height `9.0647`.
- `RH(14)` asserts nothing about the zero `1/2 + 14.1347…i`, whose ordinate exceeds `14`; it is a
  statement about the empty set of zeros with `|γ| ≤ 14` and follows from any recorded
  verification of 0.4.

### 0.3 Platt's finite-conductor theorem in bounded-height form

For `2 ≤ q ≤ 400 000` let `H(q) = max(10⁸/q, 7.5·10⁷/q + 200)` if `q` is even and
`H(q) = max(10⁸/q, 3.75·10⁷/q + 200)` if `q` is odd. Prove `GRH(q, H(q))` for every such `q`
(Platt, Theorem 7.1, `platt2016grh` lines 951–963). Corollaries: `GRH(q, 10⁸/q)` for
`2 ≤ q ≤ 400 000`; `GRH(q, 10 000)` for `2 ≤ q ≤ 13`; `GRH(q, 2500)` for `2 ≤ q ≤ 40 000`; and
`GRH(8, 10 000)`. The modulus `q = 1`, where `GRH(1, H)` is `RH(H)`, is not part of Platt's
computation; it is covered by the recorded verifications of 0.4. For `q ≥ 2` these contain every
range of Rumely's verification (`rumely1993`, Table 1), which is therefore not a hypothesis of any
theorem here.

*Needs:* `ComputationalNumberTheory` §4.22 `platt_bounded_height`; 0.2 antitonicity.

**Checks.**

- `H(3) = 10⁸/3 ≈ 3.33·10⁷`, `H(400 000) = 7.5·10⁷/400 000 + 200 = 387.5` (the second branch wins
  for large even `q`) and `H(399 999) = 293.75…`; a reading with `10⁸/q` alone would give `250` at
  `q = 400 000`, weaker than the theorem.
- `GRH(13, 10 000)` follows because `10⁸/13 ≈ 7.69·10⁶ ≥ 10⁴`, and `GRH(112, 2500)` because
  `10⁸/112 ≈ 8.93·10⁵ ≥ 2500`.
- The parity in `H(q)` is that of the modulus `q`, not of the character: at `q = 5` (odd) both even
  and odd characters get `H(5) = 2·10⁷`.
- The range starts at `q = 2`: the primitive characters of modulus `q ≤ 400 000` number
  `29 565 923 838` including the trivial character modulo `1`, and Platt's computation treats
  `29 565 923 837` L-functions (`platt2016grh` line 952), so `ζ` is not among them. A reading
  "`1 ≤ q`" would turn `RH(10⁸)` into a consequence of this theorem.

### 0.4 Recorded verifications of the Riemann hypothesis

The following verifications are recorded as hypotheses: a theorem that rests on one takes the
displayed Prop as an explicit hypothesis, and nothing here proves it.

- `RH(545 439 823)` (van de Lune, te Riele and Winter, `vandeluneterielewinter1986`);
- `RH(10⁹)` (Platt's thesis, `platt2011thesis`);
- `RH(30 610 046 000)`: every zero with `|γ| ≤ 3.0610046·10¹⁰` is simple and on the line (Platt,
  Theorem 5.1, `platt2017zeros` line 527);
- `RH(3 000 175 332 800)`, hence `RH(3·10¹²)` (Platt and Trudgian, Theorem 1, `platttrudgian2021`
  line 48);
- `ζ` has no zero `ρ` with `0 < Re ρ < 1` and `|Im ρ| ≤ 14`: the least positive ordinate is
  `γ₁ = 14.134725…` (`kadiri2005` line 992), and `ζ` does not vanish on `0 ≤ Re s ≤ 1`,
  `|Im s| ≤ 14.13` (`thornerzaman2024` line 305);
- `|N(T) − ϑ(T)/π − 1| ≤ 2.5167` for `0 ≤ T ≤ 30 610 046 000`, with `ϑ` the Riemann–Siegel theta
  function `riemannSiegelTheta` defined below: the bound `|S(T)| ≤ 2.5167` on that range for `S(T)`
  the argument function of `ZerosOfLFunctions` 7.3 (Bellotti and Wong, (1.2), `bellottiwong2025`
  lines 121–124), read off Platt's rigorous isolation of all the zeros below that height
  (lines 199–202; `platt2017zeros`), through `N(T) = ϑ(T)/π + 1 + S(T)` (2.9; at an ordinate,
  `N(T) − ϑ(T)/π − 1` is the limit of `S` from the right). As a hypothesis it is the displayed
  inequality, which needs only the definition of `ϑ` below.

By 0.2, `RH(3·10¹²)` implies each of the other three `RH(H₀)`. The last two propositions are not of
that form, since `RH(H)` allows zeros on the line and says nothing about how many there are: the
fifth is the statement `N(14) = 0`, and the sixth bounds `N(T) − ϑ(T)/π − 1` for every
`T ≤ 30 610 046 000`, which no `RH(H₀)` implies. The ZetaGrid and
Gourdon–Demichel announcements are context only: every theorem a paper proves from them is stated here from `RH(3·10¹²)`.

**Checks.**

- `3·10¹² ≥ 3.0610046·10¹⁰ ≥ 10⁹ ≥ 545 439 823`, so antitonicity orders the four hypotheses.
- Platt's Theorem 5.1 also gives `N(3.0610046·10¹⁰) = 103 800 788 359` (`platt2017zeros`
  line 525); with `T = 3.0610046·10¹⁰` the main term `(T/2π) log(T/2πe) + 7/8` is
  `1.0380078·10¹¹`, consistent with Layer 5.
- The absence of zeros up to height `14` is strictly stronger than `RH(14)`: both hold, but `RH(14)`
  would also hold if `ζ` had a zero `1/2 + 13i`, which `N(14) = 0` excludes; at height `14.2` the
  absence of zeros fails, at the zero `1/2 + 14.1347…i`.
- The bound for `S(T)` is not implied by `RH(30 610 046 000)`, which allows every zero below that
  height to be double. At `T = 100`, `ϑ(100)/π + 1 = 29.00241`, so the true count `N(100) = 29`
  gives `S(100) = −0.00241`, while doubled zeros would give `N(100) = 58` and `S(100) = 28.998`,
  far above `2.5167`; at `T = 14.14` (`ϑ(T)/π + 1 = 0.45043`) the true `S` is `0.54957`.

Define `riemannSiegelTheta T = ∫₀^T (Re ψ(1/4 + it/2) − log π)/2 dt` for real `T`, with `ψ` Mathlib's
`Complex.digamma` (the logarithmic derivative of `Complex.Gamma`); this is the Riemann–Siegel theta
function `ϑ(T)`. The integrand is continuous, since `Γ` has neither a pole nor a zero on the line
`Re s = 1/4`.

- `ϑ(0) = 0`, and `ϑ` is differentiable with `ϑ'(T) = (Re ψ(1/4 + iT/2) − log π)/2`.
- `ϑ` is odd: `Re ψ(1/4 − iT/2) = Re ψ(1/4 + iT/2)`, since `ψ(conj z) = conj ψ(z)` by
  `Complex.Gamma_conj`, so the integrand is even.

Its identification with `Im log Γ(1/4 + iT/2) − (T/2) log π`, the relation
`N(T) = ϑ(T)/π + 1 + S(T)` and its Stirling expansion are 2.9.

*Needs:* Mathlib `Complex.digamma`, `Complex.Gamma_conj`,
`intervalIntegral.integral_hasDerivAt_right`.

**Checks.**

- `ϑ(100) = 87.97217` and `ϑ(14.14) = −1.72653`, so `ϑ/π + 1` is `29.00241` and `0.45043`, the
  values used above; `ϑ(−100) = −87.97217`.
- `ϑ` is negative on `(0, 17.84560)`, with its minimum `−3.53097` at `T = 6.28984`, where
  `Re ψ(1/4 + iT/2) = log π` (close to `2π`, as `Re ψ(1/4 + iT/2) ≈ log(T/2)`); a definition without the term `−(T/2) log π` would give
  `ϑ(100)/π + 1 = 47.221` against `N(100) = 29`.
- The principal argument of `Γ(1/4 + 50i)` is `0.69540` and the continuous one is `145.20866`, so a
  definition through the principal `Complex.log` would give `ϑ(100) = −56.54110`: the integral is the
  continuous branch.

### 0.5 Admissible cosine polynomials

Define *IsAdmissibleCosinePolynomial* `n a`, for `n : ℕ` and `a : ℕ → ℝ`, as: `0 ≤ a k` for
`k ≤ n`, `a k = 0` for `k > n`, `a 0 < a 1`, and
`TauCeti.IsNonnegativeTrigonometricCombination (Finset.range (n + 1)) (fun k ↦ (a k : ℂ)) id`. At
`z = e^{iθ}` the Tau Ceti combination is `P(θ) = Σ_{k≤n} a_k cos(kθ)`, so the last clause is
`P(θ) ≥ 0` for all real `θ` (Mossinghoff–Trudgian's class `P_n` of nonnegative even cosine
polynomials of degree `n` with nonnegative coefficients and `a₁ > a₀`, `mossinghofftrudgian2015`
lines 73–75, restated at line 129). The clause `a k = 0` for `k > n` makes `a` the coefficient
vector of `P`, so that `a 1` is a coefficient of `P` and `A = f_n(0) − a₀ = Σ_{1≤k≤n} a_k` in 7.3
is read off `a`. A *polynomial certificate* is this Prop at literal rational coefficients.

- `P(0) = Σ_{k≤n} a_k` and `P(π) = Σ_{k≤n} (−1)^k a_k ≥ 0`.
- Scaling `a` by a positive constant and appending zero coefficients preserve admissibility.
- Admissibility implies `n ≥ 1`, and `P(θ) ≥ 0` extends to `Re Σ a_k z^k ≥ 0` for `|z| ≤ 1`
  (`TauCeti.trigonometricCombination_nonneg_of_boundary`).
- For `0 ≤ r < 1` and `|z| ≤ 1`, `Σ_k a_k Re(−Log(1 − r z^k)) ≥ 0`
  (`TauCeti.sum_re_neg_log_one_sub_nonneg`): the Euler-product form of positivity used in Layer 8.

*Needs:* Tau Ceti `TauCeti.IsNonnegativeTrigonometricCombination`,
`TauCeti.trigonometricCombination_nonneg_of_boundary`, `TauCeti.sum_re_neg_log_one_sub_nonneg`,
`TauCeti.LSeries.isNonnegativeTrigonometricCombination_threeFourOne`.

**Checks.**

- `(3, 4, 1)` is admissible: `3 + 4 cos θ + cos 2θ = 2(1 + cos θ)² ≥ 0`, with `P(π) = 0`; it is
  Tau Ceti's `isNonnegativeTrigonometricCombination_threeFourOne`.
- `(1, 2)` has `a₀ < a₁` but `P(π) = −1 < 0`, so it is not admissible; nonnegativity is not implied
  by the coefficient conditions.
- `(1, 1)` is nonnegative (`1 + cos θ ≥ 0`) but fails `a₀ < a₁`; the strict inequality is what makes
  the zero-free argument produce a positive constant.
- Every degree-zero polynomial `(a₀)` fails, since `a₁ = 0 ≤ a₀`: with `n = 0` the vanishing
  clause forces `a 1 = 0`. Without that clause `n = 0` and `a = (1, 2, 0, 0, …)` would pass
  (`0 ≤ a 0`, `a 0 = 1 < a 1 = 2`, and `P(θ) = 1 ≥ 0` over `range 1`), contradicting `n ≥ 1`,
  and 7.3 would read `A = f_0(0) − a₀ = 0` from a vector whose `a₁ = 2` lies outside `P`.

### Examples

- `π = 3 + O*(0.1416)`; `RH(3·10¹²)` implies `RH(30 610 046 000)`; `GRH(8, 10 000)` from Platt's
  theorem; the `3-4-1` polynomial.

### Dependencies

Mathlib normed groups, `riemannZeta`, `DirichletCharacter.LFunction`, `RiemannHypothesis`,
`Complex.digamma` and interval integrals (for `riemannSiegelTheta`). Tau Ceti
nonnegative trigonometric combinations. `AnalyticNumberTheoryPartI` §1.6; `ZerosOfLFunctions` 6.5 and
Layer 9; `ComputationalNumberTheory` §4.22.

## Layer 1: Stirling's series and the Gamma function on the positive axis

### 1.1 Stirling's series with the periodic Bernoulli remainder

For `z` in the slit plane `ℂ ∖ (−∞, 0]` and `n ≥ 1`, prove
`log Γ(z) = (z − 1/2) Log z − z + (1/2) log(2π) + Σ_{j=1}^{n−1} T_j(z) + r_n(z)` with
`r_n(z) = ∫₀^∞ (B_{2n} − B_{2n}({u}))/(2n (u + z)^{2n}) du`, the integral absolutely convergent, and
equivalently `r_{n+1}(z) = −∫₀^∞ B_{2n}({u})/(2n (u + z)^{2n}) du` (Olver's form, as recorded in
`brent2019` lines 121–145). At `n = 1` this is the Stieltjes identity of `AnalyticNumberTheoryPartI`
§0.23a, since `(B₂ − B₂({u}))/2 = ({u} − {u}²)/2 = Q(u)`. Route: the Euler–Maclaurin formula for
`u ↦ Log(z + u)` on `[0, N]`, Gauss's product for `Γ` and `N → ∞`; the difference of two
consecutive orders is `T_n(z)` because `∫₀^∞ (u + z)^{−2n} du = z^{1−2n}/(2n − 1)`.

*Needs:* `AsymptoticExpansions` §13.1 `sum_Icc_eq_eulerMaclaurin`; `AnalyticNumberTheoryPartI` §0.23a
(the slit-plane `log Γ` and the case `n = 1`); Mathlib `bernoulli`, `Polynomial.bernoulli`,
`bernoulliFun`, `Complex.Gamma`.

**Checks.**

- At `z = 1`, `n = 1`: `r₁(1) = log Γ(1) − (−1) − (1/2) log 2π = 1 − 0.918939 = 0.081061`, between
  `0` and `T₁(1) = 1/12 = 0.083333`, as 1.2 requires.
- `T₂(z) = B₄/(12 z³) = −1/(360 z³)` and `T₃(z) = B₆/(30 z⁵) = 1/(1260 z⁵)`: with Mathlib's
  convention `B₁ = −1/2` the odd Bernoulli numbers never enter, and an off-by-one in the index
  `2j` would put `B₃ = 0` in place of `B₄`.
- At `z = 2`, `r₂(2) = r₁(2) − 1/24 = 0.0413407 − 0.0416667 = −0.000326`, of the sign of
  `T₂(2) = −1/2880 = −0.000347` and smaller in absolute value.

### 1.2 The enveloping property on the positive axis

For `x > 0` and every integer `m ≥ 0`, the functions
`F_m(x) = log Γ(x) − (x − 1/2) log x + x − (1/2) log(2π) − Σ_{i=1}^{2m} T_i(x)` and
`G_m(x) = −(log Γ(x) − (x − 1/2) log x + x − (1/2) log(2π) − Σ_{i=1}^{2m+1} T_i(x))` are strictly
completely monotone on `(0, ∞)` (Alzer, Theorem 8, `alzer1997` lines 520–528). Consequently the
partial sums of Stirling's series bracket the remainder:
`Σ_{i=1}^{2m} T_i(x) < log Γ(x) − (x − 1/2) log x + x − (1/2) log 2π < Σ_{i=1}^{2m+1} T_i(x)`, and
`r_n(x)` has the sign of `T_n(x)` with `|r_n(x)| < |T_n(x)|` for every `n ≥ 1`. Differentiating
once gives the digamma bracket `log x − 1/(2x) − 1/(12x²) < ψ(x) < log x − 1/(2x)` for `x > 0`. Route:
the representation of 1.1 with the sign of `B_{2n} − B_{2n}({u})`, which is that of `B_{2n}`, and
Bernstein's characterization of complete monotonicity through Laplace transforms of positive
measures.

*Needs:* 1.1; Mathlib `bernoulli`, `Real.Gamma`, `Complex.digamma`.

**Checks.**

- `m = 0` gives `log Γ(x) > (x − 1/2) log x − x + (1/2) log(2π)` for all `x > 0`; at `x = 1` the
  two sides are `0` and `−0.081061`.
- At `x = 1`: `ψ(1) = −γ = −0.577216` lies between `0 − 1/2 − 1/12 = −0.583333` and `−1/2`; at
  `x = 1/5` the computed value `ψ(0.2) = −5.28904` lies in
  `(log 0.2 − 2.5 − 2.08333, log 0.2 − 2.5) = (−6.19277, −4.10944)`.
- The bracket fails if the parities are swapped: at `x = 1`, `Σ_{i≤1} T_i(1) = 0.083333` is an upper,
  not a lower, bound for `r₁(1) = 0.081061`.

### 1.3 Polygamma brackets

For integers `k ≥ 1`, `n ≥ 0` and real `x > 0`, prove `S_k(2n; x) < (−1)^{k+1} ψ^{(k)}(x) < S_k(2n + 1; x)`,
where `S_k(p; x) = (k − 1)!/x^k + k!/(2x^{k+1}) + Σ_{i=1}^{p} B_{2i} (∏_{j=1}^{k−1} (2i + j))/x^{2i+k}`
and `ψ^{(k)}` is the `k`-th derivative of `Complex.digamma` on the positive axis (Alzer, Theorem 9,
`alzer1997` lines 649–662). Route: `(−1)^{k+1} F_n^{(k+1)} > 0` and `(−1)^{k+1} G_n^{(k+1)} > 0` from 1.2.

*Needs:* 1.2; Mathlib `iteratedDeriv`, `Complex.digamma`.

**Checks.**

- `k = 1`, `n = 0`: `1/x + 1/(2x²) < ψ'(x) < 1/x + 1/(2x²) + 1/(6x³)`; at `x = 1`, `ψ'(1) = π²/6 =
  1.644934` lies in `(1.5, 1.666667)`.
- The empty product at `k = 1` is `1`; reading it as `0` would delete the Bernoulli terms and make the
  upper bound `1/x + 1/(2x²)` false at `x = 1`.
- `k = 2`, `n = 0`: `−ψ''(x)` lies between `1/x² + 1/x³` and `1/x² + 1/x³ + 1/(2x⁴)`; at `x = 1`,
  `−ψ''(1) = 2ζ(3) = 2.404114` lies in `(2, 2.5)`.

### 1.4 Ramanujan's sixth-root estimate

For real `x ≥ 1`, prove
`√π (x/e)^x (8x³ + 4x² + x + 1/100)^{1/6} < Γ(x + 1) < √π (x/e)^x (8x³ + 4x² + x + 1/30)^{1/6}`; equivalently the number `θ_x` defined by
`Γ(x + 1) = √π (x/e)^x (8x³ + 4x² + x + θ_x/30)^{1/6}` satisfies `3/10 < θ_x < 1`, and `θ_x` is
increasing on `[1, ∞)` with limit `1` (Ramanujan, *Lost Notebook IV*, p. 118, `andrewsberndt2013`;
Mortici's monotonicity proof, Theorem 1, `mortici2011ramanujan`). Route: monotonicity of
`x ↦ 6 log Γ(x + 1) − 6 log(√π (x/e)^x) − log(8x³ + 4x² + x)` through 1.2 with `m = 2`.

*Needs:* 1.2; Mathlib `Real.Gamma`.

**Checks.**

- `θ₁ = 0.33593`, `θ₂ = 0.51176`, `θ₁₀ = 0.87001`, `θ₁₀₀ = 0.98632`: increasing, inside `(3/10, 1)`.
- At `x = 1` the lower bound `(13.01)^{1/6} √π/e = 0.999985` and the upper bound `1.000283` bracket
  `Γ(2) = 1`; with `1/30` replaced by `1/100` the upper bound becomes `0.999985 < 1` and fails.
- Monotonicity holds only on `[1, ∞)`: `θ_x → 30/π³ = 0.96755` as `x → 0⁺`, while `θ_{0.5} = 0.32076`,
  `θ_{0.9} = 0.32036` and `θ₁ = 0.33593`, so `θ` decreases and then increases on `(0, 1]`.

### 1.5 Diamond–Straub comparisons

For `N ≥ 1` and real `λ`, put `F_N(λ; x) = log(x − λ) − Σ_{n=1}^{N} (−1)^n B_n(λ)(x − λ)^{−n}/n` and
`L_N(λ; x) = log √(2π) + (x − 1/2) log(x − λ) − (x − λ) + Σ_{n=2}^{N} (−1)^n B_n(λ)(x − λ)^{1−n}/(n(n − 1))`.
Let `λ₀` be the unique root in `[0, 1/2]` of `B_N` if `N` is even and of `B_{N+1}` if `N` is odd. Prove
(Diamond and Straub, Theorem 3.1, `diamondstraub2016` lines 320–326): if `N ≡ 1 (mod 4)` and
`λ ∈ [λ₀, 1/2]` then `ψ(x) > F_N(λ; x)` for all `x > λ`, and if `N ≡ 3 (mod 4)` the inequality is
reversed; if `N ≡ 2 (mod 4)` and `λ ∈ [0, λ₀]` then `ψ(x) > F_N(λ; x)` for `x > λ`, and if
`N ≡ 0 (mod 4)` it is reversed. And (Theorem 1.2, lines 90–94): under the same hypotheses on `λ`,
`(−1)^{⌈N/2⌉}(log Γ(x) − L_N(λ; x))` is strictly completely monotone on `(λ, ∞)`. At `λ = 0` this is
1.2. Route: Euler–Maclaurin for `Σ 1/(x + k)` (their Proposition 3.2) and the sign of the periodic
Bernoulli remainder on `[λ, ∞)`.

*Needs:* 1.1, 1.2; `AsymptoticExpansions` §13.1; Mathlib `Polynomial.bernoulli`.

**Checks.**

- `N = 1`, `λ = 1/2` (`λ₀ = (3 − √3)/6 = 0.21132`, the root of `B₂` in `[0, 1/2]`): `B₁(1/2) = 0`
  and the statement is `ψ(x) > log(x − 1/2)` for `x > 1/2`; at `x = 1`, `−0.57722 > −0.69315`.
- `N = 3`, `λ = 1/2`: `ψ(x) < F₃(1/2; x) = log(x − 1/2) + 1/(24(x − 1/2)²)`, since `B₁(1/2) =
  B₃(1/2) = 0` and `B₂(1/2) = −1/12`; at `x = 2`, `ψ(2) = 0.422784` against `F₃ = 0.423984`.
- `N = 2`, `λ = 0` is admissible (`0 ≤ λ₀`), and `ψ(x) > log x − 1/(2x) − 1/(12x²)`: the lower half
  of the digamma bracket of 1.2.

### 1.6 Mortici's digamma–logarithm estimate

For real `x > 0`, with `a(x) = −1/(24x²) + 1/(12x³) − 337/(2880x⁴)` and `b(x) = a(x) + 97/(720x⁵)`,
prove `a(x) < ψ(x + 1) + log(e^{1/(x+1)} − 1) < b(x)` (Mortici, Theorem 1.1 in its digamma form,
`mortici2011psi` lines 67–75). Route: 1.2 for the digamma bracket of order four, and the expansion of
`log(e^{u} − 1) − log u` in powers of `u`, compared by explicit rational derivatives.

*Needs:* 1.2, 1.3.

**Checks.**

- At `x = 1`: `ψ(2) + log(e^{1/2} − 1) = −0.009968` lies in `(−0.075347, 0.059375)`.
- At `x = 20` the value `−9.44412·10⁻⁵` lies at `0.953` of the way from `a(20) = −9.44813·10⁻⁵` to
  `b(20) = −9.44392·10⁻⁵`, an interval of width `4.21·10⁻⁸`; the next coefficient of the expansion is needed to see the bracket.
- At `x = n` a positive integer, `ψ(n + 1) = H_n − γ` (Mathlib `Complex.digamma_nat_add_one`) turns
  the statement into Mortici's bracket for `H_n − γ + log(e^{1/(n+1)} − 1)`.

### Examples

- `log Γ(1/2) = (1/2) log π`, and the bracket of 1.2 at `m = 1`, `x = 1/2`:
  `1/6 − 1/45 = 0.144444 < 0.572365 + 1/2 − 0.918939 = 0.153426 < 1/6 − 1/45 + 8/315 = 0.169841`.
- `ψ(1/2) = −γ − 2 log 2 = −1.96351` (Mathlib `Complex.digamma_one_half`) against the bracket
  `(log(1/2) − 1 − 1/3, log(1/2) − 1) = (−2.02648, −1.69315)`.

### Dependencies

`AsymptoticExpansions` §13.1; `AnalyticNumberTheoryPartI` §0.23a. Mathlib Gamma, digamma and
Bernoulli API.

## Layer 2: the Gamma function in the complex plane

### 2.1 Stieltjes' sector bound

For `z = |z| e^{iθ}` with `|θ| < π` and `n ≥ 1`, prove
`|r_n(z)| ≤ |B_{2n}|/(2n(2n − 1)|z|^{2n−1}) · sec^{2n}(θ/2)`, that is `|r_n(z)| ≤ |T_n(z)| sec^{2n}(θ/2)`
(Stieltjes; Olver (8.4.06), as recorded in `brent2019` lines 258–259). At `n = 1`:
`|ξ(z)| ≤ sec²(θ/2)/(12|z|)`, where `ξ = r₁`; hence for `0 < δ ≤ π` and `|θ| ≤ π − δ`,
`Γ(z) = √(2π) exp((z − 1/2) Log z − z + ξ(z))` with `|ξ(z)| ≤ 1/(12 sin²(δ/2)|z|)` (Ramaré,
*Excursions* §20.2, `ramare2022excursions`). Route: in 1.1 rotate the path of integration to the ray
`arg u = −θ/2`, on which `|u + z| ≥ (|u| + |z|) cos(θ/2)`, and bound the periodic Bernoulli function
through its Fourier series.

*Needs:* 1.1; Mathlib `Real.cos`, contour deformation for the integral of 1.1 (the integrand is
holomorphic in `u` off `−z + (−∞, 0]`).

**Checks.**

- On 2000 random points with `0.3 ≤ |z| ≤ 100` and `|θ| ≤ 3.1`, the ratio of `|r₁(z)|` to the bound
  stays below `0.99998`, and of `|r₂(z)|` below `0.9996`: the bound is nearly attained near the
  negative axis.
- The secant factor is needed: at `z = e^{3.1i}` the computed `|ξ(z)| = 1.389` exceeds the first
  omitted term `|T₁(z)| = 1/12`, so the real-axis enveloping bound does not extend to the plane; the
  bound `sec²(1.55)/12 = 192.7` holds.
- At `θ = 0` the bound is `|T_n(x)|`, consistent with the strict enveloping of 1.2.

### 2.2 Lindelöf's bound in the right half-plane

For `|θ| < π/2` and `n ≥ 1`, prove `|r_n(z)| ≤ K(θ)|T_n(z)|`, where `K(θ) = 1` for `|θ| ≤ π/4` and
`K(θ) = |csc 2θ|` for `π/4 < |θ| < π/2` (Lindelöf; Whittaker–Watson, recorded in `brent2019`
lines 244–255 and `nemes2015` lines 115–121). Route: Binet's first formula and
`sup_{u ≥ 0} |z²/(u² + z²)| = K(θ)`.

*Needs:* 2.4 (Binet's formula); 1.1.

**Checks.**

- For `|θ| ≤ π/4` the bound is the first omitted term, better than 2.1 by `sec^{2n}(θ/2) > 1`.
- At `θ = π/3`, `K = csc(2π/3) = 1.1547` while `sec²(π/6) = 1.3333`: Lindelöf beats Stieltjes at
  `n = 1`.
- `K(θ) → ∞` as `|θ| → π/2`: the bound says nothing on the imaginary axis, where 2.3 applies.

### 2.3 Brent's bound on the closed right half-plane

For `z ≠ 0` with `Re z ≥ 0` and `k ≥ 1`, prove
`|r_{k+1}(z)| ≤ √π Γ(k + 1/2)/Γ(k) · |T_k(z)|`, hence `|r_{k+1}(z)| < √(πk)|T_k(z)|` and
`|r_k(z)| < (1 + √(πk))|T_k(z)|` (Brent, Theorem 1 and Corollary 1, `brent2019` lines 162–202). Route:
`|u + z|² ≥ u² + |z|²` for `u ≥ 0`, `|B_{2k}({u})| ≤ |B_{2k}|`, and Wallis' integral.

*Needs:* 1.1; Mathlib `Real.Gamma`, `Real.Gamma_mul_Gamma_add_half`.

**Checks.**

- `k = 1`: `|r₂(z)| ≤ (√π Γ(3/2)/Γ(1)) |z|^{−1}/12 = (π/2)/(12|z|)`; on the imaginary axis, where
  2.1 gives `sec⁴(π/4)/(360|z|³) = 4/(360|z|³)` for `r₂`, both bounds hold and 2.1 is sharper for
  `|z| ≥ 1`.
- `Γ(k + 1/2)/Γ(k) < √k` (from 1.2 applied to `log Γ(x + 1/2) − log Γ(x)`): at `k = 1`,
  `0.886227 < 1`.
- The hypothesis `Re z ≥ 0` is needed for `|u + z|² ≥ u² + |z|²`: at `z = −1 + i`, `u = 1` it reads
  `1 ≥ 3`.

### 2.4 Binet's formulas and the sign of `Re ξ`

For `Re z > 0` prove Binet's first formula
`ξ(z) = ∫₀^∞ (1/2 − 1/u + 1/(e^u − 1)) e^{−zu} du/u` and Binet's second formula
`ξ(z) = 2 ∫₀^∞ arctan(u/z)/(e^{2πu} − 1) du`, and its integrated form
`ξ(z) = (1/π) ∫₀^∞ z/(z² + u²) · log(1/(1 − e^{−2πu})) du` (NIST DLMF §5.9, `dlmf`). Consequence:
`Re ξ(z) > 0` for `Re z > 0`, because `z/(z² + u²) = (1/2)((z + iu)⁻¹ + (z − iu)⁻¹)` has positive real
part and the weight is positive.

*Needs:* 1.1; Mathlib `Complex.arctan` or the logarithmic expression of `arctan(u/z)`, improper
integrals, integration by parts.

**Checks.**

- On the imaginary axis `|Γ(it)|² = π/(t sinh πt)` gives `Re ξ(it) = −(1/2) log(1 − e^{−2πt}) > 0`; at
  `t = 1` this is `0.000935`, and the formula's integrand gives the same value as `z → i`.
- At real `x`, the second formula gives `ξ(x) > 0`, matching 1.2 at `m = 0`.
- The positivity fails off the right half-plane: at `z = −1/2 + 2i`, `Re ξ(z) = −0.01004` by the
  computed `log Γ`, so `Re z > 0` is needed.

### 2.5 The modulus of `Γ` on vertical lines

For `σ > 0` and real `t ≠ 0`, with `s = σ + it`, prove
`√(2π) |s|^{σ−1/2} e^{−π|t|/2} e^{−σ³/(3t²)} < |Γ(s)| ≤ √(2π) |s|^{σ−1/2} e^{−π|t|/2} e^{1/(6|s|)}`.
Route: `log|Γ(s)| = (1/2) log 2π + (σ − 1/2) log|s| − t arg s − σ + Re ξ(s)`, with
`−t arg s − σ = −π|t|/2 + |t| arctan(σ/|t|) − σ ∈ [−π|t|/2 − σ³/(3t²), −π|t|/2]` by
`x − x³/3 ≤ arctan x ≤ x`; then `0 < Re ξ(s)` (2.4) and `|ξ(s)| ≤ sec²(θ/2)/(12|s|) ≤ 1/(6|s|)` (2.1,
`|θ| < π/2`). Ramaré's two-sided bound (`ramare2022excursions` §20.2) has the weaker lower factor
`e^{−σ³/t²}`; both are kept, the sharper one as the target, which is `norm_Gamma_bounds` in
[`Suggested.lean`](Suggested.lean).

*Needs:* 2.1, 2.4; Mathlib `Real.arctan`, `Real.arctan_le_self`, `Complex.norm_cpow_of_ne_zero`.

**Checks.**

- On 3000 random points with `0.01 ≤ σ ≤ 31` and `0.1 ≤ |t| ≤ 300` the lower bound holds with
  logarithmic margin at least `1.3·10⁻⁸` and the upper with margin at least `5.3·10⁻⁴`.
- At `σ = 1/2`, `t = 10`: `|s|^{σ−1/2} = 1` and `|Γ(1/2 + 10i)| = √(π/cosh 10π) = 3.77753·10⁻⁷`, which
  equals `√(2π) e^{−5π} (1 + e^{−20π})^{−1/2}`; it lies between `√(2π) e^{−5π} e^{−1/2400}` and
  `√(2π) e^{−5π} e^{1/60.075}`.
- At `t = 0` the lower bound is undefined, which is why `t ≠ 0` is a hypothesis; for real `s` the
  bound of 2.6 applies.

### 2.6 The Stirling coefficients of `Γ` and Nemes' bound

Define the *Stirling coefficients* `γ_k ∈ ℚ` as the coefficients of the formal power series
`exp(Σ_{j≥1} B_{2j} w^{2j−1}/(2j(2j − 1)))` in `w` (Mathlib `PowerSeries.exp` composed with an odd
series without constant term), so that formally `Γ(z) ~ √(2π) z^{z−1/2} e^{−z} Σ_k γ_k z^{−k}`. Let
`R_N(z)` be the remainder after `N` terms (`nemes2015` lines 55–63). Prove, for `N ≥ 1` and
`Re z > 0`, `|R_N(z)| ≤ (|γ_N| |z|^{−N} + |γ_{N+1}| |z|^{−N−1}) K(θ)` with `K` as in 2.2 (Nemes,
Theorem 1.2, lines 105–108); for `N ≥ 2` and `|arg z| ≤ π/2`,
`|R_N(z)| ≤ (1 + ζ(N)) Γ(N)/((2π)^{N+1}|z|^N) · (2√N + 1)/2` (Theorem 1.3, lines 169–171; the factor
`(2√N + 1)/2 = √N + 1/2` is what its proof gives, lines 543–554); and for
real `x > 0` the sign pattern of Theorem 1.1 (lines 86–100). Consequence (lines 125–135): for real
`x > 0`, `1 < Γ(x)/(√(2π) x^{x−1/2} e^{−x}) < 1 + 1/(12x) + 1/(288x²)`, sharper than the classical
upper bound `exp(1/(12x))` that 1.2 gives at `m = 0`.

- `γ₀ = 1`, `γ₁ = 1/12`, `γ₂ = 1/288`, `γ₃ = −139/51840`, `γ₄ = −571/2488320`.
- `γ_k` is rational, and for `N ≥ 1`, `(−1)^{N+1} γ_{2N−1} ≥ 0` and `(−1)^{N+1} γ_{2N} ≥ 0`: the
  signs run `+, +, −, −, +, +, …` (Theorem 1.1, (1.4), read in the convention here: Nemes' `γ_n`
  is `(−1)^n` times the `γ_n` here, his `γ₁` being `−1/12`, line 38).
- The reciprocal: `Σ_k (−1)^k γ_k w^k` is the formal inverse of `Σ_k γ_k w^k`, because the exponent is
  an odd series in `w`; it is the expansion of `1/Γ` that Nemes' bounds also cover.

*Needs:* 1.1, 2.4; Mathlib `PowerSeries.exp`, `bernoulli`, `riemannZeta`, `Real.Gamma`.

**Checks.**

- `γ₁ = B₂/2 = 1/12` and `γ₂ = γ₁²/2 = 1/288`: the exponential of the series, not the series itself,
  whose `w²` coefficient is `0`.
- `γ₃ = B₄/12 + γ₁³/6 = −1/360 + 1/10368 = −139/51840`; a definition through `log Γ` coefficients
  would give `−1/360`.
- The signs: `γ₁, γ₂ > 0`, `γ₃, γ₄ < 0`, and `γ₅ = 163879/209018880 > 0`,
  `γ₆ = 5246819/75246796800 > 0`, `γ₇ = −534703531/902961561600 < 0`. Nemes' form
  `(−1)^N γ_{2N−1} ≥ 0` taken over unchanged would claim `γ₁ ≤ 0` and `γ₃ ≥ 0`, false here; it is
  the sign pattern of his convention, in which `γ₁ = −1/12` and `γ₃ = 139/51840`.
- The real bound at `x = 1`: the ratio is `e/√(2π) = 1.084438` against `1 + 1/12 + 1/288 = 1.086806`; at
  `x = 10`: `1.0083654` against `1.0083681`, while `exp(1/120) = 1.0083682` is weaker; at `x = 0.01` the
  ratio `4.19548` is far below the bound `44.06`.
- At `N = 2`, `z = 10`: Theorem 1.3 gives `(1 + π²/6) · ((2√2 + 1)/2)/((2π)³ · 100) =
  2.644934 · 1.914214/24805.02 = 0.000204`, while the true
  `R₂(10) = Γ(10)/(√(2π) 10^{9.5} e^{−10}) − 1 − 1/120 = 3.20·10⁻⁵`; the bound holds. The reading
  `2√N + 1/2` of the factor would give `0.000355`, true but weaker than the theorem.

### 2.7 Digamma in a sector

For `|θ| < π`, prove `ψ(z) = Log z − 1/(2z) + O*(sec³(θ/2)/(8|z|²))`, from the derivative bound of
`AnalyticNumberTheoryPartI` §0.23a at `j = 1`, and for `Re z > 0` the real-part form
`Re ψ(z) = log|z| − Re(1/(2z)) + O*(1/(2√2 |z|²))`. Consequently,
`Re ψ((σ + it)/2 + 1) ≤ log(|σ + 2 + it|/2) − Re(1/(σ + 2 + it)) + √2/|σ + 2 + it|²`, the form
in which the gamma factor of `ζ` enters Layers 5 and 8; here `σ > −2` and `t` is any real.

*Needs:* `AnalyticNumberTheoryPartI` §0.23a; 1.2 for the real case; Mathlib `Complex.digamma`,
`Complex.log_re`.

**Checks.**

- At `z = 1`: `ψ(1) = −γ = −0.5772`, `Log 1 − 1/2 = −0.5`, difference `0.0772 ≤ 1/8`.
- At `z = 10i`: computed `ψ(10i) = 2.303419 + 1.620796i`, against `Log(10i) − 1/(20i) = 2.302585 +
  1.620796i`; the difference `0.000834` is below `sec³(π/4)/800 = 0.003536`.
- The real-axis bracket of 1.2 is sharper on `(0, ∞)`: `1/(12x²)` against `1/(8x²)`.

### 2.8 Gamma quotients on vertical lines

For `a ∈ {0, 1}` and `s = σ + it` with `−1/2 ≤ σ ≤ 1/2`, prove
`|Γ((1 − s + a)/2)/Γ((s + a)/2)| ≤ |(1 + s)/2|^{1/2−σ}` (Rademacher, Lemmas 1 and 2,
`rademacher1959`, as used in `thornerzaman2024` lines 329–333). Route: Rademacher's argument, whose
inputs are Stirling's formula with the explicit remainder of 2.1, `Γ(w + 1) = wΓ(w)` and
`Γ(conj w) = conj Γ(w)`; at `σ = −1/2` and `a = 0` the quotient equals `|(1 + s)/2|` exactly, by
`Γ(3/4 − it/2) = (−1/4 − it/2) Γ(−1/4 − it/2)`.

*Needs:* 2.5; Mathlib `Complex.Gamma_add_one`, `Complex.Gamma_conj`.

**Checks.**

- Equality at `σ = −1/2`, `t = 0`, `a = 0`: `|Γ(3/4)/Γ(−1/4)| = 1/4 = |(1 − 1/2)/2|¹`, since
  `Γ(3/4) = (−1/4) Γ(−1/4)`.
- At `σ = 1/2` both sides are `1`: `|Γ((1/2 − it + a)/2)/Γ((1/2 + it + a)/2)| = 1` by `Γ(conj w) =
  conj Γ(w)`.
- On 8000 random points with `|t| ≤ 200` the ratio of the two sides never exceeds `0.99999999956`;
  the exponent `1/2 + σ` in place of `1/2 − σ` fails at `σ = −1/2`, `t = 100`, `a = 0`, where it gives
  the bound `1` against the true value `50.0006`.

### 2.9 The Riemann–Siegel theta function in Stirling form

For real `T`, with `ϑ = riemannSiegelTheta` of 0.4, prove:

- `ϑ(T) = Im log Γ(1/4 + iT/2) − (T/2) log π` with the slit-plane branch of `log Γ`
  (`AnalyticNumberTheoryPartI` §0.23a): both sides vanish at `0`, and the derivative of
  `Im log Γ(1/4 + iT/2)` is `Re ψ(1/4 + iT/2)/2`. This is Brent's definition of `ϑ` as the
  continuous argument of `Γ(1/4 + iT/2)` minus `(T/2) log π` (`brent2019` lines 38–43).
- For `T > 0` that is not the ordinate of a zero of `ζ`, `N(T) = ϑ(T)/π + 1 + S(T)` with `S(T)` of
  `ZerosOfLFunctions` 7.3; at an ordinate `N(T) − ϑ(T)/π − 1` is the limit of `S` from the right,
  since `N` counts the zeros with `γ ≤ T`.
- For `T ≥ e`, `7/8 < ϑ(T)/π + 1 − (T/2π) log(T/(2πe)) < 7/8 + 1/(40T)`.

Route: Stirling's series for `log Γ(1/4 + iT/2)` (1.1) with the remainder bound of 2.3 at
`z = 1/4 + iT/2`, which has `Re z > 0`; Brent's expansion of `ϑ` with the exponentially small term
`arctan(e^{−πT})/2` and his bound for its remainder (Theorem 5 and Corollary 3, `brent2019`
lines 499–510 and 576–584) is another route to the same bracket. For the relation with `N(T)`, the
argument principle on the rectangle of `ZerosOfLFunctions` 7.4 for the completed function.

*Needs:* 0.4 (`riemannSiegelTheta`), 1.1, 2.3; `AnalyticNumberTheoryPartI` §0.23a;
`ZerosOfLFunctions` 7.3–7.4; Mathlib `Complex.digamma`.

**Checks.**

- At `T = e`, `ϑ(e)/π + 1 − (e/2π) log(1/(2π)) = 0.877491`, inside
  `(7/8, 7/8 + 1/(40e)) = (0.875, 0.884197)`; on `[e, 3·10⁶]` the excess over `7/8` stays below
  `0.0068/T`.
- The leading term `1/(48πT)` of the excess is not an upper bound for it: at `T = e` the excess is
  `0.0024909`, above `1/(48πe) = 0.0024396`, because the next term `7/(5760πT³) = 0.0000193` and
  `arctan(e^{−πT})/(2π) = 0.0000311` are positive; the constant `1/40 > 1/(48π)` of the bracket
  is what absorbs them. At `T = 100` the excess is `6.6315·10⁻⁵`, equal to `1/(48π·100)` to five
  digits.
- At `T = 100` the continuous `Im log Γ(1/4 + 50i)` is `145.20866`, and
  `145.20866 − 50 log π = 145.20866 − 57.23649 = 87.97217 = ϑ(100)`, the value of the integral of
  0.4; with `N(100) = 29` the relation gives `S(100) = −0.00241`. At `T = 14`, below the first
  ordinate, `N(14) = 0` and `ϑ(14)/π + 1 = 0.43247`, so `S(14) = −0.43247`; without the term `1`
  (the contribution of the pole of `ζ` at `1`) the relation would give `S(14) = 0.56753` and
  `S(100) = 0.99759`, a mean of about `1` where `S` has mean `0`.

### Examples

- On `Re z ≥ 0`, 2.1 gives `|ξ(z)| ≤ 1/(6|z|)`, and 2.2 gives `|ξ(z)| ≤ 1/(12|z|)` for `|θ| ≤ π/4`.
- `|Γ(1/2 + it)|² = π/cosh(πt)` against 2.5.

### Dependencies

Layer 1; 0.4 (`riemannSiegelTheta`, for 2.9); `AnalyticNumberTheoryPartI` §0.23a;
`ZerosOfLFunctions` 7.3–7.4 (for 2.9); Mathlib `Complex.Gamma`, `Complex.digamma`,
`PowerSeries.exp`, `Real.arctan`.

## Layer 3: explicit convexity and pointwise bounds

### 3.1 The explicit Phragmén–Lindelöf principle

Let `a < b`, let `f` be holomorphic on a neighbourhood of the closed strip `a ≤ Re s ≤ b` with
`|f(σ + it)| ≤ C exp(C₂ e^{C₃|t|})` there for some `C, C₂ > 0` and `0 < C₃ < π/(b − a)`, and let
`G₁, …, G_r` be holomorphic on the same neighbourhood with `G_i(conj s) = conj G_i(s)` and
`C₁ exp(−C₂ e^{C₃|t|}) < |G_i(σ + it)|` on the strip. Let `α_i, β_i ≥ 0` with
`|f(a + it)| ≤ ∏ |G_i(a + it)|^{α_i}` and `|f(b + it)| ≤ ∏ |G_i(b + it)|^{β_i}` for all real `t`, and
suppose `σ ↦ |G_i(σ + it)|` is increasing on `[a, b]` when `α_i > β_i` and decreasing when
`β_i > α_i`. Prove `|f(σ + it)| ≤ ∏ |G_i(σ + it)|^{(α_i(b − σ) + β_i(σ − a))/(b − a)}` for
`a ≤ σ ≤ b` (Fiori, Theorem 1, `fiori2025` lines 47–64). With negative exponents the same holds
under the extra hypothesis `|G_i(σ + it)| < C₁ exp(C₂ e^{C₃|t|})` (Remark 2, lines 65–70). The
admissible factors include positive constants and `G(s) = Q + s` with `Q > −a`. Route: the midpoint
case for `F(s) = f(a + s) conj f(b − conj s)` by the three-lines theorem applied after dividing by the
interpolating product (the growth hypotheses make the quotient bounded after an `exp(−ε cos(…))`
damping), then bisection and continuity (`fiori2025` Lemma 5, lines 110–114).

*Needs:* Mathlib `Complex.HadamardThreeLines.norm_le_interpStrip_of_mem_verticalClosedStrip`,
`PhragmenLindelof.vertical_strip`; continuity of `σ ↦ |G_i(σ + it)|`.

**Checks.**

- `r = 1`, `G₁ = e` (constant), `α₁ = log A`, `β₁ = log B`: the conclusion is the three-lines bound
  `A^{(b−σ)/(b−a)} B^{(σ−a)/(b−a)}`, Mathlib's `norm_le_interp_of_mem_verticalClosedStrip₀₁'` at
  `a = 0`, `b = 1`.
- On `[a, b] = [−1/2, 3/2]` the factor `G(s) = 1 + s` is admissible: `Q = 1 > −a = 1/2`, and
  `|1 + σ + it|` increases with `σ` because `1 + σ > 0`. With `Q = 1/4 < −a` the factor `1/4 + s`
  vanishes at `s = −1/4` inside the strip and violates the lower growth bound.
- Replacing `|G|^{α}` by `|log G|^{α}` with `α ≠ β` is not covered: `|log(Q + s)|` is not monotone in
  `σ`, which is the error in an earlier generalization that Fiori corrects (`fiori2025` lines 13–18,
  91–93); the general form here never uses logarithmic factors with unequal exponents.

### 3.2 Rademacher's convexity bound

Call a record `d` of the L-functions roadmap of *finite-order type* when: `d` satisfies
`HasDirichletAgreement`, `HasMeromorphicContinuation` and `HasFunctionalEquation`; every element of
`d.gammaR` lies in `{0, 1}` and every element of `d.gammaC` is `0`; the polar divisor is supported in
`{0, 1}` with order at most `1`; `ZerosOfLFunctions` *IsFiniteOrder* `d` holds; and the coefficients
admit the majorant `Σ_m |d.coeff m| m^{−σ} ≤ ζ(σ)^n` for every real `σ > 1`, with `n = d.degree` and
`N = d.conductor`. For such `d`, `0 < η ≤ 1/2` and `s = σ + it` with `−η ≤ σ ≤ 1 + η` and `s ≠ 1`,
prove `‖continuedL d s‖ ≤ P(s) (N (|1 + s|/(2π))^n)^{(1+η−σ)/2} ζ(1 + η)^n`, where
`P(s) = 3|(1 + s)/(1 − s)|` if `d.polarOrder 1 ≠ 0` and `P(s) = 1` otherwise (Rademacher,
Theorems 3 and 4, `rademacher1959`, at this generality as the common form of both).

- Primitive Dirichlet characters: for `χ` primitive of conductor `q > 1`,
  `|L(s, χ)| ≤ (q|1 + s|/(2π))^{(1+η−σ)/2} ζ(1 + η)` on the same range (Theorem 3), the record being
  `dirichletData χ` with `n = 1`, `N = q`, `gammaR = {a}`; the statement is quoted in `bmor2021`
  Lemma 5.6, lines 569–577, and is `norm_LFunction_le_rademacher`.
- The Riemann zeta function: `|ζ(s)| ≤ 3|(1 + s)/(1 − s)| (|1 + s|/(2π))^{(1+η−σ)/2} ζ(1 + η)` for
  `−η ≤ σ ≤ 1 + η`, `s ≠ 1`.

Route: the right edge `σ = 1 + η` by the majorant; the left edge `σ = −η` by the functional equation
against the dual record,
`|γ_dual(1 − s)/γ(s)| = ∏ |Gammaℝ(1 − s + a_j)/Gammaℝ(s + a_j)| ≤ (|1 + s|/(2π))^{n(1/2+η)}` by 2.8 (each `Gammaℂ(s)` is `Gammaℝ(s) Gammaℝ(s + 1)`), and the conductor
power `N^{1/2+η}`; then 3.1 with `G₁ = N^{1/2}` constant and `G₂(s) = (1 + s)/(2π)`, applied to
`continuedL d` or, in the polar case, to `((s − 1)/(s + 1)) continuedL d s`, whose factor is at most `1`
on the right edge and at most `(1 + η)/(1 − η) ≤ 3` on the left edge. Finite order on the strip is
`ZerosOfLFunctions` 3.4 (*poleClearedContinuedL*).

*Needs:* 2.8, 3.1; L-functions Layer 0 predicates, Layer 4 `dirichletData`; `ZerosOfLFunctions`
1.6 (*continuedL* and its functional equation against the dual record), 3.4, Layer 0
*IsFiniteOrder*; Mathlib `Complex.Gammaℝ_mul_Gammaℝ_add_one`, `riemannZeta`.

**Checks.**

- The Dirichlet instance for `χ₄` and the quadratic character modulo `5`, on the grid
  `η ∈ {0.05, 0.1, 0.25, 0.5}`, `σ ∈ {−η, −η/2, 1/2, 1, 1 + η}`, `|t| ≤ 60` (step `1/2`): the ratio
  of the two sides stays below `0.53` and `0.73` respectively, its largest values lying on the
  edges `σ = −η` and `σ = 1 + η`.
- The `ζ` instance is attained: at `η = 1/2` and `s = −1/2` the factor `3|(1 + s)/(1 − s)|` is `1`,
  the gamma quotient of 2.8 is an equality, and `|ζ(−1/2)| = ζ(3/2)/(4π) = 0.207886` equals the bound
  `(1/(4π)) ζ(3/2)`. A constant smaller than `3` in the pole factor would make the bound false there.
- At `s = 1/2`, `η = 1/2`: `|ζ(1/2)| = 1.46035` against
  `9 · (3/(4π))^{1/2} · ζ(3/2) = 9 · 0.48860 · 2.61238 = 11.488`.
- The pole factor is needed for `ζ`: without it the bound at `s = 1 + 1/100` would be
  `(2.01/(2π))^{0.49/2} ζ(3/2) = 1.976`, while `ζ(1.01) = 100.578`. The Dirichlet instance at `q = 1`
  is therefore not asserted.
- `η > 1/2` is excluded: the left-edge factor `(1 + η)/(1 − η)` exceeds `3`, and at `η = 1` it is
  infinite.

### 3.3 Backlund's bounds in the strip

For `t ≥ 50` prove: `|ζ(σ + it)| ≤ log t − 0.048` for `σ ≥ 1`;
`|ζ(σ + it)| ≤ (t²/(t² − 4)) (t/(2π))^{(1−σ)/2} log t` for `0 ≤ σ ≤ 1`; and `|ζ(σ + it)| ≤ (t/(2π))^{1/2−σ} log t` for
`−1/2 ≤ σ ≤ 0` (Backlund, equations (53)–(54), (56) and (76), `backlund1918`; the line `σ = 1` in the
form `|ζ(1 + it)| ≤ log t` is quoted from (53) in `trudgian2014argument` line 261). Route: the
Euler–Maclaurin formula for `ζ(s) − Σ_{n ≤ N} n^{−s}` with `N ≈ t/(2π)`, the functional equation with
the gamma quotient of 2.5 on `σ ≤ 0`, and 3.1 between `σ = 0` and `σ = 1`.

*Needs:* 2.5, 3.1; `AsymptoticExpansions` §13.1; Mathlib `riemannZeta_one_sub`.

**Checks.**

- On `50 ≤ t ≤ 125` the computed ratios of `|ζ|` to the three bounds stay below `0.623`, `0.615` and
  `0.616` respectively.
- At `σ = 1/2`, `t = 50` the middle bound is `(2500/2496)(50/2π)^{1/4} log 50 = 6.581`, slightly
  better than Lehman's `4(t/2π)^{1/4} = 6.718` (4.7); at `t = 55` the order is reversed (`6.902`
  against `6.880`), since `log t > 4t²/(t² − 4)` for `t ≥ 55`.
- The factor `t²/(t² − 4)` is `1.0016` at `t = 50`; it records the pole of `ζ` at `1` through the
  interpolating factor `|s/(s − 1)|`.

### 3.4 Bounds to the right of the line one

For real `σ > 1` and all real `t`, prove `|ζ(σ + it)| ≤ ζ(σ) ≤ e^{γ(σ−1)}/(σ − 1)` (Bastien and
Rogalski, `bastienrogalski2002`; Ramaré, Lemma 5.4, `ramare2016density` line 654), and
`−Re (ζ'/ζ)(σ + it) ≤ −(ζ'/ζ)(σ) ≤ 1/(σ − 1) − 1/(2σ²)` (Delange, `delange1987`). Route: the first
inequalities in each chain are termwise from the Dirichlet series; the second come from the
Euler–Maclaurin representation `ζ(σ) = 1/(σ − 1) + 1/2 + σ ∫₁^∞ ({u} − 1/2) u^{−σ−1} du` and the
convexity of `σ ↦ log((σ − 1) ζ(σ))`.

*Needs:* 1.1; `AsymptoticExpansions` §13.1; Mathlib `riemannZeta`, `Real.eulerMascheroniConstant`,
`ArithmeticFunction.vonMangoldt`.

**Checks.**

- On `1 < σ ≤ 11` (step `1/40`) the ratio `ζ(σ)(σ − 1)e^{−γ(σ−1)}` never exceeds `0.99994`, tending to
  `1` as `σ → 1⁺`; at `σ = 2`, `1.64493 ≤ e^{γ} = 1.78107`.
- `−ζ'/ζ(σ) − 1/(σ − 1) + 1/(2σ²) ≤ −0.0957` on `1.025 ≤ σ ≤ 11`; as `σ → 1⁺` the left side tends to
  `−γ + 1/2 = −0.0772`, so the constant `1/2` in `1/(2σ²)` cannot be replaced by `γ + 0.01`.
- At `σ = 2`: `−ζ'/ζ(2) = 0.56996 ≤ 1 − 1/8 = 0.875`.

### 3.5 The Poisson–Jensen inequality on a strip

Let `F` be holomorphic on a neighbourhood of `0 ≤ Re z ≤ 1`, not identically zero, with
`log|F(x + iy)| ≤ C e^{c|y|}` there for some `C > 0` and `0 ≤ c < π`. For every real `t` prove
`log|F(1/2 + it)| ≤ (1/2) ∫_ℝ (log|F(i(t + v))| + log|F(1 + i(t + v))|) dv/cosh(πv)`, the integrals
existing in `[−∞, ∞)` (the inequality used in `thornerzaman2024` lines 319–321, from Bennett and
Sharpley's interpolation lemma). Route: `log|F|` is subharmonic; the harmonic measure of each boundary
line of the strip seen from `1/2 + it` has density `1/(2 cosh(π(y − t)))`; transport Jensen's
inequality from the disc by the conformal map `z ↦ tanh(π(z − 1/2 − it)/2)`, the growth hypothesis
controlling the passage to the unbounded strip.

*Needs:* Mathlib `MeromorphicOn.circleAverage_log_norm` (Jensen's formula on a disc),
`PhragmenLindelof.vertical_strip`, `Real.cosh`.

**Checks.**

- `∫_ℝ dv/cosh(πv) = 1`, so for `F` constant both sides are `log|F|`; the weights are a probability
  measure split equally between the two lines.
- `F(z) = e^{az}` with `a` real: the left side is `a/2` and the right side `(1/2)(0 + a) = a/2`,
  equality, as for every `log|F|` harmonic.
- `F(z) = exp(e^{−iπ(z − 1/2)})` has `log|F(x + iy)| = e^{πy} cos(π(x − 1/2))`, which is `0` on both
  boundary lines and `e^{πt} > 0` at `1/2 + it`: the inequality fails, and the growth rate is exactly
  `c = π`, so the hypothesis `c < π` cannot be relaxed.

### Examples

- `|L(1/2, χ₄)| = 0.66769 ≤ (4 · 1.5/(2π))^{1/2} ζ(3/2) = 2.55283` (3.2 with `η = 1/2`).
- `|ζ(1 + 50i)| = 0.52326 ≤ log 50 − 0.048 = 3.864` (3.3).

### Dependencies

Layers 1–2. L-functions Layers 0 and 4; `ZerosOfLFunctions` Layer 0, 1.6 and 3.4;
`AsymptoticExpansions` §13.1; Mathlib three-lines and Phragmén–Lindelöf theorems.

## Layer 4: explicit exponential sums and the size of `ζ` on vertical lines

Throughout, `S_f(a, N) = |Σ_{a < n ≤ a+N} e(f(n))|` for integers `a`, `N ≥ 1` and a real function `f`
on `(a, a + N]`.

### 4.1 The Kusmin–Landau inequality

Prove (Landau's sharp form, `ariasdereyna2024` Lemma 1 and Remark 2, lines 90–104): if `f` is
continuously differentiable on `(X, X + Y]` with monotone `f'` and `θ ≤ f'(x) − k ≤ 1 − θ` for an
integer `k` and some `0 < θ ≤ 1/2`, then `|Σ_{X<n≤X+Y} e(f(n))| ≤ cot(πθ/2)`, and `cot(πθ/2) ≤ 2/(πθ)`.
And the asymmetric form (Hiary, Patel and Yang, Lemma 2.3, `hiarypatelyang2024` lines 86–92): if `f'`
is continuous and monotone on `[a, b)` with `ℓ + 1/U ≤ f'(x) ≤ ℓ + 1 − 1/V` for an integer `ℓ` and
`U, V > 1`, then `|Σ_{a≤n<b} e(f(n))| ≤ (U + V)/π`. Route: Abel summation against
`1/(e(f'(ξ)) − 1)` and the monotonicity of `cot` on `(0, π)`.

*Needs:* Mathlib `Real.fourierChar`, `Real.cot`, Abel summation (`sum_mul_eq_sub_sub_integral_mul`).

**Checks.**

- `f(x) = x/2`, `θ = 1/2`: the sum is `Σ (−1)^n`, of modulus at most `1 = cot(π/4)`; Landau's constant
  is attained.
- Landau's constant is optimal (`ariasdereyna2024` lines 105–108), so the form `1/(πθ) + 1` of
  Cheng and Graham (`chenggraham2004`, Lemma 2) is false for small `θ`: at `θ = 0.01`, `cot(0.005π) = 63.66 > 1/(0.01π) + 1 = 32.83`
  (`hiarypatelyang2024` lines 29–44 record the correction from `1/π` to `2/π`).
- With `θ = 0` (for instance `f = 0`, the sum being `Y`) no bound independent of `Y` exists; with
  `U = V = 1/θ` the asymmetric form gives `2/(πθ)`, the upper estimate of the cotangent form.

### 4.2 The Weyl–van der Corput inequality (A-process)

For integers `N ≥ 1`, `H ≥ 1` and complex `b₁, …, b_N`, with `C(h) = Σ_{n=1}^{N−h} b_{n+h} conj(b_n)`
for `1 ≤ h < N` and `C(h) = 0` for `h ≥ N`, prove the finite van der Corput inequality
`H² |Σ_{n≤N} b_n|² ≤ (N + H − 1)(H Σ_{n≤N} |b_n|² + 2 Re Σ_{h=1}^{H−1} (H − h) C(h))`. Corollaries:

- the same with `2 Σ_{h<H} (H − h)|C(h)|` in place of the real part;
- the A-process: for real `f` on `(a, a + N]` and every integer `q ≥ 1`,
  `S_f(a, N)² ≤ (N − 1 + q)(N/q + (2/q) Σ_{r=1}^{q−1} (1 − r/q) S_{g_r}(a, N − r))`, where
  `g_r(x) = f(x + r) − f(x)` (Yang, Lemma 2.3, `yang2024` lines 324–334; `patelyang2024` Lemma 1.2,
  lines 112–122; Hiary, Patel and Yang, Lemma 2.4, `hiarypatelyang2024` lines 96–104), which is the
  case `b_n = e(f(a + n))`, `H = q`, of the second form, since `|C(r)| = S_{g_r}(a, N − r)`;
- the normalized form: for real `X`, `Y ≥ 1`, an integer `1 ≤ H ≤ Y` and complex `b_n` with
  `|b_n| ≤ 1` on the integers of `(X, X + Y]`,
  `|Y⁻¹ Σ_{X<n≤X+Y} b_n|² ≤ 4/H + (4/(HY)) Σ_{h=1}^{H−1} |Σ_{X<n, n+h≤X+Y} b_{n+h} conj(b_n)|`, because
  there are at most `Y + 1` such integers, so `N + H − 1 ≤ 2Y` and `(Y + 1)/Y ≤ 2`.

Route: extend `b` by zero and write `H Σ_n b_n = Σ_m Σ_{j=0}^{H−1} b_{m−j}`, the outer sum over the
`N + H − 1` values of `m` for which the inner sum can be nonzero; apply Cauchy–Schwarz in `m` and
expand the square: the diagonal gives `H Σ |b_n|²`, and the lag `h ≥ 1` occurs `H − h` times
together with its conjugate.

*Needs:* Mathlib `Finset.sum_mul_sq_le_sq_mul_sq`, `norm_sum_le`, `Complex.normSq`,
`Real.fourierChar`.

**Checks.**

- `N = 1`: both sides are `H² |b₁|²`; `H = 1`: the inequality is Cauchy–Schwarz
  `|Σ b_n|² ≤ N Σ |b_n|²`.
- `b = (1, 1)`, `H = 2`: the left side is `4 · 4 = 16` and the right side `3 · (2 · 2 + 2 · 1) = 18`;
  with `N` in place of `N + H − 1` the right side would be `12 < 16`, so the factor `N + H − 1` is
  needed.
- `b = (1, −1)`, `H = 2`: the left side is `0` and the right side `3 · (4 − 2) = 6`; the real part
  of `C(1) = −1` enters with its sign, and with `2Y = 4` in place of `N + H − 1 = 3` that term would
  drop from `−6` to `−8`, which is why the normalized form uses `|C(h)|`.
- `q = 1` gives `S_f(a, N)² ≤ N²`, the trivial bound.
- For a linear phase `f(x) = αx` every `g_r` is constant, `S_{g_r}(a, N − r) = N − r`, and the right side
  is at least `N²` for every `q`, so the inequality is consistent with `S_f = N` at `α ∈ ℤ`.
- At `q = 2` the inequality reads `S_f(a, N)² ≤ (N + 1)(N/2 + (1/2) S_{g₁}(a, N − 1))`, the first
  differencing step with `g₁(x) = f(x + 1) − f(x)`.

### 4.3 Second-derivative tests

Prove (`ariasdereyna2024` Lemmas 4 and 5, lines 109–114 and 183–189): if `f` is twice continuously
differentiable on `(X, X + Y]` with `0 < λ ≤ f''(x) ≤ Λ`, then
`|Σ_{X<n≤X+Y} e(f(n))| ≤ (ΛY + 2)(1 + 4/√(πλ)) + 1`, and for `Y ≥ 1` the bound `A(ΛY + 2)/√λ` with
`A = (2/√π)(1 + √(1 + 3π/8)) = 2.79368…`. With `f''` monotone and `λ₂ ≤ |f''| ≤ hλ₂` on `[a, a + N]`,
`h > 1`, prove `S_f(a, N) ≤ (4/√π) N h λ₂^{1/2} + N h λ₂ + (4/√π) λ₂^{−1/2}` (Yang, Lemma 2.1,
`yang2024` lines 167–172). Patel's corrected forms of Cheng and Graham's test (`patel2022` Lemma 2.3,
lines 140–144, and (25), line 157): for integers `N`, `L ≥ 1` and reals `V < W` with `W > 1` and
`1/W ≤ |f''| ≤ 1/V` on `[N + 1, N + L]`,
`|Σ_{n=N+1}^{N+L} e(f(n))| ≤ 2((L − 1)/V + 2)(2√(W/π) + 1/2) + 1 ≤ 2(L/V + 2)(2√(W/π) + 1)`; the
first is the first bound above with `λ = 1/W`, `Λ = 1/V` and `Y = L − 1`, the length of an
interval holding the summation points (the proof uses only that length and the sign of `f''`,
which is constant since `f''` is continuous and never `0`; for `f'' < 0` apply the bound to `−f`,
whose sum is the complex conjugate). Route: split `(X, X + Y]` where `‖f'‖ ≥ δ` (4.1 on each
piece, at most `ΛY + 2` pieces) and where `‖f'‖ < δ` (trivial bound on intervals of length
`2δ/λ`), and optimize `δ`.

*Needs:* 4.1.

**Checks.**

- `f(x) = x²/(2Y)`: `λ = Λ = 1/Y`, and the first bound is `3(1 + 4√(Y/π)) + 1 ≈ 6.77√Y`, of the true
  order `√Y` of the sum.
- `λ → 0⁺` makes every bound infinite, as it must: the linear phase `f(x) = kx`, `k ∈ ℤ`, has
  `f'' = 0` and sum `Y`.
- Ignoring the additive `1`, Lemma 4's factor `1 + 4/√(πλ)` is below Lemma 5's `A/√λ` exactly when
  `√λ < A − 4/√π = 0.5369`, that is `λ < 0.2883`; neither form dominates the other.
- Patel's two forms at `L = 10`, `V = 2`, `W = 3`: `32.907` and `41.362`, the second exceeding the
  first by `8.454 > L/V + 1 = 6`; Cheng and Graham's original constant, smaller by a factor about
  `√2` in the leading term (`patel2022` Remark 2.4), is not asserted.

### 4.4 Third and higher derivative tests

For integers `a`, `N > 0`, `k ≥ 3`, `f` with `k` continuous derivatives, `f^{(k)}` monotone and
`λ_k ≤ |f^{(k)}(x)| ≤ h λ_k` on `(a, a + N]` with `λ_k > 0`, `h > 1`, and `K = 2^{k−1}`, prove
`S_f(a, N) ≤ A_k h^{2/K} N λ_k^{1/(2K−2)} + B_k N^{1−2/K} λ_k^{−1/(2K−2)}` for every `η > 0`, with
`A₃(η, h)`, `B₃(η)`, `λ₀` and `δ₃` defined in closed form and `A_k`, `B_k`, `δ_k` for `k ≥ 4` by the
recursions of Yang, Lemmas 2.4–2.5 (`yang2024` lines 344–360 and 487–513; `patelyang2024`
Lemma 1.4, lines 150–181). At `k = 3` the bound reads `A₃ h^{1/2} N λ₃^{1/6} + B₃ N^{1/2} λ₃^{−1/6}`.
For `k ≥ 10` and `1 < h ≤ 3`:
`S_f(a, N) ≤ 2.762 h^{2/K} N λ_k^{1/(2K−2)} + 1.02 N^{1−2/K} λ_k^{−1/(2K−2)}` (Lemma 2.6, lines 658–666, with `η = 4.7399` and the recursion computed to `k = 10`,
a numerical certificate). Route: 4.2 with `q` chosen in terms of `λ_k`, reducing `k` to `k − 1`,
and 4.3 at the bottom, with the trivial bound when `λ_k ≥ λ₀`.

And Patel's corrected third, fourth and fifth derivative tests (`patel2022` Lemmas 2.5, 3.1 and
3.2, lines 160–164, 191–196 and 266–270). Let `N` be an integer, `L ≥ 1`, `W > 1`, `λ ≥ 1`, and
`S = Σ_{n=N+1}^{N+L} e(f(n))`.

- If `f` has three continuous derivatives with `1/W ≤ |f'''| ≤ λ/W` on `[N + 1, N + L]`, then for
  every `η₃ > 0`, `|S|² ≤ (L W^{−1/3} + η₃)(α₃ L + β₃ W^{2/3})` with
  `α₃ = 1/η₃ + (32λ/(15√π)) √(η₃ + W^{−1/3}) + 2λη₃ W^{−1/3} + 2λ W^{−2/3}` and
  `β₃ = 64/(3√π √η₃) + 4 W^{−1/3}`. Both decrease in `W`, so they are at most their values
  `α̃₃ = 1/η₃ + (32λ/(15√π))√(η₃ + 1) + 2λη₃ + 2λ` and `β̃₃ = 64/(3√π √η₃) + 4` at `W = 1` (line 185).
  The source assumes four derivatives; its proof uses `f'''` only, through the mean value theorem
  for `f''`.
- If `f` has four continuous derivatives with `1/W ≤ |f⁽⁴⁾| ≤ λ/W`, then for `η₃, η₄ > 0`,
  `|S|² ≤ (L W^{−1/7} + η₄)(α₄ L + γ₄ √L W^{2/7} + β₄ W^{3/7})` with
  `α₄ = 1/η₄ + (72/91) √α̃₃ (η₄ + W^{−1/7})^{1/6}`, `γ₄ = (72/55) √β̃₃ η₄^{−1/6} + √(η₃ α̃₃) W^{−1/7}` and
  `β₄ = (9/5) √(β̃₃ η₃) η₄^{−1/3}`.
- If `f` has five continuous derivatives with `1/W ≤ |f⁽⁵⁾| ≤ λ/W`, then for `η₃, η₄, η₅ > 0`, with
  `α̃₄ = 1/η₄ + (72/91) √α̃₃ (η₄ + 1)^{1/6}` and `γ̃₄ = (72/55) √β̃₃ η₄^{−1/6} + √(η₃ α̃₃)` (line 282),
  `|S|² ≤ (L W^{−1/15} + η₅)(α₅ L + τ₅ L^{3/4} W^{2/15} + γ₅ √L W^{3/15} + ω₅ L^{1/4} W^{1/5} + β₅ W^{4/15})`
  with `α₅ = 1/η₅ + (392/435) √α̃₄ (η₅ + W^{−1/15})^{1/14}`, `τ₅ = (392/351) √γ̃₄ η₅^{−1/14}`,
  `γ₅ = (98/78) √β₄ η₅^{−1/7} + √(η₄ α̃₄) W^{−2/15}`, `ω₅ = (98/78) √(η₄ γ̃₄) η₅^{−1/7}` and
  `β₅ = (392/275) √(η₄ β₄) η₅^{−3/14}`.

Route for each: the A-process 4.2 with `q = M = ⌈η_k W^{1/(2^{k−1}−1)}⌉`; the difference
`g_m(x) = f(x + m) − f(x)` has its `(k − 1)`-th derivative between `m/W` and `mλ/W` in absolute
value (mean value theorem), so the previous test (for `k = 3`, Patel's form of 4.3) applies to
`g_m` with `W/m` in place of `W`; then `√(x₁ + x₂ + ⋯) ≤ √x₁ + √x₂ + ⋯`, `α ≤ α̃`, `γ ≤ γ̃`, and
the lag sums `Σ_{m≤M} (1 − m/M) m^s ≤ M^{s+1}/((s + 1)(s + 2))` for `−1 < s < 1` (`patel2022` (32),
line 232). A lag with `W/m ≤ 1` is bounded trivially by `L`, which is below the first term of the
lag bound because `α̃₃ ≥ 2 + 2√2` and `α̃₄ ≥ (72/91)√(2 + 2√2) > 1`.

*Needs:* 4.2, 4.3; for the `k ≥ 10` constants the numerical certificate of `yang2024` (2.71).

**Checks.**

- `k = 3`: `K = 4` and the exponents are `λ₃^{1/6}` and `N^{1/2} λ₃^{−1/6}`, the classical third
  derivative test; a recursion indexed by `k` instead of `K = 2^{k−1}` would give `λ₃^{1/4}`.
- Patel's third derivative constants at `W → 1⁺`, `λ = η₃ = 1`: `α₃ = 6.70215` and `β₃ = 16.03604`.
  A reading with `W^{+1/3}` and `W^{+2/3}` in `α₃` would make `α₃` increase in `W`, contrary to
  `patel2022` line 183, and put the term `2λη₃ L²` in the bound, which for `2λη₃ ≥ 1` exceeds the
  trivial `L²`.
- The coefficients are the lag sums `2/((s + 1)(s + 2))`: `s = 1/6` gives `72/91`, `s = −1/6`
  gives `72/55`, `s = −1/3` gives `2/((2/3)(5/3)) = 9/5`. The printed statement of Lemma 3.1 has
  `18/20` in `β₄` (line 196), while its proof has `18/10` (lines 241 and 263); `9/5` is what the
  argument gives, and the smaller printed factor is not asserted.
- `h` enters only as `h^{2/K}`, which tends to `1` as `k` grows; at `h = 3`, `k = 10`,
  `h^{2/512} = 1.0043`.
- For `λ_k ≥ λ₀` the trivial bound `N` is already below `A_k N λ_k^{1/(2K−2)}`, which is why the
  lemma holds for all `λ_k > 0`.

### 4.5 Truncated Poisson summation, stationary phase and the B-process

Prove (Patel and Yang, Lemmas 2.1–2.3, `patelyang2024` lines 266–268, 475–477 and 667–671): if `f'`
is continuous and decreasing on `(a, b)` with `f'(b) = α`, `f'(a) = β`, then
`|Σ_{a<n≤b} e(f(n)) − Σ_{α−1/2<m<β+1/2} ∫_a^b e(f(x) − mx) dx| ≤ (3/π) log(β − α + 2) + 4`; if `f` is
three times differentiable on `(a, b)` with `f'' < 0`, `0 < λ₂ ≤ |f''| ≤ h₂λ₂`, `|f'''| ≤ h₃λ₃` and
`f'(c) = 0` for some `c ∈ (a, b)`, then
`|∫_a^b e(f(x)) dx − e(f(c) − 1/8)/|f''(c)|^{1/2}| ≤ 2·3^{2/3}π^{2/3} h₃^{1/3} λ₂^{−1} λ₃^{1/3} + (1/π)(1/|f'(a)| + 1/|f'(b)|)`
(the source allows `c ∈ [a, b]`; at an endpoint `c` the term `1/|f'(c)|` is infinite and the bound
says nothing); and if `f` is three times differentiable on `[a, b]` with `f'` decreasing there,
`f'(b) = α`, `f'(a) = β`, `0 < λ₂ ≤ |f''| ≤ h₂λ₂` and `|f'''| ≤ h₃λ₃` on `[a, b]`, and `x_ν ∈ [a, b]`
is defined by `f'(x_ν) = ν` for each integer `ν ∈ (α, β]`, then
`|Σ_{a<n≤b} e(f(n)) − Σ_{α<ν≤β} e(f(x_ν) − νx_ν − 1/8)/|f''(x_ν)|^{1/2}| ≤ 4.686 λ₂^{−1/2} + 2·3^{2/3}π^{2/3} h₂ h₃^{1/3}(b − a) λ₃^{1/3} + (5/π) log(β − α + 2) + 6`.
The third statement assumes no stationary point of `f` itself. Route: Euler–Maclaurin and
the Fourier series of the sawtooth for the first; the second by van der Corput's integral lemma on
`[c − δ, c + δ]` and the first-derivative bound outside; the third from the first, with the second
applied to each phase `f(x) − νx`, `α + 1/2 < ν < β − 1/2`, whose derivative vanishes at the
interior point `x_ν` (`patelyang2024` (2.32)–(2.33), lines 672–700).

*Needs:* `AsymptoticExpansions` §13.1; Mathlib `intervalIntegral`, `Real.fourierChar`.

**Checks.**

- The decreasing hypothesis fixes the orientation `α ≤ β`: for `f(x) = −x²/(2M)` on `(0, M]`,
  `α = f'(M) = −1 ≤ β = f'(0) = 0`; a phase with increasing `f'` is handled by `−f`, whose sum is the
  complex conjugate.
- In the first lemma the dual sum over `m` has about `β − α + 1` terms and the error grows only like
  `log(β − α)`.
- The phase `−1/8` and the factor `|f''(x_ν)|^{−1/2}` are the stationary-phase normalization:
  `∫_ℝ e(−x²/2) dx = e(−1/8)`.
- The third bound with no stationary point: `f(x) = x/2 − x²/(8M)` on `[0, M]` has `f'` decreasing
  from `β = 1/2` to `α = 1/4`, `λ₂ = 1/(4M)`, `h₂ = 1` and `f''' = 0`; no integer lies in `(1/4, 1/2]`,
  so the dual sum is empty and the bound reads `|Σ_{0<n≤M} e(f(n))| ≤ 9.372 √M + 7.291`, at `M = 100`
  `101.01` against the true `1.1215`. A hypothesis `f'(c) = 0` for some `c` would exclude this phase,
  since `f' ≥ 1/4`.

### 4.5a An explicit approximate functional equation

With `χ(s) = 2^s π^{s−1} sin(πs/2) Γ(1 − s)`, define `R₁(s; x, y)` by
`ζ(s) = Σ_{n≤x} n^{−s} + χ(s) Σ_{n≤y} n^{s−1} + R₁(s; x, y)`. For `1/2 ≤ σ ≤ 1`, `|t| ≥ 2π` and
`x, y ≥ 1` with `2πxy = |t|`, prove `|R₁(s; x, y)| ≤ E x^{−σ} + F (|t|/(2π))^{1/2−σ} y^{σ−1}` with
`(E, F) = (36.094, 0)` if `x ≤ y` and `(0, 127.126)` if `x > y`; for `|t| ≥ 10³` the constants
`(10.983, 0)` and `(0, 15.726)`; for `|t| ≥ 10¹⁰` the constants `(10.7502, 0)` and `(0, 15.203)`
(Simonič, Theorem 4 and Tables 1–3, `simonic2020` lines 113–124, 177–205). And the one-sided
approximation (Kadiri, Theorem 1.2 and Corollary 1.3, `kadiri2013density` lines 107–133): for
`t₀ > 0`, `σ ≥ 1/2`, `t ≥ t₀` and `c > 1/(2π)`, `ζ(s) = Σ_{1≤n<ct} n^{−s} + O*(C(σ, c) t^{−σ})` with
`C(σ, c) = (c + 1/2 + 3√(1 + 1/t₀²)/(2π) · (ζ(2)/(2πc) + 1 + 1/(2πc − 1))) c^{−σ}`; at `c = 1`, `t₀ = 14.1347`
this is `|ζ(s) − Σ_{1≤n<t} n^{−s}| ≤ 2.1946 t^{−σ}` for `σ ≥ 1/2`, `t ≥ 14.1347`. Route: the classical proof of the
approximate functional equation (`titchmarsh1986` Theorem 4.13) with every error made explicit:
Euler–Maclaurin for the two partial sums, the functional equation with 2.5 for `χ(s)`, and the
Kusmin–Landau inequality 4.1 with the truncated Poisson formula 4.5 for the exponential sums.

*Needs:* 2.1, 2.5, 4.1, 4.5; `AsymptoticExpansions` §13.1; Mathlib `riemannZeta_one_sub`.

**Checks.**

- Kadiri's constant: at `c = 1`, `t₀ = 14.1347` (where `c^{−σ} = 1`), `C = 3/2 + 0.47866 · (0.26180 + 1 +
  0.18927) = 2.1946`, the printed value of Corollary 1.3; dropping the middle `1` in the bracket would
  give `1.7159`, which the corollary does not state.
- The symmetric choice `x = y = √(|t|/2π)` lies in the column `x ≤ y` and gets `E = 36.094`; the
  sharper symmetric constants `4.257`, `1.195`, `1.00007` of the source rest on Arias de Reyna's
  Riemann–Siegel remainder for `1/2 ≤ σ ≤ 1` and are not asserted here.
- At `σ = 1/2` the two error terms are `E x^{−1/2}` and `F y^{−1/2}`, symmetric under `x ↔ y`, as the
  functional equation requires.
- At `s = 1/2 + 100i` with `x = y = √(100/2π) = 3.98942` (three terms in each sum, `|χ(s)| = 1`), the
  computed `|R₁| = 0.4532` is below `36.094 x^{−1/2} = 18.07`, and below the source's symmetric
  `4.257 x^{−1/2} = 2.131`.

### 4.6 The Riemann–Siegel formula with Gabcke's remainder

For `t ≥ 200` and `n₁ = ⌊√(t/2π)⌋`, prove
`|ζ(1/2 + it)| ≤ 2|Σ_{n=1}^{n₁} n^{−1/2+it}| + R(t)` with `R(t) = 1.48 t^{−1/4} + 0.127 t^{−3/4}`
(`hiarypatelyang2024` Lemma 2.1, lines 72–80, from the Riemann–Siegel formula with Gabcke's bound
for its remainder, `gabcke1979`); and the Riemann–Siegel–Lehman bound
`|ζ(1/2 + it)| ≤ 4(t/2π)^{1/4} − 2.08` for `t ≥ 200` (Lemma 2.2, lines 81–85), which contains
Lehman's `|ζ(1/2 + it)| ≤ 4(t/2π)^{1/4}` for `t ≥ 128π` (`lehman1970`, Lemma 2, as quoted in
`ford2002zerofree` line 139). Route: the saddle-point derivation of the Riemann–Siegel formula
`Z(t) = 2 Σ_{n≤n₁} n^{−1/2} cos(ϑ(t) − t log n) + (−1)^{n₁−1}(t/2π)^{−1/4}(C₀(p) + R₀(t))` with
`p = √(t/2π) − n₁`, Gabcke's bound for `R₀`, and `|C₀| ≤ 1` (then `n^{−1/2}` summed by an integral
for `n > 5`, for the second statement).

*Needs:* 2.9 (for `ϑ(t) = Im log Γ(1/4 + it/2) − (t/2) log π`); Mathlib `riemannZeta_one_sub`;
`ZerosOfLFunctions` 7.1–7.2 (rectangle contours); the saddle-point estimates of `AsymptoticExpansions`
Layer 5.

**Checks.**

- At `t = 200`: `4(200/2π)^{1/4} − 2.08 = 7.42`; the computed maximum of `|ζ(1/2 + it)|` on
  `200 ≤ t ≤ 260` is `0.766` times the bound.
- `R(200) = 1.48 · 0.2659 + 0.127 · 0.0188 = 0.396`: the remainder is small but not negligible
  against the main sum of `n₁ = 5` terms.
- At `t = 200` (`n₁ = 5`): `|Σ_{n≤5} n^{−1/2+200i}| = 2.7964`, so the bound is `2 · 2.7964 + 0.3959 =
  5.989`, against `|ζ(1/2 + 200i)| = 5.590`. Without the factor `2` (the two halves of the
  Riemann–Siegel formula) the bound would be `3.192`, false; on `200 ≤ t ≤ 260` the ratio
  `|ζ(1/2 + it)|/|Σ_{n≤n₁} n^{−1/2+it}|` reaches `3.66`.

### 4.7 Bounds on the critical line

Prove:

- (Hiary, Patel and Yang, Theorem 1.1, `hiarypatelyang2024` lines 64–65)
  `|ζ(1/2 + it)| ≤ 0.618 t^{1/6} log t` for `t ≥ 3`, from the numerical certificate of their §3 for `3 ≤ t < 5.5·10⁷`
  (an interval-arithmetic bound `0.595` on `[3, 200)` and the checks of the Riemann–Siegel–Lehman
  bound on `[200, 5.5·10⁷)`, lines 147–200); this is `norm_riemannZeta_criticalLine_le`. Route for
  `t ≥ 5.5·10⁷`: 4.6, dyadic blocks of the main
  sum, 4.2 with their improved second and third derivative tests for the phase
  `(t/2π) log(rK + x)` (Lemmas 2.5–2.6, lines 109–141, themselves from 4.1 and 4.3), with the
  parameters of lines 201–556.
- (Hiary, Theorem 1.1, `hiary2016zeta` lines 65–66) `|ζ(1/2 + it)| ≤ 1.461` for `0 ≤ t ≤ 3`, from the
  interval-arithmetic certificate of its Lemma 2.2. Hiary's `0.63 t^{1/6} log t` for `t ≥ 3` follows
  from the first item; its own proof used the incorrect Kusmin–Landau constant (4.1, Checks).
- Lehman's bound on the whole range `t ≥ 0.2`: `|ζ(1/2 + it)| ≤ 4(t/2π)^{1/4}`, from the second item
  on `[0.2, 3]` (where `4(t/2π)^{1/4} ≥ 1.6895 > 1.461`), the first on `[3, 200]` (where
  `0.618 t^{1/6} log t ≤ 4(t/2π)^{1/4}`, with margin at least `1.58`) and 4.6 above `200`; so no
  finite-range hypothesis is needed to extend Lehman's lemma below `128π`.
- (Patel and Yang, Theorem 1.1, `patelyang2024` lines 49–50) `|ζ(1/2 + it)| ≤ 66.7 t^{27/164}` for
  `t ≥ 3`. Route: 4.6, 4.2, 4.5 (the B-process) and 4.4, organized as their §3, with the numerical
  certificate of §3.1 for the parameter choices.
- (Thorner and Zaman, Proposition 2.10, `thornerzaman2024` line 317) for `χ` primitive of conductor
  `q` and real `t`, `|L(1/2 + it, χ)| ≤ 2.97655 (q|1 + it|)^{1/4}` (restated as Proposition 2.3 of
  `benligoeltwisszaman2026`, lines 145–147). Route for `χ ≠ 1`: 3.5 with
  `F(x) = L(x + it, χ)`, the functional equation on `Re s = 0`, 2.8 on the line `σ = 0` (which gives
  `|Γ((1 + a + iτ)/2)/Γ((a − iτ)/2)| ≤ (|1 + iτ|/2)^{1/2}`), and the numerical certificate
  `2 Σ_{j≥0} (−1)^j log ζ(j + 3/2) ≤ 1.4988` (lines 366–379; the sum itself is `0.74940`); for
  `χ = 1`, the first two items.
- (Hiary, Corollary 1.1 and Theorem 1.2, `hiary2016hybrid` lines 57–86) if `q > 1` is a sixth power
  and `χ` is primitive modulo `q`, then `|L(1/2 + it, χ)| ≤ 9.05 τ(q)(q|t|)^{1/6} log^{3/2}(q|t|)` for
  `|t| ≥ 200`, with `τ(q)` the number of divisors of `q` (`ArithmeticFunction.sigma 0`); the general
  form for every `χ` modulo `q` with the arithmetic functions `sqf`, `cbf`, `spf` of `q` is Theorem 1.2.
  Route: the hybrid van der Corput–Weyl lemmas of its §§3–4 (a second-derivative estimate for phases
  analytic on discs, Lemma 3.2, and the representation `χ(1 + C₁x) = e(L̃x/D₁)` on residue classes,
  Lemma 3.3), with 4.1–4.3.

*Needs:* 4.1–4.6, 3.5, 2.8; L-functions Layer 4 `dirichletData`; Mathlib
`DirichletCharacter.IsPrimitive.completedLFunction_one_sub`, `ArithmeticFunction.sigma`; the named numerical
certificates.

**Checks.**

- At `t = 3`: `0.618 · 3^{1/6} log 3 = 0.8154`, and on `3 ≤ t ≤ 60` the computed ratio
  `|ζ(1/2 + it)|/(0.618 t^{1/6} log t)` stays below `0.822`; on `[0, 3]` the maximum of
  `|ζ(1/2 + it)|` is `|ζ(1/2)| = 1.46035 ≤ 1.461`, attained at `t = 0`.
- The Patel–Yang bound is the weaker of the two below `t = e^{89.90}` and the stronger above: at
  `t = 3` it is `79.92`.
- Thorner–Zaman for `χ₄` and the quadratic character modulo `5`: on `0 ≤ t ≤ 100` the ratio stays
  below `0.334` and `0.519`.
- For `q = 64 = 2⁶`, `t = 200` the hybrid bound is `8911`, against `31.66` from Thorner–Zaman; the
  hybrid bound wins only when `log(q|t|) > 123.4` (for `τ(q) = 7`), as a Weyl-type bound in the
  conductor should.

### 4.8 Bounds on the line one

Prove (Patel, Theorem 1.1, `patel2022` lines 61–66) `|ζ(1 + it)| ≤ min(log t, (1/2) log t + 1.93,
(1/5) log t + 44.02)` for `t ≥ 3`, and (Hiary, Leong and Yang, Theorem 1 and Proposition 3,
`hiaryleongyang2025` lines 31–32 and 109–117) `|ζ(1 + it)| ≤ 1.731 log t/log log t` for `t ≥ 3`,
`|ζ(1 + it)| ≤ (1/3) log t + 4.66` for `t ≥ e¹⁶` and `≤ (8/33) log t + 12.45` for `t ≥ e⁸⁸`. Patel's
bound together with the first Hiary–Leong–Yang bound is `norm_riemannZeta_one_add_le`. Each from
the numerical certificates of its source (Patel's parameter choices, lines 914–941, and the range
`3 ≤ t ≤ 50` of the first branch; Hiary–Leong–Yang's values `A(k)`, lines 439–448). Route: the
Euler–Maclaurin approximation of `ζ(1 + it)` by `Σ_{n≤t} n^{−1−it}`, partial summation, and on dyadic
blocks Patel's corrected third, fourth and fifth derivative tests (4.4) and the recursive tests of
4.4, with 4.6 for the Riemann–Siegel part of Hiary–Leong–Yang.

*Needs:* 3.3 (the range `t ≥ 50` of the first branch), 4.1–4.6; `AsymptoticExpansions` §13.1.

**Checks.**

- `|ζ(1 + 3i)| = 0.63797 ≤ log 3 = 1.0986`, and on `3 ≤ t ≤ 60` the computed ratio to `log t` stays
  below `0.645`.
- The branches cross at `log t = 3.86` (`t = 47.5`; `(1/2) log 47 + 1.93 = 3.855 > log 47 = 3.850`) and
  at `log t = 140.3` (`t = 8.54·10⁶⁰`; Patel prints `8.261…·10⁶⁰` from unrounded constants).
- At `t = 3` the bound `1.731 log t/log log t = 20.2` is far weaker than `log 3`; it wins for very large
  `t`. Trudgian's `(3/4) log t` (`trudgian2014zeta1`, Theorem 1) is not a target: its proof uses
  Cheng and Graham's incorrect second-derivative lemma (`patel2022` lines 46–49).

### 4.9 Bounds on the lines `σ_k = 1 − k/(2^k − 2)`

For integers `k ≥ 4` and `t ≥ 3`, prove `|ζ(σ_k + it)| ≤ 1.546 t^{1/(2^k−2)} log t` (Yang,
Theorem 1.1, `yang2024` lines 53–55), for instance `|ζ(5/7 + it)| ≤ 1.546 t^{1/14} log t`. Route:
the approximate functional equation 4.5a or Euler–Maclaurin, dyadic blocks and 4.4 at order `k`, with
the numerical certificate of Yang's parameter choices.

*Needs:* 4.5a, 4.4; `AsymptoticExpansions` §13.1.

**Checks.**

- `k = 4`: `σ₄ = 1 − 4/14 = 5/7`, exponent `1/14`; at `t = 3` the bound is `1.837`, and on `3 ≤ t ≤ 60`
  the computed ratio stays below `0.387`.
- `k → ∞`: `σ_k → 1` and the exponent `1/(2^k − 2) → 0`, matching `|ζ(1 + it)| ≪ log t`.
- Convexity between the critical line and the line one gives only `t^{13/147 + ε}` at `σ = 5/7`
  (`yang2024` lines 55–58), and `13/147 > 1/14`.

### 4.9a The explicit Vinogradov mean value theorem

For integers `k ≥ 1`, `s ≥ 1` and real `P ≥ 1` let `J_{s,k}(P)` be Vinogradov's integral
`∫_{[0,1]^k} |Σ_{1≤x≤P} e(α₁x + … + α_k x^k)|^{2s} dα`, which equals the number of integer solutions
of `Σ_{i≤s} (x_i^j − y_i^j) = 0` for `1 ≤ j ≤ k` with `1 ≤ x_i, y_i ≤ P` (`ford2002vinogradov`
(1.3)–(1.4), lines 167–178). For `1 ≤ h ≤ k` and a finite set `B` of positive integers let
`J_{s,k,h}(B)` count the solutions of the same equations for `h ≤ j ≤ k` only, with `x_i, y_i ∈ B`
((1.8), lines 240–244), and let `C(P, R)` be the set of integers at most `P` all of whose prime
factors lie in `(√R, R]`. For an integer `N ≥ 1` and real `t ≥ N` let
`S(N, t) = max_{0<u≤1} max_{N<R≤2N} |Σ_{N<n≤R} (n + u)^{−it}|` (lines 121–128). In
[`Suggested.lean`](Suggested.lean), `vinogradovCount` is `J_{s,k}(P)` written as the count.

- `J_{s,k}(P)` depends on `P` only through `⌊P⌋`, is monotone in `P`, and for `s ≥ 1` vanishes when
  `P < 1`.
- The diagonal solutions give `J_{s,k}(P) ≥ ⌊P⌋^s`, and counting by the values of the power sums
  gives `J_{s,k}(P) ≥ (2s)^{−k} ⌊P⌋^{2s − k(k+1)/2}` (`ford2002vinogradov` (1.5), lines 189–201).
- For `s ≤ k` the only solutions are those with `y` a permutation of `x`: the power sums of degree
  at most `s` determine the elementary symmetric functions, by Newton's identities.

Prove:

- (Ford, Theorem 3, lines 220–234) for integers `k ≥ 1000` and `s` with
  `2k² ≤ s ≤ (k²/2)(1/2 + log(3k/8))`, and every real `P ≥ 1`,
  `J_{s,k}(P) ≤ k^{2.055k³ − 5.91k² + 3s} · 1.06^{sk + 2s²/k − 9.7278k³} · P^{2s − k(k+1)/2 + Δ_s}`
  with `Δ_s = (3/8) k² e^{1/2 − 2s/k² + 1.7/k}` (this first clause is `vinogradovCount_le_ford`, where
  `vinogradovCount` is the count of the solutions); and for every integer `k ≥ 129` there is an integer
  `s ≤ ρk²` with `J_{s,k}(P) ≤ k^{θk³} P^{2s − k(k+1)/2 + 0.001k²}` for every real `P ≥ 1`, where
  `(ρ, θ) = (3.21432, 2.3291)` for `k ≥ 200`, `(3.21734, 2.3849)` for `150 ≤ k ≤ 199` and
  `(3.22313, 2.4183)` for `129 ≤ k ≤ 149`.
- (Ford, Theorem 4, lines 283–290) for integers `k ≥ 60`, `h` with `0.9k ≤ h ≤ k − 2`, `t ≥ 1` and
  `s` with `2t ≤ s ≤ ⌊h/2⌋t`, and reals `D ≥ 10`, `P ≥ e^{Dk²}` and `η` with `2/k³ < η ≤ 1/(2k)` and
  `1/(8k) ≤ 4 log k/(Dk²η) ≤ 0.4`: `J_{s,k,h}(C(P, P^η)) ≤ e^{C} P^{E}`, where
  `E = 2s − t(h + k)/2 + t(t − 1)/2 + ηs²/(2t) + ht e^{−s/(ht)}` and `C` is the closed expression in
  `k, h, s, t, D, η` displayed with the theorem.
- (Ford, Theorem 2, lines 129–130) for integers `N ≥ 2` and real `t ≥ N`, with `λ = log t/log N`,
  `S(N, t) ≤ 9.463 N^{1 − 1/(133.66 λ²)}`.
- (Bellotti, Theorems 1.4 and 1.5, `bellotti2024` lines 183–230) under the same hypotheses
  `S(N, t) ≤ 8.7979 N^{1 − 1/(132.94357 λ²)}`; its inputs are Ford's Theorem 4 and her Theorem 1.4,
  whose second clause is the second clause of Ford's Theorem 3 with `(ρ, θ)` from her table
  (lines 216–225; for instance `(3.208630, 2.17720)` for `k ≥ 90 000` and `(3.177207, 2.40930)` for
  `129 ≤ k ≤ 137`), and whose first clause is a bound of the shape of Ford's first clause for
  `k ≥ 90 000`, on the range of `s` and with the exponent `Δ_s` of her (1.10) (lines 183–208).

Route: Ford's §§2–4 prove Theorems 3 and 4 by Wooley's efficient differencing combined with the
Arkhipov–Karatsuba device for incomplete systems (lines 214–219 and 262–282); §5 deduces the bound
for `S(N, t)` when `λ ≥ 87` from the second clause of Theorem 3 and from Theorem 4, through his
Lemma 5.1 (lines 2031–2471); §6 proves it for `λ ≤ 87`, by Weyl differencing for `λ ≤ 2.6` and by his
Lemma 6.3, which bounds `S(N, t)` through `J_{s,k}(M)`, with mean-value bounds for small `k` iterated
by his Lemmas 6.5–6.7 (Lemma 6.8 and the rows of Table 6.1, a numerical certificate). Bellotti
reruns the argument with Preobrazhenskiĭ's and Tyrina's bounds for `J_{s,k}` (`bellotti2024`
lines 173–182 and 357–386) and moves the critical value of `λ` from `87` to `84`.

*Needs:* Mathlib `Real.fourierChar` (for `e(x)`), `MeasureTheory.volume` on `[0, 1]^k`,
`Nat.primeFactors`; the numerical certificates of `ford2002vinogradov` Table 6.1 and of
`bellotti2024` §§3–4.

**Checks.**

- `J_{2,1}(2) = 6`: the equation `x₁ + x₂ = y₁ + y₂` in `{1, 2}` has `1 + 4 + 1` solutions, and by
  Parseval `∫₀¹ |e(α) + e(2α)|⁴ dα = 6`; the exponent `2s` is what matches the count, since
  `∫₀¹ |e(α) + e(2α)|² dα = 2`.
- For `s ≤ k` only the diagonal solutions exist (equal power sums up to degree `s` force equal
  multisets), for instance `J_{2,2}(3) = 2 · 3² − 3 = 15`; and `J_{s,k}(P) ≥ ⌊P⌋^s` always. In
  Theorem 3's range `s ≥ 2k² > k(k + 1)/2`, so the exponent `2s − k(k+1)/2 + Δ_s` exceeds `s`, as the
  diagonal count requires; and `Δ_s ≥ 0` is necessary, by the lower bound
  `J_{s,k}(P) ≥ (2s)^{−k} ⌊P⌋^{2s − k(k+1)/2}` ((1.5), lines 197–201) as `P → ∞`.
- At `k = 1000`: `Δ_s = 375 000 e^{−3.4983} = 11 343` at `s = 2k²`, and `Δ_s = k e^{1.7/k} = 1001.7`
  at the top of the range `s = (k²/2)(1/2 + log 375) = 3 213 463`, that is `s = 3.2135 k²`, where the
  second clause takes `ρ = 3.21432`; the factor `3/8` replaces the `1/2` of Wooley's earlier exponent
  (lines 214–217).
- The bound for `S(N, t)` beats the trivial `S(N, t) ≤ N` only when `N^{1/(133.66 λ²)} > 9.463`, that
  is `log N > 300.39 λ²` (for Bellotti's pair, `log N > 289.09 λ²`), and Ford's proof uses the
  trivial bound below `e^{300 λ²}` (lines 2292–2295); Bellotti's pair `(8.7979, 132.94357)` is
  smaller than Ford's `(9.463, 133.66)` in both entries. The shift `u ∈ (0, 1]` is what lets one bound
  serve every Hurwitz zeta function in 4.10; at `u = 1` the sum is `Σ_{N+1<m≤R+1} m^{−it}`.
- `N = 1` is outside the statement (`λ = log t/log 1` is undefined) but trivial: the sum has the
  single term `(2 + u)^{−it}`, so `S(1, t) = 1`, below both constants; with `1/λ²` read as `0` the
  bound therefore holds for every `1 ≤ N ≤ t`, the range that Ford's Lemma 7.3 assumes in 4.10.

### 4.10 Richert-type bounds

Prove for `|t| ≥ 3` and `1/2 ≤ σ ≤ 1`: `|ζ(σ + it)| ≤ A |t|^{B(1−σ)^{3/2}} log^{2/3}|t|`, and the same for
`|ζ(σ + it, u) − u^{−s}|` with `0 < u ≤ 1`, with `(A, B) = (76.2, 4.45)` (Ford, Theorem 1,
`ford2002vinogradov` lines 28–31) and `(A, B) = (70.6995, 4.43795)` (Bellotti, Theorem 1.1,
`bellotti2024` lines 60–63). Ford's pair, with `ζ(s, u)` read as `HurwitzZeta.hurwitzZeta` at the
class of `u`, is `norm_riemannZeta_le_richert`. Ford states both inequalities for `t ≥ 3`; they hold
for `t ≤ −3` by `ζ(conj s, u) = conj ζ(s, u)`. Route: the bound `S(N, t) ≤ C N^{1 − 1/(Dλ²)}` of 4.9a, with
`(C, D) = (9.463, 133.66)` for Ford's constants and `(8.7979, 132.94357)` for Bellotti's, inserted
in Ford's Lemmas 7.1–7.3 (`ford2002vinogradov` lines 3053–3222) for the passage to `ζ(s, u) − u^{−s}`.

*Needs:* 4.9a (the bound for `S(N, t)`); 4.2; Mathlib `HurwitzZeta.hurwitzZeta`, `riemannZeta`.

**Checks.**

- At `σ = 1` both read `A log^{2/3}|t|`; at `t = 10¹⁰` they give `616.7` and `572.2`, so Bellotti's
  constants are uniformly smaller (both `A` and `B` decrease).
- At `σ = 1/2` the exponent is `B/2^{3/2}`, `1.573` and `1.569`: the bound is useless on the critical
  line and exists for `σ` near `1`, where it feeds the Vinogradov–Korobov regions of 7.6.
- At `u = 1` the second inequality bounds `|ζ(s) − 1|`, which differs from `|ζ(s)|` by at most `1`;
  both are stated because the sources prove both and the Dirichlet consumers use the Hurwitz form.

### Examples

- Near the first zero `|ζ(1/2 + 14.1347i)| ≈ 0`, against `0.618 · 14.1347^{1/6} log 14.1347 = 2.545`.
- `|ζ(1 + 100i)| = 1.634` against `min(log 100, (1/2) log 100 + 1.93, …) = 4.233` (4.8).

### Dependencies

Layers 2–3; `AsymptoticExpansions` §§13.1 and Layer 5; L-functions Layer 4; Mathlib exponential sums
over `Real.fourierChar`, `ArithmeticFunction.sigma`, `HurwitzZeta.hurwitzZeta`; 4.10 depends on 4.9a, which
rests on the numerical certificates of Ford's Table 6.1 and of Bellotti's §§3–4.

## Layer 5: zero counting with explicit errors

### 5.1 Backlund's argument lemma

Let `T` be real, `σ₁ < a`, `r > a − σ₁`, and let `f` be holomorphic on an open set containing the
closed disc `D = {z : |z − (a + iT)| ≤ r}`, with `Re f(a + iT) ≠ 0` and `f(σ + iT) ≠ 0` for
`σ₁ ≤ σ ≤ a`. Put `M = max_{z ∈ ∂D} |f(z)|`. Prove that every continuous argument of
`σ ↦ f(σ + iT)` on `[σ₁, a]` satisfies
`|arg f(σ₁ + iT) − arg f(a + iT)| ≤ π (1 + log(M/|Re f(a + iT)|)/log(r/(a − σ₁)))`
(Backlund's method, `backlund1918`; `titchmarsh1986` §9.4). Route: on real `z`, the function
`g(z) = (f(z + iT) + conj f(conj z + iT))/2` equals `Re f(z + iT)`; between consecutive zeros of
`Re f(σ + iT)` the argument varies by at most `π`; the zeros of `g` in `|z − a| ≤ a − σ₁` are counted
by Jensen's bound (`ZerosOfLFunctions` 4.3) with `max_{|z−a|=r} |g| ≤ M` and `g(a) = Re f(a + iT)`.
The refinement in which the disc is replaced by the two discs of "Backlund's trick", with the
convexity bound on the far side of the critical line, is the form used by 5.2 and 5.3
(`bmor2021` Proposition 5.4, lines 473–475, which also records the constraints `1 < c < r`,
`0 ≤ 2c − σ₁ − 1/2 < 9/2` that an earlier application omitted).

The lemma is stated for an arbitrary holomorphic `f`; for a record `d` of the L-functions roadmap it
applies to *poleClearedContinuedL* `d P` (`ZerosOfLFunctions` 3.4) on any disc avoiding the poles,
with `M` bounded by 3.2. The degree and the conductor of `d` enter only through that bound, which is
how `ExplicitNumberFields` specializes it to Dedekind zeta functions.

*Needs:* `ZerosOfLFunctions` 4.3 (Jensen's bound) and 7.3 (the continuous argument along a path);
Mathlib `Complex.arg`, `Complex.log`.

**Checks.**

- `f(z) = z − b − i(T + ε)` with `σ₁ < b < a` and small `ε > 0`: `f` has no zero on the segment, its
  argument varies by nearly `π` along it, and the bound is
  `π(1 + log((r + a − b + ε)/(a − b))/log(r/(a − σ₁))) > π`.
- `f` constant, real and positive: `M = |Re f(a + iT)|`, the logarithm is `0`, and the bound `π` is
  weaker than the true variation `0`; the `+1` cannot be dropped in general (a single sign change of
  `Re f` gives a variation up to `π`).
- `r ≤ a − σ₁` makes `log(r/(a − σ₁)) ≤ 0` and the statement meaningless, which is why `r > a − σ₁`.

### 5.2 The explicit Riemann–von Mangoldt formula for `ζ`

Prove, with `N(T)` as in the Conventions:

- (Bellotti and Wong, Theorem 1.1, `bellottiwong2025` lines 31–38) for `T ≥ 30 610 046 000`,
  `|N(T) − (T/2π) log(T/(2πe))| ≤ 0.10076 log T + 0.24460 log log T + 8.08344` and
  `≤ 0.11200 log T + 0.12567 log log T + 3.77417`, the first being the smaller for `T ≥ e^{447.981}`
  (`abs_zetaZeroCount_sub_le`); given the recorded bound `|N(T) − ϑ(T)/π − 1| ≤ 2.5167` for
  `0 ≤ T ≤ 30 610 046 000` (0.4, with `ϑ = riemannSiegelTheta`), the same two bounds for every
  `T ≥ e`, which is their Theorem 1.1 as stated (`abs_zetaZeroCount_sub_le_of_recorded`); and the
  general form, their Theorem 1.2 (lines 63–74), in which the
  constants are explicit functions (their (3.11)–(3.15)) of parameters `c, r, η` with `θ_{1+η} ≤ 2.1` and of input bounds
  `|ζ(1 + it)| ≤ k₁ (log t)^{k₂}` and `|ζ(1/2 + it)| ≤ k₁' t^{k₂'} (log t)^{k₃'}`.
- (Rosser, Theorem 19, `rosser1941`) for `T ≥ 2`,
  `|N(T) − (T/2π) log(T/(2πe)) − 7/8| ≤ 0.137 log T + 0.443 log log T + 1.588`; in the normalization
  without `7/8` the constant is `2.463` (`bellottiwong2025` Table 1, line 54).

Route: `N(T) = ϑ(T)/π + 1 + S(T)` (2.9, with `ϑ` of 0.4 and `S(T)` of `ZerosOfLFunctions` 7.3), the
Stirling expansion of `ϑ(T)` (2.9), and `|S(T)|` bounded by 5.1 with the two-disc refinement, the
inputs being 3.3 and 4.8 on the line one, 4.7 and 4.9 in the strip, 3.1 for the interpolation: this
analytic argument with the parameters of their Table 2 gives both bounds for `T ≥ 30 610 046 000`
(`bellottiwong2025` lines 1024–1037), from bounds for `ζ` on vertical lines (lines 75–80) and no
input about the location of the zeros. For `e ≤ T ≤ 30 610 046 000` the bounds follow from the
recorded bound `|S(T)| ≤ 2.5167` on that range (0.4), read off Platt's isolation of the zeros below
that height (`bellottiwong2025` lines 121–124 and 1038–1054), with the expansion
`7/8 < ϑ(T)/π + 1 − (T/2π) log(T/(2πe)) < 7/8 + 1/(40T)` of 2.9: on that range
`|N(T) − (T/2π) log(T/(2πe))| ≤ 2.5167 + 7/8 + 1/(40e) = 3.4009`, below both right sides at `T = e`
(`8.184` and `3.886`), which increase with `T`. A bounded-height Riemann hypothesis alone does not
bound `S(T)` (0.4, Checks), and locating `10¹¹` zeros is not a computation a proof can carry, so
that bound is a hypothesis and the unconditional statement starts at `30 610 046 000`.

Two earlier bounds follow. Trudgian's bound in the normalization above,
`|N(T) − (T/2π) log(T/(2πe))| ≤ 0.112 log T + 0.278 log log T + 3.385` for `T ≥ e`
(`bellottiwong2025` Table 1, line 56), was proved with the logarithmic Phragmén–Lindelöf lemma that
`fiori2025` corrects (3.1, Checks); given the recorded bound for `S(T)` (0.4), it holds as a
consequence of the second bound above for `T > 387 899.2` and of that recorded bound below
(`bellottiwong2025` line 61 and lines 83–84), and is stated here as that consequence, given the
same hypothesis. Hasanalizade–Shen–Wong's bound (`hasanalizadeshenwong2022`
Corollary 1.2, constant `9.4925` after the correction recorded in `bellottiwong2025` line 58) follows
from the first bound above, whose three constants are smaller. So does the form with `7/8` in the
main term and the printed constant `9.3675`: for `T ≥ 30 610 046 000`, and for `T ≥ e` given the
recorded bound of 0.4,
`|N(T) − (T/2π) log(T/(2πe)) − 7/8| ≤ 0.1038 log T + 0.2573 log log T + 9.3675`, since
`8.08344 + 7/8 = 8.95844 < 9.3675`, `0.10076 < 0.1038`, `0.24460 < 0.2573` and `log log T ≥ 0`.

*Needs:* 5.1, 2.1, 2.9, 3.1, 3.3, 4.7, 4.8, 4.9; `ZerosOfLFunctions` 7.2–7.4; 0.4 (the recorded bound
(1.2) on `S(T)`, for `T < 30 610 046 000`); the numerical certificates of `bellottiwong2025` (its
Table 2) and of `rosser1941`.

**Checks.**

- `N(100) = 29`: the main term `(100/2π) log(100/2πe) = 28.127` plus `7/8` is `29.002`; Rosser's
  error at `T = 100` is `2.895`, Bellotti–Wong's two errors are `8.921` and `4.482`; all contain `29`.
  At this height Bellotti–Wong's bounds are the conditional ones, through `|S(100)| = 0.0024`.
- `N(1000) = 649`: main term plus `7/8` is `648.616`, Rosser's error `3.391`.
- `N(14) = 0` and `N(15) = 1` (the first ordinate is `14.1347…`): at `T = 14` the main term plus `7/8`
  is `0.432` and Rosser's error `2.379`.
- At `T = 3.0610046·10¹⁰` the main term plus `7/8` is `103 800 788 358.63` against Platt's count
  `103 800 788 359` (0.4).

### 5.3 The explicit zero count for primitive Dirichlet L-functions

For `χ` primitive of conductor `q > 1` and `T ≥ 5/7`, put `ℓ = log(q(T + 2)/(2π))`. Prove: if
`ℓ ≤ 1.567` then `N(T, χ) = 0`; if `ℓ > 1.567` then
`|N(T, χ) − ((T/π) log(qT/(2πe)) − χ(−1)/4)| ≤ 0.22737 ℓ + 2 log(1 + ℓ) − 0.5` (Bennett, Martin,
O'Bryant and Rechnitzer, Theorem 1.1, `bmor2021` lines 56–63), with `N(T, χ)` the number of zeros with
`0 < β < 1` and `|γ| ≤ T`, that is `zeroCount` of `DirichletCharacter.completedLFunction χ` on
`Icc 0 1 ×ℂ Icc (−T) T`. Route: the argument principle for the completed function (`ZerosOfLFunctions`
7.2), the gamma factor by 2.1, `S(T, χ)` by 5.1 in the form of their Propositions 5.4–5.5 with the
convexity bound of 3.2 extended to `σ < 0` (their Theorem 5.7), and the numerical certificate of
their Lemma 6.1 for `q < 935`. This is `dirichletZeroCount_explicit`.

*Needs:* 5.1, 2.1, 3.2; `ZerosOfLFunctions` 7.2, 6.5; L-functions Layer 4; Mathlib
`DirichletCharacter.completedLFunction`; the numerical certificate of `bmor2021` §6.

**Checks.**

- `ℓ ≤ 1.567` means `q(T + 2) ≤ 2π e^{1.567} = 30.11`; at `q = 3`, `T = 5/7`, `ℓ = 0.259` and the theorem
  asserts no zero with `|γ| ≤ 5/7` (the first zero of `L(s, χ₋₃)` has ordinate about `8.04`).
- `χ₄`, `T = 10`: `ℓ = 2.0333`, main term `(10/π) log(40/2πe) + 1/4 = 2.959`, error `2.182`, so
  `N(10, χ₄) ∈ [0.78, 5.14]`; the true value is `2` (the zeros `1/2 ± 6.0209…i`).
- The parity term has the sign `−χ(−1)/4`: `+1/4` for odd `χ`; at `q = 1` (excluded) the formula
  would not reduce to `2N(T)` for `ζ`, whose pole is outside the hypotheses.

### 5.4 Weighted sums over zeros

Prove:

- (Lehman, Lemma 1, `lehman1966`) if `2πe ≤ T₁ ≤ T₂` and `φ` is continuous, nonnegative and
  non-increasing on `[T₁, T₂]`, then
  `Σ′_{T₁≤γ≤T₂} φ(γ) = (1/2π) ∫_{T₁}^{T₂} φ(t) log(t/2π) dt + O*(4φ(T₁) log T₁ + 2 ∫_{T₁}^{T₂} φ(t) dt/t)`, the prime meaning that an ordinate equal to `T₁` or
  `T₂` has weight `1/2`; and with `A` in place of `2` (that is `A(2φ(T₁) log T₁ + ∫ φ/t)`) whenever
  `|N(T) − ϑ(T)/π − 1| ≤ A log T` for `T ≥ T₁` (`brentplatttrudgian2021` Lemma 1, lines 38–43).
- (Brent, Platt and Trudgian, Lemma 3 and Theorem 1, lines 54–71 and 186–197) if `φ` is `C²` on
  `[T₀, ∞)` with `φ ≥ 0`, `φ' ≤ 0`, `φ'' > 0` and `2π ≤ T₀ ≤ T₁ ≤ T₂`, then the error
  `E(T₁, T₂) = Σ′_{T₁≤γ≤T₂} φ(γ) − (1/2π)∫_{T₁}^{T₂} φ(t) log(t/2π) dt` equals
  `φ(T₂)Q(T₂) − φ(T₁)Q(T₁) + E₂` with `|E₂| ≤ 2(2.067 + 0.059 log T₁)|φ'(T₁)| + (0.059 + 1/150) φ(T₁)/T₁`,
  where `Q = N − L` with `L` their smooth main term ((4)–(5)); and the same with `T₂ = ∞` when
  `∫^∞ φ(t) log t dt < ∞`.
- (Brent, Platt and Trudgian, Corollary 1, lines 412–417) `Σ_{γ>0} γ^{−2} = 0.0231049931154189707889338104 + O*(5·10^{−28})`,
  from Theorem 1 with `φ(t) = t^{−2}` and the numerical certificate over the first `10¹⁰` zeros.

Route: Stieltjes integration against `dN(t)`, `N = L + Q`, integration by parts, and a bound for
`|Q(t)|` (5.2) and for `∫ Q` (the constants `A₀ = 2.067`, `A₁ = 0.059` for `T > 168π`, extended to
`[2π, 168π]` by the certificate of `brentplatttrudgian2021` lines 170–174).

*Needs:* 5.2; `ZerosOfLFunctions` 4.5; Mathlib `StieltjesFunction` (Stieltjes integration against
`dN`), `intervalIntegral`; the named numerical certificates.

**Checks.**

- `φ = 1` on `[T₁, T₂]` turns Lehman's lemma into the Riemann–von Mangoldt formula with error
  `4 log T₁ + 2 log(T₂/T₁)`, consistent with 5.2.
- `Σ_{γ>0} γ^{−2} = 0.023105`: the value `0.023105` that Mossinghoff and Trudgian use
  (`mossinghofftrudgian2015` lines 377–392) is an upper bound consistent with it; the first zero alone
  contributes `14.1347^{−2} = 0.005005`.
- Lehman's lemma needs `T₁ ≥ 2πe = 17.08`; Brent–Platt–Trudgian need only `T₀ ≥ 2π`, which admits
  `T₁ = 14 < γ₁` and hence the full sum over all zeros.

### Examples

- `N(100) = 29` within every bound of 5.2; `N(10, χ₄) = 2` within 5.3.

### Dependencies

Layers 2–4; `ZerosOfLFunctions` Layers 4 and 7; the numerical certificates named in 5.2–5.4.

## Layer 6: Perron's formula, mean values and large sieves

Throughout, `F(z) = Σ_{n≥1} a_n n^{−z}` converges absolutely for `Re z > κ_a`.

### 6.1 The smoothed truncated Perron formula

For `κ > 0` with `κ > κ_a`, `x ≥ 1` and `T ≥ 1`, prove
`Σ_{n≤x} a_n = (1/2πi) ∫_{κ−iT}^{κ+iT} F(z) x^z dz/z + O*(∫_{1/T}^∞ Σ_{|log(x/n)|≤u} (|a_n|/n^κ) · 2x^κ du/(Tu²))` (Ramaré, Theorem 7.1, `ramare2007eigen` lines 742–759); and the variant with a free
cut-off (Cully-Hugill and Johnston, Theorem 2.1, `cullyhugilljohnston2023` lines 141–156): with
`θ' = 2/(√(π² + 4) + π)`, for `T > 0`, `x ≥ 1` and `λ ≥ θ'/T`, the same identity holds with error
`O*((x^κ/(πλT)) Σ_n |a_n|/n^κ + (1/(πT)) ∫_{θ'/T}^{λ} Σ_{|log(x/n)|≤u} |a_n| e^{κu} du/u²)`, a
self-contained variant of Ramaré's Theorem 1.1 in `ramare2016perron`. Both are
finite when `x` is an integer, unlike the Davenport form. Route: the kernel bound of
Cully-Hugill and Johnston, Lemma 2.2 (`cullyhugilljohnston2023` line 163), stated there at height
`1` and rescaled by `z = Tw`: for `y > 0`, with `v = 1` if `y ≥ 1` and `v = 0` if `y < 1`,
`|v − (1/2πi)∫_{κ−iT}^{κ+iT} y^z dz/z| ≤ min(y^κ/(πT|log y|), |v − y^κ π⁻¹ arctan(T/κ)| + T|log y| y^κ/π)`,
which at `y = 1` is an equality, the integral being the endpoint value `π⁻¹ arctan(T/κ)` of
`TauCeti.truncatedPerronKernel_one`; then `y = x/n`, summed against `|a_n|` and rewritten as an
integral over `u`.

*Needs:* Tau Ceti `TauCeti.truncatedPerron_LSeries`, `TauCeti.truncatedPerronKernel`,
`TauCeti.truncatedPerronKernel_one`, `TauCeti.norm_truncatedPerron_LSeries_sub_sum_le`; Mathlib
`LSeries`, `LSeriesSummable`, `Real.arctan`.

**Checks.**

- `F = 1` (`a₁ = 1`, all other `a_n = 0`) at `x = 1`: the sum is `1`, the integral is
  `π⁻¹ arctan(T/κ) → 1/2`, and the error term is `∫_{1/T}^∞ 2 du/(Tu²) = 2 ≥ 1/2`; the Davenport bound
  `x^κ/(πT|log x|)` is infinite there.
- `F = 1` at `x = e^{2/T}`: the error is `2x^κ/(T log x) = x^κ`, of the size of the main term only
  because `x` is within `1/T` of a jump in the logarithmic scale.
- `θ' = 2/(√(π² + 4) + π) = (√(π² + 4) − π)/2 = 0.29130`, the positive root of `θ² + πθ − 1 = 0`; at
  `λ = θ'/T` the integral vanishes and the error is `x^κ/(πθ') Σ |a_n|/n^κ = 1.0927 x^κ Σ |a_n|/n^κ`.

### 6.1a Landau's iterated Perron identity

For an integer `j ≥ 1`, real `c > max(κ_a, 0)` and `x > 0`, prove that
`(1/2πi) ∫_{c−i∞}^{c+i∞} F(s) x^{s+j} ds/(s(s + 1)⋯(s + j))` converges absolutely and equals
`(1/j!) Σ_{n≤x} a_n (x − n)^j`, which is also the `j`-fold iterated integral
`∫₀^x ∫₀^{y_j} ⋯ ∫₀^{y₂} Σ_{n≤y₁} a_n dy₁ ⋯ dy_j`. The kernel identity below, for real `y > 0`
and `c > 0`, is Exercise 1.6.6 of Kedlaya's notes (`kedlaya2025notes` lines 773–789), stated there
for `y ≥ 0` with the integral as a limit of symmetric truncations. Route: on `Re s = c` the
integrand is at most
`x^{c+j} Σ_n |a_n| n^{−c}` times `|s(s + 1)⋯(s + j)|⁻¹ ≤ |s|^{−j−1}`, which is integrable because
`j ≥ 1`, so the series may be integrated term by term; the kernel
`(1/2πi) ∫_{(c)} y^s ds/(s(s + 1)⋯(s + j))` equals `(1 − 1/y)^j/j!` for `y ≥ 1` (move the line to the
left across the simple poles at `s = 0, −1, …, −j`, whose residues `(−1)^m y^{−m}/(m! (j − m)!)` sum
to `(1 − 1/y)^j/j!`) and `0` for `0 < y ≤ 1` (move it to the right, where there is no pole);
`y = x/n` gives the sum; and Cauchy's formula for repeated integration,
`∫₀^x (x − y)^{j−1} A(y) dy/(j − 1)!` with `A(y) = Σ_{n≤y} a_n`, gives the iterated integral.

*Needs:* Mathlib `LSeries`, `LSeriesSummable`, `Complex.integral_boundary_rect_eq_zero_of_differentiableOn`
(Cauchy's theorem on rectangles, for moving the line of integration), `intervalIntegral`.

**Checks.**

- `F = 1` (`a₁ = 1`), `j = 1`, `x = 3`: the kernel at `y = 3` is `2/3`, so the integral is
  `3 · 2/3 = 2 = (3 − 1)/1!`; at `j = 2` it is `9 · (2/3)²/2 = 2 = (3 − 1)²/2!`.
- `F = ζ` (`a_n = 1`, `κ_a = 1`), `j = 1`, `x = 2.5`: `(2.5 − 1) + (2.5 − 2) = 2.0`, and
  `∫₀^{2.5} ⌊y⌋ dy = 1 · 1 + 2 · 0.5 = 2.0`.
- The kernel is continuous at `y = 1` for `j ≥ 1` (both formulas give `0`), so an integer `x`
  needs no half weight. At `j = 0` the integral is Perron's, only conditionally convergent, and
  at `y = 1` its principal value is `1/2`, between the values `0` and `1` on either side; this is
  why `j ≥ 1` is assumed.

### 6.2 The averaged Perron formula

With the weight `w(u) = 6(u − 1)(2 − u)` on `[1, 2]` and its constant `θ' ∈ [0.8029, 0.8030]`, for
`x ≥ 1`, `T > 1`, `κ > κ_a` and `λ ≥ θ'/T` there is `T* ∈ [T, 2T]` with
`Σ_{n≤x} a_n = (1/2πi)∫_{κ−iT*}^{κ+iT*} F(s) x^s ds/s + O*(R)`, where
`R ≤ (1.785/T²)((x^κ/(2λ²)) Σ_n |a_n|/n^κ + ∫_{θ'/T}^{λ} Σ_{|log(x/n)|≤u} |a_n| (x/n)^κ du/u³)`
(Cully-Hugill and Johnston, Corollary 3.2, `cullyhugilljohnston2025` lines 375–422). Route: average
6.1's identity in `T` against `w(T'/T)` and choose `T*` by continuity; the average gains one power of
`T` and one power of `u` in the error. The same paper records errors in two averaged formulas of
Ramaré (`cullyhugilljohnston2025` lines 68–76), which are therefore not targets.

*Needs:* 6.1; Mathlib `intervalIntegral`, the intermediate value theorem.

**Checks.**

- `∫₁² w = 1` and `w(1) = w(2) = 0`, which is what lets the boundary terms of the integration by parts
  vanish.
- The error decays like `T^{−2}` against `T^{−1}` in 6.1, at the price of `u^{−3}` near `u = θ'/T`.
- At `λ = θ'/T` the integral vanishes and `R ≤ 1.785 x^κ/(2θ'²) Σ |a_n|/n^κ = 1.384 x^κ Σ |a_n|/n^κ`,
  independent of `T`: the averaged formula gains only when `λ` is much larger than `1/T`.

### 6.3 The majorant principle and Gallagher's lemma

For real frequencies `λ_n`, complex `a_n` and nonnegative `A_n` with `|a_n| ≤ A_n` (finite sums) and
`T > 0`, prove `∫_{−T}^{T} |Σ a_n e(λ_n t)|² dt ≤ 3 ∫_{−T}^{T} |Σ A_n e(λ_n t)|² dt`, the constant `3`
being optimal (Montgomery, *Ten Lectures*, Chapter 7, Theorem 3, `montgomery1994ten`); for
nonnegative `a_n`, `∫_{−T}^{T} |Σ a_n e(λ_n t)|² dt ≥ T Σ a_n²` (Logan, Theorem 1, `logan1988`); and
Gallagher's lemma: for `Σ |a_n| < ∞`,
`∫_{−T}^{T} |Σ a_n e(λ_n t)|² dt ≤ π² T² ∫_ℝ |Σ_{x < λ_n ≤ x + 1/(2T)} a_n|² dx` (Gallagher, Lemma 1, `gallagher1970`). Route: for the first two,
a Beurling–Selberg majorant and minorant of the indicator of `[−T, T]` with Fourier transform
supported in `[−1/(2T), 1/(2T)]`; for Gallagher, Plancherel against the Fejér-type kernel.

*Needs:* Mathlib `Fourier.fourierIntegral`, `Real.fourierChar`, `intervalIntegral`.

**Checks.**

- One frequency: all three left sides are `2T|a|²`; the majorant principle and Logan's bound read
  `2T ≤ 6T` and `2T ≥ T`; Gallagher's right side is `π²T² · (1/(2T)) = (π²/2) T ≥ 2T`.
- Two equal frequencies with `a = (1, −1)` and `A = (1, 1)`: the left side is `0` and the right side
  `8T`; the frequencies are not assumed distinct.
- Logan's bound fails for signed coefficients: `a = (1, −1)` at one frequency gives `0 < T · 2`.

### 6.4 The weighted Hilbert inequality with Preissmann's constant and the mean value theorem

For distinct real `λ_r` with local spacings `δ_r = min_{s≠r} |λ_r − λ_s|` and complex `u_r`, prove
`|Σ_{r≠s} u_r ū_s/(λ_r − λ_s)| ≤ π c₀ Σ_r |u_r|²/δ_r` with `c₀ = √(1 + (2/3)√(6/5)) = 1.31540…`
(Preissmann, `preissmann1984`), improving the constant `3π/2` of `AnalyticNumberTheoryPartI` §1.5a.
Consequences: for `T > 0` and complex `a₁, …, a_N`,
`∫₀^T |Σ_{n≤N} a_n n^{it}|² dt = Σ_n |a_n|² (T + O*(2π c₀ (n + 1)))`, with `π c₀` in place of `2π c₀`
for real `a_n` (Ramaré, Lemma 6.5, `ramare2016density` line 828, which states the upper bound
`∫₀^T |Σ_n a_n n^{it}|² dt ≤ Σ_n |a_n|² (T + 2π c₀ (n + 1))`; the two-sided form follows from the same
proof, which bounds the off-diagonal terms in absolute value). Route for the consequence: expand
the square; the off-diagonal is the difference of the Hilbert forms for `u_n = a_n n^{iT}` and
`u_n = a_n` divided by `i`, with `λ_n = log n` and `δ_n ≥ log(1 + 1/n) ≥ 1/(n + 1)`; for real `a_n`
the second form vanishes by antisymmetry.

*Needs:* `AnalyticNumberTheoryPartI` §1.5a (the structure of the proof, which Preissmann sharpens);
Mathlib `Matrix.IsHermitian.eigenvalues`, `intervalIntegral`.

**Checks.**

- `c₀ = √(1 + (2/3)√1.2) = √1.730297 = 1.31541`, so `π c₀ = 4.1325 < 3π/2 = 4.7124`, and `c₀ > 1`, as
  it must be if Montgomery and Vaughan's conjectured optimal constant `π` is right.
- `a = (1, 1)`: `∫₀^T |1 + 2^{it}|² dt = 2T + 2 sin(T log 2)/log 2`, whose deviation from `2T` is at most
  `2/log 2 = 2.885`, within the real-coefficient bound `π c₀ (2 + 3) = 20.66`.
- One coefficient: no off-diagonal term, and the error `0 ≤ 2πc₀ (n + 1)|a_n|²`; the `+1` in `n + 1`
  is what makes `n = 1` admissible, since `δ₁ = log 2 < 1`.

### 6.5 Weighted and maximal large sieves

Let `X ⊆ ℝ/ℤ` be finite with at least two points, `δ(x)` the distance from `x` to `X ∖ {x}`, `M` an
integer, `N ≥ 1`, and `S(x) = Σ_{M<n≤M+N} a_n e(nx)`. Prove
`Σ_{x∈X} (N + c δ(x)^{−1})^{−1} |S(x)|² ≤ Σ |a_n|²` with `c = 3/2` (Montgomery and Vaughan,
Corollary 3, `montgomeryvaughan1974`, from `AnalyticNumberTheoryPartI` §1.5a) and with `c = c₀`
(Preissmann, from 6.4). And Elliott's maximal form: if `X` is `δ`-separated with `0 < δ ≤ 1/2`, `a_n`
is supported on `1 ≤ n ≤ N` and `1 ≤ H ≤ N`, then
`Σ_{x∈X} max_{u<v≤N, v−u≤H} |Σ_{u≤n<v} a_n e(nx)|² ≤ (H + 2δ^{−1} log(e/δ)) Σ |a_n|²` (Elliott,
Lemma 1, `elliott1987`). Route: duality turns the weighted form into the weighted Hilbert inequality
with frequencies `x ∈ X` and weights `(N + c δ(x)^{−1})`; Elliott's by a dyadic decomposition of the
interval `[u, v)` and the large sieve on each scale.

*Needs:* 6.4; `AnalyticNumberTheoryPartI` §1.5a; `SieveMethodsAndPrimePatterns` §2.6 (finite
large-sieve duality) and §2.9 (the unweighted sharp form, for comparison).

**Checks.**

- `X = {0, 1/2}`, `N = 1`: `δ = 1/2` at both points, so the weights are `(1 + 2c)^{−1}`, equal to `1/4`
  for `c = 3/2` and `0.2754` for `c = c₀`; the left side is `2 · 0.2754 |a|² ≤ |a|²`.
- For equally spaced `X = {k/R}` the weighted form gives `Σ |S|² ≤ (N + cR) Σ |a_n|²`, weaker than
  the sharp `(N − 1 + R)` of `SieveMethodsAndPrimePatterns` §2.9 when `c ≥ 1`; the weighted form wins
  for unevenly spaced `X`, which is its purpose.
- Elliott's bound at `H = 1` is `(1 + 2δ^{−1} log(e/δ)) Σ |a_n|²`, larger than the trivial
  `|X| max |a_n|² ≤ δ^{−1} Σ |a_n|²`, as a maximal inequality must allow.

### 6.6 Mean squares of `ζ` on vertical lines

Prove (Dona, Helfgott and Zuniga Alterman, Theorem 1.2, `donahelfgottzunigaalterman2022`
lines 105–120): for `T ≥ 4`, `∫₁^T |ζ(σ + it)|² dt` is at most `(π²/6) T + 18.48 √T` if `σ = 1`;
`ζ(2σ) T + 5.22 max{T^{2−2σ} log T, √T}/((σ − 1/2)(1 − σ)²)` if `1/2 < σ < 1`;
`T log T + 2.0 T √(log T) + 23.06 T` if `σ = 1/2`;
`ζ(2 − 2σ) T^{2−2σ}/((2π)^{1−2σ}(2 − 2σ)) + 10.34 T/(σ²(1/2 − σ))` if `0 < σ < 1/2`; and `(π/24) T² + 9.37 T log T` if `σ = 0`. And the tails
(Theorem 1.1, lines 78–99): `∫_T^∞ |ζ(σ + it)/(σ + it)|² dt` is at most `π²/(6T) + 28.29 log T/T²` for
`σ = 1`, `T ≥ 200`; `(3π/5) log T/T + 7.72/T` for `σ = 1/2`, `T ≥ 200`, and `log T/T + 9.19 √(log T)/T`
for `σ = 1/2`, `T ≥ 1040`; with the forms of lines 82–99 for the other `σ`. This is the published form
of Helfgott's bounds (`helfgott2017mo`). Also (Simonič, `simonic2020` lines 89–92) for `T ≥ 2000`,
`∫₀^T |ζ(1/2 + it)|² dt ≤ T log T − (1 + log 2π − 2γ) T + 70.26 T^{3/4} √(log(T/2π))`; and (Kadiri,
Theorem 1.4, `kadiri2013density` lines 137–162) for `0.5208 < σ₀ < 0.9723`, `10³ ≤ H ≤ H₀ =
3.061·10¹⁰` and `T ≥ H₀`, `(T − H)⁻¹ ∫_H^T |ζ(σ₀ + it)|² dt ≤ ζ(2σ₀) + E₁(σ₀, H)` and
`∫_H^T log|ζ(σ₀ + it)| dt ≤ ((T − H)/2) log(ζ(2σ₀) + E₁(σ₀, H))`, with `E₁ = ε₁ + ε₂ + ε₃` the closed
forms of its (1.7)–(1.10). Route: the mean value theorem 6.4 applied to the approximations 4.5a,
Plancherel for the Mellin transform (for the tails), and Jensen's inequality for the logarithmic form.

*Needs:* 4.5a, 6.4; Mathlib `mellin`, `riemannZeta`, `Real.eulerMascheroniConstant`.

**Checks.**

- At `T = 4`, `σ = 1/2`: the bound is `107.2`, and at `σ = 1` it is `43.54`; both far above the true
  integrals, as the constants are tuned for large `T`.
- The main term `T log T` exceeds the true `T log(T/2π) + (2γ − 1)T` because
  `log 2π = 1.838 > 2γ − 1 = 0.154`; Simonič's main term is the true one, with the secondary error `70.26 T^{3/4} √log(T/2π)`.
- The tail at `σ = 1` has main term `π²/(6T) = ζ(2)/T`, the integral of the mean value `ζ(2)` of
  `|ζ(1 + it)|²` against `t^{−2}`.

### Examples

- `F = ζ(z)`, `a_n = 1`: 6.1 at `x = 10.5`, `κ = 2`, `T = 100` gives `10 = (1/2πi)∫ … + O*(…)` with the
  error dominated by `n = 10, 11`.
- The mean value of `|1 + 2^{it}|²` is `2`, within 6.4.

### Dependencies

Layer 4 (4.5a); `AnalyticNumberTheoryPartI` §1.5a; `SieveMethodsAndPrimePatterns` §§2.6, 2.9; Tau
Ceti truncated Perron formula; Mathlib Fourier analysis and Mellin transform.

## Layer 7: zero-free regions with explicit constants

### 7.1 The partial-fraction identities

For `s` not a zero or a pole, prove
`−Re (ζ'/ζ)(s) = Re 1/(s − 1) + (1/2) Re ψ(s/2 + 1) − (1/2) log π − Σ_ρ Re 1/(s − ρ)`, the sum over the
zeros of `ζ` in the critical strip with multiplicity, taken as the limit of the sums over `|γ| ≤ T`;
and for `χ` primitive of conductor `q > 1` with parity `a`,
`−Re (L'/L)(s, χ) = (1/2) log(q/π) + (1/2) Re ψ((s + a)/2) − Σ_ρ Re 1/(s − ρ)`. For `Re s > 1` every
summand is positive and the series converge absolutely. Route: the logarithmic derivative of
Hadamard's product for the entire completion (`ZerosOfLFunctions` 5.5), with `Re B = −Σ_ρ Re(1/ρ)`
(`ZerosOfLFunctions` 5.6 for `ζ` and real characters, 6.4d for non-real ones) and the gamma factor
by `ZerosOfLFunctions` 1.4; the uniform convergence of the truncated sums from the local zero count
(`ZerosOfLFunctions` 4.5) (Davenport §12, `davenport2000`).

*Needs:* `ZerosOfLFunctions` 1.4, 4.5, 5.5, 5.6, 6.4d; Mathlib `Complex.digamma`,
`DirichletCharacter.completedLFunction`.

**Checks.**

- At `s = 2`: `−ζ'/ζ(2) = 0.569961`, and the right side is `1 + (1/2) ψ(2) − (1/2) log π − Σ_ρ Re 1/(2 − ρ)
  = 1 + 0.211392 − 0.572365 − Σ_ρ Re 1/(2 − ρ)`, so the zero sum is `0.069066`; the first pair of zeros
  contributes `2 · 1.5/(1.5² + 14.1347²) = 0.014848`.
- At `s = 2` the term `Re 1/(s − 1) = 1` is the pole; without it the zero sum would be negative,
  contradicting the positivity of each summand.
- For `χ₄` (`q = 4`, `a = 1`) the constant is `(1/2) log(4/π) = 0.120782`; using `log q` without
  `1/2`, or `log(q/2π)`, changes it.

### 7.2 Ford's intermediate region

Let `J(t) = min((1/4) log t + 1.8521, (1/6) log t + log log t + log 3)` and
`c₆(t) = 0.05635 (J(4t + 1) − J(t) + 0.155 (log log(4t + 1) − log log t))/(J(t) + 0.155 log log t + 0.675)`.
Given `RH(545 439 823)` (0.4), prove: for `t ≥ 5.45·10⁸`, `ζ(σ + it) ≠ 0` for
`1 − σ ≤ (0.04962 − c₆(t))/(J(t) + 0.155 log log t + 0.675)` (Ford, Theorem 3, `ford2002zerofree`
lines 96–103, with `c₆` as in his (9.9), lines 1342–1346); for `t ≥ 1.88·10¹⁴`, where the second
branch is the minimum in `J`, the narrower region
`σ ≥ 1 − (0.04962 − 0.0196/(J(t) + 1.15))/(J(t) + 0.685 + 0.155 log log t)` with
`J(t) = (1/6) log t + log log t + log 3` (the form recorded in `mty2024` lines 107–112), which the
first implies since there `c₆(t) < 0.0196/(J(t) + 1.15)` and `0.675 < 0.685`; and for `|t| ≥ 3`,
`ζ(σ + it) ≠ 0` for `σ ≥ 1 − 1/(8.464 log|t|)` (Theorem 4, lines 104–106: the bound of Theorem 3
times `log t` decreases in `t`, and below `5.45·10⁸` the hypothesis applies). With the input
`0.618 t^{1/6} log t` of 4.7 in place of `3t^{1/6} log t`, the same argument gives Theorem 3 with
`log 0.618` in place of `log 3` in `J` (the substitution of `yang2024` lines 79–80), in which the
second branch is the minimum for every `t > 1`, since `log L − L/12 ≤ log 12 − 1 = 1.4849` lies
below `1.8521 − log 0.618 = 2.3334` for `L = log t > 0`. Its exact form, for `t ≥ 5.45·10⁸`, is the
region 7.4 uses. Its simplified form, the narrower region above with `log 0.618` in place of
`log 3`, follows for `t ≥ 5.45·10⁸` in the same way and holds for `|t| ≥ 3` (`yang2024` (1.4),
lines 77–80), since below `5.45·10⁸` its width `1 − σ` stays below `0.0584` and the hypothesis
applies; it is the region 8.5 uses (`bellotti2025density` lines 352–356). Route: Ford's method
(the positivity of `Re Σ_k a_k (−ζ'/ζ)(σ + ikt)` against a smoothed explicit formula), with the
zeros below `5.45·10⁸` on the critical line by the hypothesis (`ford2002zerofree` lines 324 and
1272) and the bound for `|ζ(1/2 + it)|` that Ford takes as input, which is implied by 4.6 and 4.7:
the bound `min(6t^{1/4} + 57, 3t^{1/6} log t)` follows from Lehman's `4(t/2π)^{1/4}` and from
`0.618 t^{1/6} log t`, and Ford's argument is monotone in that input (`ford2002zerofree`
lines 137–143 record that the proof of the original input by Cheng and Graham is invalid).

*Needs:* 7.1, 4.6, 4.7, 0.4, 0.5 (Ford's polynomial); the numerical certificate of
`ford2002zerofree` §§8–9.

**Checks.**

- At `t = 3`, Theorem 4 excludes zeros with `σ ≥ 0.89246`; Ford's region in the form of `mty2024`
  is narrower than MTY's classical region (7.3) at `t = 1.88·10¹⁴` (`0.004238` against `0.005473`
  for `1 − σ`) and they cross at `t = e^{64.1}` (`0.0028064` against `0.0028065`), as `mty2024`
  lines 113–119 record.
- `4/(2π)^{1/4} = 2.528 < 6`, so Lehman's bound is below `6t^{1/4} + 57` for every `t > 0`; and
  `0.618 < 3`.
- The reading of `c₆` and the passage to Theorem 4: at `t = 5.45·10⁸` (`log t = 20.11630`, where the
  first branch `6.88117` is the minimum in `J`), the exact region with `log 3` times `log t` is
  `0.118151`, just above `1/8.464 = 0.118147`. With `log 3` the two branches of `J` cross at
  `log t = 32.87`, that is `t = 1.88·10¹⁴`, the threshold of the form of `mty2024`.
- The exact against the simplified form, with `log 0.618`: at `t = 10¹⁰`, `J = 6.49299` and
  `c₆ = 0.0021981 < 0.0196/(J + 1.15) = 0.0025645`, and the regions have `1 − σ ≤ 0.0061956` and
  `≤ 0.0061397`; at `t = e^{170.2}` they are `0.0014271` and `0.0014215`.

### 7.3 Kadiri's criterion and the classical region

Let `f_n = (a_k)` be admissible (0.5) with `A = f_n(0) − a₀ = Σ_{1≤k≤n} a_k`, `T₀ > 0` with `RH(T₀)`,
`R > r > 0` such that every zero of `ζ` with `|γ| ≥ 2` has `β ≤ 1 − 1/(R log|γ|)` (an established
region in the form with `>`: no zero with `|γ| ≥ 2` and `β > 1 − 1/(R log|γ|)`), and `t₀ ∈ [1, T₀]`.
Let the smoothing `h` be a nonnegative function on `[0, d₁]`, `d₁ > 0`, twice continuously
differentiable there and extended by `0` beyond `d₁`, with `h(d₁) = h'(0) = h'(d₁) = h''(d₁) = 0`
and with a Laplace transform of nonnegative real part on `Re z ≥ 0` (`jangkwon2014` lines 215–217
and 353–354, conditions (1) and (4); `mty2024` lines 1281–1284). Put `g₁ = h(0)`,
`m = max_{[0, d₁]} |h''|` and `K(w) = ∫₀^{d₁} (a₁ e^{−u} − a₀) h(u) e^{wu} du`. With `η₀, σ₀, w₀` as in
(2.1) of `mossinghofftrudgian2015` (lines 164–166), `δ` and `κ` as there (lines 182–213, with the
`g₁` and `m` of `h`), and the error term `C(η)` of Kadiri's (52)–(64) with Mossinghoff and
Trudgian's refinements (lines 296–440), prove: if the numerical certificate holds — `C(η) ≤ 0` for
`0 ≤ η ≤ η₀`, and `K` is nondecreasing on `[w₀, 1]` — then every zero of `ζ` with `|γ| ≥ 2` has
`β ≤ 1 − 1/(R₀ log|γ|)`, that is `ζ` has no zero with `|γ| ≥ 2` and `β > 1 − 1/(R₀ log|γ|)`, for
every `R₀ ≥ max(r, A g₁ (1 − κ)/(2 K(w₀)))`, and likewise with the refined bound (3.1) of
`mossinghofftrudgian2015` (line 263), `(A/2) g₁ (1 − κ) min_{0<η₁≤η₀} max(1/K(w₁), 1/(K(w₀) − C(η₁)))`,
in place of `A g₁ (1 − κ)/(2 K(w₀))` (Kadiri's method, `kadiri2005` criterion (10);
`mossinghofftrudgian2015` (2.2)–(3.1), lines 221–225; `jangkwon2014` (6), lines 440–441). The method
takes a hypothetical zero `ρ₀ = β₀ + iγ₀` with `1 − 1/(r log γ₀) ≤ β₀ ≤ 1 − 1/(R log γ₀)` and proves
`β₀ ≤ 1 − 1/(R₀ log γ₀)` (`mossinghofftrudgian2015` lines 157–163), so it gives the region with `>`;
the region with `≥` (no zero with `β ≥ 1 − 1/(R₀ log|γ|)`) follows for every `R₀` strictly larger
than the maximum. The smoothings of the instances below are Heath-Brown's and Xylouris':

- `h^{(4)}_θ` for `θ ∈ (π/2, π)` (Kadiri's `h_θ`), with `d₁ = −2θ cot θ` and
  `g₁ = sec²θ (3 − θ tan θ − 3θ cot θ)` (`mossinghofftrudgian2015` lines 167–179; `mty2024` (9.1),
  lines 1317–1323, at `λ = 1`);
- `h^{(1)}_θ` for `θ ∈ (0, π/2)`, with `d₁ = 2θ cot θ` and `g₁ = (θ tan θ + 3θ cot θ − 3) sec²θ`
  (`mty2024` (9.2), lines 1335–1340 and 1366–1368, at `λ = 1`);
- Xylouris' `h^{(5)}_γ = g ∗ g` on `(0, 2γ)`, where `g(t) = c₁ cos(x₁t) + c₂ cosh(x₂t) − c₃` on
  `[−γ, γ]` and `0` outside, `c₃` making `g(±γ) = 0` (`jangkwon2014` lines 556–568).

Instances, each with its source's polynomial certificate, smoothing and numerical certificate:

- `R₀ = 5.69693` (Kadiri, Théorème 1.1, `kadiri2005`; the value of the published version, quoted in
  `jangkwon2014` line 13, `mossinghofftrudgian2015` line 111 and `mty2024` line 1279; the preprint
  prints `5.70176`), from `R = 9.645908801`, the polynomial `(0.91 + cos φ)²(0.265 + cos φ)²`,
  `h^{(4)}_θ` with `θ = 1.848`, and Kadiri's `T₀ = 3 330 657 430.697` (`mossinghofftrudgian2015`
  lines 226–229), so given `RH(30 610 046 000)`, the least recorded verification above that height,
  in the form with `≥`: the computation gives the maximum `5.696924…` (`mossinghofftrudgian2015`
  line 240), below the printed value;
- `R₀ = 5.68371` (Jang and Kwon, Proposition 11, `jangkwon2014` lines 10–15 and 603), from Kadiri's
  region and `RH(30 610 046 000)`, with Xylouris' smoothing `h^{(5)}_γ` at `γ = 0.509607`
  (Proposition 10, lines 570–598), in the form with `≥` as stated there;
- `R₀ = 5.573412` (Mossinghoff and Trudgian, Theorem 1, `mossinghofftrudgian2015` lines 117–118),
  from `R = 5.7`, `RH(3.06·10¹⁰)`, their degree-16 polynomial `F₁₆` (Table 5), `h^{(4)}_θ` with
  `θ = 1.85573` (line 265) and the sum
  `Σ_{γ>0} γ^{−2} ≤ 0.023105` (5.4), in the form with `>` as stated there; the form with `≥` at
  `5.573412` follows from the next instance, since `1/(5.573412 log|γ|) < 1/(5.558691 log|γ|)`;
- `R₀ = 5.558691` (Mossinghoff, Trudgian and Yang, Theorem 1.3, `mty2024` lines 96–97 and §9), in the
  form with `≥`, from `R = 5.573412` in the form with `>` (which is what the hypothesis asks for),
  `RH(3·10¹²)`, the polynomial `F₁₆`, the smoothing `h^{(1)}_θ` with `θ = 1.13489` (lines 1362–1368),
  for which `C(η) ≤ 0` on `[0, 1/(5 log(3·10¹²))]` and `K` increasing on `[0, 1]` are verified
  (lines 1374–1377), and seven iterations (Table 3); stated given `RH(3·10¹²)`, this instance is
  `riemannZeta_ne_zero_classical`;
- `R₀ = 4.896` for `t ≥ 3`, in the form with `>`: no zero with `t ≥ 3` and `β > 1 − 1/(4.896 log t)`
  (Bellotti, Trudgian and Yang, Theorem 1, `bellottitrudgianyang2026` line 67, an unrefereed
  preprint): their Lemma 1 for `3 ≤ t ≤ exp(76.47)` from `RH(3·10¹²)`, and the Littlewood-type
  region 7.4 above.

The regions are antitone in `R₀`: for `R₀ ≥ R₀'` the region of `R₀` lies inside that of `R₀'`, so the
`5.558691` instance gives the region with `≥` for every `R₀ ≥ 5.558691`, among them `5.573412` and
`5.5666305` (the constant that Mossinghoff and Trudgian recorded for a verification of the Riemann
hypothesis up to `3·10¹¹`, `mty2024` lines 86–87). And, given `RH(3·10¹²)`, `ζ` has no zero with
`|γ| ≥ 21` and `β ≥ 1 − 1/(9.645908801 log(|γ|/17))`: for `21 ≤ |γ| ≤ 3·10¹²` that boundary lies to
the right of `1/2`, because `log(21/17) = 0.21130 > 2/9.645908801 = 0.20734`; and for
`|γ| > 3·10¹²` it lies inside the `5.558691` region, because
`9.645908801 log(|γ|/17) ≥ 5.558691 log|γ|` as soon as `log|γ| ≥ 9.645908801 log 17/4.087218 = 6.6864`.

Given `RH(545 439 823)`, the starting region `R = 9.645908801` follows from 7.2 for `|γ| ≥ 3`
(Theorem 4 has `8.464 < 9.645908801`) and from the hypothesis itself for `2 ≤ |γ| < 3`, where the
boundary `1 − 1/(9.645908801 log|γ|) ≥ 0.85` lies right of `1/2`. Route of the criterion: suppose a zero `ρ₀ = β₀ + iγ₀` just outside
the region; apply `Σ_k a_k Re(−ζ'/ζ)` at the points `σ + ikγ₀`, smoothed by the Laplace transform of
`h`; bound the zero sums by 7.1 with the zeros below `T₀` on the line by `RH(T₀)`, the tail by
Lehman's lemma (5.4) and the gamma terms by 2.7.

*Needs:* 7.1, 7.2, 0.4, 0.5, 2.7, 5.4; 7.4 (for the `4.896` instance); the named polynomial and
numerical certificates.

**Checks.**

- At `|t| = 2` the region of `5.558691` is `σ ≥ 0.740461`, and at `|t| = 3·10¹²` it is
  `σ ≥ 0.993738`; below height `3·10¹²` it follows from `RH(3·10¹²)` alone, since the region lies in
  `σ > 1/2` for `|t| ≥ 2` (`1/(5.558691 log 2) = 0.2595 < 1/2`).
- The boundary: at `|t| = 3·10¹²` (`log|t| = 28.72963`) the boundary point of the `5.573412` region
  is `σ = 1 − 0.0062452 = 0.9937548`, which the form with `>` does not exclude; it lies inside the
  `5.558691` region `σ ≥ 0.9937382`, so the form with `≥` at `5.573412` holds as a consequence. For
  `4.896`, the smallest constant, no such consequence exists and only the form with `>` is asserted
  (its boundary at that height is `σ = 0.9928907`).
- The constants decrease along the chain `9.645908801 > 8.464 > 5.69693 > 5.68371 > 5.573412 >
  5.558691 > 4.896`, and a smaller constant gives a wider region; the preprint's `5.70176` is weaker
  than the published `5.69693`, so stating the published value is the stronger claim, supported by
  three later papers.
- The region with `log(|γ|/17)`: at `|γ| = 21` its boundary is `β = 0.509388`, right of `1/2`, so
  `RH(3·10¹²)` gives it; at `|γ| = 20` the boundary would be `β = 0.362100`, left of `1/2`, where
  `RH(3·10¹²)` says nothing about it, which is why the statement starts at `21`. At `|γ| = 10⁴` the
  boundary is `0.983743`, narrower than the `5.558691` region (`0.980468`), as it is for every
  `|γ| ≥ e^{6.6864} = 801.5`.
- The criterion needs `a₀ < a₁`: for `(1, 1)` the factor `a₁e^{−u} − a₀ = e^{−u} − 1` is `≤ 0` on
  `[0, d₁]`, so for a nonnegative smoothing `h` the integral `K(w)` is `≤ 0` and no positive `R₀`
  results.
- The threshold of the criterion, at Kadiri's first iterate (`jangkwon2014` lines 442–445): with the
  polynomial `(0.91 + cos φ)²(0.265 + cos φ)²`, whose coefficients `a₀, …, a₄` are
  `1.3646158, 2.3292025, 1.4314625, 0.5875, 0.125` (so `A/a₀ = 3.27797`), `h^{(4)}_θ` at
  `θ = 1.848` (`d₁ = 1.05162`, `g₁ = 147.8411`),
  `w₀ = 0.579471` and `κ = 0.44213`, the value `A g₁ (1 − κ)/(2 K(w₀))` is `5.94294`, Kadiri's
  `5.942924085` up to the rounding of `w₀` and `κ`; the reading `A g₁/((1 − κ)² K(w₀))` would give
  `68.46`, larger by the factor `2/(1 − κ)³ = 11.52`. Jang and Kwon's final step (lines 597–598)
  has the same shape, `R₀ = (A/2)(1 − κ) h(0)/K(w₀)` with `κ = 0.439672` and `R₀ = 5.68371`.

### 7.4 The Littlewood-type region

Given `RH(30 610 046 000)` (0.4), prove: `ζ(σ + it) ≠ 0` for `|t| ≥ 3` and
`σ > 1 − log log|t|/(21.233 log|t|)` (Yang, Corollary 1.2, `yang2024` lines 88–89); this is
`riemannZeta_ne_zero_littlewood`. Route, for `t ≥ 3` (the case `t ≤ −3` by `ζ(s̄) = conj ζ(s)`), with
`L = log t`:

- for `t ≤ 30 610 046 000` (`L ≤ 24.1446`) the hypothesis, since the boundary
  `1 − log L/(21.233 L) ≥ 1 − 1/(21.233 e) = 0.98267` lies right of `1/2`;
- for `30 610 046 000 < t < e^{41}` the region of 7.3 at `R₀ = 5.573412`, in the form with `>`,
  given the verification up to `3.06·10¹⁰` that the hypothesis implies: it contains this one while
  `log L ≤ 21.233/5.573412 = 3.80970`, that is `L ≤ 45.137`;
- for `e^{41} ≤ t < e^{170.2}` Ford's region 7.2 in its exact form with `log 0.618`, which contains
  this one for `40.898 ≤ L ≤ 185.64`;
- for `t ≥ e^{170.2}` Yang's argument (`yang2024` lines 2326–2372): the bounds 4.9 and 4.10
  interpolated by 3.1, the degree-46 polynomial of `mty2024` (a polynomial certificate), Ford's
  zero-detecting argument, and the exact region of 7.2 again for the zeros with
  `e^{170.2} − 1 ≤ t' < e^{170.2}` (lines 2366–2370).

Yang takes the verification only up to `5.45·10⁸` and the simplified region of 7.2 from there
(lines 2328–2333). That region contains this one only for `50.13 ≤ L ≤ 170.26`, Ford's exact region
only for `40.898 ≤ L ≤ 185.64`, and Theorem 4's region `σ ≥ 1 − 1/(8.464 log t)` nowhere on
`20.12 ≤ L ≤ 171`; with the regions stated here, the least recorded verification of 0.4 that covers
`20.12 ≤ L < 40.898` is `RH(30 610 046 000)`, through the regions of 7.3 that it gives.

*Needs:* 0.4, 0.5, 3.1, 4.7, 4.9, 4.10, 7.1, 7.2, 7.3 (its `5.573412` instance); the named
certificates.

**Checks.**

- At `t = e^{200}` the region has `1 − σ = log 200/(21.233 · 200) = 0.0012477`, wider than the
  classical `1/(5.558691 · 200) = 0.0008995`; the factor `log log t` is what eventually beats every
  classical constant.
- For `|t| < e^{e}` the numerator `log log|t|` is below `1`, and at `|t| = 3` it is `0.094`: the region
  is then narrower than the classical one, which is why both are kept.
- The statement is strict (`σ >`), unlike 7.3; at the boundary nothing is asserted.
- The verification is needed above `5.45·10⁸` (negative control): at `t = 10¹⁰` (`L = 23.02585`) the
  region claims `1 − σ < 0.0064156`, while Ford's exact region with `log 0.618` gives `0.0061956`, its
  simplified form `0.0061397` and Theorem 4 `0.0051311`, so `RH(545 439 823)` with 7.2 does not give
  it there; `RH(30 610 046 000)` does, and just above that height (`L = 24.1446`) the `5.573412`
  region gives `0.0074312` against the required `0.0062108`.
- At `L = 47` the classical regions fall short: `5.558691` gives `0.0038276` and `5.573412` gives
  `0.0038175`, against `0.0038581`, while Ford's exact region gives `0.0038820`; at `L = 100` the
  simplified form of 7.2 also suffices (`0.0021959` against `0.0021689`).
- Yang's step at `t₀ = e^{170.2}` needs `1 − β' ≥ M₁ log log t'/log t'` for the zeros with
  `t₀ − 1 ≤ t' < t₀`, with `M₁ = 0.0470978` (lines 2338 and 2366–2370), that is `0.0014215052`: the
  exact region of 7.2 gives `0.0014271`, while the simplified one gives `0.0014214873`, which would
  serve only with `M₁ ≤ 0.0470972`, still above `1/21.233 = 0.0470965`.

### 7.5 Regions for Dirichlet L-functions

Prove the following. The products in the first, third and fourth items include the principal
characters, whose L-functions vanish in the open strip exactly at the zeros of `ζ`, and so does the
sum over the powers `χᵏ` in the proof of the second item (`kadiri2018` lines 142–147 and 668–669,
where McCurley's region is applied to every `χᵏ`, the principal one included); Platt's theorem
(0.3) says nothing about `ζ`, so each of the first four items is stated given a recorded
verification (0.4), which with a region for `ζ` keeps the zeros of `ζ` out of each region below;
the fifth item concerns only zeros with `|γ| ≥ 1000` and treats `ζ` as the case `k = 1`, and needs
no verification. For the second, third and
fourth items `RH(545 439 823)` suffices: it puts the zeros of `ζ` with `|γ| < 3` on `Re s = 1/2`, left
of every boundary there (each is at least `0.8374`), and for `|γ| ≥ 3` Ford's region
`σ ≥ 1 − 1/(8.464 log|t|)` (7.2, given the same verification) contains McCurley's region and
Lu–Zaman–Zhao's, since `log max(q, q|t|) ≥ log|t|` and `8.464 < 9.645908801 < 10`. The first item is
stated given `RH(3·10¹²)`: below height `2` that hypothesis puts the zeros of `ζ` on `Re s = 1/2`,
left of the boundary (at least `1 − 1/(6.4355 log 2) = 0.7758`), and for `|t| ≥ 2`,
`6.4355 log max(q, q|t|) ≥ 6.4355 log(2|t|) ≥ 5.558691 log|t|` puts its region inside the
`5.558691` region of 7.3.

- (Kadiri, Théorème 11.1, `kadiri2002thesis` lines 1958–1980, English form (115) at lines 2063–2068)
  given `RH(3·10¹²)`, for `q ≥ 2`, the product `L_q(s) = ∏_{χ mod q} L(s, χ)` has at most one zero
  with `σ > 1 − 1/(6.4355 log max(q, q|t|, 1.7367))`, and such a zero is real, simple and belongs to
  a real non-principal character; with Rumely's verified heights as input, which 0.3 implies.
- (Kadiri, Theorem 1.1, `kadiri2018` lines 16–18; `LFunction_ne_zero_kadiri`) given
  `RH(545 439 823)`, for `3 ≤ q ≤ 400 000` and `χ` non-principal primitive modulo `q`, `L(s, χ) ≠ 0`
  for `Re s ≥ 1 − 1/(5.60 log(q max(1, |Im s|)))`, from `GRH(q, H(q))` of 0.3 (`kadiri2018`
  lines 130–135), McCurley's region of the third item for the zeros of the `L(s, χᵏ)` (lines 142–147
  and 668–669) and the zero counts of 5.2 and 5.3 for the sums over those zeros.
- (McCurley, Theorem 1, `mccurley1984`, as sharpened in `thornerzaman2024` Lemma 2.3, lines 164–170)
  given `RH(545 439 823)`, for `q ≥ 3`, `∏_{χ mod q} L(s, χ)` has at most one zero with
  `Re s ≥ 1 − 1/(9.645908801 log max(q, q|Im s|))`; such a zero exists only if `q > 400 000`, and is
  then real, simple and a zero of `L(s, χ₁)` for a unique quadratic `χ₁` modulo `q`
  (`LFunction_zeroFree_mcCurley`, with the zeros read through `meromorphicOrderAt`). And
  (Theorem 2.6, lines 219–226), given `RH(545 439 823)`, for `Q ≥ 3`, the
  product of `L(s, χ)` over primitive `χ` of conductor at most `Q` has the same region with
  `max(Q, Q|Im s|)`, except possibly one zero `β₁(Q)`; if `β₁(Q) ≥ 1 − 1/(9.645908801 log Q)` then
  `Q > 400 000`, `β₁(Q)` is simple and a zero of `L(s, χ₁)` for one primitive `χ₁` of conductor
  `q₁ ∈ (400 000, Q]`, and `β₁(Q) ≤ 1 − 100/(√q₁ log² q₁)` (7.7).
- (Lu, Zaman and Zhao, Corollary 1.2, `luzamanzhao2026` lines 15–20 and 44) given
  `RH(545 439 823)`, for `q ≤ 10¹⁰`, `∏_{χ mod q} L(s, χ)` has no zero with `σ > 1 − 1/(10 log max(q, q|t|, 10))`, from
  7.8 and McCurley's region.
- (Ramaré and Rumely, Theorems 3.6.2 and 3.6.3, `ramare-rumely-1996` lines 795–848) for `χ`
  primitive of conductor `k ≥ 1` (at `k = 1`, `L(s, χ) = ζ(s)`) and `R = 9.645908801`: every zero
  `β + iγ` of `L(s, χ)` with `|γ| ≥ 1000` satisfies `1 − β ≥ 1/(Rℓ − 3.2356 √ℓ)` with
  `ℓ = log(k|γ|/4.1718)`; and, for `H ≥ 1000`, every zero with `|γ| ≥ H` satisfies
  `1 − β ≥ 1/(R log(k|γ|/C₁(k, H)))`, where `C₁(k, H) = C₁ exp(G₁(Δ)/(R G₂(Δ)))` is the closed form
  of their Theorem 3.6.3: `C₁ = 4.171838431` and `R` are their (3.6.6), `Δ = 1/(xR log(kH/C₁))`
  with `x = √w − 1`, and `G₁`, `G₂` are their functions of `Δ` built from (3.6.7) with
  `D = D*(k, 1 + Δ)`, the sum over the primes `p ∣ k` of `log p` times the local constants
  `D*_p` of their (3.4.2)–(3.4.3); `C₁(k, H) ≥ C₁`, since `G₁/G₂ ≥ 0` (their Lemma 3.6.1). The
  zeros of an imprimitive character are those of its primitive character together with zeros on
  `Re s = 0`, which satisfy both bounds. Hence the form for a modulus: for `q ≥ 1`, `H ≥ 1000` and
  `0 < C ≤ C₁(k, H)` for the conductor `k` of every character modulo `q`, every zero `β + iγ` with
  `0 < β < 1` and `|γ| ≥ H` of `L(s, χ)`, `χ` modulo `q`, satisfies `1 − β ≥ 1/(R log(q|γ|/C))`,
  since `q|γ|/C ≥ k|γ|/C₁(k, H)` (`k ≤ q`) and `R log(k|γ|/C₁(k, H)) ≥ 15` (the proof of their
  Theorem 3.6.3, line 843), so that the logarithm is positive and only grows.

Route: the analogue of 7.3 with `−Re L'/L` from 7.1 summed over `χ^k`, the real-character case
handled by the positivity of `ζ(s)L(s, χ)`'s Dirichlet coefficients, the verified heights for small
conductors, and for the principal characters the region of 7.2 (second to fourth items) or of 7.3
(first item). For the fifth item, McCurley's argument with a degree-four cosine polynomial (0.5),
the passage from `χᵐ` to its primitive character through the local constants `D*_p`, and the
numerical certificate of their Lemma 3.6.1 (the monotonicity of `G₁/G₂` and of `G(1 + Δ)` on
`[0, 0.062]`, checked on subintervals of length `0.001`).

*Needs:* 0.3, 0.4, 0.5, 5.2, 5.3, 7.1, 7.2, 7.3, 7.7, 7.8; `ZerosOfLFunctions` 6.3 (*IsExceptionalZero*);
`ComputationalNumberTheory` §4.22; Mathlib `DirichletCharacter.LFunction`, `MulChar.IsQuadratic`;
the named certificate of `ramare-rumely-1996` Lemma 3.6.1.

**Checks.**

- `q = 3`, `t = 0`: Kadiri's 2018 region is `σ ≥ 0.837457`, and `L(s, χ₋₃)` has no real zero in
  `(0, 1)` at all (`ComputationalNumberTheory` §4.24), consistent.
- The verification is needed for the principal characters: the factor `L(s, χ₀)` modulo `3` is
  `(1 − 3^{−s}) ζ(s)`, and a zero of `ζ` at `0.95 + 2i` (which no unconditional statement here
  excludes) would lie in McCurley's region at `q = 3`, whose boundary at `|t| = 2` is
  `1 − 1/(9.645908801 log 6) = 0.94214`; `RH(545 439 823)` puts it on `Re s = 1/2`. At `|t| = 10⁹`
  the boundary is `0.99525`, inside Ford's region `σ ≥ 1 − 1/(8.464 log 10⁹) = 0.99430`.
- `1/9.645908801 = 0.103671`, and at `Q = 3` the region is `σ ≥ 0.905635`; the exception is impossible
  there because `3 ≤ 400 000`.
- The products range over all characters modulo `q` in Kadiri's and McCurley's forms and over
  primitive characters of conductor at most `Q` in Thorner–Zaman's; at `q = 10¹⁰` Lu–Zaman–Zhao's
  region is `σ > 0.995657`.
- Ramaré–Rumely at `k = 1`, `|γ| = 1000`: `ℓ = 5.47941` and the first bound is `1 − β ≥ 0.022085`;
  the source prints "less than `0.02194`" (line 814), and its proof uses only that the bound is
  below `1/2`, so that zeros with `β ≤ 1/2` satisfy it.
- At `k = 3`, `|γ| = 10⁴` the first bound is `0.013155`, and the second with the source's value
  `C₁(3, 10⁴) = 20.92` (line 846) is `0.014264`; McCurley's region of the third item gives
  `1/(9.645908801 log(3·10⁴)) = 0.010056` there and Kadiri's `5.60` region `0.017322`. Dividing by
  `C₁(k, H) > 1` inside the logarithm is what widens the region; a reading with `k|γ| C₁` would
  give `0.007766`, narrower than McCurley's.
- The form for a modulus is weaker at an imprimitive character: modulo `6`, for the character
  induced by `χ₋₃` (`k = 3`) at `|γ| = 10⁴` with `C = 20.92`, it gives
  `1/(R log(6·10⁴/20.92)) = 0.013022`, below the `0.014264` of the conductor form; replacing `k` by
  `q` only enlarges the logarithm.
- At `k = 1`, `|γ| = 5.45·10⁸` the source's `C₁ = 38.31` (line 845) gives `0.0062943`, wider than
  Ford's `1/(8.464 log|γ|) = 0.0058732` (7.2) and narrower than the region `0.0089428` of 7.3.

### 7.6 Vinogradov–Korobov regions

Given `RH(3·10¹²)`, prove that `ζ(σ + it) ≠ 0` for `|t| ≥ 3` and
`1 − σ ≤ 1/(c (log|t|)^{2/3}(log log|t|)^{1/3})` with `c = 57.54` (Ford, Theorem 5,
`ford2002zerofree` lines 135–136), `c = 55.241` (Mossinghoff, Trudgian and Yang, Theorem 1.1,
`mty2024` lines 53–54; `riemannZeta_ne_zero_vinogradovKorobov`) and `c = 54.004` (Bellotti,
Theorem 1.2, `bellotti2024` lines 81–82), sharpened to `c = 53.989` in the published version of that
theorem (as quoted in `bellotti2025density` lines 362–365); and for sufficiently large `|t|`, effectively, with `c = 0.05507 B^{−2/3}` given Richert's bound with constant
`B` (Ford, Theorem 1, lines 32–34; `c = 1/49.13` at `B = 4.45`), `c = 48.1588` (`mty2024`
Theorem 1.2) and `c = 48.0718` (`bellotti2024` Theorem 1.3). For Dirichlet L-functions (Khale,
Theorem 1.1, `khale2024` lines 24–26): for `q ≥ 3` and every `χ` modulo `q`, `L(σ + it, χ) ≠ 0` for
`|t| ≥ 10` and `σ ≥ 1 − 1/(10.5 log q + 61.5 (log|t|)^{2/3}(log log|t|)^{1/3})`. Route: Richert-type
bounds 4.10 inserted in the zero-detecting inequality of 7.1 with an admissible polynomial (degree 40
in `mty2024`), the intermediate regions 7.2–7.4 below the threshold, and the numerical certificates
of the sources; for Khale, McCurley's region (7.5) for `|t| ≤ e^{1944}`.

*Needs:* 0.4 (`RH(3·10¹²)`), 4.10, 7.1–7.5, 0.5; the named certificates.

**Checks.**

- At `|t| = e^{1000}` the three regions give `1 − σ ≤ 9.125·10⁻⁵`, `9.505·10⁻⁵` and `9.723·10⁻⁵`, in the
  order of the constants.
- Bellotti's constant: the arXiv text read here has `54.004`, the published version of her
  Theorem 1.2 has `53.989`, the value with which `bellotti2025density` uses the region in 8.5 for
  `|T| > e^{481958}`. Both are asserted; since `53.989 < 54.004`, the published region is the wider
  one and implies the other.
- Khale at `q = 3`, `|t| = 10`: `σ ≥ 0.991109`, narrower than Kadiri's `5.60` region there, as a
  Vinogradov–Korobov region is only better for very large `|t|`.

### 7.7 Real zeros of quadratic L-functions

Prove (Bordignon, Theorem 1.3, `bordignon2019` lines 63–71): for a non-principal real primitive
character `χ` of conductor `q`, a real zero `β₀` of `L(s, χ)` satisfies `β₀ ≤ 1 − 800/(√q log² q)` if `χ`
is odd and `q > 4·10⁵`; `β₀ ≤ 1 − 515/(√q log² q)` if `χ` is even and `4·10⁵ < q ≤ 10⁷`; and
`β₀ ≤ 1 − 80/(√q log² q)` if `χ` is even and `q > 10⁷` (these three bounds, for every real zero, are
`LFunction_real_zero_le_bordignon`; real zeros `β₀ ≤ 0` satisfy them trivially); and
(`bordignon2020` Theorem 1.3, lines 64–66)
`β₀ ≤ 1 − 100/(√q log² q)` for even `χ` and `q > 4·10⁵`. And (Ralaivaosaona and Razakarinoro,
Theorem 1.1 of the journal version, with constant `6.035`; Theorem 1 of arXiv v2,
`ralaivaosaonarazakarinoro2026` lines 69–76, with constant `6.5`) for `−d` a fundamental
discriminant with `d > 3·10⁸`, `L(s, χ_{−d})` has no real zero `β ≥ 1 − 6.035/√d`. Route: a real zero gives
`L(1, χ) = (1 − β₀) L'(σ*, χ)` for some `σ* ∈ (β₀, 1)`; an upper bound for `|L'(σ, χ)|` near `1`
(`|L'| ≤ (1/8) log² q` in `bordignon2020` lines 56–62) and a lower bound for `L(1, χ)` through the
class number formula (`L(1, χ) ≥ 12.52/√q`, from the class-number data of Watkins and of Bennett et
al., numerical certificates) give the bound; `q ≤ 4·10⁵` is `ComputationalNumberTheory` §4.24.

*Needs:* `AnalyticNumberTheoryPartI` §0.34a (Kronecker characters); `ComputationalNumberTheory` §4.24;
the named certificates.

**Checks.**

- At `q = 4·10⁵`: `800/(√q log² q) = 0.007602` (odd) and `100/(√q log² q) = 0.000950` (even).
- At `d = 3·10⁸`: `6.035/√d = 0.000348`; Theorem 1 of the arXiv version read here prints
  `6.5/√d = 0.000375` (`ralaivaosaonarazakarinoro2026` lines 69–76), a wider zero-free interval. The
  statement asserted here is the journal's narrower one, which the arXiv statement implies, since
  `1 − 6.5/√d < 1 − 6.035/√d`.
- The zero-free interval shrinks like `q^{−1/2}`, so for `q > 4.7·10⁶` the uniform gap of 7.9
  (`3·10⁻³/log q`) is larger than Bordignon's even bound `100/(√q log² q)`.

### 7.8 Real zeros for conductors up to `10¹⁰`

Prove (Lu, Zaman and Zhao, Theorem 1.1, `luzamanzhao2026` lines 39–42;
`LFunction_real_ne_zero_luZamanZhao`): for `q ≤ 10¹⁰` and every quadratic `χ` modulo `q`, `L(σ, χ) ≠ 0` for real `σ ≥ 1 − 1/(5 log q)`, from
`ComputationalNumberTheory` §4.24 for `q ≤ 4·10⁵` and the numerical certificate of their explicit
inequality (2.5) for `4·10⁵ < q ≤ 10¹⁰`. Route: their Theorem 2.1, an explicit inequality between
`−ζ'/ζ(σ)`, `−L'/L(σ, χ)` and a finite prime sum that a real zero in the interval would violate (7.1,
Mertens-type explicit sums).

*Needs:* 7.1; `ComputationalNumberTheory` §4.24; the named certificate.

**Checks.**

- At `q = 10¹⁰` the interval is `[0.991314, 1)`.
- For `q = 4` the statement says `L(σ, χ₄) ≠ 0` on `[1 − 1/(5 log 4), 1) = [0.855730, 1)`, and indeed
  `L(σ, χ₄) > 0` on `[0, 1]`.
- Imprimitive quadratic characters are included: their extra Euler factors vanish only on
  `Re s = 0`.

### 7.9 The numerical Landau–Siegel gap

Define *HasLandauSiegelGap* `c Q`, for real `c` and a conductor cap `Q ∈ ℕ ∪ {∞}`, as: for every
primitive real nonprincipal Dirichlet character `χ` of conductor `q` with `3 ≤ q ≤ Q` and every real
zero `β ∈ (0, 1)` of `L(s, χ)`, `(1 − β) log q ≥ c`. `AnalyticNumberTheoryPartI` §0.34 proves
`∃ c > 0, HasLandauSiegelGap c ∞`. Prove *HasLandauSiegelGap* `(1/5) 10¹⁰` (Lu, Zaman and Zhao,
Theorem 1.1, `luzamanzhao2026` lines 39–42): for `3 ≤ q ≤ 10¹⁰`, 7.8 excludes real zeros in
`[1 − 1/(5 log q), 1)`, so every real zero in `(0, 1)` has `(1 − β) log q > 1/5`. Prove
*HasLandauSiegelGap* `(3.0·10⁻³) ∞` (Banks, Theorem 1.1, `banks2026` lines 89–107, an unrefereed
preprint): for `q ≥ 10¹⁰` from the explicit form of the argument of §0.34 (Banks §§2–7, with the
constants of its Remark 7.1), and for `q ≤ 10¹⁰` from the first instance, since `3.0·10⁻³ < 1/5`.
Prove *HasLandauSiegelGap* `(1/100) ∞` (Guo, Theorem 1.1, `guo2026` lines 54–56, an unrefereed
preprint), with the strict inequality `(1 − β) log q > 1/100` for every conductor `q ≥ 3`, by one
choice of parameters and without a zero computation for small conductors (lines 23–26 and 57–61):
the Frobenius method with integer coefficient counting, polynomial congruences, a paired-tail
hyperbola estimate and a logarithmically weighted comparison of positive sums (its §§2–5). By
antitonicity it implies Banks's instance.

- Antitone in both arguments: `c ≤ c'`, `Q ≤ Q'` and *HasLandauSiegelGap* `c' Q'` give
  *HasLandauSiegelGap* `c Q`.
- Trivial cases: *HasLandauSiegelGap* `c Q` holds for every real `c` when `Q ≤ 400 000`, since no
  primitive character of conductor at most `400 000` has a real zero in `(0, 1)`
  (`ComputationalNumberTheory` §4.24); and for every `Q` when `c ≤ 0`, since `(1 − β) log q > 0`.
- Zero-free form: *HasLandauSiegelGap* `c Q` holds if and only if, for every such `χ`, `L(σ, χ) ≠ 0`
  for every real `σ` with `0 < σ < 1` and `σ > 1 − c/log q`; the endpoint `σ = 1 − c/log q` is not
  excluded.
- Against 7.5: for a modulus `q ≤ Q`, *HasLandauSiegelGap* `c Q` with `c > 1/9.645908801` excludes
  the possible exceptional zero of McCurley's region (a real zero of a quadratic character modulo `q`
  with `(1 − β) log q ≤ 1/9.645908801`, inherited from the primitive character of conductor
  `d ∣ q`, `d ≥ 3`, with `(1 − β) log q ≥ (1 − β) log d`); at `c = 1/9.645908801` exactly a zero on
  the boundary of that region is not excluded; at `c = 3.0·10⁻³` the zero is confined to
  `1 − β ≥ c/log q`.

*Needs:* `AnalyticNumberTheoryPartI` §§0.34, 0.34a; 7.5, 7.8; `ComputationalNumberTheory` §4.24;
`ZerosOfLFunctions` 6.3; Mathlib `MulChar.IsQuadratic`, `DirichletCharacter.IsPrimitive`.

**Checks.**

- `q = 3`: the instance `(3.0·10⁻³, ∞)` excludes zeros with `β > 1 − 0.002731`, the instance
  `(1/5, 10¹⁰)` those with `β > 1 − 1/(5 log 3) = 1 − 0.182048`, far more at this conductor (and
  §4.24 excludes every real zero there).
- At `q = 10¹⁰` the uncapped instance gives `1 − β ≥ 1.303·10⁻⁴`, against `8.686·10⁻³` from the
  capped one; the uncapped instance matters only above `10¹⁰`, and at `q = 10¹¹`, outside the cap,
  it is all there is: `1 − β ≥ 3.0·10⁻³/log 10¹¹ = 1.184·10⁻⁴`.
- `1/5 > 1/9.645908801 = 0.103671 > 1/100 > 3.0·10⁻³`: the capped instance removes McCurley's
  exceptional zero for every modulus up to `10¹⁰`, the two uncapped ones for none.
- Guo's instance at `q = 3`, `10¹⁰` and `10¹¹`: `1 − β > 0.009102`, `4.343·10⁻⁴` and `3.948·10⁻⁴`,
  against Banks's `0.002731`, `1.303·10⁻⁴` and `1.184·10⁻⁴`; it is the stronger uncapped instance at
  every conductor, and below `10¹⁰` the capped instance `(1/5, 10¹⁰)` is stronger than both.
- The lower bound `3 ≤ q` excludes no character: a primitive real nonprincipal character has
  conductor at least `3` (the character modulo `1` is principal, and no character modulo `2` is
  primitive), so `log q ≥ log 3 > 0`; a definition through the modulus of an imprimitive character
  would be weaker, since the character modulo `6` induced by `χ₋₃` has the real zeros of `L(s, χ₋₃)`
  and `log 6 > log 3`.

### 7.10 The reciprocal of `ζ` near the line one

Prove:

- (Hiary, Leong and Yang, Theorem 2, `hiaryleongyang2025` lines 41–43) given `RH(30 610 046 000)`
  (0.4), which 7.4 uses, `1/|ζ(1 + it)| ≤ 431.7 log t/log log t` for `t ≥ 3`; this is
  `inv_norm_riemannZeta_one_add_le`. The proof uses Yang's region at every height from `t₀ = 500`
  on (lines 1013–1017 and 1157), so it needs the verification that 7.4 needs.
- (Leong, Corollary 4, `leong2026` lines 140–176, arXiv v5) given `RH(3 000 175 332 800)` (0.4),
  `1/|ζ(1 + it)| ≤ 29.388 log t` for `t ≥ 2`; `1/|ζ(σ + it)| ≤ 30.812 log t` for every real
  `σ ≥ 1` and `t ≥ 13`; and `1/|ζ(σ + it)| ≤ 7.59·10³¹ log t` for `t ≥ 13` and
  `σ ≥ 1 − 1/(5.56 log t)` (the row `W = 5.56` of his Table 4, line 1547, quoted as (12) in
  `leeLeong2022` lines 155–167), a region inside that of 7.3. The hypothesis enters through
  Leong's bound for `|ζ'/ζ|` on `σ ≥ σ₀ > 1/2` and `t₀ ≤ t ≤ H₀ − 1/2`, `H₀ = 3 000 175 332 800`
  (his Corollary 3, lines 78–79, 121–136 and 986), which his Corollaries 1 and 2, and through them
  Corollary 4, use below that height (lines 1249–1276 and 1411).
- (Lee and Leong, Theorem 1.1 (6), `leeLeong2022` lines 100–111, arXiv v5, an unrefereed preprint)
  given `RH(3 000 175 332 800)`, for `t ≥ 3 000 175 332 800` and `σ ≥ 1 − 1/(5.56 log t)`,
  `1/|ζ(σ + it)| ≤ 1237 (log t)^{11/12}`; the region lies inside the `5.558691` region of 7.3, as
  their requirement `W > Z₁` asks (lines 242–243).
- (Lee and Leong, Lemma 4.3, `leeLeong2022` lines 1084–1159) given `RH(3 000 175 332 800)`, for
  `σ ≥ 3/4` and `14 ≤ t ≤ 3 000 175 332 800 − 1/2`,
  `1/|ζ(σ + it)| ≤ 29.388 t^{4.964} log t ≤ e^{146} log t`: for `σ ≥ 1` it is the second item,
  and for `3/4 ≤ σ < 1` the integral of `Re ζ'/ζ` from `σ` to `1` is at most `4.964 log t` by
  Leong's Corollary 3 on five strips of width `1/20` (lines 1135–1158). The source prints the range
  up to `3 000 175 332 800`; its proof takes Leong's Corollary 3, which holds up to
  `H₀ − 1/2` (`leong2026` lines 78–79), so that every disc of radius `1/2` it uses lies below the
  verified height, and the range here is that of the proof. Above it the third bound of the
  second item applies in the classical region.

Route: for the first item, the Borel–Carathéodory and Hadamard three-circle method with the
Richert-type bound 4.10, Yang's region 7.4 (`hiaryleongyang2025` lines 1013–1022), the bounds of
Ramaré for `|ζ'/ζ|` near the line one (`ramare2016density`), and the numerical certificate for
`2 ≤ t ≤ 500` (lines 1171–1175). For the others, the identity
`log(1/|ζ(σ + it)|) = −Re log ζ(1 + δ₁ + it) + ∫_σ^{1+δ₁} Re (ζ'/ζ)(x + it) dx` (`leong2026` (42),
lines 1300–1315), the first term by a nonnegative trigonometric polynomial (0.5) and 3.4, the
integral by bounds for `|ζ'/ζ|` inside zero-free regions: by Borel–Carathéodory from bounds for
`|ζ|` near the line one (4.8, 4.10) in the region of 7.3 above the verified height, and from the
hypothesis below it; for the second item the numerical certificate of `leong2026` (49) for
`2 ≤ t ≤ 500` (lines 1520–1545); for the third, Lee and Leong's splitting of the integral into
many short steps across the region, each with a locally optimised bound for `ζ'/ζ`
(`leeLeong2022` lines 249–257), a numerical certificate.

*Needs:* 0.4, 0.5, 3.4, 4.8, 4.10, 7.3, 7.4; Mathlib `Complex.borelCaratheodory`;
the named certificates.

**Checks.**

- `1/|ζ(1 + 3i)| = 1.5675 ≤ 431.7 log 3/log log 3 = 5043`; on `3 ≤ t ≤ 300` the computed ratio of
  `1/|ζ(1 + it)|` to the bound stays below `0.0027`.
- `1/|ζ(1 + it)|` is unbounded as `t → ∞` (`titchmarsh1986` §8.6), so no constant bound is possible.
  The shape `log t/log log t` is that of Weyl's method; for very large `t` it is weaker than the
  order `(log t)^{2/3}(log log t)^{1/3}` that the Vinogradov–Korobov region gives, and the
  constant `431.7` is what makes it the useful bound at moderate heights.
- At `t = 13`: `1/|ζ(1 + 13i)| = 1.37875`, Leong's line bound is `29.388 log 13 = 75.379`, his
  bound on `σ ≥ 1` is `30.812 log 13 = 79.031`, and the first item gives
  `431.7 log 13/log log 13 = 1175.5`. The first item implies the bound `30.812 log t` only once
  `log log t ≥ 431.7/30.812 = 14.011`, and is below `29.388 log t` only once
  `log log t > 14.690`, that is `log t > 2.397·10⁶`; and it says nothing for `σ > 1`.
- The half-plane bound is not the line bound: at `t = 13` the maximum of `1/|ζ(σ + 13i)|` over
  `1 ≤ σ ≤ 5` is `1.37903`, attained near `σ = 1.030`, above the value `1.37875` at `σ = 1`;
  for large `σ` the value tends to `1`, and `1/|ζ(σ + it)| ≤ ζ(σ)/ζ(2σ)` for `σ > 1`.
- Lee and Leong's region and constant at `t = 3 000 175 332 800` (`log t = 28.72969`): the region
  is `σ ≥ 0.9937397`, inside the `5.558691` region `σ ≥ 0.9937382` of 7.3, and the bound is
  `1237 · 28.72969^{11/12} = 26 864`, against `885.2` from `30.812 log t` on `σ ≥ 1`; the factor
  `(log t)^{−1/12} = 0.756` is the saving over the shape `log t`.
- The bound below the verified height: `29.388 · (3 000 175 332 800)^{4.964} = e^{145.995} ≤ e^{146}`;
  at `σ = 3/4`, `t = 14` the true value `1/|ζ(3/4 + 14i)| = 4.9554` is far below
  `29.388 · 14^{4.964} log 14 = 3.79·10⁷`. The line `σ = 1/2` is excluded: `1/ζ` has a pole at the
  zero `1/2 + 14.1347…i`, inside the range of `t`; the hypothesis puts every zero with
  `|γ| ≤ 3 000 175 332 800` on that line, at distance at least `1/4` from `σ ≥ 3/4`. A zero with
  ordinate just above that height and real part between `3/4` and `0.99289` (the boundary there
  of the widest region of 7.3, `R₀ = 4.896`), which no statement here excludes, would make `1/ζ`
  unbounded near `σ + i·3 000 175 332 800` for such `σ`, which is why the range stops half a unit
  below the height.
- Leong's classical-region bound at `t = 13`: the region is `σ ≥ 1 − 1/(5.56 log 13) = 0.929879`,
  where `1/|ζ(0.929879 + 13i)| = 1.37567` against `7.59·10³¹ log 13 = 1.95·10³²`; the constant
  falls quickly as the region narrows (`1719` at `W = 13`, Table 4, line 1555), and above the
  verified height Lee and Leong's `1237 (log t)^{11/12}` replaces it.

### Examples

- `ζ(σ + 100i) ≠ 0` for `σ ≥ 1 − 1/(5.558691 log 100) = 0.960935`; the zero `1/2 + 101.3178…i` lies
  well to the left.
- For `χ₋₃`, Kadiri's region and §4.24 together say that `L(s, χ₋₃)` has no zero in
  `σ ≥ 0.837457` for `|t| ≤ 1`.

### Dependencies

Layers 0–5; `ZerosOfLFunctions` Layers 1, 4–6; `AnalyticNumberTheoryPartI` §§0.34, 0.34a;
`ComputationalNumberTheory` §§4.22, 4.24; 4.10, and through it 4.9a, for 7.4, 7.6, 7.10; the named
certificates.

## Layer 8: zero-density estimates

Two counts of the zeros of `ζ` occur, each with multiplicity, and every bound below is stated for
the count of its source. `N(σ, T)` counts the zeros with `β ≥ σ` and `0 < γ ≤ T`, that is
`zeroCount completedRiemannZeta univ (Icc σ 1 ×ℂ Ioc 0 T)`; it is Kadiri's count
(`kadiri2013density` lines 42–43, whose `0 ≤ γ` adds nothing, `ζ` having no zero in `(0, 1)`), and
it is `zetaZeroCountRight σ T` in [`Suggested.lean`](Suggested.lean).
`N°(σ, T)` counts the zeros with `σ < β < 1` and `0 < γ < T` (`kadirilumleyng2018` (1.1), line 19;
`bellotti2025density` line 21); it is `zetaZeroDensityCount σ T`. Since `N°(σ, T) ≤ N(σ, T)`, a bound
for `N` bounds `N°`. The converse fails: `N(σ, T)` also counts zeros on the line `β = σ` and at height
`T`, so a bound for `N°` at one value of `σ` is not a bound for `N` there.

### 8.1 Kadiri's density bound

Let `H₀ = 3.061·10¹⁰` and assume `RH(H₀)` (0.4). For `σ ≥ 0.55`, `T ≥ H₀`, `0.5208 < σ₀ < 0.9723`
with `σ₀ < σ`, and `10³ ≤ H ≤ H₀`, prove `N(σ, T) ≤ b₁(T − H) + b₂ log(T/H) + b₃` with `b₁, b₂, b₃` the closed forms of
(6.3) in `kadiri2013density` (Theorem 1.1, lines 46–50); in particular, from the numerical certificate
of its Table 1, `N(σ, T) ≤ 0.5561 T + 0.7586 log T − 268 658` for `σ ≥ 17/20` and
`N(σ, T) ≤ 0.4421 T + 0.6443 log T − 363 301` for `σ ≥ 0.90` (lines 53–54 and the rows `σ = 0.85`
and `σ = 0.90` of Table 1, lines 655 and 660; the second as quoted in `kadirilumleyng2018` line 59),
both for `T ≥ H₀`; these two instances, given `RH(30 610 046 000)`, are `zetaZeroCountRight_le_kadiri`. Route: Littlewood's lemma for a mollified `ζ` on
rectangles `[σ, 1.5002] × [H, T]`, Jensen's inequality with the mean value 6.6 (Kadiri's Theorem 1.4)
and the one-sided approximation of 4.5a, and `RH(H₀)` for the zeros below `H₀`.

*Needs:* 4.5a, 6.6, 0.4 (`RH(30 610 046 000)`, which implies `RH(H₀)`); `ZerosOfLFunctions` 7.2; the
named certificate.

**Checks.**

- The count is one-sided: the bound at `σ = 17/20` is for `N(σ, T)`, not for `2N(σ, T)`.
- At `T = H₀` the two bounds are `1.70·10¹⁰` and `1.35·10¹⁰`, below the trivial `N(H₀)/2 = 5.19·10¹⁰`
  and consistent with the true value `0` (all zeros below `H₀` lie on the line).
- The slope `0.5561 < 1/(2π) log(T/2π)` for `T ≥ H₀`: a bound with slope at least that of `N(T)`
  would be no better than trivial.

### 8.3 The Kadiri–Lumley–Ng density bound

Let `H₀ = 3.0610046·10¹⁰`. Let `10⁹/H₀ ≤ k ≤ 1`, `d > 0`, `H ∈ [1002, H₀)`, `α > 0`, `δ ≥ 1`,
`η₀ = 0.23622…`, `η ∈ (η₀, 1/2)`, `1 + η₀ ≤ μ ≤ 1 + η`, and `σ > 1/2 + d/log H₀`. Given `RH(H₀)`,
prove: for every `T ≥ H₀`,
`N°(σ, T) ≤ ((T − H) log T/(2πd)) log(1 + C₁ (log kT)^{2σ} (log T)^{4(1−σ)} T^{8(1−σ)/3}/(T − H)) + (C₂/(2πd)) log² T`, hence
`N°(σ, T) ≤ (C₁/(2πd)) (log kT)^{2σ} (log T)^{5−4σ} T^{8(1−σ)/3} + (C₂/(2πd)) log² T`, with `C₁ = C₁(α, d, δ, k, H, σ)` and `C₂ = C₂(d, η, k, H, μ, σ)` the closed forms
(4.72)–(4.73) of `kadirilumleyng2018` (Theorem 1.1, lines 74–81). From the numerical certificate of
its Table 1: `N°(9/10, T) < 11.499 (log T)^{16/5} T^{4/15} + 3.186 log² T` for `T ≥ H₀` (lines 83–87),
which is `zetaZeroDensityCount_nine_tenths_lt`.
Route: Ingham's argument with a general smoothing weight, the argument of a holomorphic function
bounded by 5.1, the mean value 6.4 for the mollified sums, the critical-line bound
`|ζ(1/2 + it)| ≤ 0.63 t^{1/6} log t` (which 4.7 implies) and `RH(H₀)`.

*Needs:* 0.4, 4.7, 5.1, 6.4, 6.6; the named certificate.

**Checks.**

- At `σ = 0.90` the exponent of `T` is `8(1 − σ)/3 = 4/15`, and the power of `log T` is
  `2σ + 5 − 4σ = 16/5` at `k = 1`; at `T = H₀` the bound is `1.91·10⁸`, below Kadiri's `1.35·10¹⁰`.
- The source used Hiary's `0.63`; the corrected bound `0.618` of 4.7 is smaller, so the argument goes
  through unchanged.
- The statement is for `T ≥ H₀` only: a form "`T ≥ 1`" with smaller constants is not what the paper
  proves.
- The count is `N°`, with `β > 9/10` and `γ < T` strict: a zero with `β = 9/10` exactly would be
  counted by `N(9/10, T)` and not by `N°(9/10, T)`, and the bound at the single value `σ = 9/10` says
  nothing about it. Given `RH(H₀)`, `N°(9/10, H₀) = 0`, consistent with the bound `1.91·10⁸`.

### 8.4 Log-free densities for Dirichlet L-functions

For real `Q ≥ 3` let `𝓛(s, Q)` be the product of `L(s, χ)` over the primitive characters of
conductor at most `Q` (the trivial character modulo `1`, with L-function `ζ`, included), `β₁(Q)` its
largest real zero, `N(σ, Q)` the number of its zeros with `β > σ` and `|γ| ≤ Q`, counted with
multiplicity, and `N*(σ, Q)` the same count without `β₁(Q)`. In [`Suggested.lean`](Suggested.lean)
`primitiveLZeroCount Q S` is the number of zeros of `𝓛(s, Q)` in a set `S`, the sum of the orders
of its factors (the pole of `ζ` at `1` counts `0`), and `largestRealZero Q` is `β₁(Q)`, the
supremum of the real zeros of the factors. Given `RH(3·10¹²)`, for `σ ≥ 39/40` prove
`N(σ, Q) ≤ 10^{88} (10^{421} Q^{99})^{1−σ}` and
`N*(σ, Q) ≤ 10^{93} min(1, (1 − β₁(Q)) log Q) (10^{466} Q^{170})^{1−σ}` (Thorner and Zaman, Theorem 1.2,
`thornerzaman2024` lines 31–43 and 64–65; `primitiveLZeroCount_le_thornerZaman`). The proof uses the
verification for the zeros of `ζ`, through their Lemma 2.1 (lines 156–158, used at lines 853 and
1193). Route: Turán's power-sum method with a pre-sifted large sieve (`SieveMethodsAndPrimePatterns`
§2.9), the zero-free region 7.5 and explicit Deuring–Heilbronn repulsion through the zeros near
`β₁(Q)`.

- `β₁(Q)` is well defined for `Q ≥ 3`: the real zeros of the factors include `−2`, a trivial zero of
  `ζ`, and none is `≥ 1` (`riemannZeta_ne_zero_of_one_le_re`,
  `DirichletCharacter.LFunction_ne_zero_of_one_le_re`; the pole of `ζ` at `1` has negative order), so
  the supremum is attained; for `Q ≥ 5` it lies in `[0, 1)`, since `L(0, χ) = 0` for the even
  character modulo `5` (`thornerzaman2024` line 66).
- `N(σ, Q)` and `N*(σ, Q)` are monotone in `Q` and antitone in `σ`, and `N* ≤ N`, with equality
  when `β₁(Q) ≤ σ`.

*Needs:* 0.4, 7.5, 7.1; `SieveMethodsAndPrimePatterns` §2.9; Mathlib `DirichletCharacter.IsPrimitive`,
`meromorphicOrderAt`.

**Checks.**

- At `Q = 3`, `σ = 39/40`: `log₁₀` of the first bound is `88 + (421 + 99 log₁₀ 3)/40 = 99.71`; the
  estimate is log-free (no power of `log Q`) and its constants are not small.
- At `Q = 3` the factors are `ζ` and `L(s, χ₋₃)`: `N(39/40, 3) = 0` (no zero of either with
  `|γ| ≤ 3` off the trivial ones, the first zero of `L(s, χ₋₃)` having ordinate `8.04`), and the pole
  of `ζ` at `1`, of order `−1`, counts `0`; a count by signed orders would give `−1`. The largest real
  zero is `β₁(3) = −1`, the trivial zero of the odd `L(s, χ₋₃)`, so `min(1, (1 − β₁) log 3) = 1`; at
  `Q = 5` the even character modulo `5` gives `β₁(5) = 0`.
- At `σ = 1` both bounds are constants, `10^{88}` and `10^{93} min(1, (1 − β₁) log Q)`, the second
  vanishing as the exceptional zero approaches `1`: the Deuring–Heilbronn phenomenon.
- `|γ| ≤ Q` couples the height to the conductor range; a statement with a separate height `T` is a
  different theorem.

### 8.5 A log-free density near `σ = 1` for `ζ`

Given `RH(3·10¹²)`, prove: for `3·10¹² < T ≤ exp(6.7·10¹²)` and `σ ∈ [0.9927, 1]`,
`N°(σ, T) ≤ 1.62·10¹¹ T^{1.448(1−σ)}`, and the
sharper constants `(B, C)` of `bellotti2025density` Table 2 on its subranges (Bellotti, Theorem 1.1,
lines 91–101); the uniform bound is `zetaZeroDensityCount_le_bellotti`. Route: the Halász–Montgomery large-values method for zero detectors, the zero-free
regions 7.3, 7.4 and 7.6, the critical-line bounds 4.7 (Hiary's `1.461` for `|t| ≤ 3`,
`0.618 t^{1/6} log t` up to `e^{105}`, `66.7 t^{27/164}` beyond), `RH(3·10¹²)`, and the numerical certificate of its
tables.

*Needs:* 0.4, 4.7, 6.4, 7.3, 7.4, 7.6 (the region with `c = 53.989`); the named certificate.

**Checks.**

- At `T = 10¹³`, `σ = 0.9927`: `1.62·10¹¹ · T^{0.01057} = 2.22·10¹¹`, against the trivial
  `N(T)/2 = 2.16·10¹³`.
- At `σ = 1` the bound is the constant `1.62·10¹¹`, consistent with the absence of zeros on `Re s = 1`.
- The range `T > 3·10¹²` is where `RH(3·10¹²)` leaves the question open; below it `N(σ, T) = 0` for
  `σ > 1/2`.

### Examples

- Given `RH(H₀)`: `N°(9/10, 10¹¹) < 11.499 (log 10¹¹)^{16/5} (10¹¹)^{4/15} + 3.186 (log 10¹¹)²`.

### Dependencies

Layers 0, 3–7; `SieveMethodsAndPrimePatterns` §2.9; the named certificates.

## Layer 9: the size of `L(1, χ)`

Throughout, `χ` is a primitive character of conductor `q > 1` (so `χ ≠ 1` and
`DirichletCharacter.LFunction χ 1 ≠ 0` by `DirichletCharacter.LFunction_apply_one_ne_zero`).

### 9.1 Upper bounds for every primitive character

Prove (Ramaré, Corollary 1, `ramare2001`, with the constants as Ramaré lists them in
`ramaretmeemt` lines 88–100; `norm_LFunction_one_le_ramare`): `|L(1, χ)| ≤ (1/2) log q` if `χ` is
even and `|L(1, χ)| ≤ (1/2) log q + 5/2 − log 6` if `χ` is odd; and when `2 | q`,
`|L(1, χ)| ≤ (1/4) log q + (1/2) log 2` if `χ` is even and `≤ (1/4) log q + 5/4 − (1/2) log 3` if
`χ` is odd. Route: Ramaré's approximate formula `L(1, χ) = Σ_n χ(n) f(n/X)/n + (error)`, in which the error
is a Gauss-sum twisted series controlled through the functional equation of `L(s, χ)` and the
Fourier transform of the smoothing `f`, optimized at `X ≈ √q`; for `2 | q` the factor `1 − χ(2)/2`
does not arise and the even part of the sum halves the main term.

*Needs:* Mathlib `gaussSum`, `DirichletCharacter.IsPrimitive.completedLFunction_one_sub`,
`DirichletCharacter.LFunction_eq_LSeries`; 1.2 (for the digamma values in the smoothing integrals);
Mathlib `Fourier.fourierIntegral`.

**Checks.**

- `5/2 − log 6 = 0.708241`, matching the constant `0.7083` with which `saadeddin2016` lines 56–65
  quote Ramaré's odd bound.
- `q = 3` (odd): `L(1, χ₋₃) = π/(3√3) = 0.604600 ≤ (1/2) log 3 + 0.708241 = 1.257547`; `q = 5` (even):
  `L(1, χ₅) = 2 log((1 + √5)/2)/√5 = 0.430409 ≤ (1/2) log 5 = 0.804719`.
- `2 | q`: `q = 4` gives `π/4 = 0.785398 ≤ 1.047267`; `q = 8` gives `log(1 + √2)/√2 = 0.623225 ≤
  0.866434` (even) and `π/(2√2) = 1.110721 ≤ 1.220554` (odd), the last with a margin of only `9%`.
- The even-modulus odd bound is nearly attained: among the primitive characters of conductor
  below `160`, the largest ratio of `|L(1, χ)|` to its bound is at `q = 104 = 8 · 13`, where an odd
  primitive character has `|L(1, χ)| = 1.848351` against `(1/4) log 104 + 5/4 − (1/2) log 3 =
  1.861792`; the constant `5/4 − (1/2) log 3` cannot be lowered by `0.014`. The largest ratios in
  the other three cases are `0.930` (odd, `q = 119`), `0.849` (even, `q = 145`) and `0.936`
  (even, `2 | q`, `q = 76`).

### 9.2 Refinements under conditions on `χ(2)` and `χ(3)`

Prove (Platt and Saad Eddin, Theorem 1.1, `plattsaadeddin2013` lines 27–37): if `3 | q`, then
`|L(1, χ)| ≤ (1/3) log q + 0.368296` for even `χ` and `≤ (1/3) log q + 0.838374` for odd `χ`; and (Saad
Eddin, Theorem 1, `saadeddin2016` lines 29–31): if `χ` is even and `χ(2) = 1`, then
`|L(1, χ)| ≤ (1/2) log q − 0.02012`. Each from Ramaré's method for large `q` (`q > 2·10⁶`, and the
ranges `2·10⁶ < q ≤ 2·10¹⁰` and `q > 2·10¹⁰` of Saad Eddin) and the numerical certificate of Platt's
rigorous computation of `|L(1, χ)|` for `q ≤ 2·10⁶` (`plattsaadeddin2013` §5;
`saadeddin2016` lines 791–799).

*Needs:* 9.1 (the approximate formula); the named numerical certificates.

**Checks.**

- `q = 3`: `0.604600 ≤ (1/3) log 3 + 0.838374 = 1.204578`; `q = 12` (even, `χ₁₂`):
  `log(2 + √3)/√3 = 0.760346 ≤ (1/3) log 12 + 0.368296 = 1.196598`.
- `q = 17` (the quadratic character is even and `χ(2) = 1` since `17 ≡ 1 (mod 8)`):
  `L(1, χ₁₇) = 2 log(4 + √17)/√17 = 1.016085 ≤ (1/2) log 17 − 0.02012 = 1.396487`.
- The condition `χ(2) = 1` cannot be dropped from Saad Eddin's form in favour of 9.1: for `χ(2) ≠ 1`
  the Euler factor at `2` already gives a better constant, which is why the paper treats exactly this
  case.

### 9.3 Lower bounds

Prove (Mossinghoff, Starichkova and Trudgian, Theorem 1.1, `mossinghoffstarichkovatrudgian2022`
lines 44–49; the first bound is `norm_LFunction_one_ge`): for `χ` primitive and not quadratic, `|L(1, χ)| ≥ 1/(9.690292 log(q/π))` for every
`q ≥ 2`, and `|L(1, χ)| ≥ (1 + o(1))/(9.122545 log(q/π))` as `q → ∞`; the first from the numerical
certificate of Platt's computation of `|L(1, χ)|` for `q ≤ 10⁶` (lines 442–446, 475–478) and the
analytic argument above it. Louboutin's earlier `|L(1, χ)| ≥ 1/(10 log(q/π))` (`louboutin2015`) is a
corollary. And (Lu, Zaman and Zhao, Corollary 1.3, `luzamanzhao2026` lines 96–99): for `q ≤ 10¹⁰` and
`χ` primitive quadratic modulo `q`, `χ ≠ 1`, the real number `L(1, χ)` satisfies
`L(1, χ) ≥ 1/(8 log q)` (`LFunction_one_ge_luZamanZhao`, on the real part of
`DirichletCharacter.LFunction χ 1`), from the numerical certificate for `q ≤ 10⁶` and, above,
Hoffstein's lemma together with 7.8. The clause `χ ≠ 1` excludes the trivial character modulo `1`,
which `MulChar.IsQuadratic` admits and whose value at `1` is Mathlib's junk value
`riemannZeta 1 = (γ − log 4π)/2 = −0.97690` (`riemannZeta_one`), below `1/(8 log 1) = 0` in Lean's division. Route for the non-quadratic bound:
Louboutin's theorem (`mossinghoffstarichkovatrudgian2022` Theorem 2.1, lines 94–140): for `χ` of
order greater than `m` and an admissible vector `(a₀, …, a_m)` (0.5, in the normalization
`a₀ + 2Σ a_k cos kθ`, so that admissibility reads `a₀ < 2a₁`) with `a₀ + 2Σ a_k Re χ^k(n) ≥ 0` for
every integer `n`, `|L(1, χ)| ≥ F(s(q))/(λ log(q/π))` once `s(q) = 1 + 1/(c log(q/π))` is at most
`min(s₀, 1.92326)`, with `c`, `λ` and the function `F` of `ζ` and `Γ` (`F(s) = 1 + O(s − 1)`) as in
their (2.2)–(2.3); the threshold `s₀` comes from an inequality between digamma values and `ζ'/ζ` at real
arguments (their Lemma 2.2), and no zero-free region enters. Below `q₀ = 10⁶` the bound is Platt's
computation.

*Needs:* 0.5, 1.2, 3.4; 7.8 (for the quadratic case); Mathlib
`DirichletCharacter.LFunction_apply_one_ne_zero`, `MulChar.IsQuadratic`; the named numerical
certificates.

**Checks.**

- The quartic character modulo `5` (`χ(2) = i`): `|L(1, χ)| = 0.888577 ≥ 1/(9.690292 log(5/π)) =
  0.222066`, which is also `≥ 1/(10 log(5/π)) = 0.215189`.
- The two constants of Mossinghoff–Starichkova–Trudgian are ordered as they must be:
  `1/9.690292 = 0.103196 < 1/9.122545 = 0.109619`.
- Lu–Zaman–Zhao at `q = 3`: `0.604600 ≥ 1/(8 log 3) = 0.113780`; the bound is not asserted for
  `q > 10¹⁰`, where no numerical constant is known without a general explicit form of Hoffstein's lemma (7.9 gives only the zero-free interval).

### Examples

- `L(1, χ₋₄) = π/4` within 9.1, and `L(1, χ₋₃) = π/(3√3)` within 9.1–9.3.

### Dependencies

Layers 0–3 and 7.8 (for 9.3); L-functions Layer 4; Mathlib Gauss sums and Dirichlet
L-functions; the named numerical certificates.

## Downstream consumers

- `ExplicitPrimeCounting` takes 0.2–0.4 (`RH(H)` and `GRH(q, H)` with the passage to imprimitive
  characters, the Platt bridge, whose ranges contain Rumely's, and the recorded verifications,
  among them the absence of zeros up to height `14`), 5.2 (Rosser's bound for `T ≥ 2`, Bellotti and
  Wong's, Trudgian's in the normalization without `7/8`, and the form with `7/8` and `9.3675`), 5.3 (the count for primitive
  Dirichlet L-functions), 5.4 (Lehman's lemma, Brent–Platt–Trudgian's form and `Σ γ^{−2}`), 6.1–6.2
  (Perron), 6.5 (Montgomery and Vaughan's weighted large sieve, for its Brun–Titchmarsh
  inequality), 7.3 (the regions for every `R₀ ≥ 5.558691`, among them `5.573412` and `5.5666305`, the
  instance `5.69693`, and the region with `log(|γ|/17)` for `|γ| ≥ 21`), 7.5 (Kadiri's `6.4355` and
  `5.60`, McCurley's `9.645908801`, Lu–Zaman–Zhao's Corollary 1.2, Thorner–Zaman's Theorem 2.6
  with its bound for `β₁(Q)`, and Ramaré and Rumely's region with `C₁(k, H)`), 7.6 (the Vinogradov–Korobov constants, `57.54` among them), 7.9
  (*HasLandauSiegelGap* at `(1/5, 10¹⁰)` and `(3.0·10⁻³, ∞)`) and 8.1, 8.3 (the densities of Kadiri
  and of Kadiri–Lumley–Ng). The bounded-height Riemann hypotheses over all characters modulo `q`
  and the capped real-zero gap that its hypotheses layer uses (its §§1.1, 1.2 and 1.7) are the
  propositions of 0.2 and 7.9, which this roadmap owns. The other zero-free regions, densities and
  forms of the zero count that it uses are listed under "Not owned here" with the reason.
- `ExplicitCharacterSumsAndSieves` takes the finite van der Corput inequality and its normalized
  form (4.2) for its real-part form and its iterated inequality (its §§0.3 and 1.1, variants built
  on 4.2 that no route here uses), and Montgomery–Vaughan's weighted large sieve of 6.5.
- `ExplicitMultiplicativeFunctions` takes 4.1 (the Kusmin–Landau inequality, for its §7.4), 6.1
  (Perron), 7.10 (the bounds for `1/ζ` that its §1.9 uses, each given `RH(3 000 175 332 800)`: in
  the classical region above that height, on `σ ≥ 1` for `t ≥ 13`, on `σ ≥ 3/4` up to half a unit
  below that height, and in the classical region from `t = 13`) and `RH(H)` of 0.2, its
  verified-zero hypothesis, through `ExplicitPrimeCounting` §1.1.
- `ExplicitNumberFields` takes 3.2 at `dedekindZetaData K` (the Dedekind instance of Rademacher's
  bound), 5.1 with 3.2 for the argument of Dedekind zeta functions of any degree, 2.1 and 2.5 for the
  gamma factors, 6.1a (the iterated Perron identity), 0.2–0.3 (`GRH(q, H)`), 0.5 (admissible cosine
  polynomials), 7.7 (the Siegel-shape bound `6.035/√d`), 7.9 (the real-zero gap, with Guo's
  instance `(1/100) ∞`) and 9.1 (Ramaré's bounds for `L(1, χ)`); its own polynomial certificates are
  listed under "Not owned here".
- A Part II of this roadmap placed after `ExplicitCharacterSumsAndSieves` takes Layer 9 for the
  quadratic `L(1, χ)` bounds that need explicit Pólya–Vinogradov inequalities.

## References

Each item is listed under the key by which the text cites it, with the locators cited. Line numbers
refer to the text of the version listed, the arXiv version where one is given.

- `backlund1918`: R. J. Backlund, *Über die Nullstellen der Riemannschen Zetafunktion*, Acta Mathematica 41 (1916); doi:10.1007/BF02422950. Cited for: (53)-(54), (56), (76).
- `mortici2011ramanujan`: Cristinel Mortici, *Ramanujan’s estimate for the gamma function via monotonicity arguments*, The Ramanujan Journal 25 (2011); doi:10.1007/s11139-010-9265-y. Cited for: Theorem 1.
- `diamondstraub2016`: Harold G. Diamond, Armin Straub, *Bounds for the logarithm of the Euler gamma function and its derivatives*, Journal of Mathematical Analysis and Applications 433 (2016); doi:10.1016/j.jmaa.2015.08.034, arXiv:1508.03267v1. Cited for: Theorem 3.1 (digamma comparison); Theorem 1.2 (log Gamma).
- `rademacher1959`: Hans Rademacher, *On the Phragmén–Lindelöf theorem and some applications*, Mathematische Zeitschrift 72 (1959); doi:10.1007/BF01162949. Cited for: Theorems 3 and 4.
- `trudgian2014argument`: T. S. Trudgian, *An improved upper bound for the argument of the Riemann zeta-function on the critical line II*, Journal of Number Theory 134 (2014), 280–292; doi:10.1016/j.jnt.2013.07.017, arXiv:1208.5846v2. Cited for: the quotation of Backlund's (53), line 261.
- `hiary2016zeta`: Ghaith A. Hiary, *An explicit van der Corput estimate for ζ(1/2+it)*, Indagationes Mathematicae 27 (2016); doi:10.1016/j.indag.2015.10.011, arXiv:1507.01261v4. Cited for: Theorem 1.1.
- `patel2022`: Dhir Patel, *An Explicit Upper Bound for |ζ(1+it)|*, Indagationes Mathematicae 33 (2022); doi:10.1016/j.indag.2022.04.007, arXiv:2009.00769v1. Cited for: Theorem 1.1; Lemmas 2.3, 2.5, 3.1 and 3.2 (the corrected second to fifth derivative tests), display (25), estimate (32).
- `kadiri2013density`: Habiba Kadiri, *A zero density result for the Riemann zeta function*, Acta Arith. 160 (2013), 185–200; arXiv:1401.4781v1. Cited for: Theorems 1.1, 1.2 and 1.4; Table 1.
- `ramare2016density`: O. Ramaré, *An explicit density estimate for Dirichlet L-series*, Mathematics of Computation 85 (2016); doi:10.1090/mcom/2991. Cited for: Theorem 1.1, Lemma 5.4, Lemma 6.5.
- `hasanalizadeshenwong2022`: E. Hasanalizade, Q. Shen, P.-J. Wong, *Counting zeros of the Riemann zeta function*, Journal of Number Theory 235 (2022); doi:10.1016/j.jnt.2021.06.032, arXiv:2107.06506v1. Cited for: Corollaries 1.2 and 1.4.
- `bmor2021`: M. A. Bennett, G. Martin, K. O'Bryant, A. Rechnitzer, *Counting zeros of Dirichlet L-functions*, Mathematics of Computation 90 (2021); doi:10.1090/mcom/3599, arXiv:2005.02989v1. Cited for: Theorem 1.1.
- `ramare2007eigen`: Olivier Ramaré, *Eigenvalues in the large sieve inequality*, Functiones et Approximatio Commentarii Mathematici 37 (2007); doi:10.7169/facm/1229619662. Cited for: Theorem 7.1.
- `gallagher1970`: P. X. Gallagher, *A large sieve density estimate near σ = 1*, Inventiones Mathematicae 11 (1970); doi:10.1007/bf01403187. Cited for: Lemma 1.
- `plattsaadeddin2013`: David J. Platt, Sumaia Saad Eddin, *Explicit upper bounds for |L(1, χ)| when χ(3)=0*, Colloquium Mathematicum 133 (2013); doi:10.4064/cm133-1-2, arXiv:1306.4780v1. Cited for: Theorem 1.1.
- `johnstonramaretrudgian2023`: D. R. Johnston, O. Ramaré, T. Trudgian, *An explicit upper bound for L(1,χ) when χ is quadratic*, Research in Number Theory 9 (2023); doi:10.1007/s40993-023-00476-4. Cited for: Theorems 1 and 2.
- `mossinghoffstarichkovatrudgian2022`: M. J. Mossinghoff, V. V. Starichkova, T. S. Trudgian, *Explicit lower bounds on |L(1,χ)|*, Journal of Number Theory 240 (2022); doi:10.1016/j.jnt.2021.12.013, arXiv:2107.09230v1. Cited for: Theorem 1.1.
- `mossinghofftrudgian2015`: M. J. Mossinghoff, T. S. Trudgian, *Nonnegative trigonometric polynomials and a zero-free region for the Riemann zeta-function*, Journal of Number Theory 157 (2015); doi:10.1016/j.jnt.2015.05.010, arXiv:1410.3926v1. Cited for: Theorems 1 and 2.
- `mty2024`: M. J. Mossinghoff, T. S. Trudgian, A. Yang, *Explicit zero-free regions for the Riemann zeta-function*, Research in Number Theory 10 (2024); doi:10.1007/s40993-023-00498-y, arXiv:2212.06867v1. Cited for: Theorem 1.3 (`R₀ = 5.558691`) and §9 (the smoothings (9.1)–(9.2)); Theorems 1.1 and 1.2 (Vinogradov–Korobov regions).
- `bellotti2024`: C. Bellotti, *Explicit bounds for the Riemann zeta function and a new zero-free region*, Journal of Mathematical Analysis and Applications 536 (2024); doi:10.1016/j.jmaa.2024.128249, arXiv:2306.10680v1. Cited for: Theorem 1.1 (zeta bound); Theorem 1.2 (zero-free region); Theorems 1.4–1.5 (Vinogradov's integral and the sums S(N, t)).
- `ralaivaosaonarazakarinoro2026`: Dimbinaina Ralaivaosaona, Faratiana Brice Razakarinoro, *An explicit upper bound for Siegel zeros of imaginary quadratic fields*, Journal of Number Theory 281 (2026); doi:10.1016/j.jnt.2025.10.014, arXiv:2001.05782v2. Cited for: Theorem 1.1 of the journal version (constant `6.035`), which is Theorem 1 of arXiv v2 (constant `6.5`, lines 69–76, the text read).
- `kadiring2012`: Habiba Kadiri, Nathan Ng, *Explicit zero density theorems for Dedekind zeta functions*, Journal of Number Theory 132 (2012); doi:10.1016/j.jnt.2011.09.002, arXiv:1201.3932v1. Cited for: Theorem 1 (explicit N_K(T)); context only, Dedekind case belongs to ExplicitNumberFields.
- `kadirilumleyng2018`: Habiba Kadiri, Allysa Lumley, Nathan Ng, *Explicit zero density for the Riemann zeta function*, J. Math. Anal. Appl. 465 (2018), no. 1, 22–46; doi:10.1016/j.jmaa.2018.04.071, arXiv:2101.12263v1. Cited for: Theorem 1.1 and its corollary at sigma = 9/10.
- `platt2016grh`: David Platt, *Numerical computations concerning the GRH*, Mathematics of Computation 85 (2016); doi:10.1090/mcom/3077, arXiv:1305.3087v1. Cited for: Theorem 7.1.
- `alzer1997`: H. Alzer, *On some inequalities for the gamma and psi functions* (1997). Cited for: Theorems 8 and 9.
- `chenggraham2004`: Y. Cheng, S. W. Graham, *Explicit estimates for the Riemann zeta function*, Rocky Mountain J. Math. 34 (2004). Cited for: Lemma 2.
- `kadiri2002thesis`: H. Kadiri, *Une région explicite sans zéros pour les fonctions L de Dirichlet*, thèse de doctorat (2002). Cited for: Théorème 11.1 and its English form (115) (`R₁ = 6.4355`).
- `kadiri2018`: Habiba Kadiri, *An explicit zero-free region for the Dirichlet L-functions*, Mathematika 64 (2018), no. 2, 445–474; arXiv:math/0510570v2. Cited for: Theorem 1.1 (R = 5.60 for 3 <= q <= 400000); §2 (Theorems 2.1–2.2, its inputs).
- `logan1988`: B. F. Logan, *An interference problem for exponentials* (1988). Cited for: Theorem 1.
- `hiary2016hybrid`: Ghaith A. Hiary, *An explicit hybrid estimate for L(1/2+it,χ)* (2015); arXiv:1510.00950v2. Cited for: Theorem 1.2; Corollary 1.1.
- `thornerzaman2024`: Jesse Thorner, Asif Zaman, *An explicit version of Bombieri's log-free density estimate and Sárközy's theorem for shifted primes*, Forum Math. 36 (2024), no. 4, 1059–1080; doi:10.1515/forum-2023-0091, arXiv:2208.11123v4. Cited for: Theorem 1.2, Lemmas 2.1 and 2.3, Theorem 2.6, Proposition 2.10.
- `ford2002vinogradov`: Kevin Ford, *Vinogradov's integral and bounds for the Riemann zeta function*, Proc. London Math. Soc. 85 (2002), 565–633; arXiv:1910.08209v1. Cited for: Theorems 1–4 (Theorem 3: the explicit Vinogradov mean value theorem); Lemmas 7.1–7.3.
- `ford2002zerofree`: Kevin Ford, *Zero-free regions for the Riemann zeta function*, In the book Number Theory for the Millenium (Urbana, IL, 2000) (M. A. Bennett, B. C. Berndt, N. Boston, H. G. Diamond, A. J. Hildebrand and W. Phillip, eds), vol. II (2002), 25–56; arXiv:1910.08205v5. Cited for: Theorems 1 and 3–5.
- `khale2024`: Tanmay Khale, *An explicit Vinogradov-Korobov zero-free region for Dirichlet L-functions* (2022); arXiv:2210.06457v1. Cited for: Theorem 1.1.
- `platttrudgian2021`: Dave Platt, Tim Trudgian, *The Riemann hypothesis is true up to 3·10¹²*, Bull. London Math. Soc. 53 (2021), 792–797; doi:10.1112/blms.12460, arXiv:2004.09765v1. Cited for: Theorem 1.
- `platt2017zeros`: D. J. Platt, *Isolating some non-trivial zeros of zeta*, Mathematics of Computation 86 (2017). Cited for: Theorem 5.1 (height 30 610 046 000).
- `trudgian2014zeta1`: Timothy Trudgian, *A new upper bound for |ζ(1+ it)|*, Bull. Aust. Math. Soc. 89 (2014), 259–264; doi:10.1017/S0004972713000415, arXiv:1210.6743v1. Cited for: Theorem 1.
- `saadeddin2016`: Sumaia Saad Eddin, *Explicit upper bound for |L(1, χ)| when χ(2) = 1 and χ is even* (2015); doi:10.1142/S1793042116501372, arXiv:1503.08365v1. Cited for: Theorem 1.
- `kadiri2005`: Habiba Kadiri, *Une region explicite sans zero pour la fonction Zeta de Riemann*, Acta Arith. 117 (2005), no. 4, 303–339; doi:10.4064/aa117-4-1, arXiv:math/0401238v1. Cited for: Théorème 1.1.
- `mortici2011psi`: C. Mortici, *On a sum of the psi function with a logarithm* (2011). Cited for: Theorem 1.1.
- `jangkwon2014`: W.-J. Jang, S.-H. Kwon, *A note on Kadiri's explicit zero free region for Riemann zeta function* (2014). Cited for: §3 (Kadiri's method, conditions (1) and (4), inequality (6)); Propositions 10 and 11 (`R₀ = 5.68371`, Xylouris' smoothing).
- `lehman1970`: R. S. Lehman, *On the distribution of zeros of the Riemann zeta-function*, Proceedings of the London Mathematical Society (3) 20 (1970); doi:10.1112/plms/s3-20.2.303. Cited for: Lemma 2.
- `rosser1941`: J. B. Rosser, *Explicit bounds for some functions of prime numbers*, American Journal of Mathematics 63 (1941); doi:10.2307/2371291. Cited for: Theorem 19.
- `montgomeryvaughan1974`: H. L. Montgomery, R. C. Vaughan, *Hilbert's inequality*, Journal of the London Mathematical Society (2) 8 (1974); doi:10.1112/jlms/s2-8.1.73. Cited for: Theorem 1; Corollary 3.
- `elliott1987`: P. D. T. A. Elliott, *Additive arithmetic functions on arithmetic progressions*, Proceedings of the London Mathematical Society (3) 54 (1987); doi:10.1112/plms/s3-54.1.15. Cited for: Lemma 1.
- `bastienrogalski2002`: G. Bastien, M. Rogalski, *Convexité, complète monotonie et inégalités sur les fonctions zêta et gamma, sur les fonctions des opérateurs de Baskakov et sur des fonctions arithmétiques*, Canadian Journal of Mathematics 54 (2002); doi:10.4153/CJM-2002-034-7. Cited for: Théorème 6.
- `ramare2001`: O. Ramaré, *Approximate formulae for L(1,χ)*, Acta Arithmetica 100 (2001); doi:10.4064/aa100-3-2. Cited for: Corollary 1.
- `preissmann1984`: E. Preissmann, *Sur une inégalité de Montgomery et Vaughan*, L'Enseignement Mathématique (2) 30, 95-113 (1984). Cited for: Théorème 1.
- `louboutin2015`: S. R. Louboutin, *An explicit lower bound on moduli of Dirichlet L-functions at s = 1*, Journal of the Ramanujan Mathematical Society 30, 101-113 (2015). Cited for: Theorem 1.
- `montgomery1994ten`: H. L. Montgomery, *Ten lectures on the interface between analytic number theory and harmonic analysis*, CBMS Regional Conference Series in Mathematics 84, AMS (1994). Cited for: Chapter 7, Theorem 3.
- `andrewsberndt2013`: G. E. Andrews, B. C. Berndt, *Ramanujan's Lost Notebook, Part IV*, Springer (2013); doi:10.1007/978-1-4614-4081-9. Cited for: p. 118.
- `ramare2022excursions`: O. Ramaré, *Excursions in Multiplicative Number Theory*, Birkhäuser Advanced Texts, Birkhäuser/Springer, Cham (2022); doi:10.1007/978-3-030-73169-4. Cited for: Chapter 20, Section 20.2.
- `platt2011thesis`: D. J. Platt, *Computing degree 1 L-functions rigorously*, PhD thesis, University of Bristol (2011). Cited for: the chapter verifying RH to height 10^9.
- `helfgott2017mo`: H. A. Helfgott, *L² bounds for tails of ζ(s) on a vertical line (MathOverflow answer 285338 to question 285197)*, MathOverflow, CC BY-SA (2017). Cited for: the answer, equations for `c_{1,σ}`, `c♭_{1,σ}`, `c♭_{2,σ}`, `c_{3,σ}`, `κ_{σ,T}`.
- `dlmf`: NIST, *Digital Library of Mathematical Functions*, https://dlmf.nist.gov (2024). Cited for: §5.9 (Binet's formulas), §5.11.
- `delange1987`: H. Delange, *Une remarque sur la dérivée logarithmique de la fonction zêta de Riemann*, Colloquium Mathematicum 53 (1987); doi:10.4064/cm-53-2-333-335. Cited for: Théorème.
- `lehman1966`: R. S. Lehman, *On the difference π(x) − li(x)*, Acta Arithmetica 11 (1966); doi:10.4064/aa-11-4-397-410. Cited for: Lemma 1.
- `vandeluneterielewinter1986`: J. van de Lune, H. J. J. te Riele, D. T. Winter, *On the zeros of the Riemann zeta-function in the critical strip. IV*, Mathematics of Computation 46 (1986); doi:10.1090/S0025-5718-1986-0829637-3. Cited for: Section 1.
- `rumely1993`: R. Rumely, *Numerical computations concerning the ERH*, Mathematics of Computation 61 (1993); doi:10.1090/S0025-5718-1993-1195435-0. Cited for: Theorem 1 and the table of moduli.
- `ramare2016perron`: O. Ramaré, *Modified truncated Perron formulae*, Annales mathématiques Blaise Pascal 23, no. 1, 109-128 (Centre Mersenne, open access) (2016). Cited for: Theorem 1.1 and the modified formulae of Section 2.
- `gabcke1979`: W. Gabcke, *Neue Herleitung und explizite Restabschätzung der Riemann-Siegel-Formel* (1979); doi:10.53846/goediss-5113. Cited for: Satz 4.2.3 (explicit remainder of the Riemann–Siegel formula).
- `nemes2015`: Gergő Nemes, *Error bounds and exponential improvements for the asymptotic expansions of the gamma function and its reciprocal*, Proceedings of the Royal Society of Edinburgh, Section A: Mathematics, Volume 145 (2015), Issue 3, 571–596; doi:10.1017/S0308210513001558, arXiv:1310.0166v2. Cited for: Theorems 1.1–1.3.
- `brent2019`: Richard P. Brent, *On asymptotic approximations to the log-Gamma and Riemann-Siegel theta functions*, Journal of the Australian Mathematical Society, 107 (2019), 319–337; doi:10.1017/S1446788718000393, arXiv:1609.03682v2. Cited for: Theorem 1.
- `simonic2020`: Aleksander Simonič, *Explicit zero density estimate for the Riemann zeta-function near the critical line* (2019); arXiv:1910.08274v2. Cited for: Theorem 4, Corollary 1.
- `hiarypatelyang2024`: Ghaith A. Hiary, Dhir Patel, Andrew Yang, *An improved explicit estimate for ζ(1/2+it)* (2022); arXiv:2207.02366v1. Cited for: Theorem 1.1, Lemmas 2.1–2.6.
- `patelyang2024`: Dhir Patel, Andrew Yang, *An explicit sub-Weyl bound for ζ(1/2 + it)* (2023); arXiv:2302.13444v1. Cited for: Theorem 1.1, Lemmas 1.2, 1.4, 2.1.
- `hiaryleongyang2025`: Ghaith A. Hiary, Nicol Leong, Andrew Yang, *Explicit bounds for the Riemann zeta-function on the 1-line* (2023); arXiv:2306.13289v3. Cited for: Theorems 1 and 2.
- `leong2026`: Nicol Leong, *Explicit estimates for the logarithmic derivative and the reciprocal of the Riemann zeta function*, J. Number Theory 285 (2026), 230–261; arXiv:2405.04869v5, the text read, whose numbering is cited. Cited for: Corollaries 1–4, Table 4, (42), (49).
- `leeLeong2022`: Ethan Simpson Lee, Nicol Leong, *New explicit bounds for Mertens function and the reciprocal of the Riemann zeta-function* (2022–2026); arXiv:2208.06141v5 (an unrefereed preprint). Cited for: Theorem 1.1 (6), Lemma 4.3, Theorem 2.1 and its remarks.
- `bellottiwong2025`: Chiara Bellotti, Peng-Jie Wong, *Improved estimates for the argument and zero-counting function of the Riemann zeta-function* (2024); arXiv:2412.15470v2. Cited for: Theorems 1.1 and 1.2, Tables 1 and 2, the bound (1.2) for S(T).
- `brentplatttrudgian2021`: Richard P. Brent, David J. Platt, Timothy S. Trudgian, *Accurate estimation of sums over zeros of the Riemann zeta-function*, Mathematics of Computation 90 (2021), 2923–2935; doi:10.1090/mcom/3652, arXiv:2009.13791v1. Cited for: Lemmas 1 and 3, Theorem 1, Corollary 1.
- `cullyhugilljohnston2023`: Michaela Cully-Hugill, Daniel R. Johnston, *On the error term in the explicit formula of Riemann--von Mangoldt* (2021); arXiv:2111.10001v5. Cited for: Theorem 2.1, Lemma 2.2.
- `cullyhugilljohnston2025`: Michaela Cully-Hugill, Daniel R. Johnston, *On the error term in the explicit formula of Riemann-von Mangoldt II* (2024); arXiv:2402.04272v3. Cited for: Corollary 3.2.
- `donahelfgottzunigaalterman2022`: Daniele Dona, Harald A. Helfgott, Sebastian Zuniga Alterman, *Explicit L² bounds for the Riemann ζ function*, J. Théor. Nombres Bordeaux 34 (2022), no. 1, 91–133; doi:10.5802/jtnb.1194, arXiv:1906.01097v7. Cited for: Theorems 1.1 and 1.2.
- `luzamanzhao2026`: Rick F. Lu, Asif Zaman, Haonan Zhao, *Numerical computations concerning Landau-Siegel zeros* (2026); doi:10.1090/mcom/4268, arXiv:2602.03626v2. Cited for: Theorem 1.1, Corollaries 1.2 and 1.3.
- `benligoeltwisszaman2026`: Kübra Benli, Shivani Goel, Henry Twiss, Asif Zaman, *Explicit Deuring-Heilbronn phenomenon for Dirichlet L-functions* (2024); doi:10.1090/proc/17450, arXiv:2410.06082v3. Cited for: Corollary 1.1, Proposition 2.3.
- `bordignon2019`: Matteo Bordignon, *Explicit bounds on exceptional zeroes of Dirichlet L-functions*, Journal of Number Theory (2019); doi:10.1016/j.jnt.2019.02.003, arXiv:1809.05226v2. Cited for: Theorem 1.3.
- `bordignon2020`: Matteo Bordignon, *Explicit bounds on exceptional zeroes of Dirichlet L-function II* (2019); arXiv:1907.08327v1. Cited for: Theorems 1.1 and 1.3.
- `yang2024`: Andrew Yang, *Explicit bounds on ζ(s) in the critical strip and a zero-free region* (2023); arXiv:2301.03165v2. Cited for: Theorem 1.1, Corollary 1.2, Lemmas 2.1 and 2.3–2.6.
- `bellotti2025density`: Chiara Bellotti, *An explicit log-free zero density estimate for the Riemann zeta-function* (2024); arXiv:2405.12545v2. Cited for: Theorem 1.1.
- `ariasdereyna2024`: Juan Arias de Reyna, *Explicit van der Corput's d-th derivative estimate* (2024); arXiv:2407.02094v1. Cited for: Lemmas 1, 4 and 5, Remark 2.
- `fiori2025`: Andrew Fiori, *A Note on the Phragmen-Lindelof Theorem* (2025); arXiv:2502.13282v3. Cited for: Theorem 1.
- `banks2026`: William D. Banks, *On the OpenAI proof that Landau-Siegel zeros do not exist* (2026); arXiv:2610.15483v1. Cited for: Theorem 1.
- `bellottitrudgianyang2026`: Chiara Bellotti, Tim Trudgian, Andrew Yang, *Zero-free regions inspired by work of Heath-Brown* (2026); arXiv:2603.21490v1. Cited for: Theorem 1.
- `davenport2000`: H. Davenport (revised by H. L. Montgomery), *Multiplicative Number Theory, 3rd edition*, Graduate Texts in Mathematics 74, Springer (2000); doi:10.1007/978-1-4757-5927-3. Cited for: §12 (the partial-fraction expansions of zeta'/zeta and L'/L).
- `ramaretmeemt`: O. Ramaré, *TME-EMT: explicit estimates in multiplicative number theory, Size of L(1, χ)*, author-maintained page (2026). Cited for: the two theorems dated 2001 (Ramaré's Corollary 1 with its exact constants), lines 88–100.
- `ramare-rumely-1996`: Olivier Ramaré, Robert Rumely, *Primes in arithmetic progressions*, Mathematics of Computation 65 (1996), 397–425; doi:10.1090/s0025-5718-96-00669-2. Cited for: Theorems 3.6.2 and 3.6.3, Lemma 3.6.1, (3.4.2)–(3.4.3), (3.6.6)–(3.6.7).
- `guo2026`: Victor Zhenyu Guo, *An explicit elementary proof of no Landau–Siegel zeros* (2026); arXiv:2610.30476v1. Cited for: Theorem 1.1 (an unrefereed preprint).
- `kedlaya2025notes`: Kiran S. Kedlaya, *Notes on analytic number theory*, author's text, CC BY-SA 4.0 (2015–2025). Cited for: §1.6, Exercise 6 (the kernel of the iterated Perron identity).
- `mccurley1984`: K. S. McCurley, *Explicit zero-free regions for Dirichlet L-functions*, Journal of Number Theory 19 (1984), 7-32 (1984); doi:10.1016/0022-314X(84)90089-1. Cited for: Theorem 1.
- `titchmarsh1986`: E. C. Titchmarsh (revised by D. R. Heath-Brown), *The Theory of the Riemann Zeta-Function, 2nd edition*, Oxford University Press (1986). Cited for: Theorem 4.13 (approximate functional equation); §8.6; §9.4 (Backlund's argument).
