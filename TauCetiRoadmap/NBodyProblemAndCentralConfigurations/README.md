# Roadmap: the Newtonian n-body problem and central configurations

**Summary.** This roadmap formalizes the classical theory of `n` point masses in a real inner
product space under Newton's inverse-square attraction (gravitational constant `1`), and the
equilibria of the planar circular restricted three-body problem. A solution is a pair of curves
(positions and velocities) on a set of times, with no two bodies ever at the same point. No
dimension, centre-of-mass frame or sign of the energy is assumed unless a statement says so.

The headline theorems are these.

- *Sundman's inequality and total collapse.* For nonnegative masses, with `I = Σ mⱼ|xⱼ|²` (no
  factor `½`) and `T = ½ Σ mⱼ|vⱼ|²`, the angular momentum bivector `C = Σ mⱼ xⱼ ∧ vⱼ` satisfies
  `|C|² + (İ/2)² ≤ 2IT`, where `İ/2 = Σ mⱼ⟨xⱼ, vⱼ⟩`. Consequently (Sundman, Weierstrass), if a
  solution with positive masses on `[t₀, t₁)` has moment of inertia tending to `0` as `t → t₁`,
  its angular momentum is `0`.
- *Bounded motions and the virial theorem.* If `n ≥ 2` bodies of positive mass have total
  momentum `0` and bounded mutual distances on `[0, ∞)`, the energy is negative. If
  `Σ mⱼ⟨xⱼ, vⱼ⟩` stays bounded on `[0, ∞)` (for instance when positions and velocities do), the
  time average of the kinetic energy over `[0, τ]` tends to minus the energy.
- *Central configurations.* For positive masses, an affinely independent configuration is central
  exactly when all mutual distances are equal. On a line, for at least two positive masses and
  each ordering of the bodies there is exactly one central configuration with centre of mass `0`
  and moment of inertia `1` (Moulton).
- *Lagrange points.* For `0 < μ < 1` the rotating-frame equations have exactly five equilibria off
  the primaries: one in each gap of the line through the primaries, and two forming equilateral
  triangles with them. At the triangular points the linearisation has four distinct nonzero purely
  imaginary eigenvalues when `27μ(1 − μ) < 1`, none on the imaginary axis and exactly two with
  positive real part when `27μ(1 − μ) > 1`, and double eigenvalues `±i/√2` with a nontrivial
  Jordan block when `27μ(1 − μ) = 1`. At each collinear point it has a real positive eigenvalue,
  so the collinear points are Lyapunov unstable, and so are the triangular ones when
  `27μ(1 − μ) > 1`.

Mathlib supplies the calculus and the uniqueness of solutions of Lipschitz differential
equations. LyapunovStabilityOfODEs supplies Lyapunov stability and instability from an eigenvalue
of the linearisation with positive real part. The Kepler problem belongs to SymplecticGeometry's
integrable-systems part and Tau Ceti's central-force files; here Kepler solutions only enter as
hypotheses. The restricted problem's Hamiltonian and Jacobi integral are not treated here.

A design note fixes the carriers and conventions. Layer 1 proves the three conservation laws.
Layer 2 proves the Lagrange–Jacobi identity and its consequences. Layer 3 treats central
configurations: homothetic and planar homographic solutions, the variational characterisation,
the simplex theorem and Moulton's theorem. Layer 4 treats the restricted problem: the five
equilibria, the spectra of the linearisations and instability.

## Conventions

- **Carrier.** `E` is a real inner product space (`[NormedAddCommGroup E] [InnerProductSpace ℝ E]`),
  of any dimension unless a statement fixes it; the bodies are indexed by `Fin n`, `n ≥ 0`; masses
  are `m : Fin n → ℝ`. A configuration is `x : Fin n → E`, velocities are `v : Fin n → E`. Layer 3
  uses `E = ℂ` (as a real inner product space) for planar motions and `E = ℝ` for motions on a
  line. Layer 4 works on states `(x, y, u, v)` in `Fin 4 → ℝ`.
- **Units.** The gravitational constant is `1`. The force function `U` is positive and the
  potential energy is `−U`.
- **Moment of inertia.** `I = Σ mⱼ ‖xⱼ‖²`, about the origin and without a factor `½`. Several
  sources (Volchan, Tong) put `½` in front; each locator below says how its formula reads in this
  convention.
- **Junk values.** Lean's `a / 0 = 0` and `0⁻¹ = 0` enter on purpose in two places, each pointed
  out where it occurs: the term `i = j` of the acceleration, and the centre of mass when the total
  mass is `0` (only 3.1 and 3.2 allow that case, and they hold with any point in place of the
  centre of mass). Every other singular expression is excluded by a collision-free hypothesis or,
  in Layer 4, by excluding the primaries.
- **Spectra.** A real `4 × 4` matrix `A` has its eigenvalues read in `ℂ`, as
  `spectrum ℂ (A.map (algebraMap ℝ ℂ))`, as in LyapunovStabilityOfODEs. "Stable" is never used
  for Lyapunov stability of an equilibrium of Layer 4: the statements about the triangular points
  are spectral statements about the linearisation, and nonlinear stability is not treated here.

## Design note

### D.1 Configurations and collisions

Define `IsCollisionFree x`: the positions `x i` are pairwise distinct. The configuration space of
the problem is the set of collision-free configurations, an open subset of `Fin n → E`.

**Checks.**
- For `n = 0` and `n = 1` every configuration is collision-free (there is no pair); two bodies at
  the same point are not.

### D.2 Newton's equations and the classical quantities

Define, for masses `m` and a configuration `x` (and velocities `v`):

- `newtonAccel m x j = Σᵢ (mᵢ / ‖xᵢ − xⱼ‖³) (xᵢ − xⱼ)`, the acceleration of body `j`. The term
  `i = j` is `0` because its vector is `0`. Newton's equations are `ẍⱼ = newtonAccel m x j`, that
  is `mⱼ ẍⱼ = Σ_{i≠j} mᵢ mⱼ (xᵢ − xⱼ)/rᵢⱼ³` (Moeckel, eq. (1), p. 1).
- `forceFunction m x = Σ_{i<j} mᵢ mⱼ / ‖xᵢ − xⱼ‖`, Moeckel's `U` (eq. (2), p. 1).
- `kineticEnergy m v = ½ Σ mⱼ ‖vⱼ‖²` and `energy m x v = kineticEnergy m v − forceFunction m x`.
- `totalMomentum m v = Σ mⱼ vⱼ` and `centreOfMass m x = (Σ mⱼ)⁻¹ Σ mⱼ xⱼ`.
- `inertia m x = Σ mⱼ ‖xⱼ‖²`, the moment of inertia about the origin.
- `angularMomentum m x v`, the bilinear form
  `(a, b) ↦ Σ mⱼ (⟨xⱼ, a⟩⟨vⱼ, b⟩ − ⟨xⱼ, b⟩⟨vⱼ, a⟩)`; on an orthonormal basis its values are the
  entries `ω_kl` of Moeckel's antisymmetric angular-momentum matrix (eq. (7), p. 3). Its value at
  `(a, b)` is `Σ mⱼ · TauCeti.angularMomentum a b (xⱼ, vⱼ)`: Tau Ceti's one-particle angular
  momentum in the plane of `a` and `b`, weighted by the masses and summed over the bodies.
- `angularMomentumSq m x v = Σⱼ Σₖ mⱼ mₖ (⟨xⱼ, xₖ⟩⟨vⱼ, vₖ⟩ − ⟨xⱼ, vₖ⟩⟨vⱼ, xₖ⟩)`, the squared norm
  `|C|²` of the bivector `C = Σ mⱼ xⱼ ∧ vⱼ` (the inner product of `a ∧ b` and `c ∧ d` is
  `⟨a, c⟩⟨b, d⟩ − ⟨a, d⟩⟨b, c⟩`). It is defined without a basis, so it makes sense in every `E`.

Two identities are used throughout, for all real masses and every collision-free `x`:
`Σⱼ mⱼ newtonAccel m x j = 0` (the forces cancel in pairs), and the Euler identity
`Σⱼ mⱼ ⟨xⱼ, newtonAccel m x j⟩ = −forceFunction m x` (`U` is homogeneous of degree `−1`).

**Checks.**
- Two bodies at distance `r`: `newtonAccel m x 0 = m₁ (x₁ − x₀)/r³`, the pull of body `1` alone.
- Three unit masses at the vertices of an equilateral triangle of side `1`: `forceFunction = 3`.
  Unit masses at `±1` on a line: `inertia = 2`; with the factor `½` of Volchan and Tong it would be
  `1`, and every constant of Layer 2 would change.
- In a finite-dimensional `E` with an orthonormal basis `(e_a)`, `angularMomentumSq m x v` equals
  `½ Σ_{a,b} angularMomentum m x v e_a e_b²`; in `ℝ³` it is `|Σ mⱼ xⱼ × vⱼ|²` and in `ℝ²` it is
  `(Σ mⱼ (xⱼ₁ vⱼ₂ − xⱼ₂ vⱼ₁))²` (both checked as polynomial identities for two bodies, in `ℝ³` and
  in `ℝ⁴`).
- For one body, `angularMomentumSq + ⟨x, v⟩²` is `‖x‖²‖v‖²` (Lagrange's identity): with
  `x = (1, 2, 3)`, `v = (−2, 0, 5)` and `m = 1` both sides are `406 = 14 · 29`.
- The Euler identity at the central configuration of D.4 with masses `1, 2, 3` at the vertices of
  an equilateral triangle of side `2`: there `newtonAccel m x j = −¾ (xⱼ − c)`, so
  `Σⱼ mⱼ ⟨xⱼ, newtonAccel m x j⟩ = −¾ Σ mⱼ ‖xⱼ − c‖² = −¾ · 22/3 = −11/2 = −forceFunction m x`,
  about every origin.

### D.3 Solutions

Define `IsSolutionOn m x v s`, for curves `x v : ℝ → Fin n → E` and a set of times `s ⊆ ℝ`: for
every `t ∈ s` the configuration `x t` is collision-free, `x` has derivative `v t` within `s` at
`t`, and `v` has derivative `newtonAccel m (x t)` within `s` at `t`. Equivalently `(x, v)` is an
integral curve on `s` (Mathlib's `IsIntegralCurveOn`) of the field `(x, v) ↦ (v, newtonAccel m x)`
on phase space, and stays collision-free. Derivatives within `s` let one write solutions on closed
or half-open intervals such as `[0, ∞)` and `[t₀, t₁)` with one-sided derivatives at the ends.
Values of `x` and `v` outside `s` play no role.

**Checks.**
- `n = 1`: `newtonAccel = 0`, and the solutions are the free motions `x t = x₀ + t v₀`.
- Two unit masses `x₀(t) = ½(cos √2 t, sin √2 t)`, `x₁(t) = −x₀(t)` in `ℝ²` form a solution on
  `ℝ`: the acceleration of body `0` is `(x₁ − x₀)/1³ = −2 x₀`, which is `ẍ₀`.

### D.4 Central configurations, similarity and normalisation

Define `IsCentralConfiguration m x lam`: `x` is collision-free and
`newtonAccel m x j = −lam (xⱼ − centreOfMass m x)` for every `j` (Moeckel, Definition 1, p. 4,
divided by `mⱼ`). Every acceleration points to the centre of mass and is proportional to the
distance from it.

Two configurations are *similar* when one is obtained from the other by a translation, a linear
isometry of `E` and a dilation by a positive factor `k`. Central configurations are closed under
similarity, the constant changing to `lam / k³`. A central configuration is *normalised* when its
centre of mass is `0` and its moment of inertia is `1` (Moeckel's space `N`, p. 25). For `n ≥ 2`
and positive masses every central configuration is similar to a normalised one, and two normalised
configurations are similar exactly when a linear isometry carries one to the other (a similarity
fixing the centre of mass `0` and the moment of inertia `1` has no translation and `k = 1`).

For every central configuration, `lam · Σ mⱼ ‖xⱼ − c‖² = forceFunction m x` with `c` the centre of
mass: pair the defining equation with `mⱼ (xⱼ − c)`, sum, and use the two identities of D.2. So
for positive masses and `n ≥ 2` the constant is `lam = U / I_c > 0` (Moeckel, p. 4).

**Checks.**
- `n = 0`: the empty configuration is central for every `lam`. `n = 1`: `newtonAccel = 0` and
  `x₀ − c = 0`, so every configuration is central for every `lam`; the constant is not determined.
- `n = 2`: every collision-free configuration is central, with exactly `lam = (m₀ + m₁)/r³`; for
  masses `2, 5` at distance `5` this is `7/125`.
- Three equal masses `m` at `−a, 0, a` on a line form a central configuration with
  `lam = 5m/(4a³)` (`5/32` for `m = 1`, `a = 2`); normalised, `a = 1/√(2m)`.
- Equal masses at `0, 1, 3` on a line are not central: body `0` would need `lam = 5/6` and body `1`
  would need `lam = −9/4`. Equal masses at `(0, 0), (2, 0), (1, 3)` (isosceles, not equilateral)
  are not central.
- Masses `1, 2, 3` at the vertices of an equilateral triangle of side `2`: central with
  `lam = 3/4 = M/a³`; here `U = 11/2` and `I_c = 22/3`, and `lam · I_c = U`.

### D.5 The circular restricted three-body problem

Units: the primaries have total mass `1`, separation `1`, and revolve on circles about their
centre of mass with angular velocity `1` (the two-body central configuration of D.4 with masses
`1 − μ`, `μ` at distance `1` has `lam = 1`). The frame rotates counterclockwise with them, the
primary of mass `1 − μ` sits at `(−μ, 0)` and the primary of mass `μ` at `(1 − μ, 0)`, with
`0 < μ < 1`; nothing assumes `μ ≤ ½`. These are also the conventions of RestrictedThreeBody (an open roadmap, not on main).

Define `amendedPotential μ x y = (x² + y²)/2 + (1 − μ)/r₁ + μ/r₂` with
`r₁ = √((x + μ)² + y²)` and `r₂ = √((x − 1 + μ)² + y²)`, and the rotating-frame vector field
`restrictedField μ` on states `s = (x, y, u, v)`:
`(u, v, 2v + ∂ₓΩ(x, y), −2u + ∂ᵧΩ(x, y))`, where `Ω = amendedPotential μ` and the partial
derivatives are Mathlib's one-variable `deriv` of `Ω` in `x` (respectively `y`) with the other
variable fixed. Its integral curves are the solutions of `ẍ − 2ẏ = ∂ₓΩ`, `ÿ + 2ẋ = ∂ᵧΩ`, the
motion of a massless body in the rotating frame. Away from the primaries `Ω` is smooth and these
`deriv`s are its partial derivatives; at a primary they are Mathlib's junk value `0`, so the
statements below exclude the primaries.

The equilibria are labelled: `L₁` between the primaries, `L₂` beyond the primary of mass `μ`,
`L₃` beyond the primary of mass `1 − μ`, and `L₄ = (½ − μ, √3/2)`, `L₅ = (½ − μ, −√3/2)`. Write
`μ_R = (1 − √(23/27))/2 ≈ 0.0385209`; then `27μ(1 − μ) < 1` exactly when `μ < μ_R` or
`μ > 1 − μ_R`.

**Checks.**
- Hamilton's equations for RestrictedThreeBody's Hamiltonian, written with `r₁`, `r₂` as here
  (that roadmap names the two distances the other way round),
  `½(pₓ² + p_y²) + pₓ y − p_y x − (μ/r₂ + (1 − μ)/r₁)` give `ẋ = pₓ + y`, `ẏ = p_y − x`, and then
  `ẍ − 2ẏ = x + ∂ₓ(μ/r₂ + (1 − μ)/r₁) = ∂ₓΩ` and `ÿ + 2ẋ = ∂ᵧΩ`: the two conventions agree.
- `Ω` is unchanged by `(μ, x, y) ↦ (1 − μ, −x, y)`, which exchanges the primaries; the statements
  below are symmetric under it.
- The state `(−μ, 0, 0, 0)` (the first primary at rest) is a zero of `restrictedField μ` only
  because of the junk value: `x ↦ Ω(x, 0)` is not differentiable at `−μ`, and Mathlib's `deriv`
  is `0` there. A plausible wrong statement "the zero set of the field has five points" is false
  for this reason.
- `Ω(L₄) = Ω(L₅) = 3/2 − μ(1 − μ)/2`.

## Layer 1: First integrals

All three statements hold for arbitrary real masses: the computations use only the antisymmetry
of the pairwise forces and the identities of D.2. Here `s` is order-connected (an interval of any
kind), and `t₀, t ∈ s`. Order-connectedness is needed: at an isolated point of `s` every vector
is a derivative within `s`, so on `s = {0, 1}` any two collision-free states at times `0` and `1`
form a solution, whatever their momenta and energies.

### 1.1 Momentum and the centre of mass

Prove `totalMomentum_eq`: for a solution on `s`, the total momentum at `t` equals that at `t₀`, and
`Σ mⱼ xⱼ(t) = Σ mⱼ xⱼ(t₀) + (t − t₀) Σ mⱼ vⱼ(t₀)`: the centre of mass moves on a line at constant
velocity (Moeckel, §2, p. 2). The derivative of the total momentum within `s` is
`Σ mⱼ newtonAccel m x j = 0`, so it is constant on the interval `[t₀, t]`, and the second identity
follows by integrating once more.

*Needs:* D.2, D.3; Mathlib `constant_of_derivWithin_zero`.

### 1.2 Energy

Prove `energy_eq`: for a solution on `s`, `energy m (x t) (v t) = energy m (x t₀) (v t₀)`
(Moeckel, §1, p. 2; Montgomery, Proposition 1, p. 3). The kinetic energy has derivative
`Σ mⱼ ⟨vⱼ, newtonAccel m x j⟩`; the force function is differentiable at collision-free
configurations and has the same derivative along the motion, because `‖xᵢ − xⱼ‖⁻¹` has
derivative `−⟨xᵢ − xⱼ, vᵢ − vⱼ⟩/‖xᵢ − xⱼ‖³`.

*Needs:* D.2, D.3; Mathlib `constant_of_derivWithin_zero`.

### 1.3 Angular momentum

Prove `angularMomentum_eq`: for a solution on `s`, `angularMomentum m (x t) (v t)` equals
`angularMomentum m (x t₀) (v t₀)` as a bilinear form (Moeckel, §2, p. 3). For fixed `a, b` the
derivative is `Σⱼ mⱼ (⟨xⱼ, a⟩⟨newtonAccel m x j, b⟩ − ⟨xⱼ, b⟩⟨newtonAccel m x j, a⟩)`, the
velocity terms cancelling; expanding the acceleration gives
`Σ_{i,j} mᵢ mⱼ ‖xᵢ − xⱼ‖⁻³ (⟨xⱼ, a⟩⟨xᵢ, b⟩ − ⟨xⱼ, b⟩⟨xᵢ, a⟩)`, antisymmetric in `(i, j)`.

*Needs:* D.2, D.3; Mathlib `constant_of_derivWithin_zero`.

**Checks.**
- For the circular two-body solution of D.3 the momentum is `0`, the energy is
  `½ · 2 · (√2/2)² − 1 = −1/2`, and the angular momentum in the plane is `2 · ½ · (√2/2) = √2/2`
  at every time.

### Examples

- `n = 1`: momentum `m₀ v₀`, energy `½ m₀ ‖v₀‖²` and angular momentum of a free motion are
  constant.

### Dependencies

D.2 and D.3; Mathlib's calculus.

## Layer 2: The moment of inertia, Sundman's inequality and total collapse

### 2.1 The Lagrange–Jacobi identity

Prove `lagrangeJacobi`: for a solution on `s` and `t ∈ s`, the moment of inertia `t ↦ I(x t)` has
derivative `2 Σ mⱼ ⟨xⱼ, vⱼ⟩` within `s`, and `t ↦ Σ mⱼ ⟨xⱼ, vⱼ⟩` has derivative `2T − U` within
`s`. So `Ï = 4T − 2U = 4H + 2U` with `H = T − U`, for arbitrary real masses and about any origin
(Volchan, Lemma on p. 7, eq. (6), which reads `Ï' = 2T − U` for `I' = I/2`, in the centre-of-mass
frame; Montgomery, Exercise 3(B), p. 5, states `Ï = 4H + 2U`). The second derivative is
`Σ mⱼ ‖vⱼ‖² + Σ mⱼ ⟨xⱼ, newtonAccel m x j⟩`, and the Euler identity of D.2 turns the second sum
into `−U`. No centre-of-mass frame is needed: the Euler identity holds about every origin.

*Needs:* D.2, D.3.

### 2.2 Bounded motions have negative energy

Prove `energy_neg_of_bounded`: let `n ≥ 2`, all masses positive, `(x, v)` a solution on `[0, ∞)`
with total momentum `0`, and suppose some `R` bounds every mutual distance `‖xᵢ(t) − xⱼ(t)‖` for
`t ≥ 0`. Then the energy is negative (Montgomery, Corollary 1, p. 7, for three bodies in the
plane, with the centre of mass implicitly fixed).

*Route.* The centre of mass is fixed (1.1), so `I(x t) = I_c(t) + M‖c‖²` with `M = Σ mⱼ` and
`I_c = M⁻¹ Σ_{i<j} mᵢ mⱼ rᵢⱼ²` (Moeckel, eq. (9), p. 4), and `I(x t)` is bounded. Collision-freeness
at `t = 0` and `n ≥ 2` give `R > 0`, and `U ≥ m₀ m₁ / R`. If the energy `H` (constant by 1.2)
were `≥ 0`, 2.1 would give `Ï ≥ 4H + 2m₀m₁/R ≥ ε > 0` on `[0, ∞)`, hence
`I(x t) ≥ I(x 0) + İ(0) t + εt²/2 → ∞`, a contradiction. The source's sentence "strictly convex,
hence unbounded" needs this uniform lower bound on `Ï`: a strictly convex function can be bounded
on `[0, ∞)`.

*Needs:* 1.1, 1.2, 2.1; Mathlib `image_le_of_deriv_right_le_deriv_boundary`.

**Checks.**
- The total-momentum hypothesis is needed: two unit masses on the circular orbit of D.3 with a
  common drift of speed `3` orthogonal to the orbit plane have constant mutual distance `1` and
  energy `(½ + 9) − 1 = 17/2 > 0`.
- `n ≥ 2` is needed: one body at rest has momentum `0`, no mutual distance, and energy `0`.
- Positive masses are needed: masses `1, 0` with body `0` at rest and body `1` on a circular
  Kepler orbit around it have momentum `0`, bounded distance and energy `0`.

### 2.3 The virial theorem

Prove `tendsto_average_kineticEnergy`: for a solution on `[0, ∞)` whose virial
`J = Σ mⱼ ⟨xⱼ, vⱼ⟩ = İ/2` is bounded on `[0, ∞)`, `τ⁻¹ ∫₀^τ T(t) dt → −H` as `τ → ∞`, for
arbitrary real masses. Since `U = T − H`, also `τ⁻¹ ∫₀^τ U dt → −2H`, which is the form
`⟨T⟩ = ½⟨U⟩` of the source (Tong, *Cosmology*, §1.4.3, the Virial Theorem and its proof,
pp. 60–61, where positions and velocities are assumed bounded and the time averages are assumed to
exist). Bounded positions and velocities bound `J` (`|J| ≤ Σ |mⱼ| R_x R_v`), so the source's
statement is a special case; the existence of the averages is part of the conclusion here.

*Route.* By 2.1, `J` has derivative `2T − U = T + H` within `[0, ∞)`, continuous there; by the
fundamental theorem of calculus `∫₀^τ (T + H) = J(τ) − J(0)`, and `J` is bounded, so
`τ⁻¹ ∫₀^τ T = (J(τ) − J(0))/τ − H → −H`.

*Needs:* 1.2, 2.1; Mathlib `intervalIntegral.integral_eq_sub_of_hasDeriv_right_of_le`.

**Checks.**
- The bound on `J` is needed: one free body of mass `1` with velocity `v ≠ 0` has
  `J(t) = ⟨x₀, v⟩ + t‖v‖²`, unbounded, and average kinetic energy `½‖v‖² = H ≠ −H`.
- The circular two-body solution of D.3 has `J = 0`, `T = ½` constant and `H = −½`: the average
  is `½ = −H`.

### 2.4 Sundman's inequality

Prove `sundman_inequality`: for nonnegative masses and any `x, v : Fin n → E`,
`|C|² + (Σ mⱼ ⟨xⱼ, vⱼ⟩)² ≤ 2 I T`, with `|C|² = angularMomentumSq m x v`, `I = inertia m x`,
`T = kineticEnergy m v`; equivalently `|C|² + İ²/4 ≤ 2IT`. This is the strong form (Suzuki,
Nakamura and Yamada, eq. (1), p. 2, proved in Appendix A, eqs. (A1)–(A5), in `ℝ³`, in the form
`(Σ m r²)(Σ m v²) ≥ |Σ m r × v|² + (Σ m r · v)²`); dropping the second term gives the weak form
`|C|² ≤ 2IT` (Volchan, Lemma on p. 8, eqs. (10)–(12), which reads `c² ≤ 4I'T` for `I' = I/2`).
The statement here holds in every real inner product space.

*Route (proved here for every `E`).* All vectors lie in the finite-dimensional span `W` of the
`xⱼ, vⱼ`; fix an orthonormal basis `(e_a)` of `W` and write `C_ab = angularMomentum m x v e_a e_b`,
an antisymmetric matrix with `|C|² = Σ_{a<b} C_ab²` (D.2). Put `J = Σ mⱼ ⟨xⱼ, vⱼ⟩`. If `J = 0` and
`C = 0` there is nothing to prove. Otherwise let `ρ = (J² + |C|²)^(1/2) > 0`, `α = J/ρ` and let `B`
be the operator on `W` with matrix `C_ab/ρ`, antisymmetric.
1. `Σ_{a<b} (C_ab/ρ) C_ab + α J = ρ`, and the left side equals `Σⱼ mⱼ ⟨(α − B) xⱼ, vⱼ⟩`, since
   `Σ_{a<b} B_ab C_ab = Σⱼ mⱼ ⟨xⱼ, B vⱼ⟩ = −Σⱼ mⱼ ⟨B xⱼ, vⱼ⟩`.
2. By the Cauchy–Schwarz inequality with the nonnegative weights `mⱼ`, this is at most
   `(Σ mⱼ ‖(α − B) xⱼ‖²)^(1/2) (Σ mⱼ ‖vⱼ‖²)^(1/2)`.
3. `‖(α − B) y‖² = α²‖y‖² + ‖B y‖²`, because `⟨y, B y⟩ = 0`.
4. `‖B y‖² ≤ (Σ_{a<b} B_ab²) ‖y‖²` for antisymmetric `B`: for a unit vector `y` with `B y ≠ 0`, put
   `f₁ = y` and `f₂ = B y/‖B y‖` (orthogonal to `y`) and extend to an orthonormal basis; the sum
   `Σ_{a,b} ⟨f_a, B f_b⟩² = 2 Σ_{a<b} B_ab²` (it does not depend on the basis) contains the two
   terms `⟨f₂, B f₁⟩² = ‖B y‖²` and `⟨f₁, B f₂⟩² = ‖B y‖²`.
5. Hence `‖(α − B) y‖² ≤ (α² + Σ_{a<b} B_ab²) ‖y‖² = ‖y‖²`, and steps 1–2 give
   `ρ ≤ I^(1/2) (2T)^(1/2)`. Squaring gives the claim.

*Needs:* D.2; Mathlib `stdOrthonormalBasis`, `real_inner_le_norm`,
`Finset.sum_mul_sq_le_sq_mul_sq`.

**Checks.**
- The constant `2` is attained: for one body the two sides are equal (D.2, the value `406`). With
  Volchan's `I' = I/2` in place of `I` the inequality would read `406 ≤ 203`, which is false.
- Nonnegative masses are needed: masses `1, −1` at `x₀ = x₁ = (1, 0)` with `v₀ = (0, 1)`,
  `v₁ = 0` give `|C|² = 1`, `J = 0`, `I = 0`: `1 ≤ 0` fails.

### 2.5 Total collapse

Prove `angularMomentum_eq_zero_of_inertia_tendsto_zero`: let all masses be positive, `t₀ < t₁`,
and `(x, v)` a solution on `[t₀, t₁)` whose moment of inertia `I(x t)` tends to `0` as `t → t₁`
from below (all bodies collide at the origin at the finite time `t₁`; this is what total collapse
means here). Then `angularMomentum m (x t₀) (v t₀) = 0`, hence (1.3) the angular momentum is `0`
on all of `[t₀, t₁)` (Volchan, Theorem 1, pp. 8–9, in `ℝ³` and the centre-of-mass frame; he
credits Weierstrass for three bodies and Sundman in general). No centre-of-mass hypothesis is
made: `I → 0` about the origin puts the collapse at the origin, and the first step below reduces
to the centre-of-mass frame. The source's proof is completed below; it bounds
`h (I(t₂) − I(t₁))` by `h I(t₂)`, which needs `h ≥ 0`.

*Route (the source's argument, with a reduction and a repair).*
1. *Reduction.* Let `M = Σ mⱼ`, `c(t)` the centre of mass and `P` the total momentum; by 1.1
   `c(t) = c(t₀) + (t − t₀)P/M`. Then `yⱼ = xⱼ − c` and `wⱼ = vⱼ − P/M` form a solution on
   `[t₀, t₁)` (the acceleration depends only on differences) with centre of mass `0` and momentum
   `0`. Expanding, `I(x) = I(y) + M‖c‖²`, so `I(y) → 0` and `c(t) → 0`, which forces
   `c(t₀) + (t₁ − t₀)P/M = 0`; and `angularMomentum m x v` is `angularMomentum m y w` plus
   the bilinear form `(a, b) ↦ ⟨c, a⟩⟨P, b⟩ − ⟨c, b⟩⟨P, a⟩`, which is constant in `t` (as `ċ` is
   parallel to `P`) and tends to `0`, hence is `0`. So it suffices to treat `(y, w)`.
   For `n ≤ 1` then `y = 0` and there is nothing to prove; let `n ≥ 2`.
2. *Collapse of distances.* `I(y) = M⁻¹ Σ_{i<j} mᵢ mⱼ rᵢⱼ²`, so every `rᵢⱼ → 0` and
   `U ≥ m₀ m₁ / r₀₁ → ∞`. By 2.1 and the constancy of `H` (1.2), `Ï = 4H + 2U → ∞`; fix
   `s₀ ∈ [t₀, t₁)` with `Ï > 0` on `[s₀, t₁)`.
3. *Monotonicity.* `İ < 0` on `[s₀, t₁)`: if `İ(s) ≥ 0` there, `İ` increases on `[s, t₁)`, so `I`
   does not decrease there, against `I(s) > 0` (collision-free, `n ≥ 2`) and `I → 0`.
4. *Sundman.* From 2.4 and `T = Ï/2 − H` (2.1), `Ï ≥ |C|²/I + 2H` on `[t₀, t₁)`, where `|C|²` is
   constant (1.3).
5. *A decreasing quantity.* `Ψ = İ²/2 − |C|² log I − 2H I` has derivative
   `İ (Ï − |C|²/I − 2H) ≤ 0` on `[s₀, t₁)` (step 3 and step 4), so `Ψ(t) ≤ Ψ(s₀)`. Hence
   `−|C|² log I(t) ≤ Ψ(s₀) + 2H I(t) − İ(t)²/2 ≤ Ψ(s₀) + 2|H| I(s₀)`, since `0 < I(t) ≤ I(s₀)`.
   The right side does not depend on `t`, while `−log I(t) → ∞`; so `|C|² = 0`. By the formula
   of D.2 on an orthonormal basis of the span of the `yⱼ, wⱼ`, every value of the form is then `0`
   on that span, and it vanishes when an argument is orthogonal to the span; so `C = 0`.

The repair is in step 5: the source's (19)–(20) use `h (I(t₂) − I(t₁)) ≤ h I(t₂)`; here the term
`2H I(t)` is bounded by `2|H| I(s₀)` for either sign of `H`.

*Needs:* 1.1, 1.2, 1.3, 2.1, 2.4; Mathlib `antitoneOn_of_deriv_nonpos`.

**Checks.**
- The homothetic solutions of 3.1 collapse in finite time with `C = 0`: for the equal-mass
  equilateral triangle released from rest, every velocity is parallel to its position.
- The circular two-body solution of D.3 has `C ≠ 0` and `I = ½` constant: it does not collapse.
- The repair matters for `H < 0`, which is the case of the homothetic collapse released from rest
  (`T = 0` at release, so `H = −U < 0`).
- Positive masses are needed: for masses `1, −1` in the plane the separation `d = x₁ − x₀` has
  `d̈ = 0` and both bodies have acceleration `−d/‖d‖³`. With `d = (1, 0)`,
  `x₀(t) = (−1 + t − t²/2, t)`, `x₁ = x₀ + d` and `v₀ = v₁ = ẋ₀`, this is a collision-free
  solution on `[0, 1)` with `I = ‖x₀‖² − ‖x₁‖² = (1 − t)² → 0`, while the angular momentum on
  `(e₁, e₂)` is `−1`.

### Examples

- For two bodies, `I → 0` at a finite time with nonzero angular momentum is impossible, matching
  the fact that a Kepler orbit with `C ≠ 0` stays away from collision.

### Dependencies

Layer 1 and D.2–D.3; Mathlib's mean-value inequalities, interval integrals and orthonormal bases.

## Layer 3: Central configurations

### 3.1 Homothetic solutions

Prove `isSolutionOn_homothetic`: if `x₀` is a central configuration with constant `lam`, and
`r > 0` on `s` with `ṙ = r'` and `ṙ' = −lam/r²` within `s` (the one-dimensional Kepler problem),
then `x(t) = c + r(t)(x₀ − c)`, `v(t) = r'(t)(x₀ − c)`, with `c` the centre of mass of `x₀`, is a
solution on `s` (Moeckel, Proposition 1, p. 6, first half). This holds for arbitrary real masses:
`newtonAccel m (c + r(x₀ − c)) = r⁻² newtonAccel m x₀ = −lam r⁻²(x₀ − c)`, since the acceleration
depends only on differences and is homogeneous of degree `−2`.

Prove `exists_isCentralConfiguration_of_homothetic`, the converse: let `n ≥ 2`, all masses
positive, `s` open and nonempty, `r > 0` on `s`, and suppose `x(t) = r(t) x₀`, `v(t) = r'(t) x₀`
is a solution on `s`. Then the centre of mass of `x₀` is `0`, and for some `lam` the configuration
`x₀` is central with constant `lam` and `r'` has derivative `−lam/r²` on `s` (Moeckel,
Proposition 1, second half, there with `x₀` centred).

*Route.* Collision-freeness and `n ≥ 2` give a body with `x₀ⱼ ≠ 0`; pairing the velocity equation
with that `x₀ⱼ` shows that `r'` is differentiable, with derivative `ρ(t)`, and then
`newtonAccel m x₀ = ρ(t) r(t)² x₀`. The Euler identity gives
`Σ mⱼ ⟨x₀ⱼ, newtonAccel m x₀ j⟩ = −U(x₀) < 0`, so `newtonAccel m x₀ ≠ 0` and the factor
`κ = ρ r²` does not depend on `t`; put `lam = −κ = U(x₀)/I(x₀) > 0`. Summing
`mⱼ newtonAccel m x₀ j = −lam mⱼ x₀ⱼ` over `j` gives `lam Σ mⱼ x₀ⱼ = 0`, so the centre of mass is
`0`.

*Needs:* D.2, D.4.

**Checks.**
- `n ≥ 2` is needed for the converse: for `n = 1` and `x₀ = 0` every pair `r, r'` with `ṙ = r'`
  gives a solution, also when `r'` is not differentiable (`r(t) = 2 + t|t|/2`, `r'(t) = |t|` on
  `s = (−1, 1)`, where `r > 0` and `r'` has no derivative at `0`).
- Positive masses are needed for the converse: masses `1, −¼, 1` at `0, 1, 2` on a line feel no
  acceleration (`newtonAccel = 0` for each body), so `r(t) = 1 + t`, `r' = 1` gives a homothetic
  solution on `s = (−1, ∞)`, where `r > 0`, but the centre of mass of `x₀` is `1 ≠ 0`.
- `s` open and nonempty are needed for the form of the conclusion: for `s = ∅` every `x₀`
  satisfies the hypotheses, and at an end point of a closed interval nothing constrains `r'` from
  outside `s`.
- Three equal masses at an equilateral triangle released from rest: `r(0) = 1`, `r'(0) = 0`, and
  the bodies fall along straight lines to the centre of mass.

### 3.2 Planar homographic solutions

Prove `isSolutionOn_homographic`: let `E = ℂ`, `x₀` a central configuration with constant `lam`
and centre of mass `c`, and `z : ℝ → ℂ` nonzero on `s` with `ż = z'` and `ż' = −lam z/|z|³` within
`s` (the planar Kepler problem). Then `x(t) = c + z(t)(x₀ − c)`, `v(t) = z'(t)(x₀ − c)`
(complex multiplication) is a solution on `s`, for arbitrary real masses (Moeckel,
Proposition 2, p. 8, the first half, written with complex numbers as in Montgomery's ansatz (20),
p. 5). The route is the identity
`newtonAccel m (c + z(x₀ − c)) = (z/|z|³) newtonAccel m x₀`: multiplication by `z` is `|z|` times a
rotation, and the acceleration commutes with rotations.

*Needs:* D.2, D.4.

**Checks.**
- With `z(t) = e^(i√lam t)` (a circular Kepler orbit) the central configuration rotates rigidly
  with angular velocity `√lam`; for two unit masses at distance `1` (`lam = 2`) this is the solution
  of D.3.
- With `z` real this is the homothetic solution of 3.1 in `E = ℂ`.

### 3.3 The variational characterisation

Prove `isCritical_iff_isCentralConfiguration`: let `n ≥ 2`, all masses positive and `x`
collision-free. Then `x` is a critical point of `U` on the ellipsoid `{I = 1}` (that is,
`I(x) = 1` and the derivative of `U` at `x` vanishes on the kernel of the derivative of `I` at
`x`) if and only if `x` is a normalised central configuration: `I(x) = 1`, its centre of mass is
`0`, and it is central for some `lam` (Moeckel, Proposition 12, p. 26).

*Route.* The derivatives are `dI(x)h = 2 Σ mⱼ ⟨xⱼ, hⱼ⟩` and
`dU(x)h = Σ mⱼ ⟨newtonAccel m x j, hⱼ⟩`. A linear form vanishing on the kernel of the nonzero form
`dI(x)` is a multiple `κ dI(x)`, so criticality says `newtonAccel m x j = −lam xⱼ` with
`lam = −2κ`. Pairing with `mⱼ xⱼ` and summing gives `lam = U(x)/I(x) = U(x) > 0` (Euler identity);
summing `mⱼ newtonAccel m x j = −lam mⱼ xⱼ` gives centre of mass `0`. The converse reads the same
computation backwards.

*Needs:* D.2, D.4; Mathlib's derivative of the norm and of `‖·‖⁻¹` away from `0`.

**Checks.**
- `n ≥ 2` is needed: for one body with `m₀ = 1` and `x₀ = 1` in `ℝ`, `U = 0` is critical
  everywhere, `I = 1`, but the centre of mass is `1 ≠ 0`.
- Three equal masses `1` at `±1/√2` and `0` on a line are critical (they are the normalised
  configuration of D.4); at `0, 1, 3`, rescaled to `I = 1`, they are not.
- Positive masses are needed: masses `1, 1, 0` at `−1/√2, 1/√2, 5` on a line have `I = 1`, centre
  of mass `0`, and are critical (the massless body enters neither `U` nor `I`), but they are not
  central: the first two bodies need `lam = √2/2` and the third `lam = 204/12005`.

### 3.4 The regular simplex

Prove `isCentralConfiguration_iff_dist_eq`: for positive masses and an affinely independent
configuration `x`, `x` is central (for some `lam`) if and only if all mutual distances are equal
to one `a > 0` (Moeckel, Proposition 14, p. 28: the only central configuration of `n` bodies whose
centred positions span an `(n − 1)`-dimensional space is the regular simplex, central for every
choice of masses). Then `lam = M/a³`. For three bodies: a non-collinear central configuration is
an equilateral triangle (Lagrange).

*Route (proved here; the source argues with the mutual distances as local coordinates).* With
`M = Σ mᵢ` and `c` the centre of mass,
`newtonAccel m x j + lam (xⱼ − c) = Σ_{i≠j} mᵢ (rᵢⱼ⁻³ − lam/M)(xᵢ − xⱼ)`. Affine independence
makes the vectors `xᵢ − xⱼ` (`i ≠ j`, `j` fixed) linearly independent, so every coefficient
vanishes: `rᵢⱼ³ = M/lam` for all `i ≠ j`, which forces `lam > 0`. Conversely, if every distance is
`a`, the same identity with `lam = M/a³` shows that `x` is central.

*Needs:* D.4; Mathlib `affineIndependent_iff_linearIndependent_vsub`.

**Checks.**
- Masses `1, 2, 3` at an equilateral triangle of side `2`: `lam = 6/8 = 3/4` (D.4).
- The isosceles configuration of D.4 is affinely independent and not central, as the theorem
  predicts.
- `n = 1`: a single point is affinely independent, central, and there is no pair: both sides hold.
- Some condition on the masses is needed: for masses `1, −1` the total mass is `0`, the centre of
  mass is Lean's junk value `0`, and two distinct points (affinely independent, one distance) are
  not central: the two equations force `lam (x₁ − x₀) = 0`, so `lam = 0`, and then `x₀ = x₁`.

### 3.5 Collinear central configurations

Prove `existsUnique_collinear`: let `n ≥ 2` and all masses positive, with the bodies on the line
`E = ℝ`. For every ordering `σ` of the bodies there is exactly one configuration `x : Fin n → ℝ`
with `x ∘ σ` strictly increasing, centre of mass `0`, `I(x) = 1`, and central for some `lam`
(Moulton; Moeckel, Proposition 18, p. 32, with proof pp. 33–35). The reflection `x ↦ −x` carries
the configuration of an ordering to that of the reversed ordering, so up to similarity on the line
there are exactly `n!/2` collinear central configurations, and three (Euler) when `n = 3`.

*Route.*
1. *Existence.* The set `V_σ` of normalised configurations with ordering `σ` is nonempty (centre
   and rescale `xⱼ = rank of j`) and open in the compact ellipsoid `N = {centre of mass 0, I = 1}`;
   its boundary in `N` consists of collisions, where `U → ∞`. So `U` attains a minimum on `V_σ`,
   and `dU(x)` vanishes on the tangent space of `N` at the minimiser `x`. It also vanishes on the
   translation direction `(1, …, 1)`, along which `I` has derivative `2 Σ mⱼ xⱼ = 0`; these two
   span the kernel of `dI(x)`, so `x` is critical on `{I = 1}` and 3.3 makes it a normalised central
   configuration.
2. *Uniqueness.* A normalised central configuration has `lam = U > 0` (D.4); rescaling by
   `k = (lam/2)^(1/3)` gives a centred configuration with ordering `σ` and constant `2`, which is a
   critical point of `F = U + I` on the subspace `{Σ mⱼ xⱼ = 0}`, inside the open convex cone
   `K_σ` of centred configurations with ordering `σ`. On `K_σ`,
   `F = Σ_{i<j} mᵢ mⱼ (1/rᵢⱼ + rᵢⱼ²/M)` and each `rᵢⱼ` is linear along a segment; along a segment
   from `x` to `y ≠ x` the second derivative of `F` is
   `Σ_{i<j} mᵢ mⱼ (2/rᵢⱼ³ + 2/M)(rᵢⱼ′)² > 0` (not all `rᵢⱼ′` vanish, as two centred
   configurations with the same differences are equal). A strictly convex function on a segment
   has at most one critical point, so the rescaled configurations agree, and `I = 1` fixes the
   scale.

*Needs:* 3.3, D.4; Mathlib `IsCompact.exists_isMinOn`.

**Checks.**
- `n ≥ 2` is needed: for `n = 1` the conditions `m₀x₀ = 0` and `m₀x₀² = 1` are incompatible, so
  there is no such configuration.
- Positive masses are needed: for masses `1, −½` a configuration with centre of mass `0` has
  `x₁ = 2x₀` and `I = x₀² − 2x₀² = −x₀²`, never `1`, so there is none.
- Three equal unit masses: for the ordering `0 < 1 < 2` the configuration is `(−1/√2, 0, 1/√2)`.
- Masses `1, 2, 3`, bodies at `0, 1, 1 + ρ` in this order: the central configuration condition
  reduces to one rational equation in `ρ`, which has exactly one positive root, `ρ ≈ 1.28095`; the
  reversed ordering gives `ρ ≈ 0.780672 ≈ 1/1.28095`. All six orderings give exactly one positive
  root.

### Examples

- `n = 3` in the plane: by 3.4 every non-collinear central configuration is equilateral, and by
  3.5 there are three collinear ones up to similarity. Up to translation, rotation and scaling
  (reflections not allowed) the collinear ones are still three, since `x ↦ −x` is a rotation of
  the plane, and the equilateral ones are two, one for each orientation of the labelled triangle:
  five in all, matching Montgomery's count of five critical points modulo rotations and
  translations (p. 6). With reflections allowed, as in the similarity of D.4, there are four.

### Dependencies

D.2 and D.4; 3.5 uses 3.3. Layer 3 does not use Layers 1 and 2.

## Layer 4: Lagrange points of the circular restricted three-body problem

No open source with complete proofs of the statements of this layer was found (Tong, *Classical
Dynamics*, §2.5.5, pp. 33–35, states the five points and outlines their existence in other units;
nothing there treats the spectrum). Every route below is complete and proved here.

### 4.1 The five equilibria

Prove `restrictedField_equilibria`: for `0 < μ < 1` there are `a₃ < −μ < a₁ < 1 − μ < a₂` such that
the zeros of `restrictedField μ` whose position is not a primary are exactly the five states
`(a₁, 0, 0, 0)`, `(a₂, 0, 0, 0)`, `(a₃, 0, 0, 0)`, `(½ − μ, ±√3/2, 0, 0)`: the equilibria `L₁`,
`L₂`, `L₃`, `L₄`, `L₅` at rest.

*Route (proved here).* A zero has `u = v = 0` and `∇Ω = 0`. Write `s₁ = x + μ`, `s₂ = x − 1 + μ`
(so `s₁ − s₂ = 1` and `x = (1 − μ)s₁ + μ s₂`) and `A = (1 − μ)/r₁³ + μ/r₂³`. Then
`∂ᵧΩ = y(1 − A)` and `∂ₓΩ = (1 − μ)s₁(1 − r₁⁻³) + μ s₂(1 − r₂⁻³)`.
1. *Off the axis.* If `y ≠ 0`, then `A = 1`, and then `∂ₓΩ = (1 − μ)(1 − r₁⁻³)(s₁ − s₂)`, which
   vanishes only for `r₁ = 1`; `A = 1` then gives `r₂ = 1`, and `r₁ = r₂ = 1` gives `x = ½ − μ`,
   `y = ±√3/2`. Conversely these two points are zeros.
2. *On the axis.* For `y = 0`, `∂ᵧΩ = 0`, and `f(x) = ∂ₓΩ(x, 0)` has derivative
   `1 + 2(1 − μ)/|s₁|³ + 2μ/|s₂|³ > 0` on each of `(−∞, −μ)`, `(−μ, 1 − μ)`, `(1 − μ, ∞)`, and runs
   from `−∞` to `+∞` on each (it tends to `+∞` from the left of each primary and to `−∞` from the
   right, and behaves like `x` at `±∞`). By the intermediate value theorem and strict monotonicity
   there is exactly one zero in each interval.

*Needs:* D.5; Mathlib `intermediate_value_Ioo`, `strictMonoOn_of_deriv_pos`.

**Checks.**
- For `μ = ½` the configuration is symmetric: `a₁ = 0`, `a₂ = −a₃`, and `L₄ = (0, √3/2)`.
- The triangular points form, with the two primaries, the equilateral central configuration of 3.4
  with a massless third body.

### 4.2 Linearisation at the triangular points: the Routh criterion

Let `y₀ = ±√3/2` and let `A` be the matrix of the derivative of `restrictedField μ` at the state
`(½ − μ, y₀, 0, 0)` (`L₄` or `L₅`). Prove:

- `triangular_spectrum_of_lt`: if `27μ(1 − μ) < 1`, the complex spectrum of `A` has exactly four
  elements, all purely imaginary and nonzero;
- `triangular_spectrum_of_gt`: if `27μ(1 − μ) > 1`, no eigenvalue of `A` lies on the imaginary axis
  and exactly two have positive real part;
- `triangular_spectrum_of_eq`: if `27μ(1 − μ) = 1`, the characteristic polynomial of `A` is
  `(X² + ½)²` and `A − (±i/√2)·1` has rank `3`, so the eigenvalues are `±i/√2`, each of algebraic
  multiplicity `2` and geometric multiplicity `1`: `A` is not diagonalisable, and neither of the
  first two cases holds.

This is the criterion classically attributed to Routh and Gascheau; it is not Lyapunov stability
of `L₄` (nonlinear stability is not treated here), and the boundary case is neither "stable" nor
"unstable" in the spectral sense: it is written out exactly.

*Route (proved here).*
1. *The matrix.* With `a = ∂ₓₓΩ`, `b = ∂ₓᵧΩ`, `c = ∂ᵧᵧΩ` at the point,
   `A = [[0, 0, 1, 0], [0, 0, 0, 1], [a, b, 0, 2], [b, c, −2, 0]]`, and
   `det(λ − A) = λ⁴ + (4 − a − c)λ² + (ac − b²)` (expansion of the determinant).
2. *The Hessian.* At `L₄` and `L₅`, `r₁ = r₂ = 1`, and a term `m/r` with offset `(X, Y)` at `r = 1`
   has second derivatives `m(3X² − 1)`, `3mXY`, `m(3Y² − 1)`. The offsets are `(½, y₀)` from the
   first primary and `(−½, y₀)` from the second, so `a = 3/4`, `c = 9/4` and
   `b = (3√3/4)(1 − 2μ) · sign(y₀)`.
3. *The polynomial.* `4 − a − c = 1` and `ac − b² = (27/16)(1 − (1 − 2μ)²) = (27/4)μ(1 − μ)`, so
   `det(λ − A) = λ⁴ + λ² + k` with `k = (27/4)μ(1 − μ) > 0`, at both points.
4. *Roots.* With `σ = λ²`, `σ² + σ + k = 0` has discriminant `D = 1 − 4k = 1 − 27μ(1 − μ)`.
   - `D > 0`: two distinct real roots with sum `−1` and product `k > 0`, both negative; the
     eigenvalues are `±i√(−σ₁)`, `±i√(−σ₂)`, four distinct, purely imaginary, nonzero.
   - `D < 0`: `σ` is not real. An eigenvalue `λ` with real part `0` would have `λ² ≤ 0` real; so
     no eigenvalue is on the imaginary axis. The polynomial is even, so the roots come in pairs
     `±λ`, the two values of `σ` are distinct and nonzero, and exactly two roots have positive real
     part.
   - `D = 0`: `λ⁴ + λ² + ¼ = (λ² + ½)²`. The `3 × 3` minor of `A − λ` on rows `1, 2, 3` and
     columns `2, 3, 4` equals `b + 2λ`, which is not `0` for `λ = ±i/√2` since `b` is real; so
     `A ∓ (i/√2)` has rank exactly `3`.
5. *The derivative.* On a neighbourhood of the point, away from the primaries, the field is smooth
   and its derivative is the matrix of step 1, which identifies `A`.

*Needs:* D.5; Mathlib `Matrix.mem_spectrum_iff_isRoot_charpoly`, `Matrix.charpoly`,
`Matrix.rank`.

**Checks.**
- The Hessian values `3/4`, `±(3√3/4)(1 − 2μ)`, `9/4`, the polynomial identity of step 1, the
  value `k = (27/4)μ(1 − μ)` and the minor `b + 2λ` were checked symbolically.
- At `μ = μ_R` the characteristic polynomial is `(λ² + ½)²` and both ranks are `3` (exact
  computation with `(1 − 2μ_R)² = 23/27`).
- Earth–Moon (`μ ≈ 0.0121 < μ_R`) falls in the first case; `μ = ½` gives `27/4 > 1`, the second.
- A plausible wrong statement, "the eigenvalues are purely imaginary if and only if
  `27μ(1 − μ) ≤ 1`, and then the linear system is stable", fails at `μ = μ_R`: the eigenvalues are
  purely imaginary but the linearised system has solutions growing like `t`.

### 4.3 Linearisation at the collinear points

Prove `collinear_exists_pos_eigenvalue`: for `0 < μ < 1`, let `a` be neither primary with
`restrictedField μ (a, 0, 0, 0) = 0` (that is, `a ∈ {a₁, a₂, a₃}` of 4.1), and let `A` be the matrix
of the derivative there. Then `A` has a real positive eigenvalue.

*Route (proved here, for every `μ`).*
1. On the axis `∂ₓᵧΩ = 0`, `∂ₓₓΩ = 1 + 2A₀` and `∂ᵧᵧΩ = 1 − A₀`, with
   `A₀ = (1 − μ)/|s₁|³ + μ/|s₂|³`. By step 1 of 4.2 the characteristic polynomial is
   `λ⁴ + (2 − A₀)λ² + (1 + 2A₀)(1 − A₀)`.
2. *Claim: `A₀ > 1` at each collinear equilibrium.* Put `α = (1 − μ)(r₁⁻³ − 1)` and
   `β = μ(r₂⁻³ − 1)`, so `A₀ − 1 = α + β`; the equation `∂ₓΩ = 0` reads `s₁ α = −s₂ β`
   (from the form of `∂ₓΩ` in 4.1).
   - `L₁` (`0 < s₁ < 1`, `−1 < s₂ < 0`): `r₁, r₂ < 1`, so `α, β > 0`.
   - `L₂` (`s₂ > 0`, `s₁ = 1 + s₂ > 1`): `α < 0`, and `β = (s₁/s₂)|α| > |α|`, so `α + β > 0`.
   - `L₃` (`s₁ < 0`, `s₂ = s₁ − 1 < −1`): `β < 0`, and `α = (s₂/s₁)|β| = (1 − 1/s₁)|β| > |β|`, so
     `α + β > 0`.
3. Then the product `(1 + 2A₀)(1 − A₀)` of the two roots `σ` of `σ² + (2 − A₀)σ + (1 + 2A₀)(1 − A₀)`
   is negative, so one root `σ₊` is positive and `√σ₊` is a real positive eigenvalue.

*Needs:* 4.1 (the form of `∂ₓΩ`), step 1 of 4.2; Mathlib `Matrix.mem_spectrum_iff_isRoot_charpoly`.

**Checks.**
- The axis Hessian `(1 + 2A₀, 0, 1 − A₀)`: on the axis a term `m/r` at offset `X` has
  `∂ₓₓ = 2m/|X|³`, `∂ₓᵧ = 0`, `∂ᵧᵧ = −m/|X|³`; at `μ = ⅓`, `x = 1/7` this gives
  `A₀ = (2/3)(21/10)³ + (1/3)(21/11)³` and both identities hold exactly.
- A grid check is not the proof: the claim `A₀ > 1` is proved in step 2 for every `μ ∈ (0, 1)`.
  At `μ = ½`, `L₁ = 0` with `r₁ = r₂ = ½`, so `A₀ = 8`, and the eigenvalues satisfy
  `σ² − 6σ − 119 = 0`, `σ₊ = 3 + √128`.

### 4.4 Instability

Prove `not_isLyapunovStable_collinear`: for `0 < μ < 1`, every collinear equilibrium `(a, 0, 0, 0)`
of 4.3 is not Lyapunov stable for `restrictedField μ`. Prove `not_isLyapunovStable_triangular`: if
`27μ(1 − μ) > 1`, the triangular equilibria `(½ − μ, ±√3/2, 0, 0)` are not Lyapunov stable.
Lyapunov stability is the notion of LyapunovStabilityOfODEs, Layer 1 (1.2), whose definitions
`forwardSolutions` and `IsLyapunovStable` are copied verbatim.

*Route (the localisation step is proved here).* Let `L` be the equilibrium and `A` the derivative
matrix; by 4.3 or 4.2 some eigenvalue of `A` has positive real part.
1. *A globally smooth field.* `restrictedField μ` agrees, on the open set `W` of states whose
   position is not a primary, with the field written with the explicit partial derivatives of `Ω`,
   which is smooth on `W`. Take a smooth bump function equal to `1` on a ball `B(L, ρ)` and
   supported in a closed ball inside `W`; its product with the explicit field, extended by `0`, is a
   field `g` that is smooth with compact support on `Fin 4 → ℝ`, hence globally Lipschitz, equal to
   `restrictedField μ` on `B(L, ρ)`, with derivative `A` at `L`.
2. *Instability of `g`.* LyapunovStabilityOfODEs, Layer 5, instability from the linearization
   (5.3, `not_isLyapunovStable_of_re_pos`), applies to `g`, which is continuously differentiable
   on all of `Fin 4 → ℝ`: `L` is not Lyapunov stable for `g`.
3. *Localisation.* If `L` were Lyapunov stable for `restrictedField μ`, it would be for `g`: given
   `ε > 0` take `δ` for `min ε ρ`. From a point within `δ`, a forward solution for
   `restrictedField μ` exists and stays in `B(L, ρ)`, where the two fields agree, so it is a forward
   solution for `g`; and every forward solution for `g` from that point coincides with it on
   `[0, ∞)` by uniqueness for the Lipschitz field `g`. So it stays within `ε` of `L`.

*Needs:* 4.2, 4.3; LyapunovStabilityOfODEs 1.1, 1.2, 5.3; Mathlib `ContDiffBump`,
`ODE_solution_unique_of_mem_Icc_right`.

**Checks.**
- The theorem says nothing about `L₄`, `L₅` when `27μ(1 − μ) ≤ 1`: there the spectrum lies on the
  imaginary axis and the linearisation decides nothing.

### Examples

- Sun–Jupiter (`μ ≈ 0.00095`): the triangular points satisfy the first case of 4.2, and all three
  collinear points are unstable.

### Dependencies

D.5; 4.2 and 4.3 use step 1 of 4.2; 4.4 uses 4.2, 4.3 and LyapunovStabilityOfODEs, Sections 1.1,
1.2 and 5.3. Layer 4 does not use Layers 1–3.

## Scope and ownership

This roadmap owns the Newtonian `n`-body equations on a real inner product space with the
definitions of the design note, the three classical first integrals (Layer 1), the
Lagrange–Jacobi identity, the negative energy of bounded motions, the virial theorem, Sundman's
inequality and the total collapse theorem (Layer 2), central configurations with their homothetic
and planar homographic solutions, the variational characterisation, the simplex theorem and
Moulton's theorem (Layer 3), and the equilibria of the planar circular restricted three-body
problem with the spectrum of their linearisations and the instability statements (Layer 4).

- **Lyapunov stability.** The notions `forwardSolutions` and `IsLyapunovStable` and the instability
  theorem from the linearisation are stated by LyapunovStabilityOfODEs (1.1, 1.2 and 5.3); 4.4 uses
  them and copies the two definitions verbatim. This roadmap states no stability theorem of its
  own.
- **The Kepler problem.** Conservation laws, the Runge–Lenz vector, conic orbits, the period and the
  action variables of the planar Kepler problem are stated by SymplecticGeometry, part
  IntegrableSystems, §I4, examples that exercise the full API (the central-force and Kepler
  bullets), and partly proved in Tau Ceti's
  central-force files (`TauCeti.rungeLenz`, `TauCeti.centralForceHamiltonian`).
  Here solutions of the Kepler equations enter 3.1 and 3.2 only as hypotheses; nothing about them
  is stated. The angular momentum of D.2 is the mass-weighted sum over the bodies of
  `TauCeti.angularMomentum`, the one-particle angular momentum of the same file.
- **The restricted problem's Hamiltonian.** RestrictedThreeBody (an open roadmap, not on main; its Lane B,
  items 7–9) treats the rotating-frame Hamiltonian, Hamilton's equations, the Jacobi integral and the limit
  `μ = 0`, and states Poincaré's nonintegrability theorem. This roadmap defines the amended
  potential `Ω`, which is `(x² + y²)/2` plus the planar potential of RestrictedThreeBody (the
  same masses at the same points), and studies only the equilibria and their linearisations,
  which that roadmap does not treat; this roadmap does not depend on that one.
  Hill regions, which follow from the Jacobi integral, are not treated here.
- **Hamiltonian systems.** HamiltonianSystems (an open roadmap, not on main) develops Noether's theorem and moment maps
  abstractly; the first integrals of Layer 1 are proved directly on the equations of motion, and
  this roadmap does not depend on that one.

Not treated here: Chazy's theorem that a total collapse is asymptotic to a central configuration;
the Morse indices of collinear central configurations and of the simplex (Moeckel, Propositions
19 and 22); finiteness questions for central configurations; balanced configurations and
relative equilibria in dimension above two; regularisation of binary collisions and Sundman's
series; the nonlinear (KAM-type) stability of `L₄` and `L₅`; Hill regions; the spatial restricted
problem.

## Exact supplier contracts

### From Mathlib

- `HasDerivWithinAt`, `HasDerivAt`, `deriv`, `fderiv`: the definitions of solutions (D.3), of the
  restricted field (D.5) and of the derivative matrices (4.2–4.4).
- `IsIntegralCurveOn` (`Mathlib/Analysis/ODE/Basic.lean`): integral curves on a set of times, with
  derivatives within that set; used by the copied definitions of 4.4 and for the reformulation of
  D.3.
- `constant_of_derivWithin_zero`: a function with zero derivative within an interval is constant
  (Layer 1).
- `image_le_of_deriv_right_le_deriv_boundary`: comparison of a function with a lower barrier from
  derivative bounds (2.2).
- `intervalIntegral.integral_eq_sub_of_hasDeriv_right_of_le`: the fundamental theorem of calculus
  with a continuous derivative (2.3).
- `antitoneOn_of_deriv_nonpos`: a function with nonpositive derivative on a convex set is
  antitone (2.5).
- `stdOrthonormalBasis`, `real_inner_le_norm`, `Finset.sum_mul_sq_le_sq_mul_sq`: an orthonormal
  basis of a finite-dimensional span and the Cauchy–Schwarz inequalities (2.4).
- `affineIndependent_iff_linearIndependent_vsub`: affine independence as linear independence of
  differences (3.4).
- `IsCompact.exists_isMinOn`: a continuous function attains its minimum on a nonempty compact
  set (3.5).
- `intermediate_value_Ioo`, `strictMonoOn_of_deriv_pos`: one zero per interval (4.1).
- `Matrix.charpoly`, `Matrix.mem_spectrum_iff_isRoot_charpoly`, `Matrix.rank`, `spectrum`: the
  eigenvalues of the linearisations (4.2, 4.3).
- `ContDiffBump`: smooth bump functions (4.4).
- `ODE_solution_unique_of_mem_Icc_right`: uniqueness of solutions of an equation Lipschitz in the
  state, forward in time (4.4).

### From TauCetiRoadmap.LyapunovStabilityOfODEs

- 1.1 `forwardSolutions` and 1.2 `IsLyapunovStable`, copied verbatim into `Suggested.lean`.
- 5.3 `not_isLyapunovStable_of_re_pos`: for a continuously differentiable `f` on `n → ℝ` whose
  derivative at `x₀` is the matrix `A`, an eigenvalue of `A` (in `ℂ`) with positive real part
  implies that `x₀` is not Lyapunov stable. Used in 4.4, for a globally smooth modification of the
  restricted field.

## References

- R. Moeckel, *Lectures on central configurations*, lecture notes, Centre de Recerca Matemàtica,
  Barcelona, January 2014 (version dated March 20, 2014), on the author's page
  https://www-users.math.umn.edu/~rmoeckel/notes/CentralConfigurations.pdf. Used: eqs. (1), (2),
  (7), (9); Definition 1; Propositions 1, 2, 12, 14, 18 with proofs; §2.
- R. Montgomery, *The three-body problem and the shape sphere*, arXiv:1402.0841v1 (2014).
  Used: Proposition 1, Exercise 3, ansatz (20), Corollary 1.
- S. B. Volchan, *Some insights from total collapse*, arXiv:0803.2258v1 (2008). Used: the
  Lagrange–Jacobi lemma (p. 7), the lemma on Sundman's inequality (p. 8) and Theorem 1 with its
  proof (pp. 8–9).
- H. Suzuki, Y. Nakamura and S. Yamada, *General relativistic effects on Hill stability of
  multi-body systems I: stability of three-body systems containing a massive black hole*,
  arXiv:2009.06999v2 (2020). Used: eq. (1) and Appendix A.
- D. Tong, *Cosmology*, lecture notes, University of Cambridge, 2019, on the author's page
  http://www.damtp.cam.ac.uk/user/tong/cosmo.html. Used: §1.4.3, the virial theorem.
- D. Tong, *Classical Dynamics*, lecture notes, University of Cambridge, 2004–2005, on the
  author's page http://www.damtp.cam.ac.uk/user/tong/dynamics.html. Used: §2.5.5 (statement only).
