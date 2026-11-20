# Roadmap: stochastic approximation with averaging

**Summary.** Stochastic approximation seeks a zero `x⋆` of a vector field `R` on `ℝᵈ` that is
observed only with noise, through the random vectors `x (t + 1) = x t − γ t (R (x t) + ξ t)` with
steps `γ t > 0` and noise `ξ t`. How the iterate itself behaves depends on how the steps are tuned
to the Jacobian `A` of `R` at `x⋆`. Polyak and Juditsky, and independently Ruppert, found that the
plain average `x̄ t` of the iterates, with steps decreasing more slowly than `1/t`, is
asymptotically normal at rate `√t` with covariance `A⁻¹ S A⁻ᵀ`, where `S` is the noise
covariance, and that no matrix gain does better. This roadmap builds that theorem. Throughout,
`A` is positively stable (every complex eigenvalue has positive real part); no procedure or
running time is a target.

The headline theorems are these.

- *The gain lemma.* For admissible steps (a constant step `η` with `|1 − η μ| < 1` for every
  eigenvalue `μ` of `A`, or positive steps `γ t → 0` with `(γ t − γ (t + 1)) / γ t = o(γ t)`,
  such as `(t + 1)^(−α)` with `0 < α < 1`), the matrices through which each noise term enters
  the averaged error are uniformly bounded and tend to `A⁻¹` in Cesàro mean.
- *Asymptotic linearity.* If the start is measurable, the noise is a martingale difference
  sequence with bounded second moments, and `t^(−1/2) Σ_{i < t} ‖R (x i) − A (x i − x⋆)‖ → 0`
  in probability, then `√t (x̄ t − x⋆) + A⁻¹ t^(−1/2) Σ_{i < t} ξ i → 0` in probability.
- *The Polyak–Ruppert central limit theorem.* If moreover the noise is i.i.d., centred and
  square-integrable with covariance matrix `S`, the start is deterministic and `R` is
  measurable, then `√t (x̄ t − x⋆)` converges in law to `N(0, A⁻¹ S A⁻ᵀ)`. For linear `R` the
  hypothesis on `R` holds trivially.
- *Optimality of the averaged covariance.* If `Γ A − ½` is positively stable and `V` solves
  `(Γ A − ½) V + V (Γ A − ½)ᵀ = Γ S Γᵀ` with `S` positive semidefinite, then `V − A⁻¹ S A⁻ᵀ` is
  positive semidefinite, and for positive definite `S` it vanishes exactly when `Γ = A⁻¹`. For
  linear `R`, `V` is the limit of `t` times the covariance of the iterate run with the matrix
  steps `Γ / (t + 1)`, so no such gain beats averaging.

The roadmap builds on Mathlib's convergence in distribution, Slutsky's theorem and Gaussian
laws, Tau Ceti's covariance matrices, the multivariate central limit theorem of
MathematicalStatisticsAsymptotic and the Lyapunov equation of LinearSystemsAndControl. The central
limit theorem for general martingale-difference noise would also need a martingale central limit
theorem, which neither library nor any roadmap on main provides; it is not stated here. Layers 1
to 4 prove the four theorems in turn; Layer 4 uses only the definitions of Layer 1.

## Conventions

- **Vectors and matrices.** `E = EuclideanSpace ℝ (Fin d)`; matrices are
  `Matrix (Fin d) (Fin d) ℝ` and act on `E` through `Matrix.toEuclideanLin`. Matrix norms are
  the `L²` operator norms (`Matrix.Norms.L2Operator`); any other norm gives the same statements.
  `A⁻¹` is Mathlib's matrix inverse, which is `0` for a singular matrix; every statement here
  that uses `A⁻¹` has `A` invertible, because `0` is not an eigenvalue of a positively stable
  matrix.
- **Eigenvalues.** The eigenvalues of a real matrix `A` are the elements of
  `spectrum ℂ (A.map (algebraMap ℝ ℂ))`, the complex spectrum. For `d = 0` it is empty, and every
  statement below holds trivially.
- **The recursion.** On a probability space `(Ω, P)`, `x t, ξ t : Ω → E` satisfy
  `x (t + 1) ω = x t ω − γ t • (R (x t ω) + ξ t ω)` for every `t` and `ω`, with a deterministic
  schedule `γ : ℕ → ℝ`. The averaged iterate is `x̄ t = t⁻¹ • Σ_{i < t} x (i + 1)`; the start
  `x 0` is not averaged, and `x̄ 0 = 0`. Shifting the average by one index changes `√t x̄ t` by
  `(x 0 − x t)/√t` and does not affect any limit below when `x t / √t → 0` in probability.
- **Martingale differences.** `ℱ : Filtration ℕ m₀`; `ξ t` is `ℱ (t + 1)`-measurable, square
  integrable, and `P[ξ t | ℱ t] = 0` almost surely. Conditional expectation is Mathlib's
  `condExp`, which is `0` on non-integrable functions; the square-integrability hypotheses make it
  meaningful.
- **Laws.** Convergence in probability is Mathlib's `TendstoInMeasure` and convergence in law is
  `TendstoInDistribution`. The covariance matrix of a law on `E` is Tau Ceti's
  `TauCeti.covMatrix`, and `N(m, S)` is Mathlib's `multivariateGaussian m S`.
- **Stability names.** Positively stable means that every eigenvalue has positive real part. In
  control theory a matrix is Hurwitz when every eigenvalue has negative real part, so `A` is
  positively stable exactly when `−A` is Hurwitz in the sense of LinearSystemsAndControl 5.1;
  some stochastic-approximation papers call positively stable matrices Hurwitz.

## Layer 1: step sizes and the gain matrices

### 1.1 Positive stability and admissible step sizes

Define `IsPositivelyStable A`: every `μ` in the complex spectrum of `A` has `0 < μ.re`.
`IsPositivelyStable A` holds exactly when `−A` satisfies LinearSystemsAndControl's `IsHurwitz`
(5.1), since the complex spectrum of `−A` is the negative of that of `A`; the definition is kept
here because a roadmap's Lean file does not import another roadmap. Define
`IsAdmissibleStepSize A γ` as the disjunction of two regimes:

- *constant step:* `γ t = η` for all `t`, with `η > 0` and `‖1 − η μ‖ < 1` for every `μ` in the
  complex spectrum of `A`; for `η > 0` this is `η < 2 Re (1/μ)` for every `μ`, since
  `|1 − η μ|² = 1 − 2η Re μ + η² |μ|²`;
- *decreasing steps:* `γ t > 0` for all `t`, `γ t → 0`, and
  `(γ t − γ (t + 1)) / γ t = o(γ t)` as `t → ∞`.

The decreasing regime is the step condition of Polyak and Juditsky, display (42) in Cutler, Díaz
and Drusvyatskiy, Assumption B.2 (i). Their constant regime, display (41), asks only
`0 < η < 2 / min_j Re μ_j`; that is weaker than the condition here and does not suffice (Check
below). The constant regime here asks exactly that the spectral radius of `1 − η A` be below `1`, that is,
that `1 − η A` be Schur stable in the sense of LinearSystemsAndControl 5.1 (`IsSchurStable`): the
eigenvalues of `1 − η A` are the `1 − η μ`.

API, proved here:

- In the decreasing regime `γ (t + 1) / γ t → 1` and `t γ t → ∞`: indeed
  `1/γ (t + 1) − 1/γ t = ((γ t − γ (t + 1))/γ t) / γ (t + 1) = o(1)`, so `1/γ t = o(t)` by
  Cesàro. Hence `Σ γ t = ∞`.
- `γ t = c (t + 1)^(−α)` with `c > 0` is admissible in the decreasing regime exactly when
  `0 < α < 1`: the ratio `(γ t − γ (t + 1))/γ t = 1 − ((t + 1)/(t + 2))^α` is asymptotic to
  `α/(t + 2)`, which is `o((t + 1)^(−α))` exactly when `α < 1`.

**Checks.**

- `IsPositivelyStable A` if and only if `IsHurwitz (−A)`: for `A = [[1, 4], [−4, 1]]`, `−A` has
  eigenvalues `−1 ∓ 4i`, with real part `−1 < 0`; for `A = diag(1, −1)`, neither holds.
- `A = [[1, 4], [−4, 1]]` has eigenvalues `1 ± 4i` and is positively stable. The constant
  threshold is `2 Re (1/(1 + 4i)) = 2/17 ≈ 0.1176`: `η = 0.1` is admissible and `η = 0.12` is
  not, since `|1 − 0.12 (1 + 4i)|² = 0.7744 + 0.2304 = 1.0048`. Numerically, for `η = 0.12` the
  gain matrices of 1.2 grow without bound in `t`, while for `η = 0.1` they stay below `0.46` in
  norm.
- The rotation generator `[[0, 1], [−1, 0]]` has eigenvalues `±i` and is not positively stable,
  and no constant step is admissible for it, since `|1 ∓ η i| > 1` for every `η > 0`. Its real
  spectrum is empty, so a definition through real eigenvalues only would call it stable.
- `γ t = c/(t + 1)` fails the decreasing condition for every `c > 0`: the ratio divided by
  `γ t` is `(t + 1)/(c (t + 2))`, which tends to `1/c`, not to `0`.
- Display (41) of Cutler, Díaz and Drusvyatskiy is not enough: `A = diag(1, 10)` and `η = 1`
  satisfy `η < 2 / min_j Re μ_j = 2`, but `1 − 10 η = −9`, so the second diagonal entry of the gain
  matrices of 1.2 is `(1 − (−9)^(t − i))/10`, unbounded, and the noiseless linear iteration
  diverges. The same holds for `A = [[1, 4], [−4, 1]]` and `η = 0.12` above. A constant schedule satisfies `(γ t − γ (t + 1))/γ t = 0 = o(γ t)`
  but not `γ t → 0`, which is why the decreasing regime asks for both.

*Needs:* Mathlib `spectrum`, `Matrix.map`, `Asymptotics.IsLittleO`; LinearSystemsAndControl 5.1
(`IsHurwitz`, `IsSchurStable`) for the comparisons only.

### 1.2 The gain lemma

Define `stepProduct A γ i m = (1 − γ (i + m − 1) • A) ⋯ (1 − γ i • A)`, the product of the `m`
step matrices from index `i` on, later factors on the left (`stepProduct A γ i 0 = 1`); the gain
matrices `gainMatrix A γ t i = γ i • Σ_{m < t − i} stepProduct A γ (i + 1) m` (written
`B^t_i`; it is `0` when `t ≤ i`); and `initialGain A γ t = Σ_{m < t} stepProduct A γ 0 (m + 1)`
(written `B_t`). Unrolling the recursion gives, for every `t ≥ 1`,

    t (x̄ t − x⋆) = B_t (x 0 − x⋆) − Σ_{i < t} B^t_i (ξ i + R (x i) − A (x i − x⋆)),

so `B^t_i` is the matrix through which the noise `ξ i` enters `t` times the averaged error.

Prove `gainMatrix_bounded_and_cesaro_tendsto`: if `IsPositivelyStable A` and
`IsAdmissibleStepSize A γ`, then `‖B^t_i‖ ≤ C` for all `t`, `i`, `‖B_t‖ ≤ C'` for all `t`, and
`t⁻¹ Σ_{i < t} ‖B^t_i − A⁻¹‖ → 0`. (Polyak and Juditsky 1992, Lemma 1, as quoted in Cutler, Díaz
and Drusvyatskiy, proof of Theorem B.1, display (47) and the sentence before it, for the decreasing
regime; Duchi and Ruan, Lemma 20.3, for matrices whose symmetric part is positive definite and
`γ t ∝ t^(−β)` with `1/2 < β < 1`. The constant regime under the condition of 1.1 is elementary
and proved here by the route below.)

Route. Write `Φ(j, i) = (1 − γ (j − 1) A) ⋯ (1 − γ (i + 1) A)` for `j > i` (`Φ(i + 1, i) = 1`).
Summing `Φ(j + 1, i) − Φ(j, i) = −γ j A Φ(j, i)` over `i < j ≤ t` gives the identity

    B^t_i − A⁻¹ = −A⁻¹ Φ(t + 1, i) + Σ_{i < j ≤ t} (γ i − γ j) Φ(j, i).

In the constant regime the sum vanishes and `Φ(t + 1, i) = M^(t − i)` with `M = 1 − η A`, whose
complex spectrum `{1 − η μ}` lies in the open unit disc; the Gelfand formula gives
`‖M^m‖ ≤ K ρ^m` with `ρ < 1`, and all three claims follow with `t⁻¹ Σ_{i < t} ‖B^t_i − A⁻¹‖ ≤ C/t`.
In the decreasing regime, `−A` is Hurwitz, so LinearSystemsAndControl 5.2 gives a positive
definite `P` with `Aᵀ P + P A` positive definite; in the norm `‖v‖_P = √(vᵀ P v)` one has
`‖1 − γ A‖_P ≤ 1 − λ γ` for some `λ > 0` and all small `γ > 0`, hence
`‖Φ(j, i)‖ ≤ K exp(−λ Σ_{i < k < j} γ k)` for all `j > i`, the finitely many early factors being
absorbed in `K`. With `t γ t → ∞` (1.1) this bounds `B_t` and the first term; the step condition
makes `|γ i − γ j| ≤ ε Σ_{i ≤ k < j} (γ k)²` once `i` is large, which bounds the sum uniformly
and makes its Cesàro mean small.

**Checks.**

- `d = 1`, `A = a > 0`, constant `η` with `0 < η a < 2`: `B^t_i = (1 − (1 − η a)^(t − i))/a`, so
  `|B^t_i − 1/a| = |1 − η a|^(t − i)/a` and the Cesàro mean is at most
  `|1 − η a| / (a t (1 − |1 − η a|))`.
- `d = 1`, `a = 1`, `γ t = (t + 1)^(−α)`: computed Cesàro means of `|B^t_i − 1|` at
  `t = 10³, 10⁴, 10⁵` are `0.0137, 0.0030, 0.0006` for `α = 0.3` and `0.109, 0.047, 0.019` for
  `α = 0.6`. For `γ t = 2/(t + 1)` they stay at `0.5` (the gains approach `2 (1 − i/t)`, not `1`).
- The bound on the gains is not small: for `A = [[1, 4], [−4, 1]]` and `γ t = (t + 1)^(−0.3)`
  the early steps expand (`|1 − γ μ| > 1` while `γ > 2/17`), and the largest gain norm `max_i ‖B^t_i‖` is
  computed as `4.5·10³⁵, 9.0·10⁴⁰, 9.1·10³⁸, 3.0·10²⁶` at `t = 500, 1000, 2000, 4000`. The lemma
  claims a finite bound, not a small one.

*Needs:* 1.1; LinearSystemsAndControl 5.2 (`isHurwitz_iff_exists_posDef`); Mathlib
`spectrum.pow_nnnorm_pow_one_div_tendsto_nhds_spectralRadius`, `Matrix.Norms.L2Operator`.

### Examples

The scalar recursion `x (t + 1) = x t − γ t (a (x t − x⋆) + ξ t)` with `γ t = (t + 1)^(−α)`, and
the rotation-dominated matrix `[[1, 4], [−4, 1]]` with constant and decreasing steps.

### Dependencies

Layer 1 uses LinearSystemsAndControl 5.1 (for the comparisons in 1.1) and 5.2 and Mathlib's
spectrum, Gelfand formula and matrix norms.

## Layer 2: the asymptotic linear representation

### 2.1 Asymptotic linearity of the averaged iterate

Define `averagedIterate x t ω = t⁻¹ • Σ_{i < t} x (i + 1) ω` (written `x̄ t`). Prove
`tendstoInMeasure_sqrt_smul_averagedIterate_sub_add`: let `IsPositivelyStable A`,
`IsAdmissibleStepSize A γ`, `R : E → E`, `x⋆ : E`, and let `x`, `ξ` satisfy the recursion of the
Conventions, with `x 0` almost everywhere strongly measurable and `ξ` a martingale difference sequence for `ℱ` (each `ξ t` is
`ℱ (t + 1)`-measurable, square-integrable, with `P[ξ t | ℱ t] = 0` almost surely) and
`sup_t ∫ ‖ξ t‖² dP < ∞`. If

    t^(−1/2) Σ_{i < t} ‖R (x i) − A (x i − x⋆)‖ → 0 in probability,

then

    √t (x̄ t − x⋆) + A⁻¹ t^(−1/2) Σ_{i < t} ξ i → 0 in probability.

Measurability of `x 0` cannot be dropped (Check below); no measurability of `R` or of the later
`x t` is needed, since the last term of the route is dominated pointwise. (Cutler, Díaz and Drusvyatskiy, Theorem B.1, first display,
under Assumptions B.1 (i) and B.2, display (43) being the hypothesis above, with their residual `ζ t` equal to `0`; their Assumptions B.1
(ii) and (iii) are used only for the second display. Polyak and Juditsky 1992, Theorem 2, has the
same representation under a local expansion of `R` and a Lyapunov function, from which the
hypothesis above follows.)

Route. By the identity of 1.2,
`√t (x̄ t − x⋆) + A⁻¹ t^(−1/2) Σ ξ i` is the sum of `t^(−1/2) B_t (x 0 − x⋆)`, which is
a.e. strongly measurable and tends to `0` pointwise since `B_t` is bounded, hence in probability; of `−t^(−1/2) Σ_{i < t} (B^t_i − A⁻¹) ξ i`, whose second
moment is `t⁻¹ Σ_{i < t} ∫ ‖(B^t_i − A⁻¹) ξ i‖² dP ≤ C t⁻¹ Σ_{i < t} ‖B^t_i − A⁻¹‖ → 0`, because
the cross terms vanish (for `i < j`, `ξ i` is `ℱ j`-measurable, so conditioning on `ℱ j` pulls the
inner product through `P[ξ j | ℱ j] = 0`) and the gains are bounded; and of
`−t^(−1/2) Σ_{i < t} B^t_i (R (x i) − A (x i − x⋆))`, bounded by `C` times the quantity of the
hypothesis. Convergence in `L²` gives convergence in probability.

**Checks.**

- The bound on second moments is needed: for `d = 1`, `a = 1`, `η = 1/2`, `x 0 = x⋆` and independent
  `ξ i ~ N(0, i + 1)` (a martingale difference sequence with `∫ ξ i² = i + 1`), the middle term
  is a centred Gaussian with variance `t⁻¹ Σ_{i < t} 4^(−(t − i)) (i + 1)`, which tends to `1/3`
  (computed `0.33322` at `t = 1000`, `0.33332` at `t = 10⁴`), so the conclusion fails.
- The identity of 1.2 behind the route was checked numerically to `10⁻¹⁵` for a random
  `3 × 3` matrix, random steps and the nonlinear `R θ = A (θ − x⋆) + 0.3 sin θ` (coordinatewise).
- For `R θ = A (θ − x⋆)` the hypothesis on `R` holds identically.
- Measurability of `x 0` is needed: on `Ω = ℕ` with the trivial σ-algebra and `P` the point mass
  at `0`, every nonempty set has outer measure `1`. Take `ℱ t` trivial, `ξ = 0`, `d = 1`, `A = 1`,
  `x⋆ = 0`, `R θ = θ`, constant step `1/2` and `x 0 n = n`. Every other hypothesis holds, the
  quantity of the conclusion is `(1 − 2^(−t)) n / √t`, and the set where it is at least `ε` is
  nonempty, of measure `1`, for every `t`.

*Needs:* 1.2; Mathlib `condExp`, `Filtration`, `MeasureTheory.condExp_bilin_of_stronglyMeasurable_left`,
`MeasureTheory.integral_condExp`, `MeasureTheory.tendstoInMeasure_of_tendsto_ae`,
`MeasureTheory.tendstoInMeasure_of_tendsto_eLpNorm`,
`TendstoInMeasure`.

### Examples

The scalar linear recursion with Gaussian and Rademacher noise.

### Dependencies

Layer 2 uses 1.2 and Mathlib's conditional expectation and convergence in measure.

## Layer 3: asymptotic normality with independent noise

### 3.1 The Polyak–Ruppert central limit theorem

Prove `tendstoInDistribution_sqrt_smul_averagedIterate_sub`: let `IsPositivelyStable A`,
`IsAdmissibleStepSize A γ`, `R : E → E` measurable, `x 0 = x₀` deterministic, and let
`ξ 0, ξ 1, …` be measurable, independent (`iIndepFun`), identically distributed, square-integrable
and centred, with `S = TauCeti.covMatrix (P.map (ξ 0))`. If `x` satisfies the recursion and the
linearization hypothesis of 2.1 holds, then

    √t (x̄ t − x⋆) → N(0, A⁻¹ S A⁻ᵀ) in law.

(Cutler, Díaz and Drusvyatskiy, Theorem B.1, second display; for i.i.d. noise their conditions
B.1 (ii) and (iii) reduce to the existence of `S` and the Lindeberg condition, which holds for
identically distributed square-integrable terms. Polyak and Juditsky 1992, Theorem 2.)

Route. Take for `ℱ (t + 1)` the σ-algebra generated by `ξ 0, …, ξ t` (Mathlib's
`Filtration.natural`, shifted by one, with `ℱ 0` trivial): `ξ t` is independent of `ℱ t`, so
`P[ξ t | ℱ t] = ∫ ξ 0 dP = 0` (`ProbabilityTheory.iIndepFun.condExp_natural_ae_eq_of_lt`), and
2.1 applies. The multivariate central limit theorem of MathematicalStatisticsAsymptotic 1.2 gives
`t^(−1/2) Σ_{i < t} ξ i → N(0, S)` in law; the continuous map `v ↦ −A⁻¹ v` sends it to
`N(0, A⁻¹ S A⁻ᵀ)`, the law being identified through characteristic functions
(`charFun_multivariateGaussian`, `Measure.ext_of_charFun`, with `S` positive semidefinite by
`TauCeti.posSemidef_covMatrix`). Slutsky's lemma in the form
`tendstoInDistribution_of_tendstoInMeasure_sub` transfers the limit to `√t (x̄ t − x⋆)`, which
is measurable because `R` and the `ξ t` are.

**Checks.**

- `d = 1`, `a = 1`, `σ² = 1`, `γ t = (t + 1)^(−α)`: the exact variance of `√t x̄ t` (from
  `x₀ = x⋆ = 0`) is `t⁻¹ Σ_{i < t} (B^t_i)²`, computed as `1.00346, 1.00074, 1.00015` at
  `t = 10³, 10⁴, 10⁵` for `α = 0.3`, `1.035, 1.013, 1.005` for `α = 0.6`, and
  `0.99983, 0.999983` at `t = 10⁴, 10⁵` for the constant step `1/2`; the limit is `σ²/a² = 1`.
- The failure at `α = 1`: for `γ t = c/(t + 1)`, the same variance tends to
  `(σ²/a²) · 2ca/(2ca − 1)` when `ca > 1/2` (computed `1.33335` for `c = 2` against `4/3`,
  `1.99988` for `c = 1` against `2`, at `t = 10⁵`), strictly above the optimal `σ²/a²` for every
  `c`, and to `∞` when `ca < 1/2` (computed `9.19, 30.9, 99.5` at `t = 10³, 10⁴, 10⁵` for
  `c = 1/4`, growing like `√t`). The limit formula is derived here from
  `B^t_i ≈ (c/(ca − 1)) (1 − (i/t)^(ca − 1))` and was checked numerically.
- `A = [[1, 4], [−4, 1]]`, `ξ` with independent Rademacher coordinates (`S = 1`),
  `γ t = (t + 1)^(−0.6)`: `A⁻¹ A⁻ᵀ = (Aᵀ A)⁻¹ = 1/17 ≈ 0.05882`, and the exact covariance
  `t⁻¹ Σ_{i < t} B^t_i (B^t_i)ᵀ` of `√t (x̄ t − x⋆)` from `x₀ = x⋆` is `0.05999` times the
  identity at `t = 4000` and `0.05926` times the identity at `t = 4·10⁴`.

*Needs:* 2.1; MathematicalStatisticsAsymptotic 1.2; Mathlib `Filtration.natural`,
`ProbabilityTheory.iIndepFun.condExp_natural_ae_eq_of_lt`, `TendstoInDistribution.continuous_comp`,
`tendstoInDistribution_of_tendstoInMeasure_sub`, `charFun_multivariateGaussian`,
`Measure.ext_of_charFun`, `multivariateGaussian`; Tau Ceti `TauCeti.covMatrix`,
`TauCeti.posSemidef_covMatrix`.

### 3.2 The linear case

For `R θ = A (θ − θ⋆)`, which is continuous, the linearization quantity of 2.1 is identically `0`,
so 3.1 gives `√t (x̄ t − θ⋆) → N(0, A⁻¹ S A⁻ᵀ)` in law with no hypothesis on the iterates. This
is a direct case of 3.1 and not a separate target. (Polyak and Juditsky 1992 treat the linear
problem first; attribution only.)

**Checks.**

- `d = 1`, `a = 1`, `S = σ²`: the limit is `N(0, σ²)`, the law of the sample mean of the noise
  scaled by `√t`, as if `θ⋆` were observed with additive noise directly.
- Noise with infinite variance is excluded by `MemLp (ξ 0) 2`, without which `S` is not defined.

### Examples

Averaged linear stochastic approximation in dimension two with a rotation-dominated `A`, and the
scalar problem with the steps `(t + 1)^(−α)` against `c/(t + 1)`.

### Dependencies

Layer 3 uses 2.1, MathematicalStatisticsAsymptotic 1.2, Tau Ceti's covariance matrices and
Mathlib's convergence in distribution, Slutsky's lemma and multivariate Gaussian laws.

## Layer 4: optimality of the averaged covariance

### 4.1 The gain comparison

Prove `posSemidef_sub_of_lyapunov`: for matrices `A`, `Γ`, `S`, `V` with `S` positive
semidefinite and `B = Γ A − ½` positively stable, if `B V + V Bᵀ = Γ S Γᵀ`, then
`V − A⁻¹ S A⁻ᵀ` is positive semidefinite, and if `S` is positive definite then
`V = A⁻¹ S A⁻ᵀ` exactly when `Γ = A⁻¹`.

Route. The eigenvalues of `Γ A` are those of `B` shifted by `½`, so `Γ A` and hence `A` are
invertible. Then `W = V − A⁻¹ S A⁻ᵀ` satisfies
`B W + W Bᵀ = (Γ − A⁻¹) S (Γ − A⁻¹)ᵀ`, a positive semidefinite right side. Since `−Bᵀ` is
Hurwitz, LinearSystemsAndControl 5.2 (`lyapunov_eq_iff` for `−Bᵀ`) gives `W` as the integral
over `t > 0` of `exp(−t B) (Γ − A⁻¹) S (Γ − A⁻¹)ᵀ exp(−t Bᵀ)`, which is positive semidefinite.
If `Γ = A⁻¹`, then `B = ½` and the equation reads `W = 0`; if `W = 0` and `S` is positive
definite, `(Γ − A⁻¹) S (Γ − A⁻¹)ᵀ = 0` forces `Γ = A⁻¹`. (Proved here.)

Meaning of `V` (not a target). For the linear iteration
`x (t + 1) = x t − (Γ/(t + 1)) (A (x t − θ⋆) + ξ t)` with deterministic start and i.i.d. centred
noise of covariance `S`, the covariance matrices `C t` of `x t` satisfy
`C (t + 1) = (1 − Γ A/(t + 1)) C t (1 − Γ A/(t + 1))ᵀ + Γ S Γᵀ/(t + 1)²`, so `D t = t C t` moves
by `(Γ S Γᵀ − B D t − D t Bᵀ)/(t + 1)` up to `O(‖D t‖/t²)`, an Euler scheme with steps `1/(t + 1)`
for a linear equation whose only rest point is `V` and which is stable because `B` is positively
stable; so `t C t → V`. The comparison thus says that no matrix gain does better than averaging.

**Checks.**

- `d = 1`, `Γ = c`, `A = a > 0`, `S = σ²`, `ca > 1/2`: `V = c² σ²/(2ca − 1)`, and
  `V − σ²/a² = σ² (ca − 1)²/(a² (2ca − 1)) ≥ 0`, with equality exactly at `c = 1/a`. For the
  scalar iteration with `γ t = c/(t + 1)` and `a = σ = 1`, `t` times the computed variance of the
  iterate at `t = 2·10⁵` is `1.1238`, `1.0000`, `1.3333` for `c = 0.75, 1, 2`, against `V = 1.125`,
  `1`, `4/3`.
- Positive stability of `B` is needed: for `a = 1`, `c = 1/4`, `σ² = 1`, the equation gives
  `V = −1/8`, below `σ²/a² = 1`.
- Positive semidefiniteness of `S` is needed: for `a = 1`, `c = 2`, `S = −1`, `V = −4/3` and
  `V − A⁻¹ S A⁻ᵀ = −1/3 < 0`.
- On `288` random instances with `d ≤ 3` (singular `S` included) and `B` positively stable,
  the smallest eigenvalue of `V − A⁻¹ S A⁻ᵀ` was never below `−10⁻⁸`.
- Meaning of `V` for a matrix gain: `A = [[1, 4], [−4, 1]]`, `Γ = [[0.3, −0.2], [0.4, 0.5]]`,
  `S = [[2, 0.5], [0.5, 1]]` (`B` has eigenvalues `1.1 ± 1.162 i`): `V` has entries
  `0.09137, 0.02518, 0.26580`, and `t C t` at `t = 2·10⁵` agrees with them to four digits, while
  `A⁻¹ S A⁻ᵀ` has entries `0.04844, −0.01211, 0.12803`.

*Needs:* 1.1; LinearSystemsAndControl 5.1, 5.2 (`IsHurwitz`, `lyapunov_eq_iff`); Mathlib
`Matrix.PosSemidef`, `Matrix.PosDef`.

### Examples

The scalar gains `c/(t + 1)` against averaging; the gain `Γ = A⁻¹` for `A = [[1, 4], [−4, 1]]`.

### Dependencies

Layer 4 uses 1.1 and LinearSystemsAndControl 5.1 and 5.2.

## Scope and ownership

This roadmap owns: positive stability and the admissible step sizes of 1.1; the gain matrices and
the gain lemma of 1.2; the averaged iterate and its asymptotic linear representation (2.1); the
central limit theorem for the averaged iterate with i.i.d. additive noise (3.1, with its linear
case 3.2); and the gain comparison of 4.1.

Already in the libraries or on main, and therefore not targets: convergence in distribution, the
continuous mapping theorem and Slutsky's lemma, multivariate Gaussian laws and their
characteristic functions (Mathlib); covariance matrices (Tau Ceti); the multivariate central limit
theorem (MathematicalStatisticsAsymptotic 1.2).

Left to other roadmaps:

- The Robbins–Siegmund theorem and the almost-sure convergence of stochastic gradient descent,
  the usual tools for verifying the linearization hypothesis of 2.1 for a nonlinear `R`, are not
  treated here; that hypothesis is assumed.
- Asynchronous stochastic approximation, Q-learning and TD(0) are MarkovDecisionProcesses Layer 6;
  nothing there concerns the averaged iterate or limit laws.
- Hurwitz matrices and the Lyapunov equation are LinearSystemsAndControl 5.1 and 5.2 (an open
  roadmap, not on main), consumed above as a supplier.

Outside the scope: the central limit theorem for general martingale-difference noise, which
follows from 2.1 and a martingale central limit theorem that no library or roadmap on main
provides; the verification of the linearization hypothesis from a local expansion of `R` and a
Lyapunov function (Polyak and Juditsky's Theorem 2 in full); random-matrix (multiplicative) noise,
for which constant steps give an asymptotic covariance with an added correction (Mou, Li,
Wainwright, Bartlett and Jordan, Theorem 1); Markovian noise and the asymptotic variance of Markov
chains; non-asymptotic bounds; projected and constrained iterations; and all procedures.

## Exact supplier contracts

### From Mathlib

- `Mathlib/Probability/Distributions/Gaussian/Multivariate.lean`: `multivariateGaussian μ S` on
  `EuclideanSpace ℝ ι`; `charFun_multivariateGaussian` (for `S.PosSemidef`, the characteristic
  function `exp(i⟪x, μ⟫ − xᵀ S x / 2)`).
- `Mathlib/MeasureTheory/Measure/CharacteristicFunction/Basic.lean`: `Measure.ext_of_charFun`
  (finite measures on a complete separable real inner product space with equal characteristic
  functions are equal).
- `Mathlib/MeasureTheory/Function/ConvergenceInDistribution.lean`: `TendstoInDistribution`;
  `TendstoInDistribution.continuous_comp` (continuous mapping);
  `tendstoInDistribution_of_tendstoInMeasure_sub` (if `X n → Z` in law, `Y n − X n → 0` in
  probability and each `Y n` is a.e.-measurable, then `Y n → Z` in law).
- `Mathlib/MeasureTheory/Function/ConvergenceInMeasure.lean`: `TendstoInMeasure`;
  `tendstoInMeasure_of_tendsto_eLpNorm` (convergence in `Lᵖ`, `p ≠ 0`, gives convergence in
  measure).
- `Mathlib/MeasureTheory/Function/ConditionalExpectation/`: `condExp`; `integral_condExp`;
  `condExp_bilin_of_stronglyMeasurable_left` (for `f` strongly `m`-measurable and the integrability
  of `B f g` and of `g`, `P[B f g | m] = B f P[g | m]` almost everywhere).
- `Mathlib/Probability/Process/Filtration.lean`: `Filtration`, `Filtration.natural`.
- `Mathlib/Probability/BorelCantelli.lean`: `ProbabilityTheory.iIndepFun.condExp_natural_ae_eq_of_lt`
  (for independent strongly measurable `f` and `i < j`, the conditional expectation of `f j` given
  the natural filtration at `i` is its mean).
- `Mathlib/Probability/Independence/Basic.lean`: `iIndepFun`; `Mathlib/Probability/IdentDistrib.lean`:
  `IdentDistrib`; `Mathlib/Probability/HasLaw.lean`: `HasLaw`.
- `Mathlib/Analysis/Normed/Algebra/GelfandFormula.lean`:
  `spectrum.pow_nnnorm_pow_one_div_tendsto_nhds_spectralRadius` (the Gelfand formula in a complex
  Banach algebra). `spectrum`; `Matrix.toEuclideanLin`; the `L²` operator norm on matrices
  (`Matrix.Norms.L2Operator`); `Matrix.PosSemidef`, `Matrix.PosDef`; `Asymptotics.IsLittleO`.

### From Tau Ceti

- `TauCeti/Probability/Moments/Covariance.lean`: `TauCeti.covMatrix μ` (the matrix of coordinate
  covariances of a measure on `EuclideanSpace ℝ ι`); `TauCeti.posSemidef_covMatrix` (for a finite
  measure with `MemLp id 2 μ`, the covariance matrix is positive semidefinite).

### From TauCetiRoadmap.MathematicalStatisticsAsymptotic

- 1.2, the multivariate central limit theorem
  (`tendstoInDistribution_inv_sqrt_smul_sum_sub_euclidean`): for an i.i.d. sequence `X i` in
  `EuclideanSpace ℝ (Fin k)` with `MemLp (X 0) 2`, `n^(−1/2) Σ_{i < n} (X i − E X 0)` converges in
  law to `N(0, TauCeti.covMatrix (P.map (X 0)))`.

### From TauCetiRoadmap.LinearSystemsAndControl

- 5.1, `IsHurwitz A`: every `μ` in `spectrum ℂ (A.map (algebraMap ℝ ℂ))` has `μ.re < 0`;
  `IsPositivelyStable A` is `IsHurwitz (−A)`. `IsSchurStable A`: every such `μ` has `‖μ‖ < 1`;
  the constant regime of 1.1 is `IsSchurStable (1 − η A)`.
- 5.2, `isHurwitz_iff_exists_posDef`: `A` is Hurwitz if and only if some positive definite `P`
  makes `−(Aᵀ P + P A)` positive definite; and `lyapunov_eq_iff`: for Hurwitz `A` and all `P`,
  `Q`, `Aᵀ P + P A = −Q` holds if and only if `P` is the entrywise integral over `t > 0` of
  `exp(t Aᵀ) Q exp(t A)`.

## References

- J. Cutler, M. Díaz and D. Drusvyatskiy, *Stochastic approximation with decision-dependent
  distributions: asymptotic normality and optimality*, arXiv:2207.04173, version 3 (2024),
  Appendix B: the iteration (40), Assumptions B.1 and B.2 with displays (41)–(43), Theorem B.1,
  the remarks (a) and (b) after it, and its proof with displays (45)–(50).
- J. C. Duchi and F. Ruan, *Asymptotic optimality in stochastic optimization*, Ann. Statist.
  **49** (2021); arXiv:1612.05612, version 4 (2018), Lemma 20.3 in the appendix of that version.
- W. Mou, C. J. Li, M. J. Wainwright, P. L. Bartlett and M. I. Jordan, *On linear stochastic
  approximation: fine-grained Polyak–Ruppert and non-asymptotic concentration*, arXiv:2004.04719,
  version 1 (2020), Theorem 1.
- B. T. Polyak and A. B. Juditsky, *Acceleration of stochastic approximation by averaging*, SIAM
  J. Control Optim. **30** (1992), 838–855. Not openly available; its Lemma 1 and Theorem 2 are
  cited as the open sources above quote them.
- D. Ruppert, *Efficient estimations from a slowly convergent Robbins–Monro process*, technical
  report, School of Operations Research and Industrial Engineering, Cornell University, 1988.
  Attribution only.
- H. Robbins and S. Monro, *A stochastic approximation method*, Ann. Math. Statist. **22**
  (1951), 400–407. Attribution only.
