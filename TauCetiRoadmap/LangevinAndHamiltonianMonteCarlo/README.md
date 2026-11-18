# Roadmap: Langevin and Hamiltonian Monte Carlo samplers

**Summary.** This roadmap builds the Markov kernels of the gradient-based samplers for a target
measure with density `exp(−U)` on a finite-dimensional real inner product space, and proves the
exact statements about them that hold in discrete time. The kernels are the Metropolis–Hastings
kernel on a general measurable space, Hamiltonian Monte Carlo with the leapfrog integrator or with
the exact Hamiltonian flow, the unadjusted Langevin algorithm, and its Metropolis-adjusted form.
The target is never assumed to be normalized, and the samplers are defined for an arbitrary
measurable drift field `g` in place of the gradient of `U`; a statement that needs `g = ∇U` says
so.

The headline theorems are these.

- A Metropolis–Hastings kernel is reversible with respect to a σ-finite measure exactly when its
  acceptance part is. With finite densities against one s-finite reference measure, the usual
  acceptance ratio makes the kernel reversible. For a deterministic proposal given by a measurable
  involution, the kernel is reversible exactly when the target weighted by the acceptance
  probability is invariant under the involution.
- For every measurable potential `U`, every measurable drift `g`, every real step size and every
  number of leapfrog steps, the Hamiltonian Monte Carlo kernel is reversible with respect to the
  measure with density `exp(−U)`. If `g` is the gradient of `U` and is Lipschitz, the same holds for
  Hamiltonian Monte Carlo with the exact flow, which accepts every proposal; this rests on
  Liouville's theorem for Hamilton's equations with a Lipschitz force.
- If `U` is `m`-strongly convex with `L`-Lipschitz gradient and `0 ≤ h`, `h (m + L) ≤ 2`, one step
  of the unadjusted Langevin algorithm with step `h` contracts the Wasserstein distance of order 2
  between any two probability measures by the factor `1 − h m`. If moreover `m > 0` and `h > 0`,
  the algorithm has exactly one invariant probability measure; its second moment about the
  minimizer of `U` is at most `d (m + L) / (m L)` in dimension `d`, and the distance from the
  `k`-th iterate to any probability measure is bounded by the contracted initial distance plus the
  one-step defect of that measure divided by `h m`.
- The Metropolis-adjusted Langevin algorithm is reversible with respect to the target, and it is
  Hamiltonian Monte Carlo with a single leapfrog step.

The roadmap builds on Mathlib's Markov kernels, with its notions of invariant measure and
reversibility, on Tau Ceti's Wasserstein distance and its global solutions of Lipschitz ordinary
differential equations, and on the one-step leapfrog facts of MathematicalStatisticsFoundations.
Continuous-time Langevin diffusions belong to StochasticCalculus and OptimalTransport and are not
used.

Layer 1 treats Metropolis–Hastings kernels on a measurable space. Layer 2 collects what the
samplers need of the leapfrog map: its iterates, its Jacobian, and its exact behaviour on quadratic
potentials. Layer 3 treats Hamilton's equations for a separable Hamiltonian: conservation of
energy, time reversal, the error of the leapfrog map with explicit constants, and Liouville's
theorem. Layer 4 assembles Hamiltonian Monte Carlo from Layers 1 to 3. Layer 5 treats the Langevin
algorithms; its contraction theory uses none of the other layers, and its Metropolis-adjusted
kernel uses Layers 1 and 4.

## Conventions

- `X`, `Y` are measurable spaces. Kernels are Mathlib's `ProbabilityTheory.Kernel`; invariance and
  reversibility are `Kernel.Invariant` and `Kernel.IsReversible`. Densities and acceptance
  functions take values in `ℝ≥0∞`, with Mathlib's conventions `0 / 0 = 0`, `c / 0 = ∞` for
  `c ≠ 0`, `c / ∞ = 0` and `0 * ∞ = 0`.
- `E` is a real inner product space. Layers 2 and 3 assume no more unless a statement says so;
  Layers 4 and 5 assume `E` finite-dimensional with its Borel σ-algebra, and `volume` is Lebesgue
  measure. `d = Module.finrank ℝ E`.
- Phase space is `E × E` with points `z = (q, p)`, position first. The kinetic energy is
  `‖p‖² / 2`. A positive definite mass matrix `M` is covered by this convention: in the inner
  product `⟪u, M v⟫` and with the velocity as second coordinate, Hamilton's equations for
  `U q + ⟪p, M⁻¹ p⟫ / 2` are those for `U q + ‖v‖² / 2`, and the gradient of `U` is `M⁻¹ ∇U`.
- **Drift.** `g : E → E` stands for the gradient of the potential `U : E → ℝ`. "`U` has gradient
  `g`" means `HasFDerivAt U (innerSL ℝ (g x)) x` for every `x`, that is,
  `fderiv ℝ U x v = ⟪g x, v⟫`; on a complete `E` this is Mathlib's `HasGradientAt U (g x) x`.
- **Signs.** One leapfrog step is a half step `p ↦ p − (h/2) g q`, a full step `q ↦ q + h p`, and
  a half step in `p` again. This is the map of MathematicalStatisticsFoundations 9.4, with the
  same minus sign and the same order.
- `S = momentumFlip`, `Ψ = leapfrog g h`, `H = hamiltonian U`. The standard Gaussian law on `E` is
  Mathlib's `stdGaussian E`, written `γ`.
- `W₂ μ ν` is `TauCeti.wassersteinEDist 2 μ ν`, a value in `ℝ≥0∞`, for the norm distance of `E`.
  `κ ∘ₘ μ` is the law after one step of the kernel `κ` from the law `μ`, and `κ ^ k` is the `k`-fold
  composition.
- Strong convexity with modulus `m` is Mathlib's `StrongConvexOn Set.univ m U`, for any real `m`.

## Layer 1: Metropolis–Hastings kernels on a measurable space

### 1.1 The kernel

For an s-finite kernel `Q : Kernel X X` (the proposal) and `a : X → X → ℝ≥0∞` (the acceptance
function), define

    mhKernel Q a = Q.withDensity a + Kernel.id.withDensity (fun x _ ↦ 1 − Q.withDensity a x univ)

(`mhKernel`). Its first summand is the acceptance part and its second the rejection part. Prove:

- if `a` is jointly measurable, then for measurable `B`,
  `mhKernel Q a x B = ∫⁻ y in B, a x y ∂Q x + (1 − ∫⁻ y, a x y ∂Q x) · 1_B x`; if `a` is not
  jointly measurable the acceptance part is `0` and the kernel is `Kernel.id`;
- if `Q` is a Markov kernel and `a x y ≤ 1` for all `x`, `y`, then `mhKernel Q a` is a Markov
  kernel (`isMarkovKernel_mhKernel`);
- for a σ-finite measure `π`, `mhKernel Q a` is reversible with respect to `π` if and only if
  `Q.withDensity a` is (`mhKernel_isReversible_iff`); the implication from right to left holds for
  every measure `π`.

The rejection part contributes `∫⁻ x in A ∩ B, r x ∂π` with `r ≤ 1` to the flow from `A` to `B`,
which is symmetric in `A` and `B`; it is finite when `π (A ∩ B)` is, and the general case follows
by exhausting `X` by sets of finite measure. A reversible Markov kernel leaves `π` invariant by
`Kernel.IsReversible.invariant`. (Tierney 1998, Sections 1 and 2: the kernel is equation (1) and
the equivalence is that of the detailed balance relation (2) with (3), for a probability measure
`π`, a Markov `Q` and measurable `a` with values in `[0, 1]`; the form for σ-finite `π` is proved
here.)

**Checks.**

- `X = {0, 1}`, `Q x = δ_{1−x}`, `a 0 1 = 1`, `a 1 0 = 1/2`, `π = (1, 2)`: the kernel moves from
  `0` to `1` with probability `1` and from `1` to `0` with probability `1/2`, and both flows equal
  `1`.
- `Q x = δ_x` and `a = 0`: the kernel is `Kernel.id`. A definition without the rejection part
  gives the zero kernel.
- `a = 2` and `Q` Markov: the acceptance part has mass `2` and the truncated rejection mass is
  `0`, so the total mass is `2`; the bound `a ≤ 1` cannot be dropped from the Markov property.
- `X = ℤ/3`, `Q x = δ_{x+1}`, `a = 1`, `π` uniform: the flow from `{0}` to `{1}` is `1/3` and the
  flow back is `0`; neither side of the equivalence holds.

*Needs:* Mathlib `Kernel.withDensity`, `Kernel.withDensity_apply'`,
`Kernel.withDensity_of_not_measurable`, `Kernel.IsReversible`.

### 1.2 Densities against a reference measure

Define `mhAcceptance p q x y = min 1 (p y * q y x / (p x * q x y))` for `p : X → ℝ≥0∞` and
`q : X → X → ℝ≥0∞` (`mhAcceptance`). Prove:

- `mhAcceptance p q x y * (p x * q x y) = min (p x * q x y) (p y * q y x)` whenever
  `p x * q x y ≠ ∞`;
- let `lam` be an s-finite measure, `p` and `q` measurable (`q` jointly) with finite values, and
  `Q` an s-finite kernel with `Q x = lam.withDensity (q x)` for every `x`. Then
  `mhKernel Q (mhAcceptance p q)` is reversible with respect to `lam.withDensity p`
  (`mhKernel_mhAcceptance_isReversible`). No normalization of `p` is assumed.
- on a finite type with the counting measure and positive weights `p`, this kernel is the
  Metropolis–Hastings kernel of MathematicalStatisticsFoundations 9.4: the two acceptance
  functions differ only where `q x y = 0`, where no mass is proposed.

By the first bullet the flow from `A` to `B` is `∫⁻ x in A, ∫⁻ y in B, min (p x * q x y) (p y * q y x)`
against `lam` twice, and Tonelli's theorem exchanges the integrals. (Tierney 1998, Section 2,
special case 1; proved here.)

**Checks.**

- `X = {0, 1}`, counting measure, `p = (1, 2)`, `q x y = 1` for `y ≠ x` and `0` otherwise: the
  acceptance is `min 1 2 = 1` from `0` and `1/2` from `1`, the kernel of the first Check of 1.1.
- `p x * q x y = 0 = p y * q y x` gives acceptance `0`; `p x * q x y = 0 < p y * q y x` gives `1`;
  in both cases the two flows vanish.
- `p 0 = ∞`, `p 1 = 1`, `q = 1/2` on `{0, 1}`: `mhAcceptance p q 0 1 = 0` and
  `mhAcceptance p q 1 0 = 1`, so the flow from `0` to `1` is `∞ · (1/2) · 0 = 0` and the flow back
  is `1/2`. The same happens for `p = 1`, `q 0 1 = ∞`, `q 1 0 = 1`. Finiteness of both densities
  cannot be dropped.
- Replacing `p` by `c · p` with `0 < c < ∞` does not change the acceptance.

*Needs:* 1.1; Mathlib `MeasureTheory.lintegral_prod`, `Kernel.withDensity_apply'`.

### 1.3 Deterministic proposals and involutions

Define `involutiveKernel f a = mhKernel (Kernel.id.map f) (fun x _ ↦ a x)` for `f : X → X` and
`a : X → ℝ≥0∞` (`involutiveKernel`): from `x` it proposes `f x` and accepts with probability
`a x`. For measurable `f` and measurable `a ≤ 1` it is `a x • δ_{f x} + (1 − a x) • δ_x`. Prove:

- for a σ-finite `π`, a measurable involution `f` and measurable `a`, the kernel is reversible
  with respect to `π` if and only if `(π.withDensity a).map f = π.withDensity a`
  (`involutiveKernel_isReversible_iff`);
- **Jacobian form.** Let `lam` be σ-finite, `f` a measurable involution, and `j` measurable with
  `lam.map f = lam.withDensity j`. For measurable `p` with finite values, the kernel with
  acceptance `a x = min 1 (p (f x) * j x / p x)` is reversible with respect to
  `lam.withDensity p` (`involutiveKernel_isReversible_of_map_eq_withDensity`). If `f` preserves
  `lam`, then `j = 1` and `a x = min 1 (p (f x) / p x)`.
- for a continuously differentiable involution `f` of a finite-dimensional `E` and
  `lam = volume`, the hypothesis holds with `j x = |det (fderiv ℝ f x)|`.

For the equivalence, 1.1 reduces reversibility to the symmetry of
`(A, B) ↦ (π.withDensity a) (A ∩ f ⁻¹' B)`; taking `B = univ` gives the invariance, and the
converse uses `f ⁻¹' (f ⁻¹' B ∩ A) = B ∩ f ⁻¹' A`. For the Jacobian form,
`a x * p x = min (p x) (p (f x) * j x)`, and `j (f x) * j x = 1` for `lam`-almost every `x`
because `lam = (lam.map f).map f`. (Tierney 1998, Section 2, special case 2, states the criterion
through the density of `π` against `π + π.map f`; Bou-Rabee and Sanz-Serna 2018, (5.6) with
Proposition 5.1, have the acceptance probability with the Jacobian factor and the invariance of
the target for a map reversible under a linear involution, and Neklyudov, Welling, Egorov and
Vetrov 2020, Proposition 2, has detailed balance for densities. Proved here.)

**Checks.**

- `X = {0, 1}`, `f` the swap, `π = (1, 2)`: the criterion reads `a 0 · 1 = a 1 · 2`; the Jacobian
  form with counting measure gives `a = (1, 1/2)`, and `a = 1` fails, with flows `1` and `2`.
- `X = ℤ` with the counting measure, `f x = x + 1`, `a = 1`: the measure is invariant under `f`,
  and the kernel is the shift, which is not reversible. The involution hypothesis cannot be
  dropped.
- `X = (0, ∞)` with Lebesgue measure, `f x = 1/x`, `j x = x⁻²`, `p = 1`: the acceptance is
  `min 1 x⁻²`. Without the factor `j` the acceptance is `1`, and the kernel `δ_{1/x}` sends
  `(0, 1)`, of measure `1`, into `(1, ∞)`: the flow from `(0, 1)` to `(1, ∞)` is `1` and the flow
  back is `∞`.

*Needs:* 1.1; Mathlib `Kernel.map`, `MeasureTheory.withDensity_eq_iff_of_sigmaFinite`,
`MeasureTheory.lintegral_image_eq_lintegral_abs_det_fderiv_mul` (third bullet).

### 1.4 Auxiliary variables

For a measure `ρ` on `Y` and a kernel `K` on `X × Y`, define

    auxKernel ρ K = (K.map Prod.fst) ∘ₖ (Kernel.id ×ₖ Kernel.const X ρ)

(`auxKernel`): draw `y` from `ρ`, apply `K` at `(x, y)`, and forget the second coordinate. For
s-finite `ρ`, `auxKernel ρ K x B = ∫⁻ y, K (x, y) (B ×ˢ univ) ∂ρ`; it is a Markov kernel when `ρ`
is a probability measure and `K` is Markov. Prove: if `ρ` is s-finite and `K` is reversible with
respect to `π.prod ρ`, then `auxKernel ρ K` is reversible with respect to `π`
(`auxKernel_isReversible`). The flow from `A` to `B` is the flow of `K` from `A ×ˢ univ` to
`B ×ˢ univ`. (Proved here; Neklyudov, Welling, Egorov and Vetrov 2020, Proposition 2, has the
statement for densities.)

**Checks.**

- `X = Y`, `π = ρ` a probability measure, `K (x, y) = δ_{(y, x)}`: `K` is reversible with respect
  to `π.prod π` and `auxKernel ρ K x = π` for every `x`, independent sampling from `π`.
- `X = ℤ/3`, `Y = {1, −1}`, `K (x, y) = δ_{(x + y, −y)}`, `π` and `ρ` uniform: `K` is reversible
  with respect to `π.prod ρ`, and the kernel is the symmetric walk. With `δ_1` in place of `ρ` in
  `auxKernel` the kernel is the shift, which is not reversible: the auxiliary law must be the
  second factor of the product.

*Needs:* Mathlib `MeasureTheory.lintegral_prod`, `Kernel.IsReversible`.

### Examples

Random-walk Metropolis on `ℝ` with a Gaussian proposal (1.2 with `q x y = q y x`, acceptance
`min 1 (p y / p x)`); the swap kernel on two points (1.3); independent sampling as an auxiliary
variable kernel (1.4).

### Dependencies

Layer 1 uses Mathlib only: kernels with density, maps and products of kernels, Tonelli's theorem,
uniqueness of densities, and the change of variables formula in the third bullet of 1.3.

## Layer 2: the leapfrog map

### 2.1 The step and its iterates

Define `momentumFlip (q, p) = (q, −p)` and

    leapfrog g h (q, p) = (q', p − (h/2) • g q − (h/2) • g q'),  q' = q + h • (p − (h/2) • g q)

(`momentumFlip`, `leapfrog`), for any `g : E → E` and `h : ℝ`. These are the maps of
MathematicalStatisticsFoundations 9.4, which proves, for one step, that `S ∘ Ψ ∘ S ∘ Ψ = id`,
that `Ψ` is injective, and that `Ψ` preserves Lebesgue measure when `g` is measurable. Prove, for
every `n : ℕ`:

- `Ψ^[n]` is a bijection with inverse `S ∘ Ψ^[n] ∘ S`, so `S ∘ Ψ^[n]` is an involution; and
  `leapfrog g (−h)` is the inverse of `leapfrog g h`;
- on a finite-dimensional `E` and for measurable `g`, `Ψ^[n]` and `S ∘ Ψ^[n]` are measurable and
  preserve `volume` on `E × E`;
- if `g` is continuous, `Ψ` is a homeomorphism.

(Neal 2011, Section 2.3, equations (2.28) to (2.30) and the discussion of shear maps after them;
Bou-Rabee and Sanz-Serna 2018, Theorems 4.1 and 4.2.)

**Checks.**

- `E = ℝ`, `g = id`, `h = 1`: `Ψ (1, 0) = (1/2, −3/4)`, the value of
  MathematicalStatisticsFoundations 9.4, and `Ψ^[2] (1, 0) = (−1/2, −3/4)`. The other order (a half
  step in `q`, a full step in `p`, a half step in `q`) gives `(1/2, −1)`.
- `g = 0`: `Ψ (q, p) = (q + h p, p)`. `h = 0`: `Ψ = id`.

*Needs:* MathematicalStatisticsFoundations 9.4; Mathlib
`MeasureTheory.MeasurePreserving.iterate`, `LinearIsometryEquiv.measurePreserving`.

### 2.2 Jacobian and symplecticity

Prove:

- if `E` is finite-dimensional and `g` is differentiable, the derivative of `leapfrog g h` at
  every point has determinant `1` (`det_fderiv_leapfrog`);
- if `g` is differentiable and `fderiv ℝ g x` is symmetric for every `x`
  (`⟪fderiv ℝ g x u, v⟫ = ⟪u, fderiv ℝ g x v⟫`), then the derivative `D` of `leapfrog g h` at any
  point preserves the canonical symplectic form:
  `⟪(D u).1, (D v).2⟫ − ⟪(D u).2, (D v).1⟫ = ⟪u.1, v.2⟫ − ⟪u.2, v.1⟫` (`leapfrog_symplectic`).
  The symmetry holds when `g` is the gradient of a twice continuously differentiable `U`.

Both follow from the chain rule for the three shears: a shear `(q, p) ↦ (q, p − c • g q)` has
derivative `(u, v) ↦ (u, v − c • fderiv ℝ g q u)`, which is unipotent and changes the form by
`c (⟪fderiv ℝ g q u, u'⟫ − ⟪u, fderiv ℝ g q u'⟫)`. (Bou-Rabee and Sanz-Serna 2018, Theorem 4.1
and Proposition 2.1; proved here.)

**Checks.**

- `E = ℝ`, `g = id`: the derivative is the matrix with rows `(1 − h²/2, h)` and
  `(−h + h³/4, 1 − h²/2)`, of determinant `1` (Bou-Rabee and Sanz-Serna 2018, Example 3.3). The
  explicit Euler step `(q + h p, p − h q)` has determinant `1 + h²`.
- `E = ℝ²`, `g (q₁, q₂) = (−q₂, q₁)`, `h = 1`, `u = ((1, 0), 0)`, `v = ((0, 1), 0)`: the determinant
  is `1`, the form of `u`, `v` is `0`, and the form of their images is `9/4`. Symmetry of the
  derivative of `g` cannot be dropped.

*Needs:* Mathlib `ContDiffAt.isSymmSndFDerivAt` (for the last sentence of the second bullet).

### 2.3 Quadratic potentials

For a continuous linear `A : E →L[ℝ] E` define
`quadraticModifiedEnergy A h (q, p) = ‖p‖²/2 + ⟪q, A q⟫/2 − h²/8 · ‖A q‖²`
(`quadraticModifiedEnergy`). Prove: if `A` is symmetric (`⟪A u, v⟫ = ⟪u, A v⟫`), then for every
real `h` and every `z`,
`quadraticModifiedEnergy A h (leapfrog A h z) = quadraticModifiedEnergy A h z`
(`quadraticModifiedEnergy_leapfrog`). Consequently, with `U q = ⟪q, A q⟫/2` and
`(q', p') = leapfrog A h (q, p)`, the energy changes by
`H (q', p') − H (q, p) = h²/8 · (‖A q'‖² − ‖A q‖²)`: the leapfrog map does not conserve `H`.
(For `E = ℝ` and `A = 1` this is the invariant ellipse (4.10) of Bou-Rabee and Sanz-Serna 2018,
Proposition 4.1, stated there for stable step sizes; proved here for all `h` and `A`.)

**Checks.**

- `E = ℝ`, `A = 1`, `h = 1`, `z = (1, 0)`: `Ψ z = (1/2, −3/4)`; `H` goes from `1/2` to `13/32`,
  and the modified energy `p²/2 + 3q²/8` is `3/8` at both points.
- `E = ℝ`, `A = 1`, `h = 2`: the modified energy is `p²/2`, and from `(0, 1)` the iterates are
  `(2, −1)`, `(−4, 1)`, `(6, −1)`: the momentum stays of modulus `1` while the position grows
  linearly.
- `E = ℝ²`, `A (q₁, q₂) = (−q₂, q₁)`, `h = 1/2`, `z = ((1, 0), 0)`: the modified energy is `−1/32`
  at `z` and `3/32` at `Ψ z`. Symmetry of `A` cannot be dropped.

*Needs:* none beyond Mathlib's inner product spaces.

### Examples

The harmonic oscillator `g = id` on `ℝ`, for which every statement of this layer is a computation
with a `2 × 2` matrix; the rotation field on `ℝ²` as a drift that is not a gradient.

### Dependencies

Layer 2 uses MathematicalStatisticsFoundations 9.4 for the one-step facts in 2.1, and Mathlib.

## Layer 3: Hamiltonian flow and the accuracy of the leapfrog map

### 3.1 Hamilton's equations

Define `hamiltonian U (q, p) = U q + ‖p‖²/2` and `hamiltonianField g (q, p) = (p, −g q)`
(`hamiltonian`, `hamiltonianField`). A solution of Hamilton's equations is a curve
`γ : ℝ → E × E` with `HasDerivAt γ (hamiltonianField g (γ t)) t` for every `t`. If `g` is
`K`-Lipschitz then `hamiltonianField g` is `max 1 K`-Lipschitz, and if the field is `K`-Lipschitz
so is `g`. For complete `E` and a Lipschitz field with Lipschitz proof `hv`, the flow is
`Φ t z = ODE.globalSolution (hamiltonianField g) hv z t`, the unique solution through `z`. Prove:

- if `U` has gradient `g`, then `hamiltonian U (γ t) = hamiltonian U (γ 0)` for every solution `γ`
  and every `t` (`hamiltonian_eq_of_hasDerivAt`);
- `Φ t (S z) = S (Φ (−t) z)` (`globalSolution_hamiltonianField_momentumFlip`); with the flow law it
  follows that `S ∘ Φ t` is an involution.

(Bou-Rabee and Sanz-Serna 2018, Theorems 2.2 and 2.4 with Proposition 2.6; Neal 2011,
Section 2.2.)

**Checks.**

- `E = ℝ`, `g = id`: `Φ t (q, p) = (q cos t + p sin t, −q sin t + p cos t)`, and `q² + p²` is
  constant. With the field `(p, +q)` the curve `(cosh t, sinh t)` has `q² + p² = cosh 2t`.
- `g = 0`: the field is `1`-Lipschitz, not `0`-Lipschitz, and `Φ t (q, p) = (q + t p, p)`.

*Needs:* Tau Ceti `ODE.globalSolution`, `ODE.hasDerivAt_globalSolution`, `ODE.eq_globalSolution`,
`ODE.globalSolution_add`.

### 3.2 Local error

Let `U` have gradient `g`, let `g` be `L`-Lipschitz, let `m ≤ U x` for all `x`, let `γ` be a
solution of Hamilton's equations, and put `V = √(2 (H (γ 0) − m))`. For `ε ≥ 0` prove

- `‖(γ ε).1 − (leapfrog g ε (γ 0)).1‖ ≤ L V ε³ / 6` (`norm_fst_sub_leapfrog_le`);
- if moreover `g` has derivative `g' x` at every `x` and `g'` is `M`-Lipschitz for the operator
  norm, `‖(γ ε).2 − (leapfrog g ε (γ 0)).2‖ ≤ (M V² + L √L V) ε³ / 12 + L² V ε⁴ / 12`
  (`norm_snd_sub_leapfrog_le`).

Along `γ` the energy is constant (3.1), so `‖p‖ ≤ V`, and `‖g q‖² ≤ 2 L (U q − m) ≤ L V²` by the
quadratic upper bound of `U` at `q`. Writing `γ t = (q t, p t)`: the position error is
`∫ (ε − s) (g (q 0) − g (q s))` over `[0, ε]` with `‖g (q s) − g (q 0)‖ ≤ L V s`; the momentum error
is the error of the trapezoid rule for `s ↦ g (q s)`, whose derivative `g' (q s) (p s)` is
`(M V² + L √L V)`-Lipschitz, plus `(ε/2) (g (q ε) − g q')` with `q'` the position after the step.
`E` need not be complete: the integrals are taken in its completion, in which `γ` is still
differentiable.
(The order is that of Bou-Rabee and Sanz-Serna 2018, (3.13) and (3.14); the constants are proved
here.)

**Checks.**

- `E = ℝ`, `U q = q²/2` (`L = 1`, `M = 0`, `m = 0`). From `(0, 1)`: `V = 1`, the position error is
  `ε − sin ε`, which is `ε³/6` to leading order: the constant `1/6` is attained. From `(1, 0)`:
  the momentum error is `|sin ε − ε + ε³/4|`, which is `ε³/12` to leading order, the constant of
  the bound; at `ε = 1/2` it is `0.01068`, and the bound is `0.01563`.
- `g` constant: `L = 0`, both bounds are `0`, and the leapfrog step is exact.
- With `‖(γ 0).2‖` in place of `V` the first bound would be `0` from `(1, 0)`, where the position
  error is `cos ε − 1 + ε²/2 > 0`.

*Needs:* 2.1 (the definition), 3.1; Mathlib `intervalIntegral.integral_eq_sub_of_hasDerivAt`.

### 3.3 Global error

Under all hypotheses of 3.2 (both bullets), for `ε ≥ 0` and `n : ℕ`, with
`B = ε²/12 · (3 L V + M V²/√L + L √L V ε) · (exp (√L n ε) − 1)`, prove
(`leapfrog_iterate_error_le`)

    √L ‖(γ (n ε)).1 − ((leapfrog g ε)^[n] (γ 0)).1‖ ≤ B,
    ‖(γ (n ε)).2 − ((leapfrog g ε)^[n] (γ 0)).2‖ ≤ √(1 + L ε²/4) · B.

For `L = 0` both sides vanish (with `x / 0 = 0`), the step being exact. For `L > 0` put
`θ = ε √L`, `s = √(1 + θ²/4)`, and let `a_k`, `b_k` be `√L` times the position error and the
momentum error after `k` steps. Comparing `Ψ` at the numerical point and at `γ (k ε)` uses only
the Lipschitz bound of `g` and gives `a' ≤ (1 + θ²/2) a + θ b` and
`b' ≤ θ (1 + θ²/4) a + (1 + θ²/2) b`; the local errors at `γ (k ε)` are bounded by 3.2 with the
same `V`, because the energy is constant along `γ`. Hence `c_k = max a_k (b_k / s)` satisfies
`c_{k+1} ≤ ρ c_k + τ` with `ρ = 1 + θ²/2 + θ s`, and `ρ ≤ exp θ`, `ρ − 1 ≥ θ`. From it,
`|H ((leapfrog g ε)^[n] (γ 0)) − H (γ 0)| ≤ V (1 + s) B + (1 + s²) B²/2`: on a fixed time interval
the position, momentum and energy errors are of order `ε²`. (Convergence of order two is
Bou-Rabee and Sanz-Serna 2018, Theorem 3.1, without constants; proved here.)

**Checks.**

- `n = 0`: both sides are `0`. `n = 1`: `B ≥ ε²/12 · 3 L V · ε √L`, which exceeds `√L` times the
  bound of 3.2.
- `E = ℝ`, `U q = q²/2`, from `(1, 0)`, `ε = 1/10`, `n = 10`: the errors are `0.00035` in position
  and `0.00083` in momentum, and `B = 0.00444`.
- The bound is not uniform in time: it grows like `exp (√L n ε)`.

*Needs:* 3.2.

### 3.4 Liouville's theorem

Let `E` be finite-dimensional and `hamiltonianField g` Lipschitz, with no other hypothesis on `g`.
Prove that for every `t` the map `Φ t` preserves `volume` on `E × E`
(`measurePreserving_globalSolution_hamiltonianField`). Consequently, if `U` has gradient `g`, the
measure with density `exp (−H)` against `volume` is invariant under `Φ t` and under `S ∘ Φ t`.

A route that needs no derivative of the flow: for a Lipschitz `g` and fixed `t`, the maps
`(leapfrog g (t/n))^[n]` converge pointwise to `Φ t` as `n → ∞` and send bounded sets into sets
bounded uniformly in `n` (consistency of order one and the discrete Grönwall inequality), and so
do their inverses `S ∘ (leapfrog g (t/n))^[n] ∘ S`; each preserves `volume` by 2.1. For a
compactly supported continuous `f`, dominated convergence gives `∫ f ∘ Φ t = ∫ f`, and two regular
measures with the same integrals of such functions are equal. (Bou-Rabee and Sanz-Serna 2018,
Proposition 2.1 with Theorem 2.1, and Theorem 2.3, for smooth Hamiltonians; Neal 2011,
Section 2.2. Proved here.)

**Checks.**

- `E = ℝ`, `g = id`: `Φ t` is a rotation. `g = 0`: `Φ t` is the shear `(q + t p, p)`.
- The damped field `(p, −c p)` on `ℝ × ℝ` has flow `(q + (1 − exp (−c t)) p / c, exp (−c t) p)`,
  of determinant `exp (−c t)`: it is not of the form `hamiltonianField g`.

*Needs:* 2.1, 3.1; Tau Ceti `ODE.dist_globalSolution_le`, `ODE.continuous_globalSolution`; Mathlib
`discrete_gronwall`, `MeasureTheory.Measure.ext_of_integral_eq_on_compactlySupported`.

### Examples

The harmonic oscillator, with exact solution a rotation; the pendulum `U q = −cos q`, for which
`L = M = 1` and `m = −1` in 3.2 and 3.3.

### Dependencies

Layer 3 uses Layer 2 (the map in 3.2 and 3.3, and 2.1 in 3.4), Tau Ceti's global solutions of
Lipschitz differential equations, and Mathlib.

## Layer 4: Hamiltonian Monte Carlo

From here on `E` is finite-dimensional with its Borel σ-algebra.

### 4.1 The kernel and its reversibility

Define `targetMeasure U = volume.withDensity (fun x ↦ ENNReal.ofReal (exp (−U x)))`
(`targetMeasure`), and, with `f = momentumFlip ∘ (leapfrog g h)^[n]`,

    hmcKernel U g h n = auxKernel (stdGaussian E) (involutiveKernel f a),
    a z = ENNReal.ofReal (min 1 (exp (hamiltonian U z − hamiltonian U (f z))))

(`hmcKernel`). From `q` it draws `p` from `γ`, runs `n` leapfrog steps from `(q, p)` to
`(q', p')`, and moves to `q'` with probability `min 1 (exp (H (q, p) − H (q', p')))`, staying at
`q` otherwise. Prove:

- for measurable `g`, `hmcKernel U g h n` is a Markov kernel;
- for measurable `U` and measurable `g`, every `h : ℝ` and every `n : ℕ`,
  `hmcKernel U g h n` is reversible with respect to `targetMeasure U`
  (`hmcKernel_isReversible`), hence leaves it invariant. Neither `g = ∇U` nor finiteness of
  `targetMeasure U` is assumed; reversibility passes to every multiple of the measure by a
  positive finite constant, in particular to the normalized target when its mass is finite.

By the density of `γ`, `(targetMeasure U).prod γ` is `(2π)^(−d/2) • volume` with density
`exp (−H)` on `E × E`; `f` is a measurable involution preserving `volume` (2.1); the Jacobian form
of 1.3 with `j = 1` gives reversibility on `E × E`, and 1.4 passes to `E`. (Neal 2011,
Section 3.2: the acceptance rule (3.6) and the proof of detailed balance, (3.7) to (3.12);
Bou-Rabee and Sanz-Serna 2018, Algorithm 5.3, Theorem 5.2 and (5.9).)

**Checks.**

- `E = ℝ`, `U q = q²/2`, `g = id`, `n = 1`: started from the standard Gaussian law, the
  probability of acceptance is `1 − (2/π) arctan (h³/8)`; it is `0.92083` at `h = 1` and `1/2` at
  `h = 2`. (By 2.3 the energy error is `h²/8 · (q'² − q²)`, a quadratic form in `(q, p)` of
  determinant `−h⁶/64` and trace `h⁶/32`.)
- With the exponent `H (f z) − H z` in place of `H z − H (f z)`, in the same example with `h = 1`,
  one step from the standard Gaussian law gives `E q² = 1.3909` instead of `1`.
- `E = ℝ`, `U q = (q² − 1)²`, `g q = sin 3q + 1/2`, which is not `U'`, `h = 1/10`, `n = 3`: for
  `φ q = exp (−(q − 0.4)²)` and `ψ q = 1/(1 + (q + 0.7)²)` the flows `∫ φ · (hmcKernel ψ)` and
  `∫ ψ · (hmcKernel φ)` against the target agree to seven digits (`1.0351839`), with mean
  acceptance `0.751`.
- `n = 0` or `h = 0`: the kernel is `Kernel.id`.

*Needs:* 1.1, 1.3, 1.4, 2.1; Tau Ceti `TauCeti.Probability.stdGaussian_eq_withDensity_norm`;
Mathlib `MeasureTheory.prod_withDensity`, `Kernel.IsMarkovKernel.map`.

### 4.2 Exact Hamiltonian Monte Carlo

For a Lipschitz `hamiltonianField g` with Lipschitz proof `hv` and `t : ℝ` define

    exactHmcKernel g hv t = auxKernel (stdGaussian E) (Kernel.id.map (fun z ↦ Φ t z))

(`exactHmcKernel`): from `q` it draws `p` from `γ` and moves to the position of `Φ t (q, p)`. It
is a Markov kernel and does not depend on the Lipschitz constant. Prove: if `U` has gradient `g`,
then `exactHmcKernel g hv t` is reversible with respect to `targetMeasure U`
(`exactHmcKernel_isReversible`). The kernel is unchanged when `Φ t` is replaced by `S ∘ Φ t`,
which is a measurable involution (3.1) preserving `volume` (3.4) and `H` (3.1); 1.3 with
acceptance `1` and 1.4 conclude. (Bou-Rabee and Sanz-Serna 2018, Algorithm 5.2 and Theorem 5.1,
for invariance; reversibility is proved here.)

**Checks.**

- `E = ℝ`, `U q = q²/2`: at `t = π/2`, `Φ t (q, p) = (p, −q)` and the kernel is `γ` from every
  point, independent sampling from the target; at `t = π` it is `δ_{−q}`; at `t = 2π` it is
  `Kernel.id`.
- `U = 0`: the kernel from `q` is the Gaussian law of mean `q` and variance `t²`, reversible with
  respect to Lebesgue measure, an infinite target.
- The kernel of `U q = q²/2` at `t = π/2` does not leave `targetMeasure (fun q ↦ q²)` invariant.

*Needs:* 1.1, 1.3, 1.4, 3.1, 3.4; Tau Ceti `ODE.globalSolution_congr`,
`ODE.continuous_globalSolution`, `TauCeti.Probability.stdGaussian_eq_withDensity_norm`; Mathlib
`MeasureTheory.prod_withDensity`.

### Examples

The standard Gaussian target on `ℝ`, with the closed forms of the Checks of 4.1 and 4.2.

### Dependencies

Layer 4 uses 1.1, 1.3 and 1.4, 2.1, 3.1 and 3.4, Tau Ceti's density of the standard Gaussian law
and its global solutions, and Mathlib.

## Layer 5: Langevin algorithms

### 5.1 The unadjusted Langevin kernel

Define

    ulaKernel g h = (Kernel.id ×ₖ Kernel.const E (stdGaussian E)).map (fun z ↦ z.1 − h • g z.1 + √(2 h) • z.2)

(`ulaKernel`), the kernel of the recursion `x' = x − h g x + √(2h) ξ` with `ξ` standard Gaussian.
It is s-finite for every `g` (`isSFiniteKernel_ulaKernel`). Prove, for measurable `g`:

- `ulaKernel g h x` is the image of `γ` under `ξ ↦ x − h • g x + √(2 h) • ξ`, and the kernel is
  Markov;
- for `h > 0`, `ulaKernel g h x` has density `y ↦ exp (−‖y − x + h • g x‖² / (4 h))` against
  `(4 π h)^(−d/2) • volume` (Durmus and Moulines 2019, equation (4));
- for a probability measure `μ`, `ulaKernel g h ∘ₘ μ` is the convolution of `μ.map (fun x ↦ x − h • g x)` with the image of `γ`
  under `ξ ↦ √(2 h) • ξ`.

**Checks.**

- `g = 0`, `h = 1/2`: the kernel from `x` is the Gaussian law of mean `x` and identity covariance.
  With `√h` in place of `√(2h)` the covariance would be half the identity.
- `E = ℝ`, `g = id`, `h = 1`: the kernel is the centred Gaussian law of variance `2` from every
  point.
- `h ≤ 0`: `√(2h) = 0` and the kernel is `δ_{x − h g x}`. For a non-measurable `g` and `h ≠ 0`
  the kernel is `0`; for `h = 0` it is `Kernel.id` whatever `g` is.

*Needs:* Mathlib `stdGaussian`, `Kernel.map`, `Kernel.IsMarkovKernel.map`,
`MeasureTheory.Measure.map_addHaar_smul`; Tau Ceti
`TauCeti.Probability.stdGaussian_eq_withDensity_norm`.

### 5.2 Contraction of one step

Let `U` have gradient `g`, let `U` be `m`-strongly convex for a real `m`, let `g` be
`L`-Lipschitz, and let `0 ≤ h` with `h (m + L) ≤ 2`. Prove:

- `‖(x − h • g x) − (y − h • g y)‖ ≤ (1 − h m) ‖x − y‖` for all `x`, `y`;
- for all probability measures `μ`, `ν` on `E`,
  `W₂ (ulaKernel g h ∘ₘ μ) (ulaKernel g h ∘ₘ ν) ≤ ENNReal.ofReal (1 − h m) * W₂ μ ν`
  (`wassersteinEDist_ulaKernel_le`). No moment is assumed, and `m` may be zero or negative.

For the first bullet, `φ = U − (m/2) ‖·‖²` is convex with gradient `g − m • id`, and
`φ y ≤ φ x + ⟪∇φ x, y − x⟫ + (L − m)/2 ‖y − x‖²`, so its gradient is cocoercive:
`‖e'‖² ≤ (L − m) ⟪e', δ⟫` for `δ = x − y`, `e' = ∇φ x − ∇φ y`. The claim is equivalent to
`h ‖e'‖² ≤ 2 (1 − h m) ⟪e', δ⟫`, which follows since `h (L − m) ≤ 2 (1 − h m)`. If `m > L` then
`E` is trivial. The second bullet follows from 5.1: pushing forward by a `K`-Lipschitz map
multiplies `W₂` by at most `K`, and convolution with a probability measure does not increase it.
(Dalalyan 2017b, Lemma 1, case `h ≤ 2/(m + M)`, for `m > 0`. Durmus and Moulines 2019,
Proposition 3 (i), has the weaker factor `(1 − 2 m L h/(m + L))^(1/2)`. Proved here.)

**Checks.**

- `U x = (x₁² + 4 x₂²)/2` on `ℝ²`, `m = 1`, `L = 4`, `h = 2/5`: the gradient step multiplies the
  coordinates by `3/5` and `−3/5`, and `1 − h m = 3/5`. At `h = 1/2` the second factor is `−1`,
  larger in modulus than `1 − h m = 1/2`: the condition `h (m + L) ≤ 2` cannot be dropped.
- `U x = −x²/2` on `ℝ`, `m = −1`, `L = 1`: the condition holds for every `h ≥ 0`, and the step
  multiplies by `1 + h = 1 − h m`.
- `U x = m x²/2`, `L = m`, `h = 1/m`, `μ = δ_0` and `ν = 2 • δ_0`: the right side is `0 · ∞ = 0`
  and the left side is `∞`, as measures of different mass have no coupling. The measures must be
  probability measures.

*Needs:* 5.1; Tau Ceti `StrongConvexOn.add_add_le_of_hasFDerivWithinAt`,
`TauCeti.wassersteinEDist_map_le_mul`, `TauCeti.wassersteinEDist_conv_right_le`; Mathlib
`strongConvexOn_iff_convex`, `intervalIntegral.integral_eq_sub_of_hasDerivAt`.

### 5.3 The invariant law

Under the hypotheses of 5.2 with `m > 0` and `h > 0`, prove:

- there is exactly one probability measure `π_h` on `E` invariant under `ulaKernel g h`, among all
  probability measures (`existsUnique_invariant_ulaKernel`); it has a finite second moment;
- for every `c : E`, `∫ ⟪x − c, g x⟫ ∂π_h = d + (h/2) ∫ ‖g x‖² ∂π_h`;
- if `g x₀ = 0`, then `∫ ‖x − x₀‖² ∂π_h ≤ d (m + L) / (m L)`
  (`integral_norm_sub_sq_le_of_invariant_ulaKernel`, stated for an invariant probability
  measure).

Existence is Banach's fixed point theorem in the complete space of probability measures with
finite second moment, on which the kernel acts as a contraction with factor `1 − h m < 1` by 5.2.
For uniqueness among all probability measures, two chains driven by the same Gaussian variables
satisfy `‖x_k − y_k‖ ≤ (1 − h m)^k ‖x_0 − y_0‖`, so two invariant laws give the same integral to
every bounded Lipschitz function. The identity of the second bullet is
`∫ ‖x' − c‖² = ∫ ‖x − c‖²` expanded, with `∫ ‖ξ‖² ∂γ = d`. The third bullet combines it with
`(L + m) ⟪g x, x − x₀⟫ ≥ ‖g x‖² + m L ‖x − x₀‖²`, a form of the cocoercivity of 5.2, and
`h (m + L) ≤ 2`. (Durmus and Moulines 2019, Proposition 2 (ii), where the bound is `2 d κ⁻¹` with
`κ = 2 m L/(m + L)`.)

**Checks.**

- `U x = (m/2) ‖x − c‖²` (`L = m`), `0 < h ≤ 1/m`: `π_h` is the Gaussian law of mean `c` and
  covariance `(m (1 − h m/2))⁻¹` times the identity, since `v = (1 − h m)² v + 2 h`. The target has
  covariance `m⁻¹`: the invariant law is biased, with
  `W₂ π_h π = √d (1/√(m (1 − h m/2)) − 1/√m)`. For `m = 1`, `h = 1/2` the variance is `4/3`. The
  second moment `d/(m (1 − h m/2))` is at most `2d/m = d (m + L)/(m L)`, with equality at
  `h = 1/m`, and the identity of the second bullet reads `m v = 1 + (h/2) m² v` in dimension `1`.
- `h = 0`: the kernel is `Kernel.id` and every probability measure is invariant. `U = 0`
  (`m = 0`): the kernel is a Gaussian random walk, which has no invariant probability measure.
- `U x = (x₁² + 4 x₂²)/2`, `h = 1/2`: the second coordinate follows `x' = −x + ξ`, whose variance
  grows by `1` at each step; there is no invariant probability measure.

*Needs:* 5.1, 5.2; Tau Ceti `TauCeti.WassersteinSpace.completeSpace`,
`TauCeti.Probability.stdGaussian_map_norm_sq`,
`TauCeti.Probability.integral_id_chiSquaredMeasure`; Mathlib
`ContractingWith.exists_fixedPoint`,
`MeasureTheory.ext_of_forall_integral_eq_of_IsFiniteMeasure`, `integral_id_stdGaussian`.

### 5.4 Convergence and the one-step defect

Under the hypotheses of 5.2 with `m > 0` (and `h ≥ 0`), for all probability measures `μ`, `ν` on
`E` and every `k : ℕ`, prove (`wassersteinEDist_ulaKernel_pow_le`)

    W₂ ((ulaKernel g h ^ k) ∘ₘ μ) ν ≤ ofReal ((1 − h m)^k) * W₂ μ ν
        + ofReal ((1 − (1 − h m)^k) / (h m)) * W₂ (ulaKernel g h ∘ₘ ν) ν.

It follows by induction from 5.2 and the triangle inequality. Two consequences, for `h > 0`:

- with `ν = π_h`: `W₂ ((ulaKernel g h ^ k) ∘ₘ μ) π_h ≤ ofReal ((1 − h m)^k) * W₂ μ π_h`;
- with `μ = π_h` and `k → ∞`: `W₂ π_h ν ≤ ofReal (1 / (h m)) * W₂ (ulaKernel g h ∘ₘ ν) ν` for
  every probability measure `ν` with finite second moment: the bias of the invariant law against
  `ν` is controlled by the one-step defect of `ν`.

This is the discrete part of the proof of Dalalyan 2017b, Theorem 1 (a), which reads
`W₂ ν_K π ≤ (1 − m h)^K W₂ ν_0 π + 1.82 (M/m) (h p)^(1/2)` in dimension `p` for `h ≤ 2/(m + M)`:
the second term is `(h m)⁻¹` times `1.82 M (h³ p)^(1/2)`, which bounds the one-step defect of the
normalized target: his Lemma 3 gives `(h⁴ M³ p / 3)^(1/2) + M (h³ p)^(1/2)`, at most that for
`h ≤ 2/M`. That bound is obtained by comparing with a stationary Langevin diffusion and is not a
target here.

**Checks.**

- `E = ℝ`, `U x = x²/2`, `h = 3/10`, `μ` Gaussian of mean `3` and variance `1/5`, `ν` standard
  Gaussian: all laws are Gaussian, `W₂` between Gaussian laws on `ℝ` is the Euclidean distance of
  the pairs (mean, standard deviation), and the inequality holds for `k = 0, …, 40`. The bias
  `W₂ π_h ν = 0.0847` is below `W₂ (ulaKernel g h ∘ₘ ν) ν / (h m) = 0.1468`.
- `k = 0`: both sides are `W₂ μ ν`.
- `U = 0`, `m = 0`, `h > 0`, `μ = ν = δ_0`: the left side is `√(2 h k d)` and the right side, with
  `0/0 = 0`, is `0`. Positivity of `m` cannot be dropped.

*Needs:* 5.2, 5.3 (for the two consequences); Tau Ceti `TauCeti.wassersteinEDist_triangle`.

### 5.5 The Metropolis-adjusted Langevin algorithm

Define

    malaKernel U g h = mhKernel (ulaKernel g h) (mhAcceptance p q),
    p x = ofReal (exp (−U x)),  q x y = ofReal (exp (−‖y − x + h • g x‖² / (4 h)))

(`malaKernel`). It is a Markov kernel for measurable `g`. Prove, for measurable `U` and `g`:

- for `h ≥ 0`, `malaKernel U g h` is reversible with respect to `targetMeasure U`
  (`malaKernel_isReversible`). For `h > 0` this is 1.2 with the reference measure
  `(4 π h)^(−d/2) • volume` and the density of 5.1; for `h = 0` the kernel is `Kernel.id`.
- for every real `ε`, `hmcKernel U g ε 1 = malaKernel U g (ε²/2)`
  (`hmcKernel_one_eq_malaKernel`): with `q' = q + ε p − (ε²/2) g q` and `p'` the momentum after one
  leapfrog step, `q' − q + (ε²/2) g q = ε p` and `q − q' + (ε²/2) g q' = −ε p'`, so the two
  acceptance probabilities agree.

(Neal 2011, Section 5.2, equations (5.12) to (5.15).)

**Checks.**

- `E = ℝ`, `U x = x²/2`, `g = id`, `h = 1`: the proposal is the centred Gaussian law of variance
  `2` whatever `x`, and the acceptance is `min 1 (exp ((x² − y²)/4))`.
- `E = ℝ`, `U = 0`, `g = id`, `h = 1`: the flow density `q x y · a x y` is
  `min (exp (−y²/4)) (exp (−x²/4))`, symmetric. With `2h` in place of `4h` in `q` the acceptance
  is `min 1 (exp ((y² − x²)/2))` and the flow densities at `(0, 1)` and `(1, 0)` are `0.7788` and
  `0.6065`.
- `h < 0`, `g = id`: the proposal is `δ_{(1 − h) x}`, which is accepted with positive probability
  and never reversed; `h ≥ 0` cannot be dropped.

*Needs:* 1.1, 1.2, 4.1 (second bullet), 5.1.

### Examples

Gaussian targets `U x = (m/2) ‖x − c‖²`, for which the kernels of 5.1 to 5.4 and their invariant
laws are Gaussian with the closed forms of the Checks.

### Dependencies

5.1 to 5.4 use Tau Ceti's Wasserstein distance (pushforward, convolution, triangle inequality,
completeness), its first-order inequality for strongly convex functions, its Gaussian density and
chi-squared moment, and Mathlib; they use no other layer. 5.5 uses 1.1, 1.2, 4.1 and 5.1.

## Downstream consumers

Quantitative comparisons of the unadjusted algorithm with the Langevin diffusion enter through the
one-step defect of 5.4. Samplers built from other volume-preserving involutions (for instance
with a different integrator) are instances of 1.3 and 1.4.

## Scope and ownership

This roadmap owns:

- the Metropolis–Hastings kernel on a measurable space, its reversibility criteria, the kernel of
  an involutive proposal, and the auxiliary variable construction (Layer 1);
- the iterates, Jacobian and symplecticity of the leapfrog map, its modified energy for quadratic
  potentials, and its local and global errors against Hamilton's equations with explicit
  constants (2.1 to 2.3, 3.2, 3.3);
- conservation of energy, time reversal and Liouville's theorem for the flow of
  `hamiltonianField g` with a Lipschitz `g` on a flat phase space (3.1, 3.4);
- the Hamiltonian Monte Carlo kernels and their reversibility (Layer 4);
- the unadjusted and Metropolis-adjusted Langevin kernels, the Wasserstein contraction, the
  invariant law and its second moment, and the one-step defect inequality (Layer 5).

It does not own, and consumes as stated under Exact supplier contracts:

- the leapfrog step and the momentum flip themselves, with the one-step involution identity,
  injectivity and preservation of Lebesgue measure, and the Metropolis–Hastings kernel on a finite
  space: [MathematicalStatisticsFoundations](../MathematicalStatisticsFoundations/README.md) 9.4.
  The maps are declared in `Suggested.lean` only so that the statements above can be written;
- invariance from reversibility, which is Mathlib's `Kernel.IsReversible.invariant`;
- global solutions of Lipschitz differential equations and the Wasserstein distance, which are in
  the pinned Tau Ceti.

Out of scope:

- the overdamped Langevin diffusion `dX = −∇U(X) dt + √2 dB`: strong solutions are
  [StochasticCalculus](../StochasticCalculus/README.md) 9.1, its Markov kernels and generators
  10.1 and 10.2; the Fokker–Planck semigroup with drift `−∇V`, its contraction
  `W₂ (μ_t, ν_t) ≤ exp (−λ t) W₂ (μ_0, ν_0)` and the invariance of the law with density
  proportional to `exp (−V)` are [OptimalTransport](../OptimalTransport/README.md) 11.9. No roadmap
  identifies the law of the solution of the stochastic differential equation with that semigroup,
  so no statement here rests on the diffusion. In particular the bound of Dalalyan (2017b,
  Lemma 3) for the one-step defect of the target, and with it the explicit bias bounds of Dalalyan
  (2017b, Theorem 1) and Durmus and Moulines (2019, Theorem 5 and Corollary 7), are not targets;
  5.4 is the part of their proofs that does not use the diffusion. Convergence in relative entropy
  under a logarithmic Sobolev inequality is out of scope for the same reason;
- total variation guarantees for the unadjusted algorithm, underdamped (kinetic) Langevin
  dynamics, stochastic gradients, and Riemannian-manifold Hamiltonian Monte Carlo;
- ergodicity of the Metropolized kernels: irreducibility, Harris recurrence and geometric
  ergodicity on general state spaces, which
  [MarkovChainsAndRenewal](../MarkovChainsAndRenewal/README.md) excludes as well, optimal scaling
  of step sizes, the No-U-Turn sampler and adaptive tuning;
- a general theory of numerical integrators (order conditions, stability, Runge–Kutta methods,
  backward error analysis beyond 2.3), which is the subject of a separate roadmap on one-step
  methods for ordinary differential equations; and Hamiltonian mechanics on symplectic manifolds,
  which is [SymplecticGeometry](../SymplecticGeometry/README.md);
- convergence rates of gradient descent as an optimization method (a roadmap on first-order
  optimization); the contraction of the gradient step appears here only as the first bullet of
  5.2;
- quantitative mixing of finite chains, and score-based generative sampling
  ([DenoisingDiffusion](../DenoisingDiffusion/README.md)), from which nothing is consumed.

## Exact supplier contracts

### From Mathlib

- `Kernel.Invariant`, `Kernel.IsReversible` and `Kernel.IsReversible.invariant`
  (`Mathlib/Probability/Kernel/Invariance.lean`): `κ.IsReversible π` says
  `∫⁻ x in A, κ x B ∂π = ∫⁻ x in B, κ x A ∂π` for measurable `A`, `B`; a reversible Markov kernel
  leaves `π` invariant.
- `Kernel.withDensity`, `Kernel.withDensity_apply'`, `Kernel.withDensity_of_not_measurable`
  (`Mathlib/Probability/Kernel/WithDensity.lean`): for an s-finite kernel and a jointly measurable
  `f`, `withDensity κ f a s = ∫⁻ b in s, f a b ∂κ a`; for other `f` the kernel is `0`.
- `Kernel.map` and `Kernel.IsMarkovKernel.map`
  (`Mathlib/Probability/Kernel/Composition/MapComap.lean`):
  the image kernel, equal to `0` for a non-measurable map and Markov for a measurable map of a
  Markov kernel.
- `MeasureTheory.lintegral_prod` (`Mathlib/MeasureTheory/Measure/Prod.lean`): Tonelli's theorem
  for an almost everywhere measurable function, with the second measure s-finite.
- `MeasureTheory.withDensity_eq_iff_of_sigmaFinite`
  (`Mathlib/MeasureTheory/Function/AEEqOfLIntegral.lean`): for σ-finite `μ` and almost everywhere
  measurable `f`, `g`, `μ.withDensity f = μ.withDensity g` if and only if `f = g` almost
  everywhere.
- `MeasureTheory.prod_withDensity` (`Mathlib/MeasureTheory/Measure/WithDensity.lean`): the product
  of two measures with measurable densities, the second base measure s-finite.
- `MeasureTheory.lintegral_image_eq_lintegral_abs_det_fderiv_mul`
  (`Mathlib/MeasureTheory/Function/Jacobian.lean`): the change of variables formula for a map
  injective and differentiable on a measurable set.
- `MeasureTheory.MeasurePreserving.iterate` (`Mathlib/Dynamics/Ergodic/MeasurePreserving.lean`)
  and `LinearIsometryEquiv.measurePreserving`
  (`Mathlib/MeasureTheory/Measure/Haar/InnerProductSpace.lean`).
- `ContDiffAt.isSymmSndFDerivAt` (`Mathlib/Analysis/Calculus/FDeriv/Symmetric.lean`): the second
  derivative of a twice continuously differentiable real function is symmetric.
- `intervalIntegral.integral_eq_sub_of_hasDerivAt`
  (`Mathlib/MeasureTheory/Integral/IntervalIntegral/FundThmCalculus.lean`): the fundamental
  theorem of calculus for an interval-integrable derivative.
- `discrete_gronwall` (`Mathlib/Analysis/ODE/DiscreteGronwall.lean`): from
  `u (n+1) ≤ (1 + c n) u n + b n` with nonnegative data,
  `u n ≤ (u n₀ + ∑ b k) exp (∑ c i)`.
- `MeasureTheory.Measure.ext_of_integral_eq_on_compactlySupported`
  (`Mathlib/MeasureTheory/Integral/RieszMarkovKakutani/Real.lean`): two regular measures with the
  same integrals of compactly supported continuous functions are equal.
- `stdGaussian` and `integral_id_stdGaussian`
  (`Mathlib/Probability/Distributions/Gaussian/Multivariate.lean`): the standard Gaussian law of a
  finite-dimensional real inner product space, a probability measure of mean `0`.
- `MeasureTheory.Measure.map_addHaar_smul` (`Mathlib/MeasureTheory/Measure/Lebesgue/EqHaar.lean`):
  the image of a Haar measure under `x ↦ r • x`, `r ≠ 0`.
- `StrongConvexOn` and `strongConvexOn_iff_convex` (`Mathlib/Analysis/Convex/Strong.lean`):
  on an inner product space, `m`-strong convexity of `f` is convexity of `f − (m/2) ‖·‖²`.
- `ContractingWith.exists_fixedPoint` (`Mathlib/Topology/MetricSpace/Contracting.lean`).
- `MeasureTheory.ext_of_forall_integral_eq_of_IsFiniteMeasure`
  (`Mathlib/MeasureTheory/Measure/HasOuterApproxClosed.lean`): two finite Borel measures with the
  same integrals of bounded continuous functions are equal.

### From Tau Ceti

- `ODE.globalSolution v hv x : ℝ → E` for a `K`-Lipschitz `v` on a real Banach space
  (`TauCeti/Analysis/ODE/GlobalSolution.lean`), with `ODE.hasDerivAt_globalSolution` (it solves
  `γ' = v ∘ γ`, `γ 0 = x`), `ODE.eq_globalSolution` (uniqueness), `ODE.globalSolution_congr`
  (independence of the Lipschitz proof), `ODE.globalSolution_add` (flow law),
  `ODE.dist_globalSolution_le` (`dist ≤ dist x y * exp (K |t|)`) and
  `ODE.continuous_globalSolution` (joint continuity).
- `StrongConvexOn.add_add_le_of_hasFDerivWithinAt` (`TauCeti/Analysis/Convex/Strong.lean`):
  `f x + f' (y − x) + m/2 ‖y − x‖² ≤ f y` for `f` `m`-strongly convex on `s` with derivative `f'`
  within `s` at `x ∈ s`, `y ∈ s`.
- `TauCeti.Probability.stdGaussian_eq_withDensity_norm`
  (`TauCeti/Probability/Distributions/Gaussian/Density.lean`): `stdGaussian E` has density
  `(2π)^(−d/2) exp (−‖x‖²/2)` against `volume`.
- `TauCeti.Probability.stdGaussian_map_norm_sq`
  (`TauCeti/Probability/Distributions/Chi/Gaussian.lean`) and
  `TauCeti.Probability.integral_id_chiSquaredMeasure`
  (`TauCeti/Probability/Distributions/ChiSquared/Basic.lean`, for `0 ≤ k`): the squared norm of a
  standard Gaussian vector has the chi-squared law with `d` degrees of freedom, of mean `d`.
- `TauCeti.wassersteinEDist` and `TauCeti.wassersteinEDist_triangle`
  (`TauCeti/MeasureTheory/OptimalTransport/Wasserstein/Basic.lean`): the infimum over couplings of
  the `L^p` seminorm of the distance, `∞` when there is no coupling; the triangle inequality for
  `1 ≤ p`, a jointly measurable distance, a standard Borel space and a finite middle measure.
- `TauCeti.wassersteinEDist_map_le_mul`
  (`TauCeti/MeasureTheory/OptimalTransport/Wasserstein/Pushforward.lean`): for a measurable
  `K`-Lipschitz `f` and probability measures,
  `wassersteinEDist p (μ.map f) (ν.map f) ≤ K * wassersteinEDist p μ ν`.
- `TauCeti.wassersteinEDist_conv_right_le`
  (`TauCeti/MeasureTheory/OptimalTransport/Wasserstein/Convolution.lean`): for a distance
  invariant under right addition, σ-finite `μ` and a probability measure `η`,
  `wassersteinEDist p (μ ∗ η) (ν ∗ η) ≤ wassersteinEDist p μ ν`.
- `TauCeti.WassersteinSpace.completeSpace`
  (`TauCeti/MeasureTheory/OptimalTransport/Wasserstein/Complete.lean`): for `1 ≤ p < ∞` the space
  of probability measures with finite `p`-th moment over a complete separable metric space is
  complete for the Wasserstein distance.

### From TauCetiRoadmap.MathematicalStatisticsFoundations

Section 9.4: one leapfrog step with identity mass matrix for a gradient `g` and step `h`, and the
momentum flip `(x, p) ↦ (x, −p)`; the flip, the step, the flip and the step compose to the
identity; for measurable `g` the step preserves Lebesgue measure; the step is injective; and, on
a finite state space, the Metropolis–Hastings kernel with acceptance
`min 1 (π y q y x / (π x q x y))`, equal to `1` when `π x q x y = 0`.

## Provenance

No formalization of these samplers is known to the author. The repository
[lean4-mlir](https://github.com/brettkoonce/lean4-mlir) (BSD-3, by the author of this roadmap)
runs Metropolis single-spin-flip chains (`demos/MainNqsIsing.lean`) and trains on a Langevin chain
(`demos/MainDiffusion2d.lean`) as programs, and proves nothing about them.

## References

- N. Bou-Rabee and J. M. Sanz-Serna, *Geometric integrators and the Hamiltonian Monte Carlo
  method*, Acta Numer. **27** (2018), 113–206; read as arXiv:1711.05337v1, whose numbering is
  cited.
- A. S. Dalalyan, *Further and stronger analogy between sampling and optimization: Langevin Monte
  Carlo and gradient descent*, COLT 2017 (cited as Dalalyan 2017b); read as arXiv:1704.04752v2,
  whose numbering and constants are cited.
- A. Durmus and É. Moulines, *High-dimensional Bayesian inference via the unadjusted Langevin
  algorithm*, Bernoulli **25** (2019), 2854–2882; read as arXiv:1605.01559v4, whose numbering is
  cited.
- R. M. Neal, *MCMC using Hamiltonian dynamics*, in *Handbook of Markov chain Monte Carlo*,
  Chapman and Hall/CRC, 2011; read as arXiv:1206.1901v1.
- K. Neklyudov, M. Welling, E. Egorov and D. Vetrov, *Involutive MCMC: a unifying framework*,
  ICML 2020; read as arXiv:2006.16653v1.
- L. Tierney, *A note on Metropolis–Hastings kernels for general state spaces*, Ann. Appl. Probab.
  **8** (1998), 1–9; read as Technical Report 606, School of Statistics, University of Minnesota,
  1995, in which the results of Section 2 are not numbered.
