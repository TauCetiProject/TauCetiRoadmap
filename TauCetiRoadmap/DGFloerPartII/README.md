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
other than tori, manifolds covered by diffeomorphisms, homogeneous spaces, and the complex and
quaternionic projective spaces); and **Theorem G**, on knotted hypersurfaces in cotangent
bundles. These applications rest on the structured Pontryagin–Thom and rational bordism theory
of TangentialBordism, on the convenient spaces, James construction and stable real Bott
periodicity of HomotopySpheres, and on the complex projective carrier and Fubini–Study form of
ComplexKahlerGeometry; both TangentialBordism and HomotopySpheres consume the base roadmap, so
the applications live here and the base need not consume them back. The homogeneous carriers,
explicit degree computations and projective loop-space calculations that only these
applications use are built here, in Layers 1 and 2. Nothing here is consumed by the base
roadmap.

Suggested homes:

| Layers | Home |
| --- | --- |
| 1 | `TauCeti/AlgebraicTopology/` and `TauCeti/Geometry/Manifold/Homogeneous/` |
| 2 | `TauCeti/Geometry/Manifold/Morse/Bott/` |
| 3–4 | `TauCeti/Geometry/Symplectic/Hamiltonian/AlmostExistence/` |

## Scope and ownership

**In scope.** The source paper's Theorem B (Theorem 5.14) with the Theorem B forms of
Corollaries D and E, every numbered statement of its §§6.3–6.4 and §7, and the carriers,
comparisons and explicit maps those statements consume. The [source coverage](#source-coverage)
section assigns each of them to a layer. The base roadmap, cited as **DGFloer** by layer and
item, owns every other numbered statement of the source and its standing conventions; an
unqualified "Layer `k`" or "`k.n`" refers to this roadmap.

**Owned here.** This roadmap owns everything it states that the table below does not assign
elsewhere. In particular it owns:

- the comparison of the base roadmap's raw compact-open path, loop and mapping carriers with the
  convenient carriers of HomotopySpheres Stage 3A, and the based sphere's comparison with its
  categorical reduced suspension (1.1–1.2);
- the real and complex orthonormal-two-frame quotient comparisons, the projective quotient
  comparisons, the unit-round Hopf metrics with their curvature, period and totally geodesic
  statements, the quaternionic vector fields on `S^(4k−1)`, and the Fubini–Study form comparison
  (1.3);
- the Stiefel-domain map of Proposition 6.17 and the rotation family of the second proof of
  Proposition 6.34, lifted to `SO(n+1)`, with their degrees (1.4);
- the comparison of the base roadmap's Pontryagin–Thom collapse with HomotopySpheres' Euclidean
  collapse (1.5);
- the based-loop Morse–Bott energy on `CPᵈ` and `HPᵈ`: critical manifolds, negative bundles,
  integral perfectness, calibrated generators, the path-loop total-space comparison and the
  primary and mixed-bidegree differentials (Layer 2);
- the multiple-realization application and Theorem B (Layer 3);
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
| Structured Pontryagin–Thom, the rational oriented-bordism orientation surjection with geometric preimages | TangentialBordism B5, B6.3 | consumed by 3.1 |
| Convenient pointed spaces, the James map, stable real Bott periodicity and the stable orthogonal groups, the Euclidean framed collapse | HomotopySpheres Stages 3A, 3B, 4A–4B, 5 | consumed by Layers 1 and 4 |
| The rational spectral Hurewicz theorem, the designated quaternionic and `HPᵈ` carriers, the base cell, cup and Thom classes | GeneralizedCohomology G4.0b, G4.3–4.5, G5 | consumed by 1.3, 2.5, 3.1 |
| The complex projective carrier, its atlases and orientation, the Fubini–Study form | ComplexKahlerGeometry K7.1–K7.2 | consumed by 1.3 |
| Proper free-action quotients, principal projections, tangent quotients, fibre metrics and structure-group reductions, the first Chern class and rank-one Chern–Weil | SmoothBundlesConnections B1.4, B2.2, B2.5, B6.2–B6.3 | consumed by 1.3 and 4.2 |
| The closed-subgroup theorem and the real and complex matrix groups | LieGroups Layer 2 | consumed by 1.3 |
| The round Hopf metrics, Jacobi fields, the index form and the based-loop sphere calculation | RiemannianGeometry R1–R3 | consumed by Layer 2 |
| Morse–Bott normal bundles, compact-band attachments and the orientation-system Thom comparison | MorseTheory M5 | consumed by Layer 2 |
| Tubular neighbourhoods, collars, `Diff(M)` with the `C^∞` topology, the inclusion `O(n+1) → Diff(Sⁿ)` | GeometricTopology Layers 1 and 3 | consumed by Layers 3–4 |
| Local coefficient systems, fundamental classes, the orientation local system, the reduced-suspension sphere models, the Hurewicz map | AlgebraicTopology Stages 2, 4, 6, 8 | consumed by Layers 1 and 4 |
| Smooth partitions of unity and smooth approximation on `[T2Space M] [SigmaCompactSpace M]` | Mathlib `SmoothPartitionOfUnity`, as DifferentialGeometry consumes them | consumed by 3.2 |
| The Brouwer degree | DifferentialGeometry Layer 10 | consumed by 1.4 through DGFloer's homological degree interface |
| The octonionic projective plane as a Riemannian manifold | none | the Cayley plane half of Proposition 6.39 is out of scope |

**Out of scope.**

- The Cayley plane in Proposition 6.39: it needs the octonionic projective plane as a
  Riemannian manifold, which no roadmap builds. The quaternionic half of Proposition 6.39 is in
  scope.
- Conjecture 1.2 and Corollary F, for the reasons stated in the base roadmap.
- General Lie theory, compact representation theory, stable Bott periodicity and rational
  bordism theory: these are consumed from the suppliers named below at their stated hypotheses.

## Conventions

The standing conventions of the base roadmap apply unchanged: normalized cubical chains, the
grading bridge, Moore loops with the fixed-interval comparison, the raw compact-open
mapping-space topology with its metrizable homeomorphism lane, coefficients, the Floer grading,
the sign dictionary, unbundled hypotheses and specified maps. In addition:

- **Convenient carriers.** The convenient internal hom of HomotopySpheres Stage 3A is
  compact-open followed by compact generation `k`. Every statement here about a convenient
  mapping space is made through the comparison of 1.1 with the base roadmap's raw carrier, and a
  homeomorphism is claimed only in the base roadmap's compactly generated lane.
- **Orientations of homogeneous carriers.** A frame carrier `SO(n)/SO(n−2)` or `U(n)/U(n−2)` is
  oriented through its quotient comparison of 1.3 from left-invariant orientations of the
  groups; a homogeneous quotient `G/H` from a left-invariant orientation of `G` and the chosen
  orientation of `H`; and the evaluation-pullback orientation system `ev*or_M` is used wherever
  `M` is not assumed orientable (4.4).
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
  (`Mathlib/Topology/Homotopy/HomotopyGroup.lean`), and `IsOfFinOrder`
  (`Mathlib/GroupTheory/OrderOfElement.lean`): the carriers of the statements of 4.3 in
  `Suggested.lean`.
- `Matrix.orthogonalGroup` and `Matrix.specialOrthogonalGroup` (`Mathlib/LinearAlgebra/UnitaryGroup.lean`),
  with the subtype topology of the matrix space; `LieGroup`; `Quaternion`.
- `EuclideanSpace`, `Metric.sphere`, `Circle`, the compact-open topology
  `ContinuousMap.compactOpen` on `C(X, Y)` (`Mathlib/Topology/CompactOpen.lean`).
- `SmoothPartitionOfUnity` and `exists_contMDiffMap_zero_one_of_isClosed`
  (`Mathlib/Geometry/Manifold/PartitionOfUnity.lean`), on `[T2Space M] [SigmaCompactSpace M]`:
  the cutoffs and smoothing of 3.2.

### From Tau Ceti

- `TauCeti.IsAspherical` (`TauCeti/AlgebraicTopology/EilenbergMacLane/Basic.lean`): a based
  space is aspherical when it is path connected and every `π_(n+2)` is trivial. It is the
  hypothesis form of Propositions 6.29 and 6.33 and of the torus criterion.
- `HomotopyGroup.pathLoopSpaceMulEquiv` (`TauCeti/Topology/Homotopy/HomotopyGroup/LoopSpace.lean`):
  the loop-space shift `π_m(ΩX) ≃* π_(m+1)(X)`.
- `LocalCoefficientSystem` and twisted singular homology
  (`TauCeti/AlgebraicTopology/LocalCoefficient.lean`): the twisted homology of 4.4.

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
  Brown resolution of item 5.
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
preimages and its singular-CW comparison). Consumed by 3.1 together with GeneralizedCohomology
G5; DGFloer's Layer 1 inputs precede their construction. No whole-roadmap dependency is imposed.

### From TauCetiRoadmap.HomotopySpheres

- Stage 3A (3A.1–3A.2): pointed compactly generated spaces, the compact-generation adjunction,
  pointed cones and the suspension–loop adjunction, with the comparison homeomorphisms to
  ordinary spaces, consumed by 1.1 and 1.2.
- Stage 3B.3: the James map and the tensor-algebra computation of `H_*(ΩΣX)`, used for the ring
  `H_*(ΩSⁿ)` in 4.2 through the sphere comparison of 1.2.
- Stage 4B.2–4B.5: the geodesic normalization, finite broken geodesics, normal Hessians with
  negative bundles and energy-band attachments of the Bott chain. Their Bott-chain applications
  stay there; Layer 2 compares with them where the examples overlap.
- Stages 4A–4B (4A.1, 4B.8): stable real Bott periodicity and the stable orthogonal-group
  calculation, consumed by 4.3 for the stable term of Lemma 6.35, not for the unstable groups
  `SO(n)`.
- Stage 5 (5.0, 5.1.3): the framed Pontryagin–Thom collapse from a chosen normal tube and framing
  in a Euclidean ambient space and the comparison of collapse representatives; 1.5 compares it
  with DGFloer Layer 1 item 5's collapse.

### From other roadmaps

- **GeneralizedCohomology.** G4.0b: the designated quaternionic `Sp(n)` carrier, the
  quaternionic frame, Grassmannian and `HPᵈ` carriers with their smooth Hopf comparisons
  (consumed by 1.3). G4.0 and G4.3–4.5: the base cell, cup and Thom classes on the designated
  projective carriers (consumed by 2.5). G2.10: the mapping-path replacement and raw lifting
  maps (consumed by 1.1). G5: the rational spectral Hurewicz theorem, with the designated
  ordinary and spectral Thom carriers and the collapse and finite-duality comparisons (consumed
  by 3.1, together with TangentialBordism B5 and B6.3, which consume the same G2.10 and Thom
  inputs).
- **ComplexKahlerGeometry** [K7.1–K7.2](../ComplexKahlerGeometry/README.md#k7-projective-torus-and-hopf-examples).
  K7.1: the single complex projective carrier, its complex and real atlases and orientation.
  K7.2: the normalized Fubini–Study form, used only in the form comparison of 1.3.
- **LieGroups** [Layer 2](../RepresentationTheory/LieGroups/README.md): the closed-subgroup
  theorem and the real and complex matrix groups, consumed by 1.3.
- **SmoothBundlesConnections** [B1.4](../SmoothBundlesConnections/README.md#b14-slices-quotients-and-homogeneous-spaces):
  proper free-action smooth homogeneous quotients, principal projections and tangent quotients,
  the single generic quotient owner for 1.3; B2.2: fibre metrics; B2.5: frame bundles and
  reductions of the structure group (the unit-sphere bundle of 4.2); B6.2–B6.3: the first Chern
  class and rank-one Chern–Weil, inputs of the Fubini–Study form comparison of 1.3.
- **RiemannianGeometry** [R1–R3](../RiemannianGeometry/README.md): R1 the round Hopf projective
  metrics; R2 Jacobi initial-value and endpoint-exponential comparisons; R3 the index form, the
  finite node-value reduction and its based-loop sphere calculation, including `ΩS²` at radius
  `1/2`. Layer 2 constructs the projective applications on those carriers.
- **MorseTheory** [M5](../MorseTheory/README.md): the compact-band Morse–Bott parameter lemma,
  negative normal bundles, disc attachment and the orientation-local-system Thom comparison,
  consumed by Layer 2 on the finite approximations to the based loop spaces.
- **GeometricTopology** [Layers 1 and 3](../GeometricTopology/README.md): Layer 1 tubular
  neighbourhoods with a positive uniform radius on a compact core (3.2) and the hypersurface and
  collar vocabulary (4.6); Layer 3 `Diff(M)` as a topological group with the `C^∞` topology, the
  smooth-families map and the inclusion `O(n+1) → Diff(Sⁿ)` (4.3).
- **AlgebraicTopology** [Stages 2, 4, 6 and 8](../AlgebraicTopology/README.md): Stage 4.4 the
  based circle and sphere models, `reducedSuspensionSphereHomeomorph` and the compact
  reduced-suspension carrier comparison (1.2); Stages 2 and 6 local coefficient systems,
  fundamental classes, the orientation local system and its transport (4.2–4.4); Stage 8.1–8.7
  the Hurewicz map (4.3).
- **DifferentialGeometry** [Layer 10](../DifferentialGeometry/README.md): the Brouwer degree,
  only through DGFloer's homological degree interface (1.4). Its partitions of unity and smooth
  approximation are Mathlib's, consumed directly by 3.2.

## How to read the build

Layer 1 builds the carriers and comparisons first: the convenient and sphere comparisons from
the base roadmap's Layer 2 and HomotopySpheres' convenient spaces, the frame and projective
quotients from SmoothBundlesConnections, LieGroups, ComplexKahlerGeometry and
GeneralizedCohomology, and the explicit degree computations from the base roadmap's degree
interface. Layer 2 is finite-dimensional Morse–Bott theory on those carriers and consumes
RiemannianGeometry R1–R3 and MorseTheory M5 without touching Floer theory. Layer 3 consumes
GeneralizedCohomology G5 and TangentialBordism B5 and B6.3 together with the base roadmap's
Theorem A. Layer 4 consumes the base roadmap's DG Morse homology, fibration theorem, shriek maps
and Theorems M, A and C, the carriers of Layers 1–2 and the named supplier inputs; it needs no
Floer counts of its own. Each layer ends with its examples and its dependencies; a `*Needs:*`
line lists what a target's statement and route need, item by item, so that a different proof
route is not blocked behind an unrelated layer.

## Layer 1: carriers, comparisons and explicit maps

These are the carriers and explicit maps that Layers 2 and 4 consume. They rest on the base
roadmap's Layers 1–2 and on the suppliers named above.

### 1.1 Convenient carriers

The HomotopySpheres Stage 3A convenient internal hom is compact-open followed by compact
generation `k`. Construct the comparison map from the convenient carrier to the base roadmap's
raw carrier, using the counit `kZ → Z` and the compact-Hausdorff test and currying maps, and
prove that it induces isomorphisms on based homotopy groups and on singular and cubical chains,
and that it is compatible with endpoints, cap and reference maps, constant sections and path
composition. Convenient multiplication uses `k`-products: state the hypothesis under which an
ordinary product of `k`-spaces is already a `k`-space (one factor locally compact Hausdorff)
and keep it explicit in every parameter-family transport. These weak comparisons do not produce
Hurewicz lifts or fibre homotopy equivalences; those come from GeneralizedCohomology G2.10's
raw lifting maps and the explicit Moore replacement maps and homotopies of DGFloer Layer 2.
*Needs:* HomotopySpheres 3A.1–3A.2, DGFloer Layer 2 items 1–3, GeneralizedCohomology G2.10,
Mathlib `ContinuousMap.compactOpen`.

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
and its reference generator. Construct this sphere's based comparison to HomotopySpheres
3A.1–3A.2's categorical reduced suspension: the raw interval-product quotient is compact
Hausdorff and hence already compactly generated; apply 3A.1's colimit-preserving inclusion to
3A.2's pointed quotient and pushout cocone, then use the quotient universal properties and the
fully faithful inclusion to construct the isomorphism with the `k`-ified raw quotient, and prove
its quotient-map and basepoint diagrams. Compose it with Stage 4.4's raw-to-`k`-ification
counit comparison and verify the interval-last and reference-generator diagrams. Through this
comparison, HomotopySpheres 3B.3's James map and tensor-algebra computation of `H_*(ΩΣX)` give
the Pontryagin ring `H_*(ΩSⁿ)`, `n ≥ 2`, as a polynomial ring `ℤ[x]` on one generator `x` of
degree `n − 1` for the based fixed-interval loop carrier (Proposition 6.18; Hatcher §4.J);
transport it to the base roadmap's Moore-loop carrier through its standing Moore comparison, as
a ring under the cubical cross product and Moore concatenation. 4.2 consumes this ring.
*Needs:* AlgebraicTopology Stage 4.4, HomotopySpheres 3A.1–3A.2 and 3B.3, DGFloer Layer 0 and
Layer 2 item 1, 1.1.

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

### 1.3 Homogeneous examples on designated carriers

Consume SmoothBundlesConnections B1.4 for proper free-action smooth quotients, principal
projections and tangent quotients, and LieGroups Layer 2 for the real and complex closed matrix
subgroups. Consume ComplexKahlerGeometry K7.1 for its complex projectivization atlas and real
restriction, GeneralizedCohomology G4.0b for the designated `Sp`, quaternionic frame,
Grassmannian and `HP` carriers and smooth Hopf comparisons, and RiemannianGeometry R1 for the
normalized quotient metrics. Keep the supplied topologies, smooth structures and explicit
quotient comparisons; what is built here is the identification between them.

- **Real frames.** For `n ≥ 3` construct the ordered orthonormal-two-frame identification
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
  `U(d+1)/(U(1) × U(d)) → CPᵈ` to `[g] ↦ [g e₀]`, including subgroup blocks, basepoint,
  principal local sections and agreement with K7.1's complex orientation. On
  GeneralizedCohomology's designated `HPᵈ` carrier pin its `Sp(d+1)/(Sp(1) × Sp(d))` comparison
  to `[g] ↦ [g e₀]_ℍ`. Its native projectivization uses right lines through `ℍᵐᵒᵖ`, with
  `v ∼ vλ`; compare the supplied charts on `v_i ≠ 0` with the right ratios `v_j v_i⁻¹` and the
  representative with `i`-coordinate `1`, and verify right-scaling invariance.
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
K7.1–K7.2, GeneralizedCohomology G4.0b, RiemannianGeometry R1, Mathlib `Matrix.orthogonalGroup`,
`Matrix.specialOrthogonalGroup`, `Quaternion`.

**Checks.**
- Dimensions: `dim V_(n,2)(ℝ) = (n−1) + (n−2) = 2n − 3`, equal to `dim SO(n) − dim SO(n−2)`;
  `dim U(n)/U(n−2) = 4n − 4`; `dim CPᵈ = 2d` and `dim HPᵈ = 4d` from the quotient dimensions. A
  stabilizer `SO(n−1)` instead of `SO(n−2)` would give the sphere `S^(n−1)`, not the frame
  carrier.
- `n = 3`: `V_(3,2)(ℝ) ≅ SO(3)`, the unit tangent bundle of `S²`, connected; `n = 2`:
  `V_(2,2)(ℝ) = O(2)` has two components, so the connected quotient `SO(2)/SO(0) = SO(2)`
  describes only one of them, which is why the `n ≥ 3` identification is not extended to `n = 2`.
- Curvature and periods: on `CP¹` of radius `1/2` the great circles have length `π`, the
  sectional curvature is `4`, and the area is `π`, so `ω_g = π·ω_FS` with `∫ ω_FS = 1`; the
  radius-`1` normalization, in which `CP¹` is the unit sphere and the sectional curvature lies
  in `[1/4, 1]` (diameter `π`), would give period `2π` and area `4π`, and Layer 2's cell
  degrees would be unchanged but every energy value would be multiplied by `4`.
- On `S³ ⊂ ℍ` the three fields `Iz, Jz, Kz` are orthonormal and tangent at every `z`:
  `⟨z, Iz⟩ = 0` because `I` is skew, and `⟨Iz, Jz⟩ = ⟨z, I⁻¹Jz⟩ = ⟨z, −Kz⟩ = 0`. On `S^(4k+1)`
  no two pointwise independent tangent fields exist, so the construction needs `n ≡ 3 (mod 4)`.

### 1.4 Degrees of explicit maps

Construct and orient the Stiefel-domain map `T¹S^(n−1) × S¹ → S^(n−1) × S^(n−1)` of the proof of
Proposition 6.17 using 1.3's frame and sphere-bundle comparison, and count its regular preimages
with the product orientations. Separately, for a fixed pole `p ∈ Sⁿ`, construct the rotation
family of the second proof of Proposition 6.34 as the map

    f : T¹_pSⁿ × S¹ → SO(n+1),   f(u, θ) = R(p, u; θ),

the rotation by `θ` in the plane oriented by `(p, u)` fixing `⟨p, u⟩^⊥` (the Conventions give
the matrix); the lift into `SO(n+1)` is the object, because its homology class
`A = f_*([S^(n−1)] × [S¹]) ∈ H_n(SO(n+1))` is what 4.3 pushes into `H_n(Diff(Sⁿ))`. Prove that
`ev_p ∘ f(u, θ) = cos θ·p + sin θ·u`, and compute the degree of this composite
`T¹_pSⁿ × S¹ → Sⁿ`: every `q ∉ {±p}` has exactly the two regular preimages `(u, θ)` and
`(−u, 2π − θ)`, exchanged by an involution of `S^(n−1) × S¹` of degree `(−1)^(n−1)`, so the
degree is `1 + (−1)^(n−1)`, which is `2` for odd `n` and `0` for even `n` (bdho-floer, second
proof of Proposition 6.34). The degree is a mapping degree in the sense of DGFloer's
homological degree interface. The `Diff`-family and covered-by-diffeomorphisms comparisons are
made in 4.3. *Needs:* 1.3, DGFloer Layer 1 item 1 and Layer 0 (the homological degree),
DifferentialGeometry Layer 10 through that interface, Mathlib `Matrix.specialOrthogonalGroup`.

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
- The matrix: `R(p, u; θ)` is orthogonal with determinant `1`, `R(p, u; θ)p = cos θ·p + sin θ·u`,
  `R(p, u; 0) = I` and `R(p, u; θ + 2π) = R(p, u; θ)`, so `f` descends to `S¹`; with the sign
  of the `sin θ` term reversed the family would rotate the wrong way and the `n = 1` degree
  would be `−2` with the same orientation of `S⁰`.

### 1.5 Comparison of collapses

For a framed closed submanifold `N` of `Sⁿ⁺ᵏ` missing a point, compare DGFloer Layer 1 item 5's
collapse `Sⁿ⁺ᵏ → Sᵏ`, built from a tube in the sphere, with HomotopySpheres Stage 5's collapse
built from a tube in `ℝⁿ⁺ᵏ` through the stereographic chart at the missing point: for a tube
contained in the chart the two maps agree on the nose after the chart identification, and for
arbitrary tubes they are based homotopic by the independence theorems of both suppliers. State
the comparison for the chosen framings and prove its compatibility with the effect on
fundamental classes. *Needs:* DGFloer Layer 1 item 5, HomotopySpheres 5.0 and 5.1.3,
GeometricTopology Layer 1.

**Checks.**
- `N = ∅`: both collapses are the constant map to the basepoint of `Sᵏ`, of degree `0`.
- `N` a framed point of `Sⁿ⁺ᵏ`, `n = 0`: both collapses have degree `±1`, with the sign fixed
  by the framing's orientation; reversing one vector of the framing reverses the sign on both
  sides.
- Two tubes of different radii inside the chart give collapses that are homotopic but not
  equal; the on-the-nose agreement is claimed only for the same tube read through the chart.

### Examples

- `V_(3,2)(ℝ) ≅ SO(3)`, `V_(2,2)(ℝ) = O(2)`, `U(2)/U(0) = U(2)`; `CP¹` and `HP¹` of radius
  `1/2`.
- The rotation family for `n = 1` and `n = 2` as in the Checks of 1.4.
- `H_*(ΩS²) = ℤ[x]`, `|x| = 1`, with `x² ≠ 0`.

### Dependencies

DGFloer Layers 0–2; HomotopySpheres 3A.1–3A.2, 3B.3, 5.0, 5.1.3; AlgebraicTopology Stage 4.4;
GeneralizedCohomology G2.10 and G4.0b; ComplexKahlerGeometry K7.1–K7.2; LieGroups Layer 2;
SmoothBundlesConnections B1.4, B6.2–B6.3; RiemannianGeometry R1; GeometricTopology Layer 1;
DifferentialGeometry Layer 10. Sources: the source paper §§6.3–6.4; Milnor–Stasheff,
*Characteristic Classes*, Chapter 5; Steenrod, *The Topology of Fibre Bundles*, Part I, §7;
Hatcher, *Algebraic Topology*, §4.J.

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
Theorem 3; the source's proof of Proposition 6.39). Identify their Thom orientation systems and
attachment maps. Where HomotopySpheres 4B.2–4B.5 compute the same examples, compare the
critical manifolds and indices with its Bott chain. *Needs:* 1.3, RiemannianGeometry R1–R3,
MorseTheory M5, DGFloer Layer 5 item 6.

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

Use DGFloer Layer 4 item 5's augmented semi-free `P_B` and DGFloer Layer 5 item 4's
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
Layer 4 item 5 and Layer 5 item 4, DGFloer Layer 1 item 3.

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

Construct the map from the geometric sphere family to the completing manifold of `C₁`, its
fibrewise degree `±2` and its compatibility with `β` under sphere-loop adjunction: for `CPᵈ`,
`Σ_p = T¹_pCPᵈ` and `σ_p(u)` is the complex line through `p` tangent to `u`, parametrized by the
frame `(u, Iu)`; for `HPᵈ`, `Σ_p` is the fibre of the partial Stiefel manifold of pairs `(u, v)`
with `v` tangent to the quaternionic line `L_(p,u)`, and `σ_p(u, v)` is the round 2-sphere of
`L_(p,u)` tangent to `u` and `v`. With `g` the calibrated generator, prove
`β_*(σ_p)_*[Σ_p] = ±2g` in degree `2d` for `CPᵈ` and `4d + 2` for `HPᵈ`, fixing the sign by the
stated orientations; the class is twice the generator `g`. *Needs:* 2.1–2.5, 1.3, DGFloer
Layer 2 (the adjunction `β`).

**Checks.**
- Degrees: `dim Σ_p = 2d − 1` for `CPᵈ`, so `(σ_p)_*[Σ_p] ∈ H_(2d−1)(Ω²CPᵈ)` and `β_*` lands in
  `H_(2d)(ΩCPᵈ) = ℤ·g`; for `HPᵈ`, `dim Σ_p = (4d − 1) + 2 = 4d + 1` and `β_*` lands in
  `H_(4d+2)(ΩHPᵈ) = ℤ·g`.
- `CP¹ = S²`: the family is the sweep of Remark 6.19 restricted to one orientation component,
  and `β_*(σ_p)_*[Σ_p] = ±2x²` with `x²` the generator; the single-component class `[Σ′_p]` of
  Remark 6.19 gives `±x²` instead, so the factor `2` is the two orientations of the frame.
- Were the class `±g` rather than `±2g`, the `2`-torsion statements of 4.5 would change: the
  target is stated with the factor `2` and the Check is that the evaluation on the completing
  manifold has degree `±2`, not `±1`.

### Examples

- `ΩCP¹ = ΩS²` and `ΩHP¹ = ΩS⁴` as in the Checks of 2.2–2.3.
- `CP²`: cells in degrees `0, 1, 4, 5, 8, 9, …`, all surviving: `H_*(ΩCP²) = ℤ` in exactly these
  degrees, with the degree-`1` class from `π₂(CP²) = ℤ`.

### Dependencies

1.3; DGFloer Layer 1 items 2–3, Layer 2, Layer 4 item 5, Layer 5 items 4 and 6;
RiemannianGeometry R1–R3; MorseTheory M5; GeneralizedCohomology G4.0 and G4.3–4.5;
AlgebraicTopology Stages 2 and 6. Sources: BDHO, *Morse homology with differential graded
coefficients*, Chapters 5–13; the source paper §§4.3–4.4 and 6.4; Bott, *The stable homotopy of
the classical groups*, §§1–3; Ziller, *The free loop space of globally symmetric spaces*,
Theorems 3 and 8.

## Layer 3: multiple realization and Theorem B

Theorem A of the base roadmap (DGFloer Layer 10 item 5) needs a closed oriented manifold mapping
to the free loop space with nonzero degree over `Q`. Theorem B replaces the manifold by a
rational homology class; the realization of its multiple by a manifold is the application
constructed here.

### 3.1 Rational realization of a homology class

Consume the designated GeneralizedCohomology Thom, collapse, stabilization and finite-duality
comparisons and G5's rational spectral Hurewicz theorem, then TangentialBordism B5's geometric
Pontryagin–Thom and B6.3's rational `SO`-bordism orientation surjection, with their mapping-path
and Thom inputs and DGFloer Layer 1 items 2 and 4. On a smooth manifold `U` without boundary and
a class `α ∈ H_n(U; ℤ)`, lift `α ⊗ 1` to a finite rational bordism combination. Clear
denominators and then kill the finite-order torsion difference to obtain a closed oriented
manifold `S` (a finite disjoint union) and a continuous map `f : S → U` with `f_*[S] = Nα` for
some integer `N ≥ 1` (Thom's theorem, as used in the source's proof of Theorem 5.14). *Needs:*
GeneralizedCohomology G5 and its Thom and duality comparisons, TangentialBordism B5 and B6.3,
DGFloer Layer 1 items 2 and 4.

**Checks.**
- `α` of finite order `N`: the construction may return `S = ∅` with `f_*[∅] = 0 = Nα`; the
  statement is true and useless there, which is why Theorem B's hypothesis excludes it (3.3).
- `U = Sⁿ`, `α = [Sⁿ]`: `S = Sⁿ`, `f` the identity, `N = 1`.
- `α` the class of an embedded closed oriented submanifold: `N = 1` and `f` the inclusion; a
  construction that always produced `N > 1` would be weaker than Thom's theorem.

### 3.2 The compact-image embedding and smoothing

Construct the compact-image embedding: choose finitely many target charts `φ_i` and smooth
supported cutoffs `ρ_i` near `f(S)`, with `Σ ρ_i > 0` on a neighbourhood `W`, and define
`e(x) = (ρ_i(x), ρ_i(x) φ_i(x))_i`, extending each supported block by zero. Where `ρ_i > 0` the
ratios recover `φ_i`; this gives injectivity, a continuous local inverse and, by differentiation,
immersion. Restrict to a precompact neighbourhood of the image if required. GeometricTopology
Layer 1 supplies the normal tube of this embedding, with a positive uniform radius on the compact
core. Smooth `e ∘ f` on `S` by partitions of unity and mollifiers closely enough for the tube,
project back and construct the small homotopy in `U`. A fixed-relative version supplies its own
collar data. The smoothing uses Mathlib's smooth partitions of unity and cutoffs; the
finite-chart embedding is constructed here. *Needs:* 3.1, GeometricTopology Layer 1,
Mathlib `SmoothPartitionOfUnity` and `exists_contMDiffMap_zero_one_of_isClosed`.

**Checks.**
- `U = ℝⁿ` with the single chart `φ = id` and `ρ = 1`: `e(x) = (1, x)`, the tube is a product
  and the smoothing is ordinary mollification.
- Two charts overlapping on `W`: on the overlap both ratio maps recover their chart, and the
  transition between them is the smooth chart change, so `e` is an immersion there as well.
- `S = ∅`: the smoothing is empty and the homotopy is empty; nothing is claimed.

### 3.3 Theorem B (= Theorem 5.14)

Let `Q` be a closed orientable `n`-manifold such that either `π₂(Q) ≠ 0` or some `π_ℓ(Q)`,
`ℓ ≥ 3`, has an element of infinite order, and let `U ⊂ T*Q` be a relatively compact domain
whose projection `π_U : U → Q` induces a nonzero map `H_n(U; ℤ) → H_n(Q; ℤ)`. Then `∂U` has the
almost existence property for closed characteristics contractible in `T*Q`. Route: choose `α`
with `π_(U*)α = b[Q]`, `b ≠ 0`; 3.1–3.2 give the smooth map `φ : S → U` with `φ_*[S] = Nα`, so
`π_U ∘ φ` has degree `Nb ≠ 0`; the representing-witness argument of DGFloer Layer 10 item 5
(Theorem 5.10 applied to the smoothed map, and the kernel of `i_(Q*)` of Layer 10 item 4) proves
the statement. Theorem B is the case where `Q` is not a rational `K(π, 1)`. DGFloer Layer 10's
all-dimensional DG trajectory and chain inputs come from its Layers 7.2, 8 and 9. Only the
multiple `Nα` of 3.1 is realized; Theorem B needs nothing more. *Needs:* 3.1–3.2, DGFloer
Layer 10 items 4–5, DGFloer Layer 6 item 5.

**Checks.**
- `Q = T^r`: every `π_ℓ`, `ℓ ≥ 2`, vanishes, the hypothesis fails, and indeed `c°_HZ(D*T^r) = ∞`
  (Proposition 6.3 in the base roadmap), so the theorem must not apply.
- `Q = ℝP³`: `π₂ = 0` but `π₃ = ℤ`, the hypothesis holds; `Q = S²`: `π₂ = ℤ ≠ 0`.
- The hypothesis on `U` excludes the torsion case of 3.1: `π_(U*)α = b[Q]` with `b ≠ 0` has
  infinite order, so `α` has infinite order and `S ≠ ∅`.

### 3.4 Corollaries D and E in their Theorem B forms

Transport Theorem B along DGFloer Layer 6 item 3's magnetic fibre translation `Ψ'_σ`, and
through DGFloer Layer 6 item 4's Liouville-flow argument, exactly as DGFloer Layer 10 item 5
does for Theorems A and C; the realization input of 3.1–3.2 and the degree hypothesis are
unchanged by either transport. *Needs:* 3.3, DGFloer Layer 6 items 3–4, DGFloer Layer 10 item 5.

**Checks.**
- `σ = 0`: the magnetic translation is the identity and Corollary D reduces to Theorem B.
- A domain `U` disjoint from the zero section: the Liouville-flow argument of Corollary E still
  applies provided `H_n(U) → H_n(Q)` is nonzero; `U` a small neighbourhood of a single fibre
  has `H_n(U) → H_n(Q)` zero and is excluded.
- The sign of the translation: with `λ_can = p dq`, the base roadmap's `ω_can = −dλ_can` and
  `Ψ'_σ(q, p) = (q, p − σ_q)`, `Ψ'^*_σ λ_can = (p − σ_q) dq = λ_can − π^*σ`, so
  `Ψ'^*_σ ω_can = ω_can + π^*dσ`: `Ψ'_σ` is the symplectomorphism from `(T*Q, ω_can + π^*dσ)`,
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
items 3–5, Layer 10 items 4–5; GeometricTopology Layer 1; Mathlib `SmoothPartitionOfUnity`.
Source: the source paper §§1.2 and 5 (Theorem 5.14 and its proof).

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
- `Q = SU(2) = S³`: abundant by 4.3, and `c°_HZ(D*SU(2)) < ∞` follows from Theorem H as well as
  from the base roadmap's Theorem C; `π₃ = ℤ` and `S³` is not aspherical.
- Products: if `deg α = dim M` with nonzero reduced shriek, then `deg(α × [N]) = dim(M × N)` and
  the shriek of `α × [N]` to the fibre is `j_!α × 1`, again nonzero; if `deg α > dim M` then
  `deg(α × [N]) > dim(M × N)`. A definition without condition (ii) would wrongly count
  `σ_*[Q]`, the constant spheres, whose reduced shriek is zero.

### 4.2 Fibered families of 2-spheres

Define a *fibered family of 2-spheres* on `Q` (Definition 6.14): a smooth fibration
`Σ_p → Σ → Q` with fibre a closed oriented manifold of positive dimension and a map of
fibrations `σ : Σ → Map(S², Q)` over `Q`, with `(σ_p)_*[Σ_p] ≠ 0` in `H_*(Ω²Q)`. Prove
Proposition 6.15: `α = σ_*[Σ]` lives over the fundamental class and has degree
`dim Q + dim Σ_p > dim Q`, so `Q` is abundant.

- **Even spheres** (Example 6.16, Propositions 6.17–6.18). `Σ = Stiefel₂(Sⁿ)`, with `Σ_p` the
  ordered orthonormal 2-frames of `T_pSⁿ`, of dimension `2n − 3`; `σ(p, u, v)` is the round
  2-sphere `Sⁿ ∩ span(p, u, v)` swept by the loop of geodesics from `p` to `−p` in the rotating
  direction `cos θ·u + sin θ·v`, conjugated to a based map. The Pontryagin ring `H_*(ΩSⁿ)` is
  1.2's `ℤ[x]`; what is proved here, through DGFloer Layer 5, is that the class of the DG Morse
  cocycle of the height function is the generator `x` (Proposition 6.18), and that the Stiefel
  class `(σ_p)_*[Σ_p] ∈ H_(2n−3)(Ω²Sⁿ)` is nonzero for even `n` (Proposition 6.17) because its
  image under `β_*` is `x·x̄ = −x² ≠ 0`, using 1.4's Stiefel-domain degree computation.
- **Spheres `S^(4k−1)`** (Example 6.20, Proposition 6.21). With the two orthonormal tangent
  fields `u, v` of 1.3, `Σ_p` is the equator `S^(n−2)` of `Sⁿ ∩ u(p)^⊥` orthogonal to `v(p)`,
  and `σ_p` is the double planar-circle sweep; its class in `H_(n−2)(Ω²Sⁿ) ≅ ℤ` is a generator,
  through the adjunction with `π_n(Sⁿ)` and Hurewicz.
- **Sphere bundles over highly connected bases** (Proposition 6.23). In the standing closed,
  connected, oriented total-space setting of §6.4.2, a smooth `Sⁿ`-bundle `Sⁿ → Q → B`,
  `n ≥ 2`, whose structure group reduces to `O(n+1)` is the unit-sphere bundle of a rank-`n+1`
  real vector bundle with a fibrewise metric; construct this equivalence and the vertical
  tangent bundle `TᵥQ`. Prove the two alternatives separately.
  * `n` even and `B` `2n`-connected. The parameter fibre over `q ∈ Q` is the oriented manifold
    of ordered orthonormal two-frames in the tangent space to the sphere fibre. Put the Example
    6.16 sphere-family map into these fibres and include each sphere fibre into `Q` to obtain
    `Σ → Q` and `σ : Σ → Map(S², Q)`.
  * `n ≡ 3 (mod 4)` and `B` `(n+1)`-connected, with two everywhere independent vertical vector
    fields `u, v`. Normalize them to an orthonormal pair. For `q` in the fibre, put
    `V_x = u(x)^⊥` in the ambient rank-`n+1` Euclidean bundle and take the unit sphere in
    `V_x ∩ v(x)^⊥`, the carrier `E` of Example 6.20: `x` and `v(x)` are orthogonal unit vectors
    in `V_x`, so this is the equator `S^(n−2)` through `x`, whose points are sphere-fibre points,
    not tangent vectors at `x`. Use the two-field sphere-family map and the sphere-fibre
    inclusion to construct the oriented `Σ → Q` and `σ : Σ → Map(S², Q)`.
  In both cases prove the carrier's orientation and local triviality, continuity and smoothness
  of the family map, compatibility of the fibre map with the based inclusion `Ω²Sⁿ → Ω²Q`, and
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
  substitute for the general target.

*Needs:* 1.2, 1.3, 1.4, DGFloer Layer 1 items 2 and 4, Layer 2, Layer 5 items 2–5,
AlgebraicTopology Stages 2, 6 and 8, SmoothBundlesConnections B2.2 and B2.5 (the unit-sphere
bundle of a metrized vector bundle with `O(n+1)` reduction), HomotopySpheres 3B.3 through 1.2.

**Checks.**
- Degrees: for `Sⁿ`, `n` even, `α = σ_*[Σ]` has degree `n + (2n − 3) = 3n − 3`; for `n = 4k − 1`,
  degree `n + (n − 2) = 2n − 2`; for `S²`, `Σ_p = V_(2,2) = O(2)` has two components and
  `α ∈ H₃(Map(S², S²))`.
- `n = 3`: `H₁(Ω²S³) ≅ π₁(Ω²S³) = π₃(S³) = ℤ`, and the class of 6.21 is a generator; for `n = 2`
  the even-sphere construction applies instead, and the Stiefel class lies in `H₁(Ω²S²)`.
- The Serre comparison: in `Ω²Sⁿ → Ω²Q → Ω²B` with `H_i(Ω²B) = 0` for `1 ≤ i ≤ 2n − 2`, every
  differential into `E_(0,q)`, `q ≤ 2n − 3`, starts from `E_(r, q−r+1)` with `2 ≤ r ≤ 2n − 2`,
  which vanishes; a base that is only `(2n−1)`-connected would allow `r = 2n − 1 > 2n − 2` and
  the argument would fail at `q = 2n − 3`.
- `S^(4k+1)` admits no pair of pointwise independent vector fields, so the odd-sphere
  construction is not available for `n ≡ 1 (mod 4)`; these spheres are covered by 4.3 instead.

### 4.3 Covering by diffeomorphisms

Define, for a closed connected oriented `n`-manifold `M` with basepoint and the evaluation
`ev : Diff(M) → M` over GeometricTopology Layer 3's `Diff(M)`, *covered by diffeomorphisms*
(Definition 6.26: some `A ∈ H_n(Diff(M))` has `ev_*A = [M]`) and *`ℓ`-covered* (Definition 6.32:
`ev_*A = ℓ[M]`, `ℓ > 0`). Prove Proposition 6.29 (covered and not aspherical implies abundant)
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
  splitting `π_(n−1)(SO(n)) ≅ π_(n−1)(O) ⊕ π_n(V_(n+2,2)(ℝ))`; prove the stable term is `0` or
  `ℤ/2` by HomotopySpheres 4A–4B's stable real Bott computation and the Stiefel term `ℤ/2` in
  this range from the Stiefel fibration and extension data; state the comparison maps and the
  range in which stabilization applies. The source's proof of Lemma 6.35 prints
  `π₈(SO(9)) = ℤ/4`; the group is `(ℤ/2)²`: the stabilization `π₈(SO(9)) → π₈(SO) = ℤ/2` is
  split with kernel `ℤ/2` (Crowley–Schick–Steimle, proof of Lemma 2.2), and the exact sequence
  of `SO(8) → SO(9) → S⁸` with `π₈(SO(8)) = (ℤ/2)³` surjecting onto `π₈(SO(9))` certifies
  exponent two. In
  `Suggested.lean`, `SO n` is `Matrix.specialOrthogonalGroup (Fin n) ℝ` with the subtype
  topology of the matrix space, the seven values are `subsingleton_pi2_SO3`,
  `nonempty_pi4_SO5_mulEquiv`, `subsingleton_pi6_SO7`, `nonempty_pi8_SO9_mulEquiv`,
  `nonempty_pi10_SO11_mulEquiv`, `nonempty_pi12_SO13_mulEquiv` and
  `nonempty_pi14_SO15_mulEquiv`, and the torsion statement for every odd `n ≥ 3` is
  `isOfFinOrder_pi_SO`.
- **First proof of odd-sphere covering (Proposition 6.34).** Use the evaluation fibration
  `SO(n) → SO(n+1) → Sⁿ` and its exact segment `π_n(SO(n+1)) → π_n(Sⁿ) → π_(n−1)(SO(n))`. Since
  `π_n(Sⁿ) = ℤ` and the last group is torsion, the boundary map has nonzero kernel, and
  exactness gives a class mapping to `ℓ[Id_(Sⁿ)]`, `ℓ > 0`. Carry it through the Hurewicz map to
  `H_n(SO(n+1); ℤ)`, then through the action `SO(n+1) → Diff(Sⁿ)` and evaluation to obtain
  `ev_*A = ℓ[Sⁿ]`. Apply Proposition 6.33 using that `π_n(Sⁿ) = ℤ` is not `ℓ`-torsion.
- **Second proof of odd-sphere covering (Proposition 6.34).** Use GeometricTopology Layer 3 and
  DGFloer Layer 1 item 6's local evaluation bundle and 1.4's rotation family
  `f : T¹_pSⁿ × S¹ → SO(n+1)`. Take `A = f_*([S^(n−1)] × [S¹]) ∈ H_n(SO(n+1))`; by 1.4,
  `(ev_p)_*A = (1 + (−1)^(n−1))[Sⁿ] = 2[Sⁿ]` for odd `n`, and the inclusion `SO(n+1) → Diff(Sⁿ)`
  carries `A` to a class with the same evaluation, so `Sⁿ` is `2`-covered. Apply Proposition 6.33
  with the non-`2`-torsion group `π_n(Sⁿ) = ℤ`. Both proofs are targets.

*Needs:* 1.4, DGFloer Layer 1 items 1–2 and 6, Layer 2, Layer 5 item 5, Layer 11,
GeometricTopology Layer 3, HomotopySpheres 4A.1 and 4B.8, AlgebraicTopology Stage 8.1–8.7,
Tau Ceti `IsAspherical`, Mathlib `HomotopyGroup.Pi`, `IsOfFinOrder`, `Matrix.specialOrthogonalGroup`.

**Checks.**
- Low ranks: `π₂(SO(3)) = π₂(S³) = 0` through the double cover `S³ → SO(3)`; `π₈(SO(9)) = (ℤ/2)²`
  as above, so a statement of `π₈(SO(9)) ≅ ℤ/4` would be false (an element of order `4` would
  survive in the quotient of `(ℤ/2)³`).
- The splitting formula is false below its range: for `n = 7` it would give
  `π₆(O) ⊕ π₇(V_(9,2)) = 0 ⊕ ℤ/2` (the connecting map `π₈(S⁸) → π₇(S⁷)` of `S⁷ → V_(9,2) → S⁸` is
  multiplication by the Euler number `2`), while `π₆(SO(7)) = 0`; for `n = 3` it would give
  `0 ⊕ ℤ/2` while `π₂(SO(3)) = 0`. The range `n ≥ 17` (`n ≥ 16` and odd) is part of the target.
- For odd `n ≥ 17` the stable term is `ℤ/2` exactly when `n ≡ 1 (mod 8)` (`π_(n−1)(O) = ℤ/2` for
  `n − 1 ≡ 0, 1 (mod 8)`, and `n − 1` is even), so `π_(n−1)(SO(n))` is `(ℤ/2)²` for
  `n = 17, 25, …` and `ℤ/2` for the other odd `n ≥ 19`; `n = 9` fits the same pattern.
- Tori: `T^r` is covered by diffeomorphisms through left translation but is aspherical, so
  Proposition 6.29 does not apply, consistent with 4.1's first Check; `SU(2)`, `SO(3)` and `U(n)`
  are not tori and are abundant.
- `n = 3` in the second proof: `A ∈ H₃(SO(4)) ≅ ℤ²` with `(ev_p)_*A = 2[S³]`, while the first
  proof's class from the section `S³ → SO(4)` has `ℓ = 1`; both proofs conclude.

### 4.4 Homogeneous spaces, including `S² = SO(3)/SO(2)`

For a compact connected Lie group `G` and a closed Lie subgroup `H` of positive dimension, with
`M = G/H`, define the left actions `Φ_H : H × Ω²M → Ω²M` and `Φ : G × Map(S², M) → Map(S², M)`
and the evaluation fibration `ev : Map(S², M) → M` with fibre `Ω²M` over `eH`. Prove Proposition
6.36: given `α ∈ H_*(Ω²M; ℤ)` with `(Φ_H)_*([H] × α) ≠ 0`, `M` is abundant with 2-spheres. Route:
construct the map of fibrations induced by `H → G → M` and `Map(S², M) → M`; prove `j_![G] = [H]`
for the fibre inclusion and shriek naturality, with the coefficient maps, degree shifts,
cross-product signs and basepoint identifications, to obtain `j_! Φ_*([G] × α) = (Φ_H)_*([H] × α)`;
because `dim H > 0` the class has degree above `dim M` and its shriek has positive degree, so
the reduced-homology condition of Definition 6.11 holds.

The source states the result for every closed `H`, even when `M` is not orientable, while
Definition 6.11 is stated for oriented manifolds. Preserve this generality with the
evaluation-pullback orientation system `ev*or_M`. Choose a generator `o` of its fibre at `eH` and
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
item 2) with the nonzero shriek and zero constant-loop image. Recover the oriented statement by
an orientation trivialization; no connectedness of `H` is imposed.

For `S² = SO(3)/SO(2)` (Example 6.37), take `α ∈ H₀(Ω²S²; ℤ)` represented by a degree-one map.
Compute its `SO(2)` action class `α′ ∈ H₁(Ω²S²; ℤ)` and prove it nonzero by identifying it with
the cycle `(σ_p)_*[Σ′_p]` of Remark 6.19. Under `β_* : H₁(Ω²S²) → H₂(ΩS²)`, identify the class
with the Pontryagin square `x²` of the generator `x` of `H₁(ΩS²)`. Then compare the `SO(3)` action
class in `H₃(Map(S², S²); ℤ)` with `σ_*[Σ′]`, including orientation choices and the evaluation
shriek map. This is the worked instance of the general action and shriek construction. *Needs:*
4.1, 4.2 (Remark 6.19's cycle), 1.2, DGFloer Layer 2, Layer 3 item 4 (rank-one twists), Layer 5
items 4–5, Layer 10 item 2, AlgebraicTopology Stages 2 and 6 (`or_M` and twisted fundamental
classes), Tau Ceti `LocalCoefficientSystem`, LieGroups Layer 2.

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

### 4.5 Projective spaces and Theorem I

Prove Proposition 6.38 (`CPᵈ`, `d ≥ 1`) and the quaternionic half of Proposition 6.39 (`HPᵈ`,
`d ≥ 1`) from Layer 2: the sphere families of 2.6 are fibered families of 2-spheres, because
`β_*(σ_p)_*[Σ_p] = ±2g ≠ 0` in the torsion-free group `H_(2d)(ΩCPᵈ)`, respectively
`H_(4d+2)(ΩHPᵈ)`, so `(σ_p)_*[Σ_p] ≠ 0` and Proposition 6.15 applies. Together with 4.2–4.4 this
is **Theorem I** within the scope boundary: spheres, sphere bundles over highly connected bases,
compact connected Lie groups other than tori, manifolds covered by diffeomorphisms, homogeneous
spaces satisfying Proposition 6.36, and `CPᵈ`, `HPᵈ`. *Needs:* 2.6, 4.2, 4.3, 4.4, 1.3.

**Checks.**
- `CP¹ = S²` and `HP¹ = S⁴`: the projective families are the even-sphere families of 4.2 for
  `n = 2` and `n = 4`, and the classes agree up to the factor `2` of 2.6's second Check.
- `d = 0`: `CP⁰` and `HP⁰` are points, excluded by the hypothesis `d ≥ 1`; a point is a closed
  oriented `0`-manifold with `Map(S², pt) = pt`, and it is not abundant (no class of degree above
  `0` exists and the degree-`0` class has zero reduced shriek).
- `ℝPⁿ` is not in the list: the source treats it by the covering argument for capacities and
  does not claim abundance, so Theorem I as stated here does not include it.

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
collapse `Q → (Y × D^k)/(Y × ∂D^k)` of DGFloer Layer 1 item 5) and Lemma 7.7 (for `d ≥ 2` and `Y`
`(d+1)`-connected, non-torsion of `j_!β` in `H_d(Ω²Q)` transfers to `j_(Y!)s̃_*β`), then the
cotangent criterion (DGFloer Layer 10 item 3) and the kernel bound
`ker π_(U!) ⊆ ker(d·j_(Y!))` with `d = deg(π ∘ φ)`. *Needs:* 1.5, DGFloer Layer 1 items 2 and 5,
Layer 3, Layer 5 items 4–5, Layer 10 items 3–4, GeometricTopology Layer 1 (hypersurfaces,
collars), AlgebraicTopology Stage 6.

**Checks.**
- Example 7.4: `Q = Q′ # (S^k × Y)` with `Y` closed orientable and `(2k−2)`-connected,
  `X = S^k × {q}`, `Y = {p} × Y` away from the connected-sum ball: transverse single intersection,
  trivial normal bundle, and the connectivity hypothesis holds for both parities of `k`.
- Dimension bounds forced by the hypotheses: `Y` `ℓ`-connected of dimension `n − k` and
  homologically nontrivial gives `n ≥ 3k − 1` for even `k` and `n ≥ 2k` for odd `k`; `k = 1` is
  excluded by `k ≥ 2`.
- `Q′ = Tⁿ`, `k ≥ 3`: `π₂(Q) = 0` and `Q` is rationally essential, so neither Theorem B nor
  Theorem H applies, while Theorem G does: the three theorems have different ranges.

### Examples

- `S²`, `S³ = SU(2)`, `S^(4k−1)`, `SO(3)`, `U(n)`, `CPᵈ`, `HPᵈ`, and `T^r` as the
  non-example, as in the Checks above.
- `Q = Tⁿ # (S^k × Y)` for Theorem G.

### Dependencies

Layers 1–3; DGFloer Layer 1 items 1–2, 5–6, Layers 2–3, Layer 5 items 2–5, Layer 10 items 2–5,
Layer 11; GeometricTopology Layers 1 and 3; HomotopySpheres 3B.3, 4A.1, 4B.8;
AlgebraicTopology Stages 2, 6, 8.1–8.7; SmoothBundlesConnections B2.2 and B2.5; LieGroups Layer 2;
Tau Ceti `IsAspherical`, `LocalCoefficientSystem`; Mathlib `HomotopyGroup.Pi`, `IsOfFinOrder`,
`Matrix.specialOrthogonalGroup`. Sources: the source paper §§6.3–6.4 and §7; Crowley, Schick,
Steimle, proof of Lemma 2.2; Hatcher, *Algebraic Topology*, §4.2.

## Downstream consumers

None at present. The base roadmap consumes nothing from this one.

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
   `x²`, and `β_*(σ_p)_*[Σ_p] = ±2x²`.

## Source coverage

This section records where each numbered statement of the source paper within this roadmap's
scope lands, so that a reader can check that nothing is missing.
Numbers follow arXiv:2404.07953v3.

| Source statements | Target |
| --- | --- |
| Thm B | 3.3 (Thm 5.14): representing-map endpoint and the multiple-realization application |
| Cor D, E, Theorem B forms | 3.4, through DGFloer Layer 6 items 3–4 |
| Thm G | 4.6 (Thm 7.1) |
| Def 1.7, Thm H | 4.1 (Def 6.11, Thm 6.12) |
| Thm I | 4.2–4.5, without `CaP²` |
| Thm 5.14 | 3.3 |
| Def 6.11, Thm 6.12, Prop 6.13 | 4.1 |
| Def 6.14, Props 6.15, 6.17, 6.18, 6.21, 6.23 | 4.2 (degree computation 1.4; the James ring 1.2) |
| Defs 6.26, 6.32, Props 6.29, 6.33 | 4.3 (evaluation fibration DGFloer Layer 1 item 6) |
| Prop 6.31 | 4.3, from the finite cover and torus criterion of DGFloer Layer 11 |
| Prop 6.34 | 4.3, both the Lemma 6.35 proof and the rotation-family proof (1.4) |
| Lem 6.35 | 4.3, low ranks and the stable-plus-Stiefel splitting; used by the first proof of Prop 6.34 |
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
- R. Bott, *The stable homotopy of the classical groups*, Ann. of Math. 70 (1959); W. Ziller,
  *The free loop space of globally symmetric spaces*, Invent. Math. 41 (1977): Layer 2.
- D. Crowley, T. Schick, W. Steimle, *The derivative map for diffeomorphism of disks: an example*,
  [arXiv:2012.13634](https://arxiv.org/abs/2012.13634), proof of Lemma 2.2: the value of
  `π₈(SO(9))` in 4.3.
- J. Milnor, J. Stasheff, *Characteristic Classes*, Annals of Mathematics Studies 76, Princeton,
  1974, Chapter 5; N. Steenrod, *The Topology of Fibre Bundles*, Princeton, 1951, Part I, §7:
  Stiefel manifolds and frame quotients in Layer 1.
- A. Hatcher, *Algebraic Topology*, Cambridge, 2002, §4.2 and §4.J: fibration sequences, the
  homotopy groups of Lie groups and Stiefel manifolds used in 4.3, and the James construction.
