# Roadmap: Hamilton–Jacobi equations and scalar conservation laws

**Summary.** Build the theory of nonlinear first-order partial differential equations for a
scalar unknown: the method of characteristics, Hamilton–Jacobi equations with the Hopf–Lax
formula and viscosity solutions, and scalar conservation laws with entropy solutions. The two
model problems are

`∂ₜu + H(x, ∇u) = 0`, `u(0, ·) = g` and `∂ₜu + div f(u) = 0`, `u(0, ·) = u₀`

on a finite-dimensional real inner product space `E`. Their classical solutions are built from
characteristic curves and exist only for a short time: characteristics cross, the gradient of a
Hamilton–Jacobi solution jumps, and the solution of a conservation law itself jumps. The
roadmap builds the two theories of generalized solutions that continue past that time and are
unique.

The headline theorems are these. For a `C²` equation `F(x, u, ∇u) = 0` and `C²` data on a `C²`
hypersurface that is noncharacteristic at a point, there is a `C²` solution near that point,
unique among `C²` solutions with the prescribed gradient there. For a convex superlinear
Hamiltonian `H` and Lipschitz `g`, the Hopf–Lax formula `u(t,x) = min_y {t L((x−y)/t) + g(y)}`,
with `L` the Legendre transform of `H`, is Lipschitz, satisfies the equation almost everywhere,
and is the only such solution that is semiconcave in the sense of Evans. For a Hamiltonian
`H(x,p)` with the standard structure conditions, a bounded upper semicontinuous viscosity
subsolution lies below a bounded lower semicontinuous viscosity supersolution whenever it does
so initially (Crandall–Lions), and the Cauchy problem with bounded uniformly continuous data
has exactly one bounded continuous viscosity solution (Ishii's form of Perron's method); the
value function of a finite-horizon optimal control problem is that solution for the
Hamilton–Jacobi–Bellman equation, and the distance to the boundary is the viscosity solution of
the eikonal equation. For a uniformly convex flux in one space dimension and bounded data, the
Lax–Oleinik formula gives an integral solution satisfying Oleinik's one-sided inequality, and
it is the only one (Oleinik); the Riemann problem is solved by a shock or a rarefaction wave,
and solutions with compactly supported data converge in `L¹` to an N-wave at rate `t^{−1/2}`.
For a locally Lipschitz flux in any dimension and bounded data, entropy solutions exist, are
unique, propagate at finite speed and contract in `L¹` (Kružkov), and for a `C²` flux they are
the limits of the solutions of `∂ₜu + div f(u) = εΔu` as `ε → 0`.

The roadmap builds on four areas of Tau Ceti and Mathlib. From **OptimalTransport** it takes
convex duality: the Legendre–Fenchel conjugate, the convex subdifferential, the conjugate of a
superlinear function and Alexandrov's theorem; Tau Ceti's Hopf–Lax value, written for the
Benamou–Brenier formula, is the starting point of Layer 3. From **PDE** it takes the heat
semigroup, its smoothing estimates and the linear parabolic Schauder theory, used only for the
viscous approximation of Layer 6; PDE states that viscosity solutions are outside it, and has
no first-order nonlinear equation. From **GeometricMeasureTheory** it takes functions of
bounded variation and their `L¹_loc` compactness. From Mathlib it takes Rademacher's theorem,
the Picard–Lindelöf and implicit function theorems, and one-dimensional bounded variation.

## How to read the build

Layer 1 is convex and nonsmooth analysis on `E` and mentions no differential equation. Layer 2
is the classical theory and ends with the exact time at which it stops. Layers 3 and 4 are the
Hamilton–Jacobi theory: Layer 3 the explicit formula for `H = H(p)` convex, Layer 4 viscosity
solutions for `H = H(x,p)` without convexity, joined in §4.5. Layers 5 and 6 are the
conservation-law theory: Layer 5 the one-dimensional convex theory by the Lax–Oleinik formula,
which is the space derivative of the Hopf–Lax formula of Layer 3, and Layer 6 the Kružkov
theory in every dimension, joined to Layer 5 in §6.4. Layers 5 and 6 do not use Layer 4. Each
section states what to build, then API bullets, then **Checks**, then *Needs*. A named theorem
is a milestone; the bullets around it are part of the target and carry the same weight.

## Conventions

**Space and time.** `E` is a finite-dimensional real inner product space with its Borel
σ-algebra and Lebesgue measure `volume`; `d = Module.finrank ℝ E`. A dimension restriction is
always an explicit hypothesis. A time-dependent function is curried with time first,
`u : ℝ → E → ℝ`, as in the pinned `TauCeti.hopfLax` and parabolic maximum principles; joint
statements are about `Function.uncurry u : ℝ × E → ℝ` on the product with Mathlib's product
norm and product measure. The time derivative is `deriv (fun s ↦ u s x) t`, the space gradient
is `gradient (u t) x`, and "differentiable at `(t,x)`" means `DifferentiableAt ℝ ↿u (t, x)`.
"Almost everywhere" on space-time is with respect to `volume` on `ℝ × E`.

**Equations.** A first-order equation on an open subset `Ω` of a finite-dimensional real
normed space `V` is given by a function `F : V → ℝ → (V →L[ℝ] ℝ) → ℝ`, read
`F(x, u(x), Du(x)) = 0`, with the derivative `Du(x) = fderiv ℝ u x` a covector. On `E`
covectors are identified with vectors by `InnerProductSpace.toDual`, and `F(x, r, p)` is then
written with `p : E`. The evolution equation `∂ₜu + H(x, ∇u) = 0` is the equation on
`V = ℝ × E` given by `F((t,x), r, P) = P(1,0) + H(x, p)`, where `p` is the vector representing
`P ∘ ContinuousLinearMap.inr ℝ ℝ E`. The equations `F = 0` and `−F = 0` are different equations
for viscosity solutions; every equation in this roadmap is written with the sign shown.

**Hamiltonians and Lagrangians.** A Hamiltonian is `H : E → ℝ` or `H : E → E → ℝ`, the second
written `H(x,p)`. *Superlinear* is `Tendsto (fun p ↦ H p / ‖p‖) (cocompact E) atTop`, the form
of the pinned `Analysis/Convex/Superlinear.lean`. The *Legendre transform* of a continuous
superlinear `H` is the real function

`L(q) = max_p {⟪p, q⟫ − H(p)}`,

which is `(fenchelConjugate (innerₗ E) (fun p ↦ (H p : EReal)) q).toReal` in Tau Ceti's
notation; it is written `H*`. *Uniformly convex with constant `θ > 0`* is Mathlib's
`StrongConvexOn univ θ`, equivalently `p ↦ H(p) − (θ/2)‖p‖²` is convex.

**Moduli.** A *modulus* is a nondecreasing function `ω : ℝ≥0 → ℝ≥0`, continuous at `0` with
`ω(0) = 0`. `BUC` is bounded and uniformly continuous. Lipschitz is `LipschitzWith K`.

**Viscosity solutions.** A function `u : V → ℝ` is a *viscosity subsolution* of `F = 0` in `Ω`
when for every `x₀ ∈ Ω` and every `φ` that is `C¹` near `x₀` with `u − φ` having a local
maximum at `x₀`, `F(x₀, u(x₀), Dφ(x₀)) ≤ 0`; a *supersolution* when at every local minimum of
`u − φ`, `F(x₀, u(x₀), Dφ(x₀)) ≥ 0`; a *solution* when both. Neither predicate includes
continuity or semicontinuity of `u`; theorems state the regularity they need. This is the form
of the pinned `TauCeti.IsMongeAmpereViscositySubsolution`: `Ω : Set V`, test functions with
`ContDiffAt` at the contact point, `IsLocalMax` and `IsLocalMin` of `u − φ`, no requirement
that `u(x₀) = φ(x₀)`.

**Conservation laws.** The flux is `f : ℝ → E`, and `f : ℝ → ℝ` in Layer 5; the initial datum
is `u₀`. A solution is a function `u : ℝ → E → ℝ` with `↿u` measurable and essentially bounded
on `(0,T) × E`, and statements are invariant under changing `u` on a null set of `ℝ × E`. The
sign of `r : ℝ` is `SignType.sign r`, with value `0` at `0`. For `M ≥ 0`, the *speed bound* of
`f` on `[−M, M]` is its Lipschitz constant there with respect to the norm of `E`.

**Test functions.** A space-time test function for an initial value problem is a `C¹` function
`φ : ℝ × E → ℝ` with compact support, not required to vanish at `t = 0`; integrals are over
`Set.Ioi 0 ×ˢ univ`, or `Set.Ioo 0 T ×ˢ univ` with `φ` supported in `t < T`. This is the class
used by the pinned `TauCeti.IsContinuityEquation` lemmas of
`MeasureTheory/OptimalTransport/ContinuityEquation/TestFunction.lean`.

## Layer 1: convex and nonsmooth analysis

### 1.1 The Legendre transform of a superlinear Hamiltonian

Build the real-valued API of the Legendre transform `L = H*` of a continuous superlinear
`H : E → ℝ`, on top of the pinned extended-real conjugate.

- `L` is real-valued, the maximum is attained, and `L` is convex, continuous and superlinear,
  with `L(q) ≥ −H(0)`.
- The Fenchel–Young inequality `⟪p, q⟫ ≤ H(p) + L(q)`, with equality exactly when `q` is in the
  convex subdifferential of `H` at `p`; for convex `H`, exactly when `p` is in the
  subdifferential of `L` at `q`.
- Convex duality: if `H` is convex then `L* = H` (Evans, §3.3.2, Theorem 3).
- If `H` is strictly convex then `L` is `C¹`; if `H` is convex and differentiable then `L` is
  strictly convex. If `H` is `C¹` and strictly convex then `∇H : E → E` is a homeomorphism with
  inverse `∇L`.
- If `H` is uniformly convex with constant `θ` then `∇L` is Lipschitz with constant `1/θ`, and
  `½L(q₁) + ½L(q₂) ≤ L((q₁+q₂)/2) + ‖q₁ − q₂‖²/(8θ)` (Evans, §3.3.3, proof of Lemma 4).
- If `H` is `C²` and uniformly convex then `L` is `C²` and `D²L(q) = (D²H(∇L(q)))⁻¹`.
- Order and scaling: `H₁ ≤ H₂` gives `H₂* ≤ H₁*`; `(λH)*(q) = λH*(q/λ)` for `λ > 0`;
  `(H + c)* = H* − c`; `(H(· − a))*(q) = H*(q) + ⟪a, q⟫`.

**Checks.**

- `H(p) = ‖p‖²/2` gives `L(q) = ‖q‖²/2`.
- `H(p) = ‖p‖^r/r` for `1 < r < ∞` gives `L(q) = ‖q‖^s/s` with `1/r + 1/s = 1`.
- `H(p) = ½⟪Ap, p⟫` for a symmetric positive definite `A` gives `L(q) = ½⟪A⁻¹q, q⟫`.
- `H(p) = ‖p‖` is convex and not superlinear, and its conjugate is `0` on the closed unit ball
  and `+∞` outside: superlinearity is what makes `L` real-valued.
- `d = 1`, `H(p) = p⁴/4`: `L(q) = (3/4)|q|^{4/3}` is `C¹` and not `C²` at `0`, so strict
  convexity of `H` does not give `L ∈ C²`.

*Needs:* Tau Ceti `fenchelConjugate`, `subdifferential`, the Fenchel–Moreau theorem and the
superlinear conjugate lemmas; Mathlib `StrongConvexOn`.

### 1.2 Fréchet subdifferentials and superdifferentials

For `u : V → ℝ` on a finite-dimensional real normed space and `x : V`, define the
*superdifferential*

`D⁺u(x) = {p : V →L[ℝ] ℝ | limsup_{y → x, y ≠ x} (u(y) − u(x) − p(y − x))/‖y − x‖ ≤ 0}`

and the *subdifferential* `D⁻u(x)` with `liminf … ≥ 0`. These are pointwise notions and assume
nothing about `u`.

- `D⁻u(x) = −D⁺(−u)(x)`; both sets are closed and convex.
- `u` is differentiable at `x` exactly when both are nonempty, and then
  `D⁺u(x) = D⁻u(x) = {fderiv ℝ u x}`.
- Test-function characterization: `p ∈ D⁺u(x)` exactly when there is a `C¹` function `φ` on
  `V` with `fderiv ℝ φ x = p` such that `u − φ` has a local maximum at `x`; the maximum can be
  taken strict, and `φ` can be taken `C^∞` on `V \ {x}` (Evans, §10.1.1; Crandall–Evans–Lions,
  Proposition 1.1).
- If `u` is continuous on an open set `Ω`, the points of `Ω` where `D⁺u` is nonempty are dense
  in `Ω`, and so are those where `D⁻u` is nonempty.
- If `u − φ` has a local maximum at `x` and `φ` is differentiable at `x` then
  `fderiv ℝ φ x ∈ D⁺u(x)`; sums with a differentiable function shift both sets.
- For a convex `u` on `E`, `D⁻u(x)` is the convex subdifferential under
  `InnerProductSpace.toDual`.

**Checks.**

- `u(x) = ‖x‖` on `E`: `D⁻u(0)` is the closed unit ball and `D⁺u(0) = ∅`; for `−‖x‖` the roles
  are exchanged.
- `d = 1`, `u(x) = x sin(1/x)`, `u(0) = 0`: `D⁺u(0) = D⁻u(0) = ∅`.
- `d = 1`, `u(x) = √|x|`: `D⁻u(0) = ℝ` and `D⁺u(0) = ∅`.

*Needs:* Mathlib `fderiv`, `IsLocalMax`.

### 1.3 Semiconcave functions

For a convex set `s ⊆ E` and `C ≥ 0`, a function `u : E → ℝ` is *semiconcave on `s` with
constant `C`* when `x ↦ u(x) − (C/2)‖x‖²` is concave on `s`; *semiconvex* when `−u` is
semiconcave.

- For continuous `u` on an open convex `s`, semiconcavity with constant `C` is equivalent to
  `u(x + z) − 2u(x) + u(x − z) ≤ C‖z‖²` whenever `x ± z ∈ s`.
- Sums, nonnegative multiples and the pointwise infimum of a family with a common constant,
  where finite, are semiconcave; a concave function is semiconcave with constant `0`; a `C²`
  function is semiconcave with constant `C` exactly when `D²u ≤ C` as quadratic forms.
- On an open convex `s`, a semiconcave function is locally Lipschitz, `D⁺u(x)` is nonempty at
  every point, `u` is differentiable at `x` exactly when `D⁺u(x)` is a singleton, and
  `⟪p_y − p_x, y − x⟫ ≤ C‖y − x‖²` for `p_x ∈ D⁺u(x)`, `p_y ∈ D⁺u(y)`.
- A semiconcave function on an open convex set is twice differentiable almost everywhere, in
  the sense of the pinned Alexandrov theorem.
- A function that is semiconcave and semiconvex with constant `C` on an open convex set is
  differentiable there with `C`-Lipschitz gradient.
- For a nonempty `K ⊆ E`, `x ↦ infDist x K ^ 2` is semiconcave on `E` with constant `2`.

**Checks.**

- `−‖x‖` is semiconcave with constant `0`; `‖x‖` is semiconcave on no neighbourhood of `0`.
- `‖x‖²` is semiconcave with constant `2` and no smaller constant.
- `d = 1`: `min(x, −x) + x²` is semiconcave with constant `2` and not differentiable at `0`.

*Needs:* §1.2; Mathlib `ConcaveOn`; Tau Ceti `ConvexOn.ae_existsUnique_isPositive_isLittleO`.

## Layer 2: the method of characteristics

In this layer `F : E × ℝ × E → ℝ` is `C²` and is written `F(x, z, p)`, with partial gradients
`∂ₓF, ∂ₚF : E` and partial derivative `∂_zF : ℝ`.

### 2.1 The characteristic system

Define the *characteristic system* of `F`, the ordinary differential equation on `E × ℝ × E`

`ẋ = ∂ₚF`, `ż = ⟪∂ₚF, p⟫`, `ṗ = −∂ₓF − (∂_zF) p`,

all partial derivatives evaluated at `(x, z, p)`.

- Structure theorem (Evans, §3.2.1, Theorem 1): if `u` is `C²` on an open `Ω` with
  `F(x, u, ∇u) = 0`, and `x(·)` solves `ẋ = ∂ₚF(x, u(x), ∇u(x))` in `Ω`, then
  `(x(s), u(x(s)), ∇u(x(s)))` solves the characteristic system.
- `F` is constant along every solution of the characteristic system.
- Local existence, uniqueness and `C¹` dependence on initial data for the characteristic
  system, from the Picard–Lindelöf theory.
- Special forms. For `F = ⟪b(x), p⟫ + c(x) z − h(x)` the `x`-equation `ẋ = b(x)` decouples. For
  `F = ⟪b(x,z), p⟫ + c(x,z)` the `(x,z)`-equations decouple. For the evolution equation
  `∂ₜu + H(x, ∇u) = 0` the system is Hamilton's equations `ẋ = ∂ₚH`, `ṗ = −∂ₓH` together with
  `ż = ⟪∂ₚH, p⟫ − H`, with time as the parameter.

**Checks.**

- `F = ⟪b, p⟫` with `b` constant: characteristics are the lines `x + sb`, and `z`, `p` are
  constant.
- `H = ‖p‖²/2`: `x(s) = x₀ + s p₀`, `p` is constant, `z(s) = z₀ + s‖p₀‖²/2`.
- `d = 1`, `H(x,p) = (p² + x²)/2`: the projected characteristics are
  `x(s) = x₀ cos s + p₀ sin s`.

*Needs:* Mathlib `IsPicardLindelof`, `ODE_solution_unique`; Tau Ceti
`ODE.contDiff_globalSolution`, `ODE.exists_contDiffAt_localFlow`.

### 2.2 Local existence for noncharacteristic data

Let `γ, g : E → ℝ` be `C²` near `x₀` with `γ(x₀) = 0` and `∇γ(x₀) ≠ 0`, so that
`Γ = {γ = 0}` is a `C²` hypersurface near `x₀`, and let `p₀ : E`. The triple `(x₀, g(x₀), p₀)`
is *admissible* when `F(x₀, g(x₀), p₀) = 0` and `p₀ − ∇g(x₀)` is a multiple of `∇γ(x₀)`, and
*noncharacteristic* when `⟪∂ₚF(x₀, g(x₀), p₀), ∇γ(x₀)⟫ ≠ 0`.

Prove (Evans, §3.2.4, Lemma 2 and §3.2.5, Theorem 2): for an admissible noncharacteristic
triple there are a neighbourhood `W` of `x₀` and a `C²` function `u` on `W` with
`F(x, u, ∇u) = 0` in `W`, `u = g` on `Γ ∩ W` and `∇u(x₀) = p₀`; and two such functions agree
on a neighbourhood of `x₀`.

- The admissible covector field: there is a unique `C¹` map `q` from a neighbourhood of `x₀` in
  `Γ` to `E` with `q(x₀) = p₀`, `F(y, g(y), q(y)) = 0` and `q(y) − ∇g(y)` a multiple of
  `∇γ(y)`.
- The map `(y, s) ↦ x(y, s)`, the `x`-component of the characteristic from
  `(y, g(y), q(y))`, is a `C¹` diffeomorphism from a neighbourhood of `(x₀, 0)` in `Γ × ℝ` to a
  neighbourhood of `x₀` in `E`.
- The solution is `u(x(y,s)) = z(y,s)`, and its gradient is `∇u(x(y,s)) = p(y,s)`.
- For a quasilinear `F = ⟪b(x,z), p⟫ + c(x,z)` the noncharacteristic condition is
  `⟪b(x₀, g(x₀)), ∇γ(x₀)⟫ ≠ 0`, it does not involve `p₀`, and the admissible `p₀` is unique.

**Checks.**

- `E = ℝ²`, `F = p₁ p₂ − z`, `Γ = {x₁ = 0}`, `g(x) = x₂²` (Evans, §3.2.2, Example 3): the
  solution is `u(x₁,x₂) = (x₁ + 4x₂)²/16`.
- `E = ℝ²`, `F = x₁p₂ − x₂p₁ − z`, `Γ = {x₂ = 0, x₁ > 0}` (Evans, §3.2.2, Example 1):
  `u = g(√(x₁² + x₂²)) exp(arctan(x₂/x₁))` for `x₁ > 0`.
- `F = ‖p‖² − 1` with `g = 0` on a hyperplane: at each point there are exactly two admissible
  `p₀`, the two unit normals, giving the two signed distances; uniqueness needs the prescribed
  gradient.
- `F = p₁` with `Γ = {x₂ = 0}` in `ℝ²` is characteristic at every point, and the problem with
  `g(x) = x₁` has no solution.

*Needs:* §2.1; Mathlib `ContDiffAt.implicitFunction`, `ContDiffAt.toOpenPartialHomeomorph`.

### 2.3 Transport equations

- Constant velocity (Evans, §2.1): for `b : E`, `u₀ ∈ C¹(E)` and `c : ℝ → E → ℝ` continuous
  with continuous space gradient, `u(t,x) = u₀(x − tb) + ∫₀ᵗ c(s, x − (t − s)b) ds` is the
  unique `C¹` solution of `∂ₜu + ⟪b, ∇u⟫ = c`, `u(0) = u₀` on `ℝ × E`.
- Variable velocity: for `b : ℝ × E → E` of class `C¹` with bounded space derivative, the flow
  `X(s; t, x)`, the position at time `s` of the solution of `ẏ = b(s, y)` with `y(t) = x`, is
  defined for all times and is `C¹` in `(s, t, x)`, and `u(t,x) = u₀(X(0; t, x))` is the unique
  `C¹` solution of `∂ₜu + ⟪b, ∇u⟫ = 0`, `u(0) = u₀`.
- The maximum principle `inf u₀ ≤ u ≤ sup u₀`, and finite propagation speed: if `‖b‖ ≤ N` then
  `u(t,x)` depends only on `u₀` in the closed ball of radius `N|t|` about `x`.
- Inhomogeneous and damped forms `∂ₜu + ⟪b, ∇u⟫ + a u = c` by the integrating factor along the
  flow.

**Checks.**

- `E = ℝ²`, `b(x) = (−x₂, x₁)`: `u(t,x) = u₀(R_{−t}x)` with `R_t` the rotation by angle `t`.
- `b(t,x) = x`: `u(t,x) = u₀(e^{−t}x)`.
- For `u₀` continuous and not differentiable, `u₀(x − tb)` is not a `C¹` solution.

*Needs:* §2.1; Tau Ceti `ODE.globalSolution`.

### 2.4 The time of existence of classical solutions

**Conservation laws.** Let `d = 1`, `f ∈ C²(ℝ)`, and `u₀ ∈ C¹(ℝ)` bounded with bounded
derivative. Put `c = f' ∘ u₀` and `T* = −1/inf c'` if `inf c' < 0`, and `T* = ∞` otherwise.
Prove:

- on `[0, T*) × ℝ` there is a unique function, continuous there and `C¹` on `(0, T*) × ℝ`, with
  `∂ₜu + f'(u)∂ₓu = 0` and `u(0) = u₀`; it satisfies `u(t, y + t c(y)) = u₀(y)`, and for each
  `t` the map `y ↦ y + t c(y)` is a `C¹` diffeomorphism of `ℝ`;
- `∂ₓu(t, y + t c(y)) = u₀'(y)/(1 + t c'(y))`;
- if `T* < ∞` then `sup_x |∂ₓu(t,x)| → ∞` as `t ↑ T*`, and for `T > T*` there is no such
  solution on `[0, T) × ℝ`.

**Hamilton–Jacobi equations.** Let `H ∈ C²(E)` with `‖D²H‖ ≤ A` and `g ∈ C²(E)` with
`‖D²g‖ ≤ B`, `AB > 0`. For `0 ≤ t < 1/(AB)` the map `y ↦ y + t∇H(∇g(y))` is a `C¹`
diffeomorphism of `E`, and the function defined by

`u(t, y + t∇H(∇g(y))) = g(y) + t(⟪∇H(p), p⟫ − H(p))`, `p = ∇g(y)`,

is `C²` on `(0, 1/(AB)) × E`, continuous on `[0, 1/(AB)) × E`, and solves
`∂ₜu + H(∇u) = 0`, `u(0) = g`, with `∇u(t, y + t∇H(∇g(y))) = ∇g(y)`.

**Checks.**

- Burgers' equation `f(u) = u²/2` with `u₀(x) = −arctan x`: `T* = 1`.
- `f` convex and `u₀` nondecreasing, or `f` affine: `T* = ∞`.
- `H = ‖p‖²/2`, `g(x) = −‖x‖²/2`: `u(t,x) = −‖x‖²/(2(1 − t))` on `[0,1)`, with `A = B = 1`,
  and `u(t,x) → −∞` as `t ↑ 1` for `x ≠ 0`: the bound `1/(AB)` is attained.
- `H = ‖p‖²/2`, `g(x) = ‖x‖²/2`: `u(t,x) = ‖x‖²/(2(1 + t))` for all `t ≥ 0`.

*Needs:* §2.1; Mathlib's inverse function theorem.

### Examples

The acceptance examples of this layer are the two Evans examples of §2.2 with their explicit
solutions; the non-uniqueness of the eikonal data without a prescribed gradient; the rotation
field; the breaking time `T* = 1` for Burgers' equation; and the quadratic Hamilton–Jacobi
solution that reaches `t = 1/(AB)`.

## Layer 3: the Hopf–Lax formula

In this layer `H : E → ℝ` is convex and superlinear, `L = H*`, and `g : E → ℝ` is Lipschitz
with constant `K`. The object is the pinned `TauCeti.hopfLax L g t x` for `t > 0`,

`u(t,x) = inf_y {g(y) + t L((x − y)/t)}`,

extended by `u(0, ·) = g`. The pinned lemmas assume `g` bounded below; for Lipschitz `g` the
function `y ↦ g(y) + t L((x − y)/t)` is bounded below and tends to `+∞` at infinity by
superlinearity of `L`, and this layer works under that hypothesis.

### 3.1 The formula as a semigroup

- The infimum is attained for every `t > 0` and `x`.
- `g(x) − t max_{‖p‖ ≤ K} H(p) ≤ u(t,x) ≤ g(x) + t L(0)`.
- `u(t, ·)` is Lipschitz with constant `K`, and
  `|u(t,x) − u(s,x)| ≤ max(|L(0)|, max_{‖p‖ ≤ K} |H(p)|) |t − s|` for `s, t ≥ 0`; so `u` is
  Lipschitz on `[0,∞) × E` (Evans, §3.3.2, Lemma 2).
- The semigroup property (Evans, §3.3.2, Lemma 1): for `0 < s < t`,
  `u(t,x) = min_y {u(s,y) + (t − s) L((x − y)/(t − s))}`, that is
  `hopfLax L (hopfLax L g s) (t − s) = hopfLax L g t`.
- The variational formula (Evans, §3.3.2, Theorem 4): `u(t,x)` is the infimum of
  `g(w(0)) + ∫₀ᵗ L(ẇ(s)) ds` over `C¹` curves `w : [0,t] → E` with `w(t) = x`, attained by the
  segment from a minimizing `y` to `x`; the infimum over Lipschitz curves is the same.
- Monotonicity and contraction: `g₁ ≤ g₂` gives `u₁ ≤ u₂`; the solution with data `g + c` is
  `u + c`; `sup |u₁(t, ·) − u₂(t, ·)| ≤ sup |g₁ − g₂|`; the formula commutes with translations
  of `E`.
- Domain of dependence: with `R = sup {‖q‖ : q ∈ ∂H(p), ‖p‖ ≤ K}`, which is finite, every
  minimizing `y` satisfies `‖x − y‖ ≤ Rt`, so `u(t,x)` depends only on `g` in the closed ball
  of radius `Rt` about `x`.

**Checks.**

- `H = ‖p‖²/2`, `g(x) = ‖x‖`: `u(t,x) = ‖x‖ − t/2` for `‖x‖ ≥ t` and `‖x‖²/(2t)` for
  `‖x‖ ≤ t`.
- `H = ‖p‖²/2`, `g(x) = −‖x‖`: `u(t,x) = −‖x‖ − t/2`, with exactly the minimizers
  `y = x + t x/‖x‖` for `x ≠ 0` and the sphere of radius `t` for `x = 0`.
- `g` affine, `g(x) = ⟪a, x⟫ + c`: `u(t,x) = g(x) − tH(a)` for every convex superlinear `H`.
- The pinned `TauCeti.hopfLax_norm_rpow` uses the cost `L(w) = ‖w‖^s`, which for `s > 1` is
  the Legendre transform of `H(p) = (s − 1)‖p/s‖^{s/(s−1)}`, not of `‖p‖^r/r`.

*Needs:* §1.1; Tau Ceti `hopfLax` and its lemmas.

### 3.2 The equation

- At every point `(t,x)` with `t > 0` where `u` is differentiable,
  `∂ₜu + H(∇u) = 0` (Evans, §3.3.2, Theorem 5); the inequality `≤` is the pinned
  `TauCeti.hopfLax_add_add_smul_le`.
- `u` is differentiable almost everywhere on `(0,∞) × E`, so it satisfies the equation almost
  everywhere (Evans, §3.3.2, Theorem 6).
- If `H` is `C¹` and `u(t, ·)` is differentiable at `x`, the minimizer is unique and equals
  `x − t∇H(∇ₓu(t,x))`. Conversely, if the minimizer `y` for `(t,x)` is unique and `H` is `C¹`
  and strictly convex, then `u(t, ·)` is differentiable at `x` with gradient
  `∇L((x − y)/t)`.
- Agreement with the classical solution: under the hypotheses of §2.4 with `H` convex and
  superlinear and `g` Lipschitz, `u` is the function of §2.4 on `[0, 1/(AB)) × E`.

*Needs:* §3.1; Mathlib `LipschitzWith.ae_differentiableAt`.

### 3.3 Semiconcavity and uniqueness

- If `g` is semiconcave with constant `C` then so is `u(t, ·)` for every `t > 0`
  (Evans, §3.3.3, Lemma 3).
- If `H` is uniformly convex with constant `θ` then `u(t, ·)` is semiconcave with constant
  `1/(θt)` for every `t > 0`, for every Lipschitz `g` (Evans, §3.3.3, Lemma 4).
- A *semiconcave weak solution* on `[0,T]` is a Lipschitz function `u` on `[0,T] × E` with
  `u(0) = g`, satisfying `∂ₜu + H(∇u) = 0` almost everywhere on `(0,T) × E`, such that
  `u(t, ·)` is semiconcave with constant `C(1 + 1/t)` for some `C` and all `0 < t ≤ T`.
- Uniqueness (Evans, §3.3.3, Theorem 7): for `H` of class `C²`, convex and superlinear and `g`
  Lipschitz, there is at most one semiconcave weak solution.
- Existence (Evans, §3.3.3, Theorem 8): if in addition `g` is semiconcave or `H` is uniformly
  convex, the Hopf–Lax function is the semiconcave weak solution.

**Checks.**

- `d = 1`, `H(p) = p²`, `g = 0` (Evans, §3.3.3): `u = 0` and
  `ũ(t,x) = min(|x| − t, 0)` are both Lipschitz, vanish at `t = 0` and satisfy the equation
  almost everywhere; the Hopf–Lax function is `0`, and `ũ(t, ·)` has a convex kink at `x = 0`
  and is not semiconcave.
- `H = ‖p‖²/2`, `g = −‖x‖`: `u(t, ·) = −‖x‖ − t/2` is concave; its kink persists for all time.
- `H = ‖p‖²/2`, `g = ‖x‖`: `u(t, ·)` is `C¹` for `t > 0` and semiconcave with constant `1/t`,
  the constant `1/(θt)` with `θ = 1`.

*Needs:* §1.3, §3.1–§3.2.

### Examples

The acceptance examples of this layer are the two explicit solutions for `g = ±‖x‖`; the
affine datum; the two almost-everywhere solutions of `∂ₜu + (∂ₓu)² = 0` with zero data; and
the agreement with the characteristic solution before `t = 1/(AB)`.

## Layer 4: viscosity solutions of first-order equations

In this layer `V` is a finite-dimensional real normed space, `Ω ⊆ V` is open, and
`F : V → ℝ → (V →L[ℝ] ℝ) → ℝ` is continuous.

### 4.1 Definition and equivalent forms

Define `IsViscositySubsolution F Ω u`, `IsViscositySupersolution F Ω u` and
`IsViscositySolution F Ω u` as in the Conventions.

- Differential form: `u` is a subsolution exactly when `F(x, u(x), p) ≤ 0` for every `x ∈ Ω`
  and `p ∈ D⁺u(x)`, and a supersolution exactly when `F(x, u(x), p) ≥ 0` for every
  `p ∈ D⁻u(x)` (Crandall–Evans–Lions, Theorem 1.1).
- Equivalent test classes: the same predicate results from test functions that are `C¹` on
  `V`, `C^∞` on `V`, or merely differentiable at `x₀`; from strict local maxima; and from
  requiring `u(x₀) = φ(x₀)`.
- Locality and monotonicity in `Ω`; `u` is a subsolution of `F = 0` exactly when `−u` is a
  supersolution of `−F(x, −r, −P) = 0`.
- Consistency (Evans, §10.1.1, Theorem 1 and Lemma): a `C¹` function is a viscosity solution
  exactly when `F(x, u, Du) = 0` pointwise in `Ω`; a viscosity solution satisfies the equation
  at every point of differentiability, so a locally Lipschitz viscosity solution satisfies it
  almost everywhere.
- Change of unknown: for `Φ : ℝ → ℝ` of class `C¹` with `Φ' > 0`, `u` is a viscosity solution
  of `F = 0` exactly when `v = Φ ∘ u` is one of `F(x, Φ⁻¹(v), (Φ⁻¹)'(v) Dv) = 0`.
- Evolution equations: for `∂ₜu + H(x, ∇u) = 0` on `(0,T) × E`, a subsolution or supersolution
  that is upper or lower semicontinuous on `(0,T] × E` satisfies the same inequality at local
  extrema of `u − φ` relative to `(0,T] × E` at time `T` (Evans, §10.2, Lemma).

**Checks.**

- `d = 1`, `Ω = (−1, 1)`: `1 − |x|` is a viscosity solution of `|u'| − 1 = 0` and `|x| − 1` is
  not, failing the supersolution test at `0` with `p = 0`; for `1 − |u'| = 0` the roles are
  exchanged. Both satisfy `|u'| = 1` almost everywhere, as does every sawtooth with slopes
  `±1`, and only `1 − |x|` among those vanishing at `±1` is a viscosity solution of
  `|u'| − 1 = 0`.
- A function with a concave kink, `−|x|` near `0`, is a viscosity solution of `|u'| − 1 = 0`
  near `0`; one with a convex kink is not.
- The function `ũ` of the first Check of §3.3 is not a viscosity solution of
  `∂ₜu + (∂ₓu)² = 0`.

*Needs:* §1.2.

### 4.2 Operations and stability

For a function `u` that is locally bounded on `Ω`, define its *upper semicontinuous envelope*
`u*(x) = limsup_{y → x} u(y)` and *lower semicontinuous envelope* `u_*`, with their basic API:
`u_* ≤ u ≤ u*`, `u*` is the least upper semicontinuous function above `u`, and `u* = u`
exactly when `u` is upper semicontinuous.

- The maximum of two subsolutions is a subsolution, and the minimum of two supersolutions is a
  supersolution.
- If `𝒮` is a nonempty family of upper semicontinuous subsolutions, locally uniformly bounded
  above, then `(sup 𝒮)*` is a subsolution; dually for infima of lower semicontinuous
  supersolutions.
- Stability (Evans, §10.1.1; Crandall–Evans–Lions, Theorem 1.2): if `Fₙ → F` and `uₙ → u`
  locally uniformly, the `uₙ` are continuous and `uₙ` is a subsolution of `Fₙ = 0`, then `u`
  is a subsolution of `F = 0`; likewise for supersolutions.
- Half-relaxed limits (Barles–Perthame): for a locally uniformly bounded sequence of upper
  semicontinuous subsolutions `uₙ` of `Fₙ = 0` with `Fₙ → F` locally uniformly,
  `x ↦ limsup_{n → ∞, y → x} uₙ(y)` is a subsolution of `F = 0`; dually for supersolutions.
- Vanishing viscosity (Evans, §10.1.1, Theorem 1): on `E`, if `u^ε` is `C²` with
  `−εΔu^ε + F(x, u^ε, ∇u^ε) = 0` in `Ω` and `u^ε → u` locally uniformly as `ε → 0⁺`, then `u`
  is a viscosity solution of `F = 0`.

**Checks.**

- `d = 1`, `Ω = (−1,1)`: `u^ε(x) = 1 − |x| − ε(e^{−|x|/ε} − e^{−1/ε})` is `C²`, satisfies
  `−ε(u^ε)'' + |(u^ε)'| − 1 = 0` and `u^ε(±1) = 0`, and converges uniformly to `1 − |x|`.
- On `ℝ`, the sawtooth functions `uₙ` with slopes `±1`, period `2/n` and values in `[0, 1/n]`
  satisfy `|uₙ'| = 1` almost everywhere and converge uniformly to `0`, which does not: almost
  everywhere solutions are not stable. No `uₙ` is a viscosity supersolution of `|u'| − 1 = 0`,
  failing at its minima.

*Needs:* §4.1; Mathlib `UpperSemicontinuous`, `LowerSemicontinuous`.

### 4.3 Comparison principles

The *structure conditions* on `H : E → E → ℝ` are: `H` is continuous, and there are moduli
`ω₁, ω₂` with

`(S1)` `|H(x,p) − H(y,p)| ≤ ω₁(‖x − y‖(1 + ‖p‖))` and `(S2)` `|H(x,p) − H(x,q)| ≤ ω₂(‖p − q‖)`

for all `x, y, p, q`. Prove, by doubling the variables:

- **Bounded domains** (Crandall–Lions; Bardi–Capuzzo-Dolcetta, Theorem II.3.1). Let `Ω ⊆ E` be
  bounded and open, `λ > 0`, and `H` continuous satisfying `(S1)`. If `u` is upper
  semicontinuous on `closure Ω` and a subsolution of `λu + H(x, ∇u) = 0` in `Ω`, `v` is lower
  semicontinuous on `closure Ω` and a supersolution, and `u ≤ v` on `frontier Ω`, then
  `u ≤ v` on `Ω`.
- **The whole space** (Bardi–Capuzzo-Dolcetta, Theorem II.3.5). Let `λ > 0` and `H` satisfy
  `(S1)` and `(S2)`. If `u` is a bounded upper semicontinuous subsolution and `v` a bounded
  lower semicontinuous supersolution of `λu + H(x, ∇u) = 0` in `E`, then `u ≤ v`.
- **The Cauchy problem** (Evans, §10.2, Theorem 1; Crandall–Lions). Let `H` satisfy `(S1)` and
  be Lipschitz in `p` uniformly in `x`. If `u` is bounded and upper semicontinuous on
  `[0,T] × E` and a subsolution of `∂ₜu + H(x, ∇u) = 0` in `(0,T) × E`, `v` is bounded and
  lower semicontinuous and a supersolution, and `u(0, ·) ≤ v(0, ·)`, then `u ≤ v`.
- **Hamiltonians of the gradient alone.** Let `H : E → ℝ` be continuous. If `u, v` are `BUC` on
  `[0,T] × E`, `u` a subsolution and `v` a supersolution of `∂ₜu + H(∇u) = 0` in `(0,T) × E`
  with `u(0, ·) ≤ v(0, ·)`, then `u ≤ v`.
- Consequences for the Cauchy problem: `sup (u − v)⁺ ≤ sup (u(0, ·) − v(0, ·))⁺`; uniqueness;
  and finite propagation speed: if `H` is Lipschitz in `p` with constant `N` and two bounded
  continuous solutions agree at `t = 0` on the closed ball of radius `R` about `x₀`, they agree
  on `{(t,x) : ‖x − x₀‖ ≤ R − Nt}`.

**Checks.**

- `d = 1`, `∂ₜu + (∂ₓu)² = 0`, `u(0) = 0`: the function `ũ` of §3.3 is bounded and Lipschitz
  on `[0,T] × ℝ`, satisfies the equation almost everywhere and has the same datum as `0`; the
  comparison principle applies to `0` and excludes `ũ`, which is not a supersolution.
- `λ > 0` matters on bounded domains: for `H = 0`, `λ = 0` every function is a solution of
  `0 = 0`.
- For `u + |u'| − 1 = 0` on `(−1,1)` with zero boundary values, the unique solution is
  `1 − e^{|x| − 1}`.

*Needs:* §4.1–§4.2.

### 4.4 Existence by Perron's method

For a locally bounded function `w` on `Ω`, say that `w` is a *discontinuous subsolution* when
`w*` is a subsolution, and a *discontinuous supersolution* when `w_*` is a supersolution.
Prove Ishii's theorem (Ishii 1987, Theorem 3.1): let `w₋` be a discontinuous subsolution and
`w₊` a discontinuous supersolution of `F = 0` in `Ω` with `w₋ ≤ w₊`. Then

`W(x) = sup {w(x) : w a discontinuous subsolution in Ω, w₋ ≤ w ≤ w₊}`

has `W*` a subsolution and `W_*` a supersolution of `F = 0` in `Ω`.

- The bump lemma: if `w` is a discontinuous subsolution and `w_*` fails the supersolution test
  at `x₀`, then for every neighbourhood `U` of `x₀` there is a discontinuous subsolution
  `w̃ ≥ w` with `w̃ = w` outside `U` and `w̃ > w` at some point of `U`.
- With a comparison principle for semicontinuous sub- and supersolutions, `W* ≤ W_*`, so `W`
  is continuous and is a viscosity solution.
- The stationary problem on the whole space: for `λ > 0` and `H` satisfying `(S1)`, `(S2)`
  with `sup_x |H(x,0)| < ∞`, the equation `λu + H(x, ∇u) = 0` has exactly one bounded
  continuous viscosity solution on `E`, with `sup |u| ≤ sup_x |H(x,0)|/λ`.

*Needs:* §4.2–§4.3.

### 4.5 The Cauchy problem

Let `H` satisfy `(S1)`, be Lipschitz in `p` uniformly in `x` with constant `N`, and have
`sup_x |H(x,0)| < ∞`.

- For `g` bounded and Lipschitz with constant `K`, with
  `C = sup {|H(x,p)| : x ∈ E, ‖p‖ ≤ K}`, the functions `g(x) − Ct` and `g(x) + Ct` are a
  subsolution and a supersolution, and Perron's method gives a bounded continuous viscosity
  solution on `[0,T] × E` with `u(0) = g` and `|u(t,x) − g(x)| ≤ Ct`.
- For `g ∈ BUC(E)` there is exactly one bounded continuous viscosity solution of
  `∂ₜu + H(x, ∇u) = 0` on `[0,T] × E` with `u(0) = g`, for every `T > 0`; the solutions form a
  semigroup `S(t)` on `BUC(E)` that is order-preserving, commutes with the addition of
  constants and satisfies `sup |S(t)g₁ − S(t)g₂| ≤ sup |g₁ − g₂|`.
- If `(S1)` holds with `ω₁(r) = C₁ r` and `g` is bounded and Lipschitz, then `u(t, ·)` is
  Lipschitz with a constant depending only on `K`, `C₁` and `T`, and `u` is Lipschitz in `t`.
- The Hopf–Lax formula (Evans, §10.3.3, Theorem 3): for `H : E → ℝ` convex and superlinear and
  `g` bounded and Lipschitz, the Hopf–Lax function of Layer 3 is a viscosity solution of
  `∂ₜu + H(∇u) = 0`, and it is the only `BUC` viscosity solution with `u(0) = g`.
- The Hopf formula (Bardi–Evans 1984, Theorem 3.1): for `H : E → ℝ` continuous and `g` convex
  and Lipschitz, with `P = {p : y ↦ g(y) − ⟪p, y⟫ is bounded below}` and
  `g*(p) = sup_y {⟪p, y⟫ − g(y)}` for `p ∈ P`,
  `u(t,x) = sup_{p ∈ P} {⟪p, x⟫ − g*(p) − tH(p)}` is a viscosity solution of
  `∂ₜu + H(∇u) = 0` with `u(0) = g`.
- A semiconcave weak solution in the sense of §3.3 is a viscosity solution.
- The classical solution of §2.4 is a viscosity solution on its interval of existence.

**Checks.**

- `d = 1`, `H(p) = p²`, `g = 0`: the unique `BUC` viscosity solution is `0`, the Hopf–Lax
  function, and not the almost-everywhere solution `ũ` of §3.3.
- `g` convex and Lipschitz and `H` convex and superlinear: the Hopf–Lax and Hopf formulas
  agree.
- `H(p) = −‖p‖²/2`, concave: with `g(x) = ‖x‖`, convex, the Hopf formula gives
  `u(t,x) = ‖x‖ + t/2`, which is `−ũ` for the Hopf–Lax solution `ũ` of §3.1 with datum
  `−‖x‖`.

*Needs:* §3.1–§3.3, §4.3–§4.4.

### 4.6 Optimal control and the Hamilton–Jacobi–Bellman equation

Let `A` be a nonempty compact metric space of control values, and let `b : E → A → E` and
`ℓ : E → A → ℝ` be bounded, continuous, and Lipschitz in `x` uniformly in `a`; let `g` be
bounded and Lipschitz. A *control* is a measurable `α : ℝ → A`. For `x : E` the *trajectory*
`y_{x,α}` is the unique continuous solution of `y(s) = x + ∫₀ˢ b(y(r), α(r)) dr`, and the
*value function* is

`v(t,x) = inf_α {∫₀ᵗ ℓ(y_{x,α}(s), α(s)) ds + g(y_{x,α}(t))}`.

- Existence, uniqueness and Lipschitz dependence on `x` of trajectories for measurable
  controls, by the contraction principle on the integral equation.
- The dynamic programming principle (Evans, §10.3.2, Theorem 1): for `t, h ≥ 0`,
  `v(t + h, x) = inf_α {∫₀ʰ ℓ(y(s), α(s)) ds + v(t, y(h))}`.
- `v` is bounded and Lipschitz on `[0,T] × E` (Evans, §10.3.2, Lemma 1).
- The Hamilton–Jacobi–Bellman equation (Evans, §10.3.3, Theorem 2): with
  `H(x,p) = max_{a ∈ A} {−⟪b(x,a), p⟫ − ℓ(x,a)}`, which satisfies the hypotheses of §4.5, `v`
  is the unique bounded continuous viscosity solution of `∂ₜv + H(x, ∇v) = 0`, `v(0) = g`.
- The infimum over piecewise constant controls is the same.
- The discounted infinite-horizon problem: for `λ > 0`,
  `w(x) = inf_α ∫₀^∞ e^{−λs} ℓ(y_{x,α}(s), α(s)) ds` is bounded and uniformly continuous,
  satisfies `w(x) = inf_α {∫₀ʰ e^{−λs} ℓ ds + e^{−λh} w(y(h))}`, and is the unique bounded
  continuous viscosity solution of `λw + H(x, ∇w) = 0` on `E`
  (Bardi–Capuzzo-Dolcetta, Proposition III.2.8).

**Checks.**

- `A` the closed ball of radius `R` in `E`, `b(x,a) = −a`, `ℓ(x,a) = L(a)` for a convex
  superlinear `L`: `H(p) = max_{‖a‖ ≤ R} {⟪a, p⟫ − L(a)}`, and for `R` at least the constant
  of the domain-of-dependence bullet of §3.1 the value function is the Hopf–Lax function of
  `g`.
- `ℓ = 0`, `A` the closed unit ball, `b(x,a) = a`: `v(t,x) = min {g(y) : ‖y − x‖ ≤ t}` and
  `H(p) = ‖p‖`.
- `d = 1`, `A = {−1, 1}`, `b(x,a) = a`, `ℓ = 1`, `λ = 1` gives `w = 1` constant; with
  `ℓ(x) = min(|x|, 1)`, `w(x) = |x| − 1 + e^{−|x|}` for `|x| ≤ 1`.

*Needs:* §4.3–§4.5; Mathlib's Bochner integral and `ContractingWith`.

### 4.7 The eikonal equation

Let `Ω ⊆ E` be open with `Ω ≠ E`, and `δ(x) = Metric.infDist x Ωᶜ`.

- `δ` is a viscosity solution of `‖∇u‖ − 1 = 0` in `Ω`, and `−δ` is a viscosity solution of
  `1 − ‖∇u‖ = 0`.
- For bounded `Ω`, `δ` is the only viscosity solution of `‖∇u‖ − 1 = 0` in `Ω` that is
  continuous on `closure Ω` and vanishes on `frontier Ω`, by the change of unknown
  `v = 1 − e^{−u}`, which turns the equation into `v + ‖∇v‖ − 1 = 0`, and the comparison
  principle for bounded domains.
- For `ρ > 0`, `δ` is semiconcave with constant `1/ρ` on every convex subset of
  `{x ∈ Ω : δ(x) ≥ ρ}`.
- `δ` is differentiable at `x ∈ Ω` exactly when `x` has a unique nearest point `π(x)` in `Ωᶜ`,
  and then `∇δ(x) = (x − π(x))/δ(x)`.

**Checks.**

- `Ω` the open unit ball: `δ(x) = 1 − ‖x‖`, not differentiable exactly at `0`.
- `d = 2`, `Ω = (−1,1)²`: `δ(x) = 1 − max(|x₁|, |x₂|)`, not differentiable exactly on the
  diagonals.
- `Ω = E \ {0}`: `δ(x) = ‖x‖` is a viscosity solution of `‖∇u‖ − 1 = 0` on `Ω` but not on `E`.

*Needs:* §1.3, §4.1, §4.3; Tau Ceti `norm_fderiv_infDist_eq_one`.

### Examples

The acceptance examples of this layer are the two functions `1 − |x|` and `|x| − 1` for the
two signs of the one-dimensional eikonal equation; the viscous approximation converging to
`1 − |x|`; the sawtooth sequence; the explicit solution `1 − e^{|x| − 1}`; the control problem
whose value is the Hopf–Lax function; and the distance functions of the ball and the square.

## Layer 5: scalar conservation laws in one space dimension

In this layer `d = 1`, the flux is `f : ℝ → ℝ`, and the equation is `∂ₜu + ∂ₓ(f(u)) = 0` on
`(0,∞) × ℝ` with `u(0) = u₀ ∈ L^∞(ℝ)`.

### 5.1 Integral solutions and the Rankine–Hugoniot condition

For continuous `f`, a function `u` as in the Conventions is an *integral solution* when

`∫₀^∞ ∫ (u ∂ₜφ + f(u) ∂ₓφ) dx dt + ∫ u₀(x) φ(0,x) dx = 0`

for every space-time test function `φ`.

- A function that is `C¹` on `(0,T) × ℝ` and continuous on `[0,T) × ℝ` with `u(0) = u₀` is an
  integral solution on `(0,T)` exactly when `∂ₜu + f'(u)∂ₓu = 0`, for `f ∈ C¹`.
- The Rankine–Hugoniot condition (Evans, §3.4.1, Theorem 1): let `W ⊆ (0,∞) × ℝ` be open, `s`
  a `C¹` function of `t`, and `u` a function that is `C¹` on `W ∩ {x < s(t)}` and on
  `W ∩ {x > s(t)}` with continuous extensions `u_l`, `u_r` to the curve from each side. Then
  `u` satisfies the integral identity for test functions supported in `W` exactly when it is a
  classical solution on each side and `f(u_l) − f(u_r) = ṡ (u_l − u_r)` along the curve.
- Invariances: translations in `x` and `t`, the scaling `u(λt, λx)`, and for a flux
  `f(u) + au + b` the solution `u(t, x − at)`.

**Checks.**

- Burgers' equation, `u₀ = 1` for `x ≤ 0`, `1 − x` for `0 ≤ x ≤ 1`, `0` for `x ≥ 1`
  (Evans, §3.4.1, Example 1): for `t < 1`, `u = 1` for `x ≤ t`, `(1 − x)/(1 − t)` for
  `t ≤ x ≤ 1`, `0` for `x ≥ 1`; for `t ≥ 1`, `u = 1` for `x < (1 + t)/2` and `0` beyond. The
  shock speed `1/2` is the Rankine–Hugoniot speed.
- Burgers' equation, `u₀ = 0` for `x < 0` and `1` for `x > 0` (Evans, §3.4.1, Example 2):
  `u₁ = 0` for `x < t/2`, `1` for `x > t/2`, and `u₂ = 0` for `x < 0`, `x/t` for `0 < x < t`,
  `1` for `x > t`, are both integral solutions.

*Needs:* Mathlib's integration by parts on `ℝ` and the divergence theorem on rectangles.

### 5.2 The Lax–Oleinik formula

Let `f ∈ C²` be uniformly convex with constant `θ`, `L = f*`, `G = (f')⁻¹ : ℝ → ℝ`, and
`h(y) = ∫₀^y u₀`. Then `h` is Lipschitz and `w(t,x) = min_y {h(y) + t L((x − y)/t)}` is the
Hopf–Lax function of Layer 3 for `H = f` and `g = h`. Prove (Evans, §3.4.2, Theorem 1):

- for each `t > 0`, for all but countably many `x` the minimum is attained at a unique point
  `y(t,x)`;
- `x ↦ y(t,x)` is nondecreasing;
- for each `t > 0` and almost every `x`, `∂ₓw(t,x) = G((x − y(t,x))/t)`.

Define the *Lax–Oleinik solution* `u(t,x) = G((x − y(t,x))/t)`.

- `u` is an integral solution of the conservation law with datum `u₀`
  (Evans, §3.4.2, Theorem 2).
- The one-sided inequality (Evans, §3.4.2, Lemma): for `t > 0`, `z > 0` and all `x` at which
  `u(t, ·)` is defined, `u(t, x + z) − u(t, x) ≤ z/(θt)`.
- `ess inf u₀ ≤ u ≤ ess sup u₀`; `u(t, ·)` has locally bounded variation for `t > 0`, and left
  and right limits `u(t, x⁻) ≥ u(t, x⁺)` at every `x`.
- `u₀ ≤ ũ₀` almost everywhere gives `u ≤ ũ` almost everywhere.

**Checks.**

- Burgers' equation: `L(q) = q²/2`, `G(q) = q`, and `u(t,x) = (x − y(t,x))/t`.
- The second Check of §5.1: the formula gives the rarefaction `u₂`, and `u₁` violates the
  one-sided inequality across `x = t/2`.
- The first Check of §5.1: the formula gives the stated solution, including the shock for
  `t ≥ 1`.

*Needs:* §1.1, §3.1–§3.2; Mathlib `Monotone.countable_not_continuousAt`,
`Monotone.ae_differentiableAt`.

### 5.3 Entropy solutions and uniqueness

An *entropy solution in the sense of Oleinik* is an integral solution for which there is a
`C ≥ 0` with `u(t, x + z) − u(t, x) ≤ C(1 + 1/t) z` for almost every `t > 0` and almost every
`(x, z)` with `z > 0`.

- Uniqueness (Oleinik; Evans, §3.4.3, Theorem 3): for `f ∈ C²` convex, two entropy solutions
  with the same `u₀ ∈ L^∞` agree almost everywhere.
- For `f ∈ C²` uniformly convex, the Lax–Oleinik solution is the entropy solution.
- For piecewise `C¹` solutions as in the Rankine–Hugoniot bullet of §5.1 with `f` uniformly
  convex, the entropy condition holds across the curve exactly when `u_l ≥ u_r`, equivalently
  `f'(u_l) ≥ ṡ ≥ f'(u_r)` (the Lax condition).

*Needs:* §5.1–§5.2.

### 5.4 The Riemann problem

For `f ∈ C²` uniformly convex and `u₀ = u_l` for `x < 0`, `u_r` for `x > 0`
(Evans, §3.4.4, Theorem 4):

- if `u_l > u_r`, the entropy solution is `u_l` for `x < σt` and `u_r` for `x > σt`, with
  `σ = (f(u_l) − f(u_r))/(u_l − u_r)`;
- if `u_l < u_r`, it is `u_l` for `x < f'(u_l)t`, `G(x/t)` for `f'(u_l)t < x < f'(u_r)t`, and
  `u_r` for `x > f'(u_r)t`;
- if `u_l < u_r`, the discontinuous function `u_l` for `x < σt`, `u_r` for `x > σt` is an
  integral solution and is not an entropy solution.

**Checks.** Burgers' equation with `(u_l, u_r) = (1, 0)` and `(0, 1)`: the shock `x = t/2` and
the rarefaction `x/t` of §5.1.

*Needs:* §5.3.

### 5.5 Long-time behaviour

Let `f ∈ C²` be uniformly convex with constant `θ`, and `u` the Lax–Oleinik solution.

- Decay (Evans, §3.4.5, Theorem 5): if `u₀ ∈ L¹ ∩ L^∞` then
  `|u(t,x)| ≤ C t^{−1/2}` for `t > 0`, with `C` depending only on `f` and `‖u₀‖₁`.
- N-waves (Evans, §3.4.5, Theorem 6): if `u₀` is bounded with compact support, put
  `σ = f'(0)`, `κ = f''(0)`, `p = −2 min_y ∫_{−∞}^y u₀` and `q = 2 max_y ∫_y^∞ u₀`, and
  `N(t,x) = (x/t − σ)/κ` for `−√(pκt) < x − σt < √(qκt)`, `0` otherwise. Then
  `∫ |u(t,x) − N(t,x)| dx ≤ C t^{−1/2}` for `t > 0`.
- Conservation of mass: `∫ u(t,x) dx = ∫ u₀` for `u₀ ∈ L¹ ∩ L^∞`.

**Checks.**

- For `t > 0`, `N` is a classical solution of the equation with flux `σu + κu²/2` between its
  two jumps, both jumps satisfy the Rankine–Hugoniot condition and `u_l > u_r`, and
  `∫ N(t,x) dx = (q − p)/2 = ∫ u₀`.
- Burgers' equation with `u₀` the indicator of `[0,1]`: `p = 0`, `q = 2`, and for `t ≥ 2` the
  solution is exactly `x/t` on `(0, √(2t))` and `0` elsewhere, equal to `N`.

*Needs:* §5.2–§5.3.

### Examples

The acceptance examples of this layer are the two Evans examples for Burgers' equation; the
two Riemann problems; and the indicator datum whose solution becomes exactly an N-wave at
`t = 2`.

## Layer 6: Kružkov's theory in several space dimensions

In this layer `f : ℝ → E` is locally Lipschitz, `u₀ ∈ L^∞(E)`, and the equation is
`∂ₜu + div f(u) = 0` on `(0,T) × E`.

### 6.1 Entropy solutions

A function `u` as in the Conventions is an *entropy solution* on `(0,T)` when for every
`k : ℝ` and every nonnegative space-time test function `φ` supported in `t < T`,

`∫₀ᵀ ∫ (|u − k| ∂ₜφ + sign(u − k) ⟪f(u) − f(k), ∇φ⟫) dx dt + ∫ |u₀(x) − k| φ(0,x) dx ≥ 0`.

- An entropy solution is a weak solution: the identity
  `∫₀ᵀ∫ (u ∂ₜφ + ⟪f(u), ∇φ⟫) + ∫ u₀ φ(0, ·) = 0` holds for every test function.
- Entropy pairs: `u` is an entropy solution exactly when, for every convex `η ∈ C¹(ℝ)` and
  `q : ℝ → E` with `q' = η' f'` almost everywhere, the same inequality holds with `|u − k|`
  replaced by `η(u)`, `sign(u − k)(f(u) − f(k))` by `q(u)` and `|u₀ − k|` by `η(u₀)`.
- Kružkov's form: `u` is an entropy solution exactly when the inequality without the initial
  term holds for nonnegative test functions supported in `(0,T) × E`, and
  `∫_{‖x‖ ≤ R} |u(t,x) − u₀(x)| dx → 0` as `t → 0⁺` outside a null set of times, for every `R`.
- A function that is `C¹` on `(0,T) × E` and continuous on `[0,T) × E` with `u(0) = u₀` is an
  entropy solution exactly when it is a classical solution; then every entropy inequality is
  an equality.
- Piecewise `C¹` solutions in one space dimension: with the notation of the Rankine–Hugoniot
  bullet of §5.1, `u` is an entropy solution in `W` exactly when it is classical on each side,
  the Rankine–Hugoniot condition holds, and for every `k` strictly between `u_l` and `u_r`,
  `(f(k) − f(u_l))/(k − u_l) ≥ ṡ` (Oleinik's condition E).

**Checks.**

- `f(u) = ua` for `a : E`: `u₀(x − ta)` is an entropy solution for every `u₀ ∈ L^∞`, with
  equality in every entropy inequality.
- Burgers' equation: the stationary function `1` for `x < 0`, `−1` for `x > 0` is an entropy
  solution; `−1` for `x < 0`, `1` for `x > 0` is a weak solution and fails the entropy
  inequality for `k = 0`, where the left side equals `−∫₀ᵀ φ(t,0) dt`.
- A flux that is not convex: `f(u) = u³` and a stationary-frame jump between `−1` and `1`,
  with Rankine–Hugoniot speed `1`. For `u_l = −1`, `u_r = 1` the slope in condition E is
  `k² − k + 1`, which is `3/4 < 1` at `k = 1/2`; for `u_l = 1`, `u_r = −1` it is `k² + k + 1`,
  which is `3/4` at `k = −1/2`. Neither jump is admissible.

*Needs:* Mathlib `SignType.sign`; the space-time test functions of the Conventions.

### 6.2 The `L¹` contraction and uniqueness

Let `u, v` be entropy solutions on `(0,T)` with data `u₀, v₀ ∈ L^∞`, let
`M ≥ max(‖u‖_∞, ‖v‖_∞)`, and let `N` be the speed bound of `f` on `[−M, M]`. Prove
(Kružkov 1970, Theorem 1), by doubling the variables: for every `x₀`, `R > 0` and almost every
`t ∈ (0,T)` with `Nt < R`,

`∫_{‖x − x₀‖ ≤ R − Nt} |u(t,x) − v(t,x)| dx ≤ ∫_{‖x − x₀‖ ≤ R} |u₀(x) − v₀(x)| dx`.

- Kato's inequality: `∂ₜ|u − v| + div (sign(u − v)(f(u) − f(v))) ≤ 0` in the sense of
  distributions on `(0,T) × E`, and the same with positive parts.
- Uniqueness: two entropy solutions with the same datum agree almost everywhere.
- Finite propagation speed: `u₀ = v₀` almost everywhere on the ball of radius `R` about `x₀`
  gives `u = v` almost everywhere on `{(t,x) : ‖x − x₀‖ ≤ R − Nt}`.
- The `L¹` contraction: if `u₀ − v₀ ∈ L¹` then `‖u(t) − v(t)‖₁ ≤ ‖u₀ − v₀‖₁` for almost every
  `t`.
- Comparison: `∫ (u(t) − v(t))⁺ ≤ ∫ (u₀ − v₀)⁺`, so `u₀ ≤ v₀` almost everywhere gives `u ≤ v`
  almost everywhere; and `ess inf u₀ ≤ u ≤ ess sup u₀`.
- Translation estimate: `∫ |u(t, x + h) − u(t, x)| dx ≤ ∫ |u₀(x + h) − u₀(x)| dx` for every
  `h : E`; consequently the total variation `totalVariationOn volume ⊤ (u t)` is at most that
  of `u₀`.
- Conservation of mass: if `u₀ ∈ L¹ ∩ L^∞` then `∫ u(t,x) dx = ∫ u₀` for almost every `t`.

**Checks.**

- The speed bound is sharp: for `f(u) = ua`, the solutions with data `0` and the indicator of
  a ball differ exactly on the ball translated by `ta`, and `N = ‖a‖`.
- For `f = 0` the solution is `u(t) = u₀` and the global contraction is an equality.

*Needs:* §6.1; Tau Ceti `totalVariationOn`, `lintegral_enorm_comp_add_sub_le_mul_totalVariationOn`;
Mathlib mollifiers.

### 6.3 The viscous approximation

Let `ε > 0`, `f ∈ C²` and `u₀ ∈ L^∞(E)`. With `Γ_s = TauCeti.heatKernel s` and `M = ‖u₀‖_∞`:

- Mild solutions: there is a unique bounded measurable `u^ε` on `(0,∞) × E` with
  `u^ε(t) = Γ_{εt} ⋆ u₀ − ∫₀ᵗ (∇Γ_{ε(t−s)}) ⋆· f(u^ε(s)) ds`, where `(∇Γ) ⋆· F` is the
  convolution of the gradient of the kernel with a vector field, contracted by the inner
  product. Local existence is by the contraction principle, using
  `∫ ‖∇Γ_s‖ ≤ C s^{−1/2}`, and global existence by the bound `|u^ε| ≤ M`.
- Regularity: `u^ε` is `C¹` in `t` and `C²` in `x` on `(0,∞) × E`, satisfies
  `∂ₜu^ε + div f(u^ε) = εΔu^ε` there, and `u^ε(t) → u₀` in `L¹_loc` as `t → 0⁺`.
- The maximum principle `ess inf u₀ ≤ u^ε ≤ ess sup u₀`, and comparison: `u₀ ≤ v₀` almost
  everywhere gives `u^ε ≤ v^ε`.
- The entropy identity: for `η ∈ C²(ℝ)` and `q' = η' f'`,
  `∂ₜη(u^ε) + div q(u^ε) = εΔη(u^ε) − εη''(u^ε)‖∇u^ε‖²`.
- The `L¹` contraction `‖u^ε(t) − v^ε(t)‖₁ ≤ ‖u₀ − v₀‖₁` for `u₀ − v₀ ∈ L¹`, the translation
  estimate of §6.2, and conservation of mass, all for every `t > 0`.
- Equicontinuity in time: for `u₀ ∈ L¹ ∩ L^∞` there is a modulus `ω`, depending only on `f`,
  `M`, `‖u₀‖₁` and the `L¹` modulus of continuity of `u₀` under translations, with
  `‖u^ε(t) − u^ε(s)‖₁ ≤ ω(|t − s|)` for all `s, t ≥ 0` and `0 < ε ≤ 1`.

**Checks.**

- `f = 0`: `u^ε(t) = Γ_{εt} ⋆ u₀`.
- `f(u) = ua`: `u^ε(t,x) = (Γ_{εt} ⋆ u₀)(x − ta)`.
- Burgers' equation, `d = 1`: the travelling wave
  `u^ε(t,x) = ½(1 − tanh((x − t/2)/(4ε)))` is a solution, with limits `1` and `0` at `∓∞` and
  speed `1/2`, and converges as `ε → 0` to the shock of §5.4 in `L¹_loc`.
- Burgers' equation, `d = 1`: the Hopf–Cole transformation
  `u^ε = −2ε ∂ₓ log ψ` turns the equation into `∂ₜψ = ε∂ₓ²ψ`.

*Needs:* Tau Ceti `heatKernel`, `exists_integral_norm_iteratedFDeriv_heatKernel_le`,
`heatDuhamelPotential`; PDE §6.3 and §6.5–§6.6; Mathlib `ContractingWith`.

### 6.4 Existence and the solution semigroup

- Existence (Kružkov 1970, Theorems 4 and 5): for every locally Lipschitz `f` and every
  `u₀ ∈ L^∞(E)` there is an entropy solution on `(0,∞)`. For `f ∈ C²` and
  `u₀ ∈ L¹ ∩ L^∞` it is the limit in `L¹_loc((0,∞) × E)`, and in `L¹` of every ball uniformly
  for `t` in compact subsets of `[0,∞)`, of the viscous solutions `u^ε` as `ε → 0⁺`, by the
  Fréchet–Kolmogorov theorem and the estimates of §6.3; for general `u₀` by finite propagation speed; and for locally Lipschitz
  `f` by approximating the flux.
- Time continuity: the entropy solution has a representative with `t ↦ u(t)` continuous from
  `[0,∞)` to `L¹_loc(E)`, and with it every statement of §6.2 holds for every `t`.
- The semigroup: `S(t)u₀ = u(t)` satisfies `S(t + s) = S(t)S(s)`, is order-preserving,
  commutes with translations, is an `L¹` contraction on `L¹ ∩ L^∞`, and `S(t)c = c` for
  constants; `(S(λt)u₀)(λx)` is the solution with datum `u₀(λ ·)`.
- Stability in the flux: if `fₙ → f` locally uniformly with locally uniformly bounded
  Lipschitz constants, then the entropy solutions with flux `fₙ` and datum `u₀` converge in
  `L¹_loc((0,∞) × E)` to the one with flux `f`.
- One space dimension: for `d = 1` and `f ∈ C²` uniformly convex, a function is an entropy
  solution exactly when it is an entropy solution in the sense of Oleinik (§5.3), and it is
  then the Lax–Oleinik solution of §5.2. For an affine flux every weak solution is an entropy
  solution and Oleinik's inequality fails for general data, so uniform convexity cannot be
  dropped.
- Bounded variation: if `u₀` has finite total variation then
  `‖u(t) − u(s)‖₁ ≤ N · totalVariationOn volume ⊤ u₀ · |t − s|`, with `N` the speed bound of
  `f` on `[−‖u₀‖_∞, ‖u₀‖_∞]`.

**Checks.**

- The travelling waves of §6.3 converge to the entropy shock, never to the non-entropy
  stationary jump of §6.1.
- `d = 2`, `f(u) = (u²/2, 0)`: the solution is the one-dimensional Burgers solution in `x₁`
  for almost every fixed `x₂`, so data discontinuous in `x₂` stay discontinuous along
  `x₂ = const`.
- `u₀` the indicator of `[0,1]` for Burgers' equation: the `L¹` Lipschitz constant in time is
  `N · TV(u₀) = 1 · 2`.

*Needs:* §5.2–§5.3, §6.1–§6.3; Tau Ceti
`isCompact_closure_of_comp_add_sub_of_unifTight`; GeometricMeasureTheory G3–G4.

### Examples

The acceptance examples of this layer are the two stationary jumps for Burgers' equation, one
entropy and one not; the cubic flux; the viscous travelling wave and its limit; the
two-dimensional Burgers flux; and the agreement of the Kružkov and Lax–Oleinik solutions.

## Scope and ownership

This roadmap owns, on a finite-dimensional real inner product space: the real-valued Legendre
transform of a superlinear function with its regularity theory; Fréchet sub- and
superdifferentials; semiconcave functions; the characteristic system of a first-order
equation, the local existence theorem for noncharacteristic data, classical transport
equations and the breaking time of classical solutions; the analytic theory of the Hopf–Lax
formula; viscosity sub- and supersolutions of first-order equations with their stability,
comparison and Perron existence theory, the Cauchy problem, the Hopf formula, finite- and
infinite-horizon deterministic optimal control with the Hamilton–Jacobi–Bellman equation, and
the eikonal equation for the distance to the boundary; and scalar conservation laws: integral
solutions, the Rankine–Hugoniot condition, the Lax–Oleinik formula, Oleinik's entropy
condition and uniqueness theorem, the Riemann problem for convex fluxes, decay and N-waves,
Kružkov entropy solutions with their `L¹` theory, and the viscous approximation
`∂ₜu + div f(u) = εΔu` of a scalar conservation law.

- **OptimalTransport** owns convex duality on dual pairs (its §5.1), finite-dimensional convex
  analysis with Alexandrov's theorem for convex functions (§5.2), the `c`-transform (§2.2),
  the continuity equation for measures (§8.7), Moreau–Yosida functionals on metric spaces
  (§10.4), semiconcavity of the squared distance on Riemannian manifolds (Layer 7), and
  viscosity solutions of the Monge–Ampère equation (§6.3). Tau Ceti implements the conjugate,
  the subdifferential and the Hopf–Lax value with its subsolution inequality. Section 1.1 here
  adds only the real-valued theory for superlinear functions, and Layer 3 the analysis of the
  Hopf–Lax value as a solution.
- **PDE** owns Sobolev spaces including the Lipschitz representative of `W^{1,∞}` (its §1.4),
  the heat semigroup with its smoothing estimates (§6.3), the whole-space parabolic comparison
  principle and the linear Schauder theory (§6.5–§6.6), and Perron's method for harmonic
  functions (§3.4). It is linear or quasilinear elliptic and second order throughout, and
  states that viscosity solutions are outside it. Section 6.3 here is the one semilinear
  parabolic problem this roadmap needs and is stated for the scalar viscous conservation law
  only.
- **GeometricMeasureTheory** owns functions of bounded variation on open subsets of Euclidean
  space, the variation measure and compactness in `L¹_loc` (its G3–G4). The total-variation
  statements of §6.2 and §6.4 use its carrier.
- **MarkovDecisionProcesses** owns discrete-time dynamic programming and states that
  continuous-time control and the Hamilton–Jacobi–Bellman equation are outside it. Section 4.6
  is the deterministic continuous-time theory.
- **SymplecticGeometry/IntegrableSystems** owns Lagrangian and Hamiltonian mechanics on
  manifolds, including the Legendre map as a fibre derivative and Hamilton's equations (its
  I3). Section 2.1 states Hamilton's equations on `E` only as the characteristic system of a
  Hamilton–Jacobi equation.
- **RiemannianGeometry** and **RiemannianManifoldsWithConvexBoundary** own distance functions,
  cut loci and signed distances on Riemannian manifolds. Section 4.7 is Euclidean.
- Outside this roadmap: second-order equations in the viscosity sense (the Jensen–Ishii lemma,
  the Crandall–Ishii–Lions theory, fully nonlinear elliptic and parabolic equations, level-set
  mean curvature flow); boundary conditions in the viscosity sense, state constraints and
  Neumann problems; differential games and the Isaacs equation; stochastic control;
  homogenization, weak KAM and Aubry–Mather theory; Tonelli's existence theory for action
  minimizers with Lagrangians depending on position; mean-field games; Hamilton–Jacobi
  equations on manifolds or in infinite dimensions; the Cauchy–Kovalevskaya theorem; systems
  of conservation laws (the Riemann problem for systems, the Lax shock conditions, Glimm's
  scheme and front tracking); the Riemann problem for nonconvex scalar fluxes; initial-boundary
  value problems for conservation laws; error estimates and numerical schemes; compensated
  compactness and the kinetic formulation; and renormalized solutions of transport equations
  with Sobolev velocity fields. A statement in this roadmap is about one real-valued unknown
  and a first-order equation, with the single second-order exception of §6.3.

## Exact supplier contracts

### From Mathlib

- `LipschitzWith.ae_differentiableAt` (`Mathlib/Analysis/Calculus/Rademacher.lean:386`):
  Rademacher's theorem on a finite-dimensional space, used in §3.2 and §4.1; and
  `norm_fderiv_le_of_lipschitz` (`Mathlib/Analysis/Calculus/FDeriv/Basic.lean:949`).
- `IsPicardLindelof` (`Mathlib/Analysis/ODE/PicardLindelof.lean:80`), `ODE_solution_unique`
  (`Mathlib/Analysis/ODE/ExistUnique.lean:327`) and `dist_le_of_trajectories_ODE`
  (`Mathlib/Analysis/ODE/Gronwall.lean:228`): existence, uniqueness and Lipschitz dependence
  for the characteristic system of Layer 2.
- `ContDiffAt.toOpenPartialHomeomorph`
  (`Mathlib/Analysis/Calculus/InverseFunctionTheorem/ContDiff.lean:31`) and
  `ContDiffAt.implicitFunction` with `ContDiffAt.contDiffAt_implicitFunction`
  (`Mathlib/Analysis/Calculus/ImplicitContDiff.lean:55,91`): the inverse and implicit function
  theorems of §2.2 and §2.4.
- `ConvexOn`, `StrictConvexOn` (`Mathlib/Analysis/Convex/Function.lean:54,64`),
  `StrongConvexOn` (`Mathlib/Analysis/Convex/Strong.lean:117`) and `ConvexOn.locallyLipschitz`
  (`Mathlib/Analysis/Convex/Continuous.lean:223`).
- `LowerSemicontinuous`, `UpperSemicontinuous`
  (`Mathlib/Topology/Semicontinuity/Defs.lean:293,317`) and
  `upperSemicontinuous_iff_limsup_le` (`Mathlib/Topology/Semicontinuity/Basic.lean:854`).
- `IsLocalMin.fderiv_eq_zero` and `IsLocalMax.fderiv_eq_zero`
  (`Mathlib/Analysis/Calculus/LocalExtr/Basic.lean:181,191`).
- `Metric.infDist` with `Metric.lipschitz_infDist_pt`
  (`Mathlib/Topology/MetricSpace/HausdorffDistance.lean:464,551`).
- `eVariationOn`, `LocallyBoundedVariationOn`
  (`Mathlib/Topology/EMetricSpace/BoundedVariation.lean:61,71`),
  `Monotone.countable_not_continuousAt` (`Mathlib/Topology/Order/Monotone.lean:166`) and
  `Monotone.ae_differentiableAt` (`Mathlib/Analysis/Calculus/Monotone.lean:213`): the
  one-dimensional monotone and bounded-variation facts of §5.2.
- `integral_bilinear_hasFDerivAt_right_eq_neg_left_of_integrable`
  (`Mathlib/Analysis/Calculus/LineDeriv/IntegrationByParts.lean:179`) and
  `integral2_divergence_prod_of_hasFDerivAt`
  (`Mathlib/MeasureTheory/Integral/DivergenceTheorem.lean:551`): integration by parts for §5.1
  and §6.1.
- `MeasureTheory.convolution`, `ContDiffBump`, `ContractingWith`, the Bochner integral, `Lp`,
  `gradient` (`Mathlib/Analysis/Calculus/Gradient/Basic.lean:83`) and the Arzelà–Ascoli
  theorem.
- Mathlib has no Legendre–Fenchel conjugate, no subdifferential of any kind, no semicontinuous
  envelope, no viscosity solution, no characteristic system of a partial differential
  equation and no conservation law.

### From Tau Ceti

Locators are relative to `TauCeti/` at the pinned revision.

- `TauCeti.hopfLax` (`Analysis/PDE/HopfLax.lean:89`) with `hopfLax_le`, `le_hopfLax_iff`,
  `hopfLax_mono`, the subsolution inequality `hopfLax_add_add_smul_le` (`:146`),
  `antitoneOn_hopfLax`, `upperSemicontinuousOn_hopfLax` and the power-cost lemmas
  `hopfLax_norm_rpow` (`:201`) and `continuousOn_hopfLax_norm_rpow` (`:307`): the object of
  Layer 3. The file does not prove attainment for Lipschitz data, the semigroup property, any
  Lipschitz or semiconcavity estimate, the equation, or the limit `t → 0⁺`.
- `TauCeti.fenchelConjugate` (`Analysis/Convex/Conjugate.lean:119`), the Fenchel–Moreau theorem
  `fenchelConjugate_innerₗ_fenchelConjugate_innerₗ` (`Analysis/Convex/FenchelMoreau.lean:245`)
  and `TauCeti.subdifferential` (`Analysis/Convex/Subdifferential.lean:89`).
- `exists_fenchelConjugate_eq_of_superlinear`,
  `contDiff_fenchelConjugate_toReal_of_superlinear` and
  `mem_subdifferential_iff_eq_gradient_fenchelConjugate_of_superlinear`
  (`Analysis/Convex/Superlinear.lean:88,178,190`): finiteness, attainment and `C¹` regularity
  of the conjugate of a superlinear function, the start of §1.1.
- `ConvexOn.ae_existsUnique_isPositive_isLittleO` (`Analysis/Convex/Alexandrov.lean:623`):
  Alexandrov's theorem, used in §1.3.
- `TauCeti.IsMongeAmpereViscositySubsolution`, `…Supersolution` and `…Solution`
  (`Analysis/Convex/MongeAmpere/Viscosity.lean:89,100,115`): the conventions that the
  predicates of §4.1 follow. Nothing in Layer 4 is stated about the Monge–Ampère equation.
- `ODE.globalSolution` (`Analysis/ODE/GlobalSolution.lean:207`) and `ODE.contDiff_globalSolution`
  (`Analysis/ODE/InitialCondition.lean:137`): global flows of Lipschitz autonomous fields and
  their smooth dependence on initial data, for Layer 2.
- `TauCeti.norm_fderiv_infDist_eq_one` and `norm_fderiv_infDist_ae_eq_indicator`
  (`Analysis/Calculus/FDeriv/InfDist.lean:36,96`): the eikonal equation at points of
  differentiability of the distance, for §4.7.
- `TauCeti.LocallyLipschitzOn.hasWeakFDerivOn_fderiv`
  (`Analysis/Sobolev/WeakDeriv/Lipschitz.lean:134`): a locally Lipschitz function has its
  almost-everywhere derivative as weak derivative.
- `TauCeti.heatKernel` (`Analysis/PDE/HeatKernel/Basic.lean:76`),
  `exists_integral_norm_iteratedFDeriv_heatKernel_le`
  (`Analysis/PDE/HeatKernel/Derivatives.lean:386`),
  `norm_iteratedFDeriv_heatKernel_convolution_le` (`Analysis/PDE/HeatKernel/HeatEquation.lean:166`)
  and `heatDuhamelPotential` (`Analysis/PDE/HeatKernel/DuhamelPotential/Basic.lean:117`): the
  linear estimates behind §6.3.
- The parabolic comparison principles of `Analysis/PDE/MaximumPrinciple/Parabolic/Basic.lean`
  and `Analysis/PDE/MaximumPrinciple/Parabolic/WholeSpace.lean`, for the maximum principle of
  §6.3.
- `TauCeti.totalVariationOn` (`Analysis/BoundedVariation/TotalVariation.lean:100`), its lower
  semicontinuity `totalVariationOn_le_liminf` (`:375`), the translation estimate
  `lintegral_enorm_comp_add_sub_le_mul_totalVariationOn`
  (`Analysis/BoundedVariation/Translation.lean:333`) and the compactness theorem
  `exists_subseq_tendsto_setLIntegral_enorm_sub_of_totalVariationOn_le`
  (`Analysis/BoundedVariation/Compactness.lean:187`).
- The Fréchet–Kolmogorov theorem `isCompact_closure_of_comp_add_sub_of_unifTight`
  (`MeasureTheory/Function/Lp/FrechetKolmogorov.lean:322`) and continuity of translations
  `MemLp.tendsto_eLpNorm_comp_add_sub` (`MeasureTheory/Function/Lp/Translation.lean:213`): the
  compactness step of §6.4.
- `TauCeti.IsContinuityEquation`
  (`MeasureTheory/OptimalTransport/ContinuityEquation/Basic.lean:118`) and the test-function
  lemmas of `MeasureTheory/OptimalTransport/ContinuityEquation/TestFunction.lean`: the
  space-time test class of the Conventions.
- Tau Ceti has no Fréchet sub- or superdifferential, no semiconcave function, no
  semicontinuous envelope, no viscosity solution of a first-order equation, no comparison
  principle for one, no optimal control problem, no characteristic system and no statement
  about a conservation law.

### From TauCetiRoadmap.OptimalTransport

§5.1 (convex duality on dual pairs) and §5.2 (finite-dimensional convex analysis), through the
Tau Ceti declarations above. Layer 1 consumes both; nothing else in OptimalTransport is a
supplier.

### From TauCetiRoadmap.PDE

§6.3 (the heat semigroup and its smoothing estimates) and §6.5–§6.6 (whole-space comparison
and the linear Schauder theory on `ℝⁿ × [0,T]`), consumed by §6.3 only; §1.4 (the Lipschitz
representative of a `W^{1,∞}` class), cited for the identification of Lipschitz solutions with
`W^{1,∞}` functions and not otherwise used.

### From TauCetiRoadmap.GeometricMeasureTheory

G3 (distributional `BV` and variation measures) and G4 (compactness), through the Tau Ceti
declarations above, consumed by §6.2 and §6.4.

## References

- L. C. Evans, *Partial Differential Equations*, 2nd ed., Graduate Studies in Mathematics 19,
  American Mathematical Society, 2010: §2.1 (transport), §3.2 (characteristics), §3.3
  (Hopf–Lax), §3.4 (conservation laws), §10.1–§10.3 (viscosity solutions and control).
- M. G. Crandall, P.-L. Lions, *Viscosity solutions of Hamilton–Jacobi equations*, Trans. Amer.
  Math. Soc. 277 (1983), 1–42.
- M. G. Crandall, L. C. Evans, P.-L. Lions, *Some properties of viscosity solutions of
  Hamilton–Jacobi equations*, Trans. Amer. Math. Soc. 282 (1984), 487–502: the equivalent
  definitions of §4.1 and the stability theorem of §4.2.
- H. Ishii, *Perron's method for Hamilton–Jacobi equations*, Duke Math. J. 55 (1987), 369–384.
- G. Barles, B. Perthame, *Discontinuous solutions of deterministic optimal stopping time
  problems*, RAIRO Modél. Math. Anal. Numér. 21 (1987), 557–579: half-relaxed limits.
- M. Bardi, L. C. Evans, *On Hopf's formulas for solutions of Hamilton–Jacobi equations*,
  Nonlinear Anal. 8 (1984), 1373–1381.
- M. Bardi, I. Capuzzo-Dolcetta, *Optimal Control and Viscosity Solutions of
  Hamilton–Jacobi–Bellman Equations*, Birkhäuser, 1997: Chapters II and III.
- P. Cannarsa, C. Sinestrari, *Semiconcave Functions, Hamilton–Jacobi Equations, and Optimal
  Control*, Birkhäuser, 2004: §1.3 and the semiconcavity of the distance in §4.7.
- E. Hopf, *Generalized solutions of non-linear equations of first order*, J. Math. Mech. 14
  (1965), 951–973.
- P. D. Lax, *Hyperbolic systems of conservation laws II*, Comm. Pure Appl. Math. 10 (1957),
  537–566: the Lax–Oleinik formula and N-waves.
- O. A. Oleinik, *Discontinuous solutions of non-linear differential equations*, Uspekhi Mat.
  Nauk 12 (1957), 3–73; Amer. Math. Soc. Transl. (2) 26 (1963), 95–172.
- S. N. Kružkov, *First order quasilinear equations in several independent variables*, Mat.
  Sb. 81 (1970), 228–255; Math. USSR-Sb. 10 (1970), 217–243.
- C. M. Dafermos, *Hyperbolic Conservation Laws in Continuum Physics*, 4th ed., Springer, 2016:
  Chapters VI and XI.
