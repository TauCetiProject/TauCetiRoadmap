# Roadmap: the Boltzmann–Grad limit and Lanford's theorem

**Summary.** Prove Lanford's theorem for hard spheres on the unit torus in the grand canonical
setting: for every dimension `d ≥ 2`, the proposition `HardSphere.LanfordStatement d` of
HardSphereDynamicsAndKineticLimits §10.4 holds. For initial data bounded by a Gaussian in the
velocities and Lipschitz in the positions, there is a time `T₀ > 0`, depending only on `d` and on
the constants of the data, such that in the Boltzmann–Grad scaling `μ_ε = ε^{−(d−1)}` the
correlation functions of the hard-sphere gas converge on `[0, T₀]` to the tensor powers of a mild
solution of the Boltzmann equation. The route is the one of Gallagher, Saint-Raymond and Texier:
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
- The Cauchy problem for the Boltzmann equation beyond the short time of the hierarchy, the H
  theorem and collision invariants belong to the roadmap on the Boltzmann equation named in
  HardSphereDynamicsAndKineticLimits, Scope and ownership.
- Fluctuations and large deviations of the empirical measure, long-time derivations and
  short-range potentials belong to the roadmaps listed in HardSphereDynamicsAndKineticLimits,
  Downstream consumers.

## Conventions

- **Scaling.** The fugacity is `μ_ε = ε^{−(d−1)}`, as in HardSphereDynamicsAndKineticLimits,
  Conventions; correlation functions are rescaled by `μ_ε^{−n}` as there.
- **Weights.** For `β > 0` and `μ > 0`, a sequence `(g_n)_{n ≥ 1}` of functions on the
  `n`-particle phase space is measured by the supremum over `n` of `μ^n` times the essential
  supremum of `|g_n|` weighted by `exp(β |V_n|² / 2)`, where `|V_n|²` is the sum of the squared
  velocities. The parameters `β` and `μ` decrease linearly in time along the a priori estimate of
  Layer 3, which fixes the length `T₀` of the time interval.
- **Collision trees.** The particles added by the collision operators are numbered in the order in
  which they appear in the Duhamel expansion, backwards in time; each added particle is attached
  to one earlier particle, which defines a tree.

## Exact supplier contracts

**From Mathlib.** Lebesgue and Bochner integration on products of Euclidean spaces, essential
suprema (`MeasureTheory.eLpNormEssSup`), the exponential, and convergence along filters.

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

Define, for `n ≥ 1` and `ε > 0`, the collision operator from functions of `n + 1` particles to
functions of `n` particles: the integral over the sphere of contact of particle `n + 1` with one of
the first `n` particles, weighted by the relative velocity against the normal, of the boundary
values of the `(n + 1)`-particle function (GST2013, Part II). Prove that it is well defined on
functions continuous up to the boundary of the hard-core phase space.

*Needs:* HardSphereDynamicsAndKineticLimits §3.2, §8.3.

**Checks.**

- On the product of Maxwellians of equal temperature the gain and loss parts cancel, so the
  operator vanishes; a definition with the normal oriented the wrong way gives a nonzero result.
- For `n = 1` the operator involves one contact sphere; a definition summing over ordered pairs
  counts it twice.
- In dimension `d = 1` the contact sphere has two points and the operator is a finite sum.

### 1.2 The hierarchy in Duhamel form

Prove that the rescaled correlation functions of HardSphereDynamicsAndKineticLimits §9.5, along the
flow of §7.1, satisfy the BBGKY hierarchy in Duhamel form: the correlation function of `n`
particles at time `t` is its free transport from time `0` plus the time integral of the transported
collision operator applied to the correlation function of `n + 1` particles (GST2013, Part II;
BGSS2023, §2). Iterating gives the Duhamel series.

*Needs:* §1.1; HardSphereDynamicsAndKineticLimits §7.1, §7.2, §9.5.

**Checks.**

- At `t = 0` the identity reduces to the initial correlation function.
- For the equilibrium grand canonical measure the correlation functions are time independent, so
  the collision term vanishes; a sign error in the Duhamel term breaks this.
- The series is finite for each `ε`, since at most a bounded number of spheres of diameter `ε` fit
  in the unit torus.

### Examples

The equilibrium measure of HardSphereDynamicsAndKineticLimits §9.4 gives a stationary solution of
the hierarchy.

### Dependencies

HardSphereDynamicsAndKineticLimits §§3.2, 7.1, 7.2, 8.3, 9.4, 9.5.

## Layer 2: The Boltzmann hierarchy

### 2.1 The limiting collision operators

Define the limiting collision operators, with contacts taken at zero distance (GST2013, Part II),
and prove that on tensor products they reduce to the Boltzmann collision operator of
HardSphereDynamicsAndKineticLimits §10.2.

*Needs:* HardSphereDynamicsAndKineticLimits §10.2.

**Checks.**

- On a tensor power of one function, the first limiting operator equals the Boltzmann collision
  operator; a definition without the symmetrisation over the attached particle does not.
- On a product of Maxwellians it vanishes.
- It does not depend on `ε`.

### 2.2 Tensorised solutions

Prove that if `f` is a mild solution of the Boltzmann equation (HardSphereDynamicsAndKineticLimits
§10.3), its tensor powers solve the Boltzmann hierarchy in Duhamel form.

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

Prove that the collision operators of §1.1 and §2.1 are bounded between the weighted spaces of the
Conventions when the weight parameters decrease, with a bound proportional to `n` and inverse to
the loss of parameters (GST2013, Part II).

*Needs:* §1.1, §2.1.

**Checks.**

- The bound grows linearly in `n`, which forces the short time; a bound without the factor `n`
  would give a global time, which is false.
- For Maxwellian weights the bound is uniform in `ε`.
- With equal parameters on both sides the bound fails.

### 3.2 Short-time bounds

Prove that both Duhamel series converge in the weighted spaces on a time interval `[0, T₀]` with
`T₀ > 0` depending only on `d` and on the constants of the initial data, uniformly in `ε`
(GST2013, Part II).

*Needs:* §1.2, §2.2, §3.1.

**Checks.**

- `T₀` is the same for the BBGKY and Boltzmann hierarchies.
- `T₀` depends on `C₀` and `β₀` only, as in the quantifier order of
  HardSphereDynamicsAndKineticLimits §10.4.
- For data with larger `C₀` the time `T₀` is not larger.

### Examples

For Maxwellian data both series reduce to their first term, and the bounds hold on every time
interval.

### Dependencies

§§1.2, 2.2, 3.1.

## Layer 4: Pseudo-trajectories and recollisions

### 4.1 Collision trees and pseudo-trajectories

Define collision trees and, for given times, velocities and impact parameters of the added
particles, the pseudo-trajectories of the BBGKY and of the Boltzmann hierarchies, and express each
term of the two Duhamel series as an integral over these parameters (GST2013, Part III).

*Needs:* §§1.2, 2.2; HardSphereDynamicsAndKineticLimits §2.1, §3.4.

**Checks.**

- With no added particle the pseudo-trajectory is the free transport of the initial particles.
- A tree with `k` added particles has `n (n + 1) ⋯ (n + k − 1)` attachment choices, which is the
  factor bounded in §3.1; counting unordered attachments gives the wrong count.
- For the Boltzmann pseudo-trajectories, added particles appear at the position of the particle
  they are attached to, at distance zero; for the BBGKY ones, at distance `ε`.

### 4.2 Discarding recollisions

Prove that, after truncation of high energies, of close collision times and of the number of
collisions, the set of parameters for which a BBGKY pseudo-trajectory contains a recollision has
measure tending to zero as `ε → 0`, and that outside it the BBGKY and Boltzmann pseudo-trajectories
stay within `O(ε)` (GST2013, Part III).

*Needs:* §4.1; HardSphereDynamicsAndKineticLimits §4.1.

**Checks.**

- With a single added particle no recollision is possible.
- Without the energy truncation the bound fails, since fast particles recollide with small
  probability but large weight.
- The bound is uniform in the tree for a fixed number of collisions.

### Examples

For `n = 1` and one added particle, the two pseudo-trajectories differ by the shift `ε` of the
added particle along the impact parameter.

### Dependencies

§§1.2, 2.2, 4.1; HardSphereDynamicsAndKineticLimits §§2.1, 3.4, 4.1.

## Layer 5: Convergence

### 5.1 Term-by-term convergence

Prove that each truncated term of the BBGKY Duhamel series converges to the corresponding term of
the Boltzmann series, almost everywhere and against bounded continuous functions, as `ε → 0`
(GST2013, Part IV).

*Needs:* §§3.2, 4.2; HardSphereDynamicsAndKineticLimits §9.6.

**Checks.**

- The term with no collision converges by initial chaos alone.
- The convergence is not uniform near the boundary of the hard-core phase space, which the
  almost-everywhere form accounts for.
- The truncation parameters of §4.2 are removed after the limit `ε → 0`, not before.

### 5.2 Lanford's theorem

Prove `HardSphere.LanfordStatement d` for every `d ≥ 2` (HardSphereDynamicsAndKineticLimits §10.4;
BGSS2023, Theorem 1; GST2013, Theorem 8 for the fixed-`N` form on `ℝᵈ`).

*Needs:* §§3.2, 5.1; HardSphereDynamicsAndKineticLimits §10.4.

**Checks.**

- For `d = 0` the proposition is false (HardSphereDynamicsAndKineticLimits §10.4, Checks), so the
  hypothesis `d ≥ 2` is used.
- At `t = 0` the conclusions follow from initial chaos alone.
- For the equilibrium datum every correlation function is stationary and the limit is the
  Maxwellian tensor power.

### Examples

The equilibrium grand canonical measure, whose limit is the stationary Maxwellian.

### Dependencies

§§3.2, 5.1; HardSphereDynamicsAndKineticLimits §§9.6, 10.4.

## Downstream consumers

None known on main or in the open pull requests. A roadmap on fluctuations of the hard-sphere gas
(HardSphereDynamicsAndKineticLimits, Downstream consumers) would use the collision trees of
Layer 4.

## Research context

Lanford proved the short-time validity of the Boltzmann equation in 1975. The time `T₀` is a
fraction of the mean free time, and the validity on long time intervals remains open in general;
it is not a target here.

## References

- GST2013: I. Gallagher, L. Saint-Raymond, B. Texier, *From Newton to Boltzmann: hard spheres and
  short-range potentials*, Zurich Lectures in Advanced Mathematics, EMS (2013); arXiv:1208.5753.
- BGSS2023: T. Bodineau, I. Gallagher, L. Saint-Raymond, S. Simonella, *Statistical dynamics of a
  hard sphere gas: fluctuating Boltzmann equation and large deviations*, Ann. of Math. 198 (2023);
  arXiv:2008.10403.
- Lanford1975: O. E. Lanford III, *Time evolution of large classical systems*, in *Dynamical
  systems, theory and applications*, Lecture Notes in Physics 38, Springer (1975), 1–111.
