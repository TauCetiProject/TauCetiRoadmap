# Roadmap: power spectra of continuous-time stationary processes and the Wiener–Khinchin theorem

**Summary.** A process here is a family `X : ℝ → E` of vectors in a complex inner product space,
indexed by continuous time; for centred square-integrable random variables `E` is `L²` and the
inner product is the covariance. The family is second-order stationary when `⟪X s, X t⟫` depends
only on `t − s`, its autocovariance is `C(τ) = ⟪X 0, X τ⟫`, and it is mean-square continuous when
`X` is continuous at `0`. Every such family has a spectral measure: the unique finite measure `μ`
on the line of frequencies with `C(τ) = ∫ exp(2πiτξ) dμ(ξ)`. This roadmap develops the theory of
this measure: the isometry it gives, how it is recovered from the periodogram, its atoms, and what
linear filters, differentiation and sampling do to it.

The headline theorems are these, each for a second-order stationary, mean-square continuous
family; the isometry and every statement that integrates in `E` take `E` complete.

- *Spectral isometry.* There is a linear isometry from `L²(μ)` onto the closed linear span of the
  family that sends the exponential `ξ ↦ exp(2πitξ)` to `X t` for every `t`.
- *Wiener–Khinchin theorem.* The periodogram `T⁻¹ ‖∫₀ᵀ exp(−2πiξt) X t dt‖²` converges weakly
  to `μ` as `T → ∞`, with no further hypothesis. If `C` is integrable, `μ` has the continuous
  density `𝓕C(ξ) = ∫ C(τ) exp(−2πiξτ) dτ`, and the periodogram converges to it at every `ξ`.
- *Atoms.* The averages `T⁻¹ ∫₀ᵀ exp(−2πiνt) X t dt` converge, and the squared norm of the limit
  is the mass `μ{ν}`; so do the averages of `exp(−2πiνt) C(t)`, to `μ{ν}` itself.
- *Filters, derivatives and sampling.* Filtering by an integrable impulse response `h`
  multiplies `μ` by `|𝓕h|²`; the family is mean-square differentiable exactly when
  `∫ ξ² dμ < ∞`, and the derivative has spectral measure `(2πξ)² μ`; if `μ` is carried by the open
  band `(−W, W)`, then `X t = ∑ₖ sinc(π(2Wt − k)) X(k/2W)` in norm.

The spectral measure is Tau Ceti's Bochner measure of the autocovariance read backwards in time,
so Bochner's theorem, which Tau Ceti proves on finite-dimensional spaces, is used and not
restated. Stationarity is the condition of MathematicalStatisticsFoundations (§9.6) with time `ℝ`
in place of `ℤ`. ClassicalErgodicTheory (Layer 2) treats spectral measures of unitary
representations, which are those of the families `t ↦ U_t f`; MathematicalBilliards (Layer 12)
treats Wiener's lemma for finite measures on the line, which gives the Cesàro means of `|C|²` as
the sum of the squared atoms of `μ`, and the atom formula for unitary groups; SamplingAndDiscreteFourierAnalysis
(Layer 6) proves the sampling theorem for band-limited functions, of which Layer 4 is the
mean-square analogue for processes.

Layer 1 defines the spectral measure and builds the isometry. Layer 2 treats the periodogram,
spectral densities and atoms. Layer 3 treats linear filters and mean-square derivatives, and
Layer 4 the sampling theorem.

## Conventions

- `E` is a complex inner product space with Mathlib's inner product, conjugate-linear in the
  first argument. For random variables, `⟪U, V⟫ = E[conj(U) V]`. A theorem that integrates an
  `E`-valued function assumes `E` complete: Mathlib's Bochner integral is `0` in an incomplete
  space.
- `IsSecondOrderStationary X` means `⟪X s, X t⟫ = ⟪X 0, X (t − s)⟫` for all real `s`, `t`, and
  `autocov X τ = ⟪X 0, X τ⟫`. Then `C(−τ) = conj C(τ)` and `‖X t‖² = C(0)`. Mean-square continuity
  is the hypothesis `ContinuousAt X 0`; with stationarity it makes `X` continuous everywhere, since
  `‖X(t + h) − X t‖² = 2 Re(C(0) − C(h))`.
- Frequencies are ordinary frequencies `ξ`, in cycles per unit of time. The tone
  `X t = exp(2πiνt) z` has its spectral atom at `ν`. Tau Ceti's Fourier atom is
  `fourierAtom τ ξ = exp(−2πiτξ)`, and Bochner's theorem writes `F(τ) = ∫ fourierAtom τ ξ dμ(ξ)`;
  this roadmap applies it to `F(τ) = C(−τ) = ⟪X τ, X 0⟫`. Sources that write
  `C(τ) = ∫ exp(iτω) dF(ω)` in angular frequency use the image of `μ` under `ξ ↦ 2πξ`, and their
  densities are those here divided by `2π`.
- Mathlib's Fourier transform is `𝓕h(ξ) = ∫ exp(−2πisξ) h(s) ds`, with no constant in front.
- The periodogram is `periodogram X T ξ = ‖X̂_T(ξ)‖² / T` with
  `X̂_T(ξ) = ∫₀ᵀ exp(−2πiξt) X t dt`; at `T = 0` it is `0`. Every statement about it is a limit as
  `T → ∞`. For random variables with `E = L²(P)` the squared norm is an expectation, so this is
  the expected periodogram of the sources.
- The normalised cardinal sine is `Real.sinc (π x)`, which vanishes at the nonzero integers;
  Mathlib's `Real.sinc x` is `sin x / x`.
- Junk value: `spectralMeasure X` is the zero measure when `τ ↦ C(−τ)` is not continuous and
  positive definite; every theorem below assumes mean-square continuity, which excludes that case.

## Layer 1: the spectral measure and the spectral isometry

### 1.0 Definitions and the representation of the autocovariance

Define `IsSecondOrderStationary`, `autocov` and `spectralMeasure X`, the Tau Ceti measure
`TauCeti.bochnerMeasure` of `τ ↦ autocov X (−τ)`. These are the notions of the conventions above.

**Representation.** Let `X` be second-order stationary and continuous at `0`, and `μ` a finite
measure on `ℝ`. Then `C(τ) = ∫ exp(2πiτξ) dμ(ξ)` holds for every `τ` if and only if
`μ = spectralMeasure X`. In particular the spectral measure exists, represents `C`, and has total
mass `C(0) = ‖X 0‖²` (Lindgren, Theorem 4:3, p. 83, in angular frequency). This is a short
consequence of Tau Ceti's Bochner theorem, used below and not a separate target. Proof: `X` is
continuous everywhere by the identity in the conventions, so `C` is continuous. Put
`F(τ) = C(−τ)`; stationarity gives `F(v_i − v_j) = ⟪X v_i, X v_j⟫`, so for complex
`c_1, …, c_n` and real `v_1, …, v_n`, `∑ c_i conj(c_j) F(v_i − v_j) = ‖∑ conj(c_i) X v_i‖² ≥ 0`
and `F` is positive definite in the sense of `TauCeti.IsPositiveDefiniteSub`. Since
`fourierAtom (−τ) ξ = exp(2πiτξ)`, the representation of `C` by `μ` is the representation
`F(v) = ∫ fourierAtom v ξ dμ` for all `v`. If it holds, `TauCeti.eq_bochnerMeasure` gives
`μ = spectralMeasure X`; conversely `TauCeti.integral_fourierAtom_bochnerMeasure` gives the
representation for the Bochner measure.

**Checks.**

- The tone `X t = exp(2πiνt) z` has `C(τ) = ‖z‖² exp(2πiντ)`, so its spectral measure is
  `‖z‖² δ_ν`. The Bochner measure of `C` itself, without the time reversal, is `‖z‖² δ_(−ν)`: the
  two definitions differ on every tone with `ν ≠ 0`.
- The random-phase cosine `X t = (cos 2πνt, sin 2πνt)` in `ℂ²` is stationary with
  `C(τ) = cos 2πντ`, and its spectral measure is `½ δ_ν + ½ δ_(−ν)`. It has no density, and `C`
  is not integrable. In `L²(P)` the same autocovariance comes from `A cos 2πνt + B sin 2πνt` with
  `A`, `B` centred, uncorrelated and of variance `1`.
- Mean-square continuity is needed. In `ℓ²(ℝ)` the family `X t = δ_t` of orthonormal vectors is
  stationary with `C = 1` at `0` and `0` elsewhere. That `C` is not continuous, so
  `spectralMeasure X = 0`, and the representation fails at `τ = 0`.

*Needs:* Tau Ceti `TauCeti.eq_bochnerMeasure`, `TauCeti.integral_fourierAtom_bochnerMeasure`,
`TauCeti.IsPositiveDefiniteSub`, `TauCeti.fourierAtom_apply`.

### 1.1 The spectral isometry

Let `E` be complete, `X` second-order stationary and continuous at `0`, and `μ = spectralMeasure X`.
There is a linear isometry `U : L²(μ) → E` with `U f = X t` whenever `f` is almost everywhere
equal to `ξ ↦ exp(2πitξ)`, and its range is the closure of the linear span of the values of `X`
(`exists_linearIsometry`). This is the isometry in the proof of Lindgren, Theorem 4:6, p. 91,
proof pp. 91–93.

Route. Write `e_t(ξ) = exp(2πitξ)`. For a finitely supported `a : ℝ → ℂ`, stationarity and 1.0
give `‖∑ a_k X t_k‖² = ∑ conj(a_j) a_k C(t_k − t_j) = ∫ |∑ a_k e_(t_k)|² dμ`, so the linear maps
`a ↦ ∑ a_k X t_k` into `E` and `a ↦ ∑ a_k e_(t_k)` into `L²(μ)` have equal norms. The range of the
second is the span of the `e_t`, and it is dense by `Submodule.topologicalClosure_eq_top_iff`:
if `f ∈ L²(μ)` is orthogonal to every `e_t`, then `∫ exp(−2πitξ) f dμ = 0` for all `t`, and by
conjugation the same holds for `Re f` and `Im f`. For a real `g` among these, `g` is in `L¹(μ)`
because `μ` is finite, and the finite measures `g⁺ μ` and `g⁻ μ` have the same Fourier atom
integrals, so they are equal by `TauCeti.Measure.ext_of_forall_integral_fourierAtom_eq` and
`g = 0` almost everywhere. Since `E` is complete, `LinearMap.extendOfIsometry` gives a linear
isometry `U : L²(μ) → E` with `U e_t = X t`. Its range contains every `X t` and is
complete (`IsUniformInducing.isComplete_range`, `L²(μ)` being complete), hence closed, so it
contains the closed span; conversely it is the image of the closure of a dense span, which lies in
the closure of the image.

**Checks.**

- Completeness is needed. Take `μ` the standard Gaussian law, `E` the linear span of the `e_t` in
  `L²(μ)` (not closed) and `X t = e_t`. An isometry `U` from `L²(μ)` into `E` with `U e_t = e_t`
  agrees with the inclusion on the dense span of the `e_t`, so it is the inclusion; but the
  indicator of `[0, ∞)` is not almost everywhere equal to any finite exponential sum, which is
  continuous, since `μ` charges both sides of `0`. So no such `U` exists.
- For a finite measure `μ`, `X t = e_t` in `L²(μ)` is stationary and continuous with spectral
  measure `μ` (1.0), and `U` is the identity.

*Needs:* 1.0; Tau Ceti `TauCeti.Measure.ext_of_forall_integral_fourierAtom_eq`; Mathlib
`MeasureTheory.L2.inner_def`, `LinearMap.extendOfIsometry`, `IsUniformInducing.isComplete_range`,
`Isometry.isUniformInducing`, `Submodule.topologicalClosure_eq_top_iff`.

### Examples

The tone and cosine of 1.0; `e_t` in `L²(μ)` (1.1); `X t = U_t f` for a continuous unitary group.

### Dependencies

1.0 uses the Tau Ceti Bochner measure; 1.1 uses 1.0.

## Layer 2: periodograms, spectral densities and atoms

### 2.0 The periodogram

Define `periodogram X T ξ`, the square of the norm of `∫₀ᵀ exp(−2πiξt) X t dt` divided by `T`.

A computation used in this layer: for `E` complete, `X` stationary and continuous at `0`, `T > 0`
and `a(η) = ∫₀ᵀ exp(2πi(η − ξ)t) dt`, the integral `integral_inner` and Fubini's theorem on
`[0, T]² × ℝ` (a bounded integrand and a finite measure) give
`‖X̂_T(ξ)‖² = ∫₀ᵀ ∫₀ᵀ exp(2πiξ(s − t)) C(t − s) ds dt = ∫ |a(η)|² dμ(η)`. Since
`|a(η)|² = sin²(πT(η − ξ)) / (π(η − ξ))²` (and `T²` at `η = ξ`),
`periodogram X T ξ = ∫ F_T(η − ξ) dμ(η)` with the Fejér kernel `F_T(x) = sin²(πTx) / (π²Tx²)`.
`F_T` is nonnegative and even, `∫ F_T = 1` (Plancherel's identity for the indicator of `[0, T]`,
since `F_T(x) = T⁻¹ |∫₀ᵀ exp(2πixt) dt|²`), and `∫_(|x| > δ) F_T ≤ 2 / (π²Tδ)`.

**Checks.**

- For the random-phase cosine with `ν = 3/2`, at `ξ = 1/3` and `T = 2` the periodogram is
  `½ F_2(7/6) + ½ F_2(−11/6) = 2295 / (11858 π²)`, computed both from the definition and from the
  Fejér form.

### 2.1 Weak convergence of the periodogram

Let `E` be complete and `X` second-order stationary and continuous at `0`. For every bounded
continuous `g : ℝ → ℝ`, `∫ g(ξ) periodogram X T ξ dξ → ∫ g dμ` as `T → ∞`
(`tendsto_integral_mul_periodogram`). The periodogram densities appear in the proof of Lindgren,
Theorem 4:3, pp. 83–86; the convergence is proved here.

Route. By 2.0 and Tonelli's theorem (`F_T ≥ 0`, `∫∫ F_T(η − ξ) dξ dμ(η) = μ(ℝ)`), the left side is
`∫ g_T dμ` with `g_T(η) = ∫ g(ξ) F_T(η − ξ) dξ`. Then `|g_T| ≤ sup |g|`, and `g_T(η) → g(η)` for
every `η`: given `ε`, choose `δ` with `|g(ξ) − g(η)| < ε` for `|ξ − η| < δ`, so
`|g_T(η) − g(η)| ≤ ε + 2 sup|g| · 2 / (π²Tδ)`. Dominated convergence against the finite measure `μ`
(`MeasureTheory.tendsto_integral_filter_of_dominated_convergence`) concludes.

**Checks.**

- Completeness is needed: in the incomplete space of the first Check of 1.1 every integral in `E`
  is `0`, so the left side is `0`, while `∫ 1 dμ = 1`.

*Needs:* 1.0; 2.0; Mathlib `integral_inner`, `MeasureTheory.integral_prod`,
`MeasureTheory.tendsto_integral_filter_of_dominated_convergence`.

### 2.2 The Wiener–Khinchin theorem for integrable autocovariances

Let `E` be complete, `X` second-order stationary and continuous at `0`, and `C` integrable. Then
`μ` is Lebesgue measure with density `ξ ↦ 𝓕C(ξ)` (real and nonnegative, written as the positive
part of its real part), and `periodogram X T ξ → 𝓕C(ξ)` for every `ξ`
(`spectralMeasure_eq_withDensity_fourier`). The density formula is Lindgren, Theorem 4:4(b), p. 86,
and Hajek, §8.2, p. 268 (the inversion formula before (8.14)); the pointwise convergence of the
periodogram is proved here.

Route. `F(τ) = C(−τ)` is continuous, positive definite (1.0) and integrable. By
`TauCeti.integral_fourierAtom_withDensity_re_fourierInv`, the measure `ν` with density
`(𝓕⁻F)⁺` represents `F`. It is finite: `𝓕F` is integrable
(`TauCeti.integrable_fourier_of_posSemidef`, with `TauCeti.isPositiveDefiniteSub_iff_posSemidef`),
and so is `𝓕⁻F = 𝓕C` (`Real.fourierInv_eq_fourier_comp_neg`, `F` being `C` reversed). So `ν = μ`
by `TauCeti.eq_bochnerMeasure`. For the periodogram, substitute `τ = t − s` in the double integral
of 2.0: the set of `s ∈ [0, T]` with `s + τ ∈ [0, T]` has length `(T − |τ|)⁺`, so
`periodogram X T ξ = ∫ (1 − |τ|/T)⁺ C(τ) exp(−2πiξτ) dτ`. The integrand is dominated by `|C|` and
converges pointwise to `C(τ) exp(−2πiξτ)`, so the limit is `𝓕C(ξ)`.

**Checks.**

- Mean-square continuity is needed. Let `Y` be continuous and stationary with integrable `C_Y`
  and `Y ≠ 0`, and `W t` an orthonormal family indexed by `ℝ` orthogonal to every `Y t`. Then
  `X = Y + W` is stationary, its autocovariance `C_Y + 1_(τ = 0)` is integrable with Fourier
  transform `𝓕C_Y`, but `X` is not continuous, so `spectralMeasure X = 0`, not `𝓕C_Y` Lebesgue.

*Needs:* 1.0; 2.0; Tau Ceti `TauCeti.integral_fourierAtom_withDensity_re_fourierInv`,
`TauCeti.integrable_fourier_of_posSemidef`, `TauCeti.isPositiveDefiniteSub_iff_posSemidef`,
`TauCeti.eq_bochnerMeasure`; Mathlib `Real.fourierInv_eq_fourier_comp_neg`,
`MeasureTheory.tendsto_integral_filter_of_dominated_convergence`.

### 2.3 Atoms and time averages

Let `E` be complete, `X` second-order stationary and continuous at `0`, and `ν` real. The averages
`A_T = T⁻¹ ∫₀ᵀ exp(−2πiνt) X t dt` converge as `T → ∞` to a vector `Z` with `‖Z‖² = μ{ν}`, and
`T⁻¹ ∫₀ᵀ exp(−2πiνt) C(t) dt → μ{ν}` (`tendsto_average_of_atom`). Lindgren, Theorem 4:7, (4.19)
and (4.21), p. 94, states both for a spectral distribution that is a step function; the statement
here holds for every spectral measure, with the route below. For `X t = U_t v` with `U` a strongly
continuous unitary group, the first statement is MathematicalBilliards §12.4.1
(`exists_tendsto_twistedAverage`, whose measure is the image of `μ` under `ξ ↦ 2πξ`, with
the atom `μ{ν}` at `2πν`); here `X` is
any stationary family, given without a group.

Route. Let `k_T(x) = T⁻¹ ∫₀ᵀ exp(2πixt) dt`, so `|k_T| ≤ 1`, `k_T(0) = 1` and
`|k_T(x)| ≤ 1 / (π|x|T)` for `x ≠ 0`; hence `k_T → 1_(x = 0)` pointwise. As in 2.0,
`⟪A_S, A_T⟫ = ∫ conj(k_S(η − ν)) k_T(η − ν) dμ(η)`, so
`‖A_S − A_T‖² = ∫ |k_S − k_T|²(η − ν) dμ(η)`, which tends to `0` as `S, T → ∞` by dominated
convergence. The averages are Cauchy along `atTop` and converge in the complete space `E`, and
`‖Z‖² = lim ∫ |k_T(η − ν)|² dμ(η) = μ{ν}`. Likewise
`T⁻¹ ∫₀ᵀ exp(−2πiνt) C(t) dt = ⟪X 0, A_T⟫ = ∫ k_T(η − ν) dμ(η) → μ{ν}`.

**Checks.**

- For the random-phase cosine with `ν = 3/2`: `Z = (½, −i/2)` and `‖Z‖² = ½ = μ{3/2}`; at the
  frequency `1/2`, `T A_T` stays bounded, so the averages tend to `0`.
- At `ν = 0`: `T⁻¹ ∫₀ᵀ X t dt` converges, with limit `0` exactly when `μ{0} = 0`, that is, when the
  Cesàro means of `C` tend to `0` (compare Lindgren, Theorem 2:18(a), p. 54).
- Mean-square continuity is needed for the second statement: for `X = e^(2πiνt) z + W t` with
  `z ≠ 0` and `W` as in the Check of 2.2, the averages of `exp(−2πiνt) C(t)` tend to `‖z‖²` while
  `spectralMeasure X = 0`.

*Needs:* 1.0; 2.0; Mathlib `integral_inner`,
`MeasureTheory.tendsto_integral_filter_of_dominated_convergence`.

**Wiener's theorem on the atoms.** For `X` second-order stationary and continuous at `0`,
`T⁻¹ ∫₀ᵀ |C(τ)|² dτ → ∑_ξ μ{ξ}²` as `T → ∞`, the sum running over the countably many atoms; in
particular `μ` has no atoms exactly when these Cesàro means tend to `0` (Lindgren, Theorem 4:7,
(4.20), p. 94, for a step function). This is not restated: `C(τ) = MeasureTheory.charFun ρ τ` for the
image `ρ` of `μ` under `ξ ↦ 2πξ`, whose atoms are those of `μ` moved to `2πξ` with the same masses,
so it is MathematicalBilliards §12.4 (`tendsto_average_norm_charFun_sq`) applied to `ρ`. On the random-phase cosine,
`T⁻¹ ∫₀ᵀ cos²(2πντ) dτ → ½ = (½)² + (½)²`.

### Examples

- *Lorentzian spectrum.* If `C(τ) = σ² exp(−α|τ|)` with `α > 0`, then by 2.2 and
  `TauCeti.fourier_exp_neg_mul_abs`, `μ` has density `2ασ² / (α² + 4π²ξ²)`, of total mass `σ²`.
  The angular-frequency formula `2ασ² / (α² + ξ²)` read as a density in `ξ` has mass `2πσ²`.
  Such a family is `e_t` in `L²` of the Lorentzian measure (1.1).

### Dependencies

2.0 uses 1.0; 2.1–2.3 use 1.0 and 2.0.

## Layer 3: linear filters and mean-square derivatives

### 3.1 Linear time-invariant filters

Let `E` be complete, `X` second-order stationary and continuous at `0`, `h : ℝ → ℂ` integrable,
and `Y t = ∫ h(s) X(t − s) ds`. Then `Y` is second-order
stationary and continuous, its spectral measure is `|𝓕h(ξ)|² μ`, and
`⟪X s, Y t⟫ = ∫ 𝓕h(ξ) exp(2πi(t − s)ξ) dμ(ξ)`
(`filter_spectralMeasure`). Lindgren, §4.4.2, pp. 101–105, takes the transfer function as the
definition of a filter and derives the impulse-response form; Hajek, §8.1, (8.10), p. 266, and
§8.2, p. 268, gives the covariance and density relations for densities.

Route. `‖X t‖ = ‖X 0‖` and `X` is continuous (1.0), so
`s ↦ h(s) X(t − s)` is integrable. By `integral_inner` twice and Fubini on `ℝ² × ℝ` (integrand
bounded by `|h(u)| |h(v)|`),
`⟪Y s, Y t⟫ = ∫∫ conj(h(u)) h(v) C(t − s + u − v) du dv = ∫ exp(2πi(t − s)ξ) |𝓕h(ξ)|² dμ(ξ)`,
using `∫ h(v) exp(−2πivξ) dv = 𝓕h(ξ)`. So `Y` is stationary, and
`‖Y(t + δ) − Y t‖ ≤ ‖h‖₁ ‖X δ − X 0‖` gives continuity. The measure `|𝓕h|² μ` is finite
(`|𝓕h| ≤ ‖h‖₁`) and represents `C_Y` (`integral_withDensity_eq_integral_smul`, `𝓕h` being
continuous), so it is `spectralMeasure Y` by 1.0. The cross term is the same computation with one
integral.

**Checks.**

- The moving average `h = 1_[0,1]` has `|𝓕h(ξ)|² = Real.sinc(πξ)²`, which is `4/π²` at `ξ = ½`; on
  the tone `exp(2πiνt) z` the output is `𝓕h(ν) exp(2πiνt) z`.

*Needs:* 1.0; Mathlib `integral_inner`, `MeasureTheory.integral_prod`,
`integral_withDensity_eq_integral_smul`, `Real.fourier_eq'`.

### 3.2 Mean-square differentiability

Let `E` be complete and `X` second-order stationary and continuous at `0`. Then `X` has a
derivative at every `t` (in norm) if and only if `∫ ξ² dμ(ξ) < ∞` (`exists_hasDerivAt_iff`).
Lindgren states this in §2.1, p. 28, with the proof in Lemma 2.3 and Theorem 2:12, pp. 46–47, for
real processes.

Route. If `X` is differentiable at `0`, the quotients `(X h − X 0)/h` are bounded as `h → 0`. By
1.0, `‖X h − X 0‖² = ∫ 4 sin²(πhξ) dμ(ξ)`, and `4 sin²(πhξ)/h² → (2πξ)²`, so Fatou's lemma
(`MeasureTheory.lintegral_liminf_le`) gives `∫ (2πξ)² dμ ≤ ‖X'(0)‖² < ∞`. Conversely, fix `t`
and let `q_h(ξ) = e_t(ξ) (exp(2πihξ) − 1)/h`. By 1.0, the difference quotients `D_h` of `X` at `t`
satisfy `‖D_h − D_k‖² = ∫ |q_h − q_k|² dμ`; since `|q_h| ≤ 2π|ξ|` and `q_h → 2πiξ e_t`, dominated
convergence with the bound `16π²ξ²` makes `D_h` Cauchy as `h → 0`, and its limit in the complete
space `E` is the derivative (`hasDerivAt_iff_tendsto_slope`).

**Checks.**

- The Lorentzian family of Layer 2 has `∫ ξ² dμ = ∞`, so it is not differentiable.
- The autocovariance `exp(−πτ²)` has spectral density `exp(−πξ²)`, and
  `4π² ∫ ξ² exp(−πξ²) dξ = 2π = −C''(0)`.
- Completeness is needed: with `μ` Gaussian, `E` the span of the `e_t` and `X t = e_t`, the second
  moment is finite but `ξ ↦ ξ e_t(ξ)` is no finite exponential sum, so `X` has no derivative in `E`.

*Needs:* 1.0; Mathlib `MeasureTheory.lintegral_liminf_le`, `hasDerivAt_iff_tendsto_slope`,
`MeasureTheory.tendsto_integral_filter_of_dominated_convergence`.

### 3.3 The derivative process

Let `X` be second-order stationary with a derivative `X' t` at every `t`. Then `X'` is
second-order stationary and continuous, its spectral measure is `(2πξ)² μ`, and
`⟪X s, X' t⟫ = ∫ 2πiξ exp(2πi(t − s)ξ) dμ(ξ)` (`spectralMeasure_deriv`). Completeness is not
assumed. Lindgren, Example 4:6, p. 103, gives the transfer function `iω` and the density.

Route. Differentiability gives continuity, and the Fatou argument of 3.2 (which uses only 1.0)
gives `∫ ξ² dμ < ∞`. With `q_h` as in 3.2, `⟪X' s, X' t⟫ = lim ⟪D_h(s), D_h(t)⟫ =
lim ∫ conj(q_h^s) q_h^t dμ = ∫ (2πξ)² exp(2πi(t − s)ξ) dμ` by dominated convergence, so `X'` is
stationary with that autocovariance. Its continuity follows from
`‖X'(t + δ) − X' t‖² = ∫ (2πξ)² |exp(2πiδξ) − 1|² dμ → 0`, and 1.0 identifies its spectral measure
with the finite measure `(2πξ)² μ`. The cross term is `lim ⟪X s, D_h(t)⟫`.

*Needs:* 1.0; Mathlib `MeasureTheory.lintegral_liminf_le`,
`MeasureTheory.tendsto_integral_filter_of_dominated_convergence`.

### Examples

Filtering the random-phase cosine (`ν = 3/2`) by `h = 1_[0,1]` multiplies both atoms by
`Real.sinc(3π/2)² = 4/(9π²)`.

### Dependencies

3.1, 3.2 and 3.3 use 1.0.

## Layer 4: band-limited processes

### 4.1 The sampling theorem

Let `X` be second-order stationary and continuous at `0`, `W > 0`, and suppose `μ` is carried by
the open band: `μ((−W, W)ᶜ) = 0`. Then for all real `α` and `t`,
`∑_(|k| ≤ N) Real.sinc(π(2W(t − α) − k)) X(α + k/(2W)) → X t` in norm as `N → ∞`
(`tendsto_sum_sinc`). This is Lindgren, Theorem 4:12, p. 119, in angular frequency with sample
spacing `π/ω₀`, in the mean-square form that its proof gives; completeness is not needed.

Route. Put `x = 2W(t − α)` and `θ = ξ/W`. By 1.0, `‖X t − S_N‖²` is the integral against `μ` of
`|exp(2πitξ) − ∑_(|k| ≤ N) c_k exp(2πi(α + k/(2W))ξ)|²` with `c_k = Real.sinc(π(x − k))`, and
since `μ` lives on `(−W, W)` and `|exp(2πiαξ)| = 1`, it is `∫ |φ(θ) − S_N φ(θ)|² dμ`, where
`φ(θ) = exp(iπxθ)` on `(−1, 1)`, `S_N` is the symmetric partial sum of its Fourier series on the
circle of length `2`, and `c_k = ½ ∫₋₁¹ φ(θ) exp(−iπkθ) dθ` (direct integration). It suffices that
`S_N φ → φ` pointwise on `(−1, 1)` with a bound uniform in `N` and `θ`: dominated convergence
against the finite measure `μ` then concludes. Write `φ = ψ + i sin(πx) σ` with `σ(θ) = θ`. Then
`ψ(1) = ψ(−1) = cos(πx)`, so `ψ` is continuous on the circle (`AddCircle.liftIoc_continuous`,
`fourierCoeff_liftIoc_eq`) and `C¹` on `[−1, 1]`; integration by parts
(`fourierCoeffOn_of_hasDerivAt`) gives its coefficients as those of `ψ'` divided by `iπk`,
which are summable by Parseval (`hasSum_sq_fourierCoeffOn`) and Cauchy–Schwarz, so its Fourier
series converges uniformly (`hasSum_fourier_series_of_summable`). The partial sums of `σ` are
`(2/π) s_N(πθ + π)` with `s_N(u) = −∑_(k ≤ N) sin(ku)/k`. Abel summation, with
`|∑_(a ≤ k ≤ b) sin(ku)| ≤ 1/sin(u/2)` and `sin(u/2) ≥ u/π` on `(0, π]`, bounds
`|∑_(k ≤ N) sin(ku)/k|` by `1 + 2π` for all `N` and `u` (split the sum at `k ≈ 1/u`; oddness and
`2π`-periodicity give the other `u`). For pointwise convergence, integrating the alternating
Dirichlet kernel gives, for `|u| < π`,
`∑_(k ≤ N) (−1)^(k+1) sin(ku)/k = u/2 + (−1)^(N+1) ∫₀ᵘ cos((N + ½)s) / (2 cos(s/2)) ds`, and the
integral tends to `0` by the Riemann–Lebesgue lemma (`Real.zero_at_infty_fourier`), the function
`1_[0,u](s) / cos(s/2)` being integrable; at `u = πθ` the partial sums of `σ` tend to `θ`.

**Checks.**

- Mass on the edge of the band breaks it. For `X t = exp(2πiWt) z` (so `μ = ‖z‖² δ_W`) the
  samples are `X(k/2W) = (−1)^k z`; at `t = 1/(4W)` the partial sums are `2/((2N + 1)π) · z`,
  which tend to `0`, while `X t = i z`.

*Needs:* 1.0; Mathlib `Real.sinc`, `AddCircle.liftIoc_continuous`, `fourierCoeff_liftIoc_eq`,
`fourierCoeffOn_of_hasDerivAt`, `hasSum_sq_fourierCoeffOn`, `hasSum_fourier_series_of_summable`, `Real.zero_at_infty_fourier`,
`MeasureTheory.tendsto_integral_filter_of_dominated_convergence`. The bound and the pointwise limit
of the sawtooth series are proved here.

### Examples

The family `e_t` in `L²` of the density `1_(−W,W)`, with `C(τ) = 2W Real.sinc(2πWτ)`.

### Dependencies

4.1 uses 1.0.

## Scope and ownership

This roadmap owns the definitions `IsSecondOrderStationary` (for time `ℝ`), `autocov`,
`spectralMeasure` and `periodogram` with the representation of the autocovariance (1.0), and the
theorems of Layers 1–4: the spectral isometry (1.1), weak convergence of the periodogram (2.1), the
Wiener–Khinchin theorem with pointwise periodogram convergence (2.2), atoms and time averages
(2.3), linear filters (3.1), mean-square differentiability and the
derivative process (3.2, 3.3), and the sampling theorem for band-limited processes (4.1).

Already in the library or stated elsewhere, and not restated:

- Bochner's theorem, the Bochner measure, its uniqueness and its integrable case are Tau Ceti's
  (`TauCeti/Analysis/Bochner/`, realising Completed/OneParameterSemigroups, Part C).
- MathematicalStatisticsFoundations, §9.6, owns second-order stationarity of families indexed by
  `ℤ` and the positive semidefiniteness of their autocovariance matrices; the definition here is
  the same condition indexed by `ℝ`.
- ClassicalErgodicTheory, §2.1, owns spectral measures of isometries and of strongly continuous
  unitary representations, with `spectralMeasureReal U f` representing `⟪f, U_t f⟫` as
  `∫ exp(2πitξ)`; for `X t = U_t f`, 1.0 identifies `spectralMeasure X` with that measure. Its §2.2
  owns Wiener's lemma for measures on the circle.
- MathematicalBilliards, §12.4, owns Wiener's lemma for finite measures on `ℝ`
  (`tendsto_average_norm_charFun_sq`), which gives Wiener's theorem on the atoms of `μ` after the
  substitution `ξ ↦ 2πξ` (Layer 2); its §12.4.1 owns the convergence of twisted averages of a
  strongly continuous unitary group and their atomic mass (`exists_tendsto_twistedAverage`), the
  group case of the first statement of 2.3.
- SamplingAndDiscreteFourierAnalysis, Layer 6, owns the sampling theorem for band-limited
  functions; 4.1 is a statement about processes and its route does not use it.

Not treated here: discrete-time series and their prediction, the orthogonal random measure `Z` and
integrals `∫ g dZ` (1.1 replaces them), white noise as a generalised process, strict stationarity,
Gaussian processes, sample paths, spectral estimation from one path, vector processes, shot noise.

## Exact supplier contracts

### From Mathlib

- `integral_inner` and `MeasureTheory.L2.inner_def` (`Mathlib/MeasureTheory/Function/L2Space.lean`):
  `∫ ⟪c, f x⟫ = ⟪c, ∫ f x⟫` for integrable `f`; `⟪f, g⟫ = ∫ ⟪f a, g a⟫ dμ` in `L²(μ)`.
- `MeasureTheory.integral_prod` (`Mathlib/MeasureTheory/Integral/Prod.lean`): Fubini for an
  integrable function on a product of σ-finite measures.
- `MeasureTheory.tendsto_integral_filter_of_dominated_convergence`
  (`Mathlib/MeasureTheory/Integral/DominatedConvergence.lean`): dominated convergence along a
  countably generated filter, with an integrable bound and a.e. measurable integrands.
- `MeasureTheory.lintegral_liminf_le` (`Mathlib/MeasureTheory/Integral/Lebesgue/Add.lean`): Fatou's
  lemma for measurable functions to `[0, ∞]` along a countably generated filter.
- `integral_withDensity_eq_integral_smul`
  (`Mathlib/MeasureTheory/Integral/Bochner/ContinuousLinearMap.lean`): for a measurable density `f`
  with values in `ℝ≥0`, `∫ g d(f μ) = ∫ f • g dμ`.
- `LinearMap.extendOfIsometry` (`Mathlib/Analysis/Normed/Operator/Extend.lean`): a linear map
  `f` into a complete space with `‖f x‖ = ‖e x‖` for a linear map `e` of dense range extends to a
  linear isometry on the target of `e` (`LinearMap.extendOfIsometry_eq`: it agrees with `f` on `e`).
- `Submodule.topologicalClosure_eq_top_iff`
  (`Mathlib/Analysis/InnerProductSpace/Projection/Submodule.lean`): in a Hilbert space a subspace
  is dense exactly when its orthogonal complement is `0`.
- `Isometry.isUniformInducing` (`Mathlib/Topology/MetricSpace/Isometry.lean`) and
  `IsUniformInducing.isComplete_range` (`Mathlib/Topology/UniformSpace/UniformEmbedding.lean`):
  the range of an isometry from a complete space is complete.
- `hasDerivAt_iff_tendsto_slope` (`Mathlib/Analysis/Calculus/Deriv/Slope.lean`).
- `Real.fourier_eq'` and `Real.fourierInv_eq_fourier_comp_neg`
  (`Mathlib/Analysis/Fourier/FourierTransform.lean`): the integral form of `𝓕` and
  `𝓕⁻ f = 𝓕 (f ∘ neg)`.
- `Real.sinc` (`Mathlib/Analysis/SpecialFunctions/Trigonometric/Sinc.lean`): `sin x / x`.
- `AddCircle.liftIoc_continuous` (`Mathlib/Topology/Instances/AddCircle/Defs.lean`) and
  `fourierCoeff_liftIoc_eq`: a continuous function with equal endpoint values lifts to a continuous
  function on the circle, with the same Fourier coefficients as on the interval.
- `fourierCoeffOn_of_hasDerivAt`, `hasSum_sq_fourierCoeffOn` and
  `hasSum_fourier_series_of_summable` (`Mathlib/Analysis/Fourier/AddCircle.lean`): Fourier
  coefficients on an interval after integration by parts, Parseval's identity on an interval, and
  uniform convergence of a Fourier series with summable coefficients.
- `Real.zero_at_infty_fourier` (`Mathlib/Analysis/Fourier/RiemannLebesgueLemma.lean`): the
  Riemann–Lebesgue lemma on `ℝ`.
- `MeasureTheory.charFun` (`Mathlib/MeasureTheory/Measure/CharacteristicFunction/Basic.lean`):
  `charFun ρ t = ∫ exp(itx) dρ(x)` on `ℝ`; used to read MathematicalBilliards §12.4.

### From Tau Ceti

- `TauCeti.bochnerMeasure` (`TauCeti/Analysis/Bochner/BochnerTheorem.lean`): the finite measure
  representing a continuous positive-definite `F` on a finite-dimensional real inner product
  space as `F v = ∫ fourierAtom v q dμ`, and `0` otherwise; finite by the instance
  `TauCeti.isFiniteMeasure_bochnerMeasure`.
- `TauCeti.eq_bochnerMeasure` and `TauCeti.integral_fourierAtom_bochnerMeasure` (same file): every
  finite measure representing `F` is its Bochner measure; for continuous positive-definite `F` the
  Bochner measure represents `F`.
- `TauCeti.integral_fourierAtom_withDensity_re_fourierInv` (same file): for `F` continuous,
  integrable, with positive semidefinite kernel `F(a − b)`, the measure with density
  `ofReal (𝓕⁻F).re` represents `F`.
- `TauCeti.integrable_fourier_of_posSemidef` (`TauCeti/Analysis/Bochner/Fourier/Nonneg.lean`):
  under the same hypotheses `𝓕F` is integrable.
- `TauCeti.isPositiveDefiniteSub_iff_posSemidef` (`TauCeti/Analysis/PositiveDefinite/AddGroup.lean`)
  and `TauCeti.IsPositiveDefiniteSub` (same file): the positive-definiteness predicate and its
  kernel form.
- `TauCeti.fourierAtom` and `TauCeti.fourierAtom_apply`
  (`TauCeti/Analysis/PositiveDefinite/FourierAtom.lean`): `fourierAtom q v = exp(−2πi⟪v, q⟫)`.
- `TauCeti.Measure.ext_of_forall_integral_fourierAtom_eq`
  (`TauCeti/Analysis/Bochner/Fourier/Convention.lean`): two finite measures with the same Fourier
  atom integrals are equal.
- `TauCeti.fourier_exp_neg_mul_abs` (`TauCeti/Analysis/Fourier/ExpNegAbs.lean`): for `a > 0`,
  `𝓕(exp(−a|x|))(ξ) = 2a / (a² + (2πξ)²)`; used in the Examples of Layer 2.

`Suggested.lean` imports `TauCeti.Analysis.Bochner.BochnerTheorem` only.

## References

- G. Lindgren, *Lectures on Stationary Stochastic Processes: a course for PhD students in
  mathematical statistics and other fields*, lecture notes, Centre for Mathematical Sciences,
  Lund University, October 2006; author's page,
  https://www.maths.lth.se/matstat/staff/georg/Publications/lecture2006.pdf. Page numbers are
  those printed in the notes.
- B. Hajek, *Random Processes for Engineers*, Cambridge University Press, 2015; author's
  preproduction copy, https://hajek.ece.illinois.edu/Papers/randomprocJuly14.pdf. Page numbers
  are those printed in that copy.
