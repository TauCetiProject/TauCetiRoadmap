# Roadmap: the first Dirichlet eigenvalue and the Faber–Krahn inequality

**Summary.** This roadmap studies the first Dirichlet eigenvalue (principal frequency) of an
arbitrary open set `Ω` of a finite-dimensional real inner product space `E` of dimension `n`:
the infimum `λ₁(Ω)` of the Rayleigh quotients `∫ ‖∇φ‖² / ∫ φ²` over the nonzero smooth functions
`φ` with compact support in `Ω`. It takes values in `[0, ∞]`, is `∞` exactly for the empty set,
and needs no boundedness or regularity of `Ω`. On every nonempty open set of a Euclidean space
on which the Tau Ceti library constructs the first Dirichlet eigenvalue of `−Δ` on `H¹₀(Ω)` (a
coercive energy form, as on every bounded set of positive dimension), it is that eigenvalue, and
the roadmap proves this agreement first. Its headline theorems are:

- **Faber–Krahn.** For every open set `Ω` and every radius `r` with `vol(B(0, r)) = vol(Ω)`,
  `λ₁(B(0, r)) ≤ λ₁(Ω)`: among open sets of a given volume, balls have the least principal
  frequency. In dimension one this says `λ₁(Ω) ≥ (π/|Ω|)²` for every open subset of the line of
  finite length.
- **Cheeger's inequality.** For every open set, `λ₁(Ω) ≥ h(Ω)²/4`, where the Cheeger constant
  `h(Ω)` is the infimum of perimeter over volume among the measurable subsets of `Ω` of finite
  positive volume. With the isoperimetric inequality, `h(Ω) ≥ n (ω_n/|Ω|)^(1/n)`, with equality
  `h = n/R` on a ball of radius `R > 0`.
- **Hersch–Protter.** If `Ω` is open and convex and contains no ball of radius larger than `R`,
  then `λ₁(Ω) ≥ (π/(2R))²`, with equality for a slab of width `2R`.

Along the way it proves the structural laws: Lipschitz trial functions give the same infimum;
`λ₁` of the image of `Ω` under `x ↦ c + t L x` (an isometry `L`, `t ≠ 0`) is `λ₁(Ω)/t²`; the
first eigenvalue of a disjoint union of open sets is the infimum over the pieces; and that of a
product `Ω₁ × Ω₂` is `λ₁(Ω₁) + λ₁(Ω₂)`. With the interval value `(π/L)²` these give the boxes,
slabs and the vanishing of `λ₁` on the whole space.

The roadmap rests on the Tau Ceti library (the Dirichlet spectrum of `−Δ` on bounded sets and its
interval case, Schwarz rearrangement, perimeter, the sharp isoperimetric inequality and the
coarea formula) and on the [Isoperimetry](../Isoperimetry/README.md) roadmap for the
convex-integrand Pólya–Szegő estimate of its Layer 5. Layer 1 fixes the object and its two
comparisons, Layer 2 the structural laws, and Layer 3 the three isoperimetric lower bounds.

## Conventions

1. **Ambient space.** `E`, `F` are finite-dimensional real inner product spaces with Borel
   σ-algebras and Lebesgue measure `volume` (Mathlib's `measureSpaceOfInnerProductSpace`);
   `|A| = volume A`, `n = Module.finrank ℝ E` and `ω_n = vol(B(0, 1))`. Open sets are
   `TopologicalSpace.Opens E`. The product of `E` and `F` is the Euclidean product
   `WithLp 2 (E × F)`, whose volume is the product measure (Mathlib's
   `WithLp.volume_preserving_ofLp`).
2. **Rayleigh quotient.** For `u : E → ℝ`, `dirichletRayleigh u = (∫⁻ ‖fderiv ℝ u x‖ₑ²) /
   (∫⁻ ‖u x‖ₑ²)` in `[0, ∞]`. The derivative is Mathlib's `fderiv`, which is `0` where `u` is not
   differentiable; for Lipschitz `u` this is a null set (Rademacher), so the quotient uses the
   almost-everywhere gradient. Only nonzero continuous `u` enter, for which the denominator is
   positive.
3. **Principal frequency.** `principalFrequency Ω`, written `λ₁(Ω)`, is the infimum of
   `dirichletRayleigh φ` over nonzero test functions `φ ∈ 𝓓(Ω, ℝ)` (Mathlib's
   `TestFunction Ω ℝ ⊤`: smooth, compact support, `tsupport φ ⊆ Ω`). It is monotone:
   `Ω ⊆ Ω'` gives `λ₁(Ω') ≤ λ₁(Ω)`, since every test function of `Ω` is one of `Ω'`.
4. **Junk values.** `λ₁(∅) = ∞` (infimum over the empty set in `[0, ∞]`); `λ₁(Ω) < ∞` for
   nonempty `Ω` (a bump function). No statement uses a real-valued infimum. The Cheeger constant
   is `∞` when `Ω` has no measurable subset of finite positive volume, in particular for `Ω = ∅`.
   Sets of infinite volume are excluded from the Cheeger quotient, where `P(A)/|A|` would be the
   meaningless `0`.
5. **Perimeter** is Tau Ceti's `TauCeti.perimeter volume ⊤ A`, the total variation of the indicator
   of `A` in the whole space, finite or infinite.

## Layer 1: the first Dirichlet eigenvalue

### 1.1 The Rayleigh quotient and the principal frequency

Define `dirichletRayleigh` and `principalFrequency` as in Conventions 2–3.

**Checks.**
- `Ω = ∅`: the index set is empty and `λ₁(∅) = ∞`.
- The boundary condition matters. On the interval `(0, 1)` the infimum of the same quotient over
  all nonzero smooth functions on the closed interval is `0` (the constant `1`), while
  `λ₁((0, 1)) = π²` (Example of Layer 1); the trial function `x(1 − x)` has quotient
  `(1/3)/(1/30) = 10 ≥ π²`. It is not a test function of `(0, 1)`, since its support reaches the
  endpoints, but it lies in `H¹₀((0, 1))`, so 1.3 and the interval value bound its quotient below by
  `π²`.

*Needs:* Mathlib `TestFunction`, `fderiv`. (Definition.)

### 1.2 Lipschitz trial functions

`principalFrequency_eq_iInf_lipschitz`: `λ₁(Ω)` is the infimum of `dirichletRayleigh u` over the
nonzero Lipschitz `u : E → ℝ` with compact support and `tsupport u ⊆ Ω`.

*Route.* Test functions are Lipschitz (`ContDiff.lipschitzWith_of_hasCompactSupport`), so the
Lipschitz infimum is at most `λ₁(Ω)`. Conversely let `u` be Lipschitz with compact
`K = tsupport u ⊆ Ω`, and `δ > 0` with `K + B̄(0, 2δ) ⊆ Ω` (`δ = 1` if `Ω = E`). For a smooth
probability kernel `ρ_ε ≥ 0` supported in `B̄(0, ε)`, `ε < δ`, the convolution `u_ε = ρ_ε ⋆ u` is
smooth (`HasCompactSupport.contDiff_convolution_left`) with support in `K + B̄(0, ε)`, so it is a
test function of `Ω`. By Tau Ceti `LocallyLipschitzOn.hasWeakFDerivOn_fderiv` the a.e. derivative
`∇u` is the weak derivative of `u` on `E`, so `∇u_ε = ρ_ε ⋆ ∇u`
(`TauCeti.HasWeakFDerivOn.hasFDerivAt_convolution_right`), and Jensen's inequality for
convolution with `Φ(t) = t²` (`ConvexOn.lintegral_ofReal_map_norm_convolution_le`) gives
`∫ ‖∇u_ε‖² ≤ ∫ ‖∇u‖²`. Since `u` is uniformly continuous, `u_ε → u` uniformly, all supported in
the compact `K + B̄(0, δ)`, so `∫ u_ε² → ∫ u² > 0`. Hence `u_ε ≠ 0` for small `ε` and
`limsup dirichletRayleigh u_ε ≤ dirichletRayleigh u`, so `λ₁(Ω) ≤ dirichletRayleigh u`.

**Checks.**
- On `(0, 1)` the Lipschitz tent supported on `[1/10, 9/10]` with peak `2/5` at `1/2` is
  admissible (its support is a compact subset of `(0, 1)`), with quotient
  `(4/5)/(16/375) = 75/4 ≥ π²`.
  The tent `min(x, 1 − x)` on `[0, 1]` has quotient `12` but is not admissible: its support is
  `[0, 1]`.

*Needs:* Mathlib `ContDiff.lipschitzWith_of_hasCompactSupport`,
`HasCompactSupport.contDiff_convolution_left`, `LipschitzWith.ae_differentiableAt`; Tau Ceti
`LocallyLipschitzOn.hasWeakFDerivOn_fderiv`,
`TauCeti.HasWeakFDerivOn.hasFDerivAt_convolution_right`,
`ConvexOn.lintegral_ofReal_map_norm_convolution_le`; 1.1. (Proved here.)

### 1.3 Agreement with the first Dirichlet eigenvalue of `−Δ` on `H¹₀(Ω)`

`principalFrequency_eq_ofReal_firstDirichletEigenvalue`: let `Ω` be a nonempty open subset of
`EuclideanSpace ℝ ι`, and take any boundedness datum `hcoeff` and coercivity datum `hcoercive` for
the energy form of `−Δ` (coefficients `a = 1`, `b = 0`, `c = 0`) on `H¹₀(Ω)`. Then
`λ₁(Ω) = ENNReal.ofReal (TauCeti.PDE.firstDirichletEigenvalue hcoeff hcoercive)`. Boundedness of
`Ω` is not assumed; coercivity holds on every bounded `Ω` in positive dimension, and also, for
instance, on slabs.

*Route.* For `φ ∈ 𝓓(Ω, ℝ)`, `W1p.ofTestFunctionₗ φ ∈ H¹₀(Ω)` has value `φ` and gradient `∇φ`
almost everywhere on `Ω` (`TauCeti.W1p.value_ofTestFunctionₗ_ae`,
`TauCeti.W1p.gradient_ofTestFunctionₗ`), so its energy is `∫ ‖∇φ‖²` and its squared `L²` norm
is `∫ φ²` (both integrands vanish off `tsupport φ ⊆ Ω`). The energy form with `a = 1` and
`b = 0` is symmetric (`TauCeti.PDE.energyFormH1_comm_of_isSymm_ae`), so
`TauCeti.PDE.isGreatest_firstDirichletEigenvalue` applies, with no boundedness: the library's
eigenvalue `μ` is the greatest `C` with `C ‖u‖² ≤ a(u, u)` on `H¹₀(Ω)`. Taking `u` the image of a
test function gives `μ ∫ φ² ≤ ∫ ‖∇φ‖²`, so `ofReal μ ≤ λ₁(Ω)`. Conversely `λ₁(Ω)` is finite, and
`C = λ₁(Ω).toReal` satisfies `C ∫ φ² ≤ ∫ ‖∇φ‖²` for every test function; `H¹₀(Ω)` is the closure
of the test functions (`TauCeti.coe_w1p0Submodule`), and the value and the energy are continuous
on `W^{1,2}(Ω)`, so `C ‖u‖² ≤ a(u, u)` on all of `H¹₀(Ω)` and `C ≤ μ`.

**Checks.**
- On a nonempty bounded `Ω` of positive dimension a coercivity datum exists and the right side is
  positive (Tau Ceti `TauCeti.PDE.firstDirichletEigenvalue_pos`), so `λ₁(Ω) > 0` there.
- Positive dimension is needed for that: for `ι` empty and `Ω` the one-point space, which is
  nonempty, open and bounded, the constant `1` is a test function with Rayleigh quotient `0`, so
  `λ₁(Ω) = 0`; every gradient vanishes, the energy form is `0`, and no coercivity datum exists.
- Coercivity is a real hypothesis: on the whole space `λ₁ = 0` (Layer 2), and no coercivity datum
  exists there, since coercivity would give `C ∫ u² ≤ ∫ ‖∇u‖²` on `H¹₀` with some `C > 0`.
- Nonemptiness is needed: for `Ω = ∅` the left side is `∞` and the right side is finite.

*Needs:* Tau Ceti `TauCeti.PDE.firstDirichletEigenvalue`,
`TauCeti.PDE.isGreatest_firstDirichletEigenvalue`, `TauCeti.PDE.energyFormH1_comm_of_isSymm_ae`,
`TauCeti.W1p.ofTestFunctionₗ`,
`TauCeti.W1p.value_ofTestFunctionₗ_ae`, `TauCeti.W1p.gradient_ofTestFunctionₗ`,
`TauCeti.coe_w1p0Submodule`, `TauCeti.PDE.energyFormH1`; 1.1. (Proved here.)

### Examples

- **Interval.** For `a < b`, on the interval domain `(a, b)` of `EuclideanSpace ℝ (Fin 1)`,
  `λ₁ = (π/(b − a))²`: 1.3 with Tau Ceti `TauCeti.PDE.exists_isCoercive_laplacian_intervalDomain`
  and `TauCeti.PDE.firstDirichletEigenvalue_laplacian_intervalDomain`. The sine
  `sin(π(x − a)/(b − a))` has quotient exactly `(π/(b − a))²`.
- **Monotonicity.** `(0, 1/2) ⊆ (0, 1)` and `λ₁` drops from `4π²` to `π²`.

### Dependencies

Mathlib test functions, convolution and Rademacher; Tau Ceti Lipschitz weak derivatives,
mollification and Jensen's inequality (1.2); Tau Ceti's Dirichlet spectrum on `H¹₀(Ω)` and its
optimal Poincaré constant (1.3).

## Layer 2: similarities, disjoint unions and products

### 2.1 Similarities

`principalFrequency_image_similarity`: for a linear isometric equivalence `L : E ≃ₗᵢ[ℝ] F`,
`c ∈ F`, real `t ≠ 0`, an open `Ω ⊆ E` and the open `Ω' ⊆ F` equal to the image of `Ω` under
`T x = c + t L x`, `λ₁(Ω') · t² = λ₁(Ω)` in `[0, ∞]`.

*Route.* `φ ↦ φ ∘ T⁻¹` is a bijection from the test functions of `Ω` onto those of `Ω'`, with
`‖∇(φ ∘ T⁻¹)(T x)‖ = |t|⁻¹ ‖∇φ(x)‖` since `L` is an isometry. Both integrals change by the same
Jacobian factor: `L` preserves volume (`LinearIsometryEquiv.measurePreserving`), translations
preserve it, and dilation by `t` multiplies it by `|t|ⁿ` (`Measure.lintegral_comp_smul`). So
`dirichletRayleigh (φ ∘ T⁻¹) = t⁻² · dirichletRayleigh φ`, and taking infima,
`λ₁(Ω') = t⁻² λ₁(Ω)`; multiplying by `t² ∈ (0, ∞)` gives the statement, also when both sides
are `∞`.

**Checks.**
- `t ≠ 0` is needed: for `t = 0`, `Ω = ∅` and `n ≥ 1`, `Ω' = ∅`, and the left side is
  `∞ · 0 = 0` while the right side is `∞`.
- `(0, 2)` is the image of `(0, 1)` under `x ↦ 2x`: `(π/2)² · 4 = π²`.

*Needs:* Mathlib `LinearIsometryEquiv.measurePreserving`; Tau Ceti `Measure.lintegral_comp_smul`;
1.1.
(Proved here.)

### 2.2 Disjoint unions

`principalFrequency_iSup`: for open sets `Ω i` (`i` in any index type) pairwise disjoint,
`λ₁(⋃ i, Ω i) = ⨅ i, λ₁(Ω i)`.

*Route.* `≤`: monotonicity (Convention 3). `≥`: let `φ` be a nonzero test function of the union
and `K = tsupport φ`. The open sets `Ω i` cover the compact `K` and are disjoint, so only a finite
set `S` of them meets `K`. For `i ∈ S` let `φ_i` be `φ` on `Ω i` and `0` elsewhere. It is smooth,
being `φ` on the open `Ω i` and `0` on the open complement of `K ∩ Ω i`, which together cover
`E`; `K ∩ Ω i = K \ ⋃_{j ≠ i} Ω j` is closed, hence a compact subset of `Ω i` containing the
support of `φ_i`.
So `φ_i` is a test function of `Ω i`, and `∫ ‖∇φ_i‖² ≥ λ₁(Ω i) ∫ φ_i²` (also when `φ_i = 0`).
Since the supports are disjoint and `φ = Σ_{i ∈ S} φ_i`, summing gives
`∫ ‖∇φ‖² ≥ (⨅ i, λ₁(Ω i)) ∫ φ²`. For an empty index type both sides are `∞`.

**Checks.**
- Disjointness is needed: `(0, 1)` and `(1/2, 3/2)` have union `(0, 3/2)`, with
  `λ₁ = 4π²/9 < π² = min(λ₁(0, 1), λ₁(1/2, 3/2))`.
- `(0, 1) ∪ (2, 4)`: `λ₁ = min(π², π²/4) = π²/4`.

*Needs:* 1.1; Mathlib `TestFunction`. (Proved here.)

### 2.3 Products

`principalFrequency_prod`: for open `Ω₁ ⊆ E`, `Ω₂ ⊆ F` and `Ω = Ω₁ × Ω₂ ⊆ WithLp 2 (E × F)`,
`λ₁(Ω) = λ₁(Ω₁) + λ₁(Ω₂)`.

*Route.* By `WithLp.volume_preserving_ofLp` and Tonelli (`lintegral_prod`) integrals over the
product are iterated integrals. For `u` differentiable at `z = (x, y)` the gradient in the
Euclidean product is `(∇ₓu, ∇ᵧu)`, so `‖∇u‖² = ‖∇ₓu‖² + ‖∇ᵧu‖²`. Upper bound: for test functions
`φ` of `Ω₁` and `ψ` of `Ω₂`, `u(x, y) = φ(x) ψ(y)` is a test function of `Ω` (support in
`tsupport φ × tsupport ψ`), and `∫ ‖∇u‖² = ∫ ‖∇φ‖² ∫ ψ² + ∫ φ² ∫ ‖∇ψ‖²`, `∫ u² = ∫ φ² ∫ ψ²`,
so its quotient is `dirichletRayleigh φ + dirichletRayleigh ψ`; take infima. Lower bound: for a
test function `u` of `Ω` and fixed `y`, `x ↦ u(x, y)` is smooth with compact support in `Ω₁`, so
`∫ ‖∇ₓu(x, y)‖² dx ≥ λ₁(Ω₁) ∫ u(x, y)² dx`; integrate in `y`, do the same in `x`, and add. If
`Ω₁` or `Ω₂` is empty, so is `Ω`, and both sides are `∞`.

**Checks.**
- On `(0, 1)²` the product `x(1 − x) · y²(1 − y)` has quotient `24 = 10 + 14`, the sum of the
  quotients of the factors.

*Needs:* Mathlib `WithLp.volume_preserving_ofLp`, `lintegral_prod`; 1.1. (Proved here.)

### Examples

- **Whole space.** `λ₁(E) = 0`: by 2.1 with `L = id`, `c = 0`, `t = 2`,
  `4 λ₁(E) = λ₁(E)`, and `λ₁(E) < ∞`.
- **Boxes.** Iterating 2.3 over the factors (with 2.1 to identify `EuclideanSpace ℝ (Fin n)` with
  iterated Euclidean products) and the interval value of Layer 1, the box
  `(0, L₁) × ⋯ × (0, Lₙ)` has `λ₁ = (π/L₁)² + ⋯ + (π/Lₙ)²`; the product of sines has exactly
  this quotient.
- **Slabs.** For a unit vector `e` and `w > 0`, the slab `{x | 0 < ⟪x, e⟫ < w}` is, by an isometry
  onto `WithLp 2 (ℝ × e⊥)`, the product of `(0, w)` with the whole hyperplane, so by 2.1, 2.3 and
  the whole-space example its first eigenvalue is `(π/w)²` (Brasco, Lemma 2.4, p. 6, proves the
  same for `ℝ^(N−k) × ω` with bounded `ω`). Every open set inside a slab of width `w` has
  `λ₁ ≥ (π/w)²`.

### Dependencies

Layer 1; Mathlib's change of variables and product measures.

## Layer 3: isoperimetric inequalities for the first eigenvalue

### 3.1 The Faber–Krahn inequality

`principalFrequency_ball_le`: for every open `Ω` and real `r` with `vol(B(0, r)) = vol(Ω)`,
`λ₁(B(0, r)) ≤ λ₁(Ω)`. (Kawohl–Fridman, Theorem 1, p. 660, (4), for bounded smooth domains and
`W^{1,p}_0`; Brasco, (1.1), p. 2, in the volume form.) An `r` as in the hypothesis exists exactly
when `vol(Ω) < ∞`.

*Route.* If `Ω = ∅` then `B(0, r)` has volume `0`, is empty, and both sides are `∞`; in
dimension `0` equal volumes force `B(0, r) = Ω`. Let `n ≥ 1` and `Ω ≠ ∅`, so `r > 0`.
- *Dimension one.* Transport by 2.1 to `EuclideanSpace ℝ (Fin 1)` and identify it with `ℝ`. The
  connected components of `Ω` are open (`IsOpen.connectedComponentIn`) intervals
  (`IsPreconnected.mem_intervals`), pairwise disjoint, each of length `ℓ ≤ |Ω|`. By 2.2 and the
  interval example, `λ₁(Ω) = inf (π/ℓ)² ≥ (π/|Ω|)²`, and `B(0, r) = (−r, r)` with `2r = |Ω|` has
  `λ₁ = (π/|Ω|)²`.
- *Dimension `n ≥ 2`.* Let `φ` be a nonzero test function of `Ω` and `h = |φ|`, a nonnegative
  integrable Lipschitz function with `‖∇h‖ ≤ ‖∇φ‖` wherever `h` is differentiable (where `φ = 0`,
  `h` has a minimum and `∇h = 0`). Let `h*` be its Schwarz rearrangement as a real function. It is
  Lipschitz (`TauCeti.lipschitzWith_toReal_schwarzRearrangement`) and `∫ h*² = ∫ φ²`
  (`TauCeti.lintegral_rpow_schwarzRearrangement` with `p = 2`). The Isoperimetry roadmap, §5.2
  with `Φ(t) = t²`, gives `∫ ‖∇h*‖² ≤ ∫ ‖∇h‖² ≤ ∫ ‖∇φ‖²`. Support: `K = tsupport φ` is a compact
  subset of `Ω`, and `Ω \ K` is open and nonempty (a nonempty open subset of `E` is not compact),
  so `|K| < |Ω| = vol(B(0, r))`. By `TauCeti.lt_schwarzRearrangement_iff`, `h*(x) > 0` forces
  `vol(B(0, ‖x‖)) < |{h > 0}| ≤ |K|`, so `h*` vanishes outside `B̄(0, s)` for the `s < r` with
  `vol(B(0, s)) = |K|`. So `h*` is a nonzero Lipschitz function with compact support in
  `B(0, r)`, and by 1.2 `λ₁(B(0, r)) ≤ dirichletRayleigh h* ≤ dirichletRayleigh φ`.

**Checks.**
- `Ω = (0, 1) ∪ (2, 4)`, `|Ω| = 3`: `λ₁(Ω) = π²/4 ≥ π²/9 = λ₁((−3/2, 3/2))`.
- The radius condition is needed: with `r = 0` and `Ω = (0, 1)` the left side is `λ₁(∅) = ∞`.
- In the plane, 3.1 bounds the disc of area `1` by the unit square: its `λ₁` is at most `2π²`.

*Needs:* 1.2, 2.1, 2.2 and the interval example of Layer 1; Mathlib
`IsOpen.connectedComponentIn`, `IsPreconnected.mem_intervals`; Tau Ceti
`TauCeti.schwarzRearrangement`, `TauCeti.lipschitzWith_toReal_schwarzRearrangement`,
`TauCeti.lintegral_rpow_schwarzRearrangement`, `TauCeti.lt_schwarzRearrangement_iff`,
`TauCeti.addHaar_setOf_lt_schwarzRearrangement`; Isoperimetry §5.2 (the convex-integrand estimate
for Lipschitz functions). (Proved here.)

### 3.2 Cheeger's inequality

Define `cheegerConstant Ω` as the infimum of `P(A)/|A|` over measurable `A ⊆ Ω` with
`0 < |A| < ∞` (Brasco, §5, p. 14, for bounded `Ω`; Kawohl–Fridman, (5), p. 660, use smooth
subdomains whose boundary does not touch `∂Ω`, a smaller class with an infimum at least as large).

`cheegerConstant_sq_div_four_le`: for every open `Ω`, `h(Ω)²/4 ≤ λ₁(Ω)` in `[0, ∞]`.
(Kawohl–Fridman, Theorem 3, p. 661, (6), at `p = 2`, for their `h`.)

*Route.* For `Ω = ∅` both sides are `∞`. Let `φ` be a nonzero test function and `w = φ²`, a
Lipschitz function with compact support. By the coarea formula
(`LocallyLipschitzOn.lintegral_perimeter_eq_setLIntegral_enorm_fderiv`, on the whole space),
`∫ ‖∇w‖ = ∫ P({w > t}) dt`. For `t < 0` the level set is `E`, of perimeter `0`. For `t > 0`,
`A_t = {w > t}` is open, contained in `tsupport φ ⊆ Ω` and of finite volume, so
`P(A_t) ≥ h(Ω) |A_t|` (trivially when `|A_t| = 0`). By the layer-cake formula
(`lintegral_eq_lintegral_meas_lt`), `∫ ‖∇w‖ ≥ h(Ω) ∫ φ²`. On the other side
`‖∇w‖ = 2|φ| ‖∇φ‖`, and Cauchy–Schwarz (`ENNReal.lintegral_mul_le_Lp_mul_Lq`) gives
`∫ ‖∇w‖ ≤ 2 (∫ φ²)^(1/2) (∫ ‖∇φ‖²)^(1/2)`. With `0 < ∫ φ² < ∞` this gives
`h(Ω)² ≤ 4 dirichletRayleigh φ`.

**Checks.**
- On `(0, L)` in `ℝ`, every admissible `A` has `P(A) ≥ 2` and `|A| ≤ L`, and `A = (0, L)` gives
  `2/L`, so `h = 2/L` and the inequality reads `π²/L² ≥ 1/L²`.

*Needs:* 1.1; Tau Ceti `TauCeti.perimeter`,
`LocallyLipschitzOn.lintegral_perimeter_eq_setLIntegral_enorm_fderiv`; Mathlib
`lintegral_eq_lintegral_meas_lt`, `ENNReal.lintegral_mul_le_Lp_mul_Lq`,
`ContDiff.lipschitzWith_of_hasCompactSupport`. (Proved here.)

### 3.3 The Cheeger constant of balls

`le_cheegerConstant`: for every set `Ω`, `n (ω_n/|Ω|)^(1/n) ≤ h(Ω)` in `[0, ∞]` (the left side
is `0` when `n = 0` or `|Ω| = ∞`). `cheegerConstant_ball`: for `R > 0`, `h(B(c, R)) = n/R`.
(Kawohl–Fridman, Remark 5, p. 661, for the ball.)

*Route.* For admissible `A ⊆ Ω` and `n ≥ 1`, the sharp isoperimetric inequality
(`NullMeasurableSet.finrank_pow_mul_volume_ball_mul_volume_pow_le_perimeter_pow`) gives
`P(A)ⁿ ≥ nⁿ ω_n |A|^(n−1)`, so `P(A)/|A| ≥ n ω_n^(1/n) |A|^(−1/n) ≥ n (ω_n/|Ω|)^(1/n)` as
`|A| ≤ |Ω|`; with no admissible `A` the right side is `∞`. For the ball,
`|B(c, R)| = ω_n Rⁿ` (`Measure.addHaar_ball`) turns the lower bound into `n/R`, and `A = B(c, R)`
itself has `P(A)/|A| = n R^(n−1) ω_n/(Rⁿ ω_n) = n/R` (`TauCeti.perimeter_ball`). In dimension `0`
the ball is the one-point space of volume `1` and perimeter `0`, and both sides are `0`.

**Checks.**
- `R > 0` is needed: in dimension `0`, `B(c, 0) = ∅` has `h = ∞` while `n/R = 0`.
- With 3.2, every open set of finite volume has `λ₁(Ω) ≥ (n²/4)(ω_n/|Ω|)^(2/n)`; for the unit
  square this is `π ≤ 2π²`.

*Needs:* Tau Ceti
`NullMeasurableSet.finrank_pow_mul_volume_ball_mul_volume_pow_le_perimeter_pow`,
`TauCeti.perimeter_ball`; Mathlib `Measure.addHaar_ball`; 3.2 (the definition). (Proved here.)

### 3.4 The Hersch–Protter inequality

`ofReal_pi_div_two_mul_sq_le`: if `Ω` is open and convex and every open ball contained in `Ω`
has radius at most `R`, then `(π/(2R))² ≤ λ₁(Ω)`. (Brasco, Theorem 1.2, p. 3, at `p = 2`, where
`π₂ = π` by (2.1), p. 6; attributed there to Hersch in the plane and Protter in every dimension.
Brasco's inradius is the radius of the largest ball in `Ω`, and `R` here is any upper bound.)

*Route* (own, by a vector field built from the distance function). If `Ω = ∅` the right side is
`∞`; if `Ω = E` the hypothesis fails for large balls (and in dimension `0` it fails for every
`R`). Otherwise let `d(x) = infDist x Ωᶜ`, which is `1`-Lipschitz.
1. *`0 < d ≤ R` on `Ω`.* `Ω` is open, and `B(x, d(x)) ⊆ Ω` since points closer than `d(x)` are not
   in `Ωᶜ`; so `d(x) ≤ R`.
2. *`d` is concave on `Ω`.* For `x, y ∈ Ω` and `s ∈ [0, 1]`, convexity of `Ω` gives
   `B(sx + (1 − s)y, s d(x) + (1 − s) d(y)) ⊆ s B(x, d(x)) + (1 − s) B(y, d(y)) ⊆ Ω`.
3. *`‖∇d‖ = 1` a.e. on `Ω`.* At a point of differentiability `x ∈ Ω` let `y ∈ Ωᶜ` be nearest
   (`IsClosed.exists_infDist_eq_dist`); along the segment towards `y`, `d` decreases at rate `1`,
   so `‖∇d(x)‖ ≥ 1`, and `‖∇d(x)‖ ≤ 1` by the Lipschitz bound.
4. *`∫ ⟪∇d, ∇η⟫ ≥ 0` for Lipschitz `η ≥ 0` with compact support in `Ω`.* For an orthonormal
   basis `e_k` and `τ > 0` below the distance from the support of `η` to `Ωᶜ`, concavity gives
   `d(x + τe_k) + d(x − τe_k) − 2d(x) ≤ 0` where `η(x) ≠ 0`, so
   `Σ_k ∫ η(x)(d(x + τe_k) + d(x − τe_k) − 2d(x)) dx ≤ 0`. A translation rewrites the left side as
   `−Σ_k ∫ (η(x + τe_k) − η(x))(d(x + τe_k) − d(x)) dx`. Divide by `τ²` and let
   `τ → 0`: the difference quotients converge a.e. to directional derivatives, are bounded by
   the Lipschitz constants and supported in a fixed compact set, so dominated convergence gives
   `−∫ ⟪∇η, ∇d⟫ ≤ 0`.
5. *The estimate.* Let `c = π/(2R)` and `G(t) = log sin(ct)` on `(0, R]`, so that
   `G′(t) = c cot(ct) ≥ 0` and `G″ = −c² − G′²`. Let `φ` be a nonzero test function, `K` its
   support, `δ = min_K d > 0`, and `V = G′(d) ∇d`, bounded on `K`. Apply step 4 to the Lipschitz
   function `η = G′(d) φ² ≥ 0` (set to `0` where `φ = 0`; it is Lipschitz because `G′` is smooth on
   `[δ/2, R]` and `d > δ/2` near `K`), with `∇η = G″(d) φ² ∇d + G′(d) ∇(φ²)` a.e.; with step 3
   this gives `∫ ⟪V, ∇(φ²)⟫ ≥ ∫ φ²(c² + ‖V‖²)`. Then
   `0 ≤ ∫ ‖∇φ − φV‖² = ∫ ‖∇φ‖² − ∫ ⟪V, ∇(φ²)⟫ + ∫ φ²‖V‖² ≤ ∫ ‖∇φ‖² − c² ∫ φ²`.

**Checks.**
- Equality: the slab of width `2R` has `λ₁ = (π/(2R))²` (slab example) and contains balls of
  radius `R` but not larger.
- Strict for the square `(0, 2)²` with `R = 1`: `π²/2 > π²/4`.
- `G = log sin(ct)` satisfies `G″ + G′² + c² = 0`.
- Convexity is needed: the punctured unit disc `D \ {0}` in the plane contains no ball of radius
  larger than `1/2`, so the bound would be `π² ≈ 9.87`. But `(ρ² − |x|²)⁺` with `ρ = 9/10` has
  quotient `6/ρ² = 200/27 ≈ 7.41`, and multiplying it by the logarithmic cut-off equal to `0` for
  `|x| ≤ ε²`, to `log(|x|/ε²)/log(1/ε)` for `ε² ≤ |x| ≤ ε` and to `1` beyond (energy
  `2π/log(1/ε) → 0`) gives Lipschitz trial functions with compact support in `D \ {0}`
  whose quotients tend to `200/27`; by 1.2, `λ₁(D \ {0}) ≤ 200/27 < π²`.
- The radius hypothesis is needed: the slab of width `1` has `λ₁ = π²`, below `(π/(2R))²` for
  `R = 1/4`.

*Needs:* 1.1; Mathlib `IsClosed.exists_infDist_eq_dist`, `Metric.infDist_le_dist_of_mem`,
`LipschitzWith.ae_differentiableAt`,
`MeasureTheory.tendsto_integral_filter_of_dominated_convergence`.
(Proved here.)

### Examples

- With 2.1, 3.1 gives the volume form `λ₁(Ω) ≥ λ₁(B(0, 1)) (ω_n/|Ω|)^(2/n)` for `n ≥ 1` and
  `0 < |Ω| < ∞`
  (Brasco, (1.1), p. 2).
- In dimension one 3.1 is `λ₁(Ω) ≥ (π/|Ω|)²` for every open `Ω ⊆ ℝ` of finite length, with
  equality for intervals.
- Every open set contained in a ball of radius `ρ > 0` has `λ₁ ≥ λ₁(B(0, ρ)) = λ₁(B(0, 1))/ρ²`, by
  monotonicity and 2.1.

### Dependencies

Layers 1–2; Tau Ceti Schwarz rearrangement, perimeter, isoperimetric inequality and coarea
formula; Isoperimetry §5.2 (3.1 for `n ≥ 2`).

## Scope and ownership

**This roadmap owns** the principal frequency `λ₁(Ω)` of an arbitrary open set as an
`[0, ∞]`-valued infimum over test functions, with its Lipschitz form and its agreement with the
library's eigenvalue (Layer 1), the similarity, disjoint-union and product laws (Layer 2), and
the Faber–Krahn inequality, the Euclidean Cheeger constant with Cheeger's inequality and its
value on balls, and the Hersch–Protter inequality (Layer 3).

**Already in the library**, and only cited: the Dirichlet solution operator, eigenvalues and
eigenbasis of symmetric coercive forms on bounded open sets, the first eigenvalue as least
Rayleigh quotient on `H¹₀(Ω)`, and the interval spectrum `(kπ/(b − a))²` with the sharp
one-dimensional Poincaré constant; Schwarz rearrangement with equimeasurability and Lipschitz
bounds; perimeter, the sharp isoperimetric inequality, perimeters of balls and the coarea
formula.

**Stated by other roadmaps and not restated.** [PDE](../PDE/README.md) §4.4 owns the `−Δ`
Dirichlet spectrum on bounded open sets: the eigenvalue sequence, domain monotonicity of every
`λ_k`, the separation-of-variables eigenpairs of intervals and boxes, and `λ₁` as the reciprocal
squared Poincaré constant; the boxes here are only an Example of Layer 2.
[RiemannianGeometry](../RiemannianGeometry/README.md) R5c owns simplicity and positivity of the
first eigenfunction and strict domain monotonicity on smooth relatively compact domains of
manifolds, which therefore are not targets here. [Isoperimetry](../Isoperimetry/README.md) owns
Pólya–Szegő in `BV` and `W¹,¹` and the convex-integrand estimate of its §5.2, which 3.1 consumes.
[VariationalMethods](../VariationalMethods/README.md) owns abstract min–max values of compact form
pairs. Graph Cheeger constants (KernelsAndSpectralMethods) are a different object.

**Outside this roadmap**: the equality case of Faber–Krahn, higher eigenvalues (Krahn–Szegő,
Payne–Pólya–Weinberger), the value of `λ₁` of a ball through Bessel zeros, capacity and
removable sets, quantitative stability, and the `p`-Laplacian.

## Exact supplier contracts

### From Mathlib

- `TestFunction` (`Mathlib/Analysis/Distribution/TestFunction.lean`), notation `𝓓(Ω, ℝ)`.
- `ContDiff.lipschitzWith_of_hasCompactSupport` (`Analysis/Calculus/ContDiff/RCLike.lean`):
  compact support, `ContDiff 𝕂 n f`, `n ≠ 0`.
- `LipschitzWith.ae_differentiableAt` (`Analysis/Calculus/Rademacher.lean`): Lipschitz maps
  between finite-dimensional spaces, any additive Haar measure.
- `HasCompactSupport.contDiff_convolution_left` (`Analysis/Calculus/ContDiff/Convolution.lean`):
  compactly supported
  `C^n` kernel, locally integrable function, invariant measure.
- `LinearIsometryEquiv.measurePreserving`, `WithLp.volume_preserving_ofLp`
  (`MeasureTheory/Measure/Haar/InnerProductSpace.lean`): finite-dimensional inner product spaces
  with Borel σ-algebras.
- `Measure.addHaar_ball` (`MeasureTheory/Measure/Lebesgue/EqHaar.lean`): nontrivial space,
  `0 ≤ r`.
- `lintegral_prod` (`MeasureTheory/Measure/Prod.lean`): `SFinite ν`, `AEMeasurable f`.
- `lintegral_eq_lintegral_meas_lt` (`MeasureTheory/Integral/Layercake.lean`): `0 ≤ᵐ f`,
  `AEMeasurable f`.
- `ENNReal.lintegral_mul_le_Lp_mul_Lq` (`MeasureTheory/Integral/MeanInequalities.lean`): Hölder
  conjugate exponents, a.e.-measurable factors.
- `IsOpen.connectedComponentIn`, `IsPreconnected.mem_intervals`, `IsClosed.exists_infDist_eq_dist`,
  `Metric.infDist_le_dist_of_mem`.

### From Tau Ceti

- `TauCeti.PDE.firstDirichletEigenvalue`,
  `TauCeti.PDE.isGreatest_firstDirichletEigenvalue`,
  `TauCeti.PDE.firstDirichletEigenvalue_pos` (`TauCeti/Analysis/PDE/Spectrum/Basic.lean`): a
  symmetric coercive energy form with bounded coefficients on a nonempty open set, bounded for the
  last one.
- `TauCeti.PDE.intervalDomain`, `TauCeti.PDE.exists_isCoercive_laplacian_intervalDomain`,
  `TauCeti.PDE.firstDirichletEigenvalue_laplacian_intervalDomain`
  (`TauCeti/Analysis/PDE/Spectrum/Interval.lean`): `a < b`.
- `TauCeti.PDE.energyFormH1`, `TauCeti.PDE.energyFormH1L0`,
  `TauCeti.PDE.energyFormH1_comm_of_isSymm_ae` (`TauCeti/Analysis/PDE/EnergyForm/`).
- `TauCeti.W1p.ofTestFunctionₗ`, `TauCeti.W1p.value_ofTestFunctionₗ_ae`,
  `TauCeti.W1p.gradient_ofTestFunctionₗ`, `TauCeti.coe_w1p0Submodule`
  (`TauCeti/Analysis/Sobolev/W1p/Zero.lean`): Haar measure, `1 ≤ p`.
- `LocallyLipschitzOn.hasWeakFDerivOn_fderiv` (`TauCeti/Analysis/Sobolev/WeakDeriv/Lipschitz.lean`),
  `TauCeti.HasWeakFDerivOn.hasFDerivAt_convolution_right`
  (`TauCeti/Analysis/Sobolev/Mollification/Basic.lean`): locally integrable function and weak
  derivative, smooth compactly supported kernel.
- `ConvexOn.lintegral_ofReal_map_norm_convolution_le` (`TauCeti/Analysis/Convolution/Jensen.lean`):
  convex nondecreasing `Φ` on `[0, ∞)`, nonnegative kernel of integral `1`.
- `Measure.lintegral_comp_smul` (`TauCeti/MeasureTheory/Integral/Dilation.lean`): additive Haar
  measure, `r ≠ 0`.
- `TauCeti.schwarzRearrangement`, `TauCeti.lt_schwarzRearrangement_iff`,
  `TauCeti.addHaar_setOf_lt_schwarzRearrangement`, `TauCeti.lintegral_rpow_schwarzRearrangement`
  (`TauCeti/MeasureTheory/Function/SchwarzRearrangement.lean`: Haar measure, a.e.-measurable `f`,
  `0 < p`), `TauCeti.lipschitzWith_toReal_schwarzRearrangement` (`…/Lipschitz.lean`).
- `TauCeti.perimeter` (`TauCeti/Analysis/BoundedVariation/Perimeter.lean`),
  `TauCeti.perimeter_ball` (`…/Ball.lean`: `0 < r`),
  `NullMeasurableSet.finrank_pow_mul_volume_ball_mul_volume_pow_le_perimeter_pow`
  (`…/Isoperimetric.lean`: null-measurable, finite positive volume, `n ≠ 0`),
  `LocallyLipschitzOn.lintegral_perimeter_eq_setLIntegral_enorm_fderiv` (`…/Coarea.lean`: locally
  Lipschitz on `Ω`, Haar measure).

### From TauCetiRoadmap.Isoperimetry

- §5.2, the convex-integrand estimate: for `n ≥ 2`, a nonnegative integrable Lipschitz `h` and a
  finite convex nondecreasing `Φ` on `[0, ∞)` with `Φ(0) = 0`, `∫ Φ(‖∇h*‖) ≤ ∫ Φ(‖∇h‖)` when the
  right side is finite, with `h*` as in its Convention 8. Used in 3.1 with `Φ(t) = t²`.

## References

- L. Brasco, *On principal frequencies and inradius in convex sets*, arXiv:1808.09684v1 (2018):
  the definition of `λ(Ω)` on `C₀^∞(Ω)`, p. 1; Faber–Krahn (1.1), p. 2; Theorem 1.2, p. 3; (2.1)
  and Lemma 2.4, p. 6; the Cheeger constant, §5, p. 14.
- B. Kawohl and V. Fridman, *Isoperimetric estimates for the first eigenvalue of the p-Laplace
  operator and the Cheeger constant*, Comment. Math. Univ. Carolin. 44 (2003), 659–667:
  Theorem 1, p. 660; (5), p. 660; Theorem 3 and Remark 5, p. 661.
