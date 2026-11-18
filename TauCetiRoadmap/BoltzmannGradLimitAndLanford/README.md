# Roadmap: the Boltzmann–Grad limit and Lanford's theorem

**Summary.** Prove Lanford's theorem for hard spheres on the unit torus in the grand canonical
setting: for every dimension `d ≥ 2`, the proposition `HardSphere.LanfordStatement d` of
HardSphereDynamicsAndKineticLimits §10.4 holds. For nonnegative initial data satisfying
`|f⁰(x, v)| + |∇ₓf⁰(x, v)| ≤ C₀ exp(−β₀|v|²/2)`, with `C₀ ≥ 1` and `β₀ > 0`, there is a time
`T₀ > 0`, depending only on `d`, `C₀` and `β₀`, such that in the Boltzmann–Grad scaling
`μ_ε = ε^{−(d−1)}` the correlation functions of the hard-sphere gas converge on `[0, T₀]` to the
tensor powers of a mild solution of the Boltzmann equation. The route is the one of Gallagher,
Saint-Raymond and Texier:
the BBGKY hierarchy of the correlation functions and its formal limit, the Boltzmann hierarchy;
their Duhamel series and uniform a priori bounds in weighted spaces on a time interval independent
of `ε`; the pseudo-trajectories attached to collision trees; the geometric estimates that discard
recollisions; and the term-by-term convergence of the two series.

## Scope and ownership

This roadmap owns the BBGKY hierarchy of the hard-sphere gas on the torus, the Boltzmann
hierarchy, their Duhamel series, the weighted norms in which both are estimated, collision trees
and pseudo-trajectories, the estimates on recollisions, and the proof of
`HardSphere.LanfordStatement d` for `d ≥ 2`.

Left to other roadmaps, by name and section:

- **HardSphereDynamicsAndKineticLimits** owns the microscopic model and the statement: flat
  position spaces and the unit torus (§§1.1, 1.3), elastic scattering (Layer 2), the hard-sphere
  flow and its measure preservation (Layer 7), marginals (§8.3), grand canonical measures and
  correlation functions (§§9.3, 9.5), initial chaos and the Boltzmann–Grad scaling (§9.6), the
  empirical measure (§10.1), the Boltzmann collision operator (§10.2), mild solutions of the
  Boltzmann equation (§10.3) and the proposition `HardSphere.LanfordStatement` (§10.4). This
  roadmap proves that proposition; it restates none of these objects.
- This roadmap owns short-time existence for the Boltzmann Cauchy problem and uniqueness for the
  Boltzmann hierarchy, as needed to identify the hierarchy limit. The Cauchy problem beyond this
  short time, the H theorem and collision invariants belong to the roadmap on the Boltzmann
  equation named in HardSphereDynamicsAndKineticLimits, Scope and ownership.
- Fluctuations and large deviations of the empirical measure, long-time derivations and
  short-range potentials belong to the roadmaps listed in HardSphereDynamicsAndKineticLimits,
  Downstream consumers.

## Conventions

- **Scaling.** The fugacity is `μ_ε = ε^{−(d−1)}`, as in HardSphereDynamicsAndKineticLimits,
  Conventions; correlation functions are rescaled by `μ_ε^{−n}` as there.
- **Weights and traces.** Write `E = ℝᵈ` for velocity space and
  `\overline{𝒟⁽ε⁾ₙ}` for the closed `n`-particle hard-core phase space of
  HardSphereDynamicsAndKineticLimits. For `β > 0`, let `X_{ε,n,β}` consist of functions continuous
  on `\overline{𝒟⁽ε⁾ₙ}` with
  `|g_n|_{ε,n,β} = sup_{Z_n ∈ \overline{𝒟⁽ε⁾ₙ}} |g_n(Z_n)| exp(β |V_n|² / 2) < ∞`.
  For `ε = 0`, let `X_{0,n,β}` be the continuous functions on the full phase space with the
  corresponding norm `|g_n|_{0,n,β}`. For a sequence `G = (g_n)_{n ≥ 1}`, set
  `‖G‖_{ε,λ,β} = sup_{n ≥ 1} e^{λn} |g_n|_{ε,n,β}`, where `λ ∈ ℝ`; write
  `‖G‖_{0,λ,β}` for the limiting hierarchy. Continuity up to contact is
  required because the collision operators evaluate boundary traces; essential-supremum
  equivalence classes do not determine those traces. The parameters `β` and `λ` decrease linearly
  in time in Layer 3. The symbol `λ` is distinct from the fugacity `μ_ε`.

  **Check.** If `g_n(Z_n) = exp(−β'|V_n|²/2)` for `β' > β`, then
  `|g_n|_{ε,n,β} = 1`, attained at `V_n = 0`; the sequence norm is `e^λ` for `λ ≤ 0` and
  infinite for `λ > 0`.
- **Collision trees.** The particles added by the collision operators are numbered in the order in
  which they appear in the Duhamel expansion, backwards in time; each added particle is attached
  to one earlier particle, which defines a tree.
- **Initial data.** The datum `f⁰` is continuous, nonnegative, differentiable in position, and
  satisfies the Gaussian bound in the Summary; the same bound on `∇ₓf⁰` gives the required
  position regularity.

## Exact supplier contracts

**From Mathlib.** Lebesgue and Bochner integration on products of Euclidean spaces, suprema of
continuous functions, the exponential, and convergence along filters.

**From Tau Ceti.** Nothing beyond what HardSphereDynamicsAndKineticLimits consumes.

**From HardSphereDynamicsAndKineticLimits.** §1.1 (`FlatPositionSpace`), §1.3 (the unit torus),
Layer 2 (`HardSphere.scatter`), §7.1 (`HardSphere.flow`), §7.2
(`HardSphere.measurePreserving_flow`), §8.3 (marginals), §9.3 (`HardSphere.grandCanonical`),
§9.5 (`HardSphere.correlation`), §9.6 (initial chaos), §10.2 (`HardSphere.collisionOperator`), §10.3
(`HardSphere.IsMildBoltzmannSolution`) and §10.4 (`HardSphere.LanfordStatement`).

## How to read the build

Layer 1 writes the evolution of the correlation functions as the BBGKY hierarchy, in Duhamel form.
Layer 2 writes its formal limit, the Boltzmann hierarchy, and shows that the tensor powers of a
mild solution of the Boltzmann equation solve it. Layer 3 bounds both Duhamel series uniformly in
`ε` on a short time interval. Layer 4 represents each term of the series by pseudo-trajectories
indexed by collision trees and bounds the set of parameters that produce recollisions. Layer 5
compares the two series term by term and proves Lanford's theorem.

## Layer 1: The BBGKY hierarchy

### 1.1 Collision operators of the hierarchy

For `n ≥ 1`, `ε > 0`, `β' > β > 0`, and `g ∈ X_{ε,n+1,β'}`, define
`C^ε_{n,n+1} g(Z_n) = Σ_{i=1}^n ∫_{S^{d−1} × E} ω · (w − v_i)
g(Z_n, (x_i + εω, w)) dω dw`, using surface measure on the unit sphere and Lebesgue measure on
`E`; `ω` points from particle `i` to the added particle. The factor `μ_ε ε^{d−1} = 1` is
absorbed by the correlation rescaling in the Conventions.
Prove that this boundary-trace operator maps into `X_{ε,n,β}` (GST2013 (4.3.2), p. 31;
BGSS2023 (3.1.3), p. 25). Extend functions by zero to forbidden configurations as in
HardSphereDynamicsAndKineticLimits §9.5.

**API.**

- Linearity in `g`.
- The pointwise estimate of §3.1.
- The gain–loss form under the specular boundary condition (BGSS2023 (3.1.3)).

*Needs:* HardSphereDynamicsAndKineticLimits §3.2, §8.3.

**Checks.**

- In `d = 3`, `n = 1`, `v₁ = 0`, take
  `g(Z₂) = 1_{|v₂| ≤ 1} 1_{(v₂ − v₁) · (x₂ − x₁) > 0}`. With unit-sphere measure the operator is
  `π²`; reversing the normal gives `−π²`, and using surface measure on the radius-`ε` sphere
  instead gives `ε²π²`. This measurable diagnostic is the limit of continuous cutoffs in the
  weighted norm.
- For `n = 1` the operator involves one contact sphere; a definition summing over ordered pairs
  counts it twice.
- In `d = 1`, `S⁰ = {−1, 1}`: the sphere integral is a sum of two terms, and the integral over
  `w ∈ ℝ` remains.

### 1.2 The hierarchy in Duhamel form

Write `F_n^ε` for the rescaled `n`-particle correlation function. Let
`S_n(t)g = g ∘ T^{(n)}_{−t}`, where `T^{(n)}` is the `N = n` hard-sphere flow of
HardSphereDynamicsAndKineticLimits §7.1. Prove, in the integrated form along this flow, that the
rescaled correlation functions of §9.5 satisfy
`F_n^ε(t) = S_n(t) F_n^ε(0) + ∫₀ᵗ S_n(t − s) C^ε_{n,n+1} F_{n+1}^ε(s) ds`
for `n ≥ 1` and `ε > 0` (GST2013 (4.3.5)–(4.3.8), p. 32; BGSS2023 (3.1.1)–(3.1.6),
pp. 25–26). Iterating gives the Duhamel series. State the function class in which the integrated
identity holds, including the boundary traces from the Conventions.

*Needs:* §1.1; HardSphereDynamicsAndKineticLimits §7.1, §7.2, §9.5.

**Checks.**

- At `t = 0` the identity reduces to the initial correlation function.
- For the equilibrium datum, `F_n^ε(t) = F_n^ε(0)` (HardSphereDynamicsAndKineticLimits §9.4), so
  the full Duhamel integral equals `F_n^ε(0) − S_n(t)F_n^ε(0)`. It vanishes for `n = 1` but not
  for `n = 2`:
  with `x₁ − x₂ = 1.5εe₁`, `v₁ − v₂ = −e₁` and `t = ε`, the exclusion factor satisfies
  `p_ε(1.5ε) > p_ε(2.5ε)`. Reversing the sign of the Duhamel term breaks the identity.
- The series is finite for each `ε`, since at most a bounded number of spheres of diameter `ε` fit
  in the unit torus.

### Examples

The equilibrium measure of HardSphereDynamicsAndKineticLimits §9.4 gives a stationary solution of
the hierarchy.

### Dependencies

HardSphereDynamicsAndKineticLimits §§3.2, 7.1, 7.2, 8.3, 9.4, 9.5.

## Layer 2: The Boltzmann hierarchy

### 2.1 The limiting collision operators

For `β' > β > 0` and `g ∈ X_{0,n+1,β'}`, define the limiting gain–loss operator by
`C⁰_{n,n+1} g(Z_n) = Σ_{i=1}^n ∫_{S^{d−1} × E} ((w − v_i) · ω)_+
[g(z₁, …, (x_i, v_i*), …, z_n, (x_i, w*)) − g(Z_n, (x_i, w))] dω dw`,
where `(v_i*, w*)` are the post-collision velocities obtained using `HardSphere.scatter` with
normal `ω` from HardSphereDynamicsAndKineticLimits §2.1 (GST2013 (4.4.3)–(4.4.6), p. 33), with
surface measure on `S^{d−1}` and Lebesgue measure on `E`. Prove that on tensor powers it reduces
to the Boltzmann collision operator of HardSphereDynamicsAndKineticLimits §10.2.

**API.**

- Linearity and the weighted continuity estimate of §3.1.
- The action on tensor powers stated in the Checks.

*Needs:* HardSphereDynamicsAndKineticLimits §10.2.

**Checks.**

- On `f ⊗ f`, `C⁰_{1,2}` equals `Q(f, f)` of HardSphereDynamicsAndKineticLimits §10.2; evaluating
  the gain term at the unscattered velocities instead gives zero.
- On `M_{β,u}^{⊗(n+1)}` it vanishes, where `M_{β,u}` is the normalized Maxwellian with inverse
  temperature `β` and mean velocity `u`. On `M_{1,0} ⊗ M_{1,e₁}` for `n = 1` it does not: its
  first velocity moment is a positive multiple of `e₁`.
- It does not depend on `ε`.

### 2.2 Tensorised solutions

Prove that if `f` is a mild solution of the Boltzmann equation (HardSphereDynamicsAndKineticLimits
§10.3), its tensor powers solve the Boltzmann hierarchy in Duhamel form (GST2013 pp. 33, 49).

*Needs:* §2.1; HardSphereDynamicsAndKineticLimits §10.3.

**Checks.**

- For `n = 1` the statement is the mild form of the Boltzmann equation itself.
- For a Maxwellian datum the tensor powers are stationary.
- A non-symmetric product of different solutions does not solve the hierarchy.

### Examples

Spatially homogeneous Maxwellians.

### Dependencies

§2.1; HardSphereDynamicsAndKineticLimits §10.3.

## Layer 3: Uniform a priori estimates

### 3.1 Continuity of the collision operators

Prove that the collision operators of §§1.1 and 2.1 map between the weighted spaces of the
Conventions when `β` and `λ` decrease, with a bound proportional to `n` and inverse to the loss of
parameters (GST2013 Propositions 5.3.1–5.3.2, pp. 38–39).

*Needs:* §1.1, §2.1.

**Checks.**

- The bound grows linearly in `n`: at `V_n = 0`, the loss part on
  `g = exp(−β'|V_{n+1}|²/2)` for `β' > β` is `n` times its value at `n = 1`, so no bound
  independent of `n` holds.
- Without the rescaling `μ_ε^{−n}`, the hierarchy carries the factor
  `μ_ε = ε^{−(d−1)}`, and the bound is not uniform in `ε`.
- With equal parameters on both sides the bound fails.

### 3.2 Short-time bounds

For `λ₀ ∈ ℝ`, `β₀ > 0` and some `ε_* > 0`, assume the rescaled initial correlation functions
satisfy
`sup_{0 < ε < ε_*} ‖(F_n^ε(0))_{n ≥ 1}‖_{ε,λ₀,β₀} < ∞`, with the Gaussian and spatial regularity
bounds of HardSphereDynamicsAndKineticLimits §9.6. For the Boltzmann hierarchy use initial data
`((f⁰)^{⊗n})_{n ≥ 1}` from the same datum. Prove that both Duhamel series converge in the weighted
spaces on the same interval `[0, T₀]`, uniformly in `ε`, and that their solutions are bounded by
twice their respective initial norms as in GST2013 Theorems 6–7, p. 37, and Lemma 5.3.1, p. 39.

*Needs:* §1.2, §2.2, §3.1.

**Checks.**

- `T₀` is the same for the BBGKY and Boltzmann hierarchies.
- For fixed `d`, `T₀` depends on `C₀` and `β₀` only, as in the quantifier order of
  HardSphereDynamicsAndKineticLimits §10.4.
- The estimate includes the initial sequence norm; changing `λ₀` changes that norm but does not
  change the dependence of `T₀` on `C₀` and `β₀`.

### Examples

For Maxwellian data the Boltzmann series reduces to its first term; the BBGKY series does not for
`n ≥ 2`.

### 3.3 Short-time existence and tensorisation

For continuous `f⁰ ≥ 0`, differentiable in `x`, with
`|f⁰(x, v)| + |∇ₓf⁰(x, v)| ≤ C₀ exp(−β₀|v|²/2)`, prove that there are `T₁ > 0`, depending only on
`d`, `C₀` and `β₀`, and a mild solution `f` on `[0, T₁]` with datum `f⁰` in the sense of
HardSphereDynamicsAndKineticLimits §10.3 (GST2013 Theorem 1, p. 14; the same fixed-point argument
applies on the torus). Prove that the Boltzmann hierarchy has at most one mild solution in the
weighted spaces of §3.2 (GST2013 Theorem 7, p. 37). Hence the hierarchy solution with data
`((f⁰)^{⊗n})_{n ≥ 1}` is `(f(t)^{⊗n})_{n ≥ 1}` on `[0, min(T₀, T₁)]` (GST2013 p. 49). Use
this common interval as the `T₀` in §5.2.

*Needs:* §§2.2, 3.1, 3.2; HardSphereDynamicsAndKineticLimits §§10.2, 10.3.

### 3.4 Truncated series

Prove that, uniformly in `ε` and in the initial configuration `Z_n` in the weighted estimates,
each Duhamel series differs by an error tending to zero from the part with at most `k` created
particles, all created velocities in the ball of radius `R`, and consecutive creation times at
least `δ` apart. The error tends to zero as `k → ∞`, `R → ∞` and `δ → 0` (GST2013 Propositions
7.1.1–7.3.1 and Corollary 7.4.1, pp. 52–54).

*Needs:* §§3.1, 3.2.

### Dependencies

§§1.2, 2.2, 3.1–3.4.

## Layer 4: Pseudo-trajectories and recollisions

### 4.1 Collision trees and pseudo-trajectories

Define collision trees and, for given times, velocities and impact parameters of the added
particles, the pseudo-trajectories of the BBGKY and Boltzmann hierarchies (BGSS2023 Definitions
3.2.1–3.2.2, pp. 26–27; GST2013 §7.4, p. 54).

**API.**

- Represent each term of either Duhamel series as an integral over the creation times, velocities
  and impact parameters.
- Let `A_{n,m}` be the set of ordered attachment sequences for `m` created particles. Then
  `|A_{n,m}| = n(n+1)⋯(n+m−1)` (BGSS2023 p. 26).

*Needs:* §§1.2, 2.2; HardSphereDynamicsAndKineticLimits §2.1, §3.4.

**Checks.**

- With no added particle, the BBGKY pseudo-trajectory is the backward `n`-particle hard-sphere
  flow (BGSS2023 Definition 3.2.2, pp. 26–27), while the Boltzmann pseudo-trajectory is free
  transport. They differ for a pair that has collided.
- For `n = 2` and `k = 2`, there are `2 · 3 = 6` attachment sequences; counting unordered
  attachments gives only three.
- For the Boltzmann pseudo-trajectories, added particles appear at the position of the particle
  they are attached to, at distance zero; for the BBGKY ones, at distance `ε`.

### 4.2 Discarding recollisions

For `Z_n` whose particles stay at mutual distance at least `ε₀` under backward free transport on
`[0, t]` (GST2013 Definition 12.1.1, p. 94, restricted to this time interval on the torus), prove
that after the truncations of §3.4 the parameter set producing a recollision has the measure bound
of GST2013 Proposition 12.1.1. The bound tends to zero when
`ε ≪ a ≪ ε₀ ≪ ηδ` and then `η, ε₀ → 0`, where `a` and `η` are the intermediate cutoffs in the
cited proposition and `δ` is the time-gap cutoff of §3.4. Outside that set the two
pseudo-trajectories stay within `O(ε)`. Prove that the excluded initial velocities have measure
tending to zero with `ε₀`
(GST2013 Proposition 13.1.1, p. 103), and include periodic recollisions on the torus
(BGSS2023 Proposition 9.2.2, p. 111).

*Needs:* §§3.4, 4.1; HardSphereDynamicsAndKineticLimits §4.1.

**Checks.**

- For `n = 1` and one added particle, no recollision occurs on `ℝᵈ`. On the torus, a recollision
needs a relative displacement of at least `1 − 2ε`, so none occurs when all velocities lie in the
ball of radius `R` and `2Rt < 1 − 2ε`.
- The bound is uniform in the tree for a fixed number of collisions.

### Examples

For `n = 1` and one added particle, the two pseudo-trajectories differ by the shift `ε` of the
added particle along the impact parameter.

### Dependencies

§§1.2, 2.2, 4.1; HardSphereDynamicsAndKineticLimits §§2.1, 3.4, 4.1.

## Layer 5: Convergence

### 5.1 Term-by-term convergence

Prove that each fixed truncated term of the BBGKY Duhamel series converges to its Boltzmann-series
counterpart almost everywhere and against bounded continuous functions as `ε → 0` (GST2013 §14.2,
p. 112). In addition, prove that the first correlation `F_1^ε(t)` converges to `f(t)` uniformly on
compact subsets of `𝕋ᵈ × E`, as in the Lanford arguments cited in BGSS2023 Theorem 1 and its proof.

*Needs:* §§3.2–3.4, 4.2; HardSphereDynamicsAndKineticLimits §9.6.

**Checks.**

- The term with no collision converges by initial chaos (HardSphereDynamicsAndKineticLimits
  §9.6) together with agreement of the `n`-particle flow and free transport outside a set of
  velocities whose measure tends to zero (GST2013 Proposition 13.1.1, p. 103).
- The convergence is not uniform near the boundary of the hard-core phase space, which the
  almost-everywhere form accounts for.
- Remove the truncation parameters using the uniform errors of §3.4, after taking the limit
  `ε → 0`.

### 5.2 Lanford's theorem

Prove `HardSphere.LanfordStatement d` for every `d ≥ 2` and every structure
`[FlatPositionSpace d (UnitFlatTorus d)]`: it suffices to prove the statement for the structure
specified in HardSphereDynamicsAndKineticLimits §1.3, since its §10.4 Checks show all such
structures give the same proposition (BGSS2023 Theorem 1; GST2013 Theorem 8 for the fixed-`N`
form on `ℝᵈ`).

*Needs:* §§3.2–3.4, 5.1; HardSphereDynamicsAndKineticLimits §§9.6, 10.3, 10.4.

**Checks.**

- The statement is quantified over every `FlatPositionSpace`; checking only the canonical structure
  without the supplier's structure-independence result leaves that quantifier unproved.
- At `t = 0` the conclusions follow from initial chaos alone.
- For the equilibrium datum every correlation function is stationary and the limiting one-particle
  solution is the Maxwellian; the finite-`ε` correlation functions need not be exact tensor powers.

### Examples

The equilibrium grand canonical measure, whose limit is the stationary Maxwellian.

### Dependencies

§§3.2–3.4, 5.1; HardSphereDynamicsAndKineticLimits §§9.6, 10.3, 10.4.

## Downstream consumers

None known on main or in the open pull requests. A roadmap on fluctuations of the hard-sphere gas
(HardSphereDynamicsAndKineticLimits, Downstream consumers) would use the collision trees of
Layer 4.

## Research context

Lanford proved the short-time validity of the Boltzmann equation in 1975.

The Boltzmann-Grad limit is a cornerstone of kinetic theory.

## Open problems

### Specific mathematical problem statements

1. **Lanford's theorem extension**: Prove Lanford's theorem for all time t > 0, not just on a short
   time interval [0, T₀]. Currently, T₀ is a fraction of the mean free time.

2. **Global existence for Boltzmann equation**: Prove global existence and uniqueness of solutions
   to the Boltzmann equation for arbitrary initial data with finite mass, energy, and entropy.

3. **Boundary value problem**: Prove Lanford's theorem with boundary conditions, establishing the
   Boltzmann-Grad limit for hard spheres in a bounded domain with physically meaningful
   boundary conditions (e.g., specular reflection, diffuse reflection).

4. **Long-range potentials**: Prove a version of Lanford's theorem for particles interacting via
   Coulomb or other long-range potentials. This requires modifying the BBGKY hierarchy to
   account for long-range interactions.

5. **Quantum Boltzmann-Grad limit**: Prove an analogue of Lanford's theorem for quantum mechanical
   systems, connecting the quantum N-body Schrödinger equation to the quantum Boltzmann
   equation in the low-density limit.

6. **Fluctuations theorem**: Prove that the fluctuations of the empirical measure around the
   Boltzmann solution satisfy a central limit theorem, with the limiting process characterized
   by a stochastic PDE (Bodineau-Gallagher-Saint-Raymond-Simonella 2023 provides partial results).

7. **Large deviations principle**: Establish a large deviations principle for the empirical
   measure in the Boltzmann-Grad limit, describing the rate of convergence to the Boltzmann
   solution.

8. **Hydrodynamic limit**: Prove that solutions of the Boltzmann equation converge to solutions
   of the incompressible Navier-Stokes equations in the hydrodynamic limit (low Mach number,
   small Knudsen number).

9. **Euler limit**: Prove that solutions of the Boltzmann equation converge to solutions of the
   compressible Euler equations in the zero-viscosity limit.

10. **Gas mixtures**: Prove Lanford's theorem for a mixture of hard spheres of different sizes and
    masses, establishing the Boltzmann-Grad limit for multi-species systems.

11. **External forces**: Prove Lanford's theorem in the presence of external forces (e.g., gravity,
    electromagnetic fields), establishing the Boltzmann-Grad limit for forced particle systems.

12. **Non-equilibrium initial data**: Prove Lanford's theorem for initial data that are far from
    equilibrium, including initial data with shocks or other discontinuities.

13. **Relativistic Boltzmann-Grad limit**: Prove an analogue of Lanford's theorem for relativistic
    particle systems, connecting relativistic particle dynamics to the relativistic Boltzmann
    equation.

14. **Granular gases**: Prove a version of Lanford's theorem for granular gases, where particle
    collisions are inelastic (i.e., kinetic energy is not conserved in collisions).

15. **Turbulence emergence**: Prove that solutions of the Boltzmann equation develop turbulent
    behavior in the long-time limit, and characterize the statistical properties of this
    turbulence.

16. **Smoothness of solutions**: Prove that solutions of the Boltzmann equation with smooth initial
    data remain smooth for all time, or characterize the formation of singularities.

17. **Convergence rate**: Establish sharp rates of convergence in Lanford's theorem, describing
    how quickly the correlation functions converge to the Boltzmann solution as ε → 0.

18. **Uniform bounds**: Prove uniform bounds on the correlation functions that are independent
    of the number of particles N, in the full time range [0, ∞).

19. **Periodic boundary conditions**: Prove Lanford's theorem on the torus with periodic boundary
    conditions, establishing the Boltzmann-Grad limit for spatially periodic systems.

20. **Hard spheres in R³**: Prove Lanford's theorem for hard spheres in R³ (rather than on the
    torus), establishing the Boltzmann-Grad limit in the full space.
## Additional bibliography

- C. Cercignani, *The Boltzmann equation and its applications*, Springer (1988).
- C. Cercignani, R. Illner, M. Pulvirenti, *The Mathematical Theory of Dilute Gases*, Springer (1994).
- R. J. DiPerna, P. L. Lions, *On the Cauchy problem for Boltzmann equations*, Ann. of Math. 130 (1989).
- L. Arkeryd, *On the Boltzmann equation*, Arch. Rational Mech. Anal. 69 (1979) and 77 (1981).
- H. Grad, *On the kinetic theory of rarefied gases*, Comm. Pure Appl. Math. 2 (1949).
- C. Villani, *A review of mathematical topics in collisional kinetic theory*, Handbook of Mathematical Fluid Dynamics (2002).
- L. Saint-Raymond, *Hydrodynamic limits of the Boltzmann equation*, in An Introduction to the Mathematical Theory of the Boltzmann Equation (2010).
- F. Golse, *From the Boltzmann equation to fluid mechanics in the low density limit*, Kinetic Theory (2000).
- F. Bouchut, F. Golse, C. Percoll, *Kinetic equations as asymptotics of particle systems*, Handbook of Mathematical Fluid Dynamics (2008).
- N. Masmoudi, L. Saint-Raymond, *From the Boltzmann equation to the incompressible Navier-Stokes equations*, Arch. Rational Mech. Anal. 192 (2009) and J. Amer. Math. Soc. 25 (2012).
- T. Bodineau, I. Gallagher, L. Saint-Raymond, *Statistical mechanics of a dilute gas of hard spheres*, arXiv:1804.09439 (2018).
- E. Carlen, E. Lu, *Entropy production and convergence to equilibrium for the Boltzmann equation*, Arch. Rational Mech. Anal. 209 (2013).
- S. Ukai, *On the existence of global solutions of mixed problems for non-linear Boltzmann equations*, Proc. Japan Acad. 55 (1979).
- T. Nishida, *Global existence for nonlinear Boltzmann equations*, Math. Z. 174 (1980).
- Y. Brenier, *Decompositions of Boltzmann entropy dissipation*, Comm. Partial Differential Equations 35 (2010).
- E. Carlen, E. Lu, *Non-Gaussian fluctuations for the Boltzmann equation*, Comm. Math. Phys. 311 (2012).
- F. Filbet, L. Laurent, *Asymptotic analysis of the Boltzmann equation for small Knudsen numbers*, SIAM J. Math. Anal. 38 (2006).
- R. Alexandre, Y. Morimoto, S. Ukai, C. Xu, *The Boltzmann equation with a long-range interaction potential*, Arch. Rational Mech. Anal. 211 (2014).
- R. Alexandre, J. Villani, *On the Boltzmann equation for long-range interactions*, Comm. Partial Differential Equations 32 (2007).
- A. V. Bobylev, *On the Cauchy problem for the Boltzmann equation*, J. Statist. Phys. 25 (1981).
- K. Hamdache, *Existence and uniqueness for the Boltzmann equation*, Comm. Partial Differential Equations 18 (1993).
- G. Spiga, *On the well-posedness of the Cauchy problem for the Boltzmann equation*, Arch. Rational Mech. Anal. 143 (1998).
- L. Saint-Raymond, *From the Boltzmann equation to hydrodynamics in the low-density limit*, Proc. ICM Madrid 2006, Vol. III (2006).
