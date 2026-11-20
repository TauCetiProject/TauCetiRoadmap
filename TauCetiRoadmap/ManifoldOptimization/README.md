# Roadmap: Riemannian optimization — retractions, matrix manifolds, and convergence of manifold algorithms

**Summary.** This roadmap develops optimization on Riemannian manifolds: minimizing a smooth cost
`f : M → ℝ` by computing in tangent spaces and returning to `M` through a *retraction*, following
Boumal's textbook [B23] and, for Newton's method and trust regions, Absil, Mahony and Sepulchre
[AMS08]. Its objects are the standard matrix manifolds as concrete Riemannian manifolds (spheres,
oblique and Stiefel manifolds, orthogonal groups, the Grassmannian with its quotient metric,
fixed-rank matrices, positive-definite matrices with the affine-invariant metric, and the open
simplex, multinomial and doubly stochastic manifolds with the Fisher metric); the extrinsic formulas
that compute Riemannian gradients and Hessians from Euclidean ones; retractions and vector
transports; and three algorithms, defined as total functions: Riemannian gradient descent with a
fixed step or Armijo backtracking, Newton's method, and the trust-region method with truncated
conjugate gradients.

The headline theorems are:

- **Global complexity.** If `f` is bounded below by `f_low` and satisfies the quadratic upper bound
  `f(R_x(v)) ≤ f(x) + ⟪grad f(x), v⟫ + (L/2)‖v‖²` for a retraction `R` defined on the whole tangent
  bundle, then among the first `K` iterates of gradient descent with step `1/L` one has
  `‖grad f‖ ≤ √(2L(f(x₀) − f_low)/K)`. The trust-region method, with a self-adjoint model Hessian
  bounded by some `β > 0`, steps satisfying Cauchy decrease, and the same kind of quadratic bound at
  its trial steps, reaches `‖grad f‖ ≤ ε` within an explicit `O(1/ε²)` number of iterations [BAC19].
- **Newton's method** converges locally quadratically to every nondegenerate critical point, of any
  index and for every retraction [AMS08].
- **Trust regions with truncated conjugate gradients** converge locally to every nondegenerate
  local minimizer, with order `min(1 + θ, 2)` for the inner stopping exponent `θ > 0` [ABG07].
- **The Rayleigh quotient.** For a symmetric operator `A`, every second-order critical point of
  `x ↦ −⟪Ax, x⟫` on the unit sphere is a global minimizer.
- **Geodesic convexity.** On a complete manifold, if `f` is `κ`-strongly geodesically convex with
  `κ > 0` and satisfies the quadratic upper bound above with constant `L`, gradient descent with step
  `1/L` converges linearly: `f(x_k) − min f ≤ (1 − κ/L)^k (f(x₀) − min f)`.

Within Tau Ceti, the roadmap consumes the Riemannian gradient, Hessian, Levi-Civita connection and
exponential map that Tau Ceti already has (DifferentialGeometry and the completed HopfRinow roadmap).
Its embedded manifolds are Tau Ceti's regular level sets (SmoothBundlesConnections), compared with
Tau Ceti's Stiefel manifolds and TopologicalKTheory's smooth Grassmannian. Its convexity layer gives
the Riemannian characterization of the metric geodesic convexity used in OptimalTransport. From
MorseTheory it takes nondegenerate critical points and the continuous gradient flow, of which the
algorithms here are discretizations.

Layer 0 builds the matrix manifolds; Layer 1 the extrinsic gradient and Hessian formulas; Layer 2
retractions, their order and Taylor expansions, and vector transports; Layer 3 optimality
conditions; Layer 4 the algorithms and their global complexity bounds; Layer 5 local rates; Layer 6
geodesic convexity and its consequences. The worked examples (the Rayleigh quotient, a product of
spheres, Brockett's cost, principal subspaces, entropic transport) exercise the layers together.

## Conventions

- **Setting.** Manifolds are finite-dimensional, real, Hausdorff and boundaryless; algorithms are
  deterministic and run in exact arithmetic. `I : ModelWithCorners ℝ E H` with
  `[FiniteDimensional ℝ E] [I.Boundaryless]`, and `M` with `[TopologicalSpace M] [T2Space M]
  [ChartedSpace H M] [IsManifold I ∞ M]`. The metric is the canonical instance
  `[RiemannianBundle (fun x : M ↦ TangentSpace I x)]` with
  `[IsContMDiffRiemannianBundle I ∞ E (fun x : M ↦ TangentSpace I x)]`; no definition takes a second
  metric argument. Fibre norms and inner products are Mathlib's instances scoped in `Bundle`, so
  files `open Bundle`.
- **Distances and rates.** A statement about distances or rates assumes `[MetricSpace M]` and
  `[IsRiemannianManifold I M]`, identifying `dist` with the Riemannian distance; since that distance
  is infinite between components, the two force `M` to be connected. Rates are explicit
  inequalities: *linear* means `d(x_k, x*) ≤ C q^k d(x₀, x*)` for all `k`, with `0 ≤ q < 1`;
  *quadratic* means `d(x_{k+1}, x*) ≤ c d(x_k, x*)²` for all `k`; *order `p`* means
  `d(x_{k+1}, x*) ≤ c d(x_k, x*)^p` for all sufficiently large `k`.
- **Distances on the matrix manifolds.** An embedded manifold of Layer 0 is a subtype of its ambient
  space and inherits the ambient metric (chordal on the sphere, Frobenius on matrices), for which
  `IsRiemannianManifold` fails; on the sphere it has no nonconstant geodesic segments at all. The
  inherited metric is never used for distance-level statements about these manifolds (completeness,
  distance formulas, geodesic segments, convexity, rates). They are made for the Riemannian
  distance, whose topology is definitionally the manifold topology. On a connected manifold `X`
  this is `TauCeti.MetricSpace.ofRiemannianMetric I X`, which takes `[PreconnectedSpace X]`; it is
  installed locally (`letI`), as Tau Ceti's `HyperbolicMetric` does, and it is the `MetricSpace`
  instance of `P(n)` and of the Fisher manifolds, which are convex and hence connected. The
  Riemannian distance between points of different components is infinite
  (`TauCeti.Manifold.riemannianEDist_lt_top_iff_mem_connectedComponent`), so on a disconnected
  manifold (`O(n) = St(n, n)` for `n ≥ 1`, the sphere of a one-dimensional `V`, `OB(1, m)` for
  `m ≥ 1`, and `ℝ_n^{n×n}`) no `MetricSpace` satisfies `IsRiemannianManifold`. Such a manifold takes
  Mathlib's extended metric `EMetricSpace.ofRiemannianMetric I X`, installed locally, and statements
  that need a finite distance, those of Layers 5 and 6 among them, are made on a connected component
  with its structure from O0.2.
- **Embedded charts.** An embedded manifold of Layer 0 is a subtype `{x : V // h x = 0}` of a
  finite-dimensional inner-product space with Tau Ceti's regular-level charts, or is glued from such
  subtypes (O0.1). The charts are modelled on `Fin k → ℝ` with `𝓘(ℝ, Fin k → ℝ)`, where
  `k = dim V − dim F`.
- **Gradient and Hessian.** The gradient is Tau Ceti's `TauCeti.Manifold.mgradient I f x`, and the
  Hessian bilinear form is Tau Ceti's `TauCeti.Manifold.hessian I f x v w = ⟪∇_v grad f, w⟫`
  (DifferentialGeometry 12.2–12.3). The Hessian operator
  `hessianOp I f x : TangentSpace I x →L[ℝ] TangentSpace I x` is `∇(grad f)` at `x` for Mathlib's
  `CovariantDerivative.leviCivitaConnection`, so `hessian I f x v w = ⟪hessianOp I f x v, w⟫` holds by
  definition. It is the operator form of the same Hessian, not a second one. At a critical point
  Tau Ceti identifies `hessian` with the chart Hessian `TauCeti.criticalHessian`
  (`TauCeti.Manifold.hessian_eq_criticalHessian`), and O3.6 identifies
  `TauCeti.IsManifoldNondegenerateCriticalPoint` with invertibility of `hessianOp`.
- **Minimization.** Every algorithm minimizes. A maximization problem is stated by negating the
  cost; Manopt's first example is the cost `x ↦ −⟪A x, x⟫` on the sphere.
- **Euclidean data.** `V` and `F` are finite-dimensional real inner-product spaces. The Euclidean
  gradient is Mathlib's `gradient`, the Euclidean Hessian operator is `fderiv ℝ (gradient f̄)`, and
  orthogonal projection onto a submodule `K` is `K.starProjection : V →L[ℝ] V`.
- **Matrices.** The ambient space of `n × p` real matrices is `EuclideanSpace ℝ (Fin n × Fin p)`,
  whose inner product is the Frobenius product `⟪A, B⟫ = tr(AᵀB)`. Products, transposes and traces
  are read through the linear equivalence
  `toMatrix : EuclideanSpace ℝ (Fin n × Fin p) ≃ₗ[ℝ] Matrix (Fin n) (Fin p) ℝ`,
  `toMatrix A i j = A (i, j)`; do not install a global inner-product instance on `Matrix`. A
  structure on a subset of `Matrix` (`Matrix.orthogonalGroup`, say) is compared with a manifold here
  through the bijection that `toMatrix` restricts to, never through the identity, since the two live
  in different types. `Sym(p)` and `Skew(p)` are the symmetric and skew-symmetric subspaces with the
  restricted inner product, and `sym(A) = (A + Aᵀ)/2`.
- **Spectral data.** The singular values `σᵢ(A)` are Mathlib's `LinearMap.singularValues` of
  `Matrix.toEuclideanLin (toMatrix A)`: zero-indexed and nonincreasing, so `σ₀(A)` is the operator
  norm (`‖A‖` is the Frobenius norm), which is also OperatorIdeals' convention. Square roots,
  exponentials and logarithms of symmetric matrices are Mathlib's continuous functional calculus
  `cfc`, from `Matrix.IsHermitian.instContinuousFunctionalCalculus`: `X^{1/2} = cfc Real.sqrt X`,
  `X^{−1/2} = cfc (fun t ↦ (√t)⁻¹) X`, `expm S = cfc Real.exp S` and `logm X = cfc Real.log X`. The
  Q-factor `qf(Z)` of a matrix `Z` of full column rank has the columns
  `InnerProductSpace.gramSchmidtNormed` makes from the columns of `Z`: the orthonormal factor of the
  QR decomposition with positive diagonal.
- **Entrywise operations.** On matrices, read through `toMatrix`, `⊙` is Mathlib's Hadamard product
  `Matrix.hadamard`, `⊘` is the entrywise quotient, and `exp`, `log` and `√` act entry by entry
  (`Matrix.map`); they are not `expm`, `logm` or `X^{1/2}`. On vectors the same operations act
  coordinatewise. `𝟏` is the all-ones vector and `diag(c)` is `Matrix.diagonal c`.
- **Fisher manifolds.** The open simplex `Δ°(n)`, the multinomial manifold `Mult(n, m)` and the
  doubly stochastic manifold `DS(n)` of O0.3 carry the Fisher metric
  `⟪ξ, η⟫_X = Σ ξ_ij η_ij / X_ij` (`Σ ξ_i η_i / x_i` on vectors), not the Euclidean one. It is pinned
  as `TauCeti.inducedRiemannianMetric` of `fisherEmbedding ∘ ι`, for `ι` the inclusion and
  `fisherEmbedding` the entrywise map `t ↦ 2√t`. That map is smooth on the positive orthant
  (`contDiffOn_fisherEmbedding`) with derivative `u ↦ u ⊘ √x` (`fderiv_fisherEmbedding_apply`), and
  the displayed formula is `inner_fderiv_fisherEmbedding`. Each Fisher manifold is a type synonym of
  its regular-level subtype, carrying the subtype's charts, this metric as its `RiemannianBundle`
  instance and its Riemannian distance as its `MetricSpace` instance, as for `P(n)`. So
  `IsInducedBy I (fisherEmbedding ∘ ι)` holds and Layer 1 applies to `fisherEmbedding ∘ ι` in place
  of `ι`. `Π_X` is the Fisher-orthogonal projection onto the tangent space at `X`.
- **Retractions are total, with domains.** A retraction is a map on the whole tangent bundle that is
  smooth on an open domain containing the zero section; theorems about its values carry the domain
  hypothesis, and a *global* retraction has domain `univ` (O2.1). This is the convention of Tau
  Ceti's `riemannianExp` and `expDomain`.
- **Iterations are total.** Algorithms are total functions iterated with `Nat.iterate`, and their
  junk values are pinned: Newton's step uses `Ring.inverse` (step `0` where the Hessian is not
  invertible); the Armijo exponent is an `sInf` over `ℕ` (`0` when no exponent qualifies, a case
  excluded by the decrease theorem); the trust-region ratio uses Lean's division (`0` on a zero
  model decrease, a case excluded by Cauchy decrease away from critical points). At a critical point
  truncated conjugate gradients returns `0`, so the ratio is `0`, the step is rejected and the
  iterate is kept.
- **Algorithm constants.** Armijo backtracking has `ᾱ > 0`, `τ ∈ (0,1)`, `r ∈ (0,1)`; the step
  size is `ᾱ τ^i` for the least `i` with `f x − f (R_x(−ᾱτ^i grad f x)) ≥ r ᾱ τ^i ‖grad f x‖²`.
  Trust regions have acceptance threshold `ρ' ∈ (0, 1/4)`, radius cap `Δ̄ > 0` and `Δ₀ ∈ (0, Δ̄]`;
  the radius is divided by `4` when `ρ < 1/4`, replaced by `min(2Δ, Δ̄)` when `ρ > 3/4` and the
  step lies on the boundary, and kept otherwise; the step is accepted exactly when `ρ > ρ'`.
  Truncated conjugate gradients has stopping parameters `θ > 0` and `κ ∈ (0, 1)`.

## Layer 0: Riemannian submanifolds and matrix manifolds

### O0.1 Locally defined submanifolds

A subset `S ⊆ V` is *locally defined of dimension `k`* when every point of `S` has an open
neighbourhood `U` and a smooth `h_U : U → F_U` with `dim V − dim F_U = k`, whose zero set is
`S ∩ U` and whose derivative is surjective on `S ∩ U` [B23, Def. 3.10]. When one `h : V → F` serves
for all of `S`, `S` is the regular level `{x : V // h x = 0}`, whose charts, manifold structure,
smooth embedding and tangent space `ker (fderiv ℝ h x)` are Tau Ceti's
(`TauCeti.regularLevelChartedSpace`, `TauCeti.isManifold_regularLevel`,
`TauCeti.isSmoothEmbedding_coe_regularLevel`, `TauCeti.range_mfderiv_coe_regularLevel`); none of
that is built again here. In general, glue the regular-level charts of the `h_U` on the open
submanifolds `U` into a charted structure on `S` modelled on `Fin k → ℝ`: on an overlap the identity
between the two regular levels is a diffeomorphism, by SmoothBundlesConnections B1.0's open
restriction and atlas independence for regular fibres. Prove `IsManifold 𝓘(ℝ, Fin k → ℝ) ∞`, that
the inclusion is a `Manifold.IsSmoothEmbedding` whose tangent range at `x` is
`ker (fderiv ℝ h_U x)` [B23, Thm. 3.15], that two families of local defining functions give the
same structure (the identity is a diffeomorphism), and that when `h` is global the structure is
`TauCeti.regularLevelChartedSpace` by the identity. Equip `S` with `TauCeti.inducedRiemannianMetric`
of the inclusion, and the synonyms of the Fisher manifolds with that of `fisherEmbedding ∘ ι`
(Conventions); the predicate `IsInducedBy I ι` records the identity `⟪v, w⟫ = ⟪ι'v, ι'w⟫` that
Layer 1 consumes.

**Checks.**

- For `h(x, y) = y` on `ℝ²` the regular level is the horizontal line, of dimension `1`, with tangent
  space `ℝ × {0}` at every point; a structure of dimension `2` fails the tangent-kernel statement.
- For `h(x, y) = x² − y²` the derivative vanishes at the origin, so the two crossing lines are not
  locally defined there.
- `h = y` and `h' = 2y` give the same structure: the identity has derivative `1`.
- `IsInducedBy` detects a rescaled metric: for `ι(x) = 2x` on `ℝ` with the Euclidean metric,
  `⟪1, 1⟫ = 1` while `⟪ι'1, ι'1⟫ = 4`.

*Needs:* Tau Ceti's regular levels; SmoothBundlesConnections B1.0 (open restriction, atlas
independence); Tau Ceti's `inducedRiemannianMetric`.

### O0.2 Products, powers, connected components and quotient metrics

Products carry Tau Ceti's product metric. Finite powers `Fin k → M` carry Mathlib's charts for
`ModelWithCorners.pi`; build here their `IsManifold` instance, the identification of the tangent
space of the power with the product of tangent spaces, and the sum metric; and the componentwise
gradients, Hessians, retractions and exponential maps [B23, Prop. 3.20, Ex. 3.67]. *Connected components:* a
connected component `C` of `M` is open, since `M` is locally connected, and as an open submanifold
with the restricted metric (`TauCeti.Manifold.instRiemannianBundleOpen`) it is a connected
Riemannian manifold, to which `TauCeti.MetricSpace.ofRiemannianMetric` applies. Prove that its
Riemannian distance is the restriction of `riemannianEDist` on `M`: a path in `M` starting in `C`
stays in `C`, and its length is the same read in `C` (`TauCeti.Manifold.pathELength_subtypeVal_comp`).
*Quotient metrics:* let `π : M̄ → M` be a surjective `Manifold.IsSubmersion` and `G` a Lie group
acting smoothly on `M̄` by isometries, preserving `π` and transitively on each fibre. Prove that there
is a unique Riemannian metric on `M` making `π` a Riemannian submersion in the sense of
RiemannianGeometry R1 §1.3, smooth because it is read through local smooth sections of `π`
[B23, Thm. 9.35]. The *horizontal lift* of `ξ ∈ T_{π x̄} M` at `x̄` is the unique horizontal `ξ̄` with
`dπ ξ̄ = ξ`, the inverse of `dπ` on R1 §1.3's horizontal space; define it here, with its linearity,
its smoothness along local sections and its equivariance `ξ̄_{g x̄} = dg(ξ̄_{x̄})`.

**Checks.**

- On `ℝ × ℝ` with the product metric, `f(x, y) = x²/2 + 2y²` has gradient `(1, 4)` at `(1, 1)`, the
  componentwise gradients.
- The power `M^0` is a point, not the empty manifold.
- On `ℝ ∖ {0}` the component `(0, ∞)` has distance `1` between `1` and `2`, the restriction of the
  extended distance on `ℝ ∖ {0}`, which is `∞` between `−1` and `1`.
- For `π(x, y) = x` on `ℝ²`, with `ℝ` acting by vertical translations, the horizontal vector
  `(3, 0)` has squared norm `9`, as does its image `3`, so the quotient metric is the Euclidean one.
- The oblique manifold `OB(n, m)` of O0.3 is identified with the `m`-th power of the unit sphere of
  `ℝⁿ` by a diffeomorphic isometry.

*Needs:* O0.1; Tau Ceti's product and open-subset metrics, `MetricSpace.ofRiemannianMetric` and
`pathELength_subtypeVal_comp`; Mathlib's `ModelWithCorners.pi`; RiemannianGeometry R1 §1.3.

### O0.3 The matrix manifolds

For each manifold: the carrier, its dimension, the tangent space as a subspace of the ambient space,
the orthogonal projection onto it, and the comparison with any structure already present on the same
set or built on it by another roadmap.

- **Sphere** `{x ∈ V : ‖x‖ = 1}`, the regular level of `h(x) = ‖x‖² − 1` [B23, §7.2, (7.8)–(7.12); AMS08, Ex. 3.6.1]. The
  identity is a diffeomorphism from it to Mathlib's stereographic structure (SmoothBundlesConnections
  B1.0 states this comparison for `‖·‖²`) and an isometry to Tau Ceti's round metric
  `TauCeti.sphereRoundMetric`. Tangent space `(ℝ ∙ x)ᗮ` (Tau Ceti's `sphereTangentEquiv`), projection
  `u ↦ u − ⟪x, u⟫x`.
- **Oblique** `OB(n, m)`, the `n × m` matrices with unit columns: dimension `m(n − 1)`; the projection
  removes from each column its component along the corresponding column of `X` [B23, §2.3 and §7.2].
- **Stiefel** `St(n, p) = {X : XᵀX = I_p}`, `p ≤ n`, the regular level of `h(X) = XᵀX − I_p ∈ Sym(p)`
  [B23, §7.3, (7.16), (7.17), (7.26); AMS08, §3.3.2, Ex. 3.6.2]: dimension `np − p(p+1)/2`, tangent space `{U : XᵀU + UᵀX = 0}`, projection
  `Z ↦ Z − X sym(XᵀZ)`. Sending `X` to its family of columns is a diffeomorphism onto Tau Ceti's
  manifold `TauCeti.stiefel (EuclideanSpace ℝ (Fin n)) p` of orthonormal `p`-frames, and an isometry
  for the metric that `TauCeti.stiefel` inherits from `PiLp 2 (fun _ : Fin p ↦ EuclideanSpace ℝ (Fin n))`,
  whose inner product is `Σ_j ⟪v_j, w_j⟫`; for `p = 2` it identifies `St(n, 2)` with
  the ordered orthonormal two-frames on which DGFloer Layer 1 item 7 states its homogeneous
  identifications. For `p = 1` the carrier equals the unit sphere of
  `EuclideanSpace ℝ (Fin n × Fin 1)` as a set (`XᵀX = I₁` iff `‖X‖ = 1`), and `Equiv.setCongr` of that
  equality is a diffeomorphism and an isometry between the two regular levels.
- **Orthogonal groups.** `O(n) = St(n, n)` and `SO(n)`, its clopen subset with `det = 1`
  [B23, §7.4, (7.30)–(7.38)]. `toMatrix` restricts to bijections from these onto
  `Matrix.orthogonalGroup (Fin n) ℝ` and `Matrix.specialOrthogonalGroup (Fin n) ℝ`, and the bijections
  are diffeomorphisms to the Lie-group structures of LieGroups Layer 2; the tangent space at `Q` is
  `Q · Skew(n)`.
- **Grassmann** `Gr(n, p)` is TopologicalKTheory T1.5's smooth graph-chart structure on Tau Ceti's
  `TauCeti.finiteGrassmannian ℝ p n`, of dimension `p(n − p)`; no second carrier is built. Prove that
  `π : St(n, p) → Gr(n, p)`, sending `X` to the span of its columns, is a smooth surjective submersion
  whose fibres are the orbits of the right action `X ↦ XQ` of `O(p)`, which acts by isometries, and
  give `Gr(n, p)` the quotient metric of O0.2 for `π` [B23, Thm. 9.35 and §9.16, (9.78)–(9.79); EAS98, §2.5]. The horizontal space at
  `X` is `{U : XᵀU = 0}`, with projection `Z ↦ (I − XXᵀ)Z`. Prove that `π X ↦ XXᵀ` is a smooth
  embedding onto the rank-`p` orthogonal projectors, and that the Riemannian distance between `π X`
  and `π Y` is `‖θ‖₂` for the principal angles `θ` between the two subspaces, whose cosines are the
  singular values of `XᵀY` [EAS98, §4.3, which states it without proof; its geodesics are Thm. 2.3], consuming PrincipalAngles.
- **Fixed rank** `ℝ_r^{m×n} = {X : rank X = r}`, `1 ≤ r ≤ min(m, n)` [B23, §7.5, (7.44), (7.47)–(7.48)]: locally
  defined by Schur complements (near `X` with an invertible `r × r` minor, after permuting rows and
  columns, `[A B; C D] ↦ D − CA⁻¹B`), of dimension `(m + n − r)r`, with tangent space at
  `X = UΣVᵀ`, for any `U ∈ St(m, r)`, `V ∈ St(n, r)` and invertible `Σ`,
  `{UMVᵀ + U_pVᵀ + UV_pᵀ : M ∈ ℝ^{r×r}, U_pᵀU = 0, V_pᵀV = 0}`. The set is not closed in
  `ℝ^{m×n}`, and no completeness statement is made for it.
- **Positive-definite matrices** `P(n)`: a type synonym of the open subset of `Sym(n)` where
  `toMatrix X` is `Matrix.PosDef`, of dimension `n(n+1)/2`, carrying Mathlib's open-subset charts,
  the affine-invariant metric `⟪U, W⟫_X = tr(X⁻¹UX⁻¹W)` (a smooth field of coercive bilinear forms)
  as its `RiemannianBundle` instance, and its Riemannian distance
  `TauCeti.MetricSpace.ofRiemannianMetric` as its `MetricSpace` instance. Being a synonym, it inherits
  neither the Frobenius metric of `Sym(n)` nor the flat metric of Tau Ceti's scoped open-subset
  instances. `toMatrix` restricts to a homeomorphism onto Tau Ceti's `TauCeti.PosDefMatrix n`. Prove
  that the congruences `X ↦ AXAᵀ` (`A` invertible) act transitively by isometries, hence completeness
  through `TauCeti.completeSpace_of_isPretransitive_isom`; that
  `exp_X(U) = X^{1/2} expm(X^{−1/2}UX^{−1/2}) X^{1/2}` is defined on all of `T_X P(n)`; that
  `d(X, Y) = ‖logm(X^{−1/2}YX^{−1/2})‖_F`; and that the geodesic midpoint is the matrix geometric mean
  `X # Y = X^{1/2}(X^{−1/2}YX^{−1/2})^{1/2}X^{1/2}`, in the functional calculus of the Spectral data
  convention [B23, §11.7, (11.35), (11.37)–(11.39); the midpoint is `exp_X(½ log_X Y)`]. Prove that `gO(n) ↦ ggᵀ` is a diffeomorphism from RealSemisimpleLieGroups
  §5.2's space `GL_n(ℝ)/O(n)` onto `P(n)`, equivariant for `g ↦ (X ↦ gXgᵀ)`, which pulls the
  affine-invariant metric back to `4` times the invariant metric of §5.3 with inner product
  `⟪Y, Z⟫ = tr(YZ)` on `𝔭 = Sym(n)`.
- **Open simplex** `Δ°(n) = {x ∈ EuclideanSpace ℝ (Fin n) : x_i > 0, Σ x_i = 1}`, `n ≥ 1`, a Fisher
  manifold: the regular level of `h(x) = Σ x_i − 1` on the positive orthant, of dimension `n − 1`,
  with tangent space `{ξ : Σ ξ_i = 0}` and `Π_x(z) = z − (Σ z_i) x` [B23, Ex. 3.26, Ex. 3.65]. Prove that `x ↦ √x` is a smooth
  embedding into the unit sphere of `EuclideanSpace ℝ (Fin n)`, onto its open subset of vectors with
  positive coordinates, that pulls the round metric back to a quarter of the Fisher metric; hence
  `d(x, y) = 2 arccos(Σ √(x_i y_i))`, since the minor great-circle arc between two vectors with
  positive coordinates has positive coordinates. The weights `i ↦ x_i` identify `Δ°(n)` with the
  elements of Mathlib's `Convexity.StdSimplex ℝ (Fin n)` whose weights are all positive.
- **Multinomial** `Mult(n, m)`, Manopt's manifold of `n × m` matrices with positive entries whose
  columns sum to `1`, `n ≥ 1`, a Fisher manifold: the regular level of `h(X) = Xᵀ𝟏 − 𝟏` on the
  positive orthant, of dimension `m(n − 1)`, with tangent space `{ξ : ξᵀ𝟏 = 0}` and
  `Π_X(Z) = Z − X diag(Zᵀ𝟏)`, the projection of `Δ°(n)` in each column [B23, Ex. 3.65, for the simplex]. Sending
  `X` to its family of columns is a diffeomorphism onto the `m`-th power of `Δ°(n)` (O0.2) and an
  isometry for the sum metric.
- **Doubly stochastic** `DS(n)`, the `n × n` matrices with positive entries whose rows and columns
  sum to `1`, `n ≥ 1`, a Fisher manifold: the regular level on the positive orthant of
  `h(X) = (Xᵀ𝟏 − 𝟏, r(X))`, with `r(X)` the first `n − 1` entries of `X𝟏 − 𝟏` (the last row sum is
  then forced, since the entries of `X` sum to `n`), of dimension `(n − 1)²` [DH19, Prop. 1], with tangent space
  `{ξ : ξ𝟏 = 0, ξᵀ𝟏 = 0}` and Fisher-normal space `{(α𝟏ᵀ + 𝟏βᵀ) ⊙ X : α, β ∈ ℝⁿ}`. Hence
  `Π_X(Z) = Z − (α𝟏ᵀ + 𝟏βᵀ) ⊙ X` for any `α, β` with `α + Xβ = Z𝟏` and `Xᵀα + β = Zᵀ𝟏`: such `α, β`
  exist, and the correction term does not depend on the choice [DH19, Thm. 1; its proof calls the
  pseudoinverse of `I − XXᵀ` a left inverse, which it is not, as `(I − XXᵀ)𝟏 = 0`; the compatible
  equations above avoid it]. `toMatrix` restricts to a bijection from `DS(n)` onto the elements of
  Mathlib's `doublyStochastic ℝ (Fin n)` with positive entries, and the inclusion of `DS(n)` into
  `Mult(n, n)` is a smooth embedding that pulls the Fisher metric of `Mult(n, n)` back to that of
  `DS(n)`, both being induced by `fisherEmbedding`; hence `d_Mult(X, Y) ≤ d_DS(X, Y)` on `DS(n)`.
- **Incompleteness.** For `n ≥ 2`, and `m ≥ 1` for `Mult(n, m)`, none of the three Fisher manifolds is
  complete: the segment from one of its points to a vertex of the simplex, to a matrix whose columns
  are such vertices, or to a permutation matrix, respectively, has finite Fisher length on `[0, 1)`
  and no limit in the manifold.

**Checks.**

- On `St(2, 2)` at `I`, the projection of `[[1, 2], [3, 4]]` is `[[0, −1/2], [1/2, 0]]`, which is
  skew; `St(2, 1)`, `St(2, 2)` and `St(2, 0)` have dimensions `1`, `1` and `0`.
- `O(1)` has two points and `SO(1)` one, both of dimension `0`: the connected-component convention
  is needed already there.
- On `Gr(2, 1)` the lines `ℝe₁` and `ℝe₂` have `XᵀY = 0`, principal angle `π/2` and distance `π/2`.
- On the rank-`1` matrices of size `2 × 2`, the tangent space at `diag(1, 0)` is
  `{[[a, b], [c, 0]]}`, of dimension `3 = (2 + 2 − 1)·1`, and `diag(1/k, 0)` tends to the rank-`0`
  matrix, outside the manifold.
- On `P(1)`, for `X = 4`, `Y = 9` and `U = 4`: `⟪U, U⟫_X = 1`, `exp_X(U) = 4e`,
  `d(X, Y) = log(9/4)` and the midpoint is `6`.
- On `Δ°(2)` at `x = (1/4, 3/4)`: `Π_x(e₁) = (3/4, −3/4)`; for `y = (3/4, 1/4)`,
  `Σ √(x_i y_i) = √3/2` and `d(x, y) = π/3`.
- On `DS(2)` at `X = J₂/2` (`J` the all-ones matrix), `Π_X(E₁₁) = [[1, −1], [−1, 1]]/4`; the choice
  `(α + c𝟏, β − c𝟏)` leaves the correction unchanged.
- *Non-example:* the inclusion `DS(n) → Mult(n, n)` preserves the metric tensor, not the Riemannian
  distance. Take `X = J/3` and the tangent vector `U = [[1, −1, 0], [−1, 1, 0], [0, 0, 0]]` of `DS(3)`.
  For small `t > 0` the minimizing `Mult(3, 3)`-geodesic from `X` to `X + tU` is unique (under `√`, a
  minor great-circle arc in each column), and its midpoint has third row sum
  `1/3 + 4/(3(1 + cos θ)) > 1`, with `θ > 0` the angle of its first column arc. So it leaves `DS(3)`,
  and `d_Mult(X, X + tU) < d_DS(X, X + tU)`.

*Needs:* O0.1, O0.2; Tau Ceti's `sphereRoundMetric`, `stiefel`, `PosDefMatrix`,
`completeSpace_of_isPretransitive_isom`; Mathlib's sphere, `Matrix.orthogonalGroup`,
`Matrix.PosDef`, `doublyStochastic`, `Convexity.StdSimplex`; LieGroups Layer 2; TopologicalKTheory
T1.5; PrincipalAngles; RealSemisimpleLieGroups §5.2–5.3.

### Examples

`St(n, 1)` is the unit sphere and `OB(n, m)` is a power of it; `O(2)` has the two components
`SO(2)` and `diag(1, −1)·SO(2)`; `Mult(n, m)` is the `m`-th power of `Δ°(n)`; and the first column
`X ↦ Xe₁` maps `DS(2)` onto `Δ°(2)`, pulling the Fisher metric back to half that of `DS(2)`.

### Dependencies

O0.1 needs Tau Ceti's regular levels and SmoothBundlesConnections B1.0; O0.2's quotient metrics
need RiemannianGeometry R1 §1.3. The items of O0.3 are independent of one another, except that
`Δ°(n)` uses the sphere, `Mult(n, m)` uses `Δ°(n)` and O0.2's powers, and `DS(n)` uses `Mult(n, n)`;
the orthogonal groups need LieGroups Layer 2, the Grassmannian needs TopologicalKTheory T1.5,
LieGroups Layer 2 and O0.2's quotient metrics, and the comparison for `P(n)` needs
RealSemisimpleLieGroups §5.2–5.3.

## Layer 1: Extrinsic calculus

### O1.1 Tangent spaces as subspaces

For an immersion `ι : M → V` with induced metric, `tangentSubspace I ι x` is the range of
`mvfderiv I ι x`, which is a linear isometry onto it. Write `Proj_x` for its `starProjection` and
`Proj_x^⊥` for that of its orthogonal complement. On a locally defined submanifold,
`Proj_y = 1 − Dh(y)*(Dh(y)Dh(y)*)⁻¹Dh(y)` near each point, so `x ↦ Proj_x` is smooth as a map into
`V →L[ℝ] V` [B23, Ex. 3.66].

**Checks.**

- For `Dh = [0, 2]` the formula gives `diag(1, 0)`, with denominator `4`; without surjectivity the
  inverse does not exist.
- For `ι(t) = (t, 0)` the tangent subspace is the horizontal axis; for a constant map it is `{0}`,
  which the immersion hypothesis excludes.

*Needs:* O0.1.

### O1.2 Gradients

For `f = f̄ ∘ ι` with `f̄` differentiable at `ι x`, `ι'(grad f(x)) = Proj_x(∇f̄(ι x))`
(`mvfderiv_mgradient_comp`) [B23, Prop. 3.61], from Tau Ceti's chain rule
`TauCeti.Manifold.mgradient_comp` and `TauCeti.Manifold.mgradient_eq_gradient`. On a quotient by a
Riemannian submersion `π : M̄ → M`, the horizontal lift of `grad f(π x̄)` is `grad (f ∘ π)(x̄)`
[B23, Prop. 9.39, (9.37)]. On each Fisher manifold, for `f = f̄ ∘ ι` with `ι` the inclusion,
`ι'(grad f(X)) = Π_X(X ⊙ ∇f̄(X))` [DH19, Lemma 1], from the identity for `fisherEmbedding ∘ ι`; on
`Δ°(n)` this is `x ⊙ (∇f̄(x) − ⟪x, ∇f̄(x)⟫𝟏)`.

**Checks.**

- On the unit circle at `e₁`, for `f̄(x, y) = 2x + 3y`, the gradient is `(0, 3)`, the projection of
  `(2, 3)`.
- For `π(x, y) = x` and `f = x²/2`, the lift of the base gradient `1` at `(1, 2)` is `(1, 0)`, the
  gradient of `f ∘ π`.
- *Non-example:* on a Fisher manifold the gradient is not the projected Euclidean gradient. On
  `Δ°(2)` at `x = (1/4, 3/4)` with `f̄(y) = y₁`, the Fisher gradient is `(3/16, −3/16)` and the
  projected Euclidean gradient `(1/2, −1/2)`: the formula applies to `fisherEmbedding ∘ ι`, not to
  `ι`.

*Needs:* O1.1; O0.2 for quotients; Tau Ceti's gradient chain rule.

### O1.3 Hessians

*Shape-operator form:* with `ν = Proj_x^⊥ ∇f̄(ι x)` and RiemannianGeometry R5a's shape operator, with
the signs of RiemannianGeometry's Conventions,
`ι'(Hess f(x)[u]) = Proj_x(∇²f̄(ι x)[ι'u]) + ι'(S_ν u)` [B23, Cor. 5.47, (5.41)–(5.42)]; Tau Ceti's Gauss
formula `CovariantDerivative.IsLeviCivitaConnection.inner_apply_eq_inner_mvfderiv` gives the
tangential part. *Lagrangian form* on a level set of `h` with surjective derivative
(`mvfderiv_hessianOp_comp`): if `λ : F →L[ℝ] ℝ` satisfies `∇(λ ∘ h)(ι x) = Proj_x^⊥ ∇f̄(ι x)` (it
exists and is unique), then `ι'(Hess f(x)[u]) = Proj_x(∇²f̄(ι x)[ι'u] − ∇²(λ ∘ h)(ι x)[ι'u])`
[B23, §7.7, (7.79)]. Prove the two forms agree. *Quotients:* the horizontal lift of
`Hess f(π x̄)[u]` is `Proj^H(Hess(f ∘ π)(x̄)[ū])`, and at a critical point of a quotient by a group
action the vertical space lies in the kernel of `Hess(f ∘ π)(x̄)` [B23, Prop. 9.45, (9.51), and Lemma 9.41].

**Checks.**

- On the sphere, `Hess f(x)[u] = Proj_x(∇²f̄(x)u) − ⟪x, ∇f̄(x)⟫u`; on the unit circle with
  `f̄ = x₁` at `e₁` and `u = e₂` this is `−u` (multiplier `λ = 1/2` for `h = ‖x‖² − 1`, Lagrangian
  Hessian `−I`).
- On the Stiefel manifold, `Hess f(X)[U] = Proj_X(∇²f̄(X)[U] − U sym(Xᵀ∇f̄(X)))`; for `p = 1` it is
  the sphere formula.
- On the Grassmannian, for `f̄` invariant under `X ↦ XQ`, the horizontal lift of `grad f` is
  `(I − XXᵀ)∇f̄(X)`.
- *Non-example:* the Riemannian Hessian of a restricted cost is not the projected Euclidean Hessian.
  For `f̄(y) = ⟪a, y⟫` on the sphere the Euclidean Hessian is zero while `Hess f(x) = −⟪a, x⟫ id`: the
  Weingarten term is load-bearing.
- For the lift of `x²/2` from `ℝ` to `ℝ²` through `(x, y) ↦ x`, the Hessian is `diag(1, 0)` and the
  vertical vector `e₂` lies in its kernel.

*Needs:* O1.1, O1.2; RiemannianGeometry R5a and Conventions; O0.2 for quotients.

### O1.4 Curves

For a `C²` cost and a `C²` curve,
`(f ∘ γ)'' = Hess f(γ)[γ', γ'] + ⟪grad f(γ), D_t γ'⟫` (`deriv_deriv_comp_eq`)
[B23, (5.25)], with `D_t γ'` Tau Ceti's `CovariantDerivative.acceleration` for the Levi-Civita
connection. For embedded `M`, `ι'(D_t γ') = Proj(d²(ι ∘ γ)/dt²)`.

**Checks.**

- On `ℝ`, for `f(x) = x²/2` and `γ(t) = t²` at `t = 1`: `(t⁴/2)'' = 6`, the Hessian term `4` plus the
  gradient–acceleration term `2`; neither term can be dropped.
- On the unit circle, `γ(t) = (cos t, sin t)` has ambient acceleration `−e₁` at `0`, whose tangential
  projection, the covariant acceleration, is `0`.

*Needs:* Tau Ceti's `CovariantDerivative.acceleration` and Levi-Civita connection.

### Examples

The sphere, Stiefel and Grassmann formulas of O1.3's Checks; on `Δ°(n)` the gradient
`x ⊙ (∇f̄(x) − ⟪x, ∇f̄(x)⟫𝟏)`; and the entropic cost of the worked examples on `DS(n)`.

### Dependencies

O1.1–O1.2 need O0.1 and Tau Ceti's gradient; O1.3 needs RiemannianGeometry R5a and Tau Ceti's Gauss
formula; the quotient statements need O0.2; O1.4 needs only Tau Ceti.

## Layer 2: Retractions and vector transports

### O2.1 Retractions

A retraction (`Retraction`) is a map `toFun : TangentBundle I M → M` with an open `domain`
containing the zero section, `C^∞` on `domain`, with `R_x(0) = x` and `d/dt R_x(t v)|_{t=0} = v`
[B23, Def. 3.47]. `Retraction.retr R x v` is `R_x(v)`; `IsGlobal` means `domain = univ`. Each `R_x`
is a local diffeomorphism at `0` (`isLocalDiffeomorphAt_retr_zero`, from Tau Ceti's manifold inverse
function theorem `TauCeti.isLocalDiffeomorphAt_of_mfderiv_eq`), with a local inverse retraction
`R_x⁻¹` near `x` carrying its domain and smooth jointly in `(x, y)` near the diagonal
[B23, Cor. 4.17].

**Checks.**

- On `ℝ`, `R_x(v) = x + 2v` satisfies `R_x(0) = x` but has initial velocity `2v`, so it is not a
  retraction.
- `R_x(v) = x + v + v²` is a retraction with derivative `1` at `0`, a local diffeomorphism there,
  although `v = 0` and `v = −1` give the same point.
- *Non-example:* a retraction is not defined on the whole tangent bundle in general. On the
  hyperbola `{(a, b) : ab = 1}`, take `x = (2, 1/2)` and `v = (−10/3, 5/6)`, tangent since
  `⟪v, (1/2, 2)⟫ = 0`. Then `x + v = (−4/3, 4/3)` lies on the line `b = −a`, which the isometry
  `(a, b) ↦ (−b, −a)` fixes while exchanging the two branches, so `x + v` has no unique nearest point
  and the metric-projection retraction of O2.2 is undefined there.

*Needs:* Tau Ceti's `curveVelocity` and manifold inverse function theorem.

### O2.2 Order and the standard retractions

`IsSecondOrder`: every curve `t ↦ R_x(t v)` has zero covariant acceleration at `t = 0`
[B23, Def. 5.42]. For embedded `M`, `R` is second order iff the ambient acceleration
`d²/dt² ι(R_x(t v))|_{t=0}` lies in `Proj_x^⊥ V` for every `v` [B23, (5.23); AM12, (4), Prop. 3]. The exponential map is a retraction
(`expRetraction`, built from Tau Ceti's exponential-map API) and is second order
(`expRetraction_isSecondOrder`) [B23, Prop. 10.18].

*Metric projection.* For a locally defined submanifold `S ⊆ V`, let `𝒰 ⊆ V` be the union of the open
sets on which every point has a unique nearest point in `S` and the nearest-point map `P_S` is smooth.
Prove that `𝒰` contains `S`: near `x ∈ S`, the Euclidean normal exponential `(p, v) ↦ p + v` of Tau
Ceti's normal bundle (`TauCeti.SmoothEmbedding.normalExp`, with Tau Ceti's Euclidean normal tube
`TauCeti.normalTube`) is a local diffeomorphism onto a neighbourhood of `x` in `V`, and its inverse
followed by the first projection is `P_S` there [AM12, Lemma 4]. For a closed embedded `S` (the
sphere, `St(n, p)`, `O(n)`) this is RiemannianGeometry R6's nearest-point retraction of a closed-image
Euclidean embedding; the local statement is needed for the fixed-rank manifold, which is not closed.
The metric-projection retraction `R_x(v) = P_S(x + v)` is defined on the open set where
`x + v ∈ 𝒰`, is smooth there, and is second order [AM12, Prop. 5; B23, Prop. 5.55]. Required
instances, those justified by a nearest-point property being identified with the metric projection
on their domains:

- sphere: `(x + v)/‖x + v‖`, global and second order, since every `y ≠ 0` has the unique nearest point
  `y/‖y‖`;
- Stiefel, polar: `(X + U)(I + UᵀU)^{−1/2}` [B23, (7.24)], global and second order. Prove here that
  the polar factor `Z(ZᵀZ)^{−1/2}` of a matrix `Z` of full column rank (PolarDecomposition) is its
  unique nearest point in `St(n, p)`: `‖Z − X‖² = ‖Z‖² + p − 2 tr(XᵀZ)`, and for a thin singular value
  decomposition `Z = UΣVᵀ`, `tr(XᵀZ) ≤ Σ σ_i(Z)`, with equality exactly at `X = UVᵀ` when
  `σ_{p−1}(Z) > 0` ([AM12, Prop. 7] is the local statement);
- Stiefel, Q-factor: `qf(X + U)` [AMS08, Ex. 4.1.3, (4.7)–(4.8); B23, (7.22) and p. 162 of the author PDF], global and first order, and second order exactly
  when `p ≤ 1`, where it is the sphere retraction, or `n = p = 2`, where it is the polar retraction
  (Examples);
- Grassmann: `(π X, ξ) ↦ π(qf(X + ξ̄))`, with `ξ̄` the horizontal lift of `ξ` at `X`, well defined
  because a retraction `R̄` on the total space with `π(R̄_{XQ}(ξ̄Q)) = π(R̄_X(ξ̄))` for `Q ∈ O(p)`
  descends; state and prove that descent lemma in general [B23, Ex. 9.34, (9.29)–(9.30), and (9.88)];
- fixed rank: `Z ↦ ΠZ` for `Z = X + U`, with `Π` the orthogonal projection onto the sum of the
  eigenspaces of `ZZᵀ` for its `r` largest eigenvalues (the rank-`r` truncation of the SVD of `Z`),
  defined where `σ_{r−1}(Z) > σ_r(Z)` and second order, since there `ΠZ` is the unique nearest rank-`r`
  matrix in the Frobenius norm (the Eckart–Young theorem with its uniqueness case)
  [B23, §7.5, (7.49)–(7.50); AM12, Prop. 6; EY36];
- positive-definite matrices: the exponential map, global;
- open simplex: `R_x(ξ) = (x ⊙ exp(ξ ⊘ x))/⟪x, exp(ξ ⊘ x)⟫`, and on `Mult(n, m)` the same map in each
  column (the one-column form of the construction of [DH19, Lemma 2], with normalization in place of the Sinkhorn scaling), global and first order, and not second order on `Δ°(2)`
  (Examples);
- doubly stochastic: `R_X(ξ) = SK(X ⊙ exp(ξ ⊘ X))` [DH19, Lemma 2], global and first order, and not
  second order on `DS(2)`, where `SK = sinkhornScaling` sends a matrix with positive entries to its
  doubly stochastic scaling. `SK` is the limit of Tau Ceti's Sinkhorn iteration
  (`Matrix.sinkhornPlan`, `Matrix.sinkhornStep`), which `Matrix.tendsto_sinkhornPlan_iterate`
  identifies with the scaling of Tau Ceti's Sinkhorn–Knopp theorem `Matrix.exists_sinkhorn_scaling`,
  unique by `Matrix.IsDiagonalScaling.eq_of_hasMarginals`. Prove that `SK` is smooth on the matrices
  with positive entries (`contDiffOn_sinkhornScaling`), by the implicit function theorem for the
  scaling equations in logarithmic coordinates modulo their common scalar: at a solution `P` the
  linearization `(a, b) ↦ (a + Pb, Pᵀa + b)` has kernel spanned by `(𝟏, −𝟏)`, because `1` is a simple
  eigenvalue of the positive stochastic matrix `PᵀP`, and its image is the set of pairs with equal
  sums, where the equations take their values. Prove that the derivative of `SK` at `X ∈ DS(n)` is
  `Π_X` (`fderiv_sinkhornScaling`), which gives the velocity condition.

**Checks.**

- On the unit circle, the projection curve `(1, t)/√(1 + t²)` from `e₁` along `e₂` has velocity `e₂`
  and ambient acceleration `−e₁`, which is normal.
- On `ℝ`, `R_x(v) = x + v + v²` has covariant acceleration `2v²` at `0`, so it is first but not
  second order.
- *Non-example:* a second-order retraction does not move along geodesics. Only the acceleration at
  `t = 0` vanishes: the sphere's `t ↦ (x + t v)/‖x + t v‖` runs along a great circle at angular speed
  `‖v‖/(1 + t²‖v‖²)`.
- *Non-example:* the Q-factor retraction on the Stiefel manifold is not second order when `p ≥ 2`
  and `n ≥ 3` (Examples), while on `O(2)` it is the polar retraction.
- `SK([2]) = [1]` and `SK(J₂/2) = J₂/2`, so `SK` is neither the identity nor a constant map; scaling a
  matrix with positive entries by a positive scalar does not change its image; and the zero `2 × 2`
  matrix, outside the domain of the smoothness statement, is sent to itself (every iterate is `0`).

*Needs:* O2.1; O0.1, O1.1 and Tau Ceti's normal tube and RiemannianGeometry R6 for the metric
projection; PolarDecomposition; O0.3 for the matrix manifolds; Tau Ceti's Sinkhorn iteration and
scaling theorems for `SK`.

### O2.3 Taylor expansions

For a retraction `R`, the covariant acceleration `a_x(v)` of `t ↦ R_x(t v)` at `0` is a quadratic
map of `v`. For a `C²` cost,
`f(R_x(v)) = f(x) + ⟪grad f(x), v⟫ + ½(Hess f(x)[v, v] + ⟪grad f(x), a_x(v)⟫) + o(‖v‖²)`,
uniformly for `x` in compact sets [B23, eqs. (5.25), (5.28)]. The acceleration term vanishes for
second-order retractions and, for every retraction, at critical points.

**Checks.**

- On `ℝ`, for `R_x(v) = x + v + v²` and `f(x) = x` at `0`: `a_0(v) = 2v²`, the Hessian is `0`, and the
  expansion `v + v² = v + ½·2v²` is exact; away from a critical point the acceleration term cannot be
  dropped.

*Needs:* O1.4, O2.1.

### O2.4 Pullback regularity

The one-sided bound `SatisfiesPullbackBound R f L`:
`f(R_x(v)) ≤ f(x) + ⟪grad f(x), v⟫ + (L/2)‖v‖²` on `domain`; and the two-sided bound at a single
step, `PullbackBoundAt R f L x s`. On a compact manifold, a global retraction and a `C²` cost satisfy
the one-sided bound for some `L > 0` (`exists_satisfiesPullbackBound`): for steps of norm at most
some `r > 0` this is [B23, Lemma 10.57], and for longer steps
`f(R_x(s)) − f(x) − ⟪grad f(x), s⟫ ≤ 2 max |f| + (max ‖grad f‖)‖s‖ ≤ (L/2)‖s‖²` once `L` is large
enough (compare [BAC19, Lemma 4], for compact submanifolds and costs with Lipschitz gradient). For
`M = V` and `R_x(v) = x + v` the bound follows from `L`-Lipschitz continuity of `∇f`.

**Checks.**

- On `ℝ` with `R_x(v) = x + v`, `f(x) = a x²/2` (`a > 0`) satisfies the bound with `L = a` and
  equality.
- *Non-example:* the pullback bound does not hold for every smooth cost. `x⁴` on `ℝ` with
  `R_x(v) = x + v` would need `v⁴ ≤ Lv²/2` at `x = 0` for all `v`, which fails for every `L`.

*Needs:* O2.1, O2.3.

### O2.5 Vector transports

A vector transport associated with `R` sends `(x, v, u)`, with `(x, v) ∈ domain` and `u ∈ T_xM`, to
`T_v u ∈ T_{R_x(v)}M`, linearly in `u`, smoothly in the tangent-bundle trivializations, with
`T_{0_x} = id` [AMS08, Def. 8.1.1, (8.6), (8.10), Prop. 8.1.2; B23, Def. 10.68, Props. 10.64, 10.66]. Constructions: the differentiated
retraction `T_v u = d/dt R_x(v + t u)|_{t=0}`; on embedded `M` the projection transport
`ι'(T_v u) = Proj_{R_x(v)}(ι'u)`; and parallel transport along `t ↦ exp_x(t v)`, which is isometric:
SmoothBundlesConnections B5.0's transport for the Levi-Civita connection, through B3.3's
frame-bundle description. Prove that the projection transport of the sphere retraction
`(x + v)/‖x + v‖` of O2.2 is not isometric for `v ≠ 0`.

**Checks.**

- For `R_x(v) = x + v + v²` on `ℝ`, the differentiated retraction is `T_v u = (1 + 2v)u`, the identity
  at `v = 0` and not isometric elsewhere.
- On the unit sphere, for `x = e₁`, `v = e₂` and `u = e₂`, the projection transport for the
  normalized-addition retraction has norm `1/√2`. For the exponential retraction and `‖v‖ = π`, the
  endpoint is `−x`, whose tangent space is that of `x`, and the projection transport is the identity:
  the non-isometry statement depends on the retraction.

*Needs:* O2.1, O2.2, O1.1; SmoothBundlesConnections B5.0 and B3.3.

### Examples

- For `X = [e₁ e₂] ∈ St(3, 2)` and `U = [e₃ e₃]` (tangent, since `XᵀU = 0`), the Q-factor curve has
  ambient acceleration `−2X [[1/2, 1], [0, 1/2]]` at `0`, which is not of the form `XΣ` with `Σ`
  symmetric, so the Q-factor retraction is not second order; the polar curve has acceleration
  `−X UᵀU`, which is normal. On `St(n, p)` with `2 ≤ p < n`, `X = [e₁ ⋯ e_p]` and
  `U = [e_{p+1} e_{p+1} 0 ⋯ 0]` give the same acceleration padded with zero columns.
- On `O(n)` with `n ≥ 3`, at `I` with `U = e₂e₁ᵀ − e₁e₂ᵀ + e₃e₁ᵀ − e₁e₃ᵀ`, the Q-factor curve has
  acceleration `−2e₁e₁ᵀ − e₂e₂ᵀ − e₃e₃ᵀ − 2e₂e₃ᵀ`, which is not symmetric and so not normal.
- On `O(2)` every tangent vector at `X` is `U = XΩ` with `Ω = [[0, −a], [a, 0]]`, so
  `(X + tU)ᵀ(X + tU) = (1 + a²t²)I` and `qf(X + tU) = (X + tU)/√(1 + a²t²)`, the polar curve.
- On `Δ°(2)` at `x = (p, 1 − p)` with `ξ = (1, −1)`, the curve of the open-simplex retraction has
  covariant acceleration of length `|1 − 2p|/(2(p(1 − p))^{3/2})` at `0`, nonzero for `p ≠ 1/2`. The
  first column `X ↦ Xe₁` maps `DS(2)` onto `Δ°(2)`, pulling the Fisher metric back to half that of
  `DS(2)`, and carries the Sinkhorn curve at `X` with `ξ = [[1, −1], [−1, 1]]` to the simplex curve at
  `Xe₁`, so neither retraction is second order.
- On `Gr(2, 1)`, `X = e₁` and `−X` with horizontal `U` and `−U` give the same point
  `span(qf(X + U)) = span(qf(−X − U))`, as the descent lemma requires.
- For `Z = diag(2, 1)` and `r = 1` the gap `2 > 1` gives the unique nearest rank-one matrix
  `diag(2, 0)`; for `Z = I₂` there is no gap and both diagonal rank-one projectors are nearest.

### Dependencies

O2.1 and the exponential part of O2.2 depend only on Tau Ceti and proceed alongside Layers 0 and 1.
The metric-projection retractions need O0.1, O1.1, Tau Ceti's normal tube and RiemannianGeometry R6;
the matrix instances need O0.3 and PolarDecomposition; the Sinkhorn retraction needs Tau Ceti's
Sinkhorn iteration and scaling theorems. O2.3 needs O1.4; O2.4 needs O2.3; O2.5's parallel transport
needs SmoothBundlesConnections B5.0 and B3.3.

## Layer 3: Optimality conditions

### O3.1 First order

A local minimizer has zero gradient. This is Tau Ceti's boundaryless Fermat theorem
`IsLocalExtr.mem_criticalPoints` with `TauCeti.Manifold.mgradient_eq_zero_iff`, consumed as it stands
[B23, Prop. 4.5].

*Needs:* Tau Ceti.

### O3.2 Second-order necessary

A local minimizer of a `C²` cost has `Hess f(x) ⪰ 0` (`hessian_nonneg_of_isLocalMin`)
[B23, Prop. 6.2], from O1.4 along any second-order retraction curve.

**Checks.**

- `x²` and `x⁴` at `0` have Hessians `2` and `0`, both nonnegative: degenerate minima are included.

*Needs:* O1.4, O2.2.

### O3.3 Second-order sufficient

`grad f(x) = 0` and `Hess f(x) ≻ 0` give a strict local minimizer (`eventually_lt_of_hessian_pos`)
with quadratic growth `f(y) − f(x) ≥ c d(x, y)²` near `x` [B23, Prop. 6.5], consuming
MorseTheory M1 §1.3's strict minimality of nondegenerate minima.

**Checks.**

- `x²` at `0` has growth `f(y) − f(0) = dist(y, 0)²`.
- *Non-example:* a strict local minimizer need not be nondegenerate: `x⁴` at `0`.

*Needs:* O3.2; MorseTheory M1 §1.3.

### O3.4 KKT reconciliation

On a level set of `h` with surjective derivative, `grad f(x) = 0` iff there is a (unique) `λ` with
`∇f̄(ι x) = ∇(λ ∘ h)(ι x)`, and then `Hess f(x)[u, u] = ∇²(f̄ − λ ∘ h)(ι x)[ι'u, ι'u]`, the Hessian of
the Lagrangian on the tangent space [B23, §7.7, (7.77)–(7.81), Ex. 7.10]. Compare the first statement with Mathlib's
`IsLocalExtrOn.exists_multipliers_of_hasStrictFDerivAt`.

**Checks.**

- On the unit circle at `e₁` with `f̄ = x₁` and `h = ‖x‖² − 1`: `∇f̄ = e₁ = λ·2e₁` for the unique
  `λ = 1/2`, and the tangent Hessian of the Lagrangian is `−1`; the critical point `e₁` is a maximizer.

*Needs:* O1.3.

### O3.5 Second-order critical points and quotients

Define second-order critical points (`grad f(x) = 0`, `Hess f(x) ⪰ 0`) [B23, Def. 6.1, Prop. 6.3].
On a quotient, `f` is critical (second-order critical) at `π x̄` iff `f ∘ π` is at `x̄`.

**Checks.**

- *Non-example:* a second-order critical point need not be a local minimizer: `x³` at `0`.
- *Non-example:* the lifted cost on a quotient's total space is not Morse. At a critical point the
  vertical space lies in the kernel of `Hess(f ∘ π)` (for the lift of `x²/2` through `(x, y) ↦ x` the
  Hessian is `diag(1, 0)`); Newton's local theory is applied on the quotient.

*Needs:* O3.2; O0.2, O1.2, O1.3 for quotients.

### O3.6 Nondegeneracy

For a smooth cost, `TauCeti.IsManifoldNondegenerateCriticalPoint I f x` holds iff `grad f(x) = 0`
and `hessianOp I f x` is invertible
(`isManifoldNondegenerateCriticalPoint_iff_isUnit_hessianOp`). Tau Ceti has the chart form
`TauCeti.isManifoldNondegenerateCriticalPoint_iff_criticalHessian` and the identification
`TauCeti.Manifold.hessian_eq_criticalHessian`; what is proved here is the Riesz correspondence
between invertibility of the bilinear form `hessian I f x` and invertibility of the operator
`hessianOp I f x`. Layer 5 uses this form.

**Checks.**

- `f = −x²` at `0` has Hessian `−2`, a unit, so a nondegenerate maximizer qualifies; `x⁴` at `0` has
  Hessian `0`, not a unit. On a zero-dimensional manifold `hessianOp` is invertible.

*Needs:* Tau Ceti's critical Hessian (MorseTheory M1 §1.2).

### Examples

`x²`, `x³`, `x⁴` and `−x²` on `ℝ` at `0` separate the conditions of this layer: a nondegenerate
minimizer, a degenerate second-order critical point that is not a minimizer, a degenerate strict
minimizer, and a nondegenerate maximizer.

### Dependencies

O3.1 is Tau Ceti's; O3.2 needs O1.4 and O2.2; O3.3 needs MorseTheory M1 §1.3; O3.4 needs O1.3; O3.5
needs O0.2 and Layer 1; O3.6 needs Tau Ceti's critical Hessian.

## Layer 4: Global convergence and complexity

### O4.1 Fixed step

`rgdStep`, `rgdSeq`. For a global retraction satisfying `SatisfiesPullbackBound R f L` with `L > 0`
and step `1/L`: `f(x_{k+1}) ≤ f(x_k) − ‖grad f(x_k)‖²/(2L)` [B23, Prop. 4.8]; for `f ≥ f_low`,
`Σ_{k<K} ‖grad f(x_k)‖² ≤ 2L(f(x₀) − f_low)` (`rgd_sum_sq_norm_mgradient_le`), hence, for `K > 0`,
`min_{k<K} ‖grad f(x_k)‖ ≤ √(2L(f(x₀) − f_low)/K)` (`rgd_exists_norm_mgradient_le`)
[BAC19, Thm. 5, Cor. 6] and `‖grad f(x_k)‖ → 0` (`tendsto_norm_mgradient_rgdSeq`). For a `C¹` cost
every cluster point of the sequence is critical.

**Checks.**

- On `ℝ` with `R_x(v) = x + v`, `f(x) = x²/2`, `L = 1` and `x₀ = 2`: the sequence is `2, 0, 0, …` and
  the sums of squared gradients for `K = 0, 1, 2` are `0, 4, 4 ≤ 4`.
- *Non-example:* the retraction must be global. With `R_x(v) = x + v` for `|v| < 1` and `100`
  otherwise, the pullback bound holds on the domain with `L = 1`, yet from `x₀ = 2` the step
  `v = −2` leaves the domain and `x₁ = 100`, so `f(x₁) = 5000 > f(x₀)`.

*Needs:* O2.1, O2.4.

### O4.2 Armijo backtracking

`armijoExponent`, `armijoStepSize`, `armijoStep`, `armijoSeq`. For a global retraction satisfying
the pullback bound, every exponent `i` with `ᾱτ^i ≤ 2(1 − r)/L` qualifies, so the step size is at
least `min(ᾱ, 2τ(1 − r)/L)` and `f(x) − f(x⁺) ≥ r min(ᾱ, 2τ(1 − r)/L) ‖grad f(x)‖²`
(`armijo_decrease`) [B23, Lemma 4.12]. The consequences of O4.1 follow with this constant
(`tendsto_norm_mgradient_armijoSeq`, `mgradient_eq_zero_of_mapClusterPt_armijoSeq`)
[B23, Prop. 4.7, Cor. 4.13; AMS08, Thm. 4.3.1]. On a compact manifold with a global retraction and a `C²` cost, O2.4
supplies the bound.

**Checks.**

- On `ℝ`, for `f(x) = x²/2`, `ᾱ = 4`, `τ = r = 1/2` and `x = 1`: the steps `4` and `2` fail, `1`
  passes, the exponent is `2`, `x⁺ = 0`, and the decrease `1/2` exceeds the bound
  `r min(4, 1/2)·1 = 1/4`. At `x = 0` the exponent is `0` and the step does not move.

*Needs:* O2.1, O2.4.

### O4.3 The trust-region iteration and the Cauchy point

`trModel`, `trRatio`, `trUpdate`, `trSeq`. The model is
`m_x(s) = f(x) + ⟪grad f(x), s⟫ + ½⟪H_x s, s⟫` with self-adjoint `H_x`; the ratio is
`ρ = (f(x) − f(R_x(s)))/(m_x(0) − m_x(s))`, and the update follows the Algorithm constants
convention. The *Cauchy point* is the minimizer of `m_x` along `−grad f(x)` within radius `Δ`, and
`m_x(0) − m_x(s^C) ≥ ½‖g‖ min(Δ, ‖g‖/β)` for every `β > 0` with `‖H_x‖ ≤ β` [B23, Lemma 6.15; AMS08, §7.4.1, (7.14)].

**Checks.**

- For `f(x) = x²/2` at `x = 1` with `H = 1`: `m(s) = 1/2 + s + s²/2`, so `m(0) = 1/2` and
  `m(−1) = 0`; with `Δ = 1` the Cauchy decrease `1/2` equals the bound.
- From `(x₀, Δ₀) = (1, 1)` with cap `2` and exact steps, the states are `(1, 1)`, `(0, 2)`, `(0, 1/2)`:
  at the minimizer the zero step is rejected and the radius shrinks.
- *Non-example:* `β` must be positive. For `f(x) = x²/2`, `H = 0`, every trial step `0`, `β = 0`,
  `L = 1`, `c₁ = 1/2`, `ρ' = 1/8` and `Δ₀ = 1`, the Cauchy inequality reads `0 ≤ 0`, yet from `x₀ = 1`
  every gradient norm stays `1`; with `β = 1` the zero step fails Cauchy decrease (`1/2 ≤ 0` is
  false).

*Needs:* O2.1.

### O4.4 Truncated conjugate gradients

`TCGState`, `boundaryStep`, `tcgStep`, `tcg`. Truncated conjugate gradients (Steihaug–Toint)
[AMS08, Alg. 11 with the stopping rule (7.10); B23, Alg. 6.4; Ste83] is the total function `tcg H g Δ θ κ`, for self-adjoint `H` and the
model `⟪g, s⟫ + ½⟪Hs, s⟫` in the ball of radius `Δ`. If `g = 0` it returns `0`. Otherwise it sets
`η₀ = 0`, `r₀ = g`, `δ₀ = −r₀`, and for `j ≥ 0`: if `⟪δ_j, H δ_j⟫ ≤ 0`, it returns `η_j + τ δ_j`
with `τ ≥ 0` and `‖η_j + τ δ_j‖ = Δ` (`boundaryStep`); it sets `α_j = ‖r_j‖²/⟪δ_j, H δ_j⟫`; if
`‖η_j + α_j δ_j‖ ≥ Δ`, it returns the boundary point `η_j + τ δ_j` with `τ ≥ 0`; it sets
`η_{j+1} = η_j + α_j δ_j` and `r_{j+1} = r_j + α_j H δ_j`; if
`‖r_{j+1}‖ ≤ ‖r₀‖ min(‖r₀‖^θ, κ)`, it returns `η_{j+1}`; and it sets
`δ_{j+1} = −r_{j+1} + (‖r_{j+1}‖²/‖r_j‖²) δ_j`. As a total function it runs `dim V` steps of this
recursion and returns the output, or the last iterate if there is none. Prove: for `κ > 0` it
returns within `dim V` steps (`exists_iterate_tcgStep_out_eq_some`), since the residuals are mutually
orthogonal while it runs (for plain conjugate gradients, [B23, §6.3]); the output lies in the ball (`norm_tcg_le`); `‖η_j‖` increases strictly
and the model decreases strictly along the iterates [AMS08, Prop. 7.3.2; Ste83, Thm. 2.1]; the
first iterate is the Cauchy point [B23, Ex. 6.26]; hence Cauchy decrease with constant `½` for every `β > 0` with
`‖H‖ ≤ β` (`tcg_cauchy_decrease`).

**Checks.**

- For `g = H = Δ = 1` (the model `s + s²/2`): `α₀ = 1`, the step `−1` reaches the boundary, the
  output is `−1` and the decrease `1/2` equals the Cauchy bound.
- For `H = −1` and `g = 1` the curvature `⟪δ₀, Hδ₀⟫ = −1` is negative and the output is the boundary
  point `−Δ` along `−g`.
- For `g = 0` the output is `0`; for `H = I` and `Δ` larger than `‖g‖` the output is the Newton step
  `−g` after one step, with residual `0`.

*Needs:* O4.3.

### O4.5 Trust-region complexity

`trSeq_exists_norm_mgradient_le`, `trComplexityConst`. With a global retraction, `f ≥ f_low`,
self-adjoint `H_x` with `‖H_x‖ ≤ β` for a constant `β > 0`, steps inside the radius, Cauchy decrease
`m_x(0) − m_x(s) ≥ c₁‖g‖ min(Δ, ‖g‖/β)` with `c₁ ∈ (0, 1]`, and the two-sided pullback bound with
constant `L ≥ 0` at each iterate's trial step, for every `ε ∈ (0, 1]` some `k ≤ ⌈C/ε²⌉` has
`‖grad f(x_k)‖ ≤ ε`, with the explicit constant
`C = 3(f(x₀) − f_low)/(2ρ'c₁ min(Δ₀, c₁/(4(L + β)))) + max(1, 4(L + β)Δ₀/c₁)/2`
[BAC19, Thm. 12]. The proof runs through the radius lemma [BAC19, Lemmas 14, 16]: if
`‖grad f(x_j)‖ > ε` for all `j < k`, then `Δ_k ≥ Δ_ε = min(Δ₀, c₁ε/(4(L + β)))`, because a radius at
most `c₁ε/(L + β)` gives `ρ ≥ 1/2`. Each successful step before `k` then decreases `f` by at least
`ρ'c₁εΔ_ε`, each unsuccessful one divides the radius by `4`, and no step more than doubles it;
counting both kinds gives the bound. The constant is looser than the source's, and the bound concerns
the index of the first `ε`-critical iterate; it gives no count of the iterations with large gradient
after that index. Corollary: `liminf ‖grad f(x_k)‖ = 0`.

**Checks.**

- For gap `1/2`, `L = β = 1`, `c₁ = 1/2`, `ρ' = 1/8` and `Δ₀ = 1`, the constant is `192 + 8 = 200`;
  for `f = x²/2` from `x₀ = 1` and `ε = 1/2` the first qualifying index is `1 ≤ 800`.

*Needs:* O4.3; O4.4 supplies the hypotheses on the steps for `tcg`.

### Examples

- On `ℝ` with `R_x(v) = x + v`: `f(x) = a x²/2` (`a > 0`) satisfies the pullback bound with `L = a`
  and equality, and gradient descent with step `1/a` and Newton's method both reach `0` in one step.
- *Exponentiated gradient on the simplex.* On `Δ°(n)`, `x` is critical iff `∇f̄(x) ∈ ℝ𝟏`, and a
  gradient step with step size `t` and the open-simplex retraction is the multiplicative-weights
  update `x⁺ = (x ⊙ exp(−t∇f̄(x)))/⟪x, exp(−t∇f̄(x))⟫`. For `x = (1/4, 3/4)`, `∇f̄ = (1, 0)` and
  `t = log 3` the first coordinate becomes `1/10`.

### Dependencies

O4.1–O4.2 need O2.1 and O2.4; O4.3 needs O2.1; O4.4 is linear algebra on one tangent space and needs
only O4.3's model; O4.5 needs O4.3, with O4.4 as the inner solver.

## Layer 5: Local convergence

### O5.1 Gradient descent near a nondegenerate local minimizer

For a smooth cost, a smooth retraction and Armijo constants, there are a neighbourhood `U` of `x*`
and a linear rate such that every Armijo sequence from `U` converges to `x*` (`armijo_local_linear`).
[AMS08, Thm. 4.5.6] gives the linear rate of the function values for an Armijo sequence assumed to
converge to `x*`; here convergence is part of the conclusion. The proof: near `x*` the gradient is
small, so every tested step `ᾱτ^i grad f(x)` lies in the domain (no global retraction is needed) and
moves `x` by at most `Cᾱ‖grad f(x)‖`; accepted steps decrease `f`, so iterates that start in a small
sublevel neighbourhood of `x*` (O3.3's strict minimality) stay in it; Tau Ceti's local estimate
`λ|f − f(x*)| ≤ ‖grad f‖²` near a nondegenerate critical point
(`TauCeti.IsManifoldNondegenerateCriticalPoint.exists_mul_abs_sub_le_norm_mgradient_sq`, MorseTheory
M6 §6.1) and O4.2's decrease give a linear rate for `f(x_k) − f(x*)`; and O3.3's quadratic growth
with `f(y) − f(x*) ≤ C d(y, x*)²` near `x*` turns it into the distance rate.

**Checks.**

- On `ℝ`, for `f(x) = x²/2` and `ᾱ = 1/2`, `τ = r = 1/2`, the step `1/2` is always accepted and
  `x_k = 2^{−k}x₀`: `C = 1`, `q = 1/2`.

*Needs:* O3.3, O4.2; Tau Ceti's local gradient estimate.

### O5.2 Newton's method

`newtonStep`, `newtonSeq`, `newton_local_quadratic`. Near any nondegenerate critical point, of any
index, and for any retraction, the Newton sequence converges quadratically
[AMS08, Thm. 6.3.2; B23, Thm. 6.7]; O3.6 makes `hessianOp` invertible near the critical point.

**Checks.**

- For `f(x) = x²/2 + x³/3` near `0`, the Newton error is `x²/(1 + 2x) ≤ 2x²` for `|x| ≤ 1/4`.
- *Non-example:* Newton's method is not attracted only to minimizers. For `f(x) = −x²` on `ℝ`, one
  Newton step from any point lands on the maximizer `0`.

*Needs:* O2.3, O3.6.

### O5.3 Trust regions with truncated conjugate gradients

`rtrSeq`, `trSeq_tcg_local_superlinear`. Take a global retraction, `H_x = hessianOp I f x`, and
`tcg` with `θ > 0` and `κ ∈ (0, 1)` as inner solver. (a) Near a nondegenerate local minimizer `x*`
there is a neighbourhood from which the iterates converge to `x*`. (b) If the iterates converge to a
nondegenerate local minimizer `x*`, then either some iterate is `x*`, after which every trial step is
`0` and is rejected (Conventions), or all but finitely many steps are accepted and the radius
constraint is eventually inactive; in both cases the convergence has order `min(1 + θ, 2)`.

The sources state (a) under global hypotheses (`f` bounded below with a radially Lipschitz pullback
gradient, a uniform bound on `H`, and `‖ξ‖ ≥ µ d(x, R_x ξ)` for short `ξ`) [AMS08, Thm. 7.4.10 with
Thm. 7.4.2; ABG07, Thm. 4.12; B23, Thm. 6.29], and (b) for a sequence assumed to converge, under
`‖H_x − Hess(f ∘ R_x)(0)‖ ≤ β_H ‖grad f(x)‖` and a local Lipschitz bound on `Hess(f ∘ R_x)`
[AMS08, Thms. 7.4.11, 7.4.12; ABG07, Thm. 4.13; B23, Thm. 6.30]. Here every hypothesis is local and
follows from smoothness of `f` and `R`, along this route:

- near `x*` the Hessian is uniformly positive definite, so `tcg` meets no nonpositive curvature and,
  since `‖η_j‖` increases towards the Newton step (O4.4), its output has norm at most
  `‖H_x⁻¹‖ ‖grad f(x)‖`: the steps are short;
- smoothness of `R` gives `d(x, R_x ξ) ≤ C‖ξ‖` for `x` near `x*` and short `ξ`, and O2.3's
  acceleration term gives `‖H_x − Hess(f ∘ R_x)(0)‖ ≤ β_H ‖grad f(x)‖`;
- accepted steps decrease `f` and rejected ones keep the iterate, so iterates that start in a small
  sublevel neighbourhood of `x*` (O3.3) stay in it, and Cauchy decrease with the local estimate of
  O5.1 gives convergence, which is (a);
- the model error `|f(R_x(η)) − m_x(η)|` is `O(‖grad f(x)‖ ‖η‖² + ‖η‖³)`, while the model decrease is
  at least `c‖η‖²`, so `ρ_k → 1`: all but finitely many steps are accepted, the radius stops
  shrinking, and as the steps tend to `0` the constraint becomes inactive (AMS08 asserts this in the
  proof of Thm. 7.4.11 without proving it); an interior `tcg` step passes the residual test, which
  gives the order `min(1 + θ, 2)` as in [AMS08, Thm. 7.4.11].

**Checks.**

- For an exact quadratic on `ℝ` with `H` its Hessian, the error is `0` after one accepted step, for
  `θ = 1` and `θ = 1/2`, and the residual `0` passes the stopping test.

*Needs:* O2.3, O3.3, O3.6, O4.3, O4.4.

### Examples

On `ℝ`, `f(x) = a x²/2` with `a > 0`: Newton's method and trust regions with `H = a` reach `0` in one
step from every point, and Armijo gradient descent converges linearly; for `f(x) = −x²`, Newton's
method converges to the maximizer, while Armijo descent from `x₀ ≠ 0` moves away from it.

### Dependencies

O5.1 needs O3.3, O4.2 and Tau Ceti's local gradient estimate; O5.2 needs O2.3 and O3.6; O5.3 needs
O2.3, O3.3, O3.6, O4.3 and O4.4.

## Layer 6: Geodesic convexity

### O6.1 Segments and characterization

Prove that every metric geodesic segment (`TauCeti.IsGeodesicSegment`, for the Riemannian distance)
is a smooth geodesic on `[0, 1]` (`isGeodesicCurveOn_of_isGeodesicSegment`), from
SmoothBundlesConnections B6.0's strongly geodesically convex neighbourhoods and Tau Ceti's uniqueness
of minimizers in normal balls (HopfRinow Layer 2); and that every point has a neighbourhood `W` and
an `r > 0` such that each geodesic of length less than `r` starting in `W` is, reparametrized
affinely to `[0, 1]`, a metric geodesic segment (B6.0's uniform normal radius). Tau Ceti's
`TauCeti.ConvexAlongGeodesics κ φ` (convexity along every metric geodesic segment) and
`TauCeti.GeodesicallyConvex κ φ` (along some segment between each pair of points) are the two forms of
OptimalTransport §9.3's `κ`-convexity, applied to `fun x ↦ (f x : EReal)`. For smooth `f`,
`ConvexAlongGeodesics` holds iff `Hess f ⪰ κ g` everywhere (`convexAlongGeodesics_iff`)
[B23, Thm. 11.23]. On a complete manifold, `GeodesicallyConvex` holds iff `Hess f ⪰ κ g` as
well (`geodesicallyConvex_iff`), so the two forms agree there; one direction is Tau Ceti's
`TauCeti.ConvexAlongGeodesics.geodesicallyConvex`. State the characterization on open geodesically
convex subsets as well (every two points joined by a metric geodesic segment inside the subset).

**Checks.**

- On `ℝ`, `f(x) = x²/2` is `1`-convex: at `x = 0`, `y = 2`, `t = 1/2` both sides equal `1/2`, and
  `κ = 2` fails there; `κ‖v‖² = 9 = Hess f(v, v)` for `v = 3`.
- *Non-example:* geodesic convexity along metric segments is not a Riemannian notion by itself. On a
  metric space with no nonconstant geodesic segments every function satisfies the predicate
  vacuously, and the unit sphere with its ambient chordal metric is such a space. The statements of
  this layer carry their Riemannian hypotheses explicitly, and convexity on the matrix manifolds is
  stated for their Riemannian distances.

*Needs:* SmoothBundlesConnections B6.0; Tau Ceti's exponential map, minimizers in normal balls and
geodesic convexity predicates; O1.4.

### O6.2 Consequences

On a complete connected manifold [B23, Thms. 11.6, 11.7, Cor. 11.22, Lemmas 11.27, 11.28]. For `κ ≥ 0`, every critical point
and every local minimizer is a global minimizer. For `κ > 0`, a minimizer `x*` exists and is unique,
`f(y) − f(x*) ≥ (κ/2) d(y, x*)²`, and the Polyak–Łojasiewicz inequality
`f(x) − f(x*) ≤ ‖grad f(x)‖²/(2κ)` holds.

**Checks.**

- On `ℝ`, `f(x) = x²/2` with `κ = 1` has the unique minimizer `0`, and the gap `x²/2` equals both
  `κd²/2` and `‖grad f‖²/(2κ)`.

*Needs:* O6.1.

### O6.3 Rates

For a global retraction with the pullback bound with constant `L`, gradient descent with step `1/L`
satisfies `f(x_k) − f(x*) ≤ (1 − κ/L)^k (f(x₀) − f(x*))` (`rgd_linear_of_convexAlongGeodesics`);
in positive dimension the hypotheses force `κ ≤ L`. The proof combines O4.1's decrease
`f(x_{k+1}) ≤ f(x_k) − ‖grad f(x_k)‖²/(2L)` with O6.2's Polyak–Łojasiewicz inequality;
[B23, Thm. 11.29] is the case of the exponential map with a Lipschitz gradient.

**Checks.**

- On `ℝ`, `f(x) = x²/2` with `L = κ = 1`: the gap is `0` from `k = 1` on. On a one-point manifold
  the gap is always `0`, even when `κ > L`.

*Needs:* O4.1, O6.2.

### O6.4 Compactness

A continuous `0`-geodesically convex function on a compact connected manifold is constant
(`const_of_convexAlongGeodesics`): by O6.1, every point near a maximum point `p` lies on a metric
geodesic segment with `p` in its interior, along which the function is convex with an interior
maximum, so the set where the maximum is attained is open [B23, Prop. 11.12, Cor. 11.10].

**Checks.**

- On the unit sphere of `V` with `dim V ≥ 2`, which is connected (`isPreconnected_sphere`), with its
  Riemannian distance (the Distances on the matrix manifolds convention), every continuous
  geodesically convex function is constant; the height function `x ↦ x₁` fails convexity along a
  short arc symmetric about its maximum.
- *Non-example:* geodesic convexity is not a useful hypothesis on compact manifolds, by this item.

*Needs:* O6.1.

### O6.5 Continuous time

Let `f` be a smooth `κ`-geodesically convex cost on a complete connected manifold and `x_t` the
maximal integral curve of `−grad f` from `x₀` (`TauCeti.maximalIntegralCurve`). Prove: (a) for every
`y`, the upper right Dini derivative of `t ↦ ½d(x_t, y)²` is at most `⟪grad f(x_t), γ'(0)⟫` for every
minimizing geodesic `γ : [0, 1] → M` from `x_t` to `y`, from Tau Ceti's first variation of energy
(HopfRinow Layer 2), so convexity along `γ` gives
`½ D⁺_t d(x_t, y)² + (κ/2) d(x_t, y)² ≤ f(y) − f(x_t)`; (b) the curve is defined on `[0, ∞)`: with
`y = x₀`, this inequality and convexity at `x₀` bound `d(x_t, x₀)` on bounded time intervals, closed
balls are compact (Hopf–Rinow), and the escape lemma `eventually_notMem_nhdsLT_maximalIntegralCurve`
excludes a finite end time; (c) the flow is therefore an `EVI_κ` solution, Tau Ceti's
`TauCeti.IsEVISolution` (OptimalTransport §10.3). No single source states this result for Riemannian
manifolds; the argument above is its proof.

**Checks.**

- On `ℝ`, for `f(x) = x²/2`, `κ = 1`, `x_t = e^{−t}`, `y = 2` at `t = 0`: `½(d²)' = 1 =
  ⟪grad f, γ'(0)⟫`, and the EVI inequality `1 + 1/2 = 3/2 = f(2) − f(1)` holds with equality.
- For `f(x) = −x²/2` and `κ = −1`, the flow `x_t = e^t` is defined for all time: negative `κ` does
  not force blow-up.

*Needs:* O6.1; Tau Ceti's maximal integral curves, first variation and Hopf–Rinow; OptimalTransport
§10.3.

### O6.6 Positive-definite matrices

`log det` is geodesically affine, `tr` is geodesically convex, and `tr X − log det X` has the unique
minimizer `I` [B23, Ex. 11.34 for `log det`]; prove each from the explicit geodesics of O0.3, which by
O6.1 and the injectivity of `exp_X` are all the metric geodesic segments of `P(n)`.

**Checks.**

- On `P(1)`, along the geodesic `X_t = 4^{1−t}9^t`, `log X_t` is affine in `t` and
  `X_t'' = (log(9/4))² X_t ≥ 0`; `x − log x` has derivative `0` only at `1`, where it equals `1`.

*Needs:* O0.3, O6.1.

### Examples

`P(n)` is complete, `log det` is geodesically affine and `tr` geodesically convex on it; on the unit
sphere of a `V` of dimension at least `2` every continuous geodesically convex function is constant.

### Dependencies

O6.1 needs SmoothBundlesConnections B6.0 and Tau Ceti's exponential map and geodesic convexity
predicates; O6.2–O6.4 need O6.1 and Tau Ceti's geodesic-space API, with O6.3 also needing O4.1; O6.5
needs O6.1, Tau Ceti's first variation of energy and OptimalTransport §10.3; O6.6 needs O0.3's
`P(n)`.

## Worked examples

- **Manopt's first example.** For self-adjoint `A` on `V` and `f(x) = −⟪A x, x⟫` on the unit sphere
  (`rayleighCost`) [AMS08, Props. 4.6.1, 4.6.2; B23, Ex. 5.18]: `ι'(grad f(x)) = −2(Ax − ⟪Ax, x⟫x)`; `x` is critical iff it
  is an eigenvector with eigenvalue `⟪Ax, x⟫`; `Hess f(x)[u] = −2(Proj_x(Au) − ⟪Ax, x⟫u)`; every
  second-order critical point is a global minimizer (`isMinOn_rayleighCost_of_hessian_nonneg`); the
  minimum value is `−λ_max`, reconciled with Mathlib's `hasEigenvalue_iSup_of_finiteDimensional` and
  `hasEigenvector_of_isMaxOn`. When `λ_max` is simple, its two unit eigenvectors are nondegenerate
  minimizers, so O5.2 and O5.3 apply. For `A = diag(2, 1)`, `e₁` has value `−2` and transverse
  Hessian `2`, and `e₂` has value `−1` and Hessian `−2`.
- **Product of spheres** (Manopt's manifolds page). For `f(x, y) = ⟪x, Ay⟫` on
  `S^{m−1} × S^{n−1}`: `(x, y)` is critical iff `Ay = σx` and `Aᵀx = σy` with `σ = ⟪x, Ay⟫`, and the
  minimum value is `−σ₀(A)`, minus the operator norm of `A`. For `A = diag(3, 1)`, `x = e₁` and
  `y = −e₁` give `σ = −3`.
- **Brockett's cost on the Stiefel manifold** [Bro91; AMS08, §4.8.1, (4.32), and §4.8.2 for the critical points]. For symmetric `A` and
  `N = diag(μ₁, …, μ_p)`, `f(X) = tr(XᵀAXN)`: if the `μ_i` are distinct and nonzero, `X` is critical
  iff `AX = XΛ` with `Λ` diagonal; if `μ₁ ≥ … ≥ μ_p ≥ 0`, the minimum value is `Σ μ_i λ_i^↑` with the
  eigenvalues in increasing order, consuming Majorization's Ky Fan theory (MAJ-A26–MAJ-A35). For
  `A = diag(1, 3)` and `N = diag(2, 1)`, the identity gives `5` and the swap `7`.
- **Principal subspace on the Grassmannian** [AMS08, §6.4.2; EAS98, §4.8; B23, Ex. 9.51]. For symmetric `A` on `ℝⁿ` and
  `0 ≤ p ≤ n`, `f(π X) = −tr(XᵀAX)` is well defined; a subspace `W ∈ Gr(n, p)` is critical iff it is
  `A`-invariant; the minimum value is `−(λ₁ + … + λ_p)` with the eigenvalues in decreasing order; and
  if `1 ≤ p < n` and `λ_p > λ_{p+1}`, every second-order critical point is the dominant
  `p`-dimensional invariant subspace. The minimum value consumes Majorization's Ky Fan theory. For `A = diag(2, 1)` and `p = 1`, `span(e₁)` has value `−2` and
  transverse Hessian `2`, `span(e₂)` has value `−1` and Hessian `−2`. *Non-example:* symmetry is
  needed. For `A = [[0, 1], [−1, 0]]` the cost vanishes on `Gr(2, 1)`, so every line is critical,
  while `span(e₁)` is not invariant.
- **Entropic transport on `DS(n)`.** For a cost matrix `C` and `ε > 0`, let
  `f̄(X) = ⟪C, X⟫ + ε Σ X_ij (log X_ij − 1)` on the positive orthant. A point `X ∈ DS(n)` is critical
  iff `C + ε log X = α𝟏ᵀ + 𝟏βᵀ` for some `α, β ∈ ℝⁿ`, iff `X = SK(exp(−C/ε))`; that point is the
  unique minimizer on `DS(n)`, and `X/n` is the minimizer of OptimalTransport §13.1–13.2's
  cost-regularized problem with cost `C` between the uniform probability measures on `Fin n` (Tau
  Ceti's `TauCeti.existsUnique_isCoupling_klDiv_eq_schroedingerValue`). For `n = 2`, `C = 0` and
  `ε = 1` the minimizer is `J₂/2`, and `J₂/4` has uniform marginals.

## Scope and ownership

### Scope

Manifolds are finite-dimensional, real, Hausdorff and boundaryless; algorithms are deterministic and
run in exact arithmetic. The matrix manifolds are exactly those of O0.3.

### Out of scope

Conjugate-gradient and quasi-Newton methods as outer optimization algorithms, together with the
Wolfe-condition line searches they need (truncated conjugate gradients as the trust-region inner
solver, O4.4, is in scope); stochastic, nonsmooth, derivative-free and inequality-constrained methods
on manifolds; floating-point error analysis; automatic differentiation; the toolbox's software devices
(finite-difference gradient checks, caching, hashing, vectorization of tangent vectors); the other
Manopt geometries (complex and generalized variants, elliptope, spectrahedron, hyperbolic and
Poincaré models, the essential manifold, tensor formats); and the symmetric and definite multinomial
manifolds of [DH19].

### What this roadmap owns

1. The standard matrix manifolds as concrete Riemannian manifolds: the embedded manifolds of O0.3 on
   Tau Ceti's regular levels, `P(n)` and the Fisher manifolds (the open simplex and the multinomial
   and doubly stochastic manifolds), which it builds, and the Riemannian structure of the
   Grassmannian, which it puts on TopologicalKTheory's smooth structure (Layer 0).
2. The extrinsic calculus that computes Riemannian gradients and Hessians from Euclidean ones, on
   embedded submanifolds and on quotients (Layer 1).
3. Retractions, their order, Taylor expansions along them, and vector transports (Layer 2), and the
   smoothness and derivative of the Sinkhorn scaling.
4. Optimality conditions in the form the algorithms use (Layer 3).
5. Riemannian gradient descent, Newton's method and the trust-region method with truncated conjugate
   gradients, with global complexity bounds (Layer 4) and local rates (Layer 5).
6. The Riemannian characterization of geodesic convexity and its algorithmic consequences
   (Layer 6).

### Relation to other roadmaps

One owner per shared construction, stated identically on both sides.

- **DifferentialGeometry** owns metrics, the gradient and the Hessian, all now Tau Ceti's; this
  roadmap adds only the operator form `hessianOp` of the same Hessian.
- **HopfRinow** (completed, implemented in Tau Ceti) owns the connection, geodesics, the exponential
  map and local logarithms, the first variation of energy, and the metric geodesic-space API; O2.2
  consumes the exponential map as a retraction.
- **RiemannianGeometry** owns the second fundamental form, the shape operator, Riemannian submersions
  and the nearest-point retraction of closed-image Euclidean embeddings (R6); O1.3 states the
  optimization formulas in their terms, O0.2 constructs quotient metrics in R1's sense, and O2.2
  adds the local metric projection of a locally closed submanifold.
- **MorseTheory** owns critical Hessians, strict minimality of nondegenerate minima, regular levels
  of scalar functions and continuous gradient flows, all pinned in Tau Ceti; this roadmap owns
  discrete iterations and their rates.
- **OptimalTransport** owns metric geodesic convexity, metric gradient flows, `EVI`, entropic
  transport and finite matrix scaling; O6 owns the Riemannian characterization of geodesic
  convexity and the consequences for discrete algorithms, and O2.2 owns the smoothness and
  derivative of the Sinkhorn scaling and the retraction built from it.
- **SmoothBundlesConnections** owns regular fibres, parallel transport and strongly geodesically
  convex neighbourhoods; O0.1, O2.5 and O6.1 consume them.
- **TopologicalKTheory** owns the smooth real Grassmannian (T1.5); O0.3 adds its quotient metric, the
  projection from `St(n, p)` and the Riemannian computations, and builds no second carrier.
- **Tau Ceti's Stiefel manifolds** `TauCeti.stiefel` are the frame model; O0.3 builds the matrix
  model `St(n, p)` with its metric and proves the comparison. **DGFloer** Layer 1 item 7 states
  homogeneous identifications for ordered orthonormal two-frames, which O0.3's comparison identifies
  with `St(n, 2)`.
- **LieGroups** owns the Lie-group structure of matrix groups; O0.3 compares with it.
- **RealSemisimpleLieGroups** owns the symmetric spaces `G/K`; O0.3 owns the matrix model `P(n)` with
  its explicit formulas and proves the isometry with `GL_n(ℝ)/O(n)`.
- **Majorization**, **PrincipalAngles** and **PolarDecomposition** own Ky Fan theory, principal angles
  and polar factors; the nearest-point property of the polar factor on `St(n, p)` is proved here (O2.2).
  Matrix functional calculus, doubly stochastic matrices and the standard simplex are Mathlib's.
- **VariationalMethods** Layer 4 owns successive Rayleigh minimization and min–max on Hilbert spaces,
  the infinite-dimensional counterpart of the Rayleigh example; it is not a prerequisite here.

### Prior work and coordination

- **Manopt** [BMAS14], with its Python and Julia counterparts Pymanopt and Manopt.jl: source of the
  matrix manifolds, of the operations a manifold supplies to a solver, and of the worked examples. It
  is software, and nothing here transcribes it.
- **Optlib** (`github.com/optsuite/optlib`, [LWHWXW24]): a Lean 4 formalization of Euclidean
  first-order methods (gradient descent for convex and strongly convex costs, subgradient,
  proximal-gradient and Nesterov methods) with their rates. Its Euclidean statements are the
  `M = V`, `R_x(v) = x + v` specializations of O4.1 and O6.3. Coordinate step-size and descent-lemma
  vocabulary with its authors, and confirm its licence before adapting any of it.

### Module structure

`TauCeti/Geometry/Manifold/Optimization/` for retractions, the extrinsic calculus and the
algorithms; `TauCeti/Geometry/Manifold/Instances/{FixedRank,PosDef,Multinomial,DoublyStochastic}.lean`
for the new manifolds; and the metric and comparison material for the Stiefel manifold and the
Grassmannian beside Tau Ceti's `Instances/Stiefel.lean` and TopologicalKTheory's Grassmannian.

## Exact supplier contracts

### From Mathlib

- **Manifold calculus:** `mfderiv`, `mvfderiv` (`Geometry/Manifold/MFDeriv/NormedSpace.lean`),
  `Manifold.IsImmersion`, `Manifold.IsSubmersion`, `Manifold.IsSmoothEmbedding`,
  `IsLocalDiffeomorphAt`, and the instances lowering `IsManifold I ∞ M` and
  `IsContMDiffRiemannianBundle I ∞ E _` to every finite order; `ModelWithCorners.pi` and the charted
  space `ModelPi` of finite powers, with no `IsManifold` instance for them.
- **Riemannian layer:** `Bundle.RiemannianBundle`, `IsContMDiffRiemannianBundle`,
  `IsRiemannianManifold`, `riemannianMetricVectorSpace`, the extended Riemannian distance
  `Manifold.riemannianEDist` with its extended metric space `EMetricSpace.ofRiemannianMetric`
  (`Geometry/Manifold/Riemannian/Basic.lean`), and the Levi-Civita connection
  `CovariantDerivative.leviCivitaConnection`.
- **The sphere:** the stereographic atlas `EuclideanSpace.instChartedSpaceSphere` with
  `EuclideanSpace.instIsManifoldSphere`, `contMDiff_coe_sphere`, `range_mvfderiv_subtypeVal` (the
  tangent space at `v` is `(ℝ ∙ v)ᗮ`), `injective_mvfderiv_subtypeVal_sphere`, and
  `isPreconnected_sphere` in dimension at least `2` (`Analysis/Normed/Module/Connected.lean`).
- **Euclidean calculus and projections:** `gradient` (`Analysis/Calculus/Gradient/Basic.lean`),
  `Submodule.starProjection`, and the Lagrange multiplier theorem
  `IsLocalExtrOn.exists_multipliers_of_hasStrictFDerivAt`.
- **Rayleigh quotients:** `ContinuousLinearMap.rayleighQuotient`,
  `IsSelfAdjoint.hasEigenvector_of_isLocalExtrOn`, `…_of_isMaxOn`, `…_of_isMinOn`, and
  `LinearMap.IsSymmetric.hasEigenvalue_iSup_of_finiteDimensional` with its `iInf` twin
  (`Analysis/InnerProductSpace/Rayleigh.lean`).
- **Matrix sets and eigenvectors:** `Matrix.orthogonalGroup`, `Matrix.specialOrthogonalGroup`,
  `Matrix.PosDef`, `doublyStochastic` (`Analysis/Convex/DoublyStochasticMatrix.lean`), the standard
  simplex `Convexity.StdSimplex` (`Geometry/Convex/ConvexSpace/Defs.lean`), the Hadamard product
  `Matrix.hadamard`, and `Module.End.HasEigenvector`.
- **Spectral data:** `LinearMap.singularValues` (`Analysis/InnerProductSpace/SingularValues.lean`),
  `Matrix.toEuclideanLin`, the functional calculus of Hermitian matrices
  `Matrix.IsHermitian.instContinuousFunctionalCalculus`
  (`Analysis/Matrix/HermitianFunctionalCalculus.lean`), and `InnerProductSpace.gramSchmidtNormed`
  (`Analysis/InnerProductSpace/GramSchmidtOrtho.lean`).

### From Tau Ceti

Paths are under `TauCeti/`.

- **Gradient and Hessian:** `TauCeti.Manifold.mgradient` with `mgradient_eq_zero_iff`
  (`Geometry/Manifold/Riemannian/Gradient/Basic.lean`), the chain rule `mgradient_comp`
  (`…/Gradient/ChainRule.lean`), `mgradient_eq_gradient` (`…/Gradient/NormedSpace.lean`),
  `TauCeti.Manifold.hessian` with `hessian_symm` (`…/Riemannian/Laplacian.lean`), and
  `TauCeti.Manifold.hessian_eq_criticalHessian` (`…/Riemannian/CriticalHessian.lean`).
- **Exponential map** (HopfRinow, completed): `TauCeti.Manifold.riemannianExp` and `expDomain`, with
  `isOpen_setOfPred_mem_expDomain`, `zero_mem_expDomain`, `contMDiffOn_riemannianExp_tangentBundle`,
  `riemannianExp_zero`, `curveVelocity_riemannianExp_smul`, `mfderiv_riemannianExp_apply_zero` and
  `isLocalDiffeomorphAt_riemannianExp_zero` (`Geometry/Manifold/Riemannian/Geodesic/Exponential.lean`);
  `riemannianLog` (`…/Geodesic/Normal/Basic.lean`); `TauCeti.Manifold.IsGeodesicCurveOn`
  (`…/Geodesic/Basic.lean`); the Gauss lemma, minimizers in normal balls and the first variation of
  energy (`…/Geodesic/Gauss/`, `…/Geodesic/FirstVariation.lean`); and Hopf–Rinow
  (`…/Geodesic/HopfRinow.lean`). Together the first of these make the exponential map a retraction
  with no new analysis: `Suggested.lean` builds `expRetraction` from them (O2.2).
- **Curves:** `CovariantDerivative.alongCurveWithin`
  (`Geometry/Manifold/VectorBundle/CovariantDerivative/AlongCurve/Basic.lean`), the covariant
  acceleration `CovariantDerivative.acceleration` (`…/AlongCurve/Acceleration.lean`),
  `TauCeti.Manifold.curveVelocity` (`Geometry/Manifold/MFDeriv/Curve.lean`), and the Gauss formula
  of an isometric immersion `CovariantDerivative.IsLeviCivitaConnection.inner_apply_eq_inner_mvfderiv`
  (`…/CovariantDerivative/LeviCivita/Immersion.lean`).
- **Metrics:** `TauCeti.inducedRiemannianMetric` with `inducedRiemannianMetric_inner`, the metric
  induced by an immersion into an inner-product space (`Geometry/Manifold/Riemannian/Induced.lean`);
  the round metric `TauCeti.sphereRoundMetric` with its instances and `sphereTangentEquiv`
  (`…/Riemannian/Sphere/Basic.lean`); product metrics (`…/Riemannian/Prod.lean`); the restriction of a
  metric to an open submanifold, the scoped instance `TauCeti.Manifold.instRiemannianBundleOpen`, with
  `TauCeti.Manifold.pathELength_subtypeVal_comp` (`…/Riemannian/Restriction.lean`); the Riemannian
  distance `TauCeti.MetricSpace.ofRiemannianMetric` of a preconnected manifold, whose topology is
  definitionally the manifold topology, with its `IsRiemannianManifold` instance, and
  `TauCeti.Manifold.riemannianEDist_lt_top_iff_mem_connectedComponent`, by which the extended
  distance is finite exactly within a connected component (`…/Riemannian/Distance.lean`), installed as
  in `TauCeti.HyperbolicMetric` (`…/Riemannian/Hyperbolic.lean`); and
  `TauCeti.completeSpace_of_isPretransitive_isom`, completeness of homogeneous Riemannian manifolds
  (`…/Riemannian/Homogeneous.lean`).
- **Regular levels and normal tubes:** `TauCeti.regularLevelChartedSpace`,
  `TauCeti.isManifold_regularLevel`, `TauCeti.isSmoothEmbedding_coe_regularLevel` and
  `TauCeti.range_mfderiv_coe_regularLevel` (`Geometry/Manifold/RegularValue/Level.lean`), with
  `TauCeti.isRegularPoint_iff_surjective_fderiv`; the manifold-target regular fibres
  `TauCeti.regularFiberChartedSpace` and
  `TauCeti.exists_diffeomorph_regularFiber_regularLevel_apply_eq_self`
  (`…/RegularValue/ManifoldLevel.lean`, `…/RegularValue/Atlas.lean`); the normal exponential
  `TauCeti.SmoothEmbedding.normalExp` (`Geometry/Manifold/TubularNeighborhood/Riemannian/Basic.lean`)
  and the Euclidean normal tube `TauCeti.normalTube` (`…/TubularNeighborhood/Euclidean.lean`).
- **Stiefel manifolds:** `TauCeti.stiefel E k`, the orthonormal `k`-frames of `E`, with its charted
  and manifold instances and `TauCeti.range_mfderiv_coe_stiefel`
  (`Geometry/Manifold/Instances/Stiefel.lean`).
- **Matrices:** `TauCeti.PosDefMatrix` (`MeasureTheory/Measure/SymmetricMatrix/PosDef.lean`); the
  Sinkhorn iteration `Matrix.sinkhornStep`, `Matrix.sinkhornPlan` and
  `Matrix.tendsto_sinkhornPlan_iterate` (`Data/Matrix/Sinkhorn/Basic.lean`); and
  `Matrix.IsDiagonalScaling`, `Matrix.HasMarginals`, the Sinkhorn–Knopp theorem
  `Matrix.exists_sinkhorn_scaling` and uniqueness `Matrix.IsDiagonalScaling.eq_of_hasMarginals`
  (`Data/Matrix/Scaling/Basic.lean`).
- **The manifold inverse function theorem:** `TauCeti.isLocalDiffeomorphAt_of_mfderiv_eq`
  (`Geometry/Manifold/LocalDiffeomorph/Basic.lean`).
- **Critical points and flows:** `TauCeti.IsManifoldNondegenerateCriticalPoint` and `IsMorse`
  (`Geometry/Manifold/Morse/Basic.lean`); `TauCeti.criticalHessian` and
  `TauCeti.isManifoldNondegenerateCriticalPoint_iff_criticalHessian` (`…/Morse/Hessian.lean`); the
  Fermat theorem `IsLocalExtr.mem_criticalPoints` (`…/Morse/CriticalPoints.lean`); the local estimate
  `TauCeti.IsManifoldNondegenerateCriticalPoint.exists_mul_abs_sub_le_norm_mgradient_sq`
  (`…/Morse/ExponentialConvergence.lean`); `TauCeti.maximalIntegralCurve` on
  `maximalIntegralCurveInterval`, with the escape lemma `eventually_notMem_nhdsLT_maximalIntegralCurve`
  (`Geometry/Manifold/IntegralCurve/Maximal.lean`).
- **Metric geodesics, convexity and EVI:** `TauCeti.IsGeodesicSegment` and `IsGeodesicSpace`
  (`Topology/MetricSpace/Length.lean`); `TauCeti.ConvexAlongGeodesics`, `TauCeti.GeodesicallyConvex`
  and `TauCeti.ConvexAlongGeodesics.geodesicallyConvex` (`Analysis/GradientFlow/GeodesicConvex.lean`);
  `TauCeti.IsEVISolution` (`Analysis/GradientFlow/EVI/`); and the entropic transport minimizer
  `TauCeti.existsUnique_isCoupling_klDiv_eq_schroedingerValue`
  (`MeasureTheory/OptimalTransport/Entropic/Basic.lean`).

### From DifferentialGeometry

[DifferentialGeometry](../DifferentialGeometry/README.md) 12.1–12.3: metrics, the gradient and the
Hessian, which are Tau Ceti's (`TauCeti.Manifold.mgradient`, `TauCeti.Manifold.hessian`).

### From HopfRinow

[HopfRinow](../../Completed/HopfRinow/README.md) (completed; as implemented in Tau Ceti) Layers 1–4:
the Levi-Civita connection and its regularity, along-curve differentiation, exponential maps and
local logarithms, the Gauss lemma, minimizing geodesics and the uniqueness of minimizers in normal
balls, the first variation of energy, Hopf–Rinow, and the metric length- and geodesic-space API.

### From RiemannianGeometry

[RiemannianGeometry](../RiemannianGeometry/README.md): the signs of `B` and `S_η` in its Conventions
(`S_η X = −(∇_X η)^⊤`, `⟪S_η X, Y⟫ = ⟪B(X, Y), η⟫`); R5a's second fundamental form and shape
operator; R1 §1.3's Riemannian submersions with their horizontal and vertical projections `h` and `v`;
and R6's nearest-point retraction of a closed-image Euclidean embedding.

### From MorseTheory

[MorseTheory](../MorseTheory/README.md) M1 §1.2 (critical Hessians and their identification with
`hessian`), M1 §1.3 (isolation and strict minimality of nondegenerate minima), M2 §2.1 (regular
levels of scalar functions) and M6 §6.1 (the local estimate `λ|f − f(p)| ≤ ‖grad f‖²` and the
convergence of the continuous gradient flow), all pinned in Tau Ceti.

### From OptimalTransport

[OptimalTransport](../OptimalTransport/README.md) §9.3: the `λ`-geodesic-convexity convention
`Φ(γ_t) ≤ (1−t)Φ(γ₀) + tΦ(γ₁) − (λ/2)t(1−t)d(γ₀,γ₁)²` (Tau Ceti's `ConvexAlong`); §10.3: `EVI_λ`
(Tau Ceti's `IsEVISolution`); §13.1–13.2: entropic transport and its unique minimizer; §13.8: finite
matrix scaling, whose existence for positive kernels is Tau Ceti's `Matrix.exists_sinkhorn_scaling`.

### From SmoothBundlesConnections

[SmoothBundlesConnections](../SmoothBundlesConnections/README.md) B1.0: regular fibres, their open
restriction and atlas independence; B5.0: horizontal lifts along piecewise `C¹` curves, which for the
Levi-Civita connection, through B3.3's frame-bundle description, give parallel transport; B6.0:
uniform normal and strong-convexity radii on compact sets, and strongly geodesically convex
neighbourhoods, in which any two points are joined by a unique minimizing geodesic.

### From LieGroups

[LieGroups](../RepresentationTheory/LieGroups/README.md) Layer 2: the closed-subgroup theorem (Tau
Ceti's `TauCeti.Lie.isEmbeddedLieSubgroup_of_isClosed`) and its transport to
`Matrix.orthogonalGroup` and `Matrix.specialOrthogonalGroup`.

### From TopologicalKTheory

[TopologicalKTheory](../TopologicalKTheory/README.md#t1-continuous-finite-rank-bundles-as-a-category)
T1.5: the smooth graph-chart structure on Tau Ceti's real Grassmannian
`TauCeti.finiteGrassmannian ℝ p n` of `p`-dimensional subspaces of `Fin n → ℝ`, of dimension
`p(n − p)`.

### From RealSemisimpleLieGroups

[RealSemisimpleLieGroups](../RealSemisimpleLieGroups/README.md) §5.2–5.3: the symmetric space
`G/K` for `G = GL_n(ℝ)`, `K = O(n)`, with its invariant metric.

### From Majorization, PrincipalAngles and PolarDecomposition

[Majorization](../OperatorTheory/Majorization/README.md) MAJ-A26–MAJ-A35 (Ky Fan variational
theory); [PrincipalAngles](../OperatorTheory/PrincipalAngles/README.md) PA-A15–PA-A24, PA-B19 and
PA-B27 (principal angles, with cosines the singular values of the overlap matrix);
[PolarDecomposition](../OperatorTheory/PolarDecomposition/README.md) PD-B37–PD-B39 (the polar factor
`Z(ZᵀZ)^{−1/2}` of a matrix of full column rank is an isometry).

## References

- [B23] N. Boumal, *An Introduction to Optimization on Smooth Manifolds*, Cambridge University
  Press, 2023. Theorem numbers are those of the book, which the author's PDF shares.
- [AMS08] P.-A. Absil, R. Mahony, R. Sepulchre, *Optimization Algorithms on Matrix Manifolds*,
  Princeton University Press, 2008.
- [BAC19] N. Boumal, P.-A. Absil, C. Cartis, Global rates of convergence for nonconvex optimization
  on manifolds, *IMA J. Numer. Anal.* 39(1) (2019), 1–33; arXiv:1605.08101.
- [ABG07] P.-A. Absil, C. G. Baker, K. A. Gallivan, Trust-region methods on Riemannian manifolds,
  *Found. Comput. Math.* 7 (2007), 303–330.
- [AM12] P.-A. Absil, J. Malick, Projection-like retractions on matrix manifolds, *SIAM J. Optim.*
  22(1) (2012), 135–158.
- [EAS98] A. Edelman, T. A. Arias, S. T. Smith, The geometry of algorithms with orthogonality
  constraints, *SIAM J. Matrix Anal. Appl.* 20(2) (1998), 303–353; arXiv:physics/9806030. Its §§2.2
  and 2.3.1 say that the canonical and Euclidean Stiefel metrics coincide when `p = n`; by its
  equation (2.39) the canonical metric is half the Euclidean one there. This roadmap uses the
  Frobenius metric throughout.
- [Ste83] T. Steihaug, The conjugate gradient method and trust regions in large scale optimization,
  *SIAM J. Numer. Anal.* 20(3) (1983), 626–637.
- [Bro91] R. W. Brockett, Dynamical systems that sort lists, diagonalize matrices, and solve linear
  programming problems, *Linear Algebra Appl.* 146 (1991), 79–91.
- [EY36] C. Eckart, G. Young, The approximation of one matrix by another of lower rank,
  *Psychometrika* 1(3) (1936), 211–218.
- [DH19] A. Douik, B. Hassibi, Manifold optimization over the set of doubly stochastic matrices: a
  second-order geometry, *IEEE Trans. Signal Process.* 67(22) (2019), 5761–5774; arXiv:1802.02628.
- [Sin64] R. Sinkhorn, A relationship between arbitrary positive matrices and doubly stochastic
  matrices, *Ann. Math. Statist.* 35 (1964), 876–879.
- [BMAS14] N. Boumal, B. Mishra, P.-A. Absil, R. Sepulchre, Manopt, a Matlab toolbox for
  optimization on manifolds, *J. Mach. Learn. Res.* 15 (2014), 1455–1459. Documentation:
  [manifolds](https://www.manopt.org/manifolds.html),
  [a first example](https://www.manopt.org/firstexample.html).
- [LWHWXW24] C. Li, Z. Wang, W. He, Y. Wu, S. Xu, Z. Wen, Formalization of complexity analysis of the
  first-order algorithms for convex optimization, arXiv:2403.11437 (2024).
