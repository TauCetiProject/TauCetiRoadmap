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
  refinements.
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
- **Measurable structure** is never installed on a manifold: `integralTopForm` and `integralDensity`
  need none, statements about a measure on `M` carry `[MeasurableSpace M] [BorelSpace M]`, and null
  sets of a manifold (`IsNullSet`) are read through charts against Haar measure on the model.
- **Universes and vocabulary.** Spaces live in `Type` wherever singular cohomology is involved.
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
- **Layers 3–4 (flows, Frobenius) are for boundaryless `M`** (`[BoundarylessManifold I M]`);
  Mathlib's local integral-curve statements are used at interior points as stated.
- **Layer 5 is stated for the half-space model.** Its boundary is a manifold (Tau Ceti's
  `isManifold_boundary`), and Stokes reads `∫_M dω = ∫_{∂M} ι^*ω`. ⚠ For a genuine model with
  corners the boundary is *not* a manifold: the boundary of `[0, ∞)²` admits no smooth structure
  making its inclusion an immersion at the corner, and the set `I.boundary M` forgets the face
  multiplicity Stokes needs. The corners version (5.5) therefore uses an **abstract boundary**
  `∂̃M`: pairs of a point and a local face through it, a manifold with corners one dimension down,
  with a map to `M` whose fibre over `x` has as many points as `x` has local faces; each face
  carries the outward-first orientation, and Stokes is `∫_M dω = ∫_{∂̃M} ι^*ω` [Lee, Thm. 16.25].
  `integralTopForm` itself (5.2) is defined over any model, since the boundary is null; only Stokes
  needs the face structure. Boundary-orientation signs are recomputed for Mathlib's half-space,
  never transcribed from [Lee].
- **Where corners would otherwise appear, they are avoided.** Homotopy invariance (6.3) uses a
  directly proved cochain-homotopy identity on `M × [0, 1]` — a manifold with corners when `M` has
  boundary — instead of Stokes on it, and the de Rham theorem (8.4) uses a self-contained Stokes
  formula for the standard simplex. Nothing in layers 6–12 depends on 5.5.

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

Each item is imported by `Suggested.lean` and used in a compiled statement there; none is rebuilt.

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
- **Sard, flat**: `Analysis/Calculus/Sard/` (`Differentiable.dense_compl_image_criticalPoints`);
  10.2 transfers it through charts.
- **Slice charts and embeddings**: `Geometry/Manifold/{SmoothEmbedding,LocallyFlat}/`
  (`TauCeti.IsSliceChart`), `Geometry/Diffeomorphism/`.
- **Singular chains and cohomology** (algebraic-topology roadmap, Stages 2, 3 and 6):
  `AlgebraicTopology/Cohomology/{Basic,HomotopyInvariance,Relative}.lean` —
  `TopCat.singularCochainComplex`, `TopCat.singularCohomology`, homotopy invariance,
  `TopPair.singularCochainComplexShortComplex` and the long exact sequence of a pair — and
  `AlgebraicTopology/Singular/Subdivision/` — `TauCeti.singularSubdivisionHomotopy`,
  `TauCeti.smallSingularChainHomotopyEquiv` and the small-chain quasi-isomorphism. Layer 8
  specializes them to real coefficients and builds on them.
- **The Riemannian volume measure** (geometric-topology roadmap):
  `Geometry/Manifold/Riemannian/VolumeDensity/` — `TauCeti.riemannianVolume`, glued from the chart
  volumes with density `chartVolumeDensity`, orientation-free, characterized by
  `eq_riemannianVolume_iff`, locally finite; 12.4 connects densities and form integration to it.

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

## What is missing (build here)

Everything the layers specify beyond the inventory above. The layer order is the order of
dependence, and the two hardest items — Banach smooth dependence (3.1) and the smoothing theorem
for chains (8.3) — gate what follows them. Every layer has a compiled interface in `Suggested.lean`:
a real definition wherever the pin allows one (`mpullback`, `flowDomain`/`flowOf`,
`degreeAtRegularValue`, `mgradient`, `laplaceBeltrami`, …), otherwise a provisional definition whose
type pins the data (a `sorry` body, never a `Prop`-typed placeholder) with theorems pinning its
characteristic equations. An implementation must provide that data and those laws, not those
definitions.

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
- Brendan Seamas Murphy's Lean 3 Brouwer fixed-point theorem (singular homology): prior art for 8
  and 10.5, to be ported in small pieces; the sphere-eversion project for partition-of-unity idioms;
  the Meta ATLAS corpus (arXiv:2605.29955) as a reference, never as code.

---

## The build, in layers

Names in backticks are the declarations of `Suggested.lean`, which carries the exact hypotheses.

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
  `mfderiv`'s does (`mpullback_comp_at/_on` and `mpullback_comp`). The pointwise paired product is
  `RoughForm.wedgeWith`, identified with `bundleWedgeWith` by `bundleWedgeWith_trivial`;
  `mpullback_wedgeWith` is unconditional, and `mpullback_wedge` is its real
  multiplication specialization. `C^(n+1)` maps pull `C^n` forms back to `C^n` forms.
- **0.4 Bundled forms.** `SmoothBundleForm` is the submodule of `C^∞` bundle-valued rough forms;
  `SmoothForm I M F k` is its trivial-bundle specialization, closed under the paired wedge for
  every fixed continuous bilinear pairing. General fibrewise products use a smooth bundle pairing.
  In particular, `V x →L[ℝ] V x` is an allowed value fibre: curvature can be typed as an
  endomorphism-valued 2-form (`CurvatureForm`). Refactor Tau Ceti's existing `SmoothTwoForm`
  implementation and its callers to use `SmoothForm I M ℝ 2`; retain the old name only as an
  abbreviation if needed. The existing bilinear evaluation, algebraic bilinear-form view,
  smooth evaluation and constant-form API must follow from the generic API, reusing its algebra
  instances. Callers use tuple evaluation or a named two-vector adapter, without a competing
  coercion on degree-two forms. The linear equivalence `legacySmoothTwoFormEquiv`, its
  evaluation law and `legacySmoothTwoFormEquiv_isClosed_iff` (the pinned chartwise closedness is
  `mextDeriv = 0`) compare with the pinned old definitions as a migration check. *Acceptance:*
  the old independent carrier is removed; `Geometry/Symplectic/Manifold/{TwoForm,Energy}.lean`
  compiles on the generic carrier with closedness, nondegeneracy, the symplectic predicate,
  tameness, compatibility, constant-form normalization and energy identities preserved; and over
  `𝓘(ℝ, E)`, `mpullback` is the flat pullback (`mpullback_eq_flat`).

### Layer 1: the exterior derivative

*[Lee, Ch. 14].*

- **1.1 Definition.** For fixed coefficients (the trivial-bundle specialization),
  `mextDerivWithin` conjugates `extDerivWithin` through `extChartAt` on
  `(extChartAt I x).symm ⁻¹' s ∩ range I`, chart independence being `extDerivWithin_pullback`; then
  `mextDeriv`, locality, linearity, `mextDeriv_eq_extDeriv` over the model and
  `mextDeriv_ofFunction`.
- **1.2 Naturality.** `mpullback_mextDeriv`: `f^*(dω) = d(f^*ω)` for a `C²` map and a `C¹` form,
  `At`, `On` and globally.
- **1.3 d² = 0 and regularity.** `mextDeriv_mextDeriv` for `C²` forms, and the new flat lemma
  `contDiffOn_extDerivWithin_succ` (`C^(n+1) → C^n` on `range I`) with its transfer
  `isSmoothForm_mextDeriv`, which is what lets `d` map `Ω^k` to `Ω^(k+1)`.
- **1.4 Cartan calculus.** The vector-valued Leibniz law `mextDeriv_wedgeWith` for every fixed
  continuous bilinear pairing `μ`, with `C¹` hypotheses and unit constants; `mextDeriv_wedge` is
  its real multiplication specialization. This includes Lie brackets and the expression
  `dω + ½[ω ∧ ω]`. A base-dependent pairing has a derivative term; arbitrary bundle coefficients
  require a connection, and the covariant Leibniz law requires compatible connections on the
  pairing's three bundles. Then the invariant formulas
  through `mlieBracket` [Lee, Prop. 14.29, 14.32], the Lie derivative of forms by the bracket
  formula (`mlieDerivForm`) [Lee, Cor. 12.33], and Cartan's magic formula [Lee, Thm. 14.35].
  *Acceptance:* on `ℝ²`, `d(x dy) = dx ∧ dy` and `d(dx) = 0`.

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
- **2.3 Smooth structures on covers.** `IsCoveringMap.inducedChartedSpace H hp`, a constructor and ⚠
  never an instance on the type: lifted charts (`inducedChartedSpace_chartAt`), `X` a manifold with
  `p` a local diffeomorphism, uniqueness as atlas compatibility (`induced_unique`), and smoothness
  of continuous lifts (`ContMDiff.of_comp_isCoveringMap`). Shared with the Lie-groups roadmap's
  simply connected covers.
- **2.4 The orientation double cover.** `OrientationCover I M` with `proj`, a topology that is ⚠ not
  the sigma topology (pinned by `isCoveringMap_proj`), the induced smooth structure, the canonical
  orientation and the orientation-reversing, fixed-point-free involution `deck`. For connected `M`:
  orientable ↔ the cover is disconnected ↔ it has a section ↔ it is trivial, and `M` is orientable
  when `π₁` has no index-2 subgroup [Lee, Thm. 15.41–15.43]. The **descent API** —
  `invariantPart`/`antiInvariantPart` for an involution, and `exists_mpullback_proj_eq_iff` — is
  what 9.2 runs on. *Acceptance:* `Set.Icc x y` and spheres are orientable; the open Möbius band is
  not.

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
  `toFlow : Flow ℝ M`; and homogeneity `exists_flowOf_one_eq` on connected boundaryless
  finite-dimensional `M` — ⚠ false Banach-generally, where every compactly supported continuous
  field is zero. `flowOf_mulInvariantVectorField` reconciles with the Lie-groups roadmap's invariant
  curves.
- **3.4 Naturality, straightening, commuting flows.** Conjugate flows of related fields
  [Lee, Prop. 9.6], the straightening theorem `exists_chart_mfderiv_eq_const` [Lee, Thm. 9.22], the
  flow characterization of the bracket `hasDerivAt_mpullback_flowOf` [Lee, Thm. 9.38], commuting
  flows and the canonical form for commuting fields [Lee, Thm. 9.44, 9.46], and Lie derivatives of
  forms via flows [Lee, Thm. 12.37]. *Acceptance:* constant fields flow by translation, the rotation
  field of `ℝ²` by rotation.
- **3.5 Time-dependent flows** (`exists_timeDependentFlow`) [Lee, Thm. 9.48].

### Layer 4: the Frobenius theorem

*[Lee, Ch. 19]. Finite-dimensional throughout; the Banach version is not targeted.*

- **4.1 Distributions.** `Distribution I M n k`: rank-`k` fibers with local `C^n` frames; the frame
  criterion [Lee, Lemma 10.32] and the annihilator ideal of forms.
- **4.2 Involutivity and integral manifolds.** `IsInvolutive` tests globally smooth sections;
  `IntegralManifold D` is a carrier with
  its own manifold structure and an immersion whose differential has image *equal* to the fiber — ⚠
  never mere containment, never assumed embedded — with `IsIntegralManifold` unbundled. Integrable ⇒
  involutive [Lee, Prop. 19.3], the 1-form criterion [Lee, Thm. 19.7] on Hausdorff `M`, and
  `contactDistribution` as the nonexample. Hausdorffness lets local bump extensions turn local
  sections and annihilating forms into global ones; second countability alone does not suffice.
  The distribution and integral-manifold carriers, `IsInvolutive`, and the integrable ⇒ involutive
  direction retain their generality.
- **4.3 Local Frobenius.** On Hausdorff `M`, flat charts (`exists_flatChart`), local integral
  manifolds as single slices in Tau Ceti's `IsSliceChart` sense, weak embeddedness (`exists_contMDiff_factor`)
  [Lee, Thm. 19.12, 19.17] for integral manifolds in [Lee]'s sense — ⚠ injectively immersed with a
  second-countable carrier: the double cover `z ↦ z²` of the circle and the discrete real line are
  integral manifolds through which the identity does not factor — and the chart adapted to a
  transverse submanifold [Lee, Cor. 19.13], by induction on the rank from 3.4's canonical form.
- **4.4 Leaves.** `leafThrough D hD x` on Hausdorff boundaryless `M` (⚠ the full distribution on
  `[0, ∞)` has no leaf through `0`), connected, injectively immersed, second countable when `M` is, maximal
  (`leafThrough_maximal`), the leaves partitioning `M` (`leafThrough_eq_or_disjoint`)
  [Lee, Thm. 19.21]. A leaf is a type with a finer charted structure, not a `Set`. *Acceptance:*
  affine slices for a constant distribution; `contactDistribution` is not involutive.

### Layer 5: integration and Stokes' theorem

*[Lee, Ch. 16]. See *Boundary and corners*.*

- **5.1 The boundary interface**, over `𝓡∂ (n+1)`, on Tau Ceti's boundary manifold:
  `boundaryRestriction`, `IsOutwardPointing` with a smooth outward field [Lee, Prop. 15.33], the
  outward-first `boundaryOrientation` (`boundaryOrientation_spec`) [Lee, Prop. 15.24], the
  half-space sign for Mathlib's model, and `isNullSet_boundary`.
- **5.2 Integration of top forms.** `integralTopForm o ω`, total, pinned by
  `integralTopForm_of_tsupport_subset_chart`: chart integrals of the coefficient in a positively
  oriented basis against its `addHaar`, weighted by the chart signs, glued by a partition of unity.
  Independence of basis, chart (Jacobian change of variables; the boundary is null), partition,
  cover and lift; then linearity, `integralTopForm_neg`, positivity `integralTopForm_pos` (⚠ for
  compactly supported forms only), and invariance under orientation-preserving and sign change under
  reversing diffeomorphisms [Lee, Prop. 16.6].
- **5.3 Stokes.** `integralTopForm_mextDeriv`: `∫_M dω = ∫_{∂M} ι^*ω` for a compactly supported `C¹`
  `n`-form on an oriented `C^∞` manifold over `𝓡∂ (n+1)`, by partition of unity and the half-space
  case of the flat divergence theorem. Corollaries: `integralTopForm_mextDeriv_eq_zero` on
  boundaryless `M`, the interval case against `intervalIntegral`, Green's theorem, and agreement
  with `curveIntegral`.
- **5.4 The homotopy operator.** `homotopyOperator` on `M × Icc 0 1`, with `homotopyOperator_spec`:
  for a `C¹` form `ω` with values in a complete space, `hω` is `C¹` and
  `ι₁^*ω − ι₀^*ω = d(hω) + h(dω)`, proved directly rather than through Stokes, so `M` may have
  boundary. Separately, Stokes on `M × Icc 0 1` for boundaryless `M`, for 10.5.
- **5.5 Densities, and Stokes with corners.** `Density`, `RoughDensity`, `toDensity`
  (`toDensity_apply`), `integralDensity` and `integralTopForm_eq_integralDensity`, making
  integration on nonorientable manifolds a special case [Lee, Ch. 16, "Densities"]; and Stokes on
  manifolds with corners through the abstract boundary [Lee, Thm. 16.25], whose faces the
  geometric-topology roadmap consumes. *Acceptance:* `∫_{Icc 0 1} df = f 1 − f 0`;
  `|∫_{S¹} dθ| = 2π` for `circleAngularForm`; Green's theorem on the unit square.

### Layer 6: the de Rham complex and cohomology

*[Lee, Ch. 17].*

- **6.1 The complex and the ring.** `deRhamComplex`, `deRhamCohomology`, the concrete presentation
  through `closedForms`, `exactForms` and the cycle-class map `deRhamCohomology.mk` (`ker_mk`), and
  functoriality (`deRhamCohomology.map`, `map_id`, `map_comp`). The wedge descends
  (`deRhamCohomology.wedge`), making `H^•_dR(M)` a graded-commutative ℝ-algebra and `H^•_c` a module
  over it.
- **6.2 Degree zero and the Poincaré lemma.** `deRhamCohomologyZeroEquiv` with
  `LocallyConstant M ℝ`; the *relative* flat lemma `exists_extDerivWithin_eq_of_starConvex` (⚠
  boundary-chart images are not ambient-open), at every regularity `n ≥ 1`; and its manifold
  corollary `exists_mextDeriv_eq_nhds` [Lee, Thm. 17.14]. Both for a complete coefficient space: ⚠
  a smooth `c₀₀`-valued `1`-form on `ℝ` has no local primitive.
- **6.3 Homotopy invariance.** `deRhamCohomology.map_eq_of_homotopy` from 5.4, with no boundaryless
  restriction; `H^{k+1}(E) = 0` for a normed space; `pathIntegral` and the exactness criterion
  `isExactForm_of_forall_pathIntegral_eq_zero` [Lee, Thm. 17.17], hence `H¹_dR = 0` for simply
  connected `M`.
- **6.4 Compact supports.** `compactlySupportedDeRhamComplex` and `H^•_c`, with the two
  functorialities of opposite variance `extensionByZero` (⚠ on Hausdorff `M`: on the line with two
  origins a bump near one origin extends discontinuously) and `properPullback` — ⚠ nothing for a
  general smooth map — and `H^•_c(ℝⁿ)` in all degrees [Lee, Lemma 17.27, Thm. 17.28]. *Acceptance:*
  `H^k_dR(ℝⁿ)`; `[dθ] ≠ 0` in `H¹_dR(S¹)`.

### Layer 7: Mayer–Vietoris

*[Lee, Ch. 17].*

- **7.1–7.2** `mayerVietorisShortComplex`, sign convention `(res, −res)`, short exact under the
  standing hypotheses; the long exact sequence is Mathlib's, with the connecting map's
  partition-of-unity description [Lee, Cor. 17.42] and naturality.
- **7.3** `compactlySupportedMayerVietorisShortComplex`, arrows reversed by extension by zero, hence
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
  definition), `smoothBoundary`, `smoothSingularChainComplex`, and the inclusion `smoothToSingular`
  into Tau Ceti's real singular chains are defined on a charted space. The smoothing theorem
  [Lee, Thm. 18.7] requires `[IsManifold I ∞ M] [T2Space M] [SigmaCompactSpace M]
  [FiniteDimensional ℝ E]`: relative Whitney approximation gives
  `exists_smoothSimplex_homotopicRel`, then `smoothing` and both chain homotopies under the same
  hypotheses. Smooth simplices are closed under the simplicial operators, so the smooth chains
  may be implemented as the chains of a sub-simplicial set of `TopCat.toSSet.obj M`, as Tau Ceti's
  small chains are.
- **8.4 Simplices, Stokes for chains, the de Rham map.** The full-dimensional `fullSimplex` bridged
  to Mathlib's barycentric `Convexity.StdSimplex`, faces `simplexFace`, `SmoothSimplex.integral` and
  `chainIntegral` (vector-valued forms in complete spaces); Stokes for the simplex
  (`SmoothSimplex.integral_mextDeriv`, independent of 5.5) and for chains [Lee, Thm. 18.12];
  `deRhamHom` into `realSingularCohomology`, under 8.3's smoothing hypotheses, natural and
  compatible with connecting maps [Lee, Prop. 18.13]. Naturality carries those hypotheses on
  both source and target.
- **8.5 The de Rham theorem.** `deRhamEquiv` for T2 σ-compact finite-dimensional `M`
  [Lee, Thm. 18.14], by the reusable **Mayer–Vietoris induction principle**
  `mayerVietoris_induction` — ⚠ whose hypotheses include countable disjoint unions, because
  cohomology does not commute with increasing unions — run over convex opens of `ℝⁿ` and then over
  charts, never through geodesic convexity; it consumes layer 7 and 8.1's cochain Mayer–Vietoris
  sequence. Multiplicativity, that `deRhamHom` carries the wedge to the cup product, is this
  roadmap's theorem, stated against Stage 6's cup product once that is in the dependency; no cup
  product is defined here. *Acceptance:* `circleLoop` is a smooth cycle with `∫ dθ = 2π` over it
  (`circleLoop_integral_circleAngularForm`), and `deRhamHom [dθ] ≠ 0`.

### Layer 9: Poincaré duality

*[Lee, Problems 18-6 to 18-8; Bott–Tu I §5].*

- **9.1** `poincarePairing`, `⟨[ω], [η]⟩ = ∫_M ω ∧ η` (`poincarePairing_mk`), defined only on T2
  σ-compact oriented boundaryless `M`: ⚠ the hypotheses of Stokes are what make it well defined on
  classes, and on `[0, 1]`, `[dx] = 0` while `∫₀¹ dx = 1`.
- **9.2 Top cohomology.** `H^n_c(M) ≅ ℝ` by integration for connected oriented `M`; `H^n_c(M) = 0`
  for connected nonorientable `M`, and `H^n_dR(M) = 0` if also compact, by descent along the
  orientation cover [Lee, Thm. 17.34].
- **9.3 Duality.** `poincareDuality`, for T2 σ-compact oriented boundaryless `M` without
  compactness, by the induction principle from the base cases 6.2 and 6.4; corollaries
  `finiteDimensional_deRhamCohomology` for compact `M` and `poincarePairing_nondegenerate`. Not
  through Hodge theory. *Acceptance:* `|⟨[dθ], [1]⟩| = 2π` on `S¹`.

### Layer 10: the Brouwer mapping degree

*[Lee, Ch. 17, "Degree Theory"].*

- **10.1** Consume Tau Ceti's inverse function theorem, whose interior-point hypothesis holds on
  boundaryless `M` (`isLocalDiffeomorphAt_of_mfderiv_eq_of_boundarylessManifold`, discharged in
  place); `IsRegularPoint`, `IsRegularValue`.
- **10.2 Sard.** `IsNullSet` through charts, `isNullSet_image_criticalPoints` and
  `dense_isRegularValue` from Tau Ceti's flat theorem [Lee, Thm. 6.10-style].
- **10.3–10.4** Finite fibres over regular values, the real definition `degreeAtRegularValue` at a
  specified regular value, and [Lee, Thm. 17.35]: `∫_M f^*ω = deg · ∫_N ω`
  (`integralTopForm_mpullback_eq_degreeAtRegularValue_mul`), via Stokes and 3.3's homogeneity; hence
  `degree` and its identification with the action of `f^*` on `H^n ≅ ℝ`.
- **10.5 Degree calculus.** Homotopy invariance, `degree_id`, `degree_const`, composition,
  `surjective_of_degree_ne_zero`, `degree_antipodal`; the continuous extension for sphere targets
  and, through 8.3, general targets; `not_exists_retraction` and `exists_fixedPoint_closedBall`;
  reconciliation with Tau Ceti's `Circle.fundamentalGroupMulEquiv` on `S¹`
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
  [Lee, Prop. 13.3]; pullback, product, `Opens` and boundary metrics; the round metric
  (`roundMetricCircle`).
- **12.2 Gradient.** `mgradient` through `rieszDual`, with `inner_mgradient` (proved), the chain
  rule, smoothness, and `mgradient_eq_gradient` on the flat model.
- **12.3 Divergence, Hessian, Laplacian.** `divergence` (the trace of `leviCivitaConnection X`),
  `hessian` (symmetric), `laplaceBeltrami := divergence ∘ mgradient`, the trace of the Hessian
  (`laplaceBeltrami_eq_sum_hessian`), in the `Δ` notation class.
- **12.4 Volume form, density, measure.** `riemannianVolumeForm` [Lee, Prop. 15.29] and the
  invariant `riemannianDensity`, whose chart coefficient is Tau Ceti's `chartVolumeDensity`. The
  measure is Tau Ceti's `TauCeti.riemannianVolume`, and no second one is defined; the targets are
  its bridge to densities, agreement with `integralDensity` on compactly supported continuous
  functions (`integral_riemannianVolume_eq_integralDensity`), full support, and positivity through
  `lintegral` (⚠ never the junk-valued Bochner integral); and `d(ι_X dV) = (div X) dV`
  (`mextDeriv_interior_riemannianVolumeForm`).
- **12.5 Divergence theorem and Green.** `∫_M div X dV = ∫_{∂M} ⟪X, N⟫ dṼ` with the outward unit
  normal [Lee, Thm. 16.32]; `integral_divergence_eq_zero`, `integral_mul_laplaceBeltrami`,
  `integral_laplaceBeltrami_symm` on boundaryless `M`; everything analytic beyond this is the PDE
  roadmap's. *Acceptance:* `laplaceBeltrami_eq_laplacian` (the sign gate), `Δ‖x‖² = 2n`, and
  `volume_circle = 2π`.

## Statements that must not enter the library

Each is a tempting mistake with its refutation.

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
  annihilator glues to a global smooth `α` with `dα(X,Y) = 1` in the central chart. Thus the
  annihilating-form criterion and Frobenius consequences of this predicate require `[T2Space M]`.
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
- **"Extension by zero exists on every manifold."** On the line with two origins it does not.
- **"The Poincaré pairing is defined on manifolds with boundary."** On `[0, 1]`, `[dx] = 0` in
  `H¹_dR`, yet `∫₀¹ dx = 1`.
- **"`Prop`-typed placeholders are acceptable in `Suggested.lean`."** A condition that cannot yet be
  stated is prose in the README, never `def _ : Prop := sorry`.

## Relation to sibling roadmaps

One owner per shared construction, stated identically on both sides.

- **Universal covers** owns π₁, deck groups, the classification and πₙ; 2.4, 6.3 and 10.5 consume
  them.
- **Geometric topology** consumes the orientation interface (2), the distribution and leaf objects
  (4) that its codimension-one foliations specialize, densities and form integration (5.5, 12.4),
  and the abstract boundary of manifolds with corners (5.5), along whose faces its gluing operates;
  the half-space boundary manifold is Tau Ceti's and consumed by both. It owns the Riemannian volume
  measure, in Tau Ceti as `TauCeti.riemannianVolume` and consumed by 12.4, curvature, hyperbolic
  structures, tubular and collar neighbourhoods, gluing, tautness, the Euler class, and everything
  3-manifold-specific.
- **Algebraic topology** owns singular chains and cochains, relative theory, subdivision, small
  chains, excision and Mayer–Vietoris (its Stages 2–3), and universal coefficients, cup and cap
  products and singular Poincaré duality (Stage 6); layer 8 consumes them and builds only smooth
  chains, integration over them and the de Rham comparison. It consumes this roadmap's orientation
  and degree API (layers 2 and 10).
- **Hopf–Rinow** owns the Levi-Civita connection, covariant differentiation along curves, geodesics
  and their flow, the exponential map, Hopf–Rinow, and the manifold inverse function theorem;
  layer 12 builds on the connection, 10.1 consumes the inverse function theorem, and 3.2 consumes
  its maximal integral curves and finite-dimensional maximal flow, whose extension to Banach models
  is this roadmap's.
- **Lie groups** owns `lieExp`, one-parameter subgroups, `Ad`, the closed-subgroup and Lie-specific
  theorems, consuming layer 3's flows (reconciled in 3.3), layer 4's Frobenius and leaves, and 2.3's
  covers.
- **PDE** owns everything analytic about `Δ` beyond 12.5. **DG and `A∞`** owns the generic DGA
  packaging; the wedge product on de Rham cohomology is built here, the cup product by algebraic
  topology. **Heegaard Floer (analytic)** consumes orientations and degree; layer 0.4 owns migration
  of its existing 2-form API and consumers to the generic carrier, and 6.1 supplies the integration
  interface. **Contour integration** owns contour integrals; 5.3 only reconciles with
  `curveIntegral`. **One-parameter semigroups** owns the operator-semigroup analogue of flows.
  **Modular forms** may refactor its region-Stokes onto layer 5 at its own choice.

## Ordering

Layers 0–1 first. Layers 2, 3 (except the form half of 3.4) and 12.1–12.3 are independent of them; 4
needs 3 and 1.4; 12.4–12.5 need 0, 2 and 5. The integration track is 5 → {6, 7} → 8 → 9, with 6 and
most of 7 available once 0–1 land (6.3 needs only 5.4's homotopy identity); 10 needs 2, 5, 7 and
9.2; 11 needs 10. Start 3.1 and 8.3 early. Claim single numbered items or smaller; the headline
theorems (5.3, 8.5, 9.3, 10.4, 11.1) are staged claims whose intermediate lemmas land as reusable
pull requests.

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
