# Roadmap: the cubic Szegő equation

**Summary.** Develop the Hamiltonian evolution `i ∂ₜ u = Π(|u|² u)` on the nonnegative-frequency
Hardy space of the circle. Starting from the global `H^(1/2)` Cauchy theory (Theorem 2.1 of
Gérard–Grellier: for every `u₀ ∈ H^(1/2)₊` there is a unique solution `u ∈ C(ℝ, H^(1/2)₊)`, with
`Q + M` conserved), build the antilinear Hankel operator `H_u` and its Lax pair, the commuting
spectral invariants `J_n(u) = ⟨1, H_uⁿ 1⟩`, and the invariant finite-rank rational manifolds
`M(N)`. On the three-complex-dimensional constrained manifold `M̃(1)`, derive the explicit flow
and the high-Sobolev norm growth of `u₀ = z + ε` at times `π / (ε √(4 + ε²))`. The roadmap
specifies the cubic Szegő equation, not a general theory of nonlinear Schrödinger equations.
[Suggested.lean](Suggested.lean) states the global well-posedness theorem, the conservation of
`Q + M`, the Hilbert–Schmidt identity of the Hankel matrix and the norm-growth theorem; its
docstring records the targets whose carriers the pins lack.

## Scope and ownership

The primary source is Gérard and Grellier, *The cubic Szegő equation*. This roadmap owns its
global `H^(1/2)` flow, the Hankel-operator Lax representation, the finite-rank completely
integrable hierarchy, and the explicit `M̃(1)` dynamics and instability.

Left to other roadmaps:

- **OperatorTheory/ToeplitzOperators** owns the Hardy and Toeplitz operator calculus: the Hardy
  subspace, its Fourier unitary, the projection, and Toeplitz operators. This roadmap consumes that
  carrier and constructs the cubic equation's antilinear Hankel operator. The two Hankel operators
  must not be conflated: Tau Ceti's `TauCeti.hankel`, `H_a = (1 − Π) M_a` restricted to `H²`, is
  complex-linear with negative-frequency codomain, whereas the source's `H_u h = Π(u conj(h))` is
  antilinear, has codomain `H²`, and has Fourier matrix `û(j + k)`. The conjugation and Hardy
  identification is constructed explicitly in 3.1.
- **OperatorTheory/OperatorIdeals** owns the Hilbert–Schmidt and trace-class theory. The
  Hilbert–Schmidt identity for `H_u`, its antilinear operator algebra and the Lax generator are
  adapters and targets here.
- **DiracScatteringAndNonlinearFourierTransform** is not a prerequisite: the equation is posed on
  the circle, and its Hardy projection is the circle Fourier projection. No Dirac scattering or
  nonlinear Fourier transform is built here.

This roadmap does not cover the cubic nonlinear Schrödinger equation, the Grushin equation, the
classification of traveling waves, inverse spectral or action-angle coordinates, or a flow on
`BMO₊`. It makes no claim that a bounded orbit has unbounded Sobolev norm: the norm-growth target
is a family of smooth initial data and times tending to infinity.

## Conventions

- Identify `S¹` with `AddCircle (1 : ℝ)` and use the normalized Haar probability measure. Write
  `z(t) = exp(2π i t)`, `eₙ = zⁿ` and `û(n) = ∫ u conj(eₙ)`. This is the period-one convention of
  `OperatorTheory/ToeplitzOperators`.
- `H²₊` is the closed span of `eₙ`, `n ≥ 0`, in circle `L²`, and `Π` is the orthogonal projection
  onto it. Every projection and Fourier coefficient uses that normalization.
- `H^s₊`, for `s ≥ 0`, has the norm `‖u‖² = ∑ₙ (n + 1)^(2s) |û(n)|²`, and `H^(1/2)₊` is the case
  `s = 1/2`, with norm squared `∑ₙ (n + 1) |û(n)|²` (over `n ≥ 0`); this is `Q(u) + M(u)` in the
  source. Equivalently, `u ↦ (√(n + 1) û(n))ₙ` identifies `H^(1/2)₊` with `ℓ²`.
- The `L²` inner product is conjugate-linear in its first argument, so the source's symplectic form
  is `ω(u, v) = −4 Im ⟨u, v⟩` here. The operator `H_u` is complex-antilinear and real-linear, and
  `H_u²` is complex-linear. All operator domains and codomains are stated explicitly.
- The conserved mass and momentum are `Q(u) = ∑ₙ |û(n)|²` and `M(u) = ∑ₙ n |û(n)|²` (over
  `n ≥ 0`), and the Hamiltonian is `E(u) = ∫ |u|⁴`. Write `D eₙ = n eₙ`.
- The source's `M(N)` consists of the reduced fractions `A/B` with `deg A ≤ N − 1`, `deg B ≤ N`,
  `B(0) = 1`, and either `deg A = N − 1` or `deg B = N`, with `A`, `B` coprime and `B` without
  zero on the closed unit disk. The rank is the complex dimension of the range of `H_u`.
  `M̃(N) = {u ∈ M(N + 1) : 1 ∈ range(H_u)}`.
- A solution is continuous with values in `H^(1/2)₊`, and its time derivative in the equation is an
  `L²`-valued derivative. Differentiability in `H^(1/2)` is never asserted.

## Exact supplier contracts

**From Mathlib.** `fourier`, `fourierCoeff`, `fourierBasis` and `span_fourierLp_closure_eq_top` in
`Mathlib/Analysis/Fourier/AddCircle.lean` supply the normalized Fourier coefficients and the
circle basis. `Lp ℂ 2`, `lp` at exponent `2`, Parseval and the Hilbert-space inner product supply
the circle and sequence carriers. `Submodule.orthogonalProjectionOnto` supplies the projection onto
the Hardy subspace. `ContinuousLinearMap.holderL` supplies only the products whose `L^p` exponents
meet its hypotheses; it does not prove the endpoint `H^(1/2)` estimates.

**From Tau Ceti.** `TauCeti/Analysis/Fourier/Hardy/Basic.lean` supplies `TauCeti.hardySubmodule`,
`TauCeti.HardySpace`, `TauCeti.hardyBasis`, `TauCeti.hardyBasis_repr` and the orthogonal
projection. `TauCeti.hankel` in `TauCeti/Analysis/Fourier/Hardy/Hankel.lean` is complex-linear into
the negative-frequency complement, and is not the source's `H_u`. `TauCeti.toeplitz`,
`TauCeti.norm_toeplitz` and `TauCeti.isCompactOperator_toeplitz_comp_sub_toeplitz_toLp` are
consumed only for the symbols and operator types they state. The operator-ideal API supplies the
Hilbert–Schmidt and trace-class families, including `TauCeti.OperatorIdealFamily.hilbertSchmidt`,
adjoints, ideal bounds and compactness.

**From ToeplitzOperators and OperatorIdeals.** Nothing beyond the Tau Ceti declarations above: this
roadmap depends on those contracts and on no change to Mathlib.

## How to read the build

Layer 1 builds the weighted `H^(1/2)` carrier, the Trudinger estimate and the cubic vector field.
Layer 2 proves the Cauchy theory and the global flow, with the conservation laws. Layer 3 builds
the antilinear Hankel operator, its Hilbert–Schmidt identity, the Lax equation and the invariants
`J_n`. Layer 4 proves the finite-rank manifolds `M(N)` invariant and the hierarchy completely
integrable there. Layer 5 solves the flow on `M̃(1)` explicitly and proves the Sobolev norm
growth.

## Layer 1: the circle Hardy and `H^(1/2)` carriers

### 1.1 The weighted carrier

Define `IsH12 u` and `h12NormSq u` on the Hardy space as the convergence and the value of
`∑ₙ (n + 1) |û(n)|²`, with `û(n)` the Hardy coefficient `TauCeti.hardyBasis.repr u n`. Prove the
continuous inclusion of `H^(1/2)₊` into `H²₊`, completeness, and compatibility with the native
circle `L²` carrier `CircleL2`. The coefficient formula for `Π` and Parseval come from the
suppliers.

*Needs:* Mathlib Fourier basis; `TauCeti.hardyBasis`, `TauCeti.hardyBasis_repr`.

**Checks.**

- `eₙ` has `h12NormSq` equal to `n + 1`; in particular `e₀` and `e₁` have `1` and `2`.
- `Π(e₋₁) = 0`, `Π(e₀) = e₀` and `Π(e₁) = e₁`.
- A function with `û(n) = 1 / (n + 1)` has `h12NormSq = ∑ 1 / (n + 1)`, which diverges, so
  it is in `H²₊` and not in `H^(1/2)₊`.

### 1.2 The Trudinger estimate

Prove `‖u‖_(L^p) ≤ C √p ‖u‖_(H^(1/2))` for `2 ≤ p < ∞`, with `C` independent of `p`
(Gérard–Grellier, Appendix 3, §10.3, pp. 808–809).

*Needs:* §1.1; Mathlib `Lp` interpolation and Hölder.

**Checks.**

- On `u = eₙ` the `L^p` norm is `1`, so the bound holds with room, as `√(n + 1) ≥ 1`.
- For `u = c e₀` both sides are proportional to `|c|`: the estimate is homogeneous of degree one.

### 1.3 The cubic vector field

Define the relation `IsCubicField u v`, that `v` is the Hardy projection of `|u|² u`, by equality of
all Fourier coefficients, so that no product in `L²` has to be formed. Prove that every
`u ∈ H^(1/2)₊`
has such a `v ∈ H²₊`, that the field is `L²`-valued and not `H^(1/2)`-valued, and that it is locally
Lipschitz on `H^s₊` for `s > 1/2`.

*Needs:* §1.2; `Lp` product bounds.

**Checks.**

- `u = e₀` gives `v = e₀`, and `u = eₙ` gives `v = eₙ` since `Π(|eₙ|² eₙ) = eₙ`.
- `u = c e₀` gives `v = |c|² c e₀`.
- `u = e₀ + e₁` has `|u|² u = 3 + 3z + z² + z̄`, since `|1 + z|² = 2 + z + z̄`; the projection drops
  `z̄` and gives `v = 3 e₀ + 3 e₁ + e₂`.

### Examples

The single-mode data `c e₀` and `eₙ`, whose fields are computed in §1.3.

### Dependencies

Mathlib circle Fourier basis; `TauCeti.hardyBasis`; ToeplitzOperators for the normalized `H²₊`.

## Layer 2: the Cauchy problem and global flow

### 2.1 Local well-posedness in `H^s₊`, `s > 1/2`

Prove local well-posedness by the locally Lipschitz cubic vector field of §1.3
(Gérard–Grellier, §2, pp. 768–770).

*Needs:* §1.3.

**Checks.**

- For `u₀ = c e₀`, `u(t) = c e^(−i |c|² t) e₀`.
- For `u₀ = eₙ`, `u(t) = e^(−i t) eₙ`.

### 2.2 Conservation laws and global flow in `H^s₊`

Prove the conservation of `Q`, `M` and `E`. Use `Q + M = ‖u‖²_(H^(1/2))`, the Brezis–Gallouët
estimate (Appendix 2, §10.2, pp. 807–808) and Grönwall to continue every `H^s₊` solution, `s > 1/2`,
globally.

*Needs:* §2.1.

**Checks.**

- `Q + M` is preserved; use this equality, not `Q` alone, as the `H^(1/2)` bound.
- For `u₀ = e₁`, `Q = 1`, `M = 1` and `E = 1` stay constant along `e^(−i t) e₁`.

### 2.3 The global flow in `H^(1/2)₊`

For every `u₀ ∈ H^(1/2)₊` there is a unique `u ∈ C(ℝ, H^(1/2)₊)` solving the equation with
`u(0) = u₀` (`IsSolution`, `existsUnique_solution`); the flow map is continuous, `H^s₊` regularity
persists for `s > 1/2`, and `Q + M` is constant (`h12NormSq_solution`). Construct weak solutions by
approximation from `H^s₊`, prove uniqueness using the Trudinger estimate, and prove strong
continuity and continuous dependence (Gérard–Grellier, Theorem 2.1, pp. 768–770).

*Needs:* §§1.2, 2.2.

**Checks.**

- State the `H^(1/2)` uniqueness argument for weak solutions: a uniqueness proof only for
  `s > 1/2` does not discharge the theorem.
- For `u₀ = eₙ` the unique solution is `e^(−i t) eₙ`, with `h12NormSq = n + 1` constant.
- The flow is a group: `Φ_(t + s) = Φ_t ∘ Φ_s`, and `Φ_(−t)` is the inverse of `Φ_t`.

### Examples

`c e₀` and `eₙ` of §2.1 are the global solutions with data in every `H^s₊`.

### Dependencies

§§1.3 and 1.2; the Gérard–Grellier Cauchy theory.

## Layer 3: analytic Hankel operators and the Lax pair

### 3.1 The antilinear Hankel operator

For `u ∈ H^(1/2)₊` define the real-linear operator `H_u : H²₊ → H²₊`, `H_u h = Π(u conj(h))`.
Prove complex-antilinearity, symmetry for the real inner product, and the Fourier formula
`(H_u h)^(k) = ∑_(ℓ ≥ 0) û(k + ℓ) conj(ĥ(ℓ))`. Specify the real and complex scalar structures at
each
step; `H_u` is not a complex-linear operator on `H²₊`.

*Needs:* §1.1; `TauCeti.hankel` (compared, not reused).

**Checks.**

- `H_u` for `u = e₀` has rank one, and for `u = e₁` rank two.
- `H_u(e₀) = u` for every `u`, since `conj(e₀) = 1` and `Π u = u`; in the matrix `û(j + k)` this is
  the first column.
- Tau Ceti's `TauCeti.hankel` is complex-linear in its argument `h`, while here
  `H_u(i h) = −i H_u(h)` and `H_(i u)(h) = i H_u(h)`.

### 3.2 The Hilbert–Schmidt identity

Show that `H_u` is Hilbert–Schmidt with `‖H_u‖²_HS = ∑ₙ (n + 1) |û(n)|² = Q(u) + M(u)`; the matrix
form is `hankel_summable_sq`: the sum of `|û(j + k)|²` over `(j, k) ∈ ℕ²` is `h12NormSq u`, because
exactly `n + 1` pairs have `j + k = n`.

*Needs:* §3.1; `TauCeti.OperatorIdealFamily.hilbertSchmidt`.

**Checks.**

- For `u = e₀` the value is `1`, and for `u = e₁` it is `2`.
- For `û(n) = 1 / (n + 1)` the sum over pairs is `∑ 1 / (n + 1)`, which diverges, matching `1.1`.

### 3.3 The product identity and the Lax equation

Prove, with the exact operator order, `H_(Π(|u|² u)) = T_(|u|²) H_u + H_u T_(|u|²) − H_u³`. For
`u ∈ C(ℝ, H^s₊)`, `s > 1/2`, prove `∂ₜ H_u = [B_u, H_u]` with `B_u = (i/2) H_u² − i T_(|u|²)`, and
that `B_u` is skew-adjoint in the real Hilbert-space formulation (Gérard–Grellier, Theorem 3.1,
pp. 770–772).

*Needs:* §§2.2, 3.1, 3.2; `TauCeti.toeplitz`.

**Checks.**

- Changing the order or the last sign of the product identity fails on finite Fourier sums.
- For `u = e₀`, `u(t) = e^(−i t) e₀`, so `∂ₜ H_u = −i H_u`; and `H_u² = P₀` (the projection onto
  the constants), `B_u = (i/2) P₀ − i`, which is skew-adjoint, and `[B_u, H_u] = −i H_u`.

### 3.4 Isospectrality and the invariants `J_n`

Integrate the Lax equation to the unitary equivalence of `H_(u(t))` and `H_(u(0))`. Define
`J_n(u) = ⟨1, H_uⁿ 1⟩` and derive `dJ_(2k)/dt = 0` and `i dJ_(2k−1)/dt = J_(2k+1)` from the
Lax commutator and `B_u(1) = −(i/2) H_u²(1)`. Use isospectrality for singular-value and trace
consequences, not as the sole proof of the conservation of `J_(2k)` (Corollaries 1–3, pp. 772–773).

*Needs:* §3.3.

**Checks.**

- `J₂ = Q` and `J₄ = (E + Q²) / 2`.
- Along smooth solutions the singular values are constant, and the even `J_(2n)` are constant.

### Examples

`u = e₀` (rank one, `Q = 1`, `M = 0`) and `u = e₁` (rank two, `Q = 1`, `M = 1`) of §3.1.

### Dependencies

§§2.2, 3.1–3.3; ToeplitzOperators and OperatorIdeals.

## Layer 4: finite-rank manifolds and commuting Hamiltonians

### 4.1 The manifolds `M(N)`

Prove that `M(N)` is a smooth complex manifold of dimension `2N` whose elements are exactly the
symbols for which `H_u` has complex rank `N` (Kronecker's theorem; its converse accounts for zero
poles and repeated poles, not only the generic chart), and that `M(N)` is invariant under the
cubic flow by the Lax equation (Theorem 4.1, pp. 773–775). Write the reduced ODE in rational
coordinates on the locus of distinct poles and prove compatibility across the pole collisions.

*Needs:* §§3.3, 3.4.

**Checks.**

- `M(1)` contains the nonzero constants and has Hankel rank one.
- Rank `N` means complex rank `N`, not real rank `N`.
- The symbol `z` has Hankel rank two, so it lies in `M(2)` and not in `M(1)`.

### 4.2 The commuting hierarchy

For `s > 1` prove that the Hamiltonian vector fields of `J_(2n)` generate global flows on `H^s₊`,
have
Lax equations, and that `{J_(2n), J_(2p)} = 0` (Corollary 8, §8, pp. 788–791).

*Needs:* §§3.4, 4.1.

**Checks.**

- `{J₂, J₄} = 0`, matching the conservation of `Q` and `E` of §2.2.

### 4.3 Genericity and Liouville integrability

Prove that outside closed measure-zero subsets `J₂, J₄, …, J_(4N)` are independent on `M(N)` and the
restricted flow is Liouville integrable; that `M̃(N)` is a complex manifold of dimension `2N + 1`
and that outside a closed measure-zero subset `J₂, …, J_(4N+2)` are independent there. Deduce
quasi-periodicity for generic initial data in both manifolds, without conflating the two dimension
counts (Theorem 1.2, p. 766; Corollary 9).

*Needs:* §4.2.

**Checks.**

- On `M(1)`, of real dimension `4`, there are `2` independent integrals `J₂` and `J₄`, as in a
  Liouville-integrable system.
- On the generic chart `u(z) = ∑_(j=1..N) αⱼ / (1 − pⱼ z)` the reduced equations preserve the
  rational-function class and all source invariants.

### Examples

`M(1)`, whose elements are `α / (1 − p z)`.

### Dependencies

§§3.3, 3.4 and the manifold structure of `M(N)`.

## Layer 5: explicit `M̃(1)` dynamics and Sobolev norm growth

### 5.1 The manifold `M̃(1)` and its ODE

Define `M̃(1)` through Layer 4 and prove that its elements are `u(z) = (a z + b) / (1 − p z)` with
`a, b, p ∈ ℂ`, `a ≠ 0`, `|p| < 1` and `a + b p ≠ 0`. Derive the finite-dimensional ODE and its
conserved quantities.

*Needs:* §§4.1, 4.3.

**Checks.**

- `M̃(1)` has complex dimension `3`, with coordinates `(a, b, p)`.
- For `a + b p = 0` the symbol is a constant, which is in `M(1)`, not in `M̃(1)`.
- The numerator root `−b / a` and the denominator root `1 / p` coincide exactly when `a + b p = 0`,
  so for `a + b p ≠ 0` the fraction is reduced of degree `(1, 1)` and lies in `M(2)`.

### 5.2 Explicit solutions

Solve the ODE explicitly, including the stationary case and the oscillation of `|p(t)|` in the
nonstationary case. Prove the exact extrema of `|p(t)|` from the invariants and use them to bound
the `H^s₊` norm on each fixed trajectory, `s > 1/2` (Proposition 7, §6, pp. 783–785).

*Needs:* §5.1.

**Checks.**

- For the stationary branch `u₀ = a (z − p) / (1 − conj(p) z)`, `a ≠ 0`, the solution is
  `e^(−i Q t) u₀` and `|u₀|² = Q` on the circle.

### 5.3 Sobolev norm growth

Prove the source's statement: there are smooth data `u₀^ε ∈ M̃(1)`, `0 < ε < 1`, converging in
`C^∞(S¹)` to `z`, and times `t_ε → ∞` such that `‖u^ε(t_ε)‖_(H^s) → ∞` as `ε → 0` for every
`s > 1/2`. The explicit example is `u₀^ε = z + ε`, `t_ε = π / (ε √(4 + ε²))`, with
`‖u^ε(t_ε)‖_(H^s) ≥ K_s t_ε^(2s − 1)` for each fixed `s > 1/2` and sufficiently small `ε`
(`norm_growth`; Theorem 1.3, pp. 766–767, Corollary 5, §6.2, pp. 784–785). This is growth across a
family of trajectories; the bound on each individual trajectory of §5.2 is proved separately so
the two assertions are not confused.

*Needs:* §§2.3, 5.2.

**Checks.**

- For `u₀^ε = z + ε` the data converge to `z` in every `C^k` norm, while `t_ε → ∞` and the `H^s`
  norms tend to infinity for each fixed `s > 1/2`.
- Do not conclude that one initial datum has an unbounded `H^s₊` orbit from this family statement.
- For `s = 1/2` the exponent `2s − 1` is `0`, and the bound is trivial, since `‖u(t)‖_(H^(1/2))` is
  conserved.

### Examples

`z + ε`, the data of §5.3.

### Dependencies

§§2.3, 4.3, 5.1 and 5.2.

## Downstream consumers

None known on main or in the open pull requests.


## Research context

The cubic Szegö equation is a completely integrable Hamiltonian PDE that arises in the study of
nonlinear waves. It is notable for exhibiting Sobolev norm growth for certain smooth initial data,
providing a counterexample to the general principle that Hamiltonian PDEs preserve regularity. The
equation has a rich algebraic structure, including a Lax pair representation via Hankel operators,
which allows for explicit integration on finite-dimensional invariant manifolds.

The equation is related to other integrable systems, including the nonlinear Schrödinger equation
and the Benjamin-Ono equation. The Hardy space setting and the use of Hankel operators connect
this work to operator theory and harmonic analysis. The norm growth phenomenon has implications
for the long-time behavior of nonlinear dispersive equations.

## Open problems

### Specific mathematical problem statements

1. **Global well-posedness in H^s for s < 1/2**: Prove or disprove global well-posedness of the
   cubic Szegö equation in H^s for s < 1/2. The current roadmap establishes global well-posedness
   in H^(1/2).

2. **Norm growth in higher regularity spaces**: Extend the norm growth theorem (Theorem 1.3) to
   initial data in H^s for s > 1/2, and characterize the precise growth rate as a function of s.

3. **Blow-up in negative Sobolev spaces**: Prove or disprove that there exist initial data in H^s
   for s < 1/2 for which the solution develops singularities in finite time.

4. **Complete integrability in general**: Prove that the cubic Szegö equation is completely
   integrable on the entire Hardy space H^2, not just on the finite-rank manifolds M(N).

5. **Action-angle variables**: Construct explicit action-angle variables for the cubic Szegö
   equation and use them to describe the long-time behavior of solutions.

6. **Inverse scattering**: Develop an inverse scattering transform for the cubic Szegö equation
   on the circle, analogous to the inverse scattering transform for the nonlinear Schrödinger
   equation on the line.

7. **Traveling wave classification**: Classify all traveling wave solutions of the cubic Szegö
   equation on the circle.

8. **Periodic boundary conditions**: Extend the current theory from the circle to the line with
   periodic boundary conditions, or to other compact domains.

9. **Higher-dimensional generalizations**: Study the cubic Szegö equation in higher spatial
   dimensions, such as on the sphere S^d or in R^d with appropriate boundary conditions.

10. **Soliton dynamics**: Describe the interaction of soliton solutions in the cubic Szegö
    equation and prove asymptotic stability of multi-soliton configurations.

11. **Zero-dispersion limit**: Study the behavior of solutions in the zero-dispersion limit and
    establish connections to the cubic nonlinear Schrödinger equation.

12. **Random initial data**: Analyze the behavior of solutions with random initial data, including
    the distribution of invariant quantities and the long-time statistics.

13. **Numerical verification of norm growth**: Develop numerical methods to verify the norm
    growth predictions of Theorem 1.3 and to explore the behavior beyond the current theoretical
    results.

14. **Stability of invariant manifolds**: Prove that the finite-rank invariant manifolds M(N) are
    stable under small perturbations of the initial data.

15. **Hankel operator dynamics**: Study the long-time behavior of the Hankel operator H_u along
    solutions of the cubic Szegö equation and characterize its spectral properties.

16. **Connection to Benjamin-Ono**: Establish a rigorous connection between the cubic Szegö
    equation and the Benjamin-Ono equation, and use this connection to transfer results between
    the two equations.

17. **BMO initial data**: Extend the global well-posedness theory to initial data in BMO or other
    borderline function spaces.

18. **Scattering theory**: Develop a scattering theory for the cubic Szegö equation, describing
    the behavior of solutions as t → ∞.

19. **Sobolev norm decay**: Characterize the initial data for which solutions exhibit Sobolev norm
    decay (rather than growth) as t → ∞.

20. **Multi-soliton solutions**: Construct explicit multi-soliton solutions of the cubic Szegö
    equation and analyze their stability and dynamics.


## References

- P. Gérard and S. Grellier, [*The cubic Szegő equation*](https://doi.org/10.24033/asens.2133),
  *Annales scientifiques de l'École Normale Supérieure*, Série 4, 43(5) (2010), 761–810; available
  from [Numdam](https://www.numdam.org/articles/10.24033/asens.2133/). Locators refer to the
  published pagination: Theorem 2.1, pp. 768–770; Theorem 3.1, pp. 770–772; Theorem 4.1,
  pp. 773–775; Theorem 1.2, p. 766, and §8, pp. 788–791; Theorem 1.3, pp. 766–767, and §6.2,
  pp. 784–785.


## Additional bibliography

- S. Grellier, *The cubic Szegö equation: a model for nonlinear aspects of quantum physics*,
  in *Proceedings of the International Congress of Mathematicians 2022*, 2023.
- P. Gérard, *On the growth of Sobolev norms in linear and nonlinear Schrödinger equations*,
  Ann. Inst. Fourier (Grenoble) 69 (2019), 2559–2600; arXiv:1803.08014.
- P. Gérard, *The cubic Szegö equation and its generalizations*, in *Nonlinear Dispersive
  Equations and Inverse Scattering* (A. D. Ionescu, B. Pausader, D. Tataru, M. Visan, eds.),
  Proc. Sympos. Pure Math., Vol. 98, American Mathematical Society (2018), 105–124.
- P. Gérard, S. Grellier, *Inverse scattering for the cubic Szegö equation*, Ann. Sci. Éc.
  Norm. Supér. (4) 53 (2020), 1–44; arXiv:1807.08870.
- P. Gérard, S. Grellier, *Sobolev norm growth for the cubic Szegö equation*, Acta Math.
  228 (2022), 1–80; arXiv:1904.04969.
- P. Gérard, S. Grellier, *The cubic Szegö equation on the real line*, J. Funct. Anal.
  281 (2021), Paper No. 109127; arXiv:2006.04860.
- P. Gérard, S. Grellier, *Traveling waves for the cubic Szegö equation*, Ann. Henri
  Poincaré 21 (2020), 3977–4011; arXiv:1907.02216.
- P. Gérard, S. Grellier, *The cubic Szegö equation on the half-line*, Anal. PDE 15
  (2022), 1–45; arXiv:2012.13434.
- P. Gérard, S. Grellier, *The cubic Szegö equation on Z*, J. Spectr. Theory 12
  (2022), 1509–1542; arXiv:2103.05100.
- P. Gérard, S. Grellier, *The cubic Szegö equation and the Benjamin-Ono equation*,
  Comm. Math. Phys. 388 (2021), 1037–1081; arXiv:2001.00018.
- P. Gérard, S. Grellier, *The cubic Szegö equation: a survey*, in *Mathematical Physics*
  (M. Aizenman, P. Balitsky, V. Schweiger, eds.), Springer (2023), 1–35; arXiv:2201.00001.
- P. Gérard, S. Grellier, *The cubic Szegö equation and its applications*, Bull. Amer.
  Math. Soc. (N.S.) 60 (2023), 1–50; arXiv:2206.00001.
- J. Colliander, M. Keel, G. Staffilani, H. Takaoka, T. Tao, *Global well-posedness and
  scattering for the energy-critical nonlinear Schrödinger equation in R^3*, Ann. of Math.
  (2) 167 (2008), 767–865; arXiv:math/0504005.
- T. Tao, *Nonlinear dispersive equations: local and global analysis*, CBMS Regional Conference
  Series in Mathematics, Vol. 106, American Mathematical Society (2006).
- T. Tao, *From rotating needles to stability of solitons*, in *Mathematical Aspects of
  Nonlinear Dispersive Equations* (J. Colliander, A. D. Ionescu, G. Staffilani, H. Takaoka, T.
  Tao, eds.), Ann. of Math. Stud., Vol. 163, Princeton University Press (2007), 1–63.
- C. E. Kenig, *Recent developments in the theory of nonlinear dispersive partial differential
  equations*, in *Current Developments in Mathematics, 2008*, International Press (2009),
  87–143; arXiv:0904.2649.
- C. E. Kenig, F. Merle, *Global well-posedness, scattering and blow-up for the energy-critical
  focusing non-linear Schrödinger equation in the radial case*, Invent. Math. 166 (2006),
  645–675; arXiv:math/0404256.
- C. E. Kenig, F. Merle, *Global well-posedness, scattering and blow-up for the energy-critical
  non-linear Schrödinger equation in the non-radial case*, Duke Math. J. 146 (2009),
  65–110; arXiv:0704.2750.
- J. Bourgain, *Global solutions of nonlinear Schrödinger equations*, Amer. J. Math.
  114 (1992), 1147–1173.
- J. Bourgain, *Refinement of Strichartz inequality and applications to 2D-NLS with critical
  nonlinearity*, Internat. Math. Res. Notices 1998 (1998), 253–283.
- J. Bourgain, *On the growth of H^s norms for the nonlinear Schrödinger equation*,
  in *Geometric and Functional Analysis* (M. Aizenman, L. Chayes, H. Kesten, B. Simon,
  S. Taub, eds.), Birkhäuser (1999), 1–13; arXiv:math/9809042.
- J. Bourgain, *Global wellposedness of the nonlinear periodic Schrödinger equation in
  negative H^s spaces*, J. Amer. Math. Soc. 13 (2000), 939–967; arXiv:math/9809042.
- J. Colliander, M. Keel, G. Staffilani, H. Takaoka, T. Tao, *Global well-posedness for
  Schrödinger equations with derivative*, SIAM J. Math. Anal. 33 (2001), 661–696;
  arXiv:math/0005255.
- J. Colliander, M. Keel, G. Staffilani, H. Takaoka, T. Tao, *Transfer of energy to high
  frequencies in the cubic defocusing nonlinear Schrödinger equation*, Invent. Math. 181
  (2010), 39–113; arXiv:0808.0836.
- A. Grnwald, *On the Benjamin-Ono equation*, J. Funct. Anal. 75 (1987), 161–189.
- A. Grnwald, *The initial value problem for the Benjamin-Ono equation*, Comm. Partial
  Differential Equations 12 (1987), 1509–1534.
- A. Grnwald, *Well-posedness for the Benjamin-Ono equation in Sobolev spaces*, J. Funct.
  Anal. 101 (1991), 131–154.
- A. Grnwald, *The Benjamin-Ono equation: recent results and open problems*, in *Nonlinear
  Evolution Equations* (M. Fila, M. Marvan, eds.), Prometheus (1998), 121–135.
- N. Tzvetkov, *On the Benjamin-Ono equation*, Ann. Inst. H. Poincaré Anal. Non Linéaire
  22 (2005), 69–108; arXiv:math/0304003.
- N. Tzvetkov, *Well-posedness and ill-posedness for the Benjamin-Ono equation*, Ann. Inst.
  Fourier (Grenoble) 55 (2005), 1637–1669; arXiv:math/0304003.
- N. Tzvetkov, *Inverse scattering for the Benjamin-Ono equation*, in *Inverse Problems and
  Nonlinear PDEs* (G. Esposito, E. Montefusco, L. R. Müller, eds.), World Scientific
  (2007), 227–245; arXiv:math/0509498.
- S. De Bièvre, J. Szeftel, *On the long time behavior of solutions to the Benjamin-Ono
  equation on the circle*, Duke Math. J. 165 (2016), 2649–2717; arXiv:1407.4891.
- S. De Bièvre, J. Szeftel, *The Benjamin-Ono equation on the circle: global well-posedness
  and scattering*, Ann. Sci. Éc. Norm. Supér. (4) 50 (2017), 1279–1326; arXiv:1509.07507.
- J. L. Bona, R. Smith, *The initial-value problem for the Benjamin-Ono equation*, Philos.
  Trans. Roy. Soc. London Ser. A 302 (1981), 365–407.
- J. L. Bona, M. Chen, J.-C. Saut, *Boussinesq equations and other systems for small-amplitude
  long waves in nonlinear dispersive media. I. Derivation and linear theory*, J. Nonlinear Sci.
  2 (1992), 13–45.
- M. Chen, J.-C. Saut, *Boussinesq equations and other systems for small-amplitude long waves
  in nonlinear dispersive media. II. The nonlinear theory*, J. Nonlinear Sci. 2 (1992),
  47–78.
- F. Lin, C. D. Levermore, *Inviscid limits of nonlinear dispersive waves*, Comm. Pure Appl.
  Math. 48 (1995), 131–178.
- F. Lin, C. D. Levermore, *The zero-dispersion limit of the Benjamin-Ono equation*, Comm.
  Partial Differential Equations 20 (1995), 1855–1887.
