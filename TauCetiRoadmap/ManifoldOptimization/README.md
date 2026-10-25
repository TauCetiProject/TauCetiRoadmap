# Roadmap: Riemannian optimization — retractions, matrix manifolds, and convergence of manifold algorithms

Optimization on manifolds minimizes a smooth cost `f : M → ℝ` over a Riemannian manifold `M`,
usually a manifold of matrices sitting inside a Euclidean space, by computing in tangent spaces
and returning to `M` through a *retraction*. This roadmap asks for that theory, following
[B23] = N. Boumal, *An Introduction to Optimization on Smooth Manifolds*, Cambridge University
Press, 2023, with [AMS08] = P.-A. Absil, R. Mahony, R. Sepulchre, *Optimization Algorithms on
Matrix Manifolds*, Princeton University Press, 2008, for Newton's method and trust regions. The
Manopt toolbox [BMAS14] is the numerical implementation.

The geometry these algorithms run on is owned by other roadmaps and consumed here: the metric,
gradient and Hessian (DifferentialGeometry Layer 12), the Levi-Civita connection, geodesics and
the exponential map (HopfRinow), second fundamental forms and Riemannian submersions
(RiemannianGeometry R1 and R5a), parallel transport and strongly geodesically convex
neighbourhoods (SmoothBundlesConnections B5 and B6.0), critical-point theory and continuous
gradient flows (MorseTheory), metric geodesic convexity and the Sinkhorn–Knopp theorem
(OptimalTransport Layers 9 and 13A), and the smooth real Grassmannian (GeneralizedCohomology
G4.0b).

This roadmap owns:

1. the standard matrix manifolds as concrete Riemannian manifolds: the embedded carriers, `P(n)`
   and the Fisher carriers (the open simplex and the multinomial and doubly stochastic manifolds),
   which it builds, and the Riemannian structure of the Grassmannian, which it puts on
   GeneralizedCohomology's carrier (O0);
2. the extrinsic calculus that computes Riemannian gradients and Hessians from Euclidean ones, on
   embedded submanifolds and on quotients (O1);
3. retractions, their order, Taylor expansions along them, and vector transports (O2);
4. optimality conditions in the form the algorithms use (O3);
5. Riemannian gradient descent, Newton's method and the trust-region method, with global
   complexity bounds (O4) and local rates (O5);
6. the Riemannian characterization of geodesic convexity and its algorithmic consequences (O6).

The headline theorems : 
- `O(1/ε²)` iteration bounds for gradient descent and trust regions
[BAC19]
- local quadratic convergence of Riemannian Newton [AMS08, Ch. 6]
- local superlinear convergence of trust regions with truncated conjugate gradients [AMS08, Ch. 7; ABG07]
- the benign landscape of the Rayleigh quotient on the sphere
- linear convergence of gradient descent for geodesically strongly convex costs. 

Suggested module structure : `TauCeti/Geometry/Manifold/Optimization/` for retractions, calculus and
algorithms, and
`TauCeti/Geometry/Manifold/Instances/{Stiefel,Grassmannian,FixedRank,PosDef,Multinomial}.lean`
for carriers.

## Scope

Manifolds are finite-dimensional, real, Hausdorff and boundaryless; algorithms are deterministic
and run in exact arithmetic. The catalogue is exactly the manifolds of O0.3. 


## Out of scope

Conjugate-gradient and quasi-Newton methods together with the Wolfe-condition line searches they
need; stochastic, nonsmooth, derivative-free and inequality-constrained methods on manifolds;
floating-point error analysis; automatic differentiation; the toolbox's software devices
(finite-difference gradient checks, caching, hashing, vectorization of tangent vectors); the
other Manopt geometries (complex and generalized variants, elliptope, spectrahedron, hyperbolic
and Poincaré models, the essential manifold, tensor formats); and the symmetric and definite
multinomial manifolds of [DH19].

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
- **Distances on the catalogue.** An embedded catalogue manifold is a subtype of its ambient space
  and inherits the ambient metric (chordal on the sphere, Frobenius on matrices), for which
  `IsRiemannianManifold` fails; on the sphere it has no nonconstant geodesic segments at all.
  Distance-level statements about a catalogue manifold `X` (completeness, distance formulas,
  geodesic segments, convexity, rates) are made for `TauCeti.MetricSpace.ofRiemannianMetric I X`,
  whose topology is definitionally the manifold topology: installed locally (`letI`) on every
  carrier except `P(n)` and the Fisher carriers, as Tau Ceti's `HyperbolicMetric` does, and as the
  `MetricSpace` instance of those types. The inherited metric is never used for them.
- **Gradient and Hessian.** The gradient is DifferentialGeometry 12.2's `mgradient I f x`; the
  Hessian bilinear form is 12.3's `hessian I f x v w = ⟪∇_v grad f, w⟫`. The Hessian operator
  `hessianOp I f x : TangentSpace I x →L[ℝ] TangentSpace I x` is `∇(grad f)` at `x` for Mathlib's
  `CovariantDerivative.leviCivitaConnection`, so `hessian I f x v w = ⟪hessianOp I f x v, w⟫`
  (`inner_hessianOp`). It
  is the operator form of the same Hessian, not a second one. MorseTheory M1 identifies `hessian`
  at a critical point with the critical Hessian, and O3.6 identifies Tau Ceti's
  `IsManifoldNondegenerateCriticalPoint` with invertibility of `hessianOp` there.
- **Minimization.** Every algorithm minimizes. A maximization problem is stated by negating the
  cost; Manopt's first example is the cost `x ↦ -⟪A x, x⟫` on the sphere.
- **Euclidean data.** `V` and `F` are finite-dimensional real inner-product spaces. The Euclidean
  gradient is Mathlib's `gradient`, the Euclidean Hessian operator is `fderiv ℝ (gradient f̄)`,
  and orthogonal projection onto a submodule `K` is `K.starProjection : V →L[ℝ] V`.
- **Matrices.** The ambient space of `n × p` real matrices is `EuclideanSpace ℝ (Fin n × Fin p)`,
  whose inner product is the Frobenius product `⟪A, B⟫ = tr(AᵀB)`. Products, transposes and traces
  are read through the linear equivalence
  `toMatrix : EuclideanSpace ℝ (Fin n × Fin p) ≃ₗ[ℝ] Matrix (Fin n) (Fin p) ℝ`,
  `toMatrix A i j = A (i, j)` (`toMatrix_apply`); do not install a global inner-product instance
  on `Matrix`. A structure on a subset of `Matrix` (`Matrix.orthogonalGroup`, say) is compared with
  a carrier here through the bijection that `toMatrix` restricts to, never through the identity,
  since the two live in different types. `Sym(p)` and `Skew(p)` are the symmetric and
  skew-symmetric subspaces with the restricted inner product, and `sym(A) = (A + Aᵀ)/2`.
- **Spectral data.** The singular values `σᵢ(A)` are Mathlib's `LinearMap.singularValues` of
  `Matrix.toEuclideanLin (toMatrix A)`: zero-indexed and nonincreasing, so `σ₀(A)` is the
  operator norm (`‖A‖` is the Frobenius norm), which is also OperatorIdeals' convention. Square
  roots, exponentials and logarithms of symmetric matrices are Mathlib's continuous functional
  calculus `cfc`, from `Matrix.IsHermitian.instContinuousFunctionalCalculus`:
  `X^{1/2} = cfc Real.sqrt X`, `X^{−1/2} = cfc (fun t ↦ (√t)⁻¹) X`, `expm S = cfc Real.exp S` and
  `logm X = cfc Real.log X`. The Q-factor `qf(Z)` of a matrix `Z` of full column rank has the
  columns `InnerProductSpace.gramSchmidtNormed` makes from the columns of `Z`: the orthonormal
  factor of the QR decomposition with positive diagonal.
- **Entrywise operations.** On matrices, read through `toMatrix`, `⊙` is Mathlib's Hadamard
  product `Matrix.hadamard`, `⊘` is the entrywise quotient, and `exp`, `log` and `√` act entry by
  entry (`Matrix.map`); they are not `expm`, `logm` or `X^{1/2}`. On vectors the same operations
  act coordinatewise. `𝟏` is the all-ones vector and `diag(c)` is `Matrix.diagonal c`.
- **Fisher carriers.** The open simplex `Δ°(n)`, the multinomial manifold `Mult(n, m)` and the
  doubly stochastic manifold `DS(n)` of O0.3 carry the Fisher metric
  `⟪ξ, η⟫_X = Σ ξ_ij η_ij / X_ij` (`Σ ξ_i η_i / x_i` on vectors), not the Euclidean one. It is
  pinned as
  `TauCeti.inducedRiemannianMetric` of `fisherEmbedding ∘ ι`, for `ι` the inclusion and
  `fisherEmbedding` the entrywise map `t ↦ 2√t`. That map is smooth on the positive orthant
  (`contDiffOn_fisherEmbedding`) with derivative `u ↦ u ⊘ √x` (`fderiv_fisherEmbedding_apply`), and
  the displayed formula is `inner_fderiv_fisherEmbedding`. Each Fisher carrier is a type synonym of
  its O0.1 subtype, carrying the subtype's charted structure, this metric as its `RiemannianBundle`
  instance and its Riemannian distance as its `MetricSpace` instance, as for `P(n)`. So
  `IsInducedBy I (fisherEmbedding ∘ ι)` holds and O1 applies to `fisherEmbedding ∘ ι` in place of
  `ι`. `Π_X` is the Fisher-orthogonal projection onto the tangent space at `X`.
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
  `Manifold.IsImmersion`, `Manifold.IsSubmersion`, `Manifold.IsSmoothEmbedding`,
  `IsLocalDiffeomorphAt`, and the instances lowering `IsManifold I ∞ M` and
  `IsContMDiffRiemannianBundle I ∞ E _` to every finite order; `ModelWithCorners.pi` and the
  charted space `ModelPi` of finite powers, with no `IsManifold` instance for them.
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
  `Matrix.PosDef`, `doublyStochastic` (`Analysis/Convex/DoublyStochasticMatrix.lean`), the
  standard simplex `Convexity.StdSimplex` (`Geometry/Convex/ConvexSpace/Defs.lean`), the Hadamard
  product `Matrix.hadamard`, and `Module.End.HasEigenvector`.
- **Spectral data:** `LinearMap.singularValues` (`Analysis/InnerProductSpace/SingularValues.lean`),
  `Matrix.toEuclideanLin`, the functional calculus of Hermitian matrices
  `Matrix.IsHermitian.instContinuousFunctionalCalculus`
  (`Analysis/Matrix/HermitianFunctionalCalculus.lean`), and `InnerProductSpace.gramSchmidtNormed`
  (`Analysis/InnerProductSpace/GramSchmidtOrtho.lean`).

## What Tau Ceti already has (consume)

- **The exponential map** (HopfRinow): `TauCeti.Manifold.riemannianExp` and `expDomain`, with
  `isOpen_setOfPred_mem_expDomain`, `zero_mem_expDomain`, `contMDiffOn_riemannianExp_tangentBundle`,
  `riemannianExp_zero`, `curveVelocity_riemannianExp_smul`, `mfderiv_riemannianExp_apply_zero` and
  `isLocalDiffeomorphAt_riemannianExp_zero`
  (`Geometry/Manifold/Riemannian/Geodesic/Exponential.lean`); `riemannianLog`
  (`…/Geodesic/Normal.lean`); `TauCeti.Manifold.IsGeodesicCurveOn` (`…/Geodesic/Basic.lean`).
  Together these make the exponential map a retraction with no new analysis: `Suggested.lean`
  discharges `expRetraction` from them (O2.2).
- **Curves:** `CovariantDerivative.alongCurveWithin`
  (`Geometry/Manifold/VectorBundle/CovariantDerivative/AlongCurve/Basic.lean`), the covariant
  acceleration `CovariantDerivative.acceleration` (`…/AlongCurve/Acceleration.lean`), and
  `TauCeti.Manifold.curveVelocity` (`Geometry/Manifold/MFDeriv/Curve.lean`).
- **Metrics:** `TauCeti.inducedRiemannianMetric` with `inducedRiemannianMetric_inner`, the metric
  induced by an immersion into an inner-product space (`Geometry/Manifold/Riemannian/Induced.lean`);
  the round metric `TauCeti.sphereRoundMetric` with its `RiemannianBundle` and analytic
  `IsContMDiffRiemannianBundle` instances (`…/Riemannian/Sphere.lean`); product metrics
  (`…/Riemannian/Prod.lean`); the Riemannian distance `TauCeti.MetricSpace.ofRiemannianMetric` of a
  preconnected manifold, whose topology is definitionally the manifold topology, with its
  `IsRiemannianManifold` instance (`…/Riemannian/Distance.lean`), installed as in
  `TauCeti.HyperbolicMetric` (`…/Riemannian/Hyperbolic.lean`); and
  `completeSpace_of_isPretransitive_isom`, completeness of homogeneous Riemannian manifolds
  (`…/Riemannian/Homogeneous.lean`).
- **Riesz duality:** `Riemannian.Tensor.rieszDual`, through which DifferentialGeometry defines
  `mgradient`.
- **Regular zero sets:** `exists_isManifold_sectionZero_of_contMDiff`, `sectionZeroChartedSpace`
  and `isManifold_sectionZero` (`Geometry/Manifold/VectorBundle/Section/`), the construction
  MorseTheory M2 specializes to scalar levels and O0.1 specializes to vector-valued constraints.
- **The manifold inverse function theorem:** `TauCeti.isLocalDiffeomorphAt_of_mfderiv_eq`
  (`Geometry/Manifold/LocalDiffeomorph.lean`).
- **Flows:** `maximalIntegralCurve` on `maximalIntegralCurveInterval`, with the escape lemma
  `eventually_notMem_nhdsLT_maximalIntegralCurve` (`Geometry/Manifold/IntegralCurve/Maximal.lean`).
- **Morse:** `TauCeti.IsManifoldNondegenerateCriticalPoint` and `IsMorse`
  (`Geometry/Manifold/Morse/Basic.lean`), and the vector-space library `Analysis/Calculus/Morse/`.
- **Metric geodesics:** `TauCeti.IsGeodesicSegment` and `IsGeodesicSpace`
  (`Topology/MetricSpace/Length.lean`).

## Suppliers in other roadmaps (consume)

- [DifferentialGeometry](../DifferentialGeometry/README.md) Layer 12: `mgradient`, `hessian`,
  metric existence, and metrics on open subsets.
- [HopfRinow](../HopfRinow/README.md): the Levi-Civita connection and its regularity, along-curve
  differentiation, exponential maps and local logarithms, the Gauss lemma, minimizing geodesics and
  the uniqueness of minimizers in normal balls, the first variation of energy, Hopf–Rinow, and the
  metric length- and geodesic-space API.
- [RiemannianGeometry](../RiemannianGeometry/README.md): R5a's second fundamental form `B` and shape
  operator `S_η` with their pinned signs, and R1's Riemannian submersions with their horizontal and
  vertical projections and horizontal lifts.
- [MorseTheory](../MorseTheory/README.md): M1's critical Hessian, its identification with
  `hessian`, isolation and strict minimality of nondegenerate minima; M2's regular levels of scalar
  functions; M4's manifold Fermat theorem; M6's local estimate `|f − f(p)| ≤ C‖grad f‖²` near a
  nondegenerate critical point and its continuous gradient-flow convergence.
- [OptimalTransport](../OptimalTransport/README.md) Layer 9: the `λ`-geodesic-convexity predicate
  `Φ(γ_t) ≤ (1−t)Φ(γ₀) + tΦ(γ₁) − (λ/2)t(1−t)d(γ₀,γ₁)²`; Layer 10: metric gradient flows and
  `EVI_λ`; Layer 13A: cost-regularized transport and its unique minimizer, and item 8's
  Sinkhorn–Knopp theorem, by which a matrix `A` with positive entries has a doubly stochastic
  scaling `D₁AD₂`, with `D₁, D₂` positive diagonal, and the scaled matrix is unique [Sin64].
- [SmoothBundlesConnections](https://github.com/TauCetiProject/TauCetiRoadmap/blob/791dd408dc48930060b28043245bbb1a8d82b5de/TauCetiRoadmap/SmoothBundlesConnections/README.md)
  B5: parallel transport along piecewise `C¹` curves, for the Levi-Civita connection through B3's
  frame-bundle description; B6.0: uniform normal and strong-convexity radii on compact sets, and
  strongly geodesically convex neighbourhoods, in which any two points are joined by a unique
  minimizing geodesic.
- [LieGroups](../RepresentationTheory/LieGroups/README.md) Layer 2: the closed-subgroup theorem,
  which makes `Matrix.orthogonalGroup` and `Matrix.specialOrthogonalGroup` Lie groups.
- [GeneralizedCohomology](../GeneralizedCohomology/README.md#g4-generalized-lerayhirsch-thom-and-euler-theory)
  G4.0b: the smooth graph-chart structure on the real Grassmannian `finiteGrassmannian ℝ p n` of
  `p`-dimensional subspaces of `Fin n → ℝ` (TopologicalKTheory T1.5's carrier), of dimension
  `p(n − p)`.
- [DGFloer](../DGFloer/README.md#layer-1-topological-prerequisites) Layer 1 item 7: the Stiefel
  manifolds of orthonormal 2-frames.
- [LieGroupoidsPoisson](../LieGroupoidsPoisson/README.md) G0.1: regular fibres of submersions as
  manifolds.
- [Majorization](../OperatorTheory/Majorization/README.md) Part A (Ky Fan variational theory),
  [PrincipalAngles](../OperatorTheory/PrincipalAngles/README.md) (principal angles from singular
  values) and [PolarDecomposition](../OperatorTheory/PolarDecomposition/README.md) (polar factors).
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

---

## The build, in layers

Names in backticks are the declarations of `Suggested.lean`, which carries the exact hypotheses.

### O0. Riemannian submanifolds and the matrix-manifold catalogue

*[B23, Ch. 3, 7, 9]; [AMS08, Ch. 3]; [EAS98]; [DH19].*

- **O0.1 Locally defined submanifolds.** A subset `S ⊆ V` is *locally defined of dimension `n`*
  when every point of `S` has an open neighbourhood `U` and a smooth `h_U : U → F_U` with
  `dim V − dim F_U = n`, whose zero set is `S ∩ U` and whose derivative is surjective on `S ∩ U`.
  Construct the named charted structure over `EuclideanSpace ℝ (Fin n)` on the subtype from Tau
  Ceti's section-zero theorem applied on each `U`; prove `IsManifold (𝓡 n) ∞`, that the inclusion
  is a `Manifold.IsSmoothEmbedding` whose tangent range at `x` is `ker (fderiv ℝ h_U x)`, and that
  two families of local defining functions give the same structure (the identity is a
  diffeomorphism). Global level sets are the special case `levelSetChartedSpace`,
  `isManifold_levelSet`, on `{x : V // h x = 0}`. This structure is the carrier of every embedded
  catalogue manifold. Where MorseTheory M2 (regular levels of a scalar `h`) or LieGroupoidsPoisson
  G0.1 (regular fibres of a submersion) builds a manifold structure on such a level set, prove that
  the evident identification with `{x : V // h x = 0}` is a diffeomorphism to
  `levelSetChartedSpace`; no other structure is used here. Equip the result with
  `TauCeti.inducedRiemannianMetric` of the inclusion, and the synonyms of the Fisher carriers with
  that of `fisherEmbedding ∘ ι` (Conventions); the predicate `IsInducedBy I ι` records the identity
  `⟪v, w⟫ = ⟪ι'v, ι'w⟫` that O1 consumes.
- **O0.2 Products, powers and quotient metrics.** Products with Tau Ceti's product metric; finite
  powers `Fin k → M` on Mathlib's charts for `ModelWithCorners.pi`, building here their `IsManifold`
  instance, the identification of the tangent space of the power with the product of tangent
  spaces, and the sum metric; and componentwise gradients, Hessians, retractions and exponential
  maps. *Quotient metrics:* let `π : M̄ → M` be a surjective `Manifold.IsSubmersion` and `G` a Lie
  group acting smoothly on `M̄` by isometries, preserving `π` and transitively on each fibre. Prove
  that there is a unique Riemannian metric on `M` making `π` a Riemannian submersion in
  RiemannianGeometry R1's sense, smooth because it is read through local smooth sections of `π`.
  Acceptance: the oblique manifold of O0.3 is identified with the `m`-th power of the sphere by a
  diffeomorphic isometry.
- **O0.3 The catalogue.** For each manifold: the carrier, its dimension, the tangent space as a
  subspace of the ambient space, the orthogonal projection onto it, and the comparison with any
  structure already present on the same set or built on it by another roadmap.
  - **Sphere** `{x ∈ V : ‖x‖ = 1}`, from `h(x) = ‖x‖² − 1`. The identity is a diffeomorphism from
    the O0.1 structure to Mathlib's stereographic structure and an isometry to Tau Ceti's round
    metric. Tangent space `(ℝ ∙ x)ᗮ`, projection `u ↦ u − ⟪x, u⟫x`.
  - **Oblique** `OB(n, m)`, the `n × m` matrices with unit columns: dimension `m(n − 1)`; the
    projection removes from each column its component along the corresponding column of `X`.
  - **Stiefel** `St(n, p) = {X : XᵀX = I_p}`, `p ≤ n`, from `h(X) = XᵀX − I_p ∈ Sym(p)`: dimension
    `np − p(p+1)/2`, tangent space `{U : XᵀU + UᵀX = 0}`, projection `Z ↦ Z − X sym(XᵀZ)`. For `p = 1`
    the carrier equals the unit sphere of `EuclideanSpace ℝ (Fin n × Fin 1)` as a set
    (`XᵀX = I₁` iff `‖X‖ = 1`), and `Equiv.setCongr` of that equality is a diffeomorphism and an
    isometry between the two O0.1 structures. `St(n, p)` is owned here for every `p`; for `p = 2`,
    `X ↦ (Xe₁, Xe₂)` is a diffeomorphism onto DGFloer Layer 1 item 7's Stiefel manifold of
    orthonormal 2-frames.
  - **Orthogonal groups.** `O(n) = St(n, n)` and `SO(n)`, its clopen subset with `det = 1`.
    `toMatrix` restricts to bijections from these onto `Matrix.orthogonalGroup (Fin n) ℝ` and
    `Matrix.specialOrthogonalGroup (Fin n) ℝ`, and the bijections are diffeomorphisms from the O0.1
    structures to LieGroups' closed-subgroup structures; the tangent space at `Q` is `Q · Skew(n)`.
  - **Grassmann** `Gr(n, p)` is GeneralizedCohomology G4.0b's smooth real Grassmannian
    `finiteGrassmannian ℝ p n`, of dimension `p(n − p)`; no second carrier is built. Prove that
    `π : St(n, p) → Gr(n, p)`, sending `X` to the span of its columns, is a smooth surjective
    submersion whose fibres are the orbits of the right action `X ↦ XQ` of `O(p)`, which acts by
    isometries, and give `Gr(n, p)` the quotient metric of O0.2 for `π`. The horizontal space at
    `X` is `{U : XᵀU = 0}`, with projection `Z ↦ (I − XXᵀ)Z`. Prove that `π X ↦ XXᵀ` is a smooth
    embedding onto the rank-`p` orthogonal projectors, and that the Riemannian distance between
    `π X` and `π Y` is `‖θ‖₂` for the principal angles `θ` between the two subspaces (the `cos θ_i`
    are the singular values of `XᵀY`), consuming PrincipalAngles.
  - **Fixed rank** `ℝ_r^{m×n} = {X : rank X = r}`, `1 ≤ r ≤ min(m, n)`: locally defined by Schur
    complements (near `X` with an invertible `r × r` minor, after permuting rows and columns,
    `[A B; C D] ↦ D − CA⁻¹B`), dimension `(m + n − r)r`, tangent space at `X = UΣVᵀ`, for any
    `U ∈ St(m, r)`, `V ∈ St(n, r)` and invertible `Σ`,
    `{UMVᵀ + U_pVᵀ + UV_pᵀ : M ∈ ℝ^{r×r}, U_pᵀU = 0, V_pᵀV = 0}`. The set is not closed in
    `ℝ^{m×n}`, and no completeness statement is made for it.
  - **Positive-definite matrices** `P(n)`: a type synonym of the open subset of `Sym(n)` where
    `toMatrix X` is `Matrix.PosDef`, of dimension `n(n+1)/2`, carrying Mathlib's open-subset charts,
    the affine-invariant metric `⟪U, W⟫_X = tr(X⁻¹UX⁻¹W)` (a smooth field of coercive bilinear
    forms) as its `RiemannianBundle` instance, and its Riemannian distance
    `TauCeti.MetricSpace.ofRiemannianMetric` as its `MetricSpace` instance. Being a synonym, it
    inherits neither the Frobenius metric of `Sym(n)` nor the flat metric of Tau Ceti's scoped
    open-subset instances. Prove that the congruences `X ↦ AXAᵀ` (`A` invertible) act transitively
    by isometries, hence completeness through `completeSpace_of_isPretransitive_isom`; that
    `exp_X(U) = X^{1/2} expm(X^{−1/2}UX^{−1/2}) X^{1/2}` is defined on all of `T_X P(n)`; that
    `d(X, Y) = ‖logm(X^{−1/2}YX^{−1/2})‖_F`; and that the geodesic midpoint is the matrix geometric
    mean `X # Y = X^{1/2}(X^{−1/2}YX^{−1/2})^{1/2}X^{1/2}`, in the functional calculus of the
    Spectral data convention.
  - **Open simplex** `Δ°(n) = {x ∈ EuclideanSpace ℝ (Fin n) : x_i > 0, Σ x_i = 1}`, `n ≥ 1`, a
    Fisher carrier: locally defined on the positive orthant by `h(x) = Σ x_i − 1`, of dimension
    `n − 1`, with tangent space `{ξ : Σ ξ_i = 0}` and `Π_x(z) = z − (Σ z_i) x`. Prove that
    `x ↦ √x` is a smooth embedding into the unit sphere of `EuclideanSpace ℝ (Fin n)`, onto its
    open subset of vectors with positive coordinates, that pulls the round metric back to a quarter
    of the Fisher metric; hence `d(x, y) = 2 arccos(Σ √(x_i y_i))`, since the minor great-circle
    arc between two vectors with positive coordinates has positive coordinates. The weights
    `i ↦ x_i` identify `Δ°(n)` with the elements of Mathlib's `Convexity.StdSimplex ℝ (Fin n)` whose
    weights are all positive.
  - **Multinomial** `Mult(n, m)`, Manopt's manifold of `n × m` matrices with positive entries whose
    columns sum to `1`, `n ≥ 1`, a Fisher carrier: locally defined on the positive orthant by
    `h(X) = Xᵀ𝟏 − 𝟏`, of dimension `m(n − 1)`, with tangent space `{ξ : ξᵀ𝟏 = 0}` and
    `Π_X(Z) = Z − X diag(Zᵀ𝟏)`, the projection of `Δ°(n)` in each column. Sending `X` to its
    family of columns is a diffeomorphism onto the `m`-th power of `Δ°(n)` (O0.2) and an isometry
    for the sum metric.
  - **Doubly stochastic** `DS(n)`, the `n × n` matrices with positive entries whose rows and columns
    sum to `1`, `n ≥ 1`, a Fisher carrier: locally defined on the positive orthant by
    `h(X) = (Xᵀ𝟏 − 𝟏, r(X))`, with `r(X)` the first `n − 1` entries of `X𝟏 − 𝟏` (the last row sum
    is then forced, since the entries of `X` sum to `n`), of dimension `(n − 1)²`, with tangent
    space `{ξ : ξ𝟏 = 0, ξᵀ𝟏 = 0}` and Fisher-normal space `{(α𝟏ᵀ + 𝟏βᵀ) ⊙ X : α, β ∈ ℝⁿ}`. Hence
    `Π_X(Z) = Z − (α𝟏ᵀ + 𝟏βᵀ) ⊙ X` for any `α, β` with `α + Xβ = Z𝟏` and `Xᵀα + β = Zᵀ𝟏`: such
    `α, β` exist, and the correction term does not depend on the choice [DH19]. `toMatrix`
    restricts to a bijection from `DS(n)` onto the elements of Mathlib's
    `doublyStochastic ℝ (Fin n)` with positive entries, and the inclusion of `DS(n)` into
    `Mult(n, n)` is a smooth embedding and an isometry onto its image, both metrics being induced
    by `fisherEmbedding`. For `n ≥ 2` none of the three Fisher carriers is complete: the segment
    from one of its points to a vertex of the simplex, to a matrix whose columns are such vertices,
    or to a permutation matrix, respectively, has finite Fisher length on `[0, 1)` and no limit in
    the carrier.

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
  Acceptance: on each Fisher carrier, for `f = f̄ ∘ ι` with `ι` the inclusion,
  `ι'(grad f(X)) = Π_X(X ⊙ ∇f̄(X))` [DH19], from the identity for `fisherEmbedding ∘ ι`; on `Δ°(n)`
  this is `x ⊙ (∇f̄(x) − ⟪x, ∇f̄(x)⟫𝟏)`.
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
  `(f ∘ γ)'' = Hess f(γ)[γ', γ'] + ⟪grad f(γ), D_t γ'⟫` (`deriv_deriv_comp_eq`), with `D_t γ'`
  Tau Ceti's `CovariantDerivative.acceleration` for the Levi-Civita connection, HopfRinow's
  along-curve derivative of the velocity. For embedded `M`, `ι'(D_t γ') = Proj(d²(ι ∘ γ)/dt²)`.

### O2. Retractions and vector transports

*[B23, Ch. 3, 5, 10]; [AMS08, Ch. 4, 8]; [AM12]; [DH19].*

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
  (`expRetraction_isSecondOrder`). *Metric projection:* for a locally defined submanifold
  `S ⊆ V`, let `𝒰 ⊆ V` be the union of the open sets on which every point has a unique nearest
  point in `S` and the nearest-point map `P_S` is smooth. Prove that `𝒰` contains `S`: near
  `x ∈ S`, `(p, λ) ↦ p + Dh_U(p)*λ` is a local diffeomorphism from `(S ∩ U) × F_U` onto a
  neighbourhood of `x` in `V` (manifold inverse function theorem), and its inverse followed by the
  first projection is `P_S` there [AM12]. The metric-projection retraction `R_x(v) = P_S(x + v)` is
  defined on the open set where `x + v ∈ 𝒰`, is smooth there, and is second order [AM12]. Required
  instances, those justified by a nearest-point property being identified with the metric
  projection on their domains:
  - sphere: `(x + v)/‖x + v‖`, global and second order, since every `y ≠ 0` has the unique nearest
    point `y/‖y‖`;
  - Stiefel, polar: `(X + U)(I + UᵀU)^{−1/2}`, global and second order, since the polar factor
    `Z(ZᵀZ)^{−1/2}` (PolarDecomposition) of a matrix `Z` of full column rank is its unique nearest
    point in `St(n, p)` [AM12];
  - Stiefel, Q-factor: `qf(X + U)`, global and first order, and not second order when `p ≥ 2`
    (witness in the worked examples);
  - Grassmann: `(π X, ξ) ↦ π(qf(X + ξ̄))`, with `ξ̄` the horizontal lift of `ξ` at `X`, well defined
    because a retraction `R̄` on the total space with `π(R̄_{XQ}(ξ̄Q)) = π(R̄_X(ξ̄))` for `Q ∈ O(p)`
    descends; state and prove that descent lemma in general;
  - fixed rank: `Z ↦ ΠZ` for `Z = X + U`, with `Π` the orthogonal projection onto the sum of the
    eigenspaces of `ZZᵀ` for its `r` largest eigenvalues (the rank-`r` truncation of the SVD of
    `Z`), defined where `σ_{r−1}(Z) > σ_r(Z)` and second order, since there `ΠZ` is the unique
    nearest rank-`r` matrix in the Frobenius norm (the Eckart–Young theorem with its uniqueness case
    [EY36; AM12]);
  - positive-definite matrices: the exponential map, global;
  - open simplex: `R_x(ξ) = (x ⊙ exp(ξ ⊘ x))/⟪x, exp(ξ ⊘ x)⟫`, and on `Mult(n, m)` the same map in
    each column, global and first order, and not second order on `Δ°(2)` (witness in the worked
    examples);
  - doubly stochastic: `R_X(ξ) = SK(X ⊙ exp(ξ ⊘ X))` [DH19], global and first order, and not second
    order on `DS(2)`, where `SK = sinkhornScaling` sends a matrix with positive entries to its
    doubly stochastic scaling (OptimalTransport Layer 13A item 8). Prove that `SK` is smooth on the
    matrices with positive entries (`contDiffOn_sinkhornScaling`), by the implicit function
    theorem for the scaling equations in logarithmic coordinates modulo their common scalar: at a
    solution `P` the linearization `(a, b) ↦ (a + Pb, Pᵀa + b)` has kernel spanned by `(𝟏, −𝟏)`,
    because `1` is a simple eigenvalue of the positive stochastic matrix `PᵀP`, and its image is
    the set of pairs with equal sums, where the equations take their values. Prove that the
    derivative of `SK` at `X ∈ DS(n)` is `Π_X` (`fderiv_sinkhornScaling`), which gives the
    velocity condition.
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
  `ι'(T_v u) = Proj_{R_x(v)}(ι'u)`; and parallel transport along `t ↦ exp_x(t v)`
  (SmoothBundlesConnections B5, for the Levi-Civita connection), which is isometric. Prove the
  projection transport on the sphere is not isometric for `v ≠ 0`.

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
- **O3.6 Nondegeneracy.** For a smooth cost, `TauCeti.IsManifoldNondegenerateCriticalPoint I f x`
  holds iff `grad f(x) = 0` and `hessianOp I f x` is invertible
  (`isManifoldNondegenerateCriticalPoint_iff_isUnit_hessianOp`), from MorseTheory M1's
  identification of the critical Hessian with `hessian`, `inner_hessianOp`, and the Riesz
  correspondence between nondegenerate bilinear forms and invertible operators. O5 uses this form.

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
  `mgradient_eq_zero_of_mapClusterPt_armijoSeq`). On a compact manifold with a global retraction
  and a `C²` cost, O2.4 supplies the bound.
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
    constant `L ≥ 0` at each iterate's trial step, for every `ε ∈ (0, 1]` some `k ≤ ⌈C/ε²⌉` has
    `‖grad f(x_k)‖ ≤ ε`, with the explicit constant (`trComplexityConst`)
    `C = 3(f(x₀) − f_low)/(2ρ'c₁ min(Δ₀, c₁/(4(L + β)))) + max(1, 4(L + β)Δ₀/c₁)/2`.
    The proof runs through the radius lemma: if `‖grad f(x_j)‖ > ε` for all `j < k`, then
    `Δ_k ≥ Δ_ε = min(Δ₀, c₁ε/(4(L + β)))`, because a radius at most `c₁ε/(L + β)` gives `ρ ≥ 1/2`.
    Each successful step before `k` then decreases `f` by at least `ρ'c₁εΔ_ε`, each unsuccessful
    one divides the radius by `4`, and no step more than doubles it; counting both kinds gives the
    bound. The bound concerns the index of the first `ε`-critical iterate and gives no count of the
    iterations with large gradient after that index. Corollary: `liminf ‖grad f(x_k)‖ = 0`.

### O5. Local convergence

*[AMS08, Ch. 4, 6, 7]; [ABG07].*

- **O5.1 Gradient descent near a nondegenerate local minimizer.** For a smooth cost, a smooth
  retraction and Armijo constants, there are a neighbourhood `U` of `x*` and a linear rate such
  that every Armijo sequence from `U` converges to `x*` (`armijo_local_linear`). The proof captures
  the iterates in a sublevel component and uses MorseTheory M6's local estimate together with O3.3.
- **O5.2 Newton's method** (`newtonStep`, `newtonSeq`, `newton_local_quadratic`). Near any
  nondegenerate critical point, of any index, and for any retraction, the Newton sequence converges
  quadratically; O3.6 makes `hessianOp` invertible near the critical point.
- **O5.3 Trust regions with truncated CG**, with `H_x = hessianOp I f x`. (a) Near a nondegenerate
  local minimizer `x*` there is a neighbourhood from which the iterates converge to `x*`. (b) If the
  iterates converge to a nondegenerate local minimizer, all but finitely many steps are accepted,
  the radius constraint is eventually inactive, and the convergence has order `min(1 + θ, 2)`.

### O6. Geodesic convexity

*[B23, Ch. 11].*

- **O6.1 Segments and characterization.** Prove that every metric geodesic segment
  (`TauCeti.IsGeodesicSegment`, for the Riemannian distance) is a smooth geodesic on `[0, 1]`
  (`isGeodesicCurveOn_of_isGeodesicSegment`), from SmoothBundlesConnections B6.0's strongly
  geodesically convex neighbourhoods and HopfRinow's uniqueness of minimizers in normal balls; and
  that every point has a neighbourhood `W` and an `r > 0` such that each geodesic of length less
  than `r` starting in `W` is, reparametrized affinely to `[0, 1]`, a metric geodesic segment
  (B6.0's uniform normal radius). `IsGeodesicallyConvexWith κ f` is OptimalTransport Layer 9's
  `λ`-geodesic-convexity predicate, written with `κ`, along every metric geodesic segment. For
  smooth `f` it holds iff `Hess f ⪰ κ g` everywhere (`isGeodesicallyConvexWith_iff`). On a complete
  connected manifold, prove the same characterization for convexity along some metric geodesic
  segment between each pair of points, so that `IsGeodesicallyConvexWith` agrees with Layer 9's
  predicate whether that is stated along every segment or along some segment between each pair.
  State the characterization on open geodesically convex subsets as well (every two points joined
  by a metric geodesic segment inside the subset).
- **O6.2 Consequences**, on a complete connected manifold. For `κ ≥ 0`, every critical point and
  every local minimizer is a global minimizer. For `κ > 0`, a minimizer `x*` exists and is unique,
  `f(y) − f(x*) ≥ (κ/2) d(y, x*)²`, and the Polyak–Łojasiewicz inequality
  `f(x) − f(x*) ≤ ‖grad f(x)‖²/(2κ)` holds.
- **O6.3 Rates.** Under the pullback bound with `L`, gradient descent with step `1/L` satisfies
  `f(x_k) − f(x*) ≤ (1 − κ/L)^k (f(x₀) − f(x*))` (`rgd_linear_of_isGeodesicallyConvexWith`); in
  positive dimension the hypotheses force `κ ≤ L`.
- **O6.4 Compactness.** A continuous `0`-geodesically convex function on a compact connected
  manifold is constant (`const_of_isGeodesicallyConvexWith`): by O6.1, every point near a maximum
  point `p` lies on a metric geodesic segment with `p` in its interior, along which the function is
  convex with an interior maximum, so the set where the maximum is attained is open.
- **O6.5 Continuous time.** Let `f` be a smooth `κ`-geodesically convex cost on a complete
  connected manifold and `x_t` the maximal integral curve of `−grad f` from `x₀`
  (`maximalIntegralCurve`). Prove: (a) for every `y`, the upper right Dini derivative of
  `t ↦ ½d(x_t, y)²` is at most `⟪grad f(x_t), γ'(0)⟫` for every minimizing geodesic
  `γ : [0, 1] → M` from `x_t` to `y`, from HopfRinow's first variation of energy, so convexity along
  `γ` gives `½ D⁺_t d(x_t, y)² + (κ/2) d(x_t, y)² ≤ f(y) − f(x_t)`; (b) the curve is defined on
  `[0, ∞)`: with `y = x₀`, this inequality and convexity at `x₀` bound `d(x_t, x₀)` on bounded time
  intervals, closed balls are compact (Hopf–Rinow), and the escape lemma
  `eventually_notMem_nhdsLT_maximalIntegralCurve` excludes a finite end time; (c) the flow is
  therefore an `EVI_κ` solution in OptimalTransport Layer 10's sense.
- **O6.6 Positive-definite matrices.** `log det` is geodesically affine, `tr` is geodesically
  convex, and `tr X − log det X` has the unique minimizer `I`; prove each from the explicit
  geodesics of O0.3, which by O6.1 and the injectivity of `exp_X` are all the metric geodesic
  segments of `P(n)`.

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
  minimum value is `−σ₀(A)`, minus the operator norm of `A`.
- **Brockett's cost on the Stiefel manifold** [Bro91]. For symmetric `A` and
  `N = diag(μ₁, …, μ_p)`, `f(X) = tr(XᵀAXN)`: if the `μ_i` are distinct and nonzero, `X` is critical
  iff `AX = XΛ` with `Λ` diagonal; if `μ₁ ≥ … ≥ μ_p ≥ 0`, the minimum value is `Σ μ_i λ_i^↑` with the
  eigenvalues in increasing order, consuming Majorization's Ky Fan theory.
- **Principal subspace on the Grassmannian.** `f(π X) = −tr(XᵀAX)` is well defined; a subspace
  `W ∈ Gr(n, p)` is critical iff it is `A`-invariant; the minimum value is `−(λ₁ + … + λ_p)` with
  the eigenvalues in decreasing order; and if `λ_p > λ_{p+1}`, every second-order critical point is
  the dominant `p`-dimensional invariant subspace.
- **Retractions.** For `X = [e₁ e₂] ∈ St(3, 2)` and `U = [e₃ e₃]` (tangent, since `XᵀU = 0`), the
  Q-factor curve has ambient acceleration `−2X [[1/2, 1], [0, 1/2]]` at `0`, which is not of the form
  `XΣ` with `Σ` symmetric, so the Q-factor retraction is not second order; the polar curve has
  acceleration `−X UᵀU`, which is normal. On `Δ°(2)` at `x = (p, 1 − p)` with `ξ = (1, −1)`, the
  curve of the open-simplex retraction has covariant acceleration of length
  `|1 − 2p|/(2(p(1 − p))^{3/2})` at `0`, nonzero for `p ≠ 1/2`. The first column `X ↦ Xe₁` maps
  `DS(2)` onto `Δ°(2)`, pulling the Fisher metric back to half that of `DS(2)`, and carries the
  Sinkhorn curve at `X` with `ξ = [[1, −1], [−1, 1]]` to the simplex curve at `Xe₁`, so neither
  retraction is second order.
- **Exponentiated gradient on the simplex.** On `Δ°(n)`, `x` is critical iff `∇f̄(x) ∈ ℝ𝟏`, and a
  gradient step with step size `t` and the open-simplex retraction is the multiplicative-weights
  update `x⁺ = (x ⊙ exp(−t∇f̄(x)))/⟪x, exp(−t∇f̄(x))⟫`.
- **Entropic transport on `DS(n)`.** For a cost matrix `C` and `ε > 0`, let
  `f̄(X) = ⟪C, X⟫ + ε Σ X_ij (log X_ij − 1)` on the positive orthant. A point `X ∈ DS(n)` is
  critical iff `C + ε log X = α𝟏ᵀ + 𝟏βᵀ` for some `α, β ∈ ℝⁿ`, iff `X = SK(exp(−C/ε))`; that point
  is the unique minimizer on `DS(n)`, and `X/n` is the minimizer of OptimalTransport Layer 13A's
  cost-regularized problem with cost `C` between the uniform probability measures on `Fin n`.
- **One-dimensional checks.** On `ℝ` with `R_x(v) = x + v`: `f(x) = a x²/2` (`a > 0`) satisfies the
  pullback bound with `L = a` and equality, gradient descent with step `1/a` and Newton's method both
  reach `0` in one step; `f(x) = x⁴` satisfies the pullback bound for no `L`.
- **Convexity.** `P(n)` is complete, `log det` is geodesically affine and `tr` geodesically convex
  on it; on the sphere with its Riemannian distance (the Distances on the catalogue convention),
  every continuous geodesically convex function is constant
  (`const_of_isGeodesicallyConvexWith_sphere`).

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
- **"On a Fisher carrier the gradient is the projected Euclidean gradient."** On `Δ°(2)` at
  `x = (1/4, 3/4)` with `f̄(y) = y₁`, the Fisher gradient is `(3/16, −3/16)` and the projected
  Euclidean gradient `(1/2, −1/2)`: O1.2 applies to `fisherEmbedding ∘ ι`, not to `ι`.
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
- **"The lifted cost on a quotient's total space is Morse."** At a critical point the vertical space
  lies in the kernel of `Hess(f ∘ π)`; Newton's local theory is applied on the quotient.
- **"Geodesic convexity is useful on compact manifolds."** Continuous geodesically convex functions
  on compact connected manifolds are constant (O6.4).
- **"Geodesic convexity along metric segments is a Riemannian notion."** On a metric space with no
  nonconstant geodesic segments every function satisfies the predicate vacuously, and the unit
  sphere with its ambient chordal metric is such a space. O6.1 and O6.4 carry their Riemannian
  hypotheses explicitly, and the catalogue states convexity for its Riemannian distances.

## Relation to sibling roadmaps

One owner per shared construction, stated identically on both sides.

- **DifferentialGeometry** owns metrics, `mgradient` and `hessian`; this roadmap adds only the
  operator form `hessianOp` of the same Hessian.
- **HopfRinow** owns the connection, geodesics, the exponential map and local logarithms, the first
  variation of energy, and the metric geodesic-space API; O2.2 consumes the exponential map as a
  retraction.
- **RiemannianGeometry** owns the second fundamental form, the shape operator and Riemannian
  submersions; O1.3 states the optimization formulas in their terms, and O0.2 constructs quotient
  metrics in R1's sense.
- **MorseTheory** owns critical Hessians, the manifold Fermat theorem, strict minimality of
  nondegenerate minima, regular levels of scalar functions, and continuous gradient flows with
  their convergence; this roadmap owns discrete iterations and their rates, and O0.1 compares its
  level-set structure with M2's.
- **OptimalTransport** owns metric geodesic convexity, metric gradient flows, `EVI`, entropic
  transport and the Sinkhorn–Knopp theorem; O6 owns the Riemannian characterization, its agreement
  with Layer 9's predicate, and the consequences for discrete algorithms, and O2.2 owns the
  smoothness and derivative of the Sinkhorn scaling and the retraction built from it.
- **SmoothBundlesConnections** owns parallel transport and strongly geodesically convex
  neighbourhoods; O2.5 and O6.1 consume them.
- **GeneralizedCohomology** owns the smooth real Grassmannian; O0.3 adds its quotient metric, the
  projection from `St(n, p)` and the Riemannian computations, and builds no second carrier.
- **DGFloer** builds Stiefel manifolds of orthonormal 2-frames; this roadmap owns `St(n, p)` for
  every `p`, and O0.3 proves the diffeomorphism with DGFloer's carrier for `p = 2`.
- **LieGroupoidsPoisson** owns regular fibres of submersions, and **LieGroups** the Lie-group
  structure of matrix groups; O0.1 and O0.3 compare with them.
- **Majorization**, **PrincipalAngles** and **PolarDecomposition** own Ky Fan theory, principal
  angles and polar factors; matrix functional calculus, doubly stochastic matrices and the standard
  simplex are Mathlib's. **VariationalMethods** owns Rayleigh minimization on Hilbert spaces.

## Ordering

O0.1 and O1.1–O1.2 come first; O0.1's comparisons also need MorseTheory M2 and LieGroupoidsPoisson
G0.1, and O0.2's quotient metrics need RiemannianGeometry R1. O2.1 and the exponential part of O2.2
depend only on Tau Ceti and proceed alongside them; O2.3 needs O1.4, O2.5's parallel transport needs
SmoothBundlesConnections B5, and O2.2's Sinkhorn retraction needs OptimalTransport Layer 13A item 8.
O3 needs DifferentialGeometry 12 and MorseTheory M1 and M4. O4.1–O4.2 need O2.1 and O2.4; O4.3 needs
O2.1. O5 needs O2.3, O3.3 and O3.6, and O5.3 also O4.3's truncated conjugate gradients. O6.1 needs
HopfRinow Layer 2 and SmoothBundlesConnections B6.0; O6.2–O6.4 need O6.1 and HopfRinow's
geodesic-space API, with O6.3 also needing O4.1; O6.5 needs O6.1, HopfRinow's first variation of
energy and OptimalTransport Layer 10; O6.6 needs O0.3's `P(n)`. The catalogue items of O0.3 are
independent of one another, except that `Δ°(n)` uses the sphere, `Mult(n, m)` uses `Δ°(n)` and
O0.2's powers, and `DS(n)` uses `Mult(n, n)`; the orthogonal groups need LieGroups Layer 2, the
comparison for `St(n, 2)` needs DGFloer Layer 1, and the Grassmannian needs GeneralizedCohomology
G4.0b, LieGroups Layer 2 and O0.2's quotient metrics. Discharge the worked examples alongside the
layers they exercise; the entropic transport example also needs OptimalTransport Layer 13A. Claim
single numbered items or smaller.

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
- [EY36] C. Eckart, G. Young, The approximation of one matrix by another of lower rank,
  *Psychometrika* 1(3) (1936), 211–218.
- [DH19] A. Douik, B. Hassibi, Manifold optimization over the set of doubly stochastic matrices: a
  second-order geometry, *IEEE Trans. Signal Process.* 67(22) (2019), 5761–5774.
- [Sin64] R. Sinkhorn, A relationship between arbitrary positive matrices and doubly stochastic
  matrices, *Ann. Math. Statist.* 35 (1964), 876–879.
- [BMAS14] N. Boumal, B. Mishra, P.-A. Absil, R. Sepulchre, Manopt, a Matlab toolbox for
  optimization on manifolds, *J. Mach. Learn. Res.* 15 (2014), 1455–1459. Documentation:
  [manifolds](https://www.manopt.org/manifolds.html),
  [a first example](https://www.manopt.org/firstexample.html).
- [LWHWXW24] C. Li, Z. Wang, W. He, Y. Wu, S. Xu, Z. Wen, Formalization of complexity analysis of
  the first-order algorithms for convex optimization, arXiv:2403.11437.