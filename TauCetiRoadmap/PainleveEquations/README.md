# Painlevé equations

Construct differential Painlevé equations as flat nonlinear connections on moduli spaces of decorated meromorphic connections, and Painlevé functions as their horizontal sections and admissible observations. Prove their properties from those constructions. The classical scalar equations, Hamiltonians and linear systems are coordinate comparison theorems.

The roadmap contains 57 construction and theorem targets in eight layers: 21 targets of reusable general theory and 36 targets for the classical Painlevé application.

## Structure

Each layer develops one mathematical construction or theorem package. General results retain their own hypotheses, conclusions and proof ownership when placed alongside an application.

| Layer | Mathematical development | Targets |
|---:|---|---:|
| [0](#layer-0) | Nonlinear connections and their solutions | 8 |
| [1](#layer-1) | Moduli of decorated meromorphic connections | 6 |
| [2](#layer-2) | Isomonodromic deformations and the logarithmic Riemann–Hilbert correspondence | 6 |
| [3](#layer-3) | Phase spaces and isomonodromic deformations of Painlevé equations | 12 |
| [4](#layer-4) | Riemann–Hilbert comparison and the Painlevé property | 9 |
| [5](#layer-5) | Initial-condition surfaces, symmetries and Riccati reductions | 6 |
| [6](#layer-6) | Determinant lines and tau sections | 5 |
| [7](#layer-7) | Classical forms of Painlevé equations | 5 |

<a id="general-theory"></a>

## General theory and applications

All 57 targets, including each theorem with additional hypotheses, are in scope. The hypotheses state when a conclusion holds; they do not make its proof discretionary. Mathematical constructions, their basic APIs, comparison maps and specified examples belong to the same target.

| Reusable general theory | Targets |
|---|---|
| Nonlinear connections, solutions, transport, observations and jets | 0.1–0.8 |
| Moduli of decorated meromorphic connections | 1.1–1.6 |
| Isomonodromic deformations and the logarithmic Riemann–Hilbert correspondence | 2.1–2.6 |
| Determinant lines of holomorphic Fredholm families | 6.1 |

These 21 targets have no transitive prerequisite in the Painlevé application. The remaining 36 targets form that application. Its intrinsic constructions and properties in Layers 3–6 do not depend on the classical coordinate comparisons in Layer 7. Sharing a layer adds no dependency. Phase spaces, connections and forms are constructed before their properties are proved.

An existing roadmap supplies only the results specified in the external dependency contracts. Additional constructions have named proof owners here. Applications use the same general objects, morphisms and pullbacks and prove their hypotheses and comparisons.

## Addresses and conventions

Layers are numbered consecutively from 0 to 7. A target identifier consists of its layer and its consecutive position within that layer, for example 0.1 and 0.2. Structured internal references have the form target:0.1; all internal references are global. Literature and supplier-roadmap sections retain their source numbering. Each target states its hypotheses, conclusions and comparison laws.

<a id="external-dependencies"></a>
## External dependency contracts

A roadmap reference supplies its stated construction or theorem, with its hypotheses; it does not assert an implemented result. A native reference names an existing carrier or API. Every extension required here has a local proof owner. The external dependency contracts are listed below.

| Contract | Exact supplier | Scope and local extension |
|---|---|---|
| <a id="dependency-complex"></a>complex | [ComplexKahlerGeometry](../../TauCetiRoadmap/ComplexKahlerGeometry/README.md) — K1; K3.0; K3.HolomorphicStalk; K3.MeromorphicGermField; K4; K7.1 | Complex inverse/implicit-function and tangent calculus; holomorphic germs and one-variable meromorphic germs; holomorphic bundle/sheaf equivalence and nonsingular flat connections/local systems; projective charts. The nonlinear-connection theory owns nonlinear connections, holomorphic ODEs, transport and observations. The meromorphic-moduli theory owns meromorphic/analytic-moduli comparisons. K4 does not supply algebraic analytification. |
| <a id="dependency-smooth"></a>smooth | [SmoothBundlesConnections](../../TauCetiRoadmap/SmoothBundlesConnections/README.md) — B1.5; B5.0; B5.2 | Smooth Ehresmann splittings, proper-submersion and principal-connection transport within their respective hypotheses. 0.1–0.5 own nonlinear connection objects, continuous-time local lifting, holomorphic parameter dependence and complete nonlinear transport. No properness of the phase projection is assumed. |
| <a id="dependency-differential"></a>differential | [DifferentialGeometry](../../TauCetiRoadmap/DifferentialGeometry/README.md) — Layers 0–1; 3.1–3.5 | Finite-dimensional manifolds, charts and smooth local/maximal/time-dependent flows. 0.2 proves the continuous-time locally uniformly Lipschitz theorem; 0.8 constructs intrinsic jets. |
| <a id="dependency-frobenius"></a>frobenius | `TauCeti.Analysis.ODE.Frobenius` — TauCeti.exists_frobenius_flat_coordinate | For a finite-dimensional real integrable graph field, a local product OpenPartialHomeomorph with a smooth inverse and the prescribed horizontal derivatives, at the stated regularity. 0.5 constructs the submersion-chart graph field, proves curvature implies its integrability, and glues these local products for homotopy-invariant transport. 0.3 supplies the holomorphic counterpart. |
| <a id="dependency-covers"></a>covers | [Completed/UniversalCovers](../../Completed/UniversalCovers/README.md) — Stage 0.2–0.4; Stage 1.5; Stage 2.6–2.8 | Native covering, path and homotopy lifting, universal covers and their fundamental-group interfaces. 0.5 constructs the nonlinear action and horizontal descent; general-cover descent uses the actual fiber relation, not deck invariance without normality. |
| <a id="dependency-curves"></a>curves | [ComplexCurveModuli](../../TauCetiRoadmap/ComplexCurveModuli/README.md); [SchemeAndStackFoundations](../../TauCetiRoadmap/SchemeAndStackFoundations/README.md) — ComplexCurveModuli D0.3, D3–D5; SchemeAndStackFoundations 4.15 | Genus-zero Möbius normalization and supported point-pushing; stable marked-curve deformation charts in the stable range. 1.2 constructs unstable one-/two-pointed quotient charts, finite jets, local markings and determinant transport. Its analytic category is constructed there; D2.0 is only an instance comparison. |
| <a id="dependency-stacks"></a>stacks | [SchemeAndStackFoundations](../../TauCetiRoadmap/SchemeAndStackFoundations/README.md) — 1.18–1.23 | Stackification, 2-fiber products, algebraic/DM presentations, inertia, QCoh descent, and finite-inertia Keel–Mori at its hypotheses. 1.3 proves bounded GIT, scalar Gm rigidification, gerbe and coarse comparisons. Finite-inertia criteria do not apply to an unrigidified Gm stable stack. |
| <a id="dependency-quotient-predicates"></a>quotient-predicates | [SchemeAndStackFoundations](../../TauCetiRoadmap/SchemeAndStackFoundations/README.md) — 1.17 | Categorical/geometric quotient definitions, Artin bootstrap and the stated finite-group projective quotients. Reductive invariant theory and actual character quotients are 1.3/2.5; wild framing and Stokes quotients are 4.2. |
| <a id="dependency-quot"></a>quot | [SchemeAndStackFoundations](../../TauCetiRoadmap/SchemeAndStackFoundations/README.md) — 4.14 | Noetherian projective Quot/Hilbert and Hom/Isom parameter spaces with their stated base-change laws. 1.3 proves boundedness, the equations and stability/GIT comparison. Analytic pullbacks use 1.2. |
| <a id="dependency-cohomology"></a>cohomology | [SchemeAndStackFoundations](../../TauCetiRoadmap/SchemeAndStackFoundations/README.md) — 2.2; 2.6; 2.20; 3.3 | Čech and sheaf cohomology, coherent terms, relative/Serre duality, degrees and curve Riemann–Roch at the stated hypotheses. 1.4 constructs C-linear differential-operator hypercohomology and the ramified cone; coherent underlying terms do not make its differential O-linear. |
| <a id="dependency-deformation"></a>deformation | [SchemeAndStackFoundations](../../TauCetiRoadmap/SchemeAndStackFoundations/README.md) — 4.2–4.6 | Artinian coefficients, deformation functors, hulls and elementary small-extension obstruction calculations. 1.4 constructs actual connection cocycles, the needed arbitrary finite square-zero kernels and framed versality; 2.1 constructs strong horizontal extensions. |
| <a id="dependency-bundles"></a>bundles | [AlgebraicVectorBundles](../../TauCetiRoadmap/AlgebraicVectorBundles/README.md) — L0A–L0C; L1A–L1B; L2A–L2B | Finite locally free sheaves, duals/tensors/determinants, relative Spec and the geometric vector-bundle equivalence. Meromorphic connections and analytification are 1.1–1.2. |
| <a id="dependency-analytic-coherence"></a>analytic-coherence | [RealAnalyticGeometry](../../TauCetiRoadmap/RealAnalyticGeometry/README.md) — R3.2 item 0 | Coherent analytic module-sheaf carriers and local calculus on the supplied analytic manifold structure sheaf. 1.2 constructs general complex analytic spaces, nilpotent quotients, analytification and GAGA comparisons. |
| <a id="dependency-proper-cohomology"></a>proper-cohomology | [JacobianChallenge](../../TauCetiRoadmap/JacobianChallenge/README.md) — Layer C | Proper coherent pushforwards and separately stated flat-base-change and cohomology/base-change criteria; Grauert under its reduced-base and constant-rank assumptions. 1.5 proves the relative Picard extension; 5.3 verifies boundary-coefficient flatness and the exact locally free/arbitrary-base-change criterion. |
| <a id="dependency-chow"></a>chow | [SchemeAndStackFoundations](../../TauCetiRoadmap/SchemeAndStackFoundations/README.md) — 4.12, `chow_lemma` only; 0.9 and 4.11 | For a separated finite-type morphism to a Noetherian base, a projective modification with quasi-projective source over that base; the source is projective when the original morphism is proper. 1.2 uses this subtarget with coherent cohomology and proper direct images for the proper GAGA argument. The separate flattening and StableReduction branch of 4.12 is not a prerequisite. |
| <a id="dependency-field-picard"></a>field-picard | [JacobianChallenge](../../TauCetiRoadmap/JacobianChallenge/README.md); [SchemeAndStackFoundations](../../TauCetiRoadmap/SchemeAndStackFoundations/README.md) — JacobianChallenge Layer D; SchemeAndStackFoundations 1.1, 2.6, 3.4, 4.6, 4.14 | Picard representability for projective geometrically integral schemes over a field, smooth-curve Jacobians, line-bundle descent and deformation. 1.5 constructs relative Picard under projective flat finite presentation and universal functions, including nonreduced curves; 5.1 verifies its boundary hypotheses. |
| <a id="dependency-supports"></a>supports | [SchemeAndStackFoundations](../../TauCetiRoadmap/SchemeAndStackFoundations/README.md) — 2.7 | Supported cohomology, localization/excision and the Noetherian colimit-of-Ext comparison with native local cohomology. 5.3 constructs its first boundary layer, injection and time-line comparison; it does not identify all supported cohomology with that line. |
| <a id="dependency-surfaces"></a>surfaces | [SchemeAndStackFoundations](../../TauCetiRoadmap/SchemeAndStackFoundations/README.md) — 3.4; 4.11; 4.17; 5.9–5.10 | Divisor/Picard groups, blowups and strict transforms, normal crossings, surface intersection/adjunction and lattice theory. 5.1–5.3 construct the nonreduced anticanonical boundary, relative logarithmic deformation and family comparisons; targets 5.4–5.6 construct the geometric transformations. |
| <a id="dependency-formal-series"></a>formal-series | [FormalLaurentPuiseux](../../TauCetiRoadmap/FormalLaurentPuiseux/README.md) — L1–L4; L5–L6 for finite-extension steps in 1.1 | Formal substitutions, continuous differentials, finite-dimensional HahnModule comparisons, residue/duality, ramified exponent embeddings and the stated finite-extension algebra. 1.1 proves differential-module Levelt–Turrittin decomposition and descent. |
| <a id="dependency-fredholm"></a>fredholm | `Mathlib.Analysis.Normed.Operator.Fredholm.Basic`; `TauCeti.Analysis.Fredholm.Stabilization`; `TauCeti.Analysis.Normed.Operator.Splitting.Family`; `TauCeti.LinearAlgebra.Determinant.Line` — IsFredholm; nonempty_fredholmPackage; exists_stabilization_kernel_coordinates; kernelHomeomorph; contDiffAt_kerSection; detLine; detLineCongr | Scalar-generic finite-dimensional kernel/cokernel, stabilization coordinates and pointwise determinant-line comparisons; specialize over ℂ and dualize the convention. 6.1 constructs the holomorphic family, canonical section, transition cocycle and base-change laws. |
| <a id="dependency-inversion"></a>inversion | `Mathlib.Analysis.Analytic.Constructions` — analyticAt_inverse; analyticAt_inverse_one_sub | Analytic inversion on units of a complete normed algebra and the small-norm inverse. 6.1 proves the actual holomorphic family-to-operator maps used in stabilization. |
| <a id="dependency-trace-ideal"></a>trace-ideal | [OperatorTheory/OperatorIdeals](../../TauCetiRoadmap/OperatorTheory/OperatorIdeals/README.md) — OI-B01–OI-B19; OI-B23; OI-B29–OI-B30 | Normed complete trace-class ideal, nuclear gauge and two-sided ideal estimates. 6.3–6.4 verify actual trace-class realizations and their trace-norm holomorphic dependence where used. |
| <a id="dependency-trace-determinant"></a>trace-determinant | [RandomMatrices](../../TauCetiRoadmap/RandomMatrices/README.md) — 8.3, generic operator-theory prefix | Trace, exterior powers, generic Fredholm determinant series and trace-norm continuity before the positive-kernel point-process specialization. 6.4 proves the logarithmic derivative, its holomorphic-family hypotheses and the integrable-kernel comparison. |
| <a id="dependency-toeplitz"></a>toeplitz | [OperatorTheory/ToeplitzOperators](../../TauCetiRoadmap/OperatorTheory/ToeplitzOperators/README.md) — T1–T3 | Circle Hardy models and Fredholm index equal to minus determinant winding for continuous invertible matrix symbols. 6.3 constructs contour/Hardy, holomorphic-family, index-zero, resonant and ramified adapters. Index zero alone does not imply invertibility. |
| <a id="dependency-curve-functions"></a>curve-functions | `TauCeti.Analysis.Complex.RiemannSurface.FunctionField`; `TauCeti.Analysis.Complex.RiemannSurface.FunctionField.Comap` — TauCeti.RiemannSurface.MeromorphicFunction; Nonconstant curve pullback and order comparison | Holomorphic maps from a Riemann surface to OnePoint ℂ with a witness excluding the constant-infinity map; native pullback and orders. 0.7 proves phase-observation admissibility and scalar descent; its scalar output uses this same carrier. |
| <a id="dependency-proper"></a>proper | `Mathlib.Topology.Maps.Proper.Basic` — IsProperMap | Topological proper maps and the compact-preimage and base-change properties under their actual topological hypotheses. 0.4 proves complete-lift transfer. 1.2 proves analytic/algebraic comparison; 4.4 proves properness of the actual RH family. |

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

This is an independently reusable part of this roadmap. Its mathematical prerequisites contain no Painlevé target, rank-two condition, degree-four condition, classical scalar equation, or Riemann–Hilbert comparison. A geometric application constructs its own phase family, splitting and any auxiliary forms or comparison maps, then invokes only the general results whose hypotheses it has proved. The module retains actual objects, arrows, pullbacks and comparison isomorphisms.

### Theorems and constructions

| Target | Independently exported result | Additional input a consumer must prove |
|---|---|---|
| 0.1 | Nonlinear connection objects, arrows, curvature and base change | An actual submersion and tangent splitting |
| 0.2 | Local path lifts and compact extension | Continuous time dependence and local uniform phase Lipschitz bounds |
| 0.3 | Holomorphic horizontal germs and parameter dependence | A holomorphic splitting and flatness in the time directions |
| 0.4 | Completeness transferred by proper semiconjugacy | A proper map and compatibility with every partial lift at every point |
| 0.5 | Fundamental-groupoid action, universal-cover sections and descent | Flatness and path completeness, obtained by any valid proof |
| 0.6 | Closed-total-form criterion and symplectic transport | Fiberwise closedness and nondegeneracy, then the stated preservation or closedness hypothesis |
| 0.7 | Admissible evaluation and scalar descent | An actual admissible observation on a complex curve |
| 0.8 | Intrinsic first-jet scalarization | An observation and a proved local jet isomorphism |

The dependency graph deliberately does not route scalarization through symplectic geometry or global continuation. Likewise, the proper-semiconjugacy theorem does not require flatness, while fundamental-groupoid transport does. Meromorphic evaluation can be used for any holomorphic map from a curve, without first proving completeness of a connection.

### Regularity assumptions

The real $`C^1`$ branch is used for individual horizontal path lifting. Curvature, differential-form identities and the smooth flat-product theorem use smooth real data. The complex branch uses holomorphic data on finite-dimensional complex manifolds. No statement silently extends these constructions to singular, nonreduced or infinite-dimensional bases.

A consumer may legitimately supply a connection already proved complete to target:0.5. That is different from defining every connection to contain a proof of completeness. Targets 0.1–0.3 construct the carrier and local solution theory, and target:0.4 gives one sufficient theorem for completeness. Similarly, target:0.6 accepts an independently constructed relative form and proves the relation between flatness, preservation and total closedness; it does not manufacture an application’s relative form by an assumption.

<a id="target-0-1"></a>
### 0.1 Ehresmann connections, morphisms and base change

**General theory.**

Let $`\pi:M\to B`$ be a smooth submersion between finite-dimensional Hausdorff second-countable smooth manifolds without boundary. A real nonlinear connection is a $`C^1`$ vector-bundle splitting $`h:\pi^*TB\to TM`$ with $`d\pi\circ h=\mathrm{id}`$. The holomorphic version uses complex manifolds, a holomorphic submersion and a holomorphic splitting. Surjectivity and properness of $`\pi`$ are not part of the definition. Whenever curvature, differential forms or smooth Frobenius theory are used below, strengthen the real splitting to smooth; the $`C^1`$ branch is retained for individual path lifting.

Define an arrow $`(F,f):(M\to B,h)\to(N\to C,k)`$ by actual smooth maps, or holomorphic maps in the holomorphic category, satisfying $`\rho F=f\pi`$ and $`dF\circ h=k\circ df`$. Composition and identities are the actual compositions and identities of these maps. An isomorphism retains its inverse and compatibility, rather than identifying the objects in a quotient set.

For a smooth or holomorphic map $`u:B'\to B`$, construct the fiber product $`M'=B'\times_BM`$, its projection $`\pi':M'\to B'`$ and the pullback splitting $`h'_{(b',m)}(v)=(v,h_m(du(v)))`$. Prove its tangent-space membership, splitting identity, functoriality on arrows and the canonical coherence isomorphisms for repeated base change. Construct the horizontal and vertical subbundles and, on the smooth or holomorphic branch, the vertical curvature $`K_h(X,Y)=[hX,hY]-h[X,Y]`$. Flatness means $`K_h=0`$. Neither horizontal solution operators, completeness, nor a symplectic form is an input to this construction.

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

**Source scope.** Generic geometric construction. No classical family or comparison morphism is needed.

<a id="target-0-2"></a>
### 0.2 Local horizontal lifting and continuous-time compact extension

**General theory.**

Prove the local existence–uniqueness theorem for $`y'=F(t,y)`$ on finite-dimensional coordinate domains when $`F`$ is continuous in time and locally uniformly Lipschitz in the phase variable. The local constants are uniform on a sufficiently small closed time–phase box. In submersion coordinates $`\pi(z,y)=z`$, a $`C^1`$ base path $`\gamma`$ turns a $`C^1`$ splitting into the equation $`y'=A(\gamma(t),y)\gamma'(t)`$. Construct its local solution by the integral-equation contraction argument, prove uniqueness and restriction, and glue coordinate solutions to the unique maximal horizontal lift through each initial point. For a path with finitely many $`C^1`$ pieces, concatenate lifts at its breakpoints.

Prove the compact-extension lemma: a horizontal lift defined up to a finite endpoint of a base path extends through that endpoint if its image is contained in a compact subset of $`M`$. Use finitely many submersion charts near the compact set, uniform local existence intervals, accumulation and uniqueness to obtain the endpoint value and extension. A cluster point alone is not asserted to be the limit without this local uniqueness argument. The resulting lemma is available for ordinary nonautonomous ODEs in the same coordinate form.

The velocity of a $`C^1`$ path is merely continuous. The autonomized field $`(1,F(t,y))`$ therefore need not be $`C^1`$. The proof must use the stated continuous-time theorem, or a proved reduction to it, rather than import a smooth-vector-field theorem with unmet hypotheses. Continuous dependence on initial data is established under these hypotheses; stronger smooth or holomorphic dependence is claimed only with its additional regularity, and holomorphic horizontal sections are constructed in target:0.3. No complete-lift operator is assumed.

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

**Source scope.** Generic ODE construction and continuation proof. This is the analytic content required by later properness and no-exit arguments; no Riemann–Hilbert map is used.

<a id="target-0-3"></a>
### 0.3 Holomorphic horizontal germs and parameter dependence

**General theory.**

For a holomorphic submersion with a flat holomorphic splitting, construct the unique germ of holomorphic section $`s`$ through each $`x_0\in M_{b_0}`$ satisfying $`\pi s=\mathrm{id}`$, $`s(b_0)=x_0`$ and $`ds=h`$. Prove the local existence theorem with joint holomorphic dependence on the initial point and on auxiliary parameters when the submersion and splitting vary holomorphically in compatible finite-dimensional complex-manifold parameter charts. No assertion over singular or nonreduced parameter bases is implicit.

The proof target includes the complex ODE theorem with holomorphic parameter dependence: construct a convergent Picard iteration on a common polydisc, use uniform convergence to prove holomorphy, and prove uniqueness. In local base coordinates, flatness makes the horizontal coordinate vector fields commute. Prove the commuting-flow identity and compose the local flows to obtain local product charts and horizontal sections; prove their uniqueness and compatibility on connected overlaps. The resulting germ–initial-value correspondence is natural under actual connection isomorphisms and compatible base changes. It is local, and contains no global continuation assertion.

Construct horizontal germs by the local analytic proof, without assuming a horizontal-section theorem as input. Over a one-dimensional complex base, flatness of the holomorphic horizontal line distribution is automatic; in higher base dimension it is a genuine hypothesis.

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

**Source scope.** A general analytic construction and theorem. Specialized isomonodromic horizontal-section results are examples, not proof prerequisites.

<a id="target-0-4"></a>
### 0.4 Completeness transferred by a proper semiconjugacy

**General theory.**

Let $`(M\to B,h)`$ be a real connection from target:0.1. Let $`p:R\to B`$ be any continuous map of topological spaces carrying specified complete continuous transport: for every piecewise $`C^1`$ path $`\gamma:[a,b]\to B`$ with finitely many pieces and every $`r_0\in R_{\gamma(a)}`$, a continuous trajectory $`\beta_{\gamma,r_0}:[a,b]\to R`$ lies over $`\gamma`$, starts at $`r_0`$, and satisfies restriction and concatenation laws. The target need not be a manifold. Let $`F:M\to R`$ be continuous over $`B`$ and proper in the explicit sense that inverse images of compact subsets are compact.

Assume compatibility at every source point: every partial horizontal lift $`x`$ of $`\gamma`$ with initial point $`x_0`$ satisfies $`F(x(t))=\beta_{\gamma,F(x_0)}(t)`$ throughout its domain. Prove that every such base path has a unique horizontal lift on its entire compact interval through every initial point of $`M_{\gamma(a)}`$. Flatness is not needed for this completeness theorem.

Indeed, the complete target trajectory has compact image $`K=\beta_{\gamma,F(x_0)}([a,b])`$. Every partial lift is trapped in $`F^{-1}(K)`$; target:0.2 extends it through each finite endpoint, and local uniqueness glues the extensions. This proof uses properness of $`F`$, not properness of the phase projection $`M\to B`$. It does not use an inverse, injectivity or surjectivity of $`F`$. In particular, a nontrivial compact exceptional fiber is retained in full: the initial point in that fiber matters, and transport is not defined by choosing a preimage of the target trajectory.

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
- The $`C^1`$ path $`\gamma(s)=|s-1/2|^{3/2}`$ is permitted. Its merely continuous velocity is handled by target:0.2; an unproved $`C^1`$ autonomization is not an admissible shortcut.

*Needs:* Internal: 0.1, 0.2.

**Source scope.** The proof mechanism is abstracted from the nonlinear connection and geometric continuation viewpoint exemplified by IIS06, Definitions 2.1–2.2 and Lemma 2.12. Its generic continuous-target formulation and exact hypotheses are proved in this module; those specialized results do not supply a universal proper comparison.

<a id="target-0-5"></a>
### 0.5 Fundamental-groupoid transport, universal covers and descent

**General theory.**

Let a smooth real or holomorphic connection be flat and complete for all compact piecewise $`C^1`$ paths. Completeness is a hypothesis to be proved by the producer of the connection, by target:0.4 or another valid argument. From unique horizontal lifting construct endpoint maps $`T_\gamma:M_{\gamma(a)}\to M_{\gamma(b)}`$, with identity, reversal and concatenation laws. If $`\gamma_1`$ is traversed before $`\gamma_2`$, use the convention $`T_{\gamma_2*\gamma_1}=T_{\gamma_2}\circ T_{\gamma_1}`$.

Prove invariance under endpoint-fixed homotopy. Use local flat product charts, a finite subdivision of a compact homotopy, and uniqueness on overlaps; include the smooth approximation or subdivision step relating continuous homotopies to the piecewise smooth representatives. This constructs an action of the fundamental groupoid of $`B`$. Endpoint maps are diffeomorphisms in the smooth case and biholomorphisms in the holomorphic case. Symplectic preservation is not inferred here.

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

**Source scope.** Generic flat-connection and covering theory. The geometric monodromy viewpoint in IIS06 and the symplectic isomonodromy setting of BOA01 are downstream applications; no claim of symplecticity follows without target:0.6's hypotheses.

<a id="target-0-6"></a>
### 0.6 Symplectic preservation and the closed total two-form

**General theory.**

Let $`V=\ker d\pi`$ for a smooth real or holomorphic submersion, let $`h`$ be a smooth or holomorphic splitting, and let $`\omega`$ be a smooth or holomorphic relative two-form on $`V`$ that is nondegenerate and closed on every fiber. These properties of $`\omega`$ must be proved by its producer. Define $`v^V=v-h(d\pi v)`$ and the actual total two-form $`\Omega(v,w)=\omega(v^V,w^V)`$. Prove that $`\ker\Omega=\mathop{\mathrm{im}}\nolimits h`$.

For a base vector field $`X`$ and vertical fields $`U,V`$, define

```math
(D^h_X\omega)(U,V)=hX\bigl(\omega(U,V)\bigr)-\omega([hX,U],V)-\omega(U,[hX,V]).
```

Compute all components of $`d\Omega`$: on three vertical vectors it is $`d_V\omega`$; on $`(hX,U,V)`$ it is $`D^h_X\omega(U,V)`$; on $`(hX,hY,U)`$ it is $`-\omega(K_h(X,Y),U)`$; on three horizontal vectors it is zero. Deduce, using vertical nondegeneracy, the equivalence

```math
d\Omega=0 \quad\Longleftrightarrow\quad K_h=0\ \text{and}\ D^h\omega=0.
```

Prove separately that the locally defined parallel transport preserves the relative forms if and only if $`D^h\omega=0`$. Thus flatness and preservation are distinct conditions. Under horizontal preservation D^hω=0, flatness and completeness, target:0.5 then yields symplectic global transport; completeness is not needed for the local criterion.

Under the proved horizontal-preservation condition $`D^h\omega=0`$, only for a one-dimensional time base, and after a local symplectic trivialization with the required local phase exactness, derive a Hamiltonian potential for $`h\partial_t=\partial_t+X_H`$ from $`\iota_{X_H}\omega=d_{\rm phase}H`$. In Darboux coordinates the intrinsic total form has the coordinate display $`\Omega=\sum_i dq_i\wedge dp_i+dH\wedge dt`$. Prove the time-only ambiguity in $`H`$ on connected phase charts and the transformation law under time-dependent symplectic coordinates by comparing the actual total forms. Do not use the one-time formula unchanged in several time variables, where horizontal–horizontal components require their own analysis.

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

**Source scope.** Generic tensor and differential-form proof. I23 Definition 11.4 and Corollary 11.8 and BOA01 §7 provide specialized geometric constructions and comparisons, not a theorem that flatness alone preserves an arbitrary relative form.

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

- Use the native Riemann-surface meromorphic-function carrier for the P¹-valued evaluation together with its explicit witness excluding the constant-infinity map. Construct the comparison of the admissible phase observation with that carrier, its pullbacks and order function. For the descent assertions use the covering-space equivalence relation and, on a universal or connected regular cover, its deck action from the covers contract; no nonlinear completeness theorem is a premise of this evaluation theorem.

*Needs:* Internal: 0.1; [Complex manifolds, holomorphic bundles and observations](#dependency-complex) (K1; K3.0; K3.HolomorphicStalk; K3.MeromorphicGermField; K4; K7.1); [Covering spaces and universal covers](#dependency-covers) (Stage 0.2–0.4; Stage 1.5; Stage 2.6–2.8); [Native meromorphic functions on Riemann surfaces](#dependency-curve-functions) (TauCeti.RiemannSurface.MeromorphicFunction; Nonconstant curve pullback and order comparison).

**Source scope.** Generic complex-curve evaluation and descent. IIS06's geometric definition of solution and VDPS09's scalar coordinates motivate applications; arbitrary rational observations do not automatically satisfy admissibility.

<a id="target-0-8"></a>
### 0.8 First jets and second-order equations

**General theory.**

Let $`B`$ be a complex time curve, let $`\rho:E\to B`$ be a holomorphic submersion of relative dimension one, and let $`(M\to B,h)`$ be a holomorphic nonlinear connection. Construct the first-jet bundle $`J^1(E/B)`$ intrinsically: its fiber over $`e\in E_b`$ is the affine space of complex-linear splittings $`j:T_bB\to T_eE`$ of $`d\rho_e`$. Construct its holomorphic transition maps and prove that these splittings correspond to first jets of local holomorphic sections of $`E\to B`$.

An observation $`Q:M\to E`$ over $`B`$ defines

```math
J_Q(x)=\bigl(Q(x),dQ_x\circ h_x\bigr)\in J^1(E/B).
```

On an explicitly specified open $`U\subset M`$, assume and verify that $`J_Q:U\to V`$ is a biholomorphism onto an open $`V\subset J^1(E/B)`$. Transport the splitting to $`V`$ and prove its contact compatibility: along its horizontal curves, the jet coordinate is the derivative of the observed section. This constructs the corresponding second-order dynamics. Prove a bijection between horizontal section germs in $`U`$ and observation-section germs whose first jets lie in $`V`$ and solve that dynamics. The inverse uses the actual inverse of $`J_Q`$; it is not supplied by dimensional counting or by formal elimination.

As a downstream coordinate lemma choose $`(t,q,p)`$ on $`U`$, write $`h\partial_t=\partial_t+A(t,q,p)\partial_q+B(t,q,p)\partial_p`$, and suppose the jet map $`(t,q,p)\mapsto(t,q,A(t,q,p))`$ has the specified inverse $`p=P(t,q,v)`$. Then the intrinsic second-order dynamics has the display

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

**Source scope.** Generic first-jet construction and chain-rule proof. VDPS09 §4.1 and its displayed classical systems are downstream examples of the coordinate lemma, not assumptions or a definition of the scalarized dynamics.

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

The construction takes decorated meromorphic-connection data and produces a moduli family together with its **constructed** flat symplectic nonlinear time connection. A consumer supplies admission data and then uses one theorem, §2.4. Genus zero, rank two, structural polar degree four, one time variable, a named scalar equation and a classified surface are absent from the general hypotheses.

| Input the consumer must provide | Output constructed by this framework |
| --- | --- |
| An admitted curve, polar divisor and local decorations | The stack and rigidified stable moduli on all permitted bundle types |
| A genuine admitted time family and stability chamber | The actual horizontal splitting, flatness and pullback comparisons |
| Determinant mode and its verified conditions | Correct determinant-fiber comparison and dimension theorem |
| Nonemptiness evidence for a claimed full base | A surjective holomorphic nonlinear-connection carrier on that base |
| No scalar equation or Hamiltonian is required | Relative symplectic form, its preservation and the closed total form |

The local scope is deliberately exact: logarithmic full-flag conditions, generic unramified irregular conditions, and the generic totally ramified factorized conditions specified in §1.1. A new local singularity class requires an admission/construction theorem before it can use this export. Logarithmic resonance is retained through flags and lattices. Nonempty fibers, global fixed-determinant transport and positive-genus fixed-determinant smoothness have separate verification obligations.

### Dependencies

The geometric construction uses `0.1` (carrier, morphisms and pullbacks) and `0.6` (generic differential-form calculus). The logarithmic branch, under the hypotheses of 2.5–2.6, also uses `0.3` for local horizontal sections. They do not supply the geometric horizontal splitting or preservation of its trace form: §§2.1–2.2 prove those properties for this construction. Foundational inputs are standard curve/bundle, stack/moduli, coherent-cohomology, formal local algebra and complex-geometry interfaces specified in the external dependency contracts above. No specialized consumer is a prerequisite.

The main owned extensions beyond a source formula are the intrinsic presentation groupoid, certified determinant transport, the full trace-free/trace comparison including ramified relations, early finite-flat unfolding, and coherent comparison maps. In particular, removing a scalar stabilizer is not the same as removing the 2g-dimensional determinant deformation space.

### Application hypotheses

A consumer identifies its local models and verifies the open generic conditions; specifies its actual time family and markings; chooses unfixed determinant or verifies the fixed determinant and its rank-one time transport; chooses a valid stability chamber; and provides nonemptiness evidence wherever it claims a surjective family. It then invokes §2.4. Completeness, proper Riemann–Hilbert comparison, scalar observables, distinguished solutions and classification results are further consumer obligations.

Targets 2.5–2.6 additionally supply a proper logarithmic Riemann–Hilbert semiconjugacy in the exact I13 range. Its consumers verify the hypotheses of NonlinearConnections §0.4 to obtain completeness.

<a id="target-1-1"></a>
### 1.1 Admitted decorated connection data

**General theory.**

Define a groupoid fibered over complex bases whose objects are smooth proper connected curve families, a nonempty ordered set of disjoint marked sections, a structural polar divisor P = Σ mᵢaᵢ, an integer rank r ≥ 1 and degree d, and the local data below. Construct both the unfixed-determinant problem, with all local trace polar data prescribed, and its fiber over a specified compatible line connection (L,∇L); in the latter an isomorphism det(E,∇) ≅ (L,∇L) is part of the object. A connection is a locally free sheaf on the entire curve with a relative meromorphic connection and the chosen decorations, not merely a matrix on a trivial-bundle chart. Morphisms are actual compatible bundle isomorphisms.

The initial admitted domain consists precisely of the local models in I23 §§2–5: logarithmic poles m=1 with full flags and specified graded residues, including resonant and repeated residues; generic unramified poles m≥2 with full filtrations on ma and pairwise distinct leading eigenvalues; and totally ramified generic poles of rank r≥2, m≥2, with wʳ=z and ν(w)=Σₖ₌₀ʳ⁻¹νₖ(z)wᵏ, where ν₀=Σⱼ₌₀ᵐ⁻¹a₀ⱼzʲdz/zᵐ, νₖ=Σⱼ₌₀ᵐ⁻²aₖⱼzʲdz/zᵐ for k≥1, and a₁₀ is invertible. For the last model construct the finite-level factorized ramified structures, their relations and equivalence with the formal model. Roots and formal coordinates are presentations with descent arrows. Mixed blocks, arbitrary slopes, leading-eigenvalue collisions and vanishing a₁₀ require separate extensions of this admitted domain.

Choose rational stability weights in a chamber with stable = semistable whenever that chamber is used; stability tests ∇-invariant proper subbundles. Establish Cartesian pullback with coherent isomorphisms. The initial domain is a source-supported scope for a reusable theory, not a list of classical scalar equations.

**Hypotheses**

- Complex smooth proper connected curve families; r≥1, d∈ℤ; nonempty disjoint marked sections with structural multiplicities; the three explicitly admitted local models; a chosen weight chamber.
- The determinant-fixed mode additionally includes the line connection and its determinant identification, with matching trace polar data and residue/degree relation.

**API**

- Construct restrictions, pullbacks, composition and inverse of arrows, with the associator and identity laws.
- Identify the underlying formal differential module, the induced connection on End⁰(E) of rank r² − 1, and the associated PGLᵣ connection. These latter two are the invariant adjoint/projective outputs. The local matrix A − tr(A)I/r represents the projective connection in a frame; it is not a canonically glued rank-r differential module on E. No square root of the determinant line is chosen.
- Compare equivalent local presentations by ramified descent, keeping parabolic flags and logarithmic lattices.
- Express determinant compatibility by an isomorphism of line connections; derive the residue/degree equation in a chosen local convention.

**Tests and falsification cases**

- On E = O ⊕ O(−1), the determinant has odd degree; a putative global half-determinant twist does not exist. The carrier must still allow this bundle when the prescribed determinant matches it.
- Two logarithmic residues with the same repeated eigenvalue, one scalar and one nonzero Jordan block, are not identified by specifying the eigenvalues. Their allowed parabolic objects and monodromy differ.
- Changing the root w to −w in a rank-two ramified chart changes the displayed branches but gives an equivalent descended object; forgetting the descent arrow fails this check.
- With I23's ramified convention, a rank-two ramified point contributes 2c + 1/2 to the residue/degree relation. Replacing it by 2c changes that relation by 1/2.
- Rank zero is rejected before slope stability or the dimension formula is applied. At r = 1 the adjoint bundle End⁰(E) has rank zero, without changing the required positive rank of E.
- For A = 0 and frame change g = diag(z,1), g⁻¹dg = diag(1,0)dz/z; subtracting half its trace gives diag(1/2,−1/2)dz/z. The scalar discrepancy prevents gluing a rank-two trace-subtracted connection on E, while the induced End⁰(E) and PGL₂ connections glue.

**Supporting constructions owned by this target.**

- On the existing finite locally free sheaf carrier define a relative meromorphic connection as a base-linear first-order Leibniz operator E→E⊗Ω¹(P), its gauge groupoid, tensor/dual/determinant/End⁰ operations, completion at a marked relative Cartier divisor, formal coordinate changes and ramified pullback/descent. Prove every operation on the actual sheaf maps and cocycles. CKG K4 supplies only the nonsingular holomorphic comparison; 1.2 constructs the algebraic-to-analytic comparison. No global trace-subtracted rank-r object or determinant root is introduced.

- For a finite-rank differential module over ℂ((z)), prove the characteristic-zero Levelt–Turrittin decomposition after a finite extension z=wᵉ into exponential factors tensored with regular-singular modules, with constants, refinement of e, formal coordinate change and deck descent. Use FormalLaurentPuiseux for scalar arithmetic only. Separately prove, over the stated nonvanishing/distinct-leading-coefficient base loci, the finite-level factorized models and their coherent base-change comparisons required by I23. A fibrewise decomposition is not a relative decomposition across collisions. 3.4 applies this common result to rank two and structural degree four; 4.1 still owns convergent sectorial realization and Stokes classification.

*Needs:* [Formal scalar and vector-valued Laurent algebra](#dependency-formal-series) (L1–L4; L5–L6 for finite-extension steps in 1.1); [Algebraic vector bundles and finite locally free sheaves](#dependency-bundles) (L0A–L0C; L1A–L1B; L2A–L2B); [Complex manifolds, holomorphic bundles and observations](#dependency-complex) (K1; K3.0; K3.HolomorphicStalk; K3.MeromorphicGermField; K4; K7.1); [Stacks, inertia and restricted coarse-space criteria](#dependency-stacks) (1.18–1.23).

**Source scope and owned proof:** I23, Definitions 2.1, 2.2, 2.4, 2.7–2.8; Definition 3.1, Proposition 3.3, Corollaries 4.3–4.4 and §5. Coordinate-independent packaging and 2-coherent descent are owned proof obligations, not assertions that I23 already proves that packaging.

<a id="target-1-2"></a>
### 1.2 Admitted time families and determinant transport

**General theory.**

Construct the deformation groupoid of the curve, marked poles and admitted irregular polar coefficients, keeping logarithmic residues and formal residue exponents fixed. Start from a smooth atlas of the pointed-curve stack with the finite coordinate jets and open coefficient conditions of I23 §5. Build the coordinate-change arrows and descent, rather than assuming a coarse curve moduli space has no automorphisms. Let B be a smooth complex chart, marking cover, or base change of this admitted time problem whose new base is smooth. The coefficient discriminants and collisions removed from B are fixed by input data. A topological marking of the punctured family is constructed locally and compared on overlaps; an arbitrary topological deformation is not declared an allowed time family.

In unfixed-determinant mode no determinant section is selected. In fixed-determinant mode require a certified strong rank-one transport of the specified determinant: a compatible integrable total line connection, with the induced trace polar data and fixed residues. Construct this rank-one transport locally on a marked contractible time chart by extending the fixed rank-one local system and gluing the prescribed logarithmic lattices and polar primitives; verify its restriction to the initial determinant, polar bound, and cocycle laws. The logarithmic genus-zero case must also have an explicit dlog construction. Global fixed-determinant output requires actual gluing data for these local transports, or a supplied line connection with the same verified properties. A freely varying family of determinant connections is not accepted on the strength of the residue condition alone. This rank-one construction is an owned preliminary result, independent of the rank-r horizontal splitting of §2.1.

Separate external exponent parameters from these time directions. Strong isomonodromy will preserve transported analytic data under admitted variation of irregular type; it does not mean that the irregular coefficients in a fixed coordinate are frozen. No analytic Stokes classification is a premise of the algebraic construction.

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

- Construct the category of finite-dimensional complex locally ringed spaces locally modeled by coherent ideal quotients of polydiscs, retaining nilpotents; prove local-ring morphism, open restriction, coherent closed quotient, open gluing, product and fibre-product universal properties. Use CKG K3 holomorphic germs and RealAnalyticGeometry R3.2 item 0 for the local coherent calculus. Construct analytification of separated finite-type complex schemes by affine embeddings and gluing, proving independence of presentation, functoriality, open/closed and fibre-product comparisons, analytification of coherent and finite locally free sheaves, differentials, meromorphic connections and their pullbacks. Identify smooth analytic spaces of a fixed complex dimension n whose underlying spaces are Hausdorff and second countable with the native CKG manifold carrier modeled on ℂⁿ. For a smooth space with components of different dimensions, make this comparison separately on each open-and-closed dimension locus. Verify the dimension and topological hypotheses for each manifold object used in the nonlinear-connection and meromorphic-moduli constructions. General analytic spaces retain their stated separation properties; smoothness alone does not imply Hausdorffness or a single global model dimension. Use ComplexCurveModuli D2.0 only as the manifold instance comparison. Construct analytic properness/base-change and the proper algebraic-to-analytic comparison used by the moduli families. Algebraic construction takes place over finite-type Noetherian complex bases; arbitrary holomorphic maps from smooth complex bases are handled by this analytic pullback theorem. Every singular Betti target uses this same carrier.

- Consume the stable pointed-curve atlases at their stability hypotheses. Construct the genus-zero one- and two-marked quotient groupoids with their actual PGL₂ stabilizers, the required finite-jet torsors and coefficient-open loci, and their compatible smooth atlases rather than treating them as stable-curve coarse charts. Construct local punctured-family topological markings by relative smooth trivialization preserving marked sections and compare them on overlaps. Construct rank-one determinant transport directly from the flat rank-one local system, prescribed logarithmic lattices, polar primitives and dlog formulas; this construction precedes 2.1 and does not depend on the later rank-r Riemann–Hilbert map.

- Prove the analytification functor and coherent comparison in SGA1 XII1.1–3.1 on complex finite-type schemes, retaining nilpotents. For a proper morphism f:X→S and coherent F, prove (R^q f_*F)^an≅R^q f^an_*(F^an), naturally in F, for q≥0, and its compatibility with the base-change maps under their stated hypotheses (SGA1 XII4.2). For an absolute proper complex X prove Coh(X)≃Coh(X^an), with the coherent cohomology comparison (XII4.3–4.4); the projective step uses Serre no.12 Theorems1–3, and the proper step uses Chow and dévissage. Transport meromorphic connection data through the O-linear principal-parts/jet presentation of a Leibniz operator, not by falsely treating ∇ as an O-linear map. These comparisons supply the algebraic/holomorphic curve and bundle objects used in the RH construction. They do not assert algebraization of an arbitrary analytic family over a nonproper analytic base.

- For a smooth proper curve family with a nonempty relative marked divisor, prove that the divisor has positive degree on every geometric fiber and is relatively ample. Locally on the Noetherian algebraic base choose a sufficiently positive multiple that is relatively very ample, construct the projective embedding used by the Quot presentations, and record comparisons of the chosen powers and bases of sections by passing to a common positive multiple. The comparison of the resulting moduli presentations is proved after their construction in 1.3. Thus projectivity and a polarization for the bounded construction are obtained from the stated input; they are not silently added to every proper family.

*Needs:* Internal: 1.1; [Marked-curve charts](#dependency-curves) (ComplexCurveModuli D0.3, D3–D5; SchemeAndStackFoundations 4.15); [Complex manifolds, holomorphic bundles and observations](#dependency-complex) (K1; K3.0; K3.HolomorphicStalk; K3.MeromorphicGermField; K4; K7.1); [Coherent analytic module sheaves](#dependency-analytic-coherence) (R3.2 item 0); [Cohomology, duality and curve degree](#dependency-cohomology) (2.2; 2.6; 2.20; 3.3); [Proper coherent direct images and base change](#dependency-proper-cohomology) (Layer C); [Chow lemma for the proper GAGA proof](#dependency-chow) (4.12, chow_lemma subtarget only; prerequisites 0.9 and 4.11).

**Source scope and owned proof:** I23 §5 constructs the curve/jet/coefficient time scheme and §§10–11 use it. The general determinant-transport and coordinate-descent interfaces are additional owned obligations; they cannot be replaced by a claim that every determinant family admits a lift.

<a id="target-1-3"></a>
### 1.3 Stable moduli on all bundle types

**General theory.**

Construct the stack of stable objects of §1.1 over the admitted time problem §1.2, its scalar rigidification and its relative coarse moduli space. Use bounded parameter spaces of filtered bundles and impose the connection and factorized-structure relations. Prove the moduli universal property and finite type, and prove separatedness and quasi-projectivity for the relative coarse (rigidified phase) family in the source-supported setting. No separatedness assertion is made for the unrigidified stable stack with Gm inertia. Work with all permitted bundle types. A matrix presentation covers only its actual locus. Construct an étale universal-object cover and descend all subsequent tensors; do not assume a universal vector bundle on the coarse space.

In unfixed-determinant mode the stable scalar inertia is Gm. With a specified determinant identification it is μr; determinant fixing and rigidification are different operations. Construct the determinant morphism and the comparison with the moduli problem having specified determinant, reserving the smoothness and relative dimension calculation for §1.5. Establish the needed coarse-space base-change comparison through these local gerbe presentations. Nonemptiness is an additional consumer assertion, not a theorem for every numerical input. Locally empty moduli are retained; the family becomes a surjective analytic submersion only after restricting B to its open nonempty-fiber locus.

**Hypotheses**

- The numerical and admitted local data of 1.1 and the time family of 1.2; a fixed stability chamber; all bundle types. No nonemptiness assumption is imposed on the construction.

**API**

- Identify geometric points and families up to the appropriate arrows, with an explicit coarse-map universal property.
- Prove restriction and admissible base-change comparisons, including determinant fibers.
- Compare framed charts with their actual moduli loci. Fixed splitting-type strata on ℙ¹ are locally closed; the balanced locus is open, including the trivial-bundle locus in degree zero. Prove each inclusion and closure comparison, and record the complement of every chart used.
- For a change of weights, identify the actual common stable locus and the resulting comparison there; do not export an automatic global isomorphism.

**Tests and falsification cases**

- A stable object may have scalar automorphisms before rigidification. A set-valued quotient that claims all stabilizers were trivial fails this example.
- A family can leave a trivial-bundle chart by bundle jumping while remaining in the moduli space. Its phase path is not declared singular for that reason.
- In the extension family 0 → O(−1) → E_t → O(1) → 0, E₀ = O(−1) ⊕ O(1) while E_t = O ⊕ O for t ≠ 0. The two splitting strata pull back to {0} and its complement in A¹; the first is not open. The full connection moduli must retain such bundle jumps on the permitted connection locus.
- An admitted totally ramified generic local model is irreducible as a formal differential module, hence a global connection containing it has no proper ∇-invariant subbundle and is stable for every weight (I23 Remark 2.9). This assertion is not exported to arbitrary ramified blocks.

**Supporting constructions owned by this target.**

- After proving boundedness of the filtered connection objects, construct the finite-type parameter schemes using SSF4.14, specify the reductive framing group, linearization and Hilbert–Mumford comparison with the chosen rational parabolic weights, and prove finite generation and the required stable geometric/affine categorical quotients. Prove the actual moduli universal property, separatedness and quasi-projectivity in the I23-supported scope. Construct central Gm rigidification by fppf quotient of Isom sheaves and stackification, prove its gerbe and base-change universal properties, and compare with the GIT coarse family; separately compare μr inertia when a determinant identification is included. State exactly where finite-inertia Keel–Mori applies. Prove scalar action on each descended tensor is trivial and check coarse/base-change comparisons on these presentations.

- For each finite-type algebraic curve/time chart, prove that its analytified bounded framed Quot presentation represents the corresponding analytic families after arbitrary holomorphic base change from the smooth complex bases allowed in 1.2. Establish local analytic generation after a sufficiently positive twist, coherent analytic pushforward/base change, the holomorphic framing and factorized-connection equations, and descent of the actual relation. This is the analytic moduli comparison needed by 2.3, rather than a global algebraization claim for the new base. The analytic quotient is identified with the analytification of the constructed GIT quotient through these presentation maps. Framed deformation and versality comparisons using the actual deformation complex are proved in 1.4, after this GIT construction, to avoid a dependency cycle.

- Compare the bounded Quot/GIT presentations arising from the positive powers and projective embeddings constructed in 1.2. First construct both presentations and their actual functor-of-points maps, then use their proved moduli universal properties to construct inverse comparison maps and the composition/base-change laws. This proves independence of the auxiliary polarization and framing choices within the stated curve stability problem.

*Needs:* Internal: 1.1, 1.2; [Quot/Hilbert and parameter schemes](#dependency-quot) (4.14); [Stacks, inertia and restricted coarse-space criteria](#dependency-stacks) (1.18–1.23); [Quotient predicates](#dependency-quotient-predicates) (1.17); [Elementary deformation theory](#dependency-deformation) (4.2–4.6).

**Source scope and owned proof:** I23 Theorem 5.1 and §§7–10; fixed-determinant and coarse-base-change comparisons are explicitly constructed extensions of the displayed moduli problem.

<a id="target-1-4"></a>
### 1.4 The differential-operator deformation complex and trace pairing

**General theory.**

Construct the deformation complex from infinitesimal endomorphisms preserving the local structures, permitted variations of the connection, and all relations of the factorized ramified structures. Begin with the two-term connection complex G•. In the ramified case retain the full cone F• = Cone(G• → S•ram[1])[−1], including degrees 0, 1 and 2, both differentials and the local factorization terms. A two-term replacement requires a proved quasi-isomorphism. Identify infinitesimal automorphisms, tangent vectors and obstruction classes by hypercohomology and construct the trace/Serre-duality pairing.

The commutator with ∇ is a ℂ-linear first-order differential operator and is generally not O-linear. Work with sheaves of ℂ-vector spaces, coherent underlying terms, Čech totalization and the actual termwise duality calculation; do not silently place this differential in D(QCoh). Prove presentation and cover independence by chain maps and quasi-isomorphisms. Construct the trace morphism to the determinant deformation complex and its trace-free fiber, with signs and local factorization compatibility. This target supplies the comparison maps; §1.5 must prove the resulting smooth determinant-map and dimension statements. Scalar gauge automorphisms and genuine infinitesimal determinant variation are separate directions.

**Hypotheses**

- The stable moduli problem of 1.3 with the admitted filtrations and factorized ramified relations; either unfixed determinant or its specified fiber. The complex and pairing are outputs.

**API**

- Give the differential, local compatibility equations and the map from an infinitesimal family to its cocycle.
- Prove gauge-change and coboundary compatibility in both directions.
- Construct the trace-free/determinant decomposition and the dual complex with its signs.
- Prove naturality of the pairing under input isomorphisms and admissible base change.

**Tests and falsification cases**

- An infinitesimal gauge change by u changes a connection representative by the commutator differential of u; its tangent class is zero.
- Without determinant identification stable scalar automorphisms have a one-dimensional infinitesimal direction. Fixing the identification removes that direction in characteristic zero, although finite μr remains until rigidification; this does not remove the 2g determinant deformation directions by itself.
- With ω = dq ∧ dp, the ordered tangent pair (∂q, ∂p) has pairing +1 and the reversed pair −1; a reversed trace convention must be corrected before transport formulas are used.

**Supporting constructions owned by this target.**

- Build the total Čech complex in sheaves of ℂ-vector spaces, with coherent underlying terms and the actual C-linear first-order differentials, then prove refinement, cover independence, cone signs, trace pairing and termwise Serre-duality compatibility. Do not apply D(QCoh) to a non-O-linear differential. Identify automorphisms, tangents and obstructions by the actual lifting cocycles, for the ramified three-term cone including all factorization relations. Extend the elementary small-extension framework to the finite-dimensional square-zero kernels needed here, proving linearity, direct sums and base-change naturality rather than reading them into SSF4.5.

- For the bounded deformation complexes on a proper complex curve, construct analytification of each differential operator through its finite-order principal-parts presentation. Prove the principal-parts analytification comparison and compatibility with composition, so that the analytified differential still squares to zero. Apply proper coherent GAGA term by term and the convergent hypercohomology spectral sequences to obtain the algebraic–analytic hypercohomology comparison, including the actual local ramified cone. This follows the proof route of Deligne II6.6. The complex is a complex of sheaves of complex vector spaces with coherent O-module terms; its connection differential is not treated as an O-linear map in the derived category of coherent O-modules. Relative base-change claims are separate and retain the exact flatness and cohomological hypotheses of the source being used.

- For the relative family p:C→B retain the p⁻¹O_B-module action on the sheaves and the p⁻¹O_B-linearity of the connection differential. It is not O_C-linear. Construct the Čech total complex, trace, principal-parts comparisons and every claimed base-change map with that base-module action, then prove compatibility. Absolute ℂ-linear cohomology is its fiberwise comparison, not a substitute for this relative structure.

- Construct framed infinitesimal and versal charts from the actual lifting equations and the deformation complex. Prove the tangent/obstruction and lifting comparison with the moduli already constructed by bounded GIT in 1.3. This comparison is not used to assume that earlier moduli construction.

*Needs:* Internal: 1.3; [Cohomology, duality and curve degree](#dependency-cohomology) (2.2; 2.6; 2.20; 3.3); [Elementary deformation theory](#dependency-deformation) (4.2–4.6).

**Source scope and owned proof:** I23 §6, (6.9), Proposition 6.3 and §7, Proposition 7.2. The fixed-determinant fiber and its compatible trace-free complex are explicit owned comparisons.

<a id="target-1-5"></a>
### 1.5 Smoothness, dimension and the determinant fiber

**General theory.**

Use §1.4 to prove obstruction vanishing and smoothness of the stable moduli family in the admitted domain. Identify its relative tangent bundle by first hypercohomology. For unfixed determinant and a nonempty stable fiber, derive dim M_b = 2r²(g−1)+2+r(r−1)deg P. The local trace polar parts are fixed in this formula.

For the fixed-determinant export, construct the determinant moduli of line connections with those trace polar parts, locally an affine bundle of rank g over Picᵈ(C_b), and prove that its tangent complex is the regular de Rham complex O_C → Ω¹_C. Over ℂ, build a compatible trace map and scalar section using 1/r at the full deformation-complex level, including ramified relations. Prove the induced determinant map is smooth on the stated stable locus, with surjective tangent map onto a 2g-dimensional determinant tangent space. Identify the specified-determinant coarse family with the relevant fiber after its gerbe comparison. Only then deduce dim M_b^det = 2(r²−1)(g−1)+r(r−1)deg P. Prove that the trace pairing splits orthogonally into the trace-free and scalar directions and is nondegenerate on the fixed-determinant tangent space. Rank-one fixed-determinant fibers are zero-dimensional.

The fixed-determinant dimension and symplectic theorems use the deformation-functor comparison, smooth determinant map and orthogonal trace splitting constructed in 1.5. Prove these comparisons on the full stated complex before restricting to a determinant fiber. The unfixed-determinant theorem and the genus-zero dimension agreement have the scopes stated above.

**Hypotheses**

- The moduli construction of 1.3 and actual complex and trace pairing of 1.4; the admitted local models over ℂ.
- Dimension assertions concern nonempty stable fibers. The fixed-determinant conclusion additionally requires the determinant-map comparison proved in this target.

**API**

- Identify the relative tangent sheaf and prove base-change compatibility for tangent and obstruction calculations.
- Construct the determinant deformation map, its scalar section and the trace-free fiber, including all local compatibility equations.
- Prove smoothness and orthogonal trace decomposition before subtracting 2g determinant directions.
- Return separate unfixed- and fixed-determinant dimension theorems with their exact hypotheses.

**Tests and falsification cases**

- Genus zero, rank two and degree four give −8 + 2 + 8 = 2; structural degree five instead gives 4.
- Fixing the determinant in positive genus removes 2g directions when the determinant-map comparison applies; the genus-zero coincidence cannot be exported unchanged.
- At r = 1 and g = 1 the unfixed-determinant formula gives 2, and fixing the entire line connection gives 0. The rank-zero input that would incorrectly give 2 is outside the domain.
- For g=1, r=2 and deg P=1, the unfixed formula gives 4 and the fixed-determinant formula gives 2 whenever the corresponding stable fiber is nonempty and the comparison holds; removing only the scalar stabilizer would miss this difference.

**Supporting constructions owned by this target.**

- Construct the fppf relative Picard algebraic space for the projective flat finitely presented complex curve families used here, over locally Noetherian bases, under the universal-functions condition O_B≅p_*O_C after every base change. Include coherent base-change comparison and the line-bundle deformation argument establishing relative smoothness by the affine square-zero tests and relative cohomological-dimension theorem specified below; state identity-component and constant-dimension hypotheses explicitly, retaining nonreduced curve and base tests. JacobianChallenge C–D supplies only the coherent floor and its fixed-field geometrically integral specialization. For smooth marked curves construct the relative Picᵈ, its rigidified Poincaré comparison and the affine torsor of line connections with fixed compatible trace polar parts. Prove its regular de Rham tangent complex, dimension 2g, and the full trace/scalar splitting and smooth determinant map before exporting a fixed-determinant dimension or symplectic theorem. The nonreduced-curve Picard subtheorem supplies 5.1 without using any Painlevé-specific fact.

- Test formal smoothness locally on affine square-zero thickenings T₀↪T with quasi-coherent ideal I. Flatness identifies the ideal of C_T0 in C_T with p*I. Construct the obstruction in H²(C_T0,p*I), the torsor of isomorphism classes of lifts with a specified restriction isomorphism under H¹(C_T0,p*I), and their infinitesimal automorphisms from H⁰. Prove R^q p_*(p*I)=0 for q>1 by proper relative dimension at most one and use the affine base and Leray to obtain H²=0. Handle general test bases by open/fppf descent and apply the local finite-presentation criterion to deduce smoothness. Do not infer absolute H² vanishing on a nonaffine base from fiber dimension. See PICREL tags 0D2C, 0DNI, 0DPJ and 0DPK.

*Needs:* Internal: 1.3, 1.4; [Cohomology, duality and curve degree](#dependency-cohomology) (2.2; 2.6; 2.20; 3.3); [Elementary deformation theory](#dependency-deformation) (4.2–4.6); [Picard over a field and Picard foundations](#dependency-field-picard) (JacobianChallenge Layer D; SchemeAndStackFoundations 1.1, 2.6, 3.4, 4.6, 4.14); [Proper coherent direct images and base change](#dependency-proper-cohomology) (Layer C).

**Source scope and owned proof:** I23 Theorem 7.5 and its determinant-obstruction argument; fixed-determinant smoothness, full cone splitting and orthogonality are the extensions proved in 1.5 and used by its fixed-determinant conclusions.

<a id="target-1-6"></a>
### 1.6 Finite-flat unfoldings and closed symplectic forms

**General theory.**

Construct the relative trace two-form on the moduli family, descend it from the universal-object cover and prove nondegeneracy using §1.4 and §1.5. Prove closedness by the following auxiliary construction. Over a smooth integral auxiliary base H, replace the fixed polar divisor by the finite-flat divisors of I23 §8. At a ramified point use ∏ⱼ₌₁ᵐ⁻¹(z−hʳqⱼ)(z−hʳ), with qⱼ distinct, nonzero and different from 1. Construct the moduli algebraic space of simple connections with the unfolded factorized local structures, an étale universal-object cover, the relative deformation complex and trace form. Reapply the boundedness and deformation arguments to this new family; it is not covered merely by §1.1's disjoint marked sections.

Prove smoothness over H and identify the original stable moduli, complex and form with the appropriate open part of the central fiber. On the dense open parameter set with generic separated poles, construct both quasi-isomorphisms from the diagonal deformation complex to the unfolded complex and the logarithmic parabolic complex, respecting trace forms. Prove closedness of the logarithmic trace form by the Čech cup-product/trace calculation and gauge descent and transfer it through these two comparisons. The relative sheaf of three-forms on this smooth family over an integral base is locally free, and restriction to the indicated dense open detects zero. Deduce d_relative ω=0 on the whole family, restrict to the central stable locus and descend. A later nonreduced base change uses this proved identity; density on a nonreduced base is not a substitute.

The fixed-determinant result is the pullback of this closed form to the determinant fiber, with nondegeneracy supplied only after §1.5's orthogonality comparison. No scalar Hamiltonian or classification of phase surfaces enters this construction.

**Hypotheses**

- §§1.3–1.5 in the admitted domain. Smoothness, the auxiliary simple-connection family, generic comparison maps and closedness are outputs.
- For the fixed-determinant symplectic export, the determinant-fiber comparison and nondegeneracy gate in 1.5.

**API**

- Construct the finite-flat unfolding, the moduli of simple connections and the universal-object cover, and identify their central fibers.
- Construct both diagonal-complex comparison maps and prove compatibility with the trace pairing.
- Prove nondegeneracy and closedness independently, including descent and later base-change compatibility.

**Tests and falsification cases**

- A skew pairing which vanishes identically is closed but is not symplectic; nondegeneracy must follow from the actual duality computation.
- For r = 2, local order 2 and q₁ = 2, the unfolding equation is (z − 2h²)(z − h²). Its fiber at h = 0 is z² and at h = 1 is (z − 2)(z − 1); modulo h² it is again z². Check the central and pulled-back complexes and forms, rather than identifying this family with fixed distinct sections.
- Delete all later applications and every scalar equation: the finite-flat unfolding, its two generic comparison maps and the closedness proof must still be stated and constructible here.

*Needs:* Internal: 1.3, 1.4, 1.5; [Cohomology, duality and curve degree](#dependency-cohomology) (2.2; 2.6; 2.20; 3.3); [Elementary deformation theory](#dependency-deformation) (4.2–4.6); [Algebraic vector bundles and finite locally free sheaves](#dependency-bundles) (L0A–L0C; L1A–L1B; L2A–L2B).

**Source scope and owned proof:** I23 Theorem 8.1, Propositions 8.2–8.3 and the complex preceding (8.2). The meromorphic-moduli theory contains every construction needed by that unfolding proof.

<a id="layer-2"></a>

## Layer 2: Isomonodromic deformations and the logarithmic Riemann–Hilbert correspondence

<a id="target-2-1"></a>
### 2.1 Strong integrable extensions and horizontal splittings

**General theory.**

For a time tangent at a moduli point, construct a strong integrable extension of the universal connection over the corresponding dual-number deformation. On the moving total curve X let D be the sum of the marked relative Cartier divisors with coefficient one, formed on the smooth ambient family before pullback to the infinitesimal base. The allowed total-form pole filtration is Ω¹_X(log D) ⊗ O_X(P−D), relative to any fixed auxiliary base. Require integrability and preservation of the kernel lattices attached to the local filtrations, namely kernels of E → E|_{mᵢaᵢ}/Fᵢ,k with the relevant structural thickening and the additional factorized relations. Preserving flags separately on each fiber is insufficient. Prove the coordinate lemma that, in a moving polar coordinate z, the allowed forms are generated by dz/zᵐ and dε/zᵐ⁻¹; the time coefficient is regular at a logarithmic point.

Prove existence and uniqueness up to the specified isomorphism restricting to the identity on the central fiber, within this strong extension class. Glue the local lifts and descend from the universal-object cover. Construct the actual O-linear splitting h:π*TB→TM and prove dπ∘h=id. In fixed-determinant mode prove that taking determinant of the constructed extension agrees with the certified rank-one transport of §1.2, so that h is tangent to the moving determinant fiber. This is a comparison theorem, not a claim that an arbitrary determinant section is preserved. Existence of h, integrability and preservation of the trace form are not input axioms.

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

- Using 1.1 formal carriers and 1.4 actual deformation cocycles, construct the strong infinitesimal total connection over each admitted dual-number time direction, with pole module Ω¹(log D)⊗O(P−D), kernel lattices and factorized relations. Prove existence and uniqueness of the deformation class with its specified central identification, preserve the determinant transport, and prove overlap/descent comparisons; scalar infinitesimal automorphisms must remain accounted for before rigidification. 2.2 proves mixed-time flatness and trace-form preservation separately, and 2.3 proves coherent arbitrary holomorphic base change. A formal oper isomonodromy groupoid or a fibrewise formal normal form is not the holomorphic time splitting.

*Needs:* Internal: 1.1, 1.2, 1.3, 1.4, 1.5, 0.1; [Elementary deformation theory](#dependency-deformation) (4.2–4.6).

**Source scope and owned proof:** I23 Definition 10.1, (10.1), Lemmas 10.3–10.6, Propositions 10.7/10.10 and (11.2); determinant compatibility and intrinsic pole-filtration comparison are owned proof obligations.

<a id="target-2-2"></a>
### 2.2 Flatness, trace-form preservation and the closed total form

**General theory.**

Compare the two-parameter strong extensions and their mixed infinitesimal term to prove h([v,w])=[h(v),h(w)]. Prove that holomorphic integral sections carry the corresponding strong integrable total connections. This bracket calculation uses the algebraic extension comparison, not a global Riemann–Hilbert theorem.

Use the actual trace cocycles and strong-extension comparison to prove that the constructed horizontal variation preserves the relative symplectic form ω. Flatness of an arbitrary splitting alone would not imply that assertion. Define Ω(v,w)=ω(v−h(dπv),w−h(dπw)), prove dΩ=0 and ker Ω=im h, and deduce preservation of ω by local horizontal transport. The generic differential-form equivalence in NonlinearConnections §0.6 can organize this final calculation, but it cannot supply trace-form preservation as an unproved premise. In a one-dimensional time chart, only after a symplectic trivialization and local exactness have been supplied, derive Ω=dq∧dp+dH∧dt in relative dimension two, and the analogous sum in higher even dimension. Scalar Hamiltonians are local primitives attached to charts.

**Hypotheses**

- The actual strong splitting of 2.1 and the relative symplectic form of 1.6, with the determinant gate where applicable. Flatness and preservation of that form are outputs.

**API**

- Compute the mixed two-parameter extension term and obtain the bracket identity and flat horizontal distribution.
- Recover the relative form by vertical restriction and the horizontal distribution as the kernel.
- Prove admissible base-change naturality for the relative form, the actual splitting and the closed total form.
- Compare two Hamiltonian potentials in a fixed chart: their difference is constant along connected phase fibers.
- State the extra generator term for a time-dependent symplectic change of coordinates through equality of the extended two-forms.

**Tests and falsification cases**

- For H = p²/2, contraction with ∂t + p∂q annihilates dq ∧ dp + p dp ∧ dt; using the opposite sign does not.
- H and H + t² give the same vertical vector field and extended two-form, but different scalar functions.
- On a symplectic fiber, Ω has no nonzero vertical kernel vector; degenerating ω to zero would fail this characterization.
- On ℂ²×ℂ with ω=dq∧dp, h(∂t)=∂t+q∂q is flat because the base has dimension one, but its flow scales ω. This fails the trace-form preservation obligation.

*Needs:* Internal: 1.4, 1.6, 2.1, 0.6; [Complex manifolds, holomorphic bundles and observations](#dependency-complex) (K1; K3.0; K3.HolomorphicStalk; K3.MeromorphicGermField; K4; K7.1).

**Source scope and owned proof:** I23 Theorem 11.6, Definition 11.4 and Corollary 11.8. The flatness proof and the trace-form variation are separate obligations.

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
- Preserve source and target maps of the NonlinearConnections morphisms and specify the exact domains of all parameter correspondences.

**Tests and falsification cases**

- For f:B′→B and g:B″→B′, compare direct (f∘g)* construction with g*f* and check the three-composition pentagon rather than choosing unrelated identifications.
- A weight wall crossing changes the stable locus and is not a presentation isomorphism unless an actual common stable domain has been specified.
- The base map t=s² pulls h(∂t) back to h′(∂s)=(∂s,2s h(∂t)); at s=0 the horizontal vector still projects to ∂s, so the base map need not be a local isomorphism.

*Needs:* Internal: 1.1, 1.2, 1.3, 1.4, 1.6, 2.1, 2.2, 0.1; [Stacks, inertia and restricted coarse-space criteria](#dependency-stacks) (1.18–1.23).

**Source scope and owned proof:** I23 Propositions 10.7 and 10.10 supply uniqueness used by the comparison. Full intrinsic base-change/2-coherence is an owned theorem target, not a quotation from a coordinate formula.

<a id="target-2-4"></a>
### 2.4 Isomonodromic connections on meromorphic-connection moduli

**General theory.**

Assemble §§1.1–2.3 into a construction from each admitted decorated time problem to its rigidified stable phase family and, over the open nonempty-fiber part of a smooth analytic time base, a holomorphic flat symplectic nonlinear connection (π:M→B,h,ω) in NonlinearConnections §§0.1 and 0.6, together with its closed total form Ω. The inputs contain curve and local connection data, a stability chamber and the determinant mode; they do not contain h, a scalar differential equation or a classification of surfaces. The result applies in arbitrary genus and admitted rank/polar degree for unfixed determinant; fixed-determinant export requires the separately proved comparison in §1.5 and the certified time transport in §1.2.

Give a single consumer certificate listing local-model admission, the actual time base, determinant verification, weight choice and nonemptiness evidence. Return the geometric carrier, the constructed tensors, dimension theorem at its exact scope, naturality and coherent pullback laws. A consumer proves only these admission conditions and its further specialized results. In particular neither relative dimension two nor one-dimensional time belongs to this construction theorem. Completeness, proper Riemann–Hilbert comparison, chosen observables, scalarization and distinguished solutions require their own downstream hypotheses and proofs. The construction theorem has the stated admission hypotheses and uses the named preceding construction and comparison theorems.

**Hypotheses**

- The admitted geometric input and time problem of 1.1–1.2; stable construction of 1.3–1.6 and the actual h, flatness and naturality from 2.1–2.3.
- Restrict to the open nonempty-fiber time locus for a surjective nonlinear-connection carrier; a consumer must provide nonemptiness if its whole proposed base is claimed.
- Fixed-determinant export additionally passes the independent determinant-fiber and rank-one transport gates.

**API**

- Export a construction theorem, not an alias for a specialized phase space: its conclusion supplies π, h, ω, Ω and all their laws from the admitted geometric input.
- Supply the common consumer certificate and distinguish construction, nonemptiness and completeness obligations.
- Prove reuse under base change and presentation equivalence through 2.3, without rerunning a case classification.

**Tests and falsification cases**

- Removing every specialized consumer, every relative-dimension-two selection and every classical equation leaves the input/output statement and all local prerequisites intact.
- Five logarithmic points on ℙ¹ in rank two, fixed determinant and a nonempty stable locus give relative dimension 4 and a two-dimensional configuration base; the construction theorem must accept that input.
- A tuple of arbitrary formal singularities is not admitted merely because its dimension formula happens to be positive; each local model and determinant/time certificate must be verified.
- A holomorphic flat symplectic connection can have incomplete horizontal curves; this export alone cannot justify global continuation of all initial conditions.

*Needs:* Internal: 1.1, 1.2, 1.3, 1.4, 1.5, 1.6, 2.1, 2.2, 2.3, 0.1, 0.6.

**Source scope and owned proof:** This assembly and its consumer contract are the roadmap’s mathematical design. I23 supplies the admitted unfixed-determinant construction model; the additional determinant and coherence comparisons are proved in the specified meromorphic-moduli targets.

<a id="target-2-5"></a>
### 2.5 Marked logarithmic Betti family and the full Riemann–Hilbert map

**General theory.**

For the logarithmic subproblem of §1.1, construct the topologically marked family of representation varieties of the punctured curves, their affine conjugacy quotients and the prescribed-local-character subfamilies. Keep the residue-exponent parameter λ on the de Rham side and the exponential characteristic-polynomial parameter a=rh(λ) on the Betti side. Repeat the bounded construction of §1.3 over the simultaneous residue parameter space Λ, and prove its comparison with the I13 family; the horizontal splitting is relative to fixed λ, so varying λ is not a time direction. On a marking cover the Betti family is identified by transport with a fixed character variety times the time base. This gives complete transport along all admissible time paths even when the character variety is singular; no smooth Betti tangent bundle is required.

Construct the holomorphic Riemann–Hilbert map from the entire stable logarithmic parabolic moduli of §1.3, including allowed reducible and resonant objects and all bundle types. Define it through the local system of horizontal sections and its conjugacy-quotient class, and prove descent from the universal-object cover. Identify this logarithmic moduli problem, its weights and residue ordering with the exact moduli functor used by I13; a matrix-chart comparison is insufficient. Prove that the actual strong splitting of §2.1 is semiconjugate to the marked Betti transport at every point, using the total integrable extension with its logarithmic lattices and the analytic dependence of local solutions. Prove local horizontal-lift existence independently of Riemann–Hilbert invertibility. At resonant or reducible points the map may have positive-dimensional fibers and is not replaced by an inverse map.

For a certified determinant transport, show that taking determinant of monodromy agrees with the rank-one Riemann–Hilbert map and that the prescribed determinant is a transported Betti section. Export the Hausdorff locally compact marked target and the full semiconjugacy as inputs to NonlinearConnections §0.4, without asserting properness until §2.6 or deducing source completeness here.

**Hypotheses**

- The logarithmic local subproblem of 1.1, the admitted pointed-curve time problem and fixed residue exponents of 1.2, and the actual stable moduli and strong connection of 2.4.
- A topological marking cover of the punctured-curve family. Fixed-determinant conclusions require the verified determinant transport. The Betti target is allowed to be singular.

**API**

- Construct the marked affine Betti target with its complete path transport and state the retained residue/character parameter map.
- Prove the all-points Riemann–Hilbert semiconjugacy for the actual strong source splitting, including the map on singular target strata.
- Identify the full logarithmic moduli functor with I13 and prove compatibility with determinant, presentation change and analytic base change.

**Tests and falsification cases**

- An open subset where Riemann–Hilbert is an isomorphism does not include all stable resonant or reducible objects. The semiconjugacy statement must be checked on their actual moduli points.
- Two residue parameters differing by allowed integer shifts can have the same local monodromy eigenvalues; retain λ rather than identifying the de Rham families over the a-parameter.
- A singular affine character variety is still a Hausdorff locally compact analytic space with complete marked transport; requiring a nonsingular target would discard exactly the strata needed by the proper-map continuation argument.

**Supporting constructions owned by this target.**

- Starting with CKG K4 on punctured curves, construct logarithmic extensions with chosen exponent lifts, parabolic flags and actual logarithmic lattices, prove the monodromy convention exp(−2πiλ), and prove the relevant regular-singular algebraic/analytic comparison. Include resonance, repeated residues and integer shifts of exponents with their lattice modifications; retain all bundle types. The equivalence keeps the lattice/flag data on the local-system side; forgetting them gives the generally noninjective RH map, not an inverse. Prove analytic family dependence and descent on the universal-object/marking covers.

- 2.5 constructs the finite-type representation varieties and their reductive affine conjugacy quotients using the proven 1.3 invariant-theory prefix, then applies 1.2 analytification and proves Hausdorff/local-compactness and marked product transport, including singular points. 4.2 constructs the wild/Stokes framing groupoid and quotient at its actual reductive or explicitly descended stages; unipotent local Stokes groups do not by themselves permit an arbitrary GIT quotient. Prove root/deck isotopy and ramified descent, stabilizer compatibility and all-stratum holomorphic maps. Nothing in SSF1.17 supplies these constructions automatically.

- Deligne II5.4 constructs the extension for a chosen section of ℂ→ℂ/ℤ; it explicitly does not make that canonical extension tensor-compatible. Consequently determinant compatibility is proved on the actual logarithmic lattices and residue sums, with any required integer lattice shifts. The characteristic polynomial of monodromy has eigenvalues exp(−2πiλ); equality of the monodromy matrix with exp(−2πi Res) up to conjugacy uses the appropriate nonresonance condition (II5.6) and is not asserted at every resonant point. Keep these distinctions in both the full RH map and the rank-one Cartesian determinant comparison.

*Needs:* Internal: 1.1, 1.2, 1.3, 2.1, 2.2, 2.3, 2.4, 0.3; [Complex manifolds, holomorphic bundles and observations](#dependency-complex) (K1; K3.0; K3.HolomorphicStalk; K3.MeromorphicGermField; K4; K7.1); [Marked-curve charts](#dependency-curves) (ComplexCurveModuli D0.3, D3–D5; SchemeAndStackFoundations 4.15).

**Source scope and owned proof:** I13 §2 (the marked Riemann–Hilbert map), §6 and §8 (isomonodromic deformation). Full comparison of its moduli functor and strong splitting with this framework, including exceptional strata and determinant compatibility, is explicitly owned.

<a id="target-2-6"></a>
### 2.6 Properness of the logarithmic Riemann–Hilbert family

**General theory.**

For the full stable logarithmic parabolic moduli problem identified in §2.5, prove family properness of the marked Riemann–Hilbert map to the character family pulled back along the residue map rh:Λ_r^(n)(d)→A_r^(n). Use the complete exponent target (Rep_r(C,marked points)×_T T̃)×_{A_r^(n)}Λ_r^(n)(d), not only the generic smooth character locus. The exact source range is rank r≥2, n≥1, generic weights with stable=semistable, and rn−2r−2>0 when g=0, n>1 when g=1, n≥1 when g≥2. The residue space satisfies d+Σᵢⱼλⱼ^(i)=0. Prove the properness statement for families and its analytic base-change stability; properness of individual fibers alone is not the required result. The source theorem also supplies surjectivity and bimeromorphicity in this range, after the exact functor comparison.

For fixed determinant, construct the commutative determinant square on the de Rham and Betti moduli, prove the rank-one regular-singular Riemann–Hilbert isomorphism with the prescribed trace residues and logarithmic lattice, and identify the specified-determinant coarse moduli with the actual Cartesian inverse image of the corresponding determinant Betti section. Include the scalar-gerbe comparison: choosing a determinant identification must not silently change the coarse fiber. The section is transported only after the certificate of §1.2 and comparison of §2.5. Deduce fixed-determinant family properness by proper analytic base change along this proved square. This comparison is required even in genus zero; the simplification there must be proved.

Export the proper semiconjugacy certificate consisting of §§2.5–2.6. A consumer then invokes NonlinearConnections §0.4 with its own source and time domain to deduce complete horizontal continuation. Do not reprove that general continuation theorem here or extend this properness assertion to arbitrary irregular data.

**Hypotheses**

- The entire logarithmic moduli problem and Riemann–Hilbert map of 2.5, identified with I13; r≥2, n≥1 and fixed genus, degree and residue data with d+Σᵢⱼλⱼ^(i)=0.
- Generic weights satisfying stable=semistable; g=0 requires rn−2r−2>0; g=1 requires n>1; g≥2 requires n≥1.
- Fixed-determinant restriction additionally requires the proved Cartesian determinant comparison, rank-one regular-singular correspondence and certified transported determinant section.

**API**

- Identify the full parameterized target and prove properness after pullback along any admitted analytic time/exponent base change.
- Construct and prove the Cartesian determinant comparison on coarse moduli, including rank-one Riemann–Hilbert and scalar identification issues.
- Return a proper semiconjugacy certificate for a separate application of the general continuation theorem.

**Tests and falsification cases**

- For g=0,r=2,n=5, rn−2r−2=4>0, so the numerical source condition holds. A genuine nonemptiness certificate and the determinant comparison remain necessary for the full fixed-determinant application.
- For g=0,r=2,n=3, rn−2r−2=0; this target cannot cite I13 Theorem 2.2 as supplying its properness theorem.
- Deleting an exceptional fiber from the source may destroy properness even though the generic Riemann–Hilbert map is an isomorphism; keep the full stable moduli source.
- Every consumer applies the same NonlinearConnections §0.4 after verifying its proper semiconjugacy; no application-specific compactness theorem is required.

**Supporting constructions owned by this target.**

- Deligne II5.4 constructs the extension for a chosen section of ℂ→ℂ/ℤ; it explicitly does not make that canonical extension tensor-compatible. Consequently determinant compatibility is proved on the actual logarithmic lattices and residue sums, with any required integer lattice shifts. The characteristic polynomial of monodromy has eigenvalues exp(−2πiλ); equality of the monodromy matrix with exp(−2πi Res) up to conjugacy uses the appropriate nonresonance condition (II5.6) and is not asserted at every resonant point. Keep these distinctions in both the full RH map and the rank-one Cartesian determinant comparison.

*Needs:* Internal: 1.1, 1.2, 1.3, 1.5, 2.3, 2.4, 2.5.

**Source scope and owned proof:** I13 Theorem 2.2 (including every numerical hypothesis), Remark 2.3(1), §6 and §8. Comparison with this framework and the fixed-determinant Cartesian square are owned proofs. No irregular properness result is inferred.

### Constructive proof requirements

- `M-local-presentation-descent` — Build intrinsic input groupoids and coordinate/root changes with coherent descent, without treating I23 coordinate formulas as the definition.
- `M-determinant-time` — Construct and verify rank-one strong determinant transport on the stated local charts; global fixed-determinant output requires actual gluing. Prove determinant compatibility of the rank-r lift.
- `M-determinant-fiber` — Compare full ramified deformation cone with the regular determinant de Rham complex; prove scalar splitting, smooth determinant map, 2g removal and orthogonal nondegeneracy before exporting positive-genus fixed-determinant symplecticity.
- `M-early-unfolding` — Construct the finite-flat auxiliary family and both generic-fiber comparison maps as part of the proof of closedness.
- `M-strong-lift` — Prove existence/uniqueness inside the total-pole and kernel-lattice extension class, mixed-term flatness and actual trace-form preservation.
- `M-coherent-export` — Prove canonical pullback/presentation comparisons, 2-coherence and the general construction theorem independently of all specialized consumers.
- `M-regular-RH-proper` — Identify the entire logarithmic moduli functor with I13, prove all-points strong-splitting semiconjugacy, exact family properness and the Cartesian fixed-determinant restriction. Source completeness belongs to the generic NonlinearConnections theorem, applied downstream.

### Primary sources and exact use

- **I23** — [Michi-aki Inaba, Moduli Space of Factorized Ramified Connections and Generalized Isomonodromic Deformation, SIGMA 19 (2023), 013](https://sigma-journal.com/2023/013/); [PDF](https://sigma-journal.com/2023/013/sigma23-013.pdf). §§2–5; §6 (6.9), Proposition 6.3; §7 Proposition 7.2, Theorem 7.5; §8 Theorem 8.1, Propositions 8.2–8.3; §10 Definition 10.1, (10.1), Propositions 10.7/10.10; §11 Definition 11.4, Theorem 11.6, Corollary 11.8.
- **I13** — [Michi-aki Inaba, Moduli of parabolic connections on a curve and Riemann–Hilbert correspondence, Journal of Algebraic Geometry 22 (2013), 407–480](https://arxiv.org/abs/math/0602004); [PDF](https://arxiv.org/pdf/math/0602004). Definitions 1.1 and 2.2; Theorems 2.1–2.2; §6; regular-singular reconstruction and surjectivity.

I13 is the source for the logarithmic theorems 2.5–2.6 and supports logarithmic-consumer nonemptiness; it is not a prerequisite for the general irregular construction of §2.4. No unrestricted extension beyond the admitted I23 local models is claimed.

<a id="layer-3"></a>

## Layer 3: Phase spaces and isomonodromic deformations of Painlevé equations

<a id="painleve"></a>

**Summary.** Construct Painlevé dynamics from moduli of meromorphic connections, and construct Painlevé functions from the horizontal sections of that dynamics. The input consists of a curve, a structural polar divisor, a determinant connection, local formal moduli conditions, and stability and marking data. The phase space, its symplectic form, and its horizontal distribution are constructed from this input. A common continuation theorem precedes every classical scalar equation. The ten underlying rank-two formal profiles, their labelled realizations, their eight additive surface types, and the six classical differential equations are comparison results. The theory includes resonant parameters, allowed reducible connections, ramified irregular singularities, special invariant loci, tau sections and their scalar normalization. Elementary coefficient degenerations are covered by a separate boundary comparison. JMU/Hamiltonian comparisons of tau sections have the precise generic scope stated in targets 6.4–6.5; the determinant construction itself has the broader marked-RHP scope specified in 6.2–6.3.

### Scope

The trace-class determinant required by the tau construction is supplied by RandomMatrices §8.3 at its stated operator generality.

Difference and q-difference Painlevé dynamics, a general Sakai classification of discrete systems, cluster realizations, arbitrary-rank wild nonabelian Hodge theory, a classification of every algebraic special solution, and numerical connection constants for every asymptotic regime have different scope. They are not prerequisites of the differential theory specified here. Rational and classical-function solutions included here are the explicit families obtained from the geometric reductions and transformations of targets 5.4–5.6 and 7.1–7.5; no completeness classification of all such solutions is asserted.

### Conventions

Work over ℂ. Curves are smooth connected projective curves, with a finite nonempty ordered set of pairwise distinct marked points. The general rank is an integer r ≥ 1; slope stability is defined on this positive-rank domain. A ramified local condition also satisfies the rank and local-order restrictions of its stated formal model. The classical subcategory has genus zero and rank two. Write P = Σ mᵢaᵢ for the structural polar divisor; it bounds the poles and records the local moduli problem. It is not the divisor of nonzero poles of each individual connection. Apparent singularities and scalar residues at a marked point are allowed when the local conditions allow them. The auxiliary unfolding in §1.6 uses a separately constructed finite-flat divisor; its special fibers need not consist of distinct marked sections.

An object is a vector bundle E on the whole curve, a meromorphic connection ∇: E → E ⊗ Ω¹(P), an isomorphism of its determinant connection with the specified line connection, and the local structures below. All relevant bundle splitting types are retained. The general input permits a meromorphic determinant; the classical complexity subcategory uses a regular-singular determinant with fixed residues and its compatible moving-curve transport. This still allows odd determinant degree. At a logarithmic point prescribe residue eigenvalues and a compatible filtration; do not freeze one complete formal isomorphism class at resonant parameters. At an unramified irregular point use a generic distinct-leading-term formal condition. At a ramified point use the generic factorized ramified condition, with ramified descent. Leading coefficients required to be nonzero remain nonzero within a fixed irregular stratum. Their vanishing changes the input stratum; §7.3 compares the coefficient-boundary equations.

Weights are denoted w, avoiding confusion with the classical scalar coefficient α. Use generic stability weights for which semistability equals stability on the specified numerical data. Stability concerns ∇-invariant subbundles. Changing a weight chamber is a wall-crossing problem, not an auxiliary-choice invariance. Isomorphisms preserve the determinant identification, labels and prescribed local structures. Retain these arrows before rigidification or passage to a coarse moduli space. For a stable rank-two object with determinant identification fixed, the residual scalar group is μ₂, not the full multiplicative group; fixing the determinant and rigidifying this remaining group are different operations.

Write Θ for fixed external residue/exponent parameters and Bθ for an admitted marked time base with θ ∈ Θ fixed. Write πθ: Mθ → Bθ for the phase family. The distinction between fixed parameters and time directions is part of the deformation problem. For the convention ∇ = d + A, a logarithmic residue λ has monodromy eigenvalue exp(−2πiλ); sources using d − A or exponent θ = −λ have exp(2πiθ). Retain the actual logarithm parameters in the fiber product defining the comparison target: forgetting them is not a proper map.

The horizontal splitting is h: π*TB → TM with dπ ∘ h = id. Its image is the invariant dynamics. A vector field representing it requires a chosen time vector. A local solution is a holomorphic section s of π satisfying ds(v) = h(v), with a specified initial point. Paths are compact piecewise C¹ paths in the fixed admitted base. The base is never punctured further according to the poles of a selected solution.

Use ω = dq ∧ dp and ι_Xω = d_phase H in a Hamiltonian chart. Thus q′ = H_p and p′ = −H_q. The extended form is Ω = dq ∧ dp + dH ∧ dt, whose kernel contains ∂t + X. Under τ = f(t) the normalized horizontal generator scales by dt/dτ. A scalar Hamiltonian is local and can change by a time-only function or by the generator of a time-dependent symplectic coordinate change.

“Painlevé function” first means a geometric horizontal section or its germ. A scalar function is the evaluation of a specified admissible observable, with a time coordinate and normalization. An everywhere defined map to ℙ¹ may give the constant value ∞; the usual meromorphic-function conclusion excludes that case. Universal-cover continuation and single-valued descent to B are different conclusions.

### Dependencies between layers

Construct nonlinear connections, solutions, transport and observations as general theorems. Construct admitted meromorphic-connection moduli and their strong isomonodromic connection, then establish the logarithmic Riemann–Hilbert comparison. Restrict this construction to the classical input and verify its formal profiles. Prove the full classical Riemann–Hilbert comparison and Painlevé property before developing the surface, transformation and Riccati comparisons. Construct determinant lines and tau sections. Derive the classical scalar equations, Hamiltonians and sigma forms in separate coordinate-comparison targets. The construction, continuation, surface geometry and tau-section targets have no classical scalar comparison prerequisite.

<a id="target-3-1"></a>
### 3.1 Decorated connections for Painlevé equations

**Painlevé application.**

**Hypotheses.**

- An object of MeromorphicConnectionModuli 1.1, with its actual arrows, determinant and admitted local structures; no classical degree restriction yet.

Use the objects and arrows of MeromorphicConnectionModuli §1.1 directly. This is an import binding, not a second definition of decorated connections. Record the determinant, local decorations, weights and marking that the classical restriction in §3.3 will retain. The genus-zero rank-two restriction is imposed there, not in the general framework. Identify the local presentations used in the Painlevé sources with these same objects, preserving filtrations, logarithmic lattices and ramified descent. The invariant adjoint and projective objects are End⁰(E) and the PGLᵣ connection; no globally trace-subtracted rank-r connection or square root of the determinant is introduced. (I23, §§2–4.)

**API.**

- Identify every imported object and arrow without copying its carrier.
- Verify the odd-determinant and resonant/ramified presentation comparisons on the classical inputs to be selected.

**Checks.**

- On E = O ⊕ O(−1), the determinant has odd degree; a putative global half-determinant twist does not exist. The carrier must still allow this bundle when the prescribed determinant matches it.
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

Use MeromorphicConnectionModuli §1.2 for the admitted deformation problem, its coordinate-change arrows, marking covers and fixed exponent parameters. For the classical subcategory verify the regular-singular determinant with fixed residues has the compatible time lift required by that contract. Identify the genus-zero local slices and their actual tangent maps; do not construct a second time-base carrier. The reduced versal problem remains the input to §3.3; its one-dimensionality is proved in §3.4. Strong isomonodromy preserves transported analytic data, not a fixed-coordinate irregular polynomial. (HEU10, Theorem 1.1; I23, §§5, 11.)

**API.**

- Identify the fixed-parameter/time tangent decomposition through the imported construction.
- Verify the determinant lift and genus-zero coordinate-change coherence required by the classical restriction.

**Checks.**

- Four ordered logarithmic points have one modulus after quotient by PGL₂: 4 − 3 = 1; its cross-ratio avoids 0, 1 and ∞.
- A change τ = 2t multiplies the displayed horizontal generator by 1/2; retaining its coefficient unchanged gives a different parametrized system.
- Two solutions with different movable pole sets use the same Bθ. A base that deletes one solution's poles fails this requirement.

*Needs:* Internal: 3.1, 1.2.

<a id="target-3-3"></a>
### 3.3 The rank-two degree-four subcategory

**Painlevé application.**

**Hypotheses.**

- Genus zero; rank two; structural degree four; regular-singular determinant with fixed compatible residues; reduced versal time problem; nonempty stable fibers.

Define the classical differential Painlevé input class by genus zero, rank two, a structural polar divisor of degree four, the local moduli conditions of §3.1, a regular-singular determinant connection with fixed residues and its compatible transport, the reduced versal formal-data deformation from §3.2, and nonempty stable fibers. On genus zero the determinant residues obey their sum = −degree convention for ∇ = d + A. The time deformation is the actual reduced deformation problem, not an arbitrarily chosen constant or nonversal curve in a larger base. Nonemptiness is a domain condition on the moduli problem; neither one-dimensional time nor continuation is a field of this definition. Prove the reduced-time dimension in §3.4, independently of the phase dimension. Keep the connection data themselves as objects; do not define this class as a six-element type. (VDPS09, §2.2 and Table 1; I23, Theorem 7.5.)

In the pole-budget comparison, r is the projective Katz invariant, computed from trace-free exponential differences. It is not the maximal slope of an arbitrary scalar twist of the connection. The classical determinant normalization avoids extra scalar irregular times. Adding an arbitrary scalar irregular part belongs to a separate rank-one extension with a specified strong time lift; it is not silently included in the one-dimensional deformation count. None of these local/formal comparisons requires a global square root of the determinant line.

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

- An input of 3.3 with its allowed generic projective local types and the actual reduced formal-data deformation problem. Pole labels are retained. The number of profiles, automorphism-stabilizer calculation and one-dimensional reduced time are conclusions, not assumptions.

Classify the allowed rank-two formal profiles of structural degree four, retaining the nondegenerate leading-term and reduced-deformation hypotheses. First classify underlying profiles after forgetting the order of the pole labels: enumerate partitions of four and the integral or half-integral generic local slope at each irregular part. This gives ten underlying profiles. Recover the original ordered input through its label-assignment groupoid: a permutation induces a reindexing equivalence between labelled presentations, not a label-preserving arrow in the original groupoid. There are seventeen ordered slope profiles, with counts 2, 8, 6 and 1 for one, two, three and four poles; the corresponding unordered counts are 2, 5, 2 and 1. These are counts of formal profile shapes, not of objects with continuous exponent parameters.

Prove that every labelled realization has one essential time parameter after quotienting the permitted label-preserving curve-coordinate changes. In a presentation with n poles the dimension calculation is n + Σ⌈rᵢ⌉ − 3 = Σmᵢ − 3 = 1, with the automorphism stabilizers and the chosen marking/slices explicitly checked. The determinant normalization and its transport remove no required projective direction and add no scalar irregular direction. Prove that all ten underlying presentations and every label assignment admit this determinant normalization. The table in §7.2 is a table of underlying profiles; its coordinate formulas are transported along the label-reindexing equivalences. (VDPS09, §2.2, Table 1, printed pp.18–19.)

Prove the familiar time domains only after fixing the displayed marking and normalization: the four-point cross-ratio base, a nonzero irregular time for the multiplicative-looking time charts, and an affine time for the polynomial charts. These are charts or marking covers of the intrinsic time problem; they are not six definitions of dynamics. The classification is restricted to this rank-two formal complexity, and does not classify every two-dimensional nonautonomous system.

**Checks.**

- The ordered tuples (1,0,0) and (0,1,0) have orders (2,1,1) and (1,2,1). They have the same underlying profile but are not identified by a label-preserving arrow.
- Enumerating ordered compositions of 4, with one local type for a part 1 and two for each larger part, gives 2 + 8 + 6 + 1 = 17. Forgetting order gives 2 + 5 + 2 + 1 = 10.
- A label permutation preserves the pole budget and the time dimension, but transports the residue parameters and cross-ratio chart; it does not leave every displayed coordinate unchanged.

*Needs:* Internal: 3.1, 3.2, 3.3; [Formal scalar and vector-valued Laurent algebra](#dependency-formal-series) (L1–L4; L5–L6 for finite-extension steps in 1.1).

#### Examples

For a single ramified pole with slope 5/2, the structural order is 4 and the three irregular coefficients are reduced by the two-dimensional affine coordinate group to one essential time. For two unramified poles of slope 1, there are two irregular coefficients and one residual scaling, again leaving one time. These calculations concern input types before any scalar Painlevé equation is introduced.

#### Dependencies

Use the exact *Needs* list at each target and the external dependency contracts above. General proof prerequisites belong to their independent package; this layer verifies its stated application comparisons.

<a id="target-3-5"></a>
### 3.5 Stable moduli for Painlevé equations

**Painlevé application.**

**Hypotheses.**

- The classical input 3.3; verify the exact hypotheses of the general stable-moduli construction rather than assuming its representing family.

Apply MeromorphicConnectionModuli §1.3 to §3.3. Verify its determinant, stability and local-model admission hypotheses on the classical input; boundedness is supplied by the general construction. Identify its output with the full classical stable moduli problem. The stack, rigidification, coarse family and étale universal-object covers are the imported constructions. Retain all permitted bundle types and the actual residual μ₂ stabilizer before rigidification. Own the comparison of every classical framed chart with its actual locally closed or open locus; a balanced chart never replaces the entire moduli space. (I23, Theorem 5.1.)

**API.**

- Identify the classical moduli functor with the restricted general functor, including arrows and determinant identification.
- Verify every framed chart inclusion, its complement, and the weight-chamber common stable loci.

**Checks.**

- A stable object may have scalar automorphisms before rigidification. A set-valued quotient that claims all stabilizers were trivial fails this example.
- A family can leave a trivial-bundle chart by bundle jumping while remaining in the moduli space. Its phase path is not declared singular for that reason.
- In the extension family 0 → O(−1) → E_t → O(1) → 0, E₀ = O(−1) ⊕ O(1) while E_t = O ⊕ O for t ≠ 0. The two splitting strata pull back to {0} and its complement in A¹; the first is not open. The full connection moduli must retain such bundle jumps on the permitted connection locus.
- A ramified generic local factor is irreducible, so it has no global ∇-invariant line and is stable for every weight; this is I23 Remark 2.9, not a claim that every special solution is absent.

*Needs:* Internal: 3.3, 1.3.

<a id="target-3-6"></a>
### 3.6 Deformation complexes and trace pairings

**Painlevé application.**

**Hypotheses.**

- The family of 3.5 and its determinant and local structures; the tangent/obstruction identifications are imported via the verified comparison.

Specialize MeromorphicConnectionModuli §1.4 to the determinant-fixed family of §3.5, and prove that infinitesimal classical families and gauges correspond to its cocycles and coboundaries. Use its actual three-term ramified cone and ℂ-linear differential-operator/Čech construction. Do not replace the commutator differential by an O-linear map, or truncate the cone without a proved quasi-isomorphism. Verify the determinant restriction and trace-sign convention on the same complex. (I23, equation (6.9), Propositions 6.3 and 7.2.)

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

- The classical family and its comparison with the general deformation construction; smoothness, dimension two and the symplectic form are conclusions.

Apply MeromorphicConnectionModuli §§1.5–1.6 to the family and complex identified in §§3.5–3.6. Verify the determinant-fiber comparison; genus zero contributes no omitted Jacobian directions. Substituting g = 0, r = 2 and deg P = 4 in the admitted general dimension theorem gives 2. Smoothness, nondegeneracy and relative closedness are outputs. The finite-flat auxiliary unfolding, its simple-connection moduli, both generic logarithmic quasi-isomorphisms and the smooth-density argument are proved once in the general framework, as part of the symplectic construction. Here identify its central stable fiber, complex and form with the actual classical family, including admissible nonreduced base change. (I23, Theorems 7.5 and 8.1, Propositions 8.2–8.3.)

**API.**

- Verify the fixed-determinant and central-fiber comparisons needed to specialize the general theorem.
- Export the same relative tangent bundle and symplectic form on the entire classical family.

**Checks.**

- Genus zero, rank two and degree four give −8 + 2 + 8 = 2; structural degree five instead gives 4.
- Fixing the determinant in positive genus removes 2g directions when the determinant-map comparison applies; the genus-zero coincidence cannot be exported unchanged.
- A skew pairing which vanishes identically is closed but is not symplectic; nondegeneracy must follow from the actual duality computation.
- At r = 1 and g = 1 the unfixed-determinant formula gives 2, and fixing the entire line connection gives 0. The rank-zero input that would incorrectly give 2 is outside the domain.
- For r = 2, local order 2 and q₁ = 2, the unfolding equation is (z − 2h²)(z − h²). Its fiber at h = 0 is z² and at h = 1 is (z − 2)(z − 1); modulo h² it is again z². Check the central and pulled-back complexes and forms, rather than identifying this family with fixed distinct sections.

*Needs:* Internal: 3.3, 3.5, 3.6, 1.5, 1.6.

<a id="target-3-8"></a>
### 3.8 Exceptional strata of the phase space

**Painlevé application.**

**Hypotheses.**

- All stable resonant, reducible and apparent strata allowed by the fixed local conditions; generic ramified local irreducibility.

Prove that the construction retains all w-stable logarithmic resonance, reducible and apparent-singularity strata allowed by its fixed local moduli conditions. Describe how the local filtration resolves the ambiguity of repeated eigenvalues. Record nonemptiness separately. At generic ramified points use the irreducibility theorem rather than inventing reducible objects there. Targets 4.1–4.4 will identify the images of these already constructed strata in the character space. A vanishing leading irregular coefficient changes the input stratum and is covered by the coefficient-boundary comparison in §7.3. (I23, §2 and Remark 2.9; IIS06, §4, especially Theorems 4.10–4.12; VDPS09, §2.2 and §3.)

*Needs:* Internal: 3.1, 3.5, 3.6, 3.7.

#### Examples

At genus zero and rank two, the dimension calculation gives −8 + 2 + 2·4 = 2. An affine phase chart has coordinates (q,p), but points missing from that chart remain genuine initial conditions. On a resonance divisor, distinct parabolic initial points can have the same coarse monodromy character; the phase space must retain them.

#### Dependencies

Use the exact *Needs* list at each target and the external dependency contracts above. General proof prerequisites belong to their independent package; this layer verifies its stated application comparisons.

<a id="target-3-9"></a>
### 3.9 Isomonodromic connections for Painlevé equations

**Painlevé application.**

**Hypotheses.**

- The constructed classical moduli/time problem; verify that its local structures and determinant transport satisfy the strong-extension contract.

Apply MeromorphicConnectionModuli §2.1 to the classical time problem and the family of targets 3.5–3.8. Identify its strong extensions with the classical universal-object charts, including kernel lattices, logarithmic flags and ramified descent. The total pole class is Ω¹_X(log D) ⊗ O_X(P − D); its moving-coordinate generators dz/zᵐ and dε/zᵐ⁻¹ remain comparison lemmas, with a regular time coefficient at a logarithmic pole. Import existence, uniqueness and gluing of strong extensions, and obtain the same splitting h of NonlinearConnections §0.1. This target does not assume h or recover it from a prescribed scalar equation. (I23, Definition 10.1, Propositions 10.7 and 10.10.)

**API.**

- Compare the classical kernel lattices and moving-pole filtration with the general strong-extension class.
- Identify the resulting tangent splitting, its linearity and its base-change maps without creating a second connection object.

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

Use MeromorphicConnectionModuli §2.2 and the identification of §3.9 to obtain h([v,w]) = [h(v),h(w)] on the classical family. Verify that the two-parameter strong-extension comparison restricts to this time problem. The general mixed-term proof is not repeated for each formal profile; no analytic Stokes theorem or scalar equation is a premise. (I23, Theorem 11.6.)

**API.**

- Verify the restriction comparison for the mixed extension and export the bracket identity.

*Needs:* Internal: 3.9, 2.2.

<a id="target-3-11"></a>
### 3.11 Symplectic transport and the total two-form

**Painlevé application.**

**Hypotheses.**

- The constructed relative form and splitting, plus the verified specialization of the moduli symplectic-preservation theorem; preservation is not inferred from flatness.

First specialize the actual symplectic-preservation theorem of MeromorphicConnectionModuli §2.2. Flatness by itself does not supply preservation. Then apply NonlinearConnections §0.6 to (π,h,ω) and obtain the closed total form Ω(v,w) = ω(v − h(dπv), w − h(dπw)), its kernel and transport laws. Identify this form with the classical family, rather than introducing a second Hamiltonian object. A Darboux/time chart and local exactness give the downstream expression dq ∧ dp + dH ∧ dt. (I23, Definition 11.4 and Corollary 11.8.)

**API.**

- Identify the imported relative and total forms and their horizontal kernel.
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

Use MeromorphicConnectionModuli §§2.3–2.4 to identify all objects in targets 3.1–3.12 as the classical restriction of one construction, with coherent presentation, gauge and admissible base-change comparisons. Verify the cocycle diagrams for the classical markings and time slices. Changes of labels, determinant or stability chamber remain the explicitly permitted morphisms or correspondences, with stated domains. A later coordinate dictionary must commute with this construction; it is not a new definition of the dynamics.

**API.**

- Prove the classical specialization square and its triple-overlap coherence.
- Keep all imported structures on one moduli family and one nonlinear connection.

*Needs:* Internal: 3.1, 3.2, 3.5, 3.9, 3.10, 3.11, 2.3, 2.4.

#### Examples

The Hamiltonian chart H = p²/2 − 2q³ − tq represents a horizontal kernel, but the kernel is constructed without this formula. Replacing H by H + c(t) preserves it. A marking change acts on the parameterized family; it does not erase the marking from the input groupoid.

#### Dependencies

Use the exact *Needs* list at each target and the external dependency contracts above. General proof prerequisites belong to their independent package; this layer verifies its stated application comparisons.

<a id="layer-4"></a>

## Layer 4: Riemann–Hilbert comparison and the Painlevé property

<a id="target-4-1"></a>
### 4.1 Sectorial local systems and ramified analytic descent

**Painlevé application.**

**Hypotheses.**

- Admitted good rank-two formal types; resonant logarithmic lattice data; finite ramified covering and deck action.

Construct the analytic classification of the permitted local meromorphic connections by formal graded data, sectorial solutions and Stokes transition maps, retaining resonant logarithmic lattices and flags. Prove sectorial existence, overlap uniqueness, cocycle identities and analytic dependence on the admissible time parameters. At a ramified point perform the construction on the finite cover and prove equivariant descent, including the deck permutation of the exponential factors. A formal Laurent-series classification alone does not prove these analytic assertions. (I23, §9, Theorem 9.7 and Corollary 9.11; BOA01, §§3–6; HEU10, §2; BY15, Remark 3 and Definitions 7 and 13.)

**API.**

- Construct solution-sector restriction, refinement and change of sectorial normalization.
- Recover the actual local analytic connection and prove full faithfulness on decorated objects.
- Compare the logarithmic, unramified and ramified descriptions through the same descent language.
- Prove that integrable time extension is equivalent to strong local constancy of these data at the stated local scope.

**Checks.**

- A rank-one exponential exp(1/z) has irregular growth despite trivial ordinary monodromy; ordinary monodromy alone cannot classify the object.
- A nontrivial unipotent logarithmic monodromy matrix differs from the identity although both eigenvalues equal 1.
- On a quadratic cover, one full turn in z exchanges the two formal exponential branches; a sectorial construction that returns each branch individually without the deck action fails descent.

*Needs:* Internal: 3.1, 3.2, 3.9, 3.10, 1.1; [Complex manifolds, holomorphic bundles and observations](#dependency-complex) (K1; K3.0; K3.HolomorphicStalk; K3.MeromorphicGermField; K4; K7.1).

<a id="target-4-2"></a>
### 4.2 The Betti family and complete transport

**Painlevé application.**

**Hypotheses.**

- The local analytic data of 4.1 over the admitted marked time problem of 3.2, retained exponent lifts, and fixed closed spectral/determinant constraints; singular affine quotients are permitted. Ramified family isotopy, descent and complete transport are outputs.

For the regular-singular subcategory, use MeromorphicConnectionModuli §2.5 and verify that its marked Betti family agrees with this target. The genuinely irregular and ramified transport extensions remain the scoped obligations below.

Construct the generalized monodromy groupoid by gluing the local data of §4.1 with the global local system on the punctured curve. Keep the enriched groupoid with logarithmic lattices and flags distinct from the ordinary affine character quotient obtained by forgetting those decorations. In the ordinary quotient impose the closed spectral-invariant and determinant constraints, and retain the exponent parameter θ as a separate fiber-product coordinate. At resonance do not fix a single nonclosed Jordan conjugacy class: scalar and allowed unipotent strata with the prescribed spectrum must remain present. Construct locally constant transport along admissible marked deformations, including changes of Stokes-sector presentations. Prove composition and inverse laws and completeness along every compact path in Bθ. A singular character fiber is permitted; transport is defined by the groupoid/topological construction, not by an assumed smooth tangent splitting there. (VDPS09, §§1–3; BOA14, §10, Theorem 10.2; BY15, Proposition 19, Theorem 21 and Corollary 22.)

BOA14's cited family-transport theorem has untwisted scope. Extend its isotopy construction to the rank-two ramified objects of BY15 by retaining the exponential covering, grading and deck action, constructing deck-compatible equivalences of the Stokes groupoids, and descending the framing action and closed spectral constraints. Prove independence, composition and homotopy compatibility before concatenating local products along a compact path. BY15's quasi-Hamiltonian/Poisson theorem by itself is not this family-transport theorem.

**API.**

- Construct restriction, gluing, gauge-conjugation and change-of-marking functors.
- Distinguish the decorated groupoid, its categorical quotient and the locus where it represents individual orbits.
- Prove local product descriptions over simply connected admissible time neighborhoods and their continuation along finite chains.
- Define the complete transport on the coarse quotient and its lift on any required decoration space.

**Checks.**

- θ and θ + 1 give the same exponential eigenvalue but need not give the same logarithmic lattice; the comparison target retains θ.
- A reducible representation and its semisimplification can have the same coarse character. The quotient is not declared a faithful encoding of all connection objects.
- Transport around a nontrivial loop may act nontrivially on the fiber; completeness does not imply trivial monodromy.

**Supporting constructions owned by this target.**

- 2.5 constructs the finite-type representation varieties and their reductive affine conjugacy quotients using the proven 1.3 invariant-theory prefix, then applies 1.2 analytification and proves Hausdorff/local-compactness and marked product transport, including singular points. 4.2 constructs the wild/Stokes framing groupoid and quotient at its actual reductive or explicitly descended stages; unipotent local Stokes groups do not by themselves permit an arbitrary GIT quotient. Prove root/deck isotopy and ramified descent, stabilizer compatibility and all-stratum holomorphic maps. Nothing in SSF1.17 supplies these constructions automatically.

*Needs:* Internal: 3.2, 4.1, 1.3, 1.2, 2.5; [Quotient predicates](#dependency-quotient-predicates) (1.17); [Covering spaces and universal covers](#dependency-covers) (Stage 0.2–0.4; Stage 1.5; Stage 2.6–2.8); [Smooth bundle and connection foundations](#dependency-smooth) (B1.5; B5.0; B5.2).

<a id="target-4-3"></a>
### 4.3 Riemann–Hilbert and compatibility on the whole phase space

**Painlevé application.**

**Hypotheses.**

- The full stable moduli family of 3.5/3.8, the strong splitting of targets 3.9–3.12, and the decorated analytic reconstruction and Betti family of 4.1–4.2. Holomorphic descent and all-source horizontal compatibility are to be proved; an inverse is asserted only on the specified irreducible/nonresonant locus.

The regular-singular RH map and its all-point horizontal compatibility are imported through MeromorphicConnectionModuli §2.5, after identifying the same parabolic moduli and residue-parameter target. This import does not discharge the irregular local reconstruction.

Construct RHθ: Mθᵃⁿ → Rθ over Bθ by the analytic classification and prove that it is holomorphic. Prove that it sends every horizontal trajectory of §3.9 to the transport of §4.2, including trajectories inside resonance, reducible and exceptional loci. On the stated stable irreducible/nonresonant open locus prove the inverse comparison; elsewhere record the actual fibers and decoration data rather than asserting injectivity. Compare the integrable-extension construction with the local analytic reconstruction, and descend from universal-object covers. (IIS06, Theorems 4.10–4.12; IS12, Theorem 5.1; I23, §9 and §11.)

The theorem's all-strata scope is a construction target: the generic unramified theorem is one of its inputs, not a replacement for the missing resonant or ramified comparison. No scalar equation is used in the extension across these loci.

**API.**

- Construct the holomorphic RH map from the universal-object cover and prove descent and base-change naturality.
- Compare the decorated local reconstruction with the forgetful ordinary character quotient.
- Prove horizontal compatibility at every retained point and the inverse theorem only on its stated open locus.

**Checks.**

- Two distinct points on an exceptional fiber can have the same ordinary character; the construction must not choose one as an inverse.
- At a resonant logarithmic point, equal eigenvalues do not justify deleting either the allowed scalar or unipotent stratum.
- Retaining exponent lifts distinguishes θ from θ + 1 even when their ordinary exponential eigenvalues agree.

*Needs:* Internal: 3.5, 3.8, 3.9, 3.10, 4.1, 4.2, 1.2, 2.5.

<a id="target-4-4"></a>
### 4.4 Proper comparison for the full classical input class

**Painlevé application.**

**Hypotheses.**

- The RH map constructed in 4.3 for the full admitted classical time/parameter family, with exponent lifts and closed character constraints retained, and every allowed stable source stratum. Uniform lattice bounds, extension of decorations, stable replacement, compact containment and relative properness are not assumed; this target owns their proofs.

On the four-logarithmic-point branch, verify 2·4 − 2·2 − 2 = 2 > 0 and the fixed-determinant/marking comparison, then apply MeromorphicConnectionModuli §2.6 (I13, Theorem 2.2). The source retains the exponent parameters by a fiber product. No general irregular properness is inferred from this regular-singular theorem; the all-classical extension below remains an owned target.

For each admitted degree-four rank-two input and every allowed exponent parameter, prove that RHθ is proper as a map of the whole time family, with the exponent lift retained in its target, on the full stable moduli space of §3.5. Establish the corresponding family statement on admitted parameter charts; properness of each fixed-time map is not sufficient. The target has the ordinary generalized character data with its fixed closed constraints; no solution-dependent open subset is removed. State surjectivity onto the realizable component separately from properness. This includes resonant logarithmic and stable reducible points and the generic ramified local structures defining the classical class. (IIS06, Definition 2.11 and Theorems 4.10–4.12; IS12, Theorem 5.1 and the scope warning of Remark 6.3; HEU10, Theorem 1.1.)

The required extension is owned here. Develop the proof through four concrete intermediate results: boundedness of local lattices uniformly over compact families of generalized characters with fixed exponent lifts; extension of the retained flags and factorized structures in a relative projective parameter space with their closed incidence relations; semistable replacement after the necessary base change and elementary modifications, followed by semistable = stable for the chosen weights and uniqueness in the separated moduli problem; and compatibility of these extensions with global gluing and the analytic moduli topology. Stability is open but is not thereby preserved by arbitrary limits. Verify that these results give compact inverse images of compact subsets, rather than merely closed fibers or pointwise solvability. A projective flag variety alone does not prove the theorem, since the underlying connection may also escape.

HEU10's universal strong isomonodromic deformation gives an independent possible route to the continuation conclusion of §4.6. Such a route must establish the identification of the time bases, extension of local decorations, determinant and stability preservation, bundle-jumping compatibility, descent, and equality with §3.9. It does not by itself prove the properness required in this target. I23's global foliation theorem and IS12's generic theorem also do not discharge it. The compactness theorem remains an explicit internal proof-development task.

*Needs:* Internal: 3.5, 3.6, 3.7, 3.8, 4.1, 4.2, 4.3, 1.3, 2.6; [Quot/Hilbert and parameter schemes](#dependency-quot) (4.14); [Native topological properness](#dependency-proper) (IsProperMap).

#### Examples

An exceptional RH fiber can be a projective curve. A chosen point on it is still an initial condition and has its own horizontal lift; taking an arbitrary inverse of the coarse RH map would discard this information. A trivial-bundle chart may fail the strong Riemann–Hilbert problem at an isolated time even though the full bundle-valued connection continues.

#### Dependencies

Use the exact *Needs* list at each target and the external dependency contracts above. General proof prerequisites belong to their independent package; this layer verifies its stated application comparisons.

<a id="target-4-5"></a>
### 4.5 Local holomorphic horizontal sections

**Painlevé application.**

**Hypotheses.**

- The constructed holomorphic flat splitting and admitted parameter charts; no solution operator is an input.

Apply NonlinearConnections §0.3 to the actual holomorphic flat splitting of §§3.9–3.10. A geometric Painlevé germ is its native horizontal-section germ with specified initial point; the evaluation bijection, local uniqueness and holomorphic parameter dependence are the general outputs. Verify that the admitted parameter charts of targets 3.1–3.4 meet the joint-holomorphic hypotheses. The analytic existence and parameter-dependence proof is owned by 0.3.

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

- The actual classical RH comparison, complete target transport, all-point partial-lift compatibility and properness proved in targets 4.1–4.4; source completeness is the conclusion.

Apply NonlinearConnections §0.4, whose continuous-time local ODE and compact-extension floor is 0.2, to the constructed phase family. Verify the complete target transport of §4.2, the actual partial-lift compatibility of §4.3 at every permitted point, and the relative proper map of §4.4. Obtain a unique horizontal lift for every admitted θ, initial time b₀, point x₀ ∈ Mθ,b₀ and compact piecewise C¹ path in Bθ beginning at b₀. The target may be singular, and exceptional fibers are retained. Neither a local inverse of RH nor properness of π is required. The general compact-containment proof lives entirely in NonlinearConnections; this target owns the classical hypothesis checks and the resulting geometric Painlevé property. Poles of a chosen scalar observable do not change the admitted base.

**API.**

- Check the hypotheses of the general proper-transfer theorem, including exceptional fibers.
- Export the full initial-point and compact-path quantifiers independently of every scalar chart.

**Checks.**

- For y′ = y², y(0) = 1, the projection of M = ℂ_t × ℂ_y to the complete target time line is compatible but not proper. Along t ∈ [0,1), y = 1/(1 − t), with values 2 and 4 at t = 1/2 and 3/4, and no finite value at 1. This excludes replacing properness of F by mere continuity or projection compatibility.
- For identity F on the trivial family and constant fiber transport, the proper transfer returns the unique constant fiber coordinate. For a proper fiber with an exceptional curve, the compact-containment argument uses its compact preimage and never selects an inverse of F.
- The base path γ(s) = |s − 1/2|³ᐟ² on [0,1] is C¹, while γ′ is not C¹ at 1/2. Its constant-splitting lift is a valid input to the continuous-time local theorem; a proof requiring the autonomized field to be C¹ would impose an unsupported extra hypothesis.

*Needs:* Internal: 4.2, 4.3, 4.4, 4.5, 0.4.

<a id="target-4-7"></a>
### 4.7 Classical transport, universal-cover sections and descent

**Painlevé application.**

**Hypotheses.**

- The actual complete flat classical connection, with proved symplectic preservation; its groupoid action is an output of the general construction.

Apply NonlinearConnections §0.5 to the flatness of §3.10 and completeness of §4.6. Its construction produces the actual endpoint transport, fundamental-groupoid action and universal-cover horizontal section through every classical initial point. Identify this action with the constructed connection rather than assuming a monodromy action as input. Use §3.11 and NonlinearConnections §0.6 for symplectic preservation. Descend precisely for initial points fixed by the resulting deck/monodromy action; completeness alone does not imply single-valuedness on Bθ.

**API.**

- Identify the imported transport and universal-cover sections on the classical moduli family.
- Verify presentation compatibility and the actual stabilizer condition for descent.

**Checks.**

- A path followed by its reversal gives the identity on every initial condition, including exceptional points.
- On B = ℂ× with H = qp/(2t), the equations are q′ = q/(2t), p′ = −p/(2t). A positive generator of π₁(B) sends (q,p) to (−q,−p), and two such loops give the identity. The symplectic multiplier is (−1)(−1) = 1, while a trivial-transport implementation would give the wrong first loop.
- In that model only the origin is fixed by the generator. Every other initial point gives a complete section on the universal cover that does not descend to B; completeness alone is insufficient for descent.

*Needs:* Internal: 3.10, 3.11, 4.6, 0.5, 0.6.

<a id="target-4-8"></a>
### 4.8 Observations on Painlevé phase spaces

**Painlevé application.**

**Hypotheses.**

- The classical phase family and a specified candidate observer/domain; non-indeterminacy and any required lift are proof obligations.

Use the observable notion of NonlinearConnections §0.7 on the classical phase family. Own the construction of each claimed classical morphism to ℙ¹, or its stated rational domain and resolution/lift comparison. Prove defined pullback along every claimed solution stratum and exclude an identically infinite pullback before calling the result a scalar meromorphic function. Observers, their domains and normalization remain explicit data; the generic evaluation theorem does not supply these application-specific verifications.

**API.**

- Construct the actual classical observer and verify its pullback/lift domain.
- Compare its normalizations and overlap maps using the general observable naturality law.

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

Verify the one-dimensional time conclusion of §3.4 and apply NonlinearConnections §0.7 to §§4.7–4.8. Every claimed non-identically-infinite scalar evaluation is meromorphic on the universal cover of the admitted time curve, with finite-order poles at its interior scalar singularities. Observer resolution and non-indeterminacy for every claimed stratum remain the application obligations of §4.8. The single-valued descent criterion is separate. This transfers one intrinsic theorem to the coordinate comparisons, rather than proving six scalar continuation theorems.

**API.**

- Export the meromorphic evaluation theorem only on the verified classical observer domains.

*Needs:* Internal: 3.4, 4.7, 4.8, 0.7.

#### Examples

The affine equation q′ = q² has a movable pole at t = 1 for q(0) = 1. Its projective vector field extends in u = 1/q as u′ = −1. This separates affine-coordinate escape from geometric continuation. On B = ℂ*, a horizontal system can have complete continuation on the universal cover and nontrivial monodromy around 0; this does not contradict the theorem.

#### Dependencies

Use the exact *Needs* list at each target and the external dependency contracts above. General proof prerequisites belong to their independent package; this layer verifies its stated application comparisons.

<a id="layer-5"></a>

## Layer 5: Initial-condition surfaces, symmetries and Riccati reductions

<a id="target-5-1"></a>
### 5.1 Additive Okamoto–Painlevé pairs

**Painlevé application.**

**Hypotheses.**

- Smooth rational projective surface; effective anticanonical Y; Y·Y_i=0; SNC support; additive Picard identity component; nonfibered type.

Define the comparison groupoid of smooth projective rational surfaces S with a nonzero effective anticanonical divisor Y, satisfying Y·Yᵢ = 0 for every irreducible component, with D = Y_red a simple normal-crossing divisor. Require additive type, expressed by the additive identity component of Pic⁰(Y), and nonfibered type: no elliptic fibration has a fiber nY with n ≥ 1. Retain markings when a root basis or normalized time is used. Construct the relative versions of these conditions. (STT02, Definitions 1.1 and 1.3, Proposition 1.2 and Tables 2–3.)

**API.**

- Extract the weighted boundary intersection graph and the orthogonal lattices in Pic(S).
- Prove invariance under pair isomorphisms and compatibility with admissible families.
- Compare the complement S \ D with its logarithmic tangent and two-form sheaves.
- Distinguish the boundary-root lattice from a symmetry-root lattice.

**Checks.**

- A smooth elliptic anticanonical boundary has elliptic Picard identity component, not additive, and is excluded.
- A multiplicative cycle has multiplicative Picard identity component and is excluded.
- Requiring a global affine-plane chart would exclude the D₈ case; that additional requirement is absent.

**Supporting constructions owned by this target.**

- Apply 1.5 relative Picard only after proving the proper-flat/projective family, universal-functions, H²-vanishing and identity-component hypotheses for the possibly nonreduced anticanonical Y. Compute the identity component with normalization, units and successive nilpotent-thickening exact sequences, and prove the additive-group comparison defining additive type. Construct Θ(−log D) as derivations preserving the reduced-boundary ideal, with D=Yred SNC; multiplicities belong to Y, not to the SNC predicate. Prove the relative Picard lattice/intersection and deformation comparisons on the actual surface family. SSF5.9’s surface-over-field or arithmetic-surface pairing is a foundation, not an automatic arbitrary-base family result.

*Needs:* Internal: 1.5; [Cohomology with supports](#dependency-supports) (2.7); [Divisors, modifications and surface intersections](#dependency-surfaces) (3.4; 4.11; 4.17; 5.9–5.10); [Algebraic vector bundles and finite locally free sheaves](#dependency-bundles) (L0A–L0C; L1A–L1B; L2A–L2B).

<a id="target-5-2"></a>
### 5.2 Compactification and the eight boundary types

**Painlevé application.**

**Hypotheses.**

- The full classical phase family with the intrinsic form and splitting from targets 3.1–3.12, the pair framework of 5.1, and the stated markings/admissible base changes. Construction of the compactification, the eight boundary types, equality of its full complement with the phase family, and the form/distribution comparison are conclusions.

Construct a compactification of the degree-four connection moduli family with the pair structure of §5.1, after the stated marking/base changes, and prove that its complement is the full phase family. Prove the extension and comparison of the symplectic form and time distribution, including exceptional curves and nontrivial bundle charts. Classify the additive normal-crossing boundary types as D₄, D₅, D₆, D₇, D₈, E₆, E₇ and E₈. These are affine boundary diagrams. (STT02, Proposition 1.2 and Tables 2–3; VDPS09, introduction and Table 1; IIS06, §10 for the fully established PVI comparison.)

The all-profile comparison is a construction and proof target. VDPS09's introductory conjectural global comparison is not used as an established theorem. Prove overlap identifications, coverage and the extension at the omitted charts before asserting a global isomorphism. The compactification is not used to bypass §4.4 or to infer completeness merely from existence of a foliation.

**API.**

- Construct the relative compactification and its boundary divisor with its multiplicities and intersection pairing.
- Prove the full open-complement comparison, including bundle-jumping and exceptional charts.
- Compare the deformation and relative two-form under that isomorphism, and record the marking/base-change law.

**Checks.**

- Two presentations of boundary type D₆ can have different formal pole data; the common boundary label alone is not a moduli isomorphism.
- The D₈ complement must be retained even without the extra affine-plane hypothesis of older definitions.
- An omitted exceptional curve invalidates the full-complement assertion even if the open rational chart and its scalar formula are correct.

*Needs:* Internal: 3.3, 3.4, 3.5, 3.6, 3.7, 3.8, 3.9, 3.10, 3.11, 3.12, 5.1; [Cohomology with supports](#dependency-supports) (2.7); [Divisors, modifications and surface intersections](#dependency-surfaces) (3.4; 4.11; 4.17; 5.9–5.10); [Quot/Hilbert and parameter schemes](#dependency-quot) (4.14).

<a id="target-5-3"></a>
### 5.3 The boundary deformation space and time direction

**Painlevé application.**

**Hypotheses.**

- The admitted nonfibered additive pair families of 5.1–5.2 and the intrinsic time splitting of targets 3.9–3.12. The first boundary-layer sheaf is specified; its rank-one result, locally free base change and Kodaira–Spencer/time comparison are proved here. Equality with all supported cohomology is not assumed.

Let F = Θ_S(−log D) and N_D = O_S(D)/O_S. Construct L = H⁰(D,F ⊗ N_D), prove that it is one-dimensional for these pairs, and construct its injection into local cohomology. Establish the family/base-change theorem for L and compare its Kodaira–Spencer image with the time direction of §3.9. Prove the connecting-map/intersection-matrix identity intrinsically; do not repeat a different coordinate computation for each boundary graph. (TER02, Theorem 2.1 and Proposition 2.1; STT02, Theorem 3.1.)

Do not assert equality with the entire local-cohomology space as a standing premise: TER02 Conjecture 2.1 and the restricted results of ST04 Appendix A have different scope. A line is not a distinguished nonzero vector; a normalized time supplies a generator. Prove equality of the lifted distributions by the deformation comparison and uniqueness on the prescribed algebraic complement.

**API.**

- Construct the first boundary-layer line, its injection into supported cohomology and its restriction maps.
- Prove the intersection-matrix formula and the dimension calculation without choosing a scalar Painlevé chart.
- Establish locally free base change and the comparison of its Kodaira–Spencer image with the time tangent line.

**Checks.**

- Rescaling a chosen nonzero time vector rescales its image in L, while L itself is unchanged.
- The injection L → H¹_D(S,F) alone does not prove that its target is one-dimensional.
- Over A = ℂ[ε]/(ε²), the module A/(ε) has a one-dimensional fiber at the unique point but is not a free rank-one A-module: its ℂ-length is 1 instead of 2. Constant fiber dimension alone therefore does not establish the claimed locally free base change; the actual cohomological hypotheses must be proved.

**Supporting constructions owned by this target.**

- Use SchemeAndStackFoundations 2.6 and 2.7 for quasi-coherent and supported cohomology, the localization exact sequence, and the Noetherian colimit-of-Ext comparison. Use JacobianChallenge Layer C for coherent proper pushforwards and its separately stated base-change criteria. For the actual family of logarithmic surfaces, construct F and N_D as sheaves, the first boundary-layer injection and its connecting-map/intersection-matrix comparison. Prove the properness, coefficient flatness and cohomology/base-change hypotheses used to make the relative H0(D,F tensor N_D) invertible, and prove arbitrary base-change compatibility through the actual finite-projective complex or the precise surjectivity criterion. Fibrewise dimension one is not the proof on a nonreduced base. The target compares this line with the Kodaira–Spencer time line; it asserts no equality with all supported H1_D.

*Needs:* Internal: 3.9, 3.10, 3.11, 3.12, 5.1, 5.2; [Cohomology with supports](#dependency-supports) (2.7); [Divisors, modifications and surface intersections](#dependency-surfaces) (3.4; 4.11; 4.17; 5.9–5.10); [Cohomology, duality and curve degree](#dependency-cohomology) (2.2; 2.6; 2.20; 3.3); [Elementary deformation theory](#dependency-deformation) (4.2–4.6); [Proper coherent direct images and base change](#dependency-proper-cohomology) (Layer C).

#### Examples

The boundary type E₈ is associated with one ramified rank-two presentation, while E₇ has two. Thus a boundary label and a connection presentation are different kinds of data. The first boundary-layer line has dimension 1; claiming the same dimension for every full local-cohomology group would require an additional theorem and is not used here.

#### Dependencies

Use the exact *Needs* list at each target and the external dependency contracts above. General proof prerequisites belong to their independent package; this layer verifies its stated application comparisons.

<a id="target-5-4"></a>
### 5.4 Functors on decorated connections

**Painlevé application.**

**Hypotheses.**

- An admitted decorated connection, an invariant local quotient for a modification or the specified line connection/duality/relabeling data. The transformed determinant, local exponents, stable locus and strong-extension comparison are construction outputs.

Construct elementary modifications along an invariant local flag, tensor product with an admitted rank-one connection, duality and relabeling as functors between the actual decorated moduli problems. Specify the new determinant, exponent and stability data and the locus on which the transformed object is stable. Use the kernel construction for a modification, its induced connection, and the inverse modification; retain the comparison arrows. Extend these functors to strong integrable families by preservation of the allowed pole filtration and kernel lattices. (IIS06, Definition 3.5 and §7; I23, §§2–4 and Definition 10.1.)

**API.**

- Construct the transformed bundle and connection before passing to coarse moduli, with their determinant and local-type formulas.
- Prove pullback, composition and inverse comparisons on their specified domains.
- Describe the change of weights or required wall-crossing correspondence instead of declaring stability invariant without proof.
- Distinguish a functorial isomorphism of moduli problems, an open birational correspondence and a scalar solution substitution.

**Checks.**

- Modifying along a one-dimensional quotient at a logarithmic pole changes the bundle degree by −1; leaving the determinant unchanged fails the determinant comparison.
- Tensoring rank two by a line connection L changes the determinant by L², including its connection; it does not construct a square root of a previously fixed odd-degree determinant.
- The inverse modification recovers the original decorated object with its arrow on the common admissible locus, while forgetting the distinguished flag need not permit the inverse.

*Needs:* Internal: 3.1, 3.5, 3.9, 1.1; [Algebraic vector bundles and finite locally free sheaves](#dependency-bundles) (L0A–L0C; L1A–L1B; L2A–L2B).

<a id="target-5-5"></a>
### 5.5 Horizontal and symplectic transformation laws

**Painlevé application.**

**Hypotheses.**

- The connection functors of 5.4, the deformation pairing and intrinsic splitting of targets 3.5–3.12, and the marked-surface comparison of 5.2. Additional marked-pair reflections, their actual regular/birational domains, horizontal/symplectic extension and relations must be constructed and proved here.

Prove that each admitted transformation intertwines h by applying the uniqueness of strong extensions to its transformed family. Prove the transformation law for ω by the induced map of deformation complexes and trace pairing. Construct the resulting action groupoid on the parameterized moduli family, and establish relations by natural isomorphisms of the functors. On a marked surface compare its action on Pic(S) with the corresponding integral root reflections and diagram automorphisms. State the actual symmetry root lattice and its parameter hyperplanes separately from the boundary root diagram. (IIS06, Theorem 7.4 and Theorem 10.13 for PVI; STT02, Tables 2–3 and the marked deformation construction.)

The functors in §5.4 are not assumed to generate the full affine Weyl group. Construct the additional reflections on the moduli of marked pairs, identify the induced birational correspondence of connection moduli through §5.2, and prove its horizontal and symplectic extension on the claimed domain. The central PVI reflection is a required test: it is not generated merely by the local gauge modifications listed in §5.4. IIS06 Remark 7.5(2) describes a Fourier-transform realization; a Fourier–Laplace or middle-convolution implementation would likewise require its own functor and strong-extension comparison. The marked-surface construction is the specified route here. The PVI theorem is not cited as a theorem for every profile. Verify the actual reflection and Coxeter relations, effective-locus conditions and extension across chart complements before deriving rational Bäcklund formulas in §7.4. An identity of rational maps on a dense open set must be upgraded before claiming an everywhere defined automorphism.

**API.**

- Construct the marked-pair reflection correspondences and compare them with the connection-functor generators on their common domains.
- Prove horizontal and symplectic intertwining, relations and compatibility with parameter changes.
- Record the regular domain and the extension theorem for each claimed global map.

**Checks.**

- The PVI central reflection sends κ₀ to −κ₀ and κⱼ to κⱼ + κ₀ for j = 1,2,3,4. It preserves 2κ₀ + Σκⱼ = 1: at κ₀ = 1/2, κⱼ = 0 the transformed tuple has κ₀ = −1/2 and κⱼ = 1/2, giving −1 + 2 = 1. Omitting the κ₀ sign change gives 3 instead. Local integer shifts and sign changes alone do not construct this reflection.
- A reflection squared must give the original marked family with its comparison arrow, not merely the same boundary diagram.
- A birational formula with a pole on an invariant curve is not an automorphism of that curve until a regular extension is proved.

*Needs:* Internal: 3.6, 3.7, 3.12, 5.2, 5.3, 5.4; [Cohomology with supports](#dependency-supports) (2.7); [Divisors, modifications and surface intersections](#dependency-surfaces) (3.4; 4.11; 4.17; 5.9–5.10).

<a id="target-5-6"></a>
### 5.6 Invariant rational curves and Riccati dynamics

**Painlevé application.**

**Hypotheses.**

- An interior smooth rational curve of self-intersection −2 in an admitted nonfibered additive pair, its stated semiuniversal pair deformation, and the time-direction comparison of 5.3. The continued curve family, its invariance and projective linearization are conclusions, with the required local or finite-base-change scope.

For the admitted nonfibered additive pair, construct the local family of an interior smooth rational curve C with C² = −2. Fix the external parameters at α₀ and, for the curve C in the fiber over (α₀,t₀), construct its family locally along the time base {α₀}×U, with U an analytic or étale neighborhood of t₀; an extension in external-parameter directions requires a separately proved nodal-curve locus and is not inferred from the semiuniversal pair deformation. Prove invariance under the time distribution using the logarithmic deformation sequence. Retain the étale or finite base change needed to continue that family; descent to the original base requires its own monodromy check. On the resulting relative ℙ¹-bundle, identify the restricted connection as a projective linear connection, using H⁰(ℙ¹,Tℙ¹) ≅ sl₂. The coordinate lemma then has q′ = a(t)q² + b(t)q + c(t). A linear rank-two lift is asserted locally, or globally only with its lifting obstruction resolved. (ST04, §2.4, Proposition 2.1, Remark 2.4 and Definition 2.3.) The PVI comparison with the Gauss equation is IIS06 Theorem 5.15; its Theorem 5.16 assumes analytic Painlevé property and is not used as a premise of this independent geometric construction.

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
- A rational solution need not lie on a Riccati curve; ST04 §6.2 supplies this distinction. This target is not a classification of all rational solutions.

*Needs:* Internal: 3.9, 3.10, 3.11, 3.12, 5.1, 5.2, 5.3, 5.4, 5.5; [Cohomology with supports](#dependency-supports) (2.7); [Divisors, modifications and surface intersections](#dependency-surfaces) (3.4; 4.11; 4.17; 5.9–5.10); [Quot/Hilbert and parameter schemes](#dependency-quot) (4.14); [Complex manifolds, holomorphic bundles and observations](#dependency-complex) (K1; K3.0; K3.HolomorphicStalk; K3.MeromorphicGermField; K4; K7.1).

#### Examples

In the PII chart of §7.5 the curve p = 0 is invariant at α = −1/2. Its Riccati equation is the coordinate expression of a projective connection on that curve. The seed q = 0 at α = 0 has different geometry; it must not be used to infer that all rational solutions arise from invariant Riccati curves.

#### Dependencies

Use the exact *Needs* list at each target and the external dependency contracts above. General proof prerequisites belong to their independent package; this layer verifies its stated application comparisons.

<a id="layer-6"></a>

## Layer 6: Determinant lines and tau sections

<a id="analytic-theory"></a>

Construct the holomorphic determinant line and canonical section for general index-zero Fredholm families in §6.1, then apply this construction to the marked Painlevé RHP families in §§6.2–6.5. The applications own their operator realization, index and holomorphic-dependence proofs, line/frame comparisons and the stated JMU/Hamiltonian identities. RandomMatrices §8.3 supplies the generic trace-class determinant where that additional realization is verified.

Bibliographic information and source locators are listed in the [references](#references). The construction models are MAL04 and BERT17; the JMU comparison uses BERT10 with the corrections in BERT16 at the precise loci stated below. Real orientation lines, Toeplitz index results and trace-class determinants retain their distinct scopes.

<a id="target-6-1"></a>
### 6.1 Holomorphic determinant lines for index-zero Fredholm families

**General theory.**

**Hypotheses.**

- A finite-dimensional complex manifold S and a holomorphic family of bounded complex Fredholm operators of index zero, initially between fixed complex Hilbert spaces.
- Finite-dimensional determinant and exact-sequence conventions, bounded local splittings and holomorphic Banach-space inversion; the line, stabilizations, canonical section and comparison cocycles are outputs.

Construct the holomorphic determinant-line family using the complex specialization of the native Fredholm, determinant-line and finite-dimensional stabilization objects. The holomorphic atlas, canonical section and coherent gluing are constructions of 6.1. For a holomorphic family T_s: H₀ → H₁ of bounded complex Fredholm operators of index zero on a finite-dimensional complex manifold S, initially with fixed complex Hilbert spaces, construct a holomorphic line L_T and its canonical determinant section τ_T. Use the convention L_T,s = det(ker T_s)* ⊗ det(coker T_s), dual to the real orientation-line convention. Construct the line even when the dimensions of kernel and cokernel jump. (MAL04, §2, printed pp. 1372–1374, gives the determinant-extension model; BERT17, §1, gives an RHP application within its stated symbol class.)

Locally choose a finite-dimensional complex space F and a: F → H₁ such that (T_s,a): H₀ ⊕ F → H₁ is surjective. Prove that K = ker(T,a) is a holomorphic vector bundle of rank dim F, using a local bounded splitting and holomorphic inversion. Set L_F = det K* ⊗ det F and τ_F = det(K → F), where K → F is the projection. Construct comparison maps under adding stabilizing summands and then through common refinements; prove their cocycle and section-compatibility laws before gluing. Fix the exact-sequence sign convention by requiring that a finite-dimensional family has its ordinary determinant in the standard determinant frame. Prove independence of all stabilization choices, holomorphic base change and naturality under isomorphisms of operator families. Use these same comparison laws to extend from fixed Hilbert spaces to holomorphic Hilbert bundles with specified local trivializations.

Identify τ_T(s) ≠ 0 exactly with invertibility of T_s. Existence of L_T does not imply that τ_T is generically nonzero, nor that it defines an effective divisor without additional hypotheses. Closedness of a proposed curvature two-form does not supply an integral transition cocycle. Applications pull back this one construction and separately establish any RHP realization or logarithmic-derivative formula. This target is restricted to complex-manifold bases and holomorphic base changes between such bases. Nonreduced analytic bases require a separate sheaf-valued operator-family extension retaining nilpotent coefficients; pointwise operators do not determine that extension.

**API.**

- Construct the stabilization kernel bundles, determinant lines and canonical sections with the declared dual convention and finite-dimensional sign calibration.
- Prove refinement compatibility, the cocycle law, stabilization independence and holomorphic base change.
- Prove naturality under operator-family isomorphisms and glue the Hilbert-bundle version through its specified trivializations.
- Identify the section’s nonvanishing locus with the invertible-operator locus without assuming generic nonvanishing or a divisor.

**Checks.**

- For T_s: ℂ → ℂ, z ↦ sz, the standard frames give τ(s) = s, fixing the dual convention.
- For T_s(z) = s²z, the zero has order two although dim ker T₀ = 1; no unconditional equality between vanishing order and kernel dimension is supplied.
- An everywhere invertible constant family has nonvanishing determinant section; an identically singular index-zero family may have an identically zero section without invalidating its line.
- Two finite-dimensional stabilizations must give the same section after comparison through a common refinement, and a third stabilization must not change that comparison.

- On the dual-number base, T=ε and T=0 have the same pointwise operator but determinant sections ε and 0. This nonreduced base is excluded from the present manifold-base theorem; an extension to nonreduced bases requires sheaf-valued operator coefficients.

**Supporting constructions owned by this target.**

- Consume Mathlib's complex ContinuousLinearMap.IsFredholm and nonempty_fredholmPackage, Tau Ceti's IsFredholm.exists_stabilization_kernel_coordinates, kernelHomeomorph and contDiffAt_kerSection, and the pointwise detLine/detLineCongr API. The latter has fibre det ker(T) tensor det coker(T)*; use its dual for L_T. These scalar-generic suppliers apply over C. This target constructs the holomorphic determinant bundle, its canonical section, stabilization comparisons and holomorphic base-change laws. For the holomorphic transition maps use native analytic inversion in the bounded-operator Banach algebra and the actual finite-dimensional stabilization charts.

*Needs:* [Native complex Fredholm and determinant carriers](#dependency-fredholm) (IsFredholm; nonempty_fredholmPackage; exists_stabilization_kernel_coordinates; kernelHomeomorph; contDiffAt_kerSection; detLine; detLineCongr); [Native analytic inversion](#dependency-inversion) (analyticAt_inverse; analyticAt_inverse_one_sub); [Complex manifolds, holomorphic bundles and observations](#dependency-complex) (K1; K3.0; K3.HolomorphicStalk; K3.MeromorphicGermField; K4; K7.1).

<a id="target-6-2"></a>
### 6.2 Determinant lines for Painlevé families

**Painlevé application.**

**Hypotheses.**

- The explicit general complex determinant construction; actual Painlevé operator families are constructed and checked in 6.3.

Use AnalyticRHPAndDeterminants §6.1 for the holomorphic complex index-zero determinant line, its canonical section, finite-dimensional stabilizations and coherent comparison maps. Retain L_T = det(ker T)* ⊗ det(coker T) and the same native complex operator carriers. This target fixes the convention and the import interface used in §6.3; §6.3 must construct the actual operator family and verify index zero and holomorphic dependence. The generic construction is not repeated inside Painlevé, and a real orientation line is not substituted for it.

**API.**

- Fix the dual convention and identify the imported line/section without a second determinant carrier.
- State the exact holomorphic index-zero and descent checks that 6.3 must discharge.

**Checks.**

- For T_s: ℂ → ℂ, z ↦ sz, the standard frames give τ(s) = s, fixing the dual convention.
- For T_s(z) = s²z, the zero has order two although dim ker T₀ = 1; no unconditional equality between vanishing order and kernel dimension is supplied.
- An everywhere invertible constant family has nonvanishing determinant section; an identically singular index-zero family may have an identically zero section without invalidating its line.

*Needs:* Internal: 6.1.

<a id="target-6-3"></a>
### 6.3 An index-zero RHP realization and descent

**Painlevé application.**

**Hypotheses.**

- The decorated connection family and analytic local reconstruction of targets 3.1–4.4, together with the selected auxiliary reference/modification, contours, lattices, branches and normalization. The Fredholm realization and index-zero proof are constructed here; descent is allowed only for comparisons proved to be operator/chain/stable equivalences with acyclic added complexes.

Construct an analytic RHP chart from the decorated connection family of targets 3.1–3.12 and the analytic comparison of §§4.1–4.3. Retain the reference bundle or modification, contours, local lattices, branches, framings and normalization in its marking data. Construct the associated Fredholm operator and prove its index zero; the assertion is not a field added to every connection by fiat. For the initial closed-contour model use a holomorphic invertible jump symbol in a fixed contour neighborhood and zero determinant winding. Compare the solvable normalized RHP with the corresponding marked connection and pull back §6.2's line and section. Extend this construction to the analytic sectorial models for every ramified and resonant stratum retained by §§3.1–3.3, with explicit adapters. Proving these adapters is part of the construction; neither cited generic source is claimed to supply all of them. (BERT17, §1 and Theorem 2.2; MAL04, §2.)

The auxiliary bundle matters. On ℙ¹, rank E = 2 and deg E = d give χ(E(−1)) = d and χ(E(k)) = d + 2k + 2. Thus a degree-minus-one phase object does not acquire an index-zero complex by the unexplained choice E(−1); no integral common line twist has Euler characteristic zero when d is odd. Construct the needed normalized index-zero complex or modification and its comparison with the original connection. Malgrange's degree-zero sewn-bundle construction does not remove this obligation.

Keep the reference bundle and auxiliary modification in the input marking. Unit transition factors for line and section are asserted only for proved equivalences, with any added auxiliary complex everywhere acyclic. An arbitrary change of reference bundle or modification can change the zero divisor. Treat it as a different normalized problem, and construct the relative determinant factor or meromorphic transformation with its divisor instead of declaring the two sections equal up to a unit. BERT17's factorization comparisons do not supply invariance under unrestricted bundle modification.

**API.**

- Construct RHP marking charts and the operator-family functor from their connection data.
- Prove comparison isomorphisms for changes of contour, factorization or normalization which give the same Fredholm family or a proved holomorphic chain/stable equivalence, with their identity and composition laws.
- Construct an equivariant line and section on the marked moduli groupoid/stack. Descend to a coarse space only after proving trivial stabilizer action on the line and section.
- Record exactly which strata have the required analytic adapter; completing the stated adapters is a proof target, not an assertion that the generic cited sources already cover every stratum.

**Checks.**

- The degree-minus-one example fails the E(−1) index test, even though its connection is a valid phase object.
- Scalar automorphisms act by the Euler-characteristic weight, which is zero here; this does not establish trivial action for all other possible stabilizers.
- Two elementary jump factorizations can give different scalar Fredholm determinants. Their nonzero transition factor, not literal equality, is the required comparison.

**Supporting constructions owned by this target.**

- For the initial closed-contour model construct the actual Hardy/Toeplitz comparison and apply T1–T3 to its continuous invertible matrix symbol. Verify zero determinant winding and holomorphic dependence. Prove normalized solvability equivalent to invertibility through the reconstruction map. Zero Fredholm index alone is insufficient for matrix symbols. Sectorial, resonant and ramified models require the separate comparisons specified in this target.

*Needs:* Internal: 3.1, 3.5, 3.6, 3.9, 4.1, 4.2, 4.3, 6.2, 1.2; [Cohomology, duality and curve degree](#dependency-cohomology) (2.2; 2.6; 2.20; 3.3); [Elementary deformation theory](#dependency-deformation) (4.2–4.6); [Stacks, inertia and restricted coarse-space criteria](#dependency-stacks) (1.18–1.23); [Trace-class ideal carrier](#dependency-trace-ideal) (OI-B01–OI-B19; OI-B23; OI-B29–OI-B30); [Matrix-symbol Toeplitz index](#dependency-toeplitz) (T1–T3); [Generic trace-class determinant](#dependency-trace-determinant) (8.3, generic operator-theory prefix).

<a id="target-6-4"></a>
### 6.4 The tau divisor and variational formulas

**Painlevé application.**

**Hypotheses.**

- Constructed determinant section; generic nonvanishing for a proper divisor; exact generic JMU and vertex-correction hypotheses.

Prove that the determinant section vanishes precisely where its normalized RHP is not solvable. On a reduced connected smooth chart where it is not identically zero, construct its effective Cartier divisor; obtain a global divisor only through the line comparisons. This is the failure locus of the selected RHP normalization, not a declaration that the intrinsic phase space or horizontal section ceases to exist. On each 6.1 stabilization chart, choose holomorphic frames for the equal-rank bundles K_stab and F and let S(s) represent the projection K_stab→F. The canonical section has representative det S. Prove d log(det S)=Tr(S⁻¹dS) on its nonvanishing locus and the actual logarithmic correction for a change of determinant frame. This gives the determinant-frame form and scalar normalization on every constructed RHP chart, including the ramified and resonant adapters. Equivalently, K_fin=I−S on the finite-dimensional space F gives the displayed trace-class identity. For a claimed infinite-dimensional integrable-kernel realization K, additionally construct its trace-norm holomorphic family and the comparison τ=u det(I−K), with u nowhere zero; only then use d log τ=d log u−Tr((I−K)⁻¹dK). The JMU/Hamiltonian comparison retains its stated generic locus. On the verified integrable-kernel locus derive the variational formula and its frame-change law. (BERT17, Theorem 2.2, Proposition 2.3, formula (3.6), Theorem 3.3 and §3.1.2.)

Compare with the JMU form only under the stated formal-normalization hypotheses: the generic unramified diagonalizable-leading-term and logarithmic nonresonance locus of BERT10 Assumption 3.1 and §5.1, Proposition 5.1. Use BERT16 Definition 2.1 for the corrected sign, Theorem 2.1 for vertex curvature, and Theorem 2.2, which replaces BERT10 Theorem 5.1. The corrected local formula uses ω_M − θ_V, with dθ_V = η_V on the monodromy parameters. Along fixed-monodromy time directions θ_V has no component; factorization/frame corrections still have to be matched. Neither the raw Malgrange form nor its original modification is asserted closed on the full monodromy-and-time space. Removing contour vertices requires a proved sewing comparison.

**API.**

- Construct the section's divisor and its naturality under the comparisons of §6.3.
- Prove the local variational identity and its change under a nonvanishing frame multiplier.
- Construct the comparison with the selected JMU normalization on exactly the generic unramified, diagonalizable-leading-term and logarithmically nonresonant locus stated above. The delivered JMU comparison makes no assertion on additional ramified or resonant strata. On any such stratum with the proved §6.3 RHP adapter, the determinant section and its finite-dimensional stabilization differential remain the specified objects. The infinite-dimensional trace formula requires the separate trace-class realization and determinant-frame comparison.

**Checks.**

- A zero of the chosen tau representative can occur while the intrinsic horizontal solution continues through that time in another bundle chart.
- The family T_s = s² retains its double zero; the divisor calculation cannot replace multiplicity by kernel dimension.
- A graph with nontrivial vertex limits requires the BERT16 correction; disjoint closed contours do not justify omitting it from an unproved graph-to-contour comparison.
- The local connection d + [[0,z⁻²],[z⁻¹,0]]dz has projective slope 1/2: after z = w² and the gauge diag(1,w), its leading coefficient is 2(E₁₂ + E₂₁)/w². It is outside the JMU comparison locus here. A constructed index-zero RHP adapter still carries the determinant section and its finite-dimensional stabilization logarithmic derivative; no unspecified ramified JMU differential is inferred from that fact.

- On an infinite-dimensional complex Hilbert space, T_s=e^s I is a holomorphic invertible Fredholm family, but T_s⁻¹dT_s=I ds has no trace-class trace. Its determinant-line section has local finite-dimensional stabilization representatives. The general Fredholm input therefore does not justify an infinite-dimensional trace formula.

*Needs:* Internal: 4.1, 6.2, 6.3, 1.2; [Generic trace-class determinant](#dependency-trace-determinant) (8.3, generic operator-theory prefix).

<a id="target-6-5"></a>
### 6.5 Hamiltonians, frames and scalar normalization

**Painlevé application.**

**Hypotheses.**

- JMU/Hamiltonian comparison only on the generic unramified nonresonant locus; broader scalar normalization uses the finite-dimensional stabilization logarithmic form of the constructed RHP determinant section, a fixed frame and a base-point value on a regular time leaf. An infinite-dimensional trace expression additionally requires the verified trace-class realization and frame comparison.

On the JMU comparison locus of §6.4, choose a time coordinate and symplectic chart of the already constructed dynamics and derive the relation between the selected determinant-frame logarithmic derivative and the local Hamiltonian. Prove the exact coefficient and gauge, factorization and time-only correction terms from §6.4; do not silently identify different Hamiltonian conventions. A local primitive supplied by a symplectic chart is not a canonical function on the whole phase family. This Hamiltonian/JMU identity is restricted to that locus, and does not assert an additional ramified/resonant identity. (MAL04, Theorem 5.12 in its logarithmic Schlesinger scope; BERT10, §5.1, Proposition 5.1, with BERT16.)

For every constructed marked RHP chart, including a ramified or resonant chart after its §6.3 adapter is proved, use the stabilization identity of §6.4: in a determinant frame, τ=det S and d log τ=Tr(S⁻¹dS) on the nonvanishing locus, with the proved correction under a frame change. A verified infinite-dimensional realization τ=u det(I−K) gives d log τ=d log u−Tr((I−K)⁻¹dK) on its own trace-class locus. Fix this actual logarithmic one-form and the frame prescription, then establish its scalar normalization by choosing a nonzero value in a determinant fiber at a regular base point. This normalization theorem does not require a JMU or Hamiltonian identification outside the generic comparison locus. (BERT17, Proposition 2.3 and formula (3.6).)

The differential-equation normalization is along a fixed-monodromy horizontal time leaf, away from the chosen divisor. There a closed scalar differential and a base-point value determine the representative on a simply connected domain. Any extension of this assertion to the full monodromy-and-time space must prove the required integrability after its frame corrections; simple connectedness alone does not remove curvature of a line connection.

**API.**

- On the specified JMU comparison locus, compare the symplectic/time convention of §3.11 with the variational identity and record all correction terms. On the broader RHP-adapter locus use the finite-dimensional stabilization identity with its prescribed determinant frame; use an infinite-dimensional trace formula only after its additional trace-class comparison has been proved.
- Prove the transformation laws under a time change, a time-dependent symplectic chart change and a determinant-frame change.
- Prove uniqueness of scalar normalization on a connected simply connected regular domain after its base-point value is fixed; state separately the holonomy obstruction to descent.

**Checks.**

- If an identity uses d log τ = H dt, replacing H by H + c(t) requires multiplying τ by exp(∫c(t)dt), with the integration constant fixed.
- For a new time u = f(t), the same logarithmic one-form has coefficient (dt/du)H; an unchanged scalar coefficient would fail the comparison.
- Two representatives differing by a nonzero constant define the same logarithmic derivative but are different normalized scalar functions until the base-point values agree.

*Needs:* Internal: 3.11, 3.12, 6.3, 6.4; [Complex manifolds, holomorphic bundles and observations](#dependency-complex) (K1; K3.0; K3.HolomorphicStalk; K3.MeromorphicGermField; K4; K7.1).

#### Examples

The one-dimensional operator families s, s² and 1 distinguish section, divisor multiplicity and invertibility. A valid degree-minus-one connection distinguishes the phase object from the auxiliary index-zero RHP complex. A contour/factorization change distinguishes an intrinsic line section from its scalar representatives. These examples test the common construction before any classical tau equation is displayed.

#### Dependencies

Use the exact *Needs* list at each target and the external dependency contracts above. General proof prerequisites belong to their independent package; this layer verifies its stated application comparisons.

<a id="layer-7"></a>

## Layer 7: Classical forms of Painlevé equations

<a id="target-7-1"></a>
### 7.1 First-jet coordinates and scalar Painlevé equations

**Painlevé application.**

**Hypotheses.**

- The actual classical time curve and phase surface, a local observer, and a proved jet-isomorphism domain; no symplectic or Painlevé-property premise is needed for the generic jet theorem.

Use NonlinearConnections §0.8, formulated for an observer bundle and its first-jet bundle. For the classical time curve and phase surface, supply a local observer and prove that the induced jet map is an isomorphism on the stated domain. Apply the general equivalence between horizontal germs and scalar second-order germs on that domain. In a time/phase chart, write h(∂t) = ∂t + A∂q + B∂p and J(t,q,p) = (t,q,A); if p = P(t,q,v) is its genuine inverse, the coordinate comparison is q″ = (A_t + A A_q + B A_p)(t,q,P(t,q,q′)). The chain-rule theorem and intrinsic jet construction belong to the general framework. A_p ≠ 0 gives a local inverse only. Individual classical chart constructions belong to §7.2; meromorphic continuation additionally uses §4.9 and is not a hypothesis of the jet theorem.

**API.**

- Verify each chart/observer jet-isomorphism domain and record its complement.
- Obtain the scalar formula only as the coordinate expression of the imported jet construction.

**Checks.**

- If A = p, the inverse is p = q′ and the scalar equation is q″ = B(t,q,q′).
- If A is independent of p, J forgets the momentum and cannot be a jet chart; scalar uniqueness then cannot be inferred from geometric uniqueness by this argument.
- For A = p² there are two momentum branches away from p = 0; local invertibility does not identify the two branches globally.
- If a scalar formula divides by q, a solution crossing q = 0 must be treated through overlapping phase charts, not by declaring that the cleared denominator creates new solutions.

*Needs:* Internal: 3.4, 3.7, 3.9, 0.8.

<a id="target-7-2"></a>
### 7.2 Exhaustive presentation and equation comparisons

**Painlevé application.**

**Hypotheses.**

- The profile classification of 3.4 and the already constructed intrinsic moduli, splitting, symplectic form and continuation theorem. The concrete charts, parameter/time substitutions, jet inverses and coverage/overlap comparisons for those profiles are outputs of this target.

For every profile in §3.4 construct a concrete time/Darboux or equivalent symplectic chart from the connection moduli, with its inverse on its actual image. Identify h in this chart by the strong integrable extension of §3.9, apply §7.1, and prove the parameter and time-substitution dictionary to the standard equation below, including the required marking covers. The required comparison records the chosen local frames, the determinant convention, the chart domain, the momentum inverse, every denominator, and the omitted loci. Coverage of the full moduli space is the overlap theorem, not the claim that one rational chart covers it. Re-derive the scalar expression from the compatible system; the source corrections in §7.4 are part of the comparison. (VDPS09, §2.2, Table 1 and §4; IIS06, Theorems 10.6, 10.10 and 10.13; DLMF, §32.2(i), equations 32.2.1–32.2.6.)

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

Prove the actual substitutions and admissible inverse domains relating the Flaschka–Newell scalar coordinate to PII and degenerate PV to PIII(D₆). Two rows sharing a boundary type are not declared identical decorated moduli problems. In particular, a scalar substitution from degenerate PV to PIII does not by itself identify their isomonodromic families. (AHT17, introduction and §§2–3.)

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
| VDPS09 PV system (2)/(5), with the scalar correction in §7.4 | T = t, Q = q/(q − 1); (α,β,γ,δ) = (θ₁²/2,−θ₀²/2,1 − θ∞,−1/2) |
| VDPS09 degenerate PV system (8) | T = t², Q = q/(q − 1); (α,β,γ,δ) = (θ₁²/2,−θ₀²/2,−2,0) |
| VDPS09 PIII(D₆), (14) | T = t, Q = q; (α,β,γ,δ) = (4(θ∞ + 1),−4θ₀,4,−4) |
| VDPS09 PIII(D₇), (19) | t = T², Q(T) = Tq(T²); (α,β,γ,δ) = (4(θ∞ + 1),−8,4,0) |
| VDPS09 PIII(D₈), (24) | t = T², Q(T) = q(T²)/T; (α,β,γ,δ) = (8,−8,0,0) |
| VDPS09 PIV, (29) | t = 2T, Q(T) = 2q(2T); α = −θ∞ − 1, β = −2θ₀² |
| VDPS09 PII Jimbo–Miwa, (39) | T = t, Q = q; α = (θ∞ + 1)/2 |
| VDPS09 PI, (45), choose c⁵ = 2 | T = ct, Q = c⁻²q; Q″ = 6Q² + T |

For the Flaschka–Newell coordinate (34), choose c³ = 2 and set T = −ct, U(T) = cq(t). Then U″ = U′²/(2U) + 2U² − TU − θ₀²/(2U). Retain a chosen exponent sign a = ±θ₀. On U ≠ 0, Q = (U′ − a)/(2U) is the PII variable with α = a − 1/2; conversely U = Q′ + Q² + T/2. The exceptional branch U = 0, a = 0 cannot be reconstructed by division and keeps its full phase data. The square-time comparisons are local biholomorphisms on their nonzero domains or comparisons on the indicated covers; they are not global changes of coordinate on the same punctured line.

**API.**

- Export one comparison package per listed presentation, containing the explicit formulas, parameter map, inverse jet chart and overlap maps.
- Compare the source-specific Hamiltonian and the convention of §3.11 by equality of extended forms.
- Identify all excluded denominators and the phase charts through their allowed zero loci.
- Deduce the standard scalar Painlevé property from §4.9 on every observer stratum covered by the comparison.

**Checks.**

- There are ten presentation rows and eight boundary types; identifying every row with a different classical equation fails both counts.
- The standard PI scaling above changes both q and t. Rescaling t alone does not recover the coefficient 6 of q².
- PII's two linear-system presentations have different local singularity data; equality of their scalar solution formulas is not equality of input objects.
- A PIII comparison with γ = 4, δ = −4 cannot cover γ = δ = 0 by a nonzero scaling; the latter belongs to the boundary analysis of §7.3.

*Needs:* Internal: 3.4, 3.5, 3.6, 3.7, 3.8, 3.9, 3.10, 3.11, 3.12, 4.9, 5.2, 7.1.

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

Prove that the PIII cases cover all tuples; the two elementary alternatives may overlap and are combined into one boundary class. Derive the boundary integrations on their stated time/observer domains, with branches and integration constants retained. PIII with all four coefficients zero gives q = C exp(μ log t) on a chosen cover of ℂ*, including its nonzero-solution domain. A generic such power is not a single-valued function on ℂ*. Zero/constant solutions introduced by clearing q denominators require a separate original-equation domain check. These examples prevent the primitive classification from silently losing coefficient values.

*Needs:* Internal: 7.1, 7.2; [Formal scalar and vector-valued Laurent algebra](#dependency-formal-series) (L1–L4; L5–L6 for finite-extension steps in 1.1); [Covering spaces and universal covers](#dependency-covers) (Stage 0.2–0.4; Stage 1.5; Stage 2.6–2.8).

<a id="target-7-4"></a>
### 7.4 Hamiltonian, sigma and linear-system realizations

**Painlevé application.**

**Hypotheses.**

- The earlier geometric transformation, determinant-variation and coordinate-comparison results, on their actual stated domains. The sigma converse has its explicit reconstruction nondegeneracy hypothesis; source-sign corrections and the comparisons of Hamiltonian, sigma and linear-system displays are proved here.

For each admitted presentation, derive the displayed Hamiltonian system from h and ω, and derive the Lax-pair compatibility from the same strong total connection. For sigma equations, transformations and tau logarithmic derivatives, state a forward lemma and a converse only on the locus where the reconstruction has been proved. Track additive Hamiltonian functions of time, multiplicative tau normalizations, branch choices and exceptional derivatives explicitly. (DLMF, §§32.6–32.7; VDPS09, §4; IIS06, Theorem 10.13; BERT17, Proposition 2.3 and Theorem 3.3.)

The source sign comparison is itself a lemma. In VDPS09 §4.1 the displayed equations p′ = F H_q, q′ = −F H_p, with F depending only on q, have kernel form dp ∧ dq/F + dH ∧ dt. The printed minus sign in that extended form is inconsistent with those equations, including the PI instance (44), (46), (47). On F ≠ 0, set Q = q, P = p/F(q), K(Q,P,t) = −H(F(Q)P,Q,t), using the source's argument order H(p,q,t); then dQ ∧ dP + dK ∧ dt is the negative of the correct source form and gives the convention of §3.11. Verify this identity directly before importing any source Hamiltonian.

VDPS09's printed PV equation (3) also disagrees with its system (2) and Hamiltonian (5). Differentiating q′ = 2p/t gives the exponent term [θ₀²(q − 1)² − θ₁²q²]/[2q(q − 1)t²], in place of the printed θ₀²/(2qt²) + θ₁²/[2(q − 1)t²]. At t = 1, q = 2, p = 0, θ₀ = 0, θ₁ = 1, θ∞ = 1, the compatible system gives q″ = 2 while the printed scalar equation gives 7/2. The comparison uses the re-derived expression and then the PV substitution of §7.2.

For sigma reconstruction include the derivative-nondegeneracy hypothesis and analytic extension argument. For example, the PI sigma relation (σ″)² + 4(σ′)³ + 2tσ′ − 2σ = 0 admits σ ≡ 0, whereas q = −σ′ ≡ 0 does not solve q″ = 6q² + t. Thus the unqualified reverse implication is false. On the branch σ″ not identically zero, differentiating and then extending the resulting analytic identity gives the required reconstruction. The entire excluded branch is σ = at + 2a³ with a constant; its q = −a never solves PI on an open time domain. This explicitly identifies the spurious scalar branches of this sigma relation.

Distinguish this PI obstruction from loss of phase information on a genuine invariant locus. In the PII normalization of §7.5, put c = α + 1/2 and σ = H. Direct differentiation gives σ′ = −p/2 and σ″ = 2qσ′ − c/2, hence q = (2σ″ + c)/(4σ′) and p = −2σ′ on σ′ ≠ 0. At c = 0 and p = 0, every Riccati trajectory q′ = −q² − t/2 has σ ≡ 0. These are genuine phase trajectories with distinct initial q, all having the same scalar sigma function. Retain that phase/initial-point data on this locus; there is no sigma-only inverse there. Isolated zeros of σ′ in the reconstructible branch require the stated analytic extension comparison, not totalized division.

*Needs:* Internal: 3.11, 5.4, 5.5, 6.4, 6.5, 7.1, 7.2, 7.3.

<a id="target-7-5"></a>
### 7.5 Concrete normalizations and special-solution checks

**Painlevé application.**

**Hypotheses.**

- The PI/PII connection-moduli comparisons already constructed in 7.2, the first-jet lemma and the admitted geometric transformations. The stated Hamiltonian normalizations, momentum inverse and seed solution identities must be derived; exceptional domains and the Riccati parameter α=−1/2 are retained.

Prove the PI chart H = p²/2 − 2q³ − tq and the PII chart H = p²/2 − (q² + t/2)p − (α + 1/2)q from the corresponding moduli charts, and apply §7.1. The PII jet inverse is p = q′ + q² + t/2. The polynomial chart covers all finite (q,q′), while poles use the other phase charts. Establish its parameter dictionary with §7.2. (VDPS09, §§4.10–4.11; DLMF, §§32.2, 32.6 and 32.9.)

Construct the rational and classical-function families generated from the proved seed objects by §§5.4–5.5's admitted transformations, and prove their formulas only as the resulting coordinate lemmas. No completeness classification of all rational or algebraic solutions is imported from these few seeds.

**Checks.**

- At α = 0, q = 0 and p = t/2 form a horizontal section in this chart.
- At α = 1 and t ≠ 0, q = −1/t and p = 2/t² + t/2 satisfy both Hamilton equations; at t = 0 their geometric continuation uses another chart.
- At α = −1/2, p = 0 is invariant and q′ = −q² − t/2. Setting q = u′/u gives u″ = −tu/2 on u ≠ 0; this is the projective linearization of §5.6, with zeros of u interpreted in ℙ¹.
- H ↦ H + c(t) leaves both tests horizontal, but changes a normalized Hamiltonian tau representative by the corresponding exponential primitive when the identity of §6.5 applies.

*Needs:* Internal: 5.4, 5.5, 5.6, 6.5, 7.1, 7.2, 7.3, 7.4.

#### Examples

The scalar equation may have an apparent denominator at a perfectly regular geometric initial point. Conversely, a denominator-cleared polynomial identity may admit functions absent from the original equation. The first-jet chart and the observer comparison resolve both issues without changing the intrinsic solution definition.

#### Dependencies

Use the exact *Needs* list at each target and the external dependency contracts above. General proof prerequisites belong to their independent package; this layer verifies its stated application comparisons.

### Scope boundaries

Boundary-value asymptotics, connection constants, Hastings–McLeod identification, confluence and Garnier applications lie outside this roadmap. The finite-flat unfolding in §1.6 proves closedness of the symplectic form; §7.3 covers coefficient-boundary equations.

<a id="references"></a>

### References

- **I13.** Michi-aki Inaba. *[Moduli of parabolic connections on a curve and Riemann–Hilbert correspondence](https://arxiv.org/abs/math/0602004v2)*. Journal of Algebraic Geometry 22 (2013), 407–480. Cited preprint: arXiv math/0602004v2, 6 June 2012; Theorems 2.1–2.2, preprint pp. 5–6; §§1, 6. The family properness theorem uses the exponent fiber product and its exact numerical/stability hypotheses.

- **I23.** Michi-aki Inaba. *[Moduli Space of Factorized Ramified Connections and Generalized Isomonodromic Deformation](https://sigma-journal.com/2023/013/)*. SIGMA 19 (2023), 013, 72 pages. Publisher version, 22 March 2023. Locators: Definitions 2.1–2.8; Remark 2.9; Theorems 5.1, 7.5, 8.1, 9.7 and 11.6; equation (6.9); Propositions 6.3, 7.2, 8.2–8.3, 10.7 and 10.10; Definitions 10.1 and 11.4; Corollaries 9.11 and 11.8; equations (8.2), (11.2) and (11.5).

- **IS12.** Michi-aki Inaba; Masa-Hiko Saito. *[Moduli of unramified irregular singular parabolic connections on a smooth projective curve](https://arxiv.org/abs/1203.0084v3)*. Kyoto Journal of Mathematics 53(2) (2013), 433–482. Cited version: arXiv 1203.0084v3 (22 November 2012); the key retains the preprint year. Locators: Theorem 5.1; Remark 6.3.

- **HEU10.** Viktoria Heu. *[Universal isomonodromic deformations of meromorphic rank 2 connections on curves](https://www.numdam.org/item/AIF_2010__60_2_515_0/)*. Annales de l'Institut Fourier 60(2) (2010), 515–549. Published text through NUMDAM; printed pp. 515–549. Locators: Theorem 1.1; Definitions 2.3 and 2.10; §2.

- **VDPS09.** Marius van der Put; Masa-Hiko Saito. *[Moduli spaces for linear differential equations and the Painlevé equations](https://arxiv.org/abs/0902.1702v5)*. Annales de l'Institut Fourier 59(7) (2009), 2611–2667. Cited version: arXiv 0902.1702v5 (12 November 2009); remaining internal inconsistencies are identified in §7.4. Locators: §2.2, Table 1, preprint pp. 18–19; §3; §4.1 and §§4.3–4.11; equations (12), (17) and (22).

- **IIS06.** Michi-aki Inaba; Katsunori Iwasaki; Masa-Hiko Saito. *[Dynamics of the Sixth Painlevé Equation](https://arxiv.org/abs/math/0501007v2)*. Séminaires et Congrès 14 (2006), 103–167. Cited version: arXiv math/0501007v2 (6 March 2005). Locators: Definitions 2.1–2.2 and 2.11; Lemma 2.12; Definition 3.5; Theorems 4.10–4.12, 5.15–5.16, 7.4, 10.6, 10.10 and 10.13; §§5, 7 and 10.

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

- **DLMF.** P. A. Clarkson, *[Painlevé Transcendents, Chapter 32 of the NIST Digital Library of Mathematical Functions](https://dlmf.nist.gov/32)*. Version 1.2.8, released 15 September 2026. [§32.2](https://dlmf.nist.gov/32.2), equations 32.2.1–32.2.6; [§32.6](https://dlmf.nist.gov/32.6); [§32.7](https://dlmf.nist.gov/32.7); [§32.9](https://dlmf.nist.gov/32.9), especially equations 32.9.6 and 32.9.12. Standard scalar displays and normalization reference.
