# Roadmap: Mixed and nonconforming finite elements

**Summary.** This roadmap builds the finite element methods that go beyond a conforming
approximation of a coercive problem:
- saddle-point problems in Banach spaces: the Babuška–Brezzi theorem with its kernel and inf-sup
  conditions, the lifting of the constraint operator and the a priori bounds;
- mixed Galerkin approximation: discrete well-posedness, error bounds with explicit constants,
  the role of a conforming discrete kernel, and quasi-optimality under uniform inf-sup constants;
- linear-quadratic optimal control as a constrained problem with a saddle-point structure:
  existence, the adjoint state and the optimality system, and the projection formula for box
  constraints;
- polynomial vector fields: the Raviart–Thomas and Nédélec spaces, their dimensions, degrees of
  freedom and normal traces, and exactness of the polynomial de Rham complex in three dimensions;
- the symmetric interior penalty discontinuous Galerkin method: coercivity under an explicit
  penalty threshold, well-posedness and energy and `L²` rates;
- the space `H(div)` through its weak divergence, the conforming global Raviart–Thomas space, a
  bounded commuting projection, the uniform discrete inf-sup condition and error estimates for the
  mixed form of a diffusion problem;
- the continuous inf-sup condition of the Stokes problem and uniform stability of the MINI and
  Taylor–Hood pairs;
- subcomplexes of Hilbert complexes: the discrete Poincaré inequality from a bounded cochain
  projection, the bridge from the continuous Poincaré inequality to discrete stability.

The nearest roadmaps are GalerkinMethodsAndLagrangeFiniteElements, a family roadmap whose meshes,
Lagrange spaces, abstract Galerkin theory and discrete trace inequality this roadmap uses;
[SobolevDifferentialForms](../SobolevDifferentialForms/README.md), whose abstract Hilbert
complexes, Hodge decomposition and Poincaré inequality are the continuous side of the last layer;
[IncompressibleFluids](../IncompressibleFluids/README.md), whose weak divergence defines `H(div)`
here; and [SobolevPolynomialApproximation](../SobolevPolynomialApproximation/README.md), whose
polynomial approximation on a cell drives every rate. The roadmap is a multi-source synthesis of
Ern–Guermond (both volumes), Arnold's monograph on finite element exterior calculus,
Boffi–Brezzi–Fortin and Hinze–Pinnau–Ulbrich–Ulbrich (see [References](#references)). Headlines
that restate a source result cite a theorem, definition, section or equation number with its
printed page; corollaries and adaptations carry a proof route.

`Suggested.lean` states, against the pinned Mathlib and Tau Ceti, the headlines below that carry a
Lean name, each with every conclusion the README attaches to it, and the definitions those
statements need. It is not an exhaustive acceptance test; the headlines without a Lean name are
targets of the same standing, stated in prose.

Suggested home: `TauCeti/NumericalAnalysis/Galerkin/` for Layers 1–3 and 8, and
`TauCeti/NumericalAnalysis/FiniteElement/` for Layers 4–7.

## How to read the build

Layers 1–3 are functional analysis. Layer 1 is the continuous saddle-point problem, Layer 2 its
approximation on a pair of finite-dimensional subspaces, and Layer 3 a constrained minimization
whose optimality system has the same structure, with the adjoint state as the multiplier. Every
mixed error estimate of Layers 6 and 7 is a Layer 2 bound followed by an approximation estimate.

Layer 4 is algebra of polynomial vector fields on one cell, with no mesh: the spaces are
submodules of `Fin d → MvPolynomial (Fin d) ℝ`, the differential operators act on coefficients,
and integrals appear only in the degrees of freedom. Layers 5 and 6 put these spaces on a
simplicial mesh of the sibling roadmap. A broken object is a family indexed by the cells; a facet
is seen once from each of its cells, with weight `1/2` on interior facets, so every sum over
facets is a sum over pairs of a cell and a vertex. Layer 5 needs no conformity across facets; in
Layer 6 the global Raviart–Thomas space is the subspace of families with continuous normal
components.

Layer 7 uses the Lagrange spaces of the sibling roadmap for velocities and pressures. Layer 8
returns to the abstract level: a bounded cochain projection carries the Poincaré inequality of a
complex, as SobolevDifferentialForms §7.4 gives it on a bounded Lipschitz domain, to a subcomplex,
which is the stability statement behind 6.2 in the language of complexes.

The layers are in build order: each layer needs only earlier layers and the suppliers.

## Conventions

- **Ambient space and cells** are those of GalerkinMethodsAndLagrangeFiniteElements: `E d`,
  `Affine.Simplex ℝ (E d) d`, `cellDiam`, `cellInball`, conforming meshes `SimplicialMesh`, and
  families `T : ℕ → SimplicialMesh d` with `(T n).domainOpens = Ω` and `IsShapeRegular`. Each
  `∃ C` is quantified before the meshes, so `C` depends only on the listed parameters.
- **Bilinear forms** are bundled as `A : V →L[ℝ] StrongDual ℝ V` and
  `B : V →L[ℝ] StrongDual ℝ Q`, so `A u v` is `a(u, v)` and `B v q` is `b(v, q)`. The transpose
  `q ↦ b(·, q)` is `B.flip` (Mathlib's `ContinuousLinearMap.flip`), the constraint kernel is
  `LinearMap.ker B.toLinearMap`, and the restriction of `A v` to a subspace is its composition
  with the subspace's `subtypeL`, as in `(A v).comp (discreteKernel B Vh Qh).subtypeL`.
  Reflexivity is surjectivity of `NormedSpace.inclusionInDoubleDual`.
- **Constants are explicit.** Inf-sup conditions are `0 < β` and `∀ q, β * ‖q‖ ≤ ‖B.flip q‖`;
  no statement takes an infimum of a ratio. Discrete error bounds hold for every comparison pair
  `(v_h, q_h)`, so no infimum over a possibly empty set appears. Where an inf-sup condition is
  stated with an existential witness (6.2, 7.2) it is in lifting form, `‖v‖ ≤ ‖q‖` and
  `β ‖q‖² ≤ b(v, q)`, because `β ‖q‖ ‖v‖ ≤ b(v, q)` is satisfied by `v = 0`.
- **Polynomial vector fields** are `PolyField d = Fin d → MvPolynomial (Fin d) ℝ`, evaluated
  through the sibling's `evalₗ`. The Raviart–Thomas space of degree `k` contains `P_k^d` and has
  divergence in `P_k` (Ern–Guermond's indexing; Boffi–Brezzi–Fortin's index agrees).
- **Facets** of a cell are `facet K a = convexHull ℝ (K.points '' {a}ᶜ)`, the facet opposite
  vertex `a`, with outward unit normal `facetNormal K a`, built from
  `Affine.Simplex.altitudeFoot` and `Affine.Simplex.height`, and diameter `facetDiam K a`.
  Facet integrals use Mathlib's `μHE[d - 1]`
  (`MeasureTheory.Measure.euclideanHausdorffMeasure`), which agrees with surface measure. The
  sibling's discrete trace inequality uses the unnormalized Hausdorff measure; the two differ by a
  constant factor, which the constants absorb.
- **Sobolev spaces** are Tau Ceti's `W1p`, `W1p0` and `Wkp` with `volume.restrict Ω`, and the
  seminorm `seminorm` of the sibling. Orders are integers; fractional orders are in Beyond.
  Vector-valued Sobolev functions are families of scalar ones, indexed by the component.
- **Lipschitz domains** are Tau Ceti's `Set.IsLipschitzDomain`, modelled on `E (d - 1)`.
- **Integrals** of polynomials over cells and facets, and of `L²` functions against
  polynomials over cells, are Bochner integrals of integrable functions. The weak divergence is
  `HasWeakDivergenceOn`, the local copy of IncompressibleFluids §1.1; it carries the local
  integrability of both fields, so its integral identity is never a junk identity, and every
  statement about `H(div)` adds `MemLp h 2` for the divergence `h`.

## Layer 1: saddle-point problems

### 1.1 Well-posedness

`IsMixedSolution A B f g u p` is `a(u, v) + b(v, p) = f(v)` for all `v` and `b(u, q) = g(q)` for
all `q`. Throughout, `V` and `Q` are real Banach spaces, both reflexive.

- **Lifting** (`exists_lift_of_infSup`): if `β ‖q‖ ≤ ‖B.flip q‖` for all `q`, every
  `g ∈ StrongDual ℝ Q` is `B u` for some `u` with `β ‖u‖ ≤ ‖g‖`. Ern–Guermond II, Lemma C.42,
  p. 462 (with Lemma C.40, p. 461, for surjectivity).
- **The Babuška–Brezzi theorem** (`existsUnique_mixedSolution_iff`): the problem has a unique
  solution for all data iff `a` restricted to `ker B` satisfies both conditions of the
  Banach–Nečas–Babuška theorem (an inf-sup constant `α > 0` and injectivity of the transpose on
  `ker B`) and `b` satisfies the inf-sup condition with some `β > 0`. Ern–Guermond II,
  Theorem 49.13, p. 358.
- **Coercivity on the kernel** (`existsUnique_mixedSolution_of_infSup`): `α ‖v‖² ≤ a(v, v)` on
  `ker B` and the inf-sup condition on `b` give unique solvability. Proof route: coercivity gives
  both kernel conditions with constant `α` (GalerkinMethodsAndLagrangeFiniteElements §1.1 on the
  closed subspace `ker B`), then the theorem above.

*Needs:* GalerkinMethodsAndLagrangeFiniteElements §1.1; Mathlib's closed range theorem.

**Checks.**

- `V = Q = ℝ`, `a = 0`, `b(v, q) = v q`: `ker B = 0`, `β = 1`, and the solution is `u = g`,
  `p = f`.
- Lifting: `b(v, q) = 2 v q` on `ℝ` gives `β = 2` and `u = g / 2`, with equality in the bound.
- Negative control: `V = ℝ²`, `Q = ℝ`, `b(v, q) = v₁ q`, `a(u, v) = u₁ v₁`. Here `b` is inf-sup
  stable but `a` vanishes on `ker B = span e₂`, and `u₂` is undetermined: the kernel condition
  cannot be dropped.
- Negative control: `b = 0` with `Q ≠ 0` leaves `p` undetermined: the inf-sup condition on `b`
  cannot be dropped.

### 1.2 A priori bounds

- **A priori bounds** (`norm_le_of_isMixedSolution`): with constants `α` on `ker B` and `β` for
  `b`, `‖u‖ ≤ ‖f‖/α + (1 + ‖A‖/α) ‖g‖/β` and
  `‖p‖ ≤ (1 + ‖A‖/α) ‖f‖/β + (‖A‖/β²)(1 + ‖A‖/α) ‖g‖`. Ern–Guermond II, Theorem 49.13, (49.38a)
  and (49.38b), p. 358.

*Needs:* 1.1.

**Checks.**

- `V = Q = ℝ`, `a(u, v) = u v`, `b(v, q) = v q`: `u = g` and `p = f - g`. Since `ker B = 0`, any
  `α` is admissible; as `α → ∞` the bounds tend to `‖g‖` and `‖f‖ + ‖g‖`, which are attained at
  `f = -g`.
- `V = ℝ²`, `Q = ℝ`, `a(u, v) = u·v`, `b(v, q) = v₁ q`: `‖A‖ = 1`, `α = 1` on `ker B = span e₂`,
  `β = 1`, and the solution is `u = (g, f₂)`, `p = f₁ - g`. For `f = (1, 0)`, `g = 1`: `u = e₁`,
  `p = 0`, against the bounds `‖u‖ ≤ 1 + 2 = 3` and `‖p‖ ≤ 2 + 2 = 4`.

## Layer 2: mixed Galerkin approximation

For subspaces `V_h ⊆ V` and `Q_h ⊆ Q`, `discreteKernel B Vh Qh` is
`K_h = {v ∈ V_h | b(v, q) = 0 for q ∈ Q_h}`, and `IsDiscreteMixedSolution` is the saddle-point
problem posed on `V_h × Q_h` with test functions in `V_h × Q_h`. `V` and `Q` need only norms.

### 2.1 Discrete well-posedness

- **Discrete well-posedness** (`existsUnique_isDiscreteMixedSolution_iff`): for
  finite-dimensional `V_h` and `Q_h`, the discrete problem has a unique solution for all data iff
  `a` satisfies an inf-sup condition on `K_h` with some `α_h > 0` and `b` the discrete inf-sup
  condition on `V_h × Q_h` with some `β_h > 0`. Ern–Guermond II, Proposition 50.1, p. 364.
- Coercivity of `a` on `ker B` does not imply the condition on `K_h` unless `K_h ⊆ ker B`
  (Ern–Guermond II, p. 364); coercivity on all of `V` does, with `α_h ≥ α`
  (GalerkinMethodsAndLagrangeFiniteElements §1.2). The inf-sup condition on `b` passes to
  `V_h × Q_h` with constant `γ β` when a Fortin operator `Π_h : V → V_h` with `γ ‖Π_h v‖ ≤ ‖v‖`
  and `b(Π_h v, q) = b(v, q)` for `q ∈ Q_h` exists (GalerkinMethodsAndLagrangeFiniteElements §1.2,
  applied to `B.flip`).

*Needs:* GalerkinMethodsAndLagrangeFiniteElements §1.2.

**Checks.**

- `V_h = V`, `Q_h = Q` finite-dimensional: the conditions are those of 1.1.
- Negative control: `V = ℝ²`, `Q = ℝ`, `b(v, q) = v₁ q`, `a(u, v) = u₂ v₂`, which is well posed.
  With `V_h = span e₁` and `Q_h = 0`, `K_h = span e₁` and `a = 0` on it, so the discrete problem
  is singular: the continuous conditions do not pass to an arbitrary pair of subspaces.
- Negative control: `V_h = span e₂`, `Q_h = Q` in the same example: `b = 0` on `V_h × Q_h`, so
  `β_h` does not exist.

### 2.2 Error bounds

Let `(u, p)` solve the continuous and `(u_h, p_h)` the discrete problem, with constants `α_h`,
`β_h` as in 2.1. Let `Z_h` be the set of v_h ∈ V_h with `b(v_h, q) = b(u, q)` for `q ∈ Q_h`.

- **Error bounds** (`norm_sub_le_of_isDiscreteMixedSolution`): for every v_h ∈ Z_h and
  q_h ∈ Q_h,
  `‖u - u_h‖ ≤ (1 + ‖A‖/α_h) ‖u - v_h‖ + (‖B‖/α_h) ‖p - q_h‖` and
  `‖p - p_h‖ ≤ (1 + ‖A‖/α_h)(‖A‖/β_h) ‖u - v_h‖ + (1 + ‖B‖/β_h + (‖B‖/α_h)(‖A‖/β_h)) ‖p - q_h‖`.
  Ern–Guermond II, Lemma 50.2, p. 365.
- **Conforming discrete kernel** (`norm_sub_le_of_isDiscreteMixedSolution_of_le_ker`): if
  `K_h ⊆ ker B`, the pressure term drops out of the velocity bound, and the pressure constant
  becomes `1 + ‖B‖/β_h`. Ern–Guermond II, Lemma 50.2, p. 365.
- **Best approximation under the discrete constraint**
  (`exists_mem_discreteConstraint_norm_sub_le`): for finite-dimensional `V_h`, `Q_h` and every
  w_h ∈ V_h there is v_h ∈ Z_h with `‖u - v_h‖ ≤ (1 + ‖B‖/β_h) ‖u - w_h‖`. Ern–Guermond II,
  Lemma 50.3, p. 366, with the Fortin operator of norm `‖B‖/β_h` of Remark 50.6, p. 367. In
  normed spaces the Fortin operator is replaced by the finite-dimensional lifting of 1.1 applied
  to `w ↦ b(u - w_h, ·)` on `Q_h`, whose constant is `β_h` because the image of the closed unit
  ball of `V_h` is compact.

*Needs:* 2.1, 1.1.

**Checks.**

- The example of the second Check of 1.2 with `V_h = span (e₁ + e₂)`, `Q_h = Q`: `K_h = 0`, so
  every `α_h > 0` is admissible, and `β_h = 1/√2`. Here `u_h = g (e₁ + e₂)` and
  `p_h = f₁ + f₂ - 2g`, and `Z_h = {g (e₁ + e₂)}`. For `f = (0, 1)`, `g = 0`: `u = e₂`, `p = 0`,
  `u_h = 0`, `p_h = 1`; with v_h = 0 and q_h = 0 the velocity bound `(1 + 1/α_h) · 1` tends to
  `‖u - u_h‖ = 1` as `α_h → ∞`, and the pressure bound `(1 + 1/α_h) √2` to `√2 ≥ |p - p_h| = 1`.
- Best approximation in the same example: `u = e₂`, w_h = e₁ + e₂ gives `‖u - w_h‖ = 1`; the only
  member of `Z_h` is `0`, with `‖u - 0‖ = 1 ≤ (1 + √2) · 1`.
- `V_h = V`, `Q_h = Q`: `u_h = u` and p_h = p, and both bounds hold with v_h = u, q_h = p.

### 2.3 Uniform quasi-optimality

- **Quasi-optimality under uniform constants** (`exists_mixed_quasi_optimal_constant`): for
  constants `α₀, β₀ > 0` there is `C` such that for all finite-dimensional `V_h`, `Q_h` with
  `α_h ≥ α₀` and `β_h ≥ β₀`,
  `‖u - u_h‖ + ‖p - p_h‖ ≤ C (Metric.infDist u V_h + Metric.infDist p Q_h)`. Ern–Guermond II,
  Corollary 50.5, pp. 366–367.

*Needs:* 2.2.

**Checks.**

- `V_h = V`, `Q_h = Q`: both sides are `0`.
- Negative control: in the example of 2.1 with `V_h = span e₁`, `Q_h = 0`, `f(v) = v₂` and
  `g = 0`, the continuous solution is `u = e₂`, `p = 0`, and every `u_h = t e₁` solves the
  discrete problem, since `a = 0` on `K_h = V_h`. Then `‖u - u_h‖ = √(1 + t²)` while
  `Metric.infDist u V_h = 1` and `Metric.infDist p Q_h = 0`, so no `C` exists without the
  condition on `K_h`.

## Layer 3: linear-quadratic optimal control

`H` and `U` are real Hilbert spaces, `Y` and `Z` real Banach spaces, `A : Y ≃L[ℝ] Z`,
`B : U →L[ℝ] Z`, `Q : Y →L[ℝ] H`, `q_d ∈ H`, `g ∈ Z`, and `α ≥ 0`. The cost is
`lqCost Q q_d α (y, u) = ½ ‖Q y - q_d‖² + (α/2) ‖u‖²` on the feasible set
`lqFeasible A B g Yad Uad = {(y, u) | y ∈ Y_ad, u ∈ U_ad, A y + B u = g}`. Hinze et al., (1.77),
p. 52.

### 3.1 Existence

- **Optimal controls** (`exists_isMinOn_lqCost`): if `U_ad` is convex and closed, and bounded
  when `α = 0`, `Y_ad` is convex and closed, and the feasible set is nonempty, an optimal pair
  exists; it is unique when `α > 0`. Hinze et al., Assumption 1.42 and Theorem 1.43, p. 53.

*Needs:* Mathlib's weak lower semicontinuity of convex continuous functions and weak compactness
of bounded closed convex sets in Hilbert spaces.

**Checks.**

- `U = Y = Z = H = ℝ`, `A = B = Q = 1`, `U_ad = Y_ad = ℝ`: `y = g - u`, and the minimizer is
  `u = (g - q_d)/(1 + α)`.
- Negative control for uniqueness: `Q = 0`, `α = 0` and `U_ad = [0, 1]` make every feasible
  pair optimal.

### 3.2 The optimality system

- **Adjoint state** (`exists_adjointState_of_isMinOn`): without state constraints
  (`Y_ad = Y`) and with `U_ad` convex, an optimal pair `(ȳ, ū)` has an adjoint state
  `p ∈ StrongDual ℝ Z` with `p(A v) = -⟪Q ȳ - q_d, Q v⟫` for all `v`, and
  `α ⟪ū, u - ū⟫ + p(B (u - ū)) ≥ 0` for all `u ∈ U_ad`. Hinze et al., Corollary 1.3, p. 73,
  with Theorem 1.48, p. 71.
- **Sufficiency** (`isMinOn_of_adjointState`): for `α ≥ 0`, a feasible pair with such an adjoint
  state is optimal. Hinze et al., Theorem 1.46, p. 66 (the variational inequality is sufficient
  for a convex cost).

*Needs:* 3.1.

**Checks.**

- In the example of 3.1, `p = q_d - ȳ`, and the variational inequality is the equation
  `α ū = ȳ - q_d`, which gives `ū = (g - q_d)/(1 + α)`.
- Negative control for sufficiency: `α = -1`, `Q = 0`, `U_ad = U = ℝ`: `ū = 0` with `p = 0`
  satisfies the system, but the cost `-u²/2` has no minimum, so `α ≥ 0` is needed.

### 3.3 Box constraints

- **Projection formula** (`variationalInequality_box_iff`): in `Lp ℝ 2 μ` with `a ≤ b` and
  `α > 0`, `ū` lies in `[a, b]` and satisfies `⟪α ū + w, u - ū⟫ ≥ 0` for all `u ∈ [a, b]` iff
  `ū = b ⊓ (a ⊔ (-α⁻¹) • w)`, the pointwise projection of `-w/α`. Hinze et al., Lemma 1.12,
  pp. 71–72. With `w` the function representing `B* p`, this is the optimality system of 3.2 for
  `U_ad = {a ≤ u ≤ b}`.

*Needs:* Mathlib's lattice structure on `Lp`.

**Checks.**

- `a = 0`, `b = 1`, `α = 1`, `w = -2` (constants on a probability space): `ū = 1`.
- `a = 0`, `b = 1`, `α = 2`, `w = 1`: `-w/α = -1/2` is clamped to `ū = 0`, and
  `⟪α ū + w, u - ū⟫ = ⟪1, u⟫ ≥ 0` for `0 ≤ u ≤ 1`.
- Negative control (the clamping): the unconstrained stationary point `-w/α = -1/2` of the
  previous Check is not in `[a, b]`.

## Layer 4: polynomial vector fields

### 4.1 The Raviart–Thomas space

`polyFieldsDegLE d k` is `P_k^d`; `polyDiv`, `polyGrad` and `xMul` are the divergence, the
gradient and `q ↦ x q`. `raviartThomas d k` is `P_k^d + x P̃_k`, with `P̃_k` the homogeneous
polynomials of degree `k` (`MvPolynomial.homogeneousSubmodule`). Ern–Guermond I, Definition 14.4,
p. 163, for `d ≥ 2`; the definition and the statements below hold for `d ≥ 1`.

- **Euler identity** (`polyDiv_xMul_of_isHomogeneous`): `div (x q) = (k + d) q` for `q`
  homogeneous of degree `k`. Ern–Guermond I, Lemma 14.3, p. 163. Proved in `Suggested.lean`
  from Mathlib's `MvPolynomial.IsHomogeneous.sum_X_mul_pderiv`.
- **Dimension** (`finrank_raviartThomas`):
  `dim RT_k = d·C(k + d, d) + C(k + d - 1, d - 1)`. Ern–Guermond I, Lemma 14.6, p. 163, which
  writes it as `(k + d + 1) C(k + d - 1, k)`.
- **Divergence** (`map_polyDiv_raviartThomas`): `div` maps `RT_k` onto `P_k`, and a
  divergence-free field of `RT_k` lies in `P_k^d`. Ern–Guermond I, Lemma 14.9, p. 164.
- **Normal traces** (`exists_normalComp_eq_of_mem_raviartThomas`): on every affine hyperplane
  `⟪n, x⟫ = c`, the normal component `normalComp v n` of `v ∈ RT_k` agrees with a polynomial of
  degree at most `k`. Ern–Guermond I, Lemma 14.7, pp. 163–164.

*Needs:* Mathlib `MvPolynomial.pderiv`, `MvPolynomial.IsHomogeneous`,
`MvPolynomial.restrictTotalDegree`, `MvPolynomial.IsHomogeneous.sum_X_mul_pderiv`.

**Checks.**

- `dim RT_k` for `d = 2`, `k = 0, 1, 2` is `3, 8, 15`, and for `d = 3` it is `4, 15, 36`; the
  rank of the spanning set computed with numpy agrees.
- `d = 1`: `RT_k = P_{k+1}` (dimensions `2, 3, 4, 5` for `k = 0, …, 3`).
- `q = 1`, `d = 2`: `div x = 2`. Negative control: `q = 1 + x₁` is not homogeneous, and
  `div (x q) = 2 + 3 x₁` is not a multiple of `q`.
- Negative control for normal traces: `(0, x₂²) ∈ P_2²` is not in RT_1, and its normal
  component on `x₁ + x₂ = 1` with `n = (1, 1)` is `x₂²`, of degree `2`.

### 4.2 Degrees of freedom

The degrees of freedom of `RT_k` on a cell `K` are the normal moments
`∫_F (v·n_F) q dμHE[d-1]` for `q ∈ P_k` on each facet `F`, and the moments `∫_K v·w` for
`w ∈ P_{k-1}^d` (none for `k = 0`), with the pointwise product `v·w` written `fieldDot v w`.
Ern–Guermond I, Definition 14.10, p. 164.

- **Unisolvence** (`eq_zero_of_raviartThomas_moments`): a field of `RT_k` whose degrees of
  freedom vanish is zero. Ern–Guermond I, Proposition 14.15, p. 166.
- **Canonical interpolant** (`exists_raviartThomas_interpolant`): for a `C¹` field `u` there is
  `v ∈ RT_k` with the degrees of freedom of `u`, and then `∫_K (div v) q = ∫_K (div u) q` for
  `q ∈ P_k`, so `div v` is the `L²(K)` projection of `div u` onto `P_k`. Ern–Guermond I,
  Lemma 16.2, p. 189. Existence follows from unisolvence and the dimension count; the commuting
  property is integration by parts on `K`, since `∇q ∈ P_{k-1}^d` and `q|_F ∈ P_k(F)`. With
  unisolvence the interpolant is unique.

*Needs:* 4.1; Mathlib's divergence theorem on a simplex for the commuting property.

**Checks.**

- The count `(d + 1) C(k + d - 1, d - 1) + d C(k + d - 1, d)` (with the second term `0` for
  `k = 0`) equals `dim RT_k` for `d = 1, 2, 3`, `k = 0, 1, 2`.
- `k = 0`, `d = 2`: three normal fluxes determine `v = a + c x`; on the reference triangle, unit
  flux through one facet and zero through the others gives the familiar basis function.
- Negative control: without the cell moments, `k = 1`, `d = 2` has `6` facet conditions for an
  `8`-dimensional space, so unisolvence fails.

### 4.3 The Nédélec space and the polynomial de Rham complex

`polyCurl` is the curl in three variables, and `nedelec k` is `P_k³ + S_{k+1}` with `S_{k+1}`
the homogeneous fields `q` of degree `k + 1` with `x · q = 0` (`xDot`). Ern–Guermond I,
Definition 15.5, p. 176.

- **Dimension** (`finrank_nedelec`): `dim N_k = (k + 1)(k + 3)(k + 4)/2`. Ern–Guermond I,
  Lemma 15.7, p. 176.
- **Exactness** (`polynomial_deRham_exact`): `P_{k+1} → N_k → RT_k → P_k → 0` under gradient,
  curl and divergence is exact, and the kernel of the gradient on `P_{k+1}` is the constants.
  Proof route: the curl-free fields of `N_k` are gradients of `P_{k+1}` (Ern–Guermond I,
  Lemma 15.10, p. 177); the divergence is onto `P_k` with divergence-free part in `P_k³`
  (Lemma 14.9, p. 164); exactness at `RT_k` follows from the dimension count, the alternating sum
  of the dimensions being `1`.

*Needs:* 4.1.

**Checks.**

- `dim N_0 = 6` and `dim N_1 = 20` (rank of the spanning set computed with sympy), and
  `dim N_2 = 45`.
- `k = 0`: dimensions `4, 6, 4, 1`, ranks of gradient, curl and divergence `3, 3, 1`; `k = 1`:
  dimensions `10, 20, 15, 4`, ranks `9, 11, 4`. Both sequences are exact, with alternating sum
  `1`.
- Negative control: without `S_{k+1}`, `k = 0`: `curl P_0³ = 0`, while the divergence-free part
  of RT_0 is the three-dimensional space of constants, so exactness fails at RT_0.

## Layer 5: the symmetric interior penalty method

On a mesh `M`, `brokenPoly M k` is the space of families of polynomials of degree at most `k`,
one per cell. `SimplicialMesh.neighbor` is the cell across a facet, if any; `faceWeight` is `1/2`
on interior and `1` on boundary facets; `jumpPoly` is the jump `[u] = u_i - u_j` (the trace on a
boundary facet), and `avgNormalDeriv` the average `{∇u · n}` (the one-sided value on a boundary
facet), with `n` the outward normal of cell `i`.

### 5.1 The method and its coercivity

`sipgForm M η₀ u v` is
`∑_K ∫_K ∇u·∇v - ∑_F ∫_F ({∇u·n}[v] + {∇v·n}[u]) + ∑_F (η₀/h_F) ∫_F [u][v]`, and
`sipgNormSq M v` is `∑_K ‖∇v‖²_K + ∑_F h_F⁻¹ ‖[v]‖²_F`. Ern–Guermond II, (38.4), p. 201, and
(38.7), p. 202. `HasGradTrace M k c` is the discrete trace inequality
`h_F ‖∇q · n‖²_F ≤ c² ‖∇q‖²_K` for `q ∈ P_k` on every facet `F` of every cell `K` (Ern–Guermond II,
(38.10), p. 203). `IsSipgSolution M k η₀ f u_h` is the discrete problem for `-Δu = f` with zero
boundary values. Statements assume `2 ≤ d`, since in one dimension a facet is a point and
`h_F = 0`.

- **Coercivity** (`sipgForm_coercive`): if `HasGradTrace M k c` and `η₀ > (d + 1) c²`, then
  `((η₀ - (d + 1) c²)/(1 + η₀)) sipgNormSq M v ≤ sipgForm M η₀ v v` for `v ∈ brokenPoly M k`.
  Ern–Guermond II, Lemma 38.6, p. 203, with `n_∂ = d + 1` faces per cell.
- **Well-posedness** (`existsUnique_isSipgSolution`): under the same hypotheses the discrete
  problem has a unique solution for every `f` integrable on each cell. Ern–Guermond II,
  Lemma 38.6, p. 203 (by Lax–Milgram); `sipgNormSq` is positive definite on `brokenPoly M k`
  because every connected union of cells has a boundary facet. Integrability makes the right
  side linear in the test function; without it a Bochner integral can be the junk value `0`.

*Needs:* GalerkinMethodsAndLagrangeFiniteElements §§2.1–2.2 (cells, meshes, conformity) and §1.1.

**Checks.**

- The scalar step: for `β² = (d + 1) c² < η₀` and `X, Y ≥ 0`,
  `X² - 2βXY + η₀Y² - α(X² + Y²) ≥ 0` with `α = (η₀ - β²)/(1 + η₀)`, because
  `(1 + β²)(η₀² + β²) - β²(1 + η₀)² = (η₀ - β²)²` (sympy): the quadratic form has diagonal
  `(1 + β²)/(1 + η₀)` and `(η₀² + β²)/(1 + η₀)` and determinant `(η₀ - β²)²/(1 + η₀)² ≥ 0`.
- A constant `v = c` on a single cell: the gradient terms vanish and
  `sipgForm M η₀ v v = η₀ · sipgNormSq M v`.
- Negative control: with `η₀ = 0`, on the reference triangle as a one-cell mesh, `v = x₁` gives
  `sipgForm M 0 v v = 1/2 - 2 · 1/2 = -1/2 < 0`, so the penalty threshold is needed.

### 5.2 Error estimates

- **Energy rate** (`exists_sipg_energy_rate`): for a shape-regular family, `1 ≤ s ≤ k`, there is
  a threshold `η` such that for every `η₀ > η` there is `C` with
  `√(sipgErrorSq (T n) u u_h) ≤ C h^s |u|_{H^{s+1}}` for the weak solution `u ∈ H¹₀ ∩ H^{s+1}`
  of `-Δu = f` (`TauCeti.PDE.IsWeakSolutionDirichlet` with the identity matrix). Ern–Guermond II,
  Theorem 38.10, p. 206, with `t = s`. Proof route: the threshold is `(d + 1) c²` for the
  constant `c` of the discrete trace inequality of GalerkinMethodsAndLagrangeFiniteElements §5.3,
  which depends on `σ` and `k` only; consistency (Ern–Guermond II, Lemma 38.2, pp. 201–202) and
  the second Strang lemma (GalerkinMethodsAndLagrangeFiniteElements §1.4) reduce the error to the
  cellwise approximation of SobolevPolynomialApproximation §4.1 in the augmented norm (38.15),
  p. 205.
- **`L²` rate** (`exists_sipg_L2_rate`): if moreover the Dirichlet Laplacian has `H²`
  regularity with constant `Creg` (`HasAdjointH2Regularity`), the broken `L²` error is at most
  `C h^{s+1} |u|_{H^{s+1}}`. Ern–Guermond II, Theorem 38.12, p. 207, with `s = 1` there.

*Needs:* 5.1; GalerkinMethodsAndLagrangeFiniteElements §§1.4, 5.3, 6.3;
SobolevPolynomialApproximation §4.1.

**Checks.**

- `u` a polynomial of degree at most `k` vanishing on `∂Ω`, such as `x₁(1 - x₁)x₂(1 - x₂)` on the
  unit square with `k ≥ 4`: consistency (Lemma 38.2) and uniqueness give `u_h = u` cellwise, so
  both errors are `0`.
- Negative control (`s ≤ k`): on the unit square cut into `2N²` right triangles, with
  `u = sin πx₁ sin πx₂` and `k = 1`, the energy error is at least the broken `L²` distance of
  `∇u` from piecewise constants, `0.5705, 0.2894, 0.1452, 0.0727` for `N = 4, 8, 16, 32`; times
  `N²` this is `9.13, 18.5, 37.2, 74.4`, so the rate `h²` claimed by `s = 2 > k` fails. Likewise
  the `L²` distance of `u` from broken `P₁`, `0.01949, 0.00495, 0.00124, 0.00031`, times `N³`
  doubles at each step, so `h³` fails.

## Layer 6: `H(div)` and mixed methods for diffusion

### 6.1 Weak divergence and conformity

`HasWeakDivergenceOn Ω g h` (IncompressibleFluids §1.1) says that `g : E d → E d` and `h` are
locally integrable on `Ω` and `∫ ⟪g, ∇φ⟫ = -∫ φ h` for every test function `φ` on `Ω`; `H(div)`
is the set of square integrable `g` with such an `h ∈ L²`. Through the duality of
`(d - 1)`-forms and vector fields it is the space `HΛ^{d-1}` of SobolevDifferentialForms §3.6.
`rtFamilies M k` is the global Raviart–Thomas space: a field of `RT_k` on each cell, with equal
normal components on the two sides of every interior facet.

- **Conformity** (`hasWeakDivergenceOn_of_mem_rtFamilies`): a field equal to a member `v` of
  `rtFamilies M k` on every open cell has the broken divergence of `v` as weak divergence on the
  mesh domain. Proof route: integrate by parts on each cell; the facet terms cancel in pairs by
  normal continuity, and test functions vanish near the boundary. Ern–Guermond II uses this
  conformity for the discrete problem (51.21), p. 387.

*Needs:* 4.1; for smooth fields Tau Ceti's
`TauCeti.HasWeakFDerivOn.integral_inner_gradient_eq_neg_integral_smul_trace`; the divergence
theorem on a simplex.

**Checks.**

- `g(x) = x` on `E d` has weak divergence `d`.
- `d = 1`: `rtFamilies M k` is the space of continuous piecewise polynomials of degree `k + 1`,
  and conformity is `H¹`-conformity of continuous piecewise polynomials.
- Negative control: on the unit square cut along a diagonal, a field equal to `e₁` on one
  triangle and `0` on the other has a jump in its normal component across the diagonal; its
  distributional divergence is a measure on the diagonal and not a function, so normal
  continuity cannot be dropped.

### 6.2 A commuting projection and the discrete inf-sup condition

- **Bounded commuting projection** (`exists_boundedCommutingProjection_div`): on a bounded
  Lipschitz polyhedral domain and a shape-regular family there are `C` and, for each mesh, a
  linear map `J_h` on `L²(Ω)^d` with `‖J_h‖ ≤ C`, values in the global `RT_k`, `J_h τ = τ` on
  the global `RT_k`, and `div J_h τ` the broken `L²` projection of `div τ` onto `P_k` whenever
  `τ ∈ H(div)`, that is, whenever `τ` has a weak divergence in `L²(Ω)`. Ern–Guermond I,
  Theorem 23.12, p. 296, for the case `p = 2` and the space `H(div)`.
- **Uniform discrete inf-sup** (`exists_raviartThomas_infSup`): there is `β > 0` such that every
  broken polynomial `q` of degree `k` admits `v ∈ rtFamilies (T n) k` with
  `‖v‖²_{L²} + ‖div v‖²_{L²} ≤ ‖q‖²` and `β ‖q‖² ≤ ∫ (div v) q`. Ern–Guermond II, Lemma 51.10,
  p. 387, and Remark 51.12, p. 388. Proof route: take `τ ∈ H(div)` with `div τ = q` and
  `‖τ‖_{H(div)} ≤ c ‖q‖` (Ern–Guermond II, Lemma 51.2, p. 381), then `v = J_h τ / C'` with the
  commuting property.

*Needs:* 6.1, 4.2; GalerkinMethodsAndLagrangeFiniteElements §2.2.

**Checks.**

- `d = 1`, `k = 0`: `q` piecewise constant, `v(x) = ∫_0^x q` is continuous and piecewise linear,
  with `div v = q`.
- `J_h` applied to a member of the global `RT_k` returns it, and its divergence is unchanged,
  consistent with the projection of `div τ ∈ P_k`.
- Negative control: the pair `RT_k × P_{k+1}` violates the inf-sup condition, since `div` maps
  `RT_k` into `P_k` and a broken polynomial of degree `k + 1` orthogonal to `P_k` on every cell
  is orthogonal to every `div v`.

### 6.3 The mixed method for a diffusion problem

`IsMixedPoissonSolution M k C g σ_h p_h` is the `RT_k × P_k` approximation of `σ + 𝒟∇p = 0`,
`div σ = g`, `p = 0` on the boundary, written with the compliance `C = 𝒟⁻¹`: for all `τ_h` and
q_h, `∫ (C σ_h)·τ_h - ∫ (div τ_h) p_h = 0` and `∫ (div σ_h) q_h = ∫ g q_h`. Ern–Guermond II,
(51.5) and (51.6), pp. 380–381, with `f = 0` and zero boundary data.

- The discrete divergence is exact: `div σ_h` is the broken `L²` projection of `g` onto `P_k`,
  because `div` maps the global `RT_k` into the broken `P_k` (4.1), so the second equation
  identifies it. Ern–Guermond II, Theorem 51.16 (i), pp. 388–389.
- **Error estimates** (`exists_mixedPoisson_rate`): for a symmetric uniformly positive bounded
  compliance, a bounded Lipschitz domain, a shape-regular family and `1 ≤ r ≤ k + 1`,
  `‖σ - σ_h‖ ≤ C h^r |σ|_{H^r}`, `‖div (σ - σ_h)‖ ≤ C h^r |div σ|_{H^r}` and
  `‖p - p_h‖ ≤ C h^r (|σ|_{H^r} + |p|_{H^r})`, with norms on `L²`. Ern–Guermond II,
  Theorem 51.16 (ii), pp. 388–389, for integer `r`, with the length scale `ℓ_Ω` absorbed into
  `C`. Proof route: Layer 2 with `K_h ⊆ ker B` (6.1, 6.2) and the approximation by `J_h` and by
  the broken `L²` projection.

*Needs:* 6.2, 2.2; SobolevPolynomialApproximation §4.1.

**Checks.**

- `g = 0`: `σ = 0`, `p = 0`, and `σ_h = 0`, p_h = 0.
- `d = 1`, `k = 0`, `C = 1` on `(0, 1)`, `p = x(1 - x)`: `σ = 2x - 1` lies in the global
  RT_0 (continuous piecewise linears), and `σ_h = σ` with p_h the cellwise mean of `p`; the
  `σ` error is `0` and the `p` error is `O(h)`, as for `r = 1`.
- Negative control: with pressures of degree `k + 1` the discrete inf-sup condition fails
  (6.2), and a broken polynomial of degree `k + 1` orthogonal to `P_k` on every cell can be added
  to p_h, so the discrete problem is not uniquely solvable.

## Layer 7: stable pairs for the Stokes problem

`w1pDiv v` is the divergence of a family of `d` functions in `H¹(Ω)`.
`IsUniformStokesStable Ω Vh Qh` is the uniform discrete inf-sup condition in lifting form for
velocities with components in `V_h` and the mean-zero pressures of `Q_h`. `bubbleSpace M` is the
space of cell bubbles, the functions that are polynomials of degree `d + 1` vanishing on the
facets of each cell.
`submoduleW1pOf` carries a space of functions into `W1p` as the sibling does for Lagrange
functions.

### 7.1 The continuous inf-sup condition

- **The divergence is onto `L²₀`** (`exists_divergence_rightInverse`): on a bounded connected
  Lipschitz domain there is `β > 0` such that every `q ∈ L²(Ω)` of mean zero is `div v` for some
  `v ∈ H¹₀(Ω)^d` with `β |v|_{H¹} ≤ ‖q‖`. Ern–Guermond II, Lemma 53.9, p. 409.

*Needs:* Tau Ceti's `W1p0`, `Set.IsLipschitzDomain`.

**Checks.**

- `d = 1`, `Ω = (0, 1)`: `v(x) = ∫_0^x q` vanishes at both ends because `q` has mean zero, and
  `β = 1`.
- Negative control: `q = 1` has no such `v`, because `∫ div v = 0` for `v ∈ H¹₀`; the mean-zero
  hypothesis is needed.

### 7.2 MINI and Taylor–Hood

- **MINI** (`isUniformStokesStable_mini`): for `d ≥ 2` and a shape-regular family, velocities in
  P_1 plus cell bubbles and continuous P_1 pressures are uniformly stable. Ern–Guermond II,
  Lemma 54.5, p. 425.
- **Taylor–Hood** (`isUniformStokesStable_taylorHood`): for `d ∈ {2, 3}`, continuous P_2
  velocities and continuous P_1 pressures are uniformly stable if the edges of each cell that
  are not contained in the boundary span `E d`. Ern–Guermond II, Lemmas 54.8 and 54.9, pp. 427
  and 429. The source asks for at least `d` internal edges in each cell; its proof uses `d`
  internal edges with linearly independent directions, which is the hypothesis here.
- The error estimates of the two pairs, of order `h` for MINI and `h²` for Taylor–Hood on smooth
  solutions, follow from Layer 2 and the Scott–Zhang estimates of
  GalerkinMethodsAndLagrangeFiniteElements §5.2. Ern–Guermond II, Remark 54.10, p. 429.

*Needs:* 7.1, 2.1; GalerkinMethodsAndLagrangeFiniteElements §§1.2, 4.2, 5.2.

**Checks.**

- One triangle as the mesh: MINI velocities are the two bubble fields, and for a linear `q` with
  `∇q ≠ 0`, `∫ div (b e_l) q = -∫ b ∂_l q ≠ 0`, so the pair is stable on that mesh.
- Negative control: on the same one-triangle mesh, P_2 velocities vanishing on the boundary are
  `0` while the mean-zero P_1 pressures form a two-dimensional space; all edges lie in the
  boundary, so the edge hypothesis of Taylor–Hood is needed.
- Negative control: P_1 velocities with P_1 pressures on one triangle also have only the zero
  velocity, so the bubbles of MINI are needed.

## Layer 8: subcomplexes and the discrete Poincaré inequality

A Hilbert complex in the sense of SobolevDifferentialForms §6.1 has, on the domain of `d` with
the graph norm, bounded differentials. A subcomplex is a family of closed subspaces with
`d V_hᵏ ⊆ V_hᵏ⁺¹`, and a cochain projection commutes with `d`. Ern–Guermond I, Lemma 16.16,
p. 197, gives the commuting canonical interpolants and its Theorem 23.12, p. 296, bounded
commuting projections onto the Lagrange, Nédélec and Raviart–Thomas spaces of shape-regular
families; Arnold, p. 56, defines bounded cochain projections.

### 8.1 The discrete Poincaré inequality

- **Discrete Poincaré inequality** (`norm_le_of_cochainProjection`): let `d : V₀ →L[ℝ] V₁` be
  bounded with `‖z‖ ≤ c_P ‖d z‖` on `(ker d)ᗮ`, let V_h⁰ ⊆ V₀ and V_h¹ ⊆ V₁ with
  `d V_h⁰ ⊆ V_h¹`, and let `π₀` map into V_h⁰ and `π₁` fix V_h¹, with `d ∘ π₀ = π₁ ∘ d`.
  Then `‖v‖ ≤ c_P ‖π₀‖ ‖d v‖` for every `v ∈ V_h⁰` orthogonal to the discrete kernel. Arnold,
  Theorem 5.3, p. 59. Proof route: let `z` be the component of `v` in `(ker d)ᗮ`; then `π₀ z - v`
  lies in the discrete kernel, so `‖v‖² = ⟪v, π₀ z⟫ ≤ ‖v‖ ‖π₀‖ c_P ‖d v‖`.
- With the inequality, a bounded cochain projection gives the inf-sup condition of the discrete
  mixed Hodge Laplacian with a constant depending only on `c_P` and `‖π₀‖` (Arnold, Theorem 5.4,
  p. 59); for the de Rham complex in degree `d - 1` this is the uniform inf-sup condition of 6.2.

*Needs:* Mathlib's orthogonal projection onto a closed subspace; SobolevDifferentialForms §7.4
for the Poincaré inequality of the `L²` de Rham complex on a bounded Lipschitz domain.

**Checks.**

- `V₀ = V₁ = ℝ`, `d = 2·id`, `c_P = 1/2`, V_h⁰ = V₀, `π₀ = π₁ = id`: equality `‖v‖ = ‖v‖`.
- `V₀ = ℝ²`, `V₁ = ℝ`, `d v = v₁`, V_h⁰ = span (e₁ + t e₂), `π₀ w = w₁ (e₁ + t e₂)`, `π₁ = id`:
  `c_P = 1`, `‖π₀‖ = √(1 + t²)` and `v = e₁ + t e₂` attains the bound, so the factor `‖π₀‖`
  cannot be dropped.
- Negative control (orthogonality to the discrete kernel): `V₀ = ℝ²`, `d v = v₁`, V_h⁰ = V₀,
  `π₀ = π₁ = id`: `v = e₂` lies in the discrete kernel, with `‖v‖ = 1` and `d v = 0`.

## Downstream consumers

- Finite element eigenvalue approximation: the Raviart–Thomas spaces and the commuting projection
  of 6.2 for mixed eigenvalue problems, and the bounds of Layer 2.
- Adaptive finite elements and a posteriori estimates for mixed and discontinuous Galerkin
  methods: the spaces of Layers 4–6 and the coercivity of 5.1.
- Time-dependent mixed and discontinuous Galerkin methods: the saddle-point theory of Layers 1
  and 2 and the SIPG form.
- Discretization of PDE-constrained optimization: the optimality system of Layer 3.
- Finite element exterior calculus beyond the polynomial de Rham complex, and Maxwell's
  equations: the discrete Poincaré inequality of Layer 8 and the Nédélec space of 4.3.

## Scope and ownership

This roadmap owns the abstract saddle-point theory (Babuška–Brezzi in Banach spaces and its
discrete form), the linear-quadratic control problem with its optimality system, the
Raviart–Thomas and Nédélec polynomial spaces and their degrees of freedom, the polynomial de
Rham complex, the symmetric interior penalty method on simplicial meshes, the global
Raviart–Thomas space with its `H(div)` conformity, the mixed method for diffusion, the continuous
and discrete Stokes inf-sup conditions for MINI and Taylor–Hood, and the discrete Poincaré
inequality of a subcomplex with a bounded cochain projection.

It does not build meshes, Lagrange spaces, the Banach–Nečas–Babuška theorem, Fortin's criterion,
the Strang lemmas, interpolation or discrete trace inequalities; those are
GalerkinMethodsAndLagrangeFiniteElements. It does not build Hilbert complexes, the Hodge
decomposition, closed range or the L² de Rham complex; those are SobolevDifferentialForms
§§6.1–7.4, and its Hodge decomposition gives directly that a complex with closed range is exact
exactly when its harmonic space vanishes. SobolevDifferentialForms excludes vector-field
proxies, so the global Raviart–Thomas space and its `H(div)` conformity are owned here, on the
weak divergence of IncompressibleFluids §1.1. Sobolev spaces and Lipschitz domains are Tau
Ceti's. Elliptic `H²` regularity is a hypothesis (5.2).

## Exact supplier contracts

### From GalerkinMethodsAndLagrangeFiniteElements

- Conventions: `E`, `evalₗ`, `polynomialsDegLE`, `toOrderL` and `seminorm`, copied verbatim.
- §1.1: the Banach–Nečas–Babuška theorem and coercive forms (1.1, 5.1).
- §1.2: discrete inf-sup, coercivity on subspaces and Fortin's criterion (2.1, 7.2).
- §1.4: the second Strang lemma (5.2).
- §2.1: `cellDiam`, `cellInball`, `cellOpen`, copied verbatim.
- §2.2: `SimplicialMesh` with `domain`, `domainOpens`, `meshSize`, `cellOpen_le_domainOpens`, and
  `IsShapeRegular`, copied verbatim.
- §§4.1–4.2: `lagrangeSpace`, `lagrangeSubmoduleW1p`, `lagrangeSubmoduleW1p0`, copied verbatim
  (Layer 7).
- §5.2: Scott–Zhang estimates (7.2); §5.3: the discrete trace inequality (5.2).
- §6.3: `HasAdjointH2Regularity`, copied verbatim (5.2).

### From SobolevDifferentialForms

- §3.6: the weak divergence as `d` in degree `n - 1` (6.1, in prose).
- §6.1: Hilbert complexes (Layer 8, in prose).
- §7.4: the Poincaré inequality on bounded Lipschitz domains (8.1).

### From IncompressibleFluids

- §1.1: `HasWeakDivergenceOn`, copied verbatim (Layer 6).

### From SobolevPolynomialApproximation

- §4.1: polynomial approximation on a convex cell (5.2, 6.3).

### From Mathlib

- **Functional analysis:** `NormedSpace.inclusionInDoubleDual`, `ContinuousLinearMap.flip`,
  `Metric.infDist`, `IsMinOn`, the lattice structure of `Lp`.
- **Polynomials:** `MvPolynomial.restrictTotalDegree`, `MvPolynomial.homogeneousSubmodule`,
  `MvPolynomial.pderiv`, `MvPolynomial.IsHomogeneous`,
  `MvPolynomial.IsHomogeneous.sum_X_mul_pderiv`.
- **Geometry and measure:** `Affine.Simplex.altitudeFoot`, `Affine.Simplex.height`,
  `MeasureTheory.Measure.euclideanHausdorffMeasure`, `convexHull`.

### From Tau Ceti

- **Sobolev spaces:** `TauCeti.W1p`, `TauCeti.W1p0`, `TauCeti.Wkp`, `TauCeti.W1p.value`,
  `TauCeti.W1p.gradient`, `TauCeti.Wkp.value`, `TauCeti.Wkp.firstOrder`,
  `TauCeti.HasWeakFDerivOn.integral_inner_gradient_eq_neg_integral_smul_trace`.
- **Domains and elliptic problems:** `Set.IsLipschitzDomain`, `TauCeti.PDE.UniformlyEllipticOn`,
  `TauCeti.PDE.IsWeakSolutionDirichlet`.

## Beyond this roadmap

The following material is recorded only to fix the boundary. Contributors should not attempt it
under this roadmap.

- Fractional Sobolev orders: the SIPG rates for `u ∈ H^{1+r}` with `r > 1/2` (Ern–Guermond II,
  (38.14), p. 204) and the Raviart–Thomas rates for `r ∈ (0, k + 1]`, which need fractional
  Sobolev spaces on domains.
- The sharp two-dimensional Taylor–Hood condition: for `k ≥ 2` the generalized pair is stable iff
  the triangulation has at least three triangles (Boffi–Brezzi–Fortin, Theorem 8.8.1,
  pp. 496–498).
- Vanishing of harmonic forms on simply connected domains with connected boundary and exactness
  of the continuous de Rham complex (Ern–Guermond I, Proposition 16.14, p. 196; Arnold, p. 38),
  which need the identification of harmonic forms with de Rham cohomology that
  SobolevDifferentialForms excludes.
- Global Nédélec spaces, `H(curl)`-conformity and exactness of the global discrete complex
  (Ern–Guermond I, Proposition 16.15, p. 196), and the full families `P_r Λ^k` and `P_r⁻ Λ^k`.
- Brezzi–Douglas–Marini elements, hybridization and postprocessing of mixed methods.
- Discretization of the control problem of Layer 3 and its error estimates.

## Prior formalization

[lean-NASC](https://github.com/bjbraams/lean-NASC) (commit 92a6dba, `NASC/Galerkin.lean`) proves
without `sorry` an abstract form of the quadratic inequality behind 5.1
(NASC.half_add_le_sipgForm: for families of vectors in an inner product space with the trace
bound `∑ h_F ‖a_F‖² ≤ c² G`, a penalty of at least `2c² + 1/2` gives coercivity with constant
`1/2`). Mathlib (commit `1b1ccf4`) and Tau Ceti (commit `2fd255d`) have no mixed, nonconforming or
discontinuous finite elements.

## References

- A. Ern and J.-L. Guermond, *Finite Elements I: Approximation and Interpolation*, Texts in
  Applied Mathematics 72, Springer, 2021. Cited as Ern–Guermond I.
- A. Ern and J.-L. Guermond, *Finite Elements II: Galerkin Approximation, Elliptic and Mixed
  PDEs*, Texts in Applied Mathematics 73, Springer, 2021. Cited as Ern–Guermond II.
- D. N. Arnold, *Finite Element Exterior Calculus*, CBMS-NSF Regional Conference Series in
  Applied Mathematics 93, SIAM, 2018. Cited as Arnold.
- D. Boffi, F. Brezzi and M. Fortin, *Mixed Finite Element Methods and Applications*, Springer
  Series in Computational Mathematics 44, Springer, 2013.
- M. Hinze, R. Pinnau, M. Ulbrich and S. Ulbrich, *Optimization with PDE Constraints*,
  Mathematical Modelling: Theory and Applications 23, Springer, 2009. Cited as Hinze et al.
