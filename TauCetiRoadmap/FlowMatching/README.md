# Roadmap: flow matching and probability-flow ODEs

**Summary.** This roadmap develops the deterministic-transport side of generative modelling: a
law is moved to another law by the flow of a time-dependent vector field, and the field is
characterized as a conditional expectation that can be learned by least squares. The setting is a
finite-dimensional real normed space, with an inner product where squared norms or gradients
appear. Vector fields are continuous in time and Lipschitz in space, uniformly on the time
interval. Curves of measures solve the continuity equation `∂ₜμₜ + div(vₜ μₜ) = 0` in the sense
of distributions.

The headline theorems are these.

- *Transport.* If a field is continuous in time and Lipschitz in space on `[a, b]`, then it has
  a flow on `[a, b]` by bijective time maps, and every narrowly continuous curve of finite
  measures on `[a, b]` that solves the continuity equation with that field is the curve of
  pushforwards of its initial measure by the flow.
- *Marginal velocity.* If each curve of a measurable family solves the continuity equation with
  its own field, and the masses and the fields are integrable against the mixing measure, then
  the mixture of the curves solves the continuity equation with the flux-weighted average of the
  fields, the marginal velocity.
- *Conditional flow matching.* For every measurable field `v`, the mean squared distance from `v`
  to the conditional fields equals the mean squared distance from `v` to the marginal velocity
  plus a term that does not depend on `v`, as an identity in `[0, ∞]`. So the marginal velocity
  minimizes the conditional objective.
- *Sampling error.* Let two fields have flows on `[a, b]`, the first field jointly continuous
  with a jointly measurable flow, the second continuous in time and `K`-Lipschitz in space. For
  a finite initial measure and `1 ≤ p < ∞`, the Wasserstein distance of order `p` between the two
  pushforwards at time `b` is at most the integral over `[a, b]` of `e^{K(b−t)}` times the `Lᵖ`
  distance between the two fields at time `t` under the pushforward by the first flow.

The roadmap builds on the continuity equation and the Wasserstein distance of the optimal
transport library, on the ordinary differential equations of Mathlib and Tau Ceti, and on the
conditional expectation. The Gaussian score identity that turns a velocity into a score is
Tweedie's formula of the denoising-diffusion roadmap. The forward equation of the laws of a
diffusion, the hypothesis of the probability-flow layer, comes from the stochastic calculus
roadmap.

Layer 1 below constructs flows and proves the transport theorem, Liouville's formula and the
density form of the transport. Layer 2 defines marginal velocities and proves the mixture theorem
and the conditional flow-matching identity. Layer 3 specializes to interpolants
`αₜ x₁ + βₜ x₀` of a coupling: the identities between velocity, denoiser and score, the
transport of one marginal to the other, and the decrease of convex costs under rectification.
Layer 4 shows that a solution of a Fokker–Planck equation is transported by the probability-flow
field. Layer 5 proves the sampling-error bounds.

## Conventions

- `E` is a real normed space. In 1.2 it is finite-dimensional; in 1.3 to 1.5 and in Layers 2 to 4
  it is finite-dimensional with its Borel σ-algebra
  (`[FiniteDimensional ℝ E] [MeasurableSpace E] [BorelSpace E]`), and in 2.2 and Layers 3 and 4 it
  is a real inner product space. Lebesgue measure on such a space is Mathlib's `volume`. Layer 5
  states its own hypotheses on `E`.
- A **time-dependent field** is `v : ℝ → E → E`, with `v t x` the velocity at time `t` and
  position `x`. Its regularity is always assumed on a time interval `[a, b]` and written out:
  `∀ x, ContinuousOn (fun t ↦ v t x) (Icc a b)` and `∀ t ∈ Icc a b, LipschitzWith K (v t)` with
  `K : ℝ≥0`. Together these make `(t, x) ↦ v t x` continuous on `[a, b] × E`.
- **Integral curves** are Mathlib's `IsIntegralCurveOn γ v (Icc a b)`: `γ` has derivative
  `v t (γ t)` within `[a, b]` at each `t ∈ [a, b]` (one-sided at the endpoints).
- **The continuity equation** is Tau Ceti's `TauCeti.IsContinuityEquation μ v a b` for
  `μ : ℝ → Measure E`: the family `μ` and the field `v` are measurable, the mass and
  `∫ ‖v t‖ ∂μ t` are integrable over `(a, b)`, and
  `∫_a^b ∫ (∂ₜφ + ⟨∇ₓφ, v t⟩) ∂μ t dt = 0` for every smooth compactly supported `φ` with support in
  `(a, b) × E`. A curve of finite measures is `ν : ℝ → FiniteMeasure E`, and **narrowly continuous
  on `[a, b]`** means `ContinuousOn ν (Icc a b)` for the topology of weak convergence.
- **Divergence.** For a differentiable `u : E → E`, `div u x` is the trace of `fderiv ℝ u x`.
- **Couplings.** A coupling is a finite measure `π` on `E × E`; a point is `z = (x₀, x₁)`, with
  `x₀ = z.1` the source point and `x₁ = z.2` the target point. A schedule is a pair
  `α β : ℝ → ℝ`; the interpolant is `α t • x₁ + β t • x₀`, so the linear schedule is `α t = t`,
  `β t = 1 − t`.
- **Extended integrals.** Objectives and error terms are lower integrals `∫⁻` of `‖·‖ₑ`, with
  values in `[0, ∞]`, so that no integrability is needed to state them. Bochner integrals are used
  only where the statement's hypotheses make the integrand integrable.
- **Wasserstein distance** is Tau Ceti's `TauCeti.wassersteinEDist p μ ν`, with values in
  `[0, ∞]`.

## Layer 1: flows of Lipschitz fields and the transport of measures

### 1.1 Flows

Define `IsFlowOn v φ a b` for `φ : ℝ → E → E` as the conjunction of `φ a x = x` for all `x` and
`IsIntegralCurveOn (fun t ↦ φ t x) v (Icc a b)` for all `x`. The values of `φ t` for
`t ∉ [a, b]` are not constrained. Let `v` be continuous in time and `K`-Lipschitz in space on
`[a, b]`, as in [Conventions](#conventions). Prove:

- **existence:** if `E` is complete, there is `φ` with `IsFlowOn v φ a b` that is continuous on
  `ℝ × E` (`exists_isFlowOn`). Route: for a center `x₀` and `M = sup_{t ∈ [a,b]} ‖v t x₀‖`, the
  field is bounded by `M + K r` on the ball of radius `r` around `x₀`, so
  `IsPicardLindelof` holds on every time interval of length at most `1/(2K + 1)` with a radius
  `r ≥ 2M`; these steps do not depend on `x₀`, and finitely many of them cover `[a, b]`. Extend
  `φ` to `t ∉ [a, b]` by the value at the nearer endpoint. For each `x`, the existence of the
  curve `t ↦ φ t x` on `[a, b]` is also the case `I = [a, b]`, `L = K`, `m t = ‖v t x‖` of
  DiracScatteringAndNonlinearFourierTransform 1.7: its solution `Y` of the integral equation is
  an integral curve of `v` on `[a, b]` because `s ↦ v s (Y s)` is continuous there.
- **uniqueness:** two flows of `v` on `[a, b]` agree at every `t ∈ [a, b]`;
- **Lipschitz bounds:** for `t ∈ [a, b]`,
  `dist (φ t x) (φ t y) ≤ exp (K (t − a)) dist x y` and
  `dist x y ≤ exp (K (t − a)) dist (φ t x) (φ t y)`; the second is the first for the
  time-reversed field;
- **bijectivity:** if `E` is complete, `φ t` is bijective for `t ∈ [a, b]` (`IsFlowOn.bijective`),
  so it is a homeomorphism with Lipschitz inverse. Surjectivity is existence for the time-reversed
  field started at time `t`.
- **agreement with Tau Ceti:** if `(t, x) ↦ (1, v t x)` is Lipschitz on `ℝ × E`, then
  `fun t ↦ TauCeti.timeDependentFlow v hv a t` is a flow of `v` on every `[a, b]`.

(Proved here.)

**Checks.**

- `v t x = t • x` on `[0, 2]`, `K = 2`: `φ t x = exp (t²/2) • x`, and
  `exp 2 ≤ exp 4` at `t = 2`. For `E ≠ 0` the map `(t, x) ↦ (1, t • x)` is not Lipschitz on `ℝ × E`, so this
  field is outside `TauCeti.timeDependentFlow` and inside 1.1.
- `v t x = 2 √|x|` on `ℝ` is not Lipschitz, and both `t ↦ 0` and `t ↦ t²` are
  integral curves from `x = 0`: uniqueness needs the Lipschitz hypothesis.
- `a > b`: `[a, b]` is empty, `φ t x = x` is a flow of every field, and nothing is said about
  `φ b`.
- Completeness: on the finitely supported real sequences with the supremum norm, the right shift
  `S` is a `1`-Lipschitz field, and the integral curve from `e₀` would be
  `Σ_n (tⁿ/n!) e_n`, which is not finitely supported; no flow exists.

*Needs:* Mathlib `IsIntegralCurveOn`, `IsPicardLindelof.exists_eq_forall_mem_Icc_hasDerivWithinAt`,
`ODE_solution_unique_of_mem_Icc_right`, `dist_le_of_trajectories_ODE_of_mem`; Tau Ceti
`TauCeti.timeDependentFlow` for the agreement; DiracScatteringAndNonlinearFourierTransform 1.7
for the second route to existence.

### 1.2 Liouville's formula

Let `E` be finite-dimensional, `v` continuous in time and `K`-Lipschitz in space on `[a, b]`,
each `v t` with `t ∈ [a, b]` differentiable, and `(t, x) ↦ fderiv ℝ (v t) x` continuous on
`[a, b] × E`. Let `IsFlowOn v φ a b` and `t ∈ [a, b]`. Prove that `φ t` is `C¹`, that
`s ↦ fderiv ℝ (φ s) x` solves the linearized equation `Y' = fderiv ℝ (v s) (φ s x) ∘ Y` on
`[a, b]` with `Y a = id`, and that

    det (fderiv ℝ (φ t) x) = exp (∫ s in a..t, div (v s) (φ s x))

(`IsFlowOn.det_fderiv`). Route: the solution `Y` of the linearized equation exists by Tau Ceti's
propagator; `‖φ s (x + h) − φ s x − Y s h‖ = o(‖h‖)` uniformly on `[a, b]` by Grönwall's
inequality; the determinant formula is Liouville's formula for the matrix of `Y` in a basis.
(Proved here.)

**Checks.**

- `v t x = B t x` with `B` a continuous path of matrices: `φ t` is linear and the formula reads
  `det (φ t) = exp (∫ tr B)`; for `B t = [[cos t, 1], [−2t, 3/10]]` on `[1/5, 17/10]` both sides
  are `3.46598…`.
- A rotation field `v x = J x` with `J` skew-symmetric has divergence `0` and determinant `1`.
- `v t x = −x/(1 − t)` on `[0, 1/2]`: `φ t x = (1 − t) x` and
  `exp (∫₀ᵗ −n/(1 − s) ds) = (1 − t)ⁿ` in dimension `n`.

*Needs:* 1.1; Tau Ceti `TauCeti.hasDerivAt_dysonSeriesLeft_apply`; Mathlib
`dist_le_of_trajectories_ODE_of_mem`; DiracScatteringAndNonlinearFourierTransform 1.4.

### 1.3 Pushforwards solve the continuity equation

Let `v` be measurable on `ℝ × E`, continuous in time and `K`-Lipschitz in space on `[a, b]`, let
`IsFlowOn v φ a b` with `φ` measurable on `ℝ × E`, and let `μ` be a finite measure on `E` with
`∫⁻ ‖x‖ₑ ∂μ < ∞`. Prove `TauCeti.IsContinuityEquation (fun t ↦ μ.map (φ t)) v a b`
(`IsFlowOn.isContinuityEquation_map`). The trajectories are Lipschitz on `[a, b]`, hence
absolutely continuous, and `‖v t (φ t x)‖ ≤ C + K exp (K (b − a)) ‖x‖` with
`C = sup_{t ∈ [a,b]} ‖v t (φ t 0)‖`, so the expected length is finite and the Lagrangian
theorem of Tau Ceti applies. (Proved here.)

**Checks.**

- `v t x = w` constant: `φ t x = x + (t − a) w`, the translating law of the supplier.
- The first moment is needed: for `v t x = x` on `ℝ` and `μ` the Cauchy law,
  `∫ ‖v t‖ ∂(μ.map (φ t)) = ∞`, and the integrability field of `TauCeti.IsContinuityEquation`
  fails.

*Needs:* 1.1; Tau Ceti `TauCeti.IsContinuityEquation`, `TauCeti.isContinuityEquation_map`.

### 1.4 Solutions are pushforwards

Let `ν : ℝ → FiniteMeasure E` be narrowly continuous on `[a, b]` with
`TauCeti.IsContinuityEquation (fun t ↦ (ν t : Measure E)) v a b`, let `v` be continuous in time
and `K`-Lipschitz in space on `[a, b]`, and let `IsFlowOn v φ a b`. Prove, for `t ∈ [a, b]`,

    (ν t : Measure E) = (ν a : Measure E).map (φ t)

(`eq_map_of_isContinuityEquation`). In particular two such solutions with the same measure at
time `a` agree on `[a, b]`.

Route: fix `T ∈ [a, b]` and `ψ : E → ℝ` smooth with compact support. If `v` is `C¹` in space as
in 1.2, the function `u (t, x) = ψ (Φ_{t,T} x)`, with `Φ_{t,T}` the flow from time `t` to time
`T`, is `C¹` on `[a, T] × E` by 1.2, has bounded derivative there, and satisfies
`∂ₜu + ⟨∇ₓu, v t⟩ = 0`; after a cutoff in time it is an admissible test function of the supplier,
which gives `∫ ψ ∂(ν T) = ∫ ψ ∘ φ T ∂(ν a)`. For a Lipschitz `v`, replace `v` by its spatial
mollification `v_ε`, which is `K`-Lipschitz, `C¹` in space, and satisfies
`‖v_ε t x − v t x‖ ≤ K ε`; the same computation leaves the error
`∫_a^T ∫ ⟨∇ₓu_ε, v t − v_ε t⟩ ∂(ν t) dt`, which is at most
`K ε sup ‖∇ψ‖ exp (K (T − a)) ∫_a^T (ν t) univ dt`, and `u_ε (a, ·) → ψ ∘ φ T` boundedly as
`ε → 0`. (Proved here.)

**Checks.**

- `ν t = dirac (γ t)` for an integral curve `γ` of `v`: the conclusion is `γ t = φ t (γ a)`.
- Without the Lipschitz hypothesis the conclusion fails: for `v t x = 2 √|x|` on `ℝ`, both
  `ν t = dirac 0` and `ν t = dirac (t²)` are narrowly continuous solutions on `[0, 1]` starting
  at `dirac 0`, and the field has a flow with `φ t 0 = 0`.
- `a = b`: the statement is `ν a = (ν a).map (φ a)`, and `φ a` is the identity.

*Needs:* 1.1, 1.2; Tau Ceti `TauCeti.IsContinuityEquation`,
`TauCeti.IsContinuityEquation.intervalIntegral_integral_fderiv_eq_sub`.

### 1.5 The density form

Under the hypotheses of 1.2, let `μ` be an additive Haar measure on `E`, `t ∈ [a, b]`, and
`p q : E → ℝ≥0∞` with

    q (φ t x) = p x * ENNReal.ofReal (exp (−∫ s in a..t, div (v s) (φ s x)))   for all x.

Prove `(μ.withDensity p).map (φ t) = μ.withDensity q` (`IsFlowOn.map_withDensity`). Since `φ t`
is bijective, `q` is determined by `p`. Consequently, with `p_t` the density so obtained at time
`t`, and for `x` with `0 < p x < ∞`, the function `t ↦ log (p_t (φ t x))` has derivative
`−div (v t) (φ t x)` on `[a, b]`: the instantaneous change of variables. (Chen, Rubanova,
Bettencourt and Duvenaud 2018, Theorem 1, where the field is assumed Lipschitz in space and
continuous in time and the differentiability that the trace requires is left implicit; the
statement with the hypotheses of 1.2 is proved here.)

**Checks.**

- `v t x = x` on `ℝ`, `a = 0`, `p` the standard Gaussian density: `q` is the density of
  `N(0, e^{2t})`, and `log q (eᵗ x) = log p x − t`.
- With `exp (+∫ div)` in place of `exp (−∫ div)` the measure `μ.withDensity q` has total mass
  `exp (2 ∫ tr B)` in the linear example of 1.2, not `1`.

*Needs:* 1.1, 1.2; Mathlib `MeasureTheory.lintegral_image_eq_lintegral_abs_det_fderiv_mul`.

### Examples

Translations, linear fields `B t x`, the dilation `v t x = t • x`, and the non-Lipschitz field
`2 √|x|` as the counterexample to uniqueness.

### Dependencies

Layer 1 uses Mathlib's Picard–Lindelöf, uniqueness and Grönwall theorems and its change of
variables formula; Tau Ceti's time-dependent flow, propagator, continuity equation, Lagrangian
theorem and boundary-term identity; and DiracScatteringAndNonlinearFourierTransform 1.4 and 1.7.

## Layer 2: mixtures of solutions and the marginal velocity

Throughout this layer `Z` is a measurable space, `ρ` an s-finite measure on `Z`,
`μ : Z → ℝ → Measure E` a family of curves and `u : Z → ℝ → E → E` a family of fields, with
`(z, t) ↦ μ z t` and `(z, t, x) ↦ u z t x` measurable, and

    ∫⁻ z, ∫⁻ t in Ioo a b, μ z t univ ∂ρ < ∞,   ∫⁻ z, ∫⁻ t in Ioo a b, ∫⁻ x, ‖u z t x‖ₑ ∂μ z t ∂ρ < ∞.

These are the **standing hypotheses of Layer 2**.

### 2.1 Marginal velocities

Define `mixture ρ μ t = ρ.bind (fun z ↦ μ z t)`, the measure `s ↦ ∫⁻ z, μ z t s ∂ρ`. Define
`IsMarginalVelocity ρ μ u w a b` for `w : ℝ → E → E` as: `w` is measurable on `ℝ × E`, and for
almost every `t ∈ (a, b)` and every measurable `s ⊆ E`,

    ∫ x in s, w t x ∂(mixture ρ μ t) = ∫ z, ∫ x in s, u z t x ∂(μ z t) ∂ρ.

In words, the flux `w t • mixture ρ μ t` is the mixture of the conditional fluxes; when the
measures have densities this is `w t x = ∫ u z t x p_t(x | z) ∂ρ / ∫ p_t(x | z) ∂ρ`. Prove, under
the standing hypotheses:

- **existence:** a marginal velocity exists (`exists_isMarginalVelocity`). On `Z × ℝ × E` let
  `Λ` be the finite measure `ρ ⊗ dt|_{(a,b)} ⊗ μ z t`; the conditional expectation of
  `(z, t, x) ↦ u z t x` given `(t, x)` factors as `w (t, x)` with `w` measurable.
- **uniqueness:** two marginal velocities agree `mixture ρ μ t`-almost everywhere for almost
  every `t ∈ (a, b)`, and a measurable field that agrees in this sense with a marginal velocity is
  one;
- **integrability:** `∫⁻ t in Ioo a b, ∫⁻ x, ‖w t x‖ₑ ^ p ∂(mixture ρ μ t)` is at most
  `∫⁻ z, ∫⁻ t in Ioo a b, ∫⁻ x, ‖u z t x‖ₑ ^ p ∂μ z t ∂ρ` for every real `p ≥ 1`;
- **the mixture theorem:** if `TauCeti.IsContinuityEquation (μ z) (u z) a b` for `ρ`-almost
  every `z` and `IsMarginalVelocity ρ μ u w a b`, then
  `TauCeti.IsContinuityEquation (mixture ρ μ) w a b`
  (`IsMarginalVelocity.isContinuityEquation_mixture`). The distributional identity is linear in
  the pair (measure, flux), and Fubini's theorem exchanges `∫ ∂ρ` with the integral over
  `(a, b) × E`.

(Lipman, Chen, Ben-Hamu, Nickel and Le 2023, Theorem 1 with equations (6) and (8), for densities
that are positive everywhere and without integrability hypotheses; the statement for measures,
with the standing hypotheses, is proved here.)

**Checks.**

- `Z` a point with `ρ` its Dirac mass: `mixture ρ μ = μ z` and `u z` is a marginal velocity.
- `Z = {−1, 1}` with the uniform law, `μ z t = dirac (t z)`, `u z t x = z` on `E = ℝ`,
  `(a, b) = (0, 1)`: `mixture ρ μ t = (dirac (−t) + dirac t)/2` and `w t x = x/t` is a marginal
  velocity. The unweighted average of the fields, `w = 0`, is not: the two sides of the defining
  identity on `s = (0, ∞)` are `0` and `1/2`.
- Two crossing particles: `μ z t = dirac ((2t − 1) z)`, `u z t x = 2z`. At `t = 1/2` both
  particles are at `0` with velocities `±2`, and a marginal velocity may take any value there,
  since `{1/2}` is a null set of times; `w t x = 2x/(2t − 1)` for `t ≠ 1/2` is one.

*Needs:* Mathlib `MeasureTheory.Measure.bind`, `MeasureTheory.condExp`,
`MeasureTheory.StronglyMeasurable.exists_eq_measurable_comp`,
`MeasureTheory.condExp_stronglyMeasurable_bilin_of_bound`; Tau Ceti
`TauCeti.IsContinuityEquation`, `TauCeti.IsContinuityEquation.congr`.

### 2.2 The conditional flow-matching identity

Let `E` be an inner product space. Under the standing hypotheses, let
`IsMarginalVelocity ρ μ u w a b` and let `v : ℝ → E → E` be measurable on `ℝ × E`. Prove, in
`ℝ≥0∞`,

    ∫⁻ z, ∫⁻ t in Ioo a b, ∫⁻ x, ‖v t x − u z t x‖ₑ² ∂μ z t ∂ρ
      = ∫⁻ t in Ioo a b, ∫⁻ x, ‖v t x − w t x‖ₑ² ∂(mixture ρ μ t)
        + ∫⁻ z, ∫⁻ t in Ioo a b, ∫⁻ x, ‖w t x − u z t x‖ₑ² ∂μ z t ∂ρ

(`IsMarginalVelocity.lintegral_enorm_sub_sq`). The left side is the conditional flow-matching
objective of `v`, the first term on the right its flow-matching objective, and the last term does
not depend on `v`. Consequently:

- the conditional objective of `w` is at most that of every measurable `v`;
- if the conditional objective of `w` is finite, a measurable `v` attains it if and only if
  `v t = w t` almost everywhere for `mixture ρ μ t`, for almost every `t ∈ (a, b)`.

Route: with `Λ` as in 2.1, if the left side is finite then `v − u ∈ L²(Λ)` and its conditional
expectation given `(t, x)` is `v − w`, so the identity is the Pythagorean theorem for the
orthogonal projection of `L²(Λ)` onto the functions of `(t, x)`; if the left side is infinite
and both terms on the right were finite, `v − u = (v − w) + (w − u)` would be in `L²(Λ)`. No
square-integrability of `u` is assumed: it is needed only for the last term to be finite.
(Lipman, Chen, Ben-Hamu, Nickel and Le 2023, Theorem 2 with equation (9), for positive densities;
the identity in `[0, ∞]` is proved here.)

**Checks.**

- The two-point example of 2.1 with `v = 0`: the left side is `∫₀¹ 1 dt = 1`, the first term on
  the right is `∫₀¹ E (X_t/t)² dt = 1`, and the last term is `0`.
- With the unweighted average `w = 0` in place of the marginal velocity and `v t x = x/t`, the
  right side would be `1 + 1 = 2` against a left side of `0`.
- `Z = {x₁}` finite with weights `q`, `μ z t = N(t x₁, (1 − t)²)` and
  `u z t x = (x₁ − x)/(1 − t)` on `(0, 9/10)`: the identity holds pointwise in `(t, x)` after
  integrating over `z`, for every `v`.

*Needs:* 2.1; Mathlib `MeasureTheory.condExp`,
`MeasureTheory.condExp_stronglyMeasurable_bilin_of_bound`.

### Examples

Mixtures of moving Dirac masses (two points, with and without crossing) and of Gaussian
conditional paths `N(t x₁, (1 − t)²)`.

### Dependencies

Layer 2 uses Mathlib's `Measure.bind`, conditional expectation and its pull-out property, and
Tau Ceti's `TauCeti.IsContinuityEquation`. It does not use Layer 1.

## Layer 3: interpolant paths

Here `E` is a finite-dimensional real inner product space and `π` is a finite measure on
`E × E` with `∫⁻ ‖z‖ₑ ∂π < ∞`.

### 3.1 Interpolants and their velocities

Define `interpolant α β t z = α t • z.2 + β t • z.1` and
`interpolantVelocity α β t z = deriv α t • z.2 + deriv β t • z.1`. Define
`IsInterpolantVelocity π α β w a b` as `IsMarginalVelocity π μ u w a b` for the moving Dirac
masses `μ z t = dirac (interpolant α β t z)` with fields `u z t x = interpolantVelocity α β t z`.
The mixture is then the law of the interpolant, `π.map (interpolant α β t)`, by
`MeasureTheory.Measure.bind_dirac_eq_map`, and the defining identity says that
`w t (interpolant α β t z)` is the conditional expectation of `interpolantVelocity α β t z` given
the interpolant, for almost every `t`. Prove, for `α`, `β` of class `C¹`:

- the standing hypotheses of Layer 2 hold on every bounded `(a, b)`, each moving Dirac mass solves
  the continuity equation with its field, and so
  `TauCeti.IsContinuityEquation (fun t ↦ π.map (interpolant α β t)) w a b` for every interpolant
  velocity `w`;
- **agreement with Tau Ceti:** for the linear schedule on `(0, 1)`, the barycentric velocity of
  `TauCeti.exists_isContinuityEquation_map_smul_fst_add_smul_snd` is an interpolant velocity;
- **Gaussian conditional paths:** for `m σ : ℝ → ℝ` of class `C¹` with `σ t ≠ 0` on `(a, b)` and
  `y : E`, the curve `t ↦ N(m t • y, (σ t)² • 1)` solves the continuity equation on `(a, b)`
  with the field `u t x = (deriv σ t / σ t) • (x − m t • y) + deriv m t • y`, as the image of the
  standard Gaussian law under `x ↦ σ t • x + m t • y` (Lipman, Chen, Ben-Hamu, Nickel and Le
  2023, Theorem 3, equation (15));

and, for measurable `α`, `β`:

- **the velocity–noise identity:** if `n` is a marginal velocity of the same moving Dirac masses
  for the fields `u z t x = z.1`, that is, `n t` is the conditional mean of the source point
  given the interpolant, and `α t ≠ 0` on `(a, b)`, then

      w t x = (deriv α t / α t) • x + (deriv β t − deriv α t * β t / α t) • n t x

  is an interpolant velocity (`isInterpolantVelocity_of_noise`);
- **the velocity–denoiser identity:** symmetrically, if `D` is a marginal velocity for the fields
  `u z t x = z.2` (the denoiser, the conditional mean of the target point) and `β t ≠ 0` on
  `(a, b)`, then
  `w t x = (deriv β t / β t) • x + (deriv α t − α t * deriv β t / β t) • D t x` is an
  interpolant velocity;
- **the velocity–score identity:** let `E = EuclideanSpace ℝ (Fin d)`, `π` the product of the
  standard Gaussian law (first factor) and a probability measure `μ₁` with finite first moment,
  and `α t ≠ 0`, `β t > 0` on `(a, b)`. With `s_t = noisyScore μ₁ (α t) (β t)` the score of
  DenoisingDiffusion 3.1 for the law of the interpolant, Tweedie's formula in its noise form
  gives `n t = −β t • s_t`, and so

      w t x = (deriv α t / α t) • x + (deriv α t * (β t)² / α t − β t * deriv β t) • s_t x

  is an interpolant velocity. For the linear schedule this is `w t x = (x + (1 − t) s_t x)/t`.
  The measurability of `(t, x) ↦ s_t x` on `(a, b) × E` that a marginal velocity needs is proved
  here: the smoothed density and its gradient are continuous in `(c, s, y)` on `s > 0`, by
  dominated convergence, and `α`, `β` are measurable.

All three identities follow from `x = α t • x₁ + β t • x₀` on the support and the linearity of
the conditional expectation. (Albergo and Vanden-Eijnden 2023, Proposition 4 and Appendix F,
for a standard Gaussian source and the trigonometric schedule `α t = sin (πt/2)`,
`β t = cos (πt/2)`. Equation (F.4) of the appendix is the velocity–score identity above. The
first line of equation (28), printed as `∇ log ρ_t = −x − (2/π) tan (πt/2) v_t`, is a misprint
for `−x + (2/π) tan (πt/2) v_t`, which is what (F.4) gives for this schedule and what the second
line of (28) is the limit of; see the Checks. Proved here.)

**Checks.**

- `π = dirac 0 ⊗ (dirac (−1) + dirac 1)/2` on `ℝ × ℝ`, linear schedule: this is the two-point
  example of 2.1, `n = 0`, and the velocity–noise identity gives `w t x = x/t`.
- Gaussian target on `ℝ`: source `N(0, 1)` independent of target `N(m, s²)`, linear schedule.
  The interpolant has law `N(t m, v_t)` with `v_t = t² s² + (1 − t)²`, score
  `−(x − t m)/v_t`, and `w t x = m + (t s² − (1 − t))(x − t m)/v_t`; at `m = 3/2`, `s = 2`,
  `t = 3/10`, `x = 7/10` both the direct formula and the score form give `28/17`.
- Trigonometric schedule: the identity reads `s_t x = −x + (2/π) tan (πt/2) • w t x`. For a
  target concentrated at `y ∈ ℝ`, `s_t x = −(x − sin (πt/2) y)/cos² (πt/2)` and
  `w t x = (π/2)(cos (πt/2) y − tan (πt/2)(x − sin (πt/2) y))`, which satisfy it; with the sign
  `−(2/π) tan (πt/2)` the right side at `x = sin (πt/2) y` is `−2 sin (πt/2) y`, not `0`.
- A wrong sign of the score term, `(x − (1 − t) s_t x)/t`, gives `5.365…` against `0.920…` for the
  two-component mixture target `0.3 N(−2, 0.5²) + 0.7 N(1.5, 0.8²)` at `t = 0.35`, `x = 1.1`.

*Needs:* 2.1; Mathlib `MeasureTheory.Measure.bind_dirac_eq_map`; Tau Ceti
`TauCeti.isContinuityEquation_dirac`, `TauCeti.isContinuityEquation_map`,
`TauCeti.exists_isContinuityEquation_map_smul_fst_add_smul_snd`; DenoisingDiffusion 3.1 and 3.2
for the score identity.

### 3.2 Transport by the flow of the marginal velocity

Let `α`, `β` be of class `C¹`, let `IsInterpolantVelocity π α β w a b` with `w` continuous in
time and `K`-Lipschitz in space on `[a, b]`, and let `IsFlowOn w φ a b`. Prove, for
`t ∈ [a, b]`,

    π.map (interpolant α β t) = (π.map (interpolant α β a)).map (φ t)

(`map_interpolant_eq_map_flow`). When `[a, b] = [0, 1]`, `α 0 = 0 = β 1` and `α 1 = 1 = β 0`,
this says that `φ 1` pushes the first marginal of `π` to the second. The curve
`t ↦ π.map (interpolant α β t)` is narrowly continuous by dominated convergence and solves the
continuity equation with `w` by 3.1, and 1.4 applies. (Liu, Gong and Liu 2022, Theorem 3.3,
where the field is assumed to have unique integral curves and uniqueness for the continuity
equation is quoted; the statement with a Lipschitz field is proved here.)

**Checks.**

- The Gaussian target of 3.1: `w` is `5/4`-Lipschitz on `[0, 1]` for `s = 2` (the coefficient
  `(5t − 1)/(5t² − 2t + 1)` has maximum `5/4` at `t = 3/5` and minimum `−1` at `t = 0`), the
  flow is `φ t x = t m + √v_t x`, and `φ 1 x = m + s x` pushes `N(0, 1)` to `N(m, s²)`.
- The two-point example: `w t x = x/t` is `1/a`-Lipschitz on `[a, 1]` for `a > 0`, with flow
  `φ t x = (t/a) x` from time `a`, which pushes `(dirac (−a) + dirac a)/2` to
  `(dirac (−t) + dirac t)/2`. On `[0, 1]` the hypothesis fails for every representative: no map
  pushes `dirac 0` to a law with two atoms.

*Needs:* 1.4, 3.1.

### 3.3 Rectification does not increase convex costs

Let `w` be an interpolant velocity of `π` for the linear schedule on `(0, 1)`, continuous in
time and `K`-Lipschitz in space on `[0, 1]`, let `IsFlowOn w φ 0 1`, and let `c : E → ℝ` be
convex with `z ↦ c (z.2 − z.1)` integrable for `π`. Prove

    ∫ x, c (φ 1 x − x) ∂π.fst ≤ ∫ z, c (z.2 − z.1) ∂π

(`integral_flow_sub_le`). The left side is the `c`-cost of the rectified coupling
`π.fst.map (fun x ↦ (x, φ 1 x))`, which has the marginals of `π` by 3.2. Route:
`φ 1 x − x = ∫₀¹ w t (φ t x) dt`; Jensen's inequality in time; `φ t` pushes `π.fst` to the law
of the interpolant by 3.2; and the conditional Jensen inequality for
`w t (interpolant t z) = E[z.2 − z.1 | interpolant t z]`. The integrand on the left is integrable:
it is bounded below by an affine function of `φ 1 x − x`, which is integrable, and above through
the chain of inequalities. (Liu, Gong and Liu 2022, Theorem 3.5, stated there without the
integrability of the cost; proved here.)

**Checks.**

- The Gaussian target of 3.1 with `c = ‖·‖²`: the rectified cost is `m² + (s − 1)²` and the cost
  of the independent coupling is `m² + s² + 1`; for `m = 3/2`, `s = 2` these are `13/4` and
  `29/4`.
- The integrability of the cost is needed: if `c = ‖·‖²` and `π` has no second moment, the right
  side is the Bochner integral of a non-integrable function.
- `c` affine: equality holds, because the two couplings have the same marginals.

*Needs:* 3.1, 3.2; Mathlib `ConvexOn.map_integral_le`,
`ConvexOn.map_condExp_le_of_finiteDimensional`.

### Examples

The Gaussian-to-Gaussian interpolant, with marginal velocity, flow and conditional objective in
closed form (for `s = 1` the constant term of 2.2 is `∫₀¹ dt/(2t² − 2t + 1) = π/2`); the
two-point target; and optimal couplings: when `π` is an optimal coupling for the cost
`‖x − y‖ᵖ` with `1 < p < ∞` on a strictly convex space, Tau Ceti's
`TauCeti.exists_isContinuityEquation_map_smul_fst_add_smul_snd_of_isOptimalCoupling` shows that
the interpolant velocity of the linear schedule is the displacement itself, so that the constant
term of 2.2 vanishes and the path is the displacement interpolation of OptimalTransport 9.1.

### Dependencies

Layer 3 uses 1.4 and 2.1, Mathlib's `bind_dirac_eq_map` and its two Jensen inequalities, Tau
Ceti's Lagrangian, moving-Dirac and plan-interpolation theorems, and DenoisingDiffusion 3.1 and
3.2.

## Layer 4: the probability-flow ODE

Here `E` is a finite-dimensional real inner product space and `e_j` is Mathlib's
`stdOrthonormalBasis ℝ E`.

### 4.1 From the Fokker–Planck equation to the continuity equation

For `A : E →L[ℝ] E` and `ψ : E → ℝ` define
`diffusionTerm A ψ x = Σ_j D²ψ(x)[A e_j, e_j]`, the second-order expression
`Σ_{i,j} A_{ij} ∂ᵢ∂ⱼψ (x)`. For an operator-valued field `M : E → E →L[ℝ] E` define the row
divergence `rowDivergence M x = Σ_j ∂_{e_j} (y ↦ M y e_j) (x)`, the vector with components
`Σ_j ∂ⱼ M_{ij}`. Both are independent of the orthonormal basis; `rowDivergence (m • id) = ∇m`
for a scalar field `m`, and `rowDivergence (p • M) x = M x (∇p x) + p x • rowDivergence M x`.

Let `p : ℝ → E → ℝ` be nonnegative, `f : ℝ → E → E` a drift and `A : ℝ → E → E →L[ℝ] E` a
diffusion matrix (in the notation `dX = f dt + G dB`, `A = G Gᵀ`), all measurable on `ℝ × E`,
with `p t` and `A t` of class `C¹` for `t ∈ (a, b)`, and with

    ∫∫ p,   ∫∫ ‖f‖ p,   ∫∫ ‖A‖ p,   ∫∫ ‖rowDivergence (p t • A t)‖

finite, the integrals being over `(a, b) × E` for Lebesgue measure. Suppose the Fokker–Planck
equation `∂ₜp = −div(p f) + (1/2) Σ_{i,j} ∂ᵢ∂ⱼ(A_{ij} p)` holds in the sense of distributions:
for every smooth compactly supported `ζ` with support in `(a, b) × E`,

    ∫_a^b ∫ (∂ₜζ + ⟨∇ₓζ, f t⟩ + (1/2) diffusionTerm (A t x) (ζ (t, ·)) x) p t x dx dt = 0.

Let `w : ℝ → E → E` be measurable with

    p t x • w t x = p t x • f t x − (1/2) • rowDivergence (fun y ↦ p t y • A t y) x

for `t ∈ (a, b)` and all `x`. Prove that the measures with densities `p t` solve the continuity
equation with the field `w` on `(a, b)` (`isContinuityEquation_of_fokkerPlanck`). Where
`p t x > 0` the condition on `w` reads

    w t x = f t x − (1/2) • rowDivergence (A t) x − (1/2) • A t x (∇p t x / p t x),

the probability-flow field; where `p t x = 0` it holds for every value of `w t x`, because the
gradient of a nonnegative `C¹` function vanishes at its zeros. For `A t x = g(t)² • id` the field
is `f t x − (g(t)²/2) ∇ log p t x`. Route: integrate by parts in space,
`∫ diffusionTerm (A t x) ψ x p t x dx = −∫ ⟨∇ψ x, rowDivergence (p t • A t) x⟩ dx` for `ψ` smooth
with compact support. (Song, Sohl-Dickstein, Kingma, Kumar, Ermon and Poole 2021, Section 4.3,
equation (13), and Appendix D.1, equations (35)–(37), as a formal computation with smooth
positive densities; the statement above is proved here.)

**Checks.**

- `A = g² • id`: `diffusionTerm A ψ = g² Δψ`, and `rowDivergence (p • A) = g² ∇p`.
- Row against column: on `ℝ²` with its standard basis and `M x y = ⟨e₁, y⟩ • x`, `rowDivergence M = e₁`; the
  transposed contraction `Σ_j ∂ⱼ M_{ji}` gives `2 e₁`.
- `diffusionTerm A ψ` for `ψ x = x₁ x₂` and `A` the matrix unit `E₁₂` is `1`; for `A = id` it is
  `Δψ = 0`.
- Non-symmetric constant `A` and drift `f x = −x`: a centered Gaussian solution has covariance
  `Σ' = −2Σ + (A + Aᵀ)/2`, and the field `w x = −x + (1/2) A Σ⁻¹ x` transports it with
  `Σ' = B Σ + Σ Bᵀ`, `B = −1 + (1/2) A Σ⁻¹`; the two right sides agree.

*Needs:* Mathlib `stdOrthonormalBasis`,
`integral_bilinear_hasLineDerivAt_right_eq_neg_left_of_integrable`; Tau Ceti
`TauCeti.IsContinuityEquation`.

### 4.2 The probability-flow ODE has the same marginals

Under the hypotheses of 4.1, suppose moreover that `ν : ℝ → FiniteMeasure E` is narrowly
continuous on `[a, b]` with `ν t` of density `p t` for every `t`, that `w` is continuous in
time and `K`-Lipschitz in space on `[a, b]`, and that `IsFlowOn w φ a b`. Prove
`(ν t : Measure E) = (ν a : Measure E).map (φ t)` for `t ∈ [a, b]`
(`eq_map_flow_of_fokkerPlanck`): the solution of `x' = w t x` started from the law `ν a` has the
same law at each time as the diffusion. This is 4.1 followed by 1.4. (Song, Sohl-Dickstein,
Kingma, Kumar, Ermon and Poole 2021, Section 4.3, where it is asserted for all diffusions; the
statement with these hypotheses is proved here.)

**Checks.**

- Ornstein–Uhlenbeck: `f x = −λ x`, `A = σ² • id` on `ℝ`, `ν 0 = N(m₀, s₀²)` with `s₀ > 0`,
  `λ ≠ 0`. Then `ν t = N(m_t, s_t²)` with `m_t = m₀ e^{−λt}` and
  `s_t² = s₀² e^{−2λt} + σ² (1 − e^{−2λt})/(2λ)`, the field is
  `w t x = −λ x + (σ²/2)(x − m_t)/s_t²`, which is affine in `x` with coefficient bounded on
  `[0, T]`, and its flow is `φ t x = m_t + (s_t/s₀)(x − m₀)`, which pushes `N(m₀, s₀²)` to
  `N(m_t, s_t²)`.
- For `λ = 1`, `σ² = 2`, `m₀ = 0`, `s₀² = 4`: `s_t² = 1 + 3 e^{−2t}` and
  `φ t x = (x/2) √(1 + 3 e^{−2t})`.
- Stationary start `s₀² = σ²/(2λ)`, `λ > 0`: `s_t` is constant and `w t x = −λ m_t`, a field
  of translations, although the diffusion is not deterministic.
- Variance-preserving case `λ = β/2`, `σ² = β`, `s₀ = 1`: `s_t = 1` for all `t`.

*Needs:* 1.4, 4.1.

### Examples

The Ornstein–Uhlenbeck process of StochasticCalculus 9.4 with a Gaussian initial law, as in the
Checks of 4.2: its laws satisfy the distributional Fokker–Planck hypothesis of 4.1 by
StochasticCalculus 10.2, and directly, since the Gaussian densities solve the equation
classically.

### Dependencies

Layer 4 uses 1.4, Mathlib's `stdOrthonormalBasis` and integration by parts for line derivatives,
and Tau Ceti's
`TauCeti.IsContinuityEquation`. StochasticCalculus 9.4 and 10.2 enter only through the example.

## Layer 5: sampling error

### 5.1 Comparison of two flows

Let `E` be a real normed space, `u w : ℝ → E → E` with `(t, x) ↦ u t x` continuous on
`[a, b] × E` and `w` continuous in time and `K`-Lipschitz in space on `[a, b]`, and let
`IsFlowOn u φ a b` and `IsFlowOn w ψ a b`. Prove, for `t ∈ [a, b]` and `x : E`,

    dist (φ t x) (ψ t x) ≤ ∫ s in a..t, exp (K (t − s)) * ‖u s (φ s x) − w s (φ s x)‖

(`IsFlowOn.dist_le_integral`). No Lipschitz hypothesis is made on `u`. Route: the function
`g s = ‖φ s x − ψ s x‖` has upper right derivative at most `δ s + K g s` with
`δ s = ‖u s (φ s x) − w s (φ s x)‖`, which is continuous, and the right side solves
`B' = δ + K B`, `B a = 0`. (Proved here.)

**Checks.**

- `w t x = K x` and `u t x = K x + c t` on `ℝ` with `c ≥ 0`: equality holds, both sides being
  `∫_a^t exp (K (t − s)) c s ds`.
- `K = 0` and `u − w = 1`: the bound is `t − a`, attained.
- Without the weight `exp (K (t − s))` the bound fails: `K = 4/5`, `c s = 1 + s²` on `[0, 1]`
  gives distance `1.944…` against `∫ c = 4/3`.

*Needs:* 1.1; Mathlib `image_le_of_liminf_slope_right_le_deriv_boundary`.

### 5.2 The Wasserstein bound

Let moreover `E` carry its Borel σ-algebra and be second countable, let `φ` be measurable on
`ℝ × E`, `a ≤ b`, `μ` a finite measure on `E`, and `1 ≤ p < ∞`. Prove

    W_p (μ.map (φ b), μ.map (ψ b))
      ≤ ∫⁻ t in Ioo a b, exp (K (b − t)) * (∫⁻ x, ‖u t x − w t x‖ₑ^p ∂(μ.map (φ t)))^(1/p)

in `ℝ≥0∞` (`wassersteinEDist_map_flow_le`). Consequently, for `p = 2`, with
`ε² = ∫_a^b ∫ ‖u t − w t‖² ∂(μ.map (φ t)) dt`,

    W₂ (μ.map (φ b), μ.map (ψ b)) ≤ (∫_a^b exp (2K (b − t)) dt)^(1/2) ε ≤ exp (K (b − a)) (b − a)^(1/2) ε,

by the Cauchy–Schwarz inequality; the first constant is `((e^{2K(b−a)} − 1)/(2K))^(1/2)` for
`K > 0` and `(b − a)^(1/2)` for `K = 0`. Route: the law of `x ↦ (φ b x, ψ b x)` under `μ` is a
coupling; apply 5.1 pointwise and Minkowski's integral inequality. In the application `u` is a
marginal velocity with flow `φ`, `μ.map (φ t)` is the exact path by 3.2, `w` is a learned field,
and `ε²` is its flow-matching objective of 2.2. (Benton, Deligiannidis and Doucet 2024,
Theorem 1, for `p = 2` on `[0, 1]` with a time-dependent Lipschitz constant, the bound being
`ε exp (∫₀¹ L_t dt)`; Albergo and Vanden-Eijnden 2023, Proposition 3, equation (26), with the
constant `e^{1 + 2K}` for the squared distance; the bound above is proved here.)

**Checks.**

- The affine example of 5.1: the two laws differ by the translation
  `∫_a^b exp (K (b − t)) c t dt`, which is their `W_p` distance for every `p`, so the first
  inequality is an equality; with `c t = exp (K (b − t))` the Cauchy–Schwarz step is an equality
  too.
- `a > b`: `φ b` and `ψ b` are unconstrained by 1.1 and the right side is `0`, so `a ≤ b` is
  needed.
- `u t x = sin x + t`, `w t x = (4/5) tanh x + (9/10) t`, `μ = N(0, 1)` on `[0, 1]`, `p = 2`:
  the distance, the bound of the theorem and the two bounds of the display are
  `0.211 ≤ 0.316 ≤ 0.333 ≤ 0.471`.

*Needs:* 5.1; Tau Ceti `TauCeti.wassersteinEDist`, `TauCeti.wassersteinEDist_le`,
`TauCeti.IsCoupling`, `TauCeti.lintegral_Lp_lintegral_le`.

### Examples

Affine fields with a common linear part, for which every inequality of the layer is an equality.

### Dependencies

Layer 5 uses 1.1, Mathlib's comparison theorem for right derivatives, and Tau Ceti's Wasserstein
distance and Minkowski integral inequality.

## Downstream consumers

The discretization error of a numerical integrator applied
to the flows of Layer 1 adds to the bound of 5.2 by the triangle inequality for `W_p`.

## Scope and ownership

This roadmap owns:

- flows on a time interval of fields that are continuous in time and Lipschitz in space, their
  Lipschitz bounds and bijectivity, Liouville's formula and the density form of the transport
  (1.1, 1.2, 1.5 above);
- the identification of narrowly continuous solutions of the continuity equation for such fields
  with pushforwards by the flow (1.3, 1.4);
- marginal velocities of mixtures, the mixture theorem and the conditional flow-matching identity
  (Layer 2);
- interpolant paths of a coupling, the identities between velocity, noise mean and denoiser, the
  transport theorem and the convex-cost inequality of rectification (Layer 3);
- the passage from a distributional Fokker–Planck equation to the continuity equation with the
  probability-flow field (Layer 4);
- the comparison of two flows and the Wasserstein sampling-error bound (Layer 5).

It leaves to others, and does not restate:

- the continuity equation itself, its Lagrangian solutions and barycentric velocities of laws on
  curves, the Benamou–Brenier formula and displacement interpolations: these are
  [OptimalTransport](../OptimalTransport/README.md) 8.7, 8.8 and 9.1, and Tau Ceti already has
  `TauCeti.IsContinuityEquation` with the theorems named in the contracts. The barycentric
  velocity of a law on curves is the case of 2.1 above in which every conditional curve is a
  moving Dirac mass; 2.1 differs in allowing arbitrary conditional solutions. The superposition
  principle of OptimalTransport 8.7, which represents a solution for a Borel field by a law on
  integral curves, is not restated and not used: 1.4 above is the case of a Lipschitz field,
  proved by duality, where the conclusion is the pushforward by the flow;
- global flows of fields whose suspension `(t, x) ↦ (1, v t x)` is Lipschitz, already in Tau Ceti
  as `TauCeti.timeDependentFlow`, and flows on manifolds, which are
  [DifferentialGeometry](../DifferentialGeometry/README.md) Layer 3; 1.1 above differs in
  assuming only continuity in time. For a field that is jointly `C¹` with Lipschitz suspension,
  Tau Ceti already has the differentiability of that flow and its linearized equation
  (`TauCeti.contDiff_timeDependentFlow`, `TauCeti.hasDerivAt_fderiv_timeDependentFlow`); 1.2
  above differs in assuming only continuity in time, and in the determinant formula, which Tau
  Ceti does not have;
- Liouville's formula for linear systems, which is
  [DiracScatteringAndNonlinearFourierTransform](../DiracScatteringAndNonlinearFourierTransform/README.md)
  1.4;
- the density and the score of a law observed through Gaussian noise, Tweedie's formula,
  denoising score matching and the discrete-time diffusion chain, which are
  [DenoisingDiffusion](../DenoisingDiffusion/README.md), Layers 2 to 4; that roadmap leaves
  continuous time out, and this one owns the deterministic transport;
- stochastic differential equations, the Ornstein–Uhlenbeck process and the forward equation of
  the laws of a diffusion, which are [StochasticCalculus](../StochasticCalculus/README.md) 9.1,
  9.4 and 10.2; and the Fokker–Planck equation as a Wasserstein gradient flow, which is
  OptimalTransport 11.8.

Out of scope: fields that are only measurable in time or only locally Lipschitz in space, and
the superposition principle for non-Lipschitz fields; reverse-time stochastic differential
equations; likelihood bounds through changes of measure; Schrödinger bridges; flow matching on
manifolds and on discrete spaces; the approximation of velocity fields by parametric families
and the dynamics of training; and the discretization error of numerical integrators of the flow
equation.

Provenance: the repository [lean4-mlir](https://github.com/brettkoonce/lean4-mlir) (BSD-3, by the author of this
roadmap) contains a two-dimensional flow-matching demonstration on the linear interpolant with
Euler and Heun samplers (`demos/MainDiffusion2d.lean`, `LeanMlir/Ddpm.lean`) and no proofs of
this material.

## Exact supplier contracts

### From Mathlib

- `IsIntegralCurveOn` (`Mathlib/Analysis/ODE/Basic.lean`):
  `∀ t ∈ s, HasDerivWithinAt γ (v t (γ t)) s t`.
- `IsPicardLindelof.exists_eq_forall_mem_Icc_hasDerivWithinAt`
  (`Mathlib/Analysis/ODE/ExistUnique.lean`): on a complete space, under
  `IsPicardLindelof f t₀ x₀ a r L K` and `x ∈ closedBall x₀ r`, a curve `α` with `α t₀ = x` and
  derivative `f t (α t)` within `Icc tmin tmax` at each of its points.
- `ODE_solution_unique_of_mem_Icc_right` (same file): two curves continuous on `Icc a b` with
  right derivative `v t (·)` on `Ico a b`, staying in sets on which `v t` is `K`-Lipschitz and
  equal at `a`, agree on `Icc a b`.
- `dist_le_of_trajectories_ODE_of_mem` (`Mathlib/Analysis/ODE/Gronwall.lean`): for
  `∀ t ∈ Ico a b, LipschitzOnWith K (v t) (s t)` and two curves with values in `s t`, here
  `s t = univ`, and `dist (f a) (g a) ≤ δ`, `dist (f t) (g t) ≤ δ * exp (K * (t − a))` on
  `Icc a b`.
- `image_le_of_liminf_slope_right_le_deriv_boundary` (`Mathlib/Analysis/Calculus/MeanValue.lean`):
  a function continuous on `Icc a b` whose right lower slope is at most `B'` wherever it meets
  `B`, with `f a ≤ B a`, stays below `B`.
- `MeasureTheory.lintegral_image_eq_lintegral_abs_det_fderiv_mul`
  (`Mathlib/MeasureTheory/Function/Jacobian.lean`): for an additive Haar measure, a measurable
  set `s`, and `f` injective on `s` with derivative `f'` within `s`,
  `∫⁻ x in f '' s, g x = ∫⁻ x in s, ENNReal.ofReal |(f' x).det| * g (f x)` for every
  `g : E → ℝ≥0∞`.
- `MeasureTheory.Measure.bind` and `MeasureTheory.Measure.bind_dirac_eq_map`
  (`Mathlib/MeasureTheory/Measure/GiryMonad.lean`): for measurable `f`,
  `m.bind (fun x ↦ dirac (f x)) = m.map f`.
- `MeasureTheory.condExp`; `MeasureTheory.StronglyMeasurable.exists_eq_measurable_comp`
  (`Mathlib/MeasureTheory/Function/FactorsThrough.lean`): a function strongly measurable for the
  σ-algebra generated by `G` factors through `G`;
  `MeasureTheory.condExp_stronglyMeasurable_bilin_of_bound`
  (`Mathlib/MeasureTheory/Function/ConditionalExpectation/PullOut.lean`): for a finite measure, a
  bounded `m`-strongly-measurable factor comes out of the conditional expectation of a bilinear
  pairing with an integrable function.
- `ConvexOn.map_integral_le` (`Mathlib/Analysis/Convex/Integral.lean`): Jensen's inequality for a
  probability measure and a convex function continuous on a closed convex set, with `f` and
  `g ∘ f` integrable.
- `ConvexOn.map_condExp_le_of_finiteDimensional`
  (`Mathlib/MeasureTheory/Function/ConditionalExpectation/CondJensen.lean`): for `φ` convex on a
  finite-dimensional space and `f`, `φ ∘ f` integrable, `φ ∘ μ[f | m] ≤ᵐ μ[φ ∘ f | m]`.
- `integral_bilinear_hasLineDerivAt_right_eq_neg_left_of_integrable`
  (`Mathlib/Analysis/Calculus/LineDeriv/IntegrationByParts.lean`): integration by parts for line
  derivatives on a finite-dimensional space with an additive Haar measure, when the three
  products are integrable.
- `stdOrthonormalBasis` (`Mathlib/Analysis/InnerProductSpace/PiL2.lean`).

### From Tau Ceti

- `TauCeti.IsContinuityEquation`, `TauCeti.IsContinuityEquation.congr`,
  `TauCeti.isContinuityEquation_map`, `TauCeti.isContinuityEquation_dirac`
  (`TauCeti/MeasureTheory/OptimalTransport/ContinuityEquation/Basic.lean`): the definition quoted
  in Conventions; invariance under changing the field on null sets; the laws of a measurable
  family of curves that are almost surely absolutely continuous on `[a, b]`, follow `v`, and have
  finite expected length `∫⁻ ω, ∫⁻ t in Ioo a b, ‖v t (γ ω t)‖ₑ` solve the equation with `v`; a
  moving Dirac mass solves it.
- `TauCeti.IsContinuityEquation.intervalIntegral_integral_fderiv_eq_sub`
  (`TauCeti/MeasureTheory/OptimalTransport/ContinuityEquation/Endpoint.lean`): for a narrowly
  continuous curve of finite measures solving the equation and a bounded `C¹` function `u` on
  `ℝ × E` with bounded derivative,
  `∫ r in s..t, ∫ fderiv ℝ u (r, x) (1, v r x) ∂(ν r) = ∫ u (t, ·) ∂(ν t) − ∫ u (s, ·) ∂(ν s)`
  for `s, t ∈ [a, b]`.
- `TauCeti.exists_isContinuityEquation_map_smul_fst_add_smul_snd` and
  `TauCeti.exists_isContinuityEquation_map_smul_fst_add_smul_snd_of_isOptimalCoupling`
  (`TauCeti/MeasureTheory/OptimalTransport/ContinuityEquation/PlanInterpolation.lean`): for a
  finite measure `π` on `E × E` with `∫⁻ ‖z.2 − z.1‖ₑ ∂π < ∞`, the laws of
  `(1 − t) • z.1 + t • z.2` solve the equation on `(0, 1)` with a field whose value along the
  interpolation is the conditional expectation of `z.2 − z.1` given time and position; for an
  optimal coupling, `1 < p < ∞` and a strictly convex space, the field is the displacement.
- `TauCeti.timeDependentFlow` (`TauCeti/Dynamics/Flow/TimeDependent.lean`): for
  `LipschitzWith K (timeDependentSuspension v)` on a complete space, the map with
  `timeDependentFlow v hv s s x = x` and derivative `v t (timeDependentFlow v hv s t x)` in `t`.
- `TauCeti.contDiff_timeDependentFlow` and `TauCeti.hasDerivAt_fderiv_timeDependentFlow`
  (`TauCeti/Dynamics/Flow/Variational.lean`): if moreover `(t, x) ↦ v t x` is `C^(n+1)` on
  `ℝ × E`, the flow is `C^(n+1)` in `(s, t, x)`; if it is `C¹`,
  `u ↦ fderiv ℝ (timeDependentFlow v hv s u) x` has derivative `fderiv ℝ (v t) (φ x) ∘ fderiv ℝ φ x` at `t`, with `φ = timeDependentFlow v hv s t`.
  Named in the scope section only; no layer above uses them.
- `TauCeti.hasDerivAt_dysonSeriesLeft_apply` (`TauCeti/Analysis/ODE/DysonSeries.lean`): for a
  continuous path `M` of bounded operators on a complete space, `t ↦ dysonSeriesLeft M t x`
  solves `w' = M t w`.
- `TauCeti.IsCoupling` (`TauCeti/MeasureTheory/OptimalTransport/Coupling.lean`),
  `TauCeti.wassersteinEDist` and `TauCeti.wassersteinEDist_le`
  (`TauCeti/MeasureTheory/OptimalTransport/Wasserstein/Basic.lean`): the distance is the infimum
  over couplings of `eLpNorm (fun z ↦ edist z.1 z.2) p π`, and every coupling bounds it.
- `TauCeti.lintegral_Lp_lintegral_le` (`TauCeti/MeasureTheory/Integral/MinkowskiIntegral.lean`):
  Minkowski's integral inequality for a jointly almost everywhere measurable
  `f : α → β → ℝ≥0∞`, a σ-finite `μ`, an s-finite `ν` and a real `p ≥ 1`.

### From TauCetiRoadmap.DenoisingDiffusion

- 3.1: `smoothedDensity μ₀ c s`, the density of `c • X + s • Z` for `X` of law `μ₀` and an
  independent standard Gaussian `Z` on `EuclideanSpace ℝ (Fin d)`, `s > 0`, and its score
  `noisyScore μ₀ c s`.
- 3.2: Tweedie's formula in its noise form, `E[Z | c • X + s • Z] = −s • noisyScore μ₀ c s`,
  with no moment hypothesis on `μ₀`. In 3.1 above it is applied with `X` the target point,
  `Z` the source point, `c = α t` and `s = β t > 0`.

### From TauCetiRoadmap.DiracScatteringAndNonlinearFourierTransform

- 1.4: Liouville's formula `det N(t, s) = exp (∫_s^t tr P)` for the propagator `N` of the linear
  system `Y' = P Y` with an integrable matrix coefficient `P` on an interval.
- 1.7: the nonlinear Carathéodory theorem: for a field on a Banach space that is measurable in
  time, Lipschitz in space with an integrable constant `L` and bounded at one point by an
  integrable `m`, the integral equation has a unique continuous solution on the interval.

### From TauCetiRoadmap.OptimalTransport

- 8.7 and 8.8: the owner of the continuity equation and of the Benamou–Brenier formula, whose
  Tau Ceti declarations are listed above; 9.1: displacement interpolations, named in the Examples
  of Layer 3.

### From TauCetiRoadmap.StochasticCalculus

- 9.4: the Ornstein–Uhlenbeck equation `dX = −λX dt + σ dB` and its explicit solution; 10.2: the
  forward equation for the laws of a solution, in distributional form against compactly supported
  smooth test functions. Both are used only in the Examples of Layer 4.

## References

- M. S. Albergo and E. Vanden-Eijnden, *Building normalizing flows with stochastic
  interpolants*, ICLR 2023, arXiv:2209.15571 (version 3).
- J. Benton, G. Deligiannidis and A. Doucet, *Error bounds for flow matching methods*,
  Transactions on Machine Learning Research, 2024, arXiv:2305.16860 (version 2).
- R. T. Q. Chen, Y. Rubanova, J. Bettencourt and D. Duvenaud, *Neural ordinary differential
  equations*, NeurIPS 2018, arXiv:1806.07366 (version 6).
- Y. Lipman, R. T. Q. Chen, H. Ben-Hamu, M. Nickel and M. Le, *Flow matching for generative
  modeling*, ICLR 2023, arXiv:2210.02747 (version 2).
- X. Liu, C. Gong and Q. Liu, *Flow straight and fast: learning to generate and transfer data
  with rectified flow*, arXiv:2209.03003 (version 1), 2022.
- Y. Song, J. Sohl-Dickstein, D. P. Kingma, A. Kumar, S. Ermon and B. Poole, *Score-based
  generative modeling through stochastic differential equations*, ICLR 2021, arXiv:2011.13456
  (version 2).
