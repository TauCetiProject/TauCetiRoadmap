# Roadmap: adaptive time stepping and error control for ODEs

**Summary.** Develop adaptive one-step integration of ordinary differential equations
`y′ = f(t,y)` on a finite interval. The main results distinguish three questions:
what an embedded Runge–Kutta difference estimates, when a step-selection procedure
reaches the final time after finitely many trials, and when the computed trajectory
satisfies a prescribed global error bound. Embedded differences approximate the
lower-order method's local error under explicit remainder hypotheses. Continuous
reconstructions with bounded residuals provide rigorous global bounds for Lipschitz
fields. Geometric rejection terminates locally when all sufficiently small steps
are accepted. A uniform version of that condition, together with a lower bound
on subsequent proposals, gives finite completion. This covers both a fixed-growth
policy and a clipped error-based controller under a uniform indicator bound.

OneStepMethodsForODEs supplies variable-step meshes, numerical recurrences,
Runge–Kutta tableaux, named methods and their convergence estimates. Mathlib's ODE
and Grönwall APIs supply the continuous stability estimate used for residual
certificates. These interfaces apply to any supplied one-step update and continuous
reconstruction satisfying the hypotheses. PopulationDynamics is a source of example
fields; the same interfaces apply to finite-dimensional systems obtained by spatial
discretisation, with their actual Lipschitz and residual bounds.

Layer 1 constructs embedded indicators and proves their precise interpretation.
Layer 2 builds residual certificates. Layer 3 defines acceptance and step proposals.
Layer 4 proves termination and finite progress. Layer 5 connects the generated
mesh to global error control and tolerance convergence.

## Conventions

- Work in a real normed space `E`. Assume completeness for the integral proof of
  the interpolation remainder in 2.2. The componentwise tolerance rule uses
  `E = ι → ℝ` for a finite index type `ι`, with its maximum norm.
  The abstract error and controller theorems do not require finite dimension.
- The integration interval is `[a,T]`, with `a≤T`; `b` and `b̂` denote tableau
  weights. Write `p` for the lower method's order, `pH>p` for the higher order,
  and `r` for an indicator's power of the step size. For a consecutive-order
  embedded pair, `r=p+1=pH`.
- Use time-first fields and Mathlib `IsIntegralCurveOn y f (Set.Icc a T)`.
  Assume a supplied exact solution on `[a,T]`; the numerical analysis does not
  prove existence of the original IVP. All stability estimates state whether
  Lipschitz bounds are global or restricted to a set containing both curves.
- Reuse OneStepMethodsForODEs `meshNode`, `oneStepSeq`, `oneStepDefect`,
  `ButcherTableau`, `IsStage` and `increment`. A step map is
  `Ψ(t,u,h) = u + h • Φ(t,u,h)`. Accepted steps have `h > 0`, end at or before
  `T`, and stop at `T`; rejected trials advance neither time nor state.
- A local error starts from the exact value of a *restarted* IVP at the trial
  state `u`. It is not the error from the original initial condition.
- For an embedded pair, `ΨH` is the higher-order update, `ΨL` the lower-order
  update, and the signed difference is `Δ = ΨH − ΨL`. The default accepted
  update is `ΨH`. A residual certificate must reconstruct this actual update.
- Use `η≥0` for an unnormalised indicator, `tol>0` for its threshold,
  `w≥0` for a dimensionless normalised indicator, `τ≥0` for a residual bound,
  and `Tol>0` for a desired global error bound.
  Distinguish error per step `η≤tol` from error per unit time `η≤hτ`.
  An indicator threshold and a desired global error tolerance are different data.
- Arithmetic is exact. A residual supremum or a smoothness bound is supplied
  with a proof. Sampling a residual or numerically integrating its norm does
  not by itself establish a bound. Executable floating-point refinement and
  interval enclosure machinery are outside the scope.

## Layer 1: embedded estimates and their limits

### 1.1 Shared stages

An embedded pair consists of an explicit supplier tableau `(A,b,c)` and a second
weight vector `b̂`. Use the same stage vector for both outputs; prove
`ΨH − ΨL = h • ∑ i, (b i − b̂ i) • k i`. Prove equality with the two supplier
increments, using explicit-stage uniqueness.

Instantiate the Heun–Euler 2(1) pair with the supplier's Heun stages and lower
weights `(1,0)`. Also instantiate the Bogacki–Shampine 3(2) pair with

```
c = (0, 1/2, 3/4, 1)
A = ((0,0,0,0), (1/2,0,0,0), (0,3/4,0,0), (2/9,1/3,4/9,0))
b = (2/9,1/3,4/9,0),   b̂ = (7/24,1/4,1/3,1/8).
```

Verify orders two/one and three/two with the supplier's order conditions, including
failure of the next order. Prove that the fourth stage of the 3(2) pair evaluates
the field at its higher-order endpoint. It can serve as the next first stage only
after an accepted step with that endpoint, the same field and no intervening reset.
Rejected trials do not change the accepted initial state.

**Checks.** For `u′=u`, `z=h`, Heun–Euler has difference `u z²/2`.
The 3(2) pair has difference `−u(z³+z⁴)/48`. At `h=0` both differences vanish.

*Needs:* OneStepMethodsForODEs 2.1, 3.1–3.2, 4.1–4.3. The 3(2) coefficients are
the Bogacki–Shampine pair; check them by the displayed algebraic conditions.
Süli, Definition 15 and Example 7 (printed p. 58), give embedded pairs and
the Heun–Euler tableau.

### 1.2 Reliability statements with hypotheses

Let `x(t)=u` and write `eL=x(t+h)−ΨL`, `eH=x(t+h)−ΨH`. Prove
`eL−Δ=eH`, hence `|‖eL‖−‖Δ‖| ≤ ‖eH‖`. A supplied bound
`‖eH‖ ≤ C h^(pH+1)`, `C≥0`, gives two-sided bounds for `‖eL‖` with this additive
remainder. This theorem also applies to numerical trial states, using their
restarted solution and bounds uniform over those states.

Prove asymptotic exactness at a fixed `(t,u)` when
`(h^(p+1))⁻¹ • eL → v ≠ 0` and `(h^(p+1))⁻¹ • eH → 0` as `h → 0+`:
`‖Δ‖/‖eL‖ → 1` (`embedded_asymptotically_exact`). These are scalar multiplications in `E`.
The nonzero limit is needed for the relative-error conclusion. This conclusion
concerns the lower-order local error even when the higher-order update is accepted.

**Check.** On `[0,1]`, `f(t,u)=t(1−t)`, initial value zero, Heun–Euler with
one step has both outputs zero and indicator zero, but the exact endpoint is
`1/6`. Prove this as a counterexample to unconditional reliability or global
accuracy from a small embedded difference.

*Needs:* 1.1; norm inequalities and limits in Mathlib. The identity and
counterexample are elementary targets here. Süli §5 motivates the distinction
between an embedded estimate and the true local error.

### 1.3 A uniform indicator bound for Heun–Euler

At any trial state `(t,u)`, set `k1=f(t,u)` and `k2=f(t+h,u+h k1)`.
Prove `Δ=(h/2) • (k2−k1)`. If `h≥0`, `f(t+h,·)` is `L`-Lipschitz,
and `‖f(t+h,u)−f(t,u)‖≤M_t h`, with `M_t,L≥0`, prove
`‖Δ‖≤(M_t+L‖f(t,u)‖)h²/2`.
Consequently a uniform bound `M_t+L‖f(t,u)‖≤C_f` over the admissible trials
gives `C_Δ=C_f/2` and exponent `r=2` for 4.3. This supplies a concrete
completion theorem for the embedded Heun–Euler controller without invoking a
restarted exact solution or assuming estimator reliability.

**Check.** For `f(t,u)=u`, take `M_t=0`, `L=1`; the bound is an equality.

*Needs:* 1.1 and the triangle and Lipschitz inequalities.

## Layer 2: continuous reconstructions and residual certificates

### 2.1 Piecewise residual bounds

On each accepted interval `[t_n,t_(n+1)]`, supply a continuous curve `U_n`
with endpoints `Y_n,Y_(n+1)`, a right derivative on the half-open interval,
and a bound `‖U_n′(t)−f(t,U_n(t))‖ ≤ ε_n`, `ε_n ≥ 0`.
Assume `f(t,·)` is `L`-Lipschitz, `L ≥ 0`. Define `residualBudget`, written `B_n`, by

```
B_0 ≥ ‖y(a)−Y_0‖,
B_(n+1) = gronwallBound B_n L ε_n h_n.
```

Prove `‖y(t)−U_n(t)‖ ≤ gronwallBound B_n L ε_n (t−t_n)` on each interval
(`meshwise_reconstruction_error_le`).
Glue the curves into a continuous reconstruction and deduce nodal and uniform
error bounds. Derivatives need not match at mesh nodes. Give the local-Lipschitz
version with explicit membership of both curves in the sets on which the bound
holds; do not infer that membership from an unproved error estimate.

Prove the weighted recurrence formula, with `t_0=a` and `h_n=t_(n+1)−t_n`,

```
B_N = exp(L(t_N−a)) B_0
      + ∑ j < N, exp(L(t_N−t_(j+1))) gronwallBound 0 L ε_j h_j.
```

For `L=0`, this is `B_N=B_0+∑ j<N, ε_j h_j`.

**Checks.** For `f=0`, `y=0`, `U(t)=(t−a)v`, and zero initial error, the
bound is exactly `(t−a)‖v‖`. Nonuniform steps must be
weighted by their own lengths. A zero-step interval is excluded from reconstruction
quotients, and `a=T` is handled by returning the initial state.

*Needs:* Mathlib `dist_le_of_approx_trajectories_ODE` and its `_of_mem` version;
supplier mesh identities; finite induction and continuous gluing. This is a
meshwise application of an existing stability theorem.

### 2.2 Euler and Heun certificates

For Euler, use `U(t+s)=u+s f(t,u)`. If `f` is `L`-Lipschitz in state and
`‖f(t+s,u)−f(t,u)‖ ≤ M_t s` for `0≤s≤h`, prove
`‖U′−f(t+s,U)‖ ≤ (M_t+L‖f(t,u)‖)s`.
Thus `ε=(M_t+L‖f(t,u)‖)h` is a certified residual envelope.

For Heun, let `k1=f(t,u)`, `k2=f(t+h,u+h k1)` and use
`U(t+s)=u+s k1+(s²/(2h))(k2−k1)`, `h>0`. Prove its endpoint and derivative
identities. Its residual `r(s)` has `r(0)=0` and
`‖r(h)‖ ≤ Lh‖k2−k1‖/2`. If `r` is twice continuously differentiable and
`‖r″(s)‖ ≤ M_r` on `[0,h]`, prove

```
‖r(s)‖ ≤ (s/h)‖r(h)‖ + (M_r/2)s(h−s),
ε = Lh‖k2−k1‖/2 + M_r h²/8.
```

Build the vector-valued linear-interpolation remainder bound used here from the
fundamental theorem of calculus and a Green-kernel integral; its integral norm
is `s(h−s)/2`. To discharge the second-derivative bound, put
`F(t,u)=f(t,u)` and assume `F` is `C²` on an open neighbourhood of the lifted
curve `s↦(t+s,U(t+s))`. Given operator bounds `‖DF‖≤M1`, `‖D²F‖≤M2`
on that curve and `‖k2−k1‖≤K_stage h`, with `M1,M2,K_stage≥0`, prove that
`M_r = M2(1+‖k1‖+K_stage h)²+M1 K_stage` suffices. Use the product norm
bound by the sum of component norms. All derivative and stage-difference bounds
must hold for the trial being certified.

**Checks.** For `f(t,u)=t`, the Heun reconstruction is exact and `r=0`.
For `f(t,u)=u`, `u=1`, `t=0`, its residual is `−s²/2`, including the endpoint
value `−h²/2`. The exact residual bound is `h²/2`.

*Needs:* 2.1; named Euler/Heun methods from OneStepMethodsForODEs; Mathlib
derivative, integral and norm APIs. The displayed certificates and remainder
bound are derived here. General high-order dense output is not required.

## Layer 3: acceptance rules and step proposals

### 3.1 Scaled indicators

For a componentwise indicator `Δ`, states `u,v : ι → ℝ`, `atol_i>0`, `rtol_i≥0`,
define `toleranceScale`, written `s_i=atol_i+rtol_i max(|u_i|,|v_i|)`, and
`scaledError`, written `w=‖fun i ↦ Δ_i/s_i‖`, using the existing function-space norm. Prove positivity
of every scale and `w≤1` iff all `|Δ_i|≤s_i`. The empty index type gives `w=0`.
Prove invariance under positive changes of units in each component: multiply
`u_i,v_i,Δ_i,atol_i` by `λ_i>0` and leave `rtol_i` unchanged.
For embedded stepping take `v=ΨH(t,u,h)`. These tolerances concern the indicator.

Separately define acceptance from a certified residual envelope `ε≤τ`. In
this mode `τ` has units of state per time. Acceptance uses the certificate for
the method that advances the state.

### 3.2 Proposals, rejection and exact state transitions

For an indicator exponent `r : ℕ`, `r≥1`, safety `0<σ<1`, and limits
`0<gmin<1<gmax`, define `proposalFactor`, written `G(w)`, by
`gmax` if `w=0`, and `min(gmax,max(gmin,σ w^(−1/r)))` otherwise.
Prove `gmin≤G(w)≤gmax` and `G(w)≥1` whenever `0≤w≤σ^r`.
If `η(h)=C h^r` with `C>0` and a fixed positive threshold, the unclipped
proposal gives new normalised error `σ^r`.
This calculation is conditional on the power law, not a controller-stability theorem.
For error per unit time `η(h)/h`, the exponent becomes `r−1`, requiring `r≥2`.
The denominator must be fixed for this exact power-law calculation; state-dependent
relative-tolerance scales need their own bound, as in 4.3.

Define a trial transition with accepted state `(t,u)`, proposed step, acceptance
test, and trial output. Clip the initial trial at `T−t`; on rejection multiply
the trial step by a fixed `θ∈(0,1)` and keep `(t,u)` unchanged. On acceptance
advance to `(t+h,Ψ(t,u,h))` for the supplied step map. For an embedded pair use
`Ψ=ΨH`; the same transitions also admit Euler or another supplied one-step method.
At `t=T` stop without evaluating the field.
Represent accepted state and proposal by `AdaptiveState`. Define `acceptedStep`
using the least successful geometric trial, `adaptiveTransition` for its update,
and `adaptiveRun` by iteration. If no trial succeeds, `acceptedStep` has the
explicit fallback zero; the termination theorems exclude that case before `T`.
The run is constant after completion. These are noncomputable mathematical
sequences, not executable solver targets.
Prove preservation of these transition invariants and that accepted traces are
the supplier's `oneStepSeq` for their accepted step sequence.

*Needs:* 1.1, Mathlib real powers and finite maxima; supplier numerical recurrence.
An I-controller chooses the next step from the current normalised indicator alone;
here its proposed step is `hG(w)`, capped by `Hmax>0`. Rejection uses the separate
geometric rule above, so the full policy is unambiguous.

## Layer 4: finite rejection and progress

### 4.1 Local termination

For a fixed trial state, suppose there is `δ>0` such that every admissible
`0<h≤δ` is accepted. Prove a geometric rejection loop starting at `H>0`
terminates: its first accepted trial occurs no later than any index `k` with
`θ^k H≤δ`. Define `FirstAccepted` to record success and failure of all earlier trials.
Supply the first-accepted-index construction (`acceptedStep_spec`) and prove that all
earlier trials are rejected. No monotonicity of the indicator is needed.

Derive the small-step hypothesis from `0≤η(t,u,h)≤C h^r`, `r≥1`, `C≥0`,
with a positive absolute threshold. Treat `C=0` separately. For an error-per-unit-time
threshold require `r≥2`. For a normalised componentwise rule, use the strictly
positive minimum absolute tolerance to obtain a sufficient small-step bound.

### 4.2 A reusable finite-progress theorem

State the conclusion for `adaptiveRun` as `adaptiveRun_completion`.

Start with `H0∈(0,Hmax]`. After an accepted step of length `h`, let the
uncapped next proposal be `P`. Assume constants `κ∈(0,1]` and `δ_g>0` satisfy
`P≥κh` always and `P≥h` whenever `h≤δ_g`. Cap the proposal at `Hmax`, clip
at the remaining time, and reject by 4.1. Also assume a *uniform* `δ_a>0`
such that every admissible trial of length at most `δ_a` is accepted at every
reachable accepted state. Bounds on proposals concern the accepted trial's
data, not data from an earlier rejected trial.

Prove that every accepted nonfinal step has length at least
`m=min(H0,θδ_a,κδ_g)>0`. Consequently the method reaches `T` after at most
`⌈(T−a)/m⌉+1` accepted steps and finitely many trials.

Route: after a nonfinal accepted step of length at least `m`, either `h≤δ_g`
and the proposal does not shrink, or `h>δ_g` and `P≥κh>κδ_g≥m`.
Capping at `Hmax≥H0≥m` preserves this lower bound. If clipping to the remaining
interval makes the trial smaller than `m`, it is below `δ_a` and is accepted
as the final step. Otherwise the first-accepted bound of 4.1 gives a step of
length at least `m`. Induction and the Archimedean property give completion.
Local rejection termination alone does not supply the uniform hypotheses.

As a corollary, for fixed growth `P=γh`, `γ≥1`, recover the sharper bound
`m=min(H0,θδ_a)`. No indicator monotonicity is required in either theorem.

**Checks.** Positive accepted steps `h_n=2^(−n−2)` have total length `1/2`;
they do not reach time `1`. Acceptance alone cannot exclude this failure.
An initial trial longer than the remaining interval is clipped to the endpoint.

*Needs:* 3.2, 4.1; geometric convergence and Archimedean bounds in Mathlib.
The proposal conditions and finite-progress theorem are targets of this roadmap.

### 4.3 Completion for the clipped I-controller

Use `indicatorProposal` in `adaptiveRun`; the result is `indicatorRun_completion`.

For 3.2, accept when `w(t,u,h)≤1`. Suppose `0≤w(t,u,h)≤C_w h^r`,
`C_w≥0`, uniformly over all reachable accepted states and all admissible trial
steps up to `Hmax`. When `C_w>0`, take
`δ_a=(1/C_w)^(1/r)`, `δ_g=(σ^r/C_w)^(1/r)` and `κ=gmin`.
The power bound gives small-step acceptance, and 3.2 gives nonshrinking proposals
for accepted steps `h≤δ_g`; apply 4.2. When `C_w=0`, every trial is accepted
and proposes the maximal growth factor; take `δ_a=δ_g=Hmax`.

For componentwise scaling, derive `C_w=C_Δ/a_min` from
`‖Δ(t,u,h)‖≤C_Δ h^r` and `atol_i≥a_min>0`. This bound remains valid with
relative tolerance because its contribution to every denominator is nonnegative.
For nonempty finite component sets one can take `a_min=min_i atol_i`; the empty
case has indicator zero. For residual control, use `w=ε/τ` with `τ>0`.

These conclusions establish completion, not linear stability of the controller
or reliability of an embedded estimate. The constants must be uniform on the
reachable states. In particular a bound proved only along the exact solution
does not discharge this hypothesis.

*Needs:* 3.1–3.2 and 4.2. This is a direct application of the proposal bounds;
it supplies the connection between error-based proposals and finite completion.

## Layer 5: global accuracy on adaptive meshes

### 5.1 Residual-controlled global tolerance

Suppose `a<T`, the initial state is exact, and each accepted reconstruction has
residual at most `τ≥0`. Prove the uniform bound
`‖y(t)−U(t)‖≤gronwallBound 0 L τ (T−a)`.
Given `Tol>0`, define `residualTolerance` by
`τ=Tol/gronwallBound 0 L 1 (T−a)`; prove the denominator
positive and the resulting trajectory bound at most `Tol`
(`global_reconstruction_tolerance`). Include initial uncertainty via
the additive term `exp(L(T−a)) B0` and a strictly positive remaining budget.

For the Euler certificate, a uniform bound `M_t+L‖f(t,u)‖≤C` on reachable
states supplies the threshold of 4.2, since `ε≤Ch`. For Heun, uniform
`‖k2−k1‖≤K_stage h` and `M_r≤M` give
`ε≤(L K_stage/2+M/8)h²` and supply that threshold.
Thus these hypotheses give both finite completion and a global certificate.
For the I-controller apply 4.3 to `w=ε/τ`, with exponent one for Euler and two
for Heun. The state/derivative bounds are obligations of this application.

### 5.2 Convergence without estimator reliability

For an embedded-indicator controller, require a separate step cap `H(Tol)>0`
with `H(Tol)→0` as `Tol→0+`, completion at `T`, a uniform Lipschitz bound for its increment,
and the supplier's uniform defect bound `C h^(p_step+1)`, `C≥0`, `p_step≥1`, for the
method that advances the state (`p_step=pH` for the embedded pairs). Allow the
initial numerical state to depend on tolerance, and require
`δ(Tol)=‖y(a)−Y_0(Tol)‖→0` as `Tol→0+`; exact initial data is a special case.
Apply OneStepMethodsForODEs 1.4 to obtain, for every accepted node,

```
‖y(t_n)−Y_n‖ ≤ gronwallBound δ(Tol) L (C H(Tol)^p_step) (T−a).
```

Both the initial-error and defect terms tend to zero, so the maximum nodal error
on the completed adaptive mesh tends to zero (`nodal_error_tendsto_zero`).
Combine this cap with 4.2 or 4.3 for each fixed positive tolerance. All error-bound
constants are independent of tolerance; the termination constants may depend on
it. The cap is needed in this theorem because small embedded differences need
not force small steps. No cost-optimality assertion is made.

**Checks.** `L=0` gives the exact budget `τ(T−a)`. With nonzero initial error,
even a zero residual cannot remove that error. In particular, for `f=0`, `y=0`
and `Y_0(Tol)=1`, Euler and the embedded pairs retain nodal error one on every
mesh despite a vanishing step cap. This is excluded by the initial-discrepancy
hypothesis of 5.2. The Heun–Euler blind spot in 1.2 must not acquire a certificate
merely by passing the indicator test.

*Needs:* Layers 2–4; OneStepMethodsForODEs 1.4. The global budget and controller
composition are targets here, built from the stated supplier estimates.

## Downstream consumers

- For a Lipschitz observation `g : E → F` with constant `K`, prove the nodal
  consequence `‖g(y(t_n))−g(Y_n)‖≤K B_n`. This applies to selected components,
  weighted totals and other observables without rebuilding the time-step theory.
- Finite-dimensional models from PopulationDynamics can supply a field and
  bounds on a region containing both curves. Reuse the local version of 2.1;
  positivity and conservation of their numerical updates require separate proofs.
- For a spatially discretised PDE, apply the abstract theory to its ODE system
  in the chosen norm. Constants may depend on the spatial mesh; the theorem
  controls temporal error relative to the semidiscrete solution. Spatial error
  and stiffness-independent bounds require their own analysis.

These applications use the same abstract reconstruction and controller APIs.
The observation estimate is a required corollary; the two classes of models
explain how to use the interfaces and do not add new model-specific targets.

## Scope and ownership

This roadmap owns embedded-pair differences, their conditional interpretation,
Euler/Heun continuous reconstructions for residual certification, tolerance
scaling, trial-state transitions, the specified termination theorems, and the
composition of residual budgets with adaptive meshes.

OneStepMethodsForODEs retains ownership of meshes, generic one-step stability and
convergence, tableaux, Euler/Heun methods, order conditions, stability regions,
and invariant preservation. LinearMultistepMethods owns constant-step multistep
theory. ExponentialIntegrators owns its semilinear methods and error bounds.
DiffusionODESamplerGuarantee owns distributional errors for diffusion samplers.

Excluded: variable-order or variable-step multistep theory; stiffness-independent
accuracy; PI/PID controller stability; event location and discontinuous fields;
SSP and positivity theory; general dense-output families; adjoint-weighted error
estimation; stochastic adaptation; optimal complexity; floating-point solvers.

## Exact supplier contracts

### From OneStepMethodsForODEs

- 1.1–1.2: `meshNode`, `oneStepSeq`, `oneStepDefect`, their recurrences and mesh
  identities. Acceptance traces reuse these objects once the steps are selected.
- 1.4: `norm_sub_oneStepSeq_le`, with a uniform defect and increment Lipschitz
  bound, for the mesh-cap convergence theorem.
- 2.1: `ButcherTableau.IsStage`, `increment`,
  `existsUnique_isStage_of_isExplicit`, for shared-stage embedded pairs.
- 3.1–3.2: explicit Euler and Heun definitions; no duplicated method definitions.
- 4.1–4.3: `OrderConditions` and `hasOrder_iff_orderConditions` for explicit
  tableaux with row-sum nodes and order at most four.

These are roadmap contracts, not claims that their implementation has landed.

### From Mathlib

- `IsIntegralCurveOn` in `Analysis/ODE/Basic.lean` for supplied exact solutions.
- `dist_le_of_approx_trajectories_ODE` and
  `dist_le_of_approx_trajectories_ODE_of_mem` in `Analysis/ODE/Gronwall.lean`:
  continuous curves, right derivatives, bounded residuals, a Lipschitz field,
  and initial distance yield `gronwallBound` on the interval.
- `gronwallBound`, `gronwallBound_K0`, `gronwallBound_mono`,
  `gronwallBound_x0`: continuous error envelopes including the zero-Lipschitz case.
- Standard norm, finite-sum, real-power, derivative, interval-integral and
  geometric-limit APIs. The reconstruction remainder theorem and finite-progress
  theorem are explicit new targets above, not assumed library facts.

## References

- Endre Süli, *B6.1 Numerical Solution of Differential Equations I: Initial-value
  problems*, 25 February 2022, §5, pp. 56–58, equations (94)–(96), Definition 15 and Example 7: embedded
  differences and local step-size proposals.
  <https://people.maths.ox.ac.uk/suli/nsde.pdf>.
- Hendrik Ranocha and Jan Giesselmann, *Stability of step size control based on
  a posteriori error estimates*, arXiv:2307.12677v3 (2024), §2 and §2.1:
  embedded versus residual indicators and continuous reconstruction. Our
  piecewise normed-space bound uses Mathlib's Lipschitz trajectory theorem;
  their one-sided-Lipschitz energy analysis and controller-stability results
  are not claimed here. <https://arxiv.org/html/2307.12677v3>.
- P. Bogacki and L. F. Shampine, *A 3(2) pair of Runge–Kutta formulas*, Applied
  Mathematics Letters 2 (1989), 321–325. Attribution for the named coefficient
  pair; the displayed coefficients and order claims are checked directly.
