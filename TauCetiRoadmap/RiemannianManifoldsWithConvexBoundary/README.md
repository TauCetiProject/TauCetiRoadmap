# Roadmap: Riemannian manifolds with convex boundary

**Summary.** This roadmap develops the geometry of the boundary of a smooth Riemannian manifold with
boundary `(M, g)`, modelled on Mathlib's half-space `𝓡∂ (n+1)`, as a Riemannian hypersurface, and
the convexity theory of that boundary that geometric inverse problems, boundary and lens rigidity,
and comparison geometry on domains assume. From Mathlib's Levi-Civita connection (which is defined
at boundary points), Tau Ceti's boundary manifold, induced boundary metric, Hessian, regular
sublevel domains, normal exponential, sphere bundles, geodesics and geodesic spray, it builds
boundary defining functions, the scalar second fundamental form `II` of `∂M` with its Weingarten
map and mean curvature, the conformal change law, the notions of strictly convex, convex and
strictly concave boundary with their Hessian characterisations and stability, the realisation of
every Hausdorff second-countable `(M, g)` as a regular domain `{ρ ≥ 0}` in a boundaryless
Riemannian manifold (GeometricTopology's collar extension and, for compact `M`, double, with the
Seeley extension of functions and metrics), the behaviour of geodesics at the boundary (tangent
geodesics leave a strictly convex boundary to second order), the signed distance to a hypersurface
and boundary normal coordinates `g = dr² + h_r`, the convexity functions with strictly concave
level sets of Uhlmann–Vasy and Stefanov–Uhlmann–Vasy, and, on compact non-trapping manifolds with
strictly convex boundary, the unit sphere bundle strata `∂±SM`, `∂₀SM`, the exit time `τ` with its
regularity at the glancing set, the odd extension `τ̃`, the identity `Xσ = −2` for
`σ(x, v) = τ(x, v) − τ(x, −v)`, the characterisation of non-trapping by the geodesic vector field,
the scattering relation `α` and the boundary lens data. Its end theorems are the Hessian
characterisation of strict convexity, the realisation theorem, the second-order leaving of tangent
geodesics and the absence of interior tangency, the existence of convexity functions near a
strictly convex boundary point, the regularity of the exit time with the smoothness of `σ` and of
`τ(x, v) τ(x, −v)` (Paternain–Salo–Uhlmann, Lemmas 3.2.3 and 3.2.11), the characterisation of
non-trapping by the geodesic vector field (Proposition 3.3.1 of the same book), and the involution,
fixed-point and smoothness theorem for `α`; the acceptance examples are balls, spherical caps,
hyperbolic domains, small geodesic balls, half-spaces, ball exteriors and a conformal metric that
turns the boundary of the unit disc strictly concave.

## Scope and ownership

This roadmap owns:

- the Riemannian hypersurface geometry of `∂M` for a manifold with boundary in Mathlib's sense:
  tangent and normal directions at boundary points beyond the outward-pointing interface,
  boundary defining functions, the scalar second fundamental form `II`, the Weingarten map,
  principal and mean curvature, their naturality and the conformal change law (Layer 1);
- strict convexity, convexity and strict concavity of the boundary, pointwise, on subsets and
  everywhere, with the Hessian characterisations, openness, the uniform bound on compact
  boundaries and stability under smooth families of metrics (Layer 2);
- regular domains `{ρ ≥ 0}` of a boundaryless Riemannian manifold as Riemannian manifolds with
  boundary, sublevel sets whose level sets are strictly concave from the superlevel sets, the
  defining functions that exhibit `M` as a regular domain of its collar extension and of its
  double (the manifolds themselves are GeometricTopology's) together with the comparison of
  `M`'s atlas with Tau Ceti's sublevel atlas, the manifold-level extension of smooth functions and
  metrics across `∂M`, the realisation theorem for every Hausdorff second-countable `M` (its
  compact collar-extension case is RiemannianGeometry R5c's, below), and the comparison of `II`
  with the immersion geometry of RiemannianGeometry R5a (Layer 3);
- geodesics of a regular domain, second-order contact of geodesics with the boundary, the normal
  exponential and signed distance of a two-sided hypersurface with its Gauss lemma, boundary
  normal coordinates, convexity functions near a strictly convex boundary point, and slight
  enlargements of a strictly convex domain (Layer 4);
- the unit sphere bundle strata, the exit time, non-trapping, two calculus lemmas (the fold normal
  form and smooth even functions with parameters), the regularity of the exit time, the
  non-trapping criteria, the scattering relation and the boundary lens data (Layer 5);
- the acceptance examples (Layer 6).

It leaves to other roadmaps, by section:

- the outward-pointing predicate and a smooth outward field: DifferentialGeometry 5.1, in Tau
  Ceti as `TauCeti.IsOutwardPointing` and `TauCeti.exists_isOutwardPointingField`;
- the outward unit normal: DifferentialGeometry 12.5 (`exists_halfSpaceOutwardUnitNormal`), a
  smooth field along `∂M` of norm one, outward pointing and orthogonal to the boundary tangent
  space, these three laws determining it at each point; this roadmap adds its chart formula, the
  sign test, the tangential decomposition and naturality (1.2);
- existence of metrics, gradient and Hessian: DifferentialGeometry 12.1–12.3, in Tau Ceti as
  `TauCeti.Manifold.mgradient` and `TauCeti.Manifold.hessian`;
- the induced metric on the boundary: already in Tau Ceti as
  `Bundle.ContMDiffRiemannianMetric.restrictBoundaryTangentSpace`;
- regular sublevel sets and regular level sets as manifolds: already in Tau Ceti
  (`TauCeti.isManifold_scalarRegularSublevel`, `TauCeti.isManifold_regularLevel`);
- the inclusion of a regular sublevel `{φ ≤ a}` of a boundaryless manifold as a smooth map with
  invertible differential, with the outward criterion `dφ(dι v) > 0` at its boundary points, and,
  for a compact connected two-sided hypersurface of a connected manifold, its normal collar
  `(q, t) ↦ exp_q(t ν(q))` and, when the hypersurface separates, a defining function equal to the
  collar coordinate near it and to `±1` off the collar, with gradient `ν` on it: RiemannianGeometry
  R7.9; this roadmap adds the closed-embedding, Levi-Civita and length statements, the inward unit
  normal and `II` of an arbitrary regular domain (3.1), and the tube and signed distance of a
  regular level set, with the sign of the function on each side, and the normalised defining
  function, for a hypersurface that may be non-compact or disconnected in an `N` that may be
  disconnected (4.3);
- geodesics, the geodesic flow, the exponential map, normal balls, the Gauss lemma at a point and
  first-variation symmetry: HopfRinow Layers 1 and 2;
- geodesic completeness of compact Hausdorff boundaryless Riemannian manifolds: already in Tau
  Ceti as `TauCeti.Manifold.isGeodesicallyCompleteAt_of_compactSpace`;
- the second fundamental form `B`, shape operator and Gauss–Codazzi–Ricci equations of isometric
  immersions: RiemannianGeometry R5a;
- the vanishing at the centre of a normal chart of the first derivatives of the metric
  coefficients and of the Christoffel symbols: already in Tau Ceti
  (`TauCeti.Manifold.IsNormalDomain.mfderiv_inner_normalCoordinateField_self`,
  `TauCeti.Manifold.IsNormalDomain.leviCivitaConnection_normalCoordinateField_self`), recorded in
  RiemannianGeometry 2.2 (R1.4);
- the normal exponential of an embedding and its tubular neighbourhoods: already in Tau Ceti
  (`TauCeti.SmoothEmbedding.normalExp` and the tube theorems);
- the normal strip of an embedded arc in a boundaryless surface, `F*g = dt² + a(s, t)² ds²` with
  `a(s, 0) = 1`, `a_t(s, 0) = −k_g` and the Jacobi equation `a_tt + K a = 0`, also for an arc of
  the boundary of a domain with the inward normal, and the distance to a compact subarc on a small
  tube when the nearest point is interior: RiemannianGeometry/Surfaces 1.2–1.3; this roadmap
  states, in every dimension and on a tube along the whole hypersurface, the tube and signed
  distance of a regular level set (4.3) and, for the boundary of a regular domain, the form
  `dr² + h_r` with `II = −½ ∂_r h_r|₀` (4.4), which for `n = 1`, in an arclength parameter `s` of
  `∂M`, is `h_r = a(s, r)² ds²` and `II = k_g ds²` with Surfaces' `a` and `k_g` for the inward
  normal;
- smooth collars and the interior `M ∖ ∂M` as a boundaryless manifold: GeometricTopology 1.1;
  gluing along the boundary, hence the collar extension `M̃ = M ∪_{∂M} (∂M × (−1, 0])` and the
  double `DM = M ∪_id M`: GeometricTopology 1.3 (the same collar extension is formed from
  GeometricTopology Layer 1 in AffineMorseLefschetz 4.5); this roadmap adds the defining function
  `ρ̃` with `M = {ρ̃ ≥ 0}`, the identification of `M`'s atlas with Tau Ceti's sublevel atlas, and
  the extension of the metric (3.3–3.5);
- the extension of smooth functions across a smooth boundary by the half-space Seeley extension:
  ComplexKahlerGeometry K5a;
- the presentation of a compact Riemannian manifold with boundary as the closure of a relatively
  compact smooth domain of a boundaryless Riemannian manifold, by a collar glued along the
  boundary and K5a's Seeley extension of the metric, and a defining function with regular value
  `0`, negative on the domain, for every relatively compact smooth domain: RiemannianGeometry R5c
  (scalar principal eigenfunction, items 1 and 3); this roadmap adds the non-compact case, the
  defining function `ρ̃` normalised by `ρ̃ ∘ c̃ = t` on the bicollar and the identification of
  `M`'s atlas with Tau Ceti's sublevel atlas (3.3), the extension of functions and of arbitrary
  sections of `T*M ⊗ T*M` to all of the ambient manifold (3.4), and, for compact `M`, a compact
  `M̃`, connected when `M` is, the double when `∂M ≠ ∅` (3.5);
- uniform normal radii on compact sets, strongly convex neighbourhoods and the strict convexity of
  the squared radial distance along sufficiently short geodesics: SmoothBundlesConnections B6.0;
  6.4 consumes its uniform normal radii, and this roadmap owns the boundary geometry of small closed
  geodesic balls (strict convexity of their boundary, non-trapping);
- the second fundamental form and the shape operator of a map into an inner product space (the
  normal part of its second derivative): already in Tau Ceti as `TauCeti.secondFundamentalForm`
  and `TauCeti.shapeOperator`; for a regular domain of `ℝⁿ⁺¹`, 6.1 identifies `II` with
  `TauCeti.secondFundamentalForm` of any local parametrisation of the boundary, paired with `ν_in`;
- the geodesic X-ray transform, Santaló's formula, Pestov identities, simple manifolds and the
  boundary and lens rigidity theorems themselves: future roadmaps that consume Layers 2, 4 and 5;
- manifolds with corners: not treated; the boundary here is the boundary of a half-space-modelled
  manifold.

The along-curve identity `(f∘γ)'' = Hess f(γ', γ') + df(D_t γ')` for arbitrary curves is not
stated here; Layer 4 states only its geodesic case, which is the computation of
Paternain–Salo–Uhlmann Lemma 3.1.13.

## Conventions

- **Setting.** `M` is a topological space with `[ChartedSpace (EuclideanHalfSpace (n+1)) M]` and
  `[IsManifold (𝓡∂ (n+1)) ∞ M]`, so `dim M = n + 1` and `∂M := (𝓡∂ (n+1)).boundary M` carries Tau
  Ceti's boundaryless manifold structure of dimension `n` (`TauCeti.isManifold_boundary`), with
  inclusion `ι : ∂M → M` a smooth closed embedding. Every `n ≥ 0` is allowed. The sources work
  with `dim M ≥ 2` (Paternain–Salo–Uhlmann, line 2642). The one-dimensional case `n = 0` is the
  degenerate case: `∂M` is discrete and every `T_q∂M` is the zero space, so every bilinear form on
  `T_q∂M` is zero and is both positive and negative definite in the quantified sense of 2.1.
  Statements that read a sign or a threshold off `II` (the classifications of half-spaces, level
  sets of affine functions, spherical caps and conformal balls, and the radius bound for convex
  geodesic balls of the round sphere) and every statement about the mean curvature `H` are made
  for `n ≥ 1`, and the one-dimensional behaviour is recorded as a Check. `[T2Space M]` and
  `[SecondCountableTopology M]` are hypotheses of the statements that use partitions of unity;
  compactness, connectedness and non-trapping are hypotheses of the statements that need them,
  never standing assumptions. An isometry of Riemannian manifolds with boundary is a
  `TauCeti.RiemannianIsometry`: a diffeomorphism whose differential preserves the metrics; it maps
  `∂M` onto `∂M'` (1.1). A local Riemannian isometry is a `TauCeti.IsLocalRiemannianIsometry`.
- **Metric.** `g` is a smooth Riemannian metric: `[Bundle.RiemannianBundle (fun x : M ↦
  TangentSpace (𝓡∂ (n+1)) x)]` with `[IsContMDiffRiemannianBundle (𝓡∂ (n+1)) ∞ (EuclideanSpace ℝ
  (Fin (n+1))) (fun x : M ↦ TangentSpace (𝓡∂ (n+1)) x)]`; `⟨·,·⟩ = g`. Distances are Mathlib's
  `Manifold.riemannianEDist` of the manifold in question. `h := ι*g` is the induced metric on
  `∂M` (Tau Ceti `Bundle.ContMDiffRiemannianMetric.restrictBoundaryTangentSpace`).
- **Connection, gradient, Hessian.** `∇` is Mathlib's `CovariantDerivative.leviCivitaConnection`
  of `(M, g)`, which is defined at boundary points (no boundaryless hypothesis);
  `grad f = TauCeti.Manifold.mgradient` and `Hess f(X, Y) = ⟨∇_X grad f, Y⟩ =
  TauCeti.Manifold.hessian`.
- **Boundary tangent space.** For `q ∈ ∂M`, `T_q∂M` also denotes its image `dι_q(T_q∂M) ⊆ T_qM`;
  bilinear forms on `T_q∂M` are forms on the boundary manifold's tangent space, read through `dι`.
- **Half-space and pointing.** Mathlib's `EuclideanHalfSpace` constrains coordinate `0`: `x⁰ ≥ 0`
  on the model, `∂ = {x⁰ = 0}`. A vector is outward when the derivative of `x⁰` in a chart is
  negative (`TauCeti.IsOutwardPointing`), inward when it is positive, tangent when it is zero.
  Witness: on the model half-space with the Euclidean metric, `−e₀` is outward and `e₀` inward.
- **Normals.** `ν_out` is the outward unit normal and `ν_in := −ν_out` (Paternain–Salo–Uhlmann's
  `ν`). Witness: on the boundary sphere of the closed unit ball in `ℝⁿ⁺¹`, `ν_out(x) = x`,
  `ν_in(x) = −x`.
- **Defining functions** are positive inside: `ρ > 0` on the interior, `ρ = 0` on `∂M`,
  `dρ ≠ 0` on `∂M` (Paternain–Salo–Uhlmann, Uhlmann–Vasy). A regular domain of a boundaryless
  `N` is `{ρ ≥ 0}`; Tau Ceti's sublevel atlas is used for `−ρ ≤ 0`. Witness: `ρ = 1 − |x|²` for the
  closed unit ball, with `grad ρ = −2x = 2 ν_in` on the sphere.
- **Second fundamental form.** `II(X, Y) = ⟨∇_X ν_out, Y⟩ = −⟨∇_X ν_in, Y⟩ = ⟨∇_X Y, ν_in⟩ =
  −Hess ρ(X, Y)/|dρ|` on `T∂M`. It equals Paternain–Salo–Uhlmann's `Π_x(v, w) = −⟨∇_v ν, w⟩`
  (with `ν` inward) and `⟨B(X, Y), ν_in⟩` for RiemannianGeometry R5a's `B` of `∂M` in a
  second-countable extension (3.6). Witness: the unit sphere bounding the closed unit ball has
  `II = h`, so the ball is strictly convex; R5a's sphere normalisation `B = −g · position` gives
  `⟨B, ν_in⟩ = ⟨−⟨X,Y⟩x, −x⟩ = ⟨X, Y⟩`; for `ρ = 1 − |x|²`, `Hess ρ = −2g` and `|dρ| = 2`, so
  `−Hess ρ/|dρ| = h`.
- **Mean curvature** is the averaged trace `H = tr_h II / n` for `n ≥ 1` (RiemannianGeometry R5a's
  averaged convention, inward normal). Witness: the unit sphere has `H = 1`; the boundary of the
  exterior of the unit ball has `H = −1`.
- **Level-set concavity.** For `x` smooth near `y` with `dx_y ≠ 0`, the level set through `y` is
  strictly concave from the superlevel sets at `y` if `Hess x` is positive definite on `ker dx_y`.
  Witness: `x = |z|²` on `ℝⁿ⁺¹`, `Hess x = 2g`, `dx_y = 2y ≠ 0` for `y ≠ 0`; for `c > 0` the
  sublevel ball `{x ≤ c}` has `II = h/√c > 0` and the superlevel exterior `{x ≥ c}` has
  `II = −h/√c`. A convexity function at a boundary point (4.5) is a function near that point
  whose level sets are strictly concave from the superlevel sets in this sense, normalised against
  the defining function and with compact pieces `{x̃ ≥ −c} ∩ M`.
- **Conformal change** is `ĝ = e^{2φ} g` (Tau Ceti `Bundle.ContMDiffRiemannianMetric.rescale` with
  factor `e^{2φ}`). Witness: `φ = log 2` turns the unit ball into a copy of the Euclidean ball of
  radius 2 and doubles `II`.
- **Unit sphere bundle strata** follow Paternain–Salo–Uhlmann: `∂±SM = {(x, v) ∈ ∂SM : ±⟨v,
  ν_in(x)⟩ ≥ 0}` are closed, `∂₊SM` is the influx (inward) part, `∂₀SM = ∂₊SM ∩ ∂₋SM` the glancing
  set. Stefanov–Uhlmann–Vasy use the opposite labels (their `∂₊SM` points outside; line 151).
  Witness: on the closed unit disc at `x = (0, −1)`, `v = (0, 1)` lies in `∂₊SM`, `v = (1, 0)` in
  `∂₀SM`.
- **Exit time** `τ` takes values in `[0, ∞]`; `μ(x, v) := ⟨v, ν_in(x)⟩` on `∂SM`; the geodesic flow
  is `φ_t(x, v) = (γ_{x,v}(t), γ'_{x,v}(t))` with generator `X`. Witness (Paternain–Salo–Uhlmann,
  Example 3.2.1): on the closed unit disc at `x = (0, −1)`, `τ(x, (cos θ, sin θ)) = 2 sin θ` for
  `θ ∈ [0, π]` and `0` for `θ ∈ [−π, 0]`.
- **Hamiltonian normalisation.** Uhlmann–Vasy's covector form of convexity uses the dual metric
  function `G`; whether `G = |ξ|²` or `½|ξ|²`, `H_G ρ` and `H_G² ρ` change by the positive factors
  2 and 4, so the convexity condition is unchanged.
- **Lean carriers.** The Lean statements of this roadmap use the following carriers. `T_q∂M` is
  `boundaryTangentSpace`, the range of `dι_q` for Tau Ceti's boundary atlas
  `TauCeti.boundaryChartedSpace`. Definitions are made for a metric of class `C¹`
  (`IsContMDiffRiemannianBundle … 1 …`), the regularity at which Mathlib's Levi-Civita connection
  and Tau Ceti's gradient, Hessian, geodesics and geodesic spray are defined; every theorem assumes
  the metric smooth. A geodesic of `(M, g)` on an interval is Tau Ceti's
  `TauCeti.Manifold.IsGeodesicCurveOn` for `(M, g)` itself, which is defined at boundary points,
  and initial data are those of `TauCeti.Manifold.IsGeodesicCurveOnFrom`. In the Lean statements
  the unit sphere bundle `SM` and its boundary `∂SM` are sets of vectors of `TM`, without a
  manifold structure of their own (the tangent bundle of a manifold with boundary is modelled on a
  product of models, outside Tau Ceti's half-space boundary theory, and Tau Ceti's sphere bundles
  are over boundaryless bases). So a smooth function on `SM` is the restriction of a
  smooth function on `TM`, smoothness on `SM ∖ ∂₀SM` of a function homogeneous of degree `−1` in
  `v` is smoothness on the open cone of nonzero non-glancing vectors of `TM`, and the geodesic
  vector field `X` is Tau Ceti's geodesic spray `TauCeti.Manifold.geodesicSpray` of `(M, g)`, a
  vector field on `TM` tangent to `SM`.

## Exact supplier contracts

### From Mathlib

At the pin:

- the half-space model and its boundary: `ModelWithCorners.boundary`, `ModelWithCorners.interior`,
  `ModelWithCorners.isClosed_boundary`, `modelWithCornersEuclideanHalfSpace` (notation `𝓡∂`),
  `EuclideanHalfSpace` (`Mathlib/Geometry/Manifold/IsManifold/InteriorBoundary.lean`,
  `Mathlib/Geometry/Manifold/Instances/Real.lean`), and `TangentBundle`;
- `Manifold.IsSmoothEmbedding` (`Mathlib/Geometry/Manifold/SmoothEmbedding.lean`): a topological
  embedding that is a `Manifold.IsImmersion`, whose local normal forms use charts of the maximal
  atlas, so that it applies to a source with boundary;
- metrics and distances: `Bundle.RiemannianBundle`, `IsContMDiffRiemannianBundle`,
  `Bundle.ContMDiffRiemannianMetric`, `IsRiemannianManifold`, `Manifold.pathELength`,
  `Manifold.riemannianEDist`, `EMetricSpace.ofRiemannianMetric` (the distance
  `Manifold.riemannianEDist` as an emetric structure satisfying `IsRiemannianManifold`, on a
  `T3Space`, which a Hausdorff manifold is);
- `CovariantDerivative.leviCivitaConnection` and
  `CovariantDerivative.isLeviCivitaConnection_leviCivitaConnection`, which assume
  `IsManifold I 2 M`, a `C¹` metric and finite dimension but no boundaryless model;
- the implicit function theorem `ContDiffAt.implicitFunction` and
  `ContDiffAt.contDiffAt_implicitFunction`;
- partitions of unity: `SmoothPartitionOfUnity`,
  `exists_contMDiffSection_forall_mem_convex_of_local` and
  `exists_contMDiff_zero_iff_one_iff_of_isClosed` (finite-dimensional, Hausdorff, σ-compact).

### From Tau Ceti

At the pin; every name below is consumed, never restated.

- The boundary manifold, with its atlas `TauCeti.boundaryChartedSpace`
  (`TauCeti/Geometry/Manifold/Boundary/Charts.lean`, the charts induced by the preferred ambient
  charts), and `TauCeti.isManifold_boundary`, `TauCeti.isSmoothEmbedding_subtypeVal_boundary`,
  `TauCeti.mfderiv_subtypeVal_boundary`,
  `TauCeti.ModelWithCorners.mem_boundary_euclideanHalfSpace_iff_of_mem_atlas`.
- The product collar model `TauCeti.EuclideanHalfSpace.collarDiffeomorph`
  (`TauCeti/Geometry/Manifold/Boundary/Collar/Basic.lean`): the diffeomorphism `(y, t) ↦ (t, y)`
  from `ℝⁿ × [0, ∞)` with Mathlib's product model `(𝓡 n).prod (𝓡∂ 1)` onto
  `EuclideanHalfSpace (n+1)` with `𝓡∂ (n+1)`, which puts the normal coordinate in slot `0`.
- Pointing: `TauCeti.IsOutwardPointing`, `TauCeti.isOutwardPointing_iff_tangentCoordChange`,
  `TauCeti.tangentCoordChange_normal_pos`, `TauCeti.exists_isOutwardPointingField`.
- Metrics: `Bundle.ContMDiffRiemannianMetric.restrictBoundaryTangentSpace` (and its `_inner`
  lemma), `Bundle.ContMDiffRiemannianMetric.pullback` with
  `Bundle.ContMDiffRiemannianMetric.pullback_inner` (the pullback metric along a smooth immersion
  applies the target metric to the two differentials), `Bundle.ContMDiffRiemannianMetric.rescale`,
  `Bundle.ContMDiffRiemannianMetric.hessian_rescale`,
  `Bundle.ContMDiffRiemannianMetric.leviCivitaConnection_rescale_apply`,
  `TauCeti.Manifold.ContMDiffNondegenerateMetricFamily` with
  `TauCeti.Manifold.ContMDiffNondegenerateMetricFamily.contMDiffAt_christoffelSymbol` (joint
  smoothness in parameter and point, boundary points included).
- Isometries, for every model with corners (no boundaryless hypothesis): `TauCeti.RiemannianIsometry`
  (`TauCeti/Geometry/Manifold/Riemannian/Isometry/Basic.lean`: a diffeomorphism whose differential
  preserves the inner products) with `TauCeti.RiemannianIsometry.isGeodesicCurveOn_comp_iff` and
  `TauCeti.RiemannianIsometry.isGeodesicCurveOnFrom_comp_iff` (geodesics on a parameter set with
  unique derivatives, and their initial data, correspond under the isometry and its
  differential), and `TauCeti.IsLocalRiemannianIsometry` (`…/Riemannian/Isometry/Local.lean`:
  smooth, with invertible inner-product-preserving differential at every point, not necessarily
  injective) with `TauCeti.IsLocalRiemannianIsometry.mfderiv_leviCivitaConnection_mpullback` (the
  differential carries `∇ᴹ_v` of the pullback of a vector field `Y`, differentiable at the image
  point, to `∇ᴺ_{df v} Y`) and `TauCeti.IsLocalRiemannianIsometry.hessian_comp`
  (`Hess(u ∘ f) = Hess u` on differentials, for `u` of class `C²` at the image point).
- Calculus on `M`: `TauCeti.Manifold.mgradient`, `TauCeti.Manifold.inner_mgradient`,
  `TauCeti.Manifold.hessian`, `TauCeti.Manifold.hessian_symm`,
  `TauCeti.Manifold.hessian_apply_eq_mvfderiv_sub`,
  `CovariantDerivative.IsLeviCivitaConnection.inner_apply_eq_inner_mvfderiv` (Gauss formula into an
  inner product space).
- Regular values: `TauCeti.IsRegularValue`, `TauCeti.scalarRegularSublevelChartedSpace`,
  `TauCeti.isManifold_scalarRegularSublevel`, `TauCeti.boundary_scalarRegularSublevel`,
  `TauCeti.interior_scalarRegularSublevel`, `TauCeti.regularLevelChartedSpace`,
  `TauCeti.isManifold_regularLevel`, `TauCeti.isSmoothEmbedding_coe_regularLevel`.
- Geodesics: `TauCeti.Manifold.IsGeodesicCurveOn` and `TauCeti.Manifold.IsGeodesicCurveOnFrom`
  (defined for every model with corners; the velocity is `TauCeti.Manifold.curveVelocityWithin`,
  the derivative within the parameter set), the geodesic spray `TauCeti.Manifold.geodesicSpray`
  (`TauCeti/Geometry/Manifold/Riemannian/Geodesic/Spray.lean`: the vector field
  `(x, v) ↦ (v, −Γ_x(v, v))` on `TM`, defined for every model with corners, whose integral curves
  are the velocity lifts of geodesics), `TauCeti.Manifold.geodesicInterval`,
  `TauCeti.Manifold.maximalGeodesic`, `TauCeti.Manifold.riemannianExp`,
  `TauCeti.Manifold.expDomain`, `TauCeti.Manifold.exists_contMDiffAt_localGeodesicFlow`,
  `TauCeti.Manifold.contMDiffOn_maximalGeodesic`,
  `TauCeti.Manifold.isGeodesicallyCompleteAt_of_compactSpace` (boundaryless, Hausdorff).
- Normal coordinates on a boundaryless Hausdorff base: the normal domains
  `TauCeti.Manifold.IsNormalDomain`, the normal coordinate fields
  `TauCeti.Manifold.normalCoordinateField` (the coordinate fields `∂_i` of the normal chart for a
  basis of `T_pN`), `TauCeti.Manifold.IsNormalDomain.mfderiv_inner_normalCoordinateField_self`
  (the first derivatives of the metric coefficients vanish at the centre) and
  `TauCeti.Manifold.IsNormalDomain.leviCivitaConnection_normalCoordinateField_self` (the
  coordinate fields are parallel at the centre, so the Christoffel symbols vanish there).
- The distance on a normal ball, for an emetric structure satisfying `IsRiemannianManifold` on a
  boundaryless base: `TauCeti.Manifold.IsNormalDomain.edist_riemannianExp_eq_of_mem_ball`
  (`d(p, exp_p v) = |v|` for every `v` in an open tangent ball contained in a normal domain at `p`)
  and `TauCeti.Manifold.IsNormalDomain.image_riemannianExp_ball` (`exp_p` maps that tangent ball
  onto the open metric ball of the same radius).
- The normal exponential `TauCeti.SmoothEmbedding.normalExp`,
  `TauCeti.SmoothEmbedding.exists_partialDiffeomorph_normalExp_subset`,
  `TauCeti.SmoothEmbedding.exists_isClosedEmbedding_normalExp_norm_le_subset` (closed embedding into
  a boundaryless Hausdorff second-countable Riemannian manifold, no completeness).
- Sphere bundles: `TauCeti.sphereBundleChartedSpace`, `TauCeti.isManifold_sphereBundle`,
  `TauCeti.isSmoothEmbedding_coe_sphereBundle` (boundaryless base).
- Calculus lemmas: the Hadamard factorisation `ContDiff.sub_eq_hadamardFactor_apply`,
  `ContDiff.contDiff_hadamardFactor` and `TauCeti.contDiff_intervalIntegral`; the parametric Morse
  lemma `TauCeti.exists_parametric_morse_chart`
  (`TauCeti/Analysis/Calculus/Morse/Parametric.lean`: a jointly smooth `f` on a product `P × E` of
  Banach spaces whose fibre derivative vanishes on the zero section near `(a, 0)` and whose fibre
  Hessian at `(a, 0)` is invertible has a chart `ψ` near `(a, 0)`, smooth with smooth inverse,
  preserving the parameter and fixing the zero section, with
  `f(b, v) = f(b, 0) + ½ D²_v f(b, 0)(ψ(b, v)₂, ψ(b, v)₂)`).
- Model spaces: `TauCeti.sphereRoundMetric`, `TauCeti.UpperHalfSpace` with
  `TauCeti.UpperHalfSpace.hyperbolicMetric` and
  `TauCeti.UpperHalfSpace.hasConstantSectionalCurvature`.
- The second fundamental form of a map into an inner product space `TauCeti.secondFundamentalForm`
  (`TauCeti/Analysis/InnerProductSpace/SecondFundamentalForm.lean`: the projection of the second
  derivative onto the orthogonal complement of the range of the first).

### From TauCetiRoadmap.DifferentialGeometry

- 5.1: the outward-pointing boundary interface.
- 12.1: every finite-dimensional Hausdorff σ-compact manifold carries a smooth metric, in Tau Ceti
  as `TauCeti.nonempty_contMDiffRiemannianMetric`.
- 12.2–12.3: gradient and symmetric Hessian.
- 12.5 (`exists_halfSpaceOutwardUnitNormal`): for a Hausdorff second-countable manifold over
  `𝓡∂ (n+1)`, `n ≥ 0`, with a smooth Riemannian metric, there is a field `N` along `∂M` such that
  `q ↦ (q, N(q))` is a smooth map `∂M → TM`, `‖N(q)‖ = 1`, `N(q)` is outward
  (`TauCeti.IsOutwardPointing`) and `N(q)` is `g`-orthogonal to `dι_q(T_q∂M)`; 12.5 also states
  that these three laws determine `N(q)` at each point. The σ-compactness, the Borel structure and
  the continuity of the metric in the signature's context hold for every second-countable manifold
  with its Borel σ-algebra and a smooth metric.

### From Completed.HopfRinow

- Layer 1: geodesic equation, maximal intervals, geodesic spray and smooth local flow,
  `riemannianExp` on its natural domain.
- Layer 2: normal neighbourhoods, local logarithm, Gauss lemma, local distance identity, covariant
  differentiation in both variation directions with `D_s ∂_t = D_t ∂_s`.

All of it under its boundaryless hypotheses; this roadmap applies it to a boundaryless `N`
containing `M`.

### From TauCetiRoadmap.RiemannianGeometry

- R5a, in RiemannianGeometry's standing setting (Hausdorff, second-countable, boundaryless), for an
  isometric immersion of such manifolds: `B(X, Y) = (∇^N_X df(Y))^⊥`, `S_η X = −(∇^N_X η)^⊤`,
  `⟨S_η X, Y⟩ = ⟨B(X, Y), η⟩`, averaged mean curvature vector, Gauss equation with the pinned
  sign, sphere normalisation `B = −g · position`, and `B = 0` exactly when the immersion is totally
  geodesic.
- R7.9, on a Hausdorff second-countable boundaryless Riemannian manifold `N` (RiemannianGeometry's
  standing convention): for smooth `φ : N → ℝ` with regular value `a`, the inclusion `ι` of
  `{φ ≤ a}`, with Tau Ceti's sublevel atlas, is smooth with invertible differential, and a vector
  `v` at a boundary point of `{φ ≤ a}` is outward (`TauCeti.IsOutwardPointing`) exactly when
  `dφ(dι v) > 0`; for `N` connected and a compact connected embedded hypersurface `Σ` with a smooth
  unit normal field `ν`, the normal collar `c_ν(q, t) = exp_q(t ν(q))` is, for every sufficiently
  small `ε > 0`, a diffeomorphism of `Σ × (−ε, ε)` onto an open neighbourhood `U` of `Σ`; when
  moreover `N ∖ Σ` has two components `Ω₊ ⊇ c_ν(Σ × (0, ε))` and `Ω₋ ⊇ c_ν(Σ × (−ε, 0))`, there
  is a smooth `φ` with `φ⁻¹(0) = Σ`, `Ω₊ = {φ > 0}`, `Ω₋ = {φ < 0}` and `grad φ = ν` on `Σ`, equal
  on `U` to `h(t)` for the collar coordinate `t` and a smooth nondecreasing `h` with `h(t) = t` near
  `0` and `h = ±1` for `±t ≥ ε/2`, and to `±1` on `Ω± ∖ U`; the outward unit normal of `{φ ≤ 0}` is
  `ν` and that of `{φ ≥ 0}` is `−ν`.
- R5c (scalar principal eigenfunction, items 1 and 3), in RiemannianGeometry's standing setting
  (Hausdorff, second-countable, boundaryless), its manifolds having dimension `m ≥ 1`: a relatively
  compact smooth domain of such a manifold `M'` is an open `D ⊆ M'` with compact closure each of
  whose boundary points has a chart of `M'` in which `D` is the half-space `x_m > 0` on the last
  coordinate (Mathlib's `EuclideanHalfSpace` constrains coordinate `0` instead); every compact
  Riemannian manifold with boundary modelled on `𝓡∂ m` is the closure `D̄` of such a domain, with
  the restricted metric, by a collar (GeometricTopology 1.1) glued along the boundary (1.3) and
  K5a's Seeley extension of the metric, positive definite on a neighbourhood of `D̄`; and every
  such `D` has a smooth `ρ : M' → ℝ` with regular value `0`, `D = {ρ < 0}` and `{ρ ≤ 0}` compact
  (it is `D̄`: at a zero `dρ ≠ 0`, so `ρ` takes negative values nearby).

### From TauCetiRoadmap.GeometricTopology

- 1.1 (Lee, *Introduction to Smooth Manifolds*, Theorem 9.25): a second-countable `M` has a smooth
  collar, a smooth embedding `c : ∂M × [0, 1) → M` with open image `U` and `c(q, 0) = q`; the
  interior `M ∖ ∂M` is a smooth boundaryless manifold. Assumed: the structure of `M ∖ ∂M` is the
  open-submanifold one, whose charts are the charts of `M` restricted to the interior (with values
  in the open half-space `{x⁰ > 0}`, open in `ℝⁿ⁺¹`), for which the inclusion into `M` is a smooth
  open embedding; 1.3's open embeddings of the interiors into the glued manifold use it.
- 1.3: for manifolds with boundary `M`, `N` with collars `c_M`, `c_N` and a diffeomorphism
  `f : ∂M ≃ ∂N`, the glued manifold `M ∪_f N` is boundaryless, the two interiors embed openly, the
  union of the two collars is an open subset identified with `∂M × (−1, 1)` through `c_M` on
  `[0, 1)` and `c_N ∘ (f × id)` on `(−1, 0]`, the inclusions of `M` and `N` are smooth embeddings
  with closed images meeting exactly in the image of `∂M`, and `M ∪_f N` is compact when both
  pieces are and connected when both are connected and `∂M ≠ ∅`; the double `DM = M ∪_id M` (with
  `c_N = c_M`) is closed exactly when `M` is compact. Assumed: the glued manifolds are Hausdorff
  and second countable, the standing convention of GeometricTopology Layer 1.

The collar extension is the case `N = ∂M × [0, 1)` of 1.3 with its product collar and
`f(q) = (q, 0)`. Here `∂M × [0, 1)` is taken over `𝓡∂ (n+1)`, as 1.3's pieces are: its charts are
the product charts of 1.1 (model `ℝⁿ × [0, ∞)` with Mathlib's product model `(𝓡 n).prod (𝓡∂ 1)`,
the constrained coordinate last) followed by Tau Ceti's
`TauCeti.EuclideanHalfSpace.collarDiffeomorph`, the diffeomorphism `(y, t) ↦ (t, y)` of
`ℝⁿ × [0, ∞)` onto `EuclideanHalfSpace (n+1)` with `𝓡∂ (n+1)` that puts the normal coordinate in
slot `0`. The identity is a diffeomorphism between the two structures, the boundary is
`∂M × {0}` in both, and the product collar is a collar for both, so 1.3 applies.

### From TauCetiRoadmap.ComplexKahlerGeometry

K5a (extension of smooth functions across a smooth boundary: the half-space Seeley extension), a
step of K5a's construction of diffeomorphisms of closures of bounded smooth domains rather than a
separately numbered item: a function on the closed half-space `{x⁰ ≥ 0} ⊆ ℝⁿ⁺¹` that is smooth up
to the boundary (Mathlib's `ContDiffOn ℝ ∞` on the closed half-space) is the restriction of a
smooth function on `ℝⁿ⁺¹`.

### From TauCetiRoadmap.SmoothBundlesConnections

B6.0, on a finite-dimensional Hausdorff second-countable boundaryless Riemannian manifold, for the
given metric: positive uniform normal radii on compact sets, with `IsNormalDomain` on every tangent
ball of that radius (so that on it `exp_x` is injective with invertible differential at every
vector). B6.0's strict convexity of the squared local radial distance along short geodesics is not
consumed: 6.4 needs a positive definite Hessian, which it derives itself.

## How to read the build

Layer 1 is intrinsic: everything is defined on `(M, g)` itself, using that Mathlib's Levi-Civita
connection and Tau Ceti's Hessian make sense at boundary points, and delivers `II`, the Weingarten
map, mean curvature and the conformal law. Layer 2 turns `II` into the convexity predicates and
proves their Hessian characterisation and stability. Layer 3 connects the abstract setting with
domains `{ρ ≥ 0}` of a boundaryless manifold, where the library's geodesics live, and proves that
every Hausdorff second-countable `(M, g)` is such a domain; it also identifies `II` with R5a's `B`.
Layer 4 studies geodesics of a domain at its boundary: second-order contact, the normal exponential
and signed distance, boundary normal coordinates, convexity functions and enlargements. Layer 5
builds the unit sphere bundle strata, the exit time and the scattering relation on compact
non-trapping manifolds with strictly convex boundary. Layer 6 computes the acceptance examples.
Layers 4–6 are stated for a regular domain `M = {ρ ≥ 0}` of a boundaryless `(N, g)`; by the
realisation theorem of Layer 3 and the intrinsic definitions of `II`, `τ` and `α`, nothing in them
depends on the choice of `N`. The end theorems of 4.2 and 5.4–5.6 are also stated intrinsically,
for `(M, g)` itself and its tangent bundle `TM`, as the Conventions describe.

## Layer 1: The boundary as a Riemannian hypersurface

### 1.1 Tangent, inward and outward directions

Define the tangent space of the boundary at `q ∈ ∂M`, `boundaryTangentSpace q`, as the subspace
`T_q∂M := range(dι_q)` of `T_qM`, for the differential of the inclusion `ι : ∂M → M` and Tau Ceti's
boundary atlas. Prove that `T_q∂M` is the kernel of the differential at `q` of the normal
coordinate `x⁰` of every half-space chart of the maximal atlas at `q`, hence a hyperplane of
`T_qM`, and that every `v ∈ T_qM` is exactly one of: outward (`TauCeti.IsOutwardPointing`),
tangent (`v ∈ T_q∂M`) or inward (`−v` outward), the class not depending on the chart. Prove that a
`C¹` curve `c : [0, ε) → M` with `c(0) = q` has `c'(0)` inward or tangent, and a `C¹` curve
`c : (−ε, ε) → M` with `c(0) = q` has `c'(0)` tangent (Paternain–Salo–Uhlmann, the inward,
outward and tangent unit vectors of lines 2684–2696).

- The inward vectors and the outward vectors at `q` are disjoint open half-spaces of `T_qM` whose
  common boundary is `T_q∂M`.
- In the preferred chart `dι_q` is the zero-insertion map (`TauCeti.mfderiv_subtypeVal_boundary`),
  so `T_q∂M` has dimension `n` and `dι_q` is injective.
- `T_q∂M` is natural: a diffeomorphism of manifolds with boundary maps `∂M` onto `∂M'` and carries
  `T_q∂M` onto `T_{Φ(q)}∂M'`.

**Checks.**

- On the model half-plane `{x⁰ ≥ 0} ⊆ ℝ²` at `q = 0`: `T_q∂M` is the line spanned by `e₁`, the
  kernel of `dx⁰`; `−e₀` is outward and `e₀` inward. Mathlib's half-space constrains coordinate
  `0`: the kernel of `dx¹` is the line spanned by `e₀`, all of whose nonzero vectors are inward or
  outward, so a definition through the wrong coordinate fails the trichotomy.
- On the closed unit disc at `q = (0, −1)`: `T_q∂M` is spanned by `(1, 0)`; for every real `t`,
  `(t, 1)` is inward and `(t, −1)` outward, and only the multiples of `(1, 0)` are tangent.
- Dimension one, `M = [0, 1]`: `T_q∂M = 0` at both ends (`dι_q` is the map from the zero space),
  every nonzero vector is inward or outward, `+∂_x` is inward at `0` and outward at `1`.

*Needs:* Tau Ceti `TauCeti.boundaryChartedSpace`, `TauCeti.mfderiv_subtypeVal_boundary`,
`TauCeti.IsOutwardPointing`, `TauCeti.isOutwardPointing_iff_tangentCoordChange`,
`TauCeti.tangentCoordChange_normal_pos`, `TauCeti.isManifold_boundary`; DifferentialGeometry 5.1.

### 1.2 The outward and inward unit normal

Let `ν_out` be the outward unit normal of DifferentialGeometry 12.5
(`exists_halfSpaceOutwardUnitNormal`): at each `q ∈ ∂M`, `ν_out(q)` is the vector of `T_qM` that
has norm one, is outward and is `g`-orthogonal to `T_q∂M`, and `q ↦ (q, ν_out(q))` is a smooth
map `∂M → TM`; uniqueness at each point and smoothness are part of that supplier statement and
are not restated. Set `ν_in := −ν_out`. Prove the rest of its Riemannian hypersurface API
(Paternain–Salo–Uhlmann, lines 2687–2689; Lee, *Introduction to Riemannian Manifolds*, Ch. 8):

- Without the Hausdorff property or second countability: DifferentialGeometry 12.5 assumes `M`
  Hausdorff, second countable and σ-compact, with its Borel σ-algebra. For any `M` of the
  Conventions, every chart source of `M` is an open submanifold with boundary that is Hausdorff,
  second countable and σ-compact (it is homeomorphic to an open subset of the half-space); the
  normals that 12.5 gives on two chart sources agree on the overlap by the pointwise uniqueness,
  so `ν_out` exists, with the three laws and smoothness, on every `M` of the Conventions.
- Chart formula: `ν_in(q) = grad x⁰(q)/|grad x⁰(q)|` for the normal coordinate `x⁰` of any
  half-space chart at `q`.
- Sign test: `v ∈ T_qM` is inward iff `⟨v, ν_in(q)⟩ > 0`, tangent iff `= 0`, outward iff `< 0`;
  `v = v^T + ⟨v, ν_in⟩ ν_in` with `v^T ∈ T_q∂M`; in particular `ν_in(q)` is the unique inward unit
  vector orthogonal to `T_q∂M`.
- Naturality: an isometry of Riemannian manifolds with boundary carries `ν_out` to `ν_out`.

**Checks.**

- On the model half-space of dimension 2 with the constant metric `g = [[1, a], [a, 1]]`,
  `|a| < 1`: `ν_in = (e₀ − a e₁)/√(1 − a²)`, since `g(e₀ − a e₁, e₁) = a − a = 0` and
  `g(e₀ − a e₁, e₀ − a e₁) = 1 − a²`. For `a ≠ 0` the coordinate vector `e₀` has
  `g(e₀, e₁) = a ≠ 0`, so a definition by the chart direction fails orthogonality: at `a = 1/2`,
  `ν_in = (2/√3, −1/√3)` while `g(e₀, e₁) = 1/2`. At `a = 0` the formula returns `e₀`, which is then
  the correct normal.
- On the boundary sphere of the closed unit ball, `ν_out(x) = x` and `⟨v, ν_in⟩ = −⟨v, x⟩`.
- Dimension one: for `M = [0, 1] ⊆ ℝ`, `ν_out(0) = −∂_x` and `ν_out(1) = +∂_x` in the ambient
  coordinate, although both charts read the inward direction as `+e₀`.

*Needs:* DifferentialGeometry 12.5 (`exists_halfSpaceOutwardUnitNormal`) and 12.2 (the gradient,
Tau Ceti `TauCeti.Manifold.mgradient`); 1.1.

### 1.3 Boundary defining functions

Define, for an open `U ⊆ M`, a boundary defining function on `U`
(`IsBoundaryDefiningFunctionOn`) as `ρ : M → ℝ`, smooth on `U`, with `ρ > 0` on `U ∩ int M`,
`ρ = 0` on `U ∩ ∂M` and `dρ_q ≠ 0` for `q ∈ U ∩ ∂M`; a global one is the case `U = M`
(Uhlmann–Vasy, lines 134–136 and 25–26; the stronger normalised function of
Paternain–Salo–Uhlmann, Lemma 3.1.10, is the `ρ̂` of 4.3). Prove:

- Local existence: the normal coordinate `x⁰` of a half-space chart is a boundary defining
  function on the chart source.
- Global existence: if `M` is Hausdorff and second countable, a global boundary defining function
  exists (a partition of unity subordinate to half-space charts and to `int M`, glued from the
  chart coordinates `x⁰` and the constant `1`).
- Gradient formula: `dρ_q` vanishes on `T_q∂M`, `dρ_q(ν_in) = |dρ_q| > 0` and
  `grad ρ(q) = |dρ_q| ν_in(q)` for `q ∈ U ∩ ∂M`.
- Comparison: two global boundary defining functions satisfy `ρ' = u ρ` with `u` smooth and
  positive on `M` and `u = |dρ'|/|dρ|` on `∂M` (Hadamard division in half-space charts).
- Restriction and pullback: a boundary defining function restricts to open subsets and pulls
  back along diffeomorphisms of manifolds with boundary.

**Checks.**

- On the closed unit ball (Layer 3) `ρ = 1 − |x|²` is a global defining function with
  `|dρ| = 2` and `grad ρ = −2x = 2 ν_in` on the sphere.
- `ρ' = (2 + x₁)(1 − |x|²)`, as a function on the closed ball, is another, with ratio
  `u = 2 + x₁ ∈ [1, 3]`; `ρ'' = (1 − |x|²)²` is not one, since `dρ'' = 0` on the sphere, and `−ρ` is
  not one, since it is negative inside.
- On a manifold with empty boundary the constant `1` is a global defining function; in dimension
  one, on `M = [0, 1]`, `ρ(x) = x(1 − x)` is one with `|dρ| = 1` at both ends.

*Needs:* 1.1, 1.2; Tau Ceti
`TauCeti.ModelWithCorners.mem_boundary_euclideanHalfSpace_iff_of_mem_atlas`,
`ContDiff.sub_eq_hadamardFactor_apply`, `ContDiff.contDiff_hadamardFactor`; Mathlib
`SmoothPartitionOfUnity`, `exists_contMDiff_zero_iff_one_iff_of_isClosed`.

### 1.4 The second fundamental form

Define the second fundamental form of `∂M` at `q ∈ ∂M` (`secondFundamentalForm`) as the form on
`T_q∂M`

    II_q(u, w) := −Hess x⁰(dι u, dι w) / |dx⁰_q|_g,

where `x⁰` is the normal coordinate of the preferred half-space chart at `q` (a boundary defining
function near `q` by 1.3), and `Hess` is Tau Ceti's Hessian of `(M, g)` at the boundary point `q`.
Prove that it is the second fundamental form in each of its usual descriptions (Paternain–Salo–
Uhlmann, lines 2728–2737 and Lemma 3.1.12, lines 2781–2784; Stefanov–Uhlmann–Vasy, line 53; Lee,
*Introduction to Riemannian Manifolds*, Ch. 8):

- For every boundary defining function `ρ` on a neighbourhood of `q`,
  `II_q(u, w) = −Hess ρ(dι u, dι w)/|dρ_q|`.
- For every vector field `N` on `M`, `C¹` near `q`, with `N = ν_out` along `∂M` near `q`,
  `II_q(u, w) = ⟨∇_{dι u} N, dι w⟩`; this is Paternain–Salo–Uhlmann's `Π_q(u, w) = −⟨∇_u ν, w⟩`
  with their inward `ν`.
- For every vector field `W`, `C¹` near `q` and tangent to `∂M` along `∂M` near `q`, with
  `W(q) = dι w`, `II_q(u, w) = ⟨∇_{dι u} W, ν_in(q)⟩`.
- `II_q` is bilinear and symmetric, and `q ↦ II_q` is a smooth section of the bundle of bilinear
  forms on `T∂M` (its coefficients in Tau Ceti's boundary charts are smooth).
- Naturality: an isometry `Φ : (M, g) → (M', g')` of manifolds with boundary maps `∂M` onto `∂M'`
  and `(Φ|∂M)* II' = II`.

**Checks.**

- Closed ball of radius `R > 0` in `ℝⁿ⁺¹` with `ρ = R² − |x|²`: `Hess ρ = −2g`, `|dρ| = 2R`, so
  `II = h/R`; for `R = 1`, `II = h`.
- Closed half-space `{x⁰ ≥ 0}` of `ℝⁿ⁺¹` with the Euclidean metric: `x⁰` is affine, `Hess x⁰ = 0`,
  `II = 0`. Closed exterior `{|x|² ≥ 1}` with `ρ = |x|² − 1`: `Hess ρ = 2g`, `|dρ| = 2`, `II = −h`.
- Using the inward normal in the first description, `⟨∇_X ν_in, Y⟩`, gives `−h` on the unit ball:
  that convention fails the ball witness of the Conventions.
- Dimension one: `T_q∂M = 0` and `II_q` is the zero form on the zero space.

*Needs:* 1.1, 1.2, 1.3; Mathlib `CovariantDerivative.leviCivitaConnection`; Tau Ceti
`TauCeti.Manifold.hessian`, `TauCeti.Manifold.hessian_symm`,
`TauCeti.Manifold.hessian_apply_eq_mvfderiv_sub`, `TauCeti.isManifold_boundary`; DifferentialGeometry
12.3.

### 1.5 Weingarten map, principal curvatures and mean curvature

Define the Weingarten map `S_q : T_q∂M → T_q∂M` by `h(S_q u, w) = II_q(u, w)`, the principal
curvatures at `q` as the eigenvalues of `S_q`, and, for `n ≥ 1`, the mean curvature
`H(q) := tr S_q / n` (Lee, *Introduction to Riemannian Manifolds*, Ch. 8; the averaged convention of
RiemannianGeometry R5a).

- `S_q` is `h`-self-adjoint, so the principal curvatures are real and `II_q` is diagonal in an
  `h`-orthonormal eigenbasis.
- Weingarten equation: `dι(S_q u)` is the tangential part of `∇_{dι u} N` for any `C¹` extension
  `N` of `ν_out`.
- `S` and `H` are smooth on `∂M`; under an isometry they are natural.
- `tr_h II = n H`.

**Checks.**

- The unit sphere bounding the closed unit ball: `S = id`, principal curvatures all `1`, `H = 1`;
  this is PositiveMass's averaged `tr A/(dim − 1)` for the inward normal.
- The solid cylinder `{x₁² + x₂² ≤ 1} ⊆ ℝ³`: principal curvatures `1` and `0`, `H = 1/2`.
- The closed exterior of the unit ball: principal curvatures `−1`, `H = −1`.
- Dimension one: `H` is not defined (the average needs `n ≥ 1`); no statement uses it there.

*Needs:* 1.4; Tau Ceti `Bundle.ContMDiffRiemannianMetric.restrictBoundaryTangentSpace`.

### 1.6 Conformal change and scaling

For `φ` smooth on `M` and `ĝ = e^{2φ} g`, prove `ν̂_out = e^{−φ} ν_out`, `ĥ = e^{2φ} h` and

    II^ĝ_q(u, w) = e^{φ(q)} (II_q(u, w) − dφ_q(ν_in(q)) h_q(u, w)),

hence `κ̂ = e^{−φ}(κ − dφ(ν_in))` for the principal curvatures and, for `n ≥ 1`,
`Ĥ = e^{−φ}(H − dφ(ν_in))`. For
a constant `c > 0`, `II^{c² g} = c II` (Lee, *Introduction to Riemannian Manifolds*, Ch. 7–8; in
the rotationally symmetric case Paternain–Salo–Uhlmann, Lemma 2.5.2, lines 2462–2473).
Route: on `T∂M`, where `dρ = 0`, Tau Ceti's conformal Hessian formula gives
`Hess_ĝ ρ = Hess_g ρ + ⟨grad φ, grad ρ⟩_g g = Hess_g ρ + |dρ|_g dφ(ν_in) g`, and
`|dρ|_ĝ = e^{−φ}|dρ|_g`; divide as in 1.4.

- The law is local: it uses `φ` only on a neighbourhood of `∂M`, and only `φ|∂M` and `dφ(ν_in)`.
- If `dφ(ν_in) = 0` along `∂M`, then `II^ĝ = e^{φ} II`, so the sign of `II_q(u, u)` is preserved
  for every `q ∈ ∂M` and `u ∈ T_q∂M`.

**Checks.**

- `φ = log 2` on the closed unit ball: `II^ĝ = 2h`, the second fundamental form of the radius-2
  ball pulled back by `x ↦ 2x` (`h_{S₂}/2` pulls back to `4h/2`).
- Closed unit disc with `φ = −|x|²`: `ν_in = −x`, `dφ(ν_in) = 2` on the circle, so
  `II^ĝ = e^{−1}(1 − 2)h = −e^{−1}h`, and `Ĥ = e·(1 − 2) = −e`. The wrong sign
  `e^{φ}(II + dφ(ν_in) h)` would give `+3e^{−1}h`.
- `φ = (|x|² − 1)²` on the unit ball: `φ = 0` and `dφ = 0` on the sphere, so `II^ĝ = II = h`.

*Needs:* 1.2, 1.4, 1.5; Tau Ceti `Bundle.ContMDiffRiemannianMetric.rescale`,
`Bundle.ContMDiffRiemannianMetric.hessian_rescale`,
`Bundle.ContMDiffRiemannianMetric.leviCivitaConnection_rescale_apply`.

### Examples

The closed unit ball (`II = h`, and `H = 1` for `n ≥ 1`), the half-space (`II = 0`), the exterior
of the unit ball (`II = −h`), the solid cylinder (`H = 1/2`), the constant non-diagonal metric on
the half-plane (slanted coordinate normal), and the conformal disc `e^{−2|x|²} g`
(`II = −e^{−1} h`).

### Dependencies

1.1 uses Tau Ceti's boundary charts and DifferentialGeometry 5.1; 1.2 uses DifferentialGeometry
12.2 and 12.5 and 1.1; 1.3 uses 1.1–1.2, Tau Ceti's Hadamard factorisation and Mathlib's partitions of
unity; 1.4 uses 1.1–1.3, DifferentialGeometry 12.3, Mathlib's Levi-Civita connection and Tau Ceti's
Hessian; 1.5 uses 1.4 and the induced metric; 1.6 uses 1.2, 1.4–1.5 and Tau Ceti's conformal
formulas.

## Layer 2: Convexity of the boundary

### 2.1 Convexity predicates

Define, for `q ∈ ∂M`: `∂M` is strictly convex at `q` (`IsStrictlyConvexAt`) if `II_q(u, u) > 0`
for every nonzero `u ∈ T_q∂M`; convex at `q` if `II_q(u, u) ≥ 0` for every `u`; strictly concave at
`q` if `II_q(u, u) < 0` for every nonzero `u`. For `S ⊆ ∂M`, `∂M` is strictly convex on `S` if it
is at every point of `S`; `∂M` is strictly convex (`IsStrictlyConvexBoundary`) if it is at every
point of `∂M`
(Paternain–Salo–Uhlmann, Definition 3.1.7, lines 2738–2739; Stefanov–Uhlmann–Vasy, lines 89–90
and 93; Paternain–Salo–Uhlmann, Definition 2.5.1, lines 2449–2461, for concavity, in dimension
two, where a circle `{r = r̄}` is named as seen from the side of the larger radii, that is, as the
boundary of the region `{r ≤ r̄}`: its strictly concave circle, `r̈(0) < 0`, is a strictly
concave boundary of `{r ≤ r̄}` in the sense here and a strictly convex boundary of `{r ≥ r̄}`).

- Strictly convex at `q` implies convex at `q`; for `n ≥ 1` strict convexity and strict concavity
  at `q` exclude each other.
- Strictly convex at `q` iff every principal curvature at `q` is positive; for `n ≥ 1`, strict
  convexity at `q` gives `H(q) > 0` and convexity at `q` gives `H(q) ≥ 0`.
- The predicates are invariant under isometries of manifolds with boundary.
- By 1.6, `∂M` is strictly convex at `q` for `e^{2φ} g` iff `II_q − dφ_q(ν_in) h_q` is positive
  definite.

**Checks.**

- The closed unit ball is strictly convex; for `n ≥ 1` the half-space is convex and nowhere
  strictly convex; the closed exterior of the unit ball is strictly concave; the solid cylinder is
  convex, not strictly convex, with `H = 1/2 > 0`.
- `M = {y ≥ x³} ⊆ ℝ²` with `ρ = y − x³`: at `(x, x³)` with unit tangent `t`,
  `II(t, t) = 6x/(1 + 9x⁴)^{3/2}`; positive for `x > 0`, negative for `x < 0`, zero at `x = 0`, so the
  boundary is convex and concave but neither strictly at the origin.
- Dimension one: `T_q∂M = 0`, and `∂M` is both strictly convex and strictly concave at every point
  (both conditions are vacuous); the exclusion above needs `n ≥ 1`. In particular the half-line
  `[0, ∞)`, the one-dimensional half-space, is strictly convex.

*Needs:* 1.4, 1.5, 1.6.

### 2.2 Hessian characterisation

Prove: for `q ∈ ∂M` and any boundary defining function `ρ` on an open neighbourhood `U` of `q`,
`∂M` is strictly convex at `q` iff `Hess ρ(v, v) < 0` for every nonzero `v ∈ T_q∂M`
(`isStrictlyConvexAt_iff_hessian_neg`); convex at `q` iff
`Hess ρ ≤ 0` on `T_q∂M`; strictly concave at `q` iff `Hess ρ(v, v) > 0` for every nonzero
`v ∈ T_q∂M`. In particular each condition holds for one defining function iff it holds for every
one (Paternain–Salo–Uhlmann, Lemma 3.1.12 and lines 2838–2841; Uhlmann–Vasy, lines 499–503).

**Checks.**

- On the closed unit ball, `ρ = 1 − |x|²` and `ρ' = (2 + x₁)ρ` (functions on the ball, where
  `2 + x₁ ≥ 1`) give, on `T∂M` where `ρ = 0` and
  `dρ = 0`, `Hess ρ' = (2 + x₁) Hess ρ = −2(2 + x₁) h`, negative for both: the sign does not depend on
  the defining function.
- `−ρ` is negative inside, so it is not a defining function, and it reverses every sign: the
  positivity convention of 1.3 is load-bearing.

*Needs:* 1.3, 1.4, 2.1.

### 2.3 Openness, uniform bounds and families of metrics

Prove:

- The sets of points of `∂M` at which `∂M` is strictly convex, respectively strictly concave, are
  open in `∂M` (continuity of `II` and compactness of `h`-unit spheres in `T∂M` over compact
  neighbourhoods).
- If `∂M` is compact and strictly convex, there is `c > 0` with `II_q(u, u) ≥ c h_q(u, u)` for all
  `q ∈ ∂M` and `u ∈ T_q∂M`; equivalently every principal curvature is at least `c`.
- For a finite-dimensional smooth parameter manifold `P` and a smooth family `(g_s)_{s ∈ P}` of
  Riemannian metrics on `M` (a `TauCeti.Manifold.ContMDiffNondegenerateMetricFamily` whose forms
  are positive definite), the set of `(s, q) ∈ P × ∂M` at which `∂M` is strictly convex for `g_s`
  is open; if `∂M` is compact and strictly convex for `g_{s₀}`, it is strictly convex for every
  `g_s` with `s` in a neighbourhood of `s₀` (Paternain–Salo–Uhlmann, lines 3093–3095; Uhlmann–Vasy,
  lines 49–51).

**Checks.**

- The epigraph `{y ≥ √(1 + x²)} ⊆ ℝ²` has curvature `(1 + 2x²)^{−3/2}` at `(x, √(1 + x²))`: strictly
  convex everywhere with infimum `0`, so the uniform bound needs compactness of `∂M`.
- The closed unit ball of `ℝⁿ⁺¹`, `n ≥ 1`: `II = h`, and a unit `u ∈ T_q∂M` turns the bound into
  `1 ≥ c`, so the best constant is `c = 1`. For `n = 0`, `M = [−1, 1]`, every `T_q∂M` is zero and
  `II_q(0, 0) = 0 = c h_q(0, 0)` for every `c > 0` (`c = 2`, `c = 100`): the bound holds, with no
  largest constant, so sharpness is a statement for `n ≥ 1` only.
- For `M = {y ≥ x³}` the convex points form the closed set `{x ≥ 0}` of the boundary, which is not
  open: convexity without strictness is not an open condition.
- The family `g_s = e^{−2s|x|²} g` on the closed unit disc, `s ∈ ℝ`, has `II^{g_s} = e^{−s}(1 − 2s)h`
  by 1.6: strictly convex exactly for `s < 1/2`, an open set of parameters, with `II = 0` at
  `s = 1/2`.

*Needs:* 1.4, 1.5, 1.6, 2.1; Tau Ceti `TauCeti.Manifold.ContMDiffNondegenerateMetricFamily`,
`TauCeti.Manifold.ContMDiffNondegenerateMetricFamily.contMDiffAt_christoffelSymbol`.

### Examples

The ball (strictly convex), half-space (convex), exterior (strictly concave), cylinder (convex,
mean convex), `{y ≥ x³}` (mixed), the hyperbola epigraph (no uniform bound) and the conformal
family `e^{−2s|x|²} g` (threshold `s = 1/2`).

### Dependencies

2.1 uses 1.4–1.6; 2.2 uses 1.3–1.4 and 2.1; 2.3 uses 1.4–1.6, 2.1 and Tau Ceti's metric families.

## Layer 3: Regular domains and the extension across the boundary

### 3.1 Regular domains

Let `(N, g)` be a Hausdorff boundaryless smooth manifold over `𝓘(ℝ, E)` with `finrank ℝ E = n + 1`
and a smooth Riemannian metric, and `ρ : N → ℝ` smooth with `0` a regular value
(`TauCeti.IsRegularValue`). Construct the regular domain `D_ρ := {ρ ≥ 0}` as a Riemannian manifold
with boundary: Tau Ceti's sublevel atlas for `−ρ` (`TauCeti.scalarRegularSublevelChartedSpace`,
manifold by `TauCeti.isManifold_scalarRegularSublevel`, boundary `{ρ = 0}` by
`TauCeti.boundary_scalarRegularSublevel`, interior `{ρ > 0}` by
`TauCeti.interior_scalarRegularSublevel`) with the metric `g_D` pulled back along the inclusion
`j : D_ρ → N` (`Bundle.ContMDiffRiemannianMetric.pullback`) (Stefanov–Uhlmann–Vasy, lines 96–97;
Uhlmann–Vasy, lines 25–26; Paternain–Salo–Uhlmann, lines 2770–2772). Prove:

- `j` is smooth with invertible differential at every point, boundary points included
  (RiemannianGeometry R7.9 for `φ = −ρ`, `a = 0`, when `N` is second countable; both properties are
  local, and Tau Ceti's sublevel chart at a point is built from the chart of `N` at that point, so
  R7.9 applied to `ρ` restricted to a chart domain of `N`, which is second countable, gives them
  for every Hausdorff `N`), and `j` is a closed embedding: `D_ρ` carries the subspace topology and
  is closed in `N`, with `∂D_ρ = {ρ = 0}`.
- Levi-Civita compatibility: `j` is a local Riemannian isometry `(D_ρ, g_D) → (N, g)`
  (`TauCeti.IsLocalRiemannianIsometry`): it is smooth with invertible differential at every point
  by the first item, and `dj` preserves inner products by
  `Bundle.ContMDiffRiemannianMetric.pullback_inner`. Tau Ceti's naturality theorems, which assume
  no boundaryless model, then give, for `x ∈ D_ρ`, `X, X' ∈ T_x D_ρ`, a vector field `Y` on `N`
  differentiable at `j(x)` and its pullback `Y_D`, `dj(∇^D_X Y_D) = ∇^N_{dj X} Y`
  (`TauCeti.IsLocalRiemannianIsometry.mfderiv_leviCivitaConnection_mpullback`), and, for `f` of
  class `C²` near `j(x)`, `Hess^D(f ∘ j)(X, X') = Hess^N f(dj X, dj X')`
  (`TauCeti.IsLocalRiemannianIsometry.hessian_comp`), boundary points included; both are
  consumed, not proved again. Prove `dj(grad^D(f ∘ j)) = grad^N f` on `D_ρ`: for every
  `X ∈ T_x D_ρ`, `⟨dj grad^D(f ∘ j), dj X⟩ = d(f ∘ j)(X) = df(dj X) = ⟨grad^N f, dj X⟩`
  (`TauCeti.Manifold.inner_mgradient`), and `dj` is onto.
- `ρ ∘ j` is a global boundary defining function of `D_ρ`. A vector `v` at a boundary point is
  outward iff `dρ(dj v) < 0` (RiemannianGeometry R7.9's outward criterion for `φ = −ρ`, local as
  in the first item), so `dj(ν_in) = grad ρ/|grad ρ|` on `{ρ = 0}`: it is the unit vector
  orthogonal to `ker dρ = dj(T∂D_ρ)` on which `dρ` is positive. Moreover
  `II_{D_ρ} = −Hess^N ρ/|dρ|` on `T∂D_ρ`.
- Independence of `ρ`: if `ρ, ρ'` have `0` as regular value and `{ρ ≥ 0} = {ρ' ≥ 0}`, the identity
  is a diffeomorphism and an isometry between the two structures.
- Lengths: for a `C¹` curve in `D_ρ`, its length in `D_ρ` equals the length of its composite with
  `j`; hence the Riemannian distance of `D_ρ` is at least that of `N` on `D_ρ`.

**Checks.**

- The closed unit ball `{1 − |x|² ≥ 0} ⊆ ℝⁿ⁺¹` and the same set written as
  `{e^{x₁}(1 − |x|²) ≥ 0}` give the same structure, with `II = h`: the multiplier `e^{x₁}` is
  positive on all of `ℝⁿ⁺¹`, and on the sphere it multiplies both the tangential Hessian and `|dρ|`.
- The multiplier must be positive on all of `N`, not only on `M`: `ρ' = (2 + x₁)(1 − |x|²)` is
  positive inside the ball, but at the point with `x₁ = −3` and all other coordinates `0` it equals
  `(−1)(−8) = 8`; `{ρ' ≥ 0}` is the
  ball together with the half-space `{x₁ ≤ −2}`, and `0` is a regular value of `ρ'` on the sphere
  and on the hyperplane `{x₁ = −2}` (where `dρ' = (1 − |x|²) dx₁` and `|x|² ≥ 4`), so `ρ'` is the
  defining function of a different regular domain.
- `ρ = (1 − |x|²)³` has `0` as a critical value on the sphere: the regular-value hypothesis fails,
  and the sublevel theorem does not apply, although the set is the ball.
- `ρ = x₀² − x₁²` on `ℝ²` has a critical point at the origin in `{ρ = 0}`, and `{ρ ≥ 0}` is a double
  cone, not a manifold with boundary there.
- Outward criterion on the closed unit ball, `ρ = 1 − |x|²`, `φ = −ρ = |x|² − 1`: at `x` on the
  sphere `dφ(v) = 2⟨x, v⟩`, so `v` is outward iff `⟨x, v⟩ > 0`, `ν_out = x` and
  `dj(ν_in) = −x = grad ρ/|grad ρ| = −2x/2`. On the half-space `{x⁰ ≥ 0}` with `ρ = x⁰`,
  `dφ(−e₀) = 1 > 0`, so `−e₀` is outward, as in the Conventions. Reading the criterion with `ρ` in
  place of `φ = −ρ` would make `x` inward on the sphere and `e₀` outward on the half-space.

*Needs:* 1.1–1.4; RiemannianGeometry R7.9 (smoothness and invertible differential of the inclusion
of a regular sublevel, the outward criterion); Tau Ceti `TauCeti.IsRegularValue`,
`TauCeti.scalarRegularSublevelChartedSpace`, `TauCeti.isManifold_scalarRegularSublevel`,
`TauCeti.boundary_scalarRegularSublevel`, `TauCeti.interior_scalarRegularSublevel`,
`Bundle.ContMDiffRiemannianMetric.pullback`, `Bundle.ContMDiffRiemannianMetric.pullback_inner`,
`TauCeti.IsLocalRiemannianIsometry`,
`TauCeti.IsLocalRiemannianIsometry.mfderiv_leviCivitaConnection_mpullback`,
`TauCeti.IsLocalRiemannianIsometry.hessian_comp`, `TauCeti.Manifold.inner_mgradient`; Mathlib
`Manifold.pathELength`.

### 3.2 Sublevel sets and level sets concave from the superlevel sets

Define, for an open `U ⊆ N`, `x ∈ C^∞(U)` and `y ∈ U`: the level set of `x` through `y` is
strictly concave from the superlevel sets at `y` (`IsStrictlyConcaveLevelSetAt`) if `dx_y ≠ 0` and
`Hess x(v, v) > 0` for every nonzero `v ∈ ker dx_y`; the level sets of `x` are strictly concave
from the superlevel sets on `U` if this holds at every `y ∈ U` (so `dx ≠ 0` on `U`)
(Stefanov–Uhlmann–Vasy, lines 128–129 and
198–200; Uhlmann–Vasy, lines 137–140 and 507–509). Prove:

- For `c` a regular value of `x` (`dx ≠ 0` on `{x = c}`; `dx` may vanish elsewhere in `U`),
  `{x ≤ c}` is a regular domain of the open submanifold `U` with defining function `c − x` (3.1),
  and `II(v, v) = Hess x(v, v)/|dx|` on `T∂{x ≤ c}`, so its boundary is strictly convex at `y` iff
  the level set is strictly concave from the superlevel sets at `y`; the superlevel domain
  `{x ≥ c}` has `II = −Hess x/|dx|` and is strictly concave there.
- Model: for a regular domain `M = {ρ ≥ 0}` and `q ∈ ∂M`, the level set of `x = −ρ` through `q` is
  strictly concave from the superlevel sets at `q` iff `∂M` is strictly convex at `q`.
- The condition is invariant under replacing `x` by `a x + b` with `a > 0` and depends only on the
  germ of `x` at `y`.

**Checks.**

- `x = |z|²` on all of `ℝⁿ⁺¹`: `dx = 2z` vanishes only at `0` and `Hess x = 2g`, so the level set
  through every `y ≠ 0` is strictly concave from the superlevel sets at `y`, and the level sets are
  strictly concave from the superlevel sets on `ℝⁿ⁺¹ ∖ {0}`, not on `ℝⁿ⁺¹`. Every `c > 0` is a
  regular value and `{x ≤ c}` is the closed ball, with `|dx| = 2√c` on the sphere and
  `II = 2h/(2√c) = h/√c`; `c = 0` is a critical value and `{x ≤ 0} = {0}` is no regular domain. On
  `U = ℝⁿ⁺¹ ∖ {0}` the sublevel set `{x ≤ c}` is the punctured ball, a non-compact regular domain of
  `U`. For `n ≥ 1`, `x = −|z|²` has `Hess x = −2g` and fails at every `y ≠ 0`.
- For `n ≥ 1` an affine `x` on `ℝⁿ⁺¹` has `Hess x = 0`: its level sets (hyperplanes) are not
  strictly concave from either side.
- Dimension one: `ker dx_y = 0`, so the condition holds vacuously at every `y` with `dx_y ≠ 0`,
  for every `x`, including the affine `x(t) = t` on `ℝ` and `x = −|z|²` on `ℝ ∖ {0}`.
- Stefanov–Uhlmann–Vasy's example (lines 203–205): `x(z) = |z − z₀| − sup_M |· − z₀|` on `ℝⁿ⁺¹ ∖ {z₀}`
  has `Hess x = (g − dx ⊗ dx)/|z − z₀|`, positive definite on `ker dx`.

*Needs:* 1.3, 1.4, 2.1, 3.1.

### 3.3 Defining functions on the collar extension and the double

Let `M` be Hausdorff and second countable, `c : ∂M × [0, 1) → M` a smooth collar with open image `U`
(GeometricTopology 1.1), and `int M` the interior with GeometricTopology 1.1's boundaryless
structure, which the supplier contracts assume to be the open-submanifold one, for which `int M → M`
is a smooth open embedding. Let `M̃` be the collar extension: GeometricTopology 1.3's glued manifold
`M ∪_f N` for `N = ∂M × [0, 1)` with its product collar and `f(q) = (q, 0)`, with `N` over
`𝓡∂ (n+1)` by the reordering `TauCeti.EuclideanHalfSpace.collarDiffeomorph` of the supplier
contracts. By GeometricTopology 1.3, `M̃` is a Hausdorff second-countable boundaryless manifold of
dimension `n + 1`, `M` is a closed subset of `M̃` through its smooth embedding, and the union of the
two collars is an open subset identified with `∂M × (−1, 1)`; write `c̃ : ∂M × (−1, 1) → M̃` for
this open embedding, equal to `c` for `t ≥ 0`. Then `c̃(q, t) ∈ M` iff `t ≥ 0`: for `t < 0` the
point `c̃(q, t)` is the image of the interior point `(q, −t)` of `N`, and the images of `M` and `N`
meet only in `∂M`. Prove:

- There is `ρ̃ ∈ C^∞(M̃)` with `0` a regular value, `ρ̃ > 0` on `int M`, `ρ̃ = 0` on `∂M`,
  `ρ̃ < 0` on `M̃ ∖ M`, and `ρ̃(c̃(q, t)) = t` on a neighbourhood of `∂M × {0}` in `∂M × (−1, 1)`,
  which contains `∂M × (−1/2, 1/2)` when `∂M` is compact. Route: with a smooth partition of
  unity `φ₀ + φ₁ = 1` subordinate to the open cover of `M̃` by `c̃(∂M × (−1, 1))` and `M̃ ∖ ∂M`
  (`∂M` is closed in `M̃`; for compact `∂M` the second set is replaced by
  `M̃ ∖ c̃(∂M × [−1/2, 1/2])`, open because `c̃(∂M × [−1/2, 1/2])` is compact), set
  `ρ̃ := φ₀ · (χ ∘ t) + φ₁ · s`, with `t` the bicollar coordinate, `χ` an odd smooth function,
  positive on `(0, 1)`, equal to `t` for `|t| ≤ 1/2` and to `1` for `t ≥ 3/4`, and `s` the locally
  constant function equal to `1` on the open set `int M` and to `−1` on the open set `M̃ ∖ M`
  (`φ₁ s` is smooth because the support of `φ₁` avoids `∂M`).
- Atlas comparison: the identity of `M` is a diffeomorphism from `M`'s atlas onto Tau Ceti's
  sublevel atlas of `{ρ̃ ≥ 0}`. At interior points both atlases consist of the charts of `int M`;
  near `∂M`, the bicollar chart restricted to `t ≥ 0` (the inverse of `c`, then a chart of `∂M` in
  the first factor, then the reordering `TauCeti.EuclideanHalfSpace.collarDiffeomorph`,
  `(y, t) ↦ (t, y)`) is a chart of `M`'s maximal atlas in
  which `ρ̃ = t` is the normal coordinate `x⁰`, so the sublevel charts built from it are compatible
  with `M`'s half-space charts.
- The double: if `M` is compact and `∂M ≠ ∅`, let `DM = M ∪_id M` be GeometricTopology 1.3's double
  (compact, and connected when `M` is), with bicollar `c̃ : ∂M × (−1, 1) → DM` equal to `c` into the
  first copy for `t ≥ 0` and to `(q, t) ↦ c(q, −t)` into the second copy for `t ≤ 0`. There is
  `ρ_D ∈ C^∞(DM)` with `0` a regular value, `ρ_D > 0` on the interior of the first copy of `M`,
  `ρ_D = 0` on the seam, `ρ_D < 0` on the interior of the second copy, and `ρ_D(c̃(q, t)) = t` for
  `|t| < 1/2`, built as `ρ̃` was with `s = 1` on the first copy of `int M` and `s = −1` on the
  second; the identity of the first copy of `M` is a diffeomorphism onto the sublevel atlas of
  `{ρ_D ≥ 0}`.

(Paternain–Salo–Uhlmann, Lemma 3.1.8 and Exercise 3.1.9, lines 2749–2762; Lee, *Introduction to
Smooth Manifolds*, Theorem 9.25, for the collar.)

**Checks.**

- `M = [0, 1]` with GeometricTopology 1.1's interval collar `c(0, t) = t/2`, `c(1, t) = 1 − t/2`:
  the coordinate `x` of `M` extends across the ends by `x = t/2` near `0` and `x = 1 − t/2` near `1`,
  identifying `M̃` with the open interval `(−1/2, 3/2)`; the function `ρ̃` equals `2x` for
  `|x| < 1/4` and `2(1 − x)` for `|x − 1| < 1/4`, so `|dρ̃/dx| = 2` at both endpoints: the
  normalisation `ρ̃ ∘ c̃ = t` is relative to the collar, not to a metric. `DM` is a circle on which
  `ρ_D` has exactly two zeros, both regular; the closed unit disc doubles to a 2-sphere.
- The closed half-space `{x⁰ ≥ 0} ⊆ ℝⁿ⁺¹` with the collar `c(q, t) = q + t e₀`: `M̃ ≅ {x⁰ > −1}`,
  non-compact, and `ρ̃ = x⁰` has every property required on all of `M̃`.
- The sign pattern does not give the regular value: on `M̃ = (−1/2, 3/2)` of the first Check, the
  function `x³(1 − x)³` is positive on `(0, 1)`, zero at `0` and `1` and negative on `M̃ ∖ [0, 1]`,
  but its derivative vanishes at `0` and `1`, so Tau Ceti's sublevel atlas does not apply to it;
  `ρ̃` has `dρ̃(∂_t) = 1` along `∂M`.
- `∂M = ∅`: the collar is empty, `N = ∅`, `M̃ = int M` is `M` with GeometricTopology 1.1's
  boundaryless structure, and `ρ̃ ≡ 1` (`0` is a regular value vacuously). The double would be
  `M ⊔ M`, disconnected for nonempty `M`, which is why 3.5 does not use it then.

*Needs:* GeometricTopology 1.1 (collars, the interior) and 1.3 (gluing along the boundary, the
double); 3.1; Tau Ceti `TauCeti.isManifold_boundary`, `TauCeti.scalarRegularSublevelChartedSpace`,
`TauCeti.EuclideanHalfSpace.collarDiffeomorph`;
Mathlib `ModelWithCorners.isClosed_boundary`, `SmoothPartitionOfUnity`.

### 3.4 Extension of functions and metrics across the boundary

Let `M = {ρ ≥ 0}` be a regular domain of a Hausdorff second-countable boundaryless `N`. Prove:

- Every smooth function on `M` (smooth up to the boundary, in Mathlib's sense on the manifold with
  boundary) is the restriction of a smooth function on `N`; the same holds for smooth sections of
  `T*M ⊗ T*M`. Route: in the half-space charts of the sublevel atlas, which are restrictions of
  charts of `N` in which `M = {x⁰ ≥ 0}`, apply the half-space Seeley extension to the coordinate
  coefficients, cut off inside the chart, and sum with a partition of unity of `N`.
- Every smooth Riemannian metric `g_M` on `M` is the restriction of a smooth Riemannian metric on
  `N`: extend the metric tensor, which stays positive definite on an open neighbourhood of `M` by
  continuity, and glue with any metric of `N` (DifferentialGeometry 12.1) by a cutoff equal to `1`
  on `M` and supported in that neighbourhood.

(Paternain–Salo–Uhlmann, lines 2755–2762.)

**Checks.**

- `f(x) = √x` on `[0, 1]` is continuous but not smooth up to `0` and has no smooth extension; the
  hypothesis is smoothness up to the boundary.
- On `M = [0, 1] ⊆ N = ℝ`, the metric `(x + 1/100) dx²` extends by the same formula only to
  `x > −1/100`; on `N = ℝ` the cutoff gluing is required for positivity.
- On a regular domain with empty boundary (`M` open and closed in `N`), extension by any smooth
  function on the complement works and no Seeley step is used.

*Needs:* 3.1; ComplexKahlerGeometry K5a (extension across a smooth boundary: the half-space
Seeley extension); DifferentialGeometry 12.1 (Tau Ceti `TauCeti.nonempty_contMDiffRiemannianMetric`);
Mathlib `SmoothPartitionOfUnity`, `exists_contMDiffSection_forall_mem_convex_of_local`.

### 3.5 The realisation theorem

Prove (`exists_isSmoothEmbedding_regularDomain`): for every Hausdorff second-countable `(M, g)` as
in the Conventions there are a Hausdorff second-countable boundaryless Riemannian manifold
`(M̃, g̃)` of dimension `n + 1`, in the universe of `M`, a smooth `ρ̃ : M̃ → ℝ` with `0` a regular
value (`TauCeti.IsRegularValue`), and a smooth embedding `j : M → M̃` (`Manifold.IsSmoothEmbedding`)
with image `{ρ̃ ≥ 0}`, `j(∂M) = {ρ̃ = 0}` and `j* g̃ = g`. By 3.1 and the inverse function theorem
in half-space charts, `j` is a diffeomorphism `Φ` from `M` onto the regular domain `{ρ̃ ≥ 0}` with
Tau Ceti's sublevel atlas, with `Φ* g̃ = g` and `Φ(∂M) = {ρ̃ = 0}`. The same `M̃` is compact when
`M` is, and compact and connected when `M` is compact and connected (the closed extension)
(Paternain–Salo–Uhlmann, Lemma 3.1.8, lines 2749–2762; Stefanov–Uhlmann–Vasy, lines 96–97).
Route: 3.3 for `M̃` and `ρ̃` (GeometricTopology 1.3's double when `M` is compact with `∂M ≠ ∅`,
otherwise the collar extension, which is `int M` with GeometricTopology 1.1's boundaryless
structure when `∂M = ∅`), then 3.4 for `g̃`.

For compact `M` and the collar extension `M̃` of 3.3, the first statement contains
RiemannianGeometry R5c's presentation of a compact Riemannian manifold with boundary (scalar
principal eigenfunction, item 1): `int M` is open in `M̃` (GeometricTopology 1.3) with closure
`M`, which is compact, and near each point of `∂M` a chart of `∂M` together with the bicollar
coordinate `t` is, through `c̃`, a chart of `M̃` in which `int M = {t > 0}`, the half-space on the
normal coordinate, which R5c places last and Mathlib's `EuclideanHalfSpace` first. R5c's defining
function of such a domain (item 3) is negative on it, and `−ρ̃` is one. The statement here also
covers non-compact `M`, gives `ρ̃` with the normalisation `ρ̃ ∘ c̃ = t` and Tau Ceti's sublevel
atlas, and gives a compact, and compact connected, `M̃`.

**Checks.**

- The closed unit disc is realised in `ℝ²` with `ρ = 1 − |x|²` and in its double `S²`; Layer 1
  gives `II = h` in both, since `II` is computed on the disc itself.
- RiemannianGeometry R5c's conventions on the closed unit disc with the radial collar
  `c(q, t) = (1 − t/2) q`: the collar extension is the open disc of radius `3/2`, with
  `c̃(q, t) = (1 − t/2) q` for `|t| < 1`, and `ρ̃ = t = 2(1 − |x|)` for `3/4 < |x| < 5/4`. In the
  chart `(t, θ)` of `M̃` near `(1, 0)`, `|θ| < π/2`, Mathlib's order puts the normal coordinate
  first and `int M = {x⁰ > 0}`; R5c's order `(θ, t)` puts it last and `int M = {x_2 > 0}`.
  Reading R5c's last coordinate in Mathlib's order gives `{θ > 0}`, which crosses the circle and
  is not `int M`. R5c's defining functions are negative on the domain: `−ρ̃ = 2(|x| − 1)` near the
  circle is one, and `ρ̃` has the wrong sign for R5c; for a closed `M`, `−ρ̃ ≡ −1` is R5c's
  `ρ = −1` of a closed manifold. The half-line `[0, ∞)`, non-compact, with `M̃ ≅ (−1, ∞)` and
  `ρ̃ = x` near `0`, is outside R5c's compact setting, and the compactness of the double `S²` is
  not part of R5c's statement.
- `[0, 1]` with `g = (1 + x)² dx²` is realised in the circle `D[0, 1]` with an extended metric; its
  length `∫₀¹ (1 + x) dx = 3/2` is the same in every realisation.
- A compact manifold without boundary is its own realisation with `ρ̃ ≡ 1`.
- The Hausdorff hypothesis cannot be dropped: the half-line `[0, ∞)` with the point `1` doubled
  is a manifold over `𝓡∂ 1` with the metric `dx²` on both copies, but the two copies of `1` have
  no disjoint neighbourhoods, so it is homeomorphic to no subspace of a Hausdorff `M̃` and is no
  regular domain.

*Needs:* 3.1, 3.3, 3.4; GeometricTopology 1.1 and 1.3; RiemannianGeometry R5c (relatively
compact smooth domains and their defining functions, for the comparison of the compact case);
Mathlib `Manifold.IsSmoothEmbedding`; Tau Ceti `TauCeti.IsRegularValue`.

### 3.6 Comparison with immersion geometry

For a regular domain `M = {ρ ≥ 0}` of a second-countable `(N, g)` as in 3.1 (RiemannianGeometry's
standing setting, in which R5a is stated; in particular a realisation from 3.5), the inclusion
`∂M → N` is an isometric embedding of the boundaryless manifolds `(∂M, h)` and `(N, g)`, both
Hausdorff and second countable (`∂M` carries the subspace topology of `N`, by 3.1). Prove that
RiemannianGeometry R5a's second fundamental form `B` of this embedding satisfies
`B(u, w) = II(u, w) ν_in`, that R5a's shape operator satisfies `S_{ν_in} = S`, and that R5a's
averaged mean curvature vector is `H ν_in` (`n ≥ 1`). Consequently R5a's Gauss equation reads, for
tangent `X, Y, Z, W`, `⟨R^{∂M}(X, Y)Z, W⟩ = ⟨R^N(X, Y)Z, W⟩ + II(X, W) II(Y, Z) − II(X, Z) II(Y, W)`,
and only the values of `R^N` on `M` enter (Lee, *Introduction to Riemannian Manifolds*, Ch. 8).

**Checks.**

- Unit sphere in `ℝⁿ⁺¹`: R5a's `B = −g · position` and `ν_in = −position` give `⟨B, ν_in⟩ = h = II`;
  the Gauss equation gives sectional curvature `0 + 1·1 − 0 = 1`.
- Boundary of the solid cylinder in `ℝ³`: `II = diag(1, 0)` in the circle and axis directions, Gauss
  gives curvature `0 + 1·0 − 0 = 0`, the flat cylinder.
- Exterior of the unit ball: `ν_in = +position`, so `⟨B, ν_in⟩ = −h = II`; the sign of `II` follows
  the side, while `B` does not.

*Needs:* 1.4, 1.5, 3.1; RiemannianGeometry R5a.

### Examples

Balls, half-spaces and cylinders as regular domains; the ball and the extra half-space
`{x₁ ≤ −2}` cut out by a multiplier that is positive only on the ball; the interval in its collar
extension `(−1/2, 3/2)` and the interval and the disc in their doubles, the circle and the sphere;
the conformal ball as a domain in `(ℝⁿ⁺¹, e^{2φ} g)`.

### Dependencies

3.1 uses 1.1–1.4, RiemannianGeometry R7.9 (the inclusion of a regular sublevel and its outward
criterion) and Tau Ceti's sublevel atlas, pullback metric and naturality of the Levi-Civita
connection and the Hessian under local Riemannian isometries; 3.2 uses 1.3–1.4, 2.1 and 3.1; 3.3
uses GeometricTopology 1.1 (collars, the interior) and 1.3 (the collar extension and the double as
gluings along the boundary), Tau Ceti's sublevel atlas and product collar model, Mathlib's
partitions of unity and 3.1; 3.4 uses 3.1, ComplexKahlerGeometry K5a, DifferentialGeometry 12.1 and
Mathlib's partitions of unity; 3.5 uses 3.1, 3.3–3.4, GeometricTopology 1.1 and 1.3 and, for the
comparison of the compact case, RiemannianGeometry R5c; 3.6 uses 1.4–1.5, 3.1 and RiemannianGeometry
R5a.

## Layer 4: Geodesics at the boundary

Throughout, `(N, g)` is a Hausdorff boundaryless Riemannian manifold as in 3.1 and `M = {ρ ≥ 0}` a
regular domain; by 3.5 every Hausdorff second-countable `(M, g)` is one. In 4.3, 4.4 and 4.6, which
use Tau Ceti's tube theorems (stated for a second-countable ambient manifold) and partitions of
unity, `N` is moreover second countable; 4.1, 4.2 and 4.5 are local and do not assume it.

### 4.1 Geodesics of a regular domain

Prove: for a nondegenerate interval `s` and `γ : ℝ → M`, `γ` is a geodesic of `M` on `s`
(`TauCeti.Manifold.IsGeodesicCurveOn` for `(M, g_M)`, which is defined at boundary points) iff
`j ∘ γ` is a geodesic of `N` on `s`, with the same initial data under `dj`. Consequences:

- Geodesics of `M` with given initial data agree on the intersection of their intervals.
- From `x ∈ int M` there is a geodesic of `M` on an open interval about `0`; from `q ∈ ∂M` with
  `v` inward there is one on `[0, ε)` for some `ε > 0`; from `q ∈ ∂M` with `v` outward there is
  none on any `[0, ε)`, `ε > 0`.
- An `N`-geodesic segment lying in `M` depends only on `(M, g_M)`. For a Hausdorff
  second-countable `(M, g)` and a realisation `Φ` of it onto a regular domain `{ρ̃ ≥ 0}` (3.5),
  `Φ` is a `TauCeti.RiemannianIsometry` from `(M, g)` onto the domain with its pulled-back metric
  (3.1), so geodesics of `(M, g)` on a parameter set, with their initial data, correspond to those
  of the domain by `TauCeti.RiemannianIsometry.isGeodesicCurveOn_comp_iff` and
  `TauCeti.RiemannianIsometry.isGeodesicCurveOnFrom_comp_iff`, and by the main statement to the
  geodesic segments of the ambient manifold lying in the domain. Two realisations of `(M, g)`
  therefore have corresponding geodesic segments, and the exit time `τ` (5.2) and the scattering
  relation `α` (5.6) of `(M, g)` are those of any realisation.

(Paternain–Salo–Uhlmann, lines 2646–2658 and 2763–2765.)

**Checks.**

- Closed unit ball: the nonconstant geodesics of `M` are the chords; from `q ∈ S^n` with
  `0 ≠ v ⊥ q` there is none on any `[0, ε)`, since `|q + tv|² = 1 + t²|v|² > 1` for `t ≠ 0` (`1 + t²`
  for unit `v`). For `v = 0` the constant curve at `q` is a geodesic of `M` on all of `ℝ` (the native
  geodesic predicate allows zero speed), in agreement with `τ(q, 0) = ∞` in 5.2.
- Closed half-space: a line `q + tv` with `q, v` in the boundary hyperplane is a geodesic of `M` on
  all of `ℝ` and lies in `∂M`.

*Needs:* 3.1, 3.5; HopfRinow Layer 1; Tau Ceti `TauCeti.Manifold.IsGeodesicCurveOn`,
`TauCeti.Manifold.IsGeodesicCurveOnFrom`, `TauCeti.Manifold.geodesicInterval`,
`TauCeti.RiemannianIsometry`, `TauCeti.RiemannianIsometry.isGeodesicCurveOn_comp_iff`,
`TauCeti.RiemannianIsometry.isGeodesicCurveOnFrom_comp_iff`.

### 4.2 Second-order contact with the boundary

Prove (Paternain–Salo–Uhlmann, Lemma 3.1.13, lines 2801–2828): for an `N`-geodesic `γ` on an open
interval and any smooth `f` on `N`, `(f ∘ γ)'' = Hess f(γ', γ')`; in particular, if
`γ(t₀) ∈ ∂M`, then `(ρ ∘ γ)(t₀) = 0`, `(ρ ∘ γ)'(t₀) = |dρ| ⟨ν_in, γ'(t₀)⟩` and
`(ρ ∘ γ)''(t₀) = Hess ρ(γ'(t₀), γ'(t₀))`. If `γ(0) = q` and `γ'(0) = dι u ∈ T_q∂M`, then
`(ρ ∘ γ)''(0) = −|dρ_q| II_q(u, u)` and `ρ(γ(t)) = −½ |dρ_q| II_q(u, u) t² + O(t³)`
(Paternain–Salo–Uhlmann, Lemma 3.1.12, lines 2781–2784 and 2841–2844). Prove:

- `∂M` is strictly convex at `q` iff `(ρ ∘ γ)''(0) < 0` for every `N`-geodesic with `γ(0) = q` and
  `0 ≠ γ'(0) ∈ T_q∂M`. Read through the musical isomorphism, with `(H_G ρ)(β)` and `(H_G² ρ)(β)` the
  first and second derivatives of `ρ` along the geodesic with initial velocity `β♯`, this is
  Uhlmann–Vasy's covector condition `H_G ρ(β) = 0 ⇒ H_G² ρ(β) < 0` for nonzero `β ∈ T*_q N`
  (lines 499–503).
- Tangent geodesics leave: if `∂M` is strictly convex at `q`, such a `γ` satisfies `γ(t) ∉ M` for
  `0 < |t| < ε`, some `ε > 0`. Read in `M` itself
  (`not_exists_isGeodesicCurveOnFrom_of_isStrictlyConvexAt`): if `∂M` is strictly convex at `q`
  and `0 ≠ u ∈ T_q∂M`, no geodesic of `(M, g)` on `[0, ε)`, `ε > 0`, starts at `q` with velocity
  `dι u`; so `τ(q, dι u) = 0` (5.2).
- No interior tangency (Paternain–Salo–Uhlmann, lines 2795–2798;
  `mem_interior_of_isGeodesicCurveOn`): if `∂M` is strictly convex, every nonconstant geodesic
  `γ : [a, b] → M` of `M` has `γ(t) ∈ int M` for `a < t < b`; in particular a maximal geodesic of
  `M` starting at a boundary point in an inward direction lies in `int M` except at its endpoints.
- The two statements read in `M` hold for every `(M, g)` of the Conventions, with no Hausdorff or
  countability hypothesis: their proof is the computation above for the normal coordinate
  `ρ = x⁰` of a half-space chart and a geodesic of `(M, g)`, with the Levi-Civita connection of
  `(M, g)` at boundary points; a nonconstant geodesic has constant nonzero speed, and at an
  interior time where it meets `∂M`, `ρ ∘ γ ≥ 0` has a minimum, so its velocity is tangent.

**Checks.**

- Unit ball, `q ∈ S^n`, unit `v ⊥ q`: `ρ(q + tv) = 1 − |q + tv|² = −t²`, so `(ρ ∘ γ)'' = −2`, equal to
  `−|dρ| II(v, v) = −2·1`.
- Exterior of the unit ball, the same unit `v ⊥ q`: `ρ(q + tv) = |q + tv|² − 1 = t² ≥ 0` (`t²|v|²`
  for any `v ⊥ q`), the tangent line stays in `M`;
  half-space: `ρ ≡ 0` along tangent lines, which stay in `∂M`; strict convexity is needed for the
  leaving conclusion.
- `{y ≥ x⁴} ⊆ ℝ²` at the origin: `II = 0` but `ρ(t, 0) = −t⁴ < 0` for `t ≠ 0`; the tangent line
  leaves to fourth order, so leaving does not imply strict convexity.

*Needs:* 1.1, 1.3, 1.4, 2.1, 2.2, 3.1, 4.1; HopfRinow Layer 1; Tau Ceti
`TauCeti.Manifold.hessian_apply_eq_mvfderiv_sub`, `TauCeti.Manifold.IsGeodesicCurveOn`,
`TauCeti.Manifold.IsGeodesicCurveOnFrom`.

### 4.3 The normal exponential and signed distance of a hypersurface

Let `f ∈ C^∞(N)` have `0` as a regular value, `Σ := f⁻¹(0)` with Tau Ceti's regular-level structure
(`TauCeti.regularLevelChartedSpace`, `TauCeti.isSmoothEmbedding_coe_regularLevel`), `ν_Σ :=
grad f/|grad f|`, and `E_Σ(q, r) := exp_q(r ν_Σ(q))` on its open natural domain in `Σ × ℝ` (Tau
Ceti `TauCeti.SmoothEmbedding.normalExp` through the trivialisation of the normal line bundle by
`ν_Σ`). Prove (Stefanov–Uhlmann–Vasy, lines 99–100; Paternain–Salo–Uhlmann, Lemma 3.1.10, lines
2766–2773; Lee, *Introduction to Riemannian Manifolds*, Ch. 5, "Tubular Neighborhoods and Fermi
Coordinates", pp. 133–136, and Ch. 6 for the Gauss lemma):

- Tube: there is a smooth `ε : Σ → (0, ∞)`, constant when `Σ` is compact, such that `E_Σ` is a
  diffeomorphism from `{(q, r) : |r| < ε(q)}` onto an open neighbourhood `W` of `Σ`, with
  `sign f(E_Σ(q, r)) = sign r`. For compact connected `Σ` in a connected `N` the diffeomorphism
  is RiemannianGeometry R7.9's normal collar for `ν = ν_Σ`; the statement here also allows a
  non-compact or disconnected `Σ` (such as the boundary `{0, 1} × ℝ` of the strip of 4.4), with a
  variable radius, and adds the sign of `f`.
- Gauss lemma for hypersurfaces: on `W`, `dE_Σ(∂_r)` is a unit vector orthogonal to
  `dE_Σ(T_qΣ × {0})`.
- Signed distance: `r_Σ :=` the second coordinate of `E_Σ⁻¹` is smooth on `W` with `|grad r_Σ| = 1`
  and `grad r_Σ = ν_Σ` on `Σ`, and there is an open `W' ⊆ W` containing `Σ` with
  `|r_Σ(y)| = d_N(y, Σ)` for `y ∈ W'`.
- Boundary case `Σ = ∂M`, `f = ρ`: on `W' ∩ M`, `r_{∂M}(y) = d_M(y, ∂M)`, the distance to `∂M` of
  `(M, g_M)` itself (no path is shorter than the normal segment, which lies in `M`), and `r_{∂M}`
  is a boundary defining function near `∂M` with `grad r_{∂M} = ν_in` on `∂M`.
- Normalised defining function: choose smooth `ε₁, ε₂ : ∂M → (0, ∞)` with `ε₁ < ε₂ < ε`, constant
  when `∂M` is compact, such that the closed tubes `E_{∂M}({|r| ≤ ε₁(q)})` and
  `E_{∂M}({|r| ≤ ε₂(q)})` are closed in `N` (Tau Ceti's closed-tube theorem, applied inside `W`,
  gives a radius `ε₂` with closed tube; every smaller positive continuous radius, such as the
  minimum of `ε₂` when `∂M` is compact and then `ε₁ := ε₂/2`, has a closed tube too, the image of a
  closed subset of the closed `ε₂`-disc bundle under the same closed embedding), and write
  `W := E_{∂M}({|r| < ε(q)})`, `W₂ := E_{∂M}({|r| < ε₂(q)})` and `W₁ := E_{∂M}({|r| < ε₁(q)})`.
  There is `ρ̂ ∈ C^∞(N)` with `ρ̂ = r_{∂M}` on `W₁` (so `ρ̂ = d_M(·, ∂M)` on the neighbourhood
  `W₁ ∩ W' ∩ M` of `∂M` in `M`), `ρ̂ = 1` on `M ∖ W`, `ρ̂ = −1` on `N ∖ (M ∪ W)`, and `ρ̂` between
  `r_{∂M}` and `1` on `W ∩ M` and between `r_{∂M}` and `−1` on `W ∖ M`. Hence `M = {ρ̂ ≥ 0}`,
  `∂M = {ρ̂ = 0}`, `N ∖ M = {ρ̂ < 0}`, `grad ρ̂ = ν_in` on `∂M`, and for `0 < δ < 1` every point
  of `{ρ̂ ≥ −δ} ∖ M` lies in `W` with `r_{∂M} ≥ −δ`. For a nonempty compact connected `∂M` in a
  connected `N`, the complement `N ∖ ∂M` is the union of the disjoint nonempty open sets
  `int M = {ρ > 0}` and `{ρ < 0}`, so it has exactly these two components (R7.9 allows at most
  two), and RiemannianGeometry R7.9's defining function for `ν = ν_in` has the zero set, the sign
  sets and the gradient on `∂M` of `ρ̂` and equals the collar coordinate near `∂M`; `ρ̂` is built
  here for every regular domain, with the comparison with `r_{∂M}` on `W` that 4.6 uses. Route:
  `ρ̂ = ψ r_{∂M} + (1 − ψ) s` with a smooth cutoff `ψ : N → [0, 1]` equal to `1` on the closed
  tube `E_{∂M}({|r| ≤ ε₁(q)})` and to `0` on the closed set `N ∖ W₂`, and a smooth
  `s : N → [−1, 1]` equal to `1` on the closed set `M ∖ W₁` and to `−1` on the closed set
  `N ∖ (M ∪ W₁)` (closed because `∂M ⊆ W₁`), both from Mathlib's
  `exists_contMDiff_zero_iff_one_iff_of_isClosed`. The support of `ψ` lies in the closure of `W₂`,
  hence in the closed `ε₂`-tube, which is closed in `N` and contained in `W`; so `ψ r_{∂M}`,
  extended by `0`, is smooth on each of the open sets `W` and `N ∖ E_{∂M}({|r| ≤ ε₂(q)})`, which
  cover `N`. A cutoff that is merely `0` off `W` can be positive up to the frontier of `W`, where
  `r_{∂M}` need not extend smoothly. On `W ∖ W₁` the value `ρ̂` is a convex combination of
  `r_{∂M}` and `s = ±1`.

**Checks.**

- `Σ = S^n ⊆ ℝⁿ⁺¹`, `f = 1 − |x|²`: `ν_Σ = −x`, `E(q, r) = (1 − r)q`, `r_Σ = 1 − |x|` on
  `0 < |x| < 2`, `|grad r_Σ| = 1`; `ε` cannot exceed `1`, where the normals meet at the centre.
  After `t = −r` this is RiemannianGeometry R7.9's collar `(1 + t)q` for the normal `x`, injective
  for the same widths `ε ≤ 1`.
- The cutoff must vanish near the frontier of `W`: for the closed unit ball, `ρ = 1 − |x|²`, the
  constant `ε = 1` is admissible, `W = {0 < |x| < 2}` and `r_{∂M} = 1 − |x|` is not smooth at the
  centre `0`, a frontier point of `W`. A cutoff that is only required to vanish off `W` may equal
  `|x|²` near `0`; then `ψ r_{∂M} = |x|² − |x|³` there, which is not `C³` at `0` (on a line
  through `0`, `|t|³` has third derivative `6 sign t` off `0`). With `ε₂ = 3/4` and `ε₁ = 1/2`,
  `W₂ = {1/4 < |x| < 7/4}`, so `ψ = 0` for `|x| ≤ 1/4` and for `|x| ≥ 7/4`, `ψ r_{∂M}` vanishes
  near `0`, and `ρ̂ = s = 1` there, as required on `M ∖ W₁`.
- For the exterior domain, `f = |x|² − 1` gives `r_Σ = |x| − 1`; the sign is fixed by `f`, not by `Σ`.
- In a slanted collar of the half-plane, `(q, r) ↦ q + r(e₀ + e₁)`, the cross term
  `⟨∂_r, ∂_{x₁}⟩ = 1` is nonzero; the normal exponential is the collar with no cross term.

*Needs:* 1.3, 3.1; HopfRinow Layers 1–2; RiemannianGeometry R7.9 (the normal collar and the
defining function in the compact connected case); Tau Ceti `TauCeti.regularLevelChartedSpace`,
`TauCeti.isSmoothEmbedding_coe_regularLevel`, `TauCeti.SmoothEmbedding.normalExp`,
`TauCeti.SmoothEmbedding.exists_partialDiffeomorph_normalExp_subset`,
`TauCeti.SmoothEmbedding.exists_isClosedEmbedding_normalExp_norm_le_subset`; Mathlib
`Manifold.riemannianEDist`, `exists_contMDiff_zero_iff_one_iff_of_isClosed`.

### 4.4 Boundary normal coordinates

With `ε` and `E := E_{∂M}` from 4.3 for `f = ρ`, prove (Paternain–Salo–Uhlmann, Proposition 11.2.2,
lines 10065–10077, for compact `M` in a closed manifold; Lee, *Introduction to Riemannian
Manifolds*, Ch. 5, "Tubular Neighborhoods and Fermi Coordinates", pp. 133–136, and Ch. 6 for the
Gauss lemma):

- `E` restricted to `{(q, r) ∈ ∂M × ℝ : 0 ≤ r < ε(q)}` is a diffeomorphism onto the open
  neighbourhood `W ∩ M` of `∂M` in `M`, a smooth collar of `∂M` in the sense of GeometricTopology
  1.1 after the rescaling `r = ε(q) s`.
- Distance collar: there is a smooth `η : ∂M → (0, ∞)` with `η ≤ ε`, constant when `∂M` is
  compact, such that `E({(q, r) : |r| < η(q)}) ⊆ W'` for the distance neighbourhood `W'` of 4.3;
  hence `r = d_M(·, ∂M)` on `E({(q, r) : 0 ≤ r < η(q)})`, by the boundary case of 4.3. Route:
  `E⁻¹(W')` is an open neighbourhood of `∂M × {0}` in the tube, so the largest half-width
  `m(q) := sup {s ∈ (0, ε(q)] : {q} × (−s, s) ⊆ E⁻¹(W')}` is positive and lower semicontinuous
  (tube lemma on `{q} × [−s, s]`), and a partition of unity on `∂M` (second countable because `N`
  is, as for the tube of 4.3) gives a smooth `0 < η < m`, a constant when `∂M` is compact. On the
  rest of the half-tube `r` is still the normal coordinate, but need not be the distance to `∂M`.
- On `{|r| < ε(q)}`, `(E* g)((u, a), (u', a')) = a a' + h_r(u, u')` for `u, u' ∈ T_q∂M`, where
  `h_r(u, u') := g(dE_{(q, r)}(u, 0), dE_{(q, r)}(u', 0))`, defined for `|r| < ε(q)`, is an inner
  product on `T_q∂M` (positive definite because `dE_{(q, r)}` is injective) depending smoothly on
  `(q, r)` in the tube; for each `r` it is a Riemannian metric on the open set
  `{q ∈ ∂M : ε(q) > |r|}`, which is all of `∂M` when `ε` is constant and `|r| < ε`; and `h_0 = h`
  on all of `∂M`.
- `II = −½ ∂_r h_r |_{r=0}` at every `q ∈ ∂M`, the derivative taken in `r ∈ (−ε(q), ε(q))`.

**Checks.**

- Ball of radius `R > 0` centred at `0`: `E(q, r) = (1 − r/R) q`, `h_r = (1 − r/R)² h_0`,
  `−½ ∂_r h_r|₀ = h_0/R = II`.
- Exterior of the unit ball: `h_r = (1 + r)² h_0`, `II = −h_0`; half-space: `h_r = h_0`, `II = 0`.
- Dimension one: `∂M` is discrete, `h_r` is the zero metric on a point, and the statement reduces to
  `E* g = dr²`.
- Dimension two (`n = 1`), against the normal strips of RiemannianGeometry/Surfaces 1.2 with the
  inward normal, whose `t` is `r` here: in an arclength parameter `s` of `∂M`, Surfaces'
  normal-strip Jacobian `a(s, r)` gives `h_r = a(s, r)² ds²` and
  `II = −a_t(s, 0) ds² = k_g ds²`. Disc of radius `R`: `a = 1 − r/R`, `II = ds²/R`, `k_g = 1/R`.
  Cap `{φ ≤ φ₀}` of the unit sphere, `0 < φ₀ < π`, `φ` the polar angle from the pole:
  `a = sin(φ₀ − r)/sin φ₀`, `II = cot φ₀ · ds²`, which is 6.3's `cot R · h` at `R = φ₀`, and
  `k_g = cot φ₀`. Exponentiating along the outward normal instead gives `a = 1 + r/R` and
  `II = −ds²/R` on the disc, the value of the exterior, not of the disc.
- The tube radius is not a distance radius: in `ℝ²` with `ρ(x, y) = x(1 − x)`, `M = [0, 1] × ℝ`
  has the noncompact boundary `{0, 1} × ℝ`, and the radii `ε = 0.9` on `{x = 0}` and `ε = 0.01` on
  `{x = 1}` meet every conclusion of 4.3's tube statement: `E((0, y), r) = (r, y)` and
  `E((1, y), r) = (1 − r, y)` map onto the disjoint strips `(−0.9, 0.9) × ℝ` and
  `(0.99, 1.01) × ℝ`, `ρ(E(q, r)) = r(1 − r)` has the sign of `r`, and `dE(∂_r) = ±e₁` is a unit
  vector orthogonal to `e₂`. At `(0.8, 0)` the normal coordinate is `0.8`, but the segment to
  `(1, 0)` lies in `M` and gives `d_M((0.8, 0), ∂M) = 0.2`. With `η = 0.4` on `{x = 0}` and
  `η = 0.005` on `{x = 1}` the distance is `min(x, 1 − x) = r` on the smaller half-tube, which
  does not contain `(0.8, 0)`. Here `dE(∂_y) = e₂` on both lines, so `h_r = dy²` wherever it is
  defined, and `−½ ∂_r h_r|₀ = 0 = II`; but for `0.01 ≤ |r| < 0.9`, such as `r = 0.5`, the set
  `{q : ε(q) > |r|}` is `{0} × ℝ`, so `h_r` is a metric on that component only, not on all of
  `∂M`.

*Needs:* 1.4, 4.3; GeometricTopology 1.1 (smooth collars); Mathlib `SmoothPartitionOfUnity`.

### 4.5 Convexity functions near a strictly convex boundary point

Prove (Uhlmann–Vasy, Theorem on lines 30–32, construction on lines 504–524; Stefanov–Uhlmann–Vasy,
lines 128–134): let `ρ ∈ C^∞(N)` and `q ∈ N` with `ρ(q) = 0`, at which the level set of `−ρ` is
strictly concave from the superlevel sets (3.2, `IsStrictlyConcaveLevelSetAt`); for the regular
domain `M = {ρ ≥ 0}` and `q ∈ ∂M` this is strict convexity of `∂M` at `q` (3.2), and the statement
uses no regular-value hypothesis away from `q`. Then:

- There are an open `U₀ ∋ q` in `N` and `C₀, δ > 0` such that for `y ∈ U₀` and unit `v ∈ T_yN`,
  `|dρ(v)| < δ` implies `Hess ρ(v, v) ≤ −C₀`.
- There is (`exists_convexityFunction`) a convexity function at `q` for `ρ`, by which this
  roadmap means an open `U ∋ q` in `N`, a function `x̃ ∈ C^∞(U)` and `c₀ > 0` with `x̃(q) = 0`,
  `dx̃_q = −dρ_q`, `dx̃ ≠ 0` on `U`, the level sets of `x̃` strictly concave from the superlevel
  sets on `U` (3.2), and `K_c := {y ∈ U : x̃(y) ≥ −c, ρ(y) ≥ 0}` compact for every `0 ≤ c ≤ c₀`.
  In a chart `z` centred at `q`, `x̃ = −ρ − ε|z|²` works for every sufficiently small `ε > 0`.
- For `0 < c ≤ c₀`, `O_c := {x̃ > −c} ∩ M` is relatively open in `M` with closure in `K_c`.

**Checks.**

- Closed unit disc, `q = (0, −1)`, `ρ = 1 − |z|²`, `x̃ = |z|² − 1 − ε|z − q|²`: `Hess x̃ = (2 − 2ε) g`
  is positive for `ε < 1`, `dx̃_q = 2q = (0, −2) = −dρ_q`, and `K_c ⊆ {ε|z − q|² ≤ c}`.
- For the exterior of the unit disc the same formula gives `Hess x̃ = −(2 + 2ε) g`: the hypothesis
  of strict convexity at `q` is what makes the construction work.
- `−ρ` need not be a convexity function, and the term `−ε|z|²` is what makes `K_c` compact. On
  the Euclidean plane `N = ℝ²` take the parabola epigraph `M = {y ≥ x²}`, `ρ = y − x²` and
  `q = 0`: `dρ_q = dy`, `ker dρ_q = ℝ e_x` and `Hess(−ρ)(e_x, e_x) = 2 > 0`, so the hypothesis
  holds at `q`. For `x̃ = −ρ` and any open `U ∋ q`, `K_0 = U ∩ {y = x²}` is a nonempty open subset
  of the parabola, which is connected and not compact; a compact `K_0` would also be closed in the
  parabola, hence all of it, so no `U` and no `c₀` work. For `x̃ = −ρ − ε(x² + y²)` with
  `0 < ε ≤ 1/2`, `U` the open disc of radius `1/2` about `q` and `c₀ = ε/8`:
  `dx̃ = (2(1 − ε)x, −1 − 2εy) ≠ 0` on `U`, its kernel is spanned by `v = (1 + 2εy, 2(1 − ε)x)`
  with `Hess x̃(v, v) = 2(1 − ε)((1 + 2εy)² − 4ε(1 − ε)x²) > 0` on `U` (there
  `(1 + 2εy)² > 1/4 > 4ε(1 − ε)x²`), and on `{ρ ≥ 0}` the inequality `x̃ ≥ −c` gives
  `ε(x² + y²) ≤ c − ρ ≤ c`; so for `0 ≤ c ≤ c₀`, `K_c` is the closed set `{x̃ ≥ −c, ρ ≥ 0}` of
  `ℝ²`, inside the disc of radius `√(c/ε) ≤ 1/√8 < 1/2`, and compact.
- The open set `U` is part of the data: on the closed unit disc, `x̃ = −ρ = |z|² − 1` is a
  convexity function at `q = (0, −1)` with `U = ℝ² ∖ {0}` and `c₀ = 1/2`, since `dx̃ = 2z ≠ 0` on
  `U`, `Hess x̃ = 2g`, `dx̃_q = 2q = −dρ_q`, and `K_c = {1 − c ≤ |z|² ≤ 1}` is compact for
  `0 ≤ c ≤ 1/2` (the unit circle for `c = 0`). With `U` the open disc of radius `1/2` about `q`
  instead, `K_0` is an open arc of the circle and is not compact, so a failure for one `U` does not
  show that a function is not a convexity function.
- Dimension one, `M = [0, 1]`, `q = 0`, `ρ = x`: `ker dx̃ = 0`, concavity is vacuous, `x̃ = −x − εx²`,
  and `K_c = {x ∈ [0, 1] : x + εx² ≤ c}` is a compact interval.

*Needs:* 2.1, 2.2, 3.1, 3.2; Tau Ceti `TauCeti.Manifold.hessian`.

### 4.6 Slight enlargements of a strictly convex domain

Prove (Paternain–Salo–Uhlmann, lines 3093–3096): if `∂M` is compact and strictly convex and `ρ̂`
is the normalised defining function of 4.3, with constant tube radii `ε₁ < ε` there, there is
`δ₀` with `0 < δ₀ < min(ε₁, 1)` such that for `0 < δ ≤ δ₀`: `M_δ := {ρ̂ ≥ −δ}` equals
`M ∪ E_{∂M}(∂M × [−δ, 0))`, `−δ` is a regular value of `ρ̂`, `M_δ` is a regular domain with
strictly convex boundary `E_{∂M}(∂M × {−δ})`, `M ⊆ int M_δ`, and `M_δ` is compact if `M` is.
Route: by 4.3 a point of `M_δ ∖ M` lies in `W` with `r_{∂M} ≥ −δ > −ε₁`, hence in `W₁`, where
`ρ̂ = r_{∂M}`; so `M_δ = M ∪ E_{∂M}(∂M × [−δ, 0))`, `dρ̂ = dr_{∂M} ≠ 0` on `{ρ̂ = −δ}`, and with
the defining function `ρ̂ + δ` of `M_δ`, for which `|d(ρ̂ + δ)| = 1`, 3.1 gives
`II_{M_δ} = −Hess r_{∂M}` on the tangent spaces of `E_{∂M}(∂M × {−δ})`. On the level `r = 0` this
is `II_{∂M} ≥ c h` (2.3); `Hess r_{∂M}` is continuous on the compact set `E_{∂M}(∂M × [−ε₁/2, 0])`,
over which the unit tangent vectors of the level sets of `r_{∂M}` form a compact set, so
`−Hess r_{∂M} > 0` on those vectors for `−δ₀ ≤ r ≤ 0` and some `0 < δ₀ < min(ε₁/2, 1)`, which is
3.2 for `x = −ρ̂`. `M_δ = M ∪ E_{∂M}(∂M × [−δ, 0])` is a union of two compact sets when `M` is
compact, and `M ⊆ {ρ̂ > −δ} = int M_δ`.

**Checks.**

- Unit ball with tube radius `ε = 1/2` and `ε₁ = 1/4`, so that `ρ̂ = 1 − |x|` on
  `3/4 < |x| < 5/4`: for `0 < δ < 1/4`, `M_δ` is the ball of radius `1 + δ < 5/4` with
  `II = h/(1 + δ)`; between `|x| = 5/4` and `3/2` the value `ρ̂` lies between `1 − |x| ≤ −1/4`
  and `−1`, so it is below `−δ` there.
- Spherical cap of radius `0 < R < π/2` in the unit sphere `S^{n+1}`, `n ≥ 1` (6.3): `M_δ` is the
  cap of radius `R + δ`, strictly convex iff `R + δ < π/2`, so `δ₀ < π/2 − R` and `δ₀` depends on the
  domain. For `n = 0` every arc `M_δ` of `S¹` has strictly convex boundary (vacuously), and `δ₀` is
  limited only by `min(ε₁, 1)`; the tube condition alone forces `ε₁ < π − R`, so `M_δ` stays a
  proper arc.
- For `n ≥ 1` the half-space is not strictly convex and every `M_δ` is a flat half-space: the
  hypothesis is needed for the conclusion.
- The normalisation of `ρ̂` off the tube is needed: on `ℝ²`, `ρ(x) = (1 − |x|²) e^{−|x|²}` has `0`
  as a regular value (its radial derivative at `|x| = 1` is `−2/e`) and `M = {ρ ≥ 0}` is the closed
  unit disc; a smooth function equal to `r_{∂M}` near the circle and to `ρ` for `|x| ≥ 5/4` has
  every property of 4.3's `ρ̂` except the normalisation, but `ρ` attains its minimum `−e^{−2}` at
  `|x| = √2` and tends to `0` from below, so for `0 < δ < e^{−2}` the set `{ρ ≥ −δ}` contains an
  unbounded exterior `{|x| ≥ r₂}` with `r₂ > √2`, whose boundary circle has `II = −h/r₂ < 0`, and
  `−e^{−2}` is a critical value: no `δ₀` works for that function.

*Needs:* 1.3, 1.4, 2.1, 2.3, 3.1, 3.2, 4.3.

### Examples

The ball, its exterior and the half-space for second-order contact and Fermi coordinates; the
strip `[0, 1] × ℝ` with unequal tube radii (normal coordinate versus distance to `∂M`); the
quartic `{y ≥ x⁴}` for leaving without strict convexity; the disc and the parabola epigraph
`{y ≥ x²}` for the convexity function `x̃`; spherical caps in `S^{n+1}`, `n ≥ 1`, for enlargements.

### Dependencies

4.1 uses 3.1, 3.5, HopfRinow Layer 1 and Tau Ceti's geodesics under Riemannian isometries; 4.2 uses
1.1, 1.3–1.4, 2.1–2.2, 3.1, 4.1 and HopfRinow Layer 1; 4.3 uses 1.3, 3.1, HopfRinow Layers 1–2,
RiemannianGeometry R7.9 (the compact connected case) and Tau Ceti's normal exponential; 4.4 uses
1.4, 4.3, GeometricTopology 1.1 (smooth collars) and Mathlib's partitions of unity; 4.5 uses 2.1–2.2
and 3.1–3.2; 4.6 uses 1.3–1.4, 2.1, 2.3, 3.1–3.2 and 4.3.

## Layer 5: Exit time and scattering relation

The definitions of this layer (`IsGlancing`, `exitTime`, `IsNonTrapping`, `geodesicEndpoint`,
`scatteringRelation`) are intrinsic to `(M, g)`: they are made on its tangent bundle `TM`, with the
geodesics of `(M, g)` itself. The constructions and routes realise `M` as a regular domain
`M = {ρ ≥ 0}` of a Hausdorff second-countable boundaryless `(N, g)` (3.5), and throughout the
layer `M` is such a domain, with `TM` identified through `dj` with the part of `TN` over `M`. For
compact `M` the realisation needs only the Hausdorff property, a compact manifold being second
countable, so each theorem of 5.4–5.6 also holds, read on `TM` as in the Conventions, for every
compact Hausdorff `(M, g)` of the Conventions; that intrinsic reading is stated with each of them.

### 5.1 Unit sphere bundles and boundary strata

Define `SN := {(x, v) ∈ TN : |v| = 1}` with Tau Ceti's sphere-bundle structure for the constant
radius `1` (`TauCeti.sphereBundleChartedSpace`, `TauCeti.isManifold_sphereBundle`), a boundaryless
manifold of dimension `2n + 1` with projection `π`; `SM := π⁻¹(M)`, `∂SM := π⁻¹(∂M)`,
`∂±SM := {(x, v) ∈ ∂SM : ±⟨v, ν_in(x)⟩ ≥ 0}`, `∂₀SM := ∂₊SM ∩ ∂₋SM`, and
`μ(x, v) := ⟨v, ν_in(x)⟩` on `∂SM` (Paternain–Salo–Uhlmann, lines 2646–2648, 2682–2696 and 2931).
Intrinsically, `SM` is the set of unit vectors of `TM` and `∂SM` the set of those based on `∂M`;
`dj` identifies them with `π⁻¹(M)` and `π⁻¹(∂M)`. A tangent vector `(x, v) ∈ TM` is glancing
(`IsGlancing`) if `x ∈ ∂M` and `v ∈ T_x∂M`; `∂₀SM` is the set of glancing unit vectors. Prove:

- `0` is a regular value of `ρ ∘ π` on `SN`; `SM` is a regular domain of `SN` with boundary `∂SM`,
  and `∂SM` is a closed embedded boundaryless submanifold of `SN`, compact if `M` is.
- `∂₊SM ∪ ∂₋SM = ∂SM` and `∂₀SM = {μ = 0}` is the set of unit vectors tangent to `∂M`; for `n ≥ 1`,
  `0` is a regular value of `μ` on `∂SM`, so `∂₀SM` is a closed hypersurface of `∂SM`.
- The geodesic flow `φ_t` of `N` preserves `SN` and is a smooth local flow on it (global if `N` is
  compact); its generator `X` is a smooth vector field on `SN`, acting on `ũ ∈ C^∞(SN)` by
  `Xũ(z) = d/dt ũ(φ_t z)|_{t=0}` (Paternain–Salo–Uhlmann, lines 3063–3079).
- `X` restricts to `SM`: for `z ∈ SM`, `X(z) ∈ T_z SN = dj(T_z SM)`, where `j : SM → SN` is the
  inclusion (the first item of 3.1, which uses no metric, for the regular domain `SM` of `SN`), so
  `X` is a smooth vector field on the manifold with boundary `SM`, and `Xu := du(X)` for
  `u ∈ C^∞(SM)`. For `z ∈ SM`, `Xu(z) = d/dt ũ(φ_t z)|_{t=0}` for every smooth `ũ` on an open
  neighbourhood of `z` in `SN` that agrees with `u` on `SM`, and `Xu(z)` is the one-sided
  derivative at `0` of `t ↦ u(φ_t z)` whenever `φ_t z ∈ SM` for all `t` in `[0, δ)` or in `(−δ, 0]`
  for some `δ > 0` (chain rule within the half-space). At a glancing point `φ_t z` can leave `SM`
  for every `t ≠ 0`, so `Xu` is not the derivative of `u` along the flow inside `SM` there.
- On `TM` of `M` itself the generator is Tau Ceti's geodesic spray
  `TauCeti.Manifold.geodesicSpray` of `(M, g)`, defined at boundary points: through `dj` it is the
  restriction of the spray of `N`, it is tangent to `SM`, and `Xu(z) = du_z(X(z))` for `u` smooth
  on `TM`, which on `SM` depends only on `u|SM`.
- The glancing set is closed in `TM`, and `IsGlancing` is natural under isometries of manifolds
  with boundary.

**Checks.**

- Closed unit disc: `∂SM` is a torus, `∂₀SM` is two circles (the two unit tangents at each boundary
  point), `∂₊SM` is a closed annulus; at `x = (0, −1)`, `(0, 1) ∈ ∂₊SM` and `(1, 0) ∈ ∂₀SM`.
- Dimension one, `M = [a, b]`: `∂SM` has four points, `μ = ±1` on them, and `∂₀SM = ∅`; the
  glancing vectors of `TM` are exactly the zero vectors at `a` and `b`. The zero vector at a
  boundary point is glancing in every dimension (`0 ∈ T_x∂M`); it is the unit-length condition
  that keeps it out of `∂₀SM`, and a definition of glancing by `μ = 0` on all of `TM` would also
  call every interior vector glancing, `μ` being defined only over `∂M`.
- The generator at a glancing point of the closed unit disc in `N = ℝ²`,
  `z = ((0, −1), (1, 0)) ∈ ∂₀SM`: `φ_t z = ((t, −1), (1, 0))` and `|(t, −1)|² = 1 + t² > 1` for
  `t ≠ 0`, so `φ_t z ∉ SM` for every `t ≠ 0` and `t ↦ u(φ_t z)` is defined only at `t = 0`. For
  `u = σ` of 5.4, which 6.1's exit time gives as `−2⟨x, v⟩` on `SM`, the extension
  `σ̃(x, v) = −2⟨x, v⟩` to `SN` has `σ̃(φ_t z) = −2t`, so `Xσ(z) = −2`, as 5.4 states; a definition
  of `Xu` as a derivative of `u` along the flow inside `SM` gives no value at this `z`.
- Stefanov–Uhlmann–Vasy label the vectors pointing outside `∂₊SM` (line 151): they lie in this
  roadmap's `∂₋SM`, and their scattering relation `L : ∂₋SM → ∂₊SM` (line 153), from inward to
  outward vectors, is the restriction of `α` (5.6) to this roadmap's `∂₊SM`.

*Needs:* 1.1, 1.2, 3.1, 3.5; HopfRinow Layer 1; Tau Ceti `TauCeti.Manifold.geodesicSpray`,
`TauCeti.sphereBundleChartedSpace`,
`TauCeti.isManifold_sphereBundle`, `TauCeti.isSmoothEmbedding_coe_sphereBundle`,
`TauCeti.scalarRegularSublevelChartedSpace`, `TauCeti.regularLevelChartedSpace`,
`TauCeti.Manifold.exists_contMDiffAt_localGeodesicFlow`,
`TauCeti.Manifold.contMDiffOn_maximalGeodesic`,
`TauCeti.Manifold.isGeodesicallyCompleteAt_of_compactSpace`.

### 5.2 Exit time and non-trapping

Define the exit time intrinsically (`exitTime`): for `x ∈ M` and `v ∈ T_xM`,

    τ(x, v) := sup {T > 0 : some geodesic γ of M on [0, T] has γ(0) = x, γ'(0) = v} ∈ [0, ∞],

with `sup ∅ = 0`, the velocity at `0` being the one-sided derivative; `M` is non-trapping
(`IsNonTrapping`) if `τ(x, v) < ∞` for every unit `(x, v)`
(Paternain–Salo–Uhlmann, Definitions 3.1.1 and 3.1.3, lines 2659–2661 and 2674–2676). Prove:

- Realisation formula: `τ(x, v)` is the supremum of the `T ≥ 0` such that `[0, T]` lies in the
  maximal interval of the `N`-geodesic from `(x, v)` and that geodesic maps `[0, T]` into `M`; hence
  `τ` does not depend on `N` (4.1).
- Homogeneity: `τ(x, λ v) = τ(x, v)/λ` for `λ > 0`; `τ(x, 0) = ∞`.
- `τ(x, v) > 0` if `x ∈ int M` or `v` is inward; `τ = 0` on outward vectors at boundary points;
  `τ = 0` on `∂₀S_qM` if `∂M` is strictly convex at `q` (4.2), so then `τ = 0` on `∂₋S_qM`.
- If `M` is compact, `(x, v) ∈ SM` (so `v` is a unit vector, as `μ` and `φ_t` require) and
  `τ(x, v) < ∞`, the geodesic extends to `[0, τ(x, v)]`, ends on `∂M`, and `μ(φ_τ(x, v)) ≤ 0`; for
  `0 ≤ t ≤ τ(x, v)`, with `(y, w) = φ_t(x, v) ∈ SM`, `τ(y, w) = τ(x, v) − t` and
  `τ(y, −w) = τ(x, −v) + t` (reversal of geodesics).
- A nonempty compact `M` with empty boundary is trapped (`τ ≡ ∞`).

**Checks.**

- Closed unit disc at `x = (0, −1)`: `τ(x, (cos θ, sin θ)) = 2 sin θ` on `[0, π]` and `0` on
  `[−π, 0]` (Paternain–Salo–Uhlmann, Example 3.2.1, lines 2849–2861), from 6.1's formula.
- Closed annulus `1 ≤ |x| ≤ 2` in `ℝ²` (concave inner boundary): at `x = (−3/2, −1)`, `v = e₁` the line
  touches the inner circle at `(0, −1)` from `M` and continues, `τ = 3/2 + √3`; starting from
  `(−3/2, −1 + δ)` it hits the inner circle at time `3/2 − √(2δ − δ²)` → `3/2`, so `τ` is
  discontinuous (Paternain–Salo–Uhlmann, Exercise 3.1.2(b), line 2666).
- The half-space: `τ = ∞` on tangent vectors, which give lines in `∂M`; `M = [a, b]`:
  `τ(x, +1) = b − x`.

*Needs:* 2.1, 4.1, 4.2, 5.1; Tau Ceti `TauCeti.Manifold.IsGeodesicCurveOnFrom`,
`TauCeti.Manifold.geodesicInterval`, `TauCeti.Manifold.maximalGeodesic`.

### 5.3 Two lemmas of calculus

Prove the fold normal form (Paternain–Salo–Uhlmann, Lemma 3.2.10, lines 2970–2982, proof lines
2985–3026): consider a smooth function `h(t, y)` on a neighbourhood of `(0, y₀)` in `ℝ × ℝ^K` with
`h(0, y₀) = 0`, `∂_t h(0, y₀) = 0` and `∂_t² h(0, y₀) < 0`. Then there are smooth `Q` near `(0, y₀)`
in `ℝ × ℝ^K` and `a` near `y₀` such that `a(y) ≥ 0` whenever `h(0, y) ≥ 0`, `∂_r Q(0, y₀) > 0`, and
for `(t, y)` near `(0, y₀)` with `h(0, y) ≥ 0`: `h(t, y) = 0` iff `t = Q(√a(y), y)` or
`t = Q(−√a(y), y)`; moreover `Q(√a(y), y) ≥ Q(−√a(y), y)`. Route: the implicit function theorem for
`∂_t h = 0` gives a smooth critical time `g(y)` near `y₀` with `g(y₀) = 0`. The family
`k(y, s) := h(s + g(y), y)`, made a smooth function on all of `ℝ^K × ℝ` by a cutoff equal to `1`
near `(y₀, 0)`, has `∂_s k(y, 0) = 0` for `y` near `y₀` and `∂_s² k(y₀, 0) = ∂_t² h(0, y₀) < 0`, so
Tau Ceti's parametric Morse lemma `TauCeti.exists_parametric_morse_chart` (base `ℝ^K`, fibre `ℝ`)
gives a chart `ψ(y, s) = (y, ϑ(y, s))` near `(y₀, 0)`, smooth with smooth inverse and fixing the
zero section, with `k(y, s) = k(y, 0) − c(y) ϑ(y, s)²` for `c(y) := −½ ∂_s² k(y, 0)`, positive near
`y₀`; `∂_s ϑ(y₀, 0) ≠ 0` because `ψ` has a smooth inverse, and replacing `ϑ` by `−ϑ` if necessary it
is positive. Set `a(y) := k(y, 0) = h(g(y), y)` and `Q(r, y) := g(y) + s₁`, where
`ψ⁻¹(y, r/√c(y)) = (y, s₁)`. Then `h(t, y) = 0` iff `ϑ(y, t − g(y)) = ±√(a(y)/c(y))`, `h(0, y) ≥ 0`
gives `a(y) ≥ c(y) ϑ(y, −g(y))² ≥ 0`, and `Q` is increasing in `r`, with
`∂_r Q(0, y₀) = 1/(√c(y₀) ∂_s ϑ(y₀, 0)) > 0`.

Prove the even-function lemma (Paternain–Salo–Uhlmann, Exercise 3.2.12, lines 3044–3045, used with
parameters on lines 3039–3041): if `f(r, y)` is smooth near `(0, y₀)` in `ℝ × ℝ^K` and
`f(−r, y) = f(r, y)`, there is `H` smooth near `(0, y₀)` with `f(r, y) = H(r², y)`. Route: `∂_r f` is
odd, hence `r` times a smooth even function (Hadamard division); induction shows that
`s ↦ f(√s, y)` has all `s`-derivatives continuous up to `s = 0`; extend across `s = 0` by the
half-space Seeley extension.

**Checks.**

- `h(t, y) = y − t²` (`K = 1`, `y₀ = 0`): `Q(r, y) = r`, `a(y) = y`, roots `±√y`. For `h = y − t⁴` the
  second derivative vanishes and the roots `±y^{1/4}` admit no such `Q`, `a`.
- `f(r) = cos r` gives `H(s) = Σ_k (−s)^k/(2k)!`; `f(r) = r²` gives `H(s) = s`; `f(r) = |r|` is even
  but not smooth and is excluded.
- `K = 0` (no parameters) is allowed in both lemmas.

*Needs:* Mathlib `ContDiffAt.implicitFunction`, `ContDiffAt.contDiffAt_implicitFunction`; Tau Ceti
`TauCeti.exists_parametric_morse_chart`, `ContDiff.sub_eq_hadamardFactor_apply`,
`ContDiff.contDiff_hadamardFactor`, `TauCeti.contDiff_intervalIntegral`; ComplexKahlerGeometry K5a
(extension across a smooth boundary: the half-space Seeley extension).

### 5.4 Regularity of the exit time

Assume `M` compact, `∂M` strictly convex and `M` non-trapping. Prove (Paternain–Salo–Uhlmann, Lemma
3.2.3, lines 2865–2886; Lemma 3.2.6, lines 2896–2925; Lemma 3.2.8, lines 2935–2949; Lemma 3.2.9,
lines 2955–2966; Lemma 3.2.11, lines 3027–3043; Remark 3.2.13, lines 3046–3055; Exercise 3.3.3,
lines 3110–3113):

- Fold form (Lemma 3.2.9, which needs only `M` compact and `∂M` strictly convex near the base point
  of `z₀`, not non-trapping): near every `z₀ ∈ ∂₀SM`, on `SM`, `τ(x, v) = Q(√a(x, v), x, v)` and
  `−τ(x, −v) = Q(−√a(x, v), x, v)` with `Q`, `a` smooth and `a ≥ 0` on `SM`. Route: 5.3's fold
  normal form for `h(t, y) = ρ(γ_y(t))`, smooth near `(0, z₀)` by the smooth flow of 5.1, with
  `h = ∂_t h = 0` and `∂_t² h = −|dρ_{x₀}| II_{x₀}(v₀, v₀) < 0` at `(0, z₀)`, `z₀ = (x₀, v₀)`
  (4.2). For `y ∈ SM` near `z₀`, `h(·, y)` is concave near `0` and `h(0, y) ≥ 0`, so `0` lies
  between its two roots, `h ≥ 0` between them and `h < 0` just beyond; the realisation formula of
  5.2 then gives `τ(y)` as the larger root, and `γ_{x, −v}(t) = γ_{x, v}(−t)` gives `−τ(x, −v)`
  as the smaller. Continuity of `τ` is not used.
- `τ` is smooth on `SM ∖ ∂₀SM`: every `z ∈ SM ∖ ∂₀SM` has an open neighbourhood in `SN` and a
  smooth function on it agreeing with `τ` on `SM`. For such `z`, `μ(φ_{τ(z)} z) < 0`: the exit is
  transversal. Route: no interior tangency (4.2) keeps nearby geodesics in `int M` away from the
  endpoints, and the implicit function theorem applies to `h(t, y) = ρ(γ_y(t))` at the transversal
  exit, so the root it produces is the exit time of every nearby `y`.
- `τ` is continuous on `SM` (Exercise 3.2.4, lines 2868 and 2891, which the source leaves to the
  reader): off `∂₀SM` by the previous item, and at `∂₀SM` by the fold form above, where
  `τ = Q(√a, ·)` with `Q(0, z₀) = 0`.
- The odd extension `τ̃ : ∂SM → ℝ`, `τ̃ = τ` on `∂₊SM` and `τ̃(x, v) = −τ(x, −v)` on `∂₋SM` (both
  are `0` on `∂₀SM`), is smooth on the manifold `∂SM`, and `τ̃ = 0` exactly on `∂₀SM`.
- On `∂SM ∖ ∂₀SM`, where `τ̃ ≠ 0` and `μ` and `τ̃` have the same sign, the quotient `μ/τ̃` is the
  restriction of a smooth function on all of `∂SM`; that function is everywhere positive and
  takes the value `II_q(u, u)/2` at each glancing `(q, dι u)`.
- `σ := τ(x, v) − τ(x, −v)` and `T := τ(x, v) τ(x, −v)` are smooth on the manifold with boundary
  `SM`, `σ = τ̃` on `∂SM`, and `τ = (σ + √(σ² + 4T))/2`, the nonnegative root of
  `τ² − σ τ − T = 0`.
- `Xσ = −2` on `SM`, with `X` acting on `C^∞(SM)` as in 5.1. Route: for `z ∈ int SM`,
  `τ(z) > 0` and `σ(φ_t z) = σ(z) − 2t` for `0 ≤ t ≤ τ(z)` by the flow identities of 5.2, so
  `Xσ(z) = −2`; `Xσ` is continuous on `SM` and `int SM` is dense in `SM`, so `Xσ = −2` at the
  boundary points too, glancing ones included.
- Intrinsic reading on `TM`, for every compact Hausdorff `(M, g)` with strictly convex boundary
  that is non-trapping: `τ` is smooth on the open set of nonzero tangent vectors that are not
  glancing, and continuous on the nonzero tangent vectors (`contMDiffOn_exitTime`); by the
  homogeneity of 5.2 this is the smoothness of `τ` on `SM ∖ ∂₀SM` and its continuity on `SM`. And
  there is a smooth `F` on `TM` equal to `σ` on `SM` with `XF = −2` on `SM`, `X` the geodesic spray
  of 5.1 (`exists_contMDiff_eq_exitTime_sub_exitTime_neg`); its restriction to `∂SM` is `τ̃`.
  Likewise there is a smooth `G` on `TM` equal to `T` on `SM`
  (`exists_contMDiff_eq_exitTime_mul_exitTime_neg`); with `F` it gives `τ = (F + √(F² + 4G))/2`
  on `SM`.

**Checks.**

- Closed unit disc at `x = (0, −1)`: `τ̃(x, v_θ) = 2 sin θ` for all `θ`, smooth, while `τ|∂SM` has
  one-sided derivatives `2` and `0` at `θ = 0`; `μ/τ̃ = sin θ/(2 sin θ) = 1/2 = II(v, v)/2`.
- Closed unit ball, for `(x, v) ∈ SM`: `τ(x, v) − τ(x, −v) = −2⟨x, v⟩`,
  `τ(x, v) τ(x, −v) = 1 − |x|²`, both smooth, and `d/dt(−2⟨x + tv, v⟩) = −2|v|² = −2`; Remark
  3.2.13's formula returns 6.1's unit-speed `τ`.
- `M = [a, b]`: `τ(x, 1) − τ(x, −1) = a + b − 2x` and `X = d/dx` along the flow gives `−2`;
  `τ(x, 1) τ(x, −1) = (b − x)(x − a)` is smooth and vanishes at both endpoints, as `T` does on all
  of `∂SM` when `∂M` is strictly convex (there one of `τ(x, ±v)` is `0`, by 5.2); since
  `σ² + 4T = (b − a)²`, Remark 3.2.13's formula gives `((a + b − 2x) + (b − a))/2 = b − x`,
  which is `τ(x, 1)`.
- Fold form on the closed unit ball (Remark 3.2.13), on `SM`: `a = 4(⟨x, v⟩² + 1 − |x|²)` and
  `Q(r, x, v) = (−2⟨x, v⟩ + r)/2`, so `Q(√a) = τ(x, v)` and `Q(−√a) = −τ(x, −v)`.

*Needs:* 1.4, 2.1, 3.5, 4.2, 5.1, 5.2, 5.3; Mathlib `ContDiffAt.implicitFunction`,
`ContDiffAt.contDiffAt_implicitFunction`; Tau Ceti `TauCeti.Manifold.contMDiffOn_maximalGeodesic`.

### 5.5 Non-trapping criteria

Prove (Paternain–Salo–Uhlmann, Proposition 3.3.1, lines 3081–3106):

- For compact `M` (no convexity assumption): if some `f ∈ C^∞(SM)` has `Xf > 0` on `SM`, then `M` is
  non-trapping, and every `(x, v) ∈ SM` satisfies
  `τ(x, v) ≤ (max_SM f − min_SM f)/min_SM Xf`; the extrema exist because `SM` is compact and
  contains `(x, v)`, and when `SM` is empty there is no point to bound.
- Hessian criterion: for compact `M`, if `u` is smooth on an open neighbourhood of `M` in `N` and
  `Hess u` is positive definite at every point of `M`, then `M` is non-trapping (apply the first
  item to `f(x, v) = du_x(v)`, for which `Xf(x, v) = Hess u(v, v)`).
- For compact `M` with strictly convex boundary the following are equivalent: `M` is non-trapping;
  `X : C^∞(SM) → C^∞(SM)` is surjective; some `f ∈ C^∞(SM)` has `Xf > 0`. Read on `TM`, for every
  compact Hausdorff `(M, g)` with strictly convex boundary (`isNonTrapping_tfae`): `M` is
  non-trapping; every smooth `h` on `TM` agrees on `SM` with `Xu` for some smooth `u` on `TM`; some
  smooth `f` on `TM` has `Xf > 0` on `SM`. The two readings agree because `X` is tangent to `SM` and
  every smooth function on `SM` is the restriction of a smooth function on `TM` (3.4 for the
  regular domain `SM` of `SN`, then extension along the rays of `TN` off `SN` and a cutoff
  vanishing near the zero section). Route: `f = −σ` has
  `Xf = 2` by 5.4; for surjectivity, extend `f` and the given `h ∈ C^∞(SM)` to a neighbourhood of
  `SM` in `SN` (3.4 for the regular domain `SM`), so that `Xf > 0` on `SM_δ` and `M_δ` is
  non-trapping with strictly convex boundary for small `δ` (4.6), and set
  `u = −∫_0^{τ_δ} h ∘ φ_t dt` with `τ_δ` the exit time of `M_δ`, smooth on `SM` by 5.4 since
  `SM ∩ ∂₀SM_δ = ∅`; then `Xu = h`.

**Checks.**

- Closed unit ball with `u = |x|²/2`: `f(x, v) = ⟨x, v⟩`, `Xf = |v|² = 1` on `SM`, and the bound
  gives `τ(x, v) ≤ (1 − (−1))/1 = 2` for `(x, v) ∈ SM`, the diameter, attained by diameters.
- A nonempty compact manifold without boundary (the boundary condition is vacuous): `SM` is
  nonempty and compact, and all three conditions fail: `Xf` vanishes at a maximum of `f` on `SM`,
  the constant `1` is therefore not of the form `Xu`, and `τ ≡ ∞` on `SM`.
- The empty regular domain (`N = ℝ²`, `ρ ≡ −1`, for which `0` is a regular value with empty fibre):
  `M = ∅` is compact with vacuously strictly convex boundary, `SM = ∅`, `M` is non-trapping,
  `C^∞(SM)` is a single point on which `X` is surjective, and `Xf > 0` holds vacuously: all three
  conditions hold, as the equivalence requires, so emptiness is not excluded from it and the
  closed-manifold Check above needs `M ≠ ∅`.
- The hemisphere of `S^{n+1}`, `n ≥ 1` (6.3 with `R = π/2`): a great circle in its boundary is a
  geodesic of `M`, so it is trapped, and `II = 0` there; the strict convexity hypothesis is not met.
  For `n = 0` the closed half-circle has strictly convex boundary (vacuously) and is non-trapping,
  with `τ(θ, ±1) = π/2 ∓ θ`, so all three conditions hold, as the equivalence requires.
- Strict convexity of the boundary alone does not give non-trapping: on the closed unit ball with
  `e^{2φ(|x|²)} g_eucl`, `φ(s) = s² − 2s`, `n ≥ 1`, the boundary is strictly convex and the sphere
  `|x| = 1/√2` is totally geodesic, so its great circles are trapped geodesics (6.5).

*Needs:* 2.1, 3.4, 3.5, 4.2, 4.6, 5.1, 5.2, 5.4.

### 5.6 The scattering relation and boundary lens data

Assume `M` compact, `∂M` strictly convex and `M` non-trapping. Define the scattering relation
`α : ∂SM → ∂SM`, `α(z) := φ_{τ̃(z)}(z)`, equivalently `(γ_z(τ̃(z)), γ_z'(τ̃(z)))` with `γ_z` the
geodesic of `M` (Paternain–Salo–Uhlmann, Definition 3.3.4, lines 3114–3117). Intrinsically:
for `z ∈ TM` and `T ∈ ℝ` let `geodesicEndpoint z T` be the endpoint `(γ(T), γ'(T))` of a geodesic
`γ` of `(M, g)` on `[0, T]` issuing from `z`, which, `M` being Hausdorff, does not depend on the
choice of `γ` (4.1), and `z` itself when there is none; then `α(z)` (`scatteringRelation`) is
`geodesicEndpoint z τ(z)` when `0 < τ(z) < ∞`, and otherwise `(y, −w)` for `(y, w) = geodesicEndpoint (x, −v) T′`, `z = (x, v)`,
where `T′ = τ(x, −v)` when that is finite and `T′ = 0` when it is infinite.
On `∂SM` this is `φ_{τ̃(z)}(z)`: inward vectors follow their geodesic to its exit, outward vectors
follow theirs backwards to its entry, and glancing vectors, with `τ = 0` in both directions, are
fixed. Define the tangential
projection `P(x, v) := v − μ(x, v) ν_in(x) ∈ T_x∂M` on `∂SM`, and the boundary lens data
`L := P ∘ α ∘ (P|_{∂₊SM})⁻¹` and `ℓ := τ ∘ (P|_{∂₊SM})⁻¹` on the closed unit ball bundle `B∂M` of
`(∂M, h)` (Stefanov–Uhlmann–Vasy, lines 150–163, with their `∂±` interchanged).

- For Hausdorff `M`, `geodesicEndpoint z T` is `(γ(T), γ'(T))` for every geodesic `γ` of `(M, g)`
  on `[0, T]` issuing from `z`; on a regular domain, for `T > 0`, it is `φ_T(z)` whenever `φ_t z` is
  defined for `t ∈ [0, T]` and `t ↦ π(φ_t z)` maps `[0, T]` into `M`; for `T ≤ 0` it is `z`, since
  no geodesic is defined on the empty set `[0, T]`, `T < 0`, or on `{0}`, which carries no
  derivative.
- `α` is a diffeomorphism of `∂SM`, `α ∘ α = id`, `α(∂±SM) = ∂∓SM`, the fixed-point set of `α` is
  exactly `∂₀SM`, and `τ̃ ∘ α = −τ̃` (Lemma 3.3.5 and Exercise 3.3.6, lines 3118–3127). Read on
  `TM`, for every compact Hausdorff non-trapping `(M, g)` with strictly convex boundary and
  `z ∈ ∂SM` (`scatteringRelation_involutive`): `α(z) ∈ ∂SM`, `α(α(z)) = z`, `α(z) = z` exactly
  when `z` is glancing, and for non-glancing `z`, `α(z)` is outward exactly when `z` is not; and
  near every point of `∂SM`, `α` is the restriction to `∂SM` of a smooth map from an open subset of
  `TM` to `TM` (`exists_contMDiffOn_eq_scatteringRelation`).
- `α` does not depend on the realisation `N` (4.1).
- `P` restricts to homeomorphisms `∂±SM → B∂M`, with inverse `w ↦ w ± √(1 − |w|²) ν_in`, and to
  diffeomorphisms of `∂±SM ∖ ∂₀SM` onto the open unit ball bundle.
- `L` and `ℓ` are intrinsic to `(M, g)`; two metrics on `M` with the same induced metric `h` have
  lens data on the same `B∂M`, so equality of their lens data is a statement about maps
  `B∂M → B∂M` and `B∂M → [0, ∞)`.

**Checks.**

- Closed unit ball: `α(x, v) = (x − 2⟨x, v⟩ v, v)`; applying it twice returns `(x, v)` since
  `⟨x − 2⟨x, v⟩v, v⟩ = −⟨x, v⟩`; the fixed points are `⟨x, v⟩ = 0`, the glancing set.
- Closed unit disc: `|L(x, w)| = |w|` (equal angles at entry and exit) and `ℓ(x, w) = 2√(1 − |w|²)`.
- Lens data on the closed unit disc at `x = (0, −1)`, where `ν_in(x) = (0, 1)`, for `w = (c, 0)`,
  `|c| ≤ 1`: the lift through `∂₊SM` is `v = (c, √(1 − c²))`, with `⟨x, v⟩ = −√(1 − c²)`, so
  `τ(x, v) = 2√(1 − c²)` and the exit point is `y = (2c√(1 − c²), 1 − 2c²)`, of norm one. There
  `ν_in(y) = −y` and `⟨v, y⟩ = √(1 − c²)`, so `L(x, w) = (y, v − ⟨v, y⟩ y)` with
  `v − ⟨v, y⟩ y = (c(2c² − 1), 2c²√(1 − c²))`, whose squared norm is
  `c²(2c² − 1)² + 4c⁴(1 − c²) = c²`. At `c = 0`, `L(x, 0) = ((0, 1), 0)` and `ℓ = 2`; at `|c| = 1`
  the lift is the glancing `w` itself, fixed by `α`, so `L(x, w) = (x, w)` and `ℓ = 0`. Lifting
  through `∂₋SM` instead, `w − √(1 − c²) ν_in = (c, −√(1 − c²))` is outward for `|c| < 1`, with
  `τ = 0`, and would give `ℓ ≡ 0` rather than `2√(1 − c²)`.
- Lens data in dimension one, `M = [a, b]`: `B∂M` consists of the two zero vectors,
  `(P|_{∂₊SM})⁻¹(a, 0) = (a, +1)` and `(P|_{∂₊SM})⁻¹(b, 0) = (b, −1)`; then
  `α(a, +1) = (b, +1)`, `α(b, −1) = (a, −1)`, and `P` sends both images to zero vectors, so
  `L(a, 0) = (b, 0)`, `L(b, 0) = (a, 0)` and `ℓ = b − a` at both points.
- Ball of radius `R > 0` centred at `0`, `x` on its boundary sphere, `ν_in(x) = −x/R`: the lift of
  `w ∈ B∂M` is `v = w − √(1 − |w|²) x/R`, with `⟨x, v⟩ = −R√(1 − |w|²)`, so
  `ℓ(x, w) = 2R√(1 − |w|²)` and `ℓ(x, 0) = 2R`, the diameter; the unit-disc formula
  `2√(1 − |w|²)` is wrong for `R ≠ 1`.
- `M = [a, b]`: `α(a, +1) = (b, +1)` with `τ̃ = b − a`, `α(b, +1) = (a, +1)` with `τ̃ = −(b − a)`, and
  `α` has no fixed points, matching `∂₀SM = ∅`.
- The backward branch: on the closed unit disc at `x = (0, −1)` with the outward `v = (0, −1)`,
  `τ(x, v) = 0`, while `(x, −v)` is inward with `τ = 2` and endpoint `((0, 1), (0, 1))`, so
  `α(x, v) = ((0, 1), (0, −1))`, which is the ball formula `(x − 2⟨x, v⟩v, v)`. Dropping the sign
  change of the endpoint would give `((0, 1), (0, 1))`, an outward vector whose image is again
  outward, and `α ∘ α = id` would fail.
- The endpoint map at times other than the exit time: on the closed unit disc with
  `z = ((0, −1), (0, 1))`, the endpoint at time `1` is `((0, 0), (0, 1))`; for `T = 3 > τ(z) = 2` no
  geodesic of `M` is defined on `[0, 3]`, so the value is `z`, not the point `((0, 2), (0, 1))`
  of the flow of `ℝ²`, which lies outside `M`; for `T = 0` the parameter set `{0}` carries no
  derivative, so the value is again `z`; for `T = −1` the parameter set `[0, −1]` is empty, so the
  value is `z`, not `φ_{−1}(z) = ((0, −2), (0, 1))`; and for the zero vector at `x` the constant
  curve gives `(x, 0)` for every `T > 0`.
- The endpoint map without the Hausdorff property: on the half-line `[0, ∞)` with the point `1`
  doubled (3.5, last Check) and the metric `dx²`, the curves `t ↦ t` through either copy of `1` are
  geodesics on `[0, 2]` issuing from `(0, +1)`, and their endpoints at time `T = 1` lie over the two
  different copies of `1`, while at `T = 2` they agree. The independence of the choice of `γ` uses
  the Hausdorff property, which is a hypothesis of every theorem about `geodesicEndpoint` and
  `scatteringRelation`.
- The scattering relation off the unit vectors: for the zero vector `z = (x, 0)`, `τ = ∞` in both
  directions, so the first branch does not apply, `T′ = 0`, `geodesicEndpoint (x, 0) 0 = (x, 0)`,
  and the sign change returns `α(z) = (x, 0) = z`; at a boundary point this agrees with the zero
  vector being glancing (5.1). A definition with the condition `τ(z) > 0` alone would evaluate the
  endpoint at the time `∞`, which is no real time.

*Needs:* 1.2, 2.1, 3.5, 4.1, 5.1, 5.2, 5.4; Tau Ceti `TauCeti.Manifold.IsGeodesicCurveOnFrom`,
`TauCeti.Manifold.curveVelocityWithin`, `TauCeti.IsOutwardPointing`.

### Examples

The disc and ball (all formulas explicit), the interval (dimension one), the annulus
(discontinuity without convexity), closed manifolds, the hemisphere of `S^{n+1}`, `n ≥ 1`, and a
conformal ball with a totally geodesic inner sphere (trapping).

### Dependencies

5.1 uses 1.1–1.2, 3.1, 3.5, HopfRinow Layer 1, Tau Ceti's sphere bundles and geodesic spray; 5.2
uses 2.1, 4.1–4.2 and 5.1; 5.3 uses only calculus (Mathlib's implicit function theorem, Tau Ceti's
parametric Morse lemma and Hadamard factorisation, ComplexKahlerGeometry K5a); 5.4 uses 1.4, 2.1,
3.5, 4.2 and 5.1–5.3; 5.5 uses 2.1, 3.4–3.5, 4.2, 4.6, 5.1–5.2 and 5.4; 5.6 uses 1.2, 2.1, 3.5, 4.1,
5.1, 5.2 and 5.4.

## Layer 6: Examples

### 6.1 Euclidean balls and convex Euclidean domains

For `c ∈ ℝⁿ⁺¹`, `R > 0` and the closed ball `B̄(c, R) = {R² − |x − c|² ≥ 0} ⊆ ℝⁿ⁺¹` with the
Euclidean metric prove:
`II = h/R`, `S = R⁻¹ id`, `H = 1/R` (`n ≥ 1`); the boundary is strictly convex; the ball is
non-trapping with `τ(x, v) = −⟨x − c, v⟩ + √(⟨x − c, v⟩² + R² − |x − c|²)` for `x ∈ B̄(c, R)` and
`|v| = 1`, hence, by the homogeneity of 5.2,
`τ(x, v) = (−⟨x − c, v⟩ + √(⟨x − c, v⟩² + |v|²(R² − |x − c|²)))/|v|²` for `v ≠ 0`, and
`τ(x, 0) = ∞`; on `∂SM`,
`τ̃(x, v) = −2⟨x − c, v⟩` and `α(x, v) = (x − 2⟨x − c, v⟩ v, v)`; the signed distance to the sphere is
`R − |x − c|` (Paternain–Salo–Uhlmann, Example 3.2.1, lines 2849–2864, and lines 307–310).

For a compact regular domain `D = {ρ ≥ 0} ⊆ ℝⁿ⁺¹` prove: `D` is non-trapping (5.5 with
`u = |x|²/2`), and `τ(x, v) ≤ diam D` for every `(x, v) ∈ SD`, since the geodesic is the segment
from `x` to `x + τ(x, v) v`, of length `τ(x, v)` with both endpoints in `D`; for `v ≠ 0`,
`τ(x, v) ≤ diam D/|v|`, and `τ(x, 0) = ∞`. If `D` is convex as a subset of `ℝⁿ⁺¹`, then `∂D` is
convex; and at
`q ∈ ∂D`, in Euclidean coordinates with `q = 0` and `ν_in(q) = e₀`, `D = {x₀ ≥ w(x')}` near `0` with
`w(0) = 0`, `Dw(0) = 0`, and `II_q = D²w(0)` under `T_q∂D = ℝⁿ`; so `∂D` is strictly convex at `q`
iff `D²w(0)` is positive definite, iff the principal curvatures at `q` are positive
(Paternain–Salo–Uhlmann, Example 3.1.4, lines 2677–2680). More generally, for every local
parametrisation of `∂D` near `q`, a smooth embedding `i : V → ℝⁿ⁺¹` of an open `V ⊆ ℝⁿ` with
`i(x) = q`, `II_q(di_x u, di_x w) = ⟨B_i(u, w), ν_in(q)⟩`, where `B_i = TauCeti.secondFundamentalForm
ℝ i x` is the component of `D²i(x)` orthogonal to the range of `di_x`; the graph parametrisation
`i(x') = (w(x'), x')` gives `D²w(0)`.

**Checks.**

- `R = 1`, `c = 0`: `II = h`, and `H = 1` for `n ≥ 1`; at `x = (0, −1)` in `ℝ²`,
  `τ(x, (cos θ, sin θ)) = sin θ + |sin θ|`, which is `2 sin θ` or `0`.
- Speed, in the unit ball at `x = 0`: `τ(0, e₁) = 1`, the unit-speed root; `τ(0, e₁/4) = 4` and
  `τ(0, 0) = ∞`, while the unit-speed root evaluated at `e₁/4` or at `0` still gives `1`, and
  `4 > diam = 2`. The general-speed formula gives `(0 + √(1/16))/(1/16) = 4`, and the general bound
  `4 ≤ 2/(1/4) = 8` holds: the root formula and the diameter bound are statements about unit
  vectors.
- `R = 0`: `{−|x − c|² ≥ 0} = {c}` and `dρ = −2(x − c)` vanishes at `c`, so `0` is a critical value
  and the singleton is not a regular domain; the hypothesis `R > 0` is what gives `|dρ| = 2R > 0`
  on the sphere.
- The ellipse `{x²/a² + y²/b² ≤ 1}`, `a, b > 0`, at its vertex `(a, 0)`: `dρ = (−2/a, 0)`,
  `|dρ| = 2/a`, `Hess ρ(e_y, e_y) = −2/b²`, so `II = (2/b²)/(2/a) = a/b²`, the curvature of the
  ellipse at its vertex. With `a = −1`, `b = 1` the set is the unit disc, whose boundary at
  `(−1, 0)` has `II = 1`, not `a/b² = −1`: the formula needs `a > 0`.
- `{y ≥ x³}` is not convex near `0` and has `II < 0` for `x < 0`; the graph form gives
  `w(x) = x³`, `w''(x) = 6x`.
- Parametrised form on the unit circle, `i(θ) = (cos θ, sin θ)`: `D²i(θ) = −i(θ)` is already normal,
  `ν_in = −i(θ)`, so `⟨B_i(1, 1), ν_in⟩ = ⟨−i, −i⟩ = 1 = II(i′, i′)` with `|i′| = 1`; pairing with
  `ν_out` instead gives `−1`, the value of the exterior of the disc.

*Needs:* 1.4, 1.5, 2.1, 3.1, 4.3, 5.1, 5.2, 5.4, 5.5, 5.6; Tau Ceti `TauCeti.secondFundamentalForm`.

### 6.2 Half-spaces and ball exteriors

Prove: the closed half-space `{x⁰ ≥ 0} ⊆ ℝⁿ⁺¹` has `II = 0` and is convex, and for `n ≥ 1` it is
nowhere strictly convex; its tangent geodesics stay in `∂M`, and `τ = ∞` on `∂₀SM`. For
`c ∈ ℝⁿ⁺¹` and `R > 0` the closed exterior `{|x − c| ≥ R}` has `II = −h/R` and is strictly
concave, with `H = −1/R` for `n ≥ 1`, and for `q ∈ ∂M` and `0 ≠ v ⊥ (q − c)` the tangent line
`q + tv` enters `int M` to second order: `ρ(q + tv) = t²|v|²` for `ρ = |x − c|² − R²`
(Paternain–Salo–Uhlmann, Definition 2.5.1 and Lemma 2.5.2, lines 2449–2473, in dimension two;
the source names a circle `{r = r̄}` as seen from the side of the larger radii, so for the
Euclidean `b(r) = r`, with `b′ = 1 > 0` and tangential geodesics moving to larger `r`, its
strictly convex circle `{r = R}` is the strictly convex boundary of the ball `{r ≤ R}` and the
strictly concave boundary of the exterior `{r ≥ R}`).

**Checks.**

- Half-space with `ρ = x⁰`: `Hess ρ = 0`; along `q + tv` with `v ∈ ℝⁿ`, `ρ ≡ 0`. For `n = 0` it is
  the half-line `[0, ∞)`, strictly convex (vacuously) and still with `II = 0`.
- Exterior of the unit ball, unit `v ⊥ q`: `ρ(q + tv) = t²` along the tangent line; `II = −h`, and
  `H = −1` for `n ≥ 1`. For `v = 0` the constant curve stays on `∂M` and does not enter `int M`.
- The side fixes the name: in the plane, at `q = (1, 0)` with `v = (0, 1)`, `|q + tv|² = 1 + t²`, so
  `r̈(0) = 1 > 0` and the source calls the unit circle strictly convex; the exterior's
  `ρ = |x|² − 1 = t² ≥ 0` along the line, with `II = −h`, while the ball's `ρ = 1 − |x|² = −t²`,
  with `II = h`. Taking the source's name for the exterior would give the exterior `II = +h`.
- Both are non-compact, so 5.4 and 5.6 do not apply; the exterior has `τ = ∞` in every direction
  that does not point at the ball.

*Needs:* 1.4, 1.5, 2.1, 3.1, 4.2, 5.1, 5.2.

### 6.3 Spherical caps and hyperbolic domains

In the unit sphere `S^{n+1} ⊆ ℝⁿ⁺²` with Tau Ceti's round metric (`TauCeti.sphereRoundMetric`),
prove for `p ∈ S^{n+1}` (a unit vector of `ℝⁿ⁺²`) and the cap `C_R = {⟨x, p⟩ ≥ cos R}` of geodesic
radius `R` about `p`, `0 < R < π`: `II = cot R · h`. For `n ≥ 1`, `∂C_R` is strictly convex iff
`R < π/2`, totally geodesic at `R = π/2` and strictly concave for `R > π/2`, and `C_R` is
non-trapping iff `R < π/2` (Hessian criterion with `u = −⟨x, p⟩`, `Hess u = ⟨x, p⟩ g`, for
`R < π/2`; a great circle of the great sphere `{⟨x, p⟩ = 0}`, which lies in `C_R`, for `R ≥ π/2`)
(Paternain–Salo–Uhlmann, Examples 2.5.4–2.5.5, lines 2499–2521, and Example 3.1.4, lines
2677–2680). For `n = 0`, `C_R` is the arc `{|θ| ≤ R}` of `S¹` in the arc-length coordinate `θ`
centred at `p`, `II` is the zero form, and `C_R` is non-trapping for every `0 < R < π`, with
`τ(θ, ±1) = R ∓ θ`.

In Tau Ceti's upper half-space model `TauCeti.UpperHalfSpace` of hyperbolic space with
`TauCeti.UpperHalfSpace.hyperbolicMetric`, prove that `u(x, y) = (|x|² + y² + 1)/(2y)` satisfies
`Hess u = u · g`, `u ≥ 1` and `|du|² = u² − 1`; hence every compact regular domain is non-trapping
(5.5), and for `R > 0` the value `cosh R` is a regular value of `u`, with `|du| = sinh R` on
`{u = cosh R}`, so that by 3.2 on the whole half-space (where `du` vanishes only at the point with
`u = 1`) the closed balls `{u ≤ cosh R}` are regular domains, strictly convex with
`II = cosh R · h/sinh R = coth R · h` (Paternain–Salo–Uhlmann, Example 3.1.4).

**Checks.**

- Cap: with `ρ = ⟨x, p⟩ − cos R`, `grad ρ = p − ⟨x, p⟩ x`, so `|dρ|² = |p|² − ⟨x, p⟩² = sin² R` on
  `∂C_R` because `|p| = 1`, and `Hess ρ = −⟨x, p⟩ g = −cos R · g` there, so `II = cot R · h`;
  `R = π/4` gives `II = h`, `R = π/2` gives `0`.
- The centre must be a unit vector: for `p = 2e` with `e ∈ S^{n+1}` and `R = π/3`, the set
  `{⟨x, p⟩ ≥ 1/2} = {⟨x, e⟩ ≥ 1/4}` is the cap of radius `arccos(1/4) ≈ 1.318` about `e`, with
  `II = h/√15 ≈ 0.258 h` rather than `cot(π/3) h = h/√3 ≈ 0.577 h`, and
  `|dρ| = 2 sin(arccos(1/4)) = √15/2` rather than `sin(π/3) = √3/2`.
- Hyperbolic plane (`n = 1`, `g = (dx² + dy²)/y²`): with `Γ^x_{xy} = −1/y`, `Γ^y_{xx} = 1/y`,
  `Γ^y_{yy} = −1/y`, `u_x = x/y`, `u_y = ½ − (x² + 1)/(2y²)`, one gets
  `Hess u_{xx} = 1/(2y) + (x² + 1)/(2y³) = u/y² = u g_{xx}`, `Hess u_{xy} = −x/y² + x/y² = 0` and
  `Hess u_{yy} = u/y²`. Also `|du|² = y²(u_x² + u_y²) = u² − 1`: at `(0, 2)`, `u = 5/4 = cosh(log 2)`
  and `|du| = 2 · 3/8 = 3/4 = sinh(log 2)`, while at `(0, 1)`, `u = 1` and `du = 0`. So `du`
  vanishes at a point of every ball `{u ≤ cosh R}`, and 3.2 is applied through the regular value
  `cosh R`; a version of 3.2 requiring `du ≠ 0` on its whole open set would reach none of these
  balls (on the half-space minus `(0, 1)` the sublevel set is a punctured ball).
- At radius `R = 1` the boundary second fundamental forms are `coth 1 · h ≈ 1.313 h` (hyperbolic),
  `h` (Euclidean) and `cot 1 · h ≈ 0.642 h` (spherical): curvature `−1, 0, +1` lowers `II` in this
  order, and for `n ≥ 1` only the spherical value changes sign, at `R = π/2`.
- Dimension one: in `S¹` the arc `C_{3π/4}` has finite exit times `3π/4 ∓ θ ≤ 3π/2` although
  `R ≥ π/2`, so the cut-off `π/2` of the classification is a phenomenon of `n ≥ 1`.

*Needs:* 1.4, 2.1, 3.1, 3.2, 3.6, 5.2, 5.5; RiemannianGeometry R5a (`B = 0` is equivalent to total
geodesicity); Tau Ceti `TauCeti.sphereRoundMetric`, `TauCeti.UpperHalfSpace`,
`TauCeti.UpperHalfSpace.hyperbolicMetric`, `TauCeti.UpperHalfSpace.hasConstantSectionalCurvature`,
`CovariantDerivative.IsLeviCivitaConnection.inner_apply_eq_inner_mvfderiv`.

### 6.4 Small geodesic balls

Prove: for a boundaryless Hausdorff second-countable Riemannian `(N, g)` and `p ∈ N` there is
`r_p > 0` such that for `0 < R < r_p` the function `d(p, ·)²` is smooth on `B(p, r_p)` with `R²` a
regular value there, and the closed ball `B̄(p, R) = {d(p, ·)² ≤ R²}` is a compact regular domain
of the open submanifold `B(p, r_p)` (Hausdorff, second countable and boundaryless, with the
restricted metric), with defining function `R² − d(p, ·)²`; its boundary is strictly convex and it
is non-trapping; on a compact set of centres `r_p` can be
chosen uniformly (Lee, *Introduction to Riemannian Manifolds*, Ch. 6, Lemma 6.16 and Theorem 6.17,
uniformly normal neighbourhoods and geodesically convex balls; the spherical-cap instance is
Paternain–Salo–Uhlmann, Example 3.1.4, lines 2677–2678). The ambient manifold of the regular
domain is `B(p, r_p)`, not `N`: `d(p, ·)²` need not be smooth on all of `N`. Second countability is
the standing hypothesis of Layer 5, whose non-trapping criterion 5.5 the route applies (it passes
to the open submanifold `B(p, r_p)`), and of SmoothBundlesConnections B6.0. Route:
in normal coordinates `z` at `p`, `d(p, ·) = |z|` on the whole normal ball (HopfRinow Layer 2,
there on a smaller ball; on every open tangent ball contained in a normal domain by Tau Ceti's
`TauCeti.Manifold.IsNormalDomain.edist_riemannianExp_eq_of_mem_ball`); with the coordinate
fields `∂_i` of an orthonormal basis of `T_pN` (`TauCeti.Manifold.normalCoordinateField`), the
metric coefficients satisfy `g_ij = δ_ij + O(|z|²)`
(`TauCeti.Manifold.IsNormalDomain.mfderiv_inner_normalCoordinateField_self`) and the
Christoffel symbols vanish at `p`
(`TauCeti.Manifold.IsNormalDomain.leviCivitaConnection_normalCoordinateField_self`), so
`Hess |z|²(∂_i, ∂_j) = 2δ_ij − 2 z_k Γ^k_ij = 2g_ij + O(|z|²)`, equal to `2g` at `p` and positive
definite on a small ball; apply 3.2's sublevel statement on `U = B(p, r_p)` with `x = d(p, ·)²` and
the regular value `c = R²` (`dx` vanishes at `p ∈ U`, which that statement allows), and 5.5's
Hessian criterion with `u = d(p, ·)²` on `B(p, r_p)`. The uniform choice on a compact set `K` of
centres: let `r > 0` be SmoothBundlesConnections B6.0's uniform normal radius on a compact
neighbourhood `K'` of `K`. On `W = {(x, v) ∈ TN : x ∈ int K', |v| < r}` the map
`E(x, v) = (x, exp_x v)` is smooth (HopfRinow Layer 1), injective (each `exp_x` is injective on its
normal ball) and has invertible differential (block-triangular, with diagonal blocks the identity
and `d(exp_x)_v`, invertible on a normal domain), so it is a diffeomorphism of `W` onto
`{(p, y) : p ∈ int K', d(p, y) < r}`: for each `p`, `exp_p` maps the tangent ball `B(0, r)` onto
the metric ball `B(p, r)` (Tau Ceti `TauCeti.Manifold.IsNormalDomain.image_riemannianExp_ball`,
with `d(p, exp_p v) = |v|` there by
`TauCeti.Manifold.IsNormalDomain.edist_riemannianExp_eq_of_mem_ball`; both for the distance
`Manifold.riemannianEDist`, which they read through their `IsRiemannianManifold` hypothesis, as
for Mathlib's `EMetricSpace.ofRiemannianMetric`), and
`F(p, y) = d(p, y)² = |E⁻¹(p, y)|²` is smooth in `(p, y)` there. So `Hess F(p, ·)` at `y`, evaluated
on unit vectors `w ∈ T_yN`, is continuous in `(p, y, w)`; it equals `2` at `y = p`, and since the unit
vectors over `K` form a compact set, there is `r_K ∈ (0, r]` such that `Hess F(p, ·)` is positive
definite on `B(p, r_K)` for every `p ∈ K`. The remaining requirements hold below the normal radius
`r`, so `r_p := r_K` serves for every `p ∈ K`. A uniform normal radius alone gives no such bound
(it does not control the constant in the `O(|z|²)` above), and neither does B6.0's strict
convexity of the squared radial distance along short geodesics: strict convexity allows a
vanishing second derivative, as `|y|⁴` on `ℝⁿ⁺¹` shows at `0`, while 3.2 and 5.5 need a positive
definite Hessian.

**Checks.**

- Unit sphere `S^{n+1}`, `n ≥ 1`: geodesic balls are the caps of 6.3, strictly convex exactly for
  `R < π/2`, so every admissible `r_p` is at most `π/2`, although the normal radius is `π`: with
  `s = d(p, ·)`, `Hess s² = 2 ds² + 2s cot s (g − ds²)` has the eigenvalue `2s cot s` on the tangent
  space of the geodesic sphere, `2` in the limit `s → 0` and negative for `π/2 < s < π`, so taking
  `r_p` equal to the normal radius would fail. On `S¹` every `r_p ∈ (0, π]` is admissible:
  `d(p, ·)² = θ²` is smooth on `B(p, π)`, `R²` is a regular value for `0 < R < π`, and every arc
  `B̄(p, R)` is non-trapping with vacuously strictly convex boundary.
- `ℝⁿ⁺¹` and hyperbolic space: every radius works (6.1, 6.3).
- Flat torus `ℝ²/ℤ²`: `d(p, ·)²` is smooth on `B(p, 1/2)` and not beyond (along the line through
  `p` and the cut point `p + (1/2, 0)` it is `min(s², (1 − s)²)`, with one-sided derivatives `1` and
  `−1` at `s = 1/2`), so `R² − d(p, ·)²` is a defining function on `B(p, 1/2)` and not on the torus.
  With `r_p = 1/2` and `R = 1/4`, in the coordinate `z` centred at `p`: `ρ = 1/16 − |z|²` has
  `dρ = −2z ≠ 0` on `|z| = 1/4` and `Hess |z|² = 2g`, so `II = 2h/(2 · 1/4) = 4h = h/R`; 5.5's bound
  with `u = |z|²/2`, `f(z, v) = ⟨z, v⟩`, `Xf = 1` gives `τ ≤ (1/4 − (−1/4))/1 = 1/2`, the diameter.

*Needs:* 1.3, 2.1, 3.1, 3.2, 5.2, 5.5; HopfRinow Layers 1–2; Tau Ceti
`TauCeti.Manifold.IsNormalDomain`, `TauCeti.Manifold.normalCoordinateField`,
`TauCeti.Manifold.IsNormalDomain.mfderiv_inner_normalCoordinateField_self`,
`TauCeti.Manifold.IsNormalDomain.leviCivitaConnection_normalCoordinateField_self`,
`TauCeti.Manifold.IsNormalDomain.edist_riemannianExp_eq_of_mem_ball`,
`TauCeti.Manifold.IsNormalDomain.image_riemannianExp_ball`; Mathlib
`EMetricSpace.ofRiemannianMetric`; SmoothBundlesConnections B6.0 (uniform normal radii on compact
sets).

### 6.5 Conformal and rotationally symmetric metrics on the ball

On the closed unit ball of `ℝⁿ⁺¹` with `ĝ = e^{2φ(|x|²)} g_eucl`, `φ` smooth on `ℝ`, and
`b(r) := r e^{φ(r²)}`, prove that for `0 < r ≤ 1` the sphere `|x| = r`, as the boundary of the ball
`{|x| ≤ r}`, has `II^ĝ = (b′(r)/r) h_eucl`, with `h_eucl` the Euclidean induced metric; on the
boundary `r = 1` this is `II^ĝ = e^{φ(1)} (1 + 2φ′(1)) h_eucl = b′(1) h_eucl`. Hence, for `n ≥ 1`:
the boundary sphere is strictly convex for `ĝ` iff `b′(1) > 0`, the restriction of the Herglotz
condition to the outer boundary; every sphere `|x| = r`, `0 < r ≤ 1`, is strictly convex iff
`b′(r) > 0` for every `r ∈ (0, 1]`, the full Herglotz condition (Stefanov–Uhlmann–Vasy, condition
(1.1), lines 66–72, written `(r/c(r))′ > 0` for `ĝ = c^{−2} g_eucl`, `c(r) = e^{−φ(r²)}`;
Paternain–Salo–Uhlmann, Lemma 2.5.2 and Corollary 2.5.3(a)⇔(c), lines 2462–2481, in dimension
two); and a sphere with `b′(r) = 0` is totally geodesic for `ĝ`, its great circles being closed
geodesics of `ĝ` inside the ball. The full condition is strictly stronger than the outer-boundary
test, and no statement about the inner spheres is drawn from `b′(1) > 0` alone. For `φ(s) = −s`,
`II^ĝ = −e^{−1} h_eucl`: the unit disc is strictly convex for the Euclidean metric and strictly
concave for `e^{−2|x|²} g_eucl`.

**Checks.**

- `φ ≡ 0`: `II = h`; `φ ≡ log c`: `II = c h` (1.6).
- `φ_s(t) = −s t`: `II = e^{−s}(1 − 2s) h`, and `b_s′(1) = e^{−s}(1 − 2s)`: the two criteria agree,
  with threshold `s = 1/2`; here `b_s′(r) = e^{−s r²}(1 − 2s r²)` is positive on all of `(0, 1]`
  exactly when `s < 1/2` (for `0 ≤ s < 1/2` it decreases on `(0, 1]`, for `s < 0` both factors are
  positive, for `s ≥ 1/2` already `b_s′(1) ≤ 0`), so for this family the outer-boundary test and
  the full condition coincide.
- With 1.6 directly: `ν_in = −x/r`, `d(φ(|x|²))(ν_in) = −2rφ′(r²)` on the sphere `|x| = r`, so
  `II^ĝ = e^{φ(r²)}(1/r + 2rφ′(r²)) h_eucl = (b′(r)/r) h_eucl`, which is
  `e^{φ(1)}(1 + 2φ′(1)) h_eucl` at `r = 1`.
- Outer boundary versus full condition: `φ(s) = s² − 2s` gives
  `b′(r) = e^{r⁴ − 2r²}(2r² − 1)²`, so `b′(1) = e^{−1} > 0` and the boundary is strictly convex
  (`n ≥ 1`), but `b′(1/√2) = 0`: the sphere `|x| = 1/√2` is totally geodesic, and its great circles
  are trapped geodesics (in dimension two, Paternain–Salo–Uhlmann, Lemma 2.5.2(b), line 2464).
- Dimension one: for `n = 0` the boundary `{±1}` is strictly convex for every `φ`, also for
  `φ(s) = −s`, where `b′(1) = −e^{−1} < 0`; the equivalence needs `n ≥ 1`.

*Needs:* 1.4, 1.6, 2.1, 3.1, 3.6; RiemannianGeometry R5a (`B = 0` is equivalent to total geodesicity).

### Examples

This layer is the roadmap's acceptance suite: every formula above is evaluated at explicit points.

### Dependencies

6.1 uses 1.4–1.5, 2.1, 3.1, 4.3, 5.1–5.2, 5.4–5.6 and Tau Ceti's second fundamental form of a
map into an inner product space; 6.2 uses 1.4–1.5, 2.1, 3.1, 4.2 and 5.1–5.2;
6.3 uses 1.4, 2.1, 3.1–3.2, 3.6, 5.2, 5.5, RiemannianGeometry R5a and Tau Ceti's round sphere and
hyperbolic space; 6.4 uses 1.3, 2.1, 3.1–3.2, 5.2, 5.5, HopfRinow Layers 1–2, Tau Ceti's normal
coordinate fields and distance identity on normal balls and SmoothBundlesConnections B6.0 (uniform
normal radii); 6.5 uses 1.4, 1.6,
2.1, 3.1, 3.6 and RiemannianGeometry R5a.

## Downstream consumers

- A Part II of PositiveMass for manifolds whose boundary is given intrinsically: the boundary mean
  curvature `H = tr_h II/n`, `n ≥ 1`, for the inward normal (1.5) and its identification with
  RiemannianGeometry R5a's `⟨B, ν_in⟩` (3.6). PositiveMass itself (5.1–5.2) takes its mean
  curvature from RiemannianGeometry R5b's `A(X, Y) = ⟨B(X, Y), ν⟩` and does not consume this
  roadmap; the normalisations agree, its averaged `tr A/(dim M − 1)` for the inward normal being
  the `H` of 1.5 by 3.6, with `H = 1` on the unit sphere and `H = −1` on the boundary of the
  exterior of the unit ball in both.
- Lorentzian geometry on domains with boundary, through the parts of this roadmap that do not use
  the metric: boundary defining functions and their comparison (1.3, except the gradient
  formula), the manifold structure of a regular domain (3.1, its first item) and the defining
  functions on the collar extension and the double (3.3).
- Future roadmaps on the geodesic X-ray transform, lens and boundary rigidity and simple manifolds
  (Stefanov–Uhlmann–Vasy, Theorems 1.1–1.4; Uhlmann–Vasy; Paternain–Salo–Uhlmann, Chapters 4–5):
  the convexity predicates (2.1), level-set concavity (3.2), convexity functions (4.5), boundary
  normal coordinates (4.4), the exit time and its regularity (5.2–5.4), Proposition 3.3.1 (5.5) and
  the scattering relation and lens data (5.6). With these, the hypotheses of Stefanov–Uhlmann–Vasy
  Theorems 1.1–1.3 are expressible: strict convexity at a point and on a subset, the signed distance
  `x̃` to a hypersurface (4.3), compactness of `M ∩ {x̃ ≥ −c}` for some `c > 0`, level sets strictly
  concave from the superlevel sets, the boundary distance function `d_M|∂M×∂M`, and equality of
  lens data.
- Part II extensions of PositiveScalarCurvature and Yamabe to manifolds with boundary (mean-convex
  boundary conditions): 1.5, 2.1 and 3.4.

## References

- G. P. Paternain, M. Salo, G. Uhlmann, *Geometric Inverse Problems with Emphasis on Two
  Dimensions*, Cambridge Studies in Advanced Mathematics 204, 2023 (`paternain-salo-uhlmann2023`):
  Preface (lines 307–310), Section 2.5 (lines 2443–2530), Chapter 3, Sections 3.1–3.3
  (lines 2640–3127), and Section 11.2, Proposition 11.2.2 (lines 10065–10077).
- P. Stefanov, G. Uhlmann, A. Vasy, *Local and global boundary rigidity and the geodesic X-ray
  transform in the normal gauge*, Ann. of Math. 194 (2021) (`stefanov-uhlmann-vasy2021`):
  abstract and Section 1 (condition (1.1), Theorems 1.1–1.4), lines 8–230.
- G. Uhlmann, A. Vasy, *The inverse problem for the local geodesic ray transform*, Invent. Math.
  205 (2016) (`uhlmann-vasy2016`): Section 1, lines 15–70 and 128–142; Section 3, lines 498–524.
- J. M. Lee, *Introduction to Riemannian Manifolds*, 2nd ed., GTM 176, 2018
  (`lee-riemannian2018`): Ch. 5, "Tubular Neighborhoods and Fermi Coordinates", pp. 133–136;
  Ch. 6 (Gauss lemma; Lemma 6.16 and Theorem 6.17, uniformly normal neighbourhoods and
  geodesically convex balls); Ch. 7–8 (curvature, Riemannian submanifolds, second fundamental
  form, hypersurfaces).
- J. M. Lee, *Introduction to Smooth Manifolds*, 2nd ed., GTM 218, 2012 (`lee-smooth2012`):
  Theorem 9.25 (collar neighbourhoods), through GeometricTopology 1.1.
- V. A. Sharafutdinov, *Integral Geometry of Tensor Fields*, VSP, 1994 (`sharafutdinov1994`):
  Ch. 4, compact dissipative Riemannian manifolds, an alternative account of the material of
  Layer 5.
