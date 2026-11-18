# Roadmap: varifolds

**Summary.** This roadmap builds the general theory of k-dimensional varifolds on an open subset W
of a smooth Riemannian manifold (M, g), in the generality of Allard's theory: a varifold is an
arbitrary Radon measure on the Grassmann bundle of unoriented k-planes, and the analysis is carried
out for varifolds of locally bounded first variation. It starts from Mathlib's Radon measures,
Riesz–Markov–Kakutani theorem, Hausdorff measure, norm determinants, smooth embeddings and
Levi-Civita connection, Tau Ceti's finite Grassmannians, flows of compactly supported vector fields,
signed Riesz representation, mass measures of functionals on test functions, Prokhorov theorem,
Riemannian volume, divergence theorem, normal domains of the exponential map, sectional curvature,
second fundamental forms of parametrised submanifolds of Euclidean space and countably rectifiable
sets, and the approximate tangent plane, area formula and Grassmann-bundle material of
GeometricMeasureTheory and GeometricCurrents. Its end theorems are: the Riesz decomposition of the
first variation into generalised mean curvature, generalised boundary measure and outward co-normal;
the monotonicity formula, Euclidean and intrinsically Riemannian, with the existence and
semicontinuity of densities; Allard's rectifiability theorem; the compactness theorems for
rectifiable and for integral varifolds; varifold tangents and rectifiable and integral tangent
cones; the constancy theorem; the comparison between the intrinsic theory on an embedded submanifold
M ⊆ ℝ^L and the ambient theory in ℝ^L; and the identification of GeometricCurrents' auxiliary
varifold of an integral current with the rectifiable varifold of its carrier. Every notion is
defined intrinsically on (M, g); the Euclidean space E is the case of the flat metric, and no
isometric embedding theorem is used. The Euclidean theorems of the literature (Allard1972;
Simon1983, §§38–42) are the case W ⊆ E with the flat metric, and the roadmap states them there as
well wherever its Riemannian statement needs a construction of its own (the normal-coordinate
blow-up of 3.2, or a sequence of metrics).

## Scope and ownership

Owned here:

- the projection presentation of the Grassmann bundle G_k(W) (each k-plane recorded by its
  g-orthogonal projection; it is kept beside Tau Ceti's `TauCeti.finiteGrassmannian` because the
  tangential trace tr(P ∘ A) and the operator-norm distance are stated on P, and its fibre is
  homeomorphic to `TauCeti.finiteGrassmannian ℝ k N` by 1.1), its comparison with
  GeometricCurrents G6's unoriented Grassmann bundle, the varifold carrier, weight, mass, support,
  restriction, varifold convergence;
- approximate tangent spaces of Radon measures on a manifold and the rectifiability criterion for
  measures; rectifiable and integral varifolds v(Γ, θ); the multiplicity-one varifold [Σ] of a C¹
  embedded submanifold and the identification of its weight with the Riemannian volume of Σ
  (GeometricCurrents G2 identifies the mass of the current of a compact oriented smooth source
  only);
- push-forward of varifolds under C¹ maps proper on the support, Euclidean dilations and
  normal-coordinate blow-ups, tangent spaces with multiplicity, fibre measures and the first
  rectifiability theorem;
- the first variation δV, its characterisation as the derivative of mass along flows, stationarity,
  locally bounded first variation, the Riesz representation theorem for vector fields on W, the
  Riesz decomposition of δV, and the comparison of first variations for two metrics;
- the second fundamental form and mean curvature of a C² embedded submanifold of a Riemannian
  manifold by the formula of the Conventions (RiemannianGeometry R5a and R5a.2 define them for
  smooth immersions, and the two agree on smooth submanifolds; for a submanifold of a Euclidean
  space the form is Tau Ceti's `TauCeti.secondFundamentalForm` read in a C² parametrisation), the
  first variation of a C² submanifold and its agreement with RiemannianGeometry R5a.2 for smooth
  ones; the intrinsic versus ambient comparison for an embedded submanifold M ⊆ ℝ^L;
- monotonicity (Euclidean and Riemannian), densities, their measurability and upper
  semicontinuity, the constancy theorem and the convex hull property of varifolds stationary off
  a compact set (6.5);
- the semicontinuity of lower density bounds, Allard's rectifiability theorem, the compactness
  theorems for rectifiable and integral varifolds and Allard's multiplicity lemma, all for
  sequences of metrics converging in C² on compact sets;
- varifold tangents, rectifiable tangent cones and integral tangent cones, Euclidean and in
  normal coordinates;
- regular and singular sets, locality of every notion and its invariance under smooth isometries,
  and the comparison theorem with GeometricCurrents G6.

Owned elsewhere and cited:

- The k-dimensional subspaces of ℝ^N with the quotient topology of the span map on frames, their
  compactness and Hausdorff property, and the continuity of the orthogonal projection onto them
  are already in Tau Ceti (`TauCeti.finiteGrassmannian`); 1.1 compares them with G(E, k).
- Approximate tangent planes of rectifiable sets, tangential differentiation and the area formula:
  GeometricMeasureTheory G2. Countable k-rectifiability and its closure API, on any extended metric
  space and so on (M, d_g), are already in Tau Ceti (`TauCeti.CountablyRectifiable`), and the
  normalised Hausdorff measure is Mathlib's.
- Rectifiable sets and Hᵏ on manifolds with their chart comparison, integer-rectifiable and
  integral currents, their mass measures: GeometricCurrents G1–G2. The distributional constancy
  criterion (a distribution on a connected open set whose coordinate derivatives vanish is a
  constant multiple of Lebesgue measure): GeometricCurrents G1. Local area minimization of
  integral currents: GeometricCurrents G5.
- The unoriented Grassmann bundle (constructed from the oriented carrier by orientation quotient),
  its compactness over compact base regions and Radon compactness on it; the auxiliary rectifiable
  varifold of an integral current, its first variation under ambient flows, its monotonicity and
  tangent cones: GeometricCurrents G6. This roadmap proves the general theorems for arbitrary
  varifolds and one comparison theorem (9.3) identifying G6's object; nothing G6 states is planned
  again, and GeometricCurrents does not consume this roadmap. RiemannianGeometry/MinimalSurfaces
  (Scope and ownership, and 3.1) refers to G6 for monotonicity of stationary varifolds; G6 states it for the
  auxiliary varifold of an integral current, and the statement for every varifold of locally
  bounded first variation is 6.1–6.2 here, of which G6's is the case of 9.3.
- The convex hull property of a compact smooth minimal submanifold of ℝ^m with boundary, proved
  from the harmonicity of the coordinate functions without varifolds:
  RiemannianGeometry/MinimalSurfaces 3.3. 6.5 here is the statement for every varifold on E with
  compact support that is stationary off a compact set K, with no rectifiability or smoothness;
  for an embedded Σ it gives 3.3 with V = [Σ ∖ ∂Σ] and K = ∂Σ, the varifold being stationary in
  E ∖ ∂Σ by 5.1 applied on W = E ∖ ∂Σ, in which Σ ∖ ∂Σ is closed.
- Immersion geometry, the second fundamental form B, the averaged mean curvature and the first
  volume variation of smooth immersions: RiemannianGeometry R5a and R5a.2. The Hessian comparison
  for the distance function: RiemannianGeometry R4, item 1. Smooth second variation and stability:
  RiemannianGeometry R5b (not used here).
- The Riemannian distance, the exponential map, normal balls and the Gauss lemma: HopfRinow
  (Completed), Layers 0–2, formalised in Tau Ceti as the exponential map and logarithm
  (`TauCeti.Manifold.riemannianExp`, `TauCeti.Manifold.riemannianLog`), normal domains
  (`TauCeti.Manifold.IsNormalDomain`) and the identification of geodesic balls with metric balls
  (`TauCeti.Manifold.IsNormalDomain.image_riemannianExp_ball`). The divergence of a vector field
  on a Riemannian manifold and the divergence theorem on boundaryless manifolds are already in Tau
  Ceti (`TauCeti.Manifold.divergence`, `TauCeti.Manifold.integral_divergence_eq_zero`), as are the
  sectional curvature of a metric connection (`CovariantDerivative.sectionalCurvature`), the
  metric induced by an immersion into an inner product space (`TauCeti.inducedRiemannianMetric`)
  and the second fundamental form of a map into an inner product space
  (`TauCeti.secondFundamentalForm`). The support of a measure is Mathlib's
  (`MeasureTheory.Measure.support`), and so are C^n embeddings of manifolds
  (`Manifold.IsSmoothEmbedding`).

Outside this roadmap: Allard's regularity theorem and every regularity statement beyond the
definition of the regular set (the subject of Varifolds, Part II); Wickramasekera's stable
regularity; Almgren–Pitts min-max theory; Brakke flows; curvature varifolds; varifolds with
respect to anisotropic integrands; varifolds in metric spaces; currents and their homology
(GeometricCurrents). The two Annals statements of 9.4 are consumers' theorems; they are stated
here only as tests of the definitions.

## Conventions

- **Ambient.** (M, g) is a smooth, Hausdorff, second countable, boundaryless manifold of dimension
  N ≥ 1 with a smooth Riemannian metric, presented through Mathlib's `ModelWithCorners`,
  `IsManifold`, `Bundle.RiemannianBundle` and `IsRiemannianManifold`; d_g is the Riemannian (extended)
  distance of HopfRinow Layer 0. W ⊆ M is open. The Euclidean case is M = E, a finite-dimensional
  real inner product space with its flat metric (E ≅ ℝ^N by a linear isometry); there T_xE = E,
  ∇ = D and exp_x(v) = x + v. The integer k satisfies 0 ≤ k ≤ N; from Layer 6 on, 1 ≤ k ≤ N.
  The statements remain true, trivially, for k > N, and the Lean statements do not exclude that
  case: every G(T_xM, k) is then empty (1.1), the only k-varifold is 0, and no k-manifold
  immerses in M.
- **Planes as projections.** A k-plane S ⊆ T_xM is recorded by its g_x-orthogonal projection
  P_S, a self-adjoint idempotent of rank k (`IsStarProjection`, `Submodule.starProjection`,
  `isStarProjection_iff_eq_starProjection_range`). Distances between planes use the operator
  norm: for the lines ℓ_θ = span(cos θ, sin θ) of ℝ², `‖P_{ℓ_θ} − P_{ℓ_0}‖ = |sin θ|`, so two
  perpendicular lines are at distance 1 (the Frobenius norm would give √2; both give the same
  topology). The projection presentation depends on g; a change of metric is transported along the
  canonical identification of subspaces (1.2).
- **Measures.** A Radon measure on a locally compact, second countable Hausdorff space is a
  locally finite Borel measure (`IsFiniteMeasureOnCompacts`); such measures are regular
  (`Regular.of_sigmaCompactSpace_of_isLocallyFiniteMeasure`) and determined by their integrals of
  compactly supported continuous functions (`MeasureTheory.Measure.ext_of_integral_eq_on_compactlySupported`).
  Masses are extended nonnegative. Hᵏ is Mathlib's normalised Hausdorff measure
  `MeasureTheory.Measure.euclideanHausdorffMeasure` for d_g, which on a k-dimensional Euclidean
  space is Lebesgue measure; ω_k is the Lebesgue measure of the unit ball of ℝ^k (ω_1 = 2,
  ω_2 = π). Witness: H¹ of the unit circle of ℝ² is 2π and H² of the unit disc is π.
- **Balls and densities.** B_ρ(x) = {d_g(x, ·) < ρ}, B̄_ρ(x) = {d_g(x, ·) ≤ ρ}. For a Radon
  measure μ on W, `Θ^k(μ, x) = lim_{ρ↓0} μ(B_ρ(x))/(ω_k ρ^k)` when the limit exists, with upper and
  lower densities `Θ^{*k}`, `Θ^k_*` as lim sup and lim inf; open and closed balls give the same values.
  On any extended metric space, ω_k is `unitBallVolume`, the ratio μ(B_ρ(x))/(ω_k ρ^k) in [0, ∞] is
  `densityRatio`, "Θ^k(μ, x) exists and equals θ" is `HasDensity`, and `Θ^{*k}(μ, x)` is
  `upperDensity`; a density may be +∞ (an atom has Θ^k = ∞ for k ≥ 1).
  Witness: for μ = H¹⌞L, L a line of ℝ², μ(B_ρ(x)) = 2ρ, so Θ^1(μ, x) = 1 on L; for two crossing
  lines Θ^1 = 2 at the crossing.
- **Jacobians and push-forward.** For a C¹ map f between Riemannian manifolds and a k-plane
  S ⊆ T_xM, `J_S f(x) = normDet(df_x|_S : S → T_{f(x)}M')` (`LinearMap.normDet`, inner products of
  g_x and `g'_{f(x)}`); it vanishes exactly when df_x|_S is not injective. Witness: for f(y) = 2y on
  ℝ² and a line S, J_S f = 2; for f(y) = (y_1, 0) and S = span(e_2), J_S f = 0.
- **Dilations and blow-ups.** In E, `η_{x,λ}(y) = λ⁻¹(y − x)` for λ > 0. On M,
  `β_{x,λ} = λ⁻¹ exp_x⁻¹` on a normal ball of x, with values in the Euclidean space (T_xM, g_x); in
  E, `β_{x,λ} = η_{x,λ}`.
- **Varifold convergence** is convergence against every compactly supported continuous function
  on the Grassmann bundle (vague convergence; `VarifoldTendsto` for a sequence of measures on any
  topological space). The convention for rectifiable varifolds in which a sequence converges when
  its weights do (Simon1983 line 2898–2902, §15) is not used. A limit is always required to be a Radon measure: a measure that
  is infinite on a compact set has no integrals of test functions to converge to.
- **First variation and mean curvature.** `δV(X) = ∫ div_S X(x) dV(x, S)` with
  `div_S X = tr(P_S ∘ ∇X)`, ∇ the Levi-Civita connection. The Riesz decomposition is written
  `δV(X) = −∫ ⟨H_V, X⟩ d‖V‖ + ∫ ⟨η_V, X⟩ dσ_V`, with η_V the outward co-normal. H_V is the trace
  mean curvature: for a C² embedded submanifold Σ it is k times the averaged mean curvature
  H = (1/k) tr B, where `B(X, Y) = (∇_X Y)^⊥` for C¹ tangent fields X, Y of Σ (the tangent fields of
  a C² submanifold are C¹, and B is then a continuous, symmetric, tensorial normal-valued form); for
  smooth Σ these are RiemannianGeometry R5a's B and R5a.2's H, which are stated for smooth
  immersions. Witnesses: the unit sphere S^k ⊆ ℝᵏ⁺¹ has B = −g·x, averaged H = −x and
  `H_{[S^k]} = −k x`; the half hyperplane {x_N = 0, x_1 > 0} of ℝ^N has outward co-normal η = −e_1
  along {x_1 = x_N = 0}.
- **Regularity classes.** For r ∈ {1, 2, …} ∪ {∞}, reg^r V and sing^r V refer to C^r embedded
  submanifolds; the class is part of every statement that uses them.
- **Lean carriers.** The Grassmannian of E is the subset `Euclidean.grassmannian` of `E →L[ℝ] E`
  of rank-k elements satisfying `IsStarProjection`, and a varifold on an open W ⊆ E is a
  `MeasureTheory.Measure` on `W × Euclidean.grassmannian E k` with `IsFiniteMeasureOnCompacts`. The
  Grassmann bundle of (M, g) is the corresponding subset `grassmannBundle` of the total space of the
  endomorphism bundle of `TangentSpace` (Mathlib's continuous-linear-map bundle), self-adjointness
  being taken for the inner product that `Bundle.RiemannianBundle` puts on each fibre, with the subspace
  topology and its Borel σ-algebra; a varifold on (M, g) is a measure on it with
  `IsFiniteMeasureOnCompacts`. The Riemannian statements are made for varifolds on M itself: an
  open W ⊆ M with the restricted metric (`Bundle.ContMDiffRiemannianMetric.restrictOpenTangentSpace`)
  is again a Riemannian manifold, its Grassmann bundle is G_k(W), and the geodesic balls of W and of
  M about x agree below the radius of a normal ball of x contained in W. Vector fields are sections
  `Π x, TangentSpace I x`, of class C¹ in the sense of `ContMDiff` of the section into the tangent
  bundle, and test functions are `C_c(·, ℝ)`.

## Exact supplier contracts

### From Mathlib

- Projections: `IsStarProjection` (`Mathlib/Algebra/Star/StarProjection.lean`),
  `Submodule.starProjection` (`Mathlib/Analysis/InnerProductSpace/Projection/Basic.lean`),
  `isStarProjection_starProjection` and `isStarProjection_iff_eq_starProjection_range`
  (`Mathlib/Analysis/InnerProductSpace/Adjoint.lean`); the adjoint as star on `E →L[ℝ] E`;
  `Continuous.homeoOfEquivCompactToT2` (`Mathlib/Topology/Homeomorph/Lemmas.lean`: a continuous
  bijection from a compact space onto a Hausdorff space is a homeomorphism).
- Measures: `IsFiniteMeasureOnCompacts`, `Measure.map`, `Measure.restrict`,
  `Regular.of_sigmaCompactSpace_of_isLocallyFiniteMeasure` (`Mathlib/MeasureTheory/Measure/Regular.lean`),
  `RealRMK.rieszMeasure` and `RealRMK.integral_rieszMeasure`
  (`Mathlib/MeasureTheory/Integral/RieszMarkovKakutani/Real.lean`, positive functionals on
  `C_c(X, ℝ)` of a locally compact Hausdorff X), `MeasureTheory.Measure.ext_of_integral_eq_on_compactlySupported`
  (same file, for two regular measures), `Measure.rnDeriv` and `Measure.singularPart`
  (`Mathlib/MeasureTheory/Measure/Decomposition/Lebesgue.lean`),
  `MeasureTheory.Measure.setLIntegral_rnDeriv_le`
  (`Mathlib/MeasureTheory/Measure/Decomposition/RadonNikodym.lean`: for any two measures μ, ν and
  any set s, the lower integral over s of the Radon–Nikodym derivative of μ with respect to ν,
  against ν, is at most μ(s); no σ-finiteness is assumed), `MeasureTheory.Measure.condKernel`
  (`Mathlib/Probability/Kernel/Disintegration/StandardBorel.lean`, finite measures on a product with
  standard Borel second factor).
- Differentiation of measures: `HasBesicovitchCovering` (`Mathlib/MeasureTheory/Covering/Besicovitch.lean`)
  and its finite-dimensional instance
  (`Mathlib/MeasureTheory/Covering/BesicovitchVectorSpace.lean`), `Besicovitch.vitaliFamily`,
  `Besicovitch.ae_tendsto_rnDeriv` and `Besicovitch.ae_tendsto_measure_inter_div_of_measurableSet`
  (`Mathlib/MeasureTheory/Covering/Besicovitch.lean`; the last says that for a locally finite
  measure and a measurable set s, the proportion of s in the closed ball B̄_r(x) tends to the
  indicator of s at x as r ↓ 0, for a.e. x),
  `Vitali.vitaliFamily` (`Mathlib/MeasureTheory/Covering/Vitali.lean`, which needs a uniform
  constant C with `μ(closedBall x (3r)) ≤ C μ(closedBall x r)` frequently as r ↓ 0 at every
  point), `VitaliFamily.ae_tendsto_average` (`Mathlib/MeasureTheory/Covering/Differentiation.lean`),
  `Vitali.exists_disjoint_subfamily_covering_enlargement` (`Mathlib/MeasureTheory/Covering/Vitali.lean`:
  a family of nonempty sets with bounded sizes δ has a disjoint subfamily such that every member
  meets a chosen one whose size is at least 1/τ times its own, for any τ > 1; on any type).
- Hausdorff measure and Jacobians: `MeasureTheory.Measure.euclideanHausdorffMeasure` and
  `InnerProductSpace.euclideanHausdorffMeasure_eq_volume`
  (`Mathlib/Geometry/Euclidean/Volume/Measure.lean`: the measure is defined on any extended metric
  space, a constant multiple of `μH[d]`, and on a d-dimensional real inner product space it equals
  Lebesgue measure), `LipschitzWith.hausdorffMeasure_image_le`
  (`Mathlib/MeasureTheory/Measure/Hausdorff.lean`: a K-Lipschitz map multiplies the
  d-dimensional Hausdorff measure of every set by at most K^d), `LinearMap.normDet`,
  `LinearMap.normDet_comp` and `LinearMap.euclideanHausdorffMeasure_image_eq_normDet_mul_volume`
  (`Mathlib/Analysis/InnerProductSpace/NormDet.lean`; `normDet` is zero on non-injective maps, and
  `normDet_comp` says normDet(g ∘ f) = normDet(g restricted to range f) · normDet(f)).
- Riemannian structure: `IsRiemannianManifold` (`Mathlib/Geometry/Manifold/Riemannian/Basic.lean`),
  `CovariantDerivative.leviCivitaConnection`
  (`Mathlib/Geometry/Manifold/VectorBundle/CovariantDerivative/LeviCivita.lean`, for a C² manifold
  with a C¹ metric), `ContMDiff.mpullback_vectorField`
  (`Mathlib/Geometry/Manifold/VectorField/Pullback.lean`: the pull-back x ↦ (df_x)⁻¹ Y(f(x)) of a
  C^m vector field Y by a C^n map f with invertible differentials is C^m when m + 1 ≤ n),
  `CovariantDerivative.isMetricCompatible_leviCivitaConnection` (same file as the connection: it
  is compatible with the metric), `Manifold.IsSmoothEmbedding`
  (`Mathlib/Geometry/Manifold/SmoothEmbedding.lean`: a C^n immersion that is a topological
  embedding; with n = 2 and a k-dimensional source this is a C² embedded k-submanifold of the
  target, 6.4), and the extended-metric balls `Metric.eball` (`Mathlib/Topology/EMetricSpace/Defs.lean`).
  `Module.Grassmannian` (`Mathlib/RingTheory/Grassmannian.lean`) is the algebraic quotient functor
  and is not a supplier.
- Supports: `MeasureTheory.Measure.support` (`Mathlib/MeasureTheory/Measure/Support.lean`: the
  points every neighbourhood of which has positive measure), used for spt‖V‖.

### From Tau Ceti

- `TauCeti.finiteGrassmannian` (`TauCeti/Topology/Grassmannian/Basic.lean`: the r-dimensional
  subspaces of the coordinate space `Fin N → 𝕜`, with the quotient topology of the span map on
  linearly independent r-frames), its `CompactSpace` instance for `RCLike 𝕜`
  (`TauCeti/Topology/Grassmannian/Orthonormal.lean`) and its `T2Space` instance
  (`TauCeti/Topology/Grassmannian/Plucker.lean`), and `TauCeti.finiteGrassmannian.toEuclidean`,
  `TauCeti.finiteGrassmannian.toEuclidean_injective` and
  `TauCeti.finiteGrassmannian.continuous_starProjection_toEuclidean`
  (`TauCeti/Topology/Grassmannian/Tautological.lean`: a point S read as a subspace of
  `EuclideanSpace 𝕜 (Fin N)`, injectively, and the continuity of S ↦ the orthogonal projection
  onto it). The carrier has no metric; the operator-norm distance of 1.1 is this roadmap's.
- `TauCeti.globalFlow`, `TauCeti.contMDiff_globalFlow_uncurry`, `TauCeti.globalFlowDiffeomorph`
  (`TauCeti/Geometry/Manifold/IntegralCurve/GlobalFlow.lean`: the flow of a complete C¹ vector
  field on a Hausdorff boundaryless manifold, jointly C^n for a C^n field) and
  `TauCeti.isCompleteVectorField_of_isCompact_of_eq_zero_off`
  (`TauCeti/Geometry/Manifold/Flow/Complete.lean`: on a Hausdorff boundaryless C¹ manifold
  modelled on a complete space, a C¹ field vanishing off a compact set is complete).
- `TauCeti.RealRMK.posPart`, `TauCeti.RealRMK.negPart`,
  `TauCeti.RealRMK.integral_rieszMeasure_posPart_sub_integral_rieszMeasure_negPart`
  (`TauCeti/MeasureTheory/Integral/RieszMarkovKakutani/Signed.lean`: an order-bounded functional on
  `C_c(X, ℝ)` is the difference of two Riesz measures).
- `Distribution.HasLocallyFiniteMass` (`TauCeti/Analysis/Distribution/Mass/Basic.lean`),
  `Distribution.massMeasure`, `Distribution.massMeasure_preimage_coe` and
  `Distribution.enorm_apply_le_lintegral_massMeasure`
  (`TauCeti/Analysis/Distribution/Mass/Measure.lean`): for a real-linear functional T of locally
  finite mass on F-valued test functions of class C^n (n ∈ ℕ∞; n = 0 gives the compactly supported
  continuous functions) on an open set Ω of a finite-dimensional normed space, a regular Borel
  measure ‖T‖ on Ω, finite on compact subsets of Ω, whose value on Ω ∩ U for open U is the supremum
  of |T φ| over the tests supported in U with ‖φ‖ ≤ 1, and with |T φ| ≤ ∫ ‖φ‖ d‖T‖; it provides no
  polar density, and the norm is that of F.
- `TauCeti.isCompact_closure_of_isTightMeasureSet_of_mass_le`
  (`TauCeti/MeasureTheory/Measure/Prokhorov.lean`: a tight set of finite measures of bounded mass
  has compact closure).
- `MeasureTheory.integral_divergence_eq_zero` (`TauCeti/MeasureTheory/Integral/DivergenceTheorem/CompactSupport.lean`:
  a compactly supported C¹ vector field on a coordinate space of positive dimension has integrable
  divergence with integral 0).
- `TauCeti.riemannianVolume` (`TauCeti/Geometry/Manifold/Riemannian/VolumeDensity/Volume.lean`),
  the orientation-free Riemannian measure of a C¹ manifold with a continuous metric (Lindelöf, Borel),
  and `TauCeti.eq_riemannianVolume_iff` (same file: a measure equals it if and only if its
  restriction to the source of every preferred chart is the chart volume).
- `TauCeti.Manifold.divergence` (`TauCeti/Geometry/Manifold/Riemannian/Laplacian.lean`: the trace
  of `CovariantDerivative.leviCivitaConnection` applied to the field, on a C² manifold with a C¹
  metric) and `TauCeti.Manifold.integral_divergence_eq_zero`
  (`TauCeti/Geometry/Manifold/Riemannian/DivergenceTheorem.lean`: on a smooth, Hausdorff,
  σ-compact manifold with boundaryless model and a C¹ metric, the divergence of a compactly
  supported C¹ field has integral 0 against `TauCeti.riemannianVolume`).
- `TauCeti.IsLocalRiemannianIsometry` (`TauCeti/Geometry/Manifold/Riemannian/Isometry/Local.lean`:
  a smooth map between Riemannian manifolds whose differential at every point is invertible and
  preserves the inner products) and
  `TauCeti.IsLocalRiemannianIsometry.mfderiv_leviCivitaConnection_mpullback`
  (`TauCeti/Geometry/Manifold/Riemannian/Isometry/LeviCivita.lean`: on C² manifolds with
  finite-dimensional models and C¹ metrics, `df_x(∇_v f^*Y) = ∇'_{df_x v} Y` for every vector field Y
  differentiable at f(x), f^*Y the pull-back), applied to open subsets with the restricted metrics
  (`Bundle.ContMDiffRiemannianMetric.restrictOpenTangentSpace`,
  `TauCeti/Geometry/Manifold/Riemannian/Restriction.lean`). `TauCeti.RiemannianIsometry`
  (`TauCeti/Geometry/Manifold/Riemannian/Isometry/Basic.lean`: a smooth diffeomorphism whose
  differentials preserve the inner products) and `TauCeti.RiemannianIsometry.riemannianExp_mfderiv`
  (`TauCeti/Geometry/Manifold/Riemannian/Isometry/Exponential.lean`: on finite-dimensional smooth,
  Hausdorff, boundaryless manifolds with smooth metrics, `Φ(exp_p v) = exp_{Φ(p)}(dΦ_p v)` for every
  tangent vector v; HopfRinow Layer 4's transport across smooth Riemannian isometries). Only smooth
  maps are covered: neither the transport of the connection by a C¹ isometry nor the smoothness
  of such an isometry is supplied, and this roadmap uses neither.
- `TauCeti.Manifold.riemannianExp`, `TauCeti.Manifold.riemannianLog` and
  `TauCeti.Manifold.IsNormalDomain` (`TauCeti/Geometry/Manifold/Riemannian/Geodesic/Exponential.lean`
  and `…/Geodesic/Normal/Basic.lean`: the exponential map on its natural domain, the logarithm
  inverting it on a normal domain, and normal domains, that is open star-shaped neighbourhoods of 0
  in T_xM inside the domain of exp_x on which exp_x is a diffeomorphism onto its image), with
  `TauCeti.Manifold.exists_isNormalDomain_ball` (`…/Geodesic/Normal/Basic.lean`: some tangent
  ball of positive radius about 0 is a normal domain) and
  `TauCeti.Manifold.IsNormalDomain.image_riemannianExp_ball`
  (`…/Geodesic/Gauss/Distance.lean`: on a boundaryless manifold whose extended distance is the
  Riemannian one, exp_x maps the tangent ball of radius r inside a normal domain onto the metric ball
  B_r(x)). These are HopfRinow Layers 1–2 in Tau Ceti; 6.2's normal ball B_ρ₀(x) is the image of
  a tangent ball that is a normal domain.
- `CovariantDerivative.sectionalCurvature`
  (`TauCeti/Geometry/Manifold/VectorBundle/CovariantDerivative/Curvature/Sectional.lean`: for a
  metric connection, ⟨R(u, v)v, u⟩ divided by the Gram determinant of u, v, which is 0 when u, v are
  dependent) and the smoothness instance of the Levi-Civita connection
  (`…/CovariantDerivative/LeviCivita/Regularity.lean`); "sectional curvature at most κ" is this
  quotient at most κ for all pairs, which for κ ≥ 0 is the condition on independent pairs.
- `TauCeti.secondFundamentalForm` (`TauCeti/Analysis/InnerProductSpace/SecondFundamentalForm.lean`:
  for a map i from a finite-dimensional normed space into an inner product space, the normal
  component P_N(D²i(x)(v, w)) of its second derivative, symmetric and invariant under
  reparametrisation of the source) and `TauCeti.inducedRiemannianMetric`
  (`TauCeti/Geometry/Manifold/Riemannian/Induced.lean`: the metric g_x(v, w) = ⟨df_x v, df_x w⟩
  pulled back by an immersion f into an inner product space). In 5.1 for W ⊆ E and in 5.2 the
  second fundamental form is the former read in a C² parametrisation, and 5.2's induced metric is
  the latter.
- `TauCeti.CountablyRectifiable` (`TauCeti/Geometry/MeasureTheory/Rectifiable/Basic.lean`: a subset
  of an extended metric space is countably k-rectifiable when countably many Lipschitz maps from
  subsets of ℝ^k cover it up to a set that is null for the k-dimensional
  `MeasureTheory.Measure.euclideanHausdorffMeasure`; no measurability is part of the notion), with `TauCeti.CountablyRectifiable.mono`, `TauCeti.CountablyRectifiable.congr`
  (null modifications), `TauCeti.CountablyRectifiable.iUnion` and
  `TauCeti.CountablyRectifiable.image` (images under maps Lipschitz on the set). On (M, d_g) this
  is the countable k-rectifiability used throughout.

### From TauCetiRoadmap.GeometricMeasureTheory

G2: existence and a.e. uniqueness of approximate tangent planes for countably rectifiable sets of
locally finite Hᵏ measure in Euclidean space and measurability of the tangent-plane field,
tangential differentiation, the area formula with extended multiplicities and its tangential
version on rectifiable sets, agreement with classical tangent spaces and Jacobians on C¹ graphs.

### From TauCetiRoadmap.GeometricCurrents

- G1: the distributional constancy criterion on connected Euclidean open sets; mass measures of
  locally finite-mass currents.
- G2: the manifold/chart comparison for countable k-rectifiability (`TauCeti.CountablyRectifiable`
  for d_g) and approximate tangent planes on a Riemannian manifold, with the comparison of Hᵏ (for
  d_g) and the chart Hausdorff measures, representation independence under null changes; the
  integration current of a compact oriented smooth source under an isometric embedding, whose mass
  measure is its Riemannian volume (cited in 2.3 only as the case in which 2.3's weight identity
  agrees with it); integer-rectifiable and locally integral currents, represented by a countably
  k-rectifiable carrier, an orienting simple k-vector and an integer multiplicity.
- G5: local area minimization of integral currents (comparison with T + ∂Q on relatively compact
  variation domains), used only in 9.3.
- G6: the Grassmann bundle of unoriented k-planes of TM (orientation quotient of the oriented
  carrier, isometry independence), its compactness over compact base regions and the Radon
  compactness on it, consumed as: every sequence of Radon measures on the Grassmann bundle over W
  whose masses over each compact subset of W are bounded has a subsequence converging against every
  compactly supported continuous function; the auxiliary rectifiable varifold of an integral
  current with its weight, multiplicity, weak first variation under compactly supported ambient
  flows, monotonicity and tangent cones (used only in 9.3).

### From TauCetiRoadmap.RiemannianGeometry

- R4, item 1: on a smooth normal-distance domain, the Hessian of the distance function r from a
  point is zero radially and bounded below by `(s_κ'/s_κ)(g − dr ⊗ dr)` where the sectional
  curvature is at most κ (before the first positive zero of s_κ).
- R5a: the second fundamental form B, the normal connection, S_η, with the pinned signs, for smooth
  isometric immersions (5.1 uses the same formula for C² submanifolds as its own convention).
- R5a.2: the averaged mean curvature, minimality, the first volume variation
  `δVol = ∫ div_M X^⊤ − m⟨H, X^⊥⟩` for compactly supported variations of boundaryless immersions,
  and the sphere/Euclidean mean-curvature dictionary.

### From HopfRinow (Completed)

Layer 0 (the reconciled Riemannian distance and native `IsRiemannianManifold`), Layer 1 (local
existence and uniqueness of geodesics with given initial data, and the exponential map on its
natural domain) and Layer 2 (normal balls and the local logarithm, the
Gauss lemma, and the local distance identity d_g(x, exp_x v) = |v| on a normal ball).

No supplier contract is missing: every input above is stated by its owner.

## How to read the build

Layer 1 builds the Grassmann bundle in projection form, the varifold carrier and varifold
convergence. Layer 2 builds approximate tangent spaces of measures, rectifiable and integral
varifolds and the varifold of a submanifold. Layer 3 builds push-forward, dilations and
normal-coordinate blow-ups, tangent spaces with multiplicity, fibre measures and the first
rectifiability theorem. Layer 4 defines the first variation, proves that it is the derivative of
mass along flows, builds the Riesz representation for vector fields and the Riesz decomposition,
and proves the pointwise comparison of first variations for two metrics, which is the device by
which every Riemannian blow-up argument below reduces to a Euclidean one. Layer 5 computes the
first variation of submanifolds and compares the intrinsic theory on an embedded M ⊆ ℝ^L with the
ambient one. Layer 6 proves monotonicity, the density theorems, the constancy theorem and the
convex hull property. Layer 7 builds varifold tangents and proves the semicontinuity of lower
density bounds, Allard's
rectifiability theorem and the two compactness theorems, for metrics varying in C². Layer 8 shows
that varifold tangents are rectifiable or integral cones. Layer 9 defines regular and singular
sets, records locality and invariance under smooth isometries, identifies GeometricCurrents'
auxiliary varifold, and states two theorems of the literature in the language of the roadmap.
Proof sketches name a route and its inputs; an implementer who proves a target another way is not
bound to the route.

## Layer 1: the Grassmann bundle and the varifold carrier

### 1.1 The Grassmannian of a Euclidean space

For a finite-dimensional real inner product space E and an integer k ≥ 0, define the Grassmannian
G(E, k) = `Euclidean.grassmannian E k` as the set of continuous linear maps P : E → E that are
self-adjoint idempotents (`IsStarProjection`) whose range has dimension k, with the subspace
topology and the metric of the operator norm. The map S ↦ P_S = `Submodule.starProjection S` is a bijection from the
k-dimensional subspaces of E onto G(E, k), with inverse P ↦ range P
(`isStarProjection_iff_eq_starProjection_range`) (Simon1983 line 7295–7300, §38). For k > dim E no
subspace has dimension k and G(E, k) = ∅; this empty Grassmannian is the fibre of the target bundle
of a push-forward into a manifold of dimension below k (3.1). The statements below take
0 ≤ k ≤ dim E. The tangential trace of an endomorphism A of E along P is tr(P ∘ A).

- G(E, k) is compact: it is closed in `E →L[ℝ] E` and every element has norm at most 1 (norm 1
  when k ≥ 1).
- P ↦ 1 − P is a homeomorphism G(E, k) → G(E, dim E − k), the passage to orthogonal complements;
  for P ∈ G(E, k), tr P = k.
- A surjective linear isometry U : E → F induces the homeomorphism P ↦ U P U⁻¹ of G(E, k) onto
  G(F, k), functorial in U; in particular the orthogonal group of E acts continuously. Any linear
  isometry U : E → F has U*U = 1 and UU* the projection onto range U, and P ↦ U P U* is a
  homeomorphism of G(E, k) onto the closed subset of G(F, k) of projections whose range lies in
  range U (the image-plane map below for L = U); for k ≥ 1 this subset is all of G(F, k) only when
  U is surjective, and for k = 0 both sides are {0}.
- For each endomorphism A of E, P ↦ tr(P ∘ A) is continuous (indeed linear) on G(E, k), and
  |tr(P ∘ A)| ≤ k‖A‖.
- For a finite-dimensional real inner product space F, the pairs (L, P) of a linear map L : E → F
  and P ∈ G(E, k) with L injective on range P form an open set (empty when dim F < k), and on it
  the projection onto L(range P), an element of G(F, k), depends continuously on (L, P); L need not
  be injective on E.
  With Q = L ∘ P and Q* its adjoint, A = Q*Q + 1 − P preserves range P and ker P, is the identity on
  ker P and is invertible exactly when L is injective on range P (⟨Q*Qv, v⟩ = |Lv|² for v ∈ range P),
  and the projection is Q A⁻¹ Q*.
- Comparison with Tau Ceti's finite Grassmannian. Let N = dim E and let
  e : E → `EuclideanSpace ℝ (Fin N)` be a surjective linear isometry (the coordinates of an
  orthonormal basis of E). For S in `TauCeti.finiteGrassmannian ℝ k N` let P_S be the orthogonal
  projection of `EuclideanSpace ℝ (Fin N)` onto S read through the coordinate identification
  (`TauCeti.finiteGrassmannian.toEuclidean`). Then S ↦ e⁻¹ P_S e is a homeomorphism of
  `TauCeti.finiteGrassmannian ℝ k N` onto G(E, k), whose inverse sends P to the subspace e(range P)
  read in coordinates; replacing e by O ∘ e, for an orthogonal map O of `EuclideanSpace ℝ (Fin N)`,
  precomposes it with S ↦ O⁻¹(S). Route: e⁻¹ P_S e is a self-adjoint idempotent with the
  k-dimensional range e⁻¹(S); the map is continuous
  (`TauCeti.finiteGrassmannian.continuous_starProjection_toEuclidean`, and conjugation by e is
  continuous), injective (P_S has range S, and `TauCeti.finiteGrassmannian.toEuclidean_injective`)
  and onto (for P ∈ G(E, k), e P e⁻¹ is the orthogonal projection onto its k-dimensional range,
  `isStarProjection_iff_eq_starProjection_range`); a continuous bijection from the compact space
  `TauCeti.finiteGrassmannian ℝ k N` onto the metric space G(E, k) is a homeomorphism
  (`Continuous.homeoOfEquivCompactToT2`).

**Checks.**

- For the lines ℓ_θ of ℝ², `P_{ℓ_θ} − P_{ℓ_0} = sin θ · R` with R a symmetric orthogonal
  reflection, so `‖P_{ℓ_θ} − P_{ℓ_0}‖ = |sin θ|`; perpendicular lines are at distance 1, not √2.
- G(E, 0) = {0} and G(E, dim E) = {1}, and G(ℝ, 2) = ∅ (a self-adjoint idempotent of ℝ is 0 or 1,
  of rank 0 or 1); a definition requiring only `P ∘ P = P` would put the non-self-adjoint
  idempotents `[[1, t], [0, 0]]`, t ∈ ℝ, into G(ℝ², 1) and lose compactness.
- diag(1, 1, 0) belongs to G(ℝ³, 2) and not to G(ℝ³, 1): the rank condition is on the range, and
  its trace 2 is the dimension.
- Under the complement map, the line ℓ_0 of ℝ² goes to `ℓ_{π/2}`, and `tr(P_{ℓ_0} ∘ diag(a, b)) = a`.
- The inclusion U : ℝ → ℝ², t ↦ (t, 0), is a linear isometry that is not surjective: G(ℝ, 1) = {1}
  and `U 1 U* = diag(1, 0) = P_{ℓ_0}`, so the image misses `P_{ℓ_{π/2}} = diag(0, 1)` and U⁻¹ does not
  exist; for a rotation R_φ of ℝ², `R_φ P_{ℓ_θ} R_φ⁻¹ = P_{ℓ_{θ+φ}}` reaches every line. For k = 0 the
  same U gives U 0 U* = 0, and G(ℝ, 0) = G(ℝ², 0) = {0}: the image is all of G(ℝ², 0) although U is
  not surjective, so surjectivity is forced by the image only for k ≥ 1.
- For L_s = diag(1, s) on ℝ², L_s(ℓ_θ) is spanned by (cos θ, s sin θ): along s = 0, θ → π/2 the image
  line is ℓ_0 and along θ = π/2, s → 0 it is `ℓ_{π/2}`, so the image-plane projection has no
  continuous extension to `(diag(1, 0), P_{ℓ_{π/2}})`, where L kills the line. At `(diag(1, 0), P_{ℓ_0})`
  the map is not injective on ℝ² but is injective on ℓ_0: the pair lies in the open set, A = 1 and
  `Q A⁻¹ Q* = P_{ℓ_0}`, so a hypothesis "L injective on E" would exclude a pair that 3.1 uses.
- The comparison with `TauCeti.finiteGrassmannian ℝ 1 2`, for E = `EuclideanSpace ℝ (Fin 2)` and
  e = id: the span of the frame (cos θ, sin θ) goes to the matrix with rows (cos²θ, cos θ sin θ) and
  (cos θ sin θ, sin²θ), which is `P_{ℓ_θ}`, so both carriers are the same circle of lines; with e the
  rotation by φ the same span goes to `P_{ℓ_{θ−φ}}`. The span of the frame (1, 1) goes to
  `½[[1, 1], [1, 1]] = P_{ℓ_{π/4}}`, whereas the frame's own outer product [[1, 1], [1, 1]] squares to
  twice itself: a model sending a frame F to F F* without normalising depends on the frame and
  leaves G(ℝ², 1). For k = 0 and k = N both sides are one point, {0} against the zero subspace and
  {1} against the whole space.

(Simon1983 line 7295–7305.) *Needs:* Mathlib `IsStarProjection`, `Submodule.starProjection`,
`isStarProjection_iff_eq_starProjection_range`, `Continuous.homeoOfEquivCompactToT2`; Tau Ceti
`TauCeti.finiteGrassmannian` with its `CompactSpace` instance,
`TauCeti.finiteGrassmannian.toEuclidean`, `TauCeti.finiteGrassmannian.toEuclidean_injective` and
`TauCeti.finiteGrassmannian.continuous_starProjection_toEuclidean` (the comparison only).

### 1.2 The Grassmann bundle of a Riemannian manifold

Define G_k(W) as the set of pairs (x, P) with x ∈ W and P ∈ G(T_xM, k) for the inner product g_x,
a subset of the total space of the endomorphism bundle of TM over W with the subspace topology,
and π(x, P) = x; for W = M this is `grassmannBundle I M k`, with its Borel σ-algebra
(`grassmannBundle.instMeasurableSpace`; it is a Borel space by definition). For M = E with the flat
metric, G_k(W) is W × G(E, k) with the product topology
(Simon1983 line 7301–7305; AgnolettoCorreaHoyosDaSilvaNardulli2025 line 151–156). Prove:

- π is continuous, open and proper, with fibre G(T_xM, k) over x; G_k(K) = π⁻¹(K) is compact for
  each compact K ⊆ W; G_k(W) is locally compact, Hausdorff, second countable and metrizable, hence
  σ-compact.
- A g-orthonormal frame on an open U ⊆ W gives a homeomorphism G_k(U) ≅ U × G(ℝ^N, k)
  commuting with π; G_k(W') = π⁻¹(W') is open in G_k(W) for open W' ⊆ W.
- The map sending an unoriented plane S of GeometricCurrents G6's Grassmann bundle over W to
  (x, P_S) is a homeomorphism onto G_k(W) commuting with the projections; through it G6's
  compactness over compact base regions gives the properness of π, and G6's Radon compactness is
  transported to G_k(W) (used in 1.4).
- An isometry f from an open set of (M, g) onto an open set of (M', g') (a C¹ diffeomorphism with
  f*g' = g, so that each `df_x : T_xM → T_{f(x)}M'` is a surjective linear isometry, 1.1) induces the
  homeomorphism (x, P) ↦ (f(x), df_x P df_x⁻¹), functorial in f.
- For two Riemannian metrics g, h on W, the canonical homeomorphism G_k^g(W) → G_k^h(W) sends
  (x, P^g_S) to (x, P^h_S) for every subspace S; it is the identity when h = c²g with c > 0
  constant.

**Checks.**

- For M = ℝ² and k = 1, G_1(W) = W × ℝP¹ with ℝP¹ the circle of 1.1; for the round sphere S², the
  bundle G_1(S²) is compact (S² is compact and π is proper) although TS² is not trivial.
- For k = 0 and k = N the bundle is identified with W by x ↦ (x, 0) and x ↦ (x, 1).
- For h = diag(1, 4) on ℝ² and u = (1, 1), the h-orthogonal projection onto span(u) sends e_1 to
  u/5 and the Euclidean one sends e_1 to u/2: the presentation depends on the metric, and the
  canonical homeomorphism is not the identity on projections; for h = 4g it is.

(Simon1983 line 7301–7305; AgnolettoCorreaHoyosDaSilvaNardulli2025 line 151–156.) *Needs:*
Layer 1.1; GeometricCurrents G6 (Grassmann bundle, compactness over compact base regions, Radon
compactness); Mathlib `IsRiemannianManifold`.

### 1.3 Varifolds, weight, mass, support and restriction

A k-varifold on W is a Radon measure V on G_k(W). Its weight ‖V‖ is the push-forward π_*V, a
Radon measure on W because π is proper (`weight` on (M, g), `Euclidean.weight` for W ⊆ E, where it
is read as a measure on E carried by W); its mass is 𝐌(V) = V(G_k(W)) = ‖V‖(W) ∈ [0, ∞]; spt‖V‖ is
the support of ‖V‖ (`MeasureTheory.Measure.support`), a closed subset of W. For a Borel set A ⊆ W, V⌞A is the restriction of V to
G_k(A); for an open W' ⊆ W the restriction of V to G_k(W') is a varifold on W' (Simon1983 line
7308–7317; AgnolettoCorreaHoyosDaSilvaNardulli2025 line 157–160).

- Varifolds form a cone under addition and multiplication by nonnegative reals; the Dirac
  varifold `δ_{(x,P)}` has weight δ_x.
- Extensionality: two varifolds on W are equal when their integrals of every compactly supported
  continuous function on G_k(W) agree.
- ∫ φ d‖V‖ = ∫ φ ∘ π dV for every nonnegative Borel φ on W; ‖V⌞A‖ = ‖V‖⌞A.
- V is carried by G_k(spt‖V‖): V(G_k(W ∖ spt‖V‖)) = 0.
- Restriction to open sets is transitive and commutes with sums, with ⌞A, and with weights; a
  varifold is determined by its restrictions to the sets of an open cover. For open W' ⊆ W the
  weight of the restriction V' of V to G_k(W') is ‖V‖ restricted to W', so spt‖V'‖ = spt‖V‖ ∩ W',
  the support being taken in W'.

**Checks.**

- The weight does not determine the varifold: on ℝ² with k = 1, H¹ on the x-axis lifted with the
  horizontal plane and the same measure lifted with the vertical plane have equal weights, and the
  test function χ(x)·tr(P ∘ diag(1, 0)) integrates to ∫χ dH¹ for the first and to 0 for the second.
- The horizontal lift of H¹⌞(x-axis) has mass 2 on the open unit disc.
- `spt‖δ_{(x,P)}‖ = {x}`; V⌞∅ = 0 and V⌞W = V.
- The horizontal lift of H¹⌞([0, 1] × {0}) restricted to the open disc W' of radius ½ about 0 has
  support [0, ½) × {0} = spt‖V‖ ∩ W', closed in W' but not in ℝ²: the support of a restriction is
  relative to W', and its closure in ℝ² would add the point (½, 0) outside W'.

(Simon1983 line 7308–7317; Allard1972 Section 3.) *Needs:* Layer 1.2; Mathlib `Measure.map`,
`MeasureTheory.Measure.ext_of_integral_eq_on_compactlySupported`,
`Regular.of_sigmaCompactSpace_of_isLocallyFiniteMeasure`.

### 1.4 Varifold convergence and compactness

A sequence V_j of varifolds on W converges to a varifold V when ∫ f dV_j → ∫ f dV for every
compactly supported continuous f on G_k(W) (`VarifoldTendsto`; Simon1983 line 7336–7338 and
7739–7740). Prove:

- Limits are unique; V_j → V implies ‖V_j‖ → ‖V‖ against compactly supported continuous functions
  on W.
- For compact C and open O in G_k(W), lim sup V_j(C) ≤ V(C) and lim inf V_j(O) ≥ V(O); the same
  holds for the weights on W; V_j(B) → V(B) for relatively compact Borel B with V(∂B) = 0.
- A convergent sequence has locally bounded mass: sup_j ‖V_j‖(K) < ∞ for every compact K ⊆ W.
- Compactness: every sequence with sup_j ‖V_j‖(K) < ∞ for each compact K ⊆ W has a convergent
  subsequence (GeometricCurrents G6's Radon compactness, through 1.2; Simon1983 line 1038–1045,
  Theorem 4.4).
- Convergence commutes with restriction to open W' ⊆ W and is local: convergence on every set of
  an open cover implies convergence.

**Checks.**

- `δ_{(1/j, P)} → δ_{(0,P)}` on ℝ, and not to `δ_{(0,P')}` for P' ≠ P in higher dimension.
- `δ_{(j e_1, P)} → 0` on ℝ^N: the masses are 1 and the limit has mass 0, so mass is only lower
  semicontinuous on open sets.
- The horizontal and vertical lifts of H¹⌞(x-axis) alternate along a sequence with constant
  weights and no varifold limit; varifolds of lines through 0 at angles θ_j → θ converge to the
  varifold of the line at angle θ.
- `j·δ_{(0,P)}` has no convergent subsequence: the local mass bound is necessary.

(Simon1983 line 1038–1045, 7336–7340.) *Needs:* Layer 1.3; GeometricCurrents G6 (Radon
compactness); route of the compactness through Tau Ceti
`TauCeti.isCompact_closure_of_isTightMeasureSet_of_mass_le` on a compact exhaustion with a
diagonal argument.

### Examples

The circle of lines of ℝ² as G(ℝ², 1) and as `TauCeti.finiteGrassmannian ℝ 1 2`; the bundle
G_1(S²); a weight shared by two varifolds; a sequence losing its mass at infinity.

### Dependencies

Mathlib; Tau Ceti finite Grassmannians (`TauCeti.finiteGrassmannian`, 1.1) and
`TauCeti.isCompact_closure_of_isTightMeasureSet_of_mass_le` (1.4); GeometricCurrents G6; nothing
earlier in this roadmap.

## Layer 2: rectifiable and integral varifolds

### 2.1 Approximate tangent spaces of measures and the rectifiability criterion

For a Radon measure μ on W, x ∈ W and λ > 0, let `μ_{x,λ}` be the measure on T_xM given by
`μ_{x,λ}(A) = λ^{−k} μ(exp_x(λA))` for Borel A contained in λ⁻¹ times a normal ball of x (in E,
`μ_{x,λ}(A) = λ^{−k} μ(x + λA)`). A k-plane T ⊆ T_xM is the approximate tangent space of μ at x
with multiplicity θ ∈ (0, ∞) when `μ_{x,λ} → θ Hᵏ⌞T` against compactly supported continuous functions
on T_xM as λ ↓ 0 (Simon1983 line 2352–2362, 11.8).

- Rectifiability criterion: if μ has an approximate tangent space with multiplicity θ(x) ∈ (0, ∞)
  at μ-a.e. x, then Γ = {x : such T and θ(x) exist} is Hᵏ-measurable and countably k-rectifiable,
  θ (extended by 0) is Hᵏ-measurable and locally Hᵏ-integrable on Γ, and μ = θ Hᵏ⌞Γ (Simon1983
  line 2352–2364, Theorem 11.8).
- Converse: for Γ countably k-rectifiable and Hᵏ-measurable and θ > 0 locally Hᵏ-integrable on Γ,
  the measure θ Hᵏ⌞Γ has approximate tangent space T_xΓ with multiplicity θ(x) at Hᵏ-a.e. x ∈ Γ
  (Simon1983 line 2276–2301 and 2365–2374, 11.4–11.6, 11.9).
- Chart comparison: for a chart φ at x, μ has approximate tangent space T with multiplicity θ at x
  if and only if φ_*μ has the Euclidean approximate tangent space dφ_x(T) with multiplicity
  θ / J_T(dφ_x) at φ(x), J computed with g_x and the Euclidean inner product.
- Uniqueness: the approximate tangent space and multiplicity at a point are unique when they exist.

The criterion on a manifold follows from the Euclidean criterion through the chart comparison and
GeometricCurrents G2's chart comparison of rectifiable sets and Hᵏ; the converse is
GeometricMeasureTheory G2's existence of approximate tangent planes combined with approximate
continuity of θ.

**Checks.**

- μ = H¹⌞L for the x-axis L of ℝ² has approximate tangent space L with multiplicity 1 at every
  point of L, and 2H¹⌞L has multiplicity 2; since μ(x + λB_1(0)) = 2λ for x ∈ L, a normalisation
  by λ⁻ᵏ⁺¹ instead of λ⁻ᵏ would give λ⁰·2λ → 0, multiplicity 0 for both, and one by
  λ⁻ᵏ⁻¹ would give λ⁻²·2λ = 2/λ → ∞, blow-ups that diverge.
- Lebesgue measure on ℝ² with k = 1 has `μ_{x,λ}(B_1(0)) = πλ → 0`, so no approximate tangent line
  exists anywhere and the criterion does not apply.
- For k = 1, δ_0 on ℝ² has `μ_{0,λ}(B_1(0)) = λ⁻¹ → ∞`: no approximate tangent line at 0.
- Chart comparison: for φ(y) = 2y on ℝ² and μ = H¹⌞L, φ_*μ = ½ H¹⌞L, with multiplicity
  1/J_L(2·id) = 1/2.

(Simon1983 line 2276–2374; Federer1969 3.2; Maggi2012 Part II.) *Needs:* GeometricMeasureTheory G2
(approximate tangent planes of rectifiable sets, area formula); GeometricCurrents G2 (chart
comparison of rectifiable sets and Hᵏ); Tau Ceti `TauCeti.CountablyRectifiable`; Mathlib
`Besicovitch.ae_tendsto_rnDeriv`; HopfRinow Layer 2 (normal balls).

### 2.2 Rectifiable and integral varifolds

For Γ ⊆ W countably k-rectifiable and Hᵏ-measurable and θ : Γ → (0, ∞) locally Hᵏ-integrable,
define v(Γ, θ) as the varifold `A ↦ ∫_{Γ*} 1_A(x, T_xΓ) θ(x) dHᵏ(x)`, where Γ* is the set of points of
Γ at which the approximate tangent space T_xΓ of θHᵏ⌞Γ exists (an Hᵏ-full subset of Γ, 2.1). A
varifold is rectifiable when it equals some v(Γ, θ), and integral when moreover θ can be taken
integer-valued Hᵏ-a.e. (Simon1983 line 2861–2897, 7318–7326; AgnolettoCorreaHoyosDaSilvaNardulli2025
line 166–175).

- ‖v(Γ, θ)‖ = θ Hᵏ⌞Γ and 𝐌(v(Γ, θ)) = ∫_Γ θ dHᵏ.
- Vanishing off the carrier: `Θ^{*k}(‖v(Γ, θ)‖, x) = 0` for Hᵏ-a.e. x ∈ W ∖ Γ (Simon1983 line
  774–788, 3.5, a theorem on any metric space, applied on (W, d_g) to θHᵏ⌞(Γ ∩ K) for compact
  K ⊆ W; its proof rests on the covering lemma of Simon1983 line 632–640, 3.3, which is Mathlib's
  `Vitali.exists_disjoint_subfamily_covering_enlargement`).
- v(Γ, θ) = v(Γ', θ') when Hᵏ(Γ Δ Γ') = 0 and θ = θ' Hᵏ-a.e. on Γ ∩ Γ'; the approximate tangent
  spaces of Γ and Γ' agree Hᵏ-a.e. on Γ ∩ Γ'.
- v(Γ, θ) + v(Γ', θ') = v(Γ ∪ Γ', θ + θ') with θ, θ' extended by 0; v(Γ, θ)⌞A = v(Γ ∩ A, θ).
- Characterisation: V is rectifiable if and only if ‖V‖ = θHᵏ⌞Γ for some such Γ, θ and
  `V = ∫ δ_{(x, T_xΓ)} d‖V‖(x)`; integral varifolds are closed under addition.
- For k = 0, countably 0-rectifiable sets are countable sets, H⁰ is counting measure, and
  `v(Γ, θ) = Σ_{x∈Γ} θ(x) δ_{(x,0)}`.
- Characterisation by C¹ pieces: a varifold V is rectifiable if and only if there are countably
  many open sets U_j ⊆ ℝ^k, injective C¹ immersions f_j : U_j → W and a function
  θ : W → [0, ∞] with ‖V‖ = θ Hᵏ⌞(⋃_j f_j(U_j)) and such that for V-a.e. (x, S) there are j and
  t ∈ U_j with f_j(t) = x and S = df_j(t)(ℝ^k); V is integral if and only if moreover θ can be
  taken with values in ℕ. On (M, g) these are `IsRectifiable` and `IsIntegral`, and for W ⊆ E
  `Euclidean.IsRectifiable` and `Euclidean.IsIntegral`. Route: a countably k-rectifiable set lies,
  up to an Hᵏ-null set, in countably many embedded C¹ k-submanifolds (Simon1983 line 2204–2207,
  11.1, in Euclidean charts and through GeometricCurrents G2's chart comparison on M), each the
  union of countably many images f_j(U_j); by the third bullet, applied to Γ and to f_j(U_j), the
  approximate tangent space of Γ is df_j(t)(ℝ^k) at Hᵏ-a.e. point f_j(t) of Γ ∩ f_j(U_j), and where
  two pieces meet their tangent planes agree Hᵏ-a.e., so the choice of j does not matter
  ‖V‖-almost everywhere. Conversely, Γ = {θ > 0} ∩ ⋃_j f_j(U_j) is countably k-rectifiable and the
  same agreement gives V = v(Γ, θ).

**Checks.**

- v(L, 1) for a line L of ℝ² is integral; v(L, 1/2) is rectifiable and not integral.
- The C¹-piece form excludes the vertical lift V of H¹⌞(x-axis) on ℝ²: a family of pieces with
  ‖V‖ = θH¹⌞(⋃ f_j(U_j)) must cover the axis up to an H¹-null set, and at H¹-a.e. point of the axis
  the tangent line of every piece through it is the axis itself, while V-a.e. plane is vertical. A
  definition that asked only for ‖V‖ = θHᵏ⌞Γ with Γ rectifiable would admit this V.
- For k ≥ 1 the Dirac varifold `δ_{(0,P)}` is not rectifiable: δ_0 is not of the form θHᵏ⌞Γ,
  since Hᵏ({0}) = 0. The figure-eight image of 2.3's Checks is covered by two injective
  immersions of open intervals whose images meet only at the crossing point, an H¹-null set, so
  v(image, 1) satisfies the C¹-piece form with θ = 1.
- For k ≥ 1 and Γ countable, Hᵏ(Γ) = 0 and v(Γ, θ) = 0.
- Lebesgue measure on ℝ² lifted with the horizontal plane is a 1-varifold that is not rectifiable:
  its weight has no approximate tangent line (2.1).
- For two lines L_1, L_2 crossing at 0, v(L_1 ∪ L_2, 1) = v(L_1, 1) + v(L_2, 1): the crossing point
  is Hᵏ-null.
- For V = v((0, 1) × {0}, 1) on ℝ², the endpoints (0, 0) and (1, 0) lie off Γ and
  ‖V‖(B_ρ((0, 0))) = ρ for ρ < 1, so their density is ρ/(ω_1 ρ) = ½; every point at positive
  distance from [0, 1] × {0} has upper density 0. The vanishing off the carrier holds off an
  H¹-null set, not at every point of W ∖ Γ.

(Simon1983 line 774–788, 2204–2207, 2861–2897, 7318–7326.) *Needs:* Layer 1.3, Layer 2.1;
GeometricMeasureTheory G2; GeometricCurrents G2; Tau Ceti `TauCeti.CountablyRectifiable` and its
closure lemmas; Mathlib `Vitali.exists_disjoint_subfamily_covering_enlargement`.

### 2.3 The varifold of a C¹ submanifold

For a C¹ embedded k-submanifold Σ ⊆ W with Hᵏ(Σ ∩ K) < ∞ for every compact K ⊆ W, define
[Σ] = v(Σ, 1) (Simon1983 line 2861–2867; EdelenSpolaor2023 line 130–131 uses the term
multiplicity one). Σ need not be closed in W.

- The approximate tangent space of Hᵏ⌞Σ exists at every x ∈ Σ and is the classical tangent space
  T_xΣ; hence `[Σ] = ∫_Σ δ_{(x, T_xΣ)} dHᵏ(x)`.
- ‖[Σ]‖ = Hᵏ⌞Σ, which is the Riemannian volume `TauCeti.riemannianVolume` of Σ with the induced
  metric, pushed into W (this roadmap). The induced metric of a C¹ submanifold is continuous, and a
  C¹ manifold with a continuous metric is all `TauCeti.riemannianVolume` needs; Σ may be
  non-compact and non-orientable.
- spt‖[Σ]‖ is the closure of Σ in W; [Σ ∪ Σ'] = [Σ] + [Σ'] for disjoint Σ, Σ' whose union is a C¹
  embedded submanifold; for k = N, [W] has weight the Riemannian volume of W.

Route for the weight: by `TauCeti.eq_riemannianVolume_iff` it suffices that the two measures agree
on the chart sources of Σ, and two measures that agree on the sets of a countable open cover of a
chart source agree on it, so it suffices to compare them on small chart sources. On such a source,
inside a chart φ of W, φ(Σ) is the image of the injective C¹ map ψ = φ ∘ (chart of Σ)⁻¹ from an open
set of ℝ^k, Lipschitz on compact sets. GeometricMeasureTheory G2's area formula (injective case)
gives the Euclidean Hᵏ of ψ(A) as ∫_A Jψ dt with Jψ = normDet(Dψ); GeometricCurrents G2's chart
comparison of Hᵏ for d_g with the chart Hausdorff measure multiplies it at y = ψ(t) by the
Jacobian of the identity of T_yφ(Σ) from the Euclidean inner product to φ_*g; by
`LinearMap.normDet_comp` the product is √det(ψ^*φ_*g)(t), the density of the chart volume of the
induced metric. For a compact oriented smooth Σ the identity agrees with GeometricCurrents G2's
identification of the mass measure of the integration current of Σ with its Riemannian volume.

**Checks.**

- The unit circle of ℝ² gives a varifold of mass 2π with support the circle.
- For Σ the graph of `t ↦ |t|^{3/2}` over (−1, 1), closed in W = (−1, 1) × ℝ (C¹ and not C², not
  compact), the induced metric in the chart t is (1 + (9/4)|t|) dt², continuous and not C¹, and
  both sides of the weight identity give H¹(Σ) = ∫₋₁¹ √(1 + (9/4)|t|) dt = (26√13 − 16)/27 ≈
  2.879, more than the length 2√2 of the inscribed polygon through (−1, 1), (0, 0), (1, 1); a weight
  identity proved only for compact or smooth Σ would not reach this Σ.
- For the open half-line Σ = (0, ∞) × {0} in W = ℝ², spt‖[Σ]‖ = [0, ∞) × {0} ≠ Σ.
- The image of a figure-eight curve is not an embedded submanifold at its crossing point, so [·] is
  not defined there, while v(image, 1) is a rectifiable varifold whose crossing point is H¹-null.

(Simon1983 line 2861–2867, 1855–1859.) *Needs:* Layer 2.2; GeometricMeasureTheory G2 (area formula,
injective case; agreement with C¹ graphs); GeometricCurrents G2 (chart comparison of Hᵏ); Tau Ceti
`TauCeti.riemannianVolume`, `TauCeti.eq_riemannianVolume_iff`; Mathlib `LinearMap.normDet_comp`.

### Examples

Lines with constant and fractional multiplicity; the unit circle; a half-line and its closure; a
non-rectifiable lift of Lebesgue measure.

### Dependencies

Layer 1; GeometricMeasureTheory G2; GeometricCurrents G2; Tau Ceti `TauCeti.CountablyRectifiable`,
`TauCeti.riemannianVolume` and `TauCeti.eq_riemannianVolume_iff`; Mathlib Besicovitch
differentiation (`Besicovitch.ae_tendsto_rnDeriv`), the Vitali covering lemma
(`Vitali.exists_disjoint_subfamily_covering_enlargement`) and `LinearMap.normDet_comp`; HopfRinow
Layer 2.

## Layer 3: push-forward, blow-ups and tangent spaces

### 3.1 Push-forward

Let W ⊆ M, W' ⊆ M' be open subsets of Riemannian manifolds, V a varifold on W and f : W → W' a C¹
map whose restriction to spt‖V‖ is proper (f⁻¹(K) ∩ spt‖V‖ is compact for each compact K ⊆ W').
Define f_#V(A) = ∫ 1_A(f(x), df_x(S)) J_S f(x) dV(x, S), the integrand being taken as 0 where
J_S f(x) = 0; in projection form `(x, P) ↦ (f(x), P_{df_x(range P)})` is continuous on the open set
{J_S f(x) ≠ 0}, where df_x is injective on S = range P (1.1's image-plane continuity, in orthonormal
frames) (Simon1983 line 7443–7454, 39.1; AgnolettoCorreaHoyosDaSilvaNardulli2025 line
188–195). No bound on dim M' is assumed: if dim M' < k, then df_x is injective on no k-plane,
J_S f ≡ 0, every G(T_yM', k) is empty (1.1), so G_k(W') = ∅ and f_#V = 0, the only k-varifold on
W'; for dim M' ≥ k this case does not arise.

- f_#V is a varifold on W'; `‖f_#V‖(A) = ∫_{π⁻¹f⁻¹(A)} J_S f(x) dV(x, S)`; spt‖f_#V‖ ⊆ f(spt‖V‖), with
  equality when f is an immersion.
- id_# V = V, and (h ∘ f)_# V = h_#(f_#V) when f is proper on spt‖V‖ and h on f(spt‖V‖) (chain rule
  `J_S(h ∘ f)(x) = J_{df_x S} h(f(x)) · J_S f(x)`).
- For an isometry f of W onto W' (1.2), J_S f = 1 and f_#V is the measure push-forward along 1.2's
  homeomorphism; for an isometric immersion f (each df_x a linear isometry, as for the inclusion of
  5.2), J_S f = 1 and f_#V is the measure push-forward along (x, P) ↦ (f(x), df_x P df_x*) (1.1).
- `‖f_#V‖(A) ≤ (sup_{f⁻¹(A) ∩ spt‖V‖} ‖df‖)^k ‖V‖(f⁻¹(A))`.
- If f is proper on a closed set F containing spt‖V_j‖ for all j and spt‖V‖, then V_j → V implies
  f_#V_j → f_#V. For φ compactly supported and continuous on G_k(W'), the integrand
  (x, S) ↦ J_S f(x) φ(f(x), df_x(S)) is continuous where J_S f(x) ≠ 0 and extends continuously by 0
  to {J = 0}; on G_k(F) it vanishes outside the compact set G_k(f⁻¹(π(spt φ)) ∩ F), so its product
  with χ ∘ π, for χ compactly supported and continuous on W and equal to 1 on f⁻¹(π(spt φ)) ∩ F, is
  a test function with the same integral against every V_j and V (each is carried by G_k(F), 1.3).
- Rectifiable varifolds: f_#v(Γ, θ) = v(f(Γ⁺), θ_f), where `Γ⁺ = {x ∈ Γ : J_{T_xΓ} f(x) > 0}` and
  `θ_f(y) = Σ_{x ∈ Γ⁺ ∩ f⁻¹(y)} θ(x)`, locally Hᵏ-integrable on f(Γ⁺); integral varifolds go to
  integral varifolds; for injective f, θ_f = θ ∘ f⁻¹; f_#[Σ] = [f(Σ)] for a C¹ embedding f proper
  on the closure of Σ in W.

The rectifiable formula is the tangential area formula of GeometricMeasureTheory G2 in charts,
transported by GeometricCurrents G2's chart comparison and the chain rule for J.

**Checks.**

- For f(y) = 2y on ℝ² and V = v([0, 1] × {0}, 1), f_#V = v([0, 2] × {0}, 1) of mass 2; the measure
  push-forward without the Jacobian would have mass 1.
- For f(y) = (y_1, 0) and V = v({0} × [0, 1], 1), J vanishes on the support and f_#V = 0; a
  definition ignoring J = 0 would place an atom at the origin.
- For f(t) = t² on ℝ and V = v([−1, 1], 1), f_#V = v([0, 1], 2): each s ∈ (0, 1] has the two
  preimages ±√s, consistent with ∫ φ(t²)|2t| dt = 2∫_0^1 φ.
- A target of dimension below k: for f(y) = y_1 from ℝ² to ℝ, k = 2 and V = v(D, 1) with D the open
  unit disc, normDet(df_x : ℝ² → ℝ) = 0 at every x and G_2(ℝ) = ∅, so f_#V = 0. A model that
  dropped the Jacobian and recorded the image subspace df_x(ℝ²) = ℝ would produce the measure on
  G_1(ℝ) with weight 2√(1 − t²) dt on (−1, 1), of mass π: a 1-varifold, not a push-forward of the
  2-varifold V.
- For `V = Σ_{j∈ℤ} v({j} × [0, 1], 1)` on ℝ² and f(y) = (0, y_2), f is not proper on spt‖V‖ and the
  formula would give infinite mass to the segment {0} × [0, 1]: properness is necessary.

(Simon1983 line 7443–7454, 2903–2933; Federer1969 3.2; Allard1972 Section 3.) *Needs:* Layer 1.1–1.4, Layer 2.2; Mathlib
`LinearMap.normDet`; GeometricMeasureTheory G2 (area formula); GeometricCurrents G2 (chart
comparison).

### 3.2 Dilations and normal-coordinate blow-ups

In E, `V_{x,λ} = (η_{x,λ})_#V` is a varifold on `η_{x,λ}(W)`; read as a measure on G_k(E) = E × G(E, k)
carried by `η_{x,λ}(W)` (finite on the compact subsets of `η_{x,λ}(W)`, which exhaust E as λ ↓ 0 when
x ∈ W), it is `Euclidean.blowUp` evaluated at V, x and λ. On M, for r at most the normal radius of
x with B_r(x) ⊆ W, `V_{x,λ} = (β_{x,λ})_#(V⌞B_r(x))` is a varifold on the ball of radius r/λ of the
Euclidean space (T_xM, g_x); for every compact set of T_xM it does not depend on r once λ is small
(Simon1983 line 7336–7338; 3407–3413).

- Scaling law in E: `dη_{x,λ} = λ⁻¹·id` preserves planes and J = λ⁻ᵏ, so `V_{x,λ}` = λ⁻ᵏ times the
  measure push-forward along `(y, P) ↦ (η_{x,λ}(y), P)`; `‖V_{x,λ}‖(A) = λ^{−k}‖V‖(x + λA)`;
  `(η_{x,λ})_# v(Γ, θ) = v(η_{x,λ}(Γ), θ ∘ η_{x,λ}⁻¹)`; `(V_{x,λ})_{0,μ} = V_{x,λμ}`.
- On M: `J_S β_{x,λ}(y) = λ^{−k}(1 + o(1))` uniformly in S as y → x, and geodesic balls about x are
  the images of Euclidean balls (HopfRinow Layer 2), so `‖V_{x,λ}‖(B_ρ(0)) = λ^{−k}(1 + o(1))‖V‖(B_{λρ}(x))`
  as λ ↓ 0, for fixed ρ.
- `V ↦ V_{x,λ}` is continuous for varifold convergence, and commutes with sums and restriction.

**Checks.**

- For V = v([0, 1] × {0}, 1) in ℝ², `V_{0,λ} = v([0, λ⁻¹] × {0}, 1)` of mass λ⁻¹ = λ⁻ᵏ 𝐌(V) with
  k = 1; the measure push-forward without the factor λ⁻ᵏ would keep mass 1.
- For a line L through x in E, `V_{x,λ} = v(L − x, 1)` for all λ.
- On the unit sphere S² with x the north pole and V the varifold of a great circle through x,
  exp_x⁻¹ is an isometry of the circle onto a diameter of the normal disc, so
  `‖V_{x,λ}‖(B_ρ(0)) = 2ρ` exactly for λρ < π.

(Simon1983 line 7336–7338, 3407–3413.) *Needs:* Layer 3.1; HopfRinow Layers 1–2 (exponential map,
normal balls, local distance identity).

### 3.3 Tangent spaces with multiplicity, fibre measures and the first rectifiability theorem

V has tangent space T ∈ G(T_xM, k) with multiplicity θ ∈ (0, ∞) at x when `V_{x,λ} → θ v(T, 1)` as
λ ↓ 0, as varifolds on T_xM (Simon1983 line 7333–7338, 38.1).

- If V has tangent space T with multiplicity θ at x, then ‖V‖ has approximate tangent space T with
  multiplicity θ at x (Simon1983 line 7339–7341, 38.2); tangent spaces and multiplicities are
  unique.
- Fibre measures: there is a ‖V‖-measurable family x ↦ ν^x of Borel probability measures on
  G(T_xM, k), unique ‖V‖-a.e., with ∫ f dV = ∫∫ f(x, S) dν^x(S) d‖V‖(x) for every nonnegative Borel
  f. In E, for ‖V‖-a.e. x and every compactly supported continuous f on G_k(W),
  `‖V‖(B_ρ(x))⁻¹ ∫_{G_k(B_ρ(x))} f dV → ∫ f(x, S) dν^x(S)` as ρ ↓ 0 (Simon1983 line 7352–7368, 38.4);
  on M the same limit holds at ‖V‖-a.e. point of the (Borel) set D where Θ^k(‖V‖, x) exists and
  lies in (0, ∞).
- First rectifiability theorem: if V has a tangent space T_x with multiplicity θ(x) ∈ (0, ∞) at
  ‖V‖-a.e. x, then Γ = {x : T_x and θ(x) exist} is Hᵏ-measurable and countably k-rectifiable,
  θ is locally Hᵏ-integrable on Γ, and V = v(Γ, θ) (Simon1983 line 7342–7349, 38.3).
- Conversely v(Γ, θ) has tangent space T_xΓ with multiplicity θ(x) at Hᵏ-a.e. x ∈ Γ.

The fibre measures come from `MeasureTheory.Measure.condKernel` in g-orthonormal trivialisations
(1.2) of the finite restrictions of V to compact sets; the ball limits come from
`VitaliFamily.ae_tendsto_average` for `Besicovitch.vitaliFamily` in E. On M they come from
`VitaliFamily.ae_tendsto_average` for `Vitali.vitaliFamily` on a Borel set D' ⊆ D with
‖V‖(D ∖ D') = 0, with the distance min(d_g, 1) (same small balls as d_g) and the measure ‖V‖⌞D',
where every point x of D' is a density point of D for geodesic balls:
‖V‖(B̄_r(x) ∖ D) = o(‖V‖(B̄_r(x))) as r ↓ 0. Such a D' exists: in a chart,
`Besicovitch.ae_tendsto_measure_inter_div_of_measurableSet` for the image of ‖V‖ makes ‖V‖-a.e.
x ∈ D a density point of D for chart balls; for a constant c ≥ 1 and small r, the geodesic ball
B̄_r(x) lies in the chart ball of radius cr, which lies in `B̄_{c²r}(x)`, and
`‖V‖(B̄_{c²r}(x)) ≤ (c^{2k} + 1)‖V‖(B̄_r(x))` because Θ^k(‖V‖, x) ∈ (0, ∞). At x ∈ D' the ratio
(‖V‖⌞D')(B̄₃ᵣ(x)) / (‖V‖⌞D')(B̄_r(x)) tends to 3^k, so the doubling hypothesis holds with
C = 3^k + 1 for every small r; the averages over B̄_r(x) ∩ D' and over B̄_r(x) differ by o(1)
because the integrand y ↦ ∫ f(y, S) dν^y(S) is bounded. The density points cannot be replaced by D
itself: on ℝ² with k = 1, L the x-axis and ‖V‖ the sum of |y_1| H¹⌞L and the measure of density
|y|⁻¹ with respect to Lebesgue measure, ‖V‖(B_r(0)) = r² + 2πr, so Θ^1(‖V‖, 0) = π and D = L, while
(‖V‖⌞D)(B̄₃ᵣ(0)) = 9r² = 9 (‖V‖⌞D)(B̄_r(0)) for every r > 0; with the weight `e^{−1/|y_1|}` in
place of |y_1| the ratio is at least `e^{1/(2r)}`, so no constant C serves on D. The theorem follows
from 2.1's criterion and the fibre measures (Simon1983 line 7419–7440).

**Checks.**

- For V = v(L_1, 1) + v(L_2, 1), two lines of ℝ² crossing at 0, `V_{0,λ} = V` for every λ and V is not
  of the form θv(T, 1), so V has no tangent space at 0 but has one at every other point of its
  support.
- Lebesgue measure on ℝ² lifted with the horizontal plane (k = 1) has `‖V_{x,λ}‖(B_1(0)) = πλ → 0`:
  no tangent space anywhere.
- The vertical lift of H¹⌞(x-axis) has weights with approximate tangent space the x-axis, but
  `V_{x,λ}` converges to the vertical lift of H¹ on the axis, which is not θ v(T, 1): a tangent space of
  the varifold is a stronger requirement than an approximate tangent space of its weight.
- For V = v(L, 1), `ν^x = δ_{P_L}` at every x ∈ L.

(Simon1983 line 7333–7440.) *Needs:* Layer 2.1–2.2, Layer 3.2; Mathlib
`MeasureTheory.Measure.condKernel`, `Besicovitch.vitaliFamily`,
`Besicovitch.ae_tendsto_measure_inter_div_of_measurableSet`, `Vitali.vitaliFamily`,
`VitaliFamily.ae_tendsto_average`.

### Examples

Push-forwards by a homothety, by a projection and by a fold; a non-proper collapse; exact blow-ups
of a great circle on S²; two crossing lines without a tangent space at the crossing.

### Dependencies

Layers 1–2; GeometricMeasureTheory G2; GeometricCurrents G2; HopfRinow Layers 1–2; Mathlib
`LinearMap.normDet`, `MeasureTheory.Measure.condKernel`, and the Besicovitch and Vitali families
with their differentiation theorems (`Besicovitch.vitaliFamily`, `Vitali.vitaliFamily`,
`VitaliFamily.ae_tendsto_average`, `Besicovitch.ae_tendsto_measure_inter_div_of_measurableSet`).

## Layer 4: the first variation

### 4.1 Tangential divergence and the first variation

For a C¹ vector field X on W, x ∈ W and S ∈ G(T_xM, k), define div_S X(x) = tr(P_S ∘ ∇X(x)) =
Σ_i g(∇_τᵢ X, τ_i) for a g_x-orthonormal basis τ_1, …, τ_k of S, with ∇ the Levi-Civita connection
(`CovariantDerivative.leviCivitaConnection`; in E, ∇X = DX). For a varifold V on W and X of class C¹
with compact support in W, define δV(X) = ∫ div_S X(x) dV(x, S) (`firstVariation` on (M, g),
`Euclidean.firstVariation` for W ⊆ E; Simon1983 line 7455–7473, 39.2;
AgnolettoCorreaHoyosDaSilvaNardulli2025 line 179–187; Scharrer2022 line 87–98).

- (x, S) ↦ div_S X(x) is continuous with compact support in G_k(spt X), so δV(X) is finite;
  δV is linear in X, additive and positively homogeneous in V, and
  |δV(X)| ≤ k ‖V‖(K) sup_K |∇X| for spt X ⊆ K.
- Locality: V is carried by G_k(spt‖V‖) (the open set W ∖ spt‖V‖ is ‖V‖-null, W being second
  countable) and div_S X(x) depends only on ∇X(x), so δV(X) depends only on ∇X along spt‖V‖:
  δV(X) = 0 when ∇X(x) = 0 for every x ∈ spt‖V‖, in particular when spt X ∩ spt‖V‖ = ∅.
  For open W' ⊆ W and spt X ⊆ W', the restriction of V to W' has first variation δV(X).
- Continuity: V_j → V implies δV_j(X) → δV(X) for every such X.
- Degenerate dimensions: for k = 0, δV = 0; for k = N, G(T_xM, N) = {1} and δV(X) = ∫ div X d‖V‖
  with div X = tr(∇X) the Riemannian divergence `TauCeti.Manifold.divergence`.
- Derivative of mass: let φ_t be the flow of X (`TauCeti.globalFlow`, complete by
  `TauCeti.isCompleteVectorField_of_isCompact_of_eq_zero_off`) and K ⊆ W compact with spt X ⊆ K. Then
  t ↦ ‖(φ_t)_#V‖(K) is differentiable at every t, with derivative δ((φ_t)_#V)(X), and equal to
  δV(X) at t = 0 (Simon1983 line 7455–7462, 1860–1956, 9.1–9.3; AgnolettoCorreaHoyosDaSilvaNardulli2025
  line 210–212, Proposition 2.6).

Route for the derivative: φ_t is the identity off spt X and maps K onto K, so
`‖(φ_t)_#V‖(K) = ∫_{G_k(K)} J_S φ_t(x) dV(x, S)`; the derivative of φ_t^*g at t = 0 is the Lie derivative
L_X g, with (L_X g)(u, v) = g(∇_u X, v) + g(u, ∇_v X) for the Levi-Civita connection, so
∂_t J_S φ_t(x)|ₜ₌₀ = div_S X(x) uniformly on G_k(K), and dominated convergence applies.

**Checks.**

- For the unit circle C of ℝ² and X = ψ(y)·y with ψ = 1 near C, `div_{T_yC} X = 1`, so δ[C](X) = 2π;
  the flow dilates C to the circle of radius e^t, whose length 2πe^t has derivative 2π at 0.
- For V = v(L, 1), L the x-axis of ℝ², and X = ψ(y)e_2, div_L X = ∂_1 X^1 = 0, so δV(X) = 0.
- For k = N and V the Riemannian volume of W, δV(X) = ∫ div X dvol = 0 for compactly supported X
  (Tau Ceti `TauCeti.Manifold.integral_divergence_eq_zero`, applied on M to X extended by 0).
- δV(X) is not determined by X on spt‖V‖ in general: for the vertical lift V of H¹⌞(x-axis) and
  X = ψ(y)y_2 e_2, X vanishes on spt‖V‖ while div_S X = ψ on the axis, so δV(X) = ∫ψ(t, 0) dt ≠ 0.
- Locality reaches beyond disjoint supports: for V = v(L, 1), L the x-axis of ℝ², and
  X = ψ(y)y_2² e_1 with ψ ∈ C¹_c(ℝ²) not identically 0 on L, spt X meets L, while
  DX = y_2² e_1 ⊗ Dψ + 2ψ y_2 e_1 ⊗ e_2 vanishes on L; directly, div_L X = ∂_1(ψ y_2²) = 0 on L, so
  δV(X) = 0, as the locality law says.

(Simon1983 line 7455–7473, 1860–1956.) *Needs:* Layer 1.3, Layer 3.1; Mathlib
`CovariantDerivative.leviCivitaConnection`; Tau Ceti `TauCeti.globalFlow`,
`TauCeti.contMDiff_globalFlow_uncurry`, `TauCeti.isCompleteVectorField_of_isCompact_of_eq_zero_off`,
`TauCeti.Manifold.divergence`.

### 4.2 Riesz representation for vector fields

Let L be a linear functional on the compactly supported continuous vector fields on W such that
sup{L(X) : |X| ≤ 1, spt X ⊆ K} < ∞ for each compact K ⊆ W. Then there are a unique Radon measure ‖L‖
on W and a ‖L‖-measurable vector field η with |η| = 1 ‖L‖-a.e. such that L(X) = ∫ ⟨η, X⟩ d‖L‖ for
all such X, and ‖L‖(U) = sup{L(X) : |X| ≤ 1, spt X ⊆ U} for every open U ⊆ W; η is unique ‖L‖-a.e.
(Simon1983 line 857–882, 4.1–4.2).

Route: let U ⊆ W be open with a chart φ : U → Ω ⊆ ℝ^N and a g-orthonormal frame e_1, …, e_N. The
functional T(ψ) = L(Σ_i (ψ^i ∘ φ) e_i) on compactly supported continuous maps ψ : Ω →
`EuclideanSpace ℝ (Fin N)` (test functions of class C⁰) has locally finite mass
(`Distribution.HasLocallyFiniteMass`), because |X|_g is the Euclidean norm of the frame components
of X. The measure ‖L‖ on U is the image under φ⁻¹ of Tau Ceti's `Distribution.massMeasure` of T,
whose value on each open U' ⊆ Ω is the supremum of |T ψ| over tests with |ψ| ≤ 1 supported in U'
(`Distribution.massMeasure_preimage_coe`); replacing ψ by −ψ, this is the supremum in the statement.
The scalar functionals ϕ ↦ L(ϕ e_i) are differences of Riesz measures (`TauCeti.RealRMK.posPart`,
`TauCeti.RealRMK.negPart`, `RealRMK.rieszMeasure`), each part at most ‖L‖ by the domination |T ψ| ≤
∫ |ψ| d‖T‖ (`Distribution.enorm_apply_le_lintegral_massMeasure`), and η is the field of their
densities with respect to ‖L‖ (`Measure.rnDeriv`); the domination gives |η| ≤ 1 and the open-set
formula gives `∫_{U'} (1 − |η|) d‖L‖ = 0` for relatively compact open U', so |η| = 1 ‖L‖-a.e. What
Tau Ceti's mass measure does not provide is built here: the polar field η and the gluing of the
local measures and fields over a countable cover of W, by uniqueness.

**Checks.**

- On ℝ^N let L(X) = ⟨X(0), v⟩. For v ≠ 0, ‖L‖ = |v| δ_0 and η(0) = v/|v|; for v = 2e_1 this is
  ‖L‖ = 2δ_0 and η(0) = e_1. For v = 0, L = 0 and ‖L‖ = 0, and no value of η is determined (every
  point is ‖L‖-null): η is unique only ‖L‖-a.e., and a formula v/|v| would be 0/0.
- L(X) = ∫_0^1 X^1(t, 0) dt − ∫_0^1 X^1(t, 0) dt is zero, so ‖L‖ = 0; adding the total variations of
  the two terms would give 2H¹⌞([0, 1] × {0}).
- L(X) = ∫ (X^1 + X^2) dy on ℝ² gives ‖L‖ = √2 times Lebesgue measure and η = (e_1 + e_2)/√2: the
  supremum defining the mass measure on an open U is at most √2 vol(U) by Cauchy–Schwarz and is
  approached by ψ = χ·(1, 1)/√2 as χ ∈ C_c(U, [0, 1]) increases to 1_U. A coordinatewise total
  variation, or the same supremum taken with the sup norm of `Fin 2 → ℝ` (which admits
  ψ = χ·(1, 1)), would give 2 vol(U).

(Simon1983 line 857–882; Federer1969 2.5.) *Needs:* Tau Ceti `Distribution.massMeasure`,
`Distribution.massMeasure_preimage_coe`, `Distribution.enorm_apply_le_lintegral_massMeasure`,
`TauCeti.RealRMK.posPart`, `TauCeti.RealRMK.negPart`,
`TauCeti.RealRMK.integral_rieszMeasure_posPart_sub_integral_rieszMeasure_negPart`; Mathlib
`RealRMK.rieszMeasure`, `Measure.rnDeriv`.

### 4.3 Stationary varifolds and locally bounded first variation

V is stationary in W when δV(X) = 0 for every C¹ vector field X with compact support in W. V has
locally bounded first variation in W when for each compact K ⊆ W there is C_K with
|δV(X)| ≤ C_K sup |X| for every such X with spt X ⊆ K (Simon1983 line 7474–7486, 39.3;
AgnolettoCorreaHoyosDaSilvaNardulli2025 line 264–268). On (M, g) these are `IsStationary` and
`HasLocallyBoundedFirstVariation`, and for W ⊆ E stationarity is `Euclidean.IsStationary`. For an
open U ⊆ W write
‖δV‖(U) = sup{δV(X) : X of class C¹ with compact support in U, |X| ≤ 1} ∈ [0, ∞]
(`firstVariationMass`, `Euclidean.firstVariationMass`); it is defined for every varifold, and the
first bullet identifies it with the total variation measure when V has locally bounded first
variation. Prove:

- If V has locally bounded first variation, δV extends uniquely to a linear functional on compactly
  supported continuous vector fields with the same local bounds, and the total variation ‖δV‖
  given by 4.2 is a Radon measure with ‖δV‖(U) = sup{δV(X) : |X| ≤ 1, spt X ⊆ U} for open U ⊆ W;
  the supremum over continuous X equals the supremum over C¹ X above, because a continuous X with
  |X| ≤ 1 and compact support in U is a uniform limit of C¹ fields with the same properties
  (mollify in charts, then divide by 1 + ε).
- spt‖δV‖ ⊆ spt‖V‖; the extended δV(X) depends only on X restricted to spt‖V‖; ‖δ(V + V')‖ ≤
  ‖δV‖ + ‖δV'‖; ‖δ(cV)‖ = c‖δV‖; restriction to open W' gives the restriction of ‖δV‖.
- Lower semicontinuity: if V_j → V and lim inf_j ‖δV_j‖(U) < ∞ for every open U with compact
  closure in W, then V has locally bounded first variation and ‖δV‖(U) ≤ lim inf_j ‖δV_j‖(U) for
  such U (Simon1983 line 7580–7583, 40.7(1)); limits of stationary varifolds are stationary.

**Checks.**

- v(L, 1) for a line L of ℝ^N is stationary; for the unit circle, ‖δ[C]‖ = H¹⌞C.
- The vertical lift V of H¹⌞(x-axis) does not have locally bounded first variation: X_n =
  n⁻¹ψ(y) sin(n y_2) e_2 has sup |X_n| ≤ n⁻¹ and δV(X_n) = ∫ ψ(t, 0) dt for all n.
- The Riemannian volume of W (k = N) is stationary; Lebesgue measure on ℝ² lifted with a constant
  line P (k = 1) is stationary, since δV(X) = ∫ tr(P DX) dy = 0 by integration by parts.

(Simon1983 line 7474–7486, 7580–7583.) *Needs:* Layer 4.1, Layer 4.2.

### 4.4 The Riesz decomposition of the first variation

Let V have locally bounded first variation in W. There are H_V ∈ L¹_loc(‖V‖; TM), a ‖V‖-null Borel
set Z_V ⊆ W, the measure σ_V = ‖δV‖⌞Z_V and a σ_V-measurable η_V with |η_V| = 1 σ_V-a.e., such that

`δV(X) = −∫ ⟨H_V, X⟩ d‖V‖ + ∫ ⟨η_V, X⟩ dσ_V`

for every compactly supported continuous X, and ‖δV‖ = |H_V| ‖V‖ + σ_V. H_V is unique ‖V‖-a.e., σ_V
is unique, η_V is unique σ_V-a.e. H_V is the generalised mean curvature, Z_V a generalised boundary,
σ_V the generalised boundary measure and η_V the generalised outward co-normal (Simon1983 line
7486–7509, 39.3–39.4; AgnolettoCorreaHoyosDaSilvaNardulli2025 line 269–303). The existence part,
with σ_V Radon and singular to ‖V‖, H_V and η_V measurable as sections of TM (the maps
x ↦ (x, H_V(x)) and x ↦ (x, η_V(x)) into the tangent bundle, for ‖V‖ and σ_V respectively), the
representation on C¹ fields X with compact support (which determine the extension) and
‖δV‖(U) = ∫_U |H_V| d‖V‖ + σ_V(U) on open U, is `exists_firstVariation_eq_riesz` (for W = M).
Measurability is asked of the section, not of its components in the chart that the atlas
assigns to each point, because that assignment need not depend measurably on the point.

- V is stationary in W if and only if H_V = 0 ‖V‖-a.e. and σ_V = 0.
- |H_V| ≤ Λ ‖V‖-a.e. and σ_V = 0 hold if and only if |δV(X)| ≤ Λ ∫ |X| d‖V‖ for all X; then
  ‖δV‖ ≤ Λ‖V‖.
- Isometries: let f be a smooth isometry of W onto an open W' ⊆ M' (1.2 with f smooth; with the
  restricted metrics, f is a `TauCeti.IsLocalRiemannianIsometry`). For a C¹ field Y with compact
  support in W', f^*Y = df⁻¹(Y ∘ f) is C¹ with compact support in W
  (`ContMDiff.mpullback_vectorField`), and f carries the Levi-Civita connection of g to that of g'
  (`TauCeti.IsLocalRiemannianIsometry.mfderiv_leviCivitaConnection_mpullback`), so
  `div_{df_x S} Y(f(x)) = div_S(f^*Y)(x)` and δ(f_#V)(Y) = δV(f^*Y) for every varifold V on W. Hence
  f_#V has locally bounded first variation exactly when V has, and then ‖δ(f_#V)‖ = f_*‖δV‖,
  `H_{f_#V}(f(x)) = df_x(H_V(x))`, `σ_{f_#V} = f_*σ_V` and η is transported by df. The class of f
  matters for this route: for f only C¹, f^*Y is only continuous and div_S(f^*Y) is not defined;
  that a C¹ isometry is smooth is the Myers–Steenrod theorem, which this roadmap does not use. For
  an isometric embedding into a space of higher dimension the law fails (the volume V of M = S¹
  has H_V = 0, while its image in ℝ² is the unit circle with H = −x), and 5.2's formula, with its
  term in B_M, replaces it.
- Dilations in E: `δ(V_{x,λ})(Y) = λ^{1−k} δV(Y ∘ η_{x,λ})`, `‖δV_{x,λ}‖(A) = λ^{1−k}‖δV‖(x + λA)`,
  `H_{V_{x,λ}}(η_{x,λ}(y)) = λ H_V(y)`, `σ_{V_{x,λ}}(A) = λ^{1−k} σ_V(x + λA)`, and η is unchanged.

Route: 4.2 applied to δV, then the Lebesgue decomposition ‖δV‖ = f‖V‖ + σ_V of ‖δV‖ with respect
to ‖V‖ (`Measure.rnDeriv`, `Measure.singularPart`, a ‖V‖-null Borel set carrying the singular part);
put H_V = −f η and η_V = η on Z_V.

**Checks.**

- The half hyperplane Σ = {x_N = 0, x_1 > 0} of ℝ^N (N ≥ 2, k = N − 1) gives, by Fubini and the
  fundamental theorem of calculus in x_1, `δ[Σ](X) = −∫_{x_1 = x_N = 0} X^1 dH^{N−2}`: H = 0,
  σ = Hᴺ⁻²⌞{x_1 = x_N = 0} and η = −e_1; the opposite sign convention would give +e_1.
- For L the x-axis of ℝ² and θ(y) = 1 + y_1², V = v(L, θ) has δV(X) = −∫ X^1 θ' dH¹, so
  H_V = (θ'/θ) e_1 is tangential and σ_V = 0: the generalised mean curvature of a varifold with
  non-constant multiplicity need not be normal.
- For the unit sphere S^k ⊆ ℝᵏ⁺¹, `H_{[S^k]} = −k x` and σ = 0; for the circle of radius R/λ
  obtained by dilating the circle of radius R, |H| = λ/R, as the dilation law predicts.
- Direction of the isometry law: for the rotation f = R of ℝ² by the angle π/2 and V = [C], C the
  unit circle, f_#V = [C] and at f(e_1) = e_2 the mean curvature is −e_2 = R(−e_1) = df(H_V(e_1)); a
  law without df, `H_{f_#V}(f(x)) = H_V(x)`, would give −e_1 at e_2, which is tangent to C there.

(Simon1983 line 7486–7509; Allard1972 Section 4.) *Needs:* Layer 3.1–3.2 (the isometry and dilation
laws), Layer 4.2, Layer 4.3; Mathlib `Measure.rnDeriv`,
`Measure.singularPart`, `ContMDiff.mpullback_vectorField`; Tau Ceti
`TauCeti.IsLocalRiemannianIsometry.mfderiv_leviCivitaConnection_mpullback` and
`Bundle.ContMDiffRiemannianMetric.restrictOpenTangentSpace` (the isometry law).

### 4.5 First variations for two metrics, and blow-ups in normal coordinates

Let Ω ⊆ ℝ^N be open (a coordinate chart) with smooth Riemannian metrics g and h, K ⊆ Ω compact, and
Λ_0 a bound for |g|, |g⁻¹|, |h|, |h⁻¹| and |Dg| on K (Euclidean norms of the coefficient matrices).
For a varifold V for g on Ω let V^h = id_#V be the same varifold for h (push-forward by the identity
of Ω from g to h, 3.1). There is C = C(N, Λ_0) such that for every V and every C¹ field X with
spt X ⊆ K,

`|δ_h V^h(X) − δ_g V(X)| ≤ C ( ‖h − g‖_{C⁰(K)} sup_K |DX| + ‖h − g‖_{C¹(K)} sup_K |X| ) ‖V‖(K)`.

The estimate is pointwise in (x, S): the orthogonal projections, the Jacobian `J^{g→h}` and the
Christoffel symbols of h and g differ by the indicated amounts (this roadmap; it is the step that
replaces chart transport in AgnolettoCorreaHoyosDaSilvaNardulli2025 line 1788–1810, where
preservation of locally bounded first variation under a chart is asserted without proof).

Blow-up form. For x ∈ W, identify a normal ball B_r(x) with the ball B_r(0) of (T_xM, g_x) by
exp_x, let g̃ = exp_x^*g and g̃_λ(y) = g̃(λy) on `B_{r/λ}(0)`. Then `V_{x,λ} = (Ṽ_λ)^{g_x}`, where Ṽ_λ is
the varifold for g̃_λ obtained from λ⁻ᵏV by the smooth isometry y ↦ λ⁻¹ exp_x⁻¹(y) from
(B_r(x), λ⁻²g) onto `(B_{r/λ}(0), g̃_λ)`, to which 4.4's isometry law applies; for R > 0 and
λ < r/R:

- `‖g̃_λ − g_x‖_{C¹(B_R(0))} ≤ C_R λ`, with C_R depending on R and on g̃ near 0;
- `‖Ṽ_λ‖(B_R(0)) = λ^{−k}‖V‖(B_{λR}(x))` and `‖δ_{g̃_λ} Ṽ_λ‖(B_R(0)) = λ^{1−k}‖δV‖(B_{λR}(x))` (geodesic
  balls; exact);
- consequently `|δ_{g_x} V_{x,λ}(Y)| ≤ λ^{1−k}‖δV‖(B_{λR}(x)) sup|Y| + C'_R λ (sup|Y| + sup|DY|) λ^{−k}‖V‖(B_{λR}(x))`
  for C¹ fields Y with spt Y ⊆ B_R(0).

**Checks.**

- For h = c²g with c > 0 constant, V^h = c^k V and div^h = div^g (the Levi-Civita connection is
  unchanged), so the left side is |c^k − 1| |δ_g V(X)|. For the flat metric g = e this is at most
  k|c^k − 1| sup|DX| ‖V‖(K), of the form of the right side.
- For a non-flat g the connection term cannot be dropped from that bound: on Ω = ℝ (N = k = 1) let
  g = e⁴ᵗ dt², h = 4g (c = 2), `V = δ_{(0,1)}`, K = [−1, 1] and X(t) = (1 − t²)² on K, 0 outside.
  Both metrics have Christoffel symbol 2, so div_g X(0) = X'(0) + 2X(0) = 2, δ_g V(X) = 2 and
  δ_h V^h(X) = 2·2 = 4: the left side is 2, while k|c^k − 1| sup|DX| ‖V‖(K) = sup|X'| = 8/(3√3) < 2.
  The derivative-only bound drops the Christoffel term of ∇X = DX + Γ_g X; the general estimate,
  with its metric-dependent constant and its term `‖h − g‖_{C¹} sup|X|`, is unaffected (here
  `‖h − g‖_{C⁰(K)} = 3e⁴`).
- The term in sup|DX| is necessary: for the Dirac varifold `V = δ_{(0,P)}` and X(y) = ψ(y) A y
  with ψ = 1 near 0, X(0) = 0 and DX(0) = A, the left side is |tr((J P^h − P^g) A)|, of order
  |h(0) − g(0)| |A|, while sup|X| can be made arbitrarily small relative to |A| by shrinking spt ψ.
- For the round unit sphere, x a point and V the varifold of a great circle through x, Ṽ_λ is the
  varifold of a diameter for g̃_λ, and `δ_{g_x}V_{x,λ} = 0` because the blow-up is a line, consistent
  with the bound C'_R λ (sup|Y| + sup|DY|)·2R.

(This roadmap; Simon1983 line 7336–7338 for the dilations.) *Needs:* Layer 3.1–3.2, Layer 4.1,
Layer 4.3–4.4 (total first variation; the isometry law); HopfRinow Layer 2; Mathlib
`CovariantDerivative.leviCivitaConnection`.

### Examples

The dilated circle; the half hyperplane with its co-normal; a line with variable multiplicity;
Lebesgue measure with a constant plane as a stationary non-rectifiable varifold; a Dirac varifold
showing that first variations under two metrics differ by a derivative term.

### Dependencies

Layers 1–3; Mathlib `CovariantDerivative.leviCivitaConnection`, `ContMDiff.mpullback_vectorField`,
`RealRMK.rieszMeasure`, Radon–Nikodym derivatives and the Lebesgue decomposition
(`Measure.rnDeriv`, `Measure.singularPart`); Tau Ceti flows, signed Riesz representation, mass
measures of test functionals (`Distribution.massMeasure`), `TauCeti.Manifold.divergence`,
`TauCeti.Manifold.integral_divergence_eq_zero`, the restricted metric on open sets
(`Bundle.ContMDiffRiemannianMetric.restrictOpenTangentSpace`) and the transport of the
Levi-Civita connection by smooth isometries
(`TauCeti.IsLocalRiemannianIsometry.mfderiv_leviCivitaConnection_mpullback`); HopfRinow Layer 2.

## Layer 5: smooth submanifolds and embedded ambient manifolds

### 5.1 The first variation of a C² submanifold

Let 1 ≤ k ≤ N and Σ ⊆ W be a C² embedded k-submanifold, closed in W, with Hᵏ(Σ ∩ K) < ∞ for every
compact K ⊆ W, let `B(X, Y) = (∇_X Y)^⊥` be its second fundamental form on C¹ tangent fields and
H_Σ = (1/k) tr B its averaged mean curvature, a continuous normal field on Σ (Conventions; for smooth
Σ these are RiemannianGeometry R5a's B and R5a.2's H; for W ⊆ E and a C² parametrisation i of Σ,
B(di(x)v, di(x)w) is Tau Ceti's `TauCeti.secondFundamentalForm ℝ i x v w`). Then `δ[Σ](X) = −k ∫_Σ ⟨H_Σ, X⟩ dHᵏ` for
every C¹ field X with compact support in W. Hence [Σ] has locally bounded first variation,
`H_{[Σ]} = k H_Σ`, `σ_{[Σ]} = 0`, and [Σ] is stationary in W if and only if Σ is minimal, H_Σ = 0
(Simon1983 line 1950–1973, 9.3 and 9.5(2); 2979–2988, 16.6(1)). For smooth Σ, δ[Σ](X) equals
RiemannianGeometry R5a.2's first volume variation of the compactly supported variation t ↦ φ_t ∘ ι
of the inclusion ι of Σ.

Route: along Σ, with a local C¹ orthonormal tangent frame τ_1, …, τ_k (Gram–Schmidt applied to the
coordinate fields of a C² chart), `div_{T_xΣ} X = div_Σ X^⊤ − ⟨X, tr B⟩` (differentiate
⟨X^⊥, τ_i⟩ = 0 along τ_i), and ∫_Σ div_Σ X^⊤ dHᵏ = 0 by the divergence theorem on the boundaryless
Σ: X^⊤ is C¹ with compact support in Σ because Σ is closed in W, and Hᵏ⌞Σ is the Riemannian volume
of Σ (2.3). For smooth Σ this is Tau Ceti's `TauCeti.Manifold.integral_divergence_eq_zero` for Σ
with its induced metric; for C² Σ it is the same identity in C² charts of Σ, by a partition of
unity and Tau Ceti's flat `MeasureTheory.integral_divergence_eq_zero` applied to the coordinate field
times the volume density.

**Checks.**

- For the unit sphere S^k ⊆ ℝᵏ⁺¹ (R5a: B = −g·x), `H_{[S^k]} = −k x`; with X = ψ x, ψ = 1 near the
  sphere, both sides give k Hᵏ(S^k).
- A great k-sphere of the round sphere S^N is totally geodesic, hence stationary in S^N.
- Closedness in W is necessary: the half hyperplane of 4.4 is minimal but not closed in ℝ^N, and
  σ ≠ 0.
- Hypersurfaces (k = N − 1) with unit normal ν: tr B = (tr S_ν) ν, with S_ν defined by
  ⟨S_ν X, Y⟩ = ⟨B(X, Y), ν⟩ (R5a's convention for smooth hypersurfaces); for the outward normal of
  Sᴺ⁻¹, S_ν = −id and `H_{[S^{N−1}]} = −(N − 1) x`.
- A C² submanifold that is not smooth: Σ the graph of `u(t) = |t|^{5/2}` over (−1, 1), closed in
  W = (−1, 1) × ℝ, has `u'' = (15/4)|t|^{1/2}`, continuous and not differentiable at 0, so Σ is C² and
  not a smooth submanifold, and R5a does not apply. The Conventions' formula gives
  `B(τ, τ) = u''(1 + u'²)^{−3/2} ν` with `τ = (1, u')(1 + u'²)^{−1/2}` and `ν = (−u', 1)(1 + u'²)^{−1/2}`,
  continuous and 0 at the origin. For X(y) = φ(y_1)χ(y_2)e_2 with φ ∈ C¹_c((−1, 1)) and χ ∈ C¹_c(ℝ)
  equal to 1 on [−1, 2], `δ[Σ](X) = ∫ φ' u'(1 + u'²)^{−1/2} dt`, and integrating by parts this is
  `−∫ φ u''(1 + u'²)^{−3/2} dt = −∫_Σ ⟨tr B, X⟩ dH¹`, as 5.1 states with k = 1.
- For k = N and Σ = W, B = 0 and [W] is stationary, as in 4.3.

(Simon1983 line 1950–1973, 2979–2988.) *Needs:* Layer 2.3, Layer 4.1–4.4; RiemannianGeometry R5a,
R5a.2 (agreement for smooth Σ); Tau Ceti `TauCeti.Manifold.integral_divergence_eq_zero`,
`MeasureTheory.integral_divergence_eq_zero`, `TauCeti.secondFundamentalForm` (W ⊆ E).

### 5.2 Varifolds on an embedded submanifold of Euclidean space

Let M ⊆ ℝ^L be a smooth embedded submanifold with the induced metric g (Tau Ceti
`TauCeti.inducedRiemannianMetric` of the inclusion) and second fundamental form B_M
(RiemannianGeometry R5a; in a local parametrisation i of M, B_M(di(x)v, di(x)w) is Tau Ceti's
`TauCeti.secondFundamentalForm ℝ i x v w`), W ⊆ M open, and U ⊆ ℝ^L open with U ∩ M = W and W closed in U (such U
exists because M is locally closed). The inclusion ι : W → U is an isometric embedding, proper onto
its image. For a varifold V on W and every C¹ vector field X with compact support in U,

`δ(ι_#V)(X) = δV(X^⊤) − ∫ ⟨X(x), tr_S B_M(x)⟩ dV(x, S)`,

where `X^⊤ = P_{TM}X` restricted to W, a C¹ field with compact support in W, and tr_S B_M = Σ_i
B_M(τ_i, τ_i) for an orthonormal basis of S (Simon1983 line 2005–2016, 9.6; 2954–2971, 16.4,
rectifiable case; 7675–7682, 41.2(3)). Consequences:

- V has locally bounded first variation in W if and only if ι_#V has locally bounded first
  variation in U; then ‖δV‖ ≤ ‖δ(ι_#V)‖ on W and ‖δ(ι_#V)‖ ≤ ι_*(‖δV‖ + k|B_M| ‖V‖), with |B_M(x)| the
  largest |B_M(u, u)| over unit u.
- In that case `H_{ι_#V}(x) = H_V(x) + ∫ tr_S B_M(x) dν^x(S)` for ‖V‖-a.e. x (ν^x the fibre measures of
  3.3), `σ_{ι_#V} = ι_*σ_V` and η is unchanged. In particular V is stationary in W if and only if
  δ(ι_#V)(X) = 0 for every X tangent to M along W, and then ι_#V has σ = 0 and
  `|H_{ι_#V}| ≤ k |B_M|` ‖ι_#V‖-a.e.; for V = v(Γ, θ), `H_{ι_#V}(x) = H_V(x) + tr_{T_xΓ} B_M(x)`.
- ι_# preserves rectifiability, integrality and multiplicities, and Θ^k(‖ι_#V‖, x) = Θ^k(‖V‖, x)
  for x ∈ W (Hᵏ for d_g and for the Euclidean distance agree on M, the two distances being locally
  bi-Lipschitz with constants tending to 1).

Route: div_S X = div_S X^⊤ + div_S X^⊥, ⟨D_τ X^⊤, τ⟩ = ⟨∇_τ X^⊤, τ⟩ for τ tangent to M, and
div_S X^⊥ = −⟨X, tr_S B_M⟩ by differentiating ⟨X^⊥, τ_i⟩ = 0.

**Checks.**

- M = S^N ⊆ ℝᴺ⁺¹, Σ a great k-sphere: `B_{S^N}(u, v) = −⟨u, v⟩x`, so `tr_{TΣ} B = −k x` and
  `H_{ι_#[Σ]} = −k x`, the mean curvature of a unit k-sphere of ℝᴺ⁺¹ (5.1).
- M an affine subspace: B_M = 0 and δ(ι_#V)(X) = δV(X^⊤).
- The trace is over S, not over T_xM, and the curvature term enters with a minus sign. Let M be
  the unit cylinder {x_1² + x_2² = 1} ⊆ ℝ³, with outward unit normal ν = (x_1, x_2, 0), horizontal
  unit tangent τ = (−x_2, x_1, 0) and vertical unit tangent e_3; then B_M(τ, τ) = −ν and
  B_M(τ, e_3) = B_M(e_3, e_3) = 0, so |B_M| = 1 and the full trace is `tr_{T_xM} B_M = −ν`. Take
  k = 1. For V the multiplicity-one varifold of a vertical line {p} × ℝ, a geodesic of M (H_V = 0,
  σ_V = 0), tr_S B_M = B_M(e_3, e_3) = 0 and `H_{ι_#V} = 0`, as for every straight line of ℝ³ (5.1);
  a model with the full trace would give −ν. For V the multiplicity-one varifold of the circle
  {x_3 = 0}, also a geodesic of M, tr_S B_M = −ν and `H_{ι_#V} = −ν`, the curvature vector of a unit
  circle of ℝ³ (H = −x on the unit circle, 5.1); the opposite sign of the curvature term would give
  +ν. On this circle `‖δ(ι_#V)‖ = |H_{ι_#V}| H¹⌞circle = H¹⌞circle = k|B_M| ‖V‖`, so the bound
  ‖δ(ι_#V)‖ ≤ ι_*(‖δV‖ + k|B_M| ‖V‖) of the first consequence is attained.
- The trace depends on the direction of S. On the same cylinder, for 0 < α < π/2 the helix
  γ(t) = (cos t, sin t, t tan α), t ∈ ℝ, is a properly embedded geodesic of M; its unit tangent is
  cos α τ + sin α e_3, so tr_S B_M = cos²α B_M(τ, τ) = −cos²α ν, while its curvature vector in ℝ³
  is γ''/|γ'|² = −ν/sec²α = −cos²α ν, which is `H_{ι_#V}` for its multiplicity-one varifold. A model
  with any constant multiple c of the full trace in place of tr_S B_M gives −cν for every α.

(Simon1983 line 2005–2016, 2954–2971, 7675–7682.) *Needs:* Layer 3.1, Layer 3.3, Layer 4.1–4.4;
RiemannianGeometry R5a; GeometricCurrents G2 (comparison of Hausdorff measures); Tau Ceti
`TauCeti.inducedRiemannianMetric`, `TauCeti.secondFundamentalForm`.

### Examples

Spheres, great spheres and the half hyperplane as test cases of 5.1; the great sphere inside S^N,
and the vertical lines, horizontal circles and helices of the unit cylinder of ℝ³, as test cases of
5.2.

### Dependencies

Layers 2–4; RiemannianGeometry R5a, R5a.2; Tau Ceti `TauCeti.Manifold.integral_divergence_eq_zero`,
`MeasureTheory.integral_divergence_eq_zero`, `TauCeti.secondFundamentalForm` and
`TauCeti.inducedRiemannianMetric`; GeometricCurrents G2.

## Layer 6: monotonicity, densities and constancy

From here on 1 ≤ k ≤ N.

### 6.1 The Euclidean monotonicity formula

Let W ⊆ E be open, V of locally bounded first variation in W, x ∈ W and
0 < ρ_0 ≤ dist(x, E ∖ W) (that is, B_ρ₀(x) ⊆ W); write r = |y − x| and extend δV to bounded
compactly supported Borel fields by 4.4: for a representation
`δV(X) = −∫ ⟨H, X⟩ d‖V‖ + ∫ ⟨η, X⟩ dσ` of δV on C¹ fields with compact support in W, with H locally
‖V‖-integrable, σ a Radon measure on W and η σ-measurable with |η| ≤ 1 σ-a.e. (4.4's
decomposition is one; any such representation gives the same extension),

`δV(1_{B_t(x)}(y)(y − x)) = −∫_{B_t(x)} ⟨H(y), y − x⟩ d‖V‖(y) + ∫_{B_t(x)} ⟨η(y), y − x⟩ dσ(y)`.

For 0 < σ < ρ < ρ_0 the monotonicity identity holds:

`ρ^{−k}‖V‖(B_ρ(x)) − σ^{−k}‖V‖(B_σ(x)) = ∫_{G_k({σ ≤ r < ρ})} r^{−k−2}|P_{S^⊥}(y − x)|² dV(y, S) − ∫_σ^ρ t^{−k−1} δV(1_{B_t(x)}(y)(y − x)) dt`

(`Euclidean.monotonicity_identity`, which takes the representation (H, σ, η) as its data; Simon1983
line 3016–3076, 17.2–17.5, rectifiable case; 7513–7540, 40.1–40.3). Every term is finite: the
closed ball B̄_ρ(x) is a compact subset of W, and `|P_{S^⊥}(y − x)|² ≤ r²` bounds the integrand by
σ⁻ᵏ. Consequences and companions:

- If ‖δV‖(B_ρ(x)) ≤ Λ‖V‖(B_ρ(x)) for 0 < ρ < ρ_0, then for 0 < σ < ρ < ρ_0,
  `e^{Λσ}σ^{−k}‖V‖(B_σ(x)) ≤ e^{Λρ}ρ^{−k}‖V‖(B_ρ(x)) − ∫_{G_k({σ ≤ r < ρ})} r^{−k−2}|P_{S^⊥}(y − x)|² dV`,
  so `ρ ↦ e^{Λρ}ρ^{−k}‖V‖(B_ρ(x))` is non-decreasing on (0, ρ_0) (Simon1983 line 7531–7533, 40.2).
- If |H_V| ≤ Λ ‖V‖-a.e. and σ_V = 0 on B_ρ₀(x), the hypothesis holds with the same Λ.
- If V is stationary in B_ρ₀(x), the identity has no first-variation term, Θ^k(‖V‖, x) exists, and
  `ω_k Θ^k(‖V‖, x) = ρ^{−k}‖V‖(B_ρ(x)) − ∫_{G_k(B_ρ(x))} r^{−k−2}|P_{S^⊥}(y − x)|² dV` (Simon1983 line
  7534–7540, 40.3).
- Weighted identity: for nonnegative C¹ h on W and φ a C¹ cut-off profile with φ' ≤ 0, φ = 1 on
  (−∞, 1/2] and φ = 0 on [1, ∞), put I(ρ) = ∫ φ(r/ρ) h d‖V‖ and X_ρ(y) = φ(r/ρ) h(y)(y − x); then
  `d/dρ (ρ^{−k} I(ρ)) = ρ^{−k} d/dρ ∫ φ(r/ρ) h |P_{S^⊥}(y − x)|² r^{−2} dV + ρ^{−k−1} ( ∫ φ(r/ρ) (y − x)·P_S ∇h dV − δV(X_ρ) )`
  (Simon1983 line 7541–7547, 40.4, and 3205–3221, 18.1, rectifiable case).

**Checks.**

- For a k-plane through x the ratio ρ⁻ᵏ‖V‖(B_ρ(x)) is ω_k times its multiplicity, and the
  integrand `|P_{S^⊥}(y − x)|²` vanishes; for a cone with vertex x the ratio is constant and
  `P_{S^⊥}(y − x) = 0` on its support.
- For the line L = {y_2 = a} of ℝ² (a > 0), x = 0 and σ < a < ρ: the left side is
  ρ⁻¹·2√(ρ² − a²) and the right side is `∫ a²(t² + a²)^{−3/2} dt` over |t| < √(ρ² − a²), which equals
  2√(ρ² − a²)/ρ.
- For the unit circle C of ℝ², x = 0 and σ < 1 < ρ: the left side is 2π/ρ; the first term of the
  right side is 2π and, since H = −y on C, δV(1_Bₜ(y) y) = 2π for t > 1 and 0 for t ≤ 1, so the
  second term is 2π(1 − 1/ρ); the identity holds with the minus sign and fails with a plus sign.

(Simon1983 line 3016–3076, 7510–7547; Allard1972 Section 5.) *Needs:* Layer 4.1–4.4.

### 6.2 The Riemannian monotonicity formula

Let V have locally bounded first variation in W ⊆ M, x ∈ W, κ ≥ 0, and 0 < ρ_0 such that B_ρ₀(x)
is a normal ball of x contained in W (the tangent ball of radius ρ_0 about 0 in T_xM is a normal
domain, `TauCeti.Manifold.IsNormalDomain`, and exp_x maps it onto B_ρ₀(x),
`TauCeti.Manifold.IsNormalDomain.image_riemannianExp_ball`), the sectional curvature is at most κ
at every point of B_ρ₀(x), and √κ ρ_0 ≤ π/2. Then for 0 < σ < ρ < ρ_0,

`σ^{−k}‖V‖(B_σ(x)) ≤ ρ^{−k}‖V‖(B_ρ(x)) + ∫_σ^ρ t^{−k} ( ‖δV‖(B_t(x)) + k√κ ‖V‖(B_t(x)) ) dt`,

and if ‖δV‖(B_t(x)) ≤ Λ‖V‖(B_t(x)) for 0 < t < ρ_0, then `ρ ↦ e^{(Λ + k√κ)ρ}ρ^{−k}‖V‖(B_ρ(x))` is
non-decreasing on (0, ρ_0) (`monotonicity_inequality` and `monotoneOn_exp_mul_densityRatio`, for
W = M; Scharrer2022 line 1120–1127 and 1184–1203, Lemma 3.3 and Remark 3.4; a differential form
for a weighted, mollified mass ratio, under a two-sided bound |sec| ≤ K and for radii below a
ρ_0(r_0, K), is AgnolettoCorreaHoyosDaSilvaNardulli2025 line 524 and 542–640, Lemma 2.22).
Scharrer states the inequality with closed balls; the two forms are equivalent, because ‖V‖ and
‖δV‖ charge the spheres {d_g(x, ·) = t} for at most countably many t, and ‖V‖(B̄_s(x)) increases to
‖V‖(B_σ(x)) as s ↑ σ.
All quantities lie in [0, ∞] and are finite here, B̄_ρ(x) being compact.

Route: with r = d_g(x, ·), the field r∇r = ½∇r² is smooth on the normal ball (HopfRinow Layer 2),
and RiemannianGeometry R4 item 1 gives ∇(r∇r) ≥ √κ r cot(√κ r) g, hence
div_S(r∇r) ≥ k √κ r cot(√κ r) for every k-plane S (Scharrer2022 line 823–854, Lemma 2.7); test δV with
φ(r/t) r∇r and integrate in t; (1 − x cot x)/x ≤ 2/π on (0, π/2]; the exponential form follows by
Grönwall's inequality.

**Checks.**

- For κ = 0 and M = E, the statement is 6.1's inequality without the `|P_{S^⊥}|²` term.
- On the unit sphere S² (κ = 1) with V a great circle through x, ‖V‖(B̄_ρ(x)) = 2ρ for ρ < π, so the
  ratio is constant and `e^{(0 + 1)ρ}·2` is non-decreasing, consistent; the bound
  (1 − x cot x)/x ≤ 2/π is attained at x = π/2. With ρ_0 = π/2 (the tangent ball of radius π/2 is a
  normal domain, the injectivity radius of S² being π) and 0 < σ < ρ < π/2 the inequality reads
  2 ≤ 2 + ∫_σ^ρ t⁻¹(0 + 2t) dt = 2 + 2(ρ − σ).
- The curvature term is not removable: on the unit sphere S² take k = N = 2 and V the Riemannian
  volume of S², which is stationary (4.3), so ‖δV‖ = 0. Then ‖V‖(B_ρ(x)) = 2π(1 − cos ρ) and the
  ratio f(ρ) = 2π(1 − cos ρ)/ρ² decreases from f(0+) = π to f(π/2) = 8/π ≈ 2.546. Without the term
  k√κ‖V‖ the inequality would read f(σ) ≤ f(ρ), false for σ small and ρ = π/2 (π > 2.546); with
  it, the right side gains `∫_σ^{π/2} 2 f(t) dt ≥ 2·(8/π)(π/2 − σ) ≈ 8 − 5.1σ`, and the inequality
  holds.
- The hypothesis √κ ρ_0 ≤ π/2 cannot be dropped from the route: at √κ r = π the comparison factor
  √κ r cot(√κ r) is −∞.

(Scharrer2022 line 823–854, 1120–1203.) *Needs:* Layer 4.1–4.4; RiemannianGeometry R4 item 1;
HopfRinow Layer 2; Tau Ceti `TauCeti.Manifold.IsNormalDomain`,
`TauCeti.Manifold.IsNormalDomain.image_riemannianExp_ball`, `CovariantDerivative.sectionalCurvature`.

### 6.3 Densities

Let V have locally bounded first variation in W ⊆ M.

- Existence: Θ^k(‖V‖, x) exists and is finite at every x ∈ W with ‖δV‖(B_ρ(x)) ≤ Λ‖V‖(B_ρ(x)) for
  all small ρ (6.1, 6.2); this ratio bound holds at every x ∈ W when |H_V| is locally bounded and
  σ_V = 0, in particular when V is stationary. In E the ratio bound holds at ‖V‖-a.e. x
  (Besicovitch's differentiation theorem). On M, Θ^k(‖V‖, ·) exists and is finite ‖V‖-a.e. (and is
  0 off spt‖V‖) by the route below, and the geodesic-ball ratio bound holds at ‖V‖-a.e. x at which
  Θ^k(‖V‖, x) > 0 (Simon1983 line 7550–7555, 40.5; AgnolettoCorreaHoyosDaSilvaNardulli2025 line
  1680, Theorem 2.30). The almost-everywhere existence and finiteness is `ae_hasDensity` (for
  W = M).
- Θ^k(‖V‖, ·) is ‖V‖-measurable (Simon1983 line 7556–7565).
- Upper semicontinuity in x: if ‖δV‖ ≤ Λ‖V‖ on an open set U (that is, ‖δV‖(U') ≤ Λ‖V‖(U') for
  every open U' ⊆ U; only this bound on U is used), then at every x ∈ U the density Θ^k(‖V‖, x)
  exists, is finite and equals `Θ^{*k}(‖V‖, x)`, and `Θ^k(‖V‖, x) ≥ lim sup_{y→x} Θ^k(‖V‖, y)`
  (`hasDensity_and_limsup_le_of_firstVariationMass_le`, for W = M; Simon1983 line 3119–3144, 17.8,
  rectifiable case; AgnolettoCorreaHoyosDaSilvaNardulli2025 line 1448–1546, Corollary 2.27 and
  Remark 2.28).
- Upper semicontinuity under convergence: if V_j → V, ‖δV_j‖ ≤ Λ‖V_j‖ on U for all j, and x_j → x ∈ U,
  then ‖δV‖ ≤ Λ‖V‖ on U and Θ^k(‖V‖, x) ≥ lim sup_j Θ^k(‖V_j‖, x_j) (this roadmap, by the argument of
  Simon1983 17.8 with 1.4's upper semicontinuity on compact sets).
- Lower bound: if Θ^k(‖V‖, ·) ≥ 1 ‖V‖-a.e. (for instance if V is integral, 2.2, since its
  multiplicity is a positive integer ‖V‖-a.e.; no rectifiability is used), and ‖δV‖ ≤ Λ‖V‖ on an
  open U ⊆ W, then Θ^k(‖V‖, x) ≥ 1 for every x ∈ spt‖V‖ ∩ U (`one_le_upperDensity_of_mem_support`,
  for W = M, with the upper density, which is the density on U by the previous bullet). Route:
  every neighbourhood of x has positive ‖V‖-measure, so points y → x with Θ(y) ≥ 1 exist, and the
  upper semicontinuity gives Θ(x) ≥ 1. If moreover
  x ∈ spt‖V‖ ∩ U, κ ≥ 0 and ρ_0 are as in 6.2 (B_ρ₀(x) a normal ball of x with sectional curvature
  at most κ on it and √κ ρ_0 ≤ π/2) and B_ρ₀(x) ⊆ U, then 6.2's ratio bound holds for
  0 < t < ρ_0, and `‖V‖(B̄_ρ(x)) ≥ e^{−(Λ + k√κ)ρ} ω_k ρ^k` for 0 < ρ < ρ_0 (Simon1983 line 3147–3152,
  17.9(1)).

Route for a.e. existence on M: Besicovitch's differentiation theorem in a chart
(`Besicovitch.ae_tendsto_rnDeriv`, for Mathlib's finite-dimensional `HasBesicovitchCovering`) gives,
for ‖V‖-a.e. x, a Λ_x with ‖δV‖(B̄^ch_s(x)) ≤ Λ_x‖V‖(B̄^ch_s(x)) for small closed chart balls
B̄^ch_s(x); for a constant c ≥ 1 and small t, `B̄_t(x) ⊆ B̄^ch_{ct}(x) ⊆ B̄_{c²t}(x)`, so with
f(t) = t⁻ᵏ‖V‖(B̄_t(x)), ‖δV‖(B̄_t(x)) ≤ Λ_x c²ᵏ t^k f(c²t). Inserted into 6.2 this gives, for
0 < σ ≤ σ' < ρ and C = Λ_x c²ᵏ + k√κ, `f(σ') ≤ f(ρ) + Cρ max(sup_{[σ, ρ]} f, sup_{[ρ, c²ρ]} f)`; both
suprema are finite, so for Cρ ≤ 1/2, `sup_{[σ, ρ]} f ≤ 2f(ρ) + sup_{[ρ, c²ρ]} f` uniformly in σ. Hence f
is bounded on (0, c²ρ], `lim sup_{σ↓0} f(σ) ≤ f(ρ) + Cρ sup_{(0, c²ρ]} f` for small ρ, and
`lim sup_{σ↓0} f(σ) ≤ lim inf_{ρ↓0} f(ρ)`. No geodesic-ball ratio bound is used. If moreover
Θ^k(‖V‖, x) > 0, then `‖V‖(B̄_{c²r}(x)) ≤ (c^{2k} + 1)‖V‖(B_r(x))` for small r, and the chart bound gives
‖δV‖(B_r(x)) ≤ Λ_x (c²ᵏ + 1)‖V‖(B_r(x)). At a point of density 0 this doubling step can fail
(Checks below).

**Checks.**

- For the unit circle Θ^1 = 1 on the circle and 0 elsewhere; for v(L, 3), Θ = 3 on L.
- For two lines crossing at 0, Θ(0) = 2 while Θ = 1 at nearby points of the support: Θ is upper and
  not lower semicontinuous.
- For three half-lines from 0 at angles 2π/3 (a stationary 1-varifold), ‖V‖(B_ρ(0)) = 3ρ and
  Θ(0) = 3/2.
- σ_V = 0 cannot be dropped from upper semicontinuity: v(L, θ) on the x-axis with θ = 1 on
  (−∞, 0) and θ = 2 on (0, ∞) has an atom of ‖δV‖ at 0 (σ_V = δ_0, η = −e_1), Θ(0) = 3/2 and
  Θ(y) = 2 for y > 0.
- v(L, 1/2) satisfies everything except the hypothesis Θ ≥ 1 of the lower bound, and has
  Θ = 1/2 on L.
- The ball of the mass lower bound must lie in U. In ℝ² take V = v([−a, a] × {0}, 1) (a > 0),
  U = B_a(0), Λ = κ = 0 and x = 0. Then `‖δV‖ = δ_{(−a, 0)} + δ_{(a, 0)}` vanishes on U and Θ = 1 on
  spt‖V‖ ∩ U. At ρ = 2a, a radius 6.2 alone allows in W = ℝ², ‖V‖(B̄₂ₐ(0)) = 2a < 4a = ω_1·2a.
  With B_ρ₀(0) ⊆ U, every admitted ρ is less than a, and ‖V‖(B̄_ρ(0)) = 2ρ = ω_1 ρ: equality.
- The ratio bound is an almost-everywhere property, and passing from chart balls to geodesic balls
  needs positive density: V = v(L, θ) on the x-axis of ℝ² with `θ(t) = e^{−1/|t|}` (t ≠ 0) has
  σ_V = 0 and ‖δV‖ = |θ'| H¹⌞L, so `‖δV‖(B_ρ(0)) = 2∫_0^ρ t^{−2}e^{−1/t} dt = 2e^{−1/ρ}`, while
  `‖V‖(B_ρ(0)) = 2∫_0^ρ e^{−1/t} dt ≤ 2ρ²e^{−1/ρ}` (because `(t²e^{−1/t})' ≥ e^{−1/t}`). The ratio is at
  least ρ⁻² at the ‖V‖-null point 0, where Θ^1(‖V‖, 0) = 0 exists nonetheless, and
  `‖V‖(B_{2r}(0))/‖V‖(B_r(0)) ≥ (2r)^{−1}e^{1/(3r)} → ∞`, so no doubling constant serves at 0.

(Simon1983 line 3119–3152, 7550–7565.) *Needs:* Layer 1.4, Layer 3.3, Layer 4.4, Layer 6.1–6.2;
Mathlib `HasBesicovitchCovering`, `Besicovitch.ae_tendsto_rnDeriv`, `MeasureTheory.Measure.support`;
Tau Ceti `TauCeti.Manifold.exists_isNormalDomain_ball` (normal balls at every point).

### 6.4 The constancy theorem

Let V be stationary in W and Σ ⊆ W a connected C² embedded k-submanifold with spt‖V‖ ⊆ Σ. Then
either V = 0, or Σ is closed in W, Hᵏ(Σ ∩ K) < ∞ for every compact K ⊆ W (so that [Σ] is defined,
2.3), and V = θ_0 [Σ] for a constant θ_0 > 0 (Simon1983 line 7664–7732, 41.1–41.2(1)).
Equivalently, writing Σ as the image of a C² embedding ι : N → W of a connected k-manifold N
(`Manifold.IsSmoothEmbedding` of class C²): there is a constant θ_0 ∈ [0, ∞) with ‖V‖ = θ_0 Hᵏ⌞Σ,
the plane S of V-a.e. (x, S) is T_xΣ = dι_n(T_nN) at x = ι(n), and θ_0 = 0 or Σ is closed in W;
for θ_0 > 0 local finiteness of Hᵏ⌞Σ follows from that of ‖V‖, and the weight and the planes
determine V = θ_0[Σ]. For W = M this is `constancy`.

Route: for a C² function f vanishing on Σ, div_S(f∇f) = |P_S ∇f|² on spt V, so stationarity forces
P_S ∇f = 0 on spt V; with local defining functions whose gradients span the normal spaces, S = T_xΣ
on spt V. In a C² chart t = (t_1, …, t_k) of Σ on an open U ⊆ ℝ^k, let w = √det(g_Σ) be the
coordinate density of the induced metric g_Σ (a positive C¹ function), so that Hᵏ⌞Σ is w dt in the
chart (2.3). Being carried by Σ does not make ‖V‖ absolutely continuous with respect to Hᵏ⌞Σ (an
atom on Σ is carried by Σ); finiteness of the density does. V is stationary, so Θ^k(‖V‖, ·) exists
and is finite at every point of W (6.3). Let ν be the image in the chart of ‖V‖ restricted to the
image of an open U' with compact closure in U. The chart is Lipschitz, with some constant L, from
the Euclidean distance to d_g near each t ∈ U', so, with x_t the image of t,
`ν(B̄_r(t)) ≤ ‖V‖(B̄_{Lr}(x_t)) ≤ c_t r^k` for small r, where c_t = (Θ^k(‖V‖, x_t) + 1) ω_k L^k.
`Besicovitch.ae_tendsto_rnDeriv`, applied to Lebesgue measure dt against ν, gives at ν-a.e. t a
limit of the ratio of dt(B̄_r(t)) to ν(B̄_r(t)) as r ↓ 0, equal to the Radon–Nikodym derivative D
of dt with respect to ν at t; the bound
gives D(t) ≥ ω_k/c_t > 0. A Borel set A with dt(A) = 0 has ∫_A D dν ≤ dt(A) = 0
(`MeasureTheory.Measure.setLIntegral_rnDeriv_le`), so ν(A) = 0. Hence ν ≪ dt, and since w > 0,
‖V‖ ≪ Hᵏ⌞Σ: ‖V‖ = θ Hᵏ⌞Σ for the Radon–Nikodym derivative θ ≥ 0 of ‖V‖ with respect to Hᵏ⌞Σ,
a locally Hᵏ-integrable function on Σ, and V = v({θ > 0}, θ) by the first step. Let θ̃ be θ in the
chart coordinates, so that ‖V‖ = θ̃ w dt there. For X tangent to Σ with components X^i, `div_{T_xΣ} X` is the
divergence of X along (Σ, g_Σ) (the normal part of ∇X does not enter the trace), that is
w⁻¹ Σ_i ∂_i(w X^i), so stationarity gives ∫ θ̃ Σ_i ∂_i(w X^i) dt = 0. The choice
X^i = φ/w, the other components 0, for φ ∈ C¹_c of the chart domain (extended to a compactly
supported C¹ field on W through a C² chart of W in which Σ is a coordinate plane) gives
∫ θ̃ ∂_i φ dt = 0: the distributional derivatives of θ̃ itself, with respect to coordinate Lebesgue
measure dt and not to θ̃ w, vanish (Simon1983 line 7720–7732). GeometricCurrents G1's constancy
criterion makes θ̃ a.e. constant on each connected chart domain, hence θ equal Hᵏ-a.e. to a
constant θ_0 on the connected Σ. If θ_0 = 0, V = 0. If θ_0 > 0, Hᵏ⌞Σ = θ_0⁻¹‖V‖ is a Radon
measure, so Σ has locally finite area, and the closure of Σ in W is spt‖V‖ (2.3), which lies in Σ:
Σ is closed in W.

**Checks.**

- v(L, 3) on a line L: θ_0 = 3.
- Two parallel lines L_1, L_2 with V = v(L_1, 1) + v(L_2, 2) is stationary with non-constant
  multiplicity on the disconnected L_1 ∪ L_2: connectedness is necessary.
- For k = N and Σ = W connected, a stationary N-varifold is a constant multiple of the Riemannian
  volume.
- [half-line] has support in a line Σ but is not a constant multiple of [Σ]; consistently it is not
  stationary (σ_V = δ_0 at its endpoint).
- The coordinate multiplicity, not its product with the volume density, is the constant: on
  W = Σ = ℝ (k = N = 1) with g = e²ᵗ dt², the volume density is w = e^t and
  div_g X = e⁻ᵗ(e^t X)', so V = [W] has δV(X) = ∫ (e^t X)' dt = 0 for compactly supported X and
  is stationary with θ̃ = 1, while (θ̃ w)' = e^t ≠ 0; a route asking the derivatives of θ̃ w to vanish
  would exclude this stationary varifold.
- The graph Σ of t ↦ sin(1/t) over (0, 1) is a connected C² embedded curve in ℝ² of infinite length
  inside B̄_2(0) (its length is at least ∫_0^1 |cos(1/t)| t⁻² dt = ∫_1^∞ |cos u| du = ∞), and it is
  not closed (its closure contains {0} × [−1, 1]). V = 0 is stationary with support in Σ and takes
  the first alternative, and the theorem says it is the only such V; a conclusion "V = θ_0 [Σ] in
  every case" would use [Σ], which 2.3 does not define for this Σ.
- Finite density is what makes the weight absolutely continuous: on ℝ² with L the x-axis,
  `V' = v(L, 1) + δ_{(0, L)}` has ‖V'‖ = H¹⌞L + δ_0, carried by L and not of the form θH¹⌞L. Its
  density at 0 is lim (2ρ + 1)/(2ρ) = ∞; in the chart t ↦ (t, 0) the ratio of dt(B̄_r(0)) to the
  image of ‖V'‖ is 2r/(2r + 1) → 0 on the set {0} of ‖V'‖-measure 1, so the criterion of the route
  fails there, while for v(L, θ) with θ > 0 continuous the ratio tends to 1/θ(t) > 0. V' is not
  stationary: for X = ψ(y) y_1 e_1 with ψ ∈ C¹_c equal to 1 near 0, the line contributes
  ∫ ∂_t(ψ(t, 0) t) dt = 0 and the atom contributes div_L X(0) = 1, so δV'(X) = 1.

(Simon1983 line 7664–7732.) *Needs:* Layer 2.3, Layer 3.3, Layer 4.3, Layer 6.3; Mathlib
`Besicovitch.ae_tendsto_rnDeriv`, `MeasureTheory.Measure.setLIntegral_rnDeriv_le`,
`Manifold.IsSmoothEmbedding`; GeometricCurrents G1 (constancy criterion).

### 6.5 The convex hull property

Let V be a varifold on E with spt‖V‖ compact, stationary in E ∖ K for a compact K ⊆ E. Then
spt‖V‖ is contained in the convex hull of K; for K = ∅, V = 0 (Simon1983 line 3371–3400,
19.1–19.2, for rectifiable V with generalised mean curvature; the general case is this roadmap's, by
the same test field).

Route: for a closed ball B̄_R(ξ) ⊇ K, ε > 0 and a C¹ function γ ≥ 0, non-decreasing, vanishing on
[0, R + ε] and positive on (R + ε, ∞), test δV with X(y) = ψ(y)γ(r)(y − ξ), r = |y − ξ|, ψ ∈ C¹_c
equal to 1 near spt‖V‖; X has compact support in E ∖ K. Where ψ = 1,
div_S X = kγ(r) + γ'(r)|P_S(y − ξ)|²/r ≥ kγ(r) for every k-plane S, with no rectifiability used, so
0 = δV(X) ≥ k∫ γ d‖V‖ and ∫ γ d‖V‖ = 0 (k ≥ 1): `spt‖V‖ ⊆ B̄_{R+ε}(ξ)`. The convex hull of K is the
intersection of the closed balls containing it; for K = ∅ two disjoint balls give spt‖V‖ = ∅.

**Checks.**

- The varifold of the segment [−1, 1] × {0} is stationary off its endpoints and lies in their
  convex hull.
- For K the closed unit disc of ℝ², the unit circle is stationary in E ∖ K (its support misses
  E ∖ K) and lies in K; for K = {0} it is not stationary in E ∖ K (H = −y ≠ 0 on the circle), and the
  conclusion spt ⊆ {0} indeed fails.
- `δ_{(0,P)}` is stationary in E ∖ {0} and its support {0} is the hull of K = {0}; for k ≥ 1 it is
  not rectifiable (its weight δ_0 charges the Hᵏ-null set {0}), so the rectifiable case does not
  cover it.
- Agreement with the smooth convex hull property (RiemannianGeometry/MinimalSurfaces 3.3) on a
  catenoid piece: in ℝ³ with ρ = √(x₁² + x₂²), let Σ = {ρ = cosh x₃, |x₃| ≤ h} (h > 0) and
  K = ∂Σ, the two circles ρ = cosh h at heights x₃ = ±h. The catenoid is minimal, so
  V = [Σ ∖ ∂Σ] is stationary in E ∖ K (5.1 on W = E ∖ K), with spt‖V‖ = Σ compact and
  ‖V‖(E) = 2π(h + sinh h cosh h). The convex hull of K is the solid cylinder
  {ρ ≤ cosh h, |x₃| ≤ h}, and Σ lies in it because cosh x₃ ≤ cosh h for |x₃| ≤ h; the neck circle
  ρ = 1 at x₃ = 0 lies strictly inside. A rule that placed spt‖V‖ in K itself, or in the union of
  the two flat discs bounded by K, fails on the neck.

(Simon1983 line 3371–3400, rectifiable case.) *Needs:* Layer 4.1–4.4.

### Examples

The tilted line and the circle as two-sided checks of the monotonicity identity; the triple
junction and two crossing lines as density examples; the step multiplicity showing why σ_V = 0 is
needed; the great circle on S².

### Dependencies

Layers 1–4; RiemannianGeometry R4 item 1; HopfRinow Layer 2 (in Tau Ceti: the normal domains
and `TauCeti.Manifold.IsNormalDomain.image_riemannianExp_ball`); Tau Ceti
`CovariantDerivative.sectionalCurvature`; GeometricCurrents G1; Mathlib Besicovitch
differentiation, Radon–Nikodym derivatives, `MeasureTheory.Measure.support` and
`Manifold.IsSmoothEmbedding`.

## Layer 7: varifold tangents, rectifiability and compactness

**Standing setting for varying metrics.** g_i and g are smooth Riemannian metrics on W with
g_i → g in C² on compact subsets (in charts); each V_i is a varifold for g_i, regarded on G_k^g(W)
through 1.2's canonical homeomorphism (which leaves the weights unchanged). Convergence of the V_i
is not part of the setting: 7.1 assumes it and 7.4 produces it along a subsequence. The case
g_i = g is the fixed-metric case, and g_i = g = e on W ⊆ E is Simon's setting.

### 7.1 Semicontinuity of lower density bounds

In the standing setting, suppose V_i → V on G_k^g(W), each V_i has locally bounded g_i-first
variation,
lim inf_i ‖δ_gᵢ V_i‖(U) < ∞ for every open U with compact closure in W, and
Θ^k_gᵢ(‖V_i‖, y) ≥ 1 for ‖V_i‖-a.e. y ∈ W ∖ B_i, where ‖V_i‖(B_i ∩ K) → 0 for every compact K ⊆ W.
Then V has locally bounded g-first variation, ‖δ_g V‖(U) ≤ lim inf_i ‖δ_gᵢ V_i‖(U) for such U, and
Θ^k_g(‖V‖, y) ≥ 1 for ‖V‖-a.e. y ∈ W (Simon1983 line 7566–7579, 40.6, for g_i = g = e).

Route: the first two conclusions follow from δ_gᵢV_i(X) → δ_g V(X) (the integrands converge
uniformly on compact sets) and |X|_gᵢ → |X|_g. For the density, run Simon's covering argument
(Simon1983 line 7592–7660) in charts: the good sets Aᵢⱼ are defined by the ratio bound
‖δ_gᵢV_i‖ ≤ j‖V_i‖ on chart-Euclidean balls, so that Besicovitch's theorem (Mathlib's
finite-dimensional `HasBesicovitchCovering`) bounds the bad sets; at points of Aᵢⱼ of density at
least 1, the inequality of 6.2 for (V_i, g_i), whose constants are uniform in i because the
sectional curvatures and normal radii of g_i are uniformly controlled on compact sets, and the
nesting of chart balls and g_i-geodesic balls as in 6.3 give `‖V_i‖(B̄^{g_i}_ρ(y)) ≥ (ω_k − Cρ)ρ^k` with C
uniform; geodesic balls of g_i about y_i → x lie in `B̄^g_{ρ+ε}(x)` for large i, and 1.4 passes the
bound to V.

**Checks.**

- A sequence of integral varifolds V_i whose weights converge to ½H¹⌞L is excluded by the first
  variation bound, not by the density bound: the varifolds of i disjoint segments of length 1/(2i)
  equally spaced in [0, 1] × {0} have Θ = 1 a.e. and ‖δV_i‖ equal to twice the number of segments,
  which tends to ∞; the limit ½ v([0, 1] × {0}, 1) has density ½.
- The constant sequence V_i = ½ v(L, 1) is stationary, with density ½ < 1, and its limit has density
  ½: the density hypothesis is necessary.
- For g_i = (1 + 1/i)² e on ℝ² and V_i the g_i-varifold of a line with multiplicity 1, Θ_gᵢ = 1 and
  the limit, the Euclidean varifold of the line, has Θ = 1.

(Simon1983 line 7566–7660; Federer1969 2.8 for coverings.) *Needs:* Layer 1.2, Layer 1.4, Layer 4.3, Layer 4.5, Layer 6.2–6.3; Mathlib
`HasBesicovitchCovering`.

### 7.2 Varifold tangents

Let V be a varifold on W ⊆ M and x ∈ W such that Θ^k(‖V‖, x) exists and is finite and
ρ¹⁻ᵏ‖δV‖(B_ρ(x)) → 0 as ρ ↓ 0, with ‖δV‖ the total first variation of 4.3, which is defined for
every varifold. The decay makes ‖δV‖(B_ρ(x)) finite for small ρ, so V has bounded first variation
on a neighbourhood of x; nothing is assumed of δV away from x. Then
every sequence λ_j ↓ 0 has a subsequence along which `V_{x,λ_j}` converges, as varifolds on T_xM, to a
varifold C that is stationary in (T_xM, g_x), whose weight is dilation invariant,
‖C‖(λA) = λ^k‖C‖(A) for λ > 0, and with ‖C‖(B_ρ(0)) = Θ^k(‖V‖, x) ω_k ρ^k for all ρ > 0, so that
Θ^k(‖C‖, 0) = Θ^k(‖V‖, x). The set VarTan(V, x) of such limits is nonempty and compact; in E it
consists of the limits of `(η_{x,λ_j})_#V` (Simon1983 line 7733–7774, 42.1–42.3; 3414–3430, 19.3,
rectifiable case). The existence of subsequential limits uses only that Θ^k(‖V‖, x) exists and is
finite: by 3.2, `‖V_{x,λ}‖(B_R(0)) = λ^{−k}‖V‖(B_{λR}(x))` (up to a factor 1 + o(1) on M) tends to
Θ^k(‖V‖, x) ω_k R^k as λ ↓ 0, which bounds the masses over every compact set for small λ, and 1.4
gives the subsequence (Simon1983 line 7738–7740, with Theorem 4.4 at line 1038–1045). The
decay of ‖δV‖ at x is what the stationarity of C, and through it the dilation invariance of its
weight, needs. For W open in E with the
flat metric, with `V_{x,λ}` read on G_k(E) as in 3.2: membership
C ∈ VarTan(V, x) (a Radon measure on G_k(E) that is the limit of `V_{x,λ_j}` along some λ_j ↓ 0) is
`Euclidean.IsVarifoldTangent`; the existence of a convergent subsequence along every λ_j ↓ 0, for
x ∈ W at which Θ^k(‖V‖, x) exists and is finite and with no hypothesis on δV, is
`Euclidean.exists_isVarifoldTangent`; and the stationarity of C, its ball masses and the dilation
invariance of its weight, under the two hypotheses of the first paragraph (the decay read with
`Euclidean.firstVariationMass`), are `Euclidean.IsVarifoldTangent.isStationary`.

Route: the mass bound above and 1.4 give subsequential limits; 4.5's blow-up form
and the hypothesis on ‖δV‖ give δ_gₓC = 0; the mass of C on balls about 0 is the limit of the
density ratios (3.2), so ρ⁻ᵏ‖C‖(B_ρ(0)) = ω_k Θ^k(‖V‖, x) for every ρ > 0, and the stationary
identity 6.1 for C at 0 forces `P_{S^⊥}(y) = 0` for C-a.e. (y, S). Dilation invariance of the weight
uses non-radial tests: for a C¹ function h with compact support in T_xM, the field X(y) = h(y) y
has div_S X = k h(y) + y·∇h(y) for C-a.e. (y, S), so stationarity gives ∫ (k h + y·∇h) d‖C‖ = 0.
Applied to y ↦ h(y/λ), this says that λ ↦ λ⁻ᵏ ∫ h(y/λ) d‖C‖(y) has derivative 0 on (0, ∞), so
the measure A ↦ λ⁻ᵏ‖C‖(λA) has the same integrals as ‖C‖ against C¹, hence against all
compactly supported continuous functions, and equals ‖C‖
(`MeasureTheory.Measure.ext_of_integral_eq_on_compactlySupported`). Radial tests h(|y|) give only
the ball masses, which do not determine the measure (Check below); Simon1983 line 3461–3481 (19.3)
uses arbitrary homogeneous weights of degree zero for the same step.

**Checks.**

- V = v(P_1, 1) + v(P_2, 1) for two k-planes through 0 in ℝ^N: VarTan(V, 0) = {V} and Θ(0) = 2.
- The triple junction of three half-lines at angles 2π/3: VarTan(V, 0) = {V}, Θ(0) = 3/2.
- For the unit circle and x on it, VarTan = {v(T_x, 1)}; for Lebesgue measure on ℝ² with a constant
  line (k = 1, stationary, Θ = 0), VarTan(V, x) = {0}.
- On the round S², V a great circle through x: `V_{x,λ}` is the varifold of a diameter of the disc of
  radius r/λ, and VarTan(V, x) = {v(T_xC, 1)}.
- Ball masses do not give dilation invariance: the measure μ on ℝ² with density
  1 + ½ sin(log r) cos ϑ with respect to dr dϑ (polar coordinates) has μ(B_ρ(0)) = 2πρ for every ρ,
  as the weight of a dilation-invariant 1-cone would, but `λ⁻¹ ∫_{B_λ(0)} cos ϑ dμ` =
  (π/4)(sin log λ − cos log λ) is −π/4 at λ = 1 and π/4 at λ = e^π. Every radial test gives the
  value of the invariant measure dr dϑ and the angular test cos ϑ separates them. The theorem is not
  contradicted: by the stationary identity and the step above, μ is not the weight of any stationary
  1-varifold on ℝ².
- Existence needs no first-variation hypothesis, stationarity does. In ℝ² with k = 1 let V be the
  vertical lift of H¹⌞(x-axis), every plane the vertical line. Then ‖V‖(B_ρ(0)) = 2ρ, so
  Θ^1(‖V‖, 0) = 2ρ/(ω_1 ρ) = 1, and `V_{0,λ} = V` for every λ > 0: the push-forward of H¹⌞(x-axis)
  along y ↦ y/λ is λ·H¹⌞(x-axis), which the factor λ⁻¹ cancels, and the planes are unchanged. So
  every λ_j ↓ 0 gives the limit V, although V does not have locally bounded first variation (4.3)
  and ‖δV‖(B_ρ(0)) = ∞ for every ρ. The limit is not stationary: for X(y) = φ(y) y_2 e_2 with
  φ ∈ C¹_c(ℝ²), φ ≥ 0, φ(0) > 0, the integrand tr(P DX) at (t, 0) is ∂_2(φ y_2)(t, 0) = φ(t, 0), so
  δV(X) = ∫ φ(t, 0) dt > 0.
- The first-variation hypothesis is local at x. In ℝ² with k = 1 let L be the x-axis, V' the
  vertical lift of H¹⌞{y_2 = 5} (every plane the vertical line), V = v(L, 1) + V' and x = 0. For
  ρ < 5, ‖V‖(B_ρ(0)) = 2ρ, so Θ^1(‖V‖, 0) = 1, and ‖δV‖(B_ρ(0)) = 0, since a field supported in
  B_ρ(0) vanishes on {y_2 = 5} and v(L, 1) is stationary; both hypotheses hold. V' has no locally
  bounded first variation near {y_2 = 5} (4.3), so neither has V on ℝ², and a statement asking for
  it on all of W would not apply. `V_{0,λ}` is v(L, 1) plus the vertical lift of H¹⌞{y_2 = 5/λ},
  which leaves every compact set, so VarTan(V, 0) = {v(L, 1)}: stationary, with
  ‖C‖(B_ρ(0)) = 2ρ = Θ^1(‖V‖, 0) ω_1 ρ.

(Simon1983 line 7733–7774, 3414–3481.) *Needs:* Layer 1.4, Layer 3.2, Layer 4.5, Layer 6.1;
Mathlib `MeasureTheory.Measure.ext_of_integral_eq_on_compactlySupported`.

### 7.3 Allard's rectifiability theorem

Let V have locally bounded first variation in W ⊆ M with Θ^k(‖V‖, x) > 0 for ‖V‖-a.e. x ∈ W. Then V is
rectifiable: V = v(Γ, θ) with Γ countably k-rectifiable, θ = Θ^k(‖V‖, ·) locally Hᵏ-integrable
(Simon1983 line 7775–7790, 42.4–42.5; AgnolettoCorreaHoyosDaSilvaNardulli2025 line 1796–1798,
Theorem 2.32). For W = M, with rectifiability in the C¹-piece form of 2.2, this is
`isRectifiable_of_ae_density_pos`; the hypothesis there asks that Θ^k(‖V‖, x) exist and be
positive at ‖V‖-a.e. x, which under locally bounded first variation is the same as a positive
lower density a.e., since the density exists a.e. (6.3).

Route (Simon1983 line 7806–7881): at ‖V‖-a.e. x, (i) Θ(x) ∈ (0, ∞) exists (6.3), (ii) the fibre
measure ν^x is the limit of ball averages (3.3), (iii) Θ is ‖V‖-approximately continuous at x (the
Vitali family of 3.3), and (iv) ‖δV‖(B_ρ(x)) ≤ Λ(x)‖V‖(B_ρ(x)) for small ρ (6.3, at points of
positive density, which are ‖V‖-almost all points here). At such x each
C ∈ VarTan(V, x) (7.2) satisfies Θ(‖C‖, y) ≥ Θ(x) for ‖C‖-a.e. y, by 7.1 applied to the rescaled
varifolds Ṽ_λⱼ of 4.5 for the metrics g̃_λⱼ → g_x (divided by (1 − ε)Θ(x)), and so at every
y ∈ spt‖C‖ (6.3); since ρ⁻ᵏ‖C‖(B_ρ(y)) is non-decreasing in ρ (6.1, C stationary in all of
T_xM) and, because `B_ρ(y) ⊆ B_{ρ+|y|}(0)`, at most Θ(x)ω_k(1 + |y|/ρ)^k, which tends to Θ(x)ω_k as
ρ → ∞ (the weight's form, 7.2), ‖C‖(B_ρ(y)) ≤ Θ(x)ω_kρ^k for every ρ > 0; with this, the identity
6.1 for C at y gives `P_{S^⊥}(z − y) = 0`, so spt‖C‖ lies in a k-plane T, 6.4 gives
C = Θ(x) v(T, 1), and (ii) makes T unique; 3.3's first rectifiability theorem concludes. The chart
transport asserted in AgnolettoCorreaHoyosDaSilvaNardulli2025's proof is not used.

**Checks.**

- Lebesgue measure on ℝ² with a constant line is stationary with Θ^1 = 0 everywhere and is not
  rectifiable: positive density is necessary.
- The triple junction and v(L, 1/2) are rectifiable, with θ = Θ equal to 1 off the junction and to
  1/2 respectively.
- The vertical lift of H¹⌞(x-axis) has positive density and is not rectifiable; consistently it does
  not have locally bounded first variation (4.3).

(Simon1983 line 7775–7881; Allard1972 Section 5.) *Needs:* Layer 3.3, Layer 4.5, Layer 6.1, Layer 6.3–6.4, Layer 7.1–7.2.

### 7.4 Compactness of rectifiable varifolds

In the standing setting let (V_i) be any sequence of rectifiable varifolds with locally bounded
g_i-first variation, sup_i (‖V_i‖(U) + ‖δ_gᵢV_i‖(U)) < ∞ for every open U with compact closure in
W, and Θ^k_gᵢ(‖V_i‖, ·) ≥ 1 ‖V_i‖-a.e. outside sets B_i with ‖V_i‖(B_i ∩ K) → 0 for compact K.
Then there are a strictly increasing sequence i_1 < i_2 < … and a varifold V on G_k^g(W) with
`V_{i_j} → V`, and every such subsequential limit V is rectifiable, has locally bounded g-first
variation and Θ^k_g(‖V‖, ·) ≥ 1 ‖V‖-a.e., and satisfies
`‖δ_g V‖(U) ≤ lim inf_j ‖δ_{g_{i_j}}V_{i_j}‖(U)` for every open U with compact closure in W; if every
V_i is stationary for g_i, V is stationary for g (Simon1983 line 7886–7898, 42.7). Here a
subsequential limit is a Radon measure on G_k^g(W) (Conventions). For a fixed metric (g_i = g for
every i) and W = M this is `rectifiable_compactness`.

Route: 1.4 for a convergent subsequence; 7.1, applied to that subsequence, for the density bound
and the first variation; 7.3 for rectifiability.

**Checks.**

- The full sequence need not converge: in ℝ² let V_i be the varifold of the line {y_2 = 0} for even
  i and of {y_2 = 1} for odd i. Each is stationary with Θ = 1 and ‖V_i‖(B_R(0)) ≤ 2R, so the
  hypotheses hold; a nonnegative test function supported in `B_{1/2}(0) × G(ℝ², 1)` with integral 1
  against the first line has integrals alternating between 1 and 0, while the even and odd
  subsequences converge to two different stationary rectifiable limits. A version assuming V_i → V
  would not apply to this sequence.
- Zigzag graphs over [0, 1] with slopes ±1 and amplitude 1/i (i segments of horizontal length 1/i)
  are integral with Θ = 1 and H = 0 on the segments, but ‖δV_i‖ has an atom of mass √2 at each of
  the i − 1 interior corners (at a peak the outward unit co-normals of the two segments are
  (1, 1)/√2 and (−1, 1)/√2, with sum (0, √2); at a trough they are (1, −1)/√2 and (−1, −1)/√2, with
  sum (0, −√2); the unit tangents (1, ±1)/√2 would add up to the horizontal (√2, 0), the wrong
  direction for the atom) and an atom of mass 1 at each endpoint, so
  ‖δV_i‖(ℝ²) = √2(i − 1) + 2 → ∞; for i = 2, the graph through (0, 0), (1/2, 1/2), (1, 0), it is
  √2 + 2. Their limit has weight
  √2 H¹⌞([0, 1] × {0}) and fibre measure `½δ_{P_+} + ½δ_{P_−}` for the lines P_± at ±45°, so it is not
  rectifiable: the first variation bound is necessary.
- Circles of radius 1/i about 0: masses 2π/i → 0, ‖δV_i‖ = 2π, the limit is 0, which is rectifiable.
- Varifolds of the lines y_2 = 1/i converge to the varifold of the x-axis, with all first variations 0.

(Simon1983 line 7882–7898; Allard1972 Section 6.) *Needs:* Layer 1.4, Layer 7.1, Layer 7.3.

### 7.5 Allard's multiplicity lemma

Let p and q be the orthogonal projections of ℝ^N onto ℝ^k × {0} and {0} × ℝᴺ⁻ᵏ, let B_ρ(y) be
Euclidean balls, and for a k-plane S let P_S be its Euclidean orthogonal projection. For δ ∈ (0, 1)
and Λ ≥ 1 there is ε = ε(δ, Λ, k, N) ∈ (0, δ²) with the following property. Let h be a smooth metric
on B_3(0) ⊆ ℝ^N with `‖h − e‖_{C²(B_3(0))} < ε²`, and V an integral varifold on B_3(0) for h (regarded
on B_3(0) × G(ℝ^N, k) through 1.2) with locally bounded h-first variation and

`‖V‖(B_3(0)) ≤ Λ,   ‖δ_h V‖(B_3(0)) < ε²,   ∫_{G_k(B_3(0))} ‖P_S − p‖ dV(y, S) < ε²`.

The third quantity is called the tilt of V over B_3(0) (relative to ℝ^k × {0}) below. It is
unsquared, with the operator norm of 1.1, and is not divided by a power of the radius; it is not the
tilt-excess of Simon1983 §22 (line 3779–3798), which integrates the square of the distance
between the planes over a ball and divides by the k-th power of its radius.

Then there is a Borel set Z ⊆ spt‖V‖ ∩ B_2(0) with ‖V‖(Z) < δ such that, for every
x ∈ B_1(0) ∩ (ℝ^k × {0}), the density Θ^k(‖V‖, y) for h exists at every point
y ∈ (p⁻¹(x) ∩ spt‖V‖) ∖ Z with |q(y)| < ε, and the sum of these densities is at most
(1 + δ)(ω_k 2^k)⁻¹‖V‖(B_2(x)) + δ. Moreover p(Z) ∩ B_1(0) lies in a Borel set
A ⊆ B_1(0) ∩ (ℝ^k × {0}) of k-dimensional Lebesgue measure less than δ, so for every
x ∈ (B_1(0) ∩ ℝ^k × {0}) ∖ A the same bound holds for the sum of Θ^k(‖V‖, y) over all points
y ∈ p⁻¹(x) ∩ spt‖V‖ with |q(y)| < ε. For h = e this last bound is Simon1983 line 7991–8000 (42.9,
printed p. 250): the thresholds ε² for the first variation and for the tilt, and the slab half-width
ε, are the source's. The set Z, its mass bound and the bound off Z over every x come from the proof
(line 8014–8151), which uses the slab estimates only at the fibre points themselves. The case h ≠ e,
with the threshold ε² for the metric, is this roadmap's.

Route: Simon's proof (Simon1983 line 8001–8151, 42.10 and the proof of 42.9) has three steps.
(i) Let R be the set of points y ∈ spt‖V‖ ∩ B_2(0) at which ‖δV‖(B_ρ(y)) ≤ ε‖V‖(B_ρ(y)) or
`∫_{G_k(B_ρ(y))} ‖P_S − p‖ dV ≤ ερ^k` fails for some ρ ∈ (0, 1). By Besicovitch's covering theorem
‖V‖(R) is at most cε⁻¹ times the sum of the two ε²-small quantities, hence at most cε (line
8014–8046); this is where the squares are used. Put `Z = R ∩ {Θ^{*k}(‖V‖, ·) > 0}` and shrink ε so
that cε < δ/4. A point of R ∖ Z has density 0 and adds nothing to a fibre sum; at a point off R the
density exists by the monotonicity of step (ii). To bound p(Z), write
V = v(Γ, θ) with θ integer valued and let Γ' be the set of points of Γ at which θ is a positive
integer equal to Θ^k(‖V‖, ·), an Hᵏ-full subset of Γ (2.1). By 2.2's vanishing off the carrier,
Z ∖ Γ' is Hᵏ-null; since p is 1-Lipschitz and θ ≥ 1 on Γ', the k-dimensional Lebesgue measure of
p(Z) is at most Hᵏ_e(Z ∩ Γ') ≤ (1 + Cε²)‖V‖(Z) < δ/2, where Hᵏ_e is the Euclidean Hausdorff
measure; A is an open subset of B_1(0) ∩ (ℝ^k × {0}) of measure less than δ containing
p(Z) ∩ B_1(0) (outer regularity of Lebesgue measure). The projection of R itself need not be small
(the disc Check below). (ii) At the points off R the identity and the
weighted identity of 6.1, with weights f(|q(z − y)|), f = 1 on [0, τ] and f = 0 on [2τ, ∞), bound
the masses of the slabs U^τ_σ(y) = B_σ(y) ∩ {|q(z − y)| < τ} with errors cεσ/τ (line 8052–8083).
(iii) An induction on the number n of points of a fibre off R, at slab scale τ comparable to δ²
times the least vertical separation of the points, with the centres of each stage chosen among
those points, proves the bound for any n such points with a threshold ε_n depending on n (line
8084–8151; it also lowers δ below a threshold depending on n, which is harmless because the
conclusion for a smaller δ implies it for a larger one, line 8010–8011). So the number of points
that count is bounded first (line 8001–8011, 42.10, which uses a lower density bound at these
points). At y ∈ (spt‖V‖ ∩ B_2(0)) ∖ R the ratio bound and the monotonicity of 6.1–6.2 give
‖V‖(B_ρ(y)) ≤ CΛρ^k, so ρ¹⁻ᵏ‖δ_hV‖(B_ρ(y)) ≤ CΛερ → 0, and Θ^k(‖V‖, y) exists (6.3, whose
route needs the ratio bound only on chart balls, here Euclidean balls); thus 7.2 applies at y.
Each C ∈ VarTan(V, y) is stationary, has Θ^k(‖C‖, ·) ≥ 1 ‖C‖-a.e. by 7.1 applied to
the rescaled varifolds of 4.5 (V is integral, so Θ^k(‖V‖, ·) ≥ 1 ‖V‖-a.e., 2.1), and so
Θ^k(‖C‖, ·) ≥ 1 at every point of spt‖C‖ by 6.3's upper semicontinuity. If Θ^k(‖V‖, y) > 0, then
‖C‖(B_ρ(0)) = Θ^k(‖V‖, y)ω_kρ^k > 0 for every ρ, so 0 ∈ spt‖C‖ and
Θ^k(‖V‖, y) = Θ^k(‖C‖, 0) ≥ 1. Every density off R is therefore 0 or at least 1. Let n_0 be the
integer part of (1 + δ)Λ(ω_k 2^k)⁻¹ + δ; since ‖V‖(B_2(x)) ≤ Λ, the bound for n_0 + 1 points
excludes n_0 + 1 points of positive density in a fibre off R, and ε is taken at most the least of
`ε_1, …, ε_{n_0+1}`. For h ≠ e, steps (ii)–(iii)
are run at each centre y in linear coordinates that make h(y) Euclidean (a linear map within Cε²
of the identity). On B_ρ(y) the metric then differs from the constant metric h(y) by at most Cε²ρ
in C⁰ and Cε² in C¹, so by 4.5 the first variation of each test field used (|X| ≤ ρ,
|DX| ≤ C(1 + ρ/τ)) changes by at most Cε²ρ(1 + ρ/τ)‖V‖(B_ρ(y)). Against the factor ρ⁻ᵏ⁻¹ of 6.1,
and with the mass-ratio bound of 6.2, this integrates over (τ, σ) to at most
Cε²σ(1 + σ/τ) ≤ 2Cεσ/τ, an error of the source's form. The linear change of coordinates moves
slabs, projections, balls and densities by factors 1 + O(ε²), which shrinking ε absorbs.

**Checks.**

- V = m v(ℝ^k × {0}, 1)⌞B_3(0) with integer m ≥ 1 and Λ ≥ m ω_k 3^k, h = e: tilt 0, δV = 0 in B_3(0),
  ‖V‖(B_2(x)) = m ω_k 2^k, each fibre has the single point x with density m, and the bound
  m ≤ (1 + δ)m + δ holds with Z = A = ∅ (no point fails the ratio bounds of step (i)); the count
  of step (iii) allows n_0 ≥ m ≥ 1 points of positive density, because
  (1 + δ)Λ(ω_k 2^k)⁻¹ ≥ m(3/2)^k ≥ m, and there is one.
- The dichotomy of step (iii) holds only off R. For k = 2, N = 3, h = e and V = v(D, 1), D the
  horizontal disc of radius r about 0 with 2πr < ε², the tilt is 0, ‖δV‖ = H¹⌞∂D has mass
  2πr < ε², and a point y ∈ ∂D has Θ²(‖V‖, y) = ½. For ρ ≤ r the arc ∂D ∩ B_ρ(y) has length at
  least 2ρ and D ∩ B_ρ(y) lies in a half-disc of area πρ²/2, so the ratio ‖δV‖(B_ρ(y))/‖V‖(B_ρ(y))
  is at least 4/(πρ) > ε: y lies in R, and in Z because its density is positive, so the density ½
  is never counted.
- Two parallel planes ℝ^k × {±ε/2} with multiplicity 1: fibre sum 2 and mass ratio about 2.
- A plane through 0 tilted by angle α in one coordinate 2-plane has tilt |sin α| ‖V‖(B_3(0)) (the
  operator-norm distance of 1.1; integrating its square instead would give sin²α ‖V‖(B_3(0))), so the
  hypotheses fail once |sin α| ‖V‖(B_3(0)) ≥ ε²; the tilted plane through 0
  still satisfies the conclusion, showing that the tilt hypothesis is used for the slab, not for
  single planes.
- Parameter accounting (h = e): if ε = 1/10 (possible only when δ² > 1/10), the hypotheses ask for
  first variation and tilt below 1/100 while the counted slab is {|q| < 1/10}. Step (i) bounds
  ‖V‖(R) by cε⁻¹(ε² + ε²) = 2cε = c/5; with unsquared thresholds ε the same bound would be
  cε⁻¹(ε + ε) = 2c, which does not become small with ε, and the mass bound on Z, from which the
  measure bound on A follows, would be lost.
- The Lebesgue-measure form of the conclusion alone does not give 7.6. On B_1(0) ⊆ ℝ^k let
  ψ_i = 1 + i·1_Eᵢ, where E_i is a finite union of disjoint balls of radius at most 1/i² placed so
  that i·1_Eᵢ → ½ weakly; then Lᵏ(E_i) → 0. Each ψ_i is integer valued, ψ_i ≤ 3/2 off E_i and
  ψ_i Lᵏ → (3/2)Lᵏ, yet 3/2 is not an integer and min(ψ_i, 2) = 1 + 1_Eᵢ → 1, not 3/2, in L¹. As
  the fibre sums of 7.6's blow-ups (where (ω_k 2^k)⁻¹‖Ṽ_i‖(B_2(ξ)) → 3/2) this is excluded by the
  mass bound on Z: for δ < min{1/7, ω_k/2} the part of ψ_i counted off Z is an integer at most
  (1 + δ)(3/2) + 2δ < 2, hence at most 1, so over E_i at least i of the counted multiplicity lies in
  Z, and by the area formula (3.1) Z carries mass at least about i·Lᵏ(E_i) → ω_k/2 > δ.
- The set Z cannot be all of R. Take k = 2, N = 3, h = e and V the sum of the multiplicity-one
  varifolds of disjoint horizontal discs D_j ⊆ B_3(0) of radii r_j < ε whose centres are dense in
  B_3(0), with Σ_j 2πr_j < ε². The tilt is 0, ‖δV‖(B_3(0)) ≤ Σ_j 2πr_j < ε², ‖V‖(B_3(0)) < ε² and
  spt‖V‖ ⊇ B_3(0). For y ∈ B_2(0), the radii ρ for which the sphere ∂B_ρ(y) meets D_j form an
  interval of length at most 2r_j, of total length less than ε²/π < ½, so some ρ ∈ (½, 1) has
  ∂B_ρ(y) disjoint from every disc; B_ρ(y) then contains whole discs only, at least one, and
  ‖δV‖(B_ρ(y)) ≥ (2/sup_j r_j)‖V‖(B_ρ(y)) > ε‖V‖(B_ρ(y)). So R = B_2(0) and p(R) ∩ B_1(0) is the
  whole unit disc, of measure π. The points of positive upper density lie in ⋃_j D_j up to an
  H²-null set (2.2), so p(Z) has measure at most Σ_j πr_j² < ε², and every fibre sum off Z is 0.

(Simon1983 line 7986–8151.) *Needs:* Layer 2.1–2.2, Layer 4.5, Layer 6.1–6.3, Layer 7.1–7.2;
Mathlib `HasBesicovitchCovering`, `LipschitzWith.hausdorffMeasure_image_le`.

### 7.6 Integral compactness

If, in 7.4, the V_i are integral, then every subsequential limit V given by 7.4 is integral
(Simon1983 line 7899–7912, 42.8; Allard1972, Section 6). For integral V_i the density hypothesis
of 7.4 holds with B_i = ∅ (their multiplicities are positive integers ‖V_i‖-a.e.), so the
hypotheses are integrality, locally bounded first variation and the local bound on
‖V_i‖(U) + ‖δ_gᵢV_i‖(U). For a fixed metric and W = M this is `integral_compactness`.

Route (Simon1983 line 7916–7985), with the convergent subsequence relabelled V_i: Besicovitch in
charts gives, for ‖V‖-a.e. x, lim inf_i
‖δ_gᵢV_i‖(B_ρ(x)) ≤ c(x)ρ^k for small ρ; at ‖V‖-a.e. x the varifold V = v(Γ, θ) has tangent space
T_x with multiplicity θ(x) (7.4, 3.3); in g-normal coordinates at x a diagonal choice λ_i ↓ 0 gives
the rescaled varifolds Ṽ_i of V_i at x with scale λ_i (4.5's blow-up form, with the chart exp_x of g
and the metric g_i), integral varifolds for the metrics h_i(z) = (exp_x^* g_i)(λ_i z) → g_x in C², with
Ṽ_i → θ(x) v(T_x, 1), first variation → 0 and tilt (7.5) → 0 on B_3(0), where T_xM is identified with
ℝ^N by a g_x-orthonormal basis taking T_x to ℝ^k × {0}, so that g_x = e. Fix δ ∈ (0, 1), take
Λ = θ(x)ω_k 3^k + 1 and ε = ε(δ, Λ, k, N) of 7.5 with p, q as there, and write Ṽ_i = v(Γ_i, θ_i)
with θ_i integer valued. For large i, Ṽ_i satisfies 7.5's hypotheses; let Z_i be its set Z. For
ξ ∈ B_1(0) ∩ (ℝ^k × {0}) let ψ'_i(ξ) and ψ''_i(ξ) be the sums of θ_i over the points of
Γ_i ∩ p⁻¹(ξ) ∩ {|q| < ε} outside and inside Z_i, and ψ_i = ψ'_i + ψ''_i. Since Hᵏ-a.e. point of Γ_i
lies in spt‖Ṽ_i‖ and has θ_i = Θ^k(‖Ṽ_i‖, ·) (2.1), and the image under p of an Hᵏ-null set is
Lᵏ-null, 7.5 gives, for Lᵏ-a.e. ξ ∈ B_1(0),
ψ'_i(ξ) ≤ (1 + δ)(ω_k 2^k)⁻¹‖Ṽ_i‖(B_2(ξ)) + δ ≤ (1 + δ)θ(x) + 2δ for large i, because
`lim sup_i sup_{|ξ| ≤ 1} ‖Ṽ_i‖(B_2(ξ)) ≤ θ(x)ω_k 2^k`. By the area formula (3.1; the Jacobian of p on a
k-plane is at most 1), ∫ ψ''_i dLᵏ ≤ (1 + o(1))‖Ṽ_i‖(Z_i) ≤ (1 + o(1))δ; by the area formula and
Ṽ_i → θ(x) v(ℝ^k × {0}, 1), ψ_i Lᵏ → θ(x) Lᵏ as measures on B_1(0), so
`∫_{B_1(0)} ψ'_i dLᵏ ≥ θ(x)ω_k − δ − o(1)`. With a = (1 + δ)θ(x) + 2δ ≥ ψ'_i, the pointwise bound
|ψ'_i − θ(x)| ≤ (a − ψ'_i) + (a − θ(x)) gives
`lim sup_i ∫_{B_1(0)} |ψ'_i − θ(x)| dLᵏ ≤ 2(δθ(x) + 2δ)ω_k + δ`. Each ψ'_i is integer valued, so
ω_k dist(θ(x), ℤ) is at most the right side: dist(θ(x), ℤ) ≤ 2(δθ(x) + 2δ) + δ/ω_k for every
δ ∈ (0, 1), and θ(x) is an integer. The mass bound on Z_i is what excludes fibre multiplicities
concentrating on sets of small measure (the spike Check of 7.5); the source's text at line 7977–7985
uses only the measure bound on the exceptional set.

**Checks.**

- Varifolds v(L, 1) + v(L_i, 1) with lines L_i → L converge to v(L, 2): multiplicities add.
- The constant sequence ½ v(L, 1) is rectifiable, not integral, and its limit is not integral: the
  theorem needs integral V_i.
- The segment varifolds of 7.1 converge to ½ v([0, 1] × {0}, 1), not integral; their first variations
  are unbounded, so 7.4's hypotheses fail.

(Simon1983 line 7899–7985; Allard1972 Section 6.) *Needs:* Layer 2.1, Layer 3.1, Layer 3.3,
Layer 4.5, Layer 7.4–7.5; Mathlib `HasBesicovitchCovering`, `LipschitzWith.hausdorffMeasure_image_le`.

### Examples

Segments of half density and zigzags as the two ways compactness can fail; shrinking circles; the
triple junction as a rectifiable stationary varifold with a singular point.

### Dependencies

Layers 1–4 and 6; Mathlib Besicovitch and Vitali coverings,
`MeasureTheory.Measure.ext_of_integral_eq_on_compactlySupported` and
`LipschitzWith.hausdorffMeasure_image_le`.

## Layer 8: tangent cones

### 8.1 Rectifiable tangent cones

Let V and x be as in 7.2, and suppose moreover that
ρ⁻ᵏ‖V‖({y ∈ B_ρ(x) : Θ^k(‖V‖, y) < 1}) → 0 as ρ ↓ 0. Then every C ∈ VarTan(V, x) is rectifiable and
satisfies `(η_{0,λ})_#C = C` for every λ > 0: C = v(Γ_C, θ_C) with λΓ_C = Γ_C and θ_C(λy) = θ_C(y), and
y ∈ T_yΓ_C wherever the tangent space exists (Simon1983 line 7793–7805, 42.6). The set
{Θ^k(‖V‖, ·) < 1} is defined up to a ‖V‖-null set, the density existing ‖V‖-a.e. (6.3); it may be
read with the upper density. For W open in E with the flat metric, the rectifiability of C and the
invariance `(η_{0,λ})_#C = C` are `Euclidean.IsVarifoldTangent.isRectifiable`.

Route: 7.1 applied to the rescaled varifolds of 4.5 gives Θ(‖C‖, ·) ≥ 1 ‖C‖-a.e.; 7.3 makes C
rectifiable with θ_C = Θ(‖C‖, ·), which is dilation invariant by 7.2; `P_{S^⊥}(y) = 0` C-a.e. gives
y ∈ T_yΓ_C.

**Checks.**

- The union of two k-planes through 0 and the triple junction are cones equal to their own tangent
  cones.
- For V = ½ v(L, 1) the extra hypothesis fails (Θ = ½ < 1), yet VarTan(V, 0) = {½ v(L, 1)} is still a
  rectifiable cone: the hypothesis is sufficient, not necessary.
- For V = v(L, θ) with the step multiplicity of 6.3, ρ¹⁻ᵏ‖δV‖(B_ρ(0)) = 1 does not tend to 0 (k = 1),
  so 7.2's hypothesis fails at 0.

(Simon1983 line 7793–7805.) *Needs:* Layer 4.5, Layer 7.1–7.3.

### 8.2 Integral tangent cones

If V is integral and x satisfies 7.2's hypotheses, then every
C ∈ VarTan(V, x) is an integral varifold, stationary in (T_xM, g_x), with `(η_{0,λ})_#C = C`, and
Θ^k(‖V‖, x) = Θ^k(‖C‖, 0) ≥ 1 when x ∈ spt‖V‖ and ‖δV‖ ≤ Λ‖V‖ near x. If V is integral and stationary
in W, the hypotheses hold at every x ∈ W, and VarTan(V, x) is a nonempty compact set of stationary
integral cones (Simon1983 line 7793–7805 and 7899–7912; EdelenSpolaor2023 line 109–112 uses this
notion of tangent cone). For W open in E with the flat metric, the integrality, stationarity and
invariance of every C ∈ VarTan(V, x) are `Euclidean.IsVarifoldTangent.isIntegral`.

Route: integrality gives Θ ≥ 1 ‖V‖-a.e., so 8.1 applies; 7.6 for the blow-up sequence of 4.5 with
metrics converging to g_x gives integrality of C; 6.3 gives the density bound.

**Checks.**

- For the varifold of a smooth embedded minimal surface, the tangent cone at each point is its
  tangent plane with multiplicity 1.
- For v(P_1, 1) + v(P_2, 1), the cone at 0 is integral with density 2.
- For the cone `C_{p,q} = {q|x|² = p|y|²} ⊆ ℝ^{p+1} × ℝ^{q+1}` with multiplicity 1 (p, q ≥ 1), the cone is
  its own tangent cone at 0 and its density there equals its mass ratio on the unit ball.

(Simon1983 line 7793–7805, 7899–7912.) *Needs:* Layer 6.3, Layer 7.2, Layer 7.6, Layer 8.1.

### Examples

Unions of planes, the triple junction and the quadratic cones `C_{p,q}`; a fractional multiplicity
showing the sufficiency-only character of 8.1's hypothesis.

### Dependencies

Layers 4, 6 and 7.

## Layer 9: regular sets, invariance, currents and acceptance statements

### 9.1 Regular and singular sets

For r ∈ {1, 2, …} ∪ {∞}, a point x ∈ spt‖V‖ is C^r-regular when some open U ∋ x has spt‖V‖ ∩ U a C^r
embedded k-submanifold of U; reg^r V is the set of such points and sing^r V = spt‖V‖ ∖ reg^r V
(AgnolettoCorreaHoyosDaSilvaNardulli2025 line 89–92, Definition 1.2, for r = 1; Simon2023 line
73–83 for r = ∞ and hypersurfaces).

- reg^r V is open in spt‖V‖ and sing^r V is closed in W; `reg^∞ V ⊆ reg^{r'} V ⊆ reg^r V` for r ≤ r'.
- For a C^r diffeomorphism f of W onto W', spt‖f_#V‖ = f(spt‖V‖), f(reg^r V) = reg^r(f_#V) and
  f(sing^r V) = sing^r(f_#V).
- For open W' ⊆ W, reg^r of the restriction of V to W' is reg^r V ∩ W'.
- If V is stationary and x ∈ reg^2 V, then for every open U ∋ x such that spt‖V‖ ∩ U is a
  connected C² embedded k-submanifold of U, the restriction of V to U is θ_0 [spt‖V‖ ∩ U] for a
  constant θ_0 > 0 (6.4 applied in U to the restriction V' of V: V' is stationary in U, because a
  field with compact support in U extends by 0 to W (4.1); spt‖V'‖ = spt‖V‖ ∩ U (1.3); and V' ≠ 0
  because x ∈ spt‖V‖).
  Such U exist: the domain of a slice chart at x, with a cube as image, of the submanifold that
  regularity provides. Hence the multiplicity is locally constant on reg^2 V.

**Checks.**

- For two crossing lines and for the triple junction, sing^r V = {0} for every r.
- For V = v(graph of `t ↦ |t|^{3/2}`, 1) in ℝ², 0 ∈ reg^1 V ∖ reg^2 V: the classes differ.
- For V = 0 both sets are empty; for ½ v(L, 1), reg^r V = L: regularity of the support ignores the
  multiplicity.
- For the cone `C_{p,q}` with multiplicity 1, sing^r = {0} for every r.
- For V = v(L_1, 1) + v(L_2, 2), two lines of ℝ² crossing at 0 (stationary), and x ∈ L_1 ∖ {0},
  x ∈ reg^2 V. A ball U about x containing 0 has spt‖V‖ ∩ U = (L_1 ∪ L_2) ∩ U connected but not a
  submanifold, and V restricted to U carries the multiplicities 1 and 2: connectedness of
  spt‖V‖ ∩ U alone does not give a constant multiple. A ball about x missing L_2 gives θ_0 = 1.

(AgnolettoCorreaHoyosDaSilvaNardulli2025 line 89–101; Simon2023 line 73–83.) *Needs:* Layer 1.3,
Layer 3.1, Layer 4.1, Layer 6.4.

### 9.2 Locality and isometry invariance

Every notion of Layers 1–4, 6 and 7 and of 9.1 commutes with restriction to an open W' ⊆ W:
weight, mass, support, convergence, rectifiability and integrality, tangent spaces and fibre
measures, δV, ‖δV‖, H_V, σ_V, η_V, stationarity and locally bounded first variation, densities,
VarTan(V, x) for x ∈ W', and reg^r, sing^r.
Every notion commutes with push-forward by a smooth isometry f of an open subset of
a Riemannian manifold onto an open subset of another (1.2 with f smooth), with H, η transported by
df (4.4) and VarTan(f_#V, f(x)) = {(df_x)_#C : C ∈ VarTan(V, x)}: `f ∘ exp_x = exp_{f(x)} ∘ df_x` on
a normal ball of x (Tau Ceti `TauCeti.RiemannianIsometry.riemannianExp_mfderiv` for f as a
Riemannian isometry of W onto W' with the restricted metrics, whose short geodesics are those of M
and M' by uniqueness of geodesics), so `(f_#V)_{f(x),λ} = (df_x)_#V_{x,λ}` by 3.1's chain rule. For an isometry that is only C¹, 1.2 and 3.1
still give the bundle homeomorphism and J_S f = 1, but the first variation and this route need f
smooth; that a C¹ isometry is smooth is the Myers–Steenrod theorem, which this roadmap does not use.
Every notion is independent of charts because no chart enters the definitions. Euclidean dilations
preserve stationarity, rectifiability, integrality, reg^r and sing^r, satisfy
`Θ^k(‖V_{x,λ}‖, η_{x,λ}(y)) = Θ^k(‖V‖, y)` and `VarTan(V_{x,λ}, η_{x,λ}(y)) = VarTan(V, y)`, and scale
H_V, ‖δV‖ and σ_V as in 4.4 (this roadmap; Simon1983 line 7443–7454).

**Checks.**

- Rotating two crossing lines rotates the tangent cone and keeps Θ(0) = 2.
- Restricting the unit circle to an open set meeting it in an arc gives the arc, with the same H
  and no boundary measure inside the open set.
- The dilation by λ⁻¹ of the circle of radius R has H of length λ/R and the same density 1.

*Needs:* Layers 1–4, 6 and 7, Layer 9.1; HopfRinow Layer 1 (uniqueness of geodesics); Tau Ceti
`TauCeti.RiemannianIsometry.riemannianExp_mfderiv`,
`Bundle.ContMDiffRiemannianMetric.restrictOpenTangentSpace`.

### 9.3 Comparison with GeometricCurrents G6

Let T be a locally integral k-current on W (GeometricCurrents G2), represented by a countably
k-rectifiable carrier Γ_T, an orienting simple k-vector and an integer multiplicity θ_T (which may
vanish on part of Γ_T), let Γ_T⁺ = {x ∈ Γ_T : θ_T(x) ≠ 0}, a countably k-rectifiable Hᵏ-measurable
set on which |θ_T| is positive and locally Hᵏ-integrable, and let 𝐯_T be GeometricCurrents G6's
auxiliary varifold of T. Through 1.2's homeomorphism, 𝐯_T = v(Γ_T⁺, |θ_T|), an integral varifold
whose weight is the mass measure ‖T‖ = |θ_T| Hᵏ⌞Γ_T; G6's weak first variation of T under
compactly supported ambient flows equals δ v(Γ_T⁺, |θ_T|); G6's density, monotonicity with
Riemannian error bounds and tangent cones of T are 6.1–6.3, 7.2 and 8.2 for v(Γ_T⁺, |θ_T|); and for
a locally minimizing T (GeometricCurrents G5), G6's stationarity is the stationarity of
v(Γ_T⁺, |θ_T|) (this roadmap; Simon1983 line 7253–7293).

**Checks.**

- The current of an oriented k-plane with multiplicity 2 has varifold v(P, 2); reversing the
  orientation gives the same varifold.
- The current [[P]] + (−[[P]]) is 0 and its varifold is 0, while v(P, 1) + v(P, 1) = v(P, 2): the
  varifold of a sum of currents is not the sum of their varifolds. Represented on the carrier P with
  the orientation of [[P]], the sum has θ_T = 1 − 1 = 0, so Γ_T⁺ = ∅ and v(∅, ·) = 0; the
  expression v(P, 0) is not a varifold of 2.2, whose multiplicities are positive.
- The current of a smooth closed oriented curve with multiplicity 1 has varifold [curve], with
  H = curvature vector.

*Needs:* Layer 1.2, Layer 2.2, Layer 4.1–4.4, Layer 6.1–6.3, Layer 7.2, Layer 8.2; GeometricCurrents
G1, G2, G5, G6.

### 9.4 Statement-level acceptance tests

The following theorems of the literature are statable with the definitions of this roadmap; they are
neither targets nor headline theorems of this roadmap, and test that its carrier and notions are the
ones the literature uses.

- Simon's theorem (Simon2023 line 84–96, Theorem 1.1, and line 432–441, Theorem 3.7). Let n ≥ 3,
  m ≥ 2, n + m ≥ 8, ℓ ≥ 1 and K ⊆ ℝ^ℓ closed. For every sufficiently small τ ∈ (0, 1) there are a
  smooth f(x, y) on ℝ^n × ℝ^ℓ with sup|f − 1| < τ and sup|D^j f| < C(ℓ, m, n, j)τ for j ≥ 1, and a
  smooth embedded hypersurface `Σ ⊆ ℝ^{n+m+ℓ}` with locally finite area and Σ = reg^∞[Σ] (Σ is the
  whole regular set of its closure, Simon's standing convention, Simon2023 line 77–83; then
  sing^∞[Σ] is the closure of Σ minus Σ), such that for the metric
  g = Σ dx_i² + f(x, y) Σ dξ_j² + Σ dy_k² the varifold [Σ] for g is stationary in `(ℝ^{n+m+ℓ}, g)` and
  sing^∞[Σ] = {0} × {0} × K. Simon's theorem also asserts strict stability, a second-variation
  statement of RiemannianGeometry R5b's kind, which is not restated here.
- Edelen–Spolaor's theorem in dimensions n ≥ 8 (EdelenSpolaor2023 line 104–135, Definition 1.1.1,
  Remark 1.2 and Theorem 1.4). Let V be a stationary integral n-varifold in the open unit ball B_1 of
  ℝⁿ⁺¹ with Θ^n(‖V‖, ·) = 1 ‖V‖-a.e., sing^∞ V ⊆ {0}, and some element of VarTan(V, 0) equal to
  `R_# v(C_{p,q}, 1)` for integers p, q ≥ 1 with p + q = n − 1 and a linear isometry R (the cone
  `C_{p,q} = {q|x|² = p|y|²} ⊆ ℝ^{p+1} × ℝ^{q+1}` is not a submanifold at 0, and `v(C_{p,q}, 1)` =
  `[C_{p,q} ∖ {0}]` for the smooth embedded hypersurface `C_{p,q} ∖ {0}` of locally finite area). If V_i
  are stationary integral n-varifolds in B_1 with V_i → V, then for all large i, `sing^∞(V_i) ∩ B_{1/2}`
  is either empty or a single point y_i at which some element of VarTan(V_i, y_i) equals
  `R'_# v(C_{p,q}, 1)` for a linear isometry R'. (For n ≥ 8 every `C_{p,q}` is area minimizing, so the
  minimizing hypothesis of Theorem 1.4 holds.)

**Checks.**

- Each notion used is defined above: [Σ] for a metric (2.3), stationarity for a metric (4.3),
  sing^∞ (9.1), integral varifolds and multiplicity one (2.2, 6.3), varifold convergence (1.4) and
  tangent cones (7.2, 8.2).
- In Simon's theorem with K = ∅, sing^∞[Σ] = ∅, so the closure of Σ is reg^∞[Σ] = Σ and Σ is
  closed. The convention Σ = reg^∞[Σ] is what gives closedness: for n = 3, m = 5, ℓ = 1, f = 1 and
  Σ = (ℝ⁸ × {0}) ∖ {0} in ℝ⁹, [Σ] = [ℝ⁸ × {0}] is stationary with empty singular set, but Σ is not
  closed; it violates the convention, since reg^∞[Σ] = ℝ⁸ × {0} contains the missing origin.
- `V = v(C_{p,q}, 1)` itself, with V_i = V, satisfies the conclusion of the second statement with
  y_i = 0.

*Needs:* Layer 1.4, Layer 2.2–2.3, Layer 3.1, Layer 4.3, Layer 6.3, Layer 7.2, Layer 8.2,
Layer 9.1.

### Examples

Crossing lines, the `|t|^{3/2}` graph and the quadratic cones for regular and singular sets; the
current of a plane with multiplicity and the cancelling sum of two currents.

### Dependencies

Layers 1–4 and 6–8; GeometricCurrents G1, G2, G5, G6; HopfRinow Layer 1; Tau Ceti
`TauCeti.RiemannianIsometry.riemannianExp_mfderiv` and
`Bundle.ContMDiffRiemannianMetric.restrictOpenTangentSpace`.

## Downstream consumers

- The comparison with GeometricCurrents G6 (9.3) runs in the supplier direction: GeometricCurrents
  is earlier and does not consume this roadmap.
- Varifolds, Part II: Allard's regularity theorem, Euclidean and intrinsically Riemannian
  (Allard1972 Section 8; AgnolettoCorreaHoyosDaSilvaNardulli2025 Section 3), starts from the carrier,
  the first variation, the monotonicity formula, the density theorems and varifold tangents of
  Layers 1–8.
- Almgren–Pitts min-max and the existence of minimal hypersurfaces, Brakke flows, stable
  codimension-one regularity and interface regularity for isoperimetric clusters are formulated in
  the literature with this notion of varifold, and roadmaps on them consume Layers 1–8; the two
  statements of 9.4 are formulated in it.

## References

Locators of the form "line N" count lines of the text of the version listed below: the 1983
edition of Simon1983 published by the Centre for Mathematical Analysis of the Australian National
University, and the arXiv versions named for Scharrer2022, AgnolettoCorreaHoyosDaSilvaNardulli2025,
Simon2023 and EdelenSpolaor2023. Allard1972, Federer1969 and Maggi2012 are cited by section only.

- Simon1983: L. Simon, *Lectures on Geometric Measure Theory*, Proc. Centre Math. Anal. Austral.
  Nat. Univ. 3 (1983): §3 (densities, the covering lemma), §4 (Radon measures, Riesz representation,
  compactness, coverings), §9 (first variation of submanifolds), §11 (approximate tangent spaces),
  §§15–19 (rectifiable varifolds, monotonicity, tangent cones), Chapter 8 §§38–42 (general
  varifolds).
- Allard1972: W. K. Allard, *On the first variation of a varifold*, Ann. of Math. (2) 95 (1972),
  417–491: Sections 3 (varifolds), 4 (first variation), 5 (monotonicity and rectifiability),
  6 (compactness), 8 (regularity).
- Scharrer2022: C. Scharrer, *Some geometric inequalities for varifolds on Riemannian manifolds based
  on monotonicity identities*, Ann. Global Anal. Geom. (2022), arXiv 2105.13211v2: §1.1, Lemmas 2.7,
  3.3, Remark 3.4.
- AgnolettoCorreaHoyosDaSilvaNardulli2025: M. Agnoletto, J. C. Correa Hoyos, M. F. da Silva,
  S. Nardulli, *Allard's interior ε-regularity theorem in Alexandrov spaces*, arXiv 2504.10758v3:
  Section 2 (intrinsic varifolds on Riemannian manifolds), Definition 1.2.
- Federer1969: H. Federer, *Geometric Measure Theory*, Springer: 2.5 (Riesz representation), 2.8
  (coverings), 3.2 (rectifiable sets and the area formula).
- Maggi2012: F. Maggi, *Sets of Finite Perimeter and Geometric Variational Problems*, Cambridge
  Univ. Press, Part II (rectifiable sets and the area formula), background for Layer 2.
- Simon2023: L. Simon, *Stable minimal hypersurfaces in `ℝ^{N+1+ℓ}` with singular set an arbitrary
  closed K ⊆ {0} × ℝ^ℓ*, Ann. of Math. 197 (2023), arXiv 2101.06401v2: Theorems 1.1 and 3.7.
- EdelenSpolaor2023: N. Edelen and L. Spolaor, *Regularity of minimal surfaces near quadratic cones*,
  Ann. of Math. 198 (2023), arXiv 1910.00441v1: Definition 1.1.1, Remark 1.2, Theorem 1.4.
