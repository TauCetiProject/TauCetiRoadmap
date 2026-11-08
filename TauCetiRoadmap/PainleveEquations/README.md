# Painlevé equations

Construct differential Painlevé equations as flat nonlinear connections on moduli spaces of decorated meromorphic connections, and Painlevé functions as their horizontal sections and admissible observations. Prove their properties from those constructions. The classical scalar equations, Hamiltonians and linear systems are coordinate comparison theorems.

The roadmap contains 55 construction and theorem targets in eight layers: 19 targets of reusable general theory and 36 targets for the classical Painlevé application.

## Structure

Each layer develops one mathematical construction or theorem package. General results retain their own hypotheses, conclusions and proof ownership when placed alongside an application.

| Layer | Mathematical development | Targets |
|---:|---|---:|
| [0](#layer-0) | Nonlinear connections and their solutions | 8 |
| [1](#layer-1) | Moduli of decorated meromorphic connections | 6 |
| [2](#layer-2) | Isomonodromic connections | 4 |
| [3](#layer-3) | Phase spaces and isomonodromic deformations of Painlevé equations | 12 |
| [4](#layer-4) | Riemann–Hilbert comparison and the Painlevé property | 9 |
| [5](#layer-5) | Initial-condition surfaces, symmetries and Riccati reductions | 6 |
| [6](#layer-6) | Determinant lines and tau sections | 5 |
| [7](#layer-7) | Classical forms of Painlevé equations | 5 |

<a id="general-theory"></a>

## General theory and applications

The scope consists of the 55 targets below. Each target includes its constructions, basic API, comparison maps and specified examples, under the stated hypotheses.

| Reusable general theory | Targets |
|---|---|
| Nonlinear connections, solutions, transport, observations and jets | 0.1–0.8 |
| Moduli of decorated meromorphic connections | 1.1–1.6 |
| Isomonodromic connections | 2.1–2.4 |
| Determinant lines of holomorphic Fredholm families | 6.1 |

The 19 general targets form an independent theory. The 36 application targets construct Painlevé phase spaces, connections and forms from it and establish their properties. Their dependencies are the prerequisites listed at each target. In particular, the geometric constructions and properties in Layers 3–6 precede the classical coordinate comparisons in Layer 7.

External roadmaps supply the results listed in the dependency contracts. Each construction made here has a specified target. Applications use the general objects, morphisms and pullbacks through the stated hypotheses and comparison maps.

## Addresses and conventions

Layers are numbered 0–7, and targets are numbered consecutively within each layer, as in 0.1 and 0.2. Literature and supplier sections use their source numbering. The *Needs* lists specify proof prerequisites. Each target states its hypotheses, constructions and comparison laws.

<a id="external-dependencies"></a>
## External dependency contracts

Roadmap references specify constructions and theorems with their hypotheses. Library references specify declarations and APIs. The table identifies the supplied results and the constructions assigned to this roadmap.

| Contract | Exact supplier | Scope and local extension |
|---|---|---|
| <a id="dependency-complex"></a>complex | [ComplexKahlerGeometry](../../TauCetiRoadmap/ComplexKahlerGeometry/README.md) — K1; K3.0; K3.HolomorphicStalk; K3.MeromorphicGermField; K4; K7.1 | Complex inverse/implicit-function and tangent calculus; holomorphic germs and one-variable meromorphic germs; holomorphic bundle/sheaf equivalence and nonsingular flat connections/local systems; projective charts. The nonlinear-connection theory owns nonlinear connections, holomorphic ODEs, transport and observations. 1.1–1.2 own the meromorphic/decorated applications of the shared connection and analytification interfaces; K4 supplies the nonsingular holomorphic comparison. 3.8 constructs the local logarithmic monodromy family and its holomorphic parameter and base-change comparisons. |
| <a id="dependency-smooth"></a>smooth | [SmoothBundlesConnections](../../TauCetiRoadmap/SmoothBundlesConnections/README.md) — B1.5; B5.0; B5.2 | Smooth Ehresmann splittings, proper-submersion and principal-connection transport within their respective hypotheses. 0.1–0.5 own nonlinear connection objects, continuous-time local lifting, holomorphic parameter dependence and complete nonlinear transport. No properness of the phase projection is assumed. |
| <a id="dependency-differential"></a>differential | [DifferentialGeometry](../../TauCetiRoadmap/DifferentialGeometry/README.md) — Layers 0–1; 3.1–3.5 | Finite-dimensional manifolds, charts and smooth local/maximal/time-dependent flows. 0.2 proves the continuous-time locally uniformly Lipschitz theorem; 0.8 constructs intrinsic jets. |
| <a id="dependency-frobenius"></a>frobenius | `TauCeti.Analysis.ODE.Frobenius` — TauCeti.exists_frobenius_flat_coordinate | For a finite-dimensional real integrable graph field, a local product OpenPartialHomeomorph with a smooth inverse and the prescribed horizontal derivatives, at the stated regularity. 0.5 constructs the submersion-chart graph field, proves curvature implies its integrability, and glues these local products for homotopy-invariant transport. 0.3 supplies the holomorphic counterpart. |
| <a id="dependency-covers"></a>covers | [Completed/UniversalCovers](../../Completed/UniversalCovers/README.md) — Stage 0.2–0.4; Stage 1.5; Stage 2.6–2.8 | Native covering, path and homotopy lifting, universal covers and their fundamental-group interfaces. 0.5 constructs the nonlinear action and horizontal descent; general-cover descent uses the actual fiber relation, not deck invariance without normality. 3.8 constructs local monodromy from marked loops and proves its homotopy and basepoint comparisons. |
| <a id="dependency-curves"></a>curves | [ComplexCurveModuli](../../TauCetiRoadmap/ComplexCurveModuli/README.md); [SchemeAndStackFoundations](../../TauCetiRoadmap/SchemeAndStackFoundations/README.md) — ComplexCurveModuli D0.3, D3–D5; SchemeAndStackFoundations 4.15 | Genus-zero Möbius normalization and supported point-pushing; stable marked-curve deformation charts in the stable range. 1.2 constructs unstable one-/two-pointed quotient charts, finite jets, local markings and determinant transport. Analytic spaces and analytification are supplied by ComplexComparisonPartII, with the fixed-model scheme comparison from FormalConnectionsOpers F2.4. |
| <a id="dependency-stacks"></a>stacks | [SchemeAndStackFoundations](../../TauCetiRoadmap/SchemeAndStackFoundations/README.md) — 1.18–1.23 | Stackification, 2-fiber products, algebraic/DM presentations, inertia, QCoh descent, and finite-inertia Keel–Mori at its hypotheses. 1.3 proves bounded GIT, scalar Gm rigidification, gerbe and coarse comparisons. Finite-inertia criteria do not apply to an unrigidified Gm stable stack. |
| <a id="dependency-quotient-predicates"></a>quotient-predicates | [SchemeAndStackFoundations](../../TauCetiRoadmap/SchemeAndStackFoundations/README.md) — 1.17 | Categorical/geometric quotient definitions, Artin bootstrap and the stated finite-group projective quotients. 1.3 constructs reductive invariant theory. 4.2 constructs the classical representation and character quotients, wild framing groupoids and Stokes quotients. |
| <a id="dependency-quot"></a>quot | [SchemeAndStackFoundations](../../TauCetiRoadmap/SchemeAndStackFoundations/README.md) — 4.14 | Noetherian projective Quot/Hilbert and Hom/Isom parameter spaces with their stated base-change laws. 1.3 proves boundedness, the equations and stability/GIT comparison. Analytic pullbacks use 1.2. |
| <a id="dependency-cohomology"></a>cohomology | [SchemeAndStackFoundations](../../TauCetiRoadmap/SchemeAndStackFoundations/README.md) — 2.2; 2.6; 2.20; 3.3 | Čech and sheaf cohomology, coherent terms, relative/Serre duality, degrees and curve Riemann–Roch at the stated hypotheses. 1.4 constructs the constrained C-linear differential-operator deformation complex and ramified cone, its trace and duality comparisons, using C5.1 for the generic operator/principal-parts and GAGA theory. Coherent underlying terms do not make the differential O-linear. |
| <a id="dependency-deformation"></a>deformation | [SchemeAndStackFoundations](../../TauCetiRoadmap/SchemeAndStackFoundations/README.md) — 4.2–4.6 | Artinian coefficients, deformation functors, hulls and elementary small-extension obstruction calculations. 1.4 constructs actual connection cocycles, the needed arbitrary finite square-zero kernels and framed versality; 2.1 constructs strong horizontal extensions. |
| <a id="dependency-bundles"></a>bundles | [AlgebraicVectorBundles](../../TauCetiRoadmap/AlgebraicVectorBundles/README.md) — L0A–L0C; L1A–L1B; L2A–L2B | Finite locally free sheaves, duals/tensors/determinants, relative Spec and the geometric vector-bundle equivalence. 1.1 constructs decorated meromorphic connections using the shared ordinary/formal carriers; 1.2 applies the shared analytification to these objects. |
| <a id="dependency-ordinary-connections"></a>ordinary-connections | [CrystallineCohomology](https://github.com/TauCetiProject/TauCetiRoadmap/blob/5231bad75352a6086d9952ff511636c8a8ddc6ac/TauCetiRoadmap/CrystallineCohomology/README.md) — CR.1.3: ordinary connection carrier and operations | Ordinary form connections over arbitrary commutative base rings, extension, curvature, horizontal maps, base change and tensor/Hom/dual operations; no integrability condition in the carrier. 1.1 constructs the polar-bound and decoration conditions on the shared connection and proves determinant/End⁰ and localized comparisons, without a second ordinary connection carrier. |
| <a id="dependency-formal-connections"></a>formal-connections | [FormalConnectionsOpers](https://github.com/TauCetiProject/TauCetiRoadmap/blob/19aacea45eee77564f95118de8f55f72547a9fe0/TauCetiRoadmap/FormalConnectionsOpers/README.md) — F1.1–F1.3; F2.1; F3.3–F3.4 | Relative continuous differentials/completed tensors, formal-coordinate automorphisms and their pullback action, Tate coefficient descent, continuous/formal connection carrier and the left gauge groupoid; F3.4 stackification has its coefficient-cover essential-image criterion. 1.1 compares completions of the actual decorated bundles, verifies the extending-torsor criterion, and owns ramified decorated descent, Levelt–Turrittin and relative factorized models. Left gauge h corresponds to frame change g=h⁻¹. |
| <a id="dependency-analytic-spaces"></a>analytic-spaces | [ComplexComparisonPartII](https://github.com/TauCetiProject/TauCetiRoadmap/blob/fa9bfa5892bc24d60762bb1fbfc61f09f8be9043/TauCetiRoadmap/ComplexComparisonPartII/README.md) — C−1.1–C−1.2; C0.3–C0.5; C0.7; C5.2: ordinary connection comparison prefix | One analytic-space category retaining nilpotents, locally finite-type scheme and locally separated finite-type algebraic-space analytification, coherent/tensor/pullback and étale descent comparisons, proper-morphism comparison and the ordinary holomorphic-connection dictionary. 1.2 verifies these constructions on the actual curve/time/moduli presentations, extends the comparison to polar and decorated data, and constructs smooth analytic pullback and manifold comparisons with their actual topological/dimension hypotheses. |
| <a id="dependency-coherent-gaga"></a>coherent-gaga | [ComplexComparisonPartII](https://github.com/TauCetiProject/TauCetiRoadmap/blob/fa9bfa5892bc24d60762bb1fbfc61f09f8be9043/TauCetiRoadmap/ComplexComparisonPartII/README.md) — C1.9 | Projective and proper coherent GAGA, all-degree proper direct-image comparison on finite-type complex schemes and proper-space comparison, with nilpotents and the stated canonical exchange maps. 1.2 checks the proper-family/coherence hypotheses and identifies maps on the actual curve, bundle and determinant constructions; 1.4 uses these comparisons through the supplied operator-complex theorem, preserving base-change hypotheses. |
| <a id="dependency-differential-operators"></a>differential-operators | [ComplexComparisonPartII](https://github.com/TauCetiProject/TauCetiRoadmap/blob/fa9bfa5892bc24d60762bb1fbfc61f09f8be9043/TauCetiRoadmap/ComplexComparisonPartII/README.md) — C5.1: shared algebraic operators/principal parts; C5.1: DifferentialOperatorAnalytification; C5.1: boundedOperatorHyperGaga | Characteristic-free all-order operator predicate/principal parts, universal jets, composition/localization/sheafification, analytification and absolute/relative proper bounded operator-complex GAGA at the stated hypotheses. 1.1 applies the first-order interface to meromorphic Leibniz operators; 1.2 compares decorated meromorphic data; 1.4 constructs the constrained deformation complex and ramified cone and verifies order, coherence, relative linearity, trace, duality and base-change comparisons. |
| <a id="dependency-algebraic-manifolds"></a>algebraic-manifolds | [FormalConnectionsOpers](https://github.com/TauCetiProject/TauCetiRoadmap/blob/19aacea45eee77564f95118de8f55f72547a9fe0/TauCetiRoadmap/FormalConnectionsOpers/README.md) — F2.4: fixed-model analytification and sheaf/tangent comparisons | Fixed-model complex manifold realization for separated smooth finite-type complex schemes of constant differential dimension, second countability, dimension and sheaf/tangent/étale comparisons with the same analytification. 1.2 applies this on scheme charts and descends the actual moduli comparisons via the supplied algebraic-space analytification; arbitrary smooth analytic bases require their analytic-chart comparison and verified Hausdorff/second-countable/dimension hypotheses. |
| <a id="dependency-proper-cohomology"></a>proper-cohomology | [JacobianChallenge](../../TauCetiRoadmap/JacobianChallenge/README.md) — Layer C | Proper coherent pushforwards and separately stated flat-base-change and cohomology/base-change criteria; Grauert under its reduced-base and constant-rank assumptions. 1.5 proves the relative Picard extension; 5.3 verifies boundary-coefficient flatness and the exact locally free/arbitrary-base-change criterion. |
| <a id="dependency-field-picard"></a>field-picard | [JacobianChallenge](../../TauCetiRoadmap/JacobianChallenge/README.md); [SchemeAndStackFoundations](../../TauCetiRoadmap/SchemeAndStackFoundations/README.md) — JacobianChallenge Layer D; SchemeAndStackFoundations 1.1, 2.6, 3.4, 4.6, 4.14 | Picard representability for projective geometrically integral schemes over a field, smooth-curve Jacobians, line-bundle descent and deformation. 1.5 constructs relative Picard under projective flat finite presentation and universal functions, including nonreduced curves; 5.1 verifies its boundary hypotheses. |
| <a id="dependency-supports"></a>supports | [SchemeAndStackFoundations](../../TauCetiRoadmap/SchemeAndStackFoundations/README.md) — 2.7 | Supported cohomology, localization/excision and the Noetherian colimit-of-Ext comparison with native local cohomology. 5.3 constructs the first boundary-layer line, its injection into supported cohomology and its identification with the time line. |
| <a id="dependency-surfaces"></a>surfaces | [SchemeAndStackFoundations](../../TauCetiRoadmap/SchemeAndStackFoundations/README.md) — 3.4; 4.11; 4.17; 5.9–5.10 | Divisor/Picard groups, blowups and strict transforms, normal crossings, surface intersection/adjunction and lattice theory. 5.1–5.3 construct the nonreduced anticanonical boundary, relative logarithmic deformation and family comparisons; targets 5.4–5.6 construct the geometric transformations. |
| <a id="dependency-formal-series"></a>formal-series | [FormalLaurentPuiseux](../../TauCetiRoadmap/FormalLaurentPuiseux/README.md) — L1–L4; L5–L6 for finite-extension steps in 1.1 | Formal substitutions, continuous differentials, finite-dimensional HahnModule comparisons, residue/duality, ramified exponent embeddings and the stated finite-extension algebra. 1.1 proves differential-module Levelt–Turrittin decomposition and descent. |
| <a id="dependency-fredholm"></a>fredholm | `Mathlib.Analysis.Normed.Operator.Fredholm.Basic`; `TauCeti.Analysis.Fredholm.Stabilization`; `TauCeti.Analysis.Normed.Operator.Splitting.Family`; `TauCeti.LinearAlgebra.Determinant.Line` — IsFredholm; nonempty_fredholmPackage; exists_stabilization_kernel_coordinates; kernelHomeomorph; contDiffAt_kerSection; detLine; detLineCongr | Scalar-generic finite-dimensional kernel/cokernel, stabilization coordinates and pointwise determinant-line comparisons; specialize over ℂ and dualize the convention. 6.1 constructs the holomorphic family, canonical section, transition cocycle and base-change laws. |
| <a id="dependency-inversion"></a>inversion | `Mathlib.Analysis.Analytic.Constructions` — analyticAt_inverse; analyticAt_inverse_one_sub | Analytic inversion on units of a complete normed algebra and the small-norm inverse. 6.1 proves the actual holomorphic family-to-operator maps used in stabilization. |
| <a id="dependency-trace-ideal"></a>trace-ideal | [OperatorTheory/OperatorIdeals](../../TauCetiRoadmap/OperatorTheory/OperatorIdeals/README.md) — OI-B01–OI-B19; OI-B23; OI-B29–OI-B30 | Normed complete trace-class ideal, nuclear gauge and two-sided ideal estimates. 6.3–6.4 verify actual trace-class realizations and their trace-norm holomorphic dependence where used. |
| <a id="dependency-trace-determinant"></a>trace-determinant | [RandomMatrices](../../TauCetiRoadmap/RandomMatrices/README.md) — 8.3, generic operator-theory prefix | Trace, exterior powers, generic Fredholm determinant series and trace-norm continuity before the positive-kernel point-process specialization. 6.4 proves the logarithmic derivative, its holomorphic-family hypotheses and the integrable-kernel comparison. |
| <a id="dependency-toeplitz"></a>toeplitz | [OperatorTheory/ToeplitzOperators](../../TauCetiRoadmap/OperatorTheory/ToeplitzOperators/README.md) — T1–T3 | Circle Hardy models and Fredholm index equal to minus determinant winding for continuous invertible matrix symbols. 6.3 constructs contour/Hardy, holomorphic-family, index-zero, resonant and ramified adapters. Index zero alone does not imply invertibility. |
| <a id="dependency-curve-functions"></a>curve-functions | `TauCeti.Analysis.Complex.RiemannSurface.FunctionField`; `TauCeti.Analysis.Complex.RiemannSurface.FunctionField.Comap` — TauCeti.RiemannSurface.MeromorphicFunction; Nonconstant curve pullback and order comparison | Holomorphic maps from a Riemann surface to OnePoint ℂ with a witness excluding the constant-infinity map; native pullback and orders. 0.7 proves phase-observation admissibility and scalar descent; its scalar output uses this same carrier. |
| <a id="dependency-proper"></a>proper | `Mathlib.Topology.Maps.Proper.Basic` — IsProperMap | Topological proper maps and the compact-preimage and base-change properties under their actual topological hypotheses. 0.4 proves complete-lift transfer. 1.2 applies the supplied analytic/algebraic comparison to the actual families; 4.4 proves properness of the actual RH family. |

### Supporting primary sources

- **SGA1XII.** A. Grothendieck et al.; Exposé XII by M. Raynaud. [Revêtements étales et groupe fondamental (SGA 1), Exposé XII: Géométrie algébrique et géométrie analytique](https://arxiv.org/pdf/math/0206203v2). XII Theorem and Definition 1.1 (analytification); §2 (coherent sheaf comparison); §3.1 (morphism properties, including properness); Theorem 4.2 (proper relative direct-image comparison); Corollary 4.3 (cohomology); Theorem 4.4 (proper coherent GAGA).
- **SERREGAGA.** J.-P. Serre. [Géométrie algébrique et géométrie analytique](https://www.numdam.org/article/AIF_1956__6__1_0.pdf). §§1–2; §3 no.12 Theorems1–3 and proofs nos.13–17.
- **GR84.** H. Grauert and R. Remmert. [Coherent Analytic Sheaves](https://link.springer.com/book/10.1007/978-3-642-69582-7). Chapter I, Complex Spaces (pp.1–37); Chapter X, Direct Image Theorem (pp.188–222).
- **KED09.** K. S. Kedlaya. [Good formal structures for flat meromorphic connections, I: Surfaces](https://arxiv.org/pdf/0811.0190v4). §2.1 (field and constants); §2.2 (regular modules and regulating lattices); Theorem2.3.3 and its proof; §2.4 (Deligne–Malgrange lattices).
- **DEL70.** P. Deligne. [Équations différentielles à points singuliers réguliers](https://publications.ias.edu/sites/default/files/Number9.pdf). II §5, Proposition5.4 (extension for a section of ℂ→ℂ/ℤ); Corollary5.6 (nonresonant monodromy/residue comparison); Theorem5.9 (regular-singular algebraic/analytic correspondence); II §6.6 (principal-parts analytification of differential operators and proper hypercohomology comparison), PDF p.103 / printed p.101. Read the [April 1971 erratum](https://publications.ias.edu/sites/default/files/Erratum%20to%20SLN%20163.pdf): omit II1.23–1.24 and use the corrected II4.1 proof in the higher-dimensional argument leading to II5.7/5.9. The cited one-dimensional statements retain their scopes.
- **ACV03.** D. Abramovich, A. Corti and A. Vistoli. [Twisted bundles and admissible covers](https://arxiv.org/pdf/math/0106211). §5.1, Theorem5.1.5 and construction; Stacks Project tag04V2 for hypotheses.
- **PICREL.** The Stacks Project Authors. [The Picard functor and its properties](https://stacks.math.columbia.edu/tag/0D2C). Proposition99.11.8, tag0D2C; Lemma108.9.3, tag0DNI; Lemma108.9.5, tag0DPK; the Picard gerbe Lemma108.9.1 in tag0DMD.
- **MFK94.** D. Mumford, J. Fogarty and F. Kirwan. [Geometric Invariant Theory, third edition](https://link.springer.com/book/9783540569633). Chapter1, reductive invariant theory and construction of quotients; coupled to I23 Theorem5.1 and its actual framed filtered-connection construction.

<a id="layer-0"></a>

## Layer 0: Nonlinear connections and their solutions

<a id="nonlinear-connections"></a>

Develop nonlinear connections on finite-dimensional manifolds, with morphisms, pullbacks, local solutions, transport and observations. Applications supply a phase family and tangent splitting, together with the forms or comparison maps required by the theorem they use. The hypotheses of this general theory impose no rank-two condition, polar-degree condition, scalar Painlevé equation or Riemann–Hilbert comparison.

### Theorems and constructions

| Target | Independently exported result | Additional input a consumer must prove |
|---|---|---|
| 0.1 | Nonlinear connection objects, arrows, curvature and base change | An actual submersion and tangent splitting |
| 0.2 | Local path lifts and compact extension | Continuous time dependence and local uniform phase Lipschitz bounds |
| 0.3 | Holomorphic horizontal germs and parameter dependence | A holomorphic splitting and flatness in the time directions |
| 0.4 | Completeness transferred by proper semiconjugacy | A proper map and compatibility with every partial lift at every point |
| 0.5 | Fundamental-groupoid action, universal-cover sections and descent | Flatness and path completeness |
| 0.6 | Closed-total-form criterion and symplectic transport | Fiberwise closedness and nondegeneracy, then the stated preservation or closedness hypothesis |
| 0.7 | Admissible evaluation and scalar descent | An actual admissible observation on a complex curve |
| 0.8 | Intrinsic first-jet scalarization | An observation and a proved local jet isomorphism |

Scalarization in §0.8 uses the connection and observer jet map. Proper-semiconjugacy completeness in §0.4 applies to connections with the local lifting theory of §0.2; fundamental-groupoid transport in §0.5 also requires flatness. Meromorphic evaluation in §0.7 applies to holomorphic maps from a curve under the stated observer-admissibility hypotheses.

### Regularity assumptions

The real $`C^1`$ branch is used for individual horizontal path lifting. Curvature, differential-form identities and the smooth flat-product theorem use smooth real data. The complex branch uses holomorphic data on finite-dimensional complex manifolds. The base spaces in this layer are smooth finite-dimensional manifolds.

Targets 0.1–0.3 construct nonlinear connections and their local solution theory. Path completeness is a hypothesis of §0.5, with §0.4 providing one sufficient criterion. Target 0.6 takes a relative two-form as input and characterizes its preservation and the closedness of the associated total form. Applications construct that form before applying the criterion.

<a id="target-0-1"></a>
### 0.1 Ehresmann connections, morphisms and base change

**General theory.**

Let $`\pi:M\to B`$ be a smooth submersion between finite-dimensional Hausdorff second-countable smooth manifolds without boundary. A real nonlinear connection is a $`C^1`$ vector-bundle splitting $`h:\pi^*TB\to TM`$ with $`d\pi\circ h=\mathrm{id}`$. The holomorphic version uses complex manifolds, a holomorphic submersion and a holomorphic splitting. Surjectivity and properness of $`\pi`$ are not part of the definition. Whenever curvature, differential forms or smooth Frobenius theory are used below, strengthen the real splitting to smooth; the $`C^1`$ branch is retained for individual path lifting.

Define an arrow $`(F,f):(M\to B,h)\to(N\to C,k)`$ by actual smooth maps, or holomorphic maps in the holomorphic category, satisfying $`\rho F=f\pi`$ and $`dF\circ h=k\circ df`$. Composition and identities are the actual compositions and identities of these maps. An isomorphism consists of an arrow, its inverse and the two inverse identities.

For a smooth or holomorphic map $`u:B'\to B`$, construct the fiber product $`M'=B'\times_BM`$, its projection $`\pi':M'\to B'`$ and the pullback splitting $`h'_{(b',m)}(v)=(v,h_m(du(v)))`$. Prove its tangent-space membership, splitting identity, functoriality on arrows and the canonical coherence isomorphisms for repeated base change. Construct the horizontal and vertical subbundles and, on the smooth or holomorphic branch, the vertical curvature $`K_h(X,Y)=[hX,hY]-h[X,Y]`$. Flatness means $`K_h=0`$. Horizontal solutions and completeness are developed in targets:0.2–0.5; a relative symplectic form is separate data in target:0.6.

**Hypotheses.**

- Finite-dimensional Hausdorff second-countable manifolds without boundary, a smooth submersion and a C¹ splitting; or finite-dimensional complex manifolds, a holomorphic submersion and a holomorphic splitting.
- For curvature and differential-form assertions, the real splitting is smooth. Base changes and arrows have the regularity of their chosen category.

**API.**

- Construct the category of actual connection-preserving arrows, its isomorphisms, and the horizontal–vertical splitting of the tangent bundle.
- Construct pullback connections along arbitrary smooth or holomorphic base maps and prove identity, composition and Cartesian comparison laws with their actual comparison maps.
- Prove tensoriality of $`K_h`$ and its naturality under connection isomorphisms and pullback; define flatness independently of completeness and symplecticity.

**Checks.**

- The zero map $`\pi^*TB\to TM`$ fails the splitting identity when $`TB\ne0`$; the product splitting on $`B\times X\to B`$ passes it.
- Under the noncritical time change $`\tau=2t`$, the vector field normalized to project to $`\partial_\tau`$ is one half of the vector field normalized to project to $`\partial_t`$.
- A fiber product connection can be defined along a ramified time map; this alone asserts neither completeness nor invertibility of its first-jet observation map.

*Needs:* [Smooth bundle and connection foundations](#dependency-smooth) (B1.5; B5.0; B5.2); [Complex manifolds, holomorphic bundles and observations](#dependency-complex) (K1; K3.0; K3.HolomorphicStalk; K3.MeromorphicGermField; K4; K7.1).

**Source scope.** The construction applies to every submersion and splitting satisfying the stated manifold and regularity hypotheses.

<a id="target-0-2"></a>
### 0.2 Local horizontal lifting and continuous-time compact extension

**General theory.**

Prove the local existence–uniqueness theorem for $`y'=F(t,y)`$ on finite-dimensional coordinate domains when $`F`$ is continuous in time and locally uniformly Lipschitz in the phase variable. The local constants are uniform on a sufficiently small closed time–phase box. In submersion coordinates $`\pi(z,y)=z`$, a $`C^1`$ base path $`\gamma`$ turns a $`C^1`$ splitting into the equation $`y'=A(\gamma(t),y)\gamma'(t)`$. Construct its local solution by the integral-equation contraction argument, prove uniqueness and restriction, and glue coordinate solutions to the unique maximal horizontal lift through each initial point. For a path with finitely many $`C^1`$ pieces, concatenate lifts at its breakpoints.

Prove the compact-extension lemma: a horizontal lift defined up to a finite endpoint of a base path extends through that endpoint if its image is contained in a compact subset of $`M`$. Use finitely many submersion charts near the compact set, uniform local existence intervals, accumulation and uniqueness to obtain the endpoint value and extension. Use local uniqueness to prove convergence to the cluster point and uniqueness of the extension. The resulting lemma is available for ordinary nonautonomous ODEs in the same coordinate form.

The velocity of a $`C^1`$ path is merely continuous. The autonomized field $`(1,F(t,y))`$ therefore need not be $`C^1`$. Use the stated continuous-time theorem, or a proved reduction to it. Continuous dependence on initial data is established under these hypotheses; stronger smooth or holomorphic dependence is claimed only with its additional regularity, and holomorphic horizontal sections are constructed in target:0.3. The maximal lift is constructed from the local solutions.

**Hypotheses.**

- A connection from target:0.1 and a compact-interval base path with finitely many C¹ pieces.
- For the analytic chart lemma: a continuous-time finite-dimensional ODE locally uniformly Lipschitz in its phase variable on its open domain.
- For compact extension: a finite endpoint at which the base path is defined, and a single compact subset containing the partial lift.

**API.**

- Prove the continuous-time Picard–Lindelöf chart theorem and the continuous initial-data dependence needed for local lifting.
- Construct unique maximal horizontal lifts, with restriction, reversal where defined, and concatenation across finitely many C¹ pieces.
- Prove that containment of a partial lift in one compact subset forces extension through a finite endpoint, using the actual nonautonomous regularity.

**Checks.**

- For the product splitting, the fiber coordinate is constant along every horizontal lift.
- The equation $`y'=y^2`$, $`y(0)=1`$ has $`y(t)=1/(1-t)`$: its local solution does not extend in the affine phase line through $`t=1`$; compact containment fails.
- The path $`\gamma(s)=|s-1/2|^{3/2}`$ is $`C^1`$, but $`\gamma'`$ is not $`C^1`$ at $`1/2`$. Its horizontal-lift equation remains an admissible continuous-time ODE; a $`C^1`$ autonomization cannot be assumed.

*Needs:* Internal: 0.1; [Smooth differential calculus and flows](#dependency-differential) (Layers 0–1; 3.1–3.5).

**Source scope.** The local ODE construction and compact-extension lemma supply the analytic continuation argument used by the proper semiconjugacy theorem in target:0.4 and by compact-containment criteria.

<a id="target-0-3"></a>
### 0.3 Holomorphic horizontal germs and parameter dependence

**General theory.**

For a holomorphic submersion with a flat holomorphic splitting, construct the unique germ of holomorphic section $`s`$ through each $`x_0\in M_{b_0}`$ satisfying $`\pi s=\mathrm{id}`$, $`s(b_0)=x_0`$ and $`ds=h`$. Prove the local existence theorem with joint holomorphic dependence on the initial point and on auxiliary parameters when the submersion and splitting vary holomorphically in compatible finite-dimensional complex-manifold parameter charts. The parameter bases in this theorem are finite-dimensional complex manifolds.

Prove the complex ODE theorem with holomorphic parameter dependence: construct a convergent Picard iteration on a common polydisc, use uniform convergence to prove holomorphy, and prove uniqueness. In local base coordinates, flatness makes the horizontal coordinate vector fields commute. Prove the commuting-flow identity and compose the local flows to obtain local product charts and horizontal sections; prove their uniqueness and compatibility on connected overlaps. The resulting germ–initial-value correspondence is natural under actual connection isomorphisms and compatible base changes. It is local, and contains no global continuation assertion.

Construct horizontal germs from this local ODE theorem. Over a one-dimensional complex base, flatness of the holomorphic horizontal line distribution is automatic; in higher base dimension it is a genuine hypothesis.

**Hypotheses.**

- Finite-dimensional complex manifolds, a holomorphic submersion and a flat holomorphic splitting.
- For joint parameter dependence: a compatible local holomorphic family in finite-dimensional complex-manifold parameter charts, with flatness in the time directions.
- An initial point in the fiber of the chosen base point; conclusions hold after shrinking around it.

**API.**

- Prove local complex ODE existence, uniqueness and joint holomorphic initial-value and parameter dependence on common polydiscs.
- Construct commuting horizontal flows and local holomorphic product charts from the proved flatness of the splitting.
- Construct the natural bijection between initial points and local horizontal section germs, and prove uniqueness and overlap compatibility.

**Checks.**

- For the product splitting, the horizontal section through $`(b_0,x_0)`$ is $`b\mapsto(b,x_0)`$. The constant map $`b\mapsto(b_0,x_0)`$ is not a section on a nontrivial base.
- On $`\mathbb C^2_{s,t}\times\mathbb C_y`$, take $`h\partial_s=\partial_s`$ and $`h\partial_t=\partial_t+s\partial_y`$. A horizontal section would satisfy $`y_s=0,\ y_t=s`$, contradicting equality of mixed derivatives; flatness cannot be dropped.
- A theorem over a smooth parameter polydisc does not by itself provide a horizontal section over a singular or nonreduced base.

*Needs:* Internal: 0.1, 0.2; [Complex manifolds, holomorphic bundles and observations](#dependency-complex) (K1; K3.0; K3.HolomorphicStalk; K3.MeromorphicGermField; K4; K7.1).

**Source scope.** The proof uses the local complex ODE construction and commuting horizontal flows. Isomonodromic horizontal sections are applications of this general theorem.

<a id="target-0-4"></a>
### 0.4 Completeness transferred by a proper semiconjugacy

**General theory.**

Let $`(M\to B,h)`$ be a real connection from target:0.1. Let $`p:R\to B`$ be any continuous map of topological spaces carrying specified complete continuous transport: for every piecewise $`C^1`$ path $`\gamma:[a,b]\to B`$ with finitely many pieces and every $`r_0\in R_{\gamma(a)}`$, a continuous trajectory $`\beta_{\gamma,r_0}:[a,b]\to R`$ lies over $`\gamma`$, starts at $`r_0`$, and satisfies restriction and concatenation laws. The target need not be a manifold. Let $`F:M\to R`$ be continuous over $`B`$ and proper in the explicit sense that inverse images of compact subsets are compact.

Assume compatibility at every source point: every partial horizontal lift $`x`$ of $`\gamma`$ with initial point $`x_0`$ satisfies $`F(x(t))=\beta_{\gamma,F(x_0)}(t)`$ throughout its domain. Prove that every such base path has a unique horizontal lift on its entire compact interval through every initial point of $`M_{\gamma(a)}`$. Flatness is not needed for this completeness theorem.

Indeed, the complete target trajectory has compact image $`K=\beta_{\gamma,F(x_0)}([a,b])`$. Every partial lift is trapped in $`F^{-1}(K)`$; target:0.2 extends it through each finite endpoint, and local uniqueness glues the extensions. This proof uses properness of $`F`$, not properness of the phase projection $`M\to B`$. It does not use an inverse, injectivity or surjectivity of $`F`$. In particular, a nontrivial compact exceptional fiber is retained in full: construct the lift through its specified initial point using target:0.2.

For a holomorphic source splitting, apply the real theorem to its underlying real manifolds. Holomorphic local sections and homotopy invariance require the additional flatness and analytic results stated in their own targets. Compatibility only on a dense open subset, or properness only away from exceptional points, does not meet the hypotheses.

**Hypotheses.**

- A finite-dimensional C¹ Ehresmann splitting as in target:0.1; local existence and compact extension are supplied by target:0.2.
- A continuous target over B with specified complete continuous trajectories for all compact piecewise C¹ base paths, including restriction and concatenation laws.
- A continuous map F over B whose inverse image of every compact set is compact.
- Semiconjugacy for every partial horizontal lift through every source point, including exceptional points.

**API.**

- Construct the unique full horizontal lift of each compact piecewise $`C^1`$ base path through every source initial point from the proper semiconjugacy hypotheses.
- Prove completeness without choosing an inverse to F, and retain distinct initial points in every compact exceptional fiber.
- Apply the theorem to the underlying real geometry of a holomorphic splitting, without asserting flatness or holomorphic global sections from properness alone.

**Checks.**

- Take $`M=\mathbb C_t\times\mathbb C_y`$, $`h\partial_t=\partial_t+y^2\partial_y`$, $`R=B=\mathbb C_t`$ and $`F=\pi`$. The target transport is complete and the semiconjugacy holds, but $`F`$ is not proper. The lift through $`y(0)=1`$ has $`y(1/2)=2`$, $`y(3/4)=4`$ and no finite value at $`t=1`$.
- For a product connection and the identity comparison with its own constant-fiber transport, the theorem returns the constant fiber coordinate.
- If a proper comparison contracts an exceptional curve, the proof uses the compact inverse image of the target trajectory and local uniqueness at each point of that curve; replacing the fiber by one arbitrarily selected preimage fails the required initial-value statement.
- The $`C^1`$ path $`\gamma(s)=|s-1/2|^{3/2}`$ is permitted. Its merely continuous velocity is handled by target:0.2; the autonomized field need not have $`C^1`$ regularity.

*Needs:* Internal: 0.1, 0.2.

**Source scope.** IIS06, Definitions 2.1–2.2 and Lemma 2.12 provide isomonodromic instances of this geometric continuation argument. Prove here the theorem for a continuous target with the stated properness and semiconjugacy hypotheses; each application supplies its comparison map and verifies those hypotheses.

<a id="target-0-5"></a>
### 0.5 Fundamental-groupoid transport, universal covers and descent

**General theory.**

Let a smooth real or holomorphic connection be flat and complete for all compact piecewise $`C^1`$ paths. Applications establish this completeness hypothesis by target:0.4 or another completeness theorem. From unique horizontal lifting construct endpoint maps $`T_\gamma:M_{\gamma(a)}\to M_{\gamma(b)}`$, with identity, reversal and concatenation laws. If $`\gamma_1`$ is traversed before $`\gamma_2`$, use the convention $`T_{\gamma_2*\gamma_1}=T_{\gamma_2}\circ T_{\gamma_1}`$.

Prove invariance under endpoint-fixed homotopy. Use local flat product charts, a finite subdivision of a compact homotopy, and uniqueness on overlaps; include the smooth approximation or subdivision step relating continuous homotopies to the piecewise smooth representatives. This constructs an action of the fundamental groupoid of $`B`$. Endpoint maps are diffeomorphisms in the smooth case and biholomorphisms in the holomorphic case. Symplectic transport also requires the horizontal-preservation condition of target:0.6.

For connected $`B`$, a chosen $`b_0`$ and a pointed universal cover $`p:\widetilde B\to B`$, construct for each $`x_0\in M_{b_0}`$ a global horizontal section of the pulled-back family $`\widetilde B\times_BM\to\widetilde B`$. Prove it is smooth, or holomorphic in the holomorphic case, by the local product theorem. It descends to a section on $`B`$ if and only if $`x_0`$ is fixed by every actual monodromy map $`T_\ell`$ for based loops $`\ell`$. Thus the universal-cover solution and its descent obstruction are separate outputs. Pullback and connection-isomorphism naturality are proved using actual maps, including all exceptional points of a supplied phase space.

**Hypotheses.**

- A smooth real or holomorphic flat connection from target:0.1, with completeness for every compact piecewise C¹ base path established by its producer.
- For the universal-cover statement: a connected base with a chosen base point and pointed universal cover. Finite-dimensional manifolds meet the usual local covering hypotheses.
- No symplectic form or Riemann–Hilbert comparison is required.

**API.**

- Construct endpoint transport, prove concatenation, reversal and homotopy invariance, and obtain a fundamental-groupoid action by actual fiber isomorphisms.
- Construct the unique global horizontal section on the pulled-back family over the pointed universal cover through each initial point.
- Prove that the horizontal section descends to the original base exactly when its initial point is fixed by the full monodromy action.

**Checks.**

- A loop followed by its reverse acts as the identity on every initial point, including a point on an exceptional fiber of any separately supplied comparison.
- On $`\mathbb C_t^\times\times\mathbb C^2_{q,p}`$, the connection $`q'=q/(2t),\ p'=-p/(2t)`$ is complete and flat. One positive loop sends $`(q,p)`$ to $`(-q,-p)`$; two loops act identically. Exactly $`(0,0)`$ is fixed by every loop, although every initial point has a horizontal section on the universal cover.
- On $`\mathbb C^2_{s,t}\times\mathbb C^2_{q,p}`$, set $`h\partial_s=\partial_s+\partial_q`$ and $`h\partial_t=\partial_t+q\partial_p`$. This connection is complete but has curvature $`\partial_p`$. A rectangular loop with side increments $`a,b`$ translates $`p`$ by $`ab`$, so completeness without flatness does not give homotopy invariance.

**Supporting constructions owned by this target.**

- In a submersion chart express the horizontal splitting as the graph field f:E×F→(E→L[ℝ]F). Prove that zero curvature gives the native IsFrobeniusIntegrableAt condition. Apply TauCeti.exists_frobenius_flat_coordinate at smooth regularity and transport its actual OpenPartialHomeomorph and inverse back to the manifold. Prove compatibility of these product charts by horizontal uniqueness, then carry out the finite homotopy subdivision and gluing. For the holomorphic category use the local holomorphic solution-family construction of 0.3. The smooth real theorem is a named input; its nonlinear global adapter and all coherence maps are proved here.

*Needs:* Internal: 0.1, 0.2, 0.3; [Covering spaces and universal covers](#dependency-covers) (Stage 0.2–0.4; Stage 1.5; Stage 2.6–2.8); [Smooth bundle and connection foundations](#dependency-smooth) (B1.5; B5.0; B5.2); [Native real Frobenius product coordinates](#dependency-frobenius) (TauCeti.exists_frobenius_flat_coordinate).

**Source scope.** Flat-connection and covering theory give the transport and descent theorem. IIS06 gives geometric monodromy applications; the symplectic isomonodromy setting of BOA01 also uses the preservation hypotheses of target:0.6.

<a id="target-0-6"></a>
### 0.6 Symplectic preservation and the closed total two-form

**General theory.**

Let $`V=\ker d\pi`$ for a smooth real or holomorphic submersion, let $`h`$ be a smooth or holomorphic splitting, and let $`\omega`$ be a smooth or holomorphic relative two-form on $`V`$ that is nondegenerate and closed on every fiber. Applications verify these fiberwise properties of $`\omega`$. Define $`v^V=v-h(d\pi v)`$ and the actual total two-form $`\Omega(v,w)=\omega(v^V,w^V)`$. Prove that $`\ker\Omega=\mathop{\mathrm{im}}\nolimits h`$.

For a base vector field $`X`$ and vertical fields $`U,V`$, define

```math
(D^h_X\omega)(U,V)=hX\bigl(\omega(U,V)\bigr)-\omega([hX,U],V)-\omega(U,[hX,V]).
```

Compute all components of $`d\Omega`$: on three vertical vectors it is $`d_V\omega`$; on $`(hX,U,V)`$ it is $`D^h_X\omega(U,V)`$; on $`(hX,hY,U)`$ it is $`-\omega(K_h(X,Y),U)`$; on three horizontal vectors it is zero. Deduce, using vertical nondegeneracy, the equivalence

```math
d\Omega=0 \quad\Longleftrightarrow\quad K_h=0\ \text{and}\ D^h\omega=0.
```

Prove separately that the locally defined parallel transport preserves the relative forms if and only if $`D^h\omega=0`$. Thus flatness and preservation are distinct conditions. Under horizontal preservation D^hω=0, flatness and completeness, target:0.5 then yields symplectic global transport; completeness is not needed for the local criterion.

Under the proved horizontal-preservation condition $`D^h\omega=0`$, only for a one-dimensional time base, and after a local symplectic trivialization with the required local phase exactness, derive a Hamiltonian potential for $`h\partial_t=\partial_t+X_H`$ from $`\iota_{X_H}\omega=d_{\rm phase}H`$. In Darboux coordinates the intrinsic total form has the coordinate display $`\Omega=\sum_i dq_i\wedge dp_i+dH\wedge dt`$. Prove the time-only ambiguity in $`H`$ on connected phase charts and the transformation law under time-dependent symplectic coordinates by comparing the actual total forms. This coordinate formula has a one-dimensional time base; several time variables require the horizontal–horizontal components as well.

**Hypotheses.**

- A smooth real or holomorphic submersion and a splitting of the same regularity.
- A relative two-form proved fiberwise closed and vertically nondegenerate; flatness and horizontal preservation are conclusions of the criterion only when total closedness is separately established.
- For the Hamiltonian coordinate lemma: horizontal preservation, a one-dimensional time chart, a local symplectic trivialization and local exactness of the resulting closed phase one-form.

**API.**

- Construct the total form from the vertical projection and prove its kernel identity and naturality.
- Prove the component formulas and the equivalence $`d\Omega=0\iff(K_h=0\ \text{and}\ D^h\omega=0)`$ under the stated fiberwise hypotheses.
- Prove the equivalence between infinitesimal horizontal preservation and symplecticity of all local parallel-transport maps.
- Derive the one-time Hamiltonian display, time-only ambiguity and time-dependent coordinate transformation law from the intrinsic total form.

**Checks.**

- On $`\mathbb C_t\times\mathbb C^2_{q,p}`$ take the product flat splitting and $`\omega=e^t\,dq\wedge dp`$. The associated $`\Omega`$ satisfies $`d\Omega=e^t\,dt\wedge dq\wedge dp\ne0`$; flatness alone does not imply symplectic preservation or total closedness.
- For $`H=p^2/2`$, contraction of $`\partial_t+p\partial_q`$ with $`dq\wedge dp+p\,dp\wedge dt`$ is zero, checking the sign in the Hamiltonian display.
- The potentials $`H`$ and $`H+t^2`$ give the same total two-form because $`d(t^2)\wedge dt=0`$.
- On a positive-dimensional fiber the relative zero form is closed but vertically degenerate; its total extension has full tangent kernel, so the kernel and curvature conclusions require nondegeneracy. On a zero-dimensional vertical tangent space the zero form is nondegenerate.

*Needs:* Internal: 0.1, 0.2; [Complex manifolds, holomorphic bundles and observations](#dependency-complex) (K1; K3.0; K3.HolomorphicStalk; K3.MeromorphicGermField; K4; K7.1).

**Source scope.** Prove the component identities and preservation criterion by tensor and differential-form calculus. I23 Definition 11.4 and Corollary 11.8 and BOA01 §7 supply specialized geometric constructions and comparisons satisfying their own hypotheses.

<a id="target-0-7"></a>
### 0.7 Admissible observations and meromorphic evaluation on curves

**General theory.**

Let $`S`$ be a connected one-dimensional complex manifold and let $`s:S\to M`$ be a holomorphic map. Define admissible observation data by an actual holomorphic $`\mathbb P^1`$-valued map on a neighborhood of $`s(S)`$, or by meromorphic or rational presentation data for which evaluation along $`s`$ is proved to have a well-defined holomorphic $`\mathbb P^1`$-valued continuation. This is a marked observation; its domain and any comparison maps are retained.

Construct that continuation in the following elementary admissible case: local numerator–denominator presentations restrict along $`s`$ to holomorphic pairs that are not both identically zero. Remove their common vanishing order at each point of the curve, and prove the resulting local $`\mathbb P^1`$-maps agree on overlaps. Alternatively, if a resolution $`\widehat M\to M`$, a holomorphic observation $`\widehat Q:\widehat M\to\mathbb P^1`$ and a holomorphic lift $`\widehat s`$ are supplied, evaluation is $`\widehat Q\widehat s`$. Its independence of choices must be proved by comparison on a dense domain, or the lift must remain part of the observation marking. In particular, a curve wholly contained in an indeterminacy locus has no canonical rational evaluation merely because some lift exists.

If the evaluated map is not identically $`\infty`$, prove that it defines a meromorphic function on $`S`$. At a point with value $`\infty`$, its reciprocal is a holomorphic germ with a zero of finite order; the identity theorem excludes infinite order. Thus poles are isolated and of finite order. The curve hypothesis is essential to this formulation: higher-dimensional bases have polar divisors and possible indeterminacy, not a theorem of isolated poles.

Apply this local statement to horizontal germs from target:0.3 and, when separately supplied, to the universal-cover sections from target:0.5. For a universal cover or connected regular cover, prove that the scalar observation descends exactly when the evaluated function is invariant under every deck transformation. A monodromy-fixed geometric initial point is sufficient, but not necessary, for scalar descent. Prove naturality under actual compatible observation maps, base changes and resolved comparisons on their stated domains.

**Hypotheses.**

- A connected complex curve S, a holomorphic map s into a complex phase manifold, and admissible marked observation data on its image.
- For local ratio construction: the restricted numerator and denominator are not both identically zero; comparisons on overlaps are part of the presentation to be proved compatible.
- For evaluation through a resolution: an actual holomorphic lift and observation, with independence proved or the lift retained as marking.
- For an ordinary meromorphic function: evaluation is not identically infinity. For scalar descent by deck invariance: a specified universal cover (or a connected regular cover) and its actual deck action.

**API.**

- Construct admissible evaluation by actual maps, one-variable cancellation of local ratios, or specified resolved lifts, and prove the claimed comparison independence.
- Prove finite-order isolated poles for a non-identically-infinite admissible evaluation on a complex curve.
- For a universal cover or connected regular cover, prove that an observed function descends if and only if it is deck invariant; distinguish this from descent of the full geometric section.

**Checks.**

- The constant $`\mathbb P^1`$-valued map $`Q\equiv\infty`$ is allowed as a map but is excluded from the ordinary-meromorphic-function conclusion.
- For the rational observation $`Q=[x:y]`$ on $`\mathbb C^2`$ and the constant curve $`s\equiv(0,0)`$, both restricted coordinates vanish identically. Different directional lifts to the blowup have different values; no unmarked scalar value is defined.
- The observation $`1/t`$ on a punctured disc extends as a $`\mathbb P^1`$-map with reciprocal $`t`$ at the origin, giving one pole of order one.
- For the sign-monodromy example $`q'=q/(2t),\ p'=-p/(2t)`$ over $`\mathbb C^\times`$, the observation $`q^2`$ descends to the base even when the geometric section with nonzero initial data does not. Scalar descent cannot be characterized only by a fixed initial point.

- The connected degree-three cover p(z)=z³−3z from ℂ minus {−2,−1,1,2} to ℂ minus {−2,2} is not regular and has trivial deck group (its monodromy is S₃). The function f(z)=z is deck invariant but is not constant on the fiber over 0, so it does not descend. Deck invariance on an arbitrary nonregular cover is insufficient.

**Supporting constructions owned by this target.**

- Use the native Riemann-surface meromorphic-function carrier for the P¹-valued evaluation together with its explicit witness excluding the constant-infinity map. Construct the comparison of the admissible phase observation with that carrier, its pullbacks and order function. For the descent assertions use the covering-space equivalence relation and, on a universal or connected regular cover, its deck action from the covers contract; the evaluation theorem applies to every holomorphic curve map with the stated observation data.

*Needs:* Internal: 0.1; [Complex manifolds, holomorphic bundles and observations](#dependency-complex) (K1; K3.0; K3.HolomorphicStalk; K3.MeromorphicGermField; K4; K7.1); [Covering spaces and universal covers](#dependency-covers) (Stage 0.2–0.4; Stage 1.5; Stage 2.6–2.8); [Native meromorphic functions on Riemann surfaces](#dependency-curve-functions) (TauCeti.RiemannSurface.MeromorphicFunction; Nonconstant curve pullback and order comparison).

**Source scope.** Complex-curve evaluation and covering descent give the general theorem. IIS06's geometric solutions and VDPS09's scalar coordinates provide applications, each with the admissibility conditions for its chosen observation.

<a id="target-0-8"></a>
### 0.8 First jets and second-order equations

**General theory.**

Let $`B`$ be a complex time curve, let $`\rho:E\to B`$ be a holomorphic submersion of relative dimension one, and let $`(M\to B,h)`$ be a holomorphic nonlinear connection. Construct the first-jet bundle $`J^1(E/B)`$ intrinsically: its fiber over $`e\in E_b`$ is the affine space of complex-linear splittings $`j:T_bB\to T_eE`$ of $`d\rho_e`$. Construct its holomorphic transition maps and prove that these splittings correspond to first jets of local holomorphic sections of $`E\to B`$.

An observation $`Q:M\to E`$ over $`B`$ defines

```math
J_Q(x)=\bigl(Q(x),dQ_x\circ h_x\bigr)\in J^1(E/B).
```

On an explicitly specified open $`U\subset M`$, assume and verify that $`J_Q:U\to V`$ is a biholomorphism onto an open $`V\subset J^1(E/B)`$. Transport the splitting to $`V`$ and prove its contact compatibility: along its horizontal curves, the jet coordinate is the derivative of the observed section. This constructs the corresponding second-order dynamics. Prove a bijection between horizontal section germs in $`U`$ and observation-section germs whose first jets lie in $`V`$ and solve that dynamics. Construct the inverse correspondence by applying the actual inverse of $`J_Q`$ to the first jet of the observed section.

For the coordinate lemma choose $`(t,q,p)`$ on $`U`$ adapted to the observation, so that q is its local fiber coordinate, and write $`h\partial_t=\partial_t+A(t,q,p)\partial_q+B(t,q,p)\partial_p`$, and suppose the jet map $`(t,q,p)\mapsto(t,q,A(t,q,p))`$ has the specified inverse $`p=P(t,q,v)`$. Then the intrinsic second-order dynamics has the display

```math
q''=\bigl(A_t+A A_q+B A_p\bigr)\bigl(t,q,P(t,q,q')\bigr).
```

Prove naturality under actual connection and observation-bundle isomorphisms, and under noncritical time changes. Arbitrary ramified base change still defines the pullback connection of target:0.1, but need not preserve this jet-isomorphism hypothesis. The theorem assumes no symplectic structure, no completeness, no meromorphic continuation property and no named scalar equation.

**Hypotheses.**

- A holomorphic nonlinear connection over a complex curve, a holomorphic observation bundle E→B of relative dimension one, and an actual observation Q over B.
- An explicitly specified open domain on which the constructed first-jet map is proved biholomorphic onto an open subset of the first-jet bundle.
- For coordinate formulae: the displayed chart and actual inverse P. For naturality of the scalarized chart under a time change: its derivative is nonzero.

**API.**

- Construct the affine first-jet bundle, its holomorphic transition maps, its identification with section jets and the intrinsic observation jet map.
- Transport the connection across a proved jet isomorphism, establish the contact condition and prove the local solution-germ correspondence with its actual inverse.
- Derive the scalar second-order display by the chain rule and prove its naturality on the stated noncritical coordinate domains.

**Checks.**

- When $`A=p`$, the jet inverse is $`p=q'`$ and the second-order equation is $`q''=B(t,q,q')`$.
- If $`A`$ is independent of $`p`$, the jet map loses the momentum variable and has no open-set inverse in a two-dimensional phase chart.
- For $`A=p^2`$, the jet map has separate local inverse branches away from $`p=0`$ but no automatic global inverse; at $`p=0`$ its differential loses rank.
- Clearing denominators in a scalar display does not create a solution in a phase chart where the observation or jet inverse is undefined; the original domain is retained.
- Under $`\tau=t^2`$ at $`t=0`$, the time derivative vanishes. Pullback connections still exist, but the noncritical time-change comparison of scalar jets does not apply.

*Needs:* Internal: 0.1; [Complex manifolds, holomorphic bundles and observations](#dependency-complex) (K1; K3.0; K3.HolomorphicStalk; K3.MeromorphicGermField; K4; K7.1); [Smooth differential calculus and flows](#dependency-differential) (Layers 0–1; 3.1–3.5).

**Source scope.** The affine first-jet construction and the chain rule define the dynamics and prove the correspondence. VDPS09 §4.1 and its displayed classical systems are applications of the coordinate lemma.

### Sources and scope

The proofs of the general assertions are the obligations above. The following primary sources explain important downstream geometric settings; their specialized scope must not be silently enlarged.

- **IIS06:** Inaba, Iwasaki and Saito, [Dynamics of the Sixth Painlevé Equation](https://arxiv.org/abs/math/0501007v2), Definitions 2.1–2.2 and Lemma 2.12 for nonlinear connections and continuation; later sections for its specific geometric application.
- **I23:** Inaba, [Moduli Space of Factorized Ramified Connections and Generalized Isomonodromic Deformation](https://sigma-journal.com/2023/013/), Definition 11.4 and Corollary 11.8 for the constructed total form in the stated moduli setting.
- **BOA01:** Boalch, [Symplectic Manifolds and Isomonodromic Deformations](https://arxiv.org/abs/2002.00052v1), §7 for the isomonodromic symplectic setting under its hypotheses.
- **VDPS09:** van der Put and Saito, [Moduli spaces for linear differential equations and the Painlevé equations](https://arxiv.org/abs/0902.1702v5), §4.1 for displayed first-order systems and downstream scalar comparisons. This module does not import their displayed coefficients as intrinsic definitions.

<a id="layer-1"></a>

## Layer 1: Moduli of decorated meromorphic connections

<a id="connection-moduli"></a>

### Theorems and constructions

From the decorated meromorphic-connection data of §1.1, construct a moduli family and its flat symplectic nonlinear time connection. The construction theorem in §2.4 applies in arbitrary admitted genus and positive rank, with the local models, time directions and determinant conditions stated in §§1.1–1.2.

| Input the consumer must provide | Output constructed by this framework |
| --- | --- |
| An admitted curve, polar divisor and local decorations | The stack and rigidified stable moduli on all permitted bundle types |
| A genuine admitted time family and stability chamber | The actual horizontal splitting, flatness and pullback comparisons |
| Determinant mode and its verified conditions | Correct determinant-fiber comparison and dimension theorem |
| Nonemptiness evidence for a claimed full base | A surjective holomorphic nonlinear-connection carrier on that base |
| The same geometric input | Relative symplectic form, its preservation and the closed total form |

The admitted local models are the logarithmic full-flag, generic unramified irregular and generic totally ramified factorized models of §1.1. Logarithmic resonance is represented by flags and lattices. Nonempty fibers, global fixed-determinant transport and positive-genus fixed-determinant smoothness have the respective hypotheses and comparison theorems stated below.

### Dependencies

The geometric construction uses §0.1 for nonlinear connections and pullbacks, and §0.6 for differential-form calculus. Targets 2.1–2.2 construct the horizontal splitting and prove preservation of the trace form. The external contracts supply curve and bundle theory, stacks, coherent cohomology, formal local algebra and complex geometry.

The constructions include the presentation groupoid and its descent, rank-one determinant transport, trace-free and scalar deformation comparisons with ramified relations, finite-flat unfolding and coherent base-change maps. Scalar rigidification removes scalar inertia. Under the hypotheses of §1.5, fixing the determinant restricts the deformation space to a fiber of a smooth determinant map, of codimension 2g.

### Application hypotheses

A consumer identifies its local models and verifies the open generic conditions; specifies its actual time family and markings; chooses unfixed determinant or verifies the fixed determinant and its rank-one time transport; chooses a valid stability chamber; and provides nonemptiness evidence wherever it claims a surjective family. It then invokes §2.4. The application targets construct completeness comparisons, scalar observations and special solution families, and prove their classification and Riemann–Hilbert theorems.

<a id="target-1-1"></a>
### 1.1 Admitted decorated connection data

**General theory.**

Define a groupoid fibered over complex bases whose objects are smooth proper connected curve families, a nonempty ordered set of disjoint marked sections, a structural polar divisor P = Σ mᵢaᵢ, an integer rank r ≥ 1 and degree d, and the local data below. Construct both the unfixed-determinant problem, with all local trace polar data prescribed, and its fiber over a specified compatible line connection (L,∇L); in the latter an isomorphism det(E,∇) ≅ (L,∇L) is part of the object. A connection consists of a locally free sheaf on the entire curve, a relative meromorphic connection and the chosen decorations; matrix charts present this global object. Morphisms are actual compatible bundle isomorphisms.

The admitted domain consists precisely of the local models in I23 §§2–5: logarithmic poles m=1 with full flags and specified graded residues, including resonant and repeated residues; generic unramified poles m≥2 with full filtrations on ma and pairwise distinct leading eigenvalues; and totally ramified generic poles of rank r≥2, m≥2, with wʳ=z and ν(w)=Σₖ₌₀ʳ⁻¹νₖ(z)wᵏ, where ν₀=Σⱼ₌₀ᵐ⁻¹a₀ⱼzʲdz/zᵐ, νₖ=Σⱼ₌₀ᵐ⁻²aₖⱼzʲdz/zᵐ for k≥1, and a₁₀ is invertible. For the last model construct the finite-level factorized ramified structures, their relations and equivalence with the formal model. Roots and formal coordinates are presentations with descent arrows. Mixed blocks, arbitrary slopes, leading-eigenvalue collisions and vanishing a₁₀ lie outside this admitted domain.

Choose rational stability weights in a chamber with stable = semistable whenever that chamber is used; stability tests ∇-invariant proper subbundles. Establish Cartesian pullback with coherent isomorphisms. These local conditions define the domain in every genus and admitted rank and polar degree.

**Hypotheses**

- Complex smooth proper connected curve families; r≥1, d∈ℤ; nonempty disjoint marked sections with structural multiplicities; the three explicitly admitted local models; a chosen weight chamber.
- The determinant-fixed mode additionally includes the line connection and its determinant identification, with matching trace polar data and residue/degree relation.

**API**

- Construct restrictions, pullbacks, composition and inverse of arrows, with the associator and identity laws.
- Identify the underlying formal differential module, the induced connection on End⁰(E) of rank r² − 1, and the associated PGLᵣ connection. These latter two are the invariant adjoint/projective outputs. The local matrix A − tr(A)I/r represents the projective connection in a frame; it is not a canonically glued rank-r differential module on E. No square root of the determinant line is chosen.
- Compare equivalent local presentations by ramified descent, keeping parabolic flags and logarithmic lattices.
- Express determinant compatibility by an isomorphism of line connections; derive the residue/degree equation in a chosen local convention.

**Tests and falsification cases**

- On E = O ⊕ O(−1), the determinant has odd degree; a putative global half-determinant twist does not exist. This bundle is admitted when its determinant agrees with the prescribed one.
- Two logarithmic residues with the same repeated eigenvalue, one scalar and one nonzero Jordan block, are not identified by specifying the eigenvalues. Their allowed parabolic objects and monodromy differ.
- Changing the root w to −w in a rank-two ramified chart changes the displayed branches; the retained descent arrow identifies the resulting descended objects.
- With I23's ramified convention, a rank-two ramified point contributes 2c + 1/2 to the residue/degree relation. Replacing it by 2c changes that relation by 1/2.
- Rank zero is rejected before slope stability or the dimension formula is applied. At r = 1 the adjoint bundle End⁰(E) has rank zero, without changing the required positive rank of E.
- For A = 0 and frame change g = diag(z,1), g⁻¹dg = diag(1,0)dz/z; subtracting half its trace gives diag(1/2,−1/2)dz/z. The scalar discrepancy prevents gluing a rank-two trace-subtracted connection on E, while the induced End⁰(E) and PGL₂ connections glue.

**Supporting constructions owned by this target.**

- Use CrystallineCohomology CR.1.3's ordinary connection and tensor/dual/base-change operations, with FormalConnectionsOpers F2.1's form-carrier and tensor-symmetry comparisons. On the finite locally free sheaf E define a relative meromorphic connection E→E⊗Ω¹(P) by the first-order Leibniz rule, using ComplexComparisonPartII C5.1's operator/principal-parts interface. Prove that localization away from P gives the shared ordinary connection and that the polar bound is a condition on this same sheaf map. Construct the decorated gauge groupoid. For each tensor/dual/Hom operation used, construct its induced polar bound and local structures and verify any claimed admission; construct determinant and End⁰ comparisons on the actual sheaves and cocycles. For completion at each marked relative Cartier divisor, use FormalConnectionsOpers F1.1–F1.3, F2.1 and F3.3–F3.4's continuous/formal carriers and gauge groupoid. Prove the comparison of the completed bundle connection with that carrier, compatibility with formal coordinate changes, and ramified pullback and deck descent for the admitted local structures. The completed GL_r torsor extends across the formal disc. Prove the stackification comparison on coefficient covers satisfying F3.4's criterion and verify that criterion for each use. For e′=e·g, compare A′=g⁻¹Ag+g⁻¹dg with F3.3's left gauge h·A=hAh⁻¹−(dh)h⁻¹ by h=g⁻¹, including determinant, residue and ramified-coordinate comparisons. The algebraic/analytic comparison is the application in 1.2. No global trace-subtracted rank-r object or determinant root is introduced.

- On the shared continuous/formal connection carrier of FormalConnectionsOpers F2.1, for a finite-rank differential module over ℂ((z)), prove the characteristic-zero Levelt–Turrittin decomposition after a finite extension z=wᵉ into exponential factors tensored with regular-singular modules, with constants, refinement of e, formal coordinate change and deck descent. Use FormalLaurentPuiseux for scalar arithmetic only. Prove this decomposition and its descent on that shared carrier. Separately prove, over the stated nonvanishing/distinct-leading-coefficient base loci, the finite-level factorized models and their coherent base-change comparisons required by I23. The relative theorem is restricted to those noncollision loci. 3.4 applies this common result to rank two and structural degree four; 4.1 constructs the convergent sectorial realization and proves Stokes classification.

*Needs:* [Ordinary algebraic connections](#dependency-ordinary-connections) (CR.1.3: ordinary connection carrier and operations); [Continuous formal connections and gauge groupoids](#dependency-formal-connections) (F1.1–F1.3; F2.1; F3.3–F3.4); [Differential operators, principal parts and analytic comparison](#dependency-differential-operators) (C5.1: shared algebraic operators/principal parts only); [Formal scalar and vector-valued Laurent algebra](#dependency-formal-series) (L1–L4; L5–L6 for finite-extension steps in 1.1); [Algebraic vector bundles and finite locally free sheaves](#dependency-bundles) (L0A–L0C; L1A–L1B; L2A–L2B); [Complex manifolds, holomorphic bundles and observations](#dependency-complex) (K1; K3.0; K3.HolomorphicStalk; K3.MeromorphicGermField; K4; K7.1); [Stacks, inertia and restricted coarse-space criteria](#dependency-stacks) (1.18–1.23).

**Source scope and owned proof:** I23, Definitions 2.1, 2.2, 2.4, 2.7–2.8; Definition 3.1, Proposition 3.3, Corollaries 4.3–4.4 and §5. Construct the coordinate-independent formulation of these models and prove its 2-coherent descent.

<a id="target-1-2"></a>
### 1.2 Admitted time families and determinant transport

**General theory.**

Construct the deformation groupoid of the curve, marked poles and admitted irregular polar coefficients, keeping logarithmic residues and formal residue exponents fixed. Start from a smooth atlas of the pointed-curve stack with the finite coordinate jets and open coefficient conditions of I23 §5. Construct coordinate-change arrows and descent on the pointed-curve stack, retaining curve automorphisms. Let B be a smooth complex chart, a marking cover, or the source of an arbitrary holomorphic map from a smooth complex base to this admitted time problem. The map need not be a smooth morphism. Construct the pulled-back family and splitting by the admitted base-change comparisons. The coefficient discriminants and collisions removed from B are fixed by input data. Construct local topological markings of the punctured family and compare them on overlaps. The underlying time family carries the prescribed curve, jet and coefficient data with their descent arrows.

In unfixed-determinant mode no determinant section is selected. In fixed-determinant mode require a certified strong rank-one transport of the specified determinant: a compatible integrable total line connection, with the induced trace polar data and fixed residues. Construct this rank-one transport locally on a marked contractible time chart by extending the fixed rank-one local system and gluing the prescribed logarithmic lattices and polar primitives; verify its restriction to the initial determinant, polar bound, and cocycle laws. The logarithmic genus-zero case must also have an explicit dlog construction. Global fixed-determinant output requires actual gluing data for these local transports, or a supplied line connection with the same verified properties. The determinant family is required to carry this integrable total connection and its gluing data. This rank-one construction supplies the determinant input to the rank-r horizontal-splitting theorem of §2.1.

Separate external exponent parameters from these time directions. Strong isomonodromy preserves the transported analytic data while the irregular coefficients vary in the admitted time directions. Construct the algebraic time problem from the curve, jet and coefficient data; §4.1 supplies the analytic Stokes classification.

**Hypotheses**

- The decorated local data of 1.1 with fixed residue exponents; curve, polar-coefficient and marking variations obtained from the stated admitted time groupoid.
- For fixed determinant, the rank-one transport certificate constructed here or supplied with its verified pole, integrability, initial-value and gluing conditions.

**API**

- Separate tangent directions along the admitted time base B from variation in the external residue/exponent parameter θ, and compare the pullback tangent sequence.
- Construct marking changes and local time reparametrizations with their coherence laws.
- Identify the collision and vanishing-leading-term discriminant from the input, independently of initial conditions.
- Construct and certify local rank-one determinant transports, including the genus-zero logarithmic dlog model, and state the exact gluing datum required for global fixed-determinant output.

**Tests and falsification cases**

- Five ordered logarithmic points on ℙ¹ have two time moduli after quotient by PGL₂: 5 − 3 = 2; their configuration is independent of initial conditions.
- A change τ = 2t multiplies the displayed horizontal generator by 1/2; retaining its coefficient unchanged gives a different parametrized system.
- Two solutions with different movable pole sets use the same Bθ. A base that deletes one solution's poles fails this requirement.
- On a fixed positive-genus curve, changing a line connection by tη with nonzero holomorphic η generally changes a period and hence its rank-one monodromy. Fixed residues alone cannot certify a strong determinant transport.

**Supporting constructions owned by this target.**

- Use ComplexComparisonPartII C−1.1–C−1.2's single category of complex analytic spaces, scheme and locally separated finite-type algebraic-space analytification, with its ring sheaf, nilpotents, open/closed, fibre-product, étale, smooth and proper-morphism comparisons; use C0.3–C0.5 and C0.7 for coherent sheaves, finite locally free sheaves and analytic étale descent. For each actual curve, time chart and moduli presentation, prove that these supplied constructions identify the presentation maps and their pullback cocycles. On separated smooth finite-type scheme charts of constant differential dimension use FormalConnectionsOpers F2.4's fixed-model manifold realization and identity-on-complex-points sheaf comparison. For smooth algebraic spaces apply C−1.2 and C0.7 to their étale presentations and prove that the chart manifold comparisons descend to the same moduli object. For arbitrary smooth analytic bases identify a Hausdorff second-countable smooth analytic space of fixed complex dimension n with the native CKG manifold modeled on ℂⁿ through its analytic local charts and sheaf; compare with the supplied algebraic-chart realization whenever both apply. Work on each open-and-closed dimension locus when dimensions vary, and verify the dimension and topological hypotheses for every manifold used. General analytic spaces, including singular Betti targets and infinitesimal bases, retain the supplied carrier and nilpotents. Use the supplied proper-morphism comparison and analytic base change on the actual families. Algebraic construction remains over finite-type Noetherian complex bases; construct pullbacks along arbitrary holomorphic maps from smooth complex bases and prove their cocycle laws. The analytic category, space analytification and étale descent are supplied by the stated ComplexComparisonPartII targets; the construction here identifies their maps and cocycles for the admitted families.

- Consume the stable pointed-curve atlases at their stability hypotheses. Construct the genus-zero one- and two-marked quotient groupoids with their actual PGL₂ stabilizers, the required finite-jet torsors and coefficient-open loci, and compatible smooth atlases of these quotient groupoids. Construct local punctured-family topological markings by relative smooth trivialization preserving marked sections and compare them on overlaps. Construct rank-one determinant transport directly from the flat rank-one local system, prescribed logarithmic lattices, polar primitives and dlog formulas; this rank-one construction supplies the determinant transport used by 2.1.

- Apply ComplexComparisonPartII C1.9's proper coherent GAGA and proper direct-image comparison to each admitted algebraic curve family and each proper scheme or algebraic space for which a comparison is used. Verify properness, finite-type and coherence hypotheses and identify the canonical exchange maps with the curve, bundle and determinant maps used here, retaining the exact hypotheses of each claimed base-change theorem. Use C5.1's principal-parts analytification and C5.2's ordinary holomorphic-connection dictionary to compare 1.1's meromorphic Leibniz operators: prove compatibility with the polar divisor, flags, finite-level factorized ramified structures, determinant, restriction and pullback. The generic analytification, proper GAGA and direct-image theorems remain supplied by ComplexComparisonPartII. This analytic comparison consists of analytification of the admitted algebraic families and their pullbacks by the permitted holomorphic base maps. Algebraization of a general analytic family over a nonproper base requires additional hypotheses.

- For a smooth proper curve family with a nonempty relative marked divisor, prove that the divisor has positive degree on every geometric fiber and is relatively ample. Locally on the Noetherian algebraic base choose a sufficiently positive multiple that is relatively very ample, construct the projective embedding used by the Quot presentations, and record comparisons of the chosen powers and bases of sections by passing to a common positive multiple. The comparison of the resulting moduli presentations is proved after their construction in 1.3. Thus the nonempty marked divisor supplies projectivity and a polarization for the bounded construction.

*Needs:* Internal: 1.1; [Marked-curve charts](#dependency-curves) (ComplexCurveModuli D0.3, D3–D5; SchemeAndStackFoundations 4.15); [Complex manifolds, holomorphic bundles and observations](#dependency-complex) (K1; K3.0; K3.HolomorphicStalk; K3.MeromorphicGermField; K4; K7.1); [Complex analytic spaces and analytification](#dependency-analytic-spaces) (C−1.1–C−1.2; C0.3–C0.5; C0.7; C5.2: ordinary connection comparison prefix); [Fixed-model manifold realization of smooth schemes](#dependency-algebraic-manifolds) (F2.4: fixed-model analytification and sheaf/tangent comparisons); [Proper coherent GAGA and direct images](#dependency-coherent-gaga) (C1.9); [Differential operators, principal parts and analytic comparison](#dependency-differential-operators) (C5.1: DifferentialOperatorAnalytification); [Cohomology, duality and curve degree](#dependency-cohomology) (2.2; 2.6; 2.20; 3.3); [Proper coherent direct images and base change](#dependency-proper-cohomology) (Layer C).

**Source scope and owned proof:** I23 §5 constructs the curve/jet/coefficient time scheme and §§10–11 use it. Construct the rank-one transport with the stated pole, integrability, initial-value and gluing conditions, and prove coordinate descent for the admitted time groupoid.

<a id="target-1-3"></a>
### 1.3 Stable moduli on all bundle types

**General theory.**

Construct the stack of stable objects of §1.1 over the admitted time problem §1.2, its scalar rigidification and its relative coarse moduli space. Use bounded parameter spaces of filtered bundles and impose the connection and factorized-structure relations. Prove the moduli universal property and finite type, and prove separatedness and quasi-projectivity for the relative coarse (scalar-rigidified phase) family in the source-supported setting. The unfixed-determinant stable stack retains Gm inertia before rigidification. Work with all permitted bundle types. A matrix presentation covers only its actual locus. Construct universal objects on an étale cover, prove scalar invariance of all subsequent tensors and descend them to the coarse space.

In unfixed-determinant mode the stable scalar inertia is Gm. With a specified determinant identification it is μr; determinant fixing and rigidification are different operations. Construct the determinant morphism and the comparison with the moduli problem having specified determinant, reserving the smoothness and relative dimension calculation for §1.5. Establish the needed coarse-space base-change comparison through these local gerbe presentations. The construction allows locally empty moduli. Define the locus of nonempty fibers in B. Its openness and the surjective analytic submersion over it are conclusions of the smoothness theorem in §1.5. An application identifying this locus with all of B supplies a nonemptiness proof.

On each admitted curve/time chart, write 𝔐 for the stack of actual families and 𝔐ʳⁱᵍ for its scalar rigidification. In unfixed-determinant mode define Q(S) to be the set of families over C_S modulo isomorphisms after tensoring by p_S*L for a line bundle L on S, with the canonical relative connection along C_S/S and the transported decorations. In fixed-determinant mode such a twist also carries a trivialization L⊗r ≅ O_S compatible with the determinant identification. Construct the natural maps π₀𝔐→Q→h_M, the rigidification 𝔐→𝔐ʳⁱᵍ, and the comparisons Q^sh ≅ h_(𝔐ʳⁱᵍ) ≅ h_M, where Q^sh is the fppf sheafification on the algebraic test bases. On the admitted analytic bases use the corresponding analytic sheafification. These comparisons retain the distinction between an actual family, its scalar rigidification, and a class modulo base line-bundle twists. For the four-logarithmic-point PVI input, §4.3 compares the unfixed-determinant restriction of Q with I13 Definition 4.3 and constructs the induced coarse-space comparison.

For a trivialized ℙ¹-family and an ordered splitting type a=(a₁≥⋯≥a_r) with Σa_j=d, define Bun_a as the full substack of bundles that are fppf-locally on the base isomorphic to ⊕_j O(a_j), without retaining a chosen isomorphism. Prove its locally closed immersion into Bun_(r,d) and identify its geometric points with splitting type a; retain this relative subfunctor on nonreduced bases. Define 𝔐_a by pullback along the bundle-forgetting map 𝔐→Bun_(r,d), and construct its scalar-rigidified locally closed image M_a↪M. The definition descends under changes of the ℙ¹ presentation. For every framed matrix chart used, specify its map to 𝔐_a, its framing quotient and its actual image in M_a. Prove that the balanced locus, defined by a₁−a_r≤1, is open, and give the complement of each chart in its stated ambient moduli space.

**Hypotheses**

- The numerical and admitted local data of 1.1 and the time family of 1.2; a fixed stability chamber; all bundle types. No nonemptiness assumption is imposed on the construction.

**API**

- Construct the actual-family stack, scalar rigidification, line-twist quotient Q and its stated sheafification comparisons, together with the coarse-map universal property.
- Prove restriction and admissible base-change comparisons, including determinant fibers.
- Construct 𝔐_a and M_a for each splitting type used, prove their locally closed inclusions and the openness of the balanced locus, and compare each framed chart through its specified quotient and actual image. In degree zero the balanced locus is the trivial-bundle locus. Record each chart complement in its specified ambient moduli space.
- For a change of weights, identify the common stable locus and construct the comparison on that locus.

**Tests and falsification cases**

- A stable object may have scalar automorphisms before rigidification. The set-valued coarse quotient forgets these arrows; its existence does not imply triviality of the stabilizers.
- A family can leave a trivial-bundle chart by bundle jumping while remaining in the moduli space. Bundle jumping alone does not make the phase path singular.
- In the extension family 0 → O(−1) → E_t → O(1) → 0, E₀ = O(−1) ⊕ O(1) while E_t = O ⊕ O for t ≠ 0. The two splitting strata pull back to {0} and its complement in A¹; the first is not open. The full connection moduli must retain such bundle jumps on the permitted connection locus.
- Pulling the preceding bundle family back to t=0 makes the balanced stratum empty, although the pullback of its closure in A¹ is the point. Thus closure fails to commute with this base change.
- An admitted totally ramified generic local model is irreducible as a formal differential module, hence a global connection containing it has no proper ∇-invariant subbundle and is stable for every weight (I23 Remark 2.9). The formal irreducibility hypothesis is the admitted totally ramified generic local model of §1.1.

**Supporting constructions owned by this target.**

- After proving boundedness of the filtered connection objects, construct the finite-type parameter schemes using SSF4.14, specify the reductive framing group, linearization and Hilbert–Mumford comparison with the chosen rational parabolic weights, and prove finite generation and the required stable geometric/affine categorical quotients. Prove the actual moduli universal property, separatedness and quasi-projectivity in the I23-supported scope. Construct central Gm rigidification by fppf quotient of Isom sheaves and stackification, prove its gerbe and base-change universal properties, and compare with the GIT coarse family; separately compare μr inertia when a determinant identification is included. State exactly where finite-inertia Keel–Mori applies. Prove scalar action on each descended tensor is trivial and check coarse/base-change comparisons on these presentations.

- For each finite-type algebraic curve/time chart, prove that its analytified bounded framed Quot presentation represents the corresponding analytic families after arbitrary holomorphic base change from the smooth complex bases allowed in 1.2. Establish local analytic generation after a sufficiently positive twist, coherent analytic pushforward/base change, the holomorphic framing and factorized-connection equations, and descent of the actual relation. This constructs the analytic moduli comparison used by 2.3 over each admitted smooth analytic base. The analytic quotient is identified with the analytification of the constructed GIT quotient through these presentation maps. 1.4 constructs the deformation complex and compares its framed infinitesimal and versal charts with the moduli space constructed here by GIT.

- Compare the bounded Quot/GIT presentations arising from the positive powers and projective embeddings constructed in 1.2. First construct both presentations and their actual functor-of-points maps, then use their proved moduli universal properties to construct inverse comparison maps and the composition/base-change laws. This proves independence of the auxiliary polarization and framing choices within the stated curve stability problem.

*Needs:* Internal: 1.1, 1.2; [Quot/Hilbert and parameter schemes](#dependency-quot) (4.14); [Stacks, inertia and restricted coarse-space criteria](#dependency-stacks) (1.18–1.23); [Quotient predicates](#dependency-quotient-predicates) (1.17); [Elementary deformation theory](#dependency-deformation) (4.2–4.6).

**Source scope and owned proof:** I23 Theorem 5.1 and §§7–10 supply the admitted moduli construction. Construct the specified-determinant, rigidification and coarse-space base-change comparisons for that moduli problem.

<a id="target-1-4"></a>
### 1.4 The differential-operator deformation complex and trace pairing

**General theory.**

Construct the deformation complex from infinitesimal endomorphisms preserving the local structures, permitted variations of the connection, and all relations of the factorized ramified structures. Begin with the two-term connection complex G•. In the ramified case retain the full cone F• = Cone(G• → S•ram[1])[−1], including degrees 0, 1 and 2, both differentials and the local factorization terms. A two-term replacement requires a proved quasi-isomorphism. Identify infinitesimal automorphisms, tangent vectors and obstruction classes by hypercohomology and construct the trace/Serre-duality pairing.

The commutator with ∇ is a ℂ-linear first-order differential operator and is generally not O-linear. Use sheaves of ℂ-vector spaces with coherent underlying terms, Čech totalization and the termwise duality calculation. Prove presentation and cover independence by chain maps and quasi-isomorphisms. Construct the trace chain map tr:F•→D• to the determinant deformation complex and compare its homotopy fiber with the deformation complex for a specified determinant, including signs and local factorization compatibility. Construct the chain map, homotopy-fiber comparison and dual complex here. §1.5 constructs the scalar section and direct-sum splitting and proves orthogonality, smoothness of the determinant map and the dimension theorems. Scalar gauge automorphisms and genuine infinitesimal determinant variation are separate directions.

**Hypotheses**

- The stable moduli problem of 1.3 with the admitted filtrations and factorized ramified relations; either unfixed determinant or its specified fiber. The complex and pairing are outputs.

**API**

- Give the differential, local compatibility equations and the map from an infinitesimal family to its cocycle.
- Prove gauge-change and coboundary compatibility in both directions.
- Construct tr:F•→D•, the specified-determinant comparison with its homotopy fiber, and the dual complex with its signs. The scalar splitting is proved in §1.5.
- Prove naturality of the pairing under input isomorphisms and admissible base change.

**Tests and falsification cases**

- An infinitesimal gauge change by u changes a connection representative by the commutator differential of u; its tangent class is zero.
- Without determinant identification stable scalar automorphisms have a one-dimensional infinitesimal direction. Fixing the identification removes that direction in characteristic zero, although finite μr remains until rigidification. Removing the scalar infinitesimal automorphism direction is distinct from imposing the trace-free tangent condition; §1.5 identifies the latter with removal of the 2g determinant deformation directions.
- With ω = dq ∧ dp, the ordered tangent pair (∂q, ∂p) has pairing +1 and the reversed pair −1; a reversed trace convention must be corrected before transport formulas are used.

**Supporting constructions owned by this target.**

- Build the total Čech complex in sheaves of ℂ-vector spaces, with coherent underlying terms and the actual C-linear first-order differentials, then prove refinement, cover independence, cone signs, trace pairing and termwise Serre-duality compatibility. Identify automorphisms, tangents and obstructions by the actual lifting cocycles, for the ramified three-term cone including all factorization relations. Extend SSF4.5's elementary small-extension framework to finite-dimensional square-zero kernels, and prove linearity, compatibility with direct sums and base-change naturality for the resulting lifting and obstruction maps.

- Use ComplexComparisonPartII C5.1's characteristic-free finite-order operator/principal-parts interface, DifferentialOperatorAnalytification and boundedOperatorHyperGaga. For the bounded decorated deformation complex on each proper complex curve, prove the order bounds, coherence of every term and compatibility of the analytified differential with the actual local constraints. Identify the supplied comparison with the chain maps of the ramified three-term cone, including its factorization relations, trace and duality pairings. C5.1 supplies composition compatibility and the proper operator-complex GAGA theorem. Construct the decorated complex and verify its hypotheses and the identifications of comparison maps. Use sheaves of complex vector spaces with coherent underlying O-module terms and their ℂ-linear differential operators. For relative p:C→B use the supplied relative comparison only after proving p⁻¹O_B-linearity and its proper/coherent/bounded hypotheses; every further cohomology/base-change assertion retains its exact flatness and finiteness hypotheses. The operator input to this construction is C5.1's finite-order principal-parts interface.

- For the relative family p:C→B retain the p⁻¹O_B-module action on the sheaves and the p⁻¹O_B-linearity of the connection differential. It is not O_C-linear. Construct the decorated Čech total complex and trace with that base-module action; identify C5.1's supplied principal-parts and relative GAGA maps on this complex and prove compatibility with each claimed base-change map. Prove the fiberwise comparison with absolute ℂ-linear cohomology while retaining this relative base-module structure.

- Construct framed infinitesimal and versal charts from the actual lifting equations and the deformation complex. Prove their tangent, obstruction and lifting comparisons with the bounded GIT moduli construction of 1.3.

*Needs:* Internal: 1.3; [Cohomology, duality and curve degree](#dependency-cohomology) (2.2; 2.6; 2.20; 3.3); [Elementary deformation theory](#dependency-deformation) (4.2–4.6); [Differential operators, principal parts and analytic comparison](#dependency-differential-operators) (C5.1: shared algebraic operators/principal parts; C5.1: DifferentialOperatorAnalytification; C5.1: boundedOperatorHyperGaga); [Proper coherent GAGA and direct images](#dependency-coherent-gaga) (C1.9).

**Source scope and owned proof:** I23 §6, (6.9), Proposition 6.3 and §7, Proposition 7.2. Construct the comparison of the specified-determinant fiber with the homotopy fiber of the trace map, including its compatible trace-free complex.

<a id="target-1-5"></a>
### 1.5 Smoothness, dimension and the determinant fiber

**General theory.**

Use §1.4 to prove obstruction vanishing and smoothness of the stable moduli family in the admitted domain. Prove that its nonempty-fiber locus in the time base is open and that its analytic restriction to this locus is a surjective submersion. Identify its relative tangent bundle by first hypercohomology. For unfixed determinant and a nonempty stable fiber, derive dim M_b = 2r²(g−1)+2+r(r−1)deg P. The local trace polar parts are fixed in this formula.

For the fixed-determinant export, construct the determinant moduli of line connections with those trace polar parts, locally an affine bundle of rank g over Picᵈ(C_b), and prove that its tangent complex is the regular de Rham complex O_C → Ω¹_C. For the trace chain map tr:F•→D• constructed in §1.4, build over ℂ the scalar chain-map section s using 1/r, including all ramified relations, and prove tr∘s=id. Construct the resulting direct-sum quasi-isomorphism F• ≃ F•det ⊕ D•, where F•det is the specified-determinant homotopy fiber compared in §1.4. Prove the induced determinant map is smooth on the stated stable locus, with surjective tangent map onto a 2g-dimensional determinant tangent space. Identify the specified-determinant coarse family with the relevant fiber after its gerbe comparison. Deduce from this smooth determinant map that dim M_b^det = 2(r²−1)(g−1)+r(r−1)deg P. Prove that the trace pairing splits orthogonally into the trace-free and scalar directions and is nondegenerate on the fixed-determinant tangent space. Rank-one fixed-determinant fibers are zero-dimensional.

Prove the deformation-functor comparison, smoothness of the determinant map and orthogonal trace splitting on the full complex. Their restriction to the specified-determinant fiber gives its dimension and symplectic theorems under the stated hypotheses; in genus zero the fixed- and unfixed-determinant dimensions agree.

**Hypotheses**

- The moduli construction of 1.3 and actual complex and trace pairing of 1.4; the admitted local models over ℂ.
- Dimension assertions concern nonempty stable fibers. The fixed-determinant conclusion additionally requires the determinant-map comparison proved in this target.

**API**

- Identify the relative tangent sheaf and prove base-change compatibility for tangent and obstruction calculations.
- For §1.4's trace map and specified-determinant homotopy fiber, construct the scalar section s, prove tr∘s=id and the direct-sum comparison, and verify all local compatibility equations.
- Use the smooth determinant map and orthogonal trace decomposition to identify and remove the 2g determinant directions.
- Return separate unfixed- and fixed-determinant dimension theorems with their exact hypotheses.

**Tests and falsification cases**

- Genus zero, rank two and degree four give −8 + 2 + 8 = 2; structural degree five instead gives 4.
- Fixing the determinant in positive genus removes 2g directions when the determinant-map comparison applies; the genus-zero coincidence cannot be exported unchanged.
- At r = 1 and g = 1 the unfixed-determinant formula gives 2, and fixing the entire line connection gives 0. The rank-zero input that would incorrectly give 2 is outside the domain.
- For g=1, r=2 and deg P=1, the unfixed formula gives 4 and the fixed-determinant formula gives 2 whenever the corresponding stable fiber is nonempty and the comparison holds; removing only the scalar stabilizer would miss this difference.

**Supporting constructions owned by this target.**

- Construct the fppf relative Picard algebraic space for the projective flat finitely presented complex curve families used here, over locally Noetherian bases, under the universal-functions condition O_B≅p_*O_C after every base change. Include coherent base-change comparison and the line-bundle deformation argument establishing relative smoothness by the affine square-zero tests and relative cohomological-dimension theorem specified below; state identity-component and constant-dimension hypotheses explicitly, retaining nonreduced curve and base tests. JacobianChallenge C–D supplies only the coherent floor and its fixed-field geometrically integral specialization. For smooth marked curves construct the relative Picᵈ, its rigidified Poincaré comparison and the affine torsor of line connections with fixed compatible trace polar parts. Prove its regular de Rham tangent complex and dimension 2g, construct the full trace/scalar splitting, and prove smoothness of the determinant map. Deduce the fixed-determinant dimension and symplectic theorems from these comparisons. The nonreduced-curve Picard subtheorem supplies 5.1 without using any Painlevé-specific fact.

- Test formal smoothness locally on affine square-zero thickenings T₀↪T with quasi-coherent ideal I. Flatness identifies the ideal of C_T0 in C_T with p*I. Construct the obstruction in H²(C_T0,p*I), the torsor of isomorphism classes of lifts with a specified restriction isomorphism under H¹(C_T0,p*I), and their infinitesimal automorphisms from H⁰. Prove R^q p_*(p*I)=0 for q>1 by proper relative dimension at most one and use the affine base and Leray to obtain H²=0. Handle general test bases by open/fppf descent and apply the local finite-presentation criterion to deduce smoothness. The absolute H² vanishing step uses the affine test base; the result on general bases follows by descent. See PICREL tags 0D2C, 0DNI, 0DPJ and 0DPK.

*Needs:* Internal: 1.3, 1.4; [Cohomology, duality and curve degree](#dependency-cohomology) (2.2; 2.6; 2.20; 3.3); [Elementary deformation theory](#dependency-deformation) (4.2–4.6); [Picard over a field and Picard foundations](#dependency-field-picard) (JacobianChallenge Layer D; SchemeAndStackFoundations 1.1, 2.6, 3.4, 4.6, 4.14); [Proper coherent direct images and base change](#dependency-proper-cohomology) (Layer C).

**Source scope and owned proof:** I23 Theorem 7.5 and its determinant-obstruction argument give the unfixed-determinant smoothness theorem. Prove the splitting of the full cone, orthogonality and smoothness of the determinant map to obtain the stated fixed-determinant conclusions.

<a id="target-1-6"></a>
### 1.6 Finite-flat unfoldings and closed symplectic forms

**General theory.**

Construct the relative trace two-form on the moduli family, descend it from the universal-object cover and prove nondegeneracy using §1.4 and §1.5. Prove closedness by the following auxiliary construction. Over a smooth integral auxiliary base H, replace the fixed polar divisor by the finite-flat divisors of I23 §8. At a ramified point use ∏ⱼ₌₁ᵐ⁻¹(z−hʳqⱼ)(z−hʳ), with qⱼ distinct, nonzero and different from 1. Construct the moduli algebraic space of simple connections with the unfolded factorized local structures, an étale universal-object cover, the relative deformation complex and trace form. Prove boundedness and the deformation statements for this family with finite-flat polar support, including its nonreduced fibers.

Prove smoothness over H and identify the original stable moduli, complex and form with the appropriate open part of the central fiber. On the dense open parameter set with generic separated poles, construct both quasi-isomorphisms from the diagonal deformation complex to the unfolded complex and the logarithmic parabolic complex, respecting trace forms. Prove closedness of the logarithmic trace form by the Čech cup-product/trace calculation and gauge descent and transfer it through these two comparisons. The relative sheaf of three-forms on this smooth family over an integral base is locally free, and restriction to the indicated dense open detects zero. Deduce d_relative ω=0 on the whole family, restrict to the central stable locus and descend. For nonreduced base changes, pull back the closedness identity proved over the smooth integral auxiliary base.

The fixed-determinant result is the pullback of this closed form to the determinant fiber, with nondegeneracy supplied only after §1.5's orthogonality comparison. The construction applies throughout the admitted rank, genus and local-model domain.

**Hypotheses**

- §§1.3–1.5 in the admitted domain. Smoothness, the auxiliary simple-connection family, generic comparison maps and closedness are outputs.
- For the fixed-determinant symplectic export, the determinant-fiber comparison and nondegeneracy gate in 1.5.

**API**

- Construct the finite-flat unfolding, the moduli of simple connections and the universal-object cover, and identify their central fibers.
- Construct both diagonal-complex comparison maps and prove compatibility with the trace pairing.
- Prove nondegeneracy and closedness independently, including descent and base-change compatibility.

**Tests and falsification cases**

- A skew pairing which vanishes identically is closed but is not symplectic; nondegeneracy must follow from the actual duality computation.
- For r = 2, local order 2 and q₁ = 2, the unfolding equation is (z − 2h²)(z − h²). Its fiber at h = 0 is z² and at h = 1 is (z − 2)(z − 1); modulo h² it is again z². Compare the central and pulled-back complexes and forms, including those on the nonreduced polar divisors.
- For each admitted rank, genus and local model, construct the finite-flat unfolding, both generic comparison maps and the closedness proof from the moduli and deformation data of §§1.3–1.5.

*Needs:* Internal: 1.3, 1.4, 1.5; [Cohomology, duality and curve degree](#dependency-cohomology) (2.2; 2.6; 2.20; 3.3); [Elementary deformation theory](#dependency-deformation) (4.2–4.6); [Algebraic vector bundles and finite locally free sheaves](#dependency-bundles) (L0A–L0C; L1A–L1B; L2A–L2B).

**Source scope and owned proof:** I23 Theorem 8.1, Propositions 8.2–8.3 and the complex preceding (8.2). Construct the auxiliary finite-flat family, both deformation-complex comparisons and trace-form descent in this target.

<a id="layer-2"></a>

## Layer 2: Isomonodromic connections

<a id="target-2-1"></a>
### 2.1 Strong integrable extensions and horizontal splittings

**General theory.**

For a time tangent at a moduli point, construct a strong integrable extension of the universal connection over the corresponding dual-number deformation. On the moving total curve X let D be the sum of the marked relative Cartier divisors with coefficient one, formed on the smooth ambient family before pullback to the infinitesimal base. The allowed total-form pole filtration is Ω¹_X(log D) ⊗ O_X(P−D), relative to any fixed auxiliary base. Require integrability and preservation of the kernel lattices attached to the local filtrations, namely kernels of E → E|_{mᵢaᵢ}/Fᵢ,k with the relevant structural thickening and the additional factorized relations. Preserving flags separately on each fiber is insufficient. Prove the coordinate lemma that, in a moving polar coordinate z, the allowed forms are generated by dz/zᵐ and dε/zᵐ⁻¹; the time coefficient is regular at a logarithmic point.

Prove existence and uniqueness up to the specified isomorphism restricting to the identity on the central fiber, within this strong extension class. Glue the local lifts and descend from the universal-object cover. Construct the actual O-linear splitting h:π*TB→TM and prove dπ∘h=id. In fixed-determinant mode prove that taking determinant of the constructed extension agrees with the certified rank-one transport of §1.2, so that h is tangent to the moving determinant fiber. Construct h and its strong integrable extensions here, prove determinant compatibility for the certified transport, and prove trace-form preservation in §2.2.

**Hypotheses**

- The admitted time and moduli constructions of §§1.1–1.5 and a time tangent vector. The total pole filtration and kernel-lattice relations specify the class of extensions being constructed.
- For fixed determinant, §1.2 supplies the verified rank-one time transport and §1.5 supplies the determinant-fiber comparison.

**API**

- Construct the lift from a time tangent and prove additivity and O-linearity.
- Prove restriction, base-change and input-isomorphism naturality of the lift.
- Compare lifts computed with different local coordinates, formal diagonalizations and universal-object covers.
- Identify the induced horizontal subbundle and its projection isomorphism to π*TB.
- Prove determinant functoriality of the strong extension and tangency to a certified moving determinant fiber.

**Tests and falsification cases**

- A zero time tangent lifts to zero; adding an arbitrary vertical vector would violate uniqueness of the integrable extension.
- Rescaling the time tangent by 2 rescales its lift by 2, while changing the time coordinate to 2t rescales the normalized generator by 1/2.
- The zero map cannot be a splitting over a nonzero time tangent because dπ ∘ 0 = 0 ≠ id.
- At m=1 a proposed time term dε/z lies outside the allowed total-form module in a moving polar coordinate; fiberwise flag preservation cannot repair that violation.

**Supporting constructions owned by this target.**

- Using 1.1 formal carriers and 1.4 actual deformation cocycles, construct the strong infinitesimal total connection over each admitted dual-number time direction, with pole module Ω¹(log D)⊗O(P−D), kernel lattices and factorized relations. Prove existence and uniqueness of the deformation class with its specified central identification, preserve the determinant transport, and prove overlap/descent comparisons; scalar infinitesimal automorphisms must remain accounted for before rigidification. 2.2 proves mixed-time flatness and trace-form preservation separately, and 2.3 proves coherent arbitrary holomorphic base change. FormalConnectionsOpers F8.1 defines arrows by isomorphisms of underlying formal connections after forgetting the oper reduction. Here the admitted irregular coefficients may vary with time, and the output is a splitting of the global moduli family over that time base. Construct the global splitting from the infinitesimal deformation cocycles and the overlap comparisons described here.

*Needs:* Internal: 1.1, 1.2, 1.3, 1.4, 1.5, 0.1; [Elementary deformation theory](#dependency-deformation) (4.2–4.6).

**Source scope and owned proof:** I23 Definition 10.1, (10.1), Lemmas 10.3–10.6, Propositions 10.7/10.10 and (11.2); prove determinant compatibility and identify the intrinsic pole filtration with the stated local form modules.

<a id="target-2-2"></a>
### 2.2 Flatness, trace-form preservation and the closed total form

**General theory.**

Compare the two-parameter strong extensions and their mixed infinitesimal term to prove h([v,w])=[h(v),h(w)]. Derive the bracket identity from the algebraic extension comparison of §2.1.

For a holomorphic horizontal section s:V→M of the rigidified phase family, pull back the scalar gerbe and the universal-object cover of §1.3. After shrinking to time charts V_i admitting such a lift, construct a representative decorated family (E_i,∇_i) on C_(V_i) and a strong integrable total connection restricting to its relative connection. Retain the chosen representative and its identification with s|_(V_i); in fixed-determinant mode the total determinant is the transport certified in §1.2. For a change of representative by a base line bundle L, choose on sufficiently small charts a compatible integrable connection on L and compare total connections by the tensor formula ∇_tot′=∇_tot⊗1+1⊗p*∇_L and connection-preserving isomorphisms. In fixed-determinant mode the induced connection on L⊗r must be trivial under its specified trivialization. A global bundle with total connection is an output only with connection-preserving transition isomorphisms satisfying the triple-overlap cocycle. Without that descent datum, the output consists of local objects over the pulled-back gerbe, not a total connection on every representative of the coarse section.

Use the actual trace cocycles and strong-extension comparison to prove that the constructed horizontal variation preserves the relative symplectic form ω. Flatness of an arbitrary splitting alone would not imply that assertion. Define Ω(v,w)=ω(v−h(dπv),w−h(dπw)), prove dΩ=0 and ker Ω=im h, and deduce preservation of ω by local horizontal transport. Apply the differential-form identities of NonlinearConnections §0.6 to the flatness and trace-form preservation established by these calculations. On a one-dimensional time chart equipped with a symplectic trivialization and the required local exactness, derive Ω=dq∧dp+dH∧dt in relative dimension two, and the analogous sum in higher even dimension. Scalar Hamiltonians are local primitives attached to charts.

**Hypotheses**

- The actual strong splitting of 2.1 and the relative symplectic form of 1.6, with the determinant gate where applicable. Flatness and preservation of that form are outputs.

**API**

- Compute the mixed two-parameter extension term and obtain the bracket identity and flat horizontal distribution.
- For a specified horizontal section construct local representative families with strong total connections; construct their comparisons under compatible base line-connection twists, and prove descent for supplied connection-preserving transition maps and their cocycle.
- Recover the relative form by vertical restriction and the horizontal distribution as the kernel.
- Prove admissible base-change naturality for the relative form, the actual splitting and the closed total form.
- Compare two Hamiltonian potentials in a fixed chart: their difference is constant along connected phase fibers.
- State the extra generator term for a time-dependent symplectic change of coordinates through equality of the extended two-forms.

**Tests and falsification cases**

- For H = p²/2, contraction with ∂t + p∂q annihilates dq ∧ dp + p dp ∧ dt; using the opposite sign does not.
- H and H + t² give the same vertical vector field and extended two-form, but different scalar functions.
- On a symplectic fiber, Ω has no nonzero vertical kernel vector; degenerating ω to zero would fail this characterization.
- On ℂ²×ℂ with ω=dq∧dp, h(∂t)=∂t+q∂q is flat because the base has dimension one, but its flow scales ω. This fails the trace-form preservation condition.
- In unfixed-determinant mode, on ℙ¹_z×ℙ¹_B with the only polar section z=∞, E=pr_B*O(1) with relative connection d_z represents a constant rank-one coarse horizontal section. A total connection regular in the B-direction would restrict at z=0 to a holomorphic connection on O(1), which cannot exist. The section therefore supplies local representatives, not a total connection on this global representative.

*Needs:* Internal: 1.3, 1.4, 1.6, 2.1, 0.6; [Complex manifolds, holomorphic bundles and observations](#dependency-complex) (K1; K3.0; K3.HolomorphicStalk; K3.MeromorphicGermField; K4; K7.1).

**Source scope and owned proof:** I23 Theorem 11.6, Definition 11.4 and Corollary 11.8. Prove flatness by the mixed-extension calculation and trace-form preservation by the trace-cocycle variation.

<a id="target-2-3"></a>
### 2.3 Naturality and coherent change of presentation

**General theory.**

For isomorphic admitted decorated time problems construct compatible isomorphisms of their stacks, rigidifications and phase families, preserving the trace pairing, ω, h and Ω. Cover finite-jet coordinate changes, formal frame changes, ramified root changes with descent data, universal-object covers and compatible rank-one determinant transports. Construct the pullback comparison for a holomorphic map f:B′→B between smooth complex bases and prove that the resulting horizontal vector at (b′,m) is (v′,h_m(df(v′))). The corresponding algebraic stack pullback remains meaningful for general test bases, but analytic submersion statements require a smooth complex base.

Record the natural comparison isomorphisms for identity and composite base changes, the associativity pentagon, the identity triangles and compatibility with 2-isomorphic presentation arrows. On the rigidified phase spaces these descend to the required equalities/cocycle laws. Thus the construction is pseudofunctorial before rigidification and functorial up to the specified canonical comparisons afterward. Changes of determinant, weights, labels or formal local type that are not isomorphisms of the input remain genuine parameter changes or correspondences on stated domains. A time-dependent gauge matrix changes a formula but the compatible object and its transported tensors remain identified.

**Hypotheses**

- Isomorphisms of the same admitted decorated time problem and base maps preserving its specified data; the constructions of §§1.1–2.2.
- Analytic output is over smooth complex bases; coarse-space comparisons use the scalar-gerbe descent from 1.3. Non-isomorphic parameter changes are not included among presentation arrows.

**API**

- Give the stack-level comparison 1-isomorphisms and their coherent 2-isomorphisms; descend the corresponding phase-space comparisons.
- Prove equality of pullback splitting and forms with the outputs constructed after base change.
- For each presentation or base-change comparison F:M′→M over f:B′→B constructed here, prove π∘F=f∘π′, dF∘h′=h∘df, F*ω=ω′ and F*Ω=Ω′ on its stated domain. Domains for changes of weights are supplied by §1.3; genuine geometric transformations and their parameter maps are constructed in §5.4.

**Tests and falsification cases**

- For f:B′→B and g:B″→B′, compare direct (f∘g)* construction with g*f* and verify the canonical comparisons for triple compositions and the associativity pentagon for four composable arrows.
- A weight wall crossing changes the stable locus and is not a presentation isomorphism unless an actual common stable domain has been specified.
- The base map t=s² pulls h(∂t) back to h′(∂s)=(∂s,2s h(∂t)); at s=0 the horizontal vector still projects to ∂s, so the base map need not be a local isomorphism.

*Needs:* Internal: 1.1, 1.2, 1.3, 1.4, 1.6, 2.1, 2.2, 0.1; [Stacks, inertia and restricted coarse-space criteria](#dependency-stacks) (1.18–1.23).

**Source scope and owned proof:** I23 Propositions 10.7 and 10.10 supply uniqueness used by the comparison. Use this uniqueness to construct the intrinsic base-change comparisons and prove their 2-coherence.

<a id="target-2-4"></a>
### 2.4 Isomonodromic connections on meromorphic-connection moduli

**General theory.**

Assemble §§1.1–2.3 into a construction from each admitted decorated time problem to its rigidified stable phase family and, over the open nonempty-fiber part of a smooth analytic time base, a holomorphic flat symplectic nonlinear connection (π:M→B,h,ω) in NonlinearConnections §§0.1 and 0.6, together with its closed total form Ω. The inputs are curve and local connection data, a stability chamber and the determinant mode; the construction supplies h and the relative and total forms from these data. The result applies in arbitrary genus and admitted rank/polar degree for unfixed determinant; fixed-determinant export requires the separately proved comparison in §1.5 and the certified time transport in §1.2.

Give a single consumer certificate listing local-model admission, the actual time base, determinant verification, weight choice and nonemptiness evidence. Return the geometric carrier, the constructed tensors, dimension theorem at its exact scope, naturality and coherent pullback laws. A consumer proves only these admission conditions and its further specialized results. In particular neither relative dimension two nor one-dimensional time belongs to this construction theorem. For the classical input of §3.3, the proper Riemann–Hilbert comparison and completeness theorem are constructed in §§4.1–4.7 under their stated hypotheses. Chosen observables, scalarization and distinguished solutions have their stated application hypotheses and constructions. The theorem combines the construction and comparison maps of §§1.1–2.3 at precisely these admission hypotheses.

**Hypotheses**

- The admitted geometric input and time problem of 1.1–1.2; stable construction of 1.3–1.6 and the actual h, flatness and naturality from 2.1–2.3.
- Restrict to the open nonempty-fiber time locus for a surjective nonlinear-connection carrier; a consumer must provide nonemptiness if its whole proposed base is claimed.
- Fixed-determinant export additionally passes the independent determinant-fiber and rank-one transport gates.

**API**

- Construct π, h, ω and Ω from the admitted geometric input and prove their submersion, splitting, flatness, nondegeneracy, preservation and closedness laws.
- Supply the common application certificate and state separately the hypotheses for construction, nonemptiness and completeness.
- Prove the base-change and presentation-equivalence laws using the canonical comparisons of 2.3.

**Tests and falsification cases**

- The construction applies to every admitted genus, rank, polar degree and time dimension, with local prerequisites and outputs specified by the geometric data in §§1.1–2.3.
- Five logarithmic points on ℙ¹ in rank two, fixed determinant and a nonempty stable locus give relative dimension 4 and a two-dimensional configuration base; the construction theorem must accept that input.
- A tuple of arbitrary formal singularities is not admitted merely because its dimension formula happens to be positive; each local model and determinant/time certificate must be verified.
- A holomorphic flat symplectic connection can have incomplete horizontal curves; this export alone cannot justify global continuation of all initial conditions.

*Needs:* Internal: 1.1, 1.2, 1.3, 1.4, 1.5, 1.6, 2.1, 2.2, 2.3, 0.1, 0.6.

**Source scope and owned proof:** I23 supplies the admitted unfixed-determinant construction model. Assemble it with the determinant and coherence comparisons proved in §§1.1–2.3, and establish the stated construction theorem and application criteria.

### Constructive proof requirements

- `M-local-presentation-descent` — In §§1.1, 1.2 and 2.3, construct intrinsic input groupoids and coherent descent for coordinate and root changes, and compare their local presentations with I23.
- `M-determinant-time` — In §§1.2 and 2.1, construct rank-one strong determinant transport on the admitted local charts, its global gluing under the stated certificate, and its compatibility with the rank-r lift.
- `M-determinant-fiber` — In §§1.4–1.6, compare the full ramified deformation cone with the regular determinant de Rham complex. Prove scalar splitting, smoothness of the determinant map, the dimension reduction by 2g and orthogonal nondegeneracy, and deduce fixed-determinant symplecticity in positive genus.
- `M-early-unfolding` — In §1.6, construct the finite-flat auxiliary family and both generic-fiber comparison maps, and use them to prove closedness of the trace form.
- `M-strong-lift` — In §§2.1–2.2, prove existence and uniqueness within the total-pole and kernel-lattice extension class, mixed-term flatness and preservation of the trace form.
- `M-coherent-export` — In §§2.3–2.4, construct the canonical pullback and presentation comparisons, prove their 2-coherence, and establish the general construction theorem.

### Primary sources and exact use

- **I23** — [Michi-aki Inaba, Moduli Space of Factorized Ramified Connections and Generalized Isomonodromic Deformation, SIGMA 19 (2023), 013](https://sigma-journal.com/2023/013/); [PDF](https://sigma-journal.com/2023/013/sigma23-013.pdf). §§2–5; §6 (6.9), Proposition 6.3; §7 Proposition 7.2, Theorem 7.5; §8 Theorem 8.1, Propositions 8.2–8.3; §10 Definition 10.1, (10.1), Propositions 10.7/10.10; §11 Definition 11.4, Theorem 11.6, Corollary 11.8.

The construction theorem of §2.4 applies to the admitted local models of I23, with the determinant and base-change comparisons specified in §§1.1–2.3.

<a id="layer-3"></a>

## Layer 3: Phase spaces and isomonodromic deformations of Painlevé equations

<a id="painleve"></a>

**Summary.** Construct Painlevé dynamics from moduli of meromorphic connections, and construct Painlevé functions from the horizontal sections of that dynamics. The input consists of a curve, a structural polar divisor, a determinant connection, local formal moduli conditions, and stability and marking data. The phase space, its symplectic form, and its horizontal distribution are constructed from this input. A common continuation theorem precedes every classical scalar equation. The ten underlying rank-two formal profiles, their labelled realizations, their eight additive surface types, and the six classical differential equations are comparison results. The theory includes resonant parameters, allowed reducible connections, ramified irregular singularities, special invariant loci, tau sections and their scalar normalization. Elementary coefficient degenerations are covered by a separate boundary comparison. JMU/Hamiltonian comparisons of tau sections have the precise generic scope stated in targets 6.4–6.5; the determinant construction itself has the broader marked-RHP scope specified in 6.2–6.3.

### Scope

The general Fredholm determinant line and its canonical section are constructed in §6.1. For the trace-class realizations in §§6.3–6.4, use the determinant of RandomMatrices §8.3 with its stated operator hypotheses.

Rational and classical-function solutions are the explicit families constructed by §§5.4–5.6 and §§7.1–7.5 from geometric reductions and transformations. Target 7.3 covers the coefficient-boundary equations. The finite-flat unfolding in §1.6 is part of the symplectic closedness theorem.

The scope excludes difference and q-difference Painlevé dynamics, discrete Sakai classification, cluster realizations, arbitrary-rank wild nonabelian Hodge theory, exhaustive classification of algebraic special solutions, boundary-value asymptotics and connection constants, Hastings–McLeod identification, confluence, and Garnier systems.

### Conventions

Work over ℂ. Curves are smooth connected projective curves, with a finite nonempty ordered set of pairwise distinct marked points. The general rank is an integer r ≥ 1; slope stability is defined on this positive-rank domain. A ramified local condition also satisfies the rank and local-order restrictions of its stated formal model. The classical subcategory has genus zero and rank two. Write P = Σ mᵢaᵢ for the structural polar divisor; it bounds the poles and records the local moduli problem. It is not the divisor of nonzero poles of each individual connection. Apparent singularities and scalar residues at a marked point are allowed when the local conditions allow them. The auxiliary unfolding in §1.6 uses a separately constructed finite-flat divisor; its special fibers need not consist of distinct marked sections.

An object is a vector bundle E on the whole curve, a meromorphic connection ∇: E → E ⊗ Ω¹(P), an isomorphism of its determinant connection with the specified line connection, and the local structures below. All relevant bundle splitting types are retained. The general input permits a meromorphic determinant; the classical complexity subcategory uses a regular-singular determinant with fixed residues and its compatible moving-curve transport. The determinant degree may be odd. At a logarithmic point prescribe residue eigenvalues and a compatible filtration, with all compatible resonant formal isomorphism classes included. At an unramified irregular point use a generic distinct-leading-term formal condition. At a ramified point use the generic factorized ramified condition, with ramified descent. Leading coefficients required to be nonzero remain nonzero within a fixed irregular stratum. Their vanishing changes the input stratum; §7.3 compares the coefficient-boundary equations.

Write w for stability weights and α for a classical scalar coefficient. Use generic stability weights for which semistability equals stability on the specified numerical data. Stability concerns ∇-invariant subbundles. Changing a weight chamber is a wall-crossing problem, not an auxiliary-choice invariance. Isomorphisms preserve the determinant identification, labels and prescribed local structures. Retain these arrows before rigidification or passage to a coarse moduli space. For a stable rank-two object with determinant identification fixed, the residual scalar group is μ₂, not the full multiplicative group; fixing the determinant and rigidifying this remaining group are different operations.

Write Θ for fixed external residue/exponent parameters and Bθ for an admitted marked time base with θ ∈ Θ fixed. Write πθ: Mθ → Bθ for the phase family. The distinction between fixed parameters and time directions is part of the deformation problem. For the convention ∇ = d + A, a logarithmic residue λ has monodromy eigenvalue exp(−2πiλ); sources using d − A or exponent θ = −λ have exp(2πiθ). Retain the actual logarithm parameters in the fiber product defining the comparison target: forgetting them is not a proper map.

The horizontal splitting is h: π*TB → TM with dπ ∘ h = id. Its image is the invariant dynamics. A vector field representing it requires a chosen time vector. A local solution is a holomorphic section s of π satisfying ds(v) = h(v), with a specified initial point. Paths are compact piecewise C¹ paths in the fixed admitted base. This time base is fixed independently of the selected solution.

Use ω = dq ∧ dp and ι_Xω = d_phase H in a Hamiltonian chart. Thus q′ = H_p and p′ = −H_q. The extended form is Ω = dq ∧ dp + dH ∧ dt, whose kernel contains ∂t + X. Under τ = f(t) the normalized horizontal generator scales by dt/dτ. A scalar Hamiltonian is local and can change by a time-only function or by the generator of a time-dependent symplectic coordinate change.

“Painlevé function” first means a geometric horizontal section or its germ. A scalar function is the evaluation of a specified admissible observable, with a time coordinate and normalization. An everywhere defined map to ℙ¹ may give the constant value ∞; the usual meromorphic-function conclusion excludes that case. Universal-cover continuation and single-valued descent to B are different conclusions.

### Dependencies between layers

Construct nonlinear connections, solutions, transport and observations as general theorems. Construct admitted meromorphic-connection moduli and their strong isomonodromic connection. Restrict this construction to the classical input and verify its formal profiles. Prove the full classical Riemann–Hilbert comparison and Painlevé property before developing the surface, transformation and Riccati comparisons. Construct determinant lines and tau sections. Derive the classical scalar equations, Hamiltonians and sigma forms in separate coordinate-comparison targets. The construction, continuation, surface geometry and tau-section targets have no classical scalar comparison prerequisite.

<a id="target-3-1"></a>
### 3.1 Decorated connections for Painlevé equations

**Painlevé application.**

**Hypotheses.**

- An object of MeromorphicConnectionModuli 1.1, with its arrows, determinant and admitted local structures.

Use the category of decorated connections constructed in MeromorphicConnectionModuli §1.1, with the same objects and arrows. Record the determinant, local decorations, weights and marking for the genus-zero rank-two restriction of §3.3. Identify the local presentations used in the Painlevé sources with these same objects, preserving filtrations, logarithmic lattices and ramified descent. Use End⁰(E) and the induced PGLᵣ connection for the invariant adjoint and projective constructions. These constructions are defined for every admitted determinant, including determinants without a global square root. (I23, §§2–4.)

**API.**

- Identify the objects, arrows and pullbacks with those of MeromorphicConnectionModuli §1.1.
- Supply the odd-determinant and resonant/ramified presentation comparisons used by the classical restriction.

**Checks.**

- On E = O ⊕ O(−1), the determinant has odd degree; a putative global half-determinant twist does not exist. This bundle is admitted when its determinant agrees with the prescribed one.
- Two logarithmic residues with the same repeated eigenvalue, one scalar and one nonzero Jordan block, are not identified by specifying the eigenvalues. Their allowed parabolic objects and monodromy differ.
- Changing the root w to −w in a rank-two ramified chart changes the displayed branches but gives an equivalent descended object; forgetting the descent arrow fails this check.
- With I23's ramified convention, a rank-two ramified point contributes 2c + 1/2 to the residue/degree relation. Replacing it by 2c changes that relation by 1/2.
- Rank zero is rejected before slope stability or the dimension formula is applied. At r = 1 the adjoint bundle End⁰(E) has rank zero, without changing the required positive rank of E.
- For A = 0 and frame change g = diag(z,1), g⁻¹dg = diag(1,0)dz/z; subtracting half its trace gives diag(1/2,−1/2)dz/z. The scalar discrepancy prevents gluing a rank-two trace-subtracted connection on E, while the induced End⁰(E) and PGL₂ connections glue.

*Needs:* Internal: 1.1.

<a id="target-3-2"></a>
### 3.2 Time-deformation spaces for Painlevé equations

**Painlevé application.**

**Hypotheses.**

- The imported decorated input and admitted deformation problem, with fixed exponent data; the classical determinant time-lift comparison must be verified.

Use MeromorphicConnectionModuli §1.2 for the admitted deformation problem, its coordinate-change arrows, marking covers and fixed exponent parameters. For the classical subcategory verify the regular-singular determinant with fixed residues has the compatible time lift required by that contract. Identify the genus-zero local slices and their tangent maps in this time problem. The reduced versal problem is the input to §3.3, and §3.4 establishes its dimension. Strong isomonodromy compares analytic data by transport under coordinate changes; the displayed irregular polynomials vary with those coordinates. (HEU10, Theorem 1.1; I23, §§5, 11.)

**API.**

- On each smooth presentation p:T→Θ of the admitted input problem, construct the relative time tangent bundle T_(T/Θ) and the exact sequence 0→T_(T/Θ)→T_T→p*T_Θ→0. For its fixed-exponent fiber Bθ identify T_(T/Θ)|_(Bθ) with T_(Bθ), and compare other admitted base changes through their actual tangent maps. Prove that presentation-change differentials preserve this sequence. A direct-sum decomposition requires a chosen local product presentation and its explicit change-of-splitting law.
- Verify the determinant lift and genus-zero coordinate-change coherence required by the classical restriction.

**Checks.**

- Four ordered logarithmic points have one modulus after quotient by PGL₂: 4 − 3 = 1; its cross-ratio avoids 0, 1 and ∞.
- A change τ = 2t multiplies the displayed horizontal generator by 1/2; retaining its coefficient unchanged gives a different parametrized system.
- Two solutions with different movable pole sets use the same Bθ. A base that deletes one solution's poles fails this requirement.
- Under t′=t+θ and θ′=θ, the relative time tangent line is unchanged but ∂_θ at fixed t becomes ∂_(θ′) at fixed t′ plus ∂_(t′). A complement to the time directions is therefore attached to the chosen product coordinates.

*Needs:* Internal: 3.1, 1.2.

<a id="target-3-3"></a>
### 3.3 The rank-two degree-four subcategory

**Painlevé application.**

**Hypotheses.**

- Genus zero; rank two; structural degree four; regular-singular determinant with fixed compatible residues; reduced versal time problem; nonempty stable fibers.

Define the classical differential Painlevé input class by genus zero, rank two, a structural polar divisor of degree four, the local moduli conditions of §3.1, a regular-singular determinant connection with fixed residues and its compatible transport, the reduced versal formal-data deformation from §3.2, and nonempty stable fibers. On genus zero the determinant residues obey their sum = −degree convention for ∇ = d + A. Take the full reduced versal deformation as the time problem. A restriction along a constant or nonversal curve does not satisfy this condition. Nonemptiness restricts the domain of the moduli problem. The objects are the connection data satisfying these conditions; their reduced-time dimension is a conclusion of §3.4, independent of the phase-dimension calculation, and continuation is a conclusion of §4.6. (VDPS09, §2.2 and Table 1; I23, Theorem 7.5.)

In the pole-budget comparison, r is the projective Katz invariant, computed from trace-free exponential differences and invariant under scalar twists. The regular-singular determinant normalization gives a time problem with no scalar irregular directions. An irregular rank-one twist requires a specified strong time lift and lies outside this classical input class and its one-dimensional deformation count. These local and formal comparisons apply to determinant lines without a global square root.

**API.**

- Restrict the general connection functor to this full subcategory of input data and retain its arrows.
- Extract rank, genus and structural degree invariantly; prove their preservation under the stated equivalences.
- Compare the formal pole budget with Katz invariants: m = r + 1 for integral r, and m = r + 3/2 for a positive half-integral r in rank two.
- State nonemptiness and excluded discriminants explicitly on each parameter base, including exceptional logarithmic exponents.

**Checks.**

- Four logarithmic points have budget 1 + 1 + 1 + 1 = 4 and belong to this complexity class.
- Five logarithmic points have phase dimension 2·5 − 6 = 4, and three have phase dimension 2·3 − 6 = 0; neither is a two-dimensional Painlevé input.
- Two ramified points of Katz slope 1/2 have budget 2 + 2 = 4. Requiring integral slopes would lose this input.
- A logarithmic residue can vanish at a phase point without changing the structural degree. Recomputing the budget from its actual nonzero poles would wrongly remove that point.

*Needs:* Internal: 3.1, 3.2.

<a id="target-3-4"></a>
### 3.4 Classification of formal profiles and time normalizations

**Painlevé application.**

**Hypotheses.**

- An input of 3.3 with its admitted generic projective local types, pole labels and reduced formal-data deformation problem. The classification below determines the profile counts, automorphism stabilizers and reduced-time dimension.

Classify the allowed rank-two formal profiles of structural degree four, retaining the nondegenerate leading-term and reduced-deformation hypotheses. First classify underlying profiles after forgetting the order of the pole labels: enumerate partitions of four and the integral or half-integral generic local slope at each irregular part. This gives ten underlying profiles. Recover the original ordered input through its label-assignment groupoid: a permutation induces a reindexing equivalence between labelled presentations, not a label-preserving arrow in the original groupoid. There are seventeen ordered slope profiles, with counts 2, 8, 6 and 1 for one, two, three and four poles; the corresponding unordered counts are 2, 5, 2 and 1. These are counts of formal profile shapes, not of objects with continuous exponent parameters.

Prove that every labelled realization has one essential time parameter after quotienting the permitted label-preserving curve-coordinate changes. In a presentation with n poles the dimension calculation is n + Σ⌈rᵢ⌉ − 3 = Σmᵢ − 3 = 1, with the automorphism stabilizers and the chosen marking/slices explicitly checked. The determinant normalization and its transport remove no required projective direction and add no scalar irregular direction. Prove that all ten underlying presentations and every label assignment admit this determinant normalization. The table in §7.2 is a table of underlying profiles; its coordinate formulas are transported along the label-reindexing equivalences. (VDPS09, §2.2, Table 1, printed pp.18–19.)

For each specified marking and normalization, construct the corresponding time domain: the four-point cross-ratio base, a nonzero irregular-time chart, or an affine-time chart. Prove that these domains are charts or marking covers of the reduced time problem. The classification concerns the rank-two formal complexity specified in §3.3.

**Checks.**

- The ordered tuples (1,0,0) and (0,1,0) have orders (2,1,1) and (1,2,1). They have the same underlying profile but are not identified by a label-preserving arrow.
- Enumerating ordered compositions of 4, with one local type for a part 1 and two for each larger part, gives 2 + 8 + 6 + 1 = 17. Forgetting order gives 2 + 5 + 2 + 1 = 10.
- A label permutation preserves the pole budget and the time dimension, but transports the residue parameters and cross-ratio chart; it does not leave every displayed coordinate unchanged.

*Needs:* Internal: 3.1, 3.2, 3.3; [Formal scalar and vector-valued Laurent algebra](#dependency-formal-series) (L1–L4; L5–L6 for finite-extension steps in 1.1).

#### Examples

For a single ramified pole with slope 5/2, the structural order is 4 and the three irregular coefficients are reduced by the two-dimensional affine coordinate group to one essential time. For two unramified poles of slope 1, there are two irregular coefficients and one residual scaling, again leaving one time. These calculations concern input types before any scalar Painlevé equation is introduced.

<a id="target-3-5"></a>
### 3.5 Stable moduli for Painlevé equations

**Painlevé application.**

**Hypotheses.**

- The classical input 3.3 and the general stable-moduli construction of MeromorphicConnectionModuli §1.3.

Apply MeromorphicConnectionModuli §1.3 to §3.3. Verify its determinant, stability and local-model admission hypotheses on the classical input; boundedness is supplied by the general construction. Identify its output with the full classical stable moduli problem. The stack, rigidification, coarse family and étale universal-object covers are the imported constructions. Retain all permitted bundle types and the actual residual μ₂ stabilizer before rigidification. Construct the comparison of every classical framed chart with its locally closed or open image, including the balanced locus, and specify each image complement in the full moduli space. (I23, Theorem 5.1.)

**API.**

- Identify the classical moduli functor with the restricted general functor, including arrows and determinant identification.
- Verify every framed chart inclusion, its complement, and the weight-chamber common stable loci.

**Checks.**

- A stable object may have scalar automorphisms before rigidification. The set-valued coarse quotient forgets these arrows; its existence does not imply triviality of the stabilizers.
- A family can leave a trivial-bundle chart by bundle jumping while remaining in the moduli space. Bundle jumping alone does not make the phase path singular.
- In the extension family 0 → O(−1) → E_t → O(1) → 0, E₀ = O(−1) ⊕ O(1) while E_t = O ⊕ O for t ≠ 0. The two splitting strata pull back to {0} and its complement in A¹; the first is not open. The full connection moduli must retain such bundle jumps on the permitted connection locus.
- A ramified generic local factor is irreducible, so the global connection has no ∇-invariant line and is stable for every weight (I23 Remark 2.9). This criterion concerns invariant subbundles and does not classify special solutions.

*Needs:* Internal: 3.3, 1.3.

<a id="target-3-6"></a>
### 3.6 Deformation complexes and trace pairings

**Painlevé application.**

**Hypotheses.**

- The family of §3.5 with its determinant and local structures.

Specialize MeromorphicConnectionModuli §1.4 to the determinant-fixed family of §3.5, and prove that infinitesimal classical families and gauges correspond to its cocycles and coboundaries. Use its full three-term ramified cone and ℂ-linear differential-operator/Čech construction. The commutator differential is generally not O-linear. Any shorter presentation is compared with the full cone by a specified quasi-isomorphism. Verify the determinant restriction and trace-sign convention on the same complex. (I23, equation (6.9), Propositions 6.3 and 7.2.)

**API.**

- Construct the restriction comparison with the general cone, including the determinant-fixed tangent directions.
- Verify gauge, trace-sign and local-presentation compatibility under this comparison.

**Checks.**

- An infinitesimal gauge change by u changes a connection representative by the commutator differential of u; its tangent class is zero.
- Without a determinant identification scalars have an infinitesimal automorphism direction; fixing it in characteristic zero removes that direction, although the finite μ₂ stabilizer remains until rigidification.
- With ω = dq ∧ dp, the ordered tangent pair (∂q, ∂p) has pairing +1 and the reversed pair −1; a reversed trace convention must be corrected before transport formulas are used.

*Needs:* Internal: 3.5, 1.4.

<a id="target-3-7"></a>
### 3.7 Symplectic structures on phase spaces

**Painlevé application.**

**Hypotheses.**

- The classical family and deformation complex of §§3.5–3.6, with their comparisons to the general deformation construction.

Apply MeromorphicConnectionModuli §§1.5–1.6 to the family and complex identified in §§3.5–3.6. Verify the determinant-fiber comparison; the Jacobian has dimension zero in genus zero. Derive smoothness and relative dimension two by substituting g = 0, r = 2 and deg P = 4 in the general theorem, and derive nondegeneracy and relative closedness of the trace form. Use the finite-flat auxiliary unfolding, its simple-connection moduli, both generic logarithmic quasi-isomorphisms and the smooth-density argument from the general symplectic construction. Identify its central stable fiber, complex and form with the classical family, compatibly with admissible nonreduced base change. (I23, Theorems 7.5 and 8.1, Propositions 8.2–8.3.)

**API.**

- Verify the fixed-determinant and central-fiber comparisons needed to specialize the general theorem.
- Export the same relative tangent bundle and symplectic form on the entire classical family.

**Checks.**

- Genus zero, rank two and degree four give −8 + 2 + 8 = 2; structural degree five instead gives 4.
- Fixing the determinant in positive genus removes 2g directions when the determinant-map comparison applies; the genus-zero coincidence cannot be exported unchanged.
- A skew pairing which vanishes identically is closed but is not symplectic; nondegeneracy must follow from the actual duality computation.
- At r = 1 and g = 1 the unfixed-determinant formula gives 2, and fixing the entire line connection gives 0. The rank-zero input that would incorrectly give 2 is outside the domain.
- For r = 2, local order 2 and q₁ = 2, the unfolding equation is (z − 2h²)(z − h²). Its fiber at h = 0 is z² and at h = 1 is (z − 2)(z − 1); modulo h² it is again z². Fixed distinct sections have a different central fiber. Verify the complexes and forms on the central fiber and on the indicated pullbacks of this unfolding.

*Needs:* Internal: 3.3, 3.5, 3.6, 1.5, 1.6.

<a id="target-3-8"></a>
### 3.8 Exceptional strata of the phase space

**Painlevé application.**

**Hypotheses.**

- The full stable moduli of §3.5 with its admitted rank-two local conditions and external exponent parameter space Θ, the analytic and marking comparisons of §1.2, and the smooth analytic parameter charts of §3.7. Nonemptiness of any named locus is a separate assertion.

Construct the following indexed family of subobjects, their inclusions in the full phase family M and their compatible pullbacks. The loci may intersect; the assertions below impose no flatness condition on them.

At each logarithmic marked point a_i and each n∈ℤ, define the resonance hyperplane Res_(i,n)⊂Θ by λ_(i,0)−λ_(i,1)=n, including n=0, and define the corresponding phase locus by pullback along M→Θ. The integer n remains part of the index of each resonance locus; use this ℤ-indexed family of loci and its phase pullbacks. Describe how the parabolic flag records data when residues coincide.

Define the invariant-line incidence moduli 𝓘_red whose objects are stable decorated connections together with a saturated ∇-invariant rank-one subbundle L⊂E; in a family L and E/L are locally free. Construct its forgetful map to the stable stack and the phase family. On a geometric fiber M_b define Red(M_b) as the image of this map, and define the reducible family subfunctor of h_M by requiring every geometric fiber to lie in Red(M_b). The incidence functor includes a chosen relative invariant line, whereas the reducible-family subfunctor records only its fiberwise existence. Prove pullback compatibility for the incidence construction, its forgetful map and this fiberwise reducibility condition.

For each logarithmic marked point a_i, first construct its local monodromy on the analytic universal-object charts of §3.5. Using §1.2, choose a relative analytic coordinate disk Δ_i about a_i, disjoint from the other poles, a basepoint section in Δ_i* = Δ_i \ a_i, a positively oriented generator of the punctured-disk fundamental group, and a local frame of the bundle at that basepoint. On Δ_i* the restricted connection is nonsingular and flat in the curve direction. Apply the nonsingular flat-connection/local-system comparison supplied by ComplexKahlerGeometry K4 in the complex dependency contract on each punctured curve fiber. Construct its local system of horizontal sections and the loop-transport automorphism T_i of the basepoint fiber. The chosen frame represents T_i by a GL₂ matrix. On the admitted smooth analytic parameter charts, use §0.3's joint holomorphic dependence for the local linear ODE and continuation along a finite chain covering the marked loop to prove holomorphic dependence of T_i on the parameters.

Prove compatibility with restriction and refinement of the disk, invariance under homotopy of the marked positive loop, and conjugacy under changes of the frame, basepoint and holomorphic disk coordinate, retaining the connecting paths for basepoint changes. Construct the corresponding comparison arrows with their identity and composition laws. Prove compatibility with universal-object changes and admitted analytic base change under their comparison maps. For a line bundle L on the parameter base, identify the automorphism after twisting by its pullback with T_i⊗id_L. These comparisons are identities of the actual family automorphisms. This construction uses only the punctured neighborhood of a_i and applies when the other marked poles are irregular.

For the convention ∇ = d + A and the graded logarithmic residues λ_(i,0), λ_(i,1), prove charpoly(T_i)(X) = (X − exp(−2πiλ_(i,0)))(X − exp(−2πiλ_(i,1))) from the local logarithmic equation, including integral exponent differences. Retain the actual monodromy automorphism at resonance; its eigenvalues alone do not determine its Jordan structure. The logarithmic lattice and parabolic flag remain part of the connection data. (DEL70, II §5.)

Using this local monodromy before passing to an affine character quotient, define App_i^lin⊂M^an by T_i=I and App_i^proj⊂M^an by [T_i]=1 in PGL₂. Construct these analytic subobjects on universal-object charts and descend the equations under conjugacy and changes of representative; prove compatibility with admitted analytic base change. The first is the ordinary apparent-point convention, while the second records projectively apparent points. Scalarizing by a chosen cyclic vector can create additional apparent poles away from the marked divisor; those are presentation data constructed in §7.2, not these fixed-marked-point loci.

Prove that the full stable moduli retains every point of these subobjects allowed by its local conditions, and record the hypotheses for each nonemptiness claim. An admitted totally ramified generic local model makes Red(M_b) empty by the formal irreducibility theorem. Targets 4.1–4.4 compare the images of the subobjects defined here with their Betti conditions. A vanishing leading irregular coefficient changes the admitted input and belongs to §7.3's coefficient-boundary comparison. (I23, §2 and Remark 2.9; IIS06, §4, especially Theorems 4.10–4.12; VDPS09, §2.2, §3 and §4.2.)

**API.**

- Construct each indexed resonance locus as a pullback, with its inclusion and base-change identity.
- Construct 𝓘_red and its forgetful map, identify its geometric-point image with reducibility, and provide the separate fiberwise reducible subfunctor.
- Construct T_i from punctured-disk horizontal transport, prove its spectral sign convention, and provide its holomorphic dependence, conjugacy comparisons and analytic base-change laws.
- Construct App_i^lin and App_i^proj using the stated local monodromy equations, their inclusion App_i^lin⊂App_i^proj, and their analytic descent and base-change comparisons.
- Keep each locus's local conditions and nonemptiness hypotheses attached to its later image and invariant-curve comparisons.

**Checks.**

- The local connection d+(1/2)I dz/z has monodromy −I: it belongs to App_i^proj but not App_i^lin. Equality of the coarse local character with that of the identity does not imply the defining matrix equation T_i=I.
- For ∇ = d + [[0,1],[0,1/z]]dz, the residue is diag(0,1) and exp(−2πi Res)=I. At basepoint z=1 with the standard frame, transport around a positive loop is [[1,−2πi],[0,1]]. This resonant example distinguishes actual monodromy from the exponential of the residue.
- A logarithmic residue with repeated eigenvalues can have nontrivial unipotent monodromy, so resonance alone does not place a point in either apparent locus.
- The generic totally ramified formal model has no invariant rank-one submodule; its global reducible incidence is empty.

*Needs:* Internal: 0.3, 1.2, 3.1, 3.5, 3.6, 3.7; [Complex manifolds, holomorphic bundles and observations](#dependency-complex) (K1; K3.0; K3.HolomorphicStalk; K3.MeromorphicGermField; K4; K7.1); [Covering spaces and universal covers](#dependency-covers) (Stage 0.2–0.4; Stage 1.5; Stage 2.6–2.8).

#### Examples

At genus zero and rank two, the dimension calculation gives −8 + 2 + 2·4 = 2. An affine phase chart has coordinates (q,p), but points missing from that chart remain genuine initial conditions. On a resonance divisor, distinct parabolic initial points can have the same coarse monodromy character; the phase space must retain them.

<a id="target-3-9"></a>
### 3.9 Isomonodromic connections for Painlevé equations

**Painlevé application.**

**Hypotheses.**

- The constructed classical moduli/time problem; verify that its local structures and determinant transport satisfy the strong-extension contract.

Apply MeromorphicConnectionModuli §2.1 to the time problem of §3.2 and the family of §3.5, with the comparisons of §§3.6–3.7. Identify its strong extensions with the classical universal-object charts, including kernel lattices, logarithmic flags and ramified descent. The total pole class is Ω¹_X(log D) ⊗ O_X(P − D). Prove its comparison with the moving-coordinate generators dz/zᵐ and dε/zᵐ⁻¹, including regularity of the time coefficient at a logarithmic pole. Specialize the existence, uniqueness and gluing theorems for strong extensions, and construct h as their induced tangent splitting in the sense of NonlinearConnections §0.1. (I23, Definition 10.1, Propositions 10.7 and 10.10.)

**API.**

- Compare the classical kernel lattices and moving-pole filtration with the general strong-extension class.
- Identify the resulting splitting with the nonlinear connection of §0.1, and prove its linearity and compatibility with the general base-change maps.

**Checks.**

- A zero time tangent lifts to zero; adding an arbitrary vertical vector would violate uniqueness of the integrable extension.
- Rescaling the time tangent by 2 rescales its lift by 2, while changing the time coordinate to 2t rescales the normalized generator by 1/2.
- The zero map cannot be a splitting over a nonzero time tangent because dπ ∘ 0 = 0 ≠ id.

*Needs:* Internal: 3.2, 3.5, 3.6, 3.7, 2.1, 0.1.

<a id="target-3-10"></a>
### 3.10 Flatness of the isomonodromic connection

**Painlevé application.**

**Hypotheses.**

- The strong splitting identified in 3.9 and the verified restriction of the general two-parameter extension problem.

Use MeromorphicConnectionModuli §2.2 and the identification of §3.9 to obtain h([v,w]) = [h(v),h(w)] on the classical family. Verify that the two-parameter strong-extension comparison restricts to this time problem. This restriction supplies the bracket identity for every admitted formal profile from the algebraic strong-extension construction. (I23, Theorem 11.6.)

**API.**

- Verify the restriction comparison for the mixed extension and export the bracket identity.

*Needs:* Internal: 3.9, 2.2.

<a id="target-3-11"></a>
### 3.11 Symplectic transport and the total two-form

**Painlevé application.**

**Hypotheses.**

- The relative form and splitting of §§3.7 and 3.9, their flatness from §3.10, and their comparison with the moduli symplectic-preservation theorem.

Specialize the symplectic-preservation theorem of MeromorphicConnectionModuli §2.2 to the classical family. With this preservation identity and the flatness of §3.10, apply NonlinearConnections §0.6 to (π,h,ω) and obtain the closed total form Ω(v,w) = ω(v − h(dπv), w − h(dπw)), its kernel and transport laws. Identify its vertical restriction with the relative trace form. Choose sufficiently small local Darboux/time charts, establish the required local exactness, and derive the expression dq ∧ dp + dH ∧ dt. (I23, Definition 11.4 and Corollary 11.8.)

**API.**

- Identify the relative form of §3.7, the total form of §0.6 and the horizontal kernel of the latter.
- Verify Hamiltonian signs and time-dependent coordinate comparisons only after choosing the stated local charts.

**Checks.**

- For H = p²/2, contraction with ∂t + p∂q annihilates dq ∧ dp + p dp ∧ dt; using the opposite sign does not.
- H and H + t² give the same vertical vector field and extended two-form, but different scalar functions.
- On a symplectic fiber, Ω has no nonzero vertical kernel vector; degenerating ω to zero would fail this characterization.

*Needs:* Internal: 3.7, 3.9, 3.10, 2.2, 0.6.

<a id="target-3-12"></a>
### 3.12 Base change and presentation independence of the isomonodromic connection

**Painlevé application.**

**Hypotheses.**

- The verified classical restrictions of the general construction and their actual presentation-change arrows.

Use MeromorphicConnectionModuli §§2.3–2.4 to identify all objects in targets 3.1–3.12 as the classical restriction of one construction, with coherent presentation, gauge and admissible base-change comparisons. Verify the cocycle diagrams for the classical markings and time slices. For changes of labels, determinant or stability chamber, use the permitted morphisms or correspondences on their stated domains. Require the coordinate comparisons of §7.2 to commute with these geometric comparison maps.

**API.**

- Prove the classical specialization square and its triple-overlap coherence.
- Keep all imported structures on one moduli family and one nonlinear connection.

*Needs:* Internal: 3.1, 3.2, 3.5, 3.9, 3.10, 3.11, 2.3, 2.4.

#### Examples

The Hamiltonian chart H = p²/2 − 2q³ − tq represents a horizontal kernel, but the kernel is constructed without this formula. Replacing H by H + c(t) preserves it. A marking change acts on the parameterized family; it does not erase the marking from the input groupoid.

<a id="layer-4"></a>

## Layer 4: Riemann–Hilbert comparison and the Painlevé property

Construct the Betti family and Riemann–Hilbert map for the admitted classical profiles from the logarithmic, unramified irregular and ramified irregular local models. Prove complete Betti transport, all-point horizontal compatibility, properness of the whole time/exponent family and surjectivity onto the independently defined character quotient. The four-logarithmic-point profile is the specialization with four logarithmic models and no irregular models. The local extension theorems and the global compactness and stable-realization arguments apply to all these profiles, including mixtures of local types.

<a id="target-4-1"></a>
### 4.1 Local Riemann–Hilbert reconstruction and descent

**Painlevé application.**

**Hypotheses.**

- The admitted classical rank-two local types, the logarithmic monodromy construction of §3.8, resonant logarithmic lattice data, and the finite ramified covering with deck action. Include the rank-one regular-singular local data of the determinant connection.

Construct the analytic correspondence between the permitted local meromorphic connections and Stokes-filtered local systems on the oriented boundary circle. A logarithmic model has only the zero exponential factor and uses the actual horizontal system and monodromy T_i of §3.8. At a ramified point construct the filtration on the finite cover and its equivariance under the deck permutation of exponential factors. Prove sectorial existence, overlap uniqueness, cocycle identities and coherent descent, with analytic dependence on admitted time/exponent charts. (SAB12, Definition 2.22 and Theorem 5.8; I23, §9; BOA01, §§3–6; BY15, Remark 3 and Definitions 7 and 13.)

Retain the holomorphic lattices, polar conditions, residue lifts, flags and factorized structures of §1.1 as decorations of this meromorphic correspondence. Construct their relative reconstruction and prove full faithfulness on decorated objects. At logarithmic poles include repeated and resonant residues and the integer lattice shifts realizing the prescribed lifts. Prove comparison under changes of representative, coordinate, basepoint, loop marking, frame and sectorial normalization. Glue with the local system on the punctured curve, and apply §1.2 to obtain the algebraic/analytic comparison on every permitted bundle type. (SAB12, Proposition 5.12; I23, Proposition 3.3 and Corollaries 4.3–4.4.)

Prove determinant compatibility using the actual exterior-power lattices, trace residues, Stokes maps and deck action. The determinant has the admitted regular-singular local type. Construct its rank-one reconstruction with the prescribed lattice and residue sums. Deligne II5.4 gives an extension for a chosen section of ℂ→ℂ/ℤ, which is generally not tensor-compatible; include the integer lattice shifts in the determinant comparison. This comparison includes resonance. Retain exp(−2πiλ) as the spectral convention; compare the actual monodromy matrix with exp(−2πi Res) up to conjugacy only under Deligne II5.6's nonresonance hypotheses. Use Deligne II5.9 with its erratum for the regular-singular algebraic/analytic correspondence.

**API.**

- Construct restriction, refinement and changes of sectorial normalization, and prove their composition and descent laws for all three local types.
- Recover the actual decorated analytic connection, with its exponent lifts, lattice and flags, and prove full faithfulness and analytic family dependence.
- Construct the determinant/lattice comparison and rank-one reconstruction with their resonance and tensor conventions, compatible with gluing and admitted base change.
- Prove that integrable time extension is equivalent to strong local constancy of these data at the stated local scope.

**Checks.**

- A rank-one exponential exp(1/z) has irregular growth despite trivial ordinary monodromy; ordinary monodromy alone cannot classify the object.
- A nontrivial unipotent logarithmic monodromy matrix differs from the identity although both eigenvalues equal 1.
- On a quadratic cover, one full turn in z exchanges the two formal exponential branches; a sectorial construction that returns each branch individually without the deck action fails descent.

*Needs:* Internal: 1.1, 1.2, 3.1, 3.2, 3.8, 3.9, 3.10; [Complex manifolds, holomorphic bundles and observations](#dependency-complex) (K1; K3.0; K3.HolomorphicStalk; K3.MeromorphicGermField; K4; K7.1).

<a id="target-4-2"></a>
### 4.2 The Betti family and complete transport

**Painlevé application.**

**Hypotheses.**

- The local analytic data of 4.1 over the admitted marked time problem of 3.2, retained exponent lifts, and fixed closed spectral/determinant constraints; singular affine quotients are permitted.

For every admitted profile, glue §4.1's decorated local data with the local system on the punctured curve. Construct the forgetful functor Forθ to the ordinary representation/Stokes groupoid and its affine quotient map qθ, and set βθ = qθ ∘ Forθ. Forθ forgets the holomorphic lattices, flags and factorized extension choices while retaining the prescribed formal grading, Stokes maps and deck action. The ordinary target retains the local characteristic-polynomial constraints, formal grading and monodromy, Stokes factors, deck relations, global product relation and specified determinant character. These conditions define the entire closed-constraint quotient Rθ independently of RH. Retain the exponent lifts as separate fiber-product coordinates, including the scalar and allowed unipotent strata at resonance. Construct the determinant morphism to the rank-one character family, its version with the compatible regular-singular determinant varying, and restriction along a prescribed determinant-character section. (VDPS09, §§1–3; BY15, Proposition 19, Theorem 21 and Corollary 22.)

In the four-logarithmic-point specialization, let T be an admitted chart of four ordered points on ℙ¹, T̃ its marking cover and Rep₂(C,D) the unfixed-determinant GL₂ conjugacy quotient. Let A₂^(4) consist of four monic quadratic local characteristic polynomials with nonzero constant terms whose product is 1. Write Λ₂^(4)(d) for the two ordered residue lifts at each pole satisfying d+Σᵢⱼλⱼ^(i)=0, and rh:Λ₂^(4)(d)→A₂^(4) for the characteristic polynomials with eigenvalues exp(−2πiλⱼ^(i)). The construction gives, after analytification, R_log^un = (Rep₂(C,D)×_T T̃)×_(A₂^(4))Λ₂^(4)(d), with its determinant morphism and fixed-determinant restrictions. Retain the full λ-coordinate and compare with I13's character-family construction in §2. Variation of λ is an external parameter direction; time transport fixes λ.

Prove that these analytified character families and exponent pullbacks are Hausdorff and locally compact, including singular points. Construct product descriptions over simply connected admissible time charts and compare them under changes of marking and Stokes-sector presentation. Prove independence, composition, inverse and homotopy laws, then concatenate along compact paths to obtain complete transport. For the ramified types extend BOA14 §10, Theorem 10.2's untwisted isotopy construction by retaining the exponential covering, formal grading and deck action of BY15, constructing deck-compatible groupoid equivalences and descending the framing action and closed constraints. The construction acts on singular coarse fibers and on the required decoration spaces.

**API.**

- Construct restriction, gluing, gauge-conjugation and change-of-marking functors, retaining their natural isomorphisms.
- Construct Forθ, qθ and βθ, prove the quotient universal property and identify the locus where quotient points represent individual orbits.
- Construct the determinant morphisms and restrictions, including the four-point GL₂ specialization R_log^un with its full exponent coordinate.
- Prove local products and complete transport, and their compatibility with Forθ, qθ, βθ, determinant restrictions and changes of marking.

**Checks.**

- θ and θ + 1 give the same exponential eigenvalue but need not give the same logarithmic lattice; the comparison target retains θ.
- A reducible representation and its semisimplification can have the same coarse character. Distinct flags over scalar local monodromy can also give distinct decorated objects with the same ordinary character. These are two separate losses of information, through quotient formation and through Forθ.
- Transport around a nontrivial loop may act nontrivially on the fiber; completeness does not imply trivial monodromy.

**Supporting constructions owned by this target.**

- Construct the finite-type framed representation/Stokes varieties and their affine quotients using §1.3, and apply §1.2 analytification and the exponent pullbacks. Use reductive invariant theory at the reductive framing-group stages and explicit descent at the other quotient stages, retaining the local unipotent Stokes groups. Prove root/deck isotopy, ramified descent, stabilizer compatibility, holomorphicity and Hausdorff/local-compactness on every admitted stratum. Express the constructed quotient universal properties using SSF1.17.

*Needs:* Internal: 1.2, 1.3, 3.2, 4.1; [Quotient predicates](#dependency-quotient-predicates) (1.17); [Covering spaces and universal covers](#dependency-covers) (Stage 0.2–0.4; Stage 1.5; Stage 2.6–2.8); [Smooth bundle and connection foundations](#dependency-smooth) (B1.5; B5.0; B5.2); [Marked-curve charts](#dependency-curves) (ComplexCurveModuli D0.3, D3–D5; SchemeAndStackFoundations 4.15).

<a id="target-4-3"></a>
### 4.3 Riemann–Hilbert and compatibility on the whole phase space

**Painlevé application.**

**Hypotheses.**

- The full stable moduli family of 3.5 with the loci of 3.8, the splitting and flatness of 3.9–3.10, the comparisons of 3.12, and the reconstruction and Betti family of 4.1–4.2. Allow compatible regular-singular determinant lines to vary over their rank-one moduli base, within the same genus-zero, rank-two, structural-degree-four data and weight chambers.

Construct RHθ: Mθᵃⁿ → Rθ by composing §4.1's forward decorated analytic correspondence with βθ on §1.3's universal-object covers, and prove holomorphic descent, presentation independence and admitted analytic base-change compatibility. Use this construction also in determinant-relative form: the base retains the compatible regular-singular line connection, and a prescribed section gives the fixed-determinant family. Construct the relative coarse family on universal-line covers and prove its descent using §1.3.

Construct the marked rank-one de Rham and Betti families D_dR and D_B over the same time/exponent base, with the trace residues, degree and logarithmic lattice retained. Prove that their RH₁ is an analytic isomorphism by §1.5 and §4.1's rank-one reconstruction, including family and marking compatibility. Use the determinant/lattice comparison of §4.1 to prove det_B ∘ RH = RH₁ ∘ det_dR. This determinant/RH square is commutative.

Prove a coarse determinant-restriction lemma on these admitted families. In this lemma M^un, R^un and M_L^det denote marked analytic coarse spaces; the superscript un means that no determinant identification is chosen. Let (L,∇L) be a compatible line connection over their common time/exponent base. Put δ_L=RH₁(L,∇L) and R_det(L)=det_B⁻¹(δ_L). Construct an isomorphism M_L^det ≅ M^un ×_(R^un) R_det(L), with the determinant identification retained in the actual-family source of M_L^det. Prove it by mutually inverse coarse morphisms on §1.3's presentations and their universal properties, accounting for Gm inertia, μ₂ inertia and base-line twists with square trivialization. A Cartesian square of actual-family stacks alone is insufficient: prove descent of these inverse morphisms and their admitted analytic base-change laws. Carry out the comparison over universal-line covers of D_dR as well, and descend it to identify the determinant-relative coarse family with the corresponding pullback of M^un. Prove compatibility with the certified determinant transport. The Cartesian assertion concerns this restriction square.

For four logarithmic points, §1.3 gives M_log^un over T×Λ₂^(4)(d); write M̃_log^un=(M_log^un)ᵃⁿ×_T T̃. Match the ordered residues, degree, generic weights and actual-family equivalence with I13 Definition 4.3: Q_PVI(S) consists of families modulo isomorphism after a base-line twist with its canonical relative connection and transported flags. Construct Q_PVI ≅ M_I13|_(g=0,r=2,n=4) on locally Noetherian test schemes and the induced fppf, analytic-sheafification and coarse comparisons through §1.3. Identify the resulting RH_log^un: M̃_log^un → R_log^un with I13's map, retaining the full λ-coordinate and all marking and base-change laws. Its determinant line has degree d and trace residue Σⱼλⱼ^(i) at each pole.

For every profile define Vθ^nr by irreducibility of the ordinary generalized monodromy object and λᵢ,₁−λᵢ,₂ ∉ ℤ at each logarithmic pole. Irreducibility excludes a common rank-one subobject compatible with global monodromy, formal grading, Stokes maps and deck action. Let Uθ^nr be the complement of §3.8's reducible locus with the same exponent condition. Prove that Uθ^nr and Vθ^nr are open. Prove local uniqueness of the logarithmic lattice and labelled flag from the nonresonant lifts, of the unramified lattice and filtration from the labelled formal summands, and of the ramified lattice and factorized-structure class from the prescribed w²=z model with deck descent. Retain the distinct leading eigenvalues and a₁₀ ≠ 0 hypotheses. Prove holomorphic dependence and gluing to a stable connection of the prescribed degree and determinant; establish Uθ^nr=RHθ⁻¹(Vθ^nr) and a two-sided inverse jθ^nr. This includes the four-logarithmic-point profile. On a logarithmically resonant parameter fiber Vθ^nr is empty.

For four logarithmic points, prove the stronger inverse theorem with Vθ the union of the smooth loci of Rθ,b and Uθ=RHθ⁻¹(Vθ), including smooth points on resonant exponent fibers. Compare the fixed-determinant functors and markings with IIS06 Definition 4.9 and Theorem 4.10, and prove that this inverse extends jθ^nr. For the other profiles set (Uθ,Vθ,jθ)=(Uθ^nr,Vθ^nr,jθ^nr). Prove both inverse identities and their marking and base-change laws; retain every fiber and decoration outside Uθ. The irregular reconstruction uses IS12 Theorem 5.1 in its generic unramified scope and the relative ramified comparisons of I23 Proposition 3.3, Corollaries 4.3–4.4 and §§9/11.

Apply §0.3 to the holomorphic flat splittings of §2.4 and §§3.9–3.10 to obtain local horizontal sections through every initial point. Use §2.2's strong total representatives on these sections and prove that their local systems and Stokes data give §4.2's transport. Descend to all source points, including resonance, reducible and apparent loci, and to the determinant-relative and four-logarithmic auxiliary families. This all-point comparison is independent of RH invertibility; §4.5 records local existence.

**API.**

- Construct the RH maps through Forθ and qθ, with holomorphic descent, presentation independence and admitted base-change laws.
- Prove the rank-one RH isomorphism, commutative determinant/RH square and coarse determinant-restriction lemma, including descent when the compatible determinant varies.
- Construct the four-logarithmic Q_PVI/I13 comparison and identify the specialized RH map with its full time/exponent and actual-family data.
- Construct jθ^nr for every profile and the stronger PVI inverse on smooth character fibers, with both inverse identities and their compatibility laws.
- Prove all-point horizontal compatibility for the full source and determinant-relative families.

**Checks.**

- Distinct points of an exceptional RH fiber can have the same ordinary character; no two-sided inverse exists on that fiber.
- The source retains scalar and unipotent logarithmic strata. The PVI smooth-character inverse includes smooth resonant points even when Vθ^nr is empty.
- Retaining exponent lifts distinguishes θ from θ+1 even when their exponential eigenvalues agree.
- For a fixed stable object E₀, E₀⊠O and E₀⊠O(1) over ℙ¹ have the same unfixed-determinant Q_PVI class but need not be isomorphic as actual families. A fixed-determinant base-line twist requires a square trivialization.

*Needs:* Internal: 0.3, 1.1, 1.2, 1.3, 1.5, 2.2, 2.3, 2.4, 3.3, 3.5, 3.8, 3.9, 3.10, 3.12, 4.1, 4.2.

<a id="target-4-4"></a>
### 4.4 Properness and stable realization for classical families

**Painlevé application.**

**Hypotheses.**

- The RH maps and determinant-relative comparisons of 4.3, the admitted data and nonempty stable fibers of 3.3–3.5, and the chosen weight chambers with semistable=stable. Retain all allowed exponent parameters, local strata and bundle types.

Prove properness of RHθ for the whole time/exponent family and its preservation under admitted analytic base changes. Prove the determinant-relative version with the compatible regular-singular line connection varying over its rank-one base, using the coarse comparisons of §4.3. The argument uses the following local extension and global reconstruction theorems for all admitted profiles.

For each compact subset K of the full character family, prove uniform bounds that include its time and exponent projections. On the local presentation charts construct reference lattices E⁰ and an integer N with zᴺE⁰ ⊆ E ⊆ z⁻ᴺE⁰ for the required representatives, and parameterize the finite lattice quotients and decorations. Obtain the bounds from the following three local theorems together with the quotient-compatible global reconstruction below. The noncollision and nonvanishing conditions remain those of the admitted parameter base.

For logarithmic models, prove bounded reconstruction with the prescribed residue lifts, including repeated and resonant values, scalar and unipotent monodromy, and the required integral lattice shifts. Extend the flags in relative projective parameter spaces with the closed residue-incidence equations. For unramified irregular models, prove bounded reconstruction from the labelled formal summands and Stokes data, and extension of their lattices, filtrations and sectorial comparisons while the leading eigenvalues remain distinct. For ramified models, prove these statements on w²=z with deck action; construct projective parameter spaces for the finite lattice and flag quotients and prove that the admitted factorized-structure classes extend with a₁₀ ≠ 0 and descend. In each case prove compatibility with gluing, analytic base change and §4.1's determinant comparison. Use these local theorems at every occurrence of the corresponding model in a profile.

Use §1.3's bounded Quot presentations and these local bounds to construct the global compact parameter sets covering RHθ⁻¹(K). Control degeneration in the ordinary affine quotient by parameterizing representations, their irreducible constituents and extension data, including nonsemisimple representatives of reducible coarse characters. Prove bounded reconstruction after changes of framing and local presentation, and compatibility with the coarse quotient; a choice of semisimple representative alone does not parameterize the source.

Construct the required semistable replacement after base change and elementary modifications. Prove that the resulting limit is an actual connection with the Leibniz identity and identity connection symbol, has the prescribed degree, determinant, polar and formal data, and represents the limiting coarse character. Extend the retained decorations using the local theorems. Prove semistability of the replacement, use the chosen weights to obtain stability, and use separatedness for uniqueness of the coarse extensions that agree on the generic base, retaining the actual-family scalar and line-twist comparisons. Verify that the extension maps from the compact parameter sets are continuous in the analytic moduli topology, agree under presentation changes and cover every source point over K. This proves compactness of RHθ⁻¹(K), then properness using the Hausdorff/local-compactness comparisons. The argument controls the whole time/exponent family, including bundle jumps and logarithmically resonant fibers, independently of the inverse loci of §4.3. (I13, §6, Lemma 6.1 and Propositions 6.1–6.2, for the logarithmic stable-replacement and compactness arguments.)

Define Rθᵃᵈᵐ := Rθ, the entire ordinary quotient of §4.2 with its closed spectral, formal, Stokes, deck, global-product and determinant constraints and retained exponent lifts. Separately prove that for every allowed exponent parameter, b ∈ Bθ and r ∈ Rθ,b there is m ∈ Mθ,bᵃⁿ with RHθ(m)=r, on every component of this independently defined target. Construct local realizations, glue on bundles of the prescribed degree and determinant, and prove existence of a stable decorated representative. For a reducible coarse character allow nonsemisimple representatives with that same character. Prove that the choices and replacements preserve the prescribed coarse character and fixed local constraints. Include all admitted scalar, unipotent, resonant and generic ramified strata.

Specialize these results to four logarithmic models. Through §4.3's determinant-relative coarse comparison and rank-one isomorphism, derive properness and surjectivity of RH_log^un on the entire time/exponent fiber product R_log^un, with admitted analytic base change. Verify g=0, r=2, n=4, 2·4−2·2−2=2>0, d+Σᵢⱼλⱼ^(i)=0 and the generic weights in the comparison with I13 Theorem 2.2. For every allowed (t,λ), prove irreducibility of the auxiliary source and target fibers and density of the PVI smooth-character inverse locus in both from the four-point moduli and character-space presentations (I13, Proposition 5.3 and the proof of Theorem 2.2 in §6). Combine these geometric conclusions with §4.3's stronger inverse theorem to deduce fiberwise bimeromorphicity and analytic resolution, including resonant exponent fibers, and the corresponding total-family conclusions.

IS12 Theorem 5.1 has generic unramified scope, with the restriction in Remark 6.3; prove the remaining local extension and total-family compactness assertions above. I23's global foliation supplies the time distribution under its moduli hypotheses. HEU10 Theorem 1.1 concerns universal strong isomonodromic deformation: compare its time bases, decorations, determinant and stability, bundle jumps, descent and splitting with §3.9 before using it for classical continuation.

Together with §4.2's complete target transport and §4.3's all-point compatibility, return the proper-semiconjugacy certificate for §4.6 and NonlinearConnections §0.4. Local horizontal existence is the independent application of §0.3 in §4.5.

**API.**

- Prove the logarithmic, unramified and ramified lattice bounds and extension theorems, uniformly over compact sets in the full time/exponent target.
- Construct quotient-compatible global bounded reconstruction and connection-preserving stable replacement, and prove analytic compactness of every RH inverse image of a compact set.
- Prove determinant-relative family properness, its admitted base-change and restriction laws, and the proper-semiconjugacy certificate.
- Prove surjectivity onto every component of the independently defined full ordinary target by stable realization.
- Derive the auxiliary four-logarithmic properness, surjectivity and fiberwise and total-family bimeromorphicity through the determinant-relative comparison and the PVI smooth-character inverse theorem.

**Checks.**

- Vθ^nr can be empty on a resonant exponent fiber; compactness and stable realization still concern that entire fiber.
- A compactification by connection operators can have a degenerate-symbol boundary. The limiting object here must satisfy the Leibniz rule with identity symbol.
- Deleting an exceptional source fiber can destroy properness even when RH is generically an isomorphism. The full stable source is used.
- The PVI numerical inequality is 2·4−2·2−2=2>0; retain the degree/residue equation, generic weights and full exponent fiber product.
- The determinant/RH square is commutative; only the coarse restriction square proved in §4.3 is Cartesian. Dimension zero of a genus-zero rank-one fiber does not establish that comparison.

*Needs:* Internal: 1.1, 1.2, 1.3, 1.5, 2.3, 2.4, 3.3, 3.5, 3.6, 3.7, 3.8, 4.1, 4.2, 4.3; [Quot/Hilbert and parameter schemes](#dependency-quot) (4.14); [Native topological properness](#dependency-proper) (IsProperMap).

#### Examples

An exceptional RH fiber can be a projective curve. A chosen point on it is still an initial condition and has its own horizontal lift; taking an arbitrary inverse of the coarse RH map would discard this information. A trivial-bundle chart may fail the strong Riemann–Hilbert problem at an isolated time even though the full bundle-valued connection continues.

<a id="target-4-5"></a>
### 4.5 Local holomorphic horizontal sections

**Painlevé application.**

**Hypotheses.**

- The holomorphic flat splitting of §§3.9–3.10 and its admitted parameter charts.

A geometric Painlevé germ is a horizontal-section germ of the holomorphic flat splitting of §§3.9–3.10, with specified initial point, in the sense of NonlinearConnections §0.3. Verify the joint-holomorphic hypotheses on the admitted classical parameter charts and apply §0.3 to obtain the evaluation bijection, local existence and uniqueness, and holomorphic parameter dependence.

**API.**

- Verify the joint-holomorphic family hypotheses and identify geometric Painlevé germs with the imported section germs.
- Use the general evaluation bijection and naturality on the actual classical fibers.

**Checks.**

- On π: B × F → B with the product splitting, a horizontal section is b ↦ (b,x₀), not an arbitrary map B → F.
- A section must satisfy dπ ∘ ds = id; a constant map into the total space is not a section over a nonconstant time neighborhood.
- For the holomorphic vector field q′ = q² with q(0) = 1, the local solution is 1/(1 − t); local existence does not imply continuation in the affine phase chart through t = 1.

*Needs:* Internal: 3.9, 3.10, 0.3.

<a id="target-4-6"></a>
### 4.6 Classical completeness by proper semiconjugacy

**Painlevé application.**

**Hypotheses.**

- The classical RH comparison of §4.3, complete target transport of §4.2, compatibility with partial horizontal lifts at every source point, and properness from §4.4.

Apply NonlinearConnections §0.4 to the phase family, using its continuous-time local ODE and compact-extension theorem from §0.2. Verify the complete target transport of §4.2, the actual partial-lift compatibility of §4.3 at every permitted point, and the relative proper map of §4.4. Obtain a unique horizontal lift for every admitted θ, initial time b₀, point x₀ ∈ Mθ,b₀ and compact piecewise C¹ path in Bθ beginning at b₀. The target may be singular, and exceptional fibers are retained with their initial points. The proper map in the compact-containment argument is RHθ; the phase projection π may be nonproper. Specialize the compact-containment theorem of §0.4 after these hypothesis checks to obtain the geometric Painlevé property. The base Bθ is fixed by the input data and is independent of the poles of scalar observations.

**API.**

- Check the hypotheses of the general proper-transfer theorem, including exceptional fibers.
- Export the full initial-point and compact-path quantifiers independently of every scalar chart.

**Checks.**

- For y′ = y², y(0) = 1, the projection of M = ℂ_t × ℂ_y to the complete target time line is compatible but not proper. Along t ∈ [0,1), y = 1/(1 − t), with values 2 and 4 at t = 1/2 and 3/4, and no finite value at 1. This excludes replacing properness of F by mere continuity or projection compatibility.
- For identity F on the trivial family and constant fiber transport, the proper transfer returns the unique constant fiber coordinate. For a proper fiber with an exceptional curve, the compact-containment argument uses its compact preimage and never selects an inverse of F.
- The base path γ(s) = |s − 1/2|³ᐟ² on [0,1] is C¹, while γ′ is not C¹ at 1/2. Its constant-splitting lift is a valid input to the continuous-time local theorem, which requires continuity of the path velocity and not its C¹ regularity.

*Needs:* Internal: 4.2, 4.3, 4.4, 4.5, 0.4.

<a id="target-4-7"></a>
### 4.7 Classical transport, universal-cover sections and descent

**Painlevé application.**

**Hypotheses.**

- The complete flat classical connection and its symplectic-preservation identity.

Apply NonlinearConnections §0.5 to the flatness of §3.10 and completeness of §4.6. Its construction produces the actual endpoint transport, fundamental-groupoid action and universal-cover horizontal section through every classical initial point. Identify its endpoint maps with horizontal lifting for the connection of §3.9. Use §3.11 and NonlinearConnections §0.6 for symplectic preservation. Descend precisely for initial points fixed by the resulting deck/monodromy action; completeness alone does not imply single-valuedness on Bθ.

**API.**

- Identify the imported transport and universal-cover sections on the classical moduli family.
- Verify presentation compatibility and the actual stabilizer condition for descent.

**Checks.**

- A path followed by its reversal gives the identity on every initial condition, including exceptional points.
- On B = ℂ× with H = qp/(2t), the equations are q′ = q/(2t), p′ = −p/(2t). A positive generator of π₁(B) sends (q,p) to (−q,−p), and two such loops give the identity. The symplectic multiplier is (−1)(−1) = 1, and the first loop acts nontrivially away from the origin.
- In that model only the origin is fixed by the generator. Every other initial point gives a complete section on the universal cover that does not descend to B; completeness alone is insufficient for descent.

*Needs:* Internal: 3.10, 3.11, 4.6, 0.5, 0.6.

<a id="target-4-8"></a>
### 4.8 Observations on Painlevé phase spaces

**Painlevé application.**

**Hypotheses.**

- The classical phase family, a candidate observation Q with its declared domain, and the class of horizontal sections on which evaluation is claimed. For each such section, supply one of the admissibility certificates below; a non-identically-infinite certificate is additionally required for scalar meromorphic evaluation.

For a candidate observation with the supplied admissibility data, apply the observable construction of NonlinearConnections §0.7. The admissibility certificate is an actual holomorphic ℙ¹-valued map on a neighborhood of the section image; or compatible local numerator–denominator presentations whose restrictions are not both identically zero; or a specified resolution, holomorphic observation and holomorphic lift, with independence proved on the claimed domain or the lift retained as marking. From these data construct the admissible evaluation, using one-variable cancellation or the specified lift as appropriate, and prove the required overlap comparisons. Retain the observer, its domain, solution strata and normalization as part of the specified evaluation data. A certificate excluding an identically infinite evaluation is separate from admissibility as an ℙ¹-valued observation.

Each concrete observation target supplies its candidate and proves these input conditions on every solution stratum for which it claims evaluation. For the classical profiles, §7.2 constructs the standard q candidates, their domains and overlaps, and the certificates for cancellation or lifting, choice independence, non-infinity and coverage. These certificates are the inputs to the evaluation construction above.

**API.**

- From a candidate observation and its supplied admissibility certificates, construct the marked observation and evaluation of §0.7 on exactly the declared sections and domains.
- Compare normalizations, local ratios and resolved lifts through the general observable naturality law, retaining any marking required for independence.
- Export the separate non-infinity hypothesis consumed by §4.9.

**Checks.**

- Q ≡ ∞ is an everywhere defined ℙ¹-valued observer, but it does not produce an ordinary meromorphic function with isolated poles.
- The rational map [x:y] on ℂ² is undefined on the constant curve (0,0); rationality alone does not define a pullback along every solution.
- In the infinity chart, Q(t) = 1/t becomes 1/Q(t) = t, holomorphic at 0. Its pole is a chart event, not a failure of geometric continuation.

*Needs:* Internal: 4.5, 4.7, 0.7.

<a id="target-4-9"></a>
### 4.9 Meromorphic evaluation on the classical time curve

**Painlevé application.**

**Hypotheses.**

- The proved time-curve dimension, the complete horizontal section and an observer with the verified pullback and non-infinity conditions.

Verify the one-dimensional time conclusion of §3.4 and apply NonlinearConnections §0.7 to §§4.7–4.8. Every claimed non-identically-infinite scalar evaluation is meromorphic on the universal cover of the admitted time curve, with finite-order poles at its interior scalar singularities. The observer, its resolution or cancellation and choice-independence certificates on every claimed stratum, and the non-infinity certificate are supplied by the corresponding concrete observation target as inputs to §4.8; §7.2 supplies them for the standard classical q. Under these conditions, apply the same meromorphic evaluation theorem to each observation. Single-valued descent is governed by the scalar observation-invariance criterion of §0.7.

**API.**

- Export the meromorphic evaluation theorem only on the verified classical observer domains.

*Needs:* Internal: 3.4, 4.7, 4.8, 0.7.

#### Examples

The affine equation q′ = q² has a movable pole at t = 1 for q(0) = 1. Its projective vector field extends in u = 1/q as u′ = −1. This separates affine-coordinate escape from geometric continuation. On B = ℂ*, a horizontal system can have complete continuation on the universal cover and nontrivial monodromy around 0; this does not contradict the theorem.

<a id="layer-5"></a>

## Layer 5: Initial-condition surfaces, symmetries and Riccati reductions

<a id="target-5-1"></a>
### 5.1 Additive Okamoto–Painlevé pairs

**Painlevé application.**

**Hypotheses.**

- Smooth rational projective surface; effective anticanonical Y; Y·Y_i=0; SNC support; additive Picard identity component; nonfibered type.

Define the comparison groupoid of smooth projective rational surfaces S with a nonzero effective anticanonical divisor Y, satisfying Y·Yᵢ = 0 for every irreducible component, with D = Y_red a simple normal-crossing divisor. Require additive type, expressed by the additive identity component of Pic⁰(Y), and nonfibered type: no elliptic fibration has a fiber nY with n ≥ 1. Retain markings when a root basis or normalized time is used. Construct the relative versions of these conditions. (STT02, Definitions 1.1 and 1.3, Proposition 1.2 and Tables 2–3.)

Write Y = Σᵢ mᵢDᵢ. Fix the intersection pairing x·y on Pic(S), and use ⟨x,y⟩ = −x·y for root lengths. Define the boundary lattice R_∂ = Σᵢ ℤ[Dᵢ], its integral orthogonal complement R_∂^⊥ = {x ∈ Pic(S) : x·[Dᵢ] = 0 for every i}, and δ = [Y] = −K_S. Prove δ ∈ R_∂ ∩ R_∂^⊥ and δ·δ = 0. Retain these as sublattices of Pic(S), with δ present; no quotient by ℤδ is taken. Construct their marked relative versions and intersection-preserving transport. The symmetry roots, their integral span inside R_∂^⊥, and their parameter hyperplanes are the outputs of §5.5.

**API.**

- Construct R_∂, R_∂^⊥ and δ inside Pic(S), their pairings with the declared sign, and the weighted boundary intersection graph.
- Prove invariance under pair isomorphisms and compatibility with admissible families.
- Compare the complement S \ D with its logarithmic tangent and two-form sheaves.
- Supply the inclusion R_∂^⊥ → Pic(S) and its marked-family comparisons to §5.5; the construction of a symmetry-root basis belongs to that target.

**Checks.**

- A smooth elliptic anticanonical boundary has elliptic Picard identity component, not additive, and is excluded.
- A multiplicative cycle has multiplicative Picard identity component and is excluded.
- Requiring a global affine-plane chart would exclude the D₈ case; that additional requirement is absent.
- A boundary component of self-intersection −2 has squared root length 2, whereas δ has square zero and remains a nonzero Picard class. R_∂^⊥ is defined by all boundary components, not only by orthogonality to K_S.

**Supporting constructions owned by this target.**

- For the possibly nonreduced anticanonical Y, prove the proper-flat/projective family, universal-functions, H²-vanishing and identity-component hypotheses and apply the relative Picard construction of §1.5. Compute the identity component with normalization, units and successive nilpotent-thickening exact sequences, and prove the additive-group comparison defining additive type. Construct Θ(−log D) as derivations preserving the reduced-boundary ideal, with D=Yred SNC; multiplicities belong to Y, not to the SNC predicate. Prove the relative Picard lattice/intersection and deformation comparisons on the actual surface family. SSF5.9 supplies intersection pairings for surfaces over fields or arithmetic surfaces; construct the family comparison over the admitted arbitrary bases using these pairings and the relative Picard construction.

*Needs:* Internal: 1.5; [Cohomology with supports](#dependency-supports) (2.7); [Divisors, modifications and surface intersections](#dependency-surfaces) (3.4; 4.11; 4.17; 5.9–5.10); [Algebraic vector bundles and finite locally free sheaves](#dependency-bundles) (L0A–L0C; L1A–L1B; L2A–L2B).

<a id="target-5-2"></a>
### 5.2 Compactification and the eight boundary types

**Painlevé application.**

**Hypotheses.**

- The full classical phase family with the intrinsic form and splitting from targets 3.1–3.12, the pair framework of §5.1, and the stated markings and admissible base changes.

Construct a relative compactification S → B of the degree-four connection moduli family with the pair structure of §5.1, after the stated marking/base changes. With D = Y_red and U = S \ D, construct an isomorphism from the full phase family to U over B. Compare the symplectic form ω and the horizontal splitting h under this isomorphism on every chart of U, including exceptional curves and nontrivial bundle charts. Extend ω to a rational relative two-form ω̃ on S, represented by a section of Ω²_{S/B}(Y), and prove div(ω̃|S_b) = −Y_b on each fiber and agreement with ω on U. The regular horizontal splitting and its chart-extension theorem have domain U, and the latter covers all of U. On S the extension asserted here is the rational two-form with pole divisor Y. Classify the additive normal-crossing boundary types as D₄, D₅, D₆, D₇, D₈, E₆, E₇ and E₈. These are affine boundary diagrams. (STT02, Proposition 1.2 and Tables 2–3; VDPS09, introduction and Table 1; IIS06, §10 for the fully established PVI comparison.)

Construct the comparison for every admitted profile by proving the overlap identifications, coverage and extension to every chart of U, including the complements of the initial coordinate charts. IIS06 §10 supplies the PVI comparison; the global comparison in the introduction of VDPS09 has conjectural status. The completeness theorem of §4.6 uses the properness statement of §4.4 in addition to the horizontal distribution.

**API.**

- Construct the relative compactification and its boundary divisor with its multiplicities and intersection pairing.
- Prove the full open-complement comparison, including bundle-jumping and exceptional charts.
- Compare the deformation, relative symplectic form and regular horizontal splitting on U under that isomorphism, and prove the marking/base-change laws.
- Construct the rational relative two-form on S with the stated fiberwise pole divisor Y and prove its restriction equals the form on U.

**Checks.**

- Two presentations of boundary type D₆ can have different formal pole data; the common boundary label alone is not a moduli isomorphism.
- The D₈ complement is included, with no affine-plane-chart hypothesis.
- An omitted exceptional curve invalidates the full-complement assertion even if the open rational chart and its scalar formula are correct.
- The boundary pole orders of ω̃ are the multiplicities in Y, not those in D. A nonzero compactified Kodaira–Spencer time class can vanish after restriction to U; a regular time lift on all of S would instead force that compactified class to vanish.

*Needs:* Internal: 3.3, 3.4, 3.5, 3.6, 3.7, 3.8, 3.9, 3.10, 3.11, 3.12, 5.1; [Cohomology with supports](#dependency-supports) (2.7); [Divisors, modifications and surface intersections](#dependency-surfaces) (3.4; 4.11; 4.17; 5.9–5.10); [Quot/Hilbert and parameter schemes](#dependency-quot) (4.14).

<a id="target-5-3"></a>
### 5.3 The boundary deformation space and time direction

**Painlevé application.**

**Hypotheses.**

- The admitted nonfibered additive pair families of §§5.1–5.2 and the intrinsic time splitting of targets 3.9–3.12.

Let F = Θ_S(−log D) and N_D = O_S(D)/O_S. Construct L = H⁰(D,F ⊗ N_D), prove that it is one-dimensional for these pairs, and construct its injection into local cohomology. Establish the family/base-change theorem for L and compare its Kodaira–Spencer image with the time direction of §3.9. Prove the connecting-map/intersection-matrix identity intrinsically from the boundary intersection pairing, uniformly for the admitted boundary graphs. (TER02, Theorem 2.1 and Proposition 2.1; STT02, Theorem 3.1.)

The first boundary-layer construction supplies a line and its injection into the full supported-cohomology space. TER02 Conjecture 2.1 concerns equality with that space; the results of ST04 Appendix A apply under their stated additional hypotheses. A generator of the line depends on a choice of time normalization. Prove equality of the lifted distributions by the deformation comparison and uniqueness on the prescribed algebraic complement.

**API.**

- Construct the first boundary-layer line, its injection into supported cohomology and its restriction maps.
- Prove the intersection-matrix formula and the dimension calculation without choosing a scalar Painlevé chart.
- Establish locally free base change and the comparison of its Kodaira–Spencer image with the time tangent line.

**Checks.**

- Rescaling a chosen nonzero time vector rescales its image in L, while L itself is unchanged.
- The injection L → H¹_D(S,F) alone does not prove that its target is one-dimensional.
- Over A = ℂ[ε]/(ε²), the module A/(ε) has a one-dimensional fiber at the unique point but is not a free rank-one A-module: its ℂ-length is 1 instead of 2. Constant fiber dimension alone therefore does not establish the claimed locally free base change; the actual cohomological hypotheses must be proved.

**Supporting constructions owned by this target.**

- Use SchemeAndStackFoundations 2.6 and 2.7 for quasi-coherent and supported cohomology, the localization exact sequence, and the Noetherian colimit-of-Ext comparison. Use JacobianChallenge Layer C for coherent proper pushforwards and its separately stated base-change criteria. For the family of logarithmic surfaces, construct F and N_D as sheaves, the first boundary-layer injection and its connecting-map/intersection-matrix comparison. Prove the properness, coefficient flatness and cohomology/base-change hypotheses that make the relative H0(D,F tensor N_D) invertible, and prove arbitrary base-change compatibility through the finite-projective complex or the precise surjectivity criterion, including over nonreduced bases. Compare this line with the Kodaira–Spencer time line through its injection into supported H1_D.

*Needs:* Internal: 3.9, 3.10, 3.11, 3.12, 5.1, 5.2; [Cohomology with supports](#dependency-supports) (2.7); [Divisors, modifications and surface intersections](#dependency-surfaces) (3.4; 4.11; 4.17; 5.9–5.10); [Cohomology, duality and curve degree](#dependency-cohomology) (2.2; 2.6; 2.20; 3.3); [Elementary deformation theory](#dependency-deformation) (4.2–4.6); [Proper coherent direct images and base change](#dependency-proper-cohomology) (Layer C).

#### Examples

The boundary type E₈ is associated with one ramified rank-two presentation, while E₇ has two. Thus a boundary label and a connection presentation are different kinds of data. The first boundary-layer line has dimension 1 and maps injectively into the supported cohomology group as specified in §5.3.

<a id="target-5-4"></a>
### 5.4 Functors on decorated connections

**Painlevé application.**

**Hypotheses.**

- An admitted decorated connection, together with an invariant local quotient for a modification or the specified line connection, duality or relabeling data.

Construct elementary modifications along an invariant local flag, tensor product with an admitted rank-one connection, duality and relabeling as functors between the actual decorated moduli problems. Specify the new determinant, exponent and stability data and the locus on which the transformed object is stable. Use the kernel construction for a modification, its induced connection, and the inverse modification; retain the comparison arrows. Extend these functors to strong integrable families by preservation of the allowed pole filtration and kernel lattices. (IIS06, Definition 3.5 and §7; I23, §§2–4 and Definition 10.1.)

For each operation g, construct its parameter-and-time map φ_g and the saturated stable domains 𝔘_g and 𝔘′_g on which the operation and its inverse have the required decorated types. Construct F_g: 𝔘_g → 𝔘′_g over φ_g, its inverse functor and the two natural inverse comparisons. For the coarse maps p_g: 𝔘_g → U_g and p′_g: 𝔘′_g → U′_g, construct the induced map F̄_g: U_g → U′_g and prove p′_g ∘ F_g ≃ F̄_g ∘ p_g by the coarse universal property, compatibly with pullback. For an asserted birational correspondence of the ambient coarse spaces, specify dense open subsets V_g and V′_g and prove that the restricted maps are mutual inverses. The horizontal and symplectic laws belong to §5.5; §7.4 compares the resulting coarse map with formulas in the charts of §7.2.

**API.**

- Construct the transformed bundle and connection before passing to coarse moduli, with their determinant and local-type formulas.
- Prove pullback, composition and inverse comparisons on their specified domains.
- Specify the transformed weights and prove the stability comparison, using a wall-crossing correspondence on the loci where it is required.
- Construct F̄_g and the commuting coarse-moduli diagram over φ_g; for each birational claim exhibit the dense inverse opens and their inverse laws. Supply this geometric map and its domain to the coordinate comparison in §7.4.

**Checks.**

- Modifying along a one-dimensional quotient at a logarithmic pole changes the bundle degree by −1; leaving the determinant unchanged fails the determinant comparison.
- Tensoring rank two by a line connection L changes the determinant by L², including its connection; it does not construct a square root of a previously fixed odd-degree determinant.
- The inverse modification recovers the original decorated object with its arrow on the common admissible locus, while forgetting the distinguished flag need not permit the inverse.
- The image of an object under F_g and under the induced coarse map must agree after applying p′_g. A coordinate formula alone does not discharge this descent diagram or the two inverse comparisons.

*Needs:* Internal: 3.1, 3.5, 3.9, 1.1; [Algebraic vector bundles and finite locally free sheaves](#dependency-bundles) (L0A–L0C; L1A–L1B; L2A–L2B).

<a id="target-5-5"></a>
### 5.5 Horizontal and symplectic transformation laws

**Painlevé application.**

**Hypotheses.**

- The connection functors and descended maps of §5.4, the deformation pairing and intrinsic splitting of targets 3.5–3.12, the lattices of §5.1, and the marked-surface comparison of §5.2.

For F̄_g over φ_g, prove dF̄_g ∘ h = h′ ∘ dφ_g on the relative time tangent bundles by applying the uniqueness of strong extensions to the transformed family. Compute F̄_g⁎ω′ by the induced map of deformation complexes and trace pairing, and prove F̄_g⁎ω′ = ω for each symplectic generator on its stated domain. Construct the resulting action groupoid on the parameterized moduli family, and establish relations by natural isomorphisms of the functors. On a marked surface compare its action on Pic(S) with the corresponding integral root reflections and diagram automorphisms. For each profile, construct the symmetry simple-root classes in the integral lattice R_∂^⊥ of §5.1, their span R_sym, their Cartan pairings and the associated parameter hyperplanes; identify explicitly when R_sym equals R_∂^⊥. Use the pairing ⟨x,y⟩ = −x·y and prove integrality of the reflection x ↦ x − 2⟨x,α⟩α/⟨α,α⟩ for each root α used. Retain δ in the lattice action, and specify an empty root system for a profile with no reflection roots. (IIS06, Theorem 7.4 and Theorem 10.13 for PVI; STT02, Tables 2–3 and the marked deformation construction.)

Construct the symmetry action from the functors of §5.4 together with additional reflections on the moduli of marked pairs. Identify the induced birational correspondences of connection moduli through §5.2, and prove their horizontal and symplectic extension on the stated domains. These marked-pair reflections include the central PVI reflection, which is not generated by the local gauge modifications of §5.4. IIS06 Remark 7.5(2) describes a Fourier-transform realization; a realization by Fourier–Laplace transformation or middle convolution requires a functor on the decorated moduli problems and its strong-extension comparison. Use the marked-surface construction for the additional reflections here. The cited theorems of IIS06 concern PVI; establish the other profile-specific assertions through their marked-pair comparisons. Prove the reflection and Coxeter relations, effective-locus conditions and extension across chart complements, and supply these results to the coordinate comparisons in §7.4. For every global automorphism, prove regular extension over its full stated domain in addition to the identity of rational maps on a dense open set.

**API.**

- Construct the profile-specific symmetry root data in R_∂^⊥, the marked-pair reflection correspondences and their comparison with the descended connection-functor generators on their common domains.
- Prove the horizontal identity over φ_g, the relative two-form identity, relations and compatibility with parameter changes; deduce that the induced maps send horizontal solutions to horizontal solutions.
- Record the regular domain and the extension theorem for each claimed global map.

**Checks.**

- The PVI central reflection sends κ₀ to −κ₀ and κⱼ to κⱼ + κ₀ for j = 1,2,3,4. It preserves 2κ₀ + Σκⱼ = 1: at κ₀ = 1/2, κⱼ = 0 the transformed tuple has κ₀ = −1/2 and κⱼ = 1/2, giving −1 + 2 = 1. Omitting the κ₀ sign change gives 3 instead. Local integer shifts and sign changes alone do not construct this reflection.
- A reflection squared must give the original marked family with its comparison arrow, not merely the same boundary diagram.
- A birational formula with a pole on an invariant curve is not an automorphism of that curve until a regular extension is proved.

*Needs:* Internal: 3.6, 3.7, 3.12, 5.1, 5.2, 5.3, 5.4; [Cohomology with supports](#dependency-supports) (2.7); [Divisors, modifications and surface intersections](#dependency-surfaces) (3.4; 4.11; 4.17; 5.9–5.10).

<a id="target-5-6"></a>
### 5.6 Invariant rational curves and Riccati dynamics

**Painlevé application.**

**Hypotheses.**

- An interior smooth rational curve of self-intersection −2 in an admitted nonfibered additive pair, its stated semiuniversal pair deformation, and the time-direction comparison of §5.3.

For the admitted nonfibered additive pair, construct the local family of an interior smooth rational curve C with C² = −2. Fix the external parameters at α₀ and, for the curve C in the fiber over (α₀,t₀), construct its family locally along the time base {α₀}×U, with U an analytic or étale neighborhood of t₀; an extension in external-parameter directions is defined on a nodal-curve locus whose existence and comparison with the semiuniversal pair deformation must be proved. Prove invariance under the time distribution using the logarithmic deformation sequence. Retain the étale or finite base change needed to continue that family; descent to the original base requires its own monodromy check. On the resulting relative ℙ¹-bundle, identify the restricted connection as a projective linear connection, using H⁰(ℙ¹,Tℙ¹) ≅ sl₂. The coordinate lemma then has q′ = a(t)q² + b(t)q + c(t). Construct local linear rank-two lifts, and construct a global lift when its lifting obstruction vanishes. (ST04, §2.4, Proposition 2.1, Remark 2.4 and Definition 2.3.) The PVI comparison with the Gauss equation is IIS06 Theorem 5.15. Its Theorem 5.16 assumes analytic Painlevé property; the geometric construction here follows from the logarithmic deformation sequence and time-direction comparison.

Classify these interior nodal configurations by the boundary intersection lattice under ST04 Theorem 3.1's hypotheses. Deduce its nonexistence statement for the E₈, D₇ and D₈ boundary types. Linearization gives the relevant classical special-function families after the coordinate comparisons; the parameter restrictions and normalizations remain part of those lemmas.

**API.**

- Construct restriction of h to the invariant curve family and prove that its projection to time remains a splitting.
- Compare two projective coordinates by the induced Möbius gauge law, and compare local rank-two linearizations.
- Prove preservation under the admitted geometric transformations when they extend as regular isomorphisms along the whole curve family; otherwise construct the closure and prove the required curve and invariance properties separately.
- Compare the nodal-curve condition with reducible connections or exceptional RH fibers only in the presentations where that identification is proved.

**Checks.**

- A holomorphic vertical vector field on ℙ¹ has a polynomial coefficient of degree at most two in an affine coordinate; a cubic coefficient fails regularity at infinity.
- A ramified generic local factor forces global irreducibility, but an E₇ ramified presentation can still have an invariant Riccati curve. Thus “Riccati if and only if globally reducible connection” is not a presentation-independent theorem.
- A family of curves can be permuted by continuation around the time base; a local invariant curve does not automatically give a globally labeled subfamily.
- A rational solution need not lie on a Riccati curve; ST04 §6.2 supplies this distinction. The classification above concerns interior nodal curves and their invariant Riccati dynamics.

*Needs:* Internal: 3.9, 3.10, 3.11, 3.12, 5.1, 5.2, 5.3, 5.4, 5.5; [Cohomology with supports](#dependency-supports) (2.7); [Divisors, modifications and surface intersections](#dependency-surfaces) (3.4; 4.11; 4.17; 5.9–5.10); [Quot/Hilbert and parameter schemes](#dependency-quot) (4.14); [Complex manifolds, holomorphic bundles and observations](#dependency-complex) (K1; K3.0; K3.HolomorphicStalk; K3.MeromorphicGermField; K4; K7.1).

#### Examples

In the PII chart of §7.5 the curve p = 0 is invariant at α = −1/2. Its Riccati equation is the coordinate expression of a projective connection on that curve. The rational seed q = 0 at α = 0 lies at a different parameter value and is treated by the seed and transformation constructions of §7.5.

<a id="layer-6"></a>

## Layer 6: Determinant lines and tau sections

<a id="analytic-theory"></a>

Construct the holomorphic determinant line and canonical section for general index-zero Fredholm families in §6.1, then apply this construction to the marked Painlevé RHP families in §§6.2–6.5. For these families construct the operator realization, prove its index and holomorphic dependence, and establish the line/frame comparisons and the stated JMU/Hamiltonian identities. For a trace-class realization with its determinant comparison, use the generic trace-class determinant of RandomMatrices §8.3.

Bibliographic information and source locators are listed in the [references](#references). The construction models are MAL04 and BERT17. The JMU comparison uses BERT10 with the corrections in BERT16 at the precise loci stated below. Real orientation lines, Toeplitz index results and trace-class determinants retain their distinct scopes.

<a id="target-6-1"></a>
### 6.1 Holomorphic determinant lines for index-zero Fredholm families

**General theory.**

**Hypotheses.**

- A finite-dimensional complex manifold S and a holomorphic family of bounded complex Fredholm operators of index zero, initially between fixed complex Hilbert spaces.
- Finite-dimensional determinant and exact-sequence conventions, bounded local splittings and holomorphic Banach-space inversion; the line, stabilizations, canonical section and comparison cocycles are outputs.

For a holomorphic family T_s: H₀ → H₁ of bounded complex Fredholm operators of index zero on a finite-dimensional complex manifold S, with H₀,H₁ fixed complex Hilbert spaces, construct a holomorphic line L_T and its canonical determinant section τ_T. Use the complex specialization of the native Fredholm, determinant-line and finite-dimensional stabilization objects to construct its holomorphic atlas and coherent gluing. Adopt the convention L_T,s = det(ker T_s)* ⊗ det(coker T_s), dual to the real orientation-line convention. Include families in which the dimensions of kernel and cokernel jump. (MAL04, §2, printed pp. 1372–1374, gives the determinant-extension model; BERT17, §1, gives an RHP application within its stated symbol class.)

Locally choose a finite-dimensional complex space F and a: F → H₁ such that (T_s,a): H₀ ⊕ F → H₁ is surjective. Prove that K = ker(T,a) is a holomorphic vector bundle of rank dim F, using a local bounded splitting and holomorphic inversion. Set L_F = det K* ⊗ det F and τ_F = det(K → F), where K → F is the projection. Construct comparison maps under adding stabilizing summands and then through common refinements; prove their cocycle and section-compatibility laws before gluing. Fix the exact-sequence sign convention by requiring that a finite-dimensional family has its ordinary determinant in the standard determinant frame. Prove independence of all stabilization choices, holomorphic base change and naturality under isomorphisms of operator families. Use these same comparison laws to extend from fixed Hilbert spaces to holomorphic Hilbert bundles with specified local trivializations.

Identify τ_T(s) ≠ 0 exactly with invertibility of T_s. Include identically singular families, for which τ_T vanishes identically. An effective determinant divisor requires τ_T to be nonzero as a section on each connected component. Construct the line's transition cocycle from the stabilization comparisons; closedness of a proposed curvature two-form alone does not supply this cocycle. Applications use the pullback line and section and prove their RHP realizations and logarithmic-derivative formulas. The base category consists of finite-dimensional complex manifolds and holomorphic maps. Nonreduced analytic bases lie outside this construction: their operator families must retain nilpotent coefficients as sheaf-valued data, which pointwise operators do not determine.

**API.**

- Construct the stabilization kernel bundles, determinant lines and canonical sections with the declared dual convention and finite-dimensional sign calibration.
- Prove refinement compatibility, the cocycle law, stabilization independence and holomorphic base change.
- Prove naturality under operator-family isomorphisms and glue the Hilbert-bundle version through its specified trivializations.
- Identify the section’s nonvanishing locus with the invertible-operator locus without assuming generic nonvanishing or a divisor.

**Checks.**

- For T_s: ℂ → ℂ, z ↦ sz, the standard frames give τ(s) = s, fixing the dual convention.
- For T_s(z) = s²z, verify that the zero has order two while dim ker T₀ = 1. Thus vanishing order and kernel dimension can differ.
- An everywhere invertible constant family has a nonvanishing determinant section. For an identically singular index-zero family, construct its holomorphic determinant line and verify that its canonical section is identically zero.
- Two finite-dimensional stabilizations must give the same section after comparison through a common refinement, and a third stabilization must not change that comparison.

- On the dual-number base, T=ε and T=0 have the same pointwise operator but determinant sections ε and 0. The distinction requires nilpotent operator coefficients on this nonreduced base, which lies outside the manifold-base category.

**Supporting constructions owned by this target.**

- Consume Mathlib's complex ContinuousLinearMap.IsFredholm and nonempty_fredholmPackage, Tau Ceti's IsFredholm.exists_stabilization_kernel_coordinates, kernelHomeomorph and contDiffAt_kerSection, and the pointwise detLine/detLineCongr API. The latter has fibre det ker(T) tensor det coker(T)*; use its dual for L_T. These scalar-generic suppliers apply over C. This target constructs the holomorphic determinant bundle, its canonical section, stabilization comparisons and holomorphic base-change laws. For the holomorphic transition maps use native analytic inversion in the bounded-operator Banach algebra and the actual finite-dimensional stabilization charts.

*Needs:* [Native complex Fredholm and determinant carriers](#dependency-fredholm) (IsFredholm; nonempty_fredholmPackage; exists_stabilization_kernel_coordinates; kernelHomeomorph; contDiffAt_kerSection; detLine; detLineCongr); [Native analytic inversion](#dependency-inversion) (analyticAt_inverse; analyticAt_inverse_one_sub); [Complex manifolds, holomorphic bundles and observations](#dependency-complex) (K1; K3.0; K3.HolomorphicStalk; K3.MeromorphicGermField; K4; K7.1).

<a id="target-6-2"></a>
### 6.2 Determinant lines for Painlevé families

**Painlevé application.**

**Hypotheses.**

- The holomorphic complex index-zero determinant construction of §6.1 and its operator-family isomorphism and base-change laws.

Specify the determinant construction for a marked Painlevé operator family using AnalyticRHPAndDeterminants §6.1's holomorphic complex index-zero determinant line, canonical section, finite-dimensional stabilizations and coherent comparison maps. Set L_T = det(ker T)* ⊗ det(coker T) on the same native complex operator carriers. The required input consists of a holomorphic index-zero operator family and the comparison maps satisfying §6.1's identity, composition and section-compatibility laws. Section 6.3 constructs these families and comparisons from the marked connection data. The line and section in this application are the pullbacks of §6.1's objects with this dual convention.

**API.**

- Specify the dual convention and the pullback identifications with §6.1's line and section.
- Specify the holomorphic index-zero, comparison-cocycle and descent conditions for the families constructed in §6.3.

**Checks.**

- For T_s: ℂ → ℂ, z ↦ sz, the standard frames give τ(s) = s, fixing the dual convention.
- For T_s(z) = s²z, verify that the zero has order two while dim ker T₀ = 1. Thus vanishing order and kernel dimension can differ.
- An everywhere invertible constant family has a nonvanishing determinant section. For an identically singular index-zero family, construct its holomorphic determinant line and verify that its canonical section is identically zero.

*Needs:* Internal: 6.1.

<a id="target-6-3"></a>
### 6.3 An index-zero RHP realization and descent

**Painlevé application.**

**Hypotheses.**

- The decorated connection families of §§3.1, 3.5, 3.6 and 3.9, the local analytic reconstruction and comparison of §§4.1–4.3, the time bases of §1.2, and the determinant interface of §6.2. Include the selected auxiliary reference/modification, contours, lattices, branches and normalization. Construct the Fredholm realization and index-zero proof in this target. The descent comparisons are operator, chain or stable equivalences whose added auxiliary complexes are everywhere acyclic.

Construct an analytic RHP chart from the specified decorated connection family and the analytic comparison of §§4.1–4.3. Retain the reference bundle or modification, contours, local lattices, branches, framings and normalization in its marking data. Construct the associated Fredholm operator and prove its index zero and holomorphic dependence. For the closed-contour model use a holomorphic invertible jump symbol in a fixed contour neighborhood and zero determinant winding. Compare the solvable normalized RHP with the corresponding marked connection and pull back §6.2's line and section. For every ramified and resonant stratum retained by §§3.1–3.3, construct an analytic sectorial model and its adapter, and prove the operator, solvability and determinant comparisons. The cited closed-contour constructions supply the initial operator model; this target constructs its sectorial, ramified and resonant comparisons. (BERT17, §1 and Theorem 2.2; MAL04, §2.)

On ℙ¹, rank E = 2 and deg E = d give χ(E(−1)) = d and χ(E(k)) = d + 2k + 2. For odd d, every common integral line twist has nonzero Euler characteristic; in particular, E(−1) has index −1 for a degree-minus-one phase object. Construct a normalized index-zero complex or modification and its comparison with the original connection. When applying Malgrange's degree-zero sewn-bundle construction, include this comparison in the RHP realization.

Keep the reference bundle and auxiliary modification in the input marking. For operator, chain or stable equivalences with everywhere acyclic added auxiliary complexes, construct unit transition factors for the line and section. A general change of reference bundle or modification defines a different normalized problem and can change the zero divisor. Construct its relative determinant factor or meromorphic transformation together with the divisor of that factor. Apply BERT17's factorization comparisons to the admitted factorization equivalences.

**API.**

- Construct RHP marking charts and the operator-family functor from their connection data.
- Prove comparison isomorphisms for changes of contour, factorization or normalization which give the same Fredholm family or a proved holomorphic chain/stable equivalence, with their identity and composition laws.
- Construct an equivariant line and section on the marked moduli groupoid/stack. Descend to a coarse space only after proving trivial stabilizer action on the line and section.
- Construct the analytic adapters for every admitted ramified and resonant stratum, specifying their domains and proving the operator, index-zero, holomorphic-dependence and solvability comparisons.

**Checks.**

- For a valid degree-minus-one phase connection, compute the index of E(−1) as −1 and compare it with the normalized index-zero RHP complex.
- Scalar automorphisms act by the Euler-characteristic weight, which is zero here. Check the action of each other stabilizer in the marked groupoid for the coarse-descent comparison.
- Two elementary jump factorizations can give different scalar Fredholm determinants. Compute their nonzero transition factor and verify the corresponding line-section comparison.

**Supporting constructions owned by this target.**

- For the initial closed-contour model construct the actual Hardy/Toeplitz comparison and apply T1–T3 to its continuous invertible matrix symbol. Verify zero determinant winding and holomorphic dependence. Prove normalized solvability equivalent to invertibility through the reconstruction map. Zero Fredholm index alone is insufficient for matrix symbols. Sectorial, resonant and ramified models require the separate comparisons specified in this target.

*Needs:* Internal: 3.1, 3.5, 3.6, 3.9, 4.1, 4.2, 4.3, 6.2, 1.2; [Cohomology, duality and curve degree](#dependency-cohomology) (2.2; 2.6; 2.20; 3.3); [Elementary deformation theory](#dependency-deformation) (4.2–4.6); [Stacks, inertia and restricted coarse-space criteria](#dependency-stacks) (1.18–1.23); [Trace-class ideal carrier](#dependency-trace-ideal) (OI-B01–OI-B19; OI-B23; OI-B29–OI-B30); [Matrix-symbol Toeplitz index](#dependency-toeplitz) (T1–T3); [Generic trace-class determinant](#dependency-trace-determinant) (8.3, generic operator-theory prefix).

<a id="target-6-4"></a>
### 6.4 The tau divisor and variational formulas

**Painlevé application.**

**Hypotheses.**

- The determinant section of §6.3, the condition that it is not identically zero on each connected smooth chart where its divisor is constructed, and the generic JMU and vertex-correction hypotheses specified below.

Prove that the determinant section vanishes precisely where its normalized RHP is not solvable. On a reduced connected smooth chart where it is not identically zero, construct its effective Cartier divisor; obtain a global divisor only through the line comparisons. This divisor records failure of the selected RHP normalization and can contain regular intrinsic phase points through which a horizontal solution continues in another chart. On each 6.1 stabilization chart, choose holomorphic frames for the equal-rank bundles K_stab and F and let S(s) represent the projection K_stab→F. The canonical section has representative det S. Prove d log(det S)=Tr(S⁻¹dS) on its nonvanishing locus and the actual logarithmic correction for a change of determinant frame. This gives the determinant-frame form and scalar normalization on every constructed RHP chart, including the ramified and resonant adapters. Equivalently, K_fin=I−S on the finite-dimensional space F gives the displayed trace-class identity. For an infinite-dimensional integrable-kernel realization, construct a trace-norm holomorphic family K and the comparison τ=u det(I−K), with u nowhere zero. On the trace-class locus where I−K is invertible, prove d log τ=d log u−Tr((I−K)⁻¹dK) and the frame-change law. The JMU/Hamiltonian comparison has the generic domain specified below. (BERT17, Theorem 2.2, Proposition 2.3, formula (3.6), Theorem 3.3 and §3.1.2.)

Compare with the JMU form only under the stated formal-normalization hypotheses: the generic unramified diagonalizable-leading-term and logarithmic nonresonance locus of BERT10 Assumption 3.1 and §5.1, Proposition 5.1. Use BERT16 Definition 2.1 for the corrected sign, Theorem 2.1 for vertex curvature, and Theorem 2.2, which replaces BERT10 Theorem 5.1. The corrected local formula uses ω_M − θ_V, with dθ_V = η_V on the monodromy parameters. Along fixed-monodromy time directions θ_V has no component. Match the factorization and frame corrections in this restriction. On the full monodromy-and-time space retain the curvature terms of the Malgrange form and its modifications. Compare a contour graph with a contour without vertices by a sewing map that accounts for the vertex terms.

**API.**

- Construct the section's divisor and its naturality under the comparisons of §6.3.
- Prove the local variational identity and its change under a nonvanishing frame multiplier.
- Construct the comparison with the selected JMU normalization on the generic unramified, diagonalizable-leading-term and logarithmically nonresonant locus stated above. On each ramified or resonant stratum use §6.3's RHP adapter to construct the determinant section and its finite-dimensional stabilization differential; the JMU comparison is restricted to the stated generic locus. For the infinite-dimensional trace formula prove the trace-class realization and determinant-frame comparison.

**Checks.**

- A zero of the chosen tau representative can occur while the intrinsic horizontal solution continues through that time in another bundle chart.
- For the family T_s = s², verify a double zero of the determinant section and a one-dimensional kernel at s = 0.
- For a graph with nontrivial vertex limits, compute the BERT16 vertex correction and include its transformation in any sewing comparison with disjoint closed contours.
- The local connection d + [[0,z⁻²],[z⁻¹,0]]dz has projective slope 1/2: after z = w² and the gauge diag(1,w), its leading coefficient is 2(E₁₂ + E₂₁)/w². It is outside the JMU comparison locus here. Its index-zero RHP adapter carries the determinant section and its finite-dimensional stabilization logarithmic derivative on the ramified chart.

- On an infinite-dimensional complex Hilbert space, T_s=e^s I is a holomorphic invertible Fredholm family, but T_s⁻¹dT_s=I ds has no trace-class trace. Its determinant-line section has local finite-dimensional stabilization representatives, while the infinite-dimensional trace expression is undefined.

*Needs:* Internal: 4.1, 6.2, 6.3, 1.2; [Generic trace-class determinant](#dependency-trace-determinant) (8.3, generic operator-theory prefix).

<a id="target-6-5"></a>
### 6.5 Hamiltonians, frames and scalar normalization

**Painlevé application.**

**Hypotheses.**

- JMU/Hamiltonian comparison only on the generic unramified nonresonant locus; broader scalar normalization uses the finite-dimensional stabilization logarithmic form of the constructed canonical RHP determinant section τ_T, a fixed nonvanishing frame e, a regular base point t₀ with τ_T(t₀) ≠ 0, and a chosen scalar value c ∈ ℂ× on the time leaf. An infinite-dimensional trace expression additionally requires the verified trace-class realization and frame comparison.

On the JMU comparison locus of §6.4, choose a time coordinate and symplectic chart for the dynamics of §3.11. Derive the relation between the selected determinant-frame logarithmic derivative and the local Hamiltonian, proving its coefficient and its gauge, factorization and time-only correction terms from §6.4. Specify the Hamiltonian convention and the local primitive, including its ambiguity by a function of time. The Hamiltonian/JMU identity has precisely this generic domain; scalar normalization on the broader RHP-chart domain uses the stabilization logarithmic form below. (MAL04, Theorem 5.12 in its logarithmic Schlesinger scope; BERT10, §5.1, Proposition 5.1, with BERT16.)

For every marked RHP chart of §6.3, including its ramified and resonant charts, write the fixed canonical section as τ_T = f e in the chosen determinant frame. In the stabilization frame of §6.4, f = det S and d log f = Tr(S⁻¹dS) on the nonvanishing locus. For e′ = a e the coefficient is f′ = a⁻¹f, so d log f′ = d log f − d log a. An infinite-dimensional realization f = u det(I−K), with its determinant-frame comparison, gives d log f = d log u − Tr((I−K)⁻¹dK) on the trace-class locus where I−K is invertible. (BERT17, Proposition 2.3 and formula (3.6).)

The coefficient f and its value f(t₀) are fixed by τ_T and e. Define the separately normalized scalar function f_norm = c f/f(t₀), and prove f_norm(t₀) = c, d log f_norm = d log f, and f_norm e = (c/f(t₀))τ_T. Thus choosing a base-point value gives a specified constant multiple of the canonical section, while retaining the original section and frame for comparison. Equivalently the chosen fiber value is c e(t₀); under a frame change transform c as the coefficient of that same fiber value. This normalization applies to the marked RHP charts of §6.3, using the stabilization logarithmic form on the nonvanishing locus.

The differential-equation normalization is along a fixed-monodromy horizontal time leaf, away from the chosen divisor. A prescribed closed scalar logarithmic one-form and a nonzero base-point value determine a unique solution on a connected simply connected domain. Prove its equality with f_norm wherever that one-form equals d log f, and compute the holonomy obstruction to descent when such local solutions are continued around a loop. On a full monodromy-and-time domain, the same scalar normalization theorem requires closedness after the frame corrections. Simple connectedness alone does not remove curvature of a line connection.

**API.**

- On the specified JMU comparison locus, compare the symplectic/time convention of §3.11 with the variational identity and record all correction terms. On the broader RHP-adapter locus use the finite-dimensional stabilization identity with its prescribed determinant frame; use an infinite-dimensional trace formula only after its additional trace-class comparison has been proved.
- Prove the transformation laws under a time change, a time-dependent symplectic chart change and a determinant-frame change.
- Construct f_norm = c f/f(t₀), its proportionality comparison with τ_T in the fixed frame, and its base-point and logarithmic-derivative laws. Prove uniqueness for the corresponding scalar differential equation on a connected simply connected regular domain, and identify the holonomy obstruction to descent.

**Checks.**

- If an identity uses d log τ = H dt, replacing H by H + c(t) requires multiplying τ by exp(∫c(t)dt), with the integration constant fixed.
- Under the time change u = φ(t), the same logarithmic one-form has coefficient (dt/du)H; an unchanged scalar coefficient would fail the comparison.
- Two representatives differing by a nonzero constant define the same logarithmic derivative but are different normalized scalar functions until the base-point values agree.
- For T_s(z) = sz in the standard determinant frame, f(s) = s. With s₀ = 1 and c = 2, f_norm(s) = 2s; it is the coefficient of twice the canonical section, while the original canonical coefficient remains s.

*Needs:* Internal: 3.11, 3.12, 6.3, 6.4; [Complex manifolds, holomorphic bundles and observations](#dependency-complex) (K1; K3.0; K3.HolomorphicStalk; K3.MeromorphicGermField; K4; K7.1).

#### Examples

Compute the determinant sections, divisor multiplicities and invertibility loci for the one-dimensional operator families s, s² and 1. Compare a valid degree-minus-one phase connection with its auxiliary index-zero RHP complex. For a contour/factorization change, compute the line-section comparison and the transition factor between scalar representatives.

<a id="layer-7"></a>

## Layer 7: Classical forms of Painlevé equations

<a id="target-7-1"></a>
### 7.1 First-jet coordinates and scalar Painlevé equations

**Painlevé application.**

**Hypotheses.**

- A classical time curve, a phase surface with its nonlinear connection, a local observer and a jet-isomorphism domain. The generic jet theorem assumes neither a symplectic form nor the Painlevé property.

Use NonlinearConnections §0.8, formulated for an observer bundle and its first-jet bundle. For the classical time curve and phase surface, supply a local observer and prove that the induced jet map is an isomorphism on the stated domain. Apply the general equivalence between horizontal germs and scalar second-order germs on that domain. In a time/phase chart, write h(∂t) = ∂t + A∂q + B∂p and J(t,q,p) = (t,q,A); if p = P(t,q,v) is its inverse on the stated domain, the coordinate comparison is q″ = (A_t + A A_q + B A_p)(t,q,P(t,q,q′)). The chain-rule theorem and intrinsic jet construction belong to the general framework. A_p ≠ 0 gives a local inverse only. Individual classical chart constructions belong to §7.2; meromorphic continuation additionally uses §4.9 and is not a hypothesis of the jet theorem.

**API.**

- Verify each chart/observer jet-isomorphism domain and record its complement.
- Derive the scalar formula as the coordinate expression of the imported jet construction.

**Checks.**

- If A = p, the inverse is p = q′ and the scalar equation is q″ = B(t,q,q′).
- If A is independent of p, J forgets the momentum and cannot be a jet chart; scalar uniqueness then cannot be inferred from geometric uniqueness by this argument.
- For A = p² there are two momentum branches away from p = 0; local invertibility does not identify the two branches globally.
- If a scalar formula divides by q, compare a solution crossing q = 0 through overlapping phase charts. Distinguish its continuation from extra solutions of the denominator-cleared equation outside the original rational domain.

*Needs:* Internal: 3.4, 3.7, 3.9, 0.8.

<a id="target-7-2"></a>
### 7.2 Exhaustive presentation and equation comparisons

**Painlevé application.**

**Hypotheses.**

- The profile classification of §3.4, the intrinsic moduli, splitting and symplectic form of §§3.5–3.12, and the observer and continuation theorems of §§4.8–4.9. Construct in this target the local source-comparison lemmas, concrete charts and standard observers, parameter/time substitutions, jet inverses, observer-admissibility certificates and coverage/overlap comparisons for those profiles.

Prove the following sign comparison for the source Hamiltonian system. In VDPS09 §4.1 the displayed equations p′ = F H_q, q′ = −F H_p, with F depending only on q, have kernel form dp ∧ dq/F + dH ∧ dt. The printed minus sign in that extended form is inconsistent with those equations, including the PI instance (44), (46), (47). On F ≠ 0, set Q = q, P = p/F(q), K(Q,P,t) = −H(F(Q)P,Q,t), using the source's argument order H(p,q,t); then dQ ∧ dP + dK ∧ dt is the negative of the correct source form and gives the convention of §3.11. Prove this identity directly and use it to compare each source Hamiltonian with §3.11.

VDPS09's printed PV equation (3) also disagrees with its system (2) and Hamiltonian (5). Differentiating q′ = 2p/t gives the exponent term [θ₀²(q − 1)² − θ₁²q²]/[2q(q − 1)t²], in place of the printed θ₀²/(2qt²) + θ₁²/[2(q − 1)t²]. At t = 1, q = 2, p = 0, θ₀ = 0, θ₁ = 1, θ∞ = 1, the compatible system gives q″ = 2 while the printed scalar equation gives 7/2. Use the expression derived from the compatible system in the PV dictionary below. Prove these two local algebraic lemmas in this target and use them in the presentation comparisons and in §7.4.

For every profile in §3.4 construct a concrete time/Darboux or equivalent symplectic chart from the connection moduli, with its inverse on its actual image. Identify h in this chart by the strong integrable extension of §3.9, apply §7.1, and prove the parameter and time-substitution dictionary to the standard equation below, including the required marking covers. The required comparison records the chosen local frames, the determinant convention, the chart domain, the momentum inverse, every denominator, and the omitted loci. Prove that these charts cover the full moduli space, with their overlap identifications. Derive the scalar expression from the compatible system using the source-comparison lemmas above. (VDPS09, §2.2, Table 1 and §4; IIS06, Theorems 10.6, 10.10 and 10.13; DLMF, §32.2(i), equations 32.2.1–32.2.6.)

For each listed profile, construct its standard q as a candidate observer with the chosen cyclic vector or local frame, its actual rational domain and its overlap comparisons. A cyclic-vector apparent point is part of this presentation data, distinct from the marked-pole monodromy loci of §3.8. For each solution stratum in the scalar comparison, prove the cancellation or resolved-lift comparison, independence of the representative/lift, and the non-identically-infinite condition required by §4.8. Record precisely which strata are covered, which require another observer chart, and which retain phase data without a scalar value. Prove these certificates in this target and use them as the application hypotheses of §§4.8–4.9.

In the following output table, slopes are projective Katz invariants and their order is forgotten only for the classification table; an omitted pole is written “—”. All seventeen ordered profiles are recovered with the label-assignment and reindexing comparisons of §3.4. The number of external parameters is the dimension of the generic exponent family, not the number of initial conditions. Boundary diagrams are affine.

| Slopes at 0, 1, ∞, t | Boundary type | External dimension | Displayed realization and exact locator |
|---|---|---:|---|
| 0, 0, 0, 0 | D₄ | 4 | PVI; IIS06 §10, Theorems 10.6 and 10.10 |
| 0, 0, 1, — | D₅ | 3 | PV; VDPS09 §4.3, equations (1)–(5) |
| 0, 0, 1/2, — | D₆ | 2 | degenerate PV; VDPS09 §4.4, equations (6)–(11) |
| 1, —, 1, — | D₆ | 2 | PIII(D₆); VDPS09 §4.5, equations (12)–(16) |
| 1/2, —, 1, — | D₇ | 1 | PIII(D₇); VDPS09 §4.6, equations (17)–(21) |
| 1/2, —, 1/2, — | D₈ | 0 | PIII(D₈); VDPS09 §4.7, equations (22)–(26) |
| 0, —, 2, — | E₆ | 2 | PIV; VDPS09 §4.8, equations (27)–(31) |
| 0, —, 3/2, — | E₇ | 1 | Flaschka–Newell realization; VDPS09 §4.9, equations (32)–(36); its immediate scalar coordinate is P34 |
| —, —, 3, — | E₇ | 1 | Jimbo–Miwa realization of PII; VDPS09 §4.10, equations (37)–(41) |
| —, —, 5/2, — | E₈ | 0 | PI; VDPS09 §4.11, equations (42)–(47) |

Prove the actual substitutions and admissible inverse domains relating the Flaschka–Newell scalar coordinate to PII and degenerate PV to PIII(D₆). Retain the decorated moduli problem associated with each presentation. The scalar substitutions compare solution germs on their specified inverse domains; identification of the isomonodromic families requires a comparison of the full decorated connection data, including for degenerate PV and PIII. (AHT17, introduction and §§2–3.)

The six standard scalar conclusions, in the DLMF normalization and on their ordinary differential-equation domains, are:

| Equation | Coordinate expression |
|---|---|
| PI | q″ = 6q² + t |
| PII | q″ = 2q³ + tq + α |
| PIII | q″ = q′²/q − q′/t + (αq² + β)/t + γq³ + δ/q |
| PIV | q″ = q′²/(2q) + 3q³/2 + 4tq² + 2(t² − α)q + β/q |
| PV | q″ = (1/(2q) + 1/(q − 1))q′² − q′/t + (q − 1)²(αq + β/q)/t² + γq/t + δq(q + 1)/(q − 1) |
| PVI | q″ = (1/q + 1/(q − 1) + 1/(q − t))q′²/2 − (1/t + 1/(t − 1) + 1/(q − t))q′ + q(q − 1)(q − t)[α + βt/q² + γ(t − 1)/(q − 1)² + δt(t − 1)/(q − t)²]/[t²(t − 1)²] |

Each row is a theorem about a chart and a specified parameter map. The symbols α, β, γ, δ are local to that row. The following explicit dictionaries fix the intended normalization; their admissible inverse charts and momentum transformations are part of the proof.

| Source variables and parameters | Standard variables and coefficients |
|---|---|
| IIS06 (1)–(2), with 2κ₀ + κ₁ + κ₂ + κ₃ + κ₄ = 1 | PVI: α = κ₄²/2, β = −κ₁²/2, γ = κ₂²/2, δ = (1 − κ₃²)/2 |
| VDPS09 PV system (2)/(5), with the scalar expression derived above | T = t, Q = q/(q − 1); (α,β,γ,δ) = (θ₁²/2,−θ₀²/2,1 − θ∞,−1/2) |
| VDPS09 degenerate PV system (8) | T = t², Q = q/(q − 1); (α,β,γ,δ) = (θ₁²/2,−θ₀²/2,−2,0) |
| VDPS09 PIII(D₆), (14) | T = t, Q = q; (α,β,γ,δ) = (4(θ∞ + 1),−4θ₀,4,−4) |
| VDPS09 PIII(D₇), (19) | t = T², Q(T) = Tq(T²); (α,β,γ,δ) = (4(θ∞ + 1),−8,4,0) |
| VDPS09 PIII(D₈), (24) | t = T², Q(T) = q(T²)/T; (α,β,γ,δ) = (8,−8,0,0) |
| VDPS09 PIV, (29) | t = 2T, Q(T) = 2q(2T); α = −θ∞ − 1, β = −2θ₀² |
| VDPS09 PII Jimbo–Miwa, (39) | T = t, Q = q; α = (θ∞ + 1)/2 |
| VDPS09 PI, (45), choose c⁵ = 2 | T = ct, Q = c⁻²q; Q″ = 6Q² + T |

For the Flaschka–Newell coordinate (34), choose c³ = 2 and set T = −ct, U(T) = cq(t). Then U″ = U′²/(2U) + 2U² − TU − θ₀²/(2U). Retain a chosen exponent sign a = ±θ₀. On U ≠ 0, Q = (U′ − a)/(2U) is the PII variable with α = a − 1/2; conversely U = Q′ + Q² + T/2. The exceptional branch U = 0, a = 0 cannot be reconstructed by division and keeps its full phase data. The square-time comparisons are local biholomorphisms on their nonzero domains or comparisons on the indicated covers; they are not global changes of coordinate on the same punctured line.

The PI and PII comparison packages include the canonical Hamiltonians H_I = p²/2 − 2q³ − tq and H_II = p²/2 − (q² + t/2)p − cq, with c = α + 1/2, in the convention ω = dq ∧ dp, q′ = H_p, p′ = −H_q. Prove their extended-form comparison and momentum inverses here. Use these Hamiltonians and comparisons in the sigma models of §7.4 and the seed checks of §7.5.

**API.**

- Prove the source extended-form sign comparison and the compatible PV elimination before using the presentation dictionaries.
- Export one comparison package per listed presentation, containing the explicit formulas, parameter map, inverse jet chart and overlap maps.
- Compare the source-specific Hamiltonian and the convention of §3.11 by equality of extended forms.
- Identify all excluded denominators and the phase charts through their allowed zero loci.
- Construct each standard q and supply its domain, overlap, stratum-coverage, cancellation/lift and non-infinity certificates to §§4.8–4.9.
- Deduce the standard scalar Painlevé property from §4.9 on every observer stratum covered by the comparison.

**Checks.**

- Verify ten presentation rows and eight boundary types, with two presentations for each of D₆ and E₇.
- In the PV source check t = 1, q = 2, p = 0, θ₀ = 0, θ₁ = 1, θ∞ = 1, the compatible elimination gives q″ = 2, not the printed 7/2.
- The standard PI scaling above changes both q and t. Rescaling t alone does not recover the coefficient 6 of q².
- PII's two linear-system presentations have different local singularity data; equality of their scalar solution formulas is not equality of input objects.
- A PIII comparison with γ = 4, δ = −4 cannot cover γ = δ = 0 by a nonzero scaling; the latter belongs to the boundary analysis of §7.3.

*Needs:* Internal: 3.4, 3.5, 3.6, 3.7, 3.8, 3.9, 3.10, 3.11, 3.12, 4.8, 4.9, 5.2, 7.1.

<a id="target-7-3"></a>
### 7.3 Complete coefficient-boundary coverage

**Painlevé application.**

**Hypotheses.**

- All standard PIII/PV coefficient tuples; nonzero scaling/inversion domains; quadrature boundary kept distinct from primitive strata.

Classify all coefficient tuples of the standard PIII and PV displays by admissible nonzero scalings and inversions, proving their exact domains and inverse substitutions. The primitive Painlevé profiles and the elementary boundary equations are different outputs; a leading irregular coefficient zero is not a point inside a stratum defined by its nonvanishing. (FM19, §1.1 and equation (2); DIL21, §§5.2–5.3 and Appendix B.3; DLMF, equations 32.9.6 and 32.9.12.)

| Display | Coefficient condition | Comparison target |
|---|---|---|
| PIII | γδ ≠ 0 | D₆ profile |
| PIII | γ = 0 and αδ ≠ 0, or δ = 0 and βγ ≠ 0 | D₇ profile, with the inversion comparison between the two orientations |
| PIII | γ = δ = 0 and αβ ≠ 0 | D₈ profile |
| PIII | α = γ = 0, or β = δ = 0 | quadrature/elementary boundary |
| PV | δ ≠ 0 | ordinary PV |
| PV | δ = 0 and γ ≠ 0 | degenerate PV presentation |
| PV | γ = δ = 0 | quadrature boundary |

Prove that the PIII cases cover all tuples; the two elementary alternatives may overlap and are combined into one boundary class. Derive the boundary integrations on their stated time/observer domains, with branches and integration constants retained. PIII with all four coefficients zero gives q = C exp(μ log t) on a chosen cover of ℂ*, including its nonzero-solution domain. A generic such power is not a single-valued function on ℂ*. Zero/constant solutions introduced by clearing q denominators require a separate original-equation domain check. Include these elementary branches, with their original-equation domains, in the classification of all coefficient tuples.

*Needs:* Internal: 7.1, 7.2; [Formal scalar and vector-valued Laurent algebra](#dependency-formal-series) (L1–L4; L5–L6 for finite-extension steps in 1.1); [Covering spaces and universal covers](#dependency-covers) (Stage 0.2–0.4; Stage 1.5; Stage 2.6–2.8).

<a id="target-7-4"></a>
### 7.4 Hamiltonian, sigma and linear-system realizations

**Painlevé application.**

**Hypotheses.**

- The geometric transformations, determinant-variation results and coordinate comparisons on their actual domains. The source-sign and PV-elimination lemmas and the PI/PII Hamiltonian normalizations are supplied by §7.2. Sigma reconstruction uses the explicit analytic and nondegeneracy conditions below, with constant parameters and connected open time domains.

For each of the ten presentations in §7.2, derive the Hamiltonian system from h and ω and the Lax-pair compatibility from the same local representative strong total connection, using the local source comparisons proved there. Track additive Hamiltonian functions of time, multiplicative tau normalizations and branch choices. For every geometric transformation g from §§5.4–5.5, construct its coordinate expression Ψ_g and prove c′ ∘ F̄_g = Ψ_g ∘ c on the actual common domain of the charts c,c′ from §7.2. Identify which zero denominators are removed by another phase chart and which belong to the genuine indeterminacy of the geometric map. Scalar jet substitutions use the jet inverses of §7.1 on their stated domains. (VDPS09, §4; IIS06, Theorem 10.13; BERT17, Proposition 2.3 and Theorem 3.3.)

The sigma comparisons use the following finite inventory of eight canonical models. Parameters and canonical coordinates are local to each row. Put s = σ, u = σ′ and v = σ″. In every model the Hamilton equations are q′ = K_p and p′ = −K_q. IMS18 is used with ℏ = 1; its sigma function need not equal its Hamiltonian. PI and PII use the DLMF convention of the explicit reconstruction statements below. Transport these sigma observations to the Flaschka–Newell and degenerate-PV presentations through the changes of variables and on the domains proved in §7.2.

| Model | Fixed Hamiltonian and sigma observable S(t,q,p) | Exact sigma relation |
|---|---|---|
| PI | K = p²/2 − 2q³ − tq; S = K | DLMF 32.6.6, with definition 32.6.5 and reconstruction 32.6.7–8 |
| PII | K = p²/2 − (q² + t/2)p − c q, c = α + 1/2; S = K | DLMF 32.6.13, with Hamiltonian 32.6.9 and reconstruction 32.6.14–15 |
| PIII(D₆) | IMS18 (2.18) at ℏ = 1; S = tK + pq, as in (2.19) | IMS18 (2.20) |
| PIII(D₇) | K = (q²p² + θqp + tp − q)/t; S = tK | E₇ = t²v² − (θu − 1)² − 4u²(s − tu) = 0 |
| PIII(D₈) | K = (q²p² − q − t/q)/t; S = tK | E₈ = t²v² + 4tu³ − 4su² + 4u = 0 |
| PIV | IMS18 (2.21); S = K + 2t(θ₀ + θ∞/3), as in (2.22) | IMS18 (2.23), with its three displayed sigma parameters |
| PV | IMS18 (2.24); S = tK | IMS18 (2.26), with its displayed ν₁, ν₂, ν₃ |
| PVI | K = K₁ from the formula below; S = t(t − 1)K₀ + (θ_t² − θ∞²)t/4 − (θ₀² + θ_t² − θ₁² − θ∞²)/8 | IMS18 (2.30), with the sigma definition (2.28)–(2.29) |

For the PVI row, put A = θ₀ + θ₁ + θ_t and fix the rational Hamiltonian family

```math
\begin{aligned}
t(t-1)K_\varepsilon={}&q(q-1)(q-t)p^2
 -\bigl[\theta_0(q-1)(q-t)+\theta_1q(q-t)
 +(\theta_t-\varepsilon)q(q-1)\bigr]p\\
&+\frac{(A-\theta_\infty)(A+\theta_\infty-2\varepsilon)}4(q-t)
 +\frac{[(t-1)\theta_0+t\theta_1](\theta_t-\varepsilon)}2.
\end{aligned}
```

Use K₁ for the dynamics and K₀ only in the displayed sigma observable. Prove in this target the coefficient −2ε and the comparison of this convention with IMS18 (2.27) and the standard scalar normalization of §7.2. Prove E(t,S,XS,X²S) = 0 for every row directly from its fixed Hamiltonian, where X = ∂_t + K_p∂_q − K_q∂_p. This is the forward sigma statement; it is independent of a scalar tau normalization.

Derive the canonical D₇ and D₈ models from VDPS09's Hamiltonian displays by the following changes of variables. For D₇ use VDPS09 (18)–(21), write its coordinates as (r,z), and let λ be its θ∞. Set θ = λ + 2, q = 1/r and p = −z − θr/2 − tr²/2. For D₈ use VDPS09 (23)–(26), with q = r and p = (z + r/2)/r²; the displayed K differs from the transformed negative source Hamiltonian by 1/(4t). Prove both changes intertwine the first-order systems on tr ≠ 0 and derive E₇ and E₈ by substitution. These comparisons retain the time-only Hamiltonian correction.

| Model | Dictionary to the standard scalar equations of §7.2 |
|---|---|
| PI | T = t, Q = q |
| PII | T = t, Q = q; α = c − 1/2 |
| PIII(D₆) | T = t, Q = q; (α,β,γ,δ) = (4θ₀, 4(1 − θ∞), 4, −4) |
| PIII(D₇) | t = T², Q(T) = T/q(T²); (α,β,γ,δ) = (4(θ − 1), −8, 4, 0) |
| PIII(D₈) | t = T², Q(T) = q(T²)/T; (α,β,γ,δ) = (8, −8, 0, 0) |
| PIV | T = t, Q = 2q; (α,β) = (2θ∞ − 1, −8θ₀²) |
| PV | T = t, Q = q; (α,β,γ,δ) = ((θ₀ − θ₁ − θ∞)²/8, −(θ₀ − θ₁ + θ∞)²/8, θ₀ + θ₁ − 1, −1/2) |
| PVI | T = t, Q = q; (α,β,γ,δ) = ((θ∞ − 1)²/2, −θ₀²/2, θ₁²/2, (1 − θ_t²)/2) |

The square-time comparisons retain the nonzero cover and the chosen branch. Construct the momentum comparisons using q′ = K_p on the common chart. Prove both the scalar parameter dictionary and equality of the corresponding extended forms, including the stated scale and time-only corrections.

For every fixed model construct a local converse as follows. Set S₀ = S, S₁ = XS and S₂ = X²S, and define Δ = (∂_qS₀)(∂_pS₁) − (∂_pS₀)(∂_qS₁). At a phase point x₀ where Δ ≠ 0 and E_v(t,S₀,S₁,S₂) ≠ 0, apply the holomorphic inverse theorem to the fixed map (t,q,p) ↦ (t,S₀,S₁). Construct inverse neighborhoods and the inverse branch I_{x₀}. The implicit function theorem identifies the germ of E = 0 through (t₀,S₀(x₀),S₁(x₀),S₂(x₀)) with the graph of S₂ transported by I_{x₀}; prove this identification using the forward identity. For a holomorphic sigma solution in that germ, define (q(t),p(t)) = I_{x₀}(t,σ(t),σ′(t)). Differentiating S₀ and S₁ gives the two equations dS_i((q′,p′) − (K_p,−K_q)) = 0, i = 0,1; the nonzero determinant Δ proves both Hamilton equations. Prove both inverse laws on the constructed neighborhoods and analytic dependence on parameters, retaining x₀ as part of the inverse-branch data.

These hypotheses define a concrete sufficient open domain. In PI, PII and PIV, Δ = −S₂ and E_v = 2v. In PV, D₇ and D₈, Δ = −tS₂ and E_v = 2t²v. In PIII(D₆), Δ = S₁ − tS₂ and E_v = 2t(tv − u). In PVI use the displayed determinant Δ and E_v = 2u t²(t − 1)²v. Thus, on the Hamiltonian domains, the additional conditions are respectively v ≠ 0; t ≠ 0 and v ≠ 0; t ≠ 0 and tv − u ≠ 0; and t(t − 1)uvΔ ≠ 0. The D₈ Hamiltonian also requires q ≠ 0. The stronger connected-branch PI and PII converses below extend beyond these pointwise conditions by their explicit identities. The sigma conclusions consist of the forward identities, these local inverse branches and the PI/PII connected-branch and affine-branch analyses below. For continuation of a reconstructed phase trajectory across a zero of an inverse denominator, prove the geometric phase-chart comparison.

For PI, use σ = H_I with H_I from §7.2. The equation is E_I = (σ″)² + 4(σ′)³ + 2tσ′ − 2σ = 0, and reconstruction is q = −σ′, p = −σ″ (DLMF 32.6.2–32.6.8). On a connected open time domain require holomorphic σ and σ″ not identically zero, equivalently a point at which σ″ ≠ 0. Differentiating gives E_I′ = 2σ″(σ‴ + 6(σ′)² + t); the identity theorem yields the Hamilton equations everywhere on that domain. Prove H_I(q,p,t) = σ from E_I = 0. The excluded affine branches are exactly σ = at + 2a³, and their constant q = −a never solves PI on an open time domain. In particular, σ ≡ 0 is a spurious scalar solution.

For PII, fix c = α + 1/2 and σ = H_II with H_II from §7.2. Put u = σ′, v = σ″,

```math
E=v^2+4u^3+2u(tu-\sigma)-c^2/4,\qquad
D=\sigma'''+6u^2+2tu-\sigma
```

The sigma equation is E = 0 (DLMF 32.6.13). Require holomorphic σ on a connected open time domain and v not identically zero. On the open subset u ≠ 0 define q = (2v+c)/(4u), p = −2u (DLMF 32.6.14–32.6.15). Prove the identities

```math
E'=2vD,\qquad p'-(2qp+c)=0,
```

```math
q'-(p-q^2-t/2)=\frac{D}{2u}-\frac{E}{4u^2},\qquad
H_{\mathrm{II}}(q,p,t)-\sigma=\frac{E}{2u}.
```

Since v is not identically zero, E = 0 implies D = 0 by the identity theorem. This proves both Hamilton equations and H_II = σ on u ≠ 0. No pointwise condition v ≠ 0 is needed there. Conversely, Hamilton trajectories satisfy σ′ = −p/2 and σ″ = 2qσ′ − c/2 and hence E = 0. At an isolated zero of u, prove extension of the reconstructed trajectory into the full phase space and its comparison with the sigma observation using §4.6, §§4.8–4.9 and the chart comparisons.

If v ≡ 0, write σ = at+b. The sigma relation becomes 4a³−2ab = c²/4. For a ≠ 0, it gives b = 2a²−c²/(8a), but reconstruction yields constant q = c/(4a), p = −2a, incompatible with q′ = p−q²−t/2 on an open time domain. For a = 0, the sigma relation requires c = 0 and permits every b. The Hamilton identity forces b = 0; at b = 0 the genuine Riccati family p = 0, q′ = −q²−t/2 has σ ≡ 0. Retain its phase initial point: different q values give the same sigma function, so there is no sigma-only inverse on this family. Distinguish the spurious affine sigma solutions from the noninjectivity of the sigma observation on this invariant Riccati family.

**API.**

- For the finite sigma inventory, construct each fixed sigma observation, prove its equation and parameter/time comparison, and construct the stated inverse branches with their actual nondegeneracy and domain conditions.
- Prove the PI and PII forward identities, the analytic converse on the specified non-affine branches, and the affine-branch diagnostics; keep the PII Riccati phase data.
- Construct the coordinate transformations Ψ_g and their commuting diagrams with F̄_g, including comparison of denominators with the geometric domains.
- Compare Hamiltonian and tau logarithmic derivatives using §6.5's fixed-section coefficient and its separately normalized scalar function.

**Checks.**

- For PII with c = 0, σ(t) = t+2 satisfies E = 0 and σ′ = 1, but reconstructed q = 0, p = −2 has first Hamilton residual 2+t/2. At t = 0 that residual is 2, although H_II = σ. The sigma equation, nonzero reconstruction denominator and Hamiltonian identity all hold on this branch, while the Hamilton equations fail.
- For PI, σ ≡ 0 satisfies the sigma equation but gives q ≡ 0, which does not solve PI. The condition σ″ not identically zero excludes this branch.
- For PII at c = 0, distinct local solutions of q′ = −q²−t/2 all give the same σ ≡ 0; the inverse must retain their different phase initial points.
- A coordinate Bäcklund formula and the descended transformation must have identical chart values on their common domain; a denominator vanishing in one chart alone does not determine whether the geometric map is undefined.

*Needs:* Internal: 3.11, 4.6, 4.8, 4.9, 5.4, 5.5, 6.4, 6.5, 7.1, 7.2, 7.3; [Complex manifolds, holomorphic bundles and observations](#dependency-complex) (K1; K3.0; K3.HolomorphicStalk; K3.MeromorphicGermField; K4; K7.1).

<a id="target-7-5"></a>
### 7.5 Concrete normalizations and special-solution checks

**Painlevé application.**

**Hypotheses.**

- The PI/PII connection-moduli comparisons, Hamiltonian normalizations and momentum inverse of §7.2, the first-jet lemma and the admitted geometric transformations. Derive the seed solution identities in this target, retaining the exceptional domains and the Riccati parameter α=−1/2.

Use the PI chart H = p²/2 − 2q³ − tq and the PII chart H = p²/2 − (q² + t/2)p − (α + 1/2)q proved from the moduli comparisons in §7.2, and apply §7.1. The PII jet inverse is p = q′ + q² + t/2. The polynomial chart covers all finite (q,q′), while poles use the other phase charts. Establish its parameter dictionary with §7.2. (VDPS09, §§4.10–4.11; DLMF, §§32.2, 32.6 and 32.9.)

Construct the rational and classical-function families in the orbits of the proved seed objects under §§5.4–5.5's admitted transformations, and derive their coordinate formulas. The special-solution output consists of these generated families, with the transformation domains and parameter changes retained.

**Checks.**

- At α = 0, q = 0 and p = t/2 form a horizontal section in this chart.
- At α = 1 and t ≠ 0, q = −1/t and p = 2/t² + t/2 satisfy both Hamilton equations; at t = 0 their geometric continuation uses another chart.
- At α = −1/2, p = 0 is invariant and q′ = −q² − t/2. Setting q = u′/u gives u″ = −tu/2 on u ≠ 0; this is the projective linearization of §5.6, with zeros of u interpreted in ℙ¹.
- H ↦ H + c(t) preserves the displayed horizontal trajectories and changes a normalized Hamiltonian tau representative by the corresponding exponential primitive when the identity of §6.5 applies.

*Needs:* Internal: 5.4, 5.5, 5.6, 6.5, 7.1, 7.2, 7.3, 7.4.

#### Examples

The scalar equation may have an apparent denominator at a regular geometric initial point. A denominator-cleared polynomial identity may also admit functions absent from the original equation. Use first-jet charts and observer overlap maps to distinguish geometric continuation from these extra scalar solutions and to compare solution germs on their actual domains.

### References

<a id="references"></a>

- **I13.** Michi-aki Inaba. *[Moduli of parabolic connections on a curve and Riemann–Hilbert correspondence](https://arxiv.org/abs/math/0602004v2)*. Journal of Algebraic Geometry 22 (2013), 407–480. Cited preprint: arXiv math/0602004v2, 6 June 2012; Theorems 2.1–2.2, Definition 4.3, Proposition 5.3, and §6, Lemma 6.1, Propositions 6.1–6.2 and the proof of Theorem 2.2. The logarithmic extension, stable-replacement and compactness arguments supply the corresponding lemmas of §4.4; Proposition 5.3 and the proof of Theorem 2.2 supply its fiberwise irreducibility and character-locus geometry. The four-logarithmic specialization retains the exponent fiber product and the exact numerical and stability hypotheses.

- **SAB12.** Claude Sabbah. *[Introduction to Stokes structures](https://arxiv.org/abs/0912.2762v5)*. Lecture Notes in Mathematics 2060, Springer, 2012. Cited version: arXiv 0912.2762v5, 3 April 2012; Definition 2.22, Proposition 5.5, Theorem 5.8 and Proposition 5.12. The meromorphic/Stokes correspondence includes ramification and the regular-singular specialization. Specified lattices, flags and their family comparisons are constructed in §4.1.

- **I23.** Michi-aki Inaba. *[Moduli Space of Factorized Ramified Connections and Generalized Isomonodromic Deformation](https://sigma-journal.com/2023/013/)*. SIGMA 19 (2023), 013, 72 pages. Publisher version, 22 March 2023. Locators: Definitions 2.1–2.8; Remark 2.9; Theorems 5.1, 7.5, 8.1, 9.7 and 11.6; equation (6.9); Propositions 3.3, 6.3, 7.2, 8.2–8.3, 10.7 and 10.10; Definitions 10.1 and 11.4; Corollaries 4.3–4.4, 9.11 and 11.8; equations (8.2), (11.2) and (11.5).

- **IS12.** Michi-aki Inaba; Masa-Hiko Saito. *[Moduli of unramified irregular singular parabolic connections on a smooth projective curve](https://arxiv.org/abs/1203.0084v3)*. Kyoto Journal of Mathematics 53(2) (2013), 433–482. Cited version: arXiv 1203.0084v3 (22 November 2012); the key retains the preprint year. Locators: Theorem 5.1; Remark 6.3.

- **HEU10.** Viktoria Heu. *[Universal isomonodromic deformations of meromorphic rank 2 connections on curves](https://www.numdam.org/item/AIF_2010__60_2_515_0/)*. Annales de l'Institut Fourier 60(2) (2010), 515–549. Published text through NUMDAM; printed pp. 515–549. Locators: Theorem 1.1; Definitions 2.3 and 2.10; §2.

- **VDPS09.** Marius van der Put; Masa-Hiko Saito. *[Moduli spaces for linear differential equations and the Painlevé equations](https://arxiv.org/abs/0902.1702v5)*. Annales de l'Institut Fourier 59(7) (2009), 2611–2667. Cited version: arXiv 0902.1702v5 (12 November 2009); the source-form sign and PV-elimination corrections are proved in §7.2. Locators: §2.2, Table 1, preprint pp. 18–19; §3; §4.1 and §§4.3–4.11; equations (12), (17) and (22).

- **IIS06.** Michi-aki Inaba; Katsunori Iwasaki; Masa-Hiko Saito. *[Dynamics of the Sixth Painlevé Equation](https://arxiv.org/abs/math/0501007v2)*. Séminaires et Congrès 14 (2006), 103–167. Cited version: arXiv math/0501007v2 (6 March 2005). Locators: Definitions 2.1–2.2 and 2.11; Lemma 2.12; Definitions 3.5 and 4.9; Theorems 4.10–4.12, 5.15–5.16, 7.4, 10.6, 10.10 and 10.13; §§5, 7 and 10.

- **BOA01.** Philip Boalch. *[Symplectic Manifolds and Isomonodromic Deformations](https://arxiv.org/abs/2002.00052v1)*. Advances in Mathematics 163 (2001), 137–205. Cited version: arXiv 2002.00052v1, the author's 2020 deposit of the 2001 article. Locators: §§3–6; Theorems 7.1 and 7.3; §7.

- **BOA14.** P. P. Boalch. *[Geometry and braiding of Stokes data; Fission and wild character varieties](https://arxiv.org/abs/1111.6228v3)*. Annals of Mathematics 179(1) (2014), 301–365. Cited version: arXiv 1111.6228v3 (22 September 2012). Locators: §10, Theorem 10.2; §7 for Stokes data.

- **BY15.** Philip Boalch; Daisuke Yamakawa. *[Twisted wild character varieties](https://arxiv.org/abs/1512.08091v1)*. arXiv preprint 1512.08091. Cited version: arXiv 1512.08091v1 (26 December 2015). Locators: Remark 3; Definitions 7 and 13; Proposition 19; Theorem 21; Corollary 22.

- **STT02.** Masa-Hiko Saito; Taro Takebe; Hitomi Terajima. *[Deformation of Okamoto–Painlevé pairs and Painlevé equations](https://arxiv.org/abs/math/0006026v2)*. Journal of Algebraic Geometry 11(2) (2002), 311–362. Cited version: arXiv math/0006026v2 (18 September 2000), the three-author article. Locators: Definitions 1.1 and 1.3; Proposition 1.2; Tables 2–3; Theorem 3.1; §6.

- **TER02.** Hitomi Terajima. *[Local cohomology of generalized Okamoto–Painlevé pairs and Painlevé equations](https://arxiv.org/abs/math/0006027v1)*. Japanese Journal of Mathematics, New Series 28(1) (2002), 137–162. Cited version: arXiv math/0006027v1 (5 June 2000). Locators: Theorem 2.1; Proposition 2.1; Conjecture 2.1.

- **ST04.** Masa-Hiko Saito; Hitomi Terajima. *[Nodal curves and Riccati solutions of Painlevé equations](https://arxiv.org/abs/math/0201225v1)*. Journal of Mathematics of Kyoto University 44(3) (2004), 529–568. Cited version: arXiv math/0201225v1 (23 January 2002). Locators: §2.4; Proposition 2.1; Definition 2.3; Remark 2.4; Appendix A.

- **FM19.** Andrea E. V. Ferrari; Lionel Mason. *[Meromorphic Painlevé III transcendents and the Joukowski correspondence](https://arxiv.org/abs/1809.07885v2)*. Journal of Integrable Systems 4(1) (2019), xyz001. Cited version: arXiv 1809.07885v2 (30 January 2019). Locators: §1.1; equation (2).

- **DIL21.** Jan Dereziński; Artur Ishkhanyan; Adam Latosiński. *[From Heun Class Equations to Painlevé Equations](https://sigma-journal.com/2021/056/)*. SIGMA 17 (2021), 056, 59 pages. Publisher version, 7 June 2021. Locators: §§5.2–5.3; Appendix B.3.

- **AHT17.** Primitivo B. Acosta-Humánez; Marius van der Put; Jaap Top. *[Isomonodromy for the Degenerate Fifth Painlevé Equation](https://sigma-journal.com/2017/029/)*. SIGMA 13 (2017), 029, 14 pages. Publisher version, 9 May 2017. Locators: Introduction; §§2–3.

- **MAL04.** Bernard Malgrange. *[Déformations isomonodromiques, forme de Liouville, fonction τ](https://www.numdam.org/articles/10.5802/aif.2052/)*. Annales de l'Institut Fourier 54(5) (2004), 1371–1392. Published text through NUMDAM; printed pp. 1371–1392. Locators: §2, printed pp. 1372–1374; Theorem 5.12.

- **BERT10.** Marco Bertola. *[The dependence on the monodromy data of the isomonodromic tau function](https://arxiv.org/abs/0902.4716v2)*. Communications in Mathematical Physics 294 (2010), 539–579. Cited version: arXiv 0902.4716v2 (20 January 2016); always used with BERT16. Locators: Assumption 3.1; §5.1, Proposition 5.1; Theorem 5.1 only with the correction BERT16.

- **BERT16.** Marco Bertola. *[Corrigendum: The dependence on the monodromy data of the isomonodromic tau function](https://arxiv.org/abs/1601.04790v2)*. Communications in Mathematical Physics 381 (2021), 1445–1461. Cited version: arXiv 1601.04790v2 (19 September 2020), published in 2021 as Correction to: The Dependence on the Monodromy Data of the Isomonodromic Tau Function. The key retains the initial 2016 preprint year. Locators: Definition 2.1; Theorems 2.1 and 2.2.

- **BERT17.** Marco Bertola. *[The Malgrange Form and Fredholm Determinants](https://arxiv.org/abs/1703.00046v4)*. SIGMA 13 (2017), 046, 12 pages. Cited version: arXiv 1703.00046v4, carrying the SIGMA publication text. Locators: §1; Theorem 2.2; Proposition 2.3; formula (3.6); Theorem 3.3; §3.1.2.

- **IMS18.** Kohei Iwaki; Olivier Marchal; Axel Saenz. *[Painlevé equations, topological type property and reconstruction by the topological recursion](https://arxiv.org/abs/1601.02517v7)*. Journal of Geometry and Physics 124 (2018), 16–54. Cited version: arXiv 1601.02517v7 (9 October 2017), §2.2, equations (2.18)–(2.30), with ℏ = 1. Section 7.4 specifies the Hamiltonian and sigma conventions, including the PVI coefficient and its comparison with the scalar equation.

- **DLMF.** P. A. Clarkson, *[Painlevé Transcendents, Chapter 32 of the NIST Digital Library of Mathematical Functions](https://dlmf.nist.gov/32)*. Version 1.2.8, released 15 September 2026. [§32.2](https://dlmf.nist.gov/32.2), equations 32.2.1–32.2.6; [§32.6](https://dlmf.nist.gov/32.6); [§32.7](https://dlmf.nist.gov/32.7); [§32.9](https://dlmf.nist.gov/32.9), especially equations 32.9.6 and 32.9.12. Standard scalar displays and normalization reference.
