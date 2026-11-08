# Roadmap: explicit multiplicative functions

**Summary.** This roadmap builds the numerically explicit layer of multiplicative number theory on
Mathlib's `ArithmeticFunction` carrier: inequalities with stated constants and thresholds for the
summatory functions of the Möbius function `M(x) = Σ_{n ≤ x} μ(n)`, `m(x) = Σ_{n ≤ x} μ(n)/n` and
`m̌(x) = Σ_{n ≤ x} μ(n) log(x/n)/n`, with and without coprimality restrictions and character twists;
the general conversion theorems behind those numbers (Meissel's and MacLeod's identities, Balazard's
passage from `M` to `m` and `m̌`, Ramaré's transfer from explicit prime estimates to explicit Möbius
estimates, the comparison theorem of the convolution method, the explicit Levin–Fainleib theorem);
explicit upper bounds for averages of nonnegative multiplicative functions; the explicit averages of
`μ²`, `μ²/φ`, `τ`, `τ_k`, `τ²`, `2^ω`, `φ` and the Piltz remainders `Δ_k`; explicit finite Euler
products over primes; and pointwise bounds for `ω(n)`, `τ_k(n)`, `σ(n)`, `σ*(n)` and `n/φ(n)`. Every
result is proved once in a general form whose analytic inputs (a Chebyshev bound of a given shape, a
Möbius table, a finite verification, a computed sum over the zeros of `ζ` up to a height) are
explicit parameters or named propositions, and the published constants are then instances. The end
theorems are Ramaré's transfer theorem with every computation it rests on named, and its instance
`|M(D)| ≤ (0.0130/log D − 0.118/log² D) D` for `D ≥ 1 078 853` (analytic from `2 161 205`, a direct
verification below); Tao's bound
`|Σ_{n ∈ ⟨S⟩, n ≤ x} μ(n)/n| ≤ 1` for every set `S` of primes; Balazard's inequality
`|m(x)| ≤ |M(x)|/x + x^{−2} ∫_1^x |M(t)| dt + 8/(3x)` and Ramaré's companion
`|m̌(x) − 1| ≤ ((7/4 − γ)/x²) ∫_1^x |M(t)| dt + 2/x`; the comparison theorem of the convolution
method for a general exponent, with the Dirichlet-divisor model
`Σ_{n ≤ t} τ(n)/n = ½ log² t + 2γ log t + γ² − 2γ₁ + O*(1.16 t^{−1/3})` for `t ≥ 1` (with `1.641` in
place of `1.16` for every `t > 0`, the form the comparison theorem consumes); the Hall–Tenenbaum
inequality; the explicit Mertens product
`e^γ log x ∏_{p ≤ x}(1 − 1/p) ∈ [1 − 1/log² x, 1 + 1/(2 log² x)]` with Axler's refinement
`e^γ log x ∏_{p ≤ x}(1 − 1/p) < 1 + 0.07/log³ x`; Robin's `ω(n) ≤ 1.3841 log n/log log n`, the
Nicolas–Robin maximum `τ(n) ≤ n^{1.538 log 2/log log n}` and Rosser–Schoenfeld's
`n/φ(n) < e^γ log log n + 2.50637/log log n`, all for `n ≥ 3`. Robin's
`σ(n)/n < e^γ log log n + 0.6483/log log n` for `n ≥ 3` is stated by its locator beside Nicolas'
proved bounds for `σ(n)/n` (9.3), not as an end theorem: the inputs of its proof are fixed only in
its source. Beside each refereed statement the
layers carry the sharper statements of later work that improve it: Ramaré–Zuniga Alterman's
`|M(D)| ≤ (0.006688 log D − 0.039) D/log² D` for `D ≥ 1 798 118`, Chirre–Helfgott's linear bound
`|M(x)| ≤ (3/(π·10^{10})) x + 11.39 √x` for every `x ≥ 1` from the zeros of `ζ` up to a finite height,
and the constants of Daval, Johnston–Leong–Tudzi, Zuniga Alterman, Platt–Trudgian and Tudzi.

Suggested home: `TauCeti/NumberTheory/Explicit/MultiplicativeFunctions/`, divided into `Moebius/`,
`Convolution/`, `Averages/`, `EulerProducts/` and `Pointwise/`.
[`Suggested.lean`](Suggested.lean) states the headline theorems against the pinned libraries; it is
not the roadmap.

## Scope and ownership

### Owned here

- the real-argument summatory carriers of the Möbius function, their semigroup-restricted and
  character-twisted variants, the real-argument harmonic remainder, the squarefree remainder, the
  first Stieltjes constant, and the propositions that isolate the finite computations the sources
  rely on (Layer 0);
- Meissel's identity, MacLeod's Bernoulli identities, Balazard's identities, the elementary linear
  and logarithmic bounds for `M(x)` (with their iteration to `x/(log x)^{2.35}`), the linear bounds
  from a Möbius table, Ramaré's transfer from explicit Chebyshev estimates to explicit Möbius
  estimates as a parametric theorem with every finite computation named, with its 2013 instance and
  Ramaré–Zuniga Alterman's instance, the coprime variants, the linear bounds from finitely many zeros
  of `ζ` under a named residue-sum hypothesis, Daval's linear-to-linear conversion, and Lee–Leong's
  bound of de la Vallée Poussin shape given the Riemann hypothesis verified to the height
  `3 000 175 332 800`, with the two bounds of Leong near that height that the join of its contour
  uses (Layer 1);
- Gram's and Tao's bound `|m_S(x)| ≤ 1`, Ramaré's mollified bound, Balazard's conversion theorem and
  Daval's weighted form of it, the thresholded and decaying bounds for `m(x)`, the coprime variants,
  the explicit tails of `Σ μ(d)/d²`, and the `m`-bound of Ramaré–Zuniga Alterman (Layer 2);
- the identities and bounds for `m̌(x)`, with the sign correction of the corrigendum, the coprime
  positivity theorem, and the decaying bounds with the exact
  value of `sup_{x ≥ 1} (log² x)|m̌(x) − 1|` (Layer 3);
- the character-twisted logarithmic Möbius sum with a Pólya–Vinogradov bound as a parameter
  (Layer 4);
- the comparison theorem of the convolution method for a general exponent, its weighted variant,
  the harmonic and Dirichlet-divisor models (including the exponent `2/5`), the second model, the
  hyperbola refinement of Akhilesh–Ramaré, the explicit Levin–Fainleib theorem and the squarefree
  comparison at the critical exponent (Layer 5);
- explicit upper bounds for averages of nonnegative multiplicative functions: the product bound,
  the Daboussi–Rivat tail bound, the Hall–Tenenbaum theorem, Bordellès' monotone-local-factor bound
  and the van Lint–Richert coprimality removal (Layer 6);
- the explicit averages of `μ²`, `μ²/n`, `μ²/φ`, the Riesel–Vaughan sum, `τ_k`, `τ_4`, `τ²`,
  `2^ω`, `φ/n` and `nφ`, Ramaré's logarithmic tail estimates for `Σ μ(d)/d²`, the square-root
  bounds for the Dirichlet-divisor remainder with the constants `0.961`, `0.482` and `0.397` and its
  smoothed form, the squarefree remainder from finitely many zeros with squarefree integers in short
  intervals, and the explicit Piltz remainders `Δ_k` (Layer 7);
- the identification of the Meissel–Mertens constant with Tau Ceti's `mertensConstant ℚ`, the
  explicit Mertens product with Axler's cubic refinement and its form under the Riemann
  hypothesis, the tilted products and Bordellès'
  products over a progression with Languasco–Zaccagnini's constants as an enclosure (Layer 8);
- the pointwise bounds for `ω(n)`, `τ_k(n)`, `σ(n)`, `σ*(n)` and `n/φ(n)` with the
  superior-highly-composite and primorial tables as hypotheses (Layer 9).

### Consumed, not redefined

- the arithmetic functions `μ`, `σ_k`, `ω`, `Λ`, `ζ`, `IsMultiplicative`, Dirichlet convolution,
  `Chebyshev.psi`, `Chebyshev.theta`, Abel summation, the harmonic bounds, Euler's constant with its
  bounds `1/2 < γ < 2/3`, `ζ(2) = π²/6`, Dirichlet characters with `L(1, χ) ≠ 0`, the primorial, and
  the decimal bounds for `π`, `e` and `log 2`: Mathlib, as listed in the supplier contracts;
- the summatory Abel formulas of Tau Ceti and its Mertens constant `mertensConstant K`;
- the explicit prime estimates with constants (for `ψ`, `θ`, `π`, the `k`-th prime,
  `Σ_{n ≤ x} Λ(n)/n`, `Σ_{p ≤ x} 1/p` and `θ` in progressions), the verified range of Büthe, the
  decimal enclosures of `γ` and of the Meissel–Mertens constant, the hypothesis `RH(H)` and the
  real-zero gap with its named instances, and Büthe's asymptotic for the diagonal sum
  `Σ_{n ≤ z} μ²(n)/φ(n)`: ExplicitPrimeCounting §§0.1, 1.1, 1.3, 1.6, 1.7, 3.1–3.3, 3.5,
  4.2, 4.3, 4.7, 5.3, 6.1 and 6.3, as listed in its contract; the estimates it does not state in the
  shape a proof here needs are supplier gaps of that contract. No prime estimate is restated: every
  theorem that uses one takes it as a hypothesis of the stated shape;
- the Rosser–Schoenfeld reciprocal-prime estimate `|Σ_{p ≤ x} 1/p − log log x − B| < 1/(2 log² x)`
  for `x ≥ 286`, Mertens' theorems with qualitative remainders, the qualitative exclusion of
  Landau–Siegel zeros, the Dirichlet divisor asymptotic, the harmonic remainder
  `0 < H_N − log N − γ < log(1 + 1/N)` at integers, the divisor hyperbola identity, the
  Dirichlet-divisor remainder `divisorError` (`Δ`) with its square-root and cubic bounds and their
  finite input `BBRFiniteInput`, the divisor subpower bound, the asymptotic maximal order of `τ`,
  Rankin's smooth-number bound and the asymptotic coprime Möbius sums: AnalyticNumberTheoryPartI
  §§0.11, 0.19, 0.21, 0.26, 0.34, 3.1, 3.7, 3.9, 3.12, 3.22, 3.22a, 3.22b, 3.23a, 3.35, 3.35a,
  never restated; Layer 0.3 extends §3.22a to real arguments with the sharper `6/(11X)`, and Layer
  7.4 sharpens the constant of §3.23a's square-root bound from `1` to `0.961`;
- the asymptotic Levin–Fainleib mean value and its uniform dimension-one form, and the logarithmic
  sieve dimension predicate: SieveMethodsAndPrimePatterns §§0.5 and 1.1, cited for the statement
  shape of Layer 5.5, which refines it with explicit constants;
- the semantics of verified zeros (*AllOnCriticalLine*): ZerosOfLFunctions Layer 9; it enters this
  roadmap only through ExplicitPrimeCounting §1.1 and is never restated;
- the Selberg diagonal sum `selbergDiagonal`, `S(z) = Σ_{n ≤ z} μ²(n)/φ(n)` for real `z`, with its
  coprime comparison `S_k(z) ≥ (φ(k)/k) S(z)`: ExplicitCharacterSumsAndSieves §5.1; and Büthe's
  explicit asymptotic `S(z) = log z + c₀ + O*(58/√z)` for real `z ≥ 10^9`, where
  `c₀ = γ + Σ_p log p/(p(p − 1))` is the constant of Layer 7.2: ExplicitPrimeCounting §0.1, which
  defines the same sum and which ExplicitCharacterSumsAndSieves §5.1 cites for it; neither is
  restated. Layer 6.5 differs in
  proving the comparison for every nonnegative multiplicative `f` in place of `1/φ` and in adding
  the upper inequality through `x·rad(d)`; Layers 5.6 and 7.2 differ in proving other explicit
  forms of `S` and of its coprime restrictions (Ramaré's `O*(2.44/√D)` from `D ≥ 1`,
  Akhilesh–Ramaré's coprime form, Zuniga Alterman's `X^{−1/3}` forms for every `X > 0`).

### Not owned here

- zero-free regions, the explicit formula for `ψ`, zero counting, decimal zero-free constants and
  explicit bounds for `1/ζ` and for the moments of `ζ` (ZerosOfLFunctions, ExplicitPrimeCounting,
  ExplicitZetaBounds); the explicit formula for `M` with a smoothed kernel (1.7) is proved here from
  the zero data named in *ZetaResidueSumVerified*; the bounds for `1/ζ` that the route of
  Lee–Leong's bound of 1.9 takes from a supplier are ExplicitZetaBounds §7.10's, each given
  `RH(3 000 175 332 800)`. Two further bounds of Leong that only the join of that contour uses, at
  heights just below the verified one, are stated in 1.9: a row of the corollary whose
  classical-region row §7.10 states, and the bound for `ζ'/ζ` that §7.10's route uses without
  stating it. The bound for `1/ζ` on `σ = 3/4`, `|t| ≤ 14`, a computation on a compact segment, is
  the proposition *ZetaReciprocalSegmentVerified* of Layer 0.7;
- the explicit Pólya–Vinogradov and Burgess inequalities and the explicit sieve bounds
  (ExplicitCharacterSumsAndSieves): Layer 4 takes a Pólya–Vinogradov bound as a parameter, and what
  this roadmap consumes from that roadmap is its §5.1 (above);
- any computational algorithm: sieving `M(x)`, evaluating a constant, verifying a table. A page on
  exact computation contributes a verified value only, as a proposition that this roadmap states
  and does not discharge (Layer 0.7);
- Vanlalngaia's constant `0.841` for the tilted products (`vanlalngaia2017` Theorem 5, p. 3): its
  input is that paper's Theorem 4, a remainder for `Σ_{p ≤ x} 1/p` in terms of `ψ(x) − x`, which is
  a prime estimate outside the contract of ExplicitPrimeCounting; Layer 8.2 proves the transfer with
  the cubic reciprocal-prime remainder instead;
- the `(log log x)^k/(log x)^k` family of bounds for `M(x)` of El Marraki 1995, Théorème 4, and the
  double-logarithmic sum `Σ_{n ≤ x} μ(n) log²(x/n)/n` of Ramaré 2015, Theorems 1.7–1.8 and
  1.16–1.17, with its coprime consequence `0 ≤ Σ_{n ≤ x, (n, q) = 1} μ(n) log²(x/n)/n ≤ 2 (q/φ(q)) log x`
  (Corollary 1.11): they belong to ExplicitMultiplicativeFunctions, Part II, which starts where
  Layers 1 and 3 stop;
- the statements whose proofs rest on inputs that no supplier states and that only their sources
  fix: Ramaré–Zuniga Alterman's identity-factory results (`ramareZunigaAlterman2026` Theorems 1.2,
  1.7 and 1.8: the coprime sums `Σ_{n ≤ X, (n, q) = 1} μ(n) n^{−σ} log^k(X/n)` for `σ ≥ 1` and their
  asymptotics for `1 ≤ σ ≤ 2`, which use bounds for the Möbius sums over odd integers taken from
  Helfgott's monograph, the source's Lemma 5.4 and direct checks for `X < 47`, and, for `k ≥ 2`, the
  double-logarithmic sums of the previous item); the odd form
  `Σ_{d ≤ X, d odd} μ²(d)/d = (4/π²)(log X + C₂ + (log 2)/3) + O*(0.79/√X)` of Zuniga Alterman
  (`zunigaAlterman2022` Lemma 4.1, second part, which uses a count of odd squarefree integers from
  the same monograph), with its consequence
  `Σ_{ℓ ≤ X, ℓ odd} μ²(ℓ)/φ(ℓ) = ½(log X + a_2) + O*(2.169/√X)` for every real `X > 0`
  (`zunigaAlterman2022` Lemma 4.7 at `q = 2`, the source's Theorem 4.6 at the exponent `1/2` over that
  odd model, with `a_2` of Layer 5.6 and the Euler product `∏_{p > 2}(1 + 1/((p − 1)(√p − 1)))`);
  Palojärvi–Tudzi's Piltz remainders (`palojarviTudzi2026`
  Theorem 1.1, which use explicit bounds for the second and fourth moments of `ζ` on the critical
  line); and Lee–Leong's bounds for `M(x)` of Littlewood and Korobov–Vinogradov shape
  (`leeLeong2022` (10) and (11), beside the de la Vallée Poussin member (9) of 1.9; they use their
  bounds (7) and (8) for `1/ζ` in the Littlewood and Korobov–Vinogradov zero-free regions, which no
  supplier states). They belong
  to ExplicitMultiplicativeFunctions, Part II, which starts where Layers 1, 2, 3, 5 and 7 stop;
- Nicolas' Théorème 3 (the constant `2.597` for every `n ≥ 3` outside a table of twelve exceptional
  integers): it belongs to ExplicitMultiplicativeFunctions, Part II, and Layer 9.3 states Théorème 2,
  whose constant is attained;
- the ordered-divisor majorants `Σ_{n ≤ Z} τ_k(n)/n ≤ (1 + log Z)^k` and
  `Σ_{n ≤ Z} τ_k(n) ≤ Z (1 + log Z)^{k−1}` for real `Z ≥ 1` (SieveMethodsAndPrimePatterns §1.1);
  Bordellès' bound of Layer 7.5 differs in having `γ + 1/x` in place of `1`, which is smaller for
  every `x > 1/(1 − γ) = 2.365…`;
- the qualitative maximal orders `τ(n) ≤ exp((log 2 + ε) log n/log log n)` for large `n` and
  `n/φ(n) ≤ C log log n` (AnalyticNumberTheoryPartI §§3.7 and 3.11), of which Layer 9 proves the
  explicit forms;
- the class-number applications (ExplicitNumberFields) and the least-nonresidue and large-sieve
  applications (ExplicitCharacterSumsAndSieves and ExplicitZetaBounds, in their Part II wherever they
  use this roadmap, since both precede it in the order of supply).

## Conventions

Real arguments throughout. For a real `x`, a sum `Σ_{n ≤ x}` runs over the natural numbers of
`Finset.Icc 1 ⌊x⌋₊`, so it is empty for `x < 1`, and `x ↦ Σ_{n ≤ x} a_n` is a right-continuous step
function on all of `ℝ` (zero for `x < 1`). The statement `f(x) = g(x) + O*(h(x))` means
`|f(x) − g(x)| ≤ h(x)` at every `x` in the stated range; `O*` is never asymptotic. Thresholds are
inclusive (`x ≥ x₀`) unless the source states a strict one, which is then kept.

`log` is the real logarithm; `log x` for `x ≤ 0` and `log log x` for `x ≤ 1` are junk values, so
every statement with a logarithm in a denominator or a double logarithm carries the range that makes
it positive (`x > 1`, respectively `n ≥ 3`). Powers `x^α` with real `α` are `Real.rpow`, used only
for `x > 0`.

`μ` is `ArithmeticFunction.moebius`, `Λ` is `ArithmeticFunction.vonMangoldt`, `ζ` is
`ArithmeticFunction.zeta`, `τ = σ 0` (`ArithmeticFunction.sigma 0`), `τ_k = ζ^{⋆ k}` (the `k`-fold
Dirichlet convolution of `ζ`, so `τ_1 = ζ`, `τ_2 = τ`), `ω` is `cardDistinctFactors`, `φ` is
`Nat.totient`, `σ = σ 1`, and `σ*(n) = Σ_{d ∣ n, (d, n/d) = 1} d` is the unitary divisor sum, defined
here. `ψ` and `θ` are `Chebyshev.psi` and `Chebyshev.theta` (inclusive cutoffs). `γ` is
`Real.eulerMascheroniConstant`. `ψ̃(x) = Σ_{n ≤ x} Λ(n)/n`. `p_k` is the `k`-th prime,
`Nat.nth Nat.Prime (k − 1)`, so that `p₁ = 2`, and `N_k = p₁ ⋯ p_k = primorial p_k`.

Semigroup restriction. For a set `S` of primes, `⟨S⟩` is the set of positive integers all of whose
prime factors lie in `S` (Mathlib's `Nat.factoredNumbers` when `S` is finite; the predicate
`∀ p ∈ n.primeFactors, p ∈ S` in general); `M_S`, `m_S`, `m̌_S` are the sums restricted to `⟨S⟩`. The
coprime-to-`q` sums `M_q`, `m_q`, `m̌_q` are the instance `S = {p : ¬ p ∣ q}`. The weight
`q/φ(q)` of a coprime bound is read as `∏_{p ∉ S} (1 − 1/p)^{−1}` over the excluded primes; it is
finite exactly when finitely many primes are excluded, and every coprime bound carries the
hypothesis that `S` excludes finitely many primes (the modulus instance excludes `ω(q)` of them).

Character twists use `DirichletCharacter ℂ q` and the Mathlib value `χ n` at a natural number
(zero when `(n, q) > 1`). `L(1, χ)` is `DirichletCharacter.LFunction χ 1`.

Dirichlet series are written `H(s) = Σ_{n ≥ 1} h(n) n^{−s}` with real `s`, `H̄(s) = Σ |h(n)| n^{−s}`,
and are used only where absolute convergence is a hypothesis. `H'(0)` and `H''(0)` are the sums
`−Σ h(n) log n` and `Σ h(n) log² n`, defined by absolute convergence of `H̄` at a negative abscissa.

The first Stieltjes constant is `stieltjesGammaOne`,
`γ₁ = lim_{N → ∞} (Σ_{n ≤ N} (log n)/n − ½ log² N)`, so that the Laurent expansion of `ζ` at `1`
reads `ζ(1 + s) = 1/s + γ − γ₁ s + …`; its decimal value is a hypothesis, never a definition.

Hypotheses. Every finite computation, table or numerical record a source relies on is a named
proposition (Layer 0.7) with the range and the constant as data; a theorem that uses one takes it as
an argument, and no proposition of this roadmap is proved, discharged or recomputed here. When the
computation is the theorem's own inequality on an initial interval, the theorem proved is the
inequality beyond that interval, and the statement over the full range is its conjunction with the
proposition; wherever a statement below is said to hold "under" or "with" such a proposition on its
initial range, this conjunction is meant, and the proposition is never a hypothesis of the theorem
whose conclusion it restricts. Every explicit prime estimate is likewise a hypothesis of the exact
shape the proof uses, with the section of ExplicitPrimeCounting that proves it, so that no
statement here depends on that roadmap's final constants.

Universes and coefficients: every carrier is a function `ℝ → ℝ` or `ℝ → ℂ`; no structure is
polymorphic.

Sources are cited by the identifiers of the References with a locator: a theorem or equation
number, a page, or a line of the cited text (`ramare2013aa` line 251). A source marked
*uncertified* is cited by its published locator only; where a statement taken from it is also
quoted by another source, that quotation is cited beside it.

## Exact supplier contracts

### From Mathlib

- `ArithmeticFunction.moebius`, `ArithmeticFunction.vonMangoldt`, `ArithmeticFunction.zeta`,
  `ArithmeticFunction.sigma`, `ArithmeticFunction.cardDistinctFactors`,
  `ArithmeticFunction.IsMultiplicative`, the convolution `*` on `ArithmeticFunction R` and its powers
  (`ArithmeticFunction.zeta ^ k` is `τ_k`), `ArithmeticFunction.moebius_mul_coe_zeta`
  (`μ ⋆ ζ = 1`), `ArithmeticFunction.coe_moebius_mul_coe_zeta`,
  `ArithmeticFunction.vonMangoldt_mul_zeta` (`Λ ⋆ ζ = log`),
  `ArithmeticFunction.isMultiplicative_moebius`, `ArithmeticFunction.isMultiplicative_sigma`,
  `ArithmeticFunction.sigma_zero_apply` (`σ 0 n = #n.divisors`), `ArithmeticFunction.prodPrimeFactors`
  with `prodPrimeFactors_apply`, `ArithmeticFunction.IsMultiplicative.prodPrimeFactors_one_sub`,
  `Nat.card_divisors` (`#n.divisors = ∏_{p} (v_p(n) + 1)` for `n ≠ 0`),
  `Nat.sum_divisors_filter_squarefree`, `Nat.totient`, `Nat.factoredNumbers`, `Nat.smoothNumbers`,
  `Nat.equivProdNatFactoredNumbers`, `Nat.primesBelow`, `Nat.primesLE` (the primes `≤ n`,
  `Mathlib/NumberTheory/PrimeCounting.lean`), `Nat.nth` with `Nat.nth_prime_zero_eq_two`, and
  `primorial` (`Mathlib/NumberTheory/Primorial.lean`, the product of the primes `≤ n`);
- `Chebyshev.psi`, `Chebyshev.theta` (sums over `Ioc 0 ⌊x⌋₊`), `Chebyshev.psi_nonneg`,
  `Chebyshev.theta_le_log4_mul_x` (`θ x ≤ log 4 · x` for `x ≥ 0`), `Chebyshev.psi_le_const_mul_self`
  (`ψ x ≤ (log 4 + 4) x` for `x ≥ 0`), `Chebyshev.psi_eq_theta_add_sum_theta`,
  `Chebyshev.abs_psi_sub_theta_le_sqrt_mul_log`;
- `sum_mul_eq_sub_sub_integral_mul` (Abel summation: for `0 ≤ a ≤ b`, `f` differentiable on
  `[a, b]` with integrable derivative,
  `Σ_{a < k ≤ b} f(k) c(k) = f(b) C(b) − f(a) C(a) − ∫_a^b f'(t) C(t) dt` with `C(t) = Σ_{k ≤ t} c(k)`), and its variants
  `sum_mul_eq_sub_integral_mul`, `sum_mul_eq_sub_integral_mul₀`;
- `harmonic`, `harmonic_le_one_add_log` (`H_n ≤ 1 + log n`), `log_add_one_le_harmonic`
  (`log(n + 1) ≤ H_n`), `Real.eulerMascheroniConstant`, `Real.eulerMascheroniSeq`,
  `Real.eulerMascheroniSeq'`, `Real.eulerMascheroniSeq_lt_eulerMascheroniConstant`,
  `Real.eulerMascheroniConstant_lt_eulerMascheroniSeq'`, `Real.one_half_lt_eulerMascheroniConstant`,
  `Real.eulerMascheroniConstant_lt_two_thirds` (no decimal enclosure of `γ` finer than these is
  at the pin; the two `eulerMascheroniSeq` inequalities enclose `γ` in an interval of width
  `log(1 + 1/n)` at every index `n`);
- `hasSum_zeta_two` (`Σ 1/n² = π²/6`), `Real.pi_gt_d6`, `Real.pi_lt_d6`, `Real.exp_one_gt_d9`,
  `Real.exp_one_lt_d9`, `Real.log_two_gt_d9`, `Real.log_two_lt_d9`, `riemannZeta`, `Real.Gamma`;
- `DirichletCharacter ℂ N`, `DirichletCharacter.LFunction`,
  `DirichletCharacter.LFunction_apply_one_ne_zero`
  (`χ ≠ 1 → LFunction χ 1 ≠ 0`), `DirichletCharacter.LFunction_ne_zero_of_one_le_re`;
- `EulerProduct.eulerProduct_hasProd`, `EulerProduct.eulerProduct_completely_multiplicative`
  (the Euler product of an absolutely summable multiplicative `f`, as finite products over
  `primesBelow` and their limit), `EulerProduct.summable_and_hasSum_smoothNumbers_prod_primesBelow_tsum`
  (for `f` with `f 1 = 1`, multiplicative on coprime arguments and with absolutely summable local
  series, the sum over the `N`-smooth numbers is `∏_{p < N} Σ_n f(p^n)`; used in Layer 6.1),
  `Real.summable_nat_rpow_inv`, `hasDerivAt_tsum`;
- `ArithmeticFunction.LSeriesSummable_moebius_iff` (the `L`-series of `μ` converges absolutely
  exactly on `Re s > 1`), `LSeries_one_mul_Lseries_moebius` and `LSeries_one_eq_riemannZeta`
  (together: the `L`-series of `μ` is `1/ζ` on `Re s > 1`), used in the route of Layer 1.9;
- `Complex.borelCaratheodory` (`Mathlib/Analysis/Complex/BorelCaratheodory.lean`: for `f`
  differentiable on the open ball of radius `R` about `0` with `Re f ≤ M` there and `M > 0`,
  `‖f z‖ ≤ 2M‖z‖/(R − ‖z‖) + ‖f 0‖(R + ‖z‖)/(R − ‖z‖)` for `‖z‖ < R`), used in the route of the
  items (a) and (b) of Layer 1.9;
- `Polynomial.bernoulli` (the Bernoulli polynomials with `B₁ = −1/2`), `Nat.Coprime`,
  `Nat.primeFactors`, `Squarefree`, `Nat.factorization`, `Real.log_le_sub_one_of_pos`,
  `Real.add_one_le_exp`.

What these do not include: no real-argument summatory function of `μ`, no bound on `M(x)` or
`m(x)` of any shape, no explicit remainder for `Σ_{n ≤ x} τ(n)`, no Stieltjes constant, no explicit
Mertens product, no pointwise bound for `ω`, `τ_k` or `σ` beyond `Nat.card_divisors_le_self`; the
Chebyshev bounds at the pin are the Chebyshev-type constants `log 4` and `log 4 + 4` only.

### From Tau Ceti

- `TauCeti/NumberTheory/AbelSummation.lean`: `TauCeti.sum_Icc_rpow_mul_eq` (Abel summation against a
  real power on `Icc 1 ⌊x⌋₊`) and `TauCeti.tendsto_rpow_inv_mul_sum_Icc_rpow_mul`;
- `TauCeti/NumberTheory/ArithmeticDirichletSeries/AbelSummation.lean`:
  `TauCeti.summatory_mul_eq_sub_sub_integral_mul`, `TauCeti.summatory_mul_eq_sub_integral_mul_of_le`,
  `TauCeti.summatory_mul_le_of_summatory_le`, `TauCeti.tsum_mul_le_of_summatory_le` (summatory Abel formulas and
  the transfer of a summatory bound to a weighted sum and to a tail);
- `TauCeti/NumberTheory/LFunctions/Mertens.lean`: `TauCeti.LFunctions.mertensConstant K` (the limit
  of `Σ_{N𝔭 ≤ x} 1/N𝔭 − log log x`), `TauCeti.LFunctions.tendsto_primeSummatory_inv_absNorm_sub_log_log`,
  `TauCeti.LFunctions.isBigO_primeSummatory_inv_absNorm_sub_log_log_sub_mertensConstant`; used at
  `K = ℚ`, where the prime ideals of norm `≤ x` are the rational primes `p ≤ x`; `Suggested.lean`
  imports this module;
- `TauCeti/NumberTheory/ArithmeticFunction/DivisorBounds.lean`: `TauCeti.sigma_le_rpow_mul_tsum`
  (`σ_k(n) ≤ n^s Σ_d d^{−s}` for `k ≤ s`, `s > 1`, every `n` including `0`); its `k = 0` case is the
  `k = 2` case of Layer 9.2's `τ_k(n) ≤ n^s ζ(s)^{k−1}`;
- `TauCeti/NumberTheory/ArithmeticDirichletSeries/EulerProduct/Basic.lean`: `TauCeti.IdealArithmeticFunction.localArithmeticFactor`,
  `TauCeti.IdealArithmeticFunction.normCoeff_eq_eulerProduct`, `TauCeti.IdealArithmeticFunction.isMultiplicative_eulerProduct`, used
  only as the comparison point for the local factors of Layer 0.6; the Dirichlet series of this
  roadmap are over `ℕ`, not over ideals;
- `TauCeti/NumberTheory/PrimeCounting.lean`: `Nat.primeCounting_nth_prime` (`π(p_{k+1}) = k + 1`
  for Mathlib's `nth Nat.Prime k`);
- `TauCeti/NumberTheory/SumPrimeReciprocals.lean`:
  `Nat.tendsto_prod_primesLE_filter_notMem_one_sub_inv_inv_atTop` (divergence of the Euler product
  over the primes outside a finite set);
- `TauCeti/NumberTheory/ArithmeticDirichletSeries/Perron/Formula.lean`:
  `TauCeti.norm_truncatedPerron_LSeries_sub_sum_le` (the truncated Perron formula: for real `x > 0`,
  `c > 0`, `T > 0`, and `f : ℕ → ℂ` whose `L`-series converges absolutely at `c` and that vanishes at
  `x` when `x` is a natural number, the integral `(2π)^{−1} ∫_{−T}^{T} L(f, c + it) x^{c+it}/(c + it) dt`
  differs from `Σ_{1 ≤ n < x} f(n)` by at most `Σ_n |f(n)| (x/n)^c/(πT|log(x/n)|)`); used at
  `f = μ` in the route of Layer 1.9.

What these do not include: no explicit constant in any prime estimate, no explicit remainder for
`mertensConstant`, no summatory bound for `μ`.

### From TauCetiRoadmap.AnalyticNumberTheoryPartI

- §0.11: `Σ_{p < X} (log p)/p = log X + O(1)`, the qualitative input of Layer 6.3's hypothesis `A`;
- §0.19: there is a real `B` with `|Σ_{p ≤ x} 1/p − log log x − B| < 1/(2 log² x)` for every real
  `x ≥ 286` (Rosser–Schoenfeld Theorem 5), unconditional; Layer 8.1 identifies this `B` with
  `mertensConstant ℚ`, and Layer 1.4 uses its lower half for Schoenfeld's inequality;
- §0.21: `Σ_{p ≤ x} 1/p = log log x + B + O(1/log x)` for `x ≥ 2`, and §0.26:
  `∏_{p ≤ x}(1 − 1/p)^{−1} = e^γ log x + O(1)` for `x ≥ 2`; together they give the identity
  `B = γ + Σ_p (log(1 − 1/p) + 1/p)` used in Layer 8.1;
- §0.34: the uniform exclusion of Landau–Siegel zeros (`landau_siegel_exclusion`), the qualitative
  statement whose explicit forms are ExplicitPrimeCounting §1.7's; cited only;
- §3.22: `Σ_{n ≤ x} τ(n) = x log x + (2γ − 1) x + O(√x)`; §3.22a:
  `0 < H_N − log N − γ < log(1 + 1/N) ≤ 1/N` for every integer `N ≥ 1`, which Layer 0.3 extends to real arguments;
  §3.22b: the hyperbola identity `Σ_{n ≤ x} τ(n) + M² = 2 Σ_{a ≤ M} ⌊x/a⌋` with `M = ⌊√x⌋` for real
  `x ≥ 1`, used in Layer 7.4;
- §3.23a: `divisorError`, `Δ(x) = Σ_{n ≤ x} τ(n) − x (log x + 2γ − 1)` with the inclusive real
  cutoff, the carrier of Layers 5.2, 7.4 and 7.5; its square-root bound `|Δ(x)| ≤ √x` for `x ≥ 1`,
  whose constant Layer 7.4 sharpens to `0.961`; its cubic bound `|Δ(x)| ≤ 0.764 x^{1/3} log x` for
  `x ≥ 9995`, consumed as stated; and the finite input `BBRFiniteInput` of both bounds, whose first
  conjunct is `|Δ(x)| ≤ 0.961 √x` for every real `1 ≤ x ≤ 10^{10}` and whose fourth is
  `|Δ(x)| ≤ 0.475 √x` for every real `4033 ≤ x ≤ 10^{10}`; Layer 7.4 takes it as stated there;
- §3.1 and §3.7: the explicit subpower bound `τ(n) ≤ max(1, (ε log 2)^{−1})^B n^ε` and the asymptotic
  maximal order of `τ`: the predecessors of Layer 9.2;
- §3.9 and §3.12: the asymptotic coprime Möbius sums weighted by `log t/t` and by `1/t`,
  `Σ_{t ≤ T, (t, q) = 1} μ(t)/t = O_A((log T)^{−A})`: the qualitative forms of Layer 2.4, cited
  only;
- §3.35 and §3.35a: Rankin's bound `Ψ(x, y) ≤ x^σ ∏_{p ≤ y}(1 − p^{−σ})^{−1}` and the finite-prime
  smooth Dirichlet series: used in Layers 6.1 and 6.2.

### From TauCetiRoadmap.SieveMethodsAndPrimePatterns

- §0.5: the predicate *HasLogSieveDimension* `(P, g, κ, C)`: `Σ_{p ∈ P, p ≤ z} g(p) log p ≤ κ log z + C`
  for every real `z ≥ 2`. Layer 5.5 states its hypothesis in this shape with a two-sided bound;
- §1.1: the asymptotic Selberg denominator
  `Σ_{d < z} μ²(d) ∏_{p ∣ d} g(p)/(1 − g(p)) ∼ (log z)^κ / (Γ(κ + 1) H_g)` and the uniform lower bound `Σ_{d < z, (d, k) = 1} μ²(d)/φ(d) ≥ c (φ(k)/k) log z`:
  the statement shape that Layer 5.5 makes explicit; nothing is restated.

### From TauCetiRoadmap.ZerosOfLFunctions

- Layer 9, *AllOnCriticalLine*: the meaning of "the zeros of `ζ` up to height `T` lie on the
  critical line". It enters only through ExplicitPrimeCounting §1.1 and is not restated.

### From TauCetiRoadmap.ExplicitPrimeCounting

Each estimate below is used as a hypothesis of exactly the displayed shape; the section named proves
it (under that roadmap's own hypotheses), and the theorems here do not depend on how.

- §0.1: the diagonal sum `S(u) = Σ_{q ≤ u} μ²(q)/φ(q)` for real `u ≥ 1` (the sum
  `selbergDiagonal` of ExplicitCharacterSumsAndSieves §5.1 and `G₁` of Layer 7.2) and Büthe's
  explicit asymptotic `S(u) = log u + γ + Σ_p log p/(p(p − 1)) + O*(58/√u)` for every real
  `u ≥ 10^9`, against which the forms of Layer 7.2 are compared; no proof here uses it.
- §1.1: the proposition `RH(H)` (every zero of `riemannZeta` with `0 < Re s < 1` and `|Im s| ≤ H` has
  `Re s = 1/2`), the first clause of *ZetaResidueSumVerified* (Layer 0.7), and, at the height
  `3 000 175 332 800` of Platt and Trudgian's verification recorded in ExplicitZetaBounds §0.4, the
  hypothesis of Layer 1.9. The proposition is ExplicitZetaBounds §0.2's, which §1.1 cites; by its
  antitonicity `RH(3 000 175 332 800)` gives `RH(3·10¹²)`, the hypothesis of the supplier statements
  that 1.9 uses.
- §1.3, the proposition *ButheVerified*: `|ψ(x) − x| ≤ 0.94 √x` for every real `11 < x ≤ 10^{19}`.
  Used in Layers 1.8 and 1.10; it also gives the first clause of `gap:psi-initial-range` on
  `(11, 10^{10}]`.
- §1.6: the decimal enclosures *EulerGammaEnclosure* (`|γ − 0.5772156649| < 10^{−9}`) and
  *MeisselMertensEnclosure* (`|B − 0.2614972128| < 10^{−9}` for `B = mertensConstant ℚ`), stated
  there once for both roadmaps. Used wherever a proof here evaluates `γ` or `B` numerically
  (Layers 5.2, 7.4, 8.1).
- §1.7: the proposition *RealZeroGap* `c Q` with its named instances *LuZamanZhaoSweep* and
  *BanksGap* (zero-free inputs, below).
- §3.2: `ψ(x) < 1.03883 x` for every real `x > 0` (Rosser–Schoenfeld Theorem 12), used as
  `ψ(x) ≤ 1.04 x` for `x ≥ 0` in Layers 1.5 and 1.10; and `θ(x) > x(1 − 1/(2 log x))` for every real
  `x ≥ 563` (Rosser–Schoenfeld Theorem 4), used in Layer 9.4.
- §3.3: `|ψ(x) − x| ≤ 0.006409 x/log x` for every real `x > e^{22}` (Dusart), used as
  `|ψ(x) − x| ≤ 0.0065 x/log x` for `x > e^{22}` in Layers 1.4, 1.5 and 1.10.
- §3.5: `π(x) > x/log x` for every real `x ≥ 17` (Rosser–Schoenfeld Corollary 1), used in Layer
  9.3.
- §4.2: `|Σ_{n ≤ x} Λ(n)/n − log x + γ| ≤ 0.0067/log x` for every real `x ≥ 1 520 000` (Ramaré's
  corrected corollary; the range `x ≥ 23` printed at `ramare2013aa` line 251 is false at `x = 23`),
  used in Layers 1.5 and 1.8; and `|Σ_{n ≤ x} Λ(n)/n − log x + γ| ≤ 1/(4 log x)` for every real
  `x ≥ 115` (the same corollary), used in Layer 1.4.
- §4.3: `|Σ_{p ≤ x} 1/p − log log x − B| ≤ 1/log³ x` for every real `x ≥ 24 284`, with
  `B = mertensConstant ℚ` (Vanlalngaia's Corollary 1), used in Layers 8.1, 8.2 and 9.4; and Axler's
  `|Σ_{p ≤ x} 1/p − log log x − B| ≤ f(x) = (0.024334/(3 log³ x))(1 + 15/(4 log x))` for every real
  `x ≥ 1 757 126 630 797`, used in Layers 8.1 and 8.2.
- §4.7: under `RiemannHypothesis`, `|Σ_{p ≤ x} 1/p − log log x − B| ≤ 3 log x/(8π√x)` for every real
  `x ≥ 24.4`; that section leaves the two product forms of its source to this roadmap, and Layer
  8.1 proves them from it.
- §5.3: `p_k ≥ k(log k + log log k − 1)` for every natural `k ≥ 2` (Dusart's Theorem 3), used in
  Layers 9.1 and 9.3.
- §6.1, the row `(1, 0.000213, 10^{10})` of *RamareRumelyTable1*: `|ψ(x) − x| ≤ 0.000213 x` for every
  real `x ≥ 10^{10}`, used in Layers 1.2 and 1.5 (it also follows from §1.3 on `[10^{10}, 10^{19}]`,
  where `0.94/√x ≤ 9.4·10^{−6}`, and from §3.3 beyond `10^{19}`, where `0.006409/log x ≤ 1.5·10^{−4}`).
- §6.3: for every natural `q ≥ 3` and every `a` coprime to `q`, `|θ(x; q, a) − x/φ(q)| < c_θ(q) x/log x`
  for every real `x ≥ x_θ(q)`, with `c_θ(q) ≤ 1/840` for `3 ≤ q ≤ 10^4` and `x_θ(q) ≤ 8·10^9` for
  `3 ≤ q ≤ 10^5` (Bennett–Martin–O'Bryant–Rechnitzer), used in Layer 8.3.

What ExplicitPrimeCounting must provide (gap:psi-initial-range): `|ψ(x) − x| ≤ √x` for every real
`x` with `8 ≤ x ≤ 10^{10}`, and `|ψ(x) − x| ≤ 0.8 √x` for every real `x` with `1500 ≤ x ≤ 10^{10}`
(`ramare2013aa` lines 205–207, (4.1)–(4.2), a verification under the zeros of `ζ` verified to a
height). Needed by Layers 1.2, 1.5 and 1.10.

What ExplicitPrimeCounting must provide (gap:mertens-reciprocal-axler): with
`η_A(x) = 1/(20 log³ x) + 3/(16 log⁴ x)` and `B = mertensConstant ℚ`,
`Σ_{p ≤ x} 1/p − log log x − B ≥ −η_A(x)` for every real `x > 1` and
`Σ_{p ≤ x} 1/p − log log x − B ≤ η_A(x)` for every real `x ≥ 46 909 074` (Axler 2018,
Proposition 5.1, which refines Dusart's `1/(5 log³ x)` for `x > 2 278 382` and rests on a direct
computation up to `19 035 709 163`). Needed by Layer 8.1.

What ExplicitPrimeCounting must provide (gap:psi-relative-bklnw): `|ψ(x) − x| ≤ 8·10^{−5} x` for
every real `x ≥ 10^8`, `≤ 2.58843·10^{−5} x` for every real `x ≥ e^{21}` and `≤ 9·10^{−7} x/log x`
for every real `x ≥ 10^{19}` (the tables of Broadbent–Kadiri–Lumley–Ng–Wilk with Büthe's verified
range, as used by Ramaré–Zuniga Alterman, (12)–(16)); the row `|ψ(x) − x| ≤ 1.93378·10^{−8} x` for
`x ≥ e^{40}` is §3.1's *BKLNWPsiTable* at `b = 40`. Needed by Layers 1.8 and 1.10.

What ExplicitPrimeCounting must provide (gap:psi-tilde-difference): with
`r(x) = Σ_{n ≤ x} Λ(n)/n − log x + γ`, `|r(x) − (ψ(x) − x)/x| ≤ 0.05/√x + 1.75·10^{−12}` for every real `x ≥ 394 385`
(Vanlalngaia 2017, Theorem 9, second part; §4.2 states the weaker `1/(2√x) + 1.75·10^{−12}` from
`8950`). Needed by Layer 1.10. Its finite extension below `394 385` that Layer 1.10 also uses,
`≤ 0.052/√x` on `[144 913, 394 385]`, is not part of the contract: it is the proposition
*PsiTildeDifferenceRangeVerified* of Layer 0.7.

What ExplicitPrimeCounting must provide (gap:psi-log-power): `|ψ(x) − ⌊x⌋| < B_β x/log^β x` for every
real `x ≥ e^{20}` and `β = 1, 2, 3, 4`, with
`(B₁, B₂, B₃, B₄) = (8.96237·10^{−4}, 0.0188209, 0.395239, 75.1090)` (Johnston–Leong–Tudzi's Lemma A.5, from the tables of Broadbent et al. to
`e^{3000}` and Fiori–Kadiri–Swidinsky's de la Vallée Poussin bound beyond). Needed by Layer 1.4.

The finite extensions of these estimates that Ramaré 2013 computes below their ranges are not part
of the contract: they are fields of `RamareTransferComputations` (Layer 0.7).

### From TauCetiRoadmap.ExplicitCharacterSumsAndSieves

- §5.1: `selbergDiagonal`, `S(z) = Σ_{1 ≤ n ≤ z} μ²(n)/φ(n)` for real `z` (the sum `G₁` of Layer 7.2
  and the case `f = 1/φ` of Layer 6.5); its coprime comparison `S_k(z) ≥ (φ(k)/k) S(z)` for natural
  `k ≥ 1` and real `z ≥ 1`, which is the first inequality of Layer 6.5 at `f = 1/φ`. The carrier is
  the sum `G₁` of Layer 7.2; no proof here uses the comparison, which Layer 6.5 strengthens. Its
  explicit asymptotic with error `58/√z` is ExplicitPrimeCounting §0.1's (above), which §5.1 cites.

### From TauCetiRoadmap.ExplicitZetaBounds

Below, `H₀ = 3 000 175 332 800`.

- §0.4: Platt and Trudgian's verification `RH(H₀)`, recorded there as a hypothesis; it is the
  hypothesis of Layer 1.9, taken as the proposition `RH(H)` of ExplicitPrimeCounting §1.1 (above).
- §6.1: the smoothed truncated Perron formula, whose error term stays finite when `x` is an integer;
  an alternative to Tau Ceti's `TauCeti.norm_truncatedPerron_LSeries_sub_sum_le` in the route of
  Layer 1.9.
- §7.3, the classical zero-free region in its `5.558691` instance: given `RH(3·10¹²)`, `ζ(σ + it) ≠ 0`
  for every real `t` with `|t| ≥ 2` and every real `σ ≥ 1 − 1/(5.558691 log|t|)`, hence for every
  `R₀ ≥ 5.558691` in place of `5.558691`; at `R₀ = 5.56` it keeps the zeros out of the region that
  the contour of Layer 1.9 encloses above the height `H₀`.
- §7.10: the bounds for `1/ζ` that the route of Layer 1.9 uses, each given `RH(H₀)`: Lee and
  Leong's `1/|ζ(σ + it)| ≤ 1237 (log t)^{11/12}` for every real `t ≥ H₀` and every real
  `σ ≥ 1 − 1/(5.56 log t)`; their `1/|ζ(σ + it)| ≤ e^{146} log t` for every real `σ ≥ 3/4` and every
  real `t` with `14 ≤ t ≤ H₀ − 1/2`; and Leong's `1/|ζ(1 + it)| ≤ 29.388 log t` for every real
  `t ≥ 2`. The other items of §7.10 do not serve the route: none bounds `1/ζ` to the left of
  `σ = 1` between the heights `H₀ − 1/2` and `H₀` at a size the contour absorbs (1.9).
- §§4.8 and 4.10: the bounds for `|ζ(1 + it)|` and the Richert-type bounds for `|ζ(σ + it)|` on
  `1/2 ≤ σ ≤ 1`, used only in the route of the items (a) and (b) of Layer 1.9 (the
  Borel–Carathéodory step above the verified height).
- §4.1: the Kusmin–Landau inequality (`|Σ_{X<n≤X+Y} e(f(n))| ≤ cot(πθ/2)` for monotone `f'` with
  `θ ≤ f' − k ≤ 1 − θ`), used in the route of Bordellès–Daval's smoothed divisor remainder (Layer 7.4).

§7.10 meets the supplier gap `gap:zeta-reciprocal-bounds` of Layer 1.9: it states the bound
`1237 (log t)^{11/12}` above `H₀`, the bound `30.812 log t` on `σ ≥ 1` for `t ≥ 13`, and the bound
`e^{146} log t` on `σ ≥ 3/4`, the last for `14 ≤ t ≤ H₀ − 1/2`, the range its proof reaches (a zero
just above `H₀` is not excluded). The Littlewood and Korobov–Vinogradov companions of the first
serve only the members (10) and (11) of Lee and Leong's theorem, which belong to Part II (Scope).
The join of the contour of 1.9 needs two further bounds of Leong that §7.10 does not state; they
are targets of 1.9, items (a) and (b). The bound on `σ = 3/4` for `|t| ≤ 14` is the proposition
*ZetaReciprocalSegmentVerified* of Layer 0.7.

### Zero-free inputs: exceptional zeros and half-planes

Two results bear on the constants of this roadmap without changing any statement in it.

- The exclusion of Landau–Siegel zeros. Its qualitative form is AnalyticNumberTheoryPartI §0.34
  (`openai2026siegel` Theorem 1, an unrefereed preprint); its numerically explicit forms are
  ExplicitPrimeCounting §1.7's *RealZeroGap* `c Q`, with the instances *LuZamanZhaoSweep*
  (`c = 1/5`, `Q = 10^{10}`, the computation of `luZamanZhao2026`) and *BanksGap* (`c = 3.0·10^{−3}`,
  `Q = ∞`, `banks2026`, an unrefereed preprint). No theorem of this roadmap is proved from them.
  They bear on two inputs only: the exceptional-zero branch of ExplicitPrimeCounting §6.3 for
  moduli beyond `10^5`, which Layer 8.3 consumes only through that section, and any lower bound for
  `|L(1, χ)|` uniform in `q` that a consumer of Layer 4.1 supplies;
  no numerical lower bound for `L(1, χ)` derived from them is in print, so `|L(1, χ)|` is a parameter
  of 4.1.
- The zero-free half-plane `Re s > 7/8` for every Dirichlet `L`-function (`openai2026quasiRH`
  Theorem 1.1, an unrefereed preprint with no numerical constants): a qualitative supplier of
  power-saving remainders such as `M(x) = O_ε(x^{7/8 + ε})`; it changes no explicit statement here,
  and none of its consequences is planned.

## How to read the build

Layer 0 fixes the carriers, the elementary remainders, the Euler-product derivatives and the
propositions that record finite computations. Layers 1–3 treat the three summatory functions of `μ`
in turn: `M` from the identities and the prime estimates, `m` from `M` through Balazard's
identities, `m̌` likewise; Layer 4 twists by a character. Layer 5 is the convolution method: a
comparison theorem that transports an explicit asymptotic from a model `k` to any `g = h ⋆ k` with a
small `h`, with its models, and the explicit Levin–Fainleib theorem. Layer 6 gives upper bounds for
averages of nonnegative multiplicative functions that need no main term. Layer 7 applies Layers 5–6
to the classical functions. Layer 8 turns the explicit reciprocal-prime sums into explicit Euler
products. Layer 9 proves the pointwise maximal orders. Each layer ends with the targets that carry
the sharpest constants of later work (1.7–1.10, 2.6, 3.4, 5.6, 7.8–7.9, 9.4's large-`n` forms):
they reuse the identities and schemes of the earlier subsections with sharper inputs, and the
refereed statements they improve are kept beside them, so that a preprint is never the only source
of a statement. Within each layer the identities come first, then the parametric theorems, then the
numerical instances; an implementer who proves an instance by another route is not blocked behind a
parametric theorem, since each instance's *Needs:* line lists the identity and the hypotheses it
uses.

## Layer 0: carriers, elementary remainders and computational hypotheses

### 0.1 Summatory carriers of the Möbius function

Define `moebiusSum x = Σ_{n ≤ x} μ(n)` (written `M(x)`), `moebiusDivSum x = Σ_{n ≤ x} μ(n)/n`
(written `m(x)`) and `moebiusLogSum x = Σ_{n ≤ x} μ(n) log(x/n)/n` (written `m̌(x)`), each a
function `ℝ → ℝ`, the sums over `Finset.Icc 1 ⌊x⌋₊`, so that all three vanish for `x < 1`. Define
the weighted summatory function `M_k(f, x) = Σ_{n ≤ x} f(n) log^k n` for an arithmetic function `f`
and `k : ℕ` (Ramaré's notation), so that `M(x) = M₀(μ, x)`.

- `M` is a step function, constant on `[N, N + 1)` for natural `N ≥ 1`, with `M(N) − M(N − 1) = μ(N)`;
  `m(N) − m(N − 1) = μ(N)/N`.
- `m̌` is continuous on `[1, ∞)` and differentiable off the integers with derivative `m(x)/x`:
  `m̌(x) = ∫_1^x m(t) dt/t` for `x ≥ 1` (so `m̌(1) = 0`), and
  `m̌(x) = m(x) log x − Σ_{n ≤ x} μ(n) log n/n`.
- Abel summation between the three: for `x ≥ 1`, `m(x) = M(x)/x + ∫_1^x M(t) dt/t²`
  (`sum_mul_eq_sub_sub_integral_mul` with `f(t) = 1/t`), and
  `m̌(x) = ∫_1^x M(t) log(x/t) dt/t² + ∫_1^x M(t) dt/t²`.
- Agreement with Mathlib: `M(N) = Σ_{n ∈ Finset.Icc 1 N} μ n` for natural `N`, and `M(x) = M(⌊x⌋₊)`.
- Meissel's identity (Layer 1.1) in the form `Σ_{n ≤ x} μ(n) ⌊x/n⌋ = 1` for `x ≥ 1`.

### 0.2 Semigroup and coprime restrictions

For a set `S` of primes, say that `n` is `S`-factored when `n ≠ 0` and `∀ p ∈ n.primeFactors, p ∈ S`
(for finite `S` this is membership in `Nat.factoredNumbers`), and define `M_S(x)`,
`moebiusDivSumIn S x` (written `m_S(x)`) and `m̌_S(x)` as the sums of Layer 0.1 restricted to the
`S`-factored `n`. Define the coprime instances `M_q = M_{S_q}`, `m_q`, `m̌_q` with
`S_q = {p : ¬ p ∣ q}` for a natural `q ≥ 1`, and the excluded weight `w_S = ∏_{p ∉ S} (1 − 1/p)^{−1}`
when the set of primes outside `S` is finite (so `w_{S_q} = q/φ(q)`). In `moebiusDivSumIn` the set
`S` is any `Set ℕ`; its elements that are not prime play no role.

- `1` is `S`-factored for every `S`; `n` is `∅`-factored iff `n = 1`; for `S` the set of all primes,
  `n` is `S`-factored iff `n ≠ 0`.
- `M_S` and `m_S` are `M` and `m` when `S` is the set of all primes; `M_∅(x) = m_∅(x) = 1` for
  `x ≥ 1`, and all restricted sums vanish for `x < 1`.
- The modulus instance: `n` is `S_q`-factored iff `n ≠ 0` and `Nat.Coprime n q`, hence
  `M_q(x) = Σ_{n ≤ x, (n, q) = 1} μ(n)`, and `M_1 = M`.
- The convolution decomposition of the coprime restriction:
  `1_{(n, q) = 1} μ(n) = Σ_{ab = n} g_q(a) μ(b)`
  with `g_q` multiplicative, `g_q(p^k) = 1` for `p ∣ q` and `g_q(p^k) = 0` for `p ∤ q`, `k ≥ 1`;
  hence `m_q(x) = Σ_{a ≤ x, a ∣ q^∞} m(x/a)/a` and `Σ_{a ∣ q^∞} 1/a = q/φ(q)` (Ramaré 2015,
  `ramare2015mc` lines 224–230 and Lemma 1.9, lines 248–274); for general `S` excluding finitely
  many primes the same holds with `a` running over `⟨Sᶜ⟩` and `w_S` in place of `q/φ(q)`.
- `w_S` is multiplicative in the excluded set and equals `q/φ(q)` at `S_q`
  (`Nat.totient` and `prodPrimeFactors_one_sub`).

### 0.3 The harmonic remainder

Define the harmonic remainder `R₁(X) = Σ_{n ≤ X} 1/n − log X − γ` for real `X > 0`.
Prove that `|R₁(X)| ≤ γ/X` for every real `X > 0`, and `|R₁(X)| ≤ 6/(11 X)` for `X ≥ 1`
(`akhileshRamare2017` lines 319–338, Lemma 2.1), and the cube-root form
`Σ_{n ≤ t} 1/n = log t + γ + O*(0.9105 t^{−1/3})` for every real `t > 0` (`ramare1995` lines 356–366, Lemma 3.3, first part, pp.
657–658; the constant is chosen so that the bound also holds on `0 < t < 1`, where the sum is empty
and the least admissible constant is the maximum `3 e^{−1−γ/3} = 0.910471…` of
`(−log t − γ) t^{1/3}`, attained at `t = e^{−3−γ}`). At integers these refine
AnalyticNumberTheoryPartI §3.22a, which is consumed and not restated.

Route: `Real.eulerMascheroniSeq_lt_eulerMascheroniConstant` and
`Real.eulerMascheroniConstant_lt_eulerMascheroniSeq'` give `0 < H_N − log N − γ < log(1 + 1/N)` at
integers; for real `X` write `Σ_{n ≤ X} 1/n = H_{⌊X⌋}` and compare `log X` with `log ⌊X⌋`; the
constant `6/11` needs the finer Euler–Maclaurin remainder `H_N − log N − γ = 1/(2N) − 1/(12 N²) + …`
with the sign of the next term, which is proved by comparing `1/n` with `∫` of a convex function.
*Needs:* `harmonic_le_one_add_log`; `log_add_one_le_harmonic`; the two `eulerMascheroniSeq`
inequalities; `Real.log_le_sub_one_of_pos`; AnalyticNumberTheoryPartI §3.22a.

### 0.4 Sum of the integers up to a real bound

Prove that for every real `X ≥ 0` and every `c ∈ [1, 2]`, `Σ_{q ≤ X} q = X²/2 + O*(X^c/2)`
(`ramare2016mc` lines 540–562, Lemma 4.3). Route: for `Q ≤ X < Q + 1` with `N = Q(Q + 1)/2`, split at
`√(2N)` and use that `X ↦ X^c − X² + 2N` is monotone on each piece.
*Needs:* `Finset.sum_range_id_mul_two`; `Real.rpow` monotonicity.

### 0.5 Squarefree and Dirichlet-divisor remainders, the Stieltjes constant

Define the squarefree remainder `R(x) = Σ_{n ≤ x} μ²(n) − 6x/π²` for real `x > 0` (with
`Q(x) = Σ_{n ≤ x} μ²(n)` the squarefree count), and the unitary divisor sum
`σ*(n) = Σ_{d ∣ n, Nat.Coprime d (n/d)} d`. The
Dirichlet-divisor remainder `Δ(x) = Σ_{n ≤ x} τ(n) − x (log x + 2γ − 1)` is AnalyticNumberTheoryPartI
§3.23a's `divisorError`, used as it is defined there.
Define `stieltjesGammaOne = lim_{N → ∞} (Σ_{n ≤ N} (log n)/n − ½ log² N)` (written `γ₁`) and prove
the limit exists (Abel summation against `log t/t` and the convergence of
`∫ ({t} − 1/2) (1 − log t)/t²`).

- `R` is right-continuous and `R(x) = R(⌊x⌋) − 6(x − ⌊x⌋)/π²`, so `R(x)/√x` decreases on each
  `[N, N + 1)` and its extremes over the reals are at the integers and at the left limits
  `x → (N + 1)⁻`; likewise `Δ` decreases on each `[N, N + 1)` (derivative `−(log x + 2γ)`), and so
  does `Δ(x)/√x`, so `|Δ(x)| ≤ c √x` holds on `[N, N + 1)` exactly when it holds at `N` and in the
  limit `x → (N + 1)⁻`.
- `σ*` is multiplicative with `σ*(p^a) = p^a + 1` for `a ≥ 1`; `σ*(n) ≤ σ(n)` with equality iff `n`
  is squarefree; and `σ*(n)/n = ∏_{p^a ∥ n}(1 + p^{−a}) ≤ ∏_{p ∣ n}(1 + 1/p)`.
- `stieltjesGammaOne` is the limit of the partial sums: the sequence
  `Σ_{n ≤ N} (log n)/n − ½ log² N` converges, and `Σ_{n ≤ N} (log n)/n = ½ log² N + γ₁ + O*(log N/N)`
  for `N ≥ 3`.
- The constant term of `Σ_{n ≤ t} τ(n)/n` is `γ² − 2γ₁` (Layer 5.2), and the Laurent expansion
  `ζ(1 + s) = 1/s + γ − γ₁ s + O(s²)` holds with this `γ₁` (comparison with Mathlib's
  `riemannZeta` at real `s → 0⁺`).

### 0.6 Euler-product derivatives of a Dirichlet series at zero

For a multiplicative `h : ℕ → ℝ` (an `ArithmeticFunction ℝ` with `IsMultiplicative`) such that
`H̄(s) = Σ |h(n)| n^{−s}` converges at some real `s₀ < 0`, define the local factor
`ℓ_p(s) = Σ_{ν ≥ 0} h(p^ν) p^{−νs}` and prove:

- for every real `s ≥ s₀`: `H(s) = ∏_p ℓ_p(s)` (absolutely convergent; Mathlib's
  `eulerProduct_hasProd` after the real-power normalisation), with `ℓ_p(s) ≠ 0` whenever `H(s) ≠ 0`;
- for every real `s > s₀` with `H(s) ≠ 0`: `H'(s) = H(s) Σ_p ℓ_p'(s)/ℓ_p(s)` and
  `H''(s) = H(s) [ (Σ_p ℓ_p'(s)/ℓ_p(s))² + Σ_p ((ℓ_p''/ℓ_p) − (ℓ_p'/ℓ_p)²)(s) ]`,
  where `H'(s) = −Σ h(n) (log n) n^{−s}` and `H''(s) = Σ h(n) log² n · n^{−s}`, both absolutely
  convergent for `s > s₀` because `log^k n ≤ C_{k,ε} n^ε` (termwise differentiation); at `s = s₀`
  itself the two series can diverge, so the derivative formulas are not claimed there;
- the values at `s = 0`: `H(0) = Σ h(n)`, `H'(0) = −Σ h(n) log n`, `H''(0) = Σ h(n) log² n`, and
  `H̄(−1/3) = Σ |h(n)| n^{1/3}`, the quantities of Layer 5.1.

Route: `ramare1995` lines 367–379, p. 658 (how `h` is read off from a quotient of zeta factors and
why `H̄` converges at `−1/3` when `h` is supported on squarefree integers with `h(p) = O(1/p²)`), and the
termwise differentiation of absolutely convergent Dirichlet series. The comparison with Tau Ceti's
`TauCeti.IdealArithmeticFunction.localArithmeticFactor` is recorded: at `K = ℚ` and a prime ideal `(p)`, Tau Ceti's local factor is
the formal power series with coefficients `h(p^ν)`, and `ℓ_p(s)` is its evaluation at `p^{−s}`.
*Needs:* `EulerProduct.eulerProduct_hasProd`; `Real.summable_nat_rpow_inv`; termwise
derivative of a uniformly convergent series (`hasDerivAt_tsum`).

### 0.7 Computational hypotheses

Each item below is a proposition (a definition, not a theorem) with its range and constants as
data; it records a finite computation, table or numerical value that a source supplies, or the
bounded range that a source's proof needs below a supplier estimate or below its own analytic
argument. None is proved, discharged or recomputed here; each is a hypothesis of the theorems that
use it. The six that a headline theorem of `Suggested.lean` needs are declared there; the others
are named here. The decimal enclosures of `γ` and of the Meissel–Mertens constant are
ExplicitPrimeCounting §1.6's *EulerGammaEnclosure* and *MeisselMertensEnclosure*, and the real-zero
gap with its instances is its §1.7. A range `[a, b]` is closed; `(a, b]` and `[a, b)` drop the
stated end. Each proposition is antitone in its range and monotone in its constant, and these
implications are the only theorems about the propositions; so `MoebiusTableVerified 0.571 10^{16}`
implies the instances with `H = 10^{12}` and `H = 10^{14}`.

- `MoebiusTableVerified c H`: `|M(x)| ≤ c √x` for every real `x ∈ [33, H]`; instance
  `(0.571, 10^{16})` (`hurst2018` lines 420–426; `chirreHelfgott2025` Lemma 6.7), and
  the older `(0.571, 10^{12})` (`dress1993` Théorème 1, quoted at `ramare2013aa` line 261) and
  `(0.571, 10^{14})` (`kotnikVanDeLune2004`).
- *MoebiusRangeVerified* `ε a b`: `|M(x)| ≤ ε(x)` for every real `x ∈ [a, b]`; instances
  `(x ↦ x/80, 1119, 2087)` and `(x ↦ (x + 1)/80 + 11/2, 0, 1119)` (1.2; `macleod1967` lines 33–37),
  `(x ↦ x/1036, 120 727, 10^8)` (1.2; `costaPereira1989` lines 797–803),
  `(x ↦ x/2360, 617 973, 1 815 918)` (1.3; `dressElMarraki1993`),
  `(x ↦ x/4345, 2 160 535, 6 155 337)` (1.3; `cohenDressElMarraki2007`),
  `(x ↦ 0.002969 x/√(log x), 142 194, 2 160 535)` and the initial ranges of El Marraki's other rows
  (1.4; `elMarraki1995` §4), `(x ↦ 2.16537 x/log² x, (1, 32])` (1.4; `johnstonLeongTudzi2024`
  Theorem A.1), `(D ↦ (0.0130/log D − 0.118/log² D) D, 1 078 853, 2 161 205)` (1.5; `ramare2013aa`
  line 725), `(D ↦ 0.0130 D/log D, 97 067, 1 078 853)`, `(D ↦ 0.0950 D/log D, 688, 97 067)` and
  `(D ↦ 0.644 D/log D, (1, 688])` (1.6, 3.2; `ramare2015mc` (16.2)–(16.4), lines 1455–1471),
  `(x ↦ 0.5 √x, 201, 7 725 038 628)` (2.3; `daval2025`) and
  `(X ↦ (0.006688 log X − 0.039) X/log² X, [1 798 118, 1.5·10^7))` (1.10;
  `ramareZunigaAlterman2025`).
- *MoebiusDivRangeVerified* `ε a b`: `|m(x)| ≤ ε(x)` for every real `x ∈ [a, b]`; instances
  `(D ↦ 0.0260/log D − 0.118/log² D, 60 298, 1 078 853)` (2.3; `ramare2013aa` line 759),
  `(x ↦ 0.0144/log x − 0.1/log² x, 463 421, 3·10^7)` and the rows of Theorem 1.2 and Corollary 1.3
  on `[x₀, 463 421]` (2.3; `ramare2015mc` lines 120–152 and 554), the initial ranges of Bordellès'
  rows (2.3; `bordelles2015` Theorem 1), `(x ↦ 0.569449/√x, 3, 10^{14})` (1.7; `chirreHelfgott2025`
  Lemma 6.7), `(x ↦ 0.5/√x, 3, 7 727 068 587)`, `(x ↦ 1/4343, [2 160 605, 5·10^6))` and
  `(x ↦ 0.0130073/log x, [97 063, 230 000))` (2.3; `daval2025`), `(x ↦ 0.8/log² x, (1, 33])` and
  `(x ↦ 3.01/log² x, 33, 10^{16})` (2.3; `johnstonLeongTudzi2024` Theorem A.2) and
  `(X ↦ (0.010032 log X − 0.0568)/log² X, [617 990, 1.5·10^7))` (2.6; `ramareZunigaAlterman2025`).
- *MoebiusLogRangeVerified* `ε a b`: `|m̌(x) − 1| ≤ ε(x)` for every real `x ∈ [a, b]`; instances
  `(x ↦ 0.0192/√x, 340 000, 1.2·10^7)`, `(x ↦ 0.0218/√x, 11, 1.2·10^7)` and
  `(x ↦ 1/√x, 1, 1.2·10^7)` (`ramare2015mc` Lemma 10.2, lines 1157–1164),
  `(x ↦ 0.00140/log x, 9550, 24 832)` (3.2; `ramare2015corr` lines 237–239, there to `18 100`) and
  the initial ranges of the other rows of 3.2 (3.2, 3.3).
- *MoebiusStarRangeVerified* `ε a b`: `Σ_{1 ≤ w ≤ √y} |M(y/w²)| ≤ ε(y)` for every real `y ∈ [a, b]`
  (natural `w`); instances `(y ↦ c y/log y, a, 8·10^7)` for
  `(c, a) = (0.0918, 48 513), (0.199, 4536), (0.429, 490)`, `(y ↦ 0.997 y/log y, (1, 8·10^7])` and
  `(y ↦ c y/(1 + log y), a, 8·10^7)` for
  `(c, a) = (0.0975, 48 645), (0.198, 7100), (0.498, 490), (1.566, 1)` (1.6; `ramare2015mc` Lemmas
  16.4 and 16.6, lines 1504–1554, which print `1` for `1.566`).
- *MoebiusDivStarRangeVerified* `ε a b`: `Σ_{1 ≤ w ≤ √y} |m(y/w²)|/w² ≤ ε(y)` for every real
  `y ∈ [a, b]`; instances `(y ↦ c/log y, a, 3.3·10^7)` for `(c, a) = (0.132, 11 808), (0.320, 687)`,
  `(y ↦ 0.784/log y, (1, 3.3·10^7])` and `(y ↦ c/(1 + log y), a, 3.3·10^7)` for
  `(c, a) = (0.143, 11 811), (0.320, 882), (0.5, 296), (1.694, 1)` (2.4; `ramare2015mc` Lemmas 7.4
  and 8.3, lines 1023–1025 and 1086–1089, which print `0.779` for `0.784`).
- *MoebiusSquareTailRangeVerified* `ε a b`: `|Σ_{d > y} μ(d)/d²| ≤ ε(y)` for every real
  `y ∈ [a, b]`; instances `(y ↦ (0.0195 log y − 0.11)/(y log² y), 142 130, 463 421)` and
  `(y ↦ 1/(50 y log y), 59 600, 96 955)` (7.2; below the analytic ranges of `ramare2019bcp` Theorem
  8.1).
- *MoebiusAbsIntegralLE* `D₀ I`: `∫_1^{D₀} |M(t)| dt ≤ I`; instances `(1 078 853, 113 556 832)` and
  `(464 402, 30 016 365)` (`ramare2015mc` Lemmas 2.2–2.3, lines 461–478, the sums of the positive
  and negative parts), `(1 798 118, 216 378 740)` (`ramareZunigaAlterman2025` (39)) and `(33, 59)`
  (`johnstonLeongTudzi2024`).
- *MoebiusLogIntegralLE* `D₀ I`: `∫_1^{D₀} |M(t)| dt/t ≤ I`; instance `(1 078 853, 302)`
  (`ramare2013aa` line 754).
- *LambdaDeviationRangeVerified*: `Σ_{n ≤ x} |Λ(n) − 1|/n < 2 log x − 2 log log x` for every real
  `x ∈ (1, 286)` (1.4; `schoenfeld1969` line 113 for `(1, 32)`).
- `RamareTransferComputations`, with `R₂*` the `selbergRemainder` of 1.5, the conjunction of: (i)
  `|R₂*(D)| ≤ 1.80 √D log D` on `[3, 1.1·10^8]` and `≤ 1.93 √D log D` on `[1.1·10^8, 1.8·10^9]`
  (`ramare2013aa` Lemma 6.3, lines 553–557); (ii) `|R₂*(D)| ≤ 0.0213 D` on
  `[1.8·10^9, 2.3104·10^{12}]` (the range the source's Lemma 6.1 covers with the uncorrected `ψ̃`
  range, 1.5); (iii) `|∫_1^{10^8} (ψ(t) − t) dt/t + 147.768| ≤ 0.01` (Lemma 6.4, lines 563–565,
  which prints `−129.559`); (iv) `Σ_{k ≤ K} |Λ⋆Λ − Λ log + 2γ|(k)/k + |R₂*(K)|/K ≤ 0.03739 · 4345`
  at `K = 462 848` (Lemma 7.1, lines 633–637); (v) `|M(D₀) − M₂(μ, D₀)/log² D₀| ≤ 3.49` at
  `D₀ = 2 161 205` (lines 710–724, which print `3.48`); (vi)
  `|Σ_{d ≤ D} μ(d) log² d| ≤ (0.0130 log D − 0.144) D` on `[2 161 205, 8 613 000]` (lines 677–678);
  (vii) `|ψ(x) − x| ≤ 0.0065 x/log x` on `[1 514 928, 3 430 190]` (Lemma 4.2, lines 208–214).
- *RamareZunigaAltermanComputations*, the conjunction of: (i) `|ψ(x) − x| ≤ 0.71 √x` on
  `[24 200, 3·10^7]`; (ii) `|Σ_{1000 < n ≤ 40 000} Λ(n)(ψ(x/n) − x/n)| ≤ 0.000154 x` on
  `[1.8·10^9, 2·10^{10}]`; (iii) `Σ_{n ≤ 1000} Λ(n)/√n ≤ 60.51` and `ψ(40 000) = 40 012.8937…`; (iv)
  `|R₂*(x)| ≤ 1.93 √x log x` on `[3, 2.1·10^{10}]`; (v)
  `Σ_{k ≤ K} |Λ⋆Λ − Λ log + 2γ|(k)/k + |R₂*(K)|/K ≤ 4345 c_K` with
  `c_K = 0.0374, 0.0422, 0.0579, 0.0762` at `K = 462 848, 10^6, 10^7, 10^8`; (vi)
  `|M(X₀) − M₂(μ, X₀)/log² X₀| ≤ 7.01` at `X₀ = 4·10^7` (1.10; `ramareZunigaAlterman2025`).
- *PsiTildeDifferenceRangeVerified* `c a b`: with `r(y) = ψ̃(y) − log y + γ` and `R(y) = ψ(y) − y`,
  `|r(y) − R(y)/y| ≤ c/√y` for every real `y ∈ [a, b]`, `0 < a`; instance
  `(0.052, 144 913, 394 385)` (1.10; implied by `vanlalngaia2017` Theorem 9, second part, lines
  193–195, in its printed form `0.047/√y + 1.884/y + 1.75·10^{−12}` for `y ≥ 2`).
- *DavalLinearComputations*: `0 < m₁(10^8) < 1.195·10^{−6}`, `Σ_{j ≤ 10^8} μ²(j)/√j ≤ 12 158.55` and
  `Σ_{n ≤ 32} |M(n)| log(1 + 1/n) < 5` (1.8; `daval2023`).
- *SquarefreeRangeVerified* `ε a b`: `|R(x)| ≤ ε(x)` for every real `x ∈ [a, b]`, and
  *SquarefreeRangeVerifiedNat* `ε a b`: `|R(n)| ≤ ε(n)` for every natural `n ∈ [a, b]`; instances
  `(x ↦ 1.12543 x^{1/4}, (0, 10^{18}])` (`mossinghoffOliveiraESilvaTrudgian2021` Theorem 2),
  `(x ↦ 0.02767 √x, 441 353, 2 736 764)` and the initial ranges of the other rows of 7.1, in the
  integer form for the rows that hold only at integers (7.1; `moserMacLeod1966`, `ramare2013aa`
  Lemma 4.6, `cipu2015` Lemma 4.2), and `(x ↦ 1.06 √(x/log x), 1.0001, 1664)` (7.2; `ramare2019bcp`
  Corollary 3.4).
- *CohenDressLocalBounds*: `|R(x + y) − R(x)| ≤ 1.6749 √y + 0.6212 x/y` and
  `|R(x + y) − R(x)| ≤ 0.7343 y x^{−1/3} + 1.4327 x^{1/3}` for all reals `x, y ≥ 1` (announced in
  `cohenDress1988` without complete proofs; no theorem here uses it).
- *SquarefreeReciprocalRangeVerified* `c₁ c₂ a b`:
  `(6/π²) log N + c₁ ≤ Σ_{n ≤ N} μ²(n)/n ≤ (6/π²) log N + c₂` for every real `N ∈ [a, b]`; instances
  `(0.578, 1.166, 1, 14 831)` and `(1.040, 1.048, 1000, 4.58·10^8)` (7.1; `ramare2016mc` lines
  462–466).
- *SquarefreeIntegralRangeVerified*, the conjunction of: (a)
  `|Σ_{d ≤ D} μ²(d)/d − (6/π²)(log D + C₂)| ≤ 7/(20 √(D log D))` for every real
  `D ∈ [1665, 10^{11}]`, and `≤ 0.073/√D` for `D ∈ [3475, 10^{11}]` (`ramare2019bcp` Lemma 9.2,
  lines 905–921 and 969–972); (b) `|Σ_{d ≤ D} μ²(d)/φ(d) − log D − c₀| ≤ 2.2 D^{−3/4}` for every
  real `D ∈ [1, 2·10^9]` (Lemma 9.3, lines 981–985); (c)
  `∫_0^{1665} (Σ_{d ≤ t} μ²(d)/d − (6/π²)(log t + C₂)) dt ∈ [−0.7249, −0.7248]` (line 1227); with
  `C₂`, `c₀` as in 7.2.
- *SquarefreeGapVerified* `X g`: every run of consecutive non-squarefree integers below `X` has
  length at most `g`; instance `(10^{18}, 18)` (7.8; `mossinghoffOliveiraESilvaTrudgian2021`, as
  used by `kumchevEtAl2023`).
- *DivisorRangeVerified* `c a b`: `|Δ(x)| ≤ c √x` for every real `x ∈ [a, b]`, and
  *DivisorRangeVerifiedNat* `c a b`: `|Δ(n)| ≤ c √n` for every natural `n ∈ [a, b]` (`Δ` the
  `divisorError` of AnalyticNumberTheoryPartI §3.23a); instances: the ranges of the rows of 7.4 that
  §3.23a's `BBRFiniteInput` does not contain (`berkaneBordellesRamare2012` Theorem 1.1), and
  `(0.173, 6·10^5, 5·10^{12})` in the integer form and `(0.173, 1 081 080, 5·10^{12})` in the real
  form (7.9; `tudzi2025`).
- *DivisorCubicRangeVerified* `a b`: `|Δ(x)| ≤ 0.764 x^{1/3} log x` for every real `x ∈ [a, b]`;
  instance `(5, 9995)` (7.4; `simonicStarichkova2023` §3, footnote 6).
- *DivisorPowerRangeVerified* `X Y`: `|Σ_{n ≤ x} τ(n)/n − P(x)| ≤ 1.001 x^{−1/2}` for every real
  `x ∈ [2, Y)`, with `P` of 5.2, and the `τ₄` and `τ²` asymptotics of 7.5 with their error terms
  `4.48 x^{3/4} log x` and `9.73 x^{3/4} log x + 0.73 √x` for every real `x ∈ [2, X)`; instance
  `(7560², 6·10^5)` (5.2, 7.5; `cullyHugillTrudgian2021` lines 197–199 and 240–242, there with
  `X = 5560²`).
- *PiltzRangeVerified* `k`: `Σ_{m ≤ x} τ_k(m) ≤ 2x (log x)^{k−1}` for every real `x ∈ [6, x_k)`,
  with `x_k = exp((k − 1)(γ + 1/6)/log 2)` (7.5; `bordelles2002` Theorem 4.2).
- *PiltzRemainderRangeVerified* `3 2 (1.1·10^{10})`: `|Δ₃(x)| < 2.968 x^{2/3} (log x)^{1/3}` for
  every real `x ∈ [2, 1.1·10^{10})` (7.9; `tudzi2025` Theorem 1.1).
- *BordellesPiltzRangeVerified*: `Σ_{m ≤ x} τ₃(m) ≤ (x/2)(log x + 1)²` for every real
  `x ∈ [13, 670]`, and the values of `∫_1^{13} S_k(t) t^{−2} dt` that the induction of 7.5 uses
  (`bordelles2006` Theorem 2.1).
- *TotientRangeVerified*: `Σ_{n ≤ N} φ(n)/n ≤ (6/π²) N + log N + 1` for every natural `N ∈ [1, 40]`
  (7.7; `trevino2015ijnt` lines 229–236, there with `N − 1` in place of `N` on the right for
  `2 ≤ N ≤ 41`).
- `StieltjesGammaOneEnclosure`: `|γ₁ + 0.0728158454836767248605863758749013191377| ≤ 10^{−40}`, with
  `γ₁ = stieltjesGammaOne` (`berkaneBordellesRamare2012` line 189, (2.2), citing `kreminski2003`).
- *ArithmeticalConstantsEnclosure*: `c₀ = γ + Σ_p log p/(p(p − 1)) = 1.332 582 275 733… ± 10^{−12}`
  and `C₂ = γ + 2 Σ_p log p/(p² − 1) = 1.717 137 651 090 62… ± 10^{−14}` (`ramare2019bcp` lines
  102–106 and 124–128), `∏_{p > 2} (p − 1)²/(p(p − 2)) = 1.514 780 128 137… ± 10^{−12}`,
  `H̄(−1/3) ≤ 251.07` and `H̄(−2/5) < 950.05` for the perturbation `h` of 7.3 (`plattTrudgian2018`
  Lemma 4 for the last).
- *ProgressionMertensConstantEnclosure* `q a c d`: `|exp(−B(q, a) − K(q, a)) − c| ≤ 10^{−d}`, with
  `B(q, a)`, `K(q, a)` of 8.3; instances: every `3 ≤ q ≤ 100` and `a` coprime to `q`, with `d = 100`
  (`languascoZaccagnini2009` Tables 1–3).
- *ZetaResidueSumVerified* `T S Z`: (a) `RH(T)` in the form of ExplicitPrimeCounting §1.1, and every
  zero `ρ` of `ζ` with `0 < Re ρ < 1` and `|Im ρ| ≤ T` is simple; (b)
  `(π/(2T)) Σ_{0 < Im ρ < T} |coth(πρ/(2T))|/|ζ'(ρ)| ≤ S`; (c) `1/|ζ(σ ± iT)| ≤ Z` for every real
  `σ ≤ 1`; instances `(10^{10} + 1, 5.675257, 0.536166)`, `(10^9, 4.879368, 0.669257)` and
  `(10^7 + 1, 3.369047, 0.551088)` (1.7, 7.8; `chirreHelfgott2025` Lemmas 6.5–6.6).
- *ZetaReciprocalSegmentVerified* `σ T Z`: `Z |ζ(σ + it)| ≥ 1` for every real `t` with `|t| ≤ T`
  (so a zero on the segment falsifies it); instance `(3/4, 14, 16)` (1.9; Simonič's bound as quoted
  in `leeLeong2022` (43)).
- `PrimorialTableVerified K`: `k log θ(p_k) ≤ 1.3841 θ(p_k)` for every natural `k ∈ [3, K]`;
  instance `K = 26` (9.1; `robin1983aa` lines 462–464 for `k ≤ 12`).
- `SuperiorTableVerified k ε₁ ε₂ λ`: `log τ_k(N) · log log N ≤ λ · log k · log N` for every
  `ε ∈ [ε₁, ε₂]` and every `N` with `superiorHighlyComposite k ε N` (9.2); instances
  `(k, ε₁, ε₂, λ) = (2, 0.1950, 0.3466, 1.538)`, `(3, 0.3267, 0.5493, 1.5915)`,
  `(4, 0.4142, 0.6931, 1.6338)`, `(5, 0.4861, 0.8047, 1.6715)`
  and those of Tables 16–18 for `k ≤ 100` (`teo2026` Tables 16–18, the four rows at lines 1920–1925,
  with `λ` rounded up).
- *SuperchampionTableVerified* `K₁ K₂`: every `(σ, τ)`-superchampion `N` (some `ε > 0` gives
  `σ(n)/(n τ(n)^ε) ≤ σ(N)/(N τ(N)^ε)` for every `n ≥ 1`) satisfies `σ(N)/N ≤ 2.59791 log log(3τ(N))`
  if `ω(N) < K₁`, and `σ(N)/N ≤ e^γ log log(eτ(N)) + e^γ log log log(e^e τ(N)) + 0.9415` if
  `ω(N) < K₂`; instance `(15 985, 166 000)` (9.3; `nicolas2008` lines 232–236 and 437–443).
- `PrimorialTotientTableVerified P`: `N_k/φ(N_k) < e^γ log log N_k + 2.50637/log log N_k` for every
  natural `k ≥ 3` with `p_k < P`; instance `P = 24 284` (9.4; `rosserSchoenfeld1962` pp. 71–72).
- *RobinInequalityVerified* `X`: `σ(n) < e^γ n log log n` for every natural `n` with `5040 < n ≤ X`;
  instance `X = M(0) = ∏_{p ≤ p_k} p` with `k = 999 999 476 056` (9.3; Morrill–Platt, as quoted at
  `axlerNicolas2023` (1.16)–(1.17)).
- *MertensProductInitialRangeVerified*: the four inequalities of 8.1 for every real
  `x ∈ (1, 24 284)` (8.1; `rosserSchoenfeld1962` p. 70).
- *MertensProductCubicRangeVerified*: `e^γ log x ∏_{p ≤ x}(1 − 1/p) < 1 + 0.07/log³ x` for every
  real `x ∈ (1, 392 687)`, and `e^γ log x ∏_{p ≤ x}(1 − 1/p) > 1 − 1/(20 log³ x) − 3/(16 log⁴ x)`
  for every real `x ∈ [46 909 038, 46 909 074)` (8.1; within the computations closing `axler2018`
  Proposition 6.1).
- *ProgressionProductTableVerified* `q a C X₀ X₁`:
  `∏_{p ≤ x, p ≡ a (mod q)} (1 − 1/p)^{−1} ≤ C (log x)^{1/φ(q)}` for every real `x ∈ [X₀, X₁]` (8.3;
  `bordelles2005` Theorem 1).
- *PolyaVinogradovBound* `χ P`: `|Σ_{n ≤ N} χ(n)| ≤ P` for every natural `N`, for a Dirichlet
  character `χ` and a real `P` (4.1; supplied by an explicit Pólya–Vinogradov inequality).

### Examples

- `h = μ/n²` as the model perturbation of Layer 0.6: `H(0) = 6/π²`, `H'(0) = (6/π²) Σ_p log p/(p² − 1)`.

### Dependencies

Mathlib `ArithmeticFunction`, `Chebyshev`, `AbelSummation`, `Harmonic`, `EulerProduct`; Tau Ceti
`AbelSummation`; AnalyticNumberTheoryPartI §3.22a (the harmonic remainder at integers) and §3.23a
(`divisorError` and `BBRFiniteInput`, cited in 0.7); ExplicitPrimeCounting §§1.1, 1.6 and 1.7 (the
propositions 0.7 cites rather than restates).

## Layer 1: the Mertens function `M(x)`

### 1.1 Meissel's, MacLeod's and Balazard's identities

Prove Meissel's identity `Σ_{n ≤ x} μ(n) ⌊x/n⌋ = 1` for every real `x ≥ 1` (`balazard2012` lines
81–84, (1)): sum `Σ_{d ∣ n} μ(d) = [n = 1]` (`moebius_mul_coe_zeta`) over `n ≤ x`. Prove Gram's
consequence: `x m(x) = 1 + Σ_{n ≤ x} μ(n) {x/n}` for natural `x`, hence `−1 + 2/x ≤ m(x) ≤ 1` and
`|m(x)| ≤ 1` for `x ≥ 1` (lines 92–109, (2); the general-`S` form is Layer 2.1).

Define the Bernoulli functions `b_k(x) = Σ_{j ≤ k} B_j C(k, j) x^{k−j}` (Mathlib's
`Polynomial.bernoulli` evaluated at a real), their periodic versions `b̃_k(x) = b_k({x})` and
MacLeod's functions `φ_k(x) = (b_k(x) − b̃_k(x))/x^{k−1}` for `k ≥ 1`, `x > 0` (`balazard2012`
lines 146–149, (4)), so that `φ₁(x) = ⌊x⌋` and `φ₂(x) = x − 1 − ({x}² − {x})/x`.

- `b_k(X + 1) − b_k(X) = k X^{k−1}` for every real `X` and `k ≥ 1`, and `b_k(0) = B_k`.
- `b̃_k` has period `1`; `b̃_1(x) = {x} − 1/2`; for `k ≥ 2`, `b̃_k` is continuous (since
  `b_k(1) = b_k(0)`).
- `φ_k(x)` is a polynomial in `x` of degree `k − 1` with coefficients in `{x}` on each `[N, N + 1)`,
  and `φ_k(x) = 0` for `0 < x < 1`.

Prove MacLeod's identity: for every natural `k ≥ 1` and real `x ≥ 1`,
`Σ_{n ≤ x} μ(n) φ_k(x/n) = k (1 − 1/x)^{k−1}` (lines 180–200, Proposition 1), by Möbius
inversion of the telescoping `Σ_{n ≤ x} k(1 − n/x)^{k−1} = x^{1−k}(b_k(x) − b_k({x}))` from
`b_k(X + 1) − b_k(X) = k X^{k−1}`.

Define Balazard's function
`ε₁(t) = 1/3 − 1/(3t) + (4/3)({t}³ − (3/2){t}² + (1/2){t})/t² − (1/3)({t}⁴ − 2{t}³ + {t}²)/t³` for
`t > 0`, that is `ε₁(t) = 1/3 − 1/(3t) + (4/3) b₃({t})/t² − (1/3)(b₄({t}) − B₄)/t³` (`balazard2012`
line 426; `ramare2015mc` line 457, (2.3), prints `t⁴` in the last denominator), and prove Balazard's
Proposition 6: at every non-integer `t > 0`, `ε₁'(t) = (((2{t} − 1)t + {t} − {t}²)/t²)²`
(`balazard2012` lines 428–440), with `0 ≤ ε₁'(t) ≤ 1/t²` (line 458 of `ramare2015mc`; the upper
bound is Balazard's Proposition 2, lines 321–328: `|(2{t} − 1)t + {t} − {t}²| ≤ t`).

Prove Balazard's identity for `m`: for every real `x ≥ 1`,

    m(x) = M(x)/x + 4(1 − 1/x)²/x − 4(1 − 1/x)³/(3x) + (1/x) ∫_1^x M(x/t) ε₁'(t) dt

(`ramare2015mc` line 450, (2.1); `balazard2012` lines 454–470, from `(4/3)φ₃ − (1/3)φ₄ = x − 1 − ε₁`
and Proposition 1 at `k = 3, 4`), and the `k = 2` identity

    x m(x) − M(x) = 2 − 2/x + ∫_1^x M(x/t) ((2{t} − 1)t + {t} − {t}²) dt/t²

(`balazard2012` lines 318–320, (11), where `m₁(x) = m(x) − M(x)/x = ∫_1^x M(t) dt/t²`, lines 303–314).

Prove El Marraki's identities (`ramare2013aa` lines 736–746): for `D ≥ 1`,
`m(D) = M(D)/D + ∫_1^D M(t) dt/t²` (Abel summation) and `∫_1^D ⌊D/t⌋ M(t) dt/t = log D`
(from Meissel's identity integrated: `Σ_{n ≤ D} μ(n) ∫_n^D ⌊D/t⌋ dt/t` telescopes), hence

    m(D) = M(D)/D + (1/D) ∫_1^D (D/t − ⌊D/t⌋) M(t) dt/t + (log D)/D.

Prove Ramaré's weight passage (`ramare2013aa` lines 696–704, Lemma 8.1): for an arithmetic
function `f`, naturals `k ≥ 0`, and reals `D ≥ D₀ ≥ 1`, with `M_k(f, D) = Σ_{n ≤ D} f(n) log^k n`,

    M₀(f, D) = M_k(f, D)/log^k D + M₀(f, D₀) − M_k(f, D₀)/log^k D₀ + k ∫_{D₀}^D M_k(f, t) dt/(t log^{k+1} t),

by Abel summation against `1/log^k t` on `(D₀, D]`, whose derivative `−k/(t log^{k+1} t)` makes the
integral enter with the sign `+` (the source prints `− k ∫`); for `k = 0` both sides are
`M₀(f, D)` (the integral has the factor `k = 0`), and `D₀ > 1` is needed for `k ≥ 1` so that
`log D₀ ≠ 0`. The scheme of 1.5 uses the identity in absolute value, so the sign does not affect
it.

*Needs:* `ArithmeticFunction.moebius_mul_coe_zeta`; `Nat.floor` lemmas; `Polynomial.bernoulli`;
`sum_mul_eq_sub_sub_integral_mul`; Layer 0.1.

### 1.2 Elementary linear bounds

Prove MacLeod's bounds: `|M(x)| ≤ x/80` for every real `x ≥ 1119`, and `|M(x)| ≤ (x + 1)/80 + 11/2`
for every real `x ≥ 0` (`macleod1967` lines 24–29, (4)–(5), with the corrected (5) of
`macleod1969errata` lines 14–17; the bound is attained with equality at an integer below `1119`, so
the inequality is stated with `≤`). Route: MacLeod's analytic argument (`macleod1967` §§2–3: the
von Sterneck-type identity `Σ_{d ≤ x} μ(d) f(x/d) = 1` for floor combinations `f`, with the
elementary count `Q(x) ≤ ⌊x⌋ − ⌊x/4⌋ − ⌊x/9⌋ + ⌊x/36⌋` of squarefree integers), which gives
`x/80` beyond the initial range the source verifies
from Neubauer's table (lines 33–37); here the initial range is covered by
*MoebiusRangeVerified* `(x ↦ x/80) 1119 2087` together with `MoebiusTableVerified 0.571 10^{12}`,
since `0.571 √x ≤ x/80` exactly for `x ≥ (80·0.571)² = 2086.6…`. The all-`x` form is `x/80` beyond
`1119` and *MoebiusRangeVerified* `(x ↦ (x + 1)/80 + 11/2) 0 1119` below.

Prove Costa Pereira's bound `|M(x)| ≤ x/1036` for every real `x ≥ 120 727` (`costaPereira1989` lines
793–803, Theorem 5 with Corollary 2 and Table III; on `[120 727, 10^8]` the bound is
*MoebiusRangeVerified* `(x ↦ x/1036) 120 727 10^8`). Route: Costa Pereira's elementary method, whose
only analytic inputs are explicit Chebyshev-type bounds `|ψ(x) − x| ≤ ε x` for `x ≥ x₀` of the shape
of ExplicitPrimeCounting §6.1 and `gap:psi-initial-range`.

*Needs:* 1.1; *MoebiusRangeVerified*; `MoebiusTableVerified`; ExplicitPrimeCounting §6.1;
`gap:psi-initial-range`.

### 1.3 Linear bounds from a Möbius table

Prove Dress–El Marraki's `|M(x)| ≤ x/2360` for every real `x ≥ 617 973` (`dressElMarraki1993`,
uncertified; quoted at `ramare2013aa` line 263, (4.6)) and Cohen–Dress–El Marraki's Theorem 5 bis,
`|M(x)| ≤ x/4345` for every real `x ≥ 2 160 535` (`cohenDressElMarraki2007`, uncertified; quoted at
`ramare2013aa` line 265, (4.7); `elMarraki1995` lines 231–244 takes it as the input (1.1) of its
Théorème 1). Route: beyond `10^{12}` the elementary von Sterneck–MacLeod method of those papers
(cited by locator); below, the hypotheses `MoebiusTableVerified 0.571 10^{12}`, which gives `x/L`
once `x ≥ (0.571 L)²`, *MoebiusRangeVerified* `(x ↦ x/2360) 617 973 1 815 918` and
*MoebiusRangeVerified* `(x ↦ x/4345) 2 160 535 6 155 337` (Layer 0.7). Nothing from Layers 1.4 or
1.5 enters: both consume the `x/4345` bound. Second route, with no elementary method:
`MoebiusTableVerified 0.571 10^{16}`, the same two range propositions and, beyond `10^{16}`, the
corollary on `x/L` of 1.7, which needs zero data.

Prove the tail statement: if `|M(x)| ≤ A x/log x` for every real `x ≥ X₁`, with `A, B > 0` and
`X₁ > 1`, then `|M(x)| ≤ x/B` for every real `x ≥ max(X₁, e^{AB})`, since `A x/log x ≤ x/B` exactly
when `log x ≥ AB`.

*Needs:* `MoebiusTableVerified`; *MoebiusRangeVerified*; the uncertified sources by locator; 1.7 for
the second route.

### 1.4 Logarithmic decay

Prove Schoenfeld's inequality: for every real `x > 1`,
`Σ_{n ≤ x} |Λ(n) − 1|/n < 2 log x − 2 log log x` (`schoenfeld1969` Lemma 2, (10), lines 110–115; it
is the input (3.1) of `elMarraki1995`). Route: since `|a − 1| = a + 1 − 2 min(a, 1)` for `a ≥ 0`,
the sum equals `Σ_{n ≤ x} 1/n + ψ̃(x) − 2 Σ_{p^k ≤ x} min(log p, 1)/p^k`. For `x ≥ 286` bound the
first term by `log x + γ + 6/(11x)` (Layer 0.3), the second by `log x − γ + 1/(4 log x)` (the
hypothesis `|ψ̃(x) − log x + γ| ≤ 1/(4 log x)` for `x ≥ 115`, ExplicitPrimeCounting §4.2), and the
last sum from below by `Σ_{p ≤ x} 1/p − (1 − log 2)/2` plus the terms `p^k ≤ 286` with `k ≥ 2`,
whose total is `0.591065`, with `Σ_{p ≤ x} 1/p > log log x + B − 1/(2 log² x)`
(AnalyticNumberTheoryPartI §0.19) and `B > 2.009442 − 1.748345 = 0.2610` (§0.19 at `x = 286`, where
`Σ_{p ≤ 286} 1/p = 2.009442` and `log log 286 + 1/(2 log² 286) = 1.748345`). The right side then
exceeds the left by at least `1.31` for every `x ≥ 286`; on `(1, 286)` the inequality is the
proposition *LambdaDeviationRangeVerified* (Layer 0.7), and the statement for every `x > 1` is the
conjunction. The source covers `x ≥ 32` with Rosser–Schoenfeld's estimates.

State Ramaré–Zuniga Alterman's companion bound (`ramareZunigaAlterman2026` Theorem 1.3, with
Balazard's appendix, a preprint, by its locator): `Σ_{n ≤ X} Λ(n)/n ≤ log X` for every real
`X ≥ 1`, from `ψ(X) ≤ X log 3` for `X ≥ 1` (ExplicitPrimeCounting §3.2, since `1.03883 < log 3`) and
a direct check on `[1, 12]`.

Prove El Marraki's bounds (`elMarraki1995` Théorème 1, (4.5), p. 418: `|M(x)| < 0.002969 x/√(log x)`
for `x ≥ 142 194`; Théorème 2, (4.6): `|M(x)| < 0.10917 x/log x` for `x ≥ 685`; its Corollaire:
`|M(x)| ≤ 0.6437752 x/log x` for `x > 1`; the corollary of Théorème 3, p. 421:
`|M(x)| ≤ 362.7 x/log² x` for `x > 1`; the second and the fourth are also quoted at `bordelles2015`
lines 64–66), under the hypotheses the proofs use: the `1/4345` bound of 1.3 for `x > 2 160 535` and
an explicit Chebyshev bound `|ψ(x) − x| ≤ 0.00776291 x/log x` for `x > e^{22}` (`elMarraki1995`
lines 233–234, the inputs (1.1) and (3.2) of the proof of Théorème 1), which ExplicitPrimeCounting
§3.3 supplies with the smaller constant `0.0065`. Route: El Marraki's Propositions 5, 7, 8 and 10,
which turn a pair `(|M(x)| ≤ A x/log^α x` on `[X₀, e^T]`, `|ψ(x) − x| ≤ B x/log^β x` on
`[e^{22}, ∞))` into a bound `|M(x)| ≤ A' x/log^{α+1} x` beyond `e^T` with `A'` computed from
`(A, α, B, β)`, together with *MoebiusRangeVerified* on the initial range.

For Théorème 1 the parameters are `(A, α) = (1/4345, 0)`, `(B, β) = (0.00776291, 1)` with the cut
`T = 166.42`; the range `[2 160 535, e^{166.42}]` follows from `x/4345`, the range
`[142 194, 2 160 535]` is *MoebiusRangeVerified* `(x ↦ 0.002969 x/√(log x)) 142 194 2 160 535`, and the iteration
also uses Schoenfeld's inequality above, the input (3.1) of `elMarraki1995`.

State the same iteration with the Chebyshev inputs of Broadbent et al. and Fiori–Kadiri–Swidinsky
(`johnstonLeongTudzi2024` Theorem A.1, a preprint, the sharpest bounds of shape `x/(log x)^k`):
`|M(x)| ≤ 2.91890 x/log² x` for
every real `x > 1`, `|M(x)| ≤ 4.88346 x/(log x)^{2.35}` for every real `x ≥ e^{385}`, and the
intermediate rows `|M(x)| ≤ c_M x/(log x)^k` of its Table 1
(`(k, c_M, log x_M) = (4/5, 0.00780973, 43), (27/20, 0.0609073, 93), (2/3, 0.00255758, 161), (10/9, 0.0130895, 192), (19/12, 0.0912303, 233), (31/16, 0.430429, 288)`), under `gap:psi-log-power`, `MoebiusTableVerified 0.571 10^{16}`, the
`x/4345` bound of 1.3 and *MoebiusRangeVerified* `(x ↦ 2.16537 x/log² x)` on `(1, 32]`. Its first
row improves
El Marraki's `362.7` by a factor `124`; El Marraki's rows stay the refereed ones.

Prove Schoenfeld's bound `|M(x)| ≤ 2.9 x/log x` for `x > 1` (`schoenfeld1969` lines 52–57) as a
corollary of the Corollaire (`0.6437752 < 2.9`).

*Needs:* 1.3; Layer 0.3 (for Schoenfeld's inequality); ExplicitPrimeCounting §§3.2, 3.3, 4.2;
AnalyticNumberTheoryPartI §0.19; `gap:psi-log-power` (for Theorem A.1); *MoebiusRangeVerified*;
*LambdaDeviationRangeVerified*; `MoebiusTableVerified`.

### 1.5 The transfer from explicit prime estimates to `M(x)`

**Identities.** Prove Selberg's identity in the form `μ · log² = μ ⋆ (Λ ⋆ Λ − Λ · log)`
(`ramare2013aa` lines 171–182, (3.3)), from `Λ = μ ⋆ log` (`ArithmeticFunction.vonMangoldt_mul_zeta`
and its Möbius inversion) and the derivation rule `(f ⋆ g)·log = (f·log) ⋆ g + f ⋆ (g·log)`.
Define the Selberg remainder `selbergRemainder D` (written `R₂*(D)`) by
`Σ_{d ≤ D} (Λ ⋆ Λ(d) − Λ(d) log d) = −2γ ⌊D⌋ + R₂*(D)` (lines 471–475, (6.1)), that is
`R₂*(D) = Σ_{d ≤ D} (Λ ⋆ Λ(d) − Λ(d) log d) + 2γ ⌊D⌋` over `Finset.Icc 1 ⌊D⌋₊`.

- `R₂*(D) = 0` for `D < 1`, and `R₂*` is constant on each `[N, N + 1)`.
- `R₂*(y) = Σ_{d ≤ y} (Λ ⋆ Λ − Λ log + 2γ)(d)` for `y ≥ 0`, the summand read as the arithmetic
  function plus the constant `2γ` at every `d ≥ 1`.
- `R₂*(D) = o(D)`, equivalently `Σ_{d ≤ D} Λ ⋆ Λ(d) = D log D + (2γ − 1) D + o(D)` (Selberg), the
  qualitative content that the explicit bounds below make quantitative.

Prove the hyperbola decomposition
(lines 587–598 and 625–632, (7.1)–(7.2)): for `D ≥ 1` and a natural `K ≥ 1`,

    Σ_{d ≤ D} μ(d) log² d = −2γ + Σ_{ℓ ≤ D/(K+1)} μ(ℓ) R₂*(D/ℓ) + Σ_{k ≤ K} (Λ ⋆ Λ − Λ log + 2γ)(k) M(D/k) − R₂*(K) M(D/(K+1)),

from `Σ_{d ≤ D} μ(d) log² d = Σ_{ℓ ≤ D} μ(ℓ) R₂*(D/ℓ) − 2γ` (the identity (3.4) of the source, line
189–197) by splitting at `ℓ ≤ D/(K + 1)` and using `R₂*(y) = Σ_{k ≤ y} (Λ ⋆ Λ − Λ log + 2γ)(k)` for
`y < K + 1`; the source's (7.1)–(7.2) are its rearrangement with the split at `D/K`, and the
boundary term is the one displayed here. Prove the Chebyshev decomposition of
`R₂*` (lines 482–550, Lemma 6.2): with `R(t) = ψ(t) − t`, `r(t) = ψ̃(t) − log t + γ` and
`R₄(D) = Σ_{d ≤ √D} Λ(d) R(D/d)` (line 349, (5.1)), for `D ≥ 1`,

    |R₂*(D)| ≤ 2D |r(√D)| + 2√D |R(√D)| + R(√D)² + |R(D)| log D + 1 + 2γ + 2|R₄(D)| + |∫_1^D R(t) dt/t|,

proved from `Σ_{d ≤ D} Λ(d) log d = ψ(D) log D − ∫_1^D ψ(t) dt/t` and Dirichlet's hyperbola formula
for `Σ_{d₁d₂ ≤ D} Λ(d₁)Λ(d₂)`. Prove its sharper form (`ramareZunigaAlterman2025` Lemma 6.1): for
every `D > 0`,

    |R₂*(D)| ≤ 1 + 2γ + 2√D |√D r(√D) − R(√D)| + R(√D)² + |R(D)| log D + |∫_1^D R(t) dt/t| + 2|R₄(D)|,

which implies the first by the triangle inequality and is fed by a bound on `r(y) − R(y)/y` (the
input `gap:psi-tilde-difference`) instead of bounds on `r` and `R` separately; it is the form the
instance of 1.10 uses.

**Parametric estimates.** Prove, with every constant a parameter:

- (Lemma 5.1, lines 357–383) if `ψ(t) ≤ c₁ t` for all `t ≥ 0`, then for real `D > 1` and
  `1 ≤ T ≤ √D`, `Σ_{d ≤ T} Λ(d)/(d log(D/d)) ≤ c₁/log D + c₁ log(log D/log(D/T))` (by Abel
  summation against `f(t) = 1/(t log(D/t))`, lines 364–382; `T ≤ √D` keeps `log(D/t) ≥ ½ log D > 0`).
- (Lemma 5.2's scheme, lines 404–414) if `|R(x)| ≤ a x/log x` for every `x ≥ x₂`, then for every
  real `D ≥ x₂²`, `|R₄(D)| ≤ a D Σ_{d ≤ √D} Λ(d)/(d log(D/d)) ≤ a c₁ (log 2 + 1/log D) D` (Lemma 5.1
  at `T = √D`, since every `D/d` with `d ≤ √D` is at least `√D ≥ x₂`); so `|R₄(D)| ≤ ρ₄ D` with
  `ρ₄ = a c₁ (log 2 + 1/log D₄)` for `D ≥ D₄ ≥ x₂²`. The source's further cases for
  `10^9 ≤ D ≤ x₂²` (lines 415–467) are not needed here: that range lies inside field (ii);
- (Lemma 6.1's scheme, lines 568–583) from Lemma 6.2 and bounds `|r(y)| ≤ ε₄(y)` for `y ≥ x₄`,
  `|R(y)| ≤ η(y) y` for `y ≥ x₂`, `|R₄(D)| ≤ ρ₄ D` for `D ≥ D₄` and
  `|∫_1^D R(t) dt/t| ≤ I₀ + ε₅ (D − 10^8)` for `D ≥ 10^8`: for every real `D ≥ max(x₄², x₂², D₄, 10^8)`, `|R₂*(D)| ≤ ρ(D) D`
  with
  `ρ(D) = 2ε₄(√D) + 2η(√D) + η(√D)² + η(D) log D + (1 + 2γ)/D + 2ρ₄ + (I₀ + ε₅(D − 10^8))/D`,
  term by term from the displayed bound of Lemma 6.2 (`2√D |R(√D)| ≤ 2η(√D) D`,
  `R(√D)² ≤ η(√D)² D`, `|R(D)| log D ≤ η(D) D log D`);
- (Lemma 7.2's scheme, lines 638–646, with the arguments of `R₂*` split by size) let `K ≥ 1` be a
  natural number and `K + 1 < Y₀ < Y` reals, and suppose: `|R₂*(y)| ≤ ρ y` for every `y ≥ Y`;
  `|R₂*(y)| ≤ c₁ √y log y` for `K + 1 ≤ y ≤ Y₀` and `|R₂*(y)| ≤ c₂ √y log y` for `Y₀ < y < Y`, with
  `0 < c₁ ≤ c₂` and `c₂ log Y/√Y ≤ ρ`; `|M(x)| ≤ x/A` for every `x ≥ X_A`; and
  `(6/π²) log t + c₋ ≤ Σ_{ℓ ≤ t} μ²(ℓ)/ℓ ≤ (6/π²) log t + c₊` for every real `t ≥ 1` (Layer 7.1, with
  `c₋ = 0.578`, `c₊ = 1.166`). Put `g(y) = c₁ log y/√y` on `[K + 1, Y₀]`, `g(y) = c₂ log y/√y` on
  `(Y₀, Y)`, `J = (c₂ − c₁) log Y₀/√Y₀` and
  `S_K = Σ_{k ≤ K} |Λ⋆Λ − Λ log + 2γ|(k)/k + |R₂*(K)|/K`. Then for every real `D ≥ (K + 1) X_A` with
  `D ≥ Y`,

      |Σ_{d ≤ D} μ(d) log² d|/D ≤ 2γ/D + ρ((6/π²) log(D/Y) + c₊) + (c₊ − c₋)(g(K + 1) + J) + (6/π²) ∫_{K+1}^{Y} g(y) dy/y + S_K/A.

  Route: the hyperbola decomposition above; `|M(D/k)| ≤ D/(Ak)` for `k ≤ K` and
  `|M(D/(K + 1))| ≤ D/(AK)` give the term `S_K/A`; the sum `Σ_{ℓ ≤ D/(K+1)} μ²(ℓ) |R₂*(D/ℓ)|/D` is at
  most `Σ_{ℓ ≤ D/(K+1)} (μ²(ℓ)/ℓ) w(ℓ)` with `w(ℓ) = ρ` for `ℓ ≤ D/Y` and `w(ℓ) = g(D/ℓ)` beyond
  (`g` decreases on `[e², ∞)`, so `w` increases in `ℓ` past `D/Y`, apart from the downward jumps at
  `ℓ = D/Y` and, of size `J`, at `ℓ = D/Y₀`), and Abel summation against
  `Σ_{ℓ ≤ t} μ²(ℓ)/ℓ` uses the upper bound `c₊` at `t = D/Y`, at the end point `D/(K + 1)` and at
  the jump `J`, and the lower bound `c₋` on the stretches where `w` increases. With one ratio `ρ`
  for every argument `y ≥ K + 1` the same route gives the source's form (lines 642–643)
  `|Σ_{d ≤ D} μ(d) log² d|/D ≤ 2γ/D + ρ((6/π²) log(D/(K + 1)) + c₊) + S_K/A` for `D ≥ (K + 1) X_A`,
  the form 1.10 uses; at the parameters of 1.5 it does not close;
- (Lemma 8.1 with `k = 2`, lines 696–724) for reals `α, β > 0`, `D₁ > 1` and `C₁ ≥ 0`: if
  `|M₂(μ, t)| ≤ (α log t − β) t` for every real `t ≥ D₁` and `|M(D₁) − M₂(μ, D₁)/log² D₁| ≤ C₁`, then
  for every real `D ≥ D₁`, by Lemma 8.1,
  `|M(D)| ≤ (α/log D − β/log² D) D + C₁ + 2 ∫_{D₁}^D (α log t − β) dt/log³ t`; and since
  `2α ∫_{D₁}^D dt/log² t = 2α D/log² D − 2α D₁/log² D₁ + 4α ∫_{D₁}^D dt/log³ t`, this is
  `(α/log D − (β − 2α)/log² D) D + (C₁ − 2α D₁/log² D₁) + (4α − 2β) ∫_{D₁}^D dt/log³ t`, so
  `|M(D)| ≤ (α/log D − (β − 2α)/log² D) D` for every `D ≥ D₁` under the absorption conditions
  `2β ≥ 4α` and `C₁ ≤ 2α D₁/log² D₁`. The source writes the boundary value with its sign, `−3.48`,
  inside the bound for `|M(D)|` (lines 716–717); the absolute value `+C₁` is the correct term, and
  it is absorbed.

**The instance.** Prove Ramaré's Theorem 1.1 (`ramare2013aa` lines 50–51) in its analytic range: for
every real `D ≥ 2 161 205`, `|M(D)| ≤ (0.0130/log D − 0.118/log² D) D` (`abs_moebiusSum_le_ramare`),
under these hypotheses: `ψ(x) ≤ 1.04 x` for every real `x ≥ 0` (ExplicitPrimeCounting §3.2, giving
`c₁ = 1.04`); `|ψ(x) − x| ≤ 0.8 √x` for every real `1500 ≤ x ≤ 10^{10}` (the second clause of
`gap:psi-initial-range`); `|ψ(x) − x| ≤ 0.0065 x/log x` for every real `x > e^{22}`
(ExplicitPrimeCounting §3.3); `|ψ(x) − x| ≤ 0.000213 x` for every real `x ≥ 10^{10}`
(ExplicitPrimeCounting §6.1); `|ψ̃(x) − log x + γ| ≤ 0.0067/log x` for every real `x ≥ 1 520 000`
(ExplicitPrimeCounting §4.2); `MoebiusTableVerified 0.571 10^{12}`; the bound `|M(x)| ≤ x/4345` for
every real `x ≥ 2 160 535` of 1.3, used with `K = 462 848` (`462 848 × 2 160 535 ≤ 10^{12}`, line
646); the squarefree bounds `|Σ_{n ≤ x} μ²(n) − 6x/π²| ≤ 0.7 √x` for every real `x ≥ 1` (Layer 7.1;
lines 267–276, Lemma 4.6) and `(6/π²) log y + 0.578 ≤ Σ_{d ≤ y} μ²(d)/d ≤ (6/π²) log y + 1.166` for
every real `y ≥ 1` (Layer 7.1); and `RamareTransferComputations` (Layer 0.7). The route is Lemma
7.2: `|Σ_{d ≤ D} μ(d) log² d| ≤ (0.0130 log D − 0.144) D` for `D ≥ 2 161 205` (lines 680–684), by
the scheme of Lemma 7.2 for `D ≥ K·2 160 535 = 999 999 303 680`, by summation by parts against the
table for `8 613 000 ≤ D ≤ 10^{12}` (lines 647–677), and by field (vi) on `[2 161 205, 8 613 000]`.
The scheme is used with `K = 462 848`, `A = 4345`, `X_A = 2 160 535`, `S_K/A ≤ 0.03739` (field
(iv)), `c₁ = 1.80` up to `Y₀ = 1.1·10^8` and `c₂ = 1.93` up to `Y = 1.8·10^9` (field (i)), and
`ρ = 0.0213` from `Y` on (field (ii) up to `2.3104·10^{12}`, Lemma 6.1's scheme beyond, below). Its
terms are `g(K + 1) = 1.80 log(K + 1)/√(K + 1) = 0.034515`, `J = 0.13 log Y₀/√Y₀ = 0.000230`,
`(c₊ − c₋)(g(K + 1) + J) = 0.588·0.034745 = 0.020430` and `(6/π²) ∫_{K+1}^{Y} g(y) dy/y = 0.047418`
(from `∫ log y · y^{−3/2} dy = −2(log y + 2)/√y`), so the bound is
`2γ/D + 0.012949 log D − 0.145879` for `D ≥ (K + 1)·2 160 535`. On
`K·2 160 535 ≤ D < (K + 1)·2 160 535` the argument `D/(K + 1)` of the boundary term lies in
`[2 160 530, 2 160 535)`, where the table gives `|M(D/(K + 1))| ≤ 0.571 √2 160 535 = 839.3`, so the
boundary term adds at most `1.80 √K log K · 839.3/D ≤ 1.4·10^{−5}`. In both cases the bound is below
`0.0130 log D − 0.144`, with a difference of at least `0.0000512 log D + 0.00186`, which is `0.0033`
at `D = K·2 160 535` and increases. With *MoebiusRangeVerified*
`(D ↦ (0.0130/log D − 0.118/log² D) D) 1 078 853 2 161 205` (Layer 0.7) the bound holds for every
real `D ≥ 1 078 853`, the range the source states. The parameters of the schemes are:
`η(y) = 0.0065/log y` for `y ≥ x₂ = 1 514 928` (Lemma 4.2, lines 208–214: ExplicitPrimeCounting §3.3
beyond `e^{22}`, the `0.8 √y` bound on `[3 430 190, 10^{10}]`, where `0.8 √y ≤ 0.0065 y/log y`, and
field (vii) on `[1 514 928, 3 430 190]`); `a = 0.0065`, so
`ρ₄ = 0.0065·1.04·(log 2 + 1/log D₄) = 0.004923` for `D ≥ D₄ = 2.3104·10^{12} = x₄² ≥ x₂²`;
`ε₄(y) = 0.0067/log y` for `y ≥ x₄ = 1 520 000` (ExplicitPrimeCounting §4.2); `I₀ = 147.778` (field
(iii)) and `ε₅ = 0.000213`, valid for `t ≥ 10^8` (`gap:psi-initial-range` on `[10^8, 10^{10}]`,
where `0.8 √t ≤ 0.00008 t`, and ExplicitPrimeCounting §6.1 beyond). For every `D ≥ 2.3104·10^{12}`
the terms of `ρ(D)` are at most `0.000941`, `0.000913`, `0.0065`, `2ρ₄ = 0.00985` and `0.000213`
(their values at `D = 2.3104·10^{12}`; the first two decrease in `D` and the last stays below `ε₅`),
the others below `10^{−6}`, with sum `0.0185 ≤ 0.0213`: `|R₂*(D)| ≤ 0.0213 D` for
`D ≥ 2.3104·10^{12}`, and field (ii) covers `[1.8·10^9, 2.3104·10^{12}]`. Field (i) implies
`|R₂*(D)| ≤ 0.0213 D` only from `D ≥ 1 435 319` on (line 583), not on `[K + 1, 1 435 319]`, which is
one reason the scheme above uses field (i) as a square-root bound below `1.8·10^9` rather than as
the ratio `0.0213`. The printed proof covered `D ≥ 1.3·10^9` analytically by invoking the `ψ̃` bound
at `√D ≥ 36 055` with the uncorrected range `x ≥ 23`, which is false (supplier contracts, §4.2);
with the corrected range `x ≥ 1 520 000` the analytic argument starts at
`D = 1 520 000² = 2.3104·10^{12}`, and the source's finite extensions of Lemmas 4.3–4.4 are not
used, since `η` already bounds `R` at the arguments `√D ≥ 1 520 000` and `D`. Theorem 1.1 then
follows from Lemma 7.2 by the Lemma 8.1 scheme with `α = 0.0130`, `β = 0.144`, `D₁ = 2 161 205` and
`C₁ = 3.49` (field (v)): `2β = 0.288 ≥ 4α = 0.052` and `C₁ = 3.49 ≤ 2α D₁/log² D₁ = 264.11`, so
`β − 2α = 0.118`.

Prove the weakened form `|M(D)| ≤ 0.013 D/log D` for `D ≥ 1 100 000` as a corollary. The same
statement, re-proved with the inputs of 1.10, is `ramareZunigaAlterman2025` Corollary 1.1, and the
sharper instance of the transfer is 1.10.

*Needs:* 1.1 (Lemma 8.1); Layer 0.7 (`RamareTransferComputations`, `MoebiusTableVerified`, and
*MoebiusRangeVerified* for the range below `2 161 205`); 1.3; Layer 7.1 (the `0.7√D` squarefree
remainder and `(6/π²) log y + 0.578 ≤ Σ_{d ≤ y} μ²(d)/d ≤ (6/π²) log y + 1.166`);
ExplicitPrimeCounting §§3.2, 3.3, 4.2, 6.1;
`gap:psi-initial-range`; `ArithmeticFunction.vonMangoldt_mul_zeta`.

### 1.6 Coprime and semigroup variants

For a set `S` of primes excluding finitely many primes, with `w_S` the excluded weight of Layer 0.2,
prove the
decomposition `M_S(x) = Σ_{a ≤ x, a ∈ ⟨Sᶜ⟩} M(x/a)` (Layer 0.2, from `1_{⟨S⟩} μ = g_S ⋆ μ`), hence
`|M_S(x)| ≤ Σ_{a ≤ x, a ∈ ⟨Sᶜ⟩} |M(x/a)|`; writing `a = dw²` with `d` squarefree,
`M_q(x) = Σ_{d ∣ q} μ²(d) Σ_{w ≤ √(x/d), w ∣ q^∞} M(x/(dw²))` (`ramare2015mc` (16.1), lines 1441–1453),
hence `|M_q(x)| ≤ Σ_{d ∣ q} μ²(d) Σ_{w ≤ √(x/d)} |M(x/(dw²))|`.

Under *MoebiusStarRangeVerified* for the rows of the source's Lemmas 16.4 and 16.6 below `8·10^7`
and *MoebiusRangeVerified* for its (16.2)–(16.4) below `1 078 853` (the instances listed in Layer
0.7), prove Ramaré's Theorems 1.18–1.19 for a natural `q ≥ 1` and real `x > q`:
`(φ(q)/q) log(x/q) |M_q(x)|/x ≤ 0.997` for `x/q > 1`, `≤ 0.429` for `x/q ≥ 490`, `≤ 1/5` for
`x/q ≥ 4536`, `≤ 0.0918` for `x/q ≥ 48 513` (lines 407–419), and
`(φ(q)/q)(1 + log(x/q)) |M_q(x)|/x ≤ 1.566` for `x/q > 1`, `≤ 1/2` for `x/q ≥ 490`, `≤ 1/5` for
`x/q ≥ 7100`, `≤ 39/400` for `x/q ≥ 48 645` (lines 420–432, where the first row is printed with `1`,
which fails at `q = 1`, `x = 5`); in each, `φ(q)/q` may be replaced by `∏_{p ∣ q}(1 + 1/p)^{−1}`.
State the same bounds for `⟨S⟩` with `w_S` in place of `q/φ(q)` and `q = ∏_{p ∉ S} p` as the
threshold parameter. Route (the source's §16): a row `c` from `a` follows from
`Σ_{w ≤ √y} |M(y/w²)| ≤ c y/log y` (resp. `c y/(1 + log y)`) for every real `y ≥ a`, applied at
`y = x/d ≥ x/q` for each `d ∣ q`, with `log(x/d) ≥ log(x/q)` and
`Σ_{d ∣ q} μ²(d)/d = ∏_{p ∣ q}(1 + 1/p)`, so that the left side is at most
`c ∏_{p ∣ q}(1 − 1/p²) ≤ c`; that bound on the sum over `w` holds beyond `8·10^7` by the analytic
argument of Lemmas 16.4 and 16.6 (the bound of 1.5 through (16.2)–(16.3) at the arguments
`x/w² ≥ 688`, `|M(z)| ≤ z` below, and the integral comparison of Lemmas 7.2 and 16.3), and up to
`8·10^7` it is the instance of *MoebiusStarRangeVerified*.

State de Camargo's constants `0.3131, 0.2663, 0.2335, 0.1738` for `q = 2, 3, 5, 6` and `0.2102` for
`q ≥ 7`, uniformly in `x > q` (`deCamargo2025`, uncertified, cited by locator), as the same theorem
with those constants under its own direct-verification proposition.

*Needs:* 0.2; 1.5; Layer 0.7 (*MoebiusStarRangeVerified*, *MoebiusRangeVerified*).

### 1.7 Linear bounds from finitely many zeros of `ζ`

Prove Chirre–Helfgott's explicit formula with a smoothed kernel (`chirreHelfgott2025` Corollary 1.2,
a preprint), in the two cases `σ = 0` and `σ = 1` used here: let `T ≥ 4π` be such that every zero of
`ζ` with `|Im ρ| ≤ T` is simple, put `δ = π/(2T)` and let `Z*(T)` be the set of nontrivial zeros with
`|Im ρ| ≤ T`; then for every real `x ≥ e² T` with `max_{r ≤ 1} 1/|ζ(r ± iT)| ≤ log² x`,

    |Σ_{n ≤ x} μ(n) n^{−σ} − 1/ζ(σ) − δ Σ_{ρ ∈ Z*(T)} w_{δ,σ}(ρ) x^{ρ−σ}/ζ'(ρ)| ≤ (π/2) x^{1−σ}/(T − 1) + 2 x^{−σ},

with `w_{δ,σ}(s) = coth(δ(s − σ)) − tanh(δ(1 − σ))` and `1/ζ(1)` read as `0`. Under
*ZetaResidueSumVerified* `T S Z` (Layer 0.7: the zeros up to height `T` are simple and on the critical
line, the residue sum is at most `S`, and `1/|ζ|` is at most `Z` on the horizontal segments at
height `T`), the sum over zeros is at most `2S x^{1/2 − σ}` up to lower-order terms that the source
makes explicit, and with the table bounds below `e² T`
(`MoebiusTableVerified 0.571 10^{16}` and *MoebiusDivRangeVerified* `(x ↦ 0.569449/√x) 3 10^{14}`,
`chirreHelfgott2025` Lemma 6.7) this gives Corollaries 1.3 and 6.8: for every real `x ≥ 1`,

    |M(x)| ≤ 3x/(π·10^{10}) + 11.39 √x,        |m(x)| ≤ 3/(π·10^{10}) + 11.39/√x,
    |M(x)| ≤ πx/(2·10^{10}) + 11.350514 √x,     |M(x)| ≤ πx/(2·10^7) + 6.738093 √x,

the last two from the instances `T = 10^{10} + 1` and `T = 10^7 + 1` (the constants are `2S`). Prove
the consequence for linear bounds: for every real `L` with `10.07 ≤ L ≤ 8.7·10^6`, `|M(x)| ≤ x/L`
for every real `x ≥ (0.571 L)²`, on `[(0.571 L)², 10^{16}]` by the table and beyond by the first
bound (at `x = 10^{16}` its relative size is `1.1400·10^{−7} < 1/(8.7·10^6) = 1.1494·10^{−7}`, and
it decreases). The lower limit on `L` makes `(0.571 L)² ≥ 33.06` lie in the table's range `x ≥ 33`;
it is needed, since below `√33/0.571 = 10.0605…` the bound fails just below `33`. At `L = 2360` and
`L = 4345` this is the second route of 1.3; at `L = 160 383` it gives Daval's bound of 1.8 from
`8.39·10^9`, and at `L = 180 194` from `1.06·10^{10}` instead of `10^{19}`.

*Needs:* Layer 0.7 (*ZetaResidueSumVerified*, `MoebiusTableVerified`, *MoebiusDivRangeVerified*);
Mathlib `riemannZeta`; the explicit formula for `M` with a smoothed kernel, proved here.

### 1.8 Linear bounds by linear conversion

Prove Daval's identity (`daval2023` Lemme 1, a preprint): with `N(x) = Σ_{n ≤ x} μ(n) log n` and
`m₁ = m − M/x`, for all reals `1 ≤ y ≤ x`,

    −N(x) = Σ_{k ≤ y} Λ(k) M(x/k) + Σ_{j ≤ x/y} μ(j) (ψ(x/j) − x/j) − (ψ(y) − y) M(x/y) + x m₁(x/y),

from `μ · log = −μ ⋆ Λ` and the hyperbola method split at `y`; and the passage from `N` to `M`
(Lemme 14): for `33 ≤ y ≤ 10^{16}` and `x ≥ y`,
`|M(x)|/x ≤ |N(x)|/(x log x) + (0.08/log x)(0.571/√y) + (5 + 1.142√y)/(x log x) + 1/x` under
`MoebiusTableVerified 0.571 10^{16}`. Prove the conversion step (Lemme 13): if `|M(t)| ≤ t/L` for
every `t ≥ y = (0.571 L)²` with `y² ≤ 10^{19}`, then `sup_{x ≥ 10^{19}} |N(x)|/(x log x)` is at most
an explicit function of `y` built from `|ψ(t) − t| ≤ 0.94√t` on `[11, 10^{19}]`,
`sup_{t ≥ e^{40}} |ψ(t) − t|/t`, the `m₁`-bounds of 2.3 and `Σ_{n ≤ X} μ²(n)/n ≤ (6/π²) log(7X)`
(7.1). The instance (Théorème A and the abstract of the source): iterating from `L = 4345` (1.3) gives
`|M(x)| ≤ x/180 194` for every real `x ≥ 10^{19}`, and with the source's direct treatment of
`[10^{16}, 10^{19}]` (its Proposition 1 and Lemmes 8 and 12) `|M(x)| ≤ x/160 383` for every real
`x ≥ 8.4·10^9`. Inputs: ExplicitPrimeCounting §1.3 (*ButheVerified*); `gap:psi-relative-bklnw`;
ExplicitPrimeCounting §4.2
(through `Σ_{k ≤ y} Λ(k)/k ≤ log y − 1/2` for `y ≥ 300`, Lemme 11); *DavalLinearComputations*
(Layer 0.7). This route needs no zero of `ζ` beyond what the Chebyshev inputs rest on; under the
hypotheses of 1.7 the same bounds follow from the corollary there.

*Needs:* 1.1; 1.3; 2.3 (Daval's `m₁`-bounds); 7.1; Layer 0.7 (`MoebiusTableVerified`,
*DavalLinearComputations*); ExplicitPrimeCounting §1.3 (*ButheVerified*); `gap:psi-relative-bklnw`;
ExplicitPrimeCounting §4.2.

### 1.9 The de la Vallée Poussin shape

State Lee–Leong's bound of de la Vallée Poussin shape (`leeLeong2022` (9), the row `W = 5.56` of
their Theorem 2.2 (17) and Table 1, a preprint, by its locator; the Littlewood and
Korobov–Vinogradov members (10) and (11) belong to Part II, Scope): with `H₀ = 3 000 175 332 800`,
given `RH(H₀)` and *ZetaReciprocalSegmentVerified* `(3/4) 14 16` (Layer 0.7),
`|M(x)| < 33.56 x (log x) exp(−√(log x/5.56))` for every real `x ≥ e^{4589.20}`. The source states it
without a hypothesis, reading Platt and Trudgian's verification and the bound it quotes for `1/ζ`
near the real axis as theorems; here both are hypotheses (Conventions), the first the proposition
`RH(H)` of ExplicitPrimeCounting §1.1 at the height recorded in ExplicitZetaBounds §0.4. The
threshold is `exp(5.56 log² H₀)`, where the truncation height `T = exp(√(log x/5.56))` of the route
reaches `H₀`.

State with it, given `RH(H₀)`, the two bounds of Leong (`leong2026`, arXiv v5, a preprint, by its
locator) that the join of its contour below the verified height uses:

- (a) `|ζ'/ζ(σ + it)| ≤ 10.175 log t` for every real `σ ≥ 0.95` and every real `t` with
  `13 ≤ t ≤ H₀ − 1/2` (Corollary 3 in the row `σ₀ = 0.95` of his Table 2, `leong2026` lines 121–136
  and 1031–1044; his height `H` is `H₀ − 1/2`, line 78; it is the last of the five rows from which
  Lee and Leong's Lemma 4.3 is built). With the line bound `1/|ζ(1 + it)| ≤ 29.388 log t` of
  ExplicitZetaBounds §7.10 and the identity
  `log(1/|ζ(σ + it)|) = log(1/|ζ(1 + it)|) + ∫_σ^1 Re (ζ'/ζ)(y + it) dy` it gives
  `1/|ζ(σ + it)| ≤ 29.388 t^{10.175(1 − σ)} log t` for `0.95 ≤ σ ≤ 1` at those heights.
- (b) `1/|ζ(σ + it)| ≤ 1719 log t` for every real `t ≥ 13` and every real `σ ≥ 1 − 1/(13 log t)`
  (Corollary 4 in its row `(W, Y) = (13, 1719)`, `leong2026` lines 140–154 and 1546–1557). Every row
  of his Table 4 with `W ≥ 6` serves the route as well; the row `W = 5.56` does not.

They are this roadmap's targets because no supplier states them: ExplicitZetaBounds §7.10 states the
row `W = 5.56` of the corollary of (b), which differs in its wider region and its constant
`7.59·10³¹`, and its route uses the rows of (a) inside its proof of the bound on `σ ≥ 3/4` without
stating them. Route (Leong's, which ExplicitZetaBounds §7.10 follows for its own items): bounds for
`ζ'/ζ` inside zero-free regions, below `H₀ − 1/2` from `RH(H₀)` in discs of radius `1/2` that stay
below the verified height, and above it by Borel–Carathéodory (Mathlib `Complex.borelCaratheodory`)
from the bounds for `|ζ|` near the line one of ExplicitZetaBounds §§4.8 and 4.10 in the region of
its §7.3; then, for (b), the identity above from the line one, with §7.10's line bound.

Route (a route; the constants are the source's): a truncated Perron formula for `M`, that is Tau
Ceti's `TauCeti.norm_truncatedPerron_LSeries_sub_sum_le` at `f = μ`, whose `L`-series is `1/ζ` on
`Re s > 1` (Mathlib `ArithmeticFunction.LSeriesSummable_moebius_iff`,
`LSeries_one_mul_Lseries_moebius`, `LSeries_one_eq_riemannZeta`), at non-integral `x` (which
suffices, `M` being constant on each `[N, N + 1)`), or the smoothed form of ExplicitZetaBounds §6.1,
with `c = 1 + 1/log x` and `T` as above; then the line of integration is moved to the left of
`σ = 1` (`leeLeong2022` Lemma 5.1 and Proposition 5.2). Above the verified height the contour runs
along `σ = 1 − 1/(5.56 log|t|)` for `H₀ ≤ |t| ≤ T`, where ExplicitZetaBounds §7.10 bounds `1/ζ` by
`1237 (log|t|)^{11/12}` and §7.3 keeps the zeros out. Below it the contour runs along `σ = 3/4`,
where `RH(H₀)` keeps the zeros out and §7.10 bounds `1/ζ` by `e^{146} log|t|` for
`14 ≤ |t| ≤ H₀ − 1/2`, and *ZetaReciprocalSegmentVerified* `(3/4) 14 16` bounds it by `16` for
`|t| ≤ 14`. The two parts are joined, symmetrically about the real axis, by crossing from `σ = 3/4`
to `σ = 1 − 1/(13 log t)` at the height `H₀ − 1/2`, with `e^{146} log t` on `σ ≤ 0.95` and
`29.388 t^{10.175(1 − σ)} log t` beyond it (item (a)); rising along `σ = 1 − 1/(13 log t)` to the
height `H₀`, with `1719 log t` (item (b)); and crossing at `H₀` to `σ = 1 − 1/(5.56 log H₀)`, with
`1237 (log H₀)^{11/12}`. The source joins the two parts at the height `H₀` itself and bounds the
segment `3/4 ≤ σ ≤ 1 − 1/(5.56 log H₀)` there by the constant `1237` of its (6) (proof of Lemma 5.1,
p. 19), which holds only to the right of that segment. The bound available on that segment is
`e^{146} log t`, which §7.10 proves only up to the height `H₀ − 1/2`, and even at that size the
segment would cost about `6·10³⁵ x` at the threshold. The join above adds less than `2.7·10^{−7}` of
the bound for every `x ≥ e^{4589.20}`, inside the margin of the source's constant: its `c₁` (Theorem
2.2) is `33.5516` at the threshold and decreases in `x`. It is the only explicit bound of this
shape, and it improves on the power-of-log rows of 1.4 once `log x` exceeds about `5200`.

*Needs:* `RH(H₀)` (ExplicitPrimeCounting §1.1, at the height recorded in ExplicitZetaBounds §0.4);
Tau Ceti `TauCeti.norm_truncatedPerron_LSeries_sub_sum_le`, or ExplicitZetaBounds §6.1 (the
truncated Perron formula); Mathlib `ArithmeticFunction.LSeriesSummable_moebius_iff`,
`LSeries_one_mul_Lseries_moebius`, `LSeries_one_eq_riemannZeta`, `riemannZeta`; ExplicitZetaBounds
§7.10 (the bounds for `1/ζ`) and §7.3 (no zero inside the contour above `H₀`); items (a) and (b);
*ZetaReciprocalSegmentVerified* (Layer 0.7). For (a) and (b): `RH(H₀)`; ExplicitZetaBounds §§4.8,
4.10, 7.3 and 7.10 (the line bound); Mathlib `Complex.borelCaratheodory`.

### 1.10 The transfer with the sharper prime inputs of Ramaré–Zuniga Alterman

Prove Ramaré–Zuniga Alterman's Theorem 1.1 (`ramareZunigaAlterman2025`, Funct. Approx.): for every
real `X ≥ 1 798 118`, `|M(X)| ≤ (0.006688 log X − 0.039) X/log² X`, hence
`|M(X)| ≤ 0.006688 X/log X`. Route, the chain of 1.5 with the sharper decomposition and sharper
inputs: `|R₂*(X)| ≤ 0.011 X` for every real `X ≥ 1.8·10^9`, by field (iv) of
*RamareZunigaAltermanComputations* on `[1.8·10^9, 2.1·10^{10}]` (where
`1.93 log X/√X ≤ 9.7·10^{−4}`) and beyond `2.1·10^{10}` by Lemma 6.1 of 1.5, whose argument `y = √X`
then exceeds `144 913`. Lemma 6.1 is fed by the ψ̃-difference `|r(y) − R(y)/y| ≤ 0.052/√y` on
`[144 913, 394 385]` (*PsiTildeDifferenceRangeVerified*, Layer 0.7) and `≤ 0.05/√y + 1.75·10^{−12}`
for `y ≥ 394 385` (`gap:psi-tilde-difference`); by `R(y)` bounded by `0.8 √y` on `(1500, 10^{10}]`
(`gap:psi-initial-range`), `0.94 √y` on `(11, 10^{19}]` (*ButheVerified*, ExplicitPrimeCounting
§1.3), the relative bounds of `gap:psi-relative-bklnw` beyond `10^8`, and `0.0065 y/log y` from
`1 514 928` (ExplicitPrimeCounting §3.3 with field (vii) of `RamareTransferComputations`); and by
`ψ(t) ≤ 1.04 t` (ExplicitPrimeCounting §3.2) in Lemma 5.1's scheme, giving `|R₄(X)| ≤ 0.005 X`.
Lemma 7.2's scheme with the `1/4345` bound of 1.3, `MoebiusTableVerified 0.571 10^{16}`, the
reciprocal squarefree sum `Σ_{n ≤ X} μ²(n)/n = (6/π²) log X + O*(1.045)` for `X ≥ 10^6` (7.2,
Corollary 3.3) and the small-values sums, giving
`|Σ_{n ≤ X} μ(n) log² n| ≤ (0.006688 log X − 0.0504) X` for `X ≥ 4·10^7`; and the passage of Lemma
8.1 from `Σ μ(n) log² n` to `M` with the boundary value at `X₀ = 4·10^7` and the source's absorption
of the boundary terms. Every finite computation of the analytic range `X ≥ 1.5·10^7` is a field of
*RamareZunigaAltermanComputations* or the instance of *PsiTildeDifferenceRangeVerified* (Layer 0.7),
and on `[1 798 118, 1.5·10^7)` the bound is *MoebiusRangeVerified* (Layer 0.7); the full statement
is the conjunction. Prove Corollary 1.1 of the same source, which re-derives Theorem 1.1 of 1.5 for
`X ≥ 1 078 853` with these inputs.

*Needs:* 1.1; 1.3; 1.5 (the identities and schemes); 7.2 (Corollary 3.3); Layer 0.7
(`MoebiusTableVerified`, *MoebiusAbsIntegralLE*, *RamareZunigaAltermanComputations*,
*PsiTildeDifferenceRangeVerified*); ExplicitPrimeCounting §§1.3 (*ButheVerified*), 3.2 and 3.3;
`gap:psi-initial-range`; `gap:psi-relative-bklnw`; `gap:psi-tilde-difference`.

### Dependencies

Layer 0; AnalyticNumberTheoryPartI §3.22a (harmonic remainder, qualitative) and §0.19 (for
Schoenfeld's inequality in 1.4); Layer 7.1 (the
squarefree remainder and the elementary bounds for `Σ μ²(d)/d`, which depend only on Layers 0, 1.2,
1.4, 2.5 and 5.1, none of which uses Layer 1.5); Layer 7.2 for 1.10 (Corollary 3.3, which depends on
Layers 1.4, 1.5, 1.7, 2.3 and 3.2 but on none of 1.8–1.10); Layer 2.3 for 1.8 (Daval's `m₁`-bounds, which do
not use 1.8); ExplicitPrimeCounting §§1.1, 1.3, 3.2, 3.3, 4.2 and 6.1; the supplier gaps
`gap:psi-initial-range`, `gap:psi-log-power`, `gap:psi-relative-bklnw` and `gap:psi-tilde-difference`
of ExplicitPrimeCounting; for 1.9 the hypothesis `RH(3 000 175 332 800)` (ExplicitPrimeCounting
§1.1 at the height recorded in ExplicitZetaBounds §0.4), the truncated Perron formula (Tau Ceti
`TauCeti.norm_truncatedPerron_LSeries_sub_sum_le`, or ExplicitZetaBounds §6.1), the bounds for `1/ζ`
of ExplicitZetaBounds §7.10 with the zero-free region of its §7.3, and, for its items (a) and (b),
ExplicitZetaBounds §§4.8 and 4.10 with Mathlib `Complex.borelCaratheodory`; and the zero data
*ZetaResidueSumVerified* and *ZetaReciprocalSegmentVerified* of Layer 0.7.

## Layer 2: the logarithmic sum `m(x)`

### 2.1 The Gram–Tao bound and its mollification

Prove Tao's theorem: for every set `S` of primes and every real `x`,
`|Σ_{n ∈ ⟨S⟩, n ≤ x} μ(n)/n| ≤ 1`, i.e. `|m_S(x)| ≤ 1` (`abs_moebiusDivSumIn_le_one`, stated for
every `S : Set ℕ`, whose non-prime elements play no role; `tao2010` lines 111–116, Theorem 1.1, whose
proof is the Möbius inversion of the indicator of `⟨Sᶜ⟩` summed over `n ≤ x`, lines 117–135;
`granvilleRamare1996` Lemma 8.6 and `davenport1937` Lemma 1, both uncertified, for the modulus
form). Route: for natural `x`, `Σ_{n ≤ x, n ∈ ⟨Sᶜ⟩} 1 = x m_S(x) − Σ_{n ≤ x, n ∈ ⟨S⟩} μ(n){x/n}`,
where the left side lies in `[1, x]`, and Tao's bounds on the fractional-part sum (lines 117–140,
after reducing to the case `Σ_{n ∈ ⟨S⟩, n ≤ x} 1/n > 1`) give `|x m_S(x)| ≤ x`. Prove the sharp
lower form
`−1 + 2/x ≤ m(x)` for natural `x ≥ 1` in the case `S = ` all primes (`balazard2012` line 108).

Prove Ramaré's mollified bound: for every natural `r ≥ 1`, real `ε ≥ 0` and real `x`,
`|Σ_{d ≤ x, (d, r) = 1} μ(d)/d^{1+ε}| ≤ 1 + ε` (`ramare2013facm` lines 21–27, Theorem 1.1), and
its lower form `−(11/15)(1 + ε) ≤ Σ_{d ≤ x, (d, r) = 1} μ(d)/d^{1+ε}` (lines 33–38). Route: the
source's Rankin-type modification of Gram's argument with the weight `d^{−ε}`; stated for `⟨S⟩`
with finitely many excluded primes, the modulus form being the instance.

*Needs:* Layer 0.2; `ArithmeticFunction.moebius_mul_coe_zeta`; `Nat.factoredNumbers`.

### 2.2 Balazard's conversion theorem

Prove Balazard's inequality: for every real `x ≥ 1`,
`|m(x)| ≤ |M(x)|/x + (1/x²) ∫_1^x |M(t)| dt + 8/(3x)` (`abs_moebiusDivSum_le_balazard`;
`ramare2015mc` lines 91–95, Theorem 1.1;
`balazard2012` lines 444–448, Proposition 7, for `m₁ = m − M/x`), from Balazard's identity of 1.1
and `0 ≤ ε₁'(t) ≤ 1/t²`: `|∫_1^x M(x/t) ε₁'(t) dt| ≤ ∫_1^x |M(x/t)| dt/t² = (1/x) ∫_1^x |M(u)| du`,
and `|4(1 − 1/x)²/x − 4(1 − 1/x)³/(3x)| ≤ 8/(3x)`.

Prove El Marraki's inequality: for `D ≥ 1`,
`|m(D)| ≤ |M(D)|/D + (1/D) ∫_1^D |M(t)| dt/t + (log D)/D` (`ramare2013aa` lines 728–747,
Lemma 9.1), from the identities of 1.1.

Prove the derived theorem: if `|M(t)| ≤ ε(t) t` for all `t ∈ [t₀, D]` with `ε` nonincreasing and
`|M(t)| ≤ c√t` on `[33, t₀]`, then
`|m(D)| ≤ ε(D) + (1/D²)(∫_1^{33} |M(t)| dt + (2c/3)(t₀^{3/2} − 33^{3/2}) + ∫_{t₀}^D ε(t) t dt) + 8/(3D)`
(Balazard's route) and `|m(D)| ≤ ε(D) + (1/D)(∫_1^{t₀} |M(t)| dt/t + ∫_{t₀}^D ε(t) dt) + (log D)/D`
(El Marraki's route; `ramare2013aa` lines 750–759, proof of Corollary 1.2). The two routes differ
in the weight of the initial range: `1/D²` against `1/D`.

Prove Daval's weighted form of Balazard's inequality (`daval2025` Lemme 1, the sharpest form of
the conversion `M → m`): for reals `1 < T ≤ x`, `j ≥ 0` and `θ > −1`, with `m₁ = m − M/x`,

    |m₁(x)| ≤ sup_{T < u < x} (u^{−θ} |M(u)| log^j u) · I(θ − j/log T) · x^{θ−1}/log^j x + (8/3 + x^{−1} ∫_1^T |M(t)| dt)/x,

where `I(s) = ∫_1^∞ ε₁'(t) t^{−s} dt = 1/(s − 1) − 8ζ(s)/((s + 1)(s + 3))` (Balazard's `ε₁'` of 1.1;
the singularity at `s = 1` is removable, with `I(1) = 3/4 − γ`); the case `T = x` is Balazard's
Proposition 7. Route: Balazard's identity of 1.1 split at `T`, `0 ≤ ε₁' ≤ 1/t²`, and the Mellin
transform of `ε₁'` computed from its definition.

*Needs:* 1.1; Layer 0.1; Mathlib `riemannZeta` (for `I(s)`).

### 2.3 Thresholded and decaying bounds for `m(x)`

Prove Ramaré's Theorem 1.2: `|m(x)| ≤ 0.0144/log x − 0.1/log² x` for every real `x ≥ 463 421`
(`ramare2015mc` lines 116–119), as the conjunction of three ranges, under the hypotheses each names.

- `463 421 ≤ x ≤ 3·10^7`: the proposition *MoebiusDivRangeVerified*
  `(x ↦ 0.0144/log x − 0.1/log² x) 463 421 3·10^7` (Layer 0.7).
- `D₀ = 1 078 853 ≤ x ≤ 10^{19}`: Ramaré's route, under *MoebiusAbsIntegralLE*
  `1 078 853 113 556 832` and the bound `|M(D)| ≤ b(D) = (0.0130/log D − 0.118/log² D) D` of 1.5 for
  `D ≥ D₀`. Split the integral term of Balazard's identity (1.1) at `t = x/D₀`. The part `t ≥ x/D₀`
  is at most `113 556 832/x²` by `ε₁' ≤ 1/t²`. The part `t ≤ x/D₀` is at most
  `(1/x) ∫_1^{x/D₀} b(x/t) ε₁'(t) dt`, with `ε₁'` itself as the weight. With `|M(x)|/x ≤ b(x)/x` and
  `8/(3x)` for the polynomial terms, the sum stays below the bound for `log x ≤ 44.6`.
- `x ≥ 10^{19}`: Chirre–Helfgott's `|m(x)| ≤ 3/(π·10^{10}) + 11.39/√x` of 1.7, under its hypotheses,
  while `log x ≤ 10^8`; and Bordellès' `|m(x)| < 546/log² x` (below) once `log x ≥ 37 924`. The
  first rests on a preprint; Ramaré's route does not reach this range.

The source's own chain (Lemma 2.4, lines 479–528, and lines 529–553) does not prove the bound, for
two reasons. First, it bounds the part `t ≥ x/D₀` by `58 909 800/x²`. That number is the integral of
`M` over `{M ≥ 0}` only (Lemma 2.2, lines 461–468), while `ε₁' ≤ 1/t²` needs the integral of `|M|`,
`113 556 832`. Second, at line 546 it replaces the part `t ≤ x/D₀` by an integral of the bound
taken at `x/(t + 1)`. That integral is smaller than the term itself, which no argument from the
bound of 1.5 alone can avoid, since `|M|` may come close to `b` throughout. As `x → ∞` the term
times `log x` tends to `0.0130 I(1) = 0.0130 (3/4 − γ) = 0.002246` (2.2), against Lemma 2.4's
limit `0.0130(1 − log 2)/3 = 0.001330`. So no route through the bound of 1.5 alone reaches every
`x`: `0.0130 + 0.002246 = 0.01525 > 0.0144`.

Prove the simpler rows, each as the conjunction of Theorem 1.2 beyond `463 421` and the finite
verification *MoebiusDivRangeVerified* on `[x₀, 463 421]`:
`(log x)|m(x)| ≤ 1/12` for `x ≥ 687`, `1/20` for `x ≥ 3355`, `1/25` for `x ≥ 3470`, `1/40` for
`x ≥ 24 270`, `1/65` for `x ≥ 96 018`, `1/69` for `x ≥ 96 955`, `0.0144` for `x ≥ 96 955` (line
138, which allows `0.0144` in place of `1/69`; it implies the `1/69` row, `1/69 = 0.014493`); and
`|m(x)| ≤ 1` for `x ≥ 1`, `1/10` for `x ≥ 7`, `1/20` for `x ≥ 41`, `1/100` for `x ≥ 1419`
(`ramare2015mc` lines 120–152, Theorem 1.2 and Corollary 1.3, with three thresholds corrected: the
printed rows `1/20` from `1426`, `1/65` from `60 298` and `1/100` from `694` are false).

Prove Ramaré's 2013 corollary `|m(D)| ≤ 0.0260/log D − 0.118/log² D` for `D ≥ 60 298`
(`ramare2013aa` lines 56–57, Corollary 1.2) through El Marraki's route of 2.2 (lines 750–759): for
`D ≥ D₀ = 1 078 853`, Theorem 1.1 of 1.5 bounds `|M(D)|/D` and `|M(t)|` on `[D₀, D]`, and
*MoebiusLogIntegralLE* `1 078 853 302` bounds `∫_1^{D₀} |M(t)| dt/t`; the instance
*MoebiusDivRangeVerified* `(D ↦ 0.0260/log D − 0.118/log² D) 60 298 1 078 853` (Layer 0.7) covers
`[60 298, 1 078 853]`. The `1/4345` bound of 1.3 does not enter, since it starts only at
`2 160 535 > D₀`. Prove its rounded forms
`|m(D)| ≤ 1/(40 log D) − 1/(10 log² D)` for `D ≥ 60 200` (`1/(40 log D)` alone from `24 270`) and
`|m(D)| ≤ 3/(100 log D) − 1/(10 log² D)` for `D ≥ 50 000` (`3/(100 log D)` alone from `11 815`)
(lines 60–65, Corollaries 1.3–1.4).

Prove Bordellès' decaying bounds `|m(x)| < 0.19/log x` for `x ≥ 33` and `|m(x)| < 546/log² x` for
`x > 1` (`bordelles2015` lines 76–77, Theorem 1), from El Marraki's `M`-bounds of 1.4 through the
conversion of 2.2 and *MoebiusDivRangeVerified* on their initial ranges; and El Marraki's earlier
`0.2185/log x` (`x ≥ 33`) and `726/log² x` (`x > 1`) (`elMarraki1996`, uncertified; quoted at
`bordelles2015` line 69) as corollaries of Bordellès'.

State Daval's bounds (`daval2025`, Comb. Number Theory 14 (2025), Théorème A and Théorèmes 2–4,
uncertified, with the constants of its arXiv version): `|m(x)| ≤ 1/4343` for `x ≥ 2 160 605`;
`(log x)|m(x)| ≤ 0.0130073` for `x ≥ 97 603` (the arXiv version prints `97 063`; the larger
threshold is the one stated); `|m(x)| ≤ 362.84/log² x` for `x ≥ 2`; and for `m₁ = m − M/x`:
`|m₁(x)| ≤ 1/11 470 909` for `x ≥ 2.2·10^{12}`, `≤ 7.265·10^{−6}/log x` for `x ≥ 2.15·10^{11}`,
`≤ 1.046/log² x` for `x > 1` and `≤ 0.138/log² x` for `x ≥ 671`. Route: Daval's conversion of 2.2
with the `x/4345` bound of 1.3, El Marraki's `362.7 x/log² x` of 1.4,
`MoebiusTableVerified 0.571 10^{16}`, *MoebiusRangeVerified* `(x ↦ 0.5 √x) 201 7 725 038 628`,
*MoebiusDivRangeVerified* `(x ↦ 0.5/√x) 3 7 727 068 587` and *MoebiusDivRangeVerified* with
`x ↦ 1/4343` on `[2 160 605, 5·10^6)` and `x ↦ 0.0130073/log x` on `[97 063, 230 000)`. The row
`0.0130073` improves Ramaré's `0.0144` (and `1/69 = 0.014493`) from `97 603` on.

State Johnston–Leong–Tudzi's Theorem A.2 (`johnstonLeongTudzi2024`, a preprint):
`|m(x)| ≤ 4.591/log² x` for every real `x > 1` and `|m(x)| ≤ 7.397/(log x)^{2.35}` for every real
`x ≥ e^{390}`, from Theorem A.1 of 1.4 through Balazard's inequality of 2.2, *MoebiusAbsIntegralLE*
`33 59` and *MoebiusDivRangeVerified* with `x ↦ 0.8/log² x` on `(1, 33]` and `x ↦ 3.01/log² x` on
`[33, 10^{16}]`; it improves Bordellès' `546` by a factor `119` and Daval's `362.84` by `79`, which
stay the
refereed rows. Ramaré's Theorem 1.2 is re-proved, with the corrected inputs, as
`ramareZunigaAlterman2025` Corollary 1.3, and it is superseded from `617 990` on by 2.6.

*Needs:* 1.1 (Balazard's identity and `ε₁'`); 1.5; 1.4; 2.2; 1.3; 1.7 (Chirre–Helfgott's bound
for `m`, for Theorem 1.2 beyond `10^{19}`, with its hypothesis *ZetaResidueSumVerified*); Layer 0.7
(*MoebiusAbsIntegralLE*, *MoebiusDivRangeVerified*, *MoebiusRangeVerified*, *MoebiusLogIntegralLE*,
`MoebiusTableVerified`).

### 2.4 Coprime and semigroup variants

For `S` excluding finitely many primes, with `w_S` the excluded weight of Layer 0.2 and
`q_S = ∏_{p ∉ S} p`, prove
the decomposition `m_S(x) = Σ_{a ≤ x, a ∈ ⟨Sᶜ⟩} m(x/a)/a` (Layer 0.2) and Ramaré's Lemma 1.9
`m_q(x) = Σ_{d ∣ q} (μ²(d)/d) Σ_{w ≤ √(x/d), w ∣ q^∞} m(x/(d w²))/w²` (`ramare2015mc` lines 248–274),
hence `|m_S(x)| ≤ w_S sup_{y ≤ x} |m(y)|`.

Under *MoebiusDivStarRangeVerified* for the rows of the source's Lemmas 7.4 and 8.3 below `3.3·10^7`
(the instances listed in Layer 0.7), prove Ramaré's Theorems 1.12–1.13 for natural `q ≥ 1` and real
`x > q`, with the constants its proof gives: `(φ(q)/q) log(x/q) |m_q(x)| ≤ 0.784` for `x/q > 1`,
`≤ 0.320` for `x/q ≥ 687`, `≤ 17/125` for `x/q ≥ 24 233` (lines 297–307), and
`(φ(q)/q)(1 + log(x/q)) |m_q(x)| ≤ 1.694` for `x/q > 1`, `≤ 1/2` for `x/q ≥ 296`, `≤ 0.320` for
`x/q ≥ 882`, `≤ 0.143` for `x/q ≥ 11 811` (lines 314–325), in each `φ(q)/q` replaceable by
`∏_{p ∣ q}(1 + 1/p)^{−1}`; stated for `⟨S⟩` with `w_S` and `q_S`. The source prints `0.78` in the
first row, `5/16` from `687`, and `5/38` from `882` and `1/7` from `11 811`; its proof gives
`0.320` from `687` ((9.1), line 1108), `0.320` from `882` and `0.143` from `11 811` (Lemma 8.3, lines
1086–1087), and `0.784` in the first row once its Lemma 7.4 is read at real arguments (Layer 0.7).
The printed rows are not proved by the source and are not stated. Route (the source's §9): the bound
`|m_q(x)| ≤ Σ_{d ∣ q} (μ²(d)/d) Σ_{w ≤ √(x/d)} |m(x/(dw²))|/w²` from Lemma 1.9, and for a row `c`
from `a` the bound `Σ_{w ≤ √y} |m(y/w²)|/w² ≤ c/log y` (resp. `c/(1 + log y)`) for every real
`y ≥ a`, applied at `y = x/d ≥ x/q`, so that the left side is at most `c ∏_{p ∣ q}(1 − 1/p²) ≤ c`;
that bound on the sum over `w` holds beyond `3.3·10^7` by the analytic argument of Lemmas 7.4 and
8.3 from the rows of 2.3 for `m` (with the corrected thresholds of 2.3), and up to
`3.3·10^7` it is the instance of *MoebiusDivStarRangeVerified*. Prove the earlier
`|m_q(x)| ≤ 2 (q/φ(q))/log(x/q)` for `1 ≤ q < x` (`ramare2014aa` lines 74–81, Theorem 1.1) as a
corollary.

Prove Bordellès' complement: for naturals `k, m ≥ 1` and real `x ≥ k^m`,
`|m_k(x)| < (k/φ(k)) C_m/log²(e x k^{−m})` with `C_m = 1100(1 + 4e^{−1} √ζ(m + 1/2))²`
(`bordelles2015` lines 88–100, Theorem 2; `⌈C₁⌉ = 12 555`, `⌈C₁₀⌉ = 6723`).

State de Camargo's `|m_q(x)| ≤ 0.3055 (q/φ(q))/log(x/q)` for every natural `q ≥ 2` and real `x > q`
(`deCamargo2025`, Math. Comp. 95, uncertified; optimal to three decimals) as the same theorem with
that constant under its own direct-verification proposition. The case `q = 1` is excluded: there the
bound fails, and the `q = 1` statements are those of 2.3.

*Needs:* 0.2; 2.3; Layer 0.7 (*MoebiusDivStarRangeVerified*).

### 2.5 The tail of `Σ μ(d)/d²`

Prove that for every real `D ≥ 1`, `|Σ_{d > D} μ(d)/d²| ≤ 1/D` (`trevino2015jnt`, Claim 3.1,
uncertified), where `Σ_{d > D} μ(d)/d² = 6/π² − Σ_{d ≤ D} μ(d)/d²` (`hasSum_zeta_two` and
`Σ μ(d)/d² = 1/ζ(2)`). Route: Abel summation `Σ_{d > D} μ(d)/d² = −M(D)/D² + 2 ∫_D^∞ M(t) dt/t³`
with MacLeod's `|M(t)| ≤ t/80` for `t ≥ 1119` (1.2), which gives `3/(80 D) ≤ 1/D` for `D ≥ 1119`;
for `4 ≤ D < 1119` Moser–MacLeod's form below gives it, since `1/(3D) + 8/(3D²) ≤ 1/D` there, and
on `[1, 4)` the tail is constant on each `[N, N + 1)`, so the three rational inequalities
`|6/π² − Σ_{d ≤ N} μ(d)/d²| ≤ 1/(N + 1)`, `N = 1, 2, 3`, settled like those below, finish it (the
trivial bound `Σ_{d > D} 1/d²` does not suffice: it exceeds `1/D` whenever `{D}` is close to `1`).

Prove Moser–MacLeod's sharper form: for every real `D ≥ 2`,
`|Σ_{d > D} μ(d)/d²| ≤ 1/(3D) + 8/(3D²)` (`moserMacLeod1966` (8), line 76, as restated at `trevino2015ijnt` lines 276–278). Route:
the same Abel summation with MacLeod's all-`x` bound `|M(t)| ≤ (t + 1)/80 + 11/2` of 1.2 gives
`|Σ_{d > D} μ(d)/d²| ≤ 3/(80 D) + 11.025/D²`, which is at most `1/(3D) + 8/(3D²)` exactly when
`D ≥ 28.25…`; on `[2, 29)` the tail is constant on each `[N, N + 1)` and the bound decreases, so the
27 inequalities `|6/π² − Σ_{d ≤ N} μ(d)/d²| ≤ 1/(3(N + 1)) + 8/(3(N + 1)²)`, `2 ≤ N ≤ 28`, finish it;
they are rational inequalities in `π²`, settled by Mathlib's `Real.pi_gt_d6` and `Real.pi_lt_d6`.
This form is the input of Layer 7.7.

*Needs:* 1.2; `hasSum_zeta_two`; `Real.pi_gt_d6`; `Real.pi_lt_d6`.

### 2.6 The logarithmic sum with the sharper prime inputs of Ramaré–Zuniga Alterman

Prove Ramaré–Zuniga Alterman's Corollary 1.2 (`ramareZunigaAlterman2025`): for every real
`X ≥ 617 990`, `|m(X)| ≤ (0.010032 log X − 0.0568)/log² X`, from Theorem 1.1 of 1.10 through
Balazard's inequality of 2.2 (the leading constant is `(3/2)·0.006688`), with
*MoebiusAbsIntegralLE* `1 798 118 216 378 740`, for `X ≥ 1.5·10^7`; on `[617 990, 1.5·10^7)` the
bound is *MoebiusDivRangeVerified* (Layer 0.7), and the full statement is
the conjunction. It is the strongest refereed `m`-bound of `1/log x` type from `617 990` on.

*Needs:* 1.10; 2.2; Layer 0.7 (*MoebiusAbsIntegralLE*, *MoebiusDivRangeVerified*).

### Dependencies

Layer 0; Layer 1 (1.1, 1.2, 1.3, 1.4, 1.5, 1.7 for the range of Theorem 1.2 beyond `10^{19}` in
2.3, and 1.10 for 2.6); AnalyticNumberTheoryPartI §3.12
(qualitative coprime sums, cited only). Within the layer, 2.3 and 2.6 use 2.2, and 2.3 uses
neither 2.6 nor 1.10, which rests on 2.3 through 7.2.

## Layer 3: the logarithmically weighted sum `m̌(x)`

### 3.1 The identity and the integral bound

Prove Ramaré's identity (`ramare2015mc` lines 652–689, Lemma 3.2, with the sign of `h'` as
corrected by `ramare2015corr` lines 13–19, and with the middle coefficient as it follows from the
source's own intermediate identity, line 661, substituted into Balazard's identity): for `x ≥ 1`,

    m̌(x) − 1 = (6 − 8γ)/(3x) − (5 − 4γ)/x² + (6 − 4γ)/(3x⁴) + (1/x) ∫_1^x M(x/t) h'(t) dt

with `h'(t) = (3/2 − γ) ε₁'(t) − g'(t)`, `g(x) = −1/(12x) + x ε_{6,0}(x)` as defined at line 663
(`g(1) = 1/2 − γ`), and `|t² h'(t)| ≤ 7/4 − γ` (line 657, (3.6), from `0 ≤ t² ε₁' ≤ 1` and
`|t² g'(t)| ≤ 1/4`, line 688; the printed middle coefficient `6 − 4γ` gives the value `−2` at
`x = 1`, where the left side is `−1`, and `5 − 4γ` is the value the derivation yields). Since
`x` times the polynomial part, `(6 − 8γ)/3 − (5 − 4γ)/x + (6 − 4γ)/(3x³)`, lies in
`[−1.0712, 0.4608]` for every `x ≥ 1` (its minimum `−1.07115` is at `x = 1.1711`), this gives Theorem 1.4
(`abs_moebiusLogSum_sub_one_le`): for `x ≥ 1`,

    |m̌(x) − 1| ≤ ((7/4 − γ)/x²) ∫_1^x |M(t)| dt + 2/x

(lines 155–163). Route: Balazard's identity for `m` (1.1), the Euler–Maclaurin expansion of
`Σ_{n ≤ y} log(y/n)/n` with the Bernoulli-periodic remainder `ε_{6,0}` (lines 577–651, Lemma 3.1),
and the bound `|t² h'(t)| ≤ 7/4 − γ` at every non-integer `t > 0`, from `0 ≤ t² ε₁'(t) ≤ 1` (1.1)
and `|t² g'(t)| ≤ |{t}² − {t} + 1/12| + (1/6)/2 ≤ 1/4` (line 688, with `|B₂(v)| ≤ 1/6`). The
positivity `h' ≥ 0` of the source's (3.6), line 657, concerns the uncorrected sign
`(3/2 − γ) ε₁' + g'` and is not used: with the corrected sign only the two-sided bound holds, and
it is all Theorem 1.4 needs.

Prove the derived theorem: if `|M(t)| ≤ ε(t) t` on `[t₀, x]` with `ε` nonincreasing and
`∫_1^{t₀} |M(t)| dt ≤ I`, then `|m̌(x) − 1| ≤ (7/4 − γ)(I/x² + ∫_{t₀}^x ε(t) t dt/x²) + 2/x`.

*Needs:* 1.1; Layer 0.1; `Polynomial.bernoulli` (`B₂`, `B₄`); Layer 0.7 (*MoebiusAbsIntegralLE*).

### 3.2 Thresholded bounds for `m̌(x)`

Prove the corrected Theorem 1.5: `|m̌(x) − 1| ≤ 0.00140/log x` for `x ≥ 9950`, and
`|m̌(x) − 1| log x ≤ 0.213` for `x ≥ 2`, `≤ 0.0203` for `x ≥ 16`, `≤ 1/396` for `x ≥ 3162`,
`≤ 1/714` for `x ≥ 9549` (`ramare2015corr` lines 20–31; the superseded `0.00257/log x` from `3846`
and `1/389` from `3155` of `ramare2015mc` lines 169–178 are not stated), with the first row's range
corrected from the printed `x ≥ 1` (line 28) to `x ≥ 2`: on `[1, 2)` the sum has the single term
`n = 1`, `m̌(x) = log x`, and `(1 − log x) log x` exceeds `0.213` on `(1.3602, 1.9984)` and reaches
`1/4` at `x = √e`; so `|m̌(x) − 1| log x ≤ 1/4` for every `x ≥ 1`, with equality at `√e`. And
Corollary 1.6:
`|m̌(x) − 1| ≤ 1` for `x ≥ 1`, `1/125` for `x ≥ 7`, `1/500` for `x ≥ 44`, `1/1250` for `x ≥ 222`
(`ramare2015mc` lines 179–190, unchanged by the corrigendum, line 32).

The first bound is the conjunction of three ranges, under the hypotheses each names.

- `9950 ≤ x ≤ 1.2·10^7`: *MoebiusLogRangeVerified* `(x ↦ 0.00140/log x) 9550 24 832` and the rows
  `0.0218/√x` on `[24 832, 340 000]` and `0.0192/√x` on `[340 000, 1.2·10^7]` of its Lemma 10.2
  instances (Layer 0.7). The source takes Lemma 10.2 from `18 100` on, but `0.0218/√x` is below
  `0.00140/log x` only from `x = 24 832`.
- `1.2·10^7 ≤ x ≤ 4·10^{11}`: Ramaré's route, under *MoebiusAbsIntegralLE* `464 402 30 016 365`
  (Lemma 2.3 of the source). It also uses the bound of 1.5 for `D ≥ 1 078 853` and, on
  `[464 402, 1 078 853]`, the instance `(D ↦ 0.0130 D/log D, 97 067, 1 078 853)` of
  *MoebiusRangeVerified* (Layer 0.7); call the resulting bound for `|M(D)|` on `D ≥ 464 402` `b(D)`.
  Split the integral term of the identity of 3.1 at `t = x/464 402`. The part beyond is at most
  `(7/4 − γ)·30 016 365/x²`. The part below is at most `(1/x) ∫_1^{x/464 402} b(x/t) |h'(t)| dt`,
  with `|h'|` itself as the weight. With `1.0712/x` for the polynomial part, the sum stays below
  `0.00140/log x` for `16.3 ≤ log x ≤ 26.8`.
- `x ≥ 4·10^{11}`: the derived theorem of 3.1. While `log x ≤ 2.5·10^7` it takes Chirre–Helfgott's
  `|M(t)| ≤ 3t/(π·10^{10}) + 11.39 √t` of 1.7, under its hypotheses, with `t₀ = 1` and `I = 0`. Once
  `log x ≥ 153 452` it takes El Marraki's `|M(t)| ≤ 362.7 t/log² t` of 1.4, with `t₀ = e^{100}` and
  `I = e^{200}/2` from `|M(t)| ≤ t`. The first rests on a preprint; Ramaré's route does not reach
  this range.

The source's chain for the analytic range (`ramare2015corr` lines 207–236, through `ramare2015mc`
Lemma 4.2, lines 734–744) has the two defects of the chain of 2.3. First, it bounds the part
beyond by `(7/4 − γ)·15 512 101/x²`, where `15 512 101` is the integral of `M` over `{M ≥ 0}`
only. Second, it replaces the sum over unit intervals that its Lemma 4.1 controls
(`∫_n^{n+1} |h'| ≤ 0.310 ∫_n^{n+1} dt/t²`, `ramare2015corr` lines 122–206) by an integral of the
bound taken at `x/(t + 1)`. That integral is smaller than the term. As `x → ∞` the term times
`log x` tends to `0.0130 J = 0.002098`, with `J = ∫_1^∞ |h'(t)| dt/t = 0.16137`, against the source's
`0.310·0.0146(1 − log 2) = 0.001389`. Since `0.002098 > 0.00140`, the route through the bound of 1.5
alone does not reach every `x`. Each other row is the conjunction of the first bound beyond `9950`
and *MoebiusLogRangeVerified* on its initial range.

*Needs:* 3.1; 1.5; 1.4 (El Marraki's `362.7 x/log² x`); 1.7 (Chirre–Helfgott's bound for `M`, with
its hypothesis *ZetaResidueSumVerified*); Layer 0.7 (*MoebiusAbsIntegralLE*,
*MoebiusRangeVerified*, *MoebiusLogRangeVerified*).

### 3.3 Coprime positivity and the mollified logarithmic sum

Prove Ramaré's Corollary 1.10 for every natural `q ≥ 1` and real `x ≥ 1`:
`0 ≤ m̌_q(x) ≤ 1.00303 q/φ(q)` (`ramare2015mc` lines 278–285), from Lemma 1.9 for `m̌` (lines
264–265: the same decomposition with `m̌` in place of `m`), the positivity `m̌(y) ≥ 0` for `y ≥ 1`
(Balazard's theorem `0 ≤ m̌(x) ≤ m̌(30)` for `x ≥ 1`, cited at lines 284–285 and proved here from
Theorem 1.4 beyond the source's `D₀` and *MoebiusLogRangeVerified* below), and
`Σ_{a ∣ q^∞} 1/a = q/φ(q)`. Stated for
`⟨S⟩` with `w_S`. The optimal constant is `m̌(30) = 1.00302…`.

Prove Ramaré's mollified log-weighted bound: for `r ≥ 1` and `0 ≤ ε ≤ 1.38`,
`|Σ_{d ≤ x, (d, r) = 1} μ(d) log(x/d)/d^{1+ε}| ≤ 1.4 + 4.7ε + 3.3ε² + (1 + ε)(r^{1+ε}/φ_{1+ε}(r)) x^ε`
(`ramare2013facm` lines 54–62, Theorem 1.2), with `r^{1+ε}/φ_{1+ε}(r) = ∏_{p ∣ r}(1 − p^{−1−ε})^{−1}`.

*Needs:* 0.2; 2.1; 3.1 (`0 ≤ m̌(y) ≤ m̌(30)` for `y ≥ 1`, which is proved here from Theorem 1.4
beyond `x₀` and *MoebiusLogRangeVerified* below).

### 3.4 Decaying bounds for `m̌(x) − 1` and its extremal value

State Daval's Théorème B (`daval2025`, uncertified, with the constants of its arXiv version):
`|m̌(x) − 1| ≤ 0.162/log² x` for every real `x ≥ 3`, `≤ 8.55·10^{−6}/log x` for `x ≥ 2.5·10^{11}` and
`≤ 1/9 780 919` for `x ≥ 2.5·10^{12}`, from the identity of 3.1, the conversion of 2.2 in Daval's form
and the bounds of 2.3, with the intermediate ranges `|m̌(x) − 1| ≤ 0.16/√x` on `[10^9, 10^{16}]` and
`≤ 7.1/√x` on `[10^{16}, 10^{21}]` of the same source, which rest on
`MoebiusTableVerified 0.571 10^{16}`.
Prove the extremal value: `sup_{x ≥ 1} (log² x)|m̌(x) − 1| = 2(2 − log 2)³/27 = 0.165327…`, attained at
`x = exp((4 − 2 log 2)/3) = 2.38986…`. Route: on `[1, 2)`, `m̌(x) = log x` and `u²(1 − u) ≤ 4/27` with
`u = log x`; on `[2, 3)`, `m̌(x) = (log x + log 2)/2` and `u²(2 − log 2 − u)/2` is maximal at
`u = 2(2 − log 2)/3`; from `3` on, Daval's first row gives at most `0.162 < 0.165327`.

*Needs:* 3.1; 2.2; 2.3; Layer 0.7 (`MoebiusTableVerified`, *MoebiusLogRangeVerified*).

### Dependencies

Layer 0; Layer 1 (1.1, 1.5, and 1.4 and 1.7 for the range of Theorem 1.5 beyond `4·10^{11}` in
3.2); Layer 2 (2.1, 2.2, 2.3).

## Layer 4: character twists

### 4.1 The logarithmic Möbius sum twisted by a Dirichlet character

Prove: for a natural `q ≥ 1`, a Dirichlet character `χ : DirichletCharacter ℂ q` with `χ ≠ 1`, a
real `P ≥ 0` with *PolyaVinogradovBound* `χ P` (`|Σ_{n ≤ N} χ(n)| ≤ P` for every natural `N`), and
every real `x ≥ 1`,

    |Σ_{n ≤ x} μ(n) χ(n)/n| ≤ (1 + 2P)/|L(1, χ)|,

and for every natural `k ≥ 1`,

    |Σ_{n ≤ x, (n, k) = 1} μ(n) χ(n)/n| ≤ (k/φ(k)) (1 + 2P)/|L(1, χ)|.

Route: `L(1, χ) = Σ_m χ(m)/m` (convergent, `DirichletCharacter.LFunction` at `1` for `χ ≠ 1`), the
convolution identity `Σ_{n ≤ x} (μχ)(n)/n · Σ_{m ≤ x/n} χ(m)/m = Σ_{N ≤ x} ((μχ) ⋆ χ)(N)/N = 1` (since
`(μχ) ⋆ χ = δ` for completely multiplicative `χ`), so that
`L(1, χ) Σ_{n ≤ x} μ(n)χ(n)/n = 1 + Σ_{n ≤ x} (μ(n)χ(n)/n) Σ_{m > x/n} χ(m)/m`, and the tail bound
`|Σ_{m > y} χ(m)/m| ≤ 2P/y` for `y > 0` by Abel summation from *PolyaVinogradovBound*; the sum over
`n ≤ x` of `(1/n)(2P n/x)` is `2P ⌊x⌋/x ≤ 2P`. The coprime form is the decomposition of Layer 0.2
(`bordelles2015` lines 606–625, proof of Proposition 3, Lemma 5:
`Σ_{n ≤ x, (n,k)=1} μχ/n = Σ_{a ≤ x, a ∣ k^∞} (χ(a)/a) Σ_{m ≤ x/a} μ(m)χ(m)/m`), with `|Σ_{a ∣ k^∞} χ(a)/a| ≤ k/φ(k)`. Prove
Bordellès' Proposition 3 as the instance: for `q ≥ 37` and a Pólya–Vinogradov bound with
`P ≤ √q log q − 1/2`, `|Σ_{n ≤ x, (n,k)=1} μ(n)χ(n)/n| ≤ (k/φ(k)) 2√q log q/|L(1, χ)|`
(`bordelles2015` lines 105–107; the underlying inequality is `bordelles2005`, page 4, uncertified).
No Pólya–Vinogradov inequality is proved here: `P` is a parameter, discharged by the character-sums
roadmap, whose explicit forms (for primitive `χ` a bound valid for every modulus `q > 1`,
with leading constants `2/π²` for even and `1/(2π)` for odd `χ`) are the instances to plug in;
for primitive `χ` they imply Proposition 3's `P ≤ √q log q − 1/2` for every `q ≥ 37`. The denominator
`|L(1, χ)|` stays a parameter: a lower bound uniform in `q` would follow for real `χ` from the
exclusion of exceptional zeros, but no numerical constant for it is in print (zero-free inputs,
above).

*Needs:* `DirichletCharacter.LFunction_apply_one_ne_zero`; `DirichletCharacter.LFunction`;
`sum_mul_eq_sub_sub_integral_mul`; Layer 0.2; *PolyaVinogradovBound*.

### Dependencies

Layer 0.2; Mathlib `DirichletCharacter.LFunction`, `LFunction_apply_one_ne_zero`.

## Layer 5: the convolution method

### 5.1 The comparison theorem

Prove Ramaré's comparison lemma (`ramare1995` lines 339–354, Lemma 3.2, pp. 656–657, legible on
the Numdam scan), for a general exponent `α > 0` in place of the source's `1/3`
(`norm_sum_mul_sub_le_comparison`): let `h, k : ArithmeticFunction ℂ` and `g = h ⋆ k` (Dirichlet
convolution), let `H(s) = Σ h(n) n^{−s}` and
`H̄(s) = Σ |h(n)| n^{−s}`, and assume `H̄(−α) < ∞` (so `H̄` converges on `s ≥ −α`) and that there
are constants `A, B, C ∈ ℂ` and `D ∈ ℝ` with `Σ_{n ≤ t} k(n) = A log² t + B log t + C + O*(D t^{−α})`
for every real `t > 0`. Then for every real `t > 0`,

    Σ_{n ≤ t} g(n) = u log² t + v log t + w + O*(D t^{−α} H̄(−α)),
    u = A H(0),  v = 2A H'(0) + B H(0),  w = A H''(0) + B H'(0) + C H(0),

with `H(0) = Σ h(n)`, `H'(0) = −Σ h(n) log n`, `H''(0) = Σ h(n) log² n` (Layer 0.6). Route:
`Σ_{n ≤ t} g(n) = Σ_m h(m) Σ_{n ≤ t/m} k(n)`, valid for all `m` because the hypothesis on `k` holds
for every `t/m > 0` (no truncation at `m ≤ t` is needed), then
`log²(t/m) = log² t − 2 log t log m + log² m` and `|h(m)| (t/m)^{−α}` summed is `t^{−α} H̄(−α)`. The source's lemma is the instance
`α = 1/3`; the instance `α = 2/5` is the one fed by the Platt–Trudgian model of 5.2
(`plattTrudgian2018` Lemma 1), which gives smaller constants wherever `H̄(−2/5) < ∞` (Layer 7.6).

Prove the weighted variant: under the same hypotheses and `α < 1`, for `t > 0`,

    Σ_{n ≤ t} n g(n) = U t log t + V t + O*(((2 − α)/(1 − α)) D t^{1−α} H̄(−α)),
    U = 2A H(0),  V = 2A H'(0) + B H(0) − 2A H(0),

by Abel summation `Σ_{n ≤ t} n g(n) = t S(t) − ∫_0^t S(u) du` with `S(u) = Σ_{n ≤ u} g(n)`
(`S = 0` on `(0, 1)`, and the asymptotic for `S` holds on all of `(0, ∞)`): the polynomial part
integrates to `u(t log² t − 2t log t + 2t) + v(t log t − t) + wt`, which cancels against
`t(u log² t + v log t + w)` except for `2u t log t + (v − 2u) t`, and the remainder is
`t · D t^{−α} + ∫_0^t D u^{−α} du = (1 + 1/(1 − α)) D t^{1−α}`, each times `H̄(−α)`; at `α = 1/3` the
factor is `2.5`, at `α = 2/5` it is `8/3`. The constant term `W` of the source's display is not
asserted: it is below the error term. The 1995 page prints `U = A H(0)`; the value `U = 2A H(0)` is
the one the computation gives (`trudgian2015` Lemma 15 states it so).

*Needs:* Layer 0.6; `sum_mul_eq_sub_integral_mul₀`; absolute convergence of `Σ h(m) (t/m)^{−α}`.

### 5.2 The models: the harmonic sum and the Dirichlet-divisor sum

Prove the harmonic model: `Σ_{n ≤ t} 1/n = log t + γ + O*(0.9105 t^{−1/3})` for every `t > 0`
(Layer 0.3; the model `k = 1/n` with `A = 0`, `B = 1`, `C = γ`, `D = 0.9105`).

Prove the Dirichlet-divisor model in three forms, with `P(t) = ½ log² t + 2γ log t + γ² − 2γ₁`:
for every real `t ≥ 1`,

    Σ_{n ≤ t} τ(n)/n = P(t) + O*(1.16 t^{−1/3});

for every real `t > 0`, `Σ_{n ≤ t} τ(n)/n = P(t) + O*(1.641 t^{−1/3})`, the form the comparison
theorem 5.1 consumes at `α = 1/3`; for every real `t ≥ 2`,
`Σ_{n ≤ t} τ(n)/n = P(t) + O*(1.001 t^{−1/2})`, the form Layer 7.5 consumes; and for every real
`t > 0`, `Σ_{n ≤ t} τ(n)/n = P(t) + O*(1.0503 t^{−2/5})` (`plattTrudgian2018` Lemma 1), the form 5.1
consumes at `α = 2/5`. The fourth is proved from the third on `[2, ∞)` (where
`1.001 t^{−1/2} ≤ 1.0503 t^{−2/5}`), by direct evaluation on `[1, 2)` (where the sum is `1`), and on
`(0, 1)` from the computation `sup_{0 < t < 1} |P(t)| t^{2/5} = 1.050286…` (at `t = e^{−6.228…}`),
which is where the constant `1.0503` comes from; it dominates the second form for every `t ≥ 1`
(`1.0503 t^{−2/5} ≤ 1.641 t^{−1/3}`). The first is `berkaneBordellesRamare2012` Corollary 2.2 (lines
182–189), with two corrections: its printed constant term `γ² − γ₁` is a misprint for `γ² − 2γ₁`
(the Laurent expansion `ζ(1 + s)² = 1/s² + 2γ/s + (γ² − 2γ₁) + …` settles it; `trudgian2015` lines
426–432, Lemma 14, quotes the corollary with `γ² − 2γ₁`), and its printed range "for all `t > 0`"
holds only for `t ≥ 1`: on `(0, 1)` the sum is empty and `|P(t)|` exceeds `1.16 t^{−1/3}`. The
second follows from the first on `[1, ∞)` and from the computation
`sup_{0 < t < 1} |P(t)| t^{1/3} = 1.64082…` (at `t = e^{−7.216}`); the constant `1.641` is
Riesel–Vaughan's (`rieselVaughan1983` Lemma 1, uncertified; `cullyHugillTrudgian2021` lines 193–195
records that `1.16` must be replaced by it on `t > 0`, and `ramare1995` lines 356–360, Lemma 3.3
second part, cites the same lemma). The third is `cullyHugillTrudgian2021` (14), lines 197–199, by
Riesel–Vaughan's method (`rieselVaughan1983` pp. 48–50, uncertified) for `t ≥ 6·10^5` and
*DivisorPowerRangeVerified* (Layer 0.7) on `[2, 6·10^5)`.

The first two forms are the headline statement `sum_tau_div_model`: under the bound
`|Δ(x)| ≤ 0.961 √x` for every real `x ≥ 1` of Layer 7.4, ExplicitPrimeCounting §1.6's
*EulerGammaEnclosure* and `StieltjesGammaOneEnclosure`, the first form holds for every real `t ≥ 1`
and the second for every real `t > 0`. Route (`berkaneBordellesRamare2012` lines 1125–1159, the
proof of Corollary 2.2): integration by parts of `Σ_{n ≤ t} τ(n) = t log t + (2γ − 1) t + Δ(t)`
against `1/n` gives the exact identity `Σ_{n ≤ t} τ(n)/n = P(t) + Δ(t)/t − ∫_t^∞ Δ(u) du/u²` for
`t ≥ 1`, the constant term being the limit `lim (Σ_{n ≤ t} τ(n)/n − ½ log² t − 2γ log t)`, computed
from `Σ_{n ≤ t} τ(n)/n = Σ_{d ≤ t} (1/d) Σ_{m ≤ t/d} 1/m`, the harmonic remainder twice and the
definition of `γ₁` in Layer 0.5; with `|Δ(u)| ≤ 0.961 √u` the remainder is at most
`3·0.961 t^{−1/2}`, and `3·0.961 t^{−1/6} ≤ 1.16` exactly for `t ≥ 235.7`; on `[1, 236]` the step
function `Σ_{n ≤ N} τ(n)/n` is compared with `P(t)` on each `[N, N + 1)`, at both ends and at the
interior extremum of `|Σ_{n ≤ N} τ(n)/n − P(t)| t^{1/3}`, with the two enclosures; the second form
then follows on `(0, 1)` from `sup_{0 < t < 1} |P(t)| t^{1/3} = 1.64082…`, again with the
enclosures.

Wherever `γ₁` is used numerically, `StieltjesGammaOneEnclosure` is the hypothesis
(`γ₁ = −0.0728158454836767248605863758749013191377 + O*(10^{−40})`, line 189, (2.2), citing
`kreminski2003`).

*Needs:* Layer 0.3; Layer 0.5 (`γ₁`); AnalyticNumberTheoryPartI §3.23a (`divisorError`); Layer 7.4
(`|Δ(t)| ≤ 0.961 √t`, which depends only on Layer 0 and that section); ExplicitPrimeCounting §1.6
(*EulerGammaEnclosure*); `sum_mul_eq_sub_sub_integral_mul`; Layer 0.7
(`StieltjesGammaOneEnclosure`; *DivisorPowerRangeVerified*, for the third and fourth forms).

### 5.3 The second model

Prove: for `h : ℕ → ℂ` and `c ∈ [1, 2]` with `H̄(c) < ∞`, and every real `t > 0`,

    Σ_{n ≤ t} Σ_{d ∣ n} (n/d) h(d) = (t²/2) H(2) + O*(t^c H̄(c)/2)

(`ramare2016mc` lines 539–543, Lemma 4.3 together with the scheme of Lemma 3.2 of `ramare1995`).
Route: the left side is `Σ_{d ≤ t} h(d) Σ_{q ≤ t/d} q`, Layer 0.4 gives
`Σ_{q ≤ y} q = y²/2 + O*(y^c/2)`, the main terms sum to `(t²/2)(H(2) − Σ_{d > t} h(d)/d²)`, and
`|Σ_{d > t} h(d)/d²| ≤ t^{c−2} Σ_{d > t} |h(d)|/d^c` because `d^{c−2} ≤ t^{c−2}` for `d > t` and `c ≤ 2`; the two error
terms add to `(t^c/2) H̄(c)`.

*Needs:* Layer 0.4; absolute convergence.

### 5.4 Beyond the main term: the hyperbola refinement

Prove Akhilesh–Ramaré's Theorem 1.3: let `g : ℕ → ℂ` with `Σ g(m)/m` and `Σ g(m) (log m)/m`
convergent, `G♯(x) = Σ_{m > x} g(m)/m`, and `∫_1^∞ |G♯(t)| dt/t < ∞`; let `A₀ ≥ 1`. Then for
`D ≥ 1`,

    Σ_{n ≤ D} (g ⋆ 1)(n)/n = Σ_{m ≥ 1} (g(m)/m)(log(D/m) + γ) + ∫_{D/A₀}^∞ G♯(t) dt/t + O*(ℛ),
    ℛ = |Σ_{1 ≤ a ≤ A₀} G♯(D/a)/a + G♯(D/A₀)(log(A₀/⌊A₀⌋) − R₁(⌊A₀⌋))| + (6/(11D)) Σ_{m ≤ D/A₀} |g(m)|,

with `R₁` the harmonic remainder of Layer 0.3 (`akhileshRamare2017` lines 135–171, Theorem 1.3 and
Lemma 2.1), and Theorem 1.4: for every real `η ≥ 1`,

    Σ_{n ≤ D} (g ⋆ 1)(n)/n = Σ_{m ≥ 1} (g(m)/m)(log(D/m) + γ) + ∫_{ηD}^∞ G♯(t) dt/t
                              − (γ − log η) G♯(ηD) + O*((γ/D) Σ_{m ≤ ηD} |g(m)|),

with `6/11` in place of `γ` when `η = 1` (lines 202–224). Route:
`Σ_{n ≤ D} (g ⋆ 1)(n)/n = Σ_{m ≤ D} (g(m)/m) Σ_{k ≤ D/m} 1/k`, the harmonic remainder `R₁(D/m)` of Layer 0.3 with its two
constants, and the finite hyperbola splitting at `D/A₀` with Abel summation of
`Σ_{m > D/A₀} (g(m)/m) R₁(D/m)` through `G♯`.

*Needs:* Layer 0.3; Abel summation; Layer 0.1.

### 5.5 The explicit Levin–Fainleib theorem

Prove (Ramaré 2009, Theorem 21.1, `ramare2009`, uncertified): let `g ≥ 0` be multiplicative, and
suppose there are `κ ≥ 0`, `L ≥ 0`, `A ≥ 0` with

    |Σ_{p^ν ≤ Q} g(p^ν) log p^ν − κ log Q| ≤ L  for every real Q ≥ 1,
    Σ_p Σ_{ν ≥ 1, k ≥ 1} g(p^k) g(p^ν) log p^ν ≤ A.

Then for every real `D ≥ exp(2(L + A))`,

    Σ_{d ≤ D} g(d) = C (log D)^κ (1 + O*(B/log D)),
    B = 2(L + A)(1 + 2(κ + 1) e^{κ + 1}),  C = Γ(κ + 1)^{−1} ∏_p (Σ_{ν ≥ 0} g(p^ν)) (1 − 1/p)^κ,

the product converging absolutely under the two hypotheses. Route: the Levin–Fainleib differential
inequality `Σ_{d ≤ D} g(d) log d = Σ_{m ≤ D} g(m) Σ_{p^ν ≤ D/m, p ∤ m} g(p^ν) log p^ν`, the two
hypotheses bounding the inner sum by `κ log(D/m) + O*(L + A)`, and the resulting integral inequality
for `G(D) = Σ_{d ≤ D} g(d)` solved explicitly (the source's proof); the identification of `C`
through the Dirichlet series `Σ g(d) d^{−s} = ζ(s)^κ · (holomorphic at 1)` and `Γ(κ + 1)` as the
residue normalisation. This refines SieveMethodsAndPrimePatterns §1.1 (the asymptotic
`∼ (log z)^κ/(Γ(κ + 1) H_g)`) with explicit constants; the hypothesis on the prime sums is the
two-sided form of *HasLogSieveDimension* `(P, g, κ, L)` of its §0.5 extended to prime powers.

*Needs:* Layer 0.6 (the Euler product of `C`); Abel summation; `Real.Gamma`; the uncertified source
by locator.

### 5.6 The convolution method at the critical exponent

State Zuniga Alterman's comparison theorem for square-free supported sums (`zunigaAlterman2022`
Theorem 3.3, by its locator): for `q ≥ 1`, real `X > 0`, reals `β > α > 1/2` with `β > 1`, a
multiplicative `f` with `f(p) = p^{−α} + O(p^{−β})` over the primes `p ∤ q`, and
`max(0, α − 1) < δ < min(β − 1, α − 1/2)`,
`Σ_{ℓ ≤ X, (ℓ, q) = 1} μ²(ℓ) f(ℓ) = F^q_α(X) + O*(Δ^δ_α κ_{α−δ}(q) q^{δ−α} H̄^q_f(−δ) X^{−δ})`, with
the main
term `F^q_α` and the constant `Δ^δ_α` of the source (for `α = 1` and `f(p) ≠ −1`,
`F = H(0)(φ(q)/q)(log X + T + γ + Σ_{p ∣ q} log p/(p − 1))`). It is 5.1 pushed to the largest exponent
the square-free support allows. Prove its instances (Corollary 3.4): with
`κ(q) = q ∏_{p ∣ q}(1 + 1/p)`, for every `q ≥ 1` and every real `X > 0`,

    Σ_{ℓ ≤ X, (ℓ, q) = 1} μ²(ℓ)/φ(ℓ) = (φ(q)/q)(log X + a_q) + O*(7.36 A_q X^{−1/3}),
    Σ_{ℓ ≤ X, (ℓ, q) = 1} μ²(ℓ)/ℓ = (6/π²)(q/κ(q))(log X + b_q) + O*(2.554 B_q X^{−1/3}),

with `a_q = c₀ + Σ_{p ∣ q} log p/p`, `b_q = C₂ + Σ_{p ∣ q} log p/(p + 1)` (`c₀`, `C₂` of 7.2),
`A_q = ∏_{p ∣ q}(1 + (p − p^{1/3} − 2)/((p − 1)p^{2/3} + p^{1/3} + 1))` and
`B_q = ∏_{p ∣ q}(1 + (p^{2/3} − 1)/(p^{4/3} + 1))`. Route: 5.1 at `α = 1/3` with the coprimality
built into the perturbation `h`. The first line is a coprime form of ExplicitCharacterSumsAndSieves
§5.1's `selbergDiagonal`, valid for every `X > 0`.

*Needs:* 5.1; Layer 0.6; Layer 0.7 (*ArithmeticalConstantsEnclosure*); 7.2 (`c₀`, `C₂`).

### Examples

- The model `g = h ⋆ (τ/n)` for `g = 2^ω/n`: the Dirichlet series of `2^ω/n` is
  `ζ(s + 1)²/ζ(2s + 2)`, so `h` is the coefficient sequence of `1/ζ(2s + 2)`: `h(n) = μ(√n)/n` on
  squares, `0` otherwise; `H(0) = 6/π²`, `u = (1/2)(6/π²) = 3/π²`, as in Layer 7.6.

### Dependencies

Layer 0 (0.3–0.6); Layer 7.4 (for 5.2, with no circularity: 7.4 depends on Layer 0 only); Layer 7.2
for the constants `c₀`, `C₂` of 5.6; AnalyticNumberTheoryPartI §3.23a (`divisorError`); Layer 0.7
(*DivisorPowerRangeVerified*, for the third form of 5.2); SieveMethodsAndPrimePatterns §§0.5, 1.1
(cited).

## Layer 6: upper bounds for nonnegative multiplicative functions

### 6.1 The product bound

Prove: for a nonnegative multiplicative `f` and real `y ≥ 1`,

    Σ_{n ≤ y} f(n)/n ≤ ∏_{p ≤ y} (1 + Σ_{1 ≤ m ≤ log y/log p} f(p^m)/p^m)
                    ≤ ∏_{p ≤ y} Σ_{m ≥ 0} f(p^m)/p^m   (when each local series converges),

and `Σ_{n ≤ y} f(n) ≤ y Σ_{n ≤ y} f(n)/n`. The product is the Euler product over the `y`-smooth
integers: for a multiplicative `g` with `g(1) = 1` whose local series converge absolutely,
`Σ_{n y-smooth} g(n) = ∏_{p ≤ y} Σ_{m ≥ 0} g(p^m)` (Mathlib
`EulerProduct.summable_and_hasSum_smoothNumbers_prod_primesBelow_tsum`,
`Mathlib/NumberTheory/EulerProduct/Basic.lean`, over `Nat.primesBelow (⌊y⌋ + 1)`), and both
inequalities are this identity with the terms `n > y` dropped, at `g(n) = f(n)/n` for the second and
at its truncation `g(p^m) = 0` for `p^m > y` for the first. Route: every `n ≤ y` is `y`-smooth with
each prime power `p^m ∥ n` satisfying `p^m ≤ y`, so `f(n)/n` is a term of the expanded finite product
(`Nat.equivProdNatFactoredNumbers`, AnalyticNumberTheoryPartI §3.35a's indexing). The Rankin-type
bound `Σ_{n ≤ x} f(n) ≤ x exp(Σ_{p ≤ x} (f(p) − 1)/p)` for multiplicative `f` with
`f(p^ν) = f(p) ≥ 1` is the case `f(p^ν) = f(p)` of `bordelles2012` Theorem 4.28 (restated in 6.4:
there `(1 − 1/p)(1 + Σ_{a ≥ 1} f(p)/p^a) = 1 + (f(p) − 1)/p`) followed by `1 + u ≤ e^u`; it is proved
here, as in 6.4, by applying the first inequality to `h = f ⋆ μ` (`h(p) = f(p) − 1 ≥ 0`,
`h(p^ν) = 0` for `ν ≥ 2`).

*Needs:* `Nat.equivProdNatFactoredNumbers`; `EulerProduct.summable_and_hasSum_smoothNumbers_prod_primesBelow_tsum`;
`Finset.prod_le_prod`; multiplicativity.

### 6.2 The Daboussi–Rivat tail bound

Prove (`daboussiRivat2001` lines 302–360, Lemma 4): let `z ≥ 2`, `f ≥ 0` multiplicative, `v_z` the
indicator of the `z`-smooth integers (`Nat.smoothNumbers`), `S = Σ_{p ≤ z} f(p) log p/(1 + f(p))`,
assume `S > 0`, and put `K(t) = log t − 1 + 1/t` for `t ≥ 1` (line 308). Then for every `y` with
`log y ≥ S`,

    Σ_{n > y} v_z(n) μ²(n) f(n) ≤ (∏_{p ≤ z} (1 + f(p))) exp(−(log y/log z) K(log y/S)),
    Σ_{n ≤ y} v_z(n) μ²(n) f(n) ≥ (∏_{p ≤ z} (1 + f(p))) (1 − exp(−(log y/log z) K(log y/S))),

and for `log y ≥ 7S` the simplified forms with `K` replaced by `K(7) = log 7 − 1 + 1/7` (lines
336–360). Route: Rankin's trick with the weight `(n/y)^α`,
`Σ_n v_z(n) μ²(n) f(n) n^α = ∏_{p ≤ z} (1 + f(p) p^α)`, the convexity bound
`log(1 + f(p) p^α) − log(1 + f(p)) ≤ α log p · f(p) p^α/(1 + f(p) p^α)`, and the optimisation in `α = (1/log z) log(log y/S)` that produces `K`.

*Needs:* `Nat.smoothNumbers`; 6.1; `Real.add_one_le_exp`; `Finset.prod` over `primesBelow`.

### 6.3 The Hall–Tenenbaum theorem

Prove (`sum_le_hall_tenenbaum`; `hallTenenbaum1988`, Theorem 01, uncertified): let `f ≥ 0` be
multiplicative with
`Σ_{p ≤ y} f(p) log p ≤ A y` for every real `y ≥ 0` and `Σ_p Σ_{ν ≥ 2} f(p^ν) log p^ν/p^ν ≤ B`.
Then for every real `x > 1`,

    Σ_{n ≤ x} f(n) ≤ (A + B + 1) (x/log x) Σ_{n ≤ x} f(n)/n.

Route:
`Σ_{n ≤ x} f(n) log n = Σ_{n ≤ x} f(n) Σ_{p^ν ∥ n} log p^ν = Σ_{m ≤ x} f(m) Σ_{p^ν ≤ x/m, p ∤ m} f(p^ν) log p^ν ≤ Σ_{m ≤ x} f(m) (A x/m + B x/m)`, and `Σ_{n ≤ x} f(n) log(x/n) ≤ x Σ_{n ≤ x} f(n)/n`
from `log t ≤ t`; add. Mathlib's `θ(y) ≤ log 4 · y` gives `A = log 4` for `f = 1` on primes.

Prove the Euler-product form valid from `x = 1` (`bordelles2024` Lemma 16): if `f ≥ 0` is
multiplicative and, for every real `x ≥ 2`, `x^{−1} Σ_{p ≤ x} f(p) log p ≤ a₁`, while
`Σ_p Σ_{ν ≥ 2} f(p^ν)/p^ν ≤ a₂` and `Σ_p Σ_{ν ≥ 2} f(p^ν) log p^ν/p^ν ≤ a₃`, then for every real `x ≥ 1`,
`Σ_{n ≤ x} f(n) ≤ e^{a₂}(a₁ + a₃ + 1)(x/log(ex)) exp(Σ_{p ≤ x} f(p)/p)`. Route: the argument above with
`log(x/n) ≤ x/n − 1` in place of `log(x/n) ≤ x/n` (which absorbs the extra `Σ_{n ≤ x} f(n)` into the
weight `log(ex)`), and the product bound of 6.1,
`Σ_{n ≤ x} f(n)/n ≤ ∏_{p ≤ x}(1 + f(p)/p + Σ_{ν ≥ 2} f(p^ν)/p^ν) ≤ e^{a₂} exp(Σ_{p ≤ x} f(p)/p)`.

*Needs:* multiplicativity on coprime factors (`Nat.factorization`); `Real.log_le_sub_one_of_pos`;
`Chebyshev.theta_le_log4_mul_x` (for the instances); 6.1 (for the Euler-product form).

### 6.4 Bordellès' monotone-local-factor bound

Prove (`bordelles2012`, Theorem 4.28 of the 2012 edition, uncertified; the 2020 Advanced Edition
renumbers the chapter): let `f ≥ 0` be multiplicative with
`f(p^{a+1}) ≥ f(p^a)` for every prime `p` and `a ≥ 0` (so `f(p) ≥ 1`), and `Σ_{a ≥ 1} f(p^a)/p^a < ∞`
for every `p`. Then for every real `x ≥ 1`,

    Σ_{n ≤ x} f(n) ≤ x ∏_{p ≤ x} (1 − 1/p)(1 + Σ_{a ≥ 1} f(p^a)/p^a).

Route: `g = f ⋆ μ` has `g(p^a) = f(p^a) − f(p^{a−1}) ≥ 0`, so `g ≥ 0` and
`Σ_{n ≤ x} f(n) = Σ_{d ≤ x} g(d) ⌊x/d⌋ ≤ x Σ_{d ≤ x} g(d)/d ≤ x ∏_{p ≤ x} (1 + Σ_{a ≥ 1} g(p^a)/p^a)`
(6.1), and `1 + Σ_{a ≥ 1} (f(p^a) − f(p^{a−1}))/p^a = (1 − 1/p)(1 + Σ_{a ≥ 1} f(p^a)/p^a)`.

*Needs:* 6.1; `ArithmeticFunction.coe_moebius_mul_coe_zeta`; `Nat.floor_le`.

### 6.5 Coprimality removal (van Lint–Richert)

Prove: for a nonnegative multiplicative `f`, a natural `d ≥ 1` and real `x ≥ 1`,

    Σ_{n ≤ x} μ²(n) f(n) ≤ (∏_{p ∣ d} (1 + f(p))) Σ_{n ≤ x, (n, d) = 1} μ²(n) f(n) ≤ Σ_{n ≤ x·rad(d)} μ²(n) f(n),

where `rad(d) = ∏_{p ∣ d} p` (`vanLintRichert1965` lines 60–90, the inequality of its §1 between
`H(x)` and the coprime sum; the statement is the one the sieve literature attributes to that
paper; the same inequality for every `x ≥ 0` is `ramare1995` Lemma 3.1, p. 656, the legible
locator). Route: write each squarefree `n ≤ x` uniquely as `n = a·m` with `a = gcd(n, d)` (a
squarefree divisor of `d`) and `(m, d) = 1`, `m ≤ x`; then
`Σ_{n ≤ x} μ²(n) f(n) ≤ Σ_{a ∣ rad(d)} f(a) Σ_{m ≤ x, (m, d) = 1} μ²(m) f(m)` and `Σ_{a ∣ rad(d)} f(a) = ∏_{p ∣ d} (1 + f(p))`; conversely every
product `a·m` with `a ∣ rad(d)` and `m ≤ x` coprime to `d` is a squarefree integer `≤ x·rad(d)`,
counted once.

At `f = 1/φ` the factor is `∏_{p ∣ d}(1 + 1/(p − 1)) = d/φ(d)`, and the first inequality is the
coprime comparison `S_d(x) ≥ (φ(d)/d) S(x)` of ExplicitCharacterSumsAndSieves §5.1 for its
`selbergDiagonal` `S`; 6.5 differs in holding for every nonnegative multiplicative `f` and in adding
the upper inequality through `x·rad(d)`.

*Needs:* `Nat.sum_divisors_filter_squarefree`; `Nat.Coprime`; multiplicativity.

### Examples

- 6.5 at `d = 6` with `f = 1/φ`: `Σ_{n ≤ x} μ²(n)/φ(n) ≤ 3 Σ_{n ≤ x, (n, 6) = 1} μ²(n)/φ(n)`, the
  factor `∏_{p ∣ 6}(1 + 1/(p − 1)) = 2·(3/2) = 3`.

### Dependencies

Layer 0; AnalyticNumberTheoryPartI §3.35a; within the layer, 6.3's Euler-product form uses 6.1;
Mathlib `Chebyshev.theta_le_log4_mul_x`, `Nat.smoothNumbers`.

## Layer 7: explicit averages of the classical functions

### 7.1 The squarefree remainder and the elementary bounds for `Σ μ²(n)/n`

Prove the elementary bounds `|R(x)| ≤ √x` for every real `x ≥ 1` and `|R(x)| < √x/2` for `x ≥ 8`
(`moserMacLeod1966` lines 12–14 and 81, (9): `|R(x)| < √x` for `x > 263`). Cohen–Dress' local bounds
for `R(x + y) − R(x)` are not stated as a theorem: their source is an announcement without complete
proofs, and they are the proposition *CohenDressLocalBounds* of Layer 0.7, which nothing here
consumes. Route for the first: `Σ_{n ≤ x} μ²(n) = Σ_{d ≤ √x} μ(d) ⌊x/d²⌋`
(`Nat.sum_divisors_filter_squarefree`), so `R(x) = −x Σ_{d > √x} μ(d)/d² − Σ_{d ≤ √x} μ(d){x/d²}`,
bounded by `x · |Σ_{d > √x} μ(d)/d²| + √x ≤ 2√x` with the tail bound of Layer 2.5 at `D = √x`; the
constant `1` needs the fractional-part sum and the tail together, as in the source (Moser–MacLeod's
argument beyond its initial range and *SquarefreeRangeVerified* on it), and the constant `1/2` for
`x ≥ 8` likewise.

Under the propositions *SquarefreeRangeVerified* and *SquarefreeRangeVerifiedNat* of the sources'
finite ranges (Layer 0.7), prove: `|R(x)| ≤ 0.1333 √x` for every real `x ≥ 1664` (Cohen–Dress,
quoted at `ramare2013aa` lines 272–275 and `cipu2015` line 624, Lemma 4.2(b)); `|R(n)| ≤ 0.02767 √n`
for every natural `n ≥ 438 653` (`cohenDressElMarraki2007`, uncertified; `cipu2015` line 626, Lemma
4.2(d)), hence `|R(x)| ≤ 0.02767 √x + 6/π²` for every real `x ≥ 438 653`, since
`R(x) = R(⌊x⌋) − 6{x}/π²`, and `|R(x)| ≤ 0.02767 √x` for every real `x ≥ 441 353` (the real
threshold: the last unit interval on which the left limit violates the row is `[441 352, 441 353)`),
the stretch `[441 353, 2 736 764]` by *SquarefreeRangeVerified*
`(x ↦ 0.02767 √x) 441 353 2 736 764`, the range `[2 736 764, 10^{18}]` by the Mossinghoff–Oliveira e
Silva–Trudgian instance of Layer 0.7 (`1.12543 x^{1/4} ≤ 0.02767 √x` exactly when
`x ≥ (1.12543/0.02767)^4 = 2 736 763.8…`), and beyond `10^{18}` by the source's analytic argument;
`−0.103229 √n ≤ R(n) ≤ 0.679091 √n` for every natural `n ≥ 1`, and
`−0.15264 √x ≤ R(x) ≤ 0.679091 √x` for every real `x ≥ 1` (`cipu2015` line 623, Lemma 4.2(a),
printed for real `x ≥ 1`, which holds only for the upper constant: the real infimum of `R(x)/√x` is
`(1 − 12/π²)/√2 = −0.152632…`, approached as `x → 2⁻`, and the integer minimum is `−0.1032287…` at
`n = 380`); and `|R(x)| ≤ 0.7 √x` for every real `x ≥ 1`, `0.5 √x` for every real `x ≥ 10`
(`ramare2013aa` lines 267–276, Lemma 4.6). The bound `|R(x)| ≤ 0.036438 √x` for `x ≥ 82 005` printed
at `cipu2015` line 625, Lemma 4.2(c), and at `ramare2019bcp` lines 87–88 is not stated: it fails at
the integer `x = 351 115`. Route: the identity above with the Möbius bounds of Layer 1 on the tail
`Σ_{d > √x} μ(d)/d²` through `M`, and the propositions of Layer 0.7.

Prove: for every real `N ≥ 1`, `(6/π²) log N + 0.578 ≤ Σ_{n ≤ N} μ²(n)/n ≤ (6/π²) log N + 1.166`,
and for `N ≥ 1000` the pair `(1.040, 1.048)` (`ramare2016mc` lines 450–466, Lemma 3.4), through the
identity `Σ_{n ≤ N} μ²(n)/n = (6/π²)(log N + 2 Σ_p log p/(p² − 1) + γ) + O*(3/N^{1/3})` for every
real `N > 0` (its proof, line 461), which is the comparison theorem of Layer 5.1 with the harmonic
model `k = 1/n` (`A = 0`, `B = 1`, `C = γ`, `D = 0.9105`) and `h(d²) = μ(d)/d²`, `h = 0` off squares
(the coefficients of `1/ζ(2s + 2)`): `H(0) = 6/π²`, `H'(0) = (12/π²) Σ_p log p/(p² − 1)`,
`H̄(−1/3) = Σ_d μ²(d) d^{−4/3} = ζ(4/3)/ζ(8/3) = 2.80405…`, so `v = H(0)`,
`w = H'(0) + γ H(0) = (6/π²) C₂ = 1.04389…` and the error is `0.9105·2.80405 = 2.553 ≤ 3`. The
identity gives the first pair for `N ≥ 14 831` and the second for `N ≥ 4.58·10^8`; the ranges below
are *SquarefreeReciprocalRangeVerified* (Layer 0.7).

*Needs:* `Nat.sum_divisors_filter_squarefree`; 2.5; Layer 1.4; 5.1; Layer 0.3; Layer 0.6; Layer 0.7
(*SquarefreeRangeVerified*, including its `x^{1/4}` instance to `10^{18}`, *SquarefreeRangeVerifiedNat*,
*SquarefreeReciprocalRangeVerified*); `hasSum_zeta_two`.

### 7.2 The reciprocal squarefree sums `Σ μ²(n)/n` and `Σ μ²(n)/φ(n)`

Prove Ramaré's tail estimates (`ramare2019bcp` lines 769–779, Theorem 8.1): for every real
`y ≥ 142 130`, `|Σ_{d > y} μ(d)/d²| ≤ (0.0195 log y − 0.11)/(y log² y)`, and for every real
`y ≥ 59 600`, `|Σ_{d > y} μ(d)/d²| ≤ 1/(50 y log y)`. Route: the identity (Lemma 8.2, lines 781–810,
at `a(d) = μ(d)/d`) `Σ_{d > y} μ(d)/d² = ∫_y^∞ (m̌(t) − 1) dt/t² − (m̌(y) − 1)/y − m(y)/y`, then for the
first form the corrected `|m̌(t) − 1| ≤ 0.00140/log t` (`t ≥ 9950`, Layer 3.2) and Theorem 1.2's
`|m(y)| ≤ 0.0144/log y − 0.1/log² y` (`y ≥ 463 421`, Layer 2.3), which give
`(0.0172 log y − 0.1)/(y log² y)` for `y ≥ 463 421`; for the second, the rows
`|m̌(t) − 1| log t ≤ 1/714` (`t ≥ 9549`) and `(log y)|m(y)| ≤ 1/69` (`y ≥ 96 955`), which give `0.0173/(y log y)` for
`y ≥ 96 955`; and *MoebiusSquareTailRangeVerified* (Layer 0.7) below those ranges. The source's
proof (lines 836–846) uses the uncorrected `0.00252/log t − 0.0077/log² t` form of Ramaré 2015's
Theorem 1.5; the corrected form gives the same statement.

Prove Ramaré's Theorem 3.2 and Corollary 3.3: with `C₂ = γ + 2 Σ_p log p/(p² − 1)`
(`= 1.717 137 651 090 62…` under *ArithmeticalConstantsEnclosure*), for every real `D ≥ 1665`,
`Σ_{d ≤ D} μ²(d)/d = (6/π²)(log D + C₂) + O*(7/(20 √(D log D)))` (`ramare2019bcp` lines 200–206,
with `7/20` replaceable by `3/5`, and by `0.56`, for `D > 1`); and for every real `D ≥ 3475`,
`Σ_{d ≤ D} μ²(d)/d = (6/π²)(log D + C₂) + O*(0.073/√D)` (lines 210–214). Route: the hyperbola
refinement of Layer 5.4 (the source's Theorem 4.1, lines 233–250) with `g(k²) = μ(k)` and `g = 0`
off squares, so that `g ⋆ 1 = μ²`, `Σ g(m)/m = 6/π²`, the main term is `(6/π²)(log D + C₂)` and
`G♯(x) = Σ_{k > √x} μ(k)/k²`, which the tail estimate above bounds by `1/(25 √x log x)` for
`x ≥ 59 600²` (lines 921–970); the first conjunct of *SquarefreeIntegralRangeVerified* (Layer 0.7)
covers `D ≤ 10^{11}`, and Corollary 3.3 follows from Theorem 3.2 for `D ≥ 10^{10}` (line 971).

Prove the all-range form of Zuniga Alterman (`zunigaAlterman2022` Lemma 4.1, first part): for every
real `X > 0`, `Σ_{d ≤ X} μ²(d)/d = (6/π²)(log X + C₂) + O*(1.044/√X)`. Route: Theorem 3.2's form with
`0.56/√(X log X)` for `X ≥ 4/3` (there `0.56/√(log X) ≤ 1.044`), a direct evaluation on `[1, 4/3)`,
where the sum is `1`, and on `(0, 1)`, where it is empty, the exact supremum of
`(6/π²)|log X + C₂| √X`, which is its value `(6/π²) C₂ = 1.04389…` as `X → 1⁻`. The companion
constant `0.43` for every real `X ≥ 1`, which the source quotes, is not stated.

Prove Ramaré's `|R(x)| ≤ 1.06 √(x/log x)` for every real `x > 1` (`ramare2019bcp` lines 219–225,
Corollary 3.4), by Abel summation from Theorem 3.2 for `x ≥ 10^{32}` (lines 1185–1236, with the
integral over `[0, 1665]` from the third conjunct of *SquarefreeIntegralRangeVerified*), by the rows
of 7.1 on `[1664, 10^{32}]` (`0.1333 √x ≤ 1.06 √(x/log x)` while `log x ≤ 63.2`, which covers
`[1664, 438 653]`, and `0.02767 √x + 6/π² ≤ 1.06 √(x/log x)` on `[438 653, 10^{32}]`), and by
*SquarefreeRangeVerified* `(x ↦ 1.06 √(x/log x)) 1.0001 1664` with the trivial bound on
`(1, 1.0001)`, where `x/log x ≥ 10^4`. The source covers `[82 005, 10^{32}]` with the
`0.036438` row (lines 1237–1238), which is false (7.1); the two rows used here replace it.

Prove Ramaré's Theorem 3.1: with `c₀ = γ + Σ_p log p/(p(p − 1))` (`= 1.332 582 275 733…` under
*ArithmeticalConstantsEnclosure*), `Σ_{d ≤ D} μ²(d)/φ(d) = log D + c₀ + O*(11/(√D log D))` for
`D > 1` and `= log D + c₀ + O*(2.44/√D)` for `D ≥ 1` (lines 179–193; `61/25 = 2.44`), and
Akhilesh–Ramaré's Theorem 1.1 (`akhileshRamare2017` lines 78–104): for every natural `q ≥ 1` and
every real `D ≥ 1`,
`G_q(D) = Σ_{d ≤ D, (d, q) = 1} μ²(d)/φ(d) = (φ(q)/q)(log D + c(q)) + O*(5.9 j(q)/√D)` with
`c(q) = c₀ + Σ_{p ∣ q} (log p)/p` and
`j(q) = ∏_{p ∣ q, p ≠ 2} (p^{3/2} + p − √p − 1)/(p^{3/2} − √p + 1)` times `21/25` when `q` is even,
together with its Theorem 1.2, `G₁(D) = log D + c₀ + O*(3.95/√D)` for `D ≥ 1` and
`O*(18.4/(√D log D))` for `D > 1` (lines 124–125). The sum `G₁(D)` is ExplicitCharacterSumsAndSieves
§5.1's `selbergDiagonal` `D`, the sum `S(D)` of ExplicitPrimeCounting §0.1, whose explicit
asymptotic there (Büthe's) has the error `58/√D` from `D ≥ 10^9`; the forms here differ in their
constants (`2.44`, `3.95`), in holding from `D ≥ 1`, and in the coprime restriction `G_q`. Route:
for squarefree `d`, `d/φ(d) = ∏_{p ∣ d} (1 + 1/(p − 1)) = Σ_{e ∣ d} μ²(e)/φ(e)`, so
`G_q(D) = Σ_{e ≤ D, (e, q) = 1} (μ²(e)/(e φ(e))) Σ_{m ≤ D/e, (m, qe) = 1} μ²(m)/m`; the inner sum is
Theorem 3.2 with coprimality (Layer 5.4's hyperbola refinement applied to `μ²(m)/m` restricted to
`(m, qe) = 1`, whose `G♯` is controlled by the Möbius bounds of Layer 2), the outer weight
`μ²(e)/(e φ(e))` has a tail `O(1/E)`, and the range `[1, 2·10^9]` is the second conjunct of
*SquarefreeIntegralRangeVerified* (Layer 0.7).

*Needs:* 5.1; 5.4; 7.1; Layer 2.3; Layer 3.2; Layer 0.7 (*MoebiusSquareTailRangeVerified*,
*SquarefreeIntegralRangeVerified*, *SquarefreeRangeVerified*); `Nat.totient`; `hasSum_zeta_two`;
ExplicitCharacterSumsAndSieves §5.1 (the carrier `selbergDiagonal` of `G₁`).

### 7.3 The Riesel–Vaughan sum

Prove (`rieselVaughan1983`, Lemma 2, uncertified): for every real `y ≥ 1`,

    Σ_{q ≤ y} μ²(q) ∏_{p ∣ q, p ≠ 2} 2/(p − 2) = (1/4) ∏_{p > 2} (p − 1)²/(p(p − 2)) · (log² y − A₃ log y − A₄ + O*(1088 y^{−1/3})),

where, with `H`, `H'`, `H''` the values at `0` of Layer 0.6 for the perturbation `h` below,
`u = H(0)/2`, `A₃ = −2H'(0)/H(0) − 4γ` and `A₄ = −H''(0)/H(0) − 4γ H'(0)/H(0) − 2(γ² − 2γ₁)` (that is,
`A₃ = −v/u` and `A₄ = −w/u` with `v`, `w` the coefficients of Layer 5.1); these formulas define the
two constants, and the decimals the source prints for them are not used. Both constants are
negative: `A₃ = −2(2γ + (3/2) log 2 + 2 Σ_{p > 2} log p/(p(p − 1))) = −6.023476…` and
`A₄ = −1.1141…`, so the bracket is `log² y + 6.023476… log y + 1.1141… + O*(1088 y^{−1/3})`; a
reading of the display with positive `A₃`, `A₄` reverses both signs and is false.
Route: Layer 5.1 with the summand `g(q) = μ²(q) ∏_{p ∣ q, p ≠ 2} 2/(p − 2)`, the model
`k(n) = τ(n)/n` of 5.2 in its form for every `t > 0` (`A = 1/2`, `B = 2γ`, `C = γ² − 2γ₁`,
`D = 1.641`) and `h` the multiplicative function
with `Σ h(n) n^{−s} = Σ_q g(q) q^{−s} / ζ(s + 1)²`, whose local factors are
`(1 + 2/((p − 2) p^s))(1 − p^{−s−1})²` for `p > 2` and `(1 + 2^{−s})(1 − 2^{−s−1})²` at `p = 2`, so that
`h(p) = O(1/p²)` and `H̄(−1/3) < ∞` (Layer 0.6); then `u = H(0)/2 = (1/4) ∏_{p > 2} (p − 1)²/(p(p − 2))`
(`H(0) = (1/2) ∏_{p > 2} (p − 1)²/(p(p − 2))`). The error of 5.1 is `D H̄(−1/3) y^{−1/3}` and sits
inside the prefactor `u`, so the constant in the display is `D H̄(−1/3)/u`: with `D = 1.641`,
`H̄(−1/3) = ∏_p (1 + |h(p)| p^{1/3} + |h(p²)| p^{2/3} + |h(p³)| p) = 251.01…` (`h(p) = 4/(p(p − 2))`,
`h(p²) = 1/p² − 4/(p(p − 2))`, `h(p³) = 2/(p²(p − 2))` for `p > 2`, and `h(2) = 0`, `h(4) = −3/4`,
`h(8) = 1/4`) and `u = 0.378695…`, it is `1087.7…`, which the enclosure `H̄(−1/3) ≤ 251.07` of
*ArithmeticalConstantsEnclosure* rounds to `1088`, the source's constant. With the `t ≥ 1` constant
`1.16`, which the comparison theorem cannot use, it would be `768.9`.

*Needs:* 5.1; 5.2 (the form for `t > 0`); Layer 0.6; *ArithmeticalConstantsEnclosure*.

### 7.4 The Dirichlet divisor remainder

Here `Δ` is AnalyticNumberTheoryPartI §3.23a's `divisorError`. Prove Dirichlet's hyperbola form
`|Δ(x) + 2 Σ_{n ≤ √x} ψ_B(x/n)| ≤ 1/2` for every real `x ≥ 1`, with `ψ_B(u) = {u} − 1/2`
(`berkaneBordellesRamare2012` lines 192–197, Lemma 3.1), from the hyperbola identity
`Σ_{n ≤ x} τ(n) = 2 Σ_{n ≤ √x} ⌊x/n⌋ − ⌊√x⌋²` of AnalyticNumberTheoryPartI §3.22b and the harmonic
remainder of Layer 0.3; it is the fractional-part form of that identity.

Under §3.23a's `BBRFiniteInput` (whose first conjunct is the `0.961` row on `[1, 10^{10}]`) and
*DivisorRangeVerified*, *DivisorRangeVerifiedNat* for the finite ranges of the source it does not
contain, prove `|Δ(x)| ≤ 0.961 √x` for every real `x ≥ 1`, `|Δ(x)| ≤ 0.482 √x` for every real
`x ≥ 1981`, `|Δ(n)| ≤ 0.397 √n` for every natural `n ≥ 5461`, and `|Δ(x)| ≤ 0.397 √x` for every real
`x ≥ 7560` (`berkaneBordellesRamare2012` lines 64–68, Theorem 1.1, which prints the last row for
`x ≥ 5560` without distinguishing: for real `x` it fails just below `5760`, `6720` and `7560`, where
`Δ` drops by `τ(n)` at the integer, while at the integers the last violation is `5460`). Each row
sharpens the constant `1` of §3.23a's square-root bound `|Δ(x)| ≤ √x`; every later use of the
`0.397` row at real arguments (Cully-Hugill–Trudgian in 7.5, the Piltz remainders of 7.9, the
smoothed problem below) takes the real threshold `7560`. The cubic bound
`|Δ(x)| ≤ 0.764 x^{1/3} log x` for `x ≥ 9995` (Theorem 1.2) is §3.23a's cubic bound and is consumed
as stated there; its extension to every real `x ≥ 5` is the conjunction with
*DivisorCubicRangeVerified* `5 9995` (Layer 0.7). Route: the hyperbola form, the Vinogradov-type
bound of `Σ_{n ≤ √x} ψ_B(x/n)` by the Fourier expansion of `ψ_B` and the exponential-sum estimate of
the source (its §4, elementary van der Corput on a short range), and the propositions above.

Prove Bordellès–Daval's smoothed form (`bordellesDaval2026` Theorem 1 and Corollary 1, a preprint):
with `δ(x) = Σ_{n ≤ x} τ(n)/n − P(x)` (`P` as in 5.2), for every real `x ≥ 1`,
`Δ(x) − x δ(x) = 1/4 + r(x)` with `|r(x)| ≤ 1/8 + 0.316/√x + 1/(64x)`, and
`|r(x)| ≤ 9 log x/x^{1/4} + 0.239/√x + 1/(64x)` for `x ≥ 170`; consequently
`∫_x^∞ Δ(u) u^{−2} du ≥ 0` for every real `x ≥ 1`. Route: the hyperbola form above, the harmonic
remainder to second order, the second-derivative test in the form
`|Σ_{N < n ≤ N₁} e(±f(n))| ≤ (4/√π)(c₂ N λ₂^{1/2} + 2λ₂^{−1/2})` for integers `N < N₁ ≤ 2N` and `λ₂ ≤ f'' ≤ c₂ λ₂` (their Lemma 8;
stated and proved here as part of this target, it differs from the second-derivative tests of
ExplicitZetaBounds §4.3 in its constant and in the dyadic range `N₁ ≤ 2N`), with the Kusmin–Landau
inequality of ExplicitZetaBounds §4.1 for `x ≥ 170`, and for the corollary `|r| < 0.247` from `x ≥ 7` and a check of each `[m, m + 1)` with `1 ≤ m < 7`
under *EulerGammaEnclosure* (ExplicitPrimeCounting §1.6) and `StieltjesGammaOneEnclosure`. The
consequence the source draws from
the `0.397` row, `|δ(x)| ≤ 0.397/√x + 0.38/x`, holds for real `x ≥ 7560` (it is printed from `5560`).

*Needs:* AnalyticNumberTheoryPartI §§3.22b and 3.23a; Layer 0.3; Layer 0.7 (*DivisorRangeVerified*,
*DivisorRangeVerifiedNat*, *DivisorCubicRangeVerified*, `StieltjesGammaOneEnclosure`; §3.23a's
`BBRFiniteInput`); ExplicitPrimeCounting §1.6 (*EulerGammaEnclosure*); ExplicitZetaBounds §4.1 (the
Kusmin–Landau inequality, for the smoothed form); `Nat.card_divisors`;
`Int.fract` lemmas; the source's exponential-sum
lemma (its Lemma 4.1), stated and proved here as part of this target.

### 7.5 Piltz divisor sums

Prove Bordellès' bound: for every natural `k ≥ 1` and real `x ≥ 1`,
`Σ_{m ≤ x} τ_k(m) ≤ x (log x + γ + 1/x)^{k−1}` (`bordelles2002`, Theorem 4.1, uncertified), by
induction on `k` from `τ_k = τ_{k−1} ⋆ 1`:
`Σ_{m ≤ x} τ_k(m) = Σ_{d ≤ x} Σ_{m ≤ x/d} τ_{k−1}(m) ≤ Σ_{d ≤ x} (x/d)(log(x/d) + γ + d/x)^{k−2}`,
and `log(x/d) + γ + d/x ≤ log x + γ + 1/x` for `1 ≤ d ≤ x` (since `(d − 1)/x ≤ (d − 1)/d ≤ log d`),
with `Σ_{d ≤ x} 1/d ≤ log x + γ + 1/x` (Layer 0.3 in the form
`H_{⌊x⌋} ≤ log ⌊x⌋ + γ + 1/(2⌊x⌋) ≤ log x + γ + 1/x`). Prove the second form
`Σ_{m ≤ x} τ_k(m) ≤ 2x (log x)^{k−1}` for every natural `k ≥ 1` and real `x ≥ 6`, under
*PiltzRangeVerified* `k` (`bordelles2002`, Theorem 4.2, uncertified): the first bound gives it once
`(1 + (γ + 1/x)/log x)^{k−1} ≤ 2`, which holds for `x ≥ x_k = exp((k − 1)(γ + 1/6)/log 2)`, and the
range `6 ≤ x < x_k`, empty for `k ≤ 2`, is *PiltzRangeVerified* `k`.

Prove Bordellès' sharper bound (`bordelles2006` Theorem 2.1): for every natural `k ≥ 3` and real
`x ≥ 13`, `Σ_{m ≤ x} τ_k(m) ≤ x (log x + k − 2)^{k−1}/(k − 1)!`, smaller than Theorem 4.2's by about
`1/(k − 1)!`. Route: induction on `k` from `S_{k+1}(x) ≤ S_k(x) + x ∫_1^x S_k(t) t^{−2} dt` with
`S_k(x) = Σ_{m ≤ x} τ_k(m)`, the values of `∫_1^{13} S_k(t) t^{−2} dt`, and the base case `k = 3`
from `|Δ₃(x)| ≤ 2.36 x^{2/3} log x` for `x ≥ 670` (its Lemma 3.2, from `|Δ(y)| ≤ √y + 1/2` and
Riesel–Vaughan's model for `Σ τ(n)/n`) together with the bound on `[13, 670]`; those values and that
bound are *BordellesPiltzRangeVerified* (Layer 0.7). Dubbe's variant with
`(log x + h_k)^{k−1}/(k − 1)!`, `h_k = k(3/2 − log 2)`
(`dubbe2020`, uncertified), is recorded by its locator only.

Under the real-argument row `|Δ(t)| ≤ 0.397 √t` for every real `t ≥ 7560` of 7.4, the third form
`Σ_{n ≤ t} τ(n)/n = P(t) + O*(1.001 t^{−1/2})` (`t ≥ 2`) of 5.2, and *DivisorPowerRangeVerified*
`7560² (6·10^5)` (Layer 0.7), prove Cully-Hugill–Trudgian's Theorem 1: for `x ≥ 2`,

    Σ_{n ≤ x} τ₄(n) = (1/6) x log³ x + (2γ − 1/2) x log² x + (6γ² − 4γ − 4γ₁ + 1) x log x +
                      (4γ³ − 6γ² + 4γ − 12γγ₁ + 4γ₁ + 2γ₂ − 1) x + O*(4.48 x^{3/4} log x)

(lines 62–71 and 230–242, (18); the coefficients `C₃`, `C₄` involve the first two Stieltjes
constants `γ₁`, `γ₂`, the latter defined as `γ₁` is, with `Σ_{n ≤ N} log² n/n − (1/3) log³ N`),
hence `Σ_{n ≤ x} τ₄(n) ≤ (1/3) x log³ x` for `x ≥ 193`; and Theorem 2: for `x ≥ 2`,

    Σ_{n ≤ x} τ(n)² = π^{−2} x log³ x + D₂ x log² x + D₃ x log x + D₄ x + O*(9.73 x^{3/4} log x + 0.73 √x),

with `D₂ = 0.745…`, `D₃ = 0.824…`, `D₄ = 0.461…` the Laurent coefficients of `ζ(s)⁴/ζ(2s)` at `1`
given by the source's (19) (lines 125–135), hence `Σ_{n ≤ x} τ(n)² ≤ (1/4) x log³ x` for `x ≥ 433`
and `≤ x log³ x` for `x ≥ 7`. Route: `τ₄ = τ ⋆ τ` through the hyperbola method with `Δ` on both
factors (the source's (13)–(17), lines 140–226), where `Δ` is evaluated at real arguments `t ≥ x₀`
in the partial summations for `S₂` and `S₃`; the error constant is `F₁ = 2c + 6α + 2α/log x₀` (line
239) with `c = 1.001` from the third form of 5.2 and `α = 0.397`. The source takes `x₀ = 5560`,
where the real-argument bound fails just below `5760`, `6720` and `7560` (7.4); with `x₀ = 7560` the
analytic argument covers `x ≥ 7560²`, `F₁ = 2.002 + 2.382 + 0.794/8.931 = 4.473 ≤ 4.48`, and
*DivisorPowerRangeVerified* covers `2 ≤ x < 7560²` in place of the source's `2 ≤ x < 5560²` (lines
240–242). Theorem 2 follows from Theorem 1 through `τ² = τ₄ ⋆ h` with `Σ h(n) n^{−s} = 1/ζ(2s)`
(lines 249–292): the error is `F₁ H*(3/4) x^{3/4} log x + (1 − C₄) x^{1/2}` with
`H*(3/4) = ζ(3/2)/ζ(3) = 2.1732`, and `4.48·2.1732 = 9.736`, `4.473·2.1732 = 9.721 ≤ 9.73`,
`1 − C₄ = 0.7272 ≤ 0.73`.

*Needs:* Layer 0.3; 5.2 (third form); 7.4 (the real-argument `0.397` row);
AnalyticNumberTheoryPartI §3.23a (`divisorError`); Layer 0.5 (`γ₁`, `γ₂`); Layer 0.7
(*DivisorPowerRangeVerified*, *PiltzRangeVerified*); `ArithmeticFunction.sigma_zero_apply`;
`Nat.card_divisors`.

### 7.6 Sums of `2^ω`

Prove: for every real `x ≥ 1`,

    Σ_{n ≤ x} 2^{ω(n)}/n ≤ (3/π²) log² x + 1.3949 log x + 0.4107 + 4.61 x^{−1/3},
    Σ_{n ≤ x} 2^{ω(n)}/n ≥ (3/π²) log² x + 0.578 log x − 0.0666,
    Σ_{n ≤ x} 2^{ω(n)} ≤ (6/π²) x log x + 0.787 x + 11.51 x^{2/3},
    (6/π²) x log x + 0.0456 x − 0.3317 ≤ Σ_{n ≤ x} 2^{ω(n)} ≤ (6/π²) x log x + 1.7091 x + 0.3317,

and, with the Platt–Trudgian model at the exponent `2/5`, the sharper forms: for every real `x ≥ 1`,

    Σ_{n ≤ x} 2^{ω(n)}/n ≤ (3/π²) log² x + 1.3949 log x + 0.4107 + 4.25 x^{−2/5},
    Σ_{n ≤ x} 2^{ω(n)} ≤ (6/π²) x log x + 0.787 x + 11.33 x^{3/5},

each smaller than its `1/3`-form at every `x ≥ 1`; and hence Cipu's bounds (`cipu2015` lines
633–654, Lemma 4.3): for every real `x ≥ 1`,
`Σ_{n ≤ x} 2^{ω(n)}/n > (3/π²) log² x + 0.0895 log x − 0.916` and
`(6/π²) x log x − 0.518398 x < Σ_{n ≤ x} 2^{ω(n)} < (6/π²) x log x + 2.04864 x`.

Route for the first and third: `2^ω/n = h ⋆ (τ/n)` with `h(d²) = μ(d)/d²`, `h = 0` off squares (the
series `ζ(s + 1)²/ζ(2s + 2)`), the comparison theorem 5.1 with the model 5.2 in its form for every
`t > 0` (`A = 1/2`, `B = 2γ`, `C = γ² − 2γ₁`, `D = 1.641`): `u = 3/π²`, `v = 2A H'(0) + B H(0)` with
`H'(0) = −Σ_d μ(d) (2 log d)/d² = (12/π²) Σ_p log p/(p² − 1) = (12/π²)·0.56996 = 0.69299`, so
`v = 0.69299 + 2γ·6/π² = 0.69299 + 0.70181 = 1.39480 ≤ 1.3949`,
`w = A H''(0) + B H'(0) + C H(0) = 0.41066 ≤ 0.4107`, and the error
`1.641 H̄(−1/3) = 1.641 Σ_d μ²(d) d^{−4/3} = 1.641 ζ(4/3)/ζ(8/3) = 1.641·2.80405 = 4.6015 ≤ 4.61`; the unweighted sum by the weighted variant of 5.1 with
`U = 2u = 6/π²`, `V = v − 2u = 0.78687 ≤ 0.787` and error `2.5·4.6015 = 11.504 ≤ 11.51`. The
sharper forms are the same computation at `α = 2/5` with the fourth form of 5.2 (`D = 1.0503`):
`H̄(−2/5) = ζ(6/5)/ζ(12/5) = 4.04208…`, so the errors are `1.0503·4.04208 = 4.2454 ≤ 4.25` and
`(8/3)·4.2454 = 11.3211 ≤ 11.33`; `u`, `v`, `w`, `U`, `V` do not depend on the exponent.
`trudgian2015` Lemma 13 (lines 415–423) prints the constants `3.253` and `8.14`, with a term
`−0.3762` in the unweighted bound: they are `1.16 H̄(−1/3)` and `2.5·1.16 H̄(−1/3)`, obtained by
applying the comparison lemma with Berkane–Bordellès–Ramaré's `1.16` on all `t > 0` (its Lemma 14,
lines 426–432), which holds only for `t ≥ 1` (Layer 5.2); the comparison theorem needs the model
on `(0, 1)` as well, and the route here gives `4.61` and `11.51`. Route for the second and fourth:
the identity `Σ_{n ≤ x} 2^{ω(n)} = Σ_{m ≤ x} Q(x/m)` (since `2^{ω(n)} = Σ_{d ∣ n} μ²(d)`), the
real-argument bounds `−0.15264 √y ≤ R(y) ≤ 0.679091 √y` (`y ≥ 1`) of 7.1,
`H_{⌊x⌋} = log x + γ + O*(6/(11x))` (Layer 0.3) and `Σ_{m ≤ x} m^{−1/2} ≤ 2√x − 1`; and
`Σ_{n ≤ x} 2^{ω(n)}/n = Σ_{m ≤ x} (1/m) Σ_{d ≤ x/m} μ²(d)/d` with the lower bound `(6/π²) log y + 0.578` of 7.1,
`H_{⌊x⌋} ≥ log x` (`log_add_one_le_harmonic`) and `Σ_{m ≤ x} (log m)/m ≤ ½ log² x + 0.1094`
(the terms `m = 2, 3` and `∫_3^x (log t) dt/t`, since `log t/t` decreases on `[e, ∞)`). Cipu's own
derivation uses the lower constant `−0.103229` of his Lemma 4.2(a) at the real arguments `x/m`,
where it does not hold (7.1); the route here uses the real constant.

*Needs:* 5.1 (at `α = 1/3` and `α = 2/5`); 5.2 (the second and fourth forms); 7.1; Layer 0.3;
Layer 0.6; `hasSum_zeta_two`;
`log_add_one_le_harmonic`; `StieltjesGammaOneEnclosure` (for the constant `0.4107`).

### 7.7 Totient sums

Prove (`trevino2015ijnt` lines 223–228 and 285–289, Lemmas 2–3): for every real `x ≥ 1`,
`Σ_{n ≤ x} φ(n)/n ≤ (6/π²) x + log x + 1` and `Σ_{n ≤ x} n φ(n) ≤ (2/π²) x³ + (1/2) x² log x + x²`.
Route for the first: `φ(n)/n = Σ_{d ∣ n} μ(d)/d`, so
`Σ_{n ≤ x} φ(n)/n = Σ_{d ≤ x} (μ(d)/d) ⌊x/d⌋ = x Σ_{d ≤ x} μ(d)/d² − Σ_{d ≤ x} μ(d){x/d}/d`, with
`Σ_{d ≤ x} μ(d)/d² = 6/π² − Σ_{d > x} μ(d)/d²`; the tail is bounded by Moser–MacLeod's
`1/(3x) + 8/(3x²)` of 2.5 (`x ≥ 2`), and `|Σ_{d ≤ x} μ(d){x/d}/d| ≤ H_{⌊x⌋} < log x + γ + 1/x`
(Layer 0.3), so the sum is at most `(6/π²) x + log x + γ + 1/3 + 1/x + 8/(3x)`, and
`γ + 1/3 + 1/x + 8/(3x) ≤ 0.99998 ≤ 1` for `x ≥ 41` (`trevino2015ijnt` lines 237–283); the range
`1 ≤ x < 41` is *TotientRangeVerified* (Layer 0.7). The cruder tail `1/x` of 2.5 would leave
`(6/π²) x + log x + 1 + γ + 1/x`, too large by `γ + 1/x`. Route for the second (lines 290–369):
`n φ(n) = Σ_{dm = n} μ(d) d m²`, so `Σ_{n ≤ x} n φ(n) = Σ_{d ≤ x} μ(d) d Σ_{m ≤ x/d} m²` with
`Σ_{m ≤ y} m² = ⌊y⌋(⌊y⌋ + 1)(2⌊y⌋ + 1)/6`; writing `⌊x/d⌋ = x/d − θ_d` and using `|3 − 6θ| ≤ 3`,
`|6θ² − 6θ + 1| ≤ 1`, `|θ(1 − θ)(1 − 2θ)| ≤ 1/10` on `0 ≤ θ < 1`, the harmonic bound of Layer 0.3
and the Moser–MacLeod tail of 2.5 for `x ≥ 3`, and a direct check for `1 ≤ x < 3`.

*Needs:* 2.5 (Moser–MacLeod form); Layer 0.3; Layer 0.7 (*TotientRangeVerified*); `Nat.totient`;
`ArithmeticFunction.coe_moebius_mul_coe_zeta` (`φ/n = μ/n ⋆ 1`).

### 7.8 The squarefree remainder from finitely many zeros, and squarefree integers in short intervals

Under *ZetaResidueSumVerified* and the `x^{1/4}` instance of *SquarefreeRangeVerified* (Layer 0.7),
prove Chirre–Helfgott's bounds (`chirreHelfgott2025`, a preprint): `|R(x)| ≤ 0.845 x^{2/5}` for every
real `0 < x ≤ 10^{32}` (Proposition 8.4(a)); `|R(x)| ≤ 1.537·10^{−8} √x + 2.515 x^{2/5}` for every real
`x > 0` (Proposition 8.4(b)); `|R(x)| ≤ 0.0134 √x` for every real `x ≥ 10^8` (Corollary 7.13); and
`|R(x)| ≤ 0.002 √x` for every real `x ≥ 10^{32}` (Lemma 7.12). Route: the identity
`R(x) = −x Σ_{d > √x} μ(d)/d² − Σ_{d ≤ √x} μ(d){x/d²}` of 7.1 written against `M`, the linear bounds of
1.7 with `(linear coefficient, √-coefficient)` equal to `(π/(2·10^7), 6.738093)`,
`(π/(2·10^{10}), 11.350514)` and `(3/(π·10^{10}), 11.39)`, `MoebiusTableVerified 0.571 10^{16}` (with
the exact `0.570591`), the `x^{1/4}` instance on `(0, 10^{18}]`, and a direct check on `(0, 7]`. They
give the `0.02767` row of 7.1 beyond `10^{18}` without Cohen–Dress–El Marraki's elementary method, and
Proposition 8.4(b) improves Ramaré's `1.06 √(x/log x)` of 7.2 for every `x` between `5.2·10^{10}` and
about `exp(4.7·10^{15})`.

State Kumchev–McCormick–McNew–Park–Scherr–Ziehr's theorem (`kumchevEtAl2023` Theorem 1, a preprint,
by its locator): for every real `x ≥ 2`, the interval `(x, x + 11 x^{1/5} log x]` contains a
squarefree integer; for `x ≤ 10^{18}` this is *SquarefreeGapVerified* `10^{18} 18` (Layer 0.7), and
beyond the source's Propositions 1–3, with `5` in place of `11` for `x ≥ e^{400}` (its Theorem 3).

*Needs:* 1.7; 7.1; 7.2 (for the comparison); Layer 0.7 (*ZetaResidueSumVerified*,
*SquarefreeRangeVerified*, `MoebiusTableVerified`, *SquarefreeGapVerified*).

### 7.9 Explicit Piltz remainders

Define, for natural `k ≥ 2`, `Δ_k(x) = Σ_{n ≤ x} τ_k(n) − x P_k(log x)`, where `x P_k(log x)` is the
residue of `ζ(w)^k x^w/w` at `w = 1` (`P_k` of degree `k − 1` with leading coefficient `1/(k − 1)!`;
`Δ₂ = Δ`). Prove Tudzi's bound (`tudzi2025` Theorem 1.1, a preprint): for every real `x ≥ 2`,
`P₃(L) = ½L² + (3γ − 1)L + 3γ² − 3γ − 3γ₁ + 1` and `|Δ₃(x)| < 2.968 x^{2/3} (log x)^{1/3}`. Route:
the hyperbola method for `τ₃ = τ ⋆ 1` with `Δ` at real arguments (the `0.397` row of 7.4, the third
form of 5.2, and the sharpening `|Δ(n)| ≤ 0.173 √n` for every natural `n ≥ 6·10^5` and
`|Δ(v)| ≤ 0.173 √v` for every real `v ≥ 1 081 080`), for `x ≥ 1.1·10^{10}`, and
*PiltzRemainderRangeVerified* `3 2 (1.1·10^{10})` below (Layer 0.7). The source states the
sharpening for real `v ≥ 6·10^5`; at real arguments it fails just below `1 081 080`, so the real
form starts there. Beyond `5·10^{12}` it follows from §3.23a's cubic bound, since
`0.764 x^{1/3} log x ≤ 0.173 √x` once `x ≥ 4.55·10^{12}`, and below it is *DivisorRangeVerifiedNat*
`0.173 (6·10^5) (5·10^{12})` and *DivisorRangeVerified* `0.173 1 081 080 (5·10^{12})` (Layer 0.7).
The source applies the `0.397` row at real arguments from `5560` and the `0.173` row from `6·10^5`;
the analytic argument with the real thresholds `7560` of 7.4 and `1 081 080` here is part of this
target. State its Theorem 1.2 for `k = 4`: `|Δ₄(x)| < 20.087 x^{3/4} (log x)^{3/4}` for every real
`x ≥ 10^{11}`; the rows `k = 5, 6` (`114.332 x^{4/5}(log x)^{6/5}` from `10^{12}`,
`646.358 x^{5/6}(log x)^{5/3}` from `10^{13}`) apply the `(k − 1)`-bound at arguments below its
stated range and are recorded by locator only.

*Needs:* 7.4; 7.5; 5.2 (third form); Layer 0.5 (`γ₁`); Layer 0.7 (*PiltzRemainderRangeVerified*,
*DivisorRangeVerified*, *DivisorRangeVerifiedNat*); AnalyticNumberTheoryPartI §3.23a (the cubic
bound, for the `0.173` row beyond `5·10^{12}`).

### Dependencies

Layer 0; Layers 1.2 and 1.4 (through 2.5 and the tails); Layer 2.3 and 2.5; Layer 3.2 (for the
tail estimates of 7.2); Layer 5 (5.1, 5.2, 5.4); AnalyticNumberTheoryPartI §3.22 (cited) and
§§3.22b, 3.23a (the hyperbola identity, `divisorError` and its cubic bound);
ExplicitCharacterSumsAndSieves §5.1 (the carrier of `G₁` in 7.2); ExplicitPrimeCounting §0.1 (the
asymptotic of `G₁` against which 7.2 is compared, cited only); ExplicitZetaBounds §4.1 (the
Kusmin–Landau inequality, for the smoothed remainder of 7.4). Within the layer, 7.1 uses no
other subsection of Layer 7, so Layer 1.5, which consumes 7.1, is not downstream of
anything that consumes it. Layer 1.7 for 7.8 (the zero data; 1.7 uses nothing from Layer 7); 7.9 uses
7.4, 7.5 and 5.2.

## Layer 8: explicit Euler products over primes

### 8.1 The Meissel–Mertens constant and the explicit Mertens product

Prove the identification: the real `B` of AnalyticNumberTheoryPartI §0.19 (the constant with
`|Σ_{p ≤ x} 1/p − log log x − B| < 1/(2 log² x)` for `x ≥ 286`) equals Tau Ceti's
`mertensConstant ℚ`, because any `B'` with `Σ_{p ≤ x} 1/p − log log x − B' → 0` is the limit, and
Tau Ceti's `tendsto_primeSummatory_inv_absNorm_sub_log_log` at `K = ℚ` gives that limit for the
sum over prime ideals, which is the sum over primes once the prime ideals of `ℤ` of norm `≤ x` are
matched with the primes `p ≤ x` (`Ideal.absNorm (span {p}) = p`). Prove the product identity
`B = γ + Σ_p (log(1 − 1/p) + 1/p)` from §0.21 and §0.26:
`log ∏_{p ≤ x} (1 − 1/p)^{−1} = Σ_{p ≤ x} 1/p − Σ_{p ≤ x} (log(1 − 1/p) + 1/p)`, and §0.26 says the left side is `log log x + γ + o(1)`.

Prove the explicit Mertens product (`rosserSchoenfeld1962` p. 70, Theorems 7–8, (3.26)–(3.30), all
four inequalities strict in the source; the fourth, the upper bound of the second quotient, is
quoted with `x > 1` at `ivic1977` line 52): for every real `x > 1`,

    1 − 1/log² x ≤ e^γ (log x) ∏_{p ≤ x} (1 − 1/p) ≤ 1 + 1/(2 log² x),
    1 − 1/(2 log² x) ≤ ∏_{p ≤ x} (1 − 1/p)^{−1}/(e^γ log x) ≤ 1 + 1/log² x,

as the conjunction of the analytic range and *MertensProductInitialRangeVerified* (both pairs on
`1 < x < 24 284`). The analytic range is the headline statement `mertens_product_explicit`: under
the estimate `|Σ_{p ≤ x} 1/p − log log x − B| ≤ 1/log³ x` for every real `x ≥ 24 284`, with
`B = mertensConstant ℚ` (ExplicitPrimeCounting §4.3), the four inequalities hold for every real
`x ≥ 24 284`. The transfer: put `E(x) = Σ_{p ≤ x} 1/p − log log x − B` and
`c_p = log(1 − 1/p)^{−1} − 1/p ∈ (0, 1/(p(p − 1)))`, so that `B − γ = −Σ_p c_p` and

    log(e^γ (log x) ∏_{p ≤ x} (1 − 1/p)) = −E(x) + Σ_{p > x} c_p,

the tail entering with a plus sign and lying in `(0, Σ_{n > x} 1/(n(n − 1))) ⊆ (0, 1/(x − 1))` for
`x ≥ 2`; hence, from `|E(x)| ≤ ε(x)` for `x ≥ x₀`, the logarithm of the first quotient lies in
`(−ε(x), ε(x) + 1/(x − 1))` and that of the second in `(−ε(x) − 1/(x − 1), ε(x))`, for `x ≥ x₀`.
Route for `x ≥ 24 284`: ExplicitPrimeCounting §4.3 gives `ε(x) = 1/log³ x`, and at
`x = 24 284` the bound `ε(x) + 1/(x − 1) = 9.713·10^{−4} + 4.12·10^{−5} = 1.0125·10^{−3}` is below
`log(1 + 1/(2 log² x)) = 4.892·10^{−3}`, `−log(1 − 1/(2 log² x)) = 4.916·10^{−3}` and the two
corresponding quantities with `log² x` in place of `2 log² x`; since
`(1/log³ x)/(1/(2 log² x)) = 2/log x` and `log³ x/(x − 1)` decrease, the four inequalities hold for every `x ≥ 24 284`. With
§0.19's `ε(x) = 1/(2 log² x)` the same computation gives only `1 + 1/log² x` for the upper bound of
the first pair and `1 − 1/log² x` for the lower bound of the second: at `x = 286`,
`1/(2 log² x) + 1/285 = 0.019139 > log(1 + 1/(2 log² x)) = 0.015509`. So §0.19 is used only for the
identification of `B`.

Prove the form under the Riemann hypothesis, the product companion of the Mertens sums of
ExplicitPrimeCounting §4.7 (whose source states both; that section leaves the product forms to this
roadmap): under `RiemannHypothesis` and the estimate
`|Σ_{p ≤ x} 1/p − log log x − B| ≤ ε_RH(x) = 3 log x/(8π √x)` for every real `x ≥ 24.4`
(ExplicitPrimeCounting §4.7), the transfer above gives, for every real `x ≥ 24.4`,
`e^{−ε_RH(x)} < e^γ (log x) ∏_{p ≤ x} (1 − 1/p) < e^{ε_RH(x) + 1/(x − 1)}` and
`e^{−ε_RH(x) − 1/(x − 1)} < ∏_{p ≤ x} (1 − 1/p)^{−1}/(e^γ log x) < e^{ε_RH(x)}`, the inequalities strict
because the tail `Σ_{p > x} c_p` lies strictly inside `(0, 1/(x − 1))`. At `x = 10^{19}` the
logarithmic window is `1.65·10^{−9}`, against `1.05·10^{−7}` for Axler's unconditional form below.

Prove Axler's refinement (`axler2018` Proposition 6.1 of the arXiv version; the Integers print,
Proposition 9, prints the upper bound only in the unexpanded form
`exp(η_A(x) + 1.02/((x − 1) log x))` for every `x > 1`, from which `0.07` follows) as the
instance of the transfer with the one-sided inputs of `gap:mertens-reciprocal-axler`: with
`η_A(x) = 1/(20 log³ x) + 3/(16 log⁴ x)`, `E(x) ≥ −η_A(x)` for every real `x > 1` and
`E(x) ≤ η_A(x)` for every real `x ≥ 46 909 074` (`axler2018` Proposition 5.1). Then

    e^γ (log x) ∏_{p ≤ x} (1 − 1/p) < 1 + 0.07/log³ x                      for every real x > 1,
    e^γ (log x) ∏_{p ≤ x} (1 − 1/p) > 1 − 1/(20 log³ x) − 3/(16 log⁴ x)     for every real x ≥ 46 909 038,

and both quotients of the first display lie in `[1 − 0.07/log³ x, 1 + 0.07/log³ x]` for every real
`x ≥ 46 909 074`. The upper bound for `x ≥ 392 687` is the headline statement
`mertens_product_axler`, which needs only the lower inequality `E(x) ≥ −η_A(x)` for `x > 1`. Route:
the logarithm of the first quotient is at most `η_A(x) + 1/(x − 1)`, which is at most
`log(1 + 0.07/log³ x)` for every `x ≥ 392 687` (with a margin of `5·10^{−13}` at `x = 392 687`,
where `1/(x − 1)` may be replaced by Axler's sharper tail `1.02/((x − 1) log x)`; the quantity
`(η_A(x) + 1/(x − 1)) log³ x = 1/20 + 3/(16 log x) + log³ x/(x − 1)` decreases there and is `0.0607`
at `x = 46 909 074`); it is at least `−η_A(x)` for `x ≥ 46 909 074`, and `e^{−η} ≥ 1 − η`; the
second quotient is the reciprocal, with logarithm in `[−η_A(x) − 1/(x − 1), η_A(x)]`, and
`e^{η} − 1 ≤ η e^{η}` closes the `0.07` window since `η_A(x) log³ x ≤ 0.0607`. The ranges
`1 < x < 392 687` (upper bound) and `46 909 038 ≤ x < 46 909 074` (lower bound) are
*MertensProductCubicRangeVerified* (Layer 0.7). This supersedes Dusart's `1 ± 1/(5 log³ x)` for
`x > 2 278 382` (`dusart2018` Theorem 5.9, uncertified) wherever both apply, and Dusart's form is
not stated. For very large `x`, `axler2022` Proposition 6.1 sharpens the constant further: under
ExplicitPrimeCounting §4.3 (`|E(x)| ≤ f(x) = (0.024334/(3 log³ x))(1 + 15/(4 log x))` for
`x ≥ 1 757 126 630 797`), the same transfer gives
`e^{−f(x)} < e^γ (log x) ∏_{p ≤ x}(1 − 1/p) < e^{f(x) + 1/(x − 1)}` there (`axler2022` Proposition
6.1, a preprint, with the sharper tail `1.02/((x − 1) log x)`).

*Needs:* AnalyticNumberTheoryPartI §§0.19, 0.21, 0.26; Tau Ceti `mertensConstant`,
`tendsto_primeSummatory_inv_absNorm_sub_log_log`; `Real.add_one_le_exp`;
*MertensProductInitialRangeVerified*; ExplicitPrimeCounting §§4.3, 4.7 (the form under
`RiemannHypothesis`); `gap:mertens-reciprocal-axler`
and *MertensProductCubicRangeVerified* (for Axler's refinement); ExplicitPrimeCounting §1.6
(*MeisselMertensEnclosure*) only when `B` is replaced by its decimal.

### 8.2 Tilted products

Prove the transfer to tilted products: for complex `ε` with `|ε| < 2`, put
`γ(ε) = Σ_p Σ_{n ≥ 2} (−1)^{n+1} ε^n/(n p^n)` (absolutely convergent since `|ε|/p < 1`) and
`B = mertensConstant ℚ`; if `|Σ_{p ≤ x} 1/p − log log x − B| ≤ η(x)` for every real `x ≥ x₀ ≥ 2`,
then for every real `x ≥ x₀`,

    ∏_{p ≤ x} (1 + ε/p) = exp(γ(ε) + εB) (log x)^ε (1 + O*(z e^z)),   z = |ε| η(x) + |ε|²/((2 − |ε|)(x − 1)).

Route: `log ∏_{p ≤ x} (1 + ε/p) = ε Σ_{p ≤ x} 1/p + γ(ε) − T_ε(x)` (principal branch, `|ε/p| < 1`)
with `T_ε(x) = Σ_{p > x} Σ_{n ≥ 2} (−1)^{n+1} ε^n/(n p^n)`,
`|T_ε(x)| ≤ Σ_{p > x} (|ε|/p)²/(2(1 − |ε|/p)) ≤ |ε|²/((2 − |ε|)(x − 1))`, and `|e^w − 1| ≤ |w| e^{|w|}`. Prove the instance under
ExplicitPrimeCounting §4.3 (`η(x) = 1/log³ x` for `x ≥ 24 284`): for complex `ε` with `|ε| ≤ 1`
and real `x ≥ e^{22}`, `∏_{p ≤ x} (1 + ε/p) = exp(γ(ε) + εB) (log x)^ε (1 + O*(1.0001 |ε|/log³ x))`,
since there `1/(x − 1) ≤ 3·10^{−6}/log³ x` and `z ≤ 1/10 648`. Vanlalngaia's sharper constant
`0.841` for `|ε| < 2` (`vanlalngaia2017` Theorem 5, p. 3) rests on that paper's Theorem 4, which is
not part of the explicit-primes contract, and is not stated here (Scope). The cases `ε = ±1` are
the Mertens product of 8.1 and `∏_{p ≤ x} (1 + 1/p) = (6/π²) e^γ log x (1 + O*(…))`; with
ExplicitPrimeCounting §4.3 the case `ε = 1` is Axler's Corollary 6.2 (`axler2022`, a preprint):
`(6e^γ/π²) log x · exp(−f(x) − 1.02/((x − 1) log x)) < ∏_{p ≤ x}(1 + 1/p) < (6e^γ/π²)(1 + 1/x) log x · exp(f(x))` for every real `x ≥ 1 757 126 630 797`.

*Needs:* 8.1 (`B`); ExplicitPrimeCounting §4.3 (Vanlalngaia's `1/log³ x`, and Axler's `f(x)` for
`ε = 1`);
`Complex.cpow`; `Real.add_one_le_exp`;
Layer 0.6 (absolute convergence of `γ(ε)`).

### 8.3 Products over a progression

Prove the transfer to a progression: let `q ≥ 1` be natural, `a` an integer coprime to `q`,
`θ(x; q, a) = Σ_{p ≤ x, p ≡ a (mod q)} log p`, and suppose `|θ(t; q, a) − t/φ(q)| ≤ c t/log t` for
every real `t ≥ x₁ ≥ 2`, with `c > 0`. Then there is a real `B(q, a)` with
`|Σ_{p ≤ x, p ≡ a (mod q)} 1/p − (log log x)/φ(q) − B(q, a)| ≤ η(x) = c/log x + 3c/(2 log² x)` for
every real `x ≥ x₁` (Abel summation against `1/(t log t)`; the integrals
`∫_x^∞ dt/(t log² t) = 1/log x` and `∫_x^∞ dt/(t log³ t) = 1/(2 log² x)` converge), and, with
`K(q, a) = Σ_{p ≡ a (mod q)} (log(1 − 1/p)^{−1} − 1/p)`, for every real `x ≥ x₁`,

    ∏_{p ≤ x, p ≡ a (mod q)} (1 − 1/p)^{−1} = exp(B(q, a) + K(q, a)) (log x)^{1/φ(q)} (1 + O*(z e^z)),   z = η(x) + 1/(x − 1),

by the transfer of 8.1 restricted to the progression. Its input for `q ≥ 3` is ExplicitPrimeCounting
§6.3; for `q = 1` the product statement is 8.1 itself. Bordellès' tabulated bounds
`∏_{p ≤ x, p ≡ a (mod q)} (1 − 1/p)^{−1} ≤ C(q, a) (log x)^{1/φ(q)}` for `x ≥ x₀(q)`
(`bordelles2005`, Theorem 1, uncertified) are instances with the table values as explicit
parameters: for a modulus `q`, a residue `a`, and reals `C`, `X₀ ≤ X₁` with `X₁ ≥ x₁`, the two
hypotheses `exp(B(q, a) + K(q, a)) (1 + z(X₁) e^{z(X₁)}) ≤ C` (an enclosure of the constant, since
`z` decreases) and *ProgressionProductTableVerified* `q a C X₀ X₁` (Layer 0.7) give the bound for
every real `x ≥ X₀`; no value of `C(q, a)` or `x₀(q)` is asserted without its hypotheses. The
constant `exp(−B(q, a) − K(q, a))` is Languasco–Zaccagnini's `C(q, a)`, defined by
`∏_{p ≤ x, p ≡ a (mod q)}(1 − 1/p) ∼ C(q, a)(log x)^{−1/φ(q)}`; its values for `3 ≤ q ≤ 100` and
every `a` coprime to `q`, to at least `100` digits (`languascoZaccagnini2009`), are the content of
*ProgressionMertensConstantEnclosure* (Layer 0.7), which supplies the enclosure of the first
hypothesis for those moduli. For moduli beyond the range where ExplicitPrimeCounting §6.3 is
tabulated, the constant `c_θ(q)` of that input carries an exceptional-zero branch;
ExplicitPrimeCounting §6.3 states it under its three interchangeable hypotheses (among them
*LuZamanZhaoSweep* and *BanksGap* of its §1.7), and this roadmap consumes the statement as stated
there.

*Needs:* 8.1's transfer; ExplicitPrimeCounting §6.3; *ProgressionProductTableVerified*;
*ProgressionMertensConstantEnclosure*;
`Nat.totient`; `ZMod` residue classes (`Nat.ModEq`).

### Examples

- `ε = 2` is excluded in 8.2 (`|ε| < 2`): at `p = 2` the local factor `1 + 2/2 = 2` is fine, but
  `γ(2)` has the term `Σ_n (−1)^{n+1} 2^n/(n 2^n) = Σ (−1)^{n+1}/n`, conditionally convergent only.

### Dependencies

AnalyticNumberTheoryPartI §§0.19, 0.21, 0.26; Tau Ceti `mertensConstant`; Layer 0.6, 0.7;
ExplicitPrimeCounting §§1.6, 4.3 and 6.3; the supplier gap `gap:mertens-reciprocal-axler`.

## Layer 9: pointwise bounds

### 9.1 The number of distinct prime factors

Prove Robin's bound: for every natural `n ≥ 3`, `ω(n) ≤ 1.3841 log n/log log n` (`robin1983aa`
lines 42–48 and 445–464, Théorème 11), under the lower bound `p_k ≥ k(log k + log log k − 1)` for
every `k ≥ 2` (ExplicitPrimeCounting §5.3) and `PrimorialTableVerified 26`
(`cardDistinctFactors_le_robin`). Route: `ω(n) = k` forces `n ≥ p₁ ⋯ p_k = N_k` (the `k`-th
primorial). For `k ≤ 3` the bound needs no table: `log n/log log n ≥ e` for every `n ≥ 3` (the
minimum of `u/log u` over `u > 1` is `e`, at `u = e`), and `1.3841 e = 3.762 ≥ k`. For `k ≥ 4`,
`n ≥ N₄ = 210 > e^e`, where `log n/log log n` is increasing, so it suffices to prove
`k log θ(p_k) ≤ 1.3841 θ(p_k)` (`log N_k = θ(p_k)`). The step is its own target: for every
`k ≥ 27`, `θ(p_k) ≥ k(log k + log log k − 1.25)`, derived by summation: with the primes
`p₁, …, p₅ = 2, 3, 5, 7, 11` and the lower bound for `6 ≤ i ≤ k`, the sum `Σ_{i ≤ k} log p_i` falls
short of `k(log k + log log k)` by at most `1.2034 k` for every `k ≥ 27` (the maximum is at
`k = 31`); since `y ↦ y/log y` increases for `y ≥ e`, it gives `k log θ(p_k) ≤ 1.3841 θ(p_k)` as soon
as `log(kℓ) ≤ 1.3841 ℓ` with `ℓ = log k + log log k − 1.25`, which holds for every `k ≥ 27` (the last
failure is at `k = 26`). The finite input `PrimorialTableVerified 26` (Layer 0.7) covers
`3 ≤ k ≤ 26`; with the sharper constant `1.0769` of Robin's Théorème 6 (line 29) in place of `1.25`
the analytic step would start at `k = 17`. Robin's Théorème 8 (line 43, the upper bound
`θ(p_k) ≤ k(log k + log log k − 0.9465)` for `k ≥ 14`) is the companion bound and is not needed for
the direction stated here.

*Needs:* `ArithmeticFunction.cardDistinctFactors`; `Nat.nth Nat.Prime`; `Chebyshev.theta`;
`PrimorialTableVerified` (Layer 0.7); the explicit lower bound on `p_k` (ExplicitPrimeCounting §5.3, see
the supplier contracts: `p_k ≥ k(log k + log log k − 1)` for `k ≥ 2`).

### 9.2 Divisor functions

Define `superiorHighlyComposite k ε N` to mean `N ≥ 1` and `τ_k(n)/n^ε ≤ τ_k(N)/N^ε` for every
natural `n ≥ 1` (`teo2026` lines 113–116), with `τ_k = ζ^k` the `k`-fold Dirichlet convolution of
`ζ`.

- For `ε > 0` the set of such `N` is nonempty and finite (since `τ_k(n) n^{−ε} → 0`), and contains the
  largest maximiser `N_{k,ε} = ∏_p p^{a_p}` with `a_p` the largest `a` such that
  `C(a + k − 1, k − 1)/C(a + k − 2, k − 1) ≥ p^ε` (`teo2026` §2).
- `ε ↦ N_{k,ε}` is non-increasing, so for `ε` in a compact interval `[ε₁, ε₂] ⊂ (0, ∞)` only finitely
  many numbers occur.
- `τ_k(N) ≥ k^{ω(N)}`; `N` is divisible by every prime `p` with `p^ε < k`, and the largest maximiser
  `N_{k,ε}` by every prime `p` with `p^ε ≤ k` (at a tie `p^ε = k` with `p ∤ N`, the integers `N` and
  `pN` give the same ratio, since `τ_k(p) = k`).

Prove the Nicolas–Robin theorem: for every natural `n ≥ 3`, `τ(n) ≤ n^{1.538 log 2/log log n}`
(`nicolasRobin1983` lines 10–15 and 159–170, Théorème 1 and Lemme 5; `teo2026` lines 1792–1823, §6.1
and Table 12, where `1.538` rounds up the value `1.5379…` of `log τ(n) log log n/(log 2 log n)` at
`n = 6 983 776 800`), under `SuperiorTableVerified 2 0.1950 0.3466 1.538`
(`sigma_zero_le_nicolasRobin`). Prove the reduction behind it (Teo's §§3–5, with
`durasNicolasRobin1999` for the existence of the maximiser): for `k ≥ 2`, with the explicit
`ε₁(k) < ε₂(k)` and `λ₁(k)` of Teo's Table 16, every `n ≥ 3` has either
`f_k(n) = log τ_k(n) log log n/(log k log n) < λ₁(k)`, or `f_k(n) ≤ f_k(N)` for a superior
`k`-highly composite `N` associated to some `ε ∈ [ε₁(k), ε₂(k)]`; for `k = 2` the parameters are
`(ε₁, ε₂, λ₁) = (0.1950, 0.3466, 1.5126)` (`teo2026` lines 1792–1796), and `λ₁(2) < 1.538`. Prove
Teo's values for `k = 3, 4, 5` in the same way: `τ₃(n) ≤ n^{1.5915 log 3/log log n}`
(`λ(3) = 1.5914…`, attained at `43 243 200`, Table 13, lines 1824–1850; `durasNicolasRobin1999` and
`robin1983thesis` p. 51 state `1.59141`, which Teo notes does not appear in the thesis, line 105),
`τ₄(n) ≤ n^{1.6338 log 4/log log n}` (`λ(4) = 1.6337…` at `259 459 200`, Table 14, lines 1853–1880),
`τ₅(n) ≤ n^{1.6715 log 5/log log n}` (`λ(5) = 1.6714…` at `259 459 200`, Table 15, lines 1883–1913),
each for `n ≥ 3` under the instance of `SuperiorTableVerified` listed in Layer 0.7 (with
`λ₁(3), λ₁(4), λ₁(5) = 1.5882, 1.6265, 1.6657`, all below the stated exponents); and for every
`2 ≤ k ≤ 100` the bound with the exponent `λ(k) + 10^{−4}` of Tables 16–18 (lines 1916–1990 and
following) under the corresponding instance.

Prove the uniform bound `τ_k(n) ≤ n^s ζ(s)^{k−1}` for every natural `n ≥ 1`, real `s > 1` and
natural `k ≥ 1` (`durasNicolasRobin1999` Théorème 1.1(i), p. 744, stated there for real `k ≥ 1`), and
its companions (ii) `log τ_k(n) ≤ (k − 1) log(π²/6) + 2 log n ≤ (k − 1)/2 + 2 log n` and (iii)
`log τ_k(n) ≤ (k − 1) Σ_{p ≤ k^{1/s}} log(1/(1 − p^{−s})) + s log n` for every real `s > 0` (the prime
sum is empty when `k^{1/s} < 2`), by induction on `k` from
`τ_k = τ_{k−1} ⋆ 1`:
`τ_k(n) = Σ_{d ∣ n} τ_{k−1}(d) ≤ ζ(s)^{k−2} Σ_{d ∣ n} d^s = ζ(s)^{k−2} σ_s(n) ≤ ζ(s)^{k−1} n^s`, the last by `σ_s(n)/n^s = Σ_{d ∣ n} d^{−s} ≤ ζ(s)`; the `k = 2` case is Tau Ceti's
`TauCeti.sigma_le_rpow_mul_tsum` at `k = 0` (`τ(n) ≤ n^s Σ_d d^{−s}`); (ii) is (i) at `s = 2` with
`log(π²/6) = 0.4977 ≤ 1/2`; (iii) is the source's refinement, in which only the primes with `p^s ≤ k`
contribute a factor. Record the two-term bounds the same source quotes (pp. 745–746, for `n ≥ 3`):
`log τ(n) ≤ log 2 · (log n/log log n)(1 + 1.9349/log log n)` and
`log τ₃(n) ≤ log 3 · (log n/log log n)(1 + 2.10833/log log n)`, stated by that locator.

*Needs:* `Nat.card_divisors`; `ArithmeticFunction.sigma_zero_apply`; Tau Ceti
`TauCeti.sigma_le_rpow_mul_tsum`; `Real.summable_nat_rpow_inv`; `SuperiorTableVerified`;
AnalyticNumberTheoryPartI §3.7 (cited as the asymptotic form).

### 9.3 Sums of divisors

Prove Nicolas' Théorème 2: for every natural `n ≥ 2`, `σ(n)/n ≤ 2.59791 log log(3τ(n))`
(`nicolas2008` lines 56–62: the constant `2.59790…` is attained at
`n = M₁ = 2⁸·3⁵·5³·7²·11²·13²· ∏_{17 ≤ p ≤ 113} p`, so `2.59791` is a strict upper bound), and
`σ(n)/n ≤ e^γ log log(eτ(n)) + e^γ log log log(e^e τ(n)) + 0.9415` (lines 63–68, inequality (7) of
Théorème 2, with `e^γ` on both iterated logarithms: equality at the displayed `n = M₂`, with
`0.941444079…`, so `0.9415` is strict), under *SuperchampionTableVerified* `15 985 166 000`
(Layer 0.7). Route: Nicolas' benefit method, whose Lemme 7 (lines 399–426) reduces every `n` to the
`(σ, τ)`-superchampions of his §3, with his analytic Lemme 9 (lines 437–443) for `ω(n) ≥ 15 985`,
resp. `ω(n) ≥ 166 000`, and the explicit prime bounds `p_k`, `θ(p_k)` (as in 9.1).

State Robin's unconditional bound, by its locator: for every natural `n ≥ 3`,
`σ(n)/n < e^γ log log n + 0.6483/log log n` (`robin1984` Théorème 2, uncertified; restated at
`axlerNicolas2023` lines 156–161: the constant is the value `0.648213…` at `n = 12`, where equality
holds, so `0.6483` is strict). The source's route reduces to the colossally abundant numbers and
uses explicit bounds for `θ` together with a finite verification over the colossally abundant
numbers below its analytic range, in forms fixed only in the source: the bounds for `θ` are part of
this target, the verification is the source's hypothesis and is not performed here, and the
statement is therefore not one of the acceptance tests of `Suggested.lean`. State Axler–Nicolas'
sharpening (`axlerNicolas2023` (1.22), by its locator):
`σ(n)/n < e^γ log log n + 0.0167853/(log log n)²` for every natural `n > 5040`, as the conjunction
of *RobinInequalityVerified* `M(0)` (Layer 0.7) and the bound with the same constant for `n ≥ M(0)`
of `axlerNicolas2023` (1.18), cited by its locator.

Prove Ivić's bounds: `σ(n) < 2.59 n log log n` for `n ≥ 7` and `σ*(n) < (28/15) n log log n` for
`n ≥ 31` (`ivic1977` lines 19–24, Theorems 1–2), from
`σ(n)/n ≤ ∏_{p ∣ n} p/(p − 1) ≤ ∏_{p ≤ p_{ω(n)}} p/(p − 1)`, the Mertens product of 8.1 (Ivić uses Rosser–Schoenfeld's
`∏_{p ≤ x} p/(p − 1) < e^γ log x (1 + 1/log² x)`, line 52) and `π(x) > x/log x` for `x ≥ 17` (ExplicitPrimeCounting §3.5, see
the supplier contracts), with `σ*(n)/n ≤ ∏_{p ∣ n} (1 + 1/p)`.

State Eum–Koo's `σ(n) ≤ (3/4) e^γ n log log n` for odd `n > 21` (`eumKoo2015`, Theorem 1.1,
uncertified; oddness required: `σ(2) = 3`), by the same route with the odd primes; at `n = 21` the
inequality fails.

*Needs:* `ArithmeticFunction.sigma`; Layer 0.5 (`σ*`); 8.1; 9.1's step on `θ(p_k)`;
ExplicitPrimeCounting §3.5 (`π(x) > x/log x` for `x ≥ 17`, Rosser–Schoenfeld; the explicit-primes
roadmap's Layer 2); ExplicitPrimeCounting §5.3; *SuperchampionTableVerified*; *RobinInequalityVerified*.

### 9.4 The ratio `n/φ(n)`

Prove Rosser–Schoenfeld's Theorem 15 (`rosserSchoenfeld1962` pp. 71–72, (3.40)–(3.42); the second
inequality below, with `2.50637` and `n ≥ 3`, is quoted at `nicolas2008` lines 23–26): for every
natural `n ≥ 2`, `n/φ(n) ≥ 1 + 1/(n − 1)`, and for every natural `n ≥ 3`,

    n/φ(n) < e^γ log log n + 2.50637/log log n,

with `5/2` in place of `2.50637` for every `n ≥ 3` other than `n = 223 092 870 = 2·3·5·…·23`, where the
constant is `2.506369…`. The second inequality is the headline statement
`div_totient_lt_rosserSchoenfeld`, under the estimate `|Σ_{p ≤ x} 1/p − log log x − B| ≤ 1/log³ x`
for `x ≥ 24 284` (ExplicitPrimeCounting §4.3), the bound `θ(x) > x(1 − 1/(2 log x))` for `x ≥ 563`
(ExplicitPrimeCounting §3.2) and `PrimorialTotientTableVerified 24 284`. Route:
`n/φ(n) = ∏_{p ∣ n} p/(p − 1) ≤ ∏_{p ≤ p_k} p/(p − 1)` with
`k = ω(n)` and `n ≥ N_k = p₁ ⋯ p_k`, and `y ↦ e^γ log log y + 2.50637/log log y` increases for
`y ≥ 27`, so for `ω(n) = k ≥ 3` (hence `n ≥ N₃ = 30`) it suffices to treat the primorials `N_k`;
for `p_k ≥ 24 284` the
second quotient of 8.1 gives `∏_{p ≤ p_k} p/(p − 1) ≤ e^γ (log p_k) e^{1/log³ p_k}`
(ExplicitPrimeCounting §4.3) and `log log N_k = log θ(p_k) > log p_k + log(1 − 1/(2 log p_k))`
(ExplicitPrimeCounting §3.2), which close the inequality; the primorials with `p_k < 24 284` are
`PrimorialTotientTableVerified 24 284` (Layer 0.7). The integers with `ω(n) ≤ 2`, among them every
`3 ≤ n ≤ 26`, need no table: `n/φ(n) ≤ (2/1)(3/2) = 3`, while
`e^γ u + 2.50637/u ≥ 2 √(2.50637 e^γ) = 4.2257` for every `u = log log n > 0`. This is the `q/φ(q)`
input of the Burgess constants (ExplicitCharacterSumsAndSieves, Part II).

Prove Nicolas' forms in `log log φ(n)` (`nicolas2008` Théorème 1):
`n/φ(n) ≤ e^γ log log φ(n) + 3.65278…` for `n ≥ 3` (equality at `n = 6`), `n/φ(n) ≤ 3 log log φ(n)` for `n ≥ 211`, and
`n/φ(n) ≤ e^γ log log φ(n) + 2.95503…/log log φ(n)` for `n ≥ 7` (equality at `n = 30 030`), by the
same reduction to primorials. State Robin's sharper constant for large `n` (`robin1984` Théorème 2,
as restated in `axlerNicolas2023` §1): `n/φ(n) < e^γ log log n + 0.6/log log n` for
`n ≥ ∏_{p < 20 000} p`; and Axler–Nicolas' Theorem 1.2 (`axlerNicolas2023` (1.21), by its locator):
`n/φ(n) ≤ e^γ log log n + 0.0167853/(log log n)²` for every `n ≥ X⁽⁰⁾ = exp(12 530 479 255.595931)`,
which fails at the primorial `∏_{p ≤ p_{i−1}} p` just below, `i = 564 397 542`.

*Needs:* 8.1 (the second quotient); 9.1 (the reduction to primorials); `Nat.totient`;
ExplicitPrimeCounting §§3.2, 4.3; Layer 0.7 (`PrimorialTotientTableVerified`).

### Dependencies

Layer 8.1; Mathlib `Nat.nth`, `Chebyshev.theta`, `Nat.card_divisors`, `Nat.totient`, `primorial`;
Tau Ceti `TauCeti.sigma_le_rpow_mul_tsum`; AnalyticNumberTheoryPartI §§3.1, 3.7 (cited); ExplicitPrimeCounting
§§5.3 (9.1, 9.3), 3.5 (9.3), 4.3 and 3.2 (9.4).

## Downstream consumers

- ExplicitNumberFields: the Piltz divisor bounds and the `τ₄` asymptotic with
  *DivisorPowerRangeVerified* (7.5) for regulator-free class-number bounds; the divisor pointwise
  bounds (9.2) for discriminant estimates.
- ProbabilisticAndMetricNumberTheory §3.7: the Rankin-type bound
  `Σ_{n ≤ x} f(n) ≤ x exp(Σ_{p ≤ x} (f(p) − 1)/p)` for multiplicative `f` with `f(p^ν) = f(p) ≥ 1`
  is the instance of 6.1 recorded there; this roadmap precedes that one in the order of supply and
  owns the bound, so §3.7 is a consumer of 6.1 for it.
- ExplicitCharacterSumsAndSieves, Part II: the pointwise bounds on `τ(q)`, `2^{ω(q)}` and `q/φ(q)`
  (Layer 9, in particular Rosser–Schoenfeld's `q/φ(q) < e^γ log log q + 2.50637/log log q` of 9.4,
  and the product bound 6.1) for the Burgess constants; `Σ μ²(n)/φ(n)` with coprimality (7.2) and
  the coprimality removal (6.5) for weights other than `1/φ` in Selberg's density sum (the case
  `f = 1/φ` is its own §5.1). ExplicitCharacterSumsAndSieves itself precedes this roadmap in the
  order of supply, so these uses belong to its Part II.
- ExplicitZetaBounds, Part II: the divisor sums of 7.5 for mean-value and large-sieve constants
  (ExplicitZetaBounds precedes this roadmap).
- ExplicitPrimeCounting, Part II: the coprime Möbius bounds (1.6, 2.4) for explicit prime estimates
  in progressions; the direction of supply from ExplicitPrimeCounting to this roadmap is fixed by
  its contract above, so that use belongs to a Part II of that roadmap.
- SieveMethodsAndPrimePatterns, Part II: the explicit Levin–Fainleib theorem (5.5) and
  `Σ μ²(d)/φ(d)` (7.2) as explicit Selberg main terms; the effective divisor bounds (9.2).

## References

- `akhileshRamare2017`: P. Akhilesh, O. Ramaré, Explicit averages of non-negative multiplicative
  functions: going beyond the main term, Colloq. Math. 147 (2017). Theorems 1.1–1.4, Lemma 2.1.
- `axler2018`: C. Axler, New estimates for some functions defined over primes, Integers 18 (2018),
  #A52; arXiv:1703.08032 v2. Propositions 5.1 and 6.1 (Propositions 7 and 9 in print).
- `axler2022`: C. Axler, Effective estimates for some functions defined over primes,
  arXiv:2203.05917 v4 (preprint). Theorem 1.5, Proposition 6.1, Corollary 6.2.
- `axlerNicolas2023`: C. Axler, J.-L. Nicolas, Large values of `n/φ(n)` and `σ(n)/n`, Acta Arith.
  209 (2023), 357–383. (1.13)–(1.22), Theorem 1.2.
- `balazard2012`: M. Balazard, Elementary remarks on Möbius' function, Proc. Steklov Inst. 276
  (2012). Propositions 1–3, 6–7, identities (8)–(11).
- `banks2026`: W. D. Banks, On the OpenAI proof that Landau–Siegel zeros do not exist,
  arXiv:2610.15483 (unrefereed preprint). Theorem 1.1, Remark 7.1.
- `berkaneBordellesRamare2012`: D. Berkane, O. Bordellès, O. Ramaré, Explicit upper bounds for
  the remainder term in the divisor problem, Math. Comp. 81 (2012). Theorems 1.1–1.2, Corollary
  2.2, Lemma 3.1.
- `bermentRamare2012`: P. Berment, O. Ramaré, Ordre moyen d'une fonction arithmétique par la
  méthode de convolution, Rev. Math. Spéciales (2012). §§4–5, the pedagogical account of the
  convolution method.
- `bordelles2002`: O. Bordellès, Explicit upper bounds for the average order of `d_n(m)` and
  application to class number, JIPAM 3 (2002), Art. 38. Theorems 4.1–4.2 (uncertified).
- `bordelles2005`: O. Bordellès, An explicit Mertens' type inequality for arithmetic
  progressions, JIPAM 6 (2005). Theorem 1 and page 4 (uncertified).
- `bordelles2006`: O. Bordellès, An inequality for the class number, JIPAM 7 (2006), Art. 87.
  Theorem 2.1, Lemma 3.2 (uncertified).
- `bordelles2012`: O. Bordellès, Arithmetic Tales, Springer (2012). Theorem 4.28 (uncertified).
- `bordelles2015`: O. Bordellès, Some explicit estimates for the Möbius function, J. Integer Seq.
  18 (2015). Theorems 1–2, Proposition 3.
- `bordelles2024`: O. Bordellès, An explicit result for short sums of positive arithmetic functions,
  arXiv:2402.12333 v3 (preprint). Lemma 16.
- `bordellesDaval2026`: O. Bordellès, F. Daval, On a smoothed Dirichlet divisor problem,
  arXiv:2601.01905 v3 (preprint). Theorem 1, Corollary 1, Lemma 8.
- `chirreHelfgott2025`: A. Chirre, H. A. Helfgott, Optimal bounds for sums of bounded arithmetic
  functions, arXiv:2511.14736 v1 (preprint). Corollaries 1.2, 1.3, 6.8, 7.13, Lemmas 6.5–6.7, 7.12,
  Proposition 8.4, §9.
- `cipu2015`: M. Cipu, Further remarks on Diophantine quintuples, Acta Arith. 168 (2015). Lemmas
  4.2(a)–(d), 4.3.
- `cohenDress1988`: H. Cohen, F. Dress, Estimations numériques du reste de la fonction sommatoire
  relative aux entiers sans facteur carré (1988) (uncertified).
- `cohenDressElMarraki2007`: H. Cohen, F. Dress, M. El Marraki, Explicit estimates for summatory
  functions linked to the Möbius `μ`-function, Funct. Approx. 37 (2007). Theorem 5 bis, the `x/4345`
  bound (uncertified).
- `costaPereira1989`: N. Costa Pereira, Elementary estimates for the Chebyshev function `ψ(X)`
  and for the Möbius function `M(X)`, Acta Arith. 52 (1989). Theorem 5, Corollary 2, Table III.
- `cullyHugillTrudgian2021`: M. Cully-Hugill, T. Trudgian, Two explicit divisor sums, Ramanujan J.
  56 (2021). Theorems 1–2, (14), (18)–(19).
- `daboussiRivat2001`: H. Daboussi, J. Rivat, Explicit upper bounds for exponential sums over
  primes, Math. Comp. 70 (2001). Lemma 4.
- `daval2023`: F. Daval, Conversions explicites des nombres premiers vers la fonction de Möbius,
  arXiv:2308.10084 v1 (preprint). Théorème A, Lemmes 1, 11, 13, 14.
- `daval2025`: F. Daval, Explicit conversions between summatory functions of the Möbius function,
  Comb. Number Theory 14 (2025), 163–188; arXiv:2006.01295 (French version, whose constants are
  cited). Théorèmes A–B, 2–5, Lemme 1 (uncertified).
- `davenport1937`: H. Davenport, On some infinite series involving arithmetical functions, Quart.
  J. Math. 8 (1937). Lemma 1 (uncertified).
- `deCamargo2025`: A. P. de Camargo, Sharp estimates for the Möbius function with coprimality
  restrictions, Math. Comp. 95 (2026), 2515–2538 (uncertified).
- `dress1993`: F. Dress, Fonction sommatoire de la fonction de Möbius 1. Majorations expérimentales,
  Experiment. Math. 2 (1993), 89–98. Théorème 1, the Möbius table to `10^{12}` (uncertified).
- `dressElMarraki1993`: F. Dress, M. El Marraki, Fonction sommatoire de la fonction de Möbius 2,
  Experiment. Math. 2 (1993) (uncertified).
- `dubbe2020`: F. Dubbe, Explicit bound of the divisor function, Funct. Approx. 63 (2020), 133–136
  (uncertified).
- `durasNicolasRobin1999`: J.-L. Duras, J.-L. Nicolas, G. Robin, Grandes valeurs de la fonction
  `d_k`, in Number Theory in Progress 2 (1999), 743–770. Théorème 1.1(i)–(iii), p. 744; pp. 745–746
  (uncertified).
- `dusart2018`: P. Dusart, Explicit estimates of some functions over primes, Ramanujan J. 45
  (2018) (uncertified).
- `elMarraki1995`: M. El Marraki, Fonction sommatoire de la fonction de Möbius 3. Majorations
  asymptotiques effectives fortes, J. Théor. Nombres Bordeaux 7 (1995). Théorèmes 1–3, (3.1), and the
  corollaries of Théorèmes 2 and 3.
- `elMarraki1996`: M. El Marraki, Majorations de la fonction sommatoire de la fonction `μ(n)/n`
  (1996), preprint (uncertified).
- `eumKoo2015`: I. S. Eum, J. K. Koo, The Riemann hypothesis and an upper bound of the divisor
  function for odd integers, J. Math. Anal. Appl. 421 (2015). Theorem 1.1 (uncertified).
- `granvilleRamare1996`: A. Granville, O. Ramaré, Explicit bounds on exponential sums and the
  scarcity of squarefree binomial coefficients, Mathematika 43 (1996). Lemma 8.6 (uncertified).
- `hallTenenbaum1988`: R. R. Hall, G. Tenenbaum, Divisors, Cambridge (1988). Theorem 01
  (uncertified).
- `hurst2018`: G. Hurst, Computations of the Mertens function and improved bounds on the Mertens
  conjecture, Math. Comp. 87 (2018). §6.1.
- `ivic1977`: A. Ivić, Two inequalities for the sum of divisors functions, Zb. Rad. Prirod.-Mat.
  Fak. Univ. Novi Sad 7 (1977). Theorems 1–2.
- `johnstonLeongTudzi2024`: D. R. Johnston, N. Leong, S. Tudzi, New bounds and progress towards a
  conjecture on the summatory function of `(−2)^{Ω(n)}`, arXiv:2408.04143 v3 (preprint). Appendix,
  Theorems A.1–A.2, Table 1, Lemma A.5.
- `kotnikVanDeLune2004`: T. Kotnik, J. van de Lune, On the order of the Mertens function,
  Experiment. Math. 13 (2004) (uncertified).
- `kreminski2003`: R. Kreminski, Newton–Cotes integration for approximating Stieltjes
  (generalized Euler) constants, Math. Comp. 72 (2003). The value of `γ₁`.
- `kumchevEtAl2023`: A. Kumchev, W. McCormick, N. McNew, A. Park, R. Scherr, W. Ziehr, Explicit
  bounds for large gaps between squarefree integers, arXiv:2211.09975 v3 (preprint). Theorems 1–3.
- `languascoZaccagnini2009`: A. Languasco, A. Zaccagnini, On the constant in the Mertens product for
  arithmetic progressions. II. Numerical values, Math. Comp. 78 (2009), 315–326. (1)–(2), (7),
  Tables 1–3.
- `leeLeong2022`: E. S. Lee, N. Leong, New explicit bounds for Mertens function and the reciprocal
  of the Riemann zeta-function, arXiv:2208.06141 v5 (preprint). (6)–(11), (17), (43), Table 1,
  Lemmas 4.3 and 5.1 with the proof of 5.1, Proposition 5.2.
- `leong2026`: N. Leong, Explicit estimates for the logarithmic derivative and the reciprocal of the
  Riemann zeta function, arXiv:2405.04869 v5, the text read, whose numbering is cited. Corollaries 3
  and 4, Tables 2 and 4.
- `luZamanZhao2026`: R. F. Lu, A. Zaman, H. Zhao, Numerical computations concerning Landau–Siegel
  zeros, Math. Comp. (to appear); arXiv:2602.03626 v2. Theorem 1.1.
- `macleod1967`, `macleod1969errata`: R. A. MacLeod, A new estimate for the sum `M(x)`, Acta
  Arith. 13 (1967), with the errata, Acta Arith. 16 (1969). (4)–(5), §§2–3.
- `moserMacLeod1966`: L. Moser, R. A. MacLeod, The error term for the squarefree integers, Canad.
  Math. Bull. 9 (1966). (4), (8), (9).
- `mossinghoffOliveiraESilvaTrudgian2021`: M. J. Mossinghoff, T. Oliveira e Silva, T. Trudgian, The
  distribution of `k`-free numbers, Math. Comp. 90 (2021); arXiv:1912.04972 v2. Theorems 2–3.
- `nicolas2008`: J.-L. Nicolas, Quelques inégalités effectives entre des fonctions arithmétiques
  usuelles, Funct. Approx. 39 (2008). Théorèmes 2–3, Définition 1, Lemmes 7 and 9.
- `nicolasRobin1983`: J.-L. Nicolas, G. Robin, Majorations explicites pour le nombre de diviseurs
  de `n`, Canad. Math. Bull. 26 (1983). Théorème 1, Lemme 5.
- `openai2026quasiRH`: OpenAI, The quasi-Riemann hypothesis: a zero-free half-plane `Re s > 7/8`
  (unrefereed preprint, 2026). Theorem 1.1.
- `openai2026siegel`: OpenAI, Uniform exclusion of Landau–Siegel zeros (unrefereed preprint, 2026).
  Theorem 1.
- `palojarviTudzi2026`: N. Palojärvi, S. Tudzi, Explicit and effective estimates for the error term
  in the generalised divisor problem, arXiv:2603.16023 v1 (preprint). Theorem 1.1, Lemma 4.1, Table
  2.
- `plattTrudgian2018`: D. Platt, T. Trudgian, Improved bounds on Brun's constant, arXiv:1803.01925.
  Lemmas 1 and 4, §2.1.
- `ramare1995`: O. Ramaré, On Šnirel'man's constant, Ann. Scuola Norm. Sup. Pisa 22 (1995).
  Lemmas 3.2–3.3.
- `ramare2009`: O. Ramaré, Arithmetical aspects of the large sieve inequality, Hindustan Book
  Agency (2009). Theorem 21.1 (uncertified).
- `ramare2013aa`: O. Ramaré, From explicit estimates for the primes to explicit estimates for the
  Möbius function, Acta Arith. 157 (2013). Theorem 1.1, Corollaries 1.2–1.4, Lemmas 4.1–9.1.
- `ramare2013facm`: O. Ramaré, Some elementary explicit bounds for two mollifications of the
  Moebius function, Funct. Approx. 49 (2013). Theorems 1.1–1.2.
- `ramare2014aa`: O. Ramaré, Explicit estimates on the summatory functions of the Moebius function
  with coprimality restrictions, Acta Arith. 165 (2014). Theorem 1.1.
- `ramare2015mc`, `ramare2015corr`: O. Ramaré, Explicit estimates on several summatory functions
  involving the Moebius function, Math. Comp. 84 (2015), and the corrigendum, Math. Comp. 88
  (2019). Theorems 1.1–1.19, Lemmas 1.9, 2.2–2.4, 3.2.
- `ramare2016mc`: O. Ramaré, An explicit density estimate for Dirichlet L-series, Math. Comp. 85
  (2016). Lemmas 3.3–3.4, 4.3.
- `ramare2019bcp`: O. Ramaré, Explicit average orders: news and problems, in Number Theory Week
  2017, Banach Center Publ. 118 (2019). Theorems 1.1, 3.1–3.2, 4.1, 8.1, Corollaries 3.3–3.4,
  Lemmas 8.2, 9.2–9.3.
- `ramareZunigaAlterman2025`: O. Ramaré, S. Zuniga Alterman, From explicit estimates for the primes
  to explicit estimates for the Moebius function II, Funct. Approx. (2025); arXiv:2408.05969 v2.
  Theorem 1.1, Corollaries 1.1–1.3, Lemmas 5.1–7.3, (39).
- `ramareZunigaAlterman2026`: O. Ramaré, S. Zuniga Alterman, Möbius function and primes: an identity
  factory with applications, arXiv:2312.05138 v3 (preprint). Theorems 1.2, 1.3, 1.7, 1.8.
- `rieselVaughan1983`: H. Riesel, R. C. Vaughan, On sums of primes, Ark. Mat. 21 (1983). Lemmas 1–2,
  pp. 48–50 (uncertified).
- `robin1983aa`: G. Robin, Estimation de la fonction de Tchebychef `θ` sur le `k`-ième nombre
  premier et grandes valeurs de la fonction `ω(n)`, Acta Arith. 42 (1983). Théorèmes 6, 8, 11.
- `robin1983thesis`: G. Robin, Grandes valeurs de fonctions arithmétiques et problèmes
  d'optimisation en nombres entiers, thèse, Limoges (1983) (uncertified).
- `robin1984`: G. Robin, Grandes valeurs de la fonction somme des diviseurs et hypothèse de Riemann,
  J. Math. Pures Appl. 63 (1984), 187–213. Théorème 2 (uncertified).
- `rosserSchoenfeld1962`: J. B. Rosser, L. Schoenfeld, Approximate formulas for some functions of
  prime numbers, Illinois J. Math. 6 (1962). Theorems 4–8, 12, 15; pp. 70–72 (uncertified).
- `schoenfeld1969`: L. Schoenfeld, An improved estimate for the summatory function of the Möbius
  function, Acta Arith. 15 (1969). The main inequality; Lemma 2, (10).
- `simonicStarichkova2023`: A. Simonič, V. V. Starichkova, Atkinson's formula for the mean square of
  `ζ(s)` with an explicit error term, J. Number Theory 244 (2023), 111–168. §3, footnote 6.
- `tao2010`: T. Tao, A remark on partial sums involving the Möbius function, Bull. Aust. Math.
  Soc. 81 (2010). Theorem 1.1.
- `teo2026`: L.-P. Teo, Superior highly composite numbers and the explicit upper bound of
  generalized divisor functions, Ramanujan J. 69 (2026), Art. 5; cited with the numbering of arXiv
  v2. §6, Tables 12–18.
- `trevino2015ijnt`: E. Treviño, The Burgess inequality and the least `k`-th power non-residue,
  Int. J. Number Theory 11 (2015). Lemmas 2–3.
- `trevino2015jnt`: E. Treviño, The least `k`-th power non-residue, J. Number Theory 149 (2015).
  Claim 3.1 (uncertified).
- `trudgian2015`: T. Trudgian, Bounds on the number of Diophantine quintuples, J. Number Theory
  157 (2015). Lemmas 13–15.
- `tudzi2025`: S. Tudzi, On the generalised divisor problem, arXiv:2506.21823 v2 (preprint).
  Theorems 1.1–1.2.
- `vanlalngaia2017`: R. Vanlalngaia, Explicit Mertens sums, Integers 17 (2017). Corollary 1,
  Theorems 4, 5 (p. 3), 9.
- `vanLintRichert1965`: J. H. van Lint, H.-E. Richert, On primes in arithmetic progressions, Acta
  Arith. 11 (1965). §1.
- `zunigaAlterman2022`: S. Zuniga Alterman, Explicit averages of square-free supported functions: to
  the edge of the convolution method, Colloq. Math. 168 (2022), 1–23. Theorem 3.3, Corollary 3.4,
  Lemmas 4.1, 4.7.
