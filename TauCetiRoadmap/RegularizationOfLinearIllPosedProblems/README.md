# Roadmap: regularization of linear ill-posed problems

**Summary.** A bounded linear equation `K x = y` between Hilbert spaces is ill-posed when its
solution does not depend continuously on the data, as happens for every compact operator of
infinite rank. This roadmap builds the linear theory that recovers a stable approximate solution
from data `yᵟ` with `‖yᵟ - y‖ ≤ δ`:
- singular systems of compact operators, the singular value expansion, and Picard's criterion:
  `K x = y` is solvable exactly when `y` is orthogonal to the kernel of `K*` and
  `∑ |⟨y, gₙ⟩|² / σₙ² < ∞`;
- the Moore–Penrose generalized inverse of an arbitrary bounded operator, a closed, densely
  defined linear map that sends `y` to the least-squares solution of minimal norm; it is bounded
  exactly when the range of `K` is closed, which for a compact operator means finite rank;
- regularization schemes and regular parameter choices, the error splitting into propagated
  noise and approximation error, the unboundedness of every scheme for an ill-posed equation,
  and Bakushinskii's theorem that a convergent parameter choice must use the noise level;
- spectral filters and the spectral cut-off;
- Tikhonov regularization: the regularized normal equation, the bounds `‖R_α‖ ≤ 1/(2√α)` and
  `‖R_α‖ ≤ ‖K‖/α`, convergence when `α(δ) → 0` and `δ²/α(δ) → 0`, the rates `α^ν` and
  `δ^{2ν/(2ν+1)}` under the source condition `x† = (K*K)^ν w` with `0 < ν ≤ 1`, the
  characterization of the rate `O(α)` by `x† ∈ R(K*K)`, and saturation;
- Morozov's discrepancy principle: the minimum norm solution with discrepancy `δ` is a Tikhonov
  solution with residual exactly `δ`, it converges to `x†`, and at the rate `2√(‖z‖δ)` when
  `x† = K*z`;
- the Landweber iteration: its filter form, the bound `‖R_m‖ ≤ √(a(m+1))`, convergence for an a
  priori stopping index with `δ²m(δ) → 0` and for discrepancy stopping;
- variational regularization in Banach spaces: Bregman distances of a convex functional, the
  optimality condition of `½‖Ku - fᵟ‖² + αJ(u)`, and the error estimate in the symmetric Bregman
  distance under the source condition `K*v ∈ ∂J(u†)`, which gives the rate `‖v‖δ`.

The roadmap is a synthesis of Kress's chapters on first-kind equations and Tikhonov
regularization, of Engl, Hanke and Neubauer's monograph on the regularization of inverse
problems, of Benning and Burger's survey of modern regularization methods, and of Hansen's
treatment of filter factors and the discrete Picard condition (see [References](#references));
it follows none of them section by section. Headlines that restate a source result cite a
theorem, definition or equation number with its printed page; corollaries and adaptations carry
a proof route.

The roadmap rests on the compact Schmidt series of
[BanachSpaceTheory](../BanachSpaceTheory/README.md), built from Tau Ceti's spectral theory of
compact self-adjoint operators, which gives the singular systems of compact operators; on Tau
Ceti's continuous functional calculus for bounded self-adjoint
operators on real and complex Hilbert spaces and its finite-dimensional Moore–Penrose inverse,
both targets of the
PolarDecomposition roadmap of [OperatorTheory](../OperatorTheory/PolarDecomposition/README.md),
which give the source conditions `(K*K)^ν` and the finite-dimensional comparison; and on the
subdifferential calculus of [ConvexAnalysisAndDuality](../ConvexAnalysisAndDuality/README.md),
which gives the optimality condition of variational regularization. Mathlib supplies Hilbert
adjoints, orthogonal projections, linear partial maps and Lax–Milgram. Its downstream
consumers are Bayesian inverse problems, where the maximum a posteriori estimator of a Gaussian
prior is a Tikhonov solution, and the numerical analysis of first-kind integral equations.

`Suggested.lean` states, against the pinned Mathlib and Tau Ceti, the headlines below that carry
a Lean name, each with every conclusion the README attaches to it, and the definitions those
statements need. Every headline whose carriers exist at the pins carries a Lean name; the bullets
without one are definitions, results supplied by Mathlib, Tau Ceti or other roadmaps, or facts
about a single definition, as the module docstring of `Suggested.lean` says. It is not an
exhaustive acceptance test: the prose targets have the same standing.

Suggested home: `TauCeti/Analysis/InverseProblems/`, with Layer 6 in
`TauCeti/Analysis/Convex/Bregman.lean`.

## How to read the build

Each layer has numbered subsections. Each subsection lists its targets as bold headlines with
their Lean names, a source locator for a headline that restates a source result and a proof route
for a corollary or adaptation, and Checks, which are sanity checks of the key definitions and
theorems.

Layer 1 sets up singular systems and proves Picard's criterion; it is the coordinate system of
every compact statement below. Layer 2 builds the Moore–Penrose generalized inverse `K†` for an
arbitrary bounded operator and identifies it, for a compact operator, with the Picard series of
Layer 1. `K†` is the target of every convergence statement in Layers 3–5: a scheme converges to
`K† y`. Layer 3 defines regularization schemes along a filter, so that a continuous parameter
`α → 0⁺` and an iteration count `m → ∞` are one notion, and proves the general facts about
schemes and parameter choices, with spectral filters as the model. Layer 4 is Tikhonov
regularization: the operator and its scheme property (4.1), rates under source conditions and
saturation (4.2), and the discrepancy principle (4.3). Layer 5 is the Landweber iteration. Layer
6 leaves Hilbert-space structure on the unknown and treats convex variational regularization in a
Banach space.

The layers are in build order: Layer 2 uses Layer 1 only in 2.3; Layers 3–5 use Layer 2 for the
definition of a scheme and Layer 1 for the filter series; 4.2 and 4.3 use only 4.1 and Layer 3;
Layer 6 uses only the suppliers.

## Conventions

These are fixed for every target. A statement that departs from them is a different target.

- **Namespace.** The implementation is in the namespace `TauCeti`. `Suggested.lean` states the
  prototypes in the namespace `TauCetiRoadmap.RegularizationOfLinearIllPosedProblems`.
- **Spaces and operators.** In Layers 1–5, `X` and `Y` are Hilbert spaces (`CompleteSpace`) over
  `RCLike 𝕜`, `K : X →L[𝕜] Y` is bounded, and `adjoint K` is its Hilbert adjoint
  `ContinuousLinearMap.adjoint`. Kernels, ranges and orthogonal complements are those of the
  underlying linear map `(K : X →ₗ[𝕜] Y)`, and `Set.range K` is the range as a set. No
  injectivity is assumed unless a statement says so: the exact solution is always the
  minimal-norm least-squares solution `K† y`, which for injective `K` and `y = K x` is `x`.
- **Data.** Exact data `y`, noisy data `yᵟ` with `‖yᵟ - y‖ ≤ δ`, noise level `δ > 0`. The
  parameter is `α > 0` (Tikhonov), a threshold `τ > 0` (cut-off) or an index `m : ℕ`
  (Landweber).
- **Singular systems.** `IsSingularSystem K σ e g` (1.1) is indexed by an arbitrary type `ι`,
  with `σ i > 0`, orthonormal `e` and `g`, `K (e i) = σ i • g i`, `adjoint K (g i) = σ i • e i`,
  and completeness: a vector orthogonal to every `e i` lies in the kernel of `K`. The indices
  carry no order; finite rank is a finite `ι`. A singular value "repeated according to
  multiplicity" is several indices with the same `σ`. Series over `ι` are `HasSum`, never `tsum`,
  because `tsum` of a non-summable family is `0`. The approximation numbers
  `ContinuousLinearMap.singularValue K n` of Tau Ceti are, for compact `K`, the nonincreasing
  rearrangement of the `σ i`, padded by zeros: this is the identity `sₙ = aₙ(K)` of
  BanachSpaceTheory §4.5, read through the existence statement of 1.1.
- **Schemes along a filter.** A scheme is a family `R : κ → Y →L[𝕜] X` with a filter `l` on the
  parameter type `κ`: `𝓝[>] 0` on `ℝ` for Tikhonov regularization and the cut-off, `atTop` on
  `ℕ` for the Landweber iteration. A parameter choice is a function `α : ℝ → Y → κ` of
  `(δ, yᵟ)`; it is *a priori* when it does not depend on `yᵟ`. Regularity is uniform over all
  admissible data, which a single data path `δ ↦ yᵟ` cannot express.
- **Inverses.** `tikhonov K α` uses `Ring.inverse` of `α • 1 + adjoint K ∘L K`, which is `0` on a
  noninvertible operator; every statement about it assumes `α > 0`, where 4.1 proves
  invertibility.
- **Source conditions.** `(K*K)^ν w` is `cfc (fun t : ℝ ↦ t ^ ν) (adjoint K ∘L K) w`, Tau Ceti's
  continuous functional calculus for self-adjoint operators over `RCLike 𝕜`, with the real
  algebra structure `[Algebra ℝ (X →L[𝕜] X)] [IsScalarTower ℝ 𝕜 (X →L[𝕜] X)]` (Mathlib's own at
  `𝕜 = ℝ, ℂ`). The function `t ↦ t ^ ν` is `Real.rpow`, continuous on the spectrum `⊆ [0, ‖K‖²]`
  for `ν > 0`. For an operator with a singular system, 4.2 rewrites the condition in singular
  coordinates.
- **Asymptotics.** `O(α)` and `o(α)` are `Asymptotics.IsBigO` and `Asymptotics.IsLittleO` along
  `𝓝[>] 0`.
- **Banach spaces (Layer 6).** `U` is a real normed space, `V` a real Hilbert space,
  `K : U →L[ℝ] V`. Functionals are `J : U → EReal`, *convex* when the real epigraph
  `{p : U × ℝ | J p.1 ≤ p.2}` is convex and *proper* when `∀ u, J u ≠ ⊥` and some value is
  finite, as in ConvexAnalysisAndDuality's Conventions. Subgradients are
  `TauCeti.subdifferential dualPairing J u ⊆ StrongDual ℝ U`, with
  `dualPairing = (topDualPairing ℝ U).flip`, the pairing `u, p ↦ p u`; this set is empty
  unless `J u` is finite. The adjoint of `K` applied to `v ∈ V` is the functional
  `adjointFunctional K v = ⟪v, K ·⟫`; `ContinuousLinearMap.adjoint` is for Hilbert spaces only.
  Noise is measured by the norm, `‖fᵟ - f‖ ≤ δ`.
- **Locators** are `(Author, Theorem, printed page)` in the editions listed under
  [References](#references). Kress writes `A`, `φ`, `f` and `μₙ` for the operator, the unknown,
  the data and the singular values; Engl, Hanke and Neubauer write `T` (or `K` when compact),
  `(σₙ; vₙ, uₙ)` for a singular system, and call a least-squares solution of minimal norm a
  best-approximate solution; Benning and Burger write `u` for the unknown.

## Layer 1: singular systems and the Picard criterion

### 1.1 Singular systems

- **Singular systems** (`IsSingularSystem`) as in the Conventions. Sources: [Kr, Definition
  15.15, p. 309]; [EHN, (2.20)–(2.23), p. 37], where the system is
  indexed by `ℕ` in nonincreasing order; the unordered index type covers the finite and infinite
  cases at once.
- **Existence for compact operators** (`IsCompactOperator.exists_isSingularSystem`). A compact
  `K` has a singular system indexed by a countable set of vectors, with `σ → 0` along the
  cofinite filter [Kr, Theorem 15.16, p. 309]. The compact Schmidt series is BanachSpaceTheory
  §4.5, which builds it from Tau Ceti's
  `ContinuousLinearMap.exists_hilbertBasis_forall_hasEigenvector` applied to `adjoint K ∘L K`:
  orthonormal `(eⱼ)` and `(fⱼ)` with `sⱼ > 0` nonincreasing, `fⱼ = sⱼ⁻¹ K eⱼ`,
  `K x = ∑ sⱼ ⟪eⱼ, x⟫ fⱼ` vanishing on the kernel, and `sⱼ → 0` in the infinite-rank case.
  What is owned here is the reading of that series as an `IsSingularSystem` in the unordered form
  of the Conventions. Route: index by the set `{eⱼ}`; `adjoint K fⱼ = sⱼ eⱼ` because `eⱼ` is
  an eigenvector of `adjoint K ∘L K` with eigenvalue `sⱼ²`; completeness is the expansion at a
  vector orthogonal to every `eⱼ`; and `σ → 0` along the cofinite filter is `sⱼ → 0`, since
  for an infinite index set the cofinite filter is `atTop` in the enumeration `j ↦ eⱼ` (for a
  finite one it is `⊥`).
- **The singular value expansion** (`IsSingularSystem.hasSum_apply`). `K x = ∑ σᵢ ⟪eᵢ, x⟫ gᵢ`,
  `‖K x‖² = ∑ σᵢ² |⟪eᵢ, x⟫|²`, the kernel of `K` is the orthogonal complement of the span of the
  `eᵢ`, and every `x` orthogonal to the kernel is `∑ ⟪eᵢ, x⟫ eᵢ` [Kr, Theorem 15.16, p. 309];
  [EHN, (2.22), p. 37].
- **The adjoint and the Gram operator** (`IsSingularSystem.adjoint_and_gram`). `(σ, g, e)` is a
  singular system of `K*`, and `(σ², e, e)` one of `K*K`. Route: completeness for `K*` follows
  from completeness for `K`, because `K* y` lies in the closure of the span of the `eᵢ` and is
  orthogonal to every `eᵢ` when `y` is orthogonal to every `gᵢ`.
- **Finite rank** (`IsSingularSystem.finiteDimensional_range_iff`). The range of `K` is
  finite-dimensional exactly when `ι` is finite [EHN, p. 37]. Route: the `gᵢ` span a dense
  subspace of the closure of the range, and the range contains them.
- The closure of the range of `K` is the orthogonal complement of the kernel of `K*`, and the
  kernel of `K` is that of the range of `K*` [Kr, Theorem 15.8, p. 303]; Mathlib's
  `ContinuousLinearMap.orthogonal_range` supplies the first.

**Checks.**

- `K = 2 • id` on `𝕜`: `ι = Unit`, `σ = 2`, `e = g = 1`.
- `K = 0`: the empty index type is a singular system; `IsCompactOperator.exists_isSingularSystem`
  returns `s = ∅`.
- Negative control: the diagonal operator `diag(1, 1/2)` with `e = g` the standard basis but
  `σ = (1, 1)` fails `apply_e` at the second index; with `e` only the first basis vector it fails
  completeness, since `e₂` is orthogonal to `e` and not in the kernel.
- Negative control: `σ i = -1`, `g i = -e i` for `K = id` on `𝕜` satisfies the two singular
  relations but not `pos`; positivity is what makes `σ` unique for a given `K`.

### 1.2 The Picard criterion

- **Picard's criterion** (`IsSingularSystem.exists_eq_image_iff_picard`). `K x = y` has a
  solution exactly when `y` is orthogonal to the kernel of `K*` and
  `∑ |⟪gᵢ, y⟫|² / σᵢ² < ∞`; then `∑ σᵢ⁻¹ ⟪gᵢ, y⟫ eᵢ` converges to the solution orthogonal to
  the kernel of `K` [Kr, Theorem 15.18 (Picard), p. 311]; [EHN, Theorem 2.8, p. 38]. The
  discrete form, that the coefficients `|⟪gᵢ, y⟫|` must decay faster than the `σᵢ`, is
  [Ha, §4.5, p. 81].

**Checks.**

- `K = 2 • id` on `𝕜`, `y = 3`: the series is `3/2`, and `K (3/2) = 3`.
- `K = diag(1/n)` on `ℓ²`, `y = (1/n)`: `∑ n² · n⁻² = ∞`, so `y` is not in the range, although
  it lies in the closure of the range; Picard's condition, not orthogonality, is what fails.
- Negative control: dropping the orthogonality conjunct is wrong for `K : 𝕜 → 𝕜²`,
  `K x = (x, 0)`: the singular system is `σ = 1`, `e = 1`, `g = (1, 0)`, and `y = (0, 1)` has
  every coefficient `⟪g, y⟫ = 0`, a summable series, but `y` is not in the range.

## Layer 2: the Moore–Penrose generalized inverse

### 2.1 Least-squares solutions and the generalized inverse

- **Least-squares solutions** (`IsLeastSquaresSolution`): `‖K x - y‖ ≤ ‖K z - y‖` for all `z`
  [EHN, Definition 2.1, p. 32]; Benning and Burger call them best approximate solutions [BB,
  Definition 4.1, p. 21].
- **The domain** (`generalizedInverseDomain`) is `R(K) + R(K)⊥` [EHN, Definition 2.2, (2.7),
  p. 33].
- **The generalized inverse** (`generalizedInverseGraph`, `generalizedInverse`). `K†` is the
  linear partial map `Y →ₗ.[𝕜] X` whose graph is `{(K x + z, x)}` over `x` orthogonal to the
  kernel and `z` orthogonal to the range; on the range it inverts the restriction of `K` to the
  orthogonal complement of its kernel, and it vanishes on `R(K)⊥` [EHN, Definition 2.2, (2.7),
  p. 33].
- **Graph and domain** (`graph_generalizedInverse`). The graph of `generalizedInverse K` is
  `generalizedInverseGraph K`, its domain is `R(K) + R(K)⊥`, and this domain is dense [EHN,
  Definition 2.2, p. 33]. Route: the graph is functional because `K x + z = 0` with `K x ⊥ z`
  forces `K x = 0`, so `x` is in the kernel and its complement; `R(K)` is `K` of the orthogonal
  complement of the kernel; density holds because the closure of the domain contains the closure
  of `R(K)` and its orthogonal complement.
- **Least-squares solutions and the normal equation** (`isLeastSquaresSolution_iff`). A
  least-squares solution exists exactly for `y` in the domain of `K†`; for such `y`, `x` is one
  exactly when `K* K x = K* y`, exactly when `x - K† y` lies in the kernel [EHN, Theorem 2.5,
  p. 34; Theorem 2.6, p. 35, and the remark after it]. Route for existence: `K x` is the nearest
  point of `R(K)` to `y` exactly when `K x` is the orthogonal projection of `y` onto the closure
  of the range.
- **Minimal norm** (`generalizedInverse_isMinimalNorm`). `K† y` is orthogonal to the kernel, is a
  least-squares solution, and is the unique least-squares solution of least norm [EHN, Theorem
  2.5, p. 34]; [BB, Definition 4.1, p. 21].
- **The Moore–Penrose equations** (`generalizedInverse_moorePenrose`). `K K† y = Q y` for `y` in
  the domain, with `Q` the orthogonal projection onto the closure of the range, and
  `K† K x = (I - P) x`, with `P` the orthogonal projection onto the kernel [EHN, Proposition 2.3,
  (2.12)–(2.13), p. 33].

**Checks.**

- `K = [[1, 0, 0], [0, 0, 0]] : 𝕜³ → 𝕜²`, `y = (2, 3)`: `K† y = (2, 0, 0)`, it satisfies the
  normal equation, and `(2, 5, 7)` is another least-squares solution, of larger norm.
- `K = 0`: the domain is `Y`, `K† = 0`, and every `x` is a least-squares solution.
- Negative control: for `K = diag(1/n)` on `ℓ²` and `y = (1/n)`, `y` is in the closure of the
  range and outside the domain; no least-squares solution exists, because the infimum `0` of the
  residual is not attained.

### 2.2 Closed graph and boundedness

- **Closed graph** (`isClosed_generalizedInverse`): `K†` has a closed graph [EHN, Proposition
  2.4, p. 34]. Route: the graph is the sum of the closed orthogonal subspaces
  `{(K x, x) : x ⊥ ker K}` and `R(K)⊥ × {0}` of `Y × X`.
- **Boundedness** (`continuous_generalizedInverse_iff`). `K†` is continuous on its domain exactly
  when the range of `K` is closed; then the domain is all of `Y`, and `K†` is a bounded operator
  satisfying Tau Ceti's four Penrose conditions `LinearMap.IsMoorePenroseInverse` [EHN,
  Proposition 2.3, p. 33; Proposition 2.4, p. 34]. Continuity is that of the map on the domain
  subtype, not of an extension by zero.

**Checks.**

- Every operator between finite-dimensional spaces has closed range, so `K†` is bounded.
- Negative control: for `K = diag(1/n)` on `ℓ²`, `K†` maps the unit vector `δₙ` to `n δₙ`, so
  it is unbounded on its domain although its graph is closed.

### 2.3 The compact case and finite dimension

- **The compact case** (`IsSingularSystem.generalizedInverse_hasSum`). For `K` with a singular
  system, `y` is in the domain of `K†` exactly when `∑ |⟪gᵢ, y⟫|² / σᵢ² < ∞`, and then `K† y`
  is the Picard series `∑ σᵢ⁻¹ ⟪gᵢ, y⟫ eᵢ` [EHN, Theorem 2.8, p. 38]. Route: 1.2
  applied to `Q y`.
- **Closed range of a compact operator** (`isClosed_range_iff_finiteDimensional`). The range of a
  compact operator is closed exactly when it is finite-dimensional; hence `K†` is a densely
  defined unbounded operator with closed graph for every compact `K` of infinite rank [EHN,
  p. 37–38 and Proposition 2.7, p. 38]; this is [Kr, Theorem 15.4, p. 300] for injective `K`.
- **Finite dimension** (`generalizedInverse_eq_moorePenroseInverse`). Between
  finite-dimensional spaces the domain is `Y` and `K†` agrees with Tau Ceti's
  `LinearMap.moorePenroseInverse`. Route: both satisfy the four Penrose conditions (2.1, 2.2), and
  Tau Ceti's `LinearMap.isMoorePenroseInverse_iff_eq_moorePenroseInverse` gives uniqueness.

**Checks.**

- `K = diag(1, 1/2)` on `ℝ²`: `K† = diag(1, 2)`, the Picard series with two terms.
- Negative control: the compact `K = diag(1/n)` has nonclosed range, and `y = (1/n²)` is in the
  domain (`∑ n² n⁻⁴ < ∞`) with `K† y = (1/n)`, while `y = (1/n)` is not.

## Layer 3: regularization schemes and parameter choice

### 3.1 Schemes and parameter choices

- **Regularization schemes** (`IsRegularizationScheme K R l`): `R a y → K† y` along `l` for every
  `y` in the domain of `K†` [EHN, Definition 3.1, p. 50; Proposition 3.4, p. 52]; [BB,
  Definition 4.2, p. 21].
- **Regular parameter choices** (`IsRegularParameterChoice K R α`): for every `y` in the domain
  of `K†` and every `ε > 0` there is `δ₀ > 0` with `‖R (α δ yᵟ) yᵟ - K† y‖ < ε` whenever
  `0 < δ < δ₀` and `‖yᵟ - y‖ ≤ δ` [Kr, Definition 15.7, p. 302]; [EHN, Definition 3.1,
  p. 50]. A priori choices are [EHN, Definition 3.2, p. 51].
- **Injective operators** (`isRegularizationScheme_iff_of_injective`). For injective `K`, a
  scheme is a family with `R a (K x) → x` for every `x` and `R a z → 0` for `z ⊥ R(K)`. With dense
  range the second condition is empty, and the notion is [Kr, Definition 15.5, p. 301]. Route:
  `K†` is `K⁻¹` on `R(K)` and `0` on `R(K)⊥`.
- **Error splitting** (`norm_sub_le_noise_add_bias`, proved in `Suggested.lean`):
  `‖R yᵟ - x‖ ≤ δ ‖R‖ + ‖R y - x‖` [Kr, (15.7), p. 302].
- **Unboundedness** (`IsRegularizationScheme.tendsto_norm_atTop`). If the range of `K` is not
  closed, `‖R a‖ → ∞` along `l` [EHN, (3.9), p. 53]; [Kr, Theorem 15.6, p. 301].
  Route: on a set of parameters where `‖R a‖ ≤ C` frequently, the limit gives
  `‖K† y‖ ≤ C ‖y‖` on the domain, so `K†` is bounded and 2.2 makes the range closed.
- **No norm convergence** (`not_tendsto_comp_of_not_isClosed_range`). If the range of `K` is not
  closed and `l ≠ ⊥`, then for no family of bounded operators `R a` does `R a ∘L K` tend to the
  identity in operator norm; a regularization scheme in particular converges only pointwise [Kr,
  Theorem 15.6, p. 301]. Route, as in Kress: `‖R a K - I‖ < 1/2` gives `‖x‖ ≤ 2 ‖R a‖ ‖K x‖`, so
  `K` is bounded below and its range is closed.
- **A priori parameter choice** (`IsRegularizationScheme.isRegularParameterChoice`). If
  `α δ → l` and `δ ‖R (α δ)‖ → 0` as `δ → 0⁺`, then `(δ, yᵟ) ↦ α δ` is regular. Route: error
  splitting, with the approximation error `‖R (α δ) y - K† y‖ → 0` by the scheme property; this
  is the construction behind [EHN, Proposition 3.4, p. 52].
- **Bakushinskii's theorem** (`isClosed_range_of_isRegularParameterChoice`). If a regular
  parameter choice `α(yᵟ)` does not depend on `δ`, then the range of `K` is closed and `K†` is
  bounded on its domain [EHN, Theorem 3.3, p. 52]. Route, as in Engl–Hanke–Neubauer: the data
  `yᵟ = y` at every noise level give `R (α y) y = K† y`; for `yₙ → y` in the domain the data
  `yₙ` at the noise levels `‖yₙ - y‖` give `K† yₙ = R (α yₙ) yₙ → K† y`; then 2.2.

**Checks.**

- `K = id`, `R a = id`: a scheme for every filter, and the constant choice is regular, as
  Bakushinskii's theorem allows for closed range.
- Negative control for Bakushinskii's theorem: for `K = diag(1/n)` on `ℓ²`, whose range is not
  closed, the Tikhonov choice `α(δ) = δ` is regular by 4.1 (`δ² / α = δ → 0`); for
  `x†ₙ = 1/n` and `n ≤ 4000` the approximation error is `0.28`, `0.087`, `0.023` and the noise
  bound `δ / (2√α)` is `0.05`, `0.005`, `0.0005` at `δ = 10⁻², 10⁻⁴, 10⁻⁶`. So the hypothesis
  that the choice ignores `δ` cannot be dropped.
- Negative control for the hypothesis `α δ → l` of the a priori choice: for the Tikhonov family
  of 4.1 with `K = id` on `𝕜`, where `R_α = 1 / (1 + α)`, the constant choice `α ≡ α₀ > 0` has
  propagated noise `δ / (1 + α₀) → 0` but does not tend to `0⁺`, and it is not regular: at
  `yᵟ = y` the error is `α₀ / (α₀ + 1) ‖y‖`.

### 3.2 Spectral filters and the cut-off

- **Spectral filters** (`IsSingularSystem.exists_spectralFilter`). Let `q : κ → ℝ → ℝ` be bounded
  by `C` at the singular values, with `|q a σᵢ| ≤ c a · σᵢ` for some `c a ≥ 0` and
  `q a σᵢ → 1` along `l` for every `i`. Then `R a y = ∑ σᵢ⁻¹ q(a, σᵢ) ⟪gᵢ, y⟫ eᵢ` defines a
  regularization scheme with `‖R a‖ ≤ c a` [Kr, Theorem 15.21, p. 313]; [EHN, Theorem 4.1,
  p. 72]. The values `q(a, σᵢ)` are Hansen's filter factors [Ha, §4.2, (4.3), p. 72].
  Kress assumes injective `K`; on the domain of `K†` the component in `R(K)⊥` is orthogonal to
  every `gᵢ` and is sent to `0`, as `K†` does.
- **The spectral cut-off** (`IsSingularSystem.exists_spectralCutoff`). Truncation
  `R τ y = ∑_{σᵢ ≥ τ} σᵢ⁻¹ ⟪gᵢ, y⟫ eᵢ` is a regularization scheme as `τ → 0⁺`, and
  `‖R τ‖ = 1 / σ_{i₀}` when `σ_{i₀}` is the least singular value `≥ τ` [Kr, Theorem 15.24,
  p. 316, with the index `m` replaced by the threshold `τ = σ_m`]; [Ha, §3.2, p. 48] for the
  truncated singular value decomposition. Route: the filter `q(τ, σ) = 1_{σ ≥ τ}`, with
  `|q| ≤ σ / τ`.

**Checks.**

- Cut-off for `σ = (1, 1/2, 1/4)`: `‖R 0.6‖ = 1`, `‖R 0.4‖ = 2`, `‖R 0.2‖ = 4`.
- The Tikhonov filter `q(α, σ) = σ² / (α + σ²)` has `C = 1` and `c α = 1 / (2√α)`, since
  `σ / (α + σ²) ≤ 1 / (2√α)` [Ha, §4.2, p. 73].
- Negative control: the hypothesis `c a ≥ 0` is needed for `K = 0`, whose singular system is
  empty: then `R a = 0` and `‖R a‖ ≤ c a` fails for negative `c a`.

## Layer 4: Tikhonov regularization

### 4.1 The Tikhonov operator

- **The Tikhonov operator** (`tikhonov`): `R_α = (α I + K* K)⁻¹ K*` [Kr, Theorem 15.23, p. 315];
  [EHN, (5.2), p. 117].
- **Variational characterization** (`tikhonov_spec`). For `α > 0`, `α I + K* K` is invertible,
  x_α = R_α y is the unique solution of `α x + K* K x = K* y`, and it is the unique minimizer of
  the Tikhonov functional `‖K x - y‖² + α ‖x‖²` [Kr, Theorem 16.4, p. 325]; [EHN, Theorem 5.1,
  p. 117]. Route, as in Kress: Lax–Milgram for the coercive form `α ⟪x, x⟫ + ‖K x‖²`
  (Mathlib's `IsCoercive.continuousLinearEquivOfBilin`) and the identity
  `‖K x - y‖² + α‖x‖² = ‖K x_α - y‖² + α‖x_α‖² + ‖K (x - x_α)‖² + α ‖x - x_α‖²`.
- **Norm bounds** (`norm_tikhonov_le`). `‖R_α‖ ≤ ‖K‖ / α` [Kr, Theorem 16.5, p. 325] and
  `‖R_α‖ ≤ 1 / (2√α)` [Kr, Theorem 15.23, p. 315], the second for every bounded `K`. Route: test
  the normal equation against x_α: `α‖x_α‖² + ‖K x_α‖² ≤ ‖y‖ ‖K x_α‖`.
- **Scheme property** (`isRegularizationScheme_tikhonov`). `(R_α)` is a regularization scheme as
  `α → 0⁺` for every bounded `K` [EHN, Theorem 4.1, p. 72, with (5.1), p. 117]; for injective `K`
  this is [Kr, Theorem 16.5, p. 325]. Route: `R_α y - K† y = -α (α + K*K)⁻¹ K† y`; the operators
  `α (α + K*K)⁻¹` are bounded by `1`, and on the dense subspace `R(K*)` of the orthogonal
  complement of the kernel, `‖α (α + K*K)⁻¹ K* z‖ ≤ √α ‖z‖ / 2`.
- **The filter** (`IsSingularSystem.hasSum_tikhonov`): `R_α y = ∑ σᵢ / (α + σᵢ²) ⟪gᵢ, y⟫ eᵢ`
  [Kr, proof of Theorem 15.23, p. 315]; [EHN, (5.2), p. 117]; [Ha, §4.2, p. 73].
- **A priori convergence** (`isRegularParameterChoice_tikhonov`). If `α(δ) > 0`, `α(δ) → 0` and
  `δ² / α(δ) → 0`, the choice is regular [EHN, Theorem 5.2, p. 118]. Route: 3.1 with
  `δ ‖R_α‖ ≤ δ / (2√α)`.

**Checks.**

- `K = id` on `𝕜`, `α = 1`: R_1 = 1/2 = 1 / (2√1), so the bound `1/(2√α)` is attained; the
  bound `‖K‖/α = 1` is not.
- For random real matrices `K` (up to `5 × 5`) and `α ∈ [10⁻⁴, 10²]` the largest values of
  `2√α ‖R_α‖` and `α ‖R_α‖ / ‖K‖` over 200 trials are `0.99999` and `0.9996`.
- Junk value: `tikhonov 0 0 = 0`, since `Ring.inverse 0 = 0`; nothing is claimed at `α ≤ 0`.
- Negative control for the parametrization: the convention `(α² I + K* K)⁻¹ K*` gives `1.6` at
  `K = ½` on `𝕜` and `α = ¼`, above `1 / (2√α) = 1`, while `tikhonov K α = 1` attains the bound.

### 4.2 Rates, the converse and saturation

- **Source conditions in singular coordinates** (`IsSingularSystem.inner_cfc_rpow`). For `ν > 0`,
  `⟪eᵢ, (K*K)^ν w⟫ = σᵢ^{2ν} ⟪eᵢ, w⟫`, and `(K*K)^ν w` is orthogonal to the kernel of `K`.
  Route: the functional calculus of the diagonal operator `K*K` in the eigenbasis of 1.1; the
  kernel part uses `0 ^ ν = 0` for `ν > 0`.
- **Rates under a source condition** (`norm_tikhonov_sub_le_rpow`). Let `x† = (K*K)^ν w` with
  `0 < ν ≤ 1`. Then for every `α > 0`:
  - `‖R_α K x† - x†‖ ≤ α^ν ‖w‖`;
  - `‖R_α yᵟ - x†‖ ≤ δ / (2√α) + α^ν ‖w‖` when `‖yᵟ - K x†‖ ≤ δ`;
  - for `w ≠ 0` and `δ > 0`, the choice `α = (δ/‖w‖)^{2/(2ν+1)}` gives
    `‖R_α yᵟ - x†‖ ≤ (3/2) ‖w‖^{1/(2ν+1)} δ^{2ν/(2ν+1)}`.

  These are [EHN, Theorem 4.3 and Corollary 4.4, p. 74, with (5.17)–(5.18), p. 119] with
  explicit constants. Route: `R_α K x† - x† = -α (α + K*K)⁻¹ (K*K)^ν w` and
  `sup_{t ≥ 0} α t^ν / (α + t) = ν^ν (1-ν)^{1-ν} α^ν ≤ α^ν` in the functional calculus; then
  4.1 and the error splitting; the two terms of the last bound are `½` and `1` times
  `‖w‖^{1/(2ν+1)} δ^{2ν/(2ν+1)}`. No compactness is needed.
- **The converse at `ν = 1`** (`isBigO_tikhonov_sub_iff`). `‖R_α K x - x‖ = O(α)` as `α → 0⁺`
  exactly when `x ∈ R(K*K)` [EHN, Theorem 4.11, p. 81]; [Kr, Theorem 16.6, p. 326,
  for compact injective `K`, as `f ∈ AA*A(X)`]. Route: `R_α K x - x = -α (α + K*K)⁻¹ x`; for
  `x = K*K z` it has norm at most `α ‖z‖`; conversely `(α + K*K)⁻¹ x` is bounded, a weak limit
  point `z` satisfies `K*K z = x`, because `K*K (α + K*K)⁻¹ x = x - α (α + K*K)⁻¹ x → x`.
- **Saturation** (`eq_zero_of_isLittleO_tikhonov_sub`). `‖R_α K x - x‖ = o(α)` forces `x = 0`.
  Route: `‖x‖ ≤ (α + ‖K‖²) ‖(α + K*K)⁻¹ x‖` and `‖(α + K*K)⁻¹ x‖ = α⁻¹ ‖R_α K x - x‖ → 0`.
- **Saturation for noisy data** (`eq_zero_of_isLittleO_tikhonov_noisy`). Let `K` be compact with
  infinite-dimensional range, let `α(δ, yᵟ) > 0` be any parameter choice, and let `E` bound the
  error: `‖R_{α(δ, yᵟ)} yᵟ - x‖ ≤ E δ` for every `δ > 0` and all data with `‖yᵟ - K x‖ ≤ δ`. If
  `E δ = o(δ^{2/3})` as `δ → 0⁺`, then `x = 0` [EHN, Proposition 5.3 with (5.20), p. 120, where
  the data set is the larger `‖Q (y - yᵟ)‖ ≤ δ`, `Q` the projection onto the closure of the
  range; its proof uses only data with `‖yᵟ - y‖ ≤ δ`]. No orthogonality of `x` to the kernel is
  assumed: the Tikhonov solutions lie in the closed subspace `(ker K)ᗮ`, so an error that tends to
  `0` forces `x` into it. The bound function `E` replaces a supremum over the data, which could
  be infinite.
- Remark: by saturation, `‖R_α K x - x‖` is not `o(α)` for `x = (K*K)^ν w ≠ 0`, so no source
  condition with `ν > 1` gives a better rate than `O(α)`.

**Checks.**

- sup_t α t^ν / (α + t) at `α = 0.01` on a grid: `0.18021` at `ν = ¼` and `0.05` at `ν = ½`,
  equal to `ν^ν (1-ν)^{1-ν} α^ν`, and `α` at `ν = 1`.
- On 300 random real matrices with `x† = (K^T K)^ν w`, the largest ratios of the error to the
  three bounds are `0.91`, `0.87` and `0.66`.
- `K = diag(1/n)`, `n ≤ 20000`: for `x = K*K z` with `zₙ = 1/n`, `‖R_α K x - x‖ / α` is `1.19`,
  `1.25`, `1.27`, `1.28` at `α = 10⁻², …, 10⁻⁵`, approaching `‖z‖ = 1.28`; for `xₙ = 1/n`, which
  is not in `R(K*K)`, it is `28`, `157`, `883`, `4.9·10³`, growing like `α^{-3/4}`.
- Negative control: the rate bound fails at `ν = 2` with constant `1`: for `K = id` on `𝕜`,
  `w = 1`, the error is `α / (α + 1)`, not `≤ α²` for small `α`.
- Negative control for infinite-dimensional range in the noisy saturation: for `K = id` on `𝕜`,
  `x = 1` and `α(δ, yᵟ) = δ`, the error `|yᵟ / (1 + δ) - 1| = |yᵟ - 1 - δ| / (1 + δ)` is at most
  `2δ = o(δ^{2/3})`, although `x ≠ 0`.

### 4.3 Morozov's discrepancy principle

- **Minimum norm solutions with discrepancy** (`IsMinNormDiscrepancySolution`): `‖K x - y‖ ≤ δ`
  and `‖x‖ ≤ ‖z‖` whenever `‖K z - y‖ ≤ δ` [Kr, Definition 16.17, p. 334].
- **Existence and uniqueness** (`existsUnique_isMinNormDiscrepancySolution`). If some `x` has
  `‖K x - y‖ ≤ δ`, there is exactly one minimum norm solution with discrepancy `δ`, and it is `0`
  exactly when `‖y‖ ≤ δ` [Kr, Theorem 16.18, p. 335, for dense range]. Route: the minimal-norm
  element of a nonempty closed convex set.
- **Morozov's discrepancy principle** (`exists_morozov_parameter`). For dense range and
  `0 < δ < ‖y‖`, the minimum norm solution is `R_α y` for some `α > 0` with
  `‖K R_α y - y‖ = δ`, and `α (‖y‖ - δ) ≤ ‖K‖² δ` [Kr, Theorem 16.18, p. 335, and (16.20),
  p. 336]; [BB, Definition 6.1, p. 40] states the principle for iterative methods. Route: the
  residual `α ↦ ‖K R_α y - y‖` is continuous, tends to `‖y‖` as `α → ∞` and to `0` as `α → 0` by
  dense range.
- **Regularity** (`tendsto_isMinNormDiscrepancySolution`). For `x†` orthogonal to the kernel and
  data `‖yᵟ - K x†‖ ≤ δ`, the minimum norm solutions with discrepancy `δ` tend to `x†`, uniformly
  over the data [Kr, Theorem 16.19, p. 336, for injective `K` with dense range and
  `δ < ‖yᵟ‖`, by the same argument]. Route: `x†` is admissible, so `‖x‖ ≤ ‖x†‖`; a weak limit
  point `z` has `K z = K x†` and `‖z‖ ≤ ‖x†‖`, hence `z = x†`; then norm convergence.
- **Rate** (`norm_sub_le_of_isMinNormDiscrepancySolution`). If `x† = K* z`, the error is at most
  `2 √(‖z‖ δ)` [Kr, Theorem 16.20, p. 337, the constant read off its proof]. Route:
  `‖x - x†‖² ≤ 2 Re ⟪K x† - K x, z⟫ ≤ 4 δ ‖z‖`; injectivity and dense range are not used.

**Checks.**

- `‖y‖ ≤ δ`: the minimum norm solution is `0`.
- Scalar `K = k ≠ 0`: the residual `α |y| / (α + k²)` equals `δ` at `α = k² δ / (|y| - δ)`, so
  the bound `α (‖y‖ - δ) ≤ ‖K‖² δ` is attained.
- On 200 random real matrices of full row rank, `α (‖y‖ - δ) / (‖K‖² δ)` is at most `1` (up to
  rounding), no random admissible perturbation of the solution has smaller norm, and the rate
  ratio `‖x - x†‖ / (2√(‖z‖δ))` is at most `0.61`.
- Negative control for dense range: for `K x = (x, 0)` from `𝕜` to `𝕜²`, `y = (1, 1)` and
  `δ = 1 < ‖y‖`, the admissible set is `{x : |x - 1|² + 1 ≤ 1} = {1}`, so the minimum norm
  solution is `1`, while every Tikhonov solution `1/(1 + α)` with `α > 0` has residual `> 1`.

## Layer 5: the Landweber iteration

### 5.1 Iterates, filter and a priori stopping

- **The Landweber operators** (`landweberFilter`): `R_m = a ∑_{k=0}^{m} (I - a K*K)^k K*`; the
  index `m` counts `m + 1` gradient steps [Kr, Theorem 15.27, p. 319].
- **The iterates** (`landweberIterate`): `x₀ = a K* y`, `x_k = (I - a K*K) x_{k-1} + a K* y`
  [Kr, (15.45), p. 319]. Engl–Hanke–Neubauer start from `0` and normalize `a = 1`,
  `‖K‖ ≤ 1` [EHN, Theorem 6.1, p. 155].
- **Iterates and filter** (`landweberIterate_eq`): x_m = R_m y. Route: induction on `m`.
- **Noise amplification** (`norm_landweberFilter_le`). For `0 < a` and `a ‖K‖² ≤ 1`,
  `‖R_m‖ ≤ √(a (m + 1))` [Kr, Theorem 15.27, p. 319]; [EHN, Lemma 6.2, p. 156]. Route: in the
  functional calculus `R_m R_m* = r(K K*)` with `r(t) = (1 - (1 - a t)^{m+1})² / t`, and
  `1 - (1 - a t)^{m+1} ≤ min(1, (m + 1) a t)` on `[0, 1/a]`.
- **Scheme property** (`isRegularizationScheme_landweberFilter`). For `0 < a ‖K‖² < 2`, `(R_m)`
  is a regularization scheme as `m → ∞` [EHN, Theorem 6.1, p. 155, by the same argument with
  Theorem 4.1, p. 72]; [Kr, Theorem 15.27, p. 319, for compact injective `K` and
  `a ‖K‖² < 1`]. Route: `R_m K x - x = -(I - a K*K)^{m+1} x`; the operators `(I - a K*K)^{m+1}`
  are bounded by `1`, and on `R(K*)` they tend to `0` since
  `sup_{0 < t ≤ ‖K‖²} |1 - a t|^{m+1} √t → 0`.
- **A priori stopping** (`isRegularParameterChoice_landweberFilter`). For `0 < a ‖K‖² ≤ 1`,
  `m(δ) → ∞` and `δ² m(δ) → 0` give a regular choice. Route: 3.1 with the noise bound.

**Checks.**

- `K = id` on `𝕜`, `a = 1`: R_0 = 1 = √(a · 1), so the bound is sharp at `m = 0`; the
  off-by-one bound `√(a m)` would give `0`.
- Negative control: `K = id`, `a = 3/2` (so `a ‖K‖² > 1`): `‖R_0‖ = 3/2 > √(3/2)`.
- `K = diag(1, 1/2, 1/10)`, `x = (1, 1, 1)`: `‖R_200 K x - x‖` is `0.021` for `a = 1.9` and
  `2.1·10⁸` for `a = 2.1`.
- The iterates and `R_m y` agree to `3·10⁻¹⁶` for `m ≤ 7` on a random `4 × 5` matrix.

### 5.2 Discrepancy stopping

- **The stopping index** (`landweberDiscrepancyIndex`): the least `m` with
  `‖K R_m yᵟ - yᵟ‖ ≤ γ δ`, and `0` when there is none.
- **Discrepancy stopping** (`exists_landweber_discrepancy_tendsto`). Let `0 < a ‖K‖² ≤ 1`,
  `γ > 1` and `x†` orthogonal to the kernel. For every `δ > 0` and data with
  `‖yᵟ - K x†‖ ≤ δ`, some index meets the discrepancy bound, and the least one gives
  `R_{m(δ, yᵟ)} yᵟ → x†` uniformly over the data [Kr, Theorems 15.28 and 15.29, p. 320, for
  compact injective `K` with dense range]; [EHN, Theorem 6.5, p. 159, and Proposition 6.4,
  p. 158, for bounded `K`]. Route: the residual is `(I - a K K*)^{m+1} yᵟ`, which tends to the
  component of `yᵟ` orthogonal to the range, of norm at most `δ < γ δ`; regularity as in Kress,
  from `(γ - 1) δ < ‖K R_{m-1} yᵟ - yᵟ‖ - δ` and `√(m + 1) ‖K R_{m-1} K x - K x‖ → 0`.

**Checks.**

- `K = diag(n^{-3/2})`, `n ≤ 200`, `x†ₙ = 1/n`, `a = 1`, `γ = 3/2`, and Gaussian noise rescaled to
  norm `δ`: the stopping indices
  are `183`, `5552` and `140104`, and the errors `0.34`, `0.18` and `0.093`, at
  `δ = 10⁻², 10⁻³, 10⁻⁴`.
- `landweberDiscrepancyIndex` is `0` when no index meets the bound (`Nat.sInf ∅ = 0`), and also
  when R_0 already does: for `K = id` and `a = 1`, R_0 is the identity and the residual is `0`.
- For `K x = (x, 0)` from `𝕜` to `𝕜²`, `a = ½`, `γ = 3/2` and `yᵟ = (1, δ)`, the residual of
  `R_m yᵟ` has norm `√(4^{-(m+1)} + δ²)`, so the index is `3` at `δ = 0.1` and `6` at `δ = 0.01`,
  with errors `1/16` and `1/128`.
- Negative control for `γ > 1`: for `K x = (x, 0)` from `𝕜` to `𝕜²`, `a = ½`, `x† = 1` and
  `yᵟ = (1, δ)`, the residual of `R_m yᵟ` is `((½)^{m+1}, δ)`, of norm `> δ` for every `m`, so
  with `γ = 1` no index stops.

## Layer 6: variational regularization in Banach spaces

### 6.1 Bregman distances

- **The Bregman distance** (`bregmanDist`): `D_J^{p₀}(u, u₀) = J u - J u₀ - p₀ (u - u₀)` in
  `EReal`, for `p₀ ∈ ∂J(u₀)` [BB, Definition 3.3, p. 18].
- **The symmetric Bregman distance** (`symmetricBregmanDist`): `(p - p₀)(u - u₀)` for
  `p ∈ ∂J(u)`, `p₀ ∈ ∂J(u₀)` [BB, p. 19, after Definition 3.3; Lemma 5.13, p. 34].
- For such subgradients the symmetric Bregman distance is `D_J^{p₀}(u, u₀) + D_J^{p}(u₀, u)`;
  both summands are finite because `J u` and `J u₀` are.
- **The adjoint functional** (`adjointFunctional`): `K* v = ⟪v, K ·⟫` for `K : U →L[ℝ] V`.
- **Nonnegativity** (`bregmanDist_nonneg`, `symmetricBregmanDist_nonneg`, both proved in
  `Suggested.lean` as sanity checks: the first from the subgradient inequality with `J u₀`
  finite, the second from Tau Ceti's `TauCeti.apply_le_apply_of_mem_subdifferential`).

**Checks.**

- `J = |·|` on `ℝ`, `u₀ = 0`, `p₀ = ½`: `D(u, 0) = |u| - u/2 ≥ 0`, and `D(u, 0) = 0` only at
  `u = 0`; with `p₀ = 1` it vanishes on `[0, ∞)`, so a Bregman distance is not a metric.
- Negative control: `p₀ = 2` is not a subgradient of `|·|` at `0`, and `D(1, 0) = -1 < 0`.
- Junk value: if `J u = ⊤`, then `D_J^{p₀}(u, u₀) = ⊤`; if `J u₀ = ⊤` there is no subgradient at
  `u₀` (Tau Ceti's convention), so `⊤ - ⊤ = ⊥` never enters a statement.

### 6.2 Variational regularization and the Bregman error estimate

- **The source condition** (`le_of_mem_subdifferential_adjointFunctional`). If `K* v ∈ ∂J(u†)`,
  then `u†` minimizes `J` on `{u : K u = K u†}` [BB, Definition 5.9, p. 33; Definition 5.2,
  p. 28]. Proved in `Suggested.lean` as a sanity check: the subgradient inequality with
  `⟪v, K (u - u†)⟫ = 0`.
- **The optimality condition** (`mem_subdifferential_of_isMinOn`). If `J` is convex and never
  `⊥`, `α > 0`, and `u_α` minimizes `½ ‖K u - fᵟ‖² + α J u` with `J u_α` finite, then
  `p_α = K* (fᵟ - K u_α) / α ∈ ∂J(u_α)` [BB, (5.4), p. 28]. Route: the sum rule and
  the linear chain rule of ConvexAnalysisAndDuality §3.5, with the quadratic fidelity continuous
  on `U`; or directly, comparing `u_α` with `u_α + t (u - u_α)` and letting `t → 0⁺`.
- **The Bregman error estimate** (`symmetricBregmanDist_add_le`). In the situation above, with
  `K u† = f`, `‖fᵟ - f‖ ≤ δ` and the source condition `K* v ∈ ∂J(u†)`:
  - `D^symm(u†, u_α) = (K* v - p_α)(u† - u_α) ≥ 0`;
  - `D^symm(u†, u_α) + ‖K u_α - fᵟ‖² / (2α) ≤ δ² / (2α) + α ‖v‖² / 2`;
  - for `v ≠ 0` and `α = δ / ‖v‖`, `D^symm(u†, u_α) ≤ ‖v‖ δ`.

  This is [BB, Lemma 5.13, p. 34, and Example 5.16, p. 36] with
  `J(·, α) = α J`. Benning and Burger measure the noise by `½ ‖f - fᵟ‖² ≤ δ`, so their `δ/α` is
  `δ² / (2α)` here, and their choice `α = √(2δ)/‖v‖` with rate `O(√δ)` is the choice
  `α = δ/‖v‖` with rate `O(δ)` here. Route: with `r = K u_α - fᵟ` and `e = f - fᵟ`, the left side
  of the second bullet equals `‖e‖² / (2α) + α ‖v‖² / 2 - ‖r - e + α v‖² / (2α)` by algebra.
  Existence of `u_α` is a hypothesis; it is
  [BB, Theorem 5.6, p. 30] under their Assumption 5.4, p. 29.
- **The quadratic case** (`mem_subdifferential_half_sq_norm_iff`). On a real Hilbert space `H`,
  the subgradients of `½ ‖·‖²` at `u` are the functional `⟪u, ·⟫` alone, the symmetric Bregman
  distance is `‖u - u₀‖²`, and the source condition reads `u† = K* v` with the Hilbert adjoint.
  Route: Gâteaux differentiability of `½ ‖·‖²`.
- In the quadratic case the minimizer `u_α` is the Tikhonov solution with parameter `α`, and the
  Bregman estimate gives `‖u_α - u†‖ ≤ √(‖v‖ δ)` at `α = δ / ‖v‖`, the order of the rate of 4.2 at
  `ν = ½`, because `R((K*K)^{1/2}) = R(K*)`.

**Checks.**

- `J = ½ ‖·‖² + λ ‖·‖₁` on `ℝⁿ` (`n ≤ 5`, `λ ∈ [0, 1]`), random `K`, `u† = prox(K^T v)` so that
  `K^T v ∈ ∂J(u†)`: over 60 trials the symmetric Bregman distance is never negative, and the
  ratio of the left to the right side of the estimate is at most `0.93`.
- The estimate is an equality when `r - e + α v = 0` and `‖e‖ = δ`; the bound cannot be improved
  in general.
- Negative control for convexity: `U = V = ℝ`, `K = id`, `fᵟ = 0`, `α = 1` and the concave
  `J u = -u²/2`: the objective is identically `0`, so `u_α = 0` is a minimizer with `p_α = 0`, but
  `0` is not a subgradient of `J` at `0`, since `J 1 = -½ < 0`.

## Downstream consumers

- Bayesian inverse problems with Gaussian priors consume the Tikhonov operator and its variational
  characterization (4.1), through which the maximum a posteriori estimator of a linear Gaussian
  problem is a Tikhonov solution.
- Numerical methods for first-kind integral equations consume the Picard criterion (1.2), the
  spectral filters (3.2) and the discrepancy principle (4.3).
- Parametric model reduction and Kolmogorov widths consume the singular systems of Layer 1 and
  the cut-off of 3.2.

## Scope and ownership

The roadmap is complete when Tau Ceti proves every statement of `Suggested.lean` and the prose
targets of the layers above.

1. **Singular systems and Picard.** Singular systems, their existence for compact operators
   read off the Schmidt series of BanachSpaceTheory §4.5, the expansion, the adjoint and Gram
   systems, finite rank, and Picard's criterion.
2. **The generalized inverse.** Least-squares solutions, the Moore–Penrose generalized inverse
   of a bounded operator as a closed, densely defined linear partial map, the normal equation,
   minimal norm, the Moore–Penrose equations, boundedness exactly for closed range, the Picard
   series for compact operators, and agreement with the finite-dimensional inverse.
3. **Schemes.** Regularization schemes along a filter, regular and a priori parameter choices,
   error splitting, unboundedness, Bakushinskii's theorem, spectral filters and the cut-off.
4. **Tikhonov.** The Tikhonov operator and functional, norm bounds, the scheme property, the
   filter series, a priori convergence, rates under source conditions `0 < ν ≤ 1`, the converse
   at `ν = 1`, saturation for exact and for noisy data, and Morozov's discrepancy principle with
   its regularity and rate.
5. **Landweber.** Iterates and filter, noise amplification, the scheme property, a priori and
   discrepancy stopping.
6. **Bregman.** Bregman distances, the source condition, the optimality condition, the Bregman
   error estimate and the quadratic case.

The numbers are those of the layers above, and k.n names subsection `n` of Layer `k`.

**Not owned here.**
- The spectral theorem for compact self-adjoint operators and approximation numbers: Tau Ceti.
- The compact Schmidt series (ordered singular values with multiplicity, the orthonormal
  families, the expansion and `sⱼ → 0`) and the identity `sₙ = aₙ(K)` with the approximation
  numbers: BanachSpaceTheory §4.5. Here 1.1 reads that series as an unordered singular system;
  the predicate `IsSingularSystem`, the expansion for an arbitrary singular system, the adjoint
  and Gram systems, finite rank and Picard's criterion are owned here.
- The continuous functional calculus for bounded self-adjoint operators over `RCLike 𝕜`, and the
  finite-dimensional singular system and Moore–Penrose inverse: Tau Ceti, as targets PD-A10 and
  PD-C07–PD-C28 of the PolarDecomposition roadmap of
  [OperatorTheory](../OperatorTheory/PolarDecomposition/README.md).
- Subdifferentials of `EReal`-valued functions and their monotonicity (Tau Ceti), and the sum and
  chain rules ([ConvexAnalysisAndDuality](../ConvexAnalysisAndDuality/README.md) §3.5).
- Bregman divergences of differentiable functions, with nonnegativity and the three-point
  identity, belong to [OnlineConvexOptimization](../OnlineConvexOptimization/README.md) §4.1, and
  those of Legendre functions are an example of Layer 4 of ConvexAnalysisAndDuality, defined
  through its §4.3. The subgradient form of 6.1, for `EReal`-valued convex `J` and any
  subgradient, is owned here; at a point of differentiability it is the former.
- The closed-range theorem and the bounded generalized inverse of an adjointable operator on a
  Hilbert C*-module belong to [HilbertModules](../HilbertModules/README.md) §2.8. Here 2.1–2.2
  treat the generally unbounded `K†` of a bounded operator between Hilbert spaces over `RCLike 𝕜`
  as a linear partial map; the closed-range case of 2.2 over `ℂ` is the case `A = ℂ` there.
- Least-squares solutions of a linear map between finite-dimensional real inner product spaces
  (the predicate, the normal equations, the solution set `b + ker X` and the solution of least
  norm) belong to [GaussianLinearModels](../GaussianLinearModels/README.md) §1.1. Here 2.1 is the
  statement for a bounded operator between Hilbert spaces over `RCLike 𝕜`, where a least-squares
  solution exists only on the domain `R(K) + R(K)⊥` of `K†`; on finite-dimensional real spaces
  `IsLeastSquaresSolution` is the least-squares predicate of that section.
- Condition numbers and perturbation of least-squares problems in finite dimension belong to the
  roadmap ConditioningAndPerturbation; this roadmap has no finite-dimensional
  conditioning statement.
- Gaussian measures, the Bayesian posterior and the maximum a posteriori estimator: no Tau Ceti
  roadmap owns them, and this roadmap states no result about them.

Boundary in one sentence: linear regularization of bounded operators between Hilbert spaces, and
the convex variational estimate in Banach spaces, are here; nonlinear operators, statistical
noise models and finite-dimensional conditioning are not.

## Exact supplier contracts

### From Mathlib

- **Hilbert spaces:** `ContinuousLinearMap.adjoint`, `ContinuousLinearMap.orthogonal_range`,
  `Submodule.starProjection` with `Submodule.HasOrthogonalProjection`, `Submodule.orthogonal`,
  `Orthonormal`, `HasSum`, `innerSL`.
- **Partial maps:** `LinearPMap`, `Submodule.toLinearPMap` with
  `Submodule.toLinearPMap_graph_eq`, `LinearPMap.graph` and `LinearPMap.IsClosed`.
- **Coercive forms:** `IsCoercive.continuousLinearEquivOfBilin` (Lax–Milgram), for 4.1.
- **Functional calculus:** `cfc`, and `Real.rpow` for the powers.
- **Duality:** `StrongDual`, `topDualPairing`.
- **Asymptotics and filters:** `Asymptotics.IsBigO`, `Asymptotics.IsLittleO`, `Filter.Tendsto`,
  `nhdsWithin`, `Filter.atTop`, `Filter.cofinite`, `Ring.inverse`, `IsCompactOperator`.

### From Tau Ceti

- **Compact self-adjoint operators:**
  `ContinuousLinearMap.exists_hilbertBasis_forall_hasEigenvector`
  (`TauCeti/Analysis/InnerProductSpace/Spectrum.lean`): a compact self-adjoint operator has a
  Hilbert basis of eigenvectors.
- **Approximation numbers:** `ContinuousLinearMap.singularValue`
  (`TauCeti/Analysis/OperatorIdeal/ApproximationNumber/Compact.lean`).
- **Functional calculus over `RCLike 𝕜`:** the instance
  `ContinuousFunctionalCalculus ℝ (E →L[𝕜] E) IsSelfAdjoint`
  (`TauCeti/Analysis/InnerProductSpace/ContinuousFunctionalCalculus.lean`), PolarDecomposition's
  PD-A10.
- **Moore–Penrose inverse in finite dimension:** `LinearMap.IsMoorePenroseInverse`,
  `LinearMap.moorePenroseInverse` and
  `LinearMap.isMoorePenroseInverse_iff_eq_moorePenroseInverse`
  (`TauCeti/Analysis/InnerProductSpace/MoorePenrose.lean`), PolarDecomposition's PD-C19–PD-C23.
- **Subdifferentials:** `TauCeti.subdifferential` and
  `TauCeti.apply_le_apply_of_mem_subdifferential`
  (`TauCeti/Analysis/Convex/Subdifferential.lean`).

### From BanachSpaceTheory

[BanachSpaceTheory](../BanachSpaceTheory/README.md) §4.5 supplies the compact Schmidt series of a
compact operator between complete real or complex Hilbert spaces: orthonormal `(eⱼ)`, `(fⱼ)`,
`sⱼ > 0` nonincreasing with multiplicity, `fⱼ = sⱼ⁻¹ K eⱼ`, the expansion
`K x = ∑ sⱼ ⟪eⱼ, x⟫ fⱼ` vanishing on the kernel, `sⱼ → 0` in the infinite-rank case, and
`sₙ = aₙ(K)` for Tau Ceti's approximation numbers (1.1 and the Conventions).

### From ConvexAnalysisAndDuality

[ConvexAnalysisAndDuality](../ConvexAnalysisAndDuality/README.md) supplies its Conventions for
`EReal`-valued convex functions and pairings, and §3.5, the sum rule and the linear chain rule
for the subdifferential under a continuity qualification, used in the route of 6.2. The quadratic
fidelity `u ↦ ½ ‖K u - fᵟ‖²` is continuous and finite everywhere, which is the qualification.

### From OperatorTheory

The PolarDecomposition roadmap of
[OperatorTheory](../OperatorTheory/PolarDecomposition/README.md) owns the continuous
functional calculus over `RCLike 𝕜` (Part A, PD-A10) and the finite-dimensional
singular system and Moore–Penrose inverse (Part C, PD-C07–PD-C28). Both are implemented in Tau
Ceti at the names above, and this roadmap consumes them there.

## Beyond this roadmap (a roadmap for a roadmap; do not implement)

No Tau Ceti roadmap owns these topics; each is material for a further roadmap built on this one.

- The conjugate gradient method as a nonlinear regularization and its stopping rules [EHN,
  Chapter 7].
- General spectral regularization with qualification, order optimality, the ν-methods and
  heuristic parameter choices such as the L-curve [EHN, Chapters 4 and 6; Ha, §7.5, p. 187].
- Regularization with differential operators and Hilbert scales [EHN, Chapter 8].
- Nonlinear Tikhonov regularization and nonlinear Landweber iteration [EHN, Chapters 10–11].
- Total variation and sparsity regularization, Bregman iterations and inverse scale space
  methods [BB, §§3, 6–7].

## Prior formalization

[lean-NASC](https://github.com/bjbraams/lean-NASC) (Apache-2.0), by the author of this roadmap,
at commit 8efdbf7, states targets of Layers 1–5 over real Hilbert spaces in the module
`NASC/Regularization.lean`, in its own form. It proves without `sorry`:

- 3.1: the a priori convergence along a single data path, from the error splitting
  (regularization_tendsto_of_noise_control), weaker than the uniform regularity of 3.1;
- 4.1: a bounded solution operator of the regularized normal equation with norm at most
  `1/(2√α)`, whose value is the strict minimizer of the Tikhonov functional
  (exists_tikhonov_normalSolve), with the Lax–Milgram route of 4.1;
- 4.2: the noisy-data bound `δ / (2√α) + α ‖w‖` for `x† = K*K w`, the case `ν = 1` of the second
  rate bound (tikhonov_error_le_of_adjoint_source).

Its Picard criterion, closed graph of `K†`, Morozov principle and Landweber statements are stated
with `sorry`. Its modules are a cited source, not the specification.

## References

- [Kr] R. Kress, *Linear Integral Equations*, 3rd ed., Applied Mathematical Sciences 82,
  Springer, 2014, Chapters 15–16.
- [EHN] H. W. Engl, M. Hanke, A. Neubauer, *Regularization of Inverse Problems*, Mathematics and
  Its Applications 375, Kluwer, 1996, Chapters 2–6.
- [BB] M. Benning, M. Burger, Modern regularization methods for inverse problems, *Acta
  Numerica* 27 (2018), 1–111, §§3–6.
- [Ha] P. C. Hansen, *Rank-Deficient and Discrete Ill-Posed Problems: Numerical Aspects of Linear
  Inversion*, SIAM, 1998, Chapters 3–4.

Locators into [BB] are those of the Acta Numerica printing; the arXiv version (1801.09922v1)
numbers definitions, lemmas and examples in separate sequences and its equations differently.
