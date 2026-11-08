# Roadmap: explicit number fields

**Summary.** This roadmap develops the numerically explicit inequalities about a number field `K`
of degree `n` on Mathlib's carriers: the count of integral ideals of norm at most `x` with
explicit error terms (Sunley, Lee, Debaene, Fehnker, Gun–Ramaré–Sivaraman, and Ramaré for
imaginary quadratic fields), explicit upper and lower bounds for the residue `κ_K` of the Dedekind
zeta function at `1` (Louboutin, Friedman, Stark, Garcia–Lee, and under the generalized Riemann
hypothesis Garcia–Grenié–Lee–Molteni and Palojärvi–Simonič), the class-number, regulator and
relative class-number bounds that follow through the class-number formula (Louboutin, Bordellès,
Cully-Hugill–Trudgian, Tudzi), explicit zero-counting formulae, zero-free regions and zero
repulsion for `ζ_K` (Trudgian, Hasanalizade–Shen–Wong, Stark, Louboutin, Kadiri, Lee,
Das–Gaba–Lee–Savalia–Wong, Kadiri–Ng–Wong, Kadiri–Ng), the consequences of a uniform gap for real
zeros of quadratic Dedekind zeta functions for the real zeros of every `ζ_K` and for an effective
Brauer–Siegel bound over Galois fields (Guo; Banks, with the computation of Lu–Zaman–Zhao),
the explicit bounds on the least primitive root modulo `p` and
modulo `p²` (McGown–Trudgian, McGown–Sorenson, McGown–Treviño–Trudgian, Kerr–McGown–Trudgian,
Chen), and the explicit theory of prime ideals: Mertens' theorems for number fields (Garcia–Lee),
the Chebotarev density theorem with explicit error terms unconditionally (Das–Kadiri–Ng) and under
the generalized Riemann hypothesis (Grenié–Molteni), the least prime ideal with a given Frobenius
class (Ahn–Kwon, Kadiri–Ng–Wong, Bach–Sorenson) and Debaene's Brun–Titchmarsh inequality. It is
built from Mathlib's Dedekind zeta function, residue, class number, regulator and CM-field API,
from Tau Ceti's ideal counting, ray class groups, geometry of numbers, Mertens constant and
Frobenius prime sets, from the analytic continuation and zero theory of LFunctions,
ZerosOfLFunctions and AnalyticNumberTheoryPartI, and from the explicit inequalities for the
Riemann zeta function, Dirichlet L-functions, primes, arithmetic functions and character sums of
the four explicit roadmaps before it in the order of supply. Its end theorems are the explicit
ideal counts, the two-sided residue bounds, the regulator-free class-number bounds, the upper and
lower bounds for relative class numbers of CM-fields, the explicit Riemann–von Mangoldt formula,
the zero-free regions and real-zero gaps for `ζ_K`, the bounds `g(p) < p^{5/8}` and
`h(p) < p^{2/3}`, Grosswald's conjecture under the generalized Riemann hypothesis, the explicit
Mertens theorems for number fields and the explicit Chebotarev, least-prime-ideal and
Brun–Titchmarsh theorems.

## Scope and ownership

**Owned here.**

- Layer 0: the Minkowski constant and the real Minkowski bound `b_K`, the local Euler factors
  `Π_K(p)` and their products over finite sets of primes, the class-number lemma
  `h_K ≤ Σ_{m ≤ b} τ_n(m)` for every real `b` such that every ideal class contains a nonzero
  integral ideal of norm at most `b` (`b_K` among them) with the Nicolas–Tenenbaum bound
  `Σ_{m ≤ x} τ_n(m) ≤ (x/(n−1)!)(log x + n − 1)^{n−1}` (which is not among the Piltz bounds of
  ExplicitMultiplicativeFunctions §7.5, and which only the class-number bounds of 5.3 use), the
  quadratic Hecke
  character `η_K` of a CM-field, the relative class number `relativeClassNumber` as a natural
  number with the divisibility `h(K⁺) ∣ h(K)` and the relative class-number formula, the Euler
  product of an abelian field as an identity of continued functions (whose form on `Re s > 1` is
  CyclotomicClassGroupsAndStickelberger's), the predicates *DedekindConjecture*, *CMPositivity*,
  `GRHMod`, *QuadraticRealZeroGap*, *ImaginaryQuadraticRealZeroGap*, *UniformQuadraticZeroGap*
  and `HasNormalTower`, and the least primitive root and least prime primitive root modulo an
  integer.
- The named propositions of *Computational hypotheses*, which the theorems carry as hypotheses;
  none of them is proved here.
- Layer 1: Rademacher's convexity bound for `ζ_K`, as the Dedekind instance of the general bound;
  the series for the digamma and trigamma functions on `Re z > 0` and their explicit remainders
  `digamma_series_remainder` and `trigamma_series_remainder`.
- Layer 2: the explicit Lipschitz lattice-point count with Widmer's constant, the explicit ideal
  counts of Sunley, Lee, Debaene, Gun–Ramaré–Sivaraman and Fehnker, and Ramaré's count for
  imaginary quadratic fields.
- Layer 3: the explicit residue bounds beyond Louboutin's first bound (which is consumed): the
  zero-dependent bound, the bound taking the prime `2` into account, Friedman's unconditional
  lower bound, Louboutin's zero-dependent lower bounds for totally imaginary fields, Garcia–Lee's
  extension of Schoenfeld's second Mertens theorem to `x ≥ 1.048`, the explicit short-sum theorem
  of Duke on unit-disc Euler-product records, and the conditional two-sided bounds of
  Garcia–Grenié–Lee–Molteni, Palojärvi–Simonič and Garcia–Lee.
- Layer 4: the explicit zero-counting formulae for `ζ_K` (Trudgian, Hasanalizade–Shen–Wong),
  Stark's one-zero lemma, the real-zero counting lemmas, Louboutin's Stark-like regions,
  the explicit zero-free regions of Kadiri, Lee and Das–Gaba–Lee–Savalia–Wong, Stark's lower
  bound for the residue in terms of the possible real zero near `1` with a constant independent
  of the degree, Stark's explicit lower bound for the residue, the field form of the uniform
  real-zero gap for quadratic fields
  with its consequences for every `ζ_K`, and the explicit zero repulsion theorems.
- Layer 5: the `h_K R_K` bounds, Bordellès' regulator-free class-number bounds, the cubic and
  quartic bounds, the upper and lower bounds for relative class numbers of CM-fields, and the
  effective Brauer–Siegel bound for Galois fields under the uniform real-zero gap.
- Layer 6: Vinogradov's sieve identity for generators of a finite cyclic group, the interval
  counts behind the Burgess-type argument, the explicit bounds on the least primitive root modulo
  `p` and `p²` (including `g(p) < p^{5/8}` for `p > 3` and `h(p) < p^{2/3}` for odd `p`), and
  Grosswald's conjecture under `GRHMod p`.
- Layer 7: the explicit Mertens theorems for number fields, the explicit Chebotarev density
  theorem under the generalized Riemann hypothesis and unconditionally, the least prime ideal with
  a given Frobenius class, and the explicit Brun–Titchmarsh inequality for the Chebotarev density
  theorem.

**Consumed, not restated** (by section, in *Exact supplier contracts*).

- Louboutin's first residue bound `κ_K ≤ (e log d_K/(2n−2))^{n−1}`: AnalyticNumberTheoryPartI
  §2.15, with its positive Mellin comparison and the coefficient bound `0 ≤ a_K(m) ≤ τ_n(m)`
  of §2.15a; the quadratic factorization
  `ζ_E = ζ_F L(s, η)` and the residue quotient `L(1, η) = κ_E/κ_F`: its §2.7 and §2.17a; the
  Aramata entire quotient `ζ_K/ζ_E` for Galois `K/E`: its §2.39b; `DedekindERH` and
  `DirichletGRH`: its §2.42 and §1.6; normal-closure discriminant bounds: its §2.31d; Heilbronn's
  theorem that a simple real zero of `ζ_N` for Galois `N` comes from a quadratic subfield, and
  Stark's near-one form of it without normality: its §2.39 and §2.31e; the
  qualitative uniform exclusion of Landau–Siegel zeros with an effective absolute constant: its
  §0.34.
- The continued Dedekind zeta function, its completion, functional equation and residues:
  LFunctions Layer 3; the quadratic and cyclotomic factorizations: LFunctions Layer 4;
  finite-order Hecke L-functions with their completions and entirety: LFunctions Layer 5; their
  nonvanishing on `Re s = 1`: LFunctions Layer 7; the series
  `γ + log κ_K + Σ_𝔭 (1/N𝔭 + log(1 − 1/N𝔭))` for the Mertens constant of `K`: LFunctions
  Layer 8; the zero count, `N(T)` and the symmetric count, Hadamard's factorization, the shape
  of the zero-free regions, the argument principle on a rectangle and the generalized Riemann
  hypothesis over the two families: ZerosOfLFunctions Layers 4, 5, 6, 7 and 9.
- Ideal counting with an existential power saving, ray class groups and their ideal counts: Tau
  Ceti's `TauCeti.isBigO_card_idealsLE_sub`, `rayClassIdealCountingFunction`,
  `rayClassIdealMainTerm_eq`, realizing Completed/GlobalNumberFields Layer 3; successive minima and
  Minkowski's second theorem: Tau Ceti's `ZLattice.successiveMin` and
  `ZLattice.prod_successiveMin_mul_measure_le_two_pow_mul_covolume`, realizing SuccessiveMinima
  Layer 1; the Frobenius prime sets and the Frobenius-restricted Chebyshev functions: Tau Ceti's
  `NumberField.Chebotarev.frobeniusPrimeSet`, `frobeniusPsi` and `frobeniusPrimeCount`, realizing
  Completed/Chebotarev; the Mertens constant of a number field: Tau Ceti's
  `TauCeti.LFunctions.mertensConstant`; the least primitive root modulo `p²`: Tau Ceti's
  `TauCeti.conreyGenerator`.
- Bordellès' Piltz divisor sums, Cully-Hugill–Trudgian's quartic divisor asymptotic and Tudzi's
  remainder for `τ_3`: ExplicitMultiplicativeFunctions §§7.5 and 7.9; Robin's bound for `ω(n)` and
  the Rosser–Schoenfeld bound for `n/φ(n)`: its §§9.1 and 9.4; Ramaré's bound for
  `Σ_{d ≤ X} μ(d)/d`, the tail of `Σ μ(d)/d²`, Cipu's squarefree remainder and the bound for
  `Σ μ²(n)/n`: its §§2.3, 2.5 and 7.1; the lower bound for Mertens' product under the Riemann
  hypothesis: its §8.1.
- Schoenfeld's bound for `ψ(x) − x` under the Riemann hypothesis: ExplicitPrimeCounting §2.2; the
  real-zero gap for quadratic Dirichlet L-functions as a hypothesis, *RealZeroGap*: its §1.7.
- Rademacher's convexity bound for records of finite-order type: ExplicitZetaBounds §3.2;
  Stieltjes' sector bound for the Stirling remainder of `log Γ` and the two-sided bound for `|Γ|`
  on vertical lines: its §§2.1 and 2.5; Backlund's argument lemma: its §5.1; admissible cosine
  polynomials: its §0.5; Landau's iterated Perron identity: its §6.1a; Lu–Zaman–Zhao's computation
  `LuZamanZhaoRecord`: its §0.4b; the numerical Landau–Siegel gaps of Guo and of Banks: its §7.9;
  Ramaré's bounds for `|L(1, χ)|`: its §9.1.
- Burgess's moment bound with its shifted form and its refinements at `r = 2`:
  ExplicitCharacterSumsAndSieves §4.1; Lapkova's Pólya–Vinogradov inequality for initial sums with
  one constant `A(q₀)`, under the finite verification of its §6.1: its §3.5.
- The global Artin map, its compatibility in towers and its agreement with the ideal-theoretic
  Artin map: ClassFieldTheory Layer 11, with the abstract norm diagram `artinMap_groundNorm` of
  its Layer 4; the abelian conductor: Tau Ceti's `TauCeti.ClassFieldTheory.abelianConductor`,
  realizing ClassFieldTheory Layer 12; the Hilbert class field and its Galois group,
  Kronecker–Weber and the conductor–discriminant formula: its Layer 13; the Legendre character is
  primitive: ClassicalArithmeticCompletion §1.5.
- The primitive character group `X(F)` of an abelian field, its Euler product
  `ζ_F = ∏_{χ ∈ X(F)} L(s, χ)` on `Re s > 1` with the residue comparison at `s = 1`, the Gauss-sum
  product and the relative class-number character product of an abelian CM field:
  CyclotomicClassGroupsAndStickelberger §3.4.

**Already in the library or stated by an earlier roadmap, and how the targets here differ.**

- Tau Ceti's `NumberField.classNumber_le_bound` (`h_K ≤ |d_K| · 4ⁿ`,
  `TauCeti/NumberTheory/EffectiveBounds/ClassNumber/Basic.lean`) and
  `NumberField.card_ideal_absNorm_le` (at most `X² 2ⁿ` nonzero integral ideals of norm at most
  `X`, for `X ≥ 1`, `TauCeti/NumberTheory/EffectiveBounds/IdealCount/Basic.lean`), realizing
  Completed/EffectiveBounds: the bounds of 5.3 replace `|d_K| 4ⁿ` by `√|d_K| (log |d_K|)^{n−1}` up
  to a factor depending on `n`, and 2.2–2.7 replace the upper bound `X² 2ⁿ` by the asymptotic
  `κ_K X` with an explicit error term.
- Tau Ceti's `TauCeti.isBigO_card_idealsLE_sub` (`#idealsLE K x = κ_K x + O(x^{1−1/n})` with an
  existential constant): Layer 2 makes the constant explicit.
- AnalyticNumberTheoryPartI §2.43(ii), Zaman's one-zero region (for `|d_K| nⁿ` beyond an absolute
  threshold, at most one zero in `σ ≥ 1 − 0.0875/log(|d_K| nⁿ)`, `|t| ≤ 1`): the regions of
  4.5–4.6 and 4.8 are zero-free for `|t| ≥ 1` with explicit coefficients of `log |d_K|` and
  `n log|t|`, and their one-zero regions near the real axis have denominators in `log |d_K|`
  alone.
- AnalyticNumberTheoryPartI §2.49, the effective Chebotarev density theorem with effective
  absolute constants `C₁, C₂, B`, and ZerosOfLFunctions 8.5, the effective prime ideal theorem
  with existential constants: 7.2–7.4 give numerical constants.
- ZerosOfLFunctions 6.2 and 7.5, the Dedekind zero-free region and the Riemann–von Mangoldt formula
  for `ζ_K` with existential constants: 4.1–4.8 give numerical constants; ZerosOfLFunctions
  Layer 3, convexity in vertical strips with existential constants: 1.1 is Rademacher's numerical
  form for `ζ_K`.
- LFunctions Layer 8, Mertens' first theorem and Mertens' product for a number field as
  asymptotics (`tendsto_prod_one_sub_inv_absNorm_div_log`), and Tau Ceti's Mertens' second theorem
  with an `O(1/log x)` error: 7.1 gives the three with explicit error terms for every `x ≥ 2`.
- Explicit lower bounds for discriminants are not restated here: Odlyzko's unconditional bound
  `r₁ log 60 + 2 r₂ log 22 ≤ log d_K` for `d_K` beyond an absolute threshold (`odlyzko1976`
  Theorem 1, in the form quoted as Theorem 2.3 of `kadiringwong2019`) is the discriminant input
  of AnalyticNumberTheoryPartI §2.9a, which derives it from the explicit form
  `log d_K ≥ r₁ log 60.1 + 2 r₂ log 22.2 − 254` of Odlyzko's second paper; and Poitou's bound
  `P(n, r₁, b) ≤ log d_K` for every `b > 0`, with its totally complex consequences in fixed
  degrees, is SmallRamificationAndAbelianVarietyBaseCases §1.7.
- CyclotomicClassGroupsAndStickelberger §3.4, the relative class number `h(F)/h(F⁺)` of an
  abelian CM field as a positive rational number with its character product, integral at the
  prime-power cyclotomic conductors: 0.4 proves `h(K⁺) ∣ h(K)` for every CM field `K` and defines
  `relativeClassNumber` as a natural number, which agrees with that ratio for abelian `K`; and its
  Euler product on `Re s > 1`, which 0.4a extends to the continued functions.
- AnalyticNumberTheoryPartI §2.31e, Stark's lower bound `κ_K ≥ c min(1/log d_K, 1 − β_K)` in terms
  of the possible real zero near `1`, stated in its section on fields of a fixed degree, with a
  constant it does not say is independent of the degree: 4.7 states it with an effective constant
  that is the same for every number field, the form 5.7 needs.
- AnalyticNumberTheoryPartI §0.34, the uniform exclusion of Landau–Siegel zeros with an effective
  but unspecified constant `c_LS`, and ExplicitPrimeCounting §1.7, its numerical hypothesis
  *RealZeroGap*: 0.5 restates the latter on quadratic fields as *UniformQuadraticZeroGap*, the
  form in which the number-field statements of 4.7, 4.9, 5.6 and 5.7 use it.

**Not owned here.** Explicit bounds for the number `N_K(σ, T)` of zeros with real part at least
`σ` (only zero repulsion, 4.10, is stated); subconvexity; every explicit inequality about `ζ` and
Dirichlet L-functions, primes and arithmetic functions (the four explicit roadmaps above),
including the uniform gap for real zeros of quadratic Dirichlet L-functions, which is consumed
from ExplicitZetaBounds §7.9 (the instances of Guo and of Banks), and the bounds for `L(1, χ)`
under the generalized Riemann hypothesis (Lamzouri–Li–Soundararajan,
`lamzourilisoundararajan2015`); the ineffective Brauer–Siegel theorem and
every ineffective residue bound (AnalyticNumberTheoryPartI §§2.31e, 2.32, 2.46), while the
effective bound for Galois fields under the uniform real-zero gap is 5.7; the imaginary quadratic
class-number formula (ImaginaryQuadraticClassNumber H2.2) and the Goldfeld–Oesterlé lower bounds
for imaginary quadratic class numbers, which nothing here uses; the explicit Burgess inequalities
and their tabulated constants (Treviño, McGown, Booker: ExplicitCharacterSumsAndSieves);
algorithms and certified computation, which nothing here uses: every computation a theorem rests
on is a named hypothesis (Conventions).
Louboutin's explicit Li-type residue bound (`louboutin2015mmj`), which makes the residue bounds of
Layer 3 depend on the explicit Li coefficients of `ζ_K`, Amberger's zero count (`amberger2026`
Theorem 1), whose proof rests on a numerical majorant for the auxiliary function of its Lemma 3,
and Chen's estimates behind the criterion of 6.5 in their own right, extend Layers 3, 4 and 6 in
their direction and belong to ExplicitNumberFields, Part II.

## Conventions

- **The field.** `K` is a number field, `n = [K:ℚ] = Module.finrank ℚ K`, `r₁ = nrRealPlaces K`,
  `r₂ = nrComplexPlaces K`, so `n = r₁ + 2r₂`; `d_K = |discr K|` as a real number;
  `h_K = classNumber K`, `R_K = Units.regulator K`, `w_K = Units.torsionOrder K`, and
  `κ_K = dedekindZeta_residue K`, which Mathlib defines as `2^{r₁}(2π)^{r₂} R_K h_K/(w_K √d_K)`.
  The root discriminant is `ρ_K = d_K^{1/n}`. Logarithms are natural. For `n ≥ 2`, `d_K ≥ 3`, so
  `log d_K > 0`; `d_ℚ = 1` and `log d_ℚ = 0`, which is why every statement with `log d_K` in a
  denominator assumes `n ≥ 2`.
- **The continued zeta function.** `ζ_K` means `dedekindZetaC K` of LFunctions Layer 3, the
  meromorphic continuation in Mathlib's normal form, which agrees with `NumberField.dedekindZeta K`
  on `Re s > 1` and vanishes at its pole `s = 1` by convention. `Λ_K = completedDedekindZeta K`,
  with `Λ_K(s) = d_K^{s/2} Γ_ℝ(s)^{r₁} Γ_ℂ(s)^{r₂} ζ_K(s)`. A *real zero* `β ∈ (0, 1)` of `ζ_K`
  means `dedekindZetaC K β = 0`; the function is analytic there, so the value is not junk, and
  `ζ_K(β) ≤ 0` means the real value. Zeros are counted with multiplicity through
  `MeromorphicOn.divisor`. Mathlib's `NumberField.dedekindZeta` is the Dirichlet series and Tau
  Ceti continues it only to `Re s > 1 − 1/n`; every statement about `ζ_K` off that half-plane is
  therefore a README target here, and `Suggested.lean` states only the headlines whose carriers
  are at the pins.
- **Zero counts.** `N_K(T)` is `zeroCount Λ_K univ (Icc 0 1 ×ℂ Icc (−T) T)`, the symmetric
  count `N±(T)` of ZerosOfLFunctions Layer 4 for `dedekindZetaData K`: the zeros `ρ = β + iγ` of
  `ζ_K` with `0 < β < 1` and `|γ| ≤ T`, with multiplicity. The poles of `Λ_K` at `0` and `1` lie
  in the rectangle and count `0`, since `zeroCount` takes the positive part of the divisor.
- **`O*`.** `f = g + O*(h)` abbreviates the inequality `|f − g| ≤ h`; every statement here
  writes the inequality itself.
- **Positive part of the logarithm.** `log⁺ y = max(0, log y)` (Mathlib's `Real.posLog`), so that
  `1 + log⁺ y ≥ 1`. Fehnker's truncation is written `log₁ y = max(1, log y)`, so that
  `log₁ y ≥ 1` (2.6).
- **Euler factors.** `Π_K(p) = ∏_{𝔭 ∣ p} (1 − N𝔭⁻¹)⁻¹` over the prime ideals above the rational
  prime `p`, `Π_K(S) = ∏_{p ∈ S} Π_K(p)` for a finite set `S` of primes, and
  `Λ_S = ∏_{p ∈ S} (1 + p^{−1/2})⁴`; both are `1` for `S = ∅`.
- **CM-fields.** `IsCMField K`, `K⁺ = maximalRealSubfield K`, `[K:ℚ] = 2n`, `[K⁺:ℚ] = n`,
  `Q_K = IsCMField.indexRealUnits K ∈ {1, 2}` the Hasse unit index, `η_K` the quadratic Hecke
  character of `K/K⁺` (0.4), `d_K/d_{K⁺} = d_{K⁺} N(𝔣_η)` the conductor of the completed
  `L(s, η_K)`, and `h⁻_K = relativeClassNumber K`. Louboutin's `k` is `K⁺` and his
  `ρ_K = d_K^{1/(2n)}` is the root discriminant above.
- **Primitive roots.** For `m ≥ 2`, `g` is a primitive root modulo `m` when
  `orderOf (g : ZMod m) = Nat.totient m`; `g(m)` is the least primitive root and
  `ĝ(m) = leastPrimePrimitiveRoot m` the least prime one; `g(p)` and
  `h(p) = TauCeti.conreyGenerator p = g(p²)` are the least primitive roots modulo `p` and modulo
  `p²`, all with the junk value `0` when no primitive root exists. `ω(m)` is the number of
  distinct prime factors of `m`
  (`ArithmeticFunction.cardDistinctFactors`), and `q_i` is the `i`-th prime (`q₁ = 2`).
- **Frobenius classes.** For a Galois extension `L/K` of number fields with group `G` and a prime
  `𝔭` of `K` unramified in `L`, `σ_𝔭 ⊆ G` is the conjugacy class of the Frobenius elements at
  the primes of `L` above `𝔭` (Mathlib's `IsArithFrobAt`, Tau Ceti's Artin symbol). For a
  conjugacy class `C`, `π_C(x)` is Tau Ceti's `frobeniusPrimeCount K L C x`, the number of primes
  `𝔭` of `K` unramified in `L` with `N𝔭 ≤ x` and `σ_𝔭 = C`, and `ψ_C(x)` is its
  `frobeniusPsi K L C x`, the sum of `log N𝔭` over the pairs `(𝔭, m)` with `𝔭` unramified,
  `m ≥ 1`, `N𝔭^m ≤ x` and `σ_𝔭^m = C`; norms are absolute.
- **Names.** Lean names in backticks are Mathlib's, Tau Ceti's, a supplier roadmap's, or one of
  this roadmap's declarations in `Suggested.lean`; the remaining objects of this roadmap carry
  mathematical notation (`μ_K`, `Π_K(p)`, `η_K`, …) or, for predicates and finite verifications,
  an italic name (*DedekindConjecture*, *McGownSorensonTable*, …), and its targets are named in
  words.
- **Computations as hypotheses.** Every finite verification, table or certificate that a theorem
  here rests on is a named proposition of *Computational hypotheses* below, declared there or
  imported by name from a supplier, and every theorem that needs it takes it as a hypothesis. A
  theorem that uses another statement, here or in a supplier, carries the hypotheses under which
  that statement is made, including those of its own inputs; the statement here names the
  principal one. Nothing here proves, performs or plans a computation.
- **Unrefereed sources.** The sources of the uniform gap for real zeros of quadratic Dirichlet
  L-functions and of the effective Brauer–Siegel bound (`guo2026`, `banks2026siegel`,
  `banks2026brauersiegel`, with `openai2026siegel`, `kerr2026` and `green2026` as context) are
  unrefereed preprints. They enter only through the predicate *UniformQuadraticZeroGap* of 0.5:
  every consequence (4.7, 4.9, 5.6, 5.7) is a theorem under that predicate, the conditional
  statements of 4.7 and 5.6 under *QuadraticRealZeroGap* and *NoImaginaryQuadraticRealZero* are kept
  beside them, and the two theorems discharging the predicate (4.9) are separate targets. Fehnker's
  counts (2.6), the regions of Das–Gaba–Lee–Savalia–Wong (4.8, 4.10) and the Chebotarev bound of
  Das–Kadiri–Ng (7.3) rest on preprints too; each is stated beside a refereed counterpart, which is
  the one the later layers use.
- **Thresholds.** A theorem a source states "for `d_K` sufficiently large" is stated with an
  absolute threshold `D₀` that exists and does not depend on `K` or `n`; every other threshold is
  the source's numeral.

## Computational hypotheses

Declared here:

- *RamareSmallRangeCheck*: for every real `X` with `1 ≤ X ≤ 10⁸`,
  `| #idealsLE ℚ(i) X − πX/4 | ≤ 1.4 X^{1/3}` and `| #idealsLE ℚ(√−3) X − πX/(3√3) | ≤ 1.94 X^{1/3}`
  (`ramare2025` Theorems 1.2–1.3 and Corollaries 1.4–1.5, the direct computation on `[1, 10⁸]`).
- *GarciaLeeMertensSmallRange*: with `M = mertensConstant ℚ`,
  `|Σ_{p ≤ x} 1/p − log log x − M| < (3 log x + 4)/(8π√x) + 5/x²` for every real `x` with
  `1.048 ≤ x < 13.5` (`garcialee2022artin` lines 129–131 and Figure 1).
- *GGLMPsiSmallRange*: `| Σ_{2 ≤ m ≤ x} Λ(m)/(m log m) − log log x − γ | ≤ 3(log x + 2)/(8π√x)`
  for every real `x` with `e ≤ x < 73.2` (`gglm2026` Theorem 2.1).
- *GGLMSmallDiscriminantTable*: every number field `K` of degree `n` with `14 ≤ d_K < 1.6·10⁶`
  satisfies `κ_K ≤ (2e^γ (log log d_K)^{1 + 19/log log d_K})^{n−1}` and
  `κ_K ≥ ζ(n)/(2e^γ (log log d_K)^{1 + 19(n−1)/log log d_K})` (`gglm2026` end of §4.3 and
  Remark 4.2).
- *KadiriDedekindPolynomialCertificate*: each degree-four cosine polynomial of the proofs of
  Theorem 1.1 and Corollary 1.2 of `kadiri2012` satisfies *IsAdmissibleCosinePolynomial* `4 a`
  (ExplicitZetaBounds §0.5) at its literal coefficients `a` (`kadiri2012`, the polynomials `P₄`
  of those proofs).
- *MossinghoffTrudgianF16Certificate*: the degree-sixteen polynomial `F₁₆` satisfies
  *IsAdmissibleCosinePolynomial* `16 a` at its literal coefficients `a` (`mossinghofftrudgian2015`
  Table 5, the polynomial of `lee2021zerofree` lines 110–135).
- *DGLSWPolynomialCertificates*: *IsAdmissibleCosinePolynomial* `n a` (ExplicitZetaBounds §0.5,
  which is the class `P_n` of `dglsw2025` §2) holds at the literal coefficients `a` of each
  polynomial `p_n` that the proofs of `dglsw2025` use: Mossinghoff–Trudgian–Yang's `p₄₆` (`n = 46`,
  coefficients in `dglsw2025` Table 13), used for Theorem 1.1 (Table 11) and for Theorem 1.2 at
  `n = 2` and `n ≥ 7` (Tables 2–3); their `p₄₀` (`n = 40`, Table 12), used for Theorem 1.2 at
  `n = 2` (Table 2); Mossinghoff–Trudgian's `p₁₆` (`n = 16`), the `F₁₆` of
  *MossinghoffTrudgianF16Certificate*, used at `n = 3` (Tables 2–3); Kondrat'ev's `p₈` (`n = 8`),
  used at `n = 4, 5, 6` (Tables 2–3); and the degree-four `p₄` (`n = 4`) of Theorem 1.3
  (Tables 4–5). `dglsw2025` prints the coefficients of `p₄₀` and `p₄₆` only, and takes `p₈` from
  Kondrat'ev's paper and `p₄` from Kadiri's (§3.3 and §§4.2–4.6). Theorems 1.4–1.5 use the
  logarithmic derivative at `k = 0` alone and no polynomial (§§5.1–5.2, Tables 6–7).
- *MinimalDiscriminantTable*: every number field `K` of degree `n ≥ 2` has `d_K ≥ d_min(n)`, with
  `d_min(n) = 3, 23, 117, 1609, 9747, 184607, 1257728, 2.29·10⁷, 1.56·10⁸, 3.91·10⁹, 2.74·10¹⁰`,
  `7.56·10¹¹, 5.43·10¹², 1.61·10¹⁴, 1.17·10¹⁵, 3.70·10¹⁶, 2.73·10¹⁷, 9.03·10¹⁸, 6.74·10¹⁹` for
  `n = 2, …, 20` and `d_min(n) = 10ⁿ` for `n ≥ 21` (`dglsw2025` Table 1, from the appendix of
  `kadiriwong2022`).
- *DGLSWSmallFieldGRH*: no number field `K` with `n = 2` and `d_K ≤ 400000`, with `n = 3` and
  `d_K ≤ 239`, or with `n = 4` and `d_K ≤ 320` has a zero `β + iγ` of `ζ_K` with `β > 1/2` and
  `|γ| ≤ 1` (`dglsw2025` arXiv v1, §4.5, (4.18), and §5.1).
- *McGownTrudgianMoebiusChecks*: with `S(X) = X Σ_{q ≤ X} φ(q)/q − Σ_{q ≤ X} φ(q)` and
  `T(X) = Σ_{q ≤ X} φ(q)`, `|S(X) − 3π^{−2}X²| ≤ (2/3) X` for every real `X` with `1 ≤ X < 38`, and
  `|T(X) − 3π^{−2}X²| ≤ X log X` for every real `X` with `2 ≤ X < 1000` (`mcgowntrudgian2020`
  lines 326–327 and 352–353).
- *McGownTrudgianOmegaChecks*: with `δ_{ω,s} = 1 − Σ_{ω−s < i ≤ ω} 1/q_i`, (a) for every integer
  `ω` with `9 ≤ ω ≤ 350` and `ω ≠ 17` some integer `0 ≤ s < ω` has `δ_{ω,s} > 0` and
  `13 ((2 + (s − 1)/δ_{ω,s}) 2^{ω−s})⁴ < max(10^{11}, (q₁ ⋯ q_ω)^{1/2})`, and (b) for every integer
  `ω` with `1 ≤ ω ≤ 4.2·10⁵` some integer `0 ≤ s < ω` has `δ_{ω,s} > 0` and
  `7 ((2 + (s − 1)/δ_{ω,s}) 2^{ω−s})⁴ < max(10^{14}, (q₁ ⋯ q_ω)^{1/4})` (`mcgowntrudgian2020`
  lines 630–644).
- *McGownTrudgianWindowCheck*: `g(p) < p^{5/8}` for every prime `p` with
  `10²² ≤ p < 2.2·10²²` and `ω(p − 1) = 17` (the part of the range of `mcgowntrudgian2020`
  Corollary 1 that its condition (9) does not reach at `ω = 17`, lines 615–644).
- *McGownSorensonTable*: for every prime `p ≤ 10¹⁶`, `g(p) < p^{5/8}` if `p > 3`,
  `g(p) < √p − 2` if `p > 409`, and, if `p` is odd, `h(p) < p^{2/3}` and `h(p) = g(p)` unless
  `p ∈ {40487, 6692367337}` (`mcgownsorenson2024` §§1–2, Theorems 1–2).
- *McGownSorensonGapChecks*: (i) for every prime `p` with `10¹⁶ < p < 10²²`, either the
  hypothesis of McGown–Trudgian's main criterion (6.3) holds at some admissible `e`, `r`, `h` and
  `H ≤ p^{5/8}`, or `g(p) < p^{5/8}`; (ii) for every odd prime `p` with `10¹⁶ < p ≤ 10²³³`, either
  the inequality of Chen's criterion (6.5) holds at `α = 0.661` for some admissible `e`, `s` and
  some `A` satisfying that criterion's Pólya–Vinogradov hypothesis at `p`, or `h(p) < p^{0.661}`
  (`mcgownsorenson2024` §§3.1–3.2).
- *GrosswaldFiniteRange*: `g(p) ≤ √p − 2` for every prime `p` with `409 < p < 2.5·10¹⁵`
  (`cohenoliveirasilvatrudgian2016` Theorem 1, lines 35–36 and 287–290).
- *GrosswaldPrimeFiniteRange*: `ĝ(p) < √p − 2` for every prime `p` with `2791 < p < 2.5·10¹⁵`
  (`cohenoliveirasilvatrudgian2016` lines 314–336).
- *GrosswaldSieveVerification*: for every prime `p` with `2.5·10¹⁵ < p < 10⁴³` and
  `ω(p − 1) ∈ {12, 13, 14}`, either `ĝ(p) < √p − 2`, or some even divisor `e` of `p − 1` has, with
  `p₁, …, p_s` the primes dividing `p − 1` but not `e` and `δ = 1 − Σ 1/p_i`, `δ > 0` and
  `(2 c(p, √p − 2)(2 + (s − 1)/δ) 2^{ω(p−1)−s} log p)² < √p − 2`, where
  `c(p, x) = (2/3)(1 + 2/√x + 3/x^{3/2})(1 + 5/(3 log p)) + (log x + 2)/(√x log p)`
  (`mcgowntrevinotrudgian2016` lines 186–255, Corollary 4, Algorithm 1 and Table 2).
- *PaszkiewiczTable*: `h(p) = g(p)` for every odd prime `p ≤ 10¹²` other than `40487` and
  `6692367337` (`kerrmcgowntrudgian2020` lines 41–43).
- *SmallPrimitiveRootsModPSquare*: `h(p) < p^{0.99}` for every odd prime `p ≤ 409` and for
  `p ∈ {40487, 6692367337}` (`kerrmcgowntrudgian2020` lines 82–84, the small cases of the proof of
  Theorem 1: Paszkiewicz's computation and the two exceptional primes).
- *GrenieMolteniSmallCases*:
  `| (|G|/|C|) ψ_C(x) − x | ≤ √x ((log x/(2π) + 2) log d_L + ((log x)²/(8π) + 2) n_L)`, and the
  same for the source's `ψ(C; x)`, for `L = ℚ` and `1 ≤ x ≤ 59` and for every Galois extension
  `L/K` with `L` quadratic, `d_L < 300` and `1 ≤ x ≤ 10⁵` (`greniemolteni2019` §5, Step 7).

Imported, as their owners state them:

- *ButheVerified*: `|ψ(x) − x| ≤ 0.94 √x` for `11 < x ≤ 10¹⁹`, with the companion bounds for `θ`
  and `π*` listed beside it (ExplicitPrimeCounting §1.3).
- *Schoenfeld1976Range*: Schoenfeld's inequalities on the initial ranges listed there, among them
  `|ψ(x) − x| < √x (log x)²/(8π)` for `73.2 < x ≤ 1427` (ExplicitPrimeCounting §1.3).
- `Buthe2016Range`: `|ψ(x) − x| ≤ √x (log x)²/(8π)` for `59 < x < 5000`, with the companion bounds
  for `θ`, `π*` and `π` listed beside it (ExplicitPrimeCounting §1.3).
- *LeeNosalMertensRange*: `|Σ_{p ≤ x} (log p)/p − log x − E| ≤ 3 log² x/(8π√x)` for
  `43.1 ≤ x ≤ 10⁶` and `|Σ_{p ≤ x} 1/p − log log x − B| ≤ 3 log x/(8π√x)` for `24.4 ≤ x ≤ 10⁶`,
  with `E` the limit of `Σ_{p ≤ x} (log p)/p − log x` and `B` the Meissel–Mertens constant
  (ExplicitPrimeCounting §1.3).
- `LeeNosalRange`: `|ψ(x) − x| ≤ √x log x (log x − log log x)/(8π)` for `101 ≤ x ≤ 338` and the
  same bound for `|θ(x) − x|` for `2657 ≤ x ≤ 3382` (ExplicitPrimeCounting §1.3).
- `ZetaZeroReciprocalSum`: `Σ_{0 < γ ≤ 10⁷} 1/γ ≤ 16.2106480369` over the zeros of `ζ` with
  multiplicity, and `ZetaZeroCountLowRange`: `|N(T) − M(T)| ≤ 0.28 log T` for every real
  `2π ≤ T ≤ 10⁹` (ExplicitPrimeCounting §1.1).
- *PsiThetaUpper* `(1 + 1.93378·10⁻⁸, 1.04320, e⁴⁰)`: `ψ(x) − θ(x) < a₁ √x + a₂ x^{1/3}` for
  `x ≥ X` (ExplicitPrimeCounting §§0.3 and 2.2, discharged by its §3.7, whose inputs a statement
  here may carry in its place).
- `LuZamanZhaoRecord`: for every `q ≤ 10¹⁰` and every quadratic Dirichlet character `χ` modulo
  `q`, primitive or not, `L(σ, χ) ≠ 0` for every real `σ ≥ 1 − 1/(5 log q)` (ExplicitZetaBounds
  §0.4b, the computation of `luzamanzhao2026`).
- *PiltzRangeVerified* `k`: `Σ_{m ≤ x} τ_k(m) ≤ 2x (log x)^{k−1}` for real
  `6 ≤ x < exp((k − 1)(γ + 1/6)/log 2)` (ExplicitMultiplicativeFunctions §7.5).
- *BordellesPiltzRangeVerified*: `Σ_{m ≤ x} τ₃(m) ≤ (x/2)(log x + 1)²` for real `13 ≤ x ≤ 670`,
  with the values of `∫_1^{13} S_k(t) t^{−2} dt` that the induction there uses
  (ExplicitMultiplicativeFunctions §7.5).
- *DivisorPowerRangeVerified* `7560² (6·10⁵)`:
  `|Σ_{n ≤ x} τ(n)/n − ½ log² x − 2γ log x − γ² + 2γ₁| ≤ 1.001 x^{−1/2}` for real
  `2 ≤ x < 6·10⁵`, and the two error bounds of Cully-Hugill–Trudgian's Theorems 1–2 for real
  `2 ≤ x < 7560²` (ExplicitMultiplicativeFunctions §7.5).
- *PiltzRemainderRangeVerified* `3 2 (1.1·10¹⁰)`:
  `|Σ_{m ≤ x} τ₃(m) − x P₃(log x)| < 2.968 x^{2/3} (log x)^{1/3}` for real `2 ≤ x < 1.1·10¹⁰`, with
  Tudzi's polynomial `P₃` (ExplicitMultiplicativeFunctions §7.9).
- *PrimorialTableVerified* `26`: `k log θ(q_k) ≤ 1.3841 θ(q_k)` for `3 ≤ k ≤ 26`, `θ(q_k)` the
  logarithm of the product of the first `k` primes (ExplicitMultiplicativeFunctions §9.1).
- *PrimorialTotientTableVerified* `24284`: `N_k/φ(N_k) < e^γ log log N_k + 2.50637/log log N_k`
  for every `k ≥ 3` with `q_k < 24284`, `N_k` the product of the first `k` primes
  (ExplicitMultiplicativeFunctions §9.4).
- *LapkovaSmallModuliVerified*: for every primitive character `χ` modulo `q` with `2 ≤ q ≤ 25`,
  every interval sum of `χ` is at most `(2/π²)√q log q + 0.9467√q + 1.668` in absolute value if
  `χ` is even and `(1/(2π))√q log q + 0.8204√q + 1.0285` if `χ` is odd
  (ExplicitCharacterSumsAndSieves §6.1).
- *MoebiusDivRangeVerified* `ε a b` (`|Σ_{d ≤ x} μ(d)/d| ≤ ε(x)` for every real `x ∈ [a, b]`), at
  the instances under which ExplicitMultiplicativeFunctions §2.3 states Ramaré's
  `|Σ_{d ≤ X} μ(d)/d| ≤ 1/10` for `X ≥ 7`: the row `x ↦ 1/10` on `[7, 463 421]` and
  `(x ↦ 0.0144/log x − 0.1/log² x) 463 421 (3·10⁷)`; with the further inputs of its Theorem 1.2,
  *MoebiusAbsIntegralLE* `1 078 853 113 556 832` and the hypotheses of its §§1.5 and 1.7
  (ExplicitMultiplicativeFunctions Layer 0.7 and §2.3).
- *MoebiusRangeVerified* `(x ↦ x/80) 1119 2087` and `(x ↦ (x + 1)/80 + 11/2) 0 1119`, with
  `MoebiusTableVerified 0.571 10¹²`, under which ExplicitMultiplicativeFunctions §1.2 states
  MacLeod's bounds for `Σ_{d ≤ x} μ(d)`, the inputs of the tail bound
  `|Σ_{d > X} μ(d)/d²| ≤ 1/X` of its §2.5 (ExplicitMultiplicativeFunctions Layer 0.7, §§1.2 and
  2.5).
- *SquarefreeRangeVerified* and *SquarefreeRangeVerifiedNat* (the squarefree remainder `R(x)`
  bounded on the sources' finite ranges), under which ExplicitMultiplicativeFunctions §7.1 states
  Cipu's `Σ_{d ≤ X} μ²(d) ≤ 6X/π² + 0.679091 √X`; and *SquarefreeReciprocalRangeVerified*
  `0.578 1.166 1 14 831`, under which it states `Σ_{d ≤ X} μ²(d)/d ≤ (6/π²) log X + 1.166`
  (ExplicitMultiplicativeFunctions Layer 0.7 and §7.1).

## Exact supplier contracts

### From Mathlib

- `NumberField.dedekindZeta` (the Dirichlet series `Σ_𝔞 N𝔞^{−s}`, junk off `Re s > 1`),
  `NumberField.dedekindZeta_residue` (with `dedekindZeta_residue_def`,
  `dedekindZeta_residue_pos`), and the class-number formula
  `NumberField.tendsto_sub_one_mul_dedekindZeta_nhdsGT`.
- `NumberField.classNumber` (`classNumber_pos`), `NumberField.Units.regulator`
  (`regulator_pos`), `NumberField.Units.torsionOrder` (`torsionOrder_pos`), `NumberField.discr`
  (`discr_ne_zero`), `InfinitePlace.nrRealPlaces`, `InfinitePlace.nrComplexPlaces`,
  `card_add_two_mul_card_eq_rank` (`r₁ + 2r₂ = n`), `Units.rank` (`= r₁ + r₂ − 1`),
  `abs_discr_ge'` (the Minkowski discriminant bound `n^{2n}/((4/π)^{2r₂} (n!)²) ≤ d_K`) and
  `abs_discr_ge` (for `n ≥ 2`).
- `NumberField.exists_ideal_in_class_of_norm_le`: every class contains a nonzero integral ideal of
  norm at most `(4/π)^{r₂} (n!/nⁿ) √d_K`; this bound is Mathlib's local notation `M K`, and it is
  not `NumberField.mixedEmbedding.minkowskiBound K 1`, whose value by
  `volume_fundamentalDomain_latticeBasis` is the covolume threshold `2^{r₁+r₂} √d_K`.
  `Ideal.absNorm`, `Ideal.absNorm_dvd_absNorm_of_le`, `ClassGroup.mk0`,
  `NumberField.mixedEmbedding.idealLattice`.
- `NumberField.IsCMField` (totally complex and quadratic over `maximalRealSubfield K`, a
  `Subfield K` with the instance `NumberField.of_subfield`), `IsCMField.complexConj`,
  `IsCMField.indexRealUnits`, `indexRealUnits_eq_one_or_two`, `indexRealUnits_eq_two_iff`, and
  `regulator_div_regulator_eq_two_pow_mul_indexRealUnits_inv`: `R_K/R_{K⁺} = 2^{rank K}/Q_K` with
  `rank K = n − 1` for `[K:ℚ] = 2n`; `isTotallyReal_maximalRealSubfield`.
- `ZMod.isCyclic_units_prime`, `ZMod.isCyclic_units_of_prime_pow` (odd `p`), `orderOf`,
  `Nat.totient`, `Nat.primeFactors`, `ArithmeticFunction.cardDistinctFactors`, `DirichletCharacter`,
  `DirichletCharacter.LFunction` (the continued L-function of a Dirichlet character),
  `ArithmeticFunction.moebius`, `ArithmeticFunction.zeta` (so that `τ_n = ζ ^ n` in the Dirichlet
  ring), `riemannZeta`, `RiemannHypothesis`, `Real.eulerMascheroniConstant`, `Real.posLog`,
  `Nat.infinite_setOfPred_prime_and_eq_mod` (Dirichlet's theorem,
  `Mathlib/NumberTheory/LSeries/PrimesInAP.lean`).
- `Complex.Gammaℝ`, `Complex.Gammaℂ`, `Complex.Gammaℝ_mul_Gammaℝ_add_one`, `Complex.digamma`,
  `MeromorphicOn.divisor`, `IsGalois`, `IsAbelianGalois`, `normalClosure`,
  `IntermediateField.extendScalars`, `Real.geom_mean_le_arith_mean_weighted`.
- `IsArithFrobAt` (arithmetic Frobenius elements at a prime of a Galois extension of Dedekind
  domains), `ArithmeticFunction.vonMangoldt`, for Layer 7.
- For 1.1a: `Complex.digamma` (`logDeriv Gamma`) with `Complex.digamma_one`,
  `Complex.digamma_nat_add_one`, `Complex.digamma_apply_add_nat` and `Complex.digamma_one_sub`;
  `Real.BohrMollerup.tendsto_log_gamma` (with `logGammaSeq`), `Real.tendsto_harmonic_sub_log`,
  `Complex.Gamma_ofReal`, `Complex.differentiableAt_Gamma`, `Complex.Gamma_ne_zero`,
  `hasDerivAt_of_tendstoLocallyUniformlyOn`, `HasDerivAt.real_of_complex`,
  `Complex.differentiableOn_tsum_of_summable_norm`, `Complex.hasSum_deriv_of_summable_norm` and
  `AnalyticOnNhd.eqOn_of_preconnected_of_frequently_eq`.
- For 0.4a: `IsCyclotomicExtension.Rat.intermediateFieldEquivSubgroupChar` (the character group of
  an intermediate field of a cyclotomic field, the carrier of the products of
  CyclotomicClassGroupsAndStickelberger §3.4), `DirichletCharacter.primitiveCharacter`,
  `DirichletCharacter.LFunction` with `DirichletCharacter.differentiable_LFunction` (entire for a
  nontrivial character) and `riemannZeta`.

### From Tau Ceti

- `TauCeti.idealsLE K x` (the finset of nonzero integral ideals of norm at most `x`) and
  `TauCeti.primesLE K x` (the finset of height-one primes of norm at most `x`), with
  `TauCeti.isBigO_card_idealsLE_sub` (`#idealsLE K x = κ_K x + O(x^{1 − 1/n})`,
  `TauCeti/NumberTheory/NumberField/DedekindZeta.lean`), realizing
  Completed/ArithmeticDirichletSeries and Completed/GlobalNumberFields Layer 3.
- `TauCeti.GlobalNumberFields.Modulus K` (finite part a nonzero ideal, infinite part a finset of
  real places), `Modulus.one K`, `narrowModulus K` (unit finite part, every real place),
  `RayClassGroup 𝔪`, `integralIdealsPrimeTo 𝔪`, `idealClass 𝔪`,
  `rayClassIdealCountingFunction 𝔪 c x` (the number of integral ideals prime to `𝔪` in the class
  `c` with norm at most `x`), `rayClassIdealMainTerm 𝔪` with
  `rayClassIdealMainTerm_eq : rayClassIdealMainTerm 𝔪 = κ_K / #RayClassGroup 𝔪 · ∏_{𝔭 ∣ 𝔪₀} (1 − N𝔭⁻¹)`,
  `rayClassIdealCount` (existential exponent). The ray class group of `Modulus.one K` is the class
  group, and that of `narrowModulus K` the narrow class group.
- `ZLattice.successiveMin L K i` (the real-valued successive minima of a `ℤ`-submodule `L`
  with respect to a convex body `K`, indexed from `0`, with junk value `0` when no dilate of `K`
  contains `i + 1` independent vectors of `L`; `TauCeti/Algebra/Module/ZLattice/SuccessiveMinima.lean`),
  `ZLattice.prod_successiveMin_mul_measure_le_two_pow_mul_covolume` (Minkowski's second theorem,
  upper half, for a full lattice and a convex body symmetric about `0`,
  `TauCeti/NumberTheory/GeometryOfNumbers/MinkowskiSecond.lean`),
  `IsLipschitzParametrizable`, `abs_ncard_inter_mul_sub_measureReal_le` (the cell count with the
  boundary term identified) and `exists_abs_ncard_smul_inter_vadd_sub_le` (the Lipschitz count with
  an existential constant, `TauCeti/NumberTheory/GeometryOfNumbers/LatticePointCount.lean`),
  realizing SuccessiveMinima Layer 1.
- `NumberField.Chebotarev.frobeniusPrimeSet K L C` (the primes of `K` unramified in `L` with
  Artin class `C`), `frobeniusPsi K L C x`, `frobeniusTheta K L C x` and
  `frobeniusPrimeCount K L C x`, with `tendsto_frobeniusPrimeCount`
  (`TauCeti/NumberTheory/Chebotarev/`), realizing Completed/Chebotarev.
- `TauCeti.ClassFieldTheory.abelianConductor K L` (`K`, `L : Type`; the least admissible modulus
  of `L/K`, that is, the conductor of the idele-class norm group, with
  `isAdmissibleModulus_iff_abelianConductor_dvd`; for abelian `L/K` it is the conductor of class
  field theory, and its finite part is the conductor ideal `𝔣` of 7.5;
  `TauCeti/NumberTheory/ClassFieldTheory/Global/AdmissibleModulus/Basic.lean`), realizing
  ClassFieldTheory Layer 12.
- `TauCeti.LFunctions.mertensConstant K` (the limit of `Σ_{N𝔭 ≤ x} 1/N𝔭 − log log x`,
  `TauCeti/NumberTheory/LFunctions/Mertens.lean`); at `K = ℚ` it is the Meissel–Mertens constant
  `M = 0.2614972…`.
- `TauCeti.conreyGenerator p` (the least natural number that is a primitive root modulo `p²`, `0`
  if there is none), with `TauCeti.orderOf_conreyGenerator` (for an odd prime `p` it is a
  primitive root modulo every power of `p`), `TauCeti.conreyGenerator_le` and
  `TauCeti.conreyGenerator_three` (`TauCeti/NumberTheory/DirichletCharacter/Conrey.lean`): the
  least primitive root `h(p)` modulo `p²` of 0.6 and 6.5.
- `TauCeti.Contour.argumentPrinciple_nullHomologous` through ZerosOfLFunctions 7.2.
- For 0.4a: `TauCeti.eventuallyEq_of_meromorphic_of_eqOn_halfPlane`
  (`TauCeti/Analysis/Meromorphic/Continuation.lean`), uniqueness of meromorphic continuation from a
  right half-plane.
- `NumberField.classNumber_le_bound` and `NumberField.card_ideal_absNorm_le`
  (`TauCeti/NumberTheory/EffectiveBounds/`), realizing Completed/EffectiveBounds, as comparisons.

### From TauCetiRoadmap.LFunctions

Layer 3: `dedekindZetaC`, `completedDedekindZeta`, `dedekindZetaData` (degree `n`, conductor
`d_K`, root number `1`), agreement with `dedekindZeta` on `Re s > 1`, `analyticAt_dedekindZetaC`,
`meromorphicOrderAt_dedekindZetaC_one`, `tendsto_sub_one_mul_dedekindZetaC` (residue `κ_K`),
`completedDedekindZeta_one_sub` and the germ functional equation. Layer 4:
`dedekindZetaC_quadratic`, `dedekindZetaC_cyclotomic`, `dirichletData`. Layer 5:
`PrimitiveRayClassCharacter`, `heckeLFunctionC`, `completedHeckeLFunction`,
`differentiable_completedHeckeLFunction`, the functional equation `Λ(χ, s) = W(χ) Λ(χ⁻¹, 1 − s)`,
`heckeData`. Layer 0: `AnalyticLFunctionData`, `ofSeries`, `HasDirichletAgreement`,
`HasMeromorphicContinuation`, `HasFunctionalEquation`. Layer 7: the nonvanishing of a primitive
finite-order Hecke L-function on `Re s = 1`. Layer 8: Mertens' product for `K`
(`tendsto_prod_one_sub_inv_absNorm_div_log`) and, from its route, the expression of the constant
`B_K` of Mertens' second theorem for `K` (Tau Ceti's `mertensConstant K`) as
`γ + log κ_K + Σ_𝔭 (1/N𝔭 + log(1 − 1/N𝔭))`; used in 7.1 and as its comparison.

### From TauCetiRoadmap.ZerosOfLFunctions

Layer 2 (`arithmeticConductor (dedekindZetaData K) = d_K`, `analyticConductorAt`); Layer 4
(`zeroCount`, `N(T)` and `N±(T)` with their finiteness and additivity, 4.2 the divisor of a
record, 4.3 Jensen's bound); Layer 5 (5.5 Hadamard's theorem at order at most one, 5.6 the
L-function corollaries: the partial-fraction expansion of `Λ'_K/Λ_K` over the zeros); Layer 6
(6.2 the shape of the Dedekind zero-free region, 6.3 `IsExceptionalZero`, 6.4(4d) the
logarithmic-derivative inequality with the pole terms, 6.5 no zeros on `Re s ∈ {0, 1}`); Layer 7
(7.1 `rectBoundary`, 7.2 the argument principle on a rectangle in divisor form, 7.3 the argument
variation, 7.5 the Riemann–von Mangoldt formula with existential constants); Layer 9
(*AllOnCriticalLine*, and *GRH* over the two families: every zero of the completion has real
part `1/2`).

### From TauCetiRoadmap.AnalyticNumberTheoryPartI

§0.34 (`landau_siegel_exclusion`, the qualitative uniform gap); §1.6 `DirichletGRH χ` (every zero
`s` of `DirichletCharacter.LFunction χ` with `Re s > 0`, other than the pole value of the
principal character, has `Re s = 1/2`) and `GRH`; §2.5 (the complex residue of the continued
`ζ_K` is `dedekindZeta_residue K`); §2.7 (for a quadratic extension `E/F` the canonical primitive
quadratic Hecke character `η` with `ζ_E = ζ_F L(s, η)` including the ramified factors) and §2.17a
(`L(1, η) = κ_E/κ_F > 0`); §2.15 `dedekindZeta_residue_le` (`κ_K ≤ (e log d_K/(2(n−1)))^{n−1}`
for `n ≥ 2`) and §2.15a (the positive Mellin comparison:
`F_K(s) = λ/(s(s−1)) + ∫_1^∞ S_K(x)(x^{s−1} + x^{−s}) dx` with `S_K ≥ 0`, the coefficient bound `0 ≤ a_K(m) ≤ τ_n(m)`, and the
log-convexity of `g`); §2.18 (the unit-disc coefficient construction of an Euler-product record);
§2.22 (the completion
`Q^{s/2} Γ_ℝ(s+1)^g L(s, η)` of the CM character with `Q = d_E/d_F`); §2.31d (`d_N ≤ d_K^{[N:ℚ]}`,
`[N:ℚ] ≤ n!` for the normal closure `N`, and `d_F ≤ d_K^{1/[K:F]}` for a subfield `F`); §2.31e
(Stark's Lemma 8: for `K ≠ ℚ` of degree `n`, a real zero `β` of `ζ_K` with
`1 − β < 1/(4 n! log d_K)` is a zero of `ζ_F` for a quadratic subfield `F ⊆ K`, without
normality; for Galois `N` the character computation of that argument gives, at a simple
real zero `β` of `ζ_N` with quadratic subfield `F`, `ζ_E(β) = 0` iff `F ⊆ E` for every
intermediate field `E`; used in 4.7. The fixed-degree residue bounds of §2.31e, and Stark's
Lemmas 2–4 as that fixed-degree section states them, with a constant it does not say is
independent of the degree, are not used here: 4.7 states the degree-uniform form that 5.7 needs);
§2.39 (Heilbronn's theorem: a simple real zero `β ∈ (0, 1)` of
`ζ_N` for Galois `N/ℚ` is a zero of `ζ_F` for a quadratic subfield `F ⊆ N`); §2.39b (the Aramata
entire quotient `ζ_K/ζ_E` for finite Galois `K/E`); §2.42 `DedekindERH K` (every zero of `ζ_K` with
`0 < Re s < 1` has `Re s = 1/2`) with its abelian case (for `K/ℚ` abelian, `DirichletGRH` for the
primitive characters of `K` gives `DedekindERH K`); §§2.43, 2.49 as comparisons.

### From TauCetiRoadmap.ClassFieldTheory

Layer 4 (the abstract Artin map with its norm diagram `artinMap_groundNorm`), Layer 11 (the
global Artin map of a finite Galois extension, its compatibility in towers, and its agreement
`globalArtinMap_ideal` with the ideal-theoretic Artin map at unramified primes), Layer 12
(the abelian conductor, realized by Tau Ceti's `TauCeti.ClassFieldTheory.abelianConductor` of the
Tau Ceti contract above) and Layer 13 (`hilbertClassField`,
`gal_hilbertClassField_equiv_classGroup`, the Hilbert class field is unramified at every place
including the real ones, Kronecker–Weber, and the abelian conductor–discriminant formula
`d_F = ∏_{χ ∈ X(F)} f_χ`).

What ClassFieldTheory must provide (gap:artin-norm-compatibility): for an abelian extension `H/F`
of number fields and a finite extension `K/F`, the Artin symbol for `HK/K` of a fractional ideal
`𝔞` of `K` prime to the conductor restricts on `H` to the Artin symbol of `N_{K/F} 𝔞` for `H/F`
(the ideal-theoretic norm functoriality of the global Artin map under a change of base field).
Required location: Layer 11.

### From TauCetiRoadmap.ClassicalArithmeticCompletion

§1.5 (the Legendre character is primitive), for the character-sum inputs of Layer 6.

### From TauCetiRoadmap.ImaginaryQuadraticClassNumber

H2.2 (the imaginary quadratic class-number formula with its exact constants), the degree-two case
of the relative class-number formula of 0.4.

### From TauCetiRoadmap.CyclotomicClassGroupsAndStickelberger

§3.4: the primitive character group `X(F)` of an abelian number field `F`, realized for an
intermediate field `F` of a cyclotomic field `ℚ(ζ_m)` by the characters modulo `m` of
`IsCyclotomicExtension.Rat.intermediateFieldEquivSubgroupChar m K ℂ F`, each taken at its primitive
character; the Euler-product identity `ζ_F(s) = ∏_{χ ∈ X(F)} L(s, χ)` on `Re s > 1` and its
residue comparison `κ_F = ∏_{1 ≠ χ ∈ X(F)} L(1, χ)` with `dedekindZeta_residue`;
the Gauss-sum product `∏_{χ ∈ X(F)} τ(χ) = i^{r₂(F)} √d_F`; and, for abelian CM `F`, the rational
ratio `h(F)/h(F⁺)` with its odd-character Bernoulli product
`h(F)/h(F⁺) = Q_F w_F ∏_{χ ∈ X(F) odd} (−B_{1,χ}/2)`, with which Layer 0's natural number agrees.
Used in 0.4, 0.4a, 5.2 and 5.6.

### From TauCetiRoadmap.SuccessiveMinima

Layer 1 (`successiveMin`, attainment, monotonicity, scaling, the upper half of Minkowski's second
theorem), through the Tau Ceti declarations above.

### From TauCetiRoadmap.ExplicitZetaBounds

§3.2: Rademacher's convexity bound for a record `d` of LFunctions Layer 0 of *finite-order type*
(Dirichlet agreement, meromorphic continuation and functional equation; every element of
`d.gammaR` in `{0, 1}` and every element of `d.gammaC` equal to `0`; polar divisor supported in
`{0, 1}` with order at most `1`; ZerosOfLFunctions *IsFiniteOrder* `d`; and the coefficient
majorant `Σ_k |d.coeff k| k^{−σ} ≤ ζ(σ)^m` for every real `σ > 1`, with `m = d.degree`): for
`0 < η ≤ 1/2`, `−η ≤ σ = Re s ≤ 1 + η` and `s ≠ 1`,
`‖continuedL d s‖ ≤ P(s) (N (|1+s|/(2π))^m)^{(1+η−σ)/2} ζ(1+η)^m` with `N = d.conductor`,
`P(s) = 3|(1+s)/(1−s)|` when `d` has a pole at `1` and `P = 1` otherwise. The record
`dedekindZetaData K` is of finite-order type: ZerosOfLFunctions 3.1 gives *IsFiniteOrder*, and the
majorant is `ζ_K(σ) ≤ ζ(σ)ⁿ`, from `0 ≤ a_K(k) ≤ τ_n(k)` (0.3) and `Σ_k τ_n(k) k^{−σ} = ζ(σ)ⁿ`. The
size of the majorant is what the bound needs: a nonnegative majorant of another size does not
suffice. Used in 1.1.

§§2.1 and 2.5: Stieltjes' sector bound at its first term, for `0 < δ ≤ π` and `|arg s| ≤ π − δ`,
`Γ(s) = √(2π) exp((s − 1/2) Log s − s + ξ(s))` with `|ξ(s)| ≤ 1/(12 sin²(δ/2)|s|)` (§2.1); and the
two-sided bound on vertical lines, for `σ > 0` and real `t ≠ 0`,
`√(2π) |s|^{σ−1/2} e^{−π|t|/2} e^{−σ³/(3t²)} < |Γ(s)| ≤ √(2π) |s|^{σ−1/2} e^{−π|t|/2} e^{1/(6|s|)}`
(§2.5; on the real axis its §2.6). Used for the explicit gamma factors of 2.2, 2.3, 3.5, 3.6, 4.1
and 4.2.

§5.1: Backlund's argument lemma: for real `T`, `σ₁ < a`, `r > a − σ₁` and `f` holomorphic on an
open set containing the closed disc of radius `r` about `a + iT`, with `Re f(a + iT) ≠ 0` and
`f(σ + iT) ≠ 0` for `σ₁ ≤ σ ≤ a`, every continuous argument of `σ ↦ f(σ + iT)` varies on `[σ₁, a]`
by at most `π (1 + log(M/|Re f(a + iT)|)/log(r/(a − σ₁)))`, `M` the maximum of `|f|` on the
boundary circle. The form normalised by `|f(a + iT)|` follows by applying it to `u f` with
`u = conj f(a + iT)/|f(a + iT)|`, which has the same argument variation and
`Re (u f)(a + iT) = |f(a + iT)|`. Used in 4.1 and 4.2.

§0.5: *IsAdmissibleCosinePolynomial* `n a` (`0 ≤ a_k` for `k ≤ n`, `a_k = 0` for `k > n`,
`a₀ < a₁`, and `Σ_{k ≤ n} a_k cos(kθ) ≥ 0` for every real `θ`); the vanishing clause makes `a` the
coefficient vector of the polynomial, so the vector of a certificate is the literal coefficients
extended by zero, and `(3, 4, 1, 0, 0, 1, 0, …)` at `n = 4` is not admissible although its first
five entries are; a *polynomial certificate* is this proposition at literal rational
coefficients. Used in the certificates of *Computational hypotheses* that 4.5, 4.6 and 4.8 carry.

§0.4b: `LuZamanZhaoRecord` (for every `q ≤ 10¹⁰` and every quadratic character `χ` modulo `q`,
primitive or not, `L(σ, χ) ≠ 0` for every real `σ ≥ 1 − 1/(5 log q)`; `luzamanzhao2026`
Theorem 1.1), a named computation that every statement using it carries. Used in 4.9.

§7.9: *HasLandauSiegelGap* `c Q` (for every primitive real nonprincipal Dirichlet character `χ` of
conductor `q` with `3 ≤ q ≤ Q` and every real zero `β ∈ (0, 1)` of `L(s, χ)`,
`(1 − β) log q ≥ c`), the proposition of ExplicitPrimeCounting §1.7's *RealZeroGap*, with two of
its instances as that section states them. Guo's: *HasLandauSiegelGap* `(1/100) ∞`, with the
strict inequality `(1 − β) log q > 1/100` for every conductor `q ≥ 3` (`guo2026` Theorem 1.1, an
unrefereed preprint, with no computation). Banks's: given `LuZamanZhaoRecord`,
*HasLandauSiegelGap* `(3.0·10⁻³) ∞` (`banks2026siegel` Theorem 1.1, an unrefereed preprint, for
`q ≥ 10¹⁰`, whose Remark 7.1 computes the constant `3.069…·10⁻³`; below `10¹⁰` from the instance
*HasLandauSiegelGap* `(1/5) 10¹⁰` that the record gives, with the strict inequality). Used in 4.9,
whose Banks instance carries `LuZamanZhaoRecord`.

§7.7: Ralaivaosaona and Razakarinoro's bound: for `−d` a fundamental discriminant with
`d > 3·10⁸`, `L(s, χ_{−d})` has no real zero `β ≥ 1 − 6.035/√d`. Used in the Checks of 0.5.

§9.1: Ramaré's bounds: for a primitive Dirichlet character `χ` of conductor `q > 1`,
`|L(1, χ)| ≤ (1/2) log q` if `χ` is even and `|L(1, χ)| ≤ (1/2) log q + 5/2 − log 6` if `χ` is
odd (`ramare2001` Corollary 1). Used in 5.2 and 5.6.

§6.1a: Landau's iterated Perron identity. For `F(s) = Σ_{k ≥ 1} a_k k^{−s}` absolutely
convergent on `Re s > κ_a`, an integer `j ≥ 1`, a real `c > max(κ_a, 0)` and `x > 0`, the integral
`(1/2πi) ∫_{c−i∞}^{c+i∞} F(s) x^{s+j} ds/(s(s+1)⋯(s+j))` converges absolutely and equals
`(1/j!) Σ_{k ≤ x} a_k (x − k)^j`, which is also the `j`-fold iterated integral
`∫_0^x ∫_0^{y_j} ⋯ ∫_0^{y_2} Σ_{k ≤ y_1} a_k dy_1 ⋯ dy_j` (the kernel integral is
`(1 − 1/y)^j/j!` for `y ≥ 1` and `0` for `0 < y ≤ 1`). This is the form 2.2 and 2.3 use with
`j = n` and 3.6 with `j = 1`; the truncated and averaged Perron formulas of its §§6.1–6.2, and
Tau Ceti's `truncatedPerron_LSeries`, are other forms and are not needed.

### From TauCetiRoadmap.ExplicitCharacterSumsAndSieves

§4.1: Burgess's moment bound in its shifted form: for `χ` non-principal modulo a prime `p` and
integers `r, h ≥ 1`,
`Σ_{x ∈ 𝔽_p} |Σ_{m=0}^{h−1} χ(x + m)|^{2r} ≤ ((2r)!/(2^r r!)) p h^r + (2r − 1) √p h^{2r}`, and for
`r = 2` the refinements `< (3h² − 2h)p + 2(h⁴ − 3h² + 2h)√p` for `χ` of order `2` and
`< (2h² − h)p + 3(h⁴ − 2h² + h)√p` otherwise (`mcgowntrudgian2020` lines 120–126, Proposition 1).
Used in 6.3.

§3.5 with §6.1: Lapkova's inequality for initial sums with one constant: under
*LapkovaSmallModuliVerified* (§6.1, the small moduli `2 ≤ q ≤ 25` of Lapkova's Lemma 3A), for real
`q₀ > 1`, every primitive Dirichlet character `χ` modulo `q ≥ q₀`, even or odd, and every real
`M`, `|Σ_{1 ≤ n ≤ M} χ(n)| ≤ A(q₀) √q log q` with
`A(q₀) = 1/(2π) + 0.8204/log q₀ + 1.0285/(√q₀ log q₀)`: the odd case of Lapkova's Lemma 3A divided
by `√q log q`, the even case being halved by Pomerance's observation. `kerrmcgowntrudgian2020`
Lemma 3 (lines 121–122) prints the middle term as `0.8204/√q₀`, which does not follow from Lemma 3A
and gives the value `0.16` of its line 278 at `q₀ = 10¹²`. `A(q₀)` decreases in `q₀`. At a prime
modulus every non-principal character is primitive, which is the case 6.5 uses. Every theorem of 6.5
that uses this bound carries *LapkovaSmallModuliVerified*.

### From TauCetiRoadmap.ExplicitMultiplicativeFunctions

Each statement below is consumed as the named section states it, with the finite verifications it
carries there (Conventions, *Computations as hypotheses*).

§7.5: Bordellès' bounds `Σ_{m ≤ x} τ_k(m) ≤ x (log x + γ + 1/x)^{k−1}` for `k ≥ 1`, `x ≥ 1`;
`≤ 2x (log x)^{k−1}` for `x ≥ 6` under its *PiltzRangeVerified* `k`; and
`≤ (x/(k−1)!) (log x + k − 2)^{k−1}` for `k ≥ 3`, `x ≥ 13` under its
*BordellesPiltzRangeVerified*; and Cully-Hugill–Trudgian's `Σ_{m ≤ x} τ_4(m) ≤ (1/3) x log³ x`
for `x ≥ 193` under its *DivisorPowerRangeVerified* `7560² (6·10⁵)`, together with the real-argument
divisor row of its §7.4 and the third form of its §5.2, on which that bound rests. Used in 5.3 and
5.4.

§7.9: Tudzi's `|Σ_{m ≤ x} τ_3(m) − x P₃(log x)| < 2.968 x^{2/3} (log x)^{1/3}` for every real
`x ≥ 2`, with `P₃(y) = y²/2 + (3γ − 1)y + 3γ² − 3γ − 3γ₁ + 1` the polynomial for which
`x P₃(log x)` is the residue of `ζ(s)³ xˢ/s` at `s = 1` and `γ₁ = −0.0728158…` the first Stieltjes
constant, under its *PiltzRemainderRangeVerified* `3 2 (1.1·10¹⁰)` and the inputs of its §§7.4 and
5.2. Used in 5.4.

§9.1: Robin's `ω(m) ≤ 1.3841 log m/log log m` for every natural `m ≥ 3`, under its
*PrimorialTableVerified* `26` and the lower bound `p_k ≥ k(log k + log log k − 1)` for `k ≥ 2` of
ExplicitPrimeCounting §5.3. Used in 6.3, 6.4 and 6.5.

§9.4: Rosser–Schoenfeld's `m/φ(m) < e^γ log log m + 2.50637/log log m` for every natural `m ≥ 3`,
with `5/2` in place of `2.50637` except at `m = 223092870`, under its
*PrimorialTotientTableVerified* `24284` and the bounds of ExplicitPrimeCounting §§3.2 and 4.3 it
consumes; it gives the form with `2.51` that 6.5 uses. Used in 6.5.

§§2.3, 2.5 and 7.1: Ramaré's `|Σ_{d ≤ X} μ(d)/d| ≤ 1/10` for every real `X ≥ 7` (§2.3), the tail
bound `|Σ_{d > X} μ(d)/d²| ≤ 1/X` for every real `X ≥ 1` (§2.5), Cipu's
`Σ_{d ≤ X} μ²(d) ≤ 6X/π² + 0.679091 √X` for every real `X ≥ 1` and the bound
`Σ_{d ≤ X} μ²(d)/d ≤ (6/π²) log X + 1.166` for every real `X ≥ 1` (§7.1), each under the finite
verifications that section names: *MoebiusDivRangeVerified* at the row `x ↦ 1/10` on `[7, 463 421]`
and at `(x ↦ 0.0144/log x − 0.1/log² x) 463 421 (3·10⁷)`, with *MoebiusAbsIntegralLE*
`1 078 853 113 556 832` and the hypotheses of its §§1.5 and 1.7 (§2.3); *MoebiusRangeVerified*
`(x ↦ x/80) 1119 2087` and `(x ↦ (x + 1)/80 + 11/2) 0 1119` with `MoebiusTableVerified 0.571 10¹²`,
through MacLeod's bounds of its §1.2 (§2.5); *SquarefreeRangeVerified* and
*SquarefreeRangeVerifiedNat* (Cipu's bound) and *SquarefreeReciprocalRangeVerified*
`0.578 1.166 1 14 831` (§7.1), all of its Layer 0.7. They are the inputs of McGown–Trudgian's
estimates for `S(X)` and `T(X)` in the ranges `X ≥ 38` and `X ≥ 1000` (`mcgowntrudgian2020` lines
300–353). Used in 6.2.

§8.1: Mertens' product under the Riemann hypothesis (`leenosal2026` Corollary 1.3, quoted as
Lemma 2.2 of `gglm2026`): under `RiemannHypothesis` and the Mertens estimate
`|Σ_{p ≤ x} 1/p − log log x − B| ≤ ε_RH(x) = 3 log x/(8π√x)` for every real `x ≥ 24.4` of
ExplicitPrimeCounting §4.7, with the finite verifications that section carries (*ButheVerified*,
*LeeNosalMertensRange*, `LeeNosalRange`, `ZetaZeroReciprocalSum`, `ZetaZeroCountLowRange` and
*PsiThetaUpper* or the inputs of its §3.7 that discharge it), for every real `x ≥ 24.4`,
`e^{−ε_RH(x)} < e^γ (log x) ∏_{p ≤ x} (1 − 1/p)`; since `e^{−ε} ≥ 1 − ε`, this gives
`∏_{p ≤ x} (1 − 1/p) ≥ (e^{−γ}/log x)(1 − 3 log x/(8π√x))`, the form 3.6 uses at `x ≥ 5·10⁵`.
Used in 3.6.

Every theorem here that uses one of these statements carries the named finite verifications as
hypotheses.

### From TauCetiRoadmap.ExplicitPrimeCounting

§2.2: Schoenfeld's `|ψ(x) − x| < √x (log x)²/(8π)` for every real `x > 73.2`, under
`RiemannHypothesis` and the finite verifications *ButheVerified* and *Schoenfeld1976Range* of its
§1.3 (`schoenfeld-1976` Theorem 10). Used in 3.6 and 7.2, each of which carries the two predicates.
Its two-sided form starts at `73.2`; below, its lower side alone holds from `59`.

§1.3: `Buthe2016Range`, whose first clause is `|ψ(x) − x| ≤ √x (log x)²/(8π)` for every real
`59 < x < 5000` (Büthe's computation, as that section states and locates it), a named finite
verification. Used in 7.2 for `L = ℚ` on `59 < x ≤ 73.2`, between the small cases of
*GrenieMolteniSmallCases* and Schoenfeld's range.

§1.7: *RealZeroGap* `c Q` (every real zero `β ∈ (0, 1)` of
`DirichletCharacter.LFunction χ`, for every primitive real nonprincipal character `χ` of
conductor `3 ≤ q ≤ Q`, has `(1 − β) log q ≥ c`), its name for ExplicitZetaBounds §7.9's
*HasLandauSiegelGap* `c Q`, whose instances are consumed from that section; used in 0.5.

§4.7: Lee–Nosal's second Mertens theorem under the Riemann hypothesis,
`|Σ_{p ≤ x} 1/p − log log x − B| ≤ 3 log x/(8π√x)` for every real `x ≥ 24.4`, with
`B = mertensConstant ℚ`, under `RiemannHypothesis`, *ButheVerified*, *LeeNosalMertensRange*,
`ZetaZeroReciprocalSum`, *PsiThetaUpper* (or the inputs of its §3.7 that discharge it) and the other
inputs of its §2.2 (`LeeNosalRange`, `ZetaZeroCountLowRange`); it is the estimate that
ExplicitMultiplicativeFunctions §8.1 turns into Mertens' product, and 3.6 carries its finite
verifications with that product.

What ExplicitPrimeCounting must provide (gap:explicit-mertens-second): Schoenfeld's second Mertens
theorem under the Riemann hypothesis from `x = 13.5`: under `RiemannHypothesis`, for every real
`x ≥ 13.5`, `|Σ_{p ≤ x} 1/p − log log x − M| < (3 log x + 4)/(8π√x)`, with `M` the Meissel–Mertens
constant `mertensConstant ℚ` (`schoenfeld-1976` lines 127–136, Corollary 2, (6.21)), beside
Lee–Nosal's sharper bound of that section, which starts at `x = 24.4`. Used in 3.5 (both sides)
and 3.6 (the upper side). Required location: §4.7.

What ExplicitPrimeCounting must provide (gap:bach-grh-smoothed-sum): Bach's lemma: for a
non-principal Dirichlet character `χ` modulo a prime `p` with `DirichletGRH χ` and real `x ≥ 1`,
`|Σ_{n < x} Λ(n) χ(n) (1 − n/x)| ≤ c(p, x) √x log p` with
`c(p, x) = (2/3)(1 + 2/√x + 3/x^{3/2})(1 + 5/(3 log p)) + (log x + 2)/(√x log p)`, and the
principal case `|Σ_{n < x} Λ(n)(1 − n/x) − x/2| ≤ √x/20 + 3` under `RiemannHypothesis`
(`mcgowntrevinotrudgian2016` lines 70–76), beside that section's conditional results for primes
in progressions. Required location: §6.5.

## How to read the build

Layer 0 fixes the invariants and predicates every later statement mentions: the Minkowski
constant, the local Euler factors, the quadratic Hecke character and relative class number of a
CM-field, the Euler product of an abelian field as continued functions, the conjectural and gap
predicates, and the least primitive roots. Layer 1 is
the one convexity bound for `ζ_K`, an instance of the general bound, and the digamma and trigamma
series with explicit remainders, which bound the gamma terms of `Λ'_K/Λ_K` in Layers 4 and 7.
Layer 2 proves the explicit lattice-point count and the explicit ideal counts; it needs Layers 0 and
1 only. Layer 3 proves the residue bounds that need no zero-free region, from the positive Mellin
comparison, Friedman's regulator bound and, for the conditional bounds, an explicit Duke theorem on
Euler-product records.
Layer 4 proves the explicit zero counts, the real-zero lemmas and the zero-free regions, Stark's
residue lower bound, which needs the one-zero lemma, the consequences of the uniform real-zero gap
for quadratic fields, and zero repulsion. Layer 5 turns the residue bounds into class-number bounds
through the class-number formula, adds Bordellès' elementary bounds, and uses the real-zero lemmas
of 4.3 and 4.9 for the lower bounds of relative class numbers and for the effective Brauer–Siegel
bound. Layer 6 is independent of Layers 1–5 and proves the primitive-root theorems from the sieve
identity and the character-sum inputs. Layer 7 consumes the ideal counts of Layer 2 (Mertens,
Brun–Titchmarsh), the residue (Layer 3) and the zero-free regions, zero counts and repulsion of
Layer 4 (Chebotarev, least prime ideal).

## Layer 0: invariants and predicates

### 0.1 The Minkowski constant and the real Minkowski bound

Define the Minkowski constant `μ_K = (4/π)^{r₂} · n!/nⁿ` and the real Minkowski bound
`b_K = μ_K √d_K`.

- `0 < μ_K ≤ 1`: with `a_n = (4/π)^{n/2} n!/nⁿ`, `μ_K ≤ a_n` since `2r₂ ≤ n` and `4/π > 1`;
  `a_2 = 2/π < 1`, and the ratio `a_{n+1}/a_n = (4/π)^{1/2} (n/(n+1))ⁿ ≤ (4/π)^{1/2}/2 < 1`
  (the factor `(n/(n+1))ⁿ` decreases from `1/2` at `n = 1`), so `a_n ≤ 1` for every `n ≥ 2` by
  induction; at `n = 1`, `r₂ = 0` and `μ_ℚ = 1` (while `a_1 = (4/π)^{1/2} > 1`).
- Every ideal class contains a nonzero integral ideal of norm at most `b_K`: Mathlib's
  `exists_ideal_in_class_of_norm_le`, whose bound `M K` is `b_K` by definition.
- `1 ≤ b_K`: the ideal the previous item gives for the trivial class has norm at least `1`; the
  Minkowski discriminant bound `d_K ≥ n^{2n}/((4/π)^{2r₂}(n!)²)` of `abs_discr_ge'` is the same
  inequality `μ_K √d_K ≥ 1`.
- `b_K` is not Mathlib's `minkowskiBound K 1`, which equals `2^{r₁+r₂} √d_K` by
  `volume_fundamentalDomain_latticeBasis`.

**Checks.**

- `K = ℚ(i)`: `r₂ = 1`, `n = 2`, `μ_K = (4/π)(2/4) = 2/π ≈ 0.6366` and `b_K = (2/π)·2 = 4/π ≈ 1.273`,
  so every class contains an ideal of norm `1` and `h_K = 1`; the value
  `minkowskiBound ℚ(i) 1 = 2^1 · 2 = 4` is a different quantity.
- `K = ℚ(√−14)`: `b_K = (2/π)√56 ≈ 4.764`, which is Mathlib's `M K` of
  `exists_ideal_in_class_of_norm_le` there (`(4/π)¹ · 2!/2² · √56`); `K = ℚ(√5)`: `r₂ = 0`,
  `μ_K = 1/2`, `b_K = √5/2 ≈ 1.118`.
- `K = ℚ`: `μ_ℚ = 1`, `b_ℚ = 1`, and the class group is trivial; a definition with the exponent
  `r₁` in place of `r₂` would give `4/π > 1` here and fail `μ_K ≤ 1`.

*Needs:* Mathlib `exists_ideal_in_class_of_norm_le`, `abs_discr_ge'`, `Ideal.absNorm`,
`volume_fundamentalDomain_latticeBasis`.

### 0.2 Local Euler factors

Define the local factor `Π_K(p)`, for a natural number `p`, as the finite product (Mathlib's
`finprod`) `∏ᶠ 𝔭, (1 − (N𝔭)⁻¹)⁻¹` over the height-one primes `𝔭` of `𝓞 K` containing `p`. For a
prime `p` these are the at most `n` primes above `p`; for `p = 1` there are none and the value is
`1`; for `p = 0` every prime contains `p`, the support is infinite and `finprod` takes its junk
value `1`; for composite `p` the product runs over the primes above every prime factor of `p`.
Every theorem of this roadmap evaluates it at a prime. For a finite set `S` of primes define
`Π_K(S) = ∏_{p ∈ S} Π_K(p)` and `Λ_S = ∏_{p ∈ S} (1 + p^{−1/2})⁴`.

- `1 ≤ Π_K(p)` for every `p`, and `1 ≤ Π_K(S)`, `1 ≤ Λ_S`; both products are `1` at `S = ∅`.
- For a prime `p`: `Π_ℚ(p) = p/(p − 1)`; if `p` is inert in `K`, `Π_K(p) = (1 − p^{−n})⁻¹`; if
  `p` splits completely, `(p/(p−1))ⁿ`; and in general `Π_K(p) ≤ (p/(p−1))ⁿ`, since at most `n`
  primes lie above `p` and each has norm at least `p`.
- `Π_K(p)` is the Euler factor of `ζ_K` at `p` evaluated at `s = 1`: the product over `𝔭 ∣ p` of
  the local factors of LFunctions Layer 3's Euler product.
- `Π_K(2)/2ⁿ ≤ 1`, with equality iff `2` splits completely, and `Π_K(2)/2ⁿ = 1/(2ⁿ − 1)` iff `2`
  is inert (`louboutin2005` lines 50–51).

**Checks.**

- `K = ℚ(i)`: `Π_K(2) = (1 − 1/2)⁻¹ = 2` (one ramified prime of norm `2`),
  `Π_K(5) = (5/4)² = 1.5625` (two primes of norm `5`), `Π_K(3) = 9/8` (one prime of norm `9`); a definition using `p`
  in place of `N𝔭` would give `3/2` at `p = 3`.
- `Λ_{{2}} = (1 + 2^{−1/2})⁴ ≈ 8.4926`, `Λ_∅ = 1`, and for `K = ℚ`, `Π_ℚ({2, 3}) = 2 · 3/2 = 3`.
- Off the primes: `Π_ℚ(6) = 2 · 3/2 = 3`, larger than `(6/5)¹`, so the bound `(p/(p−1))ⁿ` is stated
  for primes only; `Π_K(1) = 1`, while `p/(p−1)` at `p = 1` is `1/0 = 0` in Lean; `Π_K(0) = 1` is
  the `finprod` junk value. No theorem evaluates these.

*Needs:* Mathlib `IsDedekindDomain.HeightOneSpectrum`, `Ideal.absNorm`, `finprod`; LFunctions
Layer 3 (the Euler product).

### 0.3 The coefficient bound and the class-number lemma

The coefficient bound is consumed: for `m ≥ 1` the number `a_K(m)` of integral ideals of `𝓞 K`
of norm exactly `m` is at most `τ_n(m)`, the number of ordered `n`-tuples of positive integers
with product `m` (AnalyticNumberTheoryPartI §2.15a, which proves `0 ≤ a_K(m) ≤ τ_n(m)`, ramified
primes included, by injecting the norm fibre at each prime into compositions of the exponent into
at most `n` parts; `bordelles2002` lines 72–77).

Prove the class-number lemma: for every real `b` such that every ideal class of `K` contains a
nonzero integral ideal of norm at most `b`, `h_K ≤ Σ_{m ≤ b} τ_n(m)` (`bordelles2006` line 61,
Lemma 1.1, in this generality; `bordelles2002` line 79, Lemma 1.1, states the instance at the
Minkowski bound). Call such a `b` *admissible for `K`*. An admissible `b` is at least `1` (the
trivial class), every real above an admissible one is admissible, and `b_K` of 0.1 is admissible
by `exists_ideal_in_class_of_norm_le`, so `h_K ≤ Σ_{m ≤ b_K} τ_n(m)` is the instance at `b = b_K`.
Route: choose in each class an ideal of norm at most `b`; the choice is injective, so `h_K` is at
most the number of nonzero ideals of norm at most `b`, which is at most `Σ_{m ≤ b} τ_n(m)` by the
coefficient bound. The lemma is stated with the divisor sum because the Piltz bounds of Layer 5
apply to it, and for every admissible `b` because those bounds have thresholds (`b ≥ 6`, `13`,
`193`) that `b_K` of a field of small discriminant does not reach.

**Checks.**

- In `ℚ(i)`, the only ideal of norm `4` is `(1 + i)² = (2)` (the ideal `(4) = (2)²` has norm
  `16`), and `τ_2(4) = 3`; the ideals of norm `5` are the two primes above `5`, and `τ_2(5) = 2`,
  with equality; there is no ideal of norm `3`, and `τ_2(3) = 2`.
- `K = ℚ(i)`, `b_K ≈ 1.273`: `Σ_{m ≤ 1} τ_2(m) = 1`, so the lemma gives `h_K ≤ 1`, exact.
  `K = ℚ(√−14)`, `b_K ≈ 4.764`: `1 + 2 + 2 + 3 = 8 ≥ h_K = 4`.
- Admissibility is needed: in `ℚ(√−14)` (class group of order `4`) the smallest norms in the four
  classes are `1, 2, 3, 3`, so `b = 2.9` is not admissible, and the lemma's sum there is
  `τ_2(1) + τ_2(2) = 3 < 4 = h_K`; any `b ≥ 3` is admissible, `b_K ≈ 4.764` among them.
- `K = ℚ`, `n = 1`: `τ_1 = 1`, `b_ℚ = 1` and the bound is `1 = h_ℚ`. The intermediate count
  `#idealsLE K b_K` is sharper than `Σ τ_n` (in `ℚ(√−14)` it is `1 + 1 + 2 + 1 = 5`, the norms
  `1, 2, 3, 3, 4`, against `8`).

Prove the Nicolas–Tenenbaum bound (`bordelles2002` lines 85–91, (1.2), stated there for every
`n ≥ 1` and real `x ≥ 1`, with the remark that it follows by induction): for every natural `n ≥ 1`
and real `x ≥ 1`, `Σ_{m ≤ x} τ_n(m) ≤ (x/(n−1)!)(log x + n − 1)^{n−1}`. Route: induction on `n`,
the case `n = 1` being `⌊x⌋ ≤ x`. From `τ_{n+1} = τ_n ⋆ 1`,
`Σ_{m ≤ x} τ_{n+1}(m) = Σ_{d ≤ x} Σ_{m ≤ x/d} τ_n(m)`, and by induction the inner sum is at most
`f(d) = (x/d)(log(x/d) + n − 1)^{n−1}/(n−1)!`, which is nonnegative and decreasing in `d ∈ [1, x]`;
so the outer sum is at most `f(1) + ∫_1^x f(t) dt = (x/n!)(n y^{n−1} + yⁿ − (n−1)ⁿ)` with
`y = log x + n − 1`, which is at most `(x/n!)(y + 1)ⁿ` since `(y + 1)ⁿ ≥ yⁿ + n y^{n−1}`.

**Checks.**

- `x = 1`: the sum is `1` and the right side is `(n − 1)^{n−1}/(n−1)!`, which is `1` for `n = 1, 2`
  (equality) and `2` for `n = 3`. For `n = 1` the bound is `⌊x⌋ ≤ x`, an equality at every integer;
  at `n = 2`, `x = 10`, `Σ_{m ≤ 10} τ(m) = 27` against `10 (log 10 + 1) = 33.03`.
- Negative control: with `log x + n − 2` in place of `log x + n − 1` (the shape of Bordellès'
  sharper bound of ExplicitMultiplicativeFunctions §7.5, which needs `x ≥ 13`), the right side at
  `n = 2`, `x = 1` is `0 < 1`, so a bound for every `x ≥ 1` needs `n − 1`.
- `n = 2`, `x = √56 = 7.483` (the value used for `ℚ(√−14)` in 5.3): `Σ_{m ≤ 7} τ(m) = 16` against
  `7.483 (log 7.483 + 1) = 22.54`.

*Needs:* 0.1; Mathlib `ArithmeticFunction.zeta`, `Ideal.absNorm`, the factorization of ideals in a
Dedekind domain, `Nat.floor` and the comparison of a monotone sum with an integral;
AnalyticNumberTheoryPartI §2.15a.

### 0.4 The quadratic Hecke character and the relative class number of a CM-field

For `IsCMField K`, define `η_K` as the canonical primitive quadratic Hecke character of the
quadratic extension `K/K⁺` of AnalyticNumberTheoryPartI §2.7, a `PrimitiveRayClassCharacter` of
`K⁺` of LFunctions Layer 5, with `[K⁺:ℚ] = n`.

- `η_K` has order `2` and is nontrivial; `ζ_K(s) = ζ_{K⁺}(s) L(s, η_K)` on `Re s > 1` and as
  germs (§2.7); `L(s, η_K)` is entire (LFunctions Layer 5); `L(1, η_K) = κ_K/κ_{K⁺} > 0` (§2.17a).
- Its conductor has infinite part every real place of `K⁺`, and `d_K = d_{K⁺}² N(𝔣_η)` (the
  conductor–discriminant formula for `K/K⁺`, ClassFieldTheory Layer 13), so the conductor of the
  completed `Λ(s, η_K) = (d_K/d_{K⁺})^{s/2} Γ_ℝ(s+1)ⁿ L(s, η_K)` is `d_K/d_{K⁺}` (§2.22), and its
  root number is `1`, since `Λ_K = Λ_{K⁺} Λ(·, η_K)` and both zeta completions have root number
  `1`.
- `L(σ, η_K)` is real for real `σ`.

**Checks.**

- `K = ℚ(i)`: `η_K` is `χ₋₄` under the dictionary with Dirichlet characters, of conductor `4·∞`,
  `L(1, η_K) = π/4 = κ_{ℚ(i)}/κ_ℚ`, `d_K/d_{K⁺} = 4`.
- `K = ℚ(ζ₈)`, `K⁺ = ℚ(√2)`: `L(s, η_K) = L(s, χ₋₄) L(s, χ₋₈)` by the cyclotomic factorization,
  `d_K/d_{K⁺} = 256/8 = 32`, `L(1, η_K) = (π/4)(π/√8) ≈ 0.8724`.
- `K = ℚ(√2)` is not CM (it is totally real), so no character is attached; a definition that
  accepted any quadratic extension would produce an even character there, against the odd gamma
  factor `Γ_ℝ(s+1)ⁿ`.

Define `relativeClassNumber K : ℕ` as `h_K / h_{K⁺}` (natural-number division) and prove
`classNumber_maximalRealSubfield_dvd`: `h_{K⁺} ∣ h_K` for every CM-field `K` (`washington1997`
Theorem 4.10). Route: let `H` be the Hilbert class field of `K⁺`; it is totally real, since it is
unramified at the real places; `K` is totally complex, so `K ∩ H = K⁺`; the restriction
`Gal(HK/K) → Gal(H/K⁺)` is therefore surjective, and by the norm compatibility of the Artin map it
is the norm map `Cl(K) → Cl(K⁺)` under `gal_hilbertClassField_equiv_classGroup`; a surjection of
finite groups gives the divisibility.

- `relativeClassNumber K · h_{K⁺} = h_K` and `1 ≤ relativeClassNumber K`.
- The relative class-number formula: as real numbers,
  `h⁻_K = Q_K w_K √(d_K/d_{K⁺}) L(1, η_K)/(2π)ⁿ`. Route: divide the two definitions
  `κ_K = (2π)ⁿ R_K h_K/(w_K √d_K)` (`r₁ = 0`, `r₂ = n`) and
  `κ_{K⁺} = 2ⁿ R_{K⁺} h_{K⁺}/(2 √d_{K⁺})` (`r₁ = n`, `r₂ = 0`, `w_{K⁺} = 2` since `K⁺` is totally
  real), use `R_K/R_{K⁺} = 2^{n−1}/Q_K` and `L(1, η_K) = κ_K/κ_{K⁺}`.
- In degree `2n = 2`, `K⁺ = ℚ`, `h⁻_K = h_K`, and the formula is the imaginary quadratic
  class-number formula of ImaginaryQuadraticClassNumber H2.2.
- For abelian CM `K`, `relativeClassNumber K` is the rational ratio `h_K/h_{K⁺}` of
  CyclotomicClassGroupsAndStickelberger §3.4, and so equals its odd-character Bernoulli product
  `Q_K w_K ∏_{χ ∈ X(K) odd} (−B_{1,χ}/2)` there.

**Checks.**

- `K = ℚ(i)`: `Q = 1`, `w = 4`, `√(d_K/d_{K⁺}) = 2`, `L(1, η) = π/4`: `1·4·2·(π/4)/(2π) = 1 = h⁻`.
  `K = ℚ(√−3)`: `w = 6`, `√3`, `L(1, χ₋₃) = π/(3√3)`: `6 √3 π/(3√3 · 2π) = 1`.
- `K = ℚ(√−5)`: `h_K = 2`, `h_{K⁺} = h_ℚ = 1`, `relativeClassNumber K = 2/1 = 2`; the formula
  gives `1·2·√20·L(1, χ₋₂₀)/(2π)` with `L(1, χ₋₂₀) = 2π·2/(2√20)`, that is `2`.
- `K = ℚ(ζ₈)`: `h_K = h_{K⁺} = 1`, `Q = 1`, `w = 8`, `√32 · 0.8724 · 8/(4π²) = 1.000`, consistent
  with the Check above; a formula with `R_K/R_{K⁺} = 2ⁿ/Q` (the wrong power) would give
  `8 · 5.6569 · 0.87236/(2 · 39.478) = 1/2`.
- Natural-number division is only meaningful with the divisibility: for the ratio of two
  arbitrary class numbers `3/2` it would truncate to `1`; for a CM-field the divisibility makes
  `relativeClassNumber K · h_{K⁺} = h_K` exact.

*Needs:* Mathlib `IsCMField`, `maximalRealSubfield`, `indexRealUnits`,
`regulator_div_regulator_eq_two_pow_mul_indexRealUnits_inv`, `dedekindZeta_residue_def`,
`classNumber`; AnalyticNumberTheoryPartI §2.7, §2.17a, §2.22; LFunctions Layer 5; ClassFieldTheory
Layer 13 (`hilbertClassField`, `gal_hilbertClassField_equiv_classGroup`, conductor–discriminant);
`gap:artin-norm-compatibility`; CyclotomicClassGroupsAndStickelberger §3.4 (the abelian
agreement).

### 0.4a The Euler product of an abelian field as continued functions

For an abelian number field `F`, `X(F)` is the primitive character group of
CyclotomicClassGroupsAndStickelberger §3.4: `F` embeds in a cyclotomic field `K` with
`IsCyclotomicExtension {m} ℚ K` (Kronecker–Weber, ClassFieldTheory Layer 13), and `X(F)` is the set
of primitive characters `χ*` (Mathlib's `DirichletCharacter.primitiveCharacter`, of conductor
`f_χ`) of the characters `χ` modulo `m` in
`IsCyclotomicExtension.Rat.intermediateFieldEquivSubgroupChar m K ℂ F`. For `χ ∈ X(F)`, `L(s, χ)` is
Mathlib's `DirichletCharacter.LFunction` of `χ*`: `riemannZeta` for the trivial character, of
conductor `1`, and entire otherwise (`DirichletCharacter.differentiable_LFunction`). That section
proves `ζ_F(s) = ∏_{χ ∈ X(F)} L(s, χ)` on `Re s > 1` and `κ_F = ∏_{1 ≠ χ ∈ X(F)} L(1, χ)`; this
section owns only the passage to the continued functions, which 4.3's character arguments and 5.6
need off the half-plane of convergence.

Prove the Euler product of continued functions: for every `s ≠ 1`,
`dedekindZetaC F s = ∏_{χ ∈ X(F)} L(s, χ)`, and the two sides agree as germs at `s = 1`. Route:
both sides are analytic on the connected set `ℂ ∖ {1}` (LFunctions Layer 3 for `dedekindZetaC`,
Mathlib for the factors) and agree on `Re s > 1` (CyclotomicClassGroupsAndStickelberger §3.4, with
the agreement of `dedekindZetaC` and `dedekindZeta` there), so they agree on `ℂ ∖ {1}` by uniqueness
of meromorphic continuation (`TauCeti.eventuallyEq_of_meromorphic_of_eqOn_halfPlane`, as in
LFunctions Layer 4, whose `dedekindZetaC_quadratic` and `dedekindZetaC_cyclotomic` are the
quadratic and full cyclotomic cases).

- Orders of zeros add: for every `s ≠ 1`, the order of `ζ_F` at `s` is the sum over `χ ∈ X(F)` of
  the orders of `L(·, χ)`; since `ζ` has no zero in `(0, 1)`, a real zero `β ∈ (0, 1)` of `ζ_F` is a
  zero of `L(s, χ)` for some nontrivial `χ ∈ X(F)`.
- Parity: complex conjugation corresponds to `−1` under `IsCyclotomicExtension.Rat.galEquivZMod`,
  so for totally real `F` every `χ ∈ X(F)` is even, and a real zero of `ζ_F` in `(0, 1)` is a zero
  of an even primitive `L(s, χ)`.

**Checks.**

- `F = ℚ(√5)` (`m = 5`): `X(F) = {1, χ₅}`, and at `s = 0`, `ζ(0) L(0, χ₅) = (−1/2) · 0 = 0`, the
  simple zero of `ζ_F` of order `r₁ + r₂ − 1 = 1`; the even character `χ₅` carries the trivial zero.
- `F = ℚ(i)` (`m = 4`): `ζ(0) L(0, χ₋₄) = (−1/2)(1/2) = −1/4 = −h/w`, the value `ζ_F(0)` of 2.7.
  Embedded in `ℚ(ζ₈)` (`m = 8`), `F` has the trivial character and the one induced by `χ₋₄`
  modulo `8`; without passing to primitive characters their product would be
  `(1 − 2^{−s}) ζ(s) L(s, χ₋₄)`, which vanishes at `s = 2πi/log 2`, where `ζ_F = ζ L(·, χ₋₄)` has
  no zero (neither factor vanishes on `Re s = 0`).
- `F = ℚ(ζ₇)⁺` (`m = 7`): `X(F) = {1, χ, χ̄}` with `χ` cubic of conductor `7`, and a real zero of
  `ζ_F` in `(0, 1)` would be a zero of both `L(s, χ)` and `L(s, χ̄)` (the values are conjugate),
  hence of even order, as 4.3's corollary allows.
- At `s = 1` the identity is not asserted pointwise: `dedekindZetaC F 1 = 0` by the normal-form
  convention, while the right side is `riemannZeta 1 · κ_F = ((γ − log 4π)/2) κ_F ≠ 0`.

*Needs:* CyclotomicClassGroupsAndStickelberger §3.4; ClassFieldTheory Layer 13 (`kroneckerWeber`);
LFunctions Layers 3 and 4; Tau Ceti `TauCeti.eventuallyEq_of_meromorphic_of_eqOn_halfPlane`;
Mathlib `IsCyclotomicExtension.Rat.intermediateFieldEquivSubgroupChar`,
`IsCyclotomicExtension.Rat.galEquivZMod`, `DirichletCharacter.primitiveCharacter`,
`DirichletCharacter.LFunction`, `DirichletCharacter.differentiable_LFunction`, `riemannZeta`.

### 0.5 Conjectural predicates, gap predicates and the normal-tower predicate

Define *DedekindConjecture* `K` as: there is an entire function `F : ℂ → ℂ` with
`F s · riemannZeta s = dedekindZetaC K s` for every `s ≠ 1` with `riemannZeta s ≠ 0`.

- `F` is unique: it is determined on the complement of the discrete set `{1} ∪ ζ⁻¹(0)` and is
  continuous; `F(1) = κ_K`; `F` has no zeros where `ζ_K` has none.
- *DedekindConjecture* `ℚ` holds with `F = 1`.
- For `[IsGalois ℚ K]`, *DedekindConjecture* `K` holds, by the Aramata entire quotient of
  AnalyticNumberTheoryPartI §2.39b at `E = ℚ`, with `dedekindZetaC ℚ = riemannZeta` as germs
  (LFunctions Layer 3).

**Checks.**

- `K = ℚ(i)`: `F = L(·, χ₋₄)`, entire by Mathlib; `K = ℚ(√2)`: `F = L(·, χ₈)`.
- A definition demanding `F s · ζ(s) = ζ_K(s)` for every `s` is false at `s = 1`, where
  `dedekindZetaC K 1 = 0` by the normal-form convention while `F 1 · ζ(1) = κ_K · ζ(1)` and
  `riemannZeta 1 = (γ − log 4π)/2 ≈ −0.977 ≠ 0`.
- A non-Galois cubic field with Galois closure of group `S₃` satisfies the predicate (its `F` is
  the Artin L-function of the two-dimensional representation, entire since `S₃` is solvable), but
  the Galois case above does not apply to it; no theorem here proves that case.

Define *CMPositivity* `K`, for `IsCMField K`, as `∀ σ ∈ Ioo 0 1, 0 ≤ Re L(σ, η_K)` (the value is
real by 0.4, so this is `0 ≤ ζ_K(σ)/ζ_{K⁺}(σ)` wherever `ζ_{K⁺}(σ) ≠ 0`).

- It is equivalent to `0 ≤ ζ_K(σ) ζ_{K⁺}(σ)` for every `σ ∈ (0, 1)`:
  `L(σ, η_K) ζ_{K⁺}(σ)² = ζ_K(σ) ζ_{K⁺}(σ)`, both sides are continuous on `(0, 1)`, and the zeros of `ζ_{K⁺}` there are
  isolated.
- It holds for every imaginary quadratic `K` with `L(σ, χ_K) > 0` on `(0, 1)`.

**Checks.**

- `K = ℚ(√−3)`: `L(σ, χ₋₃) = Σ_k ((3k+1)^{−σ} − (3k+2)^{−σ}) > 0` termwise for `σ > 0`, so the
  predicate holds. `K = ℚ(i)`: the alternating series `Σ (−1)^k (2k+1)^{−σ}` with decreasing
  terms is positive, so it holds.
- Louboutin's examples: dihedral and quaternion CM-fields of degree at least `8` satisfy it
  (`louboutin2003` line 369); nothing here proves this.
- The closed interval would evaluate `L(0, η_K)` and `L(1, η_K)`; both are finite and positive for
  the CM character (`L(0, η_K) ≠ 0` by the functional equation with odd gamma factors), so the
  open interval is a choice of convention, not a correction.

Define `GRHMod q`, for `q ≥ 1`, as `DirichletGRH χ` (AnalyticNumberTheoryPartI §1.6) for every
Dirichlet character `χ` modulo `q`: every zero `s` of `DirichletCharacter.LFunction χ` with
`Re s > 0`, other than the pole value `s = 1` of the principal character, has `Re s = 1/2`.

- `GRHMod 1 ↔ RiemannHypothesis`; `GRHMod q → RiemannHypothesis` for every `q ≥ 1` through the
  principal character and primitive induction (§1.6); `GRH → GRHMod q`.
- `GRHMod q` holds iff `DedekindERH ℚ(ζ_q)`: one direction is the abelian case of §2.42 (GRH for
  the primitive characters of an abelian field gives its `DedekindERH`), the other the cyclotomic
  factorization `ζ_{ℚ(ζ_q)} = ∏ L(s, χ*)` over the primitive characters
  inducing the characters modulo `q` (LFunctions Layer 4), whose factors are entire except `ζ`.

**Checks.**

- `q = 2`: the principal character has `L(s) = (1 − 2^{−s}) ζ(s)` with zeros on `Re s = 0`, which
  the strict inequality leaves unconstrained, so `GRHMod 2 ↔ RiemannHypothesis`.
- `q = 4`: `GRHMod 4` is `RiemannHypothesis ∧ DirichletGRH χ₋₄`, which is `DedekindERH ℚ(i)`
  (AnalyticNumberTheoryPartI §2.42).
- A definition over primitive characters only would be equivalent, by primitive induction; a
  definition over `Re s ≥ 0` would be false for `q = 2`, and one without the exception at the pole
  of the principal character would constrain the junk value `LFunction 1 1`.

Define *QuadraticRealZeroGap* `c`, for a real `c > 0`, as: for every quadratic number field `F`
(`finrank ℚ F = 2`) and every real `β ∈ (0, 1)` with `ζ_F(β) = 0`, `β ≤ 1 − 1/(c √d_F)`; and
*ImaginaryQuadraticRealZeroGap* `c` in the same way, with `F` ranging over the imaginary
quadratic fields only.

- Monotone in `c`: *QuadraticRealZeroGap* `c` implies *QuadraticRealZeroGap* `c'` for `c ≤ c'`,
  and the same for the imaginary predicate; and *QuadraticRealZeroGap* `c` implies
  *ImaginaryQuadraticRealZeroGap* `c`.
- For a quadratic `F`, `ζ_F = ζ · L(s, χ_F)` with `χ_F` primitive real of conductor `d_F`
  (LFunctions Layer 4 `dedekindZetaC_quadratic`) and `ζ < 0` on `(0, 1)`, so the zeros in
  question are the real zeros of `L(s, χ_F)`, and both predicates are statements about Mathlib's
  `DirichletCharacter.LFunction`.
- *ImaginaryQuadraticRealZeroGap* `(π/6)` is the statement `L(s, χ_F) ≠ 0` for
  `1 − 6/(π √d_F) ≤ s < 1` that `louboutin2003` lines 359–360 (Lemma 8(5)) quote from an
  unpublished source; *QuadraticRealZeroGap* `c₈` is Stark's hypothesis in `garcialee2022mertens`
  lines 1239–1243, where Stark's quadratic subfield may be real. Neither is proved here: every
  theorem that needs one carries it as a hypothesis, and 5.6 needs only the imaginary one.

**Checks.**

- `F = ℚ(i)`, `c = π/6`: the imaginary predicate asserts no zero of `L(s, χ₋₄)` in
  `[1 − 3/π, 1) ≈ [0.045, 1)`, true since the alternating series is positive on `(0, 1)`;
  `F = ℚ(√−3)`, `c = π/6`: the interval `[1 − 6/(π√3), 1)` starts at `−0.103`, the predicate
  looks only at `β ∈ (0, 1)`, and `L(σ, χ₋₃) > 0` there termwise.
- For `d_F > 3·10⁸` the imaginary instance at `c = 1/6.035` is ExplicitZetaBounds §7.7; at
  `c = π/6 > 1/6.035` it follows there, so *ImaginaryQuadraticRealZeroGap* `(π/6)` only carries
  weight for `d_F ≤ 3·10⁸`. It says nothing about real quadratic fields: for `F = ℚ(√5)` the
  all-quadratic predicate asks in addition that `L(s, χ₅)` have no zero in `[1 − 1/(c√5), 1)`.
- The predicate at `c` tending to `0` would say `β ≤ 1 − ∞`, impossible if a zero exists; it is a
  hypothesis, not a theorem, and no `c` is asserted.

Define *UniformQuadraticZeroGap* `c`, for a real `c > 0`, as: for every quadratic number field `F`
and every real `β ∈ (0, 1)` with `ζ_F(β) = 0`, `(1 − β) log d_F ≥ c`. It is the logarithmic form
of the gap, in which `log d_F` replaces `√d_F`; 4.9 discharges it at `c = 1/100` and, under a
named computation, at `c = 3/1000`, from unrefereed sources (Conventions).

- *UniformQuadraticZeroGap* `c` holds iff ExplicitPrimeCounting §1.7's *RealZeroGap* `c ∞` holds:
  `F ↦ χ_F` is a bijection from the quadratic fields to the primitive real characters of conductor
  `q ≥ 3`, with `q = d_F` (AnalyticNumberTheoryPartI §0.34a), and the real zeros in `(0, 1)` of
  `ζ_F` and of `L(s, χ_F)` agree.
- Antitone in `c`: *UniformQuadraticZeroGap* `c` implies *UniformQuadraticZeroGap* `c'` for
  `c' ≤ c`.
- *UniformQuadraticZeroGap* `c` implies *QuadraticRealZeroGap* `(2/(e c))`, since
  `√d/log d ≥ e/2` for every real `d > 1` (the minimum is at `d = e²`), so
  `c/log d_F ≥ e c/(2√d_F)`.
- If *UniformQuadraticZeroGap* `c` and `c' > 0`, then every imaginary quadratic `F` with
  `√d_F/log d_F ≥ 1/(c c')` satisfies the condition of *ImaginaryQuadraticRealZeroGap* `c'` at `F`.

**Checks.**

- `c = 1/100`: the implied Siegel-shape gap is *QuadraticRealZeroGap* `(200/e)`, `200/e = 73.576`,
  and the condition of *ImaginaryQuadraticRealZeroGap* `(π/6)` holds at every imaginary quadratic
  `F` with `d_F ≥ 10⁷`, since `√d/log d ≥ 6/(0.01π) = 190.99` there (`196.19` at `d = 10⁷`, while
  `9·10⁶` gives `187.35` and fails).
- `F = ℚ(√5)` and `F = ℚ(√−3)`: `L(σ, χ)` has no zero in `(0, 1)` and the condition at `F` is
  vacuous for every `c`.
- A definition with `(1 − β) √d_F ≥ c` is *QuadraticRealZeroGap* `(1/c)` and is weaker for large
  `d_F`; one with `log d_F` replaced by `log(d_F)/2` or by the logarithm of the conductor of a
  non-primitive character changes `c` and does not match the sources, which use the conductor
  `q = d_F` of the primitive character `χ_F`.

Define `HasNormalTower K` as: there is a chain `ℚ = K₀ ≤ K₁ ≤ ⋯ ≤ K_r = K` of intermediate fields
with each `K_{i+1}/K_i` Galois (in Lean, `IsGalois K_i (IntermediateField.extendScalars h_i)` for
the inclusions `h_i`). Garcia–Lee's tower factor is `t_K = 1` if `HasNormalTower K` and `t_K = n!`
otherwise.

- A Galois field has a normal tower of length one, and every chain of subfields with quadratic
  steps is a normal tower; `ℚ` has the tower of length zero.
- A field of prime degree with no normal tower is exactly a non-Galois field of prime degree, its
  only subfields being `ℚ` and itself.

**Checks.**

- `ℚ(ζ₈)` has a normal tower (it is Galois); `ℚ(2^{1/4})` has the tower `ℚ ⊂ ℚ(√2) ⊂ ℚ(2^{1/4})`
  of quadratic, hence Galois, steps; a non-Galois cubic field has no normal tower.
- `ℚ` has the empty tower (`r = 0`, `K₀ = ⊥ = ⊤`).
- The quartic field `ℚ(α)`, `α⁴ − α − 1 = 0`, has no normal tower: the polynomial is irreducible
  (it is irreducible modulo `2`), its discriminant `−283` is not a square and its resolvent cubic
  `x³ + 4x − 1` has no rational root, so the Galois group of the normal closure is `S₄`; the
  stabiliser `S₃` of a root is maximal, so there is no intermediate field, and the field is not
  Galois. A definition by "degree a power of `2`" would accept it, and one by "has a quadratic
  subfield" would reject the cyclic cubic field `ℚ(ζ₇)⁺`, which is Galois.

*Needs:* Mathlib `riemannZeta`, `Differentiable`, `DirichletCharacter.LFunction`, `IsGalois`,
`IntermediateField.extendScalars`, `RiemannHypothesis`; LFunctions Layers 3 and 4;
AnalyticNumberTheoryPartI §§0.34a, 1.6, 2.39b, 2.42; ExplicitPrimeCounting §1.7; 0.4.

### 0.6 The least primitive roots

Define the least primitive root `g(m) = sInf {g : ℕ | orderOf (g : ZMod m) = Nat.totient m}` and
`leastPrimePrimitiveRoot m = sInf {g : ℕ | g.Prime ∧ orderOf (g : ZMod m) = Nat.totient m}`,
written `ĝ(m)`. The least primitive root modulo `p²` is Tau Ceti's `TauCeti.conreyGenerator p`
(`TauCeti/NumberTheory/DirichletCharacter/Conrey.lean`: the least natural `g` with
`orderOf (g : ZMod (p ^ 2)) = (p ^ 2).totient`, and `0` if there is none), written `h(p)`; it
equals `g(p²)` for every `p`, the two being the least element of the same set with the same junk
value, and is not redefined here.

- For `m ≥ 2` with `(ZMod m)ˣ` cyclic, both sets are nonempty: a generator of `(ZMod m)ˣ` lifts
  to some `g ∈ [1, m−1]`, and Dirichlet's theorem on primes in progressions gives a prime
  representative; so `1 ≤ g(m) < m` and `ĝ(m) ≥ 2`. For a prime `p` the units are cyclic by
  `ZMod.isCyclic_units_prime`, and for `p²` with `p` odd by `ZMod.isCyclic_units_of_prime_pow`.
- `g(m) ≤ ĝ(m)`; `g(p) ≤ h(p)` for odd `p`, since a primitive root modulo `p²` reduces to one
  modulo `p`; and `h(p) ≤ g(p) + p`, since of `g, g + p, …, g + (p−1)p` exactly one fails to be a
  primitive root modulo `p²` (`kerrmcgowntrudgian2020` lines 37–39).
- For an odd prime `p`, `h(p)` is a primitive root modulo every power of `p` (Tau Ceti's
  `TauCeti.orderOf_conreyGenerator`) and lies below every primitive root modulo `p²`
  (`TauCeti.conreyGenerator_le`).
- `orderOf (g : ZMod m) = totient m` iff `g` is coprime to `m` and its unit generates `(ZMod m)ˣ`.

**Checks.**

- `g(2) = 1`, `g(3) = 2`, `g(7) = 3`, `g(409) = 21`, `ĝ(7) = 3`, `ĝ(409) = 29`: the least
  primitive root `21 = 3 · 7` of `409` is composite, and the primes `2, 3, …, 23` are not
  primitive roots modulo `409`, so `ĝ(409) > g(409)`.
- `h(3) = 2` (`2` has order `6` modulo `9`; Tau Ceti's `TauCeti.conreyGenerator_three`),
  `h(5) = 2` (`2^{10} ≡ 24 (mod 25)`, `2^4 = 16`), and
  `h(2) = 3`, the least generator of `(ℤ/4)ˣ`, so `h(2) = 3 > 2^{0.99}`: the bound of 6.5 cannot
  hold at `p = 2`. Likewise `ĝ(2) = 3`, the least odd prime, while `g(2) = 1`.
- `0` never belongs to either set for `m ≥ 2` (its order is `0 ≠ φ(m)`), while for `m = 1` every
  `g` has order `1 = φ(1)`, so `g(1) = 0` and `ĝ(1) = 2` are junk; no theorem evaluates `m ≤ 1`.

*Needs:* Mathlib `orderOf`, `Nat.totient`, `ZMod.isCyclic_units_prime`,
`ZMod.isCyclic_units_of_prime_pow`, `Nat.infinite_setOfPred_prime_and_eq_mod`; Tau Ceti
`TauCeti.conreyGenerator`.

### Examples

- `ℚ(i)`: `μ_K = 2/π`, `b_K = 4/π`, `Π_K(2) = 2`, `η_K = χ₋₄`, `h⁻ = 1`, *DedekindConjecture* with
  `F = L(·, χ₋₄)`, *CMPositivity*.
- `ℚ(ζ₈)`: `h⁻ = 1`, `L(1, η) ≈ 0.8724`, `Q = 1`.
- `ℚ(√5)`: `ζ_F = ζ · L(·, χ₅)` as continued functions, with the zero of `ζ_F` at `0` carried by
  `L(0, χ₅) = 0`.
- `p = 7`: `g = 3`, `h = 3`, `ĝ = 3`.

### Dependencies

Mathlib number-field, CM-field, cyclotomic Galois, Dirichlet L-function and `ZMod` API; Tau Ceti
uniqueness of meromorphic continuation and `conreyGenerator`; LFunctions Layers 3, 4 and 5;
AnalyticNumberTheoryPartI §§0.34a, 1.6, 2.7, 2.15a, 2.17a, 2.22, 2.39b, 2.42; ClassFieldTheory
Layer 13; CyclotomicClassGroupsAndStickelberger §3.4; ExplicitPrimeCounting §1.7;
ExplicitZetaBounds §7.7 (a Check of 0.5); `gap:artin-norm-compatibility`.

## Layer 1: the size of `ζ_K` and the digamma remainders

### 1.1 Rademacher's convexity bound

Prove Rademacher's bound for `ζ_K`: for `0 < η ≤ 1/2`, `s = σ + it` with `−η ≤ σ ≤ 1 + η` and
`s ≠ 1`,
`|ζ_K(s)| ≤ 3 |(1+s)/(1−s)| (d_K (|1+s|/(2π))ⁿ)^{(1+η−σ)/2} ζ(1+η)ⁿ`
(`rademacher1959`, Theorem 4; restated at `lee2023ideals` lines 173–179 as Theorem 2.2, and at
`sunley1973` line 105). It is the instance of ExplicitZetaBounds §3.2 at `dedekindZetaData K`,
which has degree `n`, conductor `d_K`, root number `1`, gamma shifts `0` (with multiplicity
`r₁ + r₂`) and `1` (with multiplicity `r₂`), a simple pole at `1`, finite order
(ZerosOfLFunctions 3.1), and coefficients `0 ≤ a_K(k) ≤ τ_n(k)` (AnalyticNumberTheoryPartI §2.15a,
recalled in 0.3), so that `Σ_k a_K(k) k^{−σ} = ζ_K(σ) ≤ ζ(σ)ⁿ` for real `σ > 1`, the majorant of
that section; nothing of Phragmén–Lindelöf is redone here.

**Checks.**

- `K = ℚ`, `η = 1/2`, `s = 1/2`: the right side is `3 · 3 · (3/(4π))^{1/2} ζ(3/2) ≈ 11.49` and
  `|ζ(1/2)| ≈ 1.460`.
- `K = ℚ`, `s = 1 + η` real: the right side is `3(2+η)/η · ζ(1+η) ≥ ζ(1+η) = |ζ(1+η)|`, with the
  pole factor accounting for the blow-up as `η → 0`.
- `K = ℚ(i)`, `s = 1/2 + 10i`, `η = 1/2`: `(4 (|1.5 + 10i|/(2π))²)^{1/2} ≈ 2 · 1.609 = 3.22`, so
  the bound is `3 · (|1.5+10i|/|0.5−10i|) · 3.22 · ζ(3/2)² ≈ 3 · 1.010 · 3.22 · 6.82 ≈ 66.5`;
  a statement with `d_K |1+s|/(2π)` without the `n`-th power on the height would give
  `(4·1.609)^{1/2} = 2.54` instead of `3.22` and is not Rademacher's.
- Negative control for the general bound: the record of `10 ζ` (coefficients `10`, degree `1`,
  conductor `1`, root number `1`, a simple pole at `1`) has a nonnegative coefficient majorant
  `Σ_k 10 k^{−σ} = 10 ζ(σ)`, but not one by `ζ(σ)`; at `s = 1/2`, `η = 1/2` its value
  `|10 ζ(1/2)| = 14.60` exceeds the bound `9 (1.5/(2π))^{1/2} ζ(3/2) = 11.49`. The majorant
  `Σ_k |a(k)| k^{−σ} ≤ ζ(σ)^m` of ExplicitZetaBounds §3.2 is what excludes it.

*Needs:* ExplicitZetaBounds §3.2; LFunctions Layer 3 `dedekindZetaData`; ZerosOfLFunctions
Layer 2 (`arithmeticConductor (dedekindZetaData K) = d_K`) and 3.1 (finite order); 0.3.

### 1.1a The digamma and trigamma remainders

Write `ψ` for Mathlib's `Complex.digamma = logDeriv Gamma`, `ψ'` for its complex derivative and `γ`
for `Real.eulerMascheroniConstant`. For `z ∈ ℂ` with `Re z > 0`, an integer `N ≥ 1` and
`a = min(1, Re z)`, put `D_N(z) = −γ + Σ_{0 ≤ n < N} (1/(n + 1) − 1/(n + z))` and
`T_N(z) = Σ_{0 ≤ n < N} 1/(n + z)²`. Every `n + z` is nonzero, its real part being positive, and
`N − 1 + a ≥ a > 0`.

Prove the series identities (`dlmf` 5.7.6 and 5.15.1): for `Re z > 0`,
`ψ(z) = −γ + Σ_{n ≥ 0} (1/(n + 1) − 1/(n + z))` and `ψ'(z) = Σ_{n ≥ 0} 1/(n + z)²`, both series
converging absolutely and uniformly on every set `{Re z ≥ a₀, |z| ≤ R}` with `a₀ > 0`.

Prove `digamma_series_remainder` and `trigamma_series_remainder`: for `Re z > 0` and `N ≥ 1`,
`|ψ(z) − D_N(z)| ≤ |z − 1|/(N − 1 + a)` and `|ψ'(z) − T_N(z)| ≤ 1/(N − 1 + a)`.

- Uniformity: for `a₀ > 0` and `C ≥ 0`, on `{Re z ≥ a₀, |z − 1| ≤ C}` both bounds hold with `a`
  replaced by `min(1, a₀)`, so both remainders tend to `0` uniformly there as `N → ∞`.
- At `z = 1`, `D_N(1) = −γ` for every `N` and the digamma bound is `0`, in agreement with Mathlib's
  `Complex.digamma_one`.
- `ψ` is real on `(0, ∞)` and `ψ'(x) > 0` there, so `ψ` increases on `(0, ∞)`; with `ψ(1) = −γ`
  and `ψ(2) = 1 − γ` (`Complex.digamma_one`, `Complex.digamma_nat_add_one`) this gives
  `ψ(σ/2) < log π` and `ψ(σ) < log 2π` for `0 < σ ≤ 2`, the signs of the gamma terms in 4.3.
- Off `Re z > 0` and away from the poles, Mathlib's recurrence `Complex.digamma_apply_add_nat` and
  reflection formula `Complex.digamma_one_sub` reduce `ψ` to its values on `Re z > 0`.

Route. First on `(0, ∞)`: for `x > 0`, Mathlib's Bohr–Mollerup limit
`Real.BohrMollerup.tendsto_log_gamma` gives
`logGammaSeq x n = x log n + log n! − Σ_{m ≤ n} log(x + m) → log Γ(x)`. Its `x`-derivative
`log n − Σ_{m ≤ n} 1/(x + m)` equals
`−(H_n − log n) + Σ_{m < n} (1/(m + 1) − 1/(m + x)) − 1/(x + n)`, which converges to the series
uniformly on compact subsets of `(0, ∞)`, by `Real.tendsto_harmonic_sub_log` and the term bound
below. So `hasDerivAt_of_tendstoLocallyUniformlyOn` makes the series the derivative of `log ∘ Γ`
at `x`, which is `Γ'(x)/Γ(x)` since `Γ(x) > 0`, and `Complex.Gamma_ofReal` with
`HasDerivAt.real_of_complex` identifies it with `ψ(x)`. Both sides are holomorphic on `Re z > 0`:
`ψ` because `Γ` is holomorphic and nonzero there (`Complex.differentiableAt_Gamma`,
`Complex.Gamma_ne_zero`), and the series by `Complex.differentiableOn_tsum_of_summable_norm` on
each open set `{Re z > a₀, |z| < R}`, where its terms `(z − 1)/((n + 1)(n + z))` are at most
`(R + 1)/(n + min(1, a₀))²`. The half-plane is connected and contains `(0, ∞)`, so the identity
theorem (`AnalyticOnNhd.eqOn_of_preconnected_of_frequently_eq`) gives the series for `ψ`, and
`Complex.hasSum_deriv_of_summable_norm` differentiates it termwise. The two remainders are the
tails `Σ_{n ≥ N} (z − 1)/((n + 1)(n + z))` and `Σ_{n ≥ N} 1/(n + z)²`. Since `a ≤ 1`,
`|n + 1| ≥ n + a`; and `|n + z| ≥ n + Re z ≥ n + a`; so the terms are at most `|z − 1|/(n + a)²`
and `1/(n + a)²`. For `n ≥ 1`, `1/(n + a)² ≤ 1/((n − 1 + a)(n + a)) = 1/(n − 1 + a) − 1/(n + a)`,
which telescopes to `Σ_{n ≥ N} 1/(n + a)² ≤ 1/(N − 1 + a)`.

**Checks.**

- `z = 3`, `N = 1`: `ψ(3) = 3/2 − γ` and `D_1(3) = 2/3 − γ`, a remainder `5/6` within the bound
  `|3 − 1|/1 = 2`; with `a = Re z` in place of `min(1, Re z)` the bound would be `2/3 < 5/6`, so the
  cap at `1` is needed.
- `z = 1 + i`, `N = 1`: `ψ(1 + i) = 0.09465 + 1.07667i` and `D_1(1 + i) = 1/2 − γ + i/2`, a
  remainder `|0.17187 + 0.57667i| = 0.6017` within `|i|/1 = 1`.
- Trigamma: `z = 1`, `N = 1`: `ψ'(1) − T_1(1) = π²/6 − 1 = 0.6449 ≤ 1`; at `z = 0.999`, `N = 50`
  the remainder is `0.01980` against `1/49.999 = 0.02000`, so the constant `1` cannot be lowered
  much; at `z = 0.1`, `N = 1` it is `1.4333` against `1/0.1 = 10`.

*Needs:* Mathlib `Complex.digamma`, `Complex.digamma_one`, `Complex.digamma_nat_add_one`,
`Complex.digamma_apply_add_nat`, `Complex.digamma_one_sub`, `Real.BohrMollerup.tendsto_log_gamma`,
`Real.tendsto_harmonic_sub_log`, `hasDerivAt_of_tendstoLocallyUniformlyOn`,
`HasDerivAt.real_of_complex`, `Complex.Gamma_ofReal`, `Complex.differentiableAt_Gamma`,
`Complex.Gamma_ne_zero`, `Complex.differentiableOn_tsum_of_summable_norm`,
`Complex.hasSum_deriv_of_summable_norm`, `AnalyticOnNhd.eqOn_of_preconnected_of_frequently_eq`.

### Examples

- `K = ℚ` recovers the pole-factor form of Rademacher's Theorem 3 at `q = 1`.
- `z = 2`, `N = 1`: `ψ(2) = 1 − γ` and `D_1(2) = 1/2 − γ`, a remainder `1/2` against the bound `1`.

### Dependencies

ExplicitZetaBounds §3.2; LFunctions Layer 3; ZerosOfLFunctions Layers 2 and 3; Layer 0; Mathlib's
digamma and Bohr–Mollerup API (1.1a).

## Layer 2: counting ideals

### 2.1 The explicit Lipschitz lattice-point count

Prove Widmer's explicit Lipschitz count (`widmer2010` lines 771–776, Theorem 5.4): let `Λ` be a
full lattice in `ℝ^D` with successive minima `λ₁ ≤ … ≤ λ_D` (Tau Ceti's
`ZLattice.successiveMin Λ B (i − 1)` for the closed unit ball `B`, indexed from `0` there), and
let `S ⊆ ℝ^D` be bounded with `∂S` covered by `M` maps `[0,1]^{D−1} → ℝ^D` that are Lipschitz with
constant `L`. Then `S` is measurable and
`| #(S ∩ Λ) − vol(S)/covol(Λ) | ≤ D^{3D²/2} M max_{0 ≤ i < D} L^i/(λ₁⋯λ_i)`,
the term at `i = 0` being `1`. The same bound holds for every translate `S ∩ (v + Λ)`
(`debaene2019` lines 213–215). Route: Widmer's proof through a basis of minimal orthogonality
defect, Tau Ceti's cell count `abs_ncard_inter_mul_sub_measureReal_le` for the boundary term, and
Minkowski's second theorem for the defect bound `Ω ≤ D^{3D/2}/(2π)^{D/2}`. Tau Ceti's
`exists_abs_ncard_smul_inter_vadd_sub_le` is the same statement with an existential constant.

**Checks.**

- `D = 1`, `Λ = ℤ`, `S = [0, X]`: `∂S` is two points (`M = 2`, `L = 0`), `λ₁ = 1`, and
  `|⌊X⌋ + 1 − X| ≤ 1 ≤ 1 · 2 · 1`.
- `D = 2`, `Λ = ℤ²`, `S` the disc of radius `R` (`M = 1`, `L = 2πR`): the bound is
  `2^6 · max(1, 2πR) = 128πR` for `R ≥ 1`, while the true error is `O(R^{2/3})`; the bound is an
  upper estimate, not an asymptotic.
- `Λ = ℤ × 10⁻³ℤ`, `λ₁ = 10⁻³`: the `i = 1` term is `L/10⁻³`, a thousand times larger than for
  `ℤ²`; a statement without the successive minima (with `max L^i` alone) is false for such thin
  lattices, which is why Debaene's and Gun–Ramaré–Sivaraman's proofs need them.

*Needs:* Tau Ceti `ZLattice.successiveMin`,
`ZLattice.prod_successiveMin_mul_measure_le_two_pow_mul_covolume`,
`abs_ncard_inter_mul_sub_measureReal_le`, `IsLipschitzParametrizable`; Mathlib `ZLattice.covolume`.

### 2.2 Sunley's explicit ideal count

Prove `idealCount_sunley` (`sunley1973` lines 110–112, Theorem 1.1(1); restated at `lee2023ideals`
lines 39–41): for `n ≥ 2` and real `x > 0`,
`| #idealsLE K x − κ_K x | ≤ e^{28.2n+5} (n+1)^{5(n+1)/2} d_K^{1/(n+1)} (log d_K)ⁿ x^{(n−1)/(n+1)}`.
Route (Landau's contour method made explicit): the iterated Perron identity of ExplicitZetaBounds
§6.1a with `j = n` writes the `n`-fold iterated integral of `#idealsLE K` as a contour integral of
`ζ_K(s) x^{s+n}/(s(s+1)⋯(s+n))` on `Re s = c > 1`; the contour is moved to `Re s = −η` with
`0 < η ≤ 1/2`, crossing the poles at `s = 1` (residue `κ_K x^{n+1}/(n+1)!`) and `s = 0` (residue
`ζ_K(0) x^n/n!`, nonzero for `n ≥ 2` only when `K` is imaginary quadratic, `lee2023ideals` lines
136–171); Rademacher's bound of 1.1 on the new line, the functional equation and the explicit
Stirling bounds for the gamma quotients bound the remaining integral; and the `n`-fold integration
is undone at the end by an `n`-th finite difference of step `y`, with the monotonicity of
`#idealsLE K` and an optimised `y`. The source counts the ideals of norm below `x`; the count up to
`x` inclusive satisfies the same non-strict bound, by passing to the limit from the right, the right
side being continuous in `x`.

**Checks.**

- `n = 1` is excluded: `#idealsLE ℚ x = ⌊x⌋` and `|⌊x⌋ − x| < 1`, which no term of the right side
  dominates at `x < 1`.
- `K = ℚ(i)`, `x = 10`: the number of ideals of norm `m` is `Σ_{d ∣ m} χ₋₄(d) = r_2(m)/4`, which is
  `1, 1, 0, 1, 2, 0, 0, 1, 1, 2` for `m = 1, …, 10`, so `#idealsLE = 9`, against
  `κ_K x = 10π/4 ≈ 7.854` (error `1.146`); the right side exceeds `e^{61.4}`.
- For `0 < x < 1` the left side is `κ_K x < κ_K ≤ (e log d_K/(2n−2))^{n−1}`, which the right side
  dominates since `x^{(n−1)/(n+1)} ≥ x`; at `x = 0` both sides are `0`, which is why the statement
  is for `x > 0` with a non-strict inequality.

*Needs:* 1.1; ExplicitZetaBounds §§2.1, 2.5, 6.1a; LFunctions Layer 3 (the
functional equation and the residue); Tau Ceti `TauCeti.idealsLE`.

### 2.3 Lee's refinement

Define Lee's constant `A_L(n) = 0.54 (3n − 1) λ(n) n^{3/2} n! / ((n − 1)² (log 𝔪(n))^{n−1})`
with `𝔪(n) = (π/4)ⁿ n^{2n}/(n!)²` and
`λ(n) = (n+1)^{1/2 − 1/(2n)} (5/8 + π/2 − 1/n + 3/(8n²))^{1/2} exp(n(2.27 + 4n/(n−1) + 0.01/n² + 1/(500 n⁶)))`
for `2 ≤ n ≤ 13`, and
`λ(n) = (n+1)^{n − 1/2 − 1/(2n)} (5/8 + π/2 + 1/n + 3/(8n²))^{1/2} exp(4.13 n + 0.02/n)` for
`n > 13` (`lee2023ideals` Theorem 1.2, p. 2, lines 57–70, the closed form of arXiv v2; the
published text prints a larger constant at `n = 2`, quoted by `ramare2025` §1, and its statement
is a consequence of the target).

- `A_L(n)` is finite and positive for every `n ≥ 2`, since `𝔪(n) ≥ 𝔪(2) > 1`.
- `A_L(n)` depends on `n` alone; the dependence on the field is in `d_K^{1/(n+1)} (log d_K)^{n−1}`.

Prove Lee's count: for `n ≥ 2` and `x > 0`,
`| #idealsLE K x − κ_K x | ≤ A_L(n) d_K^{1/(n+1)} (log d_K)^{n−1} x^{1 − 2/(n+1)}`.
Route: Sunley's argument with the parameters optimised and the explicit bounds for the Mellin
kernels `K(w)` and `K^{(n)}(w)` of Lee's Theorems 3.1 and 3.2, which are targets of this
section.

**Checks.**

- `𝔪(2) = (π/4)² · 16/4 ≈ 2.467`, `log 𝔪(2) ≈ 0.9032`, `λ(2) ≈ 1.4732·10⁹`, and
  `A_L(2) ≈ 2.49·10¹⁰`, the value `2.49133·10¹⁰` of the paper's Table 1 (line 46);
  `A_L(3) ≈ 8.45·10¹¹` (line 47).
- The two printings differ at `n = 2`: the published text has the constant `8.81·10¹¹` there (as
  quoted by `ramare2025` §1), while the arXiv v2 closed form above gives `2.49·10¹⁰`. The statement
  with the published constant is a consequence of the target; `8.80·10¹¹` is a rounding of the
  published value.
- At `n = 2` and imaginary quadratic `K`, 2.7 has the same exponent `x^{1/3}` with the constants
  `1.4` (`d_K = 4`), `1.94` (`d_K = 3`) and `3.4` (the thirteen fields `ℚ(√−m)` of its
  Corollary 1.6, whose discriminants lie between `−68` and `−3`, for `x ≥ 68`), against
  `2.49·10¹⁰ d_K^{1/3} log d_K` here.
- The exponent of `log d_K` is `n − 1`, one less than Sunley's `n`; the exponent of `x` is the same
  `(n−1)/(n+1)`. At `n = 1`, `𝔪(1) = π/4 < 1` and the formula is not defined, matching the
  hypothesis `n ≥ 2`.

*Needs:* 2.2's route; 1.1; ExplicitZetaBounds §§2.1, 2.5, 6.1a.

### 2.4 Debaene's uniform count

Prove `idealCount_debaene` (`debaene2019` lines 107–115, Corollary 2): for a number field of
degree `n` and real `x ≥ 1`,
`| #idealsLE K x − κ_K x | ≤ n^{10n²} (R_K h_K)^{1/n} (1 + log⁺(R_K h_K))^{(n−1)²/n} x^{1−1/n}`,
and `classIdealCount_debaene` (lines 116–124): for a class `c` of the class group (Tau Ceti's
`RayClassGroup (Modulus.one K)`) and real `x ≥ 1`, the number
`N_c(x) = rayClassIdealCountingFunction (Modulus.one K) c x` of nonzero integral ideals of norm at
most `x` in `c` satisfies
`| N_c(x) − (κ_K/h_K) x | ≤ n^{10n²} R_K^{1/n} (1 + log⁺ R_K)^{(n−1)²/n} x^{1−1/n}`.
The source prints `1 + log` in place of `1 + log⁺`; its proof (lines 941–954) bounds
`log y ≤ 2r log(2rn) + log Reg_K` for a `y ≤ (2rn)^{2r} Reg_K` (respectively `h_K` times that)
and absorbs this into `2r log(2rn)(1 + log Reg_K)`, which needs `Reg_K ≥ 1`; with `log⁺` the same
step holds for every field, and for `R_K h_K ≥ 1` (respectively `R_K ≥ 1`) the two forms agree.
Route (Debaene's Theorem 11): the ideals of a class of norm at most `x` are the lattice points of
an ideal lattice (Mathlib's `NumberField.mixedEmbedding.idealLattice`) in a norm-bounded region
modulo units; the region is partitioned (Schmidt's partition trick) into pieces whose boundaries
have Lipschitz class independent of the fundamental units, counted by 2.1 with the successive
minima of the ideal lattice bounded through Minkowski's second theorem and the regulator, and the
sum over ideals of `N(𝔟)^{−(n−1)/n}` bounded by `debaene2019` Lemma 12 (lines 876–899).

**Checks.**

- `K = ℚ(i)`, `R = h = 1`: the error term is `2^{40} x^{1/2}`; for `x = 10` the actual error is
  `|9 − 7.854| = 1.146`.
- The cubic field of discriminant `−23` (`α³ = α + 1`, fundamental unit `α`, `h = 1`):
  `R_K = log 1.324718 = 0.281200`, so `1 + log(R_K h_K) = −0.2687` and the printed form would take
  a real power of a negative base (Mathlib's `Real.rpow` gives `(−0.2687)^{4/3} = −0.087`, making
  the right side negative and the statement false); with `log⁺` the base is `1`.
- `K = ℚ`, `n = 1`: `n^{10} = 1`, `R h = 1`, the exponents vanish, and the statement is
  `|⌊x⌋ − x| ≤ 1`, true; the class version is the same, the class group being trivial.
- The class count summed over the `h_K` classes is the total count, and the error terms add to
  `h_K n^{10n²} R^{1/n}(1 + log⁺ R)^{(n−1)²/n} x^{1−1/n}`; since `(R h)^{1/n} ≤ h R^{1/n}` and
  `log⁺(R h) ≥ log⁺ R`, neither statement implies the other.
- `x < 1` is outside the statement, as in the source: there the count is `0` and the left side is
  `κ_K x`, while `x^{1−1/n}` tends to `0` with `x` only for `n ≥ 2`; at `n = 1` and `x = 1/2` the
  statement would read `1/2 ≤ 1`, true, so the restriction is the source's, not a correction.

*Needs:* 2.1; Tau Ceti `TauCeti.idealsLE`, `rayClassIdealCountingFunction` at `Modulus.one K`;
Completed/GlobalNumberFields Layer 3 (the shape); Mathlib `Units.regulator`, `classNumber`,
`NumberField.mixedEmbedding.idealLattice`, `Real.posLog`.

### 2.5 Counting ideals in narrow ray classes

For a nonzero integral ideal `𝔮`, let `𝔪 = 𝔮∞` be the modulus with finite part `𝔮` and every real
place (the infinite part of Tau Ceti's `narrowModulus K`), `H_𝔮 = RayClassGroup 𝔪` the narrow ray
class group and `φ(𝔮) = #(𝓞 K/𝔮)ˣ`. Define Gun–Ramaré–Sivaraman's field constant
`E(K) = 1000 n^{12n²} (R_K/w_K)^{1/n} (log((2n)^{4n} R_K/w_K))ⁿ` and modulus constant
`F(𝔮) = 2^{r₁} φ(𝔮) h_K / #H_𝔮` (`gunramaresivaraman2023` line 81).

- `1 ≤ F(𝔮)` (line 82): `#H_𝔮 ≤ 2^{r₁} φ(𝔮) h_K`, by the exact sequence of the ray class group
  (line 1104, Lemma 13).
- `E(K)` and `F(𝔮)` depend on `K` only through `n`, `R_K`, `w_K`, `h_K` and `r₁`, and on `𝔮` only
  through `φ(𝔮)` and `#H_𝔮`.
- `φ(𝔮)/N𝔮 = ∏_{𝔭 ∣ 𝔮}(1 − N𝔭⁻¹)`, so the main term below is `rayClassIdealMainTerm 𝔪 · x`.

Prove `rayClassIdealCount_gunRamareSivaraman` (lines 66–80, Theorem 1): for every class `c` of
`H_𝔮` and real `x ≥ 1`,
`| rayClassIdealCountingFunction 𝔪 c x − (κ_K φ(𝔮)/(#H_𝔮 · N𝔮)) x |`
`≤ E(K) F(𝔮)^{1/n} (log 3F(𝔮))ⁿ (x/N𝔮)^{1−1/n} + n^{8n} R_K w_K F(𝔮)`.
Route: a fundamental domain for the congruence units built from a Korkine–Zolotarev reduced
basis, its Lipschitz class, and 2.1.

**Checks.**

- `𝔮 = 𝓞 K`, `K = ℚ`: the narrow ray class group of `(1)∞` is trivial, `φ(𝔮) = 1`, so
  `F = 2^{r₁} φ(𝔮) h/#H = 2`, `n = 1`, `E(ℚ) = 1000 · (1/2) · log 8 ≈ 1039.7`, and the statement is
  `|⌊x⌋ − x| ≤ 1039.7 · 2 · log 6 + 1 · 1 · 2 · 2 ≈ 3730`, true since the left side is below `1`; a
  definition of `F` without the factor `2^{r₁}` would give `F = 1` and the bound
  `1039.7 · log 3 + 2 ≈ 1144`.
- `K = ℚ`, `𝔮 = (5)`: `φ(𝔮) = 4`, `H_𝔮 = (ℤ/5)ˣ` of order `4`, `F = 2`, and the main term
  `x · 4/(4 · 5) = x/5` is the density of the integers `≤ x` in one class modulo `5`.
- At the trivial modulus the main term is `κ_K/h_K^{narrow}`, matching 2.4's main term only when
  the narrow and ordinary class numbers agree (`r₁ = 0`, or every signature is attained by a
  unit); for `K = ℚ(√3)` the narrow class number is `2` while `h = 1`, and the two counts differ.

*Needs:* 2.1; Tau Ceti `RayClassGroup`, `narrowModulus`,
`rayClassIdealCountingFunction`, `rayClassIdealMainTerm_eq`; Completed/GlobalNumberFields Layers 2,
3; Mathlib `Units.regulator`, `Units.torsionOrder`.

### 2.6 Fehnker's counts in the large range

With `E₁(n) = 45 e² n^{7/2} 2^{4.1n}` and `E₂(n) = 2025 e² n^{11/2} 2^{4n} (n − 1)^{(n−1)/2}`, prove
Fehnker's class count and total count (`fehnker2026` Theorem 1.1, (A1), (A2), (B2), preprint):
for `n ≥ 2` and real `t ≥ (10 n² √d_K)ⁿ`, every class `c` of the class group satisfies

- (A1) `| N_c(t) − (κ_K/h_K) t | ≤ E₁(n) w_K⁻¹ R_K t^{1−1/n}`,
- (A2) `| N_c(t) − (κ_K/h_K) t | ≤ E₂(n) w_K⁻¹ R_K^{1/n} (log₁(15 n² √(2/n) R_K))^{(n−1)²/n} t^{1−1/n}`,

and the total count satisfies

- (B2) `| #idealsLE K t − κ_K t | ≤ E₂(n) w_K⁻¹ (R_K h_K)^{1/n} (log₁(15 n² √(2/n) R_K h_K))^{(n−1)²/n} t^{1−1/n}`,

with `N_c` as in 2.4. Route (`fehnker2026` §§2–6): the reduction of 2.4 to the lattice points of an
ideal lattice in a norm-bounded region modulo units, with two changes. The lattice-point count is
governed by the covering radius of the lattice instead of its successive minima (`fehnker2026`
Proposition 2.11, valid when the covering radius is at most `√(n − 1)` times the Lipschitz
constant of the boundary pieces; this is where the lower bound on `t` comes from), so no bound on
the orthogonality defect enters and the factor `D^{3D²/2}` of 2.1 disappears; and the fundamental
domain for the action of the units is chosen among the admissible ones so as to control its
boundary, before Schmidt's partition trick as in 2.4. The sum over the classes in (B2) uses
Debaene's Lemma 12 as in 2.4. The covering-radius count is part of this target.

**Checks.**

- Degree dependence: `E₂(2) = 1.73·10⁸`, `E₂(3) = 5.16·10¹⁰`, `E₂(5) = 1.75·10¹⁵`,
  `E₂(10) = 1.02·10²⁶`, against Debaene's `n^{10n²} = 10^{12.0}, 10^{42.9}, 10^{174.7}, 10^{1000}`;
  `E₁(2) = 1.11·10⁶`.
- `K = ℚ(i)` (`R = h = 1`, `w = 4`): the range is `t ≥ 80² = 6400`, and (B2) reads
  `| #idealsLE K t − πt/4 | ≤ (E₂(2)/4)(log 60)^{1/2} t^{1/2} = 8.77·10⁷ t^{1/2}`, against
  `2^{40} t^{1/2} = 1.10·10¹² t^{1/2}` from 2.4.
- Neither count implies the other: 2.4 holds for every `x ≥ 1`, this section only for
  `t ≥ (10n²√d_K)ⁿ`; below that range nothing is asserted here. `fehnker2026` §7 compares the
  two forms with 2.3, whose exponent `1 − 2/(n+1)` is smaller but whose constant depends on `d_K`
  alone.
- The truncation is `log₁`, not `log⁺`: with `log⁺` the factor would vanish whenever its argument
  is at most `1`, which the proof does not allow.

*Needs:* 2.4's reduction and Debaene's Lemma 12; Tau Ceti `TauCeti.idealsLE`; Mathlib
`Units.regulator`, `Units.torsionOrder`, `classNumber`, `NumberField.mixedEmbedding.idealLattice`.

### 2.7 Imaginary quadratic fields

For `K` imaginary quadratic with `d = d_K` and primitive character `χ = χ_K`, so that
`κ_K = L(1, χ)` and the number of ideals of norm `m` is `Σ_{k ∣ m} χ(k)`, define Ramaré's
functionals `ℓ_K(s)` for `0 < s < 1`, the supremum over real `M ≥ 1` of
`(M^{s−1}/L(1, χ)) Σ_{m ≤ M} (Σ_{k ∣ m} χ(k)) m^{−s}`, and `u_K(s)` for `s > 1`, the supremum
over `M ≥ 1` of `(M^{s−1}/L(1, χ)) Σ_{m ≥ M} (Σ_{k ∣ m} χ(k)) m^{−s}`, and Ramaré's constant
`r_K = max(ℓ_K(3/4), u_K(5/4))^{2/3}` (`ramare2025` Theorem 1.1, (2)–(4)).

- `ℓ_K(s)` and `u_K(s)` are finite: the partial sums of `1 ⋆ χ` are `L(1, χ) M + O(√M)` (2.2 at
  `n = 2`), so the normalised sums are bounded in `M`.
- `min(ℓ_K(3/4), u_K(5/4)) ≥ 4` (`ramare2025` Lemmas 3.3–3.4), so `r_K ≥ 4^{2/3}`.

Prove Ramaré's count (`ramare2025` Theorem 1.1): for `X ≥ max(d, 2 r_K)`,
`| #idealsLE K X − κ_K X − ζ_K(0) | ≤ 0.76 κ_K r_K X^{1/3}`, with `0.67` in place of `0.76` for
`X ≥ max(1302 d, 10 r_K)`, where `ζ_K(0) = (1/(2d)) Σ_{1 ≤ r ≤ d} r χ(r) = −h_K/w_K`; and, under
*RamareSmallRangeCheck*, the Gaussian count (Corollary 1.4):
`| #idealsLE ℚ(i) X − πX/4 | ≤ 1.4 X^{1/3}` for `X ≥ 1`, and the Eisenstein count
(Corollary 1.5): `| #idealsLE ℚ(√−3) X − πX/(3√3) | ≤ 1.94 X^{1/3}` for `X ≥ 1`; and the count for
the small fields (Corollary 1.6): for `K = ℚ(√−m)` with
`m ∈ {1, 2, 3, 5, 6, 7, 10, 11, 13, 14, 15, 17, 19}` and `X ≥ 68`,
`| #idealsLE K X − κ_K X − ζ_K(0) | ≤ 3.4 X^{1/3}`. Route (`ramare2025` §§2–4): Voronoï summation
for the convolution `1 ⋆ χ`, in which the Mellin transform of the weight is recognised as a
`J`-Bessel function, with Krasikov's explicit bounds for `J_ν`, a nonnegative smoothing, the a
priori bounds of Lemmas 3.3–3.4 for the partial sums, and the functional equation of
`ζ_K = ζ · L(s, χ)` (LFunctions Layer 4 `dedekindZetaC_quadratic`); the pole of `ζ_K(s)/s` at
`s = 0` produces the term `ζ_K(0)`, which is nonzero only for imaginary quadratic fields. The
Bessel bounds are part of this target. Corollary 1.6 specialises Theorem 1.1 with the upper bounds
for `r_K` of Lemmas 3.3–3.4; Corollaries 1.4–1.5 do the same above the threshold and use the
predicate below it.

**Checks.**

- `ℚ(i)`, `X = 10`: count `9`, `πX/4 = 7.854`, error `1.146 ≤ 1.4 · 10^{1/3} = 3.016`; `X = 100`:
  count `79` against `78.540`.
- `ℚ(√−3)`, `X = 10`: the ideals of norm at most `10` have norms `1, 3, 4, 7, 7, 9`, count `6`
  against `πX/(3√3) = 6.046`; with the constant term `ζ_K(0) = −1/6` the difference is `0.121`.
- The constant term: `d = 4`: `(1/8)(1·1 + 3·(−1)) = −1/4 = −h/w`; `d = 3`: `(1/6)(1 − 2) = −1/6`.
  Theorem 1.1 and Corollary 1.6 keep it; Corollaries 1.4–1.5 absorb it into their constants. A
  definition of the count including the zero ideal would add `1` and is not `#idealsLE`.
- Against 2.3 at `n = 2`: the exponent `x^{1/3}` is the same, while
  `A_L(2) · 4^{1/3} log 4 = 5.5·10¹⁰` at `ℚ(i)` against `1.4`.

*Needs:* LFunctions Layer 4 (`dedekindZetaC_quadratic`, the functional equation of `L(s, χ)`);
Mathlib `DirichletCharacter`, `NumberField.classNumber`; Tau Ceti `TauCeti.idealsLE`;
*RamareSmallRangeCheck*.

### Examples

- `ℚ(i)`, `x = 10`: count `9`, main term `7.854`.
- `ℚ(√3)`: narrow class number `2`, class number `1`.
- The cubic field of discriminant `−23`: `R_K h_K = 0.2812 < 1/e`, where Debaene's printed
  `1 + log` turns negative and `1 + log⁺` is `1`.
- `ℚ(√−3)`, `X = 10`: count `6`, main term `6.046`, Ramaré's bound `1.94 · 10^{1/3} = 4.18`.

### Dependencies

Layers 0 and 1; Tau Ceti geometry of numbers and ray-class counting
(Completed/GlobalNumberFields, SuccessiveMinima); LFunctions Layers 3 and 4; ExplicitZetaBounds
(§§2.1, 2.5, 6.1a).

## Layer 3: the residue

Louboutin's first bound `κ_K ≤ (e log d_K/(2n−2))^{n−1}` for `n ≥ 2` is
AnalyticNumberTheoryPartI §2.15 and is consumed; its positive Mellin comparison §2.15a is the route
of 3.1 and 3.2.

### 3.1 The zero-dependent upper bound

Prove Louboutin's zero-dependent upper bound (`louboutin2001`, Theorem 1; quoted at
`louboutin2003` lines 297–300): for `n ≥ 2` and a real `β` with `1/2 ≤ β < 1` and `ζ_K(β) = 0`,
`κ_K ≤ (1 − β)(e log d_K/(2n))ⁿ`.
Route: in the split formula `F_K(s) = λ/(s(s−1)) + I(s)`, `I(s) = ∫_1^∞ S_K(x)(x^{s−1} + x^{−s}) dx`
of §2.15a, the kernel `u ↦ x^{u−1} + x^{−u}` is increasing on `u ≥ 1/2` for `x ≥ 1`; so
`F_K(β) = 0` gives `I(β) = λ/(β(1−β))`, and for real `s > 1`, `I(s) ≥ I(β)`, whence
`F_K(s) ≥ λ/(β(1−β)) ≥ λ/(1−β)` and `λ ≤ (1−β) F_K(s)`. The bound `ζ_K(s) ≤ ζ(s)ⁿ` and the
log-convexity of §2.15a at `s = 1 + 2n/log d_K` give the display, with the exponent `n` because no
factor `(s−1)^{−1}` is cancelled.

**Checks.**

- `K = ℚ(√5)`, if `ζ_K(β) = 0` with `β ∈ [1/2, 1)` then
  `κ_K = 0.43041 ≤ (1−β)(e log 5/4)² = (1−β) · 1.19624`, so `1 − β ≥ 0.35980`: no real zero in
  `(0.64020, 1)`, consistent with the absence of real zeros of `L(s, χ₅)` in `(0, 1)`.
- The hypothesis `β ≥ 1/2` is used exactly once, in the monotonicity of the kernel: its derivative
  in `u` is `log x (x^{u−1} − x^{−u})`, nonnegative for `x ≥ 1` iff `u ≥ 1/2`; for `β < 1/2` the
  kernel is decreasing at `u = β` and the argument gives nothing, which is why the statement is
  restricted.
- `n = 1` is vacuous (`ζ` has no real zero in `(0, 1)`), and the formula would have `log 1 = 0`.

*Needs:* AnalyticNumberTheoryPartI §2.15a; LFunctions Layer 3.

### 3.2 The bound taking the prime `2` into account

Prove Louboutin's bound with the local factor at `2` (`louboutin2005` Theorem 10, inequality (13),
p. 569, line 307): for `n ≥ 3`,
`κ_K ≤ (Π_K(2)/2ⁿ) (e log d_K/(2n−2) · e^{n log 4/log d_K})^{n−1}`.
In the root discriminant `ρ_K = d_K^{1/n}` this is
`κ_K ≤ (Π_K(2)/2ⁿ) v_n ((e/2) log ρ_K · e^{log 4/log ρ_K})^{n−1}` with `v_n = (n/(n−1))^{n−1}`,
and `log ρ · e^{log 4/log ρ} = log ρ + (log 4) E(log 4/log ρ)` for `E(t) = (eᵗ − 1)/t`.
Route: in §2.15a replace `ζ_K(s) ≤ ζ(s)ⁿ` by `ζ_K(s) ≤ (Π_K(2, s)/(1 − 2^{−s})^{−n}) ζ(s)ⁿ`, where
`Π_K(2, s)` is the Euler factor of `ζ_K` at `2`, since the odd coefficients are bounded by `τ_n`
(0.3). At `s = 1 + 2(n−1)/log d_K ∈ (1, 6]` (Minkowski), `Π_K(2, s) ≤ Π_K(2)` and
`(1 − 2^{−s})ⁿ ≤ 2^{−n} 2^{n(s−1)} = 2^{−n} e^{n(n−1) log 4/log d_K}`; the rest is §2.15a, with
`g(6) ≤ 1` for every signature with `r₁ + r₂ ≥ 2`, which `n ≥ 3` guarantees.

**Checks.**

- `2` inert: `Π_K(2)/2ⁿ = 1/(2ⁿ − 1)`, so the bound improves Louboutin's first bound by that factor
  up to the exponential correction; `2` totally split: `Π_K(2)/2ⁿ = 1` and the bound is weaker
  than §2.15 by `e^{n(n−1) log 4/log d_K}`.
- `n = 2`, `K` imaginary quadratic with `2` inert (`d_K = 3`): `s* = 1 + 2/log 3 ≈ 2.82`, and
  `g(6) ≤ 1` fails for the signature `(0, 1)` (§2.15a), so the route needs `n ≥ 3`; the statement
  is not asserted at `n = 2`.
- A cubic field with `2` inert and `d_K = 23` (`ℚ(α)`, `α³ − α − 1 = 0`, irreducible modulo
  `2`, so `2` is inert; `r₁ = r₂ = 1`, `R_K = 0.281200`, `h = 1`, `w = 2`):
  `κ_K = 2 · 2π · 0.281200/(2√23) = 0.3684`; the bound is
  `(1/7)(e log 23/4 · e^{3 log 4/log 23})² = (1/7)(2.131 · 3.767)² ≈ 9.21`, true.

*Needs:* AnalyticNumberTheoryPartI §2.15a; 0.2; 0.3.

### 3.3 Friedman's unconditional lower bound

Prove `dedekindZeta_residue_ge_friedman` (`garcialee2022mertens` lines 1214–1224, (22)): for
`n ≥ 2`, `κ_K ≥ 0.36232/√d_K`. Route: `2^{r₁}(2π)^{r₂} ≥ 4` for `n ≥ 2`, `h_K ≥ 1`, and Friedman's
bound `R_K/w_K ≥ 0.09058` (`friedman1989`, Theorem B, cited by its locator; quoted at line 1215).
The lower bound that improves on this for `n ≥ 3`, Stark's, needs the one-zero lemma and is 4.7.

**Checks.**

- `K = ℚ(i)`: `κ = π/4 ≈ 0.785 ≥ 0.36232/2 = 0.181`; `K = ℚ(√5)`: `0.4304 ≥ 0.162`;
  `K = ℚ(ζ₅)`: `R_K = 2 log((1 + √5)/2) = 0.96242` (`R_K/R_{K⁺} = 2/Q_K` with `Q_K = 1`), so
  `κ = 4π² · 0.96242/(10 √125) = 0.33984 ≥ 0.0324`.
- The cubic field of discriminant `−23`: `κ = 0.3684 ≥ 0.36232/√23 = 0.0756`, with
  `R_K/w_K = 0.1406 ≥ 0.09058`.
- `n = 1`: `κ_ℚ = 1 ≥ 0.36232` holds, but the route's factor `2^{r₁}(2π)^{r₂}` is `2 < 4`
  there, which is why the statement is made for `n ≥ 2`.

*Needs:* Mathlib `dedekindZeta_residue_def`, `classNumber_pos`; `friedman1989` (locator).

### 3.4 Louboutin's zero-dependent lower bounds for totally imaginary fields

Define Louboutin's thresholds `ϱ(m)`, `ϱ_∅(m)` and `ϱ_2(m)` as the piecewise constants of
`louboutin2003` lines 78–82, Table 1, indexed by `2m ∈ {2, 4, 6, 8, 10, 12}` and constant
`2π²` (respectively `2π²`, `2π² Λ_{{2}}`) beyond: `ϱ = 270, 41, 26, 22, 21, 2π²`,
`ϱ_∅ = 2600, 50, 25, 20, 2π², 2π²`, `ϱ_2 = 36000, 650, 295, 222, 194, 181` and
`2π² Λ_{{2}}` beyond.

- Each is nonincreasing in `m`, and constant from `2m = 14` on.
- `ϱ_2(m) ≥ ϱ_∅(m)` for every `m`, and the tables of (2) are not the product forms of (1).

Prove Louboutin's lower bounds (lines 65–86, Theorem 1), for `K` totally imaginary of degree
`2n ≥ 2m`, `m ≥ 1`:

- (1) for a finite set `S` of primes, if `ρ_K ≥ ϱ(m) · Λ_S` and `ζ_K(β) ≤ 0` for some
  `β ∈ [1 − 2/log d_K, 1)`, then `κ_K ≥ (1/2)(1 − β) d_K^{(β−1)/2} Π_K(S)`;
- (2) if `S = ∅` and `ρ_K ≥ ϱ_∅(m)`, or `S = {2}` and `ρ_K ≥ ϱ_2(m)`, and `ζ_K(β) ≤ 0` for some
  `β ∈ [1 − 2/log d_K, 1 − 1/log d_K]`, then `κ_K ≥ (1 − β) d_K^{(β−1)/2} Π_K(S)`;
- (4) for `2n > 2` and `ρ_K ≥ 32π² Λ_{{2}}`, if `ζ_K(β) ≤ 0` for some
  `β ∈ [1 − 2/log d_K, 1)`, then `κ_K ≥ (1 − β) d_K^{(β−1)/2}`.

Route (lines 106–135): for totally imaginary `K` the completion is
`F_K(s) = A^s Γ(s)ⁿ ζ_K(s)`, `A = √d_K/(2π)ⁿ`, with the positive inverse Mellin kernel `H_n` of
`Γ(s)ⁿ`; the split formula `F_K(s) = λ/(s(s − 1)) + ∫_1^∞ S_K(x)(x^s + x^{1−s}) dx/x`
(lines 126–134) and `ζ_K(β) ≤ 0` give a lower bound for `λ = A κ_K` by the part of the integral over `x ≥ 1`, whose
first term `H_n(x/A)` is bounded below explicitly; the Euler factors at `S` enter by comparing
`S_K` with the series of the ideals prime to `S`. The thresholds are the numerical conditions under
which the kernel bounds hold.

**Checks.**

- The sign of the polar term: at `s = 1/2`, `λ/(s(s − 1)) = −4λ`, and the term is negative on all
  of `(0, 1)`, which is what lets `F_K(β) ≤ 0` bound `λ` from below by the integral; the form
  `λ(1/s + 1/(1 − s)) = λ/(s(1 − s))` would give `+4λ`, and with it `F_K(β) ≤ 0` could never hold
  for `β ∈ (0, 1)`, both terms on the right being positive.
- `m = 1`, `S = ∅`, `K` imaginary quadratic with `d_K ≥ 270²`: if `ζ_K(β) ≤ 0` with
  `β ≥ 1 − 2/log d_K` then `κ_K ≥ (1/2)(1−β) e^{−1}`; at `β = 1 − 1/log d_K` this is
  `κ_K ≥ 1/(2e log d_K)`, consistent with the class-number formula `κ_K = 2πh/(w√d_K)` only when
  `h ≥ w√d_K/(4πe log d_K)`, a form of Siegel's bound.
- `Λ_{{2}} = (1 + 2^{−1/2})⁴ ≈ 8.4926`, so `ϱ(1) · Λ_{{2}} ≈ 2293` while `ϱ_2(1) = 36000`: the
  table of (2) is not the product form of (1); and `2π² Λ_{{2}} ≈ 167.638`,
  `32π² Λ_{{2}} ≈ 2682.21`, the two constants of the statement.
- `β < 1 − 2/log d_K` is outside the statement; at `β = 1/2` and `d_K = 10⁶`,
  `d_K^{(β−1)/2} = 10^{−1.5}`, and the right side is below `κ_K` for every field in the range, so
  the hypothesis on `β` is what makes the bound non-trivial.

*Needs:* LFunctions Layer 3 (the completed function and functional equation for totally
imaginary `K`); AnalyticNumberTheoryPartI §2.15a (the Mellin split); 0.2.

### 3.5 The explicit Duke short-sum theorem on Euler-product records

Define the quotient record `𝒬_K` as the record of LFunctions Layer 0 with coefficients those of
the Dirichlet series `ζ_K(s)/ζ(s)` (the convolution of `a_K` with `μ`), conductor `d_K`, real gamma
shifts `0` with multiplicity `r₁ + r₂ − 1` and `1` with multiplicity `r₂` (from
`Γ_ℝ(s)^{r₁−1} Γ_ℂ(s)^{r₂}` by duplication), root number `1`, completed function
`Λ_K(s)/Λ_ℚ(s)` and empty polar divisor.

- It has Dirichlet agreement on `Re s > 1`, degree `n − 1`, and an Euler product whose local
  polynomial at `p` is `(1 − p^{−s})⁻¹ ∏_{𝔭 ∣ p}(1 − p^{−f_𝔭 s})` reciprocal, with inverse roots
  roots of unity; its functional equation `Λ(s) = Λ(1 − s)` follows from those of `Λ_K` and
  `Λ_ℚ`.
- Under *DedekindConjecture* `K` it has `HasMeromorphicContinuation` with no poles and its
  completed function is entire; *GRH* for it (ZerosOfLFunctions Layer 9) is implied by
  `DedekindERH K`.
- Its value at `1` is `κ_K`, and its prime coefficients are `a(p) = a_K(p) − 1 ∈ [−1, n − 1]`
  (`garcialee2022artin` line 886, (29): `−1` when `p` is inert, `n − 1` when `p` splits
  completely).

**Checks.**

- `K = ℚ(i)`: the record is `dirichletData χ₋₄` field by field (degree `1`, conductor `4`, shift
  `1`).
- `K = ℚ`: degree `0`, coefficients `1, 0, 0, …`, completed function `1`.
- A real cubic field: shifts `{0, 0}`, degree `2`; a record with the shift `1` once (as for a
  complex cubic field) differs in its gamma factor, and the two functional equations are not
  interchangeable.

The prime-reciprocal input is Garcia–Lee's extension of Schoenfeld's bound to `x ≥ 1.048`, the
range that conductors `N ≥ 3` need (`(log 3)^{1/2} > 1.048`). With `M = mertensConstant ℚ` and
`m(x) = (3 log x + 4)/(8π√x) + 5/x²`, prove Garcia–Lee's Mertens lemma (`garcialee2022artin` lines
121–131, Lemma 3): under `RiemannHypothesis` and *GarciaLeeMertensSmallRange*, for every real
`x ≥ 1.048`, `|Σ_{p ≤ x} 1/p − log log x − M| < m(x)`. Route: for `x ≥ 13.5`,
`gap:explicit-mertens-second` with `(3 log x + 4)/(8π√x) < m(x)`; below, the predicate.

**Checks.**

- `x = 1.048`: the sum is empty, `log log 1.048 = −3.0601` and the left side is `2.7986`, against
  `m(1.048) = 4.7134`; the unconditional error `1/log² x` of the Rosser–Schoenfeld form would be
  `454.9` there, which is why the theorem is the conditional one.
- `x = 13.5`: `Σ_{p ≤ 13} 1/p = 1.344022`, `log log 13.5 = 0.956545`, left side `0.125980`, below
  Schoenfeld's `(3 log 13.5 + 4)/(8π√13.5) = 0.127871` and `m(13.5) = 0.155306`; without the
  term `5/x²` the bound would be Schoenfeld's, which fails below `13.5` (at `x = 2` it is
  `0.171044` against the left side `0.605016`).
- The tightest point of the predicate is `x = 7`: `Σ_{p ≤ 7} 1/p = 1.176190`, `log log 7 = 0.665730`,
  left side `0.248963` against `m(7) = 0.249988` (the clearance `0.0010` of
  `garcialee2022artin` lines 145–147); a constant below `4.95` in place of the `5` of `5/x²`
  fails there.
- Just below `x = 2` the left side is `|log log x + M| → 0.105016`; at `x = 2` the sum jumps by
  `1/2` and the left side is `0.605016`, both below `m(2) = 1.421044`, so the sum over `p ≤ x` and
  the sum over `p < x` both satisfy the bound there, while they differ at every prime.

Prove the explicit Duke short-sum theorem (`garcialee2022artin` lines 24–29, Theorem 1): for a
record `d` of degree `m ≥ 1` and conductor `N ≥ 3` with Dirichlet agreement, an Euler product
with inverse roots in the closed unit disc, real gamma shifts in `{0, 1}`, no complex shifts,
entire completion, functional equation, *GRH* for `d`, `RiemannHypothesis` and
*GarciaLeeMertensSmallRange*,
`| log L(1) − Σ_{p ≤ (log N)^{1/2}} a(p)/p | ≤ 13.53 m`,
where `a(p)` is the sum of the inverse roots at `p`, `L(1)` is the value of the continued function,
and `log L(1)` is the value at `1` of the continuous logarithm of `σ ↦ L(σ)` on `[1, ∞)` that
equals `Σ_p Σ_{k ≥ 1} (α₁(p)^k + ⋯ + α_m(p)^k)/(k p^{kσ})` for `σ > 1` (the `α_i(p)` the inverse
roots). It exists because `L` has no zero on `[1, ∞)`: on `(1, ∞)` by the Euler product, and at
`1` because a zero there would be a zero of the entire completion off `Re s = 1/2`; it agrees at
`1` with the holomorphic logarithm on `Re s > 1/2` that *GRH* provides (`garcialee2022artin`
lines 136, 152–167). For `d = 𝒬_K` the coefficients are real and `L > 0` on `[1, ∞)`, so
`log L(1) = log κ_K`. `RiemannHypothesis` is a separate hypothesis because the record's *GRH* does
not contain it. Route: the explicit formula for the entire completion with its Hadamard product
(ZerosOfLFunctions 5.5–5.6), *GRH* to place every zero on `Re s = 1/2`, explicit gamma-function
integrals, and Garcia–Lee's Mertens lemma at `x²` and at `y` (lines 690–718).

**Checks.**

- `d = dirichletData χ₋₄` under `DirichletGRH χ₋₄`: `log(π/4) = −0.2416`, `(log 4)^{1/2} = 1.18`,
  the empty prime sum, and `|−0.2416| ≤ 13.53`.
- `m = 0` is excluded: `L = 1` and the statement would read `0 ≤ 0`, true but not Duke's theorem;
  `N < 3` makes `(log N)^{1/2}` ill-defined or below `1.048`.
- A record with a pole at `1` (`ζ` itself) is excluded by the entirety hypothesis; the statement
  is meaningless for it since `log L(1)` is not defined.
- The branch: for `d = 𝒬_K` the coefficients are real and `L(σ) > 0` on `[1, ∞)` (it has no zero
  there and tends to `1`), so the continuous logarithm is the real logarithm and
  `log L(1) = log κ_K`; the choice of branch matters only for records with non-real coefficients,
  such as `dirichletData χ` for a cubic character `χ` modulo `7`.

*Needs:* LFunctions Layer 0 (`ofSeries`), Layer 3; Mathlib `Complex.Gammaℝ_mul_Gammaℝ_add_one`,
`RiemannHypothesis`; Tau Ceti `TauCeti.LFunctions.mertensConstant`; Tau Ceti
`TauCeti.EulerProductData` (through AnalyticNumberTheoryPartI §2.18's unit-disc coefficient
construction); ZerosOfLFunctions 5.5, 5.6, Layer 9; `gap:explicit-mertens-second`;
ExplicitZetaBounds §§2.1, 2.5; 0.5.

### 3.6 The conditional two-sided bounds

Prove the explicit von Mangoldt–log sum under the Riemann hypothesis (`gglm2026` Theorem 2.1):
under `RiemannHypothesis`, *GGLMPsiSmallRange*, and ExplicitPrimeCounting's *ButheVerified* and
*Schoenfeld1976Range* (the finite verifications of the Schoenfeld bound it uses), for every real
`x ≥ e`,
`| Σ_{2 ≤ m ≤ x} Λ(m)/(m log m) − log log x − γ | ≤ 3(log x + 2)/(8π√x)`. Route: for `x ≥ 73.2`,
partial summation against `1/(t log t)` from Schoenfeld's `ψ` bound (ExplicitPrimeCounting §2.2),
the constant being identified through Mertens' product; below, the predicate.

Prove the smoothed approximation of `log κ_K` (`gglm2026` Theorem 3.1): for `n ≥ 2`, under
`DedekindERH K`, `dedekindZetaC K (1/2) ≠ 0`, *DedekindConjecture* `K`, *ButheVerified* and
*Schoenfeld1976Range* (for the von Mangoldt–log sum above `73.2`), with
`Σ_K(x) = Σ_{2 ≤ m ≤ x} Λ(m) a(m)/(m log m)` and `a(p^k) = α₁(p)^k + ⋯ + α_{n−1}(p)^k` the power
sums of the inverse roots of `𝒬_K` (3.5), for every real `x ≥ 5·10⁵`,
`| log κ_K − Σ_K(x) | ≤ (3e/(8π) + 1.45/log x)(log x)³ (n − 1)/√x + (3e/(4π) + 6.01/log x)(log x)² log d_K/√x`.
Route (`gglm2026` §3): average `Σ_K` over `[x, x + h]` with `√x (log x)² ≤ h < x`, the averaging
error being at most `(n − 1)` times the increment of `Σ Λ(m)/(m log m)` over `[x, x + h]` (the
previous theorem, with `RiemannHypothesis` from `DedekindERH K` and *DedekindConjecture* `K` as in
the Garcia–Lee route below); write the averaged sum by the iterated Perron identity of
ExplicitZetaBounds §6.1a at `j = 1` as a contour integral of `log L(s)` for the quotient record;
and move the contour to
`Re s = 1/2 + ε`, where *GRH* for the record bounds `L'/L` through the Hadamard expansion
(ZerosOfLFunctions 5.5–5.6; `gglm2026` Lemma 3.2), with the gamma factors by
ExplicitZetaBounds §§2.1 and 2.5.

Prove the GRH two-sided bound of Garcia–Grenié–Lee–Molteni (`gglm2026` Theorem 1.1): for `n ≥ 2`
and `d_K ≥ 14`, under `DedekindERH K`, `dedekindZetaC K (1/2) ≠ 0`, *DedekindConjecture* `K`,
*GGLMPsiSmallRange*, *GGLMSmallDiscriminantTable*, *ButheVerified*, *Schoenfeld1976Range* and the
finite verifications under which ExplicitPrimeCounting §4.7 states the Mertens estimate that
ExplicitMultiplicativeFunctions §8.1 turns into Mertens' product (*LeeNosalMertensRange*,
`LeeNosalRange`, `ZetaZeroReciprocalSum`, `ZetaZeroCountLowRange` and *PsiThetaUpper* or the
inputs of ExplicitPrimeCounting §3.7 that discharge it),

- `κ_K ≤ (2e^γ (log log d_K)^{1 + 19/log log d_K})^{n−1}`,
- `κ_K ≥ ζ(n)/(2e^γ (log log d_K)^{1 + 19(n−1)/log log d_K})`.

The hypothesis `dedekindZetaC K (1/2) ≠ 0` is part of the generalized Riemann hypothesis as
`gglm2026` §1 states it and does not follow from `DedekindERH K`. Route (`gglm2026` §4): for
`d_K ≥ 1.6·10⁶` take `x = (log d_K)^{2M(d_K)}` with `M(t) = 1 + 4 log log log t/log log t` (at most
`1 + 4/e`), so that `x ≥ 5·10⁵` and `log x = 2M(d_K) log log d_K`; apply the smoothed approximation;
bound `Σ_K(x)` above by `(n − 1)(log log x + γ + 3(log x + 2)/(8π√x))` from `a(p^k) ≤ n − 1` and the
von Mangoldt–log sum (`gglm2026` Lemma 2.4), and below through Mertens' product under the Riemann
hypothesis (ExplicitMultiplicativeFunctions §8.1, at `x ≥ 5·10⁵`) and the unconditional
`∏_{p ≤ x}(1 − p^{−n})^{−1} ≥ ζ(n) exp(−(1 + 1/(2 log x))/(x log x))` for `x ≥ 59`, `n ≥ 2`
(`gglm2026` Lemmas 2.3 and 2.5, the lower bound using `a(p) ≥ −1`); the choice of `M` turns the
error terms into the exponents `19/log log d_K` and `19(n−1)/log log d_K`. For `14 ≤ d_K < 1.6·10⁶`,
the predicate. `RiemannHypothesis` follows from `DedekindERH K` and *DedekindConjecture* `K`, since
`ζ_K = F ζ` with `F` entire makes every zero of `ζ` in the strip a zero of `ζ_K`. The route does not
pass through 3.5's short-sum theorem: the smoothed sum replaces Duke's sum over
`p ≤ (log d_K)^{1/2}`, and the prime sums are those of the Riemann hypothesis.

Prove Palojärvi–Simonič's upper bound (`palojarvisimonic2026` Corollary 4, quoted at `gglm2026`
Remark 1.2): for `n ≥ 2` and `d_K ≥ 5.4·10⁶`, under the analytic hypotheses of the previous
theorem (`DedekindERH K`, `dedekindZetaC K (1/2) ≠ 0`, *DedekindConjecture* `K`),
`κ_K ≤ (2e^{γ + 2.475/log log d_K} log log d_K)^{n−1}`. Route: the conditional estimates of
`palojarvisimonic2026` for `log L(1)` of an entire L-function of the Selberg class under the
generalized Riemann hypothesis, applied to `𝒬_K` (degree `n − 1`, conductor `d_K`, entire under
*DedekindConjecture* `K`, with an Euler product whose inverse roots are roots of unity).

Prove Garcia–Lee's two-sided bound (`garcialee2022artin` lines 62–71, Corollary 2): for `n ≥ 2`,
under `DedekindERH K`, *DedekindConjecture* `K` and *GarciaLeeMertensSmallRange*,
`e^{−17.81(n−1)}/log log d_K ≤ κ_K ≤ (e^{17.81} log log d_K)^{n−1}`,
and the sharper pairs `(17.81, 17.81)`, `(17.54, 18.87)`, `(22.52, 24.1)`, `(26.93, 28.2)`,
`(32.24, 33.36)` for `n = 2, …, 6`, in the form `1/(e^{a} log log d_K) ≤ κ_K ≤ e^{b}(log log d_K)^{n−1}`.
It needs neither `dedekindZetaC K (1/2) ≠ 0` nor the table, and holds for `3 ≤ d_K < 14`.
Route: 3.5 at `𝒬_K`, whose value at `1` is `κ_K` and whose *GRH* follows from `DedekindERH K`;
`RiemannHypothesis` follows as above. The upper bound for `κ_K` uses `a(p) ≤ n − 1`, the lower
bound uses `a(p) ≥ −1` (with only `|a(p)| ≤ n − 1` it would come out as
`(log log d_K)^{−(n−1)}`), and both use the upper side of Garcia–Lee's Mertens lemma at
`x = (log d_K)^{1/2} ≥ 1.048`, with `d_K ≥ 3`.

**Checks.**

- *GGLMPsiSmallRange* at `x = e`: the only term is `m = 2`, `Λ(2)/(2 log 2) = 1/2`, and
  `|1/2 − log log e − γ| = 0.0772 ≤ 3(1 + 2)/(8π√e) = 0.2172`; the Riemann-hypothesis range starts
  at `73.2`, where Schoenfeld's `ψ` bound of ExplicitPrimeCounting §2.2 takes over.
- `K = ℚ(√−5)` (`n = 2`, `d_K = 20`, `κ_K = 2π · 2/(2√20) = 1.405`): the bounds of
  Garcia–Grenié–Lee–Molteni are `0.0845 ≤ κ_K ≤ 19.48`; `K = ℚ(√−14)` (`d_K = 56`,
  `κ_K = 1.679`): `0.00362 ≤ κ_K ≤ 454.9`; the cubic field of discriminant `−23`
  (`κ_K = 0.3684`): `0.00349 ≤ κ_K ≤ 1402`.
- `d_K ≥ 14` is needed for the upper function to exceed the lower one (`gglm2026` §1); the fields
  with `d_K ≤ 13` are `ℚ` and the nine quadratic fields of discriminant
  `−3, −4, 5, −7, ±8, −11, 12, 13`, where only the Garcia–Lee form is asserted. For `K = ℚ(i)` (`d_K = 4`,
  `log log 4 = 0.3266`) it reads `1/(e^{17.81} · 0.3266) ≤ π/4 ≤ e^{17.81} · 0.3266`.
- The Garcia–Lee form follows from the Garcia–Grenié–Lee–Molteni form for `d_K ≥ 14`: with
  `u = log log d_K > 0`, `u^{19/u} ≤ e^{19/e} < 1086` and
  `2e^γ · 1086 = 3868.5 < e^{17.81} = 5.43·10⁷` for the upper bound, and
  `ζ(n) e^{17.81(n−1)} > 2e^γ e^{19(n−1)/e}` for the lower bound.
- Palojärvi–Simonič's upper bound is the sharper one where it applies: at `d_K = 10⁷`
  (`u = 2.780`) its factor `e^{2.475/u} = 2.44` replaces `u^{19/u} = 1084`; at `d_K = 5.4·10⁶` and
  `n = 2` the two upper bounds are `24.1` and `10595`.
- The hypothesis `dedekindZetaC K (1/2) ≠ 0` is part of the generalized Riemann hypothesis as
  `gglm2026` §1 states it (zeros in the strip have real part `1/2` and nonzero imaginary part); it
  is not implied by `DedekindERH K` and is kept as a separate hypothesis of the two theorems that
  use it.
- For `n = 2` and imaginary quadratic `K` with `d_K = q ≥ 10¹⁰`, `κ_K = L(1, χ_K)` and, under
  `DirichletGRH χ_K`, the bound of `lamzourilisoundararajan2015` Theorem 1.5,
  `L(1, χ) ≤ 2e^γ (log log q − log 2 + 1/2 + 1/log log q)`, gives `11.62` at `q = 10¹⁰` against
  `11363` here; that bound and its companion lower bound (Corollary 1.3 for `h(−q)`) are
  statements about Dirichlet L-functions and stay with ExplicitZetaBounds.
- `log log d_K > 0` needs `d_K > e`, which `n ≥ 2` gives (`d_K ≥ 3`); at `n = 1` both forms divide
  by `log log 1 = log 0`.
- *DedekindConjecture* `K` holds for Galois `K` by 0.5 and is not needed for `n ≤ 4`
  (`garcialee2022artin` lines 72–74 say it is known for cubic and quartic fields); every statement
  keeps it as a hypothesis in every degree.

*Needs:* 3.5 (the quotient record, the short-sum theorem, Garcia–Lee's Mertens lemma,
*GarciaLeeMertensSmallRange*); 0.5; AnalyticNumberTheoryPartI §2.42; ZerosOfLFunctions 5.5,
5.6, Layer 9; ExplicitZetaBounds §§2.1, 2.5, 6.1a; ExplicitPrimeCounting
§2.2 (with *ButheVerified*, *Schoenfeld1976Range*); ExplicitMultiplicativeFunctions §8.1 (with
the finite verifications of ExplicitPrimeCounting §4.7); *GGLMPsiSmallRange*;
*GGLMSmallDiscriminantTable*; Mathlib `riemannZeta`, `ArithmeticFunction.vonMangoldt`.

### Examples

- `ℚ(√5)`: `κ = 0.4304`; the real-zero-dependent bound shows no real zero in `(0.64020, 1)`.
- The cubic field of discriminant `−23` with `2` inert: `κ = 0.3684`, with Friedman's lower bound
  `0.0756` and the bound `9.21` of 3.2.

### Dependencies

Layer 0; AnalyticNumberTheoryPartI §§2.15, 2.15a, 2.18, 2.42; LFunctions Layers 0, 3;
ZerosOfLFunctions Layers 5, 9; Tau Ceti `mertensConstant`, `EulerProductData`; ExplicitPrimeCounting
(§§2.2, 4.7 and `gap:explicit-mertens-second`); ExplicitMultiplicativeFunctions §8.1;
ExplicitZetaBounds §§2.1, 2.5, 6.1a; `friedman1989` by locator.

## Layer 4: zeros of `ζ_K`

### 4.1 Trudgian's zero count

With `N_K(T)` the symmetric zero count of the conventions, prove Trudgian's count (`trudgian2015`
lines 25–27, Theorem 2): for `T ≥ 1`,
`| N_K(T) − (T/π) log(d_K (T/(2πe))ⁿ) | ≤ 0.317 (log d_K + n log T) + 6.333 n + 3.482`.
Trudgian's own parameter ranges were not verified (`hasanalizadeshenwong2022` lines 37–50, after
Bennett–Martin–O'Bryant–Rechnitzer); the statement is supported by the repaired admissible triple
`(D₁, D₂, D₃) = (0.296, 3.971, 3.969)` for `T ≥ 1` of `hasanalizadeshenwong2022` Table 1
(line 76, Corollary 1.2), which implies it for every `K` and `T ≥ 1`, since the difference of the
two right sides is `0.021 (log d_K + n log T) + 2.362 n − 0.487 > 0` for `n ≥ 1`.
Route (Backlund's method, with Hasanalizade–Shen–Wong's tracking of every parameter range):
apply the argument principle on the rectangle `Icc (−η') (1+η') ×ℂ Icc (−T) T` to the entire
completion `entireCompletion (dedekindZetaData K)`, in which the poles at `0` and `1` are cleared
(ZerosOfLFunctions 7.2 with 4.2), read the main term off the gamma factors by the explicit
Stirling bounds, bound the argument variation of `ζ_K` on the horizontal edges by Backlund's
lemma with `M` from 1.1 at the base point `c = 1 + η' + iT`, and pass back to `Λ_K` by 4.2 and
6.5.

**Checks.**

- `K = ℚ`, `T = 15`: `N_ℚ(15) = 2`, main term `(15/π) log(15/(2πe)) = 4.775 · (−0.1298) = −0.620`,
  error bound `0.317 · 2.708 + 6.333 + 3.482 = 10.67`, and `|2 + 0.620| ≤ 10.67`.
- `K = ℚ(i)`, `T = 100`: `ζ_K = ζ · L(s, χ₋₄)`, so `N_K(100) = N_ℚ(100) + N(100, χ₋₄)` with both
  counts symmetric in `γ` (`trudgian2015` line 17, `hasanalizadeshenwong2022` line 27);
  `N_ℚ(100) = 2 · 29 = 58`, and Trudgian's Theorem 1 for `χ₋₄` (`k = 4`) places `N(100, χ₋₄)` within
  `(100/π) log(400/(2πe)) ± (0.317 log 400 + 6.401) = 100.38 ± 8.30`, so `150 ≤ N_K(100) ≤ 166`.
  The main term is `(100/π) log(4 (100/(2πe))²) = 31.83 · 4.921 = 156.64` and the bound is
  `0.317 (1.386 + 2 · 4.605) + 12.666 + 3.482 = 19.51`, which covers the whole range; a one-sided
  count of the zeros of `L(s, χ₋₄)` (about `50`) would give `N_K(100) ≈ 108`, outside it.
- `T < 1` is excluded; at `T → 0⁺` the main term tends to `0` and `N_K(0) = 0`, consistent, but
  the proof's base point needs `T ≥ 1`.

*Needs:* ZerosOfLFunctions 4.1, 4.2, 6.5, 7.1, 7.2, 7.3; 1.1; ExplicitZetaBounds §5.1 (Backlund's
lemma), §§2.1, 2.5; LFunctions Layer 3.

### 4.2 Hasanalizade–Shen–Wong's zero count

Prove Hasanalizade–Shen–Wong's count (`hasanalizadeshenwong2022` lines 52–54, Theorem 1.1): for
`T ≥ 1`,
`| N_K(T) − (T/π) log(d_K (T/(2πe))ⁿ) + r₁/4 | ≤ 0.22737 log(d_K (T+2)ⁿ/(2π)ⁿ) + 23.02528 n + 4.51954`,
and its corollary (lines 63–65, Corollary 1.2):
`| N_K(T) − (T/π) log(d_K (T/(2πe))ⁿ) | ≤ 0.228 (log d_K + n log T) + 23.108 n + 4.520`.
Route: 4.1's method with Bennett–Martin–O'Bryant–Rechnitzer's refinement of the argument-count
lemma and the term `r₁/4` kept from the gamma factors; the corollary absorbs `r₁/4 ≤ n/4` and
`log(T+2) − log T ≤ log 3`.

**Checks.**

- `K = ℚ`, `T = 15`: `|2 + 0.620 + 1/4| = 2.87 ≤ 0.22737 · log(17/(2π)) + 23.03 + 4.52 = 27.78`.
- The corollary's constant `0.228 > 0.22737` and `23.108 > 23.02528` absorb `r₁/4` and the shift
  from `T + 2` to `T`; the triple `(0.316, 5.872, 3.655)` of Trudgian's Table 2 is not a target
  (lines 39–41: those table rows were repaired by this paper).
- `K` totally complex: `r₁ = 0` and Theorem 1.1 has no shift; for `K = ℚ(√2)`, `r₁ = 2` and the
  shift is `1/2`, consistent with `N_K(T) = N_ℚ(T) + N(T, χ₈)` and the two shifts `1/4`.

*Needs:* 4.1's inputs.

### 4.3 Real zeros

Prove Stark's one-zero lemma (`louboutin2017` lines 25–26 and `louboutin2015ijnt` lines 27–28):
for `n ≥ 2`, `ζ_K` has at most one zero `ρ = β + iγ` with `β > 1 − 1/(4 log d_K)` and
`|γ| ≤ 1/(4 log d_K)`, counted with multiplicity, and if it exists it is real and simple.
Route (Stark): for real `σ > 1`, `0 < −ζ'_K/ζ_K(σ)`, while the partial-fraction expansion of
`Λ'_K/Λ_K` (ZerosOfLFunctions 5.6, 6.4(4d)) gives
`−ζ'_K/ζ_K(σ) = 1/(σ−1) + 1/σ + (1/2) log d_K + (gamma terms) − Σ_ρ Re(1/(σ−ρ))`, the gamma
terms `(r₁/2)(ψ(σ/2) − log π) + r₂(ψ(σ) − log 2π)` being negative on `1 < σ ≤ 2` by the
monotonicity of `ψ` (1.1a); two zeros (or a double zero, or a non-real pair) in the region make
the zero sum at `σ = 1 + 1/(4 log d_K)` too large.

Prove Louboutin's real-zero counts (`louboutin2015ijnt` lines 48–50, Theorem 3): for `m ≥ 1`,
`c_m = 2(√(m+1) − 1)²`, and `log d_K > max(2(√(m+1) − 1), c_m)`, `ζ_K` has at most `m` real zeros,
with multiplicity, in `σ ≥ 1 − c_m/log d_K`; and (lines 84–91, Theorem 6): with
`c'_m = ((5 + √5)/4) c_m` and `d_K > exp((5 + √5)(√(m+1) − 1)²)`, at most `m` real zeros, with
multiplicity, in `σ ≥ 1 − c'_m/log d_K`, and this abscissa exceeds `1/2`. Route: Stark's
inequality with `m + 1` zeros, and for Theorem 6 Stechkin's differencing of the logarithmic
derivative between `σ` and the auxiliary point `σ'` of Stechkin's lemma, with the weight
`λ = 1 − 1/√5`, which turns the pole term `1/(σ − 1)` into `λ/(σ − 1)` at the cost of the factor
`(5 + √5)/4` in the constant.

Prove the sign of `ζ_K` for odd Galois fields (lines 51–59, Corollary 4 and its proof): for `K/ℚ`
Galois of odd degree `n ≥ 3` and `c₂ = 2(√3 − 1)²`, `ζ_K` has no real zero of odd
multiplicity in `[1 − c₂/log d_K, 1)`, and consequently `ζ_K(σ) ≤ 0` for every `σ` in that
interval. Route: a field of odd degree has no quadratic subfield, so by Stark's theorem
(AnalyticNumberTheoryPartI §2.39: a simple real zero of `ζ_K` for Galois `K` is a zero of `ζ_F`
for a quadratic subfield `F`) no real zero of `ζ_K` is simple; a zero of odd multiplicity in the
interval then has multiplicity at least `3`, against Theorem 3 at `m = 2` (at most two real zeros
with multiplicity in `σ ≥ 1 − c₂/log d_K`, whose hypothesis `log d_K > 1.464` holds since
`d_K ≥ 21` for `n ≥ 3`); with no sign change on the interval and `ζ_K(σ) → −∞` as `σ → 1⁻`,
`ζ_K ≤ 0` there. The source states the stronger "no real zero in `σ ≥ σ₂`", but its proof
excludes only zeros of odd multiplicity: a double real zero is allowed by Theorem 3 at `m = 2` and
does not change sign.

**Checks.**

- `m = 1`: `c₁ = 2(√2 − 1)² ≈ 0.3431 > 1/4`, so Theorem 3 at `m = 1` improves Stark's constant
  `1/4` on the real axis, as `louboutin2017` lines 27–30 note; Theorem 6 at `m = 1` gives
  `c'₁ = ((5+√5)/4) · 0.3431 ≈ 0.6207` for `d_K > e^{1.2416} = 3.46`.
- `K = ℚ(√5)` (`d_K = 5`, `log 5 = 1.609 > max(1.464, 1.072)`, `m = 2`): at most two real zeros
  in `σ ≥ 1 − 0.666`; there are none.
- `K = ℚ(ζ₇)⁺` (Galois cubic, `d_K = 49`): `1 − 1.0718/3.892 = 0.7246`, so `ζ_K ≤ 0` on
  `[0.7246, 1)`. Here `ζ_K = ζ · L(s, χ) L(s, χ̄)` for the cubic character `χ` modulo `7`, and a
  real zero `β` of `L(s, χ)` would also be a zero of `L(s, χ̄)` (the values are conjugate), so a
  double zero of `ζ_K`: the corollary does not exclude it, which is why it is stated for zeros of
  odd multiplicity.
- `K = ℚ(√5)` (degree `2`, not odd): the corollary does not apply, since the quadratic subfield
  `K` itself can carry a simple real zero.
- `K = ℚ`: `log d_K = 0` and every hypothesis fails; `ζ` has no real zero in `(0, 1)` anyway.

*Needs:* ZerosOfLFunctions 5.6, 6.4(4d), 6.5; LFunctions Layer 3; 1.1a; AnalyticNumberTheoryPartI
§2.39 (for the corollary); Mathlib `abs_discr_ge`.

### 4.4 Louboutin's Stark-like regions

Define the Stark-like region `S_K(c, d) = {s | Re s > 1 − c/log d_K ∧ |Im s| ≤ d/log d_K}` for
`n ≥ 2`, Louboutin's root `S₀` as the unique root in `[0, 1]` of `P(S) = S⁴ + 2S³ − 2S² − 4S + 2`
(`louboutin2017` lines 31–34, where the interval is printed as `[0, √2]`, which contains a second
root), and the constants `D₁ = 2(1 − S₀ − S₀²)/(2 + S₀)`, `C₁ = 2(√2 − 1)²`, `λ = 1 − 1/√5`,
`C₂ = C₁/λ`, `D₂ = D₁/λ`.

- `P` has exactly one root in `[0, 1]`, and it is simple: `P(0) > 0 > P(1)`, and `P` decreases and
  then increases on `[0, 1]`, its derivative `4S³ + 6S² − 4S − 4` changing sign once there.
- `S_K(c, d) ⊆ S_K(c', d')` for `c ≤ c'` and `d ≤ d'`.

**Checks.**

- On `[0, √2]` there is a second root `1.221332`, since `P(√2) = 4 + 4√2 − 4 − 4√2 + 2 = 2 > 0`;
  a definition by "the root in `[0, √2]`" does not determine `S₀`, and taking the larger root
  would give `1 − S₀ − S₀² < 0` and `D₁ < 0`.
- `(1/4, 1/4)` is Stark's region of 4.3 and is contained in `(C₁, 0)`'s real part and in
  `S_K(D₁, D₁)` since `D₁ > 1/4`.
- `(0.59110, 1/4)` contains Kadiri's `(1/1.7, 1/4)` region, since `0.59110 > 1/1.7 = 0.58823`
  (lines 52–53), and is unconditional in `d_K` where Kadiri's has a threshold.

Prove Louboutin's Stark-like regions: Stark's conclusion (at most one zero, real and simple) holds
in `S_K(c, d)` for `(c, d) ∈ {(C₁, 0), (D₁, D₁)}` (lines 31–35, Theorem 2),
`{(C₂, 0), (D₂, D₂), (0.59110, 1/4)}` (lines 47–52, Theorem 3), and `(0.10379, 1)` when `d_K > 8`
(line 53). Route: Stark's inequality as in 4.3 with Stechkin's weight `λ` for Theorem 3, the
quartic equation for `S₀` arising from optimising the comparison point.

**Checks.**

- `d_K ≤ 8`: the region `(0.10379, 1)` is not asserted; for `K = ℚ(√5)`, `d_K = 5`, the other
  regions apply.
- `S_K(c, 0)` is a real segment: Stark's conclusion there says at most one real zero, simple.

*Needs:* 4.3's inputs; Mathlib `Polynomial`, the intermediate value theorem.

### 4.5 Kadiri's explicit regions

Prove Kadiri's regions (`kadiri2012` lines 79–82, Theorem 1.1), under
*KadiriDedekindPolynomialCertificate*: there is an absolute `D₀` such that for `d_K ≥ D₀`, `ζ_K` has
no zero with `|t| ≥ 1` and `σ ≥ 1 − 1/(12.55 log d_K + 9.69 n log|t| + 3.03 n + 58.63)`, and at most
one zero, real and simple, with `|t| ≤ 1` and `σ ≥ 1 − 1/(12.74 log d_K)`; and (lines 87–92,
Corollary 1.2): for `d_K ≥ D₀`, at most one zero, real and simple, in each of
`σ ≥ 1 − 1/(2 log d_K)`, `|t| ≤ 1/(2 log d_K)` and `σ ≥ 1 − 1/(1.70 log d_K)`,
`|t| ≤ 1/(4 log d_K)`. Route (de la Vallée Poussin with Stechkin's trick): the nonnegative
degree-four trigonometric polynomial `P₄` of Kadiri applied to `−Re ζ'_K/ζ_K` at `σ + ikt`, the
Hadamard expansion with the explicit gamma terms from the digamma remainders of 1.1a, and the
Stechkin difference `−Re(ζ'_K/ζ_K)(s) + Re(ζ'_K/ζ_K)(s')` between `s` and Stechkin's auxiliary
point `s'` with weight `λ = 1 − 1/√5`; the threshold `D₀` is where the lower-order terms are
absorbed (lines 93–94: the theorems can be made explicit for every `log d_K`, with other
constants).

**Checks.**

- `K = ℚ`, `|t| = 14.13`: the region reads `σ ≥ 1 − 1/(9.69 · 2.648 + 3.03 + 58.63) = 0.9885`,
  weaker than the classical `1 − 1/(5.573 log t) = 0.932`, consistent.
- The two Corollary regions are the `(1/2, 1/2)` and `(1/1.7, 1/4)` Stark-like regions, quoted at
  `louboutin2017` lines 36–37; 4.4 gives `(0.59110, 1/4)` without a threshold.
- The constant `1.62` sometimes attached to these regions is Kadiri's real-zero constant `1.6110`
  rounded up: for `d_K ≥ D₀`, `ζ_K` has at most one real zero in `σ ≥ 1 − 1/(1.6110 log d_K)`
  (`kadiri2012` p. 146, recorded as (1.4) of `dglsw2025`). It is not a target: `1/1.6110 = 0.62073`
  is below Louboutin's `C₂ = 0.620756` of 4.4, whose real region holds without a threshold, and
  4.8 gives the degree-indexed form.
- 4.8 dispenses with the threshold `D₀` in both kinds of region and, for `n ≥ 3` and `|t| ≥ 1`, replaces
  `3.03 n + 58.63` by `−11.59548 n + 4.57803`.

*Needs:* ZerosOfLFunctions 5.6, 6.1, 6.4(4d), 6.5; ExplicitZetaBounds §0.5
(*IsAdmissibleCosinePolynomial*); *KadiriDedekindPolynomialCertificate*; 1.1a; LFunctions Layer 3.

### 4.6 Lee's refinement

Prove Lee's region (`lee2021zerofree` lines 103–105, Theorem 1, arXiv v3), under
*MossinghoffTrudgianF16Certificate*: for every number field `K` and `|t| ≥ 1`, `ζ_K` has no zero
with `σ ≥ 1 − 1/(12.2411 log d_K + 9.5347 n log|t| + 0.05017 n + 2.2692)`; and Lee's one-zero region
(lines 106–109, Theorem 2): there is an absolute `D₁` such that for `d_K ≥ D₁`, `ζ_K` has at most
one zero with `|t| < 1` and `σ ≥ 1 − 1/(12.43436 log d_K)`, real and simple. Route: Kadiri's
argument with the Mossinghoff–Trudgian degree-sixteen polynomial and the improved constants `S(k)`
(lines 110–135).

**Checks.**

- `K = ℚ`, `|t| = 14.13`: `σ ≥ 1 − 1/(9.5347 · 2.648 + 0.05017 + 2.2692) = 0.9637`, consistent.
- Theorem 1 carries no threshold on `d_K` (lines 103–105), unlike Kadiri's. Its quadruple
  `(12.2411, 9.5347, 0.05017, 2.2692)` is that of arXiv v3, and `dglsw2025` §1 records the same
  quadruple for the published version; the rounded `0.0501` of secondary tables would give a
  slightly wider region and is not used. `dglsw2025` records the low-lying constant as `12.44`,
  the rounding up of `12.43436`, so the statement here implies the recorded one.
- `12.43436 < 12.74`: the one-zero region is wider than Kadiri's, as it must be for an
  improvement; it is not wider than the Stark-like `(0.10379, 1)` of 4.4 in the real direction
  (`1/12.43 = 0.0804 < 0.10379`), while it is unbounded in `|t| < 1` where 4.4 caps at
  `1/log d_K`. 4.8 dispenses with the threshold `D₁` of Theorem 2 (Theorem 1.2 there, for every
  `K`), whose constants `11.78180` (`n = 6`) and `11.51910` (`n ≥ 7`) are also below `12.43436`;
  for `2 ≤ n ≤ 5` the constants of 4.8 are larger and the present statement stays the sharper
  one above `D₁`.

*Needs:* 4.5's inputs, with *MossinghoffTrudgianF16Certificate* in place of Kadiri's polynomial.

### 4.7 Stark's explicit lower bound for the residue

Define `starkAlpha K` (Stark's `α(n_K)`, `garcialee2022mertens` lines 1247–1253) as `4` if `K/ℚ`
is Galois, `16` if `K` is not Galois and `HasNormalTower K`, and `4 · n!` otherwise; Garcia–Lee's
tower factor `t_K` is that of 0.5. Let `c₄ = 2 exp(21/8 − ψ(1/2)/(4 log 3))`, Stark's
`2e^{21/8 + c₁/2 − (c₂/8)ψ(1/2)}` with `c₁ = 0`, `c₂ = 2/log 3` and `ψ = Γ'/Γ` (lines 1270–1277;
`ψ(1/2) = −γ − 2 log 2`, so `c₄ = 2 exp(21/8 + (γ + 2 log 2)/(4 log 3))`).

- `starkAlpha K ∈ {4, 16, 4 · n!}` and `t_K ∈ {1, n!}`; `t_K = 1` iff `HasNormalTower K`.
- `starkAlpha K ≤ 16 · t_K` in every case (`4 ≤ 16`, `16 ≤ 16`, `4 · n! ≤ 16 · n!`), so
  `1/(c₄ starkAlpha K) ≥ 1/(16 c₄ t_K) > 0.0014480/t_K`.
- `starkAlpha K ≤ 4 · n!` for `n ≥ 3`, with equality exactly when `K` has no normal tower.

**Checks.**

- `ℚ(ζ₅)` (Galois quartic): `starkAlpha = 4`, `t = 1`; `ℚ(2^{1/4})` (not Galois, normal tower
  `ℚ ⊂ ℚ(√2) ⊂ ℚ(2^{1/4})`): `starkAlpha = 16`, `t = 1`; a non-Galois cubic field (no normal
  tower): `starkAlpha = 4 · 3! = 24`, `t = 6`.
- A definition with only the two cases "Galois: `4`, otherwise: `4 · n!`" would give
  `ℚ(2^{1/4})` the value `96` in place of `16`, and one with `t = 1` for Galois fields only would
  give it `24` in place of `1`.
- The constant: `ψ(1/2) = −1.963510`, so `c₄ = 2 e^{2.625 + 0.446816} = 43.162115`; with the
  rounded `43.2` in its place the normal-tower bound would be `1/(43.2 · 16) = 0.0014468`, below
  the `0.0014480` of the consequences, so the consequences need `c₄` itself.

Prove Stark's residue bound in terms of the real zero near `1`, with a constant independent of the
degree (`stark1974` Lemmas 2–4, in the form quoted as `banks2026brauersiegel` §3.1, Lemma 3.3):
there is an effective constant `c > 0`, the same for every number field, such that every number
field `K ≠ ℚ` satisfies

- `κ_K ≥ c min(1/log d_K, 1 − β) = c (1 − β)` if `ζ_K` has a real zero `β` with
  `1 − 1/(4 log d_K) ≤ β < 1` (there is at most one, and it is simple: the one-zero lemma of 4.3
  in its real form, `louboutin2015ijnt` line 28);
- `κ_K ≥ c/log d_K` if `ζ_K` has no real zero in `[1 − 1/(4 log d_K), 1)`.

Its value is not a target; the explicit clauses below are the numerical forms that Garcia–Lee
derive from Stark's constants. The form for fields of a fixed degree, with a constant that may
depend on it, is AnalyticNumberTheoryPartI §2.31e's; the uniformity in the degree is what 5.7
uses. Route (`stark1974` Lemmas 2–4): with `σ₀ = 1 + 1/(4 log d_K)`,
`log κ_K = log((σ₀ − 1) ζ_K(σ₀)) − ∫_1^{σ₀} (1/(σ − 1) + ζ'_K/ζ_K(σ)) dσ`, where `ζ_K(σ₀) ≥ 1`
and the partial-fraction expansion of 4.3 writes the integrand as
`−1/σ − (1/2) log d_K − (gamma terms) + Σ_ρ Re(1/(σ − ρ))`; the term of the possible real zero
`β` integrates to `log((σ₀ − β)/(1 − β))`, which gives the factor
`(1 − β)/(σ₀ − β) ≥ 2(1 − β) log d_K`, and the other zeros are bounded through the positivity of
`−ζ'_K/ζ_K(σ₀)`. The degree enters only through the gamma terms, which on `1 ≤ σ ≤ 2` are negative
and at least `−(n/2)(log π − ψ(1/2)) > −1.555 n` (1.1a), and `n ≤ (2/log 3) log d_K` for `K ≠ ℚ`
(Mathlib `abs_discr_ge`: `d_K ≥ (4/9)(3π/4)ⁿ ≥ 3^{n/2}` for `n ≥ 3`, and `d_K ≥ 3` for `n = 2`),
so every term is a bounded multiple of `log d_K` with bounds free of `n`: these are the constants
`c₁ = 0`, `c₂ = 2/log 3` of Stark's Lemma 4 that Garcia–Lee use (`garcialee2022mertens`
lines 1270–1277), and `c₄` above depends on nothing else.

**Checks.**

- The case split is needed: at a quadratic `K`, `κ_K = L(1, χ_K)`, so the second clause alone, for
  every `K ≠ ℚ`, would contain the effective bound `L(1, χ_K) ≥ c/log d_K` for every quadratic
  field, the effective exclusion of Landau–Siegel zeros, which Stark's argument does not give
  (this roadmap takes it as *UniformQuadraticZeroGap*, 0.5); with a zero at
  `1 − β = ε/log d_K`, `ε ≤ 1/4`, the first clause asserts only `κ_K ≥ c ε/log d_K`.
- Uniformity, at the worst case of 5.7: for a Galois `K` of degree `n` with a real zero at
  `(1 − β) log d_K = c₀ ≤ 1/4`, the first clause gives `κ_K ≥ c c₀/log d_K` for every `n`, which
  is 5.7's `C = c min(c₀, 1/4)`; with a constant `c_n` depending on `n` the same steps give
  `C = c_n min(c₀, 1/4)`, and 5.7 would not hold as stated.
- The degree bound `n ≤ (2/log 3) log d_K`: at `n = 2` it is `d_K ≥ 3`, an equality at `ℚ(√−3)`;
  at `n = 3`, `(4/9)(3π/4)³ = 5.81 ≥ 3^{3/2} = 5.20` (and the smallest cubic discriminant is
  `23`); at `n = 10`, `2343.8 ≥ 243`; at `K = ℚ` it fails (`log 1 = 0`), one reason for `K ≠ ℚ`.
- The gamma terms at the ends of `[1, 2]`: per real place `(1/2)(ψ(σ/2) − log π)` is `−1.5541` at
  `σ = 1` and `−0.8610` at `σ = 2`; per complex place `ψ(σ) − log 2π` is `−2.4151` and `−1.4151`,
  that is `−1.2075` and `−0.7075` per unit of degree, so the bound `−1.555 n` is attained in the
  limit by totally real fields at `σ = 1`.
- Size of `c`: `ℚ(√5)` and `ℚ(ζ₇)⁺` have no real zero of `ζ_K` in `[1 − 1/(4 log d_K), 1)`
  (4.9, Checks), and `κ_K log d_K` is `0.43041 · 1.60944 = 0.69272` and
  `0.30026 · 3.89182 = 1.16856`; so every valid `c` is at most `0.6927`, while the explicit clause
  below has the constant `1/(4c₄) = 0.0057921` for Galois fields with no quadratic subfield.

Prove Stark's theorem with Garcia–Lee's constants (`garcialee2022mertens` lines 1226–1305): for
`n ≥ 3`,

- `dedekindZeta_residue_gt_stark`: if `K` has no subfield of degree `2`,
  `κ_K > 1/(c₄ · starkAlpha K · log d_K)` (line 1254), with no further hypothesis;
- its consequence through `starkAlpha K ≤ 16 t_K`: if `K` has no subfield of degree `2`,
  `κ_K > 0.0014480/(t_K · log d_K)` (lines 1292–1302);
- for every `c₈ > 0` with *QuadraticRealZeroGap* `c₈`,
  `κ_K > (1/c₄) min(1/(starkAlpha K · log d_K), 1/(c₈ d_K^{1/n}))` (lines 1239–1245);
  consequently, under *QuadraticRealZeroGap* `(π/6)`, `κ_K > 0.0014480/(n · t_K · d_K^{1/n})`
  (line 150, lines 1255–1291: the minimum is at least
  `(1/(c₈ d_K^{1/n})) min(e c₈/(n · starkAlpha K), 1)` by `d_K^{1/n} ≥ (e/n) log d_K`, for every
  `K`, and `e c₈/(n · starkAlpha K) < 1`).

Prove its instance under the uniform gap. For `n ≥ 3` and every `c₀ > 0` with
*UniformQuadraticZeroGap* `c₀`, `κ_K > (1/c₄) min(1/(starkAlpha K · log d_K), e c₀/(2 d_K^{1/n}))`.
Route: *UniformQuadraticZeroGap* `c₀` gives *QuadraticRealZeroGap* `(2/(e c₀))` (0.5), and the
second clause applies with `c₈ = 2/(e c₀)`. The clause under *QuadraticRealZeroGap* `c₈` stays
the target; this is its instance under the uniform gap, whose discharge (4.9) rests on unrefereed
sources.

Route (`stark1974` Lemmas 2–4 and 8, with the constants of `garcialee2022mertens` §3): the
integration of the degree-uniform bound above, with Garcia–Lee's evaluation of its constants,
isolating the possible real zero with the one-zero lemma of 4.3; when the zero is close, Stark's
quadratic subfield `F` of the quadratic-subfield theorem (AnalyticNumberTheoryPartI §2.31e, which
states it without normality as Stark's Lemma 8; the fixed-degree residue bounds of that section
allow ineffective constants and are not used here), the normal-closure discriminant bounds of
§2.31d and the gap hypothesis at `F`.

**Checks.**

- For a Galois cubic field with `d_K = 49` (`ℚ(ζ₇)⁺`, no quadratic subfield): `starkAlpha = 4`,
  and the first clause gives `κ > 1/(43.1621 · 4 · 3.892) = 0.001488`, while
  `κ_K = 2³ R_K/(2 · 7) = 0.3003` (`R_K = 0.525455`, `h = 1`).
- The second clause carries *QuadraticRealZeroGap* `c₈` because the only cited justification of
  `c₈ = π/6` is a remark (`garcialee2022mertens` lines 1277–1279, 1306–1310); Pintz's
  `π/12 + o(1)` is asymptotic. A theorem stating the `d_K^{1/n}` form without the hypothesis would
  assert an unproved claim, while the first clause needs none.
- The normal-tower case of the consequence: `1/(c₄ · 16) = 0.00144803 > 0.0014480`, the margin
  being `3·10⁻⁸`; the Galois and no-tower cases have the larger constants `1/(4c₄) = 0.0057921`
  and `0.0057921/n!`.
- `n ≤ 2` is outside the first clause: a quadratic field is its own subfield of degree `2`, and at
  `K = ℚ` the bound would divide by `log 1 = 0`.
- Under the uniform gap at `c₀ = 1/100` the second term of the minimum is
  `e/(200 d_K^{1/n}) = 0.01359/d_K^{1/n}`: the decay in `d_K` is still the Siegel shape
  `d_K^{−1/n}`; the logarithmic shape for Galois fields is 5.7.

*Needs:* Mathlib `dedekindZeta_residue_def`, `Complex.digamma`, `Real.eulerMascheroniConstant`,
`abs_discr_ge`; 0.5 (*QuadraticRealZeroGap*, *UniformQuadraticZeroGap*, `HasNormalTower`); 1.1a
(the gamma terms); 4.3 (the one-zero lemma and the partial-fraction expansion); for the explicit
clauses AnalyticNumberTheoryPartI §2.31d, §2.31e (Stark's Lemma 8); ZerosOfLFunctions 5.6.

### 4.8 Das–Gaba–Lee–Savalia–Wong's regions

Prove Das–Gaba–Lee–Savalia–Wong's region (`dglsw2025` Theorem 1.1, preprint): for `n ≥ 3` and
`|t| ≥ 1`, `ζ_K(σ + it) ≠ 0` for
`σ ≥ 1 − 1/(12.21124 log d_K + n (9.54177 log|t| − 11.59548) + 4.57803)`; their one-zero region
(Theorem 1.2): for `n ≥ 2`, with
`A(n) = 16.01983, 19.55293, 16.72207, 13.71235, 11.78180, 11.51910` for `n = 2, 3, 4, 5, 6, ≥ 7`,
`ζ_K` has at most one zero with `|t| ≤ 1` and `σ ≥ 1 − 1/(A(n) log d_K)`, and such a zero is real
and simple; and their real-zero region (Theorem 1.4): for `n ≥ 2`, with
`A''(n) = 1.61094, 1.93173, 1.88178, 1.69958, 1.61857, 1.61094` for `n = 2, …, 6, ≥ 7`, `ζ_K` has
at most one real zero in `σ ≥ 1 − 1/(A''(n) log d_K)`. None of the three has a threshold on
`d_K`; each takes *MinimalDiscriminantTable* and *DGLSWPolynomialCertificates* as hypotheses, and
Theorems 1.2 and 1.4 take *DGLSWSmallFieldGRH* as well. The source's Tables 9–11 give
sharper constants for `n ≥ n₀` with `3 ≤ n₀ ≤ 21`; they are not targets. Route (`dglsw2025`
§§2–5): Kadiri's argument of 4.5–4.6 (de la Vallée Poussin with Stechkin's difference between `s`
and an auxiliary point), split by the size of the ordinate into five cases, with two changes: the
gamma-factor bound of `dglsw2025` Lemma 2.1 in place of Lee's, from the digamma remainders of
1.1a, and new nonnegative even trigonometric polynomials with extra free parameters optimised
together with the other parameters (*DGLSWPolynomialCertificates*);
the lower bounds `d_K ≥ d_min(n)` absorb the lower-order terms for every `K`, which dispenses with
the threshold. Simplicity in Theorem 1.2 comes from 4.3: `A(n) > 4`, so the region lies inside
Stark's. At the fields of *DGLSWSmallFieldGRH* that predicate gives Theorems 1.2 and 1.4 directly,
both abscissae lying to the right of `1/2` there, and at `n = 2` Theorem 1.4 follows for every `K`
from Louboutin's `(C₂, 0)` region of 4.4, since `C₂ ≥ 1/A''(2)`.

**Checks.**

- The negative coefficient of `n`: for `n = 3`, `d_K ≥ 23` and at `|t| = 1` the denominator is
  `12.21124 log 23 − 3 · 11.59548 + 4.57803 = 8.08 > 0`, against `40.80` in Lee's 4.6, so the
  region `σ ≥ 0.876` is much wider than `σ ≥ 0.9755` there; at `|t| = 10⁶` the denominators are
  `403.6` and `436.0`.
- Theorem 1.4 and 4.4: `1/A''(2) = 1/1.61094 = 0.620756` equals Louboutin's `C₂` to six digits,
  so at `n = 2` and `n ≥ 7` the two real regions coincide, while for `3 ≤ n ≤ 6`
  (`1/A''(3) = 0.5177`) Louboutin's `(C₂, 0)` region is the wider one; both are kept.
- Theorem 1.2 against Kadiri's `12.74` and Lee's `12.43436` (both for `d_K` beyond a threshold):
  wider for `n ≥ 6`, narrower for `2 ≤ n ≤ 5`, and valid for every `K`.
- *MinimalDiscriminantTable* is not Minkowski's bound: `abs_discr_ge'` gives only `d_K ≥ 13` for
  a cubic field, against the true minimum `23`.
- At the fields of *DGLSWSmallFieldGRH* the predicate gives Theorems 1.2 and 1.4 directly: the
  one-zero abscissa `1 − 1/(A(n) log d_K)` is at least `0.943` (`n = 2`, `d_K = 3`), and the
  real-zero abscissa `1 − 1/(A''(n) log d_K)` is at least `0.835` and `0.888` for `n = 3, 4`
  (`d_K = 23`, `117`), all above `1/2`; at `n = 2` Theorem 1.4 holds for every `K` by Louboutin's
  `(C₂, 0)` region of 4.4, since `C₂ = 0.6207565 ≥ 1/A''(2) = 0.6207556`, which covers `ℚ(√−3)`,
  where `1 − 1/(A''(2) log 3) = 0.435` lies below `1/2`. *MinimalDiscriminantTable* says nothing
  about zeros and does not replace the predicate.
- For `n = 2`, `dglsw2025` §1 notes that Kadiri's region for Dirichlet L-functions gives at most
  one zero in `σ ≥ 1 − 1/(6.44 log(d_K max(1, |t|)))`; that statement belongs to
  ExplicitZetaBounds.

*Needs:* 4.3; 4.4 (the case `n = 2` of Theorem 1.4); ZerosOfLFunctions 5.6, 6.1, 6.4(4d), 6.5;
ExplicitZetaBounds §0.5; 1.1a; LFunctions Layer 3;
*MinimalDiscriminantTable*, *DGLSWSmallFieldGRH*, *DGLSWPolynomialCertificates*.

### 4.9 Real zeros of quadratic Dedekind zeta functions

Prove Guo's gap, *UniformQuadraticZeroGap* `(1/100)` (`guo2026` Theorem 1.1, preprint); and
Banks's gap, under ExplicitZetaBounds §0.4b's `LuZamanZhaoRecord`, *UniformQuadraticZeroGap* `(3/1000)`
(`banks2026siegel` Theorem 1.1, preprint, for `d_F ≥ 10¹⁰`; below `10¹⁰` the record gives
`(1 − β) log d_F > 1/5` through the first instance of ExplicitZetaBounds §7.9). Route:
the `ζ_F` form of the supplier statements: for quadratic `F`, `ζ_F = ζ · L(s, χ_F)` with `χ_F`
primitive of conductor `d_F` (LFunctions Layer 4 `dedekindZetaC_quadratic`), and `ζ` has no zero in
`(0, 1)`; by the agreement of 0.5, the first statement is the field form of Guo's instance
*HasLandauSiegelGap* `(1/100) ∞` of ExplicitZetaBounds §7.9, and the second that of Banks's
instance *HasLandauSiegelGap* `(3.0·10⁻³) ∞` there, given `LuZamanZhaoRecord`, which the second
statement therefore carries. The proofs belong to the supplier; in the sources they compare
the archimedean size of a nonzero interpolation determinant, built over `ℚ(√d)` or over the
biquadratic field `ℚ(√d, √2)`, with its divisibility by the primes that a real zero near `1`
forces to be inert. `openai2026siegel` states the gap with an unspecified effective constant (the
qualitative statement of AnalyticNumberTheoryPartI §0.34), `kerr2026` gives a shorter proof with
an unspecified constant, and `green2026` Theorem 1.1 is the estimate for the sum of `(log p)/p`
over inert primes that drives the argument; none gives a number and none is a target.

Prove, for every `c₀` with `0 < c₀ ≤ 1/4` and *UniformQuadraticZeroGap* `c₀`:

- the Galois real-zero bound: for `K/ℚ` Galois of degree `n ≥ 2`, every real zero `β ∈ (0, 1)` of `ζ_K`
  satisfies `(1 − β) log d_K ≥ c₀`;
- the general real-zero bound: for every `K` of degree `n ≥ 2` whose normal closure `N` has degree `m_N`,
  every real zero `β ∈ (0, 1)` of `ζ_K` satisfies `(1 − β) log d_K ≥ c₀/m_N ≥ c₀/n!`.

Route: for Galois `K`, a real zero with `β > 1 − 1/(4 log d_K)` is simple by 4.3, hence a zero of
`ζ_F` for a quadratic subfield `F` (AnalyticNumberTheoryPartI §2.39), so
`1 − β ≥ c₀/log d_F ≥ c₀/log d_K` by `d_F ≤ d_K` (§2.31d); every other real zero has
`1 − β ≥ 1/(4 log d_K) ≥ c₀/log d_K`. For general `K`, `ζ_N/ζ_K` is entire (§2.39b for the
Galois extension `N/K`), so `β` is a real zero of `ζ_N`, and the Galois case for `N` with
`log d_N ≤ m_N log d_K` (§2.31d) gives the bound. These two statements are the targets; their
instances at `c₀ = 1/100` are corollaries of Guo's gap.

**Checks.**

- The constants: Banks's Remark 7.1 computes `3.069…·10⁻³` for `q ≥ 10¹⁰`, and the computation
  gives `1/5` below `10¹⁰`, so `3/1000` holds for every `F`; Guo's `1/100` is larger and needs no
  computation.
- `ℚ(ζ₇)⁺` (Galois cubic, `d_K = 49`, no quadratic subfield): no real zero of `ζ_K` is simple, so
  there is none in `(1 − 1/(4 log 49), 1) = (0.9358, 1)` without any predicate; the Galois
  statement adds nothing there.
- `ℚ(√5)` and `ℚ(√−3)`: `L(σ, χ)` has no real zero in `(0, 1)`, and both statements are vacuous.
- A non-Galois cubic field (`m_N = 6`) gets `(1 − β) log d_K ≥ c₀/6`; the factor `1/m_N` is the
  cost of passing to the normal closure.
- A version with `c₀ > 1/4` is not asserted: the route uses the alternative
  `1 − β ≥ 1/(4 log d_K)` of 4.3.

*Needs:* 0.5; 4.3; AnalyticNumberTheoryPartI §§2.31d, 2.39, 2.39b; LFunctions Layer 4;
ExplicitZetaBounds §§0.4b, 7.9 (`LuZamanZhaoRecord`, for Banks's gap); Mathlib `normalClosure`.

### 4.10 Zero repulsion

Prove Das–Gaba–Lee–Savalia–Wong's repulsion (`dglsw2025` Theorem 1.3, preprint): for `n ≥ 2` and
`ν ∈ {1/20, 1/2}`, if `ζ_K` has a real zero `β₁ ∈ [1 − ν/log d_K, 1)`, then `ζ_K` has no other
zero with `|t| ≤ 1` and `σ ≥ 1 − 1/(A_ν(n) log d_K)`, where
`A_{1/20}(n) = 2.576574, 3.316475, 2.851720, 2.312646, 1.960456, 1.855168, 1.830414, 1.806471`
for `n = 2, …, 8, ≥ 9` and
`A_{1/2}(n) = 6.036555, 8.253321, 6.422941, 4.668822, 3.659933, 3.644519, 3.576987` for
`n = 2, …, 7, ≥ 8`; and their real repulsion (Theorem 1.5): under the same hypothesis, `ζ_K` has
no real zero other than `β₁` in `σ ≥ 1 − 1/(A''_ν(n) log d_K)`, with
`A''_{1/20}(n) = 0.478632, 0.483802, 0.480747, 0.478632` for `n = 2, 3, 4, ≥ 5` and
`A''_{1/2}(n) = 1.32086, 1.86631, 1.77210, 1.45550, 1.33079, 1.32086` for `n = 2, …, 6, ≥ 7`.
Both take *MinimalDiscriminantTable*, *DGLSWSmallFieldGRH* and *DGLSWPolynomialCertificates*
(4.8); at the fields of *DGLSWSmallFieldGRH* their hypothesis cannot hold, since a real zero
`β₁ ≥ 1 − ν/log d_K ≥ 1 − 1/(2 log 3)` would have `β₁ > 1/2`.

Prove Kadiri–Ng–Wong's repulsion (`kadiringwong2019` Theorems 1.2–1.3 and Corollary 1.3.1, arXiv v1
pp. 1–2): there are absolute constants `D₀` and `κ > 0` such that, for `d_K ≥ D₀`,

- (Theorem 1.2) if `ζ_K` has a real zero `β₁ ≥ 1 − 1/(12.74 log d_K)`, the exceptional zero of
  Kadiri's region of 4.5, every other zero `β' + iγ'` with `β' ≥ 1/2` and `|γ'| ≤ 1` satisfies
  `β' ≤ 1 − log(κ/((1 − β₁) log d_K))/(14.144 log d_K)`;
- (Theorem 1.3) for every real zero `β₁ ∈ (0, 1)` of `ζ_K`, exceptional or not, every other real
  zero `β' ∈ (0, 1)` satisfies `β' ≤ 1 − log(κ/((1 − β₁) log d_K))/(7.071998 log d_K)`;
- (Corollary 1.3.1) consequently there is an absolute `c > 0` with `1 − β₁ ≥ c d_K^{−7.072}` for
  every real zero `β₁ ∈ (0, 1)` of `ζ_K`.

And Kadiri–Ng's repulsion (`kadiring2012` Theorem 4): for `d_K ≥ D₀` and a real zero
`β₁ = 1 − λ₁/log d_K` with `λ₁ < 1/12.74`, every zero `β' + iγ' ≠ β₁` with `|γ'| ≤ 1` has
`(1 − β') log d_K ≥ min(0.6546 log(1/λ₁), (log log d_K)/13.85)`. Route: for `dglsw2025`, the
argument of 4.8 with the exceptional zero kept in the explicit inequality; for
`kadiringwong2019`, Turán's power-sum method with a lower bound for the generalised Fejér kernel
from Harnack's inequality for nonnegative harmonic functions; for `kadiring2012`, Heath-Brown's
smoothed explicit inequality (its Theorem 3) with the weight `φ = (1 − 1/√5)/2`; the corollary of
`kadiringwong2019` applies the real-zero repulsion to `β' = 1 − β₁`.

**Checks.**

- With an exceptional zero at `ν = 1/20` the region `|t| ≤ 1` widens from `A(3) = 19.55293`
  (4.8) to `A_{1/20}(3) = 3.316475`.
- `7.071998 = 14.144/2` up to rounding: real zeros repel twice as strongly in these statements.
- For quadratic `K`, 4.9 under the uniform gap gives `1 − β₁ ≥ c₀/log d_K`, far beyond
  `d_K^{−7.072}`; the repulsion holds for every `K` with no predicate.
- The thresholds of `kadiringwong2019` and `kadiring2012` are absolute and not computed; the
  statements of `dglsw2025` have none.

*Needs:* 4.3, 4.5, 4.8; ZerosOfLFunctions 5.6, 6.4; 1.1a;
*MinimalDiscriminantTable*, *DGLSWSmallFieldGRH*, *DGLSWPolynomialCertificates*.

### Examples

- `N_ℚ(15) = 2`; `150 ≤ N_{ℚ(i)}(100) ≤ 166`.
- `ℚ(ζ₇)⁺`: `ζ_K ≤ 0` on `[0.7246, 1)`, and Stark's bound `κ > 0.001488` against `κ = 0.3003`.
- A cubic field with `d_K = 23`: the region of 4.8 at `|t| = 1` is `σ ≥ 0.876`.

### Dependencies

ZerosOfLFunctions Layers 4–7; LFunctions Layers 3 and 4; Layer 0 (0.5); Layer 1 (1.1, 1.1a);
AnalyticNumberTheoryPartI §§2.31d, 2.31e, 2.39, 2.39b;
ExplicitZetaBounds (§§0.4b, 0.5, 2.1, 2.5, 5.1, 7.9);
*KadiriDedekindPolynomialCertificate*, *MossinghoffTrudgianF16Certificate*,
*DGLSWPolynomialCertificates*, *MinimalDiscriminantTable*,
*DGLSWSmallFieldGRH*.

## Layer 5: class numbers

### 5.1 The `h_K R_K` bounds

Each bound of this section is a residue bound of Layer 3 or of AnalyticNumberTheoryPartI §2.15
multiplied by the class-number formula, which is Mathlib's definition
`κ_K = 2^{r₁}(2π)^{r₂} R_K h_K/(w_K √d_K)`, with `2^{r₁}(2π)^{r₂} = 2ⁿ (π/2)^{r₂}`. Prove the three
`h_K R_K` bounds:

- Louboutin's bound (`louboutin2001` Theorem 1, recalled at `louboutin2005` lines 38–39, p. 560):
  for `n ≥ 2`, `h_K R_K ≤ (w_K/2)(2/π)^{r₂} (e log d_K/(4n−4))^{n−1} √d_K`;
- the zero-dependent bound: if `ζ_K(β) = 0` for some `β ∈ [1/2, 1)`, then
  `h_K R_K ≤ (1 − β) w_K (2/π)^{r₂} (e log d_K/(4n))ⁿ √d_K`;
- the bound with the local factor at `2`: for `n ≥ 3`,
  `h_K R_K ≤ (w_K/2)(2/π)^{r₂} (Π_K(2)/2ⁿ)(e log d_K/(4n−4) · e^{n log 4/log d_K})^{n−1} √d_K`.

**Checks.**

- `K = ℚ(√5)`: `h R = log((1+√5)/2) = 0.4812`, `w = 2`, `r₂ = 0`: the bound is
  `(e log 5/4) √5 = 1.0937 · 2.236 = 2.446`.
- `K = ℚ(i)`: `h R = 1`, `w = 4`, `r₂ = 1`: `2 · (2/π) · (e log 4/4) · 2 = 2.40`;
  `K = ℚ(√−3)`: `3 · (2/π) · (e log 3/4) · √3 = 2.47`.
- The identity `κ_K/2ⁿ = (1/2)(e log d_K/(2n−2))^{n−1}/2^{n−1} = (1/2)(e log d_K/(4n−4))^{n−1}`
  is what moves `2ⁿ` into the base; a form with `(e log d_K/(2n−2))^{n−1}` and the factor `w_K/2ⁿ`
  outside is the same number.

*Needs:* Mathlib `dedekindZeta_residue_def`, `card_add_two_mul_card_eq_rank`;
AnalyticNumberTheoryPartI §2.15; 3.1; 3.2.

### 5.2 Abelian fields

Prove Louboutin's abelian bound (`louboutin2005` lines 42–43, with Ramaré's bounds): for `K/ℚ`
abelian of degree `n ≥ 2`,
`h_K R_K ≤ (w_K/2)(2/π)^{r₂} (log d_K/(4n−4) + (5 − 2 log 6)/4)^{n−1} √d_K`, and its totally real
case: for `K` abelian and totally real, `h_K R_K ≤ (log d_K/(4n−4))^{n−1} √d_K`. Route:
`κ_K = ∏_{1 ≠ χ ∈ X(K)} L(1, χ)` (the residue comparison of CyclotomicClassGroupsAndStickelberger
§3.4), the
bounds
`|L(1, χ)| ≤ (1/2) log f_χ + c_χ` with `c_χ = 0` for even and `5/2 − log 6` for odd `χ`,
`Σ_{χ ≠ 1} log f_χ = log d_K` by the conductor–discriminant formula (`f_1 = 1`), and the
arithmetic–geometric mean inequality over the `n − 1` nontrivial characters; for totally real `K`
every character is even and `w_K = 2`, `r₂ = 0`.

**Checks.**

- `K` imaginary quadratic: the first bound reads `h ≤ w√d_K ((1/2) log d_K + 5/2 − log 6)/(2π)`,
  which is Ramaré's odd bound in the class-number formula `h = w√d_K L(1, χ)/(2π)`; for
  `d_K = 163`, `h ≤ 2 · 12.77 · (2.547 + 0.708)/(2π) = 13.2`, and `h = 1`.
- `K = ℚ(√5)`: `h R = 0.4812 ≤ (log 5/4)√5 = 0.899`, sharper than 5.1's `2.446` by the factor
  `e^{n−1}`.
- `K = ℚ(ζ₅)` (`n = 4`, `r₂ = 2`, `w = 10`, `d = 125`): the constant is
  `(5 − 2 log 6)/4 = 0.3541`, and `5 · (4/π²) · (log 125/12 + 0.3541)³ · √125`
  `= 5 · 0.4053 · 0.7565³ · 11.18 = 9.81 ≥ h R = 0.962`. The base is
  `(1/2)(log d_K/(2n−2) + κ)` with `κ = (5 − 2 log 6)/2 = 0.7082` of `louboutin2005` line 43;
  putting `κ` itself in place of `κ/2` next to `log d_K/(4n−4)` would give `31.0`.

*Needs:* CyclotomicClassGroupsAndStickelberger §3.4; ClassFieldTheory Layer 13
(conductor–discriminant); ExplicitZetaBounds §9.1;
AnalyticNumberTheoryPartI §2.5; Mathlib `IsAbelianGalois`, `Real.geom_mean_le_arith_mean_weighted`.

### 5.3 Bordellès' regulator-free bounds

Prove Bordellès' bounds (`bordelles2002` lines 185–204, Theorems 5.1–5.3; `bordelles2006`
lines 158–161, Theorem 2.2), where in the first, second and fifth forms `b` is any real admissible
for `K` (0.3: every ideal class contains a nonzero integral ideal of norm at most `b`), `b_K` of 0.1
being one. `bordelles2006` states the fifth form in this generality; `bordelles2002` states the
first two at the Minkowski bound, and their proofs (line 344) use the class-number lemma alone, so
they hold for every admissible `b`. Since `max(b_K, 6)` and `max(b_K, 13)` are admissible, the
second form applies to every field of degree `n ≥ 2` and the fifth to every field of degree
`n ≥ 3`.

- `h_K ≤ b (log b + γ + 1/b)^{n−1}` for every `n ≥ 1`;
- `h_K ≤ 2b (log b)^{n−1}` for `n ≥ 2` and `b ≥ 6`, under ExplicitMultiplicativeFunctions'
  *PiltzRangeVerified* `n`;
- `classNumber_le_bordelles`: `h_K ≤ (2^{n−1}/(n−1)!) √d_K (log d_K)^{n−1}` for every `n ≥ 1`;
- its general form: `h_K ≤ ((a+1)/2)^{n−1} √d_K (log d_K)^{n−1}/(n−1)!` for `n ≥ 2` and every
  `a > 0` with `a ≥ 2(n−1)/log d_K` (the previous bullet is `a = 3`);
- `h_K ≤ (b/(n−1)!)(log b + n − 2)^{n−1}` for `n ≥ 3` and every admissible `b ≥ 13`, under
  ExplicitMultiplicativeFunctions' *BordellesPiltzRangeVerified*; at `b = b_K` it reads
  `h_K ≤ (μ_K/(n−1)!)(log(μ_K² d_K)/2 + n − 2)^{n−1} √d_K` for `d_K ≥ 169/μ_K²`.

Route: for the first, second and fifth forms, 0.3 and the Piltz divisor-sum bounds of
ExplicitMultiplicativeFunctions §7.5, with their finite verifications where the bound uses them.
For the third and fourth forms (`bordelles2002` lines 345–359), the Nicolas–Tenenbaum bound of 0.3
and no finite verification: `h_K ≤ Σ_{m ≤ √d_K} τ_n(m)` by the class-number lemma at
`b = √d_K`, which is admissible since `b_K = μ_K √d_K ≤ √d_K` (`μ_K ≤ 1`); at `x = √d_K ≥ 1` the
Nicolas–Tenenbaum bound gives
`(√d_K/(n−1)!)((1/2) log d_K + n − 1)^{n−1}`, and `n − 1 ≤ (a/2) log d_K` turns the base into
`((a + 1)/2) log d_K`; for `a = 3` the condition is `log d_K ≥ 2(n−1)/3`, which Minkowski's bound
`abs_discr_ge'` gives for every `n ≥ 2` (with `2r₂ ≤ n`, its logarithm exceeds `2(n−1)/3` by at
least `0.236`), while `n = 1` is `h_ℚ = 1`. The first form cannot serve here: for `r₂ = 0` and
`d_K → ∞` its ratio to the third tends to `μ_K (n−1)!/4^{n−1} = n!(n−1)!/(nⁿ 4^{n−1})`, which is
`0.90` at `n = 26` and `2.20` at `n = 27`.

**Checks.**

- `K = ℚ(√−14)`, `b = b_K ≈ 4.764`: `4.764 (1.561 + 0.577 + 0.210) = 11.2 ≥ h = 4`; the second
  form needs `b ≥ 6` and does not apply at `b_K`, while at the admissible `b = 6` it gives
  `2 · 6 · log 6 = 21.50 ≥ 4`; the third gives `2 √56 log 56 = 60.2`.
- `K = ℚ`: `b = 1`, `n = 1`: the first form is `1 · (0 + γ + 1)⁰ = 1 = h`, and the third is
  `(1/0!) · √1 · (log 1)⁰ = 1`, with `0⁰ = 1`, an equality.
- `K = ℚ(√5)`, `n = 2`: the general-`a` form at `a = 2/log 5 = 1.243` gives
  `1.121 · 2.236 · 1.609 = 4.03 ≥ 1`; at `a = 3` it is the `2^{n−1}` form.
- The cubic field of discriminant `−23`: the third form gives
  `(4/2) √23 (log 23)² = 2 · 4.796 · 9.832 = 94.3 ≥ h = 1`.
- The fifth form at `n = 2`: `bordelles2006` states its Theorem 2.1 for `n ≥ 3` only, and no
  statement is made at `n = 2`.
- The fifth form below its threshold: the cubic field of discriminant `−23` has
  `b_K = (4/π)(6/27)√23 = 1.357 < 13`, so the instance at `b_K` says nothing there, while the
  admissible `b = 13` gives `h_K ≤ (13/2)(log 13 + 1)² = 82.61 ≥ 1`. A statement restricted to
  `b = b_K` would leave out every field with `b_K < 13`.

*Needs:* 0.1, 0.3 (the class-number lemma and the Nicolas–Tenenbaum bound);
ExplicitMultiplicativeFunctions §7.5 (with *PiltzRangeVerified*, *BordellesPiltzRangeVerified*), for
the first, second and fifth forms only; Mathlib `abs_discr_ge'`.

### 5.4 Cubic and quartic fields

Prove the quartic bound (`cullyhugilltrudgian2021`, Theorem 2 and its corollary, consumed as the
quartic divisor-sum bound of ExplicitMultiplicativeFunctions §7.5): for `n = 4` and every real
`b ≥ 193` admissible for `K` (0.3), under ExplicitMultiplicativeFunctions'
*DivisorPowerRangeVerified* `7560² (6·10⁵)`, `h_K ≤ (1/3) b (log b)³`; at `b = b_K` this needs
`b_K ≥ 193`. Route: the class-number lemma at `b` and the quartic divisor-sum bound at `x = b`.

**Checks.**

- Compared with 5.3's second form `2b (log b)³`, the constant improves by `6`; at `b = 193` both
  need `Σ_{m ≤ 193} τ_4(m) ≤ (1/3) 193 (log 193)³ = 9376.9`, and the actual sum is `9333`.
- `b < 193` is excluded; `ℚ(ζ₅)` has `b_K = (4/π)²(24/256)√125 = 0.15198 · 11.180 = 1.699`, so
  the bound reaches it only at an admissible `b ≥ 193`, where `b = 193` gives `h ≤ 9376.9` (its
  `h = 1`).
- The hypothesis names the finite verification of the divisor remainder, not a verification about
  `K`.

Prove the cubic bound (0.3 with Tudzi's remainder of ExplicitMultiplicativeFunctions §7.9): for
`n = 3` and every real `b ≥ 2` admissible for `K` (0.3), under its *PiltzRemainderRangeVerified*
`3 2 (1.1·10¹⁰)`, `h_K ≤ b P₃(log b) + 2.968 b^{2/3} (log b)^{1/3}`, with
`P₃(y) = y²/2 + (3γ − 1)y + 3γ² − 3γ − 3γ₁ + 1`; at `b = b_K` this needs `b_K ≥ 2`. Route:
`h_K ≤ Σ_{m ≤ b} τ_3(m)` (0.3) and the remainder bound.

**Checks.**

- At `b = 1000`: `Σ_{m ≤ 1000} τ_3(m) = 29425`, the bound is `29964.2`, and 5.3's fifth form
  `(b/2)(log b + 1)²` is `31266.3`; at `b = 100`: `1471` against `1552.3` and `1570.9`. At
  `b = 10` the new bound (`66.4`) is above `(b/2)(log b + 1)² = 54.5`, so neither form dominates.
- A cubic field has `b_K = (4/π)^{r₂}(2/9)√d_K`, so `b_K = 1000` needs `d_K ≈ 1.25·10⁷` when
  `r₂ = 1`; the cubic field of discriminant `−23` has `b_K = 1.357 < 2`, and at the admissible
  `b = 2` the bound is `6.64`, against `Σ_{m ≤ 2} τ_3(m) = 1 + 3 = 4` and `h = 1`.
- The polynomial is the residue of `ζ(s)³ xˢ/s` at `s = 1` in the convention
  `ζ(s) = 1/(s − 1) + γ − γ₁(s − 1) + …`; with the opposite sign of `γ₁` the constant would be
  `0.0494`, and the remainder at `x = 10⁶` would be `4.4·10⁵`, beyond Tudzi's bound `7.1·10⁴`.

*Needs:* 0.1, 0.3; ExplicitMultiplicativeFunctions §§7.5, 7.9 (with
*DivisorPowerRangeVerified*, *PiltzRemainderRangeVerified*).

### 5.5 Relative class numbers: the upper bound

Prove Louboutin's bound for `L(1, η_K)` and `relativeClassNumber_le` (`louboutin2000`
Corollary 3, quoted at `louboutin2003` lines 603–605, where it is cited as [Lou7, Corollary 3]):
for `K` CM of degree `2n` and `Q = d_K/d_{K⁺}`, `L(1, η_K) ≤ 2 (e log Q/(2n))ⁿ` and equivalently,
by 0.4, `h⁻_K ≤ 2 Q_K w_K √Q (e log Q/(4πn))ⁿ`. Route: the positive Mellin comparison of §2.15a
for `Λ_K` and `Λ_{K⁺}` with `Λ_K = Λ_{K⁺} Λ(·, η_K)`, the odd completion
`Λ(s, η_K) = Q^{s/2} Γ_ℝ(s+1)ⁿ L(s, η_K)` of 0.4, optimised at `s = 1 + 2n/log Q`.

**Checks.**

- `K = ℚ(i)`: `2 · 1 · 4 · 2 · (e log 4/(4π))¹ = 16 · 0.2999 = 4.80 ≥ h⁻ = 1`;
  `K = ℚ(√−3)`: `2 · 6 · √3 · (e log 3/(4π)) = 4.94`; `d_K = 163`: `2 · 2 · 12.77 · 1.102 = 56.3`;
  `K = ℚ(√−5)` (`h⁻ = 2`, `w = 2`, `Q = 20`): `4 · √20 · (e log 20/(4π)) = 11.59 ≥ 2`.
- `K = ℚ(ζ₈)`: `Q = 32`, `n = 2`: `2 · 8 · √32 · (e log 32/(8π))² = 90.5 · 0.1405 = 12.7 ≥ 1`, and
  `L(1, η) = 0.8724 ≤ 2 (e log 32/4)² = 11.1`.
- The exponent is `n`, not `n − 1`: the character is nontrivial and no pole is cancelled, exactly
  as in 3.1.

*Needs:* 0.4; AnalyticNumberTheoryPartI §2.15a, §2.22; LFunctions Layer 5.

### 5.6 Relative class numbers: lower bounds

Define `v_n = (n/(n−1))^{n−1}` for `n ≥ 2` and `v_1 = 1`, with `2 ≤ v_n < e` for `n ≥ 2`
(`louboutin2003` line 282). For a totally real abelian field `k` of degree `n`, define
`B_k = ∏_{1 ≠ χ ∈ X(k)} (log f_χ)/2` over the nontrivial primitive characters of `k`
(`louboutin2003` line 310, (9), with `κ₁ = 0`, which line 368 permits by Ramaré's bound); the
empty product gives `B_ℚ = 1`.

- `v_n` increases to `e`: `v_2 = 2`, `v_3 = 2.25`, `v_n → e`.
- `κ_k ≤ B_k` (`louboutin2003` line 316, (10)): `κ_k = ∏_{1 ≠ χ} L(1, χ)` by the residue
  comparison of CyclotomicClassGroupsAndStickelberger §3.4, every `χ` is even (0.4a), and
  `|L(1, χ)| ≤ (1/2) log f_χ` by ExplicitZetaBounds §9.1.
- `B_k ≤ (v_n/2^{n−1}) (log ρ_k)^{n−1}` for `n ≥ 2` (lines 321–330): the arithmetic–geometric mean
  inequality and `Σ_{χ ≠ 1} log f_χ = log d_k` (conductor–discriminant).
- If `ζ_k(β) = 0` for some `β ∈ [1/2, 1)`, then `κ_k ≤ (1 − β) (log f_k/4) B_k` (line 318, (11)),
  from `|L(1, χ)| ≤ ((1 − β)/8) log² f_χ` for an even primitive `χ ∈ X(k)` with `L(β, χ) = 0`,
  which exists by the Euler product of continued functions of 0.4a (`louboutin2003` lines
  337–339, Lemma 7(2), quoting `louboutin2001` Theorem 7), and `f_χ ≤ f_k`.

**Checks.**

- `k = ℚ`: `B_ℚ = 1 = κ_ℚ`; a definition over all of `X(k)`, the trivial character included, would
  contain the factor `(log 1)/2 = 0` and give `B_k = 0 < κ_k` for every `k`.
- `k = ℚ(√5)`: `X(k) = {1, χ₅}`, `B_k = (log 5)/2 = 0.8047 ≥ κ_k = 0.4304`.
- `k = ℚ(ζ₇)⁺` (two cubic characters of conductor `7`):
  `B_k = ((log 7)/2)² = 0.94664 ≥ κ_k = 0.3003`, and the mean-value bound `(v_3/4)(log 49^{1/3})² = 0.5625 · 1.68291 = 0.94664`
  is attained, since the two conductors are equal; a definition with the conductor `f_k` of the
  field in place of each `f_χ` agrees here but not for `ℚ(√5, √13)`, whose characters have
  conductors `5, 13, 65`.

Define *NoImaginaryQuadraticRealZero* `K c D` as: for every imaginary quadratic subfield `F ⊆ K`
and every `β ∈ [1 − c/log D, 1)`, `ζ_F(β) ≠ 0`.

- It is vacuous when `K` has no imaginary quadratic subfield; it is antitone in `c`: it holds at
  `c` whenever it holds at some `c' ≥ c` (with the same `D > 1`).
- On `(0, 1)`, `ζ_F(β) = ζ(β) L(β, χ_F)` and `ζ(β) < 0`, so the condition there is
  `L(β, χ_F) ≠ 0`; it is implied on `(0, 1)` by *ImaginaryQuadraticRealZeroGap* `c₀` whenever
  `c/log D < 1/(c₀ √d_F)` for every imaginary quadratic `F ⊆ K` (the gap leaves the open interval
  `(1 − 1/(c₀ √d_F), 1)` zero-free).

**Checks.**

- `K = ℚ(ζ₅)`: its only quadratic subfield is `ℚ(√5)`, which is real, so the predicate is
  vacuous; a definition over every quadratic subfield would ask about `L(s, χ₅)`.
- `K = ℚ(i)`, `c = 2`, `D = d_K = 4`: the interval is `[1 − 2/log 4, 1) = [−0.443, 1)`; on
  `(0, 1)`, `L(β, χ₋₄) > 0`; `ζ_F(0) = ζ(0) L(0, χ₋₄) = (−1/2)(1/2) = −1/4`; and on
  `[−0.443, 0)`, `ζ < 0` and `L(β, χ₋₄) ≠ 0` by the functional equation, so the predicate holds.
- Direction: the predicate at `c = 2` asks about a longer interval than at `c₂ = 1.0718`
  (`[1 − 2/log D, 1) ⊃ [1 − 1.0718/log D, 1)`), so Theorem 9's hypothesis with `c = 2` for
  abelian `K` implies the one with `c₂`, not conversely.

Prove the passage from the uniform gap. If `0 < c₀ ≤ 1/4`, *UniformQuadraticZeroGap* `c₀`,
`c > 0`, `D > 1`, and `c log d_F < c₀ log D` for every imaginary quadratic `F ⊆ K`, then
*NoImaginaryQuadraticRealZero* `K c D`. Route: `c/log D < c₀/log d_F < 1`, so
`[1 − c/log D, 1) ⊆ (0, 1)`, and a real zero `β` of `ζ_F` there would have
`1 − β ≤ c/log D < c₀/log d_F`. Consequently, under the uniform gap, the zero hypotheses of
Theorems 9 and 12 below hold as soon as `c log d_F < c₀ log d_K`, respectively
`c₁ log d_F < c₀ log d_N`, for every imaginary quadratic `F ⊆ K`. Theorems 9, 12 and 13 keep their
conditional form; this lemma is how the uniform gap enters.

**Checks.**

- Degrees: for `K` CM of degree `2n` and an imaginary quadratic `F ⊆ K`, `d_F^n ≤ d_K`, so the
  condition with `D = d_K` holds once `n > c/c₀`: at `c₀ = 1/100` for `n ≥ 108` when `c = c₂` and
  for `n ≥ 201` when `c = 2`. In the latter range Theorem 13's hypothesis of a common zero in
  `[1 − 2/log d_K, 1)` cannot be met, and Theorem 13 is vacuous there.
- `K = ℚ(i)`, `F = K`: `c log 4 < c₀ log 4` fails for every `c ≥ c₀`, and nothing is concluded,
  consistently with the interval `[1 − 2/log 4, 1)` reaching below `0`, where the gap says
  nothing.

With `k = K⁺`, `ρ_k = d_k^{1/n}`, `ρ_K = d_K^{1/(2n)}`, and `(12)`, `(13)` the inequalities

- `(12)`: `h⁻_K ≥ c Q_K w_K √(d_K/d_k) / (2π e^{c/2} v_n (πe log ρ_k)^{n−1} log d_K)`,
- `(13)`: `h⁻_K ≥ c Q_K w_K √(d_K/d_k) / (e^{c/2} (2π)ⁿ B_k log d_K)`,

prove Louboutin's lower bounds:

- under *CMPositivity* (lines 475–479, Theorem 11): for `K` CM of degree `2n ≥ 2` with
  *CMPositivity* `K` and `ρ_K ≥ max(ϱ(n), ϱ_∅(n))` (the thresholds of 3.4 at `m = n`: `2600` for
  `2n = 2`, `50` for `2n = 4`, `26`, `22`, `21` for `2n = 6, 8, 10`, and `2π²` for `2n ≥ 12`),
  `(12)` with `c = 2`, and if `k` is abelian, `(13)` with `c = 2`. The source states Theorem 11
  without the root-discriminant threshold, but its proof applies 3.4(1)–(2) with `S = ∅`, which
  need it, as Theorem 9 does with `ρ_K ≥ 50`;
- for normal fields (lines 399–427, Theorem 9): for `K` normal CM of degree `2n > 2`, `ρ_K ≥ 50`,
  with `c₂ = 2(√3 − 1)²` and *NoImaginaryQuadraticRealZero* `K c₂ d_K`, `(12)` with `c = c₂`; and
  if `k` is abelian and *NoImaginaryQuadraticRealZero* `K c d_K` with `c = 2` for `K` abelian and
  `c = c₂` otherwise, `(13)` with that `c`;
- through the normal closure (lines 481–492, Theorem 12): for `K` CM of degree `2n > 2`,
  `ρ_K ≥ 2800`, `N` the normal closure, `m_N = [N:ℚ]`, `c₁ = 2(√2 − 1)²`, and: for every imaginary
  quadratic `F ⊆ K` and `β ∈ [1 − c₁/log d_N, 1)`, `ζ_F(β) = 0 → ζ_K(β) ≠ 0`,
  `h⁻_K ≥ c₁ Q_K w_K √(d_K/d_k) / (4 n m_N e^{c₁/2} (πe log ρ_K)ⁿ)`;
- at a common zero (lines 503–514, Theorem 13): for `K` CM of degree `2n > 4`, `ρ_K ≥ 2800`, an
  imaginary quadratic `F ⊆ K` and `β ∈ [1 − 2/log d_K, 1)` with `ζ_F(β) = ζ_K(β) = 0`, under
  *ImaginaryQuadraticRealZeroGap* `(π/6)`,
  `h⁻_K ≥ (6/(π²e²)) (d_K/d_k)^{1/2 − 1/n} / (πe log ρ_K)^{n−1}`. Theorem 13 uses the gap only at
  the imaginary quadratic `F` (`louboutin2003` lines 359–360, Lemma 8(5)), so the all-quadratic
  *QuadraticRealZeroGap* `(π/6)`, which implies it, is not assumed.

Route: `h⁻_K = Q_K w_K √(d_K/d_k) κ_K/((2π)ⁿ κ_k)` (0.4), the upper bounds
`κ_k ≤ v_n (e log ρ_k/2)^{n−1}` (§2.15 rewritten with `log d_k = n log ρ_k`) and
`κ_k ≤ (1 − β)(e log d_k/(2n))ⁿ` (3.1) for `(12)`, the abelian bounds `κ_k ≤ B_k` and
`κ_k ≤ (1 − β)(log f_k/4) B_k` above for `(13)`, and the lower bounds of 3.4 for `κ_K` under
`ζ_K(β) ≤ 0` (3.4(2) with `S = ∅` at `β = 1 − c/log d_K`, and 3.4(1) with `S = ∅` at a real zero
of `ζ_k`); the case split of Lemma 8 (lines 341–356): either `ζ_K ≤ 0` on `[1 − c/log d_K, 1)`, or
`ζ_k` has a real zero there, or a common real zero with an imaginary quadratic subfield, which the
hypothesis excludes; for normal `K` the simple real zero comes from a quadratic subfield by
Heilbronn's theorem (§2.39) and the multiplicity bound of 4.3, and for Theorem 12 the same through
the normal closure, Aramata's theorem (§2.39b) and `d_N ≤ d_K^{m_N}`, `m_N ≤ (2n)!` (§2.31d); for
Theorem 13, the gap hypothesis at `F` gives `1 − β ≥ 6/(π√d_F)`, `√d_F ≤ ρ_K` (since
`d_F^n ≤ d_K`), 3.4(4) gives `κ_K ≥ (1−β) e^{−1}`, and `√(d_K/d_k)/ρ_K ≥ (d_K/d_k)^{1/2 − 1/n}`.

**Checks.**

- `n = 1` in Theorem 11: `K` imaginary quadratic, `k = ℚ`, `v_1 = 1`, `ρ_k = 1`, `log ρ_k = 0` and
  `(πe log ρ_k)⁰ = 1`: `(12)` reads `h ≥ 2 w √d_K/(2π e log d_K)`, that is
  `L(1, χ) ≥ 2/(e log d_K)`, asserted for `d_K = ρ_K² ≥ 2600² = 6.76·10⁶` under *CMPositivity*,
  which here says `L(σ, χ) ≥ 0` on `(0, 1)`.
- Negative control for the threshold: `K = ℚ(√−3)` satisfies *CMPositivity* (0.5, Checks), with
  `Q = 1`, `w = 6`, `d_K = 3`; `(12)` with `c = 2` would give
  `h ≥ 2 · 6 · √3/(2π e log 3) = 20.785/18.763 = 1.108 > 1 = h`, and `(13)` with `B_ℚ = 1` gives
  the same `1.108`. The threshold excludes it (`ρ_K = √3 < 2600`). At `d_K = 163`
  (`ρ_K = 12.77`, also excluded) the right side of `(12)` is `0.587`.
- The second inequality of `(12)` (lines 409–413),
  `h⁻_K ≥ (c/(2n v_n e^{c/2−1})) (√ρ_K/(πe log ρ_K))ⁿ`, follows from `Q w ≥ 2`,
  `√(d_K/d_k) ≥ ρ_K^{n/2}`, `log d_K = 2n log ρ_K` and `ρ_k ≤ ρ_K`; it is a corollary, not a
  separate target.
- Theorem 13's bound has `(πe log ρ_K)^{n−1}` in the denominator: at `n = 3`, `ρ_K = 2800`,
  `d_K/d_k ≥ ρ_K³`, the bound is `0.0823 · 53.0/4597 ≈ 9.5·10⁻⁴`, and it grows with `ρ_K`; the
  same expression with the power in the numerator would force `h⁻ > 20000` for every such field.
- The thresholds are `ρ_K ≥ 2800`, that is `d_K ≥ 2800^{2n}`; a threshold `d_K ≥ 2800ⁿ` is a
  different, weaker hypothesis under which nothing is asserted.

*Needs:* 0.4, 0.5 (*CMPositivity*, *ImaginaryQuadraticRealZeroGap*, *UniformQuadraticZeroGap*);
3.1, 3.4; 4.3; 5.2's route; AnalyticNumberTheoryPartI §§2.15, 2.31d, 2.39, 2.39b; 0.4a;
CyclotomicClassGroupsAndStickelberger §3.4; ClassFieldTheory Layer 13 (conductor–discriminant);
ExplicitZetaBounds §9.1; `louboutin2001` Theorem 7 (by locator, through `louboutin2003`
Lemma 7(2)); Mathlib `normalClosure`.

### 5.7 An effective Brauer–Siegel bound for Galois fields

Prove Banks's effective Brauer–Siegel bound (`banks2026brauersiegel`, main theorem at the base
field `ℚ`, preprint): for every `c₀ > 0` with *UniformQuadraticZeroGap* `c₀` there is `C > 0` such
that every Galois `K/ℚ` of degree `n ≥ 2` satisfies `h_K R_K ≥ C √d_K/((2π)ⁿ log d_K)`;
equivalently `κ_K ≥ C 2^{r₁}(2π)^{r₂}/(w_K (2π)ⁿ log d_K)`. The constant depends only on `c₀` (the
hypothesis is a predicate), and the proof is effective; the source gives no numerical value, and
an explicit `C` is not a target. Route (`banks2026brauersiegel` §3.1, Lemma 3.3 and the proof of
Theorem 1.3(ii), pp. 9–10, at the base field `ℚ`, where the source's `η_ℚ` is `1` since `ζ` has no
zero in `(0, 1)`): replacing `c₀` by `min(c₀, 1/4)`, which *UniformQuadraticZeroGap* allows since it
is antitone in `c`, 4.9's Galois real-zero bound gives `(1 − β) log d_K ≥ c₀` for every real zero
`β ∈ (0, 1)` of `ζ_K`; the degree-uniform Stark bound of 4.7 (`stark1974` Lemmas 2–4, in the form
`κ_K ≥ c min(1/log d_K, 1 − β)` of `banks2026brauersiegel` Lemma 3.3, with `c` the same for every
number field) then gives `κ_K ≥ c c₀/log d_K`: from `1 − β ≥ c₀/log d_K` if `ζ_K` has a real zero
`β ≥ 1 − 1/(4 log d_K)`, and from `c/log d_K ≥ c c₀/log d_K` if it has none; and Mathlib's
`κ_K = 2^{r₁}(2π)^{r₂} R_K h_K/(w_K √d_K)` with `w_K ≥ 1` and `2^{r₁}(2π)^{r₂} ≤ (2π)ⁿ` gives the
bound with `C = c min(c₀, 1/4)`. The source's uniform bound for Chebotarev sums (its Theorems
1.4–1.5) enters only through its proof of the gap (its Theorem 1.1 and Corollary 1.2), which this
statement takes as the hypothesis *UniformQuadraticZeroGap* `c₀`. The non-Galois case, the forms
over a base field `k ≠ ℚ` with the source's constant `c(k)`, and the Artin-L generalisation of
`cholemkeoliverzaman2025` are not stated; the ineffective Brauer–Siegel theorem stays with
AnalyticNumberTheoryPartI.

**Checks.**

- `K` imaginary quadratic: `R_K = 1` and the bound reads `h_K ≥ C √d_K/(4π² log d_K)`, the
  effective form of Siegel's theorem, equivalent to `L(1, χ_K) ≥ C'/log d_K`.
- `K = ℚ` is excluded: `log d_ℚ = 0`.
- The constant at Guo's `c₀ = 1/100` is `C = c/100`, the source's `c₃(ℚ) = c₂ min(1/4, c(ℚ), η_ℚ)`
  with `c(ℚ) = 1/100` and `η_ℚ = 1`; when `ζ_K` has no real zero in Stark's rectangle the residue
  bound is `c/log d_K`, larger than `c c₀/log d_K`, so the worst case of the route is a real zero
  with `(1 − β) log d_K = c₀`.
- Against 4.7 under the same predicate: Stark's second clause decays like `d_K^{−1/n}`, this one
  like `(log d_K)^{−1}`, for Galois `K` only.

*Needs:* 0.5 (*UniformQuadraticZeroGap*); 4.7 (the degree-uniform Stark bound); 4.9 (the Galois
real-zero bound); Mathlib `dedekindZeta_residue_def`,
`classNumber`, `Units.regulator`.

### Examples

- `ℚ(√5)`: `h R = 0.4812`, bounds `2.446` (5.1) and `0.899` (5.2).
- `ℚ(√−14)`: `h = 4`, Bordellès' first bound `11.2`, the third `60.2`.
- `ℚ(ζ₈)`: `h⁻ = 1`, upper bound `12.7`.

### Dependencies

Layers 0 (with 0.4a), 3, and 4.3, 4.7, 4.9; AnalyticNumberTheoryPartI §§2.5, 2.15, 2.15a, 2.22,
2.31d, 2.39, 2.39b; ClassFieldTheory Layer 13; CyclotomicClassGroupsAndStickelberger §3.4;
ExplicitMultiplicativeFunctions §§7.5, 7.9; ExplicitZetaBounds §9.1.

## Layer 6: least primitive roots

### 6.1 Vinogradov's sieve identity

Prove Vinogradov's identity for generators: for a finite cyclic group `G` of order `m` and
`x ∈ G`,
`1_{⟨x⟩ = G} = (φ(m)/m) Σ_{d ∣ m} (μ(d)/φ(d)) Σ_{χ : G →* ℂˣ, orderOf χ = d} χ(x)`, and its
instances for `(ZMod p)ˣ` and `(ZMod (p²))ˣ` with Dirichlet characters (`mcgowntrevinotrudgian2016`
lines 84–95; `kerrmcgowntrudgian2020` lines 90–113 give the sieved form of 6.3). Route: `x`
generates `G` iff no prime `q ∣ m` has `x ∈ G^q`; the indicator of `G^q` is `(1/q) Σ_{χ^q = 1} χ`,
and inclusion–exclusion over the squarefree divisors with `Σ_{χ^d = 1} χ = Σ_{e ∣ d} Σ_{ord χ = e} χ`
gives the Möbius coefficients.

**Checks.**

- `G` trivial (`m = 1`): the only element generates, and the right side is `1 · 1 · 1 = 1`.
- `G = ℤ/2`: generators `{1}`; at `x = 1`: `(1/2)(1 + (−1)(−1)) = 1`; at `x = 0`:
  `(1/2)(1 + (−1)(1)) = 0`.
- `G = ℤ/6`: `φ(6)/6 = 1/3`; at `x = 1` the sum is
  `1 + (−1)(−1) + (−1/2)(ω + ω²) + (1/2)(−ω − ω²) = 1 + 1 + 1/2 + 1/2 = 3`, giving `1`; at `x = 2`
  (order `3`): `1 + (−1)(1) + (−1/2)(ω² + ω) + (1/2)(ω² + ω) = 0`.
- A non-cyclic group (`ℤ/2 × ℤ/2`, `m = 4`) has no generators and is outside the statement: the
  formula would give `(φ(4)/4)(1 + (μ(2)/φ(2)) Σ_{ord χ = 2} χ(x)) = (1/2)(1 − Σ_{χ ≠ 1} χ(x))`
  (the term `d = 4` has `μ(4) = 0`), which is `(1/2)(1 − 3) = −1` at `x = 0` and `(1/2)(1 + 1) = 1`
  at each `x ≠ 0`, not the indicator `0`.

*Needs:* Mathlib `IsCyclic`, `MonoidHom`, `orderOf`, `ArithmeticFunction.moebius`, `Nat.totient`,
character orthogonality for finite abelian groups.

### 6.2 Interval counts

With `S(X) = X Σ_{q ≤ X} φ(q)/q − Σ_{q ≤ X} φ(q)` and `T(X) = Σ_{q ≤ X} φ(q)`
(`mcgowntrudgian2020` lines 284–297), prove McGown–Trudgian's interval count (`mcgowntrudgian2020`
lines 201–234, Proposition 3): under *McGownTrudgianMoebiusChecks* and the finite verifications
under which ExplicitMultiplicativeFunctions §§2.3, 2.5 and 7.1 state the four bounds its route
uses, *MoebiusDivRangeVerified* (with *MoebiusAbsIntegralLE* and the inputs of that roadmap's
§§1.5 and 1.7), *MoebiusRangeVerified* with `MoebiusTableVerified`, *SquarefreeRangeVerified*,
*SquarefreeRangeVerifiedNat* and *SquarefreeReciprocalRangeVerified*, at the instances listed in
*Computational hypotheses* (every later theorem of this layer that uses the interval count carries
them with *McGownTrudgianMoebiusChecks*), for a prime `p`, real `H ∈ (0, p)`, an integer `h ≥ 2`,
`X = H/h ≥ 2` with `2HX < p`, the intervals `I(q, t) = (tp/q, (tp + H)/q − h + 1]` and
`J(q, t) = [(tp − H)/q, tp/q − h + 1)` for `0 ≤ t < q ≤ X`, `gcd(t, q) = 1`, are pairwise disjoint
subsets of `[−H, p − H)`; for `0 ≤ m < h`, `z ∈ I(q, t)` gives `q(z + m) − tp ∈ (0, H]` and
`z ∈ J(q, t)` gives `q(z + m) − tp ∈ [−H, 0)`; and the number `N(X)` of integer points in their
union satisfies `A(X) (6/π²) X² h ≤ N(X) ≤ B(X) (6/π²) X² h` with `A(X) = 1 − 2π²/(9X)` and
`B(X) = 1 + 2π²/(9X) + 1/h + π² log X/(3hX)`. Route: each interval has between `H/q − h` and
`H/q − h + 1` integers, so `2hS(X) ≤ N(X) ≤ 2hS(X) + 2T(X)`, and `S(X)` and `T(X)` are evaluated
with the Möbius-sum estimates `|S − 3π^{−2}X²| ≤ (2/3)X` for `X ≥ 1` and `|T − 3π^{−2}X²| ≤ X log X`
for `X ≥ 2` (lines 300–353), whose initial ranges are *McGownTrudgianMoebiusChecks*; beyond them
(`X ≥ 38`, `X ≥ 1000`) the source expands `S` and `T` into Möbius sums and bounds them by Ramaré's
`|Σ_{d ≤ X} μ(d)/d| ≤ 1/10` for `X ≥ 7`, the tail bound `|Σ_{d > X} μ(d)/d²| ≤ 1/X`, Cipu's
`Σ_{d ≤ X} μ²(d) ≤ 6X/π² + 0.679091 √X` and `Σ_{d ≤ X} μ²(d)/d ≤ (6/π²) log X + 2`
(ExplicitMultiplicativeFunctions §§2.3, 2.5, 7.1).

**Checks.**

- *McGownTrudgianMoebiusChecks* at its first points: `S(1) = 1 · 1 − 1 = 0` and
  `|0 − 3/π²| = 0.304 ≤ 2/3`; `T(2) = φ(1) + φ(2) = 2` and `|2 − 12/π²| = 0.784 ≤ 2 log 2 = 1.386`.
  With `X Σ_{q ≤ X} φ(q)/q` alone in place of `S(X)` the first would read
  `|1 − 0.304| = 0.696 > 2/3`.
- `X = 2`: the pairs `(t, q)` with `0 ≤ t < q ≤ 2` and `gcd(t, q) = 1` are `(0, 1)` and `(1, 2)`,
  that is `(q, t) = (1, 0)` and `(2, 1)` (`(t, q) = (0, 2)` has `gcd = 2`);
  `A(2) = 1 − π²/9 = −0.097 < 0`, so the lower bound is vacuous at the threshold, and
  `B(2) = 1 + 1.097 + 1/h + 1.140/h`.
- `h = 2`, `H = 4`, `p = 101` (`X = 2`, `2HX = 16 < 101`): `I(1, 0) = (0, 3]`, `J(1, 0) = [−4, −1)`,
  `I(2, 1) = (50.5, 51.5]`, `J(2, 1) = [48.5, 49.5)`: four disjoint intervals
  with `3 + 3 + 1 + 1 = 8` integers; `B(2) = 3.1667` and
  `B(2) (6/π²) X² h = 3.1667 · 0.6079 · 8 = 15.40 ≥ 8`; here `S(2) = 2(1 + 1/2) − 2 = 1` and `T(2) = 2`, and `2hS = 4 ≤ 8 ≤ 2hS + 2T = 8`.
- `2HX ≥ p` is excluded: with `p = 7`, `H = 4`, `h = 2` (`2HX = 16 > 7`), the interval
  `[(p − H)/2, (p + H)/2] = [1.5, 5.5]` of `(q, t) = (2, 1)` meets `[−4, 4]` of `(1, 0)`, and
  disjointness fails: `2` lies in `J(2, 1) = [1.5, 2.5)` and in `I(1, 0) = (0, 3]`.

*Needs:* Mathlib `ArithmeticFunction.moebius`, `Nat.totient`, `Int.floor`;
*McGownTrudgianMoebiusChecks*; ExplicitMultiplicativeFunctions §§1.2, 2.3, 2.5 and 7.1 (the bounds
for `Σ_{d ≤ X} μ(d)/d`, `Σ_{d > X} μ(d)/d²`, `Σ_{d ≤ X} μ²(d)` and `Σ_{d ≤ X} μ²(d)/d`, with the
finite verifications of its Layer 0.7 named above).

### 6.3 The least primitive root modulo `p`

For integers `0 ≤ s < ω` put `δ_{ω,s} = 1 − Σ_{ω−s < i ≤ ω} 1/q_i`: when `e` is the product of the
`ω − s` smallest primes dividing `p − 1` (so `2 ∣ e`) and `ω(p − 1) = ω`, the `s` primes dividing
`p − 1` but not `e` are at least `q_{ω−s+1}, …, q_ω`, and `δ ≥ δ_{ω,s}`.

Prove McGown–Trudgian's main criterion (lines 421–430, Theorem 3): under
*McGownTrudgianMoebiusChecks* (through 6.2), for an odd prime `p`, an even divisor `e` of
`p − 1`, the primes `p₁, …, p_s` dividing `p − 1` but not `e`, `δ = 1 − Σ 1/p_i > 0`, integers
`r ≥ 1` and `h ≥ 2` and real `H ≥ 2h` with `2H² < hp`, `X = H/h` (`mcgowntrudgian2020` lines 416
and 423: `r, h` positive integers with `h ≥ 2`): if
`(π²/6) B(X)^{2r−1} A(X)^{−2r} ((2 + (s−1)/δ) 2^{ω(p−1)−s})^{2r} h √p W(p, h, r) < H²`, where
`W(p, h, r)` is the Burgess moment constant (`Σ_x |Σ_{m<h} χ(x+m)|^{2r} ≤ W(p, h, r) √p h^{2r}`,
line 420, from Burgess's moment bound of ExplicitCharacterSumsAndSieves §4.1), then `g(p) < H`. Route: if no primitive root lies
in `(0, H]`, the sieved form of 6.1 (lines 358–370, Proposition 4) over the integer points of
6.2's intervals vanishes, the main term is `≥ A(X)(6/π²)X²h · (lower sieve weight)`, and the
character sums over the `2r`-th moment are bounded by Hölder and the Burgess moment estimate.

Prove McGown–Trudgian's bounds: (lines 59–60, Theorem 1) for `p ≥ 10⁵⁶` and `r ≥ 2`,
`g(p) < 2^r 2^{rω(p−1)} p^{1/4 + 1/(4r)}`; (lines 88–93, Theorem 2) for `p ≥ 10⁵⁶`, `e`, `s`,
`δ > 0` as above and `r ≥ 2`, `g(p) < 2^r ((2 + (s−1)/δ) 2^{ω(p−1)−s})^r p^{1/4 + 1/(4r)}`;
(line 72, Corollary 1) `g(p) < p^{5/8}` for `p ≥ 10²²`; and (line 85, Corollary 2)
`g(p) < 0.999 √p < √p − 2` for `p ≥ 10⁵⁶`. Each is under *McGownTrudgianMoebiusChecks*; Corollary 1
also under (a) of *McGownTrudgianOmegaChecks*, *McGownTrudgianWindowCheck*, and Robin's bound
(ExplicitMultiplicativeFunctions §9.1, with its *PrimorialTableVerified* `26`) for `p ≥ 10^{1000}`;
Corollary 2, and Theorem 1 through it (lines 645–647), also under (b) of *McGownTrudgianOmegaChecks*
and *PrimorialTableVerified* `26` (for Robin's bound). Route for Corollary 1 (lines 615–638):
Theorem 3 with `r = 2`, `H = p^{5/8}`, `h = ⌈2p^{1/4}⌉`, `W(p, h, 2) ≤ 15/4`, which reduces the
claim to `13 ((2 + (s−1)/δ) 2^{ω−s})⁴ < p^{1/2}`; `s = 0` for `ω ≤ 8`, (a) for `9 ≤ ω ≤ 350` since
`p ≥ 10^{22}` and `p > q₁ ⋯ q_ω`, the window predicate at `ω = 17` below `2.2·10^{22}`, and `s = 0`
with Robin's bound for `p ≥ 10^{1000}`. Route for Corollary 2: Theorem 3 with `H = 0.999 √p`,
`h = ⌈p^{1/4}⌉` and the condition `7 (…)⁴ < p^{1/4}`, by (b) and Robin's bound.

Prove McGown–Sorenson's bound (`mcgownsorenson2024` Theorem 3): for every prime `p > 3`,
`g(p) < p^{5/8}`, under *McGownTrudgianMoebiusChecks*, *McGownTrudgianOmegaChecks*,
*McGownTrudgianWindowCheck*, *McGownSorensonTable*, *McGownSorensonGapChecks* and
*PrimorialTableVerified* `26` (for Robin's bound, ExplicitMultiplicativeFunctions §9.1); and
Grosswald's bound outside the gap (`mcgownsorenson2024` Theorem 1): under the same
hypotheses, `g(p) < √p − 2` for every prime `p > 409` outside `(10¹⁶, 10⁵⁶)`. Route: for
`p ≤ 10¹⁶` the table; for `10¹⁶ < p < 10²²` the alternative (i) with the main criterion; for
`p ≥ 10²²` Corollary 1; for Grosswald's bound the table below `10¹⁶` and Corollary 2 from `10⁵⁶`.

**Checks.**

- The second inequality of Corollary 2, `0.999√p < √p − 2`, holds iff `√p > 2000`, that is
  `p > 4·10⁶`, so it is a triviality in the range `p ≥ 10⁵⁶`.
- Corollary 1 at `r = 2`: `2² 2^{2ω} p^{3/8} < p^{5/8}` iff `2^{2ω+2} < p^{1/4}`, which for
  `p ≥ 10²²` needs `ω(p−1) ≤ 8`; larger `ω` is handled by Theorem 2 with `s > 0` and by (a).
- `p = 3`: `g(3) = 2`, outside every range; Theorem 3 at `p = 3` has `h ≥ 2`, `H ≥ 4`,
  `2H² ≥ 32 > hp = 6`, so no admissible parameters exist and nothing is asserted.
- `δ ≤ 0` is excluded: with `e = 2` and `p − 1` divisible by the first ten primes `2, 3, …, 29`
  (by `6469693230`), the primes dividing `p − 1` but not `e` include `3, …, 29` and
  `Σ 1/p_i ≥ 1.0334 > 1`; with only the primes `3, …, 23` the sum is `0.99896` and `δ = 0.00104 > 0`,
  so the first nine primes alone do not force `δ ≤ 0`.
- `p > 3` is sharp in McGown–Sorenson's bound: `g(3) = 2 > 3^{5/8} = 1.987`; the small primes are
  the tight cases (`g(7) = 3 < 3.374`, `g(23) = 5 < 7.10`, `g(409) = 21 < 42.9`), while at the
  record `p = 6525032504501281`, `g(p) = 417` is far below `p^{5/8}`.
- The unconditional Grosswald range: the clause of Cohen–Oliveira e Silva–Trudgian above
  `3.67·10⁷¹` and the finite range up to `2.5·10¹⁵` leave a gap that the table and Corollary 2
  shrink to `(10¹⁶, 10⁵⁶)`.
- `mcgownsorenson2024` Theorem 5 tabulates exponents below `5/8` with thresholds, for instance
  `g(p) < p^{0.62}` for `p > 1.91·10²³` and `g(p) < p^{0.58}` for `p > 8.21·10³⁴`; they rest on
  further case analyses and are not targets.

*Needs:* 6.1, 6.2; *McGownTrudgianMoebiusChecks*, *McGownTrudgianOmegaChecks*,
*McGownTrudgianWindowCheck*, *McGownSorensonTable*, *McGownSorensonGapChecks*;
ExplicitCharacterSumsAndSieves §4.1; ExplicitMultiplicativeFunctions §9.1 (with
*PrimorialTableVerified*); Mathlib `ArithmeticFunction.cardDistinctFactors`.

### 6.4 Grosswald's conjecture under GRH

Write `c(p, x) = (2/3)(1 + 2/√x + 3/x^{3/2})(1 + 5/(3 log p)) + (log x + 2)/(√x log p)` for Bach's
constant (`mcgowntrevinotrudgian2016` lines 74–76), for a prime `p` and real `x ≥ 1`.

Prove that *McGownSorensonTable* implies *GrosswaldFiniteRange*, since `10¹⁶ > 2.5·10¹⁵` and, for
a prime `p`, `√p − 2` is irrational, so `g(p) ≤ √p − 2` and `g(p) < √p − 2` agree. For the clause
of Grosswald's theorem on `g(p)` either predicate serves; the clause on `ĝ(p)` needs
*GrosswaldPrimeFiniteRange*, which neither of them contains.

Prove `leastPrimePrimitiveRoot_le_grh` (lines 56–61, Theorem 2): for a prime `p ≥ 10⁹` with
`GRHMod p`, `ĝ(p) ≤ ((8/5)(2^{ω(p−1)} − 1) log p)²`; and the sieved bound (lines 163–168,
Theorem 3): under `GRHMod p`, with `e`, `s`, `δ > 0` as in 6.3 and a real `x ≥ 1`, if
`ĝ(p) > x` then `ĝ(p) ≤ (2 c(p, x)(2 + (s−1)/δ) 2^{ω(p−1)−s} log p)²`; `x ≥ 1` is the range of
Bach's lemma (lines 70–76). Route: 6.1 applied to the prime powers `m < x` with the weight
`Λ(m)(1 − m/x)`; if no prime below `x` is a primitive root, the sieved identity vanishes on
`m < x`; Bach's lemma under `GRHMod p` bounds each twisted sum by `c(p, x) √x log p` and the
principal sum from below by `x/2 − √x/20 − 3`.

Prove Grosswald's conjecture under GRH (lines 40–41, Theorem 1): under `GRHMod p`,
*GrosswaldFiniteRange*, *GrosswaldPrimeFiniteRange*, *GrosswaldSieveVerification* and
*PrimorialTableVerified* `26` (for Robin's bound, ExplicitMultiplicativeFunctions §9.1),
`ĝ(p) < √p − 2` for every prime `p > 2791` and `g(p) < √p − 2` for every prime `p > 409`. Route:
Theorem 2 with Robin's bound gives the result for `p ≥ 10⁴⁹`, then `ω(p−1) ≤ 31` and `p ≤ 10⁴⁷`,
iterated to `ω ≤ 28` and `p < 10⁴³` (lines 151–158); below `2.5·10¹⁵`, *GrosswaldFiniteRange*
for `g`; Theorem 3 with the choices of `s` (lines 185–210) closes `7 ≤ ω ≤ 28` except
`ω ∈ {12, 13, 14}`, which *GrosswaldSieveVerification* closes (its first alternative is the
conclusion; under `GRHMod p` its second gives the conclusion by Theorem 3 at `x = √p − 2 ≥ 1`,
since `ĝ(p) > x` would give `ĝ(p) < x`, so `ĝ(p) ≤ x`, with equality excluded because `√p` is
irrational); the range `2791 < p < 2.5·10¹⁵` for `ĝ` is *GrosswaldPrimeFiniteRange* (line 157),
and the clause on `g`
follows from the clause on `ĝ` above `2791` (`g(p) ≤ ĝ(p)`) and from *GrosswaldFiniteRange* on
`409 < p ≤ 2791`.

**Checks.**

- `p = 409`: `g(409) = 21 > √409 − 2 = 18.22`, so the conjecture starts after `409`;
  `p = 2791`: `ĝ(2791) = 53 > √2791 − 2 = 50.83` (the prime `2791` is Grosswald's last exception
  for `ĝ`), so the second clause starts after `2791`. There `g(2791) = 6`: the computation for `g`
  says nothing about `ĝ`, which is why *GrosswaldPrimeFiniteRange* is a separate predicate; at
  `p = 11971`, `g(p) = 10` and `ĝ(p) = 79 < √p − 2 = 107.41`.
- `p = 10⁹ + 7`: `p − 1 = 2 · 500000003` with `500000003` prime, so `ω(p − 1) = 2` and
  `leastPrimePrimitiveRoot_le_grh` gives `ĝ(p) ≤ ((8/5) · 3 · 20.723)² = 9895 < √p − 2 = 31620.8`,
  Grosswald's bound directly. `p = 1000000021`: `p − 1 = 2² · 3 · 5 · 19 · 739 · 1187`,
  `ω(p − 1) = 6`, and Theorem 2 gives `((8/5) · 63 · 20.723)² = 4.36·10⁶`, far above
  `√p − 2 = 31620.8`; the sieved Theorem 3 is what reaches `√p − 2` there.
- `GRHMod p` is the hypothesis for every character modulo `p`, including the principal one
  (Bach's principal bound needs `RiemannHypothesis`, which `GRHMod p` gives), and not
  `DedekindERH ℚ(ζ_p)` by name, although the two are equivalent (0.5).
- *GrosswaldSieveVerification* at `ω(p − 1) = 14`: `p − 1 ≥ q₁ ⋯ q₁₄ = 1.308·10¹⁶`; with `e` the
  part of `p − 1` prime to its `11` largest prime factors, `δ ≥ 1 − Σ_{4 ≤ i ≤ 14} 1/q_i ≥ 0.39296`
  (the sum is `0.607037`, so rounding `δ` up to `0.3930` would overstate it) and the second
  alternative holds for every `p ≥ 1.71·10¹⁶` (at `p = 1.71·10¹⁶` with `δ = 0.39296` the left side
  is `1.30740·10⁸` against `√p − 2 = 1.30767·10⁸`, with `c(p, √p − 2) = 0.6966`, and the ratio of
  the two sides decreases in `p` from there; at `p = 1.709·10¹⁶` the left side `1.30734·10⁸`
  exceeds `√p − 2 = 1.30729·10⁸`, so the alternative first holds between the two). This is the
  source's window `(1.30·10¹⁶, 1.71·10¹⁶)` (line 215), inside which the case split leaves no
  candidate, so at `ω = 14` the predicate holds through its second alternative alone.
- The second alternative is a statement about the prime factors of `p − 1` only; Theorem 3, under
  `GRHMod p`, is what turns it into `ĝ(p) < √p − 2`, so the theorem uses the generalized Riemann
  hypothesis only through Theorems 2 and 3. A predicate asserting `ĝ(p) < √p − 2` on the whole
  range would contain the conclusion there.

*Needs:* 6.1; 0.5 (`GRHMod`), 0.6; `gap:bach-grh-smoothed-sum`; ExplicitMultiplicativeFunctions
§9.1 (with *PrimorialTableVerified*); *GrosswaldFiniteRange*, *GrosswaldPrimeFiniteRange*,
*GrosswaldSieveVerification*; Mathlib `ArithmeticFunction.vonMangoldt`.

### 6.5 The least primitive root modulo `p²`

Prove Kerr–McGown–Trudgian's count of `p`-th powers (line 62, Theorem 2): for an odd prime `p`,
`0 < ε < 1`, `z ≥ 2^{1/ε}` and real `X` with `1 ≤ X < p`, the number of integers `1 ≤ m ≤ X`
coprime to `P_z = ∏_{q ≤ z} q` that are `p`-th powers modulo `p²` is at most `√p X^ε`. The source
states it without `X < p`, but its Lemma 6 (lines 139–185) needs the set in `[1, p)`: there
`t₁t₂ ≡ t₃t₄` modulo `p` forces the congruence modulo `p²` (a `p`-th power modulo `p²` is
determined by its residue modulo `p`), and the congruence becomes the equality `t₁t₂ = t₃t₄` only
because the products are below `p²`; the application takes `X = p^{0.99} < p` (lines 282–287).
Route: the `p`-th powers modulo `p²` form the subgroup of order `p − 1` (index `p`) of
`(ℤ/p²)ˣ`; `|T|⁴/p ≤ #{t₁t₂ = t₃t₄}` (Lemma 6) `≤ |T|² max τ(t₁t₂)` and the divisor bound
`τ(m) ≤ m^{ε}` for `m` free of primes below `z ≥ 2^{1/ε}` (line 191, Lemma 7) give
`|T|² ≤ p X^{2ε}`.

Prove Kerr–McGown–Trudgian's lower count of primitive roots (lines 64–79, Theorem 3): for an odd
prime `p`, `X ≥ 1`, `u ≥ 1`, `e`, `s`, `δ > 0` as in 6.3, and `A` with
`|Σ_{m ≤ M} χ(m)| ≤ A √p log p` for every non-principal `χ` modulo `p` and every `M`, the number
`N(X)` of primitive roots modulo `p` below `X` coprime to `u` satisfies
`N(X) ≥ δ (φ(e)/e) (X Σ_{d ∣ u} μ(d)/d − 2^{ω(u)} (A (2 + (s−1)/δ) 2^{ω(p−1)−s} √p log p + 1))`.
Route: the sieved form of 6.1 and the Pólya–Vinogradov hypothesis.

Prove Kerr–McGown–Trudgian's bound (line 50, Theorem 1): for every odd prime `p`, under
*PaszkiewiczTable*, *SmallPrimitiveRootsModPSquare*, *GrosswaldFiniteRange*,
*PrimorialTableVerified* `26` and *PrimorialTotientTableVerified* `24284` (for Robin's and
Rosser–Schoenfeld's bounds, ExplicitMultiplicativeFunctions §§9.1 and 9.4) and
*LapkovaSmallModuliVerified* (for the Pólya–Vinogradov constant, ExplicitCharacterSumsAndSieves
§§3.5 and 6.1), `h(p) < p^{0.99}`. Route (lines 278–297): for `p ≥ 10¹²`, with `z = 16`,
`X = p^{0.99}`, `ε = 1/4`, the lower count with `A = 0.1889 ≥ A(10¹²)` (Lapkova's constant of
ExplicitCharacterSumsAndSieves §3.5 at `q₀ = 10¹²`, in place of the source's `0.16`, which comes
from the misprinted form of its Lemma 3), the count of
`p`-th powers at `X = p^{0.99} < p`, Rosser–Schoenfeld's totient bound
(ExplicitMultiplicativeFunctions §9.4) for `e/φ(e)` (its simplification
`m/φ(m) ≤ 1.8 e^γ log log m`, `kerrmcgowntrudgian2020` lines 129–131, holds only for `m ≥ 10¹²`, so
it serves the case `s = 0`, `e = p − 1`, and the general form serves the cases `s > 0`, where `e`
can be small) and Robin's bound (§9.1) give `N₁(X) − N₂(X) > 0`, so some `m ≤ X` is a primitive root
modulo `p` and not a `p`-th power, hence a primitive root modulo `p²`; for `409 < p < 10¹²` not
exceptional, `h(p) = g(p) ≤ √p − 2 < p^{0.99}`; the rest is the small-range predicate. This
statement keeps the fully sourced route; the exponent `2/3` below rests on `chen2022`, whose text is
cited by its locator.

Prove that *McGownSorensonTable* implies *PaszkiewiczTable* (`10¹⁶ > 10¹²`).

Prove Chen's criterion (`chen2022` (2.5), cited by locator through its quotation in
`mcgownsorenson2024` §3.2): for an odd prime `p`, a real `α` (the source uses `α = 0.661`), and `e`,
`s`, `δ > 0` as in 6.3, and a real `A` with `|Σ_{m ≤ M} χ(m)| ≤ A √p log p` for every non-principal
Dirichlet character `χ` modulo `p` and every real `M` (the hypothesis of Kerr–McGown–Trudgian's
lower count above), if
`δ (φ(e)/e) p^α − (2 + (s − 1)/δ) 2^{ω(e)} A √p log p − √5 π p^{α − 1/4} > 0`, then `h(p) < p^α`.
The source takes for `A` Chen's explicit value `A(p)` (`chen2022`, by locator); under
*LapkovaSmallModuliVerified*, Lapkova's `A(q₀)` of ExplicitCharacterSumsAndSieves §3.5 at `q₀ = p`
satisfies the hypothesis for every odd prime `p`, and, as `A(q₀)` decreases in `q₀`,
`A = 0.1889 ≥ A(10¹²)` serves every prime `p ≥ 10¹²` and `A = 0.1607 ≥ A(10²³³)` every prime
`p ≥ 10²³³`. Route (`chen2022`, by locator): the counting argument of
Kerr–McGown–Trudgian's bound (primitive roots modulo `p` below `p^α` against `p`-th powers modulo
`p²`), with Chen's estimates, which produce the last term.

Prove McGown–Sorenson's bound modulo `p²` (`mcgownsorenson2024` Theorem 4): for every odd prime
`p`, under *McGownSorensonTable*, *McGownSorensonGapChecks*, *PrimorialTableVerified* `26`,
*PrimorialTotientTableVerified* `24284` and *LapkovaSmallModuliVerified*, `h(p) < p^{2/3}`; the
proof gives `h(p) < p^{0.661}` for `p > 10¹⁶`. Route (`mcgownsorenson2024` §3.2): for `p ≤ 10¹⁶` the
table; for `10¹⁶ < p ≤ 10²³³` the alternative (ii) of *McGownSorensonGapChecks* with Chen's
criterion at `α = 0.661`; for `p > 10²³³`, Chen's criterion with `s = 0`, `A = 0.1607 ≥ A(10²³³)`
(ExplicitCharacterSumsAndSieves §3.5 at `q₀ = 10²³³`), Rosser–Schoenfeld's bound for `e/φ(e)` (§9.4)
and the explicit bounds for `ω(p − 1)`: on `10²³³ < p < 10²⁷⁵` the primorial bound (`ω(p − 1) ≤ k`
whenever `p − 1 < q₁ ⋯ q_{k+1}`, so `ω(p − 1) ≤ 105` up to `10²³⁴`), under which the first term
exceeds the subtracted ones by a factor above `900`, and from `10²⁷⁴` on Robin's bound
(ExplicitMultiplicativeFunctions §9.1), under which the factor is above `2`.

**Checks.**

- `p = 2`: `h(2) = 3 > 2^{0.99} ≈ 1.99`, so Kerr–McGown–Trudgian's bound is false at `2` and is
  stated for odd `p` (line 25); `p = 3`: `h(3) = 2 < 3^{0.99} = 2.97`.
- The exponent cannot go below `log 2/log 3 ≈ 0.6309`, since `h(3) = 2 = 3^{0.6309}` (lines
  51–53). At `p = 3`, `h(3) = 2 < 3^{2/3} = 2.080` (and `< 3^{0.661} = 2.067`), the tightest case
  of McGown–Sorenson's bound; Chen's `h(p) < p^{0.74}` (`chen2022` Theorem 1.1) and the `0.99`
  above follow.
- `mcgownsorenson2024` Theorem 4 is printed for every prime, but `h(2) = 3 > 2^{2/3} = 1.587`;
  likewise its Theorem 2 lists only `40487` and `6692367337` as primes `p ≤ 10¹⁶` with
  `g(p) ≠ h(p)`, while `g(2) = 1 ≠ h(2) = 3`. Both statements are for odd `p`, as in
  *PaszkiewiczTable* and *SmallPrimitiveRootsModPSquare*.
- `p = 40487`: `g = 5` is not a primitive root modulo `p²` and `h(p) = 10`; `10 < 40487^{0.99}`,
  which is *SmallPrimitiveRootsModPSquare* at that prime.
- The Pólya–Vinogradov constant at `q₀ = 10¹²`: `A(q₀) = 0.159155 + 0.029691 + 0.000000037 =
  0.188846`, and at `q = 10¹²`, `A(q₀)√q log q = 5.21801·10⁶` equals Lapkova's odd bound
  `(1/(2π))√q log q + 0.8204√q + 1.0285` there, while the source's `0.16` falls `15%` below it.
  With `A = 0.1889` condition (3) of `kerrmcgowntrudgian2020` (line 286) still holds for every
  `p ≥ 10¹²` (`s = 0` for `p ≥ 10¹⁵` and for `ω(p − 1) ≤ 8`, `s = 7` for `9 ≤ ω(p − 1) ≤ 13`): its
  left side is at least `8.1 p^{0.7475}` with Rosser–Schoenfeld's bound for `e/φ(e)`, the smallest
  margin being at `ω(p − 1) = 9` and `p = 10¹²`; so the route survives the corrected constant.
- Negative control for `X < p` in the count of `p`-th powers: `p = 3`, `ε = 1/2`, `z = 4`
  (`P_z = 6`), `X = 1000`: the cubes modulo `9` coprime to `3` are `±1`, and the integers
  `m ≤ 1000` coprime to `6` with `m ≡ ±1 (mod 9)` are those `≡ 1, 17 (mod 18)`, `111` of them,
  against `√3 · 1000^{1/2} = 54.77`. For `X < 3` the count is at most `1` (only `m = 1`), below
  `√3 X^{1/2} ≥ √3`.

*Needs:* 6.1; 0.6; *PaszkiewiczTable*, *SmallPrimitiveRootsModPSquare*, *GrosswaldFiniteRange*,
*McGownSorensonTable*, *McGownSorensonGapChecks*; ExplicitCharacterSumsAndSieves §3.5 (with
*LapkovaSmallModuliVerified* of its §6.1); ExplicitMultiplicativeFunctions §§9.1, 9.4
(with *PrimorialTableVerified*, *PrimorialTotientTableVerified*); `chen2022` by locator; Mathlib
`ZMod.isCyclic_units_of_prime_pow`, `Nat.Coprime`.

### Examples

- `g(7) = 3`, `h(7) = 3`; `g(409) = 21`, `ĝ(409) = 29`; `h(40487) = 10`.
- `ℤ/6`: the sieve identity evaluated at every element.

### Dependencies

Layer 0.5–0.6; ExplicitCharacterSumsAndSieves §§3.5, 4.1, 6.1; ExplicitPrimeCounting
(`gap:bach-grh-smoothed-sum`);
ExplicitMultiplicativeFunctions §§9.1, 9.4; `chen2022` by locator; Mathlib `ZMod`, arithmetic
functions.

## Layer 7: prime ideals

### 7.1 Mertens' theorems for number fields

With `Λ_K = e^{28.2n+5} (n + 1)^{5(n+1)/2} d_K^{1/(n+1)} (log d_K)ⁿ` (the right side of 2.2 at
`x = 1`) and
`Υ_K = ((n + 1)² Λ_K/(2κ_K(n − 1)) + 1) + 0.55 Λ_K n(n + 1)/κ_K + n + 40.31 Λ_K n/κ_K`
(`garcialee2022mertens` lines 117–126, (Λ), (Υ)), prove `primeIdeal_mertens_garciaLee`
(`garcialee2022mertens` lines 89–115, Theorem 1, (A1)–(A2), (B1)–(B2) and (C1)–(C2)): for `n ≥ 2`
and real `x ≥ 2`, with `Θ_K(x) = n/(x − 1) + 2Υ_K/log x`,

- `| Σ_{N𝔭 ≤ x} log N𝔭/N𝔭 − log x | ≤ Υ_K`;
- `| Σ_{N𝔭 ≤ x} 1/N𝔭 − log log x − M_K | ≤ 2Υ_K/log x`, with `M_K = mertensConstant K`;
- `| e^γ κ_K log x · ∏_{N𝔭 ≤ x} (1 − 1/N𝔭) − 1 | ≤ Θ_K(x) e^{Θ_K(x)}`;

the sums and the product running over Tau Ceti's `TauCeti.primesLE K x`. The third bullet is the
source's (C1)–(C2): `∏_{N𝔭 ≤ x} (1 − 1/N𝔭) = (e^{−γ}/(κ_K log x))(1 + C_K(x))` with
`|C_K(x)| ≤ |E_K(x)| e^{|E_K(x)|}` for some `E_K(x)` with `|E_K(x)| ≤ n/(x − 1) + |B_K(x)|`, where
`B_K(x)` is the error of the second bullet; since `t ↦ t eᵗ` is increasing on `t ≥ 0`, this gives
`|C_K(x)| ≤ Θ_K(x) e^{Θ_K(x)}`, and conversely the bound with `E_K(x) = Θ_K(x)` is (C2). Prove
also the bounds for the constant (M2): `γ + log κ_K − n ≤ M_K ≤ γ + log κ_K`. The source defines
`M_K` by the series (M1), `M_K = γ + log κ_K + Σ_𝔭 (1/N𝔭 + log(1 − 1/N𝔭))`; its (B1)–(B2) make
`Σ_{N𝔭 ≤ x} 1/N𝔭 − log log x − M_K` tend to `0`, so `M_K` is Tau Ceti's limit
`mertensConstant K`, and the series expression is LFunctions Layer 8 (step 3 of Mertens' product
for `K`), consumed here. Route (`garcialee2022mertens` §2, after Diamond–Halberstam): Mertens'
elementary argument from the ideal count 2.2, through the identity `log N𝔞 = Σ_{𝔟 ∣ 𝔞} Λ(𝔟)` on
ideals and partial summation, the prime-power terms being bounded separately; then the second and
third statements by partial summation and the Euler product, and (M2) from the series, each term
`1/N𝔭 + log(1 − 1/N𝔭)` lying in `[−1/(N𝔭(N𝔭 − 1)), 0]` and their sum over the primes above `p`
being at least `−n/(p(p − 1))`, with `Σ_p 1/(p(p−1)) < 1`. No zero of `ζ_K` enters, so no
exceptional zero appears in the error terms.

**Checks.**

- `K = ℚ(i)`: `γ + log(π/4) − 2 = −1.664 ≤ M_K ≤ γ + log(π/4) = 0.336`; `Λ_K` is of order
  `5·10³⁰`, so the statements are far from sharp but hold for every `x ≥ 2`; at `x = 2` the only
  prime is `(1 + i)` of norm `2`, and the first sum is `(log 2)/2 = 0.347`, against `log 2`.
- At `K = ℚ` the formula for `M_K` gives `γ + Σ_p (1/p + log(1 − 1/p)) = 0.2615`, the
  Meissel–Mertens constant of 3.5; the theorem itself needs `n ≥ 2`, since `Υ_K` divides by
  `n − 1`.
- A version with `Σ_{N𝔭 ≤ x} log N𝔭/(N𝔭 − 1)` (prime powers included) differs by a convergent
  sum and is not the statement.
- The normalisation of the product: at `K = ℚ(i)` and `x = 10` the primes of norm at most `10`
  are `(1 + i)`, the two primes above `5` and `(3)`, the product is
  `(1/2)(4/5)²(8/9) = 0.2844`, and `e^γ κ_K log x` times it is `0.9162`, so the left side of the
  third bullet is `0.0838`; with `e^{−γ}` in place of `e^γ` the same expression is `0.2888` and
  does not tend to `1`. At `K = ℚ` (outside the theorem, which needs `n ≥ 2`) and `x = 10⁶`,
  `e^γ log x ∏_{p ≤ x} (1 − 1/p) = 0.99996`, Mertens' third theorem.

*Needs:* 2.2; LFunctions Layer 8 (the series expression of the constant, for (M2)); Tau Ceti
`TauCeti.primesLE`, `TauCeti.LFunctions.mertensConstant`; Mathlib `dedekindZeta_residue_def`,
`Ideal.absNorm`.

### 7.2 Prime ideals and the Chebotarev density theorem under GRH

Prove Grenié–Molteni's theorem (`greniemolteni2019` Theorem 1.1): for a Galois extension `L/K` of
number fields with group `G` and a conjugacy class `C`, under `DedekindERH L`,
*GrenieMolteniSmallCases*, and ExplicitPrimeCounting's *ButheVerified*, *Schoenfeld1976Range*
(through Schoenfeld's bound in the case `L = ℚ`) and `Buthe2016Range` (for `L = ℚ` on
`59 < x ≤ 73.2`), for every real `x ≥ 1`,
`| (|G|/|C|) ψ_C(x) − x | ≤ √x ((log x/(2π) + 2) log d_L + ((log x)²/(8π) + 2) n_L)`, with
`ψ_C = frobeniusPsi K L C`, and the same for the function `ψ(C; x)` of the source, which adds the
ramified prime powers with the averaged weight `θ(C; 𝔭^m) ∈ [0, 1]`; and its corollary
(Corollary 1.2): for `x ≥ 2`, with `π_C = frobeniusPrimeCount K L C`,
`| (|G|/|C|) π_C(x) − ∫_2^x du/log u | ≤ √x ((1/(2π) + 3/log x) log d_L + (log x/(8π) + 1/(4π) + 6/log x) n_L)`.
The prime ideal theorem under `DedekindERH K` (with the same predicates) is the case `L = K`,
`G = 1`:
`| ψ_K(x) − x | ≤ √x ((log x/(2π) + 2) log d_K + ((log x)²/(8π) + 2) n_K)` for `x ≥ 1`, where
`ψ_K(x) = Σ_{N𝔭^m ≤ x} log N𝔭`. Route (`greniemolteni2019` §§2–5): the explicit formula for
`ψ(C; x)` through the Artin L-functions of `L/K`, reduced by the usual comparison to `ζ_L` and its
subfields; under `DedekindERH L` every zero in the strip has real part `1/2`, the zero sums are
bounded by the explicit zero counts of the source's appendix for Hecke L-functions, the gamma
terms by the digamma remainders of 1.1a. For `L = ℚ` (so `K = ℚ`, `ψ_C = ψ(C; x) = ψ`) the bound
is `√x ((log x)²/(8π) + 2)` and three inputs cover `x ≥ 1`: *GrenieMolteniSmallCases* on
`1 ≤ x ≤ 59`, the first clause of `Buthe2016Range` (`|ψ(x) − x| ≤ √x (log x)²/(8π)`) on
`59 < x ≤ 73.2`, and Schoenfeld's `ψ` bound (ExplicitPrimeCounting §2.2, under
`RiemannHypothesis`, which `DedekindERH ℚ` gives, and *ButheVerified* and *Schoenfeld1976Range*)
on `x > 73.2`. The source extends Schoenfeld's bound down to `59` by a check it calls easy
(`greniemolteni2019` arXiv v3, §1, p. 2, and §5, p. 19); this roadmap takes that range from the
first clause of `Buthe2016Range`, carried as a hypothesis as every finite verification is.

**Checks.**

- `K = L = ℚ(i)`, `x = 100`: `ψ_K(100) = 93.93`, so `|ψ_K(100) − 100| = 6.07`, against the bound
  `94.76`.
- `L = ℚ`: `n_L = 1`, `d_L = 1`, and the bound is `√x ((log x)²/(8π) + 2)`, weaker than
  Schoenfeld's `√x (log x)²/(8π)` by the term `2√x`; the source notes that the constants `+2` can
  be traded for an additive `40`.
- `greniemolteni2019` §1 records that Corollary 1.4 of `greniemolteni2016` (the prime ideal
  theorem for `π_K` under GRH) was misstated there and displays the corrected form; the
  correction is not restated here, and the `π_C` form above covers the case `L = K`.
- No threshold: the inequalities hold for every `x ≥ 1`, which is why the small cases are a
  predicate.
- `L = ℚ` between the two ranges: on `59 < x ≤ 73.2` the largest value of
  `|ψ(x) − x|/(√x (log x)²/(8π))` is `0.810`, just below `x = 67` (`ψ = 62.337`,
  `|ψ − x| = 4.663` against `5.758`), and the theorem's bound there is `22.13`; Schoenfeld's
  two-sided statement starts at `73.2` and *GrenieMolteniSmallCases* stops at `59`, so without
  `Buthe2016Range` the route would leave this interval uncovered.

*Needs:* ZerosOfLFunctions 5.6, 7.5, Layer 9; LFunctions Layers 3 and 5; AnalyticNumberTheoryPartI
§2.42 (`DedekindERH`); 1.1a; ExplicitPrimeCounting §2.2 (with *ButheVerified*,
*Schoenfeld1976Range*) and §1.3 (`Buthe2016Range`); *GrenieMolteniSmallCases*; Tau Ceti
`frobeniusPsi`, `frobeniusPrimeCount`; Mathlib `IsArithFrobAt`, `ArithmeticFunction.vonMangoldt`.

### 7.3 An unconditional effective Chebotarev theorem

For a Galois extension `L/K` with group `G`, a conjugacy class `C` and `n_L ≥ 2`, write
`Δ_L = d_L^{1/n_L}`, `λ_L = max((log Δ_L)² n_L², (log Δ_L) Δ_L √n_L)` and
`E_C(x) = | ψ_C(x) − (|C|/|G|) x | / ((|C|/|G|) x)`. Prove Das–Kadiri–Ng's theorem
(`daskadiring2025` Corollaries 1.1 and 1.4, preprint), under *MinimalDiscriminantTable*,
*DGLSWSmallFieldGRH* and *DGLSWPolynomialCertificates*, which its route uses through the one-zero
region of 4.8, and *MossinghoffTrudgianF16Certificate*, through 4.6:

- for `log x ≥ 2915 (log d_L)²/n_L`,
  `E_C(x) ≤ x^{β₀−1}/β₀ + 0.2714 λ_L √n_L √(log x) e^{−0.285 √(log x/n_L)}`, and with
  `0.4452 √λ_L √(log x) e^{−0.285 √(log x/n_L)}` as the last term when `n_L ≤ 519`;
- for `log x ≥ 729 n_L (log d_L)²`, `E_C(x) ≤ x^{β₀−1}/β₀ + 175 e^{−0.23 √(log x/n_L)}`, and with
  `18458 e^{−0.25 √(log x/n_L)}` as the last term when `n_L ≤ 519`;

where the term `x^{β₀−1}/β₀` is present only if `ζ_L` has a zero `β₀` in Stark's region of 4.3
(which is then real and simple). Route (`daskadiring2025`): an explicit formula for a smoothed
`ψ_C`, reduced to the zeros of `ζ_L` as in Lagarias–Odlyzko; the zero-free regions with
`R₁ = 20` for `|t| ≤ 2` (4.8's `A(3) = 19.55293` for `|t| ≤ 1` and 4.6 for `1 < |t| ≤ 2`) and
`R₂ = 12.2411` for `|t| > 2` (4.6), in the normalisations `σ ≥ 1 − 1/(R₁ n_L log(4Δ_L))` for
`|t| ≤ 2` (except at `β₀`) and `σ ≥ 1 − 1/(R₂ n_L log(|t| Δ_L))` for `|t| > 2`; the zero counts of
4.2 for the low-lying zeros; and explicit bounds for the sums over the zeros, with the parameters
`m = 1`, `T₀ = t₀ = 40` of the source.

**Checks.**

- `L = ℚ(i)`, `K = ℚ`: the first range is `log x ≥ 2915 (log 4)²/2 = 2801`, `λ_L = 1.961`, and at
  `log x = 2801` the last term is `9.3·10⁻⁴`; there is no `β₀`, since `ζ_ℚ(i) = ζ · L(s, χ₋₄)` has
  no real zero in `(0, 1)`.
- For `L/ℚ` Galois with no quadratic subfield there is no `β₀` (4.3 and AnalyticNumberTheoryPartI
  §2.39); for `L/ℚ` Galois and *UniformQuadraticZeroGap* `c₀` with `c₀ ≤ 1/4`, 4.9 gives
  `x^{β₀−1} ≤ e^{−c₀ log x/log d_L}`.
- The range `log x ≫ (log d_L)²/n_L` is `n_L²` times wider than Lagarias–Odlyzko's
  `n_L (log d_L)²`; Winckler's unpublished constant in the second form was
  `1.51·10¹² e^{−0.014 √(log x/n_L)}` for `log x ≥ 1545 n_L (log d_L)²`. Thorner and Zaman's wider
  range `log x ≫ (log d_L)(log log d_L) + n_L (log n_L)²` has uncomputed constants and is not a
  target.

*Needs:* 4.2, 4.3, 4.6 (with *MossinghoffTrudgianF16Certificate*), 4.8 (with
*MinimalDiscriminantTable*, *DGLSWSmallFieldGRH*, *DGLSWPolynomialCertificates*);
ZerosOfLFunctions 5.6, 6.4; 1.1a; Tau Ceti `frobeniusPsi`; Mathlib
`IsArithFrobAt`.

### 7.4 The least prime ideal

Prove `leastPrimeIdeal_ahnKwon` (`ahnkwon2019` Theorem 1): for a Galois extension `L/K` of number
fields with `L ≠ ℚ` and a conjugacy class `C` of `Gal(L/K)`, there is a prime `𝔭` of `K` in Tau
Ceti's `frobeniusPrimeSet K L C` (unramified in `L`, with `σ_𝔭 = C`) whose absolute norm `N𝔭` is a
rational prime with `N𝔭 ≤ d_L^{12577}`; `leastPrimeIdeal_kadiriNgWong`, Kadiri–Ng–Wong's bound
(`kadiringwong2019` Theorem 1.1, arXiv v1 p. 1, which states it for `d_L` sufficiently large and a
prime of degree one): there is an absolute `D₀` such that for every such `L/K` and `C` with
`d_L ≥ D₀` such a prime exists with `N𝔭 ≤ d_L^{16}`; and
Bach–Sorenson's bound (`bachsorenson1996`, as quoted in (1.4) of `thornerzaman2017`): under *GRH*
for the Hecke L-functions (ZerosOfLFunctions Layer 9), such a prime exists with
`N𝔭 ≤ (4 log d_L + 2.5 n_L + 5)²`. Route: the method of Lagarias, Montgomery and Odlyzko, which
compares a weighted sum over the primes with Frobenius class `C` with the zeros of `ζ_L` through
the explicit formula, with explicit zero-free regions, zero counts and zero repulsion:
`ahnkwon2019` §§5–7 make each of them explicit for every `L ≠ ℚ` (its own region `A = A' = 29.57`
in place of 4.8's); `kadiringwong2019` uses 4.10's repulsion, from its version of Turán's
power-sum method with Harnack's inequality (the proof gives the exponent `15.72`). The
Bach–Sorenson bound is the explicit formula under *GRH*.

**Checks.**

- `L = ℚ(i)`, `K = ℚ`, `C` complex conjugation: the least such prime is `3`; the bounds are
  `4^{12577}`, and `(4 log 4 + 5 + 5)² = 241.7` under *GRH*; for `C` the identity the least is `5`.
- `L = ℚ` is excluded: `d_ℚ = 1` and the bound `N𝔭 ≤ 1` cannot hold; for `L = K ≠ ℚ` (`G = 1`) the
  statement asks for a degree-one prime of `K` of norm at most `d_K^{12577}`.
- The exponents `12577` (every `L ≠ ℚ`) and `16` (beyond an absolute threshold) are not comparable
  statements; neither implies the other.
- Thorner and Zaman's bound through an abelian subgroup `A` with `A ∩ C ≠ ∅`,
  `≪ D_K^{694} Q^{521} + D_K^{232} Q^{367} [K:ℚ]^{290[K:ℚ]}` with an absolute implied constant
  (`thornerzaman2017` Theorem 1.1, with `K = L^A` and `Q` the largest conductor norm of the
  characters of `A`), is not a target; AnalyticNumberTheoryPartI §2.49(iii) has the bound
  `N𝔭 ≪ D^B` with an effective absolute `B`, which these statements make numerical.

*Needs:* 4.2 (Hasanalizade–Shen–Wong's counts), 4.5–4.7, 4.10 (Kadiri–Ng–Wong's repulsion);
ZerosOfLFunctions 5.6, Layer 9; Tau Ceti `frobeniusPrimeSet`;
Mathlib `IsArithFrobAt`, `Ideal.absNorm`.

### 7.5 A Brun–Titchmarsh inequality for the Chebotarev density theorem

Prove `frobeniusPrimeCount_le_debaene`, Debaene's Brun–Titchmarsh inequality (`debaene2019`
lines 69–75, Theorem 1): let `L/ℚ` be Galois with group `G`, `C` a conjugacy class, `H ≤ G` an
abelian subgroup meeting `C`, `K = L^H` of degree `n` and `𝔣 ⊆ 𝓞 K` the finite part of the
conductor of `L/K` (Tau Ceti's `TauCeti.ClassFieldTheory.abelianConductor K L`), and put
`c_K = n^{31n³} (R_K h_K)³ (1 + log⁺(R_K h_K))^{3(n−1)²} [L:K]ⁿ N(𝔣) κ_K^{−2n}`. Then for every
real `x > e` with `c_K (log x)^{5n²} ≤ x`,
`π_C(x, L/ℚ) ≤ (|C|/|G|)(2 + 41 n² log log x/log(x/c_K)) x/log(x/c_K)`, where `π_C(x, L/ℚ)`
counts the rational primes `p ≤ x` unramified in `L` with `σ_p = C` (Tau Ceti's
`frobeniusPrimeCount ℚ L C x`). Two departures from the printed statement. The source prints
`1 + log` where the statement has `1 + log⁺`; the factor comes from Debaene's Lemma 12 used as in
the proof of its Corollary 2, and the repair is that of 2.4 (the two agree when `R_K h_K ≥ 1`).
And the source states the bound for every `x` with `x (log x)^{−5n²} ≥ c_K`, a condition that
every `x` slightly above `1` satisfies, where `log log x < 0` makes the right side negative; with
`x > e`, `(log x)^{5n²} > 1` gives `x > c_K`, so `log(x/c_K) > 0`, and
`log log x > 0`, and the range is otherwise the source's. Route (`debaene2019` §§4–5): an explicit
Selberg sieve in `K` whose remainder terms are the counts of ideals in ray classes modulo `𝔣` of
Debaene's Theorem 11 (2.4's route with a conductor), and Artin reciprocity for the abelian
extension `L/K` (ClassFieldTheory Layer 11, with the agreement `globalArtinMap_ideal`) to turn the
primes with Frobenius class meeting `C ∩ H` into prime ideals of `K` in prescribed ray classes; no
zero of any L-function enters.

**Checks.**

- `L = K = ℚ` (`G = H = 1`, `n = 1`, `𝔣 = (1)`): `c_K = 1`, the range is `x > e` with
  `(log x)⁵ ≤ x` (for instance `x = 3` or `x = 10⁶`), and the bound
  `(2 + 41 log log x/log x) x/log x` is `15.05` at `x = 3`, against `π(3) = 2`, and `7.09·10⁵` at
  `x = 10⁶`, against `π(10⁶) = 78498`.
- Negative control for `x > e`: at `L = ℚ` and `x = 2`, `(log 2)⁵ = 0.16 ≤ 2`, so `x = 2` lies in
  the printed range, while the right side is
  `(2 + 41 log log 2/log 2) · 2/log 2 = −56.8 < π(2) = 1`; at `x = 2.6` it is `0.13 < 1`, and at
  `x = e` it is `2e = 5.44`.
- The cubic field of discriminant `−23` as `K`: the printed factor `(1 + log 0.2812)^{12}` is
  `1.4·10⁻⁷`, which would shrink `c_K` and widen the range without justification; with `log⁺` the
  factor is `1`.
- The range `x ≫ d_K^{7/2 − 3/n + ε}` (`debaene2019`, remark after Theorem 1) comes from class
  number and regulator data alone.

*Needs:* 2.1, 2.4 (Debaene's Theorem 11 and Lemma 12); ClassFieldTheory Layer 11
(`globalArtinMap_ideal`); Tau Ceti `TauCeti.ClassFieldTheory.abelianConductor`,
`frobeniusPrimeCount`; Completed/GlobalNumberFields Layers 2, 3; Mathlib `Units.regulator`,
`classNumber`, `IntermediateField.fixedField`, `IsMulCommutative`, `IsArithFrobAt`.

### Examples

- `ℚ(i)`: `ψ_{ℚ(i)}(100) = 93.93`; `M_{ℚ(i)} ∈ [−1.664, 0.336]`.
- `ℚ(i)/ℚ` with `C` complex conjugation: least prime `3`.

### Dependencies

Layers 1 (1.1a), 2, 3, 4 (4.2–4.10); ZerosOfLFunctions Layers 5, 6, 9; LFunctions Layers 3, 5, 8;
ClassFieldTheory Layers 11–13; Completed/GlobalNumberFields Layers 2, 3; Completed/Chebotarev
through Tau Ceti; AnalyticNumberTheoryPartI §§2.39, 2.42; ExplicitPrimeCounting §§1.3, 2.2.

## Downstream consumers

- ExplicitNumberFields, Part II: Louboutin's Li-type residue bound, Amberger's zero count and Chen's
  estimates in their own right, extending Layers 3, 4 and 6 (Scope).
- ComputationalNumberTheory §4.18: the digamma and trigamma remainders of 1.1a
  (`digamma_series_remainder`, `trigamma_series_remainder`), applied at arguments of real part at
  least `1/4` in its rational enclosures of the CT scalars.
- Roadmaps later in the order of supply that need numerical constants for number fields: the
  class-number, regulator and relative class-number bounds of Layer 5 (for determinations of
  fields of small class number or relative class number), the uniform ideal counts of 2.4 and 2.6
  (for counting number fields by discriminant with explicit constants), the primitive-root bounds
  of Layer 6 (norm-Euclidean and primitive-root problems), and the explicit Chebotarev,
  least-prime-ideal and Brun–Titchmarsh theorems of Layer 7 (for instance for torsion in class
  groups).

## References

- J.-H. Ahn, S.-H. Kwon, An explicit upper bound for the least prime ideal in the Chebotarev
  density theorem, Ann. Inst. Fourier 69 (2019) 1411–1458, arXiv:1807.00508 (`ahnkwon2019`).
- V. Amberger, Estimating the number of zeros of Dedekind zeta-functions, arXiv:2510.27444 v5,
  preprint (`amberger2026`, the zero count of ExplicitNumberFields, Part II; a boundary of Scope).
- E. Bach, J. Sorenson, Explicit bounds for primes in residue classes, Math. Comp. 65 (1996)
  1717–1735 (`bachsorenson1996`, cited through its quotation in `thornerzaman2017`).
- W. D. Banks, On the OpenAI proof that Landau–Siegel zeros do not exist, arXiv:2610.15483,
  preprint (`banks2026siegel`).
- W. D. Banks, Landau–Siegel zeros over a base field and effective Brauer–Siegel,
  arXiv:2610.31402, preprint (`banks2026brauersiegel`).
- A. R. Booker, Quadratic class numbers and character sums, Math. Comp. 75 (2006) (`booker2006`).
- O. Bordellès, Explicit upper bounds for the average order of `d_n(m)` and application to class
  number, J. Inequal. Pure Appl. Math. 3 (2002), Art. 38 (`bordelles2002`).
- O. Bordellès, An inequality for the class number, J. Inequal. Pure Appl. Math. 7 (2006), Art. 87
  (`bordelles2006`).
- B. Chen, Explicit upper bound on the least primitive root modulo `p²`, Int. J. Number Theory 18
  (2022) (`chen2022`, cited by locator; its criterion (2.5) through `mcgownsorenson2024` §3.2).
- P. J. Cho, R. J. Lemke Oliver, A. Zaman, Effective Brauer–Siegel theorems for Artin
  L-functions, arXiv:2510.02309, preprint (`cholemkeoliverzaman2025`, context for 5.7).
- S. D. Cohen, T. Oliveira e Silva, T. Trudgian, On Grosswald's conjecture on primitive roots, Acta
  Arith. 172 (2016) (`cohenoliveirasilvatrudgian2016`).
- M. Cully-Hugill, T. Trudgian, Two explicit divisor sums, Ramanujan J. 56 (2021)
  (`cullyhugilltrudgian2021`, cited by locator).
- S. Das, S. Gaba, E. S. Lee, A. Savalia, P.-J. Wong, New zero-free regions for Dedekind
  zeta-functions at small and large ordinates, arXiv:2506.19319 (`dglsw2025`).
- S. Das, H. Kadiri, N. Ng, An effective version of Chebotarev's density theorem,
  arXiv:2508.09480, preprint (`daskadiring2025`).
- K. Debaene, Explicit counting of ideals and a Brun–Titchmarsh inequality for the Chebotarev
  density theorem, Int. J. Number Theory 15 (2019) (`debaene2019`).
- A. Fehnker, Explicit counting of ideals in number fields of arbitrary degree,
  arXiv:2604.19681, preprint (`fehnker2026`).
- E. Friedman, Analytic formulas for the regulator of a number field, Invent. Math. 98 (1989)
  (`friedman1989`, cited by locator).
- S. R. Garcia, E. S. Lee, Unconditional explicit Mertens' theorems for number fields and Dedekind
  zeta residue bounds, Ramanujan J. 57 (2022) (`garcialee2022mertens`).
- S. R. Garcia, E. S. Lee, Explicit estimates for Artin L-functions: Duke's short-sum theorem and
  Dedekind zeta residues, J. Number Theory 237 (2022) (`garcialee2022artin`).
- S. R. Garcia, L. Grenié, E. S. Lee, G. Molteni, Explicit conditional bounds for the residue of
  a Dedekind zeta-function at `s = 1`, J. Number Theory (2026), DOI 10.1016/j.jnt.2026.08.010,
  arXiv:2506.17416 (`gglm2026`).
- B. Green, On Landau–Siegel zeros, Hexagon 2610.00311 v2, preprint (`green2026`, context).
- L. Grenié, G. Molteni, An explicit Chebotarev density theorem under GRH, J. Number Theory 200
  (2019) 441–485, arXiv:1709.07609 (`greniemolteni2019`).
- S. Gun, O. Ramaré, J. Sivaraman, Counting ideals in ray classes, J. Number Theory 243 (2023)
  13–37, arXiv:2208.06602 (`gunramaresivaraman2023`).
- V. Z. Guo, An explicit elementary proof of no Landau–Siegel zeros, arXiv:2610.30476, preprint
  (`guo2026`).
- E. Hasanalizade, Q. Shen, P.-J. Wong, Counting zeros of Dedekind zeta functions, Math. Comp. 91
  (2022) (`hasanalizadeshenwong2022`).
- H. Kadiri, Explicit zero-free regions for Dedekind zeta functions, Int. J. Number Theory 8
  (2012) (`kadiri2012`).
- H. Kadiri, N. Ng, Explicit zero density theorems for Dedekind zeta functions, J. Number Theory
  132 (2012) 748–775, arXiv:1201.3932 (`kadiring2012`).
- H. Kadiri, N. Ng, P.-J. Wong, The least prime ideal in the Chebotarev density theorem,
  arXiv:1902.08640 (`kadiringwong2019`).
- H. Kadiri, P.-J. Wong, Primes in the Chebotarev density theorem for all number fields (with an
  appendix by A. Fiori), J. Number Theory 241 (2022) 700–737 (`kadiriwong2022`, the table of
  minimal discriminants quoted in `dglsw2025`).
- B. Kerr, A simpler proof that there are no Landau–Siegel zeros, arXiv:2610.21099, preprint
  (`kerr2026`, context).
- B. Kerr, K. McGown, T. Trudgian, The least primitive root modulo `p²`, J. Number Theory 215
  (2020) (`kerrmcgowntrudgian2020`).
- Y. Lamzouri, X. Li, K. Soundararajan, Conditional bounds for the least quadratic non-residue
  and related problems, Math. Comp. 84 (2015) 2391–2412, arXiv:1309.3595
  (`lamzourilisoundararajan2015`, a boundary of Scope).
- S. Lang, *Algebraic Number Theory*, 2nd ed., Springer (`lang1994`, cited by locator), Ch. XIII
  (the class-number formula and the Hecke integral representation).
- E. S. Lee, On an explicit zero-free region for the Dedekind zeta-function, J. Number Theory 224
  (2021) (`lee2021zerofree`).
- E. S. Lee, On the number of integral ideals in a number field, J. Math. Anal. Appl. 517 (2023)
  (`lee2023ideals`).
- E. S. Lee, P. Nosal, Sharper bounds for the error in the prime number theorem assuming the
  Riemann Hypothesis, J. Number Theory 283 (2026) 241–258 (`leenosal2026`, Corollary 1.3:
  the Mertens product under the Riemann hypothesis consumed from ExplicitMultiplicativeFunctions
  §8.1).
- S. Louboutin, Explicit bounds for residues of Dedekind zeta functions, values of L-functions at
  `s = 1`, and relative class numbers, J. Number Theory 85 (2000) (`louboutin2000`, cited by
  locator).
- S. Louboutin, Explicit upper bounds for residues of Dedekind zeta functions and values of
  L-functions at `s = 1`, and explicit lower bounds for relative class numbers of CM-fields, Canad.
  J. Math. 53 (2001) (`louboutin2001`, cited by locator).
- S. Louboutin, Explicit lower bounds for residues at `s = 1` of Dedekind zeta functions and
  relative class numbers of CM-fields, Trans. Amer. Math. Soc. 355 (2003) (`louboutin2003`).
- S. Louboutin, On the use of explicit bounds on residues of Dedekind zeta functions taking into
  account the behavior of small primes, J. Théor. Nombres Bordeaux 17 (2005) (`louboutin2005`).
- S. R. Louboutin, Real zeros of Dedekind zeta functions, Int. J. Number Theory 11 (2015)
  (`louboutin2015ijnt`).
- S. R. Louboutin, Explicit upper bounds for residues of Dedekind zeta functions, Mosc. Math. J. 15
  (2015) (`louboutin2015mmj`, the direction of the Part II).
- S. R. Louboutin, Simple zeros of Dedekind zeta functions, Funct. Approx. Comment. Math. 56
  (2017) (`louboutin2017`).
- R. F. Lu, A. Zaman, H. Zhao, Numerical computations concerning Landau–Siegel zeros,
  arXiv:2602.03626, DOI 10.1090/mcom/4268 (`luzamanzhao2026`).
- K. J. McGown, On the constant in Burgess' bound for the number of consecutive residues or
  non-residues, Acta Arith. 156 (2012) (`mcgown2012`).
- K. J. McGown, J. P. Sorenson, Computation of the least primitive root, Math. Comp. (2024),
  DOI 10.1090/mcom/4003, arXiv:2206.14193 (`mcgownsorenson2024`).
- K. J. McGown, T. Trudgian, Explicit upper bounds on the least primitive root, Proc. Amer. Math.
  Soc. 148 (2020) (`mcgowntrudgian2020`).
- K. McGown, E. Treviño, T. Trudgian, Resolving Grosswald's conjecture on GRH, Funct. Approx.
  Comment. Math. 55 (2016) (`mcgowntrevinotrudgian2016`).
- M. J. Mossinghoff, T. S. Trudgian, Nonnegative trigonometric polynomials and a zero-free region
  for the Riemann zeta-function, J. Number Theory 157 (2015), arXiv:1410.3926
  (`mossinghofftrudgian2015`, the polynomial `F₁₆` of *MossinghoffTrudgianF16Certificate*).
- A. M. Odlyzko, Lower bounds for discriminants of number fields, Acta Arith. 29 (1976)
  (`odlyzko1976`, cited through its quotation in `kadiringwong2019`; a comparison in Scope).
- F. W. J. Olver et al. (eds.), *NIST Digital Library of Mathematical Functions*,
  https://dlmf.nist.gov/, equations 5.7.6 and 5.15.1 (`dlmf`, the series of 1.1a).
- OpenAI, Uniform exclusion of Landau–Siegel zeros, preprint in the `openai/math` repository
  (`openai2026siegel`, context).
- N. Palojärvi, A. Simonič, Conditional estimates for L-functions in the Selberg class, J. Number
  Theory 285 (2026) 135–193, arXiv:2211.01121 (`palojarvisimonic2026`, cited through its
  quotation in `gglm2026`).
- H. Rademacher, On the Phragmén–Lindelöf theorem and some applications, Math. Z. 72 (1959)
  (`rademacher1959`, cited by locator).
- O. Ramaré, Approximate formulae for `L(1, χ)`, Acta Arith. 100 (2001) (`ramare2001`), Corollary 1:
  the bounds consumed from ExplicitZetaBounds §9.1.
- O. Ramaré, Explicit count of integral ideals of an imaginary quadratic field, Ann. Math. Québec
  (2025), DOI 10.1007/s40316-025-00243-0 (`ramare2025`).
- J. B. Rosser, L. Schoenfeld, Approximate formulas for some functions of prime numbers, Illinois
  J. Math. 6 (1962) (`rosser-schoenfeld-1962`), Theorem 15: the totient bound consumed from
  ExplicitMultiplicativeFunctions §9.4.
- L. Schoenfeld, Sharper bounds for the Chebyshev functions `θ(x)` and `ψ(x)`. II, Math. Comp. 30
  (1976) (`schoenfeld-1976`), Corollary 2: the contract of `gap:explicit-mertens-second`.
- H. M. Stark, Some effective cases of the Brauer–Siegel theorem, Invent. Math. 23 (1974),
  DOI 10.1007/BF01405166 (`stark1974`, cited by locator), Lemmas 2–4 and 8: the residue bounds
  of 4.7 and the input of 5.7.
- J. S. Sunley, Class numbers of totally imaginary quadratic extensions of totally real fields,
  Trans. Amer. Math. Soc. 175 (1973) (`sunley1973`).
- J. Thorner, A. Zaman, An explicit bound for the least prime ideal in the Chebotarev density
  theorem, Algebra Number Theory 11 (2017), arXiv:1604.01750 (`thornerzaman2017`).
- E. Treviño, The Burgess inequality and the least `k`-th power non-residue, Funct. Approx.
  Comment. Math. 53 (2015) (`trevino2015`).
- T. S. Trudgian, An improved upper bound for the error in the zero-counting formulae for Dirichlet
  L-functions and Dedekind zeta-functions, Math. Comp. 84 (2015) (`trudgian2015`).
- S. Tudzi, On the generalised divisor problem, arXiv:2506.21823 v2, preprint (`tudzi2026`, the
  `τ_3` remainder consumed from ExplicitMultiplicativeFunctions §7.9).
- L. C. Washington, *Introduction to Cyclotomic Fields*, 2nd ed., Springer (`washington1997`,
  cited by locator), Theorem 4.10 (the relative class number is an integer).
- M. Widmer, Counting primitive points of bounded height, Trans. Amer. Math. Soc. 362 (2010)
  (`widmer2010`).

The explicit Burgess inequalities and their tabulated constants of Treviño, McGown and Booker are
ExplicitCharacterSumsAndSieves'; they are cited in Scope only.
