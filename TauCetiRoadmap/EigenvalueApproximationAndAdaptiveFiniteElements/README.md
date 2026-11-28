# Roadmap: Eigenvalue approximation and adaptive finite elements

**Summary.** This roadmap builds two parts of the numerical analysis of elliptic problems that go
beyond a priori error estimates for one source problem: the approximation of eigenvalues and
eigenvectors, and a posteriori error control with the adaptive algorithm it drives.
- solution operators of a coercive variational eigenproblem on a closed subspace, Galerkin
  orthogonality, the gap between subspaces, and the equivalence between convergence of a
  spectral approximation and norm convergence of the discrete solution operators;
- the Babuška–Osborn theory for norm-convergent approximations of a compact operator on a
  complex Banach space: absence of spurious modes, conservation of algebraic multiplicity, the
  gap of generalized eigenspaces and the eigenvalue error governed by the ascent;
- rates for symmetric problems: the double order of eigenvalue convergence, eigenvector error
  bounds, the exact quadratic Rayleigh quotient error, and rates for the Dirichlet Laplacian with
  Lagrange elements of any degree;
- residual a posteriori estimates: an abstract reliability lemma, global reliability and local
  efficiency of the residual estimator with data oscillation;
- equilibrated fluxes: the Prager–Synge identity, guaranteed upper bounds without unknown
  constants, and local flux equilibration in Raviart–Thomas spaces;
- the adaptive loop: contraction of a quasi-error under Dörfler marking and the optimal rate
  relative to an approximation class;
- variational inequalities and Γ-convergence: Falk's estimate, the piecewise linear obstacle
  problem, and Γ-convergence of conforming discretizations with convergence of almost minimizers.

The nearest roadmaps are [VariationalMethods](../VariationalMethods/README.md), whose compact form
pairs, Courant–Fischer principle and Ritz–Galerkin convergence are the qualitative theory that
this roadmap makes quantitative; GalerkinMethodsAndLagrangeFiniteElements, a family roadmap whose
meshes, Lagrange spaces, Galerkin solutions and regularity hypothesis this roadmap uses; and
MixedAndNonconformingFiniteElements, a family roadmap whose Raviart–Thomas spaces carry the
equilibrated fluxes. [EigenvalueIterations](../EigenvalueIterations/README.md) has the matrix
analogue of the Rayleigh quotient bound. The roadmap is a multi-source synthesis of Boffi's
survey in Acta Numerica, Ern–Guermond II, Verfürth's monograph on a posteriori estimates,
Brenner–Scott and Bartels (see [References](#references)). Headlines that restate a source result
cite a theorem, definition, section or equation number with its printed page; corollaries and
adaptations carry a proof route.

`Suggested.lean` states, against the pinned Mathlib and Tau Ceti, the headlines below that carry a
Lean name, each with every conclusion the README attaches to it, and the definitions those
statements need. It is not an exhaustive acceptance test; the headlines without a Lean name are
targets of the same standing, stated in prose.

Suggested home: `TauCeti/NumericalAnalysis/Eigenvalue/` for Layers 1–3 and
`TauCeti/NumericalAnalysis/FiniteElement/Adaptive/` for Layers 4–7.

## How to read the build

Layer 1 is Hilbert-space theory without meshes. A coercive compact form pair has a solution map
on every closed subspace; on a finite-dimensional subspace this map is the Galerkin solution
operator, and its eigenvalues are the reciprocals of the Ritz values of VariationalMethods §6.1.
Layer 1 measures distances between subspaces by the gap and proves that every reasonable notion
of convergence of discrete eigenpairs is equivalent to norm convergence of the solution
operators.

Layer 2 is the general theory on a complex Banach space, for operators that need not be
symmetric: under norm convergence the spectrum behaves continuously near every nonzero
eigenvalue. Layer 3 returns to symmetric problems, where the error of an eigenvalue is the square
of the error of its eigenspace, and specializes to the Dirichlet Laplacian with Lagrange elements.

Layers 4–6 concern one source problem, `-div(A ∇u) = f` with zero Dirichlet data, discretized by
Lagrange elements. Layer 4 bounds the error from above and below by computable cellwise
indicators; Layer 5 replaces the unknown constants of Layer 4 by an equilibrated flux; Layer 6
proves that refining the cells with large indicators converges, and at the best possible rate.
Layer 7 is independent of Layers 2–6: it treats discretizations of constrained and nonconvex
minimization problems.

The layers are in build order: each layer needs only earlier layers and the suppliers.

## Conventions

- **Form pairs.** A variational eigenproblem is `P : CompactFormPair ℝ V H`, the local copy of
  VariationalMethods §3.1: a compact, injective, dense inclusion `j = P.inclusion` and a bounded
  symmetric form `a = P.form`. Coercivity is an explicit hypothesis `α ‖u‖² ≤ P.energy u` with
  `0 < α`. The `n`-th eigenvalue, zero-based, nondecreasing and with multiplicity, is
  `P.rayleighMinMax ⊤ n`, and the `n`-th discrete eigenvalue of a subspace `L` is
  `P.rayleighMinMax L n` (VariationalMethods §4.4). For `n ≥ dim L` the latter is the junk value
  `0`; every statement about discrete eigenvalues holds eventually along a sequence of subspaces
  whose dimension tends to infinity.
- **Solution maps** are data: `IsSolutionMap P L S` says `S f ∈ L` and `a(S f, v) = ⟪f, j v⟫` for
  `v ∈ L`. The operator `T` of the sources is `j ∘ S₀` with `S₀` the solution map on `⊤`, and
  `T_n = j ∘ S_n`. Norm convergence is `‖j ∘ S₀ - j ∘ S_n‖ → 0` in `L(H)`.
- **Gaps.** `directedGap U W` is `sup {dist(u, W) : u ∈ U, ‖u‖ = 1}`, built on `Metric.infDist`,
  and `gap U W` is the larger of the two directed gaps; both lie in `[0, 1]`, and the directed gap
  from `U = 0` is `0`. In an inner product space this agrees with Tau Ceti's
  `Submodule.directedProjectionGap`. The gap is defined in any normed space because Layer 2 needs
  it in a Banach space.
- **Eigen-data.** `IsEigenbasis P b u eigenvalue` is a Hilbert basis `b` of `H` of images of
  form-domain eigenvectors with nondecreasing eigenvalues, as in VariationalMethods §4.4;
  `IsDiscreteEigenbasis P L w μ` is the same on a finite-dimensional `L`, for indices below
  `dim L`. `spanFirst P w N` is the span in `H` of the first `N` images.
- **Banach-space spectra.** For `T : X →L[ℂ] X` the algebraic eigenspace of `μ` is Mathlib's
  `Module.End.maxGenEigenspace`, and `clusterSpace T μ r` is the sum of these spaces over the
  eigenvalues of `T` in the open disc of radius `r` about `μ`. An isolated nonzero eigenvalue is
  given with a radius: `μ ≠ 0`, `0 < r` and `spectrum ℂ T ∩ closedBall μ r = {μ}`. On an
  infinite-dimensional space `0` lies in the spectrum of a compact `T`, so the disc then
  automatically misses `0`.
- **Meshes and finite element spaces** are the local copies of
  GalerkinMethodsAndLagrangeFiniteElements (its Conventions and §§2.1–6.3): `E d`,
  `SimplicialMesh d`, `cellDiam`, `cellInball`, `IsShapeRegular`, `HasConnectedStars`,
  `lagrangeSubmoduleW1p0 Ω 2 M k`, `IsGalerkinSolution`.
  Families of meshes cover one fixed open set: `(T n).domainOpens = Ω`.
- **Cell sizes.** The residual indicators and the adaptive layer weight a cell by
  `cellSize K = |K|^{1/d}`, not by its diameter: bisection halves the volume of a cell but need not
  reduce its diameter. Under shape regularity the two are comparable.
- **Polynomial pieces.** A finite element function is described on each cell by a polynomial
  `q i` with `W1p.value u_h = evalₗ d (q i)` almost everywhere on the closed cell; indicators are
  computed from the polynomials, so they involve no traces of Sobolev functions.
- **Fluxes.** An equilibrated flux `σ ∈ L²(Ω; ℝ^d)` has `div σ = f` in the weak sense on `H¹₀(Ω)`:
  `⟪σ, ∇v⟫ = -⟪f, v⟫` for every `v ∈ H¹₀(Ω)`. With this sign `σ = -∇u` is the exact flux, and the
  estimators measure `‖∇u_h + σ‖`.
- **Infinite values.** The approximation class quasi-norm `approxClassNorm` and the rate of 6.2
  are in `ℝ≥0∞`. Functionals of Layer 7 take values in `EReal`, with `⊤` off the admissible set.
- **Constants.** Every `∃ C` is quantified before meshes and functions, so `C` depends only on the
  listed parameters (`d`, degrees, `σ`, ellipticity constants, the eigenvalue at hand), except in
  Layers 1–3 where it may also depend on the fixed pair and the fixed sequence of subspaces.

## Layer 1: solution operators, gaps and convergence

### 1.1 Solution maps

- **Existence and uniqueness** (`existsUnique_isSolutionMap`): for a coercive pair and a closed
  subspace `L`, there is exactly one continuous linear `S : H → V` with `IsSolutionMap P L S`.
  Boffi, (7.1)–(7.4), pp. 46–47, for `L = V` and `L = V_h`. Proof route: Mathlib's Lax–Milgram
  theorem on the Hilbert space `L` applied to the functional `v ↦ ⟪f, j v⟫`, whose norm is at most
  `‖j‖ ‖f‖`.

Galerkin orthogonality `a(S₀ f - S f, v) = 0` for `v ∈ L` (Boffi, p. 50) is the form-pair
instance of GalerkinMethodsAndLagrangeFiniteElements §1.3; it says that `S` is the energy
projection onto `L` of `S₀`, so `T_h = P_h T`. It closes by unfolding and is the proved supporting
lemma `form_solutionMap_sub_eq_zero` of `Suggested.lean`, not a target.

*Needs:* Mathlib `IsCoercive.continuousLinearEquivOfBilin`.

**Checks.**

- `V = H = ℝ`, `j = id`, `a(u, v) = 2 u v`: `S f = f / 2` on `L = ⊤`, and `S = 0` on `L = 0`.
- Negative control: on `ℝ²` with `a(u, v) = u₁ v₁` (a valid pair with shift `1`, but not
  coercive), no map satisfies the predicate for `f = e₂`: `a(S f, e₂) = 0 ≠ 1 = ⟪e₂, e₂⟫`.
- On `ℝ²` with `a = diag(1, 4)` and `L = span e₀`, `S f = f₀ e₀` and `S₀ f - S f = (f₁ / 4) e₁`,
  which is `a`-orthogonal to `L`.

### 1.2 The gap between subspaces

- **The distance gap is the projection gap** (`directedGap_eq_directedProjectionGap`): in an
  inner product space, for subspaces with orthogonal projections,
  `directedGap U W = ‖P_{Wᗮ} P_U‖`, which is `Submodule.directedProjectionGap U W`. Boffi,
  definitions of `δ` and `δ̂`, p. 49; Ern–Guermond II, §48.1.1, p. 334. Proof route:
  `dist(u, W) = ‖P_{Wᗮ} u‖`, and the supremum over unit `u ∈ U` of `‖P_{Wᗮ} u‖` is the norm of
  `P_{Wᗮ} P_U`.

*Needs:* Tau Ceti `Submodule.directedProjectionGap`, `Submodule.directedProjectionGap_le_iff`.

**Checks.**

- `directedGap U W = 0` when `U ≤ W`; `directedGap U 0 = 1` for `U ≠ 0`; `directedGap 0 W = 0`.
- Negative control (the gap is not symmetric): `U = span e₁`, `W = ℝ²` give `δ(U, W) = 0` and
  `δ(W, U) = 1`, so `gap U W = 1`.
- Two lines in `ℝ²` at angle `θ`: both directed gaps are `sin θ`.
- `U = span(e₁, e₂)` and `W = span(e₁, (e₂ + e₃)/√2, e₄)` in `ℝ⁴`: the unit vector of `U` farthest
  from `W` is `e₂`, at distance `‖(e₂ - e₃)/2‖ = 1/√2`, and `‖P_{Wᗮ} P_U‖ = 1/√2` as well; in the
  other direction `e₄ ∈ W` is orthogonal to `U`, so `δ(W, U) = 1`.

### 1.3 Convergence of a spectral approximation

`EigenConverges P u eigenvalue V_n w μ` is Boffi's notion (7.7): for every `N ≥ 1` with
`λ_{N-1} < λ_N` (a cluster boundary), eventually `dim V_n ≥ N`, the first `N` discrete
eigenvalues converge to the first `N` eigenvalues, and the gap in `H` between `spanFirst P u N`
and `spanFirst P (w n) N` tends to `0`.

- **Convergence is norm convergence** (`eigenConverges_iff_tendsto_norm`): for finite-dimensional
  subspaces `V_n` with solution maps S_n and any discrete eigenbases, `EigenConverges` holds iff
  `‖T - T_n‖ → 0`. Boffi, Proposition 7.4, p. 50, with no density hypothesis on the `V_n`. Proof
  route: `T` and `T_n` are `H`-self-adjoint with `T - T_n ≥ 0`
  (`⟪(T - T_n) f, f⟫ = a((S₀ - S_n) f, (S₀ - S_n) f)`); one direction splits `f` along the first
  `N` eigenvectors, the other is the min–max characterization of both spectra.
- **Pointwise convergence suffices** (`tendsto_norm_of_tendsto_apply`): if `T_n f → T f` in `H`
  for every `f`, then `‖T - T_n‖ → 0`. Boffi, Proposition 7.6, pp. 50–51, which assumes `T`
  compact from `H` to `V` and the energy projections strongly convergent to the identity from `V`
  to `H`; here the hypothesis is on `T_n`. Proof route: the compactness is automatic
  (`S₀ = A⁻¹ j*` with `j*` compact); the identity above gives S_n f → S₀ f in `V`, the energy
  projections are uniformly bounded, and uniform convergence on the compact image of the unit
  ball follows.
- **Ritz values converge** (no Lean name; VariationalMethods §6.1): for nested subspaces with
  dense union, `P.rayleighMinMax V_n k → P.rayleighMinMax ⊤ k`. Consumed, not restated.

*Needs:* 1.1, 1.2; VariationalMethods §§4.4, 6.1.

**Checks.**

- Weighted pair `a(u, v) = Σ (k+1)² u_k v_k` on `ℓ²` (VariationalMethods §6.1) with
  `V_m = span{e₀, …, e_{m-1}}`: `T_m` is `T` on the first `m` modes and `0` after,
  `‖T - T_m‖ = 1/(m+1)² → 0`, and the discrete eigenvalues are exactly `1, 4, …, m²`.
- Negative control (density): V_m = span{e₁, …, e_m} gives T_m e₀ = 0 and `‖T - T_m‖ ≥ 1`;
  the first discrete eigenvalue is `4`, not `1`, so `EigenConverges` fails as well.
- `IsSolutionMap`, `IsDiscreteEigenbasis` and `spanFirst` on V_1 = span{e₀ + e₁} of the weighted
  pair: the Ritz value is `5/2`, S_1 f = (f₀ + f₁)/5 · (e₀ + e₁), and `spanFirst` is the line of
  `e₀ + e₁`.

## Layer 2: norm-convergent approximation of a compact operator

Throughout, `X` is a complex Banach space, `T` is compact and `T_n → T` in operator norm. The
sources assume `T_n` compact; the statements below do not, since the Riesz projections of `T_n`
for the circle of radius `r` about `μ` converge in norm to that of `T` and so have the same finite
rank for large `n` (proof route for both subsections).

### 2.1 Spurious modes and multiplicity

- **No spurious modes** (`eventually_subset_resolventSet`): a compact subset of the resolvent set
  of `T` lies in the resolvent set of `T_n` for all large `n`. Boffi, Theorem 9.1, pp. 59–60. No
  compactness of `T` is used.
- **Conservation of algebraic multiplicity** (`eventually_sum_finrank_maxGenEigenspace_eq`): for
  an isolated nonzero eigenvalue `μ`, for all large `n` the eigenvalues of `T_n` in the disc of
  radius `r` about `μ` are finitely many and the dimensions of their algebraic eigenspaces add up
  to that of `μ`. Boffi, Theorem 9.1, p. 60; Ern–Guermond II, §48.1.1, p. 334.

*Needs:* Mathlib `spectrum`, `resolventSet`, `IsCompactOperator`, `Module.End.maxGenEigenspace`.

**Checks.**

- `T = diag(2, 2, 5)` on `ℂ³`, `T_n = diag(2, 2 + 1/n, 5)`, `μ = 2`, `r = 1/2`: for `n ≥ 3` the
  disc contains `2` and `2 + 1/n`, with multiplicities `1 + 1 = 2`; `clusterSpace (T_n) 2 (1/2)`
  is `span{e₀, e₁}` for every `n ≥ 3`.
- Negative control (strong convergence is not enough): `T = diag(1, 1/2, 1/3, …)` on `ℓ²` and
  `T_n` equal to `T` except that its `n`-th diagonal entry is `3/10`. Then `T_n → T` pointwise but
  `‖T - T_n‖ = |1/(n+1) - 3/10| → 3/10`, and `3/10` is an eigenvalue of every `T_n` while the
  spectrum of `T` stays at distance `1/30` from it: a spurious mode.
- Negative control (`μ ≠ 0`): `T = 0` on `ℓ²` and `T_n = (1/n) diag(1, 1/2, 1/3, …)` converge in
  norm, and `spectrum ℂ T ∩ closedBall 0 1 = {0}`; but every `T_n` has infinitely many eigenvalues
  in the disc, so the finiteness conjunct fails at `μ = 0`.

### 2.2 Rates in a Banach space

- **Gap of generalized eigenspaces** (`exists_gap_clusterSpace_le`): with `G_μ` the algebraic
  eigenspace of `μ`, `gap G_μ (clusterSpace (T_n) μ r) ≤ c ‖(T - T_n)|_{G_μ}‖` for all large `n`.
  Boffi, Theorem 9.3, p. 62; Ern–Guermond II, Theorem 48.1, p. 334.
- **Eigenvalue error and the ascent** (`exists_norm_sub_le_rpow_ascent`): if
  `G_μ = ker (T - μ)^α` with `α ≥ 1`, every eigenvalue `ν` of `T_n` in the disc satisfies
  `|μ - ν| ≤ c ‖(T - T_n)|_{G_μ}‖^{1/α}` for all large `n`. Boffi, Theorem 9.7, pp. 62–63;
  Ern–Guermond II, Theorem 48.2, (48.6), pp. 334–335. Proof route: both terms inside the bracket
  of the sources are bounded by a constant times `‖(T - T_n)|_{G_μ}‖`, because the dual basis and
  `‖T* - T_n*‖` are bounded.
- **Arithmetic mean** (no Lean name): the mean of the `m` eigenvalues of `T_n` near `μ` converges
  at the rate `‖(T - T_n)|_{G_μ}‖` without the exponent `1/α`, up to a product term. Boffi,
  Theorem 9.5, p. 62; Ern–Guermond II, Theorem 48.2, (48.5), p. 334.

*Needs:* 2.1, 1.2.

**Checks.**

- Jordan block: `T = [[2, 1], [0, 2]]`, `T_n = T + ε_n E₂₁`. Here `α = 2`,
  `‖(T - T_n)|_{G_μ}‖ = ε_n` and the eigenvalues of `T_n` are `2 ± √ε_n`, so `|μ - ν| = √ε_n`:
  the exponent `1/2` is attained (`ε = 10⁻², 10⁻⁴, 10⁻⁶` give `0.1, 0.01, 0.001`).
- Negative control (the ascent hypothesis): `α = 1` violates `hasc`, since
  `ker (T - 2) = span e₀ ≠ ℂ²`, and the conclusion with exponent `1` fails as well:
  `√ε_n ≤ c ε_n` is false for `ε_n < 1/c²`.
- `T_n = T` gives both sides `0`; the hypothesis `hasc` holds for every `α` at least the ascent.

## Layer 3: rates for symmetric problems

`formEigenspace P λ` is `{u | a(u, v) = λ ⟪j u, j v⟫ for all v}`. Lower bounds `λ ≤ λ_h` for the
discrete eigenvalues are monotonicity of the min–max values in the subspace, VariationalMethods
§4.4.

### 3.1 Double order

- **Eigenvalue error** (`rayleighMinMax_le_add_sq_directedGap`): under norm convergence, for every
  `k`, `λ_n^{(k)} ≤ λ^{(k)} + C δ(E, V_n)²` for all large `n`, with `E` the eigenspace of `λ^{(k)}`
  and the directed gap in the norm of `V`. Boffi, Theorem 9.12, p. 64, derived there from
  Corollary 9.8, (9.5), p. 63.
- **Eigenvector error** (`exists_mem_span_norm_sub_le`): if `λ_i = λ_k` exactly for
  `k ≤ i < k + m`, then for all large `n` every `u ∈ E` has `v` in the span of the discrete
  eigenvectors `k, …, k + m - 1` with `‖u - v‖ ≤ C δ(E, V_n) ‖u‖`. Boffi, Theorem 9.13, p. 64, and
  Corollary 9.4, p. 62.
- **The Rayleigh quotient error is quadratic** (`rayleigh_error_eq_quadratic`): for an
  eigenvector `u` with eigenvalue `λ` and any `v` with `‖j v‖ = 1`,
  `q(v) - λ = q(v - u) - λ ‖j(v - u)‖²`. Boffi, identity on p. 68, with `v = u_h`; the form-domain
  analogue of EigenvalueIterations §3.1. Proved in `Suggested.lean`.

*Needs:* 1.1–1.3; 2.2, after complexification, for the eigenvector error; VariationalMethods
§4.4.

**Checks.**

- `a = diag(1, 4)` on `ℝ²`, `j = id`, `u = e₀`, `λ = 1`, `v = (cos t, sin t)`: both sides of the
  Rayleigh identity equal `3 sin² t`.
- 1D Laplacian on `(0, 1)`, P1 on `N` uniform cells: `λ_h^{(0)} − π²` = 0.127476, 0.031749,
  0.007930, 0.001982 for `N = 8, 16, 32, 64` (ratio 4.0), and `(λ_h - λ)/δ² → π²` (9.970, 9.894,
  9.875, 9.871) with `δ` the relative `H¹` interpolation error of `sin πx`.
- `formEigenspace` of the weighted pair: `λ = 4` gives the line of `e₁`, `λ = 2` gives `0`.
- Negative control (the whole cluster): `a = diag(1, 1, 4)` on `ℝ³` and `V_n = ℝ³`, with
  discrete eigenvectors `e₀, e₁, e₂`. With `k = 0` and `m = 1` the span of `e₀` misses
  `e₁ ∈ E(1)` at distance `1`, which is why `hkm` asks for the full multiplicity `m = 2`.

### 3.2 The Dirichlet Laplacian with Lagrange elements

`IsDirichletLaplacePair P` says that `P` is the pair of the Dirichlet Laplacian on `Ω`:
`V = H¹₀(Ω)`, `H = L²(Ω)`, `j` the value map and `a(u, v) = ∫ ∇u · ∇v`. Regularity of the
eigenspace is a hypothesis: every eigenfunction of `λ^{(l)}` lies in `H^{s+1}(Ω)`, `1 ≤ s ≤ k`.

- **Eigenvalue rate** (`exists_dirichletEigenvalue_rate`): on a shape-regular family with
  connected vertex stars and mesh size `h → 0`, Lagrange elements of degree `k` give
  `λ_h^{(l)} ≤ λ^{(l)} + C h^{2s}` for all large `n`. Boffi, Theorem 10.4, p. 67;
  Ern–Guermond II, Theorem 47.10, p. 326. Proof route: 3.1 with the Scott–Zhang estimate of
  GalerkinMethodsAndLagrangeFiniteElements §5.2 for `δ(E, V_n) ≤ C h^s`.
- **Eigenfunction rate in `H¹`** (`exists_dirichletEigenfunction_H1_rate`): with a cluster of
  multiplicity `m` as in 3.1, `‖∇(u - v)‖ ≤ C h^s ‖u‖_{L²}`. Boffi, Theorem 10.3, p. 67.
- **Eigenfunction rate in `L²`** (`exists_dirichletEigenfunction_L2_rate`): adding `H²`
  regularity of the source problem (`HasAdjointH2Regularity`), `‖u - v‖_{L²} ≤ C h^{s+1} ‖u‖_{L²}`.
  Boffi, Theorem 10.5, p. 68. Proof route: Corollary 9.4 of Boffi in `H`, with the Aubin–Nitsche
  bound `‖(T - T_h) f‖_{L²} ≤ C h ‖(T - T_h) f‖_{H¹}` of GalerkinMethodsAndLagrangeFiniteElements
  §6.3.

*Needs:* 3.1; GalerkinMethodsAndLagrangeFiniteElements §§2.2, 4.2, 5.2, 6.3.

**Checks.**

- `(0, 1)`, P1, uniform mesh: the discrete eigenvalues are
  `(6/h²)(1 - cos mπh)/(2 + cos mπh)`, Ern–Guermond II, Example 47.13, p. 328; at `N = 8` this is
  `9.997081, 41.546568, 99.488484` against `π², 4π², 9π²`, errors `0.1275, 2.068, 10.66`, and the
  errors fall by `4.0` per halving (`s = k = 1`).
- Higher modes converge more slowly: the error of `λ^{(2)}` at `N = 64` (0.1606) exceeds that of
  `λ^{(0)}` at `N = 8`, consistent with `C` depending on `l`.
- Negative control (`s ≤ k`): the eigenfunctions `sin mπx` of the interval lie in every `H^{s+1}`,
  but P1 elements (`k = 1`) give the rate `h²` and not `h⁴`: the errors `0.12748` and `0.03175` of
  `λ^{(0)}` at `N = 8, 16` (from the formula above) have ratio `4.0`, not `16`, so `s = 2` fails.

## Layer 4: residual a posteriori estimates

On a mesh `M` with a piecewise constant symmetric coefficient `D i` on cell `i`, a finite element
function given by polynomials `q i` has the residual indicator
`η_K² = |K|^{2/d} ‖f + div(D_K ∇q_K)‖²_{L²(K)} + |K|^{1/d} Σ_F ‖[D ∇q] · n‖²_{L²(F)}`
(`residualIndicatorSq`, with the polynomial flux `D_K ∇q_K` written `polyFlux`), with the sum over
the facets of `K` and the jump zero on boundary facets
(`normalFluxJump`, built on the local copy `SimplicialMesh.neighbor`). `dataOsc l K f` is
`inf_{p ∈ P_l} ‖f - p‖²_{L²(K)}`; `facetPatch M i` is cell `i` with its facet neighbours.

### 4.1 Abstract reliability

*Needs:* nothing beyond Mathlib (Cauchy–Schwarz in `ℝⁿ`).

- **Weighted residuals** (`norm_error_le_of_weighted_residuals`): if `a(e, v) = Σᵢ ⟪rᵢ, zᵢ(v)⟫`
  with `Σᵢ ‖zᵢ(v)‖²/wᵢ ≤ C² ‖v‖²` and `a` is coercive with constant `α`, then
  `‖e‖ ≤ (C/α) (Σᵢ wᵢ ‖rᵢ‖²)^{1/2}`. The abstract core of Ern–Guermond II, Theorem 34.12, p. 146,
  and Verfürth, Theorem 1.5, pp. 15–16. Proved in `Suggested.lean`.

**Checks.**

- `V = H = ℝ`, `a(e, v) = 2 e v`, `e = 3`, one term with `r = 6`, `z(v) = v`, `w = 1`, `C = 1`:
  `‖e‖ = 3 = (1/2) · 6`, equality.
- `n = 0`: the representation forces `a(e, e) = 0`, so `e = 0`, and the bound is `0 ≤ 0`.
- Negative control (coercivity): with `a = 0` on `ℝ` the representation holds with `r = 0` for
  every `e`, and `‖e‖ ≤ 0` fails for `e ≠ 0`; the hypothesis `α > 0` excludes this.

### 4.2 The residual estimator

- **Reliability** (`exists_residual_reliability`): for a uniformly elliptic coefficient that is
  constant on each cell, a shape-regular mesh with connected stars and the Galerkin solution of
  degree `k ≥ 1`, `‖∇(u - u_h)‖² ≤ C Σ_K η_K²`. Ern–Guermond II, (34.10)–(34.11) and
  Corollary 34.14, pp. 146–148; Verfürth, Theorem 1.5, pp. 15–16. Proof route: 4.1 with `rᵢ` the
  cell and facet residuals, `zᵢ(v)` the restrictions of `v - I v` for the Scott–Zhang operator of
  GalerkinMethodsAndLagrangeFiniteElements §5.2, and the discrete trace inequality of its §5.3.
- **Local efficiency** (`exists_residual_efficiency`): for any `u_h ∈ H¹₀(Ω)` that is a polynomial
  of degree at most `k` on each cell,
  `η_K² ≤ C Σ_{K' ∈ ω_K} (‖∇(u - u_h)‖²_{K'} + |K'|^{2/d} dataOsc (k - 1) K' f)`, with `ω_K` the
  cells sharing a facet with `K`. Ern–Guermond II, Theorem 34.19, (34.22), p. 151; Verfürth,
  Theorem 1.5, p. 16. With a piecewise constant coefficient the facet oscillation vanishes and
  the cell oscillation is that of `f` alone.

*Needs:* 4.1; GalerkinMethodsAndLagrangeFiniteElements §§2.2, 4.2, 5.2, 5.3, 6.1.

**Checks.**

- `(0, 1)`, `u = sin πx`, P1 on `N` uniform cells (the Galerkin solution is the interpolant):
  `‖u' - u_h'‖² / Σ η_K² = 0.02912, 0.02811, 0.02786, 0.02780, 0.02778` for
  `N = 4, …, 64`; both constants are uniform in `h`.
- `cellSize`: an interval of length `h` has `cellSize = h`; the equilateral triangle of side `1`
  has `cellSize = (√3/4)^{1/2} = 0.6580`; bisection divides `cellSize` by `2^{1/d}`.
- Negative control (why `cellSize`): bisecting the equilateral triangle of side `1` through a
  vertex gives triangles with sides `1, 1/2, √3/2`, of diameter `1`; a diameter-weighted
  indicator would not decrease on refinement.
- `dataOsc`: zero for `f ∈ P_l`; `f(x) = x` on `[0, 1]` with `l = 0` gives `1/12`.
- `residualIndicatorSq` for `d = 1`: the facet integrals are point values (`μHE[0]` is the
  counting measure), `η_K² = h² ‖f‖²_K + h (|[u_h']|²_{left} + |[u_h']|²_{right})`.

## Layer 5: equilibrated fluxes

### 5.1 The Prager–Synge identity

- **Prager–Synge** (`norm_sub_sq_add_norm_add_sq_eq_of_equilibrated`): for the weak solution of
  `-Δu = f` in `H¹₀(Ω)` and any flux with `div σ = f`,
  `‖∇u - ∇u_h‖² + ‖∇u + σ‖² = ‖∇u_h + σ‖²` for every `u_h ∈ H¹₀(Ω)`. Verfürth, Proposition 1.40,
  p. 48; Ern–Guermond II, Exercise 52.6, p. 404. Proved in `Suggested.lean`. Since `σ = -∇u` is
  equilibrated by the weak equation, `‖∇(u - u_h)‖` is the minimum of `‖∇u_h + σ‖` over the
  equilibrated fluxes.

*Needs:* Tau Ceti `TauCeti.PDE.IsWeakSolutionDirichlet`,
`TauCeti.PDE.energyFormH1_one_zero_zero_eq_inner`.

**Checks.**

- `(0, 1)`, `u = sin πx`, `u_h` the P1 interpolant on 4 cells, `σ = -π cos πx + c`: both sides
  equal `0.2485107` for `c = 0` and `0.7385107` for `c = 0.7`.
- `u_h = u`: the identity reads `‖∇u + σ‖² = ‖∇u + σ‖²`.
- Negative control (sign): `σ = +∇u` is not equilibrated (`div σ = -f`), and for it the identity
  fails at `u_h = 0`: `‖∇u‖² + 4 ‖∇u‖² ≠ ‖∇u‖²`.

### 5.2 Guaranteed bounds and local equilibration

- **Guaranteed upper bound** (`norm_gradient_sub_le_of_cellMeans`): if `div σ = g` where `g` has
  the cell means of `f`, then
  `‖∇(u - u_h)‖ ≤ (Σ_K (‖∇u_h + σ‖_K + (h_K/π) ‖f - g‖_K)²)^{1/2}`, with no unknown constant.
  Ern–Guermond II, Lemma 52.13, (52.23), pp. 402–403. The factor `h_K/π` is the
  Poincaré constant of a convex cell for mean-zero functions.
- **Local flux equilibration** (`exists_equilibratedFlux`): for the Laplacian, the Galerkin
  solution of degree `k ≥ 1` and `l ≥ k - 1`, there is a Raviart–Thomas flux `τ ∈ rtFamilies M l`
  whose divergence has the `P_l` moments of `f` on every cell, with
  `‖τ + ∇u_h‖²_K ≤ C Σ_{K'} (‖∇(u - u_h)‖²_{K'} + h_{K'}² dataOsc l K' f)` over the cells `K'`
  sharing a vertex with `K`. Ern–Guermond II, Theorem 52.6, p. 400, and Lemma 52.9, (52.19),
  p. 401. Combined with the first bullet this gives a guaranteed and locally efficient estimator
  (Ern–Guermond II, Lemma 52.12, p. 402, and Remark 52.14, p. 403).

*Needs:* 5.1; MixedAndNonconformingFiniteElements §§4.1, 6.1 (the Raviart–Thomas spaces and their
conformity in `H(div)`); GalerkinMethodsAndLagrangeFiniteElements §§2.2, 6.1.

**Checks.**

- `(0, 1)`, `u = sin πx`, P1 on `N` cells, `σ` continuous piecewise linear with `σ'` the cell mean
  of `f` and the free constant fitted: the bound over the error is `1.208, 1.090, 1.042, 1.020`
  for `N = 4, 8, 16, 32`, at least `1` as required and tending to `1`.
- `g = f` (exact equilibration): the oscillation term vanishes and the bound is Prager–Synge.
- Negative control (the cell means): `(0, 1)` with two cells of length `1/2`, `f = 1`, `u_h = 0`,
  `σ = 0` and `g = 0`, so `div σ = g` but the means differ: the right side is
  `1/(2π) = 0.159`, below `‖u'‖ = 1/√12 = 0.289` for `u = x(1 - x)/2`.
- `vertexPatch` contains `facetPatch` for a conforming mesh; on two triangles sharing only a
  vertex the facet patch of each is a single cell and the vertex patch has both.

## Layer 6: adaptive finite elements

The loop is solve, estimate, mark, refine. `IsRefinement M M'` says that `M'` covers the same
region and every cell of `M'` lies in a cell of `M`; for conforming meshes the Lagrange spaces are
then nested. A marked cell is refined so that each subcell has at most half its volume, as one
bisection does. Dörfler marking with parameter `θ ∈ (0, 1]` selects a set of cells carrying at
least `θ²` of the total squared estimator. Ern–Guermond II, Algorithm 34.1, p. 152, and (34.23),
p. 153; Brenner–Scott, (9.5.16)–(9.5.17), p. 258; Verfürth, §1.14, p. 58.

### 6.1 Contraction

*Needs:* 4.2; GalerkinMethodsAndLagrangeFiniteElements §§4.2, 5.3, 6.1.

- **Abstract contraction** (`exists_adaptive_error_contraction`): reliability `e_j ≤ R η_j`,
  quasi-orthogonality `e_{j+1} + s_j ≤ e_j` and estimator reduction `η_{j+1} ≤ q η_j + C s_j`
  with `0 ≤ q < 1` give `γ > 0` and `ρ ∈ (0, 1)` with
  `e_{j+1} + γ η_{j+1} ≤ ρ (e_j + γ η_j)`. The abstract core of the contraction (34.25) of
  Ern–Guermond II, §34.4, p. 154; it holds for any nonnegative sequences and is applied below to
  squared errors and squared estimators. Proved in `Suggested.lean`, with `γ = 1/(1 + C)`.
- **Contraction of the adaptive loop** (`exists_dorfler_contraction`): for a symmetric piecewise
  constant uniformly elliptic coefficient, shape-regular nested meshes with connected stars,
  Dörfler marking and halving of marked cells, the quasi-error
  `‖∇(u - u_n)‖² + γ Σ_K η_K²` contracts by `ρ < 1` at every step, with `ρ` and `γ` depending only
  on `d`, `k`, `σ`, the ellipticity constants and `θ`. Ern–Guermond II, (34.25), p. 154;
  Brenner–Scott, Theorem 9.5.18, (9.5.19), p. 259, for the error plus oscillation. Proof route:
  the abstract contraction with `e_j` the squared energy error, `s_j = ‖∇(u_{j+1} - u_j)‖²`
  (Pythagoras for nested spaces), and estimator reduction from Dörfler marking, the volume
  reduction on marked cells and an inverse estimate (Brenner–Scott, Lemma 9.5.14, p. 257, for the
  oscillation analogue).
- **Plain convergence** (no Lean name): for a general class of markings, among them the maximum
  and the equilibration strategies, and refinements that subdivide every marked cell at least
  once, `‖∇(u - u_n)‖ → 0` and `η_n → 0`, without rates, in a framework that covers the
  conforming discretizations of this layer. Verfürth, Theorem 4.84, p. 269, and §4.13.3,
  p. 268.

**Checks.**

- Abstract lemma with `R = 1`, `q = 1/2`, `C = 1`: `γ = 1/2`, `δ = 1/12`, `ρ = 11/12`.
- `(0, 1)`, `u = x^{1.6}(1 - x)`, P1, `θ = 1/2`, `γ = 0.05`, bisection of marked cells: the
  quasi-error ratios over 13 steps lie in `[0.647, 0.813]`.
- Negative control (`θ > 0`): with `θ = 0` the empty set is a Dörfler set, nothing is refined and
  the quasi-error is constant, so no `ρ < 1` exists.

### 6.2 Optimal rate

`approxClassNorm s 𝒯 M₀ k y` is `sup_N N^s inf {‖∇(y − v)‖ : v ∈ V_k(M), M ∈ 𝒯, #M ≤ #M₀ + N}`
in `ℝ≥0∞`, over an admissible class `𝒯` of refinements of the initial mesh; it is
Pietsch's quasi-norm with `q = ∞` for the scheme of adaptive finite element spaces.

- **Optimal rate** (`exists_adaptive_optimal_rate`): for the Poisson problem with `f` piecewise
  polynomial of degree `k - 1` on the initial mesh, Dörfler marking with `θ` below a threshold
  `θ₀`, marked sets of cardinality within a factor `cMark` of the smallest Dörfler set, an
  admissible class with finitely many meshes of each size, the overlay property
  `#(M ⊕ M') + #M₀ ≤ #M + #M'`, and the cumulative closure estimate
  `#T_{n+1} - #T_0 ≤ cRef Σ_{m ≤ n} #marked_m`, the error satisfies
  `‖∇(u - u_n)‖ ≤ C |u|_{A_s} (#T_n - #T_0)^{-s}` for `n ≥ 1`. Ern–Guermond II, §34.4,
  (34.26)–(34.28), pp. 154–155, which reports the theorem of Cascón, Kreuzer, Nochetto and
  Siebert; the closure and overlay estimates for newest-vertex bisection are hypotheses here.
  The exponent in (34.28) is printed as `-1/s`; the rate is `-s`.

*Needs:* 6.1, 4.2 (efficiency gives the discrete lower bound used for optimality of marking).

**Checks.**

- `approxClassNorm` of a `y ∈ V_k(M₀)` is `0`; the `N = 0` term is `0^s · inf = 0` for `s > 0`.
- `#T_n = #T_0` makes the right side `C |u|_{A_s} · ⊤`, which is `⊤` unless `|u|_{A_s} = 0`, in
  which case `u` lies in `V_k(T_0)` and the error is `0` (`0 · ⊤ = 0` in `ℝ≥0∞`).
- Negative control (the exponent of (34.28)): `u = x(1 - x)/2` on `(0, 1)` with P1. On a mesh
  with cells of lengths `h_K` the best error is `(Σ h_K³/12)^{1/2} ≥ 1/(√12 #M)`, with equality
  for the uniform mesh (`0.28868, 0.14434, 0.07217` for `#M = 1, 2, 4`). So `|u|_{A_{1/2}}` is
  finite, and the stated rate `(#T_n - #T_0)^{-1/2}` is consistent with the lower bound
  `1/(√12 #T_n)`, while the printed exponent `-1/s = -2` would claim `(#T_n - #T_0)^{-2}`, below
  it for large `#T_n`.

## Layer 7: variational inequalities and Γ-convergence

### 7.1 Falk's estimate and the obstacle problem

*Needs:* Mathlib `ContinuousLinearMap.opNorm`; Tau Ceti `TauCeti.W1p0`, `TauCeti.Wkp`;
GalerkinMethodsAndLagrangeFiniteElements §§4.2, 5.1 for the P1 rate.

- **Falk's estimate** (`falk_obstacle_error_le`): for a coercive bounded form `A` on a normed
  space, solutions `u` of the variational inequality on `K` and `u_h` on a possibly nonconforming
  `K_h`, and any `v ∈ K`, `v_h ∈ K_h`,
  `(α/2) ‖u - u_h‖² ≤ ‖Au - f‖ (‖u_h - v‖ + ‖u - v_h‖) + (‖A‖²/2α) ‖u - v_h‖²`. Bartels,
  Theorem 5.7, p. 138; Remark 5.4, p. 139, for `K_h ⊆ K`. Proved in `Suggested.lean`.
- **With a pivot space** (`falk_obstacle_error_le_of_pivot`): if `Au - f = ⟪g, J ·⟫` for some
  `g ∈ H`, the consistency terms are measured in `H`: `‖g‖ (‖J(u_h - v)‖ + ‖J(u - v_h)‖)`. Bartels,
  Theorem 5.7, p. 138 (the second estimate). Proof route: the first proof with `r(w) = ⟪g, J w⟫`.
- **Piecewise linear obstacle problem** (`exists_obstacle_P1_rate`): for `d ≤ 3`, `u ∈ H²(Ω)`,
  `χ ∈ H²(Ω)` continuous with `χ ≤ 0` on `∂Ω`, and the discrete constraint `u_h ≥ χ` at the
  vertices (`discreteObstacleSet`),
  `‖∇(u - u_h)‖² ≤ C h² ((‖f‖ + |u|₂)(|χ|₂ + |u|₂) + |u|₂²)`. Bartels, Theorem 5.8, p. 139, with
  `‖Δu + f‖ ≤ ‖f‖ + √d |u|₂`; Proposition 5.2, p. 139, for convergence without rates.

`obstacleSet Ω χ` is `{v ∈ H¹₀(Ω) | v ≥ χ a.e.}` and `IsObstacleSolution K f u` is the variational
inequality of `-Δ` on `K`.

**Checks.**

- `V = ℝ`, `A = id` (`α = ‖A‖ = 1`), `f = 1`, `K = [2, ∞)`, `K_h = [1, ∞)` (nonconforming):
  `u = 2` and `u_h = 1`, so the left side is `1/2`; with `v = 2`, `v_h = 1` the right side is
  `1 · (1 + 1) + 1/2 = 5/2`, and with `v = 2`, `v_h = 2` it is `1 · (1 + 0) + 0 = 1`.
- `(0, 1)`, `f = 0`, `χ = 1/4 - 2(x - 1/2)²`: the exact solution is linear up to the contact
  point `x = 1/(2√2) = 0.35355` with slope `0.58579`; P1 errors ‖u′ − u_h′‖ = 0.0729, 0.0375,
  0.0195, 0.00968, 0.00488 for `N = 8, …, 128`, order `1` as stated.
- Negative control (nonconformity): for this concave `χ`, the P1 function equal to `χ` at the
  vertices lies below `χ` between them, so `discreteObstacleSet ⊄ obstacleSet` and the term
  `‖u_h - v‖` of Falk's estimate cannot be dropped.

### 7.2 Γ-convergence of discretizations

`restrictTo I Y` is `I` on the subspace `Y` and `⊤` off it; Γ-convergence is Tau Ceti's
`TauCeti.TendstoGamma`, with sequential liminf and recovery conditions.

- **Conforming discretizations Γ-converge** (`tendstoGamma_restrictTo`): if every point is a norm
  limit of points y_n ∈ X_n, and `I` is sequentially weakly lower semicontinuous and norm
  continuous, then `restrictTo I X_n` Γ-converges to `I` in the weak topology. Bartels,
  Definition 4.1 and Theorem 4.1, p. 87.
- **Almost minimizers** (`isMinOn_and_tendsto_of_almostMinimizer`): if `F_n` Γ-converges to `f`,
  `F_n(u_n) ≤ inf F_n + ε_n` with `ε_n → 0` and `u_n → x₀`, then `x₀` minimizes `f` and
  `F_n(u_n) → f(x₀)`. Bartels, Proposition 4.1 (ii), p. 88. Tau Ceti's
  `TauCeti.TendstoGamma.isMinOn_of_tendsto` is the case of exact minimizers without the
  convergence of values.

*Needs:* Tau Ceti `TauCeti.TendstoGamma`; Mathlib `WeakSpace`.

**Checks.**

- `F_n = f = x²` on `ℝ` (a constant sequence of continuous functions Γ-converges to itself),
  `u_n = 1/n`, `ε_n = 1/n²`: `x₀ = 0` minimizes and `F_n(u_n) = 1/n² → 0 = f(0)`.
- Negative control (`ε_n → 0`): `F_n = f = x²` on `ℝ`, `u_n = 1`, `ε_n = 1`: `x₀ = 1` is not a
  minimizer.
- Negative control (weak lower semicontinuity): Bartels, Example 4.2, p. 86:
  `I(u) = ∫ ((u')² - 1)² + u⁴` on `W^{1,4}(0, 1)`; sawtooth `u_h ∈ X_h` with slopes `±1` have
  `I(u_h) = (h/2)⁴/5 → 0` (`1.25 · 10⁻⁶` at `h = 0.1`) and `u_h ⇀ 0`, while `I(0) = 1`: the liminf
  inequality fails at `0`.
- Negative control (density): `X_n = 0` for all `n` and `I(x) = ‖x‖²`: the Γ-limit is `0` at `0`
  and `⊤` elsewhere, not `I`.

## Downstream consumers

- Finite element eigenvalue problems for mixed, discontinuous Galerkin and Maxwell
  discretizations: the Banach-space theory of Layer 2 and the gap of 1.2.
- Adaptive methods for eigenvalue problems and for nonsymmetric or mixed problems: the abstract
  reliability of 4.1, the contraction lemma of 6.1 and the Prager–Synge bound of 5.1.
- Multilevel solvers on adaptively refined meshes: the nested spaces and contraction of Layer 6.
- Reduced basis and model reduction with certified error bounds: the guaranteed bounds of 5.2.
- Discretization of obstacle and other constrained problems in optimization: Layer 7.

## Scope and ownership

This roadmap owns the quantitative theory of Galerkin eigenvalue approximation (gaps, the
equivalence of 1.3, the Banach-space theory of Layer 2, the double order and the eigenvector
error measured by the eigenspace), finite element eigenvalue rates for the Dirichlet Laplacian,
residual and equilibrated a posteriori estimates for the Poisson-type problem with piecewise
constant coefficients, the contraction and optimality of the adaptive loop, Falk's estimate, the
piecewise linear obstacle problem, and Γ-convergence of conforming discretizations.

It does not own compact form pairs, the min–max principle, monotonicity of Ritz values, or the
qualitative Ritz–Galerkin convergence with its bounds through the distance from the span of the
first eigenvectors; those are VariationalMethods §§3.1, 4.4 and 6.1, consumed with their
definitions copied. The Rayleigh quotient bound for bounded operators with an orthonormal
eigenbasis is EigenvalueIterations §3.1; 3.1 here is the exact identity for an unbounded form.
Projection gaps and Γ-convergence with its minimizer theorems are Tau Ceti's. Meshes, Lagrange
spaces, interpolation, inverse estimates and Galerkin solutions are
GalerkinMethodsAndLagrangeFiniteElements, and the Raviart–Thomas spaces are
MixedAndNonconformingFiniteElements; their definitions are copied verbatim. Elliptic regularity
of eigenfunctions and of the source problem is a hypothesis (3.2). Mesh refinement by
newest-vertex bisection and its closure estimate are hypotheses of 6.2. The approximation spaces
of Pietsch in general quasi-normed groups are
[ApproximationSpaces](../ApproximationSpaces/README.md) (AS-A05, AS-A06); 6.2 defines only the
one quasi-norm it needs and does not use their theory. The projection-gap vocabulary is
OperatorTheory [PrincipalAngles](../OperatorTheory/PrincipalAngles/README.md), Part C, implemented
in Tau Ceti; sin Θ bounds for self-adjoint perturbations are OperatorTheory
[SpectralSubspacePerturbation](../OperatorTheory/SpectralSubspacePerturbation/README.md) and are
not used by Layer 2. Epi-convergence in finite dimensions is
VariationalAnalysisAndMetricRegularity §2.1; Layer 7 works in the weak topology of a normed space.

## Exact supplier contracts

### From VariationalMethods

- §3.1: `CompactFormPair` and `CompactFormPair.energy`, copied verbatim (all layers).
- §4.4: `CompactFormPair.rayleighMinMax`, copied verbatim; Courant–Fischer and monotonicity of the
  min–max values in the subspace, for the lower bounds `λ ≤ λ_h` (Layer 3).
- §6.1: convergence of the Ritz values for nested dense subspaces (1.3).

### From EigenvalueIterations

- §3.1: the Rayleigh quotient bound for bounded operators, as the matrix analogue of 3.1 (prose).

### From GalerkinMethodsAndLagrangeFiniteElements

- Conventions: `E`, `evalₗ`, `polynomialsDegLE`, `toOrderL` and `seminorm`, copied verbatim.
- §1.3: Galerkin orthogonality (1.1).
- §2.1: `cellDiam`, `cellInball`, `cellOpen`, copied verbatim.
- §2.2: `SimplicialMesh` with `domain`, `domainOpens`, `meshSize`, `SharesFacet`,
  `HasConnectedStars` and `IsShapeRegular`, copied verbatim.
- §§4.1–4.2: `lagrangeSpace`, `lagrangeSubmoduleW1p`, `lagrangeSubmoduleW1p0`, copied verbatim.
- §5.1: nodal interpolation estimates (7.1); §5.2: Scott–Zhang estimates (3.2, 4.2); §5.3:
  inverse estimates and the discrete trace
  inequality (4.2, 6.1).
- §6.1: `IsGalerkinSolution`, copied verbatim (Layers 4–6).
- §6.3: `HasAdjointH2Regularity`, copied verbatim, and the Aubin–Nitsche bound (3.2).

### From MixedAndNonconformingFiniteElements

- Conventions: `PolyField`, `facet`, `facetNormal`, copied verbatim.
- §4.1: `polyFieldsDegLE`, `polyDiv`, `polyGrad`, `xMul`, `raviartThomas`, `normalComp`, copied
  verbatim; the dimension and divergence of the Raviart–Thomas space (5.2).
- §4.2: `fieldDot`, copied verbatim.
- Layer 5: `SimplicialMesh.neighbor`, copied verbatim (4.2).
- §6.1: `rtFamilies`, copied verbatim, and its conformity in `H(div)` (5.2).

### From Mathlib

- **Functional analysis:** `Metric.infDist`, `IsCompactOperator`, `spectrum`, `resolventSet`,
  `Module.End.maxGenEigenspace`, `HilbertBasis`, `IsCoercive.continuousLinearEquivOfBilin`,
  `ContinuousLinearMap.opNorm`, `WeakSpace`.
- **Polynomials, geometry, measure:** `MvPolynomial.restrictTotalDegree`, `MvPolynomial.pderiv`,
  `Affine.Simplex.closedInterior`, `MeasureTheory.Measure.hausdorffMeasure`.

### From Tau Ceti

- **Gaps:** `Submodule.directedProjectionGap`, `Submodule.projectionGap`,
  `Submodule.projectionGap_eq_max`, `Submodule.directedProjectionGap_le_iff`.
- **Sobolev spaces and elliptic problems:** `TauCeti.W1p`, `TauCeti.W1p0`, `TauCeti.Wkp`,
  `TauCeti.W1p.value`, `TauCeti.W1p.gradient`, `TauCeti.Wkp.firstOrder`,
  `TauCeti.PDE.energyFormH1`, `TauCeti.PDE.dirichletForcing`,
  `TauCeti.PDE.IsWeakSolutionDirichlet`, `TauCeti.PDE.UniformlyEllipticOn`.
- **Γ-convergence:** `TauCeti.TendstoGamma`, `TauCeti.TendstoGamma.isMinOn_of_tendsto`.

## Beyond this roadmap

The following material is recorded only to fix the boundary. Contributors should not attempt it
under this roadmap.

- Newest-vertex bisection: conformity, shape regularity of all descendants, the closure estimate
  and the overlay property, which 6.2 takes as hypotheses.
- Coefficients that are only piecewise smooth, with coefficient oscillation in the efficiency
  bound, and general Neumann data.
- A posteriori estimates and adaptivity for mixed, nonconforming and discontinuous Galerkin
  methods, and adaptive algorithms for eigenvalue problems.
- Mixed eigenvalue problems and their spurious modes, which need the discrete compactness
  property rather than norm convergence alone.
- Nonsymmetric finite element eigenvalue applications of Layer 2 (convection-diffusion, Maxwell).
- Relaxation and Young measures for Γ-limits of nonconvex discretizations such as Bartels,
  Example 4.2.

## Prior formalization

Five targets are proved without `sorry` in [lean-NASC](https://github.com/bjbraams/lean-NASC) at
commit 92a6dba, in `NASC/VariationalEigenproblems.lean`, with forms close to those here (a
bilinear form there instead of a compact form pair in 3.1; a general Haar measure in 5.1):

- 3.1: `rayleigh_error_eq_quadratic`;
- 4.1: `norm_error_le_of_weighted_residuals`;
- 5.1: `norm_sub_sq_add_norm_add_sq_eq_of_equilibrated`;
- 6.1: `exists_adaptive_error_contraction`;
- 7.1: `falk_obstacle_error_le`.

The same module proves a limit lemma for 2.1 (nonzero limits of eigenvalues of norm-convergent
compact approximations are eigenvalues; exists_eigenvector_of_isCompactOperator_of_tendsto).
Tau Ceti at commit `2fd255d` has the
projection gap and Γ-convergence; Mathlib at commit `1b1ccf4` has compact operators, spectra and
generalized eigenspaces. Neither has eigenvalue approximation, a posteriori estimates or adaptive
finite elements.

## References

- D. Boffi, Finite element approximation of eigenvalue problems, *Acta Numerica* 19 (2010),
  1–120. Cited as Boffi.
- A. Ern and J.-L. Guermond, *Finite Elements II: Galerkin Approximation, Elliptic and Mixed
  PDEs*, Texts in Applied Mathematics 73, Springer, 2021. Cited as Ern–Guermond II.
- R. Verfürth, *A Posteriori Error Estimation Techniques for Finite Element Methods*, Oxford
  University Press, 2013. Cited as Verfürth.
- S. C. Brenner and L. R. Scott, *The Mathematical Theory of Finite Element Methods*, 3rd ed.,
  Texts in Applied Mathematics 15, Springer, 2008.
- S. Bartels, *Numerical Methods for Nonlinear Partial Differential Equations*, Springer Series in
  Computational Mathematics 47, Springer, 2015. Cited as Bartels.
- I. Babuška and J. Osborn, Eigenvalue problems, in *Handbook of Numerical Analysis* II,
  North-Holland, 1991, 641–787 (through Boffi, §9).
- J. M. Cascón, C. Kreuzer, R. H. Nochetto and K. G. Siebert, Quasi-optimal convergence rate for
  an adaptive finite element method, *SIAM J. Numer. Anal.* 46 (2008), 2524–2550 (through
  Ern–Guermond II, §34.4).
