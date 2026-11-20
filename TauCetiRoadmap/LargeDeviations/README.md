# Roadmap: large deviations

**Summary.** This roadmap builds the theory of large deviations for sequences of measures on
topological spaces, at an arbitrary speed, on Mathlib's measure theory, its weak convergence of
probability measures and its moment generating functions, on Tau Ceti's Fenchel conjugate,
Donsker–Varadhan formula and empirical measures, and on the definition of the principle in
[RandomMatrices](../RandomMatrices/README.md) §9.1:
- rate functions and the large deviation principle: infima, attainment and zeros of good rate
  functions, the limit on continuity sets, the principle of the largest term, uniqueness of the
  rate function, the weak principle from asymptotics on balls, and the passage from the weak to
  the full principle under exponential tightness, with its converse on Polish spaces;
- exponential moments: the exponential Chebyshev upper bound on compact sets, Varadhan's lemma
  under the tail and moment conditions, the Laplace principle and its equivalence with the large
  deviation principle, exponential tilting, and Bryc's inverse Varadhan lemma;
- transformations: goodness of the rate function under the contraction principle, the inverse
  contraction principle, exponential equivalence, and the Dawson–Gärtner theorem for sequence
  spaces;
- Cramér's theorem: the logarithmic moment generating function and its Legendre transform,
  Chernoff's bound and the Cramér–Chernoff tail limit, Cramér's theorem on the real line without
  moment assumptions and in finite-dimensional inner product spaces;
- the Gärtner–Ellis theorem: the upper bound, the lower bound over exposed points, Rockafellar's
  lemma on exposed points of the Legendre transform of an essentially smooth function, and the
  full principle;
- Sanov's theorem: the method of types and the finite-alphabet theorem with its upper bound for
  arbitrary sets, exponential tightness of empirical laws, and Sanov's theorem on Polish spaces.

The material is the common core of Dembo–Zeitouni (1998), Kallenberg (2021, Chapter 24),
Klenke (2020, Chapter 23), Ellis (1985, Chapter II) and Dupuis–Ellis (1997, Chapters 1–2), with
the definitions of Anderson–Guionnet–Zeitouni (2009, Appendix D) used by RandomMatrices (see
[References](#references)). The organisation is by proof dependency: the general principles come
first, and each of the three classical theorems is assembled from them. Headlines that restate a
source result carry a theorem, definition, lemma or equation locator with its printed page in a
text listed under References; corollaries and adaptations carry a proof route.

`Suggested.lean` states, against the pinned Mathlib and Tau Ceti, the headlines below that carry
a Lean name, each with every conclusion the README attaches to it, and the definitions those
statements need. It is not an exhaustive acceptance test: the other headlines (bold or not) are
targets of the same standing, stated in prose with their locators or proof routes.

Suggested home: `TauCeti/Probability/LargeDeviations/`, with one file per subsection.

## Scope and ownership

The roadmap is complete when Tau Ceti proves all of the following.

1. **Rate functions and the principle.** Attainment of infima of good rate functions on closed
   sets; the vanishing infimum of the rate of a principle for probability measures and the
   existence of a zero of a good rate; the limit on `I`-continuity sets; exponential decay of
   closed sets without zeros of a good rate; the principle of the largest term; uniqueness of the
   rate function on regular spaces; the weak principle from ball asymptotics on pseudometric
   spaces; the upper bound on closed sets from the upper bound on compact sets and exponential
   tightness; the full principle and goodness from the weak principle and exponential tightness;
   exponential tightness from a good rate on Polish spaces.
2. **Exponential moments.** The exponential Chebyshev upper bound on compact sets; Varadhan's
   lemma for bounded continuous functions, and for continuous functions under the tail
   condition, with the moment condition implying it; the Laplace principle and its equivalence
   with the principle on pseudometric spaces for good rates; exponential tilting by bounded
   continuous functions; Bryc's inverse Varadhan lemma on completely regular spaces.
3. **Transformations.** Goodness of the image rate function and attainment on fibres; the
   inverse contraction principle; transfer of a principle with a good rate between exponentially
   equivalent sequences; the Dawson–Gärtner theorem for countable products.
4. **Cramér's theorem.** Convexity and lower semicontinuity of the logarithmic moment generating
   function and of its Legendre transform, the zero at the mean, goodness when the exponential
   moments are finite near `0`; Chernoff's bound for every sample size and the Cramér–Chernoff
   tail limit; Cramér's theorem on `ℝ` for every law and in a finite-dimensional real inner
   product space for laws with finite exponential moments.
5. **The Gärtner–Ellis theorem.** Exposed points and essential smoothness; the upper bound with
   goodness and convexity of the rate; the lower bound over exposed points; Rockafellar's lemma;
   the full principle for essentially smooth lower semicontinuous limits.
6. **Sanov's theorem.** The method of types; Sanov's theorem for a finite alphabet; exponential
   tightness of empirical laws; Sanov's theorem on Polish spaces with the relative entropy as
   good rate.

**Not owned here.**

- The definition of the large deviation principle with its rate in `ℝ≥0∞` and logarithms in
  `EReal`, the definitions of a good rate function, of the weak principle, of exponential
  tightness and of exponential equivalence, and the contraction principle itself (Anderson,
  Guionnet and Zeitouni, Thm D.7, pp. 428–429): [RandomMatrices](../RandomMatrices/README.md)
  §9.1. This roadmap uses local copies of those definitions, consumes the contraction principle,
  and owns only the goodness of the image rate and the attainment on fibres (3.1), which §9.1
  does not state.
- The large deviations of the spectral measure and of the largest eigenvalue of Gaussian and
  beta ensembles: RandomMatrices §§9.2–9.5.
- Schilder's theorem for Brownian paths in Laplace-principle form, with its exponential
  tightness: [OptimalTransport](../OptimalTransport/README.md) §13.13. The equivalence of 2.3
  converts it into the form of the large deviation principle used here; this roadmap restates
  nothing about Brownian paths.
- The Donsker–Varadhan variational formula for the relative entropy, its form over bounded
  continuous functions, the lower semicontinuity of the relative entropy on probability measures
  and the tightness of its sublevel sets: Tau Ceti (Exact supplier contracts).
- Empirical measures of finite samples and their measurability and continuity: Tau Ceti.
- The Fenchel conjugate with its lower semicontinuity, convexity and the Fenchel–Moreau theorem:
  Tau Ceti.
- The Borel property of the Giry σ-algebra on probability measures over a Polish space: Tau Ceti
  (Exact supplier contracts).
- The strong law of large numbers and Prokhorov's theorem: Mathlib.

Every result that is not listed in a layer belongs to the
[boundary list](#beyond-this-roadmap-a-roadmap-for-a-roadmap-do-not-implement).

## Conventions

- **Families and speeds.** A family of laws is a sequence `μ : ℕ → Measure X` on a topological
  space `X` with a measurable structure, and the speed is `a : ℕ → ℝ`; every theorem that needs
  it assumes `Tendsto a atTop atTop`. Continuous-parameter families `ε → 0` of the sources are
  read along sequences; the theorems used here never need more.
- **Measurable open sets.** In "Polish forces tightness" (1.5), in 2.1–2.5 and in the inverse
  contraction of 3.1, open sets of `X` are measurable (`OpensMeasurableSpace X`), except that
  the moment condition of 2.2 asks instead for a measurable `φ`; 3.2–3.3 and Layers 4–6 assume
  Borel σ-algebras or say so (4.1). Without it 2.1 fails: under the trivial σ-algebra on `ℝ` a
  lower integral is the infimum of the integrand, so `∫⁻ exp ((n+1) j x) dδ₀ = 0` for `j ≠ 0`
  while `{0}` has outer measure `1`. The moment condition fails in the same way for a
  non-measurable `φ`: for `φ x = |x|`, `γ = 2` and `δ₀` both lower integrals are `1`, because
  the restriction of `δ₀` to the non-measurable set `{φ ≥ M}` is `δ₀`.
- **Logarithms and infima.** The normalized logarithm of the measure of a set `s` is
  `(a n)⁻¹ * ENNReal.log (μ n s)` in `EReal`, with `ENNReal.log 0 = ⊥`, so a set of measure `0`
  contributes `-∞`. The junk value `Real.log 0 = 0` never enters; Check 1.1 shows that it would
  break the upper bound. Rate functions are `I : X → ℝ≥0∞`, and infima `⨅ x ∈ s, (I x : EReal)`
  are taken in `EReal`, so the infimum over the empty set is `⊤` and its negative is `⊥`.
- **Measures of arbitrary sets.** `μ n s` for a set `s` that need not be measurable is Mathlib's
  outer measure. The upper bounds of 1.2 (the continuity-set limit) and of 6.1 (Sanov for a
  finite alphabet) hold for arbitrary sets in this sense.
- **The principle.** `LargeDeviationPrinciple μ a I` is RandomMatrices §9.1 verbatim: `I` is
  lower semicontinuous, every closed set obeys the upper bound
  `limsup (a n)⁻¹ log μₙ(F) ≤ -inf_F I`, and every open set obeys the lower bound
  `-inf_U I ≤ liminf (a n)⁻¹ log μₙ(U)`. `IsGoodRateFunction`, `WeakLargeDeviationPrinciple`,
  `IsExponentiallyTight` and `ExponentiallyEquivalent` follow Anderson–Guionnet–Zeitouni,
  Definitions D.2–D.3, p. 428, and Kallenberg, (17) p. 539 and (26) p. 545. A good rate function
  has compact sublevel sets `{x | I x ≤ c}` for every finite `c`.
- **Exponential moments.** Exponential moments are lower integrals
  `∫⁻ x, ENNReal.ofReal (Real.exp (a n * f x)) ∂μ n`, which may be `⊤`. The logarithmic moment
  generating function `logMGF ν t` is `ENNReal.log` of `∫⁻ x, ENNReal.ofReal (exp ⟪t, x⟫) ∂ν`,
  valued in `EReal`. Mathlib's real-valued cumulant generating function `cgf` returns the junk
  value `0` where the exponential moment is infinite and is used only where the moment is
  finite; Check 4.1 shows the difference.
- **Legendre transforms.** `legendreRate Λ x` is Tau Ceti's `fenchelConjugate` for the inner
  product pairing, `sup_t (⟪t, x⟫ - Λ t)` in `EReal`, truncated below at `0` into `ℝ≥0∞`. Every
  `Λ` to which it is applied as a rate has `Λ 0 = 0`, so the truncation is invisible there
  (4.1); Check 4.1 shows a function with `Λ 0 ≠ 0` where it is not.
- **Convexity of extended-valued functions** is stated as convexity of the real epigraph
  `{p : E × ℝ | f p.1 ≤ p.2}`, the form of Tau Ceti's `convex_epigraph_fenchelConjugate`.
- **Sample means and empirical measures.** For a probability law `ν`, `sampleMeanLaw ν n` is the
  law of the mean of `n + 1` independent observations from `ν`, and `empiricalLaw μ n` is the law
  of the empirical measure of `n + 1` observations, a measure on `ProbabilityMeasure E` with
  Mathlib's Giry σ-algebra. Both are taken at speed `n + 1`. The sources index by sample size
  `n ≥ 1` at speed `n`; the shift changes no limit.
- **Spaces of probability measures** carry Mathlib's topology of weak convergence. The relative
  entropy is Mathlib's `klDiv`, with value `⊤` off absolute continuity (`klDiv_of_not_ac`).

## Exact supplier contracts

### From Mathlib

- **Logarithms and extended reals:** `ENNReal.log` with `ENNReal.log 0 = ⊥`
  (`Mathlib/Analysis/SpecialFunctions/Log/ENNRealLog.lean`), `EReal` and `EReal.toENNReal`
  (`Mathlib/Data/EReal/Basic.lean`).
- **Semicontinuity and compactness:** `LowerSemicontinuous`, `LowerSemicontinuousOn.exists_isMinOn`
  (`Mathlib/Topology/Semicontinuity/Basic.lean`), `IsCompact.exists_isMinOn`, `T35Space` and
  completely regular spaces (`Mathlib/Topology/Separation/CompletelyRegular.lean`), `PolishSpace`.
- **Moments:** `ProbabilityTheory.mgf`, `ProbabilityTheory.cgf`, `iIndepFun.mgf_sum` and the
  Chernoff bound `measure_ge_le_exp_mul_mgf` (`Mathlib/Probability/Moments/Basic.lean`);
  `integrableExpSet` and its convexity (`Mathlib/Probability/Moments/IntegrableExpMul.lean`);
  `deriv_cgf` and the analyticity of `cgf` on the interior of `integrableExpSet`
  (`Mathlib/Probability/Moments/MGFAnalytic.lean`).
- **Tilting and products:** `Measure.tilted` (`Mathlib/MeasureTheory/Measure/Tilted.lean`),
  `Measure.pi` and `Measure.infinitePi`.
- **Relative entropy:** `klDiv`, `klDiv_of_not_ac`, `klDiv_eq_zero_iff`
  (`Mathlib/InformationTheory/KullbackLeibler/Basic.lean`).
- **Weak convergence:** `ProbabilityMeasure` with its Giry σ-algebra
  (`Mathlib/MeasureTheory/Measure/ProbabilityMeasure.lean`) and
  `ProbabilityMeasure.tendsto_iff_forall_integral_tendsto`; Prokhorov's theorem
  `isCompact_closure_of_isTightMeasureSet` (`Mathlib/MeasureTheory/Measure/Prokhorov.lean`) and
  `isTightMeasureSet_singleton` (`Mathlib/MeasureTheory/Measure/Tight.lean`); weak regularity of
  finite measures on pseudometrizable spaces,
  `Measure.WeaklyRegular.of_pseudoMetrizableSpace_of_isFiniteMeasure`.
- **Strong law:** `ProbabilityTheory.strong_law_ae` (`Mathlib/Probability/StrongLaw.lean`).
- **Convex analysis:** `intrinsicInterior` (`Mathlib/Analysis/Convex/Intrinsic.lean`),
  `gradient` (`Mathlib/Analysis/Calculus/Gradient/Basic.lean`), `innerₗ`.

Mathlib has no large deviation principle, no Cramér, Sanov, Varadhan or Gärtner–Ellis theorem,
no `EReal`-valued logarithmic moment generating function, and no `BorelSpace` instance for
`ProbabilityMeasure`.

### From Tau Ceti

- **Fenchel conjugate:** `TauCeti.fenchelConjugate`, `TauCeti.sub_le_fenchelConjugate`,
  `TauCeti.lowerSemicontinuous_fenchelConjugate_innerₗ` and
  `TauCeti.convex_epigraph_fenchelConjugate` (`TauCeti/Analysis/Convex/Conjugate.lean`); the
  Fenchel–Moreau theorem for the inner product pairing
  `TauCeti.fenchelConjugate_innerₗ_fenchelConjugate_innerₗ`
  (`TauCeti/Analysis/Convex/FenchelMoreau.lean`).
- **Relative entropy:** the Donsker–Varadhan formula over bounded measurable functions
  `TauCeti.klDiv_eq_iSup_integral_sub_log_integral_exp` and over bounded continuous functions
  `TauCeti.klDiv_eq_iSup_boundedContinuousFunction_integral_sub_log_integral_exp` (normal Borel
  space, `(μ + ν).WeaklyRegular`); joint lower semicontinuity
  `TauCeti.lowerSemicontinuous_klDiv_probabilityMeasure` (pseudometrizable Borel space); tightness
  of sublevel sets `TauCeti.isTightMeasureSet_setOf_klDiv_le`
  (`TauCeti/InformationTheory/KullbackLeibler/Variational.lean`).
- **Empirical measures:** `TauCeti.Probability.empiricalMeasureOfFintype` with
  `TauCeti.Probability.measurable_empiricalMeasureOfFintype`,
  `TauCeti.Probability.continuous_empiricalMeasureOfFintype` and
  `TauCeti.Probability.integral_empiricalMeasureOfFintype`
  (`TauCeti/Probability/Process/EmpiricalMeasure.lean`).
- **Borel property of the Giry σ-algebra:** the instance
  `TauCeti.MeasureTheory.ProbabilityMeasure.borelSpace`, `BorelSpace (ProbabilityMeasure X)` for a
  Borel space `X` with `HasOuterApproxClosed X` whose `ProbabilityMeasure X` is hereditarily
  Lindelöf (`TauCeti/MeasureTheory/Measure/ProbabilityMeasure/Borel.lean`), and the instance
  `MeasureTheory.ProbabilityMeasure.instSecondCountableTopology` for a second-countable standard
  Borel pseudometrizable `X` (`TauCeti/MeasureTheory/Measure/ProbabilityMeasure/Separable.lean`).
  On a Polish space with its Borel σ-algebra they give `BorelSpace (ProbabilityMeasure E)` by
  instance search once a complete metric is chosen, and on a finite discrete alphabet directly.

### From other roadmaps

- [RandomMatrices](../RandomMatrices/README.md) §9.1: the definition of the large deviation
  principle, goodness, the weak principle, exponential tightness, exponential equivalence and the
  contraction principle. `Suggested.lean` carries local copies whose docstrings name §9.1.

## How to read the build

Layer 1 is the topology of the principle: what the two bounds imply about the rate function and
how the weak principle becomes the full one. Its pivot is 1.5, which turns upper bounds on
compact sets into upper bounds on closed sets. Layer 2 relates the principle to exponential
moments in both directions. The exponential Chebyshev bound of 2.1 produces upper bounds on
compact sets from limits of exponential moments, and is the upper half of Cramér's, Gärtner and
Ellis's and Sanov's theorems. Varadhan's lemma (2.2) computes exponential moments from a
principle, and Bryc's lemma (2.5) is the converse. Layer 3 moves principles along maps, between
exponentially close sequences and to projective limits.

Layers 4–6 are the three classical theorems, each built as an upper bound on compact sets from
2.1, exponential tightness, and a lower bound by change of measure. Cramér's theorem on `ℝ`
(4.3) uses no moment assumption, and its lower bound truncates the law. Gärtner and Ellis's
theorem (Layer 5) replaces independence by a limit of logarithmic moment generating functions.
Its lower bound needs exposed points, which Rockafellar's lemma supplies under essential
smoothness. Sanov's theorem on a finite alphabet (6.1) is pure counting. On a Polish space (6.3)
its upper bound is 2.1 applied to the linear functionals `ν ↦ ∫ f dν` together with the
Donsker–Varadhan formula, and its lower bound is a change of measure with the strong law.

The layers are in build order. Layer 4 needs only 1.3–1.5 and 2.1, and Layer 6 needs only Layer
1 and 2.1; both can be built directly after 2.1.

## Layer 1: rate functions and the principle

### 1.1 Rate functions

- Local copies of RandomMatrices §9.1: `LargeDeviationPrinciple`, `IsGoodRateFunction`,
  `WeakLargeDeviationPrinciple`, `IsExponentiallyTight` (Conventions; Dembo–Zeitouni, §1.2,
  pp. 4–8; Anderson–Guionnet–Zeitouni, Definitions D.1–D.3, pp. 427–428; Kallenberg, (15)
  p. 538 and (17) p. 539; Klenke, Definitions 23.6–23.7, p. 594; Ellis, Definition II.3.1,
  pp. 35–36).
- **A good rate function attains its infimum on closed sets**
  (`IsGoodRateFunction.exists_isMinOn`): a good `I` attains its infimum on every nonempty closed
  set `F`.

*Proof route.* If `⨅_F I = ⊤` every point of `F` attains it. Otherwise `F ∩ {I ≤ c}` is a
nonempty compact set for some finite `c`, and `LowerSemicontinuousOn.exists_isMinOn` gives a
minimizer there, which minimizes on `F`.

*Needs:* RandomMatrices §9.1; Mathlib `LowerSemicontinuousOn.exists_isMinOn`.

### 1.2 Consequences of the two bounds

- **Normalization** (`LargeDeviationPrinciple.iInf_eq_zero`): if every `μ n` is a probability
  measure and `μ` satisfies the principle with rate `I`, then `⨅ x, I x = 0`, and a good `I` has
  a zero (Dembo–Zeitouni, (2.2.8) p. 28 for Cramér's rate; the general case is an adaptation).
- **Continuity sets** (`LargeDeviationPrinciple.tendsto_log_measure`): if `a → ∞` and
  `⨅ I` over the interior of `s` equals `⨅ I` over its closure, then
  `(a n)⁻¹ log μₙ(s) → -⨅_s I` (Dembo–Zeitouni, (1.2.5)–(1.2.6), p. 5; Kallenberg, (16) p. 538;
  Ellis, Theorem II.3.4, p. 37).
- **Exponential decay off the zeros**
  (`LargeDeviationPrinciple.exists_pos_eventually_log_le`): for a good rate and a closed set `F`
  without zeros of `I` there is `c > 0` with `(a n)⁻¹ log μₙ(F) ≤ -c` eventually (Ellis,
  Theorem II.3.3, p. 37).

*Proof route.* Normalization: the upper bound at `F = univ` gives `0 ≤ -⨅ I`; a good rate
attains `0` on the compact set `{I ≤ 1}` by 1.1. Continuity sets: monotonicity of the outer
measure between interior and closure and the two bounds; the infimum over `s` lies between the
two equal infima. Decay: by 1.1 the infimum `m` of `I` on a nonempty `F` is attained, hence
positive; any `c < m` works, and `c = 1` when `F` is empty or `m = ⊤`.

*Needs:* 1.1.

### 1.3 The principle of the largest term

- **Largest term** (`limsup_log_sum`): for a nonempty finite index set and `a → ∞`, the
  normalized `limsup` of the logarithm of a sum of nonnegative sequences is the maximum of the
  normalized `limsup`s (Dembo–Zeitouni, Lemma 1.2.15, p. 7).

*Proof route.* `max ≤ ∑ ≤ (card s) · max`, and `(a n)⁻¹ log (card s) → 0`; the `limsup` of a
pointwise maximum of finitely many sequences is the maximum of the `limsup`s.

*Needs:* Mathlib `ENNReal.log` and `limsup`.

### 1.4 Uniqueness and the weak principle from balls

- **Uniqueness** (`LargeDeviationPrinciple.unique`): on a regular space, with `a → ∞`, two rate
  functions of the same family coincide (Dembo–Zeitouni, Lemma 4.1.4, p. 117; Kallenberg,
  Lemma 24.8, p. 538; Klenke, Theorem 23.8, p. 595, on Polish spaces; Ellis, Theorem II.3.2,
  p. 36).
- **Ball asymptotics** (`weakLargeDeviationPrinciple_of_ball`): on a pseudometric space, if for
  every `x` both the `limsup` and the `liminf` of `(a n)⁻¹ log μₙ(B(x, δ))` tend to `-I x` as
  `δ ↓ 0`, then `μ` satisfies the weak principle with rate `I`, and in particular `I` is lower
  semicontinuous (Dembo–Zeitouni, Theorem 4.1.11, p. 120; Anderson–Guionnet–Zeitouni,
  Theorem D.5 and Corollary D.6, p. 428).

*Proof route.* Uniqueness: for `x`, an open `U ∋ x` and a closed neighbourhood `F ⊇ U`, the
lower bound for `J` and the upper bound for `I` give `inf_F I ≤ inf_U J ≤ J x`. Regularity
provides such `F` inside every neighbourhood of `x`, and lower semicontinuity of `I` makes
`inf_F I` tend to `I x`, so `I x ≤ J x`; symmetry concludes. Balls: the lower bound at an open
`U ∋ x` uses a ball inside `U`; the upper bound on a compact `K` covers `K` by finitely many balls
on which the `limsup` is close to `-I x` and applies 1.3. Lower semicontinuity: the ball `limsup`
is monotone in `δ`, so `-I` is an infimum of upper semicontinuous functions of `x`.

*Needs:* 1.3.

### 1.5 Exponential tightness

- **Compact to closed** (`IsExponentiallyTight.limsup_log_measure_le`): for an exponentially
  tight family and `a → ∞`, if every compact set obeys the upper bound with a rate `I`, then
  every closed set obeys it; neither a lower bound nor any property of `I` is used
  (Dembo–Zeitouni, Lemma 1.2.18(a), p. 8).
- **Weak plus tight is full** (`WeakLargeDeviationPrinciple.of_isExponentiallyTight`): on a
  Hausdorff space, with `a → ∞`, an exponentially tight family satisfying the weak principle
  satisfies the principle, and its rate is good (Dembo–Zeitouni, Lemma 1.2.18, p. 8;
  Anderson–Guionnet–Zeitouni, Theorem D.4, p. 428).
- **Polish forces tightness** (`LargeDeviationPrinciple.isExponentiallyTight`): on a Polish space,
  a principle for probability measures with a good rate is exponentially tight (Kallenberg,
  Lemma 24.9(iii), p. 539; Dembo–Zeitouni, Exercise 4.1.10, p. 119).

*Proof route.* Compact to closed: `μₙ(F) ≤ μₙ(F ∩ K_M) + μₙ(K_Mᶜ)` with `F ∩ K_M` compact, the
compact upper bound on `F ∩ K_M`, 1.3 and `M → ∞`. Weak plus tight: the upper bound is the
previous bullet; the lower bound on the open set `K_Mᶜ` gives `I > M` off `K_M`, so `{I ≤ M}` is a
closed subset of a compact set. Polish (Kallenberg, proof of Lemma 24.9(iii), p. 540): fix
`M > 0` and, for each `k ≥ 1`, a countable cover of `X` by open `1/k`-balls. Some finite union of
these balls contains the compact `{I ≤ M k + 1}`, so the upper bound on its closed complement
holds with `-(M k + 1)`; enlarging the finite union handles the finitely many remaining `n`, by
continuity from above of each `μ n`. This gives a finite union `U_k` of `1/k`-balls with
`μₙ(U_kᶜ) ≤ exp (-a n M k)` for every `n` with `a n > 0`. Summing the geometric series,
`limsup (a n)⁻¹ log μₙ((⋂ₖ U_k)ᶜ) ≤ -M`, and the closure of `⋂ₖ U_k` is totally bounded and
complete, hence compact.

*Needs:* 1.3, 1.4.

**Checks.**

- `LargeDeviationPrinciple`: the constant family `δ₀` on `ℝ` satisfies it at speed `n + 1` with
  rate `0` at `0` and `⊤` elsewhere; it does not with rate `0` everywhere, since the open set
  `(1/2, 3/2)` has measure `0` and the lower bound there would read `0 ≤ ⊥`.
- `LargeDeviationPrinciple` with `Real.log` (negative control): for `δ₀`, the set `{1}` has
  measure `0`. With `Real.log 0 = 0` the upper bound at `{1}` would read `0 ≤ -I 1`, forcing
  `I 1 = 0`, and the rate `0` at `0`, `⊤` elsewhere would fail the principle; with
  `ENNReal.log 0 = ⊥` it holds.
- `IsGoodRateFunction`: on `ℝ`, `x ↦ x²/2` is good; the rate identically `0` is lower
  semicontinuous and not good, its sublevel set `{I ≤ 0} = ℝ` not being compact.
- `IsExponentiallyTight` (negative control for 1.5): `δ_{n+1}` on `ℝ` at speed `n + 1` satisfies
  the weak principle with rate identically `⊤` (every compact set has measure `0` eventually,
  and the lower bound is vacuous), is not exponentially tight (every compact `K` has
  `μₙ(Kᶜ) = 1` eventually), and does not satisfy the principle (the closed set `ℝ` has measure
  `1`, and `0 > -⨅ I = ⊥`) (Dembo–Zeitouni, §1.2, p. 7).
- `WeakLargeDeviationPrinciple`: every family satisfying the principle satisfies the weak
  principle, compact sets being closed in a Hausdorff space.

### Examples

- Ball asymptotics for Gaussian means: the law of the mean of `n + 1` standard Gaussians is
  `N(0, 1/(n+1))`, and `(n+1)⁻¹ log` of the measure of `B(x, δ)` tends to
  `-inf_{|y - x| < δ} y²/2`, which tends to `-x²/2` as `δ ↓ 0`; 1.4 gives the weak principle
  with rate `x²/2`, and 1.5 the full one.
- Exponential decay: for the same family and `F = {|x| ≥ 1}`, 1.2 gives
  `(n+1)⁻¹ log μₙ(F) ≤ -c` eventually for every `c < 1/2`.

### Dependencies

1.1 → 1.2; 1.3 → 1.4 → 1.5.

## Layer 2: exponential moments

### 2.1 The exponential Chebyshev bound

- **Upper bound on compact sets** (`limsup_log_measure_le_of_lintegral_exp`): let `F j`,
  `j ∈ J`, be continuous real functions and `Λ j ∈ EReal` bounds with
  `limsup (a n)⁻¹ log ∫⁻ exp (a n · F j) dμₙ ≤ Λ j`. Then every compact `K` satisfies
  `limsup (a n)⁻¹ log μₙ(K) ≤ -inf_{x ∈ K} sup_j (F j x - Λ j)`.

This is the abstract form of Dembo–Zeitouni, Theorem 4.5.3, p. 149, where `J` is the dual of a
topological vector space and `F j` the evaluation; Cramér's theorem (4.3–4.4), the Gärtner–Ellis
upper bound (5.1) and Sanov's upper bound (6.3) are instances.

*Proof route.* Fix `x ∈ K` and `ε > 0`, choose `j` with `F j x - Λ j` within `ε` of the supremum
(or above `1/ε` when it is `⊤`), and the open set `U = {F j > F j x - ε}`. Markov's inequality on
`U` gives `μₙ(U) ≤ exp (-a n (F j x - ε)) ∫⁻ exp (a n · F j) dμₙ`. Cover `K` by finitely many
such `U` and apply 1.3.

*Needs:* 1.3.

### 2.2 Varadhan's lemma

- The Laplace principle `LaplacePrinciple μ a I`: for every bounded continuous `f`,
  `(a n)⁻¹ log ∫⁻ exp (a n · f) dμₙ → sup_x (f x - I x)` in `EReal` (Dupuis–Ellis,
  Definition 1.2.2, p. 7, with the sign of `f` reversed).
- **Varadhan's lemma, bounded form** (`LargeDeviationPrinciple.laplacePrinciple`): for
  probability measures and `a → ∞`, the principle implies the Laplace principle with the same
  rate (Dupuis–Ellis, Theorem 1.2.1, p. 5; Anderson–Guionnet–Zeitouni, Theorem D.8, p. 429;
  Klenke, Theorem 23.17, p. 603; Kallenberg, Theorem 24.10, pp. 540–541; Ellis, Theorem II.7.1,
  p. 51).
- **Varadhan's lemma, tail form** (`LargeDeviationPrinciple.tendsto_log_lintegral_exp`): for a
  good rate, a continuous `φ`, and the tail condition
  `lim_{M→∞} limsup_n (a n)⁻¹ log ∫⁻_{φ ≥ M} exp (a n · φ) dμₙ = -∞`, the normalized logarithm of
  `∫⁻ exp (a n · φ) dμₙ` tends to `sup_x (φ x - I x)` (Dembo–Zeitouni, Theorem 4.3.1 with (4.3.2),
  p. 137, and Lemmas 4.3.6 and 4.3.8, p. 138).
- **Moment condition** (`tendsto_limsup_log_setLIntegral_exp_of_moment`): for a measurable `φ`,
  if for some `γ > 1` the `limsup` of `(a n)⁻¹ log ∫⁻ exp (a n · γ φ) dμₙ` is `< ⊤`, the tail
  condition holds (Dembo–Zeitouni, (4.3.3), p. 137).

*Proof route.* Lower bound: for `x` and `ε`, the open set `{φ > φ x - ε}` and the lower bound of
the principle. Upper bound for bounded `f`: split the range of `f` into finitely many closed
slabs `{c_k ≤ f ≤ c_{k+1}}` of width `ε`, bound each integral by `exp (a n c_{k+1}) μₙ(slab)`, use
the upper bound of the principle and 1.3; no goodness or regularity is used. Tail form: the same
on `{φ ≤ M}`, the tail condition for `{φ ≥ M}`, and 1.3; goodness makes `sup (φ - I)` over
`{φ ≤ M}` stable. Moment: on `{φ ≥ M}`,
`exp (a n φ) ≤ exp (-(γ - 1) a n M) exp (a n γ φ)` once `a n > 0`; the set and both integrands
are measurable because `φ` is, so the bound integrates, and the `limsup` is at most
`-(γ - 1) M + C → -∞`.

*Needs:* 1.1, 1.3.

### 2.3 The Laplace principle

- **Equivalence** (`laplacePrinciple_iff`): on a pseudometric space, for probability measures, a
  good rate and `a → ∞`, the Laplace principle holds if and only if the large deviation principle
  does (Dupuis–Ellis, Theorem 1.2.3, p. 8, and Theorem 1.2.1, p. 5).

*Proof route.* One direction is 2.2. Conversely, for a closed `F` the bounded Lipschitz functions
`f_k x = -k · min (dist (x, F), 1)` decrease to `-∞ · 1_{Fᶜ}`, so
`log μₙ(F) ≤ log ∫ exp (a n f_k) dμₙ`, and `sup (f_k - I) → -inf_F I` by goodness. For an open
`G ∋ x` with `I x < ⊤`, take `f = -k · min (dist (·, x)/δ, 1)` with `B(x, δ) ⊆ G` and split
`∫ exp (a n f)` over `G` and `Gᶜ`.

*Needs:* 2.2.

### 2.4 Exponential tilting

- **Tilted principle** (`LargeDeviationPrinciple.tilted`): for probability measures, `a → ∞` and
  a bounded continuous `F`, the tilted family `(μ n).tilted (a n · F)` satisfies the principle
  with rate `I - F + sup (F - I)` (Ellis, Theorem II.7.2, p. 52; Klenke, Theorem 23.19, p. 605;
  Anderson–Guionnet–Zeitouni, Theorem D.8, p. 429, which prints the supremum with the wrong
  sign). The sources assume a good rate; the proof route does not use goodness.

The rate is formed in `EReal` and returned to `ℝ≥0∞` by `EReal.toENNReal`; it is nonnegative
because `sup (F - I) ≥ F x - I x` for every `x`, and it is `⊤` exactly where `I` is.

*Proof route.* The density of the tilted law is `exp (a n F) / ∫ exp (a n F) dμₙ`. The
denominator is 2.2. For a closed set the numerator is the slab argument of 2.2 restricted to
the set, and for an open set the lower-bound argument of 2.2 restricted to it.

*Needs:* 2.2; Mathlib `Measure.tilted`.

### 2.5 Bryc's inverse Varadhan lemma

- **Bryc's lemma** (`largeDeviationPrinciple_of_tendsto_log_lintegral_exp`): on a completely
  regular Hausdorff space (`T35Space`), let `μ` be an exponentially tight family of probability
  measures and `a → ∞`, and suppose the limit
  `Λ f = lim (a n)⁻¹ log ∫⁻ exp (a n · f) dμₙ` exists in `ℝ` for every bounded continuous `f`.
  Then `I x = sup_f (f x - Λ f)` is a good rate function, `μ` satisfies the principle with
  rate `I`, and `Λ f = sup_x (f x - I x)` for every `f` (Dembo–Zeitouni, Theorem 4.4.2, p. 142;
  Kallenberg, Theorem 24.10, pp. 540–541; Dupuis–Ellis, Theorem 1.3.8, p. 30).

In `Suggested.lean` the rate is `⨆ f, ENNReal.ofReal (f x - Λ f)`; since `Λ 0 = 0` the term
`f = 0` is `0`, and this is the `EReal` supremum without truncation.

*Proof route.* The upper bound on compact sets is 2.1 with `J` the bounded continuous functions,
`F f = f` and the given limits. The lower bound at `x ∈ G` uses complete regularity: a continuous
`f : X → [0, 1]` with `f x = 1` and `f = 0` off `G` gives
`∫ exp (a n m (f - 1)) ≤ μₙ(G) + exp (-a n m)`, whence the lower bound by 1.3 and `m → ∞`. 1.5
gives the full principle with a good rate, and 2.2 the identity for `Λ`.

*Needs:* 1.5, 2.1, 2.2.

**Checks.**

- `LaplacePrinciple`: the constant family `δ₀` satisfies it with rate `0` at `0`, `⊤` elsewhere,
  since `(a n)⁻¹ log exp (a n f 0) = f 0 = sup (f - I)`.
- `LaplacePrinciple` needs the speed inside the exponent (negative control): with `∫ exp f dμₙ`
  in place of `∫ exp (a n f) dμₙ`, the family `δ₀` gives `(a n)⁻¹ f 0 → 0`, not `f 0`.
- `LaplacePrinciple` is stated for bounded `f` only: for the family `N(0, 1/(n+1))` at speed
  `n + 1` and the unbounded `φ x = x`, the limit `sup (x - x²/2) = 1/2` holds by the moment form
  of 2.2, while for the law `ν` with density proportional to `exp (-|x|)` on `ℝ` the constant
  family `ν` has `∫ exp ((n+1) x) dν = ⊤` for every `n`.
- `LaplacePrinciple` with the sign of Dupuis–Ellis: their `-(1/n) log E exp (-n h)` tends to
  `inf (h + I)`, which is the present limit for `f = -h` with both sides negated.

### Examples

- Varadhan for Gaussian means: for `N(0, 1/(n+1))` at speed `n + 1` and `φ x = t x`, the moment
  condition holds for every `γ` and `(n+1)⁻¹ log E exp ((n+1) t X̄) = t²/2 = sup_x (t x - x²/2)`
  exactly, for every `n`.
- Tilting a fair coin: the means of `n + 1` fair `{0, 1}` coins satisfy the principle with rate
  `I x = x log (2x) + (1 - x) log (2(1 - x))` on `[0, 1]` (4.3). Tilting by `F x = x` gives
  `sup (F - I) = log ((1 + e)/2) ≈ 0.620115`, and the tilted rate at `x = 0.4` is
  `0.240250`, the rate of the coin with success probability `e/(1 + e)` there, as 2.4 predicts.

### Dependencies

2.1 needs 1.3; 2.2 needs 1.1, 1.3; 2.3 and 2.4 need 2.2; 2.5 needs 1.5, 2.1, 2.2.

## Layer 3: transformations

### 3.1 Contraction and inverse contraction

- The contraction principle (a continuous image of a family with a principle and a good rate
  satisfies the principle with the image rate `J y = inf_{f x = y} I x`): RandomMatrices §9.1
  (Anderson–Guionnet–Zeitouni, Theorem D.7, pp. 428–429; Dembo–Zeitouni, Theorem 4.2.1, p. 126;
  Klenke, Theorem 23.16, p. 603; Kallenberg, Theorem 24.11(i), p. 542; Dupuis–Ellis,
  Theorem 1.3.2, p. 18).
- **Goodness of the image rate** (`IsGoodRateFunction.iInf_preimage`): for a good `I` and a
  continuous `f` into a Hausdorff space, `J` is good, and the infimum over every nonempty fibre is
  attained (Dembo–Zeitouni, Theorem 4.2.1, p. 126).
- **Inverse contraction** (`IsExponentiallyTight.largeDeviationPrinciple_of_map`): if `μ` is
  exponentially tight on a Hausdorff space, `f` is continuous and injective into a Hausdorff Borel
  space, and the images satisfy the weak principle with rate `J`, then `μ` satisfies the principle
  with the good rate `J ∘ f` (Dembo–Zeitouni, Theorem 4.2.4, p. 127; Kallenberg,
  Theorem 24.11(ii), pp. 542–543).

*Proof route.* Goodness: `{J ≤ c} = f '' {I ≤ c}` by attainment on the closed fibres (1.1), a
continuous image of a compact set. Inverse contraction: images of the compacts `K_M` are compact,
so the images are exponentially tight and 1.5 makes `J` good with the full principle. On each
`K_M`, `f` is a homeomorphism onto its image, so a closed `F` has `f (F ∩ K_M)` closed and an open
`G` meets `K_M` in the trace of an open set of `Y`; 1.3 and `M → ∞` conclude.

*Needs:* 1.1, 1.3, 1.5; RandomMatrices §9.1.

### 3.2 Exponential equivalence

- `ExponentiallyEquivalent P a Y Z` (local copy of RandomMatrices §9.1): for every `δ > 0`,
  `(a n)⁻¹ log Pₙ{dist (Yₙ, Zₙ) > δ} → ⊥` (Kallenberg, (26) p. 545; Dembo–Zeitouni,
  Definition 4.2.10, p. 130).
- **Transfer** (`ExponentiallyEquivalent.largeDeviationPrinciple_iff`): on a separable
  pseudometric Borel space, for measurable sequences, `a → ∞` and a good rate `I`, the laws of
  `Y` satisfy the principle with rate `I` if and only if the laws of `Z` do (Dembo–Zeitouni,
  Theorem 4.2.13, p. 130; Kallenberg, Lemma 24.13, p. 545; Dupuis–Ellis, Theorem 1.3.3, p. 19).

*Proof route.* For closed `F`, `{Zₙ ∈ F} ⊆ {Yₙ ∈ F^δ} ∪ {dist > δ}` with the closed
`δ`-thickening `F^δ`; 1.3 and goodness give `inf_{F^δ} I → inf_F I` as `δ ↓ 0` (1.1). For open
`G ∋ x`, `{Yₙ ∈ B(x, 2δ)} ⊆ {Zₙ ∈ G} ∪ {dist > δ}` once `B(x, 3δ) ⊆ G`. Separability makes
`ω ↦ dist (Yₙ ω, Zₙ ω)` measurable.

*Needs:* 1.1, 1.3.

### 3.3 Projective limits

- **Dawson–Gärtner for sequence spaces** (`largeDeviationPrinciple_pi`): let `S i`, `i ∈ ℕ`, be
  metrizable second-countable Borel spaces and `μ` a family of probability measures on
  `∀ i, S i`. If `a → ∞` and for every `k` the laws of the first `k` coordinates satisfy the
  principle with a good rate `I k`, then `μ` satisfies the principle with the good rate
  `x ↦ sup_k I k (x restricted to Fin k)` (Kallenberg, Theorem 24.12, pp. 544–545, for metric
  spaces; Dembo–Zeitouni, Theorem 4.6.1, p. 162, for general projective systems).

*Proof route* (Kallenberg, pp. 544–545). By the contraction principle and uniqueness (1.4; the
finite products are metrizable, hence regular) the rates are compatible: `I k` is the image of
`I l` under restriction for `k ≤ l`. The sublevel sets of the supremum are the projective limits
of the compact sublevel sets of the `I k`, hence compact, and the supremum is lower
semicontinuous. Lower bound: an open `G ∋ x` contains a cylinder over an open set of the first
`k` coordinates, which carries the lower bound of `I k ≤ I`. Upper bound: a closed `F` lies in the
cylinder over the closure of its `k`-th projection for every `k`, which gives the bound with
`inf I k` over that closure; compatibility and goodness show that these infima increase to
`inf_F I`. Second countability makes the Borel σ-algebra of the product the product σ-algebra, so
the projections are measurable.

*Needs:* 1.1, 1.4, 3.1; Mathlib `Measure.infinitePi` for the examples.

**Checks.**

- `ExponentiallyEquivalent`: `Yₙ = Z + (n+1)⁻¹` and `Zₙ = Z` for any random variable `Z` are
  exponentially equivalent at any speed tending to `∞`, since `{dist > δ}` is empty once
  `n + 1 > 1/δ` and `log 0 = ⊥`.
- `ExponentiallyEquivalent` is stronger than convergence in probability (negative control): on
  `[0, 1]` with Lebesgue measure, let `Yₙ` be the indicator of an interval of length
  `2^(-(n+1))` and `Zₙ = 0`. At speed `n + 1` and `δ = 1/2` the normalized logarithm is
  `(n+1)⁻¹ log 2^(-(n+1)) = -log 2`, not `⊥`, although `Yₙ - Zₙ → 0` in probability.
- `ExponentiallyEquivalent` of a sequence with itself holds at any speed tending to `∞`, every
  set `{dist > δ}` being empty.

### Examples

- Contraction of the Gaussian principle: the means of `n + 1` independent standard Gaussians in
  `ℝ²` have rate `|x|²/2` (4.4); the first coordinate has rate `inf_y (x² + y²)/2 = x²/2`,
  attained at `y = 0`.
- Projective limit of Gaussian sequences: under `μₙ = ⨂_i N(0, 1/(n+1))` on `ℝ^ℕ`, the first `k`
  coordinates have rate `∑_{i<k} xᵢ²/2`, and 3.3 gives the good rate `∑_i xᵢ²/2`, finite exactly
  on `ℓ²`.

### Dependencies

3.1 needs 1.1, 1.3, 1.5; 3.2 needs 1.1, 1.3; 3.3 needs 1.1, 1.4, 3.1.

## Layer 4: Cramér's theorem

### 4.1 The logarithmic moment generating function and its transform

Let `E` be a real inner product space with a measurable structure in which open sets are
measurable, and `ν` a probability law on `E`.

- `logMGF ν t` (Conventions), `legendreRate Λ x` (Conventions) and `sampleMeanLaw ν n`.
- **Convexity and lower semicontinuity**
  (`lowerSemicontinuous_legendreRate_logMGF`): `legendreRate (logMGF ν)` is lower semicontinuous
  with a convex real epigraph and equals the untruncated Fenchel conjugate of `logMGF ν`, and
  `logMGF ν` has a convex real epigraph (Dembo–Zeitouni, Lemma 2.2.5(a), pp. 27–28, and
  Lemma 2.2.31(a), p. 36).
- **Zero at the mean** (`legendreRate_logMGF_integral`): if `ν` is integrable on a complete `E`,
  the rate vanishes at the mean `∫ x dν` (Dembo–Zeitouni, Lemma 2.2.5(b), p. 28).
- **Goodness** (`isGoodRateFunction_legendreRate_logMGF`): in finite dimension, if `0` is an
  interior point of `{t | logMGF ν t < ⊤}`, the rate is good (Dembo–Zeitouni, Lemma 2.2.20,
  p. 34, and Lemma 2.2.31(b), p. 36).
- **Differentiability**: on the interior of the domain `logMGF ν` is real-analytic with gradient
  `E[X e^{⟪t, X⟫}]/E[e^{⟪t, X⟫}]`, and if `∇Λ(η) = y` then the rate at `y` is `⟪η, y⟫ - Λ(η)`
  (Dembo–Zeitouni, Lemma 2.2.5(c), (2.2.9)–(2.2.10), p. 28).

*Proof route.* Convexity of `logMGF` by Hölder, applied to the measurable functions
`x ↦ exp ⟪t, x⟫`; `logMGF ν 0 = 0`, so the conjugate is `≥ 0` and
the truncation is the identity. Lower semicontinuity and convexity of the conjugate are
`lowerSemicontinuous_fenchelConjugate_innerₗ` and `convex_epigraph_fenchelConjugate`. The zero at
the mean is Jensen, `logMGF ν t ≥ ⟪t, m⟫`. Goodness: `logMGF ν t ≤ C` on a ball of radius `δ`
gives `legendreRate ≥ δ |x| - C`, so sublevel sets are bounded, and closed by lower
semicontinuity. Differentiability on `ℝ` is Mathlib's `deriv_cgf` on the interior of
`integrableExpSet`, where `logMGF` and `cgf` agree; in finite dimension, along every line.

*Needs:* Tau Ceti `fenchelConjugate`; Mathlib `cgf`, `integrableExpSet`, `deriv_cgf`.

### 4.2 Chernoff's bound and the tail limit

- **Chernoff's bound** (`log_sampleMeanLaw_Ici_le`): for an integrable law `ν` on `ℝ` and
  `x ≥ ∫ y dν`, the mean of `n + 1` observations satisfies
  `(n+1)⁻¹ log P(X̄ ≥ x) ≤ -legendreRate (logMGF ν) x` for every `n` (Dembo–Zeitouni,
  (2.2.11)–(2.2.12), p. 30; Kallenberg, Theorem 24.3, p. 532, proof; Klenke, Theorem 23.3, p. 590).
- **Cramér–Chernoff limit** (`tendsto_log_sampleMeanLaw_Ici`): under the same hypotheses,
  `(n+1)⁻¹ log P(X̄ ≥ x) → -legendreRate (logMGF ν) x` (Kallenberg, Theorem 24.3, p. 532).

*Proof route.* For `λ > 0`, Markov's inequality and independence give
`P(X̄ ≥ x) ≤ exp (-(n+1)(λ x - Λ(λ)))` (Mathlib `measure_ge_le_exp_mul_mgf`,
`iIndepFun.mgf_sum` where the moment is finite, and trivially where it is `⊤`). For `λ ≤ 0`,
Jensen gives `λ x - Λ(λ) ≤ λ (x - m) ≤ 0`, so the supremum over `λ > 0` together with `0` is the
whole transform. Let `M ≤ ∞` be the essential supremum of `ν`. For `x < M`, the lower bound of
4.3 on the open set `(x, ∞)` gives `liminf ≥ -inf_{y > x} legendreRate (logMGF ν) y`, which is
`-legendreRate (logMGF ν) x` because the transform is finite, convex and nondecreasing on
`[m, M)`, hence right-continuous there. For `x = M` finite, `P(X̄ ≥ M) = ν{M}^(n+1)` exactly and
the transform at `M` is `-log ν{M}`; for `x > M`, `P(X̄ ≥ x) = 0` for every `n` and the transform
is `⊤`.

*Needs:* 4.1, 4.3 for the limit; Mathlib `measure_ge_le_exp_mul_mgf`, `iIndepFun.mgf_sum`.

### 4.3 Cramér's theorem on the real line

- **Cramér's theorem on `ℝ`** (`largeDeviationPrinciple_sampleMeanLaw_real`): for every
  probability law `ν` on `ℝ`, without moment assumptions, the sample means satisfy the principle
  at speed `n + 1` with the convex rate `legendreRate (logMGF ν)` (Dembo–Zeitouni,
  Theorem 2.2.3, p. 27; Klenke, Theorem 23.11, p. 597).

The rate need not be good: it is identically `0` when `logMGF ν` is `⊤` off `0`
(Dembo–Zeitouni, Lemma 2.2.5(b), p. 27).

*Proof route* (Dembo–Zeitouni, proof of Theorem 2.2.3). Upper bound: if the mean `m` is finite,
a closed `F` not containing `m` lies in `(-∞, x₋] ∪ [x₊, ∞)` with `x₋ < m < x₊` the nearest points
of `F`, and 4.2 with its mirror image bounds both tails; the transform is monotone on each side
of `m`, so the infimum over `F` is attained at `x₋` or `x₊`. If the mean is `±∞` or undefined,
the transform is monotone on all of `ℝ` (Lemma 2.2.5(b)) and one tail suffices; it is bounded by
the Markov step of the route of 4.2, which needs no integrability: for every law, every `x` and
every `n`, `(n+1)⁻¹ log P(X̄ ≥ x) ≤ -sup_{λ ≥ 0} (λ x - Λ(λ))`, and this supremum is the whole
transform when `Λ = ⊤` on `(-∞, 0)` (mirror image when `Λ = ⊤` on `(0, ∞)`). Lower bound: it
suffices to show `liminf (n+1)⁻¹ log P(X̄ ∈ (y - δ, y + δ)) ≥ -legendreRate (logMGF ν) y`. If
`logMGF ν` is finite everywhere and the supremum defining the rate at `y` is attained at `η`,
tilt by `η` (the tilted law has mean `y`) and apply the weak law under the tilted law. Otherwise
truncate: the restricted moments `log ∫_{[-M, M]} exp (λ x) dν` are finite, increase to
`logMGF ν` as `M → ∞`, and the tilting argument applies to the restricted law; the infima over
`λ` pass to the limit by compactness of a sublevel set in `λ`, as in Dembo–Zeitouni.

*Needs:* 1.3, 4.1, 4.2 (bound, and the Markov step of its route); Mathlib `Measure.tilted`, the
weak law from `strong_law_ae`.

### 4.4 Cramér's theorem in finite dimension

- **Cramér's theorem in `E`** (`largeDeviationPrinciple_sampleMeanLaw`): if `E` is a
  finite-dimensional real inner product space with its Borel σ-algebra and `logMGF ν t < ⊤` for
  every `t`, the sample means satisfy the principle at speed `n + 1` with the good convex rate
  `legendreRate (logMGF ν)` (Dembo–Zeitouni, Theorem 2.2.30, p. 36; Kallenberg, Theorem 24.5,
  p. 534; Ellis, Theorem II.4.1, pp. 37–38).

*Proof route.* Upper bound on compact sets: 2.1 with `J = E`, `F t = ⟪t, ·⟫` and the exact
identity `(n+1)⁻¹ log ∫ exp ((n+1)⟪t, X̄⟫) = logMGF ν t`. Exponential tightness: Chernoff in the
`2 d` coordinate directions of an orthonormal basis. 1.5 gives closed sets. Lower bound: since
`logMGF ν` is finite, differentiable and convex on all of `E`, every `y` in the relative interior
of the domain of the rate is `∇ logMGF ν (η)` for some `η` or a limit of such points with
converging rates; tilt by `η` as in 4.3. Equivalently, 4.4 is the instance of 5.3 with
`Λ = logMGF ν`, essentially smooth because its domain is all of `E`.

*Needs:* 1.5, 2.1, 4.1, 4.3.

**Checks.**

- `logMGF`: for `N(0, 1)` on `ℝ`, `logMGF t = t²/2` and the rate is `x²/2`; at `x = 1.5` it is
  `1.125`.
- `logMGF` against Mathlib's `cgf` (negative control): for the standard Cauchy law, `logMGF t = ⊤`
  for `t ≠ 0` and `0` at `t = 0`, so the rate is identically `0`, which is right: the sample mean
  of Cauchy observations is again standard Cauchy, and no interval decays. Mathlib's `cgf` is the
  junk value `0` for every `t`, and its transform `sup_t t x` is `⊤` for every `x ≠ 0`, a rate that
  fails the upper bound on the closed set `[1, 2]`: its measure is
  `(arctan 2 - arctan 1)/π = 0.102416` for every `n`, so the left side is `0` and the right `⊥`.
- `legendreRate` for the Bernoulli law with success probability `p`:
  `x log (x/p) + (1 - x) log ((1 - x)/(1 - p))` on `[0, 1]` and `⊤` outside (Dembo–Zeitouni,
  Exercise 2.2.23, p. 35). At `p = 0.3`, `x = 0.6` it is `0.192042`; at `p = 1/2`, `x = 1` it is
  `log 2 = 0.693147`.
- `legendreRate` for the Poisson law with mean `θ`: `θ - x + x log (x/θ)` for `x ≥ 0`, `θ` at
  `x = 0`, `⊤` for `x < 0` (Dembo–Zeitouni, Exercise 2.2.23, p. 35). At `θ = 1`, `x = 2` it is
  `2 log 2 - 1 = 0.386294`.
- `legendreRate` for the exponential law with mean `1`: `logMGF t = -log (1 - t)` for `t < 1` and
  `⊤` for `t ≥ 1`, the rate is `x - 1 - log x` for `x > 0` (`1 - log 2 = 0.306853` at `x = 2`) and
  `⊤` for `x ≤ 0` (Dembo–Zeitouni, Exercise 2.2.23, p. 35).
- `legendreRate` truncation (negative control): for `Λ t = 1 + t²/2`, which has `Λ 0 = 1 ≠ 0`,
  the conjugate at `0` is `-1` and `legendreRate Λ 0 = 0`, so the identity with the untruncated
  conjugate in 4.1 needs `Λ = logMGF ν` of a probability law.
- `sampleMeanLaw ν 0 = ν` (one observation), and for `ν` the fair coin on `{0, 1}`,
  `sampleMeanLaw ν 1` gives mass `1/4, 1/2, 1/4` to `0, 1/2, 1`.
- `sampleMeanLaw` and Chernoff at `n = 0`: for the fair coin and `x = 1`,
  `P(X̄ ≥ 1) = 1/2 = exp (-log 2)`, so 4.2 holds with equality.

### Examples

- Fair coin: the means of `n + 1` fair `{0, 1}` coins have
  `(n+1)⁻¹ log P(X̄ ≥ 3/4) → -(log 2 + (3/4) log (3/4) + (1/4) log (1/4)) = -0.130812`; the exact
  binomial values at `n + 1 = 100` and `1000` are `-0.150820` and `-0.133945`.
- Gaussian vectors: for `N(0, Id)` on `EuclideanSpace ℝ (Fin d)`, `logMGF t = |t|²/2` and 4.4
  gives the rate `|x|²/2` (Klenke, Example 23.4, p. 592, for `d = 1`).
- Symmetric signs: for `ν = (δ₋₁ + δ₁)/2`, `logMGF t = log cosh t` and the rate is
  `((1 + x) log (1 + x) + (1 - x) log (1 - x))/2` on `[-1, 1]` (Klenke, Example 23.5, p. 593),
  the fair-coin rate transported by `x ↦ 2x - 1`.

### Dependencies

4.1 → 4.2 (bound) → 4.3 → 4.2 (limit); 4.4 needs 1.5, 2.1, 4.1, 4.3.

## Layer 5: the Gärtner–Ellis theorem

Throughout, `E` is a finite-dimensional real inner product space with its Borel σ-algebra, `μ`
a family of probability measures, `a → ∞`, and
`Λ t = lim (a n)⁻¹ log ∫⁻ exp (a n ⟪t, x⟫) dμₙ` exists in `EReal` for every `t`, with `0` in the
interior of `{Λ < ⊤}` (Dembo–Zeitouni, Assumption 2.3.2, p. 43).

### 5.1 The upper bound

- **Gärtner–Ellis upper bound** (`gartnerEllis_upperBound`): `Λ` has a convex real epigraph and
  never takes the value `⊥`, `legendreRate Λ` is a good rate, and every closed set obeys the upper
  bound with rate `legendreRate Λ` (Dembo–Zeitouni, Theorem 2.3.6(a), p. 44, and
  Lemma 2.3.9(a), p. 46; Ellis, Theorem II.6.1, p. 47).

*Proof route.* Convexity of each normalized log-moment by Hölder passes to the limit; `Λ 0 = 0`
and convexity with `0` interior give `Λ > ⊥`. Goodness as in 4.1. The upper bound on compact sets
is 2.1 with `F t = ⟪t, ·⟫`; exponential tightness is Chernoff along `± δ eᵢ` for an orthonormal
basis with `δ` small enough that these lie in the interior of the domain; 1.5 concludes.

*Needs:* 1.5, 2.1, 4.1.

### 5.2 The lower bound over exposed points

- `IsExposedPoint I y η`: `x ↦ ⟪η, x⟫ - I x` has `y` as its strict maximizer (Dembo–Zeitouni,
  Definition 2.3.3, p. 44).
- **Gärtner–Ellis lower bound** (`gartnerEllis_lowerBound`): for every open `G`, the lower bound
  holds with the infimum of `legendreRate Λ` taken over the exposed points of `legendreRate Λ` in
  `G` that have an exposing hyperplane in the interior of `{Λ < ⊤}` (Dembo–Zeitouni,
  Theorem 2.3.6(b), p. 44).

*Proof route.* For such `y` with exposing `η`, tilt `μₙ` by `exp (a n ⟪η, ·⟫)`. The tilted family
has limit `Λ (η + ·) - Λ η`, and 5.1 applied to it gives an upper bound with a rate that vanishes
only at `y`, because `y` is exposed; by 1.2 the tilted mass of `Gᶜ ∪ B(y, δ)ᶜ` decays
exponentially. Undoing the tilt costs at most `⟪η, y⟫ - Λ η + |η| δ` on `B(y, δ)`.

*Needs:* 1.2, 5.1.

### 5.3 Essential smoothness and the full principle

- `IsEssentiallySmoothSteep Λ`, essential smoothness in the steep form of Dembo–Zeitouni
  (Definition 2.3.5, p. 44): the interior of `{Λ < ⊤}` is nonempty, `Λ` is differentiable there,
  and it is steep: the norm of the gradient tends to `∞` at every point of the frontier of that
  interior. It differs from essential smoothness in convex analysis, whose third clause is the
  emptiness of the subdifferential off the interior of the domain, and agrees with it for proper
  closed convex `Λ`; essential smoothness in that sense is owned by ConvexAnalysisAndDuality §4.3,
  and this roadmap owns only the steep predicate in which the Gärtner–Ellis theorem uses it.

- **Rockafellar's lemma** (`exists_isExposedPoint_of_mem_intrinsicInterior`): if `Λ` has
  `Λ 0 = 0`, never takes the value `⊥`, has a convex real epigraph, and is lower semicontinuous
  and essentially smooth, every point of the relative interior of `{legendreRate Λ < ⊤}` is an
  exposed point of `legendreRate Λ` with an exposing hyperplane in the interior of `{Λ < ⊤}`
  (Dembo–Zeitouni, Lemma 2.3.12, p. 47).
- **Gärtner–Ellis theorem** (`gartnerEllis`): if moreover `Λ` is essentially smooth and lower
  semicontinuous, `μ` satisfies the principle with the good rate `legendreRate Λ`
  (Dembo–Zeitouni, Theorem 2.3.6(c), p. 44).

*Proof route.* Rockafellar: for `x` in the relative interior, the subdifferential of the
conjugate at `x` is nonempty; take `η` in it. By Fenchel–Moreau (`Λ` is lower semicontinuous and
convex) `x ∈ ∂Λ(η)`; steepness forces `η` into the interior of the domain, where `Λ` is
differentiable, so `x = ∇Λ(η)`, and a gradient point is exposed with exposing hyperplane `η`
(Dembo–Zeitouni, Lemma 2.3.9(b), p. 46). The theorem: 5.2 gives the lower bound over the relative
interior; for a convex lower semicontinuous rate every point of its domain is the limit along a
segment from a relative interior point with converging rates, so the infimum over `G` intersected
with the relative interior equals the infimum over `G` (Dembo–Zeitouni, proof of
Theorem 2.3.6(c)).

*Needs:* 5.1, 5.2; Tau Ceti `fenchelConjugate_innerₗ_fenchelConjugate_innerₗ`; Mathlib
`intrinsicInterior`, `gradient`.

**Checks.**

- `IsExposedPoint`: for `I x = x²/2` on `ℝ`, every `y` is exposed with `η = y`, since
  `y x - x²/2 = y²/2 - (x - y)²/2`.
- `IsExposedPoint` (negative control): for the rate of a non-steep `Λ` (below), every `y > 1` has
  `x ↦ x - legendreRate Λ x` constant `1/2` on `[1, ∞)`, so `y` is not exposed, and no other `η`
  is a supporting slope at `y`.
- `IsEssentiallySmoothSteep`: `Λ t = t²/2` is essentially smooth (domain `ℝ`, empty frontier);
  so is `Λ t = -log (1 - t)` on `t < 1`, `⊤` for `t ≥ 1`, whose derivative `1/(1 - t)` tends
  to `∞` at `1`.
- `IsEssentiallySmoothSteep` (negative control, steepness; Dembo–Zeitouni, Exercise 2.3.17(a),
  p. 51, asks for such a function among logarithmic moment generating functions):
  `Λ t = t²/2` for `t ≤ 1` and `⊤` for `t > 1` is convex and lower semicontinuous with domain
  `(-∞, 1]`, but the derivative tends to `1` at `1`. Its transform is `x²/2` for `x ≤ 1` and
  `x - 1/2` for `x > 1` (`1.5` at `x = 2`, `2.5` at `x = 3`), and no point `x > 1` of the relative
  interior `ℝ` of its domain is exposed, so Rockafellar's lemma fails without steepness.
- `IsEssentiallySmoothSteep` (negative control, differentiability; Ellis, Example II.6.2,
  pp. 47–48): for `μₙ = (δ₋₁ + δ₁)/2` at speed `n + 1`,
  `Λ t = lim (n+1)⁻¹ log cosh ((n+1) t) = |t|` (`0.630685` at `n + 1 = 10`, `0.693069` at
  `100` for `t = 0.7`, against the limit `0.7`). `Λ` is
  not differentiable at `0`, its transform is `0` on `[-1, 1]` and `⊤` outside, and the lower bound
  fails on the open set `(-1/2, 1/2)`, which has measure `0` for every `n`.

### Examples

- Cramér as an instance: for i.i.d. sums at speed `n + 1`, `Λ = logMGF ν` exactly, and 5.3 with
  `logMGF ν` finite everywhere recovers 4.4.
- Exponential observations: `Λ t = -log (1 - t)` for `t < 1` is essentially smooth, so the means
  of exponential observations with mean `1` satisfy the principle with rate `x - 1 - log x` by
  5.3, although `logMGF` is not finite everywhere and 4.4 does not apply.
- Steepness is sufficient, not necessary (Dembo–Zeitouni, Remark (d), p. 45): for `Zₙ`
  exponential with mean `1/(n+1)` at speed `n + 1`, `Λ t = 0` for `t < 1` and `⊤` for `t ≥ 1`,
  which is not steep. The transform is `x` on `[0, ∞)`, its only exposed point is `0`, and 5.2
  gives nothing off `0`; yet the density `(n+1) e^(-(n+1) z)` shows directly that the principle
  holds with rate `x` on `[0, ∞)`.

### Dependencies

5.1 → 5.2 → 5.3.

## Layer 6: Sanov's theorem

### 6.1 Finite alphabets

Let `α` be a finite type with the discrete topology and `μ` a probability measure on `α`.

- `empiricalLaw μ n`: the law of `empiricalMeasureOfFintype` of `n + 1` independent
  observations, on `ProbabilityMeasure α`.
- **Method of types** (`log_measure_empiricalMeasure_eq`): for every sample `y` of size `n + 1`
  the probability that the empirical measure equals that of `y` lies between
  `exp (-(n+1) H - |α| log (n + 2))` and `exp (-(n+1) H)`, where `H = klDiv (type of y) μ`
  (Dembo–Zeitouni, Lemma 2.1.9, p. 15, with Lemma 2.1.8, p. 14, for the size of a type class;
  Klenke, Lemma 23.12, p. 599).
- **Sanov's theorem for a finite alphabet** (`sanov_fintype`): `ν ↦ klDiv ν μ` is a good rate on
  `ProbabilityMeasure α`, `empiricalLaw μ` satisfies the principle with this rate at speed `n + 1`,
  and the upper bound holds for every set `Γ`, not only for closed sets (Dembo–Zeitouni,
  Theorem 2.1.10, p. 16; Klenke, Theorem 23.13, p. 600, for `μ` of full support).

*Proof route.* Types: the probability of a sample with type `ν` is `∏ μ(a)^{(n+1) ν(a)}`, which is
`exp (-(n+1)(H(ν) + klDiv ν μ))` with the Shannon entropy `H(ν)`; the number of samples of type
`ν` is a multinomial coefficient between `(n+2)^{-|α|} exp ((n+1) H(ν))` and `exp ((n+1) H(ν))`.
When `μ` gives mass `0` to a letter of `y`, both sides are `⊥` (`klDiv_of_not_ac`). Sanov: there
are at most `(n+2)^{|α|}` types, so the upper bound over any `Γ` follows by summing; the lower
bound at `ν` in an open `G` approximates `ν` by types with the same support. Goodness:
`ProbabilityMeasure α` is compact, and `klDiv` is lower semicontinuous
(`TauCeti.lowerSemicontinuous_klDiv_probabilityMeasure`).

*Needs:* 1.3; Mathlib `klDiv`, `Measure.pi`; Tau Ceti empirical measures and lower
semicontinuity of `klDiv`.

### 6.2 Empirical laws on Polish spaces

Let `E` be a Polish space with its Borel σ-algebra and `μ` a probability measure on `E`.

- **Exponential tightness** (`isExponentiallyTight_empiricalLaw`): `empiricalLaw μ` is
  exponentially tight at speed `n + 1` (Dembo–Zeitouni, Lemma 6.2.6, p. 261; Kallenberg,
  Lemma 24.17, p. 549).

*Proof route.* Choose compacts `K_k` with
`μ(K_kᶜ) ≤ exp (-2 k²)`; Chernoff for the sums of the indicators of `K_kᶜ` gives
`P(L_n(K_kᶜ) > 1/k) ≤ exp (-(n+1) k)`, and the set of `ν` with `ν(K_kᶜ) ≤ 1/k` for all `k ≥ M`
is tight, hence relatively compact by Prokhorov's theorem, and closed.

*Needs:* 1.3, 4.2 (bound); Mathlib `isCompact_closure_of_isTightMeasureSet`.

### 6.3 Sanov's theorem

- **Sanov's theorem** (`sanov`): `ν ↦ klDiv ν μ` is a good rate on `ProbabilityMeasure E`, and
  `empiricalLaw μ` satisfies the principle with it at speed `n + 1` (Dembo–Zeitouni,
  Theorem 6.2.10, p. 263, in the stronger τ-topology; Kallenberg, Theorem 24.15, p. 548;
  Dupuis–Ellis, Theorem 2.2.1, p. 50).

*Proof route.* Goodness: lower semicontinuity is
`TauCeti.lowerSemicontinuous_klDiv_probabilityMeasure`, and the sublevel sets are tight
(`TauCeti.isTightMeasureSet_setOf_klDiv_le` with `isTightMeasureSet_singleton`), hence relatively
compact by Prokhorov, and closed. Upper bound on compacts: 2.1 with `J` the bounded continuous
functions, `F f ν = ∫ f dν` (continuous in the weak topology), and the exact identity
`(n+1)⁻¹ log ∫ exp ((n+1) ∫ f dL_n) = log ∫ exp f dμ`; the resulting rate
`sup_f (∫ f dν - log ∫ exp f dμ)` is `klDiv ν μ` by
`TauCeti.klDiv_eq_iSup_boundedContinuousFunction_integral_sub_log_integral_exp` (a Polish space
is normal, and the sum of two finite measures is weakly regular there). Closed sets: 6.2 and
1.5; the Tau Ceti instance `TauCeti.MeasureTheory.ProbabilityMeasure.borelSpace` makes closed
sets of `ProbabilityMeasure E` measurable. Lower bound at `ν ∈ G` with
`klDiv ν μ < ⊤`: the weak topology is induced by finitely many integrals at a time, so `G`
contains `{ν' | |∫ fᵢ dν' - ∫ fᵢ dν| < ε, i ≤ k}`. Change measure from `μ^{n+1}` to `ν^{n+1}`
with density `exp (-∑ log (dν/dμ)(Xᵢ))`; under `ν^{n+1}` the strong law for the `k` functions
`fᵢ` and for `log (dν/dμ)` puts the empirical measure in `G` and the log density below
`(n+1)(klDiv ν μ + ε)` with probability tending to `1`. Kallenberg's route (embedding into a
compact metric space, Cramér in `ℝ^m`, Dawson–Gärtner and inverse contraction, pp. 549–550) is
the alternative through 3.1, 3.3 and 4.4.

*Needs:* 1.5, 2.1, 6.2; Tau Ceti Donsker–Varadhan formula, lower semicontinuity and tightness of
sublevel sets of `klDiv`, the Borel property of the Giry σ-algebra; Mathlib `strong_law_ae`,
Prokhorov's theorem.

**Checks.**

- `empiricalLaw μ 0` is the image of `μ` under `x ↦ δ_x`; for the fair coin on `{a, b}`,
  `empiricalLaw μ 1` gives mass `1/4` to `δ_a` and to `δ_b` and `1/2` to `(δ_a + δ_b)/2`.
- Method of types at `n = 0` (fair coin, `y = (a)`): the probability is `1/2`,
  `klDiv δ_a μ = log 2`, and the bounds read `-log 2 ≤ -log 2` and
  `-log 2 - 2 log 2 ≤ -log 2`. At `n = 1`, `y = (a, b)`: probability `1/2`, `H = 0`, and
  `-2 log 3 ≤ log (1/2) ≤ 0`.
- `empiricalLaw` with a missing letter (negative control for the use of `Real.log`): if
  `μ(b) = 0` and `y = (b)`, the probability is `0`, `klDiv δ_b μ = ⊤` and both sides are `⊥`;
  with `Real.log` and a real-valued entropy the left side would be `0` and the bound would fail.
- Sanov and Cramér agree on a finite alphabet: for the fair coin, the contraction
  `ν ↦ ∫ x dν` of the rate `klDiv ν μ` is the fair-coin rate of the Layer 4 Examples, `0.130812`
  at `3/4`.

### Examples

- `klDiv ν μ = 0` exactly at `ν = μ` (`klDiv_eq_zero_iff`), so by 1.2 the empirical measure leaves
  every weak neighbourhood of `μ` with exponentially small probability: a quantitative weak law.

### Dependencies

6.1 needs 1.3; 6.2 needs 1.3, 4.2; 6.3 needs 1.5, 2.1, 6.2.

## Downstream consumers

- [RandomMatrices](../RandomMatrices/README.md) §§9.2–9.5 state their principles with the
  definition of §9.1, which is the definition here; 1.5, 2.2 and 3.1–3.2 are the general tools
  those proofs use (exponential tightness, Varadhan's lemma, exponential equivalence).
- [OptimalTransport](../OptimalTransport/README.md) §13.13 proves Schilder's theorem in
  Laplace-principle form; 2.3 is the equivalence with the large deviation principle on the space
  of continuous paths, whose sup metric makes it a metric space.
- [DysonBrownianMotion](../DysonBrownianMotion/README.md) lists the large deviation theory of the
  empirical measure process among the topics outside that roadmap; Layers 1–3 are the framework
  in which it is stated.

## Beyond this roadmap (a roadmap for a roadmap; do not implement)

The following material is recorded only to fix the boundary. Contributors should not attempt it
under this roadmap.

- **Freidlin–Wentzell theory**: small-noise principles for diffusions and exit problems. They need
  strong solutions of stochastic differential equations with their continuity in the driving path,
  beyond StochasticCalculus as it stands.
- **Cramér's theorem beyond 4.3–4.4**: in `ℝ^d` under `0 ∈ int D` only (Dembo–Zeitouni,
  Corollary 6.1.6, p. 253), and in separable Banach and Polish vector spaces (Dembo–Zeitouni,
  §6.1). These need the subadditivity method and the convex-analysis duality of a general
  topological vector space.
- **Sanov's theorem in the τ-topology** and its consequences (Dembo–Zeitouni, §6.2), and the
  Gibbs conditioning principle (Dembo–Zeitouni, §7.3).
- **Large deviations for Markov chains and processes**: Donsker–Varadhan level-2 principles, the
  pair empirical measure, and level-3 (process-level) principles with the specific relative
  entropy (Ellis, Chapters II and IV; Dembo–Zeitouni, §§3.1 and 6.3–6.5).
- **Mogulskii's theorem and sample-path principles** for random walks (Dembo–Zeitouni, §5.1).
- **Statistical mechanics applications**: the Curie–Weiss model and equivalence of ensembles
  (Ellis, Chapters III–IV).
- **Moderate deviations and Bahadur efficiency** of tests.
- **Large deviations of random matrices**: RandomMatrices §§9.2–9.5 (owned there).

## Prior formalization

[lean-CKMA](https://github.com/bjbraams/lean-CKMA), the Core Knowledge in Mathematical Analysis
project (Apache 2.0), lists Cramér's, Sanov's and Varadhan's theorems, the contraction principle
and the Gärtner–Ellis theorem as entries 06.60–06.64 of its synopsis of results, recorded there
as not covered by Mathlib. Its files below are design ideas only and not prescriptive:
- `CKMA/Probability/LargeDeviations.lean`: a good rate function, a principle at the fixed speed
  `n + 1` with an `EReal`-valued normalized logarithm, and Varadhan's lemma for bounded continuous
  functions, proved;
- `CKMA/Probability/LimitTheorems/LargeDeviations.lean`: an `ENNReal`-logarithm moment
  generating function, Cramér's rate as a truncated supremum, Cramér's theorem on `ℝ` with a good
  rate under finiteness of exponential moments near `0`, proved, and Sanov's theorem on Polish
  spaces with goodness proved and the principle admitted;
- `CKMA/Probability/LimitTheorems/CramerLowerBound.lean`: the lower bound of Cramér's theorem on
  `ℝ` by truncation and tilting, proved.

Differences with this roadmap: the speed is general here, Cramér's theorem on `ℝ` has no moment
assumption, and Gärtner–Ellis, Bryc, Dawson–Gärtner and exponential equivalence have no
counterpart there. Entry 06.67 (Schilder) is owned by OptimalTransport §13.13, and entry 06.68
(Freidlin–Wentzell) is listed in Beyond.

## References

The locators refer to these editions; page numbers are printed page numbers.

- G. W. Anderson, A. Guionnet and O. Zeitouni, *An Introduction to Random Matrices*, Cambridge
  University Press, 2009. Appendix D (large deviation principles), pp. 427–429: Definitions
  D.1–D.3, Theorems D.4, D.5, D.7, D.8 and Corollary D.6.
- A. Dembo and O. Zeitouni, *Large Deviations Techniques and Applications*, 2nd ed., Springer,
  1998 (corrected printing 2010). §1.2 (definitions, Lemmas 1.2.15 and 1.2.18), §2.1 (method of
  types and Theorem 2.1.10), §2.2 (Cramér's theorem, Lemmas 2.2.5, 2.2.20 and 2.2.31, Theorems
  2.2.3 and 2.2.30, Exercise 2.2.23), §2.3 (Gärtner–Ellis, Definitions 2.3.3 and 2.3.5,
  Theorem 2.3.6, Lemmas 2.3.9 and 2.3.12, Exercise 2.3.17), §§4.1–4.6 (Lemma 4.1.4, Theorems
  4.1.11, 4.2.1, 4.2.4, 4.2.13, 4.3.1, 4.4.2, 4.5.3, 4.6.1), §6.1 (Corollary 6.1.6) and §6.2
  (Lemma 6.2.6, Theorem 6.2.10).
- P. Dupuis and R. S. Ellis, *A Weak Convergence Approach to the Theory of Large Deviations*,
  Wiley, 1997. Chapter 1 (Definition 1.2.2, Theorems 1.2.1, 1.2.3, 1.3.2, 1.3.3, 1.3.8,
  Proposition 1.4.2) and Theorem 2.2.1.
- R. S. Ellis, *Entropy, Large Deviations, and Statistical Mechanics*, Springer, 1985 (reprinted
  in Classics in Mathematics, 2006). Chapter II: Definition II.3.1, Theorems II.3.2–II.3.4,
  II.4.1, II.6.1, II.7.1, II.7.2 and Example II.6.2.
- O. Kallenberg, *Foundations of Modern Probability*, 3rd ed., Springer, 2021. Chapter 24:
  Theorems 24.3, 24.5, 24.10–24.12, 24.15, Lemmas 24.8, 24.9, 24.13, 24.17, and (15)–(17), (26).
- A. Klenke, *Probability Theory: A Comprehensive Course*, 3rd ed., Springer, 2020. Chapter 23:
  Theorems 23.3, 23.8, 23.11, 23.13, 23.16, 23.17, 23.19, Definitions 23.6–23.7, Lemma 23.12 and
  Example 23.4.
