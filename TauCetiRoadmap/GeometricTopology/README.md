# Roadmap: geometric topology and the solved Kirby-list problems

**Summary.** Build, on the native manifold, embedding, knot and simplicial carriers of Mathlib and
Tau Ceti, the geometric topology needed to *state* faithfully, and then to prove, a family of
theorems from Rob Kirby's problem list `[Kir97]` and its successors: the gluing and connected-sum
calculus of manifolds with boundary and the PL structure groupoid (Layer 1); locally flat
embeddings, Brown's collaring and the annulus theorem (Layer 2); the diffeomorphism group with its
weak Whitney topology, the Smale conjecture, Cerf's theorem and Watanabe's theorem (Layer 3); knot
theory on its presentations, Markov's and Reidemeister's theorems, sliceness, the Alexander, Jones
and HOMFLY polynomials with their agreement theorems, and Freedman's theorem (Layer 4); knot
exteriors, slopes, Dehn filling and surgery, Property P and Property R (Layer 5); the knot
concordance group, the Tristram–Levine signatures and link cobordisms (Layer 6); Riemannian volume,
hyperbolic structures, Mostow rigidity, the Weeks manifold and Agol's virtual fibering and virtual
Haken theorems (Layer 7); Thurston's eight geometries, the prime decomposition, the JSJ
decomposition and geometrization (Layer 8); handlebodies, Heegaard splittings, Heegaard genus and
Li's rank-versus-genus examples (Layer 9); taut foliations, the Euler class of an oriented plane
bundle, the Thurston norm, Thurston's inequality and Yazdi's counterexamples to the Euler class one
conjecture (Layer 10); polyhedra, triangulability, combinatorial manifolds, collapse, Zeeman's
conjecture as a stated conjecture and Manolescu's non-triangulable manifolds (Layer 11); and the
comparison of the smooth, PL and topological structures (Layer 12). The statements are the
deliverable: each layer names the exact hypotheses, conventions and locators under which its
theorems are true, and every end theorem that is statable on the pinned carriers is stated in
`Suggested.lean`.

## Scope and ownership

This roadmap owns:

- collars and the local product structure of a manifold with boundary beyond the native local
  collars, gluing along a piece of the boundary, handle attachment, the connected sum with its
  independence theorem, and the comparison of the native PL groupoid with the simplicial PL
  structures (Layer 1, with 11.3 and 12.1);
- the extensions of the native locally flat embedding theory: the three boundary variants of local
  flatness, the comparison of the native collaring theorems with Brown's global theorem for
  compact boundaries, the annulus theorem in every dimension as a stated target, and the
  Kirby–Siebenmann normal-bundle dependency named as such (Layer 2);
- continuity of inversion on the native weak Whitney diffeomorphism group, the topological-group
  structure, the relative groups `Diff(M, ∂M)` with their topology, the orientation-preserving
  subgroup and the degree, and the statements of the Smale conjecture, Cerf's theorem and
  Watanabe's theorem (Layer 3);
- knot theory on its presentations: the comparison theorems between the native smooth, PL,
  braid-closure, PD-code and Gauss-code presentations, Reidemeister's theorem, Markov's theorem,
  the Seifert matrix of a diagram, the agreement of the native Alexander, Jones and HOMFLY routes,
  the slice genus bounds, and the statement of Freedman's theorem (Layer 4);
- knot and link exteriors, the boundary tori of an exterior and their framings, Dehn filling and
  surgery, the surgery identities on the unknot, general-dimension surgery, and the statements of
  Property P, Property R and the cosmetic-surgery results (Layer 5);
- the knot concordance group on the native concordance relations, the Tristram–Levine signature
  as a concordance invariant, link cobordisms and the slice genus inequalities (Layer 6);
- the Weeks manifold, the minimal volume theorem and the statements of Agol's theorems on the
  native hyperbolic, virtually fibered and virtually Haken carriers (Layer 7);
- the prime decomposition of closed orientable `3`-manifolds, the comparison of the native
  geometric torus decomposition with Thurston's formulation through the eight model geometries,
  and the statements of the JSJ theorem, geometrization and the Poincaré conjecture (Layer 8);
- handlebodies, Heegaard splittings, Heegaard genus, the rank inequality and Li's theorem
  (Layer 9);
- codimension-one foliations and tautness on the native `TauCeti.Foliation`, the Euler class of
  an oriented plane bundle in degree-two integral cohomology, the Thurston norm and its dual,
  Thurston's inequality and Yazdi's theorem (Layer 10);
- the realization API beyond the native one (compact subsets, the CW structure of a polyhedron and
  its cellular chain complex), triangulations of manifolds, the reconciliation of combinatorial
  manifolds with PL manifolds, and Manolescu's theorem (Layer 11);
- the smoothing-and-triangulation comparison (Layer 12).

This roadmap leaves to named suppliers, and never restates:

- the Riemannian volume measure, the Levi-Civita connection and the curvature tensors, which are
  native (Layer 7 consumes `TauCeti.riemannianVolume`, `TauCeti.HyperbolicMetric` and
  `TauCeti.hypVolume`); the DifferentialGeometry roadmap, 12.4, connects densities and form
  integration to that same measure, and the completed HopfRinow roadmap, Layer 1, owns the
  Levi-Civita connection, geodesics and the exponential map;
- distributions, involutivity, integral manifolds and the Frobenius theorem, which are the
  DifferentialGeometry roadmap's Layer 4 on the native `TauCeti.Foliation`;
- faces of manifolds with corners and the abstract boundary, which are the DifferentialGeometry
  roadmap's 5.5; this roadmap's gluing consumes those faces;
- the general Thom and Euler classes of oriented bundles of every rank, which are
  CharacteristicClasses C2; that roadmap compares its rank-two restriction with the standalone
  plane construction of 10.2, so the plane construction is owned here and consumes nothing of C2;
- the homological concordance invariants: `τ` and the bound `|τ(K)| ≤ g_s(K)` are
  CombinatorialHeegaardFloer Lane G, items 7 and 10, which consumes this roadmap's Layer 4 and is
  therefore never a supplier of it. The three Kirby problems whose resolutions rest on such
  invariants are outside this roadmap: Problem 1.41 (Piccirillo's non-slice Conway knot, through
  Rasmussen's `s`-invariant and the trace-equivalent knot, Piccirillo, *The Conway knot is not
  slice*, Proposition 1.4 and Theorem 1.5), Problem 1.53 (mutation and concordance, through the
  same pair) and Problem 1.31 (Levine's knot in a homology sphere, through Heegaard Floer
  invariants). No roadmap on main supplies `s`; a GeometricTopology Part II that consumes both this
  roadmap and CombinatorialHeegaardFloer is where they are stated;
- the classification of compact surfaces and the mapping class groups of surfaces: no roadmap on
  main supplies them, and nothing here needs them, since Heegaard splittings are defined through
  handlebodies and their boundary diffeomorphisms (9.1), not through abstract genus-`g` surfaces;
- Kirby's Problem 4.82 (a smooth structure on `(⋆ℝP⁴) # (⋆ℂP²)`), which Kirby's remarks record
  as unresolved; it is not a target.

Everything else that a layer uses and that exists at the pins is consumed under its native name,
listed in the supplier contracts below; nothing native is defined a second time.

## Conventions

- A manifold is a type with instances (`TopologicalSpace`, `ChartedSpace H M`,
  `IsManifold I n M`), never a bundled record; constructions (gluing, connected sum, filling)
  produce such a type with its instances, and are compared by diffeomorphisms `≃ₘ` or
  homeomorphisms `≃ₜ` in theorem statements. Named conditions (closed, orientable, hyperbolic,
  irreducible) are predicates or instances: `TauCeti.IsClosedConnectedManifold n M`,
  `TauCeti.IsCompactConnectedThreeManifold M`, `TauCeti.Orientable I n M`,
  `TauCeti.IsHyperbolic`, `TauCeti.IsSphereBoundsBall M`. Orientations, framings and base points
  are data carried as explicit arguments.
- Boundaryless manifolds use the model `𝓡 n = modelWithCornersEuclideanSelf n`; manifolds with
  boundary use the half-space model `𝓡∂ n = modelWithCornersEuclideanHalfSpace n`; corners use
  `modelWithCornersEuclideanQuadrant`. A closed manifold is compact without boundary; `Sⁿ` is
  `Metric.sphere (0 : EuclideanSpace ℝ (Fin (n + 1))) 1` with its analytic manifold structure,
  and `Dⁿ` is `Metric.closedBall (0 : EuclideanSpace ℝ (Fin n)) 1` with Tau Ceti's half-space
  charts.
- The circle is `Circle ⊆ ℂ`, oriented counterclockwise; a knot has no privileged type. The
  geometric presentation of an oriented knot in `M` is a smooth embedding
  `TauCeti.SmoothCircleEmbedding I M`, a link with `n` labelled components is
  `TauCeti.SmoothLinkEmbedding I M n`, and the unoriented presentation is the quotient
  `TauCeti.UnorientedSmoothCircleEmbedding I M` by reversal. Isotopy is defined once in general:
  `TauCeti.AmbientIsotopic` for continuous maps, `TauCeti.Diffeotopy` for smooth ambient
  isotopies, and the specialisations `TauCeti.SmoothLinkEmbedding.SmoothAmbientIsotopic`. The
  non-ambient `TauCeti.Isotopic` is never used for knot equivalence.
- Local flatness is `TauCeti.IsLocallyFlat F F' f`: ambient charts valued in `F × F'` carry the
  image onto `F × {0}`; the codimension is the choice of `F'`. For a knot in `S³` the model is
  `EuclideanSpace ℝ (Fin 1) × EuclideanSpace ℝ (Fin 2)`.
- Ambient `ℝ³` and `S³` carry their standard orientations. Crossing sign: a right-handed crossing
  counts `+1`; the writhe is the sum of the signs. Mirror negates every crossing; reverse flips the
  orientation. The Seifert framing is the longitude with linking number `0` with the knot; the
  blackboard framing of a diagram equals its writhe. In a braid word the letter `(i, +1)` is
  `σ_i`, and in the closure `TauCeti.BraidWord.closure` the strand entering on position `i` is the
  over-strand of a positive crossing.
- Alexander polynomial: the Conway normalisation `Δ(t) = Δ(t⁻¹)`, `Δ(1) = 1`, so that the sign is
  fixed; the right-handed trefoil has `Δ = t − 1 + t⁻¹` and the figure-eight `−t + 3 − t⁻¹`
  (`TauCeti.KnotTheory.alexander`, pinned by `alexander_trefoilSeifertMatrix` and
  `alexander_figureEightSeifertMatrix`). Jones polynomial: the writhe-normalised Kauffman bracket
  with `t^{1/2} = A⁻²`, `V(unknot) = 1`, the right-handed trefoil `t + t³ − t⁴`
  (`TauCeti.OrientedPDCode.jonesPolynomial`, `jonesPolynomial_rightHandedTrefoilPDCode`); mirroring
  substitutes `t⁻¹` for `t`. Signature: `σ(K) = signature(V + Vᵀ)` for a Seifert matrix `V`, so the
  right-handed trefoil has `σ = −2` and the figure-eight `σ = 0` (`Matrix.signature`,
  `signature_trefoilSeifertMatrix`); the Tristram–Levine form is `(1 − ω)V + (1 − ω̄)Vᵀ`
  (`TauCeti.KnotTheory.tristramLevineForm`), with `σ_ω` at a root of the Alexander polynomial
  defined as the average of the two one-sided limits and `σ_1 = 0`.
- Slopes on a torus `T` are primitive classes of `H₁(T; ℤ)` modulo sign (`TauCeti.Slope`); a
  framing `(μ, λ)` identifies them with `ℚ ∪ {∞}` by `p/q ↦ p·μ + q·λ`, the meridian being `∞`
  and the longitude `0` (`TauCeti.FramedBoundaryTorus.value`). Dehn filling along `s` glues the
  solid torus so that its meridian goes to `s`.
- Hyperbolic metrics have constant sectional curvature `−1` in Lee's curvature convention
  `R(w, u)v = κ(⟪u, v⟫w − ⟪w, v⟫u)` (`TauCeti.HyperbolicMetric`); volumes are
  `TauCeti.hypVolumeOfMetric` and, on closed connected manifolds of dimension at least three,
  `TauCeti.hypVolume`. The Weeks manifold has volume `0.9427…`.
- Cohomology is singular cohomology with integer coefficients unless stated; `⟨c, [S]⟩` is the
  evaluation of a degree-two class on the fundamental class of a closed oriented surface. The
  Thurston norm uses `χ₋(S) = Σ max(0, −χ(S_i))` over the components `S_i` of `S`.
- Simplicial complexes are Mathlib's `AbstractSimplicialComplex ι` and the singleton-free
  `PreAbstractSimplicialComplex ι`; the polyhedron `|K|` is `AbstractSimplicialComplex.Realization K`
  with the weak topology. Collapse removes free faces; a combinatorial `n`-sphere is a complex
  stellar equivalent to `∂Δⁿ⁺¹`, a combinatorial `n`-ball one stellar equivalent to `Δⁿ`.
- Kirby problems are cited as `[Kir97, Problem a.b]` with the numbering of the published list:
  Property P is 1.15, Property R is 1.16, the Akbulut–Kirby conjecture 1.19, Levine's problem 1.31,
  Alexander polynomial one 1.36, the shake genus 1.41, mutation 1.53, cosmetic surgery 1.81,
  geometrization 3.45, virtual fibering 3.51, minimal volume 3.60, `Diff(S⁴)` 4.34 (which asks
  about `S⁴`; Hatcher's `S³` theorem is the Smale conjecture proper), `Diff(D⁴, ∂)` 4.126, Zeeman
  5.2.

## Exact supplier contracts

### From Mathlib

- Manifolds: `ModelWithCorners`, `IsManifold`, `ChartedSpace`, `StructureGroupoid`,
  `Pregroupoid`, `Pregroupoid.groupoid`, `contDiffGroupoid`, `continuousGroupoid`, `HasGroupoid`;
  `ModelWithCorners.boundary`, `ModelWithCorners.interior`, `IsBoundaryPoint`, `IsInteriorPoint`;
  `modelWithCornersEuclideanHalfSpace`, `modelWithCornersEuclideanQuadrant`; `TangentBundle`,
  `TangentSpace`, `mfderiv`, `ContMDiff`, `ContMDiffMap`; `Diffeomorph` (`M ≃ₘ^n⟮I, I'⟯ M'`);
  `Manifold.IsSmoothEmbedding I J n f` and `Manifold.IsImmersion` (the chart normal form);
  the sphere `Metric.sphere` as an analytic manifold and `Circle` as a Lie group;
  `Matrix.orthogonalGroup (Fin n) ℝ`; `LieGroup`. (`analyticGroupoid` is not at the pin and is
  not used.)
- Topology: `Homeomorph`, `Topology.IsEmbedding`, `IsOpenEmbedding`, `IsClosedEmbedding`
  (`Mathlib/Topology/Defs/Induced.lean`), `OpenPartialHomeomorph`, `IsCoveringMap`, the
  one-point compactification `OnePoint ℚ`, `ContinuousMap.HomotopyEquiv`, `ContinuousMap.Homotopy`,
  `unitInterval`.
- Algebraic topology: `FundamentalGroup`, `HomotopyGroup` (`π_ n X x`), the singular homology
  functor `singularHomologyFunctor`, classical CW complexes `Topology.CWComplex` and
  `Topology.RelCWComplex`, `AbstractSimplicialComplex`, `PreAbstractSimplicialComplex`,
  `Geometry.SimplicialComplex`, the simplicial-set realization and `SSet.toTopHomeo`.
- Riemannian geometry: `Bundle.ContMDiffRiemannianMetric`, `RiemannianBundle`,
  `IsRiemannianManifold`, `riemannianEDist`, `EMetricSpace.ofRiemannianMetric`.
- Algebra: `Group.rank` (which needs `[Group.FG G]`), `Group.IsPerfect`, `commutator`,
  `LaurentPolynomial` (`R[T;T⁻¹]`), `Matrix.det`, `Quandle`, `PresentedMonoid`.

### From Tau Ceti

Every declaration below exists at the pinned Tau Ceti and is consumed as it stands.

- Layer 1: `TauCeti.isManifold_boundary` and `TauCeti.isSmoothEmbedding_subtypeVal_boundary`
  (`Geometry/Manifold/Boundary/Charts.lean`: the boundary of a `C^k` manifold over `𝓡∂ (n+1)` is a
  `C^k` manifold over `EuclideanSpace ℝ (Fin n)`, included by a closed smooth embedding);
  `TauCeti.IsProductCollarChart`, `TauCeti.exists_isProductCollarChart_of_mem_boundary` and
  `TauCeti.IsProductCollarChart.diffeomorphProd` (`Boundary/Collar/Local.lean`,
  `Boundary/Collar/Diffeomorph.lean`: smooth local collars); `TauCeti.IsCollar`,
  `TauCeti.IsCollared`, `TauCeti.IsLocallyCollared` and Brown's collaring theorem
  `TauCeti.IsLocallyCollared.isCollared` for a compact domain (`Boundary/Collar/Global.lean`,
  `Boundary/Collar/Brown.lean`); `TauCeti.IsTubularNeighborhood` and the Euclidean tubular
  neighbourhood theorem `TauCeti.exists_isTubularNeighborhood_normalBundle`
  (`TubularNeighborhood/Basic.lean`, `TubularNeighborhood/Euclidean.lean`); the normal spaces of
  `SmoothEmbedding/NormalSpace.lean`; `TauCeti.PLPregroupoid`, `TauCeti.PLGroupoid` and
  `TauCeti.PLGroupoid_le_continuousGroupoid` (`Geometry/Manifold/PLGroupoid.lean`);
  `TauCeti.Orientable I n M` (`Geometry/Manifold/Orientation.lean`); `TauCeti.SmoothEmbedding`
  (`SmoothEmbedding/Basic.lean`).
- Layer 2: `TauCeti.IsSliceChart`, `TauCeti.IsSliceEmbedding`, `TauCeti.IsLocallyFlat` with its
  closure API (`restrict`, `of_forall_exists_isOpen`, `homeomorph_comp`, `comp_homeomorph`,
  `isOpenEmbedding_comp`, `codRestrict`, `transHomeomorph`, `prodMap`, `comp` under its chart
  compatibility hypothesis, `isLocallyFlat_iff_isOpenEmbedding` in codimension zero,
  `isLocallyClosed_range`, `exists_isOpenEmbedding_prod`) in `Geometry/Manifold/LocallyFlat/Basic.lean`;
  `TauCeti.IsLocallyFlat.of_isSmoothEmbedding` and `TauCeti.SmoothEmbedding.isLocallyFlat`
  (`LocallyFlat/Smooth.lean`), `TauCeti.IsLocallyFlat.of_isSmoothEmbedding_of_preimage_boundary`
  for neat embeddings (`LocallyFlat/Neat.lean`), `TauCeti.SimplePolygon.isLocallyFlat_realize`
  (`LocallyFlat/Polygon.lean`); `TauCeti.IsBicollar`, `TauCeti.IsBicollared`,
  `TauCeti.IsLocallyBicollared`, `TauCeti.isLocallyFlat_iff_isEmbedding_and_isLocallyBicollared`
  (`LocallyFlat/Bicollar.lean`), `TauCeti.IsLocallyBicollaredWithSides.exists_isBicollar`
  (`LocallyFlat/TwoSided.lean`), `TauCeti.IsLocallyBicollared.isBicollared_of_not_isPreconnected_compl_range`
  (`LocallyFlat/Separation.lean`), `TauCeti.BrownBicollaring n` and its proof
  `TauCeti.brownBicollaring` (`LocallyFlat/Sphere.lean`, `LocallyFlat/Brown.lean`);
  `TauCeti.filledHull`, `TauCeti.CoboundAnnulus` and `TauCeti.AnnulusConjecture n`
  (`LocallyFlat/Annulus.lean`); `TauCeti.TopologicalConcordance` and
  `TauCeti.TopologicallyConcordant` (`LocallyFlat/Concordance/Basic.lean`).
- Layer 3: the group `TauCeti.Diff I M n` (`Geometry/Diffeomorphism/Group.lean`), the weak
  Whitney topology `Diffeomorph.weakWhitneyTopology` for compact `M` with
  `Diffeomorph.ofSmoothFamily`, `Diffeomorph.continuous_eval_const` and
  `Diffeomorph.t2Space_weakWhitney` (`Diffeomorphism/Topology.lean`; selected by
  `open scoped TauCeti.DiffeomorphWeakWhitney`), continuity of multiplication
  (`Diffeomorphism/Composition.lean`) and of inversion with the topological-group instance
  `Diffeomorph.isTopologicalGroup` (`Diffeomorphism/Inversion.lean`); `Diffeomorph.fixingSubgroup`
  and `TauCeti.RelativeDiff` with its closedness (`Diffeomorphism/FixingSubgroup/`);
  `TauCeti.DiscDiff n` and `TauCeti.WatanabeTheorem` (`Diffeomorphism/Disc.lean`);
  `TauCeti.orthogonalToDiffSphere`, `TauCeti.continuousOrthogonalToDiffSphere` and
  `TauCeti.SmaleConjecture` (`Diffeomorphism/Sphere.lean`, `Diffeomorphism/Smale.lean`);
  `TauCeti.Diffeotopy` (`Diffeomorphism/Diffeotopy/Basic.lean`); `TauCeti.AmbientIsotopy`,
  `TauCeti.AmbientIsotopic`, `TauCeti.Isotopic` (`Topology/Homotopy/Isotopy/Basic.lean`,
  `AmbientIsotopic/Basic.lean`).
- Layer 4: `TauCeti.SmoothCircleEmbedding`, `rotate`, `reverse`, `greatCircle`, `TauCeti.unknot`
  (`KnotTheory/SmoothCircle.lean`); `TauCeti.UnorientedSmoothCircleEmbedding`
  (`UnorientedSmoothCircle.lean`); `TauCeti.SmoothLinkEmbedding` with `relabel`, `reverse`,
  `transDiffeomorph`, `singletonEquiv` (`SmoothLink/Basic.lean`) and
  `SmoothLinkEmbedding.SmoothAmbientIsotopic` (`SmoothLink/Isotopy.lean`, `SmoothLink/AmbientIsotopy.lean`);
  `TauCeti.SmoothCircleEmbedding.KnotGroup` and `HasPerfectCommutatorSubgroup` (`KnotGroup.lean`);
  `TauCeti.BraidGroup n`, `TauCeti.BraidWord n`, `TauCeti.BraidWord.toBraid`
  (`GroupTheory/SpecificGroups/Braid/`), `TauCeti.BraidWord.closure : OrientedPDCode w.length`
  (`KnotTheory/BraidWord/PDCode.lean`), `TauCeti.BraidWord.ArtinEquiv` with Reidemeister-equivalent
  closures (`BraidWord/ArtinEquivalence.lean`); `TauCeti.MarkovBraid`, `TauCeti.IsMarkovMove`,
  `TauCeti.MarkovEquiv`, `MarkovBraid.componentCount` (`KnotTheory/Markov.lean`);
  `TauCeti.PDCode`, `TauCeti.OrientedPDCode`, `writhe`, `mirror`, `reverse`, `relabel`
  (`PDCode/Basic.lean`), `TauCeti.OrientedPDCode.IsReidemeisterMove` and `ReidemeisterEquiv`
  (`PDCode/Oriented/Reidemeister/Equivalence.lean`); `TauCeti.BasedOrientedGaussCode`,
  `FramedBasedOrientedGaussCode`, `BasedUnorientedGaussCode` (`GaussCode/`);
  `TauCeti.PDCode.kauffmanBracket`, `TauCeti.OrientedPDCode.normalizedKauffmanBracket`
  (`PDCode/Kauffman.lean`), `TauCeti.OrientedPDCode.jonesPolynomial` with its invariance
  `TauCeti.OrientedPDCode.ReidemeisterEquiv.jonesPolynomial_eq`, `jonesPolynomial_mirror`,
  `jonesPolynomial_reverse`, `jonesPolynomial_unknot` and
  `TauCeti.jonesPolynomial_rightHandedTrefoilPDCode` (`PDCode/Jones.lean`,
  `PDCode/Oriented/Reidemeister/Equivalence.lean`); `TauCeti.KnotTheory.alexander`,
  `alexanderMatrix`, `enlargeColumn`, `enlargeRow`, `invert_alexander`, `eval₂_one_alexander`,
  `alexander_congruence_of_det_sq_eq_one`, `trefoilSeifertMatrix`, `figureEightSeifertMatrix`
  (`KnotTheory/Alexander.lean`); `TauCeti.KnotTheory.IntegralSquareMatrix.SEquivalent`
  (`SeifertMatrix/SEquivalence.lean`); `TauCeti.OrientedPDCode.AlexanderModule`,
  `elementaryIdeal` and their Reidemeister invariance (`PDCode/Alexander/`);
  `TauCeti.burau`, `TauCeti.MarkovBraid.burauAlexander`,
  `TauCeti.MarkovEquiv.associated_burauAlexander`,
  `TauCeti.KnotTheory.associated_burauAlexander_alexander_trefoilSeifertMatrix` (`Burau/`);
  `TauCeti.jimbo`, the writhe-normalised Jones trace `TauCeti.MarkovBraid.jonesTrace` and its
  Markov invariance (`Jimbo/`, `TemperleyLieb.lean`); `TauCeti.homflySpecialization`
  (`Homfly/Specialization.lean`); `TauCeti.IsSmoothSliceDisc`, `TauCeti.IsSmoothlySlice`,
  `TauCeti.IsTopologicalSliceDisc`, `TauCeti.IsTopologicallySlice`,
  `TauCeti.IsSmoothlySlice.isTopologicallySlice`, `TauCeti.isSmoothlySlice_unknot`
  (`Slice/Basic.lean`); `TauCeti.SmoothSliceSurface`, `TauCeti.sliceGenus : ℕ∞`,
  `TauCeti.IsSmoothlySlice.sliceGenus_eq_zero` (`Slice/Genus.lean`);
  `TauCeti.FreedmanSliceTheorem` (`Slice/Freedman.lean`); `TauCeti.GridDiagram`, `GridLink`,
  `GridDiagram.MovesTo` (`Grid/Move/Basic.lean`).
- Layer 5: `TauCeti.SolidTorus`, `TauCeti.IsSolidTorusNeighborhood`,
  `TauCeti.exists_isSolidTorusNeighborhood` for `C²` circles in `ℝ³`,
  `IsSolidTorusNeighborhood.frontier_image` and `exteriorFrontierHomeomorph`
  (`LowDimTopology/SolidTorusNeighborhood/Basic.lean`); `TauCeti.IsPrimitive`, `TauCeti.Slope`,
  `TauCeti.slopeEquivStd`, `TauCeti.BoundaryTorus`, `TauCeti.FramedBoundaryTorus` with `meridian`,
  `longitude`, `value`, `slopeEquiv` (`LowDimTopology/DehnSurgery/Slope.lean`).
- Layer 6: `TauCeti.SmoothEmbedding.Concordance` with `refl`, `symm`, `trans`, `ofDiffeotopy`,
  `TauCeti.SmoothEmbedding.Concordant` and `Concordant.equivalence`
  (`SmoothEmbedding/Concordance.lean`); `TauCeti.TopologicallyConcordant` and
  `TauCeti.SmoothEmbedding.Concordant.exists_topologicallyConcordant`
  (`LocallyFlat/Concordance/`); `Matrix.signature` with `signature_trefoilSeifertMatrix`,
  `signature_figureEightSeifertMatrix`, `signature_enlargeColumn`, `signature_enlargeRow`
  (`LinearAlgebra/Matrix/Signature.lean`, `KnotTheory/Signature.lean`);
  `TauCeti.KnotTheory.tristramLevineForm`, `tristramLevineSignature`,
  `tristramLevineSignature_neg_one`, `tristramLevineSignature_one`,
  `tristramLevineSignature_congr`, `tristramLevineSignature_neg_transpose`,
  `tristramLevineSignature_fromBlocks_zero` and the enlargement invariance (`TristramLevine/`).
- Layer 7: `TauCeti.riemannianVolume` (`Riemannian/VolumeDensity/Volume.lean`);
  `TauCeti.HyperbolicMetric`, `TauCeti.IsHyperbolic` (`Riemannian/Hyperbolic.lean`);
  `TauCeti.hypVolumeOfMetric`, `TauCeti.hypVolume` (`Hyperbolic/Volume.lean`);
  `TauCeti.IsMostowRigid`, `TauCeti.MostowRigidity` (`Hyperbolic/Mostow.lean`);
  `TauCeti.HyperbolicMetric.HasFiniteVolume`, `TauCeti.IsFiniteVolumeHyperbolic`
  (`Hyperbolic/FiniteVolume.lean`); `TauCeti.MappingTorus`, `TauCeti.MappingTorusPresentation`,
  `TauCeti.FibersOverCircle` (`Topology/MappingTorus.lean`); `TauCeti.IsFiniteCover`
  (`Topology/Covering/IsFiniteCover.lean`); `TauCeti.IsVirtuallyFibered`
  (`Topology/VirtuallyFibered.lean`); `TauCeti.IsHakenSurfaceEmbedding`,
  `TauCeti.IsClosedHakenSurfaceEmbedding`, `TauCeti.IsPossiblyNonorientableClosedHakenThreeManifold`
  (`Geometry/Manifold/Haken.lean`); `TauCeti.IsVirtuallyHaken` and
  `TauCeti.VirtualHakenConjecture` (`Geometry/Manifold/VirtuallyHaken.lean`,
  `Riemannian/Hyperbolic/VirtualHaken.lean`).
- Layer 8: `TauCeti.ModelGeometry` with its eight constructors and `ModelGeometry.Space`
  (`Riemannian/ModelGeometry/Basic.lean`), `TauCeti.HasGeometricStructure M G`
  (`Riemannian/GeometricStructure/Basic.lean`); `TauCeti.IsSphereBoundsBall`
  (`Geometry/Manifold/Irreducible.lean`); `TauCeti.IsIncompressible`
  (`AlgebraicTopology/FundamentalGroup/Incompressible.lean`),
  `TauCeti.IsClosedIncompressibleSurfaceEmbedding` (`Geometry/Manifold/Incompressible.lean`);
  `TauCeti.SolidTorus.fiberSetoid`, `TauCeti.IsSeifertFibration`, `TauCeti.IsSeifertFibered`
  (`LowDimTopology/SeifertFibration.lean`); `TauCeti.IsPeripheralTorus`, `TauCeti.IsAtoroidal`,
  `TauCeti.IsTorusDecomposition`, `TauCeti.IsJSJDecomposition`, `TauCeti.JSJTheorem`
  (`LowDimTopology/JSJDecomposition.lean`); `TauCeti.IsGeometricTorusDecomposition`,
  `TauCeti.GeometrizationConjecture` (`LowDimTopology/Geometrization.lean`).
- Layer 10: `TauCeti.Foliation I n M k` and `Foliation.ofSubmodule` (`Foliation/Basic.lean`), the
  distribution interfaces `TauCeti.IsContMDiffDistribution`, `TauCeti.IsInvolutiveDistribution`
  (`Geometry/Manifold/Distribution.lean`).
- Layer 11: `AbstractSimplicialComplex.Realization`, `faceInclusion`, `carrier`, `vertex`,
  `realizationMap` for inclusions (`SimplicialComplex/Realization/Basic.lean`);
  `PreAbstractSimplicialComplex.SimplicialMap` (`SimplicialComplex/Maps.lean`) and
  `SimplicialMap.realizationMap`, `realizationHomeomorph` (`Realization/Map.lean`);
  compactness of finite realizations and the closed coordinate embedding (`Realization/Finite.lean`),
  local compactness for finite vertex stars (`Realization/LocallyFinite.lean`), subcomplexes as
  closed embeddings (`Realization/Subcomplex.lean`), glued homotopies (`Realization/Homotopy.lean`);
  `PreAbstractSimplicialComplex.link` (`SimplicialComplex/LinkStar.lean`);
  `AbstractSimplicialComplex.orderedProd`, `orderedCylinder` (`SimplicialComplex/Product.lean`);
  `PreAbstractSimplicialComplex.ElementaryCollapsesTo`, `CollapsesTo`, `Collapsible`
  (`SimplicialComplex/ElementaryCollapse.lean`, `Collapse/Basic.lean`), the collapse of cones and
  cylinders of cones (`Collapse/Cone.lean`, `Collapse/Cylinder.lean`);
  `PreAbstractSimplicialComplex.IsCombinatorialBall`, `IsCombinatorialSphere`,
  `IsCombinatorialManifold` with its dimension-zero case (`CombinatorialManifold/Basic.lean`);
  `realizationStandardSuccSimplexBoundaryHomeomorphSphere n : |∂Δⁿ⁺¹| ≃ₜ Sⁿ`
  (`Simplex/BoundarySphere.lean`); `AbstractSimplicialComplex.Contractible2Complex` and
  `TauCeti.ZeemanConjecture` (`SimplicialComplex/Zeeman.lean`); `TauCeti.IsTriangulable`
  (`Topology/Triangulable.lean`); `TauCeti.FiniteCWType` (`Topology/CWComplex/Classical/FiniteCWType.lean`);
  `TauCeti.IsClosedConnectedManifold n M`, `TauCeti.IsCompactConnectedThreeManifold`
  (`Geometry/Manifold/Basic.lean`).

### From roadmaps on main

- DifferentialGeometry 5.5: the faces of a manifold with corners and the abstract boundary along
  which 1.2 glues; Layer 4: distributions, involutivity, the Frobenius theorem and the leaves of a
  foliation, consumed by 10.1; 12.4: the comparison of `TauCeti.riemannianVolume` with densities and
  form integration, consumed by 7.1 for the statement that the hyperbolic volume form integrates to
  the volume.
- HopfRinow (completed) Layer 1: the Levi-Civita connection, geodesics and the exponential map;
  Layer 4: Riemannian isometries and the transport of the connection along them, consumed by 7.2.
- AlgebraicTopology: singular homology and cohomology of CW complexes, fundamental classes, cup
  products, the cellular chain complex and its comparison with singular homology, consumed by
  10.2, 10.3 and 11.2; DifferentialGeometry's degree of a smooth map of closed oriented manifolds,
  consumed by 3.1.
- CharacteristicClasses: nothing is consumed; C2 compares its rank-two Euler class with 10.2.
- CombinatorialHeegaardFloer: nothing is consumed; Lane K consumes Layer 4 and Lane G consumes 6.3.

## How to read the build

Layer 1 is the spine: it completes the collar theorem on the native local collars, builds gluing
along faces, handle attachment, tubular neighbourhoods in manifolds and the connected sum, and
records the native PL groupoid. Layer 2 extends the native locally flat embedding theory to
boundaries and to the global collaring and annulus theorems. Layer 3 finishes the native weak
Whitney topology into a topological group with its relative and orientation-preserving subgroups
and states the three diffeomorphism-group theorems. Layer 4 builds knot theory on the native
presentations and proves the correspondence and agreement theorems between them; Layer 5 builds
exteriors and Dehn surgery on Layer 1's gluing and Layer 4's presentations; Layer 6 builds the
concordance group on the native concordance relations and Layer 4's Seifert matrices. Layers 7 and
8 share the Riemannian substrate: Layer 7 adds the Weeks manifold and the Agol statements on the
native hyperbolic carriers, Layer 8 adds the prime decomposition and the Thurston-geometry form of
geometrization on the native decomposition carriers. Layer 9 needs Layers 1 and 3; Layer 10 needs
the native foliations and Layer 2's surfaces; Layer 11 extends the native polyhedra and Layer 12
compares the structures of Layers 1 and 11. Every layer ends with its examples and dependencies,
and `Suggested.lean` states the end theorems that are statable at the pins: Smale, Watanabe, the
annulus theorem, Markov, Freedman, Mostow, Agol (both forms), the JSJ theorem, geometrization and
Manolescu.

## Layer 1: manifold-library buildout (general dimension, general structure group)

### 1.1 Boundaries and the collar theorem

Consume the native boundary manifold `TauCeti.isManifold_boundary` and the native smooth local
collars: every boundary point `p` of a `C^k` manifold `M` over `𝓡∂ (n + 1)`, `k ≠ 0`, has a product
collar chart (`TauCeti.exists_isProductCollarChart_of_mem_boundary`), whose source is `C^k`
diffeomorphic to `V × [0, ε)` for an open `V ⊆ ∂M` with the boundary as the zero slice
(`TauCeti.IsProductCollarChart.diffeomorphProd`). Prove the **smooth collar theorem**: for `M`
with compact boundary, there is an open embedding `c : ∂M × [0, 1) → M`, `C^k` in the sense of
manifolds with boundary, with `c(x, 0) = x` (Hirsch, *Differential Topology*, Theorem 6.1; Lee,
*Introduction to Smooth Manifolds*, 2nd ed., Theorem 9.25). The route patches the local product
collars with a partition of unity along `∂M` and an inward-pointing vector field; the topological
statement is already the native Brown theorem `TauCeti.IsLocallyCollared.isCollared`, so what is
proved here is that the patched collar is smooth, and that a smooth collar is a topological collar
(`TauCeti.IsCollar`). Extend to paracompact `∂M` by a locally finite cover. Prove uniqueness of
collars up to diffeotopy fixing `∂M` (Hirsch, Chapter 4, Section 6): two smooth collars are carried onto
each other by a diffeotopy of `M` that is the identity on the boundary and outside a neighbourhood
of it.

- A smooth collar is a diffeomorphism of `∂M × [0, 1)` onto an open neighbourhood of `∂M` fixing
  the boundary pointwise; its underlying map satisfies `TauCeti.IsCollar`.
- Uniqueness: for collars `c, c'` there is a diffeotopy `Φ` of `M` relative to `∂M` with
  `Φ.final ∘ c = c'` on `∂M × [0, 1/2)`.
- A manifold with compact boundary is diffeomorphic to its own interior union a collar, so `M` is
  diffeomorphic to `M ∪_{∂M} (∂M × [0, 1])`; a `C^k` manifold with boundary has a boundaryless
  `C^k` manifold as interior.

**Checks.**

- The closed interval `[0, 1]` with its half-space charts has the collar `(0, t) ↦ t`,
  `(1, t) ↦ 1 − t` on `{0, 1} × [0, 1/2)`; the map `(x, t) ↦ x + t` on `{0, 1} × [0, 1)` is not a
  collar, since it leaves `[0, 1]` at `x = 1`.
- The closed disc `D²` has the radial collar `(θ, t) ↦ (1 − t/2)e^{iθ}`; the map
  `(θ, t) ↦ (1 − t²)e^{iθ}` is a topological collar but not a smooth one at `t = 0`, since its
  normal derivative vanishes there; the definition asks for a diffeomorphism onto its image, so it
  excludes this map.
- The half-open interval `[0, ∞)` is its own collar `(0, t) ↦ t`; the open interval `(0, 1)` has
  empty boundary and the empty collar.
- The compact hypothesis is used only for finiteness of the cover: the manifold `[0, ∞) × ℝ` has
  non-compact boundary and the collar `((0, y), t) ↦ (t, y)`.

### 1.2 Gluing along faces and handle attachment

Define the gluing `M ∪_f N` of two `C^k` manifolds with corners along a diffeomorphism
`f : A ≃ₘ B` between codimension-zero submanifolds with corners `A ⊆ ∂M` and `B ⊆ ∂N` that are
unions of faces in the sense of DifferentialGeometry 5.5: the carrier is the quotient of `M ⊔ N` by
`a ∼ f(a)`, the charts near the seam are built from the collars of 1.1 on each side (Hirsch,
Theorem 6.1 and the discussion of gluing in Chapter 8, Section 2), and the result has corners along `∂A`.
Full-boundary gluing is the case `A = ∂M`, `B = ∂N`. Prove that the gluing is well defined up to
diffeomorphism: changing `f` by a diffeotopy of `B`, or changing the collars, gives diffeomorphic
results (Hirsch, Chapter 8, Section 2, the smoothing of a glued manifold). Define **handle
attachment**: for an embedding `φ : S^{k−1} × D^{n−k} → ∂M`, the manifold
`M ∪_φ (D^k × D^{n−k})`, with corners along `S^{k−1} × S^{n−k−1}` rounded by the collar
(Milnor, *Lectures on the h-cobordism Theorem*, Section 3; Gompf–Stipsicz, *4-Manifolds and Kirby
Calculus*, Section 4.1). Prove that the diffeomorphism type depends only on the isotopy class of `φ` and
that attaching handles commutes with disjoint attachments.

- `M ∪_f N` is a `C^k` manifold with corners containing `M` and `N` as closed submanifolds with
  corners whose intersection is the seam `A ≅ B`.
- The seam has a bicollar `A × (−1, 1) → M ∪_f N` restricting to the collars of `M` and `N`.
- Gluing is associative and commutative up to diffeomorphism, and a diffeomorphism of pairs
  `(M, A) → (M', A')` compatible with `f, f'` induces a diffeomorphism of gluings.
- Handle attachment along isotopic attaching maps gives diffeomorphic manifolds; a `0`-handle is a
  disjoint ball and an `n`-handle caps a boundary sphere.

**Checks.**

- Two closed discs glued along the identity of their boundary circles give `S²`; glued along a
  reflection they give `S²` as well, and the gluing of `D²` to `D²` along a proper arc of the
  boundary gives a disc with corners at the two ends of the arc.
- `S¹ × D²` glued to `S¹ × D²` along the identity of the boundary torus gives `S¹ × S²`; glued
  along the map exchanging the two circle factors it gives `S³` (the genus-one Heegaard splitting
  of 9.1). The two results have `H₁ = ℤ` and `0`, so the gluing map is not a free choice.
- Attaching a `1`-handle to `D³` along two disjoint discs in `S²` gives the solid torus when the
  attaching map preserves orientation and the non-orientable disc bundle over `S¹` when it
  reverses it; both are handlebodies of genus one in the sense of 9.1.
- Attaching a `2`-handle to `D⁴` along the unknot with framing `0` gives `S² × D²`, whose boundary
  is `S² × S¹`; along the unknot with framing `±1` it gives the disc bundle of Euler number `±1`,
  whose boundary is `S³`. The framing is part of the attaching map `S¹ × D² → S³`.

### 1.3 Tubular neighbourhoods

Consume the native Euclidean tubular neighbourhood theorem
`TauCeti.exists_isTubularNeighborhood_normalBundle` (a compact `C²` submanifold of a Euclidean
space has an open neighbourhood identified with a neighbourhood of the zero section of its normal
bundle, in the sense of `TauCeti.IsTubularNeighborhood`) and the intrinsic normal spaces of
`SmoothEmbedding/NormalSpace.lean`. Prove the **tubular neighbourhood theorem in a manifold**: for
a `C^k` embedding `f : N → M`, `k ≥ 2`, of a compact manifold `N` into a boundaryless manifold
`M`, with a Riemannian metric on `M`, the normal exponential map is a diffeomorphism from the
normal vectors of length less than some `ε > 0` onto an open neighbourhood of `f(N)`, and the
resulting data satisfy `TauCeti.IsTubularNeighborhood` (Hirsch, Theorem 6.3; Lee, Theorem 6.24).
Prove uniqueness up to isotopy of tubular neighbourhoods (Hirsch, Theorem 6.5) and the sphere- and
disc-bundle versions: the closed `ε`-tube is a compact manifold with boundary the sphere bundle,
and its complement in `M` is a compact manifold with boundary when `M` is compact. This is the
surgery interface of Layer 5 and the normal-bundle interface that GeneralizedCohomology G5,
TopologicalKTheory T5 and PositiveScalarCurvature Layer 3 consume.

- The tube is a vector bundle neighbourhood: fibrewise star-shaped, with `f` the zero section,
  open in `M`.
- Two tubular neighbourhoods of the same embedding are isotopic through tubular neighbourhoods by
  a diffeotopy of `M` fixing `f(N)`.
- For `N` a point the tube is a coordinate ball; for `f` the inclusion of a closed codimension-zero
  submanifold the tube is `N` itself.

**Checks.**

- The unit circle in `ℝ²` has the tube `{1/2 < |z| < 3/2}` under `(θ, r) ↦ (1 + r)e^{iθ}`; the
  map `(θ, r) ↦ (1 + r)e^{i(θ + r)}` is a diffeomorphism onto the same annulus which is not a
  tubular neighbourhood for the metric normal bundle, since its fibres are not normal segments;
  it is one for a different bundle identification, which is why the definition carries the
  identification as data.
- A circle in `ℝ³` has a solid-torus tube (`TauCeti.exists_isSolidTorusNeighborhood`, 5.1); the
  `ε` must shrink along a thin knotted circle, so `ε` depends on the embedding and not only on `N`.
- The embedding `ℝ → ℝ²`, `t ↦ (t, 0)`, of a non-compact submanifold admits no tube of constant
  width in general (take `t ↦ (t, e^{−t²})` close by); the theorem is stated for compact `N`, and
  the non-compact version uses a positive continuous width function.

### 1.4 Connected sum

Define the **connected sum** on explicit data: oriented connected `n`-manifolds `M, N` (through
`TauCeti.Orientable` with chosen oriented atlases), smooth embeddings `e₁ : Dⁿ → M` and
`e₂ : Dⁿ → N` with `e₁` orientation-preserving and `e₂` orientation-reversing; `M # N` is
`(M ∖ e₁(int Dⁿ)) ∪ (N ∖ e₂(int Dⁿ))` glued along the boundary spheres by `e₂ ∘ e₁⁻¹`, through
1.2. Prove **independence of the balls**: by the disc theorem (Palais, *Extending diffeomorphisms*,
Proc. AMS 11 (1960), Theorem B; Hirsch, Chapter 8, Theorem 3.1) any two orientation-preserving
embeddings of `Dⁿ` into a connected oriented manifold are ambient isotopic, so the connected sum
is well defined up to orientation-preserving diffeomorphism. Prove the identities `M # Sⁿ ≅ M`,
commutativity and associativity, and the formulas `π₁(M # N) ≅ π₁(M) * π₁(N)` for `n ≥ 3` (van
Kampen with the sphere simply connected) and `χ(M # N) = χ(M) + χ(N) − χ(Sⁿ)`.

- `M # N` is a connected oriented `n`-manifold; it is closed when `M` and `N` are.
- Independence: `connectedSum e₁ e₂ ≅ connectedSum e₁' e₂'` for any two admissible pairs.
- `M # Sⁿ ≅ M`; `M # N ≅ N # M`; `(M # N) # P ≅ M # (N # P)`.

**Checks.**

- `S² # S² ≅ S²` and `T² # T²` is the genus-two surface with `χ = −2 = 0 + 0 − 2`.
- `ℝP² # ℝP²` is the Klein bottle, so the orientability hypothesis is a hypothesis of the
  well-definedness theorem only: the construction with an orientation-preserving `e₂` instead of
  an orientation-reversing one gives, for `M = N = ℂP²`, the manifold `ℂP² # ℂP²` with
  intersection form `⟨1⟩ ⊕ ⟨1⟩` rather than `ℂP² # ℂP²‾` with form `⟨1⟩ ⊕ ⟨−1⟩`; these have
  different signatures `2` and `0`, so the orientation condition on `e₂` is not cosmetic.
- `π₁(L(2, 1) # L(3, 1)) ≅ C₂ * C₃`, with two prime factors; uniqueness of the factorisation is
  8.2, not a consequence of this section.
- The connected sum of `M` with itself along the same ball on both sides is not a special case:
  `e₁` and `e₂` must have disjoint images when `M = N`, which the definition on two manifolds
  enforces by construction.

### 1.5 The PL structure groupoid

Consume `TauCeti.PLPregroupoid I` (maps of the model `H` that are piecewise linear read through
`I`, on every model with corners) and `TauCeti.PLGroupoid I` with the forgetful inclusion
`TauCeti.PLGroupoid_le_continuousGroupoid`; a PL manifold is `HasGroupoid M (PLGroupoid I)`. The
predicate is local and locally finite, so restriction to opens and composition hold (Rourke–Sanderson,
*Introduction to Piecewise-Linear Topology*, Chapters 1–2). Prove that a PL homeomorphism between
open subsets of `ℝⁿ` is PL on every compact subset after a subdivision, and that the realization
of a simplicial isomorphism is a PL map (11.1). There is no inclusion of `contDiffGroupoid` into
`PLGroupoid`: a smooth transition map is not piecewise affine, and the comparison is Layer 12.

- `PLGroupoid I ≤ continuousGroupoid H`, so every PL manifold is a topological manifold.
- The groupoid is closed under restriction, so open subsets of PL manifolds are PL manifolds.
- The doubling map `TauCeti.doubleRight` of `ℝ` is PL and not affine, so the groupoid is larger
  than the affine one.

**Checks.**

- `x ↦ 2x` on `ℝ` is affine, hence PL; `x ↦ |x|` is PL on `ℝ` but not a homeomorphism, so not in
  the groupoid; `x ↦ x³` is a homeomorphism that is not PL, since no neighbourhood of `0` is
  covered by finitely many affine pieces on which it is affine.
- The identity of an open set is PL (`TauCeti.ofSet_mem_PLGroupoid`); the piecewise affine
  homeomorphism of `ℝ` with infinitely many breakpoints `1/n` is PL on `(0, ∞)` and on `(−∞, 0)`
  but not near `0`, so "locally finite" is the right finiteness.
- The half-space model: the map of `[0, ∞)` that is the identity on `[0, 1]` and doubles on
  `[1, ∞)` is in `PLGroupoid (𝓡∂ 1)`, so PL manifolds with boundary come from the same definition.

### Examples

`S³` as two solid tori glued along the boundary torus (1.2); `S^n # S^n ≅ S^n` (1.4); the collar
of the closed disc (1.1); the solid-torus tube of a circle in `ℝ³` (1.3); `TauCeti.doubleRight`
as a PL non-affine chart change (1.5).

### Dependencies

Mathlib's manifolds with corners and `Diffeomorph`; the native boundary manifold, local collars,
Brown's collaring theorem, tubular neighbourhoods and PL groupoid listed in the supplier contracts;
DifferentialGeometry 5.5 for the faces of a manifold with corners. Nothing in this layer depends on
a later layer.

## Layer 2: locally flat embeddings in general dimension

### 2.1 Local flatness and its boundary variants

Consume `TauCeti.IsLocallyFlat F F' f` for a topological embedding `f : N → M` into a space
charted on `F × F'`, with its native closure API (restriction, locality, invariance under
homeomorphisms and open embeddings on either side, change of complementary model, products,
composition under the chart-compatibility hypothesis, and local product neighbourhoods). The
native predicate is boundaryless: a slice chart carries the image onto the full slice `F × {0}`.
Define the three variants used with boundaries: **boundaryless** local flatness (the native
predicate, `M` and `N` boundaryless); **boundary-disjoint** local flatness, the native predicate
for an embedding whose image lies in the interior of `M` (`N` boundaryless, `M` with boundary),
through `TauCeti.IsLocallyFlat.codRestrict` into the open interior; and **neat** local flatness,
`TauCeti.IsLocallyFlat (EuclideanHalfSpace k) F' f` for `f : N → M` with `f⁻¹(∂M) = ∂N`, where the
tangential model is the half-space, as in the native `LocallyFlat/Neat.lean`. Prove that the
three agree on their common domain (a neat embedding of a boundaryless `N` is boundary-disjoint
and the two predicates coincide) and that each is invariant under the maps of the native API.

- A neat locally flat embedding meets `∂M` transversally in `∂N` and has a half-space slice chart
  at every boundary point.
- The full-slice predicate fails for every map of a manifold with nonempty boundary: the punctured
  image germ of a boundary point has one component while a punctured full slice has two.
- Local flatness is a local property of the domain for all three variants.

**Checks.**

- The inclusion `[0, ∞) → ℝ` is neat locally flat with tangential model `EuclideanHalfSpace 1`
  and complementary model `0`; it is not locally flat for the full-slice predicate with any model,
  which is why the boundaryless predicate cannot be used for a slice disc
  (`TauCeti.IsTopologicalSliceDisc` uses the half-plane model).
- In the closed half-plane `{y ≥ 0}` the ray `{(0, t) : t ≥ 0}` is neatly embedded: it meets the
  boundary line exactly in its own endpoint, and the chart `(x, y) ↦ (y, x)` is a half-space slice
  chart. The ray `{(t, 0) : t ≥ 0}` along the boundary line is not neat, since the preimage of the
  ambient boundary is the whole ray while the boundary of the ray is one point; it is also not
  locally flat for the boundary-disjoint variant, since its image is not in the interior. So the
  three variants are different predicates on the same space.
- A circle in the interior of `D³` is boundary-disjoint locally flat; the Alexander horned sphere
  in `S³` is a topological embedding that is locally flat in no variant, since its complement is
  not simply connected near the wild points while a slice chart would give it a local product
  neighbourhood (`TauCeti.IsLocallyFlat.exists_isOpenEmbedding_prod`).

### 2.2 Smooth, neat and polygonal embeddings are locally flat; PL embeddings need not be

Consume `TauCeti.IsLocallyFlat.of_isSmoothEmbedding` (a `C^n` embedding into a boundaryless
manifold, `n ≠ 0`, is locally flat with complementary model the complement of the immersion),
`TauCeti.IsLocallyFlat.of_isSmoothEmbedding_of_preimage_boundary` (a neat `C^n` embedding of
half-space manifolds is locally flat with half-space tangential model) and
`TauCeti.SimplePolygon.isLocallyFlat_realize` (a simple closed polygon in `ℝ^{m+1}` is locally flat
with complementary model `ℝ^m`). State and prove that a **PL embedding of a manifold of dimension at
least two need not be locally flat in codimension two**: the cone on a polygonal right-handed
trefoil in `S³ = ∂D⁴` is a PL embedded disc in `D⁴` whose cone point has no slice chart, since
the fundamental group of the complement of the disc in a small ball around the cone point is the
trefoil group, which is non-abelian, while a slice chart would make it `ℤ` (Rourke–Sanderson,
Chapter 3, the discussion of links of points of polyhedra; Burde–Zieschang, *Knots*, Chapter 1,
Definition 1.3 for tame knots). State the positive PL statement: a PL embedding `N → M` is locally
flat exactly when the link of every point of `f(N)` in `M` is the standard sphere pair, and this
holds for all PL embeddings in codimension at most one and at least three (Rourke–Sanderson,
Chapter 3).

- Smooth embeddings between boundaryless manifolds are locally flat; neat smooth embeddings are
  neatly locally flat; polygonal knots in `ℝ³` are locally flat with model `ℝ × ℝ²`.
- The cone on a knotted polygon is PL embedded and not locally flat at the cone point.
- A PL embedding of a curve (dimension one) is locally flat (the polygon theorem), so the failure
  starts in dimension two.

**Checks.**

- The cone on an unknotted polygonal circle in `S³` is a PL disc in `D⁴` that is locally flat at
  the cone point: the link of the cone point is the unknotted pair `(S³, S¹)`, whose complement has
  fundamental group `ℤ`, and a PL homeomorphism of pairs with the standard pair gives the slice
  chart.
- The cone on the trefoil: the complement of the cone on `K` in the open cone on `S³`, near the
  apex, deformation retracts onto `S³ ∖ K`, so its fundamental group is the trefoil group
  `⟨x, y | x² = y³⟩`, which is non-abelian (it surjects onto `S₃`); a slice chart would give the
  complement of `ℝ² × {0}` in `ℝ⁴`, with fundamental group `ℤ`.
- The smooth embedding `t ↦ (t, t³)` of `ℝ` in `ℝ²` is locally flat; the topological embedding
  `t ↦ t − sin t` of the circle into itself composed with any smooth knot is a topological
  embedding whose derivative vanishes at one point, and it is locally flat (its image is the same
  smooth circle), so local flatness is a property of the image and not of the parametrisation.

### 2.3 Collaring and bicollaring

Consume the native codimension-one theory: a locally flat embedding with one-dimensional
complementary model is locally bicollared, and a locally bicollared embedding of a space charted
on `F` is locally flat (`TauCeti.isLocallyFlat_iff_isEmbedding_and_isLocallyBicollared`); Brown's
bicollaring theorem for two-sided embeddings of compact spaces into Hausdorff spaces
(`TauCeti.IsLocallyBicollaredWithSides.exists_isBicollar`); its sphere case `TauCeti.BrownBicollaring n`
proved as `TauCeti.brownBicollaring` for every `n`, through Jordan–Brouwer separation; and the
collar theorem for compact boundaries `TauCeti.IsLocallyCollared.isCollared`. Prove the remaining
general statements of Brown, *Locally flat imbeddings of topological manifolds*, Ann. of Math. 75
(1962), Theorems 1 and 2: a locally flat embedding of a closed `(n−1)`-manifold `N` into an
`n`-manifold `M` whose image separates `M` into two components is bicollared, and the boundary of
every topological manifold with compact boundary is collared (the topological collar theorem).

- A locally flat separating closed hypersurface is bicollared, with the two sides of the collar in
  the two complementary components.
- The boundary of a topological manifold with compact boundary has a collar `∂M × [0, 1) → M`.
- A locally flat `(n−1)`-sphere in `Sⁿ` is bicollared, in every dimension including `n = 1`.

**Checks.**

- The core circle of an open Möbius band is locally bicollared and not bicollared: it does not
  separate, and the two sides of a local bicollar are exchanged along the band, so the separating
  hypothesis is needed.
- A round `S¹` in `S²` is bicollared by `(θ, t) ↦ (cos θ cos t, sin θ cos t, sin t)` for
  `|t| < π/4`; the Alexander horned sphere in `S³` separates `S³` and is not bicollared, so local
  flatness is a hypothesis and not a consequence of separation.
- For `n = 0`, two points in `S¹` are bicollared by two disjoint arcs (`TauCeti.brownBicollaring 0`
  through `LocallyFlat/Finite.lean`), so the theorem has no connectedness hypothesis on the sphere.

### 2.4 The annulus theorem

Consume `TauCeti.AnnulusConjecture n`: two locally flat `n`-spheres `f, g` in `ℝⁿ⁺¹` with the
image of `g` in the open region bounded by `f` cobound an annulus, the closed region
`filledHull (range f) ∖ (filledHull (range g) ∖ range g)` being the image of an embedding of
`Sⁿ × [0, 1]` with the two ends on the two spheres (`TauCeti.CoboundAnnulus`). The round case is
native (`TauCeti.coboundAnnulus_smul_coe_sphere`). The **annulus theorem** states
`∀ n, TauCeti.AnnulusConjecture n`: Kirby, *Stable homeomorphisms and the annulus conjecture*,
Ann. of Math. 89 (1969), for `n + 1 ≥ 5`; Quinn, *Ends of maps III*, J. Differential Geom. 17
(1982), for `n + 1 = 4`; Moise's and Radó's theorems for `n + 1 ≤ 3`. The route in dimension at
least five is Kirby's torus trick, through the stable homeomorphism theorem; record it as the
intended proof, with the companion notion of a locally flat submanifold with a topological normal
bundle (Kirby–Siebenmann, *Foundational Essays*, Essay IV) named as the dependency that Layer 5's
topological surgery would need and that this roadmap does not build.

- The region between the spheres is a product; its two boundary components are the two spheres.
- The theorem is stated with the bounded region read off `TauCeti.filledHull`, so no separation
  theorem is assumed in the statement.
- The statement is false without local flatness: an Alexander horned sphere inside a round sphere
  does not cobound an annulus, since the region between them is not simply connected.

**Checks.**

- Two concentric round spheres of radii `r < R` cobound the annulus `{r ≤ |x| ≤ R}`, parametrised
  by `(u, t) ↦ (R − (R − r)t)u`; with `r = R` the hypothesis `range g ⊆ filledHull (range f) ∖ range f`
  fails, and the conclusion is false (the region is a sphere, not an annulus).
- For `n = 0` the theorem says that two points inside an interval `[a, b] ⊆ ℝ`, one pair nested in
  the other, cobound two disjoint closed intervals, which is true; the statement is stated for all
  `n`.
- The boundary of a thin tube around a knotted arc in `D³` is a smoothly, hence locally flatly,
  embedded `2`-sphere which is not round; the theorem says that it cobounds an annulus with a
  large round sphere, although the statement provides no isotopy of `ℝ³` carrying it to a round
  sphere. The region it bounds is a ball (the Schoenflies theorem), which the annulus theorem
  neither assumes nor concludes.

### Examples

The Alexander horned sphere as the standing negative control (2.1, 2.3, 2.4); the cone on the
trefoil as the PL negative control (2.2); concentric spheres as the positive control of the annulus
theorem (2.4).

### Dependencies

Layer 1 for the structure groups and collars; the native locally flat, bicollar, collar and
annulus declarations of the supplier contracts; Mathlib's `IsEmbedding` API. The annulus theorem
is a stated target whose proof route names Kirby's stable homeomorphism theorem and Kirby–Siebenmann
normal bundles, which no layer of this roadmap builds.
## Layer 3: diffeomorphism groups with the C^∞ topology

### 3.1 The group, its weak Whitney topology and the relative subgroups

Consume the native group `TauCeti.Diff I M n` of `Cⁿ` self-diffeomorphisms (multiplication is
composition, `f * g = f ∘ g`), the weak Whitney topology on `M ≃ₘ^n⟮I, I⟯ M` for compact `M`
(`Diffeomorph.weakWhitneyTopology`, induced from the chart-derivative topology on `C^n⟮I, M; I, M⟯`,
Hirsch, Chapter 2, Section 1, where for compact source the weak and strong topologies agree), continuity
of evaluation and Hausdorffness, continuity of composition and of inversion with the resulting
topological-group instance `Diffeomorph.isTopologicalGroup`, and the relative subgroup
`TauCeti.RelativeDiff I M n s` of diffeomorphisms fixing a set `s` pointwise, closed for the weak
Whitney topology and a topological group when the model is locally compact. Everything in this
layer is stated for compact `M`; the choice of topology on `Diff` of a non-compact manifold is not
made in this roadmap. Define the **orientation-preserving subgroup** `Diff⁺(M)` of a closed
oriented manifold as the kernel of the degree homomorphism `Diff(M) → {±1}` (the degree of a smooth map
of closed oriented manifolds is DifferentialGeometry's), prove that it is open and closed of index
at most two, and that `Diff⁺(M)` is the subgroup of diffeomorphisms preserving the orientation
of a chosen oriented atlas. Define `Diff(M, ∂M)` as `TauCeti.RelativeDiff I M ∞ (I.boundary M)`
for `M` with boundary; `TauCeti.DiscDiff n` is the case of the closed ball.

- `Diff(M)` is a Hausdorff topological group for compact `M`; `Diff(M, ∂M)` and `Diff⁺(M)` are
  closed subgroups and topological groups.
- Evaluation `Diff(M) → M` at a point is continuous, so the orbit map of the tautological action
  (`Diffeomorph.applyMulAction`) is continuous.
- The degree is a continuous homomorphism to the discrete group `{±1}`, so `Diff⁺(M)` is the
  union of the components of degree one.

**Checks.**

- `Diff(S¹)` contains the rotations `TauCeti.circleRotationHom a` and the reflection
  `TauCeti.circleReflection`, of degrees `+1` and `−1`; `Diff⁺(S¹)` contains the rotations and not
  the reflection, so `Diff(S¹)/Diff⁺(S¹)` has order two.
- On `S¹` the family `φ_t(e^{iθ}) = e^{i(θ + t)}` is jointly smooth, so it is a continuous map
  `ℝ → Diff(S¹)` by `Diffeomorph.ofSmoothFamily`, with image the compact subgroup of rotations. On
  the non-compact `ℝ` the weak and strong Whitney topologies differ: for a bump function `b`
  supported in `[−1, 1]` with small derivative, the diffeomorphisms `x ↦ x + b(x − k)` converge to
  the identity as `k → ∞` in the weak topology (uniformly on compact sets) but not in the strong
  one (the perturbation never becomes small on all of `ℝ`); this layer is stated for compact `M`,
  where the two agree.
- For `M = {pt}`, `Diff(M)` is trivial; for `M` a finite set of `k` points, `Diff(M)` is the
  symmetric group `S_k` with the discrete topology, so the definition degenerates correctly.
- `Diff(D¹, ∂D¹)` is the group of diffeomorphisms of `[−1, 1]` fixing the endpoints; it is
  contractible (push along the graph), and `Diff(D¹)` has two components.

### 3.2 Smooth families and the reference inclusion

Consume `Diffeomorph.ofSmoothFamily`: a family `f : P → M ≃ₘ^n⟮I, I⟯ M` that is jointly `Cⁿ` on
`P × M` is continuous into the weak Whitney topology, and the native continuous inclusion
`TauCeti.continuousOrthogonalToDiffSphere n ∞ : O(n + 1) → Diff(Sⁿ)` obtained by restricting
linear isometries to the unit sphere (`LinearIsometryEquiv.unitSphereDiffHom`, injective). Prove
the converse of the smooth-families map under hypotheses: for `P` a compact manifold and a
continuous `P → Diff(M)` (compact `M`), there is a homotopic map which is a jointly smooth family
(Hirsch, Chapter 2, the approximation of continuous maps by smooth ones, applied in charts of
`C^∞(M, M)`). Prove that the inclusion `O(n + 1) → Diff(Sⁿ)` is a closed embedding
of topological groups and that it lands in `Diff⁺(Sⁿ)` exactly on `SO(n + 1)`.

- A jointly smooth family is a continuous map; a diffeotopy `TauCeti.Diffeotopy` gives a path in
  `Diff(M)` (`TauCeti.Diffeotopy.toPath`).
- The reference inclusion is a continuous injective homomorphism from a compact group, hence a
  closed embedding.
- The antipodal map `−1 ∈ O(n + 1)` has degree `(−1)^{n+1}`, so it lies in `Diff⁺(Sⁿ)` exactly for
  odd `n`.

**Checks.**

- The family `t ↦ (rotation by `t`)` of `S¹` is jointly smooth on `ℝ × S¹`, so it is a continuous
  path in `Diff(S¹)`; the family `t ↦ (rotation by `|t|`)` is continuous but not jointly smooth,
  and it is still a continuous map into `Diff(S¹)`, which is why the converse is only up to
  homotopy.
- `−1 ∈ O(2)` is the rotation by `π`, of degree `+1`; `−1 ∈ O(3)` is the antipodal map of `S²`,
  of degree `−1`; the formula `(−1)^{n+1}` gives `+1` and `−1`.
- The inclusion `O(4) → Diff(S³)` sends the diagonal matrix `diag(−1, 1, 1, 1)` to a reflection
  of `S³`, which is not in `Diff⁺(S³)`, so `Diff(S³) → {±1}` is surjective.

### 3.3 The Smale conjecture, Cerf's theorem and Watanabe's theorem

State the **Smale conjecture** as the native `TauCeti.SmaleConjecture`: the inclusion
`O(4) → Diff(S³)` is a homotopy equivalence (Hatcher, *A proof of the Smale conjecture*, Ann. of
Math. 117 (1983); its disc form is that `Diff(D³, ∂)` is contractible). State **Cerf's theorem**:
`π₀(Diff⁺(S³)) = 0` (Cerf, *Sur les difféomorphismes de la sphère de dimension trois (Γ₄ = 0)*,
LNM 53, Théorème 1), hence `π₀(Diff(S³)) ≅ ℤ/2` through the degree, hence `Γ₄ = 0`. Smale's
conjecture implies Cerf's theorem, since `π₀(O(4)) ≅ ℤ/2`. State **Watanabe's theorem** as the
native `TauCeti.WatanabeTheorem`: `π₁(Diff(D⁴, ∂))`, based at the identity, has an element of
infinite order (Watanabe, *Some exotic nontrivial elements of the rational homotopy groups of
`Diff(S⁴)`*, Theorem 1.1 and Remark 1.2: the evaluation of Kontsevich's classes gives a surjection
`π_k BDiff(D⁴, ∂) ⊗ ℚ → A_k` for every `k ≥ 1`, `A₁ = 0` and `A₂ ≅ ℚ`, so the first class lies in
`π₂ BDiff(D⁴, ∂) ⊗ ℚ ≅ π₁ Diff(D⁴, ∂) ⊗ ℚ`); it refutes the four-dimensional disc Smale
conjecture (`TauCeti.WatanabeTheorem.not_contractibleSpace_discDiff_four`), which is the disc form
of `[Kir97, Problem 4.34]` (`Diff(S⁴) ≃ O(5)`?) and the smooth half of `[Kir97, Problem 4.126]`.

- Smale: the specific map `continuousOrthogonalToDiffSphere 3 ∞` is a homotopy equivalence, not
  merely some equivalence of the two spaces; `O(4)` is compact and `Diff(S³)` is not, so no
  isomorphism of topological groups is claimed.
- Cerf: every orientation-preserving diffeomorphism of `S³` is diffeotopic to the identity.
- Watanabe: an element of `π₁(Diff(D⁴, ∂), id)` of infinite order; `Diff(D⁴, ∂)` is not
  contractible.

**Checks.**

- The reflection of `S³` has degree `−1` and is not isotopic to the identity, so `π₀(Diff(S³))`
  has at least two elements; Cerf's theorem is about `Diff⁺`, and the formula `π₀ = ℤ/2` for the
  full group is the correct one, not `π₀(Diff(S³)) = 0`.
- `Diff(S³)` is not compact: the time-`t` map of the gradient flow of a height function on `S³`
  has derivative of norm `e^{t}` at a hyperbolic fixed point, unbounded in `t`, while the image of
  `O(4)` is compact; a topological-group isomorphism `Diff(S³) ≅ O(4)` is false.
- The statement for `n = 2` (Smale, `Diff(S²) ≃ O(3)`) and `n = 1` (`Diff(S¹) ≃ O(2)`) are true
  and are the same shape with `3` replaced by `n`; the shape with `4` is what Watanabe's theorem
  disproves in its disc form, so the dimension is part of the statement.

### Examples

`Diff(S¹)` with its rotations and reflection; the reference inclusions `O(n + 1) → Diff(Sⁿ)`;
`Diff(D¹, ∂D¹)` contractible; the three headline statements, all three statable at the pins (the
Smale and Watanabe statements are in `Suggested.lean`).

### Dependencies

Mathlib's `Diffeomorph`, `ContMDiffMap` and `HomotopyGroup`; the native group, topology,
inversion, relative subgroup, sphere inclusion, Smale and Watanabe declarations of the supplier
contracts; DifferentialGeometry's degree for `Diff⁺`; Layer 1 for manifolds with boundary.

## Layer 4: knot theory, done properly (owned here)

### 4.1 Geometric presentations, orientation and framing

Consume `TauCeti.SmoothCircleEmbedding I M` (a smooth embedding of the oriented circle, with
`rotate` for orientation-preserving reparametrisation and `reverse` for orientation reversal),
`TauCeti.UnorientedSmoothCircleEmbedding I M` (the quotient by reversal), the labelled links
`TauCeti.SmoothLinkEmbedding I M n` (families of `n` smooth circle embeddings with pairwise
disjoint images, with `relabel`, `reverse` and transport by ambient diffeomorphisms; the empty link
is the unique link with `0` components and `singletonEquiv` identifies one-component links with
knots), the equivalence `SmoothLinkEmbedding.SmoothAmbientIsotopic` (one diffeotopy of `M`
carrying every component onto the corresponding component at time one), and the native fact that
ambient isotopic links have homeomorphic complements. Define a **framing** of a smooth knot `K` in
`S³` as a homotopy class of nowhere-vanishing sections of the normal bundle of `K` (1.3), and the
**Seifert framing** as the one whose push-off has linking number `0` with `K`; prove that framings
form a torsor under `ℤ` through the linking number of the push-off, so that a framed knot is a
knot with an integer (Rolfsen, *Knots and Links*, Chapter 2, Section E, and Chapter 5 for the linking
number). The linking number of two disjoint oriented knots in `S³` is defined through
`H₁(S³ ∖ K) ≅ ℤ` (Alexander duality, Hatcher, *Algebraic Topology*, Theorem 3.44), the class of
the second knot being the integer multiple of the meridian.

- A framed oriented knot is a pair `(K, n)` with `n` the framing coefficient relative to the
  Seifert framing; forgetting the framing and the orientation are the two forgetful maps, and
  reversal does not change the framing coefficient.
- Ambient isotopy preserves the Seifert framing and acts on framing coefficients by the identity.
- Linking number is symmetric, changes sign under reversal of either component and under mirror,
  and is an invariant of ambient isotopy of the link.

**Checks.**

- The unknot `TauCeti.unknot` (the great circle of the first coordinate plane of `ℝ⁴`) has the
  Seifert framing given by any parallel great circle, with linking number `0`; the push-off along
  the Hopf fibre direction has linking number `±1`, so it is the framing `±1`, not the Seifert one.
- The Hopf link has linking number `±1` according to orientation; the two-component unlink has
  linking number `0`; the Whitehead link has linking number `0` and is not the unlink (its Jones
  polynomial differs), so the linking number does not detect splitness.
- The map `t ↦ t − sin t` is a smooth homeomorphism of `ℝ/2πℤ` whose derivative vanishes at `0`;
  composing a smooth knot with it gives a smooth topological embedding that is not a smooth
  embedding, so it is not a `SmoothCircleEmbedding`: the carrier requires an immersion, which is
  what makes the normal bundle and the framings exist.

### 4.2 Combinatorial presentations and their moves

Consume the native combinatorial presentations: oriented PD-codes `TauCeti.OrientedPDCode n`
(`n` crossings, four half-edges per crossing, crossing-free circles recorded separately, with
`writhe`, `mirror`, `reverse`, `relabel`), based oriented Gauss codes `TauCeti.BasedOrientedGaussCode n`
with their framed and unoriented variants, braid words `TauCeti.BraidWord n` with
`TauCeti.BraidWord.toBraid : BraidWord n → BraidGroup n`, and grid diagrams `TauCeti.GridDiagram n`.
Consume the moves: Reidemeister equivalence of oriented PD-codes
`TauCeti.OrientedPDCode.ReidemeisterEquiv` (generated by relabelling, crossing rotation, the first
move `reidemeisterOne`, the second move `insertClasp` in its three forms and the third move
`reidemeisterThree`), Markov equivalence `TauCeti.MarkovEquiv` on `TauCeti.MarkovBraid`
(conjugation and the two stabilizations), the Artin relations on words
`TauCeti.BraidWord.ArtinEquiv`, and grid moves `TauCeti.GridDiagram.MovesTo` (cyclic permutation,
commutation, stabilization). Define **planarity** of a PD-code: the code is planar when the
surface built from its crossings and arcs (vertices the crossings, edges the arcs, faces the orbits
of the face permutation) has Euler characteristic `2` on each connected component, equivalently a
connected code with `n` crossings has `n + 2` faces; prove that planarity is preserved by every
Reidemeister move and holds for every braid closure. Prove the comparison between Gauss codes and
PD-codes (a based oriented Gauss code determines an oriented PD-code and conversely for a
connected code with a chosen base half-edge), compatible with mirror, reversal and writhe.

- Each presentation has its forgetful maps: framed to unframed (`FramedMarkovBraid.forgetFraming`,
  `FramedBasedOrientedGaussCode` to its unframed code), oriented to unoriented.
- The writhe of a PD-code is a Reidemeister-two and -three invariant and changes by `±1` under
  the first move; the writhe of a braid closure is the exponent sum of the word
  (`TauCeti.BraidWord.writhe_closure`).
- Markov-equivalent braids have closures with the same number of components
  (`TauCeti.MarkovEquiv.componentCount_eq`).

**Checks.**

- The PD-code of the right-handed trefoil has three crossings and five faces, so it is planar; the
  code with one crossing whose four half-edges are paired `0–2`, `1–3` is a virtual crossing with
  `V − E + F = 1 − 2 + 1 = 0`, not planar, and no diagram realises it.
- The kink `TauCeti.PDCode.kink` has writhe `±1` and is Reidemeister equivalent to the
  crossing-free circle; the trefoil code is not Reidemeister equivalent to the unknot code, since
  its Jones polynomial is `t + t³ − t⁴ ≠ 1`.
- The braid `σ₀ ∈ B₂` closes to the unknot; `σ₀³` closes to the right-handed trefoil; `σ₀²` closes
  to the Hopf link with two components. The trivial braid on two strands closes to the two-component
  unlink, which is not Markov equivalent to the trivial braid on one strand
  (`TauCeti.not_markovEquiv_one_of_ne`).
- Mirroring a Gauss code negates every crossing sign and fixes the traversal data; reversing the
  orientation reverses the traversal and fixes the signs; so a code with writhe `w` has mirror of
  writhe `−w` and reverse of writhe `w`.

### 4.3 The correspondences: Markov's theorem and Reidemeister's theorem

Consume the braid-closure edge `TauCeti.BraidWord.closure w : OrientedPDCode w.length` and the
native facts that Artin-equivalent words have Reidemeister-equivalent closures. State **Markov's
theorem** in its combinatorial form: for words `w` on `n + 1` strands and `v` on `m + 1` strands,
the braids `⟨n, w.toBraid⟩` and `⟨m, v.toBraid⟩` are Markov equivalent if and only if the closures
`w.closure` and `v.closure` are Reidemeister equivalent (Birman, *Braids, Links, and Mapping Class
Groups*, Theorem 2.3; Lickorish, *An Introduction to Knot Theory*, Chapter 16, Theorem 16.10;
Traczyk's combinatorial proof). The forward direction is the chain: conjugation gives
Reidemeister-equivalent closures and each stabilization is a first Reidemeister move; the converse
is the content. The strand count `n + 1 ≥ 1` is part of the statement: on zero strands the closure
is the empty link, not the unknot. Define the **diagram of a smooth link in `ℝ³`** through a
generic projection: a direction `v` is generic for `L` when the projection along `v` is an immersion
of the link with finitely many double points, all transverse, and no other multiple points; prove
that generic directions are open and dense (Lickorish, Chapter 1, the proof of Theorem 1.1; the
transversality theorem of Hirsch, Chapter 3), and define the oriented PD-code `D_v(L)` of a generic
projection with the over-strand read from the height along `v`. State **Reidemeister's theorem**:
for smooth links `L, L'` in `ℝ³` with generic directions `v, v'`, the links are smoothly ambient
isotopic if and only if `D_v(L)` and `D_{v'}(L')` are Reidemeister equivalent (Lickorish, Chapter 1,
Theorem 1.7; Burde–Zieschang, Chapter 1). The forward direction is a
one-parameter general-position argument along the isotopy, a Cerf-theoretic statement on the
codimension-one degeneracies of projections; the converse realises each move by an isotopy
supported in a ball. Define the **realization** of a planar PD-code as a polygonal link in `ℝ³`
(the inverse edge of the spanning tree), and prove that its projection recovers the code. Fix the
spanning tree of presentations: the PD-code is the hub; braid closure, Gauss codes and the
realization are its edges; the grid-diagram edge is CombinatorialHeegaardFloer Lane K's (Cromwell's
theorem), which consumes the hub.

- Markov: `MarkovEquiv ⟨n, w.toBraid⟩ ⟨m, v.toBraid⟩ ↔ ReidemeisterEquiv w.closure v.closure`.
- Every planar oriented PD-code is the code of a generic projection of a polygonal link, and every
  smooth link has a generic projection; the diagram of the braid closure of `w` realised as a
  closed braid is `w.closure` up to relabelling.
- Reidemeister: ambient isotopy classes of smooth links in `ℝ³` biject with Reidemeister classes
  of planar oriented PD-codes.

**Checks.**

- `σ₀³` and `σ₀⁻³` on two strands close to the right- and left-handed trefoils, whose Jones
  polynomials `t + t³ − t⁴` and `t⁻¹ + t⁻³ − t⁻⁴` differ, so the closures are not Reidemeister
  equivalent and the braids are not Markov equivalent, although both closures have one component.
- `σ₀ ∈ B₂` and `1 ∈ B₁` are Markov equivalent by one stabilization
  (`TauCeti.markovEquiv_sigma_last_one_one`) and their closures are the two one-crossing and
  zero-crossing codes of the unknot, Reidemeister equivalent by one first move.
- A projection of a knot along a direction tangent to it at a point is not generic (the
  projection is not an immersion there); generic directions are dense, and for the round unknot
  every generic direction gives a code Reidemeister equivalent to the crossing-free circle.
- The one-crossing non-planar code of 4.2 is Reidemeister equivalent to no closure of a braid, since
  closures are planar and planarity is preserved by the moves.

### 4.4 Sliceness and the slice genus

Consume the native `TauCeti.IsSmoothlySlice K` (a smooth properly embedded disc in `D⁴` with
boundary `K`), `TauCeti.IsTopologicallySlice K` (a locally flat such disc, with the half-plane
tangential model), `TauCeti.IsSmoothlySlice.isTopologicallySlice`, the invariance of both under
rotation and reversal, `TauCeti.isSmoothlySlice_unknot`, and the slice genus
`TauCeti.sliceGenus K : ℕ∞` (the infimum of the genera of smooth slice surfaces, `⊤` when there is
none), with `TauCeti.IsSmoothlySlice.sliceGenus_eq_zero`. Define the **topological slice genus**
`g_s^{top}(K)` in the same way with locally flat slice surfaces, and the **Seifert genus** `g(K)`
as the least genus of a Seifert surface. Prove that every knot in `S³` bounds a Seifert surface
(Seifert's construction on a diagram, Lickorish, Chapter 2, Theorem 2.2), so that `g(K)` and
`g_s(K)` are finite; that `g_s^{top}(K) ≤ g_s(K) ≤ g(K)` (push the interior of a Seifert surface
into `D⁴`); that `g_s` and `g_s^{top}` are invariants of smooth, respectively topological,
concordance (6.1); and that the slice genus is subadditive under connected sum.

- `g_s(K) < ⊤` for every knot in `S³`; `g_s(unknot) = 0`; `g_s(K) = g_s(K.reverse) = g_s(mirror K)`.
- `g_s^{top} ≤ g_s ≤ g`, and `g_s(K # K') ≤ g_s(K) + g_s(K')`.
- Smoothly slice implies topologically slice; the converse is not claimed.

**Checks.**

- The unknot has `g = g_s = g_s^{top} = 0`; the trefoil has `g = 1` (its genus-one Seifert surface
  `trefoilSeifertMatrix`) and `g_s = 1` (it is not slice: its signature is `−2 ≠ 0`, 6.2), so
  `g_s = g` here; the figure-eight has `g = 1` and `g_s = 1` (its signature is `0` but its
  Alexander polynomial `−t + 3 − t⁻¹` is not of the form `f(t)f(t⁻¹)`, which slice knots require,
  the Fox–Milnor theorem, Lickorish, Chapter 8).
- The square knot `T # T̄` (trefoil and its mirror) is slice, so `g_s = 0 < 1 = g`, which shows
  the inequality `g_s ≤ g` is not an equality in general.
- A slice surface of genus `0` for `K` is a disc only after the classification of compact surfaces;
  the roadmap states `IsSmoothlySlice K → sliceGenus K = 0` and not the converse.

### 4.5 Knot polynomials and their agreement

Three routes to the Alexander polynomial and two to the Jones polynomial are native, each on its
own presentation; this section owns the comparison theorems between them.

*Alexander.* Consume `TauCeti.KnotTheory.alexander V` for a Seifert matrix `V` (Conway-normalised,
symmetric, `Δ(1) = det(V − Vᵀ)`, invariant under unimodular congruence and the two enlargements
generating S-equivalence `TauCeti.KnotTheory.IntegralSquareMatrix.SEquivalent`, with the trefoil
and figure-eight values), the Alexander module and elementary ideals of an oriented PD-code
(`TauCeti.OrientedPDCode.AlexanderModule`, `elementaryIdeal`, from the Wirtinger presentation,
invariant under Reidemeister equivalence), and the Burau route `TauCeti.MarkovBraid.burauAlexander`
(the corner minor of `burau b − 1`, a Markov invariant up to units of `ℤ[T;T⁻¹]`). Define the
**Seifert matrix of a diagram**: Seifert's surface of an oriented PD-code (Seifert circles joined
by half-twisted bands), a basis of its first homology by the cycles of the Seifert graph, and the
Seifert form by linking numbers of push-offs (Lickorish, Chapter 6; Burde–Zieschang, Chapter 8),
with the theorem that the Seifert matrices of Reidemeister-equivalent diagrams are S-equivalent
(Lickorish, Chapter 8, Theorem 8.4). Define the **Alexander polynomial of a knot diagram** as the
Conway-normalised generator of the first elementary ideal `E₁(D)`: prove that `E₁` of a knot
diagram is principal, generated by a polynomial `Δ` with `Δ(t) = Δ(t⁻¹)` and `Δ(1) = 1`, unique with
these normalisations (Crowell–Fox, *Introduction to Knot Theory*, Chapter VII; Lickorish, Chapter
6). Prove the **agreement theorems**: for a knot diagram `D` with Seifert matrix `V(D)`,
`Δ_D = alexander V(D)`; for a braid word `w` with one-component closure,
`burauAlexander ⟨n, w.toBraid⟩ ≐ alexander V(w.closure)` (equal up to a unit `±T^k`), which the
native `associated_burauAlexander_alexander_trefoilSeifertMatrix` verifies on the trefoil.

*Jones.* Consume the Kauffman bracket, its writhe normalisation and
`TauCeti.OrientedPDCode.jonesPolynomial` with its Reidemeister invariance, mirror and reversal
laws and the unknot and trefoil values, and the Jones representation of the braid group with the
writhe-normalised Markov trace `TauCeti.MarkovBraid.jonesTrace`. Prove the agreement: for every
braid word `w` on `n + 1` strands, `jonesTrace ⟨n, w.toBraid⟩ = δ · normalizedKauffmanBracket
(w.closure)` (Jones, *A polynomial invariant for knots via von Neumann algebras*, Bull. AMS 12
(1985), and the Temperley–Lieb state-sum comparison of Kauffman, *State models and the
Jones polynomial*, Topology 26 (1987)), which the native trefoil computation verifies.

*HOMFLY.* Consume the uniqueness `TauCeti.homflySpecialization`: a two-variable Laurent polynomial
is determined by its specializations `a = q^N`, `z = q − q⁻¹`. Define the HOMFLY polynomial of an
oriented diagram through the skein relation `a P(L₊) − a⁻¹ P(L₋) = z P(L₀)`, `P(unknot) = 1`, and
prove existence and Reidemeister invariance (Freyd–Yetter–Hoste–Lickorish–Millett–Ocneanu, Bull.
AMS 12 (1985); Lickorish, Chapter 15), and the two specializations: `a = 1`, `z = t^{1/2} − t^{−1/2}`
gives the Conway-normalised Alexander polynomial, and `a = t⁻¹`, `z = t^{1/2} − t^{−1/2}` gives the
Jones polynomial (Lickorish, Chapter 15).

- Each invariant is a function on Reidemeister classes of planar oriented PD-codes, hence by 4.3 on
  smooth links; the Alexander polynomial and `P` depend on orientation only through the sign
  conventions and the Jones polynomial not at all for knots.
- Agreement: Seifert-matrix, Fox-calculus and Burau Alexander polynomials coincide (the last up to
  units); bracket and Jones-trace Jones polynomials coincide.
- `Δ(1) = 1` fixes the sign of `Δ` (both `Δ` and `−Δ` are symmetric); `Δ(−1) = ±det(K)`.

**Checks.**

- Unknot: `Δ = 1`, `V = 1`, `P = 1`. Right-handed trefoil: `Δ = t − 1 + t⁻¹`, `V = t + t³ − t⁴`;
  its mirror has `V = t⁻¹ + t⁻³ − t⁻⁴`, and both have `V(1) = 1`, so the trefoil value is pinned by
  the whole polynomial and not by its value at `1`; `Δ` is the same for both. Figure-eight:
  `Δ = −t + 3 − t⁻¹`, amphicheiral, `V = t² − t + 1 − t⁻¹ + t⁻²`.
- At `t = −1`: `Δ(−1) = 1, −3, 5` for the unknot, trefoil and figure-eight, so `|Δ(−1)|` is the
  determinant `1, 3, 5`. The polynomial `−Δ` is symmetric too, so symmetry alone does not fix the
  sign; `(−Δ)(1) = −1`, so the law `Δ(1) = 1` does. With the sign fixed, `Δ(−1)` distinguishes the
  trefoil (`−3`) from the figure-eight (`5`), while `Δ(1) = 1` for both.
- The Burau value of `σ₀³` is `−t(t² − t + 1)`, associated to `t − 1 + t⁻¹` by the unit `−t²`;
  at `t = −1` over `ℤ` it is `3`, not associated to `1`, which separates the trefoil braid from the
  trivial braid although both closures have one component.
- The Hopf link has `Δ = t^{1/2} − t^{−1/2}` up to units and Jones polynomial `−t^{1/2} − t^{5/2}`
  (one orientation), with the skein relation on its two crossings checked against `P`; the
  two-component unlink has `V = −(t^{1/2} + t^{−1/2})` (`TauCeti.OrientedPDCode.jonesPolynomial_eq_pow`
  with `c = 2`).

### 4.6 Freedman's theorem

State **Freedman's theorem** as the native `TauCeti.FreedmanSliceTheorem`: every knot
`K : S¹ → S³` whose knot group has perfect commutator subgroup
(`TauCeti.SmoothCircleEmbedding.HasPerfectCommutatorSubgroup`) is topologically slice (Freedman,
*The topology of four-dimensional manifolds*, J. Differential Geom. 17 (1982); Freedman–Quinn,
*Topology of 4-Manifolds*, Theorem 11.7B; `[Kir97, Problem 1.36]`). Prove the equivalence between
the hypothesis and the Alexander polynomial: for a knot in `S³`, `π'' = π'` holds if and only if
the Alexander module `π'/π''` vanishes, if and only if `E₁ = Λ`, if and only if `Δ_K = 1` (Crowell,
as cited in Freedman–Quinn, Theorem 11.7B; Rolfsen, Chapter 7, for the identification of the
Alexander module with `H₁` of the infinite cyclic cover). The route to the theorem itself is
Freedman's disc theorem for Alexander-polynomial-one knots; no roadmap on main supplies it, and
this roadmap records the statement with that route, not a proof plan of Freedman's theorem.

- `HasPerfectCommutatorSubgroup K ↔ Δ_K = 1` for knots in `S³`.
- The theorem applies to the unknot (`TauCeti.hasPerfectCommutatorSubgroup_unknot`) and to the
  Whitehead double of any knot, which has `Δ = 1`.
- The conclusion is topological sliceness only; the trefoil has `Δ ≠ 1` and is not even
  topologically slice (its signature is `−2`, and signature is a topological concordance invariant,
  6.2).

**Checks.**

- The unknot: knot group `ℤ`, commutator subgroup trivial, hence perfect; `Δ = 1`; it is
  topologically slice (native). Both sides hold.
- The trefoil: knot group `⟨x, y | x² = y³⟩`, commutator subgroup free of rank two, not perfect;
  `Δ = t − 1 + t⁻¹ ≠ 1`; not slice. Both sides fail.
- The figure-eight: `Δ(−1) = 5 ≠ 1`, so `Δ ≠ 1` and the hypothesis fails, consistent with the
  figure-eight not being slice; the theorem makes no claim about it.

### Examples

The unknot, the right-handed trefoil `σ₀³`, the figure-eight, the Hopf link and the two-component
unlink are the standing examples; their Alexander, Jones and signature values pin every convention
of this layer.

### Dependencies

Mathlib's `Quandle`, `PresentedMonoid`, `LaurentPolynomial` and matrices; the native
presentations, moves, polynomials, slice and knot-group declarations of the supplier contracts;
Layer 1 for tubular neighbourhoods (framings) and Layer 2 for locally flat discs; Layer 6 for the
concordance invariance of the slice genera and the signature argument in the Checks.

## Layer 5: Dehn surgery

### 5.1 Exteriors and solid torus neighbourhoods

Consume `TauCeti.SolidTorus = D² × S¹`, `TauCeti.IsSolidTorusNeighborhood f Φ` (an embedding of
the closed solid torus whose core traces the loop `f` and which carries the open solid torus onto
an open set), the existence theorem for `C²` embedded circles in `ℝ³` and the identification of the
boundary torus with the frontier of the exterior (`IsSolidTorusNeighborhood.frontier_image`,
`exteriorFrontierHomeomorph`). Define the **exterior** `X_L` of a smooth link `L` in `S³` as the
complement of the images of the open solid tori of pairwise disjoint solid torus neighbourhoods of
its components, and prove: solid torus neighbourhoods exist in `S³` (transport from `ℝ³` through
stereographic projection), `X_L` is a compact connected `3`-manifold with boundary
(`TauCeti.IsCompactConnectedThreeManifold`), one boundary torus per component, independent of the
neighbourhoods up to diffeomorphism (uniqueness of tubular neighbourhoods, 1.3), and `H₁(X_K) ≅ ℤ`
for a knot, generated by the meridian (Alexander duality). Define the **meridian** of a component as
the image of `∂D² × {pt}` and the **Seifert longitude** as the boundary curve of a Seifert surface
pushed to the boundary torus, the unique simple closed curve on the boundary torus, up to isotopy,
meeting the meridian once and null-homologous in `X_K` (Rolfsen, Chapter 2, Section E; Chapter 9, Section F).

- `X_L` is a compact `3`-manifold with torus boundary components, and its interior is `S³ ∖ L`.
- The knot group of 4.1 is `π₁(X_K)`, since the exterior is a deformation retract of the
  complement.
- Meridian and Seifert longitude form a basis of `H₁(∂X_K; ℤ)`; the longitude is trivial in
  `H₁(X_K)` and the meridian generates it.

**Checks.**

- The unknot's exterior is a solid torus; its meridian is the core direction's dual and its Seifert
  longitude is the core of the complementary solid torus, so meridian and longitude exchange roles
  under the genus-one splitting `S³ = (S¹ × D²) ∪ (D² × S¹)`.
- The exterior of the two-component unlink has `H₁ = ℤ²` and `π₁` free of rank two; the exterior of
  the Hopf link is `T² × [0, 1]` with `π₁ = ℤ²`, so the exterior distinguishes them.
- A `C¹` knot with a corner of the parametrisation that is still a `C¹` embedding has a tubular
  neighbourhood by the `C²` theorem only after smoothing; the carrier `SmoothCircleEmbedding` is
  `C^∞`, so the theorem applies to it as it stands.

### 5.2 Slopes and framings of the boundary torus

Consume `TauCeti.Slope M` (primitive classes modulo sign in a `ℤ`-module), `TauCeti.BoundaryTorus`
(a space homeomorphic to `T²` with its first homology), `TauCeti.FramedBoundaryTorus` (a boundary
torus with an ordered basis `(μ, λ)` of `H₁(T; ℤ)`), its `meridian` (value `∞`), `longitude`
(value `0`), `value : Slope T.H → ℚ ∪ {∞}` and the bijection `slopeEquiv`. Construct the framed
boundary torus of a knot exterior: the frontier torus of 5.1 with the basis `(μ, λ)` of meridian
and Seifert longitude, and prove that the resulting bijection `Slope ≃ ℚ ∪ {∞}` is the classical
one: `p/q` is the class `p·μ + q·λ` (Rolfsen, Chapter 9). Prove that an orientation-reversing
diffeomorphism of `S³` sends the slope `p/q` of `K` to the slope `−p/q` of the mirror image.

- The slopes of a framed torus are `ℚ ∪ {∞}`; `∞` is the meridian and `0` the longitude; `p/q` and
  `−p/−q` are the same slope and `p/q`, `−p/q` are different unless `p = 0`.
- Changing the framing by `λ ↦ λ + kμ` sends the value `p/q` to `(p + kq)/q`.
- The class `(0, 0)` is not primitive and names no slope; `(2, 2)` is not primitive; `(1, 0)` and
  `(0, 1)` are.

**Checks.**

- `slopeValue (1, 0) = ∞`, `slopeValue (0, 1) = 0`, `slopeValue (3, 2) = 3/2`, and
  `slopeValue (−3, −2) = 3/2` as well, so the sign quotient is correct; `(2, 4)` is excluded by
  primitivity (`gcd = 2`).
- The unknot's framed torus with `(μ, λ)` and the complementary solid torus's framed torus with
  `(λ, μ)` are related by the value map `x ↦ 1/x`, with `∞ ↔ 0`.
- For the right-handed trefoil, the framing `λ + 6μ` is the boundary of the fibre of the Seifert
  fibration of its exterior (the cabling annulus), not the Seifert longitude, whose linking number
  with `K` is `0`; the value `6` is the torus-knot framing `pq` of the `(2, 3)` torus knot.

### 5.3 Dehn filling, surgery and the unknot identities

Define the **Dehn filling** `X(s)` of a compact `3`-manifold `X` with a boundary torus `T` along a
slope `s` on `T`: glue `D² × S¹` to `X` along a diffeomorphism `∂D² × S¹ → T` sending the meridian
`∂D² × {pt}` to a curve of slope `s` (1.2), and prove that the result is independent, up to
diffeomorphism, of the gluing map with that property (the solid torus's diffeomorphisms realise
every automorphism of `H₁(T²)` fixing the meridian; Rolfsen, Chapter 9, Section F). Define **Dehn
surgery** `S³_K(p/q) := X_K(p/q)` for a knot with its Seifert framing, integral surgery, and
surgery on a framed link component by component; define the **lens space** `L(p, q)` as
`S³_U(p/q)` on the unknot. Prove the **unknot identities**: `S³_U(∞) ≅ S³`, `S³_U(0) ≅ S¹ × S²`,
`S³_U(1/n) ≅ S³` for every `n`, and `H₁(L(p, q)) ≅ ℤ/p`, `π₁(L(p, q))` cyclic of order `|p|`
(Rolfsen, Chapter 9); `H₁(S³_K(p/q)) ≅ ℤ/p` for every knot `K`. Prove the **classification of
lens spaces**: `L(p, q) ≅ L(p, q')` if and only if `q' ≡ ±q^{±1} (mod p)`, orientation ignored
(Hatcher, *Notes on Basic 3-Manifold Topology*, Theorem 2.5, whose `L_{p/q}` has `H₁ ≅ ℤ/q` and is
the lens space written `L(q, p)` here, so that his condition `p' ≡ ±p^{±1} (mod q)` is this one
with the two parameters renamed). Define **surgery on a framed sphere** in general
dimension: for a framed embedding `φ : S^k × D^{n−k} → M`, remove the interior of its image and
glue `D^{k+1} × S^{n−k−1}` along the common boundary `S^k × S^{n−k−1}` (Milnor, *Lectures on the
h-cobordism Theorem*, Section 3), and prove that Dehn surgery with integral slope `n` is the case `k = 1`
of a framed circle with framing `n`. State the **Lickorish–Wallace theorem**: every closed
connected orientable `3`-manifold is integral surgery on a framed link in `S³` (Lickorish, Chapter
12; Rolfsen, Chapter 9).

- `X(s)` is a closed `3`-manifold when `T` is the only boundary component; it depends only on `s`.
- `H₁(S³_K(p/q)) ≅ ℤ/p`; in particular `S³_K(0)` has `H₁ ≅ ℤ` and `S³_K(1/n)` is a homology sphere.
- Surgery on the mirror image along `−p/q` is the orientation reversal of surgery on `K` along
  `p/q`.

**Checks.**

- `S³_U(0) = S¹ × S²` has `H₁ = ℤ`; `S³_U(∞) = S³` has `H₁ = 0`; `S³_U(2) = L(2, 1) = ℝP³` has
  `H₁ = ℤ/2`; `S³_U(1) = S³` by the identity `1/n`, consistent with `H₁ = ℤ/1 = 0`.
- `L(5, 1)` and `L(5, 2)` have the same homology `ℤ/5` and are not homeomorphic, since
  `2 ≢ ±1^{±1} (mod 5)`; `L(7, 1)` and `L(7, 6)` are homeomorphic since `6 ≡ −1`; `L(5, 2)` and
  `L(5, 3)` are homeomorphic since `3 ≡ 2⁻¹ (mod 5)`.
- The Poincaré homology sphere is `S³_T(−1)` on the left-handed trefoil (equivalently `+1` on the
  right-handed one): `H₁ = 0` by the formula, `π₁` the binary icosahedral group of order `120`,
  not trivial, which is the first instance of Property P.
- Surgery on the framed unlink with framings `0, 0` gives `S¹ × S² # S¹ × S²`; with framings
  `1, 1` it gives `S³`; the Hopf link with framings `0, 0` gives `S³` and with `0, n` gives `S³`
  again (a slam-dunk), so framings on linked components interact.

### 5.4 Property P, Property R and cosmetic surgeries

State **Property P**: for every knot `K` in `S³` other than the unknot and every slope
`r ≠ ∞`, `π₁(S³_K(r))` is nontrivial (`[Kir97, Problem 1.15]`). Two routes: Kronheimer–Mrowka,
*Witten's conjecture and Property P*, Geom. Topol. 8 (2004), Theorem 2 (for `K` nontrivial, `+1`
surgery admits a nontrivial homomorphism `π₁ → SO(3)`, so Conjecture 1, that `S³_K(+1)` is not a
homotopy sphere, holds; `−1` by mirroring; all other slopes through the cyclic surgery theorem of
Culler–Gordon–Luecke–Shalen, Ann. of Math. 125 (1987), and Moser's torus-knot surgeries), or the
Poincaré conjecture (8.4) together with the Gordon–Luecke theorem that a nontrivial surgery on a
nontrivial knot is never `S³` (Gordon–Luecke, *Knots are determined by their complements*, J. Amer.
Math. Soc. 2 (1989)). State **Property R**: `0`-surgery on a nontrivial knot is never `S¹ × S²`
(Gabai, *Foliations and the topology of 3-manifolds III*, J. Differential Geom. 26 (1987),
`[Kir97, Problem 1.16]`). State the **Akbulut–Kirby conjecture** `[Kir97, Problem 1.19]`, that
knots with diffeomorphic `0`-surgeries are concordant, as a statable statement, and record that it
is false (Yasui, *Corks, exotic 4-manifolds and knot concordance*, arXiv:1505.02551, cited by its
locator). State the **cosmetic surgery** results `[Kir97, Problem 1.81]`. Gordon–Luecke: a nontrivial
knot in `S³` has no surgery yielding `S³` other than the trivial one, `S³_K(r) ≅ S³` only for
`r = ∞`; equivalently, two knots with homeomorphic exteriors are equivalent, and no filling of a
knot exterior other than the unknot's is cosmetic for `S³`. Mathieu: chirally cosmetic surgeries
exist on knots in `S³`: the exterior of the right-handed trefoil has infinitely many pairs of
inequivalent slopes `r ≠ r'` with an orientation-reversing diffeomorphism `X(r) ≅ X(r')` (Mathieu,
*Closed 3-manifolds unchanged by Dehn surgery*, J. Knot Theory Ramifications 1 (1992), as recorded
in Kirby's remarks to Problem 1.81). The quantifiers are over slopes of the fixed exterior, and
"inequivalent" means that no diffeomorphism of the exterior carries one slope to the other. The
purely cosmetic surgery conjecture, Problem 1.81 (A), is open and is not a target.

- Property P: `∀ K ≠ U, ∀ r ≠ ∞, Nontrivial (π₁(S³_K(r)))`.
- Property R: `∀ K ≠ U, ¬ (S³_K(0) ≅ S¹ × S²)`.
- Gordon–Luecke: `∀ K ≠ U, ∀ r ≠ ∞, ¬ (S³_K(r) ≅ S³)`; Mathieu: `∃ r ≠ r'` inequivalent on the
  trefoil exterior with `X(r) ≅ −X(r')`.

**Checks.**

- The unknot violates every one of these conclusions, which is why it is excluded: `S³_U(1) = S³`
  has trivial `π₁`, `S³_U(0) = S¹ × S²`, and `S³_U(1/n) ≅ S³` for all `n` gives infinitely many
  slopes with filling `S³`; these slopes are equivalent (the solid torus has a diffeomorphism
  carrying `1/n` to `1/m`), consistent with the Gordon–Luecke statement for the unknot.
- The trefoil with `+1` surgery is the Poincaré sphere, with `π₁` of order `120`; with `0` surgery
  it is a torus bundle over the circle, not `S¹ × S²` (its `π₁` is not `ℤ`).
- The figure-eight with `0` surgery is a torus bundle with Anosov monodromy; its `π₁` is not `ℤ`,
  consistent with Property R.

### Examples

The unknot identities and the lens spaces; the Poincaré sphere as `+1` surgery on the trefoil;
the trefoil exterior as the host of Mathieu's chirally cosmetic pairs; the Weeks manifold as the
`(5, 1), (5, 2)` filling of the Whitehead link exterior (7.3).

### Dependencies

Layer 1 (gluing, tubular neighbourhoods, connected sum); Layer 4 (presentations, Seifert surfaces,
framings); the native solid torus neighbourhoods and slopes of the supplier contracts; Layer 8's
Poincaré conjecture for one of the two routes to Property P.

## Layer 6: knot concordance and 4D cobordism (owned here)

### 6.1 The concordance relations and the concordance group

Consume the native smooth concordance `TauCeti.SmoothEmbedding.Concordance f g` (a smooth
embedding `M × ℝ → N × ℝ` that is `f × id` near the initial end and `g × id` near the final end,
with `refl`, `symm`, `trans` and the trace of a diffeotopy) and the relation
`TauCeti.SmoothEmbedding.Concordant`, an equivalence relation for finite-dimensional ambient
models; and the topological concordance `TauCeti.TopologicallyConcordant F F' f g` with a locally
flat track, an equivalence relation on locally flat embeddings, with smooth concordance implying
topological concordance. Specialise to oriented knots `K, K' : SmoothCircleEmbedding (𝓡 3) S³`:
the track is an annulus in `S³ × ℝ`, `K` at time `0` and `K'` at time `1`, with the product
collars. Define the **connected sum of knots** `K # K'` through the connected sum of pairs
`(S³, K) # (S³, K')` along balls meeting each knot in an unknotted arc, oriented compatibly (1.4;
Lickorish, Chapter 2), and prove its well-definedness up to ambient isotopy for oriented knots.
Define the **smooth concordance group** `C` as the set of smooth concordance classes of oriented
knots in `S³` with the operation induced by `#`, and the **topological concordance group** `C^{top}`
likewise; prove that both are abelian groups, that the identity is the class of the unknot, which
is the class of the slice knots (a knot is smoothly slice if and only if it is concordant to the
unknot: cap a concordance with the slice disc of the unknot and, conversely, remove a small disc
from a slice disc), and that the inverse of `[K]` is `[−K]`, the reverse of the mirror image (the
annulus `K × [0, 1]` bent into `S³ × [0, 1]` after pushing `K # −K` to a ribbon disc; Livingston,
*A survey of classical knot concordance*, Section 2; Lickorish, Chapter 8). Prove that the
forgetful map `C → C^{top}` is a homomorphism.

- `Concordant` is reflexive, symmetric and transitive on knots in `S³`; ambient isotopic knots are
  concordant (`TauCeti.SmoothEmbedding.SmoothAmbientIsotopic.concordant`).
- `[K] + [K'] = [K # K']`, `0 = [U] = {slice knots}`, `−[K] = [−K]`; `C` is abelian because
  `K # K'` and `K' # K` are ambient isotopic.
- `K # −K` is slice for every `K`; `K # K` is not slice when `σ(K) ≠ 0`.

**Checks.**

- The product annulus `K × [0, 1]` is a concordance from `K` to `K` (`Concordance.refl`); for the
  right-handed trefoil both ends have signature `−2`, so a definition with the mirror at one end
  (boundary `K ⊔ mirror K`) would make reflexivity fail for the trefoil, whose mirror has signature
  `+2`. The native definition uses the actual endpoints.
- The square knot `T # −T` is slice (it is ribbon), has `Δ = (t − 1 + t⁻¹)²` and `σ = 0`; the
  granny knot `T # T` has `σ = −4` and is not slice. So `[T] + [−T] = 0` and `2[T] ≠ 0`: the trefoil
  has infinite order in `C` (its signature is a homomorphism to `ℤ`, 6.2).
- The figure-eight `E` is amphicheiral and reversible, so `−E = E` and `2[E] = [E # E] = 0`: `E`
  has order two in `C` (it is not slice, 4.4, so its order is exactly two).

### 6.2 The Tristram–Levine signatures as concordance invariants

Consume `Matrix.signature` with the trefoil and figure-eight values and the enlargement
invariance (`signature_enlargeColumn`, `signature_enlargeRow`), and the Tristram–Levine form and
signature `tristramLevineSignature V ω` for `ω` on the unit circle, with its values at `ω = −1`
(the classical signature) and `ω = 1` (zero), congruence invariance, conjugation symmetry,
negation under `V ↦ −Vᵀ` (the mirror image) and additivity under block sums. Define the
**signature function of a knot** `σ_ω(K)`: for `ω` not a root of `Δ_K`, the Tristram–Levine
signature of any Seifert matrix of `K`; at a root `ω` of `Δ_K`, the average of the two one-sided
limits `σ_{ω⁺}` and `σ_{ω⁻}` (Livingston, Section 3.1). Prove that `σ_ω(K)` is well defined
(Seifert matrices of a knot are S-equivalent, 4.5, and `σ_ω` is an S-equivalence invariant), that
it is a concordance invariant and a homomorphism `C → ℤ` for each `ω`, with image in `2ℤ` for
`ω ≠ 1` (a slice knot has a metabolic Seifert matrix, Lickorish, Chapter 8, for `ω = −1`; Tristram, Proc. Cambridge Philos. Soc. 66 (1969), and Levine, Invent. Math. 8 (1969), for
general `ω`), that `σ_ω(−K) = −σ_ω(K)` and `σ_ω(K # K') = σ_ω(K) + σ_ω(K')`, and that the
signatures at the roots of unity `e^{2πi/p}`, `p` prime, are independent on `C`, so that `C` maps
onto `ℤ^∞` (Livingston, Section 3.1, through the twisted doubles of the unknot).

- `σ_ω : C → ℤ` is a homomorphism; `σ_1 = 0`; `σ_{ω̄} = σ_ω`.
- `σ_{−1}(T) = −2`, `σ_{−1}(E) = 0`; `σ_ω(mirror K) = −σ_ω(K)`.
- The averaged value at a root agrees with the unaveraged one wherever the form is nonsingular.

**Checks.**

- Trefoil, `V = trefoilSeifertMatrix`, `ω = e^{iθ}`: the Tristram–Levine form is `2(1 − cos θ)`
  times a matrix congruent to the symmetrised Seifert matrix plus a skew correction; the native
  computation gives `σ = −2` at `ω = −1` and `σ = 0` at `ω = (3 + 4i)/5`, so the function is not
  constant. The roots of `Δ_T = t − 1 + t⁻¹` are `e^{±iπ/3}`: just below `θ = π/3` the signature is
  `0`, just above it `−2`, and the averaged value at the root is `−1`; a definition without the
  average would be ill defined there.
- `σ_ω(T # −T) = −2 + 2 = 0` for all `ω`, consistent with the square knot being slice;
  `σ_{−1}(T # T) = −4`, so the granny knot is not slice.
- `σ_1(V) = 0` for every `V` (native), so the value at `ω = 1` carries no information and the
  "onto `2ℤ`" statement is for `ω ≠ 1` only.

### 6.3 Link cobordisms and the slice genus inequalities

Cobordisms of manifolds in general dimension, with their collars, composition and bordism groups,
are TangentialBordism's (Layers 2–3) and are not restated. Define a **link cobordism** between
smooth links `L₀, L₁` in `S³` as a compact oriented surface `Σ` smoothly and properly embedded in
`S³ × [0, 1]` with `∂Σ = L₀ × {0} ∪ −L₁ × {1}`, and a **concordance** of links as a link cobordism
consisting of annuli, one per component. Prove the **slice genus inequalities**: for a knot `K`,
`|σ_ω(K)| ≤ 2 g_s(K)` for every `ω` that is not a root of `Δ_K` (Tristram; Livingston, Section 3.1;
Lickorish, Chapter 8, for `ω = −1`), and more generally for a link cobordism `Σ` of genus `g`
between knots, `|σ_ω(K₀) − σ_ω(K₁)| ≤ 2g`. The inequality `g_s^{top} ≤ g_s` of 4.4 is not an
equality in general and no converse is stated; the signature bound holds for `g_s^{top}` as well,
since the signature is a topological concordance invariant.

- `|σ_ω(K)| ≤ 2 g_s^{top}(K) ≤ 2 g_s(K)`; a knot with `σ_{−1} ≠ 0` is not slice in either sense.
- Concordance of links is an equivalence relation; concordant knots have equal `g_s`.
- The genus of a cobordism is additive under stacking and symmetric under reversal.

**Checks.**

- The trefoil: `|−2| ≤ 2 g_s(T)` gives `g_s(T) ≥ 1`, and its genus-one Seifert surface gives
  `g_s(T) ≤ 1`, so `g_s(T) = 1`; the figure-eight has `σ = 0` and the bound says nothing, which is
  why its non-sliceness in 4.4 uses the Alexander polynomial instead.
- The torus knot `T(2, 5)` has `σ_{−1} = −4` and genus `2`, so `g_s = 2`; the bound is sharp for
  these torus knots (the Milnor conjecture, `g_s(T(p, q)) = (p − 1)(q − 1)/2`, is
  CombinatorialHeegaardFloer Lane G's through `τ`, not a target here).
- A genus-one cobordism between the unknot and the trefoil exists (a saddle and a cap), consistent
  with `|0 − (−2)| ≤ 2`.

### Examples

The trefoil of infinite order and the figure-eight of order two in `C`; the square knot as the
slice sum `T # −T`; the signature function of the trefoil with its jump at `e^{iπ/3}`.

### Dependencies

Layer 4 (presentations, Seifert matrices, slice genus); Layer 1 (connected sum, gluing); Layer 2
(locally flat annuli); the native concordance and signature declarations of the supplier contracts.
Nothing of CombinatorialHeegaardFloer is consumed: its `τ` consumes this layer.
## Layer 7: Riemannian geometric structures and volume

### 7.1 Volume and curvature

Consume the native Riemannian volume measure `TauCeti.riemannianVolume I M : Measure M`, glued from
the chart densities `√det g`, locally finite and characterised by `eq_riemannianVolume_iff`;
DifferentialGeometry 12.4 relates it to the volume form and densities, and no second measure is
defined. Define the **total volume** of a compact Riemannian manifold as
`(riemannianVolume I M univ).toReal`. Consume the Levi-Civita connection of HopfRinow Layer 1, its
curvature tensor and the native constant-curvature predicate
`Bundle.ContMDiffRiemannianMetric.IsConstantCurvatureTensor g κ` (the tensor identity
`R(w, u)v = κ(⟪u, v⟫w − ⟪w, v⟫u)`, Lee, *Introduction to Riemannian Manifolds*, 2nd ed., Chapter 8, the
constant-curvature form of `R`), together with the sectional and scalar
curvature consequences already proved for hyperbolic metrics. Prove that the total volume is
invariant under isometries and scales by `cⁿ` under `g ↦ c² g`, and compute the volumes of the
standard models.

- `volume(M, g) = ∫ √det g` over an atlas, independent of the atlas; `volume(M, φ^* g) = volume(M, g)`
  for a diffeomorphism `φ`.
- The round `Sⁿ` of radius `1` has volume `2π^{(n+1)/2}/Γ((n+1)/2)`; the flat torus `ℝⁿ/ℤⁿ` has
  volume `1`.
- `IsConstantCurvatureTensor g κ` is equivalent to all sectional curvatures being `κ` in dimension
  at least two.

**Checks.**

- The circle of radius `r` has volume `2πr`; the round `S²` has volume `4π`, the round `S³`
  volume `2π²`; scaling `S²` by `c` multiplies its volume by `c²`, consistent with `cⁿ` for `n = 2`.
- The flat torus `ℝ²/ℤ²` has volume `1` and curvature `0`; the torus `ℝ²/(ℤ × 2ℤ)` has volume `2`,
  so the volume is not an invariant of the diffeomorphism type, only of the metric.
- A compact manifold with a metric of constant curvature `κ ≠ 0` has volume determined by its
  topology only after a rigidity theorem; the two-dimensional case is Gauss–Bonnet, `κ · vol = 2πχ`,
  so a genus-two surface with curvature `−1` has volume `4π`.

### 7.2 Hyperbolic structures, Mostow rigidity and hyperbolic volume

Consume `TauCeti.HyperbolicMetric` (a smooth Riemannian metric, metrically complete, with the
constant-curvature tensor of parameter `−1`), `TauCeti.IsHyperbolic M := Nonempty (HyperbolicMetric)`,
`TauCeti.hypVolumeOfMetric g` (the total volume of `g`), `TauCeti.hypVolume h` on compact `M`
(the volume of a chosen metric), `TauCeti.IsMostowRigid` (any two hyperbolic metrics on a closed
connected manifold of dimension at least three are isometric), the universal statement
`TauCeti.MostowRigidity`, and the consequence that under `IsMostowRigid` the value of `hypVolume`
is independent of the chosen metric; and `TauCeti.IsFiniteVolumeHyperbolic` for the non-compact
pieces of Layer 8. State **Mostow rigidity** as `TauCeti.MostowRigidity` (Mostow, *Strong rigidity
of locally symmetric spaces*, Annals of Math. Studies 78 (1973); Ratcliffe, *Foundations of
Hyperbolic Manifolds*, 3rd ed., Theorem 11.8.5: a homotopy equivalence between closed hyperbolic
manifolds of dimension at least three is homotopic to an isometry; the metric form consumed here
is that two hyperbolic metrics on the same closed manifold are isometric). Prove that the model
spaces carry hyperbolic metrics (the Poincaré ball and half-space models of `ℍⁿ`, Ratcliffe,
Chapter 4), that a closed manifold is hyperbolic exactly when it is a quotient `ℍⁿ/Γ` by a torsion-free
cocompact discrete subgroup of `Isom(ℍⁿ)` (the developing map of a complete constant-curvature
metric, Thurston, *Three-Dimensional Geometry and Topology*, Section 3.4; Ratcliffe, Chapter 8),
and that hyperbolic volume is a homotopy invariant of closed hyperbolic manifolds of dimension at
least three (Mostow rigidity plus isometry invariance of volume).

- `hypVolume` is well defined on closed connected hyperbolic manifolds of dimension at least
  three, positive, and equal to `hypVolumeOfMetric g` for every hyperbolic metric `g`.
- `IsHyperbolic M ↔ HasGeometricStructure M ModelGeometry.hyperbolic` for closed connected
  `3`-manifolds (8.1).
- A compact hyperbolic manifold has finite volume (`hasFiniteVolume_of_compactSpace`); the
  converse fails: the figure-eight knot complement is hyperbolic of finite volume and not compact.

**Checks.**

- In dimension two Mostow rigidity fails: a genus-two surface carries a `6`-dimensional family of
  non-isometric hyperbolic metrics, all of volume `4π`; so `IsMostowRigid` carries the hypothesis
  `3 ≤ finrank`, and `hypVolume` in dimension two is well defined only through Gauss–Bonnet.
- `T³` is not hyperbolic: its fundamental group `ℤ³` is abelian of rank three, while the fundamental
  group of a closed hyperbolic manifold contains no `ℤ²` (Preissmann); so `IsHyperbolic T³` is
  false although `T³` has a complete flat metric.
- Two hyperbolic metrics on the same closed `3`-manifold have the same volume by rigidity; the
  value `0.9427…` of the Weeks manifold and `2.0299…` of the figure-eight complement are different
  manifolds' volumes, not two metrics on one manifold.

### 7.3 The Weeks manifold and the minimal volume theorem

Define the **Whitehead link** as the two-component link `5²₁` of Rolfsen's table, given by its
five-crossing oriented PD-code, and the **Weeks manifold** `W` as the `(5, 1), (5, 2)` Dehn filling
of its exterior (Layer 5; Gabai–Meyerhoff–Milley, *Mom technology and hyperbolic 3-manifolds*,
the paragraph following Theorem 1.1). State the **minimal volume theorem**: `W` carries a
hyperbolic metric, and for every closed orientable hyperbolic `3`-manifold `M`,
`hypVolume W ≤ hypVolume M`, with equality only if `M` is isometric to `W` (Gabai–Meyerhoff–Milley,
Theorem 1.1: the Weeks manifold is the unique smallest-volume closed hyperbolic `3`-manifold, with
`v₁ = 0.9427…`; `[Kir97, Problem 3.60]`). The route is Mom technology: a closed hyperbolic
manifold of volume at most `0.943` contains a Mom-`n` structure for `n ≤ 3`, and the finitely
many resulting manifolds are enumerated. The hypothesis "orientable" is part of the theorem as
stated by the authors; the volume of a non-orientable closed hyperbolic `3`-manifold is at least
that of its orientation double cover divided by two, and the non-orientable case is not a target.

- `W` is a closed orientable hyperbolic `3`-manifold with `H₁(W) ≅ ℤ/5 ⊕ ℤ/5` and volume `0.9427…`.
- The volume of every closed orientable hyperbolic `3`-manifold is at least `0.9427…`, with
  equality exactly for `W`.
- `W` is not Haken (it contains no closed incompressible surface), so Agol's theorems (7.4) give it a finite cover that is Haken and fibers, without `W` itself
  fibering.

**Checks.**

- `H₁` of the `(5, 1), (5, 2)` filling: the linking matrix of the Whitehead link is zero and the
  surgery presentation gives `H₁ = ℤ/5 ⊕ ℤ/5`, of order `25`; the `(1, 0), (1, 0)` filling gives
  `S³`, so the slopes matter.
- The figure-eight knot complement has volume `2.0299… = 2 v₃`, more than twice `0.9427…`, and is
  not closed; the theorem compares `W` only with closed manifolds, so this is not a counterexample.
- A closed hyperbolic `3`-manifold obtained by a filling of the figure-eight knot exterior with a
  large slope has volume close to `2.0299…` from below (Thurston's hyperbolic Dehn surgery
  theorem), larger than `0.9427…`, consistent with the theorem; the volumes of fillings approach
  the cusped volume from below.

### 7.4 Fibering, Haken-ness and Agol's theorems

Consume `TauCeti.MappingTorus φ`, `TauCeti.MappingTorusPresentation M`, `TauCeti.FibersOverCircle M`
(`M` is homeomorphic to a mapping torus), `TauCeti.IsFiniteCover p` (a surjective covering map
with finite fibres), `TauCeti.IsVirtuallyFibered M` (a connected finite cover of `M` fibers over the
circle), the Haken predicates `TauCeti.IsHakenSurfaceEmbedding`,
`TauCeti.IsPossiblyNonorientableClosedHakenThreeManifold` (an irreducible closed connected
`3`-manifold containing a closed bicollared incompressible surface with infinite fundamental group)
and `TauCeti.IsVirtuallyHaken M`, and the native statement `TauCeti.VirtualHakenConjecture`: every
closed hyperbolic `3`-manifold (`MetricSpace`, charted on `ℝ³`, `IsManifold (𝓡 3) ∞`, compact,
connected, `IsHyperbolic`) is virtually Haken. State **Agol's virtual fibering theorem**: every
closed hyperbolic `3`-manifold is virtually fibered (Agol, *The virtual Haken conjecture*, Doc.
Math. 18 (2013), Theorem 9.2, which also gives that `π₁(M)` is LERF and large; `[Kir97, Problem
3.51]`), and the **virtual Haken theorem** for closed hyperbolic `3`-manifolds
(`TauCeti.VirtualHakenConjecture`, Agol, Theorem 9.1 in the aspherical form, of which the hyperbolic
case is the one stated natively). Prove that a closed `3`-manifold that fibers over the circle with
fibre of genus at least one is Haken (the fibre is incompressible), so that the fibering theorem
implies the Haken one, and that a space that fibers over the circle has `π₁` surjecting onto `ℤ`,
so that a closed manifold with finite fundamental group is not virtually fibered. State the
aspherical form as a target: a closed `3`-manifold with `π_k(M) = 0` for all `k ≥ 2` is virtually
Haken (Agol, Theorem 9.1).

- Agol (fibering): `∀ M` closed hyperbolic, `IsVirtuallyFibered M`.
- Agol (Haken): `VirtualHakenConjecture`; and for aspherical `M`, `IsVirtuallyHaken M`.
- `FibersOverCircle M → ∃ x, Function.Surjective (π₁(M, x) → ℤ)`; `IsVirtuallyFibered M` implies
  `π₁(M)` infinite.

**Checks.**

- `Σ₂ × S¹` fibers over the circle (the mapping torus of the identity of `Σ₂`), so it is virtually
  fibered through the identity cover (`TauCeti.FibersOverCircle.isVirtuallyFibered`); it is not
  hyperbolic (its `π₁` contains `ℤ²`), so the theorem's hypothesis is not necessary for its
  conclusion.
- `S³` is not virtually fibered: every connected finite cover of `S³` is `S³`, whose `π₁` is
  trivial and does not surject onto `ℤ`; the lens space `L(5, 1)` likewise has finite `π₁`.
- The Weeks manifold is hyperbolic and not Haken, so the finite cover provided by the theorem is a
  proper cover; a closed hyperbolic manifold with `b₁ > 0` need not fiber itself (there are closed
  hyperbolic manifolds with `b₁ = 1` that do not fiber), so "virtually" is not removable.
- Agol's Theorem 9.2 is stated for closed hyperbolic manifolds; the figure-eight complement, which
  is cusped, fibers over the circle directly (it is the mapping torus of an Anosov map of the
  punctured torus), and the theorem does not apply to it as stated.

### Examples

The round spheres and flat tori for volume; the genus-two surface for the failure of rigidity in
dimension two; the Weeks manifold and the figure-eight complement for volumes; `Σ₂ × S¹` and `S³`
for fibering.

### Dependencies

Mathlib's Riemannian bundles and measure theory; HopfRinow Layer 1 (connection) and Layer 4
(isometries); the native volume, hyperbolic, Mostow, finite-volume, mapping-torus, finite-cover,
virtually fibered and virtually Haken declarations of the supplier contracts; Layer 5 for the
Weeks filling; Layer 4 for the Whitehead link.

## Layer 8: Thurston geometries and the JSJ / geometric decomposition

### 8.1 The eight model geometries and geometric structures

Consume `TauCeti.ModelGeometry`, the inductive type with the eight constructors `spherical`,
`euclidean`, `hyperbolic`, `sphereProd` (`S² × ℝ`), `hyperbolicProd` (`ℍ² × ℝ`), `sl2Tilde`, `nil`
and `sol`, each with its model space `G.Space` and isometry group, and
`TauCeti.HasGeometricStructure M G`: `M` is homeomorphic to `G.Space / Γ` for a subgroup `Γ` of
`Isom(G.Space)` acting freely and properly discontinuously (Scott, *The geometries of 3-manifolds*,
Bull. London Math. Soc. 15 (1983), Sections 1 and 4; Thurston, Sections 3.4 and 3.8); the lens
spaces are spherical natively (`TauCeti.LensSpace.hasGeometricStructure_spherical`). Prove the
comparison with the metric description: for a closed `3`-manifold, `HasGeometricStructure M G`
holds exactly when `M` carries a complete locally homogeneous Riemannian metric locally isometric
to `G.Space` (Thurston, Section 3.4, the developing map), and in particular
`HasGeometricStructure M hyperbolic ↔ IsHyperbolic M`. Prove that a closed `3`-manifold has at
most one of the eight geometries (Scott, Section 5), that six of them (all but `hyperbolic` and
`sol`) are the geometries of Seifert fibred spaces (Scott, Sections 4 and 5), and that the closed
`sol` manifolds are the torus bundles over the circle with Anosov monodromy and their quotients
(Scott, Section 4).

- `HasGeometricStructure` is invariant under homeomorphism, holds for `G.Space` itself and for
  every free properly discontinuous quotient.
- A geometric structure makes `M` an `(Isom X, X)`-manifold, hence smooth with a Riemannian metric
  (`TauCeti.HasGeometricStructure.exists_hasGroupoid`).
- The geometry of a closed geometric `3`-manifold is determined by its fundamental group: finite
  for `spherical`, virtually `ℤ³` for `euclidean`, and so on through Scott's table.

**Checks.**

- `E³/ℤ³ = T³` has a Euclidean structure: `ℤ³` acts freely and properly discontinuously by
  translations. The group `{±I} ⊆ Isom(E³)` is discrete but `−I` fixes the origin, so the action is
  not free and `E³/{±I}`, the cone on `ℝP²`, is excluded by the definition; it is not a manifold
  (the link of the vertex is `ℝP²`, with `H₁ = ℤ/2`, not a sphere).
- `S³/(ℤ/p)` acting by `(z, w) ↦ (ζz, ζ^q w)` is the lens space `L(p, q)`, spherical (native);
  `S² × S¹` is `(S² × ℝ)/ℤ`, with the `sphereProd` geometry, and is not spherical since its `π₁` is
  infinite.
- `T³` has the Euclidean geometry and not the hyperbolic one (7.2), so the "at most one geometry"
  statement is consistent; `S³` has the spherical geometry and no other, since every other model
  space is non-compact and a quotient of it by a free action has infinite `π₁`.

### 8.2 The prime decomposition

Define a closed connected `3`-manifold to be **prime** when it is not a connected sum of two
manifolds neither of which is `S³`, and **irreducible** when every embedded locally flat `2`-sphere
bounds a ball (`TauCeti.IsSphereBoundsBall`, native). Prove that `S¹ × S²` is prime and not
irreducible, and that every other closed orientable prime `3`-manifold is irreducible (Hatcher,
*Notes on Basic 3-Manifold Topology*, Proposition 1.4). State and prove the **Kneser–Milnor prime
decomposition theorem**: every closed connected orientable `3`-manifold `M` is a connected sum
`P₁ # ⋯ # P_n` of prime `3`-manifolds, and the factors are unique up to order and diffeomorphism,
after discarding `S³` summands (Hatcher, Theorem 1.5 and its proof: existence by Kneser's finiteness through a
triangulation, uniqueness by Milnor). The
connected sum is Layer 1's; the decomposition is a theorem about it, not a new object.

- Every closed orientable `3`-manifold is a finite connected sum of primes; `n = 0` for `S³`.
- Uniqueness: two prime decompositions have the same multiset of factors up to diffeomorphism.
- `π₁(P₁ # ⋯ # P_n) ≅ π₁(P₁) * ⋯ * π₁(P_n)` (1.4), so the free-product decomposition of `π₁` is
  determined by the prime decomposition.

**Checks.**

- `S³` has the empty decomposition and `M # S³ = M`, which is why `S³` summands are discarded in
  the uniqueness statement; `S¹ × S²` is prime with `π₁ = ℤ`, and `(S¹ × S²) # (S¹ × S²)` has
  `π₁` free of rank two, not prime.
- `L(2, 1) # L(3, 1)` has `π₁ = C₂ * C₃` and exactly two prime factors; the decomposition
  `L(2, 1) # L(3, 1) # S³` is the same decomposition.
- The Poincaré sphere is prime and irreducible with finite `π₁`; `T³` is prime and irreducible
  with `π₁ = ℤ³`; neither decomposes further, and both are their own single JSJ piece (8.3).

### 8.3 Incompressible tori, Seifert fibred spaces and the JSJ theorem

Consume `TauCeti.IsIncompressible f` (a topological embedding injective on `π₁` at every base
point), `TauCeti.IsSeifertFibration r` and `TauCeti.IsSeifertFibered M` (a decomposition into
circles with the model fibred solid tori `V(p, q)` as local models; the solid torus and
`F × S¹` are Seifert fibred natively), `TauCeti.IsPeripheralTorus S` (the end of a closed embedding
of `T² × [0, ∞)`), `TauCeti.IsAtoroidal N` (every locally flat incompressible torus is peripheral;
for compact `N` this says there is none), `TauCeti.IsTorusDecomposition T` (a finite family of
disjoint locally flat incompressible tori whose complementary components are Seifert fibred or
atoroidal), `TauCeti.IsJSJDecomposition T` (a torus decomposition no proper subfamily of which is
one) and the native statement `TauCeti.JSJTheorem`: every closed orientable irreducible
`3`-manifold has a JSJ decomposition, and any two are related by an ambient isotopy carrying the
union of the tori of one onto the union of the tori of the other. State the **JSJ theorem** as that
proposition (Jaco–Shalen, Mem. AMS 220 (1979); Johannson, LNM 761 (1979); Hatcher, Theorem 1.9).
Prove the facts the theorem's use needs: the number of tori of a JSJ decomposition is an invariant
(`TauCeti.JSJTheorem.card_eq`), a closed Seifert fibred or atoroidal manifold has the empty JSJ
decomposition (`TauCeti.isJSJDecomposition_of_isEmpty`), and a compact Seifert fibred manifold is
irreducible unless it is `S¹ × S²`, the non-orientable `S²`-bundle over `S¹` or `ℝP³ # ℝP³`
(Hatcher, Proposition 1.12).

- `JSJTheorem`: existence and uniqueness up to ambient isotopy of minimal torus decompositions of
  closed orientable irreducible `3`-manifolds.
- The pieces of a JSJ decomposition are the connected components of the complement of the tori,
  open in `M`, each Seifert fibred or atoroidal.
- Minimality is part of the definition: a torus decomposition with a redundant torus is not a JSJ
  decomposition.

**Checks.**

- `T³` with the empty family is a torus decomposition (`T³ = T² × S¹` is Seifert fibred); `T³` with
  one coordinate torus is also a torus decomposition (the complement `T² × (0, 1)` is Seifert
  fibred), but its empty subfamily is a torus decomposition, so it is not a JSJ decomposition.
  Only the empty family is, which is the uniqueness the theorem asserts; a definition without the
  minimality law would make the two families both "canonical".
- A closed hyperbolic `3`-manifold is atoroidal (every incompressible torus would give a `ℤ²` in
  `π₁`), so its JSJ decomposition is empty; the Weeks manifold is its own single piece.
- Glue two trefoil exteriors along their boundary tori by a diffeomorphism sending the Seifert
  fibre of one to a curve transverse to the fibre of the other: the resulting closed manifold has
  the glued torus as its unique JSJ torus, with two Seifert fibred pieces; the family with no tori
  is not a torus decomposition, since the glued manifold is neither Seifert fibred nor atoroidal.

### 8.4 Geometrization and the Poincaré conjecture

Consume `TauCeti.IsGeometricTorusDecomposition T` (a finite family of disjoint locally flat
incompressible tori whose complementary components are Seifert fibred or hyperbolic of finite
volume, `TauCeti.IsFiniteVolumeHyperbolic` on the open pieces) and the native statement
`TauCeti.GeometrizationConjecture`: every closed orientable irreducible `3`-manifold has a
geometric torus decomposition. State the **geometrization theorem** as that proposition (Thurston's
conjecture, `[Kir97, Problem 3.45]`; Perelman, arXiv:math/0211159, math/0303109, math/0307245;
Morgan–Tian, *Ricci Flow and the Poincaré Conjecture*, for the Poincaré case; the formulation is
that of Bessières–Besson–Boileau–Maillot–Porti, *Geometrisation of 3-manifolds*, Introduction).
Prove the comparison with Thurston's eight-geometry formulation: the interior of each piece of a
geometric torus decomposition carries a complete finite-volume geometric structure modelled on one
of the eight geometries, Seifert fibred pieces on one of the six Seifert geometries according to
the sign of the orbifold Euler characteristic of the base and the Euler number of the fibration
(Scott, Sections 4 and 5), and conversely (closed `sol` manifolds are cut along a fibre
torus into `T² × (0, 1)`, which is Seifert fibred). Prove that the prime decomposition (8.2)
reduces every closed orientable `3`-manifold to irreducible ones and `S¹ × S²`, so that the
theorem describes all of them. Derive the **Poincaré conjecture**: a closed simply connected
`3`-manifold is diffeomorphic to `S³`. The route: a simply connected closed `3`-manifold is
orientable, prime (van Kampen and 8.2) hence irreducible (8.2, since `S¹ × S²` is not simply
connected), and atoroidal (no `π₁`-injective torus), so its geometric torus decomposition is empty
and it is Seifert fibred or hyperbolic; a hyperbolic closed manifold has infinite `π₁`, and a simply
connected Seifert fibred space is `S³` (Scott, Section 3, the classification of Seifert fibred
spaces with finite fundamental group).

- `GeometrizationConjecture`: `∀ M` closed orientable irreducible, `∃ n T,
  IsGeometricTorusDecomposition T`.
- Each piece of a geometric torus decomposition is Seifert fibred or finite-volume hyperbolic;
  Thurston's form: each piece carries one of the eight geometries with finite volume.
- Poincaré: `∀ M` closed smooth `3`-manifold with `SimplyConnectedSpace M`, `M ≃ₘ S³`.

**Checks.**

- `S³` is Seifert fibred (the Hopf fibration), so the empty family is a geometric torus
  decomposition of it, and `S³` is spherical; `T³` is Seifert fibred with the empty decomposition
  and Euclidean; the Weeks manifold is hyperbolic with the empty decomposition.
- The product `Σ₂ × S¹` is Seifert fibred, with the `ℍ² × ℝ` geometry (base of negative orbifold
  Euler characteristic, Euler number `0`); the unit tangent bundle of `Σ₂` is Seifert fibred with
  the `sl2Tilde` geometry (nonzero Euler number); both have the empty decomposition.
- A torus bundle over the circle with Anosov monodromy is a closed `sol` manifold; it is not
  Seifert fibred, and its fibre torus is a geometric torus decomposition with one torus and one
  piece `T² × (0, 1)`, Seifert fibred. So the native formulation and Thurston's formulation agree
  on it, through different descriptions.
- The Poincaré sphere has `π₁` of order `120`, so it is not simply connected; it is Seifert fibred
  with the spherical geometry, a homology sphere to which the Poincaré conjecture does not apply.
  `S² × S¹` has `π₁ = ℤ`. Only `S³` satisfies the hypothesis, which is the content of the theorem.

### Examples

`T³`, the Weeks manifold, two glued trefoil exteriors and the Anosov torus bundle as JSJ and
geometric examples; the lens spaces as spherical manifolds; the Poincaré sphere as a spherical
non-simply-connected manifold.

### Dependencies

Layer 1 (connected sum), Layer 5 (torus exteriors), Layer 7 (hyperbolic structures); the native
model geometries, geometric structures, irreducibility, incompressibility, Seifert fibrations, JSJ
and geometrization declarations of the supplier contracts.

## Layer 9: Heegaard splittings and Heegaard genus

### 9.1 Handlebodies and Heegaard splittings

Define the **handlebodies of genus `g`**: `H_g^+`, the orientable one, as `D³` with `g` orientable
`1`-handles attached (1.2), equivalently the boundary connected sum of `g` solid tori; and `H_g^−`,
the non-orientable one, as `D³` with `g` `1`-handles of which at least one is attached by an
orientation-reversing map (Scharlemann, *Heegaard splittings of compact 3-manifolds*, Section 1:
for `g ≥ 1` there are exactly two handlebodies of genus `g` up to diffeomorphism, since any other
non-orientable handle can be slid over a non-orientable one). Prove that `∂H_g^±` is a closed
connected surface, orientable of genus `g` for `H_g^+`, and that `π₁(H_g^±)` is free of rank `g`.
Define a **Heegaard splitting** of a closed connected `3`-manifold `M` as a pair of handlebodies
`H₁, H₂` of the same genus `g` and type, together with a diffeomorphism `φ : ∂H₁ ≃ₘ ∂H₂` and a
diffeomorphism `M ≃ₘ H₁ ∪_φ H₂` (1.2; the gluing map is an element of `Diff(∂H₁, ∂H₂)` of Layer
3, and no mapping class group is needed); its genus is `g`. Prove **existence**: every closed
connected `3`-manifold has a Heegaard splitting, with orientable handlebodies exactly when `M` is
orientable (Scharlemann, Section 2.1: from a triangulation, Moise's theorem, 11.2, take regular
neighbourhoods of the `1`-skeleton and of the dual `1`-skeleton).

- A Heegaard splitting of genus `g` presents `M` as two handlebodies glued along a closed surface
  of genus `g`; the splitting surface is bicollared.
- Existence for every closed connected `3`-manifold, orientable or not.
- A union of two orientable handlebodies along a connected closed surface is orientable, so
  non-orientable `M` needs `H_g^−`.

**Checks.**

- `S³ = D³ ∪_{id} D³` is the genus-zero splitting; `S³ = (S¹ × D²) ∪ (D² × S¹)` glued by the
  exchange of factors is the genus-one splitting; `S¹ × S²` is the genus-one splitting glued by the
  identity; the lens space `L(p, q)` has a genus-one splitting whose gluing map sends the meridian of one
  solid torus to the `(p, q)` curve of the other.
- `ℝP² × S¹` is closed and non-orientable; it has no splitting into orientable handlebodies, since
  the union of two orientable handlebodies along a connected surface is orientable, so every
  splitting of it uses the handlebodies `H_g^−`. Its fundamental group `ℤ/2 × ℤ` has rank `2`, so
  its Heegaard genus is at least `2` (9.2).
- A splitting with handlebodies of different genera is excluded by the definition: `∂H_g` and
  `∂H_h` are not diffeomorphic for `g ≠ h`, so no gluing map exists.

### 9.2 Heegaard genus, rank and Li's theorem

Define the **Heegaard genus** `g(M)` of a closed connected `3`-manifold as the least genus of a
Heegaard splitting (a `Nat.find` on the existence theorem of 9.1, so the minimum is over a
nonempty set and never silently `0`). Prove that a Heegaard splitting of genus `g` presents
`π₁(M)` as a quotient of the free group of rank `g` (van Kampen, with `H₂` attached as `2`- and
`3`-handles), so that `π₁(M)` is finitely generated and `rank π₁(M) ≤ g(M)`, where the rank is
`Group.rank` with the `Group.FG` instance obtained this way. State **Li's theorem**: there is a
closed orientable hyperbolic `3`-manifold with `rank π₁(M) < g(M)`, and for every `k` there is one
with `g(M) − rank π₁(M) ≥ k` (Li, *Rank and genus of 3-manifolds*, J. Amer. Math. Soc. 26 (2013),
Theorem 1.1: a closed orientable hyperbolic `3`-manifold with rank smaller than genus, the
discrepancy being arbitrarily large; the bounded version, Theorem 1.2, gives a compact irreducible
atoroidal `M` with connected boundary and `r(M) < g(M)`); this answers Waldhausen's rank-versus-genus
question in the negative.

- `g(M)` is a natural number, `g(S³) = 0`, and `g(M) = 0` only for `S³`.
- `π₁(M)` is finitely generated and `rank π₁(M) ≤ g(M)`.
- Li: `∀ k, ∃ M` closed orientable hyperbolic with `g(M) − rank π₁(M) ≥ k`; in particular
  `∃ M, rank π₁(M) < g(M)`.

**Checks.**

- `S³`: `g = 0`, `rank = 0`. Lens spaces and `S¹ × S²`: `g = 1` and `rank = 1` (cyclic nontrivial
  `π₁`). `T³`: `g = 3 = rank ℤ³`, so the inequality is an equality in all these cases, and the gap
  of Li's theorem is a strict statement about other manifolds.
- The Poincaré sphere: `π₁` the binary icosahedral group, of rank `2`, and `g = 2` (it is
  `+1` surgery on the trefoil, a genus-two manifold, and not a lens space).
- With `k = 1`, Li's theorem gives `g − rank ≥ 1`, that is `rank < g`; with `k = 2` it gives a
  manifold whose genus exceeds its rank by at least two, which the `k = 1` statement does not
  provide, so the quantified form is strictly stronger than the existential one.

### Examples

The genus-zero and genus-one splittings of `S³`, the genus-one splittings of `S¹ × S²` and the lens
spaces, `ℝP² × S¹` as the non-orientable case, and `T³` with `g = rank = 3`.

### Dependencies

Layer 1 (handle attachment, gluing), Layer 3 (surface diffeomorphisms as gluing maps), Layer 7
(hyperbolic manifolds for Li's theorem), Layer 11 (Moise's triangulation theorem for existence);
Mathlib's `Group.rank` and `FundamentalGroup`.
## Layer 10: foliations and their Euler class

### 10.1 Codimension-one foliations and tautness

Consume `TauCeti.Foliation I n M k`, a `Cⁿ` foliation of rank `k` of a `C^{n+1}` manifold given by
its involutive `Cⁿ` tangent distribution (`1 ≤ n`), with the leaves, flat charts and the Frobenius
theorem of DifferentialGeometry Layer 4. A **codimension-one foliation** of a `3`-manifold is a
`Foliation I n M 2`; define its **transverse orientation** as an orientation of the normal line
bundle `TM/TF`, and a foliation to be **transversely oriented** when one is chosen. Define a
foliation `F` of a closed `3`-manifold to be **taut** when every leaf meets a closed transversal,
a smooth closed curve everywhere transverse to the leaves (Calegari, *Foliations and the Geometry
of 3-Manifolds*, Chapter 4; Candel–Conlon, *Foliations I*). Define a
**Reeb component** (a solid torus foliated by planes spiralling to the boundary torus leaf) and
prove that a foliation with a Reeb component is not taut (the boundary torus meets no closed
transversal, since a transversal entering the component cannot leave it; Calegari, Chapter 4).
Prove that the tangent plane field `TF` of a transversely oriented foliation of an oriented
`3`-manifold is an oriented plane bundle, the input of 10.2.

- A taut foliation has no Reeb component and every leaf is incompressible (Novikov; Calegari,
  Chapter 4, cited as background, not a target).
- Tautness is invariant under diffeomorphism and reversal of the transverse orientation.
- `TF` is an oriented rank-two subbundle of `TM` when `M` and `F` are oriented.

**Checks.**

- The product foliation of `S² × S¹` by the spheres `S² × {t}` is taut: `{pt} × S¹` is a closed
  transversal meeting every leaf; it has no Reeb component, and its leaves are spheres, which is
  allowed by the definition.
- The Reeb foliation of `S³` (two Reeb components glued along the torus leaf) is not taut.
- The linear foliation of `T³` by planes of irrational slope is taut, with a closed transversal
  given by a circle direction not in the plane; its leaves are dense planes, so tautness does not
  require compact leaves.
- A foliation of a closed `3`-manifold by circles (a Seifert fibration with all fibres regular) is
  a rank-one foliation, excluded from codimension one by the rank in `Foliation I n M k`.

### 10.2 The Euler class of an oriented plane bundle

Define the **Euler class** `e(E) ∈ H²(X; ℤ)` of an oriented real rank-two vector bundle `E → X`
over a CW complex (or a manifold) as the primary obstruction to a nowhere-vanishing section: the
class of the cocycle that assigns to a `2`-cell the degree of the section on its boundary, built
with a section over the `1`-skeleton (Milnor–Stasheff, *Characteristic Classes*, Chapter 12;
Hatcher, *Vector Bundles and K-Theory*, Section 3, the obstruction-theoretic definition). This
construction is this roadmap's; CharacteristicClasses C2 compares its rank-two Euler class with it.
Prove: naturality under pullback and bundle maps; `e(E) = 0` when `E` has a nowhere-vanishing
section; `e(Ē) = −e(E)` for the opposite orientation; `e(E ⊕ F) = e(E) ∪ e(F)` for oriented plane
bundles over a space where both are defined; and, for a closed oriented surface `S`,
`⟨e(TS), [S]⟩ = χ(S)` (Milnor–Stasheff, Corollary 11.12, for the tangent bundle). Define the
**Euler class of a transversely oriented foliation** `F` of a closed oriented `3`-manifold as
`e(F) := e(TF)`, and the **pairing** `⟨e(F), [S]⟩ ∈ ℤ` with the fundamental class of an embedded
closed oriented surface `S`, through AlgebraicTopology's cohomology and fundamental classes.

- `e` is a natural characteristic class of oriented plane bundles, with `e(trivial) = 0` and
  `e(TS²) ≠ 0`.
- `⟨e(TS), [S]⟩ = χ(S)` for every closed oriented surface; `⟨e(F), [S]⟩` depends only on the
  homology class of `S`.
- Reversing the orientation of `M` or the transverse orientation of `F` negates `e(F)`.

**Checks.**

- `e(TS²)` evaluates to `χ(S²) = 2` and `e(TT²) = 0 = χ(T²)`; the trivial plane bundle over `S²`
  has `e = 0 ≠ e(TS²)`, so `TS²` is not trivial (the hairy ball theorem as a corollary).
- For the product foliation of `S² × S¹`, `TF` restricted to a sphere leaf is `TS²`, so
  `⟨e(F), [S² × pt]⟩ = 2`; for the foliation of `T³` by tori `T² × pt`, the pairing with a torus
  leaf is `0`.
- The Hopf plane bundle over `S²` (the tautological bundle of `ℂP¹`, as a real plane bundle) has
  `e = ±1` times the generator, half of `e(TS²)` in absolute value, so the Euler class of `TS²`
  is twice a generator; this is the parity phenomenon of 10.4.

### 10.3 The Thurston norm

Define, for a closed oriented `3`-manifold `M` and a class `a ∈ H₂(M; ℤ)`, the **Thurston norm**
`x(a) := min χ₋(S)` over closed embedded oriented surfaces `S ⊆ M` with `[S] = a`, where
`χ₋(S) = Σ_i max(0, −χ(S_i))` over the components; prove that every class is represented by an
embedded oriented surface (Poincaré duality and transversality to a map to `S¹`), so the minimum
exists, and that `x` extends to a seminorm on `H₂(M; ℝ)`, linear on rays and convex (Thurston, *A
norm for the homology of 3-manifolds*, Mem. AMS 59 (1986), Theorem 1; Yazdi, *On Thurston's
Euler class one conjecture*, Section 1). Define the **dual norm** `x*(e) := sup {⟨e, a⟩ : x(a) ≤ 1}`
on `H²(M; ℝ)`, possibly `+∞` when `x` is only a seminorm, and state that the unit ball of `x` is a
finite-sided polyhedron whose dual ball has integral vertices (Thurston, Theorem 2).

- `x(ka) = |k| x(a)`, `x(a + b) ≤ x(a) + x(b)`, `x(0) = 0`; `x` is a norm exactly when no nonzero
  class is represented by a union of spheres and tori.
- `x*` is a norm on the quotient of `H²(M; ℝ)` by the annihilator of the kernel of `x`; its unit
  ball is the convex hull of finitely many integral points.
- `x(a)` is attained by an incompressible surface with no sphere components (Thurston, Section 2).

**Checks.**

- `x([S²]) = 0` for a sphere class, since `χ₋(S²) = max(0, −2) = 0`; on `S² × S¹` the class
  `[S² × pt]` is nonzero with norm `0`, so `x` is a seminorm and not a norm there, and `x*` is
  infinite on classes pairing nontrivially with it.
- On `Σ₂ × S¹`, `x([Σ₂ × pt]) = 2 = −χ(Σ₂)`, and the class of `γ × S¹` for a simple closed curve
  `γ` on `Σ₂` is a torus class of norm `0`; on `S³`, `H₂ = 0` and `x` is the zero norm on the zero
  space.
- A disconnected representative `S₁ ⊔ S₂` with `χ(S₁) = −2` and `χ(S₂) = +2` (a sphere) has
  `χ₋ = 2`, not `|χ(S)| = 0`; the definition with `χ₋` is what makes spheres free and what makes
  `x` a seminorm, while the definition with `|χ|` would not be subadditive.

### 10.4 Thurston's inequality and Yazdi's theorem

State **Thurston's inequality**: for a taut transversely oriented foliation `F` of a closed
oriented irreducible `3`-manifold `M` and every closed embedded oriented surface `S`,
`|⟨e(F), [S]⟩| ≤ |χ(S)|`, and in terms of the norms, `|⟨e(F), a⟩| ≤ x(a)` for every
`a ∈ H₂(M; ℤ)`, that is `x*(e(F)) ≤ 1` (Thurston, Mem. AMS 59 (1986), Section 3;
Yazdi, Section 1, inequalities (1) and (2), and Section 3.3 for the proof through the Roussarie–
Thurston general position of an incompressible surface with respect to `F`, which gives
`|χ(S)|` saddle tangencies). The irreducibility hypothesis is where sphere leaves are excluded: the
norm form fails on `S² × S¹` (10.3). Define the **parity condition**: an integral class
`a ∈ H²(M; ℤ)` satisfies it when `a ∈ 2H²(M; ℤ)`; prove that the Euler class of every oriented
plane field on a closed oriented `3`-manifold satisfies it (Yazdi, Definition 1.1 and Proposition
3.12). State **Gabai's realization theorem**: for a compact oriented irreducible `3`-manifold,
possibly with toral boundary, every vertex `a` of the dual unit ball is the Euler class of a taut
foliation (Yazdi, Theorem 1.2, attributed to Gabai; Gabai–Yazdi, *The fully marked surface theorem*,
for the proof). State the **Euler class one conjecture** of Thurston as the statement it is: for a
closed orientable irreducible atoroidal `M`, every integral class with `x*(a) = 1` satisfying the
parity condition is the Euler class of a taut foliation (Yazdi, the Euler Class One Conjecture of
Section 1). State **Yazdi's theorem**, its negation: there are infinitely many closed hyperbolic
`3`-manifolds `M` with an integral class `a ∈ H²(M; ℤ)`, `x*(a) = 1`, satisfying the parity
condition, which is the Euler class of no taut foliation of `M` (Yazdi, Main Theorem; the examples
are Dehn surgeries on fibered hyperbolic manifolds with `b₁ = 2`, and the fully marked surface
theorem of Gabai–Yazdi removes the conditional hypothesis of the first paper).

- Thurston: `|⟨e(F), [S]⟩| ≤ |χ(S)|` for every closed embedded oriented `S`; `x*(e(F)) ≤ 1`.
- Yazdi: `∃` infinitely many closed hyperbolic `M` and `a` with `x*(a) = 1`, `a ∈ 2H²`, and
  `∀ F` taut transversely oriented, `e(F) ≠ a`.
- Gabai: every vertex of the dual unit ball is realised.

**Checks.**

- A sphere `S` bounding a ball in `M`: `[S] = 0`, `⟨e(F), [S]⟩ = 0`, `|χ(S)| = 2` and `x([S]) = 0`,
  so both forms hold as `0 ≤ 2` and `0 ≤ 0`; a bound of the form `|⟨e(F), [S]⟩| ≤ −χ(S)` would
  read `0 ≤ −2` and fail, so the absolute value is part of the statement.
- A torus leaf `T` of a taut foliation: `|χ(T)| = 0`, so `⟨e(F), [T]⟩ = 0`; for the foliation of
  `T³` by tori this agrees with 10.2.
- The product foliation of `S² × S¹`: `⟨e(F), [S² × pt]⟩ = 2 = |χ(S²)|`, so the first form holds
  with equality, while `x([S² × pt]) = 0 < 2`, so the norm form fails; `S² × S¹` is reducible, and
  the irreducibility hypothesis of the norm form is used.
- On `Σ₂ × S¹` with the foliation by surfaces `Σ₂ × pt`, `⟨e(F), [Σ₂ × pt]⟩ = χ(Σ₂) = −2` and
  `x([Σ₂ × pt]) = 2`, so the norm form holds with equality, as it must when a leaf is a norm-minimizing
  surface (Yazdi, Section 1, the equality case).

### Examples

The product foliations of `S² × S¹`, `T³` and `Σ₂ × S¹`, the Reeb foliation of `S³`, and the
tangent bundles of surfaces for the Euler class.

### Dependencies

DifferentialGeometry Layer 4 and the native `TauCeti.Foliation`; Layer 2 (embedded surfaces as
locally flat submanifolds); AlgebraicTopology (cohomology, fundamental classes, cup products);
Layer 7 (hyperbolic manifolds, for Yazdi's examples) and Layer 5 (the Dehn surgeries that produce
them).

## Layer 11: triangulations, PL structures, and collapse

### 11.1 Polyhedra, simplicial maps and compact subsets

Consume the native polyhedron `AbstractSimplicialComplex.Realization K` (the union of the closed
simplices in `ι →₀ ℝ` with the weak topology, Hausdorff, with `faceInclusion`, barycentric
coordinates, the `carrier` of a point and the `vertex` points), the realization of simplicial maps
`PreAbstractSimplicialComplex.SimplicialMap.realizationMap` (affine on each simplex, functorial,
a homeomorphism for mutually inverse maps), the facts that a finite complex has compact
realization with the coordinate map a closed embedding, that finite vertex stars give local
compactness and the coordinate topology, that subcomplexes realize to closed embeddings, that
`|K|` is the quotient of the disjoint union of its closed simplices, and that homotopies glue from
the closed simplices; the links and stars `PreAbstractSimplicialComplex.link`, the ordered products
`orderedProd` and cylinders `orderedCylinder`. Prove the remaining API: the **restriction** of `K`
to a subset `V` of its vertices (the faces contained in `V`, as a complex on the subtype) realizes
to a closed embedding; **every compact subset of `|K|` lies in the realization of a finite
subcomplex** (a compact set meets only finitely many open simplices, as for CW complexes, Hatcher,
*Algebraic Topology*, Proposition A.1, with the same proof for the weak topology on `|K|`), so that
a continuous map from a compact space into `|K|` factors through a finite subcomplex; the
realization of the combinatorial cone on `K` contracts onto its apex by the affine homotopy, fixing
the apex (the glued homotopies of `Realization/Homotopy.lean`); and `|orderedProd K L|` is
homeomorphic to `|K| × |L|` for finite `K, L` (Rourke–Sanderson, Chapter 2).

- `|K|` is Hausdorff, compactly generated, and the colimit of its finite subcomplexes.
- A compact subset meets finitely many open simplices; `|K|` is compact if and only if `K` is finite.
- Simplicial maps realize functorially and injectively exactly when the vertex map is injective.

**Checks.**

- A single closed triangle: compact, realization homeomorphic to `Δ²`, with `3` vertices, the
  finite subcomplex needed being `K` itself.
- The infinite wedge of edges `{v₀, vₙ}`, `n ≥ 1`: the set of midpoints of the edges is closed and
  discrete (its intersection with each closed simplex is at most one point) and infinite, so not
  compact; a compact subset of this complex lies in finitely many edges.
- The bottom complex on an infinite vertex type realizes to a discrete infinite space
  (`realizationBotHomeomorph`), not compact, while the bottom complex on `Fin 3` is three points.
- The ordered square `orderedProd Δ¹ Δ¹` has two triangles (`fst ≤ snd` and `snd ≤ fst`) and
  realizes to a square; the four vertices do not span a tetrahedron, as the chain condition
  enforces.

### 11.2 Triangulations, the CW structure of a polyhedron, Moise and Manolescu

Consume `TauCeti.IsTriangulable X` (`X` is homeomorphic to the realization of some abstract
simplicial complex, in any vertex universe), invariant under homeomorphism, holding for
realizations and discrete spaces. Prove that for compact `X` the vertex universe does not matter:
a triangulation of a compact space is by a finite complex (11.1), which relabels onto a complex on
`Fin k`. Define the **CW structure of an ordered polyhedron**: for a complex `K` with a map
`o : ι → α` into a linear order that is injective on every face, a classical
`Topology.CWComplex (univ : Set |K|)` whose `n`-cells are the `n`-simplices, the characteristic map
of a simplex `σ = {v₀ < ⋯ < vₙ}` (in the order `o`) being the orientation-preserving homeomorphism
from the closed unit ball of `ℝⁿ` onto the standard simplex that is radial from the barycentre and
sends the `i`-th vertex of the standard simplex to `vᵢ`, followed by the affine map into `|K|`;
prove that simplicial maps are cellular, that an injective simplicial map preserving `o` on each
face carries characteristic maps to characteristic maps, and that the cellular chain complex of
this structure is the ordered simplicial chain complex: the cellular boundary of
`[v₀, …, vₙ]` is `Σ_j (−1)^j [v₀, …, v̂_j, …, vₙ]` (Hatcher, *Algebraic Topology*, Section 2.2,
Theorem 2.35 and the cellular boundary formula). This is what the cellular theory of
AlgebraicTopology applies to polyhedra and what ClassifyingSpaces consumes for countable joins.
State **Moise's theorem**: every compact `3`-manifold is triangulable, and any two triangulations
of a `3`-manifold have a common subdivision (Moise, *Geometric Topology in Dimensions 2 and 3*,
GTM 47, Theorems 35.3 and 36.2; Hatcher, *Notes on Basic 3-Manifold Topology*, the introduction),
so that in dimension at most three triangulable, PL and smooth structures coincide. State
**Manolescu's theorem**: for every `n ≥ 5` there is a closed connected topological `n`-manifold
(`TauCeti.IsClosedConnectedManifold n M`) that is not triangulable (Manolescu, *Pin(2)-equivariant
Seiberg–Witten Floer homology and the triangulation conjecture*, J. Amer. Math. Soc. 29 (2016);
*Lectures on the triangulation conjecture*, Theorem 1.1); in dimension four, Freedman's `E₈`
manifold is not triangulable (Casson, as recorded in Manolescu's lectures, Section 1). The route
of Manolescu's theorem is the reduction of Galewski–Stern and Matumoto to the homology cobordism
group and the `β` invariant; this roadmap states the theorem and names that route.

- `IsTriangulable.{v} X ↔ IsTriangulable.{0} X` for compact `X`.
- The ordered polyhedron is a CW complex with one `n`-cell per `n`-simplex and the simplicial
  chain complex as cellular chain complex; simplicial maps are cellular.
- Moise: `IsTriangulable M` for every compact `3`-manifold; Manolescu: `∀ n ≥ 5, ∃ M` closed
  connected `n`-manifold with `¬ IsTriangulable M`.

**Checks.**

- The edge `[ab]` with `a < b` has cellular boundary `b − a`; the triangle `[abc]` has boundary
  `[bc] − [ac] + [ab]`, and `∂∂[abc] = (c − b) − (c − a) + (b − a) = 0`; composing the characteristic
  map of `[ab]` with the reflection of the interval gives boundary `a − b`, which is why the
  characteristic maps are pinned as orientation-preserving maps in the order `o`.
- `|∂Δⁿ⁺¹| ≃ₜ Sⁿ` natively, so `Sⁿ` is triangulable with `n + 2` vertices; `S⁰` is two points
  (`n = 0`), and the formula `S^{n−1}` for `∂Δⁿ` holds for `n ≥ 1` only, since `∂Δ⁰` is void.
- A triangulation of a compact space by a complex on an uncountable vertex type uses only finitely
  many of its vertices, by 11.1, so the universe-free statement loses nothing.
- Manolescu's manifolds exist in every dimension `n ≥ 5`; the statement `∃ M` in dimension `5`
  alone is the case `n = 5` and does not give dimension `6`, so the quantified form is the theorem.

### 11.3 Combinatorial manifolds and the reconciliation with PL manifolds

Consume `PreAbstractSimplicialComplex.IsCombinatorialBall K n` (stellar equivalent, up to
relabelling, to the standard `n`-simplex), `IsCombinatorialSphere K n` (stellar equivalent to the
boundary of the standard `(n+1)`-simplex) and `IsCombinatorialManifold K n`, defined by cases on
`n`: for `n = 0` every vertex has void link, and for `n + 1` the link of every vertex is a
combinatorial `n`-sphere or a combinatorial `n`-ball; the standard simplex and its boundary are
combinatorial manifolds natively, and the realization of a combinatorial manifold is locally
compact. The case split is not cosmetic: with natural-number subtraction the condition at `n = 0`
would ask the void link of a point to be a `0`-sphere or `0`-ball, which it is not, and no
`0`-manifold would satisfy it. Prove the **reconciliation** with Layer 1 (Rourke–Sanderson,
Chapter 3): the realization of a combinatorial `n`-manifold is a PL `n`-manifold with boundary,
`HasGroupoid |K| (PLGroupoid (𝓡∂ n))`, with charts the stars of vertices read through the stellar
equivalences to `Δⁿ` and `∂Δⁿ⁺¹`; and conversely every compact PL manifold is PL homeomorphic to
the realization of a combinatorial manifold. State the facts that keep the three notions apart:
triangulable, combinatorially triangulable (PL) and smoothable are distinct predicates with
implications only in one direction (12.1 gives smooth to PL, 1.5 gives PL to topological); the
Hauptvermutung fails for topological manifolds (Kirby–Siebenmann, *Foundational Essays*, Essay
IV), a triangulation of a manifold need not be combinatorial (the double suspension of a homology
sphere, Edwards and Cannon, as recorded in Kirby–Siebenmann), and recognising combinatorial
spheres is undecidable in dimension at least five (Novikov; Volodin–Kuznetsov–Fomenko).

- The realization of a combinatorial `n`-manifold is a PL `n`-manifold; its boundary is the
  subcomplex of vertices with ball links.
- A compact PL manifold is the realization of a combinatorial manifold.
- `IsCombinatorialManifold K n` implies `dimension K ≤ n`, with equality for nonvoid `K`.

**Checks.**

- A single point is a combinatorial `0`-manifold (void link); two points likewise; the standard
  `1`-simplex is a combinatorial `1`-manifold whose two vertices have one-point links
  (`0`-balls, boundary vertices); `∂Δ²` is a combinatorial `1`-manifold whose vertices have
  two-point links (`0`-spheres, interior vertices).
- The bow-tie (two triangles sharing one vertex) is not a combinatorial `2`-manifold: the shared
  vertex's link is two disjoint edges, neither a `1`-sphere (a circle) nor a `1`-ball (an arc).
- The cone on a triangulated torus is not a combinatorial `3`-manifold: the apex has link a torus,
  not a `2`-sphere or `2`-ball; its realization is not a manifold at the apex.
- The boundary of the octahedron (`6` vertices, `8` triangles) is a combinatorial `2`-sphere: it
  is reached from `∂Δ³` by stellar moves, which is what stellar equivalence allows. The `6`-vertex
  triangulation of `ℝP²` has every vertex link a circle, so it is a combinatorial `2`-manifold
  without boundary, but it is not a combinatorial `2`-sphere: its realization has `H₁ = ℤ/2`,
  while stellar moves preserve the homeomorphism type of the realization.

### 11.4 Collapse, Zeeman's conjecture and the dunce hat

Consume `ElementaryCollapsesTo` (removal of a free face with its unique coface), `CollapsesTo`
(its reflexive transitive closure), `Collapsible K` (collapse to a one-vertex complex), the native
collapse of cones and of the ordered cylinders of cones, `Contractible2Complex K` (finitely many
faces, dimension at most two, contractible realization) and the native statement
`TauCeti.ZeemanConjecture`: for every finite contractible complex `K` of dimension at most two,
the ordered cylinder `orderedCylinder K` is collapsible (Zeeman, *On the dunce hat*, Topology 2
(1964); `[Kir97, Problem 5.2]`). Zeeman's conjecture is open; it is recorded as the native
proposition and nothing is claimed about it, so it is not a theorem of `Suggested.lean`. Prove
that a collapsible complex has contractible realization (each elementary collapse is a strong
deformation retraction, glued by 11.1), and prove **Zeeman's theorem on the dunce hat**: the dunce
hat `D` (a triangle with its three edges identified in the pattern `a a a⁻¹`, triangulated as a
finite `2`-complex) is contractible, has no free face, hence is not collapsible, and `D × I`
collapses to a point (Zeeman, *On the dunce hat*, the main theorem). The triangulated plane and
every infinite complex are excluded from the conjecture by the finiteness in
`Contractible2Complex`.

- Collapsible implies contractible; the converse fails for the dunce hat.
- `ZeemanConjecture` is the universal statement over finite contractible `2`-complexes; its
  conclusion holds for the ordered cylinders of finite cones (native).
- The dunce hat's ordered cylinder is collapsible (Zeeman).

**Checks.**

- `Δ²` collapses to a vertex (remove the triangle through a free edge, then two edges); `∂Δ²` has
  no free face and is not collapsible, and it is not contractible either, consistent with the
  implication.
- The dunce hat has every edge in two or three triangles after the identification, so no free
  face; it is contractible (it is `D²` with its boundary wrapped by a degree-one map), so it is a
  non-collapsible contractible `2`-complex, and Zeeman's conjecture for it is his theorem.
- The triangulated plane is contractible and `2`-dimensional, but has infinitely many faces; it is
  not a `Contractible2Complex`, and no finite sequence of elementary collapses reduces its
  cylinder to a point, so the finiteness hypothesis is not removable.
- The ordered cylinder of a full simplex collapses to the terminal apex
  (`collapsible_orderedCylinder_top`), the conjecture's first positive family.

### Examples

`∂Δⁿ⁺¹ ≃ Sⁿ`, the bow-tie and the cone on the torus as non-manifolds, the dunce hat, and the
ordered square.

### Dependencies

Mathlib's simplicial complexes, CW complexes and the simplicial-set realization; the native
realization, link, product, collapse, combinatorial-manifold, Zeeman and triangulability
declarations of the supplier contracts; Layer 1 (the PL groupoid) for the reconciliation;
AlgebraicTopology's cellular chains.

## Layer 12: the smoothing-and-triangulation comparison

### 12.1 Smooth manifolds are PL manifolds

Prove **Whitehead's theorem**: every smooth manifold admits a smooth triangulation, a combinatorial
manifold `K` with a homeomorphism `|K| → M` that is smooth on each simplex with injective
differential, and any two smooth triangulations of `M` are PL homeomorphic, so that a smooth
manifold has a PL structure (`HasGroupoid M (PLGroupoid I)` through 11.3), unique up to PL
homeomorphism (Whitehead, *On C¹-complexes*, Ann. of Math. 41 (1940); Munkres, *Elementary
Differential Topology*, Annals of Math. Studies 54, Theorems 10.5 and 10.6, for the existence and
uniqueness of smoothings compatible with triangulations). The route is the Cairns–Whitney
construction of a triangulation by a fine ambient simplicial subdivision in general position, and
the uniqueness is Munkres's. This is the item that AlgebraicTopology (compact smooth manifolds
have finite CW type) and AffineMorseLefschetz consume.

- Every smooth manifold is triangulable by a combinatorial manifold, with the triangulation smooth
  on simplices; the induced PL structure is unique up to PL homeomorphism.
- The smooth triangulation can be chosen to refine any locally finite cover and to be compatible
  with a smooth submanifold.
- Compact smooth manifolds have finite CW type (`TauCeti.FiniteCWType`), through 11.2.

**Checks.**

- The circle is triangulated by `∂Δ²` with the map sending the three vertices to three points on
  `S¹` and each edge to the arc between them, radially; it is smooth on each edge with nonzero
  derivative.
- `S²` is triangulated by `∂Δ³` through the radial projection of the tetrahedron, which is smooth
  with injective differential on each closed face; the map that projects the cube's faces is
  another smooth triangulation, and the two are PL homeomorphic (a common subdivision exists).
- The torus `ℝ²/ℤ²` is triangulated by the `9`-vertex complex obtained from the `3 × 3` grid of
  the unit square with diagonals; fewer than `7` vertices cannot triangulate the torus
  (`χ = V − E + F` with `E ≤ V(V − 1)/2` and `3F = 2E` forces `V ≥ 7`).

### 12.2 PL manifolds are topological manifolds

This is the native inclusion `TauCeti.PLGroupoid_le_continuousGroupoid` of 1.5: a PL manifold is a
topological manifold, and a PL homeomorphism is a homeomorphism. Prove that the forgetful map from
PL structures to topological manifolds is compatible with 12.1, so that the composite
smooth → PL → topological is the forgetful map from smooth to topological manifolds.

- Every PL manifold is a topological manifold with the same charts.
- The composite of 12.1 with this forgetful map is the forgetful map from smooth to topological.

**Checks.**

- `TauCeti.doubleRight` is a PL homeomorphism of `ℝ`, hence a homeomorphism; it is not smooth at
  `0` (its derivative jumps from `1` to `2`), so the forgetful map from PL to topological does not
  factor through smooth structures in the sense of 12.1.
- A topological manifold with two PL structures that are not PL homeomorphic (such as the
  `5`-torus with an exotic PL structure, Kirby–Siebenmann) has one topological structure and two
  PL ones, so the forgetful map is not injective.

### 12.3 From topological to PL: the Kirby–Siebenmann obstruction

State the **Kirby–Siebenmann theorem**: a closed topological manifold `M` of dimension `n ≥ 5` has
a PL structure if and only if the Kirby–Siebenmann class `ks(M) ∈ H⁴(M; ℤ/2)` vanishes, and when it
vanishes the PL structures up to concordance are a torsor under `H³(M; ℤ/2)` (Kirby–Siebenmann,
*Foundational Essays on Topological Manifolds, Smoothings, and Triangulations*, Annals of Math.
Studies 88, Essays IV and V); the obstruction lives in `H⁴(M; π₃(TOP/PL))` with `π₃(TOP/PL) ≅ ℤ/2` and is the obstruction
to lifting the classifying map of the stable tangent microbundle from `BTOP` to `BPL`, and the
Hauptvermutung fails because `H³(M; ℤ/2)` can be nonzero. State the low-dimensional facts: in
dimension at most three every topological manifold has a PL structure, unique up to PL
homeomorphism (Moise, 11.2), and in dimension four the obstruction `ks(M)` is defined and
nonzero for Freedman's `E₈` manifold, which has no PL structure (Freedman, 1982; Kirby–Siebenmann,
Essay IV, for the definition of `ks` in all dimensions). The construction of the stable tangent
microbundle and of `BTOP` is named as the input of this section and is not built in this roadmap.

- `ks : {closed topological manifolds} → H⁴(−; ℤ/2)` is natural and vanishes on PL manifolds.
- For `n ≥ 5`, `ks(M) = 0` if and only if `M` admits a PL structure, and the structures are
  counted by `H³(M; ℤ/2)`.
- In dimension at most three `ks` vanishes and the PL structure is unique.

**Checks.**

- The torus `Tⁿ`, `n ≥ 5`, is PL (it is smooth, 12.1), so `ks(Tⁿ) = 0`, and `H³(Tⁿ; ℤ/2) ≠ 0`
  gives it several PL structures up to concordance: the first examples of the failure of the
  Hauptvermutung.
- `S⁵` has `H³(S⁵; ℤ/2) = 0` and `H⁴(S⁵; ℤ/2) = 0`, so it has exactly one PL structure up to
  concordance, consistent with the smooth sphere.
- The `E₈` manifold has `ks = 1`; `E₈ # E₈` has `ks = 0` (the class is additive under connected
  sum) and is still not smoothable, by Donaldson's theorem, which shows that in dimension four
  `ks = 0` does not give a PL structure: the theorem's dimension hypothesis `n ≥ 5` is not
  removable.

### Examples

Triangulations of `S¹`, `S²` and `T²`; `doubleRight`; the tori of dimension at least five; the
`E₈` manifold.

### Dependencies

Layer 1 (the PL groupoid), Layer 11 (combinatorial manifolds, triangulability, the CW structure);
AlgebraicTopology for the cohomology in which `ks` lives. The stable tangent microbundle and
`BTOP` are inputs named by locator only.

## Downstream consumers

- AlgebraicTopology consumes Layer 11's realization API and CW structure and 12.1 (compact smooth
  manifolds have finite CW type); ClassifyingSpaces consumes Layer 11's polyhedra, their weak
  topology and the cellular chains of countable joins; AffineMorseLefschetz consumes Layers 1 and
  11 and 12.1.
- CombinatorialHeegaardFloer Lane K consumes Layer 4's presentations and polynomials and 6.3's
  link cobordisms; KhovanovHomology consumes Layer 4's geometric and diagram presentations, Layer
  1's tubes and Layer 6's link cobordisms; HeegaardFloer consumes Layer 1, Layer 3's weak Whitney
  topology, Layer 9's splittings and 12.1.
- MorseNovikov consumes Layers 1, 3, 4, 5 and 11; MorseTheory consumes the native bicollaring
  theorems of Layer 2.
- PositiveScalarCurvature, GeneralizedCohomology, TopologicalKTheory, RealAnalyticGeometry,
  TaubesGromov and the SymplecticGeometry roadmaps (ContactGeometry, CotangentLagrangian,
  ConvexityToric) consume Layer 1's tubular neighbourhoods, collars, gluing and handle
  attachment.
- CharacteristicClasses consumes Layer 1's tubes, Layer 3's mapping topology and 10.2's plane
  Euler class; OptimalTransport consumes Layer 7's volume; DifferentialGeometry consumes the
  native boundary manifold and volume measure that Layers 1 and 7 build on.

## References

- R. Kirby (ed.), *Problems in Low-Dimensional Topology*, in *Geometric Topology*, AMS/IP Stud.
  Adv. Math. 2.2 (1997): the problem list `[Kir97]`, cited by problem number.
- A. Hatcher, *Notes on Basic 3-Manifold Topology*, author's page: Proposition 1.4, Theorem 1.5
  (prime decomposition), Theorem 1.9 (JSJ), Proposition 1.12 (irreducibility of Seifert fibred
  manifolds), Theorem 2.5 (lens spaces).
- A. Hatcher, *Algebraic Topology*, Cambridge (2002), author's page: Theorem 2.35 and Section 2.2
  (cellular chains), Theorem 3.44 (Alexander duality), Proposition A.1 (compact subsets of CW
  complexes).
- M. Hirsch, *Differential Topology*, Springer GTM 33 (1976): Chapter 2 (function-space topologies
  and approximation), Chapter 3 (transversality), Chapter 4, Section 6 (collars, Theorem 6.1;
  tubular neighbourhoods, Theorems 6.3 and 6.5), Chapter 8 (isotopy, the disc theorem 3.1, and
  gluing).
- J. Lee, *Introduction to Smooth Manifolds*, Springer GTM 218, 2nd ed. (2013): Theorem 9.25
  (collars), Theorem 6.24 (tubular neighbourhoods); *Introduction to Riemannian Manifolds*,
  Springer GTM 176, 2nd ed. (2018): Chapters 2 and 8 (volume, curvature).
- R. Palais, *Extending diffeomorphisms*, Proc. Amer. Math. Soc. 11 (1960) 274–277.
- C. Rourke, B. Sanderson, *Introduction to Piecewise-Linear Topology*, Springer (1972): Chapters
  1–2 (polyhedra, PL maps, products), Chapter 3 (links, combinatorial manifolds, collapse).
- R. Daverman, G. Venema, *Embeddings in Manifolds*, AMS GSM 106 (2009): locally flat and wild
  embeddings. M. Brown, *Locally flat imbeddings of topological manifolds*, Ann. of Math. 75
  (1962) 331–341. R. Kirby, *Stable homeomorphisms and the annulus conjecture*, Ann. of Math. 89
  (1969) 575–582. F. Quinn, *Ends of maps III: dimensions 4 and 5*, J. Differential Geom. 17 (1982).
- J. Cerf, *Sur les difféomorphismes de la sphère de dimension trois (Γ₄ = 0)*, Springer LNM 53
  (1968), Théorème 1. A. Hatcher, *A proof of the Smale conjecture, `Diff(S³) ≃ O(4)`*, Ann. of
  Math. 117 (1983). T. Watanabe, *Some exotic nontrivial elements of the rational homotopy groups
  of `Diff(S⁴)`*, arXiv:1812.02448, Theorem 1.1 and Remark 1.2.
- W. B. R. Lickorish, *An Introduction to Knot Theory*, Springer GTM 175 (1997): Chapter 1
  (Reidemeister's theorem, Theorem 1.7), Chapter 2 (Seifert surfaces, Theorem 2.2), Chapter 3
  (bracket and Jones polynomial), Chapter 6 (Alexander polynomial), Chapter 8 (signatures,
  S-equivalence, slice knots), Chapter 12 (surgery, Lickorish–Wallace), Chapter 15 (HOMFLY),
  Chapter 16 (braids, Theorem 16.10). G. Burde, H. Zieschang, *Knots*, 2nd ed., de Gruyter (2003),
  Chapters 1 and 8. D. Rolfsen, *Knots and Links*, Publish or Perish (1976), Chapter 2, Section E,
  Chapter 5, Chapter 7, Chapter 9. R. Crowell, R. Fox, *Introduction to Knot Theory*, Springer GTM
  57, Chapters VI–VII. J. Birman, *Braids, Links, and Mapping Class Groups*, Annals of Math.
  Studies 82 (1974), Theorem 2.3. L. Kauffman, *State models and the Jones polynomial*, Topology
  26 (1987). V. Jones, *A polynomial invariant for knots via von Neumann algebras*, Bull. Amer.
  Math. Soc. 12 (1985). P. Freyd, D. Yetter, J. Hoste, W. B. R. Lickorish, K. Millett, A. Ocneanu,
  *A new polynomial invariant of knots and links*, Bull. Amer. Math. Soc. 12 (1985). R. Gompf, A.
  Stipsicz, *4-Manifolds and Kirby Calculus*, AMS GSM 20 (1999), Section 4.1. J. Milnor, *Lectures
  on the h-cobordism Theorem*, Princeton (1965), Section 3.
- M. Freedman, *The topology of four-dimensional manifolds*, J. Differential Geom. 17 (1982). M.
  Freedman, F. Quinn, *Topology of 4-Manifolds*, Princeton (1990), Theorem 11.7B. L. Piccirillo,
  *The Conway knot is not slice*, Ann. of Math. 191 (2020), arXiv:1808.02923, Proposition 1.4 and
  Theorem 1.5 (cited in the scope statement only).
- P. Kronheimer, T. Mrowka, *Witten's conjecture and Property P*, Geom. Topol. 8 (2004) 295–310,
  arXiv:math/0311489, Conjecture 1 and Theorem 2. D. Gabai, *Foliations and the topology of
  3-manifolds III*, J. Differential Geom. 26 (1987) 479–536. M. Culler, C. Gordon, J. Luecke, P.
  Shalen, *Dehn surgery on knots*, Ann. of Math. 125 (1987). C. Gordon, J. Luecke, *Knots are
  determined by their complements*, J. Amer. Math. Soc. 2 (1989). Y. Mathieu, *Closed 3-manifolds
  unchanged by Dehn surgery*, J. Knot Theory Ramifications 1 (1992). K. Yasui, *Corks, exotic
  4-manifolds and knot concordance*, arXiv:1505.02551.
- C. Livingston, *A survey of classical knot concordance*, arXiv:math/0307077, Sections 2 and
  3.1. A. Tristram, *Some cobordism invariants for links*, Proc. Cambridge Philos. Soc. 66 (1969).
  J. Levine, *Invariants of knot cobordism*, Invent. Math. 8 (1969) 98–110. J. Hudson,
  *Concordance, isotopy, and diffeotopy*, Ann. of Math. 91 (1970).
- G. Mostow, *Strong rigidity of locally symmetric spaces*, Annals of Math. Studies 78 (1973). J.
  Ratcliffe, *Foundations of Hyperbolic Manifolds*, Springer GTM 149, 3rd ed. (2019), Chapters 4
  and 8, Theorem 11.8.5. W. Thurston, *Three-Dimensional Geometry and Topology, Vol. 1*,
  Princeton (1997), Sections 3.4 and 3.8. D. Gabai, R. Meyerhoff, P. Milley, *Mom technology and
  hyperbolic 3-manifolds*, arXiv:0910.5043, Theorem 1.1. I. Agol, *The virtual Haken conjecture*
  (with D. Groves and J. Manning), Doc. Math. 18 (2013), arXiv:1204.2810, Theorems 9.1 and 9.2.
- P. Scott, *The geometries of 3-manifolds*, Bull. London Math. Soc. 15 (1983) 401–487, Sections
  1, 3, 4 and 5. W. Jaco, P. Shalen, *Seifert fibered spaces in 3-manifolds*, Mem. Amer. Math.
  Soc. 220 (1979). K. Johannson, *Homotopy equivalences of 3-manifolds with boundaries*, Springer
  LNM 761 (1979). G. Perelman, arXiv:math/0211159, math/0303109, math/0307245. J. Morgan, G. Tian,
  *Ricci Flow and the Poincaré Conjecture*, Clay Math. Monographs 3 (2007), arXiv:math/0607607. L.
  Bessières, G. Besson, M. Boileau, S. Maillot, J. Porti, *Geometrisation of 3-manifolds*, EMS
  Tracts 13 (2010), Introduction.
- M. Scharlemann, *Heegaard splittings of compact 3-manifolds*, arXiv:math/0007144, Sections 1 and
  2.1. T. Li, *Rank and genus of 3-manifolds*, J. Amer. Math. Soc. 26 (2013), arXiv:1106.6302,
  Theorems 1.1 and 1.2.
- D. Calegari, *Foliations and the Geometry of 3-Manifolds*, Oxford (2007), author's page, Chapter
  4. A. Candel, L. Conlon, *Foliations I*, AMS GSM 23. W. Thurston, *A norm for the
  homology of 3-manifolds*, Mem. Amer. Math. Soc. 59 (1986), Theorems 1 and 2 and Section 3. M.
  Yazdi, *On Thurston's Euler class one conjecture*, Acta Math. 225 (2020), arXiv:1603.03822,
  Section 1 (inequalities (1), (2), Definition 1.1, Theorem 1.2, the Main Theorem), Section 3.3,
  Proposition 3.12. D. Gabai, M. Yazdi, *The fully marked surface theorem*, Acta Math. 225 (2020).
  J. Milnor, J. Stasheff, *Characteristic Classes*, Annals of Math. Studies 76 (1974), Chapter 12
  and Corollary 11.12. A. Hatcher, *Vector Bundles and K-Theory*, author's page, Section 3.
- E. Moise, *Geometric Topology in Dimensions 2 and 3*, Springer GTM 47 (1977), Theorems 35.3 and
  36.2. C. Manolescu, *Pin(2)-equivariant Seiberg–Witten Floer homology and the triangulation
  conjecture*, J. Amer. Math. Soc. 29 (2016), arXiv:1303.2354; *Lectures on the triangulation
  conjecture*, arXiv:1607.08163, Section 1 and Theorem 1.1. E. C. Zeeman, *On the dunce hat*,
  Topology 2 (1964) 341–358. J. H. C. Whitehead, *On C¹-complexes*, Ann. of Math. 41 (1940)
  809–824. J. Munkres, *Elementary Differential Topology*, Annals of Math. Studies 54 (1966),
  Theorems 10.5 and 10.6. R. Kirby, L. Siebenmann, *Foundational Essays on Topological Manifolds,
  Smoothings, and Triangulations*, Annals of Math. Studies 88 (1977), Essays IV and V.
