# Roadmap: differential geometry — forms, de Rham cohomology, flows, and degree

Mathlib has the smooth-manifold core (`IsManifold` over any `ModelWithCorners`, tangent and general
`ContMDiffVectorBundle`s, `mfderiv`/`mvfderiv`, Lie brackets, integral curves, partitions of unity,
the interior/boundary calculus) and a complete *flat* exterior calculus (`extDeriv`, d² = 0,
naturality under pullback), but none of the geometry built on them: no forms on manifolds (no wedge
product even on normed spaces), no manifold `d`, no orientations, no integration or Stokes' theorem,
no de Rham or singular cohomology, no flows beyond the local integral-curve theory, no Frobenius
theorem, no Riemannian Laplacian, no mapping degree.

This roadmap asks for that theory, following [Lee] = John M. Lee, *Introduction to Smooth
Manifolds*, 2nd ed., GTM 218 (cited with that edition's numbering; departures from its route are
marked). The headline theorems are Stokes, the fundamental theorem of flows for Banach models,
Frobenius, the de Rham theorem, Poincaré duality, the equality of the two definitions of the mapping
degree, the hairy ball theorem, and the Laplace–Beltrami operator; everything below them is reusable
library, consumed by the algebraic-topology, geometric-topology, Heegaard Floer and Lie-groups
roadmaps. Suggested homes, by Mathlib's layout:
`TauCeti/Geometry/Manifold/{DifferentialForm,Orientation,Flow,Distribution,Integration,DeRham,Riemannian}/`
and flat prerequisites under `TauCeti/Analysis/`.

## Conventions

State each hypothesis where it is used; never bake it in.

- **Setting and regularity.** `I : ModelWithCorners ℝ E H` and `M` with
  `[ChartedSpace H M] [IsManifold I n M]`, everything over `ℝ`. Pointwise theorems at the lowest
  regularity the flat layer needs (`C²` for the `extDeriv` facts, `C³` for the bracket); the global
  theory — the de Rham complex and everything cohomological — fixed at `C^∞`; no analytic
  refinements. The flat planar statements of 5.6 use their stated absolute-continuity and
  directional hypotheses.
- **Finite dimension** is written `[FiniteDimensional ℝ E]` exactly where it is used: orientations,
  integration, Sard, degree, partitions of unity, 3.3's homogeneity, and all of layer 4. Layers 0–1
  and the rest of 3 stay Banach-general, like `extDeriv` and `IsMIntegralCurve`. Partitions of unity
  and smooth approximation also need `[T2Space M] [SigmaCompactSpace M]`, carried visibly.
- **Completeness** of a coefficient space, `[CompleteSpace F]`, is written wherever forms are
  integrated or primitives taken (5.4, 6.2, 8.4); the algebraic calculus of layers 0–1 keeps its
  generality.
- **Orientation** is chart-sign data (2.1), with fibers `Orientation ℝ (TangentSpace I x) ι` and an
  explicit `Fintype.card ι = finrank ℝ E`; the determinant criteria are theorems, not definitions.
- **Wedge normalization**: for every pairing `μ`, `wedgeWith μ` is the sign-weighted sum over all
  permutations divided by `k! l!`, equivalently the unscaled sum over `(k,l)`-shuffles, as in
  `AlternatingMap.domCoprod`. This is `((k+l)!/(k!·l!)) • Alt (ω ⊗_μ η)`, so elementary covectors
  multiply by concatenation, top-degree wedges are determinants, and Leibniz has unit constants.
  `wedgeWith_apply` pins all degrees; `wedgeWith_apply_one_one` pins the two-term evaluation.
- **Laplacian sign**: `Δ = div ∘ grad`, Mathlib's and the PDE roadmap's; [Lee, Problem 16-13ff] uses
  the negation, so every Laplacian identity imported from the book flips sign.
- **Total functions, junk values**, in the `mfderiv` style, with the real hypotheses on the
  theorems. Every bundled object ships `_apply`/`coe_` lemmas, and every acceptance gate pins a
  concrete nonzero value, because totality makes vacuous statements easy to write.
- **Measurable structure** is never installed on a manifold: integration of top forms and of densities
  needs none, statements about a measure on `M` carry `[MeasurableSpace M] [BorelSpace M]`, and null
  sets of a manifold (`IsNullSet`) are read through charts against Haar measure on the model.
- **Universes and vocabulary.** Spaces live in `Type` wherever singular cohomology is involved.
  The induced map `deRhamCohomology.map` on de Rham cohomology is a `homologyMap` between de Rham
  complexes in one category of modules, so source and target take their model space and carrier
  from the same two universes.
  Vector fields and rough forms are unbundled (`V : (x : M) → TangentSpace I x`, with a `ContMDiff`
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
  interior points as stated. Layer3.6 separately constructs strict inward
  fields and forward semiflows on every finite-dimensional real model with
  corners; 8.3 consumes them for smoothing.
- **5.1–5.3 use the half-space model.** Its boundary is Tau Ceti's smooth
  manifold, with the outward-first orientation. **5.5a defines densities over
  every finite-dimensional real `ModelWithCorners`, independently of faces.**
  **5.5b adds `SmoothFaceStructure I M` for face-indexed boundary and corner
  Stokes.** This is additional smooth local quadrant/face data, not a theorem
  that an arbitrary convex model range has smooth faces. It supplies an abstract
  boundary `∂̃M` of local boundary germs and a smooth proper immersion to M,
  with one point for each germ, including multiplicity at corners. Standard
  half-space, quadrant, product and restriction constructions are required.
  Integration of top forms and densities retains the generic-model scope;
  the face hypothesis belongs only to the face-boundary/Stokes branch.
- **Homotopy and simplex integration do not need corner Stokes.** Homotopy
  invariance (6.3) uses the directly proved cochain-homotopy identity of 5.4;
  de Rham (8.4–8.5) uses the independent standard-simplex Stokes formula.
  Neither consumes 5.5b. Layer12.4 and circle volume do consume 5.5a's
  densities and its elementary integration gates. The early flat Green
  results in 5.6 are independent of the manifold comparison, which is owned
  by the later compatibility milestone12.6.

## What Mathlib already has (consume)

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
  `{Immersion,LocalDiffeomorph,Diffeomorph,SmoothEmbedding}.lean`.
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
  `LinearAlgebra/{Orientation,Ray}.lean`, `Orientation.volumeForm`, `Basis.addHaar`; none of it
  manifold-level.
- **Covering spaces**: `Topology/Covering/{Basic,Quotient}.lean`, `Topology/Homotopy/Lifting.lean`,
  `Geometry/Manifold/Instances/Quotient.lean` (charts on a quotient *below* an action, the only
  covering–manifold bridge in the pin; 2.3 builds the other direction).
- **Homological algebra, complete**: `Algebra/Homology/` (`CochainComplex (ModuleCat ℝ) ℕ`,
  `Homotopy`, `ShortComplex.ShortExact.homology_exact₁/₂/₃`) and the four/five lemma; layers 6–9
  rebuild none of it.
- **Singular homology**: `AlgebraicTopology/SingularHomology/` (`singularChainComplexFunctor`,
  `singularHomologyFunctor`, `H₀`, homotopy invariance); cohomology and the chain-level tools are
  Tau Ceti's (below).
- **Riemannian substrate**: `RiemannianBundle`, `ContMDiffRiemannianMetric`, `IsRiemannianManifold`,
  `CovariantDerivative` with `torsion` and `IsMetricCompatible`, the Levi-Civita connection
  `CovariantDerivative.leviCivitaConnection` (metric-compatible and torsion-free),
  `InnerProductSpace.instLaplacian` and the `Δ` notation class, `Analysis/Calculus/Gradient/`.

## What Tau Ceti already has (consume)

The signature files `Suggested.lean` and `SuggestedGreen.lean` import the existing APIs
consumed by these layers; none is rebuilt.

- **Covering-space theory** (universal-covers roadmap): `TauCeti/AlgebraicTopology/UniversalCover/`
  — universal cover, π₁-action, deck groups, the classification, and `π₁(S¹) ≅ ℤ`
  (`Circle.fundamentalGroupMulEquiv`); 2.4 consumes the two-sheeted case, 10.5 the circle.
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
- **Sard, flat**: `Analysis/Calculus/Sard/OutermostStratum.lean` supplies
  `TauCeti.addHaar_image_criticalPoints_eq_zero`,
  `ContDiff.addHaar_image_criticalPoints_eq_zero` and
  `ContDiff.dense_compl_image_criticalPoints`, with the explicit finite regularity
  threshold `(dim source)^2+1`;10.2 transfers the actual hypotheses through charts.
- **Relative approximation and finite-dimensional cutoffs**: Mathlib
  `Geometry/Manifold/SmoothApprox.lean` supplies
  `Continuous.exists_contMDiff_approx_and_eqOn` and its flat
  `Continuous.exists_contDiff_approx_and_eqOn` form. They retain the closed fixed
  set and its smooth neighborhood. `Analysis/Calculus/BumpFunction/FiniteDimension.lean`
  supplies `IsOpen.exists_contDiff_support_eq`;8.3a/10.2a build the collar and
  compact-derivative-bound adapters, without another approximation engine.
- **Native parametric and level-set theory**: consume
  `TauCeti.Analysis.Fredholm.LevelSet.{Basic,GlobalParametric}` and
  `TauCeti.Geometry.Manifold.VectorBundle.Section.Parametric` at their actual
  finite/Fredholm, second-countability and regularity hypotheses.
  `TauCeti.isFredholm_of_finiteDimensional` discharges the finite-dimensional
  specialization.10.2a supplies its trivial-bundle incidence, collar and
  finite-dimensional null-set comparisons rather than duplicating this engine.
- **Slice charts and embeddings**: `Geometry/Manifold/{SmoothEmbedding,LocallyFlat}/`
  (`TauCeti.IsSliceChart`), `Geometry/Diffeomorphism/`.
- **Singular chains and cohomology** (algebraic-topology roadmap, Stages 2, 3 and 6):
  `AlgebraicTopology/Cohomology/{Basic,HomotopyInvariance,Relative}.lean` —
  `TopCat.singularCochainComplex`, `TopCat.singularCohomology`, homotopy invariance,
  `TopPair.singularCochainComplexShortComplex` and the long exact sequence of a pair — and
  `AlgebraicTopology/Singular/Subdivision/` — `TauCeti.singularSubdivisionHomotopy`,
  `TauCeti.smallSingularChainHomotopyEquiv` and the small-chain quasi-isomorphism. Layer 8
  specializes them to real coefficients and builds on them.
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

## Existing code to refactor

**Smooth 2-forms**, currently defined separately in `Geometry/Manifold/TwoForm/Basic.lean` as
`TauCeti.SmoothTwoForm`, with closedness `TauCeti.SmoothTwoForm.IsClosed` defined chartwise in
`TwoForm/Closed.lean` and symplectic forms (`IsSymplectic`) built on both, migrate to the generic
`SmoothForm I M ℝ 2` in layer 0.4. Refactor the existing implementation, its API and its
symplectic consumers onto that carrier. Any retained `SmoothTwoForm` name is an abbreviation for
the generic type, with compatibility operations derived from the generic API. Closedness becomes
layer 1's `mextDeriv φ = 0`, with the chartwise description a theorem about it. The current
definitions are imported in `Suggested.lean` only to state the migration's preservation laws
against the pinned dependency.

### Existing distribution and Frobenius implementation

Layer 4 consumes the pinned distribution, foliation and graph-coordinate
Frobenius APIs. `TauCeti.IsContMDiffDistribution`, local
`TauCeti.IsInvolutiveDistribution`, the foliation carrier and the local
integral-graph theorem are the shared production interfaces. Extend them
with the restrictions, transport laws and consumers below; do not build a
parallel distribution or involutivity theory. The bundled local record in
`Suggested.lean` is a signature presentation of this data. The pinned files are
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
dependence, and the two hardest items — Banach smooth dependence (3.1) and the smoothing theorem
for chains (8.3) — gate what follows them. `Suggested.lean`, `SuggestedRelative.lean`,
`SuggestedContinuousPaths.lean`, the four `CompactIntegration/` modules,
`FiniteParameterTransversalityTargets.lean` and `SuggestedGreen.lean` provide
nonexhaustive interface prototypes. `SuggestedGreen.lean` is an import-only
compatibility entrypoint for the same Green declarations in `Suggested.lean`;
it defines no second copy. This README is definitive: a real definition wherever
the pin allows one (`mpullback`, `flowDomain`/`flowOf`, `degreeAtRegularValue`,
the gradient compatibility notation, `laplaceBeltrami`, …), otherwise a provisional definition whose
type pins the data (a `sorry` body, never a `Prop`-typed placeholder) with theorems pinning its
characteristic equations. An implementation must provide that data and those laws, not those
definitions.

The companion spellings `not_exists_retraction` and `exists_fixedPoint_closedBall`
are consumer compatibility targets for AlgebraicTopology Stage 2, item 7, with
the same maps and ball/sphere carriers. They authorize no second continuous
fixed-point or no-retraction development; 10.5 owns the degree comparison.

## Prior work and coordination

Cited for design and migration, never as the definition of a target; coordinate with the authors and
confirm licences before porting.

- Yury Kudryashov's `github.com/urkud/DeRhamCohomology` (a wedge taking the pairing as an argument,
  alternating maps between general vector bundles, with manifold `d` on the trivial scalar
  specialization): migration material for layers 0–1 and 6, and the first place to coordinate.
  Design references only, per the convention above: mathlib4#35376 (chart-sign orientations), #26394
  and #26395 (flows), #33714 (metrics), #36845 (Levi-Civita, delivered in Tau Ceti by Hopf–Rinow).
- `github.com/qinz1yang/differential-geometry` (Ziyang Qin, Jack McCarthy, Yuan Liao):
  smooth-section modules, tensor-bundle equivalences, a wedge with its algebra, flat forms with d² =
  0 — blueprint material for layers 0–1.
- Brendan Seamas Murphy's Lean 3 Brouwer fixed-point theorem (singular homology):
  AlgebraicTopology Stage 2, item 7 owns its port and continuous fixed-point API;
  10.5 consumes that API and supplies the degree comparison. The sphere-eversion
  project supplies prior art for partition-of-unity idioms;
  the Meta ATLAS corpus (arXiv:2605.29955) as a reference, never as code.

---

## The build, in layers

Names in backticks denote the cited native APIs or illustrative companion declarations.
This README is definitive; the companions are nonexhaustive and do not replace the stated hypotheses.

### Layer 0: alternating bundles, differential forms, and the wedge

*[Lee, Ch. 12 and 14].*

- **0.1 The wedge.** The generic object is the paired wedge `wedgeWith μ`, with bilinearity, the
  norm bound, compatibility with `compContinuousLinearMap`, and the flip identity `wedgeWith_flip`
  for every pairing. Its normalization is the explicit permutation formula `wedgeWith_apply`,
  with `wedgeWith_apply_one_one` as the smallest evaluation gate; ⚠ associativity
  (`wedgeWith_assoc`) and graded commutativity hold only under
  hypotheses on the pairings, since degree zero reduces them to `μ`. Specializations: the ℝ-valued
  `wedge` (pinned by `wedge_apply_one_one`), `wedgeMul` over a normed algebra, and `bracketWedge`
  along a skew bracket with graded skew-symmetry and Jacobi [Tu, *Differential Geometry*, GTM 275,
  §21]; the interior product is Mathlib's `curryLeft`, whose calculus [Lee, Lemma 14.13] is built
  here.
- **0.2 The smooth alternating bundle.** The `ContMDiffVectorBundle` instance for
  `fun x ↦ E₁ x [⋀^ι]→L[ℝ] E₂ x`, mirroring `VectorBundle/Hom.lean`; all form bundles specialize it.
- **0.3 Rough forms and pullback.** The carrier is `RoughBundleForm I M V k`, with value fibre
  `V x`; `RoughForm I M F k` is its `Bundle.Trivial M F` specialization. Smoothness is
  `IsSmoothBundleForm` in the alternating bundle, specializing to `IsSmoothForm`. Bundle pullback
  `bundleMpullback` through `mfderiv` takes values in the pulled-back bundle `fun x ↦ V (f x)`;
  `bundleMpullback_wedgeWith` pulls back the fibrewise pairing as well as both forms. `mpullback` is the
  fixed-coefficient specialization. Its chain rule carries the differentiability hypotheses
  `mfderiv`'s does (`mpullback_comp_at/_on` and `mpullback_comp`). For fixed coefficients, define
  `RoughForm.mapCoeff L ω` pointwise by
  `fun x ↦ L.compContinuousAlternatingMap (ω x)` for every continuous real-linear
  `L : F →L[ℝ] G`; use Mathlib's native coefficient-postcomposition operation, not a parallel
  alternating-map carrier. Provide identity, composition, zero, addition and real-linearity laws
  in both the map and form arguments, and prove that coefficient postcomposition preserves the
  stated roughness/smoothness class. These calculus targets require normed real coefficient spaces,
  not completeness. The pointwise paired product is
  `RoughForm.wedgeWith`, identified with `bundleWedgeWith` by `bundleWedgeWith_trivial`;
  `mpullback_wedgeWith` is unconditional, and `mpullback_wedge` is its real
  multiplication specialization. Coefficient postcomposition is compatible with paired wedges:
  for `μ : F₁ →L[ℝ] F₂ →L[ℝ] F₃` and `L : F₃ →L[ℝ] G`, let `μ_L` be the continuous
  real-bilinear pairing `μ_L a b = L (μ a b)` and prove
  `RoughForm.mapCoeff L (RoughForm.wedgeWith μ φ η) = RoughForm.wedgeWith μ_L φ η`.
  `C^(n+1)` maps pull `C^n` forms back to `C^n` forms.
  **Open-subtype flat adapter.** For an open `U⊆E` in a real normed model `E`, give the
  open subtype its canonical manifold structure induced by inclusion, with model `𝓘(ℝ,E)`. Use `ContinuousAlternatingMap.ofSubsingletonLIE` at
  `Fin 1` to identify flat degree-one alternating covectors with `E→L[ℝ]F`. Define
  `flatRoughOneFormEquiv`, the pointwise adapter from `RoughForm (𝓘(ℝ,E)) U F 1` to fields `U → (E→L[ℝ]F)`. A rough
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
  of `mpullback_eq_flat`, with its pointwise evaluation law. These comparisons include
  different real normed models, such as `ℝ×ℝ` and `ℂ`.
  Layer 1.5 gives the coordinate and path calculations using these adapters.
- **0.4 Bundled forms.** `SmoothBundleForm` is the submodule of `C^∞` bundle-valued rough forms;
  `SmoothForm I M F k` is its trivial-bundle specialization, closed under the paired wedge for
  every fixed continuous bilinear pairing. General fibrewise products use a smooth bundle pairing.
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
  `𝓘(ℝ, E)`, `mpullback` is the flat pullback (`mpullback_eq_flat`). Add fixed-coefficient
  postcomposition `SmoothForm.mapCoeff L ω` using the same native
  `ContinuousLinearMap.compContinuousAlternatingMap` operation. Its identity, composition, zero,
  addition and real-linearity API must agree with the rough form API; prove it preserves
  `SmoothForm` smoothness. Keep the coefficient spaces normed over `ℝ` and do not add a
  `[CompleteSpace]` requirement for this algebraic or calculus interface. Transfer the
  coefficient-postcomposition/paired-wedge compatibility from rough forms to bundled forms.

### Layer 1: the exterior derivative

*[Lee, Ch. 14].*

- **1.1 Definition.** For fixed coefficients (the trivial-bundle specialization),
  `mextDerivWithin` conjugates `extDerivWithin` through `extChartAt` on
  `(extChartAt I x).symm ⁻¹' s ∩ range I`, chart independence being `extDerivWithin_pullback`; then
  `mextDeriv`, locality, linearity, `mextDeriv_eq_extDeriv` over the model and
  `mextDeriv_ofFunction`.
  On an open subtype `U⊆E`, prove `flat_mextDeriv_zeroForm`: after the degree-zero
  function identification and `flatRoughOneFormEquiv`, the exterior derivative of an ambient
  function `g:E→F` with `ContDiffOn ℝ 1 g U` is the restricted field
  `z↦fderiv ℝ g z`. Consume native
  `extDeriv_constOfIsEmpty` and prove the open-subtype chart comparison. Prove
  `flat_mextDeriv_oneForm`, for an ambient covector field that is `ContDiffOn ℝ 1` on `U`,
  identifying its derivative with native
  `extDeriv` after the arity-one identification. On the real plane, for
  `ω=P dx+Q dy`, this gives `dω=(∂ₓQ−∂ᵧP) dx∧dy`; in particular closedness is exactly
  the zero-curl equation, with the same real or complex coefficient space.
- **1.2 Naturality.** `mpullback_mextDeriv`: `f^*(dω) = d(f^*ω)` for a `C²` map and a `C¹` form,
  `At`, `On` and globally. The primary fixed-coefficient theorem is on the rough fixed-coefficient
  carriers of Layers 0.3 and 1.1: for every continuous real-linear `L : F →L[ℝ] G` and every rough
  form `ω` satisfying the `C¹` hypotheses required by `mextDeriv`, prove
  `mextDeriv (RoughForm.mapCoeff L ω) = RoughForm.mapCoeff L (mextDeriv ω)` in `At`, `On` and
  global forms. Prove its pointwise `Within` form on the same `RoughForm` carriers: for the
  chartwise `C¹`-within hypotheses required by `mextDerivWithin` and
  `UniqueMDiffWithinAt I s x`,
  `mextDerivWithin (RoughForm.mapCoeff L ω) s x =
  L.compContinuousAlternatingMap (mextDerivWithin ω s x)`. Here `UniqueMDiffWithinAt` is precisely the
  flat hypothesis
  `UniqueDiffWithinAt ℝ ((extChartAt I x).symm ⁻¹' s ∩ range I) ((extChartAt I x) x)`;
  this is its definition, with no additional set-membership premise. Prove the flat coefficient
  calculation using `fderivWithin_comp`, the `extDerivWithin` definition and alternatization,
  then lift through the source chart. Real and imaginary projections `ℂ →L[ℝ] ℝ` consume
  this general theorem, not separate coefficient carriers. No coefficient-completeness assumption is needed.
- **1.3 d² = 0 and regularity.** `mextDeriv_mextDeriv` for `C²` forms, and the new flat lemma
  `contDiffOn_extDerivWithin_succ` (`C^(n+1) → C^n` on `range I`) with its transfer
  `isSmoothForm_mextDeriv`, which is what lets `d` map `Ω^k` to `Ω^(k+1)`. Use this
  regularity and Layer 0.4's coefficient-map smoothness preservation to derive the bundled
  `SmoothForm` mirror of Layer 1.2's coefficient naturality for `C^∞` forms.
- **1.4 Cartan calculus.** The vector-valued Leibniz law `mextDeriv_wedgeWith` for every fixed
  continuous bilinear pairing `μ`, with `C¹` hypotheses and unit constants; `mextDeriv_wedge` is
  its real multiplication specialization. This includes Lie brackets and the expression
  `dω + ½[ω ∧ ω]`. A base-dependent pairing has a derivative term; arbitrary bundle coefficients
  require a connection, and the covariant Leibniz law requires compatible connections on the
  pairing's three bundles. Then the invariant formulas
  through `mlieBracket` [Lee, Prop. 14.29, 14.32], the Lie derivative of forms by the bracket
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
  `Manifold.Orientation` is the quotient by the diagonal flip. Then `neg`, `orientationAt` (pinned
  by `orientationAt_mk`), extensionality through it (`Manifold.Orientation.ext`), `Orientable`, and
  `eq_or_eq_neg` on preconnected `M`.
- **2.2 Preserving maps and top forms.** `IsOrientationPreservingAt` and its reversing twin, the
  pullback orientation along local diffeomorphisms and product orientations [Lee, Prop. 15.15];
  nowhere-vanishing continuous top forms ↔ orientations, the smooth direction under
  `[T2Space M] [SigmaCompactSpace M]` [Lee, Prop. 15.5]; the oriented-atlas criterion as a theorem
  for boundaryless `M` [Lee, Prop. 15.6].
- **2.3 Smooth structures on covers.** The charted structure induced on the total space by a covering map `p`, a constructor and ⚠
  never an instance on the type: lifted charts (the chart at a point of `X` is the chart of `M` at its image composed with the local inverse of `p`), `X` a manifold with
  `p` a local diffeomorphism, uniqueness as atlas compatibility, and smoothness
  of continuous lifts (smoothness of a map is detected after composing with the covering map). Shared with the Lie-groups roadmap's
  simply connected covers.
- **2.4 The orientation double cover.** `OrientationCover I M` with `proj`, a topology that is ⚠ not
  the sigma topology (pinned by the covering property of the projection), the induced smooth structure, the canonical
  orientation and the orientation-reversing, fixed-point-free involution `deck`. For connected `M`:
  orientable ↔ the cover is disconnected ↔ it has a section ↔ it is trivial, and `M` is orientable
  when `π₁` has no index-2 subgroup [Lee, Thm. 15.41–15.43]. The **descent API** —
  `invariantPart`/`antiInvariantPart` for an involution, and the descent criterion (a form on the cover is a pullback from `M` exactly when it is deck-invariant) — is
  what 9.2 runs on. *Acceptance:* `Set.Icc x y` and spheres are orientable; the open Möbius band is
  not. Construct `sphereOutwardOrientation n` on Mathlib's native smooth unit sphere
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
  `isOpen_flowDomain`, `contMDiffOn_flowOf`, the group law `flowOf_add` and the escape lemma
  `eventually_flowOf_notMem` [Lee, Lemma 9.19] are discharged from it in place. **The target is its
  extension to Banach models**, joint openness and joint smoothness with `[CompleteSpace E]`
  (`isOpen_maximalIntegralCurveFlowDomain_of_completeSpace`,
  `contMDiffOn_maximalIntegralCurve_of_completeSpace`), stated for Tau Ceti's own objects; this is
  where 3.1 enters.
- **3.3 Completeness and homogeneity.** `IsCompleteVectorField`, the uniform-time criterion,
  compactly supported and compact-manifold completeness (the latter Tau Ceti's),
  the flow of a complete vector field as a Mathlib `Flow ℝ M`; and homogeneity `exists_flowOf_one_eq` on connected boundaryless
  finite-dimensional `M` — ⚠ false Banach-generally, where every compactly supported continuous
  field is zero. `flowOf_mulInvariantVectorField` reconciles with the Lie-groups roadmap's invariant
  curves.
- **3.4 Naturality, straightening, commuting flows.** Conjugate flows of related fields
  [Lee, Prop. 9.6], the straightening theorem `exists_chart_mfderiv_eq_const` [Lee, Thm. 9.22], the
  flow characterization of the bracket `hasDerivAt_mpullback_flowOf` [Lee, Thm. 9.38], commuting
  flows and the canonical form for commuting fields [Lee, Thm. 9.44, 9.46], and Lie derivatives of
  forms via flows [Lee, Thm. 12.37]. *Acceptance:* constant fields flow by translation, the rotation
  field of `ℝ²` by rotation.
- **3.5 Time-dependent flows** [Lee, Thm. 9.48]. For an open time slab
  `J : TopologicalSpace.Opens ℝ` and a smooth time-dependent field on `↥J × M`,
  build the maximal two-time flow by suspending to the autonomous field `(1,X)`.
  Use the open-submanifold and product atlases of `↥J × M`. First build the
  finite-dimensional specialization directly from the native autonomous maximal
  flow on this suspension: `isOpen_timeDependentFlowDomain_of_finiteDimensional`
  and `contMDiffOn_timeDependentFlow_of_finiteDimensional`. Its flow-law,
  inverse and extension adapters likewise consume the native finite-dimensional
  laws, independently of 3.1's Banach ODE theorem. The general Banach specialization uses the
  3.1–3.2 Banach smooth-dependence/open-domain extension. Prove open maximal
  domain, joint smoothness in initial point and both times, identity,
  two-time composition, inverse partial diffeomorphisms, restriction/naturality,
  and the compact-time escape criterion. On finite-dimensional Hausdorff
  boundaryless manifolds, a trajectory remaining in a compact subset through
  a compact time interval inside J extends through that interval; compact M
  gives global flow on every such interval. The two-time domain is the open
  subset of `J × J × M`, in the order `(t,s,x)`, where the suspended solution through `(s,x)` exists
  at elapsed time `t−s`; its M component is the requested flow. Keep the existing
  `exists_timeDependentFlow` as the independent C¹ Banach local target on
  ℝ×M, proved via 3.1; it is not asserted to follow from the C∞ slab theorem.
  For a disconnected open J, the maximal domain stays within the connected
  time component of its initial time, as the suspension domain requires.
  HeegaardFloer F2.1 uses the full finite-dimensional specialization,
  including its compact-time extension, smooth dependence on both time
  variables and initial point, and restriction/naturality. SBC B5 consumes
  this same finite-dimensional specialization.

- **3.6 Inward fields and forward semiflows.** For every finite-dimensional
  Hausdorff σ-compact real smooth manifold with corners, construct a smooth
  strictly inward field and its forward semiflow. Consume native
  `I.convex_range`, `I.nonempty_interior` and `I.isClosed_range` and write
  C=range I. The strict inward cone at x∈C consists of v with some ε,δ>0
  such that `ball(x+tv,εt)⊆C` for 0<t<δ. An interior anchor q supplies
  q−x by `(1−t)x+t ball(q,ε)⊆C`. Prove convexity, positive rescaling,
  and openness over C with uniform ε,δ for initial points in a relative
  neighborhood. Prove transport under C¹ chart changes using invertible
  within-derivatives, the chain rule and quantitative inverse estimates on
  the shrinking interior balls, with a retained radius margin. No finite
  face decomposition or ambient extension is assumed.

  Glue local anchor fields by native
  `exists_contMDiffSection_forall_mem_convex_of_local`, taking each
  convex fiber subset to be the strict inward cone. Prove the within-C¹
  local semiflow theorem for a field on C∩U, U open: choose a ball
  B(x₀,ρ)⊂U, initial points in C∩B(x₀,ρ/2), and a common time so all
  path balls stay in the convex C∩B(x₀,ρ). Use the closed path space
  `γ(t)∈closedBall(x+tX(x),εt/2)` on a common short interval, Picard
  invariance/contraction, bounded within-derivatives and convex-domain
  mean-value/Gronwall estimates. Uniqueness gives chart compatibility.
  Obtain higher joint within-smoothness inductively from the variational
  system `(x,A)↦(X(x),DX(x)A)` on `C × L(E,E)`, whose strict inward
  cone is `cone_C(x) × L(E,E)`; include higher multilinear derivatives and
  uniform compact-parameter estimates. Prove positive-time interior entry
  and its persistence by the quantitative strict-inward/first-exit argument.

  Construct maximal forward times and the forward escape lemma: a
  trajectory remaining in a compact set up to finite maximal time extends
  past it. Build a smooth proper nonnegative exhaustion f using native bump
  coverings/partitions, and rescale by `1/(1+(Xf)²)` so `|Xf|≤1/2`.
  Compact sublevels and the escape lemma give global forward existence.
  Native `ModelWithCorners.isInteriorPoint_iff_of_mem_atlas`,
  `isOpen_interior` and `isInteriorPoint_iff_isInteriorPoint_val` give the
  intrinsic open interior N=`I.interior M` with its inherited model I and
  boundaryless atlas. Obtain second countability from σ-compactness and
  chart countability, then σ-compactness of N from local compactness.

  With j:N→M and r(x)=Φ(1,x), define `H(t,x)=Φ((1−t)²,x)` on ℝ×M.
  Joint within-smoothness and the nonnegative time substitution prove
  smoothness on this all-real domain. Thus H0=jr and H1=id; it preserves
  N at every t and restricts to rj~id_N. Construct this actual
  `InwardDomination` data. This layer owns the inward cone, field and
  semiflow; GeometricTopology retains collar product neighborhoods,
  collar embeddings and their uniqueness. A semiflow alone is not a
  collar for a general convex model. Layer8.3 consumes the domination.

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

The local `Distribution` record in `Suggested.lean` is a bundled
signature presentation of that shared data. Its `fiber` is the
canonical family; its rank and frame fields express the existing regularity
predicate. Its local `IsInvolutive` spelling expands the canonical local
predicate. Neither is a target for a second production implementation.
Any convenience wrapper retained in Tau Ceti must package the existing family
and predicates, and the theorem implementations must use that shared API.
Consume the proved native results through that shared API; a signature
presentation is not a reason to duplicate their implementation.

- **4.1 Distributions and frames.** Consume the existing rank, frame,
  regularity, constant-distribution and contact-distribution APIs. Add the
  restriction, coordinate-transport and annihilator lemmas needed by the
  remaining geometry to those APIs. A frame is a basis of the distribution
  fiber, not just a list of tangent vectors. Existing results are not new
  completion targets.

- **4.2 Integral manifolds and involutivity.** An integral immersion has its
  own smooth `k`-dimensional manifold carrier and a smooth immersion into `M`
  whose differential has image exactly `D` at every point. Define the
  unbundled predicate and its bundled data, with their evaluation laws.
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

- **4.3 Local Frobenius.** On a finite-dimensional smooth Hausdorff
  boundaryless manifold, an involutive smooth distribution has flat charts
  and local integral slices. Transport the distribution into coordinates,
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
  boundaryless source manifolds. Do not assert it for an arbitrary
  parametrizing immersion or an uncountable discrete carrier.

- **4.4 Global leaves.** Construct the leaf through every point on a smooth
  Hausdorff boundaryless manifold. Give it its own charted carrier, not the
  subspace topology on its image. Prove that it contains the specified
  point, is connected, has injective inclusion, and is maximal among
  connected smooth integral immersions through that point. Prove that the
  leaf images partition `M` and that leaves are second countable when `M`
  is second countable. Develop these results on the existing distribution
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
  `boundaryRestriction`, `IsOutwardPointing` with a smooth outward field [Lee, Prop. 15.33], the
  outward-first boundary orientation, characterized by the outward-first rule [Lee, Prop. 15.24], the
  half-space sign for Mathlib's model, and `isNullSet_boundary`.
  For the unit closed ball in `ℝ^(n+1)`, consume Tau Ceti's
  `instChartedSpaceClosedBall`, `instIsManifoldClosedBall`,
  `contMDiff_subtypeVal_closedBall` and `boundary_closedBall`. Construct the smooth
  diffeomorphism from this manifold boundary to Mathlib's native `S^n`, with underlying
  map the identity on ambient points, and prove the boundary orientation agrees with
  2.4's `sphereOutwardOrientation n`. Orient the ball by its ambient inclusion and
  prove the derivative criterion and the outward radial-field law. Include n=0, the
  interval: its right endpoint is positive and its left endpoint negative.
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
  `M × Icc 0 1` for boundaryless `M`, for 10.5.
- **5.5a Densities, for every finite-dimensional real model.** `Density`,
  `RoughDensity`, the density `φ · sign_o` of a top form and an orientation, the integral of
  densities, and its agreement with the integral of top forms give orientation-free integration
  [Lee, Ch.16, "Densities"]. Prove independence of chart, basis and partition
  by the absolute determinant change-of-variables formula. This uses 5.2's
  integral construction and not 5.5b's faces or corner Stokes. Retain the
  elementary gates: the half-space interval FTC from 5.3,
  `|∫_{S¹} dθ|=2π` for `circleAngularForm`, and the unit-square Green formula
  from the independent flat theorem. Circle volume and 12.4 consume this lane.
- **5.5b Smooth faces, abstract boundary and corner Stokes.** Supply the
  following additional geometric **data** `SmoothFaceStructure I M`, on a
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
  Construct the standard simplex face data in barycentric charts: at a
  point choose a positive barycentric coordinate as pivot, use the other
  n coordinates, and restrict the positive coordinates to stay positive.
  The vanishing barycentric coordinates give exactly its local facets;
  prove compatibility of pivot changes and the affine orientation signs.
  This does not feed the independent smooth-simplex Stokes proof8.4.
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
  order has coefficient (-1)^(i+1), since its outward vector is -e_i.
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
  [Lee, Thm.16.25]'s smooth-corner scope with explicit data; it attributes no
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

On `V`, assume only that `P` is continuous, `∂y P` exists at every point (the
derivative of `y ↦ P (x+iy)`), this derivative is area-integrable on `V`, and the zero-extended
fiber-integral function is measurable. Prove

    ∮_{∂V} P dx = −∫_V ∂y P dA.

On a horizontal cell assume the analogous hypotheses on `Q` and `∂x Q`, and prove
`∮ Q dy = ∫ ∂x Q dA`. Derivatives are specified through `HasDerivAt` on coordinate slices,
not through `fderiv` of a field that need not be Fréchet differentiable. In particular, do
not demand the unused partial derivatives or continuity of the used derivatives. Prove the
slice FTC and Fubini steps, and derive the fiber measurability premise from area integrability
where Mathlib's completion and a.e. conventions permit it.

For these identities the boundary integrals are **Henstock–Kurzweil**: develop the oriented
one-dimensional specialization of `BoxIntegral.HasIntegral` on `Fin 1`, with restriction,
finite splitting, reversal, linearity, uniqueness, FTC, and graph substitution. Prove the
named one-dimensional equivalence `hasIntegral_GP_iff_Henstock_fin_one`: `GP` and `Henstock`
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

Deduce the HOL Light specialization: `filledHull K ⊆ U`, and the existing winding number is
`1` at every point of `filledHull K \ K`. The area integral is over `filledHull K \ K`, and
area and boundary integrability are conclusions. Derive the flux version by replacing
`(P,Q)` with `(-Y,X)`: the boundary expression is `X dy − Y dx`, and the area expression is
`∂x X + ∂y Y`, again with both integrability conclusions. The post-manifold compatibility target12.6 proves agreement of these completed
flat identities with the half-space theorem5.3 and face-structured theorem5.5b,
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
uses the flat differentiable-form calculus on `U` and does not consume DG5.5a, DG5.5b or DG6.3. The form
`ω_α` itself is globally defined on `U`; no global real-valued angle potential is asserted.

**Ownership and ordering.** This layer owns the AC and directional planar extensions and
their comparisons with existing rectangle and manifold results. Layers
5.3 and 5.5b retain half-space and face-structured Stokes, and 5.5a retains
generic density integration. Layer12.5 retains Riemannian divergence and
Green's integration-by-parts identities; 12.6 owns their later planar comparison. The completed
[contour integration roadmap](../../Completed/ContourIntegration/README.md) owns the contour
and index APIs consumed above; [conformal mapping](../ConformalMapping/README.md), L5, owns
the filled-hull and planar-separation APIs consumed here. [PDE](../PDE/README.md) owns Green functions, boundary-value
problems, and weak PDE solutions; [modular forms](../ModularForms/README.md) owns its
Petersson/region-Stokes application and can consume these identities. Sequence 5.6.1's curve
calculus and 5.6.2's finite divisions before the approximation and limit passage in 5.6.3.
They use Mathlib's flat calculus and
integration directly. The subsequent comparison12.6 consumes the completed
flat theorem, 5.2/5.3/5.5a, the face data and theorem5.5b when corners occur,
and 12.4–12.5; it has no edge back into any of those producers.

Follow Mathlib's existing `curveIntegral` design, including
[`curveIntegral_eq_intervalIntegral_deriv`](https://leanprover-community.github.io/mathlib4_docs/Mathlib/MeasureTheory/Integral/CurveIntegral/Basic.html#curveIntegral_eq_intervalIntegral_deriv)
and `HasFDerivWithinAt.curveIntegral_segment_source`, and the community's
[Stokes discussion](https://leanprover-community.github.io/archive/stream/116395-maths/topic/Stokes'.20theorem.html)
about gauge integrals. The [Jordan-curve discussion](https://leanprover.zulipchat.com/#narrow/channel/287929-mathlib4/topic/Jordan.20curve.20.2F.20Smooth.20Jordan.20curve/near/569492761)
likewise favours existing maps and regularity hypotheses over a new smooth-Jordan-curve
carrier. Build missing compatibility lemmas in Tau Ceti following those APIs; consume
Mathlib declarations wherever they already express a target.
[SuggestedGreen.lean](SuggestedGreen.lean) imports the AC specialization, one-dimensional
`GP`/`Henstock` equivalence, gauge FTC, and agreement with the interval integral; the markdown
specifies the full layer.

### Layer 6: the de Rham complex and cohomology

*[Lee, Ch. 17].*

- **6.1 The complex and the ring.** `deRhamComplex`, `deRhamCohomology`, the concrete presentation
  through `closedForms`, `exactForms` and the cycle-class map `deRhamCohomology.mk` (`ker_mk`), and
  functoriality (`deRhamCohomology.map`, `map_id`, `map_comp`). The wedge descends
  (the wedge on cohomology), making `H^•_dR(M)` a graded-commutative ℝ-algebra and `H^•_c` a module
  over it.
- **6.2 Degree zero and the Poincaré lemma.** The isomorphism of `H⁰_dR(M)` with
  `LocallyConstant M ℝ`; the *relative* flat lemma `exists_extDerivWithin_eq_of_starConvex` (⚠
  boundary-chart images are not ambient-open), at every regularity `n ≥ 1`; and its manifold
  corollary `exists_mextDeriv_eq_nhds` [Lee, Thm. 17.14]: every point `x` has an open
  neighbourhood `U` and a smooth form `ψ` on the open submanifold `U` with
  `mextDeriv ψ = φ.restrict U`. The primitive lives on `U`, not on `M`: no Hausdorff hypothesis is
  in scope, and on a non-Hausdorff manifold a local primitive need not extend smoothly to `M`.
  Both for a complete coefficient space: ⚠ a smooth `c₀₀`-valued `1`-form on `ℝ` has no local
  primitive.
- **6.3 Homotopy invariance and path integration.** `deRhamCohomology.map_eq_of_homotopy`
  from 5.4, with no boundaryless restriction; `H^{k+1}(E) = 0` for a normed space. Provide
  `pathIntegral` and `isExactForm_of_forall_pathIntegral_eq_zero` for smooth forms and smooth
  paths [Lee, Thm. 17.17], hence `H¹_dR = 0` for simply connected `M`. On an open `Ω⊆ℂ`,
  let `F` be a complete normed real vector space
  (including complex normed spaces by restriction of scalars). Represent a continuous 1-form by
  its continuous real-linear covector field `ω : C(Ω, ℂ →L[ℝ] F)`. Identify this
  field with the degree-one fixed-coefficient flat model from 0.3 and with the continuous-linear-map
  field consumed by Mathlib's `curveIntegral`; do not add a form carrier. Specify local exactness
  by the actual quantified property: for every `z∈Ω`, there are `r>0`, an inclusion
  `hD : ball(z,r)⊆Ω`, and an ambient function `g:ℂ→F` that is `ContDiffOn ℝ 1` on
  `ball(z,r)` and satisfies `HasFDerivAt g (ω⟨w,hD hw⟩) w` for every `w∈ball(z,r)` (with
  `hw` witnessing membership).
  A closed `C¹` form has this property by the disk Poincaré lemma. The path API accepts any
  continuous field with these local potentials. For `a b : Ω` and a native continuous
  `γ : Path a b` in this open subtype, choose a finite subdivision whose subpaths lie in such disks
  and define `continuousPathIntegral ω γ` as the sum of local-potential endpoint differences.
  Prove independence of disks, primitives and subdivision. Establish additivity under
  concatenation, sign reversal under path reversal, and invariance under continuous homotopy
  rel endpoints by subdividing the homotopy square into cells each lying in one potential disk;
  cancel the cell-edge increments, without differentiating the path or applying Stokes to the
  continuous homotopy. For C¹ paths, prove agreement with the existing interval/`curveIntegral`
  formula by the fundamental theorem of calculus. For C¹ maps between open plane domains,
  prove naturality for the pointwise pullback: compose each local potential with the map, which
  remains `C¹` and differentiates to the pulled-back field; shrink to a source disk inside
  the preimage of a target potential disk. On a path-connected `Ω`, prove the exactness criterion
  for this continuous-path API: if every continuous loop has zero integral, define `G(z)` by
  integrating from a fixed base point to `z`; prove path independence and that `G` is a global
  `C¹` potential, locally differing from each disk potential by a constant. Conversely, a global
  potential makes every loop integral zero. If `Ω` is simply connected, derive the zero-loop
  premise from homotopy invariance and `SimplyConnectedSpace.paths_homotopic`. The normalized
  punctured-plane computation is owned by ComplexKahlerGeometry K5a. Apply the exactness criterion componentwise
  on an arbitrary open `Ω`; on the empty domain take the zero potential.
- **6.4 Compact supports.** `compactlySupportedForms`, the compactly supported de Rham complex and `H^•_c`, with the two
  functorialities of opposite variance, extension by zero along an open inclusion (⚠ on Hausdorff `M`: on the line with two
  origins a bump near one origin extends discontinuously) and pullback along proper maps — ⚠ nothing for a
  general smooth map — and `H^•_c(ℝⁿ)` in all degrees [Lee, Lemma 17.27, Thm. 17.28]. *Acceptance:*
  `H^k_dR(ℝⁿ)`; `[dθ] ≠ 0` in `H¹_dR(S¹)`.

### Layer 7: Mayer–Vietoris

*[Lee, Ch. 17].*

- **7.1–7.2** The Mayer–Vietoris short exact sequence of de Rham complexes, sign convention `(res, −res)`, short exact under the
  standing hypotheses; the long exact sequence is Mathlib's, with the connecting map's
  partition-of-unity description [Lee, Cor. 17.42] and naturality.
- **7.3** Its compactly supported variant, arrows reversed by extension by zero, hence
  on Hausdorff `M`. *Acceptance:* `H^k_dR(Sⁿ)` from the two-cap cover [Lee, Thm. 17.21].

### Layer 8: the de Rham theorem

*[Lee, Ch. 18]. Spaces in `Type`. [Lee]'s route — smooth chains and a Mayer–Vietoris induction — not
the sheaf route, which the pin cannot support. Singular (co)homology is the algebraic-topology
roadmap's and largely in Tau Ceti already; this layer builds smooth chains, integration over them
and the comparison with de Rham cohomology on those carriers, and never a second singular theory.*

- **8.1 Singular cohomology, consumed.** Tau Ceti's `TopCat.singularCochainComplex` and
  `TopCat.singularCohomology` with real coefficients (`realSingularCochains`,
  `realSingularCohomology`), functoriality `TopCat.singularCohomologyMap`, homotopy invariance, and
  relative cohomology with the long exact sequence of a pair
  (`TopPair.singularCochainComplexShortComplex`). **Dependencies on the algebraic-topology roadmap's
  Stage 6, not targets here:** universal coefficients (the evaluation
  `H^k(X; ℝ) → Hom(H_k(X; ℝ), ℝ)` and its bijectivity over a field), the cup product, and the
  Mayer–Vietoris sequence of cochains for a binary open cover, dual to its Stage 3 sequence.
- **8.2 Subdivision and small chains, consumed.** Tau Ceti's barycentric subdivision with its
  homotopy to the identity (`TauCeti.singularSubdivisionHomotopy`) and the small-chain theorem
  (`TauCeti.smallSingularChainHomotopyEquiv`, restated as `quasiIso_realSmallSingularChains`)
  [Lee, Thm. 18.4, 18.6]; Mayer–Vietoris in homology (`TopCat.mayerVietorisδ`) is Tau Ceti's too.
  Nothing is built here.
- **8.3 Smooth chains.** `SmoothSimplex` via `SmoothOnSubset` (⚠ local extendability is the
  definition), the boundary `∂σ = Σᵢ (−1)ⁱ σ ∘ δᵢ`, the smooth singular chain complex, and the inclusion
  into Tau Ceti's real singular chains are defined on a charted space. Construct:
  - **Boundaryless smoothing.** For a finite-dimensional T2 σ-compact smooth
    target with `BoundarylessManifold I M`, construct compatible local smooth
    extensions of face data in boundaryless charts by inclusion–exclusion
    over vertex-adapted coordinate projections, which map the simplex to
    its faces. Prove agreement on intersections and extend in target chart
    coordinates; this step need not stay in a boundary target. Relative Whitney
    approximation gives the relative smoothing lemma (a continuous simplex with smooth faces is homotopic rel boundary to a smooth one), then the face
    induction constructs the smoothing chain map and its two chain homotopies. The strict
    face-fixing statement has this boundaryless hypothesis; separate face
    smoothness does not give that statement for targets with boundary.
  - **Smooth prisms and transfer.** Construct chain homotopies for jointly
    smooth homotopies H:ℝ×M→M; composing with a smooth simplex extension
    gives each prism its local extension. For smooth maps j:N→M and
    r:M→N, where N has the boundaryless smoothing comparison, and a specified
    jointly smooth homotopy jr~id_M, put
    `s_M = r_singular ≫ s_N ≫ j_smooth`. Prove both chain-homotopy inverse
    identities using pushforward naturality and the specified smooth prism
    on smooth chains. On continuous chains consume native
    `TopCat.Homotopy.singularChainComplexFunctorObjMap`, given by
    `H.toSSet.chainComplexMap (ModuleCat.of ℝ ℝ)`, after restricting the
    continuous homotopy to the unit interval.
    Construct the actual inverse and homotopies, including the inclusion's
    generator equation. An additional rj homotopy is not needed for this
    domination-transfer statement.
  - **Inward domination.** Consume3.6's actual open intrinsic interior,
    its boundaryless/Hausdorff/σ-compact instances, smooth r and j, and
    all-real homotopy H from jr to id. Apply the boundaryless transfer.
    The generic smoothing chain map and both inverse homotopies are defined from
    this transfer, retaining every finite-dimensional real model with corners.
  - **Scope and naturality.** State the direct strict face-fixing lemma only
    for boundaryless targets. Construct the final chain equivalence for
    every T2 σ-compact finite-dimensional real smooth manifold over
    any real model with corners by the inward route, as well as transfer
    for any explicit boundaryless smooth domination data. Keep the generic
    chain and integration carriers unchanged. Apply the general uniqueness
    up to chain homotopy of an inverse to compare inward choices and deduce
    naturality on homology/cohomology from the natural inclusion: if s,t
    are inverses to i, whisker and compose the inverse homotopies to obtain
    `s~s≫i≫t~t`. Construct this general chain-homotopy lemma. Construct
    `smoothRelativeChains(M,U)` as the quotient by the smooth chains of
    the open U, with its exact sequence and boundary formula. For open pairs,
    apply the absolute construction on M and U and use these exact pair-quotient
    sequences. Dualize the smooth relative quotient and compare it to
    Tau Ceti's actual `TopPair.singularCochainComplex` via
    `TopPair.singularCochainComplexShortComplex`; use the dual inclusion
    and the five lemma for this relative cochain quasi-isomorphism. Over ℝ
    construct the relative chain comparison and its homotopy inverse by
    degreewise cycle/boundary splittings, compatibly with the dual map. An inward deformation need not preserve every open at once.
  Smooth simplices form a sub-simplicial set of `TopCat.toSSet.obj M`; use
  its native chain construction and retain the alternating face signs.
  On the half-line `𝓡∂ 1`, the quadrant `modelWithCornersEuclideanQuadrant 2`
  and the closed square `Icc(0,1)×Icc(0,1)` with model
  `(𝓡∂ 1).prod(𝓡∂ 1)`, construct the comparison and identify H₀ with ℝ
  by total coefficient; every point cycle maps to1. In degree0 verify that
  the de Rham isomorphism sends the class of constant1 to the singular class evaluating
  to1 on every point cycle.

  As a negative example without the boundaryless hypothesis, on Δ³ put
  `s=x+y+z`, `q=x²+y²+z²−(3/2)(xy+yz+zx)` and
  `σ=χ(s) max(q,0)` into the half-line, where χ is a nonnegative smooth
  cutoff equal to1 near0 and0 for s≥1/2. Prove each face locally extends
  smoothly into the half-line but no smooth simplex has these exact faces:
  the forced2-jet gives `τ(r,r,r)=−(3/2)r²+o(r²)<0`.
  Construct pushforward `SmoothSimplex.map` and its chain map under smooth
  maps by pointwise composition, with identity/composition, face/boundary and
  generator formulas. The inclusion sends `single σ a` to coefficient a on
  the native singular simplex represented by
  `σ` composed with the inverse of the affine identification of `fullSimplex p` with `Convexity.StdSimplex ℝ (Fin (p + 1))`; prove its smooth-map naturality square.
  Identify smooth simplices of each open submanifold with those ambient
  smooth simplices whose images lie in that open, respecting all these maps.
  For every open submanifold W of X satisfying the same smoothing hypotheses,
  construct the quotient relative chain complex
  `C_*^∞(X,W)=C_*^∞(X)/C_*^∞(W)` and its map to AT's continuous relative
  singular chains. Prove it is a quasi-isomorphism by the short exact
  sequences of chain complexes and the five lemma from the two absolute
  smoothing comparisons. Prove naturality under smooth maps of pairs,
  relative boundary maps and enlargement of W. For second-countable
  finite-dimensional manifolds, discharge the open submanifold's σ-compactness.
- **8.3a Early relative approximation for vector targets.** Export this cut before
  the smooth-chain and de Rham comparisons. The target is a finite-dimensional
  real normed vector space V; the source is a finite-dimensional smooth T2
  sigma-compact manifold with corners. Consume Mathlib's actual
  `Continuous.exists_contMDiff_approx_and_eqOn`: for a continuous f, a positive
  continuous error function, a closed set C, and smoothness of f on a neighborhood
  of C, it supplies a smooth g equal to f on C and pointwise within that error.
  Retain its source manifold, fixed set, neighborhood and actual maps. This
  native `ContMDiff` result is not by itself a claim of an ambient smooth
  extension at a corner. For the compact interval, closed disc and square,
  construct the stronger actual ambient extension using the flat theorem
  `Continuous.exists_contDiff_approx_and_eqOn` as follows. Extend a continuous
  filling to the ambient vector space by the continuous retractions
  r(t)=max(0,min(1,t)), r(s,t)=(r(s),r(t)) for the square, and
  r(v)=v/max(1,‖v‖) for the closed unit ball. Prove their continuity, range
  and identity-on-domain equations. No smoothness of these retractions is
  claimed. Retain the native Euclidean/product norm and explicit coordinate
  identifications when changing the domain model. The target is boundaryless V.
  No smooth-chain equivalence,
  boundary-target inward deformation, Stokes, degree or Lie theory is an input.

  For an arbitrary continuous filling whose boundary data are smooth, first
  specify a compatible smooth extension of those data to a boundary collar.
  On an interval require the endpoint sitting intervals; on a square require
  compatible edge extensions with common constant values near the vertices.
  Construct a common collar extension by the edge-coordinate maps and a smooth
  partition/cutoff, with the actual overlap equations. For a disc use the
  radial collar of its boundary. A merely continuous boundary trace cannot be
  fixed by a smooth approximation theorem. If the supplied filling agrees with
  the extension only on the boundary, use continuity and compactness to choose
  a sufficiently thin collar and blend the two in V. Prove that this changes
  the filling arbitrarily little in C0, fixes the boundary exactly, and equals
  the chosen extension on a smaller collar. Carry out this blending also in
  an ambient neighborhood of the boundary: use a cutoff supported in the
  domain of the specified smooth collar extension, equal to1 on a smaller
  ambient collar, to replace the continuous retracted extension there. The
  resulting ambient continuous function is genuinely smooth on a neighborhood
  of a closed smaller collar. Apply the FLAT native relative approximation,
  fixing that closed set and choosing a continuous positive error function
  extending a required compact error bound. Its output is an actual ambient
  smooth function; restrict it to the interval, disc or square. Export the actual smooth
  filling, a relative-boundary homotopy given by straight-line interpolation,
  and its comparison with the original filling. If the original was already
  smooth near a prescribed closed collar, fix that smaller collar directly.

  A prescribed compact image reserve in an open U⊆V is preserved by choosing
  a quantitative C0 tolerance: cover the compact reserve by finitely many balls
  contained in U and choose a common smaller radius. Prove that interpolation
  also stays in U on exactly the source subset having that reserve. No
  avoidance property is asserted for an arbitrary original filling through a
  forbidden set. For an already smooth f, export finite C^k perturbation bounds
  separately at10.2a; continuous input has no derivative-closeness assertion.
  Construct restriction, refinement of the fixed collar, relative homotopy,
  coordinate-change and compatible finite-product laws on these same maps.
  This vector-target export does not assert that facewise smooth data admit
  strict smooth extensions into an arbitrary target with boundary;8.3's
  smooth-chain comparison is a different construction.

- **8.4 Simplices, Stokes for chains, the de Rham map.** The full-dimensional `fullSimplex` bridged
  to Mathlib's barycentric `Convexity.StdSimplex`, faces `δᵢ`, integration over a smooth simplex and over smooth
  chains (vector-valued forms in complete spaces); Stokes for the simplex
  (independent of 5.5b) and for chains [Lee, Thm. 18.12];
  the de Rham homomorphism `I_dR` into `realSingularCohomology`, under 8.3's smoothing hypotheses, natural and
  compatible with connecting maps [Lee, Prop. 18.13]. Naturality carries those hypotheses on
  both source and target. Construct smooth cochains by the native
  `linearYonedaObj` dual of smooth chains, and the restriction `res` from continuous to smooth
  cochains by dualizing the inclusion of smooth chains. This restriction is natural under smooth maps
  and a quasi-isomorphism under 8.3's hypotheses. Construct the integration cochain map `∫`
  from the de Rham complex, with evaluation on a chain exactly the chain integral.
  Characterize `I_dR` by
  `H(res) ∘ I_dR = H(∫)`;
  invertibility of the restriction fixes the comparison uniquely.
  Prove that evaluation on a smooth pushforward chain equals
  evaluation of the pulled-back form. Derive the strict naturality square for
  `∫` from this equation, including open-submanifold inclusions.
  Its top edge is `deRhamComplexMap`, with components `mpullbackₗ`;
  its bottom edge dualizes the smooth chain map by the native `linearYonedaFunctor`.
  Prove identity/composition, component equations and agreement of
  `H(deRhamComplexMap)` with the existing `deRhamCohomology.map`.
  For a finite-dimensional T2 σ-compact smooth manifold X and an open
  submanifold W satisfying the same smoothing hypotheses, build relative de Rham
  theory using native
  `CochainComplex.mappingCone` for restriction, shifted by −1 after extending
  the nonnegative de Rham complexes by zero to ℤ. Export the sign-coordinate
  isomorphism in which degree q is
  `Ω^q(X) ⊕ Ω^(q−1)(W)`, with differential
  `(α,β)↦(dα,α|_W−dβ)`. The coordinate map to the native shifted cone is
  `(α,β)↦(α,−β)`: its shifted differential in coordinates `(α,g)` is
  `(dα,−α|_W−dg)`. Prove this is an isomorphism of complexes.
  The prototype `relativeDeRhamComplex` uses the native `mappingCocone` of
  this extended restriction, which is exactly that minus-one shifted cone.
  The cone coordinates in each degree, in degree zero, and the differential in these
  coordinates pin the exported degree spaces and signs.
  Define the connecting map in these exported cone coordinates by
  `δ[b]=−[(0,b)]`. When the cocycle b on W has an extension b̃, prove
  this is `[(d b̃,0)]`; arbitrary forms on W need not extend to X.
  Compare the long exact sequence, including this sign, with the native
  sequence of `TopPair.singularCochainComplexShortComplex` consumed in 8.1.
  Build here the algebraic comparison from the shifted cone of a degreewise
  surjective cochain restriction to its kernel, with the explicit chain map,
  quasi-isomorphism and connecting-map sign. Apply it to smooth and continuous
  singular cochains. This uses no closed-pair, NDR or topological cofiber
  hypothesis. Prove the square-zero law and smooth-pair naturality. Restriction
  of arbitrary forms to W need not be surjective; do not identify the form cone
  with the kernel of restriction.
  Construct relative integration `∫` as the induced cochain-cone map.
  The smooth and continuous cochain restrictions are degreewise surjective
  by extending simplex coefficients by zero, so their shifted cones compare
  quasi-isomorphically with cochains dual to the relative chain quotients.
  Use 8.3's relative smoothing comparison and the absolute de Rham theorem
  8.5 on X and W to prove the relative de Rham isomorphism for this cone, compatibly
  with the two long exact sequences. Before that isomorphism, construct
  the relative de Rham homomorphism `I_dR`, its evaluation formula and the explicit naturality
  square for every smooth map of open pairs: pullback of cone classes
  followed by `I_dR` equals singular-cohomology pullback
  after `I_dR`. Prove identity and composition for these maps.
  A closed α vanishing on W
  gives the relative cocycle `(α,0)`, mapped to the cochain evaluating α on
  relative smooth chains; its absolute image is `I_dR[α]`. Prove this
  formula, naturality of the chain integral for smooth pairs, and compatibility with
  enlargement of W and compact-support relative classes. Layer 9.3 and
  ComplexKahlerGeometry K6 consume these maps and evaluation identities.
- **8.5 The de Rham theorem.** `I_dR` is an isomorphism (`nonempty_deRhamEquiv` states the resulting isomorphism of real vector spaces) for T2 σ-compact finite-dimensional M
  with every real model with corners as in8.3 [Lee, Thm. 18.14]. Prove the boundaryless
  theorem by the reusable **Mayer–Vietoris induction principle**
  `mayerVietoris_induction` — ⚠ whose hypotheses include countable disjoint unions, because
  cohomology does not commute with increasing unions — run over convex opens of `ℝⁿ` and then over
  charts, never through geodesic convexity; it consumes layer 7 and 8.1's cochain Mayer–Vietoris
  sequence. Multiplicativity, that `I_dR` carries the wedge to the cup product, is this
  roadmap's theorem, stated against Stage 6's cup product once that is in the dependency; no cup
  product is defined here. Transfer the comparison to the stated real corner
  models using 8.3's inward maps, smooth homotopy invariance from 6.3
  (adapt H:ℝ×M by `(x,t)↦H((t:ℝ),x)` on M×Icc0,1, with the native
  smooth swap and interval inclusion), and the
  normalized integration/restriction square of 8.4. Prove agreement and
  naturality with that same normalized map. *Acceptance:* the standard loop `t ↦ exp(2πit)` is a smooth cycle with `∫ dθ = 2π` over it,
  and `I_dR [dθ] ≠ 0`.

### Layer 9: Poincaré duality

*[Lee, Problems 18-6 to 18-8; Bott–Tu I §5].*

- **9.1** The Poincaré pairing `⟨[ω], [η]⟩ = ∫_M ω ∧ η`, defined only on T2
  σ-compact oriented boundaryless `M`: ⚠ the hypotheses of Stokes are what make it well defined on
  classes, and on `[0, 1]`, `[dx] = 0` while `∫₀¹ dx = 1`.
- **9.2 Top cohomology.** `H^n_c(M) ≅ ℝ` by integration for connected oriented `M`; `H^n_c(M) = 0`
  for connected nonorientable `M`, and `H^n_dR(M) = 0` if also compact, by descent along the
  orientation cover [Lee, Thm. 17.34].
- **9.3 Duality.** Poincaré duality `H^k_dR(M) ≅ (H^(n−k)_c(M))*`, for T2 σ-compact oriented boundaryless `M` without
  compactness, by the induction principle from the base cases 6.2 and 6.4; corollaries
  `finiteDimensional_deRhamCohomology` for compact `M` and nondegeneracy of the pairing. Not
  through Hodge theory. *Acceptance:* `|⟨[dθ], [1]⟩| = 2π` on `S¹`.

  Own the fundamental-class integration comparison in every dimension on
  finite-dimensional T2 σ-compact smooth boundaryless manifolds N satisfying 8.3's smoothing
  hypotheses, over every finite-dimensional real model with corners I. For compact oriented N and every smooth top form η,
  `∫_N η = ⟨I_dR[η],[N]_ℝ⟩`, with `[N]_ℝ` the real image of
  AlgebraicTopology 6.3's integral class and its local tangent-orientation
  generators. Also build the relative version for compactly supported top
  forms on noncompact N, evaluated on AT6.3's compact-set fundamental classes
  in `H_dim(N)(N,N∖K;ℤ)` for compact supports K. Use AT6.3's
  `RelativeTwistedClassDatum` and `compactSupportTopClass_existsUnique` as the class carrier
  and factory, fed by the tangent-orientation local section. The real class is the coefficient
  image of that integral class; prove the coefficient and local-map comparison squares. DG adds
  no second relative-homology class carrier and owns the smooth-chart/integration comparison.
  Consume 8.4's relative
  integration, the relative de Rham homomorphism, evaluation identities and
  enlargement compatibility, and 8.3's smooth/continuous relative-chain
  comparison for the open complement of a compact partition piece S lying strictly inside
  a chart-simplex interior.
  Ownership is explicit: AT6.3 owns the integral homological orientation system, its
  ordered-simplex point generators, chart/lift/Jacobian comparison, chosen-orientation locally
  represented section, and compact-support class factory. DG9.3 owns the thin
  smooth-to-AT constant-system and real-coefficient comparison maps together with the smooth
  relative/absolute integration comparison and its de Rham-evaluation compatibility. These maps
  convert between existing carriers; DG introduces no second homology carrier, orientation local
  system, or compact-support factory. The local-class normalization and chart
  overlap laws are AT6.3 proof targets, including the signed zero-dimensional point case and the
  full finite-dimensional real model-with-corners scope.
  Coefficient images stored as ℤ-modules must pass through the restricted-scalar image of the
  constant-system isomorphism: the ℝ-linear isomorphism cannot be applied directly to that
  restricted object. `restrictedConstantHomologyIso` is the typed adapter; its local naturality,
  the integer-to-real local-map square, and smooth-relative-to-AT naturality are separate proof
  obligations. Derive the local route and smooth-representative formulas from those squares
  and the geometric local-simplex comparison.
  For each compact partition piece S, place S strictly inside an injective chart-simplex interior
  and keep the simplex boundary disjoint from S. At each y∈S use its unique preimage t=σ⁻¹(y)
  when evaluating the derivative. The chart pair class has the signed local image at every y;
  AT6.3 uniqueness identifies it with the support class. Then derive the local formula from the
  relative de Rham evaluation at β=0 and the one-chart integral identity, and assemble by finite
  additivity. At that β=0 step use that the simplex integral of the zero form vanishes,
  deriving that the chain integral of the zero form over every smooth chain is zero from the finite sum. The support-enlargement map for S⊆K is `(M,M\K)→(M,M\S)`, carrying the global
  K-supported class to its local S-supported class; this is P3. Pin P5 as Kronecker
  pushforward/pullback naturality along `(M,W)→(M,M∖S)`, P6 as linearity in the form α,
  and P7 as finite additivity of the integral of top forms for the partition identity. Derive P7
  directly from Layer 5.2's form-additivity theorem by finite induction. State these as
  lemmas of the construction.
  In dimension zero, identify the chosen class for compact support K with
  `Σ_(x∈K) ε_o(x)[x]`, where ε_o(x) is AT6.3's orientationSignAt o x,
  viewed as the integer ±1; compact K is finite because a zero-dimensional
  manifold is discrete. Consume AT's positivePointClass and the shared
  general-model orientationSignAt, including its identification with the
  Euclidean-zero-dimensional prototype through the fresh carrier.
  Prove that volume on EuclideanSpace ℝ (Fin 0) and Basis.addHaar of the
  empty basis are both the unit Dirac point mass. Positive point orientations
  use the one-chart formula. For negative point orientations apply the
  orientation-negation law on the singleton open chart and then add the
  finitely many contributions; no negatively oriented empty basis is assumed. For a smooth compactly supported zero-form α prove
  `∫_M α=Σ_(x∈α.tsupport) ε_o(x)α(x)` (evaluate the zero-form on
  the unique empty tuple), including empty support. Prove the corresponding
  signed zero-chain evaluation and identify it with AT's chosen integral class.
  Own the named zero-simplex evaluation lemma: for every smooth 0-simplex σ and
  0-form α, the integral of α over σ is α evaluated at the simplex's unique
  point and the unique empty tuple. Derive it from the defining formula of the simplex integral and the
  dimension-zero unit point-mass normalization. For smooth maps use the actual relative
  Kronecker pushforward/pullback naturality with explicit pair/support hypotheses (for example,
  K contains f⁻¹(L)); do not claim integral invariance for arbitrary smooth maps. Prove integral
  invariance for orientation-preserving diffeomorphisms. For smooth open embeddings
  `f:N→M` that are local diffeomorphisms between arbitrary finite-dimensional real models
  of the same dimension, prove `∫_N f*ω=∫_M ω` when f preserves the chosen orientations
  and ω has compact topological support contained in range f. Require the Hausdorff and
  σ-compact hypotheses used by the integration construction on both manifolds. In particular,
  use the fresh Euclidean interior carrier C and val:C→M, with orientation pulled back from M,
  to prove this formula for every compactly supported top form on M whose support lies in
  int M, even when M has boundary. Combine it with AT6.3's open-embedding support-class map
  and its local-image comparison to obtain the interior compact-support class formula on M.
  Any proper-map degree formula requires a connected target or componentwise degree and
  belongs to Layer 10, not this integration milestone. SmoothBundlesConnections B6.2 consumes its ℂP¹ instance;
  ComplexKahlerGeometry K6 consumes both the compact and relative formulas.

  Also own the smooth-boundary compatibility target for compact oriented m-manifolds
  over the standard half-space model `𝓡∂ m`, m>0. Let U be the image of a whole-boundary
  topological collar `∂M×[0,1)→M` equal to the inclusion at parameter0.
  For Hausdorff second-countable M use AT6.3's compact-domain Brown collar
  construction from the native smooth local boundary product charts, and
  its twisted boundary-system and class comparisons. Let α be a smooth top
  form on M and β a smooth (m−1)-form on U, with `α|_U=dβ`.
  Use AT6.3's oriented relative class and its homology isomorphism induced by
  the identity-ambient pair map `(M,∂M)→(M,U)`, and 8.4's relative de Rham
  class `[α,β]`. Prove
  `⟨I_dR[α,β],[M,U]_ℝ⟩ = ∫_M α − ∫_{∂M} β|_{∂M}`,
  with the outward-first boundary orientation. Here β is defined on U; its boundary
  form is the pullback along the smooth map `j:∂M→U`, with j(x)=x and
  membership in U proved from the collar's parameter-zero identity c(x,0)=x.
  Prove j smooth by factoring the native smooth boundary inclusion through
  U's induced open-submanifold structure; no derivative of the topological
  collar is used. Thus `j*β` is the
  displayed boundary integrand. Pin the integer class by AT6.3's interior
  embeddingIntegralLocalMap applied to the fresh carrier pointGenerator with
  DG2.2's pulled-back orientation. Use the compact-support open-excision
  comparison, not the boundaryless-only original-carrier homeomorphism.
  To derive the formula, choose a closed neighborhood A of ∂M with A⊂U
  and ∂M⊂int A. Apply native exists_contMDiffMap_one_nhds_of_subset_interior
  from Mathlib's Manifold/PartitionOfUnity to obtain a smooth ρ equal to 1
  near ∂M and vanishing outside A. Compact Hausdorff M supplies its normality
  and sigma-compactness hypotheses. Since A is closed, tsupport ρ⊂A⊂U.
  Use compactness of ∂M to shrink the collar uniformly to U′ within the
  neighborhood where ρ=1. Extend ρβ by zero to a smooth
  (m−1)-form γ on M. Subtract the cone coboundary d(γ,0):
  `[α,β]=[α−dγ,β−γ|_U]`. After restriction to (M,U′) the second coordinate
  vanishes and α−dγ is supported in the interior, since α=dβ there.
  Apply the interior compact-support formula to α−dγ and Stokes to γ;
  j*γ=j*β supplies the boundary integral. Prove independence of cutoff
  and collar shrinkage through the relative-class and restriction comparisons. For α supported
  away from ∂M take β=0 on a smaller collar and prove agreement with the interior
  compact-support class factory. Pin the interval test on D¹, the native closed
  unit ball with model 𝓡∂ 1 and standard orientation: α=0 and β locally
  constant on its two collar ends, with values c₊ at +1 and c₋ at −1.
  The relative pairing is −(c₊−c₋), since ∂[D¹]=[+1]−[−1]. Dimension zero is
  covered by the signed point formula above; no corner-stratum comparison is assumed
  by this smooth-boundary target.


### Layer 10: the Brouwer mapping degree

*[Lee, Ch. 17, "Degree Theory"].*

- **10.1 Regularity floor.** Define `IsRegularPoint f x` by surjectivity of
  the actual `mfderiv f x`, and `IsRegularValue f y` by this condition at every
  point over y. These predicates and their restriction/chart formulas use only
  native differentiability, before degree, cohomology or Sard. Their level-set
  theorems here use boundaryless source charts, or the intrinsic interior of
  a collared source. Separately consume
  `TauCeti.isLocalDiffeomorphAt_of_mfderiv_eq` and
  `TauCeti.isLocalDiffeomorph_of_mfderiv_eq` when the derivative is an actual
  continuous linear equivalence. Discharge the native interior-point premise
  on a boundaryless source. Surjectivity alone is not invertibility or a local
  diffeomorphism in unequal dimensions.10.2a consumes complemented-kernel
  level-set charts for the surjective case.
- **10.2 Sard.** Construct `IsNullSet` through charts,
  `isNullSet_image_criticalPoints` and `dense_isRegularValue` from Tau Ceti's
  actual flat Sard theorem [Lee, Thm. 6.10-style]. For a boundaryless
  finite-dimensional source, localize on the actual open chart domains and
  use countably many charts; retain the native differentiability order
  `(dim source)^2+1` when citing that theorem. C∞ maps satisfy that bound.
  Use the explicit theorem on a set with smoothness at every point of that
  set; no extension of a coordinate map outside its open domain is assumed
  smooth. For positive-dimensional target models null sets have empty
  interior. For dimension0 every derivative is onto and critical values are
  empty. The target's additive Haar/chart comparison, changes of chart and
  countable unions are part of this export; orientation, Stokes, degree,
  compactness of the source and a sharp finite-regularity Sard–Smale theorem
  are not prerequisites.

  Own its sharp finite C^k refinement for boundaryless sources, first on
  Euclidean spaces and then through open charts: for positive target dimension, k>max(dim source−dim target,0).
  Follow Hirsch,
  *Differential Topology*, Chapter3, Theorem1.3 (or Federer3.4.3), proving
  the critical-stratum induction at that bound rather than using the existing
  quadratic regularity threshold. An accessible detailed Euclidean proof is
  Azagra–Ferrera–Gómez-Gil, [The Morse–Sard theorem revisited](https://arxiv.org/abs/1511.05822),
  Theorem1.1 and Sections2–4, for positive target dimension and source
  dimension at least target dimension. Prove the lower-source-dimension and
  zero-source-dimension cases by the elementary local dimension/measure
  argument and countability. If the target has dimension zero, every derivative
  is surjective and there are no critical points; retain any differentiability
  hypotheses of the regular-value interface, without imposing the displayed
  positive-target Sard bound. For chart globalization, prove the flat `ContDiffOn`
  theorem on open sets (or its bump-function localization) before passing to
  countable manifold charts. HeegaardFloer F0 consumes this single
  finite-dimensional theorem; HeegaardFloer F0 owns the sharp Fredholm
  Sard–Smale extension.
#### 10.2a Finite-parameter relative transversality

Build the following shared finite-dimensional export from native calculus,
relative approximation8.3a, level-set charts and Sard. It has no Lie-group,
root-system, Coxeter, degree or de Rham prerequisite. LieGroups6 owns its
singular-image path/disc application; RootSystems2G owns the arrangement jet
families, codimensions, finite-event movies and word extraction.

**Actual equations and domain.** Let P and V be finite-dimensional real normed
vector spaces, M a Hausdorff second-countable boundaryless finite-dimensional real smooth
manifold, U⊆M×P open, and F:U→V smooth. For a smooth j:N→V with N Hausdorff second-countable,
boundaryless and finite-dimensional, use the actual incidence carrier
I={(x,p,y):(x,p)∈U and F(x,p)=j(y)}. Transversality of the slice at p means
surjectivity of (u,v)↦d_xF(x,p)u−dj(y)v at every such equality, not that j is
an embedding or proper. Universal transversality is the corresponding surjectivity
in (x,p,y). Construct the trivial-bundle equation F−j, its actual derivative,
zero-set inclusion and projection to P, with restriction and chart-change laws.
Submanifold incidence conditions in a finite-dimensional target are handled by
normal/submersion charts and their actual tangent quotients. Independence of
those charts is a theorem about these derivatives, not a new private regularity
predicate. Product and equality constraints retain all their actual operands.

**Reuse the generic parameter theorem.** Consume
`TauCeti.IsRegularSectionParameter`, its trivial-bundle comparison, and
`TauCeti.isMeagre_setOf_not_isRegularSectionParameter`/
`mem_residual_setOf_isRegularSectionParameter` from
`Geometry/Manifold/VectorBundle/Section/Parametric.lean` for the equation on M×N
with parameter P. In flat coordinates consume
`TauCeti.IsRegularParameter` and
`mem_residual_setOf_isRegularParameter` from
`Analysis/Fredholm/LevelSet/GlobalParametric.lean`.
Prove the actual permutation-of-products and fixed-parameter derivative
comparisons. All operators between the finite-dimensional source and target
models are Fredholm by `TauCeti.isFredholm_of_finiteDimensional`. The C∞
hypothesis discharges the native quadratic kernel-dimension regularity bound;
no sharp finite-regularity Sard–Smale theorem is assumed. The actual universal
zero set is second countable. Native residual regular parameters and Baire's
theorem give choices in every nonempty open parameter neighborhood. Finite and
countable lists use intersections of residual sets, not an unjustified
intersection of arbitrary dense sets. Give each map/manifold in a countable
list its own finite dimension; no uniform finite dimension for the list is needed.
These adapters do not rebuild the existing Fredholm or parametric engine.
For a joint open domain U that is not a product, do not extend the equation
by a junk value and apply the global theorem to its false outside zeros.
Cover the ACTUAL universal incidence in U by countably many product coordinate
neighborhoods. Consume the local native
`exists_mem_nhds_isClosed_isNowhereDense_image_not_surjective_levelSetParameterMap`
on each such neighborhood, with its actual smooth equation and surjective
Fredholm derivative. Prove that every bad actual parameter is in the resulting
countable union of local bad-parameter sets. Extend those sets to P using the
actual open parameter charts; the local nowhere-dense/residual argument and
the chart-Sard null argument then give the same open-domain export. These
neighborhood, countability and restriction comparisons are explicit adapter
targets, not an assumption that all coordinate zeros are genuine incidences.

For the incidence carrier additionally export its finite-dimensional level-set
atlas, inclusion and tangent-kernel equations. Consume the native complemented-
kernel implicit-function/level-set charts, their smooth inverse and manifold
comparisons in `LevelSet.{Basic,Smooth,Tangent,Manifold}`, including both local
inverse equations and chart transitions. At a nonempty incidence universal
surjectivity gives the required nonnegative kernel dimension by rank-nullity;
when the total dimension is smaller than dim(V), incidence is empty. At an incidence point the projection to P is regular
exactly when the slice difference derivative is onto: prove this by solving
A u+B h=0 and using universal surjectivity, in both directions. Construct the
native `mfderiv` and coordinate comparisons on the actual open domain; extended
coordinate zeros outside the charts are not incidence points. For finite-dimensional
P, prove the bad parameters have additive-Haar outer measure zero by applying10.2's
native flat Sard theorem on countably many incidence charts to that projection.
Its C∞ hypothesis meets the existing quadratic source-dimension bound. This
null refinement is an explicit finite-dimensional construction, distinct from
the already implemented residual theorem. Neither properness nor closedness
of the image of j is a premise. The zero-dimensional target is direct. For a zero-dimensional parameter
space universal surjectivity is already slice surjectivity, so regularity is
automatic; do not invoke positive-dimensional measure arguments there.

**Cutoffs and small relative perturbations.** For a compact real source with
corners of dimension1 or2, work on its intrinsic interior for the incidence
charts and use specified ambient smooth extensions on its boundary collar.
Let C be a closed collar region containing the boundary, lying inside a specified
region where the given f is already transverse to every j. Fix C and retain
an open buffer of that already-good data; do not infer such a buffer from a
nonproper image or from boundary transversality alone. In a global Euclidean source
consume `IsOpen.exists_contDiff_support_eq` on the complement of C to obtain
0≤beta≤1, beta=0 on C and beta>0 off C. For a general manifold source use
the native smooth partition of unity subordinate to the TWO-open cover
{B,M\C}, where B is the specified open already-good buffer containing C.
Take beta to be the M\C term. Prove beta=0 on C and beta=1 off B; its
actual zero set Z={x:beta(x)=0} therefore satisfies C⊆Z⊆B. Transversality
is supplied on all of Z by the B hypothesis. Do not claim that an arbitrary
locally finite family supported outside C has support exactly M\C at
boundary accumulation points of C. Export the actual zero-set inclusions,
locally finite derivative laws and all-order chart formulas. No global
compact-support claim is inferred from positivity on a noncompact interior.

Use the actual family F(p,x)=f(x)+beta(x)p, in the global vector target V.
Prove its smoothness, fixed-set equation, parameter derivative beta(x)id_V,
and source derivative df(x)+d beta(x)(−)p. At beta>0 the parameter derivative
is onto. At a zero in the intrinsic interior, nonnegativity makes d beta=0
and the already-good slice supplies universal transversality. Near the actual
boundary beta is locally zero because C contains a boundary neighborhood;
there use its zero-neighborhood derivative equation. Mere one-sided
nonnegativity at a boundary point would not force its ambient derivative to
vanish. These two cases give the required fixed-collar comparison. Thus no unproved openness of transversality
against an arbitrary nonproper j is needed. Apply the native parameter adapter
on the interior, and combine it with the fixed collar. Export simultaneous
transverse perturbations arbitrarily close in every prescribed finite C^k
norm on the compact source. Define that closeness by bounds on the actual
iterated chart derivatives in a specified finite compact coordinate cover,
including derivative order0. Prove the bounds
sup_K‖D^i(F_p−f)‖≤B_i‖p‖ for 0≤i≤k from bounded derivatives of beta on
those compact chart sets, and choose a common small parameter ball. Transport
between such covers and equivalent finite-dimensional norms. This is finite
C^k closeness of smooth inputs, not a new finite-regularity transversality theorem.
Export fixed-set/collar refinement, finite-list combination, reindexing,
coordinate and affine-target transport and the relative straight-line homotopy.

For continuous fillings first apply8.3a. Boundary conditions must already admit
the specified smooth collar extension; after that construction the perturbation
fixes its smaller collar. Keep any compact avoidance reserve by the quantitative
C0 estimate. An arbitrary continuous filling is compared to the output relative
to its original boundary, while an already-smooth filling has the stronger
prescribed finite C^k approximation. A homotopy through the forbidden set is
not excluded unless its image reserve was actually supplied.

**Avoidance and configuration-domain exports.** If dim(M)+dim(N)<dim(V), a
transverse equality is impossible. Prove this dimension consequence from the
actual slice derivative and conclude F_p(M)∩j(N)=∅. It applies simultaneously
to a finite or countable family of smooth parametrizations without asserting
that the union of their images is closed or embedded. For paths and discs,
retain the source dimensions1/2 and the exact caller's singular-image dimensions;
compactness or closedness used to manufacture a boundary avoidance collar is
additional caller data. Constant maps, an empty list, dim(V)=0 and empty
incidence are explicit boundary tests.

Export the same finite-parameter result on arbitrary specified open configuration
domains, including two distinct points and the equal-time submanifold, with
countable coordinate covers near the removed diagonal. The parameter family
must be smooth and its universal evaluation transverse for every imposed
incidence stratum; the consumer proves the needed one-/two-point jet evaluation
surjectivity and rank/codimension bounds. No fixed positive distance between
the points, compact exhaustion uniformity, or event finiteness is assumed.
Transversality alone does not establish a finite movie. RootSystems2G's separate
compactness, local fan/fold analysis and boundary buffers provide that conclusion.
The companion `FiniteParameterTransversalityTargets.lean` illustrates actual
family/equation/derivative and native regular-parameter interfaces; this README
is definitive and its target scope includes all the chart, collar and manifold
comparisons above.

**Retained generality of the existing local export.** The displayed global
statement uses Hausdorff M,N. Retain the earlier10.2a lane for an arbitrary
second-countable boundaryless parametrizing manifold N without a global T2
hypothesis: choose a countable atlas, restrict j to each actual Hausdorff open
coordinate domain and apply the open-domain result there. Intersect the
countably many residual parameter sets, and use the invertible chart derivative
to recover the original slice transversality at every y. No partition of unity
on N or Hausdorffness of its entire incidence carrier is a premise of this
chartwise lane. Likewise, a general finite-dimensional smooth parameter
manifold is handled in its actual open parameter charts; transport residual
and chart-null assertions under the coordinate diffeomorphisms and state
choices in each specified nonempty open neighborhood. The elementary
translation family has the particular global parameter space P=V.

Keep the old relative construction for every compact finite-dimensional
Hausdorff real source with corners of dimension1 or2, not only the standard
interval/disc/square. Specify the actual compatible ambient smooth extensions
of its already-fixed boundary-collar data. Native8.3a relative approximation
on M fixes a smaller closed collar after the stated blending. Its output has
an actual ambient chart extension near every boundary point because it agrees
there with the supplied extension; in the intrinsic interior the chart domain
is open, so native smoothness gives the actual local extension. The cutoff
is identically zero near the boundary and can be extended there by zero.
Thus the same parameter/derivative/finite-C^k construction is chartwise smooth
on the full source with the specified boundary data. Compactness provides a
finite chart cover and its countability; no inward domination or strict
face-relative simplex extension into a boundary target is used. The explicit
retractions above additionally construct one ambient function for the three
standard filling domains required by the consumers.

The sharp finite C^k Sard refinement in10.2 remains a separate required
construction with its stated hypotheses. This early C∞ export neither
replaces that stronger target nor assumes it implemented.

- **10.3–10.4** Finite fibres over regular values, the real definition `degreeAtRegularValue` at a
  specified regular value, and [Lee, Thm. 17.35]: `∫_M f^*ω = deg · ∫_N ω`, via Stokes and 3.3's homogeneity; hence
  `degree` and its identification with the action of `f^*` on `H^n ≅ ℝ`.
- **10.5 Degree calculus.** Homotopy invariance, `degree_id`, `degree_const`, composition,
  `surjective_of_degree_ne_zero`, `degree_antipodal`; the continuous extension for sphere targets
  and, through 8.3, general targets. Consume AlgebraicTopology Stage 2, item 7’s
  `noRetraction_diskBoundary`, `brouwerFixedPoint_topCatDisk` and
  `brouwerFixedPoint_compactConvex`, with its normed-ball comparison. Prove
  `degree_eq_zero_of_sphereMap_extends`: a smooth sphere self-map with a
  continuous extension to the disk has degree zero, using the continuous
  degree extension and homotopy invariance. With `degree_id`, identify this
  degree obstruction with AT’s no-retraction theorem and consequent
  fixed-point argument. The generic continuous theorems have that single
  topological owner.
  Reconciliation with Tau Ceti's `Circle.fundamentalGroupMulEquiv` on `S¹`
  (`fundamentalGroupMulEquiv_map_eq_zpow_degree`). *Acceptance* (dimension `≥ 1`; ⚠ on a point the
  constant map is the identity): `deg id = 1`, `deg const = 0`, `deg (z ↦ zⁿ) = n`,
  `deg antipodal = (−1)^{n+1}`.

### Layer 11: the hairy ball theorem

*[Lee, Problem 16-6, by the degree route].*

- **11.1** `exists_eq_zero_of_inner_eq_zero`: every continuous tangent field on an even-dimensional
  sphere vanishes somewhere, by smooth approximation, the great-circle homotopy to `antipodal`, and
  `(−1)^{n+1} ≠ 1`.
- **11.2** The section form `exists_eq_zero_of_continuous_section` (⚠ bridged by
  `mfderiv`-composition, not through `range_mfderiv_coe_sphere`), the nonvanishing field on odd
  spheres, and the dichotomy `exists_nonvanishing_tangent_field_iff`; not through Euler
  characteristics.

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
  on the target. Prove `immersionMetric_inner`. Prove
  `immersionMetric_contMDiff` for every `n : ℕ∞ω`, a C^(n+1) map and C^n target
  metric, consuming the native bilinear pullback regularity theorem. Prove
  `immersionMetric_eq_induced` in the real-inner-product target case. Include
  restrictions, smooth isometry transport and identity/composition of pullbacks.
  Build product, `Opens` and boundary metrics. Consume the existing analytic
  `sphereRoundMetric` and its instances on spheres and Circle; `roundMetricCircle`
  in the prototype selects that same native instance. The new circle target is
  its volume comparison `volume_circle`, using the angular integral gate of 5.5a.
- **12.2 Gradient.** Define `mgradient I f x` as the fibrewise Riesz dual of
  `mfderiv I 𝓘(ℝ) f x`, through the pinned `Riemannian.Tensor.rieszDual` of
  `TauCeti/Geometry/Manifold/VectorBundle/Riemannian/Riesz.lean`; its defining
  identity `inner_mgradient` is that file's `inner_rieszDual`. Prove the zero and
  negation identities, and that `mgradient f` is a `C^n` vector field when `f` is
  `C^(n+1)` on a `C^(n+1)` manifold with a `C^n` metric, from the chartwise
  `contMDiffAt_rieszDual` (which assumes exactly these regularities).
  Add the chain/product rules, smooth pullback/isometry transport and flat-model
  equality with Mathlib's `gradient`.
- **12.3 Divergence, Hessian, Laplacian.** `divergence` (the trace of `leviCivitaConnection X`),
  `hessian` (symmetric), `laplaceBeltrami := divergence ∘ mgradient`, the trace of the Hessian
  (`laplaceBeltrami_eq_sum_hessian`), in the `Δ` notation class.
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
  Construct the induced boundary metric by pullback along the native smooth
  boundary immersion, with its smoothness/continuity and native
  `TauCeti.riemannianVolume` on that boundary. Construct the unique smooth
  outward unit normal N along the boundary: norm one, orthogonal to the
  image of its tangent space, with decreasing constrained coordinate.
  Then prove integrability of `div X` and `x↦⟪X(x),N(x)⟫` for their respective
  measures and the equality `∫_M div X dV = ∫_{∂M} ⟪X,N⟫ dṼ`
  [Lee, Thm.16.32]. The signature `integral_divergence_eq_boundaryFlux`
  includes exactly that support alternative, and its integrability companion
  proves that neither side is being interpreted through a nonintegrable
  Bochner junk value. The same result holds at C² manifold/C¹ metric/C¹
  field regularity where the connection and density identity are defined;
  specify those finite-regularity restrictions and their smoothing/direct
  local proof. The representative prototype uses the smooth case.

  No global orientation is necessary: on oriented M identify this with
  5.3 applied to `ι_X dV`; in general patch the oriented chart identities
  as densities. Prove independence of local orientation. Empty boundary
  recovers `integral_divergence_eq_zero`. On boundaryless M retain
  `integral_mul_laplaceBeltrami` and `integral_laplaceBeltrami_symm` for the
  stated compact supports. On M with boundary retain the boundary Green
  identities obtained by substituting f grad g, with their same support
  hypotheses and outward-normal term. In the face-structured case use
  `SmoothFaceStructure I M`: pull back the metric to each sheet of ∂̃M,
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
  *Acceptance:* `laplaceBeltrami_eq_laplacian` (the sign gate), `Δ‖x‖²=2n`,
  `volume_circle=2π`; the half-line compact-support formula is
  `∫₀^∞ X'(t)dt=-X(0)`, and n=0 boundary volume assigns each endpoint mass
  one. The unsupported constant field X=1 on the half-line is excluded
  by the support hypothesis, not by an integrability convention.
- **12.6 Planar/manifold compatibility, after both producers.** Consume
  the completed flat theorems5.6.1–5.6.3, half-space Stokes5.3,
  density integration5.5a, the face construction/theorem5.5b when needed,
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

- **"Separately smooth face data always extend to a smooth simplex into a
  boundary target."** On a3-simplex into `[0,∞)`, prescribe near the origin
  `(y−z)²`, `(x−z)²` and `(x−y)²` on its three coordinate faces. Add a smooth
  nonnegative bump of x+y+z, zero near0 and at least1 near the opposite face,
  to make compatible smooth nonnegative data on all four faces. Put
  `Q=x²+y²+z²−2xy−2xz−2yz`; a continuous filling is
  `max(Q+ψ(x+y+z),0)` for that bump ψ. On the opposite face Q≥−1/3,
  so this filling has the prescribed smooth positive face values. A smooth filling with these faces
  would have zero value/gradient and Hessian with diagonal2/off-diagonal−2
  at0; along `(t,t,t)` its value is `−3t²+o(t²)<0`, a contradiction.
  Thus8.3's strict face-fixing lemma is boundaryless; its full convex-corner
  chain equivalence is constructed separately by inward domination.

- **"Orientable = admits a positive-Jacobian atlas", as a definition.** `Set.Icc 0 1` is orientable
  but its two charts cannot be made positively transitioning; chart signs are the definition (2.1),
  the atlas criterion a theorem for boundaryless `M`.
- **"The sigma topology on pointwise orientations is the orientation cover."** It is discrete, so
  the projection is not a local homeomorphism.
- **"`H^•_c` is functorial for all smooth maps."** Only for proper maps and open inclusions;
  `ℝ → pt` already fails on `H^0_c`.
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
- **"Degree is defined for noncompact domains, or at critical values without care."** The inclusion
  `(0, ∞) ↪ ℝ` has sign sum `1` over `y > 0` and `0` over `y < 0`.
- **"The de Rham comparison holds for every `IsManifold`."** The line with two origins has
  `H¹_dR = 0` and singular `H¹ ≅ ℝ`; `[T2Space M] [SigmaCompactSpace M]` are load-bearing throughout
  6–9.
- **"Smooth and continuous chains are homotopy equivalent on every charted space."** On the real
  line with preferred charts `φ_a(y) = cuberoot(y − a)`, smooth paths are constant: differentiating
  `g(s) = g(t) + (φ_{g(t)}(g(s)))³` at `t` gives `g'(t) = 0`. Smooth `H₀` therefore distinguishes
  every point, while ordinary singular `H₀` is `ℝ`. The smoothing equivalence needs smooth chart
  compatibility and the relative-approximation hypotheses in 8.3.
- **"`mpullback (g ∘ f) = mpullback f ∘ mpullback g` unconditionally."** `mfderiv` is junk-valued;
  the chain rule needs differentiability (0.3).
- **"A smooth simplex extends smoothly to a neighbourhood of the whole simplex."** Local extensions
  into a manifold cannot be patched in the target; local extendability is the definition (8.4).
- **"The smooth structure of a covering space is an instance on the total space."** It depends on
  the map (2.3).
- **"Every integral manifold is weakly embedded."** Only the injectively immersed ones with a
  second-countable carrier: the double cover `z ↦ z²` of the circle and the discrete real line fail.
- **"A closed form with values in a normed space is locally exact."** A smooth `c₀₀`-valued
  `1`-form on `ℝ` has no local primitive; the coefficients must be complete.
- **"A local primitive of a closed form extends to a smooth form on the whole manifold."** Glue
  two copies of `ℝ` by translations along disjoint intervals of radius much smaller than their
  spacing, centred at `a_mn = 2^(-2^m (2n+1))` in the first copy and at points
  `2^(-m) + 2^(-m-n-2)` in the second (`m, n ≥ 1`). The result is a second-countable,
  boundaryless, non-Hausdorff `1`-manifold carrying the closed `1`-form `dx = dy`. Letting
  `n → ∞` and then `m → ∞`, every continuous function `f` satisfies `f(0_B) = f(2^(-m)_B)` for
  all `m`, so `f'(0_B) = 0` whenever `f` is differentiable there, while `dy ≠ 0` at `0_B`. The
  coordinate `y` on the second chart is the local primitive (6.2).
- **"Extension by zero exists on every manifold."** On the line with two origins it does not.
- **"The Poincaré pairing is defined on manifolds with boundary."** On `[0, 1]`, `[dx] = 0` in
  `H¹_dR`, yet `∫₀¹ dx = 1`.
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

## Relation to sibling roadmaps

One owner per shared construction, stated identically on both sides.

- **Universal covers** owns π₁, deck groups, the classification and πₙ; 2.4, 6.3 and 10.5 consume
  them.
- **Geometric topology** consumes3.6's inward fields and forward semiflows
  in the half-space specialization for its collar theorem, the orientation
  interface (2), the canonical
  Tau Ceti distribution and foliation APIs and their integral-manifold/leaf
  extensions (4), generic densities and form integration (5.5a, 12.4),
  and the abstract boundary/product charts from the additional
  `SmoothFaceStructure` data (5.5b). The half-space boundary manifold
  is Tau Ceti's and consumed by both. Geometric topology owns the Riemannian
  volume measure, already `TauCeti.riemannianVolume` and consumed by 12.4,
  curvature, hyperbolic structures, tubular and collar neighbourhoods,
  gluing, tautness, the Euler class, and the 3-manifold-specific applications.
  Layer 4 supplies the missing common Frobenius and leaf theory on the
  existing APIs, not a replacement distribution or foliation carrier.
- **Algebraic topology** owns singular chains and cochains, relative theory, subdivision, small
  chains, excision and Mayer–Vietoris (its Stages 2–3), and universal coefficients, cup and cap
  products and singular Poincaré duality (Stage 6). Layer 8 consumes them and builds smooth
  chains, integration over them and the de Rham comparison. AT6.3 consumes DG2's
  tangent-orientation API and DG5.1's outward-first boundary orientation; DG9.3 consumes
  AT6.3's homological orientation system, chart-normalized point generators, chosen local
  section, `RelativeTwistedClassDatum` and compact-support class factory. DG9.3 owns the
  smooth/constant-system/real-coefficient conversions and the integration comparison.
  This uses AT6.1's evaluation pairing and relative cochains together with AT6.3;
  it does not consume AT6.5's singular duality or DG10's degree comparison.
  Later topological degree comparisons consume DG10; they are not prerequisites
  for AT6.3 or DG9.3.
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
  packaging; the wedge product on de Rham cohomology is built here, the cup product by algebraic
  topology. **Heegaard Floer (analytic)** consumes orientations and degree; layer 0.4 owns migration
  of its existing 2-form API and consumers to the generic carrier, and 6.1 supplies the integration
  interface. **Contour integration** owns contour integrals; 5.3 only reconciles with
  `curveIntegral`. **One-parameter semigroups** owns the operator-semigroup analogue of flows.
  **Modular forms** may refactor its region-Stokes onto layer 5 at its own choice.

## Ordering

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
- De Rham algebra 6 and most of 7 need 0–1; 6.3 uses 5.4. Integration pairings
  use 5.2. Boundaryless smoothing 8.3 is independent of inward domination;
  generic-corner smoothing 8.3 uses 3.6. Standard-simplex Stokes 8.4 is proved
  directly, and 8.5's absolute proof consumes it, not 5.5b. The relative
  cochain maps 8.4 precede their isomorphism, which follows 8.5 on both opens;
  the absolute proof never consumes that relative isomorphism.
- Smooth-chain integration and 9 use those 8 comparisons and 5.2. The full
  compact-class comparison 9.3 additionally consumes AT 6.3, whose early
  orientation construction follows DG 2 and DG 5.1. Its boundaryless/interior
  formulas precede its smooth-boundary collar compatibility. It does not
  consume AT's downstream duality or DG degree.
- The regular-point/value definitions 10.1 need only mfderiv; their local
  inverse consequence uses the native inverse theorem. Sharp Sard 10.2
  needs finite-dimensional calculus and countable charts. The independent
  vector approximation 8.3a and relative finite-parameter incidence 10.2a
  use native approximation/cutoffs, differential/level-set charts and
  finite-dimensional Sard. Their RS2G/LG6 applications are downstream;
  they use neither chain smoothing, 3.6 domination nor degree. The
  integration/degree comparisons 10.3–10.5 use 2, 5.2–5.3, 7 and 9.2; 11 uses 10.
- Volume/density 12.4 uses native metric volume and 5.5a, with 0/2 for its
  oriented form bridge. Divergence/Green 12.5 uses 12.3–12.4 and half-space
  Stokes 5.3, or 5.5b for the face version. Circle volume uses the angular
  gate 5.5a. Finally 12.6 consumes the independently completed 5.6 and 12.5
  producers, plus the appropriate integration/face comparisons, and has
  no edge back into any of them. Global collars/gluing remain GT targets
  consuming 3.6 and 5.5b's geometric data, not prerequisites of those targets.

Claim single numbered items or smaller; the headline theorems 5.3, 8.5, 9.3,
10.4 and 11.1 remain staged claims with reusable intermediate results.
All continuous-path, relative, general-model, compact-support and
zero-dimensional branches retain their stated hypotheses and obligations.

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
