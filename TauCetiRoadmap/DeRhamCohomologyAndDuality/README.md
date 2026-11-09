# Roadmap: differential geometry, Part II — relative de Rham theory, fundamental classes and relative transversality

**Summary.** [DifferentialGeometry](../DifferentialGeometry/README.md) builds the absolute theory:
forms, the exterior derivative, orientations, integration and Stokes (its layers 0–5), the de Rham
complex and cohomology with the Poincaré lemma, homotopy invariance, smooth path integrals and
compact supports (layer 6), the Mayer–Vietoris sequences (layer 7), smooth singular chains and the
de Rham theorem (layer 8), the Poincaré pairing and Poincaré duality (layer 9), Sard on manifolds
and the Brouwer degree (layer 10) and the hairy ball theorem (layer 11). It stops at the absolute
theory of a single manifold with smooth paths and smooth forms. This Part II continues from there
with five additions that DifferentialGeometry does not plan: integration along *continuous* paths
of `1`-forms that merely have local primitives, on any `C¹` manifold, extending Tau Ceti's covering
space of primitives of closed `C^r` forms; inward domination of a manifold with corners by its
interior through strictly inward vector fields, the transfer of smooth-chain equivalences along a
smooth homotopy retraction, the relative smooth chain comparison and relative approximation into
vector spaces; the relative de Rham complex of an open pair, its integration map and the relative de Rham isomorphism; the comparison of
integration of top forms with singular fundamental classes, including manifolds with boundary;
and finite-parameter relative transversality of families against maps, with Haar-null exceptional
parameters. The end theorems are exactness of `1`-forms with local primitives on simply connected
manifolds (1.3), inward domination (2.2), the relative smooth chain comparison (2.4), the relative
de Rham isomorphism (3.3), the fundamental-class integration formula (4.1) with its boundary form
(4.2), and generic relative transversality (5.3).

## Scope and ownership

This roadmap owns:

- `1`-forms with local primitives: the covering space of their primitives, their integral along
  continuous paths, its homotopy invariance and the exactness theorem on simply connected
  manifolds, for forms that need not be closed `C^r` forms and coefficients that need not be
  complete (Layer 1);
- the strict inward cone of a model with corners, strictly inward vector fields, their forward
  semiflow, inward domination, the transfer of smooth-chain equivalences along a smooth homotopy
  retraction, the relative smooth chain comparison, and relative approximation into real normed
  spaces with collar data (Layer 2);
- the relative de Rham complex of an open pair, the compatibility of Tau Ceti's kernel-to-cocone
  quasi-isomorphism with the connecting maps, relative integration, the relative de Rham
  homomorphism and isomorphism (Layer 3);
- the integration comparison with singular fundamental classes and the smooth-boundary
  compatibility formula, with the coefficient and carrier conversions they need (Layer 4);
- finite-parameter relative transversality: the incidence equation, regular incidence parameters,
  the Haar-null theorem and its local form, relative translation families, transversality of a
  map to a map on manifolds, avoidance, the Haar-null theorem for relative perturbations on
  boundaryless manifold sources, and perturbation on compact sources (Layer 5).

It does not own, and imports:

- from Tau Ceti, where they are already in the library (named in *Exact supplier contracts*):
  rough and smooth forms, pullback and the exterior derivative, manifold orientations, flows,
  smooth proper exhaustion functions, integration of top forms with its change of variables along
  open embeddings and Stokes' theorem over the half-space model, the de Rham complex and
  cohomology with functoriality, homotopy invariance, compact supports, Mayer–Vietoris and the
  Poincaré pairing, the flat and manifold Poincaré lemmas, smooth path integrals, local primitives
  of `1`-forms and the covering space of primitives of a closed form, the integral of a closed
  `C¹` `1`-form along continuous path classes with its periods, relative coordinates on the
  shifted mapping cone and the quasi-isomorphism from the kernel of a degreewise surjection to its
  cocone, smooth singular simplices with their integrals, small singular chains, singular cochains
  of pairs with their long exact sequence, excision and the Kronecker pairing, the five-lemma
  comparisons of relative chains and cochains of pairs of simplicial sets, and the compact-support
  and integral fundamental classes of a homologically oriented topological manifold;
- from DifferentialGeometry, by section: the absolute smoothing equivalence (8.3), chain
  integration, Stokes for smooth simplices and chains and the de Rham homomorphism `deRhamHom`
  (8.4), and the absolute de Rham isomorphism `deRhamEquiv` (8.5); Poincaré duality (9.3), Sard on
  manifolds and the degree (layer 10) and the hairy ball theorem (layer 11) stay
  DifferentialGeometry's, and nothing here consumes them;
- from AlgebraicTopology Stage 6.3: the comparison of tangent orientations with homological
  orientations and the oriented relative class of a compact Hausdorff manifold with boundary. The
  singular chains and cochains of pairs, excision and the evaluation pairing that its Stages 2–3
  and 6.1 plan are consumed from Tau Ceti, where they are already in the library; its Stage 6.5
  compares its homological degree with DifferentialGeometry 10's smooth degree, and nothing here
  touches that comparison.

Deferrals that no target here consumes: sharp finite-order Sard is HeegaardFloer §2.1's (F0.S),
and every map in Layer 5 is `C^∞`, so no target here needs it; smooth collars, collar
uniqueness, tubular neighbourhoods and gluing are GeometricTopology's, and so, for manifolds with
boundary over the half-space model, is the homotopy equivalence of the interior with the manifold
(GeometricTopology §1.1); §4.2 uses only Tau Ceti's Brown collar theorem. Inward domination (§2.2)
differs from GeometricTopology §1.1 in allowing every finite-dimensional convex model with corners
and in producing an explicit smooth deformation into the interior; in the half-space case it
implies §1.1's homotopy equivalence. AlgebraicTopology 6.3 names DifferentialGeometry 9.3 as the
consumer of its classes and the owner of the integration comparison; DifferentialGeometry 9.3
plans duality only, and that comparison, with the carrier and coefficient conversions it needs, is
§4.1 here.

Adjacent roadmap with an overlapping object: TangentialBordism §2.1 proves, on Hausdorff manifolds,
parametric transversality to a closed embedded submanifold, with a null set (`TauCeti.IsNullSet`) of
bad parameters, and, rel a closed set, relative smoothing and relative transversality to a closed
embedded submanifold `Z` of maps into a compact boundaryless manifold and of maps from a compact
source into a boundaryless second-countable manifold. §5.2 here is the flat case of the parametric
theorem against a smooth map `j : W → V`: the slice at `p` is transverse to `j` exactly when
`(x, y) ↦ (F(x, p), j(y))` is transverse to the diagonal of `V × V`, and on a vector space of
parameters a null set is Haar-null. §5.2 is stated on `TauCeti.IsRegularParameter` of the incidence
equation, which is statable at the pins and is the form §5.3 consumes, and is proved here by its own
route on Tau Ceti's flat Sard theorem, so that this roadmap does not depend on TangentialBordism.
The Haar-null theorem of §5.3 on manifold sources is likewise, for Hausdorff `M` and `N`, the
instance of that parametric theorem with the second-countable boundaryless source `M × N`,
parameters `V`, target `V × V`, `Z` its diagonal and the family
`((x, y), p) ↦ (f(x) + β(x)p, j(y))`: the family is transverse to the diagonal exactly when it is
universally transverse to `j`, its slice at `p` is transverse to the diagonal at `(x, y)` for every
`y` exactly when `IsTransverseAt` holds for `relativeTranslate f β p` at `x`, and
`TauCeti.IsNullSet` over `𝓘(ℝ, V)` is nullity for every additive Haar measure on `V`. It is proved
here from the local form of §5.2 for the same reason, and the compact-source corollaries of §5.3
follow from it. It is stated without the Hausdorff property, which TangentialBordism §2.1 assumes of
every manifold; the route of §5.3, through countably many products of chart neighbourhoods, does not
use it. The relative perturbations of §5.3 move `f` by the explicit translates `f + βp` and keep
fixed the map `j`, which need not be an embedding (an injective immersion of `ℝ` onto a figure eight
in `ℝ²` is one), unlike TangentialBordism's relative theorem, which moves a map, by a homotopy rel a
closed set, until it is transverse to a fixed closed embedded `Z`; and §2.5 here prescribes boundary
collar data for fillings into a vector space.

Adjacent roadmap with a different object: ComplexKahlerGeometry K5a owns the complex-coefficient
de Rham comparison and the punctured-plane computation `H¹_dR(ℂ ∖ {0}; ℂ) ≅ ℂ` for smooth forms;
Layer 1 here integrates `1`-forms with local primitives along continuous paths.

The relative smooth chain comparison (§2.4), the relative form complex of an open pair, relative
integration and the relative de Rham isomorphism (§§3.1–3.3), and the compact-support integration
formula (§4.1) have a single owner, this roadmap. §§2.4 and 3.1–3.3 hold over every real model
with corners, which §4.2 needs for compact Hausdorff manifolds with boundary, and §4.1 carries the
interior compact-support formula that §4.2 uses. The open-pair comparison and compact-support
formula that ComplexKahlerGeometry K6.1 uses for analytic cycles are their boundaryless instances,
consumed from §§2.4, 3.1–3.3 and 4.1 (*Downstream consumers*).

DifferentialGeometry 8.3 states, and owns, the absolute smoothing equivalence for every Hausdorff
σ-compact finite-dimensional manifold over any real model with corners; §§2.4 and 3.3 import it as
stated, whatever its route. A face-fixing relative smoothing lemma fails for targets with boundary
(*Statements that must not enter the library*, the `3`-simplex in `[0, ∞)`). DifferentialGeometry
supplies this roadmap and consumes none of it: the transfer lemma (§2.3) and inward domination
(§2.2) are theorems here, and no input to 8.3.

## Conventions

DifferentialGeometry's *Conventions* are in force: everything is over `ℝ`;
`I : ModelWithCorners ℝ E H` and `M` with `[ChartedSpace H M] [IsManifold I ∞ M]`; total functions
with junk values in the `mfderiv` style and the real hypotheses on the theorems; orientations are
Tau Ceti's chart-sign orientations `TauCeti.Manifold.Orientation`; no measurable structure is
installed on a manifold. In addition:

- **Hypotheses carried visibly.** `[FiniteDimensional ℝ E]`, `[T2Space M]` and
  `[SigmaCompactSpace M]` are written exactly where used; they are load-bearing in Layers 2–4 and
  absent from Layer 1, whose covering-space argument uses none of them.
  `[CompleteSpace F]` is written where a vector-valued form is integrated by a Bochner integral
  (the comparison with `TauCeti.pathIntegral` in §1.2); the monodromy integral of §1.2 needs no
  completeness.
- **Universes.** Spaces live in `Type` wherever singular (co)homology appears (Layers 2–4).
- **Relative complexes** are indexed by `ℤ`, after extending the `ℕ`-indexed de Rham complexes
  `TauCeti.deRhamComplex` by zero along `ComplexShape.embeddingUpNat`; negative degrees are zero.
- **Signs.** The relative de Rham complex of an open `W ⊆ X` has degree-`q` term
  `Ω^q(X) ⊕ Ω^(q−1)(W)` and differential `(α, β) ↦ (dα, α|_W − dβ)`. Relative integration of a
  relative cocycle `(α, β)` on a smooth `q`-chain `c` with `∂c` in `W` is `∫_c α − ∫_{∂c} β`. The
  connecting map is `δ[b] = −[(0, b)]`, which agrees with the singular connecting map
  `(δb)(c) = b(∂c)` (witness in §3.1). The boundary of a smooth simplex is
  `∂σ = Σᵢ (−1)ⁱ σ ∘ δᵢ`. Boundary orientations are Tau Ceti's outward-first
  `TauCeti.boundaryOrientation` for Mathlib's half-space, which constrains the *first* coordinate.
  The local generator of an oriented manifold at a point is AlgebraicTopology 6.3's point
  generator: in positive dimension `m` the class of an affine simplex `[v₀, …, vₘ]` around the
  point in an oriented chart with `(v₁ − v₀, …, vₘ − v₀)` positively oriented, in dimension `1`
  the increasing path, so that `∂[D¹, ∂D¹] = [+1] − [−1]`; in dimension `0` the signed point class
  `ε_o(x)[x]`. Tau Ceti's chart generator `TauCeti.localOrientationOfManifoldOrientation` is the
  decreasing path in dimension `1`, its negative (witness in §4.1).
- **Transversality.** For `F : E × P → V` and `j : W → V`, the source coordinates come before the
  parameter, as in `TauCeti.IsRegularParameter`; a parameter `p` is regular when
  `(u, v) ↦ D_xF(x, p)u − Dj(y)v` is onto at every `(x, y)` with `F(x, p) = j(y)`, vacuously when
  there is no such point. On manifolds the same condition, read with `mfderiv`, is
  `IsTransverseAt` (§5.3).

## Exact supplier contracts

### From Mathlib

- `curveIntegral`, `SimplyConnectedSpace`, `Path`, `ContinuousMap.HomotopyRel`; covering maps
  `IsCoveringMap` with path lifting `IsCoveringMap.liftPath`, the homotopy invariance of the
  endpoint of a lift `IsCoveringMap.liftPath_apply_one_eq_of_homotopicRel`, and the lifting
  criterion `IsCoveringMap.existsUnique_continuousMap_lifts` for simply connected, locally
  path-connected sources (`Topology/Homotopy/Lifting.lean`);
  `ChartedSpace.locallyPathConnectedSpace`.
- `Complex.IsExactOn` (a complex primitive on a set), `Complex.IsConservativeOn` (vanishing
  rectangle integrals), Morera's theorem `Complex.IsConservativeOn.isExactOn_ball` and
  `DifferentiableOn.isExactOn_ball` (`Analysis/Complex/HasPrimitives.lean`): a continuous
  conservative, in particular a holomorphic, function on a disc with values in a complete complex
  normed space has a primitive there; and `Complex.IsExactOn.differentiableOn`, by which a function
  with a primitive on an open set is holomorphic. Mathlib states these on discs and on `ℂ`; the
  holomorphic case on a simply connected domain is the `ℂ`-linear instance of §1.3.
- `CochainComplex.mappingCone`, `CochainComplex.mappingCocone` (the cone shifted by `−1`, with its
  signed projections and inclusions), `HomologicalComplex.extend`, `ComplexShape.embeddingUpNat`,
  `HomologicalComplex.homology`, `CategoryTheory.ShortComplex.ShortExact` and its long exact
  sequence, `ChainComplex.linearYonedaObj`, `Homotopy`, the five lemma, `QuasiIso`; for the cone
  of a monomorphism in a short exact sequence, the comparison of its connecting map with that of
  the sequence, `CochainComplex.mappingCone.homologySequenceδ_triangleh`
  (`Algebra/Homology/HomotopyCategory/ShortExact.lean`).
- Pairs of simplicial sets `SSetPair`, `SSetPair.of`, `SSetPair.homMk`, `SSet.Subcomplex.pair`
  (`AlgebraicTopology/SimplicialSet/SSetPair.lean`), their relative chains `SSetPair.chainComplex`
  (the cokernel of the chains of the subobject) and `SSetPair.chainComplexMap`
  (`AlgebraicTopology/SimplicialSet/Homology/Relative.lean`), and `SSet.chainComplexMap`.
- Homotopy invariance of chains: the chain homotopy `SSet.Homotopy.chainComplexMap` of a
  simplicial homotopy (`AlgebraicTopology/SimplicialSet/Homology/HomotopyInvariance.lean`), the
  simplicial homotopy `TopCat.Homotopy.toSSet` of singular simplicial sets induced by a homotopy
  (`Topology/Homotopy/TopCat/ToSSet.lean`), and the singular chain homotopy
  `TopCat.Homotopy.singularChainComplexFunctorObjMap`
  (`AlgebraicTopology/SingularHomology/HomotopyInvariance.lean`).
- `Continuous.exists_contMDiff_approx_and_eqOn` and `Continuous.exists_contDiff_approx_and_eqOn`
  (`Geometry/Manifold/SmoothApprox.lean`): finite-dimensional source, Hausdorff σ-compact manifold,
  a closed set near which the map is already smooth, and a positive continuous tolerance; the
  target is any real normed space, with no completeness or dimension hypothesis.
- `exists_contMDiffMap_one_nhds_of_subset_interior` and
  `exists_contMDiffSection_forall_mem_convex_of_local` (`Geometry/Manifold/PartitionOfUnity.lean`),
  both under `[FiniteDimensional ℝ E] [T2Space M] [SigmaCompactSpace M]`; the latter needs
  genuinely local smooth sections with values in fibrewise convex sets; the former carries
  `[NormalSpace M]` as well, which a Hausdorff σ-compact manifold over a finite-dimensional model
  satisfies through `ChartedSpace.locallyCompactSpace` (from
  `ModelWithCorners.locallyCompactSpace`), `paracompact_of_locallyCompact_sigmaCompact` and
  `NormalSpace.of_paracompactSpace_r1Space`; and, under the same three hypotheses,
  `exists_contMDiff_zero_iff_one_iff_of_isClosed` (same file): for disjoint closed `s` and `t`, a
  smooth function with values in `[0, 1]` that is `0` exactly on `s` and `1` exactly on `t`.
- `IsOpen.exists_contDiff_support_eq` (support equal to a given open set, not compact support);
  `Metric.infDist`, the distance from a point to a set.
- `mfderiv`, which on normed spaces is `fderiv` (`mfderiv_eq_fderiv`), and
  `ContinuousLinearMap.coprod`; `ModelWithCorners.secondCountableTopology` and
  `ChartedSpace.secondCountable_of_sigmaCompact` (a σ-compact manifold over a finite-dimensional
  model is second countable), and conversely `sigmaCompactSpace_of_locallyCompact_secondCountable`
  with `ChartedSpace.locallyCompactSpace`; additive Haar measures
  `MeasureTheory.Measure.IsAddHaarMeasure`, positive on nonempty open sets.
- `ModelWithCorners.interior`, `ModelWithCorners.isOpen_interior`, `ModelWithCorners.boundary`,
  `ModelWithCorners.convex_range`, `ModelWithCorners.isClosed_range`,
  `ModelWithCorners.nonempty_interior`, `BoundarylessManifold`, `𝓡∂ n`,
  `modelWithCornersEuclideanQuadrant`.

### From Tau Ceti

- Forms: `TauCeti.RoughForm`, `TauCeti.IsSmoothForm`, `TauCeti.SmoothForm`, the pullback
  `TauCeti.mpullback`, the exterior derivative `TauCeti.mextDeriv` with
  `TauCeti.mextDeriv_mextDeriv` and its naturality `TauCeti.mpullback_mextDeriv`
  (`Geometry/Manifold/DifferentialForm/`).
- Orientations `TauCeti.Manifold.Orientation` (chart-sign data) and
  `TauCeti.Manifold.Orientation.IsOrientationPreservingAt` (`Geometry/Manifold/Orientation/`).
- The maximal flow `TauCeti.flowOf` on `TauCeti.flowDomain`, jointly smooth on a Hausdorff
  boundaryless manifold over a finite-dimensional model (`TauCeti.contMDiffOn_flowOf`,
  `Geometry/Manifold/Flow/Basic.lean`), and the smooth proper exhaustion function
  `TauCeti.exists_contMDiffMap_isProperMap_nonneg` on a finite-dimensional Hausdorff σ-compact
  manifold, boundary allowed (`Geometry/Manifold/Exhaustion.lean`).
- Integration of top forms `TauCeti.integralTopForm` (total: zero unless the form is compactly
  supported and integrable), `TauCeti.integralTopForm_add` and, for finite sums of integrable top
  forms, `TauCeti.integralTopForm_sum` (`Geometry/Manifold/DifferentialForm/Integration/`), with
  `TauCeti.IsSmoothForm.integrableTopForm` (a compactly supported continuous top form is
  integrable); change of variables along an open embedding
  between manifolds over models on the same `E`, orientation-preserving at every point, for forms
  supported in its range, `Topology.IsOpenEmbedding.integralTopForm_mpullback_of_isOrientationPreservingAt`
  (`Integration/ChangeOfVariables.lean`), with its open-subset case
  `TauCeti.integralTopForm_mpullback_subtypeVal` (`Integration/OpenSubset.lean`); in dimension
  `0`, over `𝓘(ℝ, E)` with `Subsingleton E`, the integral of a function supported in one point `x`,
  its value at `x` times the orientation sign at `x`
  (`TauCeti.integralTopForm_ofFunction_zeroDim`), and on a finite manifold (`[Fintype M]`) the
  signed sum of values `TauCeti.integralTopForm_ofFunction_finite_zeroDim`
  (`Integration/ZeroDim.lean`), every zero-dimensional form being smooth
  (`TauCeti.isSmoothForm_zeroDim`, `DifferentialForm/Regularity.lean`); Stokes' theorem
  `TauCeti.integralTopForm_mextDeriv` for compactly supported `C¹` forms over `𝓡∂ (n+1)` with the
  outward-first `TauCeti.boundaryOrientation` and `TauCeti.boundaryRestriction`
  (`Integration/Stokes.lean`, `Geometry/Manifold/Boundary/`), and
  `TauCeti.integralTopForm_mextDeriv_eq_zero` on boundaryless manifolds; smooth path integrals
  `TauCeti.pathIntegral` (`Integration/Path.lean`).
- De Rham theory: `TauCeti.deRhamComplex`, `TauCeti.deRhamCohomology`, `TauCeti.closedForms`,
  `TauCeti.exactForms` (`Geometry/Manifold/DeRham/Basic.lean`); pullback `TauCeti.deRhamComplex.map`
  and `TauCeti.deRhamCohomology.map` (`DeRham/Map.lean`); homotopy invariance
  `TauCeti.deRhamCohomology.map_eq_of_homotopy` for smooth homotopies on `M × [0, 1]`, boundary
  allowed (`DeRham/HomotopyInvariance.lean`); `TauCeti.compactlySupportedDeRhamComplex`
  (`DeRham/CompactSupport.lean`) with `TauCeti.compactlySupportedDeRhamComplex.extendByZero`
  (`DeRham/ExtendByZero.lean`).
- Poincaré lemmas and primitives: `StarConvex.exists_contDiffOn_forall_extDeriv_eq`
  (`Analysis/Calculus/DifferentialForm/Poincare.lean`) and `TauCeti.exists_mextDeriv_eq_nhds`
  (`Geometry/Manifold/DifferentialForm/Poincare.lean`), both for complete coefficients;
  `TauCeti.IsPrimitiveOn` with `TauCeti.IsPrimitiveOn.mono`, `TauCeti.IsPrimitiveOn.add`,
  `TauCeti.IsPrimitiveOn.const_smul`, `TauCeti.IsPrimitiveOn.mpullback`,
  `TauCeti.IsPrimitiveOn.isOpen_setOf_eq` and `TauCeti.IsPrimitiveOn.eventuallyEq_add_const`, the
  space `TauCeti.PrimitiveSpace` with `TauCeti.PrimitiveSpace.proj` and
  `TauCeti.PrimitiveSpace.translate`, and, for a closed `C^r` form (`r ≥ 1`) with complete
  coefficients on a finite-dimensional Hausdorff smooth manifold,
  `TauCeti.exists_contMDiff_isPrimitiveOn` and `TauCeti.PrimitiveSpace.isCoveringMap_proj`
  (`Geometry/Manifold/DifferentialForm/LocalPrimitive.lean`) and
  `TauCeti.exists_mextDeriv_eq_of_simplyConnectedSpace`
  (`Geometry/Manifold/DeRham/SimplyConnected.lean`);
  `ModelWithCorners.locallyPathConnectedSpace` (`Geometry/Manifold/Topology.lean`).
- Integrals of closed `1`-forms along continuous paths, under the same standing hypotheses (a
  closed `C¹` form, complete coefficients, a finite-dimensional Hausdorff smooth manifold):
  `TauCeti.pathClassIntegral` on path classes, defined through the monodromy of
  `TauCeti.PrimitiveSpace` and equal to the change of value along any continuous lift
  (`TauCeti.pathClassIntegral_mk_eq_sub`), with `TauCeti.PrimitiveSpace.value_monodromy`,
  `TauCeti.pathClassIntegral_trans`, `TauCeti.pathClassIntegral_symm`, agreement with
  `TauCeti.pathIntegral` along `C¹` curves (`TauCeti.pathClassIntegral_mk_eq_pathIntegral`),
  naturality `TauCeti.pathClassIntegral_mpullback`, the period homomorphism `TauCeti.periodHom`
  and exactness of a closed smooth real form with vanishing periods on a connected manifold
  (`TauCeti.mem_exactForms_one_iff_periodHom_eq_zero`) (`Geometry/Manifold/DeRham/Period.lean`).
- Relative coordinates on Mathlib's cocone of a map `f : K ⟶ L` of `ℤ`-indexed complexes of
  modules: `CochainComplex.mappingCocone.relativeCoordinates` identifies the degree-`p` term with
  `K^p × L^(p−1)` by negating Mathlib's second projection, with differential
  `(a, b) ↦ (da, f a − db)` (`CochainComplex.mappingCocone.relativeCoordinates_d`), cocycles
  (`CochainComplex.mappingCocone.d_relativeCoordinates_symm_eq_zero_iff`), coboundaries
  (`CochainComplex.mappingCocone.relativeCoordinates_symm_mem_range_d_iff`) and componentwise maps
  of pairs (`CochainComplex.mappingCocone.relativeCoordinates_map`)
  (`Algebra/Homology/HomotopyCategory/MappingCocone/Relative.lean`); for a short exact sequence of
  `ℤ`-indexed cochain complexes in an abelian category, the lift of the first map to the cocone of
  the second is a quasi-isomorphism, `CochainComplex.mappingCocone.quasiIso_lift_of_shortExact`,
  and the cocone of an identity is acyclic, `CochainComplex.mappingCocone.acyclic_mappingCocone_id`
  (`MappingCocone/Basic.lean`); neither compares connecting maps.
- Smooth singular simplices: `TauCeti.smoothSingularSubcomplex`, the subcomplex of
  `TopCat.toSSet.obj M` of simplices that near every point of the full-dimensional simplex agree
  with a smooth map on a neighbourhood in `ℝᵏ`, defined on any charted space;
  `TauCeti.SmoothSimplex` and the induced maps `TauCeti.smoothSingularSubcomplexMap` of smooth maps
  (`Geometry/Manifold/SmoothSingular/Basic.lean`); `TauCeti.SmoothSimplex.integral`
  (`SmoothSingular/Integral.lean`); `TauCeti.fullSimplex` and `TauCeti.simplexFace`
  (`Geometry/Convex/FullSimplex.lean`). The inclusion of smooth chains into singular chains is
  `SSet.chainComplexMap (TauCeti.smoothSingularSubcomplex I M).ι`.
- Singular theory: `TopCat.singularCochainComplex`, `TopCat.singularCohomology` and induced maps
  (`AlgebraicTopology/Cohomology/Basic.lean`); `TopPair.singularCochainComplex`, the short exact
  cochain sequence of a pair `TopPair.shortExact_singularCochainComplexShortComplex` and its
  connecting map `TopPair.singularCohomologyδ` (`AlgebraicTopology/Cohomology/Relative.lean`); the
  Kronecker pairings `TopCat.singularKronecker` and `TopPair.singularKronecker` of cohomology with
  homology (`AlgebraicTopology/Cohomology/Kronecker.lean`); excision for a closed `K` inside an
  open `U`, `TopPair.isIso_singularHomologyMap_excisionMap_of_isClosed_subset`
  (`AlgebraicTopology/Singular/Excision.lean`); the subcomplex `TopCat.smallSingularSubcomplex` of
  simplices with image in a member of a family
  (`AlgebraicTopology/Singular/Subdivision/Small/Chains.lean`); and the five-lemma comparisons for
  a map of pairs of simplicial sets that is a quasi-isomorphism on both members,
  `SSetPair.quasiIso_chainComplexMap` on relative chains
  (`AlgebraicTopology/SimplicialSet/Homology/Relative/Basic.lean`) and
  `SSetPair.quasiIso_cochainComplexMap` on relative cochains
  (`AlgebraicTopology/Cohomology/Relative.lean`).
- Fundamental classes, on a Hausdorff topological manifold modelled on a finite-dimensional `E`:
  `TauCeti.HomologicalOrientation` (`AlgebraicTopology/Singular/LocalHomology/Orientation/`);
  the class `TauCeti.HomologicalOrientation.fundamentalClassOn` in `H_n(M, M ∖ A; ℤ)` of a compact
  `A`, characterized by its local images (`TauCeti.HomologicalOrientation.eq_fundamentalClassOn`),
  with the restriction law `TauCeti.HomologicalOrientation.localHomologyRestriction_fundamentalClassOn_of_subset`
  along `(M, M ∖ A) → (M, M ∖ B)` for compact `B ⊆ A`; for compact `M`,
  `TauCeti.HomologicalOrientation.fundamentalClass`, characterized the same way
  (`TauCeti.HomologicalOrientation.eq_fundamentalClass`), and its real image
  `TauCeti.HomologicalOrientation.realFundamentalClass` under `TauCeti.intToRealCoeff`
  (`LocalHomology/FundamentalClass.lean`). For §4.1's negative-control Check only: the local
  orientation at a point selected by a tangent orientation of a Hausdorff boundaryless manifold
  over `𝓘(ℝ, E′)`, `E′` an inner-product space of dimension `m ≥ 1`,
  `TauCeti.localOrientationOfManifoldOrientation` (`LocalHomology/Orientation/Chart.lean`), which
  pulls the zero-sphere generator `[−b₀] − [b₀]` (`TauCeti.reducedSingularHomologySphereIso_inv_ι`,
  `AlgebraicTopology/Singular/Sphere.lean`) back through the connecting map and radial projection.
  In dimension `1` it is the class of a decreasing path in an oriented chart, as Tau Ceti records
  for the interval (`TauCeti.singularHomologyCubeBoundaryPairIso_one_inv`,
  `AlgebraicTopology/Singular/IntervalGenerator.lean`), the negative of AlgebraicTopology 6.3's
  point generator; §4.1 does not build `o_h` from it.
- `TauCeti.IsRegularParameter` (surjectivity of the fixed-parameter derivative at every solution)
  and the meagre statement `TauCeti.isMeagre_setOf_not_isRegularParameter`, which §5.2 refines
  (`Analysis/Fredholm/LevelSet/GlobalParametric.lean`), and the level-set charts
  `TauCeti.levelSetChart` at regular points (`Analysis/Fredholm/LevelSet/Basic.lean`); every
  operator between finite-dimensional spaces is Fredholm.
- `TauCeti.addHaar_image_criticalPoints_eq_zero` (flat Morse–Sard on a set, threshold
  `(dim source)² + 1`, `Analysis/Calculus/Sard/OutermostStratum.lean`).
- The topological collar predicate `TauCeti.IsCollar`, an open embedding of `N × [0, 1)` equal at
  depth `0` to a given map (`Geometry/Manifold/Boundary/Collar/Global.lean`), Brown's collar theorem
  `TauCeti.IsLocallyCollared.isCollared` (`Collar/Brown.lean`) and the boundary manifold of a
  manifold over `𝓡∂ (n+1)` (`Geometry/Manifold/Boundary/`).

### From TauCetiRoadmap.DifferentialGeometry

- 8.3: the absolute smoothing equivalence, as stated there: for every Hausdorff σ-compact
  finite-dimensional manifold over any real model with corners, the inclusion of smooth singular
  chains into singular chains, on Tau Ceti's carriers above, is a chain homotopy equivalence.
- 8.4: `chainIntegral`, Stokes for smooth simplices and chains, and `deRhamHom` into real singular
  cohomology with its naturality.
- 8.5: `deRhamEquiv`, for every open of a Hausdorff σ-compact finite-dimensional `M`.

### From TauCetiRoadmap.AlgebraicTopology

- Stage 6.3: the comparison of tangent orientations with homological orientations, by which an
  orientation `TauCeti.Manifold.Orientation` of a boundaryless smooth manifold determines a
  `TauCeti.HomologicalOrientation` whose point generators are the signed classes of the ordered
  affine simplex of an oriented chart (Stage 6.3 selects them so, and checks
  `∂[D¹] = [+1] − [−1]`), natural under oriented open embeddings, through its Euclidean rechart
  along a linear equivalence `E ≃L[ℝ] EuclideanSpace ℝ (Fin m)` and its open-embedding local maps,
  with the signed local images of chart-simplex classes at every interior point of the simplex
  and, in dimension `0`, the generator `ε_o(x)[x]`; and the oriented relative
  class of a compact Hausdorff manifold over `𝓡∂ m`, `m > 0` (Stage 6.3 builds it for Hausdorff
  second-countable `M`, through Brown's collar). The compact-support classes, their
  support-enlargement law and the integral fundamental class that Stage 6.3 also plans are Tau
  Ceti's declarations above, and so are the relative chains and cochains, excision, the five-lemma
  comparisons and the evaluation pairing of its Stages 2–3 and 6.1.

## How to read the build

Layer 1 extends Tau Ceti's covering space of local primitives and depends on nothing else here.
Layer 2 is differential topology of models with corners: the inward cone and inward domination
(§§2.1–2.2) are independent of chains; the transfer lemma (§2.3) consumes Tau Ceti's smooth
singular simplices and Mathlib's homotopy invariance of chains, and §2.2 supplies its instance
`N = I.interior M`; the relative chain comparison (§2.4) consumes DifferentialGeometry
8.3's equivalence directly; relative approximation (§2.5) is independent of the rest. Layer 3
builds the relative de Rham theory on Tau Ceti's de Rham complexes and relative coordinates,
DifferentialGeometry 8.4–8.5 and Layer 2's relative chains. Layer 4 consumes Layer 3, Tau Ceti's
integration of top forms and fundamental classes, and AlgebraicTopology 6.3. Layer 5 needs only
calculus, Tau Ceti's level-set and Sard APIs and §2.5, and can start at once.

## Layer 1: `1`-forms with local primitives along continuous paths

Tau Ceti integrates a closed `C^r` `1`-form (`r ≥ 1`) with complete coefficients on a
finite-dimensional Hausdorff smooth manifold along continuous paths through the covering space of
its local primitives, `TauCeti.PrimitiveSpace` (`TauCeti.pathClassIntegral`), and proves it exact
on simply connected manifolds; along smooth curves it has `TauCeti.pathIntegral`. Closedness enters
there only through the Poincaré lemma, to produce local primitives. This layer takes the local
primitives themselves as the hypothesis, so it covers forms that are not `C¹` or not even
continuous, coefficients that are not complete, and `C¹` manifolds over any real model with
corners, with no finite-dimensionality or Hausdorff hypothesis. The integral is a monodromy, built
from values of primitives and never from a derivative of the path.

### 1.1 Local primitives

For a real normed space `F` and `φ : TauCeti.RoughForm I M F 1` on `M` with `[IsManifold I 1 M]`,
say that `φ` *has local primitives* when every `x ∈ M` lies in an open `U` carrying some `g : M → F`
with `TauCeti.IsPrimitiveOn φ g U`, that is, `g` is differentiable on `U` with `d g = φ` there. No
new carrier is built: the property is this `∀ ∃` statement on Tau Ceti's predicate, and all its API
but the locality bullet is Tau Ceti's. *Needs:* Tau Ceti `TauCeti.IsPrimitiveOn` and its API.

- A closed `C^r` form, `r ≥ 1`, with complete `F` on a finite-dimensional Hausdorff smooth `M` has
  local primitives, which may be taken `C^r` (`TauCeti.exists_contMDiff_isPrimitiveOn`).
- Having local primitives is local: it holds on `M` iff it holds on every member of an open cover,
  read on the open submanifolds. It passes to open subsets (`TauCeti.IsPrimitiveOn.mono`), to sums
  and real multiples (`TauCeti.IsPrimitiveOn.add`, `TauCeti.IsPrimitiveOn.const_smul`) and to
  pullbacks along differentiable maps (`TauCeti.IsPrimitiveOn.mpullback`).
- Two primitives of `φ` on open sets `U` and `V` agree near every common point up to the difference
  of their values there (`TauCeti.IsPrimitiveOn.eventuallyEq_add_const`); hence two primitives on
  a connected open set differ by one constant.

**Checks.** In the planar instance `M` is an open `Ω ⊆ ℂ`, an open submanifold over `𝓘(ℝ, ℂ)`, so
`φ` is a field of real-linear maps `ℂ → F`.

- `φ = dx` (the constant covector `Re`) has local primitives, with `g = Re`; a predicate demanding
  `φ = 0` fails here.
- `φ = x dy` has none: a primitive would be `C²`, its derivative `φ` being smooth, with mixed
  partials `0` and `1`; an always-true predicate fails here.
- The angular form `(x dy − y dx)/(x² + y²)` on `ℂ ∖ {0}` has local primitives (branches of `arg`)
  but no global one, since its loop integral around `0` is `2π`; a predicate requiring a global
  primitive fails here.
- `φ = d(|x|^(3/2))` has local primitives although `φ` is not `C¹`, and on `ℝ` the form
  `d(x² sin(1/x))`, with primitive `x² sin(1/x)` extended by `0` at `0`, has one although `φ` is not
  continuous at `0`. A closed `C^r` form with `1 ≤ r`, the hypothesis of
  `TauCeti.exists_contMDiff_isPrimitiveOn`, is strictly stronger; continuity is neither necessary
  (this form) nor sufficient (`x dy` above).

### 1.2 The covering space of primitives and the continuous path integral

Prove that for `φ` with local primitives on a `C¹` manifold `M` the projection
`TauCeti.PrimitiveSpace.proj φ` is a covering map: over an open `U` carrying a primitive `g` the
sheets are the graphs of the translates `g + c`, `c ∈ F`. This is the argument of
`TauCeti.PrimitiveSpace.isCoveringMap_proj` with the primitives taken from the hypothesis instead
of from the Poincaré lemma; it needs `TauCeti.IsPrimitiveOn.isOpen_setOf_eq` and no finite
dimensionality, Hausdorff property or completeness. For a continuous `γ : Path a b` in `M` define
`∫_γ φ` as `value(Γ(1)) − value(Γ(0))` for a lift `Γ` of `γ` along this covering
(`IsCoveringMap.liftPath`). Prove that it does not depend on the lift, since two lifts differ by
`TauCeti.PrimitiveSpace.translate`; that it is the sum of the endpoint differences of local
primitives along any subdivision of `[0, 1]` into subintervals mapped into primitive domains; that
it is additive under concatenation and negated under reversal; that it is invariant under homotopy
rel endpoints (`IsCoveringMap.liftPath_apply_one_eq_of_homotopicRel`); that it is natural under
differentiable maps (`TauCeti.IsPrimitiveOn.mpullback`); and that for continuous `φ`, complete `F`
and a `C¹` curve `γ : ℝ → M` it equals `TauCeti.pathIntegral φ γ 0 1`, by the fundamental theorem of
calculus on each subinterval. On path-connected `M`, every loop integral vanishes iff `φ` has a
global primitive, integration from a base point being one. The covering-space steps are the
homotopy lifting property and the uniqueness of lifts [Hatcher, Props. 1.30 and 1.34]; for smooth
closed covector fields along piecewise smooth curves, path independence and its equivalence with
exactness are [Lee, Ch. 11, *Conservative Covector Fields*]; the monodromy integral of `1`-forms
with local primitives along continuous paths, on `C¹` manifolds with coefficients that need not be
complete, is this roadmap's. This generalizes Tau Ceti's
`TauCeti.pathClassIntegral` from closed `C¹` forms with complete coefficients on finite-dimensional
Hausdorff smooth manifolds to forms with local primitives:

- for a closed `C¹` form `φ` with complete `F` on a finite-dimensional Hausdorff smooth `M`,
  `∫_γ φ = TauCeti.pathClassIntegral φ ⟦γ⟧`, both being the change of value along a lift
  (`TauCeti.pathClassIntegral_mk_eq_sub`); on such forms the properties above are Tau Ceti's
  `TauCeti.PrimitiveSpace.value_monodromy`, `TauCeti.pathClassIntegral_trans`,
  `TauCeti.pathClassIntegral_symm`, `TauCeti.pathClassIntegral_mk_eq_pathIntegral`,
  `TauCeti.pathClassIntegral_mpullback` and, for smooth real forms, the period criterion
  `TauCeti.mem_exactForms_one_iff_periodHom_eq_zero`, and this layer proves them without those
  hypotheses.

*Needs:* §1.1; Tau Ceti `TauCeti.PrimitiveSpace`, `TauCeti.IsPrimitiveOn.isOpen_setOf_eq`,
`TauCeti.pathIntegral`, `TauCeti.pathClassIntegral_mk_eq_sub`; Mathlib `IsCoveringMap.liftPath`,
`IsCoveringMap.liftPath_apply_one_eq_of_homotopicRel`, `Path`, `ContinuousMap.HomotopyRel`.

**Checks.**

- The angular form over the unit circle loop has integral `2π`, equal to Mathlib's `curveIntegral`
  of its covector field along the circle and, the form being smooth and closed, to Tau Ceti's
  `TauCeti.periodHom` at the class of that loop; over the loop traversed twice, `4π`; over its
  reversal, `−2π`. A definition that integrated the form's norm would give `2π` on the reversal
  as well.
- `φ = dx` over any path from `a` to `b` gives `Re b − Re a`, including the nowhere-differentiable
  path `t ↦ t + i·W(t)` for a continuous nowhere-differentiable `W` with `W(0) = W(1) = 0`, to
  which neither `TauCeti.pathIntegral` nor `curveIntegral` applies.
- `φ = dx` on `ℂ` along the segment from `0` to `3`, subdivided at `1` and given the primitives
  `Re` on the first piece and `Re + 7` on the second: `(1 − 0) + ((3 + 7) − (1 + 7)) = 3`, as with
  one primitive, so the choice of primitives does not matter.
- A constant path has integral `0`.
- On `ℝ²`, `φ = d(|x|^(3/2))` along the segment from `(0, 0)` to `(1, 0)` has integral
  `1^(3/2) − 0 = 1`, and along the segment from `(−1, 0)` to `(1, 0)` integral `1 − 1 = 0`;
  `TauCeti.pathClassIntegral` returns its junk value `0` on the first segment because `φ` is not
  `C¹`, so the agreement bullet needs its closed `C¹` hypothesis.

### 1.3 Exactness on simply connected manifolds

Prove `exists_isPrimitiveOn_univ_of_simplyConnectedSpace`: on a simply connected `M` with
`[IsManifold I 1 M]`, over any real model with corners, every `φ : TauCeti.RoughForm I M F 1` with
local primitives has a global primitive `g`, `TauCeti.IsPrimitiveOn φ g univ`. Route: `M` is
locally path-connected (`ChartedSpace.locallyPathConnectedSpace` over
`ModelWithCorners.locallyPathConnectedSpace`), so the identity of `M` lifts through §1.2's covering
map (`IsCoveringMap.existsUnique_continuousMap_lifts`, the lifting criterion [Hatcher,
Prop. 1.33] for a simply connected, hence path-connected, and locally path-connected source), and
the value coordinate of the lift agrees near each point with a translate of a local primitive.
This extends `TauCeti.exists_mextDeriv_eq_of_simplyConnectedSpace`, which assumes a closed `C^r`
form with complete coefficients on a finite-dimensional Hausdorff manifold; for smooth closed
covector fields the exactness on simply connected manifolds is [Lee, Ch. 11, *Conservative
Covector Fields*], and the form for `1`-forms with local primitives is this roadmap's. On an
arbitrary `M` apply it on each simply connected open submanifold. *Needs:* §§1.1–1.2; Mathlib
`IsCoveringMap.existsUnique_continuousMap_lifts`, `ChartedSpace.locallyPathConnectedSpace`; Tau Ceti
`ModelWithCorners.locallyPathConnectedSpace`.

**Checks.**

- On the slit plane `ℂ ∖ (−∞, 0]` the angular form has the global primitive `arg`.
- On `ℂ ∖ {0}`, which is not simply connected, the conclusion fails for the angular form, and on the
  circle for `dθ`; the hypothesis is necessary.
- On `ℂ`, `φ = dx` gives `g = Re + c` and no other primitive, `ℂ` being connected (§1.1).
- On `ℝ²`, `φ = d(|x|^(3/2))` is covered, with global primitive `|x|^(3/2)` up to a constant,
  although `TauCeti.exists_mextDeriv_eq_of_simplyConnectedSpace` does not apply (`φ` is not `C¹`).
- The holomorphic case: for `f` holomorphic on a simply connected open `Ω ⊆ ℂ` with values in a
  complete complex normed space `F`, the covector field `φ(z) = (v ↦ v·f(z))` has local primitives
  by `DifferentiableOn.isExactOn_ball` on each disc in `Ω` (a primitive `h` with `h' = f` has real
  derivative `v ↦ v·f(w)` at `w`), so the theorem on the open submanifold `Ω` gives a global
  primitive and, after extending it arbitrarily off the open `Ω`, `Complex.IsExactOn f Ω`:
  Mathlib's disc statement extended to simply connected domains. On the slit plane with
  `f(z) = 1/z` the primitive is the principal `log`, and on `ℂ ∖ {0}` there is none, since the loop
  integral of `dz/z` around `0` is `2πi`. A covector field of this `ℂ`-linear form with `f`
  continuous has local primitives only when `f` is holomorphic (`Complex.IsExactOn.differentiableOn`
  on each disc), while `φ = dx` is not of this form (`Re` is `ℝ`-linear, not `ℂ`-linear), so
  Layer 1 is strictly wider than the holomorphic theory and does not restate it.

### Examples

The punctured-plane angular form, with loop integral `2π`, separates local from global primitives;
ComplexKahlerGeometry K5a computes the same class for smooth forms with complex coefficients. The
form `d(|x|^(3/2))` lies outside the closed `C¹` theory and inside this layer.

### Dependencies

Tau Ceti local primitives and their covering space
(`Geometry/Manifold/DifferentialForm/LocalPrimitive.lean`) and smooth path integrals; Mathlib
covering maps with path and homotopy lifting.

## Layer 2: smooth chains over manifolds with boundary and corners

### 2.1 The strict inward cone and strictly inward fields

For `C = range I` (convex by `ModelWithCorners.convex_range`, closed by
`ModelWithCorners.isClosed_range`, with nonempty interior by `ModelWithCorners.nonempty_interior`),
the *strict inward cone* at `x ∈ C` is the set of `v ∈ E` for which there are `ε, δ > 0` with
`ball(x + tv, εt) ⊆ C` for `0 < t < δ`. The strict inward cone of a general convex model with
corners, its chart invariance and the gluing of strictly inward fields are this roadmap's.
*Needs:* Mathlib `ModelWithCorners.convex_range`,
`ModelWithCorners.isClosed_range`, `ModelWithCorners.nonempty_interior`, `Metric.ball`; for the
last bullet below, `exists_contMDiffSection_forall_mem_convex_of_local`.

- It is convex and closed under positive scaling, and contains `q − x` for every interior `q` of
  `C`.
- It is open, with `ε, δ` uniform on a neighbourhood of `(x, v)` in `C × E`.
- It is invariant under the derivatives of `C¹` chart changes, so it defines an open cone in each
  tangent space of `M`.
- A smooth vector field on `M` is *strictly inward* when its value lies in this cone at every
  point. On a Hausdorff σ-compact finite-dimensional `M` (`[T2Space M] [SigmaCompactSpace M]
  [FiniteDimensional ℝ E]`, the hypotheses of `exists_contMDiffSection_forall_mem_convex_of_local`)
  a smooth strictly inward field exists: in a chart, the constant field `q − x` for an interior
  anchor `q` is strictly inward on a neighbourhood of `x` (for `‖y − x‖ < ε₀` and
  `ball(q, 2ε₀) ⊆ C`, convexity gives `ball(y + t(q − x), ε₀t) ⊆ C`), and these local sections are
  glued by that theorem with the strict inward cone as the convex fibre set.

**Checks.**

- Half-line `C = [0, ∞)` at `0`: the cone is `(0, ∞)`; `v = 0` and `v = −1` are excluded (the ball
  around `tv` leaves `C`), so a definition using the closed tangent cone is wrong here.
- Quadrant `[0, ∞)²` at the origin: the cone is the open quadrant; `(1, 0)` is excluded.
- At an interior point the cone is all of `E`; on a boundaryless model every field is strictly
  inward.

### 2.2 Inward semiflow and inward domination

On a Hausdorff σ-compact finite-dimensional `M`, take a smooth proper `f : M → [0, ∞)` from
`TauCeti.exists_contMDiffMap_isProperMap_nonneg` [Lee, Prop. 2.28], which allows boundary and
corners. For a strictly inward field `X`, construct its forward semiflow in
`C`: local existence, uniqueness and joint smoothness (Picard iteration on paths constrained to
`closedBall(x + tX(x), εt/2)`, convex mean-value and Grönwall estimates, higher smoothness from the
variational equation on `C × L(E, E)`); entry into the interior at positive time and persistence
there; maximal forward times and the forward escape lemma; global forward existence after
rescaling `X` so that `|Xf| ≤ 1/2`. The intrinsic interior `N = I.interior M` is open
(`ModelWithCorners.isOpen_interior`), boundaryless, second countable and σ-compact. With
the semiflow `ψ`, `r = ψ(1, ·)` and `Φ(t, x) = ψ((1 − t)², x)`, prove
`exists_smooth_inward_deformation`: there are smooth `r : M → M` with values in `I.interior M` and
smooth `Φ : ℝ × M → M` (over `𝓘(ℝ, ℝ).prod I`) with `Φ(0, ·) = r`, `Φ(1, ·) = id` and every
`Φ(t, ·)` preserving `I.interior M`. This *inward domination* is the target. It implies that the
inclusion `I.interior M ↪ M` is a homotopy equivalence with homotopy inverse `r`: `Φ` on
`[0, 1] × M` joins the composite `M → I.interior M ↪ M` to `id_M`, and, every `Φ(t, ·)` preserving
the interior, its restriction to `[0, 1] × I.interior M` joins `r` restricted to the interior to
the identity there. For the half-space model the smooth collar and this homotopy equivalence are
GeometricTopology §1.1's [Lee, Thms. 9.24–9.26, pp. 222–223]; §2.2 differs in allowing every
finite-dimensional convex model with corners and in producing the explicit smooth deformation
`Φ`, and the construction for a general convex model is this roadmap's. *Needs:* §2.1;
Tau Ceti `TauCeti.exists_contMDiffMap_isProperMap_nonneg`, and the maximal flow `TauCeti.flowOf`
on the boundaryless interior; Mathlib `ModelWithCorners.isOpen_interior`.

**Checks.**

- On `[0, ∞)`, `r(x) = x + 1` and `Φ(t, x) = x + (1 − t)²` satisfy every clause: `Φ(0, x) = x + 1`,
  `Φ(1, x) = x`, and `x > 0` gives `Φ(t, x) > 0`.
- On `[0, 1]` with the inward field `1/2 − x`, `ψ(s, x) = 1/2 + (x − 1/2)e^(−s)`, so
  `r(x) = 1/2 + (x − 1/2)/e ∈ (0, 1)`; a field vanishing at an endpoint (`x(1 − x)`) has `r(0) = 0`
  and fails the interior clause.
- On a boundaryless `M`, `r = id` and `Φ(t, x) = x` work; the theorem has content only at the
  boundary.
- At a corner the semiflow gives a topological collar and nothing smooth. On the quadrant
  `Q = [0, ∞)²` the strictly inward field `(1, 1)` has semiflow `ψ(s, p) = p + s(1, 1)`, which maps
  `∂Q × [0, 1)` homeomorphically onto the open set `{min(x, y) < 1}` of `Q`, with inverse
  `(x, y) ↦ ((x − m, y − m), m)` for `m = min(x, y)`; with depth `0` the inclusion of `∂Q`, it is a
  collar in the sense of `TauCeti.IsCollar`. Its depth coordinate `m` is not differentiable on the
  diagonal (from `x < y` its `x`-derivative is `1`, from `x > y` it is `0`), and the flowout
  `{(a + s, s) | a, s ≥ 0}` of the single face `{y = 0}` misses `(0, t)` for every `t > 0`
  (`(0, t) = (a + s, s)` forces `a = −t`), so it is no neighbourhood of that face at the corner.
  Smooth collars are GeometricTopology §1.1's.

### 2.3 Transfer of smooth-chain equivalences

For smooth `j : N → M` and `r : M → N` with a specified smooth homotopy `Φ : ℝ × M → M` from
`j ∘ r` to `id_M`, prove: if the inclusion of smooth chains into singular chains is a chain
homotopy equivalence for `N`, with a given homotopy inverse `s`, then `j_* ∘ s ∘ r_*` (with `r_*`
on singular chains and `j_*` on smooth chains) is a homotopy inverse of the inclusion for `M`.
Prove both inverse identities from pushforward naturality and two chain homotopies from
`(j ∘ r)_*` to the identity; no homotopy `r ∘ j ~ id_N` is used. On singular chains it is
Mathlib's `TopCat.Homotopy.singularChainComplexFunctorObjMap` of the restriction of `Φ` to
`[0, 1] × M`. On smooth chains it is the smooth prism operator, Mathlib's
`SSet.Homotopy.chainComplexMap` of the simplicial homotopy that `TopCat.Homotopy.toSSet` of that
restriction induces on `TauCeti.smoothSingularSubcomplex I M`: prove that this simplicial homotopy
preserves smooth simplices, because the simplices of `Δ[1]` act through affine maps of the
simplex into `ℝ` and `Φ` is jointly smooth on `ℝ × M`. Two homotopy inverses of one map are
homotopic (`s ~ s ≫ i ≫ t ~ t`), so the transferred inverse is independent of `j`, `r`, `Φ` and `s`
up to homotopy and the induced map on homology is natural. Inward domination (§2.2) supplies such
a triple with `N = I.interior M`, `j` the inclusion and `r` the retraction; the equivalence for
`M` itself is DifferentialGeometry 8.3's, imported as stated. The transfer lemma is this
roadmap's. *Needs:* Tau Ceti `TauCeti.smoothSingularSubcomplex`,
`TauCeti.smoothSingularSubcomplexMap`; Mathlib `TopCat.Homotopy.singularChainComplexFunctorObjMap`,
`TopCat.Homotopy.toSSet`, `SSet.Homotopy.chainComplexMap`.

**Checks.**

- `N = M`, `j = r = id` and the constant homotopy: the transferred inverse is `s` itself, and the
  two inverse identities are the given ones.
- `M = [0, ∞)`, `N = (0, ∞)`, `r(x) = x + 1`, `Φ(t, x) = x + (1 − t)²` (the witness of §2.2): the
  point cycle `[0]` goes to `[1]`, then to a smooth `0`-chain of total coefficient `1` supported
  in `(0, ∞)`, which is homologous to `[0]` in `M` through the smooth `1`-simplex `t ↦ t` with
  boundary `[1] − [0]`; a transfer that applied `r` on smooth chains and `j` on singular chains
  would land in the wrong complex.
- The homotopy `j ∘ r ~ id_M` is necessary: for `N` a point, `M = S¹`, `r` constant and `j` the
  inclusion of a point, `j_* ∘ s ∘ r_*` is zero on `H₁(S¹) ≅ ℝ` while the inclusion of smooth
  chains is an isomorphism there, so the composite is no inverse.

### 2.4 Relative smooth chains

Let `X : Type` be a Hausdorff σ-compact manifold over a finite-dimensional real model with
corners `I`, and `W ⊆ X` open. Define `singularPairIn X W`, the pair of the singular simplicial set
of `X` and its subcomplex `TopCat.smallSingularSubcomplex` of simplices with image in `W`;
`smoothPairIn I X W`, the pair of `TauCeti.smoothSingularSubcomplex I X` and its intersection with
that subcomplex; and `smoothPairToSingular I X W`, the inclusion of the first pair into the
second. Their relative chain complexes (`SSetPair.chainComplex`) are `C^∞(X)/C^∞(W)` and
`C(X)/C(W)`, a smooth simplex of `X` with image in the open `W` being a smooth simplex of `W`.
Prove `quasiIso_smoothPairToSingular`: with real coefficients,
`SSetPair.chainComplexMap (smoothPairToSingular I X W)` is a quasi-isomorphism. Route: Tau Ceti's
five-lemma comparison `SSetPair.quasiIso_chainComplexMap` reduces it to the absolute comparisons on
the two members, which are DifferentialGeometry 8.3's for `X` and for `W` (an open subset of a
σ-compact finite-dimensional manifold is σ-compact, and the smooth simplices of `X` with image in
`W` are those of `W`). The absolute smoothing theorem is [Lee, Thm. 18.7]; the relative form over
models with corners is this roadmap's. Over `ℝ`, give the relative comparison and its homotopy
inverse from degreewise splittings of cycles and boundaries, compatibly with the dual map; the
dual relative cochain quasi-isomorphism against Tau Ceti's `TopPair.singularCochainComplex` of the
pair `(X, W)`, whose singular simplices of `W` are those of `singularPairIn X W`, by
`SSetPair.quasiIso_cochainComplexMap` from the dual absolute comparisons; naturality in smooth
maps of pairs (through `TauCeti.smoothSingularSubcomplexMap`), relative boundary maps and
enlargement of `W`. *Needs:* DifferentialGeometry 8.3; Tau Ceti `TauCeti.smoothSingularSubcomplex`,
`TopCat.smallSingularSubcomplex`, `TopPair.singularCochainComplex`,
`SSetPair.quasiIso_chainComplexMap`, `SSetPair.quasiIso_cochainComplexMap`; Mathlib
`SSetPair.chainComplexMap`.

**Checks.**

- `W = ∅`: no simplex has image in `∅`, so both subcomplexes are empty and the statement is the
  absolute comparison; `W = X` gives the zero complex on both sides.
- For `X = ℝ`, `W = ℝ ∖ {0}`: relative `H₁ ≅ ℝ`, generated by the class of the smooth path
  `t ↦ 2t − 1` on `[0, 1]`, whose boundary lies in `W`.
- Relative `H₀(ℝ, ℝ ∖ {0}) = 0`: every point is homologous to a point of `W`.
- Openness of `W` is necessary: in `X = ℝ²` let `W` be the graph of a continuous nowhere
  differentiable function on `[0, 1]`. A smooth simplex with image in `W` has a first coordinate
  with zero derivative, since the function would be differentiable wherever that derivative is
  nonzero, so it is constant; the smooth chains of `W` are those of `W` as a discrete set, the
  smooth relative `H₁` maps onto the uncountable-dimensional reduced `H₀` of that set, and the
  singular relative `H₁` is `0`, `W` being an arc.

### 2.5 Relative approximation into vector spaces

Let `D` be a Hausdorff σ-compact smooth manifold over a finite-dimensional real model with corners
`I`, `V` a real normed space, `A ⊆ D` closed, `f : D → V` continuous,
`e : D → V` smooth on an open `O ⊇ A` with `e = f` on `A`, and `ε : D → ℝ` continuous with
`ε(x) > 0` everywhere. Prove that there is a smooth `g : D → V` equal to `e` on a neighbourhood of
`A` with `‖g(x) − f(x)‖ < ε(x)` for every `x ∈ D`. The case of interest is `A = I.boundary D`,
closed as the complement of the open `I.interior D`, with `e` a collar extension of boundary data.
Route: `O′ = {x ∈ O | ‖e(x) − f(x)‖ < ε(x)/2}` is open, `e` being continuous on the open `O`, and
contains `A`; for a closed neighbourhood `T` of `A` inside `O′` and a smooth `ρ : D → [0, 1]`
equal to `1` near `A` and to `0` off `T` (`exists_contMDiffMap_one_nhds_of_subset_interior`, `D`
being normal as in the supplier contracts), `h = f + ρ(e − f)` is continuous (it is `f` off `T`),
within `ε/2` of `f`, and equal to `e`, hence smooth, on an open `O″ ⊇ A`;
`Continuous.exists_contMDiff_approx_and_eqOn` with tolerance `ε/2`, fixing a closed neighbourhood
of `A` inside `O″`, gives `g`. Mathlib's lemma assumes the map already smooth near the fixed set
and asks nothing of the target beyond a real normed space, and no step of the route uses a
dimension of `V`; the form with a smooth `e` that agrees with `f` only on `A` is this roadmap's. *Needs:* Mathlib
`Continuous.exists_contMDiff_approx_and_eqOn`, `exists_contMDiffMap_one_nhds_of_subset_interior`.

- *Homotopy rel `A`.* The straight-line homotopy `(1 − s)f + sg`, `s ∈ [0, 1]`, fixes `A`
  pointwise and stays within `ε` of `f`.
- *Image reserve.* If `f(D) ⊆ U` for an open `U ≠ V`, the theorem with the tolerance
  `min(ε(x), Metric.infDist (f x) (V ∖ U))`, continuous and positive, gives `g` and a homotopy with
  values in `U`. On a compact `D` a constant tolerance suffices, the compact `f(D)` having positive
  distance from `V ∖ U`.
- *Model domains in ambient coordinates.* Let `D` be the interval `[0, 1] ⊆ ℝ`, the square
  `[0, 1]² ⊆ ℝ²` or the closed unit disc in `ℝ²`, `e` smooth on an open neighbourhood of the
  topological boundary `∂D` in the ambient space, and `f : D → V` continuous with `f = e` on `∂D`.
  For every `ε > 0` there is a smooth `g` on the ambient space equal to `e` near `∂D` with
  `‖g − f‖ < ε` on `D`. The continuous retractions `r(t) = max(0, min(1, t))`,
  `r(s, t) = (r(s), r(t))` and `r(v) = v / max(1, ‖v‖)` onto `D` extend `f` to `f ∘ r`, and the
  theorem on the boundaryless ambient space with `A = ∂D` applies, its last step being
  `Continuous.exists_contDiff_approx_and_eqOn`. Collar data for these domains are sitting intervals
  at the endpoints, edge extensions constant near the vertices of the square and the radial collar
  on the disc.

**Checks.**

- `r(2) = 1`, `r(−1) = 0`, `r(0.3) = 0.3`; on the disc `r((3, 4)) = (0.6, 0.8)` and `r` fixes the
  unit disc pointwise.
- The smooth `e` agreeing with `f` on `A` is necessary for `g = f` on `A`: on the disc the
  continuous filling `f(x, y) = (|y|, 0)` has boundary trace `θ ↦ (|sin θ|, 0)`, which is the
  restriction of no smooth map on a neighbourhood of the circle (its composite with
  `θ ↦ (cos θ, sin θ)` would be smooth, and `|sin θ|` is not differentiable at `θ = 0`), so no
  smooth `g` agrees with `f` on `∂D`; a statement without `e` would claim one.
- Into a target with boundary the conclusion fails. On `ℝ³` let
  `Q = x² + y² + z² − 2xy − 2xz − 2yz`, which is `(y − z)²` on the plane `x = 0` and symmetrically
  on the others, let `ψ` be the bump of *Statements that must not enter the library*, vanishing on
  a closed ball `B` around `0`, let `A` be the part of the three coordinate faces of the closed positive octant inside `B`, `e = Q` and
  `f = max(Q + ψ, 0) ≥ 0`, so that `f = e` on `A`. Every smooth `g` equal to `Q` near `A` has
  `g(t, t, t) = Q(t, t, t) = −3t² < 0` for small `t > 0`, so no smooth approximation with values in
  `[0, ∞)` exists, and the image-reserve bullet needs `U` open.

### Examples

The half-line and the quadrant, where inward domination is explicit; the pair `(ℝ, ℝ ∖ {0})`, the
smallest relative chain computation.

### Dependencies

DifferentialGeometry 8.3; Tau Ceti exhaustion functions, flows, smooth singular simplices, small
singular chains, relative cochains and the five-lemma comparisons for pairs; Mathlib partitions of
unity, smooth approximation, pairs of simplicial sets and homotopy invariance of chains.

## Layer 3: relative de Rham theory

### 3.1 The relative complex

For `X` as in Layer 2 and an open `W ⊆ X`, extend the de Rham complexes `TauCeti.deRhamComplex` of
`X` and of `W` by zero along `ComplexShape.embeddingUpNat` and define the relative complex as
`CochainComplex.mappingCocone` of the extended restriction `TauCeti.deRhamComplex.map` along the
inclusion of `W`. Its coordinates are Tau Ceti's `CochainComplex.mappingCocone.relativeCoordinates`
for this restriction: they identify the degree-`q` term with `Ω^q(X) × Ω^(q−1)(W)` by negating
Mathlib's second projection, so that the differential is `(α, β) ↦ (dα, α|_W − dβ)`
(`CochainComplex.mappingCocone.relativeCoordinates_d`), the relative cocycles are the pairs with
`dα = 0` and `α|_W = dβ`, the relative coboundaries are the pairs `(dγ, γ|_W − dε)`, and smooth maps
of open pairs act componentwise (`CochainComplex.mappingCocone.relativeCoordinates_map`). In
Mathlib's own coordinates `(α, g) = (α, −β)` the differential reads `(dα, −α|_W − dg)`. Define the
connecting map `δ : H^(q−1)(W) → H^q(X, W)` by `δ[b] = −[(0, b)]`; when `b` extends to `b̃` on `X`
it equals `[(db̃, 0)]`, since `d(b̃, 0) = (db̃, b)`. This is [Bott–Tu, Ch. I, §6] for an open
inclusion; the sign of `δ` and its agreement with the singular connecting map are this roadmap's.
*Needs:* Tau Ceti `TauCeti.deRhamComplex`, `TauCeti.deRhamComplex.map`,
`CochainComplex.mappingCocone.relativeCoordinates` and its API; Mathlib
`CochainComplex.mappingCocone`, `HomologicalComplex.extend`.

**Checks.**

- Degree `0`: `H⁰(X, W)` is the locally constant functions on `X` vanishing on `W`; for
  `(ℝ, ℝ ∖ {0})` it is `0`.
- `W = ∅` gives the absolute complex; `W = X` gives an acyclic complex.
- Sign witness: on `(ℝ, ℝ ∖ {0})` let `b` be `1` on `(0, ∞)` and `0` on `(−∞, 0)`. Relative
  integration of `(0, b)` over `c = [−1, 1]` is `0 − (b(1) − b(−1)) = −1`, so `δ[b] = −[(0, b)]`
  evaluates to `1`, which is the singular `(δb)(c) = b(∂c) = 1`; the opposite convention
  `δ[b] = [(0, b)]` gives `−1`.

### 3.2 The cocone of a surjection and relative integration

For a short exact sequence `0 → N → K → L → 0` of `ℤ`-indexed cochain complexes in an abelian
category, the lift `N ⟶ mappingCocone (K → L)` of the inclusion, `a ↦ (a, 0)` in relative
coordinates, is a quasi-isomorphism (`CochainComplex.mappingCocone.quasiIso_lift_of_shortExact`),
with no closed-pair or cofibration hypothesis. There is no canonical chain map in the other
direction without a splitting. Prove that this lift carries the connecting map of the sequence to
the connecting map `δ[b] = −[(0, b)]` of the cocone, sign included: for a cocycle `b` of `L` and a
lift `b̃` to `K`, the connecting map of the sequence sends `[b]` to `[db̃]`, and `(db̃, 0)` differs
from `−(0, b)` by the coboundary `d(b̃, 0) = (db̃, b)`. This is dual to Mathlib's
`CochainComplex.mappingCone.homologySequenceδ_triangleh` for the cone of a monomorphism; the
cocone statement with this sign is this roadmap's. Apply it to smooth and to continuous singular
cochains, extended by zero to `ℤ`, whose restriction to `W` is surjective (extend simplex
coefficients by zero; for continuous cochains the sequence is
`TopPair.shortExact_singularCochainComplexShortComplex`, with connecting map
`TopPair.singularCohomologyδ`). Restriction of forms to `W` need not be surjective, so the form
cocone is never compared with a kernel. Relative integration is the map of cocones induced by the
integration of forms over smooth simplices (DifferentialGeometry 8.4), which commutes with
restriction to `W` and acts as `(α, β) ↦ (∫α, ∫β)` in relative coordinates, followed on cohomology
by the inverse of the lift for smooth singular cochains. Prove its evaluation formula
`∫_c α − ∫_{∂c} β` on relative smooth cycles `c` (extend `∫β` by zero off `W` to `e` and subtract
`d(e, 0)`), identity, composition and naturality for smooth maps of open pairs. A closed `α`
vanishing on `W` gives the relative cocycle `(α, 0)`, sent to the class of the cochain evaluating
`α` on relative smooth chains, with absolute image `deRhamHom [α]`. *Needs:* §3.1, §2.4;
DifferentialGeometry 8.4; Tau Ceti `CochainComplex.mappingCocone.quasiIso_lift_of_shortExact`,
`CochainComplex.mappingCocone.relativeCoordinates_map`,
`TopPair.shortExact_singularCochainComplexShortComplex`.

**Checks.**

- On `(ℝ, ℝ ∖ {0})`, `α = ψ dx` with `ψ` supported in `(−1, 1)` and `∫ψ = 1`, `β` a primitive of
  `ψ` on `W` equal to `0` left of the support and `1` right of it: relative integration over
  `[−1, 1]` is `1 − 1 = 0`, and indeed `(α, β) = d(Ψ, 0)` for the global primitive `Ψ`.
- Sign of the comparison, on singular cochains of `(ℝ, ℝ ∖ {0})`: let `b` be the `0`-cocycle of `W`
  equal to `1` on points of `(0, ∞)` and `0` on points of `(−∞, 0)`, and `b̃` its extension by zero.
  The connecting map of the sequence gives the relative cocycle `b̃ ∘ ∂`, whose value on the path
  `c = [−1, 1]` is `b̃(1) − b̃(−1) = 1`; its lift `(b̃ ∘ ∂, 0)` is cohomologous to `−(0, b)`. So the
  lift carries it to `δ[b]`, which evaluates to `1` on `c`, as in §3.1; with the opposite
  convention `δ[b] = [(0, b)]` the square commutes only up to `−1`, and the value is `−1`.
- No canonical map from the cocone to the kernel: for `K = ℝ²`, `L = ℝ` in degree `0` and the
  projection `(k₁, k₂) ↦ k₁`, the kernel is `{(0, k₂)}`, the degree-`0` cocone term is `ℝ² × 0`
  and its `H⁰` is `{((0, k₂), 0)}`; for every real `t`, `((k₁, k₂), 0) ↦ (0, k₂ + t·k₁)` is a chain
  map from the cocone to the kernel inducing on `H⁰` the inverse of the lift
  `(0, k₂) ↦ ((0, k₂), 0)`, so a target defined as "the" map in that direction is not determined.
- Restriction `Ω⁰(ℝ) → Ω⁰(ℝ ∖ {0})` is not surjective (`1/x` does not extend), so the kernel model
  is wrong for forms.

### 3.3 The relative de Rham isomorphism

Prove that relative integration induces an isomorphism `H^q(X, W) ≅ H^q(X, W; ℝ)` onto
Tau Ceti's relative singular cohomology, from DifferentialGeometry 8.5 on `X` and on `W`, §2.4's
relative comparison and the five lemma, compatible with both long exact sequences including the
sign of `δ`; compatible with enlargement of `W` (the identity of `X` as a map of pairs
`(X, W) → (X, W′)` for open `W ⊆ W′`), by §3.2's naturality. The absolute de Rham theorem is
[Lee, Thm. 18.14]; the relative form is this roadmap's. *Needs:*
§§3.1–3.2, §2.4; DifferentialGeometry 8.5; Tau Ceti's long exact sequence of a pair
(`TopPair.singularCohomologyδ`).

**Checks.**

- `H¹(ℝ, ℝ ∖ {0}) ≅ ℝ` on both sides, generated by `δ[b]` of §3.1, which evaluates to `1` on
  `[−1, 1]`.
- `H^q(X, ∅)` recovers `deRhamEquiv`.
- For `X = ℝ²`, `W = ℝ² ∖ {0}`: `H²(X, W) ≅ ℝ`, generated by `δ` of the angular form class, which
  evaluates to `2π` against the relative class of a disc around `0`; `H¹(X, W) = 0`.

### Examples

The pairs `(ℝ, ℝ ∖ {0})` and `(ℝ², ℝ² ∖ {0})`.

### Dependencies

Tau Ceti de Rham complexes, relative coordinates on the cocone, the kernel-to-cocone
quasi-isomorphism and relative cochains; DifferentialGeometry 8.4 and 8.5; §2.4.

## Layer 4: integration against fundamental classes

### 4.1 The integration comparison

On Hausdorff σ-compact finite-dimensional boundaryless manifolds `N` over any real model, with an
orientation `o : TauCeti.Manifold.Orientation` and the homological orientation `o_h` that
AlgebraicTopology 6.3 attaches to it (a `TauCeti.HomologicalOrientation` of `N` read as a
topological manifold modelled on `E`). In positive dimension `m` its local orientation at `x` is
AlgebraicTopology 6.3's point generator: pull `o` back to the Euclidean rechart of `N` along a
linear equivalence `E ≃L[ℝ] EuclideanSpace ℝ (Fin m)`, take there the class of an affine simplex
`[v₀, …, vₘ]` containing the point over `x` in its interior, in an oriented chart, with
`(v₁ − v₀, …, vₘ − v₀)` positively oriented, and push it forward by the open-embedding local map;
the result is independent of the linear equivalence. In dimension `1` it is the class of an
increasing path in an oriented chart. It is not Tau Ceti's chart generator
`TauCeti.localOrientationOfManifoldOrientation`, which in dimension `1` is the class of a
decreasing path, the negative of this one (negative-control Check below). In dimension `0` it is
the signed point class `ε_o(x)[x]`, `ε_o(x) = ±1` the sign of `o` at `x`. The pairing `⟨·, ·⟩`
below is Tau Ceti's `TopCat.singularKronecker`, and
`TopPair.singularKronecker` on pairs:

- for compact `N` and every smooth top form `η`,
  `TauCeti.integralTopForm o η = ⟨deRhamHom [η], [N]_ℝ⟩`, where `[N]_ℝ` is
  `TauCeti.HomologicalOrientation.realFundamentalClass` of `o_h`;
- for `N` compact or not, every compact `K ⊆ N` and every smooth top form `η` vanishing outside
  `K`, `TauCeti.integralTopForm o η = ⟨ℐ_K[η], [N]_K⟩`, where `ℐ_K[η] ∈ H^n(N, N ∖ K; ℝ)` is §3.2's
  relative integration class of the relative cocycle `(η, 0)` of the open pair `(N, N ∖ K)` and
  `[N]_K` is the real image, under `TauCeti.intToRealCoeff`, of the class
  `TauCeti.HomologicalOrientation.fundamentalClassOn` of `o_h` along `K` in `H_n(N, N ∖ K; ℤ)`; for
  compact `N` and `K = N` this is the first bullet, since `ℐ_N[η]` is `deRhamHom [η]` at `W = ∅`
  (§3.3) and both classes are characterized by the same local images
  (`TauCeti.HomologicalOrientation.eq_fundamentalClassOn`,
  `TauCeti.HomologicalOrientation.eq_fundamentalClass`);
- the value does not depend on `K`: for compact `K ⊆ K′`, the map of pairs
  `(N, N ∖ K′) → (N, N ∖ K)` carries `[N]_K′` to `[N]_K`
  (`TauCeti.HomologicalOrientation.localHomologyRestriction_fundamentalClassOn_of_subset`) and pulls
  `ℐ_K[η]` back to `ℐ_K′[η]` (§3.2's naturality for smooth maps of open pairs).

No second class carrier, orientation local system or class factory is built; this roadmap owns the
conversions between existing carriers: the passage from a boundaryless smooth manifold over a model
`I` to the topological manifold modelled on `E` that `TauCeti.HomologicalOrientation` takes and,
in dimension `0`, to the smooth manifold over `𝓘(ℝ, E)` with the transported orientation and
forms, on which Tau Ceti's zero-dimensional integrals are stated, the change of coefficients
`ℤ → ℝ` on relative local homology through `TauCeti.intToRealCoeff`, and
smooth-relative-to-singular naturality. Local computation: place each compact piece `S` of a
partition inside the interior of a positively oriented affine simplex `σ` of an oriented chart,
as above; `σ` is a relative cycle of `(N, N ∖ S)` and its class is `[N]_S`, since its local image
at every interior point is AlgebraicTopology 6.3's point generator
(`TauCeti.HomologicalOrientation.eq_fundamentalClassOn`); derive the local formula
`⟨ℐ_S[η_S], [σ]⟩ = ∫_σ η_S = TauCeti.integralTopForm o η_S` for the piece `η_S` of `η` vanishing
outside `S` from the relative evaluation of §3.2 at `β = 0` and the one-chart integral identity,
in which the orientation-preserving parametrization `σ` integrates `η_S` with sign `+1`; assemble
by `TauCeti.integralTopForm_add`. Dimension zero: a compact `K` is finite, and the class along `K`
is `Σ_{x ∈ K} ε_o(x)[x]`, by the local-image characterization. A top form `η` vanishing outside
`K` is the finite sum of the forms `η_x` equal to `η` at `x ∈ K` and `0` elsewhere, each supported
in `{x}`; `TauCeti.integralTopForm_ofFunction_zeroDim` integrates `η_x` to `ε_o(x) η(x)`, and
`TauCeti.integralTopForm_sum` adds the pieces, each smooth (`TauCeti.isSmoothForm_zeroDim`) with
compact support and hence integrable (`TauCeti.IsSmoothForm.integrableTopForm`). So the integral
is `Σ_{x ∈ K} ε_o(x) η(x)` for every `N`, finite or not; for finite `N` and `K = N` it is
`TauCeti.integralTopForm_ofFunction_finite_zeroDim`, which assumes `[Fintype N]`. These lemmas are
stated over `𝓘(ℝ, E)`, so they are applied on `N` recharted along `I` (in dimension `0`,
`range I = E`), one of the carrier conversions above. The interior
compact-support formula on a Hausdorff σ-compact manifold `M` with boundary over a
finite-dimensional model, which §4.2 uses, is the second bullet on the boundaryless open
submanifold `I.interior M`, carried to `M` by
`TauCeti.integralTopForm_mpullback_subtypeVal` and excision of `M ∖ I.interior M`
(`TopPair.isIso_singularHomologyMap_excisionMap_of_isClosed_subset` for `K` inside the open
`I.interior M`); general
orientation-preserving open embeddings of equal dimension are Tau Ceti's
`Topology.IsOpenEmbedding.integralTopForm_mpullback_of_isOrientationPreservingAt`. The statement is
a de Rham form of the fact that the fundamental class is dual to integration ([Bott–Tu, §5] for the
compact boundaryless case through Poincaré duality); the chain-level comparison with the singular
classes is this roadmap's. *Needs:* Layer 3; DifferentialGeometry 8.4; Tau Ceti
`TauCeti.integralTopForm`, `TauCeti.integralTopForm_add`,
`TauCeti.HomologicalOrientation.fundamentalClassOn`,
`TauCeti.HomologicalOrientation.eq_fundamentalClassOn`,
`TauCeti.HomologicalOrientation.realFundamentalClass`,
`TopCat.singularKronecker`, `TopPair.singularKronecker`,
`TopPair.isIso_singularHomologyMap_excisionMap_of_isClosed_subset`; AlgebraicTopology 6.3 (the
homological orientation of a tangent orientation, its point generators and the signed local
images of chart-simplex classes).

**Checks.**

- `S¹` with the counterclockwise orientation: `[S¹]_ℝ` is the counterclockwise loop
  `t ↦ e^(2πit)`, whose local image at each point is the increasing path in an angle chart, and
  `∫ dθ = 2π = ⟨deRhamHom [dθ], [S¹]_ℝ⟩`; reversing the orientation negates both sides.
- Two points with orientations `+` and `−`: `∫ f = f(a) − f(b)`; a convention ignoring point
  orientations gives `f(a) + f(b)`.
- `N = ℤ` with the discrete topology (Hausdorff, σ-compact, boundaryless, dimension `0`, not
  compact), all signs `+`, `K = {0, 1}` and `η = 1` at `0`, `2` at `1`, `0` elsewhere: the
  compact-support formula gives `1 + 2 = 3` on both sides, the class `[ℤ]_K` being `[0] + [1]`.
  A dimension-zero step through the finite-manifold lemma alone would need `[Fintype ℤ]`, which
  does not exist; the one-point lemma and the finite sum over `K` give the value.
- `ℝ` with `ψ dx`, `ψ` supported in `K = [−1, 1]`, `∫ψ = 1`: `[ℝ]_K` is represented by the smooth
  simplex `t ↦ 4t − 2`, whose boundary `[2] − [−2]` lies in `ℝ ∖ K`, and the pairing is
  `∫_{−2}^{2} ψ dx − 0 = 1`; for `K′ = [−3, 3]` the simplex `t ↦ 8t − 4` gives `1` again. The
  simplex `t ↦ 2t − 1` is no relative cycle (its endpoints `±1` lie in `K`). `ℐ_K[η]` is nonzero
  although its absolute image `deRhamHom [η]` is `0` (as `H¹(ℝ; ℝ) = 0`), so a formula read on
  absolute classes would give `0`.
- The local generator is AlgebraicTopology 6.3's, not Tau Ceti's chart generator. On `ℝ` with
  the standard orientation, `TauCeti.localOrientationOfManifoldOrientation` at `0` is the class of
  the path from `1` to `−1`: the orthonormal basis of the positive orientation is `b₀ = 1`, the
  zero-sphere generator is `[−1] − [1]`, and the connecting map sends the class of a path `γ` to
  `[γ(1)] − [γ(0)]`. AlgebraicTopology 6.3's point generator at `0` is the path from `−1` to `1`.
  A homological orientation built from the former has `[ℝ]_K` represented by `t ↦ 2 − 4t`, and the
  formula would read `1 = −1` on the `ψ dx` above and `2π = −2π` on the counterclockwise `S¹`.

For compact Hausdorff oriented `M` over `𝓡∂ m`, `m > 0` (second countable by
`ChartedSpace.secondCountable_of_sigmaCompact`, so that AlgebraicTopology 6.3's relative class
exists), let `U` be the image of a topological collar `∂M × [0, 1) → M` (Tau Ceti's Brown collar),
`α` a smooth top form on `M` and `β` a smooth `(m−1)`-form on `U` with `α|_U = dβ`. Then
`⟨ℐ[α, β], [M, U]_ℝ⟩ = ∫_M α − ∫_{∂M} j^*β`, with §3.3's relative class `ℐ[α, β]`,
AlgebraicTopology 6.3's oriented relative class transported along `(M, ∂M) → (M, U)`, Tau Ceti's
outward-first `TauCeti.boundaryOrientation` and `j : ∂M → U` the smooth factorization of the
boundary inclusion (no derivative of the topological collar is used). Route: a smooth cutoff `ρ`
from `exists_contMDiffMap_one_nhds_of_subset_interior`, equal to `1` near `∂M` and supported in a
closed neighbourhood inside `U`; `γ = ρβ` extended by zero; `[α, β] = [α − dγ, β − γ|_U]`; §4.1's
interior formula for `α − dγ` and Stokes' theorem `TauCeti.integralTopForm_mextDeriv` for `γ`;
independence of cutoff and collar. The formula, which combines §4.1's interior formula with Stokes'
theorem, is this roadmap's. *Needs:* §4.1, §3.3; Tau Ceti `TauCeti.boundaryOrientation`,
`TauCeti.integralTopForm_mextDeriv`, `TauCeti.IsLocallyCollared.isCollared`; AlgebraicTopology 6.3
(the oriented relative class).

**Checks.**

- On `D¹ = [−1, 1]` with `α = 0` and `β` locally constant with values `c₊`, `c₋` near `±1`, the
  pairing is `−(c₊ − c₋)`: the outward-first orientation gives `∫_{∂D¹} β = c₊ − c₋`.
- `β = 0` near `∂M` reduces to §4.1's interior formula.
- On `[0, 1]`, `α = dx`, `β = x` near both ends: `∫ α − (1 − 0) = 0`, consistent with
  `(dx, x) = d(x, 0)` being exact.
- The Hausdorff hypothesis is necessary: let `M` be `[−1, 1]` with its origin doubled to `0` and
  `0′`, a compact manifold over `𝓡∂ 1` with boundary `∂M = {−1, 1}`, oriented by the coordinate,
  and Hausdorff except at the pair `0, 0′`. The pair sequence gives `H₁(M, ∂M; ℝ) ≅ ℝ²`
  (`H₁(M) ≅ ℝ` by Mayer–Vietoris, and `H₀(∂M) = ℝ² → H₀(M) = ℝ` has kernel `ℝ`), spanned by the
  arcs `c` through `0` and `c′` through `0′` from `−1` to `1`. The local image of `a·c + b·c′` is
  `a` at `0`, `b` at `0′` and `a + b` at every other interior point, and an orientation has one
  sign `s` on all of them, so `a = b = a + b = s` forces `s = 0`: there is no relative fundamental
  class, and the left side of the formula is undefined.

### Examples

`S¹`, the two-point manifold and `D¹`, which pin the orientation and boundary signs.

### Dependencies

Layer 3; DifferentialGeometry 8.4; Tau Ceti orientations, integration of top forms, Stokes'
theorem, fundamental classes, excision, the Kronecker pairing and collars; AlgebraicTopology 6.3.

## Layer 5: finite-parameter relative transversality

### 5.1 The incidence equation and regular parameters

For real normed spaces `E, W, V, P`, smooth `F : E × P → V` and `j : W → V`, define
`incidenceEquation F j : (E × W) × P → V`, `((x, y), p) ↦ F(x, p) − j(y)`, and
`IsRegularIncidenceParameter F j p` as `TauCeti.IsRegularParameter (incidenceEquation F j) 0 p`:
the slice at `p` is transverse to `j`. *Universal transversality* is surjectivity of the full
derivative of `incidenceEquation F j` at every zero. *Needs:* Tau Ceti
`TauCeti.IsRegularParameter`; Mathlib `fderiv`, `ContinuousLinearMap.coprod`.

- The fixed-parameter derivative of `incidenceEquation F j` at `((x, y), p)` is
  `(u, v) ↦ D_xF(x, p)u − Dj(y)v` when `F` and `j` are differentiable there.
- If `dim E + dim W < dim V`, a regular parameter's slice misses `j(W)` entirely (avoidance), and
  this holds simultaneously for countable families.
- Regularity of `p` is pointwise on the incidence, so for open covers of `E` and `W` it is the
  conjunction of the same condition for the restrictions of `F(·, p)` and `j` to the members; it is
  unchanged under affine isomorphisms of `E`, `W` and `V`, and an affine isomorphism `ψ` of `P`
  makes `p` regular for `F ∘ (id × ψ)` exactly when `ψ(p)` is regular for `F`. §5.3 passes to
  manifolds this way, through countably many product chart neighbourhoods of the incidence,
  without extending maps by junk values off their chart domains.

**Checks.**

- `incidenceEquation` at `((1, 2), 3)` for `F(x, p) = x + p`, `j = id` on `ℝ` is `1 + 3 − 2 = 2`.
- `F(x, p) = x² + p` on `ℝ`, `W` a point, `j = 0`: `p = −1` is regular (zeros `±1`, derivatives
  `±2`), `p = 0` is not (derivative `0`), `p = 1` is regular (empty fibre); an always-true
  predicate fails at `0`.
- Same `F`, `W = ℝ`, `j = id`: every `p` is regular, since `(u, v) ↦ 2xu − v` is onto; a definition
  that forgets `Dj` would wrongly reject `p = 0`.
- Universal transversality is a condition on the whole family: `F(x, p) = x² + p` against `j = 0`
  on a point has full derivative `(u, q) ↦ 2xu + q`, onto at every zero, although the slice at
  `p = 0` is not transverse; `F(x, p) = x²` has full derivative `(u, q) ↦ 2xu`, which vanishes at
  the zeros `(0, p)`, so it is not universally transverse.

### 5.2 Generic parameters

Prove `addHaar_setOf_not_isRegularIncidenceParameter`: for finite-dimensional `E, W, V, P` and
smooth `F`, `j` with universal transversality, the parameters whose slice is not transverse form a
set that is null for every additive Haar measure on `P`. Route: the incidence
`{((x, y), p) | F(x, p) = j(y)}` is a smooth manifold by Tau Ceti's level-set charts
`TauCeti.levelSetChart`, universal transversality being surjectivity of the full derivative of
`incidenceEquation F j` at its zeros; at an incidence point the projection to `P` is regular
exactly when the slice derivative is onto; apply `TauCeti.addHaar_image_criticalPoints_eq_zero` in
countably many incidence charts. Neither properness nor closedness of `j(W)` is assumed. This
refines Tau Ceti's meagre statement `TauCeti.isMeagre_setOf_not_isRegularParameter` to a null one.
At a point with `F(x, p) = j(y)`, the image of the slice derivative of `(x, y) ↦ (F(x, p), j(y))`
together with the tangent space `{(a, a)}` of the diagonal is all of `V × V` exactly when
`(u, v) ↦ D_xF(x, p)u − Dj(y)v` is onto, because `(D_xF u + a, Dj v + a) = (c₁, c₂)` is solvable
iff `D_xF u − Dj v = c₁ − c₂` is; so this is the flat case, against the diagonal, of the parametric
transversality theorem for embedded submanifolds [Lee, Thm. 6.35], and the incidence form against
a map is this roadmap's. *Needs:* §5.1; Tau Ceti `TauCeti.levelSetChart` and
`TauCeti.addHaar_image_criticalPoints_eq_zero`.

- *Local form.* The same holds for `F` smooth on an open `O ⊆ E × P` and `j` smooth on an open
  `W₀ ⊆ W`, with universal transversality asked only at the zeros of `incidenceEquation F j` in
  the open set `{((x, y), p) | (x, p) ∈ O, y ∈ W₀}`: the parameters `p` for which some `(x, y)`
  with `(x, p) ∈ O`, `y ∈ W₀` and `F(x, p) = j(y)` has `(u, v) ↦ D_xF(x, p)u − Dj(y)v` not onto
  form a Haar-null set. The values of `F` and `j` off `O` and `W₀` never enter and the route is
  unchanged: a level-set chart needs strict differentiability at its centre only,
  `TauCeti.addHaar_image_criticalPoints_eq_zero` asks for `ContDiffAt` only at the points of a set,
  which need not be open, and the incidence, a subset of a finite-dimensional space, is covered
  by countably many charts. §5.3 applies this form in products of chart domains.

**Checks.**

- `F(x, p) = x² + p`, `j = 0`: the bad set is `{0}`, Haar-null.
- `F(x, p) = x²` (no parameter dependence), `j = 0`: universal transversality fails at `(0, p)` and
  every `p` is bad, a set of full measure; the hypothesis is necessary.
- `V = 0`: every parameter is regular and the bad set is empty.
- Local form, `F(x, p) = x² + p` against `j = 0` on a point: on `O = (−1, 1) × ℝ` the bad set is
  still `{0}`, the zero `x = 0` of the slice at `p = 0` lying in `O`; on `O = (1, 2) × ℝ` it is
  empty, the zeros `√(−p)`, `−4 < p < −1`, having derivative `2√(−p) ∈ (2, 4)`. Nothing outside
  `O` is extended or consulted.

### 5.3 Relative perturbations

Define `relativeTranslate f β p = f + β • p` for maps `f : X → V` and `β : X → ℝ` on any type `X`
and `p ∈ V`; it equals `f` on the zero set of `β`. Prove
`exists_isRegularIncidenceParameter_relativeTranslate`: for finite-dimensional `E`, `W`, `V`,
smooth `f : E → V`, `j : W → V` and `β : E → ℝ` with `β ≥ 0` and zero set exactly `C`, if at every
`x ∈ C` and every `y` with `f(x) = j(y)` the map `(u, v) ↦ Df(x)u − Dj(y)v` is onto, then for every
`r > 0` there is `p ∈ V` with `‖p‖ < r` that is a regular incidence parameter of the family
`(x, p) ↦ f(x) + β(x)p` against `j`, so that `relativeTranslate f β p` is transverse to `j`, and
`relativeTranslate f β p = f` on `C`. Route: the family is universally transverse (where
`β(x) > 0` the parameter derivative `β(x)·id` is onto; where `β(x) = 0`, `Dβ(x) = 0` because `x`
minimizes `β`, so the source derivative is `Df(x)` and the hypothesis applies), so by §5.2 its bad
parameters form a Haar-null set, which contains no ball. For every closed `C ⊆ E` such a `β`, with
values in `[0, 1]`, is Mathlib's `IsOpen.exists_contDiff_support_eq` applied to `E ∖ C`. The
cutoff argument extends [Lee, Thm. 6.36] from embedded submanifolds to maps. *Needs:* §§5.1–5.2;
Mathlib `IsOpen.exists_contDiff_support_eq`.

On manifolds, define `IsTransverseAt I J g j x` for maps `g : M → V` and `j : N → V` from charted
spaces over real models with corners `I` and `J`, and a point `x ∈ M`: `g` is *transverse to* `j`
at `x` when `(u, v) ↦ mfderiv g x u − mfderiv j y v` is onto `V` for every `y ∈ N` with
`g(x) = j(y)`, vacuously when there is none. `mfderiv` is total, zero where a map is not
differentiable, so the predicate is applied to smooth maps only. *Needs:* Mathlib `mfderiv`,
`ContinuousLinearMap.coprod`.

- On normed spaces, over `𝓘(ℝ, E)` and `𝓘(ℝ, W)`, for smooth `F : E × P → V` and `j : W → V`,
  the slice `F(·, p)` is transverse to `j` at every point exactly when `p` is a regular incidence
  parameter (§5.1), because `mfderiv` is `fderiv` there (`mfderiv_eq_fderiv`).
- For fixed `j`, transversality of `g` at `x` depends only on the germ of `g` at `x`. It is
  unchanged when `g` and `j` are both composed with one affine isomorphism of `V`, and it is
  invariant under diffeomorphisms of the sources: for a diffeomorphism `ψ`, `g ∘ ψ` is transverse
  to `j` at `x` exactly when `g` is at `ψ(x)`, and likewise for `j ∘ ψ`.
- If `dim M + dim N < dim V` (model dimensions), `g` is transverse to `j` at `x` exactly when
  `g(x) ∉ j(N)`.

**Checks.**

- Vacuous case: `M = V = ℝ`, `N` a point, `g = 1`, `j = 0`. No `y` has `g(x) = j(y)`, so `g` is
  transverse to `j` at every point although `Dg = 0`; a definition demanding that `Dg` be onto
  rejects it.
- `Dj` counts: `M = N = V = ℝ`, `g = 0`, `j = id`. At every `x` the only `y` is `0`, and
  `(u, v) ↦ 0·u − v` is onto, so `g` is transverse at every point; a definition that forgets `Dj`
  rejects it.
- A failure: `M = V = ℝ`, `N` a point, `j = 0`, `g(x) = x²`. At `x = 0` the map `(u, v) ↦ 0` is not
  onto, so `g` is not transverse at `0`, while at every `x ≠ 0` it is, vacuously; an always-true
  predicate is wrong at `0`.
- Agreement with §5.1: for `F(x, p) = x² + p` and `j = 0` on a point, the slice at `p = −1` is
  transverse at `±1` (derivatives `±2`) and vacuously elsewhere, and `−1` is a regular incidence
  parameter; at `p = 0` both fail, at `x = 0`.

The targets on manifolds:

- *Manifold sources.* Let `M` and `N` be second-countable boundaryless smooth manifolds, not
  necessarily Hausdorff, over finite-dimensional real models `I` and `J`, `V` a finite-dimensional
  real normed space, and `f : M → V`, `j : N → V` and `β : M → ℝ` smooth with `β ≥ 0` and `f`
  transverse to `j` at every zero of `β`. Prove
  `addHaar_setOf_not_forall_isTransverseAt_relativeTranslate`: the parameters `p ∈ V` for which
  `relativeTranslate f β p` fails to be transverse to `j` at some point of `M` form a set that is
  null for every additive Haar measure on `V` (outer measure). A Haar-null set
  contains no ball, so for every `r > 0` there is `p` with `‖p‖ < r` for which
  `relativeTranslate f β p` is transverse to `j` at every point of `M`, and it equals `f` on the
  zero set `C` of `β`. On a Hausdorff such `M`, every closed `C` is the zero set of such a `β` with
  values in `[0, 1]`, by Mathlib's `exists_contMDiff_zero_iff_one_iff_of_isClosed` with the empty
  set as the set where it is `1` (`M` is σ-compact, being second countable and locally compact).
  Route: the family `(x, p) ↦ f(x) + β(x)p` is universally transverse to `j` as in the flat case,
  a zero of `β ≥ 0` being a minimum and so, `M` being boundaryless, a critical point of `β`. Every
  point of `M` has a chart neighbourhood whose extended chart image is open in the model vector
  space: shrink the chart domain to the preimage of the interior of `range I`, which contains the
  image of the point because `M` is boundaryless. Countably many of these cover the
  second-countable `M`, and likewise for `N`. On the product of two such neighbourhoods the
  family and `j`, read in the charts, are smooth on open sets and the chart derivatives are
  isomorphisms, so transversality of `relativeTranslate f β p` to `j` there is regularity of `p`
  for the coordinate family (§5.1). The local form of §5.2 makes the bad parameters of each
  product Haar-null, and a countable union of Haar-null sets is Haar-null. Parametric
  transversality to an embedded submanifold is [Lee, Thm. 6.35]; the form against a map, for
  relative translation families, is this roadmap's, its cutoff argument extending [Lee, Thm. 6.36]
  as in the flat case. *Needs:* §5.1, the local form of §5.2; Mathlib `mfderiv`,
  `exists_contMDiff_zero_iff_one_iff_of_isClosed`.
- *Compact sources, finitely many maps, finite order.* If moreover `M` is compact and
  `f₁, …, f_n : M → V` are smooth, each transverse to `j` at every zero of `β`, then for every
  `k ∈ ℕ` and `ε > 0` there is one `p ∈ V` such that every `relativeTranslate f_i β p` is
  transverse to `j` at every point, equals `f_i` on the zero set of `β`, and lies within `ε` of
  `f_i` in the norm `‖h‖_{C^k} = max_{a, l ≤ k} sup_{φ_a(K_a)} ‖Dˡ(h ∘ φ_a⁻¹)‖` of a fixed finite
  family of charts `φ_a` and compact `K_a` in their domains covering `M`. Route:
  `‖βp‖_{C^k} = ‖β‖_{C^k} ‖p‖`, so every `p` with `‖p‖ < ε / (1 + ‖β‖_{C^k})` is close enough;
  by the manifold statement the bad parameters of each `f_i` form a Haar-null set, and the finite
  union of these contains no ball. The straight-line homotopy `s ↦ f_i + sβp`, `s ∈ [0, 1]`, fixes
  the zero set of `β` and stays within `ε` of `f_i` in that norm. *Needs:* the manifold statement
  above.
- *Compact sources with corners.* Let `D` be a compact Hausdorff smooth manifold over a
  finite-dimensional real model with corners `I`, `j : N → V` as above, `f : D → V` continuous,
  `e : D → V` smooth on an open `O ⊇ I.boundary D` with `e = f` on `I.boundary D` and `e`
  transverse to `j` at every point of `O`, and `ε > 0`. Then there is a smooth `g : D → V` with
  `‖g − f‖ < ε` everywhere, equal to `e` near `I.boundary D` and transverse to `j` at every point
  of `D`. Route: §2.5 gives a smooth `g₀` within `ε/2` of `f` and equal to `e` on an open `O₀`
  with `I.boundary D ⊆ O₀ ⊆ O`. Take a closed neighbourhood `C ⊆ O₀` of the boundary and a cutoff
  `β : D → [0, 1]` with zero set `C`. The open `I.interior D` is boundaryless and second countable
  (`D` is compact, hence second countable by `ChartedSpace.secondCountable_of_sigmaCompact`), and
  `g₀` is transverse to `j` at the points of `C` in it, where it agrees with `e` near the point; the
  manifold statement there gives `p` with `‖p‖ < ε/2` for which `g = g₀ + βp` is transverse to `j`
  at every interior point. On `C`, a neighbourhood of `I.boundary D`, `g = g₀ = e`, so `g` is
  transverse to `j` at the boundary points too, and `‖g − f‖ < ‖p‖ + ε/2 < ε`. For the interval,
  the square and the closed disc the same holds in ambient coordinates, through the model-domain
  form of §2.5. *Needs:* the manifold statement above, §2.5, Mathlib
  `ChartedSpace.secondCountable_of_sigmaCompact`.

**Checks.**

- `f = 0`, `β(x) = x²`, `p = 1`: `relativeTranslate f β 1 2 = 4`, and the translate fixes `C = {0}`.
- `β = 0`, `C = E`: the hypothesis is transversality of `f` itself and `p = 0` works.
- The transversality hypothesis on `C` is necessary: for `f(x) = x²`, `β(x) = x²`, `j = 0` on `ℝ`,
  `f` is not transverse at `0 ∈ C`, and every translate `x²(1 + p)` has the zero `0` with
  derivative `0`, so no parameter is regular.
- Manifold sources, `M = ℝ`, `N` a point, `j = 0`, `f(x) = x²`, `β = 1` (no zeros, so the
  hypothesis is empty): `x² + p` fails to be transverse only at `p = 0`, where its zero `0` has
  derivative `0`; for `p > 0` it has no zeros and for `p < 0` its zeros `±√(−p)` have derivatives
  `±2√(−p) ≠ 0`. The bad set `{0}` is Haar-null and nonempty, so a statement that every parameter
  is good would be false.
- The Hausdorff property is not needed: let `M` be the line with two origins (second countable,
  boundaryless, not Hausdorff), `N` a point, `j = 0`, `f = x²` read in either chart and `β = 1`.
  The translate `x² + p` fails to be transverse only at `p = 0`, at both origins, so the bad set is
  again `{0}`, Haar-null.
- Second countability is necessary: let `N` be `ℝ` with the discrete topology, a boundaryless
  `0`-dimensional manifold that is not second countable, `j` the identity into `V = ℝ`, `M` a
  point, `f = 0` and `β = 1`. Every translate `p` equals `j(p)`, where the map
  `T M × T_p N = 0 → ℝ` is not onto, so every parameter is bad and the bad set has infinite
  measure.

### Examples

Two curves in `ℝ³` (`dim E + dim W = 2 < 3`) are made disjoint by a generic translation; the
parabola family `x² + p` has the single bad parameter `0`. Two circles `S¹ → ℝ³`, the second fixed
and the first translated by `βp` with `β` vanishing on an arc already disjoint from the second
circle, are made disjoint by almost every small `p`, by the manifold form of §5.3 with
`dim M + dim N = 2 < 3`.

### Dependencies

§2.5; Tau Ceti level-set charts and flat Sard; Mathlib bump functions and partitions of unity,
manifold derivatives `mfderiv`, countable atlases of second-countable manifolds and additive Haar
measures.

## Statements that must not enter the library

- **"Separately smooth face data extend to a smooth simplex into a target with boundary."** On a
  `3`-simplex into `[0, ∞)`, prescribe near the origin `(y−z)²`, `(x−z)²`, `(x−y)²` on the
  coordinate faces; with `Q = x² + y² + z² − 2xy − 2xz − 2yz` and a smooth bump `ψ` of `x + y + z`,
  zero near `0` and at least `1` near the opposite face, `max(Q + ψ, 0)` is a continuous filling
  with these faces. A smooth filling would have zero value and gradient and Hessian with diagonal
  `2` and off-diagonal `−2` at `0`, so its value along `(t, t, t)` is `−3t² + o(t²) < 0`. Hence a
  face-fixing relative smoothing lemma holds only for boundaryless targets, and a proof of
  DifferentialGeometry 8.3 over models with corners cannot use it.
- **"The semiflow of a strictly inward field is a smooth collar, face by face."** At a corner it is
  neither. On the quadrant the semiflow of `(1, 1)` is a topological collar of the whole boundary
  whose depth coordinate `min(x, y)` is not differentiable on the diagonal, and its flowout
  `{(a + s, s) | a, s ≥ 0}` of the face `{y = 0}` misses `(0, t)` for every `t > 0`, so it is not a
  neighbourhood of that face (§2.2). For the half-space model the flowout of an inward-pointing
  field is a smooth collar, which is GeometricTopology §1.1's.
- **"The form cone is the kernel of restriction."** Restriction of forms to an open need not be
  surjective; the kernel-to-cocone quasi-isomorphism of §3.2 applies only to the cochain
  sequences.
- **"A continuous `1`-form can be integrated along continuous paths."** Continuity alone gives no
  primitives (`x dy` has none on any disc, §1.1); local primitives are the hypothesis of Layer 1.
- **"Transverse parameters are dense, hence the bad set is null."** Density is Tau Ceti's meagre
  statement; nullness needs Sard on the incidence manifold (§5.2).

## Downstream consumers

- ComplexKahlerGeometry K6.1 (analytic cycles) consumes the boundaryless instances of §§2.4,
  3.1–3.3 and 4.1: the relative form complex of an open pair, its integration map to relative
  singular cohomology and the relative de Rham isomorphism, with naturality for smooth maps of open
  pairs, enlargement of `W` and the absolute image of `(α, 0)` (§§3.1–3.3); the relative
  smooth/continuous chain comparison (§2.4); and the compact-support integration formula with its
  compact absolute case, dimension-zero sign and independence of `K` (§4.1), whose change of
  variables along open embeddings is Tau Ceti's. K6.1 names these as DifferentialGeometry 8.4's,
  8.3's and 9.3's; DifferentialGeometry 8.3, 8.4 and 9.3 plan the absolute theory only.

## Prior work

Yury Kudryashov's `github.com/urkud/DeRhamCohomology` for the de Rham carriers consumed from Tau
Ceti; cited for design, never as the definition of a target.

## References

- [Lee] John M. Lee, *Introduction to Smooth Manifolds*, 2nd ed., Graduate Texts in Mathematics
  218, Springer, 2013: Prop. 2.28 (exhaustion functions), Thms. 9.24–9.26, pp. 222–223 (boundary
  flowout, collar neighbourhoods, homotopy equivalence with the interior), Thm. 6.35
  (parametric transversality), Thm. 6.36 (transversality by a homotopy), Ch. 11, *Conservative
  Covector Fields* (path independence and exactness of closed covector fields), Thm. 18.7 (smooth
  singular homology) and Thm. 18.14 (the de Rham theorem).
- [Hatcher] Allen Hatcher, *Algebraic Topology*, Cambridge University Press, 2002, cited from the
  author's online edition: Prop. 1.30 (homotopy lifting), Prop. 1.33 (the lifting criterion) and
  Prop. 1.34 (uniqueness of lifts).
- [Bott–Tu] Raoul Bott and Loring W. Tu, *Differential Forms in Algebraic Topology*, Graduate
  Texts in Mathematics 82, Springer, 1982: Ch. I, §5 (Poincaré duality) and §6 (relative de Rham
  theory).

## Acknowledgements

This material was first drafted inside the DifferentialGeometry roadmap by kim-em.
