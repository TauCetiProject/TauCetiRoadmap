# Roadmap: explicit multiplicative functions

**Summary.** This roadmap builds the numerically explicit layer of multiplicative number theory on
Mathlib's `ArithmeticFunction` carrier: inequalities with stated constants and thresholds for the
summatory functions of the Möbius function `M(x) = Σ_{n ≤ x} μ(n)`, `m(x) = Σ_{n ≤ x} μ(n)/n` and
`m̌(x) = Σ_{n ≤ x} μ(n) log(x/n)/n`, with and without coprimality restrictions and character twists,
and of the Liouville function through `M`; the general conversion theorems behind those numbers
(Meissel's and MacLeod's identities, Balazard's
passage from `M` to `m` and `m̌`, Ramaré's transfer from explicit prime estimates to explicit Möbius
estimates, the comparison theorem of the convolution method, the explicit Levin–Fainleib theorem);
explicit upper bounds for averages of nonnegative multiplicative functions; the explicit averages of
`μ²`, `μ²/φ`, `τ`, `τ_k`, `τ²`, `2^ω`, `φ` and the Piltz remainders `Δ_k`; explicit finite Euler
products over primes; and pointwise bounds for `ω(n)`, `τ_k(n)`, `σ(n)`, `σ*(n)` and `n/φ(n)`, with
highly abundant numbers and the least common multiple of `1, …, n`. Every
result is proved once in a general form whose analytic inputs (a Chebyshev bound of a given shape, a
Möbius table, a finite verification, a computed sum over the zeros of `ζ` up to a height) are
explicit parameters or named propositions, and the published constants are then instances. The end
theorems are Ramaré's transfer theorem with every computation it rests on named, and its instance
`|M(D)| ≤ (0.0130/log D − 0.118/log² D) D` for `D ≥ 1 078 853` (analytic from `2 161 205`, a direct
verification below); the unconditional `L_λ(x) = o(x)` for the summatory function
`L_λ(x) = Σ_{n ≤ x} λ(n)` of the Liouville function, through Davenport's bound for `M` and the
transfer of bounds from `M` to `L_λ`; Tao's bound
`|Σ_{n ∈ ⟨S⟩, n ≤ x} μ(n)/n| ≤ 1` for every set `S` of primes; Balazard's inequality
`|m(x)| ≤ |M(x)|/x + x^{−2} ∫_1^x |M(t)| dt + 8/(3x)` and Ramaré's companion
`|m̌(x) − 1| ≤ ((7/4 − γ)/x²) ∫_1^x |M(t)| dt + 2/x`; the comparison theorem of the convolution
method for a general exponent, with the Dirichlet-divisor model
`Σ_{n ≤ t} τ(n)/n = ½ log² t + 2γ log t + γ² − 2γ₁ + O*(1.16 t^{−1/3})` for `t ≥ 1` (analytic from
`236`, a direct verification below; with `1.641` in place of `1.16` for every `t > 0`, the form the
comparison theorem consumes); the Hall–Tenenbaum
inequality; the explicit Mertens product
`e^γ log x ∏_{p ≤ x}(1 − 1/p) ∈ [1 − 1/log² x, 1 + 1/(2 log² x)]` with Axler's refinement
`e^γ log x ∏_{p ≤ x}(1 − 1/p) < 1 + 0.07/log³ x` and Dusart's two-sided cubic form, in which both
`e^γ log x ∏_{p ≤ x}(1 − 1/p)` and its reciprocal lie strictly between `1 − 0.2/log³ x` and
`1 + 0.2/log³ x` for every real `x ≥ 2 278 382` (from `2 278 383` by the transfer, a direct
verification on the unit interval below); Robin's `ω(n) ≤ 1.3841 log n/log log n`, the
Nicolas–Robin maximum `τ(n) ≤ n^{1.538 log 2/log log n}` and Rosser–Schoenfeld's
`n/φ(n) < e^γ log log n + 2.50637/log log n`, all for `n ≥ 3`; and a criterion in terms of six
primes in `(√n, n)` for `lcm(1, …, n)` not to be highly abundant, with its consequence, from
Dusart's primes in short intervals, that `lcm(1, …, n)` is not highly abundant for any
`n ≥ 89 693²`. Robin's
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
  `3 000 175 332 800` and the records `BrentPlattTrudgianRecord` and `LeongRecord` of
  ExplicitZetaBounds §0.4b, with the two bounds of Leong near that height that the join of its
  contour uses, and the Liouville summatory function with its identities with `M` and the transfer
  of bounds between the two (Layer 1);
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
  smoothed form, the squarefree count and remainder written through `M`, the squarefree remainder
  from finitely many zeros with squarefree integers in short intervals, and the explicit Piltz
  remainders `Δ_k` (Layer 7);
- the identification of the Meissel–Mertens constant with Tau Ceti's `mertensConstant ℚ`, the
  explicit Mertens product with Axler's cubic refinement, Dusart's two-sided cubic form and its
  form under the Riemann hypothesis, the tilted products and Bordellès'
  products over a progression with Languasco–Zaccagnini's constants as an enclosure (Layer 8);
- the pointwise bounds for `ω(n)`, `τ_k(n)` (among them `k^{ω(n)} ≤ τ_k(n) ≤ k^{Ω(n)}`), `σ(n)`,
  `σ*(n)` and `n/φ(n)` with the superior-highly-composite and primorial tables as hypotheses, and
  highly abundant numbers with the theorem that `lcm(1, …, n)` is not highly abundant for
  `n ≥ 89 693²` (Layer 9).

### Consumed, not redefined

- the arithmetic functions `μ`, `σ_k`, `ω`, `Ω`, `Λ`, `ζ`, the Liouville function,
  `IsMultiplicative`, Dirichlet convolution, `Chebyshev.psi`, `Chebyshev.theta`, the least common
  multiple `Nat.lcmUpto`, Abel summation, the harmonic bounds, Euler's constant with its
  bounds `1/2 < γ < 2/3`, `ζ(2) = π²/6`, Dirichlet characters with `L(1, χ) ≠ 0`, the primorial, and
  the decimal bounds for `π`, `e` and `log 2`: Mathlib, as listed in the supplier contracts;
- the summatory Abel formulas of Tau Ceti and its Mertens constant `mertensConstant K`;
- the explicit prime estimates with constants (for `ψ`, `θ`, `π`, the `k`-th prime,
  `Σ_{n ≤ x} Λ(n)/n`, `Σ_{p ≤ x} 1/p`, `θ` in progressions and primes in short intervals), the
  verified range of Büthe, the decimal enclosures of `γ` and of the Meissel–Mertens constant, the
  hypothesis `RH(H)` and the real-zero gap with its named instances, and Büthe's asymptotic for the
  diagonal sum `Σ_{n ≤ z} μ²(n)/φ(n)`: ExplicitPrimeCounting §§0.1, 1.1, 1.3, 1.6, 1.7, 3.1–3.3,
  3.5, 4.2, 4.3, 4.7, 5.3, 6.1, 6.3 and 7.4, as listed in its contract; the estimates it does not
  state in the shape a proof here needs are supplier gaps of that contract. No prime estimate is restated: every
  theorem that uses one takes it as a hypothesis of the stated shape;
- the Rosser–Schoenfeld reciprocal-prime estimate `|Σ_{p ≤ x} 1/p − log log x − B| < 1/(2 log² x)`
  for `x ≥ 286`, Mertens' theorems with qualitative remainders, the qualitative exclusion of
  Landau–Siegel zeros, the Dirichlet divisor asymptotic, the harmonic remainder
  `0 < H_N − log N − γ < log(1 + 1/N)` at integers, the divisor hyperbola identity, the
  Dirichlet-divisor remainder `divisorError` (`Δ`) with its square-root and cubic bounds and their
  finite input `BBRFiniteInput`, the divisor subpower bound, the asymptotic maximal order of `τ`,
  Rankin's smooth-number bound, the asymptotic coprime Möbius sums and Davenport's
  `M(y) = O_A(y (log y)^{−A})`: AnalyticNumberTheoryPartI
  §§0.11, 0.19, 0.21, 0.26, 0.34, 1.2, 3.1, 3.7, 3.9, 3.12, 3.22, 3.22a, 3.22b, 3.23a, 3.35, 3.35a,
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
  `RH(3 000 175 332 800)` and `BrentPlattTrudgianRecord`, and Leong's line bound and the bound on
  `σ ≥ 3/4` also given `LeongRecord` (records of its §0.4b). Two further bounds of Leong that only
  the join of that contour uses, at heights just below the verified one, are stated in 1.9: a row
  of the corollary whose classical-region row §7.10 states, and the bound for `ζ'/ζ` that §7.10's
  route uses without stating it. The bound for `1/ζ` on `σ = 3/4`, `|t| ≤ 14`, a computation on a
  compact segment, is the proposition *ZetaReciprocalSegmentVerified* of Layer 0.7;
- the explicit Pólya–Vinogradov and Burgess inequalities and the explicit sieve bounds
  (ExplicitCharacterSumsAndSieves): Layer 4 takes a Pólya–Vinogradov bound as a parameter, and what
  this roadmap consumes from that roadmap is its §5.1 (above);
- any computational algorithm: sieving `M(x)`, evaluating a constant, verifying a table. A page on
  exact computation contributes a verified value only, as a proposition that this roadmap states
  and does not discharge (Layer 0.7);
- Vanlalngaia's constant `0.841` for the tilted products (`vanlalngaia2017` Theorem 5, p. 3): its
  input is that paper's Theorem 4, a remainder for `Σ_{p ≤ x} 1/p` in terms of `θ(x) − x`
  (`vanlalngaia2017` lines 90–108, proved at lines 423–429 by Stieltjes integration against `θ`),
  which no section of ExplicitPrimeCounting states (its §4.3 uses it only inside the route of
  Vanlalngaia's Corollary 3); Layer 8.2 proves the transfer with the cubic reciprocal-prime
  remainder instead;
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
- the Rankin-type bound `Σ_{n ≤ x} f(n) ≤ x exp(Σ_{p ≤ x} (f(p) − 1)/p)` for every real `x ≥ 1` and
  every multiplicative `f` with `f(p^ν) = f(p) ≥ 1` for every prime `p` and `ν ≥ 1`
  (ProbabilisticAndMetricNumberTheory §3.7, which precedes this roadmap in the order of supply);
  Bordellès' bound of Layer 6.4 differs in keeping the product `∏_{p ≤ x}(1 + (f(p) − 1)/p)` in
  place of its exponential and in allowing `f(p^ν)` to increase with `ν`;
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
here. `Ω` is `ArithmeticFunction.cardFactors`. `ψ` and `θ` are `Chebyshev.psi` and
`Chebyshev.theta` (inclusive cutoffs). `γ` is `Real.eulerMascheroniConstant`.
`ψ̃(x) = Σ_{n ≤ x} Λ(n)/n`. `p_k` is the `k`-th prime,
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
Witness of the sign and normalisation: the constant term of `Σ_{n ≤ t} τ(n)/n` is
`γ² − 2γ₁ = 0.4788…`, not `γ² − γ₁ = 0.4060…` (Layer 5.2, Checks).

Hypotheses. Every finite computation, table or numerical record a source relies on is a named
proposition (Layer 0.7) with the range and the constant as data; a theorem that uses one takes it as
an argument, and no proposition of this roadmap is proved, discharged or recomputed here. When the
computation is the theorem's own inequality on an initial interval, the theorem proved is the
inequality beyond that interval, and the statement over the full range is its conjunction with the
proposition; wherever a statement below is said to hold "under" or "with" such a proposition on its
initial range, this conjunction is meant, and the proposition is never a hypothesis of the theorem
whose conclusion it restricts. A check, interval by interval, of a step function against a smooth
model with the decimal enclosures of `γ` and `γ₁` is such a computation (5.2 on `[1, 236]`, 7.4 on
`[1, 7)`). Finitely many rational inequalities that the pinned library's own enclosures settle (2.5,
through `Real.pi_gt_d6` and `Real.pi_lt_d6`) are steps of a proof, not propositions. Every explicit
prime estimate is likewise a hypothesis of the exact
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
  `Real.add_one_le_exp`;
- `ArithmeticFunction.liouville` (`λ(n) = (−1)^{Ω(n)}` for `n ≥ 1`,
  `Mathlib/NumberTheory/ArithmeticFunction/Liouville.lean`) with
  `ArithmeticFunction.isMultiplicative_liouville`, `ArithmeticFunction.cardFactors` (`Ω`),
  `ArithmeticFunction.isMultiplicative_zeta` and `ArithmeticFunction.IsMultiplicative.pow`, used in
  Layers 1.6a and 9.2;
- `Nat.lcmUpto` (`lcm(1, …, n)` as `(Icc 1 n).lcm id`, `Mathlib/NumberTheory/Chebyshev.lean`),
  `Nat.factorization_lcmUpto` (`v_p(lcm(1, …, n)) = Nat.log p n` for prime `p`) and
  `Chebyshev.psi_eq_log_lcmUpto` (`ψ(n) = log lcm(1, …, n)`), used in Layer 9.3a.

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

- §0.11: `Σ_{p < X} (log p)/p = log X + O(1)`, the qualitative input of Layer 6.3's hypothesis `A`
  and of the Checks of Layer 5.5;
- §0.19: there is a real `B` with `|Σ_{p ≤ x} 1/p − log log x − B| < 1/(2 log² x)` for every real
  `x ≥ 286` (Rosser–Schoenfeld Theorem 5), unconditional; Layer 8.1 identifies this `B` with
  `mertensConstant ℚ`, and Layer 1.4 uses its lower half for Schoenfeld's inequality;
- §0.21: `Σ_{p ≤ x} 1/p = log log x + B + O(1/log x)` for `x ≥ 2`, and §0.26:
  `∏_{p ≤ x}(1 − 1/p)^{−1} = e^γ log x + O(1)` for `x ≥ 2`; together they give the identity
  `B = γ + Σ_p (log(1 − 1/p) + 1/p)` used in Layer 8.1;
- §0.34: the uniform exclusion of Landau–Siegel zeros (`landau_siegel_exclusion`), the qualitative
  statement whose explicit forms are ExplicitPrimeCounting §1.7's; cited only;
- §1.2: Davenport's bound `davenport_moebius`, for every `A > 0` a constant `C_A` with
  `sup_{α ∈ ℝ} |Σ_{1 ≤ r ≤ y} μ(r) e^{irα}| ≤ C_A y (log y)^{−A}` for every real `y ≥ 2`; used at
  `α = 0`, where the sum is `M(y)`, for the unconditional `o(x)` of Layer 1.6a;
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
  `Σ_{t ≤ T, (t, q) = 1} μ(t)/t = O_A((log T)^{−A})`: the qualitative forms of Layer 2.4, used in the
  Checks of Layer 5.4;
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
  verified-height hypothesis of Layer 1.9. The proposition is ExplicitZetaBounds §0.2's, which §1.1
  cites; by its antitonicity `RH(3 000 175 332 800)` gives `RH(3·10¹²)`, the verification that the
  supplier statements 1.9 uses ask for beside their records (ExplicitZetaBounds contract below).
- §1.3, the proposition *ButheVerified*: `|ψ(x) − x| ≤ 0.94 √x` for every real `11 < x ≤ 10^{19}`.
  Used in Layers 1.8 and 1.10; it also gives the first clause of `gap:psi-initial-range` on
  `(11, 10^{10}]`.
- §1.6: the decimal enclosures *EulerGammaEnclosure* (`|γ − 0.5772156649| < 10^{−9}`) and
  *MeisselMertensEnclosure* (`|B − 0.2614972128| < 10^{−9}` for `B = mertensConstant ℚ`), stated
  there once for both roadmaps. Used wherever a proof here evaluates `γ` or `B` numerically
  (Layers 5.2, 7.6, 8.1).
- §1.7: the proposition *RealZeroGap* `c Q` with its two instances *RealZeroGap* `(1/5) 10^{10}`
  given `LuZamanZhaoRecord` (the record of ExplicitZetaBounds §0.4b) and *RealZeroGap*
  `(3.0·10^{−3}) ∞` given `LuZamanZhaoRecord` (Banks's instance, a preprint), which a statement
  that uses it takes itself as a hypothesis (zero-free inputs, below).
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
  `x ≥ 1 757 126 630 797`, used in Layers 8.1 and 8.2; and the row `(0.19992, 2 278 383)` of
  Broadbent–Fiori–Kadiri–Ng–Wilk (a preprint), `|Σ_{p ≤ x} 1/p − log log x − B| ≤ 0.19992/log³ x`
  for every real `x ≥ 2 278 383`, whose upper half is used in Layer 8.1a.
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
- §7.4: Dusart's interval, a prime in `(y, y(1 + 1/log³ y)]` for every real `y ≥ 89 693`
  (`dusart2018` Proposition 5.4 in print), used in Layer 9.3a.

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
- §0.4b: the records `BrentPlattTrudgianRecord` (Brent, Platt and Trudgian's value of
  `Σ_{γ>0} γ^{−2}` over the zeros of `ζ`, to within `5·10^{−28}`) and `LeongRecord` (Leong's
  computation, for `t ≤ 500`, of his bounds for `1/ζ` on and near the line one), recorded there as
  hypotheses: hypotheses of the statements of §§7.3 and 7.10 below, and so of Layer 1.9; neither is
  discharged here.
- §6.1: the smoothed truncated Perron formula, whose error term stays finite when `x` is an integer;
  an alternative to Tau Ceti's `TauCeti.norm_truncatedPerron_LSeries_sub_sum_le` in the route of
  Layer 1.9.
- §7.3, the classical zero-free region in its `5.558691` instance: given `RH(3·10¹²)` and
  `BrentPlattTrudgianRecord`, `ζ(σ + it) ≠ 0` for every real `t` with `|t| ≥ 2` and every real
  `σ ≥ 1 − 1/(5.558691 log|t|)`, hence for every `R₀ ≥ 5.558691` in place of `5.558691`; at
  `R₀ = 5.56` it keeps the zeros out of the region that the contour of Layer 1.9 encloses above the
  height `H₀`.
- §7.10: the bounds for `1/ζ` that the route of Layer 1.9 uses, each given `RH(H₀)` and
  `BrentPlattTrudgianRecord`, and the second and third also given `LeongRecord`: Lee and
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

§7.10 meets the supplier gap `gap:zeta-reciprocal-bounds` of Layer 1.9: it states, given `RH(H₀)`
and `BrentPlattTrudgianRecord`, the bound `1237 (log t)^{11/12}` above `H₀`, and, given
`LeongRecord` as well, the bound `30.812 log t` on `σ ≥ 1` for `t ≥ 13` and the bound
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
  ExplicitPrimeCounting §1.7's *RealZeroGap* `c Q`, with the instances *RealZeroGap*
  `(1/5) 10^{10}` (the computation of `luZamanZhao2026`, given its record `LuZamanZhaoRecord` of
  ExplicitZetaBounds §0.4b) and *RealZeroGap* `(3.0·10^{−3}) ∞` given `LuZamanZhaoRecord`
  (`banks2026`, an unrefereed preprint, whose instance any statement that uses it takes itself as a
  hypothesis). No theorem of this roadmap is proved from them. They bear on two inputs only: the
  exceptional-zero branch of ExplicitPrimeCounting §6.3 for moduli beyond `10^5`, which Layer 8.3
  consumes only through that section, and any lower bound for `|L(1, χ)|` uniform in `q` that a
  consumer of Layer 4.1 supplies; no numerical lower bound for `L(1, χ)` derived from them is in
  print, so `|L(1, χ)|` is a parameter of 4.1.
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

**Checks.**

- `M(1) = 1`, `M(2) = 0`, `M(3) = M(4) = −1`, `M(5) = −2`, `M(10) = −1`, `M(13) = −3`,
  `M(0.5) = 0`, `M(2.9) = M(2) = 0`; a sum over `Finset.range ⌊x⌋₊` would give `M(1) = μ(0) = 0`.
- `m(1) = 1`, `m(2) = 1/2`, `m(3) = 1/6`, `m(6) = 2/15`, `m(7) = −1/105`; the first negative value is
  at `x = 5`, `m(5) = −1/30`.
- `m̌(1) = 0`, `m̌(2) = log 2/1 = 0.6931…`, `m̌(3) = 0.8959…`, `m̌(30) = 1.00302…` (the maximum of
  `m̌`, Layer 3.3); a definition with `log(n/x)` in place of `log(x/n)` would make `m̌(2) < 0`.
- Non-example: `m̌` is not a step function; `m̌(1.5) = log 1.5 = 0.405… ≠ m̌(1) = 0`.

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

**Checks.**

- `S = {2}`: `⟨S⟩ = {1, 2, 4, 8, …}`, `M_S(x) = 1 − 1 = 0` for `x ≥ 2` and `1` for `1 ≤ x < 2`;
  `m_S(x) = 1/2` for `x ≥ 2`.
- `q = 2`, `x = 10`: `m_2(10) = 1 − 1/3 − 1/5 − 1/7 = 34/105` (the odd `n ≤ 10` with `μ(n) ≠ 0`
  are `1, 3, 5, 7`); the decomposition gives
  `m(10) + m(5)/2 + m(2.5)/4 + m(1.25)/8 = 19/210 − 1/60 + 1/8 + 1/8 = 34/105`, both sides equal. The value `31/105` printed at
  `ramare2015mc` line 329 is a misprint: only `34/105` is consistent with the bound `≥ 0.260·2/log 5`
  on the same line.
- `w_{S_6} = 6/φ(6) = 3`; `w_{S_1} = 1`; the weight of the set of all primes is the empty product
  `1`.
- Non-example: with `S` the set of all primes except infinitely many, `w_S` is the divergent product
  of `(1 − 1/p)^{−1}` over the excluded primes; every coprime bound below excludes finitely many
  primes.
- `S = {2, 3}`, `x = 6`: `m_S(6) = 1 − 1/2 − 1/3 + 1/6 = 1/3` (the `S`-factored `n ≤ 6` are
  `1, 2, 3, 4, 6`); a restriction to the `n` with at least one prime factor in `S` would drop
  `n = 1` and give `−1/2 − 1/3 + 1/6 = −2/3`.

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

**Checks.**

- `X = 1`: `R₁(1) = 1 − γ = 0.4227…`, below `6/11 = 0.5454…`, `γ = 0.5772…` and also `1/2`; the
  constant `1/2` fails only as `X → 2⁻`, where `R₁(X) → 1 − log 2 − γ = −0.27036` and
  `X |R₁(X)| → 2(log 2 + γ − 1) = 0.540726…`, below `6/11`: the constant `6/11` is nearly optimal.
- `X = 1/2`: the sum is empty, `R₁(1/2) = log 2 − γ = 0.1159…`, within `γ/X = 1.154…`; the form
  `6/(11X)` is stated only for `X ≥ 1`; at `X = 0.1`, `R₁ = 2.302 − 0.577 = 1.725 ≤ γ/0.1 = 5.77`.
  A definition summing over `Finset.range ⌊X⌋₊` would include the junk term `1/0 = 0` and drop
  `n = ⌊X⌋`, giving `R₁(1) = −γ`.
- `t = 1/8`: `|R₁| = log 8 − γ = 1.502…` and `0.9105 t^{−1/3} = 1.821`; at
  `t = e^{−3−γ} = 0.02794…` the left side is `3` and `t^{−1/3} = 3.2950…`, so the constant `0.9` fails there
  (`0.9·3.2950 = 2.966 < 3`) while `0.9105` holds (`3.0001 ≥ 3`): `3 e^{−1−γ/3} = 0.910471…` is the
  least admissible constant on `(0, 1)` (`ramare1995` lines 364–366: the minimum of
  `log t + γ + a t^{−1/3}` is at `t = (a/3)³`, and its vanishing gives `a = 3 exp(−1 − γ/3)`).

### 0.4 Sum of the integers up to a real bound

Prove that for every real `X ≥ 0` and every `c ∈ [1, 2]`, `Σ_{q ≤ X} q = X²/2 + O*(X^c/2)`
(`ramare2016mc` lines 540–562, Lemma 4.3). Route: for `Q ≤ X < Q + 1` with `N = Q(Q + 1)/2`, split at
`√(2N)` and use that `X ↦ X^c − X² + 2N` is monotone on each piece.
*Needs:* `Finset.sum_range_id_mul_two`; `Real.rpow` monotonicity.

**Checks.**

- `X = 1`, `c = 1`: `1 = 1/2 + 1/2`, equality; `c = 2`: `1 ≤ 1/2 + 1/2`.
- `X = 0.5`: the sum is `0` and `X²/2 = 1/8 ≤ X^c/2` for every `c ∈ [1, 2]`; with `c = 3` the claim
  fails at `X = 0.5` (`1/8 > 1/16`), so the range of `c` is needed.
- `X = 2.999`, `c = 1`: the sum is `3`, `X²/2 = 4.497`, the difference `1.497 ≤ 1.4995`.

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

**Checks.**

- `R(1) = 1 − 6/π² = 0.3920…`, `R(4) = 3 − 24/π² = 0.5682…`; a count over `Finset.range ⌊x⌋₊` would
  drop `n = ⌊x⌋` and give `R(1) = −6/π²`.
- `R(176) = 106 − 1056/π² = −0.9952…` (`Q(176) = 106 = (53/88)·176`: Rogers' `Q(x) ≥ (53/88) x` with
  equality only at `x = 176`, `moserMacLeod1966` line 9).
- `R(0.5) = −3/π²`: the count is empty below `1`, and `R(x) = −6x/π²` on `(0, 1)`.
- `Δ(1) = 1 − (2γ − 1) = 2 − 2γ = 0.8456…`, `Δ(4) = 8 − 4(log 4 + 2γ − 1) = 1.8371…` (values of
  AnalyticNumberTheoryPartI's `divisorError`); `Δ(1980) = 22.339 > 0.5 √1980 = 22.249` and
  `Δ(5460) = 31.391 > 0.4 √5460 = 29.557`, the sharpness witnesses of Layer 7.4; the witness
  `x = 5559` printed at `berkaneBordellesRamare2012` line 68 is not one, since `Δ(5559) = −0.705`.
- `σ*(12) = 1 + 3 + 4 + 12 = 20` while `σ(12) = 28`: the divisors `2` and `6` are not unitary.
- `σ*(30) = σ(30) = 72` (squarefree, every divisor unitary); `σ*(1) = 1`.
- `σ*(p^a) = p^a + 1`, so `σ*(8) = 9 ≠ σ(8) = 15`; a definition with `Nat.Coprime d n` in place of
  `Nat.Coprime d (n/d)` would give `σ*(8) = 1`.
- `γ₁ = −0.0728158…`: the partial sums `Σ_{n ≤ N} (log n)/n − ½ log² N` at `N = 10^6` give
  `−0.07281…`; the sign convention is the one for which `ζ(1 + s) = 1/s + γ − γ₁ s + …`, and the
  Dirichlet-divisor constant `γ² − 2γ₁ = 0.4788…` is matched by
  `Σ_{n ≤ 10^6} τ(n)/n − ½ log² 10^6 − 2γ log 10^6 = 0.47890…`, which excludes `γ² − γ₁ = 0.4060…` and `γ² + 2γ₁ = 0.1876…`.
- `γ₁` at `N = 10`: `Σ_{n ≤ 10} (log n)/n − ½ log² 10 = 2.69218 − 2.65095 = 0.04123`, against
  `γ₁ + (log 10)/20 = 0.04231` from the next Euler–Maclaurin term; a definition with `log² N` in place
  of `½ log² N` would tend to `−∞`, and one with `Σ (log n)/n²` would converge to `−ζ'(2) = 0.9375…`.
- `γ₁ ≠ γ`: the analogous limit of `Σ_{n ≤ N} 1/n − log N` is `γ = 0.5772…`, of the other sign and
  eight times larger; `stieltjesGammaOne` is the next coefficient, not this one.

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

**Checks.**

- `h = δ` (the identity of convolution, `h(1) = 1`, `h(n) = 0` otherwise): every local factor is
  `1`, `H ≡ 1`, `H' = H'' = 0`, `H̄(−1/3) = 1`.
- `h(n) = μ(n)/n²` (so `H(s) = 1/ζ(s + 2)`): `H(0) = 6/π²`,
  `H̄(−1/3) = Σ μ²(n) n^{−5/3} = ζ(5/3)/ζ(10/3) = 1.8508…`, and
  `H'(0) = −Σ μ(n) log n/n² = −ζ'(2)/ζ(2)² = (6/π²)·0.56996… = 0.34649…`: the sign is pinned by
  `H'(0) = H(0) Σ_p (log p/p²)/(1 − 1/p²) = (6/π²) Σ_p log p/(p² − 1) > 0`; a definition `H'(0) = +Σ h(n) log n` would give `−0.34649`.
- `h(n) = μ(n)/n` has `H̄(s) = Σ μ²(n) n^{−1−s}` divergent at `s = 0`: outside the hypothesis, and
  the formulas are not claimed; with `s₀ = 1/3` in place of `−1/3` the hypothesis is not the one of
  Layer 5.1.
- The boundary `s = s₀` is excluded from the derivative formulas: for a real `s₀ < 0` let `h` be
  multiplicative with `h(p) = p^{s₀ − 1}/(log log p)²` at the odd primes and `h(2) = h(p^ν) = 0` for
  `ν ≥ 2`. Then `H̄(s₀) = ∏_{p ≥ 3} (1 + 1/(p (log log p)²))` is finite, since
  `Σ_p 1/(p (log log p)²)` converges, while `Σ_n |h(n)| (log n) n^{−s₀} ≥ Σ_{p ≥ 3} log p/(p (log log p)²)`
  diverges (by partial summation from `Σ_{p ≤ x} (log p)/p = log x + O(1)`, its partial sums are
  asymptotic to `log x/(log log x)²`); as every `h(n)` is nonnegative, the right derivative of `H`
  at `s₀` is `−∞`.

### 0.7 Computational hypotheses

Each item below is a proposition (a definition, not a theorem) with its range and constants as
data; it records a finite computation, table or numerical value that a source supplies, or the
bounded range that a source's proof needs below a supplier estimate or below its own analytic
argument. None is proved, discharged or recomputed here; each is a hypothesis of the theorems that
use it. The five that a headline theorem of `Suggested.lean` needs are declared there; the others
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
  `(x ↦ 0.0130073/log x, [120 561, 230 000))` (2.3; `daval2025`, which prints `97 603`, its arXiv
  version `97 063`), `(x ↦ 0.8/log² x, (1, 33])` and
  `(x ↦ 3.01/log² x, 33, 10^{16})` (2.3; `johnstonLeongTudzi2024` Theorem A.2) and
  `(X ↦ (0.010032 log X − 0.0568)/log² X, [617 990, 1.5·10^7))` (2.6; `ramareZunigaAlterman2025`).
- *MoebiusLogRangeVerified* `ε a b`: `|m̌(x) − 1| ≤ ε(x)` for every real `x ∈ [a, b]`; instances
  `(x ↦ 0.0192/√x, 340 000, 1.2·10^7)`, `(x ↦ 0.0218/√x, 11, 1.2·10^7)` and
  `(x ↦ 1/√x, 1, 1.2·10^7)` (`ramare2015mc` Lemma 10.2, lines 1157–1164),
  `(x ↦ 0.00140/log x, 9550, 24 832)` (3.2; `ramare2015corr` lines 237–239, there to `18 100`) and
  the initial ranges of the other rows of 3.2 (3.2, 3.3).
- *MoebiusLogUpperRangeVerified* `c a b`: `m̌(x) ≤ c` for every real `x ∈ [a, b]`; instance
  `(m̌(30), 1, 44)` (3.3; the computation behind Balazard's optimal constant, `balazard2012` line 717,
  quoted at `ramare2015mc` lines 284–285). It is one-sided because `m̌ − 1` is far below `0` near
  `x = 1` while the bound needed is `m̌ ≤ m̌(30)`, within `0.0031` of `1`.
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
- *DivisorHarmonicRangeVerified* `c a b`: `|Σ_{n ≤ t} τ(n)/n − P(t)| ≤ c t^{−1/3}` for every real
  `t ∈ [a, b]`, with `P` of 5.2; instance `(1.16, 1, 236)` (5.2). This is the routine that completes
  `berkaneBordellesRamare2012` Corollary 2.2 (lines 1146–1147). The source's printed table (line
  1150, `0.60` on `[1, 2]`) was computed with the misprinted constant term `γ² − γ₁`.
- *DivisorSmoothedRangeVerified* `c a b`: `|Δ(x) − x δ(x) − 1/4| < c` for every real `x ∈ [a, b)`,
  with `δ(x) = Σ_{n ≤ x} τ(n)/n − P(x)` and `P` of 5.2; instance `(0.247, 1, 7)` (7.4; the range of
  `bordellesDaval2026` Corollary 1 below the reach of its Theorem 1).
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
- *StieltjesGammaOneEnclosure*: `|γ₁ + 0.0728158454836767248605863758749013191377| ≤ 10^{−40}`, with
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
- *MertensProductDusartRangeVerified* `a b`: `e^γ log x ∏_{p ≤ x}(1 − 1/p) > 1 − 0.2/log³ x` and
  `∏_{p ≤ x}(1 − 1/p)^{−1}/(e^γ log x) < 1 + 0.2/log³ x` for every real `x ∈ [a, b)`; instances
  `(2 278 382, 2 278 383)` and `(2 278 382, 46 909 074)` (8.1a; within the range of `dusart2018`
  Theorem 5.9).
- *ProgressionProductTableVerified* `q a C X₀ X₁`:
  `∏_{p ≤ x, p ≡ a (mod q)} (1 − 1/p)^{−1} ≤ C (log x)^{1/φ(q)}` for every real `x ∈ [X₀, X₁]` (8.3;
  `bordelles2005` Theorem 1).
- *PolyaVinogradovBound* `χ P`: `|Σ_{n ≤ N} χ(n)| ≤ P` for every natural `N`, for a Dirichlet
  character `χ` and a real `P` (4.1; supplied by an explicit Pólya–Vinogradov inequality).

**Checks.**

- `MoebiusTableVerified c H` with `H < 33` is vacuous; with `c = 0.5`, `H = 10^{10}` it is false,
  since `|M(7 766 842 813)|/√(7 766 842 813) = 0.5705…` exceeds `0.5` (`hurst2018` line 426); so the
  constant `0.571` is sharp over `[33, 10^{16}]` and the instance `(0.5, 10^{16})` is the negative
  control.
- The lower end `33` of `MoebiusTableVerified` is needed: `M(31) = −4` and
  `|M(31)|/√31 = 0.7184 > 0.571`, `|M(32)|/√32 = 0.7071`, while `|M(33)| = 3 ≤ 0.571 √33 = 3.280` and the largest value of
  `|M(n)|/√n` on `[33, 2000]` is `0.5671`.
- *MoebiusLogUpperRangeVerified* `(m̌(30)) 1 44` holds with equality at `x = 30`: on `[N, N + 1)`
  the sum `m̌(x) = m(N) log x − Σ_{n ≤ N} μ(n) log n/n` is monotone in `log x`, so both ends of
  each unit interval suffice, and the largest value is `m̌(30) = 1.0030213`. The instance with
  `1.0030` in place of `m̌(30)` fails at `x = 30`. The two-sided *MoebiusLogRangeVerified*
  `(x ↦ m̌(30) − 1) 1 44`, which would give the same upper bound, is false at `x = 1`, where
  `|m̌(1) − 1| = 1`.
- The range end `44` is where the `1/500` row of 3.2 takes over: *MoebiusLogUpperRangeVerified*
  `1.002 44 (2·10^7)` holds (largest value `1.0017953`, at `x = 44`), and with `43` in place of `44`
  it fails (`m̌(43) = 1.0022775`).
- *MoebiusAbsIntegralLE* `1 0` is true (empty integral); *MoebiusAbsIntegralLE* `2 0` is false since
  `|M(t)| = 1` on `[1, 2)`. *MoebiusLogIntegralLE* `1 078 853 302` holds (`301.904…`) and
  *MoebiusLogIntegralLE* `1 078 853 301.9` fails.
- *MoebiusStarRangeVerified* with the source's row `(y ↦ y/(1 + log y), 1, 8·10^7)` (Lemma 16.6,
  `x > 1`) is false: at `y = 5` the sum is `|M(5)| + |M(5/4)| = 2 + 1 = 3`, against
  `5/(1 + log 5) = 1.9161`; the sum times `(1 + log y)/y` is `1.56566` there, its largest value over
  `(1, 10^5]`, so the instance with `1.566` holds there. The row `0.997 y/log y` is nearly attained:
  at `y = 31` the sum is `4 + 2 + 1 + 1 + 1 = 9` and `9 log 31/31 = 0.99696`.
- *MoebiusDivStarRangeVerified* with the source's row `(y ↦ 0.779/log y, (1, 3.3·10^7])` (Lemma 7.4,
  `x > 1`) is false at real arguments: on `[10, 11)` the sum is
  `|m(10)| + |m(2)|/4 + |m(1)|/9 = 0.090476 + 0.125 + 0.111111 = 0.32659`, and as `y → 11⁻` it times
  `log y` tends to `0.78312 > 0.779`, while at `y = 10` it is `0.75201`: the source's row holds at the
  integers only, and `0.784` is above the largest value over `(1, 10^5]`. The other rows of
  Lemmas 7.4, 8.3, 16.4 and 16.6 hold on `[a, 10^5]` at both ends of every unit interval (largest
  values `0.1295`, `0.3013` for the `1/log y` rows and `0.1416`, `0.3185`, `0.4725`, `1.6931` for the
  `1/(1 + log y)` rows of `m`; `0.09141`, `0.19804`, `0.42856` and `0.09736`, `0.19711`, `0.49732`
  for those of `M`).
- Field (v) of `RamareTransferComputations` with the printed `3.48` in place of `3.49` is false:
  `|M(D₀) − M₂(μ, D₀)/log² D₀| = 3.4852… > 3.48`.
- Field (vi) of `RamareTransferComputations` at `D = 2 161 205`: `|M₂(μ, D)| = 98 403.05…` against
  `(0.0130 log D − 0.144) D = 98 594.8`, a margin of `0.2%`; field (i) at `D = 3`:
  `R₂*(3) = −log² 2 − log² 3 + 6γ = 1.7759`, within `1.80 √3 log 3 = 3.4251`.
- Field (iii) of `RamareTransferComputations` fixes the sign of `ψ(t) − t`: the integral is negative
  (`ψ(t) < t` on most of `[1, 10^8]`, `ψ(t) − t` starting at `−t` on `[1, 2)`); the field with
  `t − ψ(t)` in the integrand, or with `+147.768`, is false.
- Field (iii) with the printed value `−129.559` of `ramare2013aa` Lemma 6.4 is false: since
  `∫_1^X ψ(t) dt/t = Σ_{p^k ≤ X} log p · log(X/p^k)`, the integral equals
  `Σ_{p^k ≤ 10^8} log p · log(10^8/p^k) − (10^8 − 1) = −147.7678…`, and integrating the step function
  `ψ` over each `[n, n + 1)` gives the same value (at `X = 10^6` both give `−16.3925…`). The value
  enters the analytic argument of Layer 1.5 only through the term `I₀/D ≤ 6.4·10^{−11}` at
  `D ≥ 2.3104·10^{12}`, so Theorem 1.1 is unaffected by the correction.
- Field (i) of `RamareTransferComputations` at every integer of `[3, 2·10^8]` (where `R₂*` is
  constant on each `[N, N + 1)` and `√D log D` increases, so the integers suffice): the largest value
  of `|R₂*(D)|/(√D log D)` is `1.3658` (at `D = 36 917 058`) on `[3, 1.1·10^8]` and `1.4519` (at
  `D = 110 102 617`) on `[1.1·10^8, 2·10^8]`, within `1.80` and `1.93`.
- *PsiTildeDifferenceRangeVerified* `0.052 144 913 394 385` holds with room: over the range the
  largest value of `√y |r(y) − R(y)/y|` is `0.02266`, near `y = 164 921.4`; so the instance with
  `c = 0.02` in place of `0.052` is false there, while the gap's own constant `0.05` would also hold.
- The difference `r(y) − R(y)/y` is the quantity, not `r(y)`: at `y = 302 831` (on
  `[302 831, 302 832)`, `302 831` being prime) `|r(y)| = 0.0012558`, so `√y |r(y)| = 0.691`, far
  above `0.052`; a proposition bounding `r` alone by `c/√y` would be false, and
  `R(302 831) = −378.70` carries the cancellation (`√y (r(y) − R(y)/y) = −0.00290`). As
  `y → 302 831⁻` the same quantities tend to `0.0012975`, `0.714` and `R → −391.32`.
- At `y = 144 913` Vanlalngaia's printed form is `0.047/380.674 + 1.884/144 913 + 1.75·10^{−12} = 1.36466·10^{−4}`,
  below `0.052/380.674 = 1.36600·10^{−4}`; at `y = 141 978` the printed form exceeds `0.052/√y`, so
  the instance cannot start much lower and still follow from the printed theorem.
- *SquarefreeRangeVerified* `(x ↦ 0.02767 √x) 438 653 10^6` is false (as `x → 441 353⁻`,
  `R(x)/√x → −0.027772`), while *SquarefreeRangeVerifiedNat* `(n ↦ 0.02767 √n) 438 653 10^6` holds
  (the last integer `n` with `|R(n)| > 0.02767 √n` is `437 780`): the two forms differ.
- *DivisorHarmonicRangeVerified* `1.16 1 236` holds. The largest value of
  `|Σ_{n ≤ t} τ(n)/n − P(t)| t^{1/3}` over `[1, 236]` is `0.65418`, as `t → 2⁻`, so
  *DivisorHarmonicRangeVerified* `0.65 1 236` fails on `[1, 2)`. With the misprinted `γ² − γ₁` in
  `P`, the largest value on `[1, 2)` would be `0.594`, at `t = 1`: the source's `0.60`.
- The range of *DivisorHarmonicRangeVerified* `1.16 1 236` reaches the analytic range, since
  `3·0.961 t^{−1/6} ≤ 1.16` exactly for `t ≥ 235.68` (5.2). Its lower end cannot go below `1`: on
  `(0, 1)` the sum is empty and `|P(t)| t^{1/3}` reaches `1.64082`.
- *DivisorSmoothedRangeVerified* `0.247 1 7` holds with room. The largest value of
  `|Δ(x) − x δ(x) − 1/4|` over `[1, 7)` is `0.09330`, at `x = 2`, where `Δ(2) = 1.30484` and
  `δ(2) = 0.48077`. From `7` on, Bordellès–Daval's `1/8 + 0.316/√x + 1/(64x)` is at most
  `0.24667 < 0.247`. At `x = 1` it is `0.4566`, so their Theorem 1 alone does not cover `[1, 7)`.
- *StieltjesGammaOneEnclosure* with the opposite sign (`γ₁ = +0.0728…`) is excluded by the
  Dirichlet-divisor witness of Layer 0.5.
- *StieltjesGammaOneEnclosure* agrees with the Euler–Maclaurin value at `N = 10` of Layer 0.5
  (`0.04123` against `γ₁ + (log 10)/20 = 0.04231`).
- With ExplicitPrimeCounting §1.6's enclosure of `γ`, *StieltjesGammaOneEnclosure* gives
  `γ² − 2γ₁ = 0.478810 ± 10^{−8}`, matched by the sum at `10^6` to `10^{−4}` (Layer 5.2).
- `PrimorialTableVerified 26` holds: `k log θ(p_k)/θ(p_k)` is `1.0797` at `k = 3`, rises to
  `9 log 19.2231/19.2231 = 1.384013` at `k = 9` (`N₉ = 223 092 870`) and then decreases
  (`1.3550` at `k = 16`, `1.3189` at `k = 26`).
- With `1.3840` in place of `1.3841`, `PrimorialTableVerified 9` already fails, at `k = 9`.
- `PrimorialTableVerified K` with `K < 3` is vacuous; a table indexed by `p_k = Nat.nth Nat.Prime k`
  (an index shift) would test `N₁₀` against the value of `N₉` and miss the maximum.
- `SuperiorTableVerified 2 0.1950 0.3466 1.538` holds: the largest `f₂(N)` over the superior highly
  composite numbers associated to `ε ∈ [0.1950, 0.3466]` is `f₂(6 983 776 800) = 1.53794`, attained
  for `ε ∈ [0.2224, 0.2354]` (`teo2026` lines 1920–1922).
- `SuperiorTableVerified 2 0.1950 0.3466 1.5379` fails, at `N = 6 983 776 800`.
- At `ε = 0.3` the superior highly composite number is `5040`, with `f₂(5040) = 1.48485 ≤ 1.538`; for
  every `ε > 1` the only number is `N = 1`, where both sides vanish.
- `PrimorialTotientTableVerified 24 284` holds strictly but barely: at `k = 9`,
  `(N₉/φ(N₉) − e^γ log log N₉) log log N₉ = 2.506369… < 2.50637`, and over all primorials with
  `p_k < 24 284` this is the largest value.
- With `2.5063` in place of `2.50637` the table fails at `k = 9`; at `k = 3`,
  `30/φ(30) = 3.75 < 4.2277`.
- `PrimorialTotientTableVerified P` with `P ≤ 5` is vacuous (`p_k ≥ 5` for `k ≥ 3`); with `≤` in place
  of `<` the statement at `k = 9` would hold as well, so the strict form is the one Theorem 15
  needs.

### Examples

- The three carriers at `x = 30`: `M(30) = −3`, `m(30) = Σ_{n ≤ 30} μ(n)/n = −0.030475…`,
  `m̌(30) = 1.00302…`.
- The coprime carrier `m_2(10) = 34/105` and its decomposition through `m(10/a)/a` over `a ∣ 2^∞`.
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

**Checks.**

- Meissel at `x = 1`: `μ(1)·1 = 1`; at `x = 2.5`: `1·2 + (−1)·1 = 1`; at `x = 6`:
  `6 − 3 − 2 + 0 − 1 + 1 = 1`.
- `b_2(x) = x² − x + 1/6`, so `b_2(1) − b_2(0) = 0 = 2·0`, the difference identity
  `b_k(X + 1) − b_k(X) = k X^{k−1}` at `k = 2`, `X = 0`; with Mathlib's `bernoulli'` convention
  (`B₁ = +1/2`, polynomial `x² + x + 1/6`) the difference would be `2`, so the definition uses
  `Polynomial.bernoulli` (`B₁ = −1/2`).
- `b̃_1(x) = {x} − 1/2` (so `b̃_1(2.5) = 0`) and `φ₁(x) = (x − 1/2) − ({x} − 1/2) = ⌊x⌋`; `b̃_2` is
  continuous at the integers (both one-sided values `1/6`), while `b̃_1` jumps from `1/2` to `−1/2`;
  a definition with `x` in place of `{x}` in `b̃_k` would make `φ_k` vanish identically.
- MacLeod at `k = 1`: `Σ μ(n) ⌊x/n⌋ = 1 = 1·(1 − 1/x)⁰`, Meissel; at `k = 2`, `x = 2`:
  `φ₂(2) = 1`, `φ₂(1) = 0`, left side `1·1 + (−1)·0 = 1`, right side `2(1 − 1/2) = 1`.
- `ε₁(1) = 0` and `ε₁(2) = 1/3 − 1/6 = 1/6` (`{t} = 0` at the integers); `ε₁` is continuous, and
  `ε₁(t) → 1/3` as `t → ∞`; a version with `+1/(3t)` would give `ε₁(1) = 2/3`, not the value
  Balazard's identity at `x = 1` requires.
- Continuity at `2`: as `t → 2⁻`, `{t} → 1` and `b₃(1) = b₄(1) − B₄ = 0`, so `ε₁(2⁻) = 1/6 = ε₁(2)`;
  with the factors `4/3` and `1/3` on the leading monomials only, the left limit would be
  `1/3 − 1/6 + (1/3)/4 + (2/3)/8 = 1/3`, a jump.
- The defining identity at `x = 1.5`: `φ₃(1.5) = (b₃(1.5) − b₃(0.5))/2.25 = 1/3` and
  `φ₄(1.5) = (b₄(1.5) − b₄(0.5))/3.375 = 4/27`, so `(4/3)φ₃ − (1/3)φ₄ = 32/81` and
  `ε₁(1.5) = 0.5 − 32/81 = 17/162 = 0.104938`, which the formula gives
  (`1/3 − 2/9 + 0 − (1/3)(1/16)/3.375`); with `t⁴` in the last denominator it would give `0.106996`,
  and with the factors on the leading monomials `0.123457`.
- Differentiating the formula at `t = 1.5` gives `1/81 = 0.012346`, the value of Proposition 6 there
  (below); the version with the factors on the leading monomials has derivative `0.234568` there.
- `ε₁'` at `t = 1.5`: `{t} = 1/2`, `(2{t} − 1) t + {t} − {t}² = 1/4`, so `ε₁'(1.5) = (1/9)² = 1/81`,
  between `0` and `1/t² = 4/9`; at an integer `t = 2⁺`, `{t} = 0` gives `ε₁' = (−2/4)² = 1/4 = 1/t²`,
  the upper bound is attained.
- Balazard's identity at `x = 1`: `m(1) = 1`, `M(1)/1 = 1`, the two polynomial terms vanish
  (`1 − 1/x = 0`), the integral is over `[1, 1]`: `1 = 1`. At `x = 2`: `m(2) = 1/2`, `M(2)/2 = 0`,
  `4(1/2)²/2 − 4(1/2)³/6 = 1/2 − 1/12 = 5/12`, so the integral term must be `1/12`:
  `(1/2) ∫_1^2 M(2/t) ε₁'(t) dt` with `M(2/t) = 1` for `t > 1`, and
  `∫_1^2 ε₁'(t) dt = ε₁(2) − ε₁(1) = (1/3 − 1/6) − 0 = 1/6`, giving `1/12`: the identity balances.
- El Marraki's second identity at `D = 3`:
  `∫_1^{1.5} 2 dt/t + ∫_{1.5}^2 dt/t + ∫_2^3 0 = 2 log 1.5 + log(4/3) = log 3`.
- Lemma 8.1 at `f = μ`, `k = 2`, `D₀ = D`: both sides are `M(D)`; at `f = δ` (the convolution
  identity): `M_k(δ, D) = 0` for `k ≥ 1` and `M₀(δ, D) = 1`, so the identity reads
  `1 = 0 + 1 − 0 + 0`. Neither instance has a nonzero integral; the sign of the integral is pinned by
  `f = 1_{n = 3}`, `k = 1`, `D₀ = 2`, `D = 4`: `M₀(f, 4) = 1`, `M₁(f, 4)/log 4 = log 3/log 4 = 0.79248`,
  `M₀(f, 2) = M₁(f, 2) = 0` and `∫_2^4 M₁(f, t) dt/(t log² t) = log 3 (1/log 3 − 1/log 4) = 0.20752`,
  so the right side is `0.79248 + 0.20752 = 1`, while `− k ∫` would give `0.585`.

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

**Checks.**

- Threshold: `|M(1118)| = 14 > 1118/80 = 13.975` and `|M(1109)| = 15 > 13.86`, while `|M(x)| ≤ x/80`
  at every `x ∈ [1119, 1.2·10^6]` (the function `M` is constant on `[N, N + 1)` and `x/80`
  increases, so the integers suffice): `1119` is the least threshold. The maximum of
  `|M(x)| − x/80` over `[1, 1118]` is `5.5125 = 1/80 + 11/2`, at `x = 199` (`|M(199)| = 8`), which is
  exactly the slack of the all-`x` form.
- `x = 0`: `M(0) = 0 ≤ 1/80 + 11/2`; `x = 1`: `1 ≤ 2/80 + 11/2`.
- Non-example: `|M(x)| ≤ x/80 + 5` for all `x ≥ 0` is false, since `|M(x)| − x/80` reaches
  `5.5125 > 5` below `1119`.
- `x = 10^6`: `|M(10^6)| = 212 ≤ 10^6/1036 = 965`, and the sharper bounds of 1.3 give `230`.

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

**Checks.**

- Thresholds: `|M(617 972)| = 262 > 617 972/2360 = 261.85` and
  `|M(2 160 534)| = 498 > 2 160 534/4345 = 497.25`, while `|M(617 973)| = 261` and `|M(2 160 535)| = 497` satisfy the bounds: both
  thresholds are exact, and the two finite ranges hold with maximal ratios `|M(x)|·2360/x = 0.99674`
  and `|M(x)|·4345/x = 0.99950`.
- The table alone gives `0.571 √x ≤ x/4345` iff `x ≥ 6 155 336.19…`, so `[2 160 535, 6 155 337]` is
  not covered by the table and is the direct verification.
- Tail statement: with `A = 0.0130` (1.5) and `B = 4345`, `e^{AB} = e^{56.5}`, far beyond `10^{12}`;
  with `A = 0.10917` the threshold is `e^{474}`: neither the table nor the logarithmic bounds cover
  `[10^{12}, e^{56.5}]`, which is why the sources' elementary method carries the range beyond the
  table.
- `x = 10^6`: `10^6/4345 = 230 ≥ |M(10^6)| = 212`.

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

**Checks.**

- Schoenfeld's inequality at `x = 3`: the left side is `1 + (1 − log 2)/2 + (log 3 − 1)/3 = 1.18630`
  and the right side `2 log 3 − 2 log log 3 = 2.00913`; over the integers of `[3, 2·10^7]` (the left
  side is constant on each `[N, N + 1)` and the right side increases for `x > e`) the smallest
  difference is this one, `0.8228`, and on `(1, 3)` the left side is `1` or `1.15343` against a
  right side of at least `2` (its minimum, at `x = e`). As `x → 1⁺` the right side tends to `+∞`.
- The difference of the two sides of Schoenfeld's inequality tends to
  `2B + 2 Σ_p Σ_{k ≥ 2} min(log p, 1)/p^k − (1 − log 2) = 0.52299 + 1.23946 − 0.30685 = 1.4556`, so
  `Σ_{n ≤ x} |Λ(n) − 1|/n < 2 log x − 2 log log x − 1.5` fails for every large `x`.
- Ramaré–Zuniga Alterman's companion at `X = 2`: `log 2/2 = 0.3466 ≤ 0.6931`; at `X = 4`:
  `0.3466 + 0.3662 + 0.1733 = 0.8861 ≤ 1.3863`; for `X < 1` the sum is empty and `log X < 0`, so the
  range `X ≥ 1` is needed.
- The maximum of `log x · |M(x)|/x` over `1 < x ≤ 3000` is `0.6437751…`, attained at `x = 5`
  (`|M(5)| = 2`, `2 log 5/5 = 0.64377516`): the Corollaire's constant is the supremum over `x > 1`
  to seven digits, so no smaller constant works for all `x > 1`.
- `x = 685`: `|M(685)| = 11 < 0.10917·685/log 685 = 11.453`, while
  `|M(684)| = 12 > 0.10917·684/log 684 = 11.439`; no violation on `[685, 1.2·10^6]`: the threshold `685` is exact.
- `x = 2`: `362.7·2/log² 2 = 1509 ≥ 0`; `x = e`: `362.7 e ≥ |M(e)| = 0`.
- Non-example: `0.10917 x/log x` fails at `x = 13` (`|M(13)| = 3 > 0.553`), so the threshold is
  needed.
- Théorème 1 at its threshold: `|M(142 194)| = 122 < 0.002969·142 194/√(log 142 194) = 122.56`,
  while the bound fails on `[142 193, 142 194)`, and there is no violation on `[142 194, 2.2·10^6]`:
  the threshold is exact;
  Theorem A.1 at `x = 5`: `2.9189·5/log² 5 = 5.64 ≥ 2`, at `x = 10^6`:
  `2.9189·10^6/190.9 = 15 292 ≥ 212`, against `362.7·10^6/190.9 = 1.9·10^6` for El Marraki's row.

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

**Checks.**

- Selberg's identity at `n = 1`: left `μ(1) log² 1 = 0`; right `(Λ⋆Λ − Λ log)(1) = 0`. At `n = p`:
  left `−log² p`; right `μ(1)(Λ⋆Λ(p) − Λ(p) log p) + μ(p)(Λ⋆Λ(1) − 0) = (0 − log² p) + 0 = −log² p`.
  At `n = p²`: left `0`; right
  `(Λ⋆Λ(p²) − Λ(p²) log p²) + μ(p)(Λ⋆Λ(p) − Λ(p) log p) = (log² p − 2 log² p) − (−log² p) = 0`. At `n = pq`: left `log²(pq)`; right
  `(2 log p log q − 0) − (−log² p) − (−log² q) + 0 = (log p + log q)²`.
- `R₂*` at small `D`: `Σ_{d ≤ 1} = 0 = −2γ + R₂*(1)`, so `R₂*(1) = 2γ = 1.1544`; `R₂*(0.5) = 0`;
  `R₂*(2) = −log² 2 + 4γ = 1.8284` and `R₂*(3) = −log² 2 − log² 3 + 6γ = 1.7759` (`Λ ⋆ Λ` vanishes
  below `4`). A definition without the term `2γ ⌊D⌋` would give `R₂*(1) = 0`, `R₂*(3) = −1.6874`, and
  a remainder of size `2γ D`, so the bound `|R₂*(D)| ≤ 0.0213 D` of field (ii) would be false for it.
- `R₂*(4)`: `Λ ⋆ Λ(4) = log² 2` and `Λ(4) log 4 = 2 log² 2`, so
  `R₂*(4) = R₂*(3) − log² 2 + 2γ = 1.7759 − 0.4805 + 1.1544 = 2.4498`.
- `R₂*(10) = 5.0664` and `R₂*(30) = 0.5688`, within field (i)'s `1.80 √D log D = 13.11` and `33.53`:
  the remainder oscillates with `ψ(D) − D`, and is not of constant sign.
- The uncorrected input is false: at `x = 23`, `ψ̃(23) − log 23 + γ = 2.6113 − 2.5583 = 0.053`,
  while `0.0067/log 23 = 0.0021`; the fluctuation of `ψ̃` near `x ≈ 3.6·10^4` is of size
  `|ψ(x) − x|/x ≈ 10^{−3}`, five times `0.0067/log x`, so `ψ̃` cannot satisfy the printed bound at `√D` for
  `D ≈ 1.3·10^9`; this is why field (ii) exists.
- The final absorption: `0.144 − 2·0.0130 = 0.118`; with `β = 0.144` and no absorption the bound
  would read `0.0130/log D − 0.144/log² D`, which is smaller and not what Lemma 8.1 yields. The
  boundary value is `M(D₁) − M₂(μ, D₁)/log² D₁ = −466 + 98 403.05/212.757 = −3.4852` at
  `D₁ = 2 161 205`, so `C₁ = 3.48` would not be an upper bound for its absolute value, while
  `C₁ = 3.49` is, and is far below the absorption limit `264.11`.
- Lemma 5.1 at `D = e^4`, `T = e^2`, `c₁ = 1.04`: the bound is `1.04/4 + 1.04 log 2 = 0.981`, and the
  sum is `Σ_{d ≤ 7.39} Λ(d)/(d log(e^4/d))`, the terms `d = 2, 3, 4, 5, 7` giving
  `0.1048 + 0.1262 + 0.0663 + 0.1346 + 0.1353 = 0.567 ≤ 0.981`; the misprinted form with `c₁ log D`
  in place of `c₁/log D` would be `4.88`.
- Threshold: `|M(1 078 853)| = 349 ≤ (0.0130/log D − 0.118/log² D) D = 349.915` at `D = 1 078 853`,
  while `|M(1 078 852)| = 350 > 349.915`: the threshold of Theorem 1.1 is exact, and there is no
  violation on `[1 078 853, 2.2·10^6]`.
- Negative control for Lemma 7.2's scheme: the source's single-`ρ` form at `D = K·2 160 535`
  (`log D = 27.631`, `log(D/K) = 14.586`) gives `0.0213(0.60793·14.586 + 1.166) + 0.03739 = 0.2511`,
  above `0.0130 log D − 0.144 = 0.2152`; its slope in `log D` is `0.0213·6/π² = 0.012949` against
  `0.0130`, so it closes only for `log D ≥ 729.4`. The split form gives `0.21192` there, and `0.22277`,
  `0.24174`, `0.27156` at `D = 2.3104·10^{12}`, `10^{13}`, `10^{14}` against `0.22609`, `0.24514`,
  `0.27507`. The weighted sum it bounds, `Σ_{ℓ ≤ D/(K+1)} μ²(ℓ) g(D/ℓ)/ℓ` with `g = ρ` beyond `Y`,
  is `0.15150` at `D = K·2 160 535`, against its Abel-summation bound `0.17452`.
- Why the ratio `0.0213` is not used below `1 435 319`: at `y = K + 1 = 462 849` field (i) gives only
  `1.80 log y/√y = 0.0345`; the largest value of `|R₂*(y)|/y` on `[462 849, 1 435 319]` is
  `0.021093` (at `y = 463 206`), and on `[1 435 319, 2·10^8]` it is `0.012308`.
- The analytic range starts at `1 520 000² = 2.3104·10^{12}`: at `D = 2.31·10^{12}` the argument
  `√D = 1 519 868.4` lies below the range `x ≥ 1 520 000` of the `ψ̃` input, so field (ii) has to
  reach `2.3104·10^{12}`.

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

**Checks.**

- `q = 1`: `M_1 = M`, `φ(1)/1 = 1`, and the first row reads `log x |M(x)|/x ≤ 0.997` for `x > 1`;
  the maximum of `log x |M(x)|/x` over `1 < x ≤ 3000` is `0.6438 ≤ 0.997`.
- The first row of Theorem 1.19 as printed fails at `q = 1`: `M(5) = −2` and
  `(1 + log 5)·2/5 = 1.0438 > 1`, on all of `[5, 5.3567)`, where `2(1 + log x) > x`. For
  `2 ≤ q ≤ 400` and `x ≤ 2·10^4` its left side stays below `0.4419` (at `q = 2`, `x = 13`;
  `0.5891` with `∏_{p ∣ q}(1 + 1/p)^{−1}`), so `q = 1` is the only failure found; the route gives
  `1.566`, the largest value of `(1 + log y) Σ_{w ≤ √y} |M(y/w²)|/y` (at `y = 5`, Layer 0.7), and for
  `q = 1` only `w = 1` divides `1^∞`, which is why the true supremum there is the smaller `1.0438`.
- (16.4) is attained to three digits at `D = 5`: `|M(5)| log 5/5 = 0.64378 ≤ 0.644`, the largest value
  on `(1, 688]`; (16.3) at its threshold `D = 688`: `|M(688)| = 10`, `10 log 688/688 = 0.09497 ≤ 0.0950`,
  the largest value on `[688, 97 067]`.
- `q = 2`, `x = 3`: `M_2(3) = μ(1) + μ(3) = 0`; `x = 5`: `M_2(5) = 1 − 1 − 1 = −1`,
  `(1/2) log(5/2)·1/5 = 0.092 ≤ 0.997`.
- `S = ∅` (all primes excluded, `q` the product of all primes): `w_S` is infinite and the statement
  carries the hypothesis that finitely many primes are excluded; `S = ` all primes: `w_S = 1`,
  `q = 1`.

### 1.6a The Liouville summatory function

In this subsection `λ` is Mathlib's `ArithmeticFunction.liouville`, so `λ(n) = (−1)^{Ω(n)}` for
`n ≥ 1`. Define `liouvilleSum x = Σ_{n ≤ x} λ(n)` (written `L_λ(x)`), a function `ℝ → ℝ` summed
over `Finset.Icc 1 ⌊x⌋₊`, so that `L_λ(x) = 0` for `x < 1` and `L_λ` is constant on each
`[N, N + 1)`. Write `1_□` for the indicator of the perfect squares `d²`, `d ≥ 1`, and `μ_□` for the
function with `μ_□(d²) = μ(d)` and `μ_□ = 0` off the squares. Prove:

- the convolution identities `λ ⋆ ζ = 1_□`, `λ = μ ⋆ 1_□` and `μ = λ ⋆ μ_□`, that is
  `Σ_{d ∣ n} λ(d) = 1_□(n)`, `λ(n) = Σ_{d² ∣ n} μ(n/d²)` and `μ(n) = Σ_{d² ∣ n} μ(d) λ(n/d²)` for
  every `n ≥ 1`: every function involved is multiplicative
  (`ArithmeticFunction.isMultiplicative_liouville`, `ArithmeticFunction.isMultiplicative_moebius`),
  and at `p^a` the first reads `Σ_{j ≤ a} (−1)^j = [a even]`; the other two follow from it, from
  `μ ⋆ ζ = δ` and from its image `1_□ ⋆ μ_□ = δ` under `n ↦ n²`;
- the summatory identities: for every real `x`,
  `L_λ(x) = Σ_{w ≤ √x} M(x/w²)` and `M(x) = Σ_{w ≤ √x} μ(w) L_λ(x/w²)`, over the naturals
  `1 ≤ w ≤ √x` (both sides vanish for `x < 1`), by summing the second and third convolution
  identities over `n ≤ x` and grouping the terms by `w = d`; hence
  `|L_λ(x)| ≤ Σ_{w ≤ √x} |M(x/w²)|` and `|M(x)| ≤ Σ_{w ≤ √x} μ²(w) |L_λ(x/w²)|`;
- the transfer of bounds: for reals `ε` and `Y ≥ 1`, if `|M(y)| ≤ ε y` for every real `y ≥ Y`,
  then `|L_λ(x)| ≤ (π²/6) ε x + 2 x^{3/4}` for every real `x ≥ Y²`, and the same holds with `M`
  and `L_λ` exchanged.
  Route: in the first summatory identity the terms with `w ≤ x^{1/4}` have `x/w² ≥ √x ≥ Y` and
  contribute at most `ε x Σ_{w ≥ 1} w^{−2} = (π²/6) ε x` (`hasSum_zeta_two`); the others satisfy
  `|M(x/w²)| ≤ x/w²`, and `Σ_{w > W} w^{−2} ≤ 1/⌊W⌋ ≤ 2/W` for `W = x^{1/4} ≥ 1`. For the exchanged
  form use the second identity, `μ² ≤ 1` and `|L_λ(y)| ≤ y`;
- the qualitative consequences: `L_λ(x) = o(x)` if and only if `M(x) = o(x)`, by the transfer in
  both directions with `ε → 0`; and, unconditionally, for every `A > 0` a constant `C'_A` with
  `|L_λ(x)| ≤ C'_A x (log x)^{−A}` for every real `x ≥ 2`, in particular `L_λ(x) = o(x)`
  (`liouvilleSum_isLittleO`). Route: AnalyticNumberTheoryPartI §1.2 (`davenport_moebius`) at the
  frequency `α = 0` gives `|M(y)| ≤ C_A y (log y)^{−A}` for every real `y ≥ 2`; for `x ≥ 4` apply
  the transfer with `Y = √x` and `ε = 2^A C_A (log x)^{−A}`, since `log y ≥ (log x)/2` for
  `y ≥ √x`, and absorb `2 x^{3/4}` into the constant, `x^{−1/4} (log x)^A` being bounded; on
  `[2, 4)` use `|L_λ(x)| ≤ x`. The explicit bounds of 1.4 give the same `o(x)` under the hypotheses
  of 1.4;
- the explicit instances: under the hypotheses of 1.6, the bounds
  `Σ_{w ≤ √y} |M(y/w²)| ≤ c y/log y` for every real `y ≥ a`, with
  `(c, a) = (0.429, 490), (0.199, 4536), (0.0918, 48 513)` and `c = 0.997` for every real `y > 1`,
  and `Σ_{w ≤ √y} |M(y/w²)| ≤ c y/(1 + log y)` for every real `y ≥ a`, with
  `(c, a) = (1.566, 1), (0.498, 490), (0.198, 7100), (0.0975, 48 645)`, which the route of 1.6
  proves (`ramare2015mc` Lemmas 16.4 and 16.6: *MoebiusStarRangeVerified* up to `8·10^7`, the
  analytic argument through 1.5 beyond), bound `|L_λ(y)|` with the same constants and thresholds,
  by the first summatory identity: for instance `|L_λ(x)| ≤ 0.997 x/log x` for every real `x > 1`
  and `|L_λ(x)| ≤ 0.0918 x/log x` for every real `x ≥ 48 513`. With the corollary
  `|M(D)| ≤ 0.013 D/log D` for `D ≥ 1 100 000` of 1.5, the transfer at `Y = √x`
  (`ε = 0.026/log x`) gives `|L_λ(x)| ≤ 0.0428 x/log x + 2 x^{3/4}` for every real
  `x ≥ 1.21·10^{12}` (`(π²/6)·0.026 = 0.042768…`), which is below the row `0.0918 x/log x` from
  `x ≥ 1.75·10^{12}` on.

*Needs:* Layer 0.1; 1.1 (`μ ⋆ ζ = δ`); 1.4; 1.5 (the corollary `0.013 D/log D`); 1.6 (the bounds on
`Σ_{w ≤ √y} |M(y/w²)|`, with *MoebiusStarRangeVerified* of Layer 0.7); Mathlib
`ArithmeticFunction.liouville`, `ArithmeticFunction.isMultiplicative_liouville`,
`ArithmeticFunction.cardFactors`, `hasSum_zeta_two`; AnalyticNumberTheoryPartI §1.2
(`davenport_moebius`, for the unconditional `o(x)`).

**Checks.**

- `L_λ(n)` for `n = 1, …, 12`: `1, 0, −1, 0, −1, 0, −1, −2, −1, 0, −1, −2`; `L_λ(0.5) = 0`;
  `L_λ(10^k) = 0, −2, −14, −94, −288, −530` for `k = 1, …, 6`, and `L_λ(n) ≤ 0` for every
  `2 ≤ n ≤ 10^6`.
- `λ ⋆ ζ = 1_□`: at `n = 12` the divisors `1, 2, 3, 4, 6, 12` carry `λ = 1, −1, −1, 1, 1, −1`, sum
  `0`; at `n = 36` the nine divisors give `1 − 1 − 1 + 1 + 1 + 1 − 1 − 1 + 1 = 1`.
- The summatory identities at `x = 31`:
  `M(31) + M(7.75) + M(3.44…) + M(1.9375) + M(1.24) = −4 − 2 − 1 + 1 + 1 = −5 = L_λ(31)`, and
  `L_λ(31) − L_λ(7.75) − L_λ(3.44…) + 0·L_λ(1.9375) − L_λ(1.24) = −5 + 1 + 1 − 1 = −4 = M(31)`;
  at `x = 10^6`, `Σ_{w ≤ 1000} M(10^6/w²) = −530 = L_λ(10^6)`.
- Non-example: the sum over `w ≤ x` of `M(x/w)` (first powers) is `1` for every `x ≥ 1` (Meissel's
  identity, 1.1), not `L_λ(x)`; the squares `w²` are essential.
- The rows against the values: the largest value of `|L_λ(x)| log x/x` over the reals of
  `(1, 10^6]` is `6 log 32/32 = 0.64983`, at `x = 32` (`L_λ(32) = −6`), below `0.997`; the largest
  value of `|L_λ(x)| (1 + log x)/x` over `[1, 10^6]` is `1`, at `x = 1`, below `1.566`; at
  `x = 10^6` the sum `Σ_{w ≤ 1000} |M(10^6/w²)| = 1838` bounds `|L_λ(10^6)| = 530`.
- A sum over `Finset.range ⌊x⌋₊` would give `L_λ(1) = λ(0) = 0`; the sum over `Finset.Icc 1 ⌊x⌋₊`
  gives `L_λ(1) = 1`.
- The transfer at `Y = 1`, `ε = 1` (the trivial `|M(y)| ≤ y`) reads
  `|L_λ(x)| ≤ 1.645 x + 2 x^{3/4}`, weaker than the trivial `|L_λ(x)| ≤ x`: the transfer is meant
  for small `ε`, and its term `2 x^{3/4}` bounds the arguments `x/w² < √x` by `|M(y)| ≤ y` alone,
  whatever `Y` is.

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

**Checks.**

- The constants: `2·5.675256… ≤ 11.350514` (`T = 10^{10} + 1`) and
  `2·3.3690462… = 6.7380924… ≤ 6.738093` (`T = 10^7 + 1`); `3/(π·10^{10}) = 9.549·10^{−11}`, and `11.39` exceeds `11.350514` by the
  lower-order terms.
- `x = 10^6`: `|M(10^6)| = 212 ≤ 9.5·10^{−5} + 11 390 = 11 390`, far weaker than the table there; the
  bound is meant for `x > 10^{16}`, where the table stops.
- `L = 4345`: `(0.571·4345)² = 6 155 336.19…`, the start of the table's coverage in 1.3.
- Non-example for the lower limit on `L`: at `L = 10` the threshold is `(5.71)² = 32.6041`, below the
  table's start `33`, and at `x = 32.7` the bound fails: `|M(32.7)| = |M(32)| = 4 > 3.27`; at `L = 2`
  and `x = 1.5`, `|M(1.5)| = 1 > 0.75`. At `L = 10.07` the threshold is `33.062`, and on
  `[33.062, 34)` the bound reads `3 ≤ 3.283`.
- The height limits the reachable `L`: with the zeros only to height `T = 10^7 + 1` the linear
  term is `π x/(2·10^7) = 1.5708·10^{−7} x`, already larger than `x/L = 1.149·10^{−7} x` at
  `L = 8.7·10^6`, so no `L ≥ 2·10^7/π = 6.37·10^6` is reachable from that instance; the corollary on
  `x/L` uses the first bound, whose linear term is `3x/(π·10^{10}) = 9.549·10^{−11} x`.

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

**Checks.**

- Identity at `x = y = 1`: `N(1) = 0`; right side
  `Λ(1)M(1) + μ(1)(ψ(1) − 1) − (ψ(1) − 1)M(1) + m₁(1) = 0 − 1 + 1 + 0 = 0`.
- The iteration of the source: `4345 → 11 035 → 25 266 → 53 119 → 103 697`, capped near `98 483` by
  `y² ≤ 10^{19}`; the final step gives `|N(x)|/(x log x) ≤ 1/180 799` and `|M(x)|/x ≤ 1/180 194`.
- `(0.571·160 383)² = 8.3867·10^9 ≤ 8.4·10^9`: the threshold of the second bound is where the table
  takes over.

### 1.9 The de la Vallée Poussin shape

State Lee–Leong's bound of de la Vallée Poussin shape (`leeLeong2022` (9), the row `W = 5.56` of
their Theorem 2.2 (17) and Table 1, a preprint, by its locator; the Littlewood and
Korobov–Vinogradov members (10) and (11) belong to Part II, Scope): with `H₀ = 3 000 175 332 800`,
given `RH(H₀)`, the records `BrentPlattTrudgianRecord` and `LeongRecord` (ExplicitZetaBounds
§0.4b) and *ZetaReciprocalSegmentVerified* `(3/4) 14 16` (Layer 0.7),
`|M(x)| < 33.56 x (log x) exp(−√(log x/5.56))` for every real `x ≥ e^{4589.20}`. The source states it
without a hypothesis, reading Platt and Trudgian's verification, the computations that its quoted
zero-free region and bounds for `1/ζ` rest on, and the bound it quotes for `1/ζ` near the real axis
as theorems; here all are hypotheses (Conventions): the first is the proposition `RH(H)` of
ExplicitPrimeCounting §1.1 at the height recorded in ExplicitZetaBounds §0.4, and the records are
those under which ExplicitZetaBounds §§7.3 and 7.10 state what the route uses
(`BrentPlattTrudgianRecord` for the region of §7.3 and for every item of §7.10 used, `LeongRecord`
for Leong's line bound and the bound on `σ ≥ 3/4`). The
threshold is `exp(5.56 log² H₀)`, where the truncation height `T = exp(√(log x/5.56))` of the route
reaches `H₀`.

State with it the two bounds of Leong (`leong2026`, arXiv v5, a preprint, by its locator) that the
join of its contour below the verified height uses:

- (a) given `RH(H₀)`, `|ζ'/ζ(σ + it)| ≤ 10.175 log t` for every real `σ ≥ 0.95` and every real
  `t` with `13 ≤ t ≤ H₀ − 1/2` (Corollary 3 in the row `σ₀ = 0.95` of his Table 2, `leong2026`
  lines 121–136 and 1031–1044; his height `H` is `H₀ − 1/2`, line 78; it is the last of the five
  rows from which Lee and Leong's Lemma 4.3 is built). With the line bound
  `1/|ζ(1 + it)| ≤ 29.388 log t` of ExplicitZetaBounds §7.10 (given also `BrentPlattTrudgianRecord`
  and `LeongRecord`) and the identity
  `log(1/|ζ(σ + it)|) = log(1/|ζ(1 + it)|) + ∫_σ^1 Re (ζ'/ζ)(y + it) dy` it gives, under those three
  hypotheses, `1/|ζ(σ + it)| ≤ 29.388 t^{10.175(1 − σ)} log t` for `0.95 ≤ σ ≤ 1` at those heights.
- (b) given `RH(H₀)`, `BrentPlattTrudgianRecord` (for the region of ExplicitZetaBounds §7.3 above
  `H₀`) and `LeongRecord` (through §7.10's line bound for `t ≤ 500`),
  `1/|ζ(σ + it)| ≤ 1719 log t` for every real `t ≥ 13` and every real `σ ≥ 1 − 1/(13 log t)`
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
`BrentPlattTrudgianRecord` and `LeongRecord` (ExplicitZetaBounds §0.4b); Tau Ceti
`TauCeti.norm_truncatedPerron_LSeries_sub_sum_le`, or ExplicitZetaBounds §6.1 (the truncated
Perron formula); Mathlib `ArithmeticFunction.LSeriesSummable_moebius_iff`,
`LSeries_one_mul_Lseries_moebius`, `LSeries_one_eq_riemannZeta`, `riemannZeta`; ExplicitZetaBounds
§7.10 (the bounds for `1/ζ`) and §7.3 (no zero inside the contour above `H₀`); items (a) and (b);
*ZetaReciprocalSegmentVerified* (Layer 0.7). For (a) and (b): `RH(H₀)`; for the bound for `1/ζ`
derived in (a), and for (b), also `BrentPlattTrudgianRecord` and `LeongRecord`; ExplicitZetaBounds
§§4.8, 4.10, 7.3 and 7.10 (the line bound); Mathlib `Complex.borelCaratheodory`.

**Checks.**

- The threshold and the constant: `log H₀ = 28.729692` and `5.56 log² H₀ = 4589.197`, so at
  `log x = 4589.20` the truncation height `T = exp(√(log x/5.56))` is `H₀`, and the route needs
  `T ≥ H₀`. The source's `c₁ = 2e + (12·1237/(23π·5.56))(log x/5.56)^{−1/24} + 4e^{2 + 1/log x}/√(5.56 log x)`
  is `5.43656 + 27.92999 + 0.18507 = 33.55163` there, rounded up to `33.56`.
- The join at the verified height, at `log x = 4589.2`, where the bound is `5.13·10^{−8} x`: the
  source's segment at `H₀` with `e^{146} log H₀` costs `e^{146} log H₀ x^{1 − 1/(5.56 log H₀)}/(π H₀ log x) = 5.7·10³⁵ x`.
  Rising through the heights `[H₀ − 1/2, H₀]` with §7.10's other items fails: along
  `σ = 1 − 1/(5.56 log t)` with `7.59·10³¹ log t` it costs `1.16·10²⁰ x^{1 − 1/(5.56 log H₀)} = 3.9·10⁷ x`,
  below the bound only once `log x > 13 041`; along `σ = 1` with `30.812 log t` it costs
  `4.70·10^{−11} x`, `0.09 %` of the bound at the threshold but more than the bound once
  `log x > 7281`. With items (a) and (b) the whole join costs at most `2.61·10^{−7}` of the bound,
  largest near `log x = 5490`; with the row `W = 6` of Leong's Table 4 (`2.46·10⁹ log t`) in place of
  item (b) it costs `2.0·10^{−7}` of the bound at the threshold.
- At `log x = 4589.2`: `33.56·4589.2·exp(−28.73) = 5.1·10^{−8}`, against
  `4.88346/4589.2^{2.35} = 1.2·10^{−8}` from 1.4: the power-of-log row is still smaller at the threshold.
  The two bounds meet where `33.56 L e^{−√(L/5.56)} = 4.88346 L^{−2.35}`, at `L = log x = 5204.2`;
  beyond it the bound of this section is the smaller.
- Reading check: the exponent is `−√(log x/5.56)`, not `−√(log x)/5.56`; the second reading would give
  `33.56·4589.2·e^{−12.18} = 0.79` at the threshold, barely better than the trivial `|M(x)| ≤ x`.
- Where each record enters item (b). Below `H₀ − 1/2` it follows from (a) and §7.10's line bounds:
  `σ = 1 − 1/(13 log t)` is `0.97001 ≥ 0.95` at `t = 13`, and on the region of (b) the factor
  `t^{10.175(1 − σ)}` is at most `e^{10.175/13} = 2.18735`, so (a) gives the bound
  `29.388·2.18735 log t = 64.28 log t ≤ 1719 log t` for `σ < 1`, and §7.10 gives `30.812 log t` for
  `σ ≥ 1`; both line bounds rest on `LeongRecord` for `t ≤ 500`. Above `H₀` the region of (b) lies
  in that of §7.3: at `t = H₀` its boundary is `σ = 0.9973225`, right of the `5.558691` boundary
  `0.9937382`, and that region is stated given `BrentPlattTrudgianRecord`. A statement of (b) given
  `RH(H₀)` alone would use both records without naming them.

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

**Checks.**

- Against 1.5 at `X = 10^7`: `(0.006688·16.118 − 0.039)/259.8·10^7 = 2 648` against
  `(0.0130/16.118 − 0.118/259.8)·10^7 = 3 523`; the new bound is smaller from its threshold on, and
  `|M(10^7)| = 1 037`.
- The ratio bound for `R₂*` where Lemma 6.1 takes over, `X = 2.1·10^{10}`, `y = √X = 144 913.8`:
  the ψ̃-difference term `2·0.052/√y = 2.73·10^{−4}`, `(0.8 √y/y)² = 4.4·10^{−6}`,
  `0.94 log X/√X = 1.54·10^{−4}`, the integral term `(10 + 1.88 √X)/X = 1.3·10^{−5}` (`|R(t)| ≤ t`
  on `[1, 11]`, *ButheVerified* beyond) and `2|R₄(X)|/X ≤ 0.010`, total `0.01045 ≤ 0.011`. With
  ExplicitPrimeCounting §4.2's `1/(2√y) + 1.75·10^{−12}` in place of the ψ̃-difference input the
  first term is `2.63·10^{−3}` and the total `0.0128 > 0.011`, and it stays above `0.011` up to
  `X = 394 385² = 1.555·10^{11}` (`0.01166` there): the stretch `[144 913, 394 385]` of `y` needs the
  sharper input.
- Threshold: the source's earlier version stated `X ≥ 1 079 974` with `0.0384`; the stated row is the
  revised one, `X ≥ 1 798 118` with `0.039`, and the later papers that quote `1 079 974` quote the
  superseded version.
- The absorption: Lemma 8.1's scheme alone gives `β − 2α = 0.0504 − 0.013376 = 0.037024`; the
  constant `0.039` uses the source's sharper treatment of the boundary terms, which is part of this
  target.

### Examples

- `M(10^6) = 212`, `M(10^5) = −48`, `M(10^4) = −23`, `M(1000) = 2`: the values against which every
  bound of this layer is tested at `D = 10^k`.
- The chain of 1.5 at `D = 10^{12}`: `(0.0130/27.63 − 0.118/763.5)·10^{12} = 3.16·10^8`, against
  the table value `|M(10^{12})| ≤ 0.571·10^6`.

### Dependencies

Layer 0; AnalyticNumberTheoryPartI §3.22a (harmonic remainder, qualitative), §0.19 (for
Schoenfeld's inequality in 1.4) and §1.2 (Davenport's bound, for the unconditional `o(x)` of 1.6a);
Layer 7.1 (the
squarefree remainder and the elementary bounds for `Σ μ²(d)/d`, which depend only on Layers 0, 1.2,
1.4, 2.5 and 5.1, none of which uses Layer 1.5); Layer 7.2 for 1.10 (Corollary 3.3, which depends on
Layers 1.4, 1.5, 1.7, 2.3 and 3.2 but on none of 1.8–1.10); Layer 2.3 for 1.8 (Daval's `m₁`-bounds, which do
not use 1.8); ExplicitPrimeCounting §§1.1, 1.3, 3.2, 3.3, 4.2 and 6.1; the supplier gaps
`gap:psi-initial-range`, `gap:psi-log-power`, `gap:psi-relative-bklnw` and `gap:psi-tilde-difference`
of ExplicitPrimeCounting; for 1.9 the hypothesis `RH(3 000 175 332 800)` (ExplicitPrimeCounting
§1.1 at the height recorded in ExplicitZetaBounds §0.4), the records `BrentPlattTrudgianRecord` and
`LeongRecord` (ExplicitZetaBounds §0.4b), the truncated Perron formula (Tau Ceti
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

**Checks.**

- `S = ∅`: `⟨S⟩ = {1}`, `m_S(x) = 1` for `x ≥ 1`, equality in Tao's bound; `x < 1`: the sum is
  empty, `0 ≤ 1`.
- `S = {2}`: `m_S(x) = 1/2` for `x ≥ 2`; `S = {2, 3}`, `x = 6`: `1 − 1/2 − 1/3 + 1/6 = 1/3`.
- `S` all primes: `m(1) = 1` (equality), `m(5) = −1/30`, `m(13) = −2323/30030 = −0.07736…`; the
  lower form at `x = 13` gives `m(13) ≥ −1 + 2/13 = −0.846`, far from the true value; whether
  `−2323/30030` is the minimum of `m` (`ramare2013facm` lines 46–51) is an open problem of the
  literature, which no target here asserts.
- Mollified at `ε = 0`, `r = 1`: Tao's bound; at `ε = 1`: `|Σ μ(d)/d²| ≤ 2`, while the true
  supremum is `1` (the term `d = 1`); the bound `1 + ε` is not sharp for large `ε`, which is why the
  roadmap states it only as the source does.
- Non-example: the bound `|m_S(x)| ≤ 1` fails for the sum restricted to `n ≤ x` with `n` in an
  arbitrary set `A` not of the form `⟨S⟩`: `A = {1, 2, 3}` gives `1 − 1/2 − 1/3 = 1/6` fine, but
  `A = {1, 6}` gives `1 + 1/6 > 1`.

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

**Checks.**

- `x = 1`: `|m(1)| = 1 ≤ 1 + 0 + 8/3`; `x = 2`: `1/2 ≤ 0 + (1/4)·1 + 4/3`.
- El Marraki at `D = 2`: `1/2 ≤ 0 + (1/2) ∫_1^2 dt/t + (log 2)/2 = log 2 = 0.693`.
- The asymptotic consequence `limsup |m(x)| ≤ 2 limsup |M(x)/x|` (`balazard2012` lines 345–356):
  with `ε ≡ α` constant, Balazard's route gives `|m(D)| ≤ α + α/2 + O(1/D)` (the integral
  `(1/D²) ∫ α t dt = α/2`), so `limsup |m| ≤ 3α/2`; El Marraki's route gives `α + α + 0 = 2α`.
  Balazard's `3/2` is the sharper constant, matching `ramare2015mc` line 100–107.
- Non-example: a bound `|M(t)| ≤ ε(t) t` with `ε` increasing cannot be pulled out of the integral;
  the monotonicity hypothesis is needed for the displayed simplification, not for the identity.
- `I(1) = ∫_1^∞ ε₁'(t) dt/t = 3/4 − γ = 0.17278…`: the expansion
  `8ζ(1 + η)/((2 + η)(4 + η)) = 1/η + γ − 3/4 + O(η)` cancels the pole; the value `271/360 − γ = 0.1755` printed at `balazard2012`
  p. 10 is a slip.

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
`(log x)|m(x)| ≤ 0.0130073` for `x ≥ 120 561` (the source prints `97 603` and its arXiv version
`97 063`; both fail at `x = 120 560`, where the product is `0.013089`, so the threshold stated is the
least one); `|m(x)| ≤ 362.84/log² x` for `x ≥ 2`; and for `m₁ = m − M/x`:
`|m₁(x)| ≤ 1/11 470 909` for `x ≥ 2.2·10^{12}`, `≤ 7.265·10^{−6}/log x` for `x ≥ 2.15·10^{11}`,
`≤ 1.046/log² x` for `x > 1` and `≤ 0.138/log² x` for `x ≥ 671`. Route: Daval's conversion of 2.2
with the `x/4345` bound of 1.3, El Marraki's `362.7 x/log² x` of 1.4,
`MoebiusTableVerified 0.571 10^{16}`, *MoebiusRangeVerified* `(x ↦ 0.5 √x) 201 7 725 038 628`,
*MoebiusDivRangeVerified* `(x ↦ 0.5/√x) 3 7 727 068 587` and *MoebiusDivRangeVerified* with
`x ↦ 1/4343` on `[2 160 605, 5·10^6)` and `x ↦ 0.0130073/log x` on `[120 561, 230 000)`. The row
`0.0130073` improves Ramaré's `0.0144` (and `1/69 = 0.014493`) from `120 561` on.

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

**Checks.**

- Computed thresholds (exact sums of `μ(n)/n`, checked against `M(10^3) = 2`, `M(10^4) = −23`,
  `M(10^5) = −48`, `M(10^6) = 212`): the last `x` with `|m(x)| > 1/100` is `x = 1418`
  (ten integers in `[1106, 1418]` violate it, the largest value `0.011657…` at `x = 1109`); the
  last `x` with `(log x)|m(x)| > 1/20` is `x = 3354` (`166` integers from `1426`, maximum
  `0.0648…` at `x = 2837`); the last with `(log x)|m(x)| > 1/65` is `x = 96 017`. The rows
  `1/12` (last violation `686`), `1/40` (`24 269`), `1/69` (`96 954`) and `0.0144` (`96 954` as
  well: `(log x)|m(x)| → 0.0145113` as `x → 96 955⁻`, and its largest value on `[96 955, 463 421]` is
  `0.0143930`, as `x → 96 961⁻`) are exact; the row `1/25` has
  its last violation at `3461`, below the printed threshold `3470`, so that threshold is valid and
  not sharp.
- `m(7) = −1/105`, `|m(7)| = 0.0095 ≤ 1/10`; `m(6) = 2/15 = 0.133 > 1/10`: the threshold `7` is
  exact. `m(41) = 0.02609 ≤ 1/20`; `m(40) = 0.0505 > 1/20`: exact.
- Theorem 1.2 at `x = 463 421`: `0.0144/13.046 − 0.1/170.2 = 0.0005162`, against the true
  `|m(463 421)| = 0.0005154`: the bound is nearly attained at its threshold.
- The 2013 corollary is verified without exception on `[60 298, 1.2·10^6]`; at `D = 60 298` its
  bound `0.001388` times `log D` is `0.01528 < 1/65`, but the bound times `log D`,
  `0.026 − 0.118/log D`, increases with `D` and exceeds `1/65` from `log D = 0.118/(0.026 − 1/65) = 11.1159`,
  that is `D ≈ 67 200`, which is why the printed `1/65`-row could not follow from it.
- `x = 33`: `0.19/log 33 = 0.0543` and `|m(33)| = 0.03243`; at `x = 32`,
  `|m(32)| = 0.06273 > 0.19/log 32 = 0.0548`, so the threshold `33` is needed.
- Daval's row against Ramaré's at `x = 10^6`: `0.0130073/13.8155 = 9.41·10^{−4}` and
  `1/(69·13.8155) = 1.049·10^{−3}`, against `|m(10^6)| = 2.0·10^{−4}`; Johnston–Leong–Tudzi's row
  there is `4.591/190.87 = 0.02405`, weaker at this `x` than both, and smaller than every `c/log x`
  row once `log x > 4.591/c`.
- Daval's `0.0130073` row below its stated threshold: `m(120 560) = 0.00111876…` and
  `(log 120 560)·m(120 560) = 0.013089 > 0.0130073`, so the row fails on `[120 560, 120 561)` (and at
  twelve further integers of `[119 543, 120 559]`), while `(log 120 561)|m(120 561)| = 0.012992` and
  there is no violation on `[120 561, 1.3·10^6]`: the threshold `120 561` is exact, and the printed
  `97 603` (arXiv `97 063`) is not one. Ramaré's `0.0144` row holds at `120 560` (`0.013089 ≤ 0.0144`).

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

**Checks.**

- `q = 1`: Theorem 1.12 reads `(log x)|m(x)| ≤ 0.784` for `x > 1`, and the supremum of
  `(log x)|m(x)|` over `1 < x ≤ 4·10^5` is `log 2 = 0.693147`, approached as `x → 2⁻` (where
  `m = 1`) and not attained; beyond `2` the largest value is `0.5493`: consistent, with slack.
- The printed rows that are not stated hold numerically: over `1 ≤ q ≤ 25` and `x ≤ 3·10^5` (right
  ends of the unit intervals, where these left sides are largest) the largest values are `0.0817`
  for the `5/16` row, `0.0934` for the `5/38` row and `0.0335` for the `1/7` row, all at `q = 1`;
  for the first row over `2 ≤ q ≤ 400`, `x ≤ 2·10^4`, it is `0.3054` (at `q = 2`, `x → 5⁻`). They
  are unproved, not false; the printed `5/38 = 0.1316` from `882` would also make the printed `1/7`
  row from `11 811` redundant, `5/38 < 1/7`, while the proof's `0.320` and `0.143` are in the order
  of their thresholds.
- Lemma 7.4's analytic step feeds the rows `1/(20 log x)` from `1426` and `1/100` from `694` of
  Corollary 1.3, whose printed thresholds 2.3 corrects to `3355` and `1419`. With the corrected
  thresholds (`U = √(x/3355)`), and with `Σ_{u ≤ U} 1/(20 u² log(x/u²))` computed in place of Lemma
  7.3's comparison with an integral, the step gives `(log x) Σ_{w ≤ √x} |m(x/w²)|/w² ≤ 0.1152` at
  `x = 3.3·10^7` and `0.1047` at `10^8` (`(1 + log x)` times the sum `≤ 0.1218` at `3.3·10^7`),
  within `0.132` and `0.143`: the analytic range still starts at `3.3·10^7`.
- `q = 2`, `x = 10`: `m_2(10) = 1 − 1/3 − 1/5 − 1/7 = 34/105`, and `(1/2) log 5 · 34/105 = 0.2606`,
  the value `≥ 0.260` recorded at `ramare2015mc` line 329–331; Lemma 1.9 gives
  `m_2(10) = m(10) + m(5)/2 + m(2)/4 + m(1)/8 = 19/210 − 1/60 + 1/8 + 1/8 = 34/105`.
- `C_m`: `1100(1 + (4/e)√ζ(3/2))² = 1100(1 + 1.4715·1.6162)² = 12 554.9`, so `⌈C₁⌉ = 12 555` as
  printed; a formula with `1/100` in place of `1100` would give `0.114`, not an integer part `12 555`.
- Non-example: `q` the product of all primes up to `x` gives `m_q(x) = 1` and `log(x/q) < 0`; the
  hypothesis `x > q` excludes it.
- De Camargo's constant at `q = 1`: on `[2, 3)`, `m(x) = 1/2`, so
  `(log x)|m(x)| → (log 3)/2 = 0.5493 > 0.3055` as `x → 3⁻`; the hypothesis `q ≥ 2` is needed. At `q = 2`, `x = 10`:
  `(1/2) log 5 · 34/105 = 0.2606 ≤ 0.3055`.

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

**Checks.**

- `D = 1`: `|6/π² − 1| = 0.392 ≤ 1`; `D = 1.9`: the same tail `0.392 ≤ 1/1.9 = 0.526`, while
  `Σ_{d ≥ 2} 1/d² = 0.645 > 0.526`: cancellation is needed, the trivial bound fails.
- `D = 2.5`: `|6/π² − 1 + 1/4| = 0.142 ≤ 0.4`.
- Checked for every `D ∈ [1, 5000]` at the worst point `D → (N + 1)⁻` of each unit interval:
  no violation; the Moser–MacLeod form likewise has no violation on `[2, 2.2·10^6]`.
- Moser–MacLeod form at `D = 2`: the tail is `6/π² − 1 + 1/4 = −0.14207`, and `1/6 + 8/12 = 0.8333`;
  at `D → 29⁻` the tail is `6/π² − Σ_{d ≤ 28} μ(d)/d²` and the bound `1/87 + 8/2523 = 0.01467`, while
  the Abel-summation bound there is `3/2320 + 11.025/841 = 0.01440`: the two arguments meet near
  `D = 28`.

### 2.6 The logarithmic sum with the sharper prime inputs of Ramaré–Zuniga Alterman

Prove Ramaré–Zuniga Alterman's Corollary 1.2 (`ramareZunigaAlterman2025`): for every real
`X ≥ 617 990`, `|m(X)| ≤ (0.010032 log X − 0.0568)/log² X`, from Theorem 1.1 of 1.10 through
Balazard's inequality of 2.2 (the leading constant is `(3/2)·0.006688`), with
*MoebiusAbsIntegralLE* `1 798 118 216 378 740`, for `X ≥ 1.5·10^7`; on `[617 990, 1.5·10^7)` the
bound is *MoebiusDivRangeVerified* (Layer 0.7), and the full statement is
the conjunction. It is the strongest refereed `m`-bound of `1/log x` type from `617 990` on.

*Needs:* 1.10; 2.2; Layer 0.7 (*MoebiusAbsIntegralLE*, *MoebiusDivRangeVerified*).

**Checks.**

- `1.5·0.006688 = 0.010032`: the constant is Balazard's factor `3/2` (2.2, Checks) applied to 1.10.
- At `X = 617 990`: `(0.010032·13.334 − 0.0568)/177.80 = 4.33·10^{−4}`, against Ramaré's Theorem 1.2
  there, `0.0144/13.334 − 0.1/177.80 = 5.18·10^{−4}`, and Daval's `0.0130073/13.334 = 9.75·10^{−4}`.

### Examples

- `m(10^6) = 0.000200…`, against Theorem 1.2's `0.0144/13.8 − 0.1/190.9 = 0.000519` and the
  `1/69 log x` row's `0.00105`.
- `m_2(10) = 34/105` and
  `m_6(30) = Σ_{n ≤ 30, (n, 6) = 1} μ(n)/n = 1 − 1/5 − 1/7 − 1/11 − 1/13 − 1/17 − 1/19 − 1/23 − 1/29 = 0.2999…`, within `(6/φ(6))·0.784/log 5 = 1.461`.

### Dependencies

Layer 0; Layer 1 (1.1, 1.2, 1.3, 1.4, 1.5, 1.7 for the range of Theorem 1.2 beyond `10^{19}` in
2.3, and 1.10 for 2.6); AnalyticNumberTheoryPartI §3.12
(qualitative coprime sums, cited only). Within the layer, 2.3 and 2.6 use 2.2, and 2.3 uses
neither 2.6 nor 1.10, which rests on 2.3 through 7.2.

## Layer 3: the logarithmically weighted sum `m̌(x)`

### 3.1 The identity and the integral bound

Prove Ramaré's identity (`ramare2015corr` lines 76–82, Lemma 3.2 as corrected, p. 2384, which
replaces `ramare2015mc` lines 652–689, Lemma 3.2: the corrigendum changes the sign of `h'` and
prints the middle coefficient `5 − 4γ` in place of `6 − 4γ`): for `x ≥ 1`,

    m̌(x) − 1 = (6 − 8γ)/(3x) − (5 − 4γ)/x² + (6 − 4γ)/(3x⁴) + (1/x) ∫_1^x M(x/t) h'(t) dt

with `h'(t) = (3/2 − γ) ε₁'(t) − g'(t)`, `g(x) = −1/(12x) + x ε_{6,0}(x)` (`ramare2015corr`
line 87, (3.7); `ramare2015mc` line 663; `g(1) = 1/2 − γ`), and `|t² h'(t)| ≤ 7/4 − γ`
(`ramare2015corr` line 81, (3.6), from `0 ≤ t² ε₁' ≤ 1` and `|t² g'(t)| ≤ 1/4`, line 119; the
middle coefficient `6 − 4γ` of the original, `ramare2015mc` line 654, gives the value `−2` at
`x = 1`, where the left side is `−1`). Since
`x` times the polynomial part, `(6 − 8γ)/3 − (5 − 4γ)/x + (6 − 4γ)/(3x³)`, lies in
`[−1.0712, 0.4608]` for every `x ≥ 1` (its minimum `−1.07115` is at `x = 1.1711`), this gives Theorem 1.4
(`abs_moebiusLogSum_sub_one_le`): for `x ≥ 1`,

    |m̌(x) − 1| ≤ ((7/4 − γ)/x²) ∫_1^x |M(t)| dt + 2/x

(`ramare2015mc` lines 155–163). Route: Balazard's identity for `m` (1.1), the Euler–Maclaurin
expansion of `Σ_{n ≤ y} log(y/n)/n` with the Bernoulli-periodic remainder `ε_{6,0}`
(`ramare2015mc` lines 577–651, Lemma 3.1), and the bound `|t² h'(t)| ≤ 7/4 − γ` at every
non-integer `t > 0`, from `0 ≤ t² ε₁'(t) ≤ 1` (1.1) and
`|t² g'(t)| ≤ |{t}² − {t} + 1/12| + (1/6)/2 ≤ 1/4` (`ramare2015mc` line 688, `ramare2015corr`
line 119, with `|B₂(v)| ≤ 1/6`). The positivity `h' ≥ 0` of `ramare2015mc`'s (3.6), line 657,
concerns the uncorrected sign `(3/2 − γ) ε₁' + g'` and is not used: with the corrected sign only
the two-sided bound holds, and it is all Theorem 1.4 needs.

Prove the derived theorem: if `|M(t)| ≤ ε(t) t` on `[t₀, x]` with `ε` nonincreasing and
`∫_1^{t₀} |M(t)| dt ≤ I`, then `|m̌(x) − 1| ≤ (7/4 − γ)(I/x² + ∫_{t₀}^x ε(t) t dt/x²) + 2/x`.

*Needs:* 1.1; Layer 0.1; `Polynomial.bernoulli` (`B₂`, `B₄`); Layer 0.7 (*MoebiusAbsIntegralLE*).

**Checks.**

- `x = 1`: `m̌(1) − 1 = −1`; the polynomial part is
  `(6 − 8γ)/3 − (5 − 4γ) + (6 − 4γ)/3 = (2 − 5 + 2) + (−8/3 + 4 − 4/3)γ = −1`, and the integral
  over `[1, 1]` vanishes: the identity balances. With the `6 − 4γ` of `ramare2015mc` line 654 in
  the middle the value would be `−2`. The term `−(1/2 − γ) M(x)/x` that the corrigendum's proof
  carries at line 93, and its statement at line 78 does not, would add `γ − 1/2 = 0.0772` at
  `x = 1` (`M(1) = 1`), giving `−0.9228`: the statement is the identity, the extra term a misprint
  (the `M(x)/x` terms of its line 85 and of (2.1) cancel).
- `x = 2`: `m̌(2) − 1 = log 2 − 1 = −0.3069`; the polynomial part is
  `(6 − 8γ)/6 − (5 − 4γ)/4 + (6 − 4γ)/48 = 0.2304 − 0.6728 + 0.0769 = −0.3655`, so the integral term `(1/2) ∫_1^2 h'(t) dt`
  (`M(2/t) = 1` on `(1, 2)`) must equal `0.0586`, i.e. `∫_1^2 h' = 0.117`, inside the range
  `[−1/4, 7/4 − γ]·∫_1^2 dt/t² = [−0.125, 0.586]` allowed by the bound on `t² h'`.
- Two-term witness for the inequality: `x = 2`: `m̌(2) = log 2`, `|log 2 − 1| = 0.3069`;
  right side `(7/4 − γ)/4 · ∫_1^2 1 dt + 1 = 0.293 + 1 = 1.293`.
- `x = 30`: `|m̌(30) − 1| = 0.00302`; right side `(1.1728/900)·∫_1^{30} |M| + 2/30 ≥ 0.0667`.
- Non-example: the uncorrected sign of `h'` would give a coefficient `0.321` in the refined
  version instead of `0.310` (corrigendum line 18–19); the inequality with `7/4 − γ` is the same
  in both.

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

**Checks.**

- On `[N, N + 1)`, `m̌(x) − 1 = a u − b` with `u = log x`, `a = m(N)`, `b = 1 + Σ_{n ≤ N} μ(n) log n/n`:
  this is monotone in `u`, so the rows of Corollary 1.6 are checked at `x = N` and `x → (N + 1)⁻`,
  while `|a u − b| u` can peak inside the interval at `u = b/(2a)`. All nine rows were checked up to
  `x = 10^6` at both ends of every unit interval and at that interior point: no violation (the
  last violating intervals start at `6`, `3161` and `9548` for `0.0203`, `1/396` and `1/714`, and at
  `6`, `43` and `221` for `1/125`, `1/500` and `1/1250`).
- `x = 7`: `|m̌(7) − 1| = 0.0045 ≤ 1/125 = 0.008`; `x = 6`: `|m̌(6) − 1| = 0.0251 > 1/125`: the
  threshold `7` is exact. `x = 16`: `(log 16)|m̌(16) − 1| ≤ 0.0203`.
- Non-example for the printed range: at `x = √e = 1.6487`, `m̌(x) = 1/2` and
  `|m̌(x) − 1| log x = (1/2)(1/2) = 0.25 > 0.213`, so the first row fails for `x ≥ 1`; at `x = 2`,
  `(1 − log 2) log 2 = 0.21269 ≤ 0.213`, and on `[2, 3)`, where `m̌(x) − 1 = (u + log 2)/2 − 1` with `u = log x`, the
  function `(1 − (u + log 2)/2) u` has derivative `1 − (log 2)/2 − u < 0` for `u ≥ log 2`: the
  corrected row is nearly sharp at its threshold `x = 2`.
- Non-example: the superseded `0.00257/log x` for `x ≥ 3846` is weaker than the corrected
  `0.00140/log x` for `x ≥ 9950` beyond `9950`, but the corrected text does not assert the old
  range; stating the old row would claim a bound the author withdrew.

### 3.3 Coprime positivity and the mollified logarithmic sum

Prove Ramaré's Corollary 1.10 for every natural `q ≥ 1` and real `x ≥ 1`:
`0 ≤ m̌_q(x) ≤ 1.00303 q/φ(q)` (`ramare2015mc` lines 278–285), from Lemma 1.9 for `m̌` (lines
264–265: the same decomposition with `m̌` in place of `m`), Balazard's theorem `0 ≤ m̌(y) ≤ m̌(30)`
for every real `y ≥ 1` (cited at `ramare2015mc` lines 284–285; `balazard2012` line 717, the footnote
on printed p. 13), and `Σ_{a ∣ q^∞} 1/a = q/φ(q)`. Balazard's theorem is proved here in two halves.
The lower half `m̌(y) ≥ 0` is the first row `|m̌(y) − 1| ≤ 1` of Corollary 1.6 (3.2). The upper half
is *MoebiusLogUpperRangeVerified* `(m̌(30)) 1 44` (Layer 0.7) on `[1, 44]` and the `1/500` row of
Corollary 1.6 beyond, since `1 + 1/500 < m̌(30)`. No two-sided bound reaches the upper half below
`44`: an instance of *MoebiusLogRangeVerified* gives `m̌ ≤ 1.00303` only where its `ε` is at most
`0.00303`, and no true instance has that at `y = 1` (`|m̌(1) − 1| = 1`) or at `y = 7`
(`|m̌(7) − 1| = 0.0045`), and the rows
`1/125` from `7` and `0.0218/√y` from `11` give only `1.008` and `0.0218/√30 = 0.00398` above `1`
at `y = 30`. Stated for `⟨S⟩` with `w_S`. The optimal constant is `m̌(30) = 1.00302…`.

Prove Ramaré's mollified log-weighted bound: for `r ≥ 1` and `0 ≤ ε ≤ 1.38`,
`|Σ_{d ≤ x, (d, r) = 1} μ(d) log(x/d)/d^{1+ε}| ≤ 1.4 + 4.7ε + 3.3ε² + (1 + ε)(r^{1+ε}/φ_{1+ε}(r)) x^ε`
(`ramare2013facm` lines 54–62, Theorem 1.2), with `r^{1+ε}/φ_{1+ε}(r) = ∏_{p ∣ r}(1 − p^{−1−ε})^{−1}`.

*Needs:* 0.2; 2.1; 3.2 (Corollary 1.6: the row `1` from `1` and the row `1/500` from `44`); Layer
0.7 (*MoebiusLogUpperRangeVerified*).

**Checks.**

- `q = 1`, `x = 30`: `m̌(30) = 1.00302… ≤ 1.00303`; `x = 1`: `m̌(1) = 0 ≥ 0`.
- The upper half below `44`: at both ends of every unit interval of `[1, 2·10^7]` the largest value
  of `m̌` is `m̌(30) = 1.0030213`, and `m̌` exceeds `1.002` on parts of `[16, 20)`, `[28, 32)` and
  `[41, 44)` (`m̌(43) = 1.0022775`), so the `1/500` row cannot start below `44`; on `[44, 2·10^7]`
  the largest value is `1.0017953`, at `y = 44`.
- `q = 2`, `x = 4`: `m̌_2(4) = log 4 − log(4/3)/3 = 1.386 − 0.096 = 1.290 ≤ 1.00303·2 = 2.006`.
- Mollified at `ε = 0`, `r = 1`: `|m̌(x)| ≤ 1.4 + 1 = 2.4`, weaker than `1.00303`; the theorem is
  stated for its uniformity in `ε`, not for its constant at `ε = 0`.

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

**Checks.**

- At `x = 2.38986`: `m̌(x) = (0.87124 + 0.69315)/2 = 0.78219`,
  `(log² x)(1 − m̌(x)) = 0.75905·0.21781 = 0.16533`.
- At `x → 3⁻`: `(log² 3)(1 − (log 3 + log 2)/2) = 1.2069·0.10412 = 0.12567`; at `x = 3`:
  `m̌(3) = 0.8959` (Layer 0.1) and `1.2069·0.1041 = 0.1257 ≤ 0.162`.
- The corrected row of 3.2, `|m̌(x) − 1| log x ≤ 0.213` from `x = 2`, is the `1/log x` companion; at
  `x = 2.38986` it reads `0.87124·0.21781 = 0.18976 ≤ 0.213`.

### Examples

- `m̌(x) − 1` at `x = 2, 3, 4, 5`: `−0.307, −0.104, −0.056, −0.019`.
- `m̌_2(10) = Σ_{n ≤ 10 odd} μ(n) log(10/n)/n = log 10 − log(10/3)/3 − log 2/5 − log(10/7)/7 = 2.30259 − 0.40132 − 0.13863 − 0.05095 = 1.7117`, within `[0, 2.006]`.

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

**Checks.**

- The trivial character is excluded: for `χ = 1` modulo `1`, `L(1, χ)` is the pole of `ζ` and the
  statement is not made; the hypothesis `χ ≠ 1` is used exactly to have `L(1, χ) ≠ 0` and the
  convergence of `Σ χ(m)/m`.
- `q = 3`, `χ` the nontrivial character, `P = 1` (the partial sums are `1, 0, 0, 1, 0, 0, …`):
  `L(1, χ) = π/(3√3) = 0.6046`, the bound is `3/0.6046 = 4.96`; the true values
  `Σ_{n ≤ x} μ(n)χ(n)/n` for `x = 1, 2, 5`: `1`, `1 + 1/2 = 3/2`, `3/2 + 1/5 = 1.7`, all below `4.96`.
- `q = 4`, `χ` the nontrivial character, `P = 1`, `L(1, χ) = π/4`: bound `3/(π/4) = 3.82`; the
  partial sums at `x = 1, 3, 5` are `1`, `1 + 1/3 = 4/3` (`μ(3)χ(3) = 1`) and
  `4/3 − 1/5 = 17/15 = 1.133` (`μ(5)χ(5) = −1`), all below `3.82`.
- Non-example: with `P` replaced by a bound valid only for `N ≤ x` the tail estimate fails; the
  hypothesis quantifies over all `N`.
- `k = 1`: `k/φ(k) = 1` and the coprime form is the plain one; `k = 6`: the factor is `3`.

### Examples

- `q = 5`, `χ` the quartic character with `χ(2) = i`: the partial sums are `1, 1 + i, 1, 0, 0, …`
  (period `5`), so `P = √2` is the least admissible value, and
  `|L(1, χ)| = |0.86481 + 0.20415 i| = 0.88858`; the bound is `(1 + 2√2)/0.88858 = 4.309`.

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

**Checks.**

- `h = δ`: `g = k`, `H ≡ 1`, `H' = H'' = 0`, the conclusion is the hypothesis.
- Model witness for the weighted variant: `h = δ`, `k(n) = τ(n)/n` with `A = 1/2`, `B = 2γ`,
  `C = γ² − 2γ₁` (5.2): `Σ_{n ≤ t} n·τ(n)/n = Σ_{n ≤ t} τ(n) = t log t + (2γ − 1) t + O(t^{2/3})`,
  and the formula gives `U = 2·(1/2) = 1`, `V = 2γ − 1`: correct. With `U = A H(0) = 1/2` the
  leading term would be `(1/2) t log t`, which is false:
  `Σ_{n ≤ 10^6} τ(n) = 13 970 034 ≈ 10^6(13.8 + 0.15)`.
- Degenerate: `t ∈ (0, 1)`: both sides' sums are empty, and the hypothesis forces
  `|A log² t + B log t + C| ≤ D t^{−1/3}` there. The harmonic model satisfies it with `0.9105`
  (Layer 0.3), but the Dirichlet-divisor model needs `D = 1.641` there, not `1.16`: at `t = 0.01`,
  `|½ log² t + 2γ log t + γ² − 2γ₁| = 5.766 > 1.16·0.01^{−1/3} = 5.384`, and the supremum of
  `|½ log² t + 2γ log t + γ² − 2γ₁| t^{1/3}` over `(0, 1)` is `1.64082`, at `t = e^{−7.216} = 0.000735`
  (Layer 5.2).
- Non-example: if `H̄` converges only at `s = 0` (e.g. `h(n) = μ(n)/n`), the error term
  `t^{−1/3} H̄(−1/3)` is infinite and the theorem says nothing; the hypothesis at `−α` is what
  makes the remainder decay.
- The exponent and `H̄`: for `h(d²) = μ(d)/d²`, `h = 0` off squares (Layer 7.6),
  `H̄(−α) = Σ_d μ²(d) d^{2α−2} = ζ(2 − 2α)/ζ(4 − 4α)`, which is `2.80405…` at `α = 1/3`, `4.04208…` at
  `α = 2/5`, and infinite at `α = 1/2`: the Platt–Trudgian exponent `2/5` is usable there, the
  exponent `1/2` of the third form of 5.2 is not.

### 5.2 The models: the harmonic sum and the Dirichlet-divisor sum

Prove the harmonic model: `Σ_{n ≤ t} 1/n = log t + γ + O*(0.9105 t^{−1/3})` for every `t > 0`
(Layer 0.3; the model `k = 1/n` with `A = 0`, `B = 1`, `C = γ`, `D = 0.9105`).

Prove the Dirichlet-divisor model in four forms, with `P(t) = ½ log² t + 2γ log t + γ² − 2γ₁`:
for every real `t ≥ 236`,

    Σ_{n ≤ t} τ(n)/n = P(t) + O*(1.16 t^{−1/3}),

and for every real `t ≥ 1` with *DivisorHarmonicRangeVerified* `1.16 1 236` (Layer 0.7) on
`[1, 236]`; for every real `t > 0`, `Σ_{n ≤ t} τ(n)/n = P(t) + O*(1.641 t^{−1/3})`, the form the
comparison theorem 5.1 consumes at `α = 1/3`; for every real `t ≥ 2`,
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

The first form from `236` on is the headline statement `sum_tau_div_model`: under the bound
`|Δ(x)| ≤ 0.961 √x` for every real `x ≥ 1` of Layer 7.4, it holds for every real `t ≥ 236`. On
`[1, 236]` the first form is *DivisorHarmonicRangeVerified* `1.16 1 236` (Layer 0.7), so the first
form for every real `t ≥ 1` is the conjunction of the two. The second form is the first on
`[1, ∞)` (or the fourth, which dominates it there) together with the bound on `(0, 1)`, where the
sum is empty. Route (`berkaneBordellesRamare2012` lines 1125–1159, the proof of Corollary 2.2):
integration by parts of `Σ_{n ≤ t} τ(n) = t log t + (2γ − 1) t + Δ(t)` against `1/n` gives the
exact identity `Σ_{n ≤ t} τ(n)/n = P(t) + Δ(t)/t − ∫_t^∞ Δ(u) du/u²` for `t ≥ 1`. Its constant
term is the limit `lim (Σ_{n ≤ t} τ(n)/n − ½ log² t − 2γ log t)`, computed from
`Σ_{n ≤ t} τ(n)/n = Σ_{d ≤ t} (1/d) Σ_{m ≤ t/d} 1/m`, the harmonic remainder twice and the
definition of `γ₁` in Layer 0.5. With `|Δ(u)| ≤ 0.961 √u` the remainder is at most
`3·0.961 t^{−1/2}`, and `3·0.961 t^{−1/6} ≤ 1.16` exactly for `t ≥ 235.68`. The identity is exact,
so no decimal value of `γ` or `γ₁` enters the headline. The bound on `(0, 1)` is
`sup_{0 < t < 1} |P(t)| t^{1/3} = 1.64082…`, evaluated with *EulerGammaEnclosure* and
*StieltjesGammaOneEnclosure*.

Wherever `γ₁` is used numerically, *StieltjesGammaOneEnclosure* is the hypothesis
(`γ₁ = −0.0728158454836767248605863758749013191377 + O*(10^{−40})`, line 189, (2.2), citing
`kreminski2003`).

*Needs:* Layer 0.3; Layer 0.5 (`γ₁`); AnalyticNumberTheoryPartI §3.23a (`divisorError`); Layer 7.4
(`|Δ(t)| ≤ 0.961 √t`, which depends only on Layer 0 and that section); ExplicitPrimeCounting §1.6
(*EulerGammaEnclosure*, for the bounds on `(0, 1)` and `[1, 2)`); `sum_mul_eq_sub_sub_integral_mul`;
Layer 0.7 (*StieltjesGammaOneEnclosure*, for the same bounds; *DivisorHarmonicRangeVerified*, for
the first form on `[1, 236]`; *DivisorPowerRangeVerified*, for the third and fourth forms).

**Checks.**

- `t = 10^6`, exact rational sum: `Σ_{n ≤ 10^6} τ(n)/n − ½ log² 10^6 − 2γ log 10^6 = 0.47890…`,
  against `γ² − 2γ₁ = 0.47881…` (difference `9·10^{−5}`, within `1.16·10^{−2}`) and against
  `γ² − γ₁ = 0.40599…` (difference `0.073`, outside); so the constant is `γ² − 2γ₁`.
- `t = 1`: left `1`, right `0 + 0 + 0.4788 + O*(1.16)`: `|1 − 0.4788| = 0.521 ≤ 1.16`.
- `t = 1/2`: left `0`, right `½ log² 2 − 2γ log 2 + 0.4788 = 0.240 − 0.800 + 0.479 = −0.081`,
  `|0.081| ≤ 1.641 · 2^{1/3} = 2.07`.
- Range of the first form: at `t = 0.01` the sum is empty and
  `|P(0.01)| = 10.604 − 5.316 + 0.479 = 5.766`, above `1.16·0.01^{−1/3} = 5.384` and below `1.641·0.01^{−1/3} = 7.617`; on `[1, 6·10^5]` the
  largest value of `|Σ_{n ≤ t} τ(n)/n − P(t)| t^{1/3}` is `0.6542`, as `t → 2⁻`.
- Third form: the largest value of `|Σ_{n ≤ t} τ(n)/n − P(t)| √t` over `[2, 6·10^5]` is `0.8781`, as
  `t → 24⁻`, below `1.001`; the form is stated from `t = 2`, the range the source checks.
- `t = 2`: left `1 + 1 = 2`; right `0.240 + 0.800 + 0.479 = 1.519`,
  `|2 − 1.519| = 0.481 ≤ 1.16/1.26 = 0.92`.
- Fourth form: `sup_{0 < t < 1} |P(t)| t^{2/5} = 1.050286…`, at `t = 0.0019726…`, so `1.0503` is the
  least admissible constant on `(0, 1)` to four decimals and `1.05` fails there; on `[1, 10^6]` the
  largest value of `|Σ_{n ≤ t} τ(n)/n − P(t)| t^{2/5}` is `0.6876`, as `t → 6⁻`. With the exponent
  `1/2` the supremum over `(0, 1)` is `0.59396`, so the third form also holds on `(0, 2)`, but it
  cannot feed 5.1 for the perturbations of Layer 7 (5.1, Checks).

### 5.3 The second model

Prove: for `h : ℕ → ℂ` and `c ∈ [1, 2]` with `H̄(c) < ∞`, and every real `t > 0`,

    Σ_{n ≤ t} Σ_{d ∣ n} (n/d) h(d) = (t²/2) H(2) + O*(t^c H̄(c)/2)

(`ramare2016mc` lines 539–543, Lemma 4.3 together with the scheme of Lemma 3.2 of `ramare1995`).
Route: the left side is `Σ_{d ≤ t} h(d) Σ_{q ≤ t/d} q`, Layer 0.4 gives
`Σ_{q ≤ y} q = y²/2 + O*(y^c/2)`, the main terms sum to `(t²/2)(H(2) − Σ_{d > t} h(d)/d²)`, and
`|Σ_{d > t} h(d)/d²| ≤ t^{c−2} Σ_{d > t} |h(d)|/d^c` because `d^{c−2} ≤ t^{c−2}` for `d > t` and `c ≤ 2`; the two error
terms add to `(t^c/2) H̄(c)`.

*Needs:* Layer 0.4; absolute convergence.

**Checks.**

- `h = δ`: `Σ_{n ≤ t} n = t²/2 + O*(t^c/2)`, Layer 0.4 itself (`H(2) = 1 = H̄(c)`).
- `h(d) = μ(d)` (so `Σ_{d ∣ n} (n/d) μ(d) = φ(n)`), `c = 1`: `H̄(1) = Σ μ²(d)/d = ∞`, the theorem
  gives nothing; at `c = 2` the error `t² ζ(2)/(2ζ(4))` is not smaller than the main term
  `(3/π²) t²`: the model is useful only with `h` small (the sieve weights of the source,
  `h(d) = O(1/d²)`).
- `t = 1/2`: both sides `0` versus `H(2)/8 + O*(H̄(c)/2^{c+1})`, and `|H(2)|/8 ≤ H̄(2)/8 ≤ H̄(c)/2^{c+1}`
  holds for `c ≤ 2`.
- Non-example: `c = 3` is excluded by Layer 0.4's range and by `d^{c−2} ≤ t^{c−2}` failing.

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

**Checks.**

- `g = δ`: `G♯ ≡ 0` for `x ≥ 1`, the main term is `log D + γ`, the integral vanishes, `ℛ = 6/(11D)`
  at `A₀ = 1`: the harmonic remainder of Layer 0.3 again.
- `g(m) = μ(m)` so that `g ⋆ 1 = δ`: left side `1`; `Σ μ(m)/m = 0` and `Σ μ(m) log m/m = −1`
  (convergent by the prime number theorem; qualitatively AnalyticNumberTheoryPartI §3.12 at
  `q = 1` and §3.9), so the main term is `(log D + γ)·0 + 1 = 1`, and the integral
  `∫_{D/A₀}^∞ G♯(t) dt/t = −∫_{D/A₀}^∞ m(t) dt/t` tends to `0`: the identity `1 = 1 + o(1) + O*(ℛ)`
  is consistent and shows the theorem creates no cancellation it is not given.
- `D < 1` is excluded by `D ≥ 1`; at `D = 1`, `A₀ = 1`: left `g(1)`, right
  `Σ (g(m)/m)(γ − log m) + ∫_1^∞ G♯ dt/t + O*(ℛ)`.
- Non-example: without `∫ |G♯(t)| dt/t < ∞` the integral term is undefined; `g(m) = 1` is excluded
  by the convergence hypothesis.

### 5.5 The explicit Levin–Fainleib theorem

Prove (Ramaré 2009, Theorem 21.1, `ramare2009`, uncertified): let `g ≥ 0` be multiplicative, and
suppose there are `κ ≥ 0`, `L ≥ 0`, `A ≥ 0` with

    |Σ_{p^ν ≤ Q} g(p^ν) log p^ν − κ log Q| ≤ L  for every real Q ≥ 1,
    Σ_p Σ_{ν ≥ 1, k ≥ 1} g(p^k) g(p^ν) log p^ν ≤ A.

Then for every real `D ≥ exp(2(L + A))`,

    Σ_{d ≤ D} g(d) = C (log D)^κ (1 + O*(B/log D)),
    B = 2(L + A)(1 + 2(κ + 1) e^{κ + 1}),
    C = Γ(κ + 1)^{−1} lim_{X → ∞} ∏_{p ≤ X} (Σ_{ν ≥ 0, p^ν ≤ X} g(p^ν)) (1 − 1/p)^κ,

each local factor truncated at `p^ν ≤ X`. The limit exists and is positive under the two
hypotheses. With `S_p(X) = Σ_{ν ≥ 1, p^ν ≤ X} g(p^ν)`, the logarithm of the partial product is
`Σ_{p^ν ≤ X} g(p^ν) − κ Σ_{p ≤ X} 1/p` plus `Σ_{p ≤ X} (log(1 + S_p(X)) − S_p(X))` plus
`κ Σ_{p ≤ X} (log(1 − 1/p) + 1/p)`. The first term converges by partial summation from the first
hypothesis and Mertens' `Σ_{p ≤ X} 1/p = log log X + mertensConstant ℚ + o(1)`. The second
converges by dominated convergence, since `|log(1 + y) − y| ≤ y²/2` for `y ≥ 0` and the second
hypothesis gives `Σ_p (Σ_{ν ≥ 1} g(p^ν))² ≤ A/log 2`. The third converges absolutely. The product
need not converge absolutely, and in general the truncation cannot be dropped. It can be dropped when
`Σ_p Σ_{ν ≥ 2} g(p^ν) < ∞`, in particular when `g` is supported on the squarefree integers; `C` is
then the limit of the partial products `∏_{p ≤ X} (Σ_{ν ≥ 0} g(p^ν)) (1 − 1/p)^κ` (Checks).

Route: the Levin–Fainleib differential inequality
`Σ_{d ≤ D} g(d) log d = Σ_{m ≤ D} g(m) Σ_{p^ν ≤ D/m, p ∤ m} g(p^ν) log p^ν`, the two hypotheses
bounding the inner sum by `κ log(D/m) + O*(L + A)`, and the resulting integral inequality for
`G(D) = Σ_{d ≤ D} g(d)`, solved explicitly (the source's proof). The constant is then identified
through the Dirichlet series. For real `s > 0` the series `Σ g(d) d^{−s}` converges (partial
summation from the first hypothesis) and equals `ζ(1 + s)^κ Φ(s)`, with
`Φ(s) = ∏_p (Σ_{ν ≥ 0} g(p^ν) p^{−νs})(1 − p^{−1−s})^κ` absolutely convergent. If
`Σ_{d ≤ D} g(d) ∼ C (log D)^κ`, then `Σ g(d) d^{−s} = s ∫_1^∞ (Σ_{d ≤ t} g(d)) t^{−s−1} dt` is
`∼ C Γ(κ + 1) s^{−κ}` as `s → 0⁺`; since `ζ(1 + s) ∼ 1/s`, this gives
`Γ(κ + 1) C = lim_{s → 0⁺} Φ(s)`.
Abel's theorem, applied to the convergent `Σ_{p^ν ≤ X} g(p^ν) − κ Σ_{p ≤ X} 1/p`, shows that this
limit equals the truncated limit above. This refines SieveMethodsAndPrimePatterns §1.1 (the
asymptotic `∼ (log z)^κ/(Γ(κ + 1) H_g)`) with explicit constants; the hypothesis on the prime sums
is the two-sided form of *HasLogSieveDimension* `(P, g, κ, L)` of its §0.5 extended to prime
powers.

*Needs:* Abel summation (for the existence of `C` and the convergence of `Σ g(d) d^{−s}` for
`s > 0`); Mertens' `Σ_{p ≤ X} 1/p − log log X → mertensConstant ℚ`
(`TauCeti.LFunctions.tendsto_primeSummatory_inv_absNorm_sub_log_log` at `K = ℚ`);
`EulerProduct.eulerProduct_hasProd` and `EulerProduct.eulerProduct_completely_multiplicative` (the
products `Σ g(d) d^{−s} = ∏_p Σ_{ν ≥ 0} g(p^ν) p^{−νs}` and `ζ(1 + s) = ∏_p (1 − p^{−1−s})^{−1}` for
`s > 0`); `Real.Gamma`; the uncertified source by locator.

**Checks.**

- `g(d) = μ²(d)/d`: `Σ_{p ≤ Q} (log p)/p = log Q + O(1)` (AnalyticNumberTheoryPartI §0.11), so
  `κ = 1`, `L` from an explicit two-sided Mertens estimate of the shape
  `|Σ_{p ≤ Q} (log p)/p − log Q − E| < 1/(2 log Q)` for `Q ≥ 319` (`rosserSchoenfeld1962` Theorem 6,
  one `E`) with the values below `319`, `A ≤ Σ_p (log p)/p² = 0.49309`; the conclusion is
  `Σ_{d ≤ D} μ²(d)/d = C log D (1 + O*(B/log D))` with `C = ∏_p (1 + 1/p)(1 − 1/p) = 6/π²`, consistent with Layer 7.1's
  `(6/π²) log D + O*(1.166)`. The support is squarefree, so the local factors need no truncation,
  and here the product converges absolutely.
- The product converges only conditionally. Take `κ = 1` and `g` supported on the squarefree
  integers, with `g(p_k) = 2/p_k` for odd `k` and `0` for even `k`. The first hypothesis holds,
  since `Σ_{p ≤ Q} g(p) log p − log Q` is Mertens' remainder plus an alternating sum of
  `log p_k/p_k`, which decreases from `p₂ = 3` on. Its largest deviation for `Q ≤ 5·10^6` is
  `1.2002`, and `A = 1.1584`.
  Every local factor differs from `1` by about `1/p`, and `Σ_{p ≤ 4.26·10^6} |factor − 1| = 2.372`,
  growing like `log log X`. The logarithms of the partial products are `−0.449220`, `−0.448895` and
  `−0.448891` at `X = 10^3`, `10^5` and `10^6`, so `C = e^{−0.448891} = 0.63834`. A `C` read as an
  unconditional product (Mathlib's `tprod`, which is `1` when the family is not multipliable) would
  make the theorem false here.
- The truncation is needed. Take `κ = 1` and `g(m²) = μ²(m)/m`, with `g = 0` off the squares, so
  that `g(p²) = 1/p` and `g(p^ν) = 0` for `ν ≠ 0, 2`. The first hypothesis holds by Mertens, with
  `Σ_{p^ν ≤ Q} g(p^ν) log p^ν = 2 Σ_{p ≤ √Q} (log p)/p` and deviation at most `2.645` for
  `Q ≤ 9·10^6`. The second holds with `A = Σ_p 2 log p/p² = 0.98618`. Here
  `Σ_{d ≤ D} g(d) = Σ_{m ≤ √D} μ²(m)/m = (3/π²) log D + 1.0439 + o(1)` (7.2 at `√D`); the difference
  is `1.04298`, `1.04420` and `1.04389` at `D = 10^6`, `10^8` and `10^{12}`. So `C = 3/π²`, and
  indeed
  `Σ g(d) d^{−s} = ζ(1 + 2s)/ζ(2 + 4s)` gives `Φ(s) = ζ(1 + 2s)/(ζ(1 + s) ζ(2 + 4s)) → 1/(2ζ(2))`.
  The truncated partial product `∏_{p ≤ √X} (1 + 1/p) ∏_{p ≤ X} (1 − 1/p)` is `0.30426` at
  `X = 10^7`. The untruncated product `∏_p (1 + 1/p)(1 − 1/p) = 6/π²` converges absolutely and is
  twice too large: with it the ratio `Σ_{d ≤ D} g(d)/(C log D)` tends to `1/2`, and the conclusion
  fails for every large `D`.
- `κ = 0`, `g = δ`: `L = 0`, `A = 0`, `D ≥ 1`, `B = 0`, `C = 1`: `Σ_{d ≤ D} δ(d) = 1 = 1·(log D)⁰`.
- `g = μ²` (weights `1` on primes) is outside the hypotheses: `Σ_{p ≤ Q} log p − log Q = θ(Q) − log Q`
  is unbounded; the theorem is about `g(p)` of size `κ/p`.
- Non-example for the constant: `g(p) = 2/p` on squarefree `d` (`κ = 2`):
  `C = (1/2) ∏_p (1 + 2/p)(1 − 1/p)²`
  and the conclusion `Σ_{d ≤ D} g(d) ∼ C log² D` matches the leading term `(3/π²) log² D` of
  `Σ_{n ≤ D} 2^{ω(n)}/n` (Layer 7.6) only after the non-squarefree terms are added; the `Γ(3) = 2`
  is what makes the two consistent.

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

**Checks.**

- `q = 1`: `A_1 = B_1 = 1`, `a_1 = c₀ = 1.33258`, `b_1 = C₂ = 1.71714`, and the second line reads
  `Σ_{ℓ ≤ X} μ²(ℓ)/ℓ = (6/π²)(log X + C₂) + O*(2.554 X^{−1/3})`, where `2.554 ≥ 0.9105·2.80405 = 2.5531`
  is the harmonic model of 0.3 times `H̄(−1/3)` (7.1).
- `q = 2`: `a_2 = 1.33258 + 0.34657 = 1.67915`, `A_2 = 1 − 2^{1/3}/(2^{2/3} + 2^{1/3} + 1) = 0.67252`;
  at `X = 1` the first line reads `1 = ½(1.67915) + O*(4.950)`, and at `X = 100` the sum over the odd
  squarefree `ℓ ≤ 100` is `3.13799` against `½(log 100 + 1.67915) = 3.14216`, within
  `7.36·0.67252·100^{−1/3} = 1.0664`. Without the factor `φ(q)/q` the main term would be `6.28433`,
  off by `3.146`: the factor is needed.
- The worst case is `X → 1⁻`, where the sums are empty: over the reals of `(0, 10^6]` the largest
  value of `|error|·X^{1/3}` divided by `A_q`, resp. `B_q`, is `1.3326`, resp. `1.0439`, at `q = 1`, and
  `1.2484`, `1.2138`, `1.0866`, resp. `0.6766`, `0.7550`, `0.4814`, at `q = 2, 3, 6`, all below
  `7.36`, resp. `2.554`.

### Examples

- The model `g = h ⋆ (τ/n)` for `g = 2^ω/n`: the Dirichlet series of `2^ω/n` is
  `ζ(s + 1)²/ζ(2s + 2)`, so `h` is the coefficient sequence of `1/ζ(2s + 2)`: `h(n) = μ(√n)/n` on
  squares, `0` otherwise; `H(0) = 6/π²`, `u = (1/2)(6/π²) = 3/π²`, as in Layer 7.6.

### Dependencies

Layer 0 (0.3–0.6); Layer 7.4 (for 5.2, with no circularity: 7.4 depends on Layer 0 only); Layer 7.2
for the constants `c₀`, `C₂` of 5.6; AnalyticNumberTheoryPartI §3.23a (`divisorError`); Layer 0.7
(*DivisorHarmonicRangeVerified*, for the first and second forms of 5.2 on `[1, 236]`;
*DivisorPowerRangeVerified*, for the third and fourth forms of 5.2); SieveMethodsAndPrimePatterns
§§0.5, 1.1 (cited).

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
(`Nat.equivProdNatFactoredNumbers`, AnalyticNumberTheoryPartI §3.35a's indexing).

*Needs:* `Nat.equivProdNatFactoredNumbers`; `EulerProduct.summable_and_hasSum_smoothNumbers_prod_primesBelow_tsum`;
`Finset.prod_le_prod`; multiplicativity.

**Checks.**

- `f = 1`: `Σ_{n ≤ y} 1/n ≤ ∏_{p ≤ y} (1 + 1/p + … + p^{−⌊log y/log p⌋})`; at `y = 2`: `3/2 ≤ 3/2`,
  equality; at `y = 3`: `11/6 ≤ (3/2)(4/3) = 2`.
- `f = δ`: left `1`, right `1`.
- `f = τ`: `Σ_{n ≤ y} τ(n)/n ≤ ∏_{p ≤ y} (1 + 2/p + 3/p² + …) = ∏ (1 − 1/p)^{−2}`, which is
  `≈ e^{2γ} log² y = 3.17 log² y` against the true `½ log² y`: the bound is lossy by the factor
  `2 e^{2γ} ≈ 6.3`, which is why Layers 5 and 7 exist.
- Non-example: `f(n) = n`: `Σ_{n ≤ y} 1 = ⌊y⌋ ≤ ∏_{p ≤ y} (1 + ⌊log y/log p⌋)` holds (`y = 4`:
  `4 ≤ 3·2`), but the second product diverges: the first inequality always holds, the second needs
  convergence.

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

**Checks.**

- `f ≡ 0`: `S = 0`, excluded; the hypothesis `S > 0` is what makes `log(log y/S)` defined.
- `f ≡ 1`, `z = 2`: `S = log 2/2 = 0.3466`, `∏ = 2`; `y = 2` (`log y = 0.693 ≥ S`):
  `K(2) = log 2 − 1 + 1/2 = 0.193`, bound `2 exp(−1·0.193) = 1.65` for `Σ_{n > 2} v_2(n) μ²(n) = 0`
  (the `2`-smooth squarefree integers are `1, 2`): `0 ≤ 1.65`; the lower bound gives
  `Σ_{n ≤ 2} = 2 ≥ 2(1 − 0.825) = 0.35`.
- `K(1) = 0`: at `log y = S` the bound is `∏ (1 + f(p))`, the trivial bound.
- Non-example: `K(t) = log t − 1 − 1/t` would be negative on `[1, 3.6]` and make the "bound" exceed
  the trivial one; `K(t) = log t − 1 + 1/t ≥ 0` for `t ≥ 1` with `K(1) = 0` is the correct kernel.

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

**Checks.**

- `f = 1`: `A = log 4 = 1.386` (Mathlib),
  `B = Σ_p Σ_{ν ≥ 2} ν log p/p^ν = Σ_p log p (2p − 1)/(p(p − 1)²) = 1.98233` (the terms `p = 2, 3, 5, 7` already give `1.0397 + 0.4578 + 0.1811 + 0.1004 = 1.779`),
  so `A + B + 1 = 4.3686`; the conclusion `⌊x⌋ ≤ 4.3686 (x/log x) H_{⌊x⌋}` holds with room, since
  `H_{⌊x⌋} ≥ log x`.
- `x = 2`: `f(1) + f(2) ≤ (A + B + 1)(2/log 2)(1 + f(2)/2)`, and `A ≥ f(2) log 2/2` by the
  hypothesis at `y = 2`, so the right side is at least
  `(f(2) log 2/2 + 1)(2.885)(1 + f(2)/2) ≥ 1 + f(2)`.
- `x = 1` is excluded (`log 1 = 0`); as `x → 1⁺` the right side tends to `+∞`, the left is `f(1) = 1`.
  The Euler-product form holds at `x = 1`: `1 ≤ e^{a₂}(a₁ + a₃ + 1)`, the empty prime sum giving
  `exp(0) = 1` and `log(e) = 1`.
- Non-example: `f(p) = p` violates `Σ_{p ≤ y} f(p) log p ≤ A y` for every fixed `A`; the theorem is
  about functions of mean growth at most constant on primes.

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

**Checks.**

- `f = 1`: `Σ_{n ≤ x} 1 = ⌊x⌋ ≤ x ∏_{p ≤ x} (1 − 1/p)(1 + 1/(p − 1)) = x`.
- `f = τ`: the product is `∏_{p ≤ x} (1 − 1/p)^{−1} ≈ e^γ log x`, so the bound is `≈ 1.78 x log x`
  against the true `x log x + (2γ − 1)x`; at `x = 2`: `3 ≤ 2·(1/2)(1 + 2/2 + 3/4 + …) = 2·(1/2)·4 = 4`.
- `f = μ²` is excluded: `f(p²) = 0 < f(p) = 1`; and indeed the bound would read
  `Σ_{n ≤ x} μ²(n) ≤ x ∏_{p ≤ x} (1 − 1/p)(1 + 1/p) = x ∏_{p ≤ x} (1 − 1/p²)`, which holds at `x = 1` (empty product,
  `1 ≤ 1`) but fails at `x = 2` (`2 > 2·(3/4) = 1.5`) and `x = 3` (`3 > 3·(3/4)(8/9) = 2`): the
  monotonicity hypothesis is needed.
- `x < 1`: excluded; `x = 1`: `1 ≤ 1`.
- The case `f(p^ν) = f(p) ≥ 1` for every `ν ≥ 1` satisfies the hypotheses, and its local factor is
  `(1 − 1/p)(1 + f(p)/(p − 1)) = 1 + (f(p) − 1)/p`; with `1 + u ≤ e^u` the bound becomes the
  Rankin-type bound `Σ_{n ≤ x} f(n) ≤ x exp(Σ_{p ≤ x} (f(p) − 1)/p)` of
  ProbabilisticAndMetricNumberTheory §3.7 (Scope). At `f = 2^ω`, `x = 10`: the left side is `23`,
  the product bound `10·(3/2)(4/3)(6/5)(8/7) = 27.43` and the exponential one
  `10·exp(1/2 + 1/3 + 1/5 + 1/7) = 32.42`; dropping the factor `1 − 1/p` would give
  `10·3·2·(3/2)·(4/3) = 120`.

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

**Checks.**

- `d = 1`: both inequalities are equalities (`rad(1) = 1`, the product is empty).
- `f = 1`, `d = 2`, `x = 4`: left `3` (`1, 2, 3`), middle `2·#{1, 3} = 4`, right `#{squarefree ≤ 8} = 6`:
  `3 ≤ 4 ≤ 6`.
- `d = 4`: `rad(4) = 2`, the same numbers as `d = 2`; with `x·d = 16` in place of `x·rad(d)` the
  right side would be `11`, still valid but weaker: the roadmap states the sharper `rad(d)`.
- Non-example: without `μ²` the first inequality fails: `f(2) = 1`, `f(4) = 5`, `f = 1` elsewhere,
  `d = 2`, `x = 4`: left `1 + 1 + 1 + 5 = 8`, middle `(1 + 1)·2 = 4`.

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

**Checks.**

- `R(1) = 0.392 ≤ 1`, `R(4) = 0.568 ≤ 2`, `R(176) = −0.995` with `√176 = 13.3`;
  `|R(x)| < √x/2` at `x = 8`: `R(8) = 6 − 4.863 = 1.137 ≤ 1.414`; at `x = 7`: `Q(7) = 6` (the
  squarefree `n ≤ 7` are `1, 2, 3, 5, 6, 7`) and `R(7) = 6 − 4.255 = 1.745 > √7/2 = 1.323`, which is why
  the threshold is `8`.
- Non-example for the real lower constant: at `x = 1.9`, `R(1.9) = 1 − 11.4/π² = −0.15506`, below
  `−0.103229 √1.9 = −0.14229` and above `−0.15264 √1.9 = −0.21040`: Cipu's lower constant holds
  only at integers.
- Non-example for the `0.036438` row: `Q(351 115) = 213 474` (also by `Σ_{d ≤ √x} μ(d) ⌊x/d²⌋`), so
  `R(351 115) = 21.676 > 0.036438 √351 115 = 21.591`.
- Integer versus real `0.02767`: the last integer `n ≥ 438 653` with `|R(n)| > 0.02767 √n` would be
  `437 780`, below the threshold, so the integer row holds on `[438 653, 1.1·10^6]`; but
  `R(x)/√x → −0.027772` as `x → 441 353⁻`, so the real form needs the jump term `6/π²` below
  `441 353`; at both ends of every unit interval of `[441 353, 3·10^6]` the real row holds.
- The `x^{1/4}` instance: over the reals of `(1, 3·10^6]` the ratio `R(x)/x^{1/4}` stays in
  `[−0.8685, 1.11652]`, so the upper constant `1.11653` of `mossinghoffOliveiraESilvaTrudgian2021`
  Theorem 2 is attained to five digits in this range, while the lower constant `1.12543` is reached
  only further out.
- Non-example: `|R(x)| ≤ √x/2` fails at `x = 3` (`R(3) = 3 − 1.82 = 1.18 > 0.866`), so the
  threshold `8` is needed.
- `Σ μ²(n)/n`: `N = 1`: `1 ∈ [0.578, 1.166]`; `N = 2`:
  `3/2 ∈ [0.421 + 0.578, 0.421 + 1.166] = [0.999, 1.587]`; `N = 3`: `11/6 = 1.833 ∈ [0.668 + 0.578, 0.668 + 1.166] = [1.246, 1.834]`: the
  upper constant `1.166` is attained to three decimals at `N = 3` (`1.16546`); over `[1, 1.1·10^6]`
  the difference `Σ_{n ≤ N} μ²(n)/n − (6/π²) log N` ranges over `[0.57862, 1.16546]`, and over
  `[1.04049, 1.04708]` for `N ≥ 1000`.

### 7.1a The squarefree count through the Mertens function

With `Q(x) = Σ_{n ≤ x} μ²(n)` and `R(x) = Q(x) − 6x/π²` of Layer 0.5 (`6/π² = 1/ζ(2)`,
`hasSum_zeta_two`), prove:

- for every real `x`, `Q(x) = Σ_{k ≤ x} M(√(x/k))` over the naturals `1 ≤ k ≤ x`
  (both sides vanish for `x < 1`). Route: the identity
  `μ²(n) = Σ_{d² ∣ n} μ(d)` behind 7.1's `Q(x) = Σ_{d ≤ √x} μ(d) ⌊x/d²⌋`, summed over `n ≤ x` with
  the pairs `(k, d)`, `k d² ≤ x`, grouped by `k` instead of by `d`;
- for every real `x ≥ 0`, `∫_0^x M(√(x/u)) du = 6x/π²`. Route: for
  `u > 0`, `M(√(x/u)) = Σ_{d ≥ 1} μ(d) [u ≤ x/d²]`; the integrals of the absolute values of the
  terms sum to `Σ_d x/d² < ∞`, so sum and integral commute, and the integral is
  `x Σ_d μ(d)/d² = 6x/π²` (`μ ⋆ ζ = δ` with absolute convergence and `hasSum_zeta_two`). The
  integrand is bounded by `√(x/u)` (`|M(t)| ≤ t`), which is integrable at `0`;
- hence, for every real `x > 0`, `R(x) = Σ_{k ≤ x} M(√(x/k)) − ∫_0^x M(√(x/u)) du`;
- the midpoint form: for every real `x > 0` and every natural `K ≥ 0`,

      R(x) = Σ_{1 ≤ k ≤ K} M(√(x/k)) − ∫_0^{K+1/2} M(√(x/u)) du − Σ_{K < k ≤ x+1} ∫_{k−1/2}^{k+1/2} (M(√(x/u)) − M(√(x/k))) du,

  the last sum over the naturals `k` with `K < k ≤ ⌊x⌋ + 1`.
  Route: for `K > ⌊x⌋` the last sum is empty, and the form is the previous one, since
  `M(√(x/u)) = 0` for `u > x` and `M(√(x/k)) = 0` for `k > x`; for `K ≤ ⌊x⌋` write each term
  `M(√(x/k))` with `K < k ≤ ⌊x⌋ + 1` as the integral of that constant over `[k − 1/2, k + 1/2]`
  (the term `k = ⌊x⌋ + 1` is `0`), and note that these intervals tile `[K + 1/2, ⌊x⌋ + 3/2]`, on
  whose part beyond `x` the integrand vanishes. Each integral in the last sum vanishes unless
  `[k − 1/2, k + 1/2]` contains a point `x/d²`, where `M(√(x/·))` jumps, so the form isolates the
  jumps; it expresses `R` through `M` alone.

*Needs:* Layer 0.1 (`M`); Layer 0.5 (`Q`, `R`); 1.1 (`μ ⋆ ζ = δ`); `hasSum_zeta_two`;
`ArithmeticFunction.moebius_mul_coe_zeta`; Mathlib interval integrals.

**Checks.**

- `x = 10`: `Q(10) = 7` (the squarefree `1, 2, 3, 5, 6, 7, 10`), and
  `Σ_{k ≤ 10} M(√(10/k)) = M(3.16…) + M(2.23…) + 8·M(1) = −1 + 0 + 8 = 7`, since `√(10/k) ∈ [1, 2)`
  for `3 ≤ k ≤ 10`; also `Q(100) = 61` and `Q(1000) = 608` both ways.
- Non-example: `Σ_{k ≤ x} M(x/k) = 1` for every `x ≥ 1` (Meissel's identity, 1.1), not `Q(x)`; the
  square root is essential.
- `x = 1`: `∫_0^1 M(u^{−1/2}) du = Σ_d μ(d)/d² = 6/π² = 0.60793`: the integrand is `M(1) = 1` on
  `(1/4, 1]`, `M(2) = 0` on `(1/9, 1/4]`, `M(3) = M(4) = −1` on `(1/25, 1/9]`, and so on.
- The midpoint form at `x = 10.7`: `R(10.7) = 7 − 6.50482 = 0.49518`, and the right side gives
  `0.49518` at `K = 2` and at `K = 11` (where the last sum is empty). At `K = 2` the term
  `k = 11 = ⌊x⌋ + 1` is `∫_{10.5}^{11.5} M(√(10.7/u)) du − 0 = 0.2` (the integrand is `1` on
  `[10.5, 10.7]` and `0` beyond), so a last sum stopping at `k ≤ x` would give `0.69518`: the upper
  limit `x + 1` is needed.

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

**Checks.**

- `C₂ = γ + 2·0.56996 = 1.7171`, consistent with the Euler-product derivative of Layer 0.6
  (`H'(0)/H(0) = 2Σ_p log p/(p² − 1)` for `1/ζ(2s + 2)`); `c₀ = γ + 0.75537 = 1.3326`.
- `G₁(1) = 1`, `log 1 + c₀ = 1.3326`, `|1 − 1.3326| = 0.333 ≤ 2.44`; `G₁(2) = 2`,
  `log 2 + c₀ = 2.026`, `|2 − 2.026| = 0.026 ≤ 1.725`.
- `j(1) = 1` (empty products); `j(2) = 21/25 = 0.84`;
  `j(6) = 0.84·(3^{1.5} + 3 − √3 − 1)/(3^{1.5} − √3 + 1) = 0.84·5.4641/4.4641 = 1.0282`; the table of `j⋆` (`akhileshRamare2017` lines 103–104)
  gives `5.2` for `q = 6` against `5.9·1.0282 = 6.07`: the table is sharper, as the source says.
- Non-example: the main term of `G_q` without the factor `φ(q)/q` fails at `q = 2`, `D = 2`:
  `G_2(2) = 1` versus `log 2 + c₀ + log 2/2 = 2.37`, while `(1/2)(2.37) = 1.19` is within
  `5.9·0.84/√2 = 3.5`.
- The error term of Theorem 3.2 is `7/(20 √(D log D))`: at `D = 1671`,
  `|Σ_{d ≤ D} μ²(d)/d − (6/π²)(log D + C₂)| = 0.002658`, below `0.35/√(1671 log 1671) = 0.003143` but
  above `0.35/(√1671 log 1671) = 0.001154`; the second reading fails at integers from `1665` to
  `441 389`, the first has no violation on `[1665, 1.1·10^6]`, nor do `3/5` and `0.56` on
  `(1, 1.1·10^6]`, nor Corollary 3.3 on `[3475, 1.1·10^6]`.
- Tail estimates: the last unit interval violating the first form starts at `142 126` and the last
  violating the second at `59 586`, so both thresholds are within a few units of sharp; at
  `y = 500 000` the first bound is `(0.0195·13.122 − 0.11)/(500 000·172.19) = 1.69·10^{−9}`.
- The constant `0.43` for every real `X ≥ 1` fails: on `[1, 2)` the sum is `1`, and
  `|1 − (6/π²)(log X + C₂)| √X` is `0.598` at `X = 1.9` and exceeds `0.43` on `(1.62, 2)`; `1.044`
  holds there (its supremum on `[1, 2)` is `0.658`, as `X → 2⁻`).
- Corollary 3.4: no violation of `|R(x)| ≤ 1.06 √(x/log x)` on `(1, 1.1·10^6]`; at `x = 1664` the
  bound is `1.06 √(1664/7.417) = 15.88`, against `0.1333 √1664 = 5.44`, so the row `0.1333` implies it
  there, as used on `[1664, 438 653]`.

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

*Needs:* 5.1; 5.2 (the form for `t > 0`, with *DivisorHarmonicRangeVerified* `1.16 1 236`); Layer
0.6; *ArithmeticalConstantsEnclosure*.

**Checks.**

- `y = 1`: left `g(1) = 1`; right `(1/4) ∏(…) (0 − 0 − A₄ + O*(1088))`: with
  `∏_{p > 2} (p − 1)²/(p(p − 2)) = ∏_{p > 2} (1 − 1/(p − 1)²)^{−1} = 1/0.6602 = 1.5147…` (the reciprocal of the
  twin-prime constant), the right side is `0.379(−A₄ + O*(1088))`, which contains `1` iff
  `|1/0.379 + A₄| ≤ 1088`: a sanity constraint on `A₄`, satisfied for `|A₄| ≤ 1085`.
- `y = 2`: left `1 + g(2) = 1 + 1 = 2` (the factor at `p = 2` is excluded, so `g(2) = 1`).
- Local factor at `p = 3`: `(1 + 2X)(1 − X/3)² = 1 + (4/3)X − (11/9)X² + (2/9)X³` in `X = 3^{−s}`, so
  `h(3) = 4/3 = 4/(3·1)`, `h(9) = 1/9 − 4/3`, `h(27) = 2/9`, matching the general formulas; the
  factor contributes `1 + (4/3)·3^{1/3} + (11/9)·3^{2/3} + (2/9)·3 = 6.132` to `H̄(−1/3)`.
- `y = 3`: left `2 + g(3) = 2 + 2 = 4` (`2/(3 − 2) = 2`).
- Non-example: with the factor `2/(p − 2)` at `p = 2` included the summand is undefined
  (division by zero); the product over `p ∣ q, p ≠ 2` is part of the definition.
- The constants: `H'(0)/H(0) = (3/2) log 2 + 2 Σ_{p > 2} log p/(p(p − 1)) = 1.857307…` (the local
  logarithmic derivative is `2 log p/(p(p − 1))` at `p > 2` and `(3/2) log 2` at `p = 2`), so
  `A₃ = −2·1.857307 − 4γ = −6.023476…`; with `H''(0)/H(0)` from Layer 0.6 and `γ² − 2γ₁ = 0.47881…`,
  `A₄ = −1.1141…`. The perturbation constant at the exponent `2/5` is `H̄(−2/5) ≈ 950`
(`plattTrudgian2018` Lemma 4 encloses it below `950.05`), so the
  Platt–Trudgian model of 5.2 gives the error `1.0503·H̄(−2/5)/u · y^{−2/5} ≈ 2635 y^{−2/5}`, smaller
  than `1088 y^{−1/3}` only for `y` beyond about `6·10^5`; the `1/3` form stays the stated one.

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
`∫_x^∞ Δ(u) u^{−2} du ≥ 0` for every real `x ≥ 7`, and for every real `x ≥ 1` with
*DivisorSmoothedRangeVerified* `0.247 1 7` (Layer 0.7) on `[1, 7)`. Route: the hyperbola form
above, the harmonic remainder to second order, the second-derivative test in the form
`|Σ_{N < n ≤ N₁} e(±f(n))| ≤ (4/√π)(c₂ N λ₂^{1/2} + 2λ₂^{−1/2})` for integers `N < N₁ ≤ 2N` and `λ₂ ≤ f'' ≤ c₂ λ₂` (their Lemma 8;
stated and proved here as part of this target, it differs from the second-derivative tests of
ExplicitZetaBounds §4.3 in its constant and in the dyadic range `N₁ ≤ 2N`), with the Kusmin–Landau
inequality of ExplicitZetaBounds §4.1 for `x ≥ 170`. For the corollary, the first bound gives
`|r(x)| ≤ 0.24667 < 1/4` for `x ≥ 7`, and the identity `Δ(x) − x δ(x) = x ∫_x^∞ Δ(u) u^{−2} du`
(integration by parts of `Σ_{n ≤ x} τ(n)` against `1/n`) turns `1/4 + r(x) > 0` into the sign of
the integral. The
consequence the source draws from
the `0.397` row, `|δ(x)| ≤ 0.397/√x + 0.38/x`, holds for real `x ≥ 7560` (it is printed from `5560`).

*Needs:* AnalyticNumberTheoryPartI §§3.22b and 3.23a; Layer 0.3; Layer 0.7 (*DivisorRangeVerified*,
*DivisorRangeVerifiedNat*, *DivisorCubicRangeVerified*, *DivisorSmoothedRangeVerified*; §3.23a's
`BBRFiniteInput`); ExplicitZetaBounds §4.1 (the
Kusmin–Landau inequality, for the smoothed form); `Nat.card_divisors`;
`Int.fract` lemmas; the source's exponential-sum
lemma (its Lemma 4.1), stated and proved here as part of this target.

**Checks.**

- `Δ(1) = 0.8456 ≤ 0.961`; `Δ(4) = 1.837 ≤ 1.922`; `Δ(2) = 3 − 2(0.693 + 0.154) = 1.305 ≤ 1.359`;
  the largest value of `|Δ(x)|/√x` over the reals of `[1, 2·10^5]` is `0.96069`, at `x = 12`
  (`Δ(12) = 3.3279`): the constant `0.961` is sharp to three decimals.
- The hyperbola form at `x = 4`: `Σ_{n ≤ 2} ψ_B(4/n) = ψ_B(4) + ψ_B(2) = −1/2 − 1/2 = −1`, so
  `Δ(4) + 2(−1) = −0.163`, `|−0.163| ≤ 1/2`.
- Sharpness: `Δ(1980) = 22.339 > 0.5 √1980 = 22.249`, and the last violation of `0.482` on
  `[1, 2·10^5]` is at `1980`, so `1981` is the exact threshold of the second row;
  `Δ(5460) = 31.391 > 0.4 √5460 = 29.557`, and the last integer violating `0.397` is `5460`. The
  printed witness `x = 5559` is not one: `Δ(5559) = −0.705`.
- Non-example for the real form of the last row: as `x → 7560⁻`,
  `Δ(x) → Σ_{n ≤ 7559} τ(n) − 7560(log 7560 + 2γ − 1) = −35.037`, while `0.397 √7560 = 34.518`; likewise `−30.595` against
  `30.130` below `5760` and `−33.086` against `32.544` below `6720`; there is no real violation on
  `[7560, 2·10^5]`.
- The cubic bound of §3.23a holds at every real `x ∈ [5, 2·10^5]`, so its threshold `9995` is not
  sharp; the source's sharpness claim `|Δ(9994)| > 0.80·9994^{1/3} log 9994 = 158.7` (line 75) is
  false, since `Δ(9994) = −2.530` and `Δ(x) → −12.894` as `x → 9995⁻`.

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

**Checks.**

- `k = 1`: `⌊x⌋ ≤ x`; `k = 2`, `x = 2`: `3 ≤ 2(0.693 + 0.577 + 0.5) = 3.54`; `x = 1`: `1 ≤ 1`.
- Bordellès 2006 at `k = 3`: the last real `x` where `S₃(x) > x(log x + 1)²/2` lies in `[12, 13)`, so
  the threshold `13` is exact for `k = 3`; at `x = 13`,
  `S₃(13) = 77 ≤ 13·(3.565)²/2 = 82.6`, while `S₃(12) = 74 > 12·(3.485)²/2 = 72.9`. For `k = 4` and
  `k = 5` the bound already holds from `x = 1` (checked at every integer of `[1, 10^5]`, where the
  step function `S_k` meets the increasing bound; for instance `S₄(6) = 39 ≤ 6(log 6 + 2)³/6 = 54.5`
  and `S₄(12) = 133 ≤ 180.4`), so there the threshold `13` is not needed.
- The second form at `x = 6`: `k = 2`: `14 ≤ 2·6·1.79 = 21.5`; `k = 3`: `25 ≤ 38.5`; `k = 4`:
  `39 ≤ 69`; at `x = 2`, `k = 2`: `3 > 2·2·0.693 = 2.77`: the threshold is needed. Checked for
  `2 ≤ k ≤ 7` and `6 ≤ x ≤ 2000`: no violation.
- `Σ_{n ≤ x} τ₄(n) ≤ (1/3) x log³ x`: the last `x` where it fails is `192`; `Σ τ(n)² ≤ (1/4) x log³ x`
  fails last at `432`, and `≤ x log³ x` last at `6`: the three thresholds `193`, `433`, `7` are
  exact.
- `k = 2`: `τ₂ = τ = σ 0`, so `Σ_{m ≤ x} τ(m) = Σ_{m ≤ x} #m.divisors` (`sigma_zero_apply`), and the
  first bound reads `Σ_{m ≤ x} τ(m) ≤ x(log x + γ + 1/x)`, consistent with Layer 7.4's
  `x log x + (2γ − 1)x + 0.961√x` since `(2γ − 1) = 0.154 < γ`.
- `C₂ = 2γ − 1/2 = 0.654…` as printed; `C₃ = 6γ² − 4γ − 4γ₁ + 1 = 1.999 − 2.309 + 0.291 + 1 = 0.981…`
  as printed, with `γ₁ = −0.0728`: the sign of `γ₁` in `C₃` is pinned (`+0.291`, not `−0.291`).

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

*Needs:* 5.1 (at `α = 1/3` and `α = 2/5`); 5.2 (the second form, with *DivisorHarmonicRangeVerified*
`1.16 1 236`; the fourth form, with *DivisorPowerRangeVerified* `7560² (6·10^5)`); 7.1; Layer 0.3;
Layer 0.6; `hasSum_zeta_two`;
`log_add_one_le_harmonic`; ExplicitPrimeCounting §1.6 (*EulerGammaEnclosure*) and
*StieltjesGammaOneEnclosure* (for the constants `1.3949`, `0.4107` and `0.787`).

**Checks.**

- `x = 1`: left `1`; first upper bound `0.4107 + 4.61 = 5.02`; Cipu's lower `−0.916`; the
  unweighted bounds give `−0.286 ≤ 1 ≤ 2.041`.
- `x = 10`: `Σ 2^ω/n = 5.3913 ∈ [2.876, 7.374]`; `Σ 2^ω = 23 ∈ [14.12, 31.42]`, inside Cipu's
  `(8.81, 34.48)`, and `≤ 75.29`.
- `x = 10^5`: `Σ 2^ω/n = 56.7584 ≤ 56.8590` (the upper bound is tight to `0.2%`), and
  `Σ 2^ω = 778 581 ∈ [704 462, 870 812]`; the `2/5`-forms give `56.80` and `789 932`, and both hold
  at both ends of every unit interval of `[1, 10^6]`.
- Witness of the coefficient `1.3949`:
  `(12/π²)·Σ_p log p/(p² − 1) + (12/π²)γ = 0.69299 + 0.70181 = 1.39480`; a formula with `Σ_p log p/p²` instead of `Σ_p log p/(p² − 1)` would give
  `(12/π²)·0.49309 = 0.59953` and the wrong `1.30134`.
- The constants of `trudgian2015` Lemma 13 are numerically true at every `x ≤ 10^6` (no violation of
  either bound, at both ends of every unit interval), but `1.16 H̄(−1/3) = 3.2527` rests on the model
  outside its range: at `t = 0.01` the model's error is `5.766 > 1.16·0.01^{−1/3} = 5.384` (Layer 5.2).

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

**Checks.**

- `x = 1`: `1 ≤ 0.608 + 0 + 1`; `x = 2`: `1.5 ≤ 1.216 + 0.693 + 1`; `x = 10`: `6.2238 ≤ 9.3819`;
  `x = 100`: `60.83 ≤ 66.40`.
- Second bound: `x = 1`: `1 ≤ 0.203 + 0 + 1`; `x = 3`: `9 ≤ 5.47 + 4.94 + 9 = 19.4`; `x = 41`:
  `14 751 ≤ 18 769`; `x = 42`: `15 255 ≤ 20 074`.
- The step at `x = 41`: `γ + 1/3 + 1/41 + 8/123 = 0.99998`, so the analytic range starts exactly
  where the check *TotientRangeVerified* stops; with the tail `1/x` of 2.5 in place of Moser–MacLeod's
  the constant would be `1 + γ + 1/41 = 1.6016 > 1`.
- Non-example: the first bound without the constant `1` fails at `x = 1`: `1 > 6/π² + 0 = 0.608`;
  the second without `x²` fails at `x = 1`: `1 > 2/π²`.

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
squarefree integer. Up to `10^{18}` it follows from *SquarefreeGapVerified* `10^{18} 18` (Layer 0.7)
and two explicit squarefree integers. For every real `x` with `3.77 ≤ x < 10^{18} − 19`,
`11 x^{1/5} log x ≥ 19` (the left side increases in `x > 1` and is `19.04` at `3.77`), so the
interval contains the `19` consecutive integers `⌊x⌋ + 1, …, ⌊x⌋ + 19`, all below `10^{18}`, which
the proposition forbids from being all non-squarefree; for `2 ≤ x < 3.77` the interval contains the
squarefree `5`; and for `10^{18} − 19 ≤ x ≤ 10^{18}` it contains
`10^{18} + 1 = 101·9901·999 999 000 001`, a product of three distinct primes. Beyond `10^{18}` it is
the source's Propositions 1–3, with `5` in place of `11` for `x ≥ e^{400}` (its Theorem 3).

*Needs:* 1.7; 7.1; 7.2 (for the comparison); Layer 0.7 (*ZetaResidueSumVerified*,
*SquarefreeRangeVerified*, `MoebiusTableVerified`, *SquarefreeGapVerified*).

**Checks.**

- `0.0134 √x` against `0.02767 √x`: the new row is smaller by a factor `2.06` from `10^8`; at
  `x = 10^8` the MOT instance alone gives `1.12543·100 = 112.5 ≤ 0.0134·10^4 = 134`.
- Proposition 8.4(b) against 7.2's `1.06 √(x/log x)`: the ratio of the `√x` coefficients is
  `1.537·10^{−8} √(log x)/1.06`, below `1` while `log x < 4.75·10^{15}`; the whole right side of 8.4(b)
  drops below `1.06 √(x/log x)` at `x = 5.16·10^{10}` and stays below up to that upper limit.
- The gap bound alone needs an interval of length at least `19`: `11 x^{1/5} log x` is `8.76` at
  `x = 2`, `15.05` at `x = 3` and reaches `19` only at `x = 3.7627…`, so on `[2, 3.77)` the interval
  can hold fewer than `19` integers, all of which *SquarefreeGapVerified* `10^{18} 18` allows to be
  non-squarefree; there the squarefree `5` lies in `(x, x + 11 x^{1/5} log x]`, since
  `x < 5 ≤ 2 + 8.76`.

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

*Needs:* 7.4; 7.5; 5.2 (third form, with *DivisorPowerRangeVerified* `7560² (6·10^5)`); Layer 0.5
(`γ₁`); Layer 0.7 (*PiltzRemainderRangeVerified*, *DivisorRangeVerified*,
*DivisorRangeVerifiedNat*); AnalyticNumberTheoryPartI §3.23a (the cubic bound, for the `0.173` row
beyond `5·10^{12}`).

**Checks.**

- `P₃` at `γ₁ = −0.0728`: `3γ² − 3γ − 3γ₁ + 1 = 0.99952 − 1.73165 + 0.21845 + 1 = 0.48632`, and
  `3γ − 1 = 0.73165`; at `x = 100`, `x P₃(log x) = 100(10.604 + 3.369 + 0.486) = 1 446` against
  `Σ_{n ≤ 100} τ₃(n) = 1 471`, a difference `25 ≤ 2.968·21.54·1.66 = 106`.
- The leading coefficient of `P_k` is `1/(k − 1)!` (`½` at `k = 3`), matching the order of 7.5's
  Bordellès 2006 bound `x (log x + 1)²/2`.
- The `0.173` row at real arguments: `1 081 080 = 2³·3³·5·7·11·13` has `τ = 256`, and as
  `v → 1 081 080⁻`, `Δ(v) → 15 186 725 − 1 081 080(log 1 081 080 + 2γ − 1) = −181.358`, against
  `0.173 √1 081 080 = 179.877` (ratio `0.174425`); on `[6·10^5, 6·10^6]` this is the only real
  violation, and the largest integer value of `|Δ(n)|/√n` is `0.172001` (at `n = 652 080`). The rows
  `0.961`, `0.482` (from `1981`) and `0.397` (from `7560`) of 7.4 have no real violation there.
- `k = 2`: the residue of `ζ(w)² x^w/w` at `w = 1` is `x(log x + 2γ − 1)`, so `P₂(L) = L + 2γ − 1` and
  `Δ₂` is §3.23a's `divisorError`; a definition with the residue of `ζ(w)^k x^w` (without `1/w`)
  would give `P₂(L) = L + 2γ` and shift `Δ₂` by `x`.

### Examples

- `Σ_{n ≤ 100} μ²(n) = 61`, `R(100) = 61 − 60.79 = 0.21`; `Σ_{n ≤ 100} μ²(n)/n = 3.39`, between
  `0.608·4.605 + 0.578 = 3.38` and `3.97`.
- `Σ_{n ≤ 100} τ(n) = 482`, `Δ(100) = 482 − 100(4.605 + 0.154) = 6.1 ≤ 0.961·10`.

### Dependencies

Layer 0; Layers 1.2 and 1.4 (through 2.5 and the tails); Layer 2.3 and 2.5; Layer 3.2 (for the
tail estimates of 7.2); Layer 5 (5.1, 5.2, 5.4); AnalyticNumberTheoryPartI §3.22 (cited) and
§§3.22b, 3.23a (the hyperbola identity, `divisorError` and its cubic bound);
ExplicitCharacterSumsAndSieves §5.1 (the carrier of `G₁` in 7.2); ExplicitPrimeCounting §0.1 (the
asymptotic of `G₁` against which 7.2 is compared, cited only); ExplicitZetaBounds §4.1 (the
Kusmin–Landau inequality, for the smoothed remainder of 7.4). Within the layer, 7.1 uses no
other subsection of Layer 7 (nor does 7.1a, which uses only Layers 0.1, 0.5 and 1.1), so Layer
1.5, which consumes 7.1, is not downstream of anything that consumes it. Layer 1.7 for 7.8 (the zero data; 1.7 uses nothing from Layer 7); 7.9 uses
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
*MertensProductCubicRangeVerified* (Layer 0.7). This supersedes Dusart's `1 ± 1/(5 log³ x)`
(`dusart2018` Theorem 5.9, uncertified) wherever both apply; Dusart's two-sided form, which holds
from `2 278 382`, below the two-sided range of Axler's, is 8.1a. For very large `x`, `axler2022`
Proposition 6.1 sharpens the constant further: under ExplicitPrimeCounting §4.3 (`|E(x)| ≤ f(x) = (0.024334/(3 log³ x))(1 + 15/(4 log x))` for
`x ≥ 1 757 126 630 797`), the same transfer gives
`e^{−f(x)} < e^γ (log x) ∏_{p ≤ x}(1 − 1/p) < e^{f(x) + 1/(x − 1)}` there (`axler2022` Proposition
6.1, a preprint, with the sharper tail `1.02/((x − 1) log x)`).

*Needs:* AnalyticNumberTheoryPartI §§0.19, 0.21, 0.26; Tau Ceti `mertensConstant`,
`tendsto_primeSummatory_inv_absNorm_sub_log_log`; `Real.add_one_le_exp`;
*MertensProductInitialRangeVerified*; ExplicitPrimeCounting §§4.3, 4.7 (the form under
`RiemannHypothesis`); `gap:mertens-reciprocal-axler`
and *MertensProductCubicRangeVerified* (for Axler's refinement); ExplicitPrimeCounting §1.6
(*MeisselMertensEnclosure*) only when `B` is replaced by its decimal.

**Checks.**

- `x = 2`: `e^γ log 2 · (1/2) = 0.6173`; the bounds `1 − 1/log² 2 = −1.08` and
  `1 + 1/(2 log² 2) = 2.04` hold trivially; `x = 3`: `0.6522 ∈ [0.171, 1.414]`; `x = 11`: `0.8874 ∈ [0.826, 1.087]`;
  `x = 283`: `0.9833 ∈ [0.9686, 1.0157]`; `x = 293`: `0.9860 ∈ [0.9690, 1.0155]`.
- `x → 1⁺`: `log x → 0`, the product is the empty product `1`, `e^γ log x → 0`, and the lower bound
  `1 − 1/log² x → −∞`: the statement is true and empty near `1`, which is why `x > 1` (not `x ≥ 2`)
  is the hypothesis.
- The pairs are not inversions of each other in both directions: with `L = log x`, the first
  pair's upper bound gives the second pair's lower bound, since `1/(1 + 1/(2L²)) ≥ 1 − 1/(2L²)`;
  but the first pair's lower bound gives only `∏_{p ≤ x}(1 − 1/p)^{−1}/(e^γ L) ≤ 1/(1 − 1/L²)`, which
  is larger than `1 + 1/L²` for every `L > 1` (`1/(1 − b) > 1 + b` for `0 < b < 1`), so the second
  pair's upper bound is a separate statement, proved by the same transfer.
- Sign of the tail: at `x = 2`, `Σ_{p ≤ 2} 1/p − log log 2 − B = 0.5 + 0.3665 − 0.2615 = 0.6050` and
  `log(e^γ log 2 · (1/2)) = −0.4824`, so `Σ_{p > 2} c_p = −0.4824 + 0.6050 = 0.1226 > 0`; the opposite
  sign would require the tail to be `−0.1226`.
- The whole statement holds at both ends of every interval between consecutive primes on
  `(1, 4·10^5)`, in both pairs.
- The form under the Riemann hypothesis at `x = 100`: `ε_RH(100) = 3 log 100/(80π) = 0.0550` and
  `1/(x − 1) = 0.0101`, so the first quotient lies in `(e^{−0.0550}, e^{0.0651}) = (0.9465, 1.0673)`;
  its value is `0.9869` (Examples). A version without the tail term would assert
  `e^γ log x ∏_{p ≤ x}(1 − 1/p) < e^{ε_RH(x)}`, which the sign of the tail does not give.
- `B = 0.2614972128…`: `γ + Σ_p (log(1 − 1/p) + 1/p) = 0.5772 − 0.3157 = 0.2615` (the sum to
  `p ≤ 2·10^5` gives `−0.31572`).

### 8.1a Dusart's two-sided cubic form

Prove Dusart's form of the explicit Mertens product (`dusart2018` Theorem 5.9, uncertified, cited by
its locator): for every real `x ≥ 2 278 382`,

    1 − 0.2/log³ x < e^γ (log x) ∏_{p ≤ x} (1 − 1/p) < 1 + 0.2/log³ x,
    1 − 0.2/log³ x < ∏_{p ≤ x} (1 − 1/p)^{−1}/(e^γ log x) < 1 + 0.2/log³ x,

with the upper bound of the first line and the lower bound of the second for every real `x > 1`.
Both quotients of 8.1 are covered, the product `∏_{p ≤ x} p/(p − 1)` being the second, and
`∏_{p ≤ x}(1 − 1/p) = (e^{−γ}/log x)(1 + O*(0.2/log³ x))` is the first.

Route, with `E(x) = Σ_{p ≤ x} 1/p − log log x − B` and the transfer of 8.1 (the logarithm of the
first quotient is `−E(x)` plus a tail in `(0, 1/(x − 1))`, that of the second its negative):

- the upper bound of the first quotient for every real `x > 1` is Axler's `< 1 + 0.07/log³ x` of
  8.1 (the conjunction stated there), and the lower bound of the second follows from it by
  `1/(1 + u) > 1 − u`;
- for every real `x ≥ 2 278 383`, the other two follow from the one-sided input
  `E(x) ≤ 0.19992/log³ x`, the upper half of the row `(0.19992, 2 278 383)` of
  ExplicitPrimeCounting §4.3 (Broadbent–Fiori–Kadiri–Ng–Wilk, a preprint): the first quotient
  exceeds `e^{−0.19992/log³ x} ≥ 1 − 0.19992/log³ x`, and the second is below `e^u ≤ 1 + u e^u` with
  `u = 0.19992/log³ x ≤ 6.38·10^{−5}`, so below `1 + 0.19994/log³ x`. The four inequalities for
  every real `x ≥ 2 278 383`, under that input and the lower inequality `E(x) ≥ −η_A(x)` for every
  real `x > 1` of `gap:mertens-reciprocal-axler`, are the headline statement
  `mertens_product_dusart`;
- on `[2 278 382, 2 278 383)` the lower bound of the first quotient and the upper bound of the
  second are *MertensProductDusartRangeVerified* `2 278 382 2 278 383` (Layer 0.7): across that unit
  interval `log log x` changes by `3.0·10^{−8}`, more than the room `2.6·10^{−8}` that the constant
  `0.19992` leaves below `0.2/log³ x`, so the input at `2 278 383` does not reach it. The statement
  for every real `x ≥ 2 278 382` is the conjunction.

A route that uses no preprint: Axler's window `[1 − 0.07/log³ x, 1 + 0.07/log³ x]` of 8.1 for both
quotients for every real `x ≥ 46 909 074`, and *MertensProductDusartRangeVerified*
`2 278 382 46 909 074` below.

*Needs:* 8.1 (the transfer and Axler's refinement); ExplicitPrimeCounting §4.3 (the row
`(0.19992, 2 278 383)`); `gap:mertens-reciprocal-axler`; *MertensProductDusartRangeVerified*
(Layer 0.7); `Real.add_one_le_exp`.

**Checks.**

- At `x = 2 278 382` the first quotient is `1 − 0.199960/log³ x` and the second
  `1 + 0.199973/log³ x`. The primes `2 278 379` and `2 278 421` are consecutive, so the product is
  constant on `[2 278 379, 2 278 421)`, the first quotient increases there and the second decreases;
  the lower bound of the first fails on `[2 278 379, 2 278 381.5755…)` and the upper bound of the
  second on `[2 278 379, 2 278 381.7111…)` (at `x = 2 278 381` the quotients are
  `1 − 0.200054/log³ x` and `1 + 0.200067/log³ x`), so `2 278 382` is the least integer threshold,
  and the instance `2 278 381 2 278 383` of *MertensProductDusartRangeVerified* is false.
- At both ends of every interval between consecutive primes in `[2 278 382, 46 909 074]` both
  inequalities hold. The smallest margin is at `x = 2 278 382` (the Check above). On each such
  interval `(1 − Q₁) log³ x` and `(Q₂ − 1) log³ x` decrease in `x`, for the two quotients `Q₁`, `Q₂`,
  so their largest values sit at the left ends. Beyond the prime gap `[2 278 379, 2 278 421)` the
  smallest margin is at the prime `3 445 943`, where the first quotient is `1 − 0.198397/log³ x` and
  the second `1 + 0.198409/log³ x`, so the upper bound of the second fails there with `0.1984` in
  place of `0.2`.
- At `x = 2 278 383`, `log³ x = 3137.13` and `0.19992 e^{0.19992/3137.13} = 0.199933 < 0.2`: the
  margin of the second item of the route; for `x ≥ 46 909 074` Axler's window gives `0.07`.
- The upper bound of the first quotient for `x > 1` at `x = 2`: `0.6173 < 1 + 0.2/log³ 2 = 1.60`.
- As in 8.1, the two lines are not inversions of each other: the first line's lower bound gives only
  `∏_{p ≤ x}(1 − 1/p)^{−1}/(e^γ log x) < 1/(1 − 0.2/log³ x)`, which exceeds `1 + 0.2/log³ x`.

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
since there `1/(x − 1) ≤ 3·10^{−6}/log³ x`, so (with `|ε|²/(2 − |ε|) ≤ |ε|` for `|ε| ≤ 1`)
`z ≤ |ε|(1 + 3·10^{−6})/log³ x ≤ 1.000003/10 648` and
`z e^z ≤ 1.000003·e^{1.000003/10 648} |ε|/log³ x ≤ 1.0001 |ε|/log³ x`. Vanlalngaia's sharper constant
`0.841` for `|ε| < 2` (`vanlalngaia2017` Theorem 5, p. 3) rests on that paper's Theorem 4, a
remainder in terms of `θ(x) − x` that no section of ExplicitPrimeCounting states, and is not stated
here (Scope). The cases `ε = ±1` are
the Mertens product of 8.1 and `∏_{p ≤ x} (1 + 1/p) = (6/π²) e^γ log x (1 + O*(…))`; with
ExplicitPrimeCounting §4.3 the case `ε = 1` is Axler's Corollary 6.2 (`axler2022`, a preprint):
`(6e^γ/π²) log x · exp(−f(x) − 1.02/((x − 1) log x)) < ∏_{p ≤ x}(1 + 1/p) < (6e^γ/π²)(1 + 1/x) log x · exp(f(x))` for every real `x ≥ 1 757 126 630 797`.

*Needs:* 8.1 (`B`); ExplicitPrimeCounting §4.3 (Vanlalngaia's `1/log³ x`, and Axler's `f(x)` for
`ε = 1`);
`Complex.cpow`; `Real.add_one_le_exp`;
Layer 0.6 (absolute convergence of `γ(ε)`).

**Checks.**

- `ε = 0`: both sides `1` (`γ(0) = 0`, `(log x)⁰ = 1`, `z = 0`).
- `ε = −1`: `γ(−1) = −Σ_p Σ_{n ≥ 2} 1/(n p^n) = Σ_p (log(1 − 1/p) + 1/p) = B − γ`, so
  `e^{γ(−1) − B} = e^{−γ}` and the instance reads
  `∏_{p ≤ x} (1 − 1/p) = e^{−γ}/log x · (1 + O*(1.0001/log³ x))`, consistent with 8.1 and sharper for `x ≥ e^{22}`
  (`1.0001/log³ x ≤ 1.0001/10 648` against `1/(2 log² x) = 1/968`).
- `ε = 1`: `γ(1) = Σ_p (log(1 + 1/p) − 1/p) = −0.182…`, and
  `γ(1) + γ(−1) = Σ_p log(1 − 1/p²) = −log ζ(2) = −0.4977`, so `γ(1) = −0.4977 − (B − γ) = −0.4977 − 0.2615 + 0.5772 = −0.1820`; then
  `e^{γ(1) + B} = e^{0.0795} = 1.083 = (6/π²) e^γ`, the constant of
  `∏_{p ≤ x}(1 + 1/p) ∼ (6/π²) e^γ log x`:
  the sign conventions of `γ(ε)` and of `εB` are pinned by this witness.
- `x = e^{22}`: `log³ x = 10 648`, the relative error of the instance is at most
  `1.0001/10 648 = 9.39·10^{−5}`, against `7.9·10^{−5}` for the constant `0.841`. At `|ε| = 1`
  there, `z = 1/10 648 + 1/(e^{22} − 1) = 9.391463·10^{−5}` exceeds `1/10 648 = 9.391435·10^{−5}`,
  so `z ≤ 1/10 648` would be false at the edge of the range, while
  `z e^z = 9.392345·10^{−5} ≤ 1.0001/10 648 = 9.392374·10^{−5}`.
- Non-example: `ε = 2` is outside the transfer: at `p = 2` the local factor is `1 + 2/2 = 2`, but
  `γ(2)` contains `Σ_n (−1)^{n+1} 2^n/(n 2^n) = Σ_n (−1)^{n+1}/n`, which converges only
  conditionally, and the bound on `T_ε` has the factor `1/(2 − |ε|)`.

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
ExplicitPrimeCounting §6.3 states it under the forms of the exceptional clause that it lists
(among them *RealZeroGap* `(1/5) 10^{10}` given `LuZamanZhaoRecord` and *RealZeroGap*
`(3.0·10^{−3}) ∞` given `LuZamanZhaoRecord` (Banks's instance, a preprint), of its §1.7), and this
roadmap consumes the statement as stated there.

*Needs:* 8.1's transfer; ExplicitPrimeCounting §6.3; *ProgressionProductTableVerified*;
*ProgressionMertensConstantEnclosure*;
`Nat.totient`; `ZMod` residue classes (`Nat.ModEq`).

**Checks.**

- `q = 1`: `φ(1) = 1`, `B(1, 0) + K(1, 0) = B + (γ − B) = γ`, and the transfer is 8.1's; the
  second pair of 8.1 gives the bound with the constant `C = e^γ (1 + 1/log² X₀)` for every
  `x ≥ X₀ > 1`, since `1 + 1/log² x` decreases (for `X₀ = 286`: `C = 1.7811·1.03126 = 1.8368`); a
  constant depending on `x` is not one.
- Languasco–Zaccagnini's product formula: `∏_{a} C(q, a) = e^{−γ} q/φ(q)` over the residues `a` coprime
  to `q`, a consistency check on any enclosure (`q = 4`: `C(4, 1) C(4, 3) = e^{−γ}·2`).
- `q = 2`, `a = 1`: the odd primes;
  `∏_{p ≤ x, p odd} (1 − 1/p)^{−1} = (1/2) ∏_{p ≤ x} (1 − 1/p)^{−1} ≈ (e^γ/2) log x`, so `exp(B(2, 1) + K(2, 1)) = e^γ/2 = 0.8906` and no `C < 0.8906` can work at
  large `x`.
- `q = 4`, `a = 1`, `x = 5`: the product is `(1 − 1/5)^{−1} = 1.25`, `(log 5)^{1/2} = 1.2686`, so
  a constant `C` with `C·1.2686 ≥ 1.25` needs `C ≥ 0.9853` at this `x`.
- The remainder shape: a constant relative bound `|θ(t; q, a) − t/φ(q)| ≤ c t` would give the
  divergent `∫ dt/(t log t)`, so no decaying `η`; the `t/log t` shape of the hypothesis is what
  makes `B(q, a)` exist and `η(x) → 0`.
- Non-example: `a` not coprime to `q`: at most one prime is `≡ a`, the product is bounded and the
  statement with `(log x)^{1/φ(q)}` is true but not the source's; the hypothesis `(a, q) = 1` is
  kept.

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

**Checks.**

- `n = 3`: `ω = 1 ≤ 1.3841·1.0986/0.0940 = 16.2`; `n = 6`: `2 ≤ 4.25`; `n = 30`: `3 ≤ 3.85`;
  `n = 510 510`: `7 ≤ 7.06`; `n = 9 699 690`: `8 ≤ 8.02`; `n = 223 092 870`: `9 ≤ 9.0006`:
  the constant is sharp at the ninth primorial to four decimals (the least constant there is
  `9·2.956113/19.223099 = 1.384013`).
- `n = 2`: `log log 2 < 0`, excluded by `n ≥ 3`; `n = 1`: `ω = 0`, `log log 1` is junk, excluded.
- Non-example: `1.38` in place of `1.3841` fails at `n = 223 092 870` (`1.38·19.223/2.956 = 8.97 < 9`).
- Witness for the step: `θ(p₉) = log 223 092 870 = 19.22 ≥ 9(log 9 + log log 9 − 1.0769) = 17.16`,
  and `θ(p₁₄) = 37.11 ≤ 14(log 14 + log log 14 − 0.9465) = 37.28` (Robin's upper bound at its
  threshold `k = 14`); at the start of the analytic range,
  `θ(p₂₇) = θ(103) = 92.98 ≥ 27(log 27 + log log 27 − 1.25) = 87.44`.
- The table and the threshold: `k log θ(p_k)/θ(p_k)` is `1.0797` at `k = 3`, rises to `1.384013` at
  `k = 9` and then decreases (`1.3550` at `k = 16`, `1.3189` at `k = 26`), so
  `PrimorialTableVerified 26` holds; the analytic bound `log(kℓ)/ℓ` with `c = 1.25` is still
  `1.38525 > 1.3841` at `k = 26`, which is why the table runs to `26`.

### 9.2 Divisor functions

Define `superiorHighlyComposite k ε N` to mean `N ≥ 1` and `τ_k(n)/n^ε ≤ τ_k(N)/N^ε` for every
natural `n ≥ 1` (`teo2026` lines 113–116), with `τ_k = ζ^k` the `k`-fold Dirichlet convolution of
`ζ`.

- For `ε > 0` the set of such `N` is nonempty and finite (since `τ_k(n) n^{−ε} → 0`), and contains the
  largest maximiser `N_{k,ε} = ∏_p p^{a_p}` with `a_p` the largest `a` such that
  `C(a + k − 1, k − 1)/C(a + k − 2, k − 1) ≥ p^ε` (`teo2026` §2).
- `ε ↦ N_{k,ε}` is non-increasing, so for `ε` in a compact interval `[ε₁, ε₂] ⊂ (0, ∞)` only finitely
  many numbers occur.
- `N` is divisible by every prime `p` with `p^ε < k`, and the largest maximiser `N_{k,ε}` by every
  prime `p` with `p^ε ≤ k` (at a tie `p^ε = k` with `p ∤ N`, the integers `N` and `pN` give the same
  ratio, since `τ_k(p) = k`).

Prove, for every natural `k` and every natural `n ≥ 1`, `k^{ω(n)} ≤ τ_k(n) ≤ k^{Ω(n)}`, with equality
on either side exactly when `k ≤ 1` or `n` is squarefree; at `k = 2` the first is
`τ(n) ≥ 2^{ω(n)}`, and at a superior `k`-highly composite `n = N` it is `τ_k(N) ≥ k^{ω(N)}`. Route:
for `k ≥ 1`, `τ_k = ζ^k` is multiplicative (`ArithmeticFunction.IsMultiplicative.pow` of
`ArithmeticFunction.isMultiplicative_zeta`) with `τ_k(p^a) = C(a + k − 1, k − 1)`, the number of
`k`-tuples of exponents with sum `a`, by induction on `k` from `τ_k = τ_{k−1} ⋆ ζ`; for `a ≥ 1`,
`k = C(k, k − 1) ≤ C(a + k − 1, k − 1)`, the binomial coefficient increasing in `a`, and
`C(a + k − 1, k − 1) ≤ k^a`, since sending each of the `a` factors `p` of `p^a` to one of the `k`
coordinates reaches every tuple; both are strict when `a ≥ 2` and `k ≥ 2`, and the product over
`p^a ∥ n` gives the claim. For `k = 0`, `τ_0 = ζ⁰` is the identity of convolution and all three
terms are `1` at `n = 1` and `0` beyond. The hypothesis `n ≥ 1` is needed:
`τ_k(0) = 0 < 1 = k^{ω(0)}`.

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
`ArithmeticFunction.cardFactors`, `ArithmeticFunction.isMultiplicative_zeta` and
`ArithmeticFunction.IsMultiplicative.pow` (for `k^{ω(n)} ≤ τ_k(n) ≤ k^{Ω(n)}`);
AnalyticNumberTheoryPartI §3.7 (cited as the asymptotic form).

**Checks.**

- `n = 6 983 776 800 = 2⁵·3³·5²·7·11·13·17·19`: `τ(n) = 6·4·3·2⁵ = 2304`, `log n = 22.667`,
  `log log n = 3.1208`, `f₂(n) = 7.7424·3.1208/(0.6931·22.667) = 1.53794`: the constant `1.538` is
  above the maximum and `1.5379` is below it (`1.53794 > 1.5379`), so the exponent must be `1.538`
  (or `1.53795`), not the four-digit `1.5379`.
- `k = 3`, `n = 43 243 200 = 2⁶·3³·5²·7·11·13`: `τ₃(n) = 28·10·6·3³ = 45 360`, `f₃(n) = 1.59141`,
  so the exponent `1.59141` is at the maximum to five digits and `1.5915` is safely above it.
- `k = 4`, `n = 259 459 200 = 2⁷·3⁴·5²·7·11·13`: `τ₄(n) = 120·35·10·4³ = 2 688 000`,
  `f₄(n) = 1.63373 ≤ 1.6338`;
  `k = 5` at the same `n`: `τ₅(n) = 330·70·15·5³ = 43 312 500`, `f₅(n) = 1.67144 ≤ 1.6715`.
- `n = 3`: `τ(3) = 2 ≤ 3^{1.538·0.693/0.094} = 3^{11.3}`; `n = 2` is excluded (`log log 2 < 0` would
  make the exponent negative and the claim `τ(2) = 2 ≤ 2^{negative}` false).
- `τ_k(n) ≤ n^s ζ(s)^{k−1}` at `k = 1`: `1 ≤ n^s`; at `n = 1`: `1 ≤ ζ(s)^{k−1}`; at `k = 2`, `s = 2`,
  `n = 6`: `4 ≤ 36·1.645 = 59`; the exponent `k` in place of `k − 1` would also hold but is weaker.
- `superiorHighlyComposite 2 0.3 5040` holds and `superiorHighlyComposite 2 0.3 2520` fails:
  `τ(5040)/5040^{0.3} = 60/12.904 = 4.6497`, the largest value of `τ(n)/n^{0.3}`, against
  `τ(2520)/2520^{0.3} = 48/10.482 = 4.5795` and `τ(55 440)/55 440^{0.3} = 4.5293`; at `ε = 0.3` the
  maximiser has `p`-exponent `⌊1/(p^{0.3} − 1)⌋`, that is `4, 2, 1, 1` at `p = 2, 3, 5, 7` and `0`
  beyond, so it is `2⁴·3²·5·7 = 5040` (`teo2026` Table 12).
- Non-example for the definition: with `≥` in place of `≤` (a minimiser of `τ_k(n)/n^ε`) the only
  candidates are `n → ∞`, where the ratio tends to `0`; no natural `N` qualifies, so that reading
  defines nothing.
- Degenerate `ε`: for `ε ≥ 1`, `superiorHighlyComposite 2 ε 1` holds, since `τ(n)/n^ε ≤ τ(n)/n ≤ 1`;
  at `ε = 0.3`, `N = 1` fails (`4.6497 > 1`).
- The tie in the divisibility property: at `k = 2`, `ε = 1`, both `N = 1` and `N = 2` qualify
  (`τ(2)/2 = 1 = τ(1)/1`), and `2^1 = k`; `N = 1` is not divisible by `2`, so the property with
  `p^ε ≤ k` fails for it, while the largest maximiser is `N_{2,1} = 2` (`a_2 = 1`, since
  `C(2, 1)/C(1, 1) = 2 ≥ 2^1` and `C(3, 1)/C(2, 1) = 3/2 < 2`).
- `k^{ω(n)} ≤ τ_k(n) ≤ k^{Ω(n)}` at `n = 12 = 2²·3`: `4 ≤ τ(12) = 6 ≤ 8`, and
  `9 ≤ τ₃(12) = C(4, 2)·C(3, 2) = 18 ≤ 27`; at the squarefree `n = 30`, `τ₃(30) = 27 = 3³` on both
  sides; at `k = 0`, `τ_0(6) = 0 = 0^{ω(6)}`. There is no violation for `0 ≤ k ≤ 6` and
  `1 ≤ n ≤ 2·10^4`, and equality on the left holds there exactly for `k ≤ 1` or squarefree `n`.
- Non-example: `k^{Ω(n)}` is not a lower bound, `τ(4) = 3 < 2^{Ω(4)} = 4`, nor `k^{ω(n)}` an upper
  bound, `τ(4) = 3 > 2^{ω(4)} = 2`.

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
`σ(n)/n < e^γ log log n + 0.6483/log log n` (`robin1984` Théorème 2, uncertified; restated in
`axlerNicolas2023` §1, uncertified: the constant is the value `0.648213…` at `n = 12`, where
equality holds, so `0.6483` is strict). The source's route reduces to the colossally abundant
numbers and uses explicit bounds for `θ` together with a finite verification over the colossally
abundant numbers below its analytic range, in forms fixed only in the source: the bounds for `θ`
are part of this target, the verification is the source's hypothesis and is not performed here,
and the statement is therefore not one of the acceptance tests of `Suggested.lean`. State Axler–Nicolas'
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

**Checks.**

- Robin at `n = 12`: `σ(12)/12 = 7/3`, `log log 12 = 0.91024`, and
  `(7/3 − e^γ·0.91024)·0.91024 = 0.648214`, so `0.6483` holds strictly and `0.6482` fails; no `n ∈ [3, 10^5]` violates the bound.
  Nicolas' (7) without the second `e^γ` fails at `M₂` (right side `17.46` against `σ(M₂)/M₂ = 19.10`).
- Ivić: `n = 7`: `8 < 12.07`; `n = 12`: `28 < 28.29` (tight to `1%`); `n = 6`: `12 > 9.06`: the
  threshold `7` is needed. `σ*`: `n = 31`: `32 < 71.4`; `n = 30`: `σ*(30) = 72 > 68.5`: the
  threshold `31` is needed.
- Nicolas at `n = 2`: `σ(2)/2 = 3/2`, `τ(2) = 2`, `2.59791·log log 6 = 2.59791·0.583 = 1.515 ≥ 1.5`:
  holds, barely; at `n = 1` (`τ = 1`, `log log 3 = 0.094`): `1 ≤ 0.244` fails, which is why `n ≥ 2`.
- `n = 5040`: `σ = 19 344`, `σ/n = 3.838`, `τ = 60`,
  `2.59791·log log 180 = 2.59791·1.648 = 4.28 ≥ 3.838`;
  Ivić: `19 344 < 2.59·5040·log log 5040 = 27 974`.
- Non-example for the threshold:
  `σ(21) = 1 + 3 + 7 + 21 = 32 > (3/4)·1.781072·21·log log 21 = 31.2314`, so Eum–Koo's bound is stated for odd `n > 21`; the odd integers below `1.1·10^6` where it
  fails are exactly `3, 5, 7, 9, 15, 21`.
- Non-example: Eum–Koo for even `n`: `n = 12`: `28 ≤ (3/4)·1.781·12·0.910 = 14.6` fails, so the
  oddness hypothesis is necessary.

### 9.3a Highly abundant numbers and the least common multiple

Define: a natural `n` is highly abundant (`IsHighlyAbundant n`) when `n ≥ 1` and `σ(m) < σ(n)` for
every natural `m < n` (Pillai's notion; `σ(0) = 0`, so `m = 0` imposes nothing). Write
`ℓ_n = lcm(1, …, n)`, Mathlib's `Nat.lcmUpto n`: a prime `p` divides `ℓ_n` to the power
`Nat.log p n` (`Nat.factorization_lcmUpto`), and `log ℓ_n = ψ(n)`
(`Chebyshev.psi_eq_log_lcmUpto`). Prove:

- for every `N ≥ 1`, the least `m ≤ N` at which `σ` attains its maximum over `[1, N]` is highly
  abundant, since an earlier `j` with `σ(j) ≥ σ(m)` would attain it first; as `σ(N) ≥ N`, these
  maxima are unbounded, so there are infinitely many highly abundant numbers;
- the six-prime criterion (`not_isHighlyAbundant_lcmUpto_of_criterion`): let `n` be natural and
  `p₁ < p₂ < p₃ < q₁ < q₂ < q₃` primes with `√n < p₁` and `q₃ < n` such that

      ∏_{i ≤ 3} (1 + 1/q_i) ≤ ∏_{i ≤ 3} (1 + 1/(p_i (p_i + 1))) · (1 + 3/(8n)) · (1 − 4 p₁p₂p₃/(q₁q₂q₃));

  then `ℓ_n` is not highly abundant (`tao2025mo` lines 233–238, the Theorem of the answer, with its
  proof at lines 240–261);
- that `ℓ_n` is not highly abundant for every natural `n ≥ 89 693²`
  (`not_isHighlyAbundant_lcmUpto`), under Dusart's interval of ExplicitPrimeCounting §7.4: for
  every real `y ≥ 89 693` there is a prime in `(y, y(1 + 1/log³ y)]` (`tao2025mo` lines 265–297,
  where the same input is applied at `y = √n` and the range `n ≥ 89 693²` is reached).

Route for the criterion. Put `P = p₁p₂p₃` and `Q = q₁q₂q₃`. Since `p_i² > n` and `q_i² > n`,
every `p_i` and every `q_i` divides `ℓ_n` exactly once; write `ℓ_n = Q ℓ'` with no `q_i` dividing
`ℓ'`. The right side of the criterion is positive, so `Q > 4P`; divide `Q = 4P m + r` with `m ≥ 1`
and `0 < r < 4P` (`Q` is odd), and compare `ℓ_n` with the competitor `M = 4P m ℓ' < Q ℓ' = ℓ_n`.
By the multiplicativity of `σ` (`ArithmeticFunction.isMultiplicative_sigma`),
`σ(ℓ_n)/ℓ_n = (σ(ℓ')/ℓ') ∏(1 + 1/q_i)`. In `M` each `p_i` occurs at least squared where `ℓ'` has
it once, which multiplies `σ(·)/·` by at least
`(1 + 1/p_i + 1/p_i²)/(1 + 1/p_i) = 1 + 1/(p_i(p_i + 1))`; the power of `2` rises from `2^j`, where
`2^j ≤ n < 2^{j+1}`, to at least `2^{j+2}`, a factor at least
`(2^{j+3} − 1)/(2^{j+3} − 4) = 1 + 3/(2^{j+3} − 4) > 1 + 3/(8n)`; and every other prime gives a
factor at least `1`, `σ(p^a)/p^a` increasing in `a`. With the criterion this gives
`σ(M)/M ≥ (σ(ℓ_n)/ℓ_n)(1 − 4P/Q)^{−1}`, while
`ℓ_n/M = Q/(Q − r) < Q/(Q − 4P) = (1 − 4P/Q)^{−1}`; so `σ(M) > σ(ℓ_n)` with `M < ℓ_n`.

Route for the theorem. Put `x = √n ≥ 89 693` and `ε = 1/log³ x ≤ 1/11.4³`
(`log 89 693 = 11.404…`); for `y ≥ x` the interval of the input lies in `(y, y(1 + ε)]`, strictly
inside it when `y > x`. At `y = x, x(1 + ε), x(1 + ε)²` it gives primes `p₁ < p₂ < p₃` with
`√n < p₁` and `p_i ≤ x(1 + ε)^i`; at `y = n(1 + ε)^{−j}` for `j = 3, 2, 1` it gives primes
`q₁ < q₂ < q₃ < n` with `q_i > n(1 + ε)^{i−4}`; and `p₃ < q₁`, since `x(1 + ε)^6 < x²`. Then
`∏(1 + 1/q_i) ≤ ∏_{j ≤ 3}(1 + (1 + ε)^j/n)`,
`∏(1 + 1/(p_i(p_i + 1))) ≥ ∏_{i ≤ 3}(1 + 1/((1 + ε)^{2i}(n + √n)))` and
`1 − 4P/Q ≥ 1 − 4(1 + ε)^{12}/n^{3/2}`; with `ε ≤ 6.75·10^{−4}` and `n^{−1/2} ≤ 1.115·10^{−5}`
the left side of the criterion is at most `1 + 3.0041/n` and the right side at least
`1 + 3.3668/n`, so the criterion holds.

*Needs:* `ArithmeticFunction.sigma`, `ArithmeticFunction.isMultiplicative_sigma`; Mathlib
`Nat.lcmUpto`, `Nat.factorization_lcmUpto`, `Chebyshev.psi_eq_log_lcmUpto`;
ExplicitPrimeCounting §7.4 (Dusart's interval, for the theorem).

**Checks.**

- The highly abundant numbers up to `30` are `1, 2, 3, 4, 6, 8, 10, 12, 16, 18, 20, 24, 30`; `5` is
  not (`σ(5) = 6 < σ(4) = 7`), nor `7` (`σ(7) = 8 < σ(6) = 12`) or `9` (`σ(9) = 13 < σ(8) = 15`).
- `ℓ_n` is highly abundant for every `n ≤ 18`: its values `1, 2, 6, 12, 60, 420, 840, 2520, 27 720,
  360 360, 720 720, 12 252 240` are highly abundant (checked against every smaller `m`).
- The criterion at `n = 10^4` with `(p₁, p₂, p₃) = (101, 103, 107)` and
  `(q₁, q₂, q₃) = (9949, 9967, 9973)`: left side `1 + 3.0114·10^{−4}`, right side
  `1 + 3.0999·10^{−4}`, so `ℓ_{10^4}` is not highly abundant, far below the range of the theorem; at
  `n = 10^6` with `(1009, 1013, 1019)` and `(999 961, 999 979, 999 983)`: `1 + 3.0001·10^{−6}`
  against `1 + 3.2878·10^{−6}`.
- At `n = 70`, with the three least primes above `√70` and the three largest below `70`,
  `(11, 13, 17)` and `(59, 61, 67)`, the criterion fails (left side `1.0490`, right side `0.9807`);
  at `n = 18` there are not even six primes in `(√18, 18)`.
- The threshold `89 693² = 8 044 834 249` is that of the input at `y = √n`; the criterion closes
  there with room (`3.3668` against `3.0041`).
- The factor `4` of the competitor is needed: without it (`M = Pmℓ'` with `m = ⌊Q/P⌋`) the power of
  `2` is unchanged, and the analogue of the criterion,
  `∏(1 + 1/q_i) ≤ ∏(1 + 1/(p_i(p_i + 1)))·(1 − P/Q)`, fails at `n = 10^6` with the primes above
  (right side `1 + 2.9159·10^{−6}`, left side `1 + 3.0001·10^{−6}`); the `2`-adic factor
  `1 + 3/(8n)` is what closes it.

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

**Checks.**

- `n = 223 092 870`: `n/φ(n) = 6.11291…`, `log log n = 2.95612…`, and
  `(n/φ(n) − e^γ log log n) log log n = 2.506369…`: the constant is attained there to six digits,
  and `5/2`
  fails there only.
- Over the primorials `N_k` with `p_k ≤ 3·10^6` the largest value of
  `(N_k/φ(N_k) − e^γ log log N_k) log log N_k` is `2.506369…`, at `k = 9`; no `n ∈ [3, 10^5]` violates
  the bound.
- `n = 6`: `n/φ(n) = 3`, `log log φ(6) = log log 2 = −0.3665`, and `e^γ(−0.3665) + 3.65278 = 3.0000`:
  Nicolas' first constant is attained; at `n = 2`, `log log φ(2) = log log 1` is junk, which is why
  `n ≥ 3`.
- Since `σ(n)/n < n/φ(n)` for every `n ≥ 2`, Theorem 15 also bounds `σ(n)/n`, with the constant
  `2.50637` against Robin's `0.6483` of 9.3.

### Examples

- `n = 2⁸·3⁵·5³·7²·11²·13²·∏_{17 ≤ p ≤ 113} p`: Nicolas' extremal integer for `σ(n)/n` against
  `log log(3τ(n))`.
- `n = 223 092 870 = p₁ ⋯ p₉`: Robin's near-extremal primorial.

### Dependencies

Layer 8.1; Mathlib `Nat.nth`, `Chebyshev.theta`, `Nat.card_divisors`, `Nat.totient`, `primorial`,
`ArithmeticFunction.cardFactors` (9.2), `Nat.lcmUpto` (9.3a);
Tau Ceti `TauCeti.sigma_le_rpow_mul_tsum`; AnalyticNumberTheoryPartI §§3.1, 3.7 (cited); ExplicitPrimeCounting
§§5.3 (9.1, 9.3), 3.5 (9.3), 7.4 (9.3a), 4.3 and 3.2 (9.4).

## Downstream consumers

- ExplicitNumberFields: the Piltz divisor bounds and the `τ₄` asymptotic with
  *DivisorPowerRangeVerified* (7.5) for regulator-free class-number bounds; the divisor pointwise
  bounds (9.2) for discriminant estimates.
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
  (2018), Proposition 5.4 and Theorem 5.9 (uncertified).
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
- `tao2025mo`: T. Tao, answer 501229 (5 October 2025, edited 20 January 2026) to the MathOverflow
  question 501066, whether every `lcm(1, …, n)` is highly abundant; it uses Dusart's interval
  (`dusart2018` Proposition 5.4 in print). The Theorem of the answer (the six-prime criterion) with
  its proof, and the range `n ≥ 89 693²` (lines 233–297).
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
