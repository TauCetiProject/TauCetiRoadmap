# Roadmap: Subadditive and multiplicative ergodic theorems

**Summary.** This roadmap builds the ergodic theory of subadditive processes and of products of
matrices along the orbits of a measure-preserving map, and applies it to random walks,
first-passage percolation and longest common subsequences.

- Fekete's lemma for real subadditive sequences without a lower bound, with limit in `[−∞, ∞)`.
- Kingman's subadditive ergodic theorem: if `f_{m+n} ≤ f_m + f_n ∘ T^m` almost everywhere and the
  positive part of `f_1` is integrable, then `f_n / n` converges almost everywhere to an invariant
  limit in `[−∞, ∞)`; when the growth constant `γ = inf_n (1/n) ∫ f_n` is finite the limit is
  integrable, the convergence holds in `L¹` and the limit has integral `γ`; for ergodic `T` the
  limit is `γ`.
- The `k`-volume growth `‖⋀ᵏ B‖` of a linear map, equal to the product of its `k` largest singular
  values, submultiplicative and log-concave in `k`.
- Linear cocycles `A_n(x) = A(T^{n−1}x) ⋯ A(x)` of invertible operators of a finite-dimensional
  real inner product space with `log⁺‖A‖` and `log⁺‖A⁻¹‖` integrable; the Furstenberg–Kesten
  theorem for every exterior power, which defines the Lyapunov exponents `λ_0 ≥ ⋯ ≥ λ_{d−1}`
  with multiplicity; their invariance, their sum `E[log |det A| | invariant σ-algebra]`, and the
  identification of the extremal ones with the growth rates of the norm and the conorm.
- Oseledets' multiplicative ergodic theorem: almost everywhere every nonzero vector grows at an
  exact exponential rate, which is an exponent, with an invariant filtration by slow subspaces of
  the right dimensions, and the exponents are the growth rates of the singular values; for an
  invertible base, an invariant splitting into Oseledets spaces on which the growth rate is the
  same forward and backward.
- Products of independent identically distributed invertible matrices: almost surely constant
  exponents and Furstenberg's theorem that, for a strongly irreducible law whose generated
  semigroup is unbounded modulo scalars, the top exponent exceeds the mean exponent
  `(1/d) E log |det g|` (it is positive on `SL(d, ℝ)`).
- Applications of Kingman's theorem: the Kesten–Spitzer–Whitman theorem that the range of a walk
  with stationary increments grows like `n` times the conditional probability of never returning;
  the time constant of first-passage percolation on `ℤ^d`; and the Chvátal–Sankoff constant of the
  longest common subsequence of two random words.

The roadmap is a synthesis. Kingman's theorem is taken in the forms of Viana (*Lectures on
Lyapunov Exponents*), Viana and Oliveira (*Foundations of Ergodic Theory*), Kallenberg
(*Foundations of Modern Probability*, 3rd ed.) and Durrett (*Probability: Theory and Examples*,
5th ed.); the exterior-power approach to exponents and the singular-value characterisation follow
Barreira (*Lyapunov Exponents*); the multiplicative ergodic theorem combines Viana's statements
with Barreira's proof through exterior powers; Furstenberg's theorem is stated in the generality of
Benoist and Quint (*Random Walks on Reductive Groups*), with Viana's two-dimensional form as the
special case; the applications come from Durrett and Kallenberg. The layers follow proof
dependency, not the organisation of any of these books.

**Place in Tau Ceti.** The roadmap consumes Birkhoff's pointwise ergodic theorem from
[ProbabilisticAndMetricNumberTheory](../ProbabilisticAndMetricNumberTheory/README.md), in its
conditional-expectation form; it enters the sum of the exponents and the range theorem. It consumes
the norm of an exterior power as a product of singular values, with its submultiplicativity, from
[EigenvalueAndSingularValueInequalities](../EigenvalueAndSingularValueInequalities/README.md),
and Mathlib's Fekete lemma, exterior powers and singular values and Tau Ceti's singular systems
and one-sided path shift. The classical-ergodic-theory roadmap
[ClassicalErgodicTheory](../ClassicalErgodicTheory/README.md) (factors, mixing, entropy, natural
extensions) and the hyperbolic-dynamics roadmap HyperbolicDynamicsAndThermodynamicFormalism are
neighbours: neither treats Kingman's theorem or Lyapunov exponents, and the second excludes
nonuniform hyperbolicity, for which the exponents of Layers 4 and 5 are the input. The roadmap
[BernoulliPercolation](../BernoulliPercolation/README.md) supplies the percolation threshold that
Kesten's characterisation of a zero time constant needs; that characterisation lies in Beyond.

## How to read the build

There are seven layers. Layer 1 is Fekete's lemma in `EReal`. Layer 2 proves Kingman's theorem in
its almost-everywhere, `L¹` and ergodic forms. Layer 3 is linear algebra: the volume growth of a
linear map through exterior powers, whose product formula and submultiplicativity are consumed from
EigenvalueAndSingularValueInequalities §2.4 and whose consequences are proved here. Layer 4 builds
linear cocycles and proves the Furstenberg–Kesten theorem for all exterior powers, which defines
the Lyapunov exponents. Layer 5 proves the multiplicative ergodic theorem in its one-sided and
two-sided forms. Layer 6 specialises to products of independent matrices and proves Furstenberg's
positivity theorem. Layer 7 applies Layer 2 to the range of a random walk, first-passage percolation
and longest common subsequences.
Layer 3 depends only on the library and EigenvalueAndSingularValueInequalities §2.4, and Layer 7
only on Layers 2 and 6.1, so they can be built in parallel with Layers 4–5.

Each subsection states its targets and gives locators into the sources and a proof route; a
target with a Lean name is a declaration in `Suggested.lean`. Each subsection ends with a
*Needs:* line naming what it uses. Locators give the theorem or section number and the printed
page.

## Conventions

- **Systems.** A system is a map `T : Ω → Ω` with `MeasurePreserving T μ μ` for a probability
  measure `μ` (`IsProbabilityMeasure μ`). Iterates are `T^[n]`. Invariance of a function `g`
  means `g ∘ T =ᵐ[μ] g`; the invariant σ-algebra is `MeasurableSpace.invariants T`. Ergodicity is
  Mathlib's `Ergodic T μ`. For the two-sided theorem the base is `T : Ω ≃ᵐ Ω`.
- **Subadditive processes** are indexed by `n ≥ 1`. The inequality
  `f (m + n) ≤ f m + f n ∘ T^[m]` is required almost everywhere, separately for each pair
  `m, n ≥ 1`; the term `f 0` is never used. Every hypothesis of integrability is for `n ≥ 1`.
- **Infinite values.** A limit that can be `−∞` is stated in `EReal`, through the coercion from
  `ℝ`; the growth constant `γ` is an `EReal` infimum over `n ≥ 1`. A rate that can be `+∞` (the
  time constant of first-passage percolation) is stated in `ℝ≥0∞` with lower Lebesgue integrals.
  Bochner integrals appear only for integrable functions.
- **Operators.** `E` is a finite-dimensional real inner product space of dimension `d`
  (`finrank ℝ E`); operators are `E →L[ℝ] E` with the operator norm. The inverse is
  `Ring.inverse`, which is the inverse on units. `log⁺` is `Real.posLog`. A cocycle generator `A`
  satisfies `AEStronglyMeasurable A μ`, `IsUnit (A x)` for almost every `x`, and integrability of
  `log⁺ ‖A‖` and `log⁺ ‖A⁻¹‖`; no measurable structure on the operator space is needed for this.
  Layer 6, where operators are random variables, puts the Borel σ-algebra on `E →L[ℝ] E`.
- **Exterior powers.** `⋀[ℝ]^k E` carries Mathlib's inner product
  (`exteriorPower.inner_ιMulti_ιMulti`: the Gram determinant on wedges), and `‖⋀ᵏ B‖` is the
  operator norm of `exteriorPower.map k B`. For `k > d` the power is `0`; for `k = 0` it is `1`.
- **Exponents.** `lyapunovSum A T k x` is the growth rate of `‖⋀ᵏ A_n(x)‖`, defined with
  Mathlib's `limUnder` and meaningful where the limit exists; `lyapunovExponent A T i x` is
  `lyapunovSum A T (i + 1) x − lyapunovSum A T i x`. Exponents are indexed from `0`, listed with
  multiplicity, and decreasing: `λ_0` is the top exponent. Singular values are Mathlib's
  `LinearMap.singularValues`, indexed from `0`, decreasing, and `0` from index `d` on.
- **Logarithms.** `Real.log 0 = 0` in Mathlib. Logarithms of norms are taken only of invertible
  cocycles, where every `‖⋀ᵏ A_n(x)‖` with `k ≤ d` is positive, so this value never enters.
- **Path space.** One-sided path space is `ℕ → S` with Tau Ceti's shift `TauCeti.Probability.shift`
  and the product law `Measure.infinitePi fun _ ↦ ν`.
- **Namespace.** Implementations live in the TauCeti namespace; `Suggested.lean` states the
  prototypes in `TauCetiRoadmap.SubadditiveAndMultiplicativeErgodicTheorems`.

## Layer 1: Subadditive sequences

### 1.1 Fekete's lemma without a lower bound

Mathlib's `Subadditive.tendsto_lim` proves that `u n / n` converges for a subadditive real
sequence when `u n / n` is bounded below. Kingman's theorem needs the version without a bound.

**Targets.**

- **Fekete in `EReal`** (`tendsto_div_ereal_of_subadditive`): for `u : ℕ → ℝ` with
  `Subadditive u`, `u n / n` converges in `EReal` to `inf_{n ≥ 1} u n / n`, which may be `⊥`.
  Viana, Lemma 3.4, p. 21; Kallenberg, Lemma 25.19, p. 570.
- **Superadditive form** (prose target): for superadditive `u`, `u n / n` converges in `EReal` to
  `sup_{n ≥ 1} u n / n`, possibly `⊤`. It is the statement for `−u`.

**Proof route.** Kallenberg's: for fixed `k`, `u n ≤ ⌊n/k⌋ u k + max_{j < k} u j`, so
`limsup u n / n ≤ u k / k` for every `k ≥ 1`; and `inf ≤ liminf` is trivial. When the infimum is
finite this is `Subadditive.tendsto_lim`, whose limit is `Subadditive.lim`.

**Checks.**

- `u n = −n²` is subadditive (`−(m + n)² ≤ −m² − n²`) and `u n / n = −n` tends to `⊥`, the
  infimum; Mathlib's bounded form does not apply to it.
- `u n = n²` is superadditive and not subadditive (`4 > 1 + 1` at `m = n = 1`).

*Needs:* `Subadditive`, `Subadditive.tendsto_lim`.

## Layer 2: Kingman's subadditive ergodic theorem

### 2.1 Subadditive processes

**Definition.** `IsSubadditiveProcess μ T f` holds for `f : ℕ → Ω → ℝ` when each `f n`, `n ≥ 1`,
is almost everywhere strongly measurable and `f (m + n) ≤ f m + f n ∘ T^[m]` almost everywhere for
all `m, n ≥ 1`. The growth constant `subadditiveRate μ f` is
`inf_{n ≥ 1} (∫ f n ∂μ) / n` in `EReal`; it is used for processes with integrable terms.

**Targets.**

- **Birkhoff sums** (`isSubadditiveProcess_birkhoffSum`): for almost everywhere strongly measurable
  `φ`, the Birkhoff sums `birkhoffSum T φ n` form a subadditive process (with equality).
  Viana, Example 3.1, p. 21; Viana and Oliveira, Example 3.3.1, p. 78.
- **Closure** (prose target): the sum of a subadditive process and the Birkhoff sums of an
  integrable function is a subadditive process; so is the pointwise maximum of a subadditive
  process and `n ↦ c n` for a constant `c`, which is Kallenberg's truncation (p. 572).

**Checks.**

- `f n = −n²` (constant in `x`) is a subadditive process with `γ = ⊥`, the case the `EReal`
  statements of 2.2, 2.3 and 2.5 are written for.
- The norms `log ‖A_n‖` of a cocycle form a subadditive process (Layer 4), but the entries
  `log (A_n)₀₀` of products of positive matrices are superadditive, not subadditive
  (Durrett, Example 6.5.1, p. 300); the sign convention matters.

*Needs:* `birkhoffSum`, `MeasurePreserving`.

### 2.2 Expectations

**Targets.**

- **Growth of expectations** (`IsSubadditiveProcess.tendsto_integral_div`): for an integrable
  subadditive process, `(∫ f n) / n → subadditiveRate μ f` in `EReal`. Durrett, Thm 6.4.1(a),
  pp. 296–297; Kallenberg, Thm 25.20(i), p. 570.

**Proof route.** By measure preservation `∫ f n ∘ T^[m] = ∫ f n`, so `n ↦ ∫ f n` is subadditive
on `n ≥ 1`; apply 1.1 to the sequence extended by `0` at `n = 0`.

*Needs:* 1.1; `MeasureTheory.MeasurePreserving.integral_comp'`.

### 2.3 Almost-everywhere convergence

**Targets.**

- **Kingman's theorem** (`IsSubadditiveProcess.ae_tendsto`): if the positive part of `f 1` is
  integrable, there is an almost everywhere measurable `g : Ω → EReal`, invariant, almost
  everywhere different from `⊤`, with integrable positive part, such that
  `f n x / n → g x` in `EReal` for almost every `x`. Viana, Thm 3.3, p. 21; Viana and Oliveira,
  Thm 3.3.3, p. 78; Kallenberg, Thm 25.20(i), p. 570.

**Proof route.** Viana's route (§§3.1.1–3.1.4, pp. 21–27), which does not use Birkhoff's
theorem and is the Avila–Bochi proof of Viana and Oliveira (p. 79): `f n ≤ ∑_{j < n} f 1 ∘ T^j`
controls the positive parts; `φ₋ = liminf f n / n` is invariant (`φ₋ ∘ T ≥ φ₋` and measure
preservation); the fundamental lemma (§3.1.2, p. 23) covers orbit segments by blocks on which
`f` is close to `n φ₋` when `φ₋ > −∞`, giving `∫ φ₋ ≥ γ`, and §3.1.4 bounds `φ₊ = limsup f n / n`
by `γ` from above; truncation at `−K n` (2.1, Closure) removes the assumption `φ₋ > −∞`.
Kallenberg's route through Birkhoff's theorem and a stationary coupling (pp. 571–572) is an
alternative.

*Needs:* 1.1, 2.1, 2.2.

### 2.4 Convergence in `L¹`

**Targets.**

- **`L¹` form** (`IsSubadditiveProcess.tendsto_L1`): for an integrable subadditive process with
  `γ > ⊥`, the limit is a real integrable invariant function `g`, `f n / n → g` almost
  everywhere and in `L¹`, and `∫ g = γ`. Durrett, Thm 6.4.1(b), p. 297; Kallenberg,
  Thm 25.20(ii), p. 570; Viana, Thm 3.3, p. 21 (the integral identity).

**Proof route.** Kallenberg, pp. 571–572: the bound `γ > −∞` with `f n⁺ ≤ ∑ f 1⁺ ∘ T^j` gives
uniform integrability of `f n / n` from both sides; Vitali (`tendsto_Lp_finite_of_tendsto_ae`)
turns the almost-everywhere limit of 2.3 into an `L¹` limit, and the integrals converge to `γ` by
2.2.

*Needs:* 2.2, 2.3; Mathlib uniform integrability and Vitali's theorem.

### 2.5 The ergodic case

**Targets.**

- **Ergodic limit** (`IsSubadditiveProcess.ae_tendsto_rate_of_ergodic`): for ergodic `T` and an
  integrable subadditive process, `f n x / n → γ` in `EReal` for almost every `x`, also when
  `γ = ⊥`. Durrett, Thm 6.4.1(c), p. 297; Kallenberg, Thm 25.20(iii), p. 570.

**Proof route.** The limit of 2.3 is invariant, hence almost everywhere constant; when `γ > ⊥` its
integral is `γ` by 2.4; when `γ = ⊥`, the truncations `max (f n) (−K n)` have limits
`max(g, −K)` with integrals `γ_K ↓ ⊥`, so the constant is `⊥`.

**Checks.**

- For `T` the identity on a two-point space with mass `1/2` each (not ergodic) and
  `f n x = n · φ x` with `φ = (0, 2)`, the limit is `φ`, not the constant `γ = 1`: ergodicity is
  needed.

*Needs:* 2.3, 2.4; Mathlib `Ergodic`.

## Layer 3: Volume growth of linear maps

### 3.1 Exterior-power norms (consumed)

**Definition.** For `B : E →L[ℝ] F` between finite-dimensional real inner product spaces,
`wedgeNorm k B` is the operator norm of `exteriorPower.map k B` on `⋀[ℝ]^k E` with Mathlib's inner
product, written as the expression `‖LinearMap.toContinuousLinearMap (exteriorPower.map k B)‖`
that EigenvalueAndSingularValueInequalities §2.4 uses, so that its theorems apply to `wedgeNorm`
by unfolding. It is the largest factor by which `B` multiplies `k`-dimensional volumes. Barreira,
(7.1), p. 137.

**Consumed from EigenvalueAndSingularValueInequalities §2.4**, not restated here:

- `‖⋀ᵏ B‖` is the product `σ_0(B) ⋯ σ_{k−1}(B)` of the `k` largest singular values, `1` at
  `k = 0` and `0` beyond the rank (Barreira, (7.2), p. 138, states the same identity);
- submultiplicativity `‖⋀ᵏ (C ∘ B)‖ ≤ ‖⋀ᵏ C‖ ‖⋀ᵏ B‖`.

Both are stated there for linear maps between finite-dimensional real inner product spaces; here
they are applied to the underlying linear maps of continuous linear maps.

### 3.2 Consequences for volume growth

**Targets.**

- **Degree one** (`wedgeNorm_one`): `‖⋀¹ B‖ = ‖B‖`. Barreira, p. 138.
- **Top degree** (`wedgeNorm_finrank`): for an endomorphism, `‖⋀ᵈ B‖ = |det B|`.
- **Log-concavity** (`wedgeNorm_mul_wedgeNorm_le_sq`):
  `‖⋀ᵏ B‖ ‖⋀ᵏ⁺² B‖ ≤ ‖⋀ᵏ⁺¹ B‖²`, so `k ↦ log ‖⋀ᵏ B‖` is concave where positive.
- **Positivity** (`wedgeNorm_pos`): for invertible `B` and `k ≤ d`, `‖⋀ᵏ B‖ > 0`.

**Proof route.** All four come from the product formula of 3.1. Degree one: the product is
`σ_0(B)`, the largest singular value, which is `‖B‖` (Tau Ceti's
`LinearMap.norm_apply_le_singularValues_mul_norm` at index `0`, with equality at the first right
singular vector `LinearMap.rightSingularBasis`). Top degree: the product of all singular values
is `|det B|` (`LinearMap.det` on the line `⋀ᵈ E`, or `det (B* B) = ∏ σ_i²`). Log-concavity is
`σ_{k+1} ≤ σ_k` (`LinearMap.singularValues_antitone`); positivity is `σ_{d−1} > 0` for
invertible `B`.

**Checks.**

- `B = diag(3, 2, 1)`: `‖⋀¹ B‖ = 3`, `‖⋀² B‖ = 6`, `‖⋀³ B‖ = 6 = det B`.
- For `B = [[0, 1], [0, 0]]` (nilpotent), `‖⋀¹ B‖ = 1` and `‖⋀² B‖ = 0`, while the spectral
  radius is `0`: the volume growth sees singular values, not eigenvalues.
- For `k > d`, `‖⋀ᵏ B‖ = 0`, matching the empty tail of singular values; for `k = 0` it is `1`.

*Needs:* 3.1 (EigenvalueAndSingularValueInequalities §2.4); `LinearMap.singularValues`,
`LinearMap.singularValues_antitone`, `LinearMap.det`; Tau Ceti `LinearMap.rightSingularBasis`,
`LinearMap.norm_apply_le_singularValues_mul_norm`.

## Layer 4: Linear cocycles and the Furstenberg–Kesten theorem

### 4.1 Cocycles

**Definition.** `cocycle A T n x` is `A(T^{n−1} x) ∘ ⋯ ∘ A(x)`, by recursion with
`cocycle A T 0 x = id`.

**Targets.**

- **Cocycle identity** (`cocycle_add`): `A_{m+n}(x) = A_n(T^m x) ∘ A_m(x)`. Viana, p. 21 (Example
  3.2).
- **Subadditivity** (`isSubadditiveProcess_log_wedgeNorm`): for an almost everywhere invertible
  generator, `n ↦ log ‖⋀ᵏ A_n‖` is a subadditive process, for every `k`. Barreira, (10.6),
  p. 207; Viana, Example 3.2, p. 21 (for `k = 1`).

**Proof route.** Induction on `n`; then submultiplicativity (3.1, from
EigenvalueAndSingularValueInequalities §2.4) and positivity (3.2), almost everywhere along the
orbit by measure preservation. For `k > d` both sides are `0`.

**Checks.**

- For a constant generator `A x = B`, `cocycle A T n x = Bⁿ`.

*Needs:* 2.1, 3.1 (EigenvalueAndSingularValueInequalities §2.4), 3.2.

### 4.2 Exponents

**Definitions.** `lyapunovSum A T k x` is the limit of `(1/n) log ‖⋀ᵏ A_n(x)‖` and
`lyapunovExponent A T i x` is `lyapunovSum A T (i + 1) x − lyapunovSum A T i x`.

**Targets.** Assume an almost everywhere invertible generator with `log⁺ ‖A‖` and
`log⁺ ‖A⁻¹‖` integrable.

- **Furstenberg–Kesten for every exterior power** (`tendsto_lyapunovSum`): for each `k`,
  `(1/n) log ‖⋀ᵏ A_n‖` converges almost everywhere and in `L¹` to `lyapunovSum A T k`, which is
  integrable and invariant, and `(1/n) ∫ log ‖⋀ᵏ A_n‖ → ∫ lyapunovSum A T k`. Viana, Thm 3.12,
  p. 28 (for `k = 1`); Barreira, Thm 10.1.8 and its proof, (10.7), pp. 207–208.
- **Extremal exponents** (`tendsto_log_norm_cocycle`): for `E ≠ 0`, `(1/n) log ‖A_n‖ → λ_0` and
  `(1/n) log ‖A_n⁻¹‖⁻¹ → λ_{d−1}` almost everywhere. Viana, Thm 3.12, p. 28; Barreira,
  (10.8)–(10.9), p. 208.

**Proof route.** `|log ‖⋀ᵏ A‖| ≤ k (log⁺ ‖A‖ + log⁺ ‖A⁻¹‖)` by the product formula of 3.1, so the
process of 4.1 is integrable with `γ > −∞`; apply 2.3–2.4. For the extremes, `‖⋀¹ B‖ = ‖B‖` and
`‖B⁻¹‖⁻¹ = σ_{d−1}(B) = ‖⋀ᵈ B‖ / ‖⋀ᵈ⁻¹ B‖` by the product formula of 3.1.

**Checks.**

- On a one-point space with `A = diag(2, 1/2)`: `λ_0 = log 2`, `λ_1 = −log 2`.
- With `A = [[1, 1], [0, 1]]` (a Jordan block): `‖Aⁿ‖ ≍ n`, so `λ_0 = λ_1 = 0`; polynomial growth
  is invisible to the exponents (numerically `(1/n) log ‖Aⁿ‖ ≈ 1.4 · 10⁻⁵` at `n = 10⁶`).

*Needs:* 2.3, 2.4, 3.1 (EigenvalueAndSingularValueInequalities §2.4), 3.2, 4.1; `Real.posLog`,
`Ring.inverse`.

### 4.3 Order, invariance and the determinant

**Targets.** Same hypotheses.

- **Order** (`lyapunovExponent_antitone`): almost everywhere `λ_j ≤ λ_i` for `i ≤ j < d`.
- **Sum** (`sum_lyapunovExponent`): `∑_{i < d} λ_i` is almost everywhere the conditional
  expectation of `log |det A|` on the invariant σ-algebra. Viana, (4.40), p. 56.
- **Invariance** (`lyapunovExponent_comp_ae`): `λ_i ∘ T = λ_i` almost everywhere, and for ergodic
  `T` each `λ_i` is almost everywhere constant. Viana, Thm 4.1(a), p. 39.

**Proof route.** Order: 3.2 log-concavity passes to the limits. Sum: `lyapunovSum A T d` is the
limit of `(1/n) log |det A_n| = (1/n) ∑_{j < n} log |det A| ∘ T^j` (3.2, top degree, and
`LinearMap.det_comp`), which is Birkhoff's theorem from ProbabilisticAndMetricNumberTheory §4.1 for
the integrable function `log |det A|` (`|log |det A|| ≤ d (log⁺ ‖A‖ + log⁺ ‖A⁻¹‖)`). Invariance:
from the invariance of `lyapunovSum` in 4.2.

**Checks.**

- For `|det A| = 1` the exponents sum to `0`; for `A = 2 · id` on `ℝ²` all exponents equal `log 2`
  and their sum `2 log 2 = log det A`.

*Needs:* 3.2, 4.2; ProbabilisticAndMetricNumberTheory §4.1; `MeasurableSpace.invariants`,
`MeasureTheory.condExp`, `LinearMap.det_comp`.

## Layer 5: The multiplicative ergodic theorem

### 5.1 Slow subspaces

**Definition.** `slowSubspace A T x t` is the subspace of `v` such that for every `ε > 0` there is
`C` with `‖A_n(x) v‖ ≤ C e^{n(t + ε)}` for all `n`: the vectors of forward growth rate at most
`t`. It is a submodule for every `x` and `t`, without hypotheses.

**Targets.**

- **Monotonicity** (prose target): `t ≤ s` gives `V_t(x) ≤ V_s(x)`.
- **Invariance** (`map_slowSubspace`): at every `x` with `A x` invertible,
  `A(x) V_t(x) = V_t(T x)`. Viana, Thm 4.1(a), p. 39.

**Proof route.** `A_n(T x) A(x) = A_{n+1}(x)` (4.1, `m = 1`), and the constant absorbs one factor
`e^{t+ε}`; conversely apply `A(x)⁻¹`.

**Checks.**

- On a one-point space with `A = diag(2, 1/2)`: `V_t = 0` for `t < −log 2`, `V_t = ℝ e₂` for
  `−log 2 ≤ t < log 2`, and `V_t = ℝ²` for `t ≥ log 2`. The slow subspace contains the contracted
  direction, not the expanded one: a definition by the expanded direction gets the middle range
  wrong.

*Needs:* 4.1.

### 5.2 One-sided theorem

**Targets.** Assume an almost everywhere invertible generator with `log⁺ ‖A‖` and
`log⁺ ‖A⁻¹‖` integrable.

- **Oseledets, one-sided** (`oseledets`): for almost every `x`, every nonzero `v` has an exact
  growth rate `lim (1/n) log ‖A_n(x) v‖ = λ_i(x)` for some `i < d`, and for every `t`
  the slow subspace `V_t(x)` has dimension `#{i < d : λ_i(x) ≤ t}`. Viana, Thm 4.1, pp. 38–39;
  Barreira, Thm 10.1.8, p. 207. Together with 5.1 this is Viana's invariant Oseledets flag
  `V_{λ_i}(x)`, and the limit for `v ∈ V_{λ_i} \ V_{<λ_i}` is `λ_i`.
- **Singular values** (`tendsto_log_singularValues_cocycle`): for almost every `x` and `i < d`,
  `(1/n) log σ_i(A_n(x)) → λ_i(x)`. Barreira, Thm 7.1.2, p. 139, and (10.9), p. 208.
- **Measurability** (prose target): the maps `x ↦ λ_i(x)` are almost everywhere measurable, and
  `x ↦ V_t(x)` is measurable in the sense that the orthogonal projection onto `V_t(x)` is an
  almost everywhere strongly measurable function of `x`. Viana, Thm 4.1(b), p. 39.

**Proof route.** Barreira's route (§10.1 with §7.1): 4.2 gives the limits of `(1/n) log ‖⋀ᵏ A_n‖`
for all `k`, hence by the product formula of 3.1 those of `(1/n) log σ_i(A_n)`; this is the
singular-value target. Raghunathan's lemma (Barreira, Thm 7.1.2, whose proof rests on his Thm 6.2.2)
then says that a tempered sequence whose singular values have exponential growth rates is forward
regular: the spans of the right singular vectors of `A_n(x)` for the singular values of rate at most
`t` converge to `V_t(x)`, and vectors in `V_t \ V_{<t}` grow at rate exactly `t`. Temperedness,
`(1/n) log⁺ ‖A(T^n x)^{±1}‖ → 0`, is Barreira's Lemma 10.1.9 (p. 207), from Birkhoff's theorem of
ProbabilisticAndMetricNumberTheory §4.1 applied to `log⁺ ‖A^{±1}‖`. Viana's induction on the number
of exponents (§4.2, pp. 40–53) is an alternative.

**Checks.**

- On a one-point space with `A = diag(2, 1/2)`: `v = e₁ + e₂` has rate `log 2 = λ_0`, `v = e₂`
  has rate `−log 2 = λ_1`; `dim V_t` is `0, 1, 2` on the three ranges of 5.1.
- With the Jordan block `[[1, 1], [0, 1]]` every nonzero vector has rate `0`, `V_t = 0` for
  `t < 0` and `V_t = ℝ²` for `t ≥ 0`, although `e₁` is the only eigendirection.

*Needs:* 3.1 (EigenvalueAndSingularValueInequalities §2.4), 3.2, 4.2, 4.3, 5.1;
ProbabilisticAndMetricNumberTheory §4.1;
`LinearMap.singularValues`, Tau Ceti `LinearMap.rightSingularBasis`.

### 5.3 Two-sided theorem

**Definitions.** For invertible `T : Ω ≃ᵐ Ω`, `backwardGenerator A T` is `y ↦ A(T⁻¹ y)⁻¹`; its
cocycle over `T⁻¹` at `x` is `A_{−n}(x) = A_n(T^{−n} x)⁻¹`. The Oseledets space
`oseledetsSpace A T x t` is the intersection of the slow subspace of `A` at rate `t` with the slow
subspace of the backward cocycle at rate `−t`.

**Targets.** Same hypotheses, with `T` invertible.

- **Oseledets, two-sided** (`oseledets_twoSided`): for almost every `x`, `E` is the internal
  direct sum (`DirectSum.IsInternal`) of the spaces `E_t(x)` over the distinct exponents
  `t ∈ {λ_i(x)}`; `A(x) E_t(x) = E_t(T x)` for every `t`; a nonzero `v ∈ E_t(x)` has
  `(1/n) log ‖A_n(x) v‖ → t` and `(1/n) log ‖A_{−n}(x) v‖ → −t`; and `dim E_t(x)` is the
  multiplicity `#{i < d : λ_i(x) = t}`. Viana, Thm 4.2(a)–(b), p. 39.
- **Backward exponents** (`lyapunovExponent_backwardGenerator`): almost everywhere the exponents of
  the backward cocycle are `−λ_{d−1−i}`. Viana, Thm 3.20, p. 34 (for `d = 2`); Barreira, p. 208
  (the coherence of the forward and backward filtrations).
- **Subexponential angles** (prose target): for disjoint sets `I, J` of distinct exponents,
  `(1/n) log sin ∠(⊕_{t ∈ I} E_t(T^n x), ⊕_{t ∈ J} E_t(T^n x)) → 0` as `n → ±∞`, where the angle
  between subspaces is the least angle between nonzero vectors; equivalently, the norms of the
  projections of the splitting at `T^n x` grow subexponentially. Viana, Thm 4.2(c), p. 39.
- **Determinants on sums of Oseledets spaces** (prose target): for a set `I` of distinct
  exponents, `(1/n) log |det (A_n(x)|_{⊕_{t∈I} E_t(x)})| → ∑_{t ∈ I} t · dim E_t(x)` as
  `n → ±∞`. Viana, (4.39), p. 56.

**Proof route.** Viana §4.3 (pp. 53–59): apply 5.2 to `A` over `T` and to the backward cocycle over
`T⁻¹`; the backward exponents are `−λ` by the determinant identity of 4.3 and the coherence of
the two filtrations (Barreira, p. 208); set `E_t = V_t ∩ V⁻_{−t}` and show by dimension count
that the intersections form a splitting; subexponential angles are Viana §4.3.2 (p. 55), from
temperedness (5.2).

**Checks.**

- On a one-point space (`T = id`) with `A = diag(2, 1/2)`: `E_{log 2} = ℝ e₁`,
  `E_{−log 2} = ℝ e₂`, and `E_t = 0` for other `t`.
- With the Jordan block `[[1, 1], [0, 1]]`: one exponent `0` with `E_0 = ℝ²`, although the block is
  not diagonalisable; the splitting is coarser than an eigenspace decomposition.

*Needs:* 4.3, 5.1, 5.2.

## Layer 6: Products of independent random matrices

The base is the shift on `ℕ → (E →L[ℝ] E)` with the product law `Measure.infinitePi fun _ ↦ ν`,
and the generator is `ω ↦ ω 0`, so `A_n(ω) = ω (n − 1) ⋯ ω 0`. The operator space carries its Borel
σ-algebra. The law `ν` is supported on invertible operators and has
`log⁺ ‖g‖ + log⁺ ‖g⁻¹‖` integrable.

### 6.1 Constant exponents

**Targets.**

- **Almost sure exponents** (`lyapunovExponent_iid`): there are constants `c_i` with
  `λ_i = c_i` almost surely for all `i`, and `(1/n) E log ‖A_n‖ → c_0`. Kallenberg, Thm 25.21,
  p. 572 (positive matrices); Viana, §2.1.1, p. 7, and Thm 3.12, p. 28.
- **Positive matrices** (prose target): if `ν` is carried by matrices with positive entries and
  `E |log g_{ij}| < ∞` for all entries, then `(1/n) log (A_n)_{ij} → c_0` almost surely and in
  `L¹` for all `i, j`. Kallenberg, Thm 25.21, p. 572; Durrett, Example 6.5.1, pp. 300–301.

**Proof route.** The Bernoulli shift is ergodic: Tau Ceti proves it in
`TauCeti/Probability/Ergodic/BernoulliShift.lean` through Kolmogorov's zero–one law
(`ProbabilityTheory.measure_zero_or_one_of_measurableSet_limsup_atTop`). Apply 4.3 and 4.2. For
positive matrices, Kallenberg's comparison of entries with the norm.

**Checks.**

- `ν = ½ δ_{diag(2, 1/2)} + ½ δ_{diag(1/3, 3)}`: the products are diagonal, the exponents are
  `±(½ log 3 − ½ log 2) = ±0.2027…`; simulation over `2 · 10⁵` steps gives `0.2045`.
- `ν` carried by rotations: `λ_0 = λ_1 = 0` (simulation `≈ 10⁻¹⁷`).

*Needs:* 4.2, 4.3; Tau Ceti `TauCeti.Probability.shift`; `Measure.infinitePi`.

### 6.2 Strong irreducibility

**Definition.** `IsStronglyIrreducible S` holds for a set `S` of operators when no nonempty finite
family of proper nonzero subspaces is permuted by every invertible element of `S`: for each such
family `𝓕` some invertible `g ∈ S` maps some `W ∈ 𝓕` outside `𝓕`. Benoist and Quint, §4.7, p. 70
(for the semigroup `Γ_μ`; a family is invariant under the support exactly when it is invariant
under the closed semigroup it generates in the invertible group).

**Checks.**

- `{diag(2, 1/2), [[0, 1], [−1, 0]]}` is not strongly irreducible: the pair of coordinate axes is
  permuted. It is irreducible (no common invariant line).
- In dimension `2`, the rotation by an irrational multiple of `π` is strongly irreducible.

*Needs:* nothing beyond Mathlib's `Submodule.map`.

### 6.3 Furstenberg's positivity theorem

**Targets.**

- **Furstenberg** (`lyapunovExponent_zero_gt_iid`): for `d ≥ 2`, if the support of `ν` is strongly
  irreducible and the semigroup it generates (`Subsemigroup.closure` of `Measure.support`) is
  unbounded after normalising each element to determinant `±1`, then almost surely
  `λ_0 > (1/d) ∫ log |det g| dν`. Benoist and Quint, Thm 4.31 with (4.13)–(4.14), p. 70; Viana,
  Thm 6.11, p. 105 (for `SL(2, ℝ)`).
- **Positivity on `SL(d, ℝ)`** (prose target, the case `det = 1`): `λ_0 > 0`. Benoist and Quint,
  Cor 4.32, p. 71.
- **Furstenberg's formula** (prose target): for strongly irreducible `ν`,
  `λ_0 = ∫∫ log (‖g v‖ / ‖v‖) dν(g) dη([v])` for every `ν`-stationary probability `η` on the
  projective space `ℙ ℝ E`, on which an invertible `g` acts by `Projectivization.map`. Viana,
  Thm 6.8, p. 102. Mathlib gives `ℙ ℝ E` the quotient topology
  (`Projectivization.instTopologicalSpace`) but no σ-algebra; the measures are taken for its
  Borel σ-algebra `borel (ℙ ℝ E)`.

**Proof route.** Benoist and Quint, §4.7 (from p. 70), the Guivarc'h–Raugi argument: the ratio of
the norm cocycle to the determinant cocycle has Birkhoff sums that diverge linearly unless a
stationary measure on projective space is invariant, and an invariant measure with unbounded
`Γ_μ` contradicts strong irreducibility. Viana's §6.3 (pp. 105–112) gives the two-dimensional
proof through convergence of `A_n^* η` to Dirac masses.

**Checks.**

- The pair of Check 6.2 (each with probability `½`) generates an unbounded group of determinant
  `1`, yet `λ_0 = 0` (simulation `8 · 10⁻⁴` over `2 · 10⁵` steps): strong irreducibility cannot be
  weakened to irreducibility. Benoist and Quint, Remark 4.34, p. 71.
- Replacing the quarter turn by the rotation by `π/4` gives a strongly irreducible unbounded law,
  and simulation gives `λ_0 ≈ 0.17 > 0`.
- A law carried by rotations, one of them by an irrational multiple of `π`: strongly irreducible
  but bounded, and `λ_0 = 0`.

*Needs:* 2.3, 4.2, 6.1, 6.2; ProbabilisticAndMetricNumberTheory §4.1; `Measure.support`,
`Subsemigroup.closure`; for the formula, `Projectivization.map` and `borel`.

## Layer 7: Subadditive limits in probability and combinatorics

### 7.1 The range of a random walk

Let `G` be a countable abelian group with all sets measurable, `ω : ℕ → G` the increments and
`S_k = ω 0 + ⋯ + ω (k − 1)`.

**Definitions.** `rangeCard ω n` is the number of distinct sites among `S_1, …, S_n`; `noReturn G`
is the event that `S_k ≠ 0` for all `k ≥ 1`.

**Targets.**

- **Subadditivity** (`isSubadditiveProcess_rangeCard`): for a shift-invariant law, `n ↦ R_n` is a
  subadditive process. Durrett, Example 6.4.3, p. 297.
- **Kesten–Spitzer–Whitman, stationary form** (`tendsto_rangeCard_div`): for a shift-invariant
  probability `m`, `R_n / n → m[1_{noReturn} | invariant σ-algebra]` almost surely. Durrett,
  Thm 6.3.1, p. 294.
- **Kesten–Spitzer–Whitman** (`tendsto_rangeCard_div_iid`): for i.i.d. increments,
  `R_n / n → P(noReturn)` almost surely. Durrett, p. 293 (the remark before Thm 6.3.1).
- **Recurrence criterion** (prose target): for i.i.d. increments, the walk returns to `0` almost
  surely exactly when `R_n / n → 0` almost surely.

**Proof route.** Durrett's (p. 294): `R_n ≥ ∑_{1 ≤ j ≤ n} 1_{noReturn} ∘ shift^j` and
`R_n ≤ k + ∑_{1 ≤ j ≤ n−k} 1_{A_k} ∘ shift^j`, with `A_k` the event of no return within `k` steps;
Birkhoff's theorem from ProbabilisticAndMetricNumberTheory §4.1 on both sides, then monotone
convergence of conditional expectations as `k → ∞`. The i.i.d. form uses ergodicity of the
Bernoulli shift (6.1). Subadditivity is the inclusion
`{S_{m+1}, …, S_{m+n}} = S_m + {S'_1, …, S'_n}`.

**Checks.**

- The nearest-neighbour walk on `ℤ` with `P(+1) = p = 0.7` has escape probability `|2p − 1| = 0.4`;
  simulation over `2 · 10⁵` steps gives `R_n / n = 0.3998`.
- The symmetric walk on `ℤ` is recurrent and `R_n / n → 0` (simulation `0.0034`).

*Needs:* 2.1, 6.1; ProbabilisticAndMetricNumberTheory §4.1; `TauCeti.Probability.shift`.

### 7.2 First-passage percolation

The edges of `ℤ^d`, `d ≥ 1`, are the pairs `(i, z)` joining `z` and `z + e_i`. Edge weights are
`τ : Fin d × (Fin d → ℤ) → ℝ≥0`, i.i.d. with law `ν`.

**Definitions.** A lattice path from `x` is a list of unit steps (`stepVec`, with endpoint
`pathEnd`); its travel time `pathWeight τ x p` is the sum of the weights of the edges it crosses;
`passageTime τ x y` is the infimum of travel times over paths from `x` to `y`. `timeConstant ν` is
`inf_{n ≥ 1} E T(0, n e₀) / n` in `ℝ≥0∞`.

**Targets.**

- **Triangle inequality** (`passageTime_le_add`): `T(x, z) ≤ T(x, y) + T(y, z)`.
- **Translation covariance** (`passageTime_translate`): translating the weights by `z` translates
  the passage times by `z`.
- **Time constant** (`tendsto_passageTime_div`): if `E T(0, e₀) < ∞`, the time constant is finite
  and `T(0, n e₀) / n` converges to it almost surely. Durrett, Example 6.5.4, p. 302.
- **Moment condition** (prose target): `E T(0, e₀) < ∞` holds when `E τ < ∞`, and, for `d ≥ 2`,
  more generally when the minimum of `2d` independent copies of `τ` has finite mean (through `2d`
  edge-disjoint paths from `0` to `e₀`, which exist exactly when `d ≥ 2`); in every dimension, if
  that minimum has infinite mean then `limsup T(0, n e₀)/n = ∞` almost surely. Durrett, p. 302
  and p. 303.
- **Other directions** (prose target): if `E T(0, e₀) < ∞` (by the symmetry of the lattice, the
  same as `E T(0, e_i) < ∞` for every `i`), then for every `x ∈ ℤ^d` the limit
  `μ(x) = lim T(0, n x) / n` exists almost surely and is constant; `μ(k x) = k μ(x)`,
  `μ(x + y) ≤ μ(x) + μ(y)`, `μ` is invariant under coordinate permutations and sign changes, and
  `μ(x) ≤ ‖x‖₁ E τ`.
- **Convergence in `L¹`** (prose target): under `E T(0, e₀) < ∞`, `T(0, n e₀)/n → μ(e₀)` in `L¹`.

**Proof route.** `f n τ = T(0, n e₀)` is a subadditive process over translation by `e₀`, by the
triangle inequality and translation covariance; translation preserves the product law
(`Measure.map_infinitePi_infinitePi_of_inj` along the translation of edges). Apply 2.3–2.4. The
limit is constant by Durrett's argument: changing finitely many weights changes `T(0, n e₀)` by a
bounded amount, so the limit is measurable for the tail of an enumeration of the edges, and
Kolmogorov's zero–one law (`ProbabilityTheory.measure_zero_or_one_of_measurableSet_limsup_atTop`)
applies.

**Checks.**

- `d = 1`: the only path from `0` to `n e₀` without backtracking crosses the edges `0, …, n − 1`,
  so `T(0, n e₀) = τ_0 + ⋯ + τ_{n−1}` and the time constant is `E τ` (the strong law).
- `d = 1` and `P(τ > t) = t^{−2/3}` for `t ≥ 1`: the minimum of two copies has tail `t^{−4/3}` and
  mean `1 + 3 = 4`, while `E T(0, e₀) = E τ = ∞`. For `d = 1` the moment condition is `E τ < ∞`,
  and the clause on `2d` copies is false there.
- Constant weights `τ ≡ c`: `T(0, n e₀) = n c` in every dimension, and the time constant is `c`.

*Needs:* 2.3, 2.4; `Measure.infinitePi`, `Measure.map_infinitePi_infinitePi_of_inj`.

### 7.3 Longest common subsequences

**Definitions.** `lcsLength u v` is the length of a longest common subsequence of the lists `u, v`
(a longest list that is a sublist of both); for `ω : ℕ → α × α`, `lcsPrefix ω n` is the
`lcsLength` of the first `n` letters of the two coordinate words.

**Targets.**

- **Superadditivity** (`lcsPrefix_add_le`): `L_m(ω) + L_n(shift^m ω) ≤ L_{m+n}(ω)`. Durrett,
  Example 6.4.4, p. 297.
- **Chvátal–Sankoff limit** (`tendsto_lcsPrefix_div`): for a finite alphabet and a shift-ergodic
  law of letter pairs, `L_n / n → sup_{n ≥ 1} E L_n / n` almost surely. Durrett, Example 6.4.4,
  p. 297.
- **Bounds** (`lcs_constant_bounds`): for two independent i.i.d. words with letter law `ν`, the
  constant `γ` satisfies `ν{a} ≤ γ ≤ 1` for every letter `a`.

**Proof route.** Concatenating common subsequences of the two blocks gives superadditivity; apply
2.5 to `−L_n`. Bounds: `L_n ≥ min(#a in X_{<n}, #a in Y_{<n})` and the strong law; `L_n ≤ n`. The
i.i.d. law of pairs is ergodic by 6.1.

**Checks.**

- `lcsLength [0, 1, 0] [1, 0, 1] = 2`.
- A one-letter alphabet gives `γ = 1`; two uniform letters give `γ ≈ 0.81` (simulation `0.80`
  at `n = 800`), above the bound `½`; four uniform letters give `≈ 0.64 ≥ ¼`.

*Needs:* 2.5, 6.1.

## Downstream consumers

- Nonuniform hyperbolicity (Pesin theory, the Ruelle inequality and the Pesin entropy formula),
  which HyperbolicDynamicsAndThermodynamicFormalism excludes, starts from the derivative cocycle
  `A(x) = D T_x` of 4.1 and the Oseledets splitting of 5.3.
- Random Schrödinger operators: the Lyapunov exponent of the transfer-matrix cocycle and its
  positivity (6.3) give Anderson localisation in one dimension.
- First-passage percolation's shape theorem builds on 7.2.

## Scope and ownership

The roadmap is complete when every target below is a theorem of the TauCeti namespace with the
hypotheses stated here, every owned definition has the API its Checks name, and every statement in
`Suggested.lean` is proved. The headlines with a Lean name are stated in `Suggested.lean`, each
with every conclusion this README attaches to it; that file is not an exhaustive acceptance test,
and the other headlines here are targets of the same standing, stated in prose.

Owned here:

- Fekete's lemma in `EReal` and its superadditive form;
- subadditive processes `IsSubadditiveProcess`, their growth constant `subadditiveRate` and
  Kingman's theorem in its almost-everywhere, `L¹` and ergodic forms;
- the consequences of 3.2 for the exterior-power norm `wedgeNorm` (degree one, top degree,
  log-concavity, positivity);
- linear cocycles `cocycle`, the exponent sums `lyapunovSum` and exponents `lyapunovExponent`, the
  Furstenberg–Kesten theorem for all exterior powers and the theorems of 4.3;
- slow subspaces `slowSubspace`, the backward generator `backwardGenerator`, Oseledets spaces
  `oseledetsSpace` and the multiplicative ergodic theorem in both forms, with the singular-value
  characterisation of the exponents;
- strong irreducibility `IsStronglyIrreducible`, the exponents of i.i.d. products and
  Furstenberg's positivity theorem and formula;
- the range `rangeCard` and `noReturn` with the Kesten–Spitzer–Whitman theorem; lattice paths,
  `passageTime` and `timeConstant` of first-passage percolation; `lcsLength`, `lcsPrefix` and the
  Chvátal–Sankoff limit.

**Not owned here.**

- Birkhoff's pointwise ergodic theorem: ProbabilisticAndMetricNumberTheory §4.1 owns it and it is
  consumed. Kingman's theorem contains it (Viana, Corollary 3.10, p. 27), but that derivation is
  not a target.
- Mixing, spectral theory, entropy, natural extensions, the Ornstein–Weiss limit lemma for
  subadditive functions on finite subsets of amenable groups, and Rokhlin towers are the subject of
  the classical-ergodic-theory roadmap
  [ClassicalErgodicTheory](../ClassicalErgodicTheory/README.md). The subadditive limits here are
  along `ℕ`, and the two-sided theorem works with an invertible base directly rather than through
  natural extensions.
- Uniform hyperbolicity, thermodynamic formalism and equilibrium states are the subject of
  HyperbolicDynamicsAndThermodynamicFormalism, which excludes Lyapunov exponents
  and Pesin theory.
- The norm of an exterior power as a product of singular values, its submultiplicativity, and the
  singular-value inequalities for products of matrices (the log-majorisation of Gelfand–Naimark and
  Horn, Weyl's majorant theorem) belong to
  [EigenvalueAndSingularValueInequalities](../EigenvalueAndSingularValueInequalities/README.md);
  its §2.4 is consumed in 3.1.
- Bernoulli percolation and its critical probability belong to
  [BernoulliPercolation](../BernoulliPercolation/README.md) (§1.3); random walks on `ℤ^d`
  beyond the range theorem (Pólya, fluctuation theory) to
  [MarkovChainsAndRenewal](../MarkovChainsAndRenewal/README.md) and RandomWalkFluctuationTheory.

## Exact supplier contracts

### From Mathlib

- `Subadditive`, `Subadditive.tendsto_lim`, `Subadditive.lim` (`Mathlib/Analysis/Subadditive.lean`):
  Fekete's lemma for real sequences with `u n / n` bounded below.
- `birkhoffSum`, `birkhoffAverage` (`Mathlib/Dynamics/BirkhoffSum/Basic.lean`,
  `Mathlib/Dynamics/BirkhoffSum/Average.lean`); `MeasurePreserving`, `Ergodic`,
  `MeasurableSpace.invariants` (`Mathlib/Dynamics/Ergodic/`); `MeasureTheory.condExp`;
  `MeasureTheory.MeasurePreserving.integral_comp'`.
- `exteriorPower.map` (`Mathlib/LinearAlgebra/ExteriorPower/`), `exteriorPower.inner_ιMulti_ιMulti`
  (`Mathlib/Analysis/InnerProductSpace/ExteriorPower.lean`): the inner product on `⋀[ℝ]^k E`,
  with finite dimension.
- `LinearMap.singularValues`, `LinearMap.singularValues_antitone`
  (`Mathlib/Analysis/InnerProductSpace/SingularValues.lean`); `LinearMap.det`, `LinearMap.det_comp`.
- `Real.posLog` (`Mathlib/Analysis/SpecialFunctions/Log/PosLog.lean`), `Ring.inverse`.
- `Measure.infinitePi`, `Measure.map_infinitePi_infinitePi_of_inj`
  (`Mathlib/Probability/ProductMeasure.lean`),
  `ProbabilityTheory.measure_zero_or_one_of_measurableSet_limsup_atTop`
  (`Mathlib/Probability/Independence/ZeroOne.lean`): product laws, their invariance under
  injective reindexing, and Kolmogorov's zero–one law.
- `Measure.support`, `Subsemigroup.closure`, `DirectSum.IsInternal`, `limUnder`.
- `Projectivization.instTopologicalSpace`, `Projectivization.map`
  (`Mathlib/Topology/Algebra/Projectivization.lean`, `Mathlib/LinearAlgebra/Projectivization/`)
  and `borel`: the quotient topology on `ℙ ℝ E`, the action of injective linear maps, and the Borel
  σ-algebra, for Furstenberg's formula in 6.3.

### From Tau Ceti

- `TauCeti.Probability.shift` (`TauCeti/Probability/Process/PathLaw/Basic.lean`): the one-sided
  shift on `ℕ → α`.
- `LinearMap.rightSingularBasis`, `LinearMap.norm_apply_le_singularValues_mul_norm`
  (`TauCeti/Analysis/InnerProductSpace/SingularValues.lean`): the right singular basis, left
  singular vectors and the singular-value bounds of a linear map between finite-dimensional inner
  product spaces.
- The ergodicity of the Bernoulli shift for an i.i.d. product law
  (`TauCeti/Probability/Ergodic/BernoulliShift.lean`), used in 6.1, 7.1 and 7.3.

### From other roadmaps

- [ProbabilisticAndMetricNumberTheory](../ProbabilisticAndMetricNumberTheory/README.md) §4.1:
  Birkhoff's pointwise theorem, for a measure-preserving map of a probability space and an
  integrable real function, with almost-everywhere convergence of the Birkhoff averages to the
  conditional expectation on the invariant σ-algebra, and its ergodic form with limit the
  integral. Used in 4.3, 5.2, 6.3 and 7.1.

### From EigenvalueAndSingularValueInequalities

- [EigenvalueAndSingularValueInequalities](../EigenvalueAndSingularValueInequalities/README.md)
  §2.4 (Exterior powers): for a linear map `A` between finite-dimensional real inner product
  spaces and every `k`, the operator norm of `exteriorPower.map k A` (through
  `LinearMap.toContinuousLinearMap`) is the product of the first `k` singular values
  `LinearMap.singularValues`, and the operator norm of the `k`-th exterior power of a composite is
  at most the product of the operator norms. No hypothesis beyond finite dimension. Used in 3.1,
  3.2, 4.1, 4.2 and 5.2.

### Mathlib results followed

- The pointwise ergodic theorem for normed spaces, built on the maximal ergodic theorem: where
  Mathlib has it, it replaces the supplier of ProbabilisticAndMetricNumberTheory §4.1 in the proof
  routes here; no statement of this roadmap changes.

## Beyond this roadmap (a roadmap for a roadmap; do not implement)

- **Hammersley's theorem and Ulam's problem.** The longest increasing subsequence `ℓ(π_n)` of a
  uniform permutation satisfies `ℓ(π_n)/√n → γ` by Kingman's theorem applied to the Poisson process
  in the plane (Durrett, Example 6.5.2, pp. 301–302), and `γ = 2` by Logan–Shepp and
  Vershik–Kerov. It needs Poisson point processes on `ℝ²`.
- **Liggett's subadditive theorem** for arrays `X_{m,n}` stationary only along arithmetic
  progressions (Durrett, Thm 6.4.1 in full; Kallenberg, Thm 25.20), with age-dependent branching
  processes as the application (Durrett, Example 6.5.5).
- **Kesten's theorems on first-passage percolation**: the time constant vanishes exactly when
  `P(τ = 0) ≥ p_c`; the Cox–Durrett shape theorem; concentration and fluctuation bounds.
- **Noninvertible cocycles**: Raghunathan's and Ruelle's multiplicative ergodic theorem for
  matrices that need not be invertible, with exponents in `[−∞, ∞)`; cocycles of operators on
  Banach spaces (Ruelle, Mañé, Thieullen, Lian–Lu).
- **Simplicity and continuity of exponents**: the Guivarc'h–Raugi and Gol'dsheid–Margulis
  simplicity criteria, Avila–Viana's pinching and twisting criterion, continuity of exponents of
  i.i.d. products (Viana, Chapters 8–10), and the Mañé–Bochi theorem.
- **Limit theorems for random matrix products**: the central limit theorem and large deviations
  for `log ‖A_n v‖` (Benoist and Quint, Chapters 12–14).

## Prior formalization

- **[lean-CKMA](https://github.com/bjbraams/lean-CKMA)** (the author's project, Apache 2.0; design
  ideas and provenance), at commit `f4bd822`: `CKMA/Dynamics/Ergodic/Pointwise.lean` proves,
  without `sorry`, Birkhoff's pointwise theorem and Kingman's theorem in the `L¹` form of 2.4, with
  supporting files `CKMA/Dynamics/Ergodic/Pointwise/Kingman*.lean` following the Avila–Bochi
  truncation. Its synopsis entries 10.7 (Kingman), 10.40 (Furstenberg–Kesten) and
  10.41 (Oseledets) are targets here; the `EReal` forms of 2.3 and 2.5 and all of Layers 3–7 are
  not formalized there.
- **Mathlib.** The maximal ergodic theorem and the pointwise ergodic theorem for normed spaces
  have been developed for Mathlib (pull requests #34031 and #42078); no Mathlib development treats
  subadditive processes or Lyapunov exponents.

## References

- Y. Benoist and J.-F. Quint, *Random Walks on Reductive Groups*, Ergebnisse der Mathematik 62,
  Springer, 2016. Used: §4.7, Thm 4.31, p. 70; Cor 4.32 and Remark 4.34, p. 71.
- L. Barreira, *Lyapunov Exponents*, Birkhäuser, 2017. Used: (7.1), p. 137; (7.2), p. 138;
  Thm 7.1.2, p. 139; Thm 10.1.8 and Lemma 10.1.9, p. 207; (10.6)–(10.9), pp. 207–208.
- R. Durrett, *Probability: Theory and Examples*, 5th ed., Cambridge University Press, 2019.
  Used: Thm 6.3.1, p. 294; Thm 6.4.1, pp. 296–297; Examples 6.4.3 and 6.4.4, p. 297;
  Example 6.5.1, pp. 300–301; Example 6.5.2, pp. 301–302; Example 6.5.4, pp. 302–303.
- O. Kallenberg, *Foundations of Modern Probability*, 3rd ed., Springer, 2021. Used: Lemma 25.19
  and Thm 25.20, p. 570; proof of Thm 25.20, pp. 571–572; Thm 25.21, p. 572.
- M. Viana, *Lectures on Lyapunov Exponents*, Cambridge Studies in Advanced Mathematics 145,
  Cambridge University Press, 2014. Used: §2.1.1, p. 7; Examples 3.1–3.2, Thm 3.3 and Lemma 3.4,
  p. 21; §3.1.2, p. 23; Corollary 3.10, p. 27; Thm 3.12, p. 28; Thm 3.20, p. 34;
  §§4.2–4.3, pp. 40–59; Thm 4.1, pp. 38–39; Thm 4.2,
  p. 39; (4.39)–(4.40), p. 56; Thm 6.8, p. 102; Thm 6.11, p. 105.
- M. Viana and K. Oliveira, *Foundations of Ergodic Theory*, Cambridge Studies in Advanced
  Mathematics 151, Cambridge University Press, 2016. Used: Example 3.3.1 and Thm 3.3.3, p. 78.
