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
the fourteen of these that are statable against the pinned libraries, together with three
classical theorems of three-manifold topology that the layers prove and the pins make
statable: Moise's triangulation theorem, the sphere theorem and Waldhausen's theorem.

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
  HOMFLY and Kauffman polynomials, Fox colourings and the determinant, knot/proper-link Arf,
  fourth-root evaluations and the integral W quotient. Layer 4.3.1 owns the finite
  nonsingular F₂ quadratic Arf algebra and its Seifert-form dictionary;
  TangentialBordism and FourManifolds consume them. This layer also owns
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
  the Ocneanu trace. **SuccessiveMinima** owns the successive minima of a discrete full
  lattice for a convex body and their attainment by a real basis of lattice vectors; Layer 7.3.1
  uses the first two minima of a cusp lattice for the closed unit disc of `ℂ` and adds only the
  two-dimensional facts that the two witnesses form a `ℤ`-basis and the treatment of ties.
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
invariance. Layer 4 consumes them for the HOMFLY trace theorem and the low-strand
Jones/Burau block comparisons; it owns the geometric closure and native-matrix adapters.

### From TauCetiRoadmap.SuccessiveMinima

Layer 1: the successive minima `λ_i(L, K)` of a discrete full lattice `L` in a finite-dimensional
real normed space for a convex body `K` with `0` in its interior, their positivity, the threshold
characterization by independent lattice vectors, and target 1.5 `exists_successiveMin_witnesses`
(a real basis of lattice vectors `b_i` with gauge `λ_i`, every lattice vector of gauge `< λ_i`
lying in the span of the earlier `b_j`). Layer 7.3.1 consumes them for `E = ℂ` and `K` the closed
unit disc, where the gauge is the norm.

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
and the annulus conjecture*, Ann. of Math. 89 (1969), 575–582: Theorem 1 derives the stable
homeomorphism conjecture in dimension `n + 1 ≥ 6` from the Hauptvermutung for tori through
the torus trick, and the addenda extend it to dimension `5` by Wall's theorem on ends and
obtain the Hauptvermutung for the `2ⁿ⁺¹`-fold covers of homotopy tori from the theorems of
Wall and of Hsiang–Shaneson, which gives the annulus conjecture in every dimension
`n + 1 ≥ 5`), and for `n + 1 = 4` by Quinn (*Ends of maps III*,
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

<a id="braid-square-quotients"></a>
### 4.2.1 Strand permutations and square quotients of braid groups

Use native `BraidGroup n`, with generators σ_i indexed by `Fin (n−1)`,
and native `permHom n : BraidGroup n →* Equiv.Perm (Fin n)`. Retain its
surjectivity, generator computation and actual strand-permutation
comparison. Multiplication of permutations is from right to left.
Distant commutation has `i+2≤j` or `j+2≤i`; adjacent generators satisfy
the length-three braid relation. No involution relation is imposed on
the braid generators, which have infinite order.

**Generator squares and the pure braid group.** Define

```text
N_gen(n) = normalClosure {σ_i² | i∈Fin(n−1)} ⊆ B_n.
```

Prove `N_gen(n)=ker(permHom n)=pureSubgroup n` and construct the
canonical group equivalence `B_n/N_gen(n) ≃* Equiv.Perm (Fin n)`, with
its value on every quotient generator and commuting projection square.
Build the finite type-A Coxeter comparison using the native
`CoxeterMatrix.A (n−1)`, its presented group and adjacent transpositions.
For n≥1 transport the rank n−1 to n strands; handle n=0 by an
explicit trivial-group comparison. Give maps in both directions, prove
every relation and both inverse laws,
and identify the map with native `permHom` by generator extensionality.
Use the existing Coxeter/Artin presentation API for the square-relator
adapter; this stage owns its finite type-A permutation comparison.

Export the universal property: for every group G and homomorphism
f:B_n→G, a unique homomorphism S_n→G factors f through permHom iff
`f(σ_i)²=1` for every i. Identity images are allowed in this condition.
Prove the quotient has cardinality n!, and preserve the equations under
native strand inclusion. These are presentation/normal-closure results;
the later Garside and Milnor-invariant constructions do not enter them.

**Squares of all elements and exponent parity.** Separately define

```text
N_all(n) = normalClosure {b² | b∈B_n}.
e : B_n → ℤ = the native Artin exponent sum in additive notation,
ε : B_n → Multiplicative (ZMod 2),  ε(b)=e(b) mod2.
```

Prove the homomorphism and generator rules for ε, its compatibility with
strand inclusion, and the exact sign identity
`sign(permHom n b)=(−1)^e(b)` in `ℤˣ`. Prove
`N_gen(n)≤N_all(n)=ker ε`. For n≥2 construct the canonical equivalence
`B_n/N_all(n) ≃* Multiplicative (ZMod 2)`, sending every σ_i to the
nonidentity class. Give the quotient projection and factorization
equations. Every square is trivial in this quotient; hence inversion
fixes every element and the quotient is abelian. Use the adjacent braid
relations and generation to prove that all generator classes coincide,
then use ε to prove that this class is nontrivial.

Identify N_all as the inverse image of the alternating subgroup under
permHom and give the commuting quotient diagram B_n→S_n→C₂. The
universal property of the all-square quotient is factorization for maps
whose entire image satisfies x²=1, rather than just imposing that condition
on a chosen generating family. This distinction permits a nonabelian S_n
as the generator-square quotient for n≥3.

**Checks.**

- B₀ and B₁, both square quotients, and S₀ and S₁ are trivial. Their
  parity maps have trivial image; the C₂ equivalence requires n≥2.
- For B₂≃ℤ, both normal subgroups correspond to 2ℤ and both quotients
  are C₂. Compare the generator and exponent maps explicitly.
- For n≥3 put b=σ₀σ₁. Its permutation is a three-cycle, so b² has
  nonidentity permutation. Prove b²∈N_all and b²∉N_gen, giving the
  strict inclusion N_gen<N_all. In particular B₃/N_gen≃S₃ has order 6,
  while B₃/N_all≃C₂ has order 2.
- In B₄, σ₀ and σ₂ commute by the native distant-generator theorem.
  Preserve the adjacent-generator noncommutation calibration as well.

*Needs:* native `BraidGroup`, `sigma`, `permHom`, `pureSubgroup`,
`ArtinGroup.exponentSum`, Coxeter/Artin presentations and finite
permutation/sign APIs; `Subgroup.normalClosure`, `QuotientGroup`,
`Multiplicative (ZMod 2)` and group-homomorphism extensionality.
The finite type-A comparison, kernel identification, quotient maps and
parity comparison are built here. For the standard presentations and
strand map, see [Birman–Brendle, §1](https://www.math.columbia.edu/~jb/Handbook-21.pdf).

### 4.3 Seifert surfaces, genus and the Seifert form

Prove that every nonempty oriented link `L ⊂ S³` bounds a compact connected oriented
Seifert surface: construct the raw Seifert-algorithm surface, then join its distinct
components by oriented interior tubes preserving the boundary (Lickorish, Theorem 2.2). Define the genus
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
- The Euler characteristic of the raw surface produced by Seifert's algorithm on a diagram
  with `n` crossings and `s` Seifert circles is `s − n`; it can be disconnected for links.
  For a knot it is connected and has genus `(n − s + 1)/2`,
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

### 4.3.1 Quadratic refinements and proper links

**Finite quadratic Arf algebra.** This prerequisite uses native
`QuadraticForm (ZMod 2) V` with the explicit hypothesis
`q.polarBilin.Nondegenerate`. It is independent of Seifert surfaces and all
geometric bordism constructions.

Construct `finiteQuadraticArf` for a finite-dimensional F2 vector
space with a quadratic refinement of a nonsingular alternating form.
Consume Tau Ceti's implemented
`LinearMap.BilinForm.IsAlt.exists_basis_toMatrix_eq_J` and `LinearMap.BilinForm.IsAlt.even_finrank`
from `TauCeti.LinearAlgebra.BilinearForm.SymplecticBasis`. Construct only
the characteristic-two adapter: `q.polarBilin` is alternating by
`QuadraticMap.polar_self`, and Matrix.J's off-diagonal −1 equals +1.
Convert its native `Module.Basis (Fin m ⊕ Fin m)` to paired entries δ_ij,
same-half pairings zero and dim V=2m, including m=0. Define Arf as
Σ q(a_i)q(b_i), prove its equality to the basis formula for every such
basis, independence of basis, isometry invariance and orthogonal-sum
additivity. Prove the
hyperbolic/anisotropic-plane decomposition, with an explicit paired-plane
change of basis identifying two anisotropic planes with two hyperbolic planes.
Prove that dimension and Arf classify these forms up to native quadratic
isometry. Prove the intrinsic Gauss sum `sum_v (-1)^(q v)=(-1)^Arf * 2^m`; derive
the q-zero count `2^(2*m-1)+(-1)^Arf * 2^(m-1)` for m≥1, with count1
when m=0. Prove that Arf zero is equivalent
to a q-zero Lagrangian (including dimension zero). Here a q-zero Lagrangian
is a subspace U with q|U=0 and U equal to its orthogonal complement for
q.polarBilin. For a subspace on which q vanishes, prove that this
orthogonal-complement condition is equivalent to finrank U=m. Interpret the zero-count
formula in ℤ, so the sign and subtraction are literal integer operations. Export these constructors
and comparison maps for geometric surface and Seifert-form consumers;
GeometricTopology owns this generic finite-F2 theory. TangentialBordism and
FourManifolds consume it for their geometric refinements.

For any such q of dimension 2m, state the basis-independence headline as
`finiteQuadraticArf_eq_of_symplecticBasis`, the integer-sum identity as
`finiteQuadraticArf_gaussSum`, and the equivalence between Arf zero and an
m-dimensional subspace on which q vanishes as
`finiteQuadraticArf_eq_zero_iff_lagrangian`. The sum uses any `Fintype V`;
finite dimension over F₂ ensures such a choice exists. There is no restriction m>0.
These are consequences of the paired-plane classification (Pyronneau, §2.1,
Lemmas 2.11–2.13, Corollary 2.14 and Theorem 2.15, pp.4–5): on one plane
sum the four signs, then multiply under orthogonal sums; a q-zero half-dimensional
subspace extends to a hyperbolic basis by modifying its complementary vectors.

The supporting definitions are `finiteQuadraticArfOfBasis`, the paired-basis sum,
and `IsQuadraticSymplecticBasis`, the three pairing equations. The characteristic-two adapters
`quadraticPolar_isAlt` and `finiteQuadraticSymplecticBasis_exists` construct the
chosen basis used in `finiteQuadraticArf`; they are prerequisites for the invariant.

Its API includes:

- The basis formula agrees with the intrinsic invariant on every symplectic basis,
  and linear isometries preserve it.
- Orthogonal sums add the F₂ invariant and multiply the integer Gauss sum.
- A half-dimensional q-zero subspace exists exactly for the hyperbolic class;
  nondegeneracy makes it a Lagrangian for the polarization.

**Checks.**

- On the zero space the empty basis satisfies all pairing equations, its sum is 0,
  the Gauss sum is 1 and the zero subspace has dimension 0.
- On q(x,y)=xy the standard basis has pairing matrix [[0,1],[1,0]], Arf 0,
  values (0,0,0,1), Gauss sum 2 and the zero line spanned by (1,0).
- On q(x,y)=x²+xy+y² the same matrix has Arf 1, values (0,1,1,1),
  Gauss sum −2 and no nonzero q-zero vector. The zero bilinear form fails
  the mixed pairing equation, excluding an arbitrary basis of a degenerate form.
- Two anisotropic planes have Arf 1+1=0 and Gauss sum (−2)²=4;
  the diagonal subspace in their sum is q-zero and has dimension 2.

*Needs:* Mathlib `QuadraticForm`, `Submodule`, finite sums and finrank; Tau Ceti `LinearMap.BilinForm.IsAlt.exists_basis_toMatrix_eq_J`.


**Seifert refinements and proper links.**

For a nonempty oriented μ-component link and a compact connected oriented
Seifert surface F of genus g, construct the quadratic refinement
`q_F(x)=lk(x,x⁺) mod2` on `H₁(F;𝔽₂)`. Build coefficient change from an
integral H₁ basis, including its comparison with singular homology over
𝔽₂. With the declared Seifert matrix S, use native
`(S.map (Int.castRingHom (ZMod 2))).toQuadraticForm'`, so
`q_F(x)=xᵀ(S mod2)x`. Prove its equality with geometric push-off linking,
its polarization and basis/isotopy/stabilization transport. Its polar
matrix is `(S+Sᵀ) mod2`; do not symmetrize S before constructing q_F,
which would erase the quadratic refinement in characteristic two.

Let `R=q_F.polarBilin.ker`. Prove `dim H₁=2g+μ−1`,
`dim R=μ−1`, and that the boundary classes generate R with the single
relation `Σ_j[L_j]=0`. Prove

`q_F([L_j])=Σ_(k≠j) lk(L_j,L_k) mod2`.

Define a proper link by the evenness of each displayed total linking
number. Prove properness is equivalent to q_F vanishing on R. Keep R
distinct from native `q_F.radical`, which also imposes `q_F(x)=0`.
For a proper link prove `R≤q_F.radical`, use native `QuadraticMap.lift`
to descend q_F to `H₁/R`, and prove that its **polar bilinear form** is
nonsingular, of dimension2g. Native quadratic `Nondegenerate` alone is
insufficient in characteristic two because it permits a one-dimensional
anisotropic polar radical.

Define the proper-link Arf invariant from the descended form and the knot
Arf invariant as its μ=1 case. Prove independence of surface, basis and
component labelling by the geometric common stabilization and native integral
`SEquivalent` moves: an enlargement adds a hyperbolic plane to the nonsingular
quadratic quotient. Prove additivity for component-chosen connected sum,
preservation under oriented band fusion of proper links, and mirror/global-
reversal invariance. No Arf value is assigned to an improper link by this
constructor. These geometric dictionaries and the finite algebra above require
no Jones-polynomial or geometric bordism input. Prove the determinant-Arf
criterion for knots and that Alexander polynomial one implies Arf zero.

**Checks for the geometric dictionary.**

- The trefoil matrix [[−1,1],[0,−1]] has q(x,y)=x²+xy+y², zero polar
  radical and Arf 1. The unknot's zero-dimensional form has Arf 0.
- The positive Hopf annulus has matrix [−1]. Its one-dimensional polar
  radical has q(core)=1, so the link is improper and has no proper-link Arf value.
- For T(2,4), use S=[[−1,1,0],[0,−1,1],[0,0,−1]]. The polar radical is
  spanned by e₁+e₃, on which q is zero. The nonsingular quotient is the
  anisotropic plane, so this proper link has Arf 1.
- The two-component unlink has a one-dimensional zero refinement, which
  descends to the zero space and gives Arf 0.

*Needs:* Layer 4.3 Seifert surfaces and geometric
common stabilizations; the finite algebra above; native integral S-equivalence,
`Matrix.toQuadraticForm'`, `QuadraticMap.polarBilin`, `.radical` and `.lift`;
Mathlib coefficient change and singular homology.

<a id="finite-disc-band-surfaces"></a>
### 4.3.2 Finite disc-band surfaces and canonical Seifert surfaces

Construct finite embedded disc-band presentations, using Layer1.8's
compact-surface classification and Layer4.2's realized diagram conventions.
The data contain d disjoint discs, b rectangular bands, their two distinct
attaching interval occurrences, cyclic interval orders on each disc,
side-pairing signs relative to chosen local disc orientations, and the
actual projection/height/twist data needed for an embedding in oriented
three-space. Interval occurrences are distinct even when both ends of a
band meet the same disc. Parallel bands and loop bands are retained.
Construct the collared surface with corners, its smoothing and embedded
boundary link, with independence of the chosen collar smoothing. Abstract
rotation and side-pairing data determine a surface type; the embedding data
also determine its knotted placement and must be transported with it.

**Finite boundary and orientation API.** Use native finite types and
`Equiv.Perm`, with ports `P=Fin b × Bool` for band ends and corners
`C=P × Bool`. The last bit names the start0/end1 of an attaching interval
along the chosen positive disc boundary. Let σ be the port permutation
whose cycles are exactly the incident-port fibers of the used discs;
record discs with no ports separately. Let τ exchange the two ends of a
band. If ε_e is the side-pairing bit of band e, define the fixed-point-free
involutions

```text
D(p,1)=(σp,0),       D(p,0)=(σ⁻¹p,1),
M(p,s)=(τp, s xor (not ε_e)).
```

Thus ε=0 joins opposite corner bits and ε=1 joins equal bits. It is a
local orientation obstruction, not an unoriented count of visible twists.
The native quotient by the join of the two matching relations is the
boundary-component carrier for used discs; add one component for each
isolated disc. Prove its geometric boundary comparison and the formula
`r=orbitCount(M*D)/2+isolatedDiscs`. Each alternating matching cycle gives
two orbits of the product, so prove evenness before the natural-number
division. Include coincident matchings, empty corner types and isolated
discs. Supply the generic finite-perfect-matching comparison
`Nat.card(Quotient(SameCycle M ⊔ SameCycle D))=orbitCount(M*D)/2`
as the shared adapter, specializing it here and in the later PD
state-circle construction. Reuse native matching and orbit APIs.

Use native `Graph` for the disc/band incidence multigraph, with all d
vertices and all b edges, and compare its components to those of the
surface. Express finite incidence connectivity by the native equivalence
closure of `IsLink`. Compare this with `Graph.toSimpleGraph`, using its
vertex subtype and retaining isolated vertices. Prove that a spanning tree
from `SimpleGraph.Connected.exists_isTree_le` lifts by choosing one actual
band for each selected edge; prove it has d−1 bands. Loops and repeated
parallel edges are omitted only in this tree selection, not in the surface
presentation. Prove orientability precisely when there is a function
o from discs to `ZMod 2` with
`ε_e=o(v₀(e))+o(v₁(e))` for every edge, including loops. Express this
as membership in the range of the actual incidence coboundary linear map.
Prove equivalent vanishing on closed walks, naturality under relabeling,
and invariance under changing local disc orientations. Changing a disc
orientation reverses its interval order and changes the incident signs;
carry the corner relabeling too. For an orientable connected surface the
two solutions differ by global reversal; do not discard that orientation
data. These are adapters to native graph, linear and permutation APIs.

**Euler characteristic and one-disc models.** Construct a deformation
retraction to the embedded incidence spine and its finite cellular/singular
comparison. Prove `χ=d−b`, with the integer subtraction explicit. For a
connected orientable surface with r boundary components and genus g export
`2g+d+r=b+2`; for a connected nonorientable surface with crosscap number k
export `k+d+r=b+2`. Each nonempty component has boundary. Recover integral
first homology, free of rank `b+1−d`, and the vanishing higher homology
from the spine; handle disconnected components and the empty presentation
separately. Do not replace the nonorientable crosscap number by an
orientable genus. The division-free formulas include a lone disc.

For a connected incidence graph choose a spanning tree. Its discs and tree
bands form an embedded disc after smoothing corners. First repartition the
given surface using that tree-disc, preserving its actual embedded subset
and boundary; retain the remaining attaching intervals in their induced
cyclic order. There are b' remaining bands, with `b'+d=b+1`, hence
`b'=b+1−d` in natural numbers. Then construct an ambient isotopy supported
in a containing ball straightening this disc to the standard disc and
transporting all remaining bands, crossing/twist data and boundary marks.
The boundary knot moves by the induced ambient isotopy. An abstract graph
contraction is not this spatial straightening theorem.

For an arbitrary compact connected surface with nonempty boundary, consume
SurfaceTopology's classification and Layer1.8's smooth/PL comparison to
construct a finite one-disc model. Its band count is `2g+r−1` in the
orientable case and `k+r−1` in the nonorientable case. Prove that two
one-disc finite band surfaces are homeomorphic as unmarked abstract
surfaces iff their band counts, boundary counts and orientability agree.
This classification does not identify their embedded placements. A
noncompact surface such as `S¹×[0,∞)` is outside the finite-model theorem;
closed surfaces use the separate standard models from Layer1.8.

**Raw Seifert surfaces and genus minima.** For a nonempty oriented link
diagram with n crossings, s Seifert circles and μ link components,
construct the raw canonical surface with exactly s discs and n bands.
Count its connected components c by the incidence graph. If G is the sum
of their orientable genera, prove `2G+s+μ=n+2c` and `χ_raw=s−n`.
Every raw component has nonempty boundary. Construct c−1 disjoint oriented
interior tubes joining these components, preserving the boundary link,
and prove the resulting connected surface has genus G and
`χ_connected=s−n−2(c−1)`. Supply relative arc routing in the complement:
start with a transverse polygonal path, slide each intersection to a free
boundary interval along a surface arc and detour around its collar.
Choose prescribed endpoint normal sides, avoid earlier tube arcs by
general position, and use thin disjoint tubular neighborhoods. No routing
statement for an arbitrary closed separating surface is assumed here.

For a knot the raw surface is connected, so `2g(S_D)+s=n+1`, including
the crossing-free unknot. This computes the chosen surface's genus.
Use Layer4.3's ordinary genus minimum over all connected embedded oriented
spanning surfaces. Separately define the canonical genus of a knot as the
minimum genus among its diagram Seifert-algorithm surfaces; prove existence,
attainment, isotopy invariance and `g(K)≤g_can(K)`. The genus of one chosen
canonical surface need not be either minimum.

**Checks.**

- With one disc and no bands, r=1, χ=1 and g=0. With one band whose two
  ports are on that disc, ε=0 gives an annulus with r=2, while ε=1 gives a
  Möbius band with r=1 and crosscap number1. With two discs and one joining
  band either side-pairing sign gives a disc; a local sign alone is not a
  test for nonorientability.
- On one disc, two untwisted bands with cyclic port order e₀,f₀,e₁,f₁ give
  a once-punctured torus (r=1,g=1). The order e₀,e₁,f₀,f₁ gives a pair
  of pants (r=3,g=0). Verify both boundary quotients and their geometric
  standard-model comparisons, rather than inferring genus from b alone.
- For the two-strand braid `β_j=σ₁³(σ₁σ₁⁻¹)^j`, j≥0, give the j explicit
  RII cancellations identifying every boundary with the right-handed
  trefoil. Oriented smoothing gives exactly two Seifert circles and
  `3+2j` bands, so the chosen raw surface has genus `1+j`. The trefoil's
  ordinary and canonical minimum genera are both1, using the j=0 surface
  and its earlier nontriviality. The boundary cancellation does not assert
  isotopy between surfaces of different genera.
- The crossing-free two-component unlink gives two raw discs, c=2 and
  G=0. One interior tube gives a connected annulus spanning the unlink;
  its Euler characteristic is0, while the raw surface's is2.

*Needs:* Layer1.8 (compact-surface classification and smooth/PL comparison),
Layer1.5 (collars and tubes), Layer3.3 (supported ambient isotopy extension),
Layer4.2 (realized diagrams and local Reidemeister moves), Layer4.3 (ordinary
genus and the trefoil calibration); SurfaceTopology Layer8 and PlanarTopology
Layers5,8; native `Graph`, `Equiv.Perm`, finite matching/orbit quotients and
`ZMod 2` linear maps. The finite-presentation, embedded-spine and relative
straightening adapters are constructed here.

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

<a id="seifert-determinant-normalizations"></a>
### 4.4.1 Seifert determinants, degree and stabilization

For an integral Seifert matrix V of a knot, in a basis of size2g, keep
three distinct quantities: the ordinary polynomial
`D_V(X)=det(XV−Vᵀ)∈ℤ[X]`, the native symmetric Laurent polynomial
`Δ_V=T(−g)·D_V.toLaurent`, and the positive knot determinant
`d(K)=|Δ_V(−1)|`. Prove the ordinary-to-Laurent comparison with native
`alexanderMatrix` and `alexander`, with coefficient and evaluation maps.
The geometric surface/basis and S-equivalence comparisons are supplied by
Layer4.3; an arbitrary integral matrix is not thereby a knot presentation.

**End coefficients and degree.** Reuse Mathlib's determinant-of-linear-
polynomial lemmas to prove

```text
natDegree D_V ≤ 2g,
coeff D_V 0 = coeff D_V (2g) = det V,
coeff Δ_V (−g) = coeff Δ_V g = det V,
support Δ_V ⊆ [−g,g].
```

Here the interval is an integer interval and Laurent support means native
`coeff.support`. Prove D_V and Δ_V are nonzero from the unimodular skew
pairing and Δ_V(1)=1. Include g=0, where the empty determinant is1.
Prove that `det V≠0`, `natDegree D_V=2g`, and both Laurent endpoint
coefficients being nonzero are equivalent. Thus det V≠0 gives span2g;
when det V=0, the degree drops at both ends before translating exponents.

For every nonzero inversion-symmetric integral Laurent polynomial Δ with
Δ(1)=1, construct its least and greatest support exponents m,M and prove
`m=−M` and `M≥0`. Show `T(−m)·Δ` is the Laurent image of a unique ordinary
polynomial A with nonzero constant term and degree `M−m=2M`. This is the
even degree of the polynomial obtained by shifting the least exponent to0;
the greatest exponent of the symmetric Laurent polynomial need not be even.
Transport the construction and its unit-normalization comparison to Δ_K.

**Symmetrization and S-equivalence.** Put S_V=V+Vᵀ. Prove the determinant
laws for native unimodular congruence and both native elementary
enlargements: congruence multiplies det S_V by `(det P)²=1`, while each
enlargement multiplies it by−1. Prove reindexing compatibility and descend
`|det S_V|` through native `IntegralSquareMatrix.SEquivalent`, including
singular matrices. For even sizes2g,2h strengthen this to invariance of
`(−1)^g det S_V`; retain the genus factor when comparing different sizes.
Prove the exact evaluation identity

```text
Δ_V(−1) = (−1)^g det(V+Vᵀ),
d(K) = |det(V+Vᵀ)|.
```

Use reduction modulo2 and `det(V−Vᵀ)=1` to prove det S_V is odd and
nonzero for knot Seifert matrices. The real symmetric form therefore has
positive and negative inertia indices summing to2g, so its signature is
even. Compare this signature with native `Matrix.signature` on the real
Seifert matrix using its positive symmetrization law. Build this nonsingularity/parity adapter using the native real inertia
API; the parameter-dependent Hermitian and
concordance signatures of Layer6 consume it. Nondegeneracy, oddness and
even signature are knot assertions; link Seifert matrices may have odd
size or singular symmetrization.

**Checks.**

- The empty disc matrix has det V=1. Its native zero-vector column
  enlargement, reindexed to `[[0,1],[0,0]]`, has det V=0 and is explicitly
  S-equivalent to it. Realize this move by adding a standard untwisted, unknotted interior
  tube to the embedded spanning disc, retaining the unknot boundary and
  exhibiting the oriented basis curves and their push-off pairings. Both have Δ=1, positive determinant1 and signature0; their
  symmetrization determinants are respectively1 and−1. This proves
  det V is not invariant, including within actual surfaces for one knot.
- The native trefoil has det V=1, Δ=T−1+T⁻¹ and det S_V=3; hence
  Δ(−1)=−3. The native figure-eight has det V=−1,
  Δ=−T+3−T⁻¹ and det S_V=−5; hence Δ(−1)=5.
  Both symmetric Laurent polynomials have greatest exponent1 and span2.
- The stabilized disc has size2 but Δ has span0; matrix size alone does
  not force equality in the genus bound.

*Needs:* Layer4.3 (embedded Seifert surfaces, skew pairing and geometric
stabilization), Layer4.4 (native Alexander comparison);
`IntegralSquareMatrix.SEquivalent`, `enlargeColumn`, `enlargeRow`,
`LaurentPolynomial`, Mathlib's polynomial-matrix determinant lemmas,
and native finite-dimensional real inertia and `Matrix.signature`.

<a id="signed-fox-matrices"></a>
### 4.4.2 Signed crossing matrices and Fox specialization

Use Λ=`LaurentPolynomial ℤ`, with `t=T 1`. Build the Fox derivative on
`FreeGroup` words with values in the integral group ring, proving invariance
under free cancellation, its generator values, and the rules
`D_i(xy)=D_i(x)+xD_i(y)` and `D_i(x⁻¹)=−x⁻¹D_i(x)`.
Extend it additively to the group ring with the augmentation Leibniz rule
`D_i(ab)=D_i(a)ε(b)+aD_i(b)`. Prove the fundamental Fox identity
`Σ_i D_i(w)(x_i−1)=w−1` and its compatibility with relabeling and the homomorphism sending every positive
meridian to t. This supplies the actual calculus for the Wirtinger route
in Layer4.4, using native free groups, group rings and Laurent polynomials.

**Local signs and the native presentation.** At a crossing write o for
the over-meridian, u for the incoming under-meridian and v for the
outgoing under-meridian. Fix the signed relators

```text
r₊=o u o⁻¹ v⁻¹,       r₋=o⁻¹ u o v⁻¹.
```

Their abelianized derivative rows, in order (o,u,v), are respectively
`(1−t,t,−1)` and `(1−t⁻¹,t⁻¹,−1)`. Multiply a negative row by the
unit−t to obtain `(1−t,−1,t)`. In order (o,v,u) the normalized rows
are `(1−t,−1,t)` and `(1−t,t,−1)`. Assemble each row by adding all
incident contributions, including coincident arc indices. Prove every
row sums to0. Keep the raw and normalized rows distinct and carry their
unit diagonal row transformation through every presentation comparison.

Compare these rows directly with native `OrientedPDCode.alexanderRelation`:
read from an incoming under-slot, the native relation is the negative
of the raw row with weight `T(crossingSign)`. The opposite reading uses
the inverse weight and gives a unit-equivalent relation. Construct the
arcs obtained by cutting at undercrossings and prove the half-edge and
over-strand identifications recover their generators. Include a separate
generator for every crossing-free or over-only component. Construct both
maps between `coker(Aᵀ)` and native `D.AlexanderModule`, using its generator
and lift API, and prove inverse laws on generators. Here A has crossings
as rows and arcs as columns; row relations present the transpose cokernel.
Only a knot diagram with c≥1 crossings automatically gives c arcs and
a square c-by-c matrix.

The native module is unreduced. For a nonempty realized oriented link,
construct its augmentation to Λ sending each arc generator to1 and split
it by a chosen arc. Identify the augmentation kernel with
`H₁(X∞;ℤ)` by the geometric Wirtinger/Fox/cover comparison of Layer4.4.
Thus `D.AlexanderModule ≃ Λ ⊕ H₁(X∞;ℤ)` and
`D.elementaryIdeal k = Fitt_(k−1)(H₁(X∞;ℤ))` for k≥1, while E₀=0.
Reuse the native Fitting/minors API and the native combinatorial
Reidemeister module equivalences; combine them with the geometric move
comparison to get ambient-isotopy invariance. Relabeling gives permutation
maps, and total orientation reversal gives the semilinear coefficient
change t↦t⁻¹. For links retain the full ideal family and its zero ideals;
a nonprincipal ideal does not acquire a chosen polynomial generator.
The empty diagram has zero native module and is separate from the
nonempty meridional-cover comparison.

**Every cofactor, with its unit.** For a realized knot diagram with c≥1,
construct a geometric ordering of the crossings, words g_i and signs
δ_i=±1 for which the product of `g_i r_i^δ_i g_i⁻¹`, each crossing
appearing once, equals1 in the free group. Use the planar Wirtinger
identity construction (Burde–Zieschang, §3.B, Corollary3.6), with the
conjugation/inversion adapters for the pinned relators. Differentiate
and abelianize to obtain a left-kernel vector with unit entries
`δ_i t^(exp g_i)` for the raw matrix. Divide the corresponding coefficient
by−t whenever that row is normalized. This produces a unit-valued left
kernel u of A alongside the all-ones right kernel; it is a construction
from the realized diagram, not an extra unproved hypothesis about A.

For every square Λ-matrix of positive size with these two kernel vectors,
construct explicit unimodular row/column transports between every pair
of deleted-row/deleted-column matrices B_ij. In increasing remaining
index order prove, for zero-based i,j,

```text
(−1)^(i+j) det B_ij = u_i κ
```

for a common κ. Include singular matrices. Thus all cofactors generate
the same ideal E₁; for knots the Layer4.4 Seifert comparison identifies
it with `(Δ_K)`, and every individual cofactor is `±t^m Δ_K`.
Principality of the ideal generated by all cofactors alone is insufficient
for this individual-generator conclusion. Track relabeling, Reidemeister
moves and orientation reversal through these units before fixing the
symmetric value-one normalization. This is an early producer; the
checkerboard specialization in Layer4.7 consumes its matrix comparison.

**Coefficient specialization.** For every commutative ring R and unit
a∈Rˣ use `LaurentPolynomial.eval₂ (Int.castRingHom R) a` as coefficient
map. Prove right-exact base change of the presented module/cokernel and
compare its colorings via Hom into R with the kernel of the specialized
crossing matrix. At t=−1, both signed raw rows and the normalized negative
row become `(2,−1,−1)`, giving the Fox crossing-color presentation and its
native half-edge comparison. At t=1, the relations identify the incoming
and outgoing under-arcs; prove the specialized module is free on the
actual link components, including crossing-free components. These
statements include characteristic2 and composite residue rings. Construct
coloring-kernel maps over each stated coefficient ring; arbitrary tensor
base change of a kernel is not asserted. A region Goeritz matrix requires
the separate checkerboard/arc comparison of Layer4.7.

**Checks.**

- The crossing-free unknot has module Λ and reduced module0. A one-crossing
  kink has all three arc indices equal, A=[0], and empty cofactor of
  determinant1. A crossing-free μ-component link has module Λ^μ and
  E_k=0 for k<μ, E_k=Λ for k≥μ.
- The trefoil matrix
  `[[1−t,−1,t],[t,1−t,−1],[−1,t,1−t]]` has last-row/column cofactor
  D₃=1−t+t². Realize the closure of σ₁³ and exhibit its signed
  crossing/arc dictionary to this matrix and its geometric comparison
  with the native trefoil Seifert form. Its fixed native normalization is
  `t⁻¹D₃=alexander trefoilSeifertMatrix=t−1+t⁻¹`.
- Realize the closure of `σ₁σ₂⁻¹σ₁σ₂⁻¹` on three strands. Number
  crossings0–3 in braid order. Trace the cyclic Gauss word
  `O0,U1,O3,U0,O2,U3,O1,U2`, with signs(+,-,+,-), and arcs
  `0:U2→U1`, `3:U1→U0`, `2:U0→U3`, `1:U3→U2`. Prove its finite
  braid/PD/arc dictionary, geometric figure-eight comparison and normalized
  matrix
  `[[1−t,0,−1,t],[−1,1−t,0,t],[−1,t,1−t,0],[0,t,−1,1−t]]`.
  Its unit left kernel is `(1,−t,1,−t)` and last-row/column cofactor is
  `D₄=−t³+3t²−t=−t(t²−3t+1)`. Prove
  `t⁻²D₄=alexander figureEightSeifertMatrix=−t+3−t⁻¹`.
  The ordinary representative P=t²−3t+1 satisfies
  `P=(−t⁻¹)D₄` and P(1)=−1; these are unit comparisons, not literal
  equality of D₄ and P. A polynomial calculation alone does not identify
  a pictured knot.

*Needs:* Layers4.1–4.4 (realized diagrams, geometric Wirtinger presentations,
Seifert comparison and the meridional cover); Mathlib `FreeGroup`,
`MonoidAlgebra`, `LaurentPolynomial`, finite matrices, module quotients,
tensor products and Fitting ideals; native
`TauCeti.KnotTheory.PDCode.Alexander.Basic` and the native Alexander
Reidemeister equivalences; [Burde–Zieschang, *Knots*, §3.B, Corollary3.6](https://api.pageplace.de/preview/DT0400.9783110198034_A19083999/preview-9783110198034_A19083999.pdf).

<a id="group-presentation-countability"></a>
### 4.4.3 Countability and finite presentations of knot groups

Use Mathlib's `Group.Presentation G ι`: a generating family indexed by ι,
a set of relator words in `FreeGroup ι`, and equality of the evaluation
kernel with their `Subgroup.normalClosure`. Reuse its
`presentedGroupEquiv : PresentedGroup P.rel ≃* G` and computing maps on
generators. Prove the normal closure consists of finite products of
conjugates of relators and their inverses, including the empty product.
A set of single conjugates alone need not be a subgroup. Export the
corresponding criterion for a generator assignment to descend, and reuse
native `PresentedGroup.toGroup` and its uniqueness on generators.

For every group G, construct the presentation with generator type G,
assignment g↦g and relator set the kernel of `FreeGroup.lift id`.
Prove this evaluation is surjective, its kernel is the normal closure
of that set, and the induced native presentation equivalence computes
as identity on each named element of G. Thus every group admits a
presentation when its generator type is unrestricted.

Prove the precise countability statement

```text
Countable G ↔ Nonempty (Group.Presentation G ℕ).
```

In the forward direction choose a surjective enumeration of G, padded
by the identity when needed, and use its free-group evaluation kernel
as relator set. Prove the relator subtype is countable, since the free
group on a countable alphabet is countable. Conversely use the
surjective evaluation from `FreeGroup ℕ`. Include the finite and trivial
groups. No effective enumeration, decidable relator set or solution of
the word problem follows from this existence statement.

Keep three finiteness conditions separate: a countable presentation,
a finite generating family, and a finite generating family with finitely
many relators. Use native `Group.Generators`, `Group.FG` (following its
`IsMulFG` replacement) and `Group.IsFinitelyPresented`; reuse
`Group.Presentation.isFinitelyPresented_iff_exists_finite_presentation` for the last
condition. Prove finite presentations give finite generation and
countability. Countability alone does not give finite generation.

For every finite realized oriented link diagram, turn its geometric
Wirtinger theorem into an actual finite `Group.Presentation` of the
complement group with one relation per crossing. Include generators for
crossing-free and over-only components. Export the generator/meridian
computing maps and the native finite-presentation instance. For a knot
with c≥1 crossings, consume the planar once-each relator identity built
in Layer4.4.2 to remove any one relation. The crossing-free unknot has one generator and
no relators. Abstract countability is not the proof of finite presentation.

**Checks.**

- `FreeGroup ℕ` is countable and has the empty relator presentation on
  ℕ, but is not finitely generated. Any finite family of words uses
  finitely many letters; map a new letter to the nonidentity element of
  `Multiplicative (ZMod 2)` and all used letters to1 to prove the family
  does not generate. Hence it has no finite presentation.
- The additive group of ℝ, written multiplicatively with `Multiplicative`,
  has the unrestricted all-elements presentation but has no countable
  presentation. This distinguishes unrestricted presentations from the
  countability equivalence.
- The empty link has the trivial complement group and the empty finite
  presentation. The crossing-free μ-component unlink has the free group
  on `Fin μ` with no relators. The one-crossing kink presents ℤ with its
  sole Wirtinger relator already equal to1 as a free word.

*Needs:* native `Group.Presentation`, `Group.Generators`, `PresentedGroup`,
`FreeGroup`, `Subgroup.normalClosure`, `Countable`, `Group.IsFinitelyPresented`
and the geometric Wirtinger construction in Layer4.4; Layer4.4.2
for the once-each relator identity and individual-relator deletion.

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

### 4.5.1 Low-strand Burau identities and braid obstructions

**Burau normalization and low-strand Jones identities.** For a word `b` on
`n≥1` strands with knot closure, let `e` be its exponent sum and let `B_n(b;t)`
be the actual native `TauCeti.KnotTheory.reducedBurauCol` matrix. Pin its
generator convention: in row `i` the nonidentity entries are `1,−t,t`, at
columns `i−1,i,i+1` when present. The normalized Alexander polynomial has
`Δ(t⁻¹)=Δ(t)` and `Δ(1)=1`. Prove the exact determinant comparison

`(1+t+⋯+t^(n−1)) Δ(t) = t^((n−1−e)/2) det(I−B_n(b;t))`.

Prove `e≡n−1 (mod 2)` from the endpoint `n`-cycle. Construct the Laurent
quotient, prove its symmetry, normalization, uniqueness and agreement with
the Seifert/Fox invariant of the realized closure from Layer 4.4. This is an
equality with the unit fixed, beyond association with the native unreduced
corner minor. Consume the native reduced-determinant/corner-minor comparison
where available; this layer supplies the geometric normalization and its fixed
unit. Use `u=t^(1/2)` in the native Jones ring: the Laurent exponent
in the determinant numerator is then `n−1−e`, and the denominator is
`Σ_(j<n) u^(2j)`. First prove the identities over the generic Laurent/fraction
field and then clear denominators and use injectivity to obtain Laurent
identities; specialization must not divide by a vanishing quantum integer.

For every three-strand word, prove the trace comparison

`V_cl(b)(t)=(-u)^e (t+t⁻¹+tr B_3(b;t))`.

For knot closures `e` is even. Combine the determinant character
`det B_3=(-t)^e` with `det(I−B_3)=1−tr B_3+det B_3` to prove

`V_cl(b)(t)=t^(e/2)(t+t⁻¹+1+t^e−t^(e/2−1)(1+t+t²)Δ(t))`.

The `+t` term is required: for `σ₁σ₂`, with `e=2` and `Δ=1`, the result
must be the unknot value `1`. Check also `σ₁³σ₂`, whose closure has
`Δ=t−1+t⁻¹` and `V=t+t³−t⁴`, and their mirrors. Keep the small-term reading
in the course scan separate from this calibrated mathematical identity.

For four-strand knot closures `e` is odd. Prove the reciprocal identity

`t^(−e)V(t)+t^e V(t⁻¹) =`
`(u⁻³+u⁻¹+u+u³)(u^e+u^(−e))−(t⁻²+t⁻¹+2+t+t²)Δ(t)`.

Construct its exact generic Hecke/Temperley–Lieb block comparison rather than
assuming the formula: the three blocks have dimensions `1,3,2`, the
three-dimensional block is the native reduced Burau representation, and the
two-dimensional block `R` has determinant `−t^e`. With
`s=u+u⁻¹`, `D=t+1+t⁻¹` and `C=t²+t+1+t⁻¹+t⁻²`, prove for odd `e`
`V=u^e(C+D tr B_4+tr R)/s`. Prove the parameter-inversion/dual comparisons,
the two-dimensional relation `tr R⁻¹=tr R/det R`, and the three-dimensional
determinant expansion. They cancel the two-dimensional traces in the
reciprocal combination and give the displayed identity after clearing
denominators. Consume the generic block and trace theory from
[TypeAHeckeAlgebras H1–H2](../TypeAHeckeAlgebras/README.md) and the positive
quotient theory from
[TemperleyLiebOperatorAlgebras A1–A3](../TemperleyLiebOperatorAlgebras/README.md);
this layer owns their identification with the native Burau matrices and
realized-closure Jones invariant, including the explicit block weights and
all specialization adapters. Check `σ₁σ₂σ₃`, the four-strand unknot.

**Root-value braid obstructions and a source counterexample.** In the native
Burau-column basis, for a unit-circle parameter `t≠−1`, define the Hermitian
tridiagonal matrix with diagonal `1`, upper off-diagonal `−t/(1+t)` and
lower off-diagonal its complex conjugate. Prove that every elementary Burau
matrix preserves it, and hence so do inverse letters and all braid words.
For three strands at `t=i`, its two leading principal minors are `1,1/2`.
For four strands at `ζ=exp(2πi/5)`, they are
`1,(√5−1)/2,√5−2`. Prove positivity and convert this Hermitian unitarity
to ordinary unitarity. Supply the finite-dimensional determinant estimate
`|det(I−U)|≤2^d` for a unitary `d×d` matrix, and the determinant-formula
evaluation adapters. The Alexander denominator has modulus `1` at each
specified root. Thus three-braid knot closures have `|Δ(i)|≤4`;
symmetry and `Δ(1)=1` make `Δ(i)` an odd integer, giving `|Δ(i)|≤3`.
Four-braid knot closures have the valid bound `|Δ(ζ)|≤8`. Export the
contrapositives as obstructions to *any* three- or four-strand presentation
of the knot, through the geometric closure invariance. These uniform bounds
are not claims of optimality, and no nondegenerate Hermitian form is called
positive without the principal-minor proof. The invariant-form construction
follows Squier (*The Burau representation is unitary*), with the stated
native-basis adapter.

The course's embedded Jones article, physical p93, Corollary 24, asserts
the stronger one-sided threshold `Δ(ζ)>6.5`. This claim is false in the
stated normalization. Give the explicit four-strand word with signed
one-based generator indices

`[2,2,−3,2,3,1,2,2,1,3,−1,3,2,2,1,−2,−3,−3,1]`.

Prove its exponent sum `9` and endpoint permutation `[2,0,3,1]`, a
four-cycle `(0 2 3 1)` on zero-based labels, so its realized closure is a
knot. Prove its exact native determinant/normalized Alexander calculation

`Δ(t)=27−17(t+t⁻¹)+(t²+t⁻²)+5(t³+t⁻³)−3(t⁴+t⁻⁴)+(t⁵+t⁻⁵)`.

It has `Δ(1)=1` and
`Δ(ζ)=36−13√5>13/2`, the inequality being equivalent to `59²>26²·5`. Prove
these values for the realized `PDCode` closure of the word through the
geometric closure invariance, in exact arithmetic. The literal threshold is a
refuted source assertion, not a theorem target.

### 4.5.2 Signed braid Jones support and orientation scope

Let `w : TauCeti.BraidWord n`, with `n≥1`, have `p` positive letters and
`q` negative letters. Counts refer to this word, before cancellation; prove
`p+q=w.length` and that its exponent sum is `p−q`. Use the native Jones
variable `u=t^(1/2)` and the actual coefficient support
`w.closure.jonesPolynomial.coeff.support`. Prove the uniform bounds

`p−3q−n+1 ≤ k ≤ 3p−q+n−1`

for every exponent `k` in that support. Give coefficientwise vanishing outside
the interval and transport the estimates to the realized oriented closure.
The endpoints are integers in the `u` variable; divide by two only when
expressing degrees in `t`.

**State-circle supplier and proof.** For arbitrary native `PDCode` states,
prove that changing one crossing's smoothing changes the circle count by
at most one. Prove the resulting bound by the number of differing crossing
choices, using the native perfect-matchings/traversal model and retaining
all crossing-free circles. This bound does not require planarity or an
assertion that every change is exactly `±1`.

For the braid closure the vertical oriented state is
`s₀(j)=decide(w[j].sign=1)`, equivalently the code's `overPair` function.
Prove that its local `smoothingChoice` is constantly `true`, pairing slots
`0–1` and `2–3`, and that it has exactly `n` circles, including strands
that encounter no crossing. For any state let `r₊` count positive crossings
changed from this state and `r₋` negative crossings changed from it.
The native Jones state weight is
`(-1)^(p+q) u^(p−q+r₊−r₋)` and the circle count `c` is at most
`n+r₊+r₋`. Prove `c≥1` from nonemptiness of the closure before replacing
the native truncated natural subtraction in `c−1` by integer subtraction.
The loop factor `(-u−u⁻¹)^(c−1)` has support between `−(c−1)` and
`c−1`. Every state term therefore has exponents at least
`p−q−n+1−2r₋≥p−3q−n+1`, and at most
`p−q+n−1+2r₊≤3p−q+n−1`. Carry these support inclusions through the
finite state sum; no noncancellation of extreme states is assumed.

**Mirror distinction and its orientation scope.** The closure has `μ≥1`
components and `V(1)=(-2)^(μ−1)≠0`, so its support is nonempty. If
`p−3q−n+1>0`, prove that every exponent is strictly positive. Laurent
inversion then gives support in strictly negative exponents; hence the Jones
polynomial differs from its inverse and from `1`. Conclude that the realized
closure is not an unknot and has no mirror equivalence preserving the
orientations of its components, even allowing component permutation or
simultaneous reversal of all orientations. For knots, simultaneous reversal
is the only extra orientation choice, so this detects ordinary chirality.
For links with several components the conclusion concerns oriented links;
independent reversal of some components requires its actual linking-number
phase and does not preserve the Jones polynomial in general.

**Checks and source convention.** The empty word on `n≥1` strands has
Jones polynomial `(-u−u⁻¹)^(n−1)` and reaches both support endpoints.
The positive one-letter word on two strands has lower endpoint `0` and
unknot polynomial `1`; it must not be declared chiral merely because the
word is a nonidentity braid. The three-positive-letter trefoil has lower
endpoint `2` and native polynomial `u²+u⁶−u⁸`. Swapping positive and
negative letters under mirroring negates the support interval endpoints.

For `σ₁²`, prove `p=2,q=0,n=2`, Jones polynomial `−u−u⁵` and lower
endpoint `1`, and identify its closure with the oriented positive Hopf link.
At the same time identify the underlying Hopf link with the coordinate
circles in `S³⊂ℂ²` and construct the ambient orientation-reversing symmetry
`(z,w)↦(conj z,w)`. It preserves those circles setwise and reverses exactly
one component orientation. This proves the Hopf link is amphicheiral after
forgetting component orientations, while its oriented mirror has a different
Jones polynomial. Knot Theory physical p91's Theorem 5 uses the signed
word-count hypothesis above; retain its amphicheirality wording with this
explicit orientation distinction. Its cited positive-braid signature route
is additionally specified in Layer 6.2; the state-sum proof here has no
dependency on that later signature theorem.

*Needs:* Layers 4.1–4.2 for realized braid closures and mirror/orientation
transport; Layer 4.5's native Jones state sum, mirror inversion and value at
one; native `PDCode` perfect matchings and state traversal; Mathlib finite
sets, permutation orbits, `Finsupp` support and Laurent arithmetic.

### 4.5.3 Fourth-root evaluation, the Arf invariant and the integral W quotient

Specify Knot Theory physical p92's Theorems14–20 on the actual coefficient
rings and realized oriented links. The geometric Seifert quadratic
refinement and proper-link Arf invariant are supplied by the earlier
Seifert-surface stage, independently of these Jones evaluations.

**Integral and half-variable conventions.** Write H_L(u) for native
`OrientedPDCode.jonesPolynomial`, whose variable is `u=t^(1/2)`. For
μ≥1 prove its component-parity support and extract the unique
`P_L∈ℤ[t,t⁻¹]` such that

`H_L(u)=P_L(u²)` for odd μ,
`H_L(u)=u P_L(u²)` for even μ.

Construct this extraction by its coefficient map and prove uniqueness,
relabel/isotopy transport and all evaluation identities. Diagrams here
are planar classical diagrams; no assertion about arbitrary abstract PD
codes substitutes for the geometric hypothesis. In particular a knot
has a canonical integral Laurent polynomial V_K(t)=P_K(t).

**Seifert Gauss sum and the fourth root.** Fix `t=i` and
`u₄=exp(πi/4)`, with positive TL loop parameter `δ=√2`. The
native Jones state-sum circle has value−√2. For F as above set

`G(q_F)=Σ_(x∈H₁(F;𝔽₂)) (−1)^(q_F(x)) ∈ ℤ`.

The exponent uses the explicit0/1 lift of 𝔽₂, not a ring map to ℤ or ℂ.
Use the native `TauCeti.FiniteQuadraticModule.gaussSum` through the
additive value map `𝔽₂→ℚ/ℤ`, `0↦0,1↦1/2`, and prove that its complex
character sum equals this integer sum. Build this Seifert-form adapter;
no second generic finite quadratic-module carrier or Arf invariant is
introduced. Compare its radical reduction with native
`gaussSum_eq_card_mul_gaussSum_quotientOfLeQuadraticRadical`.

If q_F is nonzero on R, choose r∈R with q_F(r)=1 and prove cancellation
by the translation `x↦x+r`, hence G=0. If q_F vanishes on R, construct
the quotient-fibre equivalence and prove
`G(q_F)=2^(μ−1)G(q̄_F)`. Evaluate the paired quadratic planes using Layer 4.3.1's
finite Arf normal form to obtain

`G(q_F)=2^(g+μ−1)(−1)^Arf(L)` for proper L.

Prove the geometric Clifford-trace comparison, with every scalar factor:
for a braid b on m≥1 strands realizing L,

`(−√2)^(m−1) s_m(ρ_Cl(b)) =
   (−1)^(μ−1) (√2)^(−(2g+μ−1)) G(q_F)`.

Consume the generator/trace-preserving even-Clifford model and exact
Jones braid phases of
[TemperleyLiebOperatorAlgebras §1.7](https://github.com/TauCetiProject/TauCetiRoadmap/blob/44be852bd3ac50b5d185d99bc798f1b2ebe0c1bb/TauCetiRoadmap/TemperleyLiebOperatorAlgebras/README.md#17-the-sqrt2-jones-quotient-as-an-even-clifford-algebra).
Construct the finite disc-band/Clifford character-sum reduction and its
comparison with the actual Seifert quadratic form; match the native
closure order, crossing signs, component count and handle normalizations.
Prove invariance under the relevant band slides, common stabilizations
and braid moves. Equality of abstract Clifford algebras alone does not
prove this trace-to-surface identity. It is a required comparison owned
here, and yields, equivalently,

`V_L(i;u₄)=(−√2)^(μ−1) 2^(−(g+μ−1)) G(q_F)`.

Conclude the exact proper/improper-link formula

`V_L(i;u₄)=(−√2)^(μ−1)(−1)^Arf(L)` if L is proper,
`V_L(i;u₄)=0` otherwise.

Give the nonempty unlink, positive Hopf link and positive `T(2,4)` checks:
values `(−√2)^(μ−1)`,0 and `+√2`, respectively; the latter proper link
has Arf1. A knot gives `V_K(i)=(−1)^Arf(K)`. For odd μ a nonzero link
value is a signed integer power of2; for even μ it is a signed √2
multiple of an integer power of2. Thus the two-component unlink is the
explicit boundary case for an unqualified integer-power-of-two claim.

For a proper link L, prove properness is unchanged by reversing a component. If its total
linking with the rest is the even integer ℓ, the native reversal factor
`i^(−3ℓ)=(−1)^(ℓ/2)` gives
`Arf(L_reversed)=Arf(L)+ℓ/2 mod2`. Preserve component order and the
specified root branch in this comparison. Replacing u₄ by−u₄ changes
the Jones value by `(−1)^(μ−1)`; compare conjugate roots explicitly.
The source comparison is with the finite quotient and s_m, not an
unquotiented TL representation with a purported faithful trace.

**Derivative and integral divisibility.** Build the ordinary Laurent
derivative `∂(t^k)=k t^(k−1)` on the native integral Laurent carrier,
including negative exponents, linearity, Leibniz, powers, substitutions
and evaluation. Relate it to analytic differentiation away from0 and,
for half-variable expressions near t=1, to the local square root u(1)=1.
For a nonempty link put `λ=Σ_(j<k)lk(L_j,L_k)`. Prove

`H_L(1)=(−2)^(μ−1)`,
`(∂H_L)(1)=3(−2)^(μ−1)λ`.

Differentiate the pinned native skein relation: a self-crossing change
preserves this derivative, while a mixed crossing change changes it by
`3(−2)^(μ−1)` and changes λ by1. Reduce to the unlink through the
existing finite descending-diagram procedure. For a knot, use
`H_K(u)=V_K(u²)` to deduce `V_K(1)=1` and `(∂V_K)(1)=0` over ℤ,
not by dividing an integer coefficient without justification.

Also own the Jones–Conway specialization with its link phase. Use the
standard-skein normalization `∇_+−∇_−=z∇_0`, obtained from the existing
Conway specialization by the following explicit coefficient conversion.

Here `Δ_L(s²)=∇_L(s−s⁻¹)` is the Conway convention of Layer4.4,
so `H_L(i)=(−1)^(μ−1)Δ_L(−1;s=i)`, equivalently
`H_L(i)=Δ_L(−1;s=−i)`. Retain Layer4.6's compatible HOMFLY substitution.

Prove for every nonempty link

`H_L(i)=∇_L(−2i)=(−1)^(μ−1)∇_L(2i)`.

The native Jones skein at u=i has difference `−2i H_0`, which fixes
this sign. Compare the split-unlink initial values, the Conway
component-parity law and the descending skein computation. Knots give
the usual signed `V_K(−1)=Δ_K(−1)` in both conventions. The positive
Hopf link checks the conversion: Jones gives−2i while ∇(+2i)=+2i.

Prove `V_K(ω)=1` for `ω=exp(2πi/3)` using the existing δ=1 positive
trace quotient and the closure/permutation parity comparison. Deduce
`Φ₃(t)=1+t+t²` divides `1−V_K(t)` integrally, including all negative
powers. With `D(t)=(1−t³)(1−t)=(t−1)²Φ₃(t)`, prove existence and
uniqueness of W_K∈ℤ[t,t⁻¹] satisfying

`D W_K=1−V_K`.

For an integral proof, clear negative powers, factor `(t−1)²` by
monic division using the value and derivative at1, then divide the
remaining polynomial by the monic minimal polynomial Φ₃ of ω. Restore
the Laurent unit and prove independence of the clearing exponent.
Do not assert that `(t−1)` and Φ₃ generate the unit ideal over ℤ:
`Φ₃(1)=3`. The construction is an integral quotient, not division of
specialized complex values where D may vanish. Export its defining
identity, uniqueness, coefficient transport and evaluation at all units;
its values at roots of D come from the Laurent polynomial itself.

Prove

`W_(mirror K)(t)=t^(−4) W_K(t⁻¹)`,
`W_(K#J)=W_K+W_J−D W_K W_J`.

Check W_unknot=0 and W_right-trefoil=1 in the native Jones convention.
Since D(i)=2, prove `W_K(i)` equals exactly the explicit0/1 integer
lift of Arf(K), not merely its class modulo2. With the signed symmetric
Alexander normalization `Δ_K(1)=1`, the Jones–Conway comparison above
at−1 gives

`Δ_K(−1)=1−4W_K(−1)`,
`W_K(−1)≡Arf(K) mod2`,
`Δ_K(−1)≡1−4Arf(K) mod8`.

Prove the middle congruence by the Gaussian-integer evaluation map
`ℤ[i]→𝔽₂`, `i↦1`, and integral Laurent evaluation; it is not a ring
map from 𝔽₂ to ℂ. Thus the signed value is1 mod8 for Arf0 and5 mod8
for Arf1. Compare the absolute determinant separately, where the usual
criterion is `±1` versus `±3` mod8. Check the trefoil's signed value−3,
figure-eight5 and unknot1. The empty link is outside this Arf constructor;
its existing normalized-bracket convention stays separate.

*Needs:* the earlier Seifert-surface/quadratic dictionary, finite common
stabilizations, Layer 4.3.1's finite quadratic Arf classification, native
`IntegralSquareMatrix.SEquivalent`, `Matrix.toQuadraticForm'`,
`QuadraticMap.polarBilin`, `.radical` and `.lift`, native finite-quadratic-module
Gauss sums, native Jones/bracket, geometric Markov/closure comparisons,
the concrete TL Clifford model above, and Mathlib finite sums, polynomial
monic division, Laurent evaluation and complex roots. The new finite
coefficient, radical/fibre, Clifford-to-surface and Laurent-derivative
adapters belong here; no later concordance or bordism-classification
result is a prerequisite. `JonesArfTargets.lean` gives suggested native
matrix, radical quotient and Laurent interfaces. The source's knot
claims and its link-value remark are compared with
[Murakami, *A recursive calculation of the Arf invariant of a link* (1986)](https://www.jstage.jst.go.jp/article/jmath1948/38/2/38_2_335/_pdf),
with the square-root branch converted using the displayed component-parity
law. Follow the native quotient API of
[Mathlib quadratic radical/lift API](https://leanprover-community.github.io/mathlib4_docs/Mathlib/LinearAlgebra/QuadraticForm/Radical.html)
and the existing
[Seifert-matrix API discussion](https://leanprover.zulipchat.com/#narrow/stream/610393-Tau.20Ceti/topic/PRs/near/617671438).

<a id="universal-bracket-coefficients"></a>
### 4.5.4 Universal bracket coefficients and writhe normalization

Use the existing native `TauCeti.TemperleyLieb R c n` over every
commutative ring R. In the two-strand algebra let I=1 and E=e₀, so
E²=cE, and fix the two crossing expansions
`r₊=aI+bE` and `r₋=bI+aE`. These are native `crossing` elements;
construct their particular local matching/PD-slot comparisons, retaining
the convention that the A-smoothing turns left off the over-strand.
Prove the exact identity

```text
r₊r₋=ab I+(a²+b²+abc)E,
r₊r₋=I ↔ ab=1 and a²+b²+abc=0.
```

For necessity use native `twoStrandRep`: E maps to `[[0,0],[1,c]]`,
while I maps to the identity matrix. Its(0,0) and(1,0) entries recover
the two coefficients, proving independence of I,E over R without a
nonzero-divisor or field hypothesis. Reuse native
`crossing_mul_crossing_swap_eq_one_of_polynomial` for sufficiency and
`crossing_braid` for typeIII, with their actual polynomial hypotheses.
Compare the finite two-/three-strand local expansions with the native
PD Reidemeister maps. This uses the existing presented algebra and
particular local matching calculations, without another generic diagram
algebra, diagram-basis theorem or operator-algebraic prerequisite.

**Universal coefficient ring.** In `MvPolynomial (Fin 3) ℤ` write A,B,C
for the three variables. Form the native ideal quotient

```text
Q=ℤ[A,B,C]/(AB−1, A²+B²+ABC).
```

Construct a ring equivalence `Q ≃+* LaurentPolynomial ℤ` sending
A↦T1, B↦T(−1), C↦−T2−T(−2). Construct its inverse from the
unit represented by A with inverse B, prove both inverse laws, and give
computing rules for all three generators and integer coefficients.
Prove the universal mapping property: maps Q→R correspond exactly to
units a∈Rˣ, with b=a⁻¹ and c=−a²−a⁻². Establish coefficient-map
naturality and composition. In particular the open typeII condition
forces the crossing coefficient to be a unit; no inverse of c is required.

**State sums and the trace normalization.** For a finite PD diagram D,
a state s chooses the native A- or B-smoothing at each crossing. Let
α(s),β(s) be the corresponding crossing counts and ℓ(s) its native
`stateLoopCount`, including all crossing-free circles. Define the
unnormalized state sum on all diagrams by

`Z_D(a,b,c)=Σ_s a^α(s)b^β(s)c^ℓ(s)`.

For nonempty diagrams define the reduced bracket

`S_D(a,b,c)=Σ_s a^α(s)b^β(s)c^(ℓ(s)−1)`.

Prove ℓ(s)≥1 on this domain, the two local resolution laws, relabeling
invariance and coefficient-map compatibility. Prove `Z_D=c·S_D` for
nonempty D, without dividing by c. For μ≥1 crossing-free circles the
values are c^μ and c^(μ−1), respectively. The empty diagram has Z=1;
the reduced invariant here has nonempty domain. Native truncated-
subtraction empty-code values are compared separately, rather than used
to extend the nonempty disjoint-circle law to an empty factor.

After the universal coefficient substitution, prove
`S_D(a,a⁻¹,jonesDelta a)=D.kauffmanBracket a` with the actual native
unit parameter a. Reuse native combinatorial typeII/III invariance and
the geometric Reidemeister comparison to obtain regular-isotopy invariance.
For a closed n-strand braid, n≥1, identify the native unnormalized
Markov trace with Z of its realized closure, using its parameter q=a²
and loop c=−(q+q⁻¹). Its writhe-corrected Jones trace is therefore c
times the reduced normalized bracket. Prove this polynomial identity
also at c=0; a vanishing trace factor is not canceled to define the bracket.

**Curls and the ambient invariant.** The positive and negative local
curl factors are `ac+b` and `bc+a`. In Q they are−a³ and−a⁻³,
mutually inverse units. Prove their exact comparison with native signed
kink insertion and the writhe changes+1 and−1. For every nonempty
oriented diagram use

`X_D=((-a³)^(-w(D)))·S_D`.

Prove its equality with native `normalizedKauffmanBracket`, and reuse
native signed move maps plus the geometric comparison for ambient-isotopy
invariance. Writhe reversal under mirror gives a↦a⁻¹; retain the actual
component-orientation transport. Compare with native Jones polynomials
by the coefficient embedding sending the native variable u=t^(1/2) to
A⁻². This is a formal Laurent comparison, not a choice of a fourth-root
branch. The trefoil checks fix its normalization.

**Checks.**

- For the closure of the positive two-strand braid σ₁², prove the reduced
  three-parameter expression `(a²+b²)c+2ab`. Under the universal
  substitution it is−a⁴−a⁻⁴. Give the actual two-crossing Hopf-code
  comparison and its oriented writhe correction.
- Native `rightHandedTrefoilPDCode` has writhe+3 and raw bracket
  `−A⁵−A⁻³+A⁻⁷`; its normalized bracket is
  `A⁻⁴+A⁻¹²−A⁻¹⁶`. Its native mirror has writhe−3 and raw bracket
  `A⁷−A³−A⁻⁵`, giving `−A¹⁶+A¹²+A⁴`. Under t=A⁻⁴ these give
  the prescribed right/left trefoil Jones polynomials. Prove the mirror
  comparison on the actual native diagrams.
- In `ZMod 2` with a=1, the loop value is0. The unknot still has
  reduced bracket1 and unnormalized trace0. Both state sums, curls and
  local inverse identities remain defined at this specialization.
- The scalar assignment(a,b,c)=(1,0,1) over ℤ gives reduced bracket1
  on every nonempty closed diagram. Its open typeII product is E≠I,
  as detected by `twoStrandRep`. Thus the universal ring above classifies
  the specified open local inverse relation; closed scalar invariance
  alone does not imply that relation.

*Needs:* Layer4.2 (realized diagrams and geometric Reidemeister comparison),
Layer4.5 (native bracket and Jones conventions); Mathlib `MvPolynomial`,
`Ideal.Quotient`, `LaurentPolynomial` and units; native
`TauCeti.Algebra.TemperleyLieb.Basic`, `TauCeti.KnotTheory.TemperleyLieb`,
PD state counts, Kauffman brackets, signed kink and typeII/III APIs.
Use [Kauffman, §2, Lemmas2.3–2.4 and Theorems2.6–2.8](https://webhomes.maths.ed.ac.uk/~v1ranick/papers/kauffmanjones.pdf)
for the state model and regular-to-ambient normalization.

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

Construct Kauffman's two-variable F and the absolute polynomial Q by the
complete nonempty-diagram skein, curl, normalization and specialization
contract in [Layer4.6.1](#kauffman-f-q).

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

<a id="kauffman-f-q"></a>
### 4.6.1 Kauffman's regular-isotopy polynomial and absolute Q

Work on nonempty realized diagrams, including crossing-free circles, using
Layer4.2's planar PD/outer-face carrier and geometric Reidemeister theorem.
Use the coefficient ring `R=LaurentPolynomial (LaurentPolynomial ℤ)`:
the outer variable is a and the inner variable x. Exponents in both
variables are integral. Supply coefficient queries, finite support,
monomial arithmetic and the universal evaluation map into a commutative
ring with chosen unit images for a and x. Reuse native Laurent evaluation
and inversion; do not construct a second multivariable polynomial theory.

**Regular-isotopy construction.** Construct Λ on unoriented diagrams with
`Λ(unknot)=1` and the local sum relation
`Λ(D₊)+Λ(D₋)=x(Λ(D₀)+Λ(D∞))`. Here D₊ and D₋ differ by switching one
crossing, and D₀,D∞ are its two unoriented smoothings; their order does
not affect the sum. Give all four finite local PD/port models and their
realization comparison. A positive curl, of local writhe change+1,
multiplies Λ by a; the opposite curl multiplies it by a⁻¹. These are
attached curls, not detached trivial components. Pin their signs by the
standing crossing convention rather than an unlabelled sketch. Applying
the sum relation to a curl gives `d=(a+a⁻¹)x⁻¹−1`; prove that adjoining
a detached circle to a nonempty diagram multiplies Λ by d.

Build a terminating skein algorithm with ordered components, traversal
orientations and basepoints as auxiliary data, using the lexicographic
measure (crossing count, number of bad crossings). Switch the first bad
crossing to lower the second entry for the fixed traversal; either smoothing
lowers the first entry. Evaluate descending leaves by an actual unlink
reduction recording all curl factors. Prove independence of these auxiliary
choices and resolution order, relabeling/plane-isotopy invariance, and
invariance under every RII/RIII local model. Prove uniqueness among
regular-isotopy invariants satisfying the normalization and these local
relations. The algorithm is a finite coefficient computation, not just an
existential invariant. Its correctness includes the geometric diagram
comparisons; polynomial outputs alone do not identify a knot.

**Writhe correction and Q.** For an oriented diagram D set
`F_D=a^(−w(D))Λ_|D|`. The factor is a Laurent monomial; no inverse of
Λ is needed. Prove the two RI corrections, RII/RIII invariance and descent
to the oriented link type, with naturality under presentation changes.
For arbitrary orientations on the four diagrams in the unoriented skein
quadruple, export the weighted relation

```text
a^w₊ F₊ + a^w₋ F₋ = x(a^w₀ F₀ + a^w∞ F∞).
```

The second smoothing has no implicit compatible orientation; its chosen
writhe is retained. In particular the unweighted Λ relation is not asserted
unchanged for F. Define the ring homomorphism `ev₁:R→+*ℤ[x^{±1}]` by
`a↦1,x↦x`, and set `Q_L=ev₁(F_L)`. Prove `ev₁(Λ)=ev₁(F)` and the
unoriented skein relation, ambient invariance and normalization `Q(unknot)=1`.
Prove the corresponding terminating construction and uniqueness for Q.

For a subset S of ordered components let
`C_S=Σ_{i∈S,j∉S}lk(L_i,L_j)`, each separated pair counted once, using the
earlier oriented linking number. Reversing precisely S changes writhe by
`−4C_S`, so prove `F_(L^S)=a^(4C_S)F_L`. Include empty/all S and successive
reversals with linking numbers recomputed after the first reversal.
Thus Q is independent of all component orientations. Reflection inverts
a and fixes x: prove `Λ_mirror(a,x)=Λ(a⁻¹,x)` and the corresponding F law.
Consequently Q is also mirror invariant. Preserve the distinction between
these facts and simultaneous orientation reversal of F. The Jones
component-reversal factor from Layer4.5 agrees after the comparison below.

**Unlinks, joins and examples.** For μ≥1 prove
`Λ(U_μ)=F(U_μ)=d^(μ−1)` and `Q(U_μ)=(2x⁻¹−1)^(μ−1)`.
For nonempty factors prove the split-union laws with one factor d for Λ,F,
and `2x⁻¹−1` for Q. Construct standard component connected sums in disjoint balls joined
by the untwisted oriented band. Retain the chosen components and joining
arcs; prove independence of standard joining data for those components,
naturality under reindexing, multiplicativity and component count
`μ(L)+μ(J)−1`. Arbitrary band sums are not assigned this formula.
No empty-link value or split-union law with an empty factor is implicit.

Compute the unknot, both curl models, the two-component unlink, positive
Hopf link and both trefoils from realized codes, including the full skein
trees and curl/port comparisons. For the closure of σ₁ⁿ set Λ_n to its
regular polynomial. Prove Λ_0=d, Λ_1=a and, for n≥2,
`Λ_n+Λ_(n−2)=x(Λ_(n−1)+a^(−(n−1)))`. The turnback smoothing
is identified by a finite cup/cap isotopy with n−1 negative curls;
include this certificate rather than guessing its framing. Negative powers
follow by reflection. For the right-handed trefoil require

```text
F=(a⁻²+a⁻⁴)x²+(a⁻³+a⁻⁵)x−2a⁻²−a⁻⁴,
Q=2x²+2x−3.
```

For the positive Hopf link require
`F=(a⁻¹+a⁻³)(x−x⁻¹)+a⁻²`, hence `Q=2x−2x⁻¹+1`.
Use these checks to verify the mirror and component-reversal factors.

**Checks.**

- Either attached curl leaves normalized F unchanged; a curled unknot has Q=1.
- The crossing-free two-component unlink has F=d and Q=`2x⁻¹−1`.
- The positive Hopf mirror has F equal to `a⁴F_Hopf`, matching reversal of
  one component with linking number1, while Q is unchanged. Reflection
  inverts a in the trefoil formula and leaves its Q unchanged.

**Jones comparison with denominators.** Into native `RatFunc ℚ`, with
indeterminate A, construct the coefficient map `a↦−A³,x↦A+A⁻¹` by two
native Laurent evaluations. Prove both images nonzero and explicitly give
their inverses; `A+A⁻¹` is not a unit in the integer Laurent ring, so that
ring is not the target of a homomorphism on all R. The map sends d to
`−A²−A⁻²`. Prove its value on Λ equals the native unknot-normalized
`TauCeti.PDCode.kauffmanBracket` by the local skein/curl laws and uniqueness,
and its value on F equals `TauCeti.OrientedPDCode.normalizedKauffmanBracket`.
Use the native Jones comparison at `t=A⁻⁴`, with the half-variable
`t¹ᐟ²=A⁻²`. These invariant values lie in the embedded integer Laurent
subring; prove that descent before evaluating at numerical A. This does
not extend coefficient evaluation through a zero denominator. The trefoil
maps to `t+t³−t⁴`, and the Hopf link to `−t¹ᐟ²−t⁵ᐟ²`.

**Separation computations.** Supply explicit realized PD/Gauss codes,
finite skein certificates and complete coefficient lists for the two
pairs below. For the first pair, use the representatives
of [Lickorish–Millett, Example16](https://web.math.ucsb.edu/~millett/Papers/1987Millett9LickorishTopology.pdf):
the same-HOMFLY pair is 8₈ and the obverse (mirror) of their 10₁₂₉.
Prove the mirror/variable adapter to the HOMFLY convention here, then prove
P equality and Q inequality; Q's mirror invariance makes that separation
independent of this mirror choice. For the second pair use the alternating
11-crossing knots numbered255 and257 in Conway's enumeration, as named in
[Ng, §8.6](https://sites.math.duke.edu/~ng/math/papers/knotI.pdf).
Give their exact diagram-to-enumeration identification and an explicit
conversion before using a different modern table's indices. Prove equality
of F and inequalities of P, Conway and normalized Alexander polynomials,
with an explicit differing coefficient for each inequality. Retain the
Conway-enumeration labels11₂₅₅/11₂₅₇ until this conversion is proved. Polynomial
equality is not a certificate for these diagram identifications. These
pairs prove that neither F nor P determines the other on knots; finite
support/term counts are computed from their actual coefficient lists,
not used as a general comparison of invariant strength.

The plus-skein and curl
convention is Kauffman's [regular-isotopy polynomial](https://homepages.math.uic.edu/~kauffman/IRH.pdf);
use it consistently rather than the different Dubrovnik skein convention.

*Needs:* Layer4.2 (realized planar diagrams and Reidemeister), Layer4.3
(oriented linking), Layer4.5 (native bracket/Jones), Layer4.6 (HOMFLY and its
mirror convention); Mathlib `LaurentPolynomial.eval₂`, `LaurentPolynomial.invert`,
`RatFunc`; Tau Ceti `TauCeti.PDCode`, `TauCeti.OrientedPDCode` and their native
bracket, writhe and normalized bracket APIs.

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
in particular nonzero. Use Layer 4.3's `knotArfInvariant`, constructed from the nonsingular Seifert quadratic
refinement `q(x)=θ(x,x) mod2`; its surface independence and connected-sum additivity
retain that earlier owner. Prove it is `0` iff `Δ_K(−1) ≡ ±1 (mod8)` (Lickorish,
Chapter10), with the signed normalization and absolute-determinant comparison of
Layer4.5.3. Proper links use the earlier polar-radical quotient constructor.

**Checkerboard row dependencies and reduced presentations.** For a realized
oriented knot diagram with c≥1 crossings, construct the arcs between
successive undercrossings and prove there are exactly c arcs. Define its
integer crossing matrix by `2·over−under_in−under_out`, adding coefficients
when arc indices coincide. Thus A·1=0. Construct the linear comparison
with the native half-edge Fox constraints by restriction and unique
propagation along each arc, including every overstrand and repeated slot.
Use native PD faces and the outer face to construct the checkerboard parity of every region: a generic path
to the unbounded region counts transverse strand intersections modulo 2.
Prove independence of that path, including its local perturbations, and
comparison with the finite face/edge adjacency equations.

At each crossing mark the sector just before the oriented overcrossing
and to its right. Set ε_i=+1 for odd region parity and −1 for even parity.
Prove that this gives a unit-valued vector and `εᵀA=0`. Track the right-hand
region along an entire oriented arc: at an undercrossing its sign is −ε
just before and +ε just after, while an overcrossing changes it from +ε
to −ε. The resulting telescoping equation is
`2Σ ε_over−ε_start−ε_end=0`. Include every repeated incidence and arcs
with no interior overcrossing. Prove naturality under code relabeling and
plane isotopy. Global orientation reversal preserves ε; reversing the
checkerboard choice negates the whole vector. These are actual marked-
sector and traversal comparisons, not an assumed row-dependency vector.

For every square integer matrix A of positive size with A·1=0 and a left-kernel
vector ε valued in `ℤˣ`, let B_ij be the matrix obtained by deleting row i
and column j, with the remaining indices in increasing order. Construct
explicit integral matrices P,Q with unit determinants satisfying
`B_kl=P B_ij Q` for any two deletions. Prove the exact signed
cofactor identity, with zero-based indices,

```text
(-1)^(i+j) det B_ij = ε_i κ
```

for a common integer κ. Thus all reduced determinants have the same
absolute value. No rank or nonsingularity premise is needed for these
transport statements; singular minors give κ=0. Reuse the existing
integer-presentation/Smith API to transport the presented abelian group
and invariant factors. The row-relation convention presents the cokernel
of the transpose; retain this convention in the basis-change maps.
On the full row-presentation module P=coker(Aᵀ), construct the augmentation
to ℤ sending every arc generator to 1, and its section from a chosen arc j.
Identify `P/ℤ·[arc_j]` with its augmentation kernel and with coker(B_ijᵀ),
giving `P≃ℤ⊕coker(B_ijᵀ)` and its coloring comparison via Hom(P,R).

Over every commutative ring R, construct the linear equivalence between
`ker(B_ij:R^(c−1)→R^(c−1))` and the full coloring kernel modulo its
global constants. Extend the reduced vector with color 0 at arc j; the
unit coefficient ε_i reconstructs the omitted row equation. Restriction
is its inverse on normalized colorings. For a change of base arc j to l,
give the explicit map `x↦x−x_l·1`, its inverse and the corresponding
reduced-coordinate matrix. Prove relabeling and entrywise coefficient-map
naturality, with each kernel constructed over its stated coefficient ring. This supplies row/column independence over composite moduli
as well as fields; singularity of A alone is insufficient to justify
deleting an arbitrary row.

Include the one-crossing kink: all three arc indices agree, A=[0],
and its reduced matrix is empty with determinant 1 and zero-dimensional
based coloring space. The crossing-free unknot instead has one arc and
no crossing relation; its reduced presentation is also empty. Keep the
general-link half-edge/crossing-free-component presentation: an over-only
component can contribute an arc without an undercrossing, so the square
c-by-c arc convention is a knot branch.

The checkerboard construction consumes Layer 4.2's actual planar faces,
outer region and strand traversal. Reuse native `PDCode.face`/`facePerm`,
finite matrix submatrices and `Fin.succAbove`, unit-valued vectors and
native kernels/quotients. Build the marked-sector adapter and cofactor
transports here, before the based-rank applications. Compare the
all-ones dependency special case with [Kolay, §4, Proposition 4](https://arxiv.org/html/1910.08044#S4).

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

### 4.7.1 Based Fox colorings, numerical bounds and independent prime ranks

Supply the linear and geometric proofs used in *Knot Theory*, physical
pp100–104: bridge index versus maximal overpasses, mod-p rank versus bridge
and unknotting number, the square-knot obstruction, and independence of
the ranks at different odd primes. Use the existing general quandle,
Fox/Goeritz and integral-presentation contracts; this stage makes their
linear carriers and numerical comparison maps explicit.

**Native kernel and normalization.** For `D:PDCode n` put
`S_D=Fin(4n) ⊕ Fin D.crossinglessComponentCount`. Over a commutative ring
R define `Col_R(D)` as the kernel of a linear constraint map on
`S_D→R`. Its equations identify the two ends of every native `edgePair`
arc, identify the two opposite overpassing slots at each crossing, and
impose `2 over=under₁+under₂`. For `overPair=false` the over-slots are0,2
and under-slots1,3; for true they exchange roles. Prove the equation and
coefficient formulas, finite row indexing, coordinate evaluations and
the explicit R-linear equivalence with the earlier arc-coloring module.
Every crossing-free circle contributes one coordinate. For R=`ZMod m`
compare the equations with native `Quandle.Dihedral m`, whose operation
is `2a−b`; no second dihedral-quandle construction is needed.

For a chosen site a let `Based_R(D,a)=ker(ev_a:Col_R(D)→ₗ[R]R)`.
Global constant colorings give a section of ev_a, and construct

`Col_R(D)≃ₗ[R]R×Based_R(D,a)`,
`Based_R(D,a)≃ₗ[R]Col_R(D)/globalConstants`.

Use `f↦(f(a),f−constant(f(a)))` and its explicit inverse. Give change of
base-site isomorphisms, naturality and composition. Coefficient-ring maps
give the pointwise semilinear maps between the color kernels. The quotient
is by global constants; arbitrary
per-component constants need not satisfy the equations. Include the empty
diagram, whose full module is0 and has no base site, and the crossing-free
unknot, whose full module is R and based module0. For a nonempty link over
`F_p=ZMod p`, p prime, define `r_p(D)=finrank Based_(F_p)(D,a)`, prove
independence of a, and export full dimension `r_p+1` and coloring count
`p^(r_p+1)`. In characteristic2 the equations make color constant along
each physical component; give the equivalence `Col_(F₂)(D)≃F₂^μ` and
`r_2=μ−1`. Thus r_2=0 for every knot.

Prove relabelling, mirror and component-reversal transport, and upgrade
the earlier Reidemeister color bijections to linear equivalences carrying
constants to constants. If a base site is carried outside a local move,
preserve its evaluation; otherwise give the base-change adapter. Descend
r_p to the realized tame link using the earlier diagram/isotopy theorem.
Use the integral matrix/Smith equivalences already required here to
identify this rank with the source's reduced-matrix nullity.
Expose the universal abelian presentation of any such finite linear
system: coordinate generators and the rows of its constraint matrix as
relations give `coker(Aᵀ)`, whose additive homomorphisms to R are its
R-colorings. Supply this adapter for the cut tangles below as well as
closed diagrams. Use native PID/submodule and Smith APIs, and build the
remaining rectangular integer-presentation adapter here: unimodular
row/column equivalences, positive divisibility-ordered invariant factors,
free rank and torsion decomposition, allowing zero rows/columns. Prove
`P⊗_ℤ R≃coker(A_Rᵀ)` for the presentation and derive finite-field color
dimensions by duality with that cokernel. The tensor comparison concerns
presentations; colorings are their Hom modules, including new torsion
solutions after coefficient reduction. This is the same
integral presentation theory used by the determinant/Smith comparisons,
not a second matrix convention.

**One crossing changes rank by at most one.** A crossing change at i
updates only `D.overPair i` to its negation. Keep halfedges, arc matching
and crossing-free coordinates fixed, so both coloring modules are
submodules of the same R-module. Define the local difference
`d_i(f)=f(slot0)−f(slot1)`. Within either coloring space, d_i=0 is
equivalent to equality of all four local colors: over-continuity and the
Fox equation force the remaining equality without dividing by2. Prove

`Col_R(D)∩ker d_i = Col_R(change_i D)∩ker d_i`.

Intersect with the same base evaluation kernel. Over every field the
common subspace has codimension at most1 in each based coloring space,
by the kernel/range dimension theorem for a functional to that field.
Export both natural-number inequalities and the integer absolute bound
`|r_p(D)−r_p(change_i D)|≤1`. This argument includes p=2 and needs no
choice of a deleted arc, a nonzero local difference, or a nonsingular
matrix. Transport the update to the actual geometric crossing-change
movie; planarity, component count and the underlying oriented strands
are preserved.

For knots, give the geometric/combinatorial path characterization of
unknotting number u: a finite path of realized diagrams uses Reidemeister
moves freely and counts just its crossing changes. Prove equality with
the minimum, over all representative diagrams, of the number of crossing
changes made in that diagram. Supply the geometric path-to-one-diagram
comparison, existence by the descending-diagram construction and attainment by
well-ordering. Iterate the rank bound along the path from K to the
unknot to obtain `r_p(K)≤u(K)`. This proves the source's arbitrary-u
inequality as well as its stated u=1 special case, independently of the
signature bound.

**Bridge restriction.** Supply the equivalence from physical p101's
Proposition7.4 between the minimum number of maximal overpasses and the
minimum number of Morse height maxima in a knot representative. Give
both normal-form isotopies and the overpass/underpass decomposition,
retaining the marked arcs needed for labels. The no-crossing unknot has
one bridge, not zero. Prove the existence and attained minimum b(K),
with every b-bridge presentation satisfying b≥1.
Write `b(K)=br(K)` for this invariant; the notes call its height version
brg(K).

In a b-overpass diagram restrict colors to the b overpass labels. Along
an underpass, starting from its adjoining overpass, use
`out=2 over−in` to reconstruct each subsequent label. Prove this walks
every arc and yields an injective linear restriction
`Col_(F_p)(D)→ₗ[F_p](Fin b→F_p)`. Normalize at one overpass: its based
image lies in that coordinate hyperplane, giving

`r_p(K)+1≤b(K)`, equivalently `r_p(K)≤b(K)−1`.

The proof uses an actual overpass presentation obtained from a bridge
position, not the count of arbitrarily designated arcs in a diagram.
Schubert's connected-sum lower bound is a separate theorem and is not
an input to this coloring bound. These minima are the bridge and
unknotting invariants used by the subsequent numerical-invariant stage.

**Cut ends and connected sum over every coefficient ring.** Construct
the colored cut-knot 1-tangle and prove its two boundary colors agree
before asserting a restriction map back to closed summands. At odd
characteristic the auxiliary unknot sliding beneath the tangle gives
`2c(left)=2c(right)` and hence equality; in characteristic2 use continuity
along its single interval. Give the actual relative Reidemeister movie
and extension/restriction of labels, including a crossing-free interval.

To retain the all-ring Fox-module and even-modulus statements, construct
the universal finite abelian presentation
`P=coker(A_tangleᵀ)`, so its labelings in R are
`Hom_ℤ(P,R_add)`, not P itself. If d is the difference of its two boundary
generator classes, the same auxiliary movie gives `2d=0`. Over ℚ the
ends then agree, so closing the tangle adds no rational relation; the
earlier nonzero knot determinant gives `rank_ℤ P=1`. Modulo2 its single
interval gives one-dimensional colorings. Use finite-dimensional duality
to identify these dimensions with `P⊗ℚ` and `P⊗F₂`, then the earlier
finite-presentation Smith theorem excludes even torsion invariant
factors. Thus multiplication by2 is injective on P, d=0 integrally and
every R-labeling has equal cut-end colors. Include the zero ring. This
uses the already prior closed-knot determinant and Smith producers,
without assuming the connected-sum formula being proved.

Now construct the evaluation-preserving linear fiber-product comparison
for marked connected sums. Restriction to the two closed summands is
inverse to gluing their equal-colored marked arcs. Normalize both marked
colors to0 to obtain

`Based_R(K#J)≃ₗ[R]Based_R(K)×Based_R(J)`.

Give the actual finite diagram and ambient-isotopy transports, associativity,
base changes, unknot identity and iteration over finite families. Deduce
`r_p(K#J)=r_p(K)+r_p(J)`. Disjoint union instead gives the product of
full color modules and the global-constant quotient adds one to the sum
of the two based dimensions; keep these two operations distinct.

**Explicit independent-prime families.** For each odd prime q use the
realized closure of the positive two-braid `σ₁^q`, namely T(2,q).
The odd endpoint permutation proves it is a knot. In column coordinates
its crossing transfer is the native unreduced Burau matrix at t=−1,

`M=[[2,−1],[1,0]]=I+N`, `N=[[1,−1],[1,−1]]`, `N²=0`.

Compare its generator order with the chosen braid/PD closure by actual
label propagation, including the inverse crossing. Prove `M^m=I+mN`
integrally for m≥0, and the signed-power version for reversed twists.
The fixed-color closure condition is `m(x−y)=0`. Give the all-ring
linear equivalence of the full two-braid coloring module with
`R×ker(m·:R→ₗ[R]R)`. This is more precise than inferring dimension
from determinant alone. Hence for every prime p,

`r_p(T(2,q))=1` if p=q, and0 otherwise.

For a finite set S of odd primes and natural multiplicities k_q, construct
the actual iterated marked connected sum of k_q copies of T(2,q).
Its ranks are k_p for p∈S and0 at every other prime, and its determinant
is `∏_(q∈S)q^(k_q)`. Empty S and all-zero multiplicities give the
unknot. Conversely prove the contributing primes of any knot form a
finite set of odd divisors of its nonzero determinant, via the actual
integral presentation. The source's finite-prime independence has the
necessary p=2 forced-zero qualification. For pp104's concrete two-prime
example use k trefoils and j cinquefoils T(2,5), giving r_3=k and r_5=j.
Its “5-twist” shorthand does not denote5₂, whose determinant is7.

**Finite geometric calibrations.** For the square knot
`T(2,3)#mirror(T(2,3))`, prove r_3=2 and therefore u≥2. Change one
crossing in each ±3 two-braid factor to obtain exponent±1; give the
Reidemeister reductions to unknots and the connected-sum gluing, proving
u≤2 and hence u=2. Its zero signature is a separate comparison with
the signature stage, not a premise of this obstruction.

For the standard P(3,3,3) three-twist-box diagram construct a realized
nine-crossing plane code, its twist/arc identification and component
count1. Prove its based mod3 coloring dimension2. One explicit route
compares the reduced Fox presentation with the checkerboard Goeritz
matrix `G=[[6,−3],[−3,6]]` and certifies

`[[-1,0],[2,1]] G [[0,1],[1,2]]=diag(3,9)`,

with both changes of basis unimodular. Give the actual arc/region
presentation equivalences; determinant27 alone does not prove nullity2.
A realized three-overpass presentation gives b≤3; r_3+1≤b gives b≥3.
Thus b(P(3,3,3))=3, including the precise source lower-bound argument.

*Needs:* native PD pairing/overpass/component data, native
`Quandle.Dihedral`, `Submodule`, `LinearMap.ker/range`, finite-dimensional
rank-nullity and rectangular integral Smith presentations; the earlier
coloring/Reidemeister and nonzero knot-determinant comparisons; realized
diagrams, relative tangle moves, marked connected sums and two-braid
closure. The geometric minimum/overpass and crossing-path adapters,
based normalization, rank comparisons and finite family certificates
are targets here. `ColorRankTargets.lean` prototypes the native kernel,
constant split, common crossing kernel, rank bounds and two-strand
transfer; the full geometric and independence APIs above are required.
Compare [Przytycki, Lemmas1.5 and2.2](https://arxiv.org/html/math/0608172#S2)
for the coloring, connected-sum and numerical bounds, while retaining
the explicit prime/ring hypotheses and native coordinate adapters here.


<a id="transposition-bridge-labels"></a>
### 4.7.2 Transposition labels and the bridge bound

Use native `Quandle.Conj G` for group labels, with positive crossing action
`H(s,t)=(s t s⁻¹,s)` and the inverse action at a negative crossing.
Construct the signed, oriented Reidemeister coloring bijections and prove
that they preserve the subgroup generated by all arc labels. Include
crossing-free components and compare Layer4.2's realized braid action
with Layer4.4's Wirtinger presentation. A labeling that generates G is a separate condition
from being nonconstant or having all labels in a fixed conjugacy class.

For a set S of native `Equiv.Perm (Fin N)` satisfying
`∀ s∈S, s.IsSwap`, use the native `SimpleGraph (Fin N)` with
`Adj x y := x≠y ∧ Equiv.swap x y∈S`. Prove that graph reachability
coincides with the orbits of `Subgroup.closure S`, and identify its native
connected-component quotient with the orbit quotient. Prove that the
subgroup contains every transposition within each component. Consequently
`Subgroup.closure S=⊤` iff the graph is `Preconnected`; for N≥1 this is
also equivalent to `Connected`. Keep N=0 and N=1 in the API. Identify the
edge set with S, so `Nat.card graph.edgeSet=S.ncard`. For finite S with `Subgroup.closure S=⊤`, derive
`N−1≤S.ncard` from Mathlib's
`SimpleGraph.Connected.card_vert_le_card_edgeSet_add_one`, handling N=0
separately. The existing Hurwitz bound in
`TauCeti.GroupTheory.Perm.SwapFactors` supplies the corresponding list
bound; consume its orbit-count theory rather than duplicate it. Repeated
bridge labels are allowed: their image set has cardinality at most the
number of bridges. Unrestricted group generator rank is not this invariant.

In a realized b-overpass representative, walk each underpass and construct
its labels as conjugation or inverse-conjugation words in the bridge
labels. Prove explicitly
`closure(range bridgeLabels)=closure(range allArcLabels)`.
Use the earlier maxima/overpass comparison and subgroup-preserving coloring
transport to apply this on every bridge representative. Thus a tame knot K
with a generating transposition labeling in S_N, N≥2, satisfies
`br(K)≥N−1`. No bound growing with N follows from a constant labeling.

Calibrate this with the positive trefoil, the realized closure of σ₁³.
The incoming pair `(12),(23)` is fixed by H³; the three arc labels
`(12),(23),(13)` satisfy all conjugation equations and generate S₃.
Supply their braid/arc correspondence and the two-bridge realization.
Together with nontriviality this gives br=2, refuting the printed bound
br≥N and attaining the corrected N−1 bound.

For a finite family of native `Equiv.Perm.IsThreeCycle` labels c_i,
prove that any ordered transposition factorizations `c_i=a_i*b_i`
have exactly the same generated orbit relation as the original cycles:
each factor pair forms a connected two-edge tree on its three-letter
support. Include unused letters as isolated vertices. Hence transitivity
of the cycles implies that their factors generate S_N; the even cycles
themselves need not generate S_N. Use native support, `MulAction.orbitRel`
and swap-factor APIs, without a second hypergraph or permutation theory.
[TranspositionBridgeTargets.lean](TranspositionBridgeTargets.lean) records
the narrow native adapters and proved finite trefoil certificates; the
geometric coloring and bridge comparisons are required targets here.

<a id="pretzel-transposition-colorings"></a>
### 4.7.3 Signed pretzel diagrams and transposition labelings

For p,q,r∈ℤ construct the marked standard three-box pretzel diagram
P(p,q,r). Each box is a two-strand braid in its downward local frame,
with p,q,r signed half twists, respectively; zero means two vertical arcs.
Its three top caps have labels x,y,z, so the box input pairs are
(x,y),(y,z),(z,x). Join each right endpoint to the next box's left endpoint,
at both top and bottom, using the standard planar caps including the outer
pair. Give the finite planar code with `|p|+|q|+|r|` crossings, crossing-free
components, cap correspondence and spatial realization. Global component
orientations are separate from the downward box frames.

Compute the geometric components by the endpoint involutions: all odd
parameters or exactly one even parameter give a knot; exactly two even
give two components; all even give three. Include zero and negative
parameters. Construct the spatial cyclic rotation and order-reversing
rotation of the boxes, with endpoint/crossing and orientation transport.
These give the full parameter S₃ symmetry of the unoriented three-box
links. Prove the symmetry maps' composition laws and retain their induced
component orientations. Transport colorings through those actual isotopies rather than
assuming an arbitrary permutation of top labels preserves a chosen code.

**Integer twist and closure API.** Use native `Quandle.Conj G` and group
multiplication from right to left. For involutions x,y, the positive
crossing map is `H(x,y)=(xyx⁻¹,x)` and its inverse is
`H⁻¹(u,v)=(v,v⁻¹uv)`. Prove the signed p-fold transfer for every p∈ℤ:

```text
T_p(x,y)=((xy)^p x,(xy)^(p−1)x).
```

Prove the p=0 identity, positive and negative recurrences, composition,
product preservation and involutivity of both output labels. Compare them
with every crossing and port of the realized signed box. For native
transpositions in S₄ define a consistent incoming triple by the equations

```text
(a) (xy)^p x = (zx)^(r−1)z,
(b) (zx)^r z = (yz)^(q−1)y,
(c) (yz)^q y = (xy)^(p−1)x.
```

Prove (a),(b) imply(c), including all negative and zero exponents.
Restriction to the top caps and propagation are mutually inverse between
these triples and actual diagram colorings. Prove that their generated
subgroup equals that generated by all arc labels. Relabeling and
diagram-isotopy transports preserve that subgroup. Simultaneous
conjugation conjugates the subgroup, preserving its conjugacy class and
the full-S₄ generation condition. Constant transposition labelings exist for every parameter
triple; a requirement to generate S₄ must be stated explicitly.

**Complete image classification.** Every subgroup generated by
transpositions in S₄ is the product of symmetric groups on its support-graph
components, using Layer4.7.2's path/swap and orbit adapters. For a nonempty
pretzel coloring the possibilities up to conjugation, and the exact
conditions for each to occur, are:

| Generated image | Necessary and sufficient parameter condition |
| --- | --- |
| C₂, one transposition | Always; all arc labels are that transposition. |
| C₂×C₂, two disjoint transpositions | At least two of p,q,r are even. |
| S₃ fixing one letter | `3 ∣ pq+pr+qr`. |
| S₄ | At least two parameters are divisible by3, and each parameter is either divisible by3 or even. |

The image conditions can hold simultaneously for different colorings.
For the Klein-four case prove labels are constant on each link component,
and that assigning both disjoint transpositions to the components gives
exactly these nonconstant colorings. This case cannot occur for a knot.

For full S₄ image the three top swaps form a tree on four letters.
Classify the ordered trees under simultaneous conjugation: a star, or a
path with its middle edge in one of the three positions. For the fixed
star `(12),(13),(14)` prove (a),(b) hold iff p,q,r are all divisible by3.
For the fixed path `(12),(23),(34)` prove they hold iff p,q are divisible
by3 and r is even. The other middle-edge positions give the corresponding
permuted conditions. Use this complete ordered classification to prove
the S₄ row of the table, without treating every ordered path as conjugate
to that single ordering. Products of two swaps have orders1,2 or3;
prove the reduction to p,q,r modulo6 and give finite certificates for all
216 residue triples and all216 incoming swap triples. Export a decision
procedure and an actual labeling witness when each condition holds.

For the S₃ row identify its three swaps with the native dihedral quandle
on `ZMod 3`. If u=x−z and v=y−z are the based top colors, show that
(a),(b) become the kernel equations for

```text
L(p,q,r) = [[p+r, −p], [−r, −q]] over ZMod 3,
det L = −(pq+pr+qr).
```

Construct the full Fox-coloring equivalence with `ZMod 3 × ker L`, where
the first factor is the global constant z, and the based equivalence with
`ker L`. Thus its reduced mod3 rank is2 when all parameters are divisible
by3,1 when the determinant vanishes but L is nonzero, and0 otherwise.
A nonconstant three-swap coloring generates S₃, proving the table's
criterion. This is an explicit coloring-space comparison, not a deduction
of nullity from an integer determinant alone.

**Checks.**

- P(3,3,3) has the stated star coloring, with every crossing/cap equation
  and full-image certificate. Its transposition colorings in S₄ number126:
  six constant C₂-image colorings,96 with S₃ image and24 with S₄ image.
  Compare its based mod3 rank2 with Layer4.7.1's Fox/Goeritz computation.
- P(3,3,4) has the fixed path coloring; P(3,3,5) has no S₄-generating
  transposition coloring. The ordered path also works for r=0,−2 and6
  with p=q=3, verifying the even-parameter condition.
- P(0,0,0) is the three-component unlink. Every incoming swap triple
  closes, including the Klein-four and full S₄ cases; do not apply the
  knot-only exclusion of the Klein-four image to it.
- Construct the three-maximum bridge position from the marked caps and
  monotone twist boxes. For every knot in the S₄ row, Layer4.7.2 gives
  bridge number at least3, hence exactly3. This includes P(3,3,3) and
  agrees with its independent based-Fox bound.

*Needs:* Layer4.2 (realized planar codes, relative box moves and isotopies),
Layer4.7 (quandle colorings), Layer4.7.1 (based Fox kernels and bridge
minima), Layer4.7.2 (group-word transport and transposition-graph theory);
native `Equiv.Perm.IsSwap`, `Subgroup.closure`, `Quandle.Conj`, dihedral
colorings and `ZMod 3` linear algebra. The marked pretzel code, cap/component
comparison, signed transfer and complete finite classification are built here.

<a id="finite-conjugacy-label-search"></a>
### 4.7.4 Finite conjugacy-class searches

For every finite group G and finite realized link diagram, enumerate the
actual signed Wirtinger colorings from Layer4.7. Use the finite native
`Group.Presentation`: filter generator assignments by evaluation of its
relator words in G, and prove the resulting finite set is equivalent to
homomorphisms from the complement group to G. The subset whose labels
generate G corresponds exactly to surjective homomorphisms. Construct
restriction/extension maps for an explicitly verified arc-elimination
schedule, carrying every residual equation and inverse substitution.
A smaller generator list is justified by these maps; a guessed selection
of arcs does not determine the remaining colors automatically.

**Conjugation and marked colors.** Use native `ConjAct G` for simultaneous
conjugation on all labels. Prove it preserves every crossing relation,
conjugates the generated subgroup, and commutes with the geometric
Reidemeister coloring maps. For a knot, propagation around its single
component puts all meridians in one native `ConjClasses G` class. Fix a
marked arc, a class C and representative c∈C. Let X_C be the colorings
whose marked label lies in C, and F_c its fiber with that label equal to c.
These definitions apply both to all colorings and to the generating subset.

Construct the induced-set equivalence

```text
X_C ≃ G ×_(C_G(c)) F_c,
(g,f) ~ (g h⁻¹,h·f) for h∈C_G(c),
[g,f] ↦ g·f.
```

Prove its well-definedness, inverse and independence of a chosen conjugator,
and identify `X_C/G` with `F_c/C_G(c)`. Give the generator-coordinate
computing rules and the finite cardinal identity `|X_C|=|C|·|F_c|`.
The stabilizer of any coloring is the centralizer of the subgroup generated
by its labels. Thus a generating coloring has stabilizer Z(G); the
G/Z(G) action on generating colorings is free. Prove the orbit/cardinality
formulas, retaining this center factor. For arbitrary colorings use the
actual stabilizers or Burnside's formula
`|G|·#orbits=Σ_(g∈G) #Fix(g)`, rather than dividing the raw count by |G|.

For links mark one meridian on each component. Stratify the tuple of
marked labels by a single orbit of the diagonal conjugation action on
G^μ; its residual group is the joint centralizer of the chosen tuple.
Construct the analogous induced-set and orbit equivalences on every
stratum. A product of individual conjugacy classes can contain several
diagonal orbits. Include crossing-free components, and handle the empty
link without a marked arc. Component reversal inverts the corresponding
meridian label, with the earlier signed coloring transport; record its
map of conjugacy classes before comparing class-restricted counts.

**Certified finite search.** Give executable enumeration with soundness,
completeness, exact counts and explicit witnesses. Compute conjugacy classes
and centralizers, fix a marked representative, evaluate all residual words,
and test the subgroup generated by each solution using finite subgroup
closure. Transport results under generator changes, class-representative
changes, Reidemeister moves and mirror/orientation adapters. Keep raw
coloring counts, generating counts, conjugation orbits and image-subgroup
data as separate outputs. No one of these identifies a knot type completely.
Instantiate the search for S₃,S₄,S₅ and the native finite matrix group
GL₃(𝔽₂). Prove its comparison with PSL₃(𝔽₂): every nonzero determinant
over 𝔽₂ is1, the special-linear center is trivial, and its order is168.
These elementary finite adapters are part of this instantiation.

**Checks.**

- Prove the complete S₅ conjugacy table, with one-based cycle notation
  and right-to-left multiplication:

  | Representative | Class size | Centralizer order |
  |---|---:|---:|
  | id | 1 | 120 |
  | (12) | 10 | 12 |
  | (123) | 20 | 6 |
  | (1234) | 30 | 4 |
  | (12345) | 24 | 5 |
  | (12)(34) | 15 | 8 |
  | (12)(345) | 20 | 6 |

  Prove exhaustion and disjointness by cycle type and the sum120.
  The mixed-cycle row is distinct from both individual-cycle rows.
- For the two-component unlink and S₃ transposition labels, the nine
  ordered pairs have two simultaneous-conjugation orbits: three equal
  pairs and six distinct pairs. Their joint centralizers have orders2
  and1. This checks why independent normalization of component colors
  loses information.
- Constant knot colorings in C number |C| and form one orbit, with
  stabilizer C_G(c). For a nontrivial G these are generating exactly
  when c generates G. The empty link has one coloring, whose image is
  trivial; it generates G exactly when G is trivial.

*Needs:* Layers4.4.3 and4.7 (finite geometric presentations and signed
coloring equivalences); native `Group.Presentation`, `PresentedGroup`,
`ConjAct`, `ConjClasses`, `MulAction.orbitRel`, subgroup centralizers,
finite permutation cycle types, finite matrix groups and Burnside counting.
The induced-set, joint-centralizer and finite-search comparisons are built here.

### 4.8 Crossing, unknotting, bridge and braid numbers

Use Layer4.7.1's unknotting number `u(K)` and bridge number `br(K)`.
Define the crossing number `c(L)` as the least number of crossings of a diagram of `L`,
and the braid index as the least number of strands of a braid whose closure is `L`.
Prove the basic theorems: `c(K) = 0` iff `K` is the unknot;
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
Kauffman theorems*, L'Enseignement Math. 33 (1987); restated as inequality (1.1) of
Armond–Lowrance, *Turaev genus and alternating decompositions*, Algebr. Geom. Topol. 17
(2017)), and `g_T(D) = 0` iff `D` is a diagram connected sum of alternating diagrams (Turaev,
op. cit.; used in Armond–Lowrance, §4): the state circles of a diagram connected sum
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

### 4.8.1 Adequate diagrams, colored cabling and crossing minimality

Make the adequate-diagram extension in *Knot Theory*, physical pp95–99,
explicit, including Exercise6.10's strict first smoothing change. Work with
the existing realized plane diagrams and native `PDCode` bracket/Jones
carriers. The cabling and colored-polynomial conclusions below are for
knots, including the crossing-free unknot; the state-circle and ordinary
adequacy APIs also apply to nonempty plane link diagrams.

**State circles and state graphs.** For `D:PDCode n` and state
`s:Fin n→Bool`, let `v_s=D.smoothingTurn(D.smoothingChoice s)`. Use
the native setoid join

`R_s=SameCycle.setoid(D.edgePair.val) ⊔ SameCycle.setoid(v_s)`

on the halfedges, and define the state-circle carrier as
`Quotient R_s ⊕ Fin D.crossinglessComponentCount`. Prove its cardinal is
the existing `D.stateLoopCount s`, by comparing the alternating two-matching
components with the two directed orbits of `D.statePerm s`. A quotient by
the latter permutation alone counts two classes per circle and is not
this carrier. Consume the shared perfect-matching join-cardinality adapter
of [the finite-band construction](#finite-disc-band-surfaces). Give representatives, incidence and traversal lemmas,
finite decidability, natural equivalences under relabelling and mirror,
and explicit merge/split maps for a prescribed state change. Include every
crossing-free circle.

At crossing i take the two endpoint classes represented by
`D.crossing i 0` and `D.crossing i 2`; these slots belong to different
local smoothing pairs for either smoothing. Build the state multigraph
with this actual circle carrier as vertices and `Fin n` as labelled edges,
using native `Graph` and its unordered incidence API, with full vertex
and edge sets in those ambient types. Retain parallel edges, loops and
isolated state circles. Prove the incidence description is independent of the
chosen representative of either smoothing arc, and identify the graph's
edge and vertex counts. A state is adequate when every edge has distinct
endpoints. The all-A state is constant true, all-B is constant false;
define A-adequate, B-adequate and adequate by these loopless conditions.
Transport them under relabelling, mirror and component reorientation.
Reduced alternating realized diagrams are both adequate; prove this from
planar regions and the geometric nugatory-crossing criterion, rather than
identifying an arbitrary abstract PD code with a plane diagram.

**The strict first change and extremal coefficients.** Prove the
two-matching surgery lemmas, including that distinct endpoint circles
merge when the smoothing at that crossing changes. For planar diagrams
every smoothing change changes the circle count by exactly one in absolute
value. Supply its geometric comparison with the native count; do not
assume this planar conclusion for unrestricted ribbon codes.

Put `s_A=loops(all-A)`, `s_B=loops(all-B)` and let `b(s)` count B choices.
The top exponent of the reduced state summand is
`n−2b(s)+2loops(s)−2`. Starting from an A-adequate state, the first
A-to-B change decreases loops by1, so this exponent drops by4. Each
subsequent A-to-B change is nonincreasing in that exponent. Order the
changed crossings to prove every state except all-A contributes strictly
below `n+2s_A−2`. This is the missing strictness argument in Exercise6.10;
later changes need not all be strict. Obtain the mirror bottom argument.
On the actual finite Laurent support of the native bracket prove

`maxdeg_A ⟨D⟩=n+2s_A−2`, with coefficient `(-1)^(s_A−1)` for A-adequate D;
`mindeg_A ⟨D⟩=−n−2s_B+2`, with coefficient `(-1)^(s_B−1)` for B-adequate D.

Expose support inclusions, exact endpoint coefficients and nonvanishing,
including the one-circle/no-crossing case. For adequate diagrams the
breadth is `2n+2(s_A+s_B−2)`. For connected nonempty diagrams compare
this with the earlier Turaev formula; genus0 gives the alternating
equality4n. Disconnected plane links retain the displayed state-count
formula and its split-circle correction.

**Blackboard parallel diagrams.** Construct the r-parallel `D^r`, r≥0,
with no additional framing twists, on explicit finite crossing and
halfedge labels. Replace each original crossing by its r-by-r grid,
give every pairing/overpass/orientation formula, and prove planarity,
realization and compatibility with the blackboard normal field. Its
crossing count is r²n; a crossing-free circle produces r parallel
circles, while `D^0` is the empty diagram. Prove all-A and all-B smoothing
comparisons by explicit circle bijections, including nested circles,

`s_A(D^r)=r s_A(D)`, `s_B(D^r)=r s_B(D)`.

Prove preservation of A/B adequacy and the corresponding graph-incidence
formulas. For an oriented knot diagram prove `w(D^r)=r²w(D)`.
Give the local braid/cup/cap and marked satellite comparisons needed to
transport these finite codes through realized diagram isotopies. A planar
parallel is a framed link satellite, not an unframed knot invariant.

**Integral color and its framing comparison.** Define the unreduced
bracket independently by

`B(D)=Σ_s A^(a(s)−b(s)) δ^loops(s)`, `δ=−A²−A⁻²`.

It has `B(empty)=1` and `B(D)=δ⟨D⟩` when D is nonempty. The latter
comparison excludes the empty native code, whose reduced bracket also
equals1 by truncated subtraction. Prove disjoint-union multiplicativity,
the unreduced loop rule, relabelling, reflection and framed local-move
identities. All these are over `Λ=ℤ[A,A⁻¹]`.

Use native `Polynomial.Chebyshev.S ℤ (r:ℤ)`, denoted S_r, with
`S_0=1`, `S_1=x`, `S_(r+2)=xS_(r+1)−S_r`. Construct the coefficient-linear
satellite evaluation

`C_r(D)=Σ_(j∈support S_r) coeff(S_r,j) B(D^j)`.

Give its integral coefficient and support APIs, the leading cable
coefficient1, parity of cable numbers, and the explicit expansion
`S_r(x)=Σ_(j≤r/2)(−1)^j binom(r−j,j) x^(r−2j)`. This satellite
evaluation is not evaluation of S_r at the scalar bracket of D.

Prove its colored framing law before using it as a knot invariant.
Consume the generic TL diagram and Jones–Wenzl f_r construction from
TemperleyLieb Layers2–4,6. This stage supplies the marked annular
closure/solid-torus satellite adapter, the identity `closure(f_r)=S_r`
and the color-r positive kink eigenvalue
`θ_r=(-1)^r A^(r(r+2))`, with negative kink eigenvalue θ_r⁻¹.
Give the closure recurrence, partial-trace and local crossing equations
that prove these identities in the declared native A-smoothing convention.
One construction uses f_r over `ℚ(A)`: prove nonvanishing of every
required formal quantum integer, construct the injective scalar extension
`Λ→ℚ(A)`, compare the annular closures there, and descend the resulting
identities between the already integral C_r. No integral projector is
assumed. Prove the geometric satellite/blackboard-twist comparison,
relabelling and ReidemeisterII/III invariance, with the stated colored
ReidemeisterI factor. These are prerequisites of the next degree argument,
independently of minimal crossings and adequacy.

For an oriented knot diagram of writhe w define
`F_r(K)=θ_r^(−w) C_r(D)`. Prove its invariance under all realized
Reidemeister moves, reversal and reparametrization; reflection inverts A.
The color is Jones color r+1. Include `F_0=1`,
`F_r(unknot)=(-1)^r Σ_(j=0)^r A^(2r−4j)` and
`F_1(K)=δ V_K(A⁻⁴)`, using the native half-variable Jones substitution
`u=A⁻²`. Prove `F_r(K)(1)=(-1)^r(r+1)` and hence nonvanishing for every
r≥0. One proof uses the earlier `V_L(1)=(-2)^(μ−1)` for the j-component
parallel satellite, its writhe j²w, and the Chebyshev parity formula.
This one-color/single-writhe construction is for a knot; componentwise
colored links require their own framing data and are not inferred here.

**Degrees and the minimality theorem.** For every realized knot diagram
D and r≥1 prove, using actual Laurent support,

`maxdeg_A F_r(K) ≤ r²(n−w)+2r(s_A−w)`,
`mindeg_A F_r(K) ≥ −r²(n+w)−2r(s_B+w)`.

A-adequacy makes the upper bound equality; B-adequacy makes the lower
bound equality, with endpoint coefficients ±1. Derive both bounds from
the parallel state sum and prove that lower Chebyshev terms cannot cancel
an adequate extreme: for 0≤j<r the difference between the upper bounds
of D^r and D^j is `(r²−j²)n+2(r−j)s_A>0`, and likewise for the bottom
with s_B. Include j=0's empty satellite and the crossing-free unknot.
As an API, give the degree of F_r and its degree after variable inversion
`A↦A⁻¹` (`LaurentPolynomial.invert`),
exact nonzero coefficients, multiplication by a monomial, and the ordinary
r=1 comparison. For adequate D the colored breadth is
`2r²n+2r(s_A+s_B)`; this is the unreduced colored breadth.

Let E be any diagram of the same knot as an adequate D. Invariance of
F_r for every r≥1 and the bounds imply
`n_D−w_D≤n_E−w_E` and `n_D+w_D≤n_E+w_E` by comparing the quadratic
coefficients. Prove this elementary dominance step explicitly, for
integer coefficients and all positive natural r; no analytic limit or
eventual quasi-polynomial theorem is needed. Thus D minimizes positive
and negative crossing counts separately and `c(K)=n_D`. Any other
crossing-minimizing diagram has the same positive/negative counts and
writhe. In particular all adequate diagrams of a knot have the same
writhe. Prove adequacy excludes nugatory crossings, explaining the
source's reduced-adequate wording.

Marked diagram connected sum wedges the corresponding state graphs at
one vertex, so preserves adequacy. Give this finite/gluing comparison and
deduce crossing additivity for connected sums of adequate knots, with
the unknot as identity. This does not prove the source's general crossing
additivity conjecture for arbitrary knots.

*Needs:* earlier realized plane diagrams, Reidemeister/Markov comparison,
tubular neighbourhoods and marked connected sums; native PD state permutations/counts,
`Graph`, `Setoid` join, `LaurentPolynomial.degree`, `.coeff` and `.invert`;
native Chebyshev S and TemperleyLieb's generic diagram/Jones–Wenzl theory.
The state-circle bridge, parallel code, integral colored satellite,
annular closure/kink adapter, degree bounds and adequate minimality are
targets here. No quantum-group or TQFT construction is a prerequisite.
`AdequacyCablingTargets.lean` prototypes the native state-circle, bracket,
parallel and colored-degree interfaces; the full APIs above are required.
Compare the cabling calculation with
[Dasbach–Lin, Theorem3.1](https://arxiv.org/abs/math/0604230),
and the degree normalization with
[Kalfagianni, §2 and Theorem3.2](https://arxiv.org/html/1601.03307#S2),
using Jones color r+1, t=A⁻⁴ and the explicit unreduced circle factor.
The latter paper's sign-normalized polynomial is `(-1)^r F_r` after
this substitution; give that scalar adapter as well as the degree adapter.


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

<a id="positive-algebraic-tangles"></a>
### 4.10.1 Algebraic tangle syntax and alternating closures

Construct algebraic tangles as finite expressions in the integer tangles,
horizontal sum and principal-diagonal reciprocal. The realized carrier is
a compact properly embedded one-manifold in a ball with four marked collared endpoints:
two open strands and finitely many closed components. Composition can
create closed components, which remain part of the output. Give the
relative planar code, its spatial realization, endpoint-fixing isotopy
and the relative Reidemeister comparison from Layer 4.2. For n crossings
use the native crossing slots plus four boundary slots, with a native
`PerfectMatching` pairing edge ends, opposite slots continuing each
crossing strand, crossing over-pair data and separate crossing-free circles.
Require the planar realization witness with the four ports on the outer
boundary in the declared cyclic order. Gluing identifies the selected
boundary slots and contracts their degree-two seams. Prove the resulting
edge matching and register every circle created without a crossing.
Closure gives the native closed `PDCode`, preserving every component.
Global component orientations are additional data, transported in
oriented applications.

Pin the boundary order as NW,NE,SE,SW. The integer 0 has horizontal strands;
infinity has vertical strands. The primitive 1 has NW–SE over NE–SW.
Horizontal sum A+B joins A.NE to B.NW and A.SE to B.SW, with the four
outer ports retained and the standard crossing-free collars. Define
I(A) by reflection in the vertical plane through the NW–SE diagonal:
in coordinates `(x,y,z)↦(−y,−x,z)`, with z the crossing height. It fixes
NW,SE, exchanges NE,SW and preserves over/under data. Prove I²=id,
I(0)=infinity and I(infinity)=0, with code/realization and collar transport.
The Conway product is `A·B=I(A)+B`. Define negative integers by the
crossing-height mirror of positive integers; include signed, zero and
infinity expressions in this full syntax. Give reindexing, substitution,
mirror and gluing naturality, and associativity/unit isotopies for sum.

Identify the integer-twist and reciprocal constructors with Layer 4.10's
rational tangles and continued-fraction convention. On that rational
subclass prove I sends fraction x to 1/x, including 0 and infinity.
General algebraic expressions retain their actual tangles; rational
fraction equality is used only within the classified rational subclass.
Prove the noncommutative and nonassociative product checks below using
that restricted comparison, rather than importing ring identities for ·.

**Positive syntax and the boundary invariant.** Define the positive
expressions inductively from 1 by sum and I; positive integers are
nonempty sums of 1. Embed every rational word with strictly positive
integer coefficients, in the declared continued-fraction order, and
every algebraic expression in such rational leaves using sum and Conway
product. The notation a0 for I(a) is a structural reciprocal operation;
it introduces no zero integer coefficient into the positive grammar.
The crossing count is 1 at the primitive, additive under sum and unchanged
under I. Construct codes with exactly that count. Every positive boundary
port reaches a crossing along its strand.

For each boundary port record the over/under status of the first crossing
encountered when entering the tangle. Prove simultaneously, by syntax
induction, that each open strand's encounter word alternates, each closed
component's cyclic encounter word alternates, and the boundary statuses
are `(over,under,over,under)` in the specified cyclic order. Define these
words from the actual code's strand traversal, using native
`PDCode.isOver` on the resulting crossing slots. The event bit true means
over; compute it from the slot and `overPair`, rather than identifying it
with that pair-selection bit. Use native `List.IsChain (· ≠ ·)` for open
words and include the last-to-first comparison for cyclic words; the empty
word of a crossing-free circle is allowed. The primitive gives the base
case. For sum, the seam
pairs are under–over and over–under. Prove the word-concatenation and
reversal lemmas and track complete strand paths, including paths that
cross several seams or become closed components. For I the port
permutation preserves the boundary tuple and crossing statuses, while
any reversed traversal reverses its encounter word. Prove the finite
path decomposition and its agreement with geometric components.

Numerator closure joins NW–NE and SW–SE; denominator closure joins
NW–SW and NE–SE. Both pair opposite boundary statuses. Prove their
actual closed-diagram encounter words alternate, with every original
and newly closed component retained. Consequently both closures are
alternating links; in particular, if N(T) is a knot it is an alternating
knot. This is a construction of an alternating representative. Reducedness,
minimal crossing number and primeness require their separate hypotheses
and proofs. Crossing-height mirroring gives the corresponding negative
construction, with the complementary boundary tuple. Positivity here is
the Conway integer/frame convention; compute oriented crossing signs
only after choosing component orientations.

**Checks.**

- N(1) is the one-crossing unknot diagram: the alternating conclusion
  does not assert that its one crossing is minimal.
- N(I(2)+2) is the four-crossing alternating figure-eight diagram under
  Layer 4.10's 5/2 dictionary. Transport an orientation and compute its two
  positive and two negative crossing signs.
- Identify N(I(3)+I(3)+I(2)) and N(I(3)+I(3)+I(3)) with the earlier
  marked P(3,3,2) and P(3,3,3) models by actual port/crossing transport.
  For the former, prove knotness, check reducedness and adequacy of its
  eight-crossing diagram, and apply Layer 4.8.1 to obtain crossing number 8.
  The latter's bridge number 3 from Layer 4.7.3 shows that positive
  algebraic closures extend beyond rational knots.
- On the rational integer examples, `1·2` has fraction 3 while `2·1`
  has fraction 3/2; `(1·2)·3` has fraction 10/3 while `1·(2·3)` has
  fraction 9/2. Give the actual rational normal forms and use relative
  classification to distinguish these tangles.
- In the mixed-sign diagram `1+mirror(1)`, trace the equal-status seam
  encounters and its Reidemeister-II reduction to 0. Its displayed code
  is not alternating, although its numerator closure is the unlink.
  Zero and infinity remain valid in the full syntax; the positive
  boundary theorem is applied to expressions in the positive grammar.
- N(0) is the two-component unlink and D(0) the unknot; infinity
  exchanges those closures. Infinity+infinity has the vertical open
  strands and one additional crossing-free circle. Check its actual
  matching and circle count through gluing and both closures.

*Needs:* Layer 4.2 (relative realized codes, component traversal, gluing and
Reidemeister moves), Layer 4.10 (integer/rational constructors and their
relative classification), and native finite permutations and encounter
words. The pretzel calibrations additionally use Layers 4.7.3 and 4.8.1.
The finite syntax, boundary invariant, closed-component transport and alternating
closure theorem are built here. Use [Conway, §1](https://webhomes.maths.ed.ac.uk/~v1ranick/papers/conway.pdf)
for the product/principal-diagonal convention and
[Kauffman–Lambropoulou, §2](https://homepages.math.uic.edu/~kauffman/rattl.pdf)
for the rational-tangle comparison.

<a id="stevedore-pretzel-label-separation"></a>
### 4.10.2 Equal Alexander polynomials and different transposition images

Construct explicit realized models of the stevedore knot6₁ and the
pretzel knot9₄₆=P(3,3,−3), with the arc/crossing dictionaries to their
finite table codes. For6₁ use the two-bridge slope9/5 and give its
comparison with the slope9/2 diagram through the inverse-slope move
`2·5≡1 mod9`, retaining the marking and any ambient mirror adapter.
For9₄₆ use Layer4.7.3's signed three-box construction and prove its
geometric table identity. Use the textual PD/DT presentations in the
[Knot Atlas6₁ entry](https://katlas.org/wiki/6_1) and
[Knot Atlas9₄₆ entry](https://katlas.org/wiki/9_46) as finite input data;
the required realized-code comparisons establish the named knots.
Fix the Atlas signed DT rows as
`[4,8,12,10,2,6]` and `[4,10,−14,−12,−16,2,−6,−18,−8]`,
respectively, and prove their sign, orientation and native-code adapters.

**Marked group presentation and the S₄ witness.** Derive the two-bridge
Wirtinger elimination for the chosen9/5 model, with positive meridians a,b,

```text
Γ=⟨a,b | a w²=w² b⟩,       w=b a⁻¹ b⁻¹ a.
```

Prove the forward/inverse generator maps to the actual complement group
and their meridian computing rules. The Schubert crossing word has signs
`(−1)^floor(5i/9)` for i=1,…,8 and equals w² in the pinned convention;
if a conventional crossing reading gives the inverse relator or conjugate
word, supply the explicit free-word and meridian adapters.

In S₄, with one-based labels and right-to-left products, set
`a=(1234)` and `b=(1243)`. Prove

```text
w=(132),       w²=(123),       a w²=w² b,       a²b=(14).
```

Conjugating the last swap by powers of a gives the transpositions of a
connected four-vertex cycle, so the subgroup generated by a,b is all S₄.
This yields a surjective S₄ coloring of6₁ with meridians in the4-cycle
class. Use Layer4.7.4 to produce its full arc labels and class/orbit data.

The rational bridge presentation gives br(6₁)≤2. A generating coloring
by S₄ transpositions would require br≥3 by Layer4.7.2, so no such
coloring exists. Constant transposition colorings still exist, as do
colorings with smaller generated subgroup. For9₄₆ the incoming star
`((12),(13),(14))` closes through the3,3,−3 boxes by the signed transfer
of Layer4.7.3, and its connected transposition graph generates S₄.
Thus both knots admit generating S₄ colorings, while only9₄₆ does so
with meridians restricted to transpositions. Prove this distinction is
preserved by all allowed orientation/mirror transports.

**Alexander calibration.** Construct the actual genus-one spanning
surfaces and oriented band-core bases giving native Seifert matrices

```text
V₆=[[1,0],[1,−2]],       V₉=[[3,1],[2,0]],
Vᵀ−V=[[0,1],[−1,0]].
```

Prove the positive push-off pairings and their geometric boundary
comparisons, including any basis or mirror changes to the chosen table
models. Both determinants `det(tV−Vᵀ)` are `−2t²+5t−2`. Their native
value-one normalization is
`Δ=−2t+5−2t⁻¹`, and both knot determinants are9. The ordinary source
representative P=`2t²−5t+2` satisfies `P=−t·Δ` and
`det(tV−Vᵀ)=−P`. A matching determinant or polynomial does not replace these geometric comparisons.

**Checks.**

- Certify the displayed4-cycle pair, relator, swap word and full-image
  statement by finite permutation computation; identify the actual
  source meridians before transporting the coloring to the diagram.
- Certify the9₄₆ star coloring at every signed box and cap, including
  the negative box, and its full S₄ image. Apply the conjugacy-search
  normalization with its residual centralizer rather than discarding
  stabilizers.
- The common Alexander polynomial and the existence of unrestricted
  S₄ quotients do not distinguish this pair. The generating
  transposition-class property does, giving a concrete invariant beyond
  those two tests.

*Needs:* Layers4.3–4.4 (geometric Seifert and Alexander comparisons),
4.7.2–4.7.4 (transposition bridge bound, signed pretzel transfer and finite
conjugacy searches), and4.10 (realized rational tangles, inverse-slope
classification and bridge presentation); native `FreeGroup`,
`Group.Presentation`, finite permutations and integral Seifert matrices.
The explicit rational-group elimination, finite table-code comparisons,
marked surfaces and their pairings are built here.

### 4.11 Torus knots, satellites and Whitehead doubles

Define the torus knot `T(p, q)` for coprime `p, q` as the image of `u ↦ 2⁻¹ᐟ² (u^p, u^q)` in the
unit sphere of `ℂ²`, a smooth circle embedding by the immersion criterion
`TauCeti.isImmersion_iff_forall_isImmersionAt` and compactness. Prove `T(p, q) ≅ T(q, p)` by the
ambient isotopy `U_t = P₊ + e^{πit} P₋` of `S³` through unitary maps, `T(p, −q)` is the mirror of
`T(p, q)`, `T(−p, −q)` is the reverse of `T(p, q)`, and `T(p, q)` is the unknot when `|p| ≤ 1` or
`|q| ≤ 1` by the explicit isotopy `u ↦ (√(1 − s²) u, s u^q)`. Prove that `T(p, q)` for
`p, q ≥ 2` is the closure of `(σ₁ ⋯ σ_{p−1})^q`, has genus `(p − 1)(q − 1)/2`, Alexander polynomial
`(t^{pq} − 1)(t − 1) / ((t^p − 1)(t^q − 1))` up to normalization; its chirality is
Layer 6.2's theorem, through the signature. Define satellites with a pattern P in a marked solid torus and companion J,
using the preferred longitude for the Seifert framing. Define geometric
wrapping as the minimum meridional-disc intersection number, distinct from
algebraic winding. For every tame pattern P and nontrivial tame companion J, prove
Schubert's lower bound `br(P(J))≥w_geom(P)·br(J)` (Schubert 1954).

For ε=±1 and m∈ℤ, construct the marked Whitehead pattern W_(ε,m), with
signed clasp, marked cut/ports and m full meridional twists relative to
that longitude. Give a finite oriented crossing/cap code, its solid-torus
realization, port correspondence and inverse/mirror/framing-change laws.
Prove algebraic winding0 and geometric wrapping2: exhibit a meridional
disc meeting it twice. For the standard zero-twist Whitehead pattern link
and its mirror, exclude a disjoint meridional disc by nonsplitting.
Supply nonsplitting from the actual finite diagram, arc/Fox correspondence
and three-coloring count3; a split two-component
link has at least9 colorings by the product theorem of Layer4.7. The
finite matrix in [Problem20FoxTargets.lean](Problem20FoxTargets.lean)
is a numerical certificate, not the geometric diagram comparison. Prove
that mirrors and solid-torus meridional-twist homeomorphisms preserve
geometric wrapping, extending the zero-twist result to every m. The
three-coloring count is required for the zero-twist link, not every
twisted pattern link.

For every companion construct the once-punctured-torus spanning surface
and one-clasp-change unknotting witness, giving genus≤1 and u≤1.
For a b-bridge companion explicitly place the clasp and all signed twists
on monotone strands in the doubled position, giving at most2b maxima.
This upper-bound construction is independent of Schubert's lower bound.
For nontrivial J prove the companion torus essential; the lower bound
then gives `br(W_(ε,m)(J))=2br(J)`;
nontriviality gives genus=u=1. For the unknot companion, identify the
rational twist-knot and unknot parameter branches, with bridge1 for the
unknot and bridge2 otherwise; do not apply the essential-satellite lower
bound to that branch. Compute the Seifert matrix in the marked convention
and prove that every untwisted double of a nontrivial knot has Δ=1.

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

<a id="indexed-cinquefoil-doubles"></a>
### 4.11.1 Indexed cinquefoil doubles with unbounded bridge number

Use Layer4.7.2's group-coloring and transposition-graph API, Layer4.2's
realized braids, Layer4.4's Wirtinger presentation, and Layer4.11's marked Whitehead
pattern, punctured-torus/clasp and bridge-upper-bound constructions. Only
the independently constructed upper bound is consumed from the satellite
package; its general satellite lower bound is not a premise here.

For k≥1 set N=2k+3. Define K_k as the
closure of the positive braid `β_k=σ₁⁵σ₂⁵⋯σ_k⁵` on k+1 strands,
with braid letters read from top to bottom. Construct its finite realized
crossing code, its single component and its connected-sum comparison with
k copies of the already specified positive T(2,5). Give the corresponding
(k+1)-bridge position. Number source letters1,…,N and assign the incoming
strand labels

```text
c₀=(1 2 3),     c_j=(3,2j+2,2j+3) for 1≤j≤k.
```

Use right-to-left permutation composition. Adjacent c_j,c_(j+1) have
three-element supports meeting in exactly one letter. Prove the exact
relation `c_j c_(j+1) c_j c_(j+1) c_j =
c_(j+1) c_j c_(j+1) c_j c_(j+1)` and invariance of that ordered label
pair under the fifth power of the positive Hurwitz crossing map
`H(s,t)=(s t s⁻¹,s)`. Thus each braid block preserves its two incoming
labels and the whole tuple closes. Compare this action with the geometric
Wirtinger crossing convention, including the inverse crossing. The label
group acts transitively: c₀ reaches1,2,3 and each c_j reaches its two
new letters from3. The labels are even permutations; transitivity here
is not a claim that they generate S_N.

Factor the bridge labels using the ordered strand pairs
`((1 3),(1 2))` and `((3,2j+3),(3,2j+2))`, respectively. Their products
are the displayed 3-cycles. The source writes `(a b)` then `(a c)`;
our right-to-left product order is `(a c)(a b)=(a b c)`. Its text and
unoriented schematic figure do not select a contrary ordered-track
convention. The resulting transposition edges are exactly
`{1,2},{1,3}` and `{3,ℓ}` for4≤ℓ≤N: a tree with N−1=2k+2 edges.
Prove their generated subgroup is S_N using Layer4.7.2's connected
transposition-graph criterion.

Make the doubling itself a finite construction on this realized diagram.
For a positive crossing of two ordered pairs, cable it by the four-crossing
word `σ₂σ₁σ₃σ₂`, shifted to the appropriate four strand indices.
On input `(s,t,u,v)` its Hurwitz action must be
`((st)u(st)⁻¹,(st)v(st)⁻¹,s,t)`; prove all four equations and the
negative-crossing inverse. This transports the product of each under-pair
by conjugation with the original over-label. Close by the existing
marked Whitehead clasp pattern W_(+,m), with the Seifert-framed companion
embedding, and supply the actual finite clasp/cap crossing code and
its port equations. These are required geometric constructions, not
consequences of the factor-tree calculation alone.

Prove the local twist correction explicitly. For a fixed 3-cycle P,
its ordered transposition factorizations are exactly three pairs. The
Hurwitz map preserves their product and cycles these pairs; consequently
H², one full twist, also cycles them. Compute EVERY bottom return pair
of the cabled braid and its original product c_j. Choose separately for
each marked return port a correction q_j∈{0,1,2} matching its required
factor pair. The raw cable need not close, and a single arbitrary pair
check is insufficient. Insert the chosen clasp at the marked cut and
prove its port-product comparison and cap equations; retain its own
correction by at most two full twists. Verify all crossing and cap
relations on the resulting realized diagram, with the full generated
subgroup S_N visible from the unmodified bridge labels.

Compute the signed annulus framing and transport these distributed twists
to the existing marked pattern W_(+,m) by an explicit diagram movie,
including the preferred-longitude comparison and coloring transport.
Adding or removing THREE full twists at a fixed regular pair changes
the chosen double but preserves that pair's labels because H⁶=1;
prove it preserves the full generated subgroup as well. Thus one may
reduce m modulo3, obtaining a consistently colored W_(+,m)(K_k) for
some m∈{0,1,2}. The transported bridge labels need not remain the literal
initial tuple; retain their actual coloring correspondence. Give a finite
algorithm selecting the least valid m and its coloring, and set D_k to
that particular double. Do not infer clasp compatibility merely from
transitivity or permit unspecified twists outside the marked pattern.

This explicit choice realizes the existence of some double in the course
notes, with N=3+2k. No signed framing or twist count is assigned to their
schematic Figure7.12.
The surjective transposition coloring gives `b(D_k)≥N−1=2k+2`.
Construct the doubled (k+1)-bridge position with the clasp and selected
twists on monotone strands, giving the opposite inequality. Thus prove
`b(D_k)=2k+2`, without using the general satellite lower-bound theorem.
The existing once-punctured-torus surface and one-clasp-change witness
give `g(D_k)≤1` and `u(D_k)≤1`; the bridge lower bound proves
nontriviality, hence `g(D_k)=u(D_k)=1`. This realizes the source's
unbounded-bridge/genus-one/unknotting-one family with its exact indices.
The finite group companion [IndexedDoublingTargets.lean](IndexedDoublingTargets.lean)
records the indexed cycles, relations, factor tree and full-twist orbit;
the geometric realization and clasp comparisons remain mandatory here.

**Source:** *Knot Theory*, pp105–106; compare Baader–Kjuchukova,
[§2](https://arxiv.org/html/1711.08144#S2), for a related chain-label
Whitehead-double construction. The star-label family here retains its
own required clasp-port and framing comparisons.

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
strand deletion as a homomorphism on native `BraidGroup.pureSubgroup n`,
using Layer 4.2.1's permutation-kernel and generator-square comparison. Define the Brunnian links `L_n` as the closures of the iterated commutators
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

**Positive braid links.** Extend the classical signature at `−1` to realized
oriented links using their integral Seifert matrices, allowing odd matrix
sizes and degenerate symmetrizations. Prove independence of the connected
Seifert surface, mirror sign change, invariance under simultaneous orientation
reversal, split-union additivity and vanishing on unlinks. Compare a
disconnected split Seifert surface with a connected one by specified joining
tubes and their Seifert-form matrices; preserve the signature without
applying the knot-only nondegeneracy or evenness assertions to links.

For a positive braid word on `n≥1` strands with `p` letters, let `s` be
the number of connected components of the graph with all `n` strands as
vertices and one edge for each letter between its adjacent strands.
Construct the canonical `n`-disc/`p`-band surface and prove it has `s`
components and total first Betti number `r`, with the natural-number identity
`r+n=p+s`. Thus `r=p+s−n`; interpret `p−n+s` as integer arithmetic if
using that equivalent expression. Prove Rudolph's theorem
in the convention where the right-handed trefoil has signature `−2`:
if `r>0`, its oriented closure has strictly negative classical
signature. Supply the finite band-surface reductions and integral
Seifert-form/inertia comparisons in that proof. If `r=0`, the
surface components are discs and the closure is an unlink with signature
zero. Conversely the strict-sign theorem excludes an unlink in the positive
rank case. Thus this describes all positive braid closures, including split
ones and unused strands. Nontriviality here concerns the closure, beyond a
nonidentity braid word. This supplies the positive-word signature argument
cited on Knot Theory physical p91, while the signed-word Jones support
argument in Layer 4.5 is independent of it.

Use Rudolph (*Nontrivial positive braids have positive signature*) with the
explicit opposite-sign adapter; the first-Betti-number convention is also
recorded in Feller (*On the signature of positive braids*, p. 22).
Consume Layer 4.3's realized band surfaces and Seifert matrices and
this layer's integral-form invariance/inertia theory. No signature
calculation may replace the component-orientation distinction in the Hopf
example of Layer 4.5.

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

### 7.3.1 Cusp lattices, shapes and horoball patterns

**Scope and geometric carriers.** For a connected, oriented, noncompact complete
finite-volume hyperbolic `3`-manifold, build the following cusp-invariant API on
the metric and cusp ends of this layer. A peripheral marking identifies the
stabilizer of a chosen horoball with a rank-two translation lattice
`L : Submodule ℤ ℂ`, with `DiscreteTopology L` and `IsZLattice ℝ L`.
Construct the horotorus as the additive quotient `ℂ ⧸ L`, with its quotient flat
metric, smooth structure and area measure; compare it with the actual cusp
cross-section and with `UnitAddTorus (Fin 2)` after choosing a lattice basis.
On the coordinate torus use the transported Gram metric of that basis, scaled
by `h^(−2)` at height `h`, and its induced area measure. The standard product
metric agrees only for a correspondingly orthonormal basis at that height.
The comparison must preserve the peripheral marking, induced metric and measure,
not just the underlying topology. The horotorus is the abstract quotient of a
horosphere by its stabilizer. Its boundary parametrization into the manifold
is an immersion; at maximal-cusp tangencies it can identify distinct points.
Require an embedding before first contact and on the open cusp interior,
and retain the immersed parametrization at contact, including contacts between
different cusp boundaries. Prove the boundary image has zero three-dimensional
volume, so its identifications do not change the cusp volume.
Derive its hyperbolic end metric from the
upper-half-space metric of curvature `−1`, and identify its volume measure with
the restriction of `TauCeti.riemannianVolume` for the given `HyperbolicMetric`.
The torus assertion uses orientability; Klein-bottle cusps retain the separate
nonorientable treatment in the finite-volume theorem above.

**Area, volume and shortest translations.** For the horosphere at height `h>0`,
prove that a translation `v∈L` has length `‖v‖/h`, the horotorus has area
`ZLattice.covolume L / h²`, and the cusp above it has volume
`ZLattice.covolume L / (2h²)`. In particular the volume is half its boundary
area. Prove these by quotient integration and the upper-half-space density
`h^(−3)`, including finiteness, positivity and change-of-height formulas.
For a `ℤ`-basis with complex periods `(a,b)`, identify the covolume with
`|Im (conj a * b)|`. A shortest nonzero lattice vector and a shortest lattice
vector real-linearly independent of it exist, with positive lengths `λ₀ ≤ λ₁`:
they are the witnesses of the first two successive minima of `L` for the closed
unit disc of `ℂ` (SuccessiveMinima, Layer 1, `exists_successiveMin_witnesses`).
Deduce from the threshold characterization of `λ₁` that for *every* chosen
shortest vector `v` the least length of a lattice vector outside `ℝ v` is `λ₁`
and is attained. Prove these two vectors form a `ℤ`-basis in dimension two.
Retain the set of tied minimizing bases;
the minimum length is independent of the tie. Prove invariance under a change
of lift and upper-half-space normalization, with the stated similarity scaling
for length and area. Thus the shortest parabolic translation is the systole
of the chosen horotorus, with its scale fixed by the chosen cusp neighbourhood.

**Maximal cusps.** Define a cusp neighbourhood by an equivariant family of
horoballs with pairwise disjoint interiors; tangencies of their boundaries are
allowed. For each cusp separately, prove that expansion of its own orbit has
a finite attained maximum, characterized by first tangency of distinct lifts.
This gives its individual maximal volume and the shortest translation on its
maximal horotorus, normalized by placing a lift at height `1`. For several
cusps also define the largest *total* volume over simultaneous pairwise
interior-disjoint cusp neighbourhoods. Prove finiteness and attainment, using
the finitely many cusp parameters, their individual upper bounds and the
horoball separation constraints; justify compactness and that a maximizer has
positive size at every cusp. Do not identify this total with the sum of the
individual maxima. Separately construct sequential expansion: for a specified
ordering of the cusps, maximize each while keeping the preceding choices fixed.
Prove existence and its disjointness properties, retaining order and any
remaining choice as parameters. It is not the simultaneous optimization.

**Marked shapes and conformal classes.** For a link cusp marked by meridian and
longitude with periods `(a,b)`, the Adams–Hildebrand–Weeks homological shape is
`a/b`, **meridian divided by longitude**. Pin the peripheral orientations in the
marking and prove its imaginary part is nonzero. For a shortest-vector basis
as above the geometrical shape is likewise the first period divided by the
second. Common complex rescaling leaves either ratio unchanged. Under the
basis change `(a',b')=(p*a+q*b,r*a+s*b)`, with integer determinant `±1`, prove
`a'/b'=(p*(a/b)+q)/(r*(a/b)+s)` and denominator nonvanishing. Define the source's
conformal invariant as this `PGL(2,ℤ)` fractional-linear orbit in `ℂ ∖ ℝ`;
prove independence of the lattice basis and of ties in a shortest-vector basis.
It classifies lattices up to complex-linear similarity. Also construct the
unoriented similarity class, allowing complex conjugation, and prove the
comparison with the `GL(2,ℤ)` orbit in `UpperHalfPlane` for Mathlib's action
(negative determinant acts with conjugation). These are different quotient
conventions: complex conjugation of a raw shape is an additional identification
for the unoriented class. A raw source ratio need not be in the upper half-plane,
and replacing it by its reciprocal or conjugate needs the corresponding
basis/orientation adapter. Never claim a tied complex representative is canonical.

**Finite horoball patterns.** For a chosen disjoint cusp collection and a lift
at infinity normalized to boundary height `1`, define the other lifted
horoballs by their centres in `ℂ` and Euclidean diameters. Prove equivariance
under the peripheral lattice and the diameter/separation inequalities coming
from disjointness. For `0<α<1`, define the pattern modulo that lattice using
exactly the balls of diameter **strictly greater than `α`**. Prove finiteness
in a fundamental parallelogram by the induced packing/separation bound, including
the fundamental-domain boundary identifications. Prove independence
of the triangulation for the same geometric cusp data and transport under
isometries; normalized patterns are considered up to the induced Euclidean
isometries and peripheral change of basis. For several cusps the pattern also
depends on the specified cusp collection, including its sequential expansion
order when that construction is used.

**Source adapter and checks.** The definitions follow Adams–Hildebrand–Weeks
(§2, pp. 2–4, Tables 1–2). Its Table 1 lists individual maximal-cusp volumes;
its multi-cusp Table 2 pictures use sequential expansion, with cutoff `α=1/10`.
For the
abstract square lattice with periods `(1,i)`, check covolume `1`, shortest
length `1`, raw ratio `−i`, area `1/h²` and cusp-model volume `1/(2h²)`;
this is a local cusp-model check, not a claim that it is a particular manifold's
maximal cusp. For periods `(1,2i)` at height `1`, check area `2` and the
unequal coordinate-loop lengths `1` and `2` in the transported torus metric.
Check that swapping periods inverts the raw ratio and changes
neither the lattice nor its conformal orbit. Check strict exclusion at diameter
`α`, and that independently maximal cusps cannot be presumed disjoint.

*Needs:* this layer's finite-volume cusp decomposition, native hyperbolic metric
and Riemannian measure; SuccessiveMinima Layer 1 (1.5
`exists_successiveMin_witnesses`); Mathlib `ZLattice`/`ZSpan`, `ZLattice.covolume`,
`UnitAddTorus`, quotient additive groups, Haar measure, complex real-linear algebra
and `UpperHalfPlane` actions.

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
is homotopically nontrivial (Papakyriakopoulos, Ann. of Math. 66 (1957); Hatcher, Theorem 3.8,
whose orientable case this is).
Deduce that a knot in `S³` with knot group `ℤ` is the unknot, that an irreducible orientable
`3`-manifold with infinite fundamental group is aspherical, and state the Gordon–Luecke
theorem that knots with homeomorphic complements are carried onto each other by a
homeomorphism of `S³`, hence are equivalent up to mirror image and reversal (Gordon–Luecke,
*Knots are determined by their complements*, J. Amer. Math. Soc. 2 (1989)). `Suggested.lean`
states Alexander's theorem as `alexander_sphere_bounds_ball`, the knot-group theorem as
`smoothAmbientIsotopic_unknot_of_knotGroup` and the Gordon–Luecke theorem as `gordon_luecke`;
the proofs of the first two are targets of this layer, and the proof of the third, through
the cyclic surgery theorem stated in Layer 5.4 and the analysis of reducible fillings, is
GeometricTopology, Part II's. It states the sphere theorem as `sphere_theorem`: for a smooth
orientable `3`-manifold without boundary whose `π₂` at some base point is nontrivial, in the
sense of Mathlib's `HomotopyGroup`, there is a locally flat closed embedding of `S²` (the shape
of sphere that `TauCeti.IsSphereBoundsBall` tests, `TauCeti.IsLocallyFlat`) that is homotopic
to no constant map. The smooth structure is there because the pinned `TauCeti.Orientable` is a
predicate on `C^k` structures with `k ≥ 1`; by Layer 11.2 it costs no generality, and
two-sidedness is automatic for a sphere in an orientable manifold. Its proof is a target of
this layer.

**Checks.**
- The unknot has group `ℤ` and is the unknot; the trefoil has group `⟨x, y | xyx = yxy⟩`, which
  is not abelian, so Dehn's lemma does not apply, consistent with the trefoil being knotted.
- `S² × S¹` has `π₂ ≠ 0` and the sphere `S² × {pt}` is essential and two-sided; `ℝP³` has
  `π₂ = 0` and is irreducible.
- `S¹ × ℝP²` has `π₂ ≅ ℤ`, being double covered by `S¹ × S²`, but it is irreducible, so every
  embedded sphere in it bounds a ball and is null-homotopic (Hatcher, Proposition 1.13 and the
  remark after Theorem 3.8): the orientability hypothesis of the sphere theorem cannot be
  dropped, and the non-orientable form allows a two-sided projective plane instead.
- The granny and square knots have isomorphic knot groups but are not equivalent even up to
  mirror image (signatures `−4` and `0`), so by the Gordon–Luecke theorem their complements
  are not homeomorphic: the theorem is about complements, not about groups.

*Needs:* Layer 11.2 (PL structures in dimension three), Layer 5.1, Layer 4.4; Tau Ceti
`TauCeti.IsSphereBoundsBall`, `TauCeti.IsIncompressible`, `TauCeti.IsLocallyFlat`,
`TauCeti.Orientable`; Mathlib `FundamentalGroup`, `HomotopyGroup`.

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
3-manifolds which are sufficiently large*, Ann. of Math. 87 (1968)). `Suggested.lean` states it
as `waldhausen_theorem`, for closed orientable Haken manifolds: the pinned
`TauCeti.IsPossiblyNonorientableClosedHakenThreeManifold` (irreducible, with a closed
bicollared incompressible surface of infinite fundamental group, whose witness carries the
closed connected `3`-manifold package) together with `TauCeti.Orientable` on a smooth
structure, the conclusion being a homeomorphism homotopic to the given homotopy equivalence.
Its proof is a target of this layer.

**Checks.**
- The torus `T² × {pt} ⊂ T³` is incompressible, so `T³` is Haken; every embedded sphere is
  incompressible under the pinned definition, since `π₁(S²) = 1` makes injectivity on `π₁`
  automatic, which is why the Haken predicate additionally asks for nonempty boundary or
  infinite fundamental group: a definition of Haken through incompressibility alone would
  make every irreducible `3`-manifold Haken on account of a sphere bounding a ball.
- Lens spaces have finite fundamental group, hence contain no incompressible surface of
  positive genus and are not Haken.
- `L(7, 1)` and `L(7, 2)` are homotopy equivalent but not homeomorphic; neither is Haken, so
  the Haken hypothesis of Waldhausen's theorem cannot be dropped.
- The Weeks manifold is not Haken but is virtually Haken by Agol's theorem (Layer 7.4).

*Needs:* Tau Ceti `TauCeti.IsIncompressible`, `TauCeti.IsHakenSurfaceEmbedding`,
`TauCeti.IsPossiblyNonorientableHakenThreeManifold`,
`TauCeti.IsPossiblyNonorientableClosedHakenThreeManifold`, `TauCeti.Orientable`; Layer 8.2,
Layer 11.2.

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
  transversal is essential, and the universal cover of a closed manifold with a taut foliation
  that is not finitely covered by `S² × S¹` is `ℝ³` (Palmeira, *Open manifolds foliated by
  planes*, Ann. of Math. 108 (1978), 109–131; Calegari, Theorem 4.38).
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
of a closed subset. `Suggested.lean` states the closed case of the triangulation theorem, that
every closed topological `3`-manifold is triangulable, as `moise_triangulation`, the pinned
`TauCeti.TriangulationConjecture 3`; its proof is a target of this layer.

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
(PlanarTopology Layer 5) and Moise (Layer 11.2, `moise_triangulation`), and it fails for every
`n ≥ 5`: there is a
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
- **FourManifolds** consumes Layers 1, 2 and 6 and Layer 4.3.1's knot/proper-link Arf invariant, and owns the four-dimensional theorems this
  roadmap states (the dimension-four annulus theorem and Freedman's theorem).
- **TangentialBordism** consumes Layer 1's gluing, Layer 4.3.1's finite quadratic
  Arf algebra and Layer 11.3's smooth triangulations; its Spin-surface
  refinement and Spin bordism classification remain its own constructions.
- **GeometricTopology, Part II** consumes every layer and owns the developments listed under
  *Scope and ownership*.

## References

- A. Pyronneau, *The Arf and Rohklin’s invariant*, January 2024,
  [institutional notes](https://web.ma.utexas.edu/SMC/2024/Rokhlin_s_Invariant.pdf),
  §2.1, Lemmas 2.11–2.13, Corollary 2.14 and Theorem 2.15, pp.4–5.

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
  C. Squier, *The Burau representation is unitary*, Proc. Amer. Math. Soc. 90 (1984),
  199–202. L. Rudolph, *Nontrivial positive braids have positive signature*, Topology 21
  (1982), 325–327. P. Feller, *On the signature of positive braids*, BORIS Theses, Universität
  Bern, p. 22.
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
  3-manifolds*, Bull. London Math. Soc. 15 (1983), 401–487. C. Adams, M. Hildebrand,
  J. Weeks, *Hyperbolic invariants of knots and links*, Trans. Amer. Math. Soc. 326 (1991),
  1–56, §2 (pp. 2–4), Tables 1–2.
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
