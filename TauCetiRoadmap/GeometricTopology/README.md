# Roadmap: geometric topology

**Summary.** This roadmap builds the geometric topology of manifolds that Mathlib does not yet
have, from the smooth-manifold and tangent-bundle level upwards: manifolds with boundary and
their collars, gluing along boundary faces, connected sums, tubular neighbourhoods and handle
decompositions (Layer 1); locally flat embeddings and the annulus theorem (Layer 2);
diffeomorphism groups with the weak Whitney topology, isotopy extension and the Smale
conjecture (Layer 3); knots and links in a general manifold with their presentations,
invariants and minima (Layer 4); Dehn surgery (Layer 5); knot concordance (Layer 6);
hyperbolic structures, volume and Mostow rigidity (Layer 7); the prime and JSJ
decompositions and the statement of geometrization (Layer 8); Heegaard splittings
(Layer 9); taut foliations (Layer 10); and triangulations, PL structures and collapse
(Layer 11). Each layer is a reusable library in its own right. The end theorems are the
resolved problems of Kirby's list that these primitives make statable: the Smale conjecture
and its four-dimensional failure, the annulus theorem, Freedman's topological slice theorem,
Mostow rigidity, Agol's virtual fibering and virtual Haken theorems, the JSJ theorem,
geometrization and the Poincaré conjecture, Li's rank-versus-genus examples, the Weeks
manifold, Property P and Manolescu's non-triangulable manifolds, together with Alexander's
sphere theorem, the knot-group theorem and the Gordon–Luecke theorem. `Suggested.lean` states
the fourteen of these that are statable against the pinned libraries.

## Scope and ownership

This roadmap owns the following, by layer.

- **Layer 1.** Smooth collars of boundaries as data, complements of embedded balls, gluing
  along codimension-zero boundary faces, handle attachment, connected sum with explicit
  choices and its independence, the normal bundle and variable-radius tubes, the tubular
  neighbourhood theorem in a general Riemannian ambient manifold and metric-independence
  of the normal bundle's smooth structure, handle decompositions of compact cobordisms, handle cancellation and the Whitney move in
  dimension at least five, and the comparison between smooth and PL structures in
  dimension two.
- **Layer 2.** The structural theory of locally flat embeddings beyond what Tau Ceti has at
  the pins (composition and codimension-one collaring), Brown's generalized Schoenflies
  theorem, and the statement of the annulus theorem in every dimension.
- **Layer 3.** The comparison of the weak topology on `Diff(M)` with the Whitney and
  compact-open topologies, the restriction fibration and isotopy extension (continuous families
  and smooth families), the classical cases `Diff(S¹) ≃ O(2)` and `Diff(S²) ≃ O(3)`, and the
  statements of Cerf's theorem that orientation-preserving diffeomorphisms of `S³` are isotopic
  to the identity and of the Smale conjecture.
- **Layer 4.** Knot and link theory in a general manifold and in `S³`: the geometric
  presentation and its combinatorial presentations (diagrams, braid closures, polygons), the
  equivalence relations in each presentation and the theorems comparing them (Reidemeister,
  Alexander, Markov), Seifert surfaces, the Alexander module and polynomial, the Conway, Jones,
  HOMFLY and Kauffman polynomials, Fox colourings and the determinant, the Arf invariant,
  the genus, crossing, unknotting, bridge and braid-index minima, prime decomposition of
  knots and of non-split links, rational tangles and two-bridge knots, torus knots and
  satellites, the Garside structure of braid groups, the Morton–Franks–Williams bound,
  Kondo's realization theorem, and exponential bounds on the number of knot types.
- **Layer 5.** The compact exterior of a link, Dehn filling and surgery, surgery on framed
  links, lens spaces as fillings, the Lickorish–Wallace theorem, Moser's classification of
  the lens-space surgeries on torus knots, Mathieu's chirally cosmetic pairs, the Montesinos
  trick, Scharlemann's theorem that unknotting-number-one knots are prime, the statements of
  Property P, Property R and the cyclic surgery theorem, and the Kanenobu–Murakami criterion
  derived from the cyclic surgery theorem as stated.
- **Layer 6.** Smooth and topological concordance of knots, the concordance group, the
  Levine–Tristram signatures and their concordance invariance, torus-knot signatures and
  chirality, the signature bound on the unknotting number, Conway mutation and the statement
  that it does not preserve smooth concordance, Levine's theorem on knots in homology
  spheres, and the statement of Freedman's theorem.
- **Layer 7.** The statement of Mostow rigidity for closed hyperbolic manifolds, finite-volume
  hyperbolic 3-manifolds (the Margulis lemma, the thick–thin decomposition and the cusp
  structure), the Weeks manifold as a Dehn filling of the Whitehead link exterior and the
  statement of its minimality, and the statements of the virtual fibering and virtual Haken
  theorems.
- **Layer 8.** The sphere theorem, Dehn's lemma and the loop theorem, the Kneser–Milnor prime
  decomposition, Kneser's finiteness, incompressible and normal surfaces, the Haken hierarchy,
  Waldhausen's theorem on homotopy equivalences of closed Haken manifolds, the Seifert
  fibration API, and the statements of the Gordon–Luecke theorem, the JSJ theorem,
  geometrization and the Poincaré conjecture.
- **Layer 9.** Handlebodies, Heegaard splittings and the Heegaard genus, the inequality
  between rank and genus, Waldhausen's theorem on splittings of `S³`, and the statement of
  Li's theorem.
- **Layer 10.** Codimension-one transversely oriented foliations of 3-manifolds, Reeb
  components, Reeb stability, the Novikov–Rosenberg theorem and the existence of foliations
  on closed orientable 3-manifolds.
- **Layer 11.** Geometric realization of simplicial complexes beyond the pinned API (stars,
  links, subdivision, the CW structure), the triangulation theorem and Hauptvermutung in
  dimension three, the equivalence of combinatorial manifolds and PL manifolds, smooth
  triangulations in every dimension and uniqueness of smoothings in dimension at most
  three, the statement of Manolescu's theorem and the statement of Zeeman's conjecture.

This roadmap leaves the following to other roadmaps.

- **Mathlib and Tau Ceti** already have, at the pins, the carriers listed under *Exact supplier
  contracts*: the model geometries and geometric structures, hyperbolic metrics and their
  volumes, locally flat embeddings and Brown's bicollaring theorem, the diffeomorphism group
  with its weak Whitney topology, smooth embeddings and their normal spaces, the Euclidean
  tubular neighbourhood with its normal vector bundle, slopes and framed boundary tori,
  Seifert fibrations, the sphere-bounds-a-ball condition, JSJ and geometric torus
  decompositions, Haken and virtually Haken manifolds, mapping tori, the PL groupoid,
  simplicial realization, combinatorial manifolds, collapse, triangulability, and the
  propositions naming the Smale conjecture, Watanabe's theorem, the annulus conjecture,
  Freedman's theorem, Mostow rigidity, the virtual fibering and virtual Haken conjectures,
  the JSJ theorem, geometrization, the triangulation conjecture and Zeeman's conjecture. None
  of these is planned again here; each is cited by name where it is used.
- **DifferentialGeometry** owns faces of manifolds with corners, flows, involutive
  distributions and the Frobenius theorem, integration of forms, Riemannian metrics and the
  existence of a smooth metric. **HopfRinow** owns the Levi-Civita connection, geodesics, the
  exponential map, normal neighbourhoods and the Hopf–Rinow theorem.
- **SurfaceTopology** owns the classification of compact surfaces and surface mapping class
  groups; **PlanarTopology** owns Radó's theorem, the two-dimensional Hauptvermutung and the
  two-dimensional Schoenflies theorem. **TypeAHeckeAlgebras** owns the Hecke algebras and
  the Ocneanu trace.
- **Proofs of the end theorems owned elsewhere.** The proof of geometrization, hence of the
  Poincaré conjecture, is Ricci-flow analysis (RicciFlow). The proof of Freedman's theorem is
  the disc embedding theorem in dimension four (FourManifolds), which also owns the
  dimension-four case of the annulus theorem. Manolescu's theorem is proved by
  Pin(2)-equivariant Seiberg–Witten Floer homology, Watanabe's theorem by configuration-space
  integrals, and Agol's theorems by the theory of special cube complexes; their proofs are the
  work of later roadmaps. This roadmap states these theorems against its carriers and owns
  every topological reduction named in the layers below.
- **GeometricTopology, Part II** starts where this roadmap stops, at the statements and
  carriers of the end theorems, and owns their proofs that this roadmap does not: Cerf's
  theorem and Hatcher's proof of the Smale conjecture (from Layers 3.1–3.3), Mostow rigidity
  for closed hyperbolic manifolds with its consequences for volume and isometry groups (from
  Layers 7.1 and 7.2), the cyclic surgery theorem (from Layers 5.2 and 8, through the
  Culler–Shalen theory of essential surfaces at ideal points of the character variety), the
  Gordon–Luecke theorem with its corollary on `S³` fillings (from Layers 5 and 8.1), and the
  JSJ theorem (from Layers 8.1–8.4). It also owns the developments
  that consume roadmaps downstream of this one: the torus trick and the high-dimensional proof of the annulus theorem (surgery on
  homotopy tori and the Kirby–Siebenmann obstruction), topological microbundles, the TOP/PL
  comparison and the smoothing theory beyond dimension three; the Lee deformation of Khovanov
  homology and Rasmussen's invariant with the Conway-knot and zero-shake-genus applications;
  the connected-sum and descent adapter for the grid invariant of CombinatorialHeegaardFloer;
  the Thurston norm, the Euler class of a foliation and the Euler-class-one counterexamples;
  the constructive hyperbolization of closed Haken manifolds and the finite-volume
  Mostow–Prasad theorem with its Kleinian-group inputs; disc bundles, clutching, plumbing and
  intersection forms; and sphere-target transversality with the Pontryagin–Thom
  construction. Those developments need AlgebraicTopology, CharacteristicClasses,
  GeneralizedCohomology, TopologicalKTheory, MorseTheory, RiemannianGeometry,
  KhovanovHomology, CombinatorialHeegaardFloer, TeichmullerGeometry, TangentialBordism,
  HomotopySpheres or FourManifolds, every one of which consumes this roadmap.
- **Knot tables and computation.** Tabulated volumes, knot tables and finite enumerations are
  not targets. Small computed values appear only as Checks on the definitions they test.

## Conventions

- **A manifold is a type with instances.** A manifold is a type `M` with `TopologicalSpace M`,
  `ChartedSpace H M` and `IsManifold I n M`; constructions produce such a type with its
  instances and are compared by `Diffeomorph` or `Homeomorph` in theorem statements, never
  through a quotient type of manifolds. A *closed* manifold is compact without boundary; a
  theorem about closed manifolds carries `CompactSpace`, `T2Space` (or `MetricSpace`) and
  `SecondCountableTopology` (or `T3Space` with Mathlib's charted-space second countability)
  explicitly, since `IsManifold` alone supplies none of them. Connectedness and
  nonemptiness are explicit hypotheses wherever a theorem needs them.
- **Named conditions are predicates.** Closed, orientable, irreducible, hyperbolic, prime,
  Haken are predicates or typeclasses on a manifold, never bundled into a new carrier.
  Orientations, framings and base points are data passed as arguments.
- **Dimensions.** `𝓡 n` is the boundaryless model `EuclideanSpace ℝ (Fin n)` and `𝓡∂ n` the
  half-space model; `Sⁿ` is `Metric.sphere (0 : EuclideanSpace ℝ (Fin (n+1))) 1`, `Dⁿ` the
  closed unit ball of `EuclideanSpace ℝ (Fin n)`. The circle is Mathlib's `Circle`, the unit
  circle in `ℂ`, with the orientation of increasing argument.
- **Knots have no privileged type.** A knot in `M` is a smooth circle embedding,
  `TauCeti.SmoothCircleEmbedding I M`; an `n`-component link is `TauCeti.SmoothLinkEmbedding I M n`.
  The parametrization orients each component; the unoriented object is the range. A framing
  is separate normal data. Combinatorial presentations (diagrams, braid closures, polygons)
  are types of their own, related to the geometric presentation by realization maps and
  comparison theorems; no umbrella `Knot` type is introduced.
- **Isotopy is defined once.** Isotopy and ambient isotopy of continuous maps are Tau Ceti's
  `TauCeti.Isotopic`, `TauCeti.AmbientIsotopic` and `TauCeti.AmbientIsotopy`; their smooth
  forms are `TauCeti.Diffeotopy` and `TauCeti.SmoothAmbientIsotopic`. Knot equivalence,
  diffeotopy of diffeomorphisms and the uniqueness statements of Layers 2, 5 and 8 all
  specialize these.
- **Orientations and signs.** `ℝ³`, `S³` and `D⁴` carry their standard orientations and `S³`
  is the oriented boundary of `D⁴` with the outward normal first. A right-handed crossing
  counts `+1`. The mirror image of a link is its image under the reflection
  `(x₀, x₁, x₂, x₃) ↦ (x₀, x₁, x₂, −x₃)` of `S³`; reversing the parametrization of a
  component is a separate operation. The linking number of two disjoint oriented knots is
  half the signed count of mixed crossings; the positive Hopf link has linking number `+1`.
- **Seifert matrices.** For an oriented surface `F ⊂ S³` with positive normal `ν` (oriented
  tangent frame followed by `ν` is the ambient orientation) and classes `x, y ∈ H₁(F; ℤ)`, the
  Seifert form is `θ(x, y) = lk(x, y⁺)`, `y⁺` the push-off of `y` along `ν`. Then
  `θ(x, y) − θ(y, x) = x · y` is the intersection form of `F`. The right-handed trefoil has
  Seifert matrix `[[−1, 1], [0, −1]]`, which is `TauCeti.KnotTheory.trefoilSeifertMatrix`.
- **Polynomial normalizations.** The Alexander polynomial of a knot is Conway-normalized:
  `Δ_K(t) = Δ_K(t⁻¹)` and `Δ_K(1) = 1`; the right-handed trefoil has `t − 1 + t⁻¹` and the
  figure-eight `−t + 3 − t⁻¹`. The Jones polynomial is defined through the Kauffman bracket
  with `t = A⁻⁴` and `V(unknot) = 1`, so the right-handed trefoil has `t + t³ − t⁴`. The
  HOMFLY polynomial lives in the degree-zero part of `ℤ[x^±, y^±, z^±]` with skein relation
  `x P(L₊) + y P(L₋) + z P(L₀) = 0` and `P(unknot) = 1`. The Levine–Tristram signature at
  `ω ∈ S¹` is the signature of the Hermitian matrix `(1 − ω) V + (1 − ω̄) Vᵀ`, which is
  `TauCeti.KnotTheory.tristramLevineForm`; the right-handed trefoil has signature `−2` at
  `ω = −1`.
- **Slopes.** A slope on a boundary torus is a primitive class in `H₁(T; ℤ)` up to sign,
  `TauCeti.Slope`; with the framed basis `(μ, λ)` of meridian and Seifert longitude, `p/q`
  denotes `p·μ + q·λ`, so the meridian is `∞ = 1/0` and the longitude is `0`. Dehn filling
  along `p/q` glues a solid torus whose meridian goes to `p·μ + q·λ`.
- **Hyperbolic metrics.** A hyperbolic metric is a complete smooth Riemannian metric of
  constant sectional curvature `−1`, `TauCeti.HyperbolicMetric`. Volume is the total mass of
  `TauCeti.riemannianVolume`; `hypVolume` is defined from an arbitrary hyperbolic metric and
  its independence of the metric is Mostow rigidity, a theorem, not a definition.
- **Combinatorial manifolds.** Dimension `0` is the case of a discrete complex with empty
  vertex links; for `n + 1` every vertex link is a combinatorial `n`-sphere or `n`-ball. This
  is Tau Ceti's `TauCeti.IsCombinatorialManifold`, by pattern matching on the dimension.

## Exact supplier contracts

### From Mathlib

- Manifolds: `ModelWithCorners`, `IsManifold`, `ChartedSpace`, the boundary and interior of a
  manifold (`ModelWithCorners.boundary`, `ModelWithCorners.interior`,
  `ModelWithCorners.IsInteriorPoint`), the half-space model `modelWithCornersEuclideanHalfSpace`
  and the quadrant model (`Mathlib/Geometry/Manifold/IsManifold/`,
  `Mathlib/Geometry/Manifold/Instances/Real.lean`); `TangentSpace`, `TangentBundle`, `mfderiv`,
  `ContMDiff`, `ContMDiffMap`; `Diffeomorph` with notation `M ≃ₘ^n⟮I, I'⟯ M'`;
  `Manifold.IsSmoothEmbedding` and `Manifold.IsImmersion`; structure groupoids
  (`StructureGroupoid`, `Pregroupoid`, `contDiffGroupoid`, `continuousGroupoid`, `HasGroupoid`);
  the sphere `Metric.sphere` as an analytic manifold and `Circle` as a Lie group
  (`Mathlib/Geometry/Manifold/Instances/Sphere.lean`);
  `SmoothPartitionOfUnity.exists_isSubordinate`
  (`Mathlib/Geometry/Manifold/PartitionOfUnity.lean`), subordinate smooth partitions on
  Hausdorff sigma-compact finite-dimensional smooth manifolds.
- Riemannian geometry: `RiemannianBundle`, `IsRiemannianManifold`, `riemannianEDist`,
  `EMetricSpace.ofRiemannianMetric`, `MetricSpace.ofRiemannianMetric`, path length
  (`Mathlib/Geometry/Manifold/Riemannian/`).
- Topology: `Homeomorph`, `IsEmbedding`, `IsOpenEmbedding`, `IsClosedEmbedding`,
  `ContinuousMap.HomotopyEquiv`, `ContinuousMap.Homotopic`, `Path`, `Joined`,
  `IsCoveringMap`, `FundamentalGroup`, `SimplyConnectedSpace`, `HomotopyGroup` (notation
  `π_ n X x`), `ContractibleSpace`, the compact-open topology on `C(X, Y)`; singular homology
  `Mathlib/AlgebraicTopology/SingularHomology/`; `AbstractSimplicialComplex` and
  `PreAbstractSimplicialComplex` (`Mathlib/AlgebraicTopology/SimplicialComplex/Basic.lean`).
- Algebra: `Matrix.orthogonalGroup`, `Matrix.specialOrthogonalGroup`, `LaurentPolynomial`
  (notation `R[T;T⁻¹]`) and `LaurentPolynomial.eval₂`, `LaurentPolynomial.eval₂_T`,
  `LaurentPolynomial.eval₂_C` (`Mathlib/Algebra/Polynomial/Laurent.lean`): evaluation at a
  specified unit along a coefficient ring homomorphism; `RatFunc`, `Quandle` and `Quandle.Dihedral`
  (`Mathlib/Algebra/Quandle.lean`), `PresentedGroup`, `Group.rank` for finitely generated groups
  (`Mathlib/GroupTheory/Rank.lean`), `Group.IsPerfect`, `commutator`, `ZMod`.

### From Tau Ceti

The following pinned declarations supply the carriers and results used below. Layer 1.5
constructs the smooth normal bundle and variable-radius tubes, Layer 1.7 proves the compact
PL comparison, Layer 4.6 constructs the HOMFLY coefficient substitution, and Layer 5.1
constructs the compact link exterior.

- **Boundaries and collars** (`Geometry/Manifold/Boundary/`): `TauCeti.isManifold_boundary`
  (the boundary of a `C^k` manifold over `𝓡∂ (n+1)` is a `C^k` manifold over `𝓡 n`) and
  `TauCeti.isSmoothEmbedding_subtypeVal_boundary`; the topological collar predicates
  `TauCeti.IsCollar`, `TauCeti.IsCollared`, `TauCeti.IsLocallyCollared` (`Collar/Global.lean`);
  the Euclidean half-space collar `TauCeti.EuclideanHalfSpace.boundaryCollar` and the product
  collar charts of `Collar/Local.lean`.
- **Gluing of atlases** (`Geometry/Manifold/Gluing.lean`): `TauCeti.chartedSpaceOfIsOpenEmbedding`
  builds a charted space and `IsManifold` instance from an open cover by manifolds with smooth
  transition maps.
- **Smooth embeddings and normal spaces** (`Geometry/Manifold/SmoothEmbedding/`): the bundled
  `TauCeti.SmoothEmbedding I J n M N`, its quotient normal space
  `TauCeti.SmoothEmbedding.NormalSpace` with `normalClass` and `normalClassL`;
  `TauCeti.SmoothEmbedding.Concordant` and the collared `TauCeti.SmoothEmbedding.Concordance`
  between two smooth embeddings (`Concordance.lean`), with reflexivity, symmetry, transitivity
  and invariance under diffeomorphisms of either side.
- **Euclidean tubular neighbourhoods** (`Geometry/Manifold/TubularNeighborhood/Euclidean.lean`):
  `TauCeti.IsTubularNeighborhood`, `TauCeti.normalSubspace`, `TauCeti.normalTube`, and
  `TauCeti.exists_isOpenEmbedding_normalTube` for a compact boundaryless `C²` source,
  a `C²` injective map into a finite-dimensional real inner product space, and injective
  differential at every point. The instance
  `TauCeti.instTopologicalSpaceTotalSpaceNormalSubspace` gives the normal total space its
  subspace topology; it does not supply vector-bundle trivializations or smooth structure.
- **Immersions** (`Geometry/Manifold/Immersion.lean`): `TauCeti.isImmersion_iff_forall_isImmersionAt`.
- **Morse functions** (`Geometry/Manifold/Morse/Basic.lean`): `TauCeti.IsMorse`,
  `TauCeti.IsMorseOn`, `TauCeti.IsManifoldNondegenerateCriticalPoint`.
- **The PL groupoid** (`Geometry/Manifold/PLGroupoid.lean`, `Topology/PL/`):
  `TauCeti.IsPiecewiseAffineOn`, `TauCeti.IsPLOn`, `TauCeti.PLPregroupoid`,
  `TauCeti.PLGroupoid I`, `TauCeti.PLGroupoid_le_continuousGroupoid`, closure under restriction,
  and the witness `TauCeti.doubleRight_mem_PLGroupoid` of a PL map that is not affine.
- **Locally flat embeddings** (`Geometry/Manifold/LocallyFlat/`): `TauCeti.IsSliceChart`,
  `TauCeti.IsSliceEmbedding`, `TauCeti.IsLocallyFlat F F' f` (slice charts with model `F × F'`)
  with restriction, composition with open embeddings and homeomorphisms on either side, and
  products (`Basic.lean`); smooth embeddings between boundaryless manifolds are locally flat
  (`TauCeti.SmoothEmbedding.isLocallyFlat`, `Smooth.lean`) and the neat boundary variant
  (`Neat.lean`); `TauCeti.IsBicollar`, `TauCeti.IsBicollared`, `TauCeti.IsLocallyBicollared`
  (`Bicollar.lean`); Brown's bicollaring theorem `TauCeti.BrownBicollaring n` and its proof
  `TauCeti.brownBicollaring` (`Sphere.lean`, `Brown.lean`); the annulus conjecture
  `TauCeti.CoboundAnnulus` and `TauCeti.AnnulusConjecture n` with the round case
  `TauCeti.coboundAnnulus_smul_coe_sphere` (`Annulus.lean`); topological concordance
  `TauCeti.TopologicallyConcordant` (`Concordance/Basic.lean`) and the passage from smooth
  concordance (`Concordance/Smooth.lean`).
- **Isotopy** (`Topology/Homotopy/`): `TauCeti.Isotopy`, `TauCeti.Isotopic`,
  `TauCeti.AmbientIsotopy` with `final` and `finalHomeomorph`, `TauCeti.AmbientIsotopic`;
  `TauCeti.Diffeotopy J n M` with `timeSlice`, `final`, `trans`, `symm`, `toAmbientIsotopy`
  (`Geometry/Diffeomorphism/Diffeotopy/`).
- **Diffeomorphism groups** (`Geometry/Diffeomorphism/`): the `Group` instance on
  `M ≃ₘ^n⟮I, I⟯ M` and the abbreviation `TauCeti.Diff I M n` (`Group.lean`); the weak Whitney
  topology `Diffeomorph.weakWhitneyTopology` as the scoped instance of
  `TauCeti.DiffeomorphWeakWhitney`, with `Diffeomorph.ofSmoothFamily` turning a smooth family
  of diffeomorphisms into a continuous map (`Topology.lean`); `Diffeomorph.fixingSubgroup`,
  `TauCeti.RelativeDiff` and `TauCeti.DiscDiff n` for `Diff(Dⁿ, ∂)` (`FixingSubgroup/`,
  `Disc.lean`); the reference inclusion `TauCeti.orthogonalToDiffSphere n m` and its continuous
  form `TauCeti.continuousOrthogonalToDiffSphere` (`Sphere.lean`); the propositions
  `TauCeti.SmaleConjecture` (`Smale.lean`) and `TauCeti.WatanabeTheorem` (`Disc.lean`).
- **Knots and links** (`KnotTheory/`): `TauCeti.SmoothCircleEmbedding I M` with `rotate`,
  `reverse`, `TauCeti.SmoothCircleEmbedding.greatCircle` and `TauCeti.unknot`
  (`SmoothCircle.lean`); `TauCeti.SmoothLinkEmbedding I M n` with `empty`, `singleton`,
  `relabel`, `reverse` (`SmoothLink/Basic.lean`), `TauCeti.SmoothLinkEmbedding.SmoothAmbientIsotopic`
  and `TauCeti.SmoothLinkEmbedding.ContinuousAmbientIsotopic` with their equivalence laws and
  complement homeomorphisms (`SmoothLink/`); the knot group
  `TauCeti.SmoothCircleEmbedding.KnotGroup` and `HasPerfectCommutatorSubgroup`
  (`KnotGroup.lean`); sliceness `TauCeti.IsSmoothlySlice`, `TauCeti.IsTopologicallySlice`,
  `TauCeti.SmoothSliceSurface`, `TauCeti.sliceGenus` (`Slice/`), and the proposition
  `TauCeti.FreedmanSliceTheorem` (`Slice/Freedman.lean`); solid-torus neighbourhoods
  `TauCeti.IsSolidTorusNeighborhood` and its
  `TauCeti.IsSolidTorusNeighborhood.exteriorFrontierHomeomorph`, identifying the frontier
  of the complement of the open solid torus with its boundary torus in a Hausdorff ambient
  space (`LowDimTopology/SolidTorusNeighborhood/Basic.lean`).
- **Combinatorial knot theory** (`KnotTheory/`): `TauCeti.PDCode n`, `TauCeti.OrientedPDCode n`,
  `TauCeti.PDCode.IsPlanar`, the face permutation and face count (`PDCode/Planar.lean`), the
  state sum `TauCeti.PDCode.kauffmanBracket`, `normalizedKauffmanBracket`,
  `TauCeti.PDCode.stateLoopCount` (`PDCode/Kauffman.lean`), `TauCeti.OrientedPDCode.jonesPolynomial`
  with its Reidemeister, mirror and reversal laws (`PDCode/Jones.lean`);
  `TauCeti.BasedOrientedGaussCode` and `TauCeti.BasedOrientedGaussCode.toOrientedPDCode`
  (`GaussCode/`); `TauCeti.BraidGroup n`, `TauCeti.BraidWord n`, `TauCeti.BraidWord.closure`
  (`GroupTheory/SpecificGroups/Braid/`, `BraidWord/PDCode.lean`); `TauCeti.MarkovBraid`,
  `TauCeti.MarkovEquiv`, `TauCeti.MarkovBraid.componentCount` (`Markov.lean`); the matrix
  Alexander polynomial `TauCeti.KnotTheory.alexanderMatrix`, `TauCeti.KnotTheory.alexander`,
  `TauCeti.KnotTheory.trefoilSeifertMatrix`, `TauCeti.KnotTheory.figureEightSeifertMatrix`
  (`Alexander.lean`); S-equivalence `TauCeti.KnotTheory.IntegralSquareMatrix.SEquivalent`
  (`SeifertMatrix/SEquivalence.lean`); the Burau representation and
  `TauCeti.MarkovBraid.burauAlexander` (`Burau/`); `TauCeti.KnotTheory.tristramLevineForm`,
  `TauCeti.KnotTheory.tristramLevineSignature` with the Hermitian signature
  `Matrix.IsHermitian.signature` (`TristramLevine/`, `Analysis/Matrix/HermitianSignature.lean`);
  `TauCeti.KnotTheory.jimboWeightedTrace` (a weighted trace, before writhe normalization),
  the Markov trace on the Temperley–Lieb algebra (`Jimbo/` and the
  `MarkovTrace` module of the `Algebra` folder).
- **Slopes** (`LowDimTopology/DehnSurgery/Slope.lean`): `TauCeti.Slope M` (primitive classes
  up to sign), `TauCeti.BoundaryTorus`, `TauCeti.FramedBoundaryTorus` with `meridian`,
  `longitude`, `value` and `TauCeti.FramedBoundaryTorus.slopeEquiv : Slope T.H ≃ OnePoint ℚ`.
- **Lens spaces** (`Geometry/Manifold/Instances/LensSpace.lean`,
  `AlgebraicTopology/UniversalCover/LensSpace/`): `TauCeti.lensGroup m ℓ`, the quotient
  `TauCeti.LensSpace m ℓ` of the unit sphere with its analytic manifold structure, and its fundamental
  group `Multiplicative (ZMod m)`.
- **Seifert fibrations** (`LowDimTopology/SeifertFibration.lean`): `TauCeti.SolidTorus`,
  `TauCeti.SolidTorus.fiberSetoid p q`, `TauCeti.IsSeifertFibration`, `TauCeti.IsSeifertFibered`,
  invariance under homeomorphism, and the products `F × Circle`.
- **Irreducibility, incompressibility, Haken manifolds** (`Geometry/Manifold/`,
  `AlgebraicTopology/FundamentalGroup/Incompressible.lean`): `TauCeti.IsSphereBoundsBall`,
  `TauCeti.IsIncompressible` (embedding and injective on `π₁` at every base point),
  `TauCeti.IsClosedIncompressibleSurfaceEmbedding`, `TauCeti.IsHakenSurfaceEmbedding`,
  `TauCeti.IsPossiblyNonorientableHakenThreeManifold` and its closed variant,
  `TauCeti.IsVirtuallyHaken`; `TauCeti.Orientable I n M` (`Orientation.lean`).
- **Torus decompositions** (`LowDimTopology/JSJDecomposition.lean`,
  `LowDimTopology/Geometrization.lean`): `TauCeti.IsPeripheralTorus`, `TauCeti.IsAtoroidal`,
  `TauCeti.IsTorusDecomposition`, `TauCeti.IsJSJDecomposition` (minimality under inclusion),
  `TauCeti.JSJTheorem`, `TauCeti.IsGeometricTorusDecomposition`, `TauCeti.GeometrizationConjecture`.
- **Geometric structures and hyperbolic metrics** (`Geometry/Manifold/Riemannian/`):
  `TauCeti.ModelGeometry` (the eight Thurston geometries as a finite type) with `Space`,
  `model`, `TauCeti.HasGeometricStructure M G` and its quotient characterization
  (`GeometricStructure/Basic.lean`); `TauCeti.HyperbolicMetric` (complete, constant curvature
  `−1`), `TauCeti.IsHyperbolic` (`Hyperbolic.lean`); `TauCeti.HyperbolicMetric.Isometry`,
  `TauCeti.RiemannianIsometry`, the isometry group `TauCeti.Isom I M` with `toDiff`
  (`Isometry/`); `TauCeti.hypVolumeOfMetric`, `TauCeti.hypVolume`,
  `TauCeti.hypVolumeOfMetric_eq_of_mostow` (`Hyperbolic/Volume.lean`);
  `TauCeti.HyperbolicMetric.HasFiniteVolume`, `TauCeti.IsFiniteVolumeHyperbolic`
  (`Hyperbolic/FiniteVolume.lean`); `TauCeti.IsMostowRigid`, `TauCeti.MostowRigidity`
  (`Hyperbolic/Mostow.lean`); the upper half space `TauCeti.UpperHalfSpace E`
  (`Hyperbolic/UpperHalfSpace.lean`); `TauCeti.riemannianVolume` and
  `TauCeti.riemannianTotalVolume` (`VolumeDensity/`).
- **Mapping tori and virtual properties** (`Topology/`): `TauCeti.MappingTorus φ`,
  `TauCeti.FibersOverCircle`, `TauCeti.IsFiniteCover`, `TauCeti.IsVirtuallyFibered`,
  `TauCeti.VirtualFiberingConjecture`, `TauCeti.VirtualHakenConjecture`.
- **Foliations** (`Geometry/Manifold/Foliation/`): `TauCeti.Foliation I n M k`, the leaf
  relation `TauCeti.Foliation.SameLeaf` and `TauCeti.Foliation.leaf`,
  `TauCeti.Foliation.IsClosedTransversal`, `TauCeti.Foliation.Taut`, and the linear
  foliations `TauCeti.Foliation.ofSubmodule`.
- **Simplicial complexes** (`AlgebraicTopology/SimplicialComplex/`, `Topology/`):
  `AbstractSimplicialComplex.Realization K` with face inclusions and barycentric coordinates,
  the realization of maps, subcomplexes and locally finite complexes; `PreAbstractSimplicialComplex.closedStar`,
  `link`, `deletion` (`LinkStar.lean`); stellar subdivision (`Subdivision/`); the ordered
  cylinder `AbstractSimplicialComplex.orderedCylinder` (`Product.lean`);
  `PreAbstractSimplicialComplex.IsCombinatorialBall`, `IsCombinatorialSphere`,
  `IsCombinatorialManifold` by pattern matching on the dimension (`CombinatorialManifold/`);
  `PreAbstractSimplicialComplex.IsFreePair`, `ElementaryCollapsesTo`, `CollapsesTo`,
  `Collapsible` (`ElementaryCollapse.lean`, `Collapse/`); `TauCeti.IsTriangulable`,
  `TauCeti.IsCombinatoriallyTriangulable`, `TauCeti.TriangulationConjecture n`,
  `AbstractSimplicialComplex.Contractible2Complex`, `TauCeti.ZeemanConjecture`.

### From TauCetiRoadmap.DifferentialGeometry

Faces of manifolds with corners and the abstract boundary (the *Boundary and corners*
section); the fundamental theorem of flows on finite-dimensional manifolds and the two-time
flow of a time-dependent vector field (Layer 3); involutive distributions, the Frobenius
theorem and leaves (Layer 4); integration of densities and forms (Layer 5); existence of a
smooth Riemannian metric on a paracompact manifold and the comparison of densities with
`TauCeti.riemannianVolume` (Layer 12).

### From TauCetiRoadmap.HopfRinow

The Levi-Civita connection and its regularity, the geodesic flow, the exponential map and its
domain (Layer 1); normal neighbourhoods and the Gauss lemma (Layer 2); the Hopf–Rinow theorem
(Layer 3).

### From TauCetiRoadmap.SurfaceTopology and TauCetiRoadmap.PlanarTopology

SurfaceTopology Layer 8 supplies the classification of compact surfaces (the standard surfaces
of each genus, orientability and number of boundary components, and the Euler
characteristic); its Layer 9 supplies mapping class groups of surfaces and the comparison
between their PL, smooth and topological forms. PlanarTopology Layer 5 supplies Radó's
theorem and the two-dimensional Hauptvermutung, Layer 7 the two-dimensional Schoenflies
theorem, and Layer 8 the uniqueness of PL and smooth structures in dimension two.

### From TauCetiRoadmap.TypeAHeckeAlgebras

H1 supplies the finite type-A Hecke algebras and H2 the Ocneanu trace and its braid-closure
invariance; Layer 4 uses them only for the trace route to the HOMFLY polynomial.

## How to read the build

The layers group the targets by subject; the build order is the order of the `*Needs:*`
lines, target by target, and it is not the numerical order of the layers. Layer 1 is the
spine: boundaries, collars, gluing, connected sums, tubular neighbourhoods and handles, in
every dimension; everything later that cuts a manifold open and reglues it is an instance.
Four groups of targets are built before the layer numbering suggests. The disc theorem of
Layer 3.3, which needs only the tubes of Layer 1.5, precedes the connected sum of Layer 1.4.
The realizations, Moise's theorems and the smooth triangulations of Layers 11.1–11.3, which
need only Layer 1.7, precede Layer 1.8, the three-dimensional case of the annulus theorem in
Layer 2.3, and Layers 8 and 9. The exterior of Layer 5.1, built from Layers 1.2, 1.5, 3.3
and 4.1, precedes the Alexander module of Layer 4.4. The decomposition theorems of Layers
8.1–8.4, which need Layers 1, 4.4, 5.1 and 11.2, precede the cyclic surgery theorem of
Layer 5.4 and the finite-volume theory of Layer 7.3. With these edges the graph of targets
is acyclic. Otherwise Layers 2 and 3 are independent of each other and of Layer 4; Layer 6
(concordance) needs Layers 1, 2 and 4; Layer 7 needs Layer 1 and the Riemannian suppliers,
and for its finite-volume part the Dehn filling of Layer 5.2 and the irreducibility of
Layer 8.2; Layer 9 (Heegaard splittings) needs Layers 1, 7, 8 and 11; and Layer 10 (foliations) needs
Layers 1, 5, 7, 8 and 9. Each layer ends with its examples and its dependencies on the
others.

## Layer 1: manifolds with boundary, gluing, tubular neighbourhoods and handles

Throughout this layer manifolds are real, finite-dimensional, Hausdorff and second countable,
smooth unless said otherwise, with the half-space model `𝓡∂ n` when they have boundary.

### 1.1 Smooth collars

Define a smooth collar of a manifold with boundary `M` as a smooth embedding
`c : ∂M × [0, 1) → M` with open image whose restriction to `∂M × {0}` is the inclusion of the
boundary; here `∂M` carries the manifold structure of `TauCeti.isManifold_boundary` and
`∂M × [0, 1)` the product structure with the half-space model in the second factor. A collar
is data, not a property: every gluing in this layer takes its collars as arguments, and the
topological predicate `TauCeti.IsCollar` is what a smooth collar forgets to.

- Every compact, and more generally every second-countable, smooth manifold with boundary
  has a smooth collar (Hirsch, *Differential Topology*, Chapter 4, Theorem 6.1; Lee, *Introduction
  to Smooth Manifolds*, Theorem 9.25): choose an inward-pointing vector field and flow the
  boundary for a small time depending smoothly on the point. *Needs:* Mathlib `IsManifold`,
  `ModelWithCorners.boundary`; Tau Ceti `TauCeti.isManifold_boundary`,
  `TauCeti.IsLocallyCollared`; DifferentialGeometry Layer 3 (flows).
- The restriction of a collar to `∂M × [0, ε)` is a collar for every `0 < ε ≤ 1`, and the
  reparametrization by an orientation-preserving diffeomorphism of `[0, 1)` fixing `0` is a
  collar.
- Any two smooth collars of `M` agree after shrinking up to a diffeomorphism of `M` isotopic
  to the identity through diffeomorphisms fixing `∂M` pointwise (Hirsch, Chapter 4 §6).
- The interior `M ∖ ∂M` is a smooth boundaryless manifold, and the inclusion of the interior
  is a homotopy equivalence (Lee, Theorem 9.26).
- Collars of a disjoint union are the disjoint union of collars; a collar of `M` restricts to
  a collar of each boundary component.

**Checks.**
- The closed interval `[0, 1]` has the collar `({0} × [0, 1/2)) ∪ ({1} × [0, 1/2))` sending
  `(0, t)` to `t` and `(1, t)` to `1 − t`; a definition that forgot the open-image
  condition would also accept the constant map `(x, t) ↦ x`, which is not an embedding.
- The circle has empty boundary; its unique collar is the empty embedding, and the
  existence theorem is vacuous rather than false.
- The closed unit disc has the polar collar `(θ, t) ↦ (1 − t) e^{iθ}`; its image is the
  annulus `0 < |z| ≤ 1`, which is open in the disc.
- The half-space `𝓡∂ n` itself has the collar `(x, t) ↦ (x, t)` of
  `TauCeti.EuclideanHalfSpace.boundaryCollar`; the smooth collar of a general `M` restricts
  in a boundary chart to this one up to the chart's diffeomorphism, which is the local
  model the existence proof glues.

### 1.2 Complements of embedded balls

For `n ≥ 1`, a boundaryless `n`-manifold `M` and a smooth embedding `e` of an open ball of
radius `1 + δ` in `EuclideanSpace ℝ (Fin n)` into `M`, define the complement of the embedded
closed unit ball as the subtype `M ∖ e(B°)`, with `B°` the open unit ball, and give it the
structure of a smooth manifold with boundary whose boundary is `e(Sⁿ⁻¹)`: the interior points
keep the charts of `M`, and near `e(Sⁿ⁻¹)` the chart is `e` composed with radial coordinates
`(1 ≤ r < 1 + δ, θ ∈ Sⁿ⁻¹)`: this is the collar of the collaring theorem (Hirsch, Chapter 4,
Theorem 6.1) written explicitly through `e`, and the smooth structure is the one that collar
induces.

- The complement is compact when `M` is, connected when `M` is connected and `n ≥ 2`, and its
  boundary is diffeomorphic to `Sⁿ⁻¹` through `e`.
- The radial chart gives a smooth collar of the complement, so the complement comes with a
  canonical collar; two embeddings that agree on a neighbourhood of the closed ball give
  the same complement with the same collar.
- The inclusion of the complement into `M` is a smooth embedding of a manifold with boundary
  into a boundaryless manifold (the neat-boundary case of `TauCeti.IsLocallyFlat` applies).
- For `M` with nonempty boundary require `e` to land in the interior; the boundary of the
  complement is then the disjoint union `∂M ⊔ e(Sⁿ⁻¹)`.

**Checks.**
- The complement of a ball in `Sⁿ` is diffeomorphic to `Dⁿ` by stereographic projection from
  the centre of the removed ball; a definition without the radial chart would only give a
  topological manifold with boundary.
- The complement of the unit ball in `EuclideanSpace ℝ (Fin n)` is diffeomorphic to
  `Sⁿ⁻¹ × [1, ∞)` by `x ↦ (x/|x|, |x|)`.
- Removing two disjoint balls from `Sⁿ` gives `Sⁿ⁻¹ × [0, 1]`; removing one ball from `S¹`
  gives a closed interval, whose boundary `S⁰` has two points.
- For `n = 1` and `M = ℝ`, the complement of `(−1, 1)` is disconnected, which is why the
  connectedness law needs `n ≥ 2`.

*Needs:* Mathlib `IsManifold`, `Manifold.IsSmoothEmbedding`; Tau Ceti `TauCeti.SmoothEmbedding`,
`TauCeti.chartedSpaceOfIsOpenEmbedding`; Layer 1.1.

### 1.3 Gluing along the boundary and handle attachment

Given smooth manifolds with boundary `M`, `N`, smooth collars `c_M`, `c_N` and a diffeomorphism
`f : ∂M ≃ ∂N`, define `M ∪_f N` as the quotient of `M ⊔ N` by `x ∼ f(x)`, and give it the smooth
boundaryless structure in which the two interiors embed openly and the union of the two
collars is identified with `∂M × (−1, 1)` through `c_M` on `[0, 1)` and `c_N ∘ (f × id)` on
`(−1, 0]`. The atlas is `TauCeti.chartedSpaceOfIsOpenEmbedding` applied to this open cover of
three manifolds; the transition maps are smooth because the collars are smooth embeddings.
Gluing along a proper codimension-zero face `A ⊆ ∂M` to a face `B ⊆ ∂N` is the same
construction with face collars and produces corners along `∂A`; the face and corner
structure is DifferentialGeometry's. Handle attachment is the gluing of a handle
`Dᵏ × Dⁿ⁻ᵏ` to `M` along an embedding `Sᵏ⁻¹ × Dⁿ⁻ᵏ → ∂M`, followed by the straightening of
the corner along `Sᵏ⁻¹ × Sⁿ⁻ᵏ⁻¹`.

- The two inclusions `M → M ∪_f N` and `N → M ∪_f N` are smooth embeddings with closed
  images meeting in the image of `∂M`; the glued manifold is compact when both pieces are,
  and connected when both pieces are connected and `∂M` is nonempty.
- Changing the collars gives a diffeomorphic manifold by a diffeomorphism that is the
  identity away from the seam region; changing `f` by a diffeomorphism isotopic to the
  identity gives a diffeomorphic manifold (Hirsch, Chapter 8 §2).
- The double of `M` is `M ∪_id M`; it is a boundaryless manifold containing `M` as a
  codimension-zero submanifold with boundary, and it is closed exactly when `M` is compact.
- Handle attachment along isotopic attaching embeddings gives diffeomorphic results, and
  attaching along an embedding that extends over `Dᵏ × Dⁿ⁻ᵏ` into `M` (a trivial attaching
  map) gives `M` with a boundary connected sum of `Sᵏ × Dⁿ⁻ᵏ`.

**Checks.**
- Two closed discs glued by the identity of the circle give `S²`; two closed intervals glued
  by the identity of `S⁰` give `S¹`, the double of `[0, 1]`, which is closed. The double of the
  half-line `[0, ∞)` is `ℝ`: boundaryless but not compact, so a claim that every double is
  closed fails on it.
- Two solid tori `S¹ × D²` glued by the identity of the torus give `S¹ × S²`; glued by the
  diffeomorphism interchanging the two circle factors they give `S³`. The two results are
  distinguished by their fundamental groups `ℤ` and `1`, so the gluing map is part of the
  data.
- Attaching a `1`-handle to `D²` along two disjoint arcs of its boundary gives an annulus if
  the attaching map preserves the boundary orientation on one arc and reverses it on the
  other, and a Möbius band otherwise; the two are distinguished by orientability.
- A `0`-handle attachment adds a disjoint ball; an `n`-handle attached to `M` along a whole
  boundary sphere component caps it off, as the complement of a ball in `Sⁿ` capped off by
  the ball recovers `Sⁿ`.

*Needs:* Tau Ceti `TauCeti.chartedSpaceOfIsOpenEmbedding`, `TauCeti.SmoothEmbedding`; Layer 1.1,
Layer 1.2; DifferentialGeometry *Boundary and corners*.

### 1.4 Connected sum

Define the connected sum of two connected oriented `n`-manifolds `M`, `N` from explicit data:
orientation-preserving embeddings `e_M` of a ball into `M` and `e_N` into `N`, the two
complements of Layer 1.2 with their canonical collars, and the gluing of Layer 1.3 along the
diffeomorphism `e_N ∘ r ∘ e_M⁻¹` of the boundary spheres, where `r` is a fixed reflection of
`Sⁿ⁻¹`, so that the glued manifold is oriented compatibly with both summands. Prove that the
result is independent of the ball embeddings and collars up to orientation-preserving
diffeomorphism, using the disc theorem: two orientation-preserving embeddings of the closed
ball into a connected oriented manifold are ambient isotopic (Palais, *Extending
diffeomorphisms*, Proc. Amer. Math. Soc. 11 (1960); Hirsch, Chapter 4, Theorem 6.6 for the version with
a fixed centre, together with the homogeneity of a connected manifold).

- For `n ≥ 1`, `M # N` is oriented, compact when both summands are, and `M # Sⁿ` is
  orientation-preservingly diffeomorphic to `M`; for `n ≥ 2` it is connected, since the
  complement of a ball in a connected manifold of dimension at least two is connected. For
  `n = 1` the complement of an interval in `ℝ` has two components, so `ℝ # ℝ` is two lines,
  `ℝ # S¹` is one line and `S¹ # S¹` is one circle.
- Connected sum is commutative and associative up to orientation-preserving diffeomorphism.
- For `n ≥ 3`, `π₁(M # N) ≅ π₁(M) ∗ π₁(N)`; for compact `M` and `N` and every `n ≥ 1`,
  `χ(M # N) = χ(M) + χ(N) − χ(Sⁿ)`, the Euler characteristic being that of the finitely
  generated rational singular homology of a compact manifold.
- Reversing the orientation of one summand can change the diffeomorphism type: this is why the
  orientations are part of the data.

**Checks.**
- `S² # S²` is diffeomorphic to `S²`, and `T² # T²` is the closed orientable surface of genus
  `2`: its Euler characteristic is `0 + 0 − 2 = −2`.
- `ℂP² # ℂP²` and `ℂP² # (−ℂP²)` are not homotopy equivalent: their cup-product forms on `H²`
  are `diag(1, 1)` and `diag(1, −1)`, of signatures `2` and `0`. A definition that ignored the
  orientations would identify them.
- The connected sum with `Sⁿ` is the identity on the nose when the ball in `Sⁿ` is a hemisphere
  and the collars are the radial ones: the glued manifold is the complement in `M` of the
  open ball together with a closed ball, which is `M` again.
- For `n = 1` the connected sum of two circles is a circle, while `ℝ # ℝ` has two components:
  a statement of connectedness without `n ≥ 2` fails on it. For `n = 0` the construction is
  not defined, since a `0`-manifold has no ball with a sphere boundary.
- The orientable surface of infinite genus, the increasing union of the iterated sums
  `T² # ⋯ # T²` with a disc removed, has infinite-rank `H₁` and no Euler characteristic, which
  is why the Euler formula is stated for compact summands.

*Needs:* Layer 1.2, Layer 1.3, Layer 3.3 (ambient isotopy of ball embeddings); Tau Ceti
`TauCeti.Orientable`.

### 1.5 Tubular neighbourhoods

Let `f : S → M` be a smooth embedding between finite-dimensional Hausdorff second-countable
boundaryless manifolds, with `M` Riemannian (`RiemannianBundle` on its tangent bundle with
a smooth metric). Define the normal bundle of
`f` as the orthogonal complement of the image of `mfderiv f` in `TangentSpace (f x)`, a smooth
vector bundle over `S` with fibre the codimension model `EuclideanSpace ℝ (Fin (dim M − dim S))`,
and the normal exponential as the restriction of the Riemannian exponential (HopfRinow
Layer 1) to this bundle on its natural open domain. Prove that the normal bundle is
canonically isomorphic, as a smooth vector bundle, to the quotient bundle whose fibres are
`TauCeti.SmoothEmbedding.NormalSpace f x`, so that its smooth structure does not depend on the
metric. Construct the local trivializations and the compatible `FiberBundle`, `VectorBundle`
and `ContMDiffVectorBundle` structures, using the subspace topology in Euclidean ambient
space. In that case, for a positive function `δ : S → ℝ`, define the variable-radius tube
as `{(x,v) | v ∈ TauCeti.normalSubspace f x ∧ ‖v‖ < δ(x)}` and its map into the ambient
space by `(x,v) ↦ f x + v` (Lee, *Introduction to Smooth Manifolds*, Theorem 6.24).

- The normal bundle has rank `dim M − dim S`; the inclusion into the pulled-back tangent
  bundle is fibrewise linear and smooth, and the orthogonal projection identifies it with
  the quotient normal bundle. Restriction to an open subset of `S` preserves these data.
- For continuous positive `δ` the tube is open in the normal total space and contains its
  zero section; if `0 < δ' ≤ δ` pointwise, the smaller tube is contained in the larger one.
  For constant `δ = ε > 0` in Euclidean ambient space its underlying set is
  `TauCeti.normalTube f ε`.
- **Tubular neighbourhood theorem.** There is a smooth positive function `δ : S → ℝ` such
  that the normal exponential restricted to `{v : ‖v‖ < δ(x)}` is a diffeomorphism onto an
  open neighbourhood of `f(S)`; for compact `S` the radius may be taken constant (Lee,
  *Introduction to Riemannian Manifolds*, Theorem 5.25). Include the Euclidean `C²` form:
  for a `C²` embedding of a boundaryless manifold into a finite-dimensional real inner
  product space, construct a continuous positive radius making `(x,v) ↦ f x + v` an open
  embedding. On a smooth source choose the radius smooth, below any prescribed continuous
  positive bound, with image in any prescribed open neighbourhood of `f(S)`; for smooth
  `f` the resulting map is a diffeomorphism. No compactness or closed-image hypothesis is
  imposed on this variable-radius statement. A proof can use local normal coordinates,
  a locally finite shrinking and a partition of unity to choose a positive minorant:
  the normal exponential is a local diffeomorphism along the zero section by the direct-sum
  computation of its derivative, and `TauCeti.Manifold.edist_riemannianExp_le` bounds the
  base distance of two normal vectors with the same image. *Needs:* HopfRinow Layer 1
  (exponential map), Layer 2 (normal neighbourhoods); Mathlib `RiemannianBundle`,
  `SmoothPartitionOfUnity.exists_isSubordinate`; Tau Ceti
  `TauCeti.SmoothEmbedding.NormalSpace`, `TauCeti.isLocalDiffeomorphAt_of_mfderiv_eq`;
  DifferentialGeometry Layer 12 (existence of a smooth metric).
- Any two tubular neighbourhoods of `f` are isotopic through tubular neighbourhoods (Hirsch,
  Chapter 4, Theorem 5.3), and in particular the diffeomorphism type of the pair (`M`, tube) does not
  depend on the metric.
- The image of the tube deformation retracts onto `f(S)` by the straight-line homotopy in the
  fibres; the closed `ε`-disc bundle and its boundary sphere bundle are smooth
  submanifolds for `ε < δ`, which is the form Dehn surgery (Layer 5) uses.
- In Euclidean ambient space the orthogonal normal bundle is `TauCeti.normalSubspace` fibrewise
  and the tube map is `(x, v) ↦ f x + v` on `TauCeti.normalTube f ε`, so the general theorem
  extends the compact constant-radius theorem by constructing the variable-radius domain
  and the compatible smooth bundle structure.

**Checks.**
- The unit circle in `ℝ²` has normal bundle the trivial line bundle, and for `ε ≤ 1` the tube
  map `(x, v) ↦ x + v` is injective on the open tube `‖v‖ < ε`, with image the open annulus
  `1 − ε < |z| < 1 + ε`; at `ε = 1` the image is the punctured disc `0 < |z| < 2`, the inward
  vectors of length `1` being excluded by the strict inequality of `TauCeti.normalTube`. For
  `ε > 1` every `(x, −x)` goes to the origin and injectivity fails, so the bound `ε ≤ 1` is
  sharp; with the closed tube `‖v‖ ≤ ε` the failure already occurs at `ε = 1`.
- A point `{p} ⊂ M` has normal bundle `TangentSpace p` and its tube is a normal neighbourhood of
  HopfRinow Layer 2; the identity embedding `M → M` has rank-`0` normal bundle and the tube is
  `M` itself.
- For the disjoint circles of radius `1/n` centred at `(3n,0)`, `n ≥ 1`, any constant
  `ε > 0` fails: for `n > 1/ε`, inward normal vectors of length `1/n < ε` all map to that
  circle's centre. The smooth function equal to `1/(2n)` on component `n` gives annuli of
  radii between `1/(2n)` and `3/(2n)`; adjacent outer radii sum to at most `9/4 < 3`, so
  their images are disjoint. This excludes replacing the radius function by a constant.
- For the unit circle, radii `1/4 ≤ 1/2` give nested annuli `(3/4,5/4) ⊂ (1/2,3/2)`.
  Radius zero gives an empty strict tube, which does not contain the zero section; positivity
  is required. For the empty source the normal bundle and both tubes are empty.
- The figure-eight curve `t ↦ (sin t, sin 2t)` is an immersion but not an embedding, and the
  tube map fails to be injective near the double point: the embedding hypothesis is not
  removable.

### 1.6 Handle decompositions, cancellation and the Whitney move

Consume `TauCeti.IsMorse` and `TauCeti.IsManifoldNondegenerateCriticalPoint`. For a compact
cobordism `W` between closed manifolds `M₀` and `M₁` (a compact manifold with
`∂W = M₀ ⊔ M₁`) and a Morse function `h : W → [0, 1]` with `h⁻¹(0) = M₀`, `h⁻¹(1) = M₁` and
distinct critical values, prove that `W` is diffeomorphic rel `M₀` to `M₀ × [0, 1]` with one
`λ`-handle attached for each critical point of index `λ`, attached in the order of the
critical values (Milnor, *Lectures on the h-cobordism theorem*, §3). Prove the existence of
such a Morse function on every compact cobordism (Milnor, §2). Prove handle cancellation: a
`k`-handle and a `(k+1)`-handle whose attaching sphere and belt sphere meet transversely in
exactly one point can be removed without changing the diffeomorphism type rel the rest of
the boundary (Milnor, Theorem 5.4). Prove the Whitney move: in a manifold of dimension
`d ≥ 5`, two transverse submanifolds of complementary dimensions `p, q` with `p, q ≥ 3` (or
`p = 2`, `q ≥ 3` and simply connected complement of the `q`-dimensional one) and two
intersection points of opposite sign connected by an embedded framed Whitney disc with
interior disjoint from both, can be isotoped to remove the two points (Milnor, Theorem 6.6).

- Handle slides and the reordering of handles of the same index, and the dual decomposition
  obtained from `1 − h`, which exchanges indices `λ` and `d − λ`.
- Every closed connected `d`-manifold has a handle decomposition with exactly one `0`-handle
  and exactly one `d`-handle, the two clauses being dual under `1 − h`; a closed manifold with
  `c` components has at least `c` handles of each of the indices `0` and `d`.
- The chain complex of a handle decomposition computes the singular homology of `W` relative
  to `M₀`.

**Checks.**
- The height function on `S²` has two critical points of indices `0` and `2`: one `0`-handle
  and one `2`-handle, glued along their common boundary circle as in Layer 1.3.
- The height function on the standard torus of revolution has four critical points of
  indices `0, 1, 1, 2`; the two `1`-handles attached to the `0`-handle give a punctured torus
  and the `2`-handle caps it.
- A `0`-handle and a `1`-handle whose attaching `S⁰` meets the belt sphere of the `0`-handle in
  one point cancel: `D^d` with one `0`- and one `1`-handle glued this way is `D^d` again.
- In dimension `4` the Whitney disc need not embed, and the Whitney move fails in general:
  the hypothesis `d ≥ 5` is essential and the four-dimensional theory is FourManifolds'.
- `S² ⊔ S²` has no handle decomposition with a single `0`-handle: each component needs its own
  `0`-handle and, dually, its own `2`-handle, so connectedness is needed for both clauses of
  the single-handle statement.

*Needs:* Tau Ceti `TauCeti.IsMorse`, `TauCeti.IsManifoldNondegenerateCriticalPoint`; Layer 1.1,
Layer 1.3, Layer 1.5; DifferentialGeometry Layer 3 (gradient-like flows); Mathlib singular
homology.

### 1.7 PL manifolds through charts

A PL manifold is a charted space `M` with `HasGroupoid M (TauCeti.PLGroupoid I)` for the
Euclidean or half-space model; a PL map is a continuous map that is `TauCeti.IsPLOn` in every
pair of charts. Prove the compact comparison: for finite-dimensional real normed spaces
`E, F`, a map `f : E → F` and a compact subset `K ⊆ E`, `TauCeti.IsPLOn f K` implies
`TauCeti.IsPiecewiseAffineOn f K`. A proof chooses finitely many closed polyhedral
neighbourhoods subordinate to the local witnesses and intersects their cells with those
neighbourhoods; taking an uncut union of the local cells would not control their overlap
with the rest of `K` (Rourke–Sanderson, Chapter 2, local and finite polyhedral descriptions).
Prove that products, open subsets and boundaries of PL manifolds are PL, that a
homeomorphism between PL manifolds which is PL has a PL inverse, using finite polyhedral
neighbourhoods in charts and inversion on their image cells, and that gluing along a PL
homeomorphism of boundaries with PL collars produces a PL manifold, parallel to Layer 1.3.

- The forgetful map from PL to topological manifolds is `TauCeti.PLGroupoid_le_continuousGroupoid`.
- There is no inclusion of `contDiffGroupoid` into `TauCeti.PLGroupoid`: the smooth
  transition `x ↦ x + x³` is not PL on any open set. The relation between smooth and PL
  structures is the comparison of Layer 11.4, not a groupoid inclusion.

**Checks.**
- `EuclideanSpace ℝ (Fin n)` with its single chart is PL, and `TauCeti.doubleRight` is a PL
  homeomorphism of `ℝ` that is not affine, so the PL groupoid is strictly larger than the
  affine one.
- The boundary of the standard simplex, as the union of its facets with the affine charts,
  is a PL `(n−1)`-manifold; it is PL homeomorphic to `Sⁿ⁻¹` with the radial-projection
  charts.
- The map `x ↦ x³` is a homeomorphism of `ℝ` that is neither PL nor a diffeomorphism; it is a
  transition map of neither groupoid.
- On `[-1,1]`, the map `x ↦ |x|` has two affine pieces with slopes `−1,1`; at `−1,0,1`
  its values are `1,0,1`, excluding a single affine piece. The empty compact set needs
  zero cells, and the singleton `{0}` needs at most one.
- Compactness cannot be dropped from the finite-piece conclusion: the continuous linear
  interpolation of `f(n)=n²` on integer intervals is locally PL on `ℝ`, but its slopes
  `2n+1` take infinitely many values, so no finite affine cover represents it.

*Needs:* Tau Ceti `TauCeti.PLGroupoid`, `TauCeti.IsPLOn`, `TauCeti.IsPiecewiseAffineOn`,
Mathlib `HasGroupoid`, finite-dimensional compactness.

### 1.8 Compact smooth surfaces

Consume SurfaceTopology Layer 8 for the classification of compact surfaces and the standard
models, and PlanarTopology Layers 5 and 8 for Radó's theorem and the uniqueness of PL and
smooth structures in dimension two. Prove the smooth classification: every compact connected
smooth surface, with or without boundary, is diffeomorphic to exactly one of the standard
smooth models, the orientable surface of genus `g` with `b` boundary components (built from
`S²` by `g` connected sums with `T²` and `b` ball removals, Layers 1.2 and 1.4) or the
non-orientable surface with `k ≥ 1` crosscaps and `b` boundary components. Define the genus
of a compact connected orientable surface `F` as `(2 − χ(F) − b)/2`, where `χ(F)` is the Euler
characteristic and `b` the number of boundary components, prove this agrees with the number of
torus summands, and prove `rank H₁(F; ℚ) = 2g` when `F` is closed and
`rank H₁(F; ℚ) = 2g + b − 1` when `b ≥ 1`.

- Two diffeomorphisms of a compact surface that are isotopic as homeomorphisms are smoothly
  isotopic (PlanarTopology Layer 8); mapping class groups are SurfaceTopology Layer 9's.
- A compact connected orientable surface with nonempty boundary is a disc with `2g + b − 1`
  bands attached; its first homology is free of rank `2g + b − 1` and its intersection form on
  `H₁` is the standard one on the closed surface obtained by capping the boundary.

**Checks.**
- `χ(S²) = 2`, `χ(T²) = 0`, `χ(ℝP²) = 1`, `χ(annulus) = 0`; the annulus is the orientable
  surface with `g = 0`, `b = 2`, and is not the Möbius band, which has `k = 1`, `b = 1`.
- The torus has `χ = 0`, `b = 0` and genus `(2 − 0 − 0)/2 = 1`; the sphere has `χ = 2` and genus
  `0`; the genus-one surface with one boundary component has `χ = −1`, `b = 1`, genus
  `(2 + 1 − 1)/2 = 1` and `H₁ ≅ ℤ²`, of rank `2g + b − 1 = 2`; the disc has `χ = 1`, `b = 1`,
  genus `0` and `H₁ = 0`. A definition reading the genus off the first homology as
  `(rank H₁ − b + 1)/2` without separating the closed case would give `3/2` for the torus and
  `1/2` for the sphere, since `rank H₁ = 2g + b − 1` holds only for `b ≥ 1`.
- The open disc is not compact and is not an instance; the classification is false for
  non-compact surfaces (the plane and the open annulus are both non-compact of genus zero
  and not diffeomorphic).

*Needs:* SurfaceTopology Layer 8, Layer 9; PlanarTopology Layer 5, Layer 8; Layer 1.2,
Layer 1.4; Layer 11.3 (smooth triangulations); Mathlib singular homology.

### Examples

The sphere `Sⁿ` as the double of `Dⁿ`; `S³` as two solid tori glued by the factor swap;
`S¹ × S²` as two solid tori glued by the identity; the connected sum `T² # T²` of genus two;
the tube of the unit circle in `ℝ²`; the height-function handle decompositions of `S²` and `T²`;
the PL circle as the boundary of a triangle.

### Dependencies

Mathlib's manifold library; Tau Ceti's boundary manifold, collars, gluing of atlases, smooth
embeddings and normal spaces, Euclidean tubes and Morse predicates; DifferentialGeometry
(corners, flows, metrics); HopfRinow (exponential map, normal neighbourhoods);
SurfaceTopology and PlanarTopology (surfaces); Layer 3.3 for the ambient isotopy of ball
embeddings used in Layer 1.4, and Layer 11.3 for the smooth triangulations used in Layer 1.8.

## Layer 2: locally flat embeddings

Topological embeddings of manifolds can be wild (the Alexander horned sphere, Fox–Artin arcs),
so the theorems of this corner of topology quantify over *locally flat* embeddings. The
predicate exists at the pin: `TauCeti.IsLocallyFlat F F' f` says that `f : N → M` is an
embedding and every image point has a chart of `M` with values in `F × F'` carrying the image
to the slice `F × {0}`. This layer adds the structural theorems and states the annulus theorem.

### 2.1 Closure properties beyond the pinned API

Tau Ceti proves restriction to open subsets, invariance under homeomorphisms of either side,
composition with open embeddings and products of locally flat embeddings. Prove in addition:

- **Composition.** If `f : N → M` is locally flat with model `F × F'` and `g : M → P` is
  locally flat with model `(F × F') × G'`, then `g ∘ f` is locally flat with model
  `F × (F' × G')`, with no further hypothesis on `N`, `M` or `P`. The slice chart `ψ` of `P`
  for `g` at `g(f(x))`, shrunk so that its target is a product `V × B` with `0 ∈ B`, restricts
  along the slice `V × {0}` to a chart `θ` of `M` with source `g⁻¹(ψ⁻¹(V × B))`, because `g`
  is an embedding whose image `ψ` reads off as the vanishing of the second coordinate; if `φ`
  is any slice chart of `M` for `f` at `f(x)`, then `((φ ∘ θ⁻¹) × id_B) ∘ ψ`, on the points
  whose first coordinate lies in `θ(θ.source ∩ φ.source)`, is a slice chart of `P` for
  `g ∘ f`. The pinned `TauCeti.IsLocallyFlat.comp` carries a chart-compatibility hypothesis;
  this construction produces the compatible pair from arbitrary slice charts, so that
  hypothesis is derivable and the unconditional statement is the one proved here.
- **Codimension-one collaring.** A locally flat embedding of an `(n−1)`-manifold into an
  `n`-manifold is locally bicollared (`TauCeti.IsLocallyBicollared`), and a two-sided locally
  flat closed hypersurface is globally bicollared (Brown, *Locally flat imbeddings of
  topological manifolds*, Ann. of Math. 75 (1962); for spheres in `Sⁿ` this is the pinned
  `TauCeti.brownBicollaring`). *Needs:* Tau Ceti `TauCeti.IsLocallyFlat`, `TauCeti.IsBicollar`,
  `TauCeti.BrownBicollaring`.
- **PL embeddings.** The smooth case is consumed as it stands: smooth embeddings of
  boundaryless manifolds are locally flat by the pinned `TauCeti.SmoothEmbedding.isLocallyFlat`,
  and neat smooth embeddings of manifolds with boundary are locally flat with the half-space
  model (`LocallyFlat/Neat.lean`). State the PL analogue for PL embeddings that are *locally
  unknotted* (every point has a chart in which the pair is the standard affine pair) and prove
  that a PL embedding of codimension at most two need not be locally flat.

**Checks.**
- The axis `ℝ × {0} ⊂ ℝ²` is locally flat with the identity chart; the restriction to
  `(−1, 1)` and the rotation by `90°` are locally flat by the pinned lemmas.
- The composite of the axis `ℝ × {0} ⊂ ℝ²` with the inclusion `ℝ² × {0} ⊂ ℝ³` is the first
  coordinate axis of `ℝ³`, flattened by the identity chart; the composite of the `90°`
  rotation of the axis with the same inclusion is the second coordinate axis, and the
  composition construction returns the rotation times the identity of the third coordinate
  as its slice chart, which no compatibility between the two given charts was needed to
  produce.
- The cone on a polygonal trefoil knot is a PL embedded disc in the PL `4`-ball whose
  complement near the cone point has the trefoil group, not `ℤ`, so it is a PL embedding that
  is not locally flat: the PL hypothesis in the last item is necessary.
- The half-line `[0, ∞) ⊂ ℝ` is a locally flat embedding of a manifold with boundary only in
  the half-space model: at `0` the punctured image has one local component, whereas a
  boundaryless slice `ℝ × {0}` would have two.
- The Alexander horned sphere is a topological embedding of `S²` in `S³` that is not locally
  flat; its exterior is not simply connected, so it is not bicollared, and Brown's theorem
  does not apply to it.

### 2.2 The generalized Schoenflies theorem

Prove Brown's theorem: for `n ≥ 1` and a bicollared embedding of `Sⁿ⁻¹` in `Sⁿ`, each of the
two complementary domains has closure homeomorphic to `Dⁿ`, by a homeomorphism restricting to
the given parametrization on the boundary (Brown, *A proof of the generalized Schoenflies
theorem*, Bull. Amer. Math. Soc. 66 (1960), Theorems 4 and 5). The proof is Brown's: collapse
the two complementary pieces to points, prove the resulting cellular decompositions are
shrinkable, and identify each closure with a cell. Combine with `TauCeti.brownBicollaring` to
obtain the locally flat Schoenflies theorem: a locally flat `Sⁿ⁻¹ ⊂ Sⁿ` bounds a ball on each
side.

- The two balls meet along the sphere; the homeomorphisms may be chosen so that the union is
  the standard decomposition of `Sⁿ` into two hemispheres.
- For `n ≤ 2` the result is PlanarTopology Layer 7's Schoenflies theorem; the proof here is
  dimension-independent and does not consume it.

**Checks.**
- A round sphere of radius `r` in `Sⁿ` bounds the two round balls; the theorem returns them.
- A locally flat `S¹ ⊂ S²` bounds two discs (the classical Schoenflies theorem), and the
  theorem does not assert smoothness of the discs' parametrizations.
- The Alexander horned sphere bounds a ball on exactly one side; it is not bicollared, so the
  theorem's hypothesis correctly excludes it.

*Needs:* Tau Ceti `TauCeti.IsBicollar`, `TauCeti.BrownBicollaring`, `TauCeti.brownBicollaring`;
Mathlib `Homeomorph`.

### 2.3 The annulus theorem

The statement is the pinned `TauCeti.AnnulusConjecture n`: two locally flat embeddings `f, g` of
`Sⁿ` in `ℝⁿ⁺¹` with the image of `g` strictly inside the region bounded by `f` cobound an
annulus `TauCeti.CoboundAnnulus f g`, the closed region between them being the image of an
embedding of `Sⁿ × [0, 1]` with the two spheres as its ends. It is a theorem in every
dimension: for `n + 1 ≤ 3` by Schoenflies and the classification of surfaces together with
the triangulation theorem of Layer 11.2, for `n + 1 ≥ 5` by Kirby (*Stable homeomorphisms
and the annulus conjecture*, Ann. of Math. 89 (1969), 575–582, through the stable
homeomorphism theorem and the torus trick), and for `n + 1 = 4` by Quinn (*Ends of maps III*,
J. Differential Geom. 17 (1982)). `Suggested.lean` states `annulus_conjecture` for every `n`.
This roadmap owns the cases `n + 1 ≤ 3`; the torus trick and the surgery on homotopy tori it
needs are GeometricTopology, Part II, and the four-dimensional case is FourManifolds'.

- Equivalent form: every orientation-preserving homeomorphism of `ℝⁿ⁺¹` is stable, a finite
  composition of homeomorphisms each the identity on a nonempty open set (Brown–Gluck).
- The region between the spheres is a compact manifold with boundary `Sⁿ ⊔ Sⁿ`, by Layer 2.2
  applied to each sphere.

**Checks.**
- Two concentric round spheres cobound the round annulus; this is the pinned
  `TauCeti.coboundAnnulus_smul_coe_sphere`.
- The hypothesis that the inner sphere lies in the open region bounded by the outer one
  rules out the case of two spheres with a common point, where the region between them is
  not a manifold with boundary.
- Local flatness is needed: a horned sphere inside a round sphere does not cobound an
  annulus, because the complementary domain on the wild side is not simply connected.

*Needs:* Tau Ceti `TauCeti.AnnulusConjecture`, `TauCeti.CoboundAnnulus`, `TauCeti.IsLocallyFlat`;
Layer 2.2; Layer 11.2 (triangulations in dimension three) for `n + 1 = 3`.

### Examples

The axis in the plane and the horned sphere as the positive and negative controls for local
flatness; the round and locally flat Schoenflies theorems; the concentric annulus.

### Dependencies

Tau Ceti's locally flat embeddings, bicollars, Brown bicollaring and annulus statement;
Layer 11.2 for the three-dimensional case of the annulus theorem; PlanarTopology Layer 7 for
comparison in dimension two.

## Layer 3: diffeomorphism groups

The Smale conjecture and its four-dimensional failure are statements about the homotopy type
of `Diff(M)`. At the pin, `TauCeti.Diff I M n` is the group of `C^n` self-diffeomorphisms of
`M` under composition, `Diffeomorph.weakWhitneyTopology` is its weak Whitney topology (the
subspace topology from the compact-open `C^∞` topology on `ContMDiffMap`, used through the
scoped instance of `TauCeti.DiffeomorphWeakWhitney`), `Diffeomorph.ofSmoothFamily` turns a
smooth family of diffeomorphisms into a continuous map into `Diff(M)`, `TauCeti.RelativeDiff`
is the subgroup fixing a set pointwise, and `TauCeti.SmaleConjecture` and
`TauCeti.WatanabeTheorem` are the two propositions. Tau Ceti also proves, for compact Hausdorff
`M` with locally compact model space, that composition and inversion are continuous, so that
`Diff(M)` is a topological group, that evaluation is continuous and that fixing subgroups are
closed. This layer compares the weak topology with the Whitney and compact-open topologies,
proves isotopy extension, and states Cerf's theorem and the Smale conjecture.

### 3.1 The topological group `Diff(M)`

For a compact Hausdorff manifold `M` the topological-group structure of `TauCeti.Diff I M ∞`
is Tau Ceti's: `Diffeomorph.continuous_trans` and `Diffeomorph.continuousMul`
(`Geometry/Diffeomorphism/Composition.lean`), `Diffeomorph.continuous_symm` and
`Diffeomorph.isTopologicalGroup` (`Inversion.lean`), `Diffeomorph.continuousEval_weakWhitney`
(`Evaluation.lean`) and `Diffeomorph.isClosed_fixingSubgroup` (`FixingSubgroup/Topology.lean`),
each under `[CompactSpace M]`, `[T2Space M]` and a locally compact model space. Prove that the
weak topology agrees with the Whitney `C^∞` topology defined by uniform convergence of all
derivatives in charts (Hirsch, *Differential Topology*, Chapter 2 §1, where the two topologies
coincide for compact sources). Prove that the forgetful map `Diff(M) → C(M, M)` to the
compact-open topology is continuous and injective for every compact `M`, and that for a
nonempty `M` of positive dimension it is not a topological embedding: the `C^∞` topology is
then strictly finer than the compact-open one, by a perturbation of the identity supported in
one chart whose `C⁰` size tends to zero while a higher derivative stays bounded away from
zero. In dimension zero both topologies on the finite set `Diff(M)` are discrete and the
forgetful map is an embedding.

- The pinned topological-group theorems carry `[CompactSpace M]` because the weak and strong
  topologies agree only for compact sources, and it is the strong topology in which isotopy
  classes are open.
- The identity component `Diff₀(M)` is a normal subgroup; its quotient is the smooth mapping
  class group.
- A smooth isotopy, `TauCeti.Diffeotopy`, gives a path in `Diff(M)` from the identity
  (`TauCeti.Diffeotopy.toPath`); conversely a continuous path in `Diff(M)` need not be a
  smooth isotopy, and the smoothing of paths is a separate theorem (Layer 3.3).

**Checks.**
- For `M = S⁰`, `Diff(M)` is the discrete group of order two and `C(S⁰, S⁰)` the discrete
  space of four maps; the forgetful map is an injection of discrete spaces, hence an
  embedding, so the strictness assertion needs positive dimension.
- The rotation flow `t ↦ (z ↦ e^{it} z)` of `S¹` is a continuous path in `Diff(S¹)`; the family
  `t ↦ (z ↦ e^{i|t|} z)` is continuous but not a smooth isotopy, since its time derivative
  at `0` does not exist.
- The identity component of `Diff(S¹)` is the orientation-preserving subgroup and the
  component group is `ℤ/2`; a definition of the topology that made inversion discontinuous
  would not give a group whose component set is a group.
- The derivative at a fixed point of a flow with linear part `e^t` is unbounded, so `Diff(S³)`
  is not compact, whereas `O(4)` is: the Smale conjecture is a homotopy equivalence and not
  a homeomorphism.
- On `S¹` the maps `f_k(θ) = θ + k⁻² sin(kθ)`, `k ≥ 2`, are diffeomorphisms, their derivative
  `1 + k⁻¹ cos(kθ)` being positive, and converge to the identity in `C¹`, since
  `sup |f_k − id| = k⁻²` and `sup |f_k' − 1| = k⁻¹`, but not in `C²`, since `f_k'' = −sin(kθ)`
  has supremum `1` for every `k`. So `f_k → id` in `C(S¹, S¹)` and `f_k ↛ id` in `Diff(S¹)`:
  the forgetful map is not an embedding, and a definition giving `Diff(M)` the compact-open
  topology would be wrong.

*Needs:* Tau Ceti `TauCeti.Diff`, `Diffeomorph.weakWhitneyTopology`,
`Diffeomorph.isTopologicalGroup`, `TauCeti.Diffeotopy`; Mathlib `IsTopologicalGroup`,
compact-open topology.

### 3.2 Smooth families and the reference inclusion

The map `Diffeomorph.ofSmoothFamily` sends a smooth `F : P × M → M`, each `F(p, ·)` a
diffeomorphism, to a continuous `P → Diff(M)`. Prove that it is a bijection from the smooth
families onto the continuous maps `P → Diff(M)` whose adjoint `P × M → M` is smooth (the
adjoint of a continuous map is continuous, since evaluation `Diff(M) × M → M` is continuous
for the weak topology, `Diffeomorph.continuousEval_weakWhitney`; Hirsch, Chapter 2 §1), and
that not every continuous map `P → Diff(M)` is in its image: a continuous map `P → Diff(M)`
has a continuous adjoint which need not be smooth in `p`. No continuity of the inverse is claimed:
for compact `P` and `M` the compact-open topology on `C(P, Diff(M))` does not control the
`p`-derivatives, so it induces on the smooth families a topology strictly coarser than the
joint `C^∞` topology of the adjoints. The reference inclusion `O(n+1) → Diff(Sⁿ)` is
`TauCeti.orthogonalToDiffSphere n ∞`, continuous by `TauCeti.continuous_orthogonalToDiffSphere`
and injective by `TauCeti.orthogonalToDiffSphere_injective`; prove it is a closed embedding
(Mathlib `Continuous.isClosedEmbedding`: an injective continuous map from a compact space to a
Hausdorff space).

**Checks.**
- The family `F(t, z) = e^{it} z` on `S¹` is smooth and `ofSmoothFamily F` is the rotation
  path; the family `F(t, z) = e^{i|t|} z` is not smooth in `t`, so it is not in the image of
  `ofSmoothFamily`, although `t ↦ F(t, ·)` is continuous into `Diff(S¹)`.
- `O(2) → Diff(S¹)` sends the reflection `(x, y) ↦ (x, −y)` to complex conjugation, which is
  not in the identity component; the inclusion is injective on the two components.
- `O(n+1)` is compact and `Diff(Sⁿ)` is Hausdorff (`t2Space_weakWhitney`), so the inclusion is
  a closed embedding without further argument.
- On `P = M = S¹` the families `F_k(θ, z) = exp(i sin(kθ)/k) z` are rotations by angles of
  size at most `1/k`, so `θ ↦ F_k(θ, ·)` converges to the constant map at the identity in
  `C(S¹, Diff(S¹))`; but `∂_θ F_k(0, z) = i z` has norm `1` for every `k`, so the adjoints do
  not converge in `C¹(S¹ × S¹, S¹)`. A claim that the inverse of `ofSmoothFamily` is
  continuous for the joint `C^∞` topology fails on this sequence.

*Needs:* Tau Ceti `Diffeomorph.ofSmoothFamily`, `Diffeomorph.continuousEval_weakWhitney`,
`TauCeti.orthogonalToDiffSphere`, `TauCeti.orthogonalToDiffSphere_injective`,
`TauCeti.continuousOrthogonalToDiffSphere`; Mathlib `Matrix.orthogonalGroup`,
`Continuous.isClosedEmbedding`.

### 3.3 Isotopy extension

Let `N` be a compact manifold and `M` a boundaryless manifold. Give the space `Emb(N, M)` of
smooth embeddings the subspace topology from the weak `C^∞` topology on `ContMDiffMap`. Prove
the restriction fibration: for an embedding `e : N → M`, the map `Diff_c(M) → Emb(N, M)`,
`g ↦ g ∘ e`, from the compactly supported diffeomorphisms has continuous local sections near
`e` onto its orbit, the orbit is open, and the map is a locally trivial principal bundle with
fibre the diffeomorphisms fixing `e(N)` pointwise (Palais, *Local triviality of the
restriction map for embeddings*, Comment. Math. Helv. 34 (1960); Cerf, *Topologie de certains
espaces de plongements*, Bull. Soc. Math. France 89 (1961)). Deduce:

- **Isotopy extension, smooth form.** For a smooth family `F_t : N → M` of embeddings, `t` in
  an open interval containing `[0, 1]`, there is a `TauCeti.Diffeotopy` `Φ` of `M` with
  `Φ(t, F₀(x)) = F_t(x)`, compactly supported in a prescribed neighbourhood of the trace of the
  family (Hirsch, Chapter 8, Theorem 1.3). The proof extends the velocity field of the
  family to a compactly supported time-dependent vector field, using the tubular
  neighbourhood of Layer 1.5 and a partition of unity, and integrates it with the two-time
  flow of DifferentialGeometry Layer 3. The relative version keeps `Φ` equal to the identity
  on an open set where the family is constant.
- **Isotopy extension, continuous form.** For a continuous path in `Emb(N, M)` there is a
  continuous path in `Diff_c(M)` covering it, and more generally the homotopy lifting
  property for finite CW pairs.
- **The disc theorem.** Two orientation-preserving smooth embeddings of `Dⁿ` into a connected
  oriented `n`-manifold are ambient isotopic (Palais, *Extending diffeomorphisms*; Hirsch,
  Chapter 8, Theorem 3.1), by the local linearization of an embedding at its centre and the
  isotopy extension theorem. This is the input to the independence of connected sum in
  Layer 1.4.

**Checks.**
- The family `F_t(z) = e^{it} z` of embeddings `S¹ → ℝ²` extends to the rotation isotopy of
  `ℝ²`, compactly supported after cutting off outside a disc; the family `F_t(z) = (1 + t) z`
  extends to a radial isotopy supported in a larger disc.
- The family of embeddings of a point moving along a path in a connected manifold extends to
  an ambient isotopy; this is the homogeneity of connected manifolds.
- For `N = S¹` and the family shrinking a trefoil to a round circle through non-embeddings
  (a family that is an embedding for `t > 0` only), the theorem does not apply at `t = 0`: the
  hypothesis that every `F_t` is an embedding is needed, since the trefoil and the unknot are
  not ambient isotopic.
- The two embeddings `x ↦ x` and `x ↦ −x` of `D¹` into `ℝ` are not ambient isotopic: the
  orientation hypothesis of the disc theorem is needed.

*Needs:* Layer 1.5; Tau Ceti `TauCeti.Diffeotopy`, `TauCeti.SmoothEmbedding`, `TauCeti.Diff`;
DifferentialGeometry Layer 3 (two-time flows); Mathlib `ContMDiffMap`.

### 3.4 Cerf's theorem and the Smale conjecture

State Cerf's theorem: every orientation-preserving diffeomorphism of `S³` is isotopic to the
identity, `π₀(Diff⁺(S³)) = 0`, and hence `π₀(Diff(S³))` has two elements and `Γ₄ = 0`, every
orientation-preserving diffeomorphism of `S³` extends over `D⁴` (Cerf, *Sur les
difféomorphismes de la sphère de dimension trois*, Lecture Notes in Math. 53 (1968),
Théorème 1 and Corollaire 1). State Hatcher's theorem, the Smale conjecture: the inclusion
`O(4) → Diff(S³)` is a homotopy equivalence (Hatcher, *A proof of the Smale conjecture*, Ann.
of Math. 117 (1983), 553–607). The statement is the pinned `TauCeti.SmaleConjecture` and
`Suggested.lean` states it as `smale_conjecture`. The proofs of both theorems are
GeometricTopology, Part II's, by Hatcher's route from the restriction fibration of Layer 3.3:
for a marked disc `D³ ⊂ S³` it identifies `Diff(S³)` with `O(4)` times the space of
diffeomorphisms of `D³` fixing a boundary collar, and the latter is contractible by the
parametric straightening of spheres and discs.

- For `S¹` and `S²` the analogous statements are classical: `Diff(S¹) ≃ O(2)` by the
  straightening of a diffeomorphism to a rotation, and `Diff(S²) ≃ O(3)` (Smale, *Diffeomorphisms
  of the 2-sphere*, Proc. Amer. Math. Soc. 10 (1959)). Both are proved here and are inputs to
  Hatcher's argument.
- In dimension four the analogue fails: `TauCeti.WatanabeTheorem` says that `π₁(Diff(D⁴, ∂))`
  has an element of infinite order (Watanabe, *Some exotic nontrivial elements of the rational
  homotopy groups of Diff(S⁴)*, arXiv 1812.02448, Theorem 1.1, which gives for every `k ≥ 1` a
  surjection from `π_k(BDiff(D⁴, ∂)) ⊗ ℚ` onto the space of trivalent graphs of degree `k`,
  nonzero first for `k = 2`). It is stated as `watanabe_theorem`; its proof by
  configuration-space integrals is not owned here.

**Checks.**
- The antipodal map of `S³` is orientation preserving, so Cerf's theorem says it is isotopic to
  the identity; indeed `−I ∈ SO(4)` is connected to `I` in `SO(4)`.
- The reflection `(x₀, x₁, x₂, x₃) ↦ (x₀, x₁, x₂, −x₃)` has degree `−1` and is not isotopic to
  the identity: `π₀(Diff(S³))` has exactly two elements, matching `π₀(O(4))`.
- `π₁(O(4)) = ℤ/2` and Hatcher's theorem gives `π₁(Diff(S³)) = ℤ/2`; a homeomorphism
  `O(4) ≃ Diff(S³)` is excluded by compactness (Layer 3.1).
- The statement for `S⁴` is false by Watanabe's theorem, so no `n`-independent formulation is
  made.

*Needs:* Tau Ceti `TauCeti.SmaleConjecture`, `TauCeti.WatanabeTheorem`, `TauCeti.DiscDiff`,
`TauCeti.orthogonalToDiffSphere`; Layer 3.1, Layer 3.3; Mathlib `ContinuousMap.HomotopyEquiv`,
`HomotopyGroup`.

### Examples

`Diff(S¹) ≃ O(2)`; the rotation path and its non-smooth reparametrization; the extension of
the rotation of a circle in the plane to an ambient isotopy; the two components of
`Diff(S³)`.

### Dependencies

Tau Ceti's diffeomorphism group, weak Whitney topology, diffeotopies, fixing subgroups and
sphere action; Layer 1.5 (tubes) for isotopy extension; DifferentialGeometry Layer 3 (flows).

## Layer 4: knots and links

Knot theory is owned here. The geometric presentation is Tau Ceti's: a knot in `M` is a
`TauCeti.SmoothCircleEmbedding I M`, an `n`-component link is a `TauCeti.SmoothLinkEmbedding I M n`,
and equivalence is `TauCeti.SmoothLinkEmbedding.SmoothAmbientIsotopic` (through a
`TauCeti.Diffeotopy`) or its continuous form. The combinatorial presentations at the pin are
planar PD codes, based oriented Gauss codes and braid words with their closures. This layer
connects the presentations, builds the invariants and proves the comparison theorems; the
polynomial and matrix carriers already in Tau Ceti are consumed, and what is built is the
geometry that gives them meaning. Links in `S³` and `ℝ³` are related by stereographic
projection from a point off the link, which is an ambient-isotopy-preserving bijection of
link types and is used silently below.

### 4.1 Knot types, mirrors and connected sums

Define the knot type of `K` as its class under `SmoothAmbientIsotopic`; the unoriented type
additionally identifies `K` with `K.reverse`; the mirror of `K ⊂ S³` is its image under the
fixed reflection of `S³`. Define the connected sum `K # J` of two oriented knots in `S³` by
choosing disjoint balls each meeting one knot in an unknotted arc and joining the two arcs by
an untwisted band compatible with the orientations, and prove that the result is independent
of the choices up to ambient isotopy, commutative, associative, with the unknot as identity
(Lickorish, *An Introduction to Knot Theory*, Chapter 2). Define a knot to be prime when it is
not the unknot and every connected-sum decomposition has an unknotted summand.

- Two knots are ambient isotopic iff some diffeotopy of `S³` carries one onto the other as
  parametrized maps up to rotation of the parameter (`TauCeti.SmoothCircleEmbedding.rotate`);
  ambient isotopy of unoriented knots allows `reverse` as well.
- Ambient isotopy is a congruence for connected sum and commutes with mirror and reversal.
- The complement `S³ ∖ K` is a boundaryless `3`-manifold, and ambient isotopic knots have
  diffeomorphic complements
  (`TauCeti.SmoothLinkEmbedding.SmoothAmbientIsotopic.nonempty_complementHomeomorph`).

**Checks.**
- `TauCeti.unknot` and any of its rotations are ambient isotopic; `TauCeti.unknot.reverse` is
  ambient isotopic to `TauCeti.unknot`, so the unknot is invertible.
- The mirror of the unknot is the unknot; the mirror of the right-handed trefoil is the
  left-handed trefoil, and the two are not ambient isotopic (their Jones polynomials
  `t + t³ − t⁴` and `t⁻¹ + t⁻³ − t⁻⁴` differ, Layer 4.5).
- The connected sum of a knot with the unknot is the knot; the square knot `T # T̄` and the
  granny knot `T # T` of the right-handed trefoil `T` have the same Alexander polynomial
  `(t − 1 + t⁻¹)²` and different signatures `0` and `−4` (Layer 6.2).
- The empty link `TauCeti.SmoothLinkEmbedding.empty` is the unique `0`-component link; the
  `n`-component unlink is a set of `n` great circles in disjoint balls.

*Needs:* Tau Ceti `TauCeti.SmoothCircleEmbedding`, `TauCeti.SmoothLinkEmbedding`,
`TauCeti.SmoothLinkEmbedding.SmoothAmbientIsotopic`, `TauCeti.Diffeotopy`, `TauCeti.unknot`;
Layer 3.3 (isotopy extension for the independence of the band).

### 4.2 Diagrams, Reidemeister's theorem, Alexander's and Markov's theorems

A diagram is a planar PD code: a `TauCeti.PDCode n` satisfying `TauCeti.PDCode.IsPlanar` together
with a choice of outer face. Define the realization of a diagram as a link in `ℝ³` whose
projection to the plane is the given four-valent plane graph with the recorded crossings,
and prove that every smooth link in `ℝ³` has a regular projection after a small rotation, so
that every link type is realized by a diagram (Lickorish, Chapter 1). Prove Reidemeister's
theorem: two diagrams realize ambient isotopic links iff they are related by a finite
sequence of plane isotopies and Reidemeister moves of types I, II and III (Lickorish,
Chapter 1, pp. 3–4; Burde–Zieschang, *Knots*, Chapter 1). Prove Alexander's theorem, that
every oriented link is the closure `TauCeti.BraidWord.closure` of a braid, and Markov's
theorem, that two braids have ambient isotopic closures iff they are `TauCeti.MarkovEquiv`
(Lickorish, Proposition 16.10; Birman, *Braids, Links and Mapping Class Groups*, Chapter 2).

- The realization of a Gauss code `TauCeti.BasedOrientedGaussCode.toOrientedPDCode` is the
  realization of its PD code; a Gauss code whose PD code is not planar realizes no link.
- Reidemeister moves preserve the component count and the component orientations; the
  writhe of a diagram changes by `±1` under a type I move and is preserved by II and III.
- The closure of a braid on `k` strands has as many components as the orbits of its
  permutation, `TauCeti.MarkovBraid.componentCount`.

**Checks.**
- The crossing-free diagram of one circle and the one-crossing diagram related to it by a
  type I move both realize the unknot.
- The standard three-crossing diagram of the trefoil, as the closure of `σ₁³ ∈ B₂`, realizes a
  knot with Jones polynomial `t + t³ − t⁴`; hence it is not the unknot and the realization
  map is not constant.
- The Gauss word `1 2 1 2` (two crossings, each visited twice, interleaved) has a non-planar
  PD code, so it is not a diagram; the word `1 1 2 2` is planar and realizes the unknot.
- The closure of `σ₁ ∈ B₂` is the unknot and the closure of `σ₁² ∈ B₂` is the Hopf link, with
  `componentCount` equal to `1` and `2`.

*Needs:* Tau Ceti `TauCeti.PDCode`, `TauCeti.PDCode.IsPlanar`, `TauCeti.OrientedPDCode`,
`TauCeti.BasedOrientedGaussCode.toOrientedPDCode`, `TauCeti.BraidWord.closure`,
`TauCeti.MarkovBraid`, `TauCeti.MarkovEquiv`; Layer 1.5 (tubes, for general position);
Layer 3.3.

### 4.3 Seifert surfaces, genus and the Seifert form

Prove that every oriented link `L ⊂ S³` bounds a compact connected oriented surface, a Seifert
surface, by Seifert's algorithm on any diagram (Lickorish, Theorem 2.2). Define the genus
`g(L)` as the least genus of a Seifert surface (Layer 1.8 genus), and for a knot prove
`g(K) = 0` iff `K` is the unknot, `g(K # J) = g(K) + g(J)` (Lickorish, Theorem 2.4, by cutting a
minimal surface along a decomposing sphere), so that every knot is a finite connected sum of
prime knots. Define the Seifert form on `H₁(F; ℤ)` of a Seifert surface by
`θ(x, y) = lk(x, y⁺)` with the push-off convention of the *Conventions*, and its matrix with
respect to a basis. Prove `θ(x, y) − θ(y, x) = x · y`, so that for a knot `V − Vᵀ` is
unimodular, and prove that the Seifert matrices of two Seifert surfaces of ambient isotopic
links are `TauCeti.KnotTheory.IntegralSquareMatrix.SEquivalent` (Lickorish, Chapter 8, through
the tubing and band-move comparison of Seifert surfaces).

- A Seifert surface for a knot has genus `(rank H₁(F) )/2`; for a `μ`-component link,
  `rank H₁(F) = 2g + μ − 1`.
- The linking number `lk(x, y⁺)` is computed from any diagram as half the signed sum of
  mixed crossings and equals the intersection number of `y⁺` with a surface bounded by `x`.
- The Euler characteristic of the surface produced by Seifert's algorithm on a diagram with
  `n` crossings and `s` Seifert circles is `s − n`, so a knot diagram gives genus `(n − s + 1)/2`,
  and hence `2 g(K) ≤ c(K) − 1` for a nontrivial knot.

**Checks.**
- Seifert's algorithm on the standard trefoil diagram gives `s = 2`, `n = 3`, genus `1`, and
  the Seifert matrix `[[−1, 1], [0, −1]]` in a suitable basis; `V − Vᵀ = [[0, 1], [−1, 0]]`
  has determinant `1`.
- The figure-eight has Seifert matrix `[[1, 1], [0, −1]]` and genus `1`; the unknot has the
  empty matrix and genus `0`.
- The square knot has genus `2 = 1 + 1`; a definition of genus without connectedness of the
  surface would give the wrong value for split links, whose minimal surfaces are
  disconnected.
- Push-off convention: for the positive Hopf link, the two components have linking number
  `+1`, and the Seifert form of the annulus they bound is the `1 × 1` matrix `[−1]`, unchanged
  by reversing the core since `θ(−x, −x) = θ(x, x)`; the negative Hopf link gives `[1]`. The
  sign is fixed by the trefoil matrix above, whose diagonal entries `−1` are the forms of the
  two positive Hopf bands inside its Seifert surface: a sign convention giving `[1]` for the
  positive Hopf link would put `+1` on that diagonal, which is the matrix of the left-handed
  trefoil. Changing the side of the push-off transposes the matrix and leaves the diagonal,
  and this entry, unchanged.

*Needs:* Layer 1.8 (surfaces and genus), Layer 1.5; Tau Ceti
`TauCeti.KnotTheory.IntegralSquareMatrix.SEquivalent`; Mathlib singular homology.

### 4.4 The Alexander module and the Alexander polynomial

Define the infinite cyclic cover `X∞` of the exterior `X = S³ ∖ ν(K)` of a knot (Layer 5.1) as
the cover associated with the abelianization `π₁(X) → ℤ` sending a positive meridian to `1`,
and the Alexander module as `H₁(X∞; ℤ)` with its `ℤ[t, t⁻¹]`-module structure. Prove that a
Seifert matrix `V` presents it by `t V − Vᵀ` (Lickorish, Theorem 6.5), so that
`TauCeti.KnotTheory.alexanderMatrix V` is a presentation matrix and `TauCeti.KnotTheory.alexander V`,
up to a unit, is the order of the module; define the Alexander polynomial `Δ_K` as this order
normalized by `Δ_K(t) = Δ_K(t⁻¹)` and `Δ_K(1) = 1`. Prove the Wirtinger presentation of the knot
group from a diagram, the Fox calculus computation of the Alexander matrix from it, and the
agreement of the Seifert, Fox and Burau routes (`TauCeti.MarkovBraid.burauAlexander`) up to
units. Prove the Conway skein relation `Δ(L₊) − Δ(L₋) = (t¹ᐟ² − t⁻¹ᐟ²) Δ(L₀)` for the
normalized polynomial of links (Lickorish, Theorem 8.6) and the characterization of the
determinant `|Δ_K(−1)|` as the order of `H₁` of the double branched cover.

- `Δ_K(1) = ±1` for every knot, so the normalization is possible; `Δ_{K # J} = Δ_K Δ_J` and
  `Δ_{K̄}(t) = Δ_K(t)` for the mirror.
- For a knot of genus `g`, `Δ_K` has degree at most `g` in `t` and `t⁻¹`, so `span Δ_K ≤ 2 g(K)`.
- The Alexander module is trivial iff `Δ_K = 1` iff the commutator subgroup of the knot group
  is perfect (`TauCeti.SmoothCircleEmbedding.HasPerfectCommutatorSubgroup`), which is the
  hypothesis of Freedman's theorem (Layer 6.4).

**Checks.**
- Right-handed trefoil: `Δ = t − 1 + t⁻¹`, determinant `3`; figure-eight: `Δ = −t + 3 − t⁻¹`,
  determinant `5`; `T(2, 5)`: `Δ = t² − t + 1 − t⁻¹ + t⁻²`, determinant `5`; unknot: `Δ = 1`.
- The two-strand torus link `T(2, n)` has unnormalized Alexander polynomial
  `(1 − (−t)ⁿ)/(1 + t) = Σ_{j<n} (−t)^j`, which at `t = −1` equals `n` and for `n = 3` is
  `1 − t + t²`, the trefoil's; for `n = 0` it is `0`, as the two-component unlink has infinite
  cyclic Alexander module and zero order.
- The untwisted Whitehead double of the trefoil has `Δ = 1` and is not the unknot (its genus
  is `1` and it is not slice by Layer 6), so `Δ = 1` does not detect the unknot: the
  normalization `Δ(1) = 1` excludes `−Δ`, nothing more.
- `Δ(−1)` is odd for every knot, since `V − Vᵀ` is unimodular and `V + Vᵀ ≡ V − Vᵀ (mod 2)`.

*Needs:* Layer 4.3, Layer 5.1 (the exterior); Tau Ceti `TauCeti.KnotTheory.alexanderMatrix`,
`TauCeti.KnotTheory.alexander`, `TauCeti.MarkovBraid.burauAlexander`,
`TauCeti.SmoothCircleEmbedding.KnotGroup`, `HasPerfectCommutatorSubgroup`; Mathlib
`IsCoveringMap`, `FundamentalGroup`, `LaurentPolynomial`, `PresentedGroup`.

### 4.5 The Kauffman bracket and the Jones polynomial

The state sum `TauCeti.PDCode.kauffmanBracket` and the normalized
`TauCeti.OrientedPDCode.jonesPolynomial`, with their invariance under the combinatorial
Reidemeister moves, are at the pin. Prove that the Jones polynomial of a diagram depends only
on the link type of its realization (through Layer 4.2), so that `V_L ∈ ℤ[t¹ᐟ², t⁻¹ᐟ²]` is an
invariant of oriented links, and prove the skein relation
`t⁻¹ V(L₊) − t V(L₋) = (t¹ᐟ² − t⁻¹ᐟ²) V(L₀)` (Lickorish, Theorem 3.5, Proposition 3.7). Prove the
trace formula: `V` of the closure of a braid on `k` strands is the Jimbo–Ocneanu trace of its
image in the Temperley–Lieb algebra (`TauCeti.KnotTheory.jimboWeightedTrace` and the Markov trace of
`TauCeti/Algebra/TemperleyLieb/MarkovTrace.lean`), normalized by the strand count and the writhe (Lickorish,
Chapter 16).

- `V_{L̄}(t) = V_L(t⁻¹)` for the mirror (`TauCeti.OrientedPDCode.jonesPolynomial_mirror`);
  reversing all orientations leaves `V` unchanged, and reversing one component of a link
  multiplies by `t^{−3 lk}` where `lk` is its linking number with the rest.
- `V_L(1) = (−2)^{μ − 1}` for a `μ`-component link; `V_K(e^{2πi/3}) = 1` and `V_K(i) = (−1)^{Arf(K)}`
  for a knot (Layer 4.7).
- `V_{K # J} = V_K V_J`, and `V` of a split union is `(−t¹ᐟ² − t⁻¹ᐟ²)` times the product.

**Checks.**
- Right-handed trefoil `t + t³ − t⁴`, left-handed trefoil `t⁻¹ + t⁻³ − t⁻⁴`; figure-eight
  `t² − t + 1 − t⁻¹ + t⁻²`, equal to its mirror, consistent with the figure-eight being
  amphichiral.
- Unknot `1`; two-component unlink `−t¹ᐟ² − t⁻¹ᐟ²`; positive Hopf link `−t¹ᐟ² − t⁵ᐟ²`.
- At `t = 1` the trefoil gives `1 = (−2)⁰` and the Hopf link `−2 = (−2)¹`.
- The torus knot `T(3, 4)` has `V = t³ + t⁵ − t⁸` of span `5` while its crossing number is
  `8`: the span of `V` equals the crossing number for alternating knots only (Layer 4.8).

*Needs:* Tau Ceti `TauCeti.PDCode.kauffmanBracket`, `TauCeti.OrientedPDCode.jonesPolynomial`,
`TauCeti.KnotTheory.jimboWeightedTrace`; Layer 4.2.

### 4.6 The HOMFLY and Kauffman polynomials

Prove existence and uniqueness of the HOMFLY polynomial `P_L` in the degree-zero subring of
`ℤ[x^±, y^±, z^±]` with `x P(L₊) + y P(L₋) + z P(L₀) = 0` and `P(unknot) = 1`, by induction on
crossing number and a descending resolution of based diagrams (Lickorish, Chapter 15; Freyd,
Yetter, Hoste, Lickorish, Millett, Ocneanu, Bull. Amer. Math. Soc. 12 (1985)), and the
specializations `Δ_L(t) = P_L(1, −1, t⁻¹ᐟ² − t¹ᐟ²)` and `V_L(t) = P_L(t⁻¹, −t, t⁻¹ᐟ² − t¹ᐟ²)`.
In the two-variable convention `a P(L₊) − a⁻¹ P(L₋) = z P(L₀)`, set `a = v⁻¹` and use
`ℤ[a,a⁻¹,z,z⁻¹]`, represented by an iterated `LaurentPolynomial`, as coefficient ring.
Construct the HOMFLY coefficient substitution by applying `LaurentPolynomial.eval₂` twice:
for every field `K`, indeterminate `q` and integer `N ≥ 0`, its source is this iterated
Laurent ring and its target is `K(q)`, with unit images `q^N` and
`q − q⁻¹`, whose inverses are `q^(−N)` and `q/(q²−1)`; `q` and `q²−1` are nonzero
polynomials over every field. This is the coefficient substitution for the `sl_N`
comparison, with `N ≥ 1` in the normalized trace formula. Prove the geometric trace
comparison after this substitution, consuming the algebraic Ocneanu braid invariant and
its weighted-Jimbo comparison from TypeAHeckeAlgebras H1, H2, with their strand and writhe
normalizations (Lickorish, Chapter 16, Proposition 16.10): for a braid `β` on `b ≥ 1`
strands with closure `L`, the substituted value is
`q^(−N w(β)) · tr_N(β) / [N]_q`, where `w` is writhe, `tr_N` is the weighted Jimbo trace
and `[N]_q = Σ_{i=0}^{N−1} q^(N−1−2i)`. For `N ≥ 1` these distinct Laurent monomials have
coefficient `1`, so `[N]_q ≠ 0` over every field.

- The substitution sends `a,a⁻¹,z,z⁻¹` respectively to `q^N,q^(−N),q−q⁻¹,q/(q²−1)`.
- A ring homomorphism from this integer Laurent ring to `K(q)` with these generator images
  equals the substitution; the inverse-generator values follow from the unit equations.
- For a field homomorphism `K → L`, extending it to rational functions commutes with the
  substitution, with the same exponent `N` and indeterminate `q`.

Prove existence and uniqueness of Kauffman's two-variable polynomial `F_L(a, x)` from the
regular-isotopy invariant `Λ` with `Λ(L₊) + Λ(L₋) = x(Λ(L₀) + Λ(L∞))` and the curl factors
`a^{±1}` (Lickorish, Chapter 15).

- `P_{L̄}(x, y, z) = P_L(y, x, z)`; `P_{L # J} = P_L P_J`; `P` of a split union is `−((x + y)/z)`
  times the product, and `P` of the `n`-component unlink is `(−(x + y)/z)^{n − 1}`.
- In the variables `v⁻¹ P(L₊) − v P(L₋) = z P(L₀)`, the right-handed trefoil has
  `P = 2v² − v⁴ + v² z²` and the positive Hopf link `P = v z + (v − v³)/z`.
- Mutation preserves `P` and `F`: the Kinoshita–Terasaka and Conway knots share both, and
  are told apart by their genera (Layer 6.3).

**Checks.**
- The skein computation for the trefoil: `L₊ = T`, `L₋ = unknot`, `L₀ = positive Hopf link`,
  giving `P(T) = v² + v z P(H)` and, with `P(H) = v z + (v − v³)/z`, the value `2v² − v⁴ + v² z²`.
- Specializing `P(T)` by `v = 1`, `z = t¹ᐟ² − t⁻¹ᐟ²` gives `1 + (t − 2 + t⁻¹) = t − 1 + t⁻¹`, the
  Conway-normalized Alexander polynomial.
- The positive Hopf link in the `(x, y, z)` form: `P_H(1, −1, w) = −w`, since
  `P_H = v z' + (v − v³)/z'` in the variables with `x = v⁻¹`, `y = −v`, `z = −z'`; the
  specialization `w = t⁻¹ᐟ² − t¹ᐟ²` gives `Δ_H = t¹ᐟ² − t⁻¹ᐟ²`, which is what the Conway
  relation of Layer 4.4 gives with `L₋` the two-component unlink (`Δ = 0`) and `L₀` the
  unknot. The opposite sign of `w` would give `−Δ_H`, an error the trefoil Check cannot see,
  since `∇` of a knot is even in `z`.
- `P(unknot) = 1` and `P` of the two-component unlink is `(v⁻¹ − v)/z`, which is not a Laurent
  polynomial in `v` alone: the degree-zero subring is the right coefficient ring.
- A split link has `P` divisible by `(v⁻¹ − v)/z`, so a two-component link with `P = 1` does
  not exist; the component-detection statement `μ(L) ≥ 2 ⟹ P_L ≠ 1` follows from
  `V_L(1) = (−2)^{μ−1} ≠ 1`.

**Coefficient-substitution Checks.**
- At `N=2`, evaluating the generator images at `q=2` over `ℚ` sends `a,z,a⁻¹,z⁻¹` to `4,3/2,1/4,2/3`;
  the unit products are `1`, and the images of `a+z` and `az` are `11/2` and `6`.
- At `N=0` the algebraic substitution sends `a` to `1`; at `N=1` it sends `a` to `q`.
  The zero-colour weighted trace has zero quantum dimension and cannot be normalized by
  division by that dimension, so it is excluded from the normalized comparison.
- Evaluation at `q=1` or `q=−1` would send the unit `z` to `0` in a nonzero field and is
  not a homomorphism from this Laurent ring. In characteristic two with indeterminate `q`,
  however, `q²−1=(q−1)²` is still nonzero, so the rational-function substitution exists.
- For `N=2`, `q=2`, the quantum dimension is `5/2`: the weighted trace of the identity
  on two strands is `25/4` and that of one positive crossing is `10`. The normalized
  one-crossing closure has value `4⁻¹·10/(5/2)=1`, as does the unknot.

*Needs:* Layer 4.2, Layer 4.4, Layer 4.5; TypeAHeckeAlgebras H1, H2; Mathlib
`LaurentPolynomial.eval₂`, `LaurentPolynomial.eval₂_T`, `LaurentPolynomial.eval₂_C`, `RatFunc`.

### 4.7 Colourings, the determinant and the Arf invariant

Define, for a diagram and a quandle `Q` (Mathlib's `Quandle`), the set of `Q`-colourings of
its arcs, and prove that Reidemeister moves induce bijections of colouring sets, so the
number of colourings is a link invariant (Lickorish, Chapter 9; Burde–Zieschang,
Chapter 1). For the dihedral quandle `Quandle.Dihedral n` the colourings are Fox
`n`-colourings: elements of `ZMod n` on arcs with `2·(over) = (under₁) + (under₂)` at each
crossing. Prove that the colourings form a `ZMod n`-module containing the constants. For a
knot and `n ≥ 1`, let `d₁, …, d_k` be the invariant factors of a reduced colouring matrix over
`ℤ` (delete one row and one column of the crossing matrix), whose product is the determinant
`det K = |Δ_K(−1)|`; prove that the number of `n`-colourings is `n · ∏ gcd(n, d_i)`, so that
`K` has a non-constant `n`-colouring iff `gcd(n, det K) > 1`. For a prime `p` the count is
`p · p^r` with `r` the nullity over `𝔽_p` of the reduced matrix, and `K` is non-trivially
`p`-colourable iff `p` divides `det K`. For `n = 1` there is exactly one colouring, and for
`n = 0`, where `ZMod 0 = ℤ`, a knot has only the constant colourings, since `det K` is odd and
in particular nonzero. Define the Arf invariant of a knot as the Arf invariant of the quadratic form
`q(x) = θ(x, x) mod 2` on `H₁(F; 𝔽₂)`, which is nonsingular with associated bilinear form the
intersection form, and prove it is independent of the Seifert surface, additive under
connected sum, and equal to `0` iff `Δ_K(−1) ≡ ±1 (mod 8)` (Lickorish, Chapter 10).

- Colourings of a split union are products; colourings of a connected sum are the fibre
  product over a common arc, so the reduced nullities add.
- For a link, the determinant may be `0`, in which case the colouring module is infinite over
  `ℤ` and every prime colours it.
- The Arf invariant is a concordance invariant and vanishes for slice knots (Layer 6).

**Checks.**
- The trefoil has `9 = 3 · 3¹` three-colourings, of which `6` are non-constant; the figure-eight
  is five-colourable with `25` colourings; the unknot has only the `n` constant colourings for
  every `n`.
- The trefoil's reduced colouring matrix has invariant factors `1, 3`, so it has
  `6 · gcd(6, 1) · gcd(6, 3) = 18` six-colourings, among them `(0, 2, 4)`, although `6` does not
  divide `det = 3`: a statement "non-trivially `n`-colourable iff `n | det K`" for composite
  `n` fails here, and `18` is not of the form `6 · 6^r`. Modulo `1` the count is `1`.
- The knot `5₂` has determinant `7` and `49` seven-colourings; it is not three- or
  five-colourable.
- `Arf(unknot) = 0`, `Arf(trefoil) = 1` since `3 ≡ 3 (mod 8)`, `Arf(figure-eight) = 1` since
  `5 ≡ −3 (mod 8)`, and `Arf(6₁) = 0` since its determinant is `9 ≡ 1 (mod 8)`.
- The two-component unlink has determinant `0` and infinitely many integral colourings, as
  the two arcs may be coloured independently.

*Needs:* Mathlib `Quandle`, `Quandle.Dihedral`, `ZMod`; Layer 4.2, Layer 4.3, Layer 4.4.

### 4.8 Crossing, unknotting, bridge and braid numbers

Define the crossing number `c(L)` as the least number of crossings of a diagram of `L`, the
unknotting number `u(K)` as the least number of crossing changes in some diagram turning `K`
into the unknot, the bridge number `br(K)` as the least number of local maxima of a height
function on a representative of `K`, and the braid index as the least number of strands of a
braid whose closure is `L`. Prove the basic theorems: `c(K) = 0` iff `K` is the unknot;
`br(K) = 1` iff `K` is the unknot and `br(K # J) = br(K) + br(J) − 1` (Schubert, *Über eine
numerische Knoteninvariante*, Math. Z. 61 (1954)); `u(K # J) ≤ u(K) + u(J)`; braid index is
subadditive under connected sum. Prove the Kauffman–Murasugi–Thistlethwaite theorem: a
reduced alternating diagram has the least number of crossings of any diagram of its link,
and that an alternating link `L` which is the split union of `s ≥ 1` non-split links has
`span V_L = c(L) + s − 1`, in particular `span V_L = c(L)` when `L` is non-split; while
`span V_L < c(D)` for a connected, prime, non-alternating diagram `D` (Lickorish, Chapter 5),
by the adequacy of the extreme states of the bracket. The split correction comes from
`V(L ⊔ L') = (−t¹ᐟ² − t⁻¹ᐟ²) V(L) V(L')`, which adds `1` to the span, and from the bound
`span V_D ≤ c(D) + k − 1` for a diagram with `k ≤ s` connected pieces. Prove the converse
through the Turaev surface: `span V_K + g_T(D) ≤ c(D)` for a connected diagram, where the
Turaev genus `g_T(D)` is `(2 + n − s_A − s_B)/2` (Turaev, *A simple proof of the Murasugi and
Kauffman theorems*, L'Enseignement Math. 33 (1987); Armond–Lowrance, *Turaev genus and
alternating decompositions*, Algebr. Geom. Topol. 17 (2017), §2), and `g_T(D) = 0` iff `D` is
a diagram connected sum of alternating diagrams: the state circles of a diagram connected sum
satisfy `s_A(D₁ # D₂) = s_A(D₁) + s_A(D₂) − 1` and likewise for `s_B`, whichever regions the
band joins. Hence a knot is alternating iff `span V_K = c(K)`. Prove the Morton–Franks–Williams inequality: for the closure of a braid on
`k` strands with writhe `w`, the `v`-exponents of `P` lie in `[w − k + 1, w + k − 1]`, so
`(span_v P)/2 + 1` is a lower bound for the braid index (Morton, Math. Proc. Cambridge Philos.
Soc. 99 (1986); Franks–Williams, Trans. Amer. Math. Soc. 303 (1987)).

- `2 g(K) ≤ c(K) − 1` and `span Δ_K ≤ 2 g(K)` for nontrivial knots (Layer 4.3, 4.4).
- The signature bound `|σ(K)| ≤ 2 u(K)` is Layer 6.2.
- Every two-bridge knot is prime, and a knot of bridge number two is a rational knot
  (Layer 4.10).

**Checks.**
- Trefoil: `c = 3`, `u = 1`, `br = 2`, braid index `2`; figure-eight: `c = 4`, `u = 1`, `br = 2`,
  braid index `3`; unknot: `c = 0`, `u = 0`, `br = 1`, braid index `1`.
- `T(3, 4)` has `span V = 5 < 8 = c`, so it is not alternating, and the Morton–Franks–Williams
  bound gives braid index `3`, attained by `(σ₁σ₂)⁴`.
- `br(T # T) = 3 = 2 + 2 − 1` for the granny knot; `u(T # T) = 2`, the two obvious crossing
  changes giving `≤ 2` and the signature bound `|−4| ≤ 2u` of Layer 6.2 giving `≥ 2`.
- The one-crossing diagram of the unknot is not reduced, and the theorem that reduced
  alternating diagrams are minimal does not apply to it: its single crossing is nugatory.
- The two-component unlink is alternating with `c = 0` and `V = −t¹ᐟ² − t⁻¹ᐟ²` of span `1`,
  and the three-component unlink has `V = (t¹ᐟ² + t⁻¹ᐟ²)²` of span `2`: `1 = 0 + 2 − 1` and
  `2 = 0 + 3 − 1`, so the equality `span V_L = c(L)` without the non-split hypothesis fails.
- Joining two standard trefoil diagrams by a band so that the two pieces have opposite
  checkerboard types gives a connected, reduced, non-alternating six-crossing diagram of an
  alternating knot with `span V = 6`: the strict inequality needs the prime hypothesis on the
  diagram, and this diagram has Turaev genus `0`.

*Needs:* Layer 4.2 through 4.6.

### 4.9 Prime decomposition of knots and links

Prove Schubert's theorem: every nontrivial knot is a connected sum of finitely many prime
knots, uniquely up to order and ambient isotopy of the factors (Lickorish, Theorem 2.12,
through genus additivity for existence and the sphere-system argument for uniqueness).
Define a link to be split when a locally flat sphere separates its components into two
nonempty sublinks, and prove Hashizume's theorem: every non-split link is a connected sum
along chosen components of finitely many prime non-split links, uniquely (Hashizume, Osaka
Math. J. 10 (1958); Melikhov, *Local knots and the prime factorization of links*, arXiv
2511.19579, §§2–3, for a short proof).

- The set of knot types with connected sum is a commutative monoid whose only unit is the
  unknot, free on the prime knots.
- A knot of genus one is prime; a knot with `u(K) = 1` is prime (Scharlemann, *Unknotting
  number one knots are prime*, Invent. Math. 82 (1985), 37–55; Layer 5.4 states the
  surgery-theoretic route).

**Checks.**
- The trefoil and the figure-eight are prime (genus one); the square and granny knots are
  composite with exactly two prime factors each.
- The Hopf link is prime and non-split; the two-component unlink is split; the connected sum
  of two Hopf links along one component is a three-component chain that is non-split and
  not prime.
- The unknot is the empty connected sum, and uniqueness is stated for nontrivial knots so
  that `K = K # unknot` is not a second factorization.

*Needs:* Layer 4.1, Layer 4.3; Layer 2.2 (Schoenflies for the decomposing spheres).

### 4.10 Rational tangles and two-bridge knots

Define a rational tangle in a ball with four marked boundary points by the integer twist
operations, its fraction in `ℚ ∪ {∞}` through the continued fraction of the twists, and its
numerator and denominator closures. Prove Conway's theorem that two rational tangles are
isotopic rel boundary iff their fractions agree (Kauffman–Lambropoulou, *On the classification
of rational knots*, L'Enseignement Math. 49 (2003), Theorem 1) and Schubert's classification:
the numerator closures of `p/q` and `p'/q'`, `p, p' > 0`, are ambient isotopic as unoriented
links iff `p = p'` and `q' ≡ q^{±1} (mod p)`, and, for fractions written with `q, q'` odd (the
numerator closures are then orientation-compatible; for odd `p` an even `q` is replaced by
`q + p`, which does not change the unoriented knot), as oriented knots iff `p = p'` and
`q' ≡ q^{±1} (mod 2p)` (Kauffman–Lambropoulou, Theorems 2 and 3). The parity normalisation is
part of the statement: `3/1` and `3/4` are the same unoriented knot, the trefoil, which is
invertible, yet `4 ≢ 1^{±1} (mod 6)`. Prove that the rational
knots are exactly the knots of bridge number at most two, that `p` is the determinant of the
rational knot `p/q`, and that the mirror of `p/q` is `p/(−q)`.

**Checks.**
- `3/1` is the trefoil and `5/2` the figure-eight; `2/1` is the Hopf link and `1/1` the unknot.
- `5/2 ≅ 5/3` because `2 · 3 = 6 ≡ 1 (mod 5)`, and `5/3 = 5/(−2)` is the mirror of `5/2`: the
  figure-eight is amphichiral, as its Jones polynomial says.
- `7/2 ≇ 7/3` as `3 ≢ 2^{±1} (mod 7)`, while `7/3 ≅ 7/5 = 7/(−2)` because `3 · 5 ≡ 1 (mod 7)`:
  the knot `5₂ = 7/2` is chiral.
- Determinants: `3`, `5`, `7` for `3/1`, `5/2`, `7/2`, matching `|Δ(−1)|` in Layer 4.4.
- Oriented classification: `3/1` and `3/7` are isotopic as oriented knots, since `7 ≡ 1 (mod 6)`;
  `3/1` and `3/5` are not, since `5 ≢ 1` and `5 · 1 ≢ 1 (mod 6)`, and indeed `5 ≡ −1 (mod 3)`
  makes `3/5` the mirror trefoil, distinct already as an unoriented knot. The even-denominator
  fraction `3/4` is normalised to `3/7` before the oriented test, and then agrees with `3/1`.

*Needs:* Layer 4.2, Layer 4.4, Layer 4.8.

### 4.11 Torus knots, satellites and Whitehead doubles

Define the torus knot `T(p, q)` for coprime `p, q` as the image of `u ↦ 2⁻¹ᐟ² (u^p, u^q)` in the
unit sphere of `ℂ²`, a smooth circle embedding by the immersion criterion
`TauCeti.isImmersion_iff_forall_isImmersionAt` and compactness. Prove `T(p, q) ≅ T(q, p)` by the
ambient isotopy `U_t = P₊ + e^{πit} P₋` of `S³` through unitary maps, `T(p, −q)` is the mirror of
`T(p, q)`, `T(−p, −q)` is the reverse of `T(p, q)`, and `T(p, q)` is the unknot when `|p| ≤ 1` or
`|q| ≤ 1` by the explicit isotopy `u ↦ (√(1 − s²) u, s u^q)`. Prove that `T(p, q)` for
`p, q ≥ 2` is the closure of `(σ₁ ⋯ σ_{p−1})^q`, has genus `(p − 1)(q − 1)/2`, Alexander polynomial
`(t^{pq} − 1)(t − 1) / ((t^p − 1)(t^q − 1))` up to normalization; its chirality is
Layer 6.2's theorem, through the signature. Define a satellite with pattern `P` in the solid torus and companion `J`, and
prove Schubert's inequality `br(P(J)) ≥ w · br(J)`, `w` the geometric winding number of `P`,
for a nontrivial companion (Schubert 1954). Define the Whitehead doubles `W_±(J)` with the
clasp sign and twisting, and prove that the untwisted double of a nontrivial knot has
`Δ = 1`, genus `1` and `u ≤ 1`.

**Checks.**
- `T(2, 3)` is the right-handed trefoil: its closure is `σ₁³`, its genus `1` and its Alexander
  polynomial `t − 1 + t⁻¹`.
- `T(2, 5)` has `Δ = t² − t + 1 − t⁻¹ + t⁻²` and genus `2`; `T(3, 4)` has genus `3` and
  `V = t³ + t⁵ − t⁸`.
- `T(1, q)` and `T(p, 1)` are unknots for every `q, p`; `T(0, 1)` is the great circle `(0, u)`.
- The untwisted Whitehead double of the trefoil has `Δ = 1` and is not the unknot: its
  companion torus is incompressible in the complement, so the complement is not a solid
  torus.

*Needs:* Tau Ceti `TauCeti.isImmersion_iff_forall_isImmersionAt`, `TauCeti.unknot`,
`TauCeti.SmoothCircleEmbedding.greatCircle`; Layer 3.3 (smooth-family isotopy extension);
Layer 4.3, Layer 4.4, Layer 4.8.

### 4.12 Braid groups, Garside structure and Brunnian links

Consume `TauCeti.BraidGroup n` with its Artin generators `TauCeti.BraidGroup.sigma`. Define the
positive braid monoid and prove it embeds in `B_n`; define the Garside element `Δ_n` (the half
twist) and prove `Δ_n²` is central and generates the centre for `n ≥ 3`. Prove the Garside
normal form: every braid is uniquely `Δ_n^k s₁ ⋯ s_r` with `k ∈ ℤ` and `s₁, …, s_r` a
left-weighted sequence of positive permutation braids (Garside, Quart. J. Math. 20 (1969);
Epstein et al., *Word Processing in Groups*, Chapter 9). Deduce that two braid words represent
the same braid iff they have the same normal form, and prove that the super summit set of a
conjugacy class is finite, nonempty and connected under conjugation by simple elements, so
that conjugacy of braids is decided by it (Elrifai–Morton, Quart. J. Math. 45 (1994)). Define
the pure braid group as `(TauCeti.BraidGroup.permHom n).ker` and strand deletion as a
homomorphism on it. Define the Brunnian links `L_n` as the closures of the iterated commutators
of `A_{1,n}, …, A_{n−1,n}` and prove that every proper sublink of `L_n` is an unlink while `L_n`
is not, by the length-`n` Milnor invariant computed from the longitudes in the Magnus
expansion.

**Checks.**
- `B₂ ≅ ℤ`, `Δ₂ = σ₁`, and the centre of `B₂` is everything; `Δ₃ = σ₁σ₂σ₁` and `Δ₃²` generates the
  centre of `B₃`, whose quotient by the centre is `PSL(2, ℤ)`.
- `σ₁σ₂σ₁` and `σ₂σ₁σ₂` have the same normal form `Δ₃`; `σ₁σ₂⁻¹` has normal form
  `Δ₃⁻¹ · σ₂ · (σ₂σ₁)`, since `σ₂⁻¹ = Δ₃⁻¹σ₂σ₁` and `σ₁Δ₃⁻¹ = Δ₃⁻¹σ₂`, and its closure is the
  unknot.
- `L₂` is the Hopf link and `L₃` the Borromean rings; deleting any component of the Borromean
  rings leaves the two-component unlink, while the Borromean rings are not split.
- Strand deletion is defined on pure braids, where every strand returns to its position;
  for `σ₁ ∈ B₂`, which is not pure, the strand starting at position `1` ends at position `2`,
  so deleting the strand of a position is not well defined.

*Needs:* Tau Ceti `TauCeti.BraidGroup`, `TauCeti.BraidGroup.sigma`, `TauCeti.BraidGroup.permHom`,
`TauCeti.BraidWord`; Layer 4.2 (closures).

### 4.13 Unknotting number one and Kondo's theorem

Prove Kondo's theorem: for every Laurent polynomial `Δ ∈ ℤ[t, t⁻¹]` with `Δ(t) = Δ(t⁻¹)` and
`Δ(1) = 1` there is a knot with unknotting number one whose Alexander polynomial is `Δ`
(Kondo, *Knots of unknotting number 1 and their Alexander polynomials*, Osaka J. Math. 16
(1979), Theorem 3: the knot is a normal form built from one unknotting band with integer
parameters solving Kondo's linear system (*), and his formula (8) for the Alexander
polynomial of the normal form shows that such a solution gives the prescribed `Δ`). Deduce
that the genus of knots with unknotting number one is unbounded, since `span Δ ≤ 2g`. The surgery-theoretic theorems
about unknotting number one, that `u(K) = 1` implies `K` prime and the Kanenobu–Murakami
criterion for two-bridge knots, are Layer 5.4's, since they rest on the cyclic surgery
theorem stated there.

**Checks.**
- `Δ = 1` is realized by the untwisted Whitehead double of the trefoil, which has `u = 1` and
  is nontrivial; the unknot also has `Δ = 1`, so Kondo's theorem does not give uniqueness.
- `Δ = t − 1 + t⁻¹` is realized by the trefoil, `u = 1`.
- For `Δ_k = 1 + (−1)^{k−1}(t + t⁻¹ − 2)^k`, which is symmetric with value `1` at `t = 1`, Kondo's
  knot has `u = 1` and genus at least `k`.
- `Δ = −t + 3 − t⁻¹` is realized by the figure-eight, `u = 1`; Kondo's normal form for it need
  not be the figure-eight, since the theorem realizes the polynomial, not the knot.

*Needs:* Layer 4.3, Layer 4.4, Layer 4.11.

### 4.14 Counting knots

Prove that for `n ≥ 4` there are at least `(2^{n−2} − 1)/6` prime knot types of crossing number
exactly `n` up to mirror image, by counting two-bridge knots `p/q` with `p` odd whose
continued fraction has coefficient sum `n` (Ernst–Sumners, *The growth of the number of prime
knots*, Math. Proc. Cambridge Philos. Soc. 102 (1987)): the positive continued-fraction
diagrams are reduced alternating, so their crossing number is `n` by Layer 4.8, and each
Schubert class contains at most four such fractions. Prove the exponential upper bound: the
number of knot types with a diagram of `n` crossings is at most `2ⁿ` times the number of
rooted connected four-valent plane maps with `n` vertices, which is at most `4 · 16^{2n}`:
a rooted plane map with `s` edges has a spanning tree, and tree-rooted maps with `s` edges are
counted by `Catalan(s) · Catalan(s+1) ≤ 4 · 16^s` through their encoding as shuffles of two
Dyck words (Bernardi, *Bijective counting of tree-rooted maps*, Electron. J. Combin. 14
(2007), Theorem 1).

**Checks.**
- The numbers of prime knots of crossing number `3, 4, 5, 6, 7` up to mirror image are
  `1, 1, 2, 3, 7`; the lower bound gives `1/6, 1/2, 7/6, 5/2, 31/6`, consistent.
- There are no knots of crossing number `1` or `2`: every diagram with at most two crossings
  is an unknot diagram.
- The upper bound for `n = 3` is `2³ · 4 · 16⁶`, far from sharp; the theorem is about growth
  rate, and neither bound claims the existence of a limit of `n`-th roots.

*Needs:* Layer 4.2, Layer 4.8, Layer 4.10; Mathlib `Nat.catalan`, Dyck words.

### Examples

The unknot, the two trefoils, the figure-eight, `5₁` and `5₂` with their Alexander and Jones
polynomials, determinants, colourings, genera and signatures; the Hopf link, the two-component
unlink and the Borromean rings; `T(3, 4)` as a non-alternating knot; the untwisted Whitehead
double of the trefoil as a nontrivial knot with trivial Alexander polynomial; the square and
granny knots as composite knots with equal Alexander polynomials.

### Dependencies

Layer 1 (surfaces, tubes, connected sums), Layer 2.2 (Schoenflies), Layer 3.3 (isotopy
extension), Layer 5.1 (the exterior); Tau Ceti's knot-theory carriers; Mathlib's quandles and
braid words; TypeAHeckeAlgebras H1, H2; SurfaceTopology Layer 8. The signature statements
about torus knots and unknotting numbers are Layer 6.2's and the surgery-theoretic
unknotting-number theorems are Layer 5.4's; both consume this layer.

## Layer 5: Dehn surgery

Dehn surgery removes a tubular neighbourhood of a knot and reglues a solid torus along a
slope. The slopes exist at the pin: `TauCeti.Slope`, `TauCeti.BoundaryTorus`,
`TauCeti.FramedBoundaryTorus` with its meridian and longitude and
`TauCeti.FramedBoundaryTorus.slopeEquiv : Slope T.H ≃ OnePoint ℚ`. Using solid-torus neighbourhoods
`TauCeti.IsSolidTorusNeighborhood`, this layer constructs the compact exterior as a set
and as a manifold with boundary, the filling and its first identities, and states the surgery theorems of Kirby's list.

### 5.1 The exterior of a link

For a link `L ⊂ S³` with `μ` components define the compact exterior `X_L` as the complement of
the union of the pairwise disjoint open `ε`-tubes of Layer 1.5, with `0 < ε` strictly below
a common embedding radius for their closed extensions. Give this closed subset of `S³`
its subtype topology and construct its smooth boundary charts, making it a compact `3`-manifold with
boundary a disjoint union of `μ` tori, each identified with `S¹ × S¹` by the trivialization of
the normal bundle given by the Seifert framing (the longitude has linking number `0` with its
component). Prove independence of `ε` and of the tube up to a diffeomorphism that is the
identity outside a neighbourhood of the tubes, that the interior of `X_L` is diffeomorphic to
`S³ ∖ L`, and that ambient isotopic links have diffeomorphic exteriors carrying the meridians
and longitudes to each other (Layer 3.3). On each boundary torus the meridian `μ` (the
boundary of a normal disc) and the Seifert longitude `λ` form a `TauCeti.FramedBoundaryTorus`
with `μ · λ = 1` (Rolfsen, Chapter 2, §E; Chapter 9, §F).

- The exterior of the unknot is a solid torus whose meridian disc is bounded by the
  longitude `λ`; the exterior of a nontrivial knot is not a solid torus (Layer 8.1, Dehn's
  lemma).
- `H₁(X_K; ℤ) ≅ ℤ` generated by the meridian, and the longitude is null-homologous in `X_K`.
- The exterior of every knot is irreducible (`TauCeti.IsSphereBoundsBall`), by Alexander's
  theorem on spheres in `S³` (Layer 8.1): a sphere in the exterior bounds a ball in `S³` on
  the side not containing the knot.

**Checks.**
- For the unknot, `X` is `S¹ × D²` and the framed boundary torus has `λ = ∂(pt × D²)`, so
  `0`-filling glues a solid torus along meridian-to-longitude and gives `S¹ × S²`.
- The Hopf link exterior is `T² × [0, 1]`, with the meridian of each component the longitude
  of the other.
- Changing the framing by `n` full twists changes `λ` to `λ + n μ`: the Seifert framing is
  the one with `lk(λ, K) = 0`, and the blackboard framing of a diagram differs from it by the
  writhe.
- For the empty link the union of open tubes is empty, so the exterior is `S³` and its
  boundary is empty. For a single component, taking the complement of the closed tube
  instead would omit the boundary torus and would give a noncompact open manifold.

*Needs:* Layer 1.2, Layer 1.5, Layer 3.3; Tau Ceti `TauCeti.FramedBoundaryTorus`,
`TauCeti.IsSolidTorusNeighborhood`; Layer 4.1.

### 5.2 Dehn filling and surgery

Define the Dehn filling `X(s)` of a compact `3`-manifold `X` with a torus boundary component
`T` along a slope `s : TauCeti.Slope H₁(T)` as the gluing (Layer 1.3) of `S¹ × D²` to `X` by a
diffeomorphism of the boundary tori sending `∂(pt × D²)` to a curve of slope `s`, and prove that
the result is independent of the choice of diffeomorphism up to diffeomorphism rel `X`. For a
knot `K ⊂ S³` and `p/q ∈ ℚ ∪ {∞}` define `S³_{p/q}(K)` as the filling of `X_K` along the slope
`p μ + q λ`, and for a framed link the surgery along all components. Define surgery on a
framed embedded `Sᵏ` in an `n`-manifold in general dimension as the removal of `Sᵏ × Dⁿ⁻ᵏ` and
gluing of `Dᵏ⁺¹ × Sⁿ⁻ᵏ⁻¹`, and prove that Dehn surgery with integer slope is its case
`k = 1`, `n = 3`.

- `∞`-filling recovers `S³`; `S³_{p/q}(K)` is a closed orientable `3`-manifold with
  `H₁ ≅ ℤ/p` (and `ℤ` for `p = 0`); the fillings of `K` and of its mirror satisfy
  `S³_{p/q}(K̄) ≅ −S³_{−p/q}(K)`.
- Lickorish–Wallace: every closed connected orientable `3`-manifold is integer surgery on a
  framed link in `S³` (Lickorish, Chapter 12; Rolfsen, *Knots and Links*, Chapter 9).
- The filling along the longitude of the unknot's exterior is `S¹ × S²`, and along
  `p μ + q λ` it is the lens space `TauCeti.LensSpace p` with the parameter determined by `q`
  (Rolfsen, Chapter 9, §B).

**Checks.**
- `S³_∞(K) = S³` for every `K`; `S³_0(unknot) = S¹ × S²`; `S³_{p/q}(unknot) = L(p, q)`, so
  `S³_{±1}(unknot) = S³` and `S³_{2}(unknot) = ℝP³`, whose `H₁` is `ℤ/2`.
- `+1`-surgery on the right-handed trefoil is the Poincaré homology sphere (its `H₁` vanishes
  since `p = 1`, and its fundamental group is the binary icosahedral group of order `120`),
  while `−1`-surgery on it is the Brieskorn sphere `Σ(2, 3, 7)`, not homeomorphic to it. The
  sign of the slope matters.
- Surgery on the Hopf link with framings `(a, b)` gives the lens space `L(ab − 1, b)`:
  framings `(0, 0)` and `(0, n)` give `S³`, framings `(1, 1)` give `S¹ × S²`, and framings
  `(3, 2)` give `L(5, 2)`.
- In general dimension, surgery on `S⁰ ⊂ Sⁿ` with the standard framing gives `S¹ × Sⁿ⁻¹`,
  and surgery on an unknotted `Sⁿ⁻¹ ⊂ Sⁿ` with the standard framing gives `S⁰ × Sⁿ ≅ Sⁿ ⊔ Sⁿ`.

*Needs:* Layer 1.3, Layer 5.1; Tau Ceti `TauCeti.Slope`, `TauCeti.FramedBoundaryTorus.slopeEquiv`,
`TauCeti.LensSpace`, `TauCeti.SolidTorus`.

### 5.3 Property P, Property R and cosmetic surgery

State Property P: for every nontrivial knot `K ⊂ S³` and every `p/q ≠ ∞`, the manifold
`S³_{p/q}(K)` is not simply connected (Kronheimer–Mrowka, *Witten's conjecture and Property P*,
Geom. Topol. 8 (2004), main theorem; Kirby's Problem 1.15). State Property R: if
`S³_0(K) ≅ S¹ × S²` then `K` is the unknot (Gabai, *Foliations and the topology of 3-manifolds
III*, J. Differential Geom. 26 (1987), §8; Kirby's Problem 1.16). Define two distinct slopes
`r ≠ r'` on the exterior of a knot `K` to be purely cosmetic when the fillings `S³_r(K)` and
`S³_{r'}(K)` are homeomorphic by an orientation-preserving homeomorphism, and chirally
cosmetic when they are homeomorphic by an orientation-reversing one (Kirby's Problem 1.81).
State the Gordon–Luecke corollary that the only slope on a nontrivial knot whose filling is
`S³` is `∞` (Layer 8.1; its proof is GeometricTopology, Part II's), and prove Mathieu's theorem that chirally cosmetic pairs exist: for
the right-handed trefoil and every `k ≥ 0`, the fillings along `(18k + 9)/(3k + 1)` and
`(18k + 9)/(3k + 2)` are orientation-reversingly homeomorphic Seifert fibred spaces (Mathieu,
*Closed 3-manifolds unchanged by Dehn surgery*, J. Knot Theory Ramifications 1 (1992)). The
purely cosmetic surgery conjecture, that no nontrivial knot has a purely cosmetic pair, is
open and is stated, not asserted. The proofs of Property P and Property R need gauge theory
or foliations and are not owned here; the statements are targets, since each is now statable
against Layer 5.2.

**Checks.**
- For the unknot, `S³_{±1}(unknot) = S³` is simply connected, so Property P is false for the
  unknot and the nontriviality hypothesis is necessary.
- For the unknot `S³_0(unknot) = S¹ × S²`, consistent with Property R.
- `+1`- and `−1`-surgery on the right trefoil are not homeomorphic (Layer 5.2), so `±1` is not
  a cosmetic pair; the pair `9/1`, `9/2` is chirally cosmetic by Mathieu, and both fillings
  are Seifert fibred with exceptional fibres of multiplicities `2, 3, 3` by Layer 5.4, with
  `H₁ = ℤ/9`.
- For the unknot the slopes `1/1` and `1/2` both give `S³` with the same orientation, so the
  definitions must be read for nontrivial knots, as in the conjecture's statement.

*Needs:* Layer 5.2, Layer 4.1; Mathlib `SimplyConnectedSpace`.

### 5.4 The cyclic surgery theorem and unknotting number one

State the cyclic surgery theorem: if the exterior of a knot `K ⊂ S³` is
not Seifert fibred and two slopes give fillings with cyclic fundamental group, then the slopes
have distance at most one, so two distinct such slopes have distance exactly one
(Culler–Gordon–Luecke–Shalen, *Dehn surgery on knots*, Ann. of Math. 125 (1987), the Cyclic
Surgery Theorem). Its proof, through the Culler–Shalen theory of essential surfaces at ideal
points of the character variety, is GeometricTopology, Part II's; everything below that uses
the theorem consumes it as stated. Prove that a Seifert fibred exterior of a nontrivial knot is a torus-knot
exterior, and that for coprime `r, s` with `|r|, |s| ≥ 2` and a slope `p/q` (`p`, `q` coprime)
the filling of `T(r, s)` along `p/q` is a lens space iff `|p − q r s| = 1` (Moser, Pacific J.
Math. 38 (1971)). For the unknot every filling `p/q` is the lens space `L(p, q)`, with
`L(1, q) = S³` and `L(0, 1) = S¹ × S²`, so the unknot is excluded from the criterion. Prove Scharlemann's theorem that unknotting number one
knots are prime (Scharlemann 1985) by the sutured-manifold route, and the Montesinos trick:
if `u(K) = 1` then the double branched cover of `K` is `±(d/2)`-surgery on a knot in `S³`,
`d` the determinant. Prove the Kanenobu–Murakami criterion for unknotting number one of
two-bridge knots (Kanenobu–Murakami, *Two-bridge knots with unknotting number one*, Proc.
Amer. Math. Soc. 98 (1986)) from the cyclic surgery theorem as stated, by the Montesinos
trick and Moser's classification applied to the lens space that is the double branched
cover: the reduction is this roadmap's target, and the criterion is a consequence of the
stated theorem.

**Checks.**
- The granny knot has `u = 2` and is composite, consistent with Scharlemann's theorem;
  `u(8₃) = 2` and `8₃` is prime, so the converse fails.
- The meridian `∞` and the slope `p/q = ±1` on the unknot both give `S³`, at distance one,
  consistent with the theorem; the unknot's exterior is Seifert fibred, so the theorem does
  not even apply to it.
- On the figure-eight exterior, which is hyperbolic, the meridian taken twice gives the same
  cyclic filling `S³` at distance `0`: the conclusion is `Δ ≤ 1`, with equality only for
  distinct slopes.
- `T(1, 2)` is the unknot: its `5`-surgery is the lens space `L(5, 1)` although
  `|5 − 1 · 1 · 2| = 3`, so the criterion needs `|r|, |s| ≥ 2`.
- `T(2, 3)` has lens-space surgeries exactly for `|p − 6q| = 1`, and the filling is
  `L(p, 9q)`: for `p/q = 5` and `7` the fillings are `L(5, 4)` and `L(7, 2)` up to orientation.
  For `p/q = 6` the filling is `L(2, 1) # L(3, 1)`, a reducible manifold, which is why
  `|p − 6q| = 0` is excluded.
- `8₃ = 17/4` has determinant `17` and double branched cover `L(17, 4)`; if `u(8₃)` were `1`,
  `L(17, 4)` would be `±17/2`-surgery on a knot `J`, and the cyclic surgery theorem, consumed
  as stated, together with Moser's classification excludes every `J`, so `u(8₃) = 2`.

*Needs:* Layer 5.2, Layer 8.2, Layer 8.4 (Seifert fibred spaces), Layer 4.9, Layer 4.10.

### Examples

The unknot's fillings `S³`, `S¹ × S²` and the lens spaces; the Poincaré homology sphere as
`+1`-surgery on the right trefoil; the Hopf link exterior `T² × [0, 1]`; the trefoil's lens
space surgeries.

### Dependencies

Layer 1.3 (gluing), Layer 1.5 (tubes), Layer 3.3 (isotopy extension), Layer 4 (links),
Layer 8 (irreducibility, Seifert fibred spaces); Tau Ceti's slopes, solid tori and lens
spaces.

## Layer 6: knot concordance

Two knots in `S³` are concordant when they cobound an annulus in `S³ × [0, 1]`. The relation
exists at the pin for smooth embeddings of any manifold: `TauCeti.SmoothEmbedding.Concordant f g`
holds when a collared `TauCeti.SmoothEmbedding.Concordance` `N × [0, 1] → M × [0, 1]` restricts to
`f` at `0` and to `g` at `1`, with no reflection of either end; `TauCeti.TopologicallyConcordant`
is the locally flat version; `TauCeti.IsSmoothlySlice`, `TauCeti.IsTopologicallySlice` and
`TauCeti.sliceGenus` are the slice notions. This layer builds the concordance group, the
signature invariants and the theorems of Kirby's list about concordance.

### 6.1 The concordance group

For knots `K, J ⊂ S³` smooth concordance is `TauCeti.SmoothEmbedding.Concordant K J` and
topological concordance is `TauCeti.TopologicallyConcordant` of the underlying maps. Prove that
concordance is a congruence for the connected sum of Layer 4.1, that the slice knots form the
class of the unknot (`K` is smoothly slice iff `K` is concordant to `TauCeti.unknot`), and that
the reverse of the mirror `−K̄` is an inverse: `K # (−K̄)` is slice, by the spun annulus. The
concordance classes with connected sum form the abelian group `C` (Livingston, *A survey of
classical knot concordance*, Theorem 2.2); the topological concordance group `C_top` receives
`C` by a surjection whose kernel is the subgroup of smooth concordance classes of topologically
slice knots: the class of the unknot is its zero, and its nonzero elements are the classes of
the smoothly non-slice topologically slice knots, such as the untwisted Whitehead double of
the trefoil (Layer 6.4).

- Ambient isotopic knots are concordant (`TauCeti.SmoothEmbedding.SmoothAmbientIsotopic.concordant`);
  the converse fails, since the square knot is slice and not the unknot.
- The slice genus `TauCeti.sliceGenus K` is a concordance invariant, `g_s(K) ≤ g(K)`, and
  `g_s(K) = 0` iff `K` is slice.
- Concordance is not the specialization of isotopy: the concordance from `K # (−K̄)` to the
  unknot is an annulus that is not a product.

**Checks.**
- The product annulus `K × [0, 1]` is a concordance from `K` to itself; a definition asking
  for `K̄` at the far end would deny this, since the trefoil is not concordant to its mirror
  (their signatures are `−2` and `+2`).
- The square knot `T # T̄` is slice, hence concordant to the unknot, although its Alexander
  polynomial `(t − 1 + t⁻¹)²` is not `1`.
- `TauCeti.unknot` is slice (`TauCeti.isSmoothlySlice_unknot`) with slice genus `0`; the trefoil
  has slice genus `1`, equal to its genus.
- The granny knot `T # T` has signature `−4` and is not slice; the group `C` is not of
  exponent two.

*Needs:* Tau Ceti `TauCeti.SmoothEmbedding.Concordant`, `TauCeti.SmoothEmbedding.Concordance`,
`TauCeti.TopologicallyConcordant`, `TauCeti.IsSmoothlySlice`, `TauCeti.IsTopologicallySlice`,
`TauCeti.sliceGenus`; Layer 4.1, Layer 4.3; Layer 1.3.

### 6.2 The Levine–Tristram signatures

For a Seifert matrix `V` of `K` and `ω ∈ S¹` the Hermitian matrix
`TauCeti.KnotTheory.tristramLevineForm V ω = (1 − ω) V + (1 − ω̄) Vᵀ` has signature
`TauCeti.KnotTheory.tristramLevineSignature V ω`. Prove that for `ω ≠ 1` not a root of `Δ_K` the
signature is independent of `V` (through S-equivalence, Layer 4.3) and is a concordance
invariant, zero on slice knots (Lickorish, Theorems 8.9 and 8.19); at roots of `Δ_K` the
raw signature is still independent of `V` but is not a concordance invariant in general
(Conway, *The Levine–Tristram signature: a survey*, arXiv 1903.04477, Theorem 2.9, which
identifies the parameters where it is: exactly the `ω ≠ 1` that are not roots of any Laurent
polynomial `p ∈ ℤ[t^±]` with `p(1) = ±1`, the set written `S¹_!`). Define the averaged
signature `σ̄(K, ω)`, for every `ω ≠ 1` in `S¹`, as the mean of the two one-sided limits of
the raw signature function `σ(K, ·)` at `ω`; prove it is a concordance invariant at every
such `ω` and agrees with `σ(K, ω)` off the roots of `Δ_K`. Prove the crossing change
inequality `|σ(K₊, ω) − σ(K₋, ω)| ≤ 2` (Conway, Proposition 2.7), hence `|σ(K, ω)| ≤ 2 u(K)`.
Prove the slice-genus bounds in two forms: the raw bound `|σ(K, ω)| ≤ 2 g_s(K)` for
`ω ∈ S¹_!` (Conway, Theorem 2.12, whose inequality also carries the nullity term), and the
averaged bound `|σ̄(K, ω)| ≤ 2 g_s(K)` for every `ω ≠ 1` (Powell's theorem, as reported in
Conway, §2.4 after Theorem 2.12); the raw bound then also holds at every `ω` that is not a
root of `Δ_K`, where the two signatures agree. Define the classical signature
`σ(K) = σ(K, −1)`; since `−1` is a root of no `p` with `p(1) = ±1` (`p(−1) ≡ p(1) mod 2`),
`−1 ∈ S¹_!` and the classical signature needs no averaging.

- `σ(K # J) = σ(K) + σ(J)`, `σ(K̄) = −σ(K)`, `σ(−K) = σ(K)`; the signature is even, since
  `V + Vᵀ` is a nonsingular symmetric matrix of even rank `2g` (its determinant is `±Δ_K(−1)`,
  odd by Layer 4.4) and the signature of a nonsingular form is congruent to its rank mod `2`.
  It is not unimodular in general: `det(V + Vᵀ) = 3` for the trefoil and `−5` for the
  figure-eight.
- Torus knots: `σ(T(p, q), −1) < 0` for `p, q ≥ 2`, computed from the eigenvalues of
  `V⁻¹ Vᵀ` for the tensor-product Seifert matrix of the positive braid surface, so torus knots
  are chiral and `T(p, q) ≠ T(p, −q)` as unoriented knots.
- The signature is the signature of the intersection form of the double branched cover's
  spanning `4`-manifold, and at `ω = −1` the form is `TauCeti.KnotTheory.tristramLevineForm_neg_one`'s
  value `2(V + Vᵀ)`, whose signature is that of `V + Vᵀ`.

**Checks.**
- Right-handed trefoil: `V + Vᵀ = [[−2, 1], [1, −2]]` is negative definite, so `σ = −2`
  (`TauCeti.KnotTheory.signature_trefoilSeifertMatrix`); the left-handed trefoil has `σ = +2`.
- Figure-eight: `V + Vᵀ = [[2, 1], [1, −2]]` has determinant `−5 < 0`, so `σ = 0`; this is
  consistent with amphichirality and does not decide sliceness (the figure-eight is not slice,
  by Fox–Milnor, since `−t + 3 − t⁻¹` is not of the form `f(t) f(t⁻¹)`).
- At a root of the trefoil's Alexander polynomial, `ω = e^{±iπ/3}`, the one-sided signatures
  are `0` and `−2`, and the averaged signature is `−1`; a definition that took the raw
  signature there would not be a concordance invariant.
- At every root `ω` of a polynomial `p` with `p(1) = ±1`, Cha and Livingston give a slice knot
  with `σ(K, ω) ≠ 0` (Conway, after Theorem 2.9). Such a knot has `g_s = 0`, so the raw bound
  `|σ(K, ω)| ≤ 2 g_s(K)` fails at `ω`; its averaged signature there is `0`, by the concordance
  invariance of `σ̄`, and the averaged bound reads `0 ≤ 0`.
- `|σ(T # T)| = 4 ≤ 2 u(T # T) = 4`, so the signature bound is sharp for the granny knot; for the
  figure-eight it gives only `0 ≤ 2`.

*Needs:* Tau Ceti `TauCeti.KnotTheory.tristramLevineForm`, `TauCeti.KnotTheory.tristramLevineSignature`,
`Matrix.IsHermitian.signature`, `TauCeti.KnotTheory.IntegralSquareMatrix.SEquivalent`; Layer 4.3,
Layer 4.11, Layer 6.1.

### 6.3 Mutation and the Conway knot

Define Conway mutation: a Conway sphere meets `K` in four points and bounds a ball; cut the
ball out, apply one of the three half-turn rotations of the sphere preserving the four
points, and reglue. Prove that mutation preserves the Alexander, Jones, HOMFLY and Kauffman
polynomials and the signature, but not the genus or the concordance class. The
Kinoshita–Terasaka knot and the Conway knot are mutants with `Δ = 1`; the former is slice and
the latter is not (Piccirillo, *The Conway knot is not slice*, Ann. of Math. 191 (2020),
Theorem 1.1, through a knot `K'` with the same trace, Proposition 1.4, and the Rasmussen
invariant `s(K') = 2`, Theorem 1.5). The statement that mutation does not preserve smooth
concordance (Kirby's Problem 1.53) is a target here; its proof consumes the Rasmussen
invariant, which is GeometricTopology, Part II, since it is built on KhovanovHomology.

**Checks.**
- A mutation of the unknot along any Conway sphere is the unknot; a mutation of a two-bridge
  knot is the same two-bridge knot.
- The Kinoshita–Terasaka and Conway knots have the same Jones polynomial and `Δ = 1`; their
  genera are `2` and `3`, so they are not ambient isotopic.
- Topological concordance does not distinguish them: both have `Δ = 1`, so both are
  topologically slice by Freedman's theorem (Layer 6.4).

*Needs:* Layer 4.1, Layer 4.4, Layer 4.5, Layer 4.6, Layer 6.1, Layer 6.2.

### 6.4 Freedman's theorem and Levine's theorem

Freedman's theorem is the pinned proposition `TauCeti.FreedmanSliceTheorem`: every knot in `S³`
with perfect commutator subgroup, equivalently with `Δ_K = 1` (Layer 4.4), is topologically
slice (Freedman, *The topology of four-dimensional manifolds*, J. Differential Geom. 17
(1982); Freedman–Quinn, *Topology of 4-Manifolds*, Theorem 11.7B; Kirby's Problem 1.36).
`Suggested.lean` states it as `freedman_slice_theorem`. Its proof is the disc embedding
theorem in dimension four and is FourManifolds' work. Prove the comparison of the two
hypotheses here, and prove Levine's theorem: there is a pattern knot `P` in the solid torus
representing a generator of its first homology such that, for every knot `K ⊂ S³`, the
satellite `P(K)` is not smoothly slice in any smooth homology `4`-ball; consequently there is
a knot in an integral homology `3`-sphere `Y` that bounds no piecewise-linear disc in any
contractible smooth `4`-manifold with boundary `Y`, and is not smoothly concordant to a knot
in `S³` through a homology cobordism bounding a contractible manifold (Levine, *Non-surjective
satellite operators and piecewise-linear concordance*, Forum Math. Sigma 4 (2016), abstract
and §1; Kirby's Problem 1.31). The notion needed is concordance of knots in homology spheres:
an annulus in a smooth homology cobordism between the ambient manifolds, which specializes to
Layer 6.1 for `S³ × [0, 1]`.

**Checks.**
- The unknot has knot group `ℤ`, perfect commutator subgroup and is topologically slice:
  both sides of the theorem hold (`TauCeti.hasPerfectCommutatorSubgroup_unknot`,
  `TauCeti.isTopologicallySlice_unknot`).
- The untwisted Whitehead double of the trefoil has `Δ = 1`, so it is topologically slice, and
  it is not smoothly slice (its `τ`-invariant is `1`, a fact of CombinatorialHeegaardFloer,
  downstream of this roadmap): the gap between the two slice notions is exactly Freedman's
  theorem.
- The trefoil has `Δ ≠ 1` and the theorem says nothing about it; it is not even topologically
  slice, since its signature is `−2`.

*Needs:* Tau Ceti `TauCeti.FreedmanSliceTheorem`, `TauCeti.SmoothCircleEmbedding.HasPerfectCommutatorSubgroup`,
`TauCeti.IsTopologicallySlice`; Layer 4.4, Layer 6.1, Layer 6.2; Mathlib singular homology.

### Examples

The product concordance; the slice square knot; the trefoil signature `−2` and the averaged
signature `−1` at its Alexander root; the Kinoshita–Terasaka and Conway mutants; the
Whitehead double of the trefoil as topologically but not smoothly slice.

### Dependencies

Tau Ceti's concordance and slice carriers and matrix signatures; Layer 4 (knots, Seifert
matrices, polynomials), Layer 1.3 (gluing concordances), Layer 2 (locally flat discs).

## Layer 7: hyperbolic structures, volume and rigidity

Hyperbolic metrics exist at the pin as `TauCeti.HyperbolicMetric` (complete, smooth, constant
sectional curvature `−1`), with `TauCeti.IsHyperbolic`, `TauCeti.hypVolumeOfMetric`,
`TauCeti.hypVolume` (defined from a chosen metric and shown metric-independent under the
`TauCeti.IsMostowRigid` hypothesis by `TauCeti.hypVolumeOfMetric_eq_of_mostow`),
`TauCeti.HyperbolicMetric.HasFiniteVolume`, `TauCeti.IsFiniteVolumeHyperbolic`,
`TauCeti.MostowRigidity`, `TauCeti.VirtualFiberingConjecture`, `TauCeti.VirtualHakenConjecture`,
the upper half space `TauCeti.UpperHalfSpace E`, the model geometries `TauCeti.ModelGeometry`
and `TauCeti.HasGeometricStructure`. The volume measure is `TauCeti.riemannianVolume`. This
layer states Mostow rigidity, develops finite-volume hyperbolic `3`-manifolds and states the
Weeks and Agol theorems.

### 7.1 Hyperbolic space and its isometries

Prove that `TauCeti.UpperHalfSpace (EuclideanSpace ℝ (Fin (n−1)))` with the metric
`(dx² + dy²)/y²` is a `TauCeti.HyperbolicMetric`, is the hyperbolic model space of
`TauCeti.ModelGeometry`, and that its isometry group `TauCeti.Isom` acts transitively on
orthonormal frames; identify `Isom(ℍ³)` with `PSL₂(ℂ) ⋊ ℤ/2` acting on the Riemann sphere by
Möbius and anti-Möbius transformations. Prove the Cartan–Hadamard property of `ℍⁿ`
(the exponential map at any point is a diffeomorphism) from the explicit geodesics, and the
structure of a complete hyperbolic manifold as a quotient `ℍⁿ / Γ` by a discrete torsion-free
subgroup `Γ ≤ Isom(ℍⁿ)` acting freely, through the developing map, with the converse that
every such quotient carries a hyperbolic metric (`TauCeti.hasGeometricStructure_quotient`
for the geometric structure, and the metric descends).

- The volume of `ℍⁿ / Γ` is the volume of a fundamental domain; the volume form in the upper
  half space is `y⁻ⁿ dx dy`.
- A complete hyperbolic manifold has universal cover `ℍⁿ`, is aspherical, and its fundamental
  group is torsion free.

**Checks.**
- The hyperbolic plane with `Γ` generated by one translation is an annulus of infinite volume;
  with `Γ` a surface group of genus `2` it is a closed surface of volume `4π`, by
  Gauss–Bonnet `2π · |χ| = 2π · 2`.
- The quotient of `ℍ³` by a parabolic `ℤ²` is a cusp `T² × ℝ`, of infinite volume but with a
  finite-volume end `T² × [0, ∞)` of volume `A/2` for a cusp cross-section of area `A`.
- `−I ∈ O(4)` acts freely on `S³` but the corresponding statement for `ℍ³` fails: the
  reflection in a point is an isometry of `ℍ³` with a fixed point, so the quotient by it is an
  orbifold, not a manifold, and the freeness hypothesis is necessary.

*Needs:* Tau Ceti `TauCeti.UpperHalfSpace`, `TauCeti.HyperbolicMetric`, `TauCeti.Isom`,
`TauCeti.ModelGeometry`, `TauCeti.HasGeometricStructure`, `TauCeti.riemannianVolume`;
HopfRinow Layers 1–3; DifferentialGeometry Layer 12.

### 7.2 Mostow rigidity

State `TauCeti.MostowRigidity`: for closed connected hyperbolic manifolds of dimension `n ≥ 3`,
any two hyperbolic metrics on the same manifold are related by an isometry; more strongly,
a homotopy equivalence between closed hyperbolic manifolds of dimension `n ≥ 3` is homotopic
to an isometry (Mostow, *Quasi-conformal mappings in n-space and the rigidity of hyperbolic
space forms*, Publ. Math. IHÉS 34 (1968); Ratcliffe, *Foundations of Hyperbolic Manifolds*,
3rd ed., Theorem 11.8.5). `Suggested.lean` states it as `mostow_rigidity`. The proof is
GeometricTopology, Part II's, by Gromov–Thurston's route for `n = 3` (Thurston, *The Geometry
and Topology of Three-Manifolds*, Chapter 6): the lift of the homotopy equivalence extends to a
quasi-conformal homeomorphism of the sphere at infinity, straightening of singular chains and
the volume of ideal simplices show that it carries regular ideal simplices to regular ideal
simplices almost everywhere, hence is Möbius. Its consequences, that `TauCeti.hypVolume` does
not depend on the metric, that the isometry group of a closed hyperbolic manifold of
dimension `≥ 3` is finite and equals `Out(π₁)`, and that the volume is a topological
invariant, are stated here and proved there.

- Rigidity fails in dimension two: a closed surface of genus `g ≥ 2` has a `(6g − 6)`-dimensional
  space of hyperbolic metrics up to isotopy.
- The volume of a closed hyperbolic `3`-manifold is the simplicial volume times the volume
  `v₃ = 1.0149…` of the regular ideal tetrahedron.

**Checks.**
- Two hyperbolic metrics on a closed genus-two surface with different systoles exist, so the
  dimension hypothesis `n ≥ 3` is necessary.
- The figure-eight knot complement is not closed, and the closed theorem does not apply to it
  directly; its rigidity is the finite-volume theorem stated in Layer 7.3.
- `TauCeti.hypVolumeOfMetric_eq_of_mostow` turns the proof of rigidity for a given `M` into the
  equality of the volumes of any two hyperbolic metrics on `M`, which is the form `hypVolume`
  needs.

*Needs:* Tau Ceti `TauCeti.MostowRigidity`, `TauCeti.IsMostowRigid`, `TauCeti.HyperbolicMetric.Isometry`,
`TauCeti.hypVolumeOfMetric_eq_of_mostow`; Layer 7.1; Mathlib singular homology, measure theory.

### 7.3 Finite-volume hyperbolic 3-manifolds

Prove the Margulis lemma for `ℍⁿ` and the thick–thin decomposition: a complete hyperbolic
`3`-manifold of finite volume (`TauCeti.IsFiniteVolumeHyperbolic`, which assumes neither
orientability nor connectedness) is the interior of a compact manifold whose boundary
components are closed flat surfaces, tori or Klein bottles, and its ends are cusps `F × [0, ∞)`
with `F` a flat torus or Klein bottle and the metric `dt² + e^{−2t} ds²` (Thurston, Chapter 5;
Ratcliffe, Chapter 12). For an orientable manifold every cross-section `F` is a torus. State the finite-volume
Mostow–Prasad theorem for `3`-manifolds: a homotopy equivalence between complete finite-volume
hyperbolic `3`-manifolds is homotopic to an isometry, so that the volume of such a manifold
is a topological invariant (Prasad, *Strong rigidity of Q-rank 1 lattices*, Invent. Math. 21
(1973); Thurston, Chapter 6); its proof needs the Kleinian-group analysis of the cusps and is
GeometricTopology, Part II's, as is the closed case stated in Layer 7.2. Prove that the
complement of the figure-eight knot carries a
complete finite-volume hyperbolic metric, built from two regular ideal tetrahedra (Thurston,
Chapter 3), of volume `2 v₃ = 2.0298…`, and that the volume of a nonempty finite-volume
hyperbolic manifold is positive.

- A connected finite-volume hyperbolic `3`-manifold is irreducible, atoroidal in the sense of
  `TauCeti.IsAtoroidal`, and has infinite torsion-free fundamental group with trivial centre.
- Dehn filling (Layer 5.2) of all but finitely many slopes on a cusp produces hyperbolic
  manifolds (Thurston's hyperbolic Dehn surgery theorem, Chapter 5), with volumes converging
  to the volume of the cusped manifold from below.

**Checks.**
- The figure-eight complement has one cusp and volume `2 v₃`; the Whitehead link complement
  has two cusps and volume `3.6638…`, the volume of the regular ideal octahedron.
- The Gieseking manifold, the quotient of `ℍ³` doubly covered by the figure-eight complement,
  is complete, nonorientable and of volume `v₃ = 1.0149…`, with one cusp whose cross-section is
  a Klein bottle; its cusp group is non-abelian, unlike `π₁(T²) = ℤ²`. A statement that every
  cusp of a finite-volume manifold is a torus cusp fails on it.
- The empty manifold satisfies `TauCeti.IsFiniteVolumeHyperbolic` vacuously with volume `0`,
  which is why positivity of volume carries nonemptiness.
- The trefoil complement is Seifert fibred and carries no complete finite-volume hyperbolic
  metric; the torus-knot exteriors are exactly the Seifert fibred knot exteriors (Layer 5.4).
- A closed hyperbolic manifold has finite volume
  (`TauCeti.HyperbolicMetric.hasFiniteVolume_of_compactSpace`),
  and the cusp end `T² × [0, ∞)` has finite volume although it is not compact: finite volume
  does not imply compactness.

*Needs:* Tau Ceti `TauCeti.IsFiniteVolumeHyperbolic`, `TauCeti.HyperbolicMetric.HasFiniteVolume`,
`TauCeti.IsAtoroidal`; Layer 7.1, Layer 7.2, Layer 5.2, Layer 8.2.

### 7.4 The Weeks manifold, virtual fibering and virtual Haken

Define the Weeks manifold as the `(5, 1), (5, 2)` Dehn filling of the Whitehead link exterior
and prove it is a closed orientable hyperbolic `3`-manifold of volume `0.9427…`
(Gabai–Meyerhoff–Milley, *Mom technology and hyperbolic 3-manifolds*, arXiv 0910.5043,
Theorem 1.1 and §1). State its minimality: every closed orientable hyperbolic `3`-manifold has
volume at least that of the Weeks manifold, with equality only for it (Gabai–Meyerhoff–Milley,
*Minimum volume cusped hyperbolic three-manifolds*, J. Amer. Math. Soc. 22 (2009), and
Theorem 1.1 of the Mom paper; Kirby's Problem 3.60). State Agol's theorems, the pinned
propositions `TauCeti.VirtualFiberingConjecture` and `TauCeti.VirtualHakenConjecture`: every
closed hyperbolic `3`-manifold has a finite cover that fibres over the circle, and a finite
cover that is Haken (Agol, *The virtual Haken conjecture*, Doc. Math. 18 (2013), Theorems 9.1
and 9.2; Kirby's Problem 3.51). `Suggested.lean` states them as `virtual_fibering_conjecture`
and `virtual_haken_conjecture`. The Weeks minimality statement is not statable at the pin,
since the Weeks manifold is not a pinned carrier.

- A manifold that fibres over the circle with fibre a closed surface of negative Euler
  characteristic is Haken; `TauCeti.FibersOverCircle` and `TauCeti.IsHakenSurfaceEmbedding`
  are the pinned notions.
- The Weeks manifold has `H₁ = ℤ/5 ⊕ ℤ/5` and is not Haken; its virtual Haken cover is a
  genuine finite cover.

**Checks.**
- The volume of the Weeks manifold is less than `v₃ = 1.0149…`, the volume of the regular ideal
  tetrahedron, and less than the volume `2 v₃` of the figure-eight complement, consistent with
  volumes decreasing under Dehn filling.
- The mapping torus of a pseudo-Anosov diffeomorphism of a closed surface of genus `2` is
  hyperbolic (Thurston) and fibres over the circle with the identity cover; it is already
  Haken.
- `S³` is not hyperbolic (its fundamental group is finite), so neither theorem applies to it,
  and `S³` is indeed neither Haken nor fibred.

*Needs:* Layer 5.2, Layer 7.3; Tau Ceti `TauCeti.VirtualFiberingConjecture`,
`TauCeti.VirtualHakenConjecture`, `TauCeti.FibersOverCircle`, `TauCeti.IsVirtuallyFibered`,
`TauCeti.IsVirtuallyHaken`.

### Examples

The upper half plane and half space; closed surfaces of genus two as quotients; the
figure-eight and Whitehead link complements; the Weeks manifold.

### Dependencies

Tau Ceti's hyperbolic metrics, volumes, isometries, geometric structures and the Mostow,
virtual fibering and virtual Haken propositions; HopfRinow (geodesics, exponential map);
DifferentialGeometry Layer 12 (metrics and densities); Layer 5.2 (Dehn filling), Layer 8.2
(irreducibility).

## Layer 8: decompositions of 3-manifolds and geometrization

The decomposition theorems of `3`-manifold topology are statable at the pin:
`TauCeti.IsSphereBoundsBall` (irreducibility), `TauCeti.IsIncompressible`, `TauCeti.IsAtoroidal`,
`TauCeti.IsSeifertFibered`, `TauCeti.IsTorusDecomposition`, `TauCeti.IsJSJDecomposition`,
`TauCeti.JSJTheorem`, `TauCeti.IsGeometricTorusDecomposition` and `TauCeti.GeometrizationConjecture`.
This layer proves the classical theorems up to the JSJ theorem (Alexander's theorem, Dehn's
lemma, the loop and sphere theorems, the prime decomposition and Kneser's finiteness),
develops Seifert fibred spaces, and states the Gordon–Luecke theorem, the JSJ theorem,
geometrization and the Poincaré conjecture. Manifolds are
smooth; by Layer 11.2 this loses nothing in dimension three.

### 8.1 Dehn's lemma, the loop theorem and the sphere theorem

Prove Alexander's theorem: every locally flat `2`-sphere in `S³` bounds a ball on each side, so
`TauCeti.IsSphereBoundsBall S³` (Hatcher, *Notes on Basic 3-Manifold Topology*, Theorem 1.1; for
the locally flat case through Layer 11.2 and the PL proof). Prove Dehn's lemma and the loop
theorem: if `M` is a `3`-manifold with boundary and the kernel of `π₁(∂M) → π₁(M)` is
nontrivial, some essential simple closed curve in `∂M` bounds an embedded disc in `M`; and the
sphere theorem: if `π₂(M) ≠ 0` for an orientable `M`, some embedded two-sided sphere in `M`
is homotopically nontrivial (Papakyriakopoulos, Ann. of Math. 66 (1957); Hatcher, Chapter 3).
Deduce that a knot in `S³` with knot group `ℤ` is the unknot, that an irreducible orientable
`3`-manifold with infinite fundamental group is aspherical, and state the Gordon–Luecke
theorem that knots with homeomorphic complements are carried onto each other by a
homeomorphism of `S³`, hence are equivalent up to mirror image and reversal (Gordon–Luecke,
*Knots are determined by their complements*, J. Amer. Math. Soc. 2 (1989)). `Suggested.lean`
states Alexander's theorem as `alexander_sphere_bounds_ball`, the knot-group theorem as
`smoothAmbientIsotopic_unknot_of_knotGroup` and the Gordon–Luecke theorem as `gordon_luecke`;
the proofs of the first two are targets of this layer, and the proof of the third, through
the cyclic surgery theorem stated in Layer 5.4 and the analysis of reducible fillings, is
GeometricTopology, Part II's.

**Checks.**
- The unknot has group `ℤ` and is the unknot; the trefoil has group `⟨x, y | xyx = yxy⟩`, which
  is not abelian, so Dehn's lemma does not apply, consistent with the trefoil being knotted.
- `S² × S¹` has `π₂ ≠ 0` and the sphere `S² × {pt}` is essential and two-sided; `ℝP³` has
  `π₂ = 0` and is irreducible.
- The granny and square knots have isomorphic knot groups but are not equivalent even up to
  mirror image (signatures `−4` and `0`), so by the Gordon–Luecke theorem their complements
  are not homeomorphic: the theorem is about complements, not about groups.

*Needs:* Layer 11.2 (PL structures in dimension three), Layer 5.1, Layer 4.4; Tau Ceti
`TauCeti.IsSphereBoundsBall`, `TauCeti.IsIncompressible`; Mathlib `FundamentalGroup`,
`HomotopyGroup`.

### 8.2 Prime decomposition

Define a closed connected orientable `3`-manifold to be prime when every connected-sum
decomposition has an `S³` summand, and irreducible when every embedded `2`-sphere bounds a
ball (`TauCeti.IsSphereBoundsBall`). Prove that the only closed orientable prime manifold that
is not irreducible is `S¹ × S²` (Hatcher, Proposition 1.4), Kneser's two finiteness theorems,
and the Kneser–Milnor theorem. Kneser's finiteness for spheres: in a compact connected
`3`-manifold in which every `2`-sphere separates and no boundary component is a sphere, there
is a bound, in terms of a triangulation, on the number of spheres in a system of disjoint
spheres no complementary component of which is a punctured `3`-sphere (Hatcher, the Basic
Fact in the proof of Theorem 1.5); parallel spheres cobound an `S² × [0, 1]`, a punctured
sphere, so such a system has no two parallel members. Kneser's finiteness for surfaces: in a
compact irreducible `3`-manifold there is a bound on the number of components of a system of
disjoint closed connected two-sided incompressible surfaces, none a sphere, such that no
component of the complement is a product `T × [0, 1]` with `T` a closed surface (Hatcher,
Proposition 1.7). Incompressibility there is Hatcher's: a two-sided surface other than a
sphere or a disc is incompressible when the boundary of every compressing disc bounds a disc
in the surface; for such surfaces injectivity on `π₁`, `TauCeti.IsIncompressible`, implies it,
and the converse is the loop theorem of Layer 8.1. The Kneser–Milnor theorem: every closed connected orientable `3`-manifold is a connected sum
of finitely many prime manifolds, unique up to order and insertion of `S³` summands (Hatcher,
Theorem 1.5; Milnor, *A unique decomposition theorem for 3-manifolds*, Amer. J. Math. 84
(1962)).

- Connected sum is Layer 1.4; the sphere system of a prime decomposition and the ball
  capping of its pieces are Layers 1.2 and 1.3.
- A simply connected closed `3`-manifold is irreducible after removing `S¹ × S²` summands,
  which it has none of, since `π₁(S¹ × S²) = ℤ`.

**Checks.**
- `S¹ × S²` is prime and not irreducible; `T³` is irreducible, hence prime; `ℝP³ # ℝP³` is
  not prime and its prime factors are the two `ℝP³` summands.
- The uniqueness clause needs orientability: for a non-orientable `N` the manifolds
  `N # (S¹ × S²)` and `N # (S¹ ×̃ S²)` are diffeomorphic although `S¹ × S²` and the
  non-orientable sphere bundle `S¹ ×̃ S²` are distinct primes; this is why the theorem carries
  `TauCeti.Orientable`.
- `S³` is the empty connected sum; uniqueness is up to `S³` summands, so `S³ # S³ ≅ S³` is not
  a second decomposition.
- `S² × S¹` contains, for every `N`, the `N` disjoint essential spheres `S² × {t_i}`; they are
  pairwise parallel, the complementary pieces are copies of `S² × [0, 1]`, punctured spheres,
  and a sphere bound without the punctured-sphere condition fails on them. (`S² × S¹` has a
  non-separating sphere, and its decomposition splits off that summand first.)
- In `T³`, which is irreducible, any number of disjoint small spheres bounding balls are
  injective on `π₁` (the pinned `TauCeti.IsIncompressible`), so the surface finiteness fails
  for the pinned predicate; they are excluded by the condition that no surface is a sphere.

*Needs:* Layer 1.2, Layer 1.3, Layer 1.4, Layer 8.1, Layer 11.2; Tau Ceti
`TauCeti.IsSphereBoundsBall`, `TauCeti.Orientable`.

### 8.3 Incompressible surfaces and Haken manifolds

A surface `S ⊂ M` is incompressible when it is `TauCeti.IsIncompressible`: an embedding
injective on `π₁` at every base point; a compact orientable irreducible `3`-manifold containing
a properly embedded bicollared incompressible compact surface with nonempty boundary or
infinite fundamental group (for a closed orientable surface, positive genus) is Haken
(`TauCeti.IsHakenSurfaceEmbedding`). Prove
that a compact orientable irreducible `3`-manifold with infinite first homology is Haken,
that an incompressible surface in an irreducible `3`-manifold can be isotoped to be a normal
surface with respect to any triangulation, and the existence of a Haken hierarchy: a Haken
manifold is cut by finitely many successive incompressible surfaces into balls (Haken,
Waldhausen; Hatcher, Chapter 3). Prove Waldhausen's theorem that a homotopy equivalence
between closed Haken manifolds is homotopic to a homeomorphism (Waldhausen, *On irreducible
3-manifolds which are sufficiently large*, Ann. of Math. 87 (1968)).

**Checks.**
- The torus `T² × {pt} ⊂ T³` is incompressible, so `T³` is Haken; every embedded sphere is
  incompressible under the pinned definition, since `π₁(S²) = 1` makes injectivity on `π₁`
  automatic, which is why the Haken predicate additionally asks for nonempty boundary or
  infinite fundamental group: a definition of Haken through incompressibility alone would
  make every irreducible `3`-manifold Haken on account of a sphere bounding a ball.
- Lens spaces have finite fundamental group, hence contain no incompressible surface of
  positive genus and are not Haken.
- The Weeks manifold is not Haken but is virtually Haken by Agol's theorem (Layer 7.4).

*Needs:* Tau Ceti `TauCeti.IsIncompressible`, `TauCeti.IsHakenSurfaceEmbedding`,
`TauCeti.IsPossiblyNonorientableHakenThreeManifold`; Layer 8.2, Layer 11.2.

### 8.4 Seifert fibred spaces

Consume `TauCeti.IsSeifertFibration r` (every point has a chart to the standard fibred solid
torus `TauCeti.SolidTorus` with `TauCeti.SolidTorus.fiberSetoid p q`) and `TauCeti.IsSeifertFibered`.
That every fibre is a circle is Tau Ceti's `TauCeti.IsSeifertFibration.nonempty_homeomorph_circle`.
Prove the rest of the basic structure: the exceptional fibres are isolated, the quotient by
the fibres is a `2`-orbifold whose underlying space is a surface, and a compact connected
Seifert fibred space is determined up to fibre-preserving homeomorphism by its Seifert
invariants: the genus and orientability of the base, the number of boundary components, the
orientation character of the fibres along loops of the base (which loops reverse the
direction of the fibre), the normalized pairs `(α₁, β₁), …, (αₖ, βₖ)` of the exceptional
fibres up to permutation, and the Euler obstruction `b` when the base is closed (Seifert, Acta Math. 60 (1933); Scott, *The
geometries of 3-manifolds*, Bull. London Math. Soc. 15 (1983), §3). For an orientable total
space the orientation character is determined by the base, and the invariants reduce to
Hatcher's `M(±g, b; α₁/β₁, …, αₖ/βₖ)`, the sign recording orientability of the base. Prove
that a torus-knot exterior is Seifert fibred with two exceptional fibres of multiplicities `p`
and `q`, and that lens spaces are Seifert fibred. Prove that in a compact connected irreducible
Seifert fibred space every essential surface (a connected compact properly embedded surface
that is incompressible and `∂`-incompressible, or a sphere not bounding a ball, or a disc
that is not `∂`-parallel, incompressibility being Hatcher's notion of Layer 8.2) is isotopic
to a vertical surface, a union of regular fibres, or a horizontal one, transverse to all
fibres (Hatcher, Proposition 1.12, with the definitions of `∂`-incompressible and essential
surfaces in §1.2). Prove that a compact connected Seifert fibred space is irreducible unless
it is `S¹ × S²`, `S¹ ×̃ S²` or `ℝP³ # ℝP³` (Hatcher, Proposition 1.13), and that Seifert
fibrations of compact connected orientable Seifert fibred spaces are unique up to
fibre-preserving homeomorphism except for the fibrations listed in Hatcher, Theorem 2.3: the
model fibrations of `S¹ × D²`, two fibrations each of `S¹ ×̃ S¹ ×̃ [0, 1]` and of
`S¹ ×̃ S¹ ×̃ S¹`, the fibrations of `S³`, `S¹ × S²` and the lens spaces over the sphere with at
most two exceptional fibres, and the family `M(0, 0; 1/2, −1/2, α/β) = M(−1, 0; β/α)`.

**Checks.**
- `S¹ × F` for a surface `F` is Seifert fibred without exceptional fibres
  (`TauCeti.isSeifertFibered_prod_circle`); `S³` is Seifert fibred by the Hopf fibration
  with no exceptional fibres and by the `(p, q)` fibrations with two exceptional fibres.
- The trefoil exterior is Seifert fibred with exceptional fibres of multiplicities `2` and `3`;
  the figure-eight exterior is not Seifert fibred, since it is hyperbolic (Layer 7.3).
- The solid torus has infinitely many Seifert fibrations (`fiberSetoid p q` for coprime `p, q`),
  the first exception to uniqueness.
- `ℝP³ # ℝP³` is Seifert fibred, glued from two twisted `[0, 1]`-bundles over `ℝP²`, and
  reducible, with infinite fundamental group `C₂ ∗ C₂`; the separating sphere between the two
  summands does not bound a ball. A list of reducible Seifert fibred spaces with only the two
  sphere bundles fails on it.
- In `T³ = S¹ × T²` a small sphere bounding a ball is injective on `π₁`, trivially, but has
  Euler characteristic `2` and is neither vertical nor horizontal (both have Euler
  characteristic `0` over the torus base without exceptional fibres); it is not essential,
  which is why the vertical-or-horizontal theorem is stated for essential surfaces. A
  coordinate torus `S¹ × C`, `C` a simple closed curve of `T²`, is essential and vertical.
- The circle bundles `T³ → T²` and `K × S¹ → T²`, `K` the Klein bottle fibred over a circle
  factor of `T²`, both have base of genus one, a section and no exceptional fibres; their total
  spaces differ in orientability, and the two fibrations differ only in the orientation
  character of the fibres, trivial for `T³` and nontrivial for `K × S¹`. Invariants consisting
  of the genus, `b` and the exceptional pairs alone would not separate them.

*Needs:* Tau Ceti `TauCeti.IsSeifertFibration`, `TauCeti.IsSeifertFibered`, `TauCeti.SolidTorus`,
`TauCeti.SolidTorus.fiberSetoid`; Layer 5.1, Layer 8.3; SurfaceTopology Layer 8.

### 8.5 The JSJ theorem

State `TauCeti.JSJTheorem`: every closed orientable irreducible `3`-manifold has a
`TauCeti.IsJSJDecomposition`, a minimal finite family of disjoint locally flat incompressible
tori whose complementary components are Seifert fibred or atoroidal, and any two such
families are carried onto each other by an ambient isotopy (Jaco–Shalen, Mem. Amer. Math.
Soc. 220 (1979); Johannson, Lecture Notes in Math. 761 (1979); Hatcher, Theorem 1.9, with
the proof through Lemmas 1.10–1.18). `Suggested.lean` states it as `jsj_theorem`. The proof is
GeometricTopology, Part II's, by Hatcher's route from Layers 8.1–8.4: Kneser finiteness bounds a maximal system of incompressible tori, the
characteristic property of the Seifert pieces is Proposition 1.12, and uniqueness follows
from the analysis of annuli in the pieces (Proposition 1.14, Corollary 1.15 and
Lemmas 1.16–1.18).

- The number of tori of a JSJ decomposition is an invariant (`TauCeti.JSJTheorem.card_eq`).
- The empty family is a JSJ decomposition exactly when `M` itself is Seifert fibred or
  atoroidal (`TauCeti.isJSJDecomposition_of_isEmpty`); in particular the pinned minimality
  excludes redundant tori.

**Checks.**
- `T³` is Seifert fibred, so its JSJ decomposition is empty; the single coordinate torus
  `T² × {pt}` is a torus decomposition whose proper subfamily, the empty family, is also one,
  so it is not minimal and not a JSJ decomposition.
- A torus bundle over the circle with Anosov monodromy has one JSJ torus, the fibre: it is
  irreducible, not Seifert fibred, not atoroidal, and cutting along the fibre leaves
  `T² × (0, 1)`, which is Seifert fibred.
- A closed hyperbolic `3`-manifold is atoroidal (Layer 7.3), so its JSJ decomposition is
  empty.
- Gluing two trefoil exteriors along their boundary tori by a diffeomorphism matching
  meridian to longitude produces a graph manifold whose JSJ decomposition is the single
  gluing torus, with two Seifert fibred pieces.

*Needs:* Tau Ceti `TauCeti.JSJTheorem`, `TauCeti.IsJSJDecomposition`, `TauCeti.IsTorusDecomposition`,
`TauCeti.IsAtoroidal`, `TauCeti.IsPeripheralTorus`; Layer 8.2, Layer 8.3, Layer 8.4; Layer 11.2.

### 8.6 Geometrization and the Poincaré conjecture

The geometrization theorem is the pinned `TauCeti.GeometrizationConjecture`: every closed
orientable irreducible `3`-manifold has a `TauCeti.IsGeometricTorusDecomposition`, a finite
family of disjoint locally flat incompressible tori whose complementary components are
Seifert fibred or `TauCeti.IsFiniteVolumeHyperbolic` (Thurston, Bull. Amer. Math. Soc. 6
(1982), Conjecture 1.1; Perelman, arXiv math/0211159, math/0303109, math/0307245; Kirby's
Problem 3.45). `Suggested.lean` states it as `geometrization_conjecture`. Prove its
topological consequences: the Poincaré conjecture, every closed simply connected
`3`-manifold is homeomorphic to `S³` (Morgan–Tian, *Ricci Flow and the Poincaré Conjecture*,
Clay Math. Monographs 3 (2007), Corollary 0.2(a), the special case of their Theorem 0.1 on
closed `3`-manifolds whose fundamental group is a free product of finite and infinite cyclic
groups), stated as `poincare_conjecture`; the elliptization of closed `3`-manifolds with finite
fundamental group (Morgan–Tian, Corollary 0.2(b)); and the comparison with Thurston's
formulation through the eight model geometries `TauCeti.ModelGeometry`: a closed orientable
Seifert fibred manifold carries one of the six geometries `S³`, `E³`, `S² × ℝ`, `ℍ² × ℝ`,
`Nil`, `SL₂~` according to its Euler number and base orbifold Euler characteristic, the
`Sol` manifolds are the torus bundles and semi-bundles with hyperbolic monodromy, and the
remaining pieces are hyperbolic (Scott, §4). The analytic proof through Ricci flow with
surgery is RicciFlow's work; this roadmap owns the statement and every reduction above.

**Checks.**
- `S³` is simply connected and irreducible, and its geometric torus decomposition is empty
  with the single Seifert fibred piece `S³`; the Poincaré conjecture returns `S³` itself.
- `T³` has the `E³` geometry and the empty decomposition; the Anosov torus bundle has `Sol`
  geometry as a whole, while its geometric torus decomposition has one torus and a
  Seifert fibred piece `T² × (0, 1)`: the decomposition statement and the eight-geometry
  statement differ exactly here.
- The Poincaré homology sphere has finite fundamental group of order `120`, so by
  elliptization it is `S³/Γ` for the binary icosahedral group `Γ`, and it is not simply
  connected, so the Poincaré conjecture does not identify it with `S³`.
- A closed orientable `3`-manifold with `π₁ = ℤ` is `S¹ × S²`, which is not irreducible: the
  hypothesis `TauCeti.IsSphereBoundsBall` in the pinned statement is what excludes it, and
  the prime decomposition of Layer 8.2 reduces the general closed case to it.

*Needs:* Tau Ceti `TauCeti.GeometrizationConjecture`, `TauCeti.IsGeometricTorusDecomposition`,
`TauCeti.IsFiniteVolumeHyperbolic`, `TauCeti.ModelGeometry`, `TauCeti.HasGeometricStructure`;
Layer 7.1, Layer 7.3, Layer 8.2, Layer 8.4, Layer 8.5; Mathlib `SimplyConnectedSpace`.

### Examples

`S¹ × S²` as the prime non-irreducible manifold; `T³` and the Anosov torus bundle as
contrasting JSJ examples; the trefoil and figure-eight exteriors as Seifert fibred and
hyperbolic knot exteriors; the Poincaré homology sphere.

### Dependencies

Layer 1 (connected sums, gluing), Layer 5 (exteriors, fillings), Layer 7 (hyperbolic
structures), Layer 11.2 (PL structures in dimension three); Tau Ceti's irreducibility,
incompressibility, Seifert fibration, torus decomposition and geometrization carriers;
SurfaceTopology Layer 8.

## Layer 9: Heegaard splittings

### 9.1 Handlebodies and Heegaard splittings

Define the standard orientable handlebody of genus `g` as the regular neighbourhood in `ℝ³` of
a wedge of `g` circles in a plane, a compact orientable `3`-manifold with boundary the closed
surface of genus `g`; prove it is the boundary connected sum of `g` solid tori and is
determined up to diffeomorphism by `g`. Define a Heegaard splitting of a closed connected
orientable `3`-manifold `M` as a decomposition `M = H₁ ∪_φ H₂` into two handlebodies of the
same genus glued by a diffeomorphism `φ` of their boundaries reversing the induced
orientations (Layer 1.3), and prove existence: every closed connected orientable
`3`-manifold has a Heegaard splitting, from a triangulation (Layer 11.2) as the regular
neighbourhoods of the `1`-skeleton and of the dual `1`-skeleton (Scharlemann, *Heegaard
splittings of compact 3-manifolds*, arXiv math/0007144, §2.1). Prove that isotopic gluing maps
give diffeomorphic manifolds, that `φ` matters only through its mapping class
(SurfaceTopology Layer 9), and that a splitting may be stabilized by adding a trivial
handle, raising the genus by one.

- Non-orientable closed `3`-manifolds also have splittings, into non-orientable handlebodies
  (boundary sums of solid Klein bottles); they are not instances of the orientable
  definition, which is why the theorem above is stated for orientable `M`.
- Reidemeister–Singer: any two Heegaard splittings of `M` become isotopic after finitely
  many stabilizations of each (Scharlemann, §3).
- Waldhausen: every positive-genus splitting of `S³` is a stabilization of the genus-zero
  splitting (Waldhausen, Topology 7 (1968); Scharlemann, Theorem 3.7).

**Checks.**
- The genus-zero handlebody is `D³`, and `S³ = D³ ∪_id D³` is its genus-zero splitting; the
  genus-one handlebody is the solid torus and `S³` has the genus-one splitting of Layer 1.3
  by the factor swap.
- `S¹ × S²` is two solid tori glued by the identity; `L(p, q)` is two solid tori glued by the
  map sending the meridian to a `(p, q)` curve, a genus-one splitting.
- `ℝP² × S¹` is closed and non-orientable, and no gluing of two orientable handlebodies along
  their connected boundary with compatible orientations produces it: the orientability
  hypothesis is necessary.
- The gluing map for `S¹ × S²` and for `S³` differ by the factor swap, which is not isotopic
  to the identity of the torus; the splitting depends on the mapping class of `φ`.

*Needs:* Layer 1.3, Layer 1.8, Layer 11.2; SurfaceTopology Layer 9; Tau Ceti `TauCeti.Orientable`.

### 9.2 Heegaard genus, rank and Li's theorem

Define the Heegaard genus `g(M)` of a closed connected orientable `3`-manifold as the least
genus of a Heegaard splitting, the minimum of a nonempty set of natural numbers by
Layer 9.1. Prove `rank π₁(M) ≤ g(M)`, where the rank is `Group.rank` of the finitely generated
`π₁(M)`, by van Kampen: `π₁(M)` is a quotient of `π₁(H₁)`, a free group of rank `g`. Prove
`g(M) = 0` iff `M ≅ S³`, `g(M) = 1` iff `M` is a lens space `L(p, q)` with `p ≥ 2` or
`S¹ × S²`, and
`g(M # N) ≤ g(M) + g(N)` by summing splittings along balls meeting the splitting surfaces in
discs (Scharlemann, §3.2), with equality by Haken's lemma, that every splitting of a reducible
manifold admits a reducing sphere meeting the splitting surface in a single circle
(Scharlemann, Theorem 3.4), which decomposes a splitting of `M # N` as a sum of splittings of
`M` and of `N`. State
Li's theorem: for every `k` there is a closed orientable hyperbolic `3`-manifold `M` with
`g(M) ≥ rank π₁(M) + k` (Li, *Rank and genus of 3-manifolds*, J. Amer. Math. Soc. 26 (2013),
Theorem 1.1, which gives the examples with arbitrarily large discrepancy). Li's theorem is
not statable at the pin: the Heegaard genus has no carrier there.

**Checks.**
- `L(1, q) ≅ S³` has genus `0`, although it has a genus-one splitting, stabilized from the
  genus-zero one; this is why the genus-one clause asks for `p ≥ 2`.
- `g(S³) = 0 = rank 1`; `g(S¹ × S²) = 1 = rank ℤ`; `g(L(p, q)) = 1 = rank ℤ/p` for `p ≥ 2`;
  `g(T³) = 3 = rank ℤ³`, the lower bound being the rank and the upper bound the standard
  splitting.
- The Poincaré homology sphere has `g = 2` and `rank = 2`, and `S³` has `g = 0`, so the genus
  is not determined by the homology.
- Li's examples have discrepancy at least `1`, and his construction gives discrepancy at
  least `k` for each `k`; a statement with a single strict inequality would be weaker than
  the theorem.
- The unknot's exterior `S¹ × D²` is a handlebody of genus one, so the exterior of a knot has
  a splitting of genus `1 + ` its tunnel number; the trefoil has tunnel number one.

*Needs:* Layer 9.1, Layer 7.3; Mathlib `Group.rank`, `FundamentalGroup`; Layer 8.2.

### Examples

The genus-zero and genus-one splittings of `S³`; `S¹ × S²` and the lens spaces as genus-one
manifolds; `T³` as a genus-three manifold.

### Dependencies

Layer 1.3 (gluing), Layer 1.8 (surfaces), Layer 11.2 (triangulations), Layer 8.2 (prime
decomposition), Layer 7.3 (hyperbolic manifolds for Li's examples); SurfaceTopology Layer 9;
Mathlib's group rank.

## Layer 10: foliations of 3-manifolds

Foliations exist at the pin: `TauCeti.Foliation I n M k` is a `C^n` foliation of leaf dimension
`k` given by an involutive distribution with flat charts, `TauCeti.Foliation.leaf` and
`SameLeaf` are its leaves, `TauCeti.Foliation.IsClosedTransversal` and `TauCeti.Foliation.Taut`
are tautness, and `TauCeti.Foliation.ofSubmodule` gives the linear foliations of a vector
space. This layer develops codimension-one foliations of closed `3`-manifolds up to
Novikov's theorem. The Euler class of a foliation and the Thurston norm are GeometricTopology,
Part II, since they rest on AlgebraicTopology's cohomology and duality.

### 10.1 Codimension-one foliations, Reeb components and Reeb stability

Define a transversely oriented codimension-one foliation of a closed orientable `3`-manifold
as a `TauCeti.Foliation` of leaf dimension `2` together with a nowhere vanishing vector field
transverse to its leaves. Define the Reeb component: the foliation of the solid torus
`S¹ × D²` whose boundary torus is a leaf and whose interior leaves are planes spiralling
towards the boundary, and the Reeb foliation of `S³` as the union of two Reeb components
glued along the torus of Layer 1.3. Prove Reeb stability: if a transversely oriented
codimension-one foliation of a closed connected `3`-manifold has a compact leaf with finite
fundamental group, then that leaf is a sphere, the manifold is `S² × S¹` and the foliation is
the product foliation (Reeb; Calegari, *Foliations and the Geometry of 3-Manifolds*, Theorem
4.5). Prove the existence theorem: every closed orientable `3`-manifold has a transversely
oriented codimension-one foliation (Lickorish, *A foliation for 3-manifolds*, Ann. of Math.
82 (1965), through the Lickorish–Wallace surgery description of Layer 5.2 and the insertion
of Reeb components along the surgery solid tori).

- A foliation with a Reeb component is not taut: the boundary torus of the component has no
  closed transversal through it, since a transversal entering the solid torus cannot leave it.
- The leaves of a codimension-one foliation of a compact manifold are either compact or
  accumulate on a minimal set; a compact leaf of a taut foliation is incompressible
  (Layer 10.2).

**Checks.**
- The product foliation of `S² × S¹` by spheres is taut, with closed transversal
  `{pt} × S¹`; Reeb stability says it is the only foliation of a closed `3`-manifold with a
  sphere leaf.
- The Reeb foliation of `S³` is not taut; the torus along which its two Reeb components are
  glued is a single leaf, the only compact leaf, and it is compressible, consistent with
  Layer 10.2.
- The linear foliations of `T³` by planes of irrational slope (`TauCeti.Foliation.ofSubmodule`
  descended to the quotient) are taut with every leaf dense; the foliations by rational
  slope have all leaves compact tori and are taut.
- The existence theorem applied to `S³` gives the Reeb foliation; it does not give a taut
  foliation, and by Layer 10.2 no taut foliation of `S³` exists.

*Needs:* Tau Ceti `TauCeti.Foliation`, `TauCeti.Foliation.leaf`, `TauCeti.Foliation.Taut`,
`TauCeti.Foliation.IsClosedTransversal`, `TauCeti.Foliation.ofSubmodule`; DifferentialGeometry
Layer 4 (Frobenius), Layer 3 (flows); Layer 1.3, Layer 5.2.

### 10.2 Novikov's theorem and taut foliations

Prove the Novikov–Rosenberg theorem: if a closed orientable `3`-manifold `M` carries a taut
transversely oriented codimension-one foliation and `M` is not finitely covered by `S² × S¹`,
then `M` is irreducible, every leaf is incompressible (the inclusion is injective on `π₁`),
and every closed transversal is essential in `π₁(M)` (Novikov, Trudy Moskov. Mat. Obšč. 14
(1965); Calegari, Theorem 4.35). Prove Novikov's theorem proper: a codimension-one foliation
of a closed `3`-manifold with a null-homotopic closed transversal, or with a leaf whose
inclusion is not injective on `π₁`, has a Reeb component (Calegari, §4.6). Prove that a
fibration of `M` over the circle by closed surfaces is a taut foliation, and that a taut
foliation pulls back to a taut foliation under finite covers.

- A closed connected orientable `3`-manifold with a taut transversely oriented codimension-one
  foliation that is not finitely covered by `S² × S¹` is aspherical and its universal cover is
  `ℝ³`: it is irreducible by the theorem, its fundamental group is infinite since a closed
  transversal is essential, and the universal cover of a manifold with a Reebless foliation
  other than `S² × S¹` is `ℝ³` (Palmeira, *Open manifolds foliated by planes*, Ann. of Math.
  108 (1978), 109–131; Calegari, Theorem 4.38).
- The leaves of a taut foliation realize the Thurston norm of their homology class
  (Thurston); the norm itself is Part II.

**Checks.**
- `S³` is simply connected, so a taut foliation of `S³` would have simply connected leaves and
  an essential closed transversal in the trivial group: `S³` carries no taut foliation,
  although it carries the Reeb foliation.
- The mapping torus of a diffeomorphism of a closed surface of genus `g ≥ 1` fibres over the
  circle, and the fibration is a taut foliation with compact incompressible leaves.
- The lens space `L(p, q)`, `p ≥ 2`, has finite fundamental group and is not finitely covered
  by `S² × S¹`, so it carries no taut foliation; it does carry a Reeb foliation from the
  genus-one splitting of Layer 9.1.
- `S² × S¹` itself is excluded from the theorem's hypothesis and is the counterexample to the
  conclusion: its product foliation is taut while `S² × S¹` is not irreducible. It also shows
  that the asphericity corollary needs the exclusion: its fundamental group `ℤ` is infinite,
  but its universal cover is `S² × ℝ`, with `π₂ = ℤ`, not `ℝ³`.

*Needs:* Layer 10.1, Layer 8.1, Layer 8.2, Layer 7.4 (fibrations), Layer 9.1; Tau Ceti
`TauCeti.FibersOverCircle`; Mathlib `FundamentalGroup`.

### Examples

The product foliation of `S² × S¹`; the Reeb foliation of `S³`; the linear foliations of
`T³`; the fibration of a mapping torus.

### Dependencies

Tau Ceti's foliations, leaves and tautness; DifferentialGeometry Layers 3 and 4; Layer 1.3
(gluing Reeb components), Layer 5.2 (surgery descriptions), Layers 8.1–8.2 (irreducibility),
Layer 9.1 (splittings).

## Layer 11: triangulations, PL structures and collapse

The simplicial carriers exist at the pin: `AbstractSimplicialComplex.Realization`, stars, links
and deletions, stellar subdivision, `PreAbstractSimplicialComplex.IsCombinatorialManifold` with
its spheres and balls, `Collapsible`, `TauCeti.IsTriangulable`,
`TauCeti.IsCombinatoriallyTriangulable`, `TauCeti.TriangulationConjecture n` and
`TauCeti.ZeemanConjecture`. This layer joins them to Layer 1's PL manifolds, proves the
three-dimensional and smooth triangulation theorems, and states Manolescu's theorem and
Zeeman's conjecture.

### 11.1 The realization and its CW structure

Prove, for an abstract simplicial complex `K`, that the realization `Realization K` is
Hausdorff, that every compact subset lies in the realization of a finite subcomplex (Hatcher,
*Algebraic Topology*, Appendix, Proposition A.1, for the CW structure built below), that
simplicial maps realize to continuous maps functorially, that the realization of a stellar
subdivision is canonically homeomorphic to the realization of `K`, and that for a face `σ`
the closed star of `σ` is the join `σ ∗ Lk(σ)` and the boundary of a conical neighbourhood of
the barycentre of `σ` is the join `∂σ ∗ Lk(σ)`, with the convention `∅ ∗ X = X`
(Rourke–Sanderson, Chapter 2, the star and link of a simplex and their joins). For a vertex
`∂σ` is empty and this boundary is the realized link itself; for a face of positive
dimension the link is only the part transverse to `σ`. Construct the
CW structure on `Realization K` whose closed cells are the realized simplices, as an instance
of Mathlib's `Topology.CWComplex`, and prove that a homeomorphism transports a CW structure:
for `e : X ≃ₜ Y` and a CW structure on `X`, the images of the cells form a CW structure on `Y`
with the pushed-forward characteristic maps.

**Checks.**
- The realization of the boundary of the standard `n`-simplex is homeomorphic to `Sⁿ⁻¹` for
  `n ≥ 1`; for `n = 0` the boundary has no nonempty face and its realization is empty.
- The realization of the two-point complex `⊥` on a type with two elements is the discrete
  two-point space `S⁰`; its CW structure has two `0`-cells and no other cells.
- The link of a maximal face is empty and the link of a vertex of the triangle boundary is
  `S⁰`; the conical-neighbourhood law gives the open star of the vertex as the cone on `S⁰`.
- In the complex consisting of one closed edge `e` and its two vertices, `Lk(e) = ∅`, while a
  neighbourhood of the midpoint of `e` is an interval with boundary two points; the join law
  gives `∂e ∗ ∅ = S⁰`, as it should. A law identifying the boundary with the link alone fails
  on this edge.
- An infinite locally finite complex, the triangulation of `ℝ` by unit intervals, has a
  non-compact realization, and a compact subset meets only finitely many simplices.

*Needs:* Tau Ceti `AbstractSimplicialComplex.Realization`, `PreAbstractSimplicialComplex.link`,
`closedStar`, stellar subdivision; Mathlib `Topology.CWComplex`, `AbstractSimplicialComplex`.

### 11.2 Triangulations and PL structures in dimension three

Prove Moise's theorems: every topological `3`-manifold is triangulable, `TauCeti.IsTriangulable`,
by a combinatorial triangulation, and any two triangulations of a `3`-manifold have a
common subdivision, so a `3`-manifold has a PL structure in the sense of Layer 1.7 unique
up to PL homeomorphism isotopic to the identity (Moise, *Geometric Topology in Dimensions 2
and 3*, Theorems 35.3 and 36.2; Bing, Ann. of Math. 69 (1959)). Prove that every PL
`3`-manifold admits a smooth structure compatible with its PL structure, unique up to
diffeomorphism (Munkres, *Elementary Differential Topology*, §10, together with the
vanishing of the smoothing obstruction in dimension three), so that a topological
`3`-manifold has a unique smooth structure and a homeomorphism between smooth `3`-manifolds
is isotopic to a diffeomorphism. Relative versions keep a given structure on a neighbourhood
of a closed subset.

- Dimension two is PlanarTopology Layer 5 (Radó) and Layer 8; dimension one is the
  classification of `1`-manifolds.
- These are the theorems that let Layers 5, 8 and 9 pass freely between topological, PL and
  smooth `3`-manifolds.

**Checks.**
- `S³` has exactly one smooth structure up to diffeomorphism, and its PL structures are all
  equivalent; the theorem returns the standard one.
- Dimension four is excluded: `ℝ⁴` has uncountably many smooth structures and the `E₈`
  manifold has no PL structure, so no `n`-independent form of the theorem is stated.
- A triangulation of `S³` as the boundary of the `4`-simplex and as the join of two triangle
  boundaries have a common subdivision, as the Hauptvermutung asserts.

*Needs:* Tau Ceti `TauCeti.IsTriangulable`, `TauCeti.IsCombinatoriallyTriangulable`,
`TauCeti.PLGroupoid`; Layer 1.7, Layer 11.1; PlanarTopology Layers 5 and 8.

### 11.3 Smooth triangulations and combinatorial manifolds

Prove the Cairns–Whitehead theorem: every smooth manifold admits a smooth triangulation, a
homeomorphism from a realization whose restriction to each closed simplex is a smooth
embedding with injective differential, unique up to PL homeomorphism (Whitehead, *On
C¹-complexes*, Ann. of Math. 41 (1940); Munkres, Theorems 10.5 and 10.6). Hence every smooth
manifold is a PL manifold in the sense of Layer 1.7, and the PL structure is unique. Prove
that the realization of a combinatorial `n`-manifold (`IsCombinatorialManifold K n`, locally
finite with countably many vertices) is a PL `n`-manifold, and that every PL manifold admits a
combinatorial triangulation (Rourke–Sanderson, *Introduction to Piecewise-Linear Topology*,
Chapter 3), so that the chart-based and link-based definitions agree. Prove that the
boundary of a combinatorial manifold, the vertices with ball links, is a combinatorial
manifold of one dimension less.

- Triangulability, combinatorial triangulability, PL structure and smoothability are four
  predicates with implications `smooth ⟹ PL ⟺ combinatorially triangulable ⟹ triangulable`;
  the converses of the two one-way implications fail: `E8 × S¹`, `E8` Freedman's
  four-manifold, is a closed `5`-manifold that is triangulable but has no PL structure, and
  closed PL manifolds without smooth structure exist from dimension `8` on (Manolescu,
  *Lectures on the triangulation conjecture*, arXiv 1607.08163, §2, the diagram at the end of
  the section). The proof that `E8 × S¹` is triangulable is the Galewski–Stern–Matumoto
  criterion, part of the TOP/PL comparison of GeometricTopology, Part II.
- Recognizing a combinatorial sphere is undecidable in dimension at least five (Novikov), so
  the link condition is a mathematical, not a computational, criterion.

**Checks.**
- The boundary of the `(n+1)`-simplex is a combinatorial `n`-manifold
  (`isCombinatorialManifold_simplexBoundary`), and the standard `n`-simplex is a
  combinatorial `n`-ball with boundary the simplex boundary.
- A single vertex is a combinatorial `0`-manifold with empty link; the pinned definition
  handles `n = 0` by pattern matching, and a definition using `n − 1` in `ℕ` would require a
  `0`-sphere link of two vertices that the point does not have.
- The suspension `ΣP` of the Poincaré homology sphere `P` is not a manifold: a punctured
  neighbourhood of a suspension vertex is `P × (0, 1)`, with fundamental group the binary
  icosahedral group of order `120`, whereas a punctured ball in `ℝ⁴` is simply connected. The
  double suspension `Σ²P` is homeomorphic to `S⁵` (Cannon–Edwards), and its triangulation
  induced from one of `P` is not combinatorial: the link of a vertex of the suspension circle
  is `ΣP`, not a manifold and so not a combinatorial `4`-sphere (Manolescu, Example 2.2).
  So a triangulation of a PL manifold need not be combinatorial, although `S⁵` has a PL
  structure: this example distinguishes triangulations, not manifolds.
- The smooth triangulation of `S²` by the boundary of the tetrahedron, radially projected, has
  each face a smooth embedding of the triangle; the realization homeomorphism is not smooth
  across edges, as the definition does not require.

*Needs:* Tau Ceti `PreAbstractSimplicialComplex.IsCombinatorialManifold`, `IsCombinatorialSphere`,
`IsCombinatorialBall`, `TauCeti.PLGroupoid`; Layer 1.7, Layer 11.1.

### 11.4 Manolescu's theorem

The triangulation conjecture in dimension `n` is the pinned `TauCeti.TriangulationConjecture n`:
every closed topological `n`-manifold is triangulable. It holds for `n ≤ 3` by Radó
(PlanarTopology Layer 5) and Moise (Layer 11.2), and it fails for every `n ≥ 5`: there is a
closed `n`-manifold admitting no simplicial triangulation (Manolescu, *Pin(2)-equivariant
Seiberg–Witten Floer homology and the triangulation conjecture*, J. Amer. Math. Soc. 29 (2016),
Corollary 1.3; survey arXiv 1607.08163, Theorem 1.1). `Suggested.lean` states it as
`manolescu_triangulation_conjecture_false`. The reduction of Galewski–Stern and Matumoto to
the existence of a homology `3`-sphere of Rokhlin invariant one that has order two in the
homology cobordism group, and its refutation by the `β` invariant, are gauge theory and not
owned here; the topological statement and its specializations are.

**Checks.**
- In dimension `5` the known non-triangulable examples are non-orientable, and every closed
  orientable `5`-manifold is triangulable (Siebenmann, Galewski–Stern, Matumoto; Manolescu,
  the discussion after Corollary 1.3); the orientable examples begin in dimension `6`. The
  headline therefore quantifies over closed manifolds without an orientability clause.
- `TauCeti.TriangulationConjecture 0` holds (`TauCeti.triangulationConjecture_zero`), and so do
  dimensions `1`, `2`, `3`; dimension `4` fails as well, by Freedman's `E₈` manifold (Casson), a
  statement whose carrier is not at the pin and belongs to FourManifolds.
- A non-triangulable closed manifold is in particular not a PL manifold; the converse
  direction is the Kirby–Siebenmann theory of Part II.

*Needs:* Tau Ceti `TauCeti.TriangulationConjecture`, `TauCeti.IsTriangulable`; Layer 11.2.

### 11.5 Collapse and Zeeman's conjecture

Consume `PreAbstractSimplicialComplex.IsFreePair`, `ElementaryCollapsesTo`, `CollapsesTo` and
`Collapsible`. Prove that an elementary collapse induces a strong deformation retraction of
realizations, so a collapsible complex has contractible realization. Define the dunce hat and Bing's house as
finite `2`-complexes and prove they are contractible but not collapsible (they have no free
face). Zeeman's conjecture is the pinned `TauCeti.ZeemanConjecture`: for every finite
contractible complex `K` of dimension at most two, the ordered cylinder
`AbstractSimplicialComplex.orderedCylinder K` is collapsible (Zeeman, *On the dunce hat*,
Topology 2 (1964); Kirby's Problem 5.2). It is open, so it is stated and not asserted; prove
Zeeman's own cases, that the cylinder on the dunce hat is collapsible, and that the
conjecture implies the Poincaré conjecture (Zeeman 1964).

**Checks.**
- A finite tree collapses to a vertex; the boundary of a triangle has no free face and is not
  collapsible, nor contractible.
- The dunce hat is contractible and not collapsible, so collapsibility is strictly stronger
  than contractibility; its cylinder is collapsible, which is the first nontrivial instance
  of the conjecture.
- The ordered cylinder of a single vertex is an interval, which collapses to a vertex.
- An infinite locally finite triangulation of the plane is contractible but not finite, so it
  is not an instance of `Contractible2Complex` and not a counterexample to the conjecture.

*Needs:* Tau Ceti `PreAbstractSimplicialComplex.Collapsible`, `ElementaryCollapsesTo`,
`AbstractSimplicialComplex.Contractible2Complex`, `AbstractSimplicialComplex.orderedCylinder`,
`TauCeti.ZeemanConjecture`; Layer 11.1.

### Examples

The boundary of the simplex as a combinatorial sphere; the double suspension of the Poincaré
sphere as a non-combinatorial triangulation of `S⁵`; `E8 × S¹` as a triangulable manifold with
no PL structure; the dunce hat; the tetrahedral smooth triangulation of `S²`.

### Dependencies

Tau Ceti's simplicial complexes, realizations, combinatorial manifolds, collapse,
triangulability and the two propositions; Layer 1.7 (PL manifolds); PlanarTopology Layers 5
and 8; Mathlib CW complexes.

## Downstream consumers

- **AlgebraicTopology** consumes Layer 11.1's CW structure on realizations and the transport
  of CW structures along homeomorphisms, and Layer 1's boundary and collar constructions.
- **CharacteristicClasses**, **GeneralizedCohomology**, **TopologicalKTheory**,
  **MorseTheory**, **RiemannianGeometry**, **IndexTheory**, **HomotopySpheres**,
  **AffineMorseLefschetz** and **ComplexKahlerGeometry** consume Layer 1: collars, gluing,
  connected sums, tubular neighbourhoods and the metric-independent normal bundle, and the
  handle decompositions.
- **MorseTheory** also consumes Layer 2.2's generalized Schoenflies theorem for a bicollared
  sphere, which is proved here and is the topological input of its target M4.1.
- **TeichmullerGeometry** consumes Layer 3's topological group `Diff(M)` and isotopy
  extension.
- **KhovanovHomology** and **CombinatorialHeegaardFloer** consume Layer 4's geometric and
  combinatorial presentations and the comparison theorems between them.
- **FourManifolds** consumes Layers 1, 2 and 6 and owns the four-dimensional theorems this
  roadmap states (the dimension-four annulus theorem and Freedman's theorem).
- **TangentialBordism** consumes Layer 1's gluing and Layer 11.3's smooth triangulations.
- **GeometricTopology, Part II** consumes every layer and owns the developments listed under
  *Scope and ownership*.

## References

- R. Kirby (ed.), *Problems in Low-Dimensional Topology*, in *Geometric Topology* (Athens,
  GA, 1993), AMS/IP Stud. Adv. Math. 2.2 (1997): Problems 1.15 (Property P), 1.16 (Property
  R), 1.31 (concordance in homology spheres), 1.36 (Alexander polynomial one), 1.53
  (mutation and concordance), 1.81 (cosmetic surgery), 3.45 (geometrization), 3.51 (virtual
  fibering), 3.60 (minimal volume), 4.34 (Smale conjecture), 4.126 (four-dimensional Smale
  conjecture), 5.2 (Zeeman's conjecture).
- A. Hatcher, *Notes on Basic 3-Manifold Topology*, https://pi.math.cornell.edu/~hatcher/3M/3Mfds.pdf:
  Theorem 1.1, Proposition 1.4, Theorem 1.5 (with the Basic Fact in its proof),
  Proposition 1.7, Theorem 1.9, Lemmas 1.10–1.11, Propositions 1.12–1.14,
  Corollary 1.15, Lemmas 1.16–1.18, Theorem 2.3, Chapter 3.
- M. Hirsch, *Differential Topology*, Springer GTM 33 (1976): Chapter 2 §1; Chapter 4,
  Theorems 5.3, 6.1, 6.3, 6.6; Chapter 8, Theorems 1.3 and 3.1. J. Lee, *Introduction to
  Smooth Manifolds*, 2nd ed., Springer GTM 218 (2013): Theorems 6.24, 9.25, 9.26. J. Lee,
  *Introduction to Riemannian Manifolds*, 2nd ed., Springer GTM 176 (2018): Theorem 5.25.
- J. Milnor, *Lectures on the h-Cobordism Theorem*, Princeton (1965): §§2–3, Theorems 5.4 and
  6.6. R. Palais, *Extending diffeomorphisms*, Proc. Amer. Math. Soc. 11 (1960), 274–277;
  *Local triviality of the restriction map for embeddings*, Comment. Math. Helv. 34 (1960),
  305–312. J. Cerf, *Topologie de certains espaces de plongements*, Bull. Soc. Math. France 89
  (1961), 227–380.
- C. Rourke, B. Sanderson, *Introduction to Piecewise-Linear Topology*, Springer (1972),
  Chapters 2 and 3. A. Hatcher, *Algebraic Topology*, Cambridge (2002),
  https://pi.math.cornell.edu/~hatcher/AT/AT.pdf, Appendix, Proposition A.1. J. Munkres, *Elementary Differential Topology*, Ann. of Math. Stud. 54 (1966),
  §10, Theorems 10.5 and 10.6. J. H. C. Whitehead, *On C¹-complexes*, Ann. of Math. 41 (1940),
  809–824. E. Moise, *Geometric Topology in Dimensions 2 and 3*, Springer GTM 47 (1977),
  Theorems 35.3 and 36.2. R. H. Bing, *An alternative proof that 3-manifolds can be
  triangulated*, Ann. of Math. 69 (1959), 37–65.
- M. Brown, *A proof of the generalized Schoenflies theorem*, Bull. Amer. Math. Soc. 66 (1960),
  74–76; *Locally flat imbeddings of topological manifolds*, Ann. of Math. 75 (1962), 331–341.
  R. Kirby, *Stable homeomorphisms and the annulus conjecture*, Ann. of Math. 89 (1969),
  575–582. F. Quinn, *Ends of maps III: dimensions 4 and 5*, J. Differential Geom. 17 (1982),
  503–521. R. Daverman, G. Venema, *Embeddings in Manifolds*, AMS GSM 106 (2009).
- J. Cerf, *Sur les difféomorphismes de la sphère de dimension trois (Γ₄ = 0)*, Lecture Notes
  in Math. 53 (1968), Théorème 1 and Corollaire 1. A. Hatcher, *A proof of the Smale
  conjecture, Diff(S³) ≃ O(4)*, Ann. of Math. 117 (1983), 553–607. S. Smale, *Diffeomorphisms
  of the 2-sphere*, Proc. Amer. Math. Soc. 10 (1959), 621–626. T. Watanabe, *Some exotic
  nontrivial elements of the rational homotopy groups of Diff(S⁴)*, arXiv 1812.02448,
  Theorem 1.1.
- W. B. R. Lickorish, *An Introduction to Knot Theory*, Springer GTM 175 (1997): Chapter 1
  (diagrams, Reidemeister moves, braids), Chapter 2 (Theorems 2.2, 2.4, 2.12), Chapter 3
  (Theorem 3.5, Proposition 3.7), Chapter 5, Chapter 6 (Theorem 6.5), Chapter 8 (Theorems
  8.6, 8.9, 8.19), Chapter 9, Chapter 10, Chapter 12, Chapter 15, Chapter 16 (Proposition
  16.10). G. Burde, H. Zieschang, *Knots*, 2nd ed., de Gruyter (2003), Chapter 1. D. Rolfsen,
  *Knots and Links*, Publish or Perish (1976), Chapter 9. J. Birman, *Braids, Links, and
  Mapping Class Groups*, Ann. of Math. Stud. 82 (1974), Chapter 2.
- P. Freyd, D. Yetter, J. Hoste, W. B. R. Lickorish, K. Millett, A. Ocneanu, *A new polynomial
  invariant of knots and links*, Bull. Amer. Math. Soc. 12 (1985), 239–246. V. Turaev, *A
  simple proof of the Murasugi and Kauffman theorems on alternating links*, L'Enseignement
  Math. 33 (1987), 203–225. C. Armond, A. Lowrance, *Turaev genus and alternating
  decompositions*, Algebr. Geom. Topol. 17 (2017), arXiv 1507.02771, §2. H. Morton, *Seifert
  circles and knot polynomials*, Math. Proc. Cambridge Philos. Soc. 99 (1986), 107–109.
  J. Franks, R. Williams, *Braids and the Jones polynomial*, Trans. Amer. Math. Soc. 303
  (1987), 97–108.
- H. Schubert, *Über eine numerische Knoteninvariante*, Math. Z. 61 (1954), 245–288; *Knoten
  mit zwei Brücken*, Math. Z. 65 (1956), 133–170. L. Kauffman, S. Lambropoulou, *On the
  classification of rational knots*, L'Enseignement Math. 49 (2003), arXiv math/0212011,
  Theorems 1–3. Y. Hashizume, *On the uniqueness of the decomposition of a link*, Osaka Math.
  J. 10 (1958), 283–300. S. Melikhov, *Local knots and the prime factorization of links*,
  arXiv 2511.19579, §§2–3.
- F. Garside, *The braid group and other groups*, Quart. J. Math. Oxford 20 (1969), 235–254.
  D. Epstein et al., *Word Processing in Groups*, Jones and Bartlett (1992), Chapter 9.
  E. Elrifai, H. Morton, *Algorithms for positive braids*, Quart. J. Math. Oxford 45 (1994),
  479–497.
- H. Kondo, *Knots of unknotting number 1 and their Alexander polynomials*, Osaka J. Math. 16
  (1979), 551–559, Theorem 3, the linear system (*) and formula (8). M. Scharlemann,
  *Unknotting number one knots are prime*, Invent. Math. 82 (1985), 37–55. T. Kanenobu, H. Murakami, *Two-bridge knots with
  unknotting number one*, Proc. Amer. Math. Soc. 98 (1986), 499–502. S. Taylor, *Adding
  2-handles to sutured manifolds*, arXiv 0806.1572, for a second proof. C. Ernst, D. Sumners, *The growth of the
  number of prime knots*, Math. Proc. Cambridge Philos. Soc. 102 (1987), 303–315. O. Bernardi,
  *Bijective counting of tree-rooted maps and shuffles of parenthesis systems*, Electron. J.
  Combin. 14 (2007), arXiv math/0601684, Theorem 1.
- P. Kronheimer, T. Mrowka, *Witten's conjecture and Property P*, Geom. Topol. 8 (2004),
  295–310, arXiv math/0311489. D. Gabai, *Foliations and the topology of 3-manifolds III*,
  J. Differential Geom. 26 (1987), 479–536, §8. Y. Mathieu, *Closed 3-manifolds unchanged by
  Dehn surgery*, J. Knot Theory Ramifications 1 (1992), 279–296. M. Culler, C. Gordon, J. Luecke, P. Shalen,
  *Dehn surgery on knots*, Ann. of Math. 125 (1987), 237–300. L. Moser, *Elementary surgery
  along a torus knot*, Pacific J. Math. 38 (1971), 737–745. C. Gordon, J. Luecke, *Knots are
  determined by their complements*, J. Amer. Math. Soc. 2 (1989), 371–415.
- C. Livingston, *A survey of classical knot concordance*, arXiv math/0307077, Theorem 2.2.
  A. Conway, *The Levine–Tristram signature: a survey*, arXiv 1903.04477, Propositions 2.3
  and 2.7, Theorems 2.9 and 2.12. L. Piccirillo, *The Conway knot is not slice*, Ann. of
  Math. 191 (2020), arXiv 1808.02923, Theorem 1.1, Proposition 1.4, Theorem 1.5. A. S.
  Levine, *Non-surjective satellite operators and piecewise-linear concordance*, Forum Math.
  Sigma 4 (2016), arXiv 1405.1125. M. Freedman, *The topology of four-dimensional manifolds*,
  J. Differential Geom. 17 (1982), 357–453. M. Freedman, F. Quinn, *Topology of 4-Manifolds*,
  Princeton (1990), Theorem 11.7B.
- G. Mostow, *Quasi-conformal mappings in n-space and the rigidity of hyperbolic space
  forms*, Publ. Math. IHÉS 34 (1968), 53–104. G. Prasad, *Strong rigidity of Q-rank 1
  lattices*, Invent. Math. 21 (1973), 255–286. J. Ratcliffe, *Foundations of Hyperbolic
  Manifolds*, 3rd ed., Springer GTM 149 (2019), Theorem 11.8.5, Chapter 12. W. Thurston, *The
  Geometry and Topology of Three-Manifolds*, Princeton lecture notes (1980),
  https://library.slmath.org/nonmsri/gt3m/, Chapters 3, 5, 6. P. Scott, *The geometries of
  3-manifolds*, Bull. London Math. Soc. 15 (1983), 401–487.
- D. Gabai, R. Meyerhoff, P. Milley, *Minimum volume cusped hyperbolic three-manifolds*,
  J. Amer. Math. Soc. 22 (2009), 1157–1215, arXiv 0705.4325; *Mom technology and hyperbolic
  3-manifolds*, arXiv 0910.5043, Theorem 1.1. I. Agol, *The virtual Haken conjecture* (with an
  appendix by Agol, Groves and Manning), Doc. Math. 18 (2013), 1045–1087, arXiv 1204.2810,
  Theorems 9.1 and 9.2.
- C. Papakyriakopoulos, *On Dehn's lemma and the asphericity of knots*, Ann. of Math. 66
  (1957), 1–26. J. Milnor, *A unique decomposition theorem for 3-manifolds*, Amer. J. Math. 84
  (1962), 1–7. F. Waldhausen, *On irreducible 3-manifolds which are sufficiently large*, Ann.
  of Math. 87 (1968), 56–88; *Heegaard-Zerlegungen der 3-Sphäre*, Topology 7 (1968),
  195–203. W. Jaco, P. Shalen, *Seifert fibered spaces in 3-manifolds*, Mem. Amer. Math. Soc.
  220 (1979). K. Johannson, *Homotopy equivalences of 3-manifolds with boundaries*, Lecture
  Notes in Math. 761 (1979). W. Thurston, *Three-dimensional manifolds, Kleinian groups and
  hyperbolic geometry*, Bull. Amer. Math. Soc. 6 (1982), 357–381. G. Perelman, arXiv
  math/0211159, math/0303109, math/0307245. J. Morgan, G. Tian, *Ricci Flow and the Poincaré
  Conjecture*, Clay Math. Monographs 3 (2007), arXiv math/0607607, Theorem 0.1 and
  Corollary 0.2.
- M. Scharlemann, *Heegaard splittings of compact 3-manifolds*, arXiv math/0007144, §§2.1
  and 3.2, Theorems 3.4 and 3.7. T. Li, *Rank and genus of 3-manifolds*, J. Amer. Math. Soc. 26
  (2013), 777–829, arXiv 1106.6302, Theorem 1.1.
- D. Calegari, *Foliations and the Geometry of 3-Manifolds*, Oxford (2007),
  https://math.uchicago.edu/~dannyc/books/foliations/oupbook.pdf, Theorems 4.5, 4.35 and 4.38,
  §4.6. C. F. B. Palmeira, *Open manifolds foliated by planes*, Ann. of Math. 108 (1978),
  109–131.
  S. Novikov, *The topology of foliations*, Trudy Moskov. Mat. Obšč. 14 (1965), 248–278.
  W. B. R. Lickorish, *A foliation for 3-manifolds*, Ann. of Math. 82 (1965), 414–420.
- C. Manolescu, *Pin(2)-equivariant Seiberg–Witten Floer homology and the triangulation
  conjecture*, J. Amer. Math. Soc. 29 (2016), 147–176, arXiv 1303.2354, Corollary 1.3;
  *Lectures on the triangulation conjecture*, arXiv 1607.08163, Theorem 1.1, Example 2.2 and
  the diagram closing §2. E. C. Zeeman,
  *On the dunce hat*, Topology 2 (1964), 341–358.
