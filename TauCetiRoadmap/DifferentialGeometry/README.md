# Roadmap: differential geometry — forms, Stokes, flows, de Rham cohomology, degree, planar Green and Riemannian calculus

**Summary.** Mathlib has the smooth-manifold core (`IsManifold` over any `ModelWithCorners`, tangent and general
`ContMDiffVectorBundle`s, `mfderiv`/`mvfderiv`, Lie brackets, integral curves, partitions of unity,
the interior/boundary calculus) and a complete *flat* exterior calculus (`extDeriv`, d² = 0,
naturality under pullback), but none of the geometry built on them: no forms on manifolds (no wedge
product even on normed spaces), no manifold `d`, no orientations, no integration or Stokes' theorem,
no de Rham cohomology, no flows beyond the local integral-curve theory, no Frobenius theorem, no
mapping degree, no Green's theorem beyond rectangles, no Riemannian Laplacian.

This roadmap asks for that theory, following [Lee] = John M. Lee, *Introduction to Smooth
Manifolds*, 2nd ed., GTM 218 (cited with that edition's numbering; departures from its route are
marked). The headline theorems are Stokes (for the half-space and for smooth faces and corners),
the fundamental theorem of flows for Banach models, Frobenius and global leaves, the de Rham
theorem, Poincaré duality, the equality of the two definitions of the mapping degree, the hairy
ball theorem, Green's theorem for absolutely continuous planar cycles and for finite
type-I/type-II divisions, and the Laplace–Beltrami operator with the Riemannian divergence
theorem; everything below them is reusable library. Its consumers include
DeRhamCohomologyAndDuality (the relative de Rham theory, the comparison of integration with
singular fundamental classes and finite-parameter relative transversality, all built on the forms,
orientations, integration, de Rham cohomology, smooth chains and degree of this roadmap) and the
algebraic-topology, geometric-topology, Heegaard Floer and Lie-groups roadmaps. Suggested homes,
by Mathlib's layout:
`TauCeti/Geometry/Manifold/{DifferentialForm,Orientation,Flow,Distribution,Integration,DeRham,SmoothSingular,Degree,Riemannian}/`
and flat prerequisites under `TauCeti/Analysis/`.

## Scope and ownership

This roadmap owns the forms, the exterior derivative and their calculus (layers 0–1),
orientations and the orientation double cover (layer 2), flows (layer 3), distributions,
Frobenius and leaves (layer 4), integration, Stokes, the homotopy operator, densities and smooth
faces (layer 5), planar Green (5.6), the de Rham complex and cohomology with the Poincaré lemma,
homotopy invariance, path integration and compact supports (layer 6), the Mayer–Vietoris
sequences and the Mayer–Vietoris induction principle (layer 7), smooth singular chains,
integration over them and the de Rham theorem (layer 8), the Poincaré pairing and Poincaré
duality (layer 9), null sets, Sard's theorem on manifolds and the Brouwer mapping degree
(layer 10), the hairy ball theorem (layer 11) and the Riemannian calculus (layer 12). Citations
of a single section 5.5 (densities and Stokes with corners) refer to 5.5a (densities) and 5.5b
(smooth faces, abstract boundary and corner Stokes). Citations of the layer 4 names
Distribution, IsInvolutive and leafThrough refer to the family `D` with
`TauCeti.IsContMDiffDistribution`, to `TauCeti.IsInvolutiveDistribution` and to the leaf of
`Distribution.exists_leaf` (4.2–4.4).

Already in the library, at the Tau Ceti revision the content repository pins (*From Tau Ceti*,
the de Rham modules): all of layer 6 and 7.1–7.3, the carriers of 8.3, the integral over a
simplex of 8.4, the pairing of 9.1, the regular values of 10.1, the equal-dimensional case of
Sard (10.2) and the signed fibre count of 10.3. Those subsections name the declarations, keep
the ids and the names under which consumers cite them, and plan nothing again; the targets of
layers 6–11 are what remains: the Mayer–Vietoris induction principle (7.4), the smoothing
theorem (8.3), Stokes for chains and the de Rham homomorphism (8.4), the de Rham theorem (8.5),
top cohomology and Poincaré duality (9.2–9.3), Sard in all dimensions (10.2), the degree with
its integral formula and calculus (10.3–10.5) and the hairy ball theorem (11).

Left to named roadmaps, and neither a target nor an input here: the relative de Rham theory of
an open pair, the comparison of integration with the singular fundamental classes (the
algebraic-topology roadmap's), finite-parameter relative transversality, and the strict inward cone of a
model with corners, strictly inward vector fields, their forward semiflow and inward domination
of a manifold with corners by its interior are DeRhamCohomologyAndDuality's (its Layers 1–5);
the sharp finite-order Sard theorem is HeegaardFloer §2.1's; the comparison of the smooth degree
of layer 10 with the homological degree is AlgebraicTopology's (its 6.5); collars, tubular
neighbourhoods and gluing are GeometricTopology's.

One owner per shared construction, stated identically on both sides.

- **DeRhamCohomologyAndDuality** consumes this roadmap: the forms, the exterior derivative and
  `closedForms` (0–1), orientations and the orientation-cover descent API (2), flows and
  homogeneity of flows (3), the integral of top forms, the boundary orientation and Stokes
  (5.1–5.3), the homotopy operator and Stokes on `M × Icc 0 1` (5.4), the standard simplex
  `fullSimplex` with its barycentric bridge (5.5b), the de Rham complex, `H^•_dR`, `H^•_c`, the
  Poincaré lemmas and path integration (6), the Mayer–Vietoris sequences (7), smooth singular
  chains, the smoothing equivalence, chain integration and the de Rham isomorphism (8), the
  Poincaré pairing and duality (9), regular values, Sard and the degree (10) and the hairy ball
  theorem (11). It owns the relative de Rham theory, the fundamental-class comparison, relative
  transversality, and the strict inward cone, strictly inward fields, their forward semiflow and
  inward domination (its §§2.1–2.2), built on the flows of layer 3. No layer here consumes any
  of its material.
- **Universal covers** owns π₁, deck groups, the classification and πₙ; 2.4 and 6.3's periods
  consume them.
- **Geometric topology** consumes the orientation interface (2), the canonical
  Tau Ceti distribution and foliation APIs and their integral-manifold/leaf
  extensions (4), generic densities and form integration (5.5a, 12.4),
  and the abstract boundary/product charts from the additional
  smooth face structure data (5.5b). The half-space boundary manifold
  is Tau Ceti's and consumed by both. Geometric topology owns the Riemannian
  volume measure, already `TauCeti.riemannianVolume` and consumed by 12.4,
  curvature, hyperbolic structures, tubular and collar neighbourhoods,
  gluing, tautness, the Euler class, and the 3-manifold-specific applications.
  Layer 4 supplies the missing common Frobenius and leaf theory on the
  existing APIs, not a replacement distribution or foliation carrier.
- **Algebraic topology** owns singular chains and cochains, relative theory, subdivision, small
  chains, excision and Mayer–Vietoris (its Stages 2–3), and universal coefficients, cup and cap
  products and singular Poincaré duality (Stage 6). AT6.3 consumes Layer 2's tangent-orientation API,
  5.1's outward-first boundary orientation and 5.5b's standard simplex `fullSimplex` with
  `fullSimplexEquivStdSimplex`. Layer 8 consumes the singular (co)homology, subdivision and
  small chains that Tau Ceti already has (8.1–8.2), never a target of that roadmap, and builds
  only the smoothing theorem, integration over smooth chains and the de Rham comparison; its
  6.5 compares its homological degree with layer 10's, and the comparison of integration with
  its fundamental classes is DeRhamCohomologyAndDuality §4.1's.
- **Hopf–Rinow** owns the Levi-Civita connection, covariant differentiation along curves, geodesics
  and their flow, the exponential map, Hopf–Rinow, and the manifold inverse function theorem;
  layer 12 builds on the connection, 10.1 consumes the inverse function theorem, and 3.2 consumes
  its maximal integral curves and finite-dimensional maximal flow, whose extension to Banach models
  is this roadmap's.
- **Lie groups** owns `lieExp`, one-parameter subgroups, `Ad`, the closed-subgroup and Lie-specific
  theorems, consuming layer 3's flows (reconciled in 3.3), layer 4's Frobenius and leaves, and 2.3's
  covers.
- **CKG K5a** owns compact real/complex bundle Laplace analysis beyond 12.5;
  **PDE** supplies scalar Euclidean/weak inputs and **PDO** the broader
  symbol calculus. **DG and `A∞`** owns the generic DGA
  packaging. **Heegaard Floer (analytic)** consumes orientations, the time-dependent flows of 3.5, the de Rham theorem and the degree (8.5, 10); layer 0.4 owns
  migration of its existing 2-form API and consumers to the generic carrier. **Contour integration** owns contour integrals; 5.3 only reconciles with
  `curveIntegral`. **One-parameter semigroups** owns the operator-semigroup analogue of flows.
  **Modular forms** may refactor its region-Stokes onto layer 5 at its own choice.

## Conventions

State each hypothesis where it is used; never bake it in.

- **Setting and regularity.** `I : ModelWithCorners ℝ E H` and `M` with
  `[ChartedSpace H M] [IsManifold I n M]`, everything over `ℝ`. Pointwise theorems at the lowest
  regularity the flat layer needs (`C²` for the `extDeriv` facts, `C³` for the bracket); the
  bundled forms of 0.4 and the linear exterior derivative on them fixed at `C^∞`; no analytic
  refinements. The flat planar statements of 5.6 use their stated absolute-continuity and
  directional hypotheses.
- **Finite dimension** is written `[FiniteDimensional ℝ E]` exactly where it is used: orientations,
  integration, partitions of unity, 3.3's homogeneity, and all of layer 4. Layers 0–1
  and the rest of 3 stay Banach-general, like `extDeriv` and `IsMIntegralCurve`. Partitions of unity
  and smooth approximation also need `[T2Space M] [SigmaCompactSpace M]`, carried visibly.
- **Completeness** of a coefficient space, `[CompleteSpace F]`, is written wherever forms are
  integrated or primitives taken (5.4, and the integrated form of 5.4a); the algebraic calculus of
  layers 0–1 keeps its
  generality.
- **Orientation** is chart-sign data (2.1), with fibers `Orientation ℝ (TangentSpace I x) ι` and an
  explicit `Fintype.card ι = finrank ℝ E`; the determinant criteria are theorems, not definitions.
- **Wedge normalization**: for every pairing `μ`, `wedgeWith μ` is the sign-weighted sum over all
  permutations divided by `k! l!`, equivalently the unscaled sum over `(k,l)`-shuffles, as in
  `AlternatingMap.domCoprod`. This is `((k+l)!/(k!·l!)) • Alt (ω ⊗_μ η)`, so elementary covectors
  multiply by concatenation, top-degree wedges are determinants, and Leibniz has unit constants.
  The definition of `wedgeWith` fixes all degrees; the two-term Check of 0.1 pins the
  normalization.
- **Laplacian sign**: `Δ = div ∘ grad`, Mathlib's and the PDE roadmap's; [Lee, Problem 16-13ff] uses
  the negation, so every Laplacian identity imported from the book flips sign.
- **Total functions, junk values**, in the `mfderiv` style, with the real hypotheses on the
  theorems. Every bundled object ships `_apply`/`coe_` lemmas, and every acceptance gate pins a
  concrete nonzero value, because totality makes vacuous statements easy to write.
- **Measurable structure** is never installed on a manifold: integration of top forms and of densities
  needs none, statements about a measure on `M` carry `[MeasurableSpace M] [BorelSpace M]`, and null
  sets of a manifold are read through charts against Haar measure on the model.
- **Vocabulary.** Vector fields and rough forms are unbundled (`V : (x : M) → TangentSpace I x`, with a `ContMDiff`
  predicate); bundled types come last and only at `C^∞`. The `d` of a function is `mvfderiv`. State
  every theorem `Within` first, with `univ` specializations; the boundary cases need the `Within`
  versions.
- **Mathlib and Tau Ceti.** Use the corresponding Mathlib declaration whenever Tau Ceti's working
  dependency has it; otherwise implement the interface stated here in Tau Ceti. Adoption by Mathlib
  is no part of the completion criteria, and the external designs cited below fix shapes, never
  existence.

## Boundary and corners

Mathlib's `ModelWithCorners` covers boundaryless manifolds, manifolds with boundary (the half-space
model `𝓡∂ n`, whose `EuclideanHalfSpace` constrains the *first* coordinate where [Lee]'s `Hⁿ`
constrains the last), and manifolds with corners (`modelWithCornersEuclideanQuadrant n`, the orthant
`[0,∞)ⁿ`, and arbitrary models), with one `I.boundary M` for all of them. [Lee] works with boundary
throughout and treats corners only in Ch. 16 ("Manifolds with Corners", Thm. 16.25), just enough to
integrate over `M × [0, 1]` and over simplices. This roadmap fixes the generality of each layer
instead of inheriting the book's:

- **Layers 0–2 (forms, `d`, orientations) hold over any model with corners.** The flat theory is
  `Within`, `extDerivWithin_pullback` applies on `range I` for every model, and chart signs are
  precisely what makes orientation work with boundary or corners (`Set.Icc x y` is orientable; a
  positive-Jacobian atlas for it does not exist).
- **Two-sided flows (3.1–3.5) and Frobenius (4) are for boundaryless `M`**
  (`[BoundarylessManifold I M]`); native local flow statements are used at
  interior points as stated. Strictly inward fields, their forward semiflows and
  inward domination on a general model with corners are
  DeRhamCohomologyAndDuality §§2.1–2.2's (*Scope and ownership*).
- **5.1–5.3 use the half-space model.** Its boundary is Tau Ceti's smooth
  manifold, with the outward-first orientation. **5.5a defines densities over
  every finite-dimensional real `ModelWithCorners`, independently of faces.**
  **5.5b adds a smooth face structure on `M` for face-indexed boundary and corner
  Stokes.** This is additional smooth local quadrant/face data, not a theorem
  that an arbitrary convex model range has smooth faces. It supplies an abstract
  boundary `∂̃M` of local boundary germs and a smooth proper immersion to M,
  with one point for each germ, including multiplicity at corners. Standard
  half-space, quadrant, product and restriction constructions are required.
  Integration of top forms and densities retains the generic-model scope;
  the face hypothesis belongs only to the face-boundary/Stokes branch.
- **The homotopy operator does not need corner Stokes.** Its cochain-homotopy
  identity (5.4) is proved directly, on every model with corners, and does not
  consume 5.5b; the standard simplex of 5.5b is a carrier, and no Stokes
  theorem on it is a prerequisite of 5.4. Layer 12.4 and circle volume do consume 5.5a's
  densities and its elementary integration gates. The early flat Green
  results in 5.6 are independent of the manifold comparison, which is owned
  by the later compatibility milestone 12.6.

## Exact supplier contracts

### From Mathlib

Checked against the pin; re-grep before citing anything in code.

- **Flat exterior calculus**: `Analysis/Calculus/DifferentialForm/{Basic,VectorField}.lean`
  (`extDeriv`, `extDerivWithin`, d² = 0, the bracket formula, `extDerivWithin_pullback` with
  hypotheses that hold on `range I`), over `alternatizeUncurryFin`; alternating maps and their
  topological bundle, `Topology/VectorBundle/ContinuousAlternatingMap.lean`,
  `compContinuousLinearMap`, and `ContinuousAlternatingMap.curryLeft`, which is the interior
  product.
- **Manifold calculus**: `Geometry/Manifold/VectorBundle/` (`ContMDiffVectorBundle`, `Hom.lean`,
  `ContMDiffSection`, `Pullback`, `LocalFrame`, `Tensoriality`), `MFDeriv/` (`mfderiv`, `mvfderiv`),
  `VectorField/` (`mlieBracket`, `mpullback`),
  `{Immersion,LocalDiffeomorph,Diffeomorph,SmoothEmbedding}.lean`
  (`IsLocalDiffeomorph.mfderivToContinuousLinearEquiv`, the differential of a `C^n` local
  diffeomorphism, `n ≠ 0`, as a continuous linear equivalence, which 2.2 inverts).
- **Integral curves**:
  `Geometry/Manifold/IntegralCurve/{Basic,ExistUnique,Transform,UniformTime}.lean`
  (`IsMIntegralCurve`/`On`/`At`, uniqueness on `[T2Space M]`, uniform-time globalization =
  [Lee, Lemma 9.15]); `Dynamics/Flow.lean` (`Flow`, not yet tied to vector fields).
- **Boundary, instances, partitions of unity**: `IsManifold/InteriorBoundary.lean` (`I.interior`,
  `I.boundary`), `Instances/{Real,Icc,Sphere}.lean` (`EuclideanHalfSpace`,
  `modelWithCornersEuclideanQuadrant`, `boundary_product`, `contMDiff_neg_sphere`,
  `range_mfderiv_coe_sphere` with its non-canonical identification),
  `{PartitionOfUnity,BumpFunction,SmoothApprox,WhitneyEmbedding}.lean`.
- **Flat integration and fiberwise orientation**: `MeasureTheory/Integral/DivergenceTheorem.lean`,
  `MeasureTheory/Function/Jacobian.lean`, `CurveIntegral/`, `IntervalIntegral/`,
  `LinearAlgebra/{Orientation,Ray}.lean` (`Orientation.map`, `Basis.orientation`, with
  `Module.finBasisOfFinrankEq` supplying the basis behind the model orientation of 2.2),
  `Orientation.volumeForm`, `Basis.addHaar`; none of it manifold-level.
- **Covering spaces**: `Topology/Covering/{Basic,Quotient}.lean`, `Topology/Homotopy/Lifting.lean`,
  `Geometry/Manifold/Instances/Quotient.lean` (charts on a quotient *below* an action, the only
  covering–manifold bridge in the pin; 2.3 builds the other direction).
- **Riemannian substrate**: `RiemannianBundle`, `ContMDiffRiemannianMetric`, `IsRiemannianManifold`,
  `CovariantDerivative` with `torsion` and `IsMetricCompatible`, the Levi-Civita connection
  `CovariantDerivative.leviCivitaConnection` (metric-compatible and torsion-free),
  `InnerProductSpace.instLaplacian` and the `Δ` notation class, `Analysis/Calculus/Gradient/`.

### From Tau Ceti

`Suggested.lean` imports the existing APIs consumed by these layers; none is rebuilt.

- **Covering-space theory** (universal-covers roadmap): `TauCeti/AlgebraicTopology/UniversalCover/`
  — universal cover, π₁-action, deck groups and the classification; 2.4 consumes the
  two-sheeted case.
- **Oriented atlases**: `Geometry/Manifold/Orientation.lean` — `TauCeti.OrientationPreservingOn`
  (differentiable within `range I` with derivative of positive determinant, read in the model),
  `TauCeti.orientationPreservingGroupoid`, `TauCeti.IsOrientedAtlas I n A` (charts of the maximal
  `C^n` atlas that cover `M` and whose coordinate changes lie in that groupoid, over every model)
  and the class `TauCeti.Orientable I n M` (an oriented atlas exists). 2.2's atlas criterion is
  stated with `IsOrientedAtlas`. At the Tau Ceti revision the content repository pins,
  `IsOrientedAtlas` lives in `Geometry/Manifold/Orientation/OrientedAtlas.lean` with the same
  signature, the direction from an oriented atlas to an orientation is
  `TauCeti.IsOrientedAtlas.orientable`, and `TauCeti.Orientable` names the chart-sign class of
  2.1, which is why the criterion is stated with `IsOrientedAtlas` and not with either
  `Orientable`.

- **The boundary manifold** (geometric-topology roadmap):
  `Geometry/Manifold/Boundary/{Model,Charts}.lean` — `TauCeti.isManifold_boundary` (the boundary of
  a `C^k` manifold over `𝓡∂ (n+1)` is a `C^k` manifold over `EuclideanSpace ℝ (Fin n)`) with the
  inclusion a closed smooth embedding; corners out of scope there.
- **The manifold inverse function theorem** (Hopf–Rinow roadmap):
  `Geometry/Manifold/LocalDiffeomorph.lean`, `TauCeti.isLocalDiffeomorphAt_of_mfderiv_eq` at
  interior points over any model, hence at every point of a boundaryless manifold, and the global
  form `TauCeti.isLocalDiffeomorph_of_mfderiv_eq`.
- **Maximal integral curves and the maximal flow** (Hopf–Rinow roadmap):
  `Geometry/Manifold/IntegralCurve/{Extension,Maximal,Flow}.lean` — `maximalIntegralCurveInterval`,
  `maximalIntegralCurve`, the escape lemma `eventually_notMem_nhdsLT_maximalIntegralCurve`,
  completeness on compact manifolds, and the fundamental theorem of flows for finite-dimensional
  models: `maximalIntegralCurveFlowDomain`, its openness, joint smoothness of the flow, and the
  group law `maximalIntegralCurve_add`. 3.2 reads them in `flowOf`'s order, discharges its
  finite-dimensional targets from them, and extends them to Banach models.
- **Smooth dependence on initial conditions, finite-dimensional**:
  `Analysis/ODE/{SmoothParameter,InitialCondition}.lean` (`ODE.exists_contDiffAt_localFlow`); 3.1
  keeps only the Banach case.
- **The Levi-Civita connection** (Hopf–Rinow roadmap): on Mathlib's `leviCivitaConnection`,
  `…/CovariantDerivative/LeviCivita/{Basic,Regularity}.lean` (uniqueness through the Koszul
  formula, `C^∞` regularity as the instance
  `CovariantDerivative.instContMDiffCovariantDerivativeLeviCivitaConnection`),
  `…/Riemannian/Riesz.lean` (`Riemannian.Tensor.rieszDual`), `…/Riemannian/Geodesic/`. Layer 12
  builds on top.
- **Flows on Lie groups** (Lie-groups roadmap): `Geometry/Lie/{IntegralCurve,Exponential/*}.lean`
  (`mulInvariantIntegralCurve`, `lieExp`, `contMDiff_lieExp`); 3.3 reconciles by name.
- **Slice charts and embeddings**: `Geometry/Manifold/{SmoothEmbedding,LocallyFlat}/`
  (`TauCeti.IsSliceChart`), `Geometry/Diffeomorphism/`.
- **Induced and pulled-back metrics**: `Geometry/Manifold/Riemannian/Induced.lean`
  supplies `TauCeti.inducedRiemannianMetric` for finite-dimensional sources and
  arbitrary real inner product targets. `Riemannian/Pullback.lean` supplies
  `Bundle.contMDiffAt_bilinearForm_pullback` and
  `Bundle.ContMDiffRiemannianMetric.contMDiffAt_pullback`, with C^(n+1)-map/C^n-metric
  regularity and no finite-dimensional target hypothesis. Layer 12.1 consumes
  these regularity theorems and owns the positive-definite pullback data/API for
  maps with injective differential into general Riemannian targets.
- **Round spheres**: `Riemannian/Sphere.lean` supplies `TauCeti.sphereRoundMetric`,
  its Riemannian/analytic/continuous instances and `inner_tangentSpace_sphere`.
  `Circle` is the same unit-sphere carrier in ℂ with its existing atlas; consume
  this metric and these instances rather than defining another round metric.
- **The Riemannian volume measure** (geometric-topology roadmap):
  `Geometry/Manifold/Riemannian/VolumeDensity/` — `TauCeti.riemannianVolume`, glued from the chart
  volumes with density `chartVolumeDensity`, orientation-free, characterized by
  `eq_riemannianVolume_iff`, locally finite; 12.4 connects densities and form integration to it.

- **De Rham cohomology, smooth chains, null sets, Sard and the degree** (cited at Tau Ceti
  `2fd255d9`, the revision the content repository's `lake-manifest.json` pins; these modules
  postdate the revision `358314d4` that this folder's `Suggested.lean` is written against, which
  is why its de Rham, duality and degree headlines are listed there as not statable):
  `Geometry/Manifold/DeRham/{Basic,Map,Wedge,Algebra,DegreeZero,HomotopyInvariance,PathIntegral,SimplyConnected,CompactSupport,ExtendByZero,MayerVietoris,CompactlySupportedMayerVietoris,NormedSpace,RealLine,Euclidean,Sphere,Punctured,Circle,Torus,PoincarePairing,Period}.lean`,
  `Geometry/Manifold/SmoothSingular/{Basic,Integral}.lean`,
  `Geometry/Manifold/{Measure,RegularValue}.lean`, `Geometry/Manifold/Sard/{EqualDimension,Meagre}.lean`,
  `Geometry/Manifold/Degree/Basic.lean`, `Geometry/Manifold/Orientation/Cover/{Basic,Smooth,Descent,FundamentalGroup}.lean`,
  `Geometry/Manifold/DifferentialForm/{HomotopyOperator,Poincare}.lean`,
  `Geometry/Manifold/DifferentialForm/Integration/{TopForm,Stokes,BoundarylessStokes}.lean`,
  `Geometry/Convex/FullSimplex.lean`, `Geometry/Manifold/Exhaustion.lean` and
  `Analysis/Calculus/DifferentialForm/Poincare.lean`. Layers 6–11 consume them by name. The
  carriers they are built on — `TauCeti.RoughForm`, `TauCeti.SmoothForm`, `TauCeti.mextDeriv`,
  `TauCeti.closedForms`, `TauCeti.Manifold.OrientationLift`, `TauCeti.Manifold.Orientation`,
  `TauCeti.integralTopForm`, `TauCeti.homotopyOperator`, `TauCeti.fullSimplex` — realize the
  targets of layers 0–2 and 5 that `Suggested.lean` states against the earlier revision; a
  declaration of `Suggested.lean` bearing one of these names is that target's signature, never
  a second definition.
- **Singular (co)homology, subdivision and the Brouwer theorems** (algebraic-topology roadmap):
  `AlgebraicTopology/Cohomology/{Basic,HomotopyInvariance,Relative,Kronecker,UniversalCoefficient,Cup}.lean`,
  `AlgebraicTopology/Cohomology/MayerVietoris/Basic.lean`,
  `AlgebraicTopology/Singular/Subdivision/{Homotopy,Small/Equiv}.lean`,
  `AlgebraicTopology/Singular/MayerVietoris/Basic.lean`,
  `AlgebraicTopology/Singular/BrouwerFixedPoint.lean` and `Topology/Circle/Degree.lean`; 8.1–8.2
  and 10.5 consume them.
- **Flat Morse–Sard**: `Analysis/Calculus/Sard/OutermostStratum.lean`
  (`TauCeti.addHaar_image_criticalPoints_eq_zero`, for `C^k` maps with `k ≥ (dim E)² + 1`);
  10.2 consumes it.

- **Planar filled hulls and separation** (conformal-mapping roadmap, L5):
  `Topology/FilledHull.lean` and `Analysis/Normed/Module/FilledHull.lean` —
  `TauCeti.filledHull`, `filledHull_subset_closedConvexHull`, `isBounded_filledHull`,
  `subset_filledHull_of_frontier_subset`, and
  `connectedComponentIn_compl_eq_of_unbounded_component`. Layer 5.6 uses
  `filledHull K \ K` for the bounded complementary components of a trace; it introduces
  no second inside or filled-hull definition.
- **Scalar contour and index APIs** (completed contour-integration roadmap):
  `Analysis/Contour/Winding/{Number/Basic,Number/Homotopy,Proximity,UnboundedComponent}.lean`
  and `Analysis/Contour/Cycle/` — `windingNumber_eq_integral_of_avoidance`,
  `windingNumber_eq_two_pi_I_inv_mul_curveIntegral`, proximity invariance, vanishing on
  unbounded components, and `Cycle`. Layer 5.6 extends their regularity theorems to AC curves.
- **Metric derivatives and rectangle Green formulas**:
  `MeasureTheory/Function/MetricDerivative.lean` —
  `HasDerivAt.metricDerivative_eq` and
  `AbsolutelyContinuousOnInterval.lintegral_metricDerivative_lt_top`; and
  `MeasureTheory/Integral/DivergenceTheorem.lean` —
  `ContinuousLinearMap.integral_bilinear_fderiv_sub_prod_Icc`. Layer 5.6 consumes these
  length and rectangle results and proves agreement with its planar formula.

### From TauCetiRoadmap.GeometricMeasureTheory

- G1–G2: rectifiability, arclength, the variation–speed identity and the arclength factorization
  of absolutely continuous curves, and Hausdorff length; 5.6.1 consumes the nullity of an
  absolutely continuous trace and the variation–speed identity as specializations, and
  *Rectifiable curves and geometric measure theory* consumes the arclength factorization.

## Existing code to refactor

**Smooth 2-forms**, defined in `Geometry/Manifold/TwoForm/Basic.lean` as
`TauCeti.SmoothTwoForm`, with closedness `TauCeti.SmoothTwoForm.IsClosed` defined chartwise in
`TwoForm/Closed.lean` and symplectic forms (`IsSymplectic`) built on both, migrate to the generic
`SmoothForm I M ℝ 2` in layer 0.4. Refactor the existing implementation, its API and its
symplectic consumers onto that carrier. Any retained `SmoothTwoForm` name is an abbreviation for
the generic type, with compatibility operations derived from the generic API. Closedness becomes
layer 1's `mextDeriv φ = 0`, with the chartwise description a theorem about it. The migration
equivalence and its preservation laws are targets of 0.4; `Suggested.lean` states nothing against
the old carrier.

### Existing distribution and Frobenius implementation

Layer 4 consumes the pinned distribution, foliation and graph-coordinate
Frobenius APIs. `TauCeti.IsContMDiffDistribution`, local
`TauCeti.IsInvolutiveDistribution`, the foliation carrier and the local
integral-graph theorem are the shared production interfaces. Extend them
with the restrictions, transport laws and consumers below; do not build a
parallel distribution or involutivity theory. `Suggested.lean` states layer 4
on these predicates directly and adds only the bundled integral manifold. The pinned files are
`TauCeti/Geometry/Manifold/Distribution.lean`,
`TauCeti/Geometry/Manifold/Foliation/Basic.lean` and
`TauCeti/Geometry/Manifold/Distribution/Graph.lean`.

Layer 12.2 builds the Riemannian gradient `mgradient` on the pinned fibrewise Riesz
isometry `Riemannian.Tensor.rieszDual`
(`TauCeti/Geometry/Manifold/VectorBundle/Riemannian/Riesz.lean`), with its
characteristic identity `inner_rieszDual` and chartwise regularity
`contMDiffAt_rieszDual`; the pinned Tau Ceti has no manifold gradient of its own.

## What is missing (build here)

Everything the layers specify beyond the inventory above. The layer order is the order of
dependence, and the two hardest items — Banach smooth dependence (3.1) and Green's theorem for
absolutely continuous cycles (5.6.3) — gate what follows them. `Suggested.lean` states the
headline theorems of these layers against the pinned libraries; it is a nonexhaustive
illustration of particular signatures, and this README is definitive. A definition in
`Suggested.lean` has a real body (`mpullback`, `flowDomain`/`flowOf`, `toFlow`,
`planarRadialPrimitive`, `fullSimplexEquivStdSimplex`, the gradient compatibility notation,
`laplaceBeltrami`, …). A construction whose body is itself a theorem (integration of top forms
and of densities, the boundary orientation, the homotopy operator of 5.4, the smooth face
structure of 5.5b) is a target of this README with its intended signature and laws, and is never
declared with a `sorry` body or a `Prop`-typed placeholder. An implementation must provide that
data and those laws.

## Prior work and coordination

Cited for design and migration, never as the definition of a target; coordinate with the authors and
confirm licences before porting.

- Yury Kudryashov's `github.com/urkud/DeRhamCohomology` (a wedge taking the pairing as an argument,
  alternating maps between general vector bundles, with manifold `d` on the trivial scalar
  specialization): migration material for layers 0–1, and the first place to coordinate.
  Design references only, per the convention above: mathlib4#35376 (chart-sign orientations), #26394
  and #26395 (flows), #33714 (metrics), #36845 (Levi-Civita, delivered in Tau Ceti by Hopf–Rinow).
- `github.com/qinz1yang/differential-geometry` (Ziyang Qin, Jack McCarthy, Yuan Liao):
  smooth-section modules, tensor-bundle equivalences, a wedge with its algebra, flat forms with d² =
  0 — blueprint material for layers 0–1.
- The sphere-eversion project supplies prior art for partition-of-unity idioms;
  the Meta ATLAS corpus (arXiv:2605.29955) as a reference, never as code.

---

## How to read the build

The stages below separate mathematical producers from later comparisons.
The numbered order is not an additional dependency edge.

- Native chart/calculus and bundle foundations support 0–1. Orientations 2,
  the vector-field part of 3, and metrics/gradient/divergence 12.1–12.3 can
  be developed independently of form integration; Cartan's form identity
  in 3.4 uses 1. The finite-dimensional suspension in 3.5 consumes the native
  maximal flow; its Banach extension needs 3.1–3.2. Frobenius 4 needs 3 and 1.4.
- Half-space geometry 5.1 uses native boundary charts and 2. Top-form
  integration 5.2 uses 0 and 2. Half-space Stokes 5.3 uses 5.1–5.2 and flat box
  integration. The direct homotopy identity 5.4 uses 0–1 and interval
  integration, not Stokes. Generic densities 5.5a use 5.2 and the absolute
  determinant law, not the face branch. The geometric face data 5.5b use
  native quadrant charts and 2; their Stokes theorem then uses integration
  and the local half-space/quadrant formula. No GT collar is an input.
- Flat Green 5.6.1→5.6.2→5.6.3 uses native flat calculus, contour/index and
  gauge integration, plus GMT's early arclength/variation targets at their
  stated scope. Neither manifold Stokes nor Riemannian divergence is an
  input to that producer. The compatibility theorem is 12.6, downstream.
- Volume/density 12.4 uses native metric volume and 5.5a, with 0/2 for its
  oriented form bridge. Divergence/Green 12.5 uses 12.3–12.4 and half-space
  Stokes 5.3, or 5.5b for the face version. Circle volume uses the angular
  gate 5.5a. Finally 12.6 consumes the independently completed 5.6 and 12.5
  producers, plus the appropriate integration/face comparisons, and has
  no edge back into any of them. Global collars/gluing remain GT targets
  consuming 5.5b's geometric data, not prerequisites of those targets.
- The de Rham track is 0–1 → 6 → 7 → {8, 9} → 10 → 11. Layer 6 needs only 0–1 and 5.4's
  homotopy operator; 7 needs 6 and partitions of unity; 8 needs 7.4, 8.1–8.2 and 5.5b's
  simplex; 9 needs 5.2–5.3, 6.3–6.4, 7.1–7.4 and 2.4's descent; 10 needs 2, 3.3, 5.2–5.4, 9.2
  and the flat Morse–Sard theorem; 11 needs 10.5. 6 and 7.1–7.3 are in the library, so 7.4 and
  8.3 can start at once. DeRhamCohomologyAndDuality is downstream of every layer here.

Claim single numbered items or smaller; the headline theorems 5.3, 5.5b's corner Stokes, 5.6.3,
8.5, 9.3, 10.4, 11.1 and 12.5 remain staged claims with reusable intermediate results. All general-model,
face-structured, finite-regularity and zero-dimensional branches retain their stated hypotheses
and obligations.

## The build, in layers

This README is definitive; `Suggested.lean` is nonexhaustive and does not replace the stated
hypotheses.

### Layer 0: alternating bundles, differential forms, and the wedge

*[Lee, Ch. 12 and 14].*

- **0.1 The wedge.** The generic object is the paired wedge `wedgeWith μ`, defined as the signed
  permutation sum divided by `k! l!`. Prove bilinearity, the norm bound
  `‖wedgeWith μ φ ψ‖ ≤ C(k+l, k) ‖μ‖ ‖φ‖ ‖ψ‖`, compatibility with `compContinuousLinearMap`, the
  explicit evaluation formula in every degree, and the flip identity `wedgeWith_flip` for every
  pairing; ⚠ associativity (`wedgeWith_assoc`) and graded commutativity hold only under
  hypotheses on the pairings, since degree zero reduces them to `μ`. Specializations: the
  ℝ-valued wedge along multiplication (graded commutative and associative), the wedge of forms
  with values in a normed algebra along its multiplication, and `bracketWedge` along a skew
  bracket, with graded skew-symmetry (the flip identity with `β.flip = −β`) and the graded Jacobi
  identity `bracketWedge_jacobi` [Tu, *Differential Geometry*, GTM 275, §21]; the interior product
  is Mathlib's `curryLeft` (`ι_v ∘ ι_v = 0` is its `curryLeft_same`), whose antiderivation rule
  `curryLeft_wedgeWith` [Lee, Lemma 14.13] is built here.
  **Checks.**
  - On two covectors, `wedgeWith μ φ ψ (v, w) = μ (φ v) (ψ w) − μ (φ w) (ψ v)`, with no factor
    `1/2`; the `Alt` normalization would give half of this.
  - For multiplication on `ℝ` and `dx, dy` on `ℝ²`, `(dx ∧ dy)(e₁, e₂) = 1`, the determinant.
  - In degree zero `wedgeWith μ c ψ = μ c ∘ ψ`, so associativity for an arbitrary pairing would
    assert associativity of `μ`; a Lie bracket refutes it.
  - `bracketWedge` on two `𝔤`-valued `1`-forms: `[φ ∧ ψ](v, w) = [φ v, ψ w] − [φ w, ψ v]`, so
    `[φ ∧ φ](v, w) = 2 [φ v, φ w]` by skew-symmetry; this is why the Maurer–Cartan form reads
    `dω + ½ [ω ∧ ω]`, and a wedge normalized by `1/2` would read `dω + [ω ∧ ω]`.
  - `bracketWedge` graded skew-symmetry: for `1`-forms `[ψ ∧ φ](v, w) = [ψ v, φ w] − [ψ w, φ v]
    = [φ ∧ ψ](v, w)`, the sign `(−1)^(1·1)` of the flip cancelling the sign of `β.flip = −β`;
    for a `0`-form `a` and a `1`-form `φ`, `[φ ∧ a] = −[a ∧ φ]`.
  - `bracketWedge_jacobi` needs the Jacobi identity: in degree zero it reads
    `[[a, b], c] + [[b, c], a] + [[c, a], b] = 0`, and for the skew bracket on `ℝ³` with
    `[e₁, e₂] = e₃`, `[e₂, e₃] = e₁`, `[e₃, e₁] = e₁` the left side at `(e₁, e₂, e₃)` is
    `0 + 0 + [e₁, e₂] = e₃ ≠ 0`.
- **0.2 The smooth alternating bundle.** The `ContMDiffVectorBundle` instance for
  `fun x ↦ E₁ x [⋀^ι]→L[ℝ] E₂ x` (`contMDiffVectorBundle_continuousAlternatingMap`), mirroring
  `VectorBundle/Hom.lean`; all form bundles specialize it.
- **0.3 Rough forms and pullback.** The carrier is `RoughBundleForm I M V k`, with value fibre
  `V x`; `RoughForm I M F k` is its `Bundle.Trivial M F` specialization. Smoothness is
  `IsSmoothBundleForm` in the alternating bundle, specializing to `IsSmoothForm`. Bundle pullback
  `bundleMpullback` through `mfderiv` takes values in the pulled-back bundle `fun x ↦ V (f x)`,
  and pulling back a paired wedge pulls back the fibrewise pairing as well as both forms, with no
  differentiability hypothesis. `mpullback` is the fixed-coefficient specialization. Its chain
  rule carries the differentiability hypotheses `mfderiv`'s does, pointwise, on open sets and
  globally. For fixed coefficients, define the coefficient postcomposition `L_*ω` of a rough form
  pointwise by `fun x ↦ L.compContinuousAlternatingMap (ω x)` for every continuous real-linear
  `L : F →L[ℝ] G`; use Mathlib's native coefficient-postcomposition operation, not a parallel
  alternating-map carrier. Provide identity, composition, zero, addition and real-linearity laws
  in both the map and form arguments, and prove that coefficient postcomposition preserves the
  stated roughness/smoothness class. These calculus targets require normed real coefficient spaces,
  not completeness. The pointwise paired product is
  `RoughForm.wedgeWith`, the trivial-bundle case of the bundle-valued paired wedge through a
  fibrewise continuous bilinear pairing; pullback commutes with it unconditionally, and with the
  real wedge as its multiplication specialization. Coefficient postcomposition is compatible with paired wedges:
  for `μ : F₁ →L[ℝ] F₂ →L[ℝ] F₃` and `L : F₃ →L[ℝ] G`, let `μ_L` be the continuous
  real-bilinear pairing `μ_L a b = L (μ a b)` and prove
  `L_*(RoughForm.wedgeWith μ φ η) = RoughForm.wedgeWith μ_L φ η`.
  `C^(n+1)` maps pull `C^n` forms back to `C^n` forms (`isSmoothBundleForm_mpullback`, with values
  in the pulled-back bundle).
  **Open-subtype flat adapter.** For an open `U⊆E` in a real normed model `E`, give the
  open subtype its canonical manifold structure induced by inclusion, with model `𝓘(ℝ,E)`. Use `ContinuousAlternatingMap.ofSubsingletonLIE` at
  `Fin 1` to identify flat degree-one alternating covectors with `E→L[ℝ]F`. Define the flat
  one-form adapter, the pointwise equivalence from `RoughForm (𝓘(ℝ,E)) U F 1` to fields `U → (E→L[ℝ]F)`. A rough
  form is only pointwise data, so this adapter does not assert continuity. For a smooth form,
  prove that its resulting field is continuous and identify it with the restriction of an ambient
  representative which is `ContDiffOn ℝ ∞` on `U`; values outside `U`
  are immaterial and no globally smooth extension is required. State the inverse adapter and
  prove both pointwise evaluation laws. For a curve in `U`, the ambient representative is
  consumed only along `γ.map (ContinuousMap.subtypeVal (U : Set E)).continuous`; prove that
  changing the representative without changing its values on the path trace leaves the curve
  integral unchanged. Layer 1.1 owns the degree-zero derivative comparison and the degree-one
  comparison between `mextDeriv ω=0` and the flat `extDeriv`/curl equation.
  For every degree `k` and regularity `n`, identify the flat field of a rough form on this
  canonical open subtype with `U → (E [⋀^Fin k]→L[ℝ] F)`. Prove that
  `IsSmoothForm (𝓘(ℝ,E)) n ω` is equivalent to `ContDiffOn ℝ n ω₀ U` for an ambient
  representative `ω₀` agreeing with that field on `U`. Prove this in both directions and
  independence of the representative outside `U`. The degree-zero specialization uses
  `ContinuousAlternatingMap.constOfIsEmpty`; degree one uses the adapter above. This supplies
  coefficient evaluation for degree two and the construction of smooth forms from coordinate
  formulas, including smooth functions as zero-forms.
  For canonical open subtypes `U⊆E` and `V⊆E'`, prove the corresponding map comparison:
  `ContMDiff (𝓘(ℝ,E)) (𝓘(ℝ,E')) n f` iff `ContDiffOn ℝ n f₀ U`, where `f₀:E→E'`
  agrees on `U` with the inclusion of `f:U→V`. At differentiable points, identify `mfderiv f`
  with `fderiv ℝ f₀` under the flat tangent identifications. Prove the open-subtype version
  of the flat-pullback identity of 0.4, with its pointwise evaluation law. These comparisons include
  different real normed models, such as `ℝ×ℝ` and `ℂ`.
  Layer 1.5 gives the coordinate and path calculations using these adapters.
  **Checks.**
  - `RoughBundleForm I M V 0` is `(x : M) → TangentSpace I x [⋀^Fin 0]→L[ℝ] V x`, the sections of
    `V` through `constOfIsEmpty`; a carrier indexed by `Fin (k + 1)` instead of `Fin k` would make
    `0`-forms covector fields. On a model of dimension `n` every `RoughBundleForm` of degree
    `n + 1` is `0`, since `E [⋀^Fin (n+1)]→L[ℝ] F = 0`, which is what makes cohomology vanish
    above the dimension (6.1).
  - A rough form carries no continuity: the indicator form on `ℝ`, `dx` for `x ≥ 0` and `0`
    for `x < 0`, is a `RoughForm 𝓘(ℝ) ℝ ℝ 1`, and `IsSmoothForm 𝓘(ℝ) 0` fails for it, so
    smoothness is a predicate on the carrier, not part of it; `IsSmoothBundleForm` and
    `IsSmoothForm` are monotone in `n` and hold for the zero form at every `n`.
  - On the model `𝓘(ℝ, E)` with the trivial bundle, `IsSmoothForm 𝓘(ℝ, E) n φ` is
    `ContDiff ℝ n φ` for `φ : E → E [⋀^Fin k]→L[ℝ] F` (the flat adapter), and `mpullback` at a
    point of differentiability is `(φ (f x)).compContinuousLinearMap (fderiv ℝ f x)`; a chartwise
    definition that forgot the fibre identification would not reduce to these.
  - `bundleMpullback I I id φ = φ`, and along a constant map `c` the pullback is
    `(φ c).compContinuousLinearMap 0`, which is `0` in degree `≥ 1` and the constant function
    `φ c` in degree `0`.
  - The chain rule of `mpullback` needs differentiability: for `f = (· ^ 3)` and `g = ∛` on
    `ℝ`, `mpullback (g ∘ f) dx = dx` everywhere, while `mpullback f (mpullback g dx)` is `0` at
    `0`, because `mfderiv g 0` is the junk value `0`.
  - `RoughForm.wedgeWith` is pointwise: on `ℝ²`, `(x dy) ∧ dx` evaluated at `(e₁, e₂)` is
    `0 · 0 − x · 1 = −x`, i.e. `x dy ∧ dx = −x dx ∧ dy`; pullback commutes with it with no
    hypothesis, both sides using the same `mfderiv`; and for the scalar pairing and a `0`-form
    `a`, `ofFunction a ∧ η = a • η` with no sign.
  - `RoughForm.ofFunction I f x` evaluates to `f x` on the empty tuple, is injective in `f`,
    and `mextDeriv (ofFunction f) = df` (1.1), so a constant function has `d = 0`;
    `IsSmoothForm I n (ofFunction f)` is `ContMDiff I 𝓘(ℝ, F) n f`.
- **0.4 Bundled forms.** `SmoothBundleForm` is the submodule `smoothBundleForms` of `C^∞`
  bundle-valued rough forms; `SmoothForm I M F k` (the submodule `smoothForms`) is its
  trivial-bundle specialization, closed under the paired wedge for every fixed continuous
  bilinear pairing (`smoothForms_wedgeWith_mem`). General fibrewise products use a smooth bundle pairing.
  In particular, `V x →L[ℝ] V x` is an allowed value fibre: curvature can be typed as an
  endomorphism-valued 2-form (`CurvatureForm`). Refactor Tau Ceti's existing `SmoothTwoForm`
  implementation and its callers to use `SmoothForm I M ℝ 2`; retain the old name only as an
  abbreviation if needed. The existing bilinear evaluation, algebraic bilinear-form view,
  smooth evaluation and constant-form API must follow from the generic API, reusing its algebra
  instances. Callers use tuple evaluation or a named two-vector adapter, without a competing
  coercion on degree-two forms. The linear equivalence from `TauCeti.SmoothTwoForm I M` to `SmoothForm I M ℝ 2`, its
  evaluation law and its closedness comparison (the pinned chartwise closedness is
  `mextDeriv = 0`) compare with the pinned old definitions as a migration check. *Acceptance:*
  the old independent carrier is removed; `Geometry/Symplectic/Manifold/{TwoForm,Energy}.lean`
  compiles on the generic carrier with closedness, nondegeneracy, the symplectic predicate,
  tameness, compatibility, constant-form normalization and energy identities preserved; and over
  `𝓘(ℝ, E)`, `mpullback` at a point where `f` is differentiable is the flat pullback
  `(φ (f x)).compContinuousLinearMap (fderiv ℝ f x)`. Add fixed-coefficient
  postcomposition `L_*ω` on smooth forms using the same native
  `ContinuousLinearMap.compContinuousAlternatingMap` operation. Its identity, composition, zero,
  addition and real-linearity API must agree with the rough form API; prove it preserves
  `SmoothForm` smoothness. Keep the coefficient spaces normed over `ℝ` and do not add a
  `[CompleteSpace]` requirement for this algebraic or calculus interface. Transfer the
  coefficient-postcomposition/paired-wedge compatibility from rough forms to bundled forms.
  **Checks.**
  - Membership in `smoothForms I M F k` is `IsSmoothForm I ∞` by definition: `x dy` on `ℝ²` is a
    member, the indicator form of 0.3 is not, and the zero form is; `smoothForms I M F k = 0` for
    `k > dim E`.
  - `SmoothForm I M ℝ 2` on `ℝ²` contains `dx ∧ dy` (0.1's `smoothForms_wedgeWith_mem`), and
    the migration of `TauCeti.SmoothTwoForm` sends a closed two-form to one with
    `mextDeriv = 0`; on `ℝ²` every `2`-form is closed because `3`-forms vanish, while
    `d(x dy) = dx ∧ dy ≠ 0` shows the predicate is not vacuous in degree `1`.
  - `CurvatureForm I ℝ (Trivial M ℝ)` is `SmoothBundleForm I (ℝ →L[ℝ] ℝ) (fun _ ↦ ℝ →L[ℝ] ℝ) 2`,
    where the curvature `dA` of a connection `d + A` on the trivial line bundle lives: for
    `A = x dy` on `ℝ²` it is `dx ∧ dy ≠ 0`, so `(d_∇)² = 0` is not a law of this carrier; over a
    curve every `CurvatureForm` is `0`; the flat connection has curvature `0`.

### Layer 1: the exterior derivative

*[Lee, Ch. 14].*

- **1.1 Definition.** For fixed coefficients (the trivial-bundle specialization),
  `mextDerivWithin` conjugates `extDerivWithin` through `extChartAt` on
  `(extChartAt I x).symm ⁻¹' s ∩ range I`, chart independence being `extDerivWithin_pullback`; then
  `mextDeriv`, locality, linearity (`mextDeriv_add` for `C¹` forms, `mextDeriv_smul`), agreement
  with Mathlib's `extDeriv` over the model space, and, for a `0`-form `RoughForm.ofFunction I f`,
  `d f = mfderiv f`.
  On an open subtype `U⊆E`, prove the flat degree-zero derivative law: after the degree-zero
  function identification and the flat one-form adapter of 0.3, the exterior derivative of an ambient
  function `g:E→F` with `ContDiffOn ℝ 1 g U` is the restricted field
  `z↦fderiv ℝ g z`. Consume native
  `extDeriv_constOfIsEmpty` and prove the open-subtype chart comparison. Prove the flat
  degree-one derivative law, for an ambient covector field that is `ContDiffOn ℝ 1` on `U`,
  identifying its derivative with native
  `extDeriv` after the arity-one identification. On the real plane, for
  `ω=P dx+Q dy`, this gives `dω=(∂ₓQ−∂ᵧP) dx∧dy`; in particular closedness is exactly
  the zero-curl equation, with the same real or complex coefficient space.
- **1.2 Naturality.** `mpullback_mextDeriv`: `f^*(dω) = d(f^*ω)` for a `C²` map and a `C¹` form,
  `At`, `On` and globally. The primary fixed-coefficient theorem is on the rough fixed-coefficient
  carriers of Layers 0.3 and 1.1: for every continuous real-linear `L : F →L[ℝ] G` and every rough
  form `ω` satisfying the `C¹` hypotheses required by `mextDeriv`, prove
  `mextDeriv (L_*ω) = L_*(mextDeriv ω)` in `At`, `On` and
  global forms. Prove its pointwise `Within` form on the same `RoughForm` carriers: for the
  chartwise `C¹`-within hypotheses required by `mextDerivWithin` and
  `UniqueMDiffWithinAt I s x`,
  `mextDerivWithin (L_*ω) s x =
  L.compContinuousAlternatingMap (mextDerivWithin ω s x)`. Here `UniqueMDiffWithinAt` is precisely the
  flat hypothesis
  `UniqueDiffWithinAt ℝ ((extChartAt I x).symm ⁻¹' s ∩ range I) ((extChartAt I x) x)`;
  this is its definition, with no additional set-membership premise. Prove the flat coefficient
  calculation using `fderivWithin_comp`, the `extDerivWithin` definition and alternatization,
  then lift through the source chart. Real and imaginary projections `ℂ →L[ℝ] ℝ` consume
  this general theorem, not separate coefficient carriers. No coefficient-completeness assumption is needed.
- **1.3 d² = 0 and regularity.** `mextDeriv_mextDeriv` for `C²` forms, and the new flat lemma that
  `extDerivWithin` takes `C^(n+1)` forms to `C^n` forms on a set of unique differentiability (in
  particular on `range I`), with its transfer `isSmoothForm_mextDeriv` and the smooth case
  `isSmoothForm_mextDeriv_infty`, which is what lets `d` map `Ω^k` to `Ω^(k+1)`. Use this
  regularity and Layer 0.4's coefficient-map smoothness preservation to derive the bundled
  `SmoothForm` mirror of Layer 1.2's coefficient naturality for `C^∞` forms. On bundled smooth
  real forms, `d` is the linear map `mextDerivₗ`, and the closed forms `closedForms I M k` are
  its kernel: closedness is the equation `mextDeriv φ = 0`, with any chartwise description a
  theorem about it.
  **Checks.**
  - On the model `𝓘(ℝ, E)` with `s = univ` the chart is the identity, so
    `mextDerivWithin φ univ x = extDeriv φ x`, Mathlib's flat derivative; on `[0, ∞)` over
    `𝓡∂ 1` the derivative within `range I = [0, ∞)` is unique at `0`, so `d(x) = dx` holds at
    the boundary point, where a definition using the open-set derivative would give the junk
    value `0`.
  - `mextDerivWithin φ ∅ x = 0`: the within-derivative on the empty set is `fderivWithin` on
    `∅`, Mathlib's junk value `0`; a definition claiming chart independence for every `s` would
    have to prove it for this value too, which holds.
  - `mextDeriv_add` needs `C¹`: on `ℝ²` let `φ = ∛x dy` and `η = (x − ∛x) dy`; then
    `φ + η = x dy` has `d = dx ∧ dy ≠ 0` at `0`, while `mextDeriv φ` and `mextDeriv η` are both
    the junk value `0` at `0`, neither coefficient being differentiable there. `mextDeriv_smul`
    holds with no hypothesis: for `c = 0` both sides are `0`, and for `c ≠ 0` both sides are
    junk or both are `c` times the derivative.
  - `mextDerivₗ` is `mextDeriv` on the underlying form; `mextDerivₗ ∘ mextDerivₗ = 0` (1.3) is
    what makes `TauCeti.deRhamComplex` a complex (6.1); in degree `dim E` it is the zero map.
  - `closedForms`: `dθ` on the circle is closed (every `1`-form on a `1`-manifold is) but not
    exact (6.3), so `closedForms ≠ exactForms`; `x dy` on `ℝ²` is not closed and
    `x dx + y dy = d(½(x² + y²))` is; in degree `0`, `closedForms I M 0` are the locally constant
    functions, two-dimensional on a two-point manifold.
- **1.4 Cartan calculus.** The vector-valued Leibniz law `mextDeriv_wedgeWith` for every fixed
  continuous bilinear pairing `μ`, with `C¹` hypotheses and unit constants, and its real
  multiplication specialization. This includes Lie brackets and the expression
  `dω + ½[ω ∧ ω]`. A base-dependent pairing has a derivative term; arbitrary bundle coefficients
  require a connection, and the covariant Leibniz law requires compatible connections on the
  pairing's three bundles. Then the invariant formulas
  through `mlieBracket` [Lee, Prop. 14.29, 14.32] (`mextDeriv_apply_one` in degree one), the Lie derivative of forms by the bracket
  formula (the Lie derivative of forms) [Lee, Cor. 12.33], and Cartan's magic formula [Lee, Thm. 14.35].
  *Acceptance:* on `ℝ²`, `d(x dy) = dx ∧ dy` and `d(dx) = 0`.
- **1.5 Flat coordinate and curve calculus.** Use the open-subtype flat adapter in 0.3 and
  the derivative comparisons in 1.1. On the real plane `ℂ`, with target coordinates `(u,v)`,
  let `φ(x,y)=(xy,1)`. Verify pointwise `φ*du=d(xy)=y dx+x dy`, `φ*dv=d(1)=0`, and
  `φ*(v du)=(v∘φ)φ*du=y dx+x dy`; obtain the last identity from pullback of a 0-form times
  a 1-form, not from fixed coefficient postcomposition. For the polar map
  `Φ:(0,∞)×ℝ→ℂ\{0}`, `Φ(r,θ)=(r cos θ,r sin θ)`, define
  `α=(-y dx+x dy)/(x²+y²)` and `β=(x dx+y dy)/(x²+y²)` on the punctured plane. Verify
  `Φ*α=dθ` and `Φ*β=dr/r`, and on `θ∈(0,2π)` verify the branch diffeomorphism onto
  `V=ℂ\{z : Im z=0, Re z≥0}` with inverse `r=|z|`,
  `θ=Im(log(−z))+π`. Consume `Complex.contDiffAt_log` at smooth order `∞` on its slit domain
  and transfer this complex `ContDiff` regularity to real `ContDiff` by restriction of scalars for the
  real smooth-form carrier. The angle is defined on this slit branch, and the primitive of
  `α+β` there is `θ+log r`.

  Also prove the flat pullback/change-of-path identity for open plane domains `U,V`, a source
  `γ : Path a b` whose ambient extension is `ContDiffOn ℝ 1` on `Set.Icc 0 1`, and an ambient
  map `φ₀:ℂ→ℂ` that is C¹ on an open neighborhood `N` of the path trace, with `N⊆U` and
  `φ₀(N)⊆V`, and a continuous real-linear 1-form field `ω` on `V`. Regard the source path as
  a path in the open subdomain `U₀=U∩N`.
  The pullback field is `z↦ω(φ₀ z)∘L fderiv ℝ φ₀ z`. Restrict `φ₀` to the relevant open
  subtype to form the continuous mapped path. For a native normalized `Path a b` in the open
  subtype, package `φ₀|U₀` as a continuous map `ψ:U₀→V` and use `γ.map ψ.continuous`
  with the interval `[0,1]`; the integral of
  the pullback along the source path equals the integral of `ω` along the mapped path. For the
  raw-curve version, take `γ:ℝ→ℂ` with `ContDiffOn ℝ 1 γ (Icc s₀ s₁)`, `s₀<s₁`, and
  trace in `U₀`; retain the C¹ hypothesis on `φ₀` near the trace. Include affine reparameterization for a
  different interval. For `TauCeti.Contour.IsPiecewiseC1On γ s₀ s₁`, use its actual continuity and
  finite-breakpoint witness, prove the identity on each closed piece, and sum adjacent
  interval integrals using the native adjacent-interval summation law; do not replace the
  raw-curve predicate by a `Path.trans` decomposition.
  Use complete normed real coefficient spaces. For native paths, derive `CurveIntegrable`
  from continuity of the field on the open domain and the C¹ path hypothesis via
  `ContinuousOn.curveIntegrable_of_contDiffOn`; expose this input when stating native
  concatenation laws. The raw contour integrand is `ω(γ(t))(deriv γ t)`; compare with native
  `derivWithin` away from the finitely many breakpoints and interval endpoints. Use
  `curveIntegral_eq_intervalIntegral_deriv` for that comparison and
  `intervalIntegral.sum_integral_adjacent_intervals` for raw pieces. Native `Path`
  concatenation separately uses `curveIntegral_trans`.

The general bundle carrier does not supply a canonical exterior derivative. A connection supplies
`d_∇`, whose square is curvature acting by wedge, `(d_∇)²ω = R_∇ ∧ ω`, rather than zero in general.
Layers 0–1 provide these form carriers and the fixed-coefficient calculus without imposing a
global trivialization on the value bundles. The Riemannian curvature construction remains in
Geometric Topology.

### Layer 2: orientations and the orientation double cover

*[Lee, Ch. 15]. Independent of layers 0–1 except in 2.2.*

- **2.1 Orientations.** An `OrientationLift` is a model orientation plus chart signs indexed by the
  points of each preferred chart's source — ⚠ never a total `M → M → ℤˣ`, whose off-source values
  would split the quotient without changing any tangent orientation — locally constant, and
  compatible with the sign of the transition Jacobian computed within `range I`;
  `Manifold.Orientation` is the quotient by the diagonal flip `OrientationLift.setoid`. Then
  `Manifold.Orientation.neg`, `orientationAt` (pinned by its characteristic equation: at the base
  point of a lift's own chart it is the model orientation twisted by the chart sign there),
  extensionality through it (`Manifold.Orientation.ext`), `Orientable`, and
  `Manifold.Orientation.eq_or_eq_neg` on preconnected `M`, with `o.neg ≠ o` on nonempty `M` and
  `orientationAt o.neg x = −orientationAt o x`.
  **Checks.**
  - On the empty manifold a lift is only a model orientation, and the diagonal flip identifies
    the two, so there is exactly one orientation and `o.neg = o`; `eq_or_eq_neg` holds and
    `o.neg ≠ o` fails, which is why the latter carries nonemptiness. On a nonempty connected
    orientable manifold there are exactly two.
  - `Set.Icc 0 1` with its two boundary charts has an orientation although no positive-Jacobian
    atlas exists (*Statements that must not enter the library*).
  - On `ℝ` with the single chart `id`, the lifts are `(μ, s)` with `s` a constant sign, and the
    two lifts `(μ, +1)` and `(−μ, −1)` have the same `orientationAt` at every point (`μ` twisted
    by `+1`, `−μ` twisted by `−1`), which is why `OrientationLift.setoid` identifies exactly the
    diagonal flip: a quotient flipping `μ` alone would identify `o` with `o.neg`, and
    `Manifold.Orientation.ext` would fail. `Orientable I M` uses the index `Fin (finrank ℝ E)`,
    so `card_eq` is automatic there.
- **2.2 Preserving maps and top forms.** `IsOrientationPreservingAt`, its reversing twin (the
  differential carries `orientationAt o x` to `−orientationAt o' (f x)`), the pullback
  orientation along local diffeomorphisms (`exists_isOrientationPreservingAt_pullback`) and
  product orientations [Lee, Prop. 15.15]. The pullback along `f : M → M'` of an orientation of
  `M'` indexed by `ι` requires `Fintype.card ι = finrank ℝ E`, the dimension of the source: for
  nonempty `M` this follows from the invertible differential of `f`, and for empty `M` it is
  exactly the condition for an orientation of `M` indexed by `ι` to exist. The pullback is
  constructed, not chosen. For `f` a `C^n` local diffeomorphism with `1 ≤ n`, `M` and `M'`
  `C^n` manifolds, `E'` finite-dimensional and `μ` an orientation of `E` indexed by `ι`, the chart
  sign `Manifold.Orientation.pullbackSign` of the chart at `x` at a point `y` of its source is the
  product of two signs. The first is `+1` exactly when `μ` is `orientationAt o' (f y)` carried
  back by the inverse differential of `f` at `y`. The second is the sign of the Jacobian
  determinant, within `range I`, of the change from the chart at `y` to the chart at `x`. Prove
  that these signs are locally constant on the chart source
  (`Manifold.Orientation.continuous_pullbackSign`). Prove that they satisfy the coordinate-change
  law of 2.1 (`Manifold.Orientation.pullbackSign_mul_pullbackSign`): the tangent factors cancel
  and the transition factors compose by the chain rule within `range I`, so this law needs only
  the `C¹` atlas of `M`. `Manifold.Orientation.pullback` is the class of the lift with these signs
  whose model orientation is that of a basis of `E` reindexed by `ι`. Prove that `f` preserves
  orientation from it at every point, which proves the existence theorem. Nowhere-vanishing
  continuous top forms ↔
  orientations (`exists_orientation_of_topForm`), the smooth direction under
  `[T2Space M] [SigmaCompactSpace M]` (`exists_topForm_of_orientation`) [Lee, Prop. 15.5]; the
  oriented-atlas criterion for boundaryless `C¹` `M`: `Orientable I M` holds exactly when `M`
  has an oriented atlas `TauCeti.IsOrientedAtlas I 1` (`orientable_iff_exists_atlas`)
  [Lee, Prop. 15.6]. The direction from an oriented atlas to an orientation holds over every
  model; the converse needs `[BoundarylessManifold I M]`.
  **Checks.**
  - Negative control for the boundaryless hypothesis: `Set.Icc 0 1` over `𝓡∂ 1` has an
    orientation (2.1) but no oriented atlas. A chart of the maximal atlas around `0` sends the
    boundary point `0` to the boundary point `0` of `[0, ∞)` and so is increasing near `0`; one
    around `1` sends `1` there and so is decreasing near `1`. Positive transition derivatives
    would make the sign of the derivative of the charts, read against the coordinate of
    `[0, 1]`, locally constant on the connected `[0, 1]`, and it is `+` at `0` and `−` at `1`.
  - On `ℝ`, the atlas `{id}` is oriented, and the atlas `{id, t ↦ −t}` (both in the maximal
    smooth atlas) is not, since its transition has derivative `−1`; an orientable manifold can
    carry a non-oriented atlas, so the criterion asks for some oriented atlas, not for the given
    one.
  - Negative control: the empty map from the empty manifold modelled on `ℝ²` to `ℝ` is a local
    diffeomorphism and `ℝ` has an orientation indexed by `Fin 1`, but the empty manifold has none
    indexed by `Fin 1` (`card_eq` would force `1 = 2`); the pullback statement without the
    dimension hypothesis is false.
  - Independence of the basis: replacing `μ` by `−μ` negates the tangent factor at every point
    (the carried-back orientation is `μ` or `−μ`, and `μ ≠ −μ`) and leaves the transition factor
    unchanged. So every pulled-back chart sign is negated, which is the diagonal flip, and the
    class is unchanged.
  - Base point: at `y = x` the transition factor is `+1`, because the change of chart is the
    identity near `extChartAt I x x` within `range I`, where derivatives are unique. So the
    pulled-back tangent orientation at `x` is `orientationAt o' (f x)` carried back by the inverse
    differential. For the reflection `t ↦ −t` of `ℝ` and the standard orientation, this is
    `(−1)⁻¹ · (+) = −`, the opposite orientation.
  - The transition factor is needed. Give `ℝ` the atlas whose chart is `t ↦ t` at points `≥ 0`
    and `t ↦ −t` at points `< 0`, and pull back the standard orientation along the identity with
    `μ` standard. At `y = 1` the chart at `0` gets the sign `(+1)(+1) = +1` and the chart at `−1`
    gets `(+1)(−1) = −1`. Their product, `−1`, is the sign of the transition `t ↦ −t` from the
    chart at `0` to the chart at `−1`. With the tangent factor alone both signs would be `+1`,
    and the coordinate-change law would fail.
  - The covering map `ℝ → S¹`, `t ↦ (cos t, sin t)`, pulls the counterclockwise orientation back
    to the standard orientation of `ℝ`; the reflection `t ↦ −t` reverses it.
  - The antipodal map of `S¹` preserves the orientation and that of `S²` reverses it (2.4).
- **2.3 Smooth structures on covers.** The charted structure induced on the total space by a covering map `p`, a constructor and ⚠
  never an instance on the type: lifted charts (the chart at a point of `X` is the chart of `M` at its image composed with the local inverse of `p`), `X` a manifold with
  `p` a local diffeomorphism, uniqueness as atlas compatibility, and smoothness
  of continuous lifts (smoothness of a map is detected after composing with the covering map). Shared with the Lie-groups roadmap's
  simply connected covers.
- **2.4 The orientation double cover.** The cover of pairs of a point and an orientation of its
  tangent space, with its projection, a topology that is ⚠ not the sigma topology (pinned by the
  covering property of the projection), the induced smooth structure, the canonical orientation
  and the orientation-reversing, fixed-point-free deck involution flipping the orientation. For
  connected `M`: orientable ↔ the cover is disconnected ↔ it has a section ↔ it is trivial, and
  `M` is orientable when `π₁` has no index-2 subgroup (`orientable_of_forall_index_ne_two`)
  [Lee, Thm. 15.41–15.43]. The **descent API** — the invariant and anti-invariant parts
  `(1 ± τ^*)/2` of a form under an involution `τ`, which sum to the form, commute with `d` for a
  `C²` involution and preserve compact support for a proper one, and the descent criterion (a form
  on the cover is a pullback from `M` exactly when it is deck-invariant) — is
  what 9.2's top-cohomology computation for nonorientable manifolds consumes. *Acceptance:* `Set.Icc x y` and spheres are orientable; the open Möbius band is
  not. Construct the outward orientation of Mathlib's native smooth unit sphere
  `S^n ⊂ ℝ^(n+1)`: a tangent basis `(b₁,…,bₙ)` is positive exactly when the ambient
  ordered basis `(x,dιₓ b₁,…,dιₓ bₙ)` has positive determinant in the standard coordinates.
  Consume `contMDiff_coe_sphere`, `range_mvfderiv_subtypeVal` and
  `injective_mvfderiv_subtypeVal_sphere` to construct this orientation and prove the criterion.
  Include n=0, with positive point +1 and negative point −1. Prove the antipodal map has
  orientation sign `(-1)^(n+1)`, hence reverses this orientation exactly for even n.
  These tangent-orientation constructions precede AT6.3's homological comparison.

### Layer 3: flows

*[Lee, Ch. 9 and 12]. Independent of 0–2 except the form half of 3.4.*

- **3.1 Smooth dependence, flat.** The local flow of a `C^(n+1)` field on a Banach space is
  `C^(n+1)` jointly in time and initial condition (`exists_contDiffAt_localFlow_of_completeSpace`);
  Tau Ceti has the finite-dimensional case. The hardest analysis in the layer, hence a milestone of
  its own.
- **3.2 The maximal flow.** `flowOf` and `flowDomain` read Tau Ceti's `maximalIntegralCurve` and
  `maximalIntegralCurveFlowDomain` in the `(t, x)` order — adapters, not a second flow. The
  fundamental theorem of flows [Lee, Thm. 9.12] is Tau Ceti's for finite-dimensional models:
  openness of `flowDomain`, joint smoothness of `flowOf` on it, the group law and the escape lemma
  [Lee, Lemma 9.19] are its `isOpen_maximalIntegralCurveFlowDomain`,
  `contMDiffOn_maximalIntegralCurve`, `maximalIntegralCurve_add` and
  `eventually_notMem_nhdsLT_maximalIntegralCurve` read in the `(t, x)` order. **The target is its
  extension to Banach models**, joint openness and joint smoothness with `[CompleteSpace E]`
  (`isOpen_maximalIntegralCurveFlowDomain_of_completeSpace`,
  `contMDiffOn_maximalIntegralCurve_of_completeSpace`), stated for Tau Ceti's own objects; this is
  where 3.1 enters.
- **3.3 Completeness and homogeneity.** `IsCompleteVectorField`, the uniform-time criterion,
  compactly supported completeness (`isCompleteVectorField_of_isCompact`, [Lee, Thm. 9.16]) and
  compact-manifold completeness (`isCompleteVectorField_of_compactSpace`, Tau Ceti's
  `isMIntegralCurve_maximalIntegralCurve` in the `flowDomain` form), the flow of a complete vector
  field as a Mathlib `Flow ℝ M` (`toFlow`, whose maps are `flowOf` by `toFlow_apply`); and
  homogeneity `exists_flowOf_one_eq` on connected boundaryless finite-dimensional `M` — ⚠ false
  Banach-generally, where every compactly supported continuous field is zero. The flow of a
  left-invariant field on a Lie group is Tau Ceti's `mulInvariantIntegralCurve`, reconciling with
  the Lie-groups roadmap's invariant curves.
  **Checks.**
  - `v = 1` on `ℝ`: `flowOf v t x = x + t`, `flowDomain v = univ`, so `IsCompleteVectorField v`,
    and `toFlow` is the translation flow, its group law `(x + t) + s = x + (t + s)`.
  - `v = x²` on `ℝ` from `x = 1`: the maximal curve is `t ↦ 1/(1 − t)`, so `(t, 1) ∈ flowDomain v`
    exactly for `t < 1`, the field is smooth but not complete, and the group law is asserted
    only on the domain: `(½, 1)` and `(½, flowOf v ½ 1) = (½, 2)` are both in it only if
    `(1, 1)` is, and it is not.
  - `v = 0`: `flowOf v t x = x` and `flowDomain v = univ`; the rotation field `(−y, x)` of `ℝ²`
    flows by rotation, `toFlow` at time `π/2` sending `e₁` to `e₂`, and is complete although
    not compactly supported, so compact support is sufficient and not necessary.
- **3.4 Naturality, straightening, commuting flows.** Conjugate flows of related fields
  (`flowOf_comp_of_related`, [Lee, Prop. 9.6]), the straightening theorem `exists_chart_mfderiv_eq_const` [Lee, Thm. 9.22], the
  flow characterization of the bracket `hasDerivAt_mpullback_flowOf` [Lee, Thm. 9.38], commuting
  flows and the canonical form for commuting fields [Lee, Thm. 9.44, 9.46], and Lie derivatives of
  forms via flows [Lee, Thm. 12.37]. *Acceptance:* constant fields flow by translation, the rotation
  field of `ℝ²` by rotation.
- **3.5 Time-dependent flows** [Lee, Thm. 9.48]. For an open time slab
  `J : TopologicalSpace.Opens ℝ` and a smooth time-dependent field on `↥J × M`,
  build the maximal two-time flow by suspending to the autonomous field `(1,X)`.
  Use the open-submanifold and product atlases of `↥J × M`. First build the
  finite-dimensional specialization directly from the native autonomous maximal
  flow on this suspension (`suspendedTimeField`): openness of `timeDependentFlowDomain` and joint
  smoothness of `timeDependentFlow` on it. Its flow-law,
  inverse and extension adapters likewise consume the native finite-dimensional
  laws, independently of 3.1's Banach ODE theorem. The general Banach specialization uses the
  3.1–3.2 Banach smooth-dependence/open-domain extension. Prove open maximal
  domain, joint smoothness in initial point and both times, identity,
  two-time composition, inverse partial diffeomorphisms (`timeDependentFlow_spec`, for Banach
  models), restriction/naturality, and the compact-time escape criterion. On finite-dimensional Hausdorff
  boundaryless manifolds, a trajectory remaining in a compact subset through
  a compact time interval inside J extends through that interval; compact M
  gives global flow on every such interval (`timeDependentFlowDomain_eq_univ`, for an interval J). The two-time domain is the open
  subset of `J × J × M`, in the order `(t,s,x)`, where the suspended solution through `(s,x)` exists
  at elapsed time `t−s`; its M component is the requested flow. Keep the existing
  `exists_timeDependentFlow` as the independent C¹ Banach local target on
  ℝ×M, proved via 3.1; it is not asserted to follow from the C∞ slab theorem.
  For a disconnected open J, the maximal domain stays within the connected
  time component of its initial time, as the suspension domain requires.
  HeegaardFloer Lane F2, item 1 (its symplectic and almost-complex foundations, Darboux and
  Moser) uses the full finite-dimensional specialization,
  including its compact-time extension, smooth dependence on both time
  variables and initial point, and restriction/naturality. SBC B5 consumes
  this same finite-dimensional specialization.
  **Checks.**
  - `suspendedTimeField J v` at `(s, x)` is `(1, v s x)`: its time component is the unit field,
    so the suspended curve through `(s, x)` has time coordinate `s + τ` at elapsed time `τ`,
    which is why `timeDependentFlowDomain` reads the suspended domain at elapsed time `t − s`.
    For an autonomous `v`, `timeDependentFlow J v t s x = flowOf v (t − s) x`.
  - `v s x = s` on `M = ℝ`, `J = ℝ` (the equation `x' = s`): the solution through `(s, x)` is
    `x + (t² − s²)/2`, so `timeDependentFlow J v t s x = x + (t² − s²)/2`; the two-time law reads
    `(r² − t²)/2 + (t² − s²)/2 = (r² − s²)/2`, and a definition reading the elapsed time as
    `s − t` would give `x + (s² − t²)/2`, which does not solve the equation.
  - `v s x = x²` on `ℝ` with `J = ℝ`: through `(s, 1)` the solution `1/(1 − (t − s))` exists for
    `t < s + 1`, so `timeDependentFlowDomain` is open and proper; for `v = 0` it is everything.
    For a disconnected `J = (0, 1) ∪ (2, 3)` and `v = 0`, a triple with `s ∈ (0, 1)` and
    `t ∈ (2, 3)` is not in the domain, because the suspended curve in `↥J × M` leaves `↥J` at
    elapsed time `1 − s`: the domain stays in the time component of the initial time.

### Layer 4: distributions, Frobenius and leaves

*[Lee, Ch. 19]. The Frobenius and leaf theorems in this layer concern smooth,
finite-dimensional real manifolds. No Banach or merely continuous Frobenius
theorem is a completion requirement.*

**Canonical interfaces and reuse.** A distribution is the existing family
`D : (x : M) → Submodule ℝ (TangentSpace I x)`. Its local frames and regularity
are `TauCeti.IsDistributionFrameOn` and `TauCeti.IsContMDiffDistribution`;
involutivity is `TauCeti.IsInvolutiveDistribution`. The latter tests vector
fields that are differentiable and tangent to `D` on an open set. It does not
test arbitrary continuous fields, and it is not defined only by globally
smooth sections. `TauCeti.Foliation` is the existing bundled foliation data.
Extend these interfaces; do not introduce an independent distribution,
involutivity or foliation implementation.

The existing implementation is in
`TauCeti/Geometry/Manifold/Distribution.lean`,
`TauCeti/Geometry/Manifold/Foliation/Basic.lean`, and
`TauCeti/Geometry/Manifold/Distribution/Graph.lean`. The last file already
provides graph distributions, their involutivity criterion, and the local
integral-graph theorem
`TauCeti.IsInvolutiveDistribution.exists_eventually_hasFDerivAt`, using
`TauCeti/Analysis/ODE/Frobenius.lean`. These are consumed, not scheduled again.

Every headline of this layer takes the family `D` with the hypotheses
`TauCeti.IsContMDiffDistribution I ∞ k D` (rank `k`, smooth local frames) and,
where needed, `TauCeti.IsInvolutiveDistribution I D`, and concludes the latter
where involutivity is the conclusion. The only definition `Suggested.lean`
adds is the bundled integral manifold `Distribution.IntegralManifold` of 4.2.
At the Tau Ceti revision the content repository pins, that bundle is
`TauCeti.IntegralManifold` (`Geometry/Manifold/Distribution/IntegralManifold.lean`),
which also asks for a nonempty carrier; the declaration of `Suggested.lean` is
that target's signature, never a second definition.

- **4.1 Distributions and frames.** Consume the existing rank, frame,
  regularity, constant-distribution and contact-distribution APIs. Add the
  restriction, coordinate-transport and annihilator lemmas needed by the
  remaining geometry to those APIs. A frame is a basis of the distribution
  fiber, not just a list of tangent vectors. Existing results are not new
  completion targets.

- **4.2 Integral manifolds and involutivity.** An integral immersion has its
  own smooth `k`-dimensional manifold carrier and a smooth immersion into `M`
  whose differential has image exactly `D` at every point (the bundled data
  `Distribution.IntegralManifold`, over the family `D` itself; regularity and involutivity are
  `TauCeti.IsContMDiffDistribution` and `TauCeti.IsInvolutiveDistribution`). Define the
  unbundled predicate and the bundled data, with their evaluation laws.
  A parametrizing immersion need not be injective. Distinguish it from an
  injectively immersed integral submanifold.

  State `isInvolutive_of_forall_exists_integralManifold` for a smooth
  distribution on a smooth Hausdorff boundaryless manifold, with smooth
  integral immersions through every point. Its conclusion is the canonical
  local differentiable-section predicate. There is no `n = 0` version of
  this implication in the roadmap.

  For a smooth distribution on a Hausdorff smooth manifold, prove the
  annihilating-one-form criterion `isInvolutive_iff_forall_mextDeriv` with
  the hypotheses displayed in `Suggested.lean`. Global smooth sections and
  global annihilating forms can be used through local bump extensions;
  they do not replace the local definition of involutivity.

  **Checks.**
  - `Distribution.IntegralManifold`, constant family: the affine slice `u ↦ (u, c)`,
    `ℝ^k → ℝⁿ`, is an integral manifold of `span(e₁, …, e_k)` with carrier `ℝ^k`; the
    differential of the slice at every point has image exactly `span(e₁, …, e_k)`.
  - Equality, not containment: for `j < k` the immersion `u ↦ (u, 0, c)` of `ℝ^j` into the
    slice has differential image a proper subspace of `span(e₁, …, e_k)`, so it is not an
    integral manifold of the constant family with carrier dimension `j`. With `≤` in place of
    `=` it would be one, and every family of positive rank, the contact one included, would have
    one-dimensional integral manifolds (the integral curves of a frame field) through every
    point. When the carrier dimension is the rank, as in the headlines, `≤` and `=` agree,
    because the differential of an immersion is injective.
  - Its own topology: the irrational line `t ↦ (t, αt)` on the torus `ℝ²/ℤ²` is an integral
    manifold of the constant-slope family with carrier `ℝ` and dense image; its image with the
    subspace topology is not a manifold, so a carrier given by the image would be wrong.
  - The hypotheses of the headlines: the constant family satisfies
    `TauCeti.IsContMDiffDistribution` at rank `k` with the constant frame, rank `0` being `⊥`
    with the empty frame and rank `dim E` being `⊤`; the family on `ℝ` that is `span(∂x)` off `0`
    and `0` at `0` satisfies it at no rank (rank `1` fails at `0`, rank `0` off `0`). The contact
    family `ker(dz − y dx)` on `ℝ³` satisfies it at rank `2` with the global frame `∂y`,
    `∂x + y ∂z`, and is not involutive: `X = ∂x + y ∂z` and `Y = ∂y` are tangent to it, and
    `[Y, X] = ∂z` is not, since `dz(∂z) − y dx(∂z) = 1`.
  - Involutivity is tested locally: on the non-Hausdorff manifold of *Statements that must not
    enter the library* every global section satisfies the bracket condition, while the local pair
    `X`, `Y` on the central chart has bracket `−∂z` outside the family, so
    `TauCeti.IsInvolutiveDistribution` fails there, as it must, and a global-sections-only
    predicate would wrongly hold.

- **4.3 Local Frobenius.** On a finite-dimensional smooth Hausdorff
  boundaryless manifold, an involutive smooth distribution has flat charts
  and local integral slices (`Distribution.exists_flatChart`,
  `Distribution.exists_isSliceChart_integralManifold`). Transport the distribution into coordinates,
  choose a complementary subspace, and express it locally as a graph
  distribution. Reuse the existing graph-coordinate Frobenius theorem.
  The remaining work includes the coordinate reduction and the transverse
  parameter/local-diffeomorphism argument producing a flat chart; existence
  of one integral graph alone is not a flat-chart theorem. Connect the
  resulting slices to the existing `TauCeti.IsSliceChart` interface and
  prove the chart statement adapted to a transverse submanifold.

  Prove weak embeddedness for injectively immersed integral submanifolds
  with second-countable carriers. The factorization target here is for
  smooth maps from finite-dimensional smooth Hausdorff second-countable
  boundaryless source manifolds (`Distribution.exists_contMDiff_factor`). Do not assert it for an
  arbitrary parametrizing immersion or an uncountable discrete carrier.

- **4.4 Global leaves** [Lee, Thm. 19.21]. Construct the leaf through every point on a smooth
  Hausdorff boundaryless manifold, for an involutive smooth distribution. Give it its own charted
  carrier, not the subspace topology on its image. Prove that it contains the specified
  point, is connected, has injective inclusion, and contains the image of every connected smooth
  integral immersion meeting it (in particular of every one through the point). Prove that the
  leaf images partition `M` (two leaves that meet contain each other) and that leaves are second
  countable when `M` is second countable. `Distribution.exists_leaf` states existence with all
  these properties.
  **Checks.**
  - Rank zero: the leaves are the points of `M`; rank `dim M`: the leaves are the connected
    components with their manifold structure.
  - The line of irrational slope on the torus `ℝ²/ℤ²` is a leaf whose inclusion is injective with
    dense image; its carrier is `ℝ`, and the subspace topology on the image is not locally
    connected, so a leaf carried by its image would be wrong.
  - Maximality only among *connected* integral manifolds: a disjoint union of two plaques of
    different leaves is an integral manifold meeting a leaf without lying in it. Develop these results on the existing distribution
  and foliation interfaces. No assertion of a boundaryless leaf through
  every boundary point is made: the full tangent distribution on `[0, ∞)`
  rules out that generalization.

**Acceptance examples.** Constant distributions give affine slices. Reuse
`TauCeti.standardContactDistribution` and its noninvolutivity theorem. To
retain the displayed convention `ker(dz − y dx)` on `EuclideanSpace ℝ (Fin 3)`,
use the coordinate equivalence `S(x,y,z) = (y,x,z)` into `ℝ × ℝ × ℝ`; the
existing convention there is `ker(dz − x dy)`. The adapter's fiber must be
`S⁻¹` of the existing fiber at `S p`, with the coordinate formula proved.
Do not construct a second contact-distribution theory. The pointwise
contact-bracket calculation gives the stronger statement that there is
no integral surface through any point; negating the global
integrability-implies-involutivity statement alone does not give that
stronger quantifier order.

### Layer 5: integration and Stokes' theorem

*[Lee, Ch. 16]. See *Boundary and corners*.*

- **5.1 The boundary interface**, over `𝓡∂ (n+1)`, on Tau Ceti's boundary manifold:
  restriction of forms to the boundary as pullback along the inclusion, commuting with `d`;
  `IsOutwardPointing` with a smooth outward field (`exists_isOutwardPointing`, [Lee, Prop. 15.33]);
  the outward-first boundary orientation, characterized by the outward-first rule
  [Lee, Prop. 15.24]; the half-space sign for Mathlib's model; and nullity of the boundary,
  read through charts against Haar measure on the model.
  For the unit closed ball in `ℝ^(n+1)`, consume Tau Ceti's
  `instChartedSpaceClosedBall`, `instIsManifoldClosedBall`,
  `contMDiff_subtypeVal_closedBall` and `boundary_closedBall`. Construct the smooth
  diffeomorphism from this manifold boundary to Mathlib's native `S^n`, with underlying
  map the identity on ambient points, and prove the boundary orientation agrees with
  2.4's outward orientation of `S^n`. Orient the ball by its ambient inclusion and
  prove the derivative criterion and the outward radial-field law. Include n=0, the
  interval: its right endpoint is positive and its left endpoint negative.
  **Checks.**
  - On `[0, ∞)` over `𝓡∂ 1`, at the boundary point `0` the vector `−∂ₜ` is outward
    (`IsOutwardPointing`: the constrained coordinate of its chart image is `−1 < 0`) and `+∂ₜ`
    is not; at an interior point no vector is outward, by the first conjunct.
  - On the closed half-plane `{x₀ ≥ 0}`, at a boundary point `−e₀ + 5 e₁` is outward and `e₁`
    is not: only the constrained coordinate decides, and a definition reading the last
    coordinate ([Lee]'s convention) would test the wrong one.
  - The zero vector is never outward (`0 < 0` fails), so an outward field is nowhere zero on
    the boundary, which `exists_isOutwardPointing` must respect.
- **5.2 Integration of top forms.** The integral `∫_M ω` of a top form against an orientation `o`, total, pinned by
  its chart formula: chart integrals of the coefficient in a positively
  oriented basis against its `addHaar`, weighted by the chart signs, glued by a partition of unity.
  Independence of basis, chart (Jacobian change of variables; the boundary is null), partition,
  cover and lift; then linearity, sign reversal under the opposite orientation, positivity (⚠ for
  compactly supported forms only), and invariance under orientation-preserving and sign change under
  reversing diffeomorphisms [Lee, Prop. 16.6].
- **5.3 Stokes.** `∫_M dω = ∫_{∂M} ι^*ω` for a compactly supported `C¹`
  `n`-form on an oriented `C^∞` manifold over `𝓡∂ (n+1)`, by partition of unity and the half-space
  case of the flat divergence theorem. Corollaries: `∫_M dω = 0` on
  boundaryless `M`, the interval case against `intervalIntegral`, the smooth-boundary
  specialization of Green's theorem, and agreement with `curveIntegral`. The planar
  post-manifold comparison theorem is owned by 12.6, after the flat 5.6 theorem.
- **5.4 The homotopy operator.** The homotopy operator `K` on `M × Icc 0 1`, with its defining identity:
  for a `C¹` form `ω` with values in a complete space, `hω` is `C¹` and
  `ι₁^*ω − ι₀^*ω = d(hω) + h(dω)`, proved directly rather than through Stokes, so `M` may have
  boundary. Prove preservation of `C^r` regularity for every r≥1, including
  `C^∞`, by differentiation under the compact interval integral. Prove naturality
  under pullback: `f* h(ω)=h((f×id)*ω)`, including inclusions of parameter slices.
  For a smooth star-shaped chart contraction to x₀, prove the resulting radial
  primitive vanishes at x₀. For the coordinate regression, let `D_r(a)={p : ℂ | |p−a|<r}`
  with `r>0`, as an open subtype with model `𝓘(ℝ,ℂ)`, and use the contraction
  `H : D_r(a) × Icc 0 1 → D_r(a)`, `H(p,t)=a+t(p−a)`, with the `D_r(a)` variable first.
  Write `u=Re(p−a)`, `v=Im(p−a)`. For a real coefficient `A∈C¹(D_r(a),ℝ)`, set
  `I(u,v)=∫₀¹ t A(a+t(u+iv))dt` and `η=−vI dx+uI dy`. Prove the actual comparison
  `K (H^*(A dx∧dy)) = η` with this slot order and sign, and prove `η` is
  `C¹`, vanishes at `a`, and satisfies `∂ₓ(uI)−∂ᵧ(−vI)=A`. For smooth `A`, prove the
  output is smooth. This pins the coordinate formula to the existing operator.
  For a smooth real- or complex-valued closed one-form `ω=P dx+Q dy` on the same disk,
  prove the degree-one comparison
  `K (H^*ω)(p)=u∫₀¹ P(a+t(p−a))dt+v∫₀¹ Q(a+t(p−a))dt`.
  This function g is smooth, satisfies `g(a)=0` and `dg=ω`, and is the unique primitive
  normalized to vanish at a. In coordinates, prove `∂ₓg=P` and `∂ᵧg=Q` from
  `∂ᵧP=∂ₓQ`; differentiation under the compact parameter integral and FTC give the
  comparison directly. The formula at a=0 is `g(x,y)=x∫₀¹P(tx,ty)dt+y∫₀¹Q(tx,ty)dt`.
  `planarRadialPrimitive` is this coordinate formula, and `planarRadialPrimitive_hasFDerivAt`
  states `dg = ω` on the disk.
  **Checks** (for `planarRadialPrimitive` with `a = 0`).
  - `P = 1`, `Q = 0` (the form `dx`): `g(z) = x`, with `dg = dx` and `g(0) = 0`.
  - `P = x`, `Q = y` (the exact form `d(½(x² + y²))`): `g = x · x/2 + y · y/2 = (x² + y²)/2`,
    the primitive vanishing at the centre.
  - `P = −y`, `Q = x` (not closed, curl `2`): `g = x ∫₀¹ (−ty) dt + y ∫₀¹ tx dt = 0`, so
    `dg = 0 ≠ ω`; the closedness hypothesis of `planarRadialPrimitive_hasFDerivAt` is necessary.
    For every `P`, `Q`, `g(a) = 0`, both factors `(z − a).re` and `(z − a).im` vanishing at `a`.
  For the separate vertical-disk formula, let `D={x+iy: |x+iy-a|<r}`, `r>0`,
  `a=a₁+ia₂`, and let `ω` be a smooth `F`-valued 2-form on `D`, for any complete normed real
  space `F`. Define its scalar-coordinate coefficient by `f(z)=−ω_z(1,i)`, since
  `(dy∧dx)(1,i)=−1`; thus `ω=f dy∧dx`. For `z=x+iy∈D`, first show its horizontal
  projection `x+i a₂` also lies in `D` (it is no farther from the center `a` than `z`); the
  disk's convexity then keeps the vertical segment from `x+i a₂` to `z` in `D`. Use the
  fixed-interval formula
  `p(x+iy)=(y−a₂)∫₀¹ f(x+i(a₂+s(y−a₂))) ds`.
  Supply the local parameter-integral lemma: a jointly `C^n` function on an open neighborhood
  of `{z₀}×[0,1]`, with complete coefficient space, has a `C^n` parameter integral near
  `z₀`, including `n=∞`. Compactness of `[0,1]` gives a common parameter neighborhood;
  prove the differentiation formulas there without requiring a globally smooth extension.
  Apply it to prove smoothness of `p`. Separately use affine substitution to identify
  `p(x+iy)=∫_{a₂}^{y} f(x+it)dt`, and apply FTC to obtain `p_y=f`.
  Then `d(p dx)=p_y dy∧dx=ω`. Keep this coordinate primitive distinct from the
  radial homotopy formula above.
  For a jointly smooth family on `N×U`, take U to
  be the star-shaped form domain with a fixed smooth contraction to x₀; N is
  an arbitrary smooth parameter manifold. Apply the homotopy in U with N fixed
  and prove that slicing commutes with it; positive-degree closed slice forms
  then have jointly smooth primitives. No contraction of N is required. Separately, Stokes on
  `M × Icc 0 1` for boundaryless `M`, which 10.5's homotopy invariance of the degree consumes.
- **5.4a Contraction along a map and differentiation of pullback.** This
  extends layers 0–1 on their existing arbitrary `ModelWithCorners` and
  fixed-coefficient form carriers, retaining the stated smoothness and
  `Within` derivative hypotheses at boundary/corner points. Let F be a
  normed real space, p:M→N smooth and V a smooth section of p*TN. Follow
  Mathlib's `Manifold.DifferentialForm`/`ContMDiffSection` design in
  [the manifold-form proposal](https://github.com/leanprover-community/mathlib4/pull/45315)
  for the scalar bundled case; realize the fixed-F extension on the same
  native alternating bundle through layers 0–1. For an
  F-valued form ω of degree k≥1, construct the degree-(k−1) form
  `C_(p,V)(ω)_x(v₁,…,v_(k−1))=ω_(p(x))(V_x,dp_x(v₁),…,dp_x(v_(k−1)))`.
  Use native `ContinuousAlternatingMap.curryLeft` in the first slot and
  pullback in the remaining slots; V need not descend to a field on N.
  Prove smoothness for smooth ω, linearity and open restriction. For smooth
  h:L→M and q:N→Q, prove the actual naturality equations
  `C_(p∘h,V∘h)ω=h*(C_(p,V)ω)` and
  `C_(p,V)(q*η)=C_(q∘p,dq∘V)η`.
  Contraction of a zero-form is zero by convention; introduce no
  negative-degree form carrier. For ω of degree k and η of degree l with
  k+l≥1 and any fixed continuous bilinear coefficient pairing μ, prove
  `C_(p,V)(wedgeWith μ ω η)=wedgeWith μ (C_(p,V)ω) (p*η)
    +(−1)^k wedgeWith μ (p*ω) (C_(p,V)η)`, omitting each term that
  would contract a zero-form. Both zero-degree inputs have zero contraction.

  For jointly smooth P:M×J→N on an open real interval J, put p_t(x)=P(x,t)
  and V_t(x)=dP_(x,t)(0,1). For a smooth fixed-coefficient F-valued form ω,
  prove `∂_t(p_t*ω)=d(C_(p_t,V_t)ω)+C_(p_t,V_t)(dω)`; in degree zero
  prove `∂_t(f∘p_t)=C_(p_t,V_t)(df)`. Differentiate in the fixed
  alternating-form fiber over x, with coordinate-independent evaluation on
  tangent tuples. Prove joint smoothness with extra finite-dimensional
  parameters and the restriction/naturality laws. Apply Cartan calculus to
  P*ω on M×J, contract with its parameter field, then restrict to the slice.
  No completeness of F or boundaryless hypothesis is needed for this
  pointwise calculus. For a jointly smooth family of forms ω_t, prove
  `∂_t(p_t*ω_t)=p_t*(∂_tω_t)+d(C_(p_t,V_t)ω_t)+C_(p_t,V_t)(dω_t)`.
  For a flow of X_t, prove `C_(p_t,V_t)ω=p_t*(ι_(X_t)ω)` and identify
  this moving-form identity with the pullback derivative of the Moser argument in
  HeegaardFloer Lane F2, item 1.

  When J contains [0,1] and F is complete, identify
  `K_Pω=∫₀¹ C_(p_t,V_t)ω dt` with 5.4's `K(P*ω)` on
  M×[0,1], with manifold variable first and contraction slot first.
  Integration gives exactly `p₁*ω−p₀*ω=d(K_Pω)+K_P(dω)`, preserving the
  existing regularity/naturality API. No invertibility of p_t is required.
  In the flat model, `contractionAlongMap` and `familyContraction` are the native
  Euclidean insertion, and `moving_pullback_hasDerivAt` is the fixed-form derivative identity.
  **Checks.**
  - `contractionAlongMap id e ω` is the interior product `ι_e ω`: for `ω = dx ∧ dy` and
    `e = e₁`, `(dx ∧ dy)(e₁, w) = w₂`, so the result is `dy`; inserting `V` in the last slot
    instead would give `(dx ∧ dy)(w, e₁) = −w₂`, the opposite sign in odd degree.
  - In degree one, `contractionAlongMap id e (dy)` is the function `dy(e)`: `0` for `e = e₁`
    and `1` for `e = e₂`; the contraction of a `0`-form is `0` by convention.
  - `familyContraction` for the translation family `P(x, t) = x + t e₁` on `ℝ²` and
    `ω = x dy`: `V_t = e₁`, `p_t^* ω = (x + t) dy` has `∂_t = dy`, and the identity
    `∂_t(p_t^* ω) = d(C ω) + C(dω)` gives `d(x · dy(e₁)) + ι_{e₁}(dx ∧ dy) = 0 + dy`, as it must.
- **5.5a Densities, for every finite-dimensional real model.** `Density`,
  `RoughDensity`, the density `φ · sign_o` of a top form and an orientation, the integral of
  densities, and its agreement with the integral of top forms give orientation-free integration
  [Lee, Ch. 16, "Densities"]. Prove independence of chart, basis and partition
  by the absolute determinant change-of-variables formula. This uses 5.2's
  integral construction and not 5.5b's faces or corner Stokes. Retain the
  elementary gates: the half-space interval FTC from 5.3,
  `|∫_{S¹} dθ|=2π` for `circleAngularForm`, the pullback to the circle of the plane form
  `x dy − y dx` (`planeAngularForm`), and the unit-square Green formula
  from the independent flat theorem. Circle volume and 12.4 consume this lane.
  **Checks.**
  - `Density V m` with `m < dim V` is forced to be `0` on every tuple: a linearly independent
    `m`-tuple `v` is carried to `2v` both by `2 · id`, of determinant `2^dim`, and by the map
    doubling `span v` and fixing a complement, of determinant `2^m`, so
    `(2^dim − 2^m) · toFun v = 0`; and a linearly dependent `m`-tuple with `m ≤ dim V` has value
    `0`, through a projection `T` with `T ∘ v = v` and `det T = 0`.
  - For `m = dim V` a `Density` is determined by its value on one basis `v`, every basis being
    `T ∘ v` with `T` invertible: `Density V (dim V) ≅ ℝ`; and it is not a top form: on `ℝ` the
    form `dx` has `dx(−1) = −1` while a density satisfies `toFun (−1) = |−1| · toFun 1`, so
    `v ↦ dx v` is not a `Density`.
  - `planeAngularForm` at `z = 1` is `dy` and at `z = i` is `−dx`, each giving `1` on the
    counterclockwise unit tangent; pulled back along `t ↦ exp(it)` it is
    `cos t · cos t dt − sin t · (−sin t) dt = dt`, so its integral over `[0, 2π]` is `2π`, and
    the convention `y dx − x dy` would give `−2π`. At `z = 0` the form is `0`.
  - `circleAngularForm` at `z = x + iy` on the tangent vector `iz = −y + ix` is
    `x · x − y · (−y) = 1`; it vanishes nowhere, hence orients the circle, is closed, and is not
    exact, since `|∫_{S¹} dθ| = 2π ≠ 0` while an exact `df` integrates to `f(end) − f(start) = 0`
    around the loop. `RoughDensity I M (dim)` contains `|ω|` for every top form `ω` and the
    Riemannian density of 12.4, whose value on the standard basis of flat `ℝⁿ` is `1` and on
    `T ∘ e` is `|det T|`.
- **5.5b Smooth faces, abstract boundary and corner Stokes.** Supply the
  following additional geometric **data**, the smooth face structure on `M` (a structure
  bundling the local quadrant data below), on a
  Hausdorff second-countable smooth n-manifold, n≥1. It is not a placeholder
  proposition and is not inferred from convexity of `range I`.

  **Local quadrant data.** Give a covering by open U⊆M and homeomorphisms
  `q_U:U≃ₜV_U`, where V_U is relatively open in the standard quadrant
  Q^n=[0,∞)^n. Both directions are smooth for the given I-atlas and the
  native quadrant model. On every overlap and at every point give the
  bijection of germs of vanishing coordinate hypersurfaces induced by the
  transition diffeomorphism. Require its compatibility with composition,
  inverses and restriction, and identify its restriction on a face with a
  smooth diffeomorphism of the corresponding (n−1)-dimensional quadrant
  charts. The transition maps preserve inward normal rays in the quotient
  tangent lines. This is concrete compatible face-atlas data; no choice of
  global labels or globally embedded connected faces is required. Prove
  compatibility with the native intrinsic interior/boundary: a point is
  interior exactly when all these local coordinates are positive, and
  its depth is the number of zero coordinates, invariant on overlaps.

  **Boundary carrier and its charts.** Construct `LocalBoundaryGerm x` by
  gluing the germs `{i : Fin n | (q_U x)_i=0}` under those overlap bijections;
  prove its independence of chart and `Fintype` equivalences with those sets.
  Define `∂̃M=Σ x:M, LocalBoundaryGerm x`, with projection j. The structure
  also selects its finite-dimensional boundary model J (of dimension n−1)
  and compatible smooth atlas. Over U it is the disjoint union of
  `{z∈V_U | z_i=0}`, with coordinate deletion and smooth comparison to the
  standard Q^(n−1) face model. Select that quadrant model for the standard
  corner construction and the existing Euclidean model for the half-space
  boundary. Rechart through a fresh carrier when the comparison changes
  model; never install two conflicting canonical atlases on one type.
  Prove the overlap/cocycle laws, Hausdorffness, second countability, and
  that j is a smooth proper immersion with image `I.boundary M`. Each fibre
  is exactly the finite set of local germs; at depth d it has d elements,
  not one element obtained by forgetting multiplicity. Show local finiteness
  over M from the finite sheets over each face chart, and properness by a
  finite shrunk-chart cover of compact subsets. In dimension zero define
  the abstract boundary to be empty and retain the signed-point integral.

  **Instances and coherence.** Construct the data for the native half-space,
  identify its abstract boundary and projection smoothly with Tau Ceti's
  existing boundary subtype/inclusion, and match 5.1's orientation. For Q^n
  the carrier is the disjoint union of its n coordinate facets (empty for
  n=0); include n=1 and n=2 with their actual endpoint/corner multiplicities.
  The standard simplex is the full-dimensional `fullSimplex p = {x ∈ ℝᵖ | 0 ≤ xᵢ, Σ xᵢ ≤ 1}`,
  with the affine homeomorphism `fullSimplexEquivStdSimplex` onto Mathlib's barycentric
  `Convexity.StdSimplex ℝ (Fin (p + 1))` (weight `1 − Σ xᵢ` at `0`, weight `xᵢ` at `i + 1`);
  ⚠ the barycentric simplex lies in a hyperplane and is not the domain to integrate over.
  **Checks** (for `fullSimplex` and `fullSimplexEquivStdSimplex`).
  - `p = 0`: `fullSimplex 0 = {0}` (the empty sum is `≤ 1` and there are no coordinates) and
    `StdSimplex ℝ (Fin 1)` is the single weight `1`.
  - `p = 1`: `fullSimplex 1 = [0, 1]`, sent by `x ↦ (1 − x, x)` to the segment from `(1, 0)` to
    `(0, 1)` in `ℝ²`, which has two-dimensional measure `0`: integrating over the barycentric
    simplex would give `0`.
  - `p = 2`: the triangle with vertices `0`, `e₁`, `e₂`, of area `½`; the vertex `e₁` goes to the
    weight `1` at index `1` and the origin to the weight `1` at index `0`; a convention putting
    the weight `1 − Σ xᵢ` last would send `e₁` to index `0` and permute the faces.
  Construct the standard simplex face data in barycentric charts: at a
  point choose a positive barycentric coordinate as pivot, use the other
  n coordinates, and restrict the positive coordinates to stay positive.
  The vanishing barycentric coordinates give exactly its local facets;
  prove compatibility of pivot changes and the affine orientation signs.
  Layer 8's smooth singular simplices (Tau Ceti's `TauCeti.SmoothSimplex`) are maps out of this
  carrier, but 8.4's standard-simplex Stokes formula is proved independently of this face data.
  Construct open restrictions, disjoint unions and products. For dimensions
  m,n the product boundary is `(∂̃M×N) ⊔ (M×∂̃N)` over M×N, and depths add.
  The data are transported under compatible diffeomorphisms and satisfy
  restriction, factor-swap and product associativity coherence. A general
  convex model may receive this structure only via an actual compatible
  local quadrant atlas; its generic forms, densities and inward smoothing
  require no such structure. Do not assert that every convex range admits it.

  **Orientations and Stokes.** Given an orientation on M, orient each sheet
  outward-first through the injective derivative of j. On Q^n with standard
  orientation, facet i with its remaining coordinates in their original
  order has coefficient (-1)^(i+1), with the 0-based index `i : Fin n` of the local
  quadrant data, since its outward vector is -e_i: moving -e_i to the front of the
  standard basis costs i transpositions and one sign. For n=1 the single facet is the
  endpoint 0 of `[0,∞)` with coefficient −1, matching 5.1's negative left endpoint; a
  1-based reading would give +1 there and is excluded.
  The two ordered lifts at each codimension-two corner have opposite
  induced orientations. The product boundary orientations are the product
  orientation on `∂̃M×N` and (-1)^m times that on `M×∂̃N`; prove all chart,
  restriction and product comparisons. For compactly supported C¹
  (n−1)-forms prove `∫_M dω=∫_{∂̃M} j*ω`, using the local quadrant formula
  and a partition of unity. Properness of j makes the pulled-back support
  compact; prove integrability of both sides. The codimension-two pieces
  are null for the face measures, with the double-boundary sign comparison
  supplying the expected cancellation. Recover the interval FTC, the square
  formula with its four oriented edges, simplex and product specializations,
  and naturality under compatible face diffeomorphisms. This constructs
  [Lee, Thm. 16.25]'s smooth-corner scope with explicit data; it attributes no
  smooth-boundary theorem to an arbitrary nonsmooth convex model.

  GeometricTopology consumes this face geometry and its product charts for
  collars/gluing. Its global collars are not prerequisites of this
  construction, Stokes, the generic inward semiflow or chain smoothing.

### Layer 5.6: Green's theorem for planar regions and curves

Green's theorem here means the circulation identity

    ∮_C P dx + Q dy = ∫_D (∂x Q − ∂y P) dx dy.

The scope includes **both** statements linked under theorem 21 in
[Freek Wiedijk's list](https://www.cs.ru.nl/~freek/100/#21). These have different strengths;
proving the smooth-boundary specialization of 5.3 alone does not discharge this layer.

| Reference | Required specialization |
| --- | --- |
| [HOL Light, `GREEN_THEOREM_CURL`](https://www.cs.ru.nl/~freek/100/hol.html#21) | A closed absolutely continuous curve, index one on every bounded component of its complement, and a `C¹` field on a neighbourhood of the curve and those components; integrability of both sides is a conclusion. No simplicity or finite-piece assumption. |
| [Abdulaziz–Paulson, Isabelle/AFP `Green`](https://isa-afp.org/entries/Green.html) | Finite type-I and type-II divisions, compatible oriented boundary chains, and the directional hypotheses of `analytically_valid`; no full `C¹` assumption on the field. The boundary integrals use Henstock–Kurzweil integration. |

The intrinsic targets below specify the mathematics; the reference statements are also
acceptance tests. In particular, provide specializations of AFP's
[`GreenThm_typeI_typeII_divisible_region`,
`GreenThm_typeI_typeII_divisible_region_finite_holes`, and
`GreenThm_typeI_typeII_divisible_region_equivallent_boundary`](https://isa-afp.org/browser_info/current/AFP/Green/Green.html),
whose hypotheses follow from the corresponding AFP hypotheses, with no added regularity
assumptions. The intrinsic cell and boundary requirements below specify the API; AFP's
particular encodings of subdivisions are not a required carrier.
HOL Light writes the field components in the order `(Q,P)`; our convention is always
`P dx + Q dy` and curl `∂x Q − ∂y P`.

**Conventions and existing inputs.** Use `ℂ` as the oriented real plane, with coordinates
`Complex.re`, `Complex.im`, positively oriented basis `(1, Complex.I)`, and `volume` as area.
Real differentiability is `ContDiffOn ℝ 1`, never complex differentiability. On an oriented
parameter interval `a..b`, the circulation is the existing `intervalIntegral`

```
∫ t in a..b, P (γ t) * (deriv γ t).re + Q (γ t) * (deriv γ t).im
```

and its `Path` form is Mathlib's `curveIntegral` of the real continuous linear map
`v ↦ P z * v.re + Q z * v.im`. Consume
`curveIntegral_eq_intervalIntegral_deriv` for agreement of `deriv` and `derivWithin`. Use
[`AbsolutelyContinuousOnInterval`](https://leanprover-community.github.io/mathlib4_docs/Mathlib/MeasureTheory/Function/AbsolutelyContinuous.html#AbsolutelyContinuousOnInterval),
Mathlib's absolute-continuity FTC, Fubini, change of variables, connected components,
`BoxIntegral.IntegrationParams.Henstock`, and `IntegrableOn.hasBoxIntegral` for agreement
with Bochner integrals.
For points off a curve, use
[`TauCeti.Contour.windingNumber`](https://github.com/TauCetiProject/TauCeti/blob/main/TauCeti/Analysis/Contour/Winding/Number/Basic.lean);
no second index is defined. On the trace the area-weight function is set to zero, independently
of the principal-value index there. The signed chain boundary convention is terminal endpoint
minus initial endpoint; outer boundaries run counterclockwise and hole boundaries clockwise.

**5.6.1 Curves, indices, and planar area.** Extend the existing index API to absolutely
continuous curves `γ : ℝ → ℂ` on `a..b`, `a < b`, using their a.e. derivative and FTC.
Prove interval-integrability of `deriv γ` and consume
`windingNumber_eq_integral_of_avoidance` to obtain the off-trace index integral.
Extend integrality for closed curves, local constancy off the compact trace
`K = γ '' uIcc a b`, vanishing on unbounded complementary components, and the existing
proximity-invariance theorem `windingNumber_eq_of_dist_lt_dist` to AC curves. The proximity
hypothesis is `∀ t ∈ uIcc a b, dist (γ₁ t) (γ₀ t) < dist (γ₀ t) z` for two closed curves;
conclude equality of their indices at `z`. Do not apply the existing countable-exception
integrality and proximity theorems to an arbitrary AC curve: its exceptional set need only
be null.

Use the existing `TauCeti.filledHull K`; the bounded complementary region is `filledHull K \ K`.
Consume the filled-hull boundedness and separation API from conformal mapping. Prove the
remaining facts needed here: this region is open, its frontier lies in `K`, the trace of an
AC curve has zero area, and adding or deleting that trace preserves area integrals.
The finite-length assertion is `BoundedVariationOn γ (uIcc a b)`, already supplied by
`AbsolutelyContinuousOnInterval.boundedVariationOn`. Relate its total variation to
`∫ t in a..b, ‖deriv γ t‖` using the existing metric-derivative API; do not create a path-length
carrier.

For a closed curve let `nγ(z)` be the real part of its existing winding number off `K`, and
zero on `K`. Prove measurability, integrability, and compact support of `nγ`. Its values need
not be bounded. Supply the kernel estimate
`∫ z in closedBall c R, ‖z-w‖⁻¹ ≤ 4πR` for `R>0` and `w ∈ closedBall c R`, together with
integrability of this kernel. Tonelli applied to the off-trace index formula then bounds
`∫ |nγ|` by `2R` times the curve length when that ball contains the trace; use filled-hull
containment in the ball to control the support. Prove local `L¹` continuity under translation
of the complex reciprocal kernel. These are the estimates used in 5.6.3's `L¹` limit passage,
not an assumed uniform bound on the index.

**Checks** (for `windingWeight`, `circulationFun` and `curl`).
- A constant curve has `windingWeight = 0` everywhere (its trace is a point and the index of
  a constant curve is `0` off it); the counterclockwise unit circle has weight `1` inside, `0`
  outside and `0` on the trace, by the convention that overrides the principal-value index
  `½` there; the twice-traversed circle has weight `2` inside and the clockwise circle `−1`.
- `circulationFun` for `γ(t) = exp(it)` on `[0, 2π]` with `P = −y/2`, `Q = x/2` is the constant
  `½`, with integral `π`, the area; reversing the curve negates `deriv γ`, hence the integral;
  a constant curve has integrand `0`; for the reparametrization `θ(t) = 2π√t` the integrand is
  unbounded near `0` but integrable (5.6.3), and `deriv` is the junk value `0` where it fails to
  exist, which an absolutely continuous curve allows only on a null set.
- `curl (−y) x = 2`, `curl y x = 0` (the exact form `d(xy)`) and `curl 0 x = 1`; the opposite
  convention `∂ᵧP − ∂ₓQ` gives `−1` for the last, and HOL Light's component order `(Q, P)` read
  as ours would give `curl x 0 = 0 − 0 = 0` there, so the order is pinned. `curl` uses
  `fderiv`, whose junk value makes `curl |y| 0 = 0` along `y = 0`; the theorems ask for `C¹`
  fields on `U`.

Prove that the existing `IsPiecewiseC1On` implies absolute continuity, so existing contour
cycles specialize the new results. Supply restriction, splitting, reversal, concatenation,
finite integer-weighted sums, and increasing AC reparametrizations onto the parameter
interval. Prove integral and index invariance for those reparametrizations, sign reversal for
decreasing ones, and integrability. Raw curves and existing `Path`s remain the carriers.
Extend the existing raw-curve/`curveIntegral` index agreement to AC curves. The completed
contour roadmap continues to own cycles, residues, principal values, homological Cauchy,
and index definitions.

**5.6.2 Directional Green identities and finite divisions.** A vertical (type-I) cell is

    V = {x + iy : a ≤ x ≤ b, ℓ(x) ≤ y ≤ u(x)},   a < b,

with `ℓ ≤ u`, continuous graphs, and graphs `C¹` away from a finite exceptional set.
A horizontal (type-II) cell is the coordinate-swapped version. Equality of the graphs is
allowed, including at endpoints. This weaker finite-exception condition is written with
`ContinuousOn` and `ContDiffOn` on the interval minus the exceptions; it does **not** mean
Tau Ceti's stronger `IsPiecewiseC1On`, which requires regularity up to breakpoints.

Build their four parameterized edges and signed boundaries, membership formulas, compactness,
measurability, null boundaries, slicing formulas, and coordinate-swap transport with its
orientation sign. Establish affine covariance for real `C¹` one-forms. For an affine
isomorphism `A` with linear part `L`, prove the pullback formula and

    curl(A^* α) = det(L) · (curl α) ∘ A,

together with change of area by the absolute determinant and the corresponding
boundary-orientation formula. The directional Green identities retain
their separate slice hypotheses; arbitrary affine mixing is not asserted to preserve them.

On `V` (`verticalCell a b ℓ u`), assume only that `P` is continuous, `∂y P` exists at every
point (the derivative of `y ↦ P (x+iy)`), and this derivative is area-integrable on `V`; derive
the measurability of the zero-extended fiber integral from area integrability by Fubini. Prove

    ∮_{∂V} P dx = −∫_V ∂y P dA.

The vertical edges contribute nothing to `∮ P dx`, and the bottom and top graphs, parametrized
by `x`, contribute `∫_a^b P(x + iℓ(x)) dx` and `−∫_a^b P(x + iu(x)) dx`; since `P` and the
graphs are continuous, this boundary side is an ordinary interval integral of a continuous
function, and only the continuity of the graphs is used. This is `green_verticalCell`. On a
horizontal cell (`horizontalCell c d ℓ u`) assume the analogous hypotheses on `Q` and `∂x Q`,
and prove `∮ Q dy = ∫ ∂x Q dA` (`green_horizontalCell`), the right graph traversed upward and
the left downward. Derivatives are specified through `HasDerivAt` on coordinate slices,
not through `fderiv` of a field that need not be Fréchet differentiable. In particular, do
not demand the unused partial derivatives or continuity of the used derivatives. Prove the
slice FTC and Fubini steps.

**Checks.**
- On the unit square with `P = y`: `∫₀¹ (P(x) − P(x + i)) dx = −1` and `−∫ 1 dA = −1`; with
  `Q = x`: `∫₀¹ (Q(1 + iy) − Q(iy)) dy = 1 = ∫ 1 dA`. A clockwise boundary convention gives the
  opposite signs.
- With `ℓ = u` the cell is a graph of area zero and both sides vanish; with `ℓ > u` somewhere
  the left side need not vanish, which is why `ℓ ≤ u` is a hypothesis.
- `P(x, y) = |x − 1/2|` on the unit square has `∂y P = 0` but no Fréchet derivative along
  `x = 1/2`; the vertical identity applies (both sides `0`), and a `C¹` hypothesis would exclude it.

For the finite divisions the boundary integrals along general arcs are
**Henstock–Kurzweil**: develop the oriented
one-dimensional specialization of `BoxIntegral.HasIntegral` on `Fin 1`, with restriction,
finite splitting, reversal, linearity, uniqueness, FTC, and graph substitution. Prove the
named one-dimensional equivalence: `GP` and `Henstock`
have the same integral for every scalar integrand on a `Box (Fin 1)`. This is needed to consume
Mathlib's `hasIntegral_GP_pderiv`, which is stated for `GP`, and derive the scalar FTC for
continuous functions differentiable off a **countable** exceptional set. Finite-exception
paths are a specialization. Prove its
agreement with `intervalIntegral` and `curveIntegral` whenever the boundary integrand is
Bochner integrable. The finite-exception path hypothesis alone does not guarantee this;
never replace a conditionally integrable boundary expression by Bochner's junk value.
Graph substitution must permit continuous parametrizations `C¹` away from finitely many
exceptions, including unbounded speed and backtracking.

A finite division covers its region by such cells with pairwise area-null intersections.
Use finite integer-weighted sums of parameterized arcs for its boundary, with zero endpoint
boundary for a cycle. Build the API for arc subdivision, reversal with coefficient negation,
reparametrization, and cancellation. For the `P dx` identity compare boundaries modulo vertical
arcs (whose `dx` integral is zero); for `Q dy` compare modulo horizontal arcs. This permits
different type-I and type-II divisions and different boundary presentations related by common
subdivision or graph reparametrization, as in AFP; a single shared cell decomposition is not a
premise. Construct and prove the comparison certificates, rather than assuming that the
boundary integrals are equal. Sum the component identities to obtain full Green for such
regions, including finite holes and disconnected regions. Derive integrability of the boundary
components in the gauge sense, and of `∂x Q − ∂y P` in the area sense. State the Bochner
specialization with its genuine boundary-integrability assumptions. Consume Mathlib's
rectangle divergence theorem and Tau Ceti's bilinear rectangle Green formula as existing
special cases, and prove agreement.

Build the **winding-weighted polygonal identity** for fields `C¹` on all of `ℂ`. For a closed
polygon with consecutive vertices `vᵢ,vᵢ₊₁` and any base point `c`, use the triangle fan
`Tᵢ=(c,vᵢ,vᵢ₊₁)`. The oriented boundaries telescope to the polygon because radial segments
cancel. Prove the explicit index of each triangle boundary: off its three edges it is the
sign of `det(vᵢ-c,vᵢ₊₁-c)` on the triangle interior and zero outside; degenerate triangles
have zero index off their trace. Supply the triangular cell divisions and use the existing
contour homotopy/proximity calculus for the index computation. Additivity gives
`n_polygon = Σᵢ sign(detᵢ) · 1_{interior Tᵢ}` a.e.; internal triangle edges are area-null.
Combining triangle Green with that index identity gives
`∮_polygon P dx + Q dy = ∫ n_polygon · (∂x Q − ∂y P) dA`.
Self-intersections, repeated vertices and repeated edges require no separate face arrangement.
Do not require fan triangles to lie in a local field domain; the polygonal statement has
explicitly global field hypotheses.

**5.6.3 Green for absolutely continuous cycles.** For a closed absolutely continuous curve
on `a..b`, `a < b`, an open `U` containing the trace, and `P,Q` real `C¹` on `U`, assume the
existing winding number vanishes outside `U`. Prove the winding-weighted identity
(`green_ac_winding`)

    ∫_a^b [P(γ(t)) x'(t) + Q(γ(t)) y'(t)] dt = ∫_U n_γ(z) (∂x Q(z) − ∂y P(z)) dA(z),

including integrability of both sides. First prove that the trace and the support of the
index lie in a compact subset of `U`, using local constancy and vanishing outside `U`.
Construct a smooth cutoff equal to one near that compact set, supported in `U`, and extend
the multiplied field by zero to a `C¹` field on all of `ℂ`. Prove preservation of the boundary
integral and weighted curl integral. This localization precedes applying 5.6.2's global
polygonal identity, whose fan triangles can leave `U`.

Build closed polygonal approximations with uniform convergence and convergence of derivatives
in `L¹`. Use 5.6.1's kernel estimates and translation continuity to prove `L¹` convergence of
the winding weights, and its AC proximity theorem to preserve the index outside `U` for all
sufficiently close approximants. Apply the polygonal identity to the cutoff field and prove
convergence of both boundary integrals and weighted area integrals. Prove the finite
integer-weighted version for finite families of these raw curves, with the vanishing condition
on the **total** index and localization using its total support and all traces. Specialize to
`TauCeti.Contour.Cycle` of piecewise-`C¹` closed curves. Simplicity, a finite cell division,
nonzero speed, finitely many complementary components, and compact support of the original
field are not hypotheses.

Deduce the HOL Light specialization (`green_ac_index_one`): `filledHull K ⊆ U`, and the existing winding number is
`1` at every point of `filledHull K \ K`. The area integral is over `filledHull K \ K`, and
area and boundary integrability are conclusions. Derive the flux version by replacing
`(P,Q)` with `(-Y,X)`: the boundary expression is `X dy − Y dx`, and the area expression is
`∂x X + ∂y Y`, again with both integrability conclusions. The post-manifold compatibility target 12.6 proves agreement of these completed
flat identities with the half-space theorem 5.3 and face-structured theorem 5.5b,
their outward-first orientations, the integral of top forms, coordinate area, and
12.5's Euclidean divergence theorem. The flat theorem and the general
manifold theorems are constructed independently before that comparison;
neither consumes it as a prerequisite.

**Acceptance examples.** Prove the unit-circle and ellipse area formulas from
`P=-y/2, Q=x/2`. For `a,b>0`, define the closed ellipse
`E_{a,b}={x+iy : (x/a)²+(y/b)²≤1}` and its positive boundary
`γ(t)=a cos(t)+i b sin(t)`, `0≤t≤2π`. Prove by the positive affine change of variables
`(x,y)↦(ax,by)` from the unit disk, with Jacobian `ab`, and the nullity of the boundary, that
`(volume E_{a,b}).toReal=πab`. Also prove
`∮_{∂E_{a,b}} x dy=∮_{∂E_{a,b}} (−y dx+x dy)/2=πab`; connect the two integrands by
`d(xy)/2`, and use the positive orientation. Reversal negates both signed integrals but not the
geometric area. Also prove the annulus formula `π(R²-r²)` for `0<r<R` with a clockwise inner circle;
the signed shoelace formula for a closed polygonal path, including a self-intersecting path;
and a twice-traversed circle with weight two. Give the unit-circle boundary a reparametrization
`θ(t)=2π√t`, `0≤t≤1`, and recover area `π`: this curve is absolutely continuous with unbounded
speed. Discharge a weak-field example `P(x,y)=|x-1/2|, Q(x,y)=x` on the unit square: only `∂y P=0`
and `∂x Q=1` are needed, although the field is not `C¹` on a neighbourhood of the square.
For the gauge FTC, take `h(0)=0` and `h(t)=t² sin(t⁻²)` for `0<t≤1`: prove that the
Henstock–Kurzweil integral of `h'` is `sin 1`, and that `h'` is not Bochner integrable.
These supplement the unit-square sign check of 5.5a. The area formula for a general cycle is
**signed area counted with index**, not the area of the union of its bounded complementary
components.

**Flat punctured-plane family.** Let `U=ℂ\{0}`, write `x=Re z`, `y=Im z`, and
`ρ(z)=x²+y²>0`. For every `α∈ℝ`, use `Real.rpow (ρ(z)) (−α)` and define
`P_α(z)=(x−y)*Real.rpow (ρ(z)) (−α)`, `Q_α(z)=(x+y)*Real.rpow (ρ(z)) (−α)` and the real
continuous linear functional `ω_α(z)(w)=P_α(z) Re w+Q_α(z) Im w` on `ℂ`. Prove smoothness on
`U` and, by the native flat `extDerivWithin` coefficient/curl formula,
`∂ₓQ_α−∂ᵧP_α=2(1−α)ρ^(−α)`, equivalently
`dω_α=2(1−α)ρ^(−α)dx∧dy` on `U`. Its positively oriented unit-circle integral is `2π` for
every real α; it is closed exactly when `α=1`. State non-exactness in the same flat carrier:
there is no real `g : ℂ → ℝ`, differentiable on `U`, such that `fderiv ℝ g z = ω_α(z)` for every
`z∈U`. Derive this from the chain rule and interval FTC along the unit-circle parametrization;
the pulled-back derivative is the continuous coefficient `ω_α(γ(t))(γ'(t))`. This argument
uses the flat differentiable-form calculus on `U` and does not consume 5.5a, 5.5b or
DeRhamCohomologyAndDuality's continuous path integral. The form
`ω_α` itself is globally defined on `U`; no global real-valued angle potential is asserted.

**Ownership and ordering.** This layer owns the AC and directional planar extensions and
their comparisons with existing rectangle and manifold results. Layers
5.3 and 5.5b retain half-space and face-structured Stokes, and 5.5a retains
generic density integration. Layer 12.5 retains Riemannian divergence and
Green's integration-by-parts identities; 12.6 owns their later planar comparison. The completed
[contour integration roadmap](../../Completed/ContourIntegration/README.md) owns the contour
and index APIs consumed above; [conformal mapping](../../Completed/ConformalMapping/README.md), L5, owns
the filled-hull and planar-separation APIs consumed here. [PDE](../PDE/README.md) owns Green functions, boundary-value
problems, and weak PDE solutions; [modular forms](../ModularForms/README.md) owns its
Petersson/region-Stokes application and can consume these identities. Sequence 5.6.1's curve
calculus and 5.6.2's finite divisions before the approximation and limit passage in 5.6.3.
They use Mathlib's flat calculus and
integration directly. The subsequent comparison 12.6 consumes the completed
flat theorem, 5.2/5.3/5.5a, the face data and theorem 5.5b when corners occur,
and 12.4–12.5; it has no edge back into any of those producers.

Follow Mathlib's existing `curveIntegral` design, including
[`curveIntegral_eq_intervalIntegral_deriv`](https://leanprover-community.github.io/mathlib4_docs/Mathlib/MeasureTheory/Integral/CurveIntegral/Basic.html#curveIntegral_eq_intervalIntegral_deriv)
and `HasFDerivWithinAt.curveIntegral_segment_source`, and the community's
[Stokes discussion](https://leanprover-community.github.io/archive/stream/116395-maths/topic/Stokes'.20theorem.html)
about gauge integrals. The [Jordan-curve discussion](https://leanprover.zulipchat.com/#narrow/channel/287929-mathlib4/topic/Jordan.20curve.20.2F.20Smooth.20Jordan.20curve/near/569492761)
likewise favours existing maps and regularity hypotheses over a new smooth-Jordan-curve
carrier. Build missing compatibility lemmas in Tau Ceti following those APIs; consume
Mathlib declarations wherever they already express a target.
The `Green` namespace of `Suggested.lean` states the one-cell identities of 5.6.2 and the two
absolutely continuous theorems of 5.6.3, with the curl `curl`, the circulation integrand
`circulationFun` and the area weight `windingWeight`; the finite division theorems lack the
oriented boundary-chain carrier there, and the markdown specifies the full layer.

### Layer 6: the de Rham complex and cohomology

*[Lee, Ch. 17]. Built on the smooth real forms of 0.4 and the linear exterior derivative of 1.3.
Tau Ceti carries this layer and 7.1–7.3 in full (*From Tau Ceti*, the de Rham modules): the
subsections name those declarations, keep the ids that consumers cite, and record which names
of this roadmap's earlier editions they realize; nothing in 6.1–6.4 is a target.*

- **6.1 The complex and the ring.** The de Rham complex is `TauCeti.deRhamComplex I M`, the
  nonnegative cochain complex of `SmoothForm I M ℝ k` with differential `TauCeti.mextDerivₗ`
  (`Geometry/Manifold/DeRham/Basic.lean`), on `C²` manifolds with corners over any real model and
  with no finite-dimensionality, separation or completeness hypothesis; `TauCeti.deRhamCohomology`
  is Mathlib's homology of it, `TauCeti.closedForms` and `TauCeti.exactForms` its concrete
  presentation, and `TauCeti.deRhamCohomology.mk` the class map, surjective with kernel the exact
  forms. Functoriality is `TauCeti.deRhamComplex.map` and `TauCeti.deRhamCohomology.map`, with the
  identity and composition laws and `TauCeti.deRhamCohomology.equivOfDiffeomorph`
  (`DeRham/Map.lean`). The wedge descends: `TauCeti.deRhamCohomology.wedge` with `wedge_mk`
  (`DeRham/Wedge.lean`), the graded algebra `TauCeti.deRhamAlgebra` with the Koszul sign
  `(−1)^(kl)` (`DeRham/Algebra.lean`), and the action `TauCeti.compactlySupportedDeRhamCohomology.wedge`
  of `H^•_dR` on `H^•_c`; `H^k_dR(M) = 0` for `k > dim M`. The names deRhamComplex,
  deRhamCohomology, closedForms, exactForms and deRhamCohomology.map under which consumers cite
  6.1 are these `TauCeti` declarations; `closedForms` of 1.3 is the kernel of `mextDerivₗ`, which
  is how `TauCeti.closedForms` is defined.
- **6.2 Degree zero and the Poincaré lemma.** `H⁰_dR(M) ≃ LocallyConstant M ℝ` is
  `TauCeti.deRhamCohomologyZeroEquiv`, one-dimensional for connected `M` and of dimension the
  number of points for a finite discrete `M` (`DeRham/DegreeZero.lean`). The flat Poincaré lemma
  on a star-convex open set, at every regularity `r ≥ 1`, is
  `StarConvex.exists_contDiffOn_forall_extDeriv_eq` (`Analysis/Calculus/DifferentialForm/Poincare.lean`),
  and its manifold form `TauCeti.exists_mextDeriv_eq_nhds` [Lee, Thm. 17.14]
  (`Geometry/Manifold/DifferentialForm/Poincare.lean`) gives a closed `C^r` form on a
  finite-dimensional Hausdorff smooth manifold, with or without corners, a `C^r` primitive near
  each point, for complete coefficients (⚠ a smooth `c₀₀`-valued `1`-form on `ℝ` has no local
  primitive).
- **6.3 Homotopy invariance.** Smoothly homotopic maps induce the same map,
  `TauCeti.deRhamCohomology.map_eq_of_homotopy`, and a smooth homotopy equivalence an isomorphism,
  `equivOfHomotopy` (`DeRham/HomotopyInvariance.lean`); the source may have boundary or corners,
  because the input is 5.4's homotopy operator (`TauCeti.homotopyOperator`,
  `DifferentialForm/HomotopyOperator.lean`) and not Stokes. `H^(k+1)_dR(E) = 0` for a normed
  space `E` (`DeRham/NormedSpace.lean`). The line integral `TauCeti.pathIntegral`
  (`DifferentialForm/Integration/Path.lean`), the exactness criterion on connected `M`
  `TauCeti.exists_mextDeriv_eq_of_forall_pathIntegral_eq_zero` [Lee, Thm. 17.17] with
  `TauCeti.mem_exactForms_one_iff_forall_pathIntegral_eq_zero` (`DeRham/PathIntegral.lean`),
  `H¹_dR(M) = 0` for simply connected `M` (`DeRham/SimplyConnected.lean`), and the periods
  `TauCeti.deRhamCohomology.period`, an injective map `H¹_dR(M) → Hom(π₁(M, x), ℝ)` on connected
  `M`, natural under pullback (`DeRham/Period.lean`).
- **6.4 Compact supports.** `TauCeti.compactlySupportedDeRhamComplex`,
  `TauCeti.compactlySupportedDeRhamCohomology` with its class map and the comparison
  `toDeRhamCohomology` (an isomorphism on compact `M`), proper pullback
  `TauCeti.compactlySupportedDeRhamCohomology.map` (⚠ nothing for a general smooth map: `ℝ → pt`
  already fails on `H⁰_c`) and `H^k_c(M) = 0` above the dimension (`DeRham/CompactSupport.lean`);
  extension by zero along open inclusions of a Hausdorff `M`,
  `TauCeti.compactlySupportedDeRhamCohomology.extendByZero`, functorial in the inclusion
  (`DeRham/ExtendByZero.lean`; ⚠ on the line with two origins a bump near one origin extends
  discontinuously); `H^k_c(E) = 0` for `k ≠ dim E`, and integration `H^n_c(E) ≃ ℝ` for each
  orientation of a finite-dimensional `E`, `TauCeti.compactlySupportedDeRhamCohomologyNormedSpaceEquiv`
  [Lee, Lemma 17.27, Thm. 17.28] (`DeRham/{RealLine,Euclidean}.lean`). The names extensionByZero
  and properPullback under which consumers cite 6.4 are
  `TauCeti.compactlySupportedDeRhamCohomology.extendByZero` and
  `TauCeti.compactlySupportedDeRhamCohomology.map`. *Acceptance* (in Tau Ceti): `H^k_dR(E)` in
  every degree (6.2–6.3); `[dθ] ≠ 0` in `H¹_dR(S¹)`
  (`TauCeti.deRhamCohomology.mk_circleAngularClosedForm_ne_zero`, `DeRham/Circle.lean`); the
  classes of the coordinate forms `dt_i` of a torus are linearly independent in `H¹_dR`
  (`DeRham/Torus.lean`).

### Layer 7: Mayer–Vietoris

*[Lee, Ch. 17; Bott–Tu, I §2]. 7.1–7.3 are Tau Ceti's; 7.4 is the target.*

- **7.1–7.2 The sequence.** `TauCeti.mayerVietorisShortComplex`, the short complex
  `0 → Ω^•(U ⊔ V) → Ω^•(U) ⊞ Ω^•(V) → Ω^•(U ⊓ V) → 0` with arrows `(res, res)` and `res − res`,
  short exact on a Hausdorff σ-compact finite-dimensional manifold
  (`TauCeti.mayerVietorisShortComplex_shortExact`); the long exact sequence is Mathlib's
  `ShortComplex.ShortExact.homology_exact₁`, `homology_exact₂` and `homology_exact₃`; the
  connecting map `TauCeti.deRhamCohomology.mayerVietorisδ`, its value on classes, its
  partition-of-unity description `mayerVietorisδ_mk_eq_mk_extendByZero` [Lee, Cor. 17.42],
  its naturality `mayerVietorisδ_naturality`, and `mayerVietorisδEquiv` when `U` and `V` have no
  cohomology in the two degrees (`DeRham/MayerVietoris.lean`).
- **7.3 Compact supports.** `TauCeti.compactlySupportedMayerVietorisShortComplex`, with the arrows
  reversed by extension by zero, `(ext, −ext)` and `ext + ext`, short exact under the same
  hypotheses (`DeRham/CompactlySupportedMayerVietoris.lean`). *Acceptance* (in Tau Ceti):
  `H^k_dR(Sⁿ)` from the two-cap cover [Lee, Thm. 17.21], `TauCeti.finrank_deRhamCohomology_sphere`
  (`DeRham/Sphere.lean`), through the punctured space `E ∖ {0}` (`DeRham/Punctured.lean`).
- **7.4 The Mayer–Vietoris induction principle.** Prove: let `M` be a Hausdorff σ-compact
  manifold over a finite-dimensional real model and `P` a property of open subsets of `M`. If `P`
  holds on a basis of the topology that is closed under finite intersections, if `P(U)`, `P(V)`
  and `P(U ∩ V)` imply `P(U ∪ V)`, and if `P` is closed under countable disjoint unions of open
  sets, then `P(M)` [Lee, proof of Thm. 18.14; Bott–Tu, I §5, the Mayer–Vietoris argument]. The
  route: a smooth proper exhaustion function `f` (Tau Ceti's `Geometry/Manifold/Exhaustion.lean`);
  each compact shell `f⁻¹[k, k + 1]` is covered by finitely many basis sets inside
  `f⁻¹(k − ½, k + 3/2)`; finite unions of basis sets satisfy `P` by induction on their number,
  the intersection of a basis set with a finite union of basis sets being a finite union of basis
  sets; the even shells and the odd shells give two countable disjoint unions of such finite
  unions, whose intersection is again one. Then the chart corollary: a property of manifolds over
  `I` that is invariant under diffeomorphism, holds for every open subset of `range I ⊆ E` that
  is the intersection of a convex open subset of `E` with `range I` (a convex set, by Mathlib's
  `ModelWithCorners.convex_range`), satisfies the Mayer–Vietoris step and is closed under countable
  disjoint unions holds for every Hausdorff σ-compact manifold over `I`: first for the open
  subsets of `range I`, whose convex open subsets are a basis closed under finite intersections,
  then for `M`, with the basis of open subsets of chart sources, each diffeomorphic to an open
  subset of `range I`. ⚠ Closure under countable disjoint unions is a hypothesis in its own
  right, because cohomology does not commute with increasing unions; it cannot be replaced by
  closure under finite unions. *Needs:* Tau Ceti's exhaustion function; Mathlib's
  `ModelWithCorners.convex_range`; 7.1 for the step in every application below.
  **Checks.**
  - Negative control: for `P(U)` = "`H⁰_dR(U)` is finite-dimensional", the basis and
    Mayer–Vietoris hypotheses hold but the disjoint-union hypothesis fails, and indeed `H⁰_dR` of
    a countable disjoint union of balls is infinite-dimensional; a principle without the
    disjoint-union hypothesis would be false.
  - For `P(U)` = "every closed `1`-form on `U` is exact", the Mayer–Vietoris step fails: two arcs
    `U`, `V` covering `S¹` satisfy `P` and `U ∩ V` (two arcs) satisfies `P`, while `U ∪ V = S¹`
    does not (`[dθ] ≠ 0`); the principle therefore does not conclude `P(S¹)`, as it must not.
  - For `P(U)` = "the de Rham homomorphism of `U` is bijective in every degree" all three
    hypotheses hold (8.5) and the conclusion is the de Rham theorem; on the line with two origins,
    which is not Hausdorff, the principle is unavailable and the conclusion is false
    (*Statements that must not enter the library*).

### Layer 8: the de Rham theorem

*[Lee, Ch. 18]. Spaces in `Type`. [Lee]'s route — smooth chains and a Mayer–Vietoris induction —
not the sheaf route. Singular (co)homology is the algebraic-topology roadmap's and is in Tau
Ceti; this layer builds the smoothing theorem, integration over smooth chains and the comparison
with de Rham cohomology on those carriers, and never a second singular theory.*

- **8.1 Singular cohomology, consumed.** Tau Ceti's `TopCat.singularCochainComplex` and
  `TauCeti.singularCohomologyFunctor` (`AlgebraicTopology/Cohomology/Basic.lean`) with real
  coefficients, functoriality, homotopy invariance (`Cohomology/HomotopyInvariance.lean`),
  relative cohomology and the sequence of a pair (`Cohomology/Relative.lean`), the Kronecker
  pairing and universal coefficients, `TopCat.singularUniversalCoefficientEquiv`, which over a
  field make evaluation `H^k(X; ℝ) → Hom(H_k(X; ℝ), ℝ)` bijective
  (`Cohomology/{Kronecker,UniversalCoefficient}.lean`), the cup product `TopCat.singularCup`
  (`Cohomology/Cup.lean`), and the cochain Mayer–Vietoris sequence of a binary open cover with
  its connecting map `TopCat.singularCohomologyMayerVietorisδ`
  (`Cohomology/MayerVietoris/Basic.lean`). Nothing is built here.
- **8.2 Subdivision and small chains, consumed.** Tau Ceti's barycentric subdivision with its
  homotopy to the identity, `TauCeti.singularSubdivisionHomotopy`
  (`AlgebraicTopology/Singular/Subdivision/Homotopy.lean`), the small-chain theorem
  `TauCeti.smallSingularChainHomotopyEquiv` (`Singular/Subdivision/Small/Equiv.lean`)
  [Lee, Thm. 18.4, 18.6], and Mayer–Vietoris in homology, `TopCat.mayerVietorisδ`
  (`Singular/MayerVietoris/Basic.lean`). Nothing is built here.
- **8.3 Smooth chains.** The carriers are Tau Ceti's (`Geometry/Manifold/SmoothSingular/Basic.lean`):
  `TauCeti.smoothSingularSubcomplex I M`, the sub-simplicial set of `TopCat.toSSet.obj M` of the
  simplices which, read on the full-dimensional simplex `fullSimplex p` of 5.5b through
  `fullSimplexEquivStdSimplex`, are smooth in the sense of maps on arbitrary subsets
  (`TauCeti.ContMDiffOnSubset`: near every point of `Δᵖ`, faces and corners included, the simplex
  agrees with a smooth map defined on a neighbourhood in `ℝᵖ`; ⚠ local extendability is the
  definition), closed under the simplicial operators because these are restrictions of affine
  maps; its `p`-simplices `TauCeti.SmoothSimplex I M p`; the smooth chain complex
  `(TauCeti.smoothSingularSubcomplex I M).chainComplex ℝ`, Mathlib's chains of a simplicial set,
  whose boundary is the alternating sum of the faces; its inclusion
  `SSet.chainComplexMap (TauCeti.smoothSingularSubcomplex I M).ι ℝ` into the singular chains; and
  the pushforward `TauCeti.smoothSingularSubcomplexMap` along a smooth map. The names SmoothSimplex,
  smoothSingularChainComplex and smoothToSingular under which consumers cite 8.3 are these.
  **The target is the smoothing theorem** [Lee, Thm. 18.7]: for
  `[IsManifold I ∞ M] [T2Space M] [SigmaCompactSpace M] [FiniteDimensional ℝ E]`, over any real
  model with corners, the inclusion of smooth chains into singular chains is a chain homotopy
  equivalence, with a chosen homotopy inverse and both chain homotopies, natural up to homotopy in
  smooth maps. Two routes. For boundaryless `M`, relative Whitney approximation inductively over
  the skeleta: a singular simplex whose faces are already smooth is homotopic relative to its
  boundary to a smooth one. Over a model with corners that inductive step is unavailable (⚠ a
  continuous `3`-simplex into `[0, ∞)` with prescribed smooth coordinate faces need not be
  homotopic relative to its faces to a smooth one, *Statements that must not enter the library*),
  and the route is through 7.4: the inclusion is a quasi-isomorphism, because smooth singular
  homology is invariant under jointly smooth homotopies (the prism operator of such a homotopy
  preserves smooth chains), so that a convex open subset of `range I` has the smooth homology of
  a point; barycentric subdivision and its homotopy restrict to smooth chains, the subdivision
  maps being affine, so smooth chains satisfy the small-chain theorem and Mayer–Vietoris for open
  covers (8.2); both theories turn countable disjoint unions into direct sums; and a
  quasi-isomorphism between complexes of real vector spaces is a chain homotopy equivalence,
  every such complex being split. *Needs:* 7.4; 8.2; Mathlib's Whitney approximation; the smooth prism
  operator is built here, not consumed.
  **Checks.**
  - On a point both complexes are `ℝ` in degree `0` and `0` above, and the inclusion is the
    identity; on a finite discrete manifold with `m` points both `H₀` have dimension `m`.
  - The hypothesis `[IsManifold I ∞ M]` is needed: on the real line with the preferred charts
    `φ_a(y) = ∛(y − a)`, a charted space that is not a smooth manifold, a smooth path `g` through
    `a = g(t)` satisfies `g(s) = g(t) + φ_{g(t)}(g(s))³` near `t`, so `g'(t) = 0` and every
    smooth path is constant; smooth `H₀` has dimension the cardinality of `ℝ`, while singular
    `H₀ = ℝ`.
  - The boundaryless route cannot be used with corners: on the `3`-simplex into `[0, ∞)` with
    face data `(y − z)²`, `(x − z)²`, `(x − y)²` on the three coordinate faces near the origin,
    a smooth filling would have value `0`, zero gradient and Hessian with diagonal `2` and
    off-diagonal `−2` at the origin, hence value `−3t² + o(t²) < 0` along `(t, t, t)`, while a
    continuous filling with these faces exists.
- **8.4 Simplices, Stokes for chains, the de Rham map.** Tau Ceti's
  `TauCeti.SmoothSimplex.integral σ φ = ∫_{Δᵖ} (σ^*φ)(e₁, …, eₚ)`, the Bochner integral over
  `fullSimplex p` of the pullback within `Δᵖ` (derivatives are unique there, faces and corners
  included), for a complete coefficient space; linear in the form, natural
  (`∫_{f ∘ σ} ψ = ∫_σ f^*ψ`), and evaluation over a `0`-simplex
  (`Geometry/Manifold/SmoothSingular/Integral.lean`). Targets: the integral over a smooth chain,
  the linear extension of `TauCeti.SmoothSimplex.integral` to
  `((TauCeti.smoothSingularSubcomplex I M).chainComplex ℝ).X p` (cited by consumers as
  chainIntegral); the faces of a smooth simplex as the simplicial face operators of
  `TauCeti.smoothSingularSubcomplex` composed with the affine face inclusions
  `Δ^(p−1) → Δᵖ` of `fullSimplex` (cited as simplexFace), with the boundary
  `∂σ = Σᵢ (−1)ⁱ σ ∘ δᵢ`; Stokes for a smooth simplex, `∫_σ dω = ∫_{∂σ} ω` for a `C¹` form `ω`
  with complete coefficients, by the flat Stokes identity on `Δᵖ ⊆ ℝᵖ` (a Fubini computation on
  the simplex, independent of 5.5b) and the pullback within `Δᵖ` [Lee, Thm. 18.12], and Stokes
  for chains by linearity; the de Rham homomorphism `H^k_dR(M) → H^k(M; ℝ)` (cited as deRhamHom),
  the composite of integration over smooth chains, the dual of 8.3's smoothing equivalence and
  8.1's evaluation isomorphism, under 8.3's hypotheses, natural in smooth maps and compatible with
  the connecting maps of 7.1 and 8.1 [Lee, Prop. 18.13], with those hypotheses on both source and
  target. *Needs:* 8.3; 8.1; `TauCeti.SmoothSimplex.integral`; 5.5b's `fullSimplex`.
  **Checks.**
  - On a `0`-simplex at `x` and a `0`-form `f`, the chain integral of `c • [x]` is `c • f x`
    (`TauCeti.SmoothSimplex.integral_ofFunction`).
  - The segment `σ : Δ¹ → ℝ`, `t ↦ t`, has `∂σ = σ ∘ δ₀ − σ ∘ δ₁ = [1] − [0]`, and Stokes for a
    `0`-form `f` reads `∫_σ df = f(1) − f(0)`, the fundamental theorem of calculus; the
    convention `∂σ = [0] − [1]` would give the negative, and `∫_σ dx = 1`.
  - The smooth `1`-simplex `t ↦ exp(2πit)` into the circle is a cycle (its two faces are the
    same point) with `∫ dθ = 2π` (Tau Ceti's `pathIntegral_circleAngularForm_circleExp` gives
    `b − a` over `a..b` for `t ↦ exp(ti)`), so the de Rham homomorphism sends `[dθ]` to a
    cochain that is nonzero on a cycle, whereas an exact form integrates to `0` over every cycle.
- **8.5 The de Rham theorem.** Prove that the de Rham homomorphism of 8.4 is a linear
  isomorphism `H^k_dR(M) ≃ H^k(M; ℝ)` for Hausdorff σ-compact finite-dimensional smooth `M` over
  any real model with corners, in every degree [Lee, Thm. 18.14] (cited by consumers as
  deRhamEquiv), by 7.4 with `P(U)` = "the de Rham homomorphism of `U` is bijective in every
  degree": on a convex open subset of `range I` both sides are `ℝ` in degree `0` and `0` above
  (6.2–6.3 and 8.1's homotopy invariance); the Mayer–Vietoris step is the five lemma, since the
  de Rham homomorphism intertwines 7.1's connecting map with 8.1's cochain connecting map; and
  both theories take countable disjoint unions to products. Multiplicativity, that the de Rham
  homomorphism carries the wedge of 6.1 to the cup product `TopCat.singularCup`, is a theorem
  here; no cup product is defined here. *Acceptance:* `[dθ] ↦ ` a nonzero class (8.4);
  `H^k(Sⁿ; ℝ)` agrees with 7.3's `H^k_dR(Sⁿ)`; `H^k_dR(E ∖ {0}) ≃ H^k(Sⁿ⁻¹; ℝ)` for a
  Euclidean `E` of dimension `n`, through `TauCeti.deRhamCohomology.puncturedSpaceEquivSphere`.
  *Needs:* 7.4; 8.4; 8.1.

### Layer 9: Poincaré duality

*[Lee, Problems 18-6 to 18-8; Bott–Tu, I §5]. 9.1 is Tau Ceti's; 9.2–9.3 are targets.*

- **9.1 The pairing.** `TauCeti.compactlySupportedDeRhamCohomology.integral o : H^n_c(M) →ₗ[ℝ] ℝ`
  on an oriented boundaryless finite-dimensional smooth `M`, computed on classes by integrating a
  representative with 5.2's integral of top forms, well defined by the boundaryless Stokes theorem
  `TauCeti.integralTopForm_mextDeriv_eq_zero` (5.3; `DifferentialForm/Integration/BoundarylessStokes.lean`),
  and commuting with extension by zero; `TauCeti.poincarePairing I M o`, the pairing
  `H^k_dR(M) → H^l_c(M) → ℝ`, `⟨[φ], [ψ]⟩ = ∫_M φ ∧ ψ` for `k + l = n`, the wedge of 6.1 followed
  by integration, with `TauCeti.poincarePairing_mk` (`DeRham/PoincarePairing.lean`). The name
  poincarePairing under which consumers cite 9.1 is this declaration. ⚠ "boundaryless" is what
  makes the pairing well defined on classes: on `[0, 1]`, `[dx] = 0` in `H¹_dR` while
  `∫₀¹ dx = 1`.
- **9.2 Top cohomology.** Prove `H^n_c(M) ≃ ℝ` by integration for a connected oriented
  boundaryless `M` of dimension `n` [Lee, Ch. 17, the top-degree compactly supported cohomology
  of a connected oriented manifold]: a compactly supported `n`-form is a finite sum of forms
  supported in coordinate balls, a chain of overlapping coordinate balls joins any two of them
  (connectedness), and on a coordinate ball 6.4's `H^n_c(E) ≃ ℝ` says that a form of integral
  zero is compactly supported exact. Prove `H^n_c(M) = 0` for a connected nonorientable `M` by
  descent along the orientation cover of 2.4 [Lee, Thm. 17.34]: the pullback of a compactly
  supported top form to the cover, which is connected and oriented, is invariant under the deck
  involution, which reverses the orientation, so it has integral zero and is `dη` with `η`
  compactly supported; the deck-invariant part of `η` descends
  (`TauCeti.Manifold.OrientationCover.exists_mpullback_proj_eq_invariantPart`,
  `Orientation/Cover/Descent.lean`) to a compactly supported primitive on `M`. Hence
  `H^n_dR(M) = 0` for compact connected nonorientable `M`. *Needs:* 6.4; 2.4; 5.2–5.3.
- **9.3 Duality.** Prove: for a Hausdorff σ-compact oriented boundaryless smooth `M` of
  dimension `n`, the map `H^k_dR(M) → (H^(n−k)_c(M))^*` induced by 9.1's pairing is a linear
  isomorphism for every `k`, with no compactness hypothesis (cited by consumers as
  poincareDuality) [Lee, Problems 18-6 to 18-8; Bott–Tu, I §5], by 7.4 with `P(U)` = "duality
  holds for `U` in every degree": on a convex open subset of `range I` both sides are `ℝ` in the
  degrees `k = 0`, `n − k = n` and `0` otherwise (6.3, 6.4); the Mayer–Vietoris step is the five
  lemma for 7.1's sequence and the dual of 7.3's, which the pairing intertwines up to a sign; and
  countable disjoint unions, since `H^k_dR(⊔ Uᵢ) = ∏ H^k_dR(Uᵢ)` and `H^l_c(⊔ Uᵢ) = ⊕ H^l_c(Uᵢ)`,
  whose dual is the product. Corollaries: `H^k_dR(M)` is finite-dimensional for compact `M` (it is
  then isomorphic to the dual of its own dual), and the pairing is nondegenerate. Not through
  Hodge theory. The comparison of integration with the singular fundamental classes of a compact
  oriented manifold is not a target here (*Scope and ownership*). *Acceptance:*
  `|⟨[dθ], [1]⟩| = 2π` on `S¹` (Tau Ceti's `abs_integralTopForm_circleAngularForm`);
  `H⁰_dR(ℝ) ≃ (H¹_c(ℝ))^*`, both lines, the pairing being `⟨[1], [ψ]⟩ = ∫_ℝ ψ`. *Needs:* 7.4;
  7.1; 7.3; 6.3–6.4; 9.1.

### Layer 10: the Brouwer mapping degree

*[Lee, Ch. 17, "Degree Theory"; Milnor, §5]. 10.1, the equal-dimensional case of 10.2 and the
signed count of 10.3 are Tau Ceti's; the rest are targets.*

- **10.1 Regular values.** Consume Tau Ceti's inverse function theorem
  (`TauCeti.isLocalDiffeomorphAt_of_mfderiv_eq`, at interior points, hence everywhere on a
  boundaryless manifold), `TauCeti.IsRegularPoint` (a surjective manifold derivative) and
  `TauCeti.IsRegularValue` (every point of the fibre regular; a value outside the range is
  regular), with their chart characterizations and, between models of the same finite dimension,
  `TauCeti.isRegularPoint_iff_isInvertible_mfderiv` (`Geometry/Manifold/RegularValue.lean`), and
  the finiteness of the fibre over a regular value of a `C¹` map from a compact manifold to a
  `T1` manifold, `TauCeti.IsRegularValue.finite_preimage` (`RegularValue/Fibre.lean`). The names
  IsRegularPoint and IsRegularValue under which consumers cite 10.1 are these.
- **10.2 Sard.** Null sets of a manifold are Tau Ceti's `TauCeti.IsNullSet I s`
  (`Geometry/Manifold/Measure.lean`): null in every extended chart for every Haar measure of the
  model, with no measurable structure on `M`; closed under subsets and countable unions, of empty
  interior for a finite-dimensional model, and containing the boundary
  (`TauCeti.isNullSet_boundary`). Sard in equal dimensions is
  `TauCeti.isNullSet_image_criticalPoints` with `TauCeti.dense_isRegularValue`
  (`Sard/EqualDimension.lean`): the critical values of a differentiable map from a Lindelöf
  manifold to a manifold of the same finite dimension, with or without corners, are null and the
  regular values dense [Lee, Thm. 6.10]; the meagreness of the critical values of a smooth map
  between boundaryless manifolds of any dimensions is `ContMDiff.isMeagre_image_criticalPoints`
  (`Sard/Meagre.lean`). **The target** is Sard's theorem in all dimensions: for a `C^∞` map
  `f : M → N` between finite-dimensional manifolds with `M` Lindelöf, the set of critical values
  `f '' {x | ¬ IsRegularPoint f x}` is null in `N`, from the flat Morse–Sard theorem
  `TauCeti.addHaar_image_criticalPoints_eq_zero` (`Analysis/Calculus/Sard/OutermostStratum.lean`,
  for maps of class `C^k` with `k ≥ (dim M)² + 1`) read in countably many pairs of extended
  charts, as the equal-dimensional case is. The sharp finite-order theorem,
  `k > max(dim M − dim N, 0)`, is not a target here (*Scope and ownership*). The names IsNullSet
  and isNullSet_image_criticalPoints under which consumers cite 10.2 are the Tau Ceti
  declarations.
- **10.3–10.4 The degree.** The signed count at a value is Tau Ceti's
  `TauCeti.degreeAtRegularValue o o' f y = Σ_{x ∈ f⁻¹(y)} orientationSign o o' f x`
  (`Geometry/Manifold/Degree/Basic.lean`), where `TauCeti.Manifold.Orientation.orientationSign`
  (`Orientation/Sign.lean`) is `1`, `−1` or `0` as the differential preserves, reverses or fails
  to be invertible; it is a finite sum over a regular value of a `C¹` map from a compact manifold
  to a `T1` manifold, is `1` for the identity, `0` for a constant map into a manifold of positive
  dimension, changes sign under either orientation reversal, and has the parity of the number of
  preimages over a regular value. The name degreeAtRegularValue under which consumers cite 10.3
  is this declaration. Targets, for a smooth `f : M → N` between compact connected oriented
  boundaryless manifolds of the same dimension `n ≥ 1`: the integral formula
  `∫_M f^*ω = (degreeAtRegularValue o o' f y) · ∫_N ω` for every regular value `y` and every
  smooth top form `ω` on `N` [Lee, Thm. 17.35] (cited by consumers as
  integralTopForm_mpullback_eq_degreeAtRegularValue_mul), by choosing a chart neighbourhood of
  `y` evenly covered by the finitely many preimages (10.1), a form `ω₀` supported there with
  `∫_N ω₀ = ∫_N ω` (9.2: `ω − ω₀` is then compactly supported exact, and `f^*` of an exact form
  integrates to zero by 5.3's boundaryless Stokes), a diffeomorphism isotopic to the identity
  moving any given support into that neighbourhood (3.3's homogeneity, with 6.3 for the
  invariance of the integral), and 5.2's change of variables on each sheet with the sign
  `orientationSign`; hence the independence of the regular value, which exist by 10.2, and the
  definition `degree o o' f`, an integer, as that common value (cited as degree); and its
  identification with the action of `f^*` on `H^n_dR(N) ≃ ℝ ≃ H^n_dR(M)` (9.2). *Needs:* 10.1;
  10.2; 9.2; 5.2–5.3; 3.3; 6.3; `TauCeti.degreeAtRegularValue`.
  **Checks.**
  - `deg id = 1` and `deg (constant) = 0` in dimension `n ≥ 1`; on a point the constant map is
    the identity and both counts give `1`, which is why `TauCeti.degreeAtRegularValue_const`
    carries `0 < dim N`.
  - `z ↦ zᵏ` on `S¹`, `k ≥ 1`: every value has `k` preimages, each with sign `+1` since the
    differential is multiplication by `k z^(k−1)`, so the degree is `k`; `z ↦ z̄` has one
    preimage of sign `−1` and degree `−1`, and the integral formula reads `∫ f^*dθ = k · 2π`.
  - The antipodal map of `Sⁿ` has one preimage over every value, of sign `(−1)^(n+1)`: degree
    `+1` on `S¹` and `−1` on `S²`.
  - ⚠ Negative control, compactness: the inclusion `(0, ∞) ↪ ℝ` has signed count `1` over
    `y > 0` and `0` over `y < 0`; without compactness of `M` the count depends on the regular
    value, and the integral formula fails (`∫_{(0,∞)} f^*ω ≠ c · ∫_ℝ ω`).
- **10.5 Degree calculus.** Homotopy invariance under smooth homotopies, from the integral
  formula and 5.4's Stokes on `M × Icc 0 1` (`∫_M f₁^*ω − ∫_M f₀^*ω = ∫_{M × [0,1]} d(F^*ω) = 0`,
  as `dω = 0` in top degree); `deg id = 1`, `deg const = 0`, `deg (g ∘ f) = deg g · deg f`,
  surjectivity of a map of nonzero degree, `deg antipodal = (−1)^(n+1)`; the extension to
  continuous maps by smooth approximation (Mathlib's `Geometry/Manifold/SmoothApprox`), with
  homotopy invariance under continuous homotopies, for sphere targets and, through 8.3's
  approximation lemmas, general targets; the reconciliation on `S¹` with the degree of loops,
  `TauCeti.Circle.degree` (`Topology/Circle/Degree.lean`): for a smooth `f : S¹ → S¹`, the degree
  of `f` is `TauCeti.Circle.degree` of the loop `t ↦ f(exp(2πit))`. Brouwer's no-retraction and
  fixed-point theorems are Tau Ceti's by the singular route (`TauCeti.noRetraction_diskBoundary`,
  `TauCeti.brouwerFixedPoint_closedBall`, `AlgebraicTopology/Singular/BrouwerFixedPoint.lean`) and
  are consumed, never re-proved; the comparison of this degree with the homological degree is
  the algebraic-topology roadmap's (*Scope and ownership*). *Acceptance* (dimension `≥ 1`):
  `deg id = 1`, `deg const = 0`, `deg (z ↦ zⁿ) = n`, `deg antipodal = (−1)^(n+1)`, and for the
  loop `t ↦ exp(2πikt)`, `TauCeti.Circle.degree = k`. *Needs:* 10.3–10.4; 5.4; 8.3; Tau Ceti's
  `Circle.degree`.

### Layer 11: the hairy ball theorem

*[Lee, Problem 16-6, by the degree route].*

- **11.1** `exists_eq_zero_of_inner_eq_zero`: every continuous tangent vector field `v` on an
  even-dimensional unit sphere `Sⁿ ⊆ E` (continuous on the sphere, with `⟪v x, x⟫ = 0`) vanishes
  somewhere. Route: if `v` vanished nowhere, `‖v‖ ≥ ε > 0` on the compact sphere; a smooth map
  within `ε/2` of `v`, projected to the tangent spaces and normalized, is a smooth unit tangent
  field `w`; the great-circle homotopy `(x, t) ↦ cos(πt) x + sin(πt) w(x)` runs through the
  sphere from the identity to the antipodal map, so by 10.5 their degrees agree, `1 = (−1)^(n+1)`,
  and `n` is odd. *Needs:* 10.5; 2.4's orientation of the sphere; Mathlib's smooth approximation.
- **11.2** The section form `exists_eq_zero_of_continuous_section`: a continuous section of the
  tangent bundle of Mathlib's manifold `sphere (0 : E) 1` over `𝓡 n`, `n` even, vanishes at some
  point; bridged to 11.1 by composition with the differential of the inclusion, whose range at
  `x` is `x^⊥` (`range_mfderiv_coe_sphere`; ⚠ through `mfderiv`, not through that theorem's
  non-canonical identification). The nowhere-vanishing field `x ↦ (−x₂, x₁, −x₄, x₃, …)` on odd
  spheres, and the dichotomy: `Sⁿ` carries a nowhere-vanishing continuous tangent field exactly
  when `n` is odd. Not through Euler characteristics. *Needs:* 11.1; Mathlib's
  `range_mfderiv_coe_sphere`.
  **Checks.**
  - `n = 0`: `S⁰ = {±1} ⊆ ℝ`, every tangent vector is `0` (the tangent spaces are
    `0`-dimensional, and `⟪v x, x⟫ = 0` forces `v x = 0` in `ℝ`), so both statements hold with
    the hypothesis `Even 0`.
  - `n = 1`: `x ↦ i x` on `S¹ ⊆ ℂ` is tangent and vanishes nowhere, so the parity hypothesis
    cannot be dropped, and the dichotomy gives the odd direction.
  - `n = 2`: `x ↦ (−x₂, x₁, 0)` is tangent (`⟪v x, x⟫ = −x₂x₁ + x₁x₂ = 0`) and vanishes exactly
    at the poles `(0, 0, ±1)`, as the theorem requires; the great-circle homotopy of the route is
    not available for it, since it is not nowhere vanishing.

### Layer 12: Riemannian metrics and the Laplace–Beltrami operator

*[Lee, Ch. 13 and 16]. Over Mathlib's Levi-Civita connection, with Tau Ceti's regularity and
Riesz duality.*

- **12.1 Metrics.** Existence by partition of unity (`nonempty_contMDiffRiemannianMetric`)
  [Lee, Prop. 13.3]. Consume `TauCeti.inducedRiemannianMetric` and
  `inducedRiemannianMetric_inner` from `Geometry/Manifold/Riemannian/Induced.lean`
  for a finite-dimensional source and a C^(n+1) map into any real inner product
  space with injective differential, giving a C^n metric. Build `immersionMetric`
  for maps with injective `mfderiv` into arbitrary Riemannian manifolds: its
  pointwise metric data require only the finite-dimensional source and the
  target's pointwise metric, without a regularity or finite-dimension assumption
  on the target. Its inner product is, by construction, the target's inner product of the
  `mfderiv` images. Prove that it is `C^n` for every `n : ℕ∞ω`, for a C^(n+1) map and a C^n
  target metric, consuming the native bilinear pullback regularity theorem. Prove
  that it agrees with Tau Ceti's `inducedRiemannianMetric` in the real-inner-product target
  case. Include
  restrictions, smooth isometry transport and identity/composition of pullbacks.
  Build product, `Opens` and boundary metrics. Consume the existing analytic
  `sphereRoundMetric` and its instances on spheres and Circle; `roundMetricCircle`
  selects that same native instance. The new circle target is
  its volume comparison `volume_circle`, using the angular integral gate of 5.5a.
  **Checks.**
  - `immersionMetric` along the identity is the given metric; along `x ↦ 2x` on `ℝ` it is
    `4 dx²`, doubling lengths; along the inclusion `S¹ ⊆ ℝ²` it is the round metric, whose
    inner product of `iz` with itself is `1`.
  - The hypothesis `hinj` of `immersionMetric` is used exactly in `pos`: along `x ↦ x²` on `ℝ`
    the pulled-back form at `0` is `0 · v · w = 0`, not positive definite, so no metric is
    defined there.
  - `roundMetricCircle` is the native `sphereRoundMetric` instance, not a second metric: its
    inner product at `z` is the ambient one (`inner_tangentSpace_sphere`), `⟪iz, iz⟫ = 1`, and
    `volume_circle` gives total volume `2π`; a metric scaled by `r²` would give `2πr`.
- **12.2 Gradient.** Define `mgradient I f x` as the fibrewise Riesz dual of
  `mfderiv I 𝓘(ℝ) f x`, through the pinned `Riemannian.Tensor.rieszDual` of
  `TauCeti/Geometry/Manifold/VectorBundle/Riemannian/Riesz.lean`; its defining
  identity `⟪mgradient I f x, v⟫ = mfderiv f x v` is that file's `inner_rieszDual`. Prove the zero and
  negation identities, and that `mgradient f` is a `C^n` vector field when `f` is
  `C^(n+1)` on a `C^(n+1)` manifold with a `C^n` metric, from the chartwise
  `contMDiffAt_rieszDual` (which assumes exactly these regularities).
  Add the chain/product rules, smooth pullback/isometry transport and flat-model
  equality with Mathlib's `gradient`.
  **Checks.**
  - On flat `ℝⁿ`, `mgradient ‖x‖² = 2x`, Mathlib's `gradient`; `mgradient` of a constant is `0`
    and `mgradient (−f) = −mgradient f`.
  - The metric matters: for `f = x₁` on `ℝ²` with `g = diag(4, 1)`, `mgradient f = ¼ ∂₁`, since
    `⟪¼ ∂₁, v⟫_g = ¼ · 4 v₁ = dx₁(v)`; a definition ignoring `g` would give `∂₁`, whose
    `g`-inner product with `v` is `4 v₁ ≠ dx₁(v)`.
  - At a point of non-differentiability `mfderiv` is the junk value `0`, so
    `mgradient |x| 0 = 0`; the regularity theorems carry their `C^(n+1)` hypothesis.
- **12.3 Divergence, Hessian, Laplacian.** `divergence` (the trace of `leviCivitaConnection X`),
  `hessian` (symmetric for smooth `f`, `hessian_symm`, from torsion-freeness),
  `laplaceBeltrami := divergence ∘ mgradient`, the trace of the Hessian in an orthonormal basis,
  in the `Δ` notation class.
  **Checks.**
  - On flat `ℝⁿ`, `divergence` of the radial field `x` is `n` and of the rotation field
    `(−y, x)` is `0`; for the conformal metric `g = e^(2x) δ` on `ℝ²` the divergence of the
    constant field `∂₁` is `2` (`div_g X = Σ ∂ᵢXᵢ + 2 X · ∇u` for `g = e^(2u) δ` in dimension
    `2`), while the flat trace would give `0`: `divergence` sees the Levi-Civita connection.
  - `hessian` of `‖x‖²` on flat `ℝⁿ` is `2 ⟪v, w⟫`, and of `x₁ x₂` is `1` on `(e₁, e₂)` and on
    `(e₂, e₁)` and `0` on `(e₁, e₁)`; for `g = e^(2x) δ` on `ℝ²` and `f = x₁`, whose flat second
    derivative vanishes, `hessian f (e₂, e₂) = e^(−2x) Γ²₂₁ ⟪∂₂, ∂₂⟫_g = 1`, so `hessian` is
    `⟪∇_v grad f, w⟫` and not the non-covariant `v(w(f))`.
  - `laplaceBeltrami ‖x‖² = 2n` on flat `ℝⁿ`, `laplaceBeltrami (x₁² − x₂²) = 0`, and
    `−div ∘ grad` would give `−2n`: the sign gate of 12.5.
- **12.4 Volume form, density, measure.** The Riemannian volume form `dV` [Lee, Prop. 15.29] and the
  invariant Riemannian density, whose chart coefficient is Tau Ceti's `chartVolumeDensity`. The
  measure is Tau Ceti's `TauCeti.riemannianVolume`; consume its native
  `TauCeti.isLocallyFiniteMeasure_riemannianVolume` instance from
  `TauCeti.Geometry.Manifold.Riemannian.VolumeDensity.Volume`, with its
  finite-dimensional, continuous-metric, Borel and Lindelöf hypotheses.
  No second measure or locally-finite instance is defined; the targets are
  its bridge to densities, agreement with the integral of densities on compactly supported continuous
  functions, full support, and positivity through
  `lintegral` (⚠ never the junk-valued Bochner integral); and `d(ι_X dV) = (div X) dV`.
- **12.5 Divergence theorem and Green.** For a Hausdorff second-countable
  smooth manifold over the standard half-space model `𝓡∂ (n+1)`, n≥0,
  take a smooth positive-definite Riemannian metric, the native Borel
  structures and volume measure, and a smooth vector field X. Assume
  **either M is compact or X vanishes outside a compact subset of M**.
  Construct the induced boundary metric `halfSpaceBoundaryMetric` by pullback along the native
  smooth boundary immersion, with its smoothness and continuity
  (`halfSpaceBoundaryMetric_continuous`) and native `TauCeti.riemannianVolume` on that boundary
  (`halfSpaceBoundaryVolume`). Construct the unique smooth outward unit normal N along the
  boundary (`exists_halfSpaceOutwardUnitNormal`): norm one, orthogonal to the image of its tangent
  space, with decreasing constrained coordinate; these three laws determine N at each point.
  Then prove integrability of `div X` and `x↦⟪X(x),N(x)⟫` for their respective measures
  (`integrable_divergence_and_boundaryFlux`) and the equality `∫_M div X dV = ∫_{∂M} ⟪X,N⟫ dṼ`
  [Lee, Thm. 16.32]. The signature `integral_divergence_eq_boundaryFlux` includes exactly that
  support alternative and takes any boundary field N satisfying the three laws, and its
  integrability companion proves that neither side is being interpreted through a nonintegrable
  Bochner junk value. The same result holds at C² manifold/C¹ metric/C¹
  field regularity where the connection and density identity are defined;
  specify those finite-regularity restrictions and their smoothing/direct
  local proof. The representative signature uses the smooth case.

  No global orientation is necessary: on oriented M identify this with
  5.3 applied to `ι_X dV`; in general patch the oriented chart identities
  as densities. Prove independence of local orientation. Empty boundary
  recovers `integral_divergence_eq_zero`. On boundaryless M retain
  `integral_mul_laplaceBeltrami` and `integral_laplaceBeltrami_symm` for the
  stated compact supports. On M with boundary retain the boundary Green
  identities obtained by substituting f grad g, with their same support
  hypotheses and outward-normal term. In the face-structured case use
  the smooth face structure of 5.5b: pull back the metric to each sheet of ∂̃M,
  use its own outward normal N(x,germ), and integrate the flux on that
  abstract boundary with multiplicity. Prove the same compact/support
  alternatives and integrability, via 5.5b. A single normal on the
  unresolved boundary set is not asserted at a corner.

  PDE owns scalar Euclidean Sobolev/PDE estimates;
  PseudodifferentialOperators P1.0 owns differential operators, symbols and
  formal density adjoints; ComplexKahlerGeometry K5 owns finite-rank
  real/complex bundle distributions, the all-real-order Hilbert scale,
  smooth Laplace-type regularity, real Hodge star and compact real/complex
  Hodge theory. The general pseudodifferential calculus consumes that scale.
  *Acceptance:* on an inner product space with its constant metric `laplaceBeltrami` is Mathlib's
  `Laplacian.laplacian` (the sign gate), `Δ‖x‖²=2n`, `volume_circle` (`vol(S¹) = 2π` for
  `roundMetricCircle`); the half-line compact-support formula is
  `∫₀^∞ X'(t)dt=-X(0)`, and n=0 boundary volume assigns each endpoint mass
  one. The unsupported constant field X=1 on the half-line is excluded
  by the support hypothesis, not by an integrability convention.
  **Checks** (for `halfSpaceBoundaryMetric` and `halfSpaceBoundaryVolume`).
  - `n = 0`: on `[0, ∞)` or `[0, 1]` the boundary is `0`-dimensional, its induced metric is
    trivial and `halfSpaceBoundaryVolume` is counting measure, each endpoint of mass one; the
    half-line formula `∫₀^∞ X'(t) dt = −X(0)` is then the divergence theorem with the outward
    normal `−∂ₜ` at `0`.
  - `n = 1`, the closed half-plane `{x₀ ≥ 0}` with the flat metric: `halfSpaceBoundaryMetric` is
    `dy²` on the boundary line and `halfSpaceBoundaryVolume` is Lebesgue measure; for the
    conformal ambient metric `e^(2y) δ` it is `e^(2y) dy²` with volume `e^y dy`, which a
    definition evaluating the ambient metric elsewhere than at the boundary point would miss.
  - The closed unit disk with the flat metric: the boundary metric is the round metric of `S¹`
    and `halfSpaceBoundaryVolume` has total mass `2π`, agreeing with `volume_circle` through the
    identification of 5.1.
- **12.6 Planar/manifold compatibility, after both producers.** Consume
  the completed flat theorems 5.6.1–5.6.3, half-space Stokes 5.3,
  density integration 5.5a, the face construction/theorem 5.5b when needed,
  and 12.4–12.5. Identify the complex plane orientation, its coordinate
  area with the Euclidean metric measure, AC/rectifiable line integrals
  with smooth-boundary pullback integrals where their hypotheses overlap,
  outward-first boundary signs and the outward flux of (Q,-P) with
  circulation P dx+Q dy (so div(Q,-P)=∂x Q-∂y P). Derive the rectangle, square, smooth Jordan, finite-hole
  and compatible face-boundary specializations, including orientation
  reversal and repeated traversal. This is an equality of already
  constructed statements at their common scope; it neither strengthens
  the directional/HK theorem to C¹ nor uses an HK statement to infer
  unsupported manifold regularity. It feeds downstream consumers without
  becoming a prerequisite of 5.3, 5.5 or 12.5.

## Statements that must not enter the library

Each is a tempting mistake with its refutation.

- **"Orientable = admits a positive-Jacobian atlas", as a definition.** `Set.Icc 0 1` over `𝓡∂ 1`
  is orientable but has no oriented atlas (`TauCeti.IsOrientedAtlas`, 2.2's Check); chart signs are
  the definition (2.1). Tau Ceti's oriented-atlas notion agrees with chart-sign orientability on
  boundaryless manifolds, which is 2.2's criterion, and is narrower for 1-manifolds with boundary.
- **"The sigma topology on pointwise orientations is the orientation cover."** It is discrete, so
  the projection is not a local homeomorphism.
- **"Integral manifolds are embedded", "leaves carry the subspace topology", "`T_pS ⊆ D_p`
  suffices".** The irrational line on the torus is a dense leaf; containment defines tangent
  submanifolds, for which Frobenius is false.
- **"Global sections detect involutivity without Hausdorffness."** Glue a central `ℝ³(x,y,z)`
  to a chart `ℝ³(u,y,z)` for each rational `a`, off `x = a` and `u = 0`, by `x = a + u³`.
  This second-countable non-Hausdorff manifold carries the rank-2 distribution given by
  `ker(dz − y dx)` centrally and `ker(dz − 3u²y du)` in each added chart. Every global section
  of it is a multiple of `∂y`, so the global bracket condition holds, while the central local
  fields `X = ∂x + y∂z` and `Y = ∂y` have bracket `−∂z` outside the distribution. The displayed
  annihilator glues to a global smooth `α` with `dα(X,Y) = 1` in the central chart.
  This refutes using only global smooth sections as the definition without
  the hypotheses for local bump extension. It does not refute the canonical
  local involutivity predicate, which is the definition used in layer 4.
  The global annihilating-form characterization retains its Hausdorff
  hypothesis.
- **"The boundary of a manifold with corners is a manifold."** False at a corner of `[0, ∞)²`; the
  abstract boundary of *Boundary and corners* is what Stokes needs.
- **"[Lee]'s boundary-orientation signs transfer verbatim."** Mathlib's half-space constrains the
  first coordinate, [Lee]'s the last.
- **"Δ = −div ∘ grad."** This repository pins `Δ = div ∘ grad` (12.5's flat gate).
- **"`mpullback (g ∘ f) = mpullback f ∘ mpullback g` unconditionally."** `mfderiv` is junk-valued;
  the chain rule needs differentiability (0.3).
- **"The smooth structure of a covering space is an instance on the total space."** It depends on
  the map (2.3).
- **"Every integral manifold is weakly embedded."** Only the injectively immersed ones with a
  second-countable carrier: the double cover `z ↦ z²` of the circle and the discrete real line fail.
- **"`H^•_c` is functorial for all smooth maps."** Only for proper maps and open inclusions;
  `ℝ → pt` already fails on `H⁰_c` (6.4).
- **"A closed form with values in a normed space is locally exact."** A smooth `c₀₀`-valued
  `1`-form on `ℝ` has no local primitive; the coefficients must be complete (6.2).
- **"Extension by zero exists on every manifold."** On the line with two origins a bump near one
  origin extends discontinuously (6.4).
- **"The de Rham comparison holds for every `IsManifold`."** The line with two origins has
  `H¹_dR = 0` and singular `H¹ ≅ ℝ`: `[T2Space M] [SigmaCompactSpace M]` are load-bearing
  throughout 7–9.
- **"Smooth and continuous chains are homotopy equivalent on every charted space."** On the real
  line with preferred charts `φ_a(y) = ∛(y − a)` smooth paths are constant (8.3's Check), so
  smooth `H₀` distinguishes every point while singular `H₀ = ℝ`.
- **"A smooth simplex extends smoothly to a neighbourhood of the whole simplex."** Local
  extensions into a manifold cannot be patched in the target; local extendability is the
  definition (8.3).
- **"Separately smooth face data extend to a smooth simplex into a target with boundary."** The
  `3`-simplex into `[0, ∞)` of 8.3's Check has a continuous filling with smooth prescribed faces
  and no smooth one; the face-fixing smoothing step is for boundaryless targets only.
- **"The Poincaré pairing is defined on manifolds with boundary."** On `[0, 1]`, `[dx] = 0` in
  `H¹_dR` while `∫₀¹ dx = 1` (9.1).
- **"The degree is defined for noncompact domains, or at critical values without care."** The
  inclusion `(0, ∞) ↪ ℝ` has signed count `1` over `y > 0` and `0` over `y < 0` (10.4).
- **"`Prop`-typed placeholders are acceptable in `Suggested.lean`."** A condition that cannot yet be
  stated is prose in the README, never `def _ : Prop := sorry`.

## Rectifiable curves and geometric measure theory

[GeometricMeasureTheory](../GeometricMeasureTheory/README.md), G1–G2, owns rectifiability,
arclength, variation–speed identities, and Hausdorff length. Consume those results in
planar curve calculus rather than building another metric length theory. The flat planar
Green targets of layer 5.6
own winding numbers, curve integration, and the actual area identity; 5.3
and 5.5b retain half-space and face-structured Stokes, 5.5a retains generic
density integration, and 12.6 owns their post-construction comparison. In 5.6.1, AC trace-nullity and variation–speed
are specializations consumed from G1, whose general metric statements are the single
owned targets; this layer builds their integral and index compatibility.

For continuous BV curves, construct the geometric line integral of a continuous real
1-form along the trace with its traversal multiplicity, using G1's AC arclength
factorization. Prove independence of that factorization, invariance under increasing
continuous onto reparametrizations, and sign reversal under decreasing ones. Prove
agreement with the existing derivative-based `curveIntegral` when the parameter is AC.
The original non-AC parameter cannot in general be differentiated to recover the geometric
line integral. The metric and arclength part of G1 precedes this construction; Green's
theorem for the AC factorization then supplies its rectifiable-curve area specialization.

GMT G6 owns the finite-perimeter and boundary-normal comparison for rectifiable Jordan
domains, consuming that AC boundary-integral identity. [Isoperimetry](../Isoperimetry/README.md),
I3 and I6, owns the sharp curve inequality and circle equality. Neither Green's theorem
nor the metric length foundations depend on the sharp isoperimetric theorem.

## References

- [Lee] John M. Lee, *Introduction to Smooth Manifolds*, 2nd ed., Graduate Texts in Mathematics
  218, Springer, 2013 (theorem numbering of that edition).
- [Tu] Loring W. Tu, *Differential Geometry: Connections, Curvature, and Characteristic
  Classes*, Graduate Texts in Mathematics 275, Springer, 2017.
- [Bott–Tu] Raoul Bott and Loring W. Tu, *Differential Forms in Algebraic Topology*, Graduate
  Texts in Mathematics 82, Springer, 1982 (Ch. I: §2 Mayer–Vietoris, §5 Poincaré duality).
- [Milnor] John W. Milnor, *Topology from the Differentiable Viewpoint*, University Press of
  Virginia, 1965 (§5, the degree).
- Freek Wiedijk, *Formalizing 100 Theorems*, theorem 21 (Green's theorem), with the HOL Light
  statement `GREEN_THEOREM_CURL`.
- Mohammad Abdulaziz and Lawrence C. Paulson, *An Isabelle/HOL Formalisation of Green's
  Theorem*, Archive of Formal Proofs, entry `Green`.

## Acknowledgements

The designs here were settled in the Lean community over several years: [Definition for differential
forms][t1] and [Help wanted: notation for differential forms][t2] (Yury Kudryashov's
bundle-of-alternating-maps design, Sébastien Gouëzel's unbundled-first staging; Dylan Ede, Kevin
Buzzard, Patrick Massot); [Stokes' theorem][t3] and [Current status of the Stokes' theorem][t4]
(Kudryashov's box-integral chain, Michael Rothgang's boundary program); [Orientable surface][t5] and
[Orientation double cover of a manifold with boundary][t6] (Rida Hamadani, Rothgang, Gouëzel,
Heather Macbeth — where the positive-Jacobian definition was refuted for boundaries); [Properties of
wedge product of differential forms][t7] and [Poincaré lemma][t8] (Sam Lindauer, Kudryashov);
[(Pseudo) Riemannian metric][t9], [riemannian geometry][t10] and [Laplacian][t11] (Gouëzel, Macbeth,
Massot, Stefan Kebekus); [integral curves on manifold][t12] (Winston Yin) and [Completed proof of
the Brouwer fixed point theorem][t13] (Brendan Seamas Murphy). Thanks to them and to the authors
named in *Prior work*.

[t1]: https://leanprover-community.github.io/archive/stream/116395-maths/topic/Definition.20for.20differential.20forms.html
[t2]: https://leanprover-community.github.io/archive/stream/287929-mathlib4/topic/Help.20wanted.3A.20notation.20for.20differential.20forms.html
[t3]: https://leanprover-community.github.io/archive/stream/116395-maths/topic/Stokes'.20theorem.html
[t4]: https://leanprover-community.github.io/archive/stream/287929-mathlib4/topic/Current.20Status.20of.20the.20Stokes'.20theorem.html
[t5]: https://leanprover-community.github.io/archive/stream/217875-Is-there-code-for-X%3F/topic/Orientable.20Surface.html
[t6]: https://leanprover-community.github.io/archive/stream/113489-new-members/topic/Orientation.20double.20cover.20of.20a.20manifold.20with.20boundary.html
[t7]: https://leanprover-community.github.io/archive/stream/116395-maths/topic/Properties.20of.20wedge.20product.20of.20differential.20forms.html
[t8]: https://leanprover-community.github.io/archive/stream/116395-maths/topic/Poincar.C3.A9.20lemma.html
[t9]: https://leanprover-community.github.io/archive/stream/113488-general/topic/(Pseudo).20Riemannian.20metric.html
[t10]: https://leanprover-community.github.io/archive/stream/116395-maths/topic/riemannian.20geometry.html
[t11]: https://leanprover-community.github.io/archive/stream/217875-Is-there-code-for-X%3F/topic/Laplacian.html
[t12]: https://leanprover-community.github.io/archive/stream/116395-maths/topic/integral.20curves.20on.20manifold.html
[t13]: https://leanprover-community.github.io/archive/stream/116395-maths/topic/Completed.20proof.20of.20the.20Brouwer.20Fixed.20Point.20Theorem.html
