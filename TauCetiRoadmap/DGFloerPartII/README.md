# Roadmap: DG Floer theory, Part II: spheres, knotted hypersurfaces and bordism

**Summary.** The [DG Floer roadmap](../DGFloer/README.md) builds Morse and Floer homology with
coefficients in a DG local system, the Viterbo isomorphism with DG coefficients for cotangent
bundles, and the criteria of Barraud, Damian, Humilière and Oancea for the contractible almost
existence property and for finiteness of the `π₁`-sensitive Hofer–Zehnder capacity: its Theorems
L and M, the cotangent criterion, and Theorems A and C. This roadmap is its continuation. It
holds the applications of that package to the remaining headline results of the source paper
(arXiv:2404.07953): **Theorem B**, the multiple-realization form of Theorem A, which realizes a
rational multiple of a homology class by a closed oriented manifold; **Theorem H**, almost
existence and finite capacity for manifolds *abundant with 2-spheres*, with **Theorem I**, the
list of such manifolds (spheres, sphere bundles over highly connected bases, compact Lie groups
other than tori, manifolds that are not aspherical and are covered by diffeomorphisms, and the
complex and quaternionic projective spaces), to which Proposition 6.36 adds orientable
homogeneous spaces; and **Theorem G**, on knotted hypersurfaces in cotangent bundles. These
applications rest on the structured Pontryagin–Thom and rational bordism theory of
TangentialBordism, on the James construction and Bott–Samelson theorem of
GeneralAlgebraicKTheoryPartII, and on the complex projective carrier and Fubini–Study form of
ComplexKahlerGeometry; TangentialBordism consumes the base roadmap, so the applications live
here and the base need not consume them back. Two pieces of general homotopy theory that these
applications need are built here: the convenient category of compactly generated spaces, in
which loop spaces and colimits of matrix groups are formed (Layer 1), and the stable orthogonal
groups with real Bott periodicity, proved by Milnor's Morse theory of the Clifford chain
(Layer 4). The homogeneous carriers, explicit degree computations and projective loop-space
calculations that only these applications use are built here too, in Layers 1 and 2. Nothing
here is consumed by the base roadmap.

Suggested homes:

| Layers | Home |
| --- | --- |
| 1 | `TauCeti/Topology/Category/CompactlyGenerated/`, `TauCeti/AlgebraicTopology/` and `TauCeti/Geometry/Manifold/Homogeneous/` |
| 2 | `TauCeti/Geometry/Manifold/Morse/Bott/` |
| 3–4 | `TauCeti/Geometry/Symplectic/Hamiltonian/AlmostExistence/`; 4.2a–4.2c in `TauCeti/AlgebraicTopology/StableOrthogonal/` |

## Scope and ownership

**In scope.** The source paper's Theorem B (Theorem 5.14) with the Theorem B forms of
Corollaries D and E, every numbered statement of its §§6.3–6.4 and §7, and the carriers,
comparisons and explicit maps those statements consume. The [source coverage](#source-coverage)
section assigns each of them to a layer. The base roadmap, cited as **DGFloer** by layer and
item, owns every other numbered statement of the source and its standing conventions; an
unqualified "Layer `k`" or "`k.n`" refers to this roadmap.

**Owned here.** This roadmap owns everything it states that the table below does not assign
elsewhere. In particular it owns:

- compact generation on Mathlib's `CompactlyGenerated`, obtained from Mathlib's coreflection of
  generated spaces, the convenient products and mapping spaces with the exponential law, the
  product criterion for a locally compact Hausdorff factor, the homotopy groups, compact path
  families and products of sequential colimits of compact Hausdorff spaces along closed
  cofibrations (on Tau Ceti's finite-stage factorization of compact subsets and compact maps),
  and the pointed smash products, cones, suspensions and loop spaces with the suspension–loop
  adjunction (1.0);
- the comparison of the base roadmap's raw compact-open path, loop and mapping carriers with the
  convenient carriers of 1.0, and the based sphere's comparison with its categorical reduced
  suspension (1.1–1.2);
- the real and complex orthonormal-two-frame quotient comparisons, the projective quotient
  comparisons, the unit-round Hopf metrics with their curvature, period and totally geodesic
  statements, the quaternionic vector fields on `S^(4k−1)`, and the Fubini–Study form comparison
  (1.3);
- the Stiefel-domain map of Proposition 6.17 and the rotation family of the second proof of
  Proposition 6.34, lifted to `SO(n+1)`, with their degrees (1.4);
- the comparison of the base roadmap's Pontryagin–Thom collapse in a closed ambient manifold
  with the Euclidean framed collapse of GeneralizedCohomology and TangentialBordism (1.5);
- the based-loop Morse–Bott energy on `CPᵈ` and `HPᵈ`: critical manifolds, negative bundles,
  integral perfectness, calibrated generators, the path-loop total-space comparison and the
  primary and mixed-bidegree differentials (Layer 2);
- the multiple-realization application and Theorem B (Layer 3);
- the stable orthogonal and special orthogonal groups with the finite-to-stable range (4.2a),
  Milnor's Clifford chain of iterated minimal centrioles with its minimal geodesics (4.2b), and
  the index bounds of its non-minimal geodesics, the Bott maps, real Bott periodicity and the
  stable homotopy groups of `O` and `SO` (4.2c);
- abundance, fibered families of 2-spheres, covering by diffeomorphisms, the torsion group
  `π_(n−1)(SO(n))` of Lemma 6.35 with its low-rank values, Proposition 6.31 for compact
  connected Lie groups other than tori, homogeneous spaces, the projective applications,
  Theorems H and I, knotted hypersurfaces and Theorem G (Layer 4).

**Left to named roadmaps.** The following objects are built elsewhere; this roadmap consumes
them by name and section (see the supplier contracts) and does not restate them.

| Object | Owner | Relation to this roadmap |
| --- | --- | --- |
| Cubical chains, the weak-equivalence and Serre machinery, Serre classes, the Pontryagin–Thom collapse in a closed ambient manifold, the evaluation bundle of `Diff(M)` | DGFloer Layers 0–1 | consumed by every layer |
| Moore paths and loops, the mapping spaces out of spheres, DG local systems, twisting cocycles, the Brown resolution | DGFloer Layers 2–4 | consumed by Layers 1, 2 and 4 |
| DG Morse homology, its fibration theorem, classes living over the fundamental class, the free loop space through broken geodesics | DGFloer Layer 5 | consumed by Layers 2 and 4 |
| Cotangent bundles with the magnetic fibre translation, hypersurfaces, almost existence and the capacity | DGFloer Layer 6 | consumed by Layers 3–4 |
| Theorems L and M with Propositions 6.6–6.7, the cotangent criterion, the kernel of `i_{Q*}`, Theorems A and C with the Theorem A and C forms of Corollaries D and E | DGFloer Layer 10 | consumed by Layers 3–4 |
| The finite cover `T × K → G` of a compact connected Lie group and the torus criterion | DGFloer Layer 11 | consumed by 4.3 |
| The James reduced product with its word filtration, the James map into Moore loops, the James equivalence for connected CW complexes and the Bott–Samelson tensor-algebra theorem | GeneralAlgebraicKTheoryPartII §4.30b | consumed by 1.2 |
| The unframed Euclidean Pontryagin–Thom collapse `S^N → Th ν`, its independence of the choices and its fundamental-class duality | GeneralizedCohomology G5 item 2 | consumed by 1.5 |
| Structured Pontryagin–Thom (the finite coefficient collapse, the framed comparison), the rational oriented-bordism orientation surjection with geometric preimages | TangentialBordism B5.1, B5.5, B6.3 | consumed by 1.5 and 3.1 |
| The rational spectral Hurewicz theorem, the designated quaternionic and `HPᵈ` carriers, the base cell, cup and Thom classes | GeneralizedCohomology G4.0b, G4.3–4.5, G5 | consumed by 1.3, 2.5, 3.1 and 4.2b |
| The complex projective carrier, its atlases and orientation, the Fubini–Study form | ComplexKahlerGeometry K7.1–K7.2 | consumed by 1.3 |
| Proper free-action quotients, principal projections, tangent quotients, fibre metrics and structure-group reductions, the first Chern class and rank-one Chern–Weil | SmoothBundlesConnections B1.4, B2.2, B2.5, B6.2–B6.3 | consumed by 1.3, 4.2, 4.2a and 4.2b |
| The closed-subgroup theorem and the real and complex matrix groups | LieGroups Layer 2 | consumed by 1.3, 4.2a, 4.2b and 4.4 |
| The round Hopf metrics, normal-homogeneous metrics, Jacobi fields, the index form, finite broken geodesics and the based-loop sphere calculation | RiemannianGeometry R1–R3 | consumed by Layer 2 and 4.2c |
| Morse–Bott normal bundles, compact-band attachments and the orientation-system Thom comparison | MorseTheory M5 | consumed by Layer 2 and 4.2c |
| Tubular neighbourhoods, collars, `Diff(M)` as a topological group with the `C^∞` topology | GeometricTopology Layers 1 and 3 | consumed by Layers 1 and 4 |
| Local coefficient systems, fundamental classes, the orientation local system, the reduced-suspension sphere models, closed-cofibration towers with their mapping telescopes, the Hurewicz map, Whitehead's theorem for spaces of CW type, the CW type of compact manifolds and of mapping spaces, the homological characterization of the mapping degree | AlgebraicTopology Stages 2, 4, 6, 8 | consumed by Layers 1 and 4 |
| The octonionic projective plane as a Riemannian manifold | none | the Cayley plane half of Proposition 6.39 is out of scope |

**Out of scope.**

- The Cayley plane in Proposition 6.39: it needs the octonionic projective plane as a
  Riemannian manifold, which no roadmap builds. The quaternionic half of Proposition 6.39 is in
  scope.
- Conjecture 1.2 and Corollary F, for the reasons stated in the base roadmap.
- General Lie theory, compact representation theory and rational bordism theory: these are
  consumed from the suppliers named below at their stated hypotheses. Bott periodicity is proved
  here in its real form, for the stable orthogonal group and the eight members of the Clifford
  chain (4.2a–4.2c), because the stable term of Lemma 6.35 (4.3) needs it; complex Bott
  periodicity, the comparison of the Grassmannian members `Ω₃` and `Ω₇` of the chain with
  classifying spaces of stable quaternionic and real vector bundles, and the comparison of the
  Bott maps with Clifford-module `K`-theory are not part of this roadmap, and nothing here uses
  them (see Downstream consumers).

## Conventions

The standing conventions of the base roadmap apply unchanged: normalized cubical chains, the
grading bridge, Moore loops with the fixed-interval comparison, the raw compact-open
mapping-space topology with its metrizable homeomorphism lane, coefficients, the Floer grading,
the sign dictionary, unbundled hypotheses and specified maps. In addition:

- **Convenient carriers.** The convenient internal hom `Map_k` of 1.0 is the compact-open
  topology followed by compact generation `k`. Every statement here about a convenient
  mapping space is made through the comparison of 1.1 with the base roadmap's raw carrier, and a
  homeomorphism is claimed only in the base roadmap's compactly generated lane.
- **Orientations of homogeneous carriers.** A frame carrier `SO(n)/SO(n−2)` or `U(n)/U(n−2)` is
  oriented through its quotient comparison of 1.3 from left-invariant orientations of the
  groups; a homogeneous quotient `G/H` from a left-invariant orientation of `G` and the chosen
  orientation of `H`; and the evaluation-pullback orientation system `ev*or_M` is used wherever
  `M` is not assumed orientable (4.4). The projective quotients `U(d+1)/(U(d) × U(1))` and
  `Sp(d+1)/(Sp(d) × Sp(1))` of 1.3 use the suppliers' convention: base point the last
  coordinate line `[e_d]`, stabilizer the ordered blocks with the rank-one block last.
- **Spheres and their unit tangent spheres.** `Sⁿ` is the unit sphere of `ℝⁿ⁺¹`, oriented as the
  boundary of the unit ball; for `p ∈ Sⁿ` the unit tangent sphere `T¹_pSⁿ` is the unit sphere of
  the hyperplane `p^⊥`, with the same boundary orientation. For `n = 1` this makes `T¹_pS¹ = S⁰`
  the two points `±e₁`, the point `e₁` counted with sign `+1` and `−e₁` with sign `−1`.
- **Rotations.** For orthonormal `p, u ∈ ℝⁿ⁺¹`, `R(p, u; θ) ∈ SO(n+1)` is the rotation by the
  angle `θ` in the plane spanned by `p` and `u`, oriented by the ordered pair `(p, u)`, fixing
  the orthogonal complement pointwise: as a matrix,
  `R(p, u; θ) = I + (cos θ − 1)(p pᵀ + u uᵀ) + sin θ (u pᵀ − p uᵀ)`,
  so that `R(p, u; θ) p = cos θ·p + sin θ·u` and `R(p, u; θ) u = −sin θ·p + cos θ·u`.
- **Citations of the base.** "DGFloer Layer `k` item `j`" always refers to the base roadmap.

## Exact supplier contracts

Every declaration below was checked at the pinned Mathlib and Tau Ceti; what the pins lack is a
target of this roadmap or of the named supplier, never a "native" API.

### From Mathlib

- Cubical homotopy groups `HomotopyGroup.Pi`, written `π_ n X x`, with their group structure
  (`Mathlib/Topology/Homotopy/HomotopyGroup.lean`), `IsOfFinOrder`
  (`Mathlib/GroupTheory/OrderOfElement.lean`) and `IsMulTorsion`
  (`Mathlib/GroupTheory/Torsion.lean`): the carriers of the statements of 3.2, 4.3 and 4.6 in
  `Suggested.lean`.
- Singular homology `AlgebraicTopology.singularHomologyFunctor`
  (`Mathlib/AlgebraicTopology/SingularHomology/Basic.lean`), with integral coefficients
  `ModuleCat.of ℤ (ULift ℤ)` as in Tau Ceti's fundamental class: the map
  `H_n(U; ℤ) → H_n(Q; ℤ)` in the hypothesis of Theorem B (3.2) and the degree `g_*[S] = d[Y]` in
  that of Theorem G (4.6).
- `Matrix.orthogonalGroup`, `Matrix.specialOrthogonalGroup` and `Matrix.unitaryGroup`
  (`Mathlib/LinearAlgebra/UnitaryGroup.lean`), with the subtype topology of the matrix space;
  `LieGroup`; `Quaternion`; the block matrices `Matrix.fromBlocks`, reindexed along
  `finSumFinEquiv` by `Matrix.reindex`, which give the block inclusion `soBlockInclusion` of 4.2a.
- `EuclideanSpace`, `Metric.sphere` with its smooth structure modelled on `EuclideanSpace ℝ (Fin n)`,
  `Circle`, `Bundle.RiemannianBundle` and `IsContMDiffRiemannianBundle` (the smooth Riemannian
  metrics of 4.5), and the compact-open topology `ContinuousMap.compactOpen` on `C(X, Y)` with
  currying `ContinuousMap.curry` and Whitehead's lemma
  `Topology.IsQuotientMap.continuous_lift_prod_left`, that the product of a quotient map with the
  identity of a locally compact space is again a quotient map (`Mathlib/Topology/CompactOpen.lean`).
- `Bundle.Trivialization` (`Mathlib/Topology/FiberBundle/Trivialization.lean`), a local
  trivialization of any projection `p : Z → B` with fibre `F`, an open partial homeomorphism
  `p⁻¹(U) ≅ U × F` over an open base set `U`: the local triviality of the fibered families of 4.2
  in `Suggested.lean`, a trivialization around every point of the base. With the mixin
  `Bundle.Trivialization.IsLinear` (`Mathlib/Topology/VectorBundle/Basic.lean`), a linear
  trivialization whose base set is the whole base is a homeomorphism of the total space with the
  product, linear on fibres; the triviality of the normal bundle of `Y` in the statement of
  Theorem G (4.6) in `Suggested.lean`.
- `FiberBundle` (`Mathlib/Topology/FiberBundle/Basic.lean`), `VectorBundle`
  (`Mathlib/Topology/VectorBundle/Basic.lean`) and `IsContinuousRiemannianBundle`
  (`Mathlib/Topology/VectorBundle/Riemannian.lean`, an inner product on each fibre given by a
  continuous section of the bundle of bilinear forms): the real vector bundles with continuous
  fibre metric whose unit-sphere bundles carry the sphere-bundle statements of 4.2 in
  `Suggested.lean`.
- Generated spaces (`Mathlib/Topology/Convenient/`): for a family `X` of topological spaces, the
  predicate `Topology.IsGeneratedBy` (the topology is coinduced by all continuous maps from
  members of `X`), with the closure of `X`-generated spaces under quotients, sums and sigma types
  (`Quot.isGeneratedBy`, `Sum.isGeneratedBy`, `Sigma.isGeneratedBy`); the full subcategory
  `GeneratedByTopCat` of `TopCat` with its coreflection `GeneratedByTopCat.adj` onto the right
  adjoint `TopCat.toGeneratedByTopCat`, whose unit is invertible, and its limits and colimits; and
  the space `Topology.ContinuousMapGeneratedBy` of `X`-continuous maps, topologized through
  precomposition with the maps from members of `X` into the compact-open spaces, with the
  currying bijection `Topology.ContinuousMapGeneratedBy.curryEquiv` and the evaluation
  `Topology.ContinuousMapGeneratedBy.ev`, both under the hypotheses that every member of `X` is
  locally compact and that the product of two members is `X`-generated. 1.0 applies them to the
  family of compact Hausdorff spaces of `CompHaus`.
- The category `CompactlyGenerated.{u, w}` with its fully faithful inclusion
  `CompactlyGenerated.compactlyGeneratedToTop` (`Mathlib/Topology/Category/CompactlyGenerated.lean`),
  the compactly generated topology `TopologicalSpace.compactlyGenerated`, the classes
  `UCompactlyGeneratedSpace` and `CompactlyGeneratedSpace`, and the instances that quotients,
  sums, sigma types, sequential spaces and weakly locally compact Hausdorff spaces are compactly
  generated (`Mathlib/Topology/Compactness/CompactlyGeneratedSpace.lean`): the carriers on which
  1.0 builds the coreflection `k`. Mathlib's compactly coherent
  coreflection `CompactCoherentification`, written `𝐤X`
  (`Mathlib/Topology/Compactness/CompactlyCoherentSpace.lean`), agrees with it on Hausdorff spaces:
  a Hausdorff space is compactly coherent exactly when it is compactly generated (the instances
  `to_compactlyCoherentSpace` and `of_compactlyCoherentSpace_of_t2` of
  `Mathlib/Topology/Compactness/CompactlyGeneratedSpace.lean`), and for a Hausdorff `X` tested in its
  own universe both `𝐤X` and `TopologicalSpace.compactlyGenerated X` carry the topology coherent
  with the compact subsets of `X`. The carriers 1.1 compares are Hausdorff.

### From Tau Ceti

- `TauCeti.IsAspherical` (`TauCeti/AlgebraicTopology/EilenbergMacLane/Basic.lean`): a based
  space is aspherical when it is path connected and every `π_(n+2)` is trivial. It is the
  hypothesis form of Propositions 6.29 and 6.33 and of the torus criterion.
- `HomotopyGroup.pathLoopSpaceMulEquiv` (`TauCeti/Topology/Homotopy/HomotopyGroup/LoopSpace.lean`):
  the loop-space shift `π_m(ΩX) ≃* π_(m+1)(X)`, used by 4.2c to read stable groups off loop
  spaces.
- `HomotopyGroup.map` (`TauCeti/Topology/Homotopy/HomotopyGroup/Map.lean`): the map on homotopy
  groups induced by a based continuous map, the carrier of the finite-to-stable range of 4.2a in
  `Suggested.lean`.
- `TauCeti.subsingleton_homotopyGroup_sphere_of_lt` and `TauCeti.homotopyGroupSphereAddEquiv`
  (`TauCeti/AlgebraicTopology/Sphere/HomotopyGroup.lean`): `π_k(Sⁿ) = 0` for `k < n`, which gives
  the range of 4.2a, and `π_n(Sⁿ) ≅ ℤ` for `n ≥ 2`, which gives `π₃(Sp(1)) = ℤ` in 4.2c; in the
  same file, `TauCeti.MooreLoopSpace.doubleFirstHomologySphereAddEquiv`, the first integral
  homology `H₁(Ω^MΩ^MS³; ℤ) ≅ ℤ` of the double Moore loop space of `S³`, through degree-one
  Hurewicz and `π₃(S³) ≅ ℤ`, the `n = 3` group of Proposition 6.21 in 4.2.
- `LocalCoefficientSystem` and twisted singular homology
  (`TauCeti/AlgebraicTopology/LocalCoefficient.lean`): the twisted homology of 4.4.
- `TauCeti.RankOneLocalSystem` with `TauCeti.RankOneLocalSystem.twistedCochainComplexIso`
  (`TauCeti/AlgebraicTopology/DGLocalSystem/RankOne.lean`): a rank-one local system on a pointed
  space, a character of the Moore loops with values in the units of the coefficient ring and
  constant along paths, the DG algebra automorphism `Φ^L` it induces on the loop chains, and the
  isomorphism between the twisted complex of `𝓕 ⊗ L` with a twisting cocycle `m` and that of
  `𝓕` with `Φ^L ∘ m` (the source's Lemma 2.1 and Proposition 2.2). The rank-one twists of 4.4,
  with `L` the orientation character of the homogeneous space.
- `TauCeti.CotangentBundle.symplecticForm` (`TauCeti/Geometry/Symplectic/Cotangent/Bundle/Liouville.lean`),
  the canonical form `ω = −dλ` of `T*M`; `TauCeti.CotangentBundle.codiscBundle`
  (`TauCeti/Geometry/Symplectic/Cotangent/Bundle/Codisc.lean`), the covectors of norm at most `1`
  for a Riemannian metric given as a `Bundle.RiemannianBundle` on the tangent bundle;
  `TauCeti.SmoothTwoForm.contractibleHZCapacity`
  (`TauCeti/Geometry/Symplectic/Capacity/HoferZehnder.lean`), the `π₁`-sensitive Hofer–Zehnder
  capacity `c°_HZ`, in which only orbits contractible in the domain are excluded; and
  `TauCeti.SmoothTwoForm.HasContractibleAlmostExistence` with `TauCeti.IsRegularValue`
  (`TauCeti/Geometry/Symplectic/Hamiltonian/AlmostExistence.lean`,
  `TauCeti/Geometry/Manifold/RegularValue.lean`). These are the carriers of the statements of 3.2,
  4.5 and 4.6 in `Suggested.lean`, as they are of the base roadmap's Theorem A.
- `TauCeti.HomologicalOrientation` with `mapFundamentalClass`
  (`TauCeti/AlgebraicTopology/Singular/LocalHomology/FundamentalClass.lean`): the integral
  fundamental class `[M]` and its images, for the covering condition `ev_*A = ℓ[M]` of 4.3 and 4.5,
  the orientations of base, total space and fibre and the fibre class `j_*[F]` of the fibered
  families of 4.2, and the degree condition `g_*[S] = d[Y]` of Theorem G (4.6).
- `Diffeomorph.weakWhitneyTopology` and `Diffeomorph.continuous_eval_const`
  (`TauCeti/Geometry/Diffeomorphism/Topology.lean`): the `C^∞` topology on the diffeomorphisms of
  a compact manifold, the weak and strong Whitney topologies agreeing there, with continuous
  evaluation at a point. It topologizes `Diff(M)` but proves no continuity of inversion; the
  topological-group structure of 4.3 is GeometricTopology Layer 3's.
- `TauCeti.ComplexProjectiveSpace` and `TauCeti.QuaternionicProjectiveSpace` with their smooth
  structures (`TauCeti/Geometry/Manifold/Instances/ComplexProjectiveSpace.lean`, modelled on
  `𝓘(ℂ, Fin d → ℂ)`, and `TauCeti/Geometry/Manifold/Instances/QuaternionicProjectiveSpace.lean`,
  modelled on `𝓘(ℝ, Fin d → ℍ)`), and `IsManifold.restrictScalars`
  (`TauCeti/Geometry/Manifold/IsManifold/RestrictScalars.lean`), which makes the first a real
  manifold: the carriers of the projective statements of 4.5. 1.3 compares them with the
  designated projective carriers of ComplexKahlerGeometry K7.1 and GeneralizedCohomology G4.0b.
- `TauCeti.SmoothEmbedding` (`TauCeti/Geometry/Manifold/SmoothEmbedding/Basic.lean`), with
  `TauCeti.SmoothEmbedding.tangentRange` and `TauCeti.SmoothEmbedding.NormalSpace`
  (`TauCeti/Geometry/Manifold/SmoothEmbedding/NormalSpace/Basic.lean`): the range of the
  differential of an embedding at a point, and the intrinsic normal space, the ambient tangent
  space modulo that range, with no metric or complement; and
  `TauCeti.SmoothEmbedding.instTopologicalSpaceNormalBundle`
  (`TauCeti/Geometry/Manifold/SmoothEmbedding/NormalSpace/Topology.lean`), the quotient topology on
  the normal total space from the pulled-back ambient tangent bundle. These are the carriers of
  the transversality and normal-triviality hypotheses of Theorem G (4.6) in `Suggested.lean`; they
  give no tubular neighbourhood, which is GeometricTopology Layer 1's.
- `TauCeti.stiefel` (`TauCeti/Geometry/Manifold/Instances/Stiefel.lean`): the Stiefel manifold of
  orthonormal `k`-frames, a subset of `Fin k → E` with the subspace topology, the real frame
  carrier `V_(n,2)(ℝ)` on which 1.3 builds its quotient identification, and the carrier of the
  Stiefel term `π_n(V_(n+2,2)(ℝ))` of the splitting of 4.3 in `Suggested.lean`.
- `TauCeti.orthogonalToDiffSphere` and `TauCeti.continuousOrthogonalToDiffSphere`
  (`TauCeti/Geometry/Diffeomorphism/Sphere.lean`): the reference inclusion `O(n+1) → Diff(Sⁿ)`,
  an injective group homomorphism restricting a linear isometry to the unit sphere, continuous for
  the subspace topology on the orthogonal group and the weak Whitney topology. Both proofs of
  Proposition 6.34 in 4.3 push classes of `H_n(SO(n+1))` into `H_n(Diff(Sⁿ))` along its
  restriction to `SO(n+1)`.
- `IsCoveringMap.homotopyGroupPiMulEquiv` (`TauCeti/Topology/Homotopy/HomotopyGroup/Covering.lean`):
  a covering map induces isomorphisms `π_(n+2)(E, e) ≃* π_(n+2)(X, p e)`, with no connectivity
  hypothesis; 4.3 reads `π₂(SO(3)) ≅ π₂(S³)` off the double cover `S³ → SO(3)`.
- `TauCeti.NDRPair` with `TauCeti.nonempty_ndrPair_iff`
  (`TauCeti/Topology/Homotopy/Extension/NDRPair.lean`): Strøm's characterization of closed
  cofibrations as the subsets admitting NDR data (a control function vanishing exactly on the
  subset and a deformation into it). 1.0 makes the smooth closed embeddings of compact manifolds
  along which it forms sequential colimits closed cofibrations through it.
- The finite-stage factorization for sequential colimits in `TopCat`
  (`TauCeti/Topology/Category/TopCat/Compact.lean`,
  `TauCeti/Topology/Category/TopCat/ClosedEmbedding.lean`):
  `TauCeti.TopCat.exists_subset_range_ι_of_isCompact`, that in a sequential colimit of T1 spaces
  along injective maps every compact subset lies in the image of one stage;
  `TauCeti.TopCat.exists_lift_of_compactSpace`, that when moreover the maps from the stages are
  embeddings, every continuous map from a compact space factors continuously through one stage;
  `TauCeti.TopCat.isClosedEmbedding_ι_of_isColimit`, that in a directed colimit whose transition
  maps are closed embeddings the maps from the stages are closed embeddings; and
  `TauCeti.TopCat.uCompactlyGeneratedSpace_of_isColimit`, that a colimit in `TopCat` of compactly
  generated spaces is compactly generated. 1.0 applies them to its towers of compact Hausdorff
  spaces along closed cofibrations, and 4.2a–4.2c read the stable groups and path spaces off the
  finite stages through 1.0.
- `TauCeti.realClifford_classification` with `TauCeti.realCliffordForm`
  (`TauCeti/LinearAlgebra/CliffordAlgebra/Classification.lean`,
  `TauCeti/LinearAlgebra/CliffordAlgebra/RealForm/Basic.lean`): the real Clifford algebra of the
  diagonal form of signature `(p, q)`, the first `p` generators squaring to `+1` and the last `q`
  to `−1` under Mathlib's convention `ι(v)² = Q(v)`, is the full real, complex or quaternionic
  matrix algebra, or the product of two quaternionic or two real ones, prescribed by
  `(q − p) mod 8`. For the signature `(0, j)` this is the algebra `Cl_j` of `j` anticommuting
  complex structures used by 4.2b and 4.2c.
- `TauCeti.CotangentBundle.mpullback_vectorBundleTranslateDiffeomorph_symplecticForm` and
  `TauCeti.CotangentBundle.mpullback_vectorBundleScalarDiffeomorph_symplecticForm`
  (`TauCeti/Geometry/Symplectic/Cotangent/Bundle/Fiberwise.lean`): the fibre translation
  `τ_α(p) = p + α_x` by a one-form `α` pulls `ω` back to `ω − π^*dα`, and the fibre dilation by a
  real `c ≠ 0` pulls `ω` back to `c·ω`; with
  `TauCeti.SmoothTwoForm.IsNondegenerate.contractibleHZCapacity_smul` and
  `TauCeti.SmoothTwoForm.IsNondegenerate.contractibleHZCapacity_image`
  (`TauCeti/Geometry/Symplectic/Capacity/HoferZehnder.lean`), the conformality
  `c°_HZ(W, cσ) = c·c°_HZ(W, σ)` for `c > 0` and the invariance of `c°_HZ` under
  symplectomorphisms. These fix the magnetic sign of 3.3 and give the metric independence of 4.5
  and the change of projective model of 1.3.

### From TauCetiRoadmap.DGFloer

The base roadmap, with its standing conventions. Consumed, by layer and item:

- Layer 0: normalized cubical singular chains, the cross product and the comparison with
  simplicial chains, through which every homological input below is transported.
- Layer 1 item 1: `π₁ᵃᵇ ≅ H₁`. Item 2: CW approximation, homology invariance under weak
  equivalences, the fibration homotopy exact sequence and the homological and cohomological
  Serre spectral sequences on native Serre fibrations. Item 3: the filtered-complex spectral
  sequence and its convergence. Item 4: Serre classes, Hurewicz modulo a class, the
  Eilenberg–MacLane models and the mod-2 vanishing theorem. Item 5: the Pontryagin–Thom
  collapse for framed submanifolds of a closed ambient manifold. Item 6: the evaluation bundle
  `Diff(M) → M` and its local sections.
- Layer 2: Moore paths and loops, the free loop space, the Moore-path replacement, the
  fixed-interval sphere and interval models with `Map_*(S², Q)`, `Map(S², Q)`, the adjunction
  `β_* : H_*(Ω²X) → H_(*+1)(ΩX)`, the constant-sphere section and `G × Map_*(S², G) ≅ Map(S², G)`.
- Layer 3: DG local systems, their pullbacks and basepoint change, and the DG local system of a
  Hurewicz fibration.
- Layer 4: twisting cocycles, the twisted complex, the index filtration and the arbitrary-CW
  Brown resolution of item 5 (the base's §4.1 where it numbers its sections; cited below as
  Layer 4 item 5).
- Layer 5 items 1–6: representing chain systems, the Barraud–Cornea cocycle, DG Morse homology
  with its direct and Umkehr maps, the fibration theorem, classes living over the fundamental
  class with shriek naturality, and the free loop space through broken geodesics.
- Layer 6 items 3–5: cotangent bundles with the magnetic fibre translation, hypersurfaces and
  the Liouville-flow argument, almost existence and the `π₁`-sensitive capacity.
- Layers 8–9: DG Floer homology and the Viterbo isomorphism, only through the criteria below.
- Layer 10: Theorems L and M with Propositions 6.6–6.7 (item 2), the cotangent criterion
  (item 3), the kernel of `i_{Q*}` (item 4), and Theorems A and C with the Theorem A and C forms
  of Corollaries D and E (item 5).
- Layer 11: the finite covering `T × K → G` of a compact connected Lie group and the criterion
  that `G` is aspherical exactly when it is a torus, consumed by 4.3.

### From TauCetiRoadmap.TangentialBordism

B5 (structured Pontryagin–Thom: the normal classifier and collapse, the finite embedded
comparison, the stable transformation on pairs and the framed and ordinary comparisons) and
B6.3 (homology realization: the rational oriented-bordism orientation surjection with geometric
preimages and its singular-CW comparison). B6.3 and B5 are consumed by 3.1 together with
GeneralizedCohomology G5; B5.1's coefficient collapse, for the trivial rank-`k` normal structure
over a point (a normal framing), and B5.5's signed count of framed points are consumed by 1.5.
DGFloer's Layer 1 inputs precede their construction. No whole-roadmap dependency is imposed.

### From TauCetiRoadmap.GeneralAlgebraicKTheoryPartII

§4.30b, *The James reduced product*, consumed by 1.2 with `W = S^(n−1)`, `n ≥ 2`, and `R = ℤ`,
for the ring `H_*(ΩSⁿ)` that 4.2 uses:

- for a pointed space `(W, w₀)`, the James reduced product `J(W)`, the free monoid on the points of
  `W` with `w₀` as unit, topologized as a quotient of the disjoint union of the powers of `W`, with
  its universal property for continuous maps into topological monoids, functoriality and word-length
  filtration; for a Hausdorff CW complex `W` whose base point is a 0-cell, its CW structure with the
  filtration stages as subcomplexes and the smash powers `W^∧r` as filtration quotients;
- the James map `j : J(W) → Ω^MΣW` into the Moore loops of the raw reduced suspension
  `ΣW = (W × I)/(W × ∂I ∪ {w₀} × I)`, a continuous monoid map that sends a letter `w` to a loop
  through the points `[w, t]` and whose restriction to `J₁W ≅ W` is homotopic, through the
  comparison of Moore loops with unit-interval loops, to the unit `W → ΩΣW`; for connected `W`,
  `j` is a weak homotopy equivalence and a homotopy equivalence;
- the homology of `J(W)`: for a commutative ring `R` over which `H̃_*(W; R)` is flat, the
  Pontryagin product identifies the tensor algebra `T_R(H̃_*(W; R))` with `H_*(J(W); R)` as
  graded `R`-algebras, and through the James equivalence the same holds for `H_*(ΩΣW; R)` when
  `W` is connected (the Bott–Samelson theorem).

Its Moore loops are the base roadmap's Moore loops of DGFloer Layer 2, on which 1.2 makes the
comparison with the base roadmap's carrier.

### From other roadmaps

- **GeneralizedCohomology.** G4.0b: the designated quaternionic `Sp(n)` carrier, the
  quaternionic frame, Grassmannian and `HPᵈ` carriers with their smooth Hopf comparisons
  (consumed by 1.3, and by 4.2a–4.2b for `Sp(r)` and the quaternionic Grassmannians of the
  Clifford chain). G4.0 and G4.3–4.5: the base cell, cup and Thom classes on the designated
  projective carriers (consumed by 2.5). G2.10: the mapping-path replacement and raw lifting
  maps (consumed by 1.1). G5 item 2: the unframed collapse `S^N → Th ν` of a closed submanifold
  of a Euclidean space, collapsing the complement of a tube, with its independence of the
  embedding, the stabilization and the metric and its compatibility with fundamental-class
  duality (consumed by 1.5). G5: the rational spectral Hurewicz theorem, with the designated
  ordinary and spectral Thom carriers and the collapse and finite-duality comparisons (consumed
  by 3.1, together with TangentialBordism B5 and B6.3, which consume the same G2.10 and Thom
  inputs).
- **ComplexKahlerGeometry** [K7.1–K7.2](../ComplexKahlerGeometry/README.md).
  K7.1: the single complex projective carrier, its complex and real atlases and orientation.
  K7.2: the normalized Fubini–Study form, used only in the form comparison of 1.3.
- **LieGroups** [Layer 2](../RepresentationTheory/LieGroups/README.md): the closed-subgroup
  theorem and the real and complex matrix groups, consumed by 1.3, by 4.2a–4.2b for the
  orthogonal and unitary groups and the homogeneous members of the Clifford chain, and by 4.4.
- **SmoothBundlesConnections** [B1.4](../SmoothBundlesConnections/README.md#b14-slices-quotients-and-homogeneous-spaces):
  proper free-action smooth homogeneous quotients, principal projections and tangent quotients,
  the single generic quotient owner for 1.3, for the sphere fibrations `SO(r+1)/SO(r) ≅ S^r` of
  4.2a and for the homogeneous identifications of 4.2b; B2.2: fibre metrics; B2.5: frame bundles
  and reductions of the structure group (the unit-sphere bundle of 4.2); B6.2–B6.3: the first
  Chern class and rank-one Chern–Weil, inputs of the Fubini–Study form comparison of 1.3.
- **RiemannianGeometry** [R1–R3](../RiemannianGeometry/README.md): R1 the round Hopf projective
  metrics, the bi-invariant and normal-homogeneous metrics and local symmetry `∇R = 0`; R2 Jacobi
  initial-value and endpoint-exponential comparisons; R3 the index form, the finite
  broken-geodesic carrier with its energy-band and path-space comparisons, the finite node-value
  reduction and its based-loop sphere calculation, including `ΩS²` at radius `1/2`. Layer 2
  constructs the projective applications on those carriers, and 4.2c the Clifford-chain
  applications, with R1's bi-invariant metric on `O(n)`.
- **MorseTheory** [M5](../MorseTheory/README.md): the compact-band Morse–Bott parameter lemma,
  negative normal bundles, disc attachment and the orientation-local-system Thom comparison,
  consumed by Layer 2 on the finite approximations to the based loop spaces and by 4.2c on the
  finite approximations to the path spaces of the Clifford chain.
- **GeometricTopology** [Layers 1 and 3](../GeometricTopology/README.md): Layer 1 tubular
  neighbourhoods (1.0, 1.5) and the hypersurface and collar vocabulary (4.6); Layer 3 `Diff(M)` as
  a topological group with the `C^∞` topology and the smooth-families map (4.3). The inclusion
  `O(n+1) → Diff(Sⁿ)` is consumed from Tau Ceti.
- **AlgebraicTopology** [Stages 2, 4, 6 and 8](../AlgebraicTopology/README.md): Stage 4.4 the
  based circle and sphere models, `reducedSuspensionSphereHomeomorph` and the compact
  reduced-suspension carrier comparison (1.2); Stage 4 item 5,
  `cofibrationTowerHomotopyEquivalence`, the homotopy equivalence of the mapping telescope with
  the union and of the telescopes of two towers joined by levelwise equivalences whose squares
  commute up to specified homotopies (4.2c); Stage 8 item 7, the finite CW type of compact smooth
  manifolds (4.2c); Stages 2 and 6 local coefficient systems,
  fundamental classes, the orientation local system and its transport (4.2–4.4); Stage 6 item 5
  the homological characterization `f_*[S] = deg(f)·[Q]` of the shared manifold degree for maps
  between closed connected oriented manifolds, with its comparison to the degree counted on
  regular values: the base roadmap's supplier contract names this as its degree interface, and
  1.4 consumes the degree only through it; Stage 8.1–8.7 the Hurewicz map (4.3), with item 5,
  Whitehead's theorem for spaces of CW type (4.2c); Stage 8 item 11a, the CW type of mapping
  spaces from a finite CW pair with prescribed boundary values (the path spaces of 4.2c).

## How to read the build

Layer 1 builds the carriers and comparisons first: the convenient category of compactly
generated spaces on Mathlib's `CompactlyGenerated`, through Mathlib's coreflection of generated
spaces (1.0), and its comparison with the base roadmap's Layer 2 carriers, the sphere comparison
and the James ring from GeneralAlgebraicKTheoryPartII's James construction, the frame and
projective quotients from SmoothBundlesConnections, LieGroups, ComplexKahlerGeometry and
GeneralizedCohomology, the explicit degree computations from the base roadmap's degree
interface, and the comparison of the base roadmap's collapse with the Euclidean framed collapse
of GeneralizedCohomology and TangentialBordism. Layer 2 is finite-dimensional Morse–Bott theory
on those carriers, and consumes RiemannianGeometry R1–R3 and MorseTheory M5 without touching
Floer theory. Layer 3 consumes GeneralizedCohomology G5 and TangentialBordism B5 and B6.3
together with the base roadmap's Theorem 5.10. Layer 4 first proves real Bott periodicity for
the stable orthogonal group, formed in 1.0's convenient category, by the Morse theory of the
Clifford chain on the same RiemannianGeometry and MorseTheory inputs (4.2a–4.2c); it then
consumes the base roadmap's DG Morse homology, fibration theorem, shriek maps and Theorem M,
the carriers of Layers 1–2 and the named supplier inputs, and needs no Floer counts of its own.
Each layer ends with its examples and its dependencies; a `*Needs:*` line lists what a target's
statement and route need, item by item, so that a different proof route is not blocked behind an
unrelated layer.

## Layer 1: carriers, comparisons and explicit maps

These are the carriers and explicit maps that Layers 2 and 4 consume. They rest on the base
roadmap's Layers 1–2 and on the suppliers named above.

### 1.0 Compactly generated spaces and pointed constructions

Mathlib has two carriers for compactly generated spaces. One is the category
`CompactlyGenerated.{u, w}` of `u`-compactly generated spaces in `TopCat.{w}`, with its fully
faithful inclusion `CompactlyGenerated.compactlyGeneratedToTop`, and on every space `Y` the
topology `TopologicalSpace.compactlyGenerated.{u} Y`, the finest topology for which every
continuous map into `Y` from a space of `CompHaus.{u}` stays continuous; write `kY` for `Y` with
this topology. The other is the category `GeneratedByTopCat` of spaces generated by a chosen
family of spaces, with its coreflection and its currying bijection. This section takes the family
to be the compact Hausdorff spaces of `CompHaus.{u}`, identifies the two carriers, and builds on
them the convenient category in which 1.1 and 1.2 form mapping spaces and suspensions and
4.2a–4.2c form the stable classical groups, their loop spaces and their path spaces.

- **The coreflection.** A space is generated by the family of compact Hausdorff spaces of
  `CompHaus.{u}` exactly when it is `u`-compactly generated: both conditions say that the topology
  is coinduced by all continuous maps from those spaces, and Mathlib's
  `TopologicalSpace.generatedBy_eq_coinduced` writes the generated topology in the form that
  defines `TopologicalSpace.compactlyGenerated`, so the equivalence only unfolds definitions. So
  `CompactlyGenerated.{u, w}` and `GeneratedByTopCat` of that family are the same full
  subcategory of `TopCat.{w}`, and Mathlib's coreflection `GeneratedByTopCat.adj` transports to a
  right adjoint `k` of `CompactlyGenerated.compactlyGeneratedToTop`
  (`compactlyGeneratedToTop_isLeftAdjoint`), for all universes `u` and `w`. On objects `k` is
  `Y ↦ kY`, its counit is the identity map `kY → Y`, which is continuous, and its unit is
  invertible. Prove that `k` changes neither the underlying set nor the continuous maps from
  compact Hausdorff spaces, that `k(kY) = kY`, and that `kY = Y` exactly when `Y` is compactly
  generated. A right adjoint of a given functor is unique up to unique isomorphism, so every
  other compact-generation coreflection on these carriers, in particular the one through which
  AlgebraicTopology Stage 4.4 states its compact reduced-suspension carrier comparison, is
  identified with `k` along that isomorphism; on Hausdorff spaces `k` agrees with Mathlib's
  `CompactCoherentification` through the instances recalled in the Mathlib contract.
- **Limits, colimits and products.** The inclusion creates colimits: Mathlib's instances make
  quotients, sums and sigma types of compactly generated spaces compactly generated, so the
  colimits of Mathlib's `GeneratedByTopCat` are computed in `TopCat`. A limit is `k` of the limit
  in `TopCat`; in particular the convenient product is `X ×_k Y = k(X × Y)` with the two
  projections. If `X` is compactly generated and `Y` is locally compact Hausdorff, then `X × Y`
  is already compactly generated, so `X ×_k Y = X × Y` (`compactlyGeneratedSpace_prod`;
  Strickland, Proposition 2.6; Rezk, Proposition 7.3): `X` is a quotient of the sum of its compact
  Hausdorff test spaces `K`, the product of that quotient map with the identity of `Y` is a
  quotient map by Whitehead's lemma `Topology.IsQuotientMap.continuous_lift_prod_left`, and each
  `K × Y` is locally compact Hausdorff, hence compactly generated by Mathlib's instance. A CW
  complex in the sense of
  Mathlib's `Topology.CWComplex`, with the subspace topology, is compactly generated, its
  topology being coherent with its closed cells; the convenient product of two CW complexes is a
  CW complex with the product cells, and it is the ordinary product when one factor is locally
  compact or both have countably many cells (Hatcher, *Algebraic Topology*, Theorem A.6).
- **Mapping spaces and the exponential law.** Every space of `CompHaus.{u}` is locally compact, and
  the product of two of them is generated by the family, being itself a member of it (Mathlib's
  instance that every member of a family is generated by the family). So Mathlib's
  `Topology.ContinuousMapGeneratedBy.curryEquiv` and
  `Topology.ContinuousMapGeneratedBy.ev` apply to this family. For compactly generated `Y` the maps
  `Y → Z` that are continuous on every compact Hausdorff test space are exactly the continuous maps,
  and `Topology.ContinuousMapGeneratedBy` topologizes them by precomposition with every continuous
  `u : K → Y` from a compact Hausdorff `K` into the compact-open `C(K, Z)`; for Hausdorff `Y`, with
  the test spaces taken in the universe of `Y`, this is Mathlib's `ContinuousMap.compactOpen`,
  because every compact subset of `Y` is then a test space. Define `Map_k(Y, Z)` as `k` of this
  space. Prove that currying is a bijection `C(X ×_k Y, Z) ≅ C(X, Map_k(Y, Z))` for compactly
  generated `X` and `Y`, natural in all three variables (Mathlib's bijection read through the
  coreflection), and a homeomorphism `Map_k(X ×_k Y, Z) ≅ Map_k(X, Map_k(Y, Z))`, and that
  evaluation `Map_k(Y, Z) ×_k Y → Z` is continuous (Rezk, Propositions 8.6 and 8.8, stated for
  his k-spaces, which are the compactly generated spaces here, with no separation axiom;
  Strickland, Propositions 2.11 and 2.12). So `CompactlyGenerated` is cartesian closed, and
  `− ×_k Y` preserves colimits and quotient maps (Strickland, Proposition 2.20; Rezk, Proposition
  9.2). For locally compact Hausdorff `Y` the convenient
  currying agrees with Mathlib's `ContinuousMap.curry` through the counit `Map_k(Y, Z) → C(Y, Z)`,
  and that counit is a homeomorphism whenever `C(Y, Z)` is compactly generated, in particular when
  `Y` is compact metrizable and `Z` is metrizable (Mathlib's instance that sequential spaces are
  compactly generated).
- **Sequential colimits along closed cofibrations.** Let `X₀ → X₁ → ⋯` be closed cofibrations of
  compact Hausdorff spaces and `X_∞` their colimit, with the final topology, which is the colimit
  in `CompactlyGenerated` because the inclusion creates colimits (Tau Ceti's
  `TauCeti.TopCat.uCompactlyGeneratedSpace_of_isColimit`: a colimit in `TopCat` of compactly
  generated spaces is compactly generated). The bonding maps used in this roadmap, the block
  inclusions of 4.2a and the stabilizations of 4.2b, are smooth closed embeddings of compact
  manifolds; prove that such an embedding is a closed cofibration, a closed tubular neighbourhood
  (GeometricTopology Layer 1) giving NDR data, which Tau Ceti's `TauCeti.nonempty_ndrPair_iff`
  turns into the homotopy extension property. The finite-stage factorization is Tau Ceti's: the
  stages are T1 and the bonding maps closed embeddings, so every `X_r → X_∞` is a closed embedding
  (`TauCeti.TopCat.isClosedEmbedding_ι_of_isColimit`), every compact subset of `X_∞` lies in the
  image of a finite stage (`TauCeti.TopCat.exists_subset_range_ι_of_isCompact`), and every
  continuous map into `X_∞` from a compact space factors continuously through a finite stage
  (`TauCeti.TopCat.exists_lift_of_compactSpace`). Prove that homotopies between such maps factor
  in the same way, so `π_i(X_∞, x) = colim_r π_i(X_r, x)` for every `i ≥ 0` and every
  `x ∈ X₀`, and, by the exponential law, that compact families of paths factor: a continuous map
  from a compact Hausdorff space into `Map_k(I, X_∞)` factors through some `Map_k(I, X_r)`. Prove
  that `X_∞` is Hausdorff, and, since `− ×_k −` preserves colimits in each variable, that
  `X_∞ ×_k Y_∞` is the colimit of the `X_r ×_k Y_r` for a second such sequence.
- **Pointed objects.** A pointed compactly generated space is a compactly generated space with a
  base point, and based maps preserve base points. Define the wedge `X ∨ Y ⊆ X ×_k Y`, the smash
  product `X ∧ Y = (X ×_k Y)/(X ∨ Y)`, and the based mapping space `Map_*(Y, Z)`, the based maps
  with `k` of the subspace topology from `Map_k(Y, Z)`, based at the constant map. Prove the
  pointed exponential law: based maps `X ∧ Y → Z` correspond to based maps `X → Map_*(Y, Z)`,
  naturally in all three variables, with the homeomorphism
  `Map_*(X ∧ Y, Z) ≅ Map_*(X, Map_*(Y, Z))`. Prove that `∧` is associative, unital with unit
  `S⁰` and symmetric up to natural based homeomorphisms satisfying the symmetric monoidal
  coherence axioms, so that pointed compactly generated spaces form a closed symmetric monoidal
  category; associativity uses that `X ∧ −` preserves quotients, a consequence of the pointed
  exponential law (Strickland, §5, Propositions 5.1 and 5.7 and Corollary 5.8, stated there for
  weak Hausdorff spaces; the proofs use only the exponential law and Proposition 2.20, which hold
  for every compactly generated space).
- **Cylinders, cones, suspensions and loops.** Write `I = [0, 1]`, `I₊` for `I` with a disjoint
  base point, and `S¹ = I/∂I` based at the class of `∂I`. A based homotopy is a based map
  `X ∧ I₊ → Y`. The reduced cone is `CX = X ∧ I` with `I` based at `1`, the reduced suspension
  is `ΣX = X ∧ S¹`, with the circle coordinate last, and the based loop space is
  `ΩY = Map_*(S¹, Y)`. The pointed exponential law gives the suspension–loop adjunction: based
  maps `ΣX → Y` correspond to based maps `X → ΩY`, naturally in `X` and `Y`, the unit
  `X → ΩΣX` sending `x` to the loop `t ↦ [x, t]`. Applied to `X ∧ I₊` it respects based
  homotopies, so it induces a natural bijection `[ΣX, Y]_* ≅ [X, ΩY]_*`, an isomorphism of
  groups for the suspension-coordinate and loop-concatenation products.
- **Comparison with the raw quotients.** For compact Hausdorff pointed `X` and `Y` the products
  `X × Y` and `X × I` are compact Hausdorff, so the convenient `X ∧ Y`, `CX` and `ΣX` are the raw
  quotients of AlgebraicTopology Stage 4.4, through the identity on points. For a pointed CW
  complex `X` the convenient `ΣX` is the raw interval-last quotient of `X × I`: the product is
  compactly generated because `I` is locally compact Hausdorff, `− ×_k S¹` preserves quotients,
  and quotients of compactly generated spaces are compactly generated. For compact metrizable `Y`
  and metrizable `Z`, `Map_*(Y, Z)` is the raw based compact-open mapping space; in particular,
  for metrizable `Z`, `ΩZ` is the base roadmap's fixed-interval loop space `Ω^{[0,1]}Z`.

*Needs:* Mathlib `CompactlyGenerated`, `TopologicalSpace.compactlyGenerated`,
`UCompactlyGeneratedSpace`, `GeneratedByTopCat.adj`, `Topology.IsGeneratedBy`,
`Topology.ContinuousMapGeneratedBy.curryEquiv`, `ContinuousMap.compactOpen`,
`ContinuousMap.curry`, `Topology.IsQuotientMap.continuous_lift_prod_left`; AlgebraicTopology
Stage 4.4 (the raw smash and suspension quotients); GeometricTopology Layer 1 (tubular
neighbourhoods); Tau Ceti `TauCeti.nonempty_ndrPair_iff`,
`TauCeti.TopCat.uCompactlyGeneratedSpace_of_isColimit`,
`TauCeti.TopCat.isClosedEmbedding_ι_of_isColimit`,
`TauCeti.TopCat.exists_subset_range_ι_of_isCompact` and
`TauCeti.TopCat.exists_lift_of_compactSpace` (the finite-stage factorization). Sources:
N. P. Strickland, *The category of CGWH spaces*,
Propositions 2.6, 2.11, 2.12 and 2.20 and §5; C. Rezk, *Compactly generated spaces*, Propositions
7.3, 8.6, 8.8 and 9.2.

**Checks.**
- Let `X = ℝ/ℤ₊` be the quotient of `ℝ` collapsing the positive integers to a point, compactly
  generated as a quotient of a metric space, and `Y = ℚ`, metrizable. The product of the quotient
  map with the identity of `ℚ` is not a quotient map onto `X × ℚ` (Munkres, *Topology*, §22,
  Example 7), while `X ×_k ℚ` is the quotient of the metrizable `ℝ × ℚ` because `− ×_k ℚ`
  preserves quotients. So `X × ℚ` is not compactly generated: the product criterion needs its
  locally compact factor, and `ℚ` is not locally compact.
- Sequential colimits: in `S^∞ = colim_r S^r` along the equatorial embeddings, the points
  `q_r = (e₀ + e_r/r)/|e₀ + e_r/r|`, `r ≥ 1`, form a set meeting every `S^s` in the finitely many
  points `q₁, …, q_s`, so it is closed and discrete, and the sequence `q_r` does not converge,
  although it converges to `e₀` in the norm topology of the same union. A model of a stable group
  by a normed union would let compact families escape every finite stage.
- For metrizable `X` the counit `kX → X` is the identity homeomorphism, since metrizable spaces
  are sequential; this is the lane in which 1.1 claims homeomorphisms.

### 1.1 Convenient carriers

The convenient internal hom `Map_k` of 1.0 is the compact-open topology followed by compact
generation `k`. Construct the comparison map from the convenient carrier to
the base roadmap's raw carrier, using the counit `kZ → Z` and the compact-Hausdorff test and
currying maps, and prove that it induces isomorphisms on based homotopy groups and on singular
and cubical chains, and that it is compatible with endpoints, cap and reference maps, constant
sections and path composition. For compact metrizable `Y` and metrizable `Z` the raw `C(Y, Z)` is
metrizable, hence compactly generated (Mathlib's instance for sequential spaces), so the counit
is a homeomorphism and the convenient `Map_k(Y, Z)` and based `Map_*(Y, Z)` are the raw
compact-open spaces; in particular, for metrizable `Z`, 1.0's based loop space
`ΩZ = Map_*(S¹, Z)` is the base roadmap's fixed-interval loop space `Ω^{[0,1]}Z`. Convenient
multiplication uses `k`-products: an ordinary product of `k`-spaces is used as a `k`-product
only under 1.0's product criterion `compactlyGeneratedSpace_prod` for a locally compact
Hausdorff factor, and that hypothesis is kept explicit in every parameter-family transport.
These weak comparisons do not produce Hurewicz lifts or fibre homotopy equivalences; those come
from GeneralizedCohomology G2.10's raw lifting maps and the explicit Moore replacement maps and
homotopies of DGFloer Layer 2. *Needs:* 1.0, DGFloer Layer 2 items 1–3, GeneralizedCohomology
G2.10, Mathlib `ContinuousMap.compactOpen`.

**Checks.**
- For a closed manifold `Q` the raw carrier `Map(S², Q)` is metrizable, hence compactly
  generated, and the counit `k Map(S², Q) → Map(S², Q)` is a homeomorphism; a comparison that
  claimed only a weak equivalence here would be weaker than the base roadmap's metrizable lane.
- An ordinary product of two compactly generated spaces need not be compactly generated
  (Dowker's pair of CW complexes whose product topology is not the CW topology), so a
  "comparison" that identified the `k`-product with the ordinary product without the local
  compactness hypothesis would be false.
- Path composition on the convenient Moore-loop carrier and on the raw one agree under the
  comparison on the nose, not only up to homotopy: for two loops of lengths `a` and `b` the
  composite has length `a + b` on both sides.

### 1.2 The based sphere, its suspension model and the James ring

Consume AlgebraicTopology Stage 4.4's reduced-suspension sphere homeomorphism and compact
reduced-suspension carrier comparison on the based sphere, with interval-last coordinate order
and its reference generator. Construct this sphere's based comparison to 1.0's categorical
reduced suspension `ΣS^(n−1)`: the raw interval-product quotient is compact Hausdorff and hence
already compactly generated; apply 1.0's colimit-creating inclusion to its pointed quotient and
pushout cocone, then use the quotient universal properties and the fully faithful inclusion to
construct the isomorphism with the `k`-ified raw quotient, and prove its quotient-map and
basepoint diagrams. Compose it with Stage 4.4's raw-to-`k`-ification counit comparison, read
through 1.0's identification of compact-generation coreflections (on this compact Hausdorff
quotient both counits are the identity), and verify the interval-last and reference-generator
diagrams.

For the ring, let `W = S^(n−1)`, `n ≥ 2`, with the base pole as its only 0-cell and one
`(n−1)`-cell; it is a connected Hausdorff CW complex whose base point is a 0-cell.
GeneralAlgebraicKTheoryPartII §4.30b's James map `j : J(W) → Ω^MΣW` into the Moore loops of the
raw reduced suspension is then a continuous monoid map and a homotopy equivalence, and its
homology computation over `ℤ`, which applies because `H̃_*(W; ℤ)` is `ℤ` in degree `n − 1` and
hence free, identifies `H_*(Ω^MΣW; ℤ)` with the tensor algebra on one generator, the polynomial
ring `ℤ[x]` with `|x| = n − 1`, as rings under the Pontryagin product of Moore concatenation (the
Bott–Samelson theorem). The raw reduced suspension `ΣW` is the compact quotient of Stage 4.4, so
`reducedSuspensionSphereHomeomorph` identifies it with `Sⁿ`; construct the induced isomorphism of
topological monoids from the Moore loops on `ΣW` to the base roadmap's stopped Moore-loop carrier
on `Sⁿ`, both being DGFloer Layer 2's Moore loops, and transport the ring along it: the
Pontryagin ring `H_*(ΩSⁿ)`, `n ≥ 2`, of that carrier, under the cubical cross product and Moore
concatenation, is `ℤ[x]` on one generator `x` of degree `n − 1` (Proposition 6.18; Hatcher §4.J),
with `x` the reference generator of the third Check. Through the base roadmap's standing Moore
comparison, a homotopy equivalence of H-spaces, the same ring is that of the fixed-interval loop
space `Ω^{[0,1]}Sⁿ`, which is 1.0's convenient `ΩSⁿ` by 1.0's comparison with the raw quotients,
and under which the restriction of `j` to `J₁W ≅ W` is the unit of 1.0's suspension–loop
adjunction up to homotopy. 4.2 consumes this ring. *Needs:* AlgebraicTopology Stage 4.4,
GeneralAlgebraicKTheoryPartII §4.30b, DGFloer Layer 0 and Layer 2 item 1, 1.0, 1.1.

**Checks.**
- `n = 2`: `H_k(ΩS²) = ℤ` for every `k ≥ 0`, and `x² ≠ 0` in `H₂(ΩS²)` although `|x| = 1`: the
  ring is not graded commutative (graded commutativity would force `2x² = 0` in a torsion-free
  group, so `x² = 0`). A model that made `H_*(ΩSⁿ)` an exterior algebra for even `n` would be
  wrong.
- `n = 3`: `H_*(ΩS³) = ℤ` in degrees `0, 2, 4, …` and `0` in odd degrees; the generator `x` in
  degree `2` and its powers `x^k` in degree `2k`.
- The reference generator: the class of the identity of `Sⁿ` goes to `x` under the adjunction
  `π_n(Sⁿ) ≅ π_(n−1)(ΩSⁿ)` followed by Hurewicz; the opposite orientation convention of the
  suspension coordinate sends it to `−x`, which the interval-last convention excludes.
- `X = S⁰` in the suspension–loop adjunction: `ΣS⁰ = S¹`, and based maps `S¹ → Y` are the points
  of `ΩY`; reversing the circle coordinate composes the adjunction with loop inversion, so the
  unit `x ↦ (t ↦ [x, t])` of 1.0's adjunction fixes the orientation of the suspension
  coordinate used here.

### 1.3 Homogeneous examples on designated carriers

Consume SmoothBundlesConnections B1.4 for proper free-action smooth quotients, principal
projections and tangent quotients, and LieGroups Layer 2 for the real and complex closed matrix
subgroups. Consume ComplexKahlerGeometry K7.1 for its complex projectivization atlas and real
restriction, GeneralizedCohomology G4.0b for the designated `Sp`, quaternionic frame,
Grassmannian and `HP` carriers and smooth Hopf comparisons, and RiemannianGeometry R1 for the
normalized quotient metrics. Keep the supplied topologies, smooth structures and explicit
quotient comparisons; what is built here is the identification between them.

- **Real frames.** On Tau Ceti's Stiefel manifold `TauCeti.stiefel (EuclideanSpace ℝ (Fin n)) 2`,
  for `n ≥ 3` construct the ordered orthonormal-two-frame identification
  `V_(n,2)(ℝ) ≅ SO(n)/SO(n−2)`, with stabilizer `diag(I₂, SO(n−2))`, orbit and inverse maps,
  tangent quotient and sphere-bundle projection `V_(n,2) → S^(n−1)` onto the first vector. For
  `n = 2` the carrier is `O(2) = SO(2) ⊔ r·SO(2)`, `r = diag(1, −1)`, with the determinant
  distinguishing the two `SO(2)` orbits; for `n < 2` it is empty. Compare with `O(n)/O(n−2)` for
  every `n ≥ 2`, so both descriptions use the same frame carrier.
- **Complex frames.** On the native complex ordered orthonormal-two-frame carrier in `ℂⁿ`, for
  `n ≥ 2` construct the `U(n)/U(n−2)` comparison with stabilizer `diag(I₂, U(n−2))`, orbit and
  inverse maps, tangent quotient, principal local sections and the first-vector sphere-bundle
  projection. For `n = 2` this is `U(2)`; for `n < 2` the frame carrier is empty. This is the
  complex analogue on its own carrier, not an identification with the real `SO` quotient; the
  quaternionic frame comparisons live on GeneralizedCohomology's designated carriers.
- **Projective quotients.** On the designated `CPᵈ` carrier pin the supplied quotient comparison
  `U(d+1)/(U(d) × U(1)) → CPᵈ` to `[g] ↦ [g e_d]`, in the suppliers' convention
  (RiemannianGeometry R1, GeneralizedCohomology G4.0b): base point the last coordinate line
  `[e_d]`, stabilizer the ordered blocks `diag(U(d), U(1))`; include subgroup blocks, basepoint,
  principal local sections and agreement with K7.1's complex orientation. On
  GeneralizedCohomology's designated `HPᵈ` carrier pin its `Sp(d+1)/(Sp(d) × Sp(1))` comparison,
  with the same last-coordinate-line convention, to `[g] ↦ [g e_d]_ℍ`. Its native
  projectivization uses right lines through `ℍᵐᵒᵖ`, with `v ∼ vλ`; compare the supplied charts
  on `v_i ≠ 0` with the right ratios `v_j v_i⁻¹` and the representative with `i`-coordinate `1`,
  and verify right-scaling invariance.
- **Tau Ceti's projective models.** Construct the diffeomorphisms from the designated carriers to
  Tau Ceti's sphere-quotient models, on which 4.5 states its projective theorems:
  `[v] ↦ [v/|v|]` from K7.1's `Projectivization ℂ (Fin (d+1) → ℂ)` to
  `TauCeti.ComplexProjectiveSpace d`, the quotient of the unit sphere of `ℂᵈ⁺¹` by the unit complex
  numbers, holomorphic in the homogeneous-coordinate charts of both, and from GeneralizedCohomology
  G4.0b's `HPᵈ` to `TauCeti.QuaternionicProjectiveSpace d`, the quotient of the unit sphere of
  `ℍᵈ⁺¹` by right multiplication by unit quaternions. A diffeomorphism `ψ : M → N` lifts to a
  symplectomorphism `T*N → T*M` carrying the codisc bundle of a metric `g` on `N` to that of `ψ*g`,
  so the finiteness of `c°_HZ` passes between the two models for all metrics at once
  (`TauCeti.SmoothTwoForm.IsNondegenerate.contractibleHZCapacity_image`).
- **Hopf metrics.** Transport the supplied unit-round Hopf metrics. Prove Hermitian
  compatibility of the `CP` metric with its designated complex structure, and the orientation,
  metric and quotient-chart comparisons. For `d ≥ 1` the primitive closed geodesics are the
  great circles of the projective lines, of period `π`; `d = 0` is a point. For `d ≥ 2` the
  sectional curvature takes every value in `[1, 4]` and both bounds are attained; `CP¹` and
  `HP¹` have constant curvature `4`, radius `1/2`. Prove the projective lines totally geodesic
  with this metric scale. Layer 2 constructs its energy, index, perfectness and generator
  applications with this scale, or transports a different one explicitly.
- **Quaternionic vector fields.** Construct the three pointwise orthonormal vector fields
  `Iz, Jz, Kz` on `S^(4k−1) ⊂ ℍ^k`.
- **The Fubini–Study form.** After K7.2 and its SmoothBundlesConnections B6.2–B6.3 inputs,
  construct the `CP` form comparison. For the Hermitian metric `g` above and the complex
  structure `J` put `ω_g(X, Y) = g(JX, Y)`. Prove closedness and `ω_g = π·ω_FS` for the
  unit-round Hopf normalization, with `∫_(CP¹) ω_FS = 1`. For `d ≥ 1` compute the scale on the
  oriented radius-`1/2` complex line, whose area is `π`; for `d = 0` both forms vanish. Prove
  compatibility with the same quotient and charts, and under a positive metric rescaling prove
  the corresponding positive form scale. The metric, totally geodesic, index, perfectness and
  generator targets do not depend on this comparison.

*Needs:* SmoothBundlesConnections B1.4 and B6.2–B6.3, LieGroups Layer 2, ComplexKahlerGeometry
K7.1–K7.2, GeneralizedCohomology G4.0b, RiemannianGeometry R1, Tau Ceti `TauCeti.stiefel`,
`TauCeti.ComplexProjectiveSpace`, `TauCeti.QuaternionicProjectiveSpace`,
`TauCeti.SmoothTwoForm.IsNondegenerate.contractibleHZCapacity_image`, Mathlib
`Matrix.orthogonalGroup`, `Matrix.specialOrthogonalGroup`, `Quaternion`.

**Checks.**
- Dimensions: `dim V_(n,2)(ℝ) = (n−1) + (n−2) = 2n − 3`, equal to `dim SO(n) − dim SO(n−2)`;
  `dim U(n)/U(n−2) = 4n − 4`; `dim CPᵈ = 2d` and `dim HPᵈ = 4d` from the quotient dimensions. A
  stabilizer `SO(n−1)` instead of `SO(n−2)` would give the sphere `S^(n−1)`, not the frame
  carrier.
- `n = 3`: `V_(3,2)(ℝ) ≅ SO(3)`, the unit tangent bundle of `S²`, connected; `n = 2`:
  `V_(2,2)(ℝ) = O(2)` has two components, so the connected quotient `SO(2)/SO(0) = SO(2)`
  describes only one of them, which is why the `n ≥ 3` identification is not extended to `n = 2`.
- Projective base point and blocks: for `d ≥ 1` the stabilizer in `U(d+1)` of the line `[e_d]`
  is `diag(U(d), U(1))` and that of `[e₀]` is `diag(U(1), U(d))`; conjugation by the coordinate
  permutation `P` exchanging `e₀` and `e_d` carries one to the other, and `[g] ↦ [g e₀]` on
  `U(d+1)/(U(1) × U(d))` corresponds to `[gP] ↦ [gP e_d]` on `U(d+1)/(U(d) × U(1))`. For `d = 1`
  the two block groups coincide (the diagonal torus of `U(2)`) and only the base point differs;
  for `d ≥ 2` the map `[g] ↦ [g e₀]` is not well defined on `U(d+1)/(U(d) × U(1))`, because
  `diag(A, 1)` with `A ∈ U(d)`, `A e₀ = e₁`, moves the line `[e₀]`.
- Curvature and periods: on `CP¹` of radius `1/2` the great circles have length `π`, the
  sectional curvature is `4`, and the area is `π`, so `ω_g = π·ω_FS` with `∫ ω_FS = 1`; the
  radius-`1` normalization, in which `CP¹` is the unit sphere and the sectional curvature lies
  in `[1/4, 1]` (diameter `π`), would give period `2π` and area `4π`, and Layer 2's cell
  degrees would be unchanged but every energy value would be multiplied by `4`.
- The comparison with Tau Ceti's models is well defined: replacing `v` by `vλ`, `λ ≠ 0`, changes
  `v/|v|` by the unit `λ/|λ|` on the right, which the quotient absorbs because Tau Ceti's
  quaternionic model, like the designated carrier, divides by right multiplication. Into a
  quotient by left multiplication the map would not be defined: for `v = (1, j)` and `λ = i`,
  `vλ = (i, −k)`, while the only left multiple `μv` with first entry `i` is `(i, k)`. For `d = 1`
  both complex models are `S²` and both quaternionic models are `S⁴`.
- On `S³ ⊂ ℍ` the three fields `Iz, Jz, Kz` are orthonormal and tangent at every `z`:
  `⟨z, Iz⟩ = 0` because `I` is skew, and `⟨Iz, Jz⟩ = ⟨z, I⁻¹Jz⟩ = ⟨z, −Kz⟩ = 0`. On `S^(4k+1)`
  no two pointwise independent tangent fields exist, so the construction needs `n ≡ 3 (mod 4)`.

### 1.4 Degrees of explicit maps

Construct and orient the Stiefel-domain map of the proof of Proposition 6.17,

    τ : T¹S^(n−1) × S¹ → S^(n−1) × S^(n−1),   τ((u, v), θ) = (u, cos θ·u + sin θ·v),

with `S^(n−1)` the unit sphere of `p^⊥` for a pole `p ∈ Sⁿ`, using 1.3's frame and sphere-bundle
comparison, and compute its degree by counting regular preimages with the product orientations.
It is a map of sphere bundles over the identity of `S^(n−1)`; over `u` it is the fibre map
`τ_u : T¹_uS^(n−1) × S¹ → S^(n−1)`, `(v, θ) ↦ cos θ·u + sin θ·v`, which is the composite
`ev_u ∘ f` of the rotation family below for the sphere `S^(n−1)` with pole `u`. Every
`w ∉ {±u}` has the two regular preimages `(v, θ)` and `(−v, 2π − θ)`, exchanged by an
involution of `S^(n−2) × S¹` of degree `(−1)ⁿ`, so `deg τ_u = 1 + (−1)ⁿ` and
`deg τ = ±(1 + (−1)ⁿ)`, the sign depending only on the order in which the base and fibre
orientations of `T¹S^(n−1)` are taken: `±2` for even `n` and `0` for odd `n` (the source paper,
proof of Proposition 6.17 and its footnote 16). For `n = 2`, `T¹S¹` is two circles, one for each
orientation of the frame `(u, v)`, and the restriction of `τ` to one of them has degree `±1`
(Remark 6.19). Separately, for a fixed pole `p ∈ Sⁿ`, construct the rotation family of the
second proof of Proposition 6.34 as the map

    f : T¹_pSⁿ × S¹ → SO(n+1),   f(u, θ) = R(p, u; θ),

the rotation by `θ` in the plane oriented by `(p, u)` fixing `⟨p, u⟩^⊥` (the Conventions give
the matrix); the lift into `SO(n+1)` is the object, because its homology class
`A = f_*([S^(n−1)] × [S¹]) ∈ H_n(SO(n+1))` is what 4.3 pushes into `H_n(Diff(Sⁿ))`. Prove that
`ev_p ∘ f(u, θ) = cos θ·p + sin θ·u`, and compute the degree of this composite
`T¹_pSⁿ × S¹ → Sⁿ`: every `q ∉ {±p}` has exactly the two regular preimages `(u, θ)` and
`(−u, 2π − θ)`, exchanged by an involution of `S^(n−1) × S¹` of degree `(−1)^(n−1)`, so the
degree is `1 + (−1)^(n−1)`, which is `2` for odd `n` and `0` for even `n` (the source paper,
second proof of Proposition 6.34). The degree is a mapping degree in the sense of DGFloer's
homological degree interface. The `Diff`-family and covered-by-diffeomorphisms comparisons are
made in 4.3. *Needs:* 1.3, DGFloer Layer 1 item 1 and Layer 0, with the homological degree
interface the base roadmap takes from AlgebraicTopology Stage 6 item 5, Mathlib
`Matrix.specialOrthogonalGroup`.

**Checks.**
- `n = 1`, `p = e₀`: `T¹_pS¹ = {±e₁}`, and `f(±e₁, θ)` is the rotation of `ℝ²` by `±θ`, so the
  two circles `θ ↦ cos θ·e₀ ± sin θ·e₁` wind in opposite directions. With the boundary
  orientation of `S⁰` (`e₁` with sign `+1`, `−e₁` with sign `−1`) the degree of `ev_p ∘ f` is
  `(+1)(+1) + (−1)(−1) = 2 = 1 + (−1)⁰`; with both points counted positively it would be `0`,
  so the orientation convention of `T¹_pSⁿ` is part of the statement.
- `n = 2`: the degree is `0`, and consistently `A ∈ H₂(SO(3); ℤ) = 0` (`SO(3) ≅ ℝP³`), so
  `(ev_p)_*A = 0 = 0·[S²]`: the second proof gives nothing for even `n`, as the source says.
- `n = 3`: the degree is `2`, `H₃(SO(4); ℤ) ≅ ℤ²` and `(ev_p)_*A = 2[S³]`; the first proof's
  class with `ℓ = 1` also exists here because `S³ → SO(4) → S³` (left multiplication by unit
  quaternions) splits the evaluation, so `S³` is `1`-covered and `2`-covered at once.
- The Stiefel-domain map for `n = 2` and `n = 3`. For `n = 2`, `T¹_uS¹ = {±Iu}` with signs `±1`;
  `τ_u(Iu, ·)` winds once positively and `τ_u(−Iu, ·)` once negatively, so
  `deg τ_u = (+1)(+1) + (−1)(−1) = 2`, and on the circle of frames `(u, Iu)` alone `τ` is the
  shear `(u, θ) ↦ (u, R_θu)` of degree `1`. For `n = 3`, `τ_u : S¹ × S¹ → S²`: the antipodal map
  of `S¹` preserves orientation and `θ ↦ 2π − θ` reverses it, so the two preimages carry opposite
  signs and `deg τ_u = 0`; a count that ignored the signs would give `2` for odd `n` as well, and
  Proposition 6.17 would wrongly extend to odd spheres.
- The matrix: `R(p, u; θ)` is orthogonal with determinant `1`, `R(p, u; θ)p = cos θ·p + sin θ·u`,
  `R(p, u; 0) = I` and `R(p, u; θ + 2π) = R(p, u; θ)`, so `f` descends to `S¹`; with the sign
  of the `sin θ` term reversed the family would rotate the wrong way and the `n = 1` degree
  would be `−2` with the same orientation of `S⁰`.

### 1.5 Comparison of collapses

Let `N` be a closed submanifold of `Sⁿ⁺ᵏ`, `k ≥ 1`, missing a point, with a normal framing
`φ : ν ≅ N × ℝᵏ`. Compare DGFloer Layer 1 item 5's collapse `Sⁿ⁺ᵏ → Sᵏ`, built from a tube in
the sphere and the framing, with the Euclidean framed collapse read through the stereographic
chart at the missing point: GeneralizedCohomology G5 item 2's unframed collapse
`(ℝⁿ⁺ᵏ)^+ → Th(ν)`, which collapses the complement of a tube to the base point, followed by the
Thom map `Th(ν) → (ℝᵏ)^+ = Sᵏ` of the framing, `v ↦ pr₂ φ(v)`; this composite is TangentialBordism
B5.1's coefficient collapse for the trivial rank-`k` normal structure over a point. For a tube
contained in the chart the two maps agree on the nose after the chart identification; for
arbitrary tubes they are based homotopic by the independence theorems of DGFloer Layer 1 item 5
and GeneralizedCohomology G5 item 2. State the comparison for the chosen framings, and prove its
compatibility with the effect on fundamental classes and, for `n = 0`, with TangentialBordism
B5.5's signed count of framed points. *Needs:* DGFloer Layer 1 item 5, GeneralizedCohomology G5
item 2, TangentialBordism B5.1 and B5.5, GeometricTopology Layer 1.

**Checks.**
- `N = ∅`: `Th(ν)` is a point and both collapses are the constant map to the base point of
  `Sᵏ`, of degree `0`; no nonempty tube is needed.
- `N` a framed point, `n = 0`: both collapses have degree `±1`, with the sign fixed by the
  framing's orientation; reversing one vector of the framing reverses the sign on both sides,
  while changing the tube or the radial parametrization with the framing fixed changes nothing.
- Two tubes of different radii inside the chart give collapses that are homotopic but not
  equal; the on-the-nose agreement is claimed only for the same tube read through the chart.
- The standard circle in `S³` (`n = 1`, `k = 2`) with a normal framing: `Th(ν) ≅ Σ²(S¹₊) ≃ S³ ∨ S²`
  is not a sphere, so the comparison is made after the Thom map of the framing, and both
  collapses represent the same class in `π₃(S²)`.

### Examples

- `V_(3,2)(ℝ) ≅ SO(3)`, `V_(2,2)(ℝ) = O(2)`, `U(2)/U(0) = U(2)`; `CP¹` and `HP¹` of radius
  `1/2`.
- The rotation family for `n = 1` and `n = 2` as in the Checks of 1.4.
- `H_*(ΩS²) = ℤ[x]`, `|x| = 1`, with `x² ≠ 0`.

### Dependencies

DGFloer Layers 0–2; GeneralAlgebraicKTheoryPartII §4.30b; AlgebraicTopology Stages 2, 4.4 and
6, with Stage 6 item 5; GeneralizedCohomology G2.10, G4.0b and G5 item 2;
TangentialBordism B5.1 and B5.5; ComplexKahlerGeometry K7.1–K7.2; LieGroups Layer 2;
SmoothBundlesConnections B1.4, B6.2–B6.3; RiemannianGeometry R1; GeometricTopology Layer 1; Tau
Ceti `TauCeti.nonempty_ndrPair_iff` and the finite-stage factorization of 1.0; Mathlib
`CompactlyGenerated`, `GeneratedByTopCat.adj`,
`Topology.ContinuousMapGeneratedBy.curryEquiv`, `ContinuousMap.compactOpen`. Sources: the source
paper §§6.3–6.4; Strickland, *The category of CGWH spaces*, §§2 and 5; Rezk, *Compactly generated
spaces*, §§7–9; Milnor–Stasheff,
*Characteristic Classes*, Chapter 5; Steenrod, *The Topology of Fibre Bundles*, Part I, §7;
Hatcher, *Algebraic Topology*, §4.J and Appendix; Pontryagin, *Smooth manifolds and their
applications in homotopy theory*, Chapter II.

## Layer 2: based-loop Morse–Bott energy on `CPᵈ` and `HPᵈ`

This layer computes the integral homology of the based loop spaces of the complex and
quaternionic projective spaces with explicit, calibrated generators, by Morse–Bott theory of the
energy functional on the finite-dimensional approximations of DGFloer Layer 5 item 6, on the
carriers and metrics of 1.3. 4.5 consumes its generators and the geometric sphere family of 2.6.

### 2.1 Critical manifolds, indices and attachments

Use the RiemannianGeometry R1 metrics, R2 Jacobi ODE and endpoint data and R3 index form and
finite-node comparison, and MorseTheory M5's compact-band normal attachment theorem. On the
finite approximations to `Ω_p B`, `B = CPᵈ` or `HPᵈ`, construct the critical manifolds of the
energy: the constant loop, and for each `k ≥ 1` the manifold `C_k ≅ T¹_pB` of great circles of
a projective line through `p` traversed `k` times. Calculate their negative bundles, indices and
nullities on that metric: for `CPᵈ` the index of `C_k` is `a_k = 2d(k−1) + 1`, and for `HPᵈ` it
is `a_k = 2(k−1)(2d+1) + 3` (Ziller, *The free loop space of globally symmetric spaces*,
Theorem 3; the source's proof of Proposition 6.39). The computation rests on local symmetry:
`CPᵈ` and `HPᵈ` with these metrics satisfy `∇R = 0` (RiemannianGeometry R1), so along a geodesic
`γ` the operator `R(·, γ′)γ′` is parallel, its eigenvalues are constant, and the conjugate points
along `γ` are the zeros of the corresponding sine functions, counted with the eigenvalue
multiplicities; and on these compact symmetric spaces the energy on based loops is Morse–Bott,
the nullity of each critical manifold being its dimension. Identify their Thom orientation
systems and attachment maps. *Needs:* 1.3, RiemannianGeometry R1–R3, MorseTheory M5, DGFloer
Layer 5 item 6.

**Checks.**
- The index by conjugate points: along a great circle of a projective line (curvature `4`,
  period `π`) traversed `k` times, the Jacobi fields tangent to the line vanish at the times
  `mπ/2`, `0 < mπ/2 < kπ`, each with multiplicity `1` for `CPᵈ` and `3` for `HPᵈ`, and the
  fields in the curvature-`1` directions (`2d − 2`, respectively `4d − 4`, of them) vanish at
  the times `mπ`, `0 < mπ < kπ`. So the index is `(2k−1) + (k−1)(2d−2) = 2d(k−1) + 1` for `CPᵈ`
  and `3(2k−1) + (k−1)(4d−4) = 2(k−1)(2d+1) + 3` for `HPᵈ`; the first nontrivial manifold has
  index `1`, respectively `3`.
- `d = 1`: `CP¹ = S²` of radius `1/2` gives `a_k = 2k − 1` and critical manifolds `S¹`; `HP¹ = S⁴`
  gives `a_k = 6k − 3` and critical manifolds `S³`, matching RiemannianGeometry R3's round-sphere
  calculation after the radius-`1/2` time normalization.
- The nullity of `C_k` equals `dim C_k = 2d − 1`, respectively `4d − 1`: the energy is
  Morse–Bott, and a metric that was not symmetric (a generic perturbation) would break the
  critical manifolds into isolated geodesics.

### 2.2 Integral perfectness and calibrated generators of `ΩCPᵈ`

For `d ≥ 1` prove the integral perfectness of the energy and calibrate the generator of
`H_(2d)(ΩCPᵈ) = ℤ`. The cells have degrees `a_k = 2d(k−1) + 1` and `b_k = a_k + (2d − 1) = 2dk`,
`k ≥ 1`, with the constant cell in degree `0`. Since `a_(k+1) − b_k = 1` for every `d ≥ 1`, the
vanishing of the cellular boundary is proved by the following homology and attachment
comparison, not by a lacunarity argument.

Construct `j : S¹ → ΩCPᵈ` adjoint to the normalized projective-line generator, and the based
Hopf product `j ⋆ Ωq : S¹ × ΩS^(2d+1) → ΩCPᵈ`. The Hopf fibration long exact sequence proves its
`π₁` and higher homotopy isomorphisms. Use DGFloer Layer 1 item 2's weak-equivalence homology
comparison, integral Künneth and the supplied odd-sphere based-loop calculation to obtain `ℤ` in
degrees `2dk` and `2dk + 1` and zero elsewhere. For `CP¹` consume RiemannianGeometry R3's `ΩS²`
calculation at radius `1/2` with the explicit time and metric normalization. Construct the
oriented Morse–Bott Thom and CW model with one `ℤ` cell in the displayed degrees; prove
orientability of the negative bundles and identify these cells on the finite approximations.
Finite-type energy-filtration convergence and the final homology ranks force each integer
cellular boundary to vanish. Construct the generator representatives and completing cycles and
their energy and Thom-cell comparison. This proves perfectness and the generator assertions on
the chosen based carrier. *Needs:* 2.1, 1.3, DGFloer Layer 1 item 2 and Layer 2, RiemannianGeometry
R3, MorseTheory M5, AlgebraicTopology Stage 2 (Künneth).

**Checks.**
- `d = 1`: `a_k = 2k − 1`, `b_k = 2k`, so `H_*(ΩCP¹) = ℤ` in every degree, agreeing with
  `H_*(ΩS²)` of 1.2; the calibrated generator of `H₂(ΩCP¹)` is the Pontryagin square `x²` of the
  generator `x` of `H₁(ΩS²)`.
- `d = 2`: cells in degrees `0, 1, 4, 5, 8, 9, …` and `H_*(ΩCP²) = H_*(S¹ × ΩS⁵) = ℤ` in exactly
  those degrees; `a₂ − b₁ = 5 − 4 = 1`, so a boundary `ℤ → ℤ` between consecutive cells is not
  excluded by degrees alone, and a "lacunary" argument would prove nothing: the vanishing comes
  from the rank count.
- The Hopf product: `π₁(S¹ × ΩS⁵) = ℤ = π₁(ΩCP²) = π₂(CP²)` and `π_k(ΩS⁵) = π_(k+1)(S⁵) =
  π_(k+1)(CP²)` for `k ≥ 2` by the Hopf fibration `S¹ → S⁵ → CP²`; a product with `ΩS³` in place
  of `ΩS⁵` would have the wrong `π₂`.

### 2.3 The quaternionic case `ΩHPᵈ`

For `HPᵈ` the cell degrees are `a_k = 2(k−1)(2d+1) + 3` and `b_k = a_k + (4d − 1)`, with
within-level gap `4d − 1` and successive-level gap `a_(k+1) − b_k = 3`; prove the negative-bundle
and Thom model before using these gaps to infer vanishing boundaries, and calibrate the
generator of `H_(4d+2)(ΩHPᵈ) = ℤ`. The case `d = 0` is the constant point space. The free-loop
extension in DGFloer Layer 5 item 6 is a separate construction; the based Hopf calculation alone
does not give it. *Needs:* 2.1, 1.3, DGFloer Layer 1 item 2, MorseTheory M5.

**Checks.**
- `d = 1`: `HP¹ = S⁴`, `a_k = 6k − 3`, `b_k = 6k`, so `H_*(ΩS⁴) = ℤ` in the degrees `3k`, agreeing
  with 1.2's `ℤ[x]`, `|x| = 3`.
- `d = 2`: `a₁ = 3`, `b₁ = 10`, `a₂ = 13`, `b₂ = 20`: the successive gap is `3`, so no boundary
  between cells of consecutive levels can be nonzero for degree reasons once the model is built.
- `H_(4d+2)(ΩHPᵈ) = ℤ` is `b₁`; the source's class `β_*(σ_p)_*[Σ_p]` lives there (2.6).

### 2.4 Fibre representatives and the path-loop total-space comparison

For `B = CPᵈ` or `HPᵈ` construct a chain comparison from the oriented Morse–Bott energy and
Thom model `E_B` to `C_*(Ω_p B; ℤ)`, carrying the chosen completing cycles and calibrated
generators to designated singular and cubical representatives. Prove it by the finite-energy
attaching maps, the compact-band comparison and the filtered colimit; its energy-filtration
statement is made only on this fibre model. It computes `H_*(Ω_p B)`, not `H_*(P_p B)`, and the
perfectness and generator proof of 2.2–2.3 is independent of the following comparison.

Use the augmented semi-free `P_B` of DGFloer Layer 4 item 5 (the base's §4.1) and DGFloer
Layer 5 item 4's
fibration-chain theorem for `Ω_p B → P_p B → B`. Compare the total complex
`C_*(Ω_p B) ⊗_{C_*(Ω_p B)} P_B` with `C_*(P_p B)`, with the base-cell filtration. When the fibre
chains are replaced by `E_B`, construct the compatible homotopy-coherent loop action and its
DG-module rectification first, with integral split and free chain data and the DG supplier's
bar and module comparisons; justify the chosen chain contractions from the free integral fibre
homology and the calibrated chain comparison, keep the higher module coherence, and prove the
degreewise finiteness of the bar and perturbation formulas before base change. Construct the
coefficient maps, relative attaching comparisons and filtration-preserving homotopies that
compare the two total-space models. Their total-space spectral sequences agree from the proved
page onward and abut to `H_*(P_p B)`, which vanishes in positive degrees; this total-space
sequence is distinct from the energy-filtered fibre sequence of 2.2. Name the page comparison
and the edge and fibre-inclusion squares used on representatives. *Needs:* 2.1–2.3, DGFloer
Layer 4 item 5 (the base's §4.1) and Layer 5 item 4, DGFloer Layer 1 item 3.

**Checks.**
- `B = CP¹`: `P_p S²` is contractible, so the total-space sequence with `E² = H_*(S²) ⊗ H_*(ΩS²)`
  has `d²: E_(2,q) → E_(0,q+1)` an isomorphism for every `q`; a comparison that left the fibre
  generator `x` of degree `1` unkilled would contradict `H₁(P_p S²) = 0`.
- Without the loop action the derived-module equivalence `E_B ≃ C_*(Ω_p B)` does not determine
  the total-space model: the two `C_*(Ω_p B)`-module structures on `H_*(Ω_p B) = ℤ[x]` given by
  the Pontryagin product and by the trivial action have different bar complexes already for
  `B = S²`.
- `d = 0`: `Ω_p(pt)` is a point, `E_B = ℤ` in degree `0`, and both total-space models are `ℤ`.

### 2.5 Primary differentials and mixed-bidegree boundary maps

On the designated projective carriers, normalize the base cell, cup and Thom classes using
GeneralizedCohomology G4.0 and G4.3–4.5 and AlgebraicTopology Stage 6. Calculate the primary
`d₂` for `CPᵈ` and `d₄` for `HPᵈ` and construct the subsequent mixed-bidegree relative boundary
maps `d_(2d) : E_(2d,1) → E_(0,2d)` for `CPᵈ` and `d_(4d) : E_(4d,3) → E_(0,4d+2)` for `HPᵈ`.
Identify the surviving source and target representatives, their unit integer coefficient and
sign by the total-space and fibre comparison of 2.4 and the chosen orientations. For `d = 1`
these maps occur on the same page as the primary differential and are computed together. For
`d = 0` the point case is separate. Since `H_(2d+1)(CPᵈ) = 0` and `H_(4d+3)(HPᵈ) = 0`, these
maps are not transgressions from the base; they are the relative boundary maps constructed
here. *Needs:* 2.4, GeneralizedCohomology G4.0 and G4.3–4.5, AlgebraicTopology Stage 6, DGFloer
Layer 1 item 2.

**Checks.**
- Total degrees: `E_(2d,1)` has total degree `2d + 1` and `E_(0,2d)` total degree `2d`;
  `E_(4d,3)` has total degree `4d + 3` and `E_(0,4d+2)` total degree `4d + 2`; both maps lower
  total degree by one, as a differential must.
- `CP²`: the primary `d₂: E_(2,4) → E_(0,5)` kills the fibre class of degree `5`, and `d₄:
  E_(4,1) → E_(0,4)` kills the calibrated generator of degree `4`; a model that let `d₂` reach
  degree `4` from `E_(2,3)` would need a fibre class in degree `3`, which does not exist.
- `d = 1`: for `CP¹` both maps are `d₂` on `E_(2,q)`; the "mixed" map `d₂: E_(2,1) → E_(0,2)` is the
  one that kills `x²`.

### 2.6 The geometric sphere family of Propositions 6.38 and 6.39

For `B = CPᵈ` or `HPᵈ` and `u ∈ T¹_pB`, let `L_(p,u)` be the projective line through `p` tangent
to `u`, a totally geodesic round sphere (`S²` for `CPᵈ`, `S⁴` for `HPᵈ`), `E_(p,u)` its great
sphere through `p` orthogonal to `u` (a circle, respectively a `3`-sphere), and `γ_w` the great
circle of `L_(p,u)` leaving `p` in the direction `w`. The completing manifold of `C₁` is the
bundle `Z_p → T¹_pB` with fibre `E_(p,u)` over `u`, with the map `ζ_p : Z_p → Ω_pB` sending
`(u, q)` to the circle of `L_(p,u)` based at `p`, tangent to `u` and through `q` (the constant
loop for `q = p`); by the completing-cycle comparison of 2.2–2.3, `(ζ_p)_*[Z_p] = ±g` with `g`
the calibrated generator (the source paper, proof of Proposition 6.39). The geometric sphere
families are: for `CPᵈ`, `Σ_p = T¹_pCPᵈ` and `σ_p(u)` is the complex line through `p` tangent
to `u`, parametrized by the frame `(u, Iu)`; for `HPᵈ`, `Σ_p` is the fibre of the partial
Stiefel manifold of pairs `(u, v)` with `v` a unit vector tangent to `L_(p,u)` and orthogonal to
`u`, and `σ_p(u, v)` is the round 2-sphere of `L_(p,u)` tangent to `u` and `v`. Construct the map
of bundles `φ : Σ_p × S¹ → Z_p` over `T¹_pB`, `φ(u, θ) = (u, γ_(Iu)(θ))` for `CPᵈ` and
`φ(u, v, θ) = (u, γ_v(θ))` for `HPᵈ`, and the homotopy `β ∘ (σ_p × id) ≃ ζ_p ∘ φ` under the
sphere–loop adjunction. Compute the fibrewise degree of `φ` with 1.4's rotation family: for
`CPᵈ` the fibre map `S¹ → E_(p,u)` traverses a great circle once, the `n = 1` family at the
single point `Iu` of `T¹_pE_(p,u)`, and has degree `±1`; for `HPᵈ` the fibre map
`S² × S¹ → E_(p,u) ≅ S³` is the composite `ev_p ∘ f` of the `n = 3` family, with the two
preimages `(v, θ)` and `(−v, 2π − θ)` of the same sign, and has degree `±2`. Prove
`β_*(σ_p)_*[Σ_p] = ±g` in degree `2d` for `CPᵈ` and `β_*(σ_p)_*[Σ_p] = ±2g` in degree `4d + 2`
for `HPᵈ`, fixing the signs by the stated orientations. The source's proof of Proposition 6.38
states twice a generator for `CPᵈ` as well; its Remark 6.19 and Example 6.37, the case `d = 1`
to which it says the construction reduces on each complex line, give a generator, as does the
fibre count. *Needs:* 2.1–2.5, 1.3, 1.4, DGFloer Layer 2 (the adjunction `β`).

**Checks.**
- Degrees: `dim Σ_p = 2d − 1` for `CPᵈ`, so `(σ_p)_*[Σ_p] ∈ H_(2d−1)(Ω²CPᵈ)` and `β_*` lands in
  `H_(2d)(ΩCPᵈ) = ℤ·g`; for `HPᵈ`, `dim Σ_p = (4d − 1) + 2 = 4d + 1` and `β_*` lands in
  `H_(4d+2)(ΩHPᵈ) = ℤ·g`; `dim Z_p = 2d`, respectively `4d + 2`, the degrees of `g`.
- `CP¹ = S²`: `T¹_pS²` carries one frame `(u, Iu)` per direction, so the family is the sweep of
  Remark 6.19 restricted to one orientation component, and `β_*(σ_p)_*[Σ_p] = ±x²`, a generator,
  as in 4.4 (Remark 6.19, Example 6.37); the full `n = 2` Stiefel family of 4.2, with both
  components, gives `±2x²`. A value `±2x²` for `CP¹` would contradict 4.4's identification of
  the one-component class with `x²`.
- `HP¹ = S⁴`: `L_(p,u)` is all of `S⁴` and the fibre of `Σ_p` over `u` is the whole `S²` of unit
  vectors orthogonal to `u` in `T_pS⁴`, so the family is the full `n = 4` Stiefel family of 4.2,
  with class `±2g = ±2x²`, `x ∈ H₃(ΩS⁴)`. The two preimages have the same sign because the
  antipodal map of `S²` and `θ ↦ 2π − θ` both reverse orientation; for the `n = 3` Stiefel family
  of `S³`, fibre `S¹ × S¹ → S²`, the same two preimages have opposite signs and the degree is `0`.

### Examples

- `ΩCP¹ = ΩS²` and `ΩHP¹ = ΩS⁴` as in the Checks of 2.2–2.3.
- `CP²`: cells in degrees `0, 1, 4, 5, 8, 9, …`, all surviving: `H_*(ΩCP²) = ℤ` in exactly these
  degrees, with the degree-`1` class from `π₂(CP²) = ℤ`.

### Dependencies

1.3; DGFloer Layer 1 items 2–3, Layer 2, Layer 4 item 5 (the base's §4.1), Layer 5 items 4 and
6;
RiemannianGeometry R1–R3; MorseTheory M5; GeneralizedCohomology G4.0 and G4.3–4.5;
AlgebraicTopology Stages 2 and 6. Sources: BDHO, *Morse homology with differential graded
coefficients*, Chapters 5–13; the source paper §§4.3–4.4 and 6.4; Bott, *The stable homotopy of
the classical groups*, §§1–3; Ziller, *The free loop space of globally symmetric spaces*,
Theorems 3 and 8.

## Layer 3: multiple realization and Theorem B

Theorem A of the base roadmap (DGFloer Layer 10 item 5) needs a closed oriented manifold `S` and
a continuous map `φ : S → T*Q` whose projection to `Q` has nonzero degree. Theorem B replaces
the manifold by a homology class of the domain; the realization of a multiple of that class by a
manifold is the application constructed here.

### 3.1 Rational realization of a homology class

Consume the designated GeneralizedCohomology Thom, collapse, stabilization and finite-duality
comparisons and G5's rational spectral Hurewicz theorem, then TangentialBordism B5's geometric
Pontryagin–Thom and B6.3's rational `SO`-bordism orientation surjection, with their mapping-path
and Thom inputs and DGFloer Layer 1 items 2 and 4. On a smooth manifold `U` without boundary and
a class `α ∈ H_n(U; ℤ)`, lift `α ⊗ 1` to a finite rational bordism combination. Clear
denominators and then kill the finite-order torsion difference to obtain a closed smooth
oriented manifold `S` (a finite disjoint union) and a continuous map `f : S → U` with
`f_*[S] = Nα` for
some integer `N ≥ 1` (Thom's theorem, as used in the source's proof of Theorem 5.14). *Needs:*
GeneralizedCohomology G5 and its Thom and duality comparisons, TangentialBordism B5 and B6.3,
DGFloer Layer 1 items 2 and 4.

**Checks.**
- `α` of finite order `N`: the construction may return `S = ∅` with `f_*[∅] = 0 = Nα`; the
  statement is true and useless there, which is why Theorem B's hypothesis excludes it (3.2).
- `U = Sⁿ`, `α = [Sⁿ]`: `S = Sⁿ`, `f` the identity, `N = 1`.
- `α` the class of an embedded closed oriented submanifold: `N = 1` and `f` the inclusion; a
  construction that always produced `N > 1` would be weaker than Thom's theorem.

### 3.2 Theorem B (= Theorem 5.14)

Let `Q` be a closed connected `n`-manifold such that either `π₂(Q) ≠ 0` or some `π_ℓ(Q)`,
`ℓ ≥ 3`, has an element of infinite order, and let `U ⊂ T*Q` be a relatively compact domain
whose projection `π_U : U → Q` induces a nonzero map `H_n(U; ℤ) → H_n(Q; ℤ)`. Then `∂U` has the
almost existence property for closed characteristics contractible in `T*Q`. The source assumes
`Q` orientable; for a closed connected `Q` the hypothesis on `U` forces it, since `H_n(Q; ℤ) = 0`
when `Q` is not orientable (Hatcher, *Algebraic Topology*, Theorem 3.26). Route: choose `α` with
`π_(U*)α = b[Q]`, `b ≠ 0`; 3.1 gives a closed smooth oriented `S` and a continuous `φ : S → U`
with `φ_*[S] = Nα`, so `π_U ∘ φ` has degree `d = Nb ≠ 0`. Apply Theorem 5.10 (DGFloer Layer 10
item 5) to `φ`: if `π₂(Q) ≠ 0` this is its first alternative, and an element of infinite order in
`π_ℓ(Q)`, `ℓ ≥ 3`, means that `π_ℓ(Q)` is not annihilated by `d^m` for any `m ≥ 1`, which is its
condition 2. DGFloer Layer 10 item 5 takes `φ` continuous on a closed smooth oriented
`n`-manifold `S` (the source's Theorem 5.10, whose Umkehr map is built from Morse data on `S`);
the manifold 3.1 produces is such an `S`, so the map is used as it is, as in the source's proof
of Theorem 5.14, and no smoothing step is needed. Theorem B is the case where `Q` is not a rational
`K(π, 1)`. DGFloer Layer 10's all-dimensional DG trajectory and chain inputs come from its
Layers 7.2, 8 and 9. Only the multiple `Nα` of 3.1 is realized; Theorem B needs nothing more.

In `Suggested.lean` this is `hasContractibleAlmostExistence_of_map_singularHomology_ne_zero`, on
the base roadmap's carriers for Theorem A: `Q` a compact connected Hausdorff smooth manifold
modelled on a finite-dimensional real normed space `E`; the hypersurface the regular level
`F⁻¹(c)` of a smooth `F : T*Q → ℝ` with compact sublevel sets, which bounds the relatively compact
domain `U = {F < c}`; the hypothesis on `U` the nonvanishing of the map that the projection
induces on Mathlib's singular homology in degree `n = dim E` with coefficients `ℤ`; and the
conclusion `TauCeti.SmoothTwoForm.HasContractibleAlmostExistence` of
`TauCeti.CotangentBundle.symplecticForm` on `Set.univ`, with contractibility in `T*Q`. *Needs:*
3.1, DGFloer Layer 10 items 4–5, DGFloer Layer 6 item 5, Tau Ceti
`TauCeti.SmoothTwoForm.HasContractibleAlmostExistence`, Mathlib
`AlgebraicTopology.singularHomologyFunctor`.

**Checks.**
- `Q = T^r`: every `π_ℓ`, `ℓ ≥ 2`, vanishes, the hypothesis fails, and indeed `c°_HZ(D*T^r) = ∞`
  (Proposition 6.3 in the base roadmap), so the theorem must not apply.
- `Q = ℝP³`: `π₂ = 0` but `π₃ = ℤ`, the hypothesis holds; `Q = S²`: `π₂ = ℤ ≠ 0`.
- The hypothesis on `U` excludes the torsion case of 3.1: `π_(U*)α = b[Q]` with `b ≠ 0` has
  infinite order, so `α` has infinite order and `S ≠ ∅`.
- `c` below the minimum of `F`: `U = ∅`, `H_n(∅; ℤ) = 0`, the hypothesis fails, and the empty
  level carries no characteristic; a statement without the hypothesis on `U` would be false here.
- Connectedness is needed: for `Q = S² ⊔ T²` with base point on `S²`, `π₂(Q) ≠ 0`, and the unit
  codisc bundle `U = D*T²` of the flat metric has `H₂(U) → H₂(Q)` nonzero, yet its levels carry no
  closed characteristic contractible in `T*Q`.

### 3.3 Corollaries D and E in their Theorem B forms

Transport Theorem B along DGFloer Layer 6 item 3's magnetic fibre translation `Ψ'_σ`, and
through DGFloer Layer 6 item 4's Liouville-flow argument, exactly as DGFloer Layer 10 item 5
does for Theorems A and C; the realization input of 3.1 and the hypothesis on `U` are unchanged
by either transport. *Needs:* 3.2, DGFloer Layer 6 items 3–4, DGFloer Layer 10 item 5.

**Checks.**
- `σ = 0`: the magnetic translation is the identity and Corollary D reduces to Theorem B.
- A domain `U` disjoint from the zero section: the Liouville-flow argument of Corollary E still
  applies provided `H_n(U) → H_n(Q)` is nonzero; `U` a small neighbourhood of a single fibre
  has `H_n(U) → H_n(Q)` zero and is excluded.
- The sign of the translation: with `λ_can = p dq`, the base roadmap's `ω_can = −dλ_can` and
  `Ψ'_σ(q, p) = (q, p − σ_q)`, `Ψ'^*_σ λ_can = (p − σ_q) dq = λ_can − π^*σ`, so
  `Ψ'^*_σ ω_can = ω_can + π^*dσ`, which is Tau Ceti's
  `TauCeti.CotangentBundle.mpullback_vectorBundleTranslateDiffeomorph_symplecticForm`
  (`τ_α^*ω = ω − π^*dα` for `τ_α(p) = p + α`) at `α = −σ`, where `τ_(−σ) = Ψ'_σ`: `Ψ'_σ` is the
  symplectomorphism from `(T*Q, ω_can + π^*dσ)`,
  the magnetic form DGFloer Layer 6 item 3 obtains from the source's `ω_Q + π^*dσ`, to
  `(T*Q, ω_can)`; the form `ω_can − π^*dσ` is reached by the translation by `−σ`. The
  push-forward of `ω_can − π^*dσ` along `Ψ'_σ`, that is its pull-back along `Ψ'_(−σ)`, is
  `ω_can − 2π^*dσ`, not `ω_can`. Witness on `T*ℝ²` with `σ = q₁ dq₂`, so `π^*dσ = dq₁ ∧ dq₂`:
  `Ψ'^*_σ λ_can = p₁ dq₁ + (p₂ − q₁) dq₂`, whose `−d` is `dq₁ ∧ dp₁ + dq₂ ∧ dp₂ + dq₁ ∧ dq₂ =
  ω_can + π^*dσ`, while the convention `ω_can = +dλ_can` would give `ω_can − π^*dσ`; a
  one-dimensional base has `dσ = 0` and separates nothing. Since `π ∘ Ψ'_σ = π`, the map
  `H_n(U) → H_n(Q)` is unchanged either way.

### Examples

- `Q = S²`, `U = D*S²`: Theorem B recovers the base roadmap's Theorem A for the identity map of
  the zero section.

### Dependencies

GeneralizedCohomology G5; TangentialBordism B5 and B6.3; DGFloer Layer 1 items 2 and 4, Layer 6
items 3–5, Layer 10 items 4–5; Tau Ceti `TauCeti.SmoothTwoForm.HasContractibleAlmostExistence`;
Mathlib `AlgebraicTopology.singularHomologyFunctor`. Source: the source paper §§1.2 and 5
(Theorems 5.10 and 5.14 and their proofs).

## Layer 4: manifolds abundant with 2-spheres, and knotted hypersurfaces

### 4.1 Abundance and Theorem H

Define, for a closed connected oriented `n`-manifold `Q`, *abundant with 2-spheres*
(Definitions 1.7 and 6.11): there is a class `α ∈ H_*(Map(S², Q))` living over the fundamental
class in the sense of DGFloer Layer 5 item 5, with either `deg α > n`, or `deg α = n` and the
image of `α` under `H_n(Map(S², Q)) → H₀(Ω²Q) → H₀(Ω²Q, pt)` (shriek to the fibre, then reduce)
nonzero. Prove **Theorem H** (= Theorem 6.12): a closed oriented manifold abundant with
2-spheres has `c°_HZ(D*Q) < ∞`, hence the contractible almost existence property in `D*Q`,
through the DG Morse fibration theorem and the classes living over the fundamental class of
DGFloer Layer 5 items 4–5 and the cotangent form of Theorem M, Proposition 6.7, of DGFloer
Layer 10 item 2: when `deg α = n` replace `α` by `α − σ_* ev_* α` with `σ` the constant-sphere
section, so that `i_(Q*)` of the new class vanishes while its reduced shriek is unchanged.
Prove stability under products (Proposition 6.13): if `M` is abundant and `N` is closed
oriented, `M × N` is abundant through `α × [N]` under `Map(S², M × N) ≅ Map(S², M) × Map(S², N)`.
*Needs:* DGFloer Layer 2 (the constant-sphere section), Layer 5 items 4–5, Layer 10 item 2,
AlgebraicTopology Stage 6 (fundamental classes).

**Checks.**
- `Q = T^r` is not abundant: by Theorem H it would have finite capacity, but `c°_HZ(D*T^r) = ∞`
  since the flat torus has no contractible closed geodesic (Proposition 6.3 in the base
  roadmap).
- `Q = SU(2) = S³`: abundant by 4.3 (Proposition 6.31, and Proposition 6.34 for `S³`), so
  `c°_HZ(D*SU(2)) < ∞` by Theorem H; `π₃ = ℤ` and `S³` is not aspherical. The base roadmap's
  Theorem C concerns nonorientable `Q` and gives nothing here.
- Products: if `deg α = dim M` with nonzero reduced shriek, then `deg(α × [N]) = dim(M × N)` and
  the shriek of `α × [N]` to the fibre is `j_!α × 1`, again nonzero; if `deg α > dim M` then
  `deg(α × [N]) > dim(M × N)`. A definition without condition (ii) would wrongly count
  `σ_*[Q]`, the constant spheres, whose reduced shriek is zero.

### 4.2 Fibered families of 2-spheres

Define a *fibered family of 2-spheres* on a closed connected oriented `Q` (Definition 6.14): a
fibre bundle `π : Σ → Q`, locally trivial with fibre `Σ_p` a closed oriented manifold of positive
dimension, whose total space `Σ` is a closed oriented manifold, and a map `σ : Σ → Map(S², Q)`
over `Q`, `σ(x)(s₀) = π(x)`, with `(σ_p)_*[Σ_p] ≠ 0` in `H_*(Ω²Q)`, where `Ω²Q` is the fibre
`{f | f(s₀) = p}` of evaluation at `s₀` and `σ_p` is the restriction of `σ` to the fibre over the
base point `p`. The source asks for a smooth fibration and leaves the orientability of `Σ`
implicit; the proof uses only local triviality, and the criterion it rests on, Corollary 2.13,
takes the total space closed and orientable (`bdho-cotangent` lines 1237–1239). Prove
Proposition 6.15: `α = σ_*[Σ]` lives over the fundamental class, by Corollary 2.13 (DGFloer Layer
5 item 5) for the two Hurewicz fibrations `π` and evaluation `Map(S², Q) → Q` (DGFloer Layer 2
item 2: a locally trivial bundle over the compact manifold `Q`, and restriction along the closed
cofibration `{s₀} ⊆ S²`), and has degree `dim Q + dim Σ_p > dim Q`, so `Q` is abundant. With
Theorem H, `c°_HZ(D*Q) < ∞` for every Riemannian metric (4.5). In `Suggested.lean` this is
`contractibleHZCapacity_codiscBundle_lt_top_of_fiberedFamily`: the bundle is a map `p : S → Q`
with a Mathlib `Bundle.Trivialization` of fibre `F` around every point, the orientations of `Q`,
`S` and `F` are Tau Ceti `HomologicalOrientation`s, `σ` is a continuous map into the compact-open
`C(S², Q)`, and the fibre class is `j_*[F]` (`HomologicalOrientation.mapFundamentalClass`) for the
map `j` from `F` into the based mapping space `{f ∈ C(S², Q) | f(s₀) = q₀}` that reads `σ` on the
fibre over `q₀` through a trivialization at `q₀`. The sign of `j_*[F]` depends on that
trivialization and its vanishing does not.

- **Even spheres** (Example 6.16, Propositions 6.17–6.18). `Σ = Stiefel₂(Sⁿ)`, with `Σ_p` the
  ordered orthonormal 2-frames of `T_pSⁿ`, of dimension `2n − 3`; `σ(p, u, v)` is the round
  2-sphere `Sⁿ ∩ span(p, u, v)` swept by the loop of geodesics from `p` to `−p` in the rotating
  direction `cos θ·u + sin θ·v`, conjugated to a based map. The Pontryagin ring `H_*(ΩSⁿ)` is
  1.2's `ℤ[x]`; what is proved here, through DGFloer Layer 5, is that the class of the DG Morse
  cocycle of the height function is the generator `x` (Proposition 6.18), and that the Stiefel
  class `(σ_p)_*[Σ_p] ∈ H_(2n−3)(Ω²Sⁿ)` is nonzero for even `n` (Proposition 6.17) because its
  image under `β_*` is `deg(τ)·x·x̄ = ∓2x² ≠ 0`, twice a generator, with `τ` the Stiefel-domain
  map of 1.4 (of degree `±2` for even `n`) and `x̄ = −x` the image of `x` under loop reversal.
  For `n = 2`, `Σ_p = O(2)` has two components, one for each orientation of `S²`; the restriction
  of `σ_p` to one of them, `Σ′_p` (Remark 6.19), has `β_*(σ_p)_*[Σ′_p] = ±x²`, a generator,
  because `τ` has degree `±1` there. 2.6 (for `CP¹`) and 4.4 use this one-component cycle.
- **Spheres `S^(4k−1)`** (Example 6.20, Proposition 6.21). With the two orthonormal tangent
  fields `u, v` of 1.3, `Σ_p` is the equator `S^(n−2)` of `Sⁿ ∩ u(p)^⊥` orthogonal to `v(p)`,
  and `σ_p` is the double planar-circle sweep; its class in `H_(n−2)(Ω²Sⁿ) ≅ ℤ` is a generator,
  through the adjunction with `π_n(Sⁿ)` and Hurewicz. For `n = 3` that identification,
  `H₁(Ω^MΩ^MS³; ℤ) ≅ π₃(S³) ≅ ℤ` on the double Moore loop space, is Tau Ceti's
  `TauCeti.MooreLoopSpace.doubleFirstHomologySphereAddEquiv`.
- **Sphere bundles over highly connected bases** (Proposition 6.23). In the standing closed,
  connected, oriented total-space setting of §6.4.2, a smooth `Sⁿ`-bundle `Sⁿ → Q → B`,
  `n ≥ 2`, whose structure group reduces to `O(n+1)` is the unit-sphere bundle of a rank-`n+1`
  real vector bundle with a fibrewise metric; construct this equivalence and the vertical
  tangent bundle `TᵥQ`. Prove the two alternatives separately, for the unit-sphere bundle `S(V)`
  of a rank-`n+1` real vector bundle `V → B` with a continuous fibre metric over any topological
  space `B`, and hence for every closed manifold `Q` homeomorphic to `S(V)`: a vertical tangent
  vector at `x ∈ S(V_b)` is a vector of `V_b` orthogonal to `x`, the constructions below use only
  local triviality and the metric, the projection `S(V) → B` is a Serre fibration over any base
  (Hatcher, *Algebraic Topology*, Proposition 4.48), and a homeomorphism `Q ≅ S(V)` carries the
  fibered family and its classes across.
  * `n` even and `B` `2n`-connected. The parameter fibre over `q ∈ Q` is the oriented manifold
    of ordered orthonormal two-frames in the tangent space to the sphere fibre. Put the Example
    6.16 sphere-family map into these fibres and include each sphere fibre into `Q` to obtain
    `Σ → Q` and `σ : Σ → Map(S², Q)`.
  * `n ≡ 3 (mod 4)` and `B` `(n+1)`-connected, with two everywhere independent vertical vector
    fields `u, v`. Normalize them to an orthonormal pair. For `x ∈ Q`, a unit vector in the fibre
    of the ambient rank-`n+1` Euclidean bundle, put `V_x = u(x)^⊥` in that fibre and take the
    unit sphere in `V_x ∩ v(x)^⊥`, the carrier `E` of Example 6.20: `x` and `v(x)` are
    orthogonal unit vectors in `V_x`, so this is the equator `S^(n−2)` through `x`, whose points
    are sphere-fibre points, not tangent vectors at `x`. Use the two-field sphere-family map and
    the sphere-fibre inclusion to construct the oriented `Σ → Q` and `σ : Σ → Map(S², Q)`.
  In both cases prove the carrier's orientation and local triviality, continuity of the family
  map, compatibility of the fibre map with the based inclusion `Ω²Sⁿ → Ω²Q`, and
  nonvanishing of its fibre class. For the even case the fibre class is in `H_(2n−3)(Ω²Sⁿ; ℤ)`;
  `2n`-connectivity gives `π_i(Ω²B) = 0` for `i ≤ 2n − 2`, hence `H_i(Ω²B; ℤ) = 0` for
  `1 ≤ i ≤ 2n − 2`, and the Serre spectral sequence of `Ω²Sⁿ → Ω²Q → Ω²B` gives the inclusion
  isomorphism through degree `2n − 3`. For the odd case the class is the generator of
  `H_(n−2)(Ω²Sⁿ; ℤ)`; `(n+1)`-connectivity gives `π_i(Ω²B) = 0` for `i ≤ n − 1` and the same
  comparison through degree `n − 2`. Include basepoint-change and coefficient maps in these
  comparisons. Since either connectedness assumption makes `B` simply connected and `Sⁿ` is
  simply connected, prove `Q` simply connected and use this to trivialize the carrier's
  orientation local system over `Q`. The odd-case two-field condition is a hypothesis;
  quaternionic Hermitian sphere bundles are one source of such fields (Remark 6.24), not a
  substitute for the general target. With Proposition 6.15 and Theorem H this gives
  `c°_HZ(D*Q) < ∞` for every Riemannian metric on `Q` (4.5). In `Suggested.lean` these are
  `contractibleHZCapacity_codiscBundle_lt_top_of_sphereBundle_even` and
  `contractibleHZCapacity_codiscBundle_lt_top_of_sphereBundle_odd`, on Mathlib's `FiberBundle`,
  `VectorBundle` and `IsContinuousRiemannianBundle` with fibre `EuclideanSpace ℝ (Fin (n + 1))`,
  for a closed manifold `Q` with a homeomorphism onto the subtype `{v | ‖v‖ = 1}` of the total
  space; `k`-connectivity of `B` is path-connectedness with `π_i(B)` trivial for `1 ≤ i ≤ k`, and
  the two fields of the odd case are continuous families `u(x), w(x) ∈ V_b`, `x ∈ S(V_b)`,
  orthogonal to `x` and linearly independent.

*Needs:* 1.2, 1.3, 1.4, 4.1, DGFloer Layer 1 items 2 and 4, Layer 2, Layer 5 items 2–5,
AlgebraicTopology Stages 2, 6 and 8, SmoothBundlesConnections B2.2 and B2.5 (the unit-sphere
bundle of a metrized vector bundle with `O(n+1)` reduction), GeneralAlgebraicKTheoryPartII
§4.30b through 1.2, Tau Ceti `TauCeti.MooreLoopSpace.doubleFirstHomologySphereAddEquiv`
(`n = 3` in Proposition 6.21) and `TauCeti.HomologicalOrientation`, Mathlib
`Bundle.Trivialization`, `FiberBundle`, `VectorBundle` and `IsContinuousRiemannianBundle`;
Hatcher, *Algebraic Topology*, Proposition 4.48.

**Checks.**
- Degrees: for `Sⁿ`, `n` even, `α = σ_*[Σ]` has degree `n + (2n − 3) = 3n − 3`; for `n = 4k − 1`,
  degree `n + (n − 2) = 2n − 2`; for `S²`, `Σ_p = V_(2,2) = O(2)` has two components and
  `α ∈ H₃(Map(S², S²))`.
- `n = 3`: `H₁(Ω²S³) ≅ π₁(Ω²S³) = π₃(S³) = ℤ`, and the class of 6.21 is a generator; for `n = 2`
  the even-sphere construction applies instead, and the Stiefel class lies in `H₁(Ω²S²)`.
- The Serre comparison: in `Ω²Sⁿ → Ω²Q → Ω²B` with `H_i(Ω²B) = 0` for `1 ≤ i ≤ 2n − 2`, every
  differential into `E_(0,q)`, `q ≤ 2n − 3`, starts from `E_(r, q−r+1)` with
  `2 ≤ r ≤ q + 1 ≤ 2n − 2`, which vanishes. For a base that is only `(2n−1)`-connected,
  `H_i(Ω²B) = 0` only for `1 ≤ i ≤ 2n − 3`, so `E_(2n−2,0) = H_(2n−2)(Ω²B; H₀(Ω²Sⁿ))` may be
  nonzero and `d_(2n−2) : E_(2n−2,0) → E_(0,2n−3)` is no longer excluded. It is onto for the
  twistor fibration `S² → CP³ → S⁴`, an `S²`-bundle with structure group `SO(3)` over a base that
  is `3`-connected but not `4`-connected (`n = 2`, `H₂(Ω²S⁴) = π₄(S⁴) = ℤ`): the Hopf fibration
  `S¹ → S⁷ → CP³` gives `π₃(CP³) = π₃(S⁷) = 0`, so every component of `Ω²CP³` has `H₁ = 0`, and the
  Stiefel class in `H₁(Ω²S²)` maps to zero in `H₁(Ω²CP³)`. (`CP³` is abundant all the same, by
  4.5's Proposition 6.38.)
- `S^(4k+1)` admits no pair of pointwise independent vector fields, so the odd-sphere
  construction is not available for `n ≡ 1 (mod 4)`; these spheres are covered by 4.3 instead.
- Positive fibre dimension is needed: with a one-point fibre, `Σ = Q`, `π` the identity and `σ`
  the constant spheres, the fibre class is the class of a point in `H₀(Ω²Q)`, nonzero for every
  `Q`, including `T^r`, whose capacity is infinite (4.1). With positive fibre dimension `T^r`
  admits no fibered family: every component of `Ω²T^r` is contractible, since
  `π_i(Ω²T^r) = π_(i+2)(T^r) = 0`, so `H_k(Ω²T^r) = 0` for `k ≥ 1`.
- Connectedness of `Q` is needed for the capacity: on `Q = S² ⊔ T²`, take the `n = 2` Stiefel
  family over `S²` and the product `T² × O(2)` with the constant spheres over `T²`; the fibre
  class over a point of `S²` is nonzero, but a Hamiltonian admissible on the component `D*T²`,
  extended by zero, is admissible on `D*Q`, since a loop in `D*T²` contracts in `D*Q` only within
  `D*T²`; so `c°_HZ(D*Q) ≥ c°_HZ(D*T²) = ∞` (4.1).
- Orientability of `Σ`: `α = σ_*[Σ]` is the image of an integral fundamental class, which a
  nonorientable total space does not have; every example here has a simply connected base and
  an orientable fibre, so its total space is orientable.
- The sphere-bundle statements at `B` a point: `S(V)` is `Sⁿ`, and they agree with 4.5's
  statement for spheres; for the odd case at `n = 3`, `u(x) = ix` and `w(x) = jx` in `ℍ = ℝ⁴`
  are orthogonal to `x` and independent. At `n = 0` the hypotheses hold for the trivial line
  bundle over `B = T²`, with `S(V) = T² ⊔ T²` of infinite capacity, so `n ≥ 2` is needed.

### 4.2a Stable orthogonal groups and the finite-to-stable range

Write `O(r)` for `Matrix.orthogonalGroup (Fin r) ℝ` and `SO(r)` for
`Matrix.specialOrthogonalGroup (Fin r) ℝ` (`SO r` in `Suggested.lean`), compact Lie groups with
the subspace topology of the matrix space (LieGroups Layer 2), and `ι_r(A) = diag(A, 1)` for the
block inclusion with the new coordinate last (`soBlockInclusion` on `SO`, based at the identity
by `soBlockInclusion_one`). It is a continuous injective homomorphism and a closed embedding, and
identifies `SO(r)` with the stabilizer in `SO(r+1)` of the last basis vector `e_r`. The unitary
groups `U(r)` (`Matrix.unitaryGroup` over
`ℂ`) and GeneralizedCohomology G4.0b's quaternionic unitary groups `Sp(r)` carry the same block
inclusions.

- **The stable groups.** Define `O`, `SO`, `U` and `Sp` as the colimits of their finite groups
  along the block inclusions in 1.0's convenient category. By 1.0 the colimit carries the colimit
  topology and is Hausdorff, every compact subset and every compact family of paths lies in a
  finite stage, and `O ×_k O` is the colimit of the `O(r) × O(r)`, so multiplication and
  inversion are continuous on the convenient product: `O` is a group object of
  `CompactlyGenerated`, and the colimit inclusions `O(r) → O` are continuous homomorphisms; the
  same holds for `SO`, `U` and `Sp`. Prove the universal property: compatible continuous
  homomorphisms from the `O(r)` into a group object of compactly generated spaces factor
  uniquely through a continuous homomorphism from `O`. The determinant `O → {±1}` is continuous,
  `SO` is its kernel and the path component of the identity, and `π₀(O) = ℤ/2`. For every
  `i ≥ 0`, `π_i(O) = colim_r π_i(O(r))` and `π_i(SO) = colim_r π_i(SO(r))` through the colimit
  inclusions, and `π_i(SO) → π_i(O)` is an isomorphism for `i ≥ 1`.
- **The finite-to-stable range.** Evaluation at the last basis vector, `A ↦ A e_r`, is a smooth
  fibre bundle `SO(r+1) → S^r` with fibre `ι_r(SO(r))` over `e_r`, the principal projection of
  the homogeneous quotient `SO(r+1)/SO(r) ≅ S^r` (SmoothBundlesConnections B1.4), hence a Serre
  fibration. Since `π_i(S^r) = 0` for `i < r` (`TauCeti.subsingleton_homotopyGroup_sphere_of_lt`),
  the fibration exact sequence (DGFloer Layer 1 item 2) shows that `ι_r` induces a bijection
  `π_i(SO(r)) → π_i(SO(r+1))` for `i ≤ r − 2` and a surjection for `i = r − 1`
  (`bijective_map_soBlockInclusion`, `surjective_map_soBlockInclusion`; in degree `0` a statement
  about path components). Hence `π_i(SO(r)) → π_i(SO)` is an isomorphism for `r ≥ i + 2` and onto
  for `r = i + 1`; the same holds for `O(r)` in degrees `i ≥ 1`, and `π₀(O(r)) = ℤ/2` for `r ≥ 1`.
  The evaluations `U(r+1) → S^(2r+1)` and `Sp(r+1) → S^(4r+3)` give the ranges `i ≤ 2r − 1` for
  `U(r) → U(r+1)` and `i ≤ 4r + 1` for `Sp(r) → Sp(r+1)`; in particular `π₁(U) = π₁(U(1)) = ℤ`
  through the determinant, and `π_i(Sp) = π_i(Sp(1)) = π_i(S³)` for `i ≤ 5`, which is `0` for
  `i ≤ 2` and `ℤ` for `i = 3` (`TauCeti.homotopyGroupSphereAddEquiv`).

*Needs:* 1.0 (colimits, compact families and products), LieGroups Layer 2, GeneralizedCohomology
G4.0b, SmoothBundlesConnections B1.4, DGFloer Layer 1 item 2, Tau Ceti `HomotopyGroup.map`,
`TauCeti.subsingleton_homotopyGroup_sphere_of_lt`, `TauCeti.homotopyGroupSphereAddEquiv`, Mathlib
`Matrix.orthogonalGroup`, `Matrix.specialOrthogonalGroup`, `Matrix.unitaryGroup`. Sources: Steenrod,
*The Topology of Fibre Bundles*, Part I, §7; Hatcher, *Algebraic Topology*, §4.2.

**Checks.**
- `O(0)` and `SO(1)` are one-point groups and `O(1) = {±1}`; the inclusion `O(0) → O(1)` meets only
  `+1`, so `π₀(O(r)) = ℤ/2` holds from `r = 1` on, and confusing `O` with `SO` loses a component.
- The range is sharp: `π₁(SO(2)) = ℤ → π₁(SO(3)) = ℤ/2` is onto but not injective (`i = r − 1`),
  and `π₃(SO(3)) = ℤ → π₃(SO(4)) ≅ ℤ²` is not onto (`i = r`); `π₃(SO(4)) → π₃(SO(5)) = ℤ` is onto,
  and `π₃(SO(5)) = π₃(SO)` (`r = i + 2`).
- `π₈(SO(9)) ≅ (ℤ/2)²` (4.3) while `π₈(SO) = ℤ/2` (4.2c): at `r = i + 1` the map to the stable
  group is onto with nonzero kernel, so the range `r ≥ i + 2` cannot be lowered for the
  isomorphism.

### 4.2b The Clifford chain of iterated minimal centrioles

Fix `m ≥ 1` and `n = 16m`. On `ℝ¹⁶` fix a module over the Clifford algebra `Cl₈` (generators
`e₁, …, e₈` with `e_ie_j + e_je_i = −2δ_ij`) whose generators act by orthogonal matrices, the
irreducible `Cl₈`-module being `16`-dimensional: `Cl₈` is the Clifford algebra of
`TauCeti.realCliffordForm 0 8`, of residue `0`, which `TauCeti.realClifford_classification`
identifies with the matrix algebra `M₁₆(ℝ)`, and averaging an inner product over the finite group
generated by the `±e_i` makes the generators orthogonal. Give `ℝⁿ = (ℝ¹⁶)^m` the diagonal structure:
eight pairwise anticommuting orthogonal complex structures `J₁, …, J₈`. The block inclusion
`ℝ^(16m) → ℝ^(16(m+1))`, new block last, carries each `J_i` to `J_i`. Put `J₀ = I`,
`Ω₀ = O(n)` and, for `1 ≤ k ≤ 8`,
`Ω_k = {J ∈ O(n) | J² = −I and JJ_i = −J_iJ for 1 ≤ i < k}`, so that `J_k ∈ Ω_k`. Give `O(n)` the
bi-invariant metric `⟨X, Y⟩ = tr(XᵀY)` (RiemannianGeometry R1).

- **The members of the chain.** Each `Ω_k` is a compact smooth submanifold of `O(n)`; for `k ≥ 1` it
  is totally geodesic as the fixed set of the isometries `J ↦ −J⁻¹` and `J ↦ −J_iJJ_i⁻¹`, `i < k`,
  and each of its components is a compact symmetric space. Construct the identifications, with
  explicit orbit maps and stabilizers, `Ω₁ ≅ O(16m)/U(8m)`, `Ω₂ ≅ U(8m)/Sp(4m)`,
  `Ω₃ ≅ ⊔_(0≤p≤4m) G_p(ℍ^(4m))`, `Ω₄ ≅ Sp(2m)`, `Ω₅ ≅ Sp(2m)/U(2m)`, `Ω₆ ≅ U(2m)/O(2m)`,
  `Ω₇ ≅ ⊔_(0≤p≤2m) G_p(ℝ^(2m))` and `Ω₈ ≅ O(m)`, where `J₁` makes `ℝⁿ` complex, `J₁, J₂` make it
  quaternionic, and the Grassmannian summand of `J` is the `+1`-eigenspace of the involution `J₁J₂J`
  (respectively `J₁⋯J₆J`); the groups are the matrix groups of LieGroups Layer 2 and
  GeneralizedCohomology G4.0b, with SmoothBundlesConnections B1.4's quotients. Prove that `J_k` and
  `−J_k` lie in one component of `Ω_k`: for `k = 3` the middle Grassmannian `G_(2m)(ℍ^(4m))`,
  because `J₁J₂J₃` has eigenspaces of equal dimension on each block `ℝ¹⁶`, and for `k = 7` likewise
  `G_m(ℝ^(2m))`.
- **Geodesics from `J_k` to `−J_k`.** For `0 ≤ k ≤ 7` the geodesics of `Ω_k` from `J_k` are
  `t ↦ J_k exp(πtA)` with `A ∈ 𝔰𝔬(n)` commuting with `J_i` for `i < k` and, for `k ≥ 1`,
  anticommuting with `J_k`. Such a geodesic reaches `−J_k` at `t = 1` exactly when every
  eigenvalue of `A` is an odd multiple of `i`; its energy is `π²|A|² ≥ π²n`, with equality
  exactly when `A² = −I`. For `J ∈ Ω_(k+1)` the curve `γ_J(t) = cos(πt)J_k + sin(πt)J`, with
  `A = J_k⁻¹J`, is such a minimal geodesic with midpoint `J`, and `J ↦ γ_J` is a homeomorphism
  from `Ω_(k+1)` onto the space of minimal geodesics from `J_k` to `−J_k` in `Ω_k`.
- **Stabilization.** `J ↦ J ⊕ J_k`, with `J_k` on the new block, maps `Ω_k(16m)` into
  `Ω_k(16(m+1))` and fixes `J_k`; adding the fixed minimal geodesic `γ_(J_(k+1))` on the new block
  maps paths from `J_k` to `−J_k` to such paths, and these maps intertwine `J ↦ γ_J` with the
  stabilization `J ↦ J ⊕ J_(k+1)` of `Ω_(k+1)`. Under the identifications above the stabilization
  is the block inclusion on `O(16m)`, `Sp(2m)` and `O(m)`, the induced map on the homogeneous
  quotients, and on the Grassmannians the map `G_p → G_(p+2)` (`k = 3`), respectively
  `G_p → G_(p+1)` (`k = 7`), adding the new block's `+1`-eigenspace, which preserves
  `d = p − 2m`, respectively `d = p − m`.

*Needs:* LieGroups Layer 2, GeneralizedCohomology G4.0b, SmoothBundlesConnections B1.4,
RiemannianGeometry R1–R2, Tau Ceti `TauCeti.realClifford_classification`, Mathlib
`Matrix.orthogonalGroup` and `Matrix.unitaryGroup`. Sources: Milnor, *Morse Theory*, §24 (Lemmas
24.1–24.4 and 24.8 and the descriptions before Theorem 24.5); Eschenburg and Hanke, *Bott
periodicity, submanifolds, and vector bundles*, §§2–3.

**Checks.**
- `k = 0`: `γ_J(t) = cos(πt)I + sin(πt)J = exp(πtJ)` has energy `π²n`, because `tr(JᵀJ) = n`; a
  geodesic from `I` to `−I` with one eigenvalue pair `±3i` and all others `±i`, an extra full turn
  in one plane, has energy `π²(n + 16)`.
- Dimensions: `dim Ω₁ = dim O(16m) − dim U(8m) = 64m² − 8m`, which is also the dimension
  `n²/4 − n/2` of the tangent space `{J₁A | A ∈ 𝔰𝔬(n), AJ₁ = −J₁A}` at `J₁`.
- `m = 1`: `Ω₇ ≅ G₀(ℝ²) ⊔ G₁(ℝ²) ⊔ G₂(ℝ²)`, a point, a circle and a point, and `Ω₈ ≅ O(1) = {±1}`:
  `J₇` and `−J₇` are antipodal on the circle `G₁(ℝ²)`, and its two halves are the two minimal
  geodesics between them.

### 4.2c Index bounds, the Bott maps and real Bott periodicity

For `0 ≤ k ≤ 7` let `Λ_k(n)` be the space of paths in `Ω_k(n)` from `J_k` to `−J_k`, a subspace of
1.0's `Map_k(I, Ω_k(n))`, which for the compact manifold `Ω_k(n)` is the compact-open path space,
with RiemannianGeometry R3's finite broken-geodesic approximations for the trace metric and their
energy-band and compact-family comparisons with `Λ_k(n)`. Let `m_j` be the dimension of an
irreducible real module over `j` anticommuting orthogonal complex structures, that is over the
Clifford algebra of `TauCeti.realCliffordForm 0 j`. By `TauCeti.realClifford_classification` that
algebra is `M_N(D)` or `M_N(D) × M_N(D)` with `D = ℝ, ℂ` or `ℍ` and `N` fixed by `j mod 8`, whose
irreducible modules are `D^N`: `m₀ = 1, m₁ = 2, m₂ = m₃ = 4, m₄ = m₅ = m₆ = m₇ = 8, m₈ = 16`, and
there is one irreducible module up to isomorphism except for `j ≡ 3 (mod 4)`, where the algebra is
a product and there are two.

- **Critical manifolds and attachments.** The critical points of the energy on `Λ_k(n)` are the
  geodesics `t ↦ J_k exp(πtA)` of 4.2b, and on each energy level the critical set is a finite union
  of orbits, compact submanifolds, of the conjugation action of the centralizer
  `{g ∈ O(n) | gJ_i = J_ig for i ≤ k}`, which acts on `Ω_k` by isometries fixing `J_k` and `−J_k`.
  Along such a geodesic the Jacobi operator is `K_A(B) = −¼[A, [A, B]]` on the tangent space
  `{B ∈ 𝔰𝔬(n) | B commutes with J_i for i < k and, for k ≥ 1, anticommutes with J_k}`, by the same
  locally symmetric computation as in 2.1 (the curvature term `R(·, γ′)γ′` is read off from
  `ad(A)²`), so an eigenvalue `e²` of `K_A` gives conjugate points at `t = 1/e, 2/e, …` before
  `t = 1`. Compute index and nullity from it, prove that the nullity of each critical manifold
  equals its dimension, identify the negative normal bundles with their orientation systems, and
  attach the negative disc bundles on the finite approximations by MorseTheory M5, compatibly with
  subdivision and with the stabilization of 4.2b.
- **Index bounds for `k = 0, 1, 3, 4, 5, 7`.** Split `ℝⁿ` into minimal subspaces `M₁, …, M_s`
  invariant under `J₁, …, J_k` and `A`. On `M_h`, `A = a_hJ′_h` with `a_h` an odd positive integer
  and `J′_h` a complex structure that commutes with `J_i` for `i < k` and, for `k ≥ 1`, anticommutes
  with `J_k`; so `M_h` is irreducible under the `k + 1` anticommuting structures
  `J₁, …, J_k, J_kJ′_h` (under `J′_h` alone for `k = 0`), and `s = n/m_(k+1)`; since
  `k + 1 ≢ 3 (mod 4)` the `M_h` are mutually isomorphic, and each pair `h ≠ j` gives an eigenvector
  of `K_A` with eigenvalue `(a_h + a_j)²/4`. A non-minimal geodesic has some `a_h ≥ 3`, hence
  `s − 1` eigenvalues at least `4`, each with an interior conjugate point. Prove: every non-minimal
  geodesic from `J_k` to `−J_k` in `Ω_k(n)` has index at least `λ_k = n/m_(k+1) − 1`, which for
  `n = 16m` is `8m − 1`, `4m − 1`, `2m − 1`, `2m − 1`, `2m − 1` and `m − 1` for
  `k = 0, 1, 3, 4, 5, 7`.
- **Index bounds for `k = 2, 6`.** Here `i = J₁⋯J_(k−1)` is a complex structure commuting with
  `J₁, …, J_(k−1)` and with `J_k⁻¹J` for every `J ∈ Ω_k`, so `t ↦ det_ℂ(J_k⁻¹λ(t))` is a loop in
  the circle for every `λ ∈ Λ_k(n)`; its winding number `w(λ)` is constant on path components,
  and `Λ_k(n)` has infinitely many components. Split `ℝⁿ` into minimal subspaces `M₁, …, M_s`
  invariant under `J₁, …, J_k` and `A`, of dimension `m_k`, so `s = n/m_k`; on `M_h`, `A = a_h·i`
  with `a_h` an odd integer of either sign, and `w = c·m_k/4` with `c = a₁ + ⋯ + a_s`, that is
  `w = c` for `k = 2` and `w = 2c` for `k = 6`. Each pair with `a_h > a_j` gives an eigenvalue
  `(a_h − a_j)²/4` of `K_A` contributing `(a_h − a_j)/2 − 1` conjugate points, so twice the index
  is at least the sum of `a_h − a_j − 2` over these pairs; if some `a_j ≤ −3` this sum is at least
  the sum `p` of the positive `a_h`, and `2p ≥ s + c`, while some `a_h ≥ 3` gives `s − c` in the
  same way. Prove: on the components of `Λ_k(n)` with invariant `c`, every non-minimal geodesic
  has index at least `λ_k(c) = (n/m_k − |c|)/4`, that is `(4m − |c|)/4` for `k = 2` and
  `(2m − |c|)/4` for `k = 6`.
- **The Bott maps in finite rank.** The minimal geodesics form the image of the midpoint map
  `μ_k : Ω_(k+1)(n) → Λ_k(n)`, `J ↦ γ_J`. The energy attains its minimum on each component of
  `Λ_k(n)` at a geodesic of index `0`, so every component on which the relevant bound `λ` is
  positive contains a minimal geodesic, with `λ = λ_k` for `k ≠ 2, 6` and `λ = λ_k(c)` on the
  components with invariant `c` for `k = 2, 6`. By the attachments above, each such component is
  obtained, up to homotopy, from the minimal geodesics it contains by attaching cells of dimension
  at least `λ`; so on these components `μ_k` induces a bijection on `π_j` for `j ≤ λ − 2` and a
  surjection for `j = λ − 1`. Composing with the reversed minimal geodesic `γ_(J_(k+1))` gives the
  Bott map `β_k : Ω_(k+1)(n) → Ω(Ω_k(n), J_k)` into the based loops, with the same ranges,
  compatibly with the stabilization of 4.2b.
- **The stable Bott maps.** Let `Ω_k` be the colimit of the `Ω_k(16m)` along the stabilization, in
  1.0's convenient category, and `Λ_k` its space of paths from `J_k` to `−J_k`. By 1.0 compact
  families of points and of paths lie in a finite stage, so `π_j(Λ_k) = colim_m π_j(Λ_k(16m))` and
  likewise for `Ω_(k+1)`. Every `λ_k` grows without bound with `m`, and every `λ_k(c)` does so for
  each fixed `c`; so the stable `μ_k : Ω_(k+1) → Λ_k` is a bijection on every `π_j` at every base
  point, a weak homotopy equivalence. Prove that `Ω_(k+1)` and `Λ_k` have CW type. The first is
  the colimit of the compact manifolds `Ω_(k+1)(16m)`, of finite CW type (AlgebraicTopology Stage 8
  item 7), along stabilizations that are closed cofibrations (1.0): AlgebraicTopology Stage 4
  item 5's `cofibrationTowerHomotopyEquivalence` makes it homotopy equivalent to the mapping
  telescope of the tower, and so to the telescope of cellular approximations of the
  stabilizations between CW models of the stages, a CW complex. The second is a path space with
  fixed endpoints in `Ω_k`, which has CW type by the same argument (AlgebraicTopology Stage 8 item
  11a). Then `μ_k`, and with it the stable Bott
  map `β_k : Ω_(k+1) → Ω(Ω_k, J_k)`, is a homotopy equivalence by Whitehead's theorem
  (AlgebraicTopology Stage 8 item 5), for `k = 0, …, 7`.
- **The stable members.** Read the colimits off 4.2b's identifications and stabilizations:
  `Ω₁ ≅ O/U` (two components), `Ω₂ ≅ U/Sp`, `Ω₄ ≅ Sp`, `Ω₅ ≅ Sp/U` and `Ω₆ ≅ U/O` (connected),
  `Ω₈ ≅ O`, and the two Grassmannian members `Ω₃ ≅ colim_m ⊔_(0≤p≤4m) G_p(ℍ^(4m))` and
  `Ω₇ ≅ colim_m ⊔_(0≤p≤2m) G_p(ℝ^(2m))`, along 4.2b's stabilizations `G_p → G_(p+2)`, respectively
  `G_p → G_(p+1)`. These preserve 4.2b's index `d = p − 2m`, respectively `d = p − m`, so the path
  components of `Ω₃` are the colimits `colim_m G_(2m+d)(ℍ^(4m))` and those of `Ω₇` the colimits
  `colim_m G_(m+d)(ℝ^(2m))`, one for each `d ∈ ℤ` (every `d` occurs once `2m ≥ |d|`, respectively
  `m ≥ |d|`), each a colimit of connected Grassmannians and so connected by 1.0's compact
  families; `π₀(Ω₃) ≅ π₀(Ω₇) ≅ ℤ` through `d`. The component `d = 0` of `Ω₃`, the colimit of the
  middle Grassmannians `G_(2m)(ℍ^(4m))`, contains `J₃`, and that of `Ω₇`, the colimit of the
  `G_m(ℝ^(2m))`, contains `J₇`.
- **The eight equivalences.** Through these identifications the eight stable Bott maps are
  homotopy equivalences `O/U ≃ ΩO`, `U/Sp ≃ Ω(O/U)`, `Ω₃ ≃ Ω(U/Sp)`, `Sp ≃ Ω(Ω₃)`,
  `Sp/U ≃ ΩSp`, `U/O ≃ Ω(Sp/U)`, `Ω₇ ≃ Ω(U/O)` and `O ≃ Ω(Ω₇)`, each loop space taken at `J_k`.
- **Real Bott periodicity.** Composing them, `O ≃ Ω⁸O`, `Sp ≃ Ω⁴O` and `O ≃ Ω⁴Sp`, the iterated
  loop spaces taken at the base points `J_k`, and `π_(i+8)(O) ≅ π_i(O)` for every `i ≥ 0`, as
  groups (for `i = 0` both sides have two elements).
- **The stable homotopy groups.** Through the loop shift `HomotopyGroup.pathLoopSpaceMulEquiv`
  and the stable Bott maps, `π_i(O) ≅ π₀(Ω_i)` as sets for `1 ≤ i ≤ 8`, and `π_i(O) ≅ π_(i−j)(Ω_j)`
  as groups for `1 ≤ j < i`. The components above give one element for `i = 2, 4, 5, 6`, two for
  `i = 1, 8`, and `ℤ` as a set for `i = 3, 7`. For the group structures in degrees `3` and `7` use
  `π₃(O) ≅ π₁(Ω₂) = π₁(U/Sp) ≅ π₁(U) = ℤ`, since `Sp` is `2`-connected (4.2a), and
  `π₇(O) ≅ π₃(Ω₄) = π₃(Sp) = π₃(S³) = ℤ` (4.2a). So `π_i(O)` is `ℤ/2, ℤ/2, 0, ℤ, 0, 0, 0, ℤ` for
  `i ≡ 0, 1, …, 7 (mod 8)`, `π_i(SO) = π_i(O)` for `i ≥ 1`, and `π₀(SO) = 0`. With the range of
  4.2a, in finite rank `r ≥ i + 2` and with `i = j + 1`, these are `subsingleton_pi_SO_of_stable`
  (`i ≡ 2, 4, 5, 6`), `nonempty_pi_SO_mulEquiv_zmod_two` (`i ≡ 0, 1`, `i ≥ 1`) and
  `nonempty_pi_SO_mulEquiv_int` (`i ≡ 3, 7`), and periodicity for `r ≥ i + 10` is
  `nonempty_pi_add_eight_SO_mulEquiv`.

*Needs:* 1.0 (convenient colimits, path spaces and compact families), 2.1 (the locally symmetric
conjugate-point computation), 4.2a, 4.2b, RiemannianGeometry R1–R3, MorseTheory M5,
AlgebraicTopology Stage 4 item 5 (`cofibrationTowerHomotopyEquivalence`, cellular approximation)
and Stage 8 items 5, 7 and 11a, DGFloer Layer 1 item 2, Tau Ceti
`HomotopyGroup.pathLoopSpaceMulEquiv`, `TauCeti.realClifford_classification`, Mathlib
`HomotopyGroup.Pi`. Sources: Milnor, *Morse Theory*, §§22–24, in particular Theorems 22.3 and
24.5 and the proof of 24.5 for the index bounds; Bott, *The stable homotopy of the classical
groups*; Eschenburg and Hanke, *Bott periodicity, submanifolds, and vector bundles*, §4.

**Checks.**
- `k = 0`, `n = 16m`: the geodesic with one eigenvalue pair `±3i` in the `x₁x₂`-plane and all
  others `±i` has `K_A`-eigenvalue `(3 + 1)²/4 = 4` on each of the `8m − 1` other planes, with a
  conjugate point at `t = 1/2`, so its index is at least `8m − 1 = λ₀`. Lifting the rotation in the
  `x₁x₂x_j`-space to `S³` shows the sharper count `n − 2` for this geodesic; `λ₀` is the uniform
  bound used.
- `k = 7`, `m = 1`: `λ₇ = 0`. In the circle `G₁(ℝ²)` of 4.2b's third Check the geodesics from `J₇`
  to `−J₇` that wind further have no conjugate points and index `0`, so the bound is attained and
  the Bott maps carry information only for large `m`.
- `k = 2`: a minimal geodesic has all `a_h = ±1`, so `|c| ≤ s = 4m`; the bound `(4m − |c|)/4` is
  `0` at `|c| = 4m`, so on a component with large invariant the connectivity is weak, and only for
  fixed `c` does it grow with `m`.
- The minimal critical manifold has index `0` and nullity `dim Ω_(k+1)`; for `k = 0` this is
  `dim O(n)/U(n/2) = n²/4 − n/2`.
- For odd `n ≥ 17`, `n − 1` is even and `π_(n−1)(O)` is `ℤ/2` when `n ≡ 1 (mod 8)` and `0` when
  `n ≡ 3, 5, 7 (mod 8)`: the stable terms of 4.3.
- The index of the Grassmannian members: for `m = 1` the stage of `Ω₇` is
  `G₀(ℝ²) ⊔ G₁(ℝ²) ⊔ G₂(ℝ²)`, a point, a circle and a point with `d = −1, 0, 1`, and `J₇` lies in
  `d = 0`; the stage of `Ω₃` is `⊔_(0≤p≤4) G_p(ℍ⁴)`, of real dimensions
  `4p(4 − p) = 0, 12, 16, 12, 0`, with `d = −2, …, 2`, and `J₃` lies in the middle `G₂(ℍ⁴)`, whose
  dimension `16` is that of the tangent space at `J₃`, `J₃` times the skew maps that commute with
  `J₁` and `J₂` and anticommute with `J₃`: the skew maps commuting with `J₁` and `J₂` form
  `𝔰𝔭(4)`, of dimension `36`; among them, anticommuting with `J₃` is anticommuting with the
  involution `J₁J₂J₃`, whose eigenspaces are two copies of `ℍ²`, which leaves the off-diagonal
  blocks `ℍ^(2×2)`, of dimension `16`. Labelling the components by the rank `p` instead would not
  be preserved by the stabilizations `p ↦ p + 1` and `p ↦ p + 2`, and no component of either
  colimit would have a rank label.
- `π₁(U/Sp)`: the exact sequence of `Sp → U → U/Sp` gives `π₁(U/Sp) ≅ π₁(U) = ℤ` because
  `π₁(Sp) = π₀(Sp) = 0`; reading `π₃(O)` only as the set `π₀(Ω₃) ≅ ℤ` would not fix the group.

### 4.3 Covering by diffeomorphisms

Define, for a closed connected oriented `n`-manifold `M` with basepoint and the evaluation
`ev : Diff(M) → M` over GeometricTopology Layer 3's `Diff(M)`, *covered by diffeomorphisms*
(Definition 6.26: some `A ∈ H_n(Diff(M))` has `ev_*A = [M]`) and *`ℓ`-covered* (Definition 6.32:
`ev_*A = ℓ[M]`, `ℓ > 0`); on a compact `M` the `C^∞` topology of `Diff(M)` is Tau Ceti's
`Diffeomorph.weakWhitneyTopology`, with continuous evaluation, on which 4.5 states the
capacity form of both propositions. Prove Proposition 6.29 (covered and not aspherical implies abundant)
and Proposition 6.33 (`ℓ`-covered, not aspherical, and either `π₂(M) ≠ 0` or the first nonzero
`π_k(M)`, `k ≥ 3`, not `ℓ`-torsion, implies abundant), through the action map
`Diff₀(M) × Ω²M → Map(S², M)`, its map of fibrations, DGFloer Layer 1 item 6's local evaluation
bundle and the shriek naturality of DGFloer Layer 5 item 5.

- **Compact connected Lie groups (Proposition 6.31).** Consume DGFloer Layer 11 for the finite
  covering `T × K → G` and the criterion that a compact connected Lie group is aspherical exactly
  when it is a torus, which is the hypothesis of Example 6.30 for every non-torus compact
  connected `G`. Then use `G → Diff(G)` by left translation, its evaluation identity at `e`, and
  Proposition 6.29 to prove that every compact connected Lie group other than a torus is
  abundant.
- **The torsion group `π_(n−1)(SO(n))` (Lemma 6.35).** For every odd `n ≥ 3`, prove that
  `π_(n−1)(SO(n))` is torsion from the low-rank values and the stable-plus-Stiefel splitting
  below. Give the low-rank values `π₂(SO(3)) = 0`, `π₄(SO(5)) = ℤ/2`, `π₆(SO(7)) = 0`,
  `π₈(SO(9)) = (ℤ/2)²`, `π₁₀(SO(11)) = π₁₂(SO(13)) = π₁₄(SO(15)) = ℤ/2`, each with the maps and
  fibration exact sequences that certify it. For odd `n ≥ 17` construct the stable-plus-Stiefel
  splitting `π_(n−1)(SO(n)) ≅ π_(n−1)(O) ⊕ π_n(V_(n+2,2)(ℝ))`, with `O` 4.2a's stable
  orthogonal group; prove the stable term is `0` or `ℤ/2`, namely `ℤ/2` exactly when
  `n ≡ 1 (mod 8)`, by 4.2c's stable homotopy groups of `O`, and the Stiefel term
  `ℤ/2` in this range from the Stiefel fibration and extension data; state the comparison maps
  and the range in which stabilization applies (4.2a's `r ≥ i + 2`). The
  source's proof of Lemma 6.35 prints
  `π₈(SO(9)) = ℤ/4`; the group is `(ℤ/2)²`: the stabilization `π₈(SO(9)) → π₈(SO) = ℤ/2` is
  split with kernel `ℤ/2` (Crowley–Schick–Steimle, proof of Lemma 2.2), and the exact sequence
  of `SO(8) → SO(9) → S⁸` with `π₈(SO(8)) = (ℤ/2)³` surjecting onto `π₈(SO(9))` certifies
  exponent two. In
  `Suggested.lean`, `SO n` is `Matrix.specialOrthogonalGroup (Fin n) ℝ` with the subtype
  topology of the matrix space, the seven values are `subsingleton_pi2_SO3`,
  `nonempty_pi4_SO5_mulEquiv`, `subsingleton_pi6_SO7`, `nonempty_pi8_SO9_mulEquiv`,
  `nonempty_pi10_SO11_mulEquiv`, `nonempty_pi12_SO13_mulEquiv` and
  `nonempty_pi14_SO15_mulEquiv`, the torsion statement for every odd `n ≥ 3` is
  `isOfFinOrder_pi_SO`, and the splitting for odd `n ≥ 17` is
  `nonempty_pi_SO_mulEquiv_prod_stiefel`, with its stable term `π_(n−1)(O)` read in the finite
  rank `SO(n+1)`, where it is already stable by 4.2a, and `V_(n+2,2)(ℝ)` Tau Ceti's
  `TauCeti.stiefel` of orthonormal `2`-frames in `ℝⁿ⁺²` at any base frame.
- **First proof of odd-sphere covering (Proposition 6.34).** Use the evaluation fibration
  `SO(n) → SO(n+1) → Sⁿ` and its exact segment `π_n(SO(n+1)) → π_n(Sⁿ) → π_(n−1)(SO(n))`. Since
  `π_n(Sⁿ) = ℤ` and the last group is torsion, the boundary map has nonzero kernel, and
  exactness gives a class mapping to `ℓ[Id_(Sⁿ)]`, `ℓ > 0`. Carry it through the Hurewicz map to
  `H_n(SO(n+1); ℤ)`, then through Tau Ceti's continuous inclusion
  `TauCeti.continuousOrthogonalToDiffSphere`, restricted to `SO(n+1)`, and evaluation to obtain
  `ev_*A = ℓ[Sⁿ]`. Apply Proposition 6.33 using that `π_n(Sⁿ) = ℤ` is not `ℓ`-torsion.
- **Second proof of odd-sphere covering (Proposition 6.34).** Use GeometricTopology Layer 3 and
  DGFloer Layer 1 item 6's local evaluation bundle and 1.4's rotation family
  `f : T¹_pSⁿ × S¹ → SO(n+1)`. Take `A = f_*([S^(n−1)] × [S¹]) ∈ H_n(SO(n+1))`; by 1.4,
  `(ev_p)_*A = (1 + (−1)^(n−1))[Sⁿ] = 2[Sⁿ]` for odd `n`, and the inclusion `SO(n+1) → Diff(Sⁿ)`
  (`TauCeti.continuousOrthogonalToDiffSphere`) carries `A` to a class with the same evaluation, so
  `Sⁿ` is `2`-covered. Apply Proposition 6.33
  with the non-`2`-torsion group `π_n(Sⁿ) = ℤ`. Both proofs are targets.

*Needs:* 1.4, 4.2a, 4.2c, DGFloer Layer 1 items 1–2 and 6, Layer 2, Layer 5
item 5, Layer 11, GeometricTopology Layer 3, AlgebraicTopology Stage 8.1–8.7,
Tau Ceti `IsAspherical`, `TauCeti.continuousOrthogonalToDiffSphere`,
`IsCoveringMap.homotopyGroupPiMulEquiv`, `TauCeti.stiefel`, Mathlib `HomotopyGroup.Pi`,
`IsOfFinOrder`, `Matrix.specialOrthogonalGroup`.

**Checks.**
- Low ranks: `π₂(SO(3)) = π₂(S³) = 0` through the double cover `S³ → SO(3)`
  (`IsCoveringMap.homotopyGroupPiMulEquiv`, and `TauCeti.subsingleton_homotopyGroup_sphere_of_lt`
  for `π₂(S³)`); `π₈(SO(9)) = (ℤ/2)²`
  as above, so a statement of `π₈(SO(9)) ≅ ℤ/4` would be false (an element of order `4` would
  survive in the quotient of `(ℤ/2)³`).
- The splitting formula fails at the parallelizable spheres `S³` and `S⁷`, so the target states
  it only in the range of its source: for `n = 7` it would give
  `π₆(O) ⊕ π₇(V_(9,2)) = 0 ⊕ ℤ/2` (the connecting map `π₈(S⁸) → π₇(S⁷)` of `S⁷ → V_(9,2) → S⁸` is
  multiplication by the Euler number `2`), while `π₆(SO(7)) = 0`; for `n = 3` it would give
  `0 ⊕ ℤ/2` while `π₂(SO(3)) = 0`. The Stiefel term enters through the connecting map
  `π_n(V_(n+2,2)) → π_(n−1)(SO(n))` of `SO(n) → SO(n+2) → V_(n+2,2)`, whose image is generated by
  the clutching class `∂[Id_(Sⁿ)]` of `TSⁿ` in `π_(n−1)(SO(n))`, so it injects exactly when `Sⁿ`
  is not parallelizable; the low-rank values agree with the formula at `n = 5, 9, 11, 13, 15`
  (`0 ⊕ ℤ/2`, `ℤ/2 ⊕ ℤ/2`, and `0 ⊕ ℤ/2` three times). The range `n ≥ 17` (`n ≥ 16` and odd)
  is part of the target.
- For odd `n ≥ 17` the stable term is `ℤ/2` exactly when `n ≡ 1 (mod 8)` (`π_(n−1)(O) = ℤ/2` for
  `n − 1 ≡ 0, 1 (mod 8)`, and `n − 1` is even), so `π_(n−1)(SO(n))` is `(ℤ/2)²` for
  `n = 17, 25, …` and `ℤ/2` for the other odd `n ≥ 19`; `n = 9` fits the same pattern.
- Tori: `T^r` is covered by diffeomorphisms through left translation but is aspherical, so
  Proposition 6.29 does not apply, consistent with 4.1's first Check; `SU(2)`, `SO(3)` and `U(n)`
  for `n ≥ 2` (`π₃(U(n)) = ℤ`) are not tori and are abundant, while `U(1) = S¹ = T¹` is the torus
  case and is not.
- `n = 3` in the second proof: `A ∈ H₃(SO(4)) ≅ ℤ²` with `(ev_p)_*A = 2[S³]`, while the first
  proof's class from the section `S³ → SO(4)` has `ℓ = 1`; both proofs conclude.

### 4.4 Homogeneous spaces, including `S² = SO(3)/SO(2)`

For a compact connected Lie group `G` and a closed Lie subgroup `H` of positive dimension, with
`M = G/H`, define the left actions `Φ_H : H × Ω²M → Ω²M` and `Φ : G × Map(S², M) → Map(S², M)`
and the evaluation fibration `ev : Map(S², M) → M` with fibre `Ω²M` over `eH`. Prove Proposition
6.36 with two conclusions: given `α ∈ H_*(Ω²M; ℤ)` with `(Φ_H)_*([H] × α) ≠ 0`, if `M` is
orientable then `M` is abundant with 2-spheres, and if `M` is not orientable then
`c°_HZ(D*M) < ∞`, through the nonorientable form of Proposition 6.7 (DGFloer Layer 10 item 2);
no abundance is claimed for a nonorientable `M`, Definition 6.11 being stated for oriented
manifolds. Route:
construct the map of fibrations induced by `H → G → M` and `Map(S², M) → M`; prove `j_![G] = [H]`
for the fibre inclusion and shriek naturality, with the coefficient maps, degree shifts,
cross-product signs and basepoint identifications, to obtain `j_! Φ_*([G] × α) = (Φ_H)_*([H] × α)`;
because `dim H > 0` the class has degree above `dim M` and its shriek has positive degree, so
the reduced-homology condition of Definition 6.11 holds.

The source states the result for every closed `H`, even when `M` is not orientable, while
Definition 6.11 is stated for oriented manifolds. Preserve this generality, with the capacity
conclusion in place of abundance, through the evaluation-pullback orientation system `ev*or_M`. Choose a generator `o` of its fibre at `eH` and
a left-invariant orientation of `G`. For `π : G → M`, construct the flat trivialization
`τ(g) = d(L_g)_(eH)(o)` of `π*or_M`, and prove its compatibility with paths and the action's
coefficient map. On `H` it is `τ(h) = χ(h)o`, where `χ(h)` is the sign of the isotropy action on
`T_(eH)M`. Compute the fibre-coorientation sign relative to the left-invariant orientation of
`H`; it is the same `χ(h)`. Thus the twisted shriek satisfies `j_![G]_τ = [H]` with the ordinary
left-oriented fundamental cycle on all components: the two signs cancel. Without the twist the
shriek of `[G]` counts the components of `H` with the signs `χ(h)`, so when `M` is nonorientable
it is not the left-oriented cycle `[H]`.

Form `β = Φ_*([G]_τ × α)` in `H_(dim G + deg α)(Map(S², M); ev*or_M)` using the action's
coefficient map, and prove the same square gives `j_!β = (Φ_H)_*([H] × α)` in ordinary homology
after the basepoint-fibre identification. Construct the twisted abundance implication by
tensoring the path-fibration DG coefficient system in the proof of Theorem 6.12 with the
evaluation-pullback `or_M`, including its restriction along constant loops and the chain and
transport comparison. Identify the total path-space readout with `H_*(M; or_M)`, whose groups
above `dim M` vanish; then apply the nonorientable form of Proposition 6.7 (DGFloer Layer 10
item 2) with the nonzero shriek and zero constant-loop image; this is the second conclusion.
Recover the oriented statement, the first conclusion, by an orientation trivialization; no
connectedness of `H` is imposed.

For the nonorientable `ℝP² = SO(3)/O(2)`, with `O(2)` embedded as the stabilizer
`{diag(A, det A)}` of the line `[e₃]`, take `α ∈ H₀(Ω²ℝP²; ℤ)` the class of a based map whose
lift through the covering `S² → ℝP²` has degree `1`. Lifting based maps identifies `Ω²ℝP²` with
`Ω²S²`. The identity component `SO(2)` carries `α` to the class `α′` of Example 6.37 in the
degree-`1` component, nonzero; an element `diag(A, −1)`, `det A = −1`, of the other component
sends `e₃` to `−e₃`, so the based lift of `hσ` is `diag(−A, 1)σ̃`, of determinant `−1`, and that
component carries `α` into the degree-`−1` component. So `(Φ_H)_*([H] × α) ≠ 0`, and the second
conclusion gives `c°_HZ(D*ℝP²) < ∞`, which the covering argument of the source's Remark 6.2 also
gives from `S²`.

For `S² = SO(3)/SO(2)` (Example 6.37), take `α ∈ H₀(Ω²S²; ℤ)` represented by a degree-one map.
Compute its `SO(2)` action class `α′ ∈ H₁(Ω²S²; ℤ)` and prove it nonzero by identifying it with
the cycle `(σ_p)_*[Σ′_p]` of Remark 6.19. Under `β_* : H₁(Ω²S²) → H₂(ΩS²)`, identify the class
with the Pontryagin square `x²` of the generator `x` of `H₁(ΩS²)`. Then compare the `SO(3)` action
class in `H₃(Map(S², S²); ℤ)` with `σ_*[Σ′]`, including orientation choices and the evaluation
shriek map. This is the worked instance of the general action and shriek construction. *Needs:*
4.1, 4.2 (Remark 6.19's cycle), 1.2, DGFloer Layer 2, Layer 5 items 4–5, Layer 10 item 2,
AlgebraicTopology Stages 2 and 6 (`or_M` and twisted fundamental classes), Tau Ceti
`LocalCoefficientSystem` and `TauCeti.RankOneLocalSystem` (the rank-one twists), LieGroups
Layer 2.

**Checks.**
- `G = SO(3)`, `H = SO(2)`, `M = S²`: `j_! : H₃(SO(3)) → H₁(SO(2))`, `[SO(3)] ↦ [SO(2)]`;
  `β ∈ H₃(Map(S², S²))` with `j_!β = α′ ∈ H₁(Ω²S²)`, of positive degree `1 = dim H + deg α`.
- `x² ≠ 0` in `H₂(ΩS²)` by 1.2's polynomial ring; a graded-commutative model would make `α′` map
  to zero and the Check would fail.
- `G = SO(3)`, `H = O(2)`, `M = ℝP²` nonorientable: the reflection component of `H` acts on
  `T_(eH)M` with `χ = −1`, and its fibre coorientation relative to the left-invariant
  orientation of `O(2)` is also `−1`, so `j_![G]_τ` is the full left-oriented cycle `[O(2)]` on
  both components; an untwisted shriek would count the two components with opposite signs.
- `H` finite (dimension `0`) is excluded: `(Φ_H)_*([H] × α)` would have the degree of `α`, the
  shriek would have degree `0` and the reduced condition could fail; the hypothesis
  `dim H > 0` is part of the statement.
- `M = ℝP²`: the two components of `O(2)` carry the degree-`1` class `α` to the components of
  degrees `1` and `−1` of `Ω²ℝP² ≅ Ω²S²`, so the hypothesis holds; the conclusion is
  `c°_HZ(D*ℝP²) < ∞`, and a reading of Proposition 6.36 that concluded abundance here would assert
  a property that Definition 6.11 does not define for a nonorientable manifold.

### 4.5 Projective spaces and Theorem I

Prove Proposition 6.38 (`CPᵈ`, `d ≥ 1`) and the quaternionic half of Proposition 6.39 (`HPᵈ`,
`d ≥ 1`) from Layer 2: the sphere families of 2.6 are fibered families of 2-spheres, because
`β_*(σ_p)_*[Σ_p]` is `±g ≠ 0` in `H_(2d)(ΩCPᵈ)`, respectively `±2g ≠ 0` in the torsion-free group
`H_(4d+2)(ΩHPᵈ)`, so `(σ_p)_*[Σ_p] ≠ 0` and Proposition 6.15 applies. Together with 4.1–4.3 this
is **Theorem I** within the scope boundary: spheres, sphere bundles over highly connected bases,
compact connected Lie groups other than tori, manifolds that are not aspherical and are covered
by diffeomorphisms (Proposition 6.29) or are `ℓ`-covered with `π₂ ≠ 0` or with a first nonzero
`π_k`, `k ≥ 3`, that is not `ℓ`-torsion (Proposition 6.33), `CPᵈ`, `HPᵈ`, and products of any
of these with a closed oriented manifold (Proposition 6.13, 4.1). Proposition 6.36 (4.4) adds
the orientable homogeneous spaces satisfying its hypothesis, which the source's Theorem I does
not list. Every manifold on these lists has `c°_HZ(D*Q) < ∞` by Theorem H, for every Riemannian
metric: for two metrics, `D*Q` of the first lies in a fibrewise dilate `λ·D*Q` of the second,
both retract onto the zero section, so a loop in the first that is contractible in the second is
contractible in the first and the capacity of the first is at most that of the second, and the
dilation by `λ` pulls the symplectic form back to `λ·ω`
(`TauCeti.CotangentBundle.mpullback_vectorBundleScalarDiffeomorph_symplecticForm`), so that
`c°_HZ(λ·D*Q) = λ·c°_HZ(D*Q)` by the invariance and conformality of the capacity
(`TauCeti.SmoothTwoForm.IsNondegenerate.contractibleHZCapacity_image`,
`TauCeti.SmoothTwoForm.IsNondegenerate.contractibleHZCapacity_smul`).

In `Suggested.lean` the finiteness of the capacity is stated on Tau Ceti's carriers
(`TauCeti.CotangentBundle.symplecticForm`, `TauCeti.CotangentBundle.codiscBundle`,
`TauCeti.SmoothTwoForm.contractibleHZCapacity`), for every smooth Riemannian metric given by
Mathlib's `Bundle.RiemannianBundle` and `IsContMDiffRiemannianBundle`:
`contractibleHZCapacity_codiscBundle_lt_top_of_fiberedFamily` for a closed connected oriented `Q`
with a fibered family of 2-spheres, and
`contractibleHZCapacity_codiscBundle_lt_top_of_sphereBundle_even` and
`contractibleHZCapacity_codiscBundle_lt_top_of_sphereBundle_odd` for the sphere bundles of
Proposition 6.23, in the forms of 4.2;
`contractibleHZCapacity_codiscBundle_sphere_lt_top` for the unit sphere `Sⁿ ⊂ ℝⁿ⁺¹`, `n ≥ 2`;
`contractibleHZCapacity_codiscBundle_lt_top_of_covered` for a closed connected oriented `M` and
`ℓ > 0` with a class `A ∈ H_n(Diff(M); ℤ)`, for Tau Ceti's `C^∞` topology
`Diffeomorph.weakWhitneyTopology`, such that `ev_*A = ℓ[M]`, and either `π₂(M) ≠ 0` or the first
nontrivial `π_k(M)` has an element not annihilated by `ℓ` (for `ℓ = 1`, exactly that `M` is not
aspherical); `contractibleHZCapacity_codiscBundle_lieGroup_lt_top` for a compact connected Lie
group that is not aspherical; and `contractibleHZCapacity_codiscBundle_complexProjectiveSpace_lt_top`
and `contractibleHZCapacity_codiscBundle_quaternionicProjectiveSpace_lt_top` for Tau Ceti's
`TauCeti.ComplexProjectiveSpace` and `TauCeti.QuaternionicProjectiveSpace`, the former a real
manifold through `instIsManifoldRealComplexProjectiveSpace`, the restriction of scalars
(`IsManifold.restrictScalars`) of its complex structure. These are stated for every `d`: for
`d = 0` the space is a point, every admissible Hamiltonian vanishes and the capacity is `0`.
*Needs:* 2.6, 4.1, 4.2, 4.3, 4.4, 1.3, Tau Ceti `TauCeti.SmoothTwoForm.contractibleHZCapacity`,
`TauCeti.CotangentBundle.codiscBundle`, `Diffeomorph.weakWhitneyTopology`,
`TauCeti.CotangentBundle.mpullback_vectorBundleScalarDiffeomorph_symplecticForm`,
`TauCeti.SmoothTwoForm.IsNondegenerate.contractibleHZCapacity_image`,
`TauCeti.SmoothTwoForm.IsNondegenerate.contractibleHZCapacity_smul`.

**Checks.**
- `CP¹ = S²` and `HP¹ = S⁴`: the `CP¹` family is one orientation component of the `n = 2`
  family of 4.2, with class `±x²` against `±2x²` for both components; the `HP¹` family is the
  whole `n = 4` family, and the two classes are equal, `±2g`.
- The asphericity clause is not redundant: `T^r` is covered by diffeomorphisms through left
  translation (4.3) but is aspherical and not abundant (4.1), so a list that admitted every
  manifold covered by diffeomorphisms would contain a manifold with `c°_HZ(D*T^r) = ∞`;
  `S³ = SU(2)` is covered the same way, has `π₃ = ℤ`, and is in the list.
- `d = 0`: `CP⁰` and `HP⁰` are points; a point is a closed oriented `0`-manifold with
  `Map(S², pt) = pt`, and it is not abundant (no class of degree above `0` exists and the
  degree-`0` class has zero reduced shriek), so the propositions keep `d ≥ 1`; its capacity is
  `0`, so the capacity statements hold for `d = 0` without abundance.
- `S⁰` and `S¹` are excluded from the sphere statement: on `S¹ = T¹` the capacity is infinite, and
  on `S⁰`, two points, a Hamiltonian vanishing at one point and equal to any `a > 0` at the other
  is admissible, so the capacity is `∞` as well; `n ≥ 2` is needed.
- The condition `ℓ > 0` is needed: `A = 0` gives `ev_*A = 0 = 0·[M]` for every `M`, including
  `T^r`.
- `ℝPⁿ`: `ℝP³ = SO(3)` is a compact connected Lie group other than a torus, hence on the list;
  the nonorientable `ℝP² = SO(3)/O(2)` meets 4.4's hypothesis and gets `c°_HZ(D*ℝP²) < ∞` from its
  second conclusion, as the source's covering argument (Remark 6.2) also gives, but no abundance
  is claimed for it.

### 4.6 Knotted hypersurfaces and Theorem G

Let `Q` be a closed orientable `n`-manifold containing an embedded sphere `X = s(S^k)`, `k ≥ 2`,
and a closed orientable `(n−k)`-submanifold `Y` meeting `X` transversely in a single point, with
`Y` `ℓ`-connected for `ℓ = 2k − 2` (`k` even) or `ℓ = k − 1` (`k` odd), and with trivial normal
bundle. Prove **Theorem G** (= Theorem 7.1): for every continuous `φ : S → π⁻¹(Y) ⊂ T*Q` from a
closed orientable `(n−k)`-manifold `S` with `deg(π ∘ φ : S → Y) ≠ 0`, every hypersurface bounding
a relatively compact domain `U ⊇ φ(S)` has the contractible almost existence property. Route:
Proposition 7.5 (a class `α ∈ H_*(Q; i_Q^*𝓕)` with `i_(Q*)α = 0` and `j_(Y!)α` not torsion),
through Lemma 7.6 (triviality of the normal bundle of `Y` makes the basepoint shriek `j_!β` not
torsion in `H_*(Ω²Q)`, by injectivity of `H_*(Ω²S^k) → H_*(Ω²Q)` from the Pontryagin–Thom
collapse `Q → (Y × D^k)/(Y × ∂D^k)` of DGFloer Layer 1 item 5) and Lemma 7.7 (for an integer
`m ≥ 1`, the source's `d`, and `Y` `(m+1)`-connected, non-torsion of `j_!β` in `H_m(Ω²Q)`
transfers to `j_(Y!)s̃_*β`), then the cotangent criterion (DGFloer Layer 10 item 3) and the kernel
bound `ker π_(U!) ⊆ ker(d·j_(Y!))` with `d = deg(π ∘ φ)`. Lemma 7.7 is applied to the image `β`
of the class `α₀ ∈ H_*(Map(S², S^k))` of Example 6.16 (degree `3k − 3`, `k` even) or of
Proposition 6.34 (degree `2k − 2`, `k` odd), so `j_!β` has degree `m = 2k − 3` for even `k` and
`m = k − 2` for odd `k`: `m = 1` for `k = 2, 3`, `m ≥ 3` for `k ≥ 4`, and the hypothesis
`ℓ = m + 1` on `Y` is exactly the lemma's connectivity. The source states Lemma 7.7 for `m ≥ 2`
(p. 126) and applies it with these values (p. 127); prove it for every `m ≥ 1`. An
`(m+1)`-connected `Y` is simply connected, so the homological Serre spectral
sequence (DGFloer Layer 1 item 2) of `Ω²Q → P_(Q→Y)L₀Q → Y`, the restriction to `Y` of the
path-loop model `P_(Q→Q)L₀Q ≃ Map(S², Q)` of the evaluation fibration, has untwisted
`E²_(p,q) = H_p(Y; H_q(Ω²Q))`, which vanishes for `1 ≤ p ≤ m + 1`; no differential reaches or
leaves `E_(0,q)` for `q ≤ m`, and the fibre inclusion is an isomorphism on `H_i` for every
`i ≤ m`.

In `Suggested.lean` this is `hasContractibleAlmostExistence_of_knottedSphere`, on the carriers of
Theorem B (3.2): `Q` a compact Hausdorff smooth manifold modelled on `E`, `n = dim E`, with a
`TauCeti.HomologicalOrientation` and not assumed connected; `s` and `y` Tau Ceti
`TauCeti.SmoothEmbedding`s of the unit sphere `S^k ⊂ ℝ^(k+1)` and of a compact Hausdorff smooth
manifold `Y` modelled on a space `F′` of dimension `n − k`, oriented, with
`s(S^k) ∩ y(Y) = {s a} = {y b}`; transversality the equality of the sum of the tangent ranges
`TauCeti.SmoothEmbedding.tangentRange` at `a` and at `b` with the whole tangent space of `Q`;
`ℓ`-connectivity of `Y` path connectedness with `π_j(Y, b)` trivial for `1 ≤ j ≤ ℓ`; triviality of
the normal bundle a linear Mathlib `Bundle.Trivialization` with base set all of `Y` and fibre
`ℝ^k` of Tau Ceti's intrinsic normal bundle `TauCeti.SmoothEmbedding.NormalSpace`, with its
quotient topology; `S` a compact Hausdorff smooth manifold modelled on `F′`, oriented, and
`φ : S → T*Q` continuous with `π ∘ φ = y ∘ g` for a continuous `g : S → Y` with
`g_*[S] = d[Y]`, `d ≠ 0`, in Mathlib's singular homology; and the hypersurface the regular level
`F⁻¹(c)` of a smooth `F : T*Q → ℝ` with compact sublevel sets, with `F ∘ φ < c`. *Needs:* 1.5,
DGFloer Layer 1 items 2 and 5, Layer 3, Layer 5 items 4–5, Layer 10 items 3–4, GeometricTopology
Layer 1 (hypersurfaces, collars), AlgebraicTopology Stage 6, Tau Ceti
`TauCeti.SmoothEmbedding.tangentRange`, `TauCeti.SmoothEmbedding.NormalSpace`,
`TauCeti.SmoothTwoForm.HasContractibleAlmostExistence`, Mathlib `Bundle.Trivialization`,
`AlgebraicTopology.singularHomologyFunctor`.

**Checks.**
- Example 7.4: `Q = Q′ # (S^k × Y)` with `Y` closed orientable and `(2k−2)`-connected,
  `X = S^k × {q}`, `Y = {p} × Y` away from the connected-sum ball: transverse single intersection,
  trivial normal bundle, and the connectivity hypothesis holds for both parities of `k`.
- Dimension bounds: for `k < n`, so that `dim Y = n − k > 0`, the closed connected orientable `Y`
  has `H_(n−k)(Y; ℤ) = ℤ`, and `ℓ`-connectivity with Hurewicz forces `n − k ≥ ℓ + 1`, that is
  `n ≥ 3k − 1` for even `k` and `n ≥ 2k` for odd `k`. For `k = n` the embedded sphere `X` is a
  whole component of `Q`, a copy of `Sⁿ`, and `Y` is a point, which is `ℓ`-connected for every
  `ℓ`; the hypotheses hold and the bound fails, so the bound is not a consequence of the
  hypotheses there (the source states it without excluding `k = n`, §7 before Theorem 7.1).
  The conclusion still holds for `k = n`: the component `Sⁿ` is abundant (4.2–4.3), so Theorem H,
  monotonicity and the dilation argument of 4.5 make the capacity of every relatively compact
  domain of `T*Sⁿ` finite, which gives almost existence on the levels `F⁻¹(c′) ∩ T*Sⁿ` (DGFloer
  Layer 6 item 5), nonempty because `φ(S)` lies over the point `Y`. `k = 1` is excluded by `k ≥ 2`.
- `Q` need not be connected: `φ(S)`, `X` and the path-connected `Y` lie over one component `Q₁`,
  and a closed characteristic of `F⁻¹(c′) ∩ T*Q₁` contractible in `T*Q₁` is one of `F⁻¹(c′)`
  contractible in `T*Q`, so the statement for `Q` follows from that for `Q₁`. In Theorem B's last
  Check, by contrast, the base point carrying `π₂ ≠ 0` and the domain lie over different
  components, and the statement fails without connectedness.
- `d ≠ 0` is needed: on `Q = T⁶ ⊔ (S² × S⁴)` (`k = 2`, `Y = {p} × S⁴`, which is `2`-connected),
  `S = ∅` has `g_*[∅] = 0 = 0·[Y]`, and `F = |ξ|²` on `T*T⁶` for the flat metric, `F = |ξ|² + 2`
  over `S² × S⁴`, with `c = 1`, satisfies every other hypothesis; the levels near `1` are flat
  cosphere bundles of `T⁶`, whose closed characteristics are closed geodesics, none contractible.
- `Q = Tⁿ # (S^k × Y)` as in Example 7.4, `k ≥ 3`, for instance `T⁸ # (S³ × S⁵)`: `π₁(Q) = ℤⁿ`,
  and the universal cover, `ℝⁿ` with a copy of `(S^k × Y) − ball` attached at each point of
  `ℤⁿ`, is `(k−1)`-connected with `H_k` free on the lifts of `S^k × {q}`; so `π₂(Q) = 0`, and by
  Hurewicz `π_k(Q)` has elements of infinite order, so Theorem B's hypothesis on `Q` holds, while
  its hypothesis that `H_n(U) → H_n(Q)` be nonzero is what Theorem G drops: it needs only
  `φ(S) ⊂ U`. `Q` is rationally essential (the collapse `Q → Tⁿ` has degree `1`), and the source
  knows no technique, its own included, that gives `c°_HZ(D*Q) < ∞` (Example 7.4), so Theorem H
  is not available. Rational essentiality is not rational asphericity: reading it as
  `π_j(Q) ⊗ ℚ = 0` for every `j ≥ 2`, that is as `Q` being a rational `K(π, 1)`, would put this
  `Q` outside Theorem B's hypothesis on `Q`, whereas `π_k(Q) ⊗ ℚ ≠ 0` as computed above.
- Lemma 7.7's degree on `T⁸ # (S³ × S⁵)`: `k = 3` is odd, `α₀` has degree `2k − 2 = 4` and
  `j_!β` degree `m = k − 2 = 1`, and `Y = S⁵` is `4`-connected, more than the `ℓ = m + 1 = 2`
  required. `H₁(S⁵) = H₂(S⁵) = 0`, so `E²_(1,0) = E²_(2,0) = 0`, nothing reaches `E_(0,1)`, and
  `H₁(Ω²Q) → H₁(P_(Q→Y)L₀Q)` is an isomorphism. A version of Lemma 7.7 for `m ≥ 2` only, as the
  source prints it, would leave Theorem G unproved for `k = 2, 3`, this example included; for
  `k = 4` the degree is `m = 5` and `Y` must be `6`-connected.

### Examples

- `S²`, `S³ = SU(2)`, `S^(4k−1)`, `SO(3)`, `U(n)` for `n ≥ 2`, `CPᵈ`, `HPᵈ`, and `T^r`
  (including `U(1)`) as the non-example, as in the Checks above.
- `ℝP² = SO(3)/O(2)`: finite capacity through 4.4's second conclusion, without abundance.
- `Q = Tⁿ # (S^k × Y)` for Theorem G.

### Dependencies

Layers 1–3; DGFloer Layer 1 items 1–2, 5–6, Layers 2–3, Layer 5 items 2–5, Layer 10 items 2–5,
Layer 11; GeometricTopology Layers 1 and 3; GeneralAlgebraicKTheoryPartII §4.30b (through 1.2);
AlgebraicTopology Stages 2, 6, 8.1–8.7, Stage 4 item 5 and Stage 8 items 7 and 11a;
GeneralizedCohomology G4.0b;
RiemannianGeometry R1–R3 and MorseTheory M5 (4.2c);
SmoothBundlesConnections B1.4, B2.2 and B2.5; LieGroups Layer 2; Tau Ceti `IsAspherical`, `LocalCoefficientSystem`, `HomotopyGroup.map`,
`HomotopyGroup.pathLoopSpaceMulEquiv`, `TauCeti.subsingleton_homotopyGroup_sphere_of_lt`,
`TauCeti.homotopyGroupSphereAddEquiv`, `TauCeti.MooreLoopSpace.doubleFirstHomologySphereAddEquiv`
(4.2), `TauCeti.HomologicalOrientation` (4.2–4.6), `TauCeti.SmoothTwoForm.contractibleHZCapacity`,
`TauCeti.CotangentBundle.codiscBundle`, `Diffeomorph.weakWhitneyTopology`,
`TauCeti.ComplexProjectiveSpace`, `TauCeti.QuaternionicProjectiveSpace`,
`TauCeti.realClifford_classification`, `TauCeti.continuousOrthogonalToDiffSphere`,
`IsCoveringMap.homotopyGroupPiMulEquiv`, `TauCeti.stiefel` (4.3), the fibre dilation and
capacity statements of 4.5,
`TauCeti.SmoothEmbedding.tangentRange` and `TauCeti.SmoothEmbedding.NormalSpace` (4.6); Mathlib
`HomotopyGroup.Pi`, `IsOfFinOrder`, `Matrix.orthogonalGroup`, `Matrix.specialOrthogonalGroup`,
`Matrix.unitaryGroup`, `Bundle.RiemannianBundle`, `Bundle.Trivialization` (4.2, 4.6), `FiberBundle`,
`VectorBundle` and `IsContinuousRiemannianBundle` (4.2). Sources: the source paper §§6.3–6.4 and §7;
Milnor, *Morse Theory*, §§22–24; Bott, *The stable homotopy of the classical groups*;
Crowley, Schick, Steimle, proof of Lemma 2.2; Hatcher, *Algebraic Topology*, §4.2 and Proposition 4.48.

## Downstream consumers

- TopologicalKTheory can consume 4.2a–4.2c in T7, its real `K`-theory: the stable `O` for its
  loop comparison `ΩBO ≃ O`, the Grassmannian member `Ω₇` with its stabilization for its
  comparison with `ℤ × BO`, and the eight stable Bott maps with real Bott periodicity for the
  periodicity of `KO`. Those comparisons with `BO` are TopologicalKTheory's, and nothing in this
  roadmap uses them. It cannot consume 4.2a–4.2c in T1.5–T1.6 or in T2's `K` and `KO` groups:
  GeneralizedCohomology G4.0a–G4.0b consume those sections, and 4.2a–4.2b consume G4.0b for
  `Sp(r)` and the quaternionic Grassmannians of the Clifford chain.
- The base roadmap consumes nothing from this one.

## Worked examples

1. **`S² = SO(3)/SO(2)`, end to end.** The `SO(2)` action class `α′ ∈ H₁(Ω²S²; ℤ)` of a
   degree-one map is nonzero, `π₀ Map_*(S², S²) ≅ ℤ` (the base roadmap's mapping-space
   example), and the kernel of `i_(S²*)` contains `ℤ` in degree zero; so `S²` is abundant with
   2-spheres by 4.4, and `∂U` has the contractible almost existence property for every bounded
   `U ⊆ T*S²` containing the zero section, as the base roadmap's Theorem A also gives.
2. **The rotation family for `n = 1`** as in 1.4: degree `2 = 1 + (−1)⁰` with the boundary
   orientation of `S⁰`.
3. **Multiple realization on a torsion class.** For `α` of finite order `N`, 3.1 may return
   `S = ∅` with `f_*[∅] = 0 = Nα`; Theorem B's hypothesis `π_(U*)α = b[Q] ≠ 0` excludes this
   because `[Q]` has infinite order; the construction and the hypothesis are stated so that this
   is literally what happens.
4. **Projective generators.** For `CP¹`, Layer 2's cell degrees are `a_k = 2k − 1` and
   `b_k = 2k`, `H_*(ΩCP¹) ≅ H_*(ΩS²)` in every degree, the calibrated generator of `H₂(ΩCP¹)` is
   `x²`, and `β_*(σ_p)_*[Σ_p] = ±x²`, while the full `n = 2` Stiefel family of 4.2 gives `±2x²`.

## Source coverage

This section records where each numbered statement of the source paper within this roadmap's
scope lands, so that a reader can check that nothing is missing.
Numbers follow arXiv:2404.07953v3.

| Source statements | Target |
| --- | --- |
| Thm B | 3.2 (Thm 5.14): the multiple-realization application and Theorem 5.10 of the base roadmap |
| Cor D, E, Theorem B forms | 3.3, through DGFloer Layer 6 items 3–4 |
| Thm G | 4.6 (Thm 7.1) |
| Def 1.7, Thm H | 4.1 (Def 6.11, Thm 6.12) |
| Thm I | 4.1–4.5, without `CaP²`; the homogeneous spaces of Prop 6.36 added in 4.4 |
| Thm 5.14 | 3.2 |
| Def 6.11, Thm 6.12, Prop 6.13 | 4.1 |
| Def 6.14, Props 6.15, 6.17, 6.18, 6.21, 6.23 | 4.2 (degree computation 1.4; the James ring 1.2) |
| Defs 6.26, 6.32, Props 6.29, 6.33 | 4.3 (evaluation fibration DGFloer Layer 1 item 6) |
| Prop 6.31 | 4.3, from the finite cover and torus criterion of DGFloer Layer 11 |
| Prop 6.34 | 4.3, both the Lemma 6.35 proof and the rotation-family proof (1.4) |
| Lem 6.35 | 4.3, low ranks and the stable-plus-Stiefel splitting, with the stable term from 4.2a–4.2c; used by the first proof of Prop 6.34 |
| Prop 6.36, Ex 6.37 | 4.4 |
| Props 6.38, 6.39 | 4.5, consuming Layer 2; without `CaP²` |
| Thm 7.1, Prop 7.5, Lems 7.6, 7.7 | 4.6 (collapse DGFloer Layer 1 item 5, compared in 1.5) |

## References

- J.-F. Barraud, M. Damian, V. Humilière, A. Oancea, *Floer homology with DG coefficients.
  Applications to cotangent bundles*, [arXiv:2404.07953](https://arxiv.org/abs/2404.07953) (v3):
  the source paper.
- J.-F. Barraud, M. Damian, V. Humilière, A. Oancea, *Morse homology with differential graded
  coefficients*, Progress in Mathematics 360, Birkhäuser, 2025 (BDHO): Layer 2 and the DG Morse
  inputs of Layer 4.
- R. Bott, *The stable homotopy of the classical groups*, Ann. of Math. 70 (1959): Layer 2 and
  4.2c; W. Ziller, *The free loop space of globally symmetric spaces*, Invent. Math. 41 (1977):
  Layer 2.
- J. Milnor, *Morse Theory*, Annals of Mathematics Studies 51, Princeton, 1963, §§22–24: the
  Clifford chain, its index bounds and real Bott periodicity in 4.2b–4.2c.
- J.-H. Eschenburg, B. Hanke, *Bott periodicity, submanifolds, and vector bundles*,
  [arXiv:1610.04385](https://arxiv.org/abs/1610.04385), §§2–4: the iterated centrioles of 4.2b
  and the index estimate of 4.2c.
- N. P. Strickland, *The category of CGWH spaces*, expository notes, 2009, Propositions 2.6, 2.11,
  2.12 and 2.20 and §5 (Propositions 5.1 and 5.7, Corollary 5.8); C. Rezk, *Compactly generated
  spaces*, notes (version of January 2025), Propositions 7.3, 8.6, 8.8 and 9.2, on k-spaces: the
  convenient category of 1.0.
- L. S. Pontryagin, *Smooth manifolds and their applications in homotopy theory*, Amer. Math.
  Soc. Transl. (2) 11 (1959), Chapter II: the framed collapse compared in 1.5.
- D. Crowley, T. Schick, W. Steimle, *The derivative map for diffeomorphism of disks: an example*,
  [arXiv:2012.13634](https://arxiv.org/abs/2012.13634), proof of Lemma 2.2: the value of
  `π₈(SO(9))` in 4.3.
- J. Milnor, J. Stasheff, *Characteristic Classes*, Annals of Mathematics Studies 76, Princeton,
  1974, Chapter 5; N. Steenrod, *The Topology of Fibre Bundles*, Princeton, 1951, Part I, §7:
  Stiefel manifolds and frame quotients in Layer 1.
- A. Hatcher, *Algebraic Topology*, Cambridge, 2002, Theorem 3.26, §4.2 with Proposition 4.48,
  §4.J and Appendix, Theorem A.6: the top homology of a closed manifold (3.2), fibration
  sequences, the homotopy lifting of fibre bundles over any base used for the sphere bundles of
  4.2, the homotopy groups of Lie groups and Stiefel manifolds used in 4.2a and 4.3, the James
  construction, and products of CW complexes (1.0).
