# Roadmap: Monte Carlo, multilevel Monte Carlo and time stepping for SDEs

**Summary.** Crude Monte Carlo estimates a mean by the sample mean of independent copies and its
error by the sample variance. This roadmap proves that the sample variance with divisor R − 1 is
unbiased and strongly consistent, that the studentized mean is asymptotically standard normal,
and that the studentized interval has the normal asymptotic coverage. Multilevel Monte Carlo
replaces one expensive estimate by a telescoping sum of cheap coupled corrections. The roadmap
proves the bias–variance identity of the multilevel estimator, the optimal sample sizes, and
Giles's complexity theorem with its three cost regimes ε⁻², ε⁻²(log ε)² and
ε^(−2−(γ−β)/α). It also proves the parameters α = ½ and β = γ = 1 for Lipschitz functionals of
a scheme of mean-square order one half, which gives the cost ε⁻²(log ε)². For a scalar Itô
equation driven by m independent Brownian motions it develops the Kloeden–Platen calculus:
multiple Itô integrals indexed by multi-indices, the coefficient functions built from the
operators L⁰ and Lʲ, hierarchical and remainder sets, and the Itô–Taylor expansion, whose
truncation at the Milstein set gives the Milstein scheme. The Milstein scheme has local
mean-square error O(h³) and strong order one. The Clark–Cameron example shows that replacing the
Lévy-area integral by the product of increments loses half an order. Finally the stochastic
θ-method for the linear test equation du = ru dt + σu dW has an explicit mean-square
amplification factor. Its mean-square stability region is computed exactly, and it reproduces
the equation's stability condition r + σ²/2 < 0 for θ = ½.

Brownian motions, their Itô integrals and the solutions of the equations are given data. A solution
enters through hypotheses: adaptedness, progressive measurability, almost surely continuous paths, a
predictable representative of each diffusion integrand together with an Itô integral of it in the
sense of [StochasticCalculus](../StochasticCalculus/README.md) §3.2, and the integral identity. That
roadmap owns existence and uniqueness of strong solutions (§9.1), geometric Brownian motion and its
moments (§9.4), and Euler–Maruyama with its strong and weak orders (§9.6). This roadmap owns the
higher-order theory, the estimators and the stability analysis built on them. Importance sampling,
control variates, antithetic and stratified sampling are owned by
[ImportanceSamplingAndVarianceReduction](../ImportanceSamplingAndVarianceReduction/README.md);
quasi-Monte Carlo and Markov chain Monte Carlo are owned elsewhere (Scope and ownership).

Layer 1 treats crude Monte Carlo, Layer 2 multilevel Monte Carlo, Layer 3 multiple Itô integrals
and the Itô–Taylor expansion, Layer 4 the Milstein scheme and Layer 5 the θ-method. The roadmap
is a synthesis of Asmussen–Glynn and Caflisch for Layer 1, of Giles and Lord–Powell–Shardlow for
Layer 2, of Kloeden–Platen for Layer 3, and of Kloeden–Platen and Lord–Powell–Shardlow for Layers
4 and 5. It follows none of them section by section.

## How to read the build

Each layer has numbered subsections. Each subsection lists its targets as bold headlines with
their Lean names, a source locator for a headline that restates a source result and a proof
route for a corollary or an adaptation, and Checks, which are sanity checks of the key
definitions and theorems. Layers 1 and 2 are elementary probability and use no stochastic
calculus; §2.4 uses Layer 2's §2.3 and no SDE. Layer 3 uses the Itô integral and the Itô formula
of StochasticCalculus (§§3.2, 5.1). Layer 4 uses Layer 3 (§4.1 is the Milstein truncation of
§3.3, and §4.3 uses the Itô integral of StochasticCalculus §3.2 and the independence of the two
Brownian motions). Layer 5 uses only independent Gaussian increments. The results of §2.4 apply
to the Milstein and Euler–Maruyama schemes through their strong orders (§4.2 and
StochasticCalculus §9.6), but no target states that combination.

## Conventions

- Probability spaces carry `[IsProbabilityMeasure P]`. Independence of a sequence is
  `iIndepFun`; pairwise independence is stated with `⟂ᵢ[P]`; identical distribution is
  `IdentDistrib`; the standard normal law is `gaussianReal 0 1`. Variances are Mathlib's
  `Var[Z 0; P]`.
- The sample mean of a finite sample `x : Fin R → ℝ` is Tau Ceti's `finiteMean ℝ x`, the
  average with weights 1/R. The sample variance `sampleVariance` has divisor R − 1.
- Time is `ℝ≥0`. Lebesgue measure on time is `nnvolume`, and `timeMeasure t` is its restriction
  to (0, t]; time integrals are `∫ s, K s ω ∂timeMeasure t`.
- A Brownian motion relative to a filtration `F` satisfies `IsFilteredBrownian F P B`. An
  m-dimensional Brownian motion `W : Fin m → ℝ≥0 → Ω → ℝ` satisfies `IsFilteredBrownian` in each
  coordinate and `IsBrownianVector P W`. The Itô integral `I` of a strongly predictable `H`
  against `B` is described by `IsItoIntegral F P B H I`. These five definitions, with
  `ElementaryIntegrand`, are verbatim local copies of StochasticCalculus (Conventions, §§1.3, 3.2
  and 6.4).
- A solution of dX = a(t, X) dt + Σⱼ bⱼ(t, X) dWʲ is a strongly adapted and strongly progressive
  process `X` with almost surely continuous paths, given processes `H j` equal to bⱼ(t, X t) almost
  everywhere on every (0, T] × Ω, given processes `I j` with `IsItoIntegral F P (W j) (H j) (I j)`,
  and the identity X t = X 0 + ∫ a(s, X s) ds + Σⱼ I j t for all t outside one null set. The
  coefficients are continuous (Layer 3) or C² (Layer 4), so the drift integral of a
  continuous path is a genuine Lebesgue integral, and the energy of the diffusion integrand is
  finite because `IsItoIntegral` holds. Progressive measurability is part of the solution notion of
  StochasticCalculus §9.1 as well; it supplies the predictable representatives of f(t, X t) that the
  Itô–Taylor induction of §3.3 needs. The drift integral is thus a Lebesgue integral of an
  integrable function, with no separate integrability hypothesis.
- Coefficients are functions of (t, x) with t real, evaluated at the coercion of a time `t`;
  time derivatives are ordinary derivatives of t ↦ g(t, x).
- Multi-indices are lists `α : List (Fin (m + 1))`. The component 0 stands for integration in
  time and `j.succ` for integration against `W j`. Following Kloeden–Platen [KP, §5.2], the last
  component of α is the outermost integration, and the first component is the outermost operator
  in the coefficient function.
- Grid times are n h with `n : ℕ` and a step `h : ℝ≥0`, and Brownian increments are
  B((n + 1)h) − B(nh).

## Layer 1: crude Monte Carlo

### 1.1 The sample variance

Sources: [AG, §III.1, (1.3), p. 69; Exercise 1.1, p. 71]; [C, (2.13)–(2.15), p. 6].

- **The sample variance** (`sampleVariance`). For a sample x of size R it is
  (R − 1)⁻¹ Σ (x r − x̄)², with x̄ the sample mean; it is 0 for R ≤ 1.
- **Unbiasedness** (`integral_sampleVariance`). For R ≥ 2 pairwise independent square-integrable
  samples with a common mean and a common variance v, E s² = v. Route: write
  Σ (Z r − x̄)² = Σ (Z r − c)² − R (x̄ − c)², and take expectations with Tau Ceti's
  `integral_finiteMean_sub_sq` for the second term.
- **The variance of the sample mean** (no Lean name). Under the same hypotheses
  E (x̄ − c)² = v/R; this follows from Tau Ceti's `integral_finiteMean_sub_sq`, which gives
  R⁻² Σ E (Z r − c)², and is the case of equal target and proposal of
  [ImportanceSamplingAndVarianceReduction](../ImportanceSamplingAndVarianceReduction/README.md) §1.2
  [C, (2.13)–(2.15), p. 6]. For uniformly distributed points on the unit cube it gives the
  root-mean-square error σ(f)/√R of the crude Monte Carlo rule [DKS, Theorem 2.1, p. 138].

**Checks.**

- The sample (1, 2, 6) has sample mean 3 and sample variance 7.
- A constant sample has sample variance 0.
- A sample of size 1 has sample variance 0 (the junk value of the divisor 0).
- Negative control: for R = 2 independent Bernoulli(½) samples, E s² = ¼, the variance; the
  divisor R would give ⅛.

### 1.2 Consistency

Sources: [AG, §III.1, p. 69] (convergence in probability); [C, (2.5), p. 4] (strong law).

- **Strong consistency** (`tendsto_sampleVariance_ae`). For a pairwise independent identically
  distributed square-integrable sequence, s²_R → Var Z 0 almost surely. Adaptation: [AG] states
  convergence in probability. Route: apply Mathlib's `strong_law_ae` to Z and to Z², which are
  pairwise independent and identically distributed, and use
  s²_R = R/(R − 1) (mean of Z² − x̄²).
- **Strong consistency of the sample mean** (no Lean name). Under the same hypotheses with
  integrability only, x̄_R → E Z 0 almost surely; this is Mathlib's `strong_law_ae` in the
  notation of `finiteMean`.

**Checks.**

- For an i.i.d. Rademacher sequence Z² = 1, so s²_R = R/(R − 1) (1 − x̄²) → 1 = Var Z 0.
- Negative control: without identical distribution the statement fails: for independent
  Z r ~ N(0, r + 1) the sample variance tends to infinity, not to Var Z 0 = 1.

### 1.3 The studentized mean and the confidence interval

Sources: [C, Theorem 2.1, (2.9)–(2.11), p. 5]; [AG, §III.1, (1.1)–(1.2), p. 68; (1.4), p. 69;
Remark 1.1, p. 70].

- **Asymptotic normality of the studentized mean** (`tendstoInDistribution_studentizedMean`).
  For an i.i.d. square-integrable sequence with positive variance,
  √R (x̄_R − E Z 0)/s_R converges in law to the standard normal law. Route: Mathlib's central
  limit theorem `tendstoInDistribution_inv_sqrt_mul_sum_sub` for √R (x̄_R − E Z 0), the strong
  consistency of §1.2, and Slutsky's lemma: pair the two by
  `TendstoInDistribution.prodMk_of_tendstoInMeasure_const` and apply
  `TendstoInDistribution.continuous_comp` to the continuous map (x, y) ↦ x/√(max y (σ²/2)),
  not to x/√y, which Lean's x/0 = 0 makes discontinuous at y = 0. The result differs from the
  studentized mean only on the event s_R² < σ²/2, whose probability tends to 0, so
  `tendstoInDistribution_of_tendstoInMeasure_sub` transfers the limit.
  MathematicalStatisticsFoundations §8.4 states Slutsky's lemma in its vocabulary.
- **Asymptotic coverage** (`tendsto_measure_studentizedInterval`). For positive variance and
  every real q, the probability that |x̄_R − E Z 0| ≤ q s_R/√R tends to the standard normal mass
  of [−q, q]. With q = 1.96 this is the asymptotic 95% interval of [AG, Remark 1.1, p. 70].
  Route: the portmanteau theorem, since the boundary {−q, q} is a null set of the normal law.
  [AG] uses the open interval; the limit is the same.

**Checks.**

- The standard normal mass of [−1.96, 1.96] is 0.950004 (to six digits).
- For q < 0 the interval is empty, both sides are 0 in the limit, and the normal mass of
  [−q, q] is 0.
- Negative control: for a constant sequence (variance 0) the studentized interval is the point
  {E Z 0} and covers with probability 1 for every q ≥ 0, not with the normal mass; hence the
  hypothesis of positive variance.
- Simulation: for Bernoulli(0.3) samples of size 2000 the empirical coverage of the 1.96
  interval over 20 000 repetitions is 0.945.

## Layer 2: multilevel Monte Carlo

### 2.1 The estimator and its mean square error

Sources: [G, two-level estimator, p. 261; (2.1)–(2.3), p. 264]; [LPS, (8.86)–(8.88), pp.
353–354].

- **The multilevel estimator** (`multilevelEstimator`). For level corrections `D l n` (the n-th
  sample on level l) and sample sizes `N l`, the estimator is the sum over levels l ≤ L of the
  sample means of the first N l corrections.
- **Mean and mean square error** (`multilevelEstimator_mean_and_meanSquareError`). If the level
  l corrections have mean m l − m (l − 1) (with m(−1) = 0) and variance V l, all samples are
  pairwise independent and square integrable, and N l ≥ 1 for l ≤ L, then the estimator has mean
  m L, and for every real z its mean square error about z is (m L − z)² + Σ V l / N l, summed
  over l ≤ L. Route: telescoping, `IndepFun.variance_sum`, and the bias–variance decomposition.

**Checks.**

- For L = 0 the estimator is the crude sample mean of Layer 1, and the identity is
  bias² + V 0/N 0.
- For deterministic corrections D l n = P l − P (l − 1) (variance 0) the estimator is P L.
- Negative control: with N l = 0 the level-l sample mean is the junk value 0, the estimator
  loses the mean m l − m (l − 1), and the mean identity fails; hence N l ≥ 1.

### 2.2 Optimal sample sizes

Sources: [G, §1.3, p. 262, (1.1)].

- **The optimal allocation** (`multilevel_cost_ge_and_optimal`). For positive level variances V l
  and costs C l and real sample sizes N l > 0 with Σ V l / N l ≤ ε², the cost Σ N l C l is at
  least ε⁻² (Σ √(V l C l))². The allocation N l = ε⁻² √(V l / C l) Σₖ √(V k C k) has variance
  exactly ε² and attains this cost. Route: Cauchy–Schwarz on √(V/N) √(N C). [G] derives the
  allocation by a Lagrange multiplier; the inequality is the statement that it is optimal. By
  §2.1, Σ V l / N l is the variance of the multilevel estimator with sample sizes N l, so the
  bound is the least cost of a multilevel estimator of variance at most ε², with real sample
  sizes in place of integer ones.

**Checks.**

- For L = 0 the bound is V 0 C 0 / ε², the cost of crude Monte Carlo with R = V 0/ε² samples.
- For V = (4, 1), C = (1, 4) the optimal cost is 16/ε² and N = (8, 2)/ε²; the equal allocation
  with the same variance costs 25/ε².
- Negative control: the allocation proportional to √(V l C l) instead of √(V l / C l) has a
  larger cost whenever the C l differ (for the data above, 25/ε² against 16/ε²).

### 2.3 The complexity theorem

Sources: [G, Theorem 2.1, pp. 264–265].

- **Deterministic form** (`exists_multilevel_sampleBudget`). Suppose the bias, the level
  variances and the level costs satisfy |bias l| ≤ c₁ 2^(−αl), V l ≤ c₂ 2^(−βl) and
  C l ≤ c₃ 2^(γl), with β, γ > 0 and α ≥ ½ min(β, γ). Then there is c₄ > 0 such that for every
  ε ∈ (0, e⁻¹) some L and integer sample sizes N l ≥ 1 make bias L² + Σ V l / N l < ε² at a
  cost at most c₄ ε⁻² for β > γ, c₄ ε⁻² (log ε)² for β = γ, and c₄ ε^(−2−(γ−β)/α) for β < γ.
  This is [G, Theorem 2.1] with level ratio 2; the constants c₁, c₂, c₃ may have any sign.
- **The estimator form** (`exists_multilevelEstimator`). With bias l = m l − z and the
  hypotheses of §2.1, the multilevel estimator itself has mean square error below ε² at the same
  cost. Route: §2.1 and the deterministic form.

**Checks.**

- For (α, β, γ) = (1, 2, 1), (½, 1, 1) and (1, 1, 2), the allocation of [G, proof of Theorem 2.1]
  with c₁ = c₂ = c₃ = 1, computed for ε = 10⁻², 10⁻³, 10⁻⁴, 10⁻⁵, keeps the mean square error
  below ε², and the ratio of the cost to the regime rate stays between 19 and 61.
- Negative control: for bias l = 2^(−l/4), V l = 2^(−l) and C l = 2^l (α = ¼ < ½ min(β, γ),
  β = γ = 1) every admissible L has 2^(−L/2) < ε², so the level-L cost alone is at least
  2^L > ε⁻⁴, and ε⁻⁴/(ε⁻² (log ε)²) is unbounded as ε → 0; hence the hypothesis
  α ≥ ½ min(β, γ).

### 2.4 Lipschitz functionals of strong approximations

Sources: [G, §5.1, p. 287]; [LPS, Lemma 8.46, (8.93), p. 355; Lemma 8.47, p. 356]. [G, §5.1]
prints the step on level l as h₀ Mˡ; the step that decreases with the level is h₀ M⁻ˡ, as its
examples with 4⁻ˡ h₀ and 2⁻ˡ h₀ on p. 287 show, and this section uses that convention.

- **Bias and coupled second moments** (`lipschitz_level_bias_and_variance`). If φ is
  K-Lipschitz and E ‖S − Sₗ‖² ≤ c hₗ, then the bias of φ(Sₗ) is at most K √(c hₗ), and
  E (φ(Sₗ) − φ(Sₖ))² ≤ K² (√(c hₗ) + √(c hₖ))². Route: Jensen and Minkowski.
- **Cost at mean-square order one half**
  (`exists_multilevel_sampleBudget_of_meanSquare_halving`). If E ‖S − Sₗ‖² ≤ c 2⁻ˡ and the
  level costs are at most c₃ 2ˡ, then for the Lipschitz functional φ the multilevel cost of
  mean square error below ε² is O(ε⁻² (log ε)²). Adaptation: [LPS, Lemmas 8.46–8.47] treat a
  Lipschitz function of the terminal value of Euler–Maruyama and choose the finest level from its
  weak order; here S and the Sₗ take values in any normed group, so path functionals are included,
  and the bias bound of the first bullet replaces the weak order. Through the strong orders of
  StochasticCalculus §9.6 and of §4.2 it applies to Euler–Maruyama and to Milstein. Route: the
  first bullet gives α = ½ and V l ≤ K² c (1 + √2)² 2⁻ˡ, so β = γ = 1, and §2.3 applies. The
  level-0 term is the variance of φ(S₀); if φ(S₀) is not square integrable, Mathlib's variance
  is 0 and the statement still holds.

**Checks.**

- (1 + √2)² = 5.828…, the constant for hₗ₋₁ = 2 hₗ [LPS, Lemma 8.46, p. 355].
- For φ the identity and Sₗ = S + √(c hₗ), the bias bound K √(c hₗ) with K = 1 is attained.
- Comparison: the bound V l ≤ 2 (V[φ(S) − φ(Sₗ)] + V[φ(S) − φ(Sₗ₋₁)]) of [G, §5.1,
  p. 287] gives the constant 2 (1 + 2) = 6 > 5.828, so it is weaker than the triangle inequality
  used here.

## Layer 3: multiple Itô integrals and the Itô–Taylor expansion

### 3.1 Multiple Itô integrals

Sources: [KP, §5.2, (2.1)–(2.6), pp. 167–168, (2.12), p. 169; Lemma 5.7.1, p. 190; (3.6),
p. 347].

- **Multiple Itô integrals** (`IsMultipleItoIntegral`). An inductive predicate: for the empty
  multi-index the integral of g is g; for α ++ [0] it is the time integral of the integral of α,
  whose paths are almost surely locally integrable; for α ++ [j.succ] it is an Itô integral
  against `W j` of a predictable representative of the integral of α.
- **Existence** (`exists_isMultipleItoIntegral`). For a strongly progressive integrand with almost
  surely continuous paths and coordinates that are Brownian relative to F, the multiple Itô
  integral of every multi-index exists and can be chosen strongly progressive with almost surely
  continuous paths. Route: induction on α, with StochasticCalculus §3.2 (existence of the
  integral of a locally square-integrable predictable integrand) and continuity of time
  integrals.
- **Uniqueness** (`isMultipleItoIntegral_unique`). Two integrals of the same multi-index are
  indistinguishable. Route: induction; the integrands of the two integrals at each noise step
  agree almost everywhere on every (0, T] × Ω, and uniqueness of the Itô integral with its
  congruence for almost everywhere equal integrands (StochasticCalculus §3.2) closes the step.
- **Zero mean** (`integral_isMultipleItoIntegral_eq_zero`). If g is bounded and strongly
  progressive and some component of α is nonzero, the integral has mean zero at every time [KP,
  Lemma 5.7.1, p. 190].
- **The repeated index** (`isMultipleItoIntegral_repeated`). I₍ⱼ,ⱼ₎[1]ₜ = ((Wʲₜ)² − t)/2
  [KP, (3.6), p. 347]. Route: Itô's formula for x² (StochasticCalculus §5.1).

**Checks.**

- I₍₀₎[1]ₜ = t almost surely.
- I₍ⱼ₎[1]ₜ = Wʲₜ almost surely.
- Negative control: the Stratonovich double integral J₍ⱼ,ⱼ₎[1]ₜ is (Wʲₜ)²/2, which differs
  from I₍ⱼ,ⱼ₎[1]ₜ by t/2; a symmetric-endpoint approximation in the noise step would give
  that value.
- E (I₍₁,₂₎[1]ₜ)² = t²/2 for independent W¹, W² (simulation: 0.491 at t = 1).
- Negative control: I₍₀,₀₎[1]ₜ = t²/2 has nonzero mean, so the zero-mean statement needs a
  nonzero component.

### 3.2 Coefficient functions, hierarchical and remainder sets

Sources: [KP, §5.3, (3.1)–(3.3), p. 177; §5.4, (4.1)–(4.4), pp. 180–181].

- **The operators** (`generatorOp`, `diffusionOp`, `itoOperator`). L⁰ g = ∂ₜ g + a ∂ₓ g +
  ½ (Σⱼ bⱼ²) ∂ₓ² g and Lʲ g = bⱼ ∂ₓ g.
- **Coefficient functions** (`itoCoefficient`). fᵥ = f, and the coefficient of k :: α is Lᵏ
  applied to the coefficient of α.
- **Hierarchical and remainder sets** (`IsHierarchicalSet`, `remainderSet`). A finite set of
  multi-indices is hierarchical if it is nonempty and closed under deleting the first component;
  its remainder set consists of the multi-indices outside it whose tail lies in it.

**Checks.**

- For f(t, x) = x: f₍₀₎ = a, f₍ⱼ₎ = bⱼ and f₍ⱼ₁,ⱼ₂₎ = bⱼ₁ ∂ₓbⱼ₂.
- Negative control (orientation): for m = 1, autonomous a, b and f(t, x) = x,
  f₍₀,₁₎ = L⁰ b = a ∂ₓb + ½ b² ∂ₓ²b [KP, §5.3, p. 177], while the reversed recursion would give
  L¹ a = b ∂ₓa; for a(x) = x and b = 1 these are 0 and 1.
- For f(t, x) = x², L⁰ f = 2 a x + Σⱼ bⱼ². Negative control: without the factor ½ in L⁰ the
  value would be 2 a x + 2 Σⱼ bⱼ², contradicting d(W²) = 2W dW + dt for a = 0, b = 1.
- With m = 1, the remainder set of {v, (0), (1)} is {(0,0), (0,1), (1,0), (1,1)} [KP, §5.4,
  p. 181].
- With m = 1, `milsteinSet` 1 = {v, (0), (1), (1,1)} is hierarchical, and its remainder set
  {(0,0), (1,0), (0,1), (0,1,1), (1,1,1)} has five elements.
- Negative control: {(1)} is not hierarchical, since its tail v is missing.

### 3.3 The Itô–Taylor expansion

Sources: [KP, Theorem 5.5.1, pp. 181–182].

- **The Itô–Taylor expansion** (`itoTaylor_expansion`). Let X solve the scalar equation with
  continuous coefficients a and bⱼ driven by an m-dimensional Brownian motion, let A be
  hierarchical with C² coefficient functions f_α for α ∈ A, and let the multiple Itô integrals
  of f_α(0, X 0) for α ∈ A and of f_α(·, X ·) for α in the remainder set be given. Then almost
  surely, for every t, f(t, X t) is the sum of the former integrals and the remainder integrals.
  This is [KP, Theorem 5.5.1] with initial time 0 and deterministic final time. Route: induction
  on A by Itô's formula (StochasticCalculus §5.1) applied to f_α(t, X t).
- **The Milstein truncation** (`itoTaylor_milstein`, `milsteinSet`). For C² coefficients a, bⱼ
  and bⱼ₁ ∂ₓbⱼ₂, f(t, x) = x and the set
  {v} ∪ {(k)} ∪ {(j₁, j₂) | j₁, j₂ ≥ 1}, the expansion is X t = X 0 + a(0, X 0) t +
  Σⱼ bⱼ(0, X 0) Wʲₜ + Σ bⱼ₁ ∂ₓbⱼ₂(0, X 0) I₍ⱼ₁,ⱼ₂₎[1]ₜ + remainder; its one-step
  truncation is the Milstein scheme [KP, §10.3, (3.3), p. 346]. Route: the expansion and the
  Checks of §3.2.

**Checks.**

- For A = {v} the expansion is the identity f(t, X t) = f(0, X 0) + ∫ L⁰ f + Σⱼ ∫ Lʲ f dWʲ, Itô's
  formula.
- For a = 0, b = 1 (X = W) and f(t, x) = x², the set {v, (0), (1)} has remainder integrals that
  vanish except I₍₁,₁₎[2] = W² − t, and the expansion reads W² = t + 0 + (W² − t).
- Negative control: {v, (1,1)} is not hierarchical (the tail (1) is missing), and for it the
  remainder-set formula would not produce the terms (0) and (1) that carry the drift and the
  diffusion.

## Layer 4: the Milstein scheme

### 4.1 The scheme and its local error

Sources: [LPS, Definition 8.24, p. 333; Proposition 8.31, (8.56)–(8.57), p. 339]; [KP, §10.3,
(3.1), p. 345].

- **The scalar Milstein scheme** (`milsteinScheme`). uₙ₊₁ = uₙ + f(uₙ) h + g(uₙ) ΔBₙ +
  ½ g′(uₙ) g(uₙ) (ΔBₙ² − h), u₀ = x₀.
- **Local mean-square error** (`exists_itoTaylor_local_remainder_bound`). If f and g are C²,
  Lipschitz and have bounded second derivatives, then for every T there is C with
  E (X h − one Milstein step from x₀)² ≤ C h³ for 0 < h ≤ T. Route: §3.3 with the hierarchical
  set {v, (0), (1)}, whose remainder set {(0,0), (1,0), (0,1), (1,1)} needs only f and g in C².
  The first three remainder integrals have mean square O(h³) by the estimates of multiple
  integrals [KP, Lemma 5.7.3, p. 195]. The (1,1) remainder differs from g g′(x₀) I₍₁,₁₎[1]ₕ by
  the double integral of g g′(Xₛ) − g g′(x₀), whose integrand has L² norm O(s^(1/2)) because
  g g′ is locally Lipschitz with a derivative of linear growth; so this difference is O(h³) in
  mean square as well. Compare [LPS, Proposition 8.31].
- **Additive noise** (no Lean name). If g is constant, the Milstein scheme is the Euler–Maruyama
  scheme of StochasticCalculus §9.6 [LPS, p. 334]; this is a Check.

**Checks.**

- With g = 0 the scheme is the explicit Euler method for u′ = f(u).
- For g constant the correction term vanishes and the scheme is Euler–Maruyama.
- Simulation for f(x) = x/2, g(x) = 0.8 x, x₀ = 1: the local mean square error divided by h³ is
  0.223, 0.215, 0.208, 0.206 for h = 0.1, 0.05, 0.025, 0.0125.
- Negative control: for f = 0 and g(x) = σ x, E X h = x₀, and one Milstein step has mean x₀;
  without the −h in ΔB² − h the step has mean x₀ (1 + ½σ² h), a bias of order h per step.

### 4.2 Strong order one

Sources: [LPS, Definition 8.24, p. 333; Assumption 8.29, p. 338; Theorem 8.32, (8.59)–(8.60),
p. 341]; [KP, Theorem 10.3.5, (3.19)–(3.24), pp. 350–351].

- **Strong order one** (`exists_milstein_strong_error_bound`). Under the hypotheses of §4.1 and a
  Lipschitz g′g, for every T there is K with (E (X(n h) − uₙ)²)^(1/2) ≤ K h for every h > 0
  and every n with n h ≤ T. This is [LPS, Theorem 8.32]. Route: local errors of §4.1, zero mean
  of the leading local terms (§3.1), and a discrete Gronwall argument.
- **Several noises** (no Lean name). Let dX = a(X) dt + Σⱼ bⱼ(X) dWʲ be a scalar equation
  driven by m independent Brownian motions, with a and each bⱼ C², Lipschitz and with bounded
  second derivatives, and each bⱼ₁ ∂ₓbⱼ₂ Lipschitz. The scheme that adds to the Euler–Maruyama
  step the sum over j₁, j₂ of bⱼ₁ ∂ₓbⱼ₂(uₙ) times the double integral I₍ⱼ₁,ⱼ₂₎ of §3.3 over the
  step satisfies: for every T there is K with (E (X(n h) − uₙ)²)^(1/2) ≤ K h for every h > 0 and
  every n with n h ≤ T. This is [LPS, Definition 8.24, p. 333; Theorem 8.32, (8.59)–(8.60),
  p. 341] with d = 1, where the products of increments and the Lévy areas combine into the
  double integrals; [KP, Theorem 10.3.5, (3.19)–(3.24), pp. 350–351] proves the bound for the
  first absolute moment at the final time under its conditions (3.19)–(3.23). When the
  commutativity condition bⱼ₁ ∂ₓbⱼ₂ = bⱼ₂ ∂ₓbⱼ₁ holds, the double integrals enter only through
  ½ ΔWʲ¹ ΔWʲ² − ½ δⱼ₁ⱼ₂ h [KP, (3.13)–(3.16), p. 348].

**Checks.**

- Simulation for f(x) = x/2, g(x) = 0.8 x, x₀ = 1 (geometric Brownian motion, T = 1, 2·10⁴
  paths): the root mean square error is about 0.16, 0.08, 0.04, 0.02 for h = 1/8, 1/16, 1/32,
  1/64, halving with h.
- For g = 0 the bound is the first-order global error of the explicit Euler method.
- Negative control: Euler–Maruyama, the scheme without the correction term, has root mean
  square errors of about 0.38, 0.25, 0.18, 0.13 in the same simulation, decreasing like √h.

### 4.3 The Lévy area cannot be dropped

Sources: [KP, Example 10.3.4, (3.17)–(3.18), pp. 349–350].

- **The Clark–Cameron example** (`clarkCameron_meanSquareError`). For independent Brownian
  motions W¹ and W² (in Suggested.lean the coordinates 0 and 1 of W), X¹ = W¹ and
  X² = ∫ X¹ dW², the scheme that replaces the double integral I₍₁,₂₎ on each step by
  ½ ΔW¹ ΔW² has mean square error exactly N h²/4 at time N h. So its root-mean-square error is
  ½ T^(1/2) h^(1/2), strong order one half. Route: the error is a sum over the steps of
  integrals of W¹ₛ − W¹ₙₕ − ½ ΔW¹ against W²; conditionally on the path of W¹ it is a
  centred Gaussian variable with variance Σ ∫ (W¹ₛ − W¹ₙₕ − ½ ΔW¹)² ds, whose mean is h²/4
  per step.

**Checks.**

- N = 0 gives error 0.
- Simulation at T = 1: 0.0634, 0.01564, 0.00392 against T h/4 = 0.0625, 0.015625, 0.003906 for
  h = ¼, 1/16, 1/64.
- Negative control: the left endpoint scheme W¹ₙₕ ΔW² has mean square error N h²/2, twice as
  large.

## Layer 5: mean-square stability of the stochastic θ-method

### 5.1 The amplification factor

Sources: [LPS, (8.52), Definition 8.27, p. 336]; [KP, §4.8, (8.10), p. 152].

- **The amplification factor** (`thetaAmplification`). For du = ru dt + σu dW the θ-method
  (1 − θrh) uₙ₊₁ = (1 + (1 − θ)rh + σ ΔBₙ) uₙ has
  R = ((1 + (1 − θ) r h)² + σ² h)/(1 − θ r h)².
- **Second moments** (`integral_sq_theta_eq`). If 1 − θrh ≠ 0, E uₙ² = Rⁿ x². Route: uₙ is a
  function of the first n increments, so ΔBₙ is independent of uₙ with mean 0 and variance h.
- **The equation** (no Lean name). E u(t)² = e^((2r + σ²)t) u₀² for the exact solution, which is
  geometric Brownian motion (StochasticCalculus §9.4, with p = 2); so for u₀ ≠ 0, E u(t)² → 0 if
  and only if r + σ²/2 < 0 [LPS, p. 335; KP, §6.3, pp. 234–235].

**Checks.**

- h = 0 gives R = 1.
- σ = 0, θ = 0 gives R = (1 + r h)², the square of the explicit Euler factor.
- σ = 0, θ = 1 gives R = 1/(1 − r h)², the square of the implicit Euler factor.
- Junk value: for θ = 1, r = 1, h = 1 the denominator vanishes and R is 0; the second-moment
  identity carries the hypothesis 1 − θrh ≠ 0.
- Negative control: for r = −8, σ = 3, θ = 0, h = ¼ the equation is stable (r + σ²/2 = −3.5)
  but R = 3.25 > 1 [LPS, Example 8.26, p. 335; p. 337].

### 5.2 Stability regions

Sources: [LPS, p. 337]; [KP, §6.3, pp. 234–235] for mean-square stability.

- **Mean-square stability** (`theta_meanSquare_stability`). For h > 0, x ≠ 0 and 1 − θrh ≠ 0,
  E uₙ² → 0 if and only if r + σ²/2 + (1 − 2θ) r² h/2 < 0. Route: R < 1 is equivalent to
  2r + σ² + (1 − 2θ) r² h < 0.
- **The regimes** (`thetaAmplification_lt_one_cases`). If r + σ²/2 < 0, the explicit method is
  stable if and only if h < −2(r + σ²/2)/r², and every θ ≥ ½ is stable for every h > 0; and for
  θ = ½ stability is equivalent to r + σ²/2 < 0 (when 1 − rh/2 ≠ 0).

**Checks.**

- For r = −8, σ = 3 the explicit bound is h < 7/64 = 0.109375; R = 0.94 at h = 0.1 and 1.08 at
  h = 0.12.
- For the same data θ = ½ and θ = 1 give R = 0.5625 and 0.3611 at h = ¼.
- Simulated E u₅² matches R⁵ x² in six cases (θ ∈ {0, ½, 1}, stable and unstable), and R < 1
  agrees with the condition in each; for r = −8, σ = 3, θ = 0, h = ¼, x = 1 the mean over
  4·10⁵ paths is 365.1 against R⁵ = 362.6.
- Negative control: for θ = ½, r = 4, h = ½ the denominator 1 − r h/2 vanishes, R is the junk
  value 0 < 1 while r + σ²/2 > 0; hence the hypothesis 1 − rh/2 ≠ 0 in the θ = ½ case.

## Downstream consumers

- Numerical methods for option pricing and computational finance consume the confidence interval
  (§1.3), the multilevel estimator and its complexity (Layer 2) and the Milstein scheme
  (Layer 4).
- Uncertainty quantification for random differential equations, and multilevel methods for
  stochastic partial differential equations, consume Layer 2 with the strong orders of Layer 4.
- Stability analysis of stochastic integrators for stiff problems consumes Layer 5.

## Scope and ownership

The roadmap is complete when Tau Ceti proves every statement of `Suggested.lean` and the prose
targets of the layers above.

Inputs:
- Mathlib: the strong law, the central limit theorem, convergence in distribution, variances of
  independent sums, `gaussianReal`, `IsBrownianReal` and predictability.
- Tau Ceti: `finiteMean` and `integral_finiteMean_sub_sq`.
- [StochasticCalculus](../StochasticCalculus/README.md): filtered Brownian motion (§1.3), the Itô
  integral with its existence, uniqueness and isometry (§3.2), Itô's formula (§5.1), Brownian
  vectors (§6.4), geometric Brownian motion (§9.4).

Owned here:
- the sample variance, its unbiasedness and strong consistency, the studentized central limit
  theorem and the coverage of the studentized interval;
- the multilevel estimator, its mean square error, the optimal allocation, the complexity
  theorem, and the parameters of Lipschitz functionals of strong approximations;
- multiple Itô integrals indexed by multi-indices, the coefficient functions, hierarchical and
  remainder sets, and the Itô–Taylor expansion;
- the Milstein scheme with its local error and strong order, and the Clark–Cameron example;
- the stochastic θ-method for the linear test equation and its mean-square stability.

Not owned:
- existence and pathwise uniqueness of strong solutions (StochasticCalculus §9.1); this roadmap
  takes solutions as given data;
- geometric Brownian motion and its moments (StochasticCalculus §9.4), consumed in §5.1;
- Euler–Maruyama, its strong order one half and weak order one (StochasticCalculus §9.6);
- importance sampling, control variates, antithetic variates and stratified sampling
  ([ImportanceSamplingAndVarianceReduction](../ImportanceSamplingAndVarianceReduction/README.md),
  Layers 1–5); the variance of the crude estimate is
  the case of equal target and proposal of its §1.2;
- Slutsky's lemma, i.i.d. vocabulary, the empirical objects of mathematical statistics and the
  exact Student law of the studentized mean of a Gaussian sample
  ([MathematicalStatisticsFoundations](../MathematicalStatisticsFoundations/README.md), §§5.2,
  8.4, 8.5, 9.1); its §2.4 treats the sample variance as a U-statistic, unbiased for i.i.d.
  samples, while §1.1 here assumes only pairwise independence with a common mean and variance;
  and Edgeworth expansions of studentized statistics
  ([MathematicalStatisticsHigherOrderAndResampling][HOR], §4.5);
- Metropolis–Hastings and Langevin samplers
  ([LangevinAndHamiltonianMonteCarlo](../LangevinAndHamiltonianMonteCarlo/README.md)) and
  ergodic averages of Markov chains
  ([MarkovChainsAndRenewal](../MarkovChainsAndRenewal/README.md), §2.4);
- quasi-Monte Carlo rules, discrepancy and sparse grids.

Boundary in one sentence: the estimators of plain and multilevel Monte Carlo, and the
higher-order time stepping and stability of scalar SDEs, are here; existence of solutions,
Euler–Maruyama and the variance-reduction devices are the suppliers'.

## Exact supplier contracts

### From Mathlib

- `strong_law_ae` (Etemadi's strong law for pairwise independent identically distributed
  integrable sequences).
- `tendstoInDistribution_inv_sqrt_mul_sum_sub` (the central limit theorem for an i.i.d. square
  integrable sequence, with limit law `gaussianReal`).
- `TendstoInDistribution.prodMk_of_tendstoInMeasure_const`,
  `TendstoInDistribution.continuous_comp` and `tendstoInDistribution_of_tendstoInMeasure_sub`
  (Slutsky).
- `IndepFun.variance_sum` (variance of a sum of pairwise independent variables).
- `IsBrownianReal`, `IsStronglyPredictable`, `IsStronglyProgressive`, `StronglyAdapted`,
  `TendstoInMeasure`.

### From Tau Ceti

- `finiteMean` (TauCeti/Analysis/Convex/FiniteMean.lean) and `integral_finiteMean_sub_sq`
  (TauCeti/Probability/Moments/SampleMean.lean): the second moment of the sample mean of
  pairwise independent square-integrable variables with a common mean.

### From [StochasticCalculus](../StochasticCalculus/README.md)

- Conventions: `nnvolume` and `timeMeasure`, copied verbatim.
- §1.3: `IsFilteredBrownian`, copied verbatim.
- §3.2: `ElementaryIntegrand` and `IsItoIntegral`, copied verbatim, and the existence,
  uniqueness, congruence and isometry of the Itô integral, consumed in Layers 3 and 4.
- §5.1: Itô's formula for C² functions, consumed in §§3.1 and 3.3.
- §6.4: `IsBrownianVector`, copied verbatim.
- §9.4: the second moment of geometric Brownian motion, consumed in §5.1.
- §9.1: the solution notion with progressive measurability, which the Conventions follow.
- §9.6: the strong order of Euler–Maruyama, cited in §§2.4 and 4.1.

## Beyond this roadmap (a roadmap for a roadmap; do not implement)

No Tau Ceti roadmap owns these topics; each is material for a further roadmap built on this one.

- Parabolic SPDEs driven by Q-Wiener processes and the error of spectral Galerkin approximation
  of the stochastic convolution [LPS, Chapter 10, p. 431]. No carrier for Hilbert-space-valued
  Q-Wiener processes and their stochastic integrals exists in Mathlib, Tau Ceti or a roadmap; a
  roadmap for them comes first.
- Approximation of the Lévy area and strong order one without commutativity [KP, §5.8, p. 198].
- Strong schemes of order 1.5 and higher [KP, §§10.4–10.6, pp. 351–365], and weak Itô–Taylor
  schemes and their orders [KP, Chapter 14].
- Multilevel Monte Carlo with Milstein coupling, for multidimensional SDEs and for non-Lipschitz
  payoffs [G, §§5.2–5.3].
- Randomized quasi-Monte Carlo inside the multilevel estimator [G, §§2.7, 3.5].
- Stability of multidimensional linear SDEs and their discretizations [KP, §9.8, p. 331].

## Prior formalization

[lean-NASC](https://github.com/bjbraams/lean-NASC) (Apache-2.0), by the author of this roadmap,
at commit 8efdbf7, modules NASC/MonteCarlo.lean and NASC/StochasticEquations.lean, states
forms of the sample-variance and coverage targets of Layer 1, the complexity theorem of §2.3, the
local and global Milstein bounds of §§4.1–4.2, the θ-method stability of §5.2 and the SPDE error
of Beyond, all with `sorry`. It proves none of the targets.

## References

- [AG] S. Asmussen, P. W. Glynn, *Stochastic Simulation: Algorithms and Analysis*, Springer,
  2007, Chapter III.
- [C] R. E. Caflisch, Monte Carlo and quasi-Monte Carlo methods, *Acta Numerica* 7 (1998),
  1–49.
- [DKS] J. Dick, F. Y. Kuo, I. H. Sloan, High-dimensional integration: the quasi-Monte Carlo
  way, *Acta Numerica* 22 (2013), 133–288.
- [G] M. B. Giles, Multilevel Monte Carlo methods, *Acta Numerica* 24 (2015), 259–328.
- [KP] P. E. Kloeden, E. Platen, *Numerical Solution of Stochastic Differential Equations*,
  Springer, 1992, Chapters 4–6 and 9–10.
- [LPS] G. J. Lord, C. E. Powell, T. Shardlow, *An Introduction to Computational Stochastic
  PDEs*, Cambridge University Press, 2014, Chapter 8.

[HOR]: ../MathematicalStatisticsHigherOrderAndResampling/README.md
