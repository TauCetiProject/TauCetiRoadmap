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
  collars, gluing along a piece of the boundary, handle attachment, the comparison of the native
  connected sum (two punctured balls glued by inversion) with the gluing of two ball complements
  along their boundary spheres, the associativity of the connected sum with its `π₁` and
  Euler-characteristic formulas, and the comparison of the native PL groupoid with the simplicial
  PL structures (Layer 1, with 11.3 and 12.1);
- the extensions of the native locally flat embedding theory: the three boundary variants of local
  flatness, the comparison of the native collaring theorems with Brown's global theorem for
  compact boundaries, the annulus theorem in every dimension as a stated target, and the
  Kirby–Siebenmann normal-bundle dependency named as such (Layer 2);
- continuity of inversion on the native weak Whitney diffeomorphism group, the topological-group
  structure, the relative groups `Diff(M, ∂M)` with their topology, the orientation-preserving
  subgroup and the degree, the comparison of the native orientation-free form of Cerf's theorem
  with `π₀(Diff⁺(S³)) = 0` and its corollary `Γ₄ = 0`, and the statements of the Smale
  conjecture, Cerf's theorem and Watanabe's theorem on their native carriers (Layer 3);
- knot theory on its presentations: the comparison theorems between the native smooth, PL,
  braid-closure, PD-code and Gauss-code presentations, Reidemeister's theorem, Markov's theorem,
  the Seifert matrix of a diagram, the agreement of the native Alexander, Jones and HOMFLY routes,
  the slice genus bounds, and the statement of Freedman's theorem (Layer 4);
- knot and link exteriors as compact manifolds with boundary, the identification of the native
  preferred longitude with the boundary of a Seifert surface, the isotopy classification of torus
  homeomorphisms that completes the native well-definedness of Dehn filling, the smooth structure
  and the diffeomorphism type of a filling, surgery on a knot in `S³` as a manifold with a name,
  the `1/n` identities on the unknot and the classification of the native lens spaces, the
  Lickorish–Wallace theorem, and the statements of Property P, Property R, the Gordon–Luecke
  theorem and Mathieu's theorem on the native fillings (Layer 5);
- the knot concordance group on the native concordance relations, the Tristram–Levine signature
  as a concordance invariant, link cobordisms and the slice genus inequalities (Layer 6);
- the homology, the volume and the non-Haken-ness of the native Weeks manifold, the isometric
  form of the minimal volume theorem through Mostow rigidity, and the statements of the minimal
  volume theorem and of Agol's theorems on the native carriers (Layer 7);
- irreducibility against primeness (`S¹ × S²` is the only closed orientable prime `3`-manifold
  that is not irreducible), the free-product decomposition of `π₁` along a prime decomposition,
  the comparison of the native geometric torus decomposition with Thurston's formulation through
  the eight model geometries, and the statements of the Kneser and Milnor theorems, the JSJ
  theorem, geometrization and the Poincaré conjecture on the native carriers (Layer 8);
- the boundary surface and the handle description of the native handlebody, the non-orientable
  handlebodies and the Heegaard splittings of non-orientable closed `3`-manifolds, the existence
  theorem for Heegaard splittings of every closed connected `3`-manifold, which supplies the
  instance the native Heegaard genus needs, and the statement of Li's theorem on the native
  carriers (Layer 9);
- transverse orientations, smooth transversals and Reeb components of codimension-one foliations
  on the native `TauCeti.Foliation`, the rank-two Thom class of an oriented plane bundle with the
  obstruction-theoretic description of the native Euler class, the Thurston norm and its dual, the
  comparison of the native Euler class inequality with the dual norm, the general (irreducible)
  form of Thurston's inequality, Gabai's realization theorem, Yazdi's infinite family, and the
  statements of Thurston's inequality and Yazdi's theorem on the native carriers (Layer 10);
- the realization API beyond the native one (compact subsets, the CW structure of a polyhedron and
  its cellular chain complex), triangulations of manifolds, the reconciliation of combinatorial
  manifolds with PL manifolds, and Manolescu's theorem (Layer 11);
- the smoothing-and-triangulation comparison in the dimensions where no obstruction class is
  needed (Layer 12).

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
- the lens spaces `L(p, q) = TauCeti.LensSpace p ![1, q]`, their analytic manifold structure,
  their fundamental group `ℤ/p` and the invariance of `p` under homeomorphism, which are native,
  as is the `p/q`-surgery on the unknot inside them; 5.3 proves on that carrier the unoriented
  surgery description `S³_U(p/q) ≃ₜ L(p, q)` and the classification of lens spaces, and 8.1
  consumes their native spherical structure;
- the connected sum of two manifolds along coordinate balls, its oriented form, its independence
  of the balls, its commutativity and the identity `M # Sⁿ ≃ M`; primeness and iterated connected
  sums; and the statements of the Kneser and Milnor theorems, which are native (1.4 and 8.2
  consume `TauCeti.ConnectedSum`, `TauCeti.OrientedConnectedSum`, `TauCeti.IsPrimeManifold`,
  `TauCeti.IsIteratedConnectedSum`, `TauCeti.KneserPrimeDecompositionTheorem` and
  `TauCeti.MilnorPrimeDecompositionTheorem`);
- Cerf's theorem in its orientation-free form `TauCeti.CerfTheorem`, its two-component form, and
  the native proof that the Smale conjecture implies it (3.3);
- Dehn fillings of knot and link exteriors recorded inside the filled space, their existence along
  every slope, their independence of the gluing for gluings isotopic to matrix gluings, the
  framing number and the preferred framing, the `∞`-, `0`- and `p/q`-surgeries on the unknot, the
  surgery coefficients of a link, surgery on a framed sphere in general dimension, the purely and
  chirally cosmetic relations with the cosmetic surgery conjecture, the Ni–Wu, Hanselman and
  Mathieu statements, the Akbulut–Kirby conjecture and Yasui's theorem, which are native (Layer 5
  consumes them under the names of the supplier contract);
- the Whitehead link, the Weeks manifold as its `5, 5/2` surgery and the statement of the
  Gabai–Meyerhoff–Milley theorem, which are native (7.3);
- the standard handlebodies with their fundamental groups, Heegaard splittings of a space as two
  handlebodies inside it, the Heegaard genus, the rank inequality, Waldhausen's rank-versus-genus
  conjecture and the statement of Li's theorem, which are native (Layer 9);
- tautness of a foliation through `C¹` closed transversals, the leaves of a foliation, the Thom
  pair and the Euler class of a vector bundle and of the tangent field of a foliation, the Euler
  class inequality on embedded surfaces, and the statements of Thurston's inequality, the Euler
  class one conjecture and Yazdi's theorem in their closed hyperbolic forms, which are native
  (Layer 10);
- the Kirby–Siebenmann theorem (a closed topological manifold of dimension at least five has a
  PL structure exactly when its class `ks(M) ∈ H⁴(M; ℤ/2)` vanishes, the PL structures up to
  concordance then forming a torsor under `H³(M; ℤ/2)`; Kirby–Siebenmann, *Foundational Essays*,
  Essays IV and V): its statement needs the stable tangent microbundle of a topological manifold,
  the classifying spaces `BTOP` and `BPL` and the obstruction to lifting the classifying map,
  which exist neither at the pins nor in any roadmap on main. The theorem is not a target here;
  Layer 12 states the comparison of structures that needs no obstruction class (dimension at most
  three through Moise's theorem, the `E₈` manifold in dimension four); the stable tangent
  microbundle, `BTOP`, `BPL` and the Kirby–Siebenmann theorem are stated in a GeometricTopology
  Part II that consumes Layers 11 and 12, which is where FourManifolds' contract
  `gap:tangent-microbundle-stable-classifier` is addressed;
- the Thom isomorphism and the Euler classes of oriented bundles of every rank beyond the native
  `TauCeti.eulerClass`, which are CharacteristicClasses C2; 10.2 consumes the native Euler class
  in rank two and owns the rank-two Thom class of an oriented plane bundle and the
  obstruction-theoretic description of its Euler class, and C2 compares its rank-two restriction
  with that plane construction, so 10.2 consumes nothing of C2;
- the homological concordance invariants: `τ` and the bound `|τ(K)| ≤ g_s(K)` are
  CombinatorialHeegaardFloer Lane G, items 7 and 10, which consumes this roadmap's Layer 4 and is
  therefore never a supplier of it. The three Kirby problems whose resolutions rest on such
  invariants are outside this roadmap: Problem 1.41 (Piccirillo's non-slice Conway knot, through
  Rasmussen's `s`-invariant and the trace-equivalent knot, Piccirillo, *The Conway knot is not
  slice*, Proposition 1.4 and Theorem 1.5), Problem 1.53 (mutation and concordance, through the
  same pair) and Problem 1.31 (Levine's knot in a homology sphere, through Heegaard Floer
  invariants). The proofs of Yasui's theorem and of the Ni–Wu and Hanselman cosmetic surgery
  theorems, native as `TauCeti.YasuiTheorem`, `TauCeti.NiWuCosmeticSurgeryTheorem` and
  `TauCeti.HanselmanCosmeticSurgeryTheorem`, rest on invariants of the same kind; 5.4 names them
  and claims nothing about them. No roadmap on main supplies `s`; a GeometricTopology Part II that
  consumes both this roadmap and CombinatorialHeegaardFloer is where they are stated;
- the classification of compact surfaces and the mapping class groups of surfaces: no roadmap on
  main supplies them, and nothing here needs them, since the native Heegaard splittings are two
  handlebodies inside the manifold meeting in their common frontier (9.1), with no gluing map and
  no abstract genus-`g` surface;
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
  the `SmoothEmbedding/NormalSpace/` files (`NormalSpace/Basic.lean` and its siblings);
  `TauCeti.PLPregroupoid`, `TauCeti.PLGroupoid` and `TauCeti.PLGroupoid_le_continuousGroupoid`
  (`Geometry/Manifold/PLGroupoid/Basic.lean`); `TauCeti.Orientable I n M`
  (`Geometry/Manifold/Orientation/Basic.lean`); `TauCeti.SmoothEmbedding`
  (`SmoothEmbedding/Basic.lean`); the connected sum `TauCeti.ConnectedSum e₁ e₂` of two spaces along
  open
  embeddings `e₁ : E → M`, `e₂ : E → N` of a real inner product space `E` (the centres removed
  and the punctured balls glued by the inversion `v ↦ v/‖v‖²`), with `ConnectedSum.inl`, `inr`,
  `mk`, `isOpenEmbedding_inl`, `isLocalHomeomorph_mk` and `ConnectedSum.t2Space`
  (`Geometry/Manifold/ConnectedSum/Basic.lean`), its charts `ConnectedSum.chartedSpace` with
  `ConnectedSum.isManifold` and `isLocalDiffeomorph_mk` (`ConnectedSum/Smooth.lean`),
  `ConnectedSum.compactSpace` and `ConnectedSum.connectedSpace` for `dim E ≥ 2`
  (`ConnectedSum/Topology.lean`), `ConnectedSum.orientation` and `ConnectedSum.orientable`
  (`ConnectedSum/Orientation.lean`) on the native orientations `TauCeti.Manifold.Orientation I M ι`
  (`Orientation/Basic.lean`), `ConnectedSum.nonempty_diffeomorph_of_isOrientationPreservingAt` and
  `nonempty_diffeomorph_of_isOrientationReversingAt` (`ConnectedSum/Independence.lean`),
  `TauCeti.OrientedConnectedSum oM oN` with `nonempty_diffeomorph_connectedSum`,
  `nonempty_diffeomorph_comm`, `nonempty_diffeomorph_neg` and `nonempty_diffeomorph_sphere`
  (`ConnectedSum/Oriented.lean`), `TauCeti.IsComplementaryBall` and
  `TauCeti.connectedSumSphereDiffeomorph` (`ConnectedSum/Sphere.lean`).
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
  `AmbientIsotopic/Basic.lean`); `TauCeti.CerfTheorem`,
  `TauCeti.SmaleConjecture.cerfTheorem` and `TauCeti.cerfTheorem_iff_natCard_zerothHomotopy_eq_two`
  (`Diffeomorphism/Cerf.lean`), `TauCeti.joined_orthogonalToDiffSphere_iff` and
  `TauCeti.not_pathConnectedSpace_diff_sphere` (`Diffeomorphism/Sphere/Isotopy.lean`).
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
  `TauCeti.MarkovEquiv`, `MarkovBraid.componentCount` (`KnotTheory/Markov/Basic.lean`);
  `TauCeti.PDCode`, `TauCeti.OrientedPDCode`, `writhe`, `mirror`, `reverse`, `relabel`
  (`PDCode/Basic.lean`), `TauCeti.OrientedPDCode.IsReidemeisterMove` and `ReidemeisterEquiv`
  (`PDCode/Oriented/Reidemeister/Equivalence.lean`); `TauCeti.BasedOrientedGaussCode`,
  `FramedBasedOrientedGaussCode`, `BasedUnorientedGaussCode` (`GaussCode/`);
  `TauCeti.PDCode.kauffmanBracket`, `TauCeti.OrientedPDCode.normalizedKauffmanBracket`
  (`PDCode/Kauffman.lean`), `TauCeti.OrientedPDCode.jonesPolynomial` with its invariance
  `TauCeti.OrientedPDCode.ReidemeisterEquiv.jonesPolynomial_eq`, `jonesPolynomial_mirror`,
  `jonesPolynomial_reverse`, `jonesPolynomial_unknot` and
  `TauCeti.jonesPolynomial_rightHandedTrefoilPDCode` (`PDCode/Jones/Basic.lean`,
  `PDCode/Oriented/Reidemeister/Equivalence.lean`); `TauCeti.KnotTheory.alexander`,
  `alexanderMatrix`, `enlargeColumn`, `enlargeRow`, `invert_alexander`, `eval₂_one_alexander`,
  `alexander_congruence_of_det_sq_eq_one`, `trefoilSeifertMatrix`, `figureEightSeifertMatrix`
  (`KnotTheory/Alexander.lean`); `TauCeti.KnotTheory.IntegralSquareMatrix.SEquivalent`
  (`SeifertMatrix/SEquivalence.lean`); `TauCeti.OrientedPDCode.AlexanderModule`,
  `elementaryIdeal` and their Reidemeister invariance (`PDCode/Alexander/`);
  `TauCeti.burau`, `TauCeti.MarkovBraid.burauAlexander`,
  `TauCeti.MarkovEquiv.associated_burauAlexander`,
  `TauCeti.KnotTheory.associated_burauAlexander_alexander_trefoilSeifertMatrix` (`Burau/`);
  `TauCeti.jimbo`, the loop value `jonesDelta a = −(a² + a⁻²)`, the writhe-normalised Jones
  trace `TauCeti.MarkovBraid.jonesTrace` with its Markov invariance, `jonesTrace_one_strand` and
  `jonesTrace_sigma_pow_three` (`Jimbo/`, `TemperleyLieb.lean`), and
  `TauCeti.normalizedKauffmanBracket_rightHandedTrefoilPDCode` (`PDCode/Trefoil.lean`);
  `TauCeti.homflySpecialization`
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
  `longitude`, `value`, `slopeEquiv` (`LowDimTopology/DehnSurgery/Slope.lean`); the lens spaces
  `TauCeti.LensSpace m ℓ` for `m ≥ 1` and units `ℓ : Fin (k + 1) → (ZMod m)ˣ`, the orbit space of
  the unit sphere of `ℂ^{k+1}` under `ℤ/m` rotating the `i`-th coordinate by `2πℓᵢ/m`
  (`AlgebraicTopology/UniversalCover/LensSpace/Basic.lean`), with
  `LensSpace.fundamentalGroupMulEquiv` (`π₁ ≅ ℤ/m` for `k ≥ 1`), `LensSpace.card_fundamentalGroup`
  and `LensSpace.eq_of_homeomorph`
  (`LensSpace/FundamentalGroup.lean`), and their analytic manifold structure of dimension `2k + 1`
  (`Geometry/Manifold/Instances/LensSpace.lean`); the three-dimensional `L(p, q)` is
  `TauCeti.LensSpace p ![1, q]`; `TauCeti.knotExterior` (`SolidTorusNeighborhood/Exterior.lean`),
  `TauCeti.unknotSolidTorus` and
  `TauCeti.unknotExteriorHomeomorph` (`SolidTorusNeighborhood/Unknot.lean`),
  `TauCeti.exists_isSolidTorusNeighborhood_sphere` (`SolidTorusNeighborhood/Sphere.lean`),
  `TauCeti.IsSolidTorusLinkNeighborhood` (`SolidTorusNeighborhood/Link/Basic.lean`),
  `TauCeti.IsOrientationPreservingAtCore` (`SolidTorusNeighborhood/Orientation.lean`);
  `FramedBoundaryTorus.ofHomeomorph`, `FramedBoundaryTorus.torusCurveClass`,
  `FramedBoundaryTorus.value_mk_torusCurveClass` and
  `IsSolidTorusNeighborhood.framedBoundaryTorus` (`DehnSurgery/Framing.lean`);
  `IsSolidTorusNeighborhood.framingNumber`, `preferredFramedBoundaryTorus`,
  `complementHomologyEquiv`, `complementHomologyEquiv_boundaryHomologyMap_preferred` and
  `ker_boundaryHomologyMap`, under the vanishing of the reduced integral homology of the ambient
  space in degrees `1` and `2`, supplied for `S³` by
  `TauCeti.isZero_reducedSingularHomologyFunctor_one_sphere_euclideanSpace_fin_four` and its
  degree-two sibling (`DehnSurgery/SeifertFraming.lean`); `IsSolidTorusNeighborhood.fillingSlope`
  with `fillingSlope_refl` and `fillingSlope_prodComm`, `TauCeti.DehnFilling h s Y`,
  `DehnFilling.desc`, `DehnFilling.transHomeomorph`, `DehnFilling.openExteriorEmbedding` and
  `IsSolidTorusNeighborhood.meridianDehnFilling` (`DehnSurgery/Filling.lean`);
  `IsSolidTorusNeighborhood.dehnFillingSpace`, `IsSolidTorusNeighborhood.exists_dehnFilling` and
  `IsSolidTorusLinkNeighborhood.exists_linkDehnFilling` (`DehnSurgery/Existence.lean`);
  `IsSolidTorusNeighborhood.exists_fillingSlope_torusHomeomorph_eq`,
  `DehnFilling.exists_homeomorph_of_isotopic`,
  `DehnFilling.exists_homeomorph_of_isotopic_torusHomeomorph` and
  `DehnFilling.nonempty_homeomorph_of_fillingSlope_meridian` (`DehnSurgery/Uniqueness.lean`);
  `TauCeti.framingNumber_unknotSolidTorus`, `TauCeti.preferredFramedBoundaryTorus_unknotSolidTorus`,
  `TauCeti.unknotZeroDehnFilling` with `unknotZeroDehnFilling_gluing` and
  `DehnFilling.nonempty_homeomorph_circle_prod_sphere_of_unknot_longitude`
  (`DehnSurgery/Unknot.lean`); `TauCeti.unknotLensSpaceDehnFilling` and
  `DehnFilling.nonempty_homeomorph_lensSpace_of_unknot_slopeValue` (`DehnSurgery/LensSpace.lean`);
  `TauCeti.LinkDehnFilling` (`DehnSurgery/Link/Filling.lean`),
  `IsSolidTorusLinkNeighborhood.surgerySlope` with `value_surgerySlope_framedBoundaryTorus`
  (`DehnSurgery/Link/Surgery.lean`); `DehnFilling.IsOrientationCompatible`
  (`DehnSurgery/Orientation.lean`) on `TauCeti.HomologicalOrientation`
  (`AlgebraicTopology/Singular/LocalHomology/Orientation/Homological.lean`);
  `IsSolidTorusNeighborhood.IsPurelyCosmetic`, `IsSolidTorusNeighborhood.IsChirallyCosmetic`,
  `TauCeti.CosmeticSurgeryConjecture`, `TauCeti.NiWuCosmeticSurgeryTheorem`,
  `TauCeti.HanselmanCosmeticSurgeryTheorem` and `TauCeti.MathieuChirallyCosmeticTheorem`
  (`DehnSurgery/Cosmetic.lean`); `TauCeti.AkbulutKirbyConjecture` and `TauCeti.YasuiTheorem`
  (`DehnSurgery/AkbulutKirby.lean`); `TauCeti.sphereExterior` and `TauCeti.SphereSurgery`
  (`Topology/Surgery/Basic.lean`), `TauCeti.solidTorusFramedSphere` and
  `SphereSurgery.toDehnFilling` (`DehnSurgery/SphereSurgery.lean`); `TauCeti.rightHandedTrefoil`
  (`KnotTheory/TorusKnot.lean`).
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
  `TauCeti.FibersOverCircle` (`Topology/MappingTorus/Basic.lean`); `TauCeti.IsFiniteCover`
  (`Topology/Covering/IsFiniteCover.lean`); `TauCeti.IsVirtuallyFibered`
  (`Topology/VirtuallyFibered.lean`); `TauCeti.IsHakenSurfaceEmbedding`,
  `TauCeti.IsClosedHakenSurfaceEmbedding`, `TauCeti.IsPossiblyNonorientableClosedHakenThreeManifold`
  (`Geometry/Manifold/Haken.lean`); `TauCeti.IsVirtuallyHaken` and
  `TauCeti.VirtualHakenConjecture` (`Geometry/Manifold/VirtuallyHaken.lean`,
  `Riemannian/Hyperbolic/VirtualHaken.lean`); `TauCeti.whiteheadLink` and `TauCeti.whiteheadCurve`
  (`KnotTheory/SmoothLink/Whitehead.lean`); `TauCeti.IsWeeksManifold`,
  `TauCeti.exists_isWeeksManifold` and `TauCeti.isWeeksManifold_congr`
  (`LowDimTopology/DehnSurgery/Link/Weeks.lean`); `TauCeti.GabaiMeyerhoffMilleyTheorem`
  (`Riemannian/Hyperbolic/Weeks.lean`).
- Layer 8: `TauCeti.ModelGeometry` with its eight constructors and `ModelGeometry.Space`
  (`Riemannian/ModelGeometry/Basic.lean`), `TauCeti.HasGeometricStructure M G` and
  `TauCeti.LensSpace.hasGeometricStructure_spherical`
  (`Riemannian/GeometricStructure/Basic.lean`); `TauCeti.IsSphereBoundsBall`
  (`Geometry/Manifold/Irreducible.lean`); `TauCeti.IsIncompressible`
  (`AlgebraicTopology/FundamentalGroup/Incompressible.lean`),
  `TauCeti.IsClosedIncompressibleSurfaceEmbedding` (`Geometry/Manifold/Incompressible.lean`);
  `TauCeti.SolidTorus.fiberSetoid`, `TauCeti.IsSeifertFibration`, `TauCeti.IsSeifertFibered`
  (`LowDimTopology/SeifertFibration.lean`); `TauCeti.IsPeripheralTorus`, `TauCeti.IsAtoroidal`,
  `TauCeti.IsTorusDecomposition`, `TauCeti.IsJSJDecomposition`, `TauCeti.JSJTheorem`
  (`LowDimTopology/JSJDecomposition.lean`); `TauCeti.IsGeometricTorusDecomposition`,
  `TauCeti.GeometrizationConjecture` (`LowDimTopology/Geometrization.lean`);
  `TauCeti.IsConnectedSumOf I k M N₁ N₂`,
  `TauCeti.IsPrimeManifold n M`, `TauCeti.IsIteratedConnectedSum n P M`,
  `TauCeti.not_isPrimeManifold_sphere`, `TauCeti.IsConnectedSumOf.not_isPrimeManifold`,
  `TauCeti.isIteratedConnectedSum_zero_iff` and `Diffeomorph.isPrimeManifold_iff`
  (`Geometry/Manifold/ConnectedSum/Prime.lean`); `TauCeti.KneserPrimeDecompositionTheorem` and
  `TauCeti.MilnorPrimeDecompositionTheorem` with `MilnorPrimeDecompositionTheorem.card_eq`
  (`LowDimTopology/PrimeDecomposition.lean`).
- Layer 9: `TauCeti.planarSurface g`, `TauCeti.handlebody g`, `TauCeti.handlebody_zero`,
  `TauCeti.nonempty_homeomorph_handlebody_one` (`LowDimTopology/Handlebody/Basic.lean`);
  `TauCeti.nonempty_fundamentalGroup_handlebody_mulEquiv_freeGroup`,
  `TauCeti.rank_fundamentalGroup_handlebody_le`, `TauCeti.isPathConnected_frontier_handlebody`
  and `TauCeti.fundamentalGroup_map_frontier_handlebody_surjective`
  (`Handlebody/FundamentalGroup.lean`); `TauCeti.HeegaardSplitting M` with `symm`,
  `transHomeomorph` and `ofIsClosed`, `TauCeti.heegaardGenus M` under
  `[Nonempty (HeegaardSplitting M)]` with `heegaardGenus_le`, `exists_genus_eq_heegaardGenus`,
  `heegaardGenus_eq_zero_iff` and `heegaardGenus_congr`, `TauCeti.hemisphereHeegaardSplitting`
  and `TauCeti.heegaardGenus_sphere` (`LowDimTopology/Heegaard/Splitting.lean`);
  `TauCeti.cliffordHeegaardSplitting` and `TauCeti.exists_heegaardSplitting_genus_eq_one`
  (`Heegaard/Clifford.lean`); `HeegaardSplitting.fundamentalGroup_map_left_surjective`,
  `HeegaardSplitting.fg_fundamentalGroup`, `HeegaardSplitting.rank_fundamentalGroup_le_genus` and
  `TauCeti.rank_fundamentalGroup_le_heegaardGenus` (`Heegaard/FundamentalGroup.lean`);
  `TauCeti.RankGenusConjecture`, `TauCeti.LiRankGenusTheorem`,
  `LiRankGenusTheorem.not_rankGenusConjecture` and `TauCeti.exists_heegaardGenus_sphere_eq_rank`
  (`Heegaard/RankGenus.lean`); `LensSpace.heegaardSplitting` and `LensSpace.heegaardGenus_eq_one`
  (`Heegaard/LensSpace/Splitting.lean`); `DehnFilling.heegaardSplitting`,
  `DehnFilling.heegaardGenus_le_one` and `TauCeti.heegaardGenus_circle_prod_sphere`
  (`Heegaard/DehnFilling.lean`).
- Layer 10: `TauCeti.Foliation I n M k` and `Foliation.ofSubmodule` (`Foliation/Basic.lean`), the
  distribution interfaces `TauCeti.IsContMDiffDistribution`, `TauCeti.IsInvolutiveDistribution`
  (`Geometry/Manifold/Distribution.lean`); `Foliation.leaf` and `Foliation.SameLeaf`
  (`Foliation/Leaf.lean`); `Foliation.IsClosedTransversal`, `Foliation.Taut` and
  `TauCeti.not_taut_ofSubmodule_ker` (`Foliation/Taut.lean`); `TauCeti.thomPair`,
  `TauCeti.IsThomClass` with `IsThomClass.singularCohomologyMap`, and `TauCeti.eulerClass` with
  `eulerClass_naturality`, `eulerClass_pullback`, `eulerClass_eq_zero_of_forall_ne_zero` and
  `eulerClass_trivial_eq_zero` (`Topology/VectorBundle/EulerClass.lean`); `Foliation.thomPair`,
  `Foliation.IsThomClass`, `Foliation.eulerClass`, `Foliation.IsEulerClass`, `IsEulerClass.neg`,
  `Foliation.eulerClass_eq_zero_of_forall_ne_zero`, `TauCeti.EulerClassBounded` with
  `eulerClassBounded_neg_iff`, `TauCeti.EulerClassNormOne` with `not_eulerClassNormOne_zero`,
  `TauCeti.ThurstonEulerClassInequality`, `TauCeti.EulerClassOneConjecture`,
  `TauCeti.YazdiEulerClassOneTheorem` and `YazdiEulerClassOneTheorem.not_eulerClassOneConjecture`
  (`Foliation/EulerClass.lean`); `TauCeti.HomologicalOrientation.evalFundamentalClass`
  (`AlgebraicTopology/Cohomology/FundamentalClass.lean`), `TauCeti.FiniteCWType`
  (`Topology/CWComplex/Classical/FiniteCWType.lean`) and `TauCeti.eulerChar`
  (`AlgebraicTopology/Cellular/EulerCharacteristic/FiniteCWType.lean`).
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
  cylinders of cones (`Collapse/Cone.lean`, `Collapse/Cylinder/Basic.lean`);
  `PreAbstractSimplicialComplex.IsCombinatorialBall`, `IsCombinatorialSphere`,
  `IsCombinatorialManifold` with its dimension-zero case (`CombinatorialManifold/Basic.lean`);
  `realizationStandardSuccSimplexBoundaryHomeomorphSphere n : |∂Δⁿ⁺¹| ≃ₜ Sⁿ`
  (`Simplex/BoundarySphere.lean`); `AbstractSimplicialComplex.Contractible2Complex` and
  `TauCeti.ZeemanConjecture` (`SimplicialComplex/Zeeman.lean`); `TauCeti.IsTriangulable`
  (`Topology/Triangulable/Basic.lean`); `TauCeti.FiniteCWType`
  (`Topology/CWComplex/Classical/FiniteCWType.lean`);
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
- CharacteristicClasses: nothing is consumed; C2 compares its rank-two Euler class with the plane
  construction of 10.2 on the native `TauCeti.eulerClass`.
- CombinatorialHeegaardFloer: nothing is consumed; Lane K consumes Layer 4 and Lane G consumes 6.3.

## How to read the build

Layer 1 is the spine: it completes the collar theorem on the native local collars, builds gluing
along faces, handle attachment and tubular neighbourhoods in manifolds, compares the native
connected sum with the gluing model, and records the native PL groupoid. Layer 2 extends the
native locally flat embedding theory to boundaries and to the global collaring and annulus
theorems. Layer 3 finishes the native weak Whitney topology into a topological group with its
relative and orientation-preserving subgroups and states the three diffeomorphism-group theorems.
Layer 4 builds knot theory on the native presentations and proves the correspondence and agreement
theorems between them; Layer 6 builds the concordance group on the native concordance relations
and Layer 4's Seifert matrices, and is built before Layer 5, whose exteriors rest on Layer 1's
gluing and Layer 4's presentations, whose Dehn fillings are the native ones completed by the
isotopy classification of torus homeomorphisms, and whose Akbulut–Kirby statement consumes
Layer 6's concordance relation. Layers 7 and 8 share the Riemannian substrate: Layer 7 computes
the native Weeks manifold and states the minimal volume theorem and the Agol statements on the
native hyperbolic carriers, Layer 8 sets irreducibility against the native primeness and adds the
Thurston-geometry form of geometrization on the native decomposition carriers. Layer 11 extends
the native polyhedra and needs only Layer 1; Layers 5, 8 and 9 consume its Moise theorem (11.2)
for the smooth structure of a filling, for Kneser's finiteness and for the existence of Heegaard
splittings, so Layer 11 is built before Layer 5. Layer 9 needs Layers 1, 2 and 5 besides; Layer 10
needs the native foliations and Euler classes, Layer 2's surfaces and Layer 8's incompressible
surfaces; Layer 12 compares the structures of Layers 1 and 11. Every layer ends with its examples
and dependencies, and `Suggested.lean` states the end theorems that are statable at the pins:
Smale, Cerf, Watanabe, the annulus theorem, Markov, Freedman, Property P, Property R,
Gordon–Luecke, Mathieu, Mostow, the minimal volume theorem, Agol (both forms), Kneser, Milnor,
the JSJ theorem, geometrization, the Poincaré conjecture, Li, Thurston's inequality, Yazdi and
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

*Needs:* Mathlib `IsManifold`, `modelWithCornersEuclideanHalfSpace`, `Diffeomorph` and partitions of
unity (`SmoothPartitionOfUnity`); the native `TauCeti.isManifold_boundary`,
`TauCeti.exists_isProductCollarChart_of_mem_boundary`,
`TauCeti.IsProductCollarChart.diffeomorphProd`, `TauCeti.IsCollar` and
`TauCeti.IsLocallyCollared.isCollared`; `TauCeti.Diffeotopy` for the uniqueness statement.

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

*Needs:* Mathlib `modelWithCornersEuclideanQuadrant`, `Diffeomorph` and the quotient topology; 1.1
(collars on both sides of the seam); DifferentialGeometry 5.5 (faces of a manifold with corners and
the abstract boundary); `TauCeti.Diffeotopy` and `TauCeti.SmoothEmbedding` for the isotopy
statements.

### 1.3 Tubular neighbourhoods

Consume the native Euclidean tubular neighbourhood theorem
`TauCeti.exists_isTubularNeighborhood_normalBundle` (a compact `C²` submanifold of a Euclidean
space has an open neighbourhood identified with a neighbourhood of the zero section of its normal
bundle, in the sense of `TauCeti.IsTubularNeighborhood`) and the intrinsic normal spaces of
the `SmoothEmbedding/NormalSpace/` files. Prove the **tubular neighbourhood theorem in a
manifold**: for a `C^k` embedding `f : N → M`, `k ≥ 2`, of a compact manifold `N` into a
boundaryless manifold `M`, with a Riemannian metric on `M`, the normal exponential map is a
diffeomorphism from the normal vectors of length less than some `ε > 0` onto an open
neighbourhood of `f(N)`, and the resulting data satisfy `TauCeti.IsTubularNeighborhood` (Hirsch,
Theorem 6.3; Lee, Theorem 6.24).
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

*Needs:* Mathlib `TangentBundle`, `Bundle.ContMDiffRiemannianMetric`, `Manifold.IsSmoothEmbedding`;
the native `TauCeti.exists_isTubularNeighborhood_normalBundle`, `TauCeti.IsTubularNeighborhood` and
the normal spaces of the `SmoothEmbedding/NormalSpace/` files; HopfRinow Layer 1 (the exponential
map); 1.1 (the closed tube as a manifold with boundary).

### 1.4 Connected sum

Consume the native **connected sum** `TauCeti.ConnectedSum e₁ e₂` of two spaces `M`, `N` along
open embeddings `e₁ : E → M`, `e₂ : E → N` of a real inner product space `E`, the coordinate
balls: the centres `e₁ 0`, `e₂ 0` are removed and the punctured balls are glued by the inversion
`v ↦ v/‖v‖²`, so that `e₁ v` is identified with `e₂ (v/‖v‖²)` for `v ≠ 0` (Kosinski,
*Differential Manifolds*, Chapter VI, Section 1, with the radial coordinate rescaled). It is
Hausdorff when `M` and `N` are and `E` is finite-dimensional (`ConnectedSum.t2Space`), a `C^n`
manifold with the charts pushed forward from the punctured summands when the balls are `C^n`
local diffeomorphisms (`ConnectedSum.chartedSpace`, `ConnectedSum.isManifold`), compact when `M`
and `N` are, and connected when they are and `dim E ≥ 2` (`ConnectedSum.compactSpace`,
`ConnectedSum.connectedSpace`). Consume **independence of the balls**: for connected summands,
balls with the same orientation behaviour at their centres give diffeomorphic sums
(`ConnectedSum.nonempty_diffeomorph_of_isOrientationPreservingAt`, by the ambient disc theorem;
Palais, *Extending diffeomorphisms*, Proc. AMS 11 (1960), Theorem B; Hirsch, Chapter 8, Theorem
3.1); the **oriented connected sum** `TauCeti.OrientedConnectedSum oM oN` of connected oriented
manifolds, along a ball preserving the orientation of `M` and a ball reversing that of `N` at
their centres, with its orientation (`ConnectedSum.orientation`, `ConnectedSum.orientable`) and
its independence of the chosen balls (`OrientedConnectedSum.nonempty_diffeomorph_connectedSum`);
and the identities `M # N ≃ N # M` (`OrientedConnectedSum.nonempty_diffeomorph_comm`),
`M # N ≃ (−M) # (−N)` (`nonempty_diffeomorph_neg`) and `M # Sⁿ ≃ M`
(`OrientedConnectedSum.nonempty_diffeomorph_sphere`, `TauCeti.connectedSumSphereDiffeomorph`).
Prove the **comparison with the gluing model**: for closed `M`, `N` and balls `e₁`, `e₂` that are
diffeomorphisms onto their images, the native sum is diffeomorphic to
`(M ∖ e₁(int Dⁿ)) ∪ (N ∖ e₂(int Dⁿ))` glued along the boundary spheres by `e₂ ∘ e₁⁻¹` through 1.2
(the inversion carries the sphere of radius `r` to the sphere of radius `1/r`, so the two models
differ by collars of the seam). Prove **associativity** `(M # N) # P ≃ M # (N # P)` for connected
oriented summands, and the formulas `π₁(M # N) ≅ π₁(M) * π₁(N)` for `n ≥ 3` (van Kampen on the
two punctured summands, whose intersection, the punctured ball, is simply connected) and
`χ(M # N) = χ(M) + χ(N) − χ(Sⁿ)` for closed `M`, `N`.

- `M # N` is a connected `C^n` manifold, closed when `M` and `N` are; for connected oriented
  summands it is oriented and depends only on the oriented summands up to diffeomorphism.
- `M # Sⁿ ≃ M`; `M # N ≃ N # M`; `(M # N) # P ≃ M # (N # P)`.
- The gluing model of 1.2 and the native model are diffeomorphic.

**Checks.**

- `S² # S² ≃ S²` is the native sphere identity; `T² # T²` is the genus-two surface with
  `χ = −2 = 0 + 0 − 2`.
- `ℝP² # ℝP²` is the Klein bottle: the native `ConnectedSum` needs no orientation, only the
  oriented sum and the independence theorem do. The orientation condition on the second ball is
  what makes the result the oriented sum: the inversion reverses every orientation of `E`, so a
  ball preserving the orientation of `M` and a ball reversing that of `N` give a gluing map that
  preserves orientation from `M` to `N` (`ConnectedSum.orientation`). In the gluing model for
  `n = 1`, `M = N = S¹`: the arc `M ∖ e₁(int D¹)` runs from `e₁(1)` to `e₁(−1)` and the arc
  `N ∖ e₂(int D¹)` from `e₂(−1)` to `e₂(1)`, and identifying `e₁(±1)` with `e₂(±1)` gives a
  consistently oriented circle, while with `e₂` preserving the second arc runs the other way. For
  `M = N = ℂP²` the oriented sum has intersection form `⟨1⟩ ⊕ ⟨1⟩` and signature `2`; two
  orientation-preserving balls give the oriented sum of `ℂP²` with `ℂP²‾`, with form
  `⟨1⟩ ⊕ ⟨−1⟩` and signature `0`, which `nonempty_diffeomorph_neg` identifies only with
  `ℂP²‾ # ℂP²`, so the condition on the second ball is not cosmetic.
- `π₁(L(2, 1) # L(3, 1)) ≅ C₂ * C₃`, with two prime factors; uniqueness of the factorisation is
  8.2, not a consequence of this section.
- The connected sum of two lines along the identity balls is two disjoint lines, so
  `ConnectedSum.connectedSpace` needs `dim E ≥ 2`; and the `π₁` formula needs `n ≥ 3`: for
  `n = 2`, `T² # T²` has `π₁` the surface group of genus two, a quotient of `ℤ² * ℤ²` by the
  relation the punctured ball (an annulus, with `π₁ = ℤ`) imposes.
- The connected sum of `M` with itself is the native sum of two copies of `M`: the construction
  takes two spaces, so `M # M` along `e₁`, `e₂ : E → M` needs disjoint images only in the gluing
  model, which the comparison target assumes.

*Needs:* Mathlib `Diffeomorph`, `FundamentalGroup`; the native `TauCeti.ConnectedSum` with its
charts, Hausdorffness, compactness and connectedness, `TauCeti.Manifold.Orientation`,
`TauCeti.OrientedConnectedSum`, `ConnectedSum.nonempty_diffeomorph_of_isOrientationPreservingAt`,
`TauCeti.connectedSumSphereDiffeomorph`, `TauCeti.SmoothEmbedding`, `TauCeti.Diffeotopy`; 1.1
(collars of the seam); 1.2 (gluing along the boundary spheres, for the comparison);
AlgebraicTopology Stage 1 (van Kampen) and Stage 7 (the Euler characteristic of a finite
decomposition).

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

*Needs:* Mathlib `StructureGroupoid`, `HasGroupoid`, `continuousGroupoid`; the native
`TauCeti.PLPregroupoid`, `TauCeti.PLGroupoid`, `TauCeti.PLGroupoid_le_continuousGroupoid`,
`TauCeti.ofSet_mem_PLGroupoid`, `TauCeti.doubleRight`, and
`PreAbstractSimplicialComplex.SimplicialMap.realizationHomeomorph` for the realization of a
simplicial isomorphism.

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

- The inclusion `[0, 1] → [0, 1] × S¹`, `t ↦ (t, 1)`, is neat locally flat with tangential model
  `EuclideanHalfSpace 1` and complementary model `ℝ`: the preimage of the boundary `{0, 1} × S¹`
  is `{0, 1} = ∂[0, 1]`, and the product chart is a half-space slice chart at each endpoint. The
  inclusion `[0, ∞) → ℝ` is not neat, since `∂ℝ = ∅` while `∂[0, ∞) = {0}`, so the preimage of
  the ambient boundary is empty and not `∂N`; and `[0, ∞)` is not locally flat for the full-slice
  predicate with any model, which is why the boundaryless predicate cannot be used for a slice
  disc (`TauCeti.IsTopologicalSliceDisc` uses the half-plane model).
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

*Needs:* Mathlib `ModelWithCorners.boundary`, `IsBoundaryPoint`, `Topology.IsEmbedding`; the native
`TauCeti.IsLocallyFlat` with `codRestrict`, `restrict`, `homeomorph_comp`, `comp_homeomorph`,
`transHomeomorph` and `exists_isOpenEmbedding_prod`; 1.1 (the boundary manifold `∂M`).

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
Definition 1.3 for tame knots). State the positive PL statement: a PL embedding `f : N → M` of an
`n`-manifold into an `m`-manifold is locally flat when the link pair of every point of `f(N)` in
`M` is the standard sphere pair `(S^{m−1}, S^{n−1})`; the converse is not claimed. The link pair is
standard for every PL embedding in codimension zero (an open embedding, by invariance of domain)
and in codimension at least three (Zeeman's unknotting theorem, Rourke–Sanderson, Chapter 7). In
codimension one the link pair is a PL `(m−2)`-sphere in `S^{m−1}`, standard exactly when it bounds
PL balls on both sides: this is the PL Schoenflies theorem in dimension `m − 1`, which holds for
`m − 1 ≤ 3` (Alexander's theorem for PL `2`-spheres in `S³`), so every PL embedding in codimension
one is locally flat in ambient dimension at most four, while in ambient dimension at least five the
statement reduces through iterated links to the four-dimensional PL Schoenflies problem, which is
open and is not a target.

- Smooth embeddings between boundaryless manifolds are locally flat; neat smooth embeddings are
  neatly locally flat; polygonal knots in `ℝ³` are locally flat with model `ℝ × ℝ²`.
- The cone on a knotted polygon is PL embedded and not locally flat at the cone point.
- A PL embedding of a curve (dimension one) is locally flat (the polygon theorem), so the failure
  starts in dimension two; a PL embedding in codimension one is locally flat in ambient dimension
  at most four, and in codimension at least three in every dimension.

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

*Needs:* the native `TauCeti.IsLocallyFlat.of_isSmoothEmbedding`,
`TauCeti.IsLocallyFlat.of_isSmoothEmbedding_of_preimage_boundary`,
`TauCeti.SimplePolygon.isLocallyFlat_realize`, `TauCeti.isLocallyFlat_iff_isOpenEmbedding` and
`PreAbstractSimplicialComplex.link`; Mathlib `Manifold.IsSmoothEmbedding`, `FundamentalGroup`; 1.5
(PL maps); 2.1; AlgebraicTopology Stage 1 (van Kampen, for the trefoil group of the cone Check).

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

*Needs:* the native `TauCeti.isLocallyFlat_iff_isEmbedding_and_isLocallyBicollared`,
`TauCeti.IsLocallyBicollaredWithSides.exists_isBicollar`,
`TauCeti.IsLocallyBicollared.isBicollared_of_not_isPreconnected_compl_range`,
`TauCeti.brownBicollaring`, `TauCeti.IsLocallyCollared.isCollared`; Mathlib `Topology.IsEmbedding`,
`IsPreconnected`; 2.1.

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

*Needs:* the native `TauCeti.AnnulusConjecture`, `TauCeti.filledHull`, `TauCeti.CoboundAnnulus` and
`TauCeti.coboundAnnulus_smul_coe_sphere`; Mathlib `Homeomorph`, `Metric.sphere`; 2.3 (bicollars of
locally flat spheres, for the route).

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
oriented manifold as the subgroup of diffeomorphisms preserving the orientation of a chosen
oriented atlas (positive Jacobian of every chart change), and prove that it is open and closed.
For a closed oriented *connected* `M` prove that `Diff⁺(M)` is the kernel of the degree
homomorphism `Diff(M) → {±1}` (the degree of a smooth map of closed oriented connected manifolds
is DifferentialGeometry's, Layer 10), so that it has index at most two; the degree is not defined
for disconnected `M`, where the atlas description is the only one. Define `Diff(M, ∂M)` as
`TauCeti.RelativeDiff I M ∞ (I.boundary M)` for `M` with boundary; `TauCeti.DiscDiff n` is the
case of the closed ball.

- `Diff(M)` is a Hausdorff topological group for compact `M`; `Diff(M, ∂M)` and `Diff⁺(M)` are
  closed subgroups and topological groups.
- Evaluation `Diff(M) → M` at a point is continuous, so the orbit map of the tautological action
  (`Diffeomorph.applyMulAction`) is continuous.
- For connected `M` the degree is a continuous homomorphism to the discrete group `{±1}`, so
  `Diff⁺(M)` is the union of the components of degree one.

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
  symmetric group `S_k` with the discrete topology, so the definition degenerates correctly. The
  degree description does not apply to the finite set with `k ≥ 2`, nor to `M = S¹ ⊔ S¹`: the
  degree is defined for connected closed oriented manifolds only, and the swap of the two circles
  has no degree, while the atlas description makes the swap orientation-preserving. For connected
  `M` the two descriptions agree, which is the theorem stated.
- `Diff(D¹, ∂D¹)` is the group of diffeomorphisms of `[−1, 1]` fixing the endpoints; it is
  contractible (push along the graph), and `Diff(D¹)` has two components.

*Needs:* the native `TauCeti.Diff`, `Diffeomorph.weakWhitneyTopology`,
`Diffeomorph.continuous_eval_const`, `Diffeomorph.t2Space_weakWhitney`,
`Diffeomorph.isTopologicalGroup`, `TauCeti.RelativeDiff`, `TauCeti.DiscDiff`, `TauCeti.Orientable`;
Mathlib `Diffeomorph`, `IsTopologicalGroup`; DifferentialGeometry Layer 10 (the degree of a map of
closed oriented connected manifolds); 1.1 (manifolds with boundary).

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

*Needs:* the native `Diffeomorph.ofSmoothFamily`, `TauCeti.continuousOrthogonalToDiffSphere`,
`LinearIsometryEquiv.unitSphereDiffHom`, `TauCeti.Diffeotopy` and `TauCeti.Diffeotopy.toPath`;
Mathlib `Matrix.orthogonalGroup`, `ContinuousMap.Homotopy`, `Topology.IsClosedEmbedding`; 3.1 (the
topology and `Diff⁺`); DifferentialGeometry Layer 10 (`degree_antipodal`).

### 3.3 The Smale conjecture, Cerf's theorem and Watanabe's theorem

State the **Smale conjecture** as the native `TauCeti.SmaleConjecture`: the inclusion
`O(4) → Diff(S³)` is a homotopy equivalence (Hatcher, *A proof of the Smale conjecture*, Ann. of
Math. 117 (1983); its disc form is that `Diff(D³, ∂)` is contractible). State **Cerf's theorem**
as the native `TauCeti.CerfTheorem`, the orientation-free form: every smooth diffeomorphism of
`S³` is joined, in the weak Whitney topology, to the restriction of an orthogonal transformation
of `ℝ⁴`, that is, `π₀(O(4)) → π₀(Diff(S³))` is surjective (Cerf, *Sur les difféomorphismes de la
sphère de dimension trois (Γ₄ = 0)*, LNM 53, Théorème 1). The native library proves that this map
is injective in every dimension (`TauCeti.joined_orthogonalToDiffSphere_iff`: two orthogonal
transformations are isotopic as diffeomorphisms of `Sⁿ` exactly when their determinants agree),
hence that Cerf's theorem holds exactly when `Diff(S³)` has two path components
(`TauCeti.cerfTheorem_iff_natCard_zerothHomotopy_eq_two`), and that the Smale conjecture implies
Cerf's theorem (`TauCeti.SmaleConjecture.cerfTheorem`, a homotopy equivalence being surjective on
path components); these are consumed, not targets. Prove the **comparison with the classical
form**: `TauCeti.CerfTheorem` holds exactly when `π₀(Diff⁺(S³)) = 0` for the
orientation-preserving subgroup of 3.1 (a diffeomorphism joined to an orthogonal map of
determinant `−1` has degree `−1`, so under `CerfTheorem` an element of `Diff⁺(S³)` is joined to an
element of `SO(4)`, hence to the identity, `SO(4)` being path connected; conversely a
diffeomorphism of degree `−1` composed with a reflection has degree `+1`), and prove Cerf's
corollary `Γ₄ = 0`: every diffeomorphism of `S³` extends to a diffeomorphism of `D⁴` (an
orthogonal map extends linearly, and an isotopy to it extends over a collar of 1.1). State
**Watanabe's theorem** as the native `TauCeti.WatanabeTheorem`: `π₁(Diff(D⁴, ∂))`, based at the
identity, has an element of infinite order (Watanabe, *Some exotic nontrivial elements of the
rational homotopy groups of `Diff(S⁴)`*, Theorem 1.1 and Remark 1.2: the evaluation of
Kontsevich's classes gives a surjection `π_k BDiff(D⁴, ∂) ⊗ ℚ → A_k` for every `k ≥ 1`, `A₁ = 0`
and `A₂ ≅ ℚ`, so the first class lies in `π₂ BDiff(D⁴, ∂) ⊗ ℚ ≅ π₁ Diff(D⁴, ∂) ⊗ ℚ`); it refutes
the four-dimensional disc Smale conjecture
(`TauCeti.WatanabeTheorem.not_contractibleSpace_discDiff_four`), which is the disc form of
`[Kir97, Problem 4.34]` (`Diff(S⁴) ≃ O(5)`?) and the smooth half of `[Kir97, Problem 4.126]`.

- Smale: the specific map `continuousOrthogonalToDiffSphere 3 ∞` is a homotopy equivalence, not
  merely some equivalence of the two spaces; `O(4)` is compact and `Diff(S³)` is not, so no
  isomorphism of topological groups is claimed.
- Cerf: every diffeomorphism of `S³` is isotopic to an orthogonal one; equivalently
  `π₀(Diff(S³))` has two elements; equivalently every orientation-preserving diffeomorphism of
  `S³` is diffeotopic to the identity; hence `Γ₄ = 0`.
- Watanabe: an element of `π₁(Diff(D⁴, ∂), id)` of infinite order; `Diff(D⁴, ∂)` is not
  contractible.

**Checks.**

- The reflection of `S³` has degree `−1` and is not isotopic to the identity
  (`TauCeti.not_pathConnectedSpace_diff_sphere`), so `π₀(Diff(S³))` has at least two elements;
  the orientation-free form asserts "at most two", not `π₀(Diff(S³)) = 0`, and the formula
  `π₀ = ℤ/2` for the full group is the correct one.
- `Diff(S³)` is not compact: the time-`t` map of the gradient flow of a height function on `S³`
  has derivative of norm `e^{t}` at a hyperbolic fixed point, unbounded in `t`, while the image of
  `O(4)` is compact; a topological-group isomorphism `Diff(S³) ≅ O(4)` is false.
- The statement for `n = 2` (Smale, `Diff(S²) ≃ O(3)`) and `n = 1` (`Diff(S¹) ≃ O(2)`) are true
  and are the same shape with `3` replaced by `n`; the shape with `4` is what Watanabe's theorem
  disproves in its disc form, so the dimension is part of the statement.
- The orientation-free form in dimension `1`: every diffeomorphism of `S¹` is isotopic to a
  rotation or to a reflection, so `π₀(Diff(S¹))` has two elements, the same shape as
  `TauCeti.CerfTheorem`; in dimension `6` the shape fails, since `π₀(Diff⁺(S⁶)) ≅ Θ₇ ≅ ℤ/28`
  (Kervaire–Milnor, *Groups of homotopy spheres I*, with the identification `Γ₇ = Θ₇`), so the
  dimension `3` is the content of Cerf's theorem.

*Needs:* the native `TauCeti.SmaleConjecture`, `TauCeti.CerfTheorem`,
`TauCeti.SmaleConjecture.cerfTheorem`, `TauCeti.cerfTheorem_iff_natCard_zerothHomotopy_eq_two`,
`TauCeti.joined_orthogonalToDiffSphere_iff`, `TauCeti.orthogonalToDiffSphere`,
`TauCeti.WatanabeTheorem`, `TauCeti.WatanabeTheorem.not_contractibleSpace_discDiff_four`,
`TauCeti.DiscDiff`; Mathlib `HomotopyGroup`, `ZerothHomotopy`, `Joined`,
`ContinuousMap.HomotopyEquiv`, `ContractibleSpace`; 1.1 (collars, for `Γ₄ = 0`); 3.1 (`Diff⁺(S³)`,
the degree, `Diff(D⁴, ∂)`); 3.2 (the reference inclusion).

### Examples

`Diff(S¹)` with its rotations and reflection; the reference inclusions `O(n + 1) → Diff(Sⁿ)`;
`Diff(D¹, ∂D¹)` contractible; the three headline statements, all three statable at the pins and
stated in `Suggested.lean`.

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
`H₁(S³ ∖ K) ≅ ℤ`, generated by a meridian (Alexander duality, Hatcher, *Algebraic Topology*,
Corollary 3.45, derived from the relative form Theorem 3.44; for the smooth knots used here the
Mayer–Vietoris sequence of the decomposition of `S³` into the closed tube of `K` (1.3) and its
complement gives `ℤ ⊕ H₁(complement) ≅ H₁(T²) = ℤ²`, which is the route used), the class of the
second knot being the integer multiple of the meridian.

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

*Needs:* the native `TauCeti.SmoothCircleEmbedding` with `rotate`, `reverse`, `greatCircle`,
`TauCeti.unknot`, `TauCeti.UnorientedSmoothCircleEmbedding`, `TauCeti.SmoothLinkEmbedding` with
`relabel`, `reverse`, `singletonEquiv`, `SmoothLinkEmbedding.SmoothAmbientIsotopic`,
`TauCeti.Diffeotopy`; Mathlib `Manifold.IsImmersion`, `Circle`; 1.3 (the normal bundle and closed
tube of a knot); AlgebraicTopology Stage 3 (Mayer–Vietoris) and Stage 2 (singular homology) for
`H₁(S³ ∖ K) ≅ ℤ`.

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

*Needs:* the native `TauCeti.OrientedPDCode` with `writhe`, `mirror`, `reverse`, `relabel`, `face`,
`TauCeti.PDCode.kink`, `TauCeti.BasedOrientedGaussCode`, `TauCeti.FramedBasedOrientedGaussCode`,
`TauCeti.BasedUnorientedGaussCode`, `TauCeti.BraidWord`, `TauCeti.BraidWord.toBraid`,
`TauCeti.GridDiagram`, `TauCeti.OrientedPDCode.IsReidemeisterMove`, `ReidemeisterEquiv`,
`TauCeti.MarkovBraid`, `TauCeti.IsMarkovMove`, `TauCeti.MarkovEquiv`,
`MarkovEquiv.componentCount_eq`, `TauCeti.BraidWord.ArtinEquiv`, `TauCeti.BraidWord.writhe_closure`,
`TauCeti.GridDiagram.MovesTo`, `TauCeti.not_markovEquiv_one_of_ne`; Mathlib `Equiv.Perm`,
`PresentedMonoid`.

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
for smooth links `L, L' : SmoothLinkEmbedding (𝓡 3) ℝ³ n` with generic directions `v, v'`, there
is a permutation `σ` of `Fin n` with `L` smoothly ambient isotopic to `L'.relabel σ` if and only if
`D_v(L)` and `D_{v'}(L')` are Reidemeister equivalent (Lickorish, Chapter 1, Theorem 1.7;
Burde–Zieschang, Chapter 1). The relabelling is part of the statement: the native
`SmoothAmbientIsotopic` is componentwise (one diffeotopy carries the `i`-th component onto the
`i`-th component), while an oriented PD-code carries no component labels and the relabelling move
permutes its crossings and half-edges freely, so the diagram forgets the labels. The forward
direction is a one-parameter general-position argument along the isotopy, a Cerf-theoretic
statement on the codimension-one degeneracies of projections; the converse realises each move by
an isotopy supported in a ball and then relabels. Define the **realization** of a planar PD-code
as a polygonal link in `ℝ³` (the inverse edge of the spanning tree), and prove that its projection
recovers the code. Fix the spanning tree of presentations: the PD-code is the hub; braid closure,
Gauss codes and the realization are its edges; the grid-diagram edge is CombinatorialHeegaardFloer
Lane K's (Cromwell's theorem), which consumes the hub.

- Markov: `MarkovEquiv ⟨n, w.toBraid⟩ ⟨m, v.toBraid⟩ ↔ ReidemeisterEquiv w.closure v.closure`.
- Every planar oriented PD-code is the code of a generic projection of a polygonal link, and every
  smooth link has a generic projection; the diagram of the braid closure of `w` realised as a
  closed braid is `w.closure` up to relabelling.
- Reidemeister: the classes of smooth links in `ℝ³` under ambient isotopy and relabelling biject
  with the Reidemeister classes of planar oriented PD-codes; for knots (`n = 1`) the relabelling
  is trivial and the bijection is with ambient isotopy classes.

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
- The two-component links `L = (U, T)` (component `0` an unknot, component `1` a right-handed
  trefoil, far apart) and `L' = L.relabel (swap)` have the same diagram up to the relabelling move,
  so `D(L)` and `D(L')` are Reidemeister equivalent, but no diffeotopy carries `L 0` (unknotted,
  `Δ = 1`) onto `L' 0 = T` (`Δ = t − 1 + t⁻¹`), so `L` and `L'` are not `SmoothAmbientIsotopic`;
  they are ambient isotopic after the relabelling by the swap, as the theorem states. An "if and
  only if" without the permutation would be false for this pair.

*Needs:* the native `TauCeti.BraidWord.closure`, the Reidemeister invariance of closures under
`TauCeti.BraidWord.ArtinEquiv`, `TauCeti.MarkovEquiv`, `TauCeti.OrientedPDCode.ReidemeisterEquiv`,
`TauCeti.SmoothLinkEmbedding.relabel`, `SmoothLinkEmbedding.SmoothAmbientIsotopic`,
`TauCeti.markovEquiv_sigma_last_one_one`; Mathlib `Manifold.IsImmersion`, `Equiv.Perm`; 4.1; 4.2
(planarity, moves); DifferentialGeometry Layer 10 (Sard's theorem, for the density of generic
directions).

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
`g_s(K)` are finite, and that `g_s^{top}(K) ≤ g_s(K) ≤ g(K)` (push the interior of a Seifert surface
into `D⁴`). The invariance of `g_s` and `g_s^{top}` under concordance and the subadditivity of
`g_s` under connected sum are stated in 6.1, once the concordance relations and the connected sum
of knots are defined.

- `g_s(K) < ⊤` for every knot in `S³`; `g_s(unknot) = 0`; `g_s(K) = g_s(K.reverse) = g_s(mirror K)`.
- `g_s^{top} ≤ g_s ≤ g`.
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

*Needs:* the native `TauCeti.IsSmoothlySlice`, `TauCeti.IsTopologicallySlice`,
`TauCeti.IsSmoothlySlice.isTopologicallySlice`, `TauCeti.isSmoothlySlice_unknot`,
`TauCeti.SmoothSliceSurface`, `TauCeti.sliceGenus`, `TauCeti.IsSmoothlySlice.sliceGenus_eq_zero`,
`TauCeti.IsLocallyFlat`; Mathlib `ℕ∞`; 4.3 (diagrams, for Seifert's construction); 2.1 (neat locally
flat surfaces in `D⁴`).

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
unit `a` of a commutative ring and every braid word `w` on `n + 1` strands,
`jonesTrace ⟨n, w.toBraid⟩ a = δ · normalizedKauffmanBracket (w.closure) a`, where
`δ = jonesDelta a = −(a² + a⁻²)` is the loop value of the Temperley–Lieb algebra at `q = a²`, the
value at which the Markov trace of `jonesTrace` is taken, and the bracket is normalised by
`⟨unknot⟩ = 1` (`TauCeti.PDCode.kauffmanBracket` has a code with `c` crossing-free circles and no
crossing at `δ^{c−1}`), so that the factor `δ` is the unknot's trace (Jones, *A polynomial
invariant for knots via von Neumann algebras*, Bull. AMS 12 (1985), and the Temperley–Lieb
state-sum comparison of Kauffman, *State models and the Jones polynomial*, Topology 26 (1987)).
The native values pin both sides: on the one-strand braid both are `δ`
(`TauCeti.MarkovBraid.jonesTrace_one_strand`), and on `σ₀³` both are
`δ · (a⁻⁴ + a⁻¹² − a⁻¹⁶)` (`TauCeti.MarkovBraid.jonesTrace_sigma_pow_three` against
`TauCeti.normalizedKauffmanBracket_rightHandedTrefoilPDCode`).

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

*Needs:* the native `TauCeti.KnotTheory.alexander`, `alexanderMatrix`, `enlargeColumn`,
`enlargeRow`, `invert_alexander`, `eval₂_one_alexander`,
`TauCeti.KnotTheory.IntegralSquareMatrix.SEquivalent`, `TauCeti.OrientedPDCode.AlexanderModule`,
`elementaryIdeal`, `TauCeti.burau`, `TauCeti.MarkovBraid.burauAlexander`,
`TauCeti.MarkovEquiv.associated_burauAlexander`, `TauCeti.PDCode.kauffmanBracket`,
`TauCeti.OrientedPDCode.normalizedKauffmanBracket`, `TauCeti.OrientedPDCode.jonesPolynomial` with
its invariance lemmas, `TauCeti.jimbo`, `TauCeti.MarkovBraid.jonesTrace`, `jonesDelta`,
`TauCeti.homflySpecialization`; Mathlib `LaurentPolynomial`, `Matrix.det`, `Ideal`; 4.1 (linking
numbers, for the Seifert form); 4.2; 4.3 (Reidemeister classes as the domain of the invariants).

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

*Needs:* the native `TauCeti.FreedmanSliceTheorem`, `TauCeti.SmoothCircleEmbedding.KnotGroup`,
`HasPerfectCommutatorSubgroup`, `TauCeti.hasPerfectCommutatorSubgroup_unknot`,
`TauCeti.OrientedPDCode.AlexanderModule`; Mathlib `commutator`, `Group.IsPerfect`,
`FundamentalGroup`; 4.5 (the Alexander polynomial of a diagram and its module); AlgebraicTopology
Stage 5 (covering spaces, for the infinite cyclic cover).

### Examples

The unknot, the right-handed trefoil `σ₀³`, the figure-eight, the Hopf link and the two-component
unlink are the standing examples; their Alexander, Jones and signature values pin every convention
of this layer.

### Dependencies

Mathlib's `Quandle`, `PresentedMonoid`, `LaurentPolynomial` and matrices; the native
presentations, moves, polynomials, slice and knot-group declarations of the supplier contracts;
Layer 1 for tubular neighbourhoods (framings) and Layer 2 for locally flat discs. Layer 6 is not a
dependency: its signature argument appears in this layer's Checks as a witness only.

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
for a knot, generated by the meridian (Alexander duality, Hatcher, *Algebraic Topology*, Corollary
3.45; proved here by the Mayer–Vietoris sequence of `S³ = N(K) ∪ X_K` along the boundary torus, as
in 4.1). Define the **meridian** of a component as
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

*Needs:* the native `TauCeti.SolidTorus`, `TauCeti.IsSolidTorusNeighborhood`,
`TauCeti.exists_isSolidTorusNeighborhood`, `IsSolidTorusNeighborhood.frontier_image`,
`exteriorFrontierHomeomorph`, `TauCeti.IsCompactConnectedThreeManifold`; Mathlib `stereographic`;
1.3 (uniqueness of tubular neighbourhoods); 4.1 (knots, linking numbers); 4.4 (Seifert surfaces);
AlgebraicTopology Stage 3 (Mayer–Vietoris).

### 5.2 Slopes and framings of the boundary torus

Consume `TauCeti.Slope M` (primitive classes modulo sign in a `ℤ`-module), `TauCeti.BoundaryTorus`
(a space homeomorphic to `T²` with its first homology), `TauCeti.FramedBoundaryTorus` (a boundary
torus with an ordered basis `(μ, λ)` of `H₁(T; ℤ)`), its `meridian` (value `∞`), `longitude`
(value `0`), `value : Slope T.H → ℚ ∪ {∞}` and the bijection `slopeEquiv`, and the native
**framings of a knot exterior**: a parametrization `e : S¹ × S¹ ≃ₜ T` frames `T` by its two
coordinate circles (`FramedBoundaryTorus.ofHomeomorph e`), the class of the `(p, q)` curve
`t ↦ e(e^{2πipt}, e^{2πiqt})` has coordinates `(p, q)` and, for coprime `p` and `q`, slope value
`p/q` (`FramedBoundaryTorus.torusCurveClass`, `value_mk_torusCurveClass`), which is the classical
dictionary `p/q ↔ p·μ + q·λ` (Rolfsen, Chapter 9); the boundary torus of the exterior of a knot
with solid torus neighbourhood `Φ` is framed by `Φ` (`IsSolidTorusNeighborhood.framedBoundaryTorus`:
the meridian is `t ↦ Φ(e^{2πit}, 1)`, the boundary of a disc fibre, and the longitude is the
push-off `t ↦ Φ(1, e^{2πit})` of the knot); and, when the ambient space has vanishing reduced
integral homology in degrees `1` and `2`, the **framing number** `n` of `Φ` (the longitude of `Φ`
is homologous in the knot complement to `n` times the meridian,
`IsSolidTorusNeighborhood.framingNumber`), the isomorphism `H₁(X ∖ K; ℤ) ≅ ℤ` sending the meridian
to `1` (`complementHomologyEquiv`) and the **preferred framing** `(μ, λ − n·μ)`
(`IsSolidTorusNeighborhood.preferredFramedBoundaryTorus`), whose longitude generates the kernel
of `H₁(T) → H₁(X ∖ K)` (`ker_boundaryHomologyMap`) and in which a class goes to its meridian
coordinate (`complementHomologyEquiv_boundaryHomologyMap_preferred`). For `S³` the homology
hypotheses are the native vanishing theorems for the sphere. Prove the **identification with the
Seifert longitude**: for a knot in `S³` the preferred longitude is, up to isotopy on the torus,
the boundary of a Seifert surface (4.4) pushed to the boundary torus, the unique simple closed
curve on the torus meeting the meridian once and null-homologous in the exterior (Rolfsen,
Chapter 2, Section E; Chapter 9, Section F). Prove that an orientation-reversing diffeomorphism
of `S³` sends the slope `p/q` of `K` to the slope `−p/q` of the mirror image, and that reversing
the orientation of `Φ` (precomposing with the reflection of `D²`) negates the value of every
slope.

- The slopes of a framed torus are `ℚ ∪ {∞}`; `∞` is the meridian and `0` the longitude; `p/q` and
  `−p/−q` are the same slope and `p/q`, `−p/q` are different unless `p = 0`.
- Changing the framing by `λ' = λ + kμ` sends the value `p/q` of a slope to `(p − kq)/q`: the
  class `pμ + qλ = (p − kq)μ + qλ'`; the preferred framing is the case `k = −n`.
- The class `(0, 0)` is not primitive and names no slope; `(2, 2)` is not primitive; `(1, 0)` and
  `(0, 1)` are.

**Checks.**

- `slopeValue (1, 0) = ∞`, `slopeValue (0, 1) = 0`, `slopeValue (3, 2) = 3/2`, and
  `slopeValue (−3, −2) = 3/2` as well, so the sign quotient is correct; `(2, 4)` is excluded by
  primitivity (`gcd = 2`).
- The standard neighbourhood `TauCeti.unknotSolidTorus` of the unknot has framing number `0`
  (`framingNumber_unknotSolidTorus`), so its framing is the preferred one
  (`preferredFramedBoundaryTorus_unknotSolidTorus`); its exterior is the complementary solid torus
  (`unknotExteriorHomeomorph`), whose own framing exchanges meridian and longitude, so the value
  map between the two framings is `x ↦ 1/x`, with `∞ ↔ 0`.
- A solid torus neighbourhood of the right-handed trefoil whose longitude is the boundary of the
  cabling annulus (the fibre of the Seifert fibration of the exterior) has framing number `6`,
  the torus-knot framing `pq` of the `(2, 3)` torus knot, not `0`; its preferred framing
  subtracts `6μ`.
- The preferred longitude `λ₀` has value `0 = 0/1` in the preferred framing; in the framing of
  the cabling neighbourhood (`λ = λ₀ + 6μ`) it is `λ − 6μ`, of value `−6`; a formula sending
  `p/q` to `(p + kq)/q` would give `+6` and is excluded.
- Reversing the orientation of `Φ` turns the framing number `n` into `−n` and the value `r` into
  `−r`, so the surgery coefficient of a knot in `S³` is defined up to this sign unless `Φ` is
  required to preserve orientation; 5.4 and 7.3 use this.

*Needs:* the native `TauCeti.Slope`, `TauCeti.IsPrimitive`, `TauCeti.BoundaryTorus`,
`TauCeti.FramedBoundaryTorus` with `meridian`, `longitude`, `value`, `slopeEquiv`,
`TauCeti.slopeEquivStd`, `FramedBoundaryTorus.ofHomeomorph`, `FramedBoundaryTorus.torusCurveClass`,
`FramedBoundaryTorus.value_mk_torusCurveClass`, `IsSolidTorusNeighborhood.framedBoundaryTorus`,
`IsSolidTorusNeighborhood.framingNumber`, `IsSolidTorusNeighborhood.preferredFramedBoundaryTorus`,
`IsSolidTorusNeighborhood.complementHomologyEquiv`,
`IsSolidTorusNeighborhood.ker_boundaryHomologyMap`,
`TauCeti.isZero_reducedSingularHomologyFunctor_one_sphere_euclideanSpace_fin_four`,
`TauCeti.unknotSolidTorus`, `TauCeti.unknotExteriorHomeomorph`; Mathlib `OnePoint ℚ`; 4.4 (Seifert
surfaces); 5.1 (the boundary torus and the exterior).

### 5.3 Dehn filling, surgery and the unknot identities

Consume the native **Dehn filling** `TauCeti.DehnFilling h s Y` of the exterior `E` of a knot
with solid torus neighbourhood `Φ` (`h : IsSolidTorusNeighborhood f Φ`) along a slope `s` of its
framed boundary torus, recorded inside the filled space `Y`: closed embeddings of `E` and of the
solid torus `D² × S¹` into `Y` whose images cover `Y` and meet only along the boundary torus of
the solid torus, glued to `∂E` by a homeomorphism `g` of `S¹ × S¹` whose **filling slope**, the
class of the image of the meridian `∂D² × {1}` (`IsSolidTorusNeighborhood.fillingSlope`), is `s`
(Rolfsen, Chapter 9, Section F); gluing by the identity has the meridian of `Φ` as filling slope
and gluing by the exchange of the two factors has its longitude (`fillingSlope_refl`,
`fillingSlope_prodComm`). Consume its **existence** along every slope (`exists_dehnFilling`: the
pushout `dehnFillingSpace` of the boundary inclusions, Hausdorff, and compact when the ambient
space is), the **trivial filling** along the meridian, the ambient space itself
(`meridianDehnFilling`), and its **uniqueness for matrix gluings**
(`DehnFilling.exists_homeomorph_of_isotopic_torusHomeomorph`: two fillings along the same slope
whose gluings are isotopic to the homeomorphisms induced by elements of `GL₂(ℤ)` are homeomorphic
by the identity on `E`, because a matrix fixing the meridian up to sign extends over the solid
torus; every slope is the filling slope of such a matrix gluing,
`exists_fillingSlope_torusHomeomorph_eq`). Prove the **isotopy classification of torus
homeomorphisms**, the one input the native uniqueness leaves open: every homeomorphism of
`S¹ × S¹` is isotopic to the homeomorphism induced by its action on `H₁`, an element of `GL₂(ℤ)`
(Rolfsen, Chapter 2, Section D; Farb–Margalit, *A Primer on Mapping Class Groups*, Theorem 2.5,
for the orientation-preserving ones, the reflection supplying the rest), so that the homeomorphism
type of a filling depends only on the slope. Prove that a filling of a knot exterior in a closed
`3`-manifold is a closed `3`-manifold with a smooth structure in which the two pieces are smooth
submanifolds with boundary, unique up to diffeomorphism (Moise, 11.2; or the collars of 1.1 and
the gluing of 1.2 on the native embeddings). Define **Dehn surgery** `S³_K(r)` on a knot `K` in
`S³` with surgery coefficient `r ∈ ℚ ∪ {∞}` as the native `dehnFillingSpace` for a matrix gluing
realising the slope of value `r` in the preferred framing of 5.2, so that the choice of matrix
does not matter up to homeomorphism, `r = ∞` is the trivial filling and `r = 0` the filling along
the preferred longitude; **integral surgery** with coefficient `n ∈ ℤ` is the filling along the
longitude of a neighbourhood with framing number `n`. Consume **surgery on a link** component by
component: the native `TauCeti.LinkDehnFilling` of the exterior of a link with pairwise disjoint
neighbourhoods (`TauCeti.IsSolidTorusLinkNeighborhood`), its existence along every family of
slopes (`exists_linkDehnFilling`), and the surgery slopes of coefficients `r i`, read in the
preferred framing of each component alone (`IsSolidTorusLinkNeighborhood.surgerySlope`; the
coefficient `∞` on every component gives back the ambient space). Consume the native **unknot
identities**, which pin the slope convention: the standard neighbourhood `unknotSolidTorus` has
the preferred framing (5.2); `∞`-surgery is `S³`, the trivial filling; `0`-surgery is `S¹ × S²`
(`TauCeti.unknotZeroDehnFilling`, the two solid tori over the closed hemispheres of `S²`, glued
by the exchange of factors, `unknotZeroDehnFilling_gluing`; every filling along the preferred
longitude with a matrix gluing is homeomorphic to it,
`nonempty_homeomorph_circle_prod_sphere_of_unknot_longitude`); and for coprime `p ≥ 1` and `q`
the filling along the slope of value `p/q` is realised inside the lens space `L(p; ℓ₀, ℓ₁)` for
every `ℓ` with `ℓ₁ = −q·ℓ₀` in `ℤ/p` (`TauCeti.unknotLensSpaceDehnFilling`, whose two pieces are
the two solid tori of the genus-one splitting of the lens space, and
`nonempty_homeomorph_lensSpace_of_unknot_slopeValue` for every filling with a matrix gluing). With
`ℓ = ![1, q]` this says that `L(p, q) = TauCeti.LensSpace p ![1, q]` is the `−p/q`-surgery on the
unknot; Rolfsen's convention (Chapter 9, Section G, Example 1) assigns `L(p, q)` to `p/q`, the
difference being the orientation of `S³`. Consume the native lens spaces: `L(p, q)` is
`TauCeti.LensSpace p ![1, q]` for `p ≥ 1` and a unit `q` of `ℤ/p`, the orbit space of `S³ ⊆ ℂ²`
under the rotation `(z, w) ↦ (ζz, ζ^q w)`, `ζ = e^{2πi/p}`, a closed analytic `3`-manifold with
`π₁(L(p, q)) ≅ ℤ/p` (`LensSpace.fundamentalGroupMulEquiv`), hence `H₁(L(p, q)) ≅ ℤ/p`, and with
`p` a homeomorphism invariant (`LensSpace.eq_of_homeomorph`). Prove the **surgery description up
to orientation**: `S³_U(p/q) ≃ₜ L(p, q)`, orientation ignored, since the reflection
`(z, w) ↦ (z, w̄)` of `S³` descends to a homeomorphism `L(p, −q) ≃ₜ L(p, q)` (Hatcher, *Notes on
Basic 3-Manifold Topology*, Section 2.1: his `L_{p/q}` is two solid tori glued so that a meridian
of the second goes to the curve of slope `p/q` on the first, identified with the quotient of `S³`
by the rotation `(z, w) ↦ (e^{2πi/q}z, e^{2πip/q}w)` up to a sign fixed by orientations; the
filling along `pμ + qλ` of the unknot exterior, on which `λ` bounds a meridian disc and `μ` is a
longitude, is his `L_{q/p}`, the quotient of `S³` by `(e^{2πi/p}z, e^{2πiq/p}w)`). Prove the
**remaining unknot identity** `S³_U(1/n) ≃ S³` for every `n`: a Dehn twist of the exterior solid
torus along its meridian disc acts on the boundary torus by `μ ↦ μ + kλ`, `λ ↦ λ`, and carries
the slope `μ + nλ` to the meridian `μ` for `k = −n`, so the filling is the trivial one. Prove
`H₁(S³_K(p/q)) ≅ ℤ/p` for every knot `K` (Mayer–Vietoris of the exterior and the solid torus,
with `H₁(E) ≅ ℤ` generated by the meridian and the preferred longitude vanishing, 5.2). Prove the
**classification of lens spaces** on the native carrier: `L(p, q) ≃ₜ L(p, q')` if and only if
`q' ≡ ±q^{±1} (mod p)` (Hatcher, Theorem 2.5, whose `L_{p/q}` has `H₁ ≅ ℤ/q` and is `L(q, p)`
here, so that his condition `p' ≡ ±p^{±1} (mod q)` is this one with the two parameters renamed);
the invariance of `p` is the native `eq_of_homeomorph`, and the theorem adds the classification
for fixed `p`. Consume **surgery on a framed sphere** in general dimension: the native
`TauCeti.SphereSurgery` records, inside a space `Y`, the result of removing the open tube
`φ(S^k × int D^q)` of a framed sphere `φ : S^k × D^q → M` and gluing `D^{k+1} × S^{q−1}` along
`S^k × S^{q−1}` (Milnor, *A procedure for killing homotopy groups of differentiable manifolds*,
Section 1; Milnor, *Lectures on the h-cobordism Theorem*, Section 3), and the native
identification of surgery along the framed circle `(x, y) ↦ Φ(y, x)` of a solid torus
neighbourhood with the Dehn filling along the longitude of `Φ` (`solidTorusFramedSphere`,
`SphereSurgery.toDehnFilling`); prove that a surgery on a framed `k`-sphere in a closed smooth
`n`-manifold is a closed `n`-manifold with a smooth structure extending the given ones off the
seam (1.2), and that integral surgery with coefficient `n` on a knot in `S³` is surgery along the
framed circle of a neighbourhood with framing number `n`. State the **Lickorish–Wallace
theorem**: every closed connected orientable `3`-manifold is integral surgery on a framed link in
`S³` (Lickorish, Chapter 12; Rolfsen, Chapter 9).

- A Dehn filling of a knot exterior in a closed `3`-manifold is a closed `3`-manifold determined
  up to homeomorphism, and up to diffeomorphism, by the slope.
- `S³_U(p/q) ≃ₜ TauCeti.LensSpace p ![1, q]` for coprime `p ≥ 1` and `q`, orientation ignored;
  with orientations, the slope-`p/q` filling is `LensSpace p ![1, −q]`; so `S³_U(p/q)` has
  `π₁ ≅ ℤ/p` and is spherical (8.1).
- `H₁(S³_K(p/q)) ≅ ℤ/p`; in particular `S³_K(0)` has `H₁ ≅ ℤ` and `S³_K(1/n)` is a homology sphere.
- Surgery on the mirror image along `−p/q` is the orientation reversal of surgery on `K` along
  `p/q`.

**Checks.**

- `S³_U(0) = S¹ × S²` has `H₁ = ℤ`; `S³_U(∞) = S³` has `H₁ = 0`; `S³_U(2) = L(2, 1) = ℝP³` has
  `H₁ = ℤ/2`, and `TauCeti.LensSpace 2 ![1, 1]` is `S³/{±1} = ℝP³` with `π₁` of order `2`
  (`card_fundamentalGroup`); here the native sign is invisible, since `−1 = 1` in `ℤ/2`.
  `S³_U(1) = S³` by the identity `1/n`, consistent with `H₁ = ℤ/1 = 0` and with
  `LensSpace 1 ![1, 1]` being the quotient of `S³` by the trivial group.
- The sign witness is `p = 5`: the slope-`5/2` filling of the unknot is the native
  `LensSpace 5 ![1, −2] = LensSpace 5 ![1, 3]`, homeomorphic to `L(5, 2)` by the reflection and
  not to `L(5, 1)` (`3 ≢ ±1 (mod 5)`); a convention giving `LensSpace 5 ![1, 2]` directly would
  differ from the native one by the orientation of `S³` and agree with it as unoriented spaces.
- The surgery description with the two parameters exchanged, `S³_U(p/q) ≃ LensSpace q ![1, p]`,
  is excluded by `π₁`: `S³_U(5/2)` has `H₁ = ℤ/5` while `LensSpace 2 ![1, 5] = ℝP³` has `π₁` of
  order `2`.
- `L(5, 1)` and `L(5, 2)` have the same homology `ℤ/5` and are not homeomorphic, since
  `2 ≢ ±1^{±1} (mod 5)`; `L(7, 1)` and `L(7, 6)` are homeomorphic since `6 ≡ −1`; `L(5, 2)` and
  `L(5, 3)` are homeomorphic since `3 ≡ 2⁻¹ (mod 5)`.
- The Poincaré homology sphere is `S³_T(−1)` on the left-handed trefoil (equivalently `+1` on the
  right-handed one): `H₁ = 0` by the formula, `π₁` the binary icosahedral group of order `120`,
  not trivial, which is the first instance of Property P.
- Surgery on the framed unlink with framings `0, 0` gives `S¹ × S² # S¹ × S²`; with framings
  `1, 1` it gives `S³`; the Hopf link with framings `0, 0` gives `S³` and with `0, n` gives `S³`
  again (a slam-dunk), so framings on linked components interact.
- A convention reading the slope off the image of the longitude of the filling solid torus, rather
  than of its meridian, would assign the exchange of factors the meridian of `Φ` and make the
  `0`-surgery on the unknot the trivial filling; `unknotZeroDehnFilling_gluing` with
  `fillingSlope_prodComm` excludes it.

*Needs:* Mathlib `Diffeomorph`, `Homeomorph`, `FundamentalGroup`, `ZMod`,
`Matrix.GeneralLinearGroup`; the native `TauCeti.DehnFilling`,
`IsSolidTorusNeighborhood.fillingSlope`,
`IsSolidTorusNeighborhood.dehnFillingSpace`, `IsSolidTorusNeighborhood.exists_dehnFilling`,
`IsSolidTorusNeighborhood.meridianDehnFilling`,
`IsSolidTorusNeighborhood.exists_fillingSlope_torusHomeomorph_eq`,
`DehnFilling.exists_homeomorph_of_isotopic`,
`DehnFilling.exists_homeomorph_of_isotopic_torusHomeomorph`,
`TauCeti.unknotZeroDehnFilling`, `TauCeti.unknotLensSpaceDehnFilling`,
`DehnFilling.nonempty_homeomorph_lensSpace_of_unknot_slopeValue`, `TauCeti.LinkDehnFilling`,
`IsSolidTorusLinkNeighborhood.exists_linkDehnFilling`, `IsSolidTorusLinkNeighborhood.surgerySlope`,
`TauCeti.SphereSurgery`, `SphereSurgery.toDehnFilling`, `TauCeti.LensSpace`,
`LensSpace.fundamentalGroupMulEquiv`, `LensSpace.card_fundamentalGroup`,
`LensSpace.eq_of_homeomorph`
and the manifold instances of `Geometry/Manifold/Instances/LensSpace.lean`; 1.1 (collars); 1.2
(gluing, for the smooth structures); 5.1; 5.2; 11.2 (Moise's theorem, for the smooth structure of
a filling); AlgebraicTopology Stage 1 (van Kampen) and Stage 3 (Mayer–Vietoris) for the `H₁` and
`π₁` computations.

### 5.4 Property P, Property R and cosmetic surgeries

State **Property P** on the native fillings (`property_p`): for every knot
`K : SmoothCircleEmbedding (𝓡 3) S³` that is not smoothly ambient isotopic to `TauCeti.unknot`,
every solid torus neighbourhood `Φ` of `K`, every slope `s` of its boundary torus other than the
meridian, every Dehn filling `F : DehnFilling h s Y` and every base point `y`, the group
`π₁(Y, y)` is nontrivial (`[Kir97, Problem 1.15]`). Two routes: Kronheimer–Mrowka, *Witten's
conjecture and Property P*, Geom. Topol. 8 (2004), Theorem 2 (for `K` nontrivial, `+1` surgery
admits a nontrivial homomorphism `π₁ → SO(3)`, so Conjecture 1, that `S³_K(+1)` is not a homotopy
sphere, holds; `−1` by mirroring; all other slopes through the cyclic surgery theorem of
Culler–Gordon–Luecke–Shalen, Ann. of Math. 125 (1987), and Moser's torus-knot surgeries), or the
Poincaré conjecture (8.4) together with the Gordon–Luecke theorem below. State **Property R** on
the native fillings (`property_r`): for `K` as above and every `Φ`, no Dehn filling of the
exterior along the longitude of the preferred framing of 5.2 is homeomorphic to `S¹ × S²` (Gabai,
*Foliations and the topology of 3-manifolds III*, J. Differential Geom. 26 (1987), `[Kir97,
Problem 1.16]`). State the **Gordon–Luecke theorem** in the same form (`gordon_luecke_theorem`):
for `K` as above and `s` other than the meridian, no filling along `s` is homeomorphic to `S³`
(Gordon–Luecke, *Knots are determined by their complements*, J. Amer. Math. Soc. 2 (1989));
equivalently, two knots with homeomorphic exteriors are equivalent, and no filling of a knot
exterior other than the unknot's is cosmetic for `S³`. Consume the native **cosmetic relations**
on a knot exterior in an oriented `3`-manifold: two slopes are **purely cosmetic**
(`IsSolidTorusNeighborhood.IsPurelyCosmetic`) when fillings along them, oriented compatibly with
the ambient orientation on the open exterior (`DehnFilling.IsOrientationCompatible`, on the
native `TauCeti.HomologicalOrientation`), are homeomorphic by an orientation-preserving
homeomorphism, and **chirally cosmetic** (`IsChirallyCosmetic`) when by an orientation-reversing
one (Bleiler's terms, in Kirby's remarks to Problem 1.81); both are symmetric and independent of
the ambient orientation. State **Mathieu's theorem** as the native
`TauCeti.MathieuChirallyCosmeticTheorem` (`mathieu_chirally_cosmetic_theorem`): on the exterior of
the native `TauCeti.rightHandedTrefoil`, for every neighbourhood `Φ` and every orientation of
`S³`, the slopes of coefficients `9` and `9/2`, or those of coefficients `−9` and `−9/2`
according to the orientation behaviour of `Φ` (5.2), are chirally cosmetic (Mathieu, *Closed
3-manifolds unchanged by Dehn surgery*, J. Knot Theory Ramifications 1 (1992), as recorded in
Kirby's remarks to Problem 1.81). Prove that the two slopes of each pair are inequivalent: a
self-homeomorphism of a knot exterior in `S³` preserves the meridian up to sign (Gordon–Luecke)
and the preferred longitude up to sign (it is the homological longitude), so it acts on surgery
coefficients by `r ↦ ±r`, and `9/2 ≠ ±9`. Consume the **cosmetic surgery conjecture**
`TauCeti.CosmeticSurgeryConjecture` (Gordon's form of `[Kir97, Problem 1.81 (A)]`: a nontrivial
knot in `S³` has no purely cosmetic pair of distinct slopes) as a recorded proposition: it is open
and nothing is claimed about it here. The native partial results
`TauCeti.NiWuCosmeticSurgeryTheorem` (purely cosmetic distinct slopes have opposite coefficients
`±p/q` with `q² ≡ −1 (mod p)`) and `TauCeti.HanselmanCosmeticSurgeryTheorem` (the coefficients
are `±2` or `±1/q`) are statements whose proofs rest on Heegaard Floer invariants; the scope
statement names the Part II that states them. State the **Akbulut–Kirby conjecture** as the
native `TauCeti.AkbulutKirbyConjecture`: knots in `S³` whose `0`-surgeries, oriented compatibly
with one orientation of `S³`, are homeomorphic by an orientation-preserving homeomorphism are
smoothly concordant (`SmoothEmbedding.Concordant`, 6.1), or become so after reversing one of them
(`[Kir97, Problem 1.19]`); it is false, and `TauCeti.YasuiTheorem`, its negation, records this
(Yasui, *Corks, exotic 4-manifolds and knot concordance*, arXiv:1505.02551, cited by its
locator). Yasui's theorem is recorded and not a target: its proof distinguishes the concordance
classes by invariants that the scope statement assigns to a Part II.

- Property P: for `K ≠ U`, `s ≠ ∞` and every filling `Y` along `s`, `Nontrivial (π₁(Y, y))`.
- Property R: for `K ≠ U` and every filling `Y` along the preferred longitude,
  `IsEmpty (Y ≃ₜ S¹ × S²)`.
- Gordon–Luecke: for `K ≠ U`, `s ≠ ∞` and every filling `Y` along `s`, `IsEmpty (Y ≃ₜ S³)`.
  Mathieu: on the trefoil exterior, the slopes of coefficients `9` and `9/2` (or `−9` and `−9/2`)
  are chirally cosmetic and inequivalent.

**Checks.**

- The unknot violates every one of these conclusions, which is why it is excluded: `S³_U(1) = S³`
  has trivial `π₁`, `S³_U(0) = S¹ × S²`, and `S³_U(1/n) ≅ S³` for all `n` gives infinitely many
  slopes with filling `S³`; these slopes are equivalent (the exterior solid torus has a
  homeomorphism carrying `1/n` to `1/m`), consistent with the Gordon–Luecke statement for the
  unknot. The meridian is purely cosmetic with itself for every knot
  (`isPurelyCosmetic_meridian`), which is why the conjecture asks for distinct slopes.
- The trefoil with `+1` surgery is the Poincaré sphere, with `π₁` of order `120`; with `0` surgery
  it is a torus bundle over the circle, not `S¹ × S²` (its `π₁` is not `ℤ`).
- The figure-eight with `0` surgery is a torus bundle with Anosov monodromy; its `π₁` is not `ℤ`,
  consistent with Property R.
- Property P quantifies over every filling along `s`, with any gluing of the stated slope; by the
  isotopy classification of 5.3 these are all homeomorphic to `S³_K(r)`, so the native form and
  the classical one agree. The slope `s = 0` is allowed, and `π₁(S³_K(0))` is nontrivial already
  by `H₁ = ℤ`.
- Mathieu's coefficients are distinct and not opposite, so they are not identified by the symmetry
  `r ↦ −r` of the mirror image either; Ni–Wu's constraint `q² ≡ −1 (mod p)` for purely cosmetic
  pairs fails for `9/2` (`4 ≢ −1 (mod 9)`), consistent with the pair being chirally and not purely
  cosmetic.

*Needs:* 5.2 (the preferred framing and the sign of coefficients); 5.3 (Dehn fillings and the
isotopy classification); 4.1 (the unknot and the trefoil); 6.1 (concordance, for the
Akbulut–Kirby statement); the native `TauCeti.unknot`, `TauCeti.rightHandedTrefoil`,
`SmoothEmbedding.SmoothAmbientIsotopic`, `TauCeti.DehnFilling`,
`IsSolidTorusNeighborhood.preferredFramedBoundaryTorus`,
`IsSolidTorusNeighborhood.IsPurelyCosmetic`,
`IsSolidTorusNeighborhood.IsChirallyCosmetic`, `DehnFilling.IsOrientationCompatible`,
`TauCeti.HomologicalOrientation`, `TauCeti.CosmeticSurgeryConjecture`,
`TauCeti.MathieuChirallyCosmeticTheorem`, `TauCeti.AkbulutKirbyConjecture`, `TauCeti.YasuiTheorem`;
Mathlib `FundamentalGroup`, `Homeomorph`.

### Examples

The unknot identities and the lens spaces; the Poincaré sphere as `+1` surgery on the trefoil;
the trefoil exterior as the host of Mathieu's chirally cosmetic pair; the Weeks manifold as the
`5, 5/2` surgery on the Whitehead link (7.3).

### Dependencies

Layer 1 (gluing, tubular neighbourhoods, connected sum); Layer 4 (presentations, Seifert surfaces,
framings); Layer 6 (the concordance relation, for the Akbulut–Kirby statement of 5.4); Layer 11
(Moise's theorem, for the smooth structure of a filling); the native solid torus neighbourhoods,
slopes, framings, Dehn fillings, cosmetic relations and surgery statements of the supplier
contracts. The Poincaré conjecture (8.4) is one of the two routes named for Property P and not a
dependency of this layer.

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
forgetful map `C → C^{top}` is a homomorphism. Prove that the slice genera of 4.4 are concordance
invariants (Livingston, Section 9.5), `g_s(K) = g_s(K')` for smoothly concordant `K, K'` and
`g_s^{top}(K) = g_s^{top}(K')` for topologically concordant ones (stack the concordance annulus in
`S³ × [0, 1]` onto a slice surface in `D⁴` and smooth the corner, which keeps the genus; the two
directions come from `symm`), and that `g_s` is subadditive under connected sum,
`g_s(K # K') ≤ g_s(K) + g_s(K')` (the boundary connected sum of two slice surfaces along an arc
joining the two summing balls is a slice surface for `K # K'` of genus the sum of the genera).

- `Concordant` is reflexive, symmetric and transitive on knots in `S³`; ambient isotopic knots are
  concordant (`TauCeti.SmoothEmbedding.SmoothAmbientIsotopic.concordant`).
- `[K] + [K'] = [K # K']`, `0 = [U] = {slice knots}`, `−[K] = [−K]`; `C` is abelian because
  `K # K'` and `K' # K` are ambient isotopic.
- `K # −K` is slice for every `K`; `K # K` is not slice when `σ(K) ≠ 0`.
- `g_s(K) = g_s(K')` for concordant `K, K'`, `g_s^{top}(K) = g_s^{top}(K')` for topologically
  concordant ones, and `g_s(K # K') ≤ g_s(K) + g_s(K')`; so `g_s` is a function on `C` but not a
  homomorphism: `g_s(T # −T) = 0 < 2 = g_s(T) + g_s(−T)`.

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

*Needs:* the native `TauCeti.SmoothEmbedding.Concordance` with `refl`, `symm`, `trans`,
`ofDiffeotopy`, `TauCeti.SmoothEmbedding.Concordant`, `Concordant.equivalence`,
`TauCeti.SmoothEmbedding.SmoothAmbientIsotopic.concordant`, `TauCeti.TopologicallyConcordant`,
`TauCeti.SmoothEmbedding.Concordant.exists_topologicallyConcordant`; 1.4 (the connected sum of
pairs); 4.1 (oriented knots); 4.4 (slice knots and the slice genera).

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

*Needs:* the native `Matrix.signature`, `signature_trefoilSeifertMatrix`,
`signature_figureEightSeifertMatrix`, `signature_enlargeColumn`, `signature_enlargeRow`,
`TauCeti.KnotTheory.tristramLevineForm`, `tristramLevineSignature` with
`tristramLevineSignature_neg_one`, `tristramLevineSignature_one`, `tristramLevineSignature_congr`,
`tristramLevineSignature_neg_transpose`, `tristramLevineSignature_fromBlocks_zero`; Mathlib
`Complex`, `Matrix`; 4.5 (Seifert matrices of a knot and S-equivalence); 6.1 (the concordance
group).

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
- Concordance of links is an equivalence relation; on knots it is the relation of 6.1, under which
  `g_s` is invariant (6.1).
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

*Needs:* the native `TauCeti.SmoothSliceSurface`, `TauCeti.IsLocallyFlat`; Mathlib
`Manifold.IsSmoothEmbedding`; 4.4 (the slice genera); 6.1 (concordance); 6.2 (the signature
function); 2.1 (locally flat surfaces in `S³ × [0, 1]`).

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

*Needs:* the native `TauCeti.riemannianVolume`, `eq_riemannianVolume_iff`,
`Bundle.ContMDiffRiemannianMetric.IsConstantCurvatureTensor`; Mathlib
`Bundle.ContMDiffRiemannianMetric`, `IsRiemannianManifold`, `MeasureTheory.Measure`; HopfRinow Layer
1 (the Levi-Civita connection and its curvature tensor); DifferentialGeometry 12.4 (the volume form
and densities).

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

*Needs:* the native `TauCeti.HyperbolicMetric`, `TauCeti.IsHyperbolic`, `TauCeti.hypVolumeOfMetric`,
`TauCeti.hypVolume`, `TauCeti.IsMostowRigid`, `TauCeti.MostowRigidity`,
`TauCeti.HyperbolicMetric.HasFiniteVolume`, `TauCeti.IsFiniteVolumeHyperbolic`,
`TauCeti.hasFiniteVolume_of_compactSpace`; Mathlib `ContinuousMap.HomotopyEquiv`, `IsCoveringMap`;
7.1 (total volume); HopfRinow Layer 1 (completeness and the exponential map, for the developing map)
and Layer 4 (isometries).

### 7.3 The Weeks manifold and the minimal volume theorem

Consume the native **Whitehead link** `TauCeti.whiteheadLink`, the smooth two-component link in
`S³ ⊆ ℂ²` whose component `0` is the unknot `w = 0` and whose component `1`, the Whitehead curve
`TauCeti.whiteheadCurve`, runs around the complementary solid torus with winding number `0` and
closes up by a positive clasp (its two-crossing diagram on the annulus is the untwisted Whitehead
double pattern, which is how it is matched with the link `5²₁` of the tables), and the native
**Weeks manifold**: a space `Y` is a Weeks manifold (`TauCeti.IsWeeksManifold Y`) when, for some
pairwise disjoint solid torus neighbourhoods of the two components preserving orientation at
their cores for the standard orientation of `ℝ⁴`, `Y` is a Dehn filling of the link exterior
(5.3) along the surgery slopes of coefficients `5` on the unknotted component and `5/2` on the
Whitehead curve, read in the preferred framing of each component; a compact Hausdorff Weeks
manifold exists (`TauCeti.exists_isWeeksManifold`), and the property is invariant under
homeomorphism (`TauCeti.isWeeksManifold_congr`) (Gabai–Meyerhoff–Milley, *Mom technology and
hyperbolic 3-manifolds*, the paragraph following Theorem 1.1: the `(5, 1), (5, 2)` filling of the
Whitehead link complement). State the **minimal volume theorem** as the native
`TauCeti.GabaiMeyerhoffMilleyTheorem`: some closed connected smooth Weeks manifold carries a
hyperbolic metric, and for every smooth Weeks manifold `W` with a hyperbolic metric `g_W` and
every closed connected orientable hyperbolic `3`-manifold `M` with a hyperbolic metric `g`,
`hypVolumeOfMetric g_W ≤ hypVolumeOfMetric g`, with equality only if `M ≃ₜ W`
(Gabai–Meyerhoff–Milley, Theorem 1.1: the Weeks manifold is the unique smallest-volume closed
hyperbolic `3`-manifold, with `v₁ = 0.9427…`; `[Kir97, Problem 3.60]`). Prove the **isometric
form**: with Mostow rigidity (7.2) the equality case gives an isometry `(M, g) ≅ (W, g_W)`, and
`hypVolume W = v₁ ≤ hypVolume M` for every closed orientable hyperbolic `M`. Prove that any two
Weeks manifolds are homeomorphic (the filling depends only on the slopes, 5.3, and the
neighbourhoods are unique up to isotopy, 1.3), that `W` is a closed orientable `3`-manifold, and
that `H₁(W; ℤ) ≅ ℤ/5 ⊕ ℤ/5`. The route for the inequality is Mom technology: a closed hyperbolic
manifold of volume at most `0.943` contains a Mom-`n` structure for `n ≤ 3`, and the finitely
many resulting manifolds are enumerated. The hypothesis "orientable" is part of the theorem as
stated by the authors; the volume of a non-orientable closed hyperbolic `3`-manifold is at least
that of its orientation double cover divided by two, and the non-orientable case is not a target.

- `W` is a closed orientable hyperbolic `3`-manifold with `H₁(W) ≅ ℤ/5 ⊕ ℤ/5` and volume `0.9427…`.
- The volume of every closed orientable hyperbolic `3`-manifold is at least `0.9427…`, with
  equality exactly for `W`.
- `W` is not Haken (it contains no closed incompressible surface), so Agol's theorems (7.4) give
  it a finite cover that is Haken and fibers, without `W` itself fibering.

**Checks.**

- `H₁` of the `5, 5/2` filling: the linking matrix of the Whitehead link is zero and the surgery
  presentation gives `H₁ = ℤ/5 ⊕ ℤ/5`, of order `25`; the `1, 1` filling gives `S³`, so the slopes
  matter.
- The coefficient `5/2` is read in the preferred framing of the Whitehead curve alone, whose
  preferred longitude is null-homologous in the complement of that component whatever the other
  component does (`surgerySlope`); read in the framing of a neighbourhood with framing number `n`
  it would be `5/2 − n` (`value_surgerySlope_framedBoundaryTorus`), so the framing convention is
  part of the definition. The orientation condition on the neighbourhoods fixes the sign of the
  coefficients (5.2): the Whitehead link is not isotopic to its mirror image, so the fillings with
  coefficients `5, 5/2` and `−5, −5/2` need not agree, and the definition names the first.
- The figure-eight knot complement has volume `2.0299… = 2 v₃`, more than twice `0.9427…`, and is
  not closed; the theorem compares `W` only with closed manifolds, so this is not a counterexample.
- A closed hyperbolic `3`-manifold obtained by a filling of the figure-eight knot exterior with a
  large slope has volume close to `2.0299…` from below (Thurston's hyperbolic Dehn surgery
  theorem), larger than `0.9427…`, consistent with the theorem; the volumes of fillings approach
  the cusped volume from below.

*Needs:* the native `TauCeti.whiteheadLink`, `TauCeti.IsWeeksManifold`,
`TauCeti.exists_isWeeksManifold`, `TauCeti.isWeeksManifold_congr`,
`TauCeti.GabaiMeyerhoffMilleyTheorem`, `TauCeti.HyperbolicMetric`, `TauCeti.hypVolumeOfMetric`,
`TauCeti.IsHyperbolic`, `IsSolidTorusLinkNeighborhood.surgerySlope`; 1.3 (uniqueness of tubular
neighbourhoods); 5.2 (framings); 5.3 (link Dehn fillings and their dependence on the slopes);
7.2 (Mostow rigidity, `TauCeti.hypVolume`); Mathlib `Homeomorph`; AlgebraicTopology Stage 3
(Mayer–Vietoris, for `H₁(W)`).

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

*Needs:* the native `TauCeti.MappingTorus`, `TauCeti.MappingTorusPresentation`,
`TauCeti.FibersOverCircle`, `TauCeti.FibersOverCircle.isVirtuallyFibered`, `TauCeti.IsFiniteCover`,
`TauCeti.IsVirtuallyFibered`, `TauCeti.IsHakenSurfaceEmbedding`,
`TauCeti.IsClosedHakenSurfaceEmbedding`, `TauCeti.IsPossiblyNonorientableClosedHakenThreeManifold`,
`TauCeti.IsVirtuallyHaken`, `TauCeti.VirtualHakenConjecture`; Mathlib `FundamentalGroup`,
`HomotopyGroup`, `IsCoveringMap`; the native `TauCeti.IsIncompressible` (for the fibre); 7.2
(hyperbolic manifolds).

### Examples

The round spheres and flat tori for volume; the genus-two surface for the failure of rigidity in
dimension two; the Weeks manifold and the figure-eight complement for volumes; `Σ₂ × S¹` and `S³`
for fibering.

### Dependencies

Mathlib's Riemannian bundles and measure theory; HopfRinow Layer 1 (connection) and Layer 4
(isometries); the native volume, hyperbolic, Mostow, finite-volume, mapping-torus, finite-cover,
incompressibility, virtually fibered, virtually Haken, Whitehead link, Weeks manifold and minimal
volume declarations of the supplier contracts; Layer 5 for the link fillings and framings behind
the native Weeks manifold; Layer 1 for the uniqueness of tubular neighbourhoods.

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

*Needs:* the native `TauCeti.ModelGeometry`, `ModelGeometry.Space`, `TauCeti.HasGeometricStructure`,
`TauCeti.HasGeometricStructure.exists_hasGroupoid`,
`TauCeti.LensSpace.hasGeometricStructure_spherical`; Mathlib `IsCoveringMap`,
`ProperlyDiscontinuousSMul`; 7.2 (hyperbolic metrics, for the comparison); HopfRinow Layer 1
(completeness and the exponential map, for the developing map).

### 8.2 The prime decomposition

Consume the native **connected-sum decompositions**: `TauCeti.IsConnectedSumOf I k M N₁ N₂` says
that `M` is `C^k` diffeomorphic to the connected sum of `N₁` and `N₂` along some pair of
coordinate balls (1.4), a relation symmetric in the summands and invariant under diffeomorphisms
of `M` and of the summands; a smooth `n`-manifold is **prime** (`TauCeti.IsPrimeManifold n M`)
when it is not diffeomorphic to `Sⁿ` and in every decomposition of it as a connected sum of two
closed smooth `n`-manifolds one summand is diffeomorphic to `Sⁿ`; and
`TauCeti.IsIteratedConnectedSum n P M` presents `M` as the right-nested connected sum
`P 0 # (P 1 # (⋯ # P (k − 1)))` of closed manifolds, with `k = 0` meaning `M ≃ Sⁿ`
(`isIteratedConnectedSum_zero_iff`). The sphere is not prime (`not_isPrimeManifold_sphere`), as
`1` is not a prime number, so that decompositions are unique on the nose rather than up to
inserting spheres; the summands are required to be closed, since `M` with one point doubled, a
non-Hausdorff manifold, is a connected sum of itself with `ℝⁿ`. Define a closed connected
`3`-manifold to be **irreducible** when every embedded locally flat `2`-sphere bounds a ball
(`TauCeti.IsSphereBoundsBall`, native). Prove that `S¹ × S²` is prime and not irreducible, and
that every other closed orientable prime `3`-manifold is irreducible (Hatcher, *Notes on Basic
3-Manifold Topology*, Proposition 1.4). State the **Kneser–Milnor prime decomposition theorem**
as the native `TauCeti.KneserPrimeDecompositionTheorem` (every closed connected orientable smooth
`3`-manifold is a connected sum of finitely many closed prime `3`-manifolds) and
`TauCeti.MilnorPrimeDecompositionTheorem` (two such presentations of one manifold have the same
number of factors and, after a bijection of the index sets, diffeomorphic factors), and prove
both (Hatcher, Theorem 1.5 and its proof: existence by Kneser's finiteness through a
triangulation, uniqueness by Milnor). The native uniqueness is unoriented: a presentation along
arbitrary balls is an oriented one for suitable orientations of the factors (1.4), so Milnor's
uniqueness up to orientation-preserving diffeomorphism gives it. Orientability cannot be dropped
from uniqueness: for non-orientable `N`, `N # (S¹ × S²)` and `N # (S¹ ×~ S²)`, the latter the
non-orientable `2`-sphere bundle over the circle, are diffeomorphic. Prove
`π₁(P 0 # ⋯ # P (k − 1)) ≅ π₁(P 0) * ⋯ * π₁(P (k − 1))` (1.4), so that the free-product
decomposition of `π₁` is determined by the prime decomposition.

- Every closed orientable `3`-manifold is a finite connected sum of primes; `k = 0` exactly for
  `S³`.
- Uniqueness: the number of prime factors is an invariant of the manifold
  (`MilnorPrimeDecompositionTheorem.card_eq`), and the factors agree up to a bijection and
  diffeomorphism.
- The free-product decomposition of `π₁` is determined by the prime decomposition.

**Checks.**

- `S³` is the empty connected sum and is not prime, so no prime decomposition contains it as a
  factor; this is what makes uniqueness hold on the nose, where Hatcher's formulation discards
  `S³` summands. `S¹ × S²` is prime with `π₁ = ℤ`, and `(S¹ × S²) # (S¹ × S²)` has `π₁` free of
  rank two and is not prime (`IsConnectedSumOf.not_isPrimeManifold`).
- `L(2, 1) # L(3, 1)` has `π₁ = C₂ * C₃` and exactly two prime factors; the presentations with
  the factors in either order are the same decomposition up to the bijection of index sets, and a
  presentation padded by an `S³` factor is excluded, since `S³` is not prime.
- The Poincaré sphere is prime and irreducible with finite `π₁`; `T³` is prime and irreducible
  with `π₁ = ℤ³`; neither decomposes further, and both are their own single JSJ piece (8.3).
- A non-compact manifold such as `ℝ³` is prime in the native sense, vacuously (it is no connected
  sum of two closed manifolds) and not `S³`; the theorems quantify over closed manifolds, so this
  junk value never enters a decomposition.

*Needs:* the native `TauCeti.IsConnectedSumOf`, `TauCeti.IsPrimeManifold`,
`TauCeti.IsIteratedConnectedSum`, `TauCeti.not_isPrimeManifold_sphere`,
`TauCeti.KneserPrimeDecompositionTheorem`, `TauCeti.MilnorPrimeDecompositionTheorem`,
`TauCeti.IsSphereBoundsBall`, `TauCeti.IsClosedConnectedManifold`; Mathlib `FundamentalGroup`;
1.4 (the connected sum, its orientation and `π₁(M # N)`); 11.2 (a triangulation of `M`, for
Kneser's finiteness); AlgebraicTopology Stage 1 (van Kampen).

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

*Needs:* the native `TauCeti.IsIncompressible`, `TauCeti.IsClosedIncompressibleSurfaceEmbedding`,
`TauCeti.SolidTorus.fiberSetoid`, `TauCeti.IsSeifertFibration`, `TauCeti.IsSeifertFibered`,
`TauCeti.IsPeripheralTorus`, `TauCeti.IsAtoroidal`, `TauCeti.IsTorusDecomposition`,
`TauCeti.IsJSJDecomposition`, `TauCeti.JSJTheorem`, `TauCeti.JSJTheorem.card_eq`,
`TauCeti.isJSJDecomposition_of_isEmpty`; Mathlib `FundamentalGroup`; 8.2 (irreducibility); 2.1
(locally flat tori).

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

*Needs:* the native `TauCeti.IsGeometricTorusDecomposition`, `TauCeti.GeometrizationConjecture`,
`TauCeti.IsFiniteVolumeHyperbolic`; Mathlib `Diffeomorph`, `SimplyConnectedSpace`, `Metric.sphere`;
7.2; 8.1 (the eight geometries); 8.2 (the prime decomposition); 8.3 (Seifert fibred spaces and the
JSJ theorem).

### Examples

`T³`, the Weeks manifold, two glued trefoil exteriors and the Anosov torus bundle as JSJ and
geometric examples; the lens spaces as spherical manifolds; the Poincaré sphere as a spherical
non-simply-connected manifold.

### Dependencies

Layer 1 (connected sum), Layer 5 (torus exteriors), Layer 7 (hyperbolic structures), Layer 11
(Moise's theorem, for Kneser's finiteness in 8.2); the native model geometries, geometric
structures, irreducibility, incompressibility, Seifert fibrations, JSJ and geometrization
declarations of the supplier contracts.

## Layer 9: Heegaard splittings and Heegaard genus

### 9.1 Handlebodies and Heegaard splittings

Consume the native **standard handlebody** `TauCeti.handlebody g ⊆ ℂ × ℝ`, the product of the
planar surface `TauCeti.planarSurface g` (the closed disc of radius `g + 1` with `g` open discs
of radius `1/2` removed about the real points `2k + 1 − g`) with `[−1, 1]`: it is compact and
closed, `handlebody 0` is the closed unit ball and `handlebody 1` is homeomorphic to the solid
torus (`handlebody_zero`, `nonempty_homeomorph_handlebody_one`), its fundamental group is free of
rank `g` at every base point (`nonempty_fundamentalGroup_handlebody_mulEquiv_freeGroup`,
`rank_fundamentalGroup_handlebody_le`), and its frontier is path connected and carries its
fundamental group (`isPathConnected_frontier_handlebody`,
`fundamentalGroup_map_frontier_handlebody_surjective`) (Hempel, *3-Manifolds*, Chapter 2;
Scharlemann, *Heegaard splittings of compact 3-manifolds*, Section 1). Prove that `handlebody g`
is a compact orientable `3`-manifold with boundary once the corners of the product are rounded
(1.1), diffeomorphic to `D³` with `g` orientable `1`-handles attached (1.2), and that its
frontier in `ℂ × ℝ` is a closed connected orientable surface of genus `g` (two copies of the
planar surface and `g + 1` annuli). Define the **non-orientable handlebody** `H_g^−` as `D³` with
`g` `1`-handles of which at least one is attached by an orientation-reversing map (Scharlemann,
Section 1: for `g ≥ 1` there are exactly two handlebodies of genus `g` up to diffeomorphism,
since any other non-orientable handle can be slid over a non-orientable one), and prove that
`π₁(H_g^−)` is free of rank `g`. Consume the native **Heegaard splitting**
`TauCeti.HeegaardSplitting M` of a space `M`: a genus `g` and two subsets `left`, `right`
covering `M`, each homeomorphic to `handlebody g`, whose intersection is the frontier of each (in
a `3`-manifold without boundary, their common boundary surface, by invariance of domain), with
`symm`, transport along homeomorphisms (`transHomeomorph`) and the constructor `ofIsClosed` from
two closed handlebodies covering `M` whose intersection lies in the closure of the complement of
each (Scharlemann, Section 2; Hempel, Chapter 2). The native handlebodies are orientable, so
these are the splittings of orientable manifolds; define a **non-orientable Heegaard splitting**
in the same shape, with both pieces homeomorphic to `H_g^−`. Prove **existence**: every closed
connected orientable `3`-manifold has a `HeegaardSplitting`, which supplies the instance
`Nonempty (HeegaardSplitting M)` that the native Heegaard genus needs (native instances exist for
`S³`, `S¹ × S²` and the lens spaces), and every closed connected non-orientable `3`-manifold has
a non-orientable splitting (Scharlemann, Section 2.1: from a triangulation, Moise's theorem,
11.2, take regular neighbourhoods of the `1`-skeleton and of the dual `1`-skeleton).

- A Heegaard splitting of genus `g` presents `M` as two handlebodies meeting in a closed surface
  of genus `g`, the frontier of each; the splitting surface is bicollared (2.3).
- Existence for every closed connected `3`-manifold: a native splitting when `M` is orientable, a
  non-orientable one otherwise.
- A union of two orientable handlebodies along a connected closed surface is orientable, so a
  non-orientable `M` has no `HeegaardSplitting` and needs `H_g^−`.

**Checks.**

- `S³` has the genus-zero splitting into two closed hemispheres (`hemisphereHeegaardSplitting`)
  and the genus-one splitting into the solid tori `‖z‖ ≤ ‖w‖` and `‖w‖ ≤ ‖z‖` of `S³ ⊆ ℂ²`
  (`cliffordHeegaardSplitting`); `S¹ × S²` has the genus-one splitting into the solid tori over
  the two closed hemispheres of `S²` (`DehnFilling.heegaardSplitting` of the `0`-surgery on the
  unknot, 5.3); the lens space `L(p; ℓ₀, ℓ₁)` has the genus-one splitting into the images of the
  two Clifford solid tori (`LensSpace.heegaardSplitting`), whose gluing sends the meridian of one
  solid torus to the `(p, q)` curve of the other.
- `ℝP² × S¹` is closed and non-orientable; `HeegaardSplitting (ℝP² × S¹)` is empty, since the
  union of two orientable handlebodies along a connected surface is orientable, so every splitting
  of it is a non-orientable one. Its fundamental group `ℤ/2 × ℤ` has rank `2`, so its genus is at
  least `2` (9.2).
- Two subsets homeomorphic to handlebodies of different genera cannot form a splitting: the
  structure carries one `genus`, and the frontiers, closed surfaces of genus `g` and `h`, would
  have to coincide.
- Two closed solid tori in `S³` covering it and meeting in a disc of their boundaries rather than
  in the whole boundary torus do not form a splitting: the intersection is not the frontier of
  either piece, which `ofIsClosed` asks for.

*Needs:* the native `TauCeti.handlebody`, `TauCeti.planarSurface`, `TauCeti.HeegaardSplitting`
with `ofIsClosed`, `symm`, `transHomeomorph`, `TauCeti.hemisphereHeegaardSplitting`,
`TauCeti.cliffordHeegaardSplitting`, `LensSpace.heegaardSplitting`, `DehnFilling.heegaardSplitting`,
`TauCeti.nonempty_fundamentalGroup_handlebody_mulEquiv_freeGroup`,
`TauCeti.fundamentalGroup_map_frontier_handlebody_surjective`, `TauCeti.Orientable`; 1.1 (corners
and the boundary manifold); 1.2 (handle attachment); 2.3 (bicollars); 5.3 (the `0`-surgery on the
unknot); 11.2 (Moise's theorem, for existence); Mathlib `Homeomorph`, `FundamentalGroup`;
AlgebraicTopology Stage 1 (van Kampen, for `π₁(H_g^−)`).

### 9.2 Heegaard genus, rank and Li's theorem

Consume the native **Heegaard genus** `TauCeti.heegaardGenus M`, the least genus of a Heegaard
splitting, defined under `[Nonempty (HeegaardSplitting M)]` as a `Nat.find`, so that it never
silently takes a junk value (`heegaardGenus_le`, `exists_genus_eq_heegaardGenus`,
`heegaardGenus_eq_zero_iff`, `heegaardGenus_congr` under homeomorphism, and
`heegaardGenus_sphere : heegaardGenus S³ = 0`), and the native **rank inequality**: for a
manifold without boundary charted on a three-dimensional real normed space with a Heegaard
splitting, the inclusion of either handlebody surjects on fundamental groups
(`HeegaardSplitting.fundamentalGroup_map_left_surjective`, van Kampen for the cover by one
handlebody thickened along a neighbourhood of the frontier that deformation retracts onto it and
the other handlebody), so `π₁(M, x)` is finitely generated (`HeegaardSplitting.fg_fundamentalGroup`)
and `Group.rank (π₁(M, x)) ≤ heegaardGenus M` at every base point
(`TauCeti.rank_fundamentalGroup_le_heegaardGenus`). With the existence theorem of 9.1 these apply
to every closed connected orientable `3`-manifold. Consume **Waldhausen's rank-versus-genus
conjecture** as the native `TauCeti.RankGenusConjecture` (every closed orientable `3`-manifold
has finitely generated `π₁`, a Heegaard splitting, and Heegaard genus equal to the rank at every
base point) and state **Li's theorem** as the native `TauCeti.LiRankGenusTheorem`
(`li_rank_genus_theorem`): for every `n` there is a closed connected orientable hyperbolic
`3`-manifold `M` (`TauCeti.IsHyperbolic`, 7.2) with a base point `x`, finitely generated
`π₁(M, x)`, a Heegaard splitting, and `rank π₁(M, x) + n < heegaardGenus M` (Li, *Rank and genus
of 3-manifolds*, J. Amer. Math. Soc. 26 (2013), Theorem 1.1: a closed orientable hyperbolic
`3`-manifold with rank smaller than genus, the discrepancy being arbitrarily large; the bounded
version, Theorem 1.2, gives a compact irreducible atoroidal `M` with connected boundary and
`r(M) < g(M)`); the case `n = 0` refutes Waldhausen's conjecture, which is the native
`LiRankGenusTheorem.not_rankGenusConjecture` and is consumed. Define the **genus of a
non-orientable closed `3`-manifold** as the least genus of a non-orientable splitting (9.1) and
prove the rank inequality for it by the same argument.

- `heegaardGenus M` is a natural number; `heegaardGenus S³ = 0`, and `heegaardGenus M = 0` only
  for `M ≃ₜ S³` (two closed balls meeting in their common boundary sphere are the cone extension
  of a homeomorphism of `S²`).
- `π₁(M)` is finitely generated and `rank π₁(M) ≤ heegaardGenus M`.
- Li: for every `n` a closed orientable hyperbolic `M` with `rank π₁(M) + n < heegaardGenus M`;
  `n = 0` gives `rank < genus`.

**Checks.**

- `S³`: genus `0` and rank `0` (`exists_heegaardGenus_sphere_eq_rank`). The lens spaces with
  `m ≠ 1` and `S¹ × S²`: genus `1` (`LensSpace.heegaardGenus_eq_one`,
  `heegaardGenus_circle_prod_sphere`: the genus-one splitting bounds the genus above and the
  nontrivial cyclic `π₁` bounds it below) and rank `1`. `T³`: genus `3 = rank ℤ³`. So the
  inequality is an equality in all these cases, and the gap of Li's theorem is a strict statement
  about other manifolds.
- The Poincaré sphere: `π₁` the binary icosahedral group, of rank `2`, and genus `2` (it is `+1`
  surgery on the trefoil, a genus-two manifold, and not a lens space).
- With `n = 0`, Li's theorem gives `rank < genus`; with `n = 1` it gives a manifold whose genus
  exceeds its rank by at least two, which the `n = 0` statement does not provide, so the
  quantified form is strictly stronger than the existential one; `rank + n < genus` is
  `genus − rank ≥ n + 1`, so a gap of at least `k` is the case `n = k − 1`.
- `heegaardGenus (ℝP² × S¹)` is not defined, since `HeegaardSplitting (ℝP² × S¹)` is empty (9.1):
  the instance hypothesis is what keeps the native genus from a junk value; the non-orientable
  genus covers it, with value at least `2`.

*Needs:* 9.1 (splittings and their existence); the native `TauCeti.heegaardGenus`,
`heegaardGenus_le`, `exists_genus_eq_heegaardGenus`, `heegaardGenus_eq_zero_iff`,
`heegaardGenus_congr`, `heegaardGenus_sphere`, `HeegaardSplitting.fg_fundamentalGroup`,
`TauCeti.rank_fundamentalGroup_le_heegaardGenus`, `TauCeti.RankGenusConjecture`,
`TauCeti.LiRankGenusTheorem`, `LiRankGenusTheorem.not_rankGenusConjecture`,
`LensSpace.heegaardGenus_eq_one`, `TauCeti.heegaardGenus_circle_prod_sphere`,
`TauCeti.IsHyperbolic`; Mathlib `Group.rank`, `Group.FG`, `FundamentalGroup`, `Nat.find`; 7.2
(closed hyperbolic `3`-manifolds, for Li's theorem); AlgebraicTopology Stage 1 (van Kampen).

### Examples

The native genus-zero and genus-one splittings of `S³`, the native genus-one splittings of
`S¹ × S²` and the lens spaces, `ℝP² × S¹` as the non-orientable case, and `T³` with genus equal
to rank `3`.

### Dependencies

Layer 1 (handle attachment, gluing, corners), Layer 2 (bicollars), Layer 5 (the `0`-surgery on the
unknot behind the native splitting of `S¹ × S²`), Layer 7 (hyperbolic manifolds for Li's
theorem), Layer 11 (Moise's triangulation theorem for existence); the native handlebodies,
splittings, genus, rank inequality and rank-versus-genus declarations of the supplier contracts;
Mathlib's `Group.rank` and `FundamentalGroup`.
## Layer 10: foliations and their Euler class

### 10.1 Codimension-one foliations and tautness

Consume `TauCeti.Foliation I n M k`, a `Cⁿ` foliation of rank `k` of a `C^{n+1}` manifold given by
its involutive `Cⁿ` tangent distribution (`1 ≤ n`), with the flat charts and the Frobenius
theorem of DifferentialGeometry Layer 4, its native **leaves** `Foliation.leaf F x` (the classes
of the equivalence relation generated by `C¹` curves on compact intervals tangent to the
distribution, which on a boundaryless manifold are the maximal connected integral manifolds), and
the native **tautness** `Foliation.Taut`: every point lies on a leaf met by a `C¹` closed
transversal, a `1`-periodic `C¹` curve whose velocity is nonzero and complementary to the tangent
distribution at every parameter (`Foliation.IsClosedTransversal`; Calegari, *Foliations and the
Geometry of 3-Manifolds*, Chapter 4; Candel–Conlon, *Foliations I*). A **codimension-one
foliation** of a `3`-manifold is a `Foliation I n M 2`; define its **transverse orientation** as
an orientation of the normal line bundle `TM/TF`, and a foliation to be **transversely oriented**
when one is chosen. Prove that a taut foliation of a closed `3`-manifold has, through every leaf,
a smooth closed transversal (smoothing the native `C¹` curve while keeping it transverse, by the
approximation theorems of Hirsch, Chapter 2), so that the native notion agrees with the classical
one. Define a **Reeb component** (a solid torus foliated by planes spiralling to the boundary
torus leaf) and prove that a foliation with a Reeb component is not taut (the boundary torus
meets no closed transversal, since a transversal entering the component cannot leave it;
Calegari, Chapter 4; the native `not_taut_ofSubmodule_ker`, the foliation of a normed space by
the cosets of the kernel of a functional, is the model argument: a global first integral and
Rolle's theorem rule out closed transversals). Prove that the tangent plane field `TF` of a
transversely oriented foliation of an oriented `3`-manifold is an oriented plane bundle, the
input of 10.2.

- A taut foliation has no Reeb component and every leaf is incompressible (Novikov; Calegari,
  Chapter 4, cited as background, not a target).
- Tautness is invariant under diffeomorphism and reversal of the transverse orientation.
- `TF` is an oriented rank-two subbundle of `TM` when `M` and `F` are oriented.

**Checks.**

- The product foliation of `S² × S¹` by the spheres `S² × {t}` is taut: `{pt} × S¹` is a closed
  transversal meeting every leaf; it has no Reeb component, and its leaves are spheres, which is
  allowed by the definition.
- The Reeb foliation of `S³` (two Reeb components glued along the torus leaf) is not taut.
- The foliation of `ℝ³` by horizontal planes is not taut (`not_taut_ofSubmodule_ker`): the height
  of a closed `C¹` curve has a critical point, where the velocity lies in the plane; this is the
  local picture behind the Reeb component.
- The linear foliation of `T³` by planes of irrational slope is taut, with a closed transversal
  given by a circle direction not in the plane; its leaves are dense planes, so tautness does not
  require compact leaves.
- A foliation of a closed `3`-manifold by circles (a Seifert fibration with all fibres regular) is
  a rank-one foliation, excluded from codimension one by the rank in `Foliation I n M k`.

*Needs:* the native `TauCeti.Foliation`, `Foliation.ofSubmodule`, `Foliation.leaf`,
`Foliation.IsClosedTransversal`, `Foliation.Taut`, `TauCeti.not_taut_ofSubmodule_ker`,
`TauCeti.IsContMDiffDistribution`, `TauCeti.IsInvolutiveDistribution`, `TauCeti.Orientable`,
`TauCeti.SolidTorus`; Mathlib `TangentBundle`; DifferentialGeometry Layer 4 (flat charts and the
Frobenius theorem); Hirsch, Chapter 2 (smoothing).

### 10.2 The Euler class of an oriented plane bundle

Consume the native **Euler class** of a real vector bundle `E → B` with finite-dimensional fibre
`F`: the Thom pair `(E, E₀)`, `E₀` the complement of the zero section (`TauCeti.thomPair`); a
**Thom class** `u ∈ Hʳ(E, E₀)`, `r = dim F`, a relative class restricting to a generator on every
fibre pair `(E_b, E_b ∖ 0)` (`TauCeti.IsThomClass`); and the Euler class
`TauCeti.eulerClass n : Hⁿ(E, E₀) ⟶ Hⁿ(B)`, the restriction to `E` followed by the pullback along
the zero section, natural under maps of Thom pairs and under pullback (`eulerClass_naturality`,
`eulerClass_pullback`), carried to Thom classes by fibrewise isomorphisms
(`IsThomClass.singularCohomologyMap`), vanishing on a bundle with a nowhere-vanishing section
(`eulerClass_eq_zero_of_forall_ne_zero`) and on a trivial bundle of positive rank
(`eulerClass_trivial_eq_zero`) (Milnor–Stasheff, *Characteristic Classes*, Sections 9 and 10;
in the singular cohomology of AlgebraicTopology with general coefficients, integral cohomology
being the case `ModuleCat ℤ`). Prove the **rank-two Thom isomorphism**: an oriented real plane
bundle over a CW complex has exactly one integral Thom class compatible with the orientation, and
`−u` is the Thom class of the opposite orientation (Milnor–Stasheff, Theorem 10.4, in rank two);
define the **Euler class of an oriented plane bundle** `e(E) := eulerClass u` for that Thom
class, so that `e(Ē) = −e(E)`. Prove the **comparison with the obstruction-theoretic
description**: `e(E)` is the primary obstruction to a nowhere-vanishing section, the class of the
cocycle that assigns to a `2`-cell the degree on its boundary of a section over the `1`-skeleton
(Milnor–Stasheff, Chapter 12; Hatcher, *Vector Bundles and K-Theory*, Section 3); this
comparison is this roadmap's, and CharacteristicClasses C2 compares its rank-two Euler class with
it. Prove `e(E ⊕ F) = e(E) ∪ e(F)` for oriented plane bundles over a space where both are defined,
and, for a closed oriented surface `S`, `⟨e(TS), [S]⟩ = χ(S)` (Milnor–Stasheff, Corollary 11.12,
for the tangent bundle). Consume the **Euler class of a foliation**: the tangent field of a
foliation `F` of rank `k` is a rank-`k` vector bundle with Thom pair `Foliation.thomPair`, Thom
classes `Foliation.IsThomClass` and Euler class `Foliation.eulerClass`, and a class
`e ∈ Hᵏ(M; ℤ)` is **an Euler class of `F`** (`Foliation.IsEulerClass e`) when it is the Euler
class of some Thom class of the tangent field; negation (`IsEulerClass.neg`) and vanishing for a
nowhere-zero tangent vector field (`Foliation.eulerClass_eq_zero_of_forall_ne_zero`) are native.
Prove that for a transversely oriented codimension-one foliation `F` of a closed oriented
`3`-manifold the transverse orientation and the orientation of `M` orient `TF`, whose Thom class
gives `e(F) := e(TF)`, and that `F.IsEulerClass e` holds exactly for `e = ±e(F)`; define the
**pairing** `⟨e(F), [S]⟩ ∈ ℤ` with the fundamental class of an embedded closed oriented surface
`S` through the native `HomologicalOrientation.evalFundamentalClass` (AlgebraicTopology's
fundamental classes).

- `e` is a natural characteristic class of oriented plane bundles, with `e(trivial) = 0` and
  `e(TS²) ≠ 0`.
- `⟨e(TS), [S]⟩ = χ(S)` for every closed oriented surface; `⟨e(F), [S]⟩` depends only on the
  homology class of `S`.
- Reversing the orientation of `M` or the transverse orientation of `F` negates `e(F)`, and the
  native Euler classes of `F` are exactly `±e(F)`.

**Checks.**

- `e(TS²)` evaluates to `χ(S²) = 2` and `e(TT²) = 0 = χ(T²)`; the trivial plane bundle over `S²`
  has `e = 0 ≠ e(TS²)` (`eulerClass_trivial_eq_zero`), so `TS²` is not trivial (the hairy ball
  theorem as a corollary).
- For the product foliation of `S² × S¹`, `TF` restricted to a sphere leaf is `TS²`, so
  `⟨e(F), [S² × pt]⟩ = 2`; for the foliation of `T³` by tori `T² × pt`, the pairing with a torus
  leaf is `0`.
- The Hopf plane bundle over `S²` (the tautological bundle of `ℂP¹`, as a real plane bundle) has
  `e = ±1` times the generator, half of `e(TS²)` in absolute value, so the Euler class of `TS²`
  is twice a generator; this is the parity phenomenon of 10.4.
- The non-orientable plane bundle over `S¹` that is the sum of the Möbius line bundle and a
  trivial line has no integral Thom class: the restriction to the fibre pair would change sign
  around the circle; so orientability is the hypothesis of the Thom isomorphism, and
  `IsThomClass` is empty there while `eulerClass` is still defined on every relative class.

*Needs:* Mathlib `Topology.CWComplex`, `Bundle.TotalSpace` and vector bundles; the native
`TauCeti.thomPair`, `TauCeti.IsThomClass`, `TauCeti.eulerClass` with its naturality and
vanishing, `Foliation.thomPair`, `Foliation.IsThomClass`, `Foliation.eulerClass`,
`Foliation.IsEulerClass`, `TauCeti.HomologicalOrientation.evalFundamentalClass`;
AlgebraicTopology Stage 4 (cellular cochains) and Stage 6 (cohomology, cup products, fundamental
classes); DifferentialGeometry Layer 10 (the degree of a section on the boundary of a `2`-cell);
10.1 (the tangent plane bundle of a foliation).

### 10.3 The Thurston norm

Define, for a closed oriented `3`-manifold `M` and a class `a ∈ H₂(M; ℤ)`, the **Thurston norm**
`x(a) := min χ₋(S)` over closed embedded oriented surfaces `S ⊆ M` with `[S] = a`, where
`χ₋(S) = Σ_i max(0, −χ(S_i))` over the components; prove that every class is represented by an
embedded oriented surface (Poincaré duality and transversality to a map to `S¹`), so the minimum
exists, and that `x` extends to a seminorm on `H₂(M; ℝ)`, linear on rays and convex (Thurston, *A
norm for the homology of 3-manifolds*, Mem. AMS 59 (1986), Theorem 1; Yazdi, *On Thurston's
Euler class one conjecture*, Section 1). Define the **dual norm** `x*(e) := sup {⟨e, a⟩ : x(a) ≤ 1}`
on `H²(M; ℝ)`, possibly `+∞` when `x` is only a seminorm, and state that the unit ball of `x` is a
finite-sided polyhedron whose dual ball has integral vertices (Thurston, Theorem 2). Prove the
**comparison with the native Euler class inequality**: for a closed orientable hyperbolic
`3`-manifold `M`, on which `x` is a norm, and `e ∈ H²(M; ℤ)`, `x*(e) ≤ 1` holds exactly when
`TauCeti.EulerClassBounded e`, that is `|⟨e, f_*[S]⟩| ≤ −χ(S)` for every closed connected
oriented surface `S` with `χ(S) ≤ 0` and every topological embedding `f : S → M`, and `x*(e) = 1`
exactly when `TauCeti.EulerClassNormOne e`, which adds equality on some embedded `S` with
`χ(S) < 0`. From `x*(e) ≤ 1` to the bound: `|⟨e, f_*[S]⟩| ≤ x(f_*[S]) ≤ −χ(S)`, the last step
because the norm is also the least `χ₋` of a singular surface representing the class (Gabai,
*Foliations and the topology of 3-manifolds*, J. Differential Geom. 18 (1983), Corollary 6.18),
so that a merely topological embedding is allowed. From the bound to `x*(e) ≤ 1`: a class `a` is
represented by an incompressible surface without sphere components (below), each component of
which is an embedded `S_i` with `χ(S_i) ≤ 0`, so `|⟨e, a⟩| ≤ Σ |⟨e, [S_i]⟩| ≤ Σ −χ(S_i) = x(a)`.
For the sharp forms: `x*(e) = 1` is attained on an integral class `a` with `|⟨e, a⟩| = x(a) > 0`
(the dual ball is a polyhedron), and the componentwise inequalities on a norm-minimizing
representative then are equalities, one of them with `χ(S_i) < 0`; conversely an embedded `S`
with `|⟨e, [S]⟩| = −χ(S) > 0` gives `x*(e) ≥ |⟨e, [S]⟩| / x([S]) ≥ 1`.

- `x(ka) = |k| x(a)`, `x(a + b) ≤ x(a) + x(b)`, `x(0) = 0`; `x` is a norm exactly when no nonzero
  class is represented by a union of spheres and tori.
- `x*` is a norm on the quotient of `H²(M; ℝ)` by the annihilator of the kernel of `x`; its unit
  ball is the convex hull of finitely many integral points.
- For irreducible `M`, `x(a)` is attained by an incompressible surface with no sphere components;
  in general it is attained by an incompressible surface none of whose sphere components bounds
  a ball (Thurston, Section 2: compressions do not increase `χ₋`, and a sphere bounding a ball is
  discarded).
- On a closed hyperbolic `M`: `x*(e) ≤ 1 ↔ EulerClassBounded e` and
  `x*(e) = 1 ↔ EulerClassNormOne e`.

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
- On `S² × S¹` the class `[S² × pt]` has norm `0`, and no incompressible representative without a
  sphere component attains it: a representative with `χ₋ = 0` and no sphere component is a union
  of tori, and no torus in `S² × S¹` is incompressible, since `ℤ² → π₁(S² × S¹) = ℤ` is never
  injective. Compressible tori do attain it: tubing `S² × pt` to itself along an arc in
  `S² × (0, ε)` with both ends on the same side of the sphere gives a torus `T` with
  `[T] = [S² × pt]` and `χ₋(T) = 0`, compressible along the meridian disc of the tube, so
  incompressibility is what the statement needs. The sphere `S² × pt` bounds no ball, so the
  general form of the attainment statement holds; the irreducible form does not apply, and a
  version of it without the irreducibility hypothesis would be false here.
- The comparison needs the hyperbolic hypothesis in the direction from the bound to the dual
  norm: on `S² × S¹` the class `e` pairing to `2` with `[S² × pt]` is bounded (every connected
  surface with `χ ≤ 0` in `S² × S¹` is homologous to a multiple of the sphere class and
  compressible, so pairs to `0` or is excluded) while `x*(e) = +∞`.
- The zero class is bounded and never sharp (`not_eulerClassNormOne_zero`), as `x*(0) = 0 ≠ 1`.

*Needs:* AlgebraicTopology Stage 6 (Poincaré duality and `H₂(M; ℤ)`) and Stage 8 (representability
of `H¹` by maps to the circle); DifferentialGeometry Layer 10 (regular values and Sard's theorem,
for the representing surfaces); Mathlib `Seminorm`; the native `TauCeti.EulerClassBounded`,
`TauCeti.EulerClassNormOne`, `TauCeti.HomologicalOrientation.evalFundamentalClass`,
`TauCeti.FiniteCWType`, `TauCeti.eulerChar`; 2.1 (embedded surfaces); 7.2 (hyperbolic manifolds);
8.3 (incompressible surfaces).

### 10.4 Thurston's inequality and Yazdi's theorem

State **Thurston's inequality**: for a taut transversely oriented foliation `F` of a closed
oriented irreducible `3`-manifold `M` and every closed embedded oriented surface `S`,
`|⟨e(F), [S]⟩| ≤ |χ(S)|`, and in terms of the norms, `|⟨e(F), a⟩| ≤ x(a)` for every
`a ∈ H₂(M; ℤ)`, that is `x*(e(F)) ≤ 1` (Thurston, Mem. AMS 59 (1986), Section 3;
Yazdi, Section 1, inequalities (1) and (2), and Section 3.3 for the proof through the Roussarie–
Thurston general position of an incompressible surface with respect to `F`, which gives
`|χ(S)|` saddle tangencies). The irreducibility hypothesis is where sphere leaves are excluded: the
norm form fails on `S² × S¹` (10.3). State its **hyperbolic form** as the native
`TauCeti.ThurstonEulerClassInequality` (`thurston_euler_class_inequality`): on a closed
orientable hyperbolic `3`-manifold, every Euler class of a smooth taut codimension-one foliation
satisfies `EulerClassBounded` (10.3); it follows from the general form through the comparison of
10.3, a closed hyperbolic manifold being irreducible and a native Euler class of `F` being
`±e(F)` for a transverse orientation (10.2). Define the **parity condition**: an integral class
`a ∈ H²(M; ℤ)` satisfies it when `a ∈ 2H²(M; ℤ)`, the native `Even a`; prove that the Euler
class of every oriented plane field on a closed oriented `3`-manifold satisfies it (Yazdi,
Definition 1.1 and Proposition 3.12). State **Gabai's realization theorem**: for a compact
oriented irreducible `3`-manifold, possibly with toral boundary, every vertex `a` of the dual
unit ball is the Euler class of a taut foliation (Yazdi, Theorem 1.2, attributed to Gabai;
Gabai–Yazdi, *The fully marked surface theorem*, for the proof). State the **Euler class one
conjecture** of Thurston as the statement it is: for a closed orientable irreducible atoroidal
`M`, every integral class with `x*(a) = 1` satisfying the parity condition is the Euler class of
a taut foliation (Yazdi, the Euler Class One Conjecture of Section 1); its native hyperbolic form
`TauCeti.EulerClassOneConjecture` (every even class with `EulerClassNormOne` on a closed orientable
hyperbolic `3`-manifold is an Euler class of a smooth taut codimension-one foliation) is the
restriction to hyperbolic manifolds through the comparison of 10.3, and nothing is claimed about
either, since both are false. State **Yazdi's theorem**, the negation: there are infinitely many
closed hyperbolic `3`-manifolds `M` with an integral class `a ∈ H²(M; ℤ)`, `x*(a) = 1`,
satisfying the parity condition, which is the Euler class of no taut foliation of `M` (Yazdi,
Main Theorem; the examples are Dehn surgeries on fibered hyperbolic manifolds with `b₁ = 2`, and
the fully marked surface theorem of Gabai–Yazdi removes the conditional hypothesis of the first
paper), and its **weakest form** as the native `TauCeti.YazdiEulerClassOneTheorem`
(`yazdi_theorem`): one closed orientable hyperbolic `3`-manifold with an even class `e`,
`EulerClassNormOne e`, that is an Euler class of no smooth taut codimension-one foliation; the
infinite family implies it through 10.3, and the native refutation
`YazdiEulerClassOneTheorem.not_eulerClassOneConjecture` is consumed.

- Thurston: `|⟨e(F), [S]⟩| ≤ |χ(S)|` for every closed embedded oriented `S`; `x*(e(F)) ≤ 1`; on a
  closed hyperbolic `M`, `EulerClassBounded e` for every native Euler class `e` of `F`.
- Yazdi: `∃` infinitely many closed hyperbolic `M` and `a` with `x*(a) = 1`, `a ∈ 2H²`, and
  `∀ F` taut transversely oriented, `e(F) ≠ a`; in particular one `M` with an even `e`,
  `EulerClassNormOne e`, and `¬ F.IsEulerClass e` for every smooth taut `F`.
- Gabai: every vertex of the dual unit ball is realised.

**Checks.**

- A sphere `S` bounding a ball in `M`: `[S] = 0`, `⟨e(F), [S]⟩ = 0`, `|χ(S)| = 2` and `x([S]) = 0`,
  so both forms hold as `0 ≤ 2` and `0 ≤ 0`; a bound of the form `|⟨e(F), [S]⟩| ≤ −χ(S)` would
  read `0 ≤ −2` and fail, so the absolute value is part of the general statement, while the
  native `EulerClassBounded` avoids the sphere by asking `χ(S) ≤ 0`.
- A torus leaf `T` of a taut foliation: `|χ(T)| = 0`, so `⟨e(F), [T]⟩ = 0`; for the foliation of
  `T³` by tori this agrees with 10.2.
- The product foliation of `S² × S¹`: `⟨e(F), [S² × pt]⟩ = 2 = |χ(S²)|`, so the first form holds
  with equality, while `x([S² × pt]) = 0 < 2`, so the norm form fails; `S² × S¹` is reducible,
  and the irreducibility hypothesis of the norm form is used.
- On `Σ₂ × S¹` with the foliation by surfaces `Σ₂ × pt`, `⟨e(F), [Σ₂ × pt]⟩ = χ(Σ₂) = −2` and
  `x([Σ₂ × pt]) = 2`, so the norm form holds with equality, as it must when a leaf is a norm-minimizing
  surface (Yazdi, Section 1, the equality case).
- The native inequality quantifies over every Euler class of `F`, that is over both `±e(F)`;
  `EulerClassBounded` is invariant under negation (`eulerClassBounded_neg_iff`), so this is no
  stronger than the statement for one transverse orientation. The zero class is bounded and never
  sharp (`not_eulerClassNormOne_zero`), so the hypothesis `EulerClassNormOne` of the conjecture
  excludes it, as `x*(0) = 0 ≠ 1` does in the general form.

*Needs:* 10.1 (taut foliations); 10.2 (the Euler class and its pairing); 10.3 (the Thurston norm,
its dual and the comparison with the native inequality); 8.2 (irreducibility); 7.2 (hyperbolic
manifolds); 7.4 (fibering); 5.3 (Dehn surgery, for Yazdi's examples); the native
`TauCeti.ThurstonEulerClassInequality`, `TauCeti.EulerClassOneConjecture`,
`TauCeti.YazdiEulerClassOneTheorem`, `YazdiEulerClassOneTheorem.not_eulerClassOneConjecture`,
`Foliation.Taut`, `Foliation.IsEulerClass`, `TauCeti.EulerClassBounded`,
`TauCeti.EulerClassNormOne`.

### Examples

The product foliations of `S² × S¹`, `T³` and `Σ₂ × S¹`, the Reeb foliation of `S³`, and the
tangent bundles of surfaces for the Euler class.

### Dependencies

DifferentialGeometry Layer 4 and the native foliations, leaves, tautness, Thom classes, Euler
classes and Euler class inequalities of the supplier contracts; Layer 2 (embedded surfaces as
locally flat submanifolds); AlgebraicTopology (cohomology, fundamental classes, cup products);
Layer 8 (incompressible surfaces, for the attainment statement of 10.3; irreducibility, for the
norm form of Thurston's inequality in 10.4); Layer 7 (hyperbolic manifolds, for the comparison of
10.3 and for Yazdi's examples) and Layer 5 (the Dehn surgeries that produce them).

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

*Needs:* Mathlib `AbstractSimplicialComplex`, `PreAbstractSimplicialComplex`,
`Topology.IsClosedEmbedding`, `CompactSpace`; the native `AbstractSimplicialComplex.Realization`,
`faceInclusion`, `carrier`, `vertex`, `realizationMap`,
`PreAbstractSimplicialComplex.SimplicialMap`, `SimplicialMap.realizationMap`,
`realizationHomeomorph`, `realizationBotHomeomorph`, the finite, locally finite, subcomplex and
glued-homotopy facts of `Realization/`, `PreAbstractSimplicialComplex.link`,
`AbstractSimplicialComplex.orderedProd`, `orderedCylinder`.

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

*Needs:* the native `TauCeti.IsTriangulable`, `TauCeti.FiniteCWType`,
`TauCeti.IsClosedConnectedManifold`, `realizationStandardSuccSimplexBoundaryHomeomorphSphere`;
Mathlib `Topology.CWComplex`, `Topology.RelCWComplex`, `LinearOrder`; 11.1 (compact subsets,
restriction, realization of simplicial maps); AlgebraicTopology Stage 4 (cellular chains and the
cellular boundary formula).

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

*Needs:* the native `PreAbstractSimplicialComplex.IsCombinatorialBall`, `IsCombinatorialSphere`,
`IsCombinatorialManifold`, `PreAbstractSimplicialComplex.link`, `TauCeti.PLGroupoid`; Mathlib
`HasGroupoid`, `modelWithCornersEuclideanHalfSpace`; 1.5 (the PL groupoid); 11.1 (stars, links and
realizations).

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

*Needs:* the native `PreAbstractSimplicialComplex.ElementaryCollapsesTo`, `CollapsesTo`,
`Collapsible`, the collapses of `Collapse/Cone.lean` and `Collapse/Cylinder/Basic.lean`,
`collapsible_orderedCylinder_top`, `AbstractSimplicialComplex.Contractible2Complex`,
`TauCeti.ZeemanConjecture`; Mathlib `ContractibleSpace`; 11.1 (glued homotopies and ordered
cylinders).

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

*Needs:* 1.5 (the PL groupoid); 11.1 (polyhedra); 11.2 (the CW structure of a polyhedron and
`TauCeti.FiniteCWType`); 11.3 (combinatorial manifolds as PL manifolds); Mathlib `IsManifold`,
`ContMDiff`, `Manifold.IsImmersion`.

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

*Needs:* the native `TauCeti.PLGroupoid_le_continuousGroupoid`, `TauCeti.doubleRight`; 1.5; 12.1.

### 12.3 From topological to PL in dimensions at most four

Prove **Moise's theorem in PL form**: every compact topological manifold of dimension at most three
has a PL structure `HasGroupoid M (PLGroupoid (𝓡∂ n))`, and any two PL structures on it are PL
homeomorphic (Moise, *Geometric Topology in Dimensions 2 and 3*, Theorems 35.3 and 36.2). The
route: the triangulation and the common subdivision of two triangulations are 11.2, and the
passage from a triangulation of a `3`-manifold to a combinatorial manifold and its PL structure is
11.3. Prove the **four-dimensional failure**: Freedman's `E₈` manifold, a closed simply connected
topological `4`-manifold with intersection form `E₈`, has no PL structure, since a compact PL
manifold is PL homeomorphic to a combinatorial manifold (11.3), hence triangulable, and the `E₈`
manifold is not triangulable (11.2; Manolescu, *Lectures on the triangulation conjecture*, Section
1). In dimension at least five the existence and the number of PL structures on a closed
topological manifold are governed by the Kirby–Siebenmann obstruction, whose carriers (the stable
tangent microbundle, `BTOP`, `BPL`) are not available; that theorem is deferred in the scope
statement and is no input of this layer.

- Every compact topological manifold of dimension at most three has a PL structure, unique up to
  PL homeomorphism; the forgetful map of 12.2 is a bijection from PL-homeomorphism classes to
  homeomorphism classes in these dimensions.
- The `E₈` manifold is a closed topological `4`-manifold with no PL structure, so the forgetful
  map of 12.2 is not surjective in dimension four.
- Every compact `3`-manifold carries a smooth structure, unique up to diffeomorphism (Moise,
  Theorems 35.3 and 36.2, with the smoothing theory of PL manifolds in dimension at most three,
  Munkres, *Elementary Differential Topology*), so the three structures coincide in dimension at
  most three, as 11.2 records.

**Checks.**

- `S³` has the PL structure of `∂Δ⁴` (11.2), and every PL structure on `S³` is PL homeomorphic to
  it; the lens spaces `L(p, q)` are compact `3`-manifolds, so each has a PL structure, unique up to
  PL homeomorphism, and the classification of 5.3 is the same up to homeomorphism and up to PL
  homeomorphism.
- The `E₈` manifold: `H₂ ≅ ℤ⁸` with the even unimodular form `E₈` of signature `8`; it is not
  triangulable (11.2), hence not PL and not smooth, while its homotopy type and homeomorphism type
  exist (Freedman); so "closed topological `4`-manifold" is strictly weaker than "PL `4`-manifold",
  and a statement of 12.3's uniqueness in dimension four would be false for lack of existence.
- The five-torus `T⁵` carries PL structures that are not PL homeomorphic (Kirby–Siebenmann,
  Essay V), so a statement of uniqueness in all dimensions would be false: the dimension bound of
  the uniqueness statement is not removable, and the dimension-five phenomenon is the deferred
  obstruction theory, not a target.

*Needs:* 11.2 (Moise's theorem and the `E₈` manifold); 11.3 (combinatorial manifolds and PL
manifolds, both directions); 1.5; 12.2; the native `TauCeti.IsTriangulable`, `TauCeti.PLGroupoid`;
Mathlib `HasGroupoid`.

### Examples

Triangulations of `S¹`, `S²` and `T²`; `doubleRight`; `S³` and the lens spaces with their unique
PL structures; the `E₈` manifold; the five-torus as the non-example.

### Dependencies

Layer 1 (the PL groupoid), Layer 11 (combinatorial manifolds, triangulability, the CW structure).
The Kirby–Siebenmann obstruction theory is deferred in the scope statement and is no input.

## Downstream consumers

- AlgebraicTopology consumes Layer 11's realization API and CW structure and 12.1 (compact smooth
  manifolds have finite CW type); ClassifyingSpaces consumes Layer 11's polyhedra, their weak
  topology and the cellular chains of countable joins; AffineMorseLefschetz consumes Layers 1 and
  11 and 12.1.
- CombinatorialHeegaardFloer Lane K consumes Layer 4's presentations and polynomials and 6.3's
  link cobordisms; KhovanovHomology consumes Layer 4's geometric and diagram presentations, Layer
  1's tubes and Layer 6's link cobordisms; HeegaardFloer consumes Layer 1, Layer 3's weak Whitney
  topology, Layer 9's splittings and 12.1.
- MorseNovikov consumes Layers 1, 3, 4, 5 and 11; MorseTheory consumes Layer 1's collars, tubes
  and handle gluing, and owns its own bicollars in coordinates, consuming nothing of Layer 2.
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
  (cellular chains), Corollary 3.45 (Alexander duality, from the relative form Theorem 3.44),
  Proposition A.1 (compact subsets of CW complexes).
- M. Hirsch, *Differential Topology*, Springer GTM 33 (1976): Chapter 2 (function-space topologies
  and approximation), Chapter 3 (transversality), Chapter 4, Section 6 (collars, Theorem 6.1;
  tubular neighbourhoods, Theorems 6.3 and 6.5), Chapter 8 (isotopy, the disc theorem 3.1, and
  gluing).
- J. Lee, *Introduction to Smooth Manifolds*, Springer GTM 218, 2nd ed. (2013): Theorem 9.25
  (collars), Theorem 6.24 (tubular neighbourhoods); *Introduction to Riemannian Manifolds*,
  Springer GTM 176, 2nd ed. (2018): Chapters 2 and 8 (volume, curvature).
- R. Palais, *Extending diffeomorphisms*, Proc. Amer. Math. Soc. 11 (1960) 274–277. A. Kosinski,
  *Differential Manifolds*, Academic Press (1993), Chapter VI, Section 1 (the connected sum).
- C. Rourke, B. Sanderson, *Introduction to Piecewise-Linear Topology*, Springer (1972): Chapters
  1–2 (polyhedra, PL maps, products), Chapter 3 (links, combinatorial manifolds, collapse).
- R. Daverman, G. Venema, *Embeddings in Manifolds*, AMS GSM 106 (2009): locally flat and wild
  embeddings. M. Brown, *Locally flat imbeddings of topological manifolds*, Ann. of Math. 75
  (1962) 331–341. R. Kirby, *Stable homeomorphisms and the annulus conjecture*, Ann. of Math. 89
  (1969) 575–582. F. Quinn, *Ends of maps III: dimensions 4 and 5*, J. Differential Geom. 17 (1982).
- J. Cerf, *Sur les difféomorphismes de la sphère de dimension trois (Γ₄ = 0)*, Springer LNM 53
  (1968), Théorème 1. A. Hatcher, *A proof of the Smale conjecture, `Diff(S³) ≃ O(4)`*, Ann. of
  Math. 117 (1983). T. Watanabe, *Some exotic nontrivial elements of the rational homotopy groups
  of `Diff(S⁴)`*, arXiv:1812.02448, Theorem 1.1 and Remark 1.2. M. Kervaire, J. Milnor, *Groups
  of homotopy spheres I*, Ann. of Math. 77 (1963) 504–537.
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
  on the h-cobordism Theorem*, Princeton (1965), Section 3; *A procedure for killing homotopy
  groups of differentiable manifolds*, Proc. Sympos. Pure Math. 3 (1961) 39–55, Section 1. B.
  Farb, D. Margalit, *A Primer on Mapping Class Groups*, Princeton (2012), Theorem 2.5.
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
- C. Livingston, *A survey of classical knot concordance*, arXiv:math/0307077, Sections 2, 3.1
  and 9.5. A. Tristram, *Some cobordism invariants for links*, Proc. Cambridge Philos. Soc. 66 (1969).
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
  2.1. J. Hempel, *3-Manifolds*, Annals of Math. Studies 86 (1976), Chapters 2 and 3. T. Li,
  *Rank and genus of 3-manifolds*, J. Amer. Math. Soc. 26 (2013), arXiv:1106.6302, Theorems 1.1
  and 1.2.
- D. Calegari, *Foliations and the Geometry of 3-Manifolds*, Oxford (2007), author's page, Chapter
  4. A. Candel, L. Conlon, *Foliations I*, AMS GSM 23. W. Thurston, *A norm for the
  homology of 3-manifolds*, Mem. Amer. Math. Soc. 59 (1986), Theorems 1 and 2 and Section 3. M.
  Yazdi, *On Thurston's Euler class one conjecture*, Acta Math. 225 (2020), arXiv:1603.03822,
  Section 1 (inequalities (1), (2), Definition 1.1, Theorem 1.2, the Main Theorem), Section 3.3,
  Proposition 3.12. D. Gabai, M. Yazdi, *The fully marked surface theorem*, Acta Math. 225 (2020).
  D. Gabai, *Foliations and the topology of 3-manifolds*, J. Differential Geom. 18 (1983)
  445–503, Corollary 6.18. J. Milnor, J. Stasheff, *Characteristic Classes*, Annals of Math.
  Studies 76 (1974), Sections 9 and 10, Theorem 10.4, Corollary 11.12 and Chapter 12. A. Hatcher,
  *Vector Bundles and K-Theory*, author's page, Section 3.
- E. Moise, *Geometric Topology in Dimensions 2 and 3*, Springer GTM 47 (1977), Theorems 35.3 and
  36.2. C. Manolescu, *Pin(2)-equivariant Seiberg–Witten Floer homology and the triangulation
  conjecture*, J. Amer. Math. Soc. 29 (2016), arXiv:1303.2354; *Lectures on the triangulation
  conjecture*, arXiv:1607.08163, Section 1 and Theorem 1.1. E. C. Zeeman, *On the dunce hat*,
  Topology 2 (1964) 341–358. J. H. C. Whitehead, *On C¹-complexes*, Ann. of Math. 41 (1940)
  809–824. J. Munkres, *Elementary Differential Topology*, Annals of Math. Studies 54 (1966),
  Theorems 10.5 and 10.6. R. Kirby, L. Siebenmann, *Foundational Essays on Topological Manifolds,
  Smoothings, and Triangulations*, Annals of Math. Studies 88 (1977), Essays IV and V.
