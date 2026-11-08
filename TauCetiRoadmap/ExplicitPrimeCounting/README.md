# Roadmap: explicit prime counting

**Summary.** This roadmap develops, on Mathlib's carriers `Chebyshev.psi`, `Chebyshev.theta`,
`Nat.primeCounting`, `Nat.nth Nat.Prime` and `ArithmeticFunction.vonMangoldt`, on Tau Ceti's
offset logarithmic integral `TauCeti.Real.logIntegral`, the numerically explicit theory of the
distribution of primes. It builds the unoffset logarithmic integral `li`, the exact transfer
identities between `ψ`, `θ`, `π`, `Li` and `li`, and the Brun–Titchmarsh inequality of
Montgomery–Vaughan with the constant `2`. Its general
theorems turn a zero-free region with constant `R`, a height `H` of verified zeros, an explicit
zero-counting error and a zero-density bound into a bound `|ψ(x) − x| ≤ ε(x) x` with `ε` an
explicit function of those parameters, the zero density being the general input and the
density-free schemes its special cases. It proves the extremal-kernel bound
`|ψ(x) − x| ≤ (π/T) x + C_T √x` from a height `T` of verified zeros alone, and the same theorems
for primes in a residue class modulo `q`. The published constants of Rosser–Schoenfeld,
Schoenfeld, Dusart, Faber–Kadiri, Trudgian, Platt–Trudgian, Broadbent–Kadiri–Lumley–Ng–Wilk,
Johnston–Yang, Fiori–Kadiri–Swidinsky, Axler, Büthe, Johnston, Lee–Nosal, Ramaré–Rumely,
Bennett–Martin–O'Bryant–Rechnitzer, Lamzouri–Li–Soundararajan, Kadiri–Lumley and Cully-Hugill–Lee
are instances of those theorems. Results available only as preprints (Chirre–Helfgott,
Broadbent–Fiori–Kadiri–Ng–Wilk, Fiori–Jaskari, Banks) are stated as instances with that status
recorded, next to the refereed statement they would sharpen, never in its place. From the
Chebyshev bounds the roadmap derives explicit bounds for `π(x)`, for the `n`-th prime, for the
Mertens sums `∑ Λ(n)/n` and `∑ 1/p`, for the sums `∑_{p ≤ x} p^r`, for primes in arithmetic
progressions, and for short intervals `(x(1 − Δ⁻¹), x]` that contain a prime. Every computational
fact a source relies on (a verified height of zeros, a table of constants, a finite-range check, a
table of prime gaps) is an assumption: a named proposition with its data in the statement, stated
once (a verified height in ExplicitZetaBounds §§0.4–0.4b; a finite-range check, a gap bound or a
tabulation in Layer 1, or in §0.1 for the two that the Brun–Titchmarsh inequality uses and in §0.8
for the one that Chebyshev's weight method uses; a table of constants next to the general theorem
whose error function it evaluates), and an explicit
hypothesis of every theorem that uses it. The roadmap proves, performs and plans no computation.

The end theorems are:

- under the Riemann hypothesis, Lee–Nosal's `|ψ(x) − x| ≤ √x log x (log x − log log x)/(8π)` for
  `x ≥ 101` and the same bound for `|θ(x) − x|` for `x ≥ 2657`, Schoenfeld's
  `|π(x) − li x| < √x log x/(8π)` for `x > 2657`, and Carneiro–Milinovich–Soundararajan's prime in
  `[x, x + (22/25) √x log x]` for `x ≥ 4`;
- from the zeros up to a height `T`, Büthe's four bounds of Schoenfeld's shape for every `x` with
  `4.92 √(x/log x) ≤ T`, and, together with the verified height `3·10¹²`, the same bounds under
  Johnston's weaker condition `9.06 √(x/log x)/log log x ≤ T`, which at `T = 3·10¹²` gives the
  range `x ≤ 1.101·10²⁶`;
- unconditionally, Dusart's `|ψ(x) − x| < x √(8/π) X^{1/2} e^{−X}`, `X = √(log x/R)`, from a
  zero-free region of constant `R`, the absence of zeros up to height `14` and Rosser's bound for
  the sum of `1/γ³` over the zeros, Rosser–Schoenfeld's `ψ(x) < 1.03883 x` for `x > 0`,
  Broadbent–Kadiri–Lumley–Ng–Wilk's `θ(x) ≤ (1 + 1.93378·10⁻⁸) x` for `x > 0`,
  Fiori–Kadiri–Swidinsky's `|ψ(x) − x| ≤ 9.22022 x (log x)^{3/2} exp(−0.8476836 √log x)` for
  `x ≥ 2`, and Axler's
  `π(x) < x/(log x − 1 − 1/log x − 3.024334/log² x − ⋯ − 4331.1/log⁶ x)` for `x ≥ 48`;
- Montgomery–Vaughan's `π(x + y; k, l) − π(x; k, l) ≤ 2y/(φ(k) log(y/k))` for `y > k`, from two
  finite-range propositions (the diagonal sum `∑_{q ≤ u} μ²(q)/φ(q) ≥ log u + 1.07` on `[6, 10⁹)`
  and the weighted sieve evaluated exactly for `25 ≤ y/k ≤ 2·10⁴`);
- Vanlalngaia's `∑_{p ≤ x} 1/p = log log x + B + O*(4/log³ x)` for `x ≥ 2`, and Dusart's
  `p_n > n(log n + log log n − 1)` for `n ≥ 2`;
- the Bennett–Martin–O'Bryant–Rechnitzer bound `|ψ(x; q, a) − x/φ(q)| < x/(840 log x)` for
  `3 ≤ q ≤ 10⁴`, `a` prime to `q` and `x ≥ 8·10⁹`, and Lamzouri–Li–Soundararajan's least prime
  `p ≤ (φ(q) log q)²` in every reduced class modulo `q > 3` under the generalised Riemann
  hypothesis;
- Schoenfeld's prime in `(x, x + x/16597)` for `x > 2 010 759.9`, Trudgian's prime in
  `[x, x(1 + 1/(111 log² x))]` for `x ≥ 2 898 242`, and Axler's prime in
  `(x, x(1 + (0.048668 + 8.22·10⁻¹¹)/log³ x)]` for `x ≥ 17 051 708`.

Suggested home: `TauCeti/NumberTheory/ExplicitPrimes/`, divided into `Carriers/`, `Hypotheses/`,
`ConditionalBounds/`, `ChebyshevBounds/`, `PrimeSums/`, `NthPrime/`, `Progressions/` and
`ShortIntervals/`. [`Suggested.lean`](Suggested.lean) states the headline theorems that are
statable against the pinned libraries; it is not the roadmap. The headlines whose routes pass
through a table proposition on the error function of a general theorem are named in its module
docstring with what they lack.

## Scope and ownership

### Owned here

- The Brun–Titchmarsh inequality of Montgomery–Vaughan with the constant `2`, together with the
  two inputs of its proof that no earlier roadmap states: Montgomery–Vaughan's lower bound
  `∑_{q ≤ u} μ²(q)/φ(q) ≥ log u + 1.07` for `u ≥ 6`, with Büthe's explicit asymptotic for that sum
  and the finite-range proposition `MVDiagonalFiniteRange`, and the finite-range proposition
  `BrunTitchmarshFiniteRange` (§0.1). This roadmap is their owner: ExplicitCharacterSumsAndSieves,
  which plans the explicit sieve bounds and uses both the inequality and the diagonal bound, is
  later in the order of supply, so the statements of §0.1 are the ones of record and a statement
  of either object there cites §0.1. The proof uses
  Montgomery–Vaughan's weighted large sieve, ExplicitZetaBounds §6.5.
- The inputs about zeros with numerical constants that particular sources use and that
  ExplicitZetaBounds, the owner of the explicit regions, zero counts and densities, leaves to the
  theorem that needs them: the low-height zero count `ZetaZeroCountLowRange` (§1.1, for the zero
  counts of §§2.2 and 2.6), the zero counts against `M(T)` with `7/8` at the triples of Trudgian and
  of Platt–Trudgian (instances of ExplicitZetaBounds §5.2a's predicate, written *ZeroCountBound*,
  §3.1), the Kadiri–Lumley–Ng densities recomputed at the height `3·10¹²` with
  changed inputs, whose constants are not the closed forms of ExplicitZetaBounds §8.3
  (Johnston–Yang's *JohnstonYangDensityTable* and Fiori–Kadiri–Swidinsky's
  *FioriKadiriSwidinskyDensity*, §3.4; Cully-Hugill's *CullyHugillDensity*, §7.5),
  Johnston–Yang's truncated explicit formula (*JohnstonYangExplicitFormula*, §3.4), Liu–Wang's
  bound of four zeros near `σ = 1` (*LiuWangFourZeros*, §6.6) and Ramaré's revised density for `ζ`
  (*RamareRevisedDensity*, §7.5). Each is a named hypothesis, never discharged here, of the
  instances that use it; no general theorem depends on one (Conventions).
- The truncated explicit formula for `ψ` with an explicit error, `ψ(x) = x − ∑_{|γ| ≤ T} x^ρ/ρ`
  up to `M x log x/T`, and in Dudek's shape up to `2 x log² x/T` for every `50 < T < x` (§2.1),
  proved from the Perron formula of ExplicitZetaBounds §6.1, which that roadmap states for a
  general Dirichlet series; and the Pintz form of the general scheme built on
  it (§3.1(d)).
- The carriers this roadmap adds: the logarithmic progression sum
  `ψ̃(x; q, a) = ∑_{n ≤ x, n ≡ a (q)} Λ(n)/n` and the Mertens constants `C(q, a)` of a residue
  class, the half-weight versions of `ψ`, `θ`, `π` and `π*` (Layer 0), and the first-occurrence
  function of prime gaps (§1.4).
- Chebyshev's weight method with explicit constants (§0.8), and the elementary explicit forms of
  Mertens' first and second theorems valid from `x = 1` and `x = 2` (§§1.6, 4.1, 4.3).
- The unoffset logarithmic integral `li` on `(0, 1) ∪ (1, ∞)`, defined by the exponential-integral
  series at `log x`, with its principal-value integral, its derivative `1/log x`, its monotonicity
  and sign, the identity `Li x = li x − li 2` for `x > 1` and its asymptotic expansion (§0.3a).
- The rational prime-count adapter `TauCeti.primeCount ℚ Set.univ x = π(⌊x⌋₊)` and the asymptotic
  `p_n ∼ n log n` of the `n`-th prime (§0.3b).
- The exact transfer identities between `ψ`, `θ`, `π`, `Li` and `li` with their remainders, and the
  general conversion of a `ψ`-bound into `θ`- and `π`-bounds (Layer 0).
- The hypotheses, each a named assumption that nothing here proves: the finite-range
  verifications, the prime-gap verifications, the progression tabulations and the decimal
  enclosures of Euler's constant `γ` and of the Meissel–Mertens constant `B` (Layer 1), and the
  computations on the low zeros of `ζ` (§1.1); the tables of constants, each in the section of the
  general theorem whose error function it evaluates (Layers 2–7). The bounded-height Riemann
  hypotheses, the records of ExplicitZetaBounds §0.4b (Platt's two, *BrentPlattTrudgianRecord*,
  *BordignonRecord*, *LuZamanZhaoRecord*, *HiaryRecord*, *PatelRecord*, *YangRecord*,
  *BennettMartinOBryantRechnitzerRecord*) and the real-zero gap are
  ExplicitZetaBounds' (see Consumed, not redefined); §§1.1, 1.2 and 1.7 cite them, and a statement
  here names a record wherever its route obtains a supplier region from it (Conventions). The
  decimal enclosures are stated here because the roadmap `ExplicitMultiplicativeFunctions`, which
  also needs them, is later in the order of supply.
- Bounds for `ψ`, `θ`, `π` under the Riemann hypothesis and under the Riemann hypothesis to a height
  (Layer 2); unconditionally, the general scheme and its published instances (Layer 3).
- Explicit Mertens sums, Ramaré's weighted prime sums, Treviño's sums of primes and
  Deléglise–Nicolas's sums `∑_{p ≤ x} p^r` (Layer 4).
- Two-sided bounds for the `n`-th prime, Cipolla's expansion, and sums of the first `n` primes
  (Layer 5).
- Primes in arithmetic progressions with explicit constants, the general theorem and its instances,
  and the consequences of a numerical real-zero gap for the exceptional-modulus clauses (Layer 6);
  short intervals containing a prime, conditional (Layer 2) and unconditional (Layer 7).

### Consumed, not redefined

- `Chebyshev.psi`, `Chebyshev.theta`, their basic laws and the identities
  `Chebyshev.psi_eq_theta_add_sum_theta`, `Chebyshev.primeCounting_eq_theta_div_log_add_integral`,
  `Chebyshev.theta_eq_primeCounting_mul_log_sub_integral`, `Chebyshev.theta_le_log4_mul_x`, and
  Costa Pereira's two comparisons of `ψ − θ` with sums of `ψ(x^{1/k})`
  (`Chebyshev.psi_sub_theta_le_psi_add_psi_add_psi`,
  `Chebyshev.psi_sub_theta_ge_psi_add_psi_add_psi`): Mathlib.
- `TauCeti.Real.logIntegral` (`Li`, with `Li 2 = 0`) and its calculus, in particular
  `TauCeti.Real.logIntegral_eq_div_log_sub_add`; `TauCeti.LFunctions.mertensConstant ℚ` (the
  constant `B`): Tau Ceti. The asymptotic adapters `Li x − x/log x ∼ x/log² x`: ZerosOfLFunctions
  §8.9.
- The weighted large sieve `∑_x (N + (3/2) δ(x)⁻¹)⁻¹ |S(x)|² ≤ ∑ |a_n|²` of Montgomery–Vaughan:
  ExplicitZetaBounds §6.5. The unweighted forbidden-residue large sieve with the sharp
  constant `H − 1 + Q²` (SieveMethodsAndPrimePatterns §2.9) gives the constant `2` of §0.1 only up
  to a factor `1 + O(log log(y/k)/log(y/k))` and is not its input.
- The progression carriers `psiAP q a x` and `primeCountAP q a x` (modulus `q`, residue `a : ZMod q`,
  real `x`) and the theta sum `θ(x; a, q)`: AnalyticNumberTheoryPartI §0.2.
- Everything about the zeros of `ζ` and `L(s, χ)`: the counting function `zeroCount` and `N(T)`
  (ZerosOfLFunctions §§4.1, 4.5), the zero-free regions with existential constants and the
  exceptional-zero predicate (§§6.2–6.4), the truncated and Weil explicit formulas
  (§§8.3–8.4), the prime number theorem with error term and its progression form (§§8.5, 8.7),
  the certificate semantics `AllOnCriticalLine` and `GRH` (Layer 9). The decimal constants of the
  zero-free regions, the explicit zero-counting errors and the zero-density bounds are the business
  of ExplicitZetaBounds and are listed as gaps in the supplier contracts, except the
  source-specific inputs that it leaves to this roadmap (Owned here); its weighted sums over the
  ordinates (§5.4), its Perron formula with a free cut-off (§6.1) and Ford's intermediate region
  (§7.2) are consumed by contract. The truncated explicit formula for `ψ` with a numerical error, which ZerosOfLFunctions
  §8.3 states with an inexplicit `O`, is §2.1 here.
- The bounded-height propositions `RH(H)` (`RiemannHypothesisUpTo`) and `GRH(f, H)` (primitive
  characters modulo `f`), their antitonicity in `H`, their limits `RiemannHypothesis` and
  `DirichletGRH`, the passage from primitive to all characters of a modulus, Platt's records
  *PlattRecord* (`GRH(f, H(f))` for `2 ≤ f ≤ 400 000`, at heights `H(f) ≥ 10⁸/f`) and
  *PlattCentralRecord* (`L(1/2, χ) ≠ 0` for primitive `χ` modulo `2 ≤ f ≤ 2·10⁶`) with the
  corollaries given them, and the recorded verifications of `ζ` (the heights `545 439 823`,
  `30 610 046 000` and `3 000 175 332 800`, and the absence of zeros up to height `14`):
  ExplicitZetaBounds §§0.2–0.4b (`gap:rh-up-to-height`, `gap:grh-up-to-height`).
  §§1.1–1.2 cite them; `Suggested.lean` carries verbatim copies of `RiemannHypothesisUpTo` and of
  the records `HiaryRecord`, `PatelRecord` and `YangRecord` (§0.4b there) only to make its headlines
  statable.
- The zero-count predicate *ZetaZeroCountBound* `κ a₁ a₂ a₃ a₄ T₀` of ExplicitZetaBounds §5.2a,
  with its laws and its instances at Rosser's and Bellotti–Wong's triples; §3.1 here writes
  *ZeroCountBound* `a₁ a₂ a₃ a₄ T₀` for it at `κ = 7/8`. The classical-region predicate of
  ExplicitZetaBounds §7.3a (no zero with `|Im s| ≥ t₀` and `Re s ≥ 1 − 1/(R log |Im s|)`), with its
  monotonicity and its instances at the constants of `gap:classical-zero-free-constants`;
  `Suggested.lean` carries a verbatim copy, `ClassicalZeroFreeRegion`, only to state
  `dusart_of_zeroFreeRegion`.
- Dirichlet characters and `L(s, χ)`: Mathlib `DirichletCharacter.LFunction`, with
  `DirichletCharacter.LFunction_apply_one_ne_zero` (`L(1, χ) ≠ 0` for `χ ≠ 1`); the statements
  `DirichletGRH χ` and `GRH`: AnalyticNumberTheoryPartI §1.6; Siegel–Walfisz: §0.32.
- Ramaré–Rumely's region for the zeros `β + iγ` of `L(s, χ)` with `|γ| ≥ H ≥ 1000`, for a primitive
  character of conductor `k` with their constant `C₁(k, H)`, and its form for a modulus `q`, with
  one constant for all the characters modulo `q`: ExplicitZetaBounds §7.5, fifth item and its end
  (`gap:dirichlet-zero-free-constants`). §6.1 here names the form for a modulus
  *RamareRumelyRegion* and applies it at Dusart's constant `C₁(q)`.
- The discriminant of a cyclotomic field, `|disc K| = n^{φ(n)}/∏_{p ∣ n} p^{φ(n)/(p − 1)}` for `K`
  a cyclotomic extension of `ℚ` of level `n ≥ 1`: Mathlib `IsCyclotomicExtension.Rat.natAbs_discr`.
  The conductor–discriminant formula `|disc ℚ(ζ_q)| = ∏_{χ mod q} f_χ` (`f_χ` the conductor of `χ`):
  ClassFieldTheory Layer 13. §6.5 proves only the two bounds for `log |disc ℚ(ζ_q)|` that its
  least-prime bounds use.
- The existence of an absolute constant `c > 0` with `(1 − β) log q ≥ c` for every real zero `β`
  of every primitive real `L(s, χ)` of conductor `q ≥ 3` (the uniform exclusion of Landau–Siegel
  zeros, with no numerical value of `c`): AnalyticNumberTheoryPartI §0.34. The proposition with a
  numerical `c` and a conductor cap `Q`, *HasLandauSiegelGap* `c Q`, and the two of its instances
  used here, a computation and an argument with explicit constants: ExplicitZetaBounds §7.9
  (`gap:real-zero-gap`), cited in §1.7; this roadmap owns only the consequences for its
  progression theorems (§6.7).
- The four finite-range inputs `SchoenfeldFiniteRangeInput`, `RosserSchoenfeldFiniteRangeInput`,
  `PrimeProductFiniteInput` and the theta clause of `ModEightFiniteInput` of
  AnalyticNumberTheoryPartI §§0.3, 0.5, 0.25, 0.16, and the theorems they gate (§§0.3, 0.5, 0.8,
  0.16, 0.19, 0.20, 0.25), in particular `θ(x) < 1.000081 x` for `x > 0` (§0.3 there) and both
  halves of Rosser–Schoenfeld's Theorem 1 for `x ≥ 59` (§0.5 there): imported by section, not
  restated. This roadmap adds only the theorems that prove those inputs from its own hypotheses
  (§§3.2, 3.5, 4.3, 6.1).
- Chebyshev's identity `log ⌊x⌋₊! = ∑_{n ≤ x} Λ(n) ⌊x/n⌋₊` with the two-sided bounds for
  `log ⌊x⌋₊!` at real `x ≥ 1`, and the von Mangoldt form
  `∑_{2 ≤ n ≤ x} Λ(n)/(n log n) = log log x + γ + O(1/log x)` of Mertens' second theorem, whose
  constant is identified there as `γ`: AnalyticNumberTheoryPartI §§0.11d and 0.26a (§§0.8, 4.3
  here).
- The Graham–Vaaler extremal majorant and minorant of `t ↦ 1_{t ≥ 0} e^{−νt}` with their `L¹`
  errors and closed forms, and the bounds for `(z coth z)′`: ExplicitZetaBounds §6.3a (§2.6 here).
  The density predicate *ZetaZeroDensityBound* and the Kadiri–Lumley–Ng density at an arbitrary
  verification height: ExplicitZetaBounds §§8.3–8.3a (§3.1(d) here).

### Not owned here

- The inequality `π(2x) − π(x) > 3x/(5 log x)` for `x ≥ 41/2`, the lower half of
  Rosser–Schoenfeld's Corollary 3: ClassicalArithmeticCompletion §6.34 (`dyadicPrimeCount`). §3.5
  states only the upper half, `0 < π(2x) − π(x) < 7x/(5 log x)` for `x > 1`.
- Products over primes (Mertens' third theorem with explicit constants, including the two product
  forms of Lee–Nosal's Corollary 1.3 under the Riemann hypothesis), the Möbius function and Euler
  products: ExplicitMultiplicativeFunctions, a consumer of Layers 2–4.
- The proof that Landau–Siegel zeros do not exist, in any of its forms: AnalyticNumberTheoryPartI
  §0.34 (see Consumed). The conditional bounds that assume a zero-free half-plane `Re s > 7/8` are
  not stated anywhere here: that half-plane has no published proof.
- Almost-all and probabilistic statements about primes in short intervals:
  ProbabilisticAndMetricNumberTheory Layer 5.
- Algorithms and computations: no prime generation, no primality proof, no Meissel–Lehmer method,
  no computation of zeros, no verification of a table or of a finite range. Every number a paper
  obtained by computation enters as data in a named proposition (Layer 1, or the section of the
  general theorem whose error function it evaluates) and is assumed, never established.
- The explicit Vinogradov–Korobov zero-free region: ExplicitZetaBounds §7.6 (given `RH(3·10¹²)`,
  *BrentPlattTrudgianRecord*, *HiaryRecord*, *PatelRecord* and *YangRecord*); the two theorems
  that need it (§3.6, §7.5) take that region as a hypothesis.
- The asymptotic prime-gap statements of Carneiro–Milinovich–Soundararajan (their Theorem 3 and
  Corollary 4), which rest on a Brun–Titchmarsh constant `36/11` that no roadmap plans; only their
  explicit Theorem 5 is a target (§2.5).
- Primes between consecutive `k`-th powers for every `n ≥ 1` with `k` below the `140` of §7.5:
  Cully-Hugill–Johnston's `k = 90` (`cully-hugill-johnston-2025` Theorem 1.4) and the preprint
  statements built on it, `k = 86` (`lee-2026` Theorem 1.2) and a prime in `[x, x + x^{1 − 1/n}]`
  for every `n ≥ 106` and real `x ≥ 1` (`visser-2025`, the third statement of its abstract). The
  route of the first rests on the averaged truncated explicit formula of that paper (its Theorem
  1.3, with a height `T* ∈ [T, 2T]` chosen by the averaging, at the rows with `α = 1/85` of its
  Table 1), which `lee-2026` also uses (its display (3.3)), and on Kadiri–Lumley–Ng's density at
  `σ₁ = 3/5` with the recomputed constants of `johnston-yang-2023` Table 3 (its §5), a constant
  `C₂(3/5)` that neither that paper nor the table prints (the table's rows start at `σ = 0.980`,
  `johnston-yang-2023` lines 1049–1073); the preprints add inputs that no refereed theorem states,
  the zero-free constants of a thesis (`lee-2026` §2.1, display (2.2)) and the real-`x` form read
  off the proof of the `k = 90` theorem (`visser-2025` §2.1, display (2.5)). None of them is stated
  here.
- The effective Chebotarev theorem under the generalised Riemann hypothesis for a general Galois
  extension (Bach–Sorenson's Theorem 5.1): §6.5 proves its rational instance for the characters
  modulo `q` directly from Dirichlet `L`-functions.

## Conventions

- `f = g + O*(h)` on a range means `|f(x) − g(x)| ≤ h(x)` for every `x` of the range. Every bound
  is stated in this form with its range. A threshold is written as the source states it (`x > x₀`
  or `x ≥ x₀`) unless the printed threshold fails, in which case the statement starts at the least
  point from which it holds and its provenance records the printed threshold.
- Real arguments throughout. `ψ(x) = ∑_{n ≤ x} Λ(n)` and `θ(x) = ∑_{p ≤ x} log p` are Mathlib's
  `Chebyshev.psi` and `Chebyshev.theta`, sums over `Finset.Ioc 0 ⌊x⌋₊`, inclusive at `x` and zero
  for `x < 2`. `π(x)` means `Nat.primeCounting ⌊x⌋₊`, inclusive at `x`.
- `Li x = TauCeti.Real.logIntegral x = ∫₂ˣ dt/log t`, so `Li 2 = 0`. `li` is the unoffset
  logarithmic integral of §0.3a, defined by the exponential-integral series
  `li x = γ + log |log x| + ∑_{n ≥ 1} (log x)ⁿ/(n · n!)` and equal to the Cauchy principal value
  `⨍₀ˣ dt/log t` for `x > 1`, so that `li x = Li x + li 2` for `x > 1`. The value
  `li 1` is junk. `li` is used only where the source uses it (Schoenfeld, Büthe, Trudgian,
  Platt–Trudgian, Johnston–Yang, Fiori–Kadiri–Swidinsky, Deléglise–Nicolas, Axler).
- The `n`-th prime `p_n` (with `p_1 = 2`) is `Nat.nth Nat.Prime (n − 1)`; Mathlib's `nth` is
  zero-based (`Nat.nth_prime_zero_eq_two`). Every published statement about `p_n` is transported
  with this shift, and `Nat.primeCounting (Nat.nth Nat.Prime k) = k + 1` (Tau Ceti's
  `Nat.primeCounting_nth_prime`) is the dictionary.
- Progressions: the modulus is `q : ℕ` and the residue `a : ZMod q`; `ψ(x; q, a)` is
  AnalyticNumberTheoryPartI's `psiAP q a x`, `π(x; q, a)` its `primeCountAP q a x`, `θ(x; q, a)` its
  theta sum. Coprimality of `a` and `q` is a hypothesis only where the source needs it. The sum
  `ψ̃(x; q, a) = ∑_{n ≤ x, n ≡ a (q)} Λ(n)/n` and the constants `C(q, a)` are defined in §0.2.
  Sources write `(x; k, l)` or `(x; a, q)`; this roadmap writes `(x; q, a)`.
- Zero-free regions. The *classical shape* with constant `R` is "`ζ(σ + it) ≠ 0` whenever `|t| ≥ 2`
  and `σ ≥ 1 − 1/(R log |t|)`"; the *Rosser–Schoenfeld shape* with constant `R` is "`ζ(σ + it) ≠ 0`
  whenever `|t| ≥ 21` and `σ ≥ 1 − 1/(R log(|t|/17))`". The classical shape with constant `R`
  implies the Rosser–Schoenfeld shape with the same `R` only for `|t|` large; each theorem names the
  shape it uses. A theorem that needs the region only for `|t| ≥ t₀` with `t₀ > 2` says so, and the
  classical shape implies that weaker hypothesis. Every published value of `R` (`9.645908801`,
  `6.455`, `5.69693`, `5.573412`, `5.5666305`) is a parameter, never a theorem.
- `RH(H)` means: every zero `ρ` of `riemannZeta` with `0 < Re ρ < 1` and `|Im ρ| ≤ H` has
  `Re ρ = 1/2`; `GRH(f, H)` the same for `DirichletCharacter.LFunction χ` and every primitive
  character `χ` modulo `f`. Both are ExplicitZetaBounds §0.2's (`RiemannHypothesisUpTo`,
  *DirichletGRHUpTo*). `GRH*(q, H)` abbreviates "`GRH(f, H)` for every `f ∣ q`", which by the
  passage to imprimitive characters of that section says that every character modulo `q`,
  imprimitive ones included, has its zeros of the open strip up to height `H` on `Re s = 1/2`
  (§1.2); `GRH*(1, H)` is `RH(H)`.
- `N(T)` counts the zeros of `ζ` with `0 < Im ρ ≤ T` in the critical strip with multiplicity, as
  ZerosOfLFunctions §4.5; `N(σ, T)` counts those with `σ ≤ Re ρ < 1` and `0 < Im ρ ≤ T`, the
  one-sided count of `kadiri-2013-density` lines 42–43 (a count over `|Im ρ| ≤ T` is `2N(σ, T)`);
  `N°(σ, T)` counts those with `σ < Re ρ < 1` and `0 < Im ρ < T`, the count of Kadiri–Lumley–Ng's
  density (ExplicitZetaBounds §8.3), so `N°(σ, T) ≤ N(σ, T)`.
  `M(T) = (T/2π) log(T/2π) − T/2π + 7/8`; a zero-counting error is measured against `M(T)`, that is
  with the `7/8` included, and a bound stated against `(T/2π) log(T/2πe)` moves to this
  normalisation by adding `7/8` to its constant.
- Euler's constant is Mathlib's `Real.eulerMascheroniConstant`; the Meissel–Mertens constant `B` is
  `TauCeti.LFunctions.mertensConstant ℚ`; their decimal values are propositions of §1.6, never
  asserted.
- A *table proposition* asserts that the general error function of a theorem, evaluated at the
  parameters of one row of a published table, is at most the row's value; it is stated in the
  section of that theorem, after the error function it evaluates. A *finite-range proposition*
  asserts a stated inequality on a stated bounded range, and is stated in Layer 1, except the two
  inputs of the Brun–Titchmarsh inequality, which Layer 0 uses and §0.1 states. Both are `Prop`s
  with their data in the statement, assumed and never established here (the finite range of
  Chebyshev's weight method, which Layer 0 also uses, is stated in §0.8). A theorem of Layers 4–7,
  or a transfer of §3.5 from `θ` to `π`, that consumes a Layer 3 bound is stated from that bound as
  an explicit pointwise hypothesis (its *input*), and the instance that supplies the input is named
  after it: the transfer is the theorem, and the instance is the composite with the Layer 3
  theorem. Where such a theorem needs only one finite-range fact (a gap bound below `4·10¹⁸`, the
  bounded-range clause of its own statement), that fact is a named proposition of Layer 1 of its
  own and is the hypothesis.
- A *zero input* is a statement about the zeros of `ζ` or of the `L(s, χ)` with numerical constants
  (a region, a bound for the number of zeros near `σ = 1`, a zero-counting error, a density) that
  a source uses and that no supplier states, or a truncated explicit formula for `ψ` with a
  numerical error that a source imports in a form no target here proves. It is a `Prop` with its
  constants in the statement, stated beside the theorem that uses it (or, for a computation on the
  low zeros, in §1.1), and it is a hypothesis of every instance that uses it. The general theorems of Layers 3, 6 and 7
  take the corresponding object as a parameter and depend on no zero input, with one exception: the
  closed form of §3.1(a), whose constants rest on Rosser's bound `ZetaZeroCubeSum` (§1.1) for the
  sum of `1/γ³` over the zeros, takes that computation as a hypothesis.
- Records behind a supplier region. A zero-free region, zero count or density of
  ExplicitZetaBounds is stated there under named verified heights and records (its §0.4b), which
  the supplier contracts list with each item. A theorem here that takes such an object as a
  hypothesis does not use those records; a statement here whose route obtains the object from the
  supplier (a lemma that cites the supplier's item, or an instance composed with it) carries them
  among its hypotheses, by name.
- Refereed and unrefereed sources. A statement whose only source is a preprint is a target like any
  other (its proof is planned here from the stated inputs), but it is marked *(preprint)* where it
  is stated, it is never the headline of its section, and the refereed statement it would sharpen
  is kept beside it with its own hypotheses. A preprint input that is itself a proof of a new
  theorem about zeros (the numerical real-zero gap of §1.7) enters only as a named hypothesis.
- `L(s, χ)` for a Dirichlet character `χ` is Mathlib's `DirichletCharacter.LFunction χ`. A *real
  zero* of `L(s, χ)` is a real `β ∈ (0, 1)` with `L(β, χ) = 0`; a primitive real character of
  conductor `q ≥ 3` is a Kronecker symbol, and its real zeros are those of every character it
  induces, the Euler factors at the primes dividing the modulus not vanishing on `Re s > 0`.

## Exact supplier contracts

### From Mathlib

- `Chebyshev.psi`, `Chebyshev.theta` (sums over `Finset.Ioc 0 ⌊x⌋₊`), `Chebyshev.psi_nonneg`,
  `Chebyshev.theta_nonneg`, `Chebyshev.psi_mono`, `Chebyshev.theta_mono`,
  `Chebyshev.psi_eq_zero_of_lt_two`, `Chebyshev.theta_eq_zero_of_lt_two`, `Chebyshev.theta_le_psi`,
  `Chebyshev.psi_eq_psi_coe_floor`, `Chebyshev.theta_eq_theta_coe_floor`.
- `Chebyshev.psi_eq_theta_add_sum_theta`: for `x ≥ 2`, `ψ(x) = θ(x) + ∑_{n=2}^{⌊log x/log 2⌋} θ(x^{1/n})`.
- `Chebyshev.theta_le_log4_mul_x`: `θ(x) ≤ (log 4) x` for `x ≥ 0`; `Chebyshev.psi_le_const_mul_self`:
  `ψ(x) ≤ (log 4 + 4) x` for `x ≥ 0`; `Chebyshev.abs_psi_sub_theta_le_sqrt_mul_log`:
  `|ψ(x) − θ(x)| ≤ 2 √x log x` for `x ≥ 1`; `Chebyshev.pi_le_log4_mul_div`:
  `π(x) ≤ (log 4) x/log √x + √x` for `x > 1`.
- Costa Pereira's comparisons (`Mathlib/NumberTheory/Chebyshev.lean`, section `CostaPereira`):
  `Chebyshev.psi_sub_theta_le_psi_add_psi_add_psi`, for every real `x`,
  `ψ(x) − θ(x) ≤ ψ(x^{1/2}) + ψ(x^{1/3}) + ψ(x^{1/5})`, and
  `Chebyshev.psi_sub_theta_ge_psi_add_psi_add_psi`, for real `x ≥ 0`,
  `ψ(x^{1/2}) + ψ(x^{1/3}) + ψ(x^{1/7}) ≤ ψ(x) − θ(x)`, the roots being real powers `x ^ (k : ℝ)⁻¹`;
  for §§0.3, 3.4a and 3.7.
- `IsPrimePow`, `Function.leftLim` and `Monotone.leftLim_le` (left limits of monotone functions),
  for §§0.3 and 0.6.
- `Chebyshev.primeCounting_eq_theta_div_log_add_integral`: for `x ≥ 2`,
  `π(⌊x⌋₊) = θ(x)/log x + ∫₂ˣ θ(t)/(t log² t) dt`;
  `Chebyshev.theta_eq_primeCounting_mul_log_sub_integral`: `θ(x) = π(⌊x⌋₊) log x − ∫₂ˣ π(⌊t⌋₊)/t dt`;
  `Chebyshev.integrableOn_theta_div_id_mul_log_sq`.
- `Nat.primeCounting`, `Nat.primeCounting'`, `Nat.primeCounting'_nth_eq`, `Nat.prime_nth_prime`,
  `Nat.add_two_le_nth_prime`, `Nat.nth_prime_zero_eq_two`, `Nat.nth_prime_one_eq_three`,
  `Nat.primesLE`, `Nat.mem_primesLE`; `Nat.exists_prime_lt_and_le_two_mul` (Bertrand);
  `Nat.totient`, `Nat.Coprime`, `ArithmeticFunction.moebius` (for §0.1).
- `ArithmeticFunction.vonMangoldt` (`Λ n = log (minFac n)` on prime powers, `0` elsewhere),
  `ArithmeticFunction.vonMangoldt_apply`, `ArithmeticFunction.vonMangoldt_nonneg`.
- `RiemannHypothesis` (every zero of `riemannZeta` that is neither a trivial zero nor `1` has real
  part `1/2`), `riemannZeta`, `DirichletCharacter.LFunction`, `analyticOrderNatAt`;
  `DirichletCharacter.LFunction_apply_one_ne_zero` (`L(1, χ) ≠ 0` for `χ ≠ 1`) and
  `DirichletCharacter.LFunction_ne_zero_of_one_le_re` (no zero on `Re s ≥ 1` away from the pole),
  in `Mathlib/NumberTheory/LSeries/Nonvanishing.lean`.
- `NumberField.discr`, `IsCyclotomicExtension` and `IsCyclotomicExtension.Rat.natAbs_discr`
  (`Mathlib/NumberTheory/NumberField/Cyclotomic/Basic.lean`): for `n ≥ 1` and `K` a cyclotomic
  extension of `ℚ` of level `n`, `|disc K| = n^{φ(n)}/∏_{p ∣ n} p^{φ(n)/(p − 1)}`, the quotient
  being exact. It is the value of the discriminant in §6.5.
- `Real.eulerMascheroniConstant`, `Real.one_half_lt_eulerMascheroniConstant`,
  `Real.eulerMascheroniConstant_lt_two_thirds` (the only enclosure of `γ` in the pin);
  `Real.pi_gt_d6`, `Real.pi_lt_d6`, `Real.exp_one_gt_d9`, `Real.exp_one_lt_d9`, `Real.log_two_gt_d9`,
  `Real.log_two_lt_d9`; `sum_mul_eq_sub_sub_integral_mul` (Abel summation).
- `Real.eulerMascheroniConstant_eq_neg_integral_log` (`γ = −∫₀^∞ e^{−t} log t dt`), `HasDerivAt`,
  `intervalIntegral`, `Asymptotics.IsBigO`, `Asymptotics.IsEquivalent`, for §0.3a;
  `Rat.HeightOneSpectrum.primesEquiv` (`Mathlib/NumberTheory/Padics/HeightOneSpectrum.lean`, the
  height-one primes of a ring of integers of `ℚ` against the rational primes) and `Ideal.absNorm`,
  for §0.3b.

### From Tau Ceti

- `TauCeti.Real.logIntegral x = ∫₂ˣ (log t)⁻¹ dt`, `TauCeti.Real.logIntegral_two`,
  `TauCeti.Real.logIntegral_nonneg`, `TauCeti.Real.le_logIntegral`,
  `TauCeti.Real.logIntegral_eq_div_log_sub_add` (`Li x = x/log x − 2/log 2 + ∫₂ˣ dt/log² t` for
  `x ≥ 2`), `TauCeti.Real.logIntegral_isEquivalent_div_log`,
  `TauCeti.Real.intervalIntegrable_inv_log_pow`, `TauCeti.Real.intervalIntegrable_div_mul_log_sq`.
- `TauCeti.LFunctions.mertensConstant K` (the limit of `∑_{N𝔭 ≤ x} 1/N𝔭 − log log x`) with
  `TauCeti.LFunctions.tendsto_primeSummatory_inv_absNorm_sub_log_log` and
  `TauCeti.LFunctions.isBigO_primeSummatory_inv_absNorm_sub_log_log_sub_mertensConstant`
  (`TauCeti/NumberTheory/LFunctions/Mertens.lean`); at `K = ℚ` the prime ideals of `𝓞 ℚ`
  correspond to the rational primes with norm `p`.
- `TauCeti.primeCount`, `TauCeti.primeTheta`, `TauCeti.primeCount_eq_card`,
  `TauCeti.primeCount_sub_mul_logIntegral_eq` (the number-field remainder identity, of which §0.4
  is the rational instance), `TauCeti.primeCount_univ_isEquivalent_div_log` (the prime ideal
  theorem `π_K(x) ∼ x/log x`, used at `K = ℚ` in §0.3b), and the prime number theorem in progressions
  `NumberField.Chebotarev.primeCount_primesCongruent_isEquivalent_logIntegral`.
- `Nat.primeCounting_nth_prime` (`π(p_k) = k + 1` for `p_k = Nat.nth Nat.Prime k`) and
  `Nat.primesLE_eq_image_nth`, declared in namespace `Nat` by Tau Ceti's
  `TauCeti/NumberTheory/PrimeCounting.lean`.

### From TauCetiRoadmap.ZerosOfLFunctions

- §4.1 `zeroCount`, §4.5 `N(T)` and the discreteness of the zero set; §6.2–6.4 the de la Vallée
  Poussin region with an existential constant and *IsExceptionalZero*; §7.4 the Riemann–von
  Mangoldt formula (inexplicit); §8.3 the truncated explicit formula `chebyshevPsi_explicitFormula`
  (with an inexplicit `O`), §8.4 the Weil explicit formula `riemannZeta_weilExplicitFormula` on
  the stated test class; §8.5 `primeIdealCount_effective` at `K = ℚ`; §8.7
  `primeCounting_progression_effective`; §8.9 the `Li` adapters; Layer 9 *AllOnCriticalLine*
  and the bridge of *GRH* at the `ζ` record to Mathlib's `RiemannHypothesis`.

### From TauCetiRoadmap.LFunctions

- Layer 4 `dirichletData` (the record of `L(s, χ)` with conductor, parity and functional equation),
  through ZerosOfLFunctions.

### From TauCetiRoadmap.ClassFieldTheory

- Layer 13, the abelian conductor–discriminant formula, at `ℚ(ζ_q)/ℚ`. There the characters of
  `Gal(ℚ(ζ_q)/ℚ) = (ℤ/q)^×` are the Dirichlet characters modulo `q`, and the same layer's
  identification of the least cyclotomic level with the finite part of the conductor makes their
  conductors the Dirichlet conductors `f_χ`. The formula then reads
  `log |disc ℚ(ζ_q)| = ∑_{χ mod q} log f_χ`. It is used only in Bach–Sorenson's route in §6.5.

### From TauCetiRoadmap.AnalyticNumberTheoryPartI

- §0.2 `psiAP q a x`, `primeCountAP q a x`, `thetaAP q a x` with the level-one identity
  `θ(x; 0, 1) = Chebyshev.theta x` and, for `q ≥ 1`, the sum over the classes modulo `q`, which is
  `Chebyshev.theta x` (both stated there in prose); §0.7 `quadratic_real_zero_le_of_bmor` (under its `BMORFiniteInput` and
  `BMORClassNumberInput`: for `q ≥ 3`, every real zero `β > 0` of `L(s, χ)` for a nonprincipal
  quadratic `χ` modulo `q` has `β ≤ 1 − 40/(√q log² q)`), for the exceptional clause of §6.3;
  §0.3, §0.5, §0.8, §0.16, §0.19, §0.20, §0.25 and their finite-range
  inputs `SchoenfeldFiniteRangeInput`, `RosserSchoenfeldFiniteRangeInput`, `ModEightFiniteInput`,
  `PrimeProductFiniteInput` (consumed by name in §0.6); §0.30 the rational Dirichlet-to-ray-class
  dictionary; §0.32 Siegel–Walfisz in the `ψ` form `siegel_walfisz`; §0.34 the existence of an
  absolute constant `c > 0` with `(1 − β) log q ≥ c` for the real zeros of primitive real
  `L(s, χ)`, consumed in §1.7 only as the statement that some gap exists; §1.6 `DirichletGRH χ` and
  `GRH` (`Suggested.lean` writes the body of `DirichletGRH` out in the hypothesis of the §6.5
  headline, so that it declares no second copy of the proposition);
  §1.9 `psi_sub_self_isBigO_of_riemannHypothesis` and `psiAP_isBigO_of_dirichletGRH` (consumed
  only as consistency checks); §0.11d `log_floor_factorial_eq_sum_vonMangoldt` with the bounds
  `x log x − x + 1 − log x ≤ log ⌊x⌋₊! ≤ x log x − x + 1 + log x` for real `x ≥ 1` (Mathlib's
  `Real.le_sum_log` and `Real.sum_log_le`), for §0.8 and §4.1; §0.26a
  `mertens_vonMangoldt_eulerGamma` (the constant of `∑ Λ(n)/(n log n) − log log x` is `γ`), for
  §4.3.

### From TauCetiRoadmap.SieveMethodsAndPrimePatterns

- §2.9 the large sieve for forbidden residues: for a finite set of primes `P`, forbidden residue
  sets `Ω_p ⊆ 𝔽_p` with `|Ω_p| < p`, and a sequence `a_n` supported on `H` consecutive integers and
  vanishing on every forbidden residue, `J(Q) |∑ a_n|² ≤ (H − 1 + Q²) ∑ |a_n|²`, where `J(Q)` is the
  sum over squarefree `d ≤ Q` composed of primes of `P` of `∏_{p ∣ d} |Ω_p|/(p − |Ω_p|)`. It is not
  an input of §0.1, whose input is the weighted large sieve of ExplicitZetaBounds §6.5; §0.1 states
  for itself the passage from a prime to a squarefree modulus that the proof of §2.9 contains.
- §3.1 `SieveDistribution.primeCountAP` (real `x`, modulus `q : ℕ`, residue `a : ℕ`, the
  congruence being equality at `q = 0`), for the agreement lemma of §0.6 only.

### From TauCetiRoadmap.ExplicitZetaBounds

ExplicitZetaBounds precedes this roadmap in the order of supply and owns the decimal constants of
the zero-free regions, the explicit zero counts, the zero densities, the weighted sums over the
ordinates and the verified heights. The zero inputs that particular sources use and that its
Not owned here leaves to the theorems needing them (Liu–Wang's four-zero bound, Ramaré's revised
density for `ζ`, Johnston–Yang's recomputed density constants, the low-height zero count
`0.28 log T` and the zero counts against `M(T)` at the triples of Trudgian and of Platt–Trudgian)
are this roadmap's
(Owned here), and so are the two other recomputations of Kadiri–Lumley–Ng's density at the height
`3·10¹²` with changed inputs (Fiori–Kadiri–Swidinsky's, Cully-Hugill's), whose constants are not
that roadmap's closed forms at any parameters. Kadiri–Lumley–Ng's theorem itself, with its closed
forms evaluated at an arbitrary verification height `H₀`, is that roadmap's §8.3, and
Cully-Hugill–Lee's density is its instance at `H₀ = 3 000 175 332 800` (§7.3). Ramaré–Rumely's
region for a primitive character of conductor `k`, with the constant `C₁(k, H)`, and its form for a modulus `q`, with one
constant for all the characters modulo `q`, are that roadmap's (its §7.5, fifth item and its end,
in `gap:dirichlet-zero-free-constants` below), as its Not owned here records; §6.1 here applies the
form for a modulus at Dusart's constant (*RamareRumelyRegion*). Each region, zero count, weighted
sum and density below is consumed under the verified heights and the records (ExplicitZetaBounds
§0.4b: *PlattRecord*, *BrentPlattTrudgianRecord*, *BordignonRecord*, *LuZamanZhaoRecord*,
*HiaryRecord*, *PatelRecord*, *YangRecord*, *BennettMartinOBryantRechnitzerRecord*) with which that
roadmap states it, listed with the item (Conventions). The following sections are consumed exactly
as that roadmap states them:

- §6.5, the weighted large sieve of Montgomery–Vaughan: for a finite set `X ⊂ ℝ/ℤ` with at least
  two points, `δ(x)` the distance from `x` to the rest of `X`, an integer `M`, `N ≥ 1` and complex
  `a_n` on `M < n ≤ M + N`, `∑_{x ∈ X} (N + (3/2) δ(x)⁻¹)⁻¹ |∑_n a_n e(nx)|² ≤ ∑ |a_n|²` (the
  constant `c = 3/2`, from the `3π/2` Hilbert inequality of AnalyticNumberTheoryPartI §1.5a). This
  is the input of the Brun–Titchmarsh inequality of §0.1, where `X` is the set of reduced fractions
  with denominator at most `Q ≥ 2`.
- §0.2, `RiemannHypothesisUpTo H` (`RH(H)`) and *DirichletGRHUpTo* `f H` (`GRH(f, H)`), with
  antitonicity in `H`, `RH(H) ↔ GRH(1, H)`, the limits `RiemannHypothesis` and `DirichletGRH`, and
  the passage to imprimitive characters: for `q ≥ 1`, every character modulo `q` has its zeros with
  `0 < Re s < 1` and `|Im s| ≤ H` on `Re s = 1/2` iff `GRH(f, H)` holds for every `f ∣ q`.
- §§0.3 and 0.4b, Platt's two records, named propositions there: *PlattRecord*, `GRH(f, H(f))` for
  `2 ≤ f ≤ 400 000` (`H(f) = max(10⁸/f, 7.5·10⁷/f + 200)` for even `f`,
  `max(10⁸/f, 3.75·10⁷/f + 200)` for odd `f`), and *PlattCentralRecord*, `L(1/2, χ) ≠ 0` for every
  primitive `χ` modulo `2 ≤ f ≤ 2·10⁶`; and, given *PlattRecord*, `GRH(f, 10⁸/f)` for
  `2 ≤ f ≤ 400 000`, `GRH(f, 10 000)` for `2 ≤ f ≤ 13` and `GRH(f, 2500)` for `2 ≤ f ≤ 40 000`;
  and, given *PlattRecord* and *PlattCentralRecord*, `LFunction_ne_zero_of_platt`: for `χ`
  primitive modulo `f ≤ 400 000` and real `0 < s < 1`, `L(s, χ) ≠ 0` (at `f = 1`, where `L = ζ`,
  without any record).
- §0.4, the recorded verifications `RH(545 439 823)`, `RH(30 610 046 000)` and
  `RH(3 000 175 332 800)`, and the absence of zeros of `ζ` with `0 < Re s < 1` and `|Im s| ≤ 14`.
- §5.2a, the zero-count predicate *ZetaZeroCountBound* `κ a₁ a₂ a₃ a₄ T₀`: for every `T ≥ T₀`,
  `|N(T) − (T/2π) log(T/(2πe)) − κ| ≤ a₁ log T + a₂ log log T + a₃ + a₄/T`, with its monotonicity
  (larger `a_i`, and `T₀' ≥ max(T₀, e)`), its shift (from `κ` to `κ'` at the cost `|κ − κ'|` in
  `a₃`) and Rosser's bound as its instance `(7/8) 0.137 0.443 1.588 0 2`. Since
  `(T/2π) log(T/(2πe)) + 7/8 = M(T)`, its case `κ = 7/8` measures the count against `M(T)`; §3.1
  writes *ZeroCountBound* `a₁ a₂ a₃ a₄ T₀` for *ZetaZeroCountBound* `(7/8) a₁ a₂ a₃ a₄ T₀`.
- §7.3a, the classical-region predicate: for real `R` and `t₀`, every `s` with `riemannZeta s = 0`
  and `|Im s| ≥ t₀` has `Re s < 1 − 1/(R log |Im s|)`; with its monotonicity (for `0 < R ≤ R'` and
  `1 < t₀ ≤ t₀'`) and its instances at the constants of `gap:classical-zero-free-constants`.
  `Suggested.lean`'s `ClassicalZeroFreeRegion` is a verbatim copy, used at `t₀ = 2π` in §3.1(a).
- §5.4, the weighted sums over the ordinates `γ > 0` of the zeros of `ζ`, counted with
  multiplicity, `Σ′` giving weight `1/2` to an ordinate equal to an end of the range. Lehman's
  form: for `2πe ≤ T₁ ≤ T₂` and `φ` continuous, nonnegative and non-increasing on `[T₁, T₂]`,
  `Σ′_{T₁ ≤ γ ≤ T₂} φ(γ) = (1/2π) ∫_{T₁}^{T₂} φ(t) log(t/2π) dt + O*(4 φ(T₁) log T₁ + 2 ∫_{T₁}^{T₂} φ(t) dt/t)`.
  Brent–Platt–Trudgian's form (`brent-platt-trudgian-2021`, Lemma 3 and Theorem 1), given
  *HiaryRecord* (through Trudgian's bound for `∫ S(t) dt` from `168π`, the next item of that
  section): for `φ` of
  class `C²` on `[T₀, ∞)` with `φ ≥ 0`, `φ′ ≤ 0`, `φ″ > 0` and `168π < T₀ ≤ T₁ ≤ T₂`,
  `Σ′_{T₁ ≤ γ ≤ T₂} φ(γ) − (1/2π) ∫_{T₁}^{T₂} φ(t) log(t/2π) dt = φ(T₂) Q(T₂) − φ(T₁) Q(T₁) + E₂`
  with `|E₂| ≤ 2(2.067 + 0.059 log T₁) |φ′(T₁)| + (0.059 + 1/150) φ(T₁)/T₁`, where `Q = N − M` and
  `N` at an ordinate is the mean of its one-sided limits; and the same with `T₂ = ∞` when
  `∫^∞ φ(t) log t dt < ∞` (the source's range `2π ≤ T₀` rests on a computation with the zeros below
  `168π` that the supplier does not state). Neither form contains the other: Lehman's asks no
  convexity and no record and starts at `2πe`; Brent–Platt–Trudgian's has the error
  `|φ′(T₁)| log T₁ + φ(T₁)/T₁` in place of `φ(T₁) log T₁` and starts at `168π`. Below `168π`
  Lehman's form, from `2πe`, and Rosser–Schoenfeld's Lemma 7 serve.
- §6.1, the smoothed truncated Perron formula with a free cut-off (Cully-Hugill–Johnston's
  Theorem 2.1): for `F(z) = ∑ a_n n^{−z}` absolutely convergent on `Re z > κ_a`, `κ > max(κ_a, 0)`,
  `T > 0`, `x ≥ 1` and `λ ≥ θ'/T` with `θ' = 2/(√(π² + 4) + π)`,
  `∑_{n ≤ x} a_n = (1/2πi) ∫_{κ−iT}^{κ+iT} F(z) x^z dz/z` up to
  `(x^κ/(πλT)) ∑_n |a_n|/n^κ + (1/(πT)) ∫_{θ'/T}^{λ} ∑_{|log(x/n)| ≤ u} |a_n| e^{κu} du/u²` in
  absolute value. It is the first input of the truncated explicit formula of §2.1, at
  `a_n = Λ(n)`.
- §7.2, Ford's intermediate region in the form with `log 0.618` in place of `log 3` in
  `J(t) = (1/6) log t + log log t + log 3`: given `RH(545 439 823)`, for `t ≥ 1.88·10¹⁴`, no zero of
  `ζ` with `σ ≥ 1 − (0.04962 − 0.0196/(J(t) + 1.15))/(J(t) + 0.685 + 0.155 log log t)`. It is the
  input of the region `ν₂` of §3.4 above the height `exp(91.2853)`.
- §7.9, *HasLandauSiegelGap* `c Q` (for every primitive real nonprincipal `χ` of conductor
  `3 ≤ q ≤ Q` and every real zero `β ∈ (0, 1)` of `L(s, χ)`, `(1 − β) log q ≥ c`), with its laws and
  the instances `(1/5, 10¹⁰)` and `(3.0·10⁻³, ∞)`.
- §6.3a, the extremal approximants of the one-sided exponential: for `ν > 0` and
  `I_ν(x) = e^{−νx}` on `x ≥ 0`, `0` on `x < 0`, the Graham–Vaaler functions `F^±_ν`, entire of
  exponential type `2π`, integrable, real on `ℝ`, with `F^−_ν ≤ I_ν ≤ F^+_ν`,
  `∫ (F^+_ν − I_ν) = 1/(1 − e^{−ν}) − 1/ν`, `∫ (I_ν − F^−_ν) = 1/ν − 1/(e^ν − 1)`, their Fourier-side
  form `F^±_ν = ∫_{−1}^{1} φ^±_ν(t) e(−tx) dt` with `φ^±_ν = 1_{[−1,1]}(Φ^{±,∘}_ν + sgn · Φ^{±,⋆}_ν)`,
  where `B^±(u) = (u/2)(coth(u/2) ± 1)`, `w = ν − 2πiz`, `Φ^{±,∘}_ν(z) = (1/2)(coth(w/2) ± 1)` and
  `Φ^{±,⋆}_ν(z) = (B^±(w) − B^±(ν))/(2πi)`, their closed forms, `B⁺` increasing and `B⁻` decreasing
  on `ℝ`, and the bounds `|(z coth z)′| < 1` on `|Im z| ≤ π/4` and `≤ |z|` on `|Im z| ≤ π/2`, with
  their consequences `|Φ^{±,⋆}_ν(z)| ≤ |z|` and `|(Φ^{±,∘}_ν + Φ^{±,⋆}_ν)(1 − z)| ≤ |z|` for
  `0 ≤ Re z ≤ 1/4`. They are the kernels of the bracketing theorem of §2.6.
- §8.3a, the density predicate *ZetaZeroDensityBound* `T₀ S c₁ c₂ p q` (for every `T ≥ T₀` and
  `σ ∈ S`, `N°(σ, T) ≤ c₁(σ) T^{p(σ)} (log T)^{q(σ)} + c₂(σ) log² T`), with its laws and the
  Kadiri–Lumley–Ng instances of its §8.3 at every verification height `H₀` (given `RH(H₀)` and
  *HiaryRecord*). It is the density input of the lemmas of §3.1(d).

Each item below is cited as a gap (`gap:<slug>`) wherever a theorem needs it; the general
theorems of Layers 3, 6 and 7 take the corresponding object as an explicit parameter, so only
their instances wait for these items.

What ExplicitZetaBounds must provide (gap:rh-up-to-height): For real `H`, the proposition `RH(H)` that every zero `s` of `riemannZeta` with `0 < Re s < 1` and `|Im s| ≤ H` has real part `1/2`, antitone in `H` and implied by Mathlib's `RiemannHypothesis`, with the recorded verifications at `H = 545 439 823`, `30 610 046 000` and `3 000 175 332 800` and the recorded verification that `ζ` has no zero `s` with `0 < Re s < 1` and `|Im s| ≤ 14`. Required location: target 20 (its §§0.2 and 0.4).

What ExplicitZetaBounds must provide (gap:grh-up-to-height): For each modulus `f ≥ 1` and real `H`, the proposition `GRH(f, H)` that every zero of `L(s, χ)` with `0 < Re s < 1` and `|Im s| ≤ H` has real part `1/2` for every primitive character `χ` modulo `f`, antitone in `H`, with the passage to imprimitive characters (every character modulo `q` has its zeros of the open strip up to height `H` on the line iff `GRH(f, H)` holds for every `f ∣ q`), Platt's record *PlattRecord*, the proposition `GRH(f, H(f))` for every `2 ≤ f ≤ 400 000`, `H(f) = max(10⁸/f, 7.5·10⁷/f + 200)` for even `f` and `max(10⁸/f, 3.75·10⁷/f + 200)` for odd `f` (`platt-2016` Theorem 7.1, arXiv numbering), whose ranges contain Rumely's (`rumely-1993` lines 29–36), with its corollaries at the heights `10⁸/f`, `10 000` and `2500`, and Platt's central record *PlattCentralRecord*, the proposition that `L(1/2, χ) ≠ 0` for every primitive `χ` modulo `2 ≤ f ≤ 2·10⁶` (`platt-2016` Theorem 7.2). Required location: target 20 (its §§0.2, 0.3 and 0.4b).

What ExplicitZetaBounds must provide (gap:classical-zero-free-constants): For `ζ`, given `RH(30 610 046 000)`, that no zero has `|t| ≥ 2` and `σ ≥ 1 − 1/(5.69693 log |t|)`; given `RH(3·10¹²)` and *BrentPlattTrudgianRecord*, that no zero has `|t| ≥ 2` and `σ ≥ 1 − 1/(R log |t|)` for each of `R = 5.573412` and `5.5666305` (both from the `5.558691` region of its §7.3), and that no zero has `|t| ≥ 21` and `σ ≥ 1 − 1/(9.645908801 log(|t|/17))`. Required location: target 16 (its §7.3).

What ExplicitZetaBounds must provide (gap:dirichlet-zero-free-constants): Given `RH(3·10¹²)`, *BrentPlattTrudgianRecord* and *PlattRecord*, for `q ≥ 2`, that the product of the `L(s, χ)` over the characters `χ` modulo `q` has at most one zero with `σ > 1 − 1/(6.4355 log max(q, q|t|, 1.7367))`, that zero being real, simple and of a real nonprincipal character (Kadiri); given `RH(545 439 823)`, *PlattRecord*, *BennettMartinOBryantRechnitzerRecord*, *HiaryRecord*, *PatelRecord* and *YangRecord*, for `3 ≤ q ≤ 400 000` and `χ` nonprincipal primitive modulo `q`, that `L(s, χ) ≠ 0` for `Re s ≥ 1 − 1/(5.60 log(q max(1, |Im s|)))`, with no exceptional zero (Kadiri's 2018 region, the second item of its §7.5, the region of `bennett-martin-obryant-rechnitzer-2018` Proposition 4.34 for the conductors `q ≥ 3`); given `RH(545 439 823)` and *PlattRecord*, for `q ≥ 3`, that the same product has at most one zero with `σ ≥ 1 − 1/(9.645908801 log max(q, q|t|))` (McCurley), and Thorner–Zaman's form over the primitive characters of conductor at most `Q`, whose possible exceptional zero `β₁`, a zero of `L(s, χ₁)` for one primitive `χ₁` of conductor `q₁ ∈ (400 000, Q]`, satisfies, given also *BordignonRecord*, `β₁ ≤ 1 − 100/(√q₁ log² q₁)` (`thorner-zaman-2024` Theorem 2.6); and, given `RH(545 439 823)` and *LuZamanZhaoRecord*, for `q ≤ 10¹⁰`, that the product has no zero with `σ > 1 − 1/(10 log max(q, q|t|, 10))` (`lu-zaman-zhao-2026` Corollary 1.2); and Ramaré–Rumely's region (`ramare-rumely-1996` lines 822–838, Theorem 3.6.3): for `χ` primitive of conductor `k ≥ 1` (at `k = 1`, `L(s, χ) = ζ(s)`) and `H ≥ 1000`, every zero `β + iγ` of `L(s, χ)` with `|γ| ≥ H` satisfies `1 − β ≥ 1/(9.645908801 log(k|γ|/C₁(k, H)))`, where `C₁(k, H) ≥ C₁ = 4.171838431` is the closed form of that theorem, a function of `H` and of the conductor through the local constants `D*(k, σ)` of their (3.4.3), with no record; and its form for a modulus, which ends that item: for `q ≥ 1`, `H ≥ 1000` and real `C` with `0 < C ≤ C₁(k_χ, H)` for the conductor `k_χ` of every character `χ` modulo `q`, every zero `β + iγ` of `L(s, χ)`, `χ` modulo `q`, with `0 < β < 1` and `|γ| ≥ H` satisfies `1 − β ≥ 1/(9.645908801 log(q|γ|/C))`. Required location: its §7.5.

What ExplicitZetaBounds must provide (gap:real-zero-gap): For real `c` and a conductor cap `Q ∈ ℕ ∪ {∞}`, the proposition *HasLandauSiegelGap* `c Q` that every real zero `β ∈ (0, 1)` of `L(s, χ)`, for every primitive real nonprincipal character `χ` of conductor `q` with `3 ≤ q ≤ Q`, satisfies `(1 − β) log q ≥ c`, with the named instances `(c, Q) = (1/5, 10¹⁰)` (the computation of `lu-zaman-zhao-2026`, Theorem 1.1) and `(c, Q) = (3.0·10⁻³, ∞)` (`banks-2026`, Theorem 1.1, with the first instance). Required location: target 18 and target 20 (its §7.9).

What ExplicitZetaBounds must provide (gap:vinogradov-korobov-constants): Given `RH(3·10¹²)`, *BrentPlattTrudgianRecord*, *HiaryRecord*, *PatelRecord* and *YangRecord*, for `|t| ≥ 3`, that `ζ` has no zero with `σ ≥ 1 − 1/(57.54 (log |t|)^(2/3) (log log |t|)^(1/3))`. Required location: target 17 (its §7.6).

What ExplicitZetaBounds must provide (gap:explicit-zero-count-error): With `N(T)` the number of zeros of `ζ` with `0 < Re ρ < 1` and `0 < Im ρ ≤ T` counted with multiplicity and `M(T) = (T/2π) log(T/2π) − T/2π + 7/8`, Rosser's bound `|N(T) − M(T)| ≤ 0.137 log T + 0.443 log log T + 1.588` for `T ≥ 2`, and, given *HiaryRecord*, *PatelRecord* and *YangRecord*, Bellotti–Wong's bounds `|N(T) − (T/2π) log(T/(2πe))| ≤ 0.10076 log T + 0.24460 log log T + 8.08344` and `≤ 0.11200 log T + 0.12567 log log T + 3.77417` for `T ≥ 30 610 046 000` (and for every `T ≥ e` given also its recorded bound for `S(T)`), which against `M(T)` hold with `7/8` added to the constants. Required location: its §5.2.

What ExplicitZetaBounds must provide (gap:dirichlet-zero-count-error): Given *BennettMartinOBryantRechnitzerRecord* (which covers `ℓ ≤ 6`), for a primitive character `χ` of conductor `q > 1` and `T ≥ 5/7` with `ℓ = log(q(T + 2)/(2π)) > 1.567`, that the number of zeros of `L(s, χ)` with `0 < Re ρ < 1` and `|Im ρ| ≤ T`, counted with multiplicity, is `(T/π) log(qT/(2π)) − T/π − χ(−1)/4 + O*(0.22737 ℓ + 2 log(1 + ℓ) − 0.5)`. Required location: target 9.

What ExplicitZetaBounds must provide (gap:explicit-zero-density): Given `RH(30 610 046 000)`, Kadiri's bound `N(σ, T) ≤ 0.5561 T + 0.7586 log T − 268 658` for `σ ≥ 17/20` and `T ≥ 3.061·10¹⁰`, with `N(σ, T)` the number of zeros of `ζ` with `σ ≤ Re ρ < 1` and `0 < Im ρ ≤ T` counted with multiplicity, and the general form `b₁(T − H) + b₂ log(T/H) + b₃` of her Theorem 1.1 (its §8.1); and, at every verification height `H₀` (the range `10⁹/H₀ ≤ k ≤ 1` forcing `H₀ ≥ 10⁹`), given `RH(H₀)` and *HiaryRecord*, Kadiri–Lumley–Ng's bound for the count `N°(σ, T)` of the zeros with `σ < Re ρ < 1` and `0 < Im ρ < T`, `N°(σ, T) ≤ (C₁/(2πd)) (log kT)^{2σ} (log T)^{5−4σ} T^{8(1−σ)/3} + (C₂/(2πd)) log² T` for `T ≥ H₀`, with `C₁`, `C₂` their closed forms (4.72)–(4.73) in the parameters of their Theorem 1.1, evaluated at `H₀` (`kadiri-lumley-ng-2018` lines 74–81), and its instance at `H₀ = 3.0610046·10¹⁰`, `N°(9/10, T) < 11.499 (log T)^{16/5} T^{4/15} + 3.186 log² T` for `T ≥ H₀` given `RH(30 610 046 000)` (its §8.3). Required location: its §§8.1 and 8.3.

## How to read the build

Layer 0 proves the Brun–Titchmarsh inequality with the constant `2` from the weighted large sieve,
Montgomery–Vaughan's lower bound for the diagonal sum and two finite-range propositions,
builds the carriers that the library lacks (`li`, `ψ̃`, `C(q, a)`, the half-weight functions), the
rational prime-count adapter with `p_n ∼ n log n`, Chebyshev's elementary bounds, and the exact
transfer identities between `ψ`, `θ`, `π`, `Li` and `li`, so that every later bound for one of these
functions converts into bounds for the others by a theorem rather than by a repeated argument. Layer 1 states, as assumptions, every computational
fact that needs no later definition, once: the finite-range verifications, the prime-gap
verifications, the progression tabulations and the two decimal enclosures, and it cites the
bounded-height hypotheses and the real-zero gap from ExplicitZetaBounds; a table of constants
evaluates the error function of a general theorem and is stated in that theorem's section. Layer 2
proves the bounds that hold under the Riemann hypothesis and under the Riemann hypothesis to a
height, from the explicit formula, including the extremal-kernel bound that uses the verified
zeros alone, and it proves the truncated explicit formula for `ψ` with a numerical error. Layer 3
proves the general unconditional scheme, whose general form takes a zero density, in its smoothed
form and in Pintz's form on the truncated explicit formula, and its two density-free special cases
(a region with the zeros below height `14` excluded; a region with a verified height and a
zero-counting error), specialises it to the
published constants for `ψ` and `θ`, then transfers to `π`. Layers 4 and 5 derive sums over primes and bounds for the `n`-th prime by
partial summation and inversion of the Layer 3 bounds, each stated from its Layer 3 input. Layer 6 repeats the scheme for a residue class modulo `q` with the zero data of the
characters as parameters, applies Ramaré–Rumely's region for a modulus at Dusart's constant,
and records which exceptional-modulus clauses a numerical real-zero gap removes, and Layer 7 derives
the unconditional short-interval theorems from the smoothed explicit formula (§§7.2–7.3), the
truncated explicit formula of §2.1 (§7.5) and the Layer 3 bounds (§§7.1, 7.4). Each layer ends with its examples and its dependencies; a `*Needs:*` line lists what a
statement and its route use, item by item.

## Layer 0: the Brun–Titchmarsh inequality, carriers and transfer identities

### 0.1 The Brun–Titchmarsh inequality

For real `z`, coprime positive integers `k`, `l`, write `π(z; k, l)` for the number of primes
`p ≤ z` with `p ≡ l (mod k)`. For real `u ≥ 1` write `S(u) = ∑_{q ≤ u} μ²(q)/φ(q)`, the diagonal
sum of the large sieve, and for integers `Q ≥ 2` and `N ≥ 1` write
`L(Q, N) = ∑_{q ≤ Q} μ²(q)/(φ(q)(N + (3/2) qQ))`, the weighted diagonal sum.

The route below assumes two finite-range propositions, stated here rather than in Layer 1 because
Layer 0 uses them:

- `MVDiagonalFiniteRange`: for every real `u` with `6 ≤ u < 10⁹`, `S(u) ≥ log u + 1.07`
  (`montgomery-vaughan-1973` Lemma 7, its range below `10⁹`).
- `BrunTitchmarshFiniteRange`: for every integer `n` with `25 ≤ n ≤ 2·10⁴` there is an integer
  `Q ≥ 2` with `1/L(Q, n + 1) + π(Q) ≤ 2n/log n` (the weighted sieve of `montgomery-vaughan-1973`
  Theorem 2 on the range `25 ≤ y/k ≤ 2·10⁴`).

The diagonal bound. Prove that `S(u) > log u` for every real `u ≥ 1`, and, under
`MVDiagonalFiniteRange`, that `S(u) ≥ log u + 1.07` for every real `u ≥ 6` (the inequality of
`montgomery-vaughan-1973`, Lemma 7, cited by locator).

- Kernel identity: for squarefree `n`,
  `μ²(n)/φ(n) = n⁻¹ ∏_{p ∣ n} (1 − 1/p)⁻¹ = n⁻¹ ∑_{rad j ∣ n} 1/j`, and every positive integer `m`
  factors uniquely as `m = nj` with `n = rad m`; hence
  `S(u) = ∑_{rad m ≤ u} 1/m ≥ ∑_{m ≤ u} 1/m ≥ log(⌊u⌋ + 1) > log u`.
- The explicit asymptotic (`buthe-2014` lines 462–469, Lemma 4.5, where `S` is the sum `S₁` of
  lines 141–146 and `O*` is Turing's `Θ` of lines 65–66): for real `u ≥ 10⁹`,
  `S(u) = log u + γ + ∑_p log p/(p(p − 1)) + O*(58/√u)`. Route (lines 470–600): Dirichlet
  convolution of `μ²(n) n/φ(n)` with `μ`, explicit Euler-product bounds for the resulting
  coefficients, and partial summation. Since `γ > 1/2` (Mathlib), the primes `2, 3, 5, 7` alone
  give `∑_p log p/(p(p − 1)) > 0.656`, and `58/√u ≤ 0.0019` for `u ≥ 10⁹`, `S(u) ≥ log u + 1.15`
  there.
- The bound for `u ≥ 6`: from the asymptotic for `u ≥ 10⁹`, and `MVDiagonalFiniteRange` below.

Prove `brun_titchmarsh`: under `MVDiagonalFiniteRange` and `BrunTitchmarshFiniteRange`, for real
`x, y > 0` and coprime positive integers `k`, `l` with `y > k`,

```text
π(x + y; k, l) − π(x; k, l) ≤ 2y/(φ(k) log(y/k))
```

(`montgomery-vaughan-1973`, Theorem 2, cited by locator; the statement as quoted at `tmeemt-art14`
lines 82–87; `pnt-plus`). The constant `2` holds for every `x > 0` and every `y > k`, with no lower
bound on `x` and no secondary term; the two propositions are the computational facts the route below
assumes.

Route, after Montgomery–Vaughan, whose proof argues from the weighted large sieve: the
unweighted sieve gives the constant `2` only up to a factor `1 + O(log log(y/k)/log(y/k))`, and the
weights remove that factor (`montgomery-1978` lines 377–388 and 517–528). Put `t = y/k`. The
integers of `(x, x + y]` in the class of `l` are `l₀ + km` for `m` in an interval of
`N ≤ ⌊t⌋ + 1` consecutive integers; let `a_m` be the indicator of the `m` for which `l₀ + km` is a
prime larger than `Q`, `Z = ∑ a_m` and `S(α) = ∑ a_m e(mα)`. For a prime `p ≤ Q` with `p ∤ k` the
sequence vanishes on the class of `m` with `p ∣ l₀ + km`, which exists because `p ∤ k`; the primes
dividing `k` forbid nothing.

- The reduced fractions `a/q` with `q ≤ Q` form a set of at least two points of `ℝ/ℤ` when
  `Q ≥ 2`, and two distinct ones `a/q`, `a′/q′` lie at distance at least `1/(qq′) ≥ 1/(qQ)`, so
  the weighted large sieve (ExplicitZetaBounds §6.5, with `c = 3/2`) gives
  `∑_{q ≤ Q} ∑*_{a mod q} (N + (3/2) qQ)⁻¹ |S(a/q)|² ≤ ∑ |a_m|² = Z`.
- For squarefree `q` prime to `k`, `∑*_{a mod q} |S(a/q)|² ≥ Z²/φ(q)`. For a prime `p`,
  `∑_{a mod p} |S(a/p)|² = p ∑_h Z(p, h)²`, where `Z(p, h)` counts the `m` of the support with
  `m ≡ h (mod p)` (`montgomery-1978` lines 482–497); Cauchy–Schwarz over the at most `p − 1`
  classes that meet the support gives at least `p Z²/(p − 1)`, so the terms with `a ≢ 0` contribute
  at least `Z²/(p − 1)`. A squarefree `q = pq′` follows by induction, applying the prime case to
  the twisted sequences `a_m e(mb/q′)`, `b` prime to `q′`, which vanish on the same classes; this
  is the step from one prime to a squarefree modulus in the forbidden-residue sieve of
  SieveMethodsAndPrimePatterns §2.9, stated here because that section does not state it alone.
- Together, `Z ≤ 1/L_k(Q)` with `L_k(Q) = ∑_{q ≤ Q, (q, k) = 1} μ²(q)/(φ(q)(N + (3/2) qQ))`.
  Writing a squarefree `q ≤ Q` as `dq′` with `d ∣ k` and `(q′, k) = 1`, the weight decreasing in
  `q` and `∑_{d ∣ k} μ²(d)/φ(d) = k/φ(k)` give `L₁(Q) ≤ (k/φ(k)) L_k(Q)`, where `L₁(Q) = L(Q, N)`;
  the primes of the class up to `Q` number at most `π(Q)`. The count is therefore at most
  `(k/φ(k)) (1/L(Q, N) + π(Q))`, `L(Q, N)` decreases in `N`, and `N ≤ ⌊t⌋ + 1`; it remains to find,
  for each `t`, an integer `Q ≥ 2` with `1/L(Q, ⌊t⌋ + 1) + π(Q) ≤ 2t/log t`, a statement about `t`
  alone. On `[n, n + 1)` the left side does not move and the right side increases, so the
  integers `t = n` are the worst points.
- For `t ≥ 2·10⁴`, put `N = ⌊t⌋ + 1` and `Q = √(2N/3)` (its integer part does at least as well,
  the weights only growing with `Q`). Abel summation of `L(Q, N)` against `S`, with the diagonal
  bound on `[6, Q]` and `S ≥ 0` below `6`, gives
  `N L(Q, N) ≥ (log 6 + 1.07)/(1 + u) + log(1 + u) + log(Q/12) ≥ ½ log N + c(N)`, where
  `u = 9Q/N = 9 √(2/(3N))` and `c(N) = 0.17412 − 1.8618 u − u²/2`, from `1/(1 + u) ≥ 1 − u` and
  `log(1 + u) ≥ u − u²/2`. At `u = 0` the weights cost `½ log 6 = 0.896` against the main term
  `½ log N` and the constant `1.07` repays it with `0.174` to spare; `c(N)` increases from `0.0760`
  at `N = 2·10⁴ + 1` towards `0.17412`. With `π(Q) ≤ Q/3 + 2` (the integers up to `Q` prime to
  `6`, less `1`, with `2` and `3`) it remains that
  `2N/(log N + 2c(N)) + Q/3 + 2 ≤ 2(N − 1)/log(N − 1)`, an inequality in one variable whose two
  sides differ by `20.4` at `N = 2·10⁴ + 1` and by about `0.70 N/log² N` for large `N`.
- For `25 ≤ t < 2·10⁴ + 1`, `BrunTitchmarshFiniteRange` at `n = ⌊t⌋` supplies `Q`.
- For `1 < t < 25` the members of the class prime to `6`, together with `2` and `3`, are already
  fewer than `2y/(φ(k) log t)`, whichever of `2` and `3` divide `k`.

- At `k = 1` it reads `π(x + y) − π(x) ≤ 2y/log y` for `y > 1`; this is the form the
  prime-power and edge estimates of §2.5 use.
- The right side does not depend on `x` and depends on `k` only through `φ(k) log(y/k)`.
- The hypothesis `y > k` makes `log(y/k)` positive; the coprimality of `k` and `l` is what makes
  `φ(k)` the density of the class.

*Needs:* ExplicitZetaBounds §6.5 (the weighted large sieve with `c = 3/2`); `buthe-2014` Lemma 4.5
(the explicit asymptotic, proved here); `MVDiagonalFiniteRange`, `BrunTitchmarshFiniteRange`;
Mathlib `Nat.totient`, `ArithmeticFunction.moebius`, `Nat.Coprime`, `Nat.primeCounting`,
`Real.eulerMascheroniConstant`, `sum_mul_eq_sub_sub_integral_mul`.

**Checks.**

- At `y = k` the right side is `2k/(φ(k) · 0)`, which in Lean's real division is the junk value
  `0`, while `(1.5, 2.5]` holds the prime `2` at `k = 1`: the hypothesis `y > k` cannot be relaxed to
  `y ≥ k`.
- The constant `1.07` cannot be replaced by the elementary `γ` of `∑_{m ≤ u} 1/m ≥ log u + γ`
  (negative control): the Abel summation of the case `t ≥ 2·10⁴` with `γ` in place of `1.07` gives
  `N L(Q, N) ≈ ½ log N − 0.319`, so
  `1/L(Q, N) > 2N/log N > 2t/log t` and the route fails for every large `t`.

### 0.2 The logarithmic progression sum and its Mertens constant

Define *logPsiAP* `q a x = ∑_{n ∈ Ioc 0 ⌊x⌋₊, (n : ZMod q) = a} Λ(n)/n` for a modulus `q : ℕ`, a
residue `a : ZMod q` and real `x`: the sum `ψ̃(x; q, a)` of Ramaré and of Platt–Ramaré.

- *logPsiAP* `q a x = 0` for `x < 2`; it is monotone in `x` and nonnegative.
- Level one: *logPsiAP* `1 0 x = ∑_{n ≤ x} Λ(n)/n`; for `q ≥ 1` the sum over all `a : ZMod q` is
  *logPsiAP* `1 0 x`.
- Abel summation: for `x ≥ 1`, *logPsiAP* `q a x = ψ(x; q, a)/x + ∫₁ˣ ψ(t; q, a)/t² dt`, with
  `ψ(·; q, a) = psiAP q a` of AnalyticNumberTheoryPartI §0.2.

Define *mertensProgressionConstant* `q a`, written `C(q, a)`, as `limUnder atTop` of
`x ↦ logPsiAP q a x − log x/φ(q)`.

- Existence: for `q ≥ 1` and `a` a unit of `ZMod q`, the limit exists and equals
  `1/φ(q) + ∫₁^∞ (ψ(t; q, a) − t/φ(q))/t² dt`, the integral converging absolutely because
  Siegel–Walfisz (AnalyticNumberTheoryPartI §0.32, `ψ` form, at `A = 2` and fixed `q`) gives
  `ψ(t; q, a) − t/φ(q) = O(t/log² t)`. Hence for every `x ≥ 1`
  `logPsiAP q a x − log x/φ(q) − C(q, a) = E(x)/x − ∫ₓ^∞ E(t)/t² dt` with
  `E(t) = ψ(t; q, a) − t/φ(q)`: the exact transfer identity of §0.7.
- Closed form (Ramaré, `ramare-2002` lines 74–86, Corollaire 1): for `q ≥ 1` and `a` a unit,
  `C(q, a) = −(1/φ(q)) (γ + ∑_{p | q} log p/(p − 1) + ∑_{χ ≠ χ₀} conj χ(a) (L'/L)(1, χ))`, the
  last sum over the nonprincipal characters modulo `q`. Route: orthogonality of characters writes
  *logPsiAP* `q a x = φ(q)⁻¹ ∑_χ conj χ(a) ∑_{n ≤ x} χ(n) Λ(n)/n`; for `χ ≠ χ₀` the inner sum tends
  to `−(L'/L)(1, χ)` by Abel summation from `ψ(x, χ) = O(x exp(−c √log x))` (ZerosOfLFunctions
  §8.6 at `K = ℚ` through §0.30 of AnalyticNumberTheoryPartI) and the identity
  `−(L'/L)(s, χ) = s ∫₁^∞ ψ(t, χ) t^{−s−1} dt` on `Re s > 1` continued to `s = 1` by `L(1, χ) ≠ 0`;
  for `χ₀` the inner sum is `∑_{n ≤ x} Λ(n)/n − ∑_{p | q} ∑_{p^k ≤ x} log p/p^k`, and
  `∑_{n ≤ x} Λ(n)/n = log x − γ + o(1)` because `−ζ'/ζ(s) − s/(s − 1) = s ∫₁^∞ (ψ(t) − t) t^{−s−1} dt`
  tends to `−γ − 1` as `s → 1⁺` (the Laurent expansion `ζ(s) = 1/(s − 1) + γ + O(s − 1)`) while the
  integral tends to `∫₁^∞ (ψ(t) − t)/t² dt` by dominated convergence under
  `ψ(t) − t = O(t/log² t)` (ZerosOfLFunctions §8.5 at `K = ℚ`).
- The non-unit classes: for `a` not a unit, *logPsiAP* `q a x` is bounded in `x` (only prime powers
  dividing a power of `q` contribute), so no constant exists and the limit is junk; the existence
  theorem carries the unit hypothesis.

*Needs:* Mathlib `ArithmeticFunction.vonMangoldt`, `ZMod`, `DirichletCharacter.LFunction`,
`DirichletCharacter.sum_char_inv_mul_char_eq`, the Laurent coefficient of `riemannZeta` at `1`
(`Mathlib/NumberTheory/Harmonic/ZetaAsymp.lean`), `Real.eulerMascheroniConstant`, Abel summation
`sum_mul_eq_sub_sub_integral_mul`, `DirichletCharacter.LFunction_apply_one_ne_zero`
(`L(1, χ) ≠ 0`); AnalyticNumberTheoryPartI §0.2 `psiAP`, §0.30, §0.32; ZerosOfLFunctions §§8.5,
8.6.

**Checks.**

- `C(1, 0) = −γ`: the closed form has no prime factor and no nonprincipal character. A definition
  that forgot the `−1` of the Abel boundary term would give `1 − γ`.
- `C(2, 1) = −γ − log 2`: `φ(2) = 1`, the prime `2` contributes `log 2/(2 − 1)`, and there is no
  nonprincipal character. Directly, `∑_{n ≤ x, n odd} Λ(n)/n = ∑_{n ≤ x} Λ(n)/n − ∑_{2^k ≤ x} log 2/2^k`
  and the subtracted sum tends to `log 2 · ∑_{k ≥ 1} 2^{−k} = log 2`.
- `C(4, 3) − C(4, 1) = (L'/L)(1, χ₄)` for the nontrivial character `χ₄` modulo `4`: in the closed
  form the character sum is `−(1/2)(χ₄(3) − χ₄(1)) (L'/L)(1, χ₄) = (L'/L)(1, χ₄)`. A definition
  through the full sum `∑_{n ≤ x} Λ(n)/n` would make the two classes equal. Also
  `C(4, 1) + C(4, 3) = −γ − log 2 = C(2, 1)`, since the odd integers are the union of the two classes.
- For `q = 2`, `a = 0`: *logPsiAP* `2 0 x = ∑_{2^k ≤ x} log 2/2^k ≤ log 2`, so
  `logPsiAP 2 0 x − log x/φ(2) → −∞`; the unit hypothesis of the existence theorem cannot be dropped.

### 0.3 The difference ψ − θ

For `x ≥ 2`, `ψ(x) − θ(x) = ∑_{k=2}^{K} θ(x^{1/k})` with `K = ⌊log x/log 2⌋`
(`Chebyshev.psi_eq_theta_add_sum_theta`); the terms with `k ≥ 3` are at most `(K − 2)⁺ · θ(x^{1/3})`.

- Unconditional bound: for `x ≥ 1`, `0 ≤ ψ(x) − θ(x) ≤ (log 4)(√x + (log x/log 2 − 2)⁺ x^{1/3})`,
  from `Chebyshev.theta_le_log4_mul_x` termwise (`schoenfeld-1976` line 672 displays the same
  decomposition).
- Transfer from a `θ`-bound: let `c ≥ 0` with `θ(y) ≤ c y` for all `y > 0`, and `y₀ ≥ 1`, `ε ≥ 0`
  with `|θ(y) − y| ≤ ε y` for all `y ≥ y₀`. Then for every `x ≥ max(4, y₀²)`,
  `(1 − ε)√x ≤ ψ(x) − θ(x) ≤ (1 + ε)√x + c (log x/log 2 − 2) x^{1/3}`.
  The lower bound uses only the lower `θ`-bound at `√x ≥ y₀`.
- Consequently, from a `ψ`-bound `|ψ(y) − y| ≤ ε(y) y` on `[y₀, ∞)` one gets
  `|θ(x) − x| ≤ ε(x) x + (log 4)(√x + (log x/log 2 − 2)⁺ x^{1/3})` for `x ≥ y₀`, and from a `θ`-bound
  the corresponding `ψ`-bound with the same correction; these are the conversions used throughout.
- The number of prime powers: for real `N ≥ 2`, the prime powers `m ≤ N` (Mathlib's `IsPrimePow`,
  exponent at least `1`) number `∑_{k ≥ 1} π(N^{1/k}) ≤ π(N) + (log N/log 2 − 1)√N ≤ 6 N/log N`;
  in particular, for every integer `N ≥ 2` the prime powers below `N` number at
  most `6 N/log N`, so that count is `O(N/log N)`. Route: the terms `k ≥ 2` are at most `√N` each
  and vanish once `N^{1/k} < 2`; Mathlib's `Chebyshev.pi_le_log4_mul_div` gives
  `π(N) ≤ 2 (log 4) N/log N + √N`; and `(log² N/log 2)/√N ≤ 16/(e² log 2) < 3.13`, the maximum of
  `L² e^{−L/2}` being at `L = 4`, while `2 log 4 < 2.78`.
- The general-input bounds of Broadbent–Kadiri–Lumley–Ng–Wilk
  (`broadbent-kadiri-lumley-ng-wilk-2021` (2.4), Propositions 3–4, Corollary 3.1 and Theorem 5,
  arXiv numbering, for an arbitrary `θ`-input; `pnt-plus`, `ieantn`). For real `x ≥ 1` put
  `f(x) = ∑_{k=3}^{⌊log x/log 2⌋} x^{1/k − 1/3}` (zero for `x < 8`), so that `∑_{k ≥ 3} θ(x^{1/k})`
  has exactly the terms `3 ≤ k ≤ log x/log 2`, the others vanishing. Let `c ≥ 0` with `θ(y) ≤ c y`
  for every `y > 0`. Then:
  - `∑_{k ≥ 3} θ(x^{1/k}) ≤ c f(x) x^{1/3}` for every `x ≥ 1`, and `f(x) ≤ (log x/log 2 − 2)⁺`,
    so the cube-root term of the transfer above is the crude case of this bound;
  - `f` is strictly decreasing on each `[2^n, 2^{n+1})` with `n ≥ 4` (the terms are fixed there and
    their exponents `1/k − 1/3` are negative for `k ≥ 4`), `f(2^n) = 1 + ∑_{k=4}^{n} 2^{n/k − n/3}`,
    and `f(2^{n+1}) < f(2^n)` for every `n ≥ 9` (`f(2⁸) = 3.167 < f(2⁹) = 3.211`, so `9` cannot be
    lowered). Hence for `X ≥ 2⁹` and every `x ≥ X`,
    `f(x) ≤ F(X) := max(f(X), f(2^{⌊log X/log 2⌋ + 1}))`, and
    `∑_{k ≥ 3} θ(x^{1/k}) = ψ(x) − θ(x) − θ(√x) ≤ c F(X) x^{1/3}`;
  - if moreover `c′ ≥ 0` with `θ(y) ≤ c′ y` for every `y ≥ √X`, then
    `ψ(x) − θ(x) ≤ c′ √x + c F(X) x^{1/3}` for every `x ≥ X ≥ 2⁹`. With a `ψ`-input
    `|ψ(y) − y| ≤ ε(b) y` for `y ≥ e^b` and `θ(y) < y` on `(0, x₁]`, `x₁ ≥ e⁷`, the choices
    `c = 1 + ε(log x₁)`, `c′ = a₁(b)`, the value `1 + ε(log x₁)` for `b ≤ 2 log x₁` and
    `1 + ε(b/2)` beyond, and `X = e^b`, `b ≥ 7` (`e⁷ > 2⁹`), give their Theorem 5,
    `ψ(x) − θ(x) ≤ a₁(b) √x + a₂(b) x^{1/3}` for `x ≥ e^b` with `a₂(b) = c F(e^b)`, whose default
    instance is §3.7's;
  - with the same `ψ`-input, `θ(x) ≤ (1 + ε(log x₁)) x` for every `x > 0`, and, given `c₀` with
    `ψ(y) ≤ c₀ y` for every `y > 0`,
    `θ(x) ≥ (1 − ε(b) − c₀ (e^{−b/2} + e^{−2b/3} + e^{−4b/5})) x` for every `x ≥ e^b`, `b > 0`
    (their Lemma 11, at Rosser–Schoenfeld's `c₀ = 1.03883` of §3.2), the second from Costa
    Pereira's comparison `Chebyshev.psi_sub_theta_le_psi_add_psi_add_psi` (Mathlib). If
    instead `θ(y) ≥ (1 − η) y` for `y ≥ √X`, then `ψ(x) − θ(x) ≥ (1 − η)√x + θ(x^{1/3})` for
    `x ≥ X` (their Proposition 4, lower half).

  Route: termwise, the terms with `x^{1/k} < 2` vanishing; the monotonicity of `f(2^n)` from
  `f(2^n) − f(2^{n+1}) = ∑_{k=4}^{n} 2^{(n+1)/k}(2^{1/3 − 1/k} − 1) 2^{−(n+1)/3} − 2^{1 − (n+1)/3}`,
  whose sum is at least its value at `n = 9`, where `∑_{k=4}^{9} 2^{10/k}(2^{1/3 − 1/k} − 1) > 2.12 > 2`.

*Needs:* Mathlib `Chebyshev.psi_eq_theta_add_sum_theta`, `Chebyshev.theta_le_log4_mul_x`,
`Chebyshev.theta_nonneg`, `Chebyshev.theta_mono`, `Chebyshev.pi_le_log4_mul_div`,
`Chebyshev.psi_sub_theta_le_psi_add_psi_add_psi`, `IsPrimePow`.

**Checks.**

- `x = 8`: `K = 3`, `ψ(8) − θ(8) = Λ(4) + Λ(8) = 2 log 2`, and
  `θ(√8) + θ(8^{1/3}) = θ(2.83) + θ(2) = 2 log 2`. Keeping only `θ(√x)` gives `log 2`, so the terms
  `k ≥ 3` are needed.
- `x = 3`: `K = 1`, the sum is empty and `ψ(3) = θ(3) = log 6`; the bound `(log 4)(√3 + 0)` is
  `2.40 ≥ 0`.

### 0.3a The unoffset logarithmic integral

Define `li x = γ + log |log x| + ∑_{n ≥ 1} (log x)ⁿ/(n · n!)` for real `x > 0`, `x ≠ 1`, with
`γ = Real.eulerMascheroniConstant` (`pnt-plus`, `ieantn`; `Suggested.lean`'s `li`, whose
`log (log x)` is Mathlib's `log |log x|`; the value at `x = 1` is junk). It is the exponential
integral `Ei` at `log x`: the series converges absolutely for every real `log x`, its terms being at
most `|log x|ⁿ/n!`. Prove:

- Derivative: for `x > 0`, `x ≠ 1`, `li` is differentiable at `x` with `li′(x) = 1/log x`.
  Route: with `y = log x`, termwise differentiation of the series gives
  `1/y + ∑_{n ≥ 1} y^{n−1}/n! = 1/y + (e^y − 1)/y = e^y/y`, and the chain rule divides by `x = e^y`.
- Behaviour at `0`: `li x → 0` as `x → 0⁺`. Route: for `0 < x < 1`
  put `z = −log x`; termwise integration of the exponential series gives
  `∑_{n ≥ 1} (−z)ⁿ/(n · n!) = −∫₀^z (1 − e^{−t})/t dt`, and an integration by parts turns `li x` into
  `γ + e^{−z} log z + ∫₀^z e^{−t} log t dt`, which tends to `γ + ∫₀^∞ e^{−t} log t dt = 0` as
  `z → ∞` by Mathlib's `Real.eulerMascheroniConstant_eq_neg_integral_log`.
- Principal value: `li x = ∫₀ˣ dt/log t` for `0 < x < 1`, and
  `li x = lim_{ε → 0⁺} (∫₀^{1−ε} dt/log t + ∫_{1+ε}^x dt/log t)` for `x > 1`
  (the Cauchy principal value).
  Route: `li` is an antiderivative of `1/log t` on `(0, 1)` and on `(1, ∞)`, `li(0⁺) = 0`, and
  `li(1 + ε) − li(1 − ε) → 0`, since `li x − log |log x|` is continuous at `x = 1` and
  `log |log(1 + ε)| − log |log(1 − ε)| → 0`.
- The offset: `Li x = li x − li 2` for every `x > 1`, both sides
  having derivative `1/log x` on `(1, ∞)` and vanishing at `2`.
- Monotonicity and sign: `li` is strictly decreasing on `(0, 1)`, where it is
  negative, and strictly increasing on `(1, ∞)`, from `−∞` at `1⁺` to `+∞`.
  It has exactly one zero `μ` in `(1, ∞)` (Soldner's constant), and
  `li x > 0` for every `x ≥ 3/2`: at `x = 3/2`, the pin's
  `γ > 1/2`, `log log(3/2) > −0.903` and the first two terms `log(3/2) + log²(3/2)/4 > 0.446` of the
  series give `li(3/2) > 0.04`.
- Asymptotic expansion: for every `n ≥ 0`,
  `li x = (x/log x) ∑_{k < n} k!/(log x)^k + O(x/(log x)^{n+1})` as `x → ∞`. Route:
  `n` integrations by parts of `∫_e^x dt/log t`, using
  `d/dt (t/log^k t) = 1/log^k t − k/log^{k+1} t`, leave `n! ∫_e^x dt/log^{n+1} t` plus a constant, and splitting that integral at `√x` bounds it by
  `O(x/log^{n+1} x)`. With `Li x = li x − li 2` and `TauCeti.Real.logIntegral_isEquivalent_div_log`
  this gives `li x ∼ Li x ∼ x/log x`.
- Exponential form of the principal value: for every real `y > 0`,
  `lim_{ε → 0⁺} (∫_{−1/ε}^{−ε} eᵘ/u du + ∫_ε^y eᵘ/u du) = γ + log y + ∫₀^y (eᵘ − 1)/u du`, with
  `∫₀^y (eᵘ − 1)/u du = ∑_{n ≥ 1} yⁿ/(n · n!)`; so for `x > 1` the limit at `y = log x` is `li x`
  (the exponential integral `Ei` at `log x`), and for `y < 0` the same holds without a limit,
  `∫_{−∞}^{y} eᵘ/u du = γ + log |y| + ∫₀^y (eᵘ − 1)/u du = li(e^y)`. Also
  `γ = ∫₀¹ (1 − e^{−t})/t dt − ∫₁^∞ e^{−t}/t dt`. Route: the last from Mathlib's
  `γ = −∫₀^∞ e^{−t} log t dt` by integration by parts on `(0, 1]` and on `[1, ∞)`; then
  `∫_{−1/ε}^{−ε} eᵘ/u du = −∫_ε^{1/ε} e^{−t}/t dt` and `∫_ε^y eᵘ/u du = log(y/ε) + ∫_ε^y (eᵘ − 1)/u du`,
  in which the two logarithms of `ε` cancel against `∫_ε^1 dt/t`; the series by termwise
  integration of `(eᵘ − 1)/u = ∑_{n ≥ 1} u^{n−1}/n!`.
- The absolutely convergent integrals: for every `x > 0` with `x ≠ 1`,
  `li x = log |x − 1| + ∫₀ˣ (1/log t − 1/(t − 1)) dt`, the integrand being bounded on `(0, x]`
  (it tends to `1` at `0⁺` and to `1/2` at `t = 1`); and
  `li 2 = ∫₀¹ (1/log(1 + u) + 1/log(1 − u)) du`, whose integrand tends to `1` at `0⁺` and to
  `1/log 2` at `1⁻` and satisfies `|1/log(1 + u) + 1/log(1 − u)| ≤ 16 log(4/3)/3` on `(0, 1/2]`.
  Route: the principal value of `∫₀ˣ dt/(t − 1)` is `log |x − 1|`, and the difference of the two
  integrands is continuous; at `x = 2` the substitutions `t = 1 ∓ u` turn the principal value into
  the symmetric integral.
- The enclosure of `li 2`: `0.834438 ≤ ∑_{n ≥ 1} (log 2)ⁿ/(n · n!) ≤ 0.834462` and
  `−0.366513 ≤ log log 2 ≤ −0.366512`, both unconditionally (Mathlib's `Real.log_two_gt_d9` and
  `Real.log_two_lt_d9`, the positive series truncated after ten terms with a geometric tail, and
  the series of `log(1 − u)` at `u = 1 − log 2`); hence, if `|γ − 0.5772156649| < 10⁻⁹` (the
  inequality *EulerGammaEnclosure* of §1.6, written out here so that this layer uses no later one),
  `1.0451 ≤ li 2 ≤ 1.0452`, and a fortiori `1.039 ≤ li 2 ≤ 1.06`. Without the
  enclosure of `γ`, Mathlib's `1/2 < γ < 2/3` gives only `0.96 < li 2 < 1.14`.
- Explicit integrals: for real `k > 0` and `x ≥ 2`,
  `∫₂ˣ dt/log^k t = x/log^k x − 2/log^k 2 + k ∫₂ˣ dt/log^{k+1} t` (integration by parts, from
  `d/dt (t/log^k t) = 1/log^k t − k/log^{k+1} t`), `(x − 2)/log^k x ≤ ∫₂ˣ dt/log^k t ≤
  √x/log^k 2 + 2^k x/log^k x` (for `x ≥ 4` split at `√x`, where `log t ≥ (log x)/2` beyond; for
  `2 ≤ x < 4` every `t ∈ [2, x]` already has `log t ≥ (log x)/2`), and therefore
  `∫₂ˣ dt/log^k t < x/log^k x + k (√x/log^{k+1} 2 + 2^{k+1} x/log^{k+1} x)`;
  at `k = 7`, `∫₂ˣ dt/log⁷ t < x/log⁷ x + 7 (√x/log⁸ 2 + 2⁸ x/log⁸ x)`.
- `Li x − x/log x`: its derivative is `1/log² x`, so it is strictly increasing on `(1, ∞)`; for
  `x ≥ 2`, `Li x − x/log x = ∫₂ˣ dt/log² t − 2/log 2` (Tau Ceti's
  `TauCeti.Real.logIntegral_eq_div_log_sub_add`), so by the previous item
  `x/log² x − 2/log 2 − 2/log² 2 ≤ Li x − x/log x < x/log² x + 2√x/log³ 2 + 16 x/log³ x − 2/log 2`
  (with equality on the left only at `x = 2`); it has exactly one zero, in `(6.5797, 6.5798)`, and,
  for every `x ≥ 6.58`, `Li x − x/log x ≥ (x − 6.58)/log² x`, positive for `x > 6.58`
  (`fiori-kadiri-swidinsky-2023` Lemma 20; `pnt-plus`). Route: `Li(6.58) − 6.58/log 6.58 > 7·10⁻⁵`,
  an inequality between values of the series of `li` at `log 6.58` and `log 2`, in which `γ`
  cancels; then the derivative bound `1/log² t ≥ 1/log² x` on `[6.58, x]`.

*Needs:* Mathlib `Real.eulerMascheroniConstant`, `Real.one_half_lt_eulerMascheroniConstant`,
`Real.eulerMascheroniConstant_lt_two_thirds`, `Real.eulerMascheroniConstant_eq_neg_integral_log`,
`Real.log_two_gt_d9`, `Real.log_two_lt_d9`, `Real.exp`, `tsum`, `HasDerivAt`, `intervalIntegral`,
`Asymptotics.IsBigO`; Tau Ceti `TauCeti.Real.logIntegral`, `TauCeti.Real.logIntegral_two`,
`TauCeti.Real.logIntegral_isEquivalent_div_log`, `TauCeti.Real.logIntegral_eq_div_log_sub_add`.

**Checks.**

- `li 2 > 0`, so `li ≠ Li`: the offset normalisation `Li 2 = 0` is not `li`.
- A definition of `li x` for `x > 1` by the interval integral `∫ t in 0..x, (log t)⁻¹` would return
  the junk value `0` for the non-integrable integrand and make `li 2 = 0`; the series excludes it,
  and the principal value is a theorem, not the definition.
- At `x = 1` the definition returns the junk value `γ` (`log 0 = 0` in Mathlib); every statement that
  uses `li` takes `x > 1`, or `0 < x < 1` for the principal value.

### 0.3b The rational prime count and the n-th prime

- The adapter: for every real `x`, `TauCeti.primeCount ℚ Set.univ x = π(⌊x⌋₊)`. Route:
  `TauCeti.primeCount_eq_card` writes the left side as the number of height-one primes `v` of
  `𝓞 ℚ` with `Ideal.absNorm v.asIdeal ≤ x`; Mathlib's `Rat.HeightOneSpectrum.primesEquiv` is a
  bijection from them to the rational primes, sending `v`
  to the positive generator `p` of `v ∩ ℤ`, and the absolute norm of `v` is `p`, the residue ring
  being `ℤ/p`; the cutoff stays inclusive.
- The `n`-th prime (`pnt-plus`, `ieantn`): `p_n ∼ n log n`, that is `Nat.nth Nat.Prime n ∼ n log n`
  as `n → ∞` (the shift of the Conventions does not change it). Route: the adapter and
  `TauCeti.primeCount_univ_isEquivalent_div_log` at `K = ℚ` give `π(x) ∼ x/log x`; at
  `x = Nat.nth Nat.Prime n`, where `π(x) = n + 1` (`Nat.primeCounting_nth_prime`), this reads
  `n + 1 ∼ p/log p`; taking logarithms, `log p = log n + log log p + o(1)` and
  `log log p = o(log p)`, so `log p ∼ log n` and `p ∼ (n + 1) log p ∼ n log n`.

*Needs:* Tau Ceti `TauCeti.primeCount`, `TauCeti.primeCount_eq_card`,
`TauCeti.primeCount_univ_isEquivalent_div_log`, `Nat.primeCounting_nth_prime`; Mathlib
`Rat.HeightOneSpectrum.primesEquiv`, `Ideal.absNorm`, `Nat.nth`, `Asymptotics.IsEquivalent`.

**Checks.**

- At `x = 2` both sides of the adapter are `1`; a strict cutoff would give `0`.
- The shift: `Nat.nth Nat.Prime 0 = 2` and `π(2) = 1`, so the equivalence is read with `n + 1`
  primes up to `Nat.nth Nat.Prime n`; replacing `n + 1` by `n` does not change it.

### 0.4 The exact remainder between π and Li or li

For `x ≥ 2`,

```text
π(x) − Li x = (θ(x) − x)/log x + ∫₂ˣ (θ(t) − t)/(t log² t) dt + 2/log 2,
```

from `Chebyshev.primeCounting_eq_theta_div_log_add_integral` and
`TauCeti.Real.logIntegral_eq_div_log_sub_add`, the latter supplying
`Li x = x/log x − 2/log 2 + ∫₂ˣ dt/log² t`; the identity is the rational instance (`δ = 1`) of Tau
Ceti's `primeCount_sub_mul_logIntegral_eq` after the adapter of §0.3b, and the
difference form below is Rosser–Schoenfeld's (4.17) (`rosser-schoenfeld-1962` line 460, as cited at
`schoenfeld-1976` lines 101–102; `pnt-plus`).
The reverse direction is Mathlib's `Chebyshev.theta_eq_primeCounting_mul_log_sub_integral`.

- Difference form: for `2 ≤ x₀ ≤ x`,
  `(π(x) − Li x) − (π(x₀) − Li x₀) = (θ(x) − x)/log x − (θ(x₀) − x₀)/log x₀ + ∫_{x₀}^x (θ(t) − t)/(t log² t) dt`.
- Transfer of a `θ`-bound to `π`: if `|θ(t) − t| ≤ t ε(t)` for all `t ∈ [x₀, x]`, then
  `|π(x) − Li x| ≤ |π(x₀) − Li x₀| + x ε(x)/log x + x₀ ε(x₀)/log x₀ + ∫_{x₀}^x ε(t)/log² t dt`,
  and the same with `li` on both sides.
- For constant `ε(t) = ε`, `∫_{x₀}^x ε/log² t dt = ε (Li x − x/log x − Li x₀ + x₀/log x₀)`.
- The `li` form: since `li x = Li x + li 2` for `x > 1` (§0.3a),
  `π(x) − li x = (θ(x) − x)/log x + ∫₂ˣ (θ(t) − t)/(t log² t) dt + 2/log 2 − li 2` for
  `x ≥ 2`, and the difference form and the transfer hold verbatim with `li` in place of `Li`; this
  is the normalisation of Schoenfeld, Büthe and Trudgian (`trudgian-2016` lines 124–125 display the
  identity).
- One-sided transfer from `x₀ = 2`: let `x ≥ 2` and `ε⁺, ε⁻` integrable on `[2, x]` with
  `−t ε⁻(t) ≤ θ(t) − t ≤ t ε⁺(t)` for every `t ∈ [2, x]`. Then
  `Li x + 2/log 2 − x ε⁻(x)/log x − ∫₂ˣ ε⁻(t)/log² t dt ≤ π(x) ≤ Li x + 2/log 2 + x ε⁺(x)/log x + ∫₂ˣ ε⁺(t)/log² t dt`,
  with `Li x + 2/log 2 = x/log x + ∫₂ˣ dt/log² t`; the identity's constant `2/log 2` is exact, so
  no boundary term at `x₀` appears. At `ε^± = a/log⁵` this is Platt–Trudgian's form
  (`platt-trudgian-2021-error` §5; `pnt-plus`): if `|θ(t) − t| log⁵ t ≤ t a(t)` on `[2, x]`, then
  `π(x) ≤ x/log x + a(x) x/log⁶ x + ∫₂ˣ dt/log² t + ∫₂ˣ a(t)/log⁷ t dt` and
  `π(x) ≥ x/log x − a(x) x/log⁶ x + ∫₂ˣ dt/log² t − ∫₂ˣ a(t)/log⁷ t dt`.
- Combined-endpoint transfer: for `2 ≤ x₀ ≤ x` with `|θ(t) − t| ≤ t ε(t)` on `[x₀, x]`,
  `|π(x) − Li x − (θ(x) − x)/log x| ≤ |π(x₀) − Li x₀ − (θ(x₀) − x₀)/log x₀| + ∫_{x₀}^x ε(t)/log² t dt`,
  from the difference form; in the normalised errors `E_θ(x) = |θ(x) − x|/x` and
  `E_π(x) = |π(x) − Li x| log x/x` it reads
  `E_π(x) ≤ E_θ(x) + (log x/x)(x₀/log x₀) δ(x₀) + (log x/x) ∫_{x₀}^x E_θ(t)/log² t dt` with
  `δ(x₀) = |(π(x₀) − Li x₀) log x₀/x₀ − (θ(x₀) − x₀)/x₀|` (`fiori-kadiri-swidinsky-2023` (30);
  `pnt-plus`). It sharpens the transfer above, whose two endpoint terms are taken separately while
  the combination nearly cancels.
- Partitioned integral: for `x₀ = t₀ < t₁ < ⋯ < t_N = x₁` with `t₀ ≥ 2` and constants `ε_i` with
  `|θ(t) − t| ≤ ε_i t` on `[t_{i−1}, t_i]`,
  `|∫_{x₀}^{x₁} (θ(t) − t)/(t log² t) dt| ≤ ∑_{i=1}^{N} ε_i (Li t_i − t_i/log t_i − Li t_{i−1} + t_{i−1}/log t_{i−1})`,
  the constant case above on each piece (`fiori-kadiri-swidinsky-2023` Lemma 19, there with
  `t_i = e^{b_i}`; `pnt-plus`).
- Partial summation for a general weight (`rosser-schoenfeld-1962` (4.13)–(4.16), cited by
  locator; `pnt-plus`): for `x ≥ 2` and `f` of class `C¹` on `[2, x]`, with `g = f/log`,
  `∑_{p ≤ x} f(p) = θ(x) g(x) − ∫₂ˣ θ(t) g′(t) dt = ∫₂ˣ f(t)/log t dt + 2 f(2)/log 2 + (θ(x) − x) g(x) − ∫₂ˣ (θ(t) − t) g′(t) dt`
  (Abel summation, Mathlib's `sum_mul_eq_sub_sub_integral_mul`, and `∫₂ˣ t g′ = x g(x) − 2 g(2) − ∫₂ˣ g`);
  and, if `f` is `C¹` on `[2, ∞)` with `∫₂^∞ |θ(t) − t| |g′(t)| dt < ∞`, then with
  `L_f = 2 f(2)/log 2 − ∫₂^∞ (θ(t) − t) g′(t) dt`,
  `∑_{p ≤ x} f(p) = ∫₂ˣ f(t)/log t dt + L_f + (θ(x) − x) g(x) + ∫ₓ^∞ (θ(t) − t) g′(t) dt` for every
  `x ≥ 2`. At `f = 1` this is the identity of this section; at `f(t) = 1/t` and `f(t) = (log t)/t`
  it gives the exact forms of §4.3, with `L_f − log log 2 = B` and `L_f − log 2 = E` respectively.
- Büthe's `√x`-normalised transfer (`buthe-2018` §6, Lemma 3, with the sign of its constant and the
  factor of its integral corrected; `ieantn`). For `a > 1` put
  `A(a) = π(a) − li a + (a − θ(a))/log a`. Let `12 < a < b` with `b > 10⁷`, and `c ≤ 0 ≤ C` with
  `c ≤ (t − θ(t))/√t ≤ C` for every `t ∈ [a, b]`. Then for every `x ∈ [max(a, 10⁷), b]`
  `(x − θ(x))/√x + (2c/log x)(1 + 8/log x) − A(a) log x/√x ≤ (li x − π(x)) log x/√x ≤ (x − θ(x))/√x + (2C/log x)(1 + 8/log x) − A(a) log x/√x`,
  and the same with `1 + 5/log x` in place of `1 + 8/log x` for every `x ∈ [max(a, 10¹⁵), b]`.
  Route: the difference form with `li` from `a` reads
  `li x − π(x) = (x − θ(x))/log x + ∫ₐˣ (t − θ(t))/(t log² t) dt − A(a)` (Büthe's (6.17)); the
  hypothesis puts the integral between `c J(a, x)` and `C J(a, x)`, `J(a, x) = ∫ₐˣ dt/(√t log² t)`,
  and `0 ≤ J(a, x) ≤ G_κ(x) = (2√x/log² x)(1 + κ/log x)` for `a ≥ 12`, with `κ = 8` from `x = 10⁷`
  and `κ = 5` from `x = 10¹⁵`: `G_κ′(x) = (1 + (κ − 4)/log x − 6κ/log² x)/(√x log² x)` is at least
  the integrand once `log x ≥ 6κ/(κ − 4)` (`12` for `κ = 8`, `30` for `κ = 5`), and
  `J(12, x) ≤ G_κ(x)` at `x = 10⁷` for `κ = 8` (the ratio is `0.972`) and at `x = 10¹⁵` for `κ = 5`
  (`0.9983`), an inequality between explicit integrals. The source prints `+ A(a) log x/√x` and the
  factor `1 + 5/log x` from `10⁷`, and both fail (Checks): its bound for `J` takes the remainder
  left by two integrations by parts as `Θ(16/log² x)` relative to the main term, where the estimate
  it displays for that remainder gives `Θ(16/log x)`.
- The positivity transfer (`buthe-2018` §6, Lemma 3, second part; `ieantn`): for every real `T`, if
  `t − θ(t) > 0` for every `t ∈ [2, T]`, then `li t > π(t)` for every `t ∈ [2, T]`. Route: on
  `[2, 10)` directly, with no hypothesis, `li` being increasing and `π` stepping at `2, 3, 5, 7`,
  where `li 2 = 1.0451… > 1`, `li 3 = 2.1635… > 2`, `li 5 = 3.6345… > 3` and `li 7 = 4.7570… > 4`;
  on `[10, T]` the identity of the previous item from `a = 10`, whose three terms
  `(t − θ(t))/log t`, `∫_{10}^t (u − θ(u))/(u log² u) du` and `−A(10)` are positive: by hypothesis
  for the first two, and `A(10) = 4 − li 10 + (10 − log 210)/log 10 = 6.0207… − li 10 = −0.1448…`,
  with `li 10 > 6.088` from the series of §0.3a and Mathlib's `γ > 1/2`. The source's proof prints
  `π(10) − li(10) + (10 − θ(10))/log 10 > 0.1`, which is false; it is `−A(10) > 0.1` that holds.

*Needs:* Mathlib `Chebyshev.primeCounting_eq_theta_div_log_add_integral`,
`Chebyshev.theta_eq_primeCounting_mul_log_sub_integral`,
`Chebyshev.integrableOn_theta_div_id_mul_log_sq`; Tau Ceti `TauCeti.Real.logIntegral_eq_div_log_sub_add`,
`TauCeti.Real.intervalIntegrable_div_mul_log_sq`, Mathlib `sum_mul_eq_sub_sub_integral_mul` (the
general weight); §0.3a (the offset `Li x = li x − li 2`) for the `li` form, and its series and
monotonicity for the positivity transfer, with Mathlib `Real.one_half_lt_eulerMascheroniConstant`;
§0.3b for the rational instance.

**Checks.**

- `x = 2`: `π(2) = 1`, `Li 2 = 0`, and the right side is `(log 2 − 2)/log 2 + 0 + 2/log 2 = 1`.
- Dropping the constant `2/log 2` (a plausible wrong identity) fails already at `x = 2`.
- The sign of Büthe's constant (negative control): take `a = x = 10⁷` and `b = 10⁷ + 1`, a range
  with no prime, on which `(t − θ(t))/√t = 1.5244…`, so `c = 0` and any `C ≥ 1.5245` are admissible.
  With `li 10⁷ − π(10⁷) = 339.40…` and `10⁷ − θ(10⁷) = 4820.68…`, `A(10⁷) = −40.31…`, and at `x = a`
  the lower bound of the transfer is an equality, `1.7299… = 1.5244… + 0.2055…`. The printed
  `+ A(a) log x/√x` makes the upper bound `1.3189… + 0.1625… C`, below `1.7299…` for every
  `C < 2.52`, `C = 2` for instance.
- The factor `1 + 5/log x` fails at `a = 1500`, `x = 10⁸`: there `J(1500, 10⁸)` exceeds
  `(2√x/log² x)(1 + 5/log x)` by `3.7%`; the asymptotic expansion
  `J(a, x) ∼ (2√x/log² x)(1 + 4/log x + 24/log² x + ⋯)` exceeds that factor as long as `log x` is
  below about `30`.
- Büthe's constant at `a = 10` with the offset `Li`:
  `π(10) − Li 10 + (10 − θ(10))/log 10 = 4 − 5.1204… + 2.0207… = 0.9002… > 0.1`, with
  `π(10) = 4`, `θ(10) = log 210` and `Li 10 = li 10 − li 2 = 5.1204…`; the upper Riemann sum of
  `1/log t` over the unit intervals of `[2, 10]` already gives `Li 10 < 5.71`, which suffices. With
  the principal-value `li` in place of `Li` the quantity is `A(10) = −0.1448…`, so the inequality is
  false in that reading, which is the one IEANTN (`ieantn`) uses.

### 0.5 From a ψ-bound to θ- and π-bounds with an explicit error function

Let `y₀ ≥ 2` and `ε : ℝ → ℝ` with `|ψ(y) − y| ≤ ε(y) y` for all `y ≥ y₀`. Then

- for `x ≥ y₀`, `|θ(x) − x| ≤ (ε(x) + (log 4)(x^{−1/2} + (log x/log 2 − 2)⁺ x^{−2/3})) x`, and, when a
  bound `θ(y) ≤ c y` for all `y > 0` is available, `log 4` may be replaced by `c` (§0.3);
- for `x ≥ x₀ ≥ y₀`,
  `|π(x) − Li x| ≤ |π(x₀) − Li x₀| + x ε₁(x)/log x + x₀ ε₁(x₀)/log x₀ + ∫_{x₀}^x ε₁(t)/log² t dt`
  with `ε₁` the `θ`-error of the previous item (§0.4).

This is the scheme of Rosser–Schoenfeld's Theorem 11 (`rosser-schoenfeld-1962` lines 334–343) and
Schoenfeld's Theorem 11 (`schoenfeld-1976` lines 201–206; `pnt-plus`), stated for an arbitrary error
function.

*Needs:* §0.3, §0.4.

**Checks.**

- With `ε ≡ 0` (the hypothetical `ψ = x` on `[y₀, ∞)`) the `θ`-error is `(log 4) x^{−1/2}` plus the
  cube-root term, not `0`: the prime powers are a genuine correction.
- The `π` transfer at `x₀ = x` reduces to `|π(x) − Li x| ≤ |π(x) − Li x| + 2 x ε₁(x)/log x`, a
  tautology; the content is in `x₀ < x`.

### 0.6 Agreement lemmas with AnalyticNumberTheoryPartI and the sieve carriers

- `psiAP 1 0 x = ψ(x)` and the level-one identity `θ(x; 0, 1) = Chebyshev.theta x` of
  AnalyticNumberTheoryPartI §0.2; for `q ≥ 1` and `a : ZMod q`,
  `primeCountAP q a x = SieveDistribution.primeCountAP x q a.val` (SieveMethodsAndPrimePatterns
  §3.1 counts `p ≤ ⌊x⌋` with `p ≡ a.val (mod q)`); for `a` a unit, *rayClassPsi* of
  ZerosOfLFunctions §8.7 at `K = ℚ`, `𝔪 = (q)∞` and the class of `a` equals `psiAP q a x`, since
  every `n ≡ a (mod q)` is then prime to `q`.
- Half-weight versions. For real `x` and `t` let `w_x(t)` be `1/2` for `t = x`, `1` for
  `0 < t < x`, and `0` otherwise (the arguments below are positive integers, so the value at
  `t = 0` plays no role), and define `ψ₀(x) = ∑_{n ≥ 1} w_x(n) Λ(n)`, `θ₀(x) = ∑_p w_x(p) log p`,
  `π₀(x) = ∑_p w_x(p)` and `π*₀(x) = ∑_{k ≥ 1} π₀(x^{1/k})/k`: the normalisation of the explicit
  formula and of Büthe's statements (`buthe-2016` Theorem 2; `pnt-plus`), and the `ψ₀` of
  AnalyticNumberTheoryPartI's conventions. Prove, for `F` one of `ψ`, `θ`, `π` (`x ↦ π(⌊x⌋₊)`) and
  `π*` and `F₀` its half-weight version: `F₀(x) = (F(x) + F(x⁻))/2` with
  `F(x⁻) = Function.leftLim F x`, for every real `x > 0` (for every real `x` when `F` is `ψ`, `θ` or `π`; for `π*` the powers `x^{1/k}` of a
  negative `x` are junk); hence `F₀ = F` except at the jumps (the prime powers for `ψ` and `π*`, the
  primes for `θ` and `π`), where `F − F₀` is half the jump, so `0 ≤ ψ(x) − ψ₀(x) ≤ (log x)/2` for
  `x ≥ 1` and `0 ≤ π(x) − π₀(x) ≤ 1/2`; and, for `x ≥ 2`,
  `π*₀(x) = ψ₀(x)/log x + ∫₂ˣ ψ(t)/(t log² t) dt`, the half-weight form of the identity §2.3 uses;
  and a bound `|F(y) − G(y)| ≤ B(y)` on an open interval, with `G` and `B` continuous there, holds for
  `F₀` on the same interval, so every bound of §§2.2–2.3 on an open range holds for the half-weight
  functions on that range. Route: the jump of `F` at `x` is the term of the sum at `t = x`, and the
  left limit omits it.

The four finite-range inputs of AnalyticNumberTheoryPartI are proved where the theorems that
discharge them stand: *SchoenfeldFiniteRangeInput* in §3.2, *RosserSchoenfeldFiniteRangeInput* in
§3.5, *PrimeProductFiniteInput* in §4.3 and the theta clause of *ModEightFiniteInput* in §6.1.

*Needs:* AnalyticNumberTheoryPartI §0.2; SieveMethodsAndPrimePatterns §3.1; ZerosOfLFunctions §8.7;
Mathlib `Function.leftLim`, `Monotone.leftLim_le`, `ArithmeticFunction.vonMangoldt`.

**Checks.**

- `primeCountAP 4 3 3 = 1 = SieveDistribution.primeCountAP 3 4 3`: the only prime `p ≤ 3` with
  `p ≡ 3 (mod 4)` is `3`.
- At `q = 0` the agreement fails, which is why it is stated for `q ≥ 1`: `ZMod 0 = ℤ` and
  `(−5 : ZMod 0).val = 5`, so at `a = −5`, `x = 5` the progression count `primeCountAP 0 (−5) 5`
  is `0` (no prime equals `−5` in `ℤ`) while `SieveDistribution.primeCountAP 5 0 5` is `1` (the
  prime `5`).
- At `q = 2`, `a = 0`, `psiAP 2 0 x = ∑_{2^k ≤ x} log 2 ≠ rayClassPsi`, which is `0` for a non-unit
  class: the ray-class agreement needs the unit hypothesis.

### 0.7 The exact transfer for the logarithmic progression sum

For `q ≥ 1`, `a` a unit of `ZMod q`, and `x ≥ 1`, with `E(t) = ψ(t; q, a) − t/φ(q)`,

```text
logPsiAP q a x − log x/φ(q) − C(q, a) − E(x)/x = −∫ₓ^∞ E(t)/t² dt,
```

and hence, if `|E(t)| ≤ ε(t) t/φ(q)` for all `t ≥ x`, then
`|logPsiAP q a x − log x/φ(q) − C(q, a)| ≤ |E(x)|/x + φ(q)⁻¹ ∫ₓ^∞ ε(t)/t dt`. At `q = 1` this is
the transfer from `ψ` to `∑_{n ≤ x} Λ(n)/n` used in §4.2.

*Needs:* §0.2 (existence of `C(q, a)` and the Abel identity).

**Checks.**

- With Ramaré–Rumely's row `(k, ε, x₀) = (1, 0.000213, 10¹⁰)` (`ramare-rumely-1996` line 67) the
  tail bound at `x = 10¹⁰` is `0.000213 · ∫_{10¹⁰}^∞ dt/t`, which diverges: a constant `ε` says
  nothing about the tail, and the instances of §4.2 use error functions that decay at least like
  `1/log² t`.
- With `ε(t) = η/log² t` on `[x, ∞)`, `∫ₓ^∞ ε(t)/t dt = η/log x`.
- The identity at `x = 1`: `logPsiAP q a 1 = 0`, `E(1) = −1/φ(q)` for a unit class, and
  `C(q, a) = 1/φ(q) + ∫₁^∞ E/t²`, so both sides equal `−∫₁^∞ E(t)/t² dt`.

### 0.8 Chebyshev's weight method

Chebyshev's elementary bounds for `ψ`, with explicit constants and no information on the zeros
(`pnt-plus`, `ieantn`).
Write `T(x) = ∑_{1 ≤ n ≤ x} log n = log ⌊x⌋₊!` for real `x` (zero for `x < 1`). The identity
`T(x) = ∑_{n ≤ x} Λ(n) ⌊x/n⌋₊` and the bounds
`x log x − x + 1 − log x ≤ T(x) ≤ x log x − x + 1 + log x` for every real `x ≥ 1` are
AnalyticNumberTheoryPartI §0.11d (`log_floor_factorial_eq_sum_vonMangoldt`, with Mathlib's
`Real.le_sum_log` and `Real.sum_log_le`) and are consumed, not restated.

The finite range the upper bound assumes, stated here because Layer 0 uses it:

- *ChebyshevWeightRange*: `ψ(x) ≤ 1.015 x` for every real `0 < x ≤ 30`, and `ψ(x) ≤ 1.11 x` for
  every real `0 < x ≤ 11 723` (the bounded range of the induction below; on it the largest value
  of `ψ(x)/x` is `ψ(113)/113 = 1.0388…`, `rosser-schoenfeld-1962` lines 341–342, and on `(0, 30]`
  it is `ψ(19)/19 = 1.0140…`).

Let `ν = e₁ − e₂ − e₃ − e₅ + e₃₀` (`ν(1) = ν(30) = 1`, `ν(2) = ν(3) = ν(5) = −1`, zero elsewhere) and
`E(x) = ∑_m ν(m) ⌊x/m⌋₊ = ⌊x⌋₊ − ⌊x/2⌋₊ − ⌊x/3⌋₊ − ⌊x/5⌋₊ + ⌊x/30⌋₊`. Put
`U(x) = T(x) − T(x/2) − T(x/3) − T(x/5) + T(x/30)` and
`a = (log 2)/2 + (log 3)/3 + (log 5)/5 − (log 30)/30 = −∑_m ν(m) (log m)/m = 0.9212920…`. Prove:

- `E` is periodic of period `30` on `x ≥ 0`, takes only the values `0` and `1` there, and equals `1`
  on `[1, 6)`; `∑_m ν(m)/m = 0` (`1 − 1/2 − 1/3 − 1/5 + 1/30 = 0`), and `0.92129 ≤ a ≤ 0.92130`;
- `U(x) = ∑_{n ≤ x} Λ(n) E(x/n)`, hence `ψ(x) − ψ(x/6) ≤ U(x) ≤ ψ(x)` for every `x ≥ 0`;
- for every `x ≥ 30`, `|U(x) − a x| ≤ 5 log x − 5`; hence
  `ψ(x) ≥ a x − 5 log x + 5`, in particular `ψ(x) ≥ a x − 5 log x − 1`, and
  `ψ(x) − ψ(x/6) ≤ a x + 5 log x − 5`, for every `x ≥ 30`;
- under *ChebyshevWeightRange*, `ψ(x) ≤ (6a/5) x + (log(x/5)/log 6)(5 log x − 5)` for every
  `x ≥ 30`, and `ψ(x) ≤ 1.11 x` for every `x > 0`.

Route (`chebyshev-1852` §§IV–V, whose error terms are `(5/2) log x + 1` and
`(5/(4 log 6)) log² x + (5/2) log x + 1`; the constants here come from the cruder bounds for
`log ⌊x⌋₊!` of AnalyticNumberTheoryPartI §0.11d). The periodicity: for `d ∣ 30`,
`⌊(x + 30)/d⌋₊ = ⌊x/d⌋₊ + 30/d`, and `30 − 15 − 10 − 6 + 1 = 0`; the values on `[0, 30)` are read off
the thirty unit intervals. `U = ∑_n Λ(n) E(x/n)` is the identity of AnalyticNumberTheoryPartI
§0.11d applied to each `T(x/m)`; `E ≥ 0` gives `U ≤ ∑_{n ≤ x} Λ(n) = ψ(x)`, and `E(x/n) = 1` for
`x/6 < n ≤ x` gives `U ≥ ψ(x) − ψ(x/6)`. In `U` the main terms `y log y − y + 1` of the five values
of `T` combine to `a x − 1`, the coefficients of `x log x`, of `x` and of `log x` cancelling by
`∑ ν(m)/m = 0`, and the five errors, each at most the logarithm of its argument (all arguments are
at least `1` when `x ≥ 30`), add up to at most `5 log x − log 900`, so that
`|U(x) − a x| ≤ 1 + 5 log x − log 900 ≤ 5 log x − 5`. The two upper bounds follow
by summing `ψ(x/6^j) − ψ(x/6^{j+1}) ≤ a x/6^j + 5 log x − 5` over the `⌊log(x/5)/log 6⌋` values
of `j` with `x/6^j ≥ 30` and bounding the last `ψ(x/6^J) ≤ 1.015 x/6^J ≤ (6a/5) x/6^J`; and, for the
second, by induction on `⌈log(x/11 723)/log 6⌉`: for `x > 11 723`,
`ψ(x) ≤ 1.11 x/6 + 0.92130 x + 5 log x − 5 ≤ 1.11 x`, since `5 log x − 5 ≤ (0.925 − 0.92130) x` from
`x = 11 723` on.

*Needs:* AnalyticNumberTheoryPartI §0.11d; Mathlib `Chebyshev.psi`, `ArithmeticFunction.vonMangoldt`,
`Nat.floor`, `Real.log_two_gt_d9`, `Real.log_two_lt_d9`; *ChebyshevWeightRange*.

**Checks.**

- `E(5.5) = 5 − 2 − 1 − 1 + 0 = 1` and `E(6) = 6 − 3 − 2 − 1 + 0 = 0`: the interval on which `E = 1`
  is `[1, 6)`, and it is what makes `6` the ratio of the iteration.
- At `x = 30`: `a x − 5 log 30 + 5 = 27.639 − 17.006 + 5 = 15.63 < ψ(30) = 28.48`, so the lower
  bound has content only for large `x`; it exceeds `0.9 x` from `x ≈ 1.5·10³`.
- Without *ChebyshevWeightRange* the iteration has no starting point: the relative error of the
  step is `0.925 − a = 0.0037` while `(5 log x − 5)/x` is `0.0041` at `x = 10⁴`, so the induction
  closes only from about `1.1·10⁴`, and the bounded range is a computation on the values of `ψ`.

### Examples

- `C(1, 0) = −γ` and `C(2, 1) = −γ − log 2`, from the closed form of §0.2.
- `Li x = li x − li 2` for `x > 1`, and `li x ∼ x/log x` (§0.3a).
- `Nat.nth Nat.Prime n ∼ n log n` (§0.3b).
- The prime powers below `N ≥ 2` number at most `6 N/log N` (§0.3); `ψ(x) ≥ 0.92129 x − 5 log x + 5`
  for `x ≥ 30` (§0.8).

### Dependencies

Mathlib `Chebyshev`, `Nat.primeCounting`, `Nat.totient`, `ArithmeticFunction.vonMangoldt`,
`ArithmeticFunction.moebius`, `DirichletCharacter.LFunction`, Abel summation; Tau Ceti
`TauCeti.Real.logIntegral`, `TauCeti.primeCount` and the prime ideal theorem
`TauCeti.primeCount_univ_isEquivalent_div_log`; ExplicitZetaBounds §6.5; AnalyticNumberTheoryPartI
§§0.2, 0.11d, 0.30, 0.32; ZerosOfLFunctions §§8.5–8.7, 8.9; SieveMethodsAndPrimePatterns §3.1. The
two finite-range propositions of §0.1 are stated in §0.1, and the one of §0.8 in §0.8. No later
layer is used.

## Layer 1: hypotheses

Every proposition of this layer is a `Prop` with its data in the statement, assumed and never
established here: each theorem that uses one carries it as an explicit hypothesis, and no target
of this roadmap performs, checks or plans the computation behind it. Each is listed once, with
what it asserts and where its source states it. The bounded-height propositions `RH(H)` and
`GRH(f, H)`, with their laws, the recorded verifications and Platt's two records, are
ExplicitZetaBounds §§0.2–0.4b (`gap:rh-up-to-height`, `gap:grh-up-to-height`), and the real-zero
gap with its instances is its
§7.9 (`gap:real-zero-gap`): §§1.1, 1.2 and 1.7 cite them and fix the names this roadmap uses for
them. Every proposition this layer states mentions only Layer 0, the pinned libraries and the gap
records defined in §1.4.

### 1.1 The Riemann hypothesis to a height

`RiemannHypothesisUpTo H`, written `RH(H)`, for real `H`, is ExplicitZetaBounds §0.2's
proposition (`ieantn`): every `s : ℂ` with `riemannZeta s = 0`, `0 < Re s < 1` and `|Im s| ≤ H` has
`Re s = 1/2`. Its laws (vacuity for `H < 0`, antitonicity in `H`, `(∀ H, RH(H)) ↔ RiemannHypothesis`,
the agreement with *AllOnCriticalLine* of the completed function) are proved there.
`Suggested.lean` carries a verbatim copy of the definition, which exists only to make its
headlines statable. The heights used as hypotheses below are the recorded verifications of
ExplicitZetaBounds §0.4: `RH(545 439 823)` (`van-de-lune-te-riele-winter-1986` lines 13–14),
`RH(30 610 046 000)` (`platt-2017` lines 485–486, Theorem 5.1), `RH(3 000 175 332 800)`
(`platt-trudgian-2021-rh` lines 48–49, Theorem 1), and the absence of zeros with `0 < Re s < 1` and
`|Im s| ≤ 14`; a theorem stated from a smaller height a
paper used is stated here from the next recorded height above it, except where the theorem takes
the height as a hypothesis of its own (the third interval of §7.2).

The records `HiaryRecord` (`|ζ(1/2 + it)| ≤ 1.461` for `0 ≤ t ≤ 3` and
`|ζ(1/2 + it)| ≤ 0.595 t^{1/6} log t` for `3 ≤ t ≤ 200`), `PatelRecord` (`|ζ(1 + it)| ≤ log t` for
`3 ≤ t ≤ 50`) and `YangRecord` (bounds for `|(s − 1) ζ(s)|` on `σ = 1/2`, `5/7` and `1` for
`|t| ≤ 3`, against `|1.31 + s|`) are ExplicitZetaBounds §0.4b's propositions, the hypotheses under
which that roadmap states Bellotti–Wong's zero count (its §5.2); `Suggested.lean` copies them
verbatim, for the Lee–Nosal headlines of §2.2.

The computations on the low zeros. Zeros `ρ = β + iγ` are those of `riemannZeta` with `0 < β < 1`,
counted with the multiplicity `analyticOrderNatAt riemannZeta ρ` (that of ZerosOfLFunctions §4.1's
`zeroCount`); `N` and `M` are those of the Conventions.

- `ZetaZeroReciprocalSum`: `∑_{0 < γ ≤ 10⁷} 1/γ ≤ 16.2106480369` (`lee-nosal-2026` display (10)).
- `ZetaZeroCountLowRange`: `|N(T) − M(T)| ≤ 0.28 log T` for every real `2π ≤ T ≤ 10⁹`
  (`lee-nosal-2026` display (8), its first branch below `10⁹`; `ieantn`).
- *RosserSchoenfeldLowZeros*: with `D = 158.84998`, `N(D) = 57` and `∑_{0 < γ < D} 1/|ρ| < 0.8113925`
  (`rosser-schoenfeld-1975` lines 683–687, (4.3)–(4.4)).
- *RosserSchoenfeldZeroCount*: `N(A₀) = 3 502 500`, where `A₀ = 1 894 438.51224…` is the height with
  `M(A₀) = 3 502 500` (`rosser-schoenfeld-1975` lines 50–55).
- *VanDeLuneZeroCount*: `N(A₁) = 1 500 000 001`, where `A₁ = 545 439 823.21533…` is the height with
  `M(A₁) = 1 500 000 001` (`dusart-1999-mc` lines 64–69, from `van-de-lune-te-riele-winter-1986`).
- *OdlyzkoZeroSums*: with `T₀ = 1 132 491`, `N(T₀) = 2 001 052` and
  `∑_{0 < γ ≤ T₀} 1/γ ≤ 11.637732363` (`kadiri-lumley-2014` lines 582–586).
- *LMFDBZeroSums*: with `T₀ = 104 537 615`, `N(T₀) ≤ 2.6·10⁸` and `∑_{0 < γ ≤ T₀} 1/γ ≤ 21.98308`
  (`cully-hugill-lee-2022` lines 600–602).
- *FioriKadiriSwidinskyZeroSums*: `∑_{0 < γ < T₀} 1/γ < S₀` for each pair `(T₀, S₀)` of
  `(100, 0.5922435112)`, `(1000, 2.0286569752)`, `(10⁴, 4.3080354951)`, `(10⁵, 7.4318184970)`,
  `(10⁶, 11.3993199147)`, `(10⁷, 16.2106480369)`, `(10⁸, 21.8657999924)`, `(10⁹, 28.3647752011)`,
  `(10¹⁰, 35.7075737123)` and `(30 610 046 000, 39.5797647802)` (`fiori-kadiri-swidinsky-2023-psi`
  Corollary 2.3 and Table 1; the row at `10⁷` is `ZetaZeroReciprocalSum`, up to the endpoint;
  `pnt-plus`).
- *ChirreHelfgottZeroSum*: `10.319317 ≤ 2 ∑_{0 < γ ≤ 2·10⁴} 1/γ ≤ 10.319318`
  (`chirre-helfgott-2025`, proof of Proposition 7.7, *(preprint)*, which prints `10.319317…`,
  computed from the zeros below `2·10⁴` supplied by Platt, as the value at `t₀ = 2·10⁴` of the bound
  for the zeros below `t₀` in its estimate of the contribution of the zeros, §2.6; `ieantn`). It is
  twice the sum of *FioriKadiriSwidinskyZeroSums* at a height between their rows `10⁴` and `10⁵`.
- *RosserLowZeroCount*: `|N(t) − M(t)| < 1` for every real `0 < t ≤ 280` (`chirre-helfgott-2025`
  Lemma B.1, its first part, from `rosser-1941` Theorems 17–18; `ieantn`). Below the first ordinate
  `14.1347…` it reads `|M(t)| < 1`, true since `−1/8 ≤ M(t) < 7/8` there; it is sharper than
  `ZetaZeroCountLowRange` on `(35.6, 280]`, where `0.28 log t > 1`.
- `ZetaZeroCubeSum`: `∑_{0 < γ ≤ T} 1/γ³ ≤ 0.000835` for every real `T` (`rosser-1941` Lemma 17, the
  bound `∑ 1/|γ|³ < 0.00167` over both signs quoted at `dusart-2016` line 460).

`M` is strictly increasing on `(2π, ∞)` from `M(2π) = −1/8`, so the heights `A₀` and `A₁` exist and
are unique.

*Needs:* ExplicitZetaBounds §§0.2, 0.4 (`gap:rh-up-to-height`) and 0.4b (the three records); Mathlib
`riemannZeta`, `analyticOrderNatAt`; ZerosOfLFunctions §4.1.

**Checks.**

- The copy agrees with ExplicitZetaBounds §0.2 token for token (its bound variable is named `ρ`),
  so every law and instance proved there applies to it unchanged.
- `RH(0)` is not vacuous: it says that `ζ` has no real zero in `(0, 1)` other than possibly `1/2`,
  which is true, `ζ` being negative on `(0, 1)`. A definition with the strict inequality
  `|Im s| < H` would make `RH(0)` vacuous.
- A definition quantifying over every zero of `riemannZeta`, trivial zeros included, is false for
  every `H ≥ 0`: `riemannZeta (−2) = 0` and `Re(−2) ≠ 1/2`. The strip condition excludes them.
- The records are tight at their edges: at `t = 0`, `HiaryRecord` reads `|ζ(1/2)| = 1.46035 ≤ 1.461`,
  and the first clause of `YangRecord` reads
  `|ζ(1/2)|/2 = 0.73018 ≤ 0.618 · 1.81^{7/6} log 1.81 = 0.73267`; with `1.46` or `0.61` in place of
  `1.461` or `0.618` (`0.61 · 1.18556 = 0.72319`) each would be false. At `σ = 1`, `t = 0` the
  factor `s − 1` vanishes, so the junk value of
  `riemannZeta` at `1` does not enter.

### 1.2 The generalised Riemann hypothesis to a height

*DirichletGRHUpTo* `f H`, written `GRH(f, H)`, for `f ≥ 1` and real `H`, is ExplicitZetaBounds
§0.2's proposition: for every primitive character `χ` modulo `f`, every zero `s` of
`DirichletCharacter.LFunction χ` with `0 < Re s < 1` and `|Im s| ≤ H` has `Re s = 1/2`. The
theorems of Layer 6 need the same statement for every character modulo `q`, imprimitive ones
included; by the passage to imprimitive characters of that section (a character and the primitive
character inducing it differ by Euler factors `1 − χ*(p) p^{−s}`, `p ∣ q`, which vanish only on
`Re s = 0`), that statement is `GRH(f, H)` for every `f ∣ q`, abbreviated `GRH*(q, H)`
(Conventions). No new proposition is defined.

Platt's records, named propositions of ExplicitZetaBounds §0.4b and hypotheses never discharged
here:

- *PlattRecord*: `GRH(f, H(f))` for every `2 ≤ f ≤ 400 000`, with
  `H(f) = max(10⁸/f, 7.5·10⁷/f + 200)` for even `f` and `max(10⁸/f, 3.75·10⁷/f + 200)` for odd `f`
  (`platt-2016` Theorem 7.1, arXiv numbering).
- *PlattCentralRecord*: `L(1/2, χ) ≠ 0` for every primitive `χ` modulo `2 ≤ f ≤ 2·10⁶`
  (`platt-2016` Theorem 7.2, arXiv numbering).

Given *PlattRecord* and `RH(3 000 175 332 800)` (§1.1), `GRH*(q, 10 000)` holds for `q ≤ 13`,
`GRH*(q, 2500)` for every `q ≤ 40 000` and `GRH*(q, 10⁸/q)` for `q ≤ 400 000`, by the corollaries
of ExplicitZetaBounds §0.3: every `f ∣ q` with `f ≥ 2` has `f ≤ q` and `H(f) ≥ 10⁸/f ≥ 10⁸/q`, and
`f = 1` is `RH(H)`. The first two contain every range of Rumely's verification (`rumely-1993`
lines 29–36; the moduli Ramaré takes from it are listed at `ramare-2002` lines 152–159, the largest
being `486`), which is therefore not a hypothesis of any theorem here.

*Needs:* ExplicitZetaBounds §§0.2–0.4b (`gap:grh-up-to-height`); Mathlib
`DirichletCharacter.LFunction`, `DirichletCharacter.IsPrimitive`.

**Checks.**

- The principal character modulo `2` has `L(s, χ₀) = (1 − 2^{−s}) ζ(s)`, which vanishes at
  `s = 2πi/log 2` with real part `0`; `GRH*(2, 10)` ignores it because of the strict `0 < Re s`,
  and reads `GRH(1, 10) ∧ GRH(2, 10)`, that is `RH(10)`, no character modulo `2` being primitive.
- At `q = 8` the divisors are `1, 2, 4, 8` and the moduli that carry a primitive character are
  `1, 4, 8` (none at `2`): `GRH*(8, 10 000)` is the bounded-zero clause of *ModEightFiniteInput*
  (AnalyticNumberTheoryPartI §0.16) and needs the supplier's statements at exactly these three
  moduli.
- `GRH*(q, H)` is not `GRH(q, H)`: at `q = 6` no character is primitive, so `GRH(6, H)` holds
  vacuously for every `H`, while `GRH*(6, H)` includes `GRH(3, H)` (the character modulo `6`
  induced by `χ₋₃` has the zeros of `L(s, χ₋₃)`) and `RH(H)`.

### 1.3 Finite-range verifications

- `ButheVerified`: `|ψ(x) − x| ≤ 0.94 √x` for `11 < x ≤ 10¹⁹`; `x − θ(x) ≤ 1.95 √x` for
  `1427 ≤ x ≤ 10¹⁹`; `x − θ(x) > 0.05 √x` for `1 ≤ x ≤ 10¹⁹`; `|li x − π*(x)| < √x/log x` for
  `2 ≤ x ≤ 10¹⁹`, with `π*(x) = ∑_{k ≥ 1} π(x^{1/k})/k` (`Suggested.lean`'s `riemannPrimeCount`);
  and `0 < li x − π(x) ≤ (√x/log x)(1.95 + 3.9/log x + 19.5/log² x)` for `2 ≤ x ≤ 10¹⁹`
  (`buthe-2018` lines 73–85, Theorem 2, which prints the second from `1423`; `pnt-plus`, `ieantn`).
  IEANTN (`ieantn`) states the second clause from `1423` as well, which fails on
  `(1426.47…, 1427)`, where `θ` is constant (at `x = 1426.9`, `x − θ(x) = 74.07…` exceeds
  `1.95 √x = 73.65…`); the correct starting point is `1427`.
- *ButheFinerRange*: `−0.8 √x ≤ x − ψ(x) ≤ 0.81 √x` for `100 ≤ x ≤ 5·10¹⁰` (`buthe-2018` §6, (6.2);
  `pnt-plus`, `ieantn`); and, for each row `(x₀, M⁻, M⁺)` of its Table 1 and every `x ∈ [x₀, 2x₀]`,
  `M⁻ √x ≤ x − ψ(x) ≤ M⁺ √x`, the rows being, for `x₀ = 2^j·10¹⁰` with `j = 0, …, 6`:
  `(−0.77, 0.85)`, `(−0.75, 0.64)`, `(−0.73, 0.80)`, `(−0.80, 0.86)`, `(−0.88, 0.68)`,
  `(−0.88, 0.78)`, `(−0.66, 0.74)`; for `x₀ = 2^j·10¹²`, `j = 0, …, 6`: `(−0.80, 0.81)`,
  `(−0.79, 0.76)`, `(−0.73, 0.73)`, `(−0.80, 0.76)`, `(−0.80, 0.68)`, `(−0.67, 0.93)`,
  `(−0.78, 0.77)`; for `x₀ = 2^j·10¹⁴`, `j = 0, …, 6`: `(−0.79, 0.72)`, `(−0.60, 0.76)`,
  `(−0.65, 0.73)`, `(−0.81, 0.88)`, `(−0.66, 0.86)`, `(−0.74, 0.86)`, `(−0.73, 0.66)`; and for
  `x₀ = 2^j·10¹⁶`, `j = 0, …, 9`: `(−0.88, 0.74)`, `(−0.87, 0.70)`, `(−0.65, 0.73)`,
  `(−0.82, 0.77)`, `(−0.71, 0.92)`, `(−0.78, 0.71)`, `(−0.94, 0.82)`, `(−0.94, 0.75)`,
  `(−0.82, 0.86)`, `(−0.83, 0.94)`. Consequence (a theorem): under *ButheFinerRange*,
  `−0.88 √x ≤ x − ψ(x) ≤ 0.86 √x` for `100 ≤ x ≤ 3.2·10¹³`, from the first clause up to `5·10¹⁰` and
  the rows from `4·10¹⁰` to `1.6·10¹³`. These are the rows `(c, C)` of
  Broadbent–Kadiri–Lumley–Ng–Wilk's lower bounds for `θ` (§3.7), with `ButheVerified` the row
  `(0.94, 0.94)` to `10¹⁹`. The proposition also asserts the rows of the source's Table 2, for
  Riemann's weighted count `π*` (`buthe-2018` §6, Table 2; `ieantn`): for each row `(x₀, M⁻, M⁺)`
  and every `t ∈ [x₀, 2x₀]`, `M⁻ √t/log t ≤ li t − π*(t) ≤ M⁺ √t/log t`, the rows being, for
  `x₀ = 2^j·10¹⁰`, `j = 0, …, 6`: `(−0.87, 0.95)`, `(−0.84, 0.73)`, `(−0.82, 0.89)`,
  `(−0.89, 0.95)`, `(−0.97, 0.76)`, `(−0.96, 0.86)`, `(−0.74, 0.82)`; for `x₀ = 2^j·10¹²`,
  `j = 0, …, 6`: `(−0.88, 0.89)`, `(−0.87, 0.84)`, `(−0.81, 0.81)`, `(−0.87, 0.84)`,
  `(−0.87, 0.76)`, `(−0.74, 1)`, `(−0.85, 0.84)`; for `x₀ = 2^j·10¹⁴`, `j = 0, …, 6`:
  `(−0.86, 0.79)`, `(−0.67, 0.83)`, `(−0.72, 0.80)`, `(−0.87, 0.95)`, `(−0.72, 0.93)`,
  `(−0.80, 0.92)`, `(−0.79, 0.72)`; and for `x₀ = 2^j·10¹⁶`, `j = 0, …, 9`: `(−0.94, 0.80)`,
  `(−0.93, 0.76)`, `(−0.71, 0.79)`, `(−0.88, 0.83)`, `(−0.77, 0.98)`, `(−0.84, 0.77)`, `(−1, 0.88)`,
  `(−1, 0.80)`, `(−0.87, 0.91)`, `(−0.88, 0.99)`. The source obtains them from its Table 1 through
  the analogue for `π*` and `ψ` of the transfer of §0.4 (its Lemma 2) at `a = 100`; they are assumed
  here as printed.
- *ButheLemma3Constant*: `π(1500) − li 1500 + (1500 − θ(1500))/log 1500 ≤ 0`, that is
  `A(1500) ≤ 0` for the constant `A` of Büthe's transfer (§0.4); its value is `−3.6356…`
  (`buthe-2018` §6, the application of Lemma 3 at `a = 1500`, which does not display it; `ieantn`).
  With it the constant drops out of the lower half of the transfer at `a = 1500`, where it enters
  as `−A(1500) log x/√x ≥ 0`: under `ButheVerified`, whose third clause admits `c = 0` on
  `[1500, 10¹⁹]`, `li x − π(x) ≥ (x − θ(x))/log x > 0` for `10⁷ ≤ x ≤ 10¹⁹`. On the upper half the
  constant enters with the same sign, `+3.6356… ≥ 0`, so the proposition does not remove it there.
- *Dusart2018ThetaValues*: for each of the forty-six rows `(x, ϑ, d)` of `dusart-2018` Table 2
  (journal Lemma 4.1; `pnt-plus`), at `x = k·10^j` for `1 ≤ k ≤ 9`, `10 ≤ j ≤ 14`, and at
  `x = 10¹⁵`, `|θ(x) − ϑ| ≤ 10⁻⁶` and `|ψ(x) − θ(x) − d| ≤ 10⁻⁶`; among them
  `(10¹⁰, 9 999 939 830.657757, 102 289.175716)`,
  `(10¹⁴, 99 999 990 573 246.978538, 10 045 400.569463)` and
  `(10¹⁵, 999 999 965 752 660.939840, 31 724 269.567843)`. The values are printed to six decimals,
  rounded to nearest, so the proposition asserts each to within `10⁻⁶` in either direction; it
  implies the lower bound for `θ(10¹⁴)` that *AxlerRange* records.
- *RamanujanThetaRange*: `|θ(x) − x| ≤ (1 − (log 2)/3) x` for every real `2 ≤ x ≤ 599`
  (`platt-trudgian-2021-error` (18), its first range, `pnt-plus`; the lower side is attained in the
  limit `x → 3⁻`, where `θ(x) = log 2`).
- `DudekPlattRange`: Ramanujan's inequality `π(n)² < (e n/log n) π(n/e)` fails at
  `n = 38 358 837 682` and holds at every integer `38 358 837 682 < n ≤ 1.15·10¹⁶`
  (`dudek-platt-2015` §1, the largest counterexample below `10¹¹`, and §3.1, the computation on
  `[10¹¹, 1.15·10¹⁶]`; `ieantn`).
- *RosserSchoenfeld1962Range*: the inequalities of Theorems 1–4, 9, 11 and Corollaries 1–3 of
  §§3.2, 3.5 for every real `x ≤ 10⁷` of their ranges, and those of Theorem 3 for every
  `p_n ≤ 10⁷` (`rosser-schoenfeld-1962` lines 213–216).
- `Schoenfeld1976Range`: `(5.1*)–(5.4*)` of Theorem 6* for `0 < x ≤ 10⁸`, each on its own range
  (`(5.2*)` from `1 155 901`, `(5.4*)` from `121`); (6.2) of Theorem 10 for `73.2 < x ≤ 1427`, (6.3)
  for `599 < x ≤ 1427` and (6.4) for `59 < x ≤ 1427`; (6.18) of Corollary 1 for
  `2657 < x ≤ 5·10⁷`; and the interval of Theorem 12 for `2 010 759.9 < x ≤ 10⁸`
  (`schoenfeld-1976` lines 20–28, 81–123, 668–716, 729–733).
- *SchoenfeldTheorem7Range*: (5.5a*), (5.5b*) and the lower half of (5.6*) of Schoenfeld's
  Theorem 7* (§3.2), `|ψ(x) − x| < 0.0220646 x/log x` for `161 971 < x ≤ 2·10⁶`,
  `−0.0220646 x/log x < ψ(x) − x` for `89 909 < x ≤ 2·10⁶` and `x − 0.0239922 x/log x < θ(x)` for
  `758 711 < x ≤ 2·10⁶`; and (9.8) of his Corollary 2*, `x − x/(c log x) < θ(x)` for
  `d < x ≤ 2·10⁶`, at the six pairs `(c, d)` of §3.2 (`schoenfeld-1976` lines 767–772, 786–796
  and 1221–1233, where the source checks these ranges with the tables of Appel–Rosser, Lehmer and
  Rosser–Walker). From `2·10⁶` on `ButheVerified` gives all of them (§3.2).
- `Buthe2016Range`: `|ψ(x) − x| ≤ √x log² x/(8π)` for `59 < x < 5000`, `|θ(x) − x| ≤ √x log² x/(8π)`
  for `599 < x < 5000`, `|π*(x) − li x| ≤ √x log x/(8π)` for `97 ≤ x < 5000` and
  `|π(x) − li x| ≤ √x log x/(8π)` for `2657 < x < 5000` (`buthe-2016` lines 754–755, the end of the
  proof of Theorem 2, which prints the `π*` clause from `59`).
- *DusartThesisRange*: `|θ(x) − x| ≤ 0.006788 x/log x` for `10 544 111 < x ≤ e²²`;
  `|θ(x) − x| ≤ 0.2 x/log² x` for `3 594 641 < x ≤ 1.04·10⁷` and `≤ 3.9648085 x/log² x` for
  `1 < x ≤ 1.04·10⁷`; the `π` bounds of Théorème 1.10 for `x ≤ 10⁸`; and
  `p_k ≤ k(log k + log log k − 0.9484)` for `39 017 ≤ k ≤ 170 367` (`dusart-1998-thesis` lines
  863–864, 924–925, 1279).
- `RobinNthPrimeRange`: `p_k > k(log k + log log k − 1)` for every `k ≥ 2` with `p_k ≤ 10¹¹`
  (`dusart-1999-mc` line 118, Robin's range).
- *Robin1983Range*: `p_k ≤ k(log k + log log k − 0.9385)` for every integer `8602 ≤ k ≤ 39 016`
  (`robin-1983` line 84 and (23) at line 378, which prints `k ≥ 7022`; `pnt-plus`).
- *Dusart2018Range*: `|θ(x) − x| ≤ x/log³ x` for `89 967 803 ≤ x ≤ 10¹⁹` and `≤ 0.5 x/log³ x` for
  `767 135 587 ≤ x ≤ 10¹⁹`, and the further `θ` rows of §3.3 on `[x_k, 10¹⁹]`;
  `0.9999 √x < ψ(x) − θ(x)` for `121 ≤ x ≤ 10¹⁶`; `ψ(x) − θ(x) − θ(√x) < 1.777745 x^{1/3}` for
  `0 < x ≤ 10²⁴`; the two `π` bounds of the copy's Theorem 6.9 and those of the journal's
  Theorem 5.1 and Corollaries 5.2–5.3 (§3.5) for every `x` of their ranges with `x ≤ 10¹¹`; the two
  `p_k` bounds of its Propositions 6.6–6.7 and the `p_k` and `θ(p_k)` bounds of the journal's
  Lemma 5.14 and Propositions 5.11–5.12 (§5.3) for every `k` of their ranges with `p_k < e²⁷`;
  `|∑_{p ≤ x} (log p)/p − log x − E| ≤ 0.3/log² x` for `912 560 ≤ x ≤ 5·10⁷` (journal Theorem 5.7,
  §4.3, with `E` the constant of AnalyticNumberTheoryPartI §0.8); a prime in `(x, x(1 + 1/log³ x)]` for every real `89 693 ≤ x ≤ 2·10⁷`;
  and a prime in `[x, x(1 + 1/(5000 log² x))]` for every real `468 991 632 ≤ x ≤ 10⁹` (`dusart-2018`,
  arXiv copy Theorem 5.2, Propositions 3.1, 6.6–6.7, Lemma 3.3 and Theorem 6.9, journal
  Proposition 5.4 and Corollary 5.5, `pnt-plus`; the first two rows as quoted at
  `deleglise-nicolas-2019-landau` lines 387–388).
- `LeeNosalRange`: `|ψ(x) − x| ≤ √x log x (log x − log log x)/(8π)` for `101 ≤ x ≤ 338` and
  `|θ(x) − x| ≤ √x log x (log x − log log x)/(8π)` for `2657 ≤ x ≤ 3382` (`lee-nosal-2026` §3.2).
- *LeeNosalMertensRange*: `|∑_{p ≤ x} (log p)/p − log x − E| ≤ 3 log² x/(8π√x)` for
  `43.1 ≤ x ≤ 10⁶` and `|∑_{p ≤ x} 1/p − log log x − B| ≤ 3 log x/(8π√x)` for `24.4 ≤ x ≤ 10⁶`, with
  `E` the constant of AnalyticNumberTheoryPartI §0.8 (the limit of `∑_{p ≤ x} (log p)/p − log x`)
  and `B` the Meissel–Mertens constant (`lee-nosal-2026` §3.3).
- *ChirreHelfgottRange*: `|ψ(x) − x| ≤ 34.409 x/log⁴ x` for `69 997 ≤ x ≤ 10⁶`
  (`chirre-helfgott-2025` §10.1, which prints `69 991`).
- *Axler2018Range*: a prime in `(x, x(1 + 0.087/log³ x)]` for every real `6 034 256 ≤ x ≤ 2·10⁷`
  (`axler-2018` §4, the proof of Theorem 4.1), and the two `π` bounds of its Theorems 1.2–1.3 (§3.5)
  for every `x` of their ranges with `x ≤ 10¹⁹` (the proofs of those theorems).
- `AxlerPrimeCountingUpperRange`: the upper bound of `axler_primeCounting_upper` (§3.5) for every
  real `48 ≤ x ≤ 10¹⁹` (`axler-2024` §§3–5, arXiv numbering).
- *Axler2024Range*: the other three `π` bounds of §3.5 taken from `axler-2024`, each for every `x`
  of its range with `x ≤ 10¹⁹`; `|θ(x) − x| < 0.024334 x/log³ x` for
  `1 757 126 630 797 ≤ x ≤ e²⁹`; and a prime in `(x, x(1 + (114.368 + 2.145·10⁻¹⁰)/log⁴ x)]` and one
  in `(x, x(1 + (268 820 + 5.0363·10⁻⁷)/log⁵ x)]` for every real `2 ≤ x ≤ 2·10⁷` (`axler-2024`, arXiv
  v4, proofs of Theorems 1.2–1.4 and Propositions 1.1, 4.5 and 5.3).
- `AxlerIntervalRange`: a prime in `(x, x(1 + (0.048668 + 8.22·10⁻¹¹)/log³ x)]` for every real
  `17 051 708 ≤ x ≤ 2·10⁷` (`axler-2024`, arXiv v4, proof of Theorem 1.2).
- *BKLNWRange*: every lower bound `x (1 − m_k/log^k x) ≤ θ(x)` of the rows of Tables 14–15 (§3.7)
  for every `x` of its range with `x ≤ 7·10¹¹` (`broadbent-kadiri-lumley-ng-wilk-2021` Table 13
  and §1).
- `LamzouriLiSoundararajanRange`: for every `3 < q ≤ 20 000` and every unit `a` modulo `q`, a prime
  `p ≡ a (mod q)` with `p ≤ (φ(q) log q)²` (`lamzouri-li-soundararajan-2015` §4.3).
- *TrudgianRange*: with `ε₀(x) = √(8/(17π)) X^{1/2} e^{−X}` and `X = √(log x/6.455)`,
  `|ψ(x) − x| ≤ x ε₀(x)` for `23 ≤ x ≤ 36` and `|θ(x) − x| ≤ x ε₀(x)` for `149 ≤ x ≤ 1427`
  (`trudgian-2016` lines 66–73; `pnt-plus`); and
  `|π(x) − li x| ≤ 0.2795 x (log x)^{−3/4} exp(−√(log x/6.455))` for `229 ≤ x ≤ 360`, the range
  below which the `π` clause of `ButheVerified` does not reach that bound (it does from
  `x = 359.3`; `trudgian-2016` lines 132–140).
- *MossinghoffTrudgianRange*: with `Y = √(log x/6.315)`, `|θ(x) − x| ≤ x √(8/(17π)) Y^{1/2} e^{−Y}`
  for `149 ≤ x ≤ 1427` (`mossinghoff-trudgian-2015` §7, Corollary 1 on the initial segment of its
  range that `ButheVerified` does not reach; §3.4).
- `TrudgianIntervalRange`: a prime in `[x, x(1 + 1/(111 log² x))]` for every real
  `2 898 242 ≤ x ≤ 4 652 353` (`trudgian-2016` lines 229–236, which print the threshold
  `2 898 239`; `pnt-plus`).
- *JohnstonYangRange*: `|π(x) − li x| ≤ 9.59 x (log x)^{0.515} exp(−0.8274 √log x)` for `2 ≤ x ≤ 5`;
  and the three bounds of Theorem 1.4 (§3.6), the `ψ` bound for `23 ≤ x < 59`, the `θ` bound for
  `59 ≤ x ≤ 599` and the `π` bound for `71 ≤ x ≤ 2657` (`johnston-yang-2023` lines 541–542,
  554–555, 645 and 702–704).
- *AxlerRange*: the upper bound of Theorem 1.1 for `1 < x ≤ 5·10⁵`, the upper bound of Theorem 1.3
  for `e^{3.804} ≤ x ≤ 140 000`, the lower bound of Theorem 1.4 for `1 332 479 531 ≤ x ≤ 8·10⁹` and
  the lower bound of Theorem 1.2 for `1 332 450 001 ≤ x ≤ 1 332 479 531` (the four inequalities of
  §3.5), with `π(8·10⁹) = 367 783 654`, `θ(8·10⁹) ≤ 7 999 890 793`, `π(10¹⁴) = 3 204 941 750 802` and
  `θ(10¹⁴) ≥ 99 999 990 573 246` (`axler-2016` lines 135, 145–150, 192–202, 235, 241–246, 275–280).
- *Axler2019Range*: the inequalities of Theorems 1.6–1.9 (§5.5) for every integer `n` of their
  ranges with `n < 841 424 976`, and those of Theorems 1.1–1.3 (§4.6) for every `x` of their ranges
  with `x ≤ 10¹¹` (`axler-2019` lines 402, 448, 508, 554, 562–563, 574).
- *AxlerNthPrimeRange*: the upper bound of §5.6 for every integer `46 254 381 ≤ n < 1 338 564 587`
  and its lower bound for every integer `2 ≤ n < 1 338 564 587` (`axler-2019-nth-prime` §§2–4).
- *Ramare2013Range*: `|∑_{n ≤ x} Λ(n)/n − log x + γ| ≤ 1.833/log² x` for `1 < x < 8950`,
  `≤ 1.31/√x` for `1 ≤ x ≤ 10¹⁰`, `≤ 0.0067/log x` for `1.52·10⁶ ≤ x ≤ 10¹⁰`, `≤ 0.01/log x` for
  `468 000 ≤ x ≤ 10¹⁰` and `≤ 1/(4 log x)` for `115 ≤ x ≤ 10¹⁰` (`ramare-2013` lines 105–107, as
  corrected in `ramare-2023-corrigendum`).
- `VanlalngaiaRange`: `|∑_{p ≤ x} 1/p − log log x − B| ≤ 4/log³ x` for `2 ≤ x ≤ 89 967 803`,
  `≤ 2.3/log³ x` for `1000 ≤ x ≤ 89 967 803` and `≤ 1/log³ x` for `24 284 ≤ x ≤ 89 967 803`
  (`vanlalngaia-2017` lines 26–56).
- *DelegliseNicolasRange*: (2.19) of §4.6 for `110 117 910 ≤ x ≤ 110 118 925`; with
  `x₁ = 89 967 803`, (2.21) for `60 173 ≤ x ≤ x₁`, (2.22) for `60 297 ≤ x ≤ 315 011`, (2.23) for
  `1 091 239 ≤ x ≤ x₁`, (2.24) for `32 321 < x ≤ 1 091 239`, and (2.25)–(2.27) for `664 ≤ x ≤ x₁`,
  `200 ≤ x ≤ x₁`, `44 ≤ x ≤ x₁`; and the values `θ(x₁)` and `π_r(x₁)`, `r ∈ {2, 3, 4, 5}`, that
  enter the constants `C₀` (`deleglise-nicolas-2019-landau` lines 706–750, 758–762, 771, 785–787).

*Needs:* the carriers of Layer 0; Mathlib `Nat.nth Nat.Prime`.

### 1.4 Prime-gap verifications

Consecutive primes `p < p⁺` are `Nat.nth Nat.Prime n < Nat.nth Nat.Prime (n + 1)`.

- `PrimeGapLogSquareVerified`: `p⁺ − p < log² p` for consecutive primes with `11 ≤ p ≤ 4·10¹⁸`
  (`oliveira-e-silva-herzog-pardi-2014` §2.2, as quoted at `carneiro-milinovich-soundararajan-2019`
  lines 269–273, (1.15); `pnt-plus`).
- `TrudgianGapBound`: `p⁺ − p ≤ p/(111 log² p)` for consecutive primes with
  `4 652 353 ≤ p ≤ 4·10¹⁸` (the record gaps of `oliveira-e-silva-herzog-pardi-2014` Table 8,
  lines 1795–1821).
- *RecordGapBound* `c k P`, for real `c > 0`, `k ∈ ℕ` and `P ≥ 2`: `p⁺ − p ≤ c p/log^k p` for
  consecutive primes with `p⁺ ≥ P` and `p ≤ 4·10¹⁸` (the same table). Its instances used here are
  at `(c, k, P) = (0.087, 3, 2·10⁷)`, `(198.2, 4, 2)`, `(1.1817, 3, 58 890)`, `(1, 3, 2·10⁷)`,
  `(1/5000, 2, 10⁹)`, `(114.368 + 2.145·10⁻¹⁰, 4, 2·10⁷)` and `(268 820 + 5.0363·10⁻⁷, 5, 2·10⁷)`
  (§7.4). The instance at `c = 1.1817` starts at `P = 58 890`, not at the threshold `58 837` of the
  theorem that uses it: from `P = 58 837` on it would include the prime `58 831`, whose successor
  `58 889` lies `58` beyond it, more than `1.1817 · 58 831/log³ 58 831 = 52.48` (negative control);
  `axler-2016` lines 354–360 check the gaps only from the prime `58 889` on.
- `AxlerGapBound`: *RecordGapBound* `(0.048668 + 8.22·10⁻¹¹) 3 (2·10⁷)` (the same table).

The records of the gaps. For natural `p` and `g`, `(p, g)` is a *maximal gap* when `p` is prime,
its successor is `p + g`, and every prime `p′ < p` is followed by a gap smaller than `g`. Write
`P₁(g)` for the least prime followed by a gap `g`, and `0` when no prime is (`sInf` of the set of
such primes; `0` is no prime, so the value is unambiguous). Prove: `P₁(1) = 2`, `P₁(2) = 3`,
`P₁(4) = 7`, `P₁(g) = 0` for every odd `g ≥ 3` (every gap after `2` is even), and `P₁(g) ≠ 0` exactly
when some prime is followed by a gap `g`; if `(p, g)` is a maximal gap then `P₁(g) = p`. The tables,
assumed:

- *MaximalGapTable*: the maximal gaps `(p, g)` with `p ≤ 4·10¹⁸` are exactly the rows of
  `oliveira-e-silva-herzog-pardi-2014` Table 8 (`pnt-plus`), which begins
  `(2, 1), (3, 2), (7, 4), (23, 6), (89, 8)` and ends with `(804 212 830 686 677 669, 1442)` and
  `(1 425 172 824 437 699 411, 1476)`.
- *FirstGapTable*: for every row `(g, Q)` of the same paper's Table 9 (`pnt-plus`), `P₁(g) = Q` and
  every `g′ < g` that is even or equal to `1` has `1 ≤ P₁(g′) < Q`; and the rows are all
  the pairs with this property and `g < 1346`. Its last row is `(1306, 3 278 018 069 102 480 227)`.

Consequences, theorems of this section:

- Under *MaximalGapTable*, every gap `p⁺ − p` after a prime `p ≤ 4·10¹⁸` is at most `1476`: the
  largest gap after the primes up to `p` is the last maximal gap at or before `p`, a row of the
  table. `PrimeGapLogSquareVerified` gives only `p⁺ − p < log²(4·10¹⁸) = 1834.6`.
- Under *FirstGapTable*, `1 ≤ P₁(g) ≤ 3 278 018 069 102 480 227` for `g = 1` and every even
  `g ≤ 1306`, by the last row.
- The record-pair interval lemma: if `(p, g)` is a maximal gap, then for
  every real `x` with `2 ≤ x ≤ p` and every real `h ≥ g` the interval `(x, x + h]` contains a prime.
  Route: let `p′` be the largest prime `≤ x`, so `p′ ≤ p`; if `p′ < p` its successor exceeds `x` and
  is at most `p′ + g′ < x + g` with `g′ < g` its gap; if `p′ = p` then `x = p` and the successor is
  `x + g`. It is Mandl's lemma of §7.1 at a record, with no hypothesis on the other gaps.

*Needs:* Mathlib `Nat.nth Nat.Prime`, `Nat.prime_nth_prime`, `Nat.sInf_def`.

### 1.5 Progression tabulations

- *RamareRumelyTabulation*: for every modulus `k` of Ramaré–Rumely's Table 1, every `l` prime to
  `k` and `1 ≤ x ≤ 10¹⁰`, `max_{1 ≤ y ≤ x} |θ(y; k, l) − y/φ(k)| ≤ 2.072 √x` and
  `max_{1 ≤ y ≤ x} |ψ(y; k, l) − y/φ(k)| ≤ 1.745 √x` (`ramare-rumely-1996` lines 77–84, Theorem 2).
- *RamareRumelyTabulationSharp*: the `ψ` clause of *RamareRumelyTabulation* with `1.000` in place of
  `1.745` for `k = 5` and every `k ≥ 7` of Table 1, and with `√2` for `k = 1`
  (`ramare-rumely-1996` lines 88–92).
- *Ramare2002Tabulation*: for every `q` in Rumely's list,
  `max_{1 ≤ L ≤ 10⁵} max_{a unit} √L |logPsiAP q a L − log L/φ(q) − C(q, a)| ≤ v♯(q) ≤ 1` and
  `max_{182 ≤ L ≤ 261} max_{a unit} |logPsiAP q a L − log L/φ(q) − C(q, a)| ≤ ε♯(q)`, with `v♯(q)` and
  `ε♯(q) ≤ 2/9` the values of the paper's final tables, which satisfy `v♯(q) ≤ √261 · ε♯(q)`
  (`ramare-2002` lines 161–169, Théorème 2, and lines 1229–1232).

*Needs:* AnalyticNumberTheoryPartI §0.2; §0.2.

### 1.6 Decimal enclosures of γ and of the Meissel–Mertens constant

Stated here, once, for this roadmap and for ExplicitMultiplicativeFunctions, which is later in the
order of supply:

- *EulerGammaEnclosure*: `|γ − 0.5772156649| < 10⁻⁹` for `γ = Real.eulerMascheroniConstant`
  (`ramare-rumely-1996` line 294; `pnt-plus`).
- *MeisselMertensEnclosure*: `|B − 0.2614972128| < 10⁻⁹` for
  `B = TauCeti.LFunctions.mertensConstant ℚ` (`rosser-schoenfeld-1962` line 81, (2.10); `pnt-plus`).

Unconditional companions, theorems of this section:

- The prime-power constant: `E₁ = ∑_p log p/(p(p − 1))` converges, and
  `0 ≤ E₁ ≤ (5 log 2 + 3)/4`. Route: `log p/(p(p − 1)) ≤ 2 log p/p²`
  and Mathlib's `θ(t) ≤ (log 4) t` with Abel summation for convergence; for the bound, the term
  `p = 2` is `(log 2)/2` and the others are at most `∑_{n ≥ 3} log n/(n(n − 1))`, which comparison
  with `∫` bounds by `(3 log 2)/4 + 3/4`. Its value `0.7553666…` is not asserted.
- The crude enclosure of `B`, from any constants in Mertens' first theorem: if `c₁, c₂ ≥ 0` satisfy
  `−c₁ ≤ ∑_{p ≤ t} (log p)/p − log t ≤ c₂` for every `t ≥ 2`, then
  `1 − log log 2 − c₁/log 2 ≤ B ≤ 1 − log log 2 + c₂/log 2`. Route: Abel summation of `(log p)/p`
  against `1/log t` gives `B = 1 − log log 2 + ∫₂^∞ R(t) dt/(t log² t)` with
  `R(t) = ∑_{p ≤ t} (log p)/p − log t` (the route of AnalyticNumberTheoryPartI §0.21), and
  `∫₂^∞ dt/(t log² t) = 1/log 2`. With the elementary constants of §4.1, `c₁ = 2 + E₁` and
  `c₂ = log 4 + 4`, it gives `(−2 − E₁)/log 2 + 1 − log log 2 ≤ B ≤ (log 4 + 4)/log 2 + 1 − log log 2`
  there.

*Needs:* Mathlib `Real.eulerMascheroniConstant`, `Chebyshev.theta_le_log4_mul_x`,
`sum_mul_eq_sub_sub_integral_mul`; Tau Ceti `TauCeti.LFunctions.mertensConstant`,
`TauCeti.LFunctions.tendsto_primeSummatory_inv_absNorm_sub_log_log`; AnalyticNumberTheoryPartI
§0.21.

### 1.7 The real-zero gap

*RealZeroGap* `c Q`, for real `c` and a conductor cap `Q ∈ [3, ∞]`, is this roadmap's name for
ExplicitZetaBounds §7.9's *HasLandauSiegelGap* `c Q`: for every primitive real nonprincipal
Dirichlet character `χ` of conductor `q` with `3 ≤ q ≤ Q` and every real `β ∈ (0, 1)` with
`DirichletCharacter.LFunction χ β = 0`, `(1 − β) log q ≥ c`. Its laws are proved there: antitone
in `c` and in `Q`; true for some `c > 0` at `Q = ∞` (AnalyticNumberTheoryPartI §0.34); and true for
every `c` when `Q ≤ 400 000`, given *PlattRecord* and *PlattCentralRecord* (§1.2), its trivial case,
since by ExplicitZetaBounds §0.3 (`LFunction_ne_zero_of_platt`) no primitive character of conductor
at most `400 000` has a real zero in `(0, 1)`. Its two instances used here are those of
ExplicitZetaBounds §7.9, each given the record *LuZamanZhaoRecord* of its §0.4b (for `q ≤ 10¹⁰` and
every quadratic `χ` modulo `q`, `L(σ, χ) ≠ 0` for real `σ ≥ 1 − 1/(5 log q)`, Lu–Zaman–Zhao's
computation), which is a hypothesis never discharged here:

- *RealZeroGap* `(1/5) 10¹⁰`, given *LuZamanZhaoRecord* (the first instance of that section;
  `lu-zaman-zhao-2026` Theorem 1.1). A statement here that uses it carries *LuZamanZhaoRecord*.
- *RealZeroGap* `(3.0·10⁻³) ∞`, given *LuZamanZhaoRecord*, Banks's instance there (`banks-2026`
  Theorem 1.1, *(preprint)*). By the Conventions on preprint inputs, a statement here that uses it
  takes *RealZeroGap* `(3.0·10⁻³) ∞` itself as a hypothesis.

Passage to all characters of a modulus, the form §6.7 uses: under *RealZeroGap* `c Q`, for
`3 ≤ q ≤ Q`, every real zero `β ∈ (0, 1)` of `L(s, χ)` for a real nonprincipal character `χ`
modulo `q` satisfies `(1 − β) log q ≥ c`. The character is induced by a primitive real character of
conductor `d ∣ q`, `3 ≤ d ≤ q`, with the same real zeros (Conventions), and
`(1 − β) log q ≥ (1 − β) log d`; the principal character has no real zero in `(0, 1)`, `ζ` having
none.

*Needs:* ExplicitZetaBounds §7.9 (`gap:real-zero-gap`), §0.3 (`LFunction_ne_zero_of_platt`, for the
trivial case) and §0.4b (*LuZamanZhaoRecord*); Mathlib `DirichletCharacter.LFunction`,
`DirichletCharacter.IsPrimitive`, `DirichletCharacter.conductor`.

**Checks.**

- The passage to a modulus is one-way in `log`: the character modulo `6` induced by `χ₋₃` has the
  real zeros of `L(s, χ₋₃)`, and the bound `(1 − β) log 6 ≥ c` it gets is weaker than
  `(1 − β) log 3 ≥ c` at the conductor, never stronger.

### Examples

- `GRH*(6, H)` is `RH(H) ∧ GRH(3, H)`, no character modulo `2` or `6` being primitive (§1.2).
- Under *RealZeroGap* `c Q`, a real zero of a character modulo `q ≤ Q` satisfies the gap at `log q`
  (§1.7).

### Dependencies

Mathlib `riemannZeta`, `analyticOrderNatAt`, `DirichletCharacter.LFunction`,
`DirichletCharacter.IsPrimitive`, `Real.eulerMascheroniConstant`, `Nat.nth`; Tau Ceti
`TauCeti.LFunctions.mertensConstant`; ExplicitZetaBounds §§0.2–0.4b, 7.9 (the gaps
`rh-up-to-height`, `grh-up-to-height`, `real-zero-gap`); ZerosOfLFunctions §4.1;
AnalyticNumberTheoryPartI §§0.2, 0.8, 0.21, 0.34, 1.6; Layer 0. No later layer is used; the
instance of §1.6's enclosure of `B` at the elementary constants is stated in §4.1.

## Layer 2: bounds under the Riemann hypothesis and under the Riemann hypothesis to a height

### 2.1 The smoothed explicit formula and the basic zero sums

The explicit inequalities of Layers 2, 3, 6 and 7 start from the Weil explicit formula at
`K = ℚ` (ZerosOfLFunctions §8.4, `riemannZeta_weilExplicitFormula`), applied to a smoothing kernel
that is not infinitely differentiable, or, for the Pintz form of §3.1(d), from the truncated
explicit formula with a numerical error below, and from explicit bounds for sums over the zeros.

- Extension of the test class: the Weil formula holds for every continuous `φ : (0, ∞) → ℂ` with
  compact support `[a, b] ⊂ (0, ∞)` that is absolutely continuous and whose derivative `t φ'(t)`
  with respect to `t d/dt` agrees almost everywhere with a function of bounded variation, of total
  variation `V`; the zero side is absolutely convergent. Two integrations by parts give
  `|φ̃(s)| ≤ max(1, b) V/|s|²` for `0 ≤ Re s ≤ 1`, `s ≠ 0`, the second one in the Stieltjes sense so
  that jumps of `t φ'` count in `V`. Route: mollify `φ` multiplicatively, which keeps the support in
  `[a e^{−ε}, b e^{ε}]` and the variation at most `V`; the transforms converge at every zero and are
  dominated by `max(1, b e) V/|ρ|²`, which is summable over the zeros because `N(T) = O(T log T)`
  (ZerosOfLFunctions §4.5), so the zero side converges by dominated convergence, while the prime
  side is a finite sum and the archimedean term an integral of `φ` against a fixed kernel.
- The kernels used later lie in this class: Rosser–Schoenfeld's kernels built from `(4t(1 − t))^m`,
  `m ≥ 1` (as in `kadiri-lumley-2014` lines 503–509; `m = 1` in `rosser-schoenfeld-1975` line 537),
  which are `C^{m−1}` with a piecewise smooth `(m−1)`-st derivative; and the kernel
  `t ↦ t^{−1/2} cos(ϑ log(a/t))` on `[a e^{−δ}, a e^{δ}]`, `ϑδ = π/2`, of
  `carneiro-milinovich-soundararajan-2019` Lemma 7 (lines 1185–1189), which is continuous with two
  corners.
- The sum over all zeros: `∑_ρ 1/(ρ(1 − ρ))`, summed over the zeros of the entire completion with
  multiplicity, equals `2 + γ − log 4π = 0.04619…`; it is twice the real part of `∑_ρ 1/ρ` in paired
  order, which is `1 + γ/2 − (log 4π)/2 = 0.02310…`, the constant of the Hadamard product
  (ZerosOfLFunctions §5.6, with `ξ'/ξ(0)` evaluated through `Λ'/Λ(0) = −Λ'/Λ(1)` and the Laurent
  expansion of `ζ` at `1`). Under `RH` this is `∑_ρ 1/|ρ|²`.
- Explicit partial sums under `RH(H)`: `∑_{0 < γ ≤ T} 1/γ ≤ (1/4π) log²(T/2π) + ∫ (remainder)`, with
  the remainder bounded through `gap:explicit-zero-count-error`: for
  `R(T) = a₁ log T + a₂ log log T + a₃`,
  `∑_{0 < γ ≤ T} 1/γ ≤ (1/4π) log²(T/2π) + (a₁ log T + a₂ log log T + a₃)/T + ∫₂ᵀ R(t)/t² dt + c₀`
  with `c₀` the contribution of the zeros below height `2`, which is `0`.
- Weighted sums over high zeros, by the two forms of ExplicitZetaBounds §5.4 (supplier contracts).
  Brent–Platt–Trudgian's form (`brent-platt-trudgian-2021` Lemma 3) needs a weight of class `C²`
  with `φ ≥ 0`, `φ′ ≤ 0` and `φ″ > 0` on `[T₀, ∞)`, `168π < T₀ ≤ T₁` in the supplier's form (the
  source's own range `2π ≤ T₀` rests on a computation with the zeros below `168π`), and leaves,
  besides the exact
  boundary terms `φ(T₂) Q(T₂) − φ(T₁) Q(T₁)`, an error of size `|φ′(T₁)| log T₁ + φ(T₁)/T₁`
  rather than `φ(T₁) log T₁`; Lehman's form needs only a continuous, nonnegative, non-increasing
  weight and `T₁ ≥ 2πe`. The convexity is essential to the first (Checks). A weight that increases
  up to a point `W` and decreases after it, such as `y^{−m−1} exp(−X²/log(y/17))` of §3.1(b), is
  handled by the same Stieltjes integration against `N = M + Q` with the zero-count error
  `|Q| ≤ R` of `gap:explicit-zero-count-error`, split at `W` (Rosser–Schoenfeld's Lemma 7, as
  quoted at `faber-kadiri-2015` lines 432–450). Each route below uses the form whose hypotheses its
  weight satisfies on the range where it is applied.
- The truncated explicit formula with a numerical error (`cully-hugill-johnston-2021` lines 83–93,
  Theorem 1.2, arXiv v5 numbering). Assume `RH(3 000 175 332 800)`, the classical-shape region with
  `R₀ = 5.5666305` (`gap:classical-zero-free-constants`), Ford's region of ExplicitZetaBounds §7.2
  for `t ≥ 1.88·10¹⁴`, the region of `gap:vinogradov-korobov-constants`, and *PsiThetaUpper*
  `(1 + 1.93378·10⁻⁸, 1.04320, e⁴⁰)` (§2.2). For `α ∈ (0, 1/2]`, `λ ≥ θ'/T` and `x_M ≥ e⁴⁰`, every
  `x ≥ x_M` and every `T` with `max(51, log x) < T < (x^α − 2)/2` satisfy
  `|ψ(x) − x + ∑_{|γ| ≤ T} x^ρ/ρ| ≤ E(x, T)`, the sum over the zeros with multiplicity, where `E` is
  the explicit error of the source's proof (lines 762–878): the Perron error of ExplicitZetaBounds
  §6.1 at `a_n = Λ(n)`, `κ = 1 + 1/log x` and the cut-off `λ`, in which the first term is bounded by
  Delange's `∑ Λ(n)/n^κ < log x` and the short sums of `Λ(n)` by the Brun–Titchmarsh inequality of
  §0.1 with *PsiThetaUpper*, plus the error `K x (log x)^{1−ω}/T` of Wolke's contour argument made
  explicit (their Theorem 4.1, lines 386–405, with the widest of the three regions above `3·10¹²`
  and the zero count of `gap:explicit-zero-count-error`). Table proposition of this section:
  *CullyHugillJohnstonTable* (lines 1064–1074, Table 4): for each row `(log x_M, α, λ, M)`,
  `E(x, T) ≤ M x log x/T` on that range; in particular the rows `(40, 1/2, 0.48, 6.431)`,
  `(1000, 1/10, 1.05, 2.045)` and `(1000, 1/100, 1.80, 0.6651)`. The consequence that the Pintz-form
  instances of §3.4 use, the *Dudek shape*: for `x ≥ e⁴⁰` and `max(51, log x) < T < (√x − 2)/2`,
  `|ψ(x) − x + ∑_{|γ| ≤ T} x^ρ/ρ| ≤ 2 x log² x/T`, by the first row, since `6.431 ≤ 2 log x` there.
  Dudek's own statement of that shape, for `x > e⁶⁰` half an odd integer and every `50 < T < x`
  (`dudek-2016` lines 115–125, Theorem 2.1), has a proof in which Fiori–Kadiri–Swidinsky record
  errors whose correction may not recover the constant (`fiori-kadiri-swidinsky-2023-psi`, Remark
  3.3 and its footnote, arXiv numbering); its full range of `T` is *DudekExplicitFormula* below, a
  target of this section with a route of its own. Platt–Trudgian use it only with `T` far below
  `√x/2`, where the shape above holds; Broadbent–Kadiri–Lumley–Ng–Wilk's Theorem 13 and
  Fiori–Kadiri–Swidinsky's Theorem 1.1 (§3.1(d)) use it on its full range.
  More generally (`fiori-kadiri-swidinsky-2023-psi` Theorem 3.2, quoting
  `cully-hugill-johnston-2021`; `pnt-plus`), under the same hypotheses, for every `α ∈ (0, 1/2]` and
  `ω ∈ [0, 1]` there are explicit `M` and `x_M` such that for every `x ≥ x_M` and every `T` with
  `max(51, log x) < T < (x^α − 2)/5` some `T* ∈ [T, 2.45 T]` has
  `|ψ(x) − x + ∑_{|γ| ≤ T*} x^ρ/ρ| ≤ M x (log x)^{1−ω}/T`: the factor `log^{1−ω}` is that of Wolke's
  contour error above, and the free height `T*` is chosen away from the ordinates so that the
  horizontal segments cost no extra logarithm; `ω = 0` with `T* = T` is the form stated above.
- Sums over the ordinates from a zero count (`fiori-kadiri-swidinsky-2023-psi` Lemma 2.1 and
  Corollary 2.3; `pnt-plus`). Let `b₁, b₂, b₃ ≥ 0` with
  `|N(T) − M(T)| ≤ R(T) = b₁ log T + b₂ log log T + b₃` for every `T ≥ 2` (at Rosser's triple this
  is ExplicitZetaBounds §5.2). For `2π < U ≤ V`, `∑_{U ≤ γ < V} 1/γ ≤ B₁(U, V)` with
  `B₁(U, V) = (1/2π + (b₁ log U + b₂)/(U log U log(U/2π))) log(V/U) log(√(UV)/2π) + 2 R(U)/U`; and,
  under *FioriKadiriSwidinskyZeroSums* (§1.1), `∑_{0 < γ < V} 1/γ < S₀ + B₁(T₀, V)` for every pair
  `(T₀, S₀)` there and every `V > T₀`. Route: Stieltjes integration of `1/t` against `N = M + Q` on
  `[U, V)`, with `∫_U^V dM(t)/t = (1/4π)(log²(V/2π) − log²(U/2π)) = (1/2π) log(V/U) log(√(UV)/2π)`,
  the boundary terms `|Q| ≤ R` at both ends, and `∫_U^V R(t) dt/t²` integrated by parts, its
  derivative term `(b₁ + b₂/log U)(1/U − 1/V)` being at most the second part of the first term.
- The two-sided bound for the reciprocal sum (`johnston-yang-2023` lines 189–203, Lemma 2.5): for
  every `T ≥ 4πe`, `(1/4π) log²(T/2π) − 0.9321 ≤ ∑_{0 < γ ≤ T} 1/γ ≤ (1/4π) log²(T/2π)`, so that
  `∑_{|γ| ≤ T} 1/|ρ| ≤ (1/2π) log²(T/2π)` and
  `∑_{H < |γ| ≤ T} 1/|ρ| ≤ (1/2π)(log²(T/2π) − log²(H/2π)) + 1.8642` for `4πe ≤ H ≤ T`. These are
  the bounds behind the term `s₁` of §3.1(d) and behind Broadbent–Kadiri–Lumley–Ng–Wilk's (A.10)
  (`pnt-plus`), `|∑_{β < 1 − δ, |γ| < T} x^{ρ−1}/ρ| ≤ x^{−δ}((1/2π) log²(T/2π) + 1.8642)` for
  `0 ≤ δ ≤ 1`. Route: the sum is `(1/4π) log²(T/2π) + A + O(log T/T)` with `A < 0` by Stieltjes
  integration against `N` (the Hadamard constant of the bullet on all zeros above and the zero count
  of `gap:explicit-zero-count-error`), the explicit error decreasing below `|A|` from a height on,
  and the zeros below that height entering through `ZetaZeroReciprocalSum` and
  `ZetaZeroCountLowRange` (§1.1); the upper side fails just above the fifth ordinate `32.935…`,
  below `4πe = 34.16`.
- The Dudek shape on the full range of `T`, *DudekExplicitFormula*: prove that for every `x > e⁵⁰`
  that is half an odd integer and every `T` with `50 < T < x`,
  `|ψ(x) − x + ∑_{|γ| < T} x^ρ/ρ| ≤ 2 x log² x/T`, so that
  `|ψ(x) − x| ≤ ∑_{|γ| < T} |x^ρ/ρ| + 2 x log² x/T` (the range of `fiori-kadiri-swidinsky-2023-psi`
  Theorem 3.1, which restates Dudek's Theorem 2.1, printed for `x > e⁶⁰`, from `e⁵⁰`; `pnt-plus`);
  and the same inequality for every real `x ≥ e¹⁰⁰⁰` and every `50 < T ≤ x`
  (`broadbent-kadiri-lumley-ng-wilk-2021` (A.7), arXiv numbering; `pnt-plus`). For `x ≥ e⁴⁰` and
  `max(51, log x) < T < (√x − 2)/2` it is the Dudek shape above; the content is the range up to
  `T < x`, which no row of *CullyHugillJohnstonTable* reaches (their `α ≤ 1/2`). Route: the
  truncated Perron formula of ExplicitZetaBounds §6.1 at `a_n = Λ(n)` and `κ = 1 + 1/log x`, then
  the shift of the contour to `Re s = −(2k + 1)`, `k → ∞`, between the trivial zeros, where `|ζ′/ζ|`
  is bounded through the functional equation, the residues being `x`, the zeros with `|γ| < T`,
  `−log 2π` at `0` and `−(1/2) log(1 − x⁻²)` at the trivial zeros; the horizontal sides at a height
  `T* ∈ [T, T + 1]` at distance at least `1/(2 log T)` from every ordinate, where `ζ′/ζ(σ + iT*)` is
  the sum of `1/(s − ρ)` over the zeros with `|γ − T*| < 1` plus a term of absolute value at most an
  explicit multiple of `log T` (the partial fractions of ZerosOfLFunctions §5.6 with the zero count
  of `gap:explicit-zero-count-error`), and the zeros with `T ≤ |γ| ≤ T*` moved back at a cost at
  most `(2x/T)(N(T + 1) − N(T − 1))`; and the terms of the Perron error with `n` near `x` bounded
  through `|x − n| ≥ 1/2` when `x` is half an odd integer, and in general through `Λ(n) ≤ log x`,
  both with the short sums of `Λ` controlled by the Brun–Titchmarsh inequality of §0.1. The error
  obtained is of order `x log x log log x/T`, and `log x > 50` (respectively `> 1000`) leaves the
  margin to `2 x log² x/T`; with `Λ(n) ≤ log x` alone in place of Brun–Titchmarsh the near terms
  already cost about `2 x log² x/T`, with no margin left, so the constant `2` needs that step.

*Needs:* ZerosOfLFunctions §§4.5, 5.6, 8.4; Mathlib `mellin`; `gap:explicit-zero-count-error`;
ExplicitZetaBounds §5.4; for the sums over the ordinates, §1.1 (*FioriKadiriSwidinskyZeroSums*,
`ZetaZeroReciprocalSum`, `ZetaZeroCountLowRange`); for the truncated explicit formula, ExplicitZetaBounds §6.1 (the
Perron formula), §3.4 (Delange's inequality) and §7.2 (Ford's region), §0.1 (`brun_titchmarsh`),
*PsiThetaUpper* (§2.2), `gap:rh-up-to-height`, `gap:classical-zero-free-constants`,
`gap:vinogradov-korobov-constants`; for *DudekExplicitFormula*, ExplicitZetaBounds §6.1,
ZerosOfLFunctions §5.6, Mathlib `riemannZeta_one_sub` (the functional equation), §0.1 and
`gap:explicit-zero-count-error`.

**Checks.**

- `φ = 0` gives `0 = 0`; a test function supported in `(0, 1)` makes the prime side vanish and
  leaves `∑_ρ φ̃(ρ) = φ̃(0) + φ̃(1) + A(φ)`.
- Brent–Platt–Trudgian's form without convexity is false (negative control), at every height of
  the supplier's range: take an ordinate `γ` of a zero with `γ > 168π + 1`, `T₁ = γ − 1`, and a
  weight `φ = 1` on `[T₁, c]` that decreases smoothly to `0` on `[c, c + η]` and vanishes after it,
  `T₂ = c + η`; every hypothesis but `φ″ > 0` holds.
  Then `φ′(T₁) = 0` and the error bound is `(0.059 + 1/150)/T₁ < 1.25·10⁻⁴`, while
  `E₂ = −∫ φ′ Q`, an average of `Q` over `[c, c + η]`, tends to `Q(c)` as `η → 0`. `Q = N − M`
  jumps by the multiplicity, at least `1`, at `γ`, so the one-sided limits `Q(γ⁻)` and `Q(γ⁺)`
  differ by at least `1` and one of them has absolute value at least `1/2`: with `c` just below or
  just above `γ`, `|E₂|` is near `1/2` or more. The weight is concave where its drop begins. Below
  `168π`, in the source's own range, the same happens at `T₁ = 14`, `T₂ = 21` with the drop on
  `[20.5, 21]`: the bound is `0.00469` and `Q = 1 − M(t)` lies between `−0.470` and `−0.566` there.
- The kernel `4t(1 − t)` on `[0, 1]` (`m = 1`, Rosser–Schoenfeld's Theorem 2), carried to a compact
  interval of `(0, ∞)`, is continuous but not `C¹`: its derivative jumps from `0` to `4` and from
  `−4` to `0` at the two ends, so `t φ'` has finite variation and the kernel is in the class; a
  class "`C^m` with `m ≥ 2`" would exclude it, and `(4t(1 − t))²` too, which is `C¹` only.
- The kernel of Carneiro–Milinovich–Soundararajan vanishes at `a e^{±δ}` (where `cos(±π/2) = 0`)
  with one-sided derivatives of size `ϑ/(a e^{±δ})^{3/2}`: two corners, finite variation of `t φ'`,
  in the class. The indicator of `[a e^{−δ}, a e^{δ}]` is not in the class (it is not continuous):
  its transform decays only like `1/|s|`, and `∑_ρ 1/|ρ|` diverges.
- The sum `∑_{|γ| ≤ T} x^ρ/ρ` pairs `ρ` with `ρ̄`, so its value is real; read as `∑_{0 < γ ≤ T}`
  it would be complex and off by its conjugate half.

### 2.2 Bounds under the Riemann hypothesis: Lee–Nosal and Schoenfeld

Prove `leeNosal_of_riemannHypothesis`, the headline: under `RiemannHypothesis`, `ButheVerified`,
`LeeNosalRange`, `ZetaZeroReciprocalSum`, `ZetaZeroCountLowRange` and the three records `HiaryRecord`,
`PatelRecord` and `YangRecord` of ExplicitZetaBounds §0.4b (for the zero count above
`30 610 046 000`, below),
`|ψ(x) − x| ≤ √x log x (log x − log log x)/(8π)` for
every `x ≥ 101` (`lee-nosal-2026` Theorem 1.2, (2); J. Number Theory 283, arXiv 2312.05628, whose
v4 numbering is used here). Under the same hypotheses:

- `|ψ(x) − x| ≤ √x log x (log x/(8π) − (1/(2π) + 1.465/log x) log log x + 1.2325)` for `x ≥ 11`
  (`lee-nosal-2026` Theorem 1.1), which is the sharper of the two exactly when
  `log x > 30 369.58`;
- prove `leeNosal_theta_of_riemannHypothesis`: `|θ(x) − x| ≤ √x log x (log x − log log x)/(8π)`
  for `x ≥ 2657` (`lee-nosal-2026` Theorem 1.2, (3)), under the further hypothesis
  *PsiThetaUpper* `(a₁, a₂, X)` with `(a₁, a₂, X) = (1 + 1.93378·10⁻⁸, 1.04320, e⁴⁰)`, that is
  `ψ(x) − θ(x) < a₁ √x + a₂ x^{1/3}` for `x ≥ X` (the paper's (24), taken from
  Broadbent–Kadiri–Lumley–Ng–Wilk); it is the unconditional bound of §3.7, which discharges it
  there, and is a hypothesis here only to keep this layer below Layer 3. `Suggested.lean` writes
  it out in the statement.

Prove `schoenfeld_of_riemannHypothesis`: under `RiemannHypothesis`, `ButheVerified` and
`Schoenfeld1976Range`, Schoenfeld's bounds hold, kept for `π`, for the one-sided forms and for the
ranges below the thresholds `101` and `2657` (`schoenfeld-1976` lines 20–28, Theorem 10; lines
98–100, Corollary 1):

- `|ψ(x) − x| < √x log² x/(8π)` for `x > 73.2`, and `ψ(x) − x > −√x log² x/(8π)` for `x > 59`;
- `|θ(x) − x| < √x log² x/(8π)` for `x > 599`, and `θ(x) − x < √x log² x/(8π)` for `x > 0`;
- `|ψ(x) − x|, |θ(x) − x| < (1/8π) √x (log x − 2) log x` for `x > 23·10⁸`;
- `|π(x) − li x| < √x log x/(8π)` for `x > 2657`, and `π(x) − li x < √x log x/(8π)` for `x > 3/2`.
  No sharper bound for `π(x) − li x` under the Riemann hypothesis is stated here.

Route for Lee–Nosal (`lee-nosal-2026` §§3.1–3.2): for `x > 10¹⁹`, the bound of Theorem 1.1 by an
explicit form of Goldston's truncated explicit formula at height `√x/log x`, and the headline by
§2.1 with Rosser–Schoenfeld's kernel; the inputs are `Re ρ = 1/2`, the zero count in the form
`|N(T) − M(T)| ≤ min(0.28 log T, 0.10076 log T + 0.24460 log log T + 8.95844)` for `T ≥ 2π`,
`ZetaZeroReciprocalSum` (§1.1) for the zeros up to `10⁷`, the tail `∑_{γ ≥ T} 1/γ² < log T/(πT)`
(`T ≥ 2π`, a consequence of the same
zero count: Stieltjes integration against `dN` gives at most
`(log(T/2π) + 1)/(2πT) + (0.56 log T + 0.14)/T²`, below `log T/(πT)` for every `T ≥ 2π`), and the
weighted zero sums of §2.1; the `θ` bound adds
*PsiThetaUpper* through §0.3.
The zero count: its first branch is `ZetaZeroCountLowRange` for `2π ≤ T ≤ 10⁹` and Rosser's bound
`0.137 log T + 0.443 log log T + 1.588` of ExplicitZetaBounds §5.2 above, which is at most
`0.28 log T` exactly when `log T ≥ 20.455`, the difference `0.143 L − 0.443 log L − 1.588` being
increasing in `L = log T` for `L > 3.1`; its second branch is Bellotti–Wong's first bound of
ExplicitZetaBounds §5.2 with `7/8` added (`8.08344 + 0.875 = 8.95844`), which that section states
given `HiaryRecord`, `PatelRecord` and `YangRecord`, for `T ≥ 30 610 046 000`, and it is the
smaller branch only for `log T ≥ 55.46`, inside that range (at `L = 55.46` both branches are
`15.529`). The three records bound `|ζ|` on the lines `σ = 1/2`, `5/7` and `1` at heights at most
`200`; `RiemannHypothesis` does not imply them, so they are hypotheses of both Lee–Nosal bounds. The
paper's display (8) prints the second branch as `0.1038 log T + 0.2573 log log T + 9.3675`, which is
Hasanalizade–Shen–Wong's bound, stated by them against `(T/2π) log(T/2πe)` without the `7/8` and
printed with `9.3675` for `9.4925` (the correction recorded in ExplicitZetaBounds §5.2); the
branch used here is below that printed one at every
`T ≥ e` (their difference is `0.00304 log T + 0.0127 log log T + 0.409 > 0`), so every step of the
paper that uses the printed form goes through with it.
For `x ≤ 10¹⁹`, `ButheVerified` gives the `ψ` bounds from `x ≥ 337.09` and the `θ` bound from
`x ≥ 3381.6`, and `LeeNosalRange` covers `[101, 338]` and `[2657, 3382]`; the second `ψ` bound
follows from `ButheVerified` on all of `[11, 10¹⁹]`, its factor `log x (log x/(8π) − ⋯ + 1.2325)`
being increasing there from `1.569 > 0.94` (at `x = 11` directly: `|ψ(11) − 11| = 0.77`).

Route for Schoenfeld: for `x > 10¹⁹`, §2.1 with Rosser–Schoenfeld's kernel and `Re ρ = 1/2` for every zero; the
sum over zeros is bounded by `√x ∑_ρ 1/|ρ|` cut at `T = √x` with the explicit `∑ 1/γ` of §2.1 and
`gap:explicit-zero-count-error` (Schoenfeld's analysis, `schoenfeld-1976` lines 30–79, needs only
`x ≥ e¹⁶`); the passage to `π` is §0.4 with `li`. For `x ≤ 10¹⁹` the statements are unconditional
facts: `ButheVerified` gives the `ψ` bounds for `x ≥ 129.1` (where `0.94 ≤ log² x/(8π)`), the
two-sided `θ` bound for `x ≥ 1427`, the one-sided `θ` bound from `θ(x) < x`, the two-sided `π`
bound for `x ≥ 3834` and the one-sided one for `x ≥ 2` (`π(x) < li x`); `Schoenfeld1976Range`
gives (6.2) on `73.2 < x ≤ 1427`, (6.3) on `599 < x ≤ 1427`, (6.4) on `59 < x ≤ 1427` and (6.18)
on `2657 < x ≤ 5·10⁷`; for `3/2 < x < 2`, `π(x) = 0 < li x` (§0.3a, `li x > 0` for `x ≥ 3/2`).

*Needs:* §2.1, §0.3, §0.3a, §0.4; §1.1 (`ZetaZeroReciprocalSum`, `ZetaZeroCountLowRange`); Mathlib
`RiemannHypothesis`; ExplicitZetaBounds §5.2 (`gap:explicit-zero-count-error`: Rosser's and
Bellotti–Wong's bounds) and §0.4b (`HiaryRecord`, `PatelRecord`, `YangRecord`, for Bellotti–Wong's);
ExplicitZetaBounds §5.4; `ButheVerified`, `Schoenfeld1976Range`, `LeeNosalRange`.

### 2.3 Büthe's and Johnston's bounds under the Riemann hypothesis to a height

Prove `buthe_of_riemannHypothesisUpTo`: let `T` be real with `RH(T)`, and assume `ButheVerified` and
`Buthe2016Range`. For every `x` with `4.92 √(x/log x) ≤ T` (Büthe's criterion, `buthe-2016` lines
688–705, Theorem 2; `pnt-plus`, `ieantn`) the four bounds below hold. Prove
`johnston_of_riemannHypothesisUpTo`: under the same hypotheses together with
`RH(3 000 175 332 800)`, they hold for every `x` with `9.06 √(x/log x)/log log x ≤ T` (Johnston's
criterion, `johnston-2022` Theorem 3.2, Ramanujan J. 59, arXiv v2 numbering), the weaker condition
exactly for `x > 547.7`. The verified height `3·10¹²` is a hypothesis because Johnston's proof
starts its iteration from Büthe's range at that height, `x ≤ 2.169·10²⁵` (his Proposition 3.1); for
`T ≤ 3·10¹²` the theorem is its instance at `3·10¹²`. The four bounds:

- `|ψ(x) − x| ≤ √x log² x/(8π)` for `x > 59`;
- `|θ(x) − x| ≤ √x log² x/(8π)` for `x > 599`;
- `|π*(x) − li x| ≤ √x log x/(8π)` for `x ≥ 97`, where `π*(x) = ∑_{k ≥ 1} π(x^{1/k})/k` is Riemann's
  weighted count (the source states `x > 59`), and
  `|π(x) − li x| ≤ √x log x/(8π)` for `x > 2657`.

IEANTN (`ieantn`) states the `π*` bound from `59`, which fails on `(96.28…, 97)` (at `x = 96.9` the
left side is `1.917…` and the right side `1.791…`); the companion bound for `π` from `2657` is
unaffected.

Route (`buthe-2016` lines 709–873): prove for `x ≥ 5000` the sharper
`|ψ(x) − x| ≤ (√x/(8π)) log x (log x − 3)` and `|θ(x) − x| ≤ (√x/(8π)) log x (log x − 2)`. For
`x ≥ 10¹⁹` this is §2.1 with Büthe's kernel: the zeros up to height `c/ε ≤ 4.92 √(x/log x) ≤ T` lie
on the line by hypothesis, and the zeros above contribute, with a kernel of width tuned to `T`,
less than the margin these leave; the error terms are decreasing and below the margin only from
`x = 10¹⁹` on (lines 845–849). For `5000 ≤ x ≤ 10¹⁹` the two inequalities follow from
`ButheVerified`, since `0.94 ≤ log x (log x − 3)/(8π)` and `1.95 ≤ log x (log x − 2)/(8π)` there
(the right sides are `1.870` and `2.209` at `x = 5000` and increase) and `θ(x) < x`. The `π` bound
then follows from the `θ` bound
by the partial summation of §0.4 with `li` from `x₀ = 5000`, and the `π*` bound from the `ψ` bound
by the same partial summation for `π*(x) = ψ(x)/log x + ∫₂ˣ ψ(t)/(t log² t) dt`, the margins `3` and
`2` absorbing the boundary terms at `5000`; below `5000` the four inequalities are
`Buthe2016Range`. No bound for `π*(x) − π(x)` is used. Under Johnston's criterion the same argument
is iterated (`johnston-2022` §3): starting from Büthe's range at the height `3·10¹²`, the sharper intermediate
bound `|ψ(x) − x| < (√x/(8π)) log x (log x − 2.44)` is proved beyond it with the kernel width
`(log x)^{3/2} log log x/(E √x)` of the paper's (3.9), which enlarges the admissible range; the
passes lower the constant of the criterion from `9.65` to `9.06`. Büthe's method is used in later work in the form corrected in
`bhattacharjee-2024`; the formalisation of this route follows that corrected form.

Büthe's general theorem, the relative form of the same smoothing (`buthe-2016` lines 567–577,
Theorem 1; `pnt-plus`; with the term `e^{αε} − 1` in `E₁` that
`broadbent-kadiri-lumley-ng-wilk-2021` lines 1354–1369, Theorem 16, record as missing from an
earlier statement): let `0 < ε < 10⁻³`, `c ≥ 3`, `x₀ ≥ 100` and `α ∈ [0, 1)` with
`B₀ = ε e^{−ε} x₀ |ν_c(α)|/(2 (μ_c)₊(α)) > 1`, where `ν_c`, `μ_c` are the explicit functions of
Logan's kernel `ℓ_{c,ε}` of that paper. If `RH(c/ε)`, then `|ψ(x) − x| ≤ x e^{αε}(E₁ + E₂ + E₃)` for
every `x ≥ e^{αε} x₀`, with `E₁`, `E₂`, `E₃` the explicit expressions of that theorem, `E₃`
containing the finite sum `∑_{0 < γ ≤ c/ε} ℓ_{c,ε}(γ)/γ` over the zeros up to the height. It is the
theorem whose error function the rows `b ≤ 2000` of *BKLNWPsiTable* (§3.1) evaluate, at the height
`2 445 999 556 030`, which `RH(3·10¹²)` contains; no zero-free region and no density enters.

Büthe's own tables for that theorem (`buthe-2016` Theorem 1, Tables 1 and 2; `ieantn`), each row
`(b, T, δ₀)` conditional on `RH` at its own height `T`: the table propositions *Buthe2016Table1* and
*Buthe2016Table2* assert, for each row, that the error `e^{αε}(E₁ + E₂ + E₃)` of the theorem at the
row's parameters, with `c/ε ≤ T`, is at most `δ₀` for every `x ≥ e^b`; and the theorem gives, for
each row, that `RH(T)` and the row's proposition imply `|ψ(x) − x| ≤ δ₀ x` for every `x ≥ e^b`. The
rows of Table 1, with `T = 3.5·10⁹` at `b = 45` and `T = 3.061·10¹⁰` otherwise, are `(b, δ₀)` =
`(45, 1.11742·10⁻⁸)`, `(50, 1.16465·10⁻⁹)`, `(55, 2.88434·10⁻¹⁰)`, `(60, 2.08162·10⁻¹⁰)`,
`(65, 1.96865·10⁻¹⁰)`, `(70, 1.91910·10⁻¹⁰)`, `(80, 1.84848·10⁻¹⁰)`, `(90, 1.79330·10⁻¹⁰)`,
`(100, 1.75185·10⁻¹⁰)`, `(500, 1.47067·10⁻¹⁰)`, `(1000, 1.43770·10⁻¹⁰)` and `(3000, 1.41594·10⁻¹⁰)`;
those of Table 2, with `T = 8.5·10¹¹` at `b = 55` and `T = 2.445·10¹²` otherwise, are
`(55, 1.12494·10⁻¹⁰)`, `(60, 1.22147·10⁻¹¹)`, `(65, 3.57125·10⁻¹²)`, `(70, 2.79233·10⁻¹²)`,
`(75, 2.70358·10⁻¹²)`, `(80, 2.61079·10⁻¹²)`, `(90, 2.52129·10⁻¹²)`, `(100, 2.45229·10⁻¹²)`,
`(500, 1.99986·10⁻¹²)`, `(1000, 1.94751·10⁻¹²)`, `(2000, 1.92155·10⁻¹²)`, `(3000, 1.91298·10⁻¹²)`
and `(4000, 1.90866·10⁻¹²)`. Every height of Table 1 is at most `30 610 046 000` and every height of
Table 2 at most `3 000 175 332 800`, so `RH(30 610 046 000)`, respectively `RH(3 000 175 332 800)`
(§1.1), gives each row its hypothesis by antitonicity.

Instances (`johnston-2022` Corollary 3.3): under `RH(3 000 175 332 800)` the four bounds hold for
every `x ≤ 1.101·10²⁶` in their ranges; Büthe's criterion alone gives `x ≤ 2.169·10²⁵`.

Weaker bounds on a wider range (`johnston-2022` Theorem 4.1): for each row `(a, K)` of
*JohnstonTable*, under `RH(T)` and for every `x` with `K √(x/log³ x) ≤ T`,
`|ψ(x) − x| < a √x log² x` and `|θ(x) − x| < a √x log² x` for `x ≥ 3`, and
`|π*(x) − li x| < a √x log x` and `|π(x) − li x| < a √x log x` for `x ≥ 2`. With
`T = 3 000 175 332 800` the rows give the ranges `x ≤ 2.165·10³⁰` (`a = 1`), `2.738·10³²` (`a = 10`),
`3.360·10³⁴`, `4.004·10³⁶`, `4.723·10³⁸`, `5.522·10⁴⁰`, `6.404·10⁴²` and `7.375·10⁴⁴` (`a = 10⁷`).

Table proposition of this section: *JohnstonTable* (`johnston-2022` Table 2): for each row
`(a, K) ∈ {(1, 1.19), (10, 0.117), (10², 0.0116), (10³, 1.16·10⁻³), (10⁴, 1.16·10⁻⁴), (10⁵, 1.16·10⁻⁵), (10⁶, 1.16·10⁻⁶), (10⁷, 1.16·10⁻⁷)}`,
the explicit error terms of the iterated argument with the constant `a` in place of `1/(8π)` are
below the margin for every `x` with `K √(x/log³ x) ≤ T`, beyond the range already established.

*Needs:* §2.1, §1.1 (`RiemannHypothesisUpTo`), §0.3, §0.4; `ButheVerified`, `Buthe2016Range`;
`gap:explicit-zero-count-error`.

**Checks.**

- `π*(x) − π(x) ≥ π(√x)/2 > 0` for `x ≥ 4`, so the `π*` bound does not state the `π` bound, and the
  `π` bound is derived from the `θ` bound, not from the `π*` bound.

### 2.4 Consequences of Büthe's verified range

Under `ButheVerified` (§1.3):

- `ψ(x) ≤ x + 0.94 √x ≤ 1.03883 x` for `587 ≤ x ≤ 10¹⁹`, and `θ(x) < x` for `1 ≤ x ≤ 10¹⁹`;
- `0 < li x − π(x)` for `2 ≤ x ≤ 10¹⁹` (`pnt-plus`, `ieantn`), so `π(x) < li x` on that range;
  combined with §0.4, `π(x) < Li x + li 2` there;
- the Deléglise–Nicolas input `θ(x) < x` for `x ≤ 10¹⁹` (`deleglise-nicolas-2019-landau` line 370).

*Needs:* §1.3, §0.4.

**Checks.**

- The statement is on `[1, 10¹⁹]` only: `θ(x) < x` for all `x` is false (Littlewood), and the
  proposition does not assert it.

### 2.5 Short intervals under the Riemann hypothesis

- Schoenfeld's corollary (from §2.2): under `RiemannHypothesis`, for every `x > 599` the interval
  `(x − √x log² x/(4π), x]` contains a prime. With `A(y) = √y log² y/(8π)` and `h = 2A(x)`,
  `θ(x) − θ(x − h) > h − A(x) − A(x − h) ≥ h − 2A(x) = 0`: the first step uses the strict lower
  bound `|θ(x) − x| < A(x)` at `x > 599` and the strict one-sided bound `θ(y) − y < A(y)` at
  `y = x − h > 0`, the second that `A` increases on `y > 1` and `x − h > 1`.
- Dudek (`dudek-2015` lines 51–52, Theorem 2; `pnt-plus`): under `RiemannHypothesis`, for every
  `x ≥ 2` the interval `(x − (4/π) √x log x, x]` contains a prime. Route: a weighted explicit
  formula (§2.1 with a kernel supported in `[x − h, x]`), `∑_ρ 1/|ρ|² = 2 + γ − log 4π` (§2.1) and
  the explicit zero count; for `x ≤ 4·10¹⁸`, `PrimeGapLogSquareVerified` (with `p` the largest prime
  `≤ x`, the gap after `p ≥ 11` is below `log² p ≤ (4/π) √p log p`) and, below `11`, the primes up
  to `13`.
- Ramaré–Saouter (`ramare-saouter-2003`, cited by locator, as quoted at `dudek-2015` lines 47–48;
  `pnt-plus`): under `RiemannHypothesis`, `(x − (8/5) √x log x, x]` contains a prime for every
  `x ≥ 2`; a corollary of Dudek's theorem since `4/π < 8/5`.
- Carneiro–Milinovich–Soundararajan, the headline: prove `carneiro_milinovich_soundararajan`,
  that under `RiemannHypothesis` and `PrimeGapLogSquareVerified`, for every real `x ≥ 4` the interval
  `[x, x + (22/25) √x log x]` contains a prime (`carneiro-milinovich-soundararajan-2019` lines
  261–262, Theorem 5; `pnt-plus`); letting `x` decrease to a prime `p_n`, it gives
  `p_{n+1} − p_n ≤ (22/25) √p_n log p_n` for every prime `p_n > 3` (line 259). Route (lines
  1178–1199, 1367–1371): the Mellin-kernel explicit formula of their Lemma 7, the test function
  `H(x) = cos(2πx)/(1 − 16x²)` (line 167), the Brun–Titchmarsh inequality of §0.1 (with `B ≤ 4`, as
  the source uses it, lines 1367–1371) to control the prime powers and the edges of the smoothed
  interval, the zero count `|N(x) − M(x)| ≤ 0.15 log x + 3` for `x ≥ e` of their Lemma 9 (lines
  1309–1319) for the sum over the zeros, and `PrimeGapLogSquareVerified` for `4 ≤ x ≤ 4·10¹⁸`
  (lines 269–273), where `log² x ≤ (22/25) √x log x` because `log x/√x ≤ 2/e < 0.88`, and the range
  `[4, 11)` from the primes `5, 7, 11`. The paper derives Lemma 9 from Trudgian's bound against `M(T)`
  with the `7/8`, which no supplier states (§3.1); it follows as well from Rosser's bound of
  ExplicitZetaBounds §5.2, valid for `T ≥ 2`, since `0.137 ≤ 0.15` and
  `0.443 log log x ≤ 0.013 log x + 1.412` for every `x ≥ e` (the left side less the right is at most
  `1.120 − 1.412 = −0.292`, at `log x = 34.08`).

*Needs:* §0.1 (`brun_titchmarsh`); §2.1, §2.2, §1.4 (`PrimeGapLogSquareVerified`); Mathlib
`RiemannHypothesis`; ExplicitZetaBounds §5.2 (`gap:explicit-zero-count-error`, Rosser's bound).

**Checks.**

- The three constants are ordered `22/25 = 0.88 < 4/π = 1.273 < 8/5 = 1.6`; the first interval lies
  above `x` and the other two below, so none contains another, but the gap form of the first
  implies the other two for `x ≥ 5`: with `p` the largest prime `≤ x` and `p⁺` the next,
  `x − p < p⁺ − p ≤ (22/25) √p log p < (4/π) √x log x`.

### 2.6 The extremal-kernel bound from the zeros up to a height *(preprint)*

The general theorem in `T` (`chirre-helfgott-2025` Corollary 1.2, *(preprint)*; `pnt-plus`,
`ieantn`): let `T ≥ 10⁷` with `RH(T)`, and put `C_T = (1/2π) log²(T/2π) − (1/6π) log(T/2π)`. For
every `x > max(T, 10⁹)`,

- `|ψ(x) − x (π/T) coth(π/T)| ≤ (π/(T − 1)) x + C_T √x`, and hence, since
  `1 ≤ (π/T) coth(π/T) ≤ 1 + π²/(3T²)`, `|ψ(x) − x| ≤ (π/(T − 1) + π²/(3T²)) x + C_T √x`;
- `|∑_{n ≤ x} Λ(n)/n − log x + γ| ≤ π/(T − 1) + C_T/√x`.

No zero-free region and no zero density enter: the zeros above `T` are not used at all, and the
relative error `π/T` is the price of ignoring them.

Instance (`chirre-helfgott-2025` Corollary 1.3, *(preprint)*; `pnt-plus`, `ieantn`): under
`RH(3 000 175 332 800)`, for every `x ≥ 1`, `|ψ(x) − x| ≤ (π/(3·10¹²)) x + 113.67 √x`. Route: the
general theorem at `T = 3·10¹² + 1 + π/3`, for which `π/(T − 1) + π²/(3T²) ≤ π/(3·10¹²)` and
`C_T ≤ 113.67`, gives `x > T`; on `11 < x ≤ 10¹⁹`, `ButheVerified` (`0.94 ≤ 113.67`); for `x ≤ 11`,
`|ψ(x) − x| ≤ x ≤ 113.67 √x`. The matching instance for `∑ Λ(n)/n` is in §4.2. This instance
sharpens the refereed bounds of §§2.3 and 3.7 between `10²⁶` and `e^{2394}`, and is stated beside
them, not in their place.

Route of the general theorem (`chirre-helfgott-2025` §§2–9): for a Dirichlet series
`A(s) = ∑ aₙ n^{−s}` with `aₙ ≥ 0`, meromorphic, with known poles and residues in `|Im s| ≤ T` and
bounded on a ladder of horizontal and vertical segments, the sum `∑_{n ≤ x} aₙ n^{−σ}` is bracketed
by two weighted sums whose weights have Fourier transforms supported in `[−T, T]`, built from the
Graham–Vaaler extremal majorant and minorant of a one-sided exponential; contour shifting turns
each weighted sum into a sum over the poles in `|Im s| ≤ T`. At `aₙ = Λ(n)`, `A = −ζ'/ζ`, the poles
are `1`, the trivial zeros and the zeros with `|γ| ≤ T`, on the line by `RH(T)`; their contribution
is at most `C_T √x` by the bound `N(T) ≤ (T/2π) log(T/2π)` for `T ≥ 2π`, and the bound on the
ladder uses the zero count in windows `[T − 3/4, T]`. That bound comes from Rosser's bound of
ExplicitZetaBounds §5.2 for `T ≥ 22` (where `T/2π ≥ 0.137 log T + 0.443 log log T + 2.463`) and from
`ZetaZeroCountLowRange` below `10⁹`, which gives `N(T) = 0` for `T < 10` (there
`M(T) + 0.28 log T < 0.67`) and `N(T) ≤ M(T) + 0.28 log T ≤ (T/2π) log(T/2π)` for `T ≥ 10` (the second
inequality is `T/2π ≥ 7/8 + 0.28 log T`, true from `T = 9.6`).

The general statements of that route are targets of this section (`chirre-helfgott-2025`
Propositions 2.3–2.4, Lemma 5.1 and Proposition 5.2, *(preprint)*; `pnt-plus`, `ieantn`). Write
`e(u) = e^{2πiu}` and `𝓕φ(y) = ∫ φ(t) e(−yt) dt` (Mathlib's Fourier transform `𝓕` on `ℝ`,
`Real.fourier_real_eq`); let `T > 0`, `β > 1`, `a_n` complex with `∑_{n ≥ 2} |a_n|/(n log^β n) < ∞`,
and `G(s) = ∑ a_n n^{−s} − 1/(s − 1)` on `Re s > 1`, extended continuously to
`{Re s ≥ 1, |Im s| ≤ T}`; call `φ` *admissible* if it is integrable, vanishes outside `[−1, 1]`, is
continuous at `0` and has `|𝓕φ(y)| ≤ C |y|^{−β}` for `y ≠ 0`.

- The Fourier identity: for admissible `φ` and every `x > 0`,
  `(1/2π) ∑_{n ≥ 1} a_n (x/n) 𝓕φ((T/2π) log(n/x)) = (1/2πT) ∫_{−T}^{T} φ(t/T) G(1 + it) x^{1+it} dt + (φ(0) − ∫_{−∞}^{−T log x/2π} 𝓕φ(y) dy) x/T`.
  Route: on `Re s = σ > 1` the same identity holds by Fubini, with the boundary term
  `(x^{2−σ}/2πT) ∫_{u ≥ −log x} e^{−u(σ−1)} 𝓕[φ(·/T)](u/2π) du`; then `σ → 1⁺` by dominated
  convergence, the decay of `𝓕φ` and the summability of `a_n` dominating the sum.
- The bracketing theorem: for real `σ ≠ 1` put `S_σ(x) = ∑_{n ≤ x} a_n n^{−σ}` if `σ < 1` and
  `S_σ(x) = ∑_{n ≥ x} a_n n^{−σ}` if `σ > 1`, the term `n = x` counted in both; put
  `λ = 2π(σ − 1)/T` and `I_λ(u) = e^{−λu}` for `λu ≥ 0`, `0` otherwise (so `I_λ(0) = 1`). Then
  `S_σ(x) = x^{−σ} ∑_n a_n (x/n) I_λ((T/2π) log(n/x))`; and if `a_n ≥ 0` and `φ₊`, `φ₋` are admissible
  with `Re 𝓕φ₋ ≤ I_λ ≤ Re 𝓕φ₊` on `ℝ`, then for every `x ≥ 1`
  `S_σ(x) ≤ Re((2π x^{1−σ}/T) φ₊(0)) + (x^{−σ}/T) Re ∫_{−T}^{T} φ₊(t/T) G(1 + it) x^{1+it} dt − 1_{σ<1}/(1 − σ)`,
  and `S_σ(x)` is at least the same expression with `φ₋`. Route: the rewriting of `S_σ`, positivity
  of `a_n` against the pointwise comparison, and the Fourier identity for the `a_n` themselves,
  whose tail term `∫_{−∞}^{−T log x/2π} 𝓕φ_±` is compared with the integral of `I_λ` (the source of
  the term `1_{σ<1}/(1 − σ)`). The admissible pair is that of ExplicitZetaBounds §6.3a at
  `ν = |λ|` (its `φ^±_ν`, with `𝓕φ^±_ν = F^±_ν`), reflected by `t ↦ −t` when `λ < 0`, since then
  `I_λ(u) = I_{|λ|}(−u)`; its `L¹` errors are the main error term.
- The ladder contour shift: let `0 < δ < T/4`, `σ_n ≤ 1` real with `σ₀ = 1` and `σ_n → −∞`,
  `R = {Re s ≤ 1, |Im s| ≤ T}`, `R_δ = {Re s ≤ 1, |Im s| ≤ δ}`, the ladder
  `L = ⋃_{n ≥ 1} {Re s = σ_n, |Im s| ≤ T}`, `C` the path from `1` up to `1 + iδ` and then left along
  `Im s = δ`, and `∫_{C_∞} = ∫_{(−∞, 1] + iT} − ∫_{(−∞, 1] − iT}`. Let `G = G° + sgn(Im s) G*` with
  `G°`, `G*` meromorphic near `R`, `G°(s̄) = conj G°(s)` and `G*(s̄) = −conj G*(s)`, and `x₀ ≥ 1` with
  `G x₀^s` bounded and free of poles on the boundary of `R`, and `G° x₀^s`, `G* x₀^s` bounded and free
  of poles on `L` and on `C`; suppose that `G x^s` has finitely many poles in `R ∖ R_δ`, all simple.
  Then for every `x > x₀`,
  `(1/2πi) ∫_{1−iT}^{1+iT} G(s) x^s ds = (1/2πi) ∫_{C_∞} G x^s ds + (1/π) Im ∫_C G* x^s ds + ∑_{R∖R_δ} Res G x^s + ∑_{R_δ} Res G° x^s`,
  the last sum being the limit of its truncations to `Re s > σ_n`. Route: the residue theorem
  (Tau Ceti's `TauCeti.Contour.Cycle.classicalResidueTheorem_nullHomologous`) on the rectangles cut
  off by the rungs `Re s = σ_n` above and below `C`; the symmetry of `G*` makes the two integrals
  along `C` and its conjugate combine to `2i Im ∫_C G* x^s`; the rungs vanish in the limit by the
  bound on `L` and `x > x₀`, and the horizontal sides converge to `∫_{C_∞}`.
- Its specialisation to the extremal weights: with `z(s) = (s − 1)/(iT)`, `λ > 0`, the functions
  `Φ^{±,∘}_λ`, `Φ^{±,⋆}_λ` of ExplicitZetaBounds §6.3a and
  `Φ(z) = Φ^{±,∘}_λ(z) + sgn(Re z) Φ^{±,⋆}_λ(z)`, and `F` meromorphic near `R` with
  `F(s̄) = conj F(s)` and `F x₀^s`, `z(s) F x₀^s` bounded and free of poles on the boundary of `R`, on
  `C` and on `L`: for `x > x₀`, the integral `(1/2πi) ∫_{1−iT}^{1+iT} Φ(z(s)) F(s) x^s ds` differs from
  `∑_{R∖R_δ} Res Φ(z) F x^s + ∑_{R_δ} Res Φ^{±,∘}_λ(z) F x^s` by at most
  `(1/2πT) ∑_{ξ = ±1} ∫₀^∞ t |F(1 − t + iξT)| x^{1−t} dt + (1/π) |∫_C Φ^{±,⋆}_λ(z(s)) F(s) x^s ds|`.
  Route: the shift above with `G° = Φ^{±,∘}_λ(z) F` and `G* = Φ^{±,⋆}_λ(z) F`, since
  `Re z(s) = Im s/T`. On `C_∞`, where `s = 1 − t ± iT` and `z = ±1 + it/T`, the periodicity
  `coth(w/2 ± πi) = coth(w/2)` reduces `Φ(z)` to `±(B^±(λ + 2πt/T) − B^±(λ))/(2πi)`, and `B^±` is
  monotone with slope between `−1` and `1` on `ℝ` (`B⁺(u) = u/(1 − e^{−u})`, `B⁻(u) = u/(e^u − 1)`),
  so `|Φ(z)| ≤ t/T` there, which gives the first term; the second is the integral along `C` left
  over by the shift. At `F = −ζ′/ζ` and `a_n = Λ(n)` the residues are those at the zeros with
  `|γ| ≤ T` and at the trivial zeros, which give the general theorem above.

*Needs:* §1.1 (`ZetaZeroCountLowRange`); §2.1 (the zero sums); Mathlib `riemannZeta`, `mellin`,
`Real.fourier_real_eq`; Tau Ceti `TauCeti.Contour.Cycle.classicalResidueTheorem_nullHomologous`;
ExplicitZetaBounds §5.2 (`gap:explicit-zero-count-error`) and §6.3a (the extremal approximants and
the bounds for `(z coth z)′`); `gap:rh-up-to-height`.

**Checks.**

- `(π/T) coth(π/T) − 1 ≤ π²/(3T²) = 3.3·10⁻¹⁴` already at `T = 10⁷`: the factor is a formality for
  the heights in use, but without it the statement at small `T` is false by that amount.
- The hypothesis `RH(T)` cannot be dropped: one zero `ρ = β + iγ` off the line with `|γ| ≤ T`
  contributes a term of size `x^β/|ρ|` with `β > 1/2`, which is not `O(√x)`.

### Examples

- Büthe's range `x ≤ 2.169·10²⁵` and Johnston's `x ≤ 1.101·10²⁶` from `RH(3·10¹²)`.
- Under the Riemann hypothesis, a prime in `(x − √x log² x/(4π), x]` for every `x > 599` (§2.5).
- Lee–Nosal's bound is Schoenfeld's with `log x` replaced by `log x − log log x` in one factor.

### Dependencies

ZerosOfLFunctions §§4.1, 4.5, 5.6, 8.4; Mathlib `RiemannHypothesis`, `mellin`; Layers 0 (§0.1 for
§§2.1 and 2.5) and 1; ExplicitZetaBounds §5.4 (the weighted sums over ordinates) and §§3.4, 6.1
and 7.2 (for the truncated explicit formula of §2.1); the gaps `rh-up-to-height`,
`classical-zero-free-constants`, `vinogradov-korobov-constants`, `explicit-zero-count-error`. No
later layer is used; the hypothesis
*PsiThetaUpper* of §§2.1–2.2 is a statement about Layer 0 objects, discharged in §3.7 by a route
that does not use §2.1.

## Layer 3: unconditional bounds for ψ, θ and π

Every instance in §§3.2–3.8 is proved by one route, called the *standard route* below: for
`x ≤ 10¹⁹` the inequality follows from `ButheVerified` (§1.3) by §0.3 and §0.4, except on an
initial segment covered by the paper's own finite-range proposition; for `x > 10¹⁹` it follows
from the general scheme of §3.1, that is from (c) or (d), or from one of the density-free cases
(a), (b) when the source uses no density bound, or from Büthe's theorem of §2.3, at the parameters
of the paper's table proposition, under the height `RH(H)` and the zero-free region the paper used.
The hypotheses of each instance are therefore: the named `RH(H)`, the region
(`gap:classical-zero-free-constants`, or the region a section names), the zero-counting error
(`gap:explicit-zero-count-error`), the zero density the source uses (`gap:explicit-zero-density`
where the supplier states it at the source's height, a zero input of this roadmap otherwise), for
(d) the truncated explicit formula the source uses (§2.1, or a zero input), the paper's table
proposition, `ButheVerified`, and the paper's finite-range proposition.

### 3.1 The general scheme

The general theorems are (c) and (d): a zero-free region, a verified height, an explicit zero
count and a zero density give `|ψ(x) − x| ≤ ε x` on a stated range with `ε` an explicit function of
all four, (c) through the smoothed explicit formula of §2.1 and (d), Pintz's form, through the
truncated explicit formula of §2.1. The two other shapes are density-free cases of (c), proved by
the same smoothed explicit formula with the density hypothesis dropped: (b) bounds every zero above
the verified height through the region alone, which is (c)'s argument with the trivial count
`N(σ, T) ≤ N(T)` in place of a density bound, and (a) is (b) with only the height `14` verified.
They are stated separately because their error functions have closed forms that the older
instances evaluate. The `θ` and `π` forms follow by §0.5.

- (a) *Region only* (`dusart-2016` lines 74–80, Theorem 1.1): prove `dusart_of_zeroFreeRegion`.
  Let `R > 0`, and suppose that `ζ` has no zero with `|t| ≥ 2π` and `σ ≥ 1 − 1/(R log |t|)`
  (`ClassicalZeroFreeRegion R (2π)`, the predicate of ExplicitZetaBounds §7.3a; the classical-shape
  region with constant `R` implies it) and
  no zero in the critical strip with `|t| ≤ 14` (the low-height verification named in
  `gap:rh-up-to-height`), and suppose `ZetaZeroCubeSum` (§1.1), the bound for the sum of `1/γ³`
  over the zeros that the source's Lemma 3.4 takes from Rosser (`dusart-2016` line 460). Put
  `X = √(log x/R)` and `ε_R(x) = √(8/π) X^{1/2} e^{−X}`. Then
  `max(|θ(x) − x|, |ψ(x) − x|) < x ε_R(x)` whenever `X ≥ max(8.36, 8/R)`. The statement at
  `dusart-2016` line 79 prints `8R`; the proof needs `X ≥ 8/R`, which is the inequality
  `e^{4X}/√x ≤ 1` of the source's Lemma 3.4 (lines 471 and 531), and the source's Corollary 1.2
  applies the theorem with `R = 5.69693` from `log x = 400` on (lines 576–580), where `8R` would ask
  `log x ≥ 11 833`. Route: Rosser–Schoenfeld's
  decomposition of `∑_ρ x^ρ/ρ` into the four sums `S₁, …, S₄` (`dusart-2016` lines 104–145), the
  region bounding `|x^ρ|` by `x exp(−log x/(R log γ))`, the zero count of
  `gap:explicit-zero-count-error` (Rosser's, lines 146–151) and the weighted sums over ordinates of
  §2.1. The low height enters through the source's Lemma 2.2 (lines
  188–194), which needs a height `T₀ > 2π` with `N(T₀) = M(T₀)` and no zero off the line below it:
  `T₀ = 9.6769…`, where `M(T₀) = 0 = N(T₀)`; the sums `S₁ + S₂` over all the zeros, taken with
  `T₁ = 0`, are bounded through `ZetaZeroCubeSum` (lines 451–464).
- (b) *Region, verified height and zero count* (`dusart-1999-mc` lines 61–99, Theorem 1, which is
  Theorem 4 of `rosser-schoenfeld-1975`, lines 713–720, with its Lemma 9 in Schoenfeld's form for a
  general `D`, `schoenfeld-1976` lines 517–544). Let `A > 0` with `RH(A)` and `N(A) = M(A)` (the
  boundary term `−R(A) φ_m(A)` of `Ω₂` rests on this equality: `rosser-schoenfeld-1975` line 548,
  `dusart-1998-thesis` lines 664 and 705), `R > 0` with the Rosser–Schoenfeld-shape region, and
  `R(T) = a₁ log T + a₂ log log T + a₃` with `|N(T) − M(T)| ≤ R(T)` for `T ≥ 2`; let `2 < D < A`,
  `g ≥ 4πG(D)` and `c ≤ C(D)`, where `C(D) = 4π(0.137 + 0.443/log D)` and `G(D)` is Schoenfeld's
  explicit function (8.5) of `D`, of `N(D)` and of the sum of `1/|ρ|` over the zeros with
  `0 < γ < D`. For `b > 1/2`, an integer `m ≥ 1` and `0 < δ < (1 − e^{−b})/m` with
  `T₁ = T₁(m, δ) ≥ D` (line 75), the quantity
  `ε(b, m, δ) = Ω₁ e^{−b/2} + Ω₂ δ^{−m} + mδ/2 + e^{−b} log 2π` of lines 71–97, where
  `Ω₁ = ((2 + mδ)/4π)((log(T₁/2π) + 1/m)² + g + 1/m² − c m/((m + 1) T₁))` and `Ω₂` depends on
  `(m, δ, A, R, R(·))` through the kernels
  `K_ν(z, x) = (1/2) ∫ₓ^∞ t^{ν−1} exp(−(z/2)(t + 1/t)) dt`, satisfies `|ψ(x) − x| < ε x` for all
  `x ≥ e^b`. Dusart's display is the case `D = 158.84998`, `(g, c) = (0.038207, 2.82)`, the values
  that *RosserSchoenfeldLowZeros* (§1.1) gives through Schoenfeld's (8.5). Rosser–Schoenfeld's
  Theorem 2 (lines 530–535)
  is the same scheme at `m = 1` with their split heights `T₁ = T₂ = 0`, the low zeros entering
  through the bound (3.21), which lines 537–539 quote from `rosser-1941` (Lemma 17), instead of
  Lemma 9;
  it gives for `log x ≥ 105` the closed forms (3.19)–(3.20), the second with leading constant
  `0.110123`, the factor `(log x)^{3/8} exp(−√(log x/R))` and `R = 9.645908801`.
- (c) *A zero density, through the smoothed explicit formula* (`faber-kadiri-2018-corrigendum`
  lines 20–45, Theorem 0.1). Let `H` with `RH(H)`; `T₀ > 0` and `s₀ ≥ ∑_{0 < γ ≤ T₀} 1/γ`
  (lines 22–23; `faber-kadiri-2015` lines 365–366); `T₁` with `T₀ ≤ T₁ ≤ H` (line 24, the rows
  taking `T₁ = T₀` and `faber-kadiri-2015` line 716 allowing `T₁ = H`); `R₀ ≥ 1` with the
  classical-shape region (lines 25–27); `R(T)` as in (b); `3/5 ≤ σ₀ < 1` and `c₁, c₂, c₃` with
  `N(σ₀, T) ≤ c₁ T + c₂ log T + c₃` for `T ≥ H`; `δ > 0`, an integer `m ≥ 2`, and `b₀ > 0` with
  `b₀ < m R₀ (log H)²`. Then `|ψ(x) − x| ≤ ε₀ x` for `x ≥ e^{b₀}`, with
  `ε₀ = max(ε(b₀, 1, 1 + δ, m, σ₀, T₁), ε(b₀, 1 − δ, 1, m, σ₀, T₁))` and `ε` the explicit function of
  the corrigendum's display (3.9), which depends also on `(H, T₀, s₀, R₀, R(·), c₁, c₂, c₃)`: `s₀`
  enters through `B₁(T₁) = s₀ + …` (`faber-kadiri-2015` line 470), in the term of order `x^{−1/2}`.
  The density enters at the single abscissa
  `σ₀` of the row, with constants `c₁, c₂, c₃` belonging to that `σ₀`: a bound at a smaller abscissa
  bounds `N(σ₀, T)` too, but with its own, larger constants, which is a different row.
- (d) *Pintz's form: the truncated explicit formula, a region and a density*
  (`platt-trudgian-2021-error` lines 58–62, Theorem 1, with its §3 from line 142;
  `johnston-yang-2023` lines 277–537, §§3.2–3.3; `broadbent-kadiri-lumley-ng-wilk-2021` lines
  1201–1267, Theorem 13; `fiori-kadiri-swidinsky-2023-psi` Theorems 1.1–1.2; `pnt-plus`, `ieantn`).
  Let `H ≥ 4πe` with `RH(H)`; let `ν > 0` on `[H, ∞)` be such that `ζ` has no zero with `|γ| ≥ H`
  and `β ≥ 1 − ν(|γ|)` (the classical shape `ν(t) = 1/(R₀ log t)`, the region `ν₂` of §3.4, or the
  Vinogradov–Korobov shape of `gap:vinogradov-korobov-constants`); let `1/2 < σ < 1` and `D`
  continuous and nondecreasing with `N°(σ, t) ≤ D(t)` for `t ≥ H`; and let `x`, `T` satisfy a
  truncated explicit formula with relative error `ε₁`, that is
  `|ψ(x) − x + ∑_{|γ| ≤ T*} x^ρ/ρ| ≤ ε₁ x` for some `T* ≤ T` (`T* = T` in the forms of §2.1). Then
  `|ψ(x) − x| ≤ (s₁ + s₂ + ε₁) x`. Here, for `T > H`,
  `s₁ = x^{−1/2} (1/2π) log²(H/2π) + x^{σ−1}((1/2π)(log²(T/2π) − log²(H/2π)) + 1.8642)` bounds the
  zeros with `β ≤ σ`, by the two-sided bound for `∑_{0 < γ ≤ T} 1/γ` of `johnston-yang-2023` lines
  189–203 (Lemma 2.5, `T ≥ 4πe`), and `s₂` bounds the zeros with `β > σ`, that is
  `2 ∫_H^T x^{−ν(t)} t^{−1} dN°(σ, t)`, by Stieltjes integration against `D` over a partition of
  `[H, T]`, in one of the published forms: Johnston–Yang's (3.6), with the points
  `t_k = exp((1 + k/K) √(log x/R₀))`, `0 ≤ k ≤ K` (lines 351–396; Platt–Trudgian's is a form of the
  case `K = 1`, lines 446–452); Broadbent–Kadiri–Lumley–Ng–Wilk's (A.14), with a geometric partition
  of ratio `λ > 1` (lines 1234–1257); or, when `T ≤ min_{t ≥ H} t x^{ν(t)}`, the single term
  `2 D(T)/T` (`johnston-yang-2023` lines 458–494). For `T ≤ H`, `s₂ = 0` and
  `s₁ = x^{−1/2} (1/2π) log²(T/2π)`. With `ν` of the classical shape and `T = exp(2 √(log x/R₀))`
  every term is at most a function of the shape `A (log x/R₀)^B exp(−C √(log x/R₀))` on `log x ≥ X`
  (`johnston-yang-2023` (3.9)–(3.12), lines 401–440); a row `(X, A, B, C)` asserts that
  `s₁ + s₂ + ε₁ ≤ A (log x/R₀)^B exp(−C √(log x/R₀))` for every `log x ≥ X`, at the row's
  parameters. The density is what moves the exponent constant: the density-free shapes (a), (b) give
  `C = 1`, the Platt–Trudgian and Johnston–Yang rows `C = 1.89`–`1.95`, and Fiori–Kadiri–Swidinsky's
  refinement of (d), which splits the zeros above `H` into further strips in `σ` to treat those
  close to the `1`-line separately, `C = 2`.
- The density integration and the published forms of (d). The density is the predicate
  *ZetaZeroDensityBound* `T₀ S c₁ c₂ p q` of ExplicitZetaBounds §8.3a with `T₀ ≥ 2`; `R` is the
  constant of the classical-shape region, `H₀` a verified height (`RH(H₀)`), and
  `H_σ = max(H₀, exp(1/(R(1 − σ))))`, so that no zero with `β ≥ σ > 1/2` has `γ < H_σ`, and
  `H_σ = H₀` when `σ < 1 − 1/(R log H₀)` (`fiori-kadiri-swidinsky-2023-psi` (3.13) and Remark 3.7).
  `Γ(s, y) = ∫_y^∞ e^{−t} t^{s−1} dt` is the upper incomplete gamma function:
  `Γ(3, y) = (y² + 2y + 2) e^{−y}` for `y ≥ 0`, and `Γ(s, y) ∼ y^{s−1} e^{−y}` as `y → ∞` for `s > 1`
  (integration by parts; their Remark 2.6). With `Σ_a^b = 2 ∑_{a ≤ β < b, 0 < γ < T} x^{β−1}/γ`:
  - Density integration (their Lemma 2.5 and Remark 2.6; `pnt-plus`): for `σ ∈ S` with `p(σ) < 1`
    (at `p(σ) = 8(1 − σ)/3`, `σ > 5/8`) and `T₀ ≤ U < V`,
    `∑_{σ < β < 1, U ≤ γ < V} 1/γ ≤ B₀(σ, U, V)` with
    `B₀ = c₁(σ) (log V)^{q(σ)} V^{p(σ)−1} + c₂(σ) log² V/V + c₁(σ) (1 − p(σ))^{−q(σ)−1} (Γ(q(σ) + 1, (1 − p(σ)) log U) − Γ(q(σ) + 1, (1 − p(σ)) log V)) + c₂(σ) (Γ(3, log U) − Γ(3, log V))`.
    Route: Stieltjes integration of `1/t` against `N°(σ, ·)` on `[U, V)`, the density at `V` for the
    boundary term and under the integral, and `t = eᵘ`.
  - The low zeros (their Proposition 3.6; `pnt-plus`): for `1/2 < σ₁ < 1` and `T ≥ max(T₀, H₀)`,
    under *FioriKadiriSwidinskyZeroSums* at `(T₀, S₀)` and the bound `B₁` of §2.1,
    `Σ_0^{σ₁} ≤ ε₂ = 2 x^{−1/2} (S₀ + B₁(T₀, T)) + (x^{σ₁−1} − x^{−1/2}) B₁(H₀, T)`.
  - The strips (their Proposition 3.8 and Corollary 3.10; `pnt-plus`): for `5/8 ≤ σ₁ < σ₂ ≤ 1` with
    `[σ₁, σ₂] ⊆ S`, `p < 1` on `[σ₁, σ₂)`, `H₀ ≥ T₀`, `T ≥ H₀` and `N ≥ 2`, with
    `σ^{(n)} = σ₁ + (σ₂ − σ₁) n/N`,
    `Σ_{σ₁}^{σ₂} ≤ ε₃ = 2 x^{−(1−σ₁) + (σ₂−σ₁)/N} B₀(σ₁, H_{σ₁}, T) + 2 x^{−(1−σ₁)} (1 − x^{−(σ₂−σ₁)/N}) ∑_{n=1}^{N−1} B₀(σ^{(n)}, H_{σ^{(n)}}, T) x^{(σ₂−σ₁)(n+1)/N}`;
    and at their density *FioriKadiriSwidinskyDensity* (§3.4), `H₀ = 3·10¹²` and `R = 5.5666305`,
    `Σ_{σ₁}^{σ₂} ≤ 0.00125994 x^{σ₂−1}` for `0.9 ≤ σ₁ < σ₂ ≤ 1`.
  - The zeros near the `1`-line (their Propositions 3.11, 3.14 and Corollary 3.12; `pnt-plus`): for
    `K ≥ 2`, `σ₂ ∈ S ∩ (5/8, 1]`, `t₀ = max(H_{σ₂}, exp √(log x/R)) < t₁ < ⋯ < t_K = T`, every zero
    counted in `Σ_{σ₂}^1` has `x^{β−1} ≤ x^{−1/(R log γ)}`, and
    `Σ_{σ₂}^{1} ≤ 2 ∑_{k=1}^{K−1} N°(σ₂, t_k) (x^{−1/(R log t_{k−1})}/t_{k−1} − x^{−1/(R log t_k)}/t_k) + 2 N°(σ₂, T) x^{−1/(R log t_{K−1})}/t_{K−1}`
    (and the one-term form `2 N°(σ₂, T) x^{−1/(R log t₀)}/t₀`); at `t_k = t₀ (T/t₀)^{k/K}` with the
    density in place of `N°` this is their `ε₄`; and with `T = t₀^c`, `c > 1`,
    `σ₂ = 1 − 2/(R log t₀)` and `t₀ = exp √(log x/R)`, `ε₄ ∼ C (log t₀)^{3 + 4/(R log t₀)}/t₀²` as
    `x → ∞`, with `C = 2 c₁ e^{16 w₁/(3R)} w₁³` and `w₁ = 1 + (c − 1)/K`, where `c₁` is the constant
    of a density bound `N°(σ, T) ≤ c₁ T^{8(1−σ)/3} (log T)^{5−2σ} + c₂ log² T` valid for every `σ`
    of an interval `[σ₁, 1]` and every `T ≥ T₀` (their Proposition 3.14; `pnt-plus`); and `ε₄` and
    `ε₄ t₀²/log³ t₀` are decreasing for `x > exp(R e²)`. Route for the constant: `log x = R log² t₀`
    gives `x^{−1/(R log t₀)}/t₀ = t₀^{−2}` and `x^{−1/(R log t_k)}/t_k = t₀^{−2−(w_k−1)²/w_k}` with
    `w_k = 1 + k(c − 1)/K`, so the last term of `ε₄`, `2 Ñ(σ₂, t₁)/t₀²` with `t₁ = t₀^{w₁}`,
    dominates; and in it `t₁^{8(1−σ₂)/3} = e^{16 w₁/(3R)}` and
    `(log t₁)^{5−2σ₂} = (w₁ log t₀)^{3 + 4/(R log t₀)}`, the factor `w₁^{4/(R log t₀)}` tending to
    `1` and the `c₂` term being smaller by `(log t₀)⁻¹`. At their parameters (`c = 4`, `K = 10⁵`,
    `c₁ = 17.4194`) it is `C = 90.82…` (their Remark 3.15).
  - Fiori–Kadiri–Swidinsky's form of (d) (their Theorem 1.1; `pnt-plus`): for `σ₂ ∈ (0.9, 1)`,
    `c ∈ [2, 30]` and `N, K ≥ 1`, at every `x` with `log x > 1000`,
    `t₀ = max(H_{σ₂}, exp √(log x/R))` and `T = t₀^c` with `T ≤ x`,
    `|ψ(x) − x| ≤ (ε₁ + ε₂ + ε₃ + ε₄) x`, where `ε₁ = 2 log² x/T` is the error of
    *DudekExplicitFormula* (§2.1) in its form for real `x ≥ e¹⁰⁰⁰` and `50 < T ≤ x` (their
    Proposition 3.4 takes it for `x > e⁵⁰` and `3 log x < T < √x/3`, inside the Dudek shape of
    §2.1), and `ε₂` at `σ₁ = 0.9`, `ε₃` on `[0.9, σ₂]` and `ε₄` on `[σ₂, 1]` are the bounds above at
    `x` and `T`. The rows of *FioriKadiriSwidinskyPsiRow* evaluate the sum at the start `x₀` of each
    row, on whose range the source shows it nonincreasing in `x`.
  - The same, uniform in `x` (their Theorem 1.1 as stated, with (4.1); `pnt-plus`): for every `x₀`
    with `log x₀ > 1000`, every `σ₂ ∈ (0.9, 1)`, `c ∈ [2, 30]` and integers `N, K ≥ 1`, write
    `t₀(x) = max(H_{σ₂}, exp √(log x/R))`, `T(x) = t₀(x)^c` and `ε(x) = ε₁(x, T(x)) + ε₂ + ε₃ + ε₄`
    for the sum of the four bounds of the previous item at `x` and `T(x)`. If `T(x₀) ≤ x₀`, then for
    every `x ≥ x₀`, `E_ψ(x) = |ψ(x) − x|/x ≤ sup_{y ≥ x₀} ε(y)`, and `E_ψ(x) ≤ ε(x₀)` whenever `ε`
    is nonincreasing on `[x₀, ∞)` or `ε(x₀) ≥ 1`. Route (their §4): `T(x) ≤ x` for every `x ≥ x₀`
    (while `t₀(x) = H_{σ₂}` the height is fixed and `x` grows; beyond,
    `c √(log x/R) ≤ 30 √(log x/5.5666305) < log x` for `log x > 1000`), so the previous item gives
    `E_ψ(x) ≤ ε(x)` at each `x ≥ x₀`; and `E_ψ(x) ≤ 1` for `x ≥ 1`. The source states
    `E_ψ(x) ≤ ε(x₀)` for all its parameters, taking each term nonincreasing in `x` (for `ε₄`, their
    Proposition 3.14); but while `t₀(x) = H_{σ₂}` the height `T(x)` is fixed and `ε₁ = 2 log² x/T`
    increases, so the bound at `x₀` is stated here where the monotonicity of the sum holds. Nor does
    the source state `T(x₀) ≤ x₀`: for `σ₂` near `1` and `c` large, `T(x₀) = H_{σ₂}^c` exceeds `x₀`,
    a height that no truncated explicit formula of §2.1 reaches. Its rows are those of
    *FioriKadiriSwidinskyPsiRow* (Table 5, at `c = 3`, `K = 10⁵` and `N = ⌈10⁵ (σ₂ − 0.9)⌉`).
  - Broadbent–Kadiri–Lumley–Ng–Wilk's form of (d) (`broadbent-kadiri-lumley-ng-wilk-2021` Theorem 13
    and (A.8)–(A.14), arXiv numbering; `pnt-plus`): for `1000 ≤ b₁ < b₂`, `0.001 ≤ δ ≤ 0.025`,
    `λ > 1`, `max(50, T₀) ≤ H < T < e^{b₁}` with `RH(H)` and `1 − δ ∈ S`, and
    `K = ⌊log(T/H)/log λ⌋ + 1`, for every `x ∈ [e^{b₁}, e^{b₂}]`,
    `|ψ(x) − x| ≤ (s₀(b₂, T) + s₁(b₁, δ, T) + s₂(δ, b₁, K, λ, T)) x`, with `s₀(b, T) = 2b²/T`,
    `s₁(b, δ, T) = e^{−δb} ((1/2π) log²(T/2π) + 1.8642)` (the zeros with `β < 1 − δ`, by the bound
    of §2.1) and `s₂ = (2λ/T) ∑_{k=0}^{K−1} exp(k log λ − b/(R (log T − k log λ))) D(T/λ^k)`, `D`
    the density bound at `1 − δ` (the zeros with `β ≥ 1 − δ`, over the geometric partition of ratio
    `λ`). On `T < (√x − 2)/2` the first term is the Dudek shape of §2.1; on the rest of its range it
    is *DudekExplicitFormula* (§2.1), in its form for real `x ≥ e¹⁰⁰⁰` (`pnt-plus`).
  - The closed form (their Theorem 14, from Platt–Trudgian's argument; `pnt-plus`): for `b₀ ≥ 1000`
    and `σ ∈ [3/4, 1) ∩ S`, `|ψ(x) − x| ≤ A (log x/R)^{5/2−σ} exp(−(16σ/3 − 10/3) √(log x/R)) x` for
    `log x ≥ b₀`, with `A = 2.0025 · 2^{5−2σ} c₁(σ) + c₃ + c₄ + c₅` and `c₃`, `c₄`, `c₅` the
    explicit functions of `b₀`, `σ`, `R` and `c₂(σ)` of their (A.16)–(A.20): the shape
    `(B, C) = (5/2 − σ, 16σ/3 − 10/3)` of the rows of (d).

Each printed row of (b), (c), (d) and of Büthe's theorem of §2.3 is a *table proposition*
asserting that the error function at the row's parameters is at most the row's values. Table
propositions of this section; the rows are data in the statement:

- *DusartThesisTable* (`dusart-1998-thesis` lines 847–852, Table 1.1), for (b): the rows
  `(b, ε) = (22, 2.78652·10⁻⁴), (23, 1.8436·10⁻⁴), (30, 0.978·10⁻⁵), (600, 0.75·10⁻⁷), (2000, 1.64·10⁻³ log-relative)`,
  meaning `|ψ(x) − x| ≤ ε x` for `x > e^b`, at *Dusart's parameters*: `A = A₁ = 545 439 823.21533…`
  of *VanDeLuneZeroCount* (§1.1), `D = 158.84998` with `(g, c) = (0.038207, 2.82)`,
  `R = 9.645908801` and Rosser's triple. An instance at these parameters carries the hypotheses
  of (b) there: `RH(30 610 046 000)` (which gives `RH(A₁)`; `RH(545 439 823)` does not, since
  `A₁ > 545 439 823`), *VanDeLuneZeroCount* for `N(A₁) = M(A₁)`, *RosserSchoenfeldLowZeros* for
  `(g, c)`, the
  Rosser–Schoenfeld-shape region and Rosser's zero count.
- *Dusart1999Row* (`dusart-1999-mc` lines 102–108, Theorem 2), for (b): `b = 50`,
  `δ = 0.947265625·10⁻⁸`, `m = 18`, `ε = 0.905·10⁻⁷`, at Dusart's parameters.
- *FaberKadiriTable* (`faber-kadiri-2018-corrigendum` lines 85–98, Table 1, with
  `H = 30 610 046 000`, `T₀ = 1 132 491`, `R₀ = 5.69693` and Rosser's triple, and with
  `s₀ = 11.637732363` of *OdlyzkoZeroSums*, where the corrigendum prints `11.637732`), for (c); an
  instance at a row carries *OdlyzkoZeroSums* for `s₀`: the rows `(b₀, σ₀, m, δ, T₁, ε₀)`, each with the density constants `(c₁, c₂, c₃)` of Kadiri's
  table at `σ₀` (`faber-kadiri-2015` lines 818–848, Table 2: the left column for `b₀ < 45` and
  `b₀ > 1000`, the right column, small at `T = H`, for `45 ≤ b₀ ≤ 1000`, as the corrigendum's lines
  90–93 say). It asserts that the general form of `gap:explicit-zero-density` (ExplicitZetaBounds
  §8.1) at `σ₀`, `H = H₀ − 1` and Kadiri's auxiliary abscissa (`faber-kadiri-2015` lines 849–850)
  is at most `c₁ T + c₂ log T + c₃` for `T ≥ H₀`, and that `ε` of (c) at the row is at most `ε₀`; in
  particular the row `(20, 0.89, 4, 1.363·10⁻⁵, 1 132 491, 5.3688·10⁻⁴)` with
  `(c₁, c₂, c₃) = (0.4617, 0.6644, −340 272)` (line 838; `kadiri-2013-density` line 659).
- *PlattTrudgianTable* (`platt-trudgian-2021-error` lines 81–92, Table 1, `R = 5.573412`;
  `pnt-plus`, `ieantn`), for (d) with `H = 3·10¹²`, the classical-shape region, the Dudek-shape
  error `ε₁ = 2 log² x/T` of §2.1, `T = exp(2 √(log x/R))`, and the density of
  `gap:explicit-zero-density` at its §8.3 parameters (`platt-trudgian-2021-error` lines 131–141,
  Lemma 5): the rows `(X, σ, A, B, C, ε₀)`, in particular
  `(1000, 0.98, 461.9, 1.52, 1.89, 1.20·10⁻⁵)` and `(10 000, 0.99, 535.4, 1.51, 1.94, 6.78·10⁻²⁹)`.
- *JohnstonYangTable* (`johnston-yang-2023` lines 95–113, Table 1; `pnt-plus`), for (d) with
  `H = 3 000 175 332 800`, the error `ε₁` of *JohnstonYangExplicitFormula* and the density
  *JohnstonYangDensityTable* (§3.4); for the rows with `X ≤ 10 000` the classical-shape region with
  `R₀ = 5.5666305` and `s₂` in the form (3.6) with the row's `K`, for the rows with `X ≥ 10⁵` the
  region `ν₂` of §3.4 and the single term `2 D(T)/T` (lines 453–537): the rows
  `(X, σ, K, A, B, C, ε₀)` of Theorem 1.1's second form, the first row (`X = log 2`, `A = 9.39`,
  `B = 1.515`, `C = 0.8274`) being asserted from `x₀ = e^{2488}` (lines 277–279).
- *FioriKadiriSwidinskyPsiRow* (`fiori-kadiri-swidinsky-2023-psi` Theorem 1.2, Table 6 and Corollary
  1.4; `pnt-plus`, `ieantn`), for Fiori–Kadiri–Swidinsky's refinement of (d) with `H = 3·10¹²`, the
  classical-shape region with `R = 5.5666305`, the Dudek-shape error of §2.1 for `x > e⁵⁰` and
  `3 log x < T < √x/3` (the range of their Proposition 3.4, inside that of §2.1), and the density
  *FioriKadiriSwidinskyDensity* (§3.4):
  `|ψ(x) − x| ≤ 9.22022 x (log x)^{3/2} exp(−0.8476836 √log x)` for `x ≥ 2`; and, from the same
  paper, `|ψ(x) − x| ≤ 4.9678·10⁻¹⁵ x` for `log x ≥ 3000`. It also asserts the bound in the
  normalisation of admissible asymptotic bounds,
  `|ψ(x) − x| ≤ 121.096 (log x/R)^{3/2} exp(−2 √(log x/R)) x` for `x ≥ 2`, that is
  `(A_ψ, B, C, R) = (121.096, 3/2, 2, 5.5666305)`, the form in which `fiori-kadiri-swidinsky-2023`
  lines 151–154 (Remark 2) quote it as Corollary 1.3 of the `ψ` paper (their reference [8], line
  775). The two forms are not equal: at `R = 5.5666305`, `121.096/R^{3/2} = 9.2202183… < 9.22022`
  and `2/√R = 0.84768363… > 0.8476836`, so for every `x > 1` the right side of the `121.096` form is
  `9.2202183… x (log x)^{3/2} exp(−0.84768363… √log x)`, below that of the `9.22022` form: the
  `121.096` form implies the `9.22022` form, and not conversely, the ratio of the right sides
  exceeding `1` and tending to infinity with `x` (`ieantn`). Both are asserted, each for the use
  that quotes it. The same proposition asserts the rows of their Table 5, for each row
  `(log x₀, σ₂, ε₁, ε₂, ε₃, ε₄, ε)` `|ψ(x) − x| ≤ ε x` for `log x ≥ log x₀` (thirty-seven rows from
  `log x₀ = 1000` to `10⁶`, among them `(1000, 0.99130, …, 1.3812·10⁻⁹)`,
  `(2000, 0.99221, …, 2.4746·10⁻¹²)`, `(3000, 0.99263, …, 4.9678·10⁻¹⁵)`,
  `(10⁴, 0.99449, …, 1.3688·10⁻³⁰)` and `(10⁶, 0.99950, …, 3.9566·10⁻³⁵⁹)`); the admissible
  constants of their Theorem 1.2, `|ψ(x) − x| ≤ A(x₀) (log x/R)^{3/2} exp(−2 √(log x/R)) x` for
  `log x ≥ log x₀ ≥ 1000`, `A` the step function equal to `338.3058` on `[1000, 2000)`, to
  `263.2129` from `2000`, …, to `109.3992` from `10⁶`, `100.5097` from `10⁷`, `96.0345` from `10⁸`
  and `93.6772` from `10⁹`; and their Lemmas 5.2–5.3,
  `|ψ(x) − x| ≤ 2 (log x)^{3/2} exp(−0.8476836 √log x) x` for `2.3 ≤ x ≤ e²¹⁰⁰` and the same with
  `9.22022` for `2100 < log x ≤ 200 000` (the first is printed for every `x` with `log x ≤ 2100`,
  but fails for `x < 2.3`, at `x = 2` for instance).
- *BKLNWPsiTable* (`broadbent-kadiri-lumley-ng-wilk-2021` Table 8, arXiv v2, lines 1378–1440;
  `pnt-plus`, `ieantn`): the rows `ε(b)` with `|ψ(x) − x| < ε(b) x` for `e^b ≤ x ≤ e^{b'}`, `b'` the
  next row. The rows `b ≤ 2000` are for Büthe's general theorem of §2.3 at the height
  `2 445 999 556 030`; the rows `b ≥ 2500` are for (d) in the form of their Theorem 13, with the
  Dudek-shape error of §2.1, the classical-shape region, `s₂` of their (A.14) and the density of
  `gap:explicit-zero-density` at its §8.3 parameters (their Table 7, lines 1180–1200). In particular
  `ε(20) = 4.26760·10⁻⁵`, `ε(30) = 2.87549·10⁻⁷`, `ε(40) = 1.93378·10⁻⁸`, `ε(45) = 1.09073·10⁻⁸`,
  `ε(50) = 1.11990·10⁻⁹`, `ε(100) = 2.45299·10⁻¹²`, `ε(200) = 2.18154·10⁻¹²`,
  `ε(2000) = 1.92279·10⁻¹²` and `ε(2500) = 9.06304·10⁻¹³`.

The zero-counting triple of (b) and (c), and of the instances of Layer 7 built on the same formula,
is the source's. Write *ZeroCountBound* `a₁ a₂ a₃ a₄ T₀` for ExplicitZetaBounds §5.2a's
*ZetaZeroCountBound* `(7/8) a₁ a₂ a₃ a₄ T₀`, that is: for every `T ≥ T₀`,
`|N(T) − M(T)| ≤ a₁ log T + a₂ log log T + a₃ + a₄/T`, with `M(T)` including the `7/8`; its
instances at Trudgian's and Platt–Trudgian's triples below are zero inputs of this roadmap. At
Rosser's `(0.137, 0.443, 1.588, 0, 2)` it is ExplicitZetaBounds §§5.2–5.2a, and so is it at
Bellotti–Wong's triples with `7/8` added to `a₃` from `T₀ = 30 610 046 000`, given *HiaryRecord*,
*PatelRecord* and *YangRecord*; at those an instance takes it from the supplier, with the three
records among its hypotheses. The triples of Trudgian `(0.112, 0.278, 2.510, 0.2, e)` (`pnt-plus`)
and of Platt–Trudgian `(0.110, 0.290, 2.290, 0, e)` (as quoted at `cully-hugill-lee-2022` lines
150–156 and `carneiro-milinovich-soundararajan-2019` line 1313) are stated by no supplier:
ExplicitZetaBounds §5.2 re-establishes Trudgian's bound only against `(T/2π) log(T/2πe)`, with the
constant `3.385`. An instance whose source evaluates its error function at one of these two triples
carries *ZeroCountBound* at that triple as a hypothesis (§7.3); one whose source uses such a triple
only for a consequence that Rosser's bound also gives takes Rosser's (§§2.5, 7.5).

*Needs:* §2.1 (for (d), its truncated explicit formula, the sums over the ordinates and, for the
full range of Broadbent–Kadiri–Lumley–Ng–Wilk's form and for Fiori–Kadiri–Swidinsky's,
*DudekExplicitFormula*); §2.3 (Büthe's
general theorem, for the rows `b ≤ 2000` of *BKLNWPsiTable*); §1.1 (with
*FioriKadiriSwidinskyZeroSums*); ExplicitZetaBounds §8.3a (the density predicate); ExplicitZetaBounds
§§5.2a and 7.3a (the zero-count and classical-region predicates); `gap:classical-zero-free-constants`;
`gap:vinogradov-korobov-constants` (for (d) in that shape); ExplicitZetaBounds §5.2
(`gap:explicit-zero-count-error`); ExplicitZetaBounds §§8.1, 8.3 (`gap:explicit-zero-density`);
ExplicitZetaBounds §5.4; Mathlib `Real.exp`, `Real.sqrt`, `Real.log`.

**Checks.**

- (b) needs `N(A) = M(A)`, not only `RH(A)` (negative control): at the recorded height
  `A = 545 439 823`, `M(A) = 1 500 000 000.37` is not an integer, so no count equals it, and the
  boundary term `−R(A) φ_m(A)` of `Ω₂` would have to carry `|N(A) − M(A)| φ_m(A)` as well; this is
  why the sources take `A` where `M(A)` is the verified count.
- (b) degenerate: `b ≤ 1/2` is excluded; for `b` just above `1/2` the term `e^{−b} log 2π = 1.1`
  makes `ε > 1`, a trivial bound; the scheme has content only for large `b`.
- (a)'s region hypothesis is weaker than the classical shape: it asks nothing for `2 ≤ |t| < 2π`,
  where in any case `ζ` has no zero (none lies below height `14`, ExplicitZetaBounds §0.4).
- The low-height hypothesis cannot be replaced by `RH(14)`: `RH(14)` allows zeros on the line below
  height `14`, while Lemma 2.2 needs `N(T₀) = M(T₀)`; at `T₀ = 9.6769…` this is `N(T₀) = 0`.

### 3.2 Rosser–Schoenfeld and Schoenfeld constants for ψ and θ

Each of the following holds under the hypotheses of §3.1(b) at Dusart's parameters
(`RH(30 610 046 000)`, *VanDeLuneZeroCount*, *RosserSchoenfeldLowZeros*, the
Rosser–Schoenfeld-shape region with `R = 9.645908801` and the zero-count error with Rosser's
triple), *DusartThesisTable*, *RosserSchoenfeld1962Range*, `Schoenfeld1976Range` and
`ButheVerified`, by the standard route; Schoenfeld's Theorem 11 also uses
*RosserSchoenfeldZeroCount*.

- `θ(x) < 1.01624 x` for `x > 0` (`rosser-schoenfeld-1962` line 328, Theorem 9; `pnt-plus`,
  `ieantn`).
- `ψ(x) < 1.03883 x` for `x > 0`, and `ψ(x)/x ≤ ψ(113)/113` for every `x > 0` (lines 341–342).
- `x(1 − 1/(2 log x)) < θ(x)` for `x ≥ 563` and `θ(x) < x(1 + 1/(2 log x))` for `x > 1` (lines
  252–253 with the ranges of lines 306–307, Theorem 4); `x(1 − 1/log x) < θ(x)` for `x ≥ 41`
  (its Corollary).
- `θ(x) < 1.001093 x` for `x > 0`; `0.998697 x < θ(x)` for `x > 1 155 901`;
  `ψ(x) − θ(x) < 1.001093 √x + 3 x^{1/3}` for `x > 0`; `0.998697 √x < ψ(x) − θ(x)` for `x > 121`
  (`schoenfeld-1976` lines 729–733, Theorem 6*; `pnt-plus`). The last two follow from the first two,
  from `ButheVerified` and from the Corollary of Theorem 4 above, through the decomposition
  `ψ(x) − θ(x) = θ(√x) + ∑_{k ≥ 3} θ(x^{1/k})` of §0.3 (the terms with `x^{1/k} < 2` vanishing), not
  through its transfer theorem, whose cube-root term `c (log x/log 2 − 2) x^{1/3}` is already
  `38.3 x^{1/3}` at `x = 1 155 901²`; the source derives the upper one from Rosser–Schoenfeld's
  `ψ(x) − θ(x) < θ(√x) + 3 x^{1/3}` (`rosser-schoenfeld-1962` lines 349–357, Theorem 14, (3.38);
  `rosser-schoenfeld-1975` lines 770–771). On `0 < x ≤ 10⁸` both are `Schoenfeld1976Range`. For
  `x > 10⁸`, the upper one: the first item termwise gives
  `ψ(x) − θ(x) < 1.001093 (√x + ∑_{k ≥ 3, x^{1/k} ≥ 2} x^{1/k})`, and
  `∑_{k ≥ 3, x^{1/k} ≥ 2} x^{1/k} ≤ 1.534 x^{1/3}` for every `x ≥ 10⁸` (the ratio is `1.53390` at
  `x = 10⁸`, its maximum; for `x ≥ 10⁶⁰` it is at most `1 + (log x/log 2 − 3) x^{−1/12} ≤ 1.002`),
  so `ψ(x) − θ(x) < 1.001093 √x + 1.536 x^{1/3}`. The lower one on `10⁸ < x ≤ 1 155 901²`:
  `ψ(x) − θ(x) ≥ θ(√x) + θ(x^{1/3})`, with `θ(y) ≥ y − 1.95 √y` for `1427 ≤ y ≤ 10¹⁹`
  (`ButheVerified`, at `y = √x ∈ (10⁴, 1 155 901]`, and at `y = x^{1/3}` once `x^{1/3} ≥ 1427`) and
  `θ(y) > y(1 − 1/log y)` for `y ≥ 41` (at `y = x^{1/3} ∈ (464, 1427)`); the sum of these lower
  bounds is at least `1.0088 · 0.998697 √x` on that range, the least ratio being at its right end.
  For `x > 1 155 901²`, `θ(√x) > 0.998697 √x` is the second item at `√x > 1 155 901`.
- The input *SchoenfeldFiniteRangeInput* of AnalyticNumberTheoryPartI §0.3 (`θ(x) < 1.000081 x` for
  `0 < x < exp 10000`): for `0 < x < 1`, `θ(x) = 0`; for `1 ≤ x ≤ 10¹⁹`, `θ(x) < x` by
  `ButheVerified`; for `x > e³⁰` (and `e³⁰ < 10¹⁹`), `θ(x) ≤ ψ(x) ≤ (1 + 0.978·10⁻⁵) x` by the row
  `b = 30` of *DusartThesisTable* through §3.1(b). The full-range `θ(x) < 1.000081 x` for `x > 0`
  (announced at `schoenfeld-1976` lines 1288–1294 without proof) is then §0.3 there and is not
  restated.
- Schoenfeld's Theorem 11 (lines 201–206): with `X = √(log x/R)`, `R = 9.645908801`,
  `ε₀(x) = √(8/(17π)) X^{1/2} e^{−X}`: `|ψ(x) − x| < x ε₀(x)` for `x > 17`,
  `|θ(x) − x| < x ε₀(x)` for `x > 101`. This instance of §3.1(b) is taken at Rosser–Schoenfeld's
  height `A = A₀ = 1 894 438.51224…`, with `RH(A₀)`, implied by `RH(545 439 823)`, and
  `N(A₀) = M(A₀)`, which is *RosserSchoenfeldZeroCount*; its constants for the low zeros are those
  of *RosserSchoenfeldLowZeros*.
- Schoenfeld's Theorem 7* (`schoenfeld-1976` lines 767–779): `|ψ(x) − x| < 0.0220646 x/log x` for
  `x > 161 971`, `−0.0220646 x/log x < ψ(x) − x` for `x > 89 909`, `|θ(x) − x| < 0.0239922 x/log x`
  for `x > 758 711`, `θ(x) − x < 0.0201384 x/log x` for `x > 1`, and
  `|ψ(x) − x|, |θ(x) − x| < 0.0077629 x/log x` for `x > e²²`. The last is implied, beyond `10¹⁹`, by
  Dusart's `0.006409 x/log x` of §3.3 together with §0.3, and below by `ButheVerified` (at
  `x = e²²`, `0.94 √x = 5.6·10⁴` against `0.0077629 x/log x = 1.26·10⁶`); the others below `10¹⁹`
  likewise from `2·10⁶` on, where `0.94 √x` and `1.95 √x` are below `0.0220646 x/log x` and
  `0.0239922 x/log x` (`√x/log x = 97.5` at `2·10⁶`, against `42.6` and `81.3`), and on their
  ranges up to `2·10⁶` by *SchoenfeldTheorem7Range* (§1.3); the upper half `θ(x) < x` of the
  `θ`-bounds needs no range, `ButheVerified` giving it for `1 ≤ x ≤ 10¹⁹`.
- Schoenfeld's Corollary 2* (`schoenfeld-1976` lines 1226–1233, (9.8)):
  `x − x/(c log x) < θ(x)` for `x > d`, at the pairs `(c, d) = (41, 758 231)`, `(40, 678 407)`,
  `(39, 644 123)`, `(37, 486 377)`, `(35, 468 577)` and `(29, 315 437)`, the six of the corollary's
  pairs that Treviño's Table 2 uses (§4.5). For `x > 758 711` it is the lower half of
  `|θ(x) − x| < 0.0239922 x/log x` above, since `0.0239922 < 1/41 ≤ 1/c`; on `d < x ≤ 2·10⁶` it is
  *SchoenfeldTheorem7Range* (§1.3). By the right-continuity of `θ` it holds at `x = d` with `≤`.
- Rosser–Schoenfeld's `ε(x)` of their Theorem 11 (lines 334–342) with `R = 17.51631` is the
  older instance of the same scheme and is superseded; it is not restated.

*Needs:* §3.1(b); §0.3; §0.5; §1.1; §1.3 (`ButheVerified`, `Schoenfeld1976Range`,
*RosserSchoenfeld1962Range*, *SchoenfeldTheorem7Range*); AnalyticNumberTheoryPartI §0.3 (the
statement of *SchoenfeldFiniteRangeInput*); `gap:rh-up-to-height`; `gap:classical-zero-free-constants`;
ExplicitZetaBounds §5.2 (`gap:explicit-zero-count-error`, Rosser's bound).

### 3.3 Dusart's bounds

Under the hypotheses of §3.1(b) at Dusart's parameters (`RH(30 610 046 000)`,
*VanDeLuneZeroCount*, *RosserSchoenfeldLowZeros*, the Rosser–Schoenfeld-shape region with
`R = 9.645908801` and Rosser's zero-count triple), *DusartThesisTable*, *Dusart1999Row*,
*DusartThesisRange* and `ButheVerified`:

- `|ψ(x) − x| ≤ 0.006409 x/log x` for `x > e²²`; `|θ(x) − x| ≤ 0.006788 x/log x` for
  `x > 10 544 111` (`dusart-1998-thesis` lines 845–846, Théorème 1.3; `pnt-plus`; the proof at lines
  847–864 is the standard route with Table 1.1).
- `|θ(x) − x| < η_k x/log^k x` for `x > 1` with `η₂ = 3.965`, `η₃ = 515`, `η₄ = 1 717 433`, and
  `|θ(x) − x| ≤ 0.2 x/log² x` for `x > 3 594 641` (lines 869–874, 924–925, Théorème 1.4).
- `|ψ(x) − x| ≤ 0.905·10⁻⁷ x` for `x ≥ e⁵⁰` (`dusart-1999-mc` lines 102–108, Theorem 2; `pnt-plus`).
- Under the classical-shape region with `R₀ = 5.69693` instead, with the absence of zeros up to
  height `14` and `ZetaZeroCubeSum` (`dusart-2016` lines 84–90, Corollary 1.2): `max(|θ(x) − x|, |ψ(x) − x|) < √(8/π) R₀^{−1/4} x (log x)^{1/4} exp(−√(log x/R₀))`
  for `x ≥ 3`, from §3.1(a) for `X ≥ 8.36` (that is `log x ≥ 398.16`) and the standard route below.
- Dusart's later bounds (`pnt-plus`; `dusart-2018`, Ramanujan J. 45, cited from its arXiv copy
  1002.0442; the `θ`-table is Theorem 4.2 of the journal and Theorem 5.2 of the copy), under
  `RH(3·10¹²)`, the classical-shape region with `R₀ = 5.573412`, the tables of §3.7,
  *Dusart2018Range* and `ButheVerified`:
  - `|θ(x) − x| < η_k x/log^k x` for `x ≥ x_k`, for the rows `(k, η_k, x_k) = (2, 0.2, 3 594 641)`,
    `(2, 0.05, 122 568 683)`, `(2, 0.01, 7 713 133 853)`, `(3, 20.83, 2)`, `(3, 10, 32 321)`,
    `(3, 1, 89 967 803)`, `(3, 0.78, 158 822 621)`, `(4, 1300, 2)` of the copy, the journal's row
    `(3, 0.5, 767 135 587)` (as quoted at `deleglise-nicolas-2019-landau` lines 387–388), and the
    further rows `(1, 1.2323, 2)`, `(1, 0.001, 908 994 923)`, `(2, 3.965, 2)` and `(4, 151.3, 2)` of
    the journal's Theorem 4.2 (the row `(0, 1, 1)` there is Mathlib's
    `Chebyshev.theta_le_log4_mul_x` with `θ ≥ 0`);
  - `θ(x) − x < x/36 260` for `x > 0` (Proposition 5.1 of the copy);
  - `0.9999 √x < ψ(x) − θ(x)` for `x ≥ 121`, and `ψ(x) − θ(x) < 1.00007 √x + 1.78 x^{1/3}` for
    `x > 0` (Propositions 3.1–3.2 of the copy); these imply Schoenfeld's `ψ − θ` bounds of §3.2;
  - `√x (1 − 4/log³ x) < ψ(x) − θ(x)` for `x ≥ 121`, sharper than `0.9999 √x` from `log x = 34.2`,
    and `ψ(x) − θ(x) < (1 + 1.47·10⁻⁷) √x + 1.78 x^{1/3}` for `x > 0` (journal Proposition 4.3 and
    Corollary 4.5).

  The paper's proofs of all these items pass through its table of `ψ`-bounds, and
  `broadbent-kadiri-lumley-ng-wilk-2021` (footnote, p. 2299 of the published version) report an
  error affecting that table and the `ψ`-results built on it (journal Theorems 3.2–3.3 and Table 1).
  No `ψ` row of `dusart-2018` is stated here, and these items are proved by other routes. The
  `θ` rows: on `[x_k, 10¹⁹]` by *Dusart2018Range*, and beyond `10¹⁹` from the tables of §3.7, whose
  constants there (`3.7979·10⁻⁵` for `k = 2`, `0.024334` for `k = 3`, `57.184` for `k = 4`) are
  below every `η_k` above, the rows `k = 1` following from the row `k = 2` there; this is the
  re-proof of Corollary 11.2 of
  `broadbent-kadiri-lumley-ng-wilk-2021` (lines 954–975). The bound `x/36 260`: from §3.7's
  `θ(x) ≤ (1 + 1.93378·10⁻⁸) x`. The lower `ψ − θ` bound: *Dusart2018Range* on `[121, 10¹⁶]`; for
  `10¹⁶ < x ≤ 10³⁸`, `ψ(x) − θ(x) ≥ θ(√x) + θ(x^{1/3})` with `θ(y) ≥ y − 1.95 √y` (`ButheVerified`,
  `1427 ≤ y ≤ 10¹⁹`), and `10⁻⁴ √x + x^{1/3} > 1.95 (x^{1/4} + x^{1/6})` there; beyond `10³⁸`,
  `θ(√x) ≥ (1 − 1.9667·10⁻⁸) √x` (§3.7). The form `√x (1 − 4/log³ x)`: below `e^{34.19}` it is
  implied by `0.9999 √x`, since `4/log³ x ≥ 10⁻⁴` there; on `[e^{34.19}, e⁵⁸]`,
  `ψ(x) − θ(x) ≥ θ(√x) + θ(x^{1/3}) > √x` by `θ(y) ≥ y − 1.95 √y` (`ButheVerified`), since
  `x^{1/3} > 1.95 (x^{1/4} + x^{1/6})` there; beyond `e⁵⁸`,
  `θ(√x) > √x (1 − 0.024334/log³ √x) = √x (1 − 0.194672/log³ x)` by the row `k = 3` of §3.7 from
  `e²⁹`. The upper `ψ − θ` bound:
  `ψ(x) − θ(x) = θ(√x) + ∑_{k ≥ 3} θ(x^{1/k})` with `θ(√x) ≤ (1 + 1.93378·10⁻⁸) √x` (§3.7) and
  `∑_{k ≥ 3} θ(x^{1/k}) < 1.777745 x^{1/3}`, which is *Dusart2018Range* for `x ≤ 10²⁴` and follows
  beyond from `θ(y) < 1.000081 y` (AnalyticNumberTheoryPartI §0.3) and
  `(⌊log x/log 2⌋ − 3) x^{1/4} ≤ 0.76 x^{1/3}` for `x ≥ 10²⁴`; it gives
  `(1 + 1.93378·10⁻⁸) √x + 1.777745 x^{1/3}`, which implies both upper forms.

*Needs:* §3.1(a), (b); §3.7; §0.3; §0.5; §1.1; §1.3; AnalyticNumberTheoryPartI §0.3;
`gap:rh-up-to-height`; `gap:classical-zero-free-constants`; `gap:explicit-zero-count-error`.

### 3.4 Faber–Kadiri, Trudgian, Platt–Trudgian, Johnston–Yang and Fiori–Kadiri–Swidinsky

- Faber–Kadiri (`faber-kadiri-2015` line 43, Corollary 1.2, with the corrected table
  `faber-kadiri-2018-corrigendum` line 98; `pnt-plus`): under `RH(30 610 046 000)`, the
  classical-shape region with `R₀ = 5.69693`, Rosser's zero-count triple, Kadiri's density
  `N(σ₀, T) ≤ c₁ T + c₂ log T + c₃` for `T ≥ H₀` at the abscissa `σ₀` of each row (`0.89` at
  `b₀ = 20`), from the general form of `gap:explicit-zero-density` (ExplicitZetaBounds §8.1) with
  the constants `(c₁, c₂, c₃)` that *FaberKadiriTable* records for the row
  (`faber-kadiri-2018-corrigendum` lines 90–93 and 98; `faber-kadiri-2015` lines 818–848, Table 2),
  *OdlyzkoZeroSums* (for `T₀ = 1 132 491` and `s₀`), *FaberKadiriTable* and `ButheVerified`:
  `|ψ(x) − x| ≤ 5.3688·10⁻⁴ x` for `x ≥ e²⁰`, an instance of §3.1(c) beyond `10¹⁹`; on
  `e²⁰ ≤ x ≤ 10¹⁹` it follows from `ButheVerified`, since `0.94 √x ≤ 5.3688·10⁻⁴ x` for
  `x ≥ 3.07·10⁶`. No finite range below `e²⁰` is asserted. The density input is
  `kadiri-2013-density` (Acta Arith. 160) at the row's `σ₀`, not its instance at `17/20`. The bound
  is kept as an instance of §3.1(c); for `x ≥ e⁴⁰` it is superseded by *BKLNWPsiTable* and for
  `x > 3·10¹²` by the *(preprint)* instance of §2.6.
- Trudgian's region (`trudgian-2016` lines 49–61), a theorem: if `ζ` has no zero with `|t| ≥ 2`
  and `σ ≥ 1 − 1/(5.69693 log |t|)`, and `RH(30 610 046 000)` holds, then `ζ` has no zero with
  `|t| ≥ 24` and `σ ≥ 1 − 1/(6.455 log(|t|/17))`. For `24 ≤ |t| ≤ 30 610 046 000` the region lies in
  `σ > 1/2` (because `6.455 log(|t|/17) > 2` exactly for `|t| > 17 e^{2/6.455} = 23.18`), where
  `RH(30 610 046 000)` leaves no zero; for larger `|t|` it lies inside the first region, because
  `6.455 log(|t|/17) ≥ 5.69693 log |t|` exactly for
  `|t| ≥ exp(6.455 log 17/(6.455 − 5.69693)) = 3.0014·10¹⁰`.
- Trudgian (`trudgian-2016` lines 66–73, Theorem 1; lines 132–140, Theorem 2; `pnt-plus`, `ieantn`):
  under `RH(30 610 046 000)`, the classical-shape region with `R₀ = 5.69693`, Rosser's zero-count
  triple, Kadiri's density at the `σ₀` of each row of *FaberKadiriTable* that the route uses (as in
  Faber–Kadiri's instance above), *OdlyzkoZeroSums*, *FaberKadiriTable*, *TrudgianRange*,
  `ButheVerified`, and for the range of Schoenfeld's argument *RosserSchoenfeldZeroCount* and
  *RosserSchoenfeldLowZeros* (the hypotheses of §3.1(b) at Schoenfeld's `A₀`): with
  `ε₀(x) = √(8/(17π)) X^{1/2} e^{−X}`, `X = √(log x/6.455)`, `|θ(x) − x| ≤ x ε₀(x)` for `x ≥ 149`
  and `|ψ(x) − x| ≤ x ε₀(x)` for `x ≥ 23`;
  `|π(x) − li x| ≤ 0.2795 x (log x)^{−3/4} exp(−√(log x/6.455))` for `x ≥ 229`, the power of `log x`
  dividing, as the passage from `x ε₀(x)` to `π` requires (`0.2795` is
  `√(8/(17π)) 6.455^{−1/4} = 0.2428` with the boundary and integral terms of §0.4); and the source's
  Lemma 1, `|θ(x) − x| ≤ 0.0045 x/log² x` for `x ≥ e³⁵`, from the rows of *FaberKadiriTable* on
  `[e³⁵, e⁴⁰⁰⁰]` through the source's Table 1 (lines 237–267) and from `x ε₀(x)` beyond `e⁴⁰⁰⁰`.
  Route (`trudgian-2016` lines 74–104): for `log x ≥ 1163`, the argument of Schoenfeld's Theorem 11
  (§3.2, an instance of §3.1(b)) with the Rosser–Schoenfeld-shape region of Trudgian's region in
  place of `R = 9.645908801` (the source's (4), line 82); for `e²⁵ ≤ x ≤ e¹¹⁶³`, the rows of
  *FaberKadiriTable*, which give `|ψ(x) − x|, |θ(x) − x| ≤ 0.006 x ε₀(x)` there through Schoenfeld's
  `ψ − θ` bound (lines 85–92); on `x ≤ 10¹⁹`, `ButheVerified` for `ψ` from `x ≥ 35.08`, for `θ` from
  `x ≥ 1427` and for `π` from `x ≥ 360` (from `359.3` on its `π` clause is below the bound), and
  *TrudgianRange* below, its `π` clause on `[229, 360]`; the `π` form by §0.4 with `li`.
  Schoenfeld's argument alone reaches down only to `log x ≥ 1163`, so the middle range
  `10¹⁹ < x < e¹¹⁶³` needs the table (any row-wise `ψ`-bound below `x ε₀(x)` there serves, such as
  *BKLNWPsiTable*).
- Mossinghoff–Trudgian's `θ` bound (`mossinghoff-trudgian-2015` §7, Corollary 1; `ieantn`): with
  `ε_MT(x) = √(8/(17π)) (log x/6.315)^{1/4} exp(−√(log x/6.315))`, `|θ(x) − x| ≤ x ε_MT(x)` for
  every `x ≥ 149`. It is Trudgian's `θ` bound above with `6.315` in place of `6.455`, and sharper
  than it on the whole range (`X^{1/2} e^{−X}` decreases for `X > 1/2`, and
  `√(log 149/6.455) = 0.88`). Its hypotheses are those of Trudgian's bound, with the classical-shape
  region with `R = 5.573412` (`gap:classical-zero-free-constants`, given `RH(3·10¹²)` and
  *BrentPlattTrudgianRecord*) in place of `5.69693`, and *MossinghoffTrudgianRange* below. The
  region behind it, a theorem as Trudgian's region above: given that classical-shape region and
  `RH(30 610 046 000)`, `ζ` has no zero with `|t| ≥ 24` and `σ ≥ 1 − 1/(6.315 log(|t|/17))`; below
  `|t| = 30 610 046 000` the region lies in `σ > 1/2` (`6.315 log(|t|/17) > 2` exactly for
  `|t| > 23.34`), and above it inside the first region, `6.315 log(|t|/17) ≥ 5.573412 log |t|`
  holding exactly for `|t| ≥ exp(6.315 log 17/(6.315 − 5.573412)) = 3.006·10¹⁰`. Route: Trudgian's
  route above with this region, the source's argument for large `x` and the rows of
  *FaberKadiriTable* below it; `ButheVerified` on `[1427, 10¹⁹]`, where `1.95 √x ≤ x ε_MT(x)` (at
  `x = 1427` the two are `73.7` and `195.7`, and `√x ε_MT(x)` increases); and
  *MossinghoffTrudgianRange* on `[149, 1427]`. The threshold is sharp: as `x → 149⁻`,
  `x − θ(x) → 149 − θ(139) = 22.356…`, above `149 ε_MT(149) = 22.339…`.
- Platt–Trudgian (`platt-trudgian-2021-error` lines 58–69, Theorem 1 and Corollary 1; lines 76–77,
  Corollary 2; `pnt-plus`, `ieantn`): under `RH(3 000 175 332 800)`, the classical-shape region with
  `R = 5.573412`, the zero-count error, the density bounds
  `N°(σ, T) ≤ C₁(σ) T^{8(1−σ)/3} log^{5−2σ} T + C₂(σ) log² T` for `T ≥ H₀` of
  `gap:explicit-zero-density` (ExplicitZetaBounds §8.3 at the paper's parameters,
  `platt-trudgian-2021-error` lines 131–141), the truncated explicit formula of §2.1 in its Dudek
  shape under that section's hypotheses (the paper's Lemma 1, lines 101–112, quotes Dudek's
  statement; for `log x ≥ 1000` and its `T = exp(2 √(log x/R))` the shape of §2.1 gives the same
  error), among them *PsiThetaUpper* `(1 + 1.93378·10⁻⁸, 1.04320, e⁴⁰)`, discharged in §3.7, and
  *PlattTrudgianTable*, by §3.1(d): for each row `(X, A, B, C, ε₀)`,
  `|ψ(x) − x| ≤ A (log x/R)^B exp(−C √(log x/R)) x` and `|ψ(x) − x| ≤ ε₀ x` for `log x ≥ X`;
  `|θ(x) − x| ≤ (A + 0.1)(log x/R)^B exp(−C √(log x/R)) x` on the same range, using
  `ψ(x) − θ(x) < (1 + 1.47·10⁻⁷) √x + 1.78 x^{1/3}` (line 69, taken from Dusart; for `log x ≥ 1000`
  it is the termwise route of §3.3, with `θ(√x) ≤ (1 + 1.93378·10⁻⁸) √x` from §3.7 and
  `∑_{k ≥ 3} θ(x^{1/k}) < 1.777745 x^{1/3}`, not the transfer of §0.3); and
  `|π(x) − li x| ≤ 235 x (log x)^{0.52} exp(−0.8 √log x)` for `log x ≥ 2000`. Every statement is for
  `log x ≥ 1000`, so no finite range is asserted.
- Johnston–Yang (`johnston-yang-2023` lines 57–72, Theorem 1.1, Corollaries 1.2–1.3; `pnt-plus`):
  under `RH(3 000 175 332 800)`, the classical-shape region with `R₀ = 5.5666305` (lines 221–235 and
  284), the region `ν₂` below for the rows with `X ≥ 10⁵` (lines 453–460), the zero-count error, the
  zero inputs *JohnstonYangDensityTable* and *JohnstonYangExplicitFormula* below,
  *JohnstonYangTable*, the hypotheses of *FioriKadiriSwidinskyPsiRow* (those of
  Fiori–Kadiri–Swidinsky's `ψ` bound below), `ButheVerified` and *JohnstonYangRange*:
  `|ψ(x) − x| ≤ 9.39 x (log x)^{1.515} exp(−0.8274 √log x)` for `x ≥ 2`; the rows
  `|ψ(x) − x| ≤ A x (log x)^B exp(−C √log x)` and `≤ ε₀ x` for `log x ≥ X`;
  `|θ(x) − x| ≤ (A + 0.01) x (log x)^B exp(−C √log x)` on the row's range; and
  `|π(x) − li x| ≤ 9.59 x (log x)^{0.515} exp(−0.8274 √log x)` for `x ≥ 2`. Route for the first
  bound: on `2 ≤ x < e^{2488}` it follows from *FioriKadiriSwidinskyPsiRow*, whose bound
  `9.22022 x (log x)^{3/2} exp(−0.8476836 √log x)` (the weaker of its two forms, §3.1) is at most
  the right side for every `x ≥ 2` (the ratio of the two is
  `(9.39/9.22022)(log x)^{0.015} exp(0.0202836 √log x) ≥ 1.0300`, increasing in `x` from its value
  at `x = 2`); this replaces the paper's own route on that range (lines 272–276), which uses tables
  not stated in this roadmap; for `x ≥ e^{2488}` it is §3.1(d) at the first row of
  *JohnstonYangTable* (lines 277–279). The rows with `3000 ≤ X ≤ 10 000` are §3.1(d) with the
  classical-shape region, and the rows with `X ≥ 10⁵` are §3.1(d) with the region `ν₂` and the
  single term `2 D(T)/T`, `T = min_{t ≥ H} t x^{ν₂(t)}`, at *JohnstonYangTable*; the `θ` forms add
  `ψ(x) − θ(x) ≤ 2 √x`; the `π` bound is §0.4 with `li` beyond `10¹⁹`, `ButheVerified` on
  `5 ≤ x ≤ 10¹⁹` (whose `π` clause is below the right side from `x = 4.43`) and *JohnstonYangRange*
  on `[2, 5]`.
- Fiori–Kadiri–Swidinsky for `ψ` (`fiori-kadiri-swidinsky-2023-psi`, J. Math. Anal. Appl. 527,
  Corollary 1.4; `pnt-plus`, `ieantn`), the headline of the classical-region shape: under
  `RH(3·10¹²)`, the classical-shape region with `R = 5.5666305`, the zero count, the zero input
  *FioriKadiriSwidinskyDensity* below, the truncated explicit formula of §2.1 in the range of their
  Proposition 3.4 (`x > e⁵⁰`, `3 log x < T < √x/3`, error `2 x log² x/T`) under that section's
  hypotheses, among them *PsiThetaUpper* `(1 + 1.93378·10⁻⁸, 1.04320, e⁴⁰)`, discharged in §3.7,
  *FioriKadiriSwidinskyPsiRow* and `ButheVerified`:
  `|ψ(x) − x| ≤ 9.22022 x (log x)^{3/2} exp(−0.8476836 √log x)` for `x ≥ 2`, and
  `|ψ(x) − x| ≤ 4.9678·10⁻¹⁵ x` for `log x ≥ 3000`. The journal and the latest arXiv text (v3) print
  `9.22022` and `4.9678·10⁻¹⁵`; the abstract of the arXiv listing, from an earlier version, prints
  `9.22106` and `4.47·10⁻¹⁵`. The first is the constant later papers quote (as in §2.6), and the
  stated bound with `9.22022` implies it; the second is stronger than what the latest text proves
  and is not stated. The bound is sharper than Johnston–Yang's first bound for every `x ≥ 2` and is
  the bound the `π` conversion below starts from. Route: the standard route with §3.1(d) in
  Fiori–Kadiri–Swidinsky's refinement (their Theorems 1.1–1.2), at the rows of
  *FioriKadiriSwidinskyPsiRow*.
- Fiori–Kadiri–Swidinsky for `π` (`fiori-kadiri-swidinsky-2023`, Res. Number Theory 9, lines
  159–176, Theorem 3; lines 700–707, Corollary 21; lines 712–726, Corollary 22; `pnt-plus`,
  `ieantn`): the general conversion of an admissible asymptotic `θ`-bound
  `|θ(x) − x| ≤ A_θ (log x/R)^B exp(−C √(log x/R)) x` on `[x₀, ∞)`, with
  `B ≥ max(3/2, 1 + C²/(16R))`, into the `π`-bound
  `|π(x) − Li x| ≤ (1 + μ) A_θ (log x/R)^B exp(−C √(log x/R)) x/log x` on `[x₁, ∞)`, for every
  `x₁ ≥ max(x₀, exp((1 + C/(2√R))²))`, with the explicit `μ = μ(x₀, x₁)` of their display (9) (the
  source measures `|π(x) − Li x|` against `x/log x`, lines 29–30 and 149). Starting from an
  admissible `ψ`-bound with constant `A_ψ`, their Proposition 13 gives `A_θ = (1 + ν) A_ψ` with
  `ν = ν(x₀)` of display (27) (lines 415–418), whence the factor `(1 + ν)(1 + μ)` of Corollary 21;
  and its instance under *FioriKadiriSwidinskyPsiRow* in its
  `(A_ψ, B, C, R) = (121.096, 3/2, 2, 5.5666305)` form, with the hypotheses of that row:
  `|π(x) − Li x| ≤ 9.2211 x √(log x) exp(−0.84768363 √log x)` for `x ≥ 2`. This is the headline `π`
  bound of the classical-region shape; Johnston–Yang's `9.59 x (log x)^{0.515} exp(−0.8274 √log x)`
  is kept as the older instance.

The region `ν₂` (`johnston-yang-2023` lines 244–258, Lemma 2.9), a theorem: with
`ν₂(t) = (1 − 8.02 log log t/log t)/(3.359 log t)`, given `RH(3 000 175 332 800)` and
*BrentPlattTrudgianRecord* (the hypotheses under which ExplicitZetaBounds §7.3 states the
`5.5666305` region; `RH(545 439 823)`, which Ford's region of its §7.2 needs, follows from the
first), `ζ` has no zero with `|γ| ≥ 3` and `β ≥ 1 − ν₂(|γ|)`. Route: for
`3 ≤ |γ| ≤ 3·10¹²`, `ν₂ ≤ 0.085 < 1/2` and the height gives it; for
`3·10¹² ≤ |γ| ≤ exp(91.2853)`, `ν₂(t) ≤ 1/(5.5666305 log t)` (with equality at `exp(91.2853)`) and
the classical-shape region of `gap:classical-zero-free-constants` gives it; for
`|γ| ≥ exp(91.2853)`, Ford's region of ExplicitZetaBounds §7.2 in its `log 0.618` form, valid from
`1.88·10¹⁴`, gives it, its width `(0.04962 − 0.0196/(J + 1.15))/(J + 0.685 + 0.155 log log t)` being
at least `ν₂(t)` there, an inequality between two explicit functions of `t` that the source proves
with `log 0.77` in `J` (lines 249–258): a smaller `J` widens the region, so the `log 0.618` form,
the one the supplier states, satisfies it a fortiori.

Zero inputs of this section:

- *JohnstonYangExplicitFormula* (`johnston-yang-2023` lines 165–187, Lemma 2.4): for every
  `x ≥ e¹⁰⁰⁰` and `T` with `max(50, log x) < T/1.8 < (x^{1/35} − 2)/4`, there is `T* ∈ [T/1.8, T]`
  with `|ψ(x) − x + ∑_{|γ| ≤ T*} x^ρ/ρ| ≤ 4.3128 x/(T log^{0.6} x)`. The paper takes it from an
  earlier version of `cully-hugill-johnston-2021` (the last row of its Table 5 there); the current
  version of that paper proves the sharp form of §2.1, with error of order `x log x/T`, and its
  sequel `cully-hugill-johnston-2025` an averaged form with error of order `x/T`; neither states an
  error of order `x/(T log^{0.6} x)`. It is therefore a named hypothesis of the Johnston–Yang
  instances, and the shape of §2.1 does not discharge it.
- *FioriKadiriSwidinskyDensity* (`fiori-kadiri-swidinsky-2023-psi` Theorem 2.7, Corollary 2.9 and
  Table 8, arXiv numbering): for every row `(σ₁, σ₂, c̃₁, c̃₂)` of the table, every `σ₁ ≤ σ ≤ σ₂`
  and every `T ≥ 3·10¹²`, `N°(σ, T) ≤ c̃₁ T^{8(1−σ)/3} (log T)^{5−2σ} + c̃₂ log² T`; in particular
  `(0.60, 0.65, 3.7669, 5.2954)` and `(0.89, 0.90, 12.0272, 2.9717)`. The rows are
  Kadiri–Lumley–Ng's bound at `H₀ = 3·10¹²`, `k = 1`, with `C₈(k, μ)` halved (after
  Cully-Hugill–Trudgian's divisor sum) and the subconvexity constant `0.77` in place of Hiary's
  `0.63`, so they are not ExplicitZetaBounds §8.3's closed forms, which that section states at every
  verification height. The parameters `(σ, α, δ, d)` behind each row, and the resulting constants,
  are those of their Tables 7–7′ (`H₀ = 3·10¹²`, `k = 1`, `μ = 1.2362`), at
  `σ ∈ {0.6, 0.7, 0.8, 0.9, 0.91, …, 0.999}`, and the proposition asserts their rows as well (their
  Theorem 2.7 and Remark 2.8; `pnt-plus`): for each row `(σ, α, δ, d, C₁, c₁, C₂, c₂)`, every
  `H ∈ [1002, 3·10¹²)` and every `T ≥ 3·10¹²`,
  `N°(σ, T) ≤ ((T − H) log T/(2πd)) log(1 + C₁ (log T)^{4 − 2σ} T^{8(1−σ)/3}/(T − H)) + C₂ log² T/(2πd)`
  and `N°(σ, T) ≤ c₁ T^{8(1−σ)/3} (log T)^{5−2σ} + c₂ log² T`, with `c_i = C_i/(2πd)` up to the
  rounding of `d`. Table 7, with the subconvexity constant `0.77`, has the rows
  `(0.600, 0.2745, 0.3089, 0.3411, 6.2364, 2.9101, 11.3289, 5.2863)`,
  `(0.700, 0.2166, 0.3088, 0.3398, 10.3372, 4.8414, 9.5857, 4.4894)`,
  `(0.800, 0.1594, 0.3089, 0.3382, 16.5703, 7.7978, 7.8423, 3.6905)`,
  `(0.900, 0.1041, 0.3092, 0.3360, 25.3876, 12.0272, 6.0986, 2.8891)`,
  `(0.910, 0.0988, 0.3093, 0.3357, 26.4101, 12.5219, 5.9242, 2.8088)`,
  `(0.920, 0.0935, 0.3094, 0.3354, 27.4551, 13.0286, 5.7497, 2.7285)`,
  `(0.930, 0.0883, 0.3094, 0.3351, 28.5212, 13.5467, 5.5753, 2.6481)`,
  `(0.940, 0.0831, 0.3095, 0.3348, 29.6068, 14.0756, 5.4009, 2.5677)`,
  `(0.950, 0.0780, 0.3096, 0.3344, 30.7097, 14.6145, 5.2264, 2.4872)`,
  `(0.960, 0.0730, 0.3098, 0.3341, 31.8278, 15.1623, 5.0520, 2.4067)`,
  `(0.970, 0.0681, 0.3099, 0.3337, 32.9584, 15.7180, 4.8775, 2.3261)`,
  `(0.980, 0.0633, 0.3101, 0.3333, 34.0986, 16.2804, 4.7031, 2.2455)`,
  `(0.990, 0.0586, 0.3103, 0.3329, 35.2449, 16.8481, 4.5286, 2.1648)`,
  `(0.991, 0.0582, 0.3103, 0.3329, 35.3598, 16.9051, 4.5111, 2.1567)`,
  `(0.992, 0.0577, 0.3103, 0.3329, 35.4746, 16.9621, 4.4937, 2.1486)`,
  `(0.993, 0.0572, 0.3103, 0.3328, 35.5895, 17.0192, 4.4762, 2.1406)`,
  `(0.994, 0.0568, 0.3103, 0.3328, 35.7044, 17.0762, 4.4588, 2.1325)`,
  `(0.995, 0.0563, 0.3104, 0.3327, 35.8193, 17.1334, 4.4413, 2.1244)`,
  `(0.996, 0.0559, 0.3104, 0.3327, 35.9342, 17.1905, 4.4239, 2.1163)`,
  `(0.997, 0.0554, 0.3104, 0.3326, 36.0492, 17.2477, 4.4064, 2.1083)`,
  `(0.998, 0.0550, 0.3104, 0.3326, 36.1641, 17.3049, 4.3890, 2.1002)` and
  `(0.999, 0.0545, 0.3104, 0.3326, 36.2790, 17.3621, 4.3715, 2.0921)`. Table 7′, the same
  computation with the subconvexity constant `0.618` of ExplicitZetaBounds §4.7 (Hiary–Patel–Yang,
  given `HiaryRecord` from `t = 3`), whose rows hold under `HiaryRecord` in addition, has the rows
  `(0.600, 0.2746, 0.3117, 0.3447, 4.3794, 2.0222, 11.3310, 5.2321)`,
  `(0.700, 0.2167, 0.3116, 0.3434, 7.9114, 3.6667, 9.5879, 4.4437)`,
  `(0.800, 0.1595, 0.3117, 0.3417, 13.8214, 6.4369, 7.8445, 3.6533)`,
  `(0.900, 0.1042, 0.3120, 0.3394, 23.0787, 10.8209, 6.1007, 2.8604)`,
  `(0.910, 0.0988, 0.3121, 0.3392, 24.2157, 11.3634, 5.9263, 2.7810)`,
  `(0.920, 0.0935, 0.3122, 0.3389, 25.3914, 11.9255, 5.7519, 2.7015)`,
  `(0.930, 0.0883, 0.3123, 0.3386, 26.6053, 12.5070, 5.5774, 2.6219)`,
  `(0.940, 0.0831, 0.3124, 0.3382, 27.8565, 13.1077, 5.4030, 2.5423)`,
  `(0.950, 0.0781, 0.3125, 0.3379, 29.1439, 13.7272, 5.2285, 2.4627)`,
  `(0.960, 0.0731, 0.3126, 0.3375, 30.4659, 14.3650, 5.0541, 2.3831)`,
  `(0.970, 0.0682, 0.3127, 0.3372, 31.8207, 15.0203, 4.8796, 2.3033)`,
  `(0.980, 0.0634, 0.3129, 0.3368, 33.2058, 15.6923, 4.7051, 2.2235)`,
  `(0.990, 0.0587, 0.3131, 0.3364, 34.6186, 16.3799, 4.5307, 2.1437)`,
  `(0.991, 0.0582, 0.3131, 0.3363, 34.7613, 16.4495, 4.5132, 2.1357)`,
  `(0.992, 0.0577, 0.3131, 0.3363, 34.9042, 16.5192, 4.4958, 2.1277)`,
  `(0.993, 0.0573, 0.3131, 0.3362, 35.0474, 16.5890, 4.4783, 2.1197)`,
  `(0.994, 0.0568, 0.3132, 0.3362, 35.1908, 16.6590, 4.4609, 2.1117)`,
  `(0.995, 0.0564, 0.3132, 0.3362, 35.3344, 16.7292, 4.4434, 2.1037)`,
  `(0.996, 0.0559, 0.3132, 0.3361, 35.4782, 16.7994, 4.4260, 2.0958)`,
  `(0.997, 0.0555, 0.3132, 0.3361, 35.6223, 16.8698, 4.4085, 2.0878)`,
  `(0.998, 0.0550, 0.3132, 0.3360, 35.7666, 16.9404, 4.3911, 2.0798)` and
  `(0.999, 0.0546, 0.3133, 0.3360, 35.9111, 17.0110, 4.3736, 2.0718)`.
- *JohnstonYangDensityTable* (`johnston-yang-2023` lines 204–217, Lemma 2.6, and lines 1049–1073,
  Table 3): for every row `(σ, C₁, C₂)` of the table, `σ` from `0.980` to `0.999` in steps of
  `0.001` and the limiting row `σ = 1`, and every `T ≥ 3 000 175 332 800`,
  `N°(σ, T) ≤ C₁ T^{8(1−σ)/3} (log T)^{5−2σ} + C₂ log² T`, and for every `σ` between two consecutive
  rows the same bound with `C₁` of the upper row and `C₂` of the lower one (the paper's use at lines
  441–445); in particular `(0.980, 16.281, 2.231)`, `(0.990, 16.848, 2.150)` and
  `(1, 17.418, 2.069)`. The rows are Kadiri–Lumley–Ng's bound at
  `H₀ = 3 000 175 332 800`, `k = 1`, `μ = 1.23623`, recomputed with two inputs changed (their bound
  (3.13) replaced by a later theorem, and Hiary's bound for `|ζ(1/2 + it)|` by the paper's (1.11),
  lines 208–213), so they are not ExplicitZetaBounds §8.3's closed forms at any parameters, and
  that roadmap leaves them to the theorem using them.

*Needs:* §3.1(b), (c), (d) and their table propositions; §2.1 (the truncated explicit formula, for
Platt–Trudgian and Fiori–Kadiri–Swidinsky); §3.2 (the argument of Schoenfeld's Theorem 11);
§§3.3, 3.7 (the `ψ − θ` bound of Platt–Trudgian's `θ` form, and *PsiThetaUpper*); §0.3; §0.4;
§0.5; §1.1; §1.3; `gap:rh-up-to-height`; `gap:classical-zero-free-constants`; ExplicitZetaBounds
§7.2 (Ford's region, for `ν₂`); ExplicitZetaBounds §5.2 (`gap:explicit-zero-count-error`);
ExplicitZetaBounds §§8.1, 8.3 (`gap:explicit-zero-density`); the zero inputs
*JohnstonYangDensityTable*, *JohnstonYangExplicitFormula* and *FioriKadiriSwidinskyDensity*.

### 3.4a The admissible shape, its conversions and the numerical π-transfer

Write `E_ψ(x) = |ψ(x) − x|/x`, `E_θ(x) = |θ(x) − x|/x` and `E_π(x) = |π(x) − Li x| log x/x` (the
normalisation of `fiori-kadiri-swidinsky-2023` (1)–(2), with the offset `Li`; `pnt-plus`, `ieantn`),
and `ε_{A,B,C,R}(x) = A (log x/R)^B exp(−C √(log x/R))`. An *admissible bound* for `E` with
parameters `(A, B, C, R, x₀)` is `E(x) ≤ ε_{A,B,C,R}(x)` for every `x ≥ x₀` (their Definitions 1 and
5); the rows of §§3.1, 3.4 and 3.6 are such bounds. Beside them, the normalised error of Riemann's
weighted count `π*(x) = ∑_{k ≥ 1} π(x^{1/k})/k` (§2.3) is `E_{π*}(x) = |π*(x) − Li x| log x/x`, also
against the offset `Li` (`ieantn`, `pnt-plus`).

- `E_{π*}` against `E_π`: for `x ≥ 2`,
  `0 ≤ π*(x) − π(x) = ∑_{k ≥ 2} π(x^{1/k})/k ≤ √x/2 + x^{1/3} log x/(3 log 2)` (each `π(y) ≤ y`, and
  the terms with `k > log x/log 2` vanish), so
  `|E_{π*}(x) − E_π(x)| ≤ (log x/x)(√x/2 + x^{1/3} log x/(3 log 2))`; and
  `π*(x) − Li x = (ψ(x) − x)/log x + ∫₂ˣ (ψ(t) − t)/(t log² t) dt + 2/log 2` for every `x ≥ 2`, from
  the half-weight identity of §0.6 (at `x = p^k` both `π*` and `ψ/log x` jump by `1/k`) and the
  formula for `Li` of §0.4, so that an admissible `ψ`-bound transfers to `E_{π*}` by the argument
  that §0.4 applies to `θ` and `E_π`, with no `ψ − θ` term.

- Monotonicity (their (16), Lemma 10 and Corollary 11; `pnt-plus`): for
  `g(x) = x^{−a} (log x)^b exp(c √log x)` and `x > 1`,
  `g′(x) = (−a log x + b + (c/2) √log x) x^{−a−1} (log x)^{b−1} exp(c √log x)`; hence `g` is
  strictly decreasing on `(1, ∞)` if `a > 0` and `b < −c²/(16a)`, and on
  `(exp((c/(4a) + √(c²/4 + 4ab)/(2a))²), ∞)` if `a > 0`, `c > 0` and `b ≥ −c²/(16a)`; `g` with
  `a = 0`, `b < 0 < c` is strictly decreasing on `(1, exp(4b²/c²))` (the source prints the condition
  on `√log x` with the inequality reversed); and for `R > 0` and `B > 1 + C²/(16R)`,
  `x ↦ (log x)^{1−B} exp((C/√R) √log x)/x` is strictly decreasing on `(1, ∞)`.
- Shape to constant: for `B ≥ 0` and `C > 0`, `ε_{A,B,C,R}` is nonincreasing on
  `[exp(R (2B/C)²), ∞)`, since `d/du log(u^B e^{−C√u}) = B/u − C/(2√u)` with `u = log x/R`; so an
  admissible bound from `x₀` gives `E(x) ≤ ε_{A,B,C,R}(x₁)` for every `x ≥ x₁ = max(x₀, exp(R (2B/C)²))`,
  which is how the constant columns `ε₀` of the tables of §§3.1 and 3.4 follow from their shape
  columns. In the same way (`broadbent-kadiri-lumley-ng-wilk-2021` Lemma 6; `pnt-plus`): if
  `E_θ(x) ≤ c₁ (log x)^{c₂} exp(−c₃ √log x)` for `x ≥ c₄`, with `c₁, …, c₄ > 0`, then for `k > 0` and
  `b ≥ max(log c₄, 4(c₂ + k)²/c₃²)`, `E_θ(x) ≤ c₁ b^{c₂+k} e^{−c₃√b}/log^k x` for every `x ≥ e^b`. The
  source prints the condition `b ≥ log(4(c₂ + k)²/c₃²)`, which does not suffice: `L^{c₂+k} e^{−c₃√L}`
  increases up to `L = 4(c₂ + k)²/c₃²`.
- From `ψ` to `θ` in the shape (their Corollary 14.1, `pnt-plus`; Fiori–Kadiri–Swidinsky's
  Proposition 13 is in §3.4): if `E_ψ(x) ≤ ε_{A,B,C,R}(x)` for `log x ≥ b₀`, with `b₀ ≥ 1000`,
  `B > 0`, `0 < C ≤ √(R b₀)` and `1 ≤ R ≤ 10`, then `E_θ(x) ≤ ε_{A′,B,C,R}(x)` for `log x ≥ b₀`,
  with `A′ = A + (R/b₀)^B e^{C √(b₀/R)} (a₁(b₀) e^{−b₀/2} + a₂(b₀) e^{−2b₀/3})` and `a₁`, `a₂` the
  constants of their Theorem 5 (§0.3, at the defaults of §3.7). Fiori–Kadiri–Swidinsky's instances
  (`fiori-kadiri-swidinsky-2023` Corollary 14 and Remark 15; `pnt-plus`, `ieantn`), under the
  hypotheses of *FioriKadiriSwidinskyPsiRow*: `E_θ(x) ≤ ε_{121.0961, 3/2, 2, 5.5666305}(x)` for
  every `x ≥ 2` (Proposition 13 from `e³⁰`, where `ν ≤ 6.3376·10⁻⁷`; below `e³⁰` the shape exceeds
  `1 ≥ E_θ`, by `0 ≤ θ(x) ≤ (log 4) x`), and, for `log x₀ ≥ 1000`,
  `E_θ(x) ≤ ε_{A(x₀)(1 + ν(x₀)), 3/2, 2, 5.5666305}(x)` for `x ≥ x₀`, with `A(x₀)` the step function
  of *FioriKadiriSwidinskyPsiRow* and `ν(x₀) ≤ 10⁻²⁰⁰`.
- From a pointwise `ψ`-input to `θ` (their Proposition 17; `pnt-plus`): for `x > x₀ > 2` with
  `E_ψ(x) ≤ ε_ψ(x₀)`, `−ε_θ(x₀) ≤ (θ(x) − x)/x ≤ ε_ψ(x₀)`, where
  `ε_θ(x₀) = ε_ψ(x₀) + 1.00000002 (x₀^{−1/2} + x₀^{−2/3} + x₀^{−4/5}) + 0.94 (x₀^{−3/4} + x₀^{−5/6} + x₀^{−9/10})`,
  under `ButheVerified` and *BKLNWPsiTable*. Route: `θ ≤ ψ` for the upper side; for the lower,
  Costa Pereira's comparison (Mathlib `Chebyshev.psi_sub_theta_le_psi_add_psi_add_psi`) with
  `ψ(y) ≤ 1.00000002 y + 0.94 √y` for every `y > 1`, which is
  `ψ(y) ≤ y` on `(1, 11]` (the integers up to `11`), `ButheVerified` on `(11, 10¹⁹]` and the row
  `ε(19 log 10) < 2·10⁻⁸` of *BKLNWPsiTable* beyond, at `y = x^{1/2}, x^{1/3}, x^{1/5}`, the
  resulting relative terms decreasing in `x`. It sharpens, for `x₀ > 2`, the transfer of §0.5 and
  the `k = 0` form of §3.7, whose constant is `1.03883` on all three terms.
- The integral of the shape (`fiori-kadiri-swidinsky-2023` (19), Lemma 12 and the remark after
  Corollary 11; `pnt-plus`): Dawson's function `D₊(y) = e^{−y²} ∫₀^y e^{t²} dt` has its maximum at a
  point of `[0.924, 0.925]` and decreases after it; and if `E_θ ≤ ε_{A,B,C,R}` on `[x₀, ∞)` with
  `x₀ ≥ 2`, `A ≥ 0`, `R > 0` and `√log x₀ ≥ C/(2√R)`, then for `x ≥ x₀`
  `∫_{x₀}^x E_θ(t)/log² t dt ≤ (2A/R^B) x max((log x₀)^{B−3/2}, (log x)^{B−3/2}) exp(−C √(log x/R)) D₊(√log x − C/(2√R))`.
  Route: `t = exp(u²)` turns the integral into
  `(2A/R^B) ∫ u^{2B−3} e^{(u − C/(2√R))² − C²/(4R)} du`; the power is at most its larger end value,
  and `∫_a^U e^{(u−a′)²} du ≤ e^{(U−a′)²} D₊(U − a′)`. With the transfer of §0.4 it gives the
  conversion of an admissible `θ`-bound into a `π`-bound stated in §3.4.
- The numerical `π`-transfer (their Theorem 6, (11)–(13), Remark 7 and Corollary 8; `pnt-plus`,
  `ieantn`): let `x₀ ≥ 2`, `x₁ ≥ max(x₀, 14)` and `log x₀ = b₀ < b₁ < ⋯ < b_N = log x₁` with
  `E_θ(x) ≤ ε_θ(e^{b_i})` for every `x ≥ e^{b_i}`. Then for every `x ≥ x₁`
  `E_π(x) ≤ ε_θ(x₁) + (log x/x)(x₀/log x₀)(E_π(x₀) + E_θ(x₀)) + (log x/x) ∑_{i<N} ε_θ(e^{b_i})(Li e^{b_{i+1}} − Li e^{b_i} + e^{b_i}/b_i − e^{b_{i+1}}/b_{i+1}) + ε_θ(x₁)(log x/x) ∫_{x₁}^x dt/log² t`
  (the combined-endpoint transfer and the partitioned integral of §0.4); for `x ≥ x₁ ≥ 14`,
  `(log x/x) ∫_{x₁}^x dt/log² t < 1/(log x₁ + log log x₁ − 1)`, and for `x₁ ≤ x ≤ x₂ ≤ x₁ log x₁` it
  is at most `(log x₂/x₂)(Li x₂ − x₂/log x₂ − Li x₁ + x₁/log x₁)`; hence
  `E_π(x) ≤ ε_{π,num}(x₀, x₁, x₂)` `= ε_θ(x₁)(1 + μ_num)` for `x₁ ≤ x ≤ x₂` (`x₂ = ∞` allowed), with
  `μ_num` the explicit quantity (11) for `x₂ ≤ x₁ log x₁` and (12) beyond, built from `δ(x₀)` of
  §0.4, the partition sum and the last bound (the value (11) is smaller, Remark 7); and over a
  subdivision `log x₁ = b′₀ < ⋯ < b′_M = ∞`,
  `E_π(x) ≤ max_{i < M} ε_{π,num}(x₀, e^{b′_i}, e^{b′_{i+1}})` for `x ≥ x₁` (Corollary 8).
- The tables, assumed (table proposition *FioriKadiriSwidinskyPiTables*,
  `fiori-kadiri-swidinsky-2023` Tables 4–7 and the ancillary data of Table 4; `pnt-plus`, `ieantn`):
  for each of the 208 rows `(b, ε)` of Table 4, from `b = 44` to `b = 10⁷`, the quantity of
  Corollary 8 at the paper's partition and `x₁ = e^b`, with the `θ`-inputs of §3.7 and
  *BKLNWPsiTable*, is at most `ε`, among them `(44, 1.7893·10⁻⁸)`, `(100, 2.0339·10⁻¹²)`,
  `(2000, 1.5701·10⁻¹²)` and `(10⁷, 1.0364·10⁻¹¹⁵³)`; for each of the 21 rows `(b, ε_asymp, ε_num)`
  of Table 5, `b = 100, 1000, 2000, …, 20 000`, the same with `ε_num`, and `ε_asymp` bounds the
  conversion of §3.4 at `(A_π, B, C) = (121.107, 3/2, 2)`; and the bounds of the rows of Tables 6
  and 7 dominate, on their ranges, the cell-wise values of Corollary 8 on the paper's subdivision of
  `[e¹⁰, e²⁰⁰⁰⁰]` and, below `10¹⁹`, the `π` clause of `ButheVerified`.
- Consequences, under *FioriKadiriSwidinskyPiTables*, the hypotheses of §3.7, `ButheVerified` and
  those of *FioriKadiriSwidinskyPsiRow* (their Corollaries 23, 24 and 26; `pnt-plus`, `ieantn`):
  - for each row `(A, B, C, log x₀)` of `(0.000120, 1/4, 1, 22.955)`, `(0.826, 1/4, 1, 1)`,
    `(1.41, 1/2, 1.5, 2)`, `(1.76, 1, 1.5, 3)`, `(2.22, 3/2, 1.5, 3)`, `(12.4, 3/2, 1.9, 1)`,
    `(38.8, 3/2, 1.95, 1)`, `(121.107, 3/2, 2, 1)` and `(6.60, 2, 2, 3)`,
    `E_π(x) ≤ ε_{A,B,C,5.5666305}(x)` for every `x ≥ x₀`;
  - `E_π(x) ≤ 2 log x/√x` for `1 ≤ log x ≤ 57`, `≤ (log x)^{3/2}/√x` for `1 ≤ log x ≤ 65.65`,
    `≤ log² x/(8π √x)` for `8 ≤ log x ≤ 60.8`, `≤ log² x/√x` for `1 ≤ log x ≤ 70.6`,
    `≤ log³ x/√x` for `1 ≤ log x ≤ 80`, `≤ x^{−1/3}` for `1 ≤ log x ≤ 80.55`, `≤ x^{−1/4}` for
    `1 ≤ log x ≤ 107.6`, `≤ x^{−1/5}` for `1 ≤ log x ≤ 134.8`, `≤ x^{−1/10}` for `1 ≤ log x ≤ 270.8`,
    `≤ x^{−1/50}` for `1 ≤ log x ≤ 1358.6` and `≤ x^{−1/100}` for `1 ≤ log x ≤ 3757.6`;
  - `|π(x) − Li x| ≤ 0.4298 x/log x` for every `x ≥ 2`, stated
    from the row `(0.826, 1/4, 1, 1)` above as its input. Route: for `x ≥ e` that row, whose shape is at most
    `0.826 (1/4)^{1/4} e^{−1/2} = 0.3543` (its maximum, at `log x = R/4`); for `2 ≤ x < e`,
    `π(x) = 1` and `0 ≤ Li x < 1`, so `E_π(x) ≤ log x/x ≤ 1/e`.

*Needs:* §§3.1, 3.4 (*FioriKadiriSwidinskyPsiRow*, Proposition 13 and Corollary 22), 3.7; §0.3
(the constants `a₁`, `a₂`); §0.4 (the combined-endpoint transfer and the partitioned integral);
§0.3a (`Li x − x/log x`); §1.3 (`ButheVerified`); Mathlib `Real.exp`, `Real.sqrt`, `Real.log`,
`HasDerivAt`, `intervalIntegral`; Tau Ceti `TauCeti.Real.logIntegral`.

**Checks.**

- The threshold of monotonicity is needed: `ε_{121.107, 3/2, 2, R}` increases from `2.63` at
  `x = 2` to about `20.4` at `log x = R (2B/C)² = 12.5` before decreasing, so a bound at `x₀ = 2` is
  not a bound by its value at `2`.
- At `(A, B, C) = (0.826, 1/4, 1)` the largest value of the shape is at `√(log x/R) = 2B/C = 1/2`,
  inside `x ≥ e`, and the constant `0.4298` exceeds it, as it must for a bound on all of `[2, ∞)`.

### 3.5 Bounds for π(x)

- Rosser–Schoenfeld (`rosser-schoenfeld-1962` lines 195–212, Theorems 1–2 and Corollaries 1–3;
  `pnt-plus`), under the hypotheses of §3.2 and *RosserSchoenfeld1962Range*. Theorem 1 for `x ≥ 59`
  is AnalyticNumberTheoryPartI §0.5 under *RosserSchoenfeldFiniteRangeInput*, which this section
  proves (below); the one item of Theorem 1 kept here is its upper half on the range that §0.5 there
  does not cover, `π(x) < (x/log x)(1 + 3/(2 log x))` for `1 < x < 59`. Further:
  `x/(log x − 1/2) < π(x)` for `x ≥ 67` and `π(x) < x/(log x − 3/2)` for `x > e^{3/2}`;
  `x/log x < π(x)` for `x ≥ 17` and `π(x) < 1.25506 x/log x` for `x > 1`; `π(x) < 5x/(4 log x)` for
  `1 < x < 113` and for `x ≥ 113.6`; and the upper half of Corollary 3,
  `0 < π(2x) − π(x) < 7x/(5 log x)` for `x > 1` (`rosser-schoenfeld-1962` lines 210–212).
- Dusart (`dusart-1998-thesis` lines 1418–1445, Théorème 1.10; `pnt-plus`), under the hypotheses of
  §3.3: `(x/log x)(1 + 1/log x) ≤ π(x)` for `x > 599`; `π(x) ≤ (x/log x)(1 + 1.2762/log x)` for
  `x > 1`; `π(x) ≤ (x/log x)(1 + 1.0992/log x)` for `x > 1.332·10¹⁰`; `π(x) ≤ x/(log x − 1.1)` for
  `x > 60 184`; `π(x) > x/(log x − 1)` for `x > 5393`; `(x/log x)(1 + 1/log x + 1.8/log² x) ≤ π(x)`
  for `x > 32 299`; `π(x) ≤ (x/log x)(1 + 1/log x + 2.51/log² x)` for `x > 355 991`. The later
  two-term forms (`dusart-2018`, Theorem 6.9 of the arXiv copy), under the hypotheses of §3.3 and
  *Dusart2018Range*: `(x/log x)(1 + 1/log x + 2/log² x) ≤ π(x)` for `x ≥ 88 789` (the copy prints
  `88 783`) and `π(x) ≤ (x/log x)(1 + 1/log x + 2.334/log² x)` for `x ≥ 2 953 652 287`; and the
  journal's further forms (Theorem 5.1, Corollaries 5.2–5.3), under the same hypotheses:
  `π(x) = (x/log x)(1 + 1/log x + 2/log² x + O*(7.32/log³ x))` for `x ≥ 4·10⁹`;
  `π(x) ≤ (x/log x)(1 + 1/log x + 2.53816/log² x)` for `x > 1`; `π(x) ≤ x/(log x − 1.112)` for
  `x > e^{1.112}`; `π(x) ≥ x/(log x − 1 − 1/log x)` for `x ≥ 468 049`; and
  `π(x) ≤ x/(log x − 1 − 1.2311/log x)` for `x > 5.6`. Route: the partial summation of §0.4 from
  `x₀ = 10¹¹` with the rows of §§3.3 and 3.7 (for the upper side of `7.32/log³ x`, sharper than
  `2.334/log² x` once `log x > 21.9`, the expansion of `Li` of §0.3a to the term `6x/log⁴ x` with
  the explicit remainder of its integrals); below `10¹¹`, for Théorème 1.10 `π(x) < li x` and the
  analytic comparison of the bounds with `li` on `[10⁸, 10¹¹]` and *DusartThesisRange* below `10⁸`,
  and for the forms of `dusart-2018` *Dusart2018Range*.
- Axler 2024, the headline (`axler-2024`, Integers 24, A34; journal Theorems 2–4 and Proposition 4,
  arXiv v4 Theorems 1.3–1.4 and Propositions 4.5, 5.3). Prove `axler_primeCounting_upper`: from the
  input `|θ(t) − t| < 0.024334 t/log³ t` for every `t ≥ 1 757 126 630 797`,
  `RiemannHypothesisUpTo 3 000 175 332 800`, `ButheVerified` and `Buthe2016Range` (the hypotheses
  of Johnston's range, §2.3) and `AxlerPrimeCountingUpperRange` (the bound itself for
  `48 ≤ x ≤ 10¹⁹`, §1.3), for every `x ≥ 48`,

  ```text
  π(x) < x/(log x − 1 − 1/log x − 3.024334/log² x − 12.975666/log³ x − 71.048668/log⁴ x
          − 461.364417856444/log⁵ x − 4331.1/log⁶ x).
  ```

  The input is Axler's `θ`-bound of §3.7, so the theorem holds under the tables of §3.7 and
  *Axler2024Range*. Route: on `[48, 10¹⁹]` `AxlerPrimeCountingUpperRange`; on `[10¹⁹, 10²⁶]`
  Johnston's
  `|π(x) − li x| ≤ √x log x/(8π)` (`johnston_of_riemannHypothesisUpTo` at
  `T = 3 000 175 332 800`, whose condition holds up to `1.101·10²⁶`), the bound exceeding `li x` by
  more than that; beyond `x₁ = 10²⁶`, the partial summation of §0.4 from `x₁`,
  `π(x) = π(x₁) − θ(x₁)/log x₁ + θ(x)/log x + ∫_{x₁}^x θ(t)/(t log² t) dt`, with Johnston's `π` and
  `θ` clauses at `x₁` and the input on `[x₁, ∞)`, which gives
  `π(x) ≤ li x + 0.024334 (x/log⁴ x + ∫_{x₁}^x dt/log⁵ t) + 2 √x₁ log x₁/(8π)`, below the bound for
  every `x ≥ x₁`. The coefficients `3.024334 = 3 + 0.024334`, `12.975666 = 13 − 0.024334`, … are
  Panaitopol's `k_m` perturbed by the `θ`-constant `0.024334`. Under the same `θ`-bound, the tables
  of §3.7, Johnston's range, `ButheVerified` and *Axler2024Range*, the paper's other three bounds:
  -
    `π(x) > x/(log x − 1 − 1/log x − 2.975666/log² x − 13.024334/log³ x − 70.951332/log⁴ x − 460.634397856444/log⁵ x − 3444.031844143556/log⁶ x)`
    for `x ≥ 1 751 189 194 177`;
  - `π(x) > x/(log x − 1 − 1/log x − 3/log² x)` for `x ≥ 65 405 887` (the journal's range; the
    arXiv v4 Proposition 5.3 proves it on `[65 405 887, e^{1697}]` and from `e^{2256}`);
  - `π(x) < x/(log x − 1 − 1/log x − 3/log² x − 70.935/log³ x)` for `x ≥ 29.53`.

  Route for these (the paper's §§4–5): Rosser–Schoenfeld's comparison function built on the
  `θ`-bound (the partial summation of §0.4 with `|θ(t) − t| < η t/log^k t`) where the bound differs
  from `li x` by more than `√x log x/(8π)`, Johnston's range below that point and up to
  `1.101·10²⁶`, and *Axler2024Range* below `10¹⁹`.
- Axler 2018 (`axler-2018`, Integers 18, A52, Theorems 1.2–1.3), under the `θ`-bound
  `|θ(x) − x| < 0.15 x/log³ x` for `x ≥ 19 035 709 163` (its Theorem 1.1, obtained there from the
  tables of `dusart-2018` and re-proved as Corollary 11.1 of `broadbent-kadiri-lumley-ng-wilk-2021`,
  §3.7) and *Axler2018Range*:
  `π(x) < x/(log x − 1 − 1/log x − 3.15/log² x − 12.85/log³ x − 71.3/log⁴ x − 463.2275/log⁵ x − 4585/log⁶ x)`
  for `x ≥ 49`, and the lower bound with `2.85, 13.15, 70.7, 458.7275, 3428.7225` for
  `x ≥ 19 033 744 403`. Its Corollary 3.4 repairs the proof of Theorem 1.3 of `axler-2016` (the
  third bound of the next item) for `x ≥ 10¹⁴`, where the original argument has an error, from its
  Theorem 3.2; the original proof on `[e^{3.804}, 10¹⁴]` stands. Route: Rosser–Schoenfeld's
  comparison function built on the `θ`-bound beyond `10¹⁹`, *Axler2018Range* below.
- Axler 2016 (`axler-2016` lines 31–48, Theorems 1.1–1.4), kept because on part of their ranges they
  are sharper than the 2024 forms, under *AxlerRange*, `ButheVerified`, *DusartThesisRange*
  and, as a hypothesis, Axler's `θ`-bound `|θ(x) − x| < 0.35 x/log³ x` for `x ≥ e³⁰` (his
  Proposition 3.3, lines 107–117, which he derives from the tables of `dusart-2018`;
  `broadbent-kadiri-lumley-ng-wilk-2021` lines 189–191 obtain the sharper constant `0.0244` on the
  same range): for `x > 1`,
  `π(x) < x/log x + x/log² x + 2x/log³ x + 6.35 x/log⁴ x + 24.35 x/log⁵ x + 121.75 x/log⁶ x + 730.5 x/log⁷ x + 6801.4 x/log⁸ x`;
  for `x ≥ 1 332 450 001` the lower bound with coefficients
  `1, 1, 2, 5.65, 23.65, 118.25, 709.5, 4966.5`; for `x ≥ e^{3.804}`,
  `π(x) < x/(log x − 1 − 1/log x − 3.35/log² x − 12.65/log³ x − 71.7/log⁴ x − 466.1275/log⁵ x − 3489.8225/log⁶ x)`;
  for `x ≥ 1 332 479 531` the lower bound with `2.65, 13.35, 70.3, 455.6275, 3404.4225`. Route (the
  paper's §3): for `x ≥ 10¹⁴`, Rosser–Schoenfeld's comparison function of `axler-2016` (13)–(14)
  built on the `θ`-bound above, with the values at `10¹⁴` and `8·10⁹` recorded in *AxlerRange*; for
  the upper bounds on `5·10⁵ ≤ x ≤ 10¹⁴` (Theorem 1.1) and `140 000 ≤ x ≤ 10¹⁴` (Theorem 1.3), the
  comparison with `li` and `π(x) < li x` from `ButheVerified`; for the lower bound of Theorem 1.4 on
  `8·10⁹ ≤ x ≤ 10¹⁴`, the comparison function with Dusart's `θ`-bounds; below, *AxlerRange*. For
  Theorem 1.3 and `x ≥ 10¹⁴` the route is that of `axler-2018` Corollary 3.4 (previous item). The
  hypothesis `0.35 x/log³ x` is discharged by §3.7's `0.024334`.
- The input *RosserSchoenfeldFiniteRangeInput* of AnalyticNumberTheoryPartI §0.5 (both halves of
  Theorem 1 for `59 ≤ x < exp 10000`): for `x > 599` it follows from Dusart's Théorème 1.10 below,
  whose lower constant `1/log x` exceeds `1/(2 log x)` and whose upper constant `1.2762` is below
  `3/2`; for `59 ≤ x ≤ 599` it is *RosserSchoenfeld1962Range*.
- Panaitopol's expansion (`panaitopol-2000` lines 17–22, Theorem 1; lines 94–95, 100–118, Theorem
  3): with `k₁, …, k_n` defined by `k_m + 1! k_{m−1} + 2! k_{m−2} + ⋯ + (m − 1)! k₁ = m · m!`
  (`k₁ = 1, k₂ = 3, k₃ = 13, k₄ = 71, k₅ = 461, k₆ = 3447`),
  `π(x) = x/(log x − 1 − k₁/log x − ⋯ − k_n (1 + α_n(x))/logⁿ x)` with `α_n(x) → 0`; an asymptotic
  statement, proved from `π(x) = Li x + O(x exp(−c √log x))` (ZerosOfLFunctions §8.5 at `K = ℚ`)
  and the expansion of `Li` (§8.9 there); `k_m` is the displayed determinant.
- Every `π − li` bound of §3.4 is listed there with its `ψ` source.
- Ramanujan's inequality, the criterion (`pnt-plus`, `ieantn`; `dudek-platt-2015` Lemma 2.1, as
  `platt-trudgian-2021-error` §5 uses it): let `x_a > 1` and `M`, `m` real with
  `π(x) < x ∑_{k=0}^{4} k!/log^{k+1} x + M x/log⁶ x` for every `x > e x_a` and
  `π(x) > x ∑_{k=0}^{4} k!/log^{k+1} x + m x/log⁶ x` for every `x > x_a`. With `L = log x` put
  `ε_M(x) = 72 + 2M + (2M + 132)/L + (4M + 288)/L² + (12M + 576)/L³ + 48M/L⁴ + M²/L⁵` and
  `ε′_m(x) = 206 + m′ + 364/L + 381/L² + 238/L³ + 97/L⁴ + 30/L⁵ + 8/L⁶`, where `m′ = m` if `m ≥ 0`
  and `m′ = (1 + 1/log x_a)⁶ m` if `m < 0`. Then for every `x > e x_a`
  `π(x)² < x² (1/L² + 2/L³ + 5/L⁴ + 16/L⁵ + 64/L⁶ + ε_M(x)/L⁷)` and
  `(ex/L) π(x/e) > x² (1/L² + 2/L³ + 5/L⁴ + 16/L⁵ + 65/L⁶ + ε′_m(x)/L⁷)`; hence, if `x₀ ≥ e x_a` and
  `ε_M(x) − ε′_m(x) < log x` for every `x > x₀`, then `π(x)² < (ex/log x) π(x/e)` for every
  `x > x₀`. Route: square the upper bound, and expand the lower bound at `x/e`, where
  `log(x/e) = L − 1`, in powers of `1/L` (`(L/(L − 1))⁶ ≤ (1 + 1/log x_a)⁶` there); the coefficients
  `1, 2, 5, 16` agree and the next ones are `64` and `65`, a difference of `x²/L⁶` that the
  remainders cannot overturn once `ε_M − ε′_m < L`.
- Ramanujan's inequality, the instance (`platt-trudgian-2021-error` Theorem 2; `pnt-plus`,
  `ieantn`): `π(x)² < (ex/log x) π(x/e)` for every `x > e³⁹¹⁵`, under *RamanujanThetaRange* (§1.3),
  the hypotheses of §2.3 at `T = 3 000 175 332 800`, of Trudgian's `θ` bound and of the
  Platt–Trudgian rows `X = 1000, 2000, 3000` (§3.4). These give the envelope
  `|θ(x) − x| ≤ x a(x)/log⁵ x` for every `x ≥ 2`, where `a(x)/log⁵ x` is `1 − (log 2)/3` on
  `[2, 599]`, `log² x/(8π √x)` on `(599, e⁵⁸)` (inside Büthe's range `x ≤ 2.169·10²⁵`), Trudgian's
  `ε₀(x)` on `[e⁵⁸, e¹¹⁶⁹)`, and `ε_{A, 1.52, 1.89, 5.573412}(x)` with `A = 462.0`, `411.5`, `379.7`
  (the rows' `A + 0.1`) on `[e¹¹⁶⁹, e²⁰⁰⁰)`, `[e²⁰⁰⁰, e³⁰⁰⁰)` and from `e³⁰⁰⁰`
  (`platt-trudgian-2021-error` (18)). Route: the one-sided transfer of §0.4 from `x₀ = 2` with this
  `a`; `∫₂ˣ dt/log² t` expanded by five integrations by parts (§0.3a), leaving
  `∫₂ˣ (720 + a(t))/log⁷ t dt`, split at `x_a = e³⁹¹⁴` and bounded with the explicit integral of
  §0.3a at `k = 7` and the monotonicity of `a` on `[x_a, ∞)` (there `a` is the shape of §3.4a with
  `B = 6.52`, `C = 1.89`, nonincreasing from `exp(5.573412 (2·6.52/1.89)²) = e^{265.3}`); this gives
  the criterion's two bounds at `x_a = e³⁹¹⁴` with `M = 1426` and `m = −1194`, and
  `ε_{1426}(x) − ε′_{−1194}(x) < log x` for `x > e³⁹¹⁵`, the difference being `3914.5` at `e³⁹¹⁵`
  and decreasing.
- The five-term bound behind it (`ieantn`, `pnt-plus`): with `P₄(x) = x ∑_{k=0}^{4} k!/log^{k+1} x`,
  `P₄(x) − 1194 x/log⁶ x < π(x) < P₄(x) + 1426 x/log⁶ x` for every `x > e³⁹¹⁴`, both sides from the
  same point; under the hypotheses of the previous item for the lower side on all of that range and
  for the upper side from `e³⁹¹⁵`, and, for the upper side on `(e³⁹¹⁴, e³⁹¹⁵]`, under in addition
  those of *FioriKadiriSwidinskyPsiRow* (§3.1). Route: the one-sided transfer of the previous item
  at `x` itself, which gives
  `(120 − a(x)) x/log⁶ x + ∫₂ˣ (720 − a(t))/log⁷ t dt ≤ π(x) − P₄(x) ≤ (120 + a(x)) x/log⁶ x + ∫₂ˣ (720 + a(t))/log⁷ t dt`
  up to the boundary terms at `2` of the five integrations by parts, which have the favourable sign;
  with `a` nonincreasing from `e^{265.3}`, the coefficient of `x/log⁶ x` is at least
  `120 − a(e³⁹¹⁴) − 1 = −1191.3…` on the lower side and at most `120 + a(x) + 1` on the upper side,
  which is below `1426` from `e³⁹¹⁵` (`a(e³⁹¹⁵) = 1304.1…`) but not at `e³⁹¹⁴`
  (`a(e³⁹¹⁴) = 1310.3…`). On `(e³⁹¹⁴, e³⁹¹⁵]` the envelope `a` is replaced there by the `θ`-bound
  `E_θ ≤ ε_{121.0961, 3/2, 2, 5.5666305}` of §3.4a (Fiori–Kadiri–Swidinsky's Corollary 14), which
  gives `a ≤ 19.3` on that range, so the coefficient is below `141`. The criterion of the previous
  item needs the upper half only from `e³⁹¹⁵`. Corollaries: Dudek–Platt's pairs
  `P₄(x) − 3103.33 x/log⁶ x < π(x) < P₄(x) + 3343.48 x/log⁶ x` for `x > e^{9656.8}`
  (`dudek-platt-2015` §2, at `a = 3223`) and the same with `(−3010.333, 3250.488)` for
  `x > e^{9400}` (its (8)–(9) at the parameter `a = 3130` of its footnote 1), since
  `−3103.33 < −3010.333 < −1194` and `3343.48 > 3250.488 > 1426`.
- Ramanujan's inequality under the Riemann hypothesis, sharp (`dudek-platt-2015` Theorem 1.3;
  `ieantn`): prove `ramanujan_largest_counterexample`, that under `RiemannHypothesis`,
  `ButheVerified`, `Schoenfeld1976Range` and `DudekPlattRange` (§1.3), `π(n)² < (e n/log n) π(n/e)`
  fails at `n = 38 358 837 682` and holds at every integer `n > 38 358 837 682`; so `38 358 837 682`
  is the largest integer at which it fails. Route (the paper's §3): with
  `f(x) = π(x)² − (e x/log x) π(x/e)`, Schoenfeld's `π(y) > li y − √y log y/(8π)` for `y > 2657`
  (§2.2) at `y = x/e` and `π(x) < li x` from `ButheVerified` give `f(x) < g(x)` with
  `g(x) = li²(x) − (e x/log x)(li(x/e) − √(x/e)(log x − 1)/(8π))` for `2657 e < x ≤ 10¹⁹`; `g` is
  decreasing for `x ≥ 10¹⁶` and `g(1.15·10¹⁶) < 0` (`−3.211·10¹⁹`), so `f < 0` on
  `[1.15·10¹⁶, 10¹⁹]`; beyond `10¹⁹`, Hassani's argument, which the paper quotes as its Theorem 1.1
  (`f < 0` for `x ≥ 138 766 146 692 471 228` under the Riemann hypothesis): Schoenfeld's two-sided
  bound at `x` and at `x/e` and the expansion of `li` (§0.3a), the main terms of
  `li² x − (e x/log x) li(x/e)` differing by about `−x²/log⁶ x` (the coefficients `64` and `65` of
  the criterion) against errors of order `x^{3/2}`; the integers up to `1.15·10¹⁶`, and the failure,
  are `DudekPlattRange`.

*Needs:* §3.2; §3.3; §3.4; §3.4a; §3.7; §2.3 (Johnston's range, and Büthe's bound for the
envelope); §2.2 (Schoenfeld's bounds under the Riemann hypothesis, for Ramanujan's inequality
under it); §0.3a; §0.4; §1.3 (with `DudekPlattRange`); AnalyticNumberTheoryPartI §0.5 (the
statement of *RosserSchoenfeldFiniteRangeInput*); ZerosOfLFunctions §§8.5, 8.9; Mathlib
`RiemannHypothesis`.

### 3.6 Bounds from a Vinogradov–Korobov region

Under `RH(3 000 175 332 800)`, the region of `gap:vinogradov-korobov-constants` (constant
`57.54`), the zero-count error, the zero inputs *JohnstonYangDensityTable* and
*JohnstonYangExplicitFormula* of §3.4, the table proposition *JohnstonYangVKRow* below, the
hypotheses of Johnston–Yang's Theorem 1.1 in §3.4 (among them the classical-shape region with
`R₀ = 5.5666305`, the region `ν₂` and *JohnstonYangTable*), *PsiThetaUpper* (§3.7),
*BKLNWPsiTable*, `ButheVerified` and *JohnstonYangRange* (`johnston-yang-2023` lines 77–80,
Theorem 1.4; `pnt-plus`), the refereed statement of this section:
`|ψ(x) − x| ≤ 0.026 x (log x)^{1.801} exp(−0.1853 (log x)^{3/5} (log log x)^{−1/5})` for `x ≥ 23`,
`|θ(x) − x| ≤ 0.027 x (log x)^{1.801} exp(−0.1853 (log x)^{3/5} (log log x)^{−1/5})` for `x ≥ 59`,
`|π(x) − li x| ≤ 0.028 x (log x)^{0.801} exp(−0.1853 (log x)^{3/5} (log log x)^{−1/5})` for `x ≥ 71`
(the paper's display prints `π(x) − x` for the last; the statement is the one with `li`, and its
range `x ≥ 71` is the one `axler-2024` (1.10) records). Below `59` and `71` the `θ` and `π` forms
fail, so the common threshold `23` holds for `ψ` only. Route (lines 638–729): for
`x ≥ exp(2.8·10¹⁰)`, §3.1(d) with the Vinogradov–Korobov region, `σ = 0.9999932`, the density
*JohnstonYangDensityTable* (between its rows `0.999` and `1`, with `C₁` of the row `1` and `C₂` of
the row `0.999`), the error of *JohnstonYangExplicitFormula* and the single term `2 D(T)/T` with
`T = min_{t ≥ H} t x^{ν₃(t)}`, `ν₃(t) = 1/(57.54 (log t)^{2/3} (log log t)^{1/3})`, at
*JohnstonYangVKRow*; on `[e⁵⁹, exp(2.8·10¹⁰)]` the rows of
Johnston–Yang's Theorem 1.1 (§3.4), the best of which is below the `ψ` bound there (lines 81–84);
on `[59, 2.169·10²⁵]` the bound `√x log² x/(8π)` of §2.3 under `RH(3·10¹²)`, and up to `e⁵⁹` the rows
of *BKLNWPsiTable*; on `[23, 59)` *JohnstonYangRange*. The `θ` form adds *PsiThetaUpper* beyond
`e⁵⁸` and takes the `θ` bound of §2.3 on `(599, e⁵⁸]` and *JohnstonYangRange* on `[59, 599]`; the
`π` form is §0.4 with `li` beyond `e⁵⁸`, the `π` bound of §2.3 on `(2657, e⁵⁸]` and
*JohnstonYangRange* on `[71, 2657]`.

The shape, as a predicate (`ieantn`, `pnt-plus`): for an arbitrary error function `E : ℝ → ℝ` and
real `A`, `B`, `C`, `x₀`, a *Vinogradov–Korobov bound* for `E` with parameters `(A, B, C, x₀)` is
`E(x) ≤ A (log x)^B exp(−C (log x)^{3/5} (log log x)^{−1/5})` for every `x ≥ x₀`, beside the
admissible shape of §3.4a. It is monotone in its parameters on `x₀ ≥ e^e` (a larger `A`, a larger
`B`, a smaller `C ≥ 0` or a larger `x₀` gives a weaker bound, `log x ≥ 1` and `log log x ≥ 1`
there), and the function `(log x)^B exp(−C (log x)^{3/5} (log log x)^{−1/5})` is eventually
decreasing for `C > 0`, so a bound from `x₀` gives the constant bound `E(x) ≤ ε` from the point
where it decreases, as in §3.4a. The statements of this section are instances: with `E_ψ` and `E_θ`
of §3.4a, a Vinogradov–Korobov bound for `E_ψ` with `(0.026, 1.801, 0.1853, 23)` and for `E_θ` with
`(0.027, 1.801, 0.1853, 59)`, and for `E(x) = |π(x) − li x| log x/x` with
`(0.028, 1.801, 0.1853, 71)`.

Table proposition of this section: *JohnstonYangVKRow* (`johnston-yang-2023` lines 648–701): with
the parameters of that route and `B₂`, `B₃` of the paper's Lemmas A.3–A.4, the relative error
function `s₁ + s₂ + ε₁` of §3.1(d) is at most
`0.026 (log x)^{1.801} exp(−0.1853 (log x)^{3/5} (log log x)^{−1/5})` for every
`x ≥ exp(2.8·10¹⁰)`.

Fiori–Jaskari (`fiori-jaskari-2026` Theorem 1.1, *(preprint)*), under `RH(3 000 175 332 800)` and
the Vinogradov–Korobov-type region and zero-density inputs of that paper, taken with the paper's
constants as parameters of `gap:vinogradov-korobov-constants` and `gap:explicit-zero-density`: for
every `x₀ ≥ e³` there is an explicit `L(x₀)`, with `L(e³) = 0.239` and `L(e⁵⁰⁰⁰) = 8.638·10⁻¹¹`,
such that for `x ≥ x₀`
`|ψ(x) − x| < L(x₀) x exp(−0.1982767 (1 + log log log x/(15 log log x)) (log x)^{3/5} (log log x)^{−1/5})`.
It sharpens Johnston–Yang's `ψ` form for `log x ≥ 10` and the classical-region bound of §3.4 for
`log x ≥ 7.6·10⁸`; it is stated beside Johnston–Yang's, not in its place. The same paper's
conditional bounds that assume the zero-free half-plane `Re s > 7/8` are not stated (Scope).

*Needs:* §3.1(d) with the Vinogradov–Korobov region in place of the classical one; §3.4 (the
rows of Theorem 1.1, *JohnstonYangDensityTable*, *JohnstonYangExplicitFormula*); §2.3; §3.1
(*BKLNWPsiTable*); §3.7 (*PsiThetaUpper*); §1.3 (`ButheVerified`, *JohnstonYangRange*);
`gap:rh-up-to-height`; `gap:vinogradov-korobov-constants`; `gap:explicit-zero-count-error`;
§0.3; §0.4.

**Checks.**

- A statement with `π(x) − x` on the left would be false at every large `x` (the difference is
  about `−x`).

### 3.7 The θ-tables of Broadbent–Kadiri–Lumley–Ng–Wilk and Axler's θ-bound

Under `RH(3 000 175 332 800)`, the classical-shape region with `R = 5.573412`, the zero count, the
density bounds of `gap:explicit-zero-density`, the hypotheses of the truncated explicit formula of
§2.1 other than *PsiThetaUpper* (the classical-shape region with `R₀ = 5.5666305`, Ford's region of
ExplicitZetaBounds §7.2 for `t ≥ 1.88·10¹⁴` and the region of `gap:vinogradov-korobov-constants`),
which the rows `b ≥ 2500` of *BKLNWPsiTable* use, `ZetaZeroCubeSum` (§1.1) and the absence of zeros
with `0 < Re s < 1` and `|Im s| ≤ 14` (`gap:rh-up-to-height`), which §3.1(a) uses in the discharge
of *PsiThetaUpper* below, *BKLNWPsiTable* (§3.1), *BKLNWThetaTables* below, `ButheVerified` and
*BKLNWRange* (`broadbent-kadiri-lumley-ng-wilk-2021`, arXiv v2: Theorem 1, Corollaries 2.1, 5.1 and
11.1, Tables 8, 14, 15; `pnt-plus`, `ieantn`). These are *the hypotheses of §3.7*; a statement
elsewhere that holds "under the tables of §3.7" or "under the `θ`-bounds of §3.7" carries all of
them.

- The general form (Theorem 1): for `0 ≤ k ≤ 5` and every `X ≥ 1` there are explicit `m_k(X)`,
  `M_k(X)` with `x (1 − m_k/log^k x) ≤ θ(x)` and `θ(x) ≤ x (1 + M_k/log^k x)` for `x ≥ X`, given
  by the paper's formulas in the rows `ε(b)` of the `ψ`-table: for `k = 0` and `X ≥ e²⁰`,
  `M₀ = ε(log X)` and
  `m₀ = ε(log X) + 1.03883 (X^{−1/2} + X^{−2/3} + X^{−4/5})`.
- Instances: `−1.9667·10⁻⁸ x < θ(x) − x < 1.9338·10⁻⁸ x` for `x ≥ 10¹⁹`;
  `|θ(x) − x| < 3.7979·10⁻⁵ x/log² x` for `x ≥ 10¹⁹`; `|θ(x) − x| < 0.024334 x/log³ x` for
  `x ≥ e²⁹`; `|θ(x) − x| < 57.184 x/log⁴ x` for `x ≥ 2·10¹¹`; and the Corollary 11.1 pair (lines
  927–940): `θ(x) − x < 0.024334 x/log³ x` for `x > 1` and `x − θ(x) < 0.15 x/log³ x` for
  `x ≥ 19 035 709 163`.
- `θ(x) ≤ (1 + 1.93378·10⁻⁸) x` for every `x > 0` (Corollary 2.1): `θ(x) < x` up to `10¹⁹` by
  `ButheVerified`, and `ε(19 log 10) = 1.93378·10⁻⁸` from the row `b = 40` of Table 8 beyond.
- `ψ(x) − θ(x) < a₁(b) √x + a₂(b) x^{1/3}` for `x ≥ e^b`, `b ≥ 7` (Corollary 5.1), with
  `a₁ = 1 + 1.93378·10⁻⁸` for `b ≤ 38 log 10` and `a₂(b)` the explicit value of the paper's (2.12),
  for instance `a₂(20) = 1.4263`, `a₂(30) = 1.1211`, `a₂(40) = 1.04320`, `a₂(50) = 1.01718`. At
  `b = 40` this is *PsiThetaUpper* of §2.2, which is discharged here: Lee–Nosal's `θ` bound holds
  under `RiemannHypothesis` and the inputs of this section, and the truncated explicit formula of
  §2.1, which takes it as a hypothesis, holds under them too. The discharge uses no row that rests
  on §2.1: it needs only `θ(y) ≤ (1 + 1.93378·10⁻⁸) y` for every `y > 0`, which comes from
  `ButheVerified` up to `10¹⁹`, from the rows `b ≤ 2000` of *BKLNWPsiTable* (Büthe's theorem of
  §2.3, valid up to `e²⁵⁰⁰`) and, beyond `e²⁵⁰⁰`, from §3.1(a) with `R = 5.69693` (under
  `ZetaZeroCubeSum` and the absence of zeros up to height `14`), whose
  `ε_R(x)` is below `1.93378·10⁻⁸` for `x ≥ e²⁵⁰⁰`. The rows `b ≥ 2500`, which use §2.1 through
  §3.1(d), are therefore not inputs of their own input.
- Axler's bound (`axler-2024` Proposition 1.1 of arXiv v4, journal Proposition 1), under the
  above and *Axler2024Range*: `|θ(x) − x| < 0.024334 x/log³ x` for every `x ≥ 1 757 126 630 797`.
  Route: Table 15's row from `e²⁹` and *Axler2024Range* on `[1 757 126 630 797, e²⁹]`.

- The values of `a₂(b) = (1 + 1.93378·10⁻⁸) max(f(e^b), f(2^{⌊b/log 2⌋ + 1}))` (§0.3) at the paper's
  points (the table after its Corollary 5.1): `a₂(b) ≤ u` for `(b, u)` equal to `(20, 1.4263)`,
  `(25, 1.2196)`, `(30, 1.1211)`, `(35, 1.07087)`, `(40, 1.04320)`, `(43, 1.03253)`,
  `(50, 1.01718)`, `(100, 1 + 2.421·10⁻⁴)`, `(150, 1 + 3.749·10⁻⁶)`, `(200, 1 + 7.712·10⁻⁸)`,
  `(250, 1 + 2.024·10⁻⁸)` and `(300, 1 + 1.936·10⁻⁸)` (arXiv v2, lines 509–512). The printed
  `1.07086` at `b = 35` is below the formula's `1.0708607`, so `1.07087` is stated; every other
  printed value is at least the formula's (`a₂(200) = 1 + 7.7118·10⁻⁸`,
  `a₂(300) = 1 + 1.9352·10⁻⁸`).
- The strip constants (the paper's Lemma 8, (3.11) and Corollary 8.1): for `1 ≤ k ≤ 5` and `b < b′`
  with `b ≥ max(7, 2k)`, `|θ(x) − x| ≤ B_k(b, b′) x/log^k x` for `e^b ≤ x ≤ e^{b′}`, where
  `B_k(b, b′) = sup_{e^b ≤ x ≤ e^{b′}} log^k x (a₁(b) x^{−1/2} + a₂(b) x^{−2/3} + ε(b))`, with `ε` the rows of
  *BKLNWPsiTable* and `a₁`, `a₂` those of §0.3; since `L^k e^{−L/2}` and `L^k e^{−2L/3}` decrease for
  `L ≥ 2k`, `B_k(b, b′) ≤ b^k (a₁(b) e^{−b/2} + a₂(b) e^{−2b/3}) + b′^k ε(b)`. Route:
  `θ = ψ − (ψ − θ)` with Theorem 5 of §0.3 and the row at `b`. Over the paper's subdivision of
  `[e²⁰, e²⁵⁰⁰⁰]` the maximum of the `B_k` from `b₀` on bounds `|θ(x) − x| log^k x/x` on
  `[e^{b₀}, e²⁵⁰⁰⁰]` (Corollary 8.1).
- Lower bounds from the finer data (the paper's Lemma 9, its table from Büthe and Corollary 9.1): if
  `1 ≤ u < v`, `−c ≤ (x − ψ(x))/√x ≤ C` on `[u, v]` and `ψ(x) ≤ c₀ x` for every `x > 0`, then
  `θ(x) ≥ x − (C + 1) √x − c₀ x^{1/3} − c x^{1/4} − c₀ x^{1/5}` for `u² ≤ x ≤ v`, from
  `θ(x) ≥ ψ(x) − ψ(√x) − ψ(x^{1/3}) − ψ(x^{1/5})` (Costa Pereira's comparison, Mathlib
  `Chebyshev.psi_sub_theta_le_psi_add_psi_add_psi`). With
  `c₀ = 1.03883` and the rows `(u, v, c, C) = (100, 5·10¹⁰, 0.8, 0.81)`, `(100, 3.2·10¹³, 0.88, 0.86)`
  (*ButheFinerRange*) and `(100, 10¹⁹, 0.94, 0.94)` (`ButheVerified`): for `k ≥ 1` and
  `max(10⁴, e^{2k}) ≤ e^b ≤ v`, `θ(x) ≥ x − 𝒞_{b,k} x/log^k x` for `e^b ≤ x ≤ v`, with
  `𝒞_{b,k} = b^k ((C + 1) e^{−b/2} + c₀ e^{−2b/3} + c e^{−3b/4} + c₀ e^{−4b/5})`.
- `|ψ(x) − x| ≤ max(c e^{−b/2}, ε(log B)) x` for every `x ≥ e^b`, whenever `|ψ(y) − y| ≤ c √y` on
  `(B₀, B]`, `e^b ∈ (B₀, B]` and `ε` is the row function of a `ψ`-table (the paper's Lemma 15); at
  `(B₀, B, c) = (11, 10¹⁹, 0.94)`, `|ψ(x) − x| ≤ max(0.94 e^{−b/2}, 1.93378·10⁻⁸) x` for `x ≥ e^b` and
  `log 11 < b ≤ 19 log 10` (its Corollary 15.1), from `ButheVerified` and the row `ε(19 log 10)` of
  *BKLNWPsiTable*.

Route of the tables (the paper's §3): beyond `10¹⁹`, `θ = ψ − (ψ − θ)` with *BKLNWPsiTable* and the
`ψ − θ` bound above; below `10¹⁹`, `θ(x) < x` and `x − θ(x) ≤ 1.95 √x` from `ButheVerified`, and
*BKLNWRange* at the start of each row.

Table propositions of this section:

- *BKLNWThetaTables*: for each row `(log X, m_k, M_k)`, the `m_k(X)`, `M_k(X)` of Theorem 1 given by
  *BKLNWPsiTable* are at most the row's values; among the rows, `log X = 19 log 10`
  (`M₀ = 1.9338·10⁻⁸`, `m₀ = 1.9667·10⁻⁸`; `m₂ = M₂ = 3.7979·10⁻⁵`), `log X = 29`
  (`m₃ = M₃ = 0.024334`) and `X = 2·10¹¹` (`m₄ = M₄ = 57.184`) (`broadbent-kadiri-lumley-ng-wilk-2021`
  Tables 14–15, arXiv v2).
- *BKLNWStripTables*: for each of the 287 rows `(b, B₁, …, B₅)` of the paper's Table 10 and each
  `1 ≤ k ≤ 5`, `B_k(b, b⁺) ≤ 1.002001 B_k`, with `b⁺` the next row's `b` (and `25 000` after the
  last), among them `(20, 1.8077·10⁻³, 3.6154·10⁻², 0.72309, 14.462, 291.60)` and
  `(43, 8.5986·10⁻⁷, 3.7618·10⁻⁵, 1.6458·10⁻³, 0.072000, 3.1500)`; and for each of the 43 rows
  `(b₀, B₁, …, B₅)` of its Table 11, `1.003003001 B_k` is at least the strip constants of Table 10
  at its rows `b ≥ max(b₀, 19 log 10)` and, below `10¹⁹`, the constants of *BKLNWLowerThetaTable* at
  its rows `b ≥ b₀` (with `θ(x) < x` there), among them
  `(20, 1.6844·10⁻³, 3.3688·10⁻², 0.67375, 57.184, 1.3441·10⁵)`. The factors absorb the rounding of
  the printed values (Table 11 at `b₀ = 44` is one unit in the last place above Table 10's value).
  Table 10 evaluates the supremum `B_k`, not its closed upper bound, which is larger (at `b = 20`,
  `k = 5` it is `326.9` against `291.60`). Consequence, under the hypotheses of this section,
  *BKLNWStripTables*, *BKLNWLowerThetaTable* and *ButheFinerRange*: for each row of Table 11,
  `|θ(x) − x| ≤ 1.003003001 B_k x/log^k x` for `e^{b₀} ≤ x ≤ e²⁵⁰⁰⁰` (the paper's Table 11), from the
  strips above `10¹⁹` and the lower bounds of Corollary 9.1 below.
- *BKLNWLowerThetaTable*: for each of the 26 rows `(b, C₁, …, C₅)` of the paper's Table 12, with the
  row `(c, C, v)` of its block, `𝒞_{b,k} ≤ C_k` for `1 ≤ k ≤ 5`, among them
  `(20, 1.68440·10⁻³, 3.36880·10⁻², 0.673750, 13.4750, 269.500)` in the block `(0.8, 0.81, 5·10¹⁰)` and
  `(43, 3.83820·10⁻⁸, 1.65050·10⁻⁶, 7.09680·10⁻⁵, 3.05170·10⁻³, 0.131220)` in the block
  `(0.94, 0.94, 10¹⁹)`; the rows at `b = log(5·10¹⁰)`, `25`, `log(3.2·10¹³)` and `32`, and the entries
  `k = 3, 4, 5` at `b = 31`, are taken at the values of the closed form, which exceed the printed
  ones (at `b = 25` the closed form in the block `(0.88, 0.86)` gives `C₁ = 1.75002·10⁻⁴`, the printed
  `1.70330·10⁻⁴` being the value with the constants of the first block).

*Needs:* §3.1(a), (d) and *BKLNWPsiTable*; §2.3 (Büthe's general theorem); §2.1 (for the rows
`b ≥ 2500`, with its hypotheses: ExplicitZetaBounds §7.2, `gap:vinogradov-korobov-constants`);
§0.3 (the general-input bounds); Mathlib `Chebyshev.psi_sub_theta_le_psi_add_psi_add_psi`; §1.1
(`ZetaZeroCubeSum`); §1.3
(`ButheVerified`, *ButheFinerRange*, *BKLNWRange*, *Axler2024Range*);
`gap:rh-up-to-height` (with the absence of zeros up to height `14`);
`gap:classical-zero-free-constants`; `gap:explicit-zero-count-error`; `gap:explicit-zero-density`.

**Checks.**

- `θ(x) ≤ (1 + 1.93378·10⁻⁸) x` implies Dusart's `θ(x) − x < x/36 260` (§3.3) and Schoenfeld's
  `θ(x) < 1.000081 x` (AnalyticNumberTheoryPartI §0.3); it does not imply `θ(x) < x`, which fails
  for some `x` (Littlewood).

### 3.8 A bound of the shape x/log⁴ x for ψ *(preprint)*

`|ψ(x) − x| ≤ 34.409 x/log⁴ x` for every `x ≥ 69 997` (`chirre-helfgott-2025` (10.3),
*(preprint)*, which prints the threshold `69 991`; `pnt-plus`), under
`RH(3 000 175 332 800)`, the hypotheses of the Fiori–Kadiri–Swidinsky `ψ` bound of §3.4,
`ButheVerified` and *ChirreHelfgottRange*. Route: *ChirreHelfgottRange* on `[69 997, 10⁶]`;
`ButheVerified` on `[977 515, 10¹⁹]`; the instance of §2.6 on `[10¹⁹, e^{2394.19}]`, where
`π/(3·10¹²) + 113.67/√x ≤ 34.409/log⁴ x`; and Fiori–Kadiri–Swidinsky's
`9.22022 x (log x)^{3/2} exp(−0.8476836 √log x)` beyond, where it is at most `34.409 x/log⁴ x`. The
refereed bounds of the same shape are §3.3's rows and §3.7's `57.184 x/log⁴ x` (for `θ`, from
`2·10¹¹`).

*Needs:* §2.6; §3.4; §1.3 (`ButheVerified`, *ChirreHelfgottRange*); `gap:rh-up-to-height`.

### Examples

- `θ(x) ≤ (1 + 1.93378·10⁻⁸) x` for all `x > 0`; `|θ(x) − x| < 0.024334 x/log³ x` from
  `1 757 126 630 797`.
- Rosser–Schoenfeld's `ψ(x) < 1.03883 x` for `x > 0` and Dusart's `|ψ(x) − x| ≤ 0.006409 x/log x`
  for `x > e²²`.
- Fiori–Kadiri–Swidinsky's `|π(x) − Li x| ≤ 9.2211 x √(log x) exp(−0.84768363 √log x)` for `x ≥ 2`.

### Dependencies

Layers 0–2 (§2.1's truncated explicit formula for §3.1(d), §2.3's general theorem for
*BKLNWPsiTable*); ZerosOfLFunctions §§4.5, 8.4, 8.5, 8.9; AnalyticNumberTheoryPartI §§0.3, 0.5 (the
statements of the inputs proved in §§3.2, 3.5); ExplicitZetaBounds §5.4 (the weighted sums over
ordinates), §7.2 (the region `ν₂` of §3.4, and Ford's region among the hypotheses of §2.1 that
§3.7 carries) and §§5.2a, 7.3a (the zero-count and classical-region predicates); the gaps
`rh-up-to-height`,
`classical-zero-free-constants`, `explicit-zero-count-error`, `explicit-zero-density`,
`vinogradov-korobov-constants`; the zero
inputs *ZeroCountBound* at Trudgian's and Platt–Trudgian's triples (§3.1, ExplicitZetaBounds
§5.2a's predicate), *JohnstonYangDensityTable*, *JohnstonYangExplicitFormula* and
*FioriKadiriSwidinskyDensity* (§3.4). No later layer is used.

## Layer 4: sums over primes

### 4.1 One-sided Mertens sums of Rosser–Schoenfeld

The two-sided theorems with the constants `B` and `E` are AnalyticNumberTheoryPartI §0.19 and §0.8
and are not restated. Their one-sided corollaries on the full range (`rosser-schoenfeld-1962` lines
256–293 and the ranges at lines 304–322, Theorems 5–6 and Corollaries; `pnt-plus`), under
*RosserSchoenfeld1962Range* for the initial segments:

- `log log x < ∑_{p ≤ x} 1/p` for `x > 1`, and `∑_{p ≤ x} 1/p < log log x + B + 1/log² x` for `x > 1`
  ((3.19)–(3.20); the extraction at `rosser-schoenfeld-1962` line 285 drops the square, as it does
  in (3.18) at line 282, which §4.3 quotes as `1/(2 log² x)`);
- `∑_{p ≤ x} (log p)/p < log x` for `x > 1`, and `log x + E − 1/log x < ∑_{p ≤ x} (log p)/p` for
  `x ≥ 32`, with `E` the constant of §0.8 there.

The elementary bounds valid from `x = 1` (Mertens' argument, `mertens-1874`, with
Mathlib's constant for `ψ`), which need no hypothesis:

- For every real `x ≥ 1`, `−2 ≤ ∑_{n ≤ x} Λ(n)/n − log x ≤ log 4 + 4`;
  and, with `E₁ = ∑_p log p/(p(p − 1))` (§1.6), `−2 − E₁ ≤ ∑_{p ≤ x} (log p)/p − log x ≤ log 4 + 4`, so
  `|∑_{p ≤ x} (log p)/p − log x| ≤ log 4 + 4`. Route: `x ∑_{n ≤ x} Λ(n)/n = log ⌊x⌋₊! + ∑_{n ≤ x} Λ(n) {x/n}`
  (AnalyticNumberTheoryPartI §0.11d), the bounds for `log ⌊x⌋₊!` there,
  `0 ≤ ∑_{n ≤ x} Λ(n) {x/n} ≤ ψ(x) ≤ (log 4 + 4) x` (Mathlib's `Chebyshev.psi_le_const_mul_self`), and
  `(1 + log x)/x ≤ 1`, `(1 − log x)/x ≥ −1` for `x ≥ 1`; for the primes, the prime powers `p^k`,
  `k ≥ 2`, contribute `∑_{p^k ≤ x, k ≥ 2} log p/p^k ∈ [0, E₁]`. Under *ChebyshevWeightRange*, §0.8's
  `ψ(x) ≤ 1.11 x` replaces `log 4 + 4` by `1.11` in both upper bounds.
- The crude enclosure of the Meissel–Mertens constant, the instance of §1.6 at these constants:
  `(−2 − E₁)/log 2 + 1 − log log 2 ≤ B ≤ (log 4 + 4)/log 2 + 1 − log log 2`, with
  `E₁ ≤ (5 log 2 + 3)/4` (§1.6), that is `−3.86 < B < 9.14`.

*Needs:* AnalyticNumberTheoryPartI §§0.8, 0.11d, 0.19; §1.3; §1.6 (`E₁` and the enclosure of `B`);
§0.8 (for the constant `1.11`); Mathlib `Chebyshev.psi_le_const_mul_self`.

**Checks.**

- At `x = 1.5` all sums are empty and `log log 1.5 = −0.90 < 0`: the range `x > 1` includes points
  below `2`, where the statements are about the empty sum.

### 4.2 The sum ∑ Λ(n)/n

- Exact form (§0.7 at `q = 1`, `C(1, 0) = −γ`): for `x ≥ 1`,
  `∑_{n ≤ x} Λ(n)/n = log x − γ + (ψ(x) − x)/x − ∫ₓ^∞ (ψ(t) − t)/t² dt`.
- Ramaré (`pnt-plus`; `ramare-2013` lines 82–104, Theorem 1.1, as corrected in
  `ramare-2023-corrigendum`, Acta Arith. 211, which fixes sign errors in Lemmas 2.1–2.2 of
  `ramare-2013` and in Lemma 4 of `ramare-saouter-2003` and a numerical slip; the constants below
  are the corrected ones): under `RH(3 000 175 332 800)`, for `x ≥ 8950`,
  `|∫ₓ^∞ (ψ(t) − t)/t² dt| ≤ 1/(2√x) + 1.75·10⁻¹²`; and under the classical-shape region with
  `R = 5.69693`, for `log x ≥ 9270`,
  `|∫ₓ^∞ (ψ(t) − t)/t² dt| ≤ 1/(2√x) + (1 + 2 √(log x/R)) exp(−2 √(log x/R))/(2π)`. Route: the exact
  form and the explicit formula for the integral
  (`∫ₓ^∞ (ψ(t) − t)/t² dt = ∑_ρ x^{ρ−1}/(ρ(1 − ρ)) + …`, an absolutely convergent zero sum from
  §2.1), the zeros below the height contributing `x^{−1/2} ∑ 1/|ρ(1 − ρ)| ≤ x^{−1/2} · 0.04619/2`
  and the high zeros through the region and ExplicitZetaBounds §5.4.
- Instances, the corrected corollary (`ramare-2023-corrigendum`, the corollary to Theorem 1.1):
  `∑_{n ≤ x} Λ(n)/n = log x − γ + O*(1.833/log² x)` for `x > 1`; `O*(1.31/√x)` for
  `1 ≤ x ≤ 10¹⁰`; `O*(0.0067/log x)` for `x ≥ 1.52·10⁶`; `O*(0.01/log x)` for `x ≥ 468 000`;
  `O*(1/(4 log x))` for `x ≥ 115`. Route: *Ramare2013Range* up to `10¹⁰` (the inequality for
  `1 < x < 8950`, the `1.31/√x` statement and the three `1/log x` forms on `[threshold, 10¹⁰]`); on `[10¹⁰, 10¹⁹]` Theorem 1.1 with `ButheVerified`, the error being at most
  `1.44/√x + 1.75·10⁻¹²`; beyond `10¹⁹` for the `1/log x` forms, Dusart's `0.006409 x/log x`
  (§3.3) for `(ψ(x) − x)/x` and, for the integral, the first form of Theorem 1.1 on
  `10¹⁹ < x ≤ e⁹²⁷⁰`, where `1/(2√x) + 1.75·10⁻¹² ≤ 0.000291/log x` (this fails once
  `log x > 0.000291/(1.75·10⁻¹²) = 1.663·10⁸`, so the constant term cannot be carried to every `x`),
  and the second form for `log x ≥ 9270`, whose tail `(1 + 2X) e^{−2X}/(2π)`,
  `X = √(log x/5.69693)`, is at most `1.2·10⁻³⁴` there and decreases faster than
  `0.000291/log x`. The route for
  `1.833/log² x` beyond `10¹⁹`: Dusart's bound up to `e²⁸⁶` (`0.006409 log x ≤ 1.833`), Dusart's
  `0.905·10⁻⁷` up to `e⁴⁵⁰⁰`, the Platt–Trudgian rows up to `e^{10⁴}`, and the second form of
  Theorem 1.1 beyond.
- Chirre–Helfgott (`chirre-helfgott-2025` Corollary 1.3, *(preprint)*; `pnt-plus`, `ieantn`): for
  every `x ≥ 1`, `∑_{n ≤ x} Λ(n)/n = log x − γ + O*(π/(3·10¹²) + 113.67/√x)`. Route: the second
  clause of §2.6's general theorem at `T = 3·10¹² + 1` for `x > 3·10¹²`; *Ramare2013Range*'s
  `1.31/√x` on `[1, 10¹⁰]`; on `[10¹⁰, 3·10¹²]` the exact form with `ButheVerified` and Theorem 1.1,
  `1.44/√x + 1.75·10⁻¹² ≤ 113.67/√x + 1.047·10⁻¹²`. It is sharper than Ramaré's `0.0067/log x` from
  `x = 1.95·10¹¹` on, and is stated beside Ramaré's forms, not in their place.
- Broadbent–Fiori–Kadiri–Ng–Wilk (`broadbent-fiori-kadiri-ng-wilk-2026` Theorem 4 and its table,
  *(preprint)*), from the bounds of §§3.4 and 3.7 and the density of `gap:explicit-zero-density`:
  `∑_{n ≤ x} Λ(n)/n = log x − γ + O*(C_ℓ/log^ℓ x)` for `x ≥ x₀` with `(ℓ, C_ℓ, x₀) = (1, 0.2967, 23)`,
  `(1, 5.86·10⁻⁴, e²⁰)`, `(1, 1.57·10⁻⁴, 10¹⁰)`, `(2, 1.28, 2)`, `(2, 0.0118, e²⁰)`; and the
  exponential form `O*(9.2203 (log x)^{3/2} exp(−0.84768 √log x))` for `x ≥ 2`, stated with the
  exponent constant `2/√5.5666305 = 0.84768` of the paper's (11) (its Theorem 4 prints `0.8746`,
  larger than that `C`; the form with `0.84768`, implied by either reading, is the one stated).

*Needs:* §0.7; §2.1; §2.6; §3.3; §3.4; §3.7; §1.1; §1.3; `gap:classical-zero-free-constants`;
`gap:explicit-zero-density`; ExplicitZetaBounds §5.4; ZerosOfLFunctions §5.6.

**Checks.**

- `x = 1`: the sum is empty, `log 1 − γ = −0.5772`, and `1.31/√1 = 1.31 > 0.5772`, so the
  `1 ≤ x` form is consistent at its left end; `1.833/log² x` is unbounded as `x → 1⁺`.
- A transfer with a constant `ε` has a divergent tail (§0.7 Checks); the instances use decaying
  error functions.

### 4.3 The sum ∑ 1/p and the Meissel–Mertens constant

- Exact form: for `x ≥ 2`, `∑_{p ≤ x} 1/p = θ(x)/(x log x) + ∫₂ˣ θ(t)(1 + log t)/(t² log² t) dt`
  (Abel summation against `1/(t log t)`, whose derivative is `−(1 + log t)/(t² log² t)`).
- The constant (`pnt-plus`): `B = 1/log 2 − log log 2 + ∫₂^∞ (θ(t) − t)(1 + log t)/(t² log² t) dt`,
  the integral converging absolutely because `θ(t) − t = O(t/log² t)` (ZerosOfLFunctions §8.5 at
  `K = ℚ` with §0.3); and for `x ≥ 2`,
  `∑_{p ≤ x} 1/p − log log x − B = (θ(x) − x)/(x log x) − ∫ₓ^∞ (θ(t) − t)(1 + log t)/(t² log² t) dt`.
  Here `B` is `TauCeti.LFunctions.mertensConstant ℚ`: both are the limit of
  `∑_{p ≤ x} 1/p − log log x`.
- Transfer: if `|θ(t) − t| ≤ η t/log^k t` for all `t ≥ x`, with `k > 0`, then
  `|∑_{p ≤ x} 1/p − log log x − B| ≤ η (1/k + (k + 2)/((k + 1) log x))/log^k x`: the boundary term
  is at most `η/log^{k+1} x` and the integral at most
  `η ∫ₓ^∞ (1/(t log^{k+2} t) + 1/(t log^{k+1} t)) dt = η (1/((k + 1) log^{k+1} x) + 1/(k log^k x))`.
- Vanlalngaia's explicit second theorem of Mertens, the headline (`pnt-plus`; `vanlalngaia-2017`
  lines 26–51, Corollary 1; its line-numbered text renders digits as letters, see the References):
  prove `vanlalngaia_sum_inv_prime`, that from its input `|θ(t) − t| ≤ t/log³ t` for every
  `t ≥ 89 967 803` and from `VanlalngaiaRange` (§1.3), `|∑_{p ≤ x} 1/p − log log x − B| ≤ 4/log³ x`
  for `x ≥ 2`, `≤ 2.3/log³ x` for `x ≥ 1000` and `≤ 1/log³ x` for `x ≥ 24 284`, where
  `∑_{p ≤ x} 1/p` is `Suggested.lean`'s `primeReciprocalSum x`. Route: the transfer with `k = 3`,
  `η = 1` gives `(1/3 + 5/(4 log x))/log³ x ≤ 0.41/log³ x` for `x ≥ 89 967 803`, and
  `VanlalngaiaRange` covers `[2, 89 967 803]`. The input is the row `(3, 1, 89 967 803)` of §3.3
  (Dusart's, re-proved through §3.7), so the instance holds under the hypotheses of §3.3. The
  source's own route is through the zeros (its Theorem 4); the transfer above is shorter and needs
  only the input.
- Vanlalngaia's zero-free-region form (`vanlalngaia-2017` lines 79–89, Corollary 3): let `R ≥ 1`
  be such that `ζ` has no zero with `|t| ≥ 2` and `σ ≥ 1 − 1/(R log |t|)`, and suppose
  `RH(3·10¹²)`, `ZetaZeroCubeSum` (for the use of §3.1(a) below) and the absence of zeros with
  `0 < Re s < 1` and `|Im s| ≤ 14` (the source assumes
  the region and the zeros on the line up to height `2.44·10¹²`, lines 234–240). Then for every
  `x` with `log x ≥ 814R`,
  `|∑_{p ≤ x} 1/p − log log x − B| ≤ 1.6 exp(−√(log x/R))/(R^{1/4} (log x)^{3/4})`.
  Route (lines 90–114): the source's Theorem 4 (lines 90–108, proved at lines 423–600) bounds
  `∑_{p ≤ x} 1/p − log log x − B + (θ(x) − x)/(x log x)` for `x ≥ exp(814R)` by an explicit term of
  smaller order. In the exact identity above, `θ(t) − t` is split as `(ψ(t) − t) − (ψ(t) − θ(t))`;
  the second part is bounded through §0.3, and the first is integrated against
  `(1 + log t)/(t² log² t)` through the explicit formula (ZerosOfLFunctions §§8.3–8.4), which gains
  a factor `1/|ρ|` for each zero over a pointwise bound, with the region above height `3·10¹²`,
  `RH(3·10¹²)` below it and the zero count of `gap:explicit-zero-count-error`. The boundary term
  `|θ(x) − x|/(x log x)` is below `√(8/π) R^{−1/4} (log x)^{−3/4} exp(−√(log x/R))` by
  `dusart_of_zeroFreeRegion` (§3.1(a), applicable since `√(log x/R) ≥ √814 = 28.53` exceeds
  `max(8.36, 8/R)`), and `√(8/π) = 1.5958` leaves the rest of `1.6` for Theorem 4's term (lines
  111–114). The transfer above from a pointwise `θ`-bound does not give this shape.
- Vanlalngaia's Corollary 2 (`vanlalngaia-2017` lines 59–65, derived at lines 111–114 from
  Corollary 3 at `R = 5.69693`, which fixes the reading of its one-line display as a quotient):
  `|∑_{p ≤ x} 1/p − log log x − B| ≤ 1.1 exp(−√(0.175 log x))/(log x)^{3/4}` for `log x ≥ 4635`.
  Route: Corollary 3 at `R = 5.5666305`, a region of `gap:classical-zero-free-constants`, so the
  statement carries, besides the other hypotheses of Corollary 3, *BrentPlattTrudgianRecord*, under
  which with `RH(3·10¹²)` the supplier states that region; there
  `814R = 4531.24 ≤ 4635`, `1.6 R^{−1/4} = 1.0417 ≤ 1.1` and `1/R = 0.17964 ≥ 0.175`. The source's
  value `R = 5.69693` gives `1.6 R^{−1/4} = 1.0356` and `1/R = 0.17553`, but only from
  `log x ≥ 814R = 4637.30`, short of the printed start `4635`.
- The companion sum: `∑_{p ≤ x} (log p)/p − log x − E = (θ(x) − x)/x − ∫ₓ^∞ (θ(t) − t)/t² dt` for
  `x ≥ 2`, with `E` the constant of AnalyticNumberTheoryPartI §0.8 (the same Abel summation against
  `1/t`); so `|θ(t) − t| ≤ η t/log^k t` for `t ≥ x`, `k > 1`, gives
  `|∑_{p ≤ x} (log p)/p − log x − E| ≤ η (1/log^k x + 1/((k − 1) log^{k−1} x))`.
- Axler's instances (`axler-2024` Theorems 1.5–1.6 of arXiv v4, journal Theorems 5–6), the two
  transfers at §3.7's `η = 0.024334`, `k = 3`: for `x ≥ 1 757 126 630 797`,
  `|∑_{p ≤ x} 1/p − log log x − B| ≤ (0.024334/(3 log³ x))(1 + 15/(4 log x))` and
  `|∑_{p ≤ x} (log p)/p − log x − E| ≤ (0.024334/(2 log² x))(1 + 2/log x)`.
- Broadbent–Fiori–Kadiri–Ng–Wilk (`broadbent-fiori-kadiri-ng-wilk-2026` Theorem 2 and its table,
  *(preprint)*), from the bounds of §§3.4 and 3.7 and the density of `gap:explicit-zero-density`,
  improving every one of Vanlalngaia's constants:
  `|∑_{p ≤ x} 1/p − log log x − B| ≤ A₃/log³ x` for `x ≥ x₀` with `(A₃, x₀) = (3.69, 2)`,
  `(2.2465, 1000)`, `(0.99944, 24 284)`, `(0.19992, 2 278 383)`, `(0.060610, 46 909 074)`; and
  `≤ 9.2203 (log x)^{1/2} exp(−0.84768 √log x)` for `x ≥ 2`. The row at `2 278 383` recovers the
  constant `0.2` that `dusart-2018` stated from its `ψ`-table (§3.3). Vanlalngaia's instances are
  kept as the refereed statements.
- The elementary forms of the second theorem, from §4.1's bounds: for every `x ≥ 2`,
  `|∑_{p ≤ x} 1/p − log log x − B| ≤ (log 4 + 6 + E₁)/log x` and
  `|∑_{2 ≤ n ≤ x} Λ(n)/(n log n) − log log x − γ| ≤ (log 4 + 6)/log x`, hence
  `|∑_{p ≤ x} 1/p − log log x| ≤ |B| + (log 4 + 6 + E₁)/log 2`. Route: Abel summation of `(log p)/p`
  against `1/log t` gives
  `∑_{p ≤ x} 1/p − log log x − B = R(x)/log x − ∫ₓ^∞ R(t) dt/(t log² t)` with
  `R(t) = ∑_{p ≤ t} (log p)/p − log t ∈ [−2 − E₁, log 4 + 4]`, so the two terms add at most
  `(log 4 + 4 + 2 + E₁)/log x`; the same with `Λ(n)/n`, whose remainder lies in `[−2, log 4 + 4]`,
  and with the constant `1 − log log 2 + ∫₂^∞ (∑_{n ≤ t} Λ(n)/n − log t) dt/(t log² t)`, which is `γ`
  by AnalyticNumberTheoryPartI §0.26a.
- Dusart's companion bound (`dusart-2018`, journal Theorem 5.7): under *Dusart2018Range*,
  `ButheVerified` and the hypotheses of §3.7, `|∑_{p ≤ x} (log p)/p − log x − E| ≤ 0.3/log² x` for every
  `x ≥ 912 560`. Route: *Dusart2018Range* on `[912 560, 5·10⁷]`; on `[5·10⁷, 10¹⁹]` the exact
  companion form above with `|θ(t) − t| ≤ 1.95 √t` up to `10¹⁹` (`ButheVerified`) and
  `|θ(t) − t| < 0.024334 t/log³ t` beyond (§3.7), which give at most
  `5.85/√x + 0.024334/(2 log² 10¹⁹) ≤ 0.3/log² x`; beyond `10¹⁹` the companion transfer with
  `η = 0.024334`, `k = 3`.
- The input *PrimeProductFiniteInput* of AnalyticNumberTheoryPartI §0.25
  (`∑_{p ≤ x} 1/p ≤ log log x + 0.27 + 5/log x` for `10⁸ ≤ x < exp 10000`) follows from §0.19 there
  (`|∑_{p ≤ x} 1/p − log log x − B| < 1/(2 log² x)` for `x ≥ 286`) and *MeisselMertensEnclosure*
  (§1.6, `B < 0.2615`), since `0.2615 + 1/(2 log² 10⁸) < 0.27`.

*Needs:* §0.3; §1.3 (`VanlalngaiaRange`, *Dusart2018Range*); §4.1 (the elementary bounds) and
AnalyticNumberTheoryPartI §0.26a (the constant `γ`) for the elementary forms; for the instances
§3.3, §3.4, §3.7 and, for the input of AnalyticNumberTheoryPartI, §1.6; for Vanlalngaia's Corollaries 2 and 3, §3.1(a),
ZerosOfLFunctions §§8.3–8.4, `gap:classical-zero-free-constants`, `gap:rh-up-to-height` (the
recorded verifications of ExplicitZetaBounds §0.4) and `gap:explicit-zero-count-error`;
AnalyticNumberTheoryPartI §§0.8, 0.19, 0.25; `gap:explicit-zero-density` (the preprint instance
only); Tau Ceti
`TauCeti.LFunctions.mertensConstant`, `TauCeti.LFunctions.tendsto_primeSummatory_inv_absNorm_sub_log_log`;
ZerosOfLFunctions §8.5; Mathlib Abel summation.

**Checks.**

- The exact form at `x = 3`: left side `1/2 + 1/3 = 0.8333`; right side
  `log 6/(3 log 3) + log 2 · (1/(2 log 2) − 1/(3 log 3)) = 0.5436 + 0.6931 · 0.4179 = 0.8333`, using
  the antiderivative `−1/(t log t)`. Integrating against `1/(t² log² t)` without the factor
  `1 + log t` gives `0.5436 + 0.6931 · 0.0963 = 0.61`, wrong.
- The transfer at `k = 1`, `η = 1`, `log x = 10`: the formula gives `(1 + 3/20)/10 = 0.11500`, and
  directly the boundary term `1/log² x = 0.01` plus the integrals `1/(2 log² x) = 0.005` and
  `1/log x = 0.1` give `0.11500`, finite. With `k = 0` (a constant relative error `η`) the integrand
  is `η (1 + log t)/(t log² t) ≥ η/(t log t)`, whose integral diverges, so such a `θ`-bound does not
  determine `B`: `k > 0` is needed.
- Axler's constants are the transfers exactly: with `k = 3`,
  `η (1/3 + 5/(4 log x)) = (η/3)(1 + 15/(4 log x))`, and
  `η (1/log³ x + 1/(2 log² x)) = (η/(2 log² x))(1 + 2/log x)`. At `x = 1 757 126 630 797`
  (`log x = 28.195`) the first is `4.1·10⁻⁷`.
- The companion transfer with `k = 1` would give `η (1/log x + ∫ dt/(t log t))`, divergent: as for
  `B`, a relative error `1/log t` does not determine `E`.

### 4.4 Ramaré's weighted sums over primes

Let `P ≥ 2` and `f` be `C¹`, nonnegative and non-increasing on `[P, ∞)` with `∫_P^∞ f(t) dt < ∞`
(which forces `t f(t) → 0`, since `(t/2) f(t) ≤ ∫_{t/2}^t f`). Then, with `θ(P⁻) = ∑_{p < P} log p`,

- `∑_{p ≥ P} f(p) log p = −f(P) θ(P⁻) − ∫_P^∞ θ(t) f'(t) dt` (Abel summation). The series converges:
  by Abel summation and `θ(t) ≤ (log 4) t`, each partial sum `∑_{P ≤ p ≤ X} f(p) log p` is at most
  `(log 4)(X f(X) + ∫_P^X t (−f'(t)) dt) = (log 4)(P f(P) + ∫_P^X f)`, which is bounded;
- if moreover `θ(t) ≤ (1 + ε) t` for all `t ≥ P`, then
  `∑_{p ≥ P} f(p) log p ≤ (1 + ε) ∫_P^∞ f(t) dt + f(P) ((1 + ε) P − θ(P⁻))`;
- Ramaré's form (`ramare-2016` lines 294–303, Lemma 3.2; `pnt-plus`): with `ε = 1/914` and
  `P ≥ 3 600 000`, `∑_{p ≥ P} f(p) log p ≤ (1 + ε) ∫_P^∞ f + ε P f(P) + P f(P)/(5 log² P)`, from the
  previous item, Schoenfeld's `θ(t) < 1.001093 t` (§3.2; `0.001093 ≤ 1/914`) and Dusart's
  `θ(t) ≥ t − 0.2 t/log² t` for `t > 3 594 641` (§3.3) applied to `θ(P⁻)`; for `P ≥ 2`, the same
  with `1/5` replaced by `4`, from Dusart's `η₂ = 3.965 ≤ 4`. Both under the hypotheses of
  §§3.2–3.3.
- The sharper instance with `ε = 1/36 260` (the instance of Ramaré's Lemma 3.2 quoted with Dusart's
  `θ(x) − x < x/36 260` for `x > 0`, which is Proposition 5.1 of the arXiv copy of `dusart-2018`,
  not of `dusart-2016`): for `P ≥ 3 600 000`,
  `∑_{p ≥ P} f(p) log p ≤ (1 + 1/36 260) ∫_P^∞ f + P f(P)/36 260 + P f(P)/(5 log² P)`, under the
  hypotheses of §3.3, the bound `x/36 260` being taken from §3.7's
  `θ(x) ≤ (1 + 1.93378·10⁻⁸) x` (§3.3). With `ε = 1.93378·10⁻⁸` itself the same holds.

*Needs:* §3.2; §3.3; §3.7; Mathlib `Chebyshev.theta_le_log4_mul_x`, Abel summation, improper
integrals.

**Checks.**

- The exact Abel form at `f = 1_{[P, Q)}` is excluded (`f` is not `C¹`); with `f` a `C¹` cap of
  it, `∫ θ f'` concentrates at `Q` and the identity reduces to `θ(Q⁻) − θ(P⁻) = ∑_{P ≤ p < Q} log p`.
- `f(t) = 1/t` is excluded: `t f(t) → 1 ≠ 0` and the integral diverges, as does the series
  `∑ (log p)/p`.
- `f(t) = 1/(t log t)` on `[3 600 000, ∞)` is `C¹`, nonnegative and decreasing with `t f(t) → 0`,
  but `∫_P^∞ dt/(t log t) = ∞` and `∑_{p ≥ P} f(p) log p = ∑_{p ≥ P} 1/p` diverges: without the
  integrability hypothesis the identity would compare junk values (negative control).

### 4.5 Sums of primes (Treviño)

Let `a ≥ 2`, `k₁, k₂ ≥ 0` with `x − k₂ x/log x ≤ θ(x) ≤ x + k₁ x/log x` for all `x ≥ a`, and `C`
with `∫ₐˣ t/log³ t dt ≤ C x²/log² x` for all `x ≥ a`. Then there are explicit
`c₁ = c₁(a, k₁, k₂, C)` and `c₂ = c₂(a, k₁, k₂, C)`, given by Treviño's proof (`trevino-2012` lines
481–496 and the following page), with
`x²/(2 log x) + c₁ x²/log² x ≤ ∑_{p ≤ x} p ≤ x²/(2 log x) + c₂ x²/log² x` for all `x ≥ a` (Lemma
3.4, lines 466–470; `pnt-plus`). Route: `∑_{p ≤ x} p = x θ(x)/log x − ∫₂ˣ θ(t)(log t − 1)/log² t dt`
(Abel summation against `t/log t`), the main term from `θ(t) = t`, and the two error integrals
bounded by `k₁, k₂, C`. The rows of Table 1 (`(a, c₁, c₂)`, lines 471–480) are the instances at the
rows of Table 2 (`(a, k₁, k₂, C)`, lines 493–503), under *TrevinoTables* and these `θ`-bounds of
§§3.2–3.3: the upper bound with `k₁ = 0.0201384` is (5.6a*) of Schoenfeld's Theorem 7*, for every
`x > 1`; the lower bounds with `k₂ = 1/29, 1/35, 1/37, 1/39, 1/40, 1/41` at
`a = 315 437, 468 577, 486 377, 644 123, 678 407, 758 231` are Schoenfeld's Corollary 2* at the
pairs `(c, d) = (1/k₂, a)` (`schoenfeld-1976` lines 1229–1233; §3.2, with
*SchoenfeldTheorem7Range*); the lower bound with `k₂ = 0.0239922` at `a = 758 711` is (5.6*) of
Theorem 7*; and the row `a = 10 544 111`, with `k₁ = k₂ = 0.006788`, is Dusart's bound of §3.3. Each
of these is stated for `x > a` (or `x > 1`), and the right-continuity of `θ` gives it at `x = a`
with `≤`, which is the form Treviño's lemma uses.

Table proposition of this section: *TrevinoTables* (`trevino-2012` lines 471–480 and 493–503):
for every row `(a, k₁, k₂, C)` of Table 2, `∫ₐˣ t/log³ t dt ≤ C x²/log² x` for all `x ≥ a`, and the
explicit `c₁(a, k₁, k₂, C)`, `c₂(a, k₁, k₂, C)` are at least, respectively at most, the values
`c₁`, `c₂` of the row of Table 1 with the same `a`.

*Needs:* §3.2 (Theorem 7* and Corollary 2*); §3.3; §1.3 (*SchoenfeldTheorem7Range*); Mathlib Abel
summation.

### 4.6 Sums of prime powers (Deléglise–Nicolas)

Write `π_r(x) = ∑_{p ≤ x} p^r` for real `r ≥ 0`.

- General bounds (`deleglise-nicolas-2019-landau` lines 613–705, Proposition 2.5; `pnt-plus`): let
  `0 < α ≤ 1` and `x₁ ≥ 89 967 803` with `|θ(x) − x| < α x/log³ x` for `x ≥ x₁`. For `r ≥ 0.6` and
  `x ≥ x₁`,
  `π_r(x) ≤ C₀ + x^{r+1}/((r+1) log x) + x^{r+1}/((r+1)² log² x) + 2 x^{r+1}/((r+1)³ log³ x) + (α(51r⁴ + 176r³ + 222r² + 120r + 23) + 168) x^{r+1}/(24 (r+1)⁴ log⁴ x)`,
  with `C₀` the explicit constant of display (2.15) built from `π_r(x₁)`, `θ(x₁)` and
  `li(x₁^{r+1})`; for `0.06 ≤ r ≤ r₀(α)` the lower bound with the last term replaced by
  `−(α(2r⁴ + 7r³ + 9r² + 5r + 1) − 6) x^{r+1}/((r+1)⁴ log⁴ x)`, and for `r > r₀(α)` by
  `−(α(51r⁴ + 176r³ + 222r² + 120r + 23) − 168) x^{r+1}/(24(r+1)⁴ log⁴ x)`, where `r₀(α)` is the
  positive root of `3r⁴ + 8r³ + 6r² − 24/α − 1 = 0` (`r₀(1) = 1.1445`, `r₀(0.5) = 1.4377`,
  `r₀(0.15) = 2.1086`) and `C₀` is display (2.18). Route: Abel summation of `θ` against `t^r/log t`
  and the expansion of `li(x^{r+1})`.
- Instances (Corollaries 2.6–2.8, lines 706–767). The `π₁` bounds, (2.19) and (2.20):
  `π₁(x) ≤ x²/(2 log x) + x²/(4 log² x) + x²/(4 log³ x) + 107 x²/(160 log⁴ x)` for `x ≥ 110 117 910`;
  `π₁(x) ≥ x²/(2 log x) + x²/(4 log² x) + x²/(4 log³ x) + 3 x²/(20 log⁴ x)` for `x ≥ 905 238 547`.
  Route: (2.20) is Axler's Theorem 1.2 below, the same inequality (`1.2/8 = 3/20`) from the same
  threshold; (2.19) is Axler's Theorem 1.1 below for `x ≥ 110 118 925` (`5.3/8 < 107/160`) and the
  clause of *DelegliseNicolasRange* (§1.3) on `[110 117 910, 110 118 925]`. The general bound gives
  them only from the point where its hypothesis holds: at `α = 0.15` that is
  `x₁ = 19 035 709 163` (line 389; the source proves the corollary by reference to earlier work,
  line 710), and at the Dusart 2018 row `α = 1` the coefficients are not those of
  (2.19)–(2.20) (Checks). The other instances, under the Dusart 2018 row of §3.3 (`α = 1`,
  `x₁ = 89 967 803`) and *DelegliseNicolasRange*:
  `π₂(x) ≤ x³/(3 log x) + x³/(9 log² x) + 2x³/(27 log³ x) + 1181 x³/(648 log⁴ x)` for `x ≥ 60 173`;
  `π₂(x) ≤ (x³/(3 log x))(1 + 0.385/log x)` for `x ≥ 60 297`;
  `π₂(x) ≥ x³/(3 log x) + x³/(9 log² x) + 2x³/(27 log³ x) − 1069 x³/(648 log⁴ x)` for `x ≥ 1 091 239`;
  `π₂(x) ≥ ∑_{p < x} p² ≥ (x³/(3 log x))(1 + 0.248/log x)` for `x > 32 321`;
  `π₃(x) ≤ 0.271 x⁴/log x` for `x ≥ 664`, `π₄(x) ≤ 0.237 x⁵/log x` for `x ≥ 200`,
  `π₅(x) ≤ 0.226 x⁶/log x` for `x ≥ 44`; and `π_r(x) ≤ (log 3/3)(1 + (2/3)^r) x^{r+1}/log x` for
  `x > 1` and `r ≥ 5`.
- Axler's `π₁` bounds (`axler-2019`, J. Théor. Nombres Bordeaux 31, Theorems 1.1–1.3), under the
  `θ`-bounds of §3.7 and *Axler2019Range*:
  `π₁(x) < x²/(2 log x) + x²/(4 log² x) + x²/(4 log³ x) + 5.3 x²/(8 log⁴ x)` for `x ≥ 110 118 925`
  (`axler-2019` lines 46–48), sharper than Deléglise–Nicolas's `107/160 = 0.66875` (`5.3/8 = 0.6625`);
  `π₁(x) > x²/(2 log x) + x²/(4 log² x) + x²/(4 log³ x) + 1.2 x²/(8 log⁴ x)` for `x ≥ 905 238 547`
  (lines 51–53), which is Deléglise–Nicolas's lower bound (`1.2/8 = 3/20`, same threshold); and
  `−0.25 x²/log⁴ x < π₁(x) − li(x²) < 0.25 x²/log⁴ x`, the left inequality for `x ≥ 906 484 877`
  and the right one for `x ≥ 110 117 797`. Route: Abel summation of `θ` against `t`, as in the
  general bound above, with the `θ`-bounds of §3.7, the expansion of `li(x²)` (§0.3a), and
  *Axler2019Range* below the point where those bounds suffice.

*Needs:* §3.3; §3.7; §0.3a (the asymptotic expansion of `li`); §0.4; §1.3; Mathlib Abel summation.

**Checks.**

- The Dusart 2018 row cannot give the `π₁` corollary (negative control): at `r = 1`, `α = 1` the
  upper coefficient is `(592 + 168)/384 = 1.979`, not `0.669`, and since `r = 1 < r₀(1) = 1.1445` the
  lower one is `−(24 − 6)/16 = −1.125`, not `+3/20`.
- At `r = 0` the bound would be about `π(x)`, but `r ≥ 0.6` is required: the constant `C₀` and the
  fourth-order term are tuned for `r` bounded away from `0`.

### 4.7 Mertens sums under the Riemann hypothesis

Under `RiemannHypothesis` (`lee-nosal-2026` Corollary 1.3, (4)–(5)), with `ButheVerified`,
*LeeNosalMertensRange*, `ZetaZeroReciprocalSum`, *PsiThetaUpper* (or the inputs of §3.7 that
discharge it) and the other inputs of §2.2 (`ZetaZeroCountLowRange`, `HiaryRecord`, `PatelRecord`
and `YangRecord`):

- `|∑_{p ≤ x} (log p)/p − log x − E| ≤ 3 log² x/(8π√x)` for `x ≥ 43.1`;
- `|∑_{p ≤ x} 1/p − log log x − B| ≤ 3 log x/(8π√x)` for `x ≥ 24.4`.

The two product forms of the same corollary belong to ExplicitMultiplicativeFunctions (Scope).
Route (`lee-nosal-2026` §3.3): the exact forms of §4.3 for both sums; for `x ≥ 10¹⁹`, Lee–Nosal's
`θ` bound (§2.2, its hypothesis *PsiThetaUpper* discharged by §3.7) inside the two tails, which
gives at most `(3 log x − 3.33541) log x + 0.88612` over `8π√x` for the first sum and
`3(log x − 3.77847) + 2(2 − 2.77847/log x)` over `8π√x` for the second; for `10⁶ ≤ x ≤ 10¹⁹`,
`|θ(t) − t| ≤ 1.95 √t` from `ButheVerified` on `[x, 10¹⁹]` and Lee–Nosal's bound beyond; for
`x < 10⁶`, *LeeNosalMertensRange*.

*Needs:* §2.2; §3.7; §4.3 (the exact forms); §1.3; ExplicitZetaBounds §0.4b (the three records of
§2.2); AnalyticNumberTheoryPartI §0.8; Mathlib `RiemannHypothesis`.

**Checks.**

- The factor `3` is `1 + 2`: the boundary term `(θ(x) − x)/(x log x)` contributes `log x/(8π√x)` and
  the tail `∫ₓ^∞ log t/(8π t^{3/2}) dt ≈ 2 log x/(8π√x)`; with the `log log x` saving of §2.2 the
  sum stays below `3 log x/(8π√x)` from `x = 10¹⁹`.

### Examples

- `∑_{n ≤ x} Λ(n)/n = log x − γ + (ψ(x) − x)/x − ∫ₓ^∞ (ψ(t) − t)/t² dt` for `x ≥ 1` (§4.2).
- Vanlalngaia's `|∑_{p ≤ x} 1/p − log log x − B| ≤ 1/log³ x` for `x ≥ 24 284` (§4.3).
- `π_r(x) ≤ (log 3/3)(1 + (2/3)^r) x^{r+1}/log x` for `x > 1` and `r ≥ 5` (§4.6).

### Dependencies

Layers 0–3; AnalyticNumberTheoryPartI §§0.8, 0.19, 0.25; ZerosOfLFunctions §§5.6, 8.5; Tau
Ceti `TauCeti.LFunctions.mertensConstant`; Mathlib `RiemannHypothesis`; ExplicitZetaBounds §5.4; the
gaps `rh-up-to-height`, `classical-zero-free-constants`, `explicit-zero-density`.

## Layer 5: the n-th prime

Throughout, `p_n = Nat.nth Nat.Prime (n − 1)` for `n ≥ 1`, so `p_1 = 2`, `π(p_n) = n`
(`Nat.primeCounting_nth_prime`, Tau Ceti), and `θ(p_n) = ∑_{i=1}^n log p_i`.

### 5.1 Inversion of prime-counting bounds

- If `π(x) < x/(log x − c)` for all `x ≥ x₁`, then `p_n > n (log p_n − c)` for every `n` with
  `p_n ≥ x₁`; if `π(x) > x/(log x − c')` for all `x ≥ x₁`, then `p_n < n (log p_n − c')` for such `n`.
- Bootstrap, lower half: if `p_n > n(log p_n − c)` and `log n > c`, then
  `p_n > n(log n + log(log n − c) − c)`: from `p_n ≥ n` one has `log p_n − c ≥ log n − c > 0`, so
  `log p_n > log n + log(log p_n − c) ≥ log n + log(log n − c)`.
- Bootstrap, upper half: if `p_n < n(log p_n − c')` and `L` is an upper bound for `log p_n` with
  `L > c'`, then `p_n < n(log n + log(L − c') − c')`: `log p_n − c' > 0` because `p_n > 0`, and
  `log p_n < log n + log(log p_n − c') ≤ log n + log(L − c')`. The upper half needs an upper bound
  `L` for `log p_n`; a lower bound for `log p_n`, such as the one of the lower half, cannot be
  substituted. For instance `L = log n + log(log n + log log n)` for `n ≥ 6`, from
  `p_n < n(log n + log log n)` (§5.2).
- From `θ`: if `|θ(x) − x| ≤ κ x/log x` for `x ≥ a`, then for `p_n ≥ a`,
  `|∑_{i ≤ n} log p_i − p_n| ≤ κ p_n/log p_n`, the form Dusart's proof uses (`dusart-1999-mc` lines
  119–125).

*Needs:* Mathlib `Nat.nth`, `Nat.primeCounting'_nth_eq`, `Nat.prime_nth_prime`;
`Nat.primeCounting_nth_prime` (Tau Ceti); §3.5. The instance of `L` above is an example only, so
the general statement does not depend on §5.2.

**Checks.**

- Negative control for the upper half at `n = 61`, `p₆₁ = 283`, `c = 1.1`, `c' = 1`: the two
  hypotheses hold (`277.27 < 283 < 283.37`), but substituting the lower bound
  `log n + log(log n − c)` for `log p_n` inside the upper half would give
  `61(log 61 + log(log 61 + log(log 61 − 1.1) − 1) − 1) = 277.49 < 283`, false. With
  `L = log 61 + log(log 61 + log log 61) = 5.820 ≥ log 283 = 5.645` the stated form gives
  `285.70 ≥ 283`.
- The index shift: `Nat.nth Nat.Prime 0 = 2 = p_1`; a statement `p_n ≥ n log n` transported without
  the shift would assert `Nat.nth Nat.Prime n ≥ n log n`, true but weaker, while the shifted lower
  bounds below are sharp at small `n`.
- `n = 1`: `p_1 = 2`, `π(2) = 1`, `θ(2) = log 2`.

### 5.2 Rosser and Rosser–Schoenfeld

- `rosser-schoenfeld-1962` lines 224–241, Theorem 3 and its Corollary (`pnt-plus`), under the
  hypotheses of §3.5 and *RosserSchoenfeld1962Range*: `n(log n + log log n − 3/2) < p_n` for
  `n ≥ 2`; `p_n < n(log n + log log n − 1/2)` for `n ≥ 20`; `n log n < p_n` for `n ≥ 1`;
  `p_n < n(log n + log log n)` for `n ≥ 6`.
- Dusart's companion inequalities (`dusart-2018`, journal Lemma 5.10; `pnt-plus`), under the
  hypotheses above: `p_k ≤ k log p_k` for every `k ≥ 4`, and `log p_k ≤ log k + log log k + 1` for
  every `k ≥ 2`. Route: `x/log x < π(x)` for `x ≥ 17` (§3.5) at `x = p_k`, where `π(p_k) = k`, for
  `k ≥ 7`, and `p₄ = 7`, `p₅ = 11`, `p₆ = 13` directly; `p_k < k(log k + log log k)` for `k ≥ 6`
  gives `log p_k < log k + log log k + log(1 + log log k/log k)`, the last term below `1/e`, and
  `p₂, …, p₅ = 3, 5, 7, 11` directly. At `k = 3`, `p₃ = 5 > 3 log 5 = 4.83`, so the first starts at
  `k = 4`.
- Rosser (`rosser-1938`, Theorems 1–2; `rosser-1941`, Theorems 1–3; both cited by locator): `p_n > n log n`
  for `n ≥ 1`; `n(log n + log log n − 10) < p_n < n(log n + log log n + 8)` for `n > 1`; and
  `n(log n + log log n − 4) < p_n < n(log n + log log n + 2)` for `n ≥ 55`. Each follows from the
  Rosser–Schoenfeld statements above (`−10 < −4 < −3/2` and `0 < 2 < 8`), the upper bound with `+8`
  at `2 ≤ n ≤ 5` from `p_n ≤ 11`.

*Needs:* §5.1; §3.5; §1.3.

### 5.3 Robin, Massias–Robin and Dusart

- Robin (`robin-1983` lines 59–66 and 81–84, Théorème 8 and the displayed consequences; `pnt-plus`):
  under the hypotheses of §3.2 and *RosserSchoenfeld1962Range*:
  `p_k ≥ k(log k + log log k − 1.0072629)` for `k ≥ 2`;
  `θ(p_k) ≥ k(log k + log log k − 1 + (log log k − 2.1454)/log k)` for `k ≥ 3` (the form used at
  `dusart-1999-mc` lines 123–126); and `p_k ≤ k(log k + log log k − 0.9385)` for `k ≥ 8602` (the
  source prints `k ≥ 7022`): for `k ≥ 39 017` it follows from Dusart's `−0.9484` below, and for
  `8602 ≤ k ≤ 39 016` it is *Robin1983Range*. Robin's range `p_k > k(log k + log log k − 1)` for
  `k ≥ 2` with `p_k ≤ 10¹¹` is `RobinNthPrimeRange` (§1.3).
- Massias–Robin (`massias-robin-1996`, Théorème A, cited by locator, with the ranges as
  `dusart-1999-mc` lines 30–32 report them, in `k`): `p_k ≥ k(log k + log log k − 1)` for
  `2 ≤ k ≤ e⁵⁹⁸` and for `k ≥ e¹⁸⁰⁰`. Dusart's theorem below covers every `k ≥ 2`.
- Dusart (`dusart-1999-mc` lines 116–125, Theorem 3; line 168). Prove `dusart_nth_prime_lower`:
  from `RobinNthPrimeRange` (`p_k > k(log k + log log k − 1)` for `k ≥ 2` with `p_k ≤ 10¹¹`),
  Robin's lower bound for `θ(p_k)` above (for `k ≥ 3`), and the inputs
  `|θ(x) − x| < 0.0077629 x/log x` for `x > e²²` ((5.6b*) of Schoenfeld's Theorem 7*, §3.2;
  `schoenfeld-1976` line 772), `|θ(x) − x| < 1.657·10⁷ x/log⁴ x` for `x > 1` ((5.8*)–(5.9*) of his
  Theorem 8*, lines 1280–1283) and `|ψ(x) − x| ≤ 0.905·10⁻⁷ x` for `x ≥ e⁵⁰` (§3.3), for every
  `k ≥ 2`, `p_k > k(log k + log log k − 1)`, the strict inequality of the source's title. The
  inputs are instances of §3.2 and §3.3 (Dusart's
  `η₄ = 1 717 433` of §3.3 implies the second), so the theorem holds under the hypotheses of §3.3
  (among them `RH(30 610 046 000)`, *VanDeLuneZeroCount* and *RosserSchoenfeldLowZeros*) and
  `RobinNthPrimeRange`; under the same hypotheses and *DusartThesisRange*,
  `p_k ≤ k(log k + log log k − 0.9484)` for `k ≥ 39 017`. Route for the first (`dusart-1999-mc`
  lines 116–159): `RobinNthPrimeRange` for `p_k ≤ 10¹¹`; in each of the three ranges below,
  `p_k ≥ θ(p_k) − (θ(p_k) − p_k)` with Robin's lower bound for `θ(p_k)`, so it suffices that
  `θ(p_k) − p_k ≤ k (log log k − 2.1454)/log k`. The source also uses `p_k ≤ k log p_k` and
  `p_k ≤ k(log k + log log k)` (its Lemma 1); up to a factor `1 + 10⁻³`, which the margins below
  absorb, both follow from `θ(p_k) ≤ k log p_k` and the lower half of the `θ`-inputs. For
  `10¹¹ ≤ p_k ≤ e⁵⁰⁰`, `θ(p_k) − p_k < 0.0077629 p_k/log p_k ≤ 1.0004 · 0.0077629 k`; for
  `e⁵⁰⁰ < p_k < e¹⁸⁰⁰`, the `ψ`-input with `θ ≤ ψ` (Mathlib `Chebyshev.theta_le_psi`), which suffices
  because `0.905·10⁻⁷ ≤ (log log k − 2.1454)/(log k (log k + log log k))` there; for `p_k ≥ e¹⁸⁰⁰`,
  the `η₄`-input, which gives `θ(p_k) − p_k ≤ 1.657·10⁷ (1 + 2·10⁻⁶) k/log³ p_k` and suffices
  because `log k ≥ 1792.5` and `log² k (log log k − 2.1454) ≥ 1.7177·10⁷ > 1.6571·10⁷` there.
- Dusart's later two-term bounds (`dusart-2018`, Propositions 6.6–6.7 of the arXiv copy), under the
  hypotheses of §3.3 (its `θ` rows, re-proved there through §3.7) and *Dusart2018Range*:
  `p_k ≤ k(log k + log log k − 1 + (log log k − 2)/log k)` for `k ≥ 688 383`, and
  `p_k ≥ k(log k + log log k − 1 + (log log k − 2.1)/log k)` for `k ≥ 3`. Route: §5.1 with the `θ`
  row `η₃ = 0.78` for `log p_k > 27` (and the smaller constants of §3.7 beyond `e²⁹`), and for the
  lower bound the inequality `p_k ≥ θ(p_k) − η₂ p_k/log² p_k` with Robin's lower bound for `θ(p_k)`;
  below `e²⁷`, *Dusart2018Range*. The `−1` of Dusart 1999 stays the headline lower bound;
  these are its refinements.
- Dusart's bounds for `θ(p_k)` and the intermediate upper bound (`dusart-2018`, journal
  Propositions 5.11–5.12 and Lemma 5.14; Massias–Robin's Théorème B(v), `massias-robin-1996`, cited
  by locator), under the hypotheses of §3.3 and *Dusart2018Range*:
  `θ(p_k) ≥ k(log k + log log k − 1 + (log log k − 2.050735)/log k)` for `p_k ≥ 10¹¹`, and with `2.04`
  for `p_k ≥ 10¹⁵`, sharpening Robin's `2.1454`;
  `θ(p_k) ≤ k(log k + log log k − 1 + (log log k − 2)/log k)` for `k ≥ 198` (Massias–Robin), and the
  same less `0.782 k/log² k` for `k ≥ 781`; and
  `p_k ≤ k(log k + log log k − 1 + (log log k − 1.95)/log k)` for `k ≥ 178 974`, which fills the range
  `[178 974, 688 383)` between the `−0.9484` bound and the two-term bound above. Route: the `π`
  bounds of journal Theorem 5.1 (§3.5) at `x = p_k`, where `π(p_k) = k`, inverted as in §5.1, and
  `θ(p_k) = p_k + (θ(p_k) − p_k)` with the `θ` rows of §3.3 (the smaller constants of §3.7 beyond
  `e²⁹`); below `e²⁷`, *Dusart2018Range*.

*Needs:* §5.1; §3.2; §3.3; §3.7; §1.3 (`RobinNthPrimeRange`, *Robin1983Range*, *DusartThesisRange*,
*Dusart2018Range*); for `dusart_nth_prime_lower`, only its inputs and Mathlib
`Nat.nth Nat.Prime`, `Chebyshev.theta`, `Chebyshev.psi`, `Chebyshev.theta_le_psi`.

**Checks.**

- `1.0072629 > 1 > 0.9484 > 0.9385`: the lower constants decrease toward `1` from above and the
  upper ones toward `1` from below, consistent with Cipolla's `−1`.

### 5.4 Cipolla's expansion

`cipolla-1902` (pp. 132–166, cited by locator; `pnt-plus`): as `n → ∞`,
`p_n = n (log n + log log n − 1 + (log log n − 2)/log n − ((log log n)² − 6 log log n + 11)/(2 log² n)
+ o(1/log² n))`. Route: invert `π(x) = Li x + O(x exp(−c √log x))` (ZerosOfLFunctions §8.5 at `K =
  ℚ`) at `x =
  p_n`, using the expansion of `Li` (§8.9 there) and the bootstrap of §5.1. Its explicit three-term form, with `11` replaced by `10.667` above and `11.508`
  below, is Axler's (§5.6).

*Needs:* ZerosOfLFunctions §§8.5, 8.9; §5.1.

**Checks.**

- Dropping the `−1` changes the estimate by `n = 10⁶`, far outside the error; the third term is
  positive since `log log n > 2` for `n > e^{e²} = 1619`.

### 5.5 Sums of the first n primes

- Axler (`pnt-plus`; `axler-2019`, J. Théor. Nombres Bordeaux 31, lines 145–150, Theorems 1.6–1.7
  for Mandl's quantity; lines 159–166, Theorems 1.8–1.9 for the sum itself), with
  `B_n = n p_n/2 − ∑_{k ≤ n} p_k` (line 337), under the hypotheses of §3.5 (Axler's `π` bounds) and
  *Axler2019Range* (§1.3): `B_n > n²/4 + n²/(4 log n) − n²(log log n − 2.9)/(4 log² n)` for
  `n ≥ 6 309 751`; `B_n < n²/4 + n²/(4 log n) − n²(log log n − 4.42)/(4 log² n)` for `n ≥ 256 376`;
  `∑_{k ≤ n} p_k < (n²/2)(log n + log log n − 3/2 + (log log n − 5/2)/log n − ((log log n)² − 7 log log n + 13.567)/(2 log² n))`
  for `n ≥ 1 897 700`;
  `∑_{k ≤ n} p_k > (n²/2)(log n + log log n − 3/2 + (log log n − 5/2)/log n − ((log log n)² − 7 log log n + 15.741)/(2 log² n))`
  for `n ≥ 2`. Route: `∑_{k ≤ n} p_k = n p_n − ∫₂^{p_n} π(t) dt` and
  `B_n = ∫₂^{p_n} π(t) dt − n p_n/2`, with the `π` bounds of §3.5 and the `p_n` bounds of §5.3.
- Zhang–Xiong (`zhang-xiong-2025`, Integers 25, A58, Theorem 1), the sharper constants in Mandl's
  quantity for large `n`, under the hypotheses of §§5.3 and 5.6: with
  `B_η(n) = (n²/4)(1 + 1/log n − (log log n − η)/log² n)`, `B_{3.151332}(n) < B_n` for
  `n ≥ 234 057 667 276 344 608` and `B_n < B_{4.168668}(n)` for `n ≥ 64 497 259 289`. Route: the
  identity for `B_n` with the explicit bounds for `p_n` and `π` inserted (the paper's
  Propositions 2 and 4). Axler's `2.9` and `4.42` stay the statements on the lower ranges.
- De Koninck–Letendre (`de-koninck-letendre-2020` lines 489–500, Lemma 4.8; `pnt-plus`), under the
  hypotheses of §5.2: `∑_{i ≤ k} log p_i ≤ k(log k + log log k − 1/2)` for `k ≥ 5`, and
  `∑_{i ≤ k} log log p_i ≥ k(log log k + (log log k − 3/2)/log k)` for `k ≥ 6`.

*Needs:* §3.5; §5.2; §5.3; §1.3; Mathlib Abel summation.

**Checks.**

- The main term `(n²/2) log n` of `∑ p_k` is consistent with `p_k ∼ k log k`:
  `∑_{k ≤ n} k log k ∼ (n²/2) log n`.
- Zhang–Xiong against Axler: `B_η(n)` increases with `η`, so `3.151332 > 2.9` raises the lower bound
  and `4.168668 < 4.42` lowers the upper one; the price is the thresholds, `2.3·10¹⁷` and `6.4·10¹⁰`
  against `6 309 751` and `256 376`.

### 5.6 Axler's explicit Cipolla bounds

Axler (`axler-2019-nth-prime`, J. Integer Seq. 22, Article 19.4.2, Theorems 1.1–1.2), under the
`π` bounds of §3.5 (the forms of `axler-2016` and `axler-2018`) and the bootstrap of §5.1:

-
  `p_n < n(log n + log log n − 1 + (log log n − 2)/log n − ((log log n)² − 6 log log n + 10.667)/ (2 log² n))`
  for `n ≥ 46 254 381`;
-
  `p_n > n(log n + log log n − 1 + (log log n − 2)/log n − ((log log n)² − 6 log log n + 11.508)/ (2 log² n))`
  for `n ≥ 2`.

Route (the paper's §§2–4): explicit two-sided bounds for `1/log p_n` in terms of `log n` and
`log log n`, obtained from the `π` bounds at `x = p_n` (§5.1), inserted into the `π` bounds again,
for `n ≥ 1 338 564 587` (where `log n ≥ 0.87 log p_n`); below, *AxlerNthPrimeRange*. These are the
explicit forms of Cipolla's third term (§5.4), whose constant `11` lies between them, and they
sharpen Dusart's two-term bounds of §5.3 for large `n`.

*Needs:* §3.5; §5.1; §5.3; §1.3 (*AxlerNthPrimeRange*); Mathlib `Nat.nth`.

**Checks.**

- `10.667 < 11 < 11.508`: the explicit constants bracket Cipolla's, as an upper and a lower bound
  must.

### Examples

- Rosser–Schoenfeld's `n log n < p_n < n(log n + log log n)` for `n ≥ 6` (§5.2).
- Dusart's `p_k > k(log k + log log k − 1)` for every `k ≥ 2` (§5.3).
- `p_n ∼ n log n` (§0.3b), which every two-sided bound of this layer refines.

### Dependencies

Layers 0, 1, 3; ZerosOfLFunctions §§8.5, 8.9; Mathlib `Nat.nth`; `Nat.primeCounting_nth_prime`
(Tau Ceti).

## Layer 6: primes in arithmetic progressions

Throughout, `q ≥ 1`, `a : ZMod q`, and `ψ(x; q, a)`, `θ(x; q, a)`, `π(x; q, a)` are the carriers of
AnalyticNumberTheoryPartI §0.2; `φ` is `Nat.totient`.

### 6.1 The general theorem for a modulus

- *Shape of Ramaré–Rumely and Dusart* (`ramare-rumely-1996` lines 58–65, Theorem 1, and its
  Theorem 4.3.2; `dusart-2002` lines 989–1012, Theorem 5). Let `q > 1`, `H > 1000` with
  `GRH*(q, H)`, and `9.14 ≤ C₁(q) ≤ 32π` with *RamareRumelyRegion* `q H C₁(q)` (the region for a
  modulus below, at `C = C₁(q)`), with `R = 9.645908801`. With
  `X = √(log x/R)` and `ε(X) = 3 √(q/(φ(q) C₁(q))) X^{1/2} e^{−X}` (the display of lines
  999–1002, the radical spanning the quotient as in Theorem 4's display at lines 702–707), for
  every `x` with `X > X₄(q, H)`, the
  explicit threshold `max(10, X₀, X₁, X₂, X₃)` of lines 989–998,
  `max_{1 ≤ y ≤ x} |ψ(y; q, a) − y/φ(q)| < x ε(X)` and `max_{1 ≤ y ≤ x} |θ(y; q, a) − y/φ(q)| < x ε(X)`
  for every unit `a`. At a row `(q, ε, x₀)` of a table proposition below the theorem reads
  `max_{1 ≤ y ≤ x} |ψ(y; q, a) − y/φ(q)| ≤ ε x/φ(q)` and the same for `θ`, for `x ≥ x₀`.
- *Shape of McCurley* (`mccurley-1984` lines 56–62, Theorem 1.1; lines 122–130, Theorem 1.2): with
  `R = 9.645908801`, define *IsExceptionalModulus* `q` as: some real character `χ` modulo `q` has a
  real zero `β` with `β > 1 − 1/(R log q)`. The region of McCurley's Theorem 1.1 (at most one zero
  of `∏_{χ mod q} L(s, χ)` with `σ > 1 − 1/(R log max(q, q|t|, 10))`, real and simple and of a real
  nonprincipal character) follows for `q ≥ 3` from the region with `R = 6.4355` of
  `gap:dirichlet-zero-free-constants` (given `RH(3·10¹²)`, *BrentPlattTrudgianRecord* and
  *PlattRecord*), since `6.4355 < 9.645908801` and `max(q, q|t|, 10) ≥ max(q, q|t|, 1.7367)`; it is
  also the McCurley item of that gap, given `RH(545 439 823)` and *PlattRecord*. The instances of
  this shape carry the hypotheses of the item they use. For `q` not exceptional with `q > 10^b`,
  `a` a unit, and `(ε, b)` an entry of McCurley's Table 1 with its `c`, `|ψ(x; q, a) − x/φ(q)| < ε x/φ(q)` and
  `|θ(x; q, a) − x/φ(q)| < ε x/φ(q)` for `x ≥ exp(c log² q)`, under the table proposition
  *McCurleyTable*.
- *Ramaré–Rumely's region for a modulus.* Write *RamareRumelyRegion* `q H C`, for an integer
  `q ≥ 1` and reals `H, C > 0`, for: for every Dirichlet character `χ` modulo `q` and every zero
  `β + iγ` of `L(s, χ)` with `0 < β < 1` and `|γ| ≥ H`, `1 − β ≥ 1/(R log(q|γ|/C))`, with
  `R = 9.645908801`. For `q ≥ 1`, `H ≥ 1000` and `0 < C ≤ C₁(k, H)` for the conductor `k` of every
  character modulo `q`, *RamareRumelyRegion* `q H C` is ExplicitZetaBounds §7.5's form for a
  modulus, which ends its fifth item (`gap:dirichlet-zero-free-constants`); here `C₁(k, H)` is
  Ramaré–Rumely's constant of the form for a primitive character of conductor `k` in that item. A
  zero with `0 < β < 1` of `L(s, χ)` is one of the primitive character inducing `χ`, of conductor
  `k ∣ q`, and `k ≤ q` with `C ≤ C₁(k, H)` makes the bound for the modulus the weaker one. At
  `q = 1` the only character is `χ₀ = 1`, with `L(s, χ₀) = ζ(s)`, and the statement is the
  supplier's form for a primitive character at `k = 1`.
- The region of the first shape is *RamareRumelyRegion* `q H C₁(q)` at Dusart's constant
  `C₁(q) = min(min_{χ mod q} C₁(k_χ, H), 32π)` (his (3), `dusart-2002` lines 105–112), `k_χ` being
  the conductor of `χ`. `C₁(q)` meets the hypothesis `0 < C ≤ C₁(k, H)` for the conductor `k` of
  every character modulo `q`: it is a minimum over those conductors, and it is at least
  `C₁ = 4.171838431`, since every `C₁(k, H)` is and `32π > C₁`. So for `q ≥ 1` and `H ≥ 1000` the
  supplier's form for a modulus gives *RamareRumelyRegion* `q H C₁(q)`, and the instances of the
  first shape below take the region from there. A smaller constant gives a weaker region, and
  `C₁(q) ≥ 9.14` for `q > 1` and `H > 1000` (`dusart-2002` line 107).
- Route for both: orthogonality `φ(q) ψ(x; q, a) = ∑_χ conj χ(a) ψ(x, χ)`, the smoothed explicit
  formula of §2.1 for each `ψ(x, χ)` (ZerosOfLFunctions §8.6 at `K = ℚ` through
  AnalyticNumberTheoryPartI §0.30, extended to the kernel class), `GRH*(q, H)` for the low zeros,
  the region and ExplicitZetaBounds §5.4 for the high zeros, and
  `gap:dirichlet-zero-count-error` for the counts.

Table propositions of this section, each asserting that the error function of the shape it names,
at the parameters of every entry of the table, is at most the entry's value:

- *RamareRumelyTable1* (`ramare-rumely-1996` lines 58–74 and line 1385, Table 1), for the first
  shape, each row under `GRH*(k, H)` at the height Rumely verified for `k`, with the region
  *RamareRumelyRegion* `k H C₁(k)` at Dusart's `C₁(k)` (the region for a modulus, above): the rows
  `(k, ε, x₀)`, in
  particular `(1, 0.000213, 10¹⁰)`, `(8, 0.002811, 10¹⁰)`, and the uniform rows
  `k ≤ 13: (0.004560, 10¹⁰)`, `k ≤ 72: (0.023269, 10¹⁰)`.
- *Dusart2002Table* (`dusart-2002` lines 989–1012, Theorem 5 and its table), for the first shape,
  each row under the same hypothesis and region: the rows `(k, ε, x₀)`.
- *McCurleyTable* (`mccurley-1984` lines 63–118, Table 1), for the second shape: the entries
  `(ε, b) ↦ c` for `ε ∈ {0.1, 0.05, 0.01, 0.005, 0.001, 0.0001, 0.00001}`.

The theta clause of *ModEightFiniteInput* of AnalyticNumberTheoryPartI §0.16
(`|θ(x; 8, a) − x/4| ≤ 0.002811 x/4` for `a ∈ {3, 5}` and `10¹⁰ ≤ x < exp 10000`) follows from the
first shape at the row `(8, 0.002811, 10¹⁰)` of *RamareRumelyTable1*, under `GRH*(8, 10 000)`, with
*RamareRumelyRegion* `8 10 000 C₁(8)` from the region for a modulus (above).

*Needs:* §2.1; §0.3; §1.2; AnalyticNumberTheoryPartI §§0.2, 0.16, 0.30; ZerosOfLFunctions §8.6;
`gap:grh-up-to-height`; ExplicitZetaBounds §7.5 (`gap:dirichlet-zero-free-constants`: the form for
a modulus that ends its fifth item, for *RamareRumelyRegion*; Kadiri's `6.4355` item and McCurley's
item for the second shape, with the hypotheses listed there) and §0.2 (the passage to imprimitive
characters); `gap:rh-up-to-height`; `gap:dirichlet-zero-count-error`; ExplicitZetaBounds §5.4;
Mathlib `Nat.totient`, `DirichletCharacter.sum_char_inv_mul_char_eq`,
`DirichletCharacter.conductor_dvd_level`.

**Checks.**

- The region for a modulus at the nonprincipal character modulo `6`, induced by `χ₋₃` of
  conductor `3` with `C₁(3, 10⁴) = 20.92` (`ramare-rumely-1996` line 846), at `|γ| = 10⁴` and
  `C = 20.92`: the form for the primitive character gives
  `1 − β ≥ 1/(R log(3·10⁴/20.92)) = 0.014264`, and the bound for the modulus is
  `1/(R log(6·10⁴/20.92)) = 0.013022`, the weaker one, as `k ≤ q` requires. The
  hypothesis on `C` concerns the conductors of the characters, not `q`: the two characters modulo
  `6` have conductors `1` and `3`, none has conductor `6`, so `C₁(6, H)` plays no role there.
- The constant `C₁ = 4.171838431` is admissible for every `q ≥ 1` and `H ≥ 1000`, every
  `C₁(k, H)` being at least `C₁`; at `q = 6`, `|γ| = 10⁴` it gives `0.010829`, weaker than at
  `C = 20.92`, since a smaller constant gives a weaker region. And the logarithm is positive with
  room to spare: `R log(1000/C₁) = 52.85 > 0`.
- `q = 1` (Ramaré–Rumely's rows with `k = 1`) is the `ψ` statement of Layer 3 with
  `GRH*(1, H) = RH(H)`; Dusart's Theorem 5 itself asks `q > 1`.
- For `a` not a unit the statement is false: `ψ(x; 2, 0) = ∑_{2^k ≤ x} log 2 ≈ log x` while
  `x/φ(2) = x`; the unit hypothesis is in every statement.

### 6.2 Ramaré–Rumely's tabulation and its consequences

Under *RamareRumelyTabulation* (§1.5): for `k` in Ramaré–Rumely's Table 1, `l` a unit modulo `k`,
and `x₀ ≤ x ≤ 10¹⁰`, `max_{1 ≤ y ≤ x} |θ(y; k, l) − y/φ(k)| ≤ 2.072 √x ≤ (2.072 φ(k)/√x₀) x/φ(k)`
(`ramare-rumely-1996` lines 85–87), so the row `(k, 2.072 φ(k)/√x₀, x₀)` is admissible on
`[x₀, 10¹⁰]`; for `k = 5` or `k ≥ 7` the constant `1.745` for `ψ` may be replaced by `1.000` (lines
88–90, a sharper tabulation proposition *RamareRumelyTabulationSharp*).

*Needs:* §1.5; AnalyticNumberTheoryPartI §0.2.

### 6.3 Bennett–Martin–O'Bryant–Rechnitzer

Under `GRH*(q, 10⁸/q)` for all `q ≤ 400 000` (given *PlattRecord* and `RH(3 000 175 332 800)`,
through §1.2), *PlattCentralRecord* (§1.2; with *PlattRecord* it excludes every real zero in
`(0, 1)` of the primitive characters of conductor at most `400 000`, by ExplicitZetaBounds §0.3,
`LFunction_ne_zero_of_platt`, and so makes *RealZeroGap* `c Q` true for every `c` when
`Q ≤ 400 000`, the trivial case of its §7.9), the regions for the high zeros (for `3 ≤ q ≤ 10⁵`,
Kadiri's region with `R = 5.60` for the nonprincipal primitive characters of conductor
`3 ≤ f ≤ 400 000`, in `gap:dirichlet-zero-free-constants`, and the classical-shape region for `ζ`
with `R = 5.573412`, in `gap:classical-zero-free-constants`; for `q > 10⁵`, McCurley's region with
its exceptional clause, in `gap:dirichlet-zero-free-constants`, which the region with `R = 6.4355`
implies, §6.1), the Dirichlet zero count (`gap:dirichlet-zero-count-error`), the exceptional clause
below, and *BMORTables* (`bennett-martin-obryant-rechnitzer-2018` lines 165–195, Theorems
1.1–1.3): for `q ≥ 3` and `a` a unit modulo `q`, with
`c₀(q) = 1/840` for `3 ≤ q ≤ 10⁴` and `1/160` for `q > 10⁴`, and `x₀(q) = 8·10⁹` for `3 ≤ q ≤ 10⁵`
and `exp(0.03 √q log³ q)` for `q > 10⁵`:

- `|ψ(x; q, a) − x/φ(q)| < c_ψ(q) x/log x` for `x ≥ x_ψ(q)`, with `c_ψ(q) ≤ c₀(q)` and `x_ψ(q) ≤ x₀(q)`;
- `|θ(x; q, a) − x/φ(q)| < c_θ(q) x/log x` for `x ≥ x_θ(q)`, with the same bounds;
- `|π(x; q, a) − Li x/φ(q)| < c_π(q) x/log² x` for `x ≥ x_π(q)`, with the same bounds;

where for `3 ≤ q ≤ 10⁵` the constants are the rows of *BMORTables* and for `q > 10⁵` they are
`c₀(q), x₀(q)` themselves.

For `3 ≤ q ≤ 10⁵` the hypotheses give the paper's Hypothesis Z(10⁸/q, 5.6) at the heights of its
tables (`bennett-martin-obryant-rechnitzer-2018` lines 1163–1169, Definition 3.1, and lines
2784–2803, Proposition 4.34 and the choice of `H₂`): every character modulo `q`, of conductor
`d ∣ q`, has its zeros with `|γ| ≤ H₂(d)` on `Re s = 1/2`, where `H₂(1) = 30 610 046 000` and
`H₂(d) = 10⁸/d` for `d > 1`, by `RH(3 000 175 332 800)` and `GRH*(d, 10⁸/d)`; and its zeros with
`|γ| > H₂(d)` satisfy `β ≤ 1 − 1/(5.6 log(d|γ|))`, for `d ≥ 3` by Kadiri's region (there
`|γ| ≥ 1000`, so `log(d max(1, |γ|)) = log(d|γ|)`), and for `d = 1` by the region for `ζ`, since
`5.573412 < 5.6`; no character has conductor `2`. The paper takes Kadiri's region from Kadiri's
Theorem 1.1 (its reference [17], line 5158) and the region for `ζ` from Mossinghoff–Trudgian, and
its tables are evaluated at `R = 5.6` (lines 2792–2795); the region with `R = 6.4355` does not give
the hypothesis (Checks). Route: §6.1's scheme for the modulus `q`, with the explicit formula and
the paper's kernel; for `3 ≤ q ≤ 10⁵` at `R = 5.6` under that hypothesis (the paper's Theorem 4.33)
with the table proposition *BMORTables*; for `q > 10⁵` in the McCurley shape with the exceptional
clause (the paper's §6, through its Lemma 6.12); the `θ` form by §0.3 classwise, the `π` form by
the progression analogue of §0.4 (Abel summation of `θ(·; q, a)`).

The exceptional clause enters only for `q > 10⁵`, through a lower bound for `1 − β` at a possible
exceptional zero `β` of a quadratic character modulo `q`: the paper's proof uses its Proposition
1.11, `β ≤ 1 − 40/(√q log² q)` (lines 377–379, used in its Lemmas 6.8 and 6.12, lines 3825–3834
and 3992–4010), and that is what the threshold `exp(0.03 √q log³ q)` pays for. For
`10⁵ < q ≤ 400 000` the hypotheses above already exclude it: a real zero in `(0, 1)` of a character
modulo `q` is one of a primitive character of conductor at most `400 000`, which *PlattRecord* and
*PlattCentralRecord* exclude. For `q > 400 000` the theorem takes the clause as a hypothesis in one
of the following forms, each supplied elsewhere and each giving the absence of an exceptional zero
or the paper's bound on the range named: the paper's own bound, for every `q ≥ 3`
(AnalyticNumberTheoryPartI §0.7, `quadratic_real_zero_le_of_bmor`, under its `BMORFiniteInput` and
`BMORClassNumberInput`); for `q ≤ 10¹⁰`, no exceptional zero at all (*RealZeroGap* `(1/5) 10¹⁰`
given *LuZamanZhaoRecord*, through §6.7(a), or the exception-free region of `lu-zaman-zhao-2026`
Corollary 1.2 in `gap:dirichlet-zero-free-constants`, given `RH(545 439 823)` and
*LuZamanZhaoRecord*); the Siegel-type bound `β ≤ 1 − 100/(√q₁ log² q₁)` of `thorner-zaman-2024`
Theorem 2.6 at the conductor `q₁ ≤ q` of the exceptional character (given `RH(545 439 823)`,
*PlattRecord* and *BordignonRecord*), which is at least the paper's bound since `q₁ ≤ q` and
`100 > 40`; and, conditionally on the unrefereed *RealZeroGap* `(3.0·10⁻³) ∞`,
`1 − β ≥ 3.0·10⁻³/log q` (§6.7(b)), which is at least `40/(√q log² q)` exactly when
`√q log q ≥ 40/(3.0·10⁻³)`, that is for `q ≥ 939 839`; below that modulus it serves only together
with one of the other forms (Checks). Each form brings the records named with it. The printed
thresholds `x₀(q)` are the paper's and are not lowered here by the stronger inputs; a version of
the large-`q` theorem with a threshold of shape `exp(C log² q)` from that gap would be a new
theorem and is not stated.

Table proposition of this section:

- *BMORTables*: for every `3 ≤ q ≤ 10⁵`, the per-modulus constants
  `c_ψ(q), c_θ(q), c_π(q), x_ψ(q), x_θ(q), x_π(q)` of the paper's tables, each at most the uniform
  `c₀(q)`, `x₀(q)` above, bound the explicit error function of the paper's proof at `q`, and the
  three inequalities hold with them on the bounded ranges where that error function is not used
  (`bennett-martin-obryant-rechnitzer-2018` lines 165–167 and its tables).

*Needs:* §6.1; §6.7; §0.3; §0.4; §1.2 (*PlattRecord*, *PlattCentralRecord*); ExplicitZetaBounds
§0.3 (`LFunction_ne_zero_of_platt`) and §7.9 (its trivial case);
`gap:grh-up-to-height`; `gap:rh-up-to-height`; `gap:dirichlet-zero-free-constants` (Kadiri's `5.60`
item for `q ≤ 10⁵`, McCurley's item for `q > 10⁵`); `gap:classical-zero-free-constants` (the
`5.573412` region); `gap:dirichlet-zero-count-error`; `gap:real-zero-gap`;
AnalyticNumberTheoryPartI §0.7 (for the paper's own form of the exceptional clause).

**Checks.**

- At `q = 10⁴ + 1` the constant jumps from `1/840` to `1/160` and at `q = 10⁵ + 1` the threshold
  from `8·10⁹` to `exp(0.03 √q log³ q) = exp(0.03 · 316.23 · 1526.0) = exp(14 477)`: the two regimes
  are the two cases of the paper, not a continuous function.
- `q = 2` is excluded (`q ≥ 3`): the only unit class modulo `2` is the odd numbers, for which the
  statement reduces to Layer 3 after removing the powers of `2`.
- The small moduli need Kadiri's `5.60` region, not the `6.4355` one (negative control): for a
  character of conductor `10⁴` modulo `q = 10⁴`, a zero just above `H₂(10⁴) = 10⁴` must have
  `1 − β ≥ 1/(5.6 log 10⁸) = 0.0096941` under Hypothesis Z(10⁸/q, 5.6); Kadiri's `5.60` region gives
  `1/(5.60 log 10⁸) = 0.0096941`, while the region with `R = 6.4355` gives only
  `1/(6.4355 log max(q, q|γ|)) = 0.0084355` there.
- For `ζ` the same hypothesis asks, at `|γ| = H₂(1) = 30 610 046 000`,
  `1 − β ≥ 1/(5.6 log|γ|) = 0.0073959`: the region with `R = 5.573412` gives `0.0074312`, and the
  region with `R = 5.69693`, which needs only `RH(30 610 046 000)`, gives `0.0072701`, too little.
- The forms of the exceptional clause against the paper's `40/(√q log² q)`: at `q = 4·10⁵ + 1` it
  is `3.801·10⁻⁴`, while *RealZeroGap* `(3.0·10⁻³) ∞` gives only `3.0·10⁻³/log q = 2.326·10⁻⁴`; the
  two sides meet at `q = 939 839`, where both are `2.181·10⁻⁴`, and from there on the gap gives
  more. Thorner–Zaman's bound at `q₁ = q` is `100/40 = 2.5` times the paper's, and larger for
  `q₁ < q`, since `√t log² t` increases.
- The `π` bound uses `Li x/φ(q) = ∫₂ˣ dt/log t/φ(q)`, the paper's normalisation (lines 165–195),
  not `li x/φ(q)`: replacing `Li` by `li` changes the left side by `li 2/φ(q)`, which would have to
  be absorbed by the margin below `c_π(q) x/log² x`, and the printed constants are not asserted for
  that form.

### 6.4 Ramaré's Mertens theorem in progressions

- General theorem (Ramaré's explicit transfer, `ramare-2002` lines 980–1004, §9): let `q ≥ 3`,
  `1 ≤ L₁ ≤ L₀`, and suppose that `ψ(x; d, a) = (x/φ(d))(1 + O*(η_d))` for every divisor `d` of `q`,
  every unit `a` modulo `d` and every `x ≥ L₀`, and that `ψ(x; q, a) = x/φ(q) + O*(η_q √x)` for every
  unit `a` and `L₁ ≤ x ≤ L₀`. Then for `L ≥ L₂ ≥ L₁` and every unit `a`,
  `|logPsiAP q a L − log L/φ(q) − C(q, a)|` is at most the explicit quantity (44), built from `η_q`,
  `L₀`, `L₂`, the values `|L(1, χ)|` for the primitive characters `χ` modulo the divisors `d ≠ 1` of
  `q`, and the quantities `τ_d` of (45) with their free parameters `θ_d`. Route: the explicit form
  (§6, lines 646–693, with Lemme 6) of Ramaré's Theorem 1, which deduces the logarithmic sum from
  the Chebyshev bounds by a bilinear identity over the characters, not by integration by parts:
  the integration by parts needs much stronger information on `ψ(L; q, a)` than the Chebyshev
  bounds give (lines 137–139).
- Instances: under `GRH*(q, 2500)` for `q` in Rumely's list (§1.2), *RamareRumelyTable1* (the rows
  for every divisor of `q`, as `η_d` with `L₀ = 10¹⁰`), *RamareRumelyTabulation* (as `η_q = 1.745`
  on `[1, 10¹⁰]`), *Ramare2002Tabulation* (§1.5) and *Ramare2002Tables* below: for every `q` in
  Rumely's list and every unit `a` modulo `q`,
  - `|logPsiAP q a x − log x/φ(q) − C(q, a)| ≤ 1` for every `x ≥ 1` (`ramare-2002` lines 181–187,
    Corollaire 5);
  - `|logPsiAP q a x − log x/φ(q) − C(q, a)| ≤ ε♯(q) ≤ 2/9` for `x ≥ 182` (lines 174–180,
    Corollaire 4).

  Route (lines 1228–1235): for `x ≥ 10⁵`, the general theorem with `L₂ = 10⁵` and
  *Ramare2002Tables*; for `261 ≤ x ≤ 10⁵` the first clause of *Ramare2002Tabulation*, since
  `v♯(q)/√x ≤ v♯(q)/√261 ≤ ε♯(q)` (line 1231); for `182 ≤ x ≤ 261` its second clause; for
  `1 ≤ x ≤ 10⁵` its first clause gives `|…| ≤ v♯(q)/√x ≤ 1`.

Table proposition of this section: *Ramare2002Tables* (`ramare-2002` lines 980–1004 and the final
tables): for every `q` in Rumely's list, the quantity (44) at `L₂ = 10⁵`, `L₀ = 10¹⁰`, the `η_d` of
the rows of *RamareRumelyTable1*, `η_q = 1.745` and the paper's `θ_d` is at most the value `ε♯(q)`
of the final tables.

*Needs:* §0.2; §1.2; §1.5; §6.1 (*RamareRumelyTable1*); Mathlib `DirichletCharacter.LFunction`;
AnalyticNumberTheoryPartI §0.2; `gap:grh-up-to-height`.

**Checks.**

- `q = 1` is not in Rumely's list and not asserted; its analogue is §4.2.

### 6.5 The least prime in a progression under the generalised Riemann hypothesis

- The size of the cyclotomic discriminant: for every `q ≥ 1`,
  `(φ(q)/2) log(q/2) ≤ log |disc ℚ(ζ_q)| ≤ φ(q) log q` (`bach-sorenson-1996` lines 926–928, where
  the lower bound is stated for `q ≥ 1000`). Route: Mathlib's value
  `|disc ℚ(ζ_q)| = q^{φ(q)}/∏_{p ∣ q} p^{φ(q)/(p − 1)}` (`IsCyclotomicExtension.Rat.natAbs_discr`);
  the upper bound drops the denominator, and the lower bound is
  `∑_{p ∣ q} log p/(p − 1) ≤ (log q + log 2)/2`, which holds because `log q ≥ ∑_{p ∣ q} log p` and
  `log p/(p − 1) − (log p)/2` is `(log 2)/2` at `p = 2`, `0` at `p = 3` and negative for `p ≥ 5`.
- Bach–Sorenson's explicit Chebotarev bound at a cyclotomic field (lines 802–811, Theorem 5.1 at
  `E = ℚ(ζ_q)`, `K = ℚ`): under `DirichletGRH χ` for every `χ` modulo `q` (AnalyticNumberTheoryPartI
  §1.6), for every unit `m` modulo `q` there is a prime `p ≡ m (mod q)` with
  `p ≤ (4 log |disc ℚ(ζ_q)| + 2.5 φ(q) + 5)²`. Route: the weighted explicit formula of §2.1 for
  `∑_χ conj χ(m) ψ(x, χ)` with the kernel of the paper's §4, the zeros on the line by hypothesis,
  the Dirichlet zero count (`gap:dirichlet-zero-count-error`) summed over the characters, the sum
  of the logarithms of their conductors being `log |disc ℚ(ζ_q)|` by the conductor–discriminant
  formula (ClassFieldTheory Layer 13), and the removal of prime powers; the Frobenius of `p` in
  `Gal(ℚ(ζ_q)/ℚ) = (ℤ/q)^×` is the class of `p`.
- The least prime, the headline: prove `lamzouri_li_soundararajan`, that for `q > 3`, under
  `DirichletGRH χ` for every character `χ` modulo `q` and `LamzouriLiSoundararajanRange`, every unit
  `a` modulo `q` has a prime `p ≡ a (mod q)` with `p ≤ (φ(q) log q)²`
  (`lamzouri-li-soundararajan-2015` Corollary 1.2, Math. Comp. 84, arXiv 1309.3595). Route (the
  paper's §4.3): for `q > 20 000`, the explicit formula for
  `∑_χ conj χ(a) ψ(x, χ)` with the paper's smooth weight at `X = (φ(q) log q)² ≥ 10⁹`, the zeros on
  the line by hypothesis, the Dirichlet zero count, and the elementary bounds `φ(q) ≥ 4156`,
  `φ(q) ≥ q^{5/6}`, `2^{ω(q)} ≤ q^{3/7}` for `q > 20 000`; for `3 < q ≤ 20 000`,
  `LamzouriLiSoundararajanRange` (§1.3).
- The least prime, Bach–Sorenson's form (lines 921–928, Theorem 5.3): under the same hypothesis on
  the characters, for `q ≥ 2` and `m` a unit, some prime `p ≡ m (mod q)` satisfies
  `p < 2 (q log q)²`. Route: for `q > 3` the headline, since `φ(q) < q` gives
  `(φ(q) log q)² < (q log q)² < 2 (q log q)²`; for `q = 2` and `q = 3` directly, the least primes of
  the reduced classes being `3` (modulo `2`) and `7`, `2` (modulo `3`), below `3.84` and `21.7`.
  Bach–Sorenson's own route uses the constants of their Table 3 for `q ≥ 1000` and a computation for
  `2 ≤ q ≤ 1000` (lines 923–937); the route above needs neither.

*Needs:* §2.1; §0.3; §1.3 (`LamzouriLiSoundararajanRange`); AnalyticNumberTheoryPartI §§0.2, 1.6
(`DirichletGRH`); Mathlib `NumberField.discr`, `IsCyclotomicExtension`,
`IsCyclotomicExtension.Rat.natAbs_discr`; ClassFieldTheory Layer 13 (the conductor–discriminant
formula, for Bach–Sorenson's route); `gap:dirichlet-zero-count-error`.

**Checks.**

- Without the hypothesis the statement is open; with `m` not a unit it is false (no prime
  `≡ 0 (mod 4)`), so the unit hypothesis is in the statement.
- `(φ(q) log q)² ≤ 2 (q log q)²` always, with ratio `φ(q)²/(2q²) ≤ 1/2`; for prime `q` the headline
  is better by the factor `2q²/(q − 1)² ≈ 2`, for `q` with many small prime factors by much more.

### 6.6 Kadiri's intervals in progressions

- Kadiri's exceptional moduli (`kadiri-2008` lines 327–334): call `q ≥ 3` *exceptional in Kadiri's
  sense* if `∏_{χ mod q} L(s, χ)` has a zero with `σ ≥ 1 − 1/(6.50 log(q max(1, |t|)))`; by the region
  of `gap:dirichlet-zero-free-constants` (with `6.4355 < 6.50`, given `RH(3·10¹²)`,
  *BrentPlattTrudgianRecord* and *PlattRecord*) there is at most one such zero, real and simple, of a
  real nonprincipal character.
- The zero input of this section: define *LiuWangFourZeros* as: for every real `x ≥ 8·10⁹` and every
  integer `1 ≤ q ≤ x`, the product `∏_{χ mod q} L(s, χ)`, the principal character included, has at
  most four zeros, counted with multiplicity, with `|Im s| ≤ x/q` and `Re s ≥ 1 − 1/(3.82 log x)`
  (Liu–Wang's Theorem 1, as quoted at `kadiri-2008` lines 337–341, her Theorem 2.2, and applied
  there at `x = q`, which the hypothesis `x ≥ 8·10⁹` allows only for `q ≥ 8·10⁹`, and at `x = qH`
  with `H ≥ 1`). ExplicitZetaBounds leaves it to the theorem using it; the source of the statement
  is the quotation, and the instances below carry it as a hypothesis.
- Existence (`kadiri-2008` lines 128–131, Theorem 1.1, with `α` uniform in the modulus as its Table 1
  gives it): under `RH(3·10¹²)`, the region of `gap:dirichlet-zero-free-constants`,
  *LiuWangFourZeros* and the Dirichlet zero count of `gap:dirichlet-zero-count-error`, for every
  `ε > 0` there is `α > 0` such that for every `q ≥ 3`
  not exceptional in Kadiri's sense, every unit `a` modulo `q` and every `x ≥ α log² q`, the
  interval `[eˣ, e^{x+ε}]` contains a prime `p ≡ a (mod q)`. Route: for `q ≥ 8·10⁹`, where
  *LiuWangFourZeros* applies at `x = q` and at `x = qH`, Kadiri's
  smoothed lower bound (lines 102–125) for the weighted sum of `Λ(n)/n` over the class of `a` in
  `(eˣ, e^{x+ε}]`, at `x = α log² q` with a height `H` chosen from `q` and `ε` (line 117), with the
  region for the zeros with `|γ| > H`, the four-zero region for the zeros near `σ = 1` and the
  zero count for the rest; its error terms are explicit in `q` and `ε` (the paper's §4 computes `α`
  from them for every `ε`, line 132), and the prime powers, which contribute `O(x e^{−x/2})`, are
  negligible once `x ≥ α log² q` (line 118). For the finitely many moduli `3 ≤ q < 8·10⁹`, the
  prime number theorem in progressions (Tau Ceti's
  `NumberField.Chebotarev.primeCount_primesCongruent_isEquivalent_logIntegral`: the primes
  `≡ a (mod q)` up to `y` number `∼ Li(y)/φ(q)`) gives, modulus by modulus,
  `π(e^{x+ε}; q, a) − π(eˣ; q, a) ∼ (e^ε − 1) eˣ/(φ(q) x)`, hence a threshold `α_q`; `α` is the
  largest of these and of the value for `q ≥ 8·10⁹`. The theorem as printed lets
  `α` depend on `q`; in that weak form it follows from the prime number theorem in progressions
  alone, for every `q ≥ 1`, so its content is the uniformity. McCurley's shape of §6.1 is not a
  route to it: §6.1 states that shape only at the entries of McCurley's Table 1, the smallest
  being `ε′ = 10⁻⁵`, and the argument through it needs `ε′ < (1 − e^{−ε})/(2e^ε)`.
- The quantitative instances (Table 1, lines 140–162): under `RH(3·10¹²)`, the region of
  `gap:dirichlet-zero-free-constants`, *LiuWangFourZeros*, the Dirichlet zero count
  (`gap:dirichlet-zero-count-error`) and *Kadiri2008Table*:
  for every entry `(q₀, ε) ↦ α(q₀, ε)`, every `q ≥ max(q₀, 8·10⁹)` not exceptional in Kadiri's
  sense, every unit `a` and every `x ≥ α(q₀, ε) log² q`, the interval `[eˣ, e^{x+ε}]` contains a
  prime `p ≡ a (mod q)`. Route: the smoothed lower bound of lines 102–125 for the weighted sum over
  the class of `a`, the region for the zeros with `|γ| > H`, the four-zero region for the few zeros
  near `σ = 1` (*LiuWangFourZeros* at `x = q` for those with `|γ| ≤ 1` and at `x = qH` for those
  with `|γ| ≤ H`, lines 633–639; both are admissible since `q ≥ 8·10⁹` and `H ≥ 1`), and the zero
  count for the rest. The row `q₀ = 5·10⁴` is therefore asserted only from `q = 8·10⁹` on, where it
  covers the moduli `8·10⁹ ≤ q < 10¹⁰` below the next row; the paper applies its Theorem 2.2 at
  `x = q` for every `q ≥ 5·10⁴` (lines 342 and 633–636), outside that theorem's hypothesis
  `x ≥ 8·10⁹` when `q < 8·10⁹`, and no input stated here bounds the number of zeros its split needs
  there (Checks).
- The exceptional clause discharged on a range (§6.7(a)): under *LuZamanZhaoRecord* in addition
  (for *RealZeroGap* `(1/5) 10¹⁰`, §1.7), with *BrentPlattTrudgianRecord* and *PlattRecord* for the
  region of constant `6.4355`, the quantitative instances hold for every `q` with
  `max(q₀, 8·10⁹) ≤ q ≤ 10¹⁰`, with no exceptional modulus left out. For `q > 10¹⁰` the clause
  stays a hypothesis: *RealZeroGap* `(3.0·10⁻³) ∞` does not discharge it (§6.7(b)).

Table proposition of this section: *Kadiri2008Table* (`kadiri-2008` lines 140–162, Table 1): for
every entry, the explicit lower bound of the paper's §§3–4 for the weighted sum of `Λ(n)/n` over
`eˣ < n ≤ e^{x+ε}`, `n ≡ a (mod q)`, is positive for every `q ≥ max(q₀, 8·10⁹)` and
`x ≥ α(q₀, ε) log² q`, the range on which the quantitative instances use it (the table is printed
from `q₀`).

*Needs:* §0.3; ExplicitZetaBounds §7.5 (`gap:dirichlet-zero-free-constants`) with `RH(3·10¹²)`
(`gap:rh-up-to-height`); *LiuWangFourZeros*; `gap:dirichlet-zero-count-error`; for the existence
clause also Tau Ceti
`NumberField.Chebotarev.primeCount_primesCongruent_isEquivalent_logIntegral`.

**Checks.**

- `ε = 0` is excluded: the interval `[eˣ, eˣ]` contains a prime only if `eˣ` is one.
- The row `q₀ = 5·10⁴` below `8·10⁹` (negative control): at `q = 5·10⁴` the four zeros of the
  paper's split have `|γ| ≤ 1` and `1 − 1/(3.82 log q) = 0.975805 ≤ β ≤ 1 − 1/(6.50 log q) = 0.985781`
  (lines 633–636), while *LiuWangFourZeros* admits only `x ≥ 8·10⁹`, where its strip is
  `σ ≥ 1 − 1/(3.82 log x) ≥ 1 − 1/(3.82 log(8·10⁹)) = 0.988520`: it counts no zero of that band, and
  `x = qH ≥ 8·10⁹` would need `H ≥ 1.6·10⁵`. At `q = 8·10⁹` the instance `x = q` is admissible and
  its strip `σ ≥ 0.988520`, `|Im s| ≤ 1` is exactly the band's lower edge and height.
- For an exceptional modulus the theorem is not asserted; the exceptional zero would add a term
  `−x^β/(β φ(q))` that can cancel the main term for `x ≤ exp(c log² q)`.
- The two exceptional notions are nested one way: a zero with `σ ≥ 1 − 1/(6.50 log q)` also has
  `σ ≥ 1 − 1/(6.4355 log q)`, so a modulus that is not exceptional for the constant `6.4355` is not
  exceptional for `6.50`, while the converse fails for a zero between the two bounds (at `q = 10⁵`,
  between `1 − 0.013363 = 0.986637` and `1 − 0.013497 = 0.986503`).

### 6.7 Exceptional moduli and the real-zero gap

What a numerical gap for real zeros (§1.7) removes from the exceptional clauses of §§6.1, 6.3, 6.6.

- (a) Under *RealZeroGap* `c Q` with `c > 1/R`, no modulus `3 ≤ q ≤ Q` is exceptional for a region
  of constant `R`: a real zero `β ∈ (0, 1)` of a real nonprincipal character modulo `q` has
  `(1 − β) log q ≥ c > 1/R` (§1.7, passage to all characters of a modulus), so
  `β < 1 − 1/(R log q)`. In particular, under *RealZeroGap* `(1/5) 10¹⁰` (given *LuZamanZhaoRecord*,
  §1.7), every `3 ≤ q ≤ 10¹⁰`
  is exceptional neither in McCurley's sense of §6.1 (`R = 9.645908801`) nor in Kadiri's sense of
  §6.6 (`R = 6.50`): in Kadiri's case a zero in the region `σ ≥ 1 − 1/(6.50 log(q max(1, |t|)))` lies
  in the region of constant `6.4355` of `gap:dirichlet-zero-free-constants` (`6.4355 < 6.50`, given
  `RH(3·10¹²)`, *BrentPlattTrudgianRecord* and *PlattRecord*), so it is the at most one real zero of
  a real character there, and none exists.
- (b) Under *RealZeroGap* `c ∞` with `0 < c ≤ 1/R`, the exceptional zero of a modulus `q` is not
  excluded, but its contribution `x^{β−1}/β` to `ψ(x; q, a)/(x/φ(q))` is at most
  `exp(−c log x/log q)/β`, which is below any `ε > 0` once `log x ≥ (log q/c) log(1/(βε))`. With
  *RealZeroGap* `(3.0·10⁻³) ∞` (`c = 3.0·10⁻³`), conditionally on that unrefereed hypothesis, this is
  `log x ≥ 333.3 log q log(1/(βε))`: a threshold of shape `exp(C log² q)` for fixed `ε` would need
  also a lower bound for `β` and the rest of the explicit formula, and is not stated. That gap
  does not make any modulus non-exceptional for the regions in use, since
  `3.0·10⁻³ < 1/9.645908801 = 0.1037 < 1/6.50 = 0.1538`.
- (c) The forms of the exceptional clause used by §6.3 for `q > 400 000`, besides the paper's own
  bound `β ≤ 1 − 40/(√q log² q)` (AnalyticNumberTheoryPartI §0.7): no exceptional zero for
  `q ≤ 10¹⁰` ((a) with *RealZeroGap* `(1/5) 10¹⁰`, given *LuZamanZhaoRecord*);
  `β ≤ 1 − 100/(√q₁ log² q₁)` at the conductor `q₁ ∈ (400 000, q]` of the exceptional character
  (`thorner-zaman-2024` Theorem 2.6, through `gap:dirichlet-zero-free-constants`, given
  `RH(545 439 823)`, *PlattRecord* and *BordignonRecord*); and the conditional bound of (b), which
  gives the paper's bound only from `q = 939 839` on.

The qualitative statement that some absolute `c > 0` exists is AnalyticNumberTheoryPartI §0.34
(the uniform exclusion of Landau–Siegel zeros, `openai-2026-siegel`); it gives no numerical `c` and
discharges nothing here on its own.

*Needs:* §1.7; §6.1; §6.6; `gap:real-zero-gap`; `gap:dirichlet-zero-free-constants`;
AnalyticNumberTheoryPartI §0.34; Mathlib `DirichletCharacter.LFunction`.

**Checks.**

- The functional equation pairs `β` with `1 − β`, so a gap statement for zeros near `1` is also one
  for zeros near `0`; neither affects the zeros off the real axis, which the regions of §6.1 handle.

### Examples

- The row `(8, 0.002811, 10¹⁰)` and the theta clause of *ModEightFiniteInput*.
- `(φ(q)/2) log(q/2) ≤ log |disc ℚ(ζ_q)| ≤ φ(q) log q` for every `q ≥ 1` (§6.5).
- *RamareRumelyRegion* `q H 4.171838431` for every `q ≥ 1` and `H ≥ 1000`, every Ramaré–Rumely
  constant `C₁(k, H)` being at least `C₁ = 4.171838431` (§6.1).
- No modulus `3 ≤ q ≤ 10¹⁰` exceptional in McCurley's sense under *LuZamanZhaoRecord* (§6.7(a));
  the least prime `p ≤ (φ(q) log q)²` for `q > 3` under the generalised Riemann hypothesis.

### Dependencies

Layers 0–3; AnalyticNumberTheoryPartI §§0.2, 0.7, 0.16, 0.30, 0.34, 1.6; ZerosOfLFunctions §8.6;
LFunctions Layer 4 (`dirichletData`, through ZerosOfLFunctions §8.6); ClassFieldTheory Layer 13
(the conductor–discriminant formula, §6.5); ExplicitZetaBounds §0.2 (the passage to imprimitive
characters, §6.1), §0.3 (`LFunction_ne_zero_of_platt`, §6.3), §0.4b (*PlattRecord*,
*PlattCentralRecord*, *BrentPlattTrudgianRecord*, *BordignonRecord*, *LuZamanZhaoRecord*, and,
for the items of §7.5 and §5.3 named in the contracts, *BennettMartinOBryantRechnitzerRecord*,
*HiaryRecord*, *PatelRecord*, *YangRecord*), §§5.4, 7.9; Mathlib
`IsCyclotomicExtension.Rat.natAbs_discr`, `DirichletCharacter.conductor_dvd_level`; the gaps
`rh-up-to-height`, `grh-up-to-height`, `classical-zero-free-constants` (the `5.573412` region,
§6.3), `dirichlet-zero-free-constants` (with Kadiri's `5.60` region for §6.3 and Ramaré–Rumely's
region in both forms, the fifth item of its §7.5 and its end), `dirichlet-zero-count-error`,
`real-zero-gap`; the zero input *LiuWangFourZeros* (§6.6). No later layer is used.

## Layer 7: short intervals containing a prime, unconditionally

### 7.1 Schoenfeld's interval

Prove `schoenfeld_interval`: from `Schoenfeld1976Range`, `PrimeGapLogSquareVerified` and the input
`|ψ(t) − t| ≤ 0.978·10⁻⁵ t` for every `t ≥ e³⁰`, for every `x > 2 010 759.9` the open interval
`(x, x + x/16597)` contains a prime (`schoenfeld-1976` lines 668–669, Theorem 12; `pnt-plus`,
`ieantn`). The input is the row `b = 30` of *DusartThesisTable* through §3.1(b), so the theorem
holds under the hypotheses of §3.1(b) at Dusart's parameters (`RH(30 610 046 000)`,
*VanDeLuneZeroCount*, *RosserSchoenfeldLowZeros*, the Rosser–Schoenfeld-shape region with
`R = 9.645908801` and Rosser's zero-count triple) and *DusartThesisTable*. Route, after the source's
(lines 670–716):

- for `2 010 759.9 < x ≤ 10⁸`, `Schoenfeld1976Range`;
- for `10⁸ ≤ x ≤ 4·10¹⁸`, `PrimeGapLogSquareVerified` through Schoenfeld's Lemma 10 (lines 646–667,
  Mandl's lemma: if every gap `p_{n+1} − p_n` with `P ≤ p_n < Q` is below `h(p_n)`, then
  `(x, x + h(x))` contains a prime for every `x` from the solution of `x + h(x) = P` up to `Q`): every
  gap after a prime `11 ≤ p ≤ 4·10¹⁸` is below `log²(4·10¹⁸) = 1834.6`, less than
  `10⁸/16597 = 6025`;
- for `x ≥ e³⁰` (and `e³⁰ = 1.07·10¹³ < 4·10¹⁸`), with `h = x/16598`,
  `θ(x + h) − θ(x) ≥ ψ(x + h) − ψ(x) − (ψ(x + h) − θ(x + h)) ≥ h − ε(2x + h) − 2 √(x + h) log(x + h)`
  with `ε = 0.978·10⁻⁵` and Mathlib's `Chebyshev.abs_psi_sub_theta_le_sqrt_mul_log`; at `x = e³⁰`
  the first two terms give `(1/16598 − 2ε − ε/16598) x = 4.35·10⁸` against
  `2 √(x + h) log(x + h) = 1.96·10⁸`, and the ratio improves as `x` grows, so `(x, x + x/16598]`,
  inside `(x, x + x/16597)`, contains a prime. The source uses its own `ψ − θ` bound (5.3*) on this
  range; Mathlib's suffices.

*Needs:* §1.3 (`Schoenfeld1976Range`); §1.4 (`PrimeGapLogSquareVerified`); Mathlib `Chebyshev.abs_psi_sub_theta_le_sqrt_mul_log`;
for the instance, §3.1 (*DusartThesisTable*), §1.1 (*VanDeLuneZeroCount*,
*RosserSchoenfeldLowZeros*) and §3.3.

### 7.2 Ramaré–Saouter's intervals

`ramare-saouter-2003` (cited by locator, Theorems 1–3; `pnt-plus`, `ieantn`), under the heights
stated, the Rosser–Schoenfeld-shape region with `R = 9.645908801` and the table proposition
*RamareSaouterTable*:
`(x(1 − 1/28 314 000), x]` contains a prime for
`x > 10 726 905 041` and `(x(1 − 1/204 879 661), x]` for `x ≥ e⁵³`, both from `RH(3.3·10⁹)` (implied by
`RH(3·10¹²)`); and `(x(1 − 1/14 500 755 538), x]` for `x ≥ e⁶⁰`, under `RH(2.44·10¹²)`, the height
of the verification the paper used, which is unrefereed: the theorem takes the height as its
hypothesis, `RH(3·10¹²)` implies it, and the instances here take `RH(3·10¹²)`. Route: the
smoothing of §2.1 with the kernel `(4t(1 − t))^m` over `[x(1 − Δ⁻¹), x]`, as in §7.3.

Table proposition of this section:

- *RamareSaouterTable*: for each row `(x₀, Δ)` of the three above, the explicit quantity of the
  smoothing argument at the paper's kernel parameters and height is positive for every `x ≥ x₀`
  (`ramare-saouter-2003`, cited by locator; the first row as quoted at `dudek-2016` line 815).

*Needs:* §7.3; §1.1; `gap:rh-up-to-height`; `gap:classical-zero-free-constants`;
`gap:explicit-zero-count-error`.

### 7.3 The Kadiri–Lumley theorem and its tables

- General theorem (`kadiri-lumley-2014` lines 493–501, Theorem 2.7; `pnt-plus`, `ieantn`): let
  `T₀ < H` with `RH(H)`, `N₀ ≥ N(T₀)` and `S₀ ≥ ∑_{0 < γ ≤ T₀} 1/γ` (lines 282–293, (2.29)–(2.30),
  the bound for the zeros below `T₀` being the smaller of the two that these give, lines 432–438),
  `T₁ ∈ [T₀, H]`, `R₀` with the classical-shape region, `3/5 ≤ σ₀ < 1` with a density bound
  `N°(σ₀, T) ≤ D(T)` for `T ≥ H`, `D` continuous and nondecreasing, the zero-count error, and
  parameters `m ≥ 1`, `u, δ, a > 0`, `Δ`, `X₀` satisfying the constraints (2.1). If the explicit
  quantity of display (2.64),
  `F₀ − B₀ X₀^{−1/2} − B₁ X₀^{−1/2} − B₂ X₀^{−1/2} − B₃(σ₀) X₀^{σ₀−1} − B₃(1 − σ₀) X₀^{−σ₀} − B₄₁ X₀^{−1/(R₀ log H)} − B₄₂ X₀^{−1 + 1/(R₀ log H)} − u²(eᵘ − 1) X₀^{−2} − ω(eᵘ − 1) X₀^{−1/2} − 2 ν(f, a)(1 + δ)‖f‖₁ log(eᵘ X₀ (1 + δ))/log(X₀(eᵘ − 1))`,
  is positive, then for every `x ≥ X₀` there is a prime in `(x(1 − Δ⁻¹), x)`. The `B`'s are the
  explicit functions of the parameters given in their §2, and `f = (4t(1 − t))^m` with
  `‖f‖₁ = 2^{2m} (m!)²/(2m + 1)!` (line 508). The density enters only through `B₄₁`, `B₄₂`, that is
  through bounds `S₄`, `S₅` for the sums of `γ^{−m−1}` and `X₀^{−1/(R₀ log γ)} γ^{−m−1}` over the
  zeros with `σ₀ < β < 1`, `γ > H`: for Kadiri's linear `D(T) = c₁ T + c₂ log T + c₃` these are the
  closed forms (2.43)–(2.44) (lines 380–386), and for a general `D` they are
  `D(H) φ(H) + ∫_H^∞ D'(t) φ(t) dt` at the two weights `φ`, by Stieltjes integration
  (`cully-hugill-lee-2022` lines 349–410, Lemma 4).
- Kadiri–Lumley's rows (lines 28–29, Theorem 1.1; Table 2), under `RH(30 610 046 000)`, the
  classical-shape region with `R₀ = 5.69693`, Kadiri's density `N(σ₀, T) ≤ c₁ T + c₂ log T + c₃`
  for `T ≥ H` at the abscissa `σ₀` of each row (`0.92`, `0.93` or `0.96`), from the general form of
  `gap:explicit-zero-density` (ExplicitZetaBounds §8.1) with the constants that make
  `c₁ H + c₂ log H + c₃` small (`kadiri-lumley-2014` lines 591–605, which are the right-hand column
  of `faber-kadiri-2015` Table 2), the zero-count error with Rosser's triple
  (`kadiri-lumley-2014` line 590), *OdlyzkoZeroSums* for `(T₀, N₀, S₀)` (lines 584–586) and
  *KadiriLumleyTable*: for every `x₀ ≥ 4·10¹⁸` of the table and
  every `x > x₀`, `((1 − Δ(x₀)⁻¹) x, x)` contains a prime; in particular `Δ = 36 082 898` at
  `x₀ = 4·10¹⁸`, `Δ = 1 946 282 821` at `x₀ = e⁵⁹` and `Δ = 1 966 196 911` at `x₀ = e⁶⁰`.
- Cully-Hugill–Lee (`cully-hugill-lee-2022` lines 75–76, Theorem 1; the corrected Table 2 is that of
  the corrigendum `cully-hugill-lee-2024`, Math. Comp. 93, reproduced in the arXiv v3 text
  2103.05986v3, which is the authority for the rows), under `RH(3 000 175 332 800)`, *HiaryRecord*,
  the region with `R = 5.573412`, Kadiri–Lumley–Ng's density of ExplicitZetaBounds §8.3 at the
  verification height `H₀ = 3 000 175 332 800` (`gap:explicit-zero-density`, given `RH(H₀)` and
  *HiaryRecord*; the paper evaluates the closed forms (4.72)–(4.73) at Platt–Trudgian's height,
  `cully-hugill-lee-2022` lines 157–166), the zero count *ZeroCountBound* `0.110 0.290 2.290 0 e` (§3.1, the
  Platt–Trudgian triple the paper uses, lines 150–156 and 177–179), *LMFDBZeroSums* (§1.1) for its
  `(T₀, N₀, S₀)` and *CullyHugillLeeTable*: for
  each pair
  `(Δ, x₀)` of the table, `(x(1 − Δ⁻¹), x]` contains a prime for all `x ≥ x₀`; in particular
  `Δ = 7.69184·10¹⁰` at `log x₀ = 60`, `Δ = 2.07053·10¹¹` at `log x₀ = 150` and
  `Δ = 2.51949·10¹¹` at `log x₀ = 600`.

Table propositions of this section, each a hypothesis of the rows that use it:

- *KadiriLumleyTable*: for every row `(x₀, m, δ, T₁, σ₀, a, Δ)`, with the density constants
  `(c₁, c₂, c₃)` of the row at `σ₀` and `(T₀, N₀, S₀) = (1 132 491, 2 001 052, 11.637732363)`, the
  general form of ExplicitZetaBounds §8.1 at `σ₀` is at most `c₁ T + c₂ log T + c₃` for `T ≥ H`, and
  the quantity (2.64) is positive for every `x ≥ x₀`; among the rows
  `(4·10¹⁸, …, 0.92, …, 36 082 898)`, `(e⁵⁹, …, 0.93, …, 1 946 282 821)` and
  `(e⁶⁰, …, 0.93, …, 1 966 196 911)` (`kadiri-lumley-2014` Table 2, lines 584–605 and 688–710).
- *CullyHugillLeeTable*: for every row `log x₀ ↦ Δ`, with the generalised weight of that paper in
  place of `(4t(1 − t))^m`, the sums `S₄`, `S₅` computed from the closed forms `C₁`, `C₂` of
  ExplicitZetaBounds §8.3 at `H₀ = 3 000 175 332 800` at the split `σ₀ = 0.7804` and `(T₀, N₀, S₀) = (104 537 615, 2.6·10⁸, 21.98308)`, the quantity (2.64) is
  positive for every `x ≥ x₀`; among the rows `(60, 7.69184·10¹⁰)`, `(150, 2.07053·10¹¹)` and
  `(600, 2.51949·10¹¹)` (`cully-hugill-lee-2022` lines 75–88 and 609–614, Tables 1–2, as corrected
  in `cully-hugill-lee-2024`, whose rows are those of the arXiv v3 Table 2).

*Needs:* §2.1; §1.1 (*OdlyzkoZeroSums*, for Kadiri–Lumley's rows); §3.1 (*ZeroCountBound*);
`gap:rh-up-to-height`;
`gap:classical-zero-free-constants`; ExplicitZetaBounds §5.2 (`gap:explicit-zero-count-error`,
Rosser's triple, for Kadiri–Lumley's rows: `kadiri-lumley-2014` line 590); ExplicitZetaBounds
§8.1 (`gap:explicit-zero-density`, for Kadiri–Lumley's rows); ExplicitZetaBounds §8.3 at
`H₀ = 3 000 175 332 800` with its §0.4b (*HiaryRecord*) and *LMFDBZeroSums* (for Cully-Hugill–Lee's
rows); ExplicitZetaBounds §5.4.

**Checks.**

- `‖f₁‖₁ = 4 · 1/6 = 2/3 = ∫₀¹ 4t(1 − t) dt`; `‖f₂‖₁ = 16 · 4/120 = 8/15`.
- With `Δ ≤ 1` the interval `(x(1 − Δ⁻¹), x)` contains `(0, x)` and the statement is Bertrand-trivial;
  the constraints (2.1) force `Δ` large.

### 7.4 Intervals from Chebyshev bounds

- The `θ`-increment criterion (`pnt-plus`, `ieantn`): for real `x` and `h`, the interval
  `(x, x + h]` contains a prime if and only if `π(x + h) > π(x)`, if and only if `θ(x) < θ(x + h)`.
  Hence, for `x > 0` and `h > 0`, if `x E_θ(x) + (x + h) E_θ(x + h) < h` (with `E_θ` of §3.4a) the
  interval contains a prime, since `θ(x + h) − θ(x) ≥ h − x E_θ(x) − (x + h) E_θ(x + h)`; with
  `E_θ ≤ ε` on `[x₀, ∞)` and `x ≥ x₀` the condition is `(2x + h) ε < h`, the lemma below at `k = 0`.
- The variant for the admissible shape: if
  `E_θ(y) ≤ A (log y/R)^B exp(−C √(log y/R))` for every `y ≥ x₀`, with `A, B, C, R > 0`, then for every
  `x ≥ max(x₀, exp(R (2B/C)²))` and `h > 0` with `(2x + h) A (log x/R)^B exp(−C √(log x/R)) < h` the
  interval `(x, x + h]` contains a prime: the shape is nonincreasing from `exp(R (2B/C)²)` (§3.4a),
  so its value at `x + h` is at most its value at `x`.
- General lemma: let `k ≥ 0`, `η ≥ 0`, `x₀ ≥ 2` with `|θ(t) − t| ≤ η t/log^k t` for all `t ≥ x₀`, and
  let `c > 0` satisfy `c (1 − η/log^k x₀) > 2η`. Then for every `x ≥ x₀` the interval
  `(x, x(1 + c/log^k x)]` contains a prime: with `y = x(1 + c/log^k x)`,
  `θ(y) − θ(x) ≥ (y − x) − η y/log^k y − η x/log^k x ≥ (c − η(2 + c/log^k x)) x/log^k x > 0`,
  using `log y ≥ log x`.
- Trudgian (`trudgian-2016` lines 229–236, Corollary 2 and Lemma 1; `pnt-plus`, `ieantn`). Prove
  `trudgian_interval`: from the input `|θ(t) − t| ≤ 0.0045 t/log² t` for every `t ≥ e³⁵` (Lemma 1
  there), `TrudgianGapBound` (§1.4) and `TrudgianIntervalRange` (§1.3), for every `x ≥ 2 898 242`
  the interval `[x, x(1 + 1/(111 log² x))]` contains a prime (the source prints the threshold
  `2 898 239`). The input holds under the hypotheses of §3.4's Trudgian theorem and
  *FaberKadiriTable* (Faber–Kadiri's rows on `[e³⁵, e⁴⁰⁰⁰]` through the source's Table 1, lines
  237–267, then Trudgian's `ε₀` of §3.4 beyond `e⁴⁰⁰⁰`). Route: for `x ≥ e³⁵` the lemma with
  `η = 0.0045`, `k = 2`, `c = 1/111`; for `4 652 353 ≤ x ≤ 4·10¹⁸` (a range containing
  `[4 652 353, e³⁵]`, `e³⁵ = 1.59·10¹⁵`) `TrudgianGapBound`: with `p` the largest prime `≤ x` (so
  `p ≥ 4 652 353`, a prime) and `p⁺` the next, `p⁺ ≤ p + p/(111 log² p) ≤ x + x/(111 log² x)`, the
  length `t/(111 log² t)` increasing; for `2 898 242 ≤ x ≤ 4 652 353`, `TrudgianIntervalRange`.
- Axler 2024, the headline at the `log³`, `log⁴` and `log⁵` scales (`axler-2024` Theorem 1.2 of
  arXiv v4, journal Theorem 1). Prove `axler_interval`: with `c = 0.048668 + 8.22·10⁻¹¹`, from the
  inputs `|θ(t) − t| < 2.1482·10⁻⁸ t` for `t > e⁴⁰` and `|θ(t) − t| < 1.1344·10⁻⁹ t` for `t > e⁵⁰`
  (the rows `log X₀ = 40` and `50` of `broadbent-kadiri-lumley-ng-wilk-2021` Table 14, lines 1669
  and 1672, whose `m₀` exceeds `M₀`) and `|θ(t) − t| < 0.024334 t/log³ t` for `t > e²⁹` (the row
  `log X₀ = 29` of Table 15, line 1727), `AxlerGapBound` (§1.4) and `AxlerIntervalRange` (§1.3), for
  every `x ≥ 17 051 708` the interval `(x, x(1 + c/log³ x)]` contains a prime. The three inputs are
  rows of *BKLNWThetaTables* (§3.7). Route: on `[17 051 708, 2·10⁷]` `AxlerIntervalRange`; on
  `[2·10⁷, 4·10¹⁸]` `AxlerGapBound`, with `p` the largest prime `≤ x`; for `x > e⁴⁰`, with
  `y = x(1 + c/log³ x)` and a relative row `|θ(t) − t| < ε t`,
  `θ(y) − θ(x) > (y − x) − ε (x + y) ≥ 0` as soon as `ε (2 + c/log³ x) ≤ c/log³ x`, which the row
  `ε = 2.1482·10⁻⁸` gives for `log x ≤ 104` and the row `ε = 1.1344·10⁻⁹` for `log x ≤ 277`; for
  `x ≥ e²⁵⁰`, the lemma with `η = 0.024334`, `k = 3`, `x₀ = e²⁵⁰`, whose condition
  `c (1 − η/250³) > 2η` holds with `6.4·10⁻¹²` to spare. The leading constant is `2η₃` and the
  addition `8.22·10⁻¹¹` is the second-order term `2η₃²/log³ x₀` of the lemma's condition at the
  switch point, which must satisfy `log x₀ > 243.31`. Under the tables of §3.7, *RecordGapBound* at
  `(114.368 + 2.145·10⁻¹⁰, 4, 2·10⁷)` and at `(268 820 + 5.0363·10⁻⁷, 5, 2·10⁷)`, and
  *Axler2024Range*, the paper's other two intervals: for every `x ≥ 2` there is a prime in
  `(x, x(1 + (114.368 + 2.145·10⁻¹⁰)/log⁴ x)]` and one in
  `(x, x(1 + (268 820 + 5.0363·10⁻⁷)/log⁵ x)]`. Route for these: the same scheme with the relative
  rows up to a switch point and the `k`-th row (`η₄ = 57.184`, `η₅ = 1.3441·10⁵`) beyond it, the
  leading constants being `2η_k` and the additions `2η_k²/log^k x₀`; the *RecordGapBound* instance
  on `[2·10⁷, 4·10¹⁸]`; *Axler2024Range* below `2·10⁷`.
- Axler 2018 (`axler-2018` Theorem 1.4; `pnt-plus`), kept for `6 034 256 ≤ x < 17 051 708` and for
  its `log⁴` form, under the same inputs, *RecordGapBound* at `(0.087, 3, 2·10⁷)` and at
  `(198.2, 4, 2)`, and *Axler2018Range*: for every `x ≥ 6 034 256` there is a prime in
  `(x, x(1 + 0.087/log³ x)]`, and for every `x > 1` one in `(x, x(1 + 198.2/log⁴ x)]`. Route: the
  lemma with `η = 0.024334`, `k = 3` from `e²⁹` (`0.087 > 2 · 0.024334`) and `η = 57.184`, `k = 4`
  from `2·10¹¹` (`198.2 > 2 · 57.184`); the two *RecordGapBound* instances up to `4·10¹⁸`, the
  second from `x = 59` on, where the largest prime `p ≤ x` exceeds `e⁴` and `t/log⁴ t` increases;
  below `59` directly, since `198.2 x/log⁴ x ≥ 198.2 e⁴/4⁴ = 42.27` for every `x > 1`, more than
  every gap between the primes up to `59` (at most `6`), and the interval contains `2` for
  `1 < x < 2`; *Axler2018Range* on `[6 034 256, 2·10⁷]`.
- Axler 2016 (`axler-2016` lines 51–54, Theorem 1.5), under the tables of §3.7 and *RecordGapBound*
  at `(1.1817, 3, 58 890)`: for every `x ≥ 58 837` there is a prime in `(x, x(1 + 1.1817/log³ x)]`;
  kept for `58 837 ≤ x < 6 034 256`, below the 2018 threshold. Route: for `58 837 ≤ x < 58 889` the
  prime `58 889` lies in the interval, since `x(1 + 1.1817/log³ x)` increases in `x` and equals
  `58 889.49` at `x = 58 837` (the source treats this range directly, `axler-2016` lines 361–364);
  for `58 889 ≤ x ≤ 4·10¹⁸` the *RecordGapBound* instance, with `p ≥ 58 889` the largest prime
  `≤ x`, whose successor is therefore at least `58 890`, and `t/log³ t` increasing beyond `e³`; and
  the lemma with `η = 0.024334`, `k = 3` from `e²⁹`.
- Dusart (`dusart-2018` journal Proposition 5.4 and Corollary 5.5; `pnt-plus`, `ieantn`; the arXiv
  copy states `1/(25 log² x)` from `396 738` in place of the second), under the tables of §3.7,
  *RecordGapBound* at `(1, 3, 2·10⁷)` and at `(1/5000, 2, 10⁹)`, and *Dusart2018Range*: for every
  `x ≥ 89 693` the interval `(x, x(1 + 1/log³ x)]` contains a prime, and for every `x ≥ 468 991 632`
  the interval `[x, x(1 + 1/(5000 log² x))]` contains a prime; the second is the best known at the
  `log²` scale. Route for the first: the lemma with `η₃ = 0.024334` from `e²⁹`
  (`0.024334 < 0.4998`), the first *RecordGapBound* instance on `[2·10⁷, 4·10¹⁸]`, *Dusart2018Range*
  on `[89 693, 2·10⁷]`. For the second: the lemma with `k = 2` and the row `m₂ = M₂ = 9.3023·10⁻⁵`
  of Table 15 from `e³⁴` (`9.3023·10⁻⁵ < 0.9999997·10⁻⁴`), the second *RecordGapBound* instance on
  `[10⁹, 4·10¹⁸]`, and *Dusart2018Range* on `[468 991 632, 10⁹]`.

*Needs:* §3.1 (*FaberKadiriTable*); §3.3; §3.4; §3.4a (the monotone shape); §3.5; §3.7; §1.3;
§1.4 (`TrudgianGapBound`,
`AxlerGapBound`, *RecordGapBound*); for `trudgian_interval` and `axler_interval`, only their inputs
and Mathlib `Chebyshev.theta`, `Nat.nth Nat.Prime`.

### 7.5 Primes between consecutive powers

Each statement of this section is proved from the truncated explicit formula of §2.1, applied at
`x` and at `x + h`, and holds under that section's hypotheses: `RH(3 000 175 332 800)`, the
classical-shape region with `R₀ = 5.5666305` (`gap:classical-zero-free-constants`), Ford's region
of ExplicitZetaBounds §7.2 for `t ≥ 1.88·10¹⁴`, the region of `gap:vinogradov-korobov-constants`
and *PsiThetaUpper* `(1 + 1.93378·10⁻⁸, 1.04320, e⁴⁰)`, discharged in §3.7; under
*CullyHugillJohnstonTable* (§2.1) at the row each item names; and under the density bound and the
zero count each item names.

- The common route. Let `x ≥ e⁴⁰`, `h > 0` and `T` satisfy `max(51, log(x + h)) < T < (x^α − 2)/2`
  for the `α` of the row `(log x_M, α, λ, M)` used, with `x ≥ x_M`. Since `θ(x) ≤ ψ(x)` (Mathlib
  `Chebyshev.theta_le_psi`) and `ψ(y) − θ(y) ≤ 2 √y log y` for `y ≥ 1` (Mathlib
  `Chebyshev.abs_psi_sub_theta_le_sqrt_mul_log`), the formula at `x` and at `x + h` gives
  `θ(x + h) − θ(x) ≥ h − |∑_{|γ| ≤ T} ((x + h)^ρ − x^ρ)/ρ| − M (x log x + (x + h) log(x + h))/T − 2 √(x + h) log(x + h)`.
  Each term of the sum is `∫_x^{x+h} u^{ρ−1} du`, of absolute value at most `h x^{β−1}`, and
  `∑_{|γ| ≤ T} x^{β−1} = 2 N(T)/x + 2 (log x/x) ∫₀¹ N(σ, T) x^σ dσ`, where `N(σ, T)` counts the zeros
  with `β > σ` and `0 < γ ≤ T`. The integral is bounded through the zero count below an abscissa
  `σ₁`, the density bound on `[σ₁, 1 − ν(T)]` and the zero-free region `σ ≥ 1 − ν(T)` above it; the
  counts up to `T` inclusive are at most the density and count bounds at every `T' > T`, which are
  continuous in `T`. If the resulting lower bound is positive, `(x, x + h]` contains a prime.
- Comparison with the sources. Dudek and Cully-Hugill bound the same difference with their own
  truncated formulas, which they prove only for `x` half an odd integer (`dudek-2016` line 115,
  Theorem 2.1; `cully-hugill-2021` lines 187–197, Theorem 2) and apply at `x + h` as well
  (`dudek-2016` lines 619–626; `cully-hugill-2021` lines 563–565), a point that is in general not
  half an odd integer; and they convert to `θ` with the bounds for `ψ − θ` of Dusart
  (`dudek-2016` line 631) and of Costa Pereira and Broadbent–Kadiri–Lumley–Ng–Wilk
  (`cully-hugill-2021` lines 151–165). At the rows used below, the error of §2.1 at `x` and `x + h`
  is smaller than the source's at the source's `T`, by more than `2 √(x + h) log(x + h)` (Checks),
  so the inequality from which each source reads its threshold ((24)–(25) of `dudek-2016`, (21) of
  `cully-hugill-2021`) holds a fortiori for the lower bound above, at every real `x` of the range.
  The statements below are for every real `x`; that form is this route's, and the sources state
  their intervals from half odd integers (Cully-Hugill passes to real `x` through
  `X = ⌊x + 1/2⌋ + 1/2`, which gives only `(x, X + 3X^{2/3}]`, lines 662–665).
- Dudek (`dudek-2016` line 63, Theorem 1.1, arXiv text; `pnt-plus`; the journal version prints
  `33.3`; the argument at lines 619–828), at the row `(40, 1/2, 0.48, 6.431)`, under the region of
  `gap:vinogradov-korobov-constants` (Ford's `57.54`, the paper's Lemma 3.3, lines 702–706) and
  Rosser's zero count of ExplicitZetaBounds §5.2: if
  `N°(σ, T) ≤ A (3T)^{8(1−σ)/3} log^{5−2σ} T + 103 log² T` for `T ≥ 2000` and `σ ≥ 0.52`, then for
  every real `x` with `x^{1/3} ≥ exp(exp(c_A))` the interval `(x, x + 3x^{2/3}]` contains a prime,
  and hence there is a prime between `n³` and `(n + 1)³` for every `n ≥ exp(exp(c_A))`, since
  `n³ + 3n² < (n + 1)³`, with `c_A` the threshold from which the paper's inequalities (24) and (25)
  both hold at its `k = 0.9359` (lines 796–828), nondecreasing in `A` (only (24) depends on `A`),
  and `c_{9.7} = log(8.0127·10¹⁴/3) = 33.2186… < 33.219`, where (24) is the later of the two to hold
  (the arXiv text prints `33.217 = log(8·10¹⁴/3)`, at which (24) fails, and the journal `33.3`;
  Checks). Route: the common route at the paper's `T`, the solution of
  `x/((3T)^{8/3} log² T) = exp(log^k x)`, which is below `x^{3/8}` (lines 737–742) and so in the
  range of the row, with the zeros split at `σ₁ = 5/8` (lines 713–732). The paper takes `A = 9.7`
  from `ramare-2016` Theorem 1.1, whose leading constant `broadbent-kadiri-lumley-ng-wilk-2021`
  lines 950–952 and 1128–1130 report to be off by a factor over 100; the threshold
  `exp(exp(33.219))` is therefore stated only under the hypothesis with `A = 9.7`, and the cube
  statement under recorded inputs is Cully-Hugill's below. Under the zero input
  *RamareRevisedDensity* (below; `A = 965` and `51.5 ≤ 103`) the hypothesis holds, and the theorem
  gives the threshold `exp(exp(c_{965}))`, larger than `exp(exp(c_{9.7}))` since the solution of
  (24), which already decides `c_{9.7}`, increases with `A`; its value is not computed here. The
  zero counts the paper takes from Trudgian's bound against `M(T)` with the `7/8`
  (`N(T) < (T/2π) log T` for `T > 15`, line 690) follow from Rosser's bound of ExplicitZetaBounds
  §5.2, since `(T/2π) log 2π + T/2π − 7/8` exceeds Rosser's right side from `T = 15` on.
- Cully-Hugill (`cully-hugill-2021`, published as J. Number Theory 247 (2023); line 28, Theorem 1;
  `pnt-plus`; line 662), at the row `(40, 1/2, 0.48, 6.431)`, under the region of
  `gap:vinogradov-korobov-constants` (the paper's `ν₂`, the only region its cube argument uses,
  lines 671–672), the zero input *CullyHugillDensity* below (the paper's recomputation of
  Kadiri–Lumley–Ng's density, lines 113–118 and 654–660) and the zero count of ExplicitZetaBounds
  §5.2 given *HiaryRecord*, *PatelRecord* and *YangRecord*: the paper quotes
  Hasanalizade–Shen–Wong's triple `(0.1038, 0.2573, 9.3675)` against `M(T)` with the `7/8` (lines
  104–111), and Bellotti–Wong's first bound with `7/8` added, `(0.10076, 0.24460, 8.95844)`, is
  below it at every `T ≥ e` (§2.2), which ExplicitZetaBounds §5.2 states given those three records
  for `T ≥ 30 610 046 000` and, below that height, given also its recorded bound for `S(T)` (its
  §0.4): for every real `x ≥ exp(exp(33.990))` the interval `(x, x + 3x^{2/3}]` contains a prime;
  consequently there is a prime between `n³` and `(n + 1)³` for every `n ≥ exp(exp(32.892))`, since
  `n³ + 3n² < (n + 1)³` and `exp(exp(33.990))^{1/3} = exp(exp(32.892))`; and, under also the row
  `(1000, 1/100, 1.80, 0.6651)`, Ford's intermediate region of ExplicitZetaBounds §7.2 (the region
  `ν₁` of the paper's (1), which is the wider one at the heights `T = x^α` where its (21) is solved
  for `m = 155`, lines 671–678) and the rows of *CullyHugillLeeTable* at `x₀ = 4·10¹⁸` and
  `log x₀ = 600` with the hypotheses of those rows (§7.3), there is a prime in `(n¹⁵⁵, (n + 1)¹⁵⁵)`
  for every `n ≥ 1`. For `m = 155` the paper's (21) holds from `x = e^{4810}` at `α = 0.0080146`
  (line 683); Cully-Hugill–Lee's interval `(y(1 − Δ⁻¹), y]` at `y = x + 155 x^{154/155}` lies inside
  `(x, x + 155 x^{154/155}]` exactly when `log x ≤ 155 log(155(Δ − 1))`, that is for
  `4·10¹⁸ ≤ x ≤ e^{3491.4}` at the row `x₀ = 4·10¹⁸` (`Δ = 3.90970·10⁷`) and for
  `e⁶⁰⁰ ≤ x ≤ e^{4850.9}` at the row `log x₀ = 600` (`Δ = 2.51949·10¹¹`) (the paper names
  `e^{1200}`, lines 684–686, a row the corrected table of §7.3 does not have); and below `4·10¹⁸`
  only `n = 1` occurs, `(1, 2¹⁵⁵)` containing `2`. The `x`-form implies the weaker
  `(x, x + 3(x + 1)^{2/3} + 1]` of the arXiv text (lines 662–665). Route: the common route at the
  paper's `T = x^α` (`α = 1/3 + 10⁻¹⁰` for cubes, line 662; `α = 0.0080146` for `m = 155`, line
  683), with `h = m x^{1 − 1/m}` (`h = 3x^{2/3}` for cubes), the zeros above the verified height
  through the regions `ν₁` and `ν₂`, those with `0.6 ≤ β < 1 − ν(T)` through the density bound,
  split at `σ₁ = 0.6` (lines 613–627), and those below `σ₁` through the zero count.
- Cully-Hugill–Johnston (`cully-hugill-johnston-2021` lines 95–96, Theorem 1.3; the argument at
  lines 902–926), under the inputs of the `155`-th powers in the preceding item, at the same row
  `(1000, 1/100, 1.80, 0.6651)`: `RH(3 000 175 332 800)`, the classical-shape region with
  `R₀ = 5.5666305`, Ford's intermediate region of ExplicitZetaBounds §7.2 and the region of
  `gap:vinogradov-korobov-constants`, which make up the paper's `ν` (its §3, lines 334–376; the
  supplier's form of Ford's region, with `log 0.618` and from `1.88·10¹⁴`, is at least as wide as
  the paper's `ν₂`, with `log 0.63`, wherever `ν₂` exceeds `ν₁`, which is from `t = e^{46.3}`,
  line 376); *CullyHugillDensity* and the zero count of the preceding item, through the paper's
  `F(x)`, which is (19) of `cully-hugill-2021` with this `ν` (lines 916–919); and the rows of
  *CullyHugillLeeTable* at `x₀ = 4·10¹⁸` and `log x₀ = 600` with the hypotheses of those rows
  (§7.3): for every real `x ≥ 4·10¹⁸` the interval `(x, x + 140 x^{139/140}]` contains a prime;
  consequently there is a prime in `(n¹⁴⁰, (n + 1)¹⁴⁰)` for every `n ≥ 1`, since
  `n¹⁴⁰ + 140 n¹³⁹ < (n + 1)¹⁴⁰` and `n = 1`, the only `n` with `n¹⁴⁰ < 4·10¹⁸`, has
  `2 ∈ (1, 2¹⁴⁰)`. Route: the common route at `T = x^{0.0080155}` with `h = 140 x^{139/140}`, the
  zeros split at `σ₁ = 0.6`, for `log x ≥ 4242`, where the paper's inequality (6.2) holds (lines
  920–922); the common route's lower bound is `h` times the left side of (6.2) with the paper's
  `E(x)` (its bounds for `ψ − θ`, (20) of `cully-hugill-2021`, and `E(x) < 0`) replaced by
  `−2 √(x + h) log(x + h)`, which lowers it by less than `e^{−2086} h` there (Checks); and
  Cully-Hugill–Lee's interval `(y(1 − Δ⁻¹), y]` at `y = x + 140 x^{139/140}`, which lies inside
  `(x, x + 140 x^{139/140}]` when `log x ≤ 140 log(140(Δ − 1))`, that is for
  `4·10¹⁸ ≤ x ≤ e^{3139.2}` at the row `x₀ = 4·10¹⁸` and for `e⁶⁰⁰ ≤ x ≤ e^{4367.1}` at the row
  `log x₀ = 600` (the paper uses the same two rows, lines 922–926).

Zero inputs of this section:

- *CullyHugillDensity* (`cully-hugill-2021` display (4), lines 113–118, with the constants of lines
  654–660 and of footnote 5, line 698): for every real `σ` with `0.6 ≤ σ < 1` and every
  `T ≥ 3 000 175 332 800`, `N°(σ, T) ≤ 17.418 (log T)^{5−2σ} T^{8(1−σ)/3} + 5.272 log² T`. It is
  Kadiri–Lumley–Ng's bound at `H₀ = 3 000 175 332 800` and `k = 1` (where
  `(log kT)^{2σ} (log T)^{5−4σ} = (log T)^{5−2σ}`), recomputed with their (3.13) replaced by a later
  bound for the sum of the squared divisor function and their Lemma 3.2 corrected, and used with
  `C₁ = C₁(1) = 17.418` and `C₂ = C₂(0.6) = 5.272` on the whole range, `C₁(σ)` increasing and
  `C₂(σ)` decreasing in `σ` (lines 624–627). These constants are not ExplicitZetaBounds §8.3's
  closed forms at any parameters, so the bound is a hypothesis of the instance that uses it.
- *RamareRevisedDensity* (`kadiri-lumley-ng-2018` lines 61–66, display (1.5), and footnote 1,
  lines 93–95): for every real `σ ≥ 0.52` and `T ≥ 2000`,
  `N°(σ, T) ≤ 965 (3T)^{8(1−σ)/3} (log T)^{5−2σ} + 51.5 log² T`. It is Ramaré's density for `ζ` in
  the revised form that Kadiri–Lumley–Ng quote: the printed form, with `4.9` (`ramare-2016` (1.1)),
  is in error, and the proof of the revised one was communicated to them and is not published.
  ExplicitZetaBounds states neither form (its Not owned here, the item on Ramaré's explicit density
  theorem), so the revised form is a hypothesis of the instance that uses it.

*Needs:* §2.1 (the truncated explicit formula and *CullyHugillJohnstonTable*, at the rows
`(40, 1/2, 0.48, 6.431)` and `(1000, 1/100, 1.80, 0.6651)`); §3.7 (the discharge of
*PsiThetaUpper*); §3.6; §1.1; §7.3 (Cully-Hugill–Lee's rows at `x₀ = 4·10¹⁸` and `log x₀ = 600`,
for the `140`-th and `155`-th powers); `gap:rh-up-to-height`; `gap:classical-zero-free-constants`;
`gap:vinogradov-korobov-constants`; ExplicitZetaBounds §7.2 (Ford's intermediate region);
ExplicitZetaBounds §5.2 (`gap:explicit-zero-count-error`) with its §§0.4 and 0.4b
(*HiaryRecord*, *PatelRecord*, *YangRecord*); *CullyHugillDensity*; *RamareRevisedDensity*; Mathlib
`Chebyshev.theta_le_psi`, `Chebyshev.abs_psi_sub_theta_le_sqrt_mul_log`.

**Checks.**

- The `x`-form against the cube interval: `(x^{1/3} + 1)³ = x + 3x^{2/3} + 3x^{1/3} + 1`, so
  `(x, x + 3x^{2/3}]` is the lower part of the cube interval above `x`, and
  `3x^{2/3} ≤ 3(x + 1)^{2/3} + 1` gives the arXiv form.
- The sources' formulas do not apply at `x + h` (negative control for their route): `x = 7.5` is
  half an odd integer and `x + 3x^{2/3} = 18.9946…` is not; §2.1 holds at every real `x ≥ x_M`, so
  the common route needs no parity.
- Dudek's threshold at `A = 9.7`, `c = 57.54` and `k = 0.9359`, with `y = log x` and the factor
  `(log y)^{1/3}` of (24) dividing (as in line 754): (25) holds from `y = 7.705·10¹⁴` and (24) from
  `y = 8.0127·10¹⁴`, so `c_{9.7} = log(8.0127·10¹⁴/3) = 33.2186`, below `33.219`; at
  `y = 3e^{33.219} = 8.0159·10¹⁴` the left side of (24) is below the right by `0.0096`. The printed
  `33.217` is `log(8·10¹⁴/3)` (lines 827–828), and at `y = 8·10¹⁴` the left side of (24) exceeds the
  right by `0.0387` (negative control: the printed threshold is not the paper's own). At `A = 1`,
  (24) holds from `7.29·10¹⁴` and (25) decides.
- The rows against the sources' errors. Cubes (Cully-Hugill): at `log x ≥ e^{33.990} = 5.78·10¹⁴`
  her error is `K G(x, h)/T` with `K = 2.4798` (Table 2, `log x_K = 10⁶`, lines 540–543) and
  `G(x, h) ≥ (x log x + (x + h) log(x + h)) log log x`, so per unit of `x log x/T` it is at least
  `K log log x = 2.4798 · 33.990 = 84.29`, against `M = 6.431` of the row; the difference,
  about `155.7 x^{2/3} log x` at `T = x^{1/3 + 10⁻¹⁰}`, exceeds `2 √(x + h) log(x + h)` by a factor
  `x^{1/6}` up to logarithms. `m = 155`: from `x = e^{4810}`, `K log log x = 3.4747 · 8.4785 = 29.46`
  (`K` of `log x_K = 1000`) against `M = 0.6651`, at `T = x^{0.0080146} = e^{38.55}`, which lies in
  `(max(51, log x), (x^{1/100} − 2)/2) = (4810, e^{47.41})`. Dudek: his error `2 y log² y/T` at
  each of `y = x, x + h` against `6.431 y log y/T`, smaller as soon as `log y > 3.22`; with
  `T < x^{3/8}` the difference is at least about `x^{5/8} log x (4 log x − 12.9)`, which at
  `x = e⁴⁰` and `T = x^{3/8}` is `1.09·10⁴` times `2 √(x + h) log(x + h)`, and `2 log x ≥ 1.6·10¹⁵` on his range
  `log x ≥ 3 e^{33.219}`. In each case the sources' own `ψ − θ` terms are negative
  (`0.9999 < 1.00007` and `0.999 < 1 + 1.99986·10⁻¹²`), so this difference is all the comparison
  needs.
- The row's range at the smallest `x` it admits: at `x = e⁴⁰`, `T = x^{1/3 + 10⁻¹⁰} = 6.17·10⁵` lies
  in `(51, (√x − 2)/2) = (51, 2.43·10⁸)`; a `T` above `(√x − 2)/2` is outside every row of
  *CullyHugillJohnstonTable*, whose `α ≤ 1/2`, and would need *DudekExplicitFormula*.
- Coverage of the `155`-th powers: `log(4·10¹⁸) = 42.83`; the two Cully-Hugill–Lee rows cover
  `[42.83, 3491.4]` and `[600, 4850.9]` in `log x`, and (21) covers `log x ≥ 4810`, so every
  `x = n¹⁵⁵ ≥ 2¹⁵⁵ = 4.57·10⁴⁶` is covered; the row `x₀ = 4·10¹⁸` alone stops at `e^{3491.4}`, below
  `e^{4810}`, which is why the row at `log x₀ = 600` is needed.
- The `140`-th powers. At `log x = 4242`, `T = x^{0.0080155} = e^{34.00}` lies in
  `(max(51, log x), (x^{1/100} − 2)/2) = (4242, e^{41.73})`; the error term of (6.2),
  `M G(x, h) x^{−0.0080155}/h` with `G(x, h) = (x + h) log(x + h) + x log x`, is
  `2 · 0.6651 · 4242 · e^{−4242 (0.0080155 − 1/140)}/140 = 0.99474`; in `F(x)` the zeros above
  `3·10¹²` up to `T` are bounded through the classical region, where
  `x^{−ν(T)} = e^{−1/(0.0080155 R₀)} = 1.85·10⁻¹⁰`, the two density terms are `4.34·10⁻⁴` and
  `2.3·10⁻⁶` and the count term is below `e^{−1600}`; so
  the left side of (6.2) is about `0.0048` there, while the common route's `ψ − θ` bound costs
  `2 √(x + h) log(x + h)/h = e^{−2086.6}`. The left side is least near the switch from Ford's region
  to the Vinogradov–Korobov region, `log T = 54 599` (`log x = 6.81·10⁶`), where it is still about
  `7.5·10⁻⁴`; at `log x = 4234` it is negative, so the threshold `4242` is not far from the least
  one. Coverage: `140 log(140(Δ − 1))` is `3139.25` at `Δ = 3.90970·10⁷` and `4367.18` at
  `Δ = 2.51949·10¹¹`, so the two Cully-Hugill–Lee rows cover `[42.83, 3139.2]` and `[600, 4367.1]`
  in `log x` and overlap (6.2) from `4242`; `2¹⁴⁰ = 1.39·10⁴² > 4·10¹⁸`, so only `n = 1` lies below
  `4·10¹⁸`.

### Examples

- Schoenfeld's prime in `(x, x + x/16597)` for every `x > 2 010 759.9` (§7.1).
- A `θ`-bound `|θ(t) − t| ≤ η t/log^k t` from `x₀` gives a prime in `(x, x(1 + c/log^k x)]` for every
  `x ≥ x₀` once `c (1 − η/log^k x₀) > 2η` (§7.4).
- Cubes from `n ≥ exp(exp(32.892))`; consecutive `140`-th and `155`-th powers for every `n ≥ 1`;
  each for every real `x` of its range in the interval form `(x, x + m x^{1 − 1/m}]` (§7.5).

### Dependencies

Layers 0–3 (for §7.5, the truncated explicit formula of §2.1 with *CullyHugillJohnstonTable*, and
§3.7 for *PsiThetaUpper*); ExplicitZetaBounds §5.4; the gaps `rh-up-to-height`, `classical-zero-free-constants`,
`explicit-zero-count-error`, `explicit-zero-density`, `vinogradov-korobov-constants`; the zero
inputs *ZeroCountBound* at Platt–Trudgian's triple (§3.1, for §7.3), *CullyHugillDensity* and
*RamareRevisedDensity* (§7.5);
ExplicitZetaBounds §8.3 at `H₀ = 3 000 175 332 800` (for §7.3), §7.2 (for §7.5) and the records
*HiaryRecord*, *PatelRecord* and *YangRecord* of its §0.4b.

## Downstream consumers

- EffectiveClassNumbers, later in the order of supply, §4.4 (its prime sums over the first primes):
  the rational prime-count adapter `TauCeti.primeCount ℚ Set.univ x = π(⌊x⌋₊)` and the asymptotic
  `p_n ∼ n log n` of §0.3b, taken by section; neither is a headline, so `Suggested.lean` declares
  no Lean name for them.
- ExplicitCharacterSumsAndSieves, later in the order of supply: the Brun–Titchmarsh inequality of
  §0.1 (`brun_titchmarsh`), the prime-count case of its sifted Brun–Titchmarsh inequality and the
  base of its explicit sieve upper bounds; and Montgomery–Vaughan's diagonal bound
  `S(u) ≥ log u + 1.07` for `u ≥ 6` with Büthe's asymptotic and `MVDiagonalFiniteRange`, which its
  Selberg diagonal sums use and whose owner is §0.1, the earlier of the two roadmaps.
- ExplicitMultiplicativeFunctions: Layers 3–4 (explicit `ψ`, `∑ Λ(n)/n`, `∑ 1/p`) for its explicit
  Mertens products and Möbius bounds, the bounds under the Riemann hypothesis of §§2.2 and 4.7 for
  the product forms of Lee–Nosal's corollary, and the enclosures of §1.6. Among its requests, these
  sections supply: `ψ(x) ≤ 1.04 x` and `θ(x) > x(1 − 1/(2 log x))` for `x ≥ 563` by §3.2;
  `|ψ(x) − x| ≤ 0.94 √x` on `(11, 10¹⁹]` by `ButheVerified` (§1.3), which also gives
  `|ψ(x) − x| ≤ √x` on `[11, 10¹⁰]`, and on `[8, 11]` from `ψ(x) = log lcm(1, …, ⌊x⌋)`; Dusart's
  `0.006409 x/log x ≤ 0.0065 x/log x` from `e²²` by §3.3; the relative rows from `10¹⁰` and the
  rows of Broadbent–Kadiri–Lumley–Ng–Wilk by §§3.1, 3.7 and 6.1 (the row `k = 1` of
  *RamareRumelyTable1*); `∑ Λ(n)/n` by §4.2; the three reciprocal-prime bounds by §4.3; Dusart's
  `p_k ≥ k(log k + log log k − 1)` by §5.3; `π(x) > x/log x` for `x ≥ 17` by §3.5; and the progression
  bound with `c_θ(q) ≤ 1/840` by §6.3.
- ExplicitNumberFields: Layers 3–6 (sums over primes, primes in progressions) for its least-
  primitive-root and class-number bounds, and Schoenfeld's bounds under the Riemann hypothesis of
  §2.2.
- Any roadmap later in the order of supply needing a prime in `(x, x(1 + δ)]`, an explicit
  Chebotarev or least-prime bound in a progression, or an explicit Mertens sum: Layers 4–7.

## References

Locators of the form `<id> line N` refer to the line-numbered text of the work listed below under
the key `<id>`; theorem, table and equation numbers locate each statement independently of that
text. Works marked *preprint* are unrefereed; works marked *cited by locator* are cited at the
theorem named, through the quotation named where there is one.

- `montgomery-vaughan-1973` H. L. Montgomery, R. C. Vaughan, The large sieve, Mathematika 20 (1973),
  Theorem 2 and Lemma 7 (cited by locator); `tmeemt-art14` the TME-EMT page on sieve bounds (Art14),
  which quotes that theorem with its hypotheses; `montgomery-1978` H. L. Montgomery, The analytic
  principle of the large sieve, Bull. Amer. Math. Soc. 84 (1978), §6 (the weighted inequality,
  display (16)) and §8 (the passage from the large sieve to the sieve bound and to Brun–Titchmarsh);
  `buthe-2014` J. Büthe, A Brun–Titchmarsh inequality for weighted sums over prime numbers, arXiv
  1410.7561v2 (2014), Lemma 4.5 (the explicit asymptotic of the diagonal sum `S`).
- `rosser-schoenfeld-1962` J. B. Rosser, L. Schoenfeld, Approximate formulas for some functions of
  prime numbers, Illinois J. Math. 6 (1962).
- `chebyshev-1852` P. L. Chebyshev, Mémoire sur les nombres premiers, J. Math. Pures Appl. 17
  (1852), 366–390, §§IV–V (the weights of §0.8); `mertens-1874` F. Mertens, Ein Beitrag zur
  analytischen Zahlentheorie, J. Reine Angew. Math. 78 (1874), 46–62 (the argument of §4.1).
- `rosser-schoenfeld-1975` J. B. Rosser, L. Schoenfeld, Sharper bounds for the Chebyshev functions
  θ(x) and ψ(x), Math. Comp. 29 (1975).
- `schoenfeld-1976` L. Schoenfeld, Sharper bounds for the Chebyshev functions θ(x) and ψ(x). II,
  Math. Comp. 30 (1976).
- `dusart-1998-thesis` P. Dusart, Autour de la fonction qui compte le nombre de nombres premiers,
  thèse, Limoges (1998); `dusart-1999-mc` The kth prime is greater than k(ln k + ln ln k − 1) for
  k ≥ 2, Math. Comp. 68 (1999); `dusart-2002` Estimates of
  θ(x; k, l) for large values of x, Math. Comp. 71 (2002); `dusart-2016` Estimates of ψ, θ for large
  values of x without the Riemann hypothesis, Math. Comp. 85 (2016); `dusart-2018` Explicit
  estimates of some functions over primes, Ramanujan J. 45 (2018), cited from its arXiv copy
  1002.0442 (Estimates of some functions over primes without R.H.), whose numbering differs from
  the journal's (its Theorem 5.2 is the journal's Theorem 4.2); its `ψ`-table is reported in error
  by `broadbent-kadiri-lumley-ng-wilk-2021`.
- `faber-kadiri-2015` and `faber-kadiri-2018-corrigendum` L. Faber, H. Kadiri, New bounds for
  ψ(x), Math. Comp. 84 (2015) and its corrigendum, Math. Comp. 87 (2018).
- `trudgian-2016` T. Trudgian, Updating the error term in the prime number theorem, Ramanujan J.
  39 (2016), arXiv text; `mossinghoff-trudgian-2015` M. J. Mossinghoff, T. S. Trudgian, Nonnegative
  trigonometric polynomials and a zero-free region for the Riemann zeta-function, J. Number Theory
  157 (2015), 329–349, §7 (cited by locator).
- `platt-trudgian-2021-rh` D. Platt, T. Trudgian, The Riemann hypothesis is true up to 3·10¹²,
  Bull. LMS 53 (2021); `platt-trudgian-2021-error` The error term in the prime number theorem,
  Math. Comp. 90 (2021).
- `johnston-yang-2023` D. R. Johnston, A. Yang, Some explicit estimates for the error term in the
  prime number theorem, J. Math. Anal. Appl. 527 (2023); `fiori-kadiri-swidinsky-2023` A. Fiori,
  H. Kadiri, J. Swidinsky, Sharper bounds for the error term in the prime number theorem, Res.
  Number Theory 9 (2023), article 63, arXiv 2206.12557; `fiori-kadiri-swidinsky-2023-psi` the same
  authors, Sharper bounds for the Chebyshev function ψ(x), J. Math. Anal. Appl. 527 (2023) 127426,
  arXiv 2204.02588 (journal constant `9.22022`, arXiv abstract `9.22106`);
  `broadbent-kadiri-lumley-ng-wilk-2021` S. Broadbent, H. Kadiri, A. Lumley, N. Ng, K. Wilk,
  Sharper bounds for the Chebyshev function θ(x), Math. Comp. 90 (2021), arXiv text v2 (its
  numbering is that of the arXiv version; the published version's Corollary 1.3 is cited through the
  quotation at `fiori-kadiri-swidinsky-2023` lines 151–154).
- `buthe-2016` J. Büthe, Estimating π(x) and related functions under partial RH assumptions, Math.
  Comp. 85 (2016); `buthe-2018` An analytic method for bounding ψ(x), Math. Comp. 87 (2018);
  `bhattacharjee-2024` S. Bhattacharjee, A survey of Büthe's method for estimating prime counting
  functions, M.Sc. thesis, University of Lethbridge (2024), cited by locator; `johnston-2022`
  D. R. Johnston, Improving bounds on prime counting functions by partial verification of the
  Riemann hypothesis, Ramanujan J. 59 (2022), arXiv 2109.02249.
- `lee-nosal-2026` E. S. Lee, P. Nosal, Sharper bounds for the error in the prime number theorem
  assuming the Riemann Hypothesis, J. Number Theory 283 (2026), arXiv 2312.05628.
- `chirre-helfgott-2025` A. Chirre, H. A. Helfgott, Optimal bounds for sums of non-negative
  arithmetic functions, arXiv 2512.15709, preprint.
- `axler-2016` C. Axler, New bounds for the prime counting function, Integers 16 (2016);
  `axler-2018` New estimates for some functions defined over primes, Integers 18 (2018), A52, arXiv
  1703.08032; `axler-2019` On the sum of the first n prime numbers (arXiv title: New bounds for the
  sum of the first n prime numbers), J. Théor. Nombres Bordeaux 31 (2019), arXiv 1606.06874;
  `axler-2019-nth-prime` New estimates for the nth prime number, J. Integer Seq. 22 (2019), Article
  19.4.2, arXiv 1706.03651; `axler-2024` Effective estimates for some functions defined over
  primes, Integers 24 (2024), A34, arXiv 2203.05917 (the journal numbers its results Proposition 1,
  Theorems 1–6, Proposition 4; the arXiv v4 text Proposition 1.1, Theorems 1.2–1.6, Propositions
  4.5, 5.3).
- `zhang-xiong-2025` Q. Zhang, X. Xiong, New refinements of Mandl's inequality, Integers 25 (2025),
  A58.
- `fiori-jaskari-2026` A. Fiori, M. Jaskari, Explicit bounds for the prime number theorem, arXiv
  2609.23222, preprint; `broadbent-fiori-kadiri-ng-wilk-2026` S. Broadbent, A. Fiori, H. Kadiri, N. Ng, K. Wilk,
  Bounds for Mertens sums, arXiv 2608.01498, preprint.
- `brent-platt-trudgian-2021` R. P. Brent, D. J. Platt, T. S. Trudgian, Accurate estimation of sums
  over zeros of the Riemann zeta-function, Math. Comp. 90 (2021); `platt-2016` D. J. Platt,
  Numerical computations concerning the GRH, Math. Comp. 85 (2016), arXiv 1305.3087 (both cited in
  the supplier contracts).
- `lamzouri-li-soundararajan-2015` Y. Lamzouri, X. Li, K. Soundararajan, Conditional bounds for the
  least quadratic non-residue and related problems, Math. Comp. 84 (2015), arXiv 1309.3595.
- `lu-zaman-zhao-2026` R. F. Lu, A. Zaman, H. Zhao, Numerical computations concerning Landau–Siegel
  zeros, Math. Comp. (2026), arXiv 2602.03626; `thorner-zaman-2024` J. Thorner, A. Zaman, An
  explicit version of Bombieri's log-free density estimate and Sárközy's theorem for shifted
  primes, Forum Math. 36 (2024), arXiv 2208.11123; `banks-2026` W. D. Banks, On the OpenAI proof
  that Landau–Siegel zeros do not exist, arXiv 2610.15483, preprint; `openai-2026-siegel` OpenAI,
  Uniform exclusion of Landau–Siegel zeros, preprint (cited for the qualitative statement owned by
  AnalyticNumberTheoryPartI §0.34).
- `panaitopol-2000` L. Panaitopol, A formula for π(x) applied to a result of Koninck–Ivić, Nieuw
  Arch. Wiskd. 5/1 (2000); `dudek-platt-2015` A. W. Dudek, D. J. Platt, On solving a curious
  inequality of Ramanujan, Exp. Math. 24 (2015), Lemma 2.1 (the criterion of §3.5).
- `ramare-2013` O. Ramaré, Explicit estimates for the summatory function of Λ(n)/n from the one of
  Λ(n), Acta Arith. 159 (2013), HAL text, with `ramare-2023-corrigendum` its corrigendum, Acta
  Arith. 211 (2023), author copy; `ramare-2016` An explicit density estimate for Dirichlet
  L-series, Math. Comp. 85 (2016); `ramare-2002` Sur un théorème de Mertens, Manuscripta Math.
  108 (2002); `ramare-rumely-1996` O. Ramaré, R. Rumely, Primes in arithmetic progressions, Math.
  Comp. 65 (1996); `ramare-saouter-2003` O. Ramaré, Y. Saouter, Short effective intervals
  containing primes, J. Number Theory 98 (2003) (cited by locator).
- `vanlalngaia-2017` R. Vanlalngaia, Explicit Mertens sums, Integers 17 (2017), A11. Its
  line-numbered text renders the digits as letters (`]` for `0`, `a` for `1`, `b` for `2`, …, `i`
  for `9`); the constants cited are the published values.
- `trevino-2012` E. Treviño, The least inert prime in a real quadratic field, Math. Comp. 81 (2012).
- `deleglise-nicolas-2019-landau` M. Deléglise, J.-L. Nicolas, The Landau function and the Riemann
  hypothesis, HAL text.
- `de-koninck-letendre-2020` J.-M. De Koninck, P. Letendre, New upper bounds for the number of
  divisors function, arXiv text.
- `robin-1983` G. Robin, Estimation de la fonction de Tchebychef θ sur le k-ième nombre premier,
  Acta Arith. 42 (1983); `massias-robin-1996` J.-P. Massias, G. Robin, Bornes effectives pour
  certaines fonctions concernant les nombres premiers, J. Théor. Nombres Bordeaux 8 (1996);
  `rosser-1938`, `rosser-1941` J. B. Rosser, The n-th prime is greater than n log n, Proc. London
  Math. Soc. (2) 45 (1938), and Explicit bounds for some functions of prime numbers, Amer. J. Math.
  63 (1941) (cited by locator); `cipolla-1902` M. Cipolla, La determinazione assintotica
  dell'n-imo numero primo (1902), pp. 132–166 (cited by locator).
- `mccurley-1984` K. S. McCurley, Explicit estimates for the error term in the prime number theorem
  for arithmetic progressions, Math. Comp. 42 (1984); `bennett-martin-obryant-rechnitzer-2018`
  M. A. Bennett, G. Martin, K. O'Bryant, A. Rechnitzer, Explicit bounds for primes in arithmetic
  progressions, Illinois J. Math. 62 (2018), arXiv text; `bach-sorenson-1996` E. Bach, J. Sorenson,
  Explicit bounds for primes in residue classes, Math. Comp. 65 (1996); `kadiri-2008` H. Kadiri,
  Short effective intervals containing primes in arithmetic progressions and the seven cubes
  problem, Math. Comp. 77 (2008).
- `kadiri-lumley-2014` H. Kadiri, A. Lumley, Short effective intervals containing primes, Integers
  14 (2014); `cully-hugill-lee-2022` M. Cully-Hugill, E. S. Lee, Explicit interval estimates for
  prime numbers, Math. Comp. 91 (2022), and `cully-hugill-lee-2024` its corrigendum (cited by locator);
  `dudek-2015` A. W. Dudek, On the Riemann hypothesis and the difference between primes, Int. J.
  Number Theory 11 (2015); `dudek-2016` An explicit result for primes between cubes, Funct. Approx.
  55 (2016), arXiv text; `cully-hugill-2021` M. Cully-Hugill, Primes between consecutive powers,
  J. Number Theory 247 (2023), arXiv 2107.14468; `cully-hugill-johnston-2021` M. Cully-Hugill,
  D. R. Johnston, On the error term in the explicit formula of Riemann–von Mangoldt, arXiv
  2111.10001 (v5 numbering); `cully-hugill-johnston-2025` M. Cully-Hugill,
  D. R. Johnston, On the error term in the explicit formula of Riemann–von Mangoldt II, Funct.
  Approx. Comment. Math. 73 (2025), arXiv 2402.04272; `lee-2026` E. S. Lee, Minimal zero-free
  regions for results on primes between consecutive perfect kth powers, arXiv 2602.14340, preprint;
  `visser-2025` M. Visser, Effective short intervals containing primes, arXiv 2508.18786, preprint;
  `carneiro-milinovich-soundararajan-2019` E. Carneiro, M. B. Milinovich, K. Soundararajan,
  Fourier optimization and prime gaps, Comment. Math. Helv. 94 (2019), arXiv text.
- `van-de-lune-te-riele-winter-1986`, `platt-2017`, `rumely-1993`: the verified-zero computations;
  `oliveira-e-silva-herzog-pardi-2014`: prime gaps;
  `kadiri-2013-density`: the zero density used by Faber–Kadiri; `kadiri-lumley-ng-2018` H. Kadiri,
  A. Lumley, N. Ng, Explicit zero density for the Riemann zeta function, J. Math. Anal. Appl. 465
  (2018), arXiv 2101.12263 (its display (1.5) and footnote 1, Ramaré's revised density).
- `pnt-plus` PrimeNumberTheoremAnd, <https://github.com/AlexKontorovich/PrimeNumberTheoremAnd>;
  cited for §§0.1, 0.3, 0.3a, 0.3b, 0.4, 0.5, 0.6, 0.8, 1.1, 1.3, 1.4, 1.6, 2.1, 2.3, 2.4, 2.5, 2.6,
  3.1, 3.2, 3.3, 3.4, 3.4a, 3.5, 3.6, 3.7, 3.8, 4.1, 4.2, 4.3, 4.4, 4.5, 4.6, 5.2, 5.3, 5.4, 5.5,
  7.1, 7.2, 7.3, 7.4 and 7.5.
- `ieantn` IEANTN, <https://github.com/teorth/IEANTN>; cited for §§0.3, 0.3a, 0.3b, 0.4, 0.8, 1.1,
  1.3, 2.3, 2.4, 2.6, 3.1, 3.2, 3.4, 3.4a, 3.5, 3.6, 3.7, 4.2, 7.1, 7.2, 7.3 and 7.4.
