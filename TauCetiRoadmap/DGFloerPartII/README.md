# Roadmap: DG Floer theory, Part II: spheres, knotted hypersurfaces and bordism

The [DG Floer roadmap](../DGFloer/README.md) builds Morse and Floer homology with coefficients in a
DG local system, the Viterbo isomorphism with DG coefficients for cotangent bundles, and the
criteria of Barraud--Damian--Humilière--Oancea for the contractible almost existence property and
for finiteness of the `π₁`-sensitive Hofer--Zehnder capacity: its Theorems L and M, the cotangent
criterion, and Theorems A and C. This roadmap applies that package. It proves the remaining
headline results of the source paper ([arXiv:2404.07953](https://arxiv.org/abs/2404.07953)):
- **Theorem B**, the multiple-realization form of Theorem A, which realizes a rational multiple of
  a homology class by a closed oriented manifold;
- **Theorem H**, almost existence and finite capacity for manifolds *abundant with 2-spheres*, and
  **Theorem I**, the list of such manifolds: spheres, sphere bundles over highly connected bases,
  compact Lie groups other than tori, manifolds covered by diffeomorphisms, homogeneous spaces,
  and the complex and quaternionic projective spaces;
- **Theorem G**, on knotted hypersurfaces in cotangent bundles.

These applications consume suppliers that the base roadmap does not: the structured
Pontryagin--Thom and rational bordism theory of TangentialBordism, the convenient spaces, James
construction and stable real Bott periodicity of HomotopySpheres, and the complex projective
carrier and Fubini--Study form of ComplexKahlerGeometry. They also consume the homogeneous
carriers, explicit degree computations and projective loop-space calculations that exist only for
them; those are built here, in Layers 1 and 2, so that the base roadmap stays a supplier of the
roadmaps that consume its generic interfaces. Nothing here is consumed by the base roadmap.

Suggested homes:

| Layers | Home |
| --- | --- |
| 1 | `TauCeti/AlgebraicTopology/` and `TauCeti/Geometry/Manifold/Homogeneous/` |
| 2 | `TauCeti/Geometry/Manifold/Morse/Bott/` |
| 3--4 | `TauCeti/Geometry/Symplectic/Hamiltonian/AlmostExistence/` |

## Scope boundary

In scope: the source paper's Theorem B (Theorem 5.14) with the Theorem B forms of Corollaries D
and E, every numbered statement of its §§6.3--6.4 and §7, and the carriers, comparisons and
explicit maps those statements consume. The [source coverage](#source-coverage) section assigns
each of them to a layer. The base roadmap owns every other numbered statement of the source and
its standing conventions; this roadmap cites it as **DGFloer** by layer and item, and an
unqualified "Layer `k` item `j`" refers to this roadmap.

**The finite-rank and compact-Lie applications of §§6.4.3–6.4.4 are in scope.** Layer 4 item 3
constructs Lemma 6.35's complete odd-rank `π_(n−1)(SO(n))` torsion proof and both proofs of
Proposition 6.34, and proves Proposition 6.31 for every compact connected Lie group other than
a torus from the base roadmap's finite cover and torus criterion (DGFloer Layer 11).
HomotopySpheres Stage 4A–4B supplies stable real Bott periodicity only; the finite-rank
Stiefel and low-rank calculations, and their use in the sphere-evaluation fibration, remain
explicit targets here. The LieGroups supplier provides its matrix-group interfaces; the
finite-cover/`K(π,1)` comparison is the base roadmap's Layer 11. These targets preserve the source's full statements rather than reclassifying them as
coverage-only contracts.

Out of scope, so nobody mistakes them for later stages:

- **The Cayley plane** in Proposition 6.39. It needs the octonionic projective plane as a
  Riemannian manifold. The quaternionic half of Proposition 6.39 is in scope.
- **Conjecture 1.2** and **Corollary F**, for the reasons stated in the base roadmap.
- General Lie theory, compact representation theory, stable Bott periodicity and rational bordism
  theory: these are consumed from the suppliers named below at their stated hypotheses, and the
  bounded applications here do not rebuild them.


### Named source applications and coordination contracts

This table specifies mathematical owner boundaries, in the sense of the base roadmap's table of the same name. A **coordination contract** names a construction to allocate and prove; a supplied stable or generic floor is not its global conclusion.

| Source subject | Owner and application boundary |
| --- | --- |
| Multiple realization | [GeneralizedCohomology](../GeneralizedCohomology/README.md) G5 and [TangentialBordism](https://github.com/TauCetiProject/TauCetiRoadmap/blob/4a5e27d2dd1b94abcca3e9b2151e9adf460a8a2f/TauCetiRoadmap/TangentialBordism/README.md) B5/B6.3 supply Thom/PT/rational bordism inputs. Layer 3 owns their smooth-target multiple-realization application and the resulting TheoremB/5.14 endpoint. |
| Finite-rank odd-sphere and compact-Lie applications | [HomotopySpheres](https://github.com/TauCetiProject/TauCetiRoadmap/blob/84eb50c63d08d9dafdc05a330be675d762bf62a3/TauCetiRoadmap/HomotopySpheres/README.md) Stage4A–4B supplies stable real Bott and its stable orthogonal-group calculation, not the unstable diagonal groups. Layer 4 item 3 owns the low-rank values, the stable-plus-Stiefel decomposition for `π_(n−1)(SO(n))`, its use in the exact sequence of `SO(n)→SO(n+1)→Sⁿ`, and the resulting first proof of Proposition6.34; the geometric second proof remains a separate complete proof. DGFloer Layer 11 owns the finite cover `T×K→G`, the `π_j` comparison for `j≥2`, the nonzero `π₃` of a nontrivial compact simply connected semisimple factor and the conclusion `G is K(π,1) iff G is a torus`; Layer 4 item 3 consumes that criterion and applies Proposition6.29 to prove Proposition6.31. This application does not rebuild general Lie theory, compact representation theory, or stable Bott theory. |

## Ownership and dependencies

This roadmap consumes, and does not rebuild:

- **[DG Floer](../DGFloer/README.md)**, the base roadmap, with its standing conventions.
  - Layer 0: normalized cubical singular chains, the cross product and the comparison with
    simplicial chains, through which every homological input below is transported.
  - Layer 1 item 1: `π₁ᵃᵇ ≅ H₁`. Item 2: CW approximation, homology invariance under weak
    equivalences, the fibration homotopy exact sequence and the homological and cohomological
    Serre spectral sequences on native `serreFibrations`. Item 3: the filtered-complex spectral
    sequence and its convergence. Item 4: Serre classes, Hurewicz modulo a class, the
    Eilenberg--MacLane models and the mod-2 vanishing theorem. Item 5: the Pontryagin--Thom
    collapse for framed submanifolds of a closed ambient manifold. Item 6: the evaluation bundle
    `Diff(M) → M` and its local sections.
  - Layer 2: Moore paths and loops, the free loop space, the Moore-path replacement, the
    fixed-interval sphere and interval models with `Map_*(S², Q)`, `Map(S², Q)`, the adjunction
    `β_* : H_*(Ω²X) → H_{*+1}(ΩX)`, the constant-sphere section and `G × Map_*(S², G) ≅ Map(S², G)`.
  - Layer 3: DG local systems, their pullbacks and basepoint change, and the DG local system of a
    Hurewicz fibration.
  - Layer 4: twisting cocycles, the twisted complex, the index filtration and the arbitrary-CW
    Brown resolution of item 5.
  - Layer 5 items 1--6: representing chain systems, the Barraud--Cornea cocycle, DG Morse homology
    with its direct and Umkehr maps, the fibration theorem, classes living over the fundamental
    class with shriek naturality, and the free loop space through broken geodesics.
  - Layer 6 items 3--5: cotangent bundles with the magnetic fibre translation, hypersurfaces and
    the Liouville-flow argument, almost existence and the `π₁`-sensitive capacity.
  - Layers 8--9: DG Floer homology and the Viterbo isomorphism, only through the criteria below.
  - Layer 10: Theorems L and M with Propositions 6.6--6.7 (item 2), the cotangent criterion
    (item 3), the kernel of `i_{Q*}` (item 4), and Theorems A and C with the Theorem A and C forms
    of Corollaries D and E (item 5).
  - Layer 11: the finite covering `T × K → G` of a compact connected Lie group and the criterion
    that `G` is aspherical exactly when it is a torus, consumed by Layer 4 item 3.
- **[Tangential bordism](https://github.com/TauCetiProject/TauCetiRoadmap/blob/4a5e27d2dd1b94abcca3e9b2151e9adf460a8a2f/TauCetiRoadmap/TangentialBordism/README.md).** B5/B6.3 supplies structured PT and the rational oriented-bordism orientation-map surjection with geometric preimages and singular-CW comparison. Layer 3 consumes these with GeneralizedCohomology G5; DGFloer's Layer 1 inputs precede their construction. No whole-roadmap dependency is imposed.
- **[Homotopy spheres](https://github.com/TauCetiProject/TauCetiRoadmap/blob/84eb50c63d08d9dafdc05a330be675d762bf62a3/TauCetiRoadmap/HomotopySpheres/README.md).**
  - Stage 3A: pointed compactly generated spaces, based loop spaces, and the suspension--loop
    adjunction, with the comparison homeomorphisms to ordinary spaces, consumed by Layer 1 item 1.
  - Stage 3B item 3: the James map and the tensor-algebra computation of `H_*(ΩΣX)`, used for the
    ring `H_*(ΩSⁿ)` in Layer 4 item 2, through the sphere comparison of Layer 1 item 2.
  - Stage 4B items 2–5 supply the invariant/Jacobi and finite-dimensional Morse–Bott constructions used in the Bott chain of compact classical groups and symmetric spaces. Their Bott-chain applications remain there.
  - Stage 4A--4B: stable real Bott periodicity and the stable orthogonal-group calculation, consumed by Layer 4 item 3 for the stable term of Lemma 6.35, not for the unstable diagonal groups.
  - Stage 5: the framed Pontryagin--Thom collapse from a chosen normal tube and framing in a Euclidean ambient space; Layer 1 item 5 compares it with DGFloer Layer 1 item 5's collapse.
- **[ComplexKahlerGeometry K7.1–K7.2](../ComplexKahlerGeometry/README.md#k7-projective-torus-and-hopf-examples).** K7.1 supplies the single complex projective carrier, complex/real atlases and orientation; GeneralizedCohomology G4.0b supplies its fixed real model/Grassmannian comparison and the designated HP carrier. K7.2's normalized Fubini–Study form and SBC B6.2–B6.3 inputs are used only in the later form comparison of Layer 1 item 3, after the independent metric and Morse–Bott applications have been constructed.
- **[Generalized cohomology](../GeneralizedCohomology/README.md).**
   - G4.0b supplies the designated quaternionic `Sp(n)` carrier, the quaternionic frame, Grassmannian and `HPᵈ` carriers with their smooth Hopf comparisons, consumed by Layer 1 item 3; G4.0 and G4.3--4.5 supply the base cell, cup and Thom classes on the designated projective carriers, consumed by Layer 2 item 5.
   - For Layer 3 distinguish GC's designated ordinary/spectral Thom-carrier and collapse/finite-duality comparisons from its later G5 rational spectral Hurewicz theorem. TB B5 consumes the actual G2.10 mapping-path replacement, designated Thom carriers and the stabilization/duality comparisons; TB B6.3 additionally consumes its stated rational oriented-bordism comparison. DGFloer Layer 1 items 2 and 4 precede those GC/TB outputs and their Layer 3 application.
- **[Lie groups](../RepresentationTheory/LieGroups/README.md).**
  - Layer 2: the generic closed-subgroup theorem and real/complex matrix groups, consumed by Layer 1 item 3. GeneralizedCohomology G4.0b supplies the designated quaternionic Sp(n) carrier, topology, real model and smooth ambient-map criterion, using that generic theorem.
- **[Smooth bundles and connections](../SmoothBundlesConnections/README.md#b14-slices-quotients-and-homogeneous-spaces).** B1.4: Proper free-action smooth homogeneous quotients, principal projections and tangent quotients. Layer 1 item 3 consumes this single generic quotient owner for its geometric applications. B6.2--B6.3 supply the inputs of the Fubini--Study form comparison of Layer 1 item 3.
- **[Riemannian geometry](https://github.com/TauCetiProject/TauCetiRoadmap/blob/53915bae39e30b2b78fe08bb697d90d62bce66ef/TauCetiRoadmap/RiemannianGeometry/README.md).** R1 supplies the specified round-Hopf projective metrics. R2 supplies Jacobi initial-value/endpoint-exponential comparisons; R3 supplies the index form, finite node-value reduction and its based-loop sphere calculation, including `ΩS²` at radius `1/2`. Layer 2 constructs the projective applications on those carriers.
- **[Morse theory](../MorseTheory/README.md).** M5 supplies the abstract compact-band Morse--Bott parameter lemma, negative normal bundles, disc attachment and orientation-local-system Thom comparison; Layer 2 consumes them on the finite approximations to the based loop spaces.
- **[Geometric topology](https://github.com/TauCetiProject/TauCetiRoadmap/blob/c0916c297392b21d768393a41296bfe37bd633ac/TauCetiRoadmap/GeometricTopology/README.md).**
  - Layer 1: tubular neighbourhoods with a positive uniform radius on a compact core, consumed by Layer 3 item 2, and the hypersurface and collar vocabulary of Layer 4 item 6.
  - Layer 3: `Diff(M)` as a topological group with the `C^∞` topology, the smooth-families map, and the inclusion `O(n+1) → Diff(Sⁿ)`, consumed by Layer 4 item 3.
- **[Algebraic topology](https://github.com/TauCetiProject/TauCetiRoadmap/blob/77caf227f456d6da938674a1ac50e309d47c476a/TauCetiRoadmap/AlgebraicTopology/README.md).**
  - Stage 4.4: the based circle and sphere models, the reduced-suspension sphere homeomorphism and the compact reduced-suspension carrier comparison, consumed by Layer 1 item 2.
  - Stage 2 and Stage 6: local coefficient systems, fundamental classes, the orientation local system and its transport, consumed by Layer 4 items 2--4.
  - Stage 8.1--8.7: the Hurewicz map, consumed by Layer 4 item 3.
- **[Differential geometry](../DifferentialGeometry/README.md).** Partitions of unity and mollification of continuous maps into a manifold, consumed by Layer 3 item 2; its Layer 10 smooth degree only through DGFloer's homological degree interface.

This roadmap owns everything else it states. In particular:
- the comparison of the base roadmap's raw compact-open path, loop and mapping carriers with the convenient carriers of HomotopySpheres Stage 3A, and the based sphere's comparison with its categorical reduced suspension;
- the real and complex orthonormal-two-frame quotient comparisons, the designated projective quotient comparisons, the unit-round Hopf metrics with their curvature, period and totally geodesic statements, the quaternionic vector fields on `S^{4k−1}`, and the Fubini--Study form comparison;
- the Stiefel-map and fixed-pole rotation-family degree computations;
- the comparison of the base roadmap's Pontryagin--Thom collapse with HomotopySpheres' Euclidean-ambient collapse;
- the based-loop Morse--Bott energy on `CPᵈ` and `HPᵈ`: critical manifolds, negative bundles, integral perfectness, calibrated generators, the path-loop total-space comparison and the primary and mixed-bidegree differentials;
- the multiple-realization application and Theorem B;
- abundance, fibered families of 2-spheres, covering by diffeomorphisms, the finite-rank odd-sphere group, Proposition 6.31 for compact connected Lie groups other than tori, homogeneous spaces, the projective applications, Theorems H and I;
- knotted hypersurfaces and Theorem G.

The following constructions touch other roadmaps and are coordination points:

- **Frame carriers.** Layer 1 item 3 consumes native frame carriers, SBC's proper quotients and LieGroups' actual orthogonal/unitary subgroups, and owns the identifications between them; no supplier is asked for a second identification.
- **Bott-chain comparisons.** HomotopySpheres Stage 4B's Bott-chain computations are comparisons on their stated compact homogeneous examples; Layer 2 constructs its projective computations from Riem R1--R3 and MorseTheory M5 and compares with them where the examples overlap, without consuming them as the generic owner.
- **Collapses.** Layer 1 item 5 compares the two Pontryagin--Thom collapses; neither supplier consumes the comparison.

## Standing conventions

The standing conventions of the base roadmap apply unchanged: normalized cubical chains, the
grading bridge, Moore loops with the fixed-interval comparison, the raw compact-open mapping-space
topology with its metrizable homeomorphism lane, coefficients, the Floer grading, the sign
dictionary, unbundled hypotheses and specified maps. In addition:

- **Convenient carriers.** The convenient internal hom of HomotopySpheres Stage 3A is compact-open
  followed by compact generation `k`. Every statement here about a convenient mapping space is
  made through the comparison of Layer 1 item 1 with the base roadmap's raw carrier, and a
  homeomorphism is claimed only in the base roadmap's proved compactly generated lane.
- **Orientations of homogeneous carriers.** A frame carrier `SO(n)/SO(n−2)` or `U(n)/U(n−2)` is
  oriented through its quotient comparison of Layer 1 item 3 from left-invariant orientations of
  the groups; a homogeneous quotient `G/H` from a left-invariant orientation of `G` and the chosen
  orientation of `H`; and the evaluation-pullback orientation system `ev^*or_M` is used wherever
  `M` is not assumed orientable (Layer 4 item 4).
- **Citations of the base.** "DGFloer Layer `k` item `j`" always refers to the base roadmap; an
  unqualified layer and item refers to this roadmap.

## Inventory

Mathlib provides:
- cubical homotopy groups (`HomotopyGroup`), `IsOfFinOrder`;
- `LieGroup`, `Matrix.orthogonalGroup`, `Matrix.specialOrthogonalGroup`, quaternions;
- `EuclideanSpace`, `Metric.sphere`, `Circle`, the compact-open topology on `C(X, Y)`.

Tau Ceti provides:
- `IsAspherical`;
- the loop-space shift `pathLoopSpaceMulEquiv : π_m(Ω X) ≃* π_{m+1}(X)`;
- twisted singular homology and `LocalCoefficientSystem`.

The base roadmap provides the targets listed under its name above; this roadmap consumes them as
stated there and does not restate them.

The following targets are built here, consuming the native APIs cited in their layers:
- the convenient-carrier and sphere-suspension comparisons;
- the real and complex orthonormal-two-frame homogeneous identifications from native frames and SBC quotients, with their separate dimension and stabilizer cases;
- the projective quotient comparisons, Hopf metrics, quaternionic vector fields and Fubini--Study form comparison;
- the Stiefel-map and rotation-family degree computations;
- projective loop-energy/index/perfectness/generator applications on the supplied CKG/GC carriers and RiemannianGeometry metrics;
- the multiple-realization application;
- abundance and its sources, the finite-rank odd-sphere group, Proposition 6.31, and the knotted-hypersurface theorem.

---

## Layer 1: carriers, comparisons and explicit maps

These are the carriers and explicit maps that Layers 2 and 4 consume. They rest on the base
roadmap's Layers 1--2 and on the suppliers named above.

1. **Convenient carriers.** The HomotopySpheres Stage 3A convenient internal hom is compact-open followed by compact generation k. Construct the comparison using the actual counit kZ→Z and the compact-Hausdorff test/currying maps; prove its based homotopy-group and singular/cubical-chain comparisons, and its compatibility with endpoints, cap/reference maps, constant sections and path composition. Convenient multiplication uses k-products; an ordinary product of k-spaces is not silently already k. Parameter-family transport retains the actual compact-generation hypotheses on its parameter/domain. These weak comparisons do not create Hurewicz lifts or fibre homotopy equivalences: consume G2.10's raw lifting maps and the explicit DGFloer Layer 2 Moore replacement maps/homotopies for those stronger results.
2. **The based sphere, its suspension model and the James ring.** Consume AlgebraicTopology Stage4.4's reduced-suspension sphere homeomorphism and compact reduced-suspension carrier comparison on the same based sphere, with interval-last coordinate order and its reference generator. Construct this sphere's based comparison to HomotopySpheres §§3A.1–2's categorical reduced suspension: the raw interval-product quotient is compact Hausdorff and hence already compactly generated. Apply §3A.1's inclusion-preserves-colimits theorem to §3A.2's actual pointed quotient/pushout cocone, then use the quotient universal properties and fully faithful inclusion to construct the isomorphism with the kified raw quotient. Prove its quotient-map and basepoint diagrams. Compose it with AlgebraicTopology Stage4.4's raw-to-kification counit comparison and verify the interval-last/reference-generator diagrams; use the supplied sphere homeomorphism and normalized class. Through this comparison, HomotopySpheres Stage 3B item 3's James map and tensor-algebra computation of `H_*(ΩΣX)` give the Pontryagin ring `H_*(ΩSⁿ)` as a polynomial ring on one generator of degree `n−1` for the based fixed-interval loop carrier; transport it to the base roadmap's Moore-loop carrier through its standing Moore comparison, as a ring under the cubical cross product and Moore concatenation. Layer 4 item 2 consumes this ring.
3. **Homogeneous examples on designated carriers.** Consume [SBC B1.4](../SmoothBundlesConnections/README.md#b14-slices-quotients-and-homogeneous-spaces) for proper free-action smooth quotients, principal projections and tangent quotients, and LieGroups Layer2 for the real/complex closed matrix subgroups. Consume [CKG K7.1](../ComplexKahlerGeometry/README.md#k7-projective-torus-and-hopf-examples) for its complex projectivization atlas and real restriction, [GC G4.0b](../GeneralizedCohomology/README.md#g4-generalized-lerayhirsch-thom-and-euler-theory) for the designated Sp, quaternionic frame/Grassmannian/HP carriers and smooth Hopf comparisons, and Riem R1 for the normalized quotient metrics. Retain the supplied topologies, smooth structures and explicit quotient comparisons.
   - For n≥3 construct the ordered orthonormal-two-frame identification SO(n)/SO(n−2), with stabilizer diag(I₂,SO(n−2)), actual orbit/inverse maps, tangent quotient and sphere-bundle projection. For n=2 the carrier is O(2)=SO(2)⊔rSO(2), r=diag(1,−1), with determinant distinguishing the two SO(2) orbits; for n<2 it is empty. Compare with O(n)/O(n−2) for every n≥2, so both descriptions use this same frame carrier.
   - On the native complex ordered orthonormal-two-frame carrier in ℂⁿ, for n≥2 construct the U(n)/U(n−2) comparison with stabilizer diag(I₂,U(n−2)), actual orbit/inverse maps, tangent quotient, principal local sections and the first-vector sphere-bundle projection. For n=2 this is U(2), while n<2 gives the empty frame carrier. This is the complex analogue on its own carrier, not an identification with the real SO quotient; retain the quaternionic frame comparisons on GC's designated carriers.
   - On the designated CPᵈ carrier pin the supplied quotient comparison U(d+1)/(U(1)×U(d))→CPᵈ to [g]↦[g e₀], including subgroup blocks, basepoint, principal local sections and agreement with K7.1's complex orientation. On GC's designated HPᵈ carrier pin its Sp(d+1)/(Sp(1)×Sp(d)) comparison to [g]↦[g e₀]_ℍ. Its native Projectivization uses right lines through ℍᵐᵒᵖ, with v∼vλ; compare the supplied charts on v_i≠0 with right ratios v_j v_i⁻¹ and representative with i-coordinate1, and verify right-scaling invariance. These are comparisons on the supplied carriers and smooth structures.
   - Transport the supplied unit-round Hopf metrics. Prove Hermitian compatibility of the CP metric with its designated complex structure, and the orientation/metric/quotient-chart comparisons. For d≥1 the primitive unit-speed period is π; d=0 is a point. For d≥2 the sectional curvature bounds1 and4 are both attained; CP¹ and HP¹ have curvature4 and radius1/2. Prove projective lines totally geodesic with this metric scale. Layer 2 constructs the energy/index/perfectness/generator applications with that scale, or explicitly transports a different one.
   - Construct the three pointwise orthonormal quaternionic vector fields on S^(4k−1).
   - After K7.2 and its SBC B6.2–B6.3 inputs, construct the separate CP form comparison. For the earlier Hermitian metric g and complex structure J put ω_g(X,Y)=g(JX,Y). Prove closedness and ω_g=π·ω_FS for the unit-round Hopf normalization above, with ∫_(CP¹)ω_FS=1. For d≥1 calculate the scale from the oriented radius1/2 complex line, whose area is π; for d=0 both forms vanish. Prove compatibility with the same quotient/charts. Under a positive metric rescaling prove the corresponding positive form scale. This later comparison is not a premise of the earlier metric, totally-geodesic, index, perfectness or generator applications.
4. **Degrees of explicit maps.** Construct and orient the actual Stiefel-domain map T¹S^(n−1)×S¹→S^(n−1)×S^(n−1) of Proposition6.17 using item 3's frame/sphere-bundle comparison, and count its regular preimages with the stated product orientations. Separately, for fixed p∈Sⁿ, identify T¹_pSⁿ≅S^(n−1) and construct the rotation family S^(n−1)×S¹→Sⁿ of the second proof of Proposition6.34. Compute its degree2 for odd n by regular preimages and local signs. This fixed-p construction has no Stiefel-quotient, unstable Bott or Pontryagin–Thom premise. The Diff-family/evaluation and covered-by-diffeomorphisms comparisons are made in Layer 4 item 3.
5. **Comparison of collapses.** For a framed closed submanifold `N` of `Sⁿ⁺ᵏ` missing a point, compare DGFloer Layer 1 item 5's collapse `Sⁿ⁺ᵏ → Sᵏ`, built from a tube in the sphere, with HomotopySpheres Stage 5's collapse built from a tube in `ℝⁿ⁺ᵏ` through the stereographic chart at the missing point: for a tube contained in the chart the two maps agree on the nose after the chart identification, and for arbitrary tubes they are based homotopic by the independence theorems of both suppliers. State the comparison for the chosen framings and prove its compatibility with the effect on fundamental classes.
6. Source: the source paper §§6.3--6.4; Milnor--Stasheff, *Characteristic Classes*, Chapter 5;
   Steenrod, *The Topology of Fibre Bundles*, Part I, §7.

## Layer 2: based-loop Morse--Bott energy on `CPᵈ` and `HPᵈ`

This layer computes the integral homology of the based loop spaces of the complex and
quaternionic projective spaces with explicit, calibrated generators, by Morse--Bott theory of the
energy functional on the finite-dimensional approximations of DGFloer Layer 5 item 6, on the
carriers and metrics of Layer 1 item 3. Layer 4 item 5 consumes its generators and the
geometric sphere family of item 6.

1. **Critical manifolds, indices and attachments.** Use the actual Riem R1 metrics, R2 Jacobi ODE/endpoint data and R3 index form/finite-node comparison, and MorseTheory M5's compact-band normal attachment theorem. On the finite approximations to Ω_p construct the critical manifolds of constant and iterated geodesics, calculate their negative bundles, indices and nullities on that same metric, and identify their Thom orientation systems and attachment maps. HS4B's Bott-chain computations are comparisons on their stated examples, not the generic owner of these constructions.

2. **Integral perfectness and calibrated generators of `ΩCPᵈ`.** For d≥1 prove the integral perfectness and calibrate the explicit generators H_(2d)(ΩCPᵈ)=ℤ and H_(4d+2)(ΩHPᵈ)=ℤ. In the CP calculation the cells have degrees a_k=2d(k−1)+1 and b_k=2dk, k≥1, with the constant cell in degree0. Since a_(k+1)−b_k=1 for every d≥1, zero boundary is proved by the following homology/attachment comparison, not a lacunarity inference.

   Construct j:S¹→ΩCPᵈ adjoint to the normalized projective-line generator, and the based Hopf product j⋆Ωq:S¹×ΩS^(2d+1)→ΩCPᵈ. The Hopf fibration LES proves its π₁ and higher homotopy isomorphisms. Use DGFloer Layer 1 item 2's early weak-equivalence homology comparison, integral Künneth and the supplied odd-sphere based-loop calculation to obtain ℤ in degrees2dk and2dk+1 and zero elsewhere. For CP¹ consume Riem R3's actual ΩS² calculation at radius1/2 with the explicit time/metric normalization. Construct the oriented Morse–Bott Thom/CW model with one ℤ cell in the displayed degrees; prove orientability of the negative bundles and identify these cells on the finite approximations. Finite-type energy-filtration convergence and the final homology ranks force each integer cellular boundary to vanish. Construct the actual generator representatives/completing cycles and their energy and Thom-cell comparison. This proves perfectness and the generator assertions on the chosen based carrier.

3. **The quaternionic case `ΩHPᵈ`.** For HPᵈ the analogous cell degrees have within-level gap4d−1 and successive-level gap3; prove the actual negative-bundle/Thom model before using these gaps to infer vanishing boundaries and identify its calibrated generator. The case d=0 is the constant point space. The free-loop extension in DGFloer Layer 5 item 6 is a separate construction; the based Hopf calculation alone does not give it.

4. **Fibre representatives and the distinct path-loop total-space comparison.** For B=CPᵈ or HPᵈ construct a chain comparison from the oriented Morse–Bott energy/Thom model E_B to C_*(Ω_p B;ℤ), carrying the chosen completing cycles and calibrated generators to designated singular/cubical representatives. Prove it by the actual finite-energy attachment maps, compact-band comparison and filtered colimit; retain its energy-filtration statement only on this fibre model. It computes H_*(Ω_p B), not H_*(P_p B). Its perfectness and generator proof above remains independent of the following comparison.

   Use DGFloer Layer 4 item 5's genuine augmented semi-free P_B and DGFloer Layer 5 item 4's fibration-chain theorem for Ω_p B→P_p B→B. Here the total complex C_*(Ω_p B)⊗_{C_*(Ω_p B)}P_B is compared with C_*(P_p B), with base-cell filtration. If replacing the fibre chains by E_B, construct the compatible homotopy-coherent loop action and its DG-module rectification first, with actual integral split/free chain data and the DG supplier's bar/module comparisons. Justify the chosen chain contractions from the free integral fibre homology and the calibrated chain comparison, keep the higher module coherence, and prove the required degreewise finiteness of the bar/perturbation formulas before base change. Construct the coefficient maps, relative attaching comparisons and filtration-preserving homotopies that compare the resulting two total-space models. Their total-space spectral sequences agree from the proved page onward and abut to H_*(P_p B), which is trivial in positive degrees. Do not identify that sequence or its abutment with the energy-filtered fibre sequence. A plain derived-module equivalence, without these action and filtered maps, is insufficient. Name the actual page comparison and the edge/fibre inclusion squares used on representatives.

5. **Primary differentials and mixed-bidegree boundary maps.** On the designated projective carriers, normalize the base cell/cup/Thom classes using GC G4.0/G4.3–5 and AT. Calculate the primary d₂ for CPᵈ and d₄ for HPᵈ and construct the subsequent mixed-bidegree relative-boundary maps: d_(2d):E_(2d,1)→E_(0,2d) for CPᵈ and d_(4d):E_(4d,3)→E_(0,4d+2) for HPᵈ. Identify the surviving source/target representatives, their unit integer coefficient and sign by the actual total-space/fibre comparison and chosen orientations. For d=1 these maps occur on the same page as the primary differential and must be computed together, not assumed to survive an earlier distinct page. For d=0 retain the separate point case. Ordinary base-to-fibre transgression from a nonexistent H_(2d+1)(CPᵈ) or H_(4d+3)(HPᵈ) is not the higher-generator construction.

6. **The geometric sphere family of Propositions 6.38 and 6.39.** For Propositions6.38/6.39 construct the actual map from the geometric sphere family to the completing manifold, its fibrewise degree±2 and its compatibility with β under sphere-loop adjunction. With g the calibrated generator, prove β_*(σ_p)_*[Σ_p]=±2g in degree2d for CPᵈ and4d+2 for HPᵈ, fixing the sign by the stated orientations; do not relabel this nonprimitive class as g. Keep the projective-line geometric construction, the independent based Hopf/perfectness proof, and the separate free-loop application with its own hypotheses. Equality of abstract copies of ℤ does not supply any of these representative, action or filtration maps.
7. Source: BDHO Chapters 5--13; the source paper §§4.3--4.4 and 6.4; Bott, *The stable homotopy of
   the classical groups*, §§1--3; Ziller, *The free loop space of globally symmetric spaces*.

## Layer 3: multiple realization and Theorem B

Theorem A of the base roadmap (DGFloer Layer 10 item 5) needs a closed oriented manifold mapping
to the free loop space with nonzero degree over `Q`. Theorem B replaces the manifold by a rational
homology class; the realization of its multiple by a manifold is the application constructed here.

1. **Rational realization of a homology class.** Consume the designated GC Thom/collapse/stabilization/finite-duality comparisons and G5 rational spectral Hurewicz, then TB B5's geometric PT and B6.3's rational SO-bordism orientation surjection, retaining their actual early mapping-path/Thom inputs and DGFloer Layer 1 items 2 and 4. On a smooth boundaryless `U` lift α⊗1 to a finite rational bordism combination. Clear denominators and then kill the finite-order torsion difference to obtain a closed oriented finite disjoint union S and continuous f:S→U with f_*[S]=Nα, N≥1.
2. **The compact-image embedding and smoothing.** Construct the compact-image embedding here: choose finitely many target charts φ_i and smooth supported cutoffs ρ_i near f(S), with Σρ_i>0 on W, and define e(x)=(ρ_i(x),ρ_i(x)φ_i(x))_i, extending each supported block by zero. Where ρ_i>0 the ratios recover φ_i; this proves injectivity, continuous local inverse and, by differentiation, immersion. Restrict a precompact neighborhood of the image if required. GT supplies the actual normal tube of this embedding, with positive uniform radius on the compact core. Smooth e∘f on S by partitions/mollifiers closely enough for the tube, project back and construct the small homotopy in U. A fixed-relative version supplies its own collar data. DG supplies the partition/smoothing floors; the finite-chart embedding is this application's construction, not GT's output.
3. **Theorem B (= Theorem 5.14).** Then φ_*[S]=Nα and the representing-witness argument of DGFloer Layer 10 item 5 (Theorem 5.10, applied to the smoothed map) gives degree `Nb≠0` from `π_(U*)α=b[Q]≠0`; this proves Theorem 5.14. DGFloer Layer 10's all-dimensional DG trajectory/chain inputs come from its Layers 7.2, 8 and 9, and its module-comparison corollaries use the actual common readout only on their specified overlap. No integral every-class realization is asserted.
4. **Corollaries D and E in their Theorem B forms.** Transport Theorem B along DGFloer Layer 6 item 3's magnetic fibre translation `Ψ'_σ`, and through DGFloer Layer 6 item 4's Liouville-flow argument, exactly as DGFloer Layer 10 item 5 does for Theorems A and C; the realization input of items 1--2 and the degree hypothesis are unchanged by either transport.
5. Source: the source paper §§1.2 and 5.

## Layer 4: manifolds abundant with 2-spheres, and knotted hypersurfaces

1. **Abundance** (Definitions 1.7 and 6.11), **Theorem H** (= Theorem 6.12), and stability under
   products (Proposition 6.13), through the DG Morse fibration theorem and the classes living over
   the fundamental class of DGFloer Layer 5 items 4--5, and the cotangent form of Theorem M,
   Proposition 6.7, of DGFloer Layer 10 item 2.
2. **Fibered families of 2-spheres** (Definition 6.14, Proposition 6.15).
   - Even spheres: the Pontryagin ring `H_*(ΩSⁿ)` as a polynomial ring on the class of the DG
     Morse cocycle (Proposition 6.18). The ring itself is HomotopySpheres' James
     computation (Stage 3B item 3), using AlgebraicTopology Stage 4.4's reduced-suspension sphere homeomorphism and compact reduced-suspension carrier comparison with the fixed interval-last coordinate order and based reference class, and the sphere-specific comparison of Layer 1 item 2 from HomotopySpheres §§3A.1–2's actual colimit-preserving inclusion and pointed suspension cocone, with its quotient/basepoint/reference-generator diagrams; what is proved here, through DGFloer Layer 5, is that the DG Morse
     class is a generator. Also nonvanishing of the Stiefel class in `H_{2n−3}(Ω²Sⁿ)`
     (Proposition 6.17).
   - Spheres `S^{4k−1}`: the class in `H_{n−2}(Ω²Sⁿ) ≅ ℤ` is a generator (Proposition 6.21).
   - **Sphere bundles over highly connected bases (Proposition 6.23).** Work in the standing
     closed, connected, oriented total-space setting of §6.4.2. A smooth `Sⁿ`-bundle
     `Sⁿ ↪ Q → B`, `n≥2`, whose structure group reduces to `O(n+1)` is the unit-sphere bundle
     of a rank-`n+1` real vector bundle with a fiberwise metric; construct this equivalence and
     the vertical tangent bundle `TᵥQ`. Prove the two alternatives separately:
       * `n` even and `B` is `2n`-connected. The parameter fibre over `q∈Q` is the oriented
         manifold `Stiefel₂(Tᵥ,q)` of ordered orthonormal two-frames in the tangent space to the
         sphere fibre. Put the explicit Example6.16 sphere-family map into these fibres and
         include each sphere fibre into `Q` to obtain `Σ→Q` and `σ:Σ→Map(S²,Q)`.
       * `n≡3 (mod 4)` and `B` is `(n+1)`-connected, with two everywhere independent vertical
         vector fields `u,v`. Normalize them to an orthonormal pair. For `q` in the fibre, put
         `V_x=u(x)⊥` in the ambient rank-`n+1` Euclidean bundle and take the unit sphere in
         `V_x∩v(x)⊥`, the carrier `E_{V_x,x,v(x)}` of Example6.20. Here `x` and `v(x)` are
         orthogonal unit vectors in `V_x`, so this is the equator `S^{n−2}` through `x`; its
         points are sphere-fibre points, not tangent vectors at `x`. Use the explicit two-field
         sphere-family map and the sphere-fibre inclusion to construct
         the corresponding oriented `Σ→Q` and `σ:Σ→Map(S²,Q)`.
     In both cases prove the carrier's orientation and local triviality, continuity/smoothness
     of the family map, compatibility of the fibre map with the based loop inclusion
     `Ω²Sⁿ→Ω²Q`, and nonvanishing of its fibre class. For the even case the fibre class is in
     `H_(2n−3)(Ω²Sⁿ;ℤ)`; `2n`-connectivity gives `π_i(Ω²B)=0` for `i≤2n−2`, hence
     `H_i(Ω²B;ℤ)=0` for `1≤i≤2n−2`, and the Serre spectral sequence gives the inclusion
     isomorphism through degree `2n−3`. For the odd case the class is the generator in
     `H_(n−2)(Ω²Sⁿ;ℤ)`; `(n+1)`-connectivity gives `π_i(Ω²B)=0` for `i≤n−1` and the same
     spectral-sequence comparison through degree `n−2`. Include basepoint-change and coefficient
     maps in these comparisons; do not infer either conclusion from connectivity without its
     looped fibration, Hurewicz, and spectral-sequence argument. Since either connectedness
     assumption makes `B` simply connected and `Sⁿ` has trivial fundamental group, prove `Q` is
     simply connected; use this to trivialize the carrier's orientation local system over `Q`.
     The odd-case two-field condition
     is an actual hypothesis; quaternionic Hermitian sphere bundles are one verified source of
     such fields, not a substitute for the general target.
3. **Covering by diffeomorphisms** (Definitions 6.26 and 6.32, over geometric topology's `Diff(M)`).
   - Abundance of manifolds covered, or `ℓ`-covered, by diffeomorphisms (Propositions 6.29
     and 6.33).
   - **Compact connected Lie groups (Proposition6.31).** Consume DGFloer Layer 11 for the finite
     covering `T×K→G` and the criterion that a compact connected Lie group is a `K(π,1)` exactly
     when it is a torus, which is the aspherical hypothesis of Example6.30 for every non-torus
     compact connected `G`. Then use `G→Diff(G)` by left translation, its evaluation identity at
     `e`, and Proposition6.29 to prove Proposition6.31. No Lie theory is rebuilt here.
   - **Finite-rank odd-sphere group (Lemma6.35).** For every odd `n≥3`, prove torsion of `π_(n−1)(SO(n))` with finite-rank data, not stable periodicity alone. Give explicit low-rank computations
     `π₂(SO(3))=0`, `π₄(SO(5))=ℤ/2`, `π₆(SO(7))=0`, `π₈(SO(9))=(ℤ/2)²`, and
     `π₁₀(SO(11))=π₁₂(SO(13))=π₁₄(SO(15))=ℤ/2`, including maps/fibration exact sequences that certify each value. For odd `n≥17`, construct the finite-rank comparison/splitting
     `π_(n−1)(SO(n)) ≅ π_(n−1)(O) ⊕ π_n(V_(n+2,2)(ℝ))`; prove the stated stable term is `0` or `ℤ/2` by HomotopySpheres Stage4A–4B's stable real Bott computation and prove the Stiefel term is `ℤ/2` in this range from the named Stiefel fibration/extension data. State the comparison maps and the range in which stabilization applies. The source's Lemma6.35 proof prints `π₈(SO(9))=ℤ/4`; retain that literal value as a source error, not as a theorem target. The corrected value is `(ℤ/2)²`: construct the stabilization `π₈(SO(9))→π₈(SO)=ℤ/2`, its kernel `ℤ/2` and a splitting, as described in [Crowley–Schick–Steimle, proof of Lemma2.2](https://www.researchgate.net/publication/347965860_The_derivative_map_for_diffeomorphism_of_disks_An_example) (arXiv:2012.13634v1). Compare with the `SO(8)→SO(9)→S⁸` exact sequence and `π₈(SO(8))=(ℤ/2)³` to certify the exponent-two result. The other cited values and large-rank splitting remain construction targets with their actual maps, ranges and extension data; a source table alone does not prove them. The torsion conclusion and both proofs of Proposition6.34 retain their full scope.
   - **First proof of odd-sphere covering (Proposition6.34).** Use the evaluation fibration
     `SO(n)→SO(n+1)→Sⁿ` and its exact segment
     `π_n(SO(n+1))→π_n(Sⁿ)→π_(n−1)(SO(n))`. Since `π_n(Sⁿ)=ℤ` and the last group is torsion, the boundary map has a nonzero kernel; exactness gives a class mapping to `ℓ[Id_(Sⁿ)]`, `ℓ>0`. Carry it through the Hurewicz map to `H_n(SO(n+1);ℤ)`, then through the standard action `SO(n+1)→Diff(Sⁿ)` and evaluation to obtain `ev_*A=ℓ[Sⁿ]`. Apply Proposition6.33 using that `π_n(Sⁿ)=ℤ` is not `ℓ`-torsion. Retain the second geometric proof below as a separate complete route, including its degree-2 rotation family; neither proof may stand in for the other.
   - **Second proof of odd-sphere covering (Proposition6.34).** Retain the independent proof already specified: use GT Layer 3 and DGFloer Layer 1 item 6's local evaluation bundle, Layer 1 item 4's fixed-`p` rotation family of degree `1+(-1)^(n−1)=2` for odd `n`, with domain `T¹_pSⁿ×S¹`; construct its homology class and verify its evaluation is `2[Sⁿ]`. Apply Proposition6.33 with the degree-2/non-2-torsion sphere class and its stated homological comparison. This is the direct degree/evaluation proof, with no Pontryagin–Thom or unstable Bott premise.
4. **Homogeneous spaces (Proposition6.36), including `S²=SO(3)/SO(2)`.** For a compact connected Lie group `G` and a closed, positive-dimensional Lie subgroup `H`, define the left actions
   `Φ_H:H×Ω²(G/H)→Ω²(G/H)` and
   `Φ:G×Map(S²,G/H)→Map(S²,G/H)`, and the evaluation fibration
   `ev:Map(S²,G/H)→G/H` with fibre `Ω²(G/H)` over `eH`. Given
   `α∈H_*(Ω²(G/H);ℤ)` such that `(Φ_H)_*([H]×α)≠0`, construct the map of fibrations induced by
   `H↪G→G/H` and `Map(S²,G/H)→G/H`. Prove `j_![G]=[H]` for the fibre inclusion and prove shriek naturality, with the coefficient maps, degree shifts, cross-product signs and basepoint identifications, to obtain
   `j_!Φ_*([G]×α)=(Φ_H)_*([H]×α)`. Because `dim H>0`, verify the source's reduced-homology condition after the degree shift; then show the class lies over the base fundamental class and satisfies Definition6.11.

   The source states the result for every closed `H`, even when `M=G/H` is not orientable, while Definition6.11 is stated for oriented manifolds. Preserve this generality with the evaluation-pullback orientation system `ev*or_M`. Choose a generator `o` of its fibre at `eH` and a left-invariant orientation of `G`. For `π:G→M`, construct the flat trivialization `τ(g)=d(L_g)_(eH)(o)` of `π*or_M`, and prove its compatibility with paths and the action's coefficient map. On `H` it is `τ(h)=χ(h)o`, where `χ(h)` is the sign of the isotropy action on `T_(eH)M`. Compute the fibre-coorientation sign relative to the left-invariant orientation of `H`; it is the same `χ(h)`. Thus the twisted shriek satisfies `j_![G]_τ=[H]` with the ordinary left-oriented fundamental cycle on all components: the two signs cancel. Ordinary untwisted `j_![G]` must not silently be identified with that cycle when the quotient is nonorientable.

   Form `β=Φ_*([G]_τ×α)` in `H_(dimG+degα)(Map(S²,M);ev*or_M)` using the actual action coefficient map, and prove the same square gives `j_!β=(Φ_H)_*([H]×α)` in ordinary homology after the chosen basepoint-fibre identification. Because `dim H>0`, the class has degree above `dim M` and its nonzero shriek has positive degree. Construct the twisted abundance implication by tensoring the path-fibration DG coefficient system in the Theorem6.12 proof with the evaluation-pullback `or_M`, including its restriction along constant loops and the actual chain/transport comparison. Identify the total path-space readout with `H_*(M;or_M)`, whose groups above `dim M` vanish; then apply the already stated nonorientable form of Proposition 6.7 (DGFloer Layer 10 item 2) with the resulting nonzero shriek and zero constant-loop image. This is an assigned coefficient construction and proof, not an assumption that the oriented theorem already applies. Recover the ordinary oriented statement by an orientation trivialization; no connectedness of `H` is imposed.

   For `S²=SO(3)/SO(2)`, take `α` in `H₀(Ω²S²;ℤ)` represented by a degree-one map. Compute its `SO(2)` action class `α′∈H₁(Ω²S²;ℤ)` and prove it is nonzero by identifying it with the cycle `σ_{p*}[Σ′_p]` of Remark6.19. Under `β_*:H₁(Ω²S²)→H₂(ΩS²)`, identify the class with the Pontryagin square of the generator of `H₁(ΩS²)`. Then compare the resulting `SO(3)` action class in `H₃(Map(S²,S²);ℤ)` with `σ_*[Σ′]`, including orientation choices and the evaluation shriek map. This is the worked instance of the general action/shriek construction, not an appeal to Proposition6.36 alone.
5. **Projective spaces.** `CPᵈ` (Proposition 6.38) and `HPᵈ` (Proposition 6.39 without the Cayley
   plane), from Layer 2. These give **Theorem I** within the scope boundary.
6. **Knotted hypersurfaces.** **Theorem G** (= Theorem 7.1), through Proposition 7.5 and
   Lemmas 7.6 and 7.7, using the Pontryagin--Thom collapse of DGFloer Layer 1 item 5.
7. Source: the source paper §§6.3--6.4 and §7.

## Acceptance criteria

1. **Low-rank values.** `π₂(SO(3)) = 0` through the double cover `S³ → SO(3)`, and
   `π₈(SO(9)) = (ℤ/2)²` through the stabilization `π₈(SO(9)) → π₈(SO) = ℤ/2` with kernel `ℤ/2`
   and a splitting; the source's printed `ℤ/4` is recorded as a source error and is not a target.
2. **The rotation family for `n = 1`.** With `p = (1, 0)`, the unit tangent sphere `T¹_pS¹ = S⁰`
   consists of `±e₁`; the two circles `θ ↦ cos θ·p ± sin θ·e₁` wind in opposite directions, and
   with the orientation of `S⁰` as a 0-manifold the family `S⁰ × S¹ → S¹` has degree `2`, which
   is `1 + (−1)^{n−1}` for `n = 1`.
3. **`S² = SO(3)/SO(2)`.** The `SO(2)` action class `α′ ∈ H₁(Ω²S²; ℤ)` of a degree-one map is
   nonzero, `π₀Map_*(S², S²) ≅ ℤ` (the base roadmap's acceptance criterion 5), and the kernel of
   `i_{S²*}` contains `ℤ` in degree zero; so `S²` is abundant with 2-spheres by Layer 4 item 4,
   and `∂U` has the contractible almost existence property for every bounded `U ⊆ T*S²`
   containing the zero section, agreeing with the base roadmap's criterion 8.
4. **Projective generators.** For `CP¹`, Layer 2's cell degrees are `a_k = 2k − 1` and `b_k = 2k`,
   and `H_*(ΩCP¹) ≅ H_*(ΩS²)` in every degree; the calibrated generator of `H₂(ΩCP¹)` is the
   Pontryagin square of the generator of `H₁(ΩS²)` under the based Hopf comparison, and
   `β_*(σ_p)_*[Σ_p] = ±2g`.
5. **Tori and `SU(2)`.** A torus `T^r` is aspherical and, since the flat torus has no contractible
   closed geodesics, `c°_HZ(D*T^r) = ∞` by Proposition 6.3, so it is not abundant with 2-spheres;
   `SU(2) = S³` has `π₃ = ℤ`, is not aspherical, is covered by diffeomorphisms through left
   translation, and `c°_HZ(D*SU(2)) < ∞` follows from Theorem H as well as from the base
   roadmap's Theorem C.
6. **Multiple realization on a torsion class.** For a class `α` of finite order `N`, the
   realization of Layer 3 item 1 may be `S = ∅` with `f_*[∅] = 0 = Nα`, and Theorem B's hypothesis
   `π_{U*}α = b[Q] ≠ 0` excludes this case because `[Q]` has infinite order; the check is that the
   construction and the hypothesis are stated so that this is literally what happens.

## Source coverage

This section is provenance, not specification: it records where each numbered statement of the
source paper within this roadmap's scope lands, so a reviewer can check that nothing is missing.
Numbers follow the same revised version of the source as the base roadmap's coverage table.

| Source statements | Layer and item |
| --- | --- |
| Thm B | 3.3 (Thm 5.14): representing-map endpoint and GC/TB multiple-realization application |
| Cor D, E, Theorem B forms | 3.4, through DGFloer 6.3 and 6.4 |
| Thm G | 4.6 (Thm 7.1) |
| Def 1.7, Thm H | 4.1 (Def 6.11, Thm 6.12) |
| Thm I | 4.2--4.5, without `CaP²` |
| Thm 5.14 | 3.3 |
| Def 6.11, Thm 6.12, Prop 6.13 | 4.1 |
| Def 6.14, Props 6.15, 6.17, 6.18, 6.21, 6.23 | 4.2 (degree computation 1.4; the James ring 1.2) |
| Defs 6.26, 6.32, Props 6.29, 6.33 | 4.3 (evaluation fibration DGFloer 1.6) |
| Prop 6.31 | 4.3, from the finite cover and torus criterion of DGFloer Layer 11 |
| Prop 6.34 | 4.3, both the Lemma 6.35/LES proof and the independent degree-computation proof (1.4) |
| Lem 6.35 | 4.3, low ranks and stable-plus-Stiefel finite-rank comparison; used by the first proof of Prop 6.34 |
| Prop 6.36 | 4.4 |
| Props 6.38, 6.39 | 4.5, consuming Layer 2's Riem R1--R3 and MorseTheory M5 based-loop application and its actual index/perfectness/generators; without `CaP²` |
| Thm 7.1, Prop 7.5, Lems 7.6, 7.7 | 4.6 (collapse DGFloer 1.5) |

## References

- J.-F. Barraud, M. Damian, V. Humilière, A. Oancea, *Floer homology with DG coefficients.
  Applications to cotangent bundles*, [arXiv:2404.07953](https://arxiv.org/abs/2404.07953): the
  source paper.
- J.-F. Barraud, M. Damian, V. Humilière, A. Oancea, *Morse homology with differential graded
  coefficients*, Progress in Mathematics 360, Birkhäuser, 2025 (BDHO): Layer 2 and the DG Morse
  inputs of Layer 4.
- R. Bott, *The stable homotopy of the classical groups*, Ann. of Math. 70 (1959); W. Ziller,
  *The free loop space of globally symmetric spaces*, Invent. Math. 41 (1977): Layer 2.
- D. Crowley, T. Schick, W. Steimle, *The derivative map for diffeomorphism of disks: an example*,
  [arXiv:2012.13634](https://arxiv.org/abs/2012.13634), proof of Lemma 2.2: the value of
  `π₈(SO(9))` in Layer 4 item 3.
- J. Milnor, J. Stasheff, *Characteristic Classes*, Annals of Mathematics Studies 76, Princeton,
  1974, Chapter 5; N. Steenrod, *The Topology of Fibre Bundles*, Princeton, 1951, Part I, §7:
  Stiefel manifolds and frame quotients in Layer 1.
- A. Hatcher, *Algebraic Topology*, Cambridge, 2002, §4.2: fibration sequences and the homotopy
  groups of Lie groups and Stiefel manifolds used in Layer 4 item 3.

## How to drive it

Layer 1 builds the carriers and comparisons first: the convenient and sphere comparisons from the
base roadmap's Layer 2 and the suppliers' convenient spaces, the frame and projective quotients from
SBC, LieGroups, CKG and GC, and the explicit degree computations from the base roadmap's degree
interface. Layer 2 is finite-dimensional Morse--Bott theory on those carriers and consumes Riem
R1--R3 and MorseTheory M5 without touching Floer theory. Layer 3 consumes GC G5 and TB B5/B6.3
together with the base roadmap's Theorem A. Layer 4 consumes the base roadmap's DG Morse homology,
fibration theorem, shriek maps and Theorems M, A and C, the carriers of Layers 1--2 and the named
GC/TB/HS/GT/SBC/Lie inputs; it requires no Floer counts of its own. The abundance and
multiple-realization applications use their explicit lower cubical/CW/Hurewicz/Serre/filtered
interfaces and actual degree/evaluation maps, and the later projective abundance application uses
Layer 2's actual based-loop index/perfectness/generator calculation.
