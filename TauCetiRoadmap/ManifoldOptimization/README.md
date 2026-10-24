# Roadmap: Riemannian optimization — retractions, matrix manifolds, and convergence of manifold algorithms

Optimization on manifolds minimizes a smooth cost `f : M → ℝ` over a Riemannian manifold `M`,
usually a manifold of matrices sitting inside a Euclidean space, by computing in tangent spaces
and returning to `M` through a *retraction*. This roadmap asks for that theory, following
[B23] = N. Boumal, *An Introduction to Optimization on Smooth Manifolds*, Cambridge University
Press, 2023, with [AMS08] = P.-A. Absil, R. Mahony, R. Sepulchre, *Optimization Algorithms on
Matrix Manifolds*, Princeton University Press, 2008, for Newton's method and trust regions. The
Manopt toolbox [BMAS14] is the software form of the same theory; this roadmap specifies the
mathematics behind it, not the toolbox.

The geometry these algorithms run on is owned by other roadmaps and consumed here: the metric,
gradient and Hessian (DifferentialGeometry Layer 12), the Levi-Civita connection, geodesics and
the exponential map (HopfRinow), second fundamental forms and Riemannian submersions
(RiemannianGeometry R1 and R5a), critical-point theory and continuous gradient flows
(MorseTheory), and metric geodesic convexity (OptimalTransport Layer 9). This roadmap owns

1. the standard matrix manifolds as concrete Riemannian manifolds (O0);
2. the extrinsic calculus that computes Riemannian gradients and Hessians from Euclidean ones, on
   embedded submanifolds and on quotients (O1);
3. retractions, their order, Taylor expansions along them, and vector transports (O2);
4. optimality conditions in the form the algorithms use (O3);
5. Riemannian gradient descent, Newton's method and the trust-region method, with global
   complexity bounds (O4) and local rates (O5);
6. the Riemannian characterization of geodesic convexity and its algorithmic consequences (O6).

The headline theorems are the `O(1/ε²)` iteration bounds for gradient descent and trust regions
[BAC19], local quadratic convergence of Riemannian Newton [AMS08, Ch. 6], local superlinear
convergence of trust regions with truncated conjugate gradients [AMS08, Ch. 7; ABG07], the benign
landscape of the Rayleigh quotient on the sphere, and linear convergence of gradient descent for
geodesically strongly convex costs. Named theorems are milestones inside a fuller development:
every carrier, retraction and algorithm below comes with its evaluation lemmas and basic API.

Suggested homes: `TauCeti/Geometry/Manifold/Optimization/` for retractions, calculus and
algorithms, and `TauCeti/Geometry/Manifold/Instances/{Stiefel,Grassmannian,FixedRank,PosDef}.lean`
for carriers.

## Scope

Manifolds are finite-dimensional, real, Hausdorff and boundaryless; algorithms are deterministic
and run in exact arithmetic. The catalogue is exactly the manifolds of O0.3. Outside this roadmap:
conjugate-gradient and quasi-Newton methods together with the Wolfe-condition line searches they
need; stochastic, nonsmooth, derivative-free and inequality-constrained methods on manifolds;
floating-point error analysis; automatic differentiation; the toolbox's software devices
(finite-difference gradient checks, caching, hashing, vectorization of tangent vectors); and the
other Manopt geometries (complex and generalized variants, multinomial, elliptope, spectrahedron,
hyperbolic and Poincaré models, the essential manifold, tensor formats).

## Conventions

- **Setting.** `I : ModelWithCorners ℝ E H` with `[FiniteDimensional ℝ E] [I.Boundaryless]`, and
  `M` with `[TopologicalSpace M] [T2Space M] [ChartedSpace H M] [IsManifold I ∞ M]`. The metric is
  the canonical instance `[RiemannianBundle (fun x : M ↦ TangentSpace I x)]` with
  `[IsContMDiffRiemannianBundle I ∞ E (fun x : M ↦ TangentSpace I x)]`, as in HopfRinow; no
  definition takes a second metric argument. Fibre norms and inner products are Mathlib's
  instances scoped in `Bundle`, so files `open Bundle`.
- **Distances and rates.** A statement about distances or rates assumes `[MetricSpace M]` and
  `[IsRiemannianManifold I M]`, HopfRinow's convention identifying `dist` with the Riemannian
  distance. Rates are explicit inequalities: *linear* means `d(x_k, x*) ≤ C q^k d(x₀, x*)` for all
  `k`, with `0 ≤ q < 1`; *quadratic* means `d(x_{k+1}, x*) ≤ c d(x_k, x*)²` for all `k`; *order `p`*
  means `d(x_{k+1}, x*) ≤ c d(x_k, x*)^p` for all sufficiently large `k`.
- **Gradient and Hessian.** The gradient is DifferentialGeometry 12.2's `mgradient I f x`; the
  Hessian bilinear form is 12.3's `hessian I f x v w = ⟪∇_v grad f, w⟫`. The Hessian operator
  `hessianOp I f x : TangentSpace I x →L[ℝ] TangentSpace I x` is `∇(grad f)` at `x` for Mathlib's
  `CovariantDerivative.leviCivitaConnection`, so `hessian I f x v w = ⟪hessianOp I f x v, w⟫`
  (`inner_hessianOp`). It
  is the operator form of the same Hessian, not a second one. MorseTheory M1 identifies `hessian`
  at a critical point with the critical Hessian, and Tau Ceti's
  `IsManifoldNondegenerateCriticalPoint` with invertibility of `hessianOp` there.
- **Minimization.** Every algorithm minimizes. A maximization problem is stated by negating the
  cost; Manopt's first example is the cost `x ↦ -⟪A x, x⟫` on the sphere.
- **Euclidean data.** `V` and `F` are finite-dimensional real inner-product spaces. The Euclidean
  gradient is Mathlib's `gradient`, the Euclidean Hessian operator is `fderiv ℝ (gradient f̄)`,
  and orthogonal projection onto a submodule `K` is `K.starProjection : V →L[ℝ] V`.
- **Matrices.** The ambient space of `n × p` real matrices carries the Frobenius inner product
  `⟪A, B⟫ = tr(AᵀB)`. Realize it on `EuclideanSpace ℝ (Fin n × Fin p)` with an explicit linear
  isometry to `Matrix (Fin n) (Fin p) ℝ`, used for products, transposes and traces; do not install
  a global inner-product instance on `Matrix`. `Sym(p)` and `Skew(p)` are the symmetric and
  skew-symmetric subspaces with the restricted inner product, and `sym(A) = (A + Aᵀ)/2`.
- **Retractions are total, with domains.** A retraction is a map on the whole tangent bundle that
  is smooth on an open domain containing the zero section; theorems about its values carry the
  domain hypothesis, and a *global* retraction has domain `univ` (O2.1). This is the convention of
  HopfRinow's `riemannianExp` and `expDomain`.
- **Iterations are total.** Algorithms are total functions iterated with `Nat.iterate`, and their
  junk values are pinned: Newton's step uses `Ring.inverse` (step `0` where the Hessian is not
  invertible); the Armijo exponent is an `sInf` over `ℕ` (`0` when no exponent qualifies, a case
  excluded by the decrease theorem); the trust-region ratio uses Lean's division (`0` on a zero
  model decrease, a case excluded by Cauchy decrease away from critical points).
- **Algorithm constants.** Armijo backtracking has `ᾱ > 0`, `τ ∈ (0,1)`, `r ∈ (0,1)`; the step
  size is `ᾱ τ^i` for the least `i` with `f x − f (R_x(−ᾱτ^i grad f x)) ≥ r ᾱ τ^i ‖grad f x‖²`.
  Trust regions have acceptance threshold `ρ' ∈ (0, 1/4)`, radius cap `Δ̄ > 0` and `Δ₀ ∈ (0, Δ̄]`;
  the radius is divided by `4` when `ρ < 1/4`, replaced by `min(2Δ, Δ̄)` when `ρ > 3/4` and the
  step lies on the boundary, and kept otherwise; the step is accepted exactly when `ρ > ρ'`.

## What Mathlib already has (consume)

Checked against the pin; re-grep before citing anything in code.

- **Manifold calculus:** `mfderiv`, `mvfderiv` (`Geometry/Manifold/MFDeriv/NormedSpace.lean`),
  `Manifold.IsImmersion`, `Manifold.IsSmoothEmbedding`, `IsLocalDiffeomorphAt`, and the instances
  lowering `IsManifold I ∞ M` and `IsContMDiffRiemannianBundle I ∞ E _` to every finite order.
- **Riemannian layer:** `Bundle.RiemannianBundle`, `IsContMDiffRiemannianBundle`,
  `IsRiemannianManifold`, `riemannianMetricVectorSpace`, and the Levi-Civita connection
  `CovariantDerivative.leviCivitaConnection`.
- **The sphere:** the stereographic atlas `EuclideanSpace.instChartedSpaceSphere` with
  `EuclideanSpace.instIsManifoldSphere`, `contMDiff_coe_sphere`, `range_mvfderiv_subtypeVal`
  (the tangent space at `v` is `(ℝ ∙ v)ᗮ`) and `injective_mvfderiv_subtypeVal_sphere`.
- **Euclidean calculus and projections:** `gradient` (`Analysis/Calculus/Gradient/Basic.lean`),
  `Submodule.starProjection`, and the Lagrange multiplier theorem
  `IsLocalExtrOn.exists_multipliers_of_hasStrictFDerivAt`.
- **Rayleigh quotients:** `ContinuousLinearMap.rayleighQuotient`,
  `IsSelfAdjoint.hasEigenvector_of_isLocalExtrOn`, `…_of_isMaxOn`, `…_of_isMinOn`, and
  `LinearMap.IsSymmetric.hasEigenvalue_iSup_of_finiteDimensional` with its `iInf` twin
  (`Analysis/InnerProductSpace/Rayleigh.lean`).
- **Matrix sets and eigenvectors:** `Matrix.orthogonalGroup`, `Matrix.specialOrthogonalGroup`,
  `Matrix.PosDef`, `Module.End.HasEigenvector`.

## What Tau Ceti already has (consume)

- **The exponential map** (HopfRinow): `TauCeti.Manifold.riemannianExp` and `expDomain`, with
  `isOpen_setOfPred_mem_expDomain`, `contMDiffOn_riemannianExp_tangentBundle`,
  `riemannianExp_zero`, `mfderiv_riemannianExp_apply_zero` and
  `isLocalDiffeomorphAt_riemannianExp_zero`
  (`Geometry/Manifold/Riemannian/Geodesic/Exponential.lean`); `riemannianLog`
  (`…/Geodesic/Normal.lean`); `IsGeodesicCurveOn` (`…/Geodesic/Basic.lean`). Together these make
  the exponential map a retraction with no new analysis (O2.2).
- **Curves:** `CovariantDerivative.alongCurveWithin`
  (`Geometry/Manifold/VectorBundle/CovariantDerivative/AlongCurve/Basic.lean`) and
  `TauCeti.Manifold.curveVelocityWithin` (`Geometry/Manifold/MFDeriv/Curve.lean`).
- **Metrics:** `TauCeti.inducedRiemannianMetric` with `inducedRiemannianMetric_inner`, the metric
  induced by an immersion into an inner-product space (`Geometry/Manifold/Riemannian/Induced.lean`);
  the round metric `TauCeti.sphereRoundMetric` with its `RiemannianBundle` and analytic
  `IsContMDiffRiemannianBundle` instances (`…/Riemannian/Sphere.lean`); product metrics
  (`…/Riemannian/Prod.lean`); restricted metrics on convex open subsets of inner-product spaces with
  `isRiemannianManifold_of_convex` (`…/Riemannian/Convex.lean`); and
  `completeSpace_of_isPretransitive_isom`, completeness of homogeneous Riemannian manifolds
  (`…/Riemannian/Homogeneous.lean`).
- **Riesz duality:** `Riemannian.Tensor.rieszDual`, through which DifferentialGeometry defines
  `mgradient`.
- **Regular zero sets:** `exists_isManifold_sectionZero_of_contMDiff`, `sectionZeroChartedSpace`
  and `isManifold_sectionZero` (`Geometry/Manifold/VectorBundle/Section/`), the construction
  MorseTheory M2 specializes to scalar levels and O0.1 specializes to vector-valued constraints.
- **The manifold inverse function theorem:** `TauCeti.isLocalDiffeomorphAt_of_mfderiv_eq`
  (`Geometry/Manifold/LocalDiffeomorph.lean`).
- **Morse:** `TauCeti.IsManifoldNondegenerateCriticalPoint` and `IsMorse`
  (`Geometry/Manifold/Morse/Basic.lean`), and the vector-space library `Analysis/Calculus/Morse/`.
- **Metric geodesics:** `TauCeti.IsGeodesicSegment` and `IsGeodesicSpace`
  (`Topology/MetricSpace/Length.lean`).

## Suppliers in other roadmaps (consume)

- [DifferentialGeometry](../DifferentialGeometry/README.md) Layer 12: `mgradient`, `hessian`,
  metric existence, and metrics on open subsets.
- [HopfRinow](../HopfRinow/README.md): the Levi-Civita connection and its regularity, along-curve
  differentiation, exponential maps and local logarithms, the Gauss lemma, minimizing geodesics,
  Hopf–Rinow, and the metric length- and geodesic-space API.
- [RiemannianGeometry](../RiemannianGeometry/README.md): R5a's second fundamental form `B` and shape
  operator `S_η` with their pinned signs, and R1's Riemannian submersions, horizontal lifts and
  homogeneous metrics on `G/H`.
- [MorseTheory](../MorseTheory/README.md): M1's critical Hessian, its identification with
  `hessian`, isolation and strict minimality of nondegenerate minima; M4's manifold Fermat theorem;
  M6's local estimate `|f − f(p)| ≤ C‖grad f‖²` near a nondegenerate critical point and its
  continuous gradient-flow convergence.
- [OptimalTransport](../OptimalTransport/README.md) Layer 9: the `λ`-geodesic-convexity predicate
  `Φ(γ_t) ≤ (1−t)Φ(γ₀) + tΦ(γ₁) − (λ/2)t(1−t)d(γ₀,γ₁)²`; Layer 10: metric gradient flows and
  `EVI_λ`.
- [SmoothBundlesConnections](https://github.com/TauCetiProject/TauCetiRoadmap/blob/791dd408dc48930060b28043245bbb1a8d82b5de/TauCetiRoadmap/SmoothBundlesConnections/README.md)
  B1.4–B1.5: smooth quotients by free proper actions with submersion projections and
  principal-bundle structure, and horizontal distributions.
- [LieGroups](../RepresentationTheory/LieGroups/README.md) Layer 2: the closed-subgroup theorem,
  which makes `Matrix.orthogonalGroup` and `Matrix.specialOrthogonalGroup` Lie groups.
- [GeometricTopology](../GeometricTopology/README.md) Layer 1: normal bundles and tubular
  neighbourhoods of embedded submanifolds, on which the nearest-point projection is smooth.
- [Majorization](../OperatorTheory/Majorization/README.md) Part A (Ky Fan variational theory),
  [PrincipalAngles](../OperatorTheory/PrincipalAngles/README.md) (principal angles from singular
  values) and [PolarDecomposition](../OperatorTheory/PolarDecomposition/README.md) (functional
  calculus, positive square roots, polar factors).
- [VariationalMethods](https://github.com/TauCetiProject/TauCetiRoadmap/blob/515847c411b9f9642d7c1d180b2a6e82bb976e3a/TauCetiRoadmap/VariationalMethods/README.md)
  V4: successive Rayleigh minimization and min–max on Hilbert spaces, the infinite-dimensional
  counterpart of the Rayleigh acceptance example.

## Prior work and coordination

- **Manopt** [BMAS14], with its Python and Julia counterparts Pymanopt and Manopt.jl: source of
  the catalogue, of the operations a manifold supplies to a solver, and of the acceptance examples.
  It is software, and nothing here transcribes it.
- **Optlib** (`github.com/optsuite/optlib`, [LWHWXW24]): a Lean 4 formalization of Euclidean
  first-order methods (gradient descent for convex and strongly convex costs, subgradient,
  proximal-gradient and Nesterov methods) with their rates. Its Euclidean statements are the
  `M = V`, `R_x(v) = x + v` specializations of O4.1 and O6.3. Coordinate step-size and
  descent-lemma vocabulary with its authors, and confirm its licence before adapting any of it.
- SmoothBundlesConnections B1.5 consumes a regular-level carrier for submersions from
  LieGroupoidsPoisson G0.1. O0.1 owns locally defined submanifolds of inner-product spaces; on a
  global level set the two carriers are compared literally, and one of them is chosen as the shared
  carrier with that roadmap's owners.

---

## The build, in layers

Names in backticks are the declarations of `Suggested.lean`, which carries the exact hypotheses.

### O0. Riemannian submanifolds and the matrix-manifold catalogue

*[B23, Ch. 3, 7, 9]; [AMS08, Ch. 3]; [EAS98].*

- **O0.1 Locally defined submanifolds.** A subset `S ⊆ V` is *locally defined of dimension `n`*
  when every point of `S` has an open neighbourhood `U` and a smooth `h_U : U → F_U` with
  `dim V − dim F_U = n`, whose zero set is `S ∩ U` and whose derivative is surjective on `S ∩ U`.
  Construct the named charted structure over `EuclideanSpace ℝ (Fin n)` on the subtype from Tau
  Ceti's section-zero theorem applied on each `U`; prove `IsManifold (𝓡 n) ∞`, that the inclusion
  is a `Manifold.IsSmoothEmbedding` whose tangent range at `x` is `ker (fderiv ℝ h_U x)`, and that
  two families of local defining functions give the same structure (the identity is a
  diffeomorphism). Global level sets are the special case `levelSetChartedSpace`,
  `isManifold_levelSet`. Equip the result with `TauCeti.inducedRiemannianMetric` of the inclusion;
  the predicate `IsInducedBy I ι` records the identity `⟪v, w⟫ = ⟪ι'v, ι'w⟫` that O1 consumes.
- **O0.2 Products and powers.** Products with Tau Ceti's product metric, finite powers `Fin k → M`
  on Mathlib's product charts with the sum metric, and componentwise gradients, Hessians,
  retractions and exponential maps. Acceptance: the oblique manifold of O0.3 is identified with the
  `m`-th power of the sphere by a diffeomorphic isometry.
- **O0.3 The catalogue.** For each manifold: the carrier, its dimension, the tangent space as a
  subspace of the ambient space, the orthogonal projection onto it, and the comparison with any
  structure already present on the same set.
  - **Sphere** `{x ∈ V : ‖x‖ = 1}`, from `h(x) = ‖x‖² − 1`. The identity is a diffeomorphism from
    the O0.1 structure to Mathlib's stereographic structure and an isometry to Tau Ceti's round
    metric. Tangent space `(ℝ ∙ x)ᗮ`, projection `u ↦ u − ⟪x, u⟫x`.
  - **Oblique** `OB(n, m)`, the `n × m` matrices with unit columns: dimension `m(n − 1)`; the
    projection removes from each column its component along the corresponding column of `X`.
  - **Stiefel** `St(n, p) = {X : XᵀX = I_p}`, `p ≤ n`, from `h(X) = XᵀX − I_p ∈ Sym(p)`: dimension
    `np − p(p+1)/2`, tangent space `{U : XᵀU + UᵀX = 0}`, projection `Z ↦ Z − X sym(XᵀZ)`. For `p = 1`
    the carrier and structure are literally the sphere's.
  - **Orthogonal groups.** `O(n) = St(n, n)` and `SO(n)`, its clopen subset with `det = 1`. The
    identity is a diffeomorphism between the O0.1 structure and LieGroups' closed-subgroup structure
    on `Matrix.orthogonalGroup` and `Matrix.specialOrthogonalGroup`; the tangent space at `Q` is
    `Q · Skew(n)`.
  - **Grassmann** `Gr(n, p) = St(n, p)/O(p)` for the free proper right action `X ↦ XQ`: the smooth
    quotient of SmoothBundlesConnections B1.4, with the metric making the projection a Riemannian
    submersion (RiemannianGeometry R1). Dimension `p(n − p)`; horizontal space at `X` is
    `{U : XᵀU = 0}`, with projection `Z ↦ (I − XXᵀ)Z`. Prove that `[X] ↦ XXᵀ` is a smooth embedding
    onto the rank-`p` orthogonal projectors, and that the Riemannian distance between `[X]` and
    `[Y]` is `‖θ‖₂` for the principal angles `θ` between `span X` and `span Y` (the `cos θ_i` are the
    singular values of `XᵀY`), consuming PrincipalAngles.
  - **Fixed rank** `ℝ_r^{m×n} = {X : rank X = r}`, `1 ≤ r ≤ min(m, n)`: locally defined by Schur
    complements (near `X` with an invertible `r × r` minor, after permuting rows and columns,
    `[A B; C D] ↦ D − CA⁻¹B`), dimension `(m + n − r)r`, tangent space at `X = UΣVᵀ` (thin SVD)
    `{UMVᵀ + U_pVᵀ + UV_pᵀ : M ∈ ℝ^{r×r}, U_pᵀU = 0, V_pᵀV = 0}`. For `r < min(m, n)` the set is
    not closed in `ℝ^{m×n}`, and no completeness statement is made for it.
  - **Positive-definite matrices** `P(n) = {X ∈ Sym(n) : X ≻ 0}`, an open subset of `Sym(n)` of
    dimension `n(n+1)/2`, with the affine-invariant metric `⟪U, W⟫_X = tr(X⁻¹UX⁻¹W)`, a smooth field
    of coercive bilinear forms on that open subset. Prove that the congruences `X ↦ AXAᵀ`
    (`A` invertible) act transitively by isometries, hence completeness through
    `completeSpace_of_isPretransitive_isom`; that
    `exp_X(U) = X^{1/2} expm(X^{−1/2}UX^{−1/2}) X^{1/2}` is defined on all of `T_X P(n)`; that
    `d(X, Y) = ‖logm(X^{−1/2}YX^{−1/2})‖_F`; and that the geodesic midpoint is the matrix geometric
    mean `X # Y = X^{1/2}(X^{−1/2}YX^{−1/2})^{1/2}X^{1/2}`. Square roots, exponentials and logarithms
    come from PolarDecomposition's functional calculus.

### O1. Extrinsic calculus

*[B23, Ch. 3, 5, 7, 9]; [AMS08, Ch. 3, 5].*

- **O1.1 Tangent spaces as subspaces.** For an immersion `ι : M → V` with induced metric,
  `tangentSubspace I ι x` is the range of `mvfderiv I ι x`, which is a linear isometry onto it.
  Write `Proj_x` for its `starProjection` and `Proj_x^⊥` for that of its orthogonal complement. On a
  locally defined submanifold, `Proj_y = 1 − Dh(y)*(Dh(y)Dh(y)*)⁻¹Dh(y)` near each point, so
  `x ↦ Proj_x` is smooth as a map into `V →L[ℝ] V`.
- **O1.2 Gradients.** For `f = f̄ ∘ ι` with `f̄` differentiable at `ι x`,
  `ι'(grad f(x)) = Proj_x(∇f̄(ι x))` (`mvfderiv_mgradient_comp`). On a quotient by a Riemannian
  submersion `π : M̄ → M`, the horizontal lift of `grad f(π x̄)` is `grad (f ∘ π)(x̄)`.
- **O1.3 Hessians.** *Shape-operator form:* with `ν = Proj_x^⊥ ∇f̄(ι x)` and RiemannianGeometry
  R5a's shape operator,
  `ι'(Hess f(x)[u]) = Proj_x(∇²f̄(ι x)[ι'u]) + ι'(S_ν u)`.
  *Lagrangian form* on a level set of `h` with surjective derivative (`mvfderiv_hessianOp_comp`): if
  `λ : F →L[ℝ] ℝ` satisfies `∇(λ ∘ h)(ι x) = Proj_x^⊥ ∇f̄(ι x)` (it exists and is unique), then
  `ι'(Hess f(x)[u]) = Proj_x(∇²f̄(ι x)[ι'u] − ∇²(λ ∘ h)(ι x)[ι'u])`.
  Prove the two forms agree. *Quotients:* the horizontal lift of `Hess f(π x̄)[u]` is
  `Proj^H(Hess(f ∘ π)(x̄)[ū])`, and at a critical point of a quotient by a group action the vertical
  space lies in the kernel of `Hess(f ∘ π)(x̄)`. Acceptance: on the sphere
  `Hess f(x)[u] = Proj_x(∇²f̄(x)u) − ⟪x, ∇f̄(x)⟫u`; on the Stiefel manifold
  `Hess f(X)[U] = Proj_X(∇²f̄(X)[U] − U sym(Xᵀ∇f̄(X)))`; on the Grassmannian, for `f̄` invariant under
  `X ↦ XQ`, the horizontal lift of `grad f` is `(I − XXᵀ)∇f̄(X)`.
- **O1.4 Curves.** For a `C²` cost and a `C²` curve,
  `(f ∘ γ)'' = Hess f(γ)[γ', γ'] + ⟪grad f(γ), D_t γ'⟫` (`deriv_deriv_comp_eq`), with `D_t`
  HopfRinow's `alongCurveWithin`. For embedded `M`, `ι'(D_t γ') = Proj(d²(ι ∘ γ)/dt²)`.

### O2. Retractions and vector transports

*[B23, Ch. 3, 5, 10]; [AMS08, Ch. 4, 8]; [AM12].*

- **O2.1 Retractions** (`Retraction`). A map `toFun : TangentBundle I M → M` with an open `domain`
  containing the zero section, `C^∞` on `domain`, with `R_x(0) = x` and
  `d/dt R_x(t v)|_{t=0} = v`. `Retraction.retr R x v` is `R_x(v)`; `IsGlobal` means `domain = univ`.
  Each `R_x` is a local diffeomorphism at `0` (`isLocalDiffeomorphAt_retr_zero`, from the manifold
  inverse function theorem), with a local inverse retraction `R_x⁻¹` near `x` carrying its domain and
  smooth jointly in `(x, y)` near the diagonal.
- **O2.2 Order** (`IsSecondOrder`): every curve `t ↦ R_x(t v)` has zero covariant acceleration at
  `t = 0`. For embedded `M`, `R` is second order iff the ambient acceleration
  `d²/dt² ι(R_x(t v))|_{t=0}` lies in `Proj_x^⊥ V` for every `v`. The exponential map is a retraction
  (`expRetraction`, discharged from Tau Ceti's exponential API) and is second order
  (`expRetraction_isSecondOrder`). The metric-projection retraction `R_x(v) = P_M(x + v)` of a
  locally defined submanifold is defined on the open set where `x + v` lies in GeometricTopology's
  tubular neighbourhood, is smooth there, and is second order [AM12]. Required instances:
  - sphere: `(x + v)/‖x + v‖`, global and second order (it is the metric projection);
  - Stiefel, polar: `(X + U)(I + UᵀU)^{−1/2}`, global and second order (it is the metric
    projection);
  - Stiefel, Q-factor: `qf(X + U)`, the orthonormal factor of the QR decomposition with positive
    diagonal, global and first order, and not second order when `p ≥ 2` (witness in the worked
    examples);
  - Grassmann: `([X], ξ) ↦ [qf(X + ξ̄)]`, well defined because a retraction `R̄` on the total space
    with `π(R̄_{XQ}(ξ̄Q)) = π(R̄_X(ξ̄))` for `Q ∈ O(p)` descends; state and prove that descent lemma in
    general;
  - fixed rank: rank-`r` truncation of the SVD of `X + U`, defined where
    `σ_r(X + U) > σ_{r+1}(X + U)`, second order;
  - positive-definite matrices: the exponential map, global.
- **O2.3 Taylor expansions.** For a retraction `R`, the covariant acceleration `a_x(v)` of
  `t ↦ R_x(t v)` at `0` is a quadratic map of `v`. For a `C²` cost,
  `f(R_x(v)) = f(x) + ⟪grad f(x), v⟫ + ½(Hess f(x)[v, v] + ⟪grad f(x), a_x(v)⟫) + o(‖v‖²)`,
  uniformly for `x` in compact sets. The acceleration term vanishes for second-order retractions
  and, for every retraction, at critical points.
- **O2.4 Pullback regularity.** The one-sided bound `SatisfiesPullbackBound R f L`:
  `f(R_x(v)) ≤ f(x) + ⟪grad f(x), v⟫ + (L/2)‖v‖²` on `domain`; and the two-sided bound at a single
  step, `PullbackBoundAt R f L x s`. On a compact manifold, a global retraction and a `C²` cost
  satisfy the one-sided bound for some `L > 0` (`exists_satisfiesPullbackBound`). For `M = V` and
  `R_x(v) = x + v` the bound follows from `L`-Lipschitz continuity of `∇f`.
- **O2.5 Vector transports.** A vector transport associated with `R` sends `(x, v, u)`, with
  `(x, v) ∈ domain` and `u ∈ T_xM`, to `T_v u ∈ T_{R_x(v)}M`, linearly in `u`, smoothly in the
  tangent-bundle trivializations, with `T_{0_x} = id`. Constructions: the differentiated retraction
  `T_v u = d/dt R_x(v + t u)|_{t=0}`; on embedded `M` the projection transport
  `ι'(T_v u) = Proj_{R_x(v)}(ι'u)`; and parallel transport along `t ↦ exp_x(t v)` (HopfRinow's
  along-curve derivative), which is isometric. Prove the projection transport on the sphere is not
  isometric for `v ≠ 0`.

### O3. Optimality conditions

*[B23, Ch. 4, 6, 7, 9].*

- **O3.1 First order.** A local minimizer at which `f` is differentiable has zero gradient
  (`mgradient_eq_zero_of_isLocalMin`), consuming MorseTheory M4's manifold Fermat theorem.
- **O3.2 Second-order necessary.** A local minimizer of a `C²` cost has `Hess f(x) ⪰ 0`
  (`hessian_nonneg_of_isLocalMin`), from O1.4 along any second-order retraction curve.
- **O3.3 Second-order sufficient.** `grad f(x) = 0` and `Hess f(x) ≻ 0` give a strict local
  minimizer (`eventually_lt_of_hessian_pos`) with quadratic growth `f(y) − f(x) ≥ c d(x, y)²` near
  `x`, consuming MorseTheory M1's strict minimality of nondegenerate minima.
- **O3.4 KKT reconciliation.** On a level set of `h` with surjective derivative, `grad f(x) = 0`
  iff there is a (unique) `λ` with `∇f̄(ι x) = ∇(λ ∘ h)(ι x)`, and then
  `Hess f(x)[u, u] = ∇²(f̄ − λ ∘ h)(ι x)[ι'u, ι'u]`, the Hessian of the Lagrangian on the tangent
  space. Compare the first statement with Mathlib's
  `IsLocalExtrOn.exists_multipliers_of_hasStrictFDerivAt`.
- **O3.5 Second-order critical points and quotients.** Define second-order critical points
  (`grad f(x) = 0`, `Hess f(x) ⪰ 0`). On a quotient, `f` is critical (second-order critical) at
  `π x̄` iff `f ∘ π` is at `x̄`.

### O4. Global convergence and complexity

*[B23, Ch. 4, 6]; [BAC19]; [AMS08, Ch. 4, 7]; [ABG07]; [Ste83].*

- **O4.1 Fixed step** (`rgdStep`, `rgdSeq`). Under `SatisfiesPullbackBound R f L` with `L > 0` and
  step `1/L`: `f(x_{k+1}) ≤ f(x_k) − ‖grad f(x_k)‖²/(2L)`; for `f ≥ f_low`,
  `Σ_{k<K} ‖grad f(x_k)‖² ≤ 2L(f(x₀) − f_low)` (`rgd_sum_sq_norm_mgradient_le`), hence
  `min_{k<K} ‖grad f(x_k)‖ ≤ √(2L(f(x₀) − f_low)/K)` (`rgd_exists_norm_mgradient_le`) and
  `‖grad f(x_k)‖ → 0` (`tendsto_norm_mgradient_rgdSeq`). For a `C¹` cost every cluster point of the
  sequence is critical.
- **O4.2 Armijo backtracking** (`armijoExponent`, `armijoStepSize`, `armijoStep`, `armijoSeq`).
  Under the pullback bound, every exponent `i` with `ᾱτ^i ≤ 2(1 − r)/L` qualifies, so the step size
  is at least `min(ᾱ, 2τ(1 − r)/L)` and
  `f(x) − f(x⁺) ≥ r min(ᾱ, 2τ(1 − r)/L) ‖grad f(x)‖²` (`armijo_decrease`). The consequences of O4.1
  follow with this constant (`tendsto_norm_mgradient_armijoSeq`,
  `mgradient_eq_zero_of_mapClusterPt`). On a compact manifold with a global retraction and a `C²`
  cost, O2.4 supplies the bound.
- **O4.3 Trust regions** (`trModel`, `trRatio`, `trUpdate`, `trSeq`). The model is
  `m_x(s) = f(x) + ⟪grad f(x), s⟫ + ½⟪H_x s, s⟫` with self-adjoint `H_x`.
  - *Cauchy point:* the minimizer of `m_x` along `−grad f(x)` within radius `Δ`, with
    `m_x(0) − m_x(s^C) ≥ ½‖g‖ min(Δ, ‖g‖/‖H_x‖)` (the minimum is `Δ` when `H_x = 0`).
  - *Truncated conjugate gradients* with parameters `θ > 0` and `κ ∈ (0, 1)`, pinned as follows.
    If `g = 0` return `0`. Otherwise set `η₀ = 0`, `r₀ = g`, `δ₀ = −r₀`, and for `j ≥ 0`: if
    `⟪δ_j, H δ_j⟫ ≤ 0`, return `η_j + τ δ_j` with `τ ≥ 0` and `‖η_j + τ δ_j‖ = Δ`; set
    `α_j = ‖r_j‖²/⟪δ_j, H δ_j⟫`; if `‖η_j + α_j δ_j‖ ≥ Δ`, return the boundary point `η_j + τ δ_j`
    with `τ ≥ 0`; set `η_{j+1} = η_j + α_j δ_j` and `r_{j+1} = r_j + α_j H δ_j`; if
    `‖r_{j+1}‖ ≤ ‖r₀‖ min(‖r₀‖^θ, κ)`, return `η_{j+1}`; set
    `δ_{j+1} = −r_{j+1} + (‖r_{j+1}‖²/‖r_j‖²) δ_j`. Prove termination within `dim T_xM`
    iterations, `‖output‖ ≤ Δ`, monotone decrease of the model and increase of `‖η_j‖` along the
    iterates [Ste83], that the first iterate is the Cauchy point, and hence Cauchy decrease with
    constant `½` for any `β ≥ ‖H_x‖`.
  - *Complexity* (`trSeq_exists_norm_mgradient_le`): with `f ≥ f_low`, `‖H_x‖ ≤ β`, self-adjoint
    `H_x`, steps inside the radius, Cauchy decrease
    `m_x(0) − m_x(s) ≥ c₁‖g‖ min(Δ, ‖g‖/β)` with `c₁ ∈ (0, 1]`, and the two-sided pullback bound with
    constant `L` at each iterate's trial step, there is `C`, explicit in
    `f(x₀) − f_low, L, β, c₁, ρ', Δ₀`, such that for every `ε ∈ (0, 1]` some `k ≤ ⌈C/ε²⌉` has
    `‖grad f(x_k)‖ ≤ ε`. The proof runs through the radius lemma: while `‖grad f(x_k)‖ > ε`,
    `Δ_k ≥ min(Δ₀, c₁ε/(8(L + β)))`. Corollary: `liminf ‖grad f(x_k)‖ = 0`.

### O5. Local convergence

*[AMS08, Ch. 4, 6, 7]; [ABG07].*

- **O5.1 Gradient descent near a nondegenerate local minimizer.** For a smooth cost, a smooth
  retraction and Armijo constants, there are a neighbourhood `U` of `x*` and a linear rate such
  that every Armijo sequence from `U` converges to `x*` (`armijo_local_linear`). The proof captures
  the iterates in a sublevel component and uses MorseTheory M6's local estimate together with O3.3.
- **O5.2 Newton's method** (`newtonStep`, `newtonSeq`, `newton_local_quadratic`). Near any
  nondegenerate critical point, of any index, and for any retraction, the Newton sequence converges
  quadratically.
- **O5.3 Trust regions with truncated CG**, with `H_x = hessianOp I f x`. (a) Near a nondegenerate
  local minimizer `x*` there is a neighbourhood from which the iterates converge to `x*`. (b) If the
  iterates converge to a nondegenerate local minimizer, all but finitely many steps are accepted,
  the radius constraint is eventually inactive, and the convergence has order `min(1 + θ, 2)`.

### O6. Geodesic convexity

*[B23, Ch. 11].*

- **O6.1 Characterization.** `IsGeodesicallyConvexWith κ f` is OptimalTransport Layer 9's
  predicate with `λ` renamed `κ`, along every metric geodesic segment (`TauCeti.IsGeodesicSegment`).
  For smooth `f` it holds iff `Hess f ⪰ κ g` everywhere (`isGeodesicallyConvexWith_iff`), using
  HopfRinow's identification of metric geodesic segments with smooth minimizing geodesics and the
  minimality of short radial geodesics. State the same characterization on open geodesically convex
  subsets (every two points joined by a metric geodesic segment inside the subset).
- **O6.2 Consequences**, on a complete connected manifold. For `κ ≥ 0`, every critical point and
  every local minimizer is a global minimizer. For `κ > 0`, a minimizer `x*` exists and is unique,
  `f(y) − f(x*) ≥ (κ/2) d(y, x*)²`, and the Polyak–Łojasiewicz inequality
  `f(x) − f(x*) ≤ ‖grad f(x)‖²/(2κ)` holds.
- **O6.3 Rates.** Under the pullback bound with `L`, gradient descent with step `1/L` satisfies
  `f(x_k) − f(x*) ≤ (1 − κ/L)^k (f(x₀) − f(x*))` (`rgd_linear_of_isGeodesicallyConvexWith`); in
  positive dimension the hypotheses force `κ ≤ L`.
- **O6.4 Compactness.** A continuous `0`-geodesically convex function on a compact connected
  manifold is constant (`const_of_isGeodesicallyConvexWith`).
- **O6.5 Continuous time.** The negative-gradient flow of a smooth `κ`-geodesically convex cost on a
  complete connected manifold is an `EVI_κ` solution in OptimalTransport Layer 10's sense.
- **O6.6 Positive-definite matrices.** `log det` is geodesically affine, `tr` is geodesically
  convex, and `tr X − log det X` has the unique minimizer `I`; prove each from the explicit
  geodesics of O0.3.

## Worked examples (acceptance criteria)

Discharge these alongside the layers; they catch vacuous statements and sign errors.

- **Manopt's first example.** For self-adjoint `A` on `V` and `f(x) = −⟪A x, x⟫` on the unit sphere
  (`rayleighCost`): `ι'(grad f(x)) = −2(Ax − ⟪Ax, x⟫x)` (`mvfderiv_mgradient_rayleighCost`); `x` is
  critical iff it is an eigenvector with eigenvalue `⟪Ax, x⟫` (`mgradient_rayleighCost_eq_zero_iff`);
  `Hess f(x)[u] = −2(Proj_x(Au) − ⟪Ax, x⟫u)`; every second-order critical point is a global
  minimizer (`isMinOn_rayleighCost_of_hessian_nonneg`); the minimum value is `−λ_max`, reconciled
  with Mathlib's `hasEigenvalue_iSup_of_finiteDimensional` and `hasEigenvector_of_isMaxOn`. When
  `λ_max` is simple, its two unit eigenvectors are nondegenerate minimizers, so O5.2 applies.
- **Product of spheres** (Manopt's manifolds page). For `f(x, y) = ⟪x, Ay⟫` on
  `S^{m−1} × S^{n−1}`: `(x, y)` is critical iff `Ay = σx` and `Aᵀx = σy` with `σ = ⟪x, Ay⟫`, and the
  minimum value is `−σ_max(A)`.
- **Brockett's cost on the Stiefel manifold** [Bro91]. For symmetric `A` and
  `N = diag(μ₁, …, μ_p)`, `f(X) = tr(XᵀAXN)`: if the `μ_i` are distinct and nonzero, `X` is critical
  iff `AX = XΛ` with `Λ` diagonal; if `μ₁ ≥ … ≥ μ_p ≥ 0`, the minimum value is `Σ μ_i λ_i^↑` with the
  eigenvalues in increasing order, consuming Majorization's Ky Fan theory.
- **Principal subspace on the Grassmannian.** `f([X]) = −tr(XᵀAX)` is well defined; `[X]` is
  critical iff `span X` is `A`-invariant; the minimum value is `−(λ₁ + … + λ_p)` with the eigenvalues
  in decreasing order; and if `λ_p > λ_{p+1}`, every second-order critical point is the dominant
  `p`-dimensional invariant subspace.
- **Retractions.** For `X = [e₁ e₂] ∈ St(3, 2)` and `U = [e₃ e₃]` (tangent, since `XᵀU = 0`), the
  Q-factor curve has ambient acceleration `−2X [[1/2, 1], [0, 1/2]]` at `0`, which is not of the form
  `XΣ` with `Σ` symmetric, so the Q-factor retraction is not second order; the polar curve has
  acceleration `−X UᵀU`, which is normal.
- **One-dimensional checks.** On `ℝ` with `R_x(v) = x + v`: `f(x) = a x²/2` (`a > 0`) satisfies the
  pullback bound with `L = a` and equality, gradient descent with step `1/a` and Newton's method both
  reach `0` in one step; `f(x) = x⁴` satisfies the pullback bound for no `L`.
- **Convexity.** `P(n)` is complete, `log det` is geodesically affine and `tr` geodesically convex
  on it; on the sphere every continuous geodesically convex function is constant.

## Statements that must not enter the library

Each is a tempting mistake with its refutation.

- **"A retraction is defined on the whole tangent bundle."** On the hyperbola `{(a, b) : ab = 1}`,
  take `x = (2, 1/2)` and `v = (−10/3, 5/6)`, tangent since `⟪v, (1/2, 2)⟫ = 0`. Then
  `x + v = (−4/3, 4/3)` lies on the line `b = −a`, which the isometry `(a, b) ↦ (−b, −a)` fixes while
  exchanging the two branches, so `x + v` has no unique nearest point and the metric-projection
  retraction is undefined there. Domains are part of the definition (O2.1).
- **"A second-order retraction moves along geodesics."** Only the acceleration at `t = 0` vanishes:
  the sphere's `t ↦ (x + t v)/‖x + t v‖` runs along a great circle at angular speed
  `‖v‖/(1 + t²‖v‖²)`.
- **"The Q-factor retraction on the Stiefel manifold is second order."** False for `p ≥ 2`; see the
  worked examples.
- **"The Riemannian Hessian of a restricted cost is the projected Euclidean Hessian."** For
  `f̄(y) = ⟪a, y⟫` on the sphere the Euclidean Hessian is zero while `Hess f(x) = −⟪a, x⟫ id`; the
  Weingarten term of O1.3 is load-bearing.
- **"Second-order critical points are local minimizers"**: `x³` at `0` on `ℝ`. **"A strict local
  minimizer is nondegenerate"**: `x⁴` at `0`. Benign-landscape statements are proved example by
  example.
- **"The pullback bound holds for every smooth cost."** `x⁴` on `ℝ` with `R_x(v) = x + v` violates it
  for every `L`.
- **"Newton's method is attracted only to minimizers."** For `f(x) = −x²` on `ℝ`, one Newton step from
  any point lands on the maximizer `0`.
- **"The trust-region bound counts every iteration with a large gradient."** It bounds the index of
  the first `ε`-critical iterate. Iterations with large gradient that follow a small-gradient phase
  are not controlled by the same argument, and no count of them is asserted.
- **"The lifted cost on a quotient's total space is Morse."** At a critical point the vertical space
  lies in the kernel of `Hess(f ∘ π)`; Newton's local theory is applied on the quotient.
- **"Geodesic convexity is useful on compact manifolds."** Continuous geodesically convex functions
  on compact connected manifolds are constant (O6.4).
- **"Geodesic convexity along metric segments is a Riemannian notion."** On a metric space with no
  nonconstant geodesic segments every function satisfies the predicate vacuously; O6.1 and O6.4
  carry their Riemannian hypotheses explicitly.

## Relation to sibling roadmaps

One owner per shared construction, stated identically on both sides.

- **DifferentialGeometry** owns metrics, `mgradient` and `hessian`; this roadmap adds only the
  operator form `hessianOp` of the same Hessian.
- **HopfRinow** owns the connection, geodesics, the exponential map and local logarithms, and the
  metric geodesic-space API; O2.2 consumes the exponential map as a retraction.
- **RiemannianGeometry** owns the second fundamental form, the shape operator and Riemannian
  submersions; O1.3 states the optimization formulas in their terms.
- **MorseTheory** owns critical Hessians, the manifold Fermat theorem, strict minimality of
  nondegenerate minima, and continuous gradient flows with their convergence; this roadmap owns
  discrete iterations and their rates.
- **OptimalTransport** owns metric geodesic convexity, metric gradient flows and `EVI`; O6 owns
  the Riemannian characterization and the consequences for discrete algorithms.
- **SmoothBundlesConnections** owns smooth quotients by free proper actions; **LieGroups** owns
  the Lie-group structure of matrix groups; **GeometricTopology** owns tubular neighbourhoods;
  O0.3 compares with each of them literally.
- **Majorization**, **PrincipalAngles** and **PolarDecomposition** own Ky Fan theory, principal
  angles and matrix functional calculus. **VariationalMethods** owns Rayleigh minimization on
  Hilbert spaces.

## Ordering

O0.1 and O1.1–O1.2 come first. O2.1 and the exponential part of O2.2 depend only on Tau Ceti and
proceed alongside them; O2.3 needs O1.4. O3 needs DifferentialGeometry 12 and MorseTheory M1 and
M4. O4.1–O4.2 need O2.1 and O2.4; O4.3 needs O2.1. O5 needs O2.3 and O3.3; O6 needs O4.1 and
HopfRinow's geodesic-space API. The catalogue items of O0.3 are independent of one another; the
Grassmannian also needs SmoothBundlesConnections B1.4 and RiemannianGeometry R1. Discharge the
worked examples alongside the layers they exercise. Claim single numbered items or smaller.

## References

- [B23] N. Boumal, *An Introduction to Optimization on Smooth Manifolds*, Cambridge University
  Press, 2023.
- [AMS08] P.-A. Absil, R. Mahony, R. Sepulchre, *Optimization Algorithms on Matrix Manifolds*,
  Princeton University Press, 2008.
- [BAC19] N. Boumal, P.-A. Absil, C. Cartis, Global rates of convergence for nonconvex optimization
  on manifolds, *IMA J. Numer. Anal.* 39(1) (2019), 1–33.
- [ABG07] P.-A. Absil, C. G. Baker, K. A. Gallivan, Trust-region methods on Riemannian manifolds,
  *Found. Comput. Math.* 7 (2007), 303–330.
- [AM12] P.-A. Absil, J. Malick, Projection-like retractions on matrix manifolds, *SIAM J. Optim.*
  22(1) (2012), 135–158.
- [EAS98] A. Edelman, T. A. Arias, S. T. Smith, The geometry of algorithms with orthogonality
  constraints, *SIAM J. Matrix Anal. Appl.* 20(2) (1998), 303–353.
- [Ste83] T. Steihaug, The conjugate gradient method and trust regions in large scale optimization,
  *SIAM J. Numer. Anal.* 20(3) (1983), 626–637.
- [Bro91] R. W. Brockett, Dynamical systems that sort lists, diagonalize matrices, and solve linear
  programming problems, *Linear Algebra Appl.* 146 (1991), 79–91.
- [BMAS14] N. Boumal, B. Mishra, P.-A. Absil, R. Sepulchre, Manopt, a Matlab toolbox for
  optimization on manifolds, *J. Mach. Learn. Res.* 15 (2014), 1455–1459. Documentation:
  [manifolds](https://www.manopt.org/manifolds.html),
  [a first example](https://www.manopt.org/firstexample.html).
- [LWHWXW24] C. Li, Z. Wang, W. He, Y. Wu, S. Xu, Z. Wen, Formalization of complexity analysis of
  the first-order algorithms for convex optimization, arXiv:2403.11437.