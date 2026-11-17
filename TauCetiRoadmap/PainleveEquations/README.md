# Roadmap: Painlevé equations

**Summary.** Construct differential Painlevé equations as flat nonlinear connections on moduli spaces of decorated meromorphic connections, and Painlevé functions as their horizontal sections and admissible observations. Prove their properties from those constructions. The classical scalar equations, Hamiltonians and linear systems are coordinate comparison theorems.

The roadmap contains 55 construction and theorem targets in eight layers: 19 targets of reusable general theory and 36 targets for the classical Painlevé application.

## How to read the build

Each layer develops one mathematical construction or theorem package. General results retain their own hypotheses, conclusions and proof ownership when placed alongside an application.

| Layer | Mathematical development | Targets |
|---:|---|---:|
| [0](#layer-0-nonlinear-connections-and-their-solutions) | Nonlinear connections and their solutions | 8 |
| [1](#layer-1-moduli-of-decorated-meromorphic-connections) | Moduli of decorated meromorphic connections | 6 |
| [2](#layer-2-isomonodromic-connections) | Isomonodromic connections | 4 |
| [3](#layer-3-phase-spaces-and-isomonodromic-deformations-of-painlevé-equations) | Phase spaces and isomonodromic deformations of Painlevé equations | 12 |
| [4](#layer-4-riemannhilbert-comparison-and-the-painlevé-property) | Riemann–Hilbert comparison and the Painlevé property | 9 |
| [5](#layer-5-initial-condition-surfaces-symmetries-and-riccati-reductions) | Initial-condition surfaces, symmetries and Riccati reductions | 6 |
| [6](#layer-6-determinant-lines-and-tau-sections) | Determinant lines and tau sections | 5 |
| [7](#layer-7-classical-forms-of-painlevé-equations) | Classical forms of Painlevé equations | 5 |

## Scope and ownership

The scope consists of the 55 targets below. Each target includes its constructions, basic API, comparison maps and specified examples, under the stated hypotheses.

| Reusable general theory | Targets |
|---|---|
| Nonlinear connections, solutions, transport, observations and jets | 0.1–0.8 |
| Moduli of decorated meromorphic connections | 1.1–1.6 |
| Isomonodromic connections | 2.1–2.4 |
| Determinant lines of holomorphic Fredholm families | 6.1 |

The 19 general targets form an independent theory. The 36 application targets construct Painlevé phase spaces, connections and forms from it and establish their properties. Their dependencies are the prerequisites listed at each target. In particular, the geometric constructions and properties in Layers 3–6 precede the classical coordinate comparisons in Layer 7.

ComplexComparisonPartII supplies relative Picard representability and the identity-component criterion. Section 1.5 verifies the curve-family hypotheses and constructs the determinant moduli, and §5.1 verifies the hypotheses for the possibly nonreduced anticanonical boundary.

The scope excludes difference and q-difference Painlevé dynamics, discrete Sakai classification, cluster realizations, arbitrary-rank wild nonabelian Hodge theory, exhaustive classification of algebraic special solutions, boundary-value asymptotics and connection constants, Hastings–McLeod identification, confluence, and Garnier systems.

External roadmaps supply the results listed in the dependency contracts. Each construction made here has a specified target. Applications use the general objects, morphisms and pullbacks through the stated hypotheses and comparison maps.

## Conventions

Layers are numbered 0–7, and targets are numbered consecutively within each layer, as in 0.1 and 0.2. Literature and supplier sections use their source numbering. The *Needs* lists specify proof prerequisites. Each target states its hypotheses, constructions and comparison laws. For a connection written ∇ = d + A, the logarithmic residue λ gives the monodromy eigenvalue exp(−2πiλ). Time transport fixes the additive exponents. The Hamiltonian convention is ω = dq ∧ dp with q′ = ∂H/∂p and p′ = −∂H/∂q.

## Exact supplier contracts

Roadmap references specify constructions and theorems with their hypotheses. Library references specify declarations and APIs. The table identifies the supplied results and the constructions assigned to this roadmap.

### Supplier complex

[ComplexKahlerGeometry](../../TauCetiRoadmap/ComplexKahlerGeometry/README.md) — K1; K3.0; K3.HolomorphicStalk; K3.MeromorphicGermField; K4; K7.1. Complex inverse/implicit-function and tangent calculus; holomorphic germs and one-variable meromorphic germs; holomorphic bundle/sheaf equivalence and nonsingular flat connections/local systems; projective charts. The nonlinear-connection theory owns nonlinear connections, holomorphic ODEs, transport and observations. 1.1–1.2 own the meromorphic/decorated applications of the shared connection and analytification interfaces; K4 supplies the nonsingular holomorphic comparison. 3.8 constructs the local logarithmic monodromy family and its holomorphic parameter and base-change comparisons.

### Supplier smooth

[SmoothBundlesConnections](../../TauCetiRoadmap/SmoothBundlesConnections/README.md) — B1.5; B5.0; B5.2. B1.5 supplies smooth real Ehresmann connections, pullbacks, restrictions and maximal horizontal lifts. §§0.1–0.3 supply the non-surjective, C¹/continuous-time and holomorphic extensions. B5.0 and B5.2 supply their stated bundle and principal transport.

### Supplier differential

[DifferentialGeometry](../../TauCetiRoadmap/DifferentialGeometry/README.md) — Layers 0–1; 3.1–3.5. Finite-dimensional manifolds, charts and smooth local/maximal/time-dependent flows. §0.2 compares their autonomous specializations, and §0.8 constructs intrinsic jets.

### Supplier ode

Mathlib, ODE Picard–Lindelöf. Use `IsPicardLindelof`, `exists_eq_forall_mem_Icc_hasDerivWithinAt`, `exists_forall_mem_closedBall_eq_hasDerivWithinAt_lipschitzOnWith` and `ODE_solution_unique_of_mem_Icc` for the time-dependent coordinate theorem. §0.2 proves manifold gluing and compact extension.

### Supplier frobenius

`TauCeti.Analysis.ODE.Frobenius` — TauCeti.exists_frobenius_flat_coordinate. For a finite-dimensional real integrable graph field, a local product OpenPartialHomeomorph with a smooth inverse and the prescribed horizontal derivatives, at the stated regularity. 0.5 constructs the submersion-chart graph field, proves curvature implies its integrability, and glues these local products for homotopy-invariant transport. 0.3 supplies the holomorphic counterpart.

### Supplier covers

[Completed/UniversalCovers](../../Completed/UniversalCovers/README.md) — Stage 0.2–0.4; Stage 1.5; Stage 2.6–2.8. Native covering, path and homotopy lifting, universal covers and their fundamental-group interfaces. 0.5 constructs the nonlinear action and horizontal descent; general-cover descent uses the actual fiber relation, not deck invariance without normality. 3.8 constructs local monodromy from marked loops and proves its homotopy and basepoint comparisons.

### Supplier curves

[ComplexCurveModuli](../../TauCetiRoadmap/ComplexCurveModuli/README.md); [SchemeAndStackFoundations](../../TauCetiRoadmap/SchemeAndStackFoundations/README.md) — ComplexCurveModuli D0.3, D3–D5; SchemeAndStackFoundations 4.15. Genus-zero Möbius normalization and supported point-pushing; stable marked-curve deformation charts in the stable range. 1.2 constructs unstable one-/two-pointed quotient charts, finite jets, local markings and determinant transport. Analytic spaces and analytification are supplied by ComplexComparisonPartII, with the fixed-model scheme comparison from FormalConnectionsOpers F2.4.

### Supplier stacks

[SchemeAndStackFoundations](../../TauCetiRoadmap/SchemeAndStackFoundations/README.md) — 1.18–1.23. Stackification, 2-fiber products, algebraic/DM presentations, inertia, QCoh descent, and finite-inertia Keel–Mori at its hypotheses. 1.3 proves bounded GIT, scalar Gm rigidification, gerbe and coarse comparisons. Finite-inertia criteria do not apply to an unrigidified Gm stable stack.

### Supplier quotient-predicates

[SchemeAndStackFoundations](../../TauCetiRoadmap/SchemeAndStackFoundations/README.md) — 1.17. Categorical/geometric quotient definitions, Artin bootstrap and the stated finite-group projective quotients. Use the reductive GIT contract below. 4.2 constructs the classical representation and character quotients, wild framing groupoids and Stokes quotients.

### Supplier reductive-git

What AlgebraicModuliForArithmeticGeometry must provide (gap:reductive-connection-git): for a projective G-equivariant morphism X→X₀ over ℂ with X₀ affine of finite type, G affine linearly reductive and a relatively ample G-linearized line bundle, construct the relative invariant Proj projective over X₀//G and identify the quotient with the geometric quotient of the stable locus wherever stable equals semistable.

What AlgebraicModuliForArithmeticGeometry must provide (gap:relative-hilbert-mumford): for a projective G-equivariant morphism X→X₀ of finite-type ℂ-schemes with X₀ affine, G affine linearly reductive and ℒ a G-linearized relatively ample invertible sheaf, a complex point is ℒ-semistable exactly when the weight on the limiting fiber of ℒ is ≥ 0 for every one-parameter subgroup with a limit in X, and ℒ-stable exactly when it is > 0 for every nontrivial such subgroup.

The weight is the exponent w in the action v↦tʷv on the fiber of ℒ, equivalently minus the weight on its dual. Stability in this criterion uses finite stabilizers for the group being tested (GHH15, Proposition 2.7, Definition 3.1, Corollary 1.1 and Theorem 3.3). To test stability modulo a central subgroup, first verify that it acts trivially on the presentation and the linearized sheaf and apply the criterion to the descended action. The relative invariant Proj construction supplies finite generation and the affine reductive quotient. Sections 1.3 and 4.2–4.4 supply the spaces, actions, linearizations and numerical comparisons for the connection and Stokes frames.

### Supplier quot

[SchemeAndStackFoundations](../../TauCetiRoadmap/SchemeAndStackFoundations/README.md) — 4.14. Noetherian projective Quot/Hilbert and Hom/Isom parameter spaces with their stated base-change laws. 1.3 proves boundedness, the equations and stability/GIT comparison. Analytic pullbacks use 1.2.

### Supplier cohomology

[SchemeAndStackFoundations](../../TauCetiRoadmap/SchemeAndStackFoundations/README.md) — 2.2; 2.6; 2.20; 3.3. Čech and sheaf cohomology, coherent terms, relative/Serre duality, degrees and curve Riemann–Roch at the stated hypotheses. 1.4 constructs the constrained C-linear differential-operator deformation complex and ramified cone, its trace and duality comparisons, using C5.1 for the generic operator/principal-parts and GAGA theory. Coherent underlying terms do not make the differential O-linear.

### Supplier deformation

[SchemeAndStackFoundations](../../TauCetiRoadmap/SchemeAndStackFoundations/README.md) — 4.2–4.6. Artinian coefficients, deformation functors, hulls and elementary small-extension obstruction calculations. 1.4 constructs actual connection cocycles, the needed arbitrary finite square-zero kernels and framed versality; 2.1 constructs strong horizontal extensions.

### Supplier bundles

[AlgebraicVectorBundles](../../TauCetiRoadmap/AlgebraicVectorBundles/README.md) — L0A–L0C; L1A–L1B; L2A–L2B. Finite locally free sheaves, duals/tensors/determinants, relative Spec and the geometric vector-bundle equivalence. 1.1 constructs decorated meromorphic connections using the shared ordinary/formal carriers; 1.2 applies the shared analytification to these objects.

### Supplier ordinary-connections

CrystallineCohomology §CR.1.3 supplies the ordinary connection carrier and operations. Ordinary form connections over arbitrary commutative base rings, extension, curvature, horizontal maps, base change and tensor/Hom/dual operations; no integrability condition in the carrier. 1.1 constructs the polar-bound and decoration conditions on the shared connection and proves determinant/End⁰ and localized comparisons, without a second ordinary connection carrier.

### Supplier formal-connections

FormalConnectionsOpers §F1.1–§F1.3, §F2.1 and §F3.3–§F3.4. Relative continuous differentials/completed tensors, formal-coordinate automorphisms and their pullback action, Tate coefficient descent, continuous/formal connection carrier and the left gauge groupoid; F3.4 stackification has its coefficient-cover essential-image criterion. 1.1 compares completions of the actual decorated bundles, verifies the extending-torsor criterion, and owns ramified decorated descent, Levelt–Turrittin and relative factorized models. Left gauge h corresponds to frame change g=h⁻¹.

### Supplier analytic-spaces

ComplexComparisonPartII — C−1.1–C−1.2; C0.3–C0.5; C0.7; C5.2: ordinary connection comparison prefix. One analytic-space category retaining nilpotents, locally finite-type scheme and locally separated finite-type algebraic-space analytification, coherent/tensor/pullback and étale descent comparisons, proper-morphism comparison and the ordinary holomorphic-connection dictionary. 1.2 verifies these constructions on the actual curve/time/moduli presentations, extends the comparison to polar and decorated data, and constructs smooth analytic pullback and manifold comparisons with their actual topological/dimension hypotheses.

### Supplier regular-singular

ComplexComparisonPartII C5.6. Use `RegularSingular` and `CanonicalLogExtension`, monodromy conjugacy in the chosen strip and the logarithmic-lattice criterion. §§3.8, 4.1 and 4.3 compare the actual decorated families, resonant lifts and determinants.

### Supplier coherent-gaga

ComplexComparisonPartII — C1.9. Projective and proper coherent GAGA, all-degree proper direct-image comparison on finite-type complex schemes and proper-space comparison, with nilpotents and the stated canonical exchange maps. 1.2 checks the proper-family/coherence hypotheses and identifies maps on the actual curve, bundle and determinant constructions; 1.4 uses these comparisons through the supplied operator-complex theorem, preserving base-change hypotheses.

### Supplier differential-operators

ComplexComparisonPartII — C5.1: shared algebraic operators/principal parts; C5.1: DifferentialOperatorAnalytification; C5.1: boundedOperatorHyperGaga. Characteristic-free all-order operator predicate/principal parts, universal jets, composition/localization/sheafification, analytification and absolute/relative proper bounded operator-complex GAGA at the stated hypotheses. 1.1 applies the first-order interface to meromorphic Leibniz operators; 1.2 compares decorated meromorphic data; 1.4 constructs the constrained deformation complex and ramified cone and verifies order, coherence, relative linearity, trace, duality and base-change comparisons.

### Supplier algebraic-manifolds

FormalConnectionsOpers §F2.4 supplies fixed-model analytification and sheaf/tangent comparisons. Fixed-model complex manifold realization for separated smooth finite-type complex schemes of constant differential dimension, second countability, dimension and sheaf/tangent/étale comparisons with the same analytification. 1.2 applies this on scheme charts and descends the actual moduli comparisons via the supplied algebraic-space analytification; arbitrary smooth analytic bases require their analytic-chart comparison and verified Hausdorff/second-countable/dimension hypotheses.

### Supplier proper-cohomology

[JacobianChallenge](../../TauCetiRoadmap/JacobianChallenge/README.md) — Layer C. Proper coherent pushforwards and separately stated flat-base-change and cohomology/base-change criteria; Grauert under its reduced-base and constant-rank assumptions. 1.5 uses the proper cohomology and base-change criteria for the curve families; 5.3 verifies boundary-coefficient flatness and the exact locally free/arbitrary-base-change criterion.

### Supplier field-picard

[JacobianChallenge](../../TauCetiRoadmap/JacobianChallenge/README.md) Layer D supplies Picard and Jacobian theory for fixed smooth projective curves. [SchemeAndStackFoundations](../../TauCetiRoadmap/SchemeAndStackFoundations/README.md) §§1.1, 2.6, 3.4, 4.6 and 4.14 supply line-bundle descent and deformation and the field-case Picard foundations.

### Supplier relative-picard

ComplexComparisonPartII §C3.2d.2–§C3.2d.3 supplies `relative_picard_algebraicSpace` for projective flat finitely presented families with universally O_T ≅ (p_T)_*O, together with quasi-separatedness, local finite presentation and its diagonal description. Use separatedness from that supplier under its geometrically integral fiber hypothesis. ComplexComparisonPartII §C3.2f.1–§C3.2f.2 supplies `picardZeroSheaf` and `picardZeroCriterion`, including the geometric smoothness and locally constant dimension hypotheses and the sufficient formal smoothness test over a nonreduced base. AlgebraicModuliForArithmeticGeometry §7.3 supplies the framed Artinian line-bundle lifting interface `picard_infinitesimal_lifting`. Section 1.5 verifies the relative affine lifting and cohomology hypotheses in dimension at most one and constructs the line-connection torsor. Section 5.1 verifies the boundary hypotheses and computes the additive group.

### Supplier supports

[SchemeAndStackFoundations](../../TauCetiRoadmap/SchemeAndStackFoundations/README.md) — 2.7. Supported cohomology, localization/excision and the Noetherian colimit-of-Ext comparison with native local cohomology. 5.3 constructs the first boundary-layer line, its injection into supported cohomology and its identification with the time line.

### Supplier surfaces

[SchemeAndStackFoundations](../../TauCetiRoadmap/SchemeAndStackFoundations/README.md) — 3.4; 4.11; 4.17; 5.9–5.10. Divisor/Picard groups, blowups and strict transforms, normal crossings, surface intersection/adjunction and lattice theory. 5.1–5.3 construct the nonreduced anticanonical boundary, relative logarithmic deformation and family comparisons; targets 5.4–5.6 construct the geometric transformations.

### Supplier formal-series

[FormalLaurentPuiseux](../../TauCetiRoadmap/FormalLaurentPuiseux/README.md) — L1–L4; L5–L6 for finite-extension steps in 1.1. Formal substitutions, continuous differentials, finite-dimensional HahnModule comparisons, residue/duality, ramified exponent embeddings and the stated finite-extension algebra. 1.1 proves differential-module Levelt–Turrittin decomposition and descent.

### Supplier fredholm

`Mathlib.Analysis.Normed.Operator.Fredholm.Basic`; `TauCeti.Analysis.Fredholm.Stabilization`; `TauCeti.Analysis.Normed.Operator.Splitting.Family`; `TauCeti.LinearAlgebra.Determinant.Line` — IsFredholm; nonempty_fredholmPackage; exists_stabilization_kernel_coordinates; kernelHomeomorph; contDiffAt_kerSection; detLine; detLineCongr. Scalar-generic finite-dimensional kernel/cokernel, stabilization coordinates and pointwise determinant-line comparisons; specialize over ℂ and dualize the convention. 6.1 constructs the holomorphic family, canonical section, transition cocycle and base-change laws.

### Supplier inversion

`Mathlib.Analysis.Analytic.Constructions` — analyticAt_inverse; analyticAt_inverse_one_sub. Analytic inversion on units of a complete normed algebra and the small-norm inverse. 6.1 proves the actual holomorphic family-to-operator maps used in stabilization.

### Supplier trace-ideal

[OperatorTheory/OperatorIdeals](../../TauCetiRoadmap/OperatorTheory/OperatorIdeals/README.md) — OI-B01–OI-B19; OI-B23; OI-B29–OI-B30. Normed complete trace-class ideal, nuclear gauge and two-sided ideal estimates. 6.3–6.4 verify actual trace-class realizations and their trace-norm holomorphic dependence where used.

### Supplier trace-determinant

[RandomMatrices](../../TauCetiRoadmap/RandomMatrices/README.md) — 8.3, generic operator-theory prefix. Trace, exterior powers, generic Fredholm determinant series and trace-norm continuity before the positive-kernel point-process specialization. 6.4 proves the logarithmic derivative, its holomorphic-family hypotheses and the integrable-kernel comparison.

### Supplier toeplitz

[OperatorTheory/ToeplitzOperators](../../TauCetiRoadmap/OperatorTheory/ToeplitzOperators/README.md) — T1–T3. Circle Hardy models and Fredholm index equal to minus determinant winding for continuous invertible matrix symbols. 6.3 constructs contour/Hardy, holomorphic-family, index-zero, resonant and ramified adapters. Index zero alone does not imply invertibility.

### Supplier curve-functions

`TauCeti.Analysis.Complex.RiemannSurface.FunctionField`; `TauCeti.Analysis.Complex.RiemannSurface.FunctionField.Comap` — TauCeti.RiemannSurface.MeromorphicFunction; Nonconstant curve pullback and order comparison. Holomorphic maps from a Riemann surface to OnePoint ℂ with a witness excluding the constant-infinity map; native pullback and orders. 0.7 proves phase-observation admissibility and scalar descent; its scalar output uses this same carrier.

### Supplier proper

`Mathlib.Topology.Maps.Proper.Basic` — IsProperMap. Topological proper maps and the compact-preimage and base-change properties under their actual topological hypotheses. 0.4 proves complete-lift transfer. 1.2 applies the supplied analytic/algebraic comparison to the actual families; 4.4 proves properness of the actual RH family.

## Layer 0: Nonlinear connections and their solutions

Develop nonlinear connections on finite-dimensional manifolds, with morphisms, pullbacks, local solutions, transport and observations. Applications supply a phase family and tangent splitting, together with the forms or comparison maps required by the theorem they use. The hypotheses of this general theory impose no rank-two condition, polar-degree condition, scalar Painlevé equation or Riemann–Hilbert comparison.

### Dependencies

Use the smooth Ehresmann, Mathlib ODE, covering-space and holomorphic calculus contracts. The maximal-lift and flatness requirements are stated separately in each target.

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

The real `C¹` branch is used for individual horizontal path lifting. Curvature, differential-form identities and the smooth flat-product theorem use smooth real data. The complex branch uses holomorphic data on finite-dimensional complex manifolds. The base spaces in this layer are smooth finite-dimensional manifolds.

Targets 0.1–0.3 construct nonlinear connections and their local solution theory. Path completeness is a hypothesis of §0.5, with §0.4 providing one sufficient criterion. Target 0.6 takes a relative two-form as input and characterizes its preservation and the closedness of the associated total form. Applications construct that form before applying the criterion.

### 0.1 Ehresmann connections, morphisms and base change

For a smooth surjective submersion π: M → B use the Ehresmann distribution of SmoothBundlesConnections B1.5. Its complement to ker(dπ) defines a splitting h by the inverse of dπ on that complement, and im(h) recovers the distribution. Use B1.5's pullbacks, restrictions and maximal smooth lifts under its hypotheses. Extend this interface to smooth submersions without surjectivity, C¹ splittings with piecewise-C¹ paths, and holomorphic splittings of holomorphic submersions. Use finite-dimensional Hausdorff second-countable manifolds without boundary. The curvature and real differential-form assertions use smooth splittings. (KMS93 §9.3, p. 78, and Theorem 9.8, p. 81.)

Define an arrow `(F,f):(M → B,h) → (N → C,k)` by actual smooth maps, or holomorphic maps in the holomorphic category, satisfying `ρF=fπ` and `dF ∘ h=k ∘ df`. Composition and identities are the actual compositions and identities of these maps. An isomorphism consists of an arrow, its inverse and the two inverse identities.

For a smooth or holomorphic map `u:B′ → B`, construct the fiber product `M′=B′ ×_B M`, its projection `π′:M′ → B′` and the pullback splitting `h′_((b′,m))(v)=(v,h_m(du(v)))`. Prove its tangent-space membership, splitting identity, functoriality on arrows and the canonical coherence isomorphisms for repeated base change. Construct the horizontal and vertical subbundles and, on the smooth or holomorphic branch, the vertical curvature `K_h(X,Y)=[hX,hY]-h[X,Y]`. Flatness means `K_h=0`. Horizontal solutions and completeness are developed in §0.2–0.5; a relative symplectic form is separate data in §0.6.

Use the regularity hypotheses above for each construction. Base changes and arrows have the regularity of their chosen category.

Construct the category of actual connection-preserving arrows, its isomorphisms, and the horizontal–vertical splitting of the tangent bundle. Construct pullback connections along arbitrary smooth or holomorphic base maps and prove identity, composition and Cartesian comparison laws with their actual comparison maps. Prove tensoriality of `K_h` and its naturality under connection isomorphisms and pullback; define flatness independently of completeness and symplecticity.

**Checks.**

- The zero map `π^*TB → TM` fails the splitting identity when `TB ≠ 0`; the product splitting on `B × X → B` passes it.
- Under the noncritical time change `τ=2t`, the vector field normalized to project to `∂_τ` is one half of the vector field normalized to project to `∂_t`.
- A fiber product connection can be defined along a ramified time map; this alone asserts neither completeness nor invertibility of its first-jet observation map.

*Needs:* [Smooth bundle and connection foundations](#supplier-smooth) (B1.5; B5.0; B5.2); [Complex manifolds, holomorphic bundles and observations](#supplier-complex) (K1; K3.0; K3.HolomorphicStalk; K3.MeromorphicGermField; K4; K7.1).

The construction applies to every submersion and splitting satisfying the stated manifold and regularity hypotheses.

### 0.2 Local horizontal lifting and continuous-time compact extension

Use Mathlib's time-dependent existence and uniqueness theorems on a sufficiently small closed time–phase box. In submersion coordinates π(z,y)=z, a C¹ base path γ turns the C¹ splitting into y′=A(γ(t),y)γ′(t). Verify continuity in time and a locally uniform phase Lipschitz bound. Glue the local solutions to the unique maximal lift, and concatenate finitely many C¹ pieces. The coordinate compact-extension criterion is Teschl12, Corollary 2.15, pp. 52–53. Compare the smooth autonomous specialization with Tau Ceti's `eventually_flowOf_notMem`, with its actual maximal-flow and compact-set hypotheses.

Prove the compact-extension lemma: a horizontal lift defined up to a finite endpoint of a base path extends through that endpoint if its image is contained in a compact subset of `M`. Use finitely many submersion charts near the compact set, uniform local existence intervals, accumulation and uniqueness to obtain the endpoint value and extension. Use local uniqueness to prove convergence to the cluster point and uniqueness of the extension. The resulting lemma is available for ordinary nonautonomous ODEs in the same coordinate form.

The velocity of a `C¹` path is merely continuous. The autonomized field `(1,F(t,y))` therefore need not be `C¹`. Use the stated continuous-time theorem, or a proved reduction to it. Continuous dependence on initial data is established under these hypotheses; stronger smooth or holomorphic dependence is claimed only with its additional regularity, and holomorphic horizontal sections are constructed in §0.3. The maximal lift is constructed from the local solutions.

For the compact-extension criterion, assume that the base path is defined at the finite endpoint and that a single compact subset contains the partial lift.

Construct unique maximal horizontal lifts, with restriction, reversal where defined, and concatenation across finitely many C¹ pieces. Prove that containment of a partial lift in one compact subset forces extension through a finite endpoint, using the actual nonautonomous regularity.

**Checks.**

- For the product splitting, the fiber coordinate is constant along every horizontal lift.
- The equation `y′=y²`, `y(0)=1` has `y(t)=1/(1-t)`: its local solution does not extend in the affine phase line through `t=1`; compact containment fails.
- The path `γ(s)=|s-1/2|^(3/2)` is `C¹`, but `γ′` is not `C¹` at `1/2`. Its horizontal-lift equation remains an admissible continuous-time ODE; a `C¹` autonomization cannot be assumed.

*Needs:* Internal: 0.1; [Smooth differential calculus and flows](#supplier-differential) (Layers 0–1; 3.1–3.5); [Mathlib time-dependent ODE](#supplier-ode).

### 0.3 Holomorphic horizontal germs and parameter dependence

For a holomorphic submersion with a flat holomorphic splitting, construct the unique germ of holomorphic section `s` through each `x₀ ∈ M_(b₀)` satisfying `πs=id`, `s(b₀)=x₀` and `ds=h`. Prove the local existence theorem with joint holomorphic dependence on the initial point and on auxiliary parameters when the submersion and splitting vary holomorphically in compatible finite-dimensional complex-manifold parameter charts. The parameter bases in this theorem are finite-dimensional complex manifolds.

Use the holomorphic ODE existence and dependence argument of IY08, Theorem 1.1, pp. 1–2 of the author draft. Construct Picard iteration on a common polydisc and use uniform convergence for joint holomorphic dependence. For a flat splitting the horizontal coordinate fields commute. Compare the local flows, compose them to obtain local product charts and prove the uniqueness and compatibility of the resulting horizontal sections.

Construct horizontal germs from this local ODE theorem. Over a one-dimensional complex base, flatness of the holomorphic horizontal line distribution is automatic; in higher base dimension it is a genuine hypothesis.

For joint parameter dependence let the submersion and splitting vary holomorphically on finite-dimensional complex-manifold parameter charts, with flatness in the time directions. Fix an initial point in the specified fiber and shrink the parameter and time charts around it.

Prove local complex ODE existence, uniqueness and joint holomorphic initial-value and parameter dependence on common polydiscs. Construct commuting horizontal flows and local holomorphic product charts from the proved flatness of the splitting. Construct the natural bijection between initial points and local horizontal section germs, and prove uniqueness and overlap compatibility.

**Checks.**

- For the product splitting, the horizontal section through `(b₀,x₀)` is `b ↦ (b,x₀)`. The constant map `b ↦ (b₀,x₀)` is not a section on a nontrivial base.
- On `ℂ²_(s,t) × ℂ_y`, take `h∂_s=∂_s` and `h∂_t=∂_t+s∂_y`. A horizontal section would satisfy `y_s=0, y_t=s`, contradicting equality of mixed derivatives; flatness cannot be dropped.
- A theorem over a smooth parameter polydisc does not by itself provide a horizontal section over a singular or nonreduced base.

*Needs:* Internal: 0.1, 0.2; [Complex manifolds, holomorphic bundles and observations](#supplier-complex) (K1; K3.0; K3.HolomorphicStalk; K3.MeromorphicGermField; K4; K7.1).

The proof uses the local complex ODE construction and commuting horizontal flows. Isomonodromic horizontal sections are applications of this general theorem.

### 0.4 Completeness transferred by a proper semiconjugacy

Let `(M → B,h)` be a real connection from §0.1. Let `p:R → B` be any continuous map of topological spaces carrying specified complete continuous transport: for every piecewise `C¹` path `γ:[a,b] → B` with finitely many pieces and every `r₀ ∈ R_(γ(a))`, a continuous trajectory `β_(γ,r₀):[a,b] → R` lies over `γ`, starts at `r₀`, and satisfies restriction and concatenation laws. The target need not be a manifold. Let `F:M → R` be continuous over `B` and proper in the explicit sense that inverse images of compact subsets are compact.

Assume compatibility at every source point: every partial horizontal lift `x` of `γ` with initial point `x₀` satisfies `F(x(t))=β_(γ,F(x₀))(t)` throughout its domain. Prove that every such base path has a unique horizontal lift on its entire compact interval through every initial point of `M_(γ(a))`. Flatness is not needed for this completeness theorem.

Indeed, the complete target trajectory has compact image `K=β_(γ,F(x₀))([a,b])`. Every partial lift is trapped in `F⁻¹(K)`; §0.2 extends it through each finite endpoint, and local uniqueness glues the extensions. This proof uses properness of `F`, not properness of the phase projection `M → B`. It does not use an inverse, injectivity or surjectivity of `F`. In particular, a nontrivial compact exceptional fiber is retained in full: construct the lift through its specified initial point using §0.2.

For a holomorphic source splitting, apply the real theorem to its underlying real manifolds. Holomorphic local sections and homotopy invariance require the additional flatness and analytic results stated in their own targets. Compatibility only on a dense open subset, or properness only away from exceptional points, does not meet the hypotheses.

Use the finite-dimensional C¹ splitting and compact-extension criterion of §§0.1–0.2. Require the transport identity for every partial horizontal lift, including those starting in exceptional fibers.

Construct the unique full horizontal lift of each compact piecewise `C¹` base path through every source initial point from the proper semiconjugacy hypotheses. Prove completeness without choosing an inverse to F, and retain distinct initial points in every compact exceptional fiber. Apply the theorem to the underlying real geometry of a holomorphic splitting, without asserting flatness or holomorphic global sections from properness alone.

**Checks.**

- Take `M=ℂ_t × ℂ_y`, `h∂_t=∂_t+y²∂_y`, `R=B=ℂ_t` and `F=π`. The target transport is complete and the semiconjugacy holds, but `F` is not proper. The lift through `y(0)=1` has `y(1/2)=2`, `y(3/4)=4` and no finite value at `t=1`.
- For a product connection and the identity comparison with its own constant-fiber transport, the theorem returns the constant fiber coordinate.
- If a proper comparison contracts an exceptional curve, the proof uses the compact inverse image of the target trajectory and local uniqueness at each point of that curve; replacing the fiber by one arbitrarily selected preimage fails the required initial-value statement.
- The `C¹` path `γ(s)=|s-1/2|^(3/2)` is permitted. Its merely continuous velocity is handled by §0.2; the autonomized field need not have `C¹` regularity.

*Needs:* Internal: 0.1, 0.2.

IIS06, Definitions 2.1–2.2 and Lemma 2.12 provide isomonodromic instances of this geometric continuation argument. Prove here the theorem for a continuous target with the stated properness and semiconjugacy hypotheses; each application supplies its comparison map and verifies those hypotheses.

### 0.5 Fundamental-groupoid transport, universal covers and descent

Use the flat foliation and lifting construction in IIS06 Definitions 2.1–2.2 and 2.11 and its application in Lemma 5.3 (preprint pp. 5–7 and 26). Here establish endpoint transport for the admitted connections and prove descent along the actual covering fiber relation.

Let a smooth real or holomorphic connection be flat and complete for all compact piecewise `C¹` paths. Applications establish this completeness hypothesis by §0.4 or another completeness theorem. From unique horizontal lifting construct endpoint maps `T_γ:M_(γ(a)) → M_(γ(b))`, with identity, reversal and concatenation laws. If `γ₁` is traversed before `γ₂`, use the convention `T_(γ₂*γ₁)=T_(γ₂) ∘ T_(γ₁)`.

Prove invariance under endpoint-fixed homotopy. Use local flat product charts, a finite subdivision of a compact homotopy, and uniqueness on overlaps; include the smooth approximation or subdivision step relating continuous homotopies to the piecewise smooth representatives. This constructs an action of the fundamental groupoid of `B`. Endpoint maps are diffeomorphisms in the smooth case and biholomorphisms in the holomorphic case. Symplectic transport also requires the horizontal-preservation condition of §0.6.

For connected `B`, a chosen `b₀` and a pointed universal cover `p:B̃ → B`, construct for each `x₀ ∈ M_(b₀)` a global horizontal section of the pulled-back family `B̃ ×_B M → B̃`. Prove it is smooth, or holomorphic in the holomorphic case, by the local product theorem. It descends to a section on `B` if and only if `x₀` is fixed by every actual monodromy map `T_ℓ` for based loops `ℓ`. Thus the universal-cover solution and its descent obstruction are separate outputs. Pullback and connection-isomorphism naturality are proved using actual maps, including all exceptional points of a supplied phase space.

For the universal-cover statement, fix a connected base and its pointed universal cover. Finite-dimensional manifolds have the local covering hypotheses.

Construct endpoint transport, prove concatenation, reversal and homotopy invariance, and obtain a fundamental-groupoid action by actual fiber isomorphisms. Construct the unique global horizontal section on the pulled-back family over the pointed universal cover through each initial point. Prove that the horizontal section descends to the original base exactly when its initial point is fixed by the full monodromy action.

**Checks.**

- A loop followed by its reverse acts as the identity on every initial point, including a point on an exceptional fiber of any separately supplied comparison.
- On `ℂ_tˣ × ℂ²_(q,p)`, the connection `q′=q/(2t), p′=-p/(2t)` is complete and flat. One positive loop sends `(q,p)` to `(-q,-p)`; two loops act identically. Exactly `(0,0)` is fixed by every loop, although every initial point has a horizontal section on the universal cover.
- On `ℂ²_(s,t) × ℂ²_(q,p)`, set `h∂_s=∂_s+∂_q` and `h∂_t=∂_t+q∂_p`. This connection is complete but has curvature `∂_p`. A rectangular loop with side increments `a,b` translates `p` by `ab`, so completeness without flatness does not give homotopy invariance.

In a submersion chart express the horizontal splitting as the graph field f:E×F→(E→L[ℝ]F). Prove that zero curvature gives the native IsFrobeniusIntegrableAt condition. Apply TauCeti.exists_frobenius_flat_coordinate at smooth regularity and transport its actual OpenPartialHomeomorph and inverse back to the manifold. Prove compatibility of these product charts by horizontal uniqueness, then carry out the finite homotopy subdivision and gluing. For the holomorphic category use the local holomorphic solution-family construction of 0.3. The smooth real theorem is a named input; its nonlinear global adapter and all coherence maps are proved here.

*Needs:* Internal: 0.1, 0.2, 0.3; [Covering spaces and universal covers](#supplier-covers) (Stage 0.2–0.4; Stage 1.5; Stage 2.6–2.8); [Smooth bundle and connection foundations](#supplier-smooth) (B1.5; B5.0; B5.2); [Native real Frobenius product coordinates](#supplier-frobenius) (TauCeti.exists_frobenius_flat_coordinate).

Flat-connection and covering theory give the transport and descent theorem. IIS06 gives geometric monodromy applications; the symplectic isomonodromy setting of BOA01 also uses the preservation hypotheses of §0.6.

### 0.6 Symplectic preservation and the closed total two-form

Let `V=ker dπ` for a smooth real or holomorphic submersion, let `h` be a smooth or holomorphic splitting, and let `ω` be a smooth or holomorphic relative two-form on `V` that is nondegenerate and closed on every fiber. Applications verify these fiberwise properties of `ω`. Define `v^V=v-h(dπv)` and the actual total two-form `Ω(v,w)=ω(v^V,w^V)`. Prove that `ker Ω=im  h`.

For a base vector field `X` and vertical fields `U,V`, define

    (Dʰ_X ω)(U,V) = hX(ω(U,V)) − ω([hX,U],V) − ω(U,[hX,V]).

Compute all components of `dΩ`: on three vertical vectors it is `d_Vω`; on `(hX,U,V)` it is `D^h_Xω(U,V)`; on `(hX,hY,U)` it is `-ω(K_h(X,Y),U)`; on three horizontal vectors it is zero. Deduce, using vertical nondegeneracy, the equivalence

    dΩ = 0 if and only if K_h = 0 and Dʰω = 0.

Prove separately that the locally defined parallel transport preserves the relative forms if and only if `D^hω=0`. Thus flatness and preservation are distinct conditions. Under horizontal preservation D^hω=0, flatness and completeness, §0.5 then yields symplectic global transport; completeness is not needed for the local criterion.

Under the proved horizontal-preservation condition `D^hω=0`, only for a one-dimensional time base, and after a local symplectic trivialization with the required local phase exactness, derive a Hamiltonian potential for `h∂_t=∂_t+X_H` from `ι_(X_H)ω=d_phaseH`. In Darboux coordinates the intrinsic total form has the coordinate display `Ω=Σ_i dq_i ∧ dp_i+dH ∧ dt`. Prove the time-only ambiguity in `H` on connected phase charts and the transformation law under time-dependent symplectic coordinates by comparing the actual total forms. This coordinate formula has a one-dimensional time base; several time variables require the horizontal–horizontal components as well.

For the Hamiltonian formula use horizontal preservation, a one-dimensional time chart, a local symplectic trivialization and local exactness of the resulting closed phase one-form.

Construct the total form from the vertical projection and prove its kernel identity and naturality. Prove the component formulas and the equivalence `dΩ=0 ⇔ (K_h=0 and D^hω=0)` under the stated fiberwise hypotheses. Prove the equivalence between infinitesimal horizontal preservation and symplecticity of all local parallel-transport maps. Derive the one-time Hamiltonian display, time-only ambiguity and time-dependent coordinate transformation law from the intrinsic total form.

**Checks.**

- On `ℂ_t × ℂ²_(q,p)` take the product flat splitting and `ω=e^t dq ∧ dp`. The associated `Ω` satisfies `dΩ=e^t dt ∧ dq ∧ dp ≠ 0`; flatness alone does not imply symplectic preservation or total closedness.
- For `H=p²/2`, contraction of `∂_t+p∂_q` with `dq ∧ dp+p dp ∧ dt` is zero, checking the sign in the Hamiltonian display.
- The potentials `H` and `H+t²` give the same total two-form because `d(t²) ∧ dt=0`.
- On a positive-dimensional fiber the relative zero form is closed but vertically degenerate; its total extension has full tangent kernel, so the kernel and curvature conclusions require nondegeneracy. On a zero-dimensional vertical tangent space the zero form is nondegenerate.

*Needs:* Internal: 0.1, 0.2; [Complex manifolds, holomorphic bundles and observations](#supplier-complex) (K1; K3.0; K3.HolomorphicStalk; K3.MeromorphicGermField; K4; K7.1).

Prove the component identities and preservation criterion by tensor and differential-form calculus. I23 Definition 11.4 and Corollary 11.8 and BOA01 §7 supply specialized geometric constructions and comparisons satisfying their own hypotheses.

### 0.7 Admissible observations and meromorphic evaluation on curves

Let `S` be a connected one-dimensional complex manifold and let `s:S → M` be a holomorphic map. Define admissible observation data by an actual holomorphic `ℙ¹`-valued map on a neighborhood of `s(S)`, or by meromorphic or rational presentation data for which evaluation along `s` is proved to have a well-defined holomorphic `ℙ¹`-valued continuation. This is a marked observation; its domain and any comparison maps are retained.

Construct that continuation in the following elementary admissible case: local numerator–denominator presentations restrict along `s` to holomorphic pairs that are not both identically zero. Remove their common vanishing order at each point of the curve, and prove the resulting local `ℙ¹`-maps agree on overlaps. Alternatively, if a resolution `M̂ → M`, a holomorphic observation `Q̂:M̂ → ℙ¹` and a holomorphic lift `ŝ` are supplied, evaluation is `Q̂ŝ`. Its independence of choices must be proved by comparison on a dense domain, or the lift must remain part of the observation marking. In particular, a curve wholly contained in an indeterminacy locus has no canonical rational evaluation merely because some lift exists.

If the evaluated map is not identically `∞`, prove that it defines a meromorphic function on `S`. At a point with value `∞`, its reciprocal is a holomorphic germ with a zero of finite order; the identity theorem excludes infinite order. Thus poles are isolated and of finite order. The curve hypothesis is essential to this formulation: higher-dimensional bases have polar divisors and possible indeterminacy, not a theorem of isolated poles.

Apply this local statement to horizontal germs from §0.3 and, when separately supplied, to the universal-cover sections from §0.5. For a universal cover or connected regular cover, prove that the scalar observation descends exactly when the evaluated function is invariant under every deck transformation. A monodromy-fixed geometric initial point is sufficient, but not necessary, for scalar descent. Prove naturality under actual compatible observation maps, base changes and resolved comparisons on their stated domains.

In a local ratio presentation require that the restricted numerator and denominator are not both identically zero. For a resolution require an actual holomorphic lift and observation. For descent use the specified universal or connected regular cover and its actual deck action.

Construct admissible evaluation by actual maps, one-variable cancellation of local ratios, or specified resolved lifts, and prove the claimed comparison independence. Prove finite-order isolated poles for a non-identically-infinite admissible evaluation on a complex curve. For a universal cover or connected regular cover, prove that an observed function descends if and only if it is deck invariant; distinguish this from descent of the full geometric section.

**Checks.**

- The constant `ℙ¹`-valued map `Q ≡ ∞` is allowed as a map but is excluded from the ordinary-meromorphic-function conclusion.
- For the rational observation `Q=[x:y]` on `ℂ²` and the constant curve `s ≡ (0,0)`, both restricted coordinates vanish identically. Different directional lifts to the blowup have different values; no unmarked scalar value is defined.
- The observation `1/t` on a punctured disc extends as a `ℙ¹`-map with reciprocal `t` at the origin, giving one pole of order one.
- For the sign-monodromy example `q′=q/(2t), p′=-p/(2t)` over `ℂˣ`, the observation `q²` descends to the base even when the geometric section with nonzero initial data does not. Scalar descent cannot be characterized only by a fixed initial point.

- The connected degree-three cover p(z)=z³−3z from ℂ minus {−2,−1,1,2} to ℂ minus {−2,2} is not regular and has trivial deck group (its monodromy is S₃). The function f(z)=z is deck invariant but is not constant on the fiber over 0, so it does not descend. Deck invariance on an arbitrary nonregular cover is insufficient.

Use the native Riemann-surface meromorphic-function carrier for the P¹-valued evaluation together with its explicit witness excluding the constant-infinity map. Construct the comparison of the admissible phase observation with that carrier, its pullbacks and order function. For the descent assertions use the covering-space equivalence relation and, on a universal or connected regular cover, its deck action from the covers contract; the evaluation theorem applies to every holomorphic curve map with the stated observation data.

*Needs:* Internal: 0.1; [Complex manifolds, holomorphic bundles and observations](#supplier-complex) (K1; K3.0; K3.HolomorphicStalk; K3.MeromorphicGermField; K4; K7.1); [Covering spaces and universal covers](#supplier-covers) (Stage 0.2–0.4; Stage 1.5; Stage 2.6–2.8); [Native meromorphic functions on Riemann surfaces](#supplier-curve-functions) (TauCeti.RiemannSurface.MeromorphicFunction; Nonconstant curve pullback and order comparison).

Complex-curve evaluation and covering descent give the general theorem. IIS06's geometric solutions and VDPS09's scalar coordinates provide applications, each with the admissibility conditions for its chosen observation.

### 0.8 First jets and second-order equations

Let `B` be a complex time curve, let `ρ:E → B` be a holomorphic submersion of relative dimension one, and let `(M → B,h)` be a holomorphic nonlinear connection. Construct the first-jet bundle `J¹(E/B)` intrinsically: its fiber over `e ∈ E_b` is the affine space of complex-linear splittings `j:T_bB → T_eE` of `dρ_e`. Construct its holomorphic transition maps and prove that these splittings correspond to first jets of local holomorphic sections of `E → B`.

An observation `Q:M → E` over `B` defines

    J_Q(x) = (Q(x), dQ_x ∘ h_x) ∈ J¹(E/B).

On an explicitly specified open `U ⊂ M`, assume and verify that `J_Q:U → V` is a biholomorphism onto an open `V ⊂ J¹(E/B)`. Transport the splitting to `V` and prove its contact compatibility: along its horizontal curves, the jet coordinate is the derivative of the observed section. This constructs the corresponding second-order dynamics. Prove a bijection between horizontal section germs in `U` and observation-section germs whose first jets lie in `V` and solve that dynamics. Construct the inverse correspondence by applying the actual inverse of `J_Q` to the first jet of the observed section.

For the coordinate lemma choose `(t,q,p)` on `U` adapted to the observation, so that q is its local fiber coordinate, and write `h∂_t=∂_t+A(t,q,p)∂_q+B(t,q,p)∂_p`, and suppose the jet map `(t,q,p) ↦ (t,q,A(t,q,p))` has the specified inverse `p=P(t,q,v)`. Then the intrinsic second-order dynamics has the display

    q″ = (A_t + A A_q + B A_p)(t,q,P(t,q,q′)).

Prove naturality under actual connection and observation-bundle isomorphisms, and under noncritical time changes. Arbitrary ramified base change still defines the pullback connection of §0.1, but need not preserve this jet-isomorphism hypothesis. The theorem assumes no symplectic structure, no completeness, no meromorphic continuation property and no named scalar equation.

For the scalar coordinate formula use a one-dimensional observer bundle over a complex curve and the specified chart inverse P. A time change preserves this chart comparison on the locus where its derivative is nonzero.

Construct the affine first-jet bundle, its holomorphic transition maps, its identification with section jets and the intrinsic observation jet map. Transport the connection across a proved jet isomorphism, establish the contact condition and prove the local solution-germ correspondence with its actual inverse. Derive the scalar second-order display by the chain rule and prove its naturality on the stated noncritical coordinate domains.

**Checks.**

- When `A=p`, the jet inverse is `p=q′` and the second-order equation is `q″=B(t,q,q′)`.
- If `A` is independent of `p`, the jet map loses the momentum variable and has no open-set inverse in a two-dimensional phase chart.
- For `A=p²`, the jet map has separate local inverse branches away from `p=0` but no automatic global inverse; at `p=0` its differential loses rank.
- Clearing denominators in a scalar display does not create a solution in a phase chart where the observation or jet inverse is undefined; the original domain is retained.
- Under `τ=t²` at `t=0`, the time derivative vanishes. Pullback connections still exist, but the noncritical time-change comparison of scalar jets does not apply.

*Needs:* Internal: 0.1; [Complex manifolds, holomorphic bundles and observations](#supplier-complex) (K1; K3.0; K3.HolomorphicStalk; K3.MeromorphicGermField; K4; K7.1); [Smooth differential calculus and flows](#supplier-differential) (Layers 0–1; 3.1–3.5).

The affine first-jet construction and the chain rule define the dynamics and prove the correspondence. VDPS09 §4.1 and its displayed classical systems are applications of the coordinate lemma.

### Examples

The product connection lifts paths with a constant fiber coordinate. The equation y′=y² illustrates finite-time escape in an affine chart, and the flat half-power example in §0.5 illustrates monodromy on a punctured time plane.

## Layer 1: Moduli of decorated meromorphic connections

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

### Generality

A consumer identifies its local models and verifies the open generic conditions; specifies its actual time family and markings; chooses unfixed determinant or verifies the fixed determinant and its rank-one time transport; chooses a valid stability chamber; and provides nonemptiness evidence wherever it claims a surjective family. It then invokes §2.4. The application targets construct completeness comparisons, scalar observations and special solution families, and prove their classification and Riemann–Hilbert theorems.

### 1.1 Admitted decorated connection data

Define a groupoid fibered over complex bases whose objects are smooth proper connected curve families, a nonempty ordered set of disjoint marked sections, a structural polar divisor P = Σ mᵢaᵢ, an integer rank r ≥ 1 and degree d, and the local data below. Construct both the unfixed-determinant problem, with all local trace polar data prescribed, and its fiber over a specified compatible line connection (L,∇L); in the latter an isomorphism det(E,∇) ≅ (L,∇L) is part of the object. A connection consists of a locally free sheaf on the entire curve, a relative meromorphic connection and the chosen decorations; matrix charts present this global object. Morphisms are actual compatible bundle isomorphisms.

The admitted domain consists precisely of the local models in I23 §§2–5: logarithmic poles m=1 with full flags and specified graded residues, including resonant and repeated residues; generic unramified poles m≥2 with full filtrations on ma and pairwise distinct leading eigenvalues; and totally ramified generic poles of rank r≥2, m≥2, with wʳ=z and ν(w)=Σₖ₌₀ʳ⁻¹νₖ(z)wᵏ, where ν₀=Σⱼ₌₀ᵐ⁻¹a₀ⱼzʲdz/zᵐ, νₖ=Σⱼ₌₀ᵐ⁻²aₖⱼzʲdz/zᵐ for k≥1, and a₁₀ is invertible. For the last model construct the finite-level factorized ramified structures, their relations and equivalence with the formal model. Roots and formal coordinates are presentations with descent arrows. Mixed blocks, arbitrary slopes, leading-eigenvalue collisions and vanishing a₁₀ lie outside this admitted domain.

Choose rational stability weights in a chamber with stable = semistable whenever that chamber is used; stability tests ∇-invariant proper subbundles. Establish Cartesian pullback with coherent isomorphisms. These local conditions define the domain in every genus and admitted rank and polar degree.

Use smooth proper connected complex curve families with rank r≥1, degree d∈ℤ, disjoint marked sections, the three admitted local models and a fixed weight chamber. For fixed determinant include its line connection and the determinant identification, with matching trace polar data and degree/residue equation.

Construct restrictions, pullbacks, composition and inverse of arrows, with the associator and identity laws. Identify the underlying formal differential module, the induced connection on End⁰(E) of rank r² − 1, and the associated PGLᵣ connection. These latter two are the invariant adjoint/projective outputs. The local matrix A − tr(A)I/r represents the projective connection in a frame; it is not a canonically glued rank-r differential module on E. No square root of the determinant line is chosen. Compare equivalent local presentations by ramified descent, keeping parabolic flags and logarithmic lattices. Express determinant compatibility by an isomorphism of line connections; derive the residue/degree equation in a chosen local convention.

**Checks.**

- On E = O ⊕ O(−1), the determinant has odd degree; a putative global half-determinant twist does not exist. This bundle is admitted when its determinant agrees with the prescribed one.
- Two logarithmic residues with the same repeated eigenvalue, one scalar and one nonzero Jordan block, are not identified by specifying the eigenvalues. Their allowed parabolic objects and monodromy differ.
- Changing the root w to −w in a rank-two ramified chart changes the displayed branches; the retained descent arrow identifies the resulting descended objects.
- With I23's ramified convention, a rank-two ramified point contributes 2c + 1/2 to the residue/degree relation. Replacing it by 2c changes that relation by 1/2.
- Rank zero is rejected before slope stability or the dimension formula is applied. At r = 1 the adjoint bundle End⁰(E) has rank zero, without changing the required positive rank of E.
- For A = 0 and frame change g = diag(z,1), g⁻¹dg = diag(1,0)dz/z; subtracting half its trace gives diag(1/2,−1/2)dz/z. The scalar discrepancy prevents gluing a rank-two trace-subtracted connection on E, while the induced End⁰(E) and PGL₂ connections glue.

Use CrystallineCohomology §CR.1.3's ordinary connection and tensor/dual/base-change operations, with FormalConnectionsOpers §F2.1's form-carrier and tensor-symmetry comparisons. On the finite locally free sheaf E define a relative meromorphic connection E→E⊗Ω¹(P) by the first-order Leibniz rule, using ComplexComparisonPartII C5.1's operator/principal-parts interface. Prove that localization away from P gives the shared ordinary connection and that the polar bound is a condition on this same sheaf map. Construct the decorated gauge groupoid. For each tensor/dual/Hom operation used, construct its induced polar bound and local structures and verify any claimed admission; construct determinant and End⁰ comparisons on the actual sheaves and cocycles. For completion at each marked relative Cartier divisor, use the continuous/formal carriers and gauge groupoid of FormalConnectionsOpers §F1.1–§F1.3, §F2.1 and §F3.3–§F3.4. Prove the comparison of the completed bundle connection with that carrier, compatibility with formal coordinate changes, and ramified pullback and deck descent for the admitted local structures. The completed GL_r torsor extends across the formal disc. Prove the stackification comparison on coefficient covers satisfying F3.4's criterion and verify that criterion for each use. For e′=e·g, compare A′=g⁻¹Ag+g⁻¹dg with F3.3's left gauge h·A=hAh⁻¹−(dh)h⁻¹ by h=g⁻¹, including determinant, residue and ramified-coordinate comparisons. The algebraic/analytic comparison is the application in 1.2. No global trace-subtracted rank-r object or determinant root is introduced.

- On the shared continuous/formal connection carrier of FormalConnectionsOpers §F2.1, for a finite-rank differential module over ℂ((z)), prove the characteristic-zero Levelt–Turrittin decomposition after a finite extension z=wᵉ into exponential factors tensored with regular-singular modules, with constants, refinement of e, formal coordinate change and deck descent. Use FormalLaurentPuiseux for scalar arithmetic only. Prove this decomposition and its descent on that shared carrier. Separately prove, over the stated nonvanishing/distinct-leading-coefficient base loci, the finite-level factorized models and their coherent base-change comparisons required by I23. The relative theorem is restricted to those noncollision loci. 3.4 applies this common result to rank two and structural degree four; 4.1 constructs the convergent sectorial realization and proves Stokes classification.

*Needs:* [Ordinary algebraic connections](#supplier-ordinary-connections) (CrystallineCohomology §CR.1.3); [Continuous formal connections and gauge groupoids](#supplier-formal-connections) (FormalConnectionsOpers §F1.1–§F1.3, §F2.1 and §F3.3–§F3.4); [Differential operators, principal parts and analytic comparison](#supplier-differential-operators) (C5.1: shared algebraic operators/principal parts only); [Formal scalar and vector-valued Laurent algebra](#supplier-formal-series) (L1–L4; L5–L6 for finite-extension steps in 1.1); [Algebraic vector bundles and finite locally free sheaves](#supplier-bundles) (L0A–L0C; L1A–L1B; L2A–L2B); [Complex manifolds, holomorphic bundles and observations](#supplier-complex) (K1; K3.0; K3.HolomorphicStalk; K3.MeromorphicGermField; K4; K7.1); [Stacks, inertia and restricted coarse-space criteria](#supplier-stacks) (1.18–1.23).

I23, Definitions 2.1, 2.2, 2.4, 2.7–2.8; Definition 3.1, Proposition 3.3, Corollaries 4.3–4.4 and §5. Construct the coordinate-independent formulation of these models and prove its 2-coherent descent.

### 1.2 Admitted time families and determinant transport

Construct the deformation groupoid of the curve, marked poles and admitted irregular polar coefficients, keeping logarithmic residues and formal residue exponents fixed. Start from a smooth atlas of the pointed-curve stack with the finite coordinate jets and open coefficient conditions of I23 §5. Construct coordinate-change arrows and descent on the pointed-curve stack, retaining curve automorphisms. Let B be a smooth complex chart, a marking cover, or the source of an arbitrary holomorphic map from a smooth complex base to this admitted time problem. The map need not be a smooth morphism. Construct the pulled-back family and splitting by the admitted base-change comparisons. The coefficient discriminants and collisions removed from B are fixed by input data. Construct local topological markings of the punctured family and compare them on overlaps. The underlying time family carries the prescribed curve, jet and coefficient data with their descent arrows.

In unfixed-determinant mode no determinant section is selected. In fixed-determinant mode require a certified strong rank-one transport of the specified determinant: a compatible integrable total line connection, with the induced trace polar data and fixed residues. Construct this rank-one transport locally on a marked contractible time chart by extending the fixed rank-one local system and gluing the prescribed logarithmic lattices and polar primitives; verify its restriction to the initial determinant, polar bound, and cocycle laws. The logarithmic genus-zero case must also have an explicit dlog construction. Global fixed-determinant output requires actual gluing data for these local transports, or a supplied line connection with the same verified properties. The determinant family is required to carry this integrable total connection and its gluing data. This rank-one construction supplies the determinant input to the rank-r horizontal-splitting theorem of §2.1.

Separate external exponent parameters from these time directions. Strong isomonodromy preserves the transported analytic data while the irregular coefficients vary in the admitted time directions. Construct the algebraic time problem from the curve, jet and coefficient data; §4.1 supplies the analytic Stokes classification.

Use the decorated local data of 1.1 with fixed residue exponents; curve, polar-coefficient and marking variations obtained from the stated admitted time groupoid. For fixed determinant, the rank-one transport certificate constructed here or supplied with its verified pole, integrability, initial-value and gluing conditions.

Separate tangent directions along the admitted time base B from variation in the external residue/exponent parameter θ, and compare the pullback tangent sequence. Construct marking changes and local time reparametrizations with their coherence laws. Identify the collision and vanishing-leading-term discriminant from the input, independently of initial conditions. Construct and certify local rank-one determinant transports, including the genus-zero logarithmic dlog model, and state the exact gluing datum required for global fixed-determinant output.

**Checks.**

- Five ordered logarithmic points on ℙ¹ have two time moduli after quotient by PGL₂: 5 − 3 = 2; their configuration is independent of initial conditions.
- A change τ = 2t multiplies the displayed horizontal generator by 1/2; retaining its coefficient unchanged gives a different parametrized system.
- Two solutions with different movable pole sets use the same Bθ. A base that deletes one solution's poles fails this requirement.
- On a fixed positive-genus curve, changing a line connection by tη with nonzero holomorphic η generally changes a period and hence its rank-one monodromy. Fixed residues alone cannot certify a strong determinant transport.

Use ComplexComparisonPartII C−1.1–C−1.2's single category of complex analytic spaces, scheme and locally separated finite-type algebraic-space analytification, with its ring sheaf, nilpotents, open/closed, fibre-product, étale, smooth and proper-morphism comparisons; use C0.3–C0.5 and C0.7 for coherent sheaves, finite locally free sheaves and analytic étale descent. For each actual curve, time chart and moduli presentation, prove that these supplied constructions identify the presentation maps and their pullback cocycles. On separated smooth finite-type scheme charts of constant differential dimension use FormalConnectionsOpers F2.4's fixed-model manifold realization and identity-on-complex-points sheaf comparison. For smooth algebraic spaces apply C−1.2 and C0.7 to their étale presentations and prove that the chart manifold comparisons descend to the same moduli object. For arbitrary smooth analytic bases identify a Hausdorff second-countable smooth analytic space of fixed complex dimension n with the native ComplexKahlerGeometry manifold modeled on ℂⁿ through its analytic local charts and sheaf; compare with the supplied algebraic-chart realization whenever both apply. Work on each open-and-closed dimension locus when dimensions vary, and verify the dimension and topological hypotheses for every manifold used. General analytic spaces, including singular Betti targets and infinitesimal bases, retain the supplied carrier and nilpotents. Use the supplied proper-morphism comparison and analytic base change on the actual families. Algebraic construction remains over finite-type Noetherian complex bases; construct pullbacks along arbitrary holomorphic maps from smooth complex bases and prove their cocycle laws. The analytic category, space analytification and étale descent are supplied by the stated ComplexComparisonPartII targets; the construction here identifies their maps and cocycles for the admitted families.

- Consume the stable pointed-curve atlases at their stability hypotheses. Construct the genus-zero one- and two-marked quotient groupoids with their actual PGL₂ stabilizers, the required finite-jet torsors and coefficient-open loci, and compatible smooth atlases of these quotient groupoids. Construct local punctured-family topological markings by relative smooth trivialization preserving marked sections and compare them on overlaps. Construct rank-one determinant transport directly from the flat rank-one local system, prescribed logarithmic lattices, polar primitives and dlog formulas; this rank-one construction supplies the determinant transport used by 2.1.

- Apply ComplexComparisonPartII C1.9's proper coherent GAGA and proper direct-image comparison to each admitted algebraic curve family and each proper scheme or algebraic space for which a comparison is used. Verify properness, finite-type and coherence hypotheses and identify the canonical exchange maps with the curve, bundle and determinant maps used here, retaining the exact hypotheses of each claimed base-change theorem. Use C5.1's principal-parts analytification and C5.2's ordinary holomorphic-connection dictionary to compare 1.1's meromorphic Leibniz operators: prove compatibility with the polar divisor, flags, finite-level factorized ramified structures, determinant, restriction and pullback. The generic analytification, proper GAGA and direct-image theorems remain supplied by ComplexComparisonPartII. This analytic comparison consists of analytification of the admitted algebraic families and their pullbacks by the permitted holomorphic base maps. Algebraization of a general analytic family over a nonproper base requires additional hypotheses.

- For a smooth proper curve family with a nonempty relative marked divisor, prove that the divisor has positive degree on every geometric fiber and is relatively ample. Locally on the Noetherian algebraic base choose a sufficiently positive multiple that is relatively very ample, construct the projective embedding used by the Quot presentations, and record comparisons of the chosen powers and bases of sections by passing to a common positive multiple. The comparison of the resulting moduli presentations is proved after their construction in 1.3. Thus the nonempty marked divisor supplies projectivity and a polarization for the bounded construction.

*Needs:* Internal: 1.1; [Marked-curve charts](#supplier-curves) (ComplexCurveModuli D0.3, D3–D5; SchemeAndStackFoundations 4.15); [Complex manifolds, holomorphic bundles and observations](#supplier-complex) (K1; K3.0; K3.HolomorphicStalk; K3.MeromorphicGermField; K4; K7.1); [Complex analytic spaces and analytification](#supplier-analytic-spaces) (C−1.1–C−1.2; C0.3–C0.5; C0.7; C5.2: ordinary connection comparison prefix); [Fixed-model manifold realization of smooth schemes](#supplier-algebraic-manifolds) (FormalConnectionsOpers §F2.4); [Proper coherent GAGA and direct images](#supplier-coherent-gaga) (C1.9); [Differential operators, principal parts and analytic comparison](#supplier-differential-operators) (C5.1: DifferentialOperatorAnalytification); [Cohomology, duality and curve degree](#supplier-cohomology) (2.2; 2.6; 2.20; 3.3); [Proper coherent direct images and base change](#supplier-proper-cohomology) (Layer C).

I23 §5 constructs the curve/jet/coefficient time scheme and §§10–11 use it. Construct the rank-one transport with the stated pole, integrability, initial-value and gluing conditions, and prove coordinate descent for the admitted time groupoid.

### 1.3 Stable moduli on all bundle types

Construct the stack of stable objects of §1.1 over the admitted time problem §1.2, its scalar rigidification and its relative coarse moduli space. Use bounded parameter spaces of filtered bundles and impose the connection and factorized-structure relations. Prove the moduli universal property and finite type, and prove separatedness and quasi-projectivity for the relative coarse (scalar-rigidified phase) family in the source-supported setting. The unfixed-determinant stable stack retains Gm inertia before rigidification. Work with all permitted bundle types. A matrix presentation covers only its actual locus. Construct universal objects on an étale cover, prove scalar invariance of all subsequent tensors and descend them to the coarse space.

In unfixed-determinant mode the stable scalar inertia is Gm. With a specified determinant identification it is μr; determinant fixing and rigidification are different operations. Construct the determinant morphism and the comparison with the moduli problem having specified determinant, reserving the smoothness and relative dimension calculation for §1.5. Establish the needed coarse-space base-change comparison through these local gerbe presentations. The construction allows locally empty moduli. Define the locus of nonempty fibers in B. Its openness and the surjective analytic submersion over it are conclusions of the smoothness theorem in §1.5. An application identifying this locus with all of B supplies a nonemptiness proof.

On each admitted curve/time chart, write 𝔐 for the stack of actual families and 𝔐ʳⁱᵍ for its scalar rigidification. In unfixed-determinant mode define Q(S) to be the set of families over C_S modulo isomorphisms after tensoring by p_S*L for a line bundle L on S, with the canonical relative connection along C_S/S and the transported decorations. In fixed-determinant mode such a twist also carries a trivialization L⊗r ≅ O_S compatible with the determinant identification. Construct the natural maps π₀𝔐→Q→h_M, the rigidification 𝔐→𝔐ʳⁱᵍ, and the comparisons Q^sh ≅ h_(𝔐ʳⁱᵍ) ≅ h_M, where Q^sh is the fppf sheafification on the algebraic test bases. On the admitted analytic bases use the corresponding analytic sheafification. These comparisons retain the distinction between an actual family, its scalar rigidification, and a class modulo base line-bundle twists. For the four-logarithmic-point PVI input, §4.3 compares the unfixed-determinant restriction of Q with I13 Definition 4.3 and constructs the induced coarse-space comparison.

For a trivialized ℙ¹-family and an ordered splitting type a=(a₁≥⋯≥a_r) with Σa_j=d, define Bun_a as the full substack of bundles that are fppf-locally on the base isomorphic to ⊕_j O(a_j), without retaining a chosen isomorphism. Prove its locally closed immersion into Bun_(r,d) and identify its geometric points with splitting type a; retain this relative subfunctor on nonreduced bases. Define 𝔐_a by pullback along the bundle-forgetting map 𝔐→Bun_(r,d), and construct its scalar-rigidified locally closed image M_a↪M. The definition descends under changes of the ℙ¹ presentation. For every framed matrix chart used, specify its map to 𝔐_a, its framing quotient and its actual image in M_a. Prove that the balanced locus, defined by a₁−a_r≤1, is open, and give the complement of each chart in its stated ambient moduli space.

Use the numerical and admitted local data of 1.1 and the time family of 1.2; a fixed stability chamber; all bundle types. No nonemptiness assumption is imposed on the construction.

Construct the actual-family stack, scalar rigidification, line-twist quotient Q and its stated sheafification comparisons, together with the coarse-map universal property. Prove restriction and admissible base-change comparisons, including determinant fibers. Construct 𝔐_a and M_a for each splitting type used, prove their locally closed inclusions and the openness of the balanced locus, and compare each framed chart through its specified quotient and actual image. In degree zero the balanced locus is the trivial-bundle locus. Record each chart complement in its specified ambient moduli space. For a change of weights, identify the common stable locus and construct the comparison on that locus.

**Checks.**

- A stable object may have scalar automorphisms before rigidification. The set-valued coarse quotient forgets these arrows; its existence does not imply triviality of the stabilizers.
- A family can leave a trivial-bundle chart by bundle jumping while remaining in the moduli space. Bundle jumping alone does not make the phase path singular.
- In the extension family 0 → O(−1) → E_t → O(1) → 0, E₀ = O(−1) ⊕ O(1) while E_t = O ⊕ O for t ≠ 0. The two splitting strata pull back to {0} and its complement in A¹; the first is not open. The full connection moduli must retain such bundle jumps on the permitted connection locus.
- Pulling the preceding bundle family back to t=0 makes the balanced stratum empty, although the pullback of its closure in A¹ is the point. Thus closure fails to commute with this base change.
- An admitted totally ramified generic local model is irreducible as a formal differential module, hence a global connection containing it has no proper ∇-invariant subbundle and is stable for every weight (I23 Remark 2.9). The formal irreducibility hypothesis is the admitted totally ramified generic local model of §1.1.

Construct the finite-type parameter schemes and the connection and factorization equations using SchemeAndStackFoundations 4.14. Specify the projective-over-affine presentation, the actual GL framing group and the relatively ample linearization used for the numerical criterion. Where stability is tested modulo central scalars, verify descent of the linearization and use the resulting reductive quotient group. Compare its numerical inequalities with connection stability using the reductive GIT supplier. Construct the moduli universal property, scalar rigidification and the coarse comparison with the resulting GIT quotient. Keep the residual μᵣ inertia when a determinant identification is included.

- For each finite-type algebraic curve/time chart, prove that its analytified bounded framed Quot presentation represents the corresponding analytic families after arbitrary holomorphic base change from the smooth complex bases allowed in 1.2. Establish local analytic generation after a sufficiently positive twist, coherent analytic pushforward/base change, the holomorphic framing and factorized-connection equations, and descent of the actual relation. This constructs the analytic moduli comparison used by 2.3 over each admitted smooth analytic base. The analytic quotient is identified with the analytification of the constructed GIT quotient through these presentation maps. 1.4 constructs the deformation complex and compares its framed infinitesimal and versal charts with the moduli space constructed here by GIT.

- Compare the bounded Quot/GIT presentations arising from the positive powers and projective embeddings constructed in 1.2. First construct both presentations and their actual functor-of-points maps, then use their proved moduli universal properties to construct inverse comparison maps and the composition/base-change laws. This proves independence of the auxiliary polarization and framing choices within the stated curve stability problem.

*Needs:* Internal: 1.1, 1.2; [Quot/Hilbert and parameter schemes](#supplier-quot) (4.14); [Stacks, inertia and restricted coarse-space criteria](#supplier-stacks) (1.18–1.23); [Quotient predicates](#supplier-quotient-predicates) (1.17); [Reductive GIT](#supplier-reductive-git); [Elementary deformation theory](#supplier-deformation) (4.2–4.6).

I23 Theorem 5.1 and §§7–10 supply the admitted moduli construction. Construct the specified-determinant, rigidification and coarse-space base-change comparisons for that moduli problem.

### 1.4 The differential-operator deformation complex and trace pairing

Construct the deformation complex from infinitesimal endomorphisms preserving the local structures, permitted variations of the connection, and all relations of the factorized ramified structures. Begin with the two-term connection complex G•. In the ramified case retain the full cone F• = Cone(G• → S•ram[1])[−1], including degrees 0, 1 and 2, both differentials and the local factorization terms. A two-term replacement requires a proved quasi-isomorphism. Identify infinitesimal automorphisms, tangent vectors and obstruction classes by hypercohomology and construct the trace/Serre-duality pairing.

The commutator with ∇ is a ℂ-linear first-order differential operator and is generally not O-linear. Use sheaves of ℂ-vector spaces with coherent underlying terms, Čech totalization and the termwise duality calculation. Prove presentation and cover independence by chain maps and quasi-isomorphisms. Construct the trace chain map tr:F•→D• to the determinant deformation complex and compare its homotopy fiber with the deformation complex for a specified determinant, including signs and local factorization compatibility. Construct the chain map, homotopy-fiber comparison and dual complex here. §1.5 constructs the scalar section and direct-sum splitting and proves orthogonality, smoothness of the determinant map and the dimension theorems. Scalar gauge automorphisms and genuine infinitesimal determinant variation are separate directions.

Use the stable moduli problem of 1.3 with the admitted filtrations and factorized ramified relations; either unfixed determinant or its specified fiber. The complex and pairing are outputs.

Give the differential, local compatibility equations and the map from an infinitesimal family to its cocycle. Prove gauge-change and coboundary compatibility in both directions. Construct tr:F•→D•, the specified-determinant comparison with its homotopy fiber, and the dual complex with its signs. The scalar splitting is proved in §1.5. Prove naturality of the pairing under input isomorphisms and admissible base change.

**Checks.**

- An infinitesimal gauge change by u changes a connection representative by the commutator differential of u; its tangent class is zero.
- Without determinant identification stable scalar automorphisms have a one-dimensional infinitesimal direction. Fixing the identification removes that direction in characteristic zero, although finite μr remains until rigidification. Removing the scalar infinitesimal automorphism direction is distinct from imposing the trace-free tangent condition; §1.5 identifies the latter with removal of the 2g determinant deformation directions.
- With ω = dq ∧ dp, the ordered tangent pair (∂q, ∂p) has pairing +1 and the reversed pair −1; a reversed trace convention must be corrected before transport formulas are used.

Build the total Čech complex in sheaves of ℂ-vector spaces, with coherent underlying terms and the actual C-linear first-order differentials, then prove refinement, cover independence, cone signs, trace pairing and termwise Serre-duality compatibility. Identify automorphisms, tangents and obstructions by the actual lifting cocycles, for the ramified three-term cone including all factorization relations. Extend SchemeAndStackFoundations §4.5's elementary small-extension framework to finite-dimensional square-zero kernels, and prove linearity, compatibility with direct sums and base-change naturality for the resulting lifting and obstruction maps.

- Use ComplexComparisonPartII C5.1's characteristic-free finite-order operator/principal-parts interface, DifferentialOperatorAnalytification and boundedOperatorHyperGaga. For the bounded decorated deformation complex on each proper complex curve, prove the order bounds, coherence of every term and compatibility of the analytified differential with the actual local constraints. Identify the supplied comparison with the chain maps of the ramified three-term cone, including its factorization relations, trace and duality pairings. C5.1 supplies composition compatibility and the proper operator-complex GAGA theorem. Construct the decorated complex and verify its hypotheses and the identifications of comparison maps. Use sheaves of complex vector spaces with coherent underlying O-module terms and their ℂ-linear differential operators. For relative p:C→B use the supplied relative comparison only after proving p⁻¹O_B-linearity and its proper/coherent/bounded hypotheses; every further cohomology/base-change assertion retains its exact flatness and finiteness hypotheses. The operator input to this construction is C5.1's finite-order principal-parts interface.

- For the relative family p:C→B retain the p⁻¹O_B-module action on the sheaves and the p⁻¹O_B-linearity of the connection differential. It is not O_C-linear. Construct the decorated Čech total complex and trace with that base-module action; identify C5.1's supplied principal-parts and relative GAGA maps on this complex and prove compatibility with each claimed base-change map. Prove the fiberwise comparison with absolute ℂ-linear cohomology while retaining this relative base-module structure.

- Construct framed infinitesimal and versal charts from the actual lifting equations and the deformation complex. Prove their tangent, obstruction and lifting comparisons with the bounded GIT moduli construction of 1.3.

*Needs:* Internal: 1.3; [Cohomology, duality and curve degree](#supplier-cohomology) (2.2; 2.6; 2.20; 3.3); [Elementary deformation theory](#supplier-deformation) (4.2–4.6); [Differential operators, principal parts and analytic comparison](#supplier-differential-operators) (C5.1: shared algebraic operators/principal parts; C5.1: DifferentialOperatorAnalytification; C5.1: boundedOperatorHyperGaga); [Proper coherent GAGA and direct images](#supplier-coherent-gaga) (C1.9).

I23 §6, (6.9), Proposition 6.3 and §7, Proposition 7.2. Construct the comparison of the specified-determinant fiber with the homotopy fiber of the trace map, including its compatible trace-free complex.

### 1.5 Smoothness, dimension and the determinant fiber

Use §1.4 to prove obstruction vanishing and smoothness of the stable moduli family in the admitted domain. Prove that its nonempty-fiber locus in the time base is open and that its analytic restriction to this locus is a surjective submersion. Identify its relative tangent bundle by first hypercohomology. For unfixed determinant and a nonempty stable fiber, derive dim M_b = 2r²(g−1)+2+r(r−1)deg P. The local trace polar parts are fixed in this formula.

For the fixed-determinant export, construct the determinant moduli of line connections with those trace polar parts, locally an affine bundle of rank g over Picᵈ(C_b), and prove that its tangent complex is the regular de Rham complex O_C → Ω¹_C. For the trace chain map tr:F•→D• constructed in §1.4, build over ℂ the scalar chain-map section s using 1/r, including all ramified relations, and prove tr∘s=id. Construct the resulting direct-sum quasi-isomorphism F• ≃ F•det ⊕ D•, where F•det is the specified-determinant homotopy fiber compared in §1.4. Prove the induced determinant map is smooth on the stated stable locus, with surjective tangent map onto a 2g-dimensional determinant tangent space. Identify the specified-determinant coarse family with the relevant fiber after its gerbe comparison. Deduce from this smooth determinant map that dim M_b^det = 2(r²−1)(g−1)+r(r−1)deg P. Prove that the trace pairing splits orthogonally into the trace-free and scalar directions and is nondegenerate on the fixed-determinant tangent space. Rank-one fixed-determinant fibers are zero-dimensional.

Prove the deformation-functor comparison, smoothness of the determinant map and orthogonal trace splitting on the full complex. Their restriction to the specified-determinant fiber gives its dimension and symplectic theorems under the stated hypotheses; in genus zero the fixed- and unfixed-determinant dimensions agree.

Use the moduli construction of §1.3 and the actual complex and trace pairing of §1.4. State dimension on nonempty stable fibers. Apply the fixed-determinant formula after the determinant-map comparison.

Identify the relative tangent sheaf and prove base-change compatibility for tangent and obstruction calculations. For §1.4's trace map and specified-determinant homotopy fiber, construct the scalar section s, prove tr∘s=id and the direct-sum comparison, and verify all local compatibility equations. Use the smooth determinant map and orthogonal trace decomposition to identify and remove the 2g determinant directions. Return separate unfixed- and fixed-determinant dimension theorems with their exact hypotheses.

**Checks.**

- Genus zero, rank two and degree four give −8 + 2 + 8 = 2; structural degree five instead gives 4.
- Fixing the determinant in positive genus removes 2g directions when the determinant-map comparison applies; the genus-zero coincidence cannot be exported unchanged.
- At r = 1 and g = 1 the unfixed-determinant formula gives 2, and fixing the entire line connection gives 0. The rank-zero input that would incorrectly give 2 is outside the domain.
- For g=1, r=2 and deg P=1, the unfixed formula gives 4 and the fixed-determinant formula gives 2 whenever the corresponding stable fiber is nonempty and the comparison holds; removing only the scalar stabilizer would miss this difference.

Apply the supplied fppf relative Picard algebraic space to the projective flat finitely presented complex curve families used here, over locally Noetherian bases, after verifying O_B ≅ p_*O_C universally. Verify locally constant dimension of the identity components using the coherent base-change and dimension calculation on the actual families. Apply the supplier's identity-component criterion using the affine square-zero lifting test below, including for nonreduced curves and bases. For smooth marked curves use the degree-d part of this space and the Poincaré family rigidified along a chosen marked section. Construct the affine torsor of line connections with fixed compatible trace polar parts. Prove its regular de Rham tangent complex and dimension 2g, the full trace/scalar splitting and smoothness of the determinant map. Deduce the fixed-determinant dimension and symplectic theorems from these comparisons. The curve-family lifting calculation also applies to the nonreduced boundaries in §5.1.

- Test formal smoothness locally on affine square-zero thickenings T₀↪T with quasi-coherent ideal I. Flatness identifies the ideal of C_T0 in C_T with p*I. Construct the obstruction in H²(C_T0,p*I), the torsor of isomorphism classes of lifts with a specified restriction isomorphism under H¹(C_T0,p*I), and their infinitesimal automorphisms from H⁰. Prove R^q p_*(p*I)=0 for q>1 by proper relative dimension at most one and use the affine base and Leray to obtain H²=0. Compare this calculation on Artinian tests with the supplied framed lifting interface. On general test bases the lifting criterion is local. Use the affine vanishing with the supplied local finite presentation to deduce smoothness. See PICREL tags 0D2C, 0DNI, 0DPJ and 0DPK.

*Needs:* Internal: 1.3, 1.4; [Cohomology, duality and curve degree](#supplier-cohomology) (2.2; 2.6; 2.20; 3.3); [Elementary deformation theory](#supplier-deformation) (4.2–4.6); [Picard over a field and Picard foundations](#supplier-field-picard) (JacobianChallenge Layer D; SchemeAndStackFoundations 1.1, 2.6, 3.4, 4.6, 4.14); [Relative Picard spaces and identity components](#supplier-relative-picard) (ComplexComparisonPartII §C3.2d.2–§C3.2d.3 and §C3.2f.1–§C3.2f.2); [Framed Artinian line-bundle lifts](#supplier-relative-picard) (AlgebraicModuliForArithmeticGeometry §7.3); [Proper coherent direct images and base change](#supplier-proper-cohomology) (Layer C).

I23 Theorem 7.5 and its determinant-obstruction argument give the unfixed-determinant smoothness theorem. Prove the splitting of the full cone, orthogonality and smoothness of the determinant map to obtain the stated fixed-determinant conclusions.

### 1.6 Finite-flat unfoldings and closed symplectic forms

Construct the relative trace two-form on the moduli family, descend it from the universal-object cover and prove nondegeneracy using §1.4 and §1.5. Prove closedness by the following auxiliary construction. Over a smooth integral auxiliary base H, replace the fixed polar divisor by the finite-flat divisors of I23 §8. At a ramified point use ∏ⱼ₌₁ᵐ⁻¹(z−hʳqⱼ)(z−hʳ), with qⱼ distinct, nonzero and different from 1. Construct the moduli algebraic space of simple connections with the unfolded factorized local structures, an étale universal-object cover, the relative deformation complex and trace form. Prove boundedness and the deformation statements for this family with finite-flat polar support, including its nonreduced fibers.

Prove smoothness over H and identify the original stable moduli, complex and form with the appropriate open part of the central fiber. On the dense open parameter set with generic separated poles, construct both quasi-isomorphisms from the diagonal deformation complex to the unfolded complex and the logarithmic parabolic complex, respecting trace forms. Prove closedness of the logarithmic trace form by the Čech cup-product/trace calculation and gauge descent and transfer it through these two comparisons. The relative sheaf of three-forms on this smooth family over an integral base is locally free, and restriction to the indicated dense open detects zero. Deduce d_relative ω=0 on the whole family, restrict to the central stable locus and descend. For nonreduced base changes, pull back the closedness identity proved over the smooth integral auxiliary base.

The fixed-determinant result is the pullback of this closed form to the determinant fiber, with nondegeneracy supplied only after §1.5's orthogonality comparison. The construction applies throughout the admitted rank, genus and local-model domain.

Use §§1.3–1.5 in the admitted domain. Smoothness, the auxiliary simple-connection family, generic comparison maps and closedness are outputs. For the fixed-determinant symplectic export, the determinant-fiber comparison and nondegeneracy gate in 1.5.

Construct the finite-flat unfolding, the moduli of simple connections and the universal-object cover, and identify their central fibers. Construct both diagonal-complex comparison maps and prove compatibility with the trace pairing. Prove nondegeneracy and closedness independently, including descent and base-change compatibility.

**Checks.**

- A skew pairing which vanishes identically is closed but is not symplectic; nondegeneracy must follow from the actual duality computation.
- For r = 2, local order 2 and q₁ = 2, the unfolding equation is (z − 2h²)(z − h²). Its fiber at h = 0 is z² and at h = 1 is (z − 2)(z − 1); modulo h² it is again z². Compare the central and pulled-back complexes and forms, including those on the nonreduced polar divisors.
- For each admitted rank, genus and local model, construct the finite-flat unfolding, both generic comparison maps and the closedness proof from the moduli and deformation data of §§1.3–1.5.

*Needs:* Internal: 1.3, 1.4, 1.5; [Cohomology, duality and curve degree](#supplier-cohomology) (2.2; 2.6; 2.20; 3.3); [Elementary deformation theory](#supplier-deformation) (4.2–4.6); [Algebraic vector bundles and finite locally free sheaves](#supplier-bundles) (L0A–L0C; L1A–L1B; L2A–L2B).

I23 Theorem 8.1, Propositions 8.2–8.3 and the complex preceding (8.2). Construct the auxiliary finite-flat family, both deformation-complex comparisons and trace-form descent in this target.

### Examples

For genus zero, rank two and polar degree four the fixed-determinant phase fibers have dimension two. At a quadratic ramified pole the trace residue includes the half-integer correction in §1.1. The nonreduced boundary in §5.1 uses the same relative Picard construction as §1.5.

## Layer 2: Isomonodromic connections

### Dependencies

Use Layers 0–1 for the splitting, moduli and deformation complex. Use the admitted strong local models of I23 for the total extension comparison.

### 2.1 Strong integrable extensions and horizontal splittings

For a time tangent at a moduli point, construct a strong integrable extension of the universal connection over the corresponding dual-number deformation. On the moving total curve X let D be the sum of the marked relative Cartier divisors with coefficient one, formed on the smooth ambient family before pullback to the infinitesimal base. The allowed total-form pole filtration is Ω¹_X(log D) ⊗ O_X(P−D), relative to any fixed auxiliary base. Require integrability and preservation of the kernel lattices attached to the local filtrations, namely kernels of E → E|_(mᵢaᵢ)/Fᵢ,k with the relevant structural thickening and the additional factorized relations. Preserving flags separately on each fiber is insufficient. Prove the coordinate lemma that, in a moving polar coordinate z, the allowed forms are generated by dz/zᵐ and dε/zᵐ⁻¹; the time coefficient is regular at a logarithmic point.

Prove existence and uniqueness up to the specified isomorphism restricting to the identity on the central fiber, within this strong extension class. Glue the local lifts and descend from the universal-object cover. Construct the actual O-linear splitting h:π*TB→TM and prove dπ∘h=id. In fixed-determinant mode prove that taking determinant of the constructed extension agrees with the certified rank-one transport of §1.2, so that h is tangent to the moving determinant fiber. Construct h and its strong integrable extensions here, prove determinant compatibility for the certified transport, and prove trace-form preservation in §2.2.

Use the admitted time and moduli constructions of §§1.1–1.5 and a time tangent vector. The total pole filtration and kernel-lattice relations specify the class of extensions being constructed. For fixed determinant, §1.2 supplies the verified rank-one time transport and §1.5 supplies the determinant-fiber comparison.

Construct the lift from a time tangent and prove additivity and O-linearity. Prove restriction, base-change and input-isomorphism naturality of the lift. Compare lifts computed with different local coordinates, formal diagonalizations and universal-object covers. Identify the induced horizontal subbundle and its projection isomorphism to π*TB. Prove determinant functoriality of the strong extension and tangency to a certified moving determinant fiber.

**Checks.**

- A zero time tangent lifts to zero; adding an arbitrary vertical vector would violate uniqueness of the integrable extension.
- Rescaling the time tangent by 2 rescales its lift by 2, while changing the time coordinate to 2t rescales the normalized generator by 1/2.
- The zero map cannot be a splitting over a nonzero time tangent because dπ ∘ 0 = 0 ≠ id.
- At m=1 a proposed time term dε/z lies outside the allowed total-form module in a moving polar coordinate; fiberwise flag preservation cannot repair that violation.

Using 1.1 formal carriers and 1.4 actual deformation cocycles, construct the strong infinitesimal total connection over each admitted dual-number time direction, with pole module Ω¹(log D)⊗O(P−D), kernel lattices and factorized relations. Prove existence and uniqueness of the deformation class with its specified central identification, preserve the determinant transport, and prove overlap/descent comparisons; scalar infinitesimal automorphisms must remain accounted for before rigidification. 2.2 proves mixed-time flatness and trace-form preservation separately, and 2.3 proves coherent arbitrary holomorphic base change. FormalConnectionsOpers §F8.1 defines arrows by isomorphisms of underlying formal connections after forgetting the oper reduction. Here the admitted irregular coefficients may vary with time, and the output is a splitting of the global moduli family over that time base. Construct the global splitting from the infinitesimal deformation cocycles and the overlap comparisons described here.

*Needs:* Internal: 1.1, 1.2, 1.3, 1.4, 1.5, 0.1; [Elementary deformation theory](#supplier-deformation) (4.2–4.6).

I23 Definition 10.1, (10.1), Lemmas 10.3–10.6, Propositions 10.7/10.10 and (11.2); prove determinant compatibility and identify the intrinsic pole filtration with the stated local form modules.

### 2.2 Flatness, trace-form preservation and the closed total form

Compare the two-parameter strong extensions and their mixed infinitesimal term to prove h([v,w])=[h(v),h(w)]. Derive the bracket identity from the algebraic extension comparison of §2.1.

For a holomorphic horizontal section s:V→M of the rigidified phase family, pull back the scalar gerbe and the universal-object cover of §1.3. After shrinking to time charts V_i admitting such a lift, construct a representative decorated family (E_i,∇_i) on C_(V_i) and a strong integrable total connection restricting to its relative connection. Retain the chosen representative and its identification with s|_(V_i); in fixed-determinant mode the total determinant is the transport certified in §1.2. For a change of representative by a base line bundle L, choose on sufficiently small charts a compatible integrable connection on L and compare total connections by the tensor formula ∇_tot′=∇_tot⊗1+1⊗p*∇_L and connection-preserving isomorphisms. In fixed-determinant mode the induced connection on L⊗r must be trivial under its specified trivialization. A global bundle with total connection is an output only with connection-preserving transition isomorphisms satisfying the triple-overlap cocycle. Without that descent datum, the output consists of local objects over the pulled-back gerbe, not a total connection on every representative of the coarse section.

Use the actual trace cocycles and strong-extension comparison to prove that the constructed horizontal variation preserves the relative symplectic form ω. Flatness of an arbitrary splitting alone would not imply that assertion. Define Ω(v,w)=ω(v−h(dπv),w−h(dπw)), prove dΩ=0 and ker Ω=im h, and deduce preservation of ω by local horizontal transport. Apply the differential-form identities of §0.6 to the flatness and trace-form preservation established by these calculations. On a one-dimensional time chart equipped with a symplectic trivialization and the required local exactness, derive Ω=dq∧dp+dH∧dt in relative dimension two, and the analogous sum in higher even dimension. Scalar Hamiltonians are local primitives attached to charts.

Use the actual strong splitting of 2.1 and the relative symplectic form of 1.6, with the determinant gate where applicable. Flatness and preservation of that form are outputs.

Compute the mixed two-parameter extension term and obtain the bracket identity and flat horizontal distribution. For a specified horizontal section construct local representative families with strong total connections; construct their comparisons under compatible base line-connection twists, and prove descent for supplied connection-preserving transition maps and their cocycle. Recover the relative form by vertical restriction and the horizontal distribution as the kernel. Prove admissible base-change naturality for the relative form, the actual splitting and the closed total form. Compare two Hamiltonian potentials in a fixed chart: their difference is constant along connected phase fibers. State the extra generator term for a time-dependent symplectic change of coordinates through equality of the extended two-forms.

**Checks.**

- For H = p²/2, contraction with ∂t + p∂q annihilates dq ∧ dp + p dp ∧ dt; using the opposite sign does not.
- H and H + t² give the same vertical vector field and extended two-form, but different scalar functions.
- On a symplectic fiber, Ω has no nonzero vertical kernel vector; degenerating ω to zero would fail this characterization.
- On ℂ²×ℂ with ω=dq∧dp, h(∂t)=∂t+q∂q is flat because the base has dimension one, but its flow scales ω. This fails the trace-form preservation condition.
- In unfixed-determinant mode, on ℙ¹_z×ℙ¹_B with the only polar section z=∞, E=pr_B*O(1) with relative connection d_z represents a constant rank-one coarse horizontal section. A total connection regular in the B-direction would restrict at z=0 to a holomorphic connection on O(1), which cannot exist. The section therefore supplies local representatives, not a total connection on this global representative.

*Needs:* Internal: 1.3, 1.4, 1.6, 2.1, 0.6; [Complex manifolds, holomorphic bundles and observations](#supplier-complex) (K1; K3.0; K3.HolomorphicStalk; K3.MeromorphicGermField; K4; K7.1).

I23 Theorem 11.6, Definition 11.4 and Corollary 11.8. Prove flatness by the mixed-extension calculation and trace-form preservation by the trace-cocycle variation.

### 2.3 Naturality and coherent change of presentation

For isomorphic admitted decorated time problems construct compatible isomorphisms of their stacks, rigidifications and phase families, preserving the trace pairing, ω, h and Ω. Cover finite-jet coordinate changes, formal frame changes, ramified root changes with descent data, universal-object covers and compatible rank-one determinant transports. Construct the pullback comparison for a holomorphic map f:B′→B between smooth complex bases and prove that the resulting horizontal vector at (b′,m) is (v′,h_m(df(v′))). The corresponding algebraic stack pullback remains meaningful for general test bases, but analytic submersion statements require a smooth complex base.

Record the natural comparison isomorphisms for identity and composite base changes, the associativity pentagon, the identity triangles and compatibility with 2-isomorphic presentation arrows. On the rigidified phase spaces these descend to the required equalities/cocycle laws. Thus the construction is pseudofunctorial before rigidification and functorial up to the specified canonical comparisons afterward. Changes of determinant, weights, labels or formal local type that are not isomorphisms of the input remain genuine parameter changes or correspondences on stated domains. A time-dependent gauge matrix changes a formula but the compatible object and its transported tensors remain identified.

Use isomorphisms of decorated time problems and base maps preserving their specified data. Analytic output is over smooth complex bases. Use §1.3 for coarse-space descent through the scalar gerbe.

Give the stack-level comparison 1-isomorphisms and their coherent 2-isomorphisms; descend the corresponding phase-space comparisons. Prove equality of pullback splitting and forms with the outputs constructed after base change. For each presentation or base-change comparison F:M′→M over f:B′→B constructed here, prove π∘F=f∘π′, dF∘h′=h∘df, F*ω=ω′ and F*Ω=Ω′ on its stated domain. Domains for changes of weights are supplied by §1.3; genuine geometric transformations and their parameter maps are constructed in §5.4.

**Checks.**

- For f:B′→B and g:B″→B′, compare direct (f∘g)* construction with g*f* and verify the canonical comparisons for triple compositions and the associativity pentagon for four composable arrows.
- A weight wall crossing changes the stable locus and is not a presentation isomorphism unless an actual common stable domain has been specified.
- The base map t=s² pulls h(∂t) back to h′(∂s)=(∂s,2s h(∂t)); at s=0 the horizontal vector still projects to ∂s, so the base map need not be a local isomorphism.

*Needs:* Internal: 1.1, 1.2, 1.3, 1.4, 1.6, 2.1, 2.2, 0.1; [Stacks, inertia and restricted coarse-space criteria](#supplier-stacks) (1.18–1.23).

I23 Propositions 10.7 and 10.10 supply uniqueness used by the comparison. Use this uniqueness to construct the intrinsic base-change comparisons and prove their 2-coherence.

### 2.4 Isomonodromic connections on meromorphic-connection moduli

Assemble §§1.1–2.3 into a construction from each admitted decorated time problem to its rigidified stable phase family and, over the open nonempty-fiber part of a smooth analytic time base, a holomorphic flat symplectic nonlinear connection (π:M→B,h,ω) in §§0.1 and 0.6, together with its closed total form Ω. The inputs are curve and local connection data, a stability chamber and the determinant mode; the construction supplies h and the relative and total forms from these data. The result applies in arbitrary genus and admitted rank/polar degree for unfixed determinant; fixed-determinant export requires the separately proved comparison in §1.5 and the certified time transport in §1.2.

Give a single consumer certificate listing local-model admission, the actual time base, determinant verification, weight choice and nonemptiness evidence. Return the geometric carrier, the constructed tensors, dimension theorem at its exact scope, naturality and coherent pullback laws. A consumer proves only these admission conditions and its further specialized results. In particular neither relative dimension two nor one-dimensional time belongs to this construction theorem. For the classical input of §3.3, the proper Riemann–Hilbert comparison and completeness theorem are constructed in §§4.1–4.7 under their stated hypotheses. Chosen observables, scalarization and distinguished solutions have their stated application hypotheses and constructions. The theorem combines the construction and comparison maps of §§1.1–2.3 at precisely these admission hypotheses.

Assemble the geometric input and time problem of §§1.1–1.2, the stable construction of §§1.3–1.6 and the splitting and comparisons of §§2.1–2.3. Use the open nonempty-fiber locus and apply the separate determinant comparison for the fixed-determinant construction.

Construct π, h, ω and Ω from the admitted geometric input and prove their submersion, splitting, flatness, nondegeneracy, preservation and closedness laws. Supply the common application certificate and state separately the hypotheses for construction, nonemptiness and completeness. Prove the base-change and presentation-equivalence laws using the canonical comparisons of 2.3.

**Checks.**

- The construction applies to every admitted genus, rank, polar degree and time dimension, with local prerequisites and outputs specified by the geometric data in §§1.1–2.3.
- Five logarithmic points on ℙ¹ in rank two, fixed determinant and a nonempty stable locus give relative dimension 4 and a two-dimensional configuration base; the construction theorem must accept that input.
- A tuple of arbitrary formal singularities is not admitted merely because its dimension formula happens to be positive; each local model and determinant/time certificate must be verified.
- A holomorphic flat symplectic connection can have incomplete horizontal curves; this export alone cannot justify global continuation of all initial conditions.

*Needs:* Internal: 1.1, 1.2, 1.3, 1.4, 1.5, 1.6, 2.1, 2.2, 2.3, 0.1, 0.6.

I23 supplies the admitted unfixed-determinant construction model. Assemble it with the determinant and coherence comparisons proved in §§1.1–2.3, and establish the stated construction theorem and application criteria.

The common construction uses intrinsic descent for coordinates and roots, rank-one determinant transport and the trace splitting of the ramified deformation complex. The finite-flat unfolding supplies the closedness comparison. The total pole and kernel-lattice conditions determine the strong lift, and the actual pullback comparisons give its coherence.

The construction theorem of §2.4 applies to the admitted local models of I23 with the specified determinant and base-change comparisons.

### Examples

For four logarithmic points the determinant transport gives a rank-one strong total connection. For a quadratic ramified model, the moving-coordinate time coefficient has pole order at most m−1, and the total connection preserves the specified kernel lattices.

## Layer 3: Phase spaces and isomonodromic deformations of Painlevé equations

Construct Painlevé dynamics from moduli of meromorphic connections, and construct Painlevé functions from the horizontal sections of that dynamics. The input consists of a curve, a structural polar divisor, a determinant connection, local formal moduli conditions, and stability and marking data. The phase space, its symplectic form, and its horizontal distribution are constructed from this input. A common continuation theorem precedes every classical scalar equation. The ten underlying rank-two formal profiles, their labelled realizations, their eight additive surface types, and the six classical differential equations are comparison results. The theory includes resonant parameters, allowed reducible connections, ramified irregular singularities, special invariant loci, tau sections and their scalar normalization. Elementary coefficient degenerations are covered by a separate boundary comparison. JMU/Hamiltonian comparisons of tau sections have the precise generic scope stated in targets 6.4–6.5; the determinant construction itself has the broader marked-RHP scope specified in 6.2–6.3.

### Scope

The general Fredholm determinant line and its canonical section are constructed in §6.1. For the trace-class realizations in §§6.3–6.4, use the determinant of RandomMatrices §8.3 with its stated operator hypotheses.

Rational and classical-function solutions are the explicit families constructed by §§5.4–5.6 and §§7.1–7.5 from geometric reductions and transformations. Target 7.3 covers the coefficient-boundary equations. The finite-flat unfolding in §1.6 is part of the symplectic closedness theorem.

### Classical phase and time conventions

Work over ℂ. Curves are smooth connected projective curves, with a finite nonempty ordered set of pairwise distinct marked points. The general rank is an integer r ≥ 1; slope stability is defined on this positive-rank domain. A ramified local condition also satisfies the rank and local-order restrictions of its stated formal model. The classical subcategory has genus zero and rank two. Write P = Σ mᵢaᵢ for the structural polar divisor; it bounds the poles and records the local moduli problem. It is not the divisor of nonzero poles of each individual connection. Apparent singularities and scalar residues at a marked point are allowed when the local conditions allow them. The auxiliary unfolding in §1.6 uses a separately constructed finite-flat divisor; its special fibers need not consist of distinct marked sections.

An object is a vector bundle E on the whole curve, a meromorphic connection ∇: E → E ⊗ Ω¹(P), an isomorphism of its determinant connection with the specified line connection, and the local structures below. All relevant bundle splitting types are retained. The general input permits a meromorphic determinant; the classical complexity subcategory uses a regular-singular determinant with fixed residues and its compatible moving-curve transport. The determinant degree may be odd. At a logarithmic point prescribe residue eigenvalues and a compatible filtration, with all compatible resonant formal isomorphism classes included. At an unramified irregular point use a generic distinct-leading-term formal condition. At a ramified point use the generic factorized ramified condition, with ramified descent. Leading coefficients required to be nonzero remain nonzero within a fixed irregular stratum. Their vanishing changes the input stratum; §7.3 compares the coefficient-boundary equations.

Write w for stability weights and α for a classical scalar coefficient. Use generic stability weights for which semistability equals stability on the specified numerical data. Stability concerns ∇-invariant subbundles. Changing a weight chamber is a wall-crossing problem, not an auxiliary-choice invariance. Isomorphisms preserve the determinant identification, labels and prescribed local structures. Retain these arrows before rigidification or passage to a coarse moduli space. For a stable rank-two object with determinant identification fixed, the residual scalar group is μ₂, not the full multiplicative group; fixing the determinant and rigidifying this remaining group are different operations.

Write Θ for fixed external residue/exponent parameters and Bθ for an admitted marked time base with θ ∈ Θ fixed. Write πθ: Mθ → Bθ for the phase family. The distinction between fixed parameters and time directions is part of the deformation problem. For the convention ∇ = d + A, a logarithmic residue λ has monodromy eigenvalue exp(−2πiλ); sources using d − A or exponent θ = −λ have exp(2πiθ). Retain the actual logarithm parameters in the fiber product defining the comparison target: forgetting them is not a proper map.

The horizontal splitting is h: π*TB → TM with dπ ∘ h = id. Its image is the invariant dynamics. A vector field representing it requires a chosen time vector. A local solution is a holomorphic section s of π satisfying ds(v) = h(v), with a specified initial point. Paths are compact piecewise C¹ paths in the fixed admitted base. This time base is fixed independently of the selected solution.

Use ω = dq ∧ dp and ι_Xω = d_phase H in a Hamiltonian chart. Thus q′ = H_p and p′ = −H_q. The extended form is Ω = dq ∧ dp + dH ∧ dt, whose kernel contains ∂t + X. Under τ = f(t) the normalized horizontal generator scales by dt/dτ. A scalar Hamiltonian is local and can change by a time-only function or by the generator of a time-dependent symplectic coordinate change.

“Painlevé function” first means a geometric horizontal section or its germ. A scalar function is the evaluation of a specified admissible observable, with a time coordinate and normalization. An everywhere defined map to ℙ¹ may give the constant value ∞; the usual meromorphic-function conclusion excludes that case. Universal-cover continuation and single-valued descent to B are different conclusions.

### Dependencies

Construct nonlinear connections, solutions, transport and observations as general theorems. Construct admitted meromorphic-connection moduli and their strong isomonodromic connection. Restrict this construction to the classical input and verify its formal profiles. Prove the full classical Riemann–Hilbert comparison and Painlevé property before developing the surface, transformation and Riccati comparisons. Construct determinant lines and tau sections. Derive the classical scalar equations, Hamiltonians and sigma forms in separate coordinate-comparison targets. The construction, continuation, surface geometry and tau-section targets have no classical scalar comparison prerequisite.

### 3.1 Decorated connections for Painlevé equations

Use an object of §1.1, with its arrows, determinant and admitted local structures.

Use the category of decorated connections constructed in §1.1, with the same objects and arrows. Record the determinant, local decorations, weights and marking for the genus-zero rank-two restriction of §3.3. Identify the local presentations used in the Painlevé sources with these same objects, preserving filtrations, logarithmic lattices and ramified descent. Use End⁰(E) and the induced PGLᵣ connection for the invariant adjoint and projective constructions. These constructions are defined for every admitted determinant, including determinants without a global square root. (I23, §§2–4.)

Identify the objects, arrows and pullbacks with those of §1.1. Supply the odd-determinant and resonant/ramified presentation comparisons used by the classical restriction.

**Checks.**

- At the four PVI poles retain both ordered logarithmic residues and the invariant flag even when the local monodromy is scalar.
- At the ramified pole of the PI model the quadratic deck transformation exchanges the two formal branches of slope 5/2.
- The two D₆ rows have different admitted polar data. Compare the two nonisomorphic marked inputs before any scalar substitution.

*Needs:* Internal: 1.1.

### 3.2 Time-deformation spaces for Painlevé equations

Use the imported decorated input and admitted deformation problem, with fixed exponent data; the classical determinant time-lift comparison must be verified.

Use §1.2 for the admitted deformation problem, its coordinate-change arrows, marking covers and fixed exponent parameters. For the classical subcategory verify the regular-singular determinant with fixed residues has the compatible time lift required by that contract. Identify the genus-zero local slices and their tangent maps in this time problem. The reduced versal problem is the input to §3.3, and §3.4 establishes its dimension. Strong isomonodromy compares analytic data by transport under coordinate changes; the displayed irregular polynomials vary with those coordinates. (HEU10, Theorem 1.1; I23, §§5, 11.)

On each smooth presentation p:T→Θ of the admitted input problem, construct the relative time tangent bundle T_(T/Θ) and the exact sequence 0→T_(T/Θ)→T_T→p*T_Θ→0. For its fixed-exponent fiber Bθ identify T_(T/Θ)|_(Bθ) with T_(Bθ), and compare other admitted base changes through their actual tangent maps. Prove that presentation-change differentials preserve this sequence. A direct-sum decomposition requires a chosen local product presentation and its explicit change-of-splitting law. Verify the determinant lift and genus-zero coordinate-change coherence required by the classical restriction.

**Checks.**

- Four ordered logarithmic points have one modulus after quotient by PGL₂: 4 − 3 = 1; its cross-ratio avoids 0, 1 and ∞.
- For the rank-two four-logarithmic model with poles at 0, 1, t and ∞, exchange the first two labels and renormalize by x↦1−x. Verify t↦1−t and permute the corresponding additive exponent data.
- At the moving logarithmic pole of that model, use z=x−t and a fixed determinant residue λ. The total logarithmic term λ dz/z is λ(dx−dt)/(x−t) in the original coordinates and has zero time component in the moving coordinate. Verify its integrability and fixed-residue restriction.
- Under t′=t+θ and θ′=θ, the relative time tangent line is unchanged but ∂_θ at fixed t becomes ∂_(θ′) at fixed t′ plus ∂_(t′). A complement to the time directions is therefore attached to the chosen product coordinates.

*Needs:* Internal: 3.1, 1.2.

### 3.3 The rank-two degree-four subcategory

Use the genus-zero rank-two input with structural polar degree four, a regular-singular determinant with compatible fixed residues, a reduced versal time family and nonempty stable fibers.

Define the classical differential Painlevé input class by genus zero, rank two, a structural polar divisor of degree four, the local moduli conditions of §3.1, a regular-singular determinant connection with fixed residues and its compatible transport, the reduced versal formal-data deformation from §3.2, and nonempty stable fibers. On genus zero the determinant residues obey their sum = −degree convention for ∇ = d + A. Take the full reduced versal deformation as the time problem. A restriction along a constant or nonversal curve does not satisfy this condition. Nonemptiness restricts the domain of the moduli problem. The objects are the connection data satisfying these conditions; their reduced-time dimension is a conclusion of §3.4, independent of the phase-dimension calculation, and continuation is a conclusion of §4.6. (VDPS09, §2.2 and Table 1; I23, Theorem 7.5.)

In the pole-budget comparison, r is the projective Katz invariant, computed from trace-free exponential differences and invariant under scalar twists. The regular-singular determinant normalization gives a time problem with no scalar irregular directions. An irregular rank-one twist requires a specified strong time lift and lies outside this classical input class and its one-dimensional deformation count. These local and formal comparisons apply to determinant lines without a global square root.

Restrict the general connection functor to this full subcategory of input data and retain its arrows. Extract rank, genus and structural degree invariantly; prove their preservation under the stated equivalences. Compare the formal pole budget with Katz invariants: m = r + 1 for integral r, and m = r + 3/2 for a positive half-integral r in rank two. State nonemptiness and excluded discriminants explicitly on each parameter base, including exceptional logarithmic exponents.

**Checks.**

- Four logarithmic points have budget 1 + 1 + 1 + 1 = 4 and belong to this complexity class.
- Five logarithmic points have phase dimension 2·5 − 6 = 4, and three have phase dimension 2·3 − 6 = 0; neither is a two-dimensional Painlevé input.
- Two ramified points of Katz slope 1/2 have budget 2 + 2 = 4. Requiring integral slopes would lose this input.
- A logarithmic residue can vanish at a phase point without changing the structural degree. Recomputing the budget from its actual nonzero poles would wrongly remove that point.

*Needs:* Internal: 3.1, 3.2.

### 3.4 Classification of formal profiles and time normalizations

Use an input of 3.3 with its admitted generic projective local types, pole labels and reduced formal-data deformation problem. The classification below determines the profile counts, automorphism stabilizers and reduced-time dimension.

Classify the allowed rank-two formal profiles of structural degree four, retaining the nondegenerate leading-term and reduced-deformation hypotheses. First classify underlying profiles after forgetting the order of the pole labels: enumerate partitions of four and the integral or half-integral generic local slope at each irregular part. This gives ten underlying profiles. Recover the original ordered input through its label-assignment groupoid: a permutation induces a reindexing equivalence between labelled presentations, not a label-preserving arrow in the original groupoid. There are seventeen ordered slope profiles, with counts 2, 8, 6 and 1 for one, two, three and four poles; the corresponding unordered counts are 2, 5, 2 and 1. These are counts of formal profile shapes, not of objects with continuous exponent parameters.

Prove that every labelled realization has one essential time parameter after quotienting the permitted label-preserving curve-coordinate changes. In a presentation with n poles the dimension calculation is n + Σ⌈rᵢ⌉ − 3 = Σmᵢ − 3 = 1, with the automorphism stabilizers and the chosen marking/slices explicitly checked. The determinant normalization and its transport remove no required projective direction and add no scalar irregular direction. Prove that all ten underlying presentations and every label assignment admit this determinant normalization. The table in §7.2 is a table of underlying profiles; its coordinate formulas are transported along the label-reindexing equivalences. (VDPS09, §2.2, Table 1, printed pp.18–19.)

For each specified marking and normalization, construct the corresponding time domain: the four-point cross-ratio base, a nonzero irregular-time chart, or an affine-time chart. Prove that these domains are charts or marking covers of the reduced time problem. The classification concerns the rank-two formal complexity specified in §3.3.

**Checks.**

- The ordered tuples (1,0,0) and (0,1,0) have orders (2,1,1) and (1,2,1). They have the same underlying profile but are not identified by a label-preserving arrow.
- Enumerating ordered compositions of 4, with one local type for a part 1 and two for each larger part, gives 2 + 8 + 6 + 1 = 17. Forgetting order gives 2 + 5 + 2 + 1 = 10.
- A label permutation preserves the pole budget and the time dimension, but transports the residue parameters and cross-ratio chart; it does not leave every displayed coordinate unchanged.

*Needs:* Internal: 3.1, 3.2, 3.3; [Formal scalar and vector-valued Laurent algebra](#supplier-formal-series) (L1–L4; L5–L6 for finite-extension steps in 1.1).

#### Examples

For a single ramified pole with slope 5/2, the structural order is 4 and the three irregular coefficients are reduced by the two-dimensional affine coordinate group to one essential time. For two unramified poles of slope 1, there are two irregular coefficients and one residual scaling, again leaving one time. These calculations concern input types before any scalar Painlevé equation is introduced.

### 3.5 Stable moduli for Painlevé equations

Use the classical input 3.3 and the general stable-moduli construction of §1.3.

Apply §1.3 to §3.3. Verify its determinant, stability and local-model admission hypotheses on the classical input; boundedness is supplied by the general construction. Identify its output with the full classical stable moduli problem. The stack, rigidification, coarse family and étale universal-object covers are the imported constructions. Retain all permitted bundle types and the actual residual μ₂ stabilizer before rigidification. Construct the comparison of every classical framed chart with its locally closed or open image, including the balanced locus, and specify each image complement in the full moduli space. (I23, Theorem 5.1.)

Identify the classical moduli functor with the restricted general functor, including arrows and determinant identification. Verify every framed chart inclusion, its complement, and the weight-chamber common stable loci.

**Checks.**

- In the PV family retain the stable split meromorphic example of §4.4 on 𝒪 ⊕ 𝒪(−∞). Verify that its two saturated invariant lines have degree −1.
- For the four-point logarithmic model verify that rigidification leaves the coarse family and that a determinant identification reduces scalar inertia to μ₂.
- On the Jimbo–Miwa PII chart identify its open image by the chosen frame and state which points require a different chart.

*Needs:* Internal: 3.3, 1.3.

### 3.6 Deformation complexes and trace pairings

Use the family of §3.5 with its determinant and local structures.

Specialize §1.4 to the determinant-fixed family of §3.5, and prove that infinitesimal classical families and gauges correspond to its cocycles and coboundaries. Use its full three-term ramified cone and ℂ-linear differential-operator/Čech construction. The commutator differential is generally not O-linear. Any shorter presentation is compared with the full cone by a specified quasi-isomorphism. Verify the determinant restriction and trace-sign convention on the same complex. (I23, equation (6.9), Propositions 6.3 and 7.2.)

Construct the restriction comparison with the general cone, including the determinant-fixed tangent directions. Verify gauge, trace-sign and local-presentation compatibility under this comparison.

**Checks.**

- For a stable PVI object, compute the determinant-preserving scalar automorphisms ±I. Over the dual numbers the determinant of (1+εa)I is 1+2εa, so the infinitesimal scalar gauge vanishes in the fixed-determinant complex.
- At the ramified PI pole of slope 5/2, the trace-free horizontal endomorphisms of the formal meromorphic connection form the one-dimensional diagonal on the cover w²=z. The deck involution exchanges the two diagonal entries, so the descended trace-free space is zero.
- For a stable fixed-determinant PVI object on ℙ¹, the deformation hypercohomology dimensions are h⁰ = h² = 0 and h¹ = 2. Keeping the flags and fixed determinant but allowing the residue eigenvalues to vary adds one trace-free diagonal direction at each of the four poles, giving h¹ = 6.

*Needs:* Internal: 3.5, 1.4.

### 3.7 Symplectic structures on phase spaces

Use the classical family and deformation complex of §§3.5–3.6, with their comparisons to the general deformation construction.

Apply §§1.5–1.6 to the family and complex identified in §§3.5–3.6. Verify the determinant-fiber comparison; the Jacobian has dimension zero in genus zero. Derive smoothness and relative dimension two by substituting g = 0, r = 2 and deg P = 4 in the general theorem, and derive nondegeneracy and relative closedness of the trace form. Use the finite-flat auxiliary unfolding, its simple-connection moduli, both generic logarithmic quasi-isomorphisms and the smooth-density argument from the general symplectic construction. Identify its central stable fiber, complex and form with the classical family, compatibly with admissible nonreduced base change. (I23, Theorems 7.5 and 8.1, Propositions 8.2–8.3.)

Verify the fixed-determinant and central-fiber comparisons needed to specialize the general theorem. Export the same relative tangent bundle and symplectic form on the entire classical family.

**Checks.**

- For the Jimbo–Miwa PII chart verify dimension two on a fixed time and exponent fiber and compare the trace form with dq ∧ dp in the normalization of §7.2.
- Compare the central four-point logarithmic fiber with the trace form obtained by the simple-connection unfolding.
- Verify the pullback comparison on a first-order time change before using the trace form in §3.11.

*Needs:* Internal: 3.3, 3.5, 3.6, 1.5, 1.6.

### 3.8 Exceptional strata of the phase space

Use the full stable moduli of §3.5 with its admitted rank-two local conditions and external exponent parameter space Θ, the analytic and marking comparisons of §1.2, and the smooth analytic parameter charts of §3.7. Nonemptiness of any named locus is a separate assertion.

Construct the following indexed family of subobjects, their inclusions in the full phase family M and their compatible pullbacks. The loci may intersect; the assertions below impose no flatness condition on them.

At each logarithmic marked point a_i and each n∈ℤ, define the resonance hyperplane Res_(i,n)⊂Θ by λ_(i,0)−λ_(i,1)=n, including n=0, and define the corresponding phase locus by pullback along M→Θ. The integer n remains part of the index of each resonance locus; use this ℤ-indexed family of loci and its phase pullbacks. Describe how the parabolic flag records data when residues coincide.

Define the invariant-line incidence moduli 𝓘_red whose objects are stable decorated connections together with a saturated ∇-invariant rank-one subbundle L⊂E; in a family L and E/L are locally free. Construct its forgetful map to the stable stack and the phase family. On a geometric fiber M_b define Red(M_b) as the image of this map, and define the reducible family subfunctor of h_M by requiring every geometric fiber to lie in Red(M_b). The incidence functor includes a chosen relative invariant line, whereas the reducible-family subfunctor records only its fiberwise existence. Prove pullback compatibility for the incidence construction, its forgetful map and this fiberwise reducibility condition.

For each logarithmic marked point a_i, first construct its local monodromy on the analytic universal-object charts of §3.5. Using §1.2, choose a relative analytic coordinate disk Δ_i about a_i, disjoint from the other poles, a basepoint section in Δ_i* = Δ_i ∖ a_i, a positively oriented generator of the punctured-disk fundamental group, and a local frame of the bundle at that basepoint. On Δ_i* the restricted connection is nonsingular and flat in the curve direction. Apply the nonsingular flat-connection/local-system comparison supplied by ComplexKahlerGeometry K4 in the complex dependency contract on each punctured curve fiber. Construct its local system of horizontal sections and the loop-transport automorphism T_i of the basepoint fiber. The chosen frame represents T_i by a GL₂ matrix. On the admitted smooth analytic parameter charts, use §0.3's joint holomorphic dependence for the local linear ODE and continuation along a finite chain covering the marked loop to prove holomorphic dependence of T_i on the parameters.

Prove compatibility with restriction and refinement of the disk, invariance under homotopy of the marked positive loop, and conjugacy under changes of the frame, basepoint and holomorphic disk coordinate, retaining the connecting paths for basepoint changes. Construct the corresponding comparison arrows with their identity and composition laws. Prove compatibility with universal-object changes and admitted analytic base change under their comparison maps. For a line bundle L on the parameter base, identify the automorphism after twisting by its pullback with T_i⊗id_L. These comparisons are identities of the actual family automorphisms. This construction uses only the punctured neighborhood of a_i and applies when the other marked poles are irregular.

For the convention ∇ = d + A and the graded logarithmic residues λ_(i,0), λ_(i,1), prove charpoly(T_i)(X) = (X − exp(−2πiλ_(i,0)))(X − exp(−2πiλ_(i,1))) from the local logarithmic equation, including integral exponent differences. Retain the actual monodromy automorphism at resonance; its eigenvalues alone do not determine its Jordan structure. The logarithmic lattice and parabolic flag remain part of the connection data. (ComplexComparisonPartII C5.6, `RegularSingular` and `CanonicalLogExtension`.)

Using this local monodromy before passing to an affine character quotient, define App_i^lin⊂M^an by T_i=I and App_i^proj⊂M^an by [T_i]=1 in PGL₂. Construct these analytic subobjects on universal-object charts and descend the equations under conjugacy and changes of representative; prove compatibility with admitted analytic base change. The first is the ordinary apparent-point convention, while the second records projectively apparent points. Scalarizing by a chosen cyclic vector can create additional apparent poles away from the marked divisor; those are presentation data constructed in §7.2, not these fixed-marked-point loci.

Prove that the full stable moduli retains every point of these subobjects allowed by its local conditions, and record the hypotheses for each nonemptiness claim. An admitted totally ramified generic local model makes Red(M_b) empty by the formal irreducibility theorem. Targets 4.1–4.4 compare the images of the subobjects defined here with their Betti conditions. A vanishing leading irregular coefficient changes the admitted input and belongs to §7.3's coefficient-boundary comparison. (I23, §2 and Remark 2.9; IIS06, §4, especially Theorem 4.10, Corollary 4.11 and Theorem 4.12; VDPS09, §2.2, §3 and §4.2.)

Construct each indexed resonance locus as a pullback, with its inclusion and base-change identity. Construct 𝓘_red and its forgetful map, identify its geometric-point image with reducibility, and provide the separate fiberwise reducible subfunctor. Construct T_i from punctured-disk horizontal transport, prove its spectral sign convention, and provide its holomorphic dependence, conjugacy comparisons and analytic base-change laws. Construct App_i^lin and App_i^proj using the stated local monodromy equations, their inclusion App_i^lin⊂App_i^proj, and their analytic descent and base-change comparisons. Keep each locus's local conditions and nonemptiness hypotheses attached to its later image and invariant-curve comparisons.

**Checks.**

- The local connection d+(1/2)I dz/z has monodromy −I: it belongs to App_i^proj but not App_i^lin. Equality of the coarse local character with that of the identity does not imply the defining matrix equation T_i=I.
- For ∇ = d + [[0,1],[0,1/z]]dz, the residue is diag(0,1) and exp(−2πi Res)=I. At basepoint z=1 with the standard frame, transport around a positive loop is [[1,−2πi],[0,1]]. This resonant example distinguishes actual monodromy from the exponential of the residue.
- A logarithmic residue with repeated eigenvalues can have nontrivial unipotent monodromy, so resonance alone does not place a point in either apparent locus.
- The generic totally ramified formal model has no invariant rank-one submodule; its global reducible incidence is empty.

*Needs:* Internal: 0.3, 1.2, 3.1, 3.5, 3.6, 3.7; [Complex manifolds, holomorphic bundles and observations](#supplier-complex) (K1; K3.0; K3.HolomorphicStalk; K3.MeromorphicGermField; K4; K7.1); [Covering spaces and universal covers](#supplier-covers) (Stage 0.2–0.4; Stage 1.5; Stage 2.6–2.8); [Regular-singular comparison](#supplier-regular-singular) (ComplexComparisonPartII C5.6, `RegularSingular` and `CanonicalLogExtension`).

#### Examples

At genus zero and rank two, the dimension calculation gives −8 + 2 + 2·4 = 2. An affine phase chart has coordinates (q,p), but points missing from that chart remain genuine initial conditions. On a resonance divisor, distinct parabolic initial points can have the same coarse monodromy character; the phase space must retain them.

### 3.9 Isomonodromic connections for Painlevé equations

Use the constructed classical moduli/time problem; verify that its local structures and determinant transport satisfy the strong-extension contract.

Apply §2.1 to the time problem of §3.2 and the family of §3.5, with the comparisons of §§3.6–3.7. Identify its strong extensions with the classical universal-object charts, including kernel lattices, logarithmic flags and ramified descent. The total pole class is Ω¹_X(log D) ⊗ O_X(P − D). Prove its comparison with the moving-coordinate generators dz/zᵐ and dε/zᵐ⁻¹, including regularity of the time coefficient at a logarithmic pole. Specialize the existence, uniqueness and gluing theorems for strong extensions, and construct h as their induced tangent splitting in the sense of §0.1. (I23, Definition 10.1, Propositions 10.7 and 10.10.)

Compare the classical kernel lattices and moving-pole filtration with the general strong-extension class. Identify the resulting splitting with the nonlinear connection of §0.1, and prove its linearity and compatibility with the general base-change maps.

**Checks.**

- In the PVI moving coordinate z=x−t, the logarithmic term A dz/z has no time pole in that coordinate. Its time coefficient in the fixed coordinate x is −A/(x−t).
- In the PIII(D₇) ramified model compare the time coefficient before and after the quadratic base change on the polar disk.
- The strong lift preserves the logarithmic flag at a PVI resonant pole. Check this on its kernel lattice.

*Needs:* Internal: 3.2, 3.5, 3.6, 3.7, 2.1, 0.1.

### 3.10 Flatness of the isomonodromic connection

Use the strong splitting identified in 3.9 and the verified restriction of the general two-parameter extension problem.

Use §2.2 and the identification of §3.9 to obtain h([v,w]) = [h(v),h(w)] on the classical family. Verify that the two-parameter strong-extension comparison restricts to this time problem. This restriction supplies the bracket identity for every admitted formal profile from the algebraic strong-extension construction. (I23, Theorem 11.6.)

Verify the restriction comparison for the mixed extension and export the bracket identity.

**Checks.**

- On a one-dimensional time chart h(f∂t) and h(g∂t) bracket to h((fg′−gf′)∂t).
- On a two-parameter marked chart use the mixed dual-number term to compare the two ordered lifts before restricting to one time coordinate.
- Check that the bracket identity descends under the Möbius normalization in the four-logarithmic profile.

*Needs:* Internal: 3.9, 2.2.

### 3.11 Symplectic transport and the total two-form

Use the relative form and splitting of §§3.7 and 3.9, their flatness from §3.10, and their comparison with the moduli symplectic-preservation theorem.

Specialize the symplectic-preservation theorem of §2.2 to the classical family. With this preservation identity and the flatness of §3.10, apply §0.6 to (π,h,ω) and obtain the closed total form Ω(v,w) = ω(v − h(dπv), w − h(dπw)), its kernel and transport laws. Identify its vertical restriction with the relative trace form. Choose sufficiently small local Darboux/time charts, establish the required local exactness, and derive the expression dq ∧ dp + dH ∧ dt. (I23, Definition 11.4 and Corollary 11.8.)

Identify the relative form of §3.7, the total form of §0.6 and the horizontal kernel of the latter. Verify Hamiltonian signs and time-dependent coordinate comparisons only after choosing the stated local charts.

**Checks.**

- In the PII normalization verify that the kernel of dq ∧ dp + dH_II ∧ dt is generated by the time field with q′=∂H_II/∂p and p′=−∂H_II/∂q.
- On a fixed PVI time fiber verify that the restriction of the total form is the relative trace form.
- Across a PII chart change check equality of total forms before comparing their local Hamiltonian potentials.

*Needs:* Internal: 3.7, 3.9, 3.10, 2.2, 0.6.

### 3.12 Base change and presentation independence of the isomonodromic connection

Use the verified classical restrictions of the general construction and their actual presentation-change arrows.

Use §§2.3–2.4 to identify all objects in targets 3.1–3.12 as the classical restriction of one construction, with coherent presentation, gauge and admissible base-change comparisons. Verify the cocycle diagrams for the classical markings and time slices. For changes of labels, determinant or stability chamber, use the permitted morphisms or correspondences on their stated domains. Require the coordinate comparisons of §7.2 to commute with these geometric comparison maps.

Prove the classical specialization square and its triple-overlap coherence. Keep all imported structures on one moduli family and one nonlinear connection.

**Checks.**

- On a chart over t=s² the pullback time field projects to ∂s and has old time component 2s∂t.
- Reindex the four logarithmic poles, including their residues and determinant. Compare the two marked phase presentations and the two orders of reindexing three labels.
- Compare the two ramified chart presentations related by w↦−w using the actual deck comparison.

*Needs:* Internal: 3.1, 3.2, 3.5, 3.9, 3.10, 3.11, 2.3, 2.4.

### Examples

The Hamiltonian chart H = p²/2 − 2q³ − tq represents a horizontal kernel, but the kernel is constructed without this formula. Replacing H by H + c(t) preserves it. A marking change acts on the parameterized family; it does not erase the marking from the input groupoid.

## Layer 4: Riemann–Hilbert comparison and the Painlevé property

### Dependencies

Use Layer 3 for the full phase family and its splitting. Use §§4.1–4.3 to build the decorated and ordinary Betti descriptions before applying the GIT and continuation results.

Construct the local decorated Riemann–Hilbert correspondence and the ordinary Betti family for all ten admitted classical profiles. Identify the full stable connection family with a weighted quotient of the decorated data on time and exponent charts. Derive properness of the ordinary Riemann–Hilbert map from the projective forgetful morphism, and surjectivity from the realization of irreducible data and closedness of the image. Construct complete horizontal transport by reconstructing fixed decorated data throughout the time family. The four-logarithmic profile uses the same constructions and has additional results on the smooth character locus and the exceptional fibers.

### 4.1 Local Riemann–Hilbert reconstruction and descent

Use the admitted classical rank-two local types, the logarithmic monodromy construction of §3.8, resonant logarithmic lattice data, and the finite ramified covering with deck action. Include the rank-one regular-singular local data of the determinant connection.

Construct the analytic correspondence between the permitted local meromorphic connections and Stokes-filtered local systems on the oriented boundary circle. A logarithmic model has only the zero exponential factor and uses the actual horizontal system and monodromy T_i of §3.8. At a ramified point construct the filtration on the finite cover and its equivariance under the deck permutation of exponential factors. Prove sectorial existence, overlap uniqueness, cocycle identities and coherent descent, with analytic dependence on admitted time/exponent charts. (SAB12, Definition 2.22 and Theorem 5.8; I23, §9; BOA01, §§3–6; BY15, Remark 3 and Definitions 7 and 13.)

Retain the holomorphic lattices, polar conditions, residue lifts, flags and factorized structures of §1.1 as decorations of this meromorphic correspondence. Construct their relative reconstruction and prove full faithfulness on decorated objects. At logarithmic poles include repeated and resonant residues and the integer lattice shifts realizing the prescribed lifts. Prove comparison under changes of representative, coordinate, basepoint, loop marking, frame and sectorial normalization. Glue with the local system on the punctured curve, and apply §1.2 to obtain the algebraic/analytic comparison on every permitted bundle type. (SAB12, Proposition 5.12; I23, Proposition 3.3 and Corollaries 4.3–4.4.)

At a logarithmic point let T be the actual monodromy on the two-dimensional solution space V. On an exponent chart choose holomorphic branches of the logarithm on its spectral clusters. Write λⱼ = μⱼ + nⱼ with nⱼ constant integers and μⱼ the eigenvalues of B = −log(T)/(2πi). Choose the branches so that the spectra of k+B for distinct integers k are disjoint. If n₁<n₂, the extension with a specified residue flag is encoded by a line L with (T−exp(−2πiλ₁))L=0. Its lattice in the logarithmic model d+B dz/z is zⁿ¹𝒪L + zⁿ²𝒪V. Interchange the labels when n₂<n₁. When the shifts agree, use zⁿ¹𝒪V with the invariant residue flag. Prove the converse by decomposing a finite Laurent quotient into the spectral clusters of z∂z+B. Establish the uniform meromorphic comparison with the logarithmic model, local freeness of the recovered flag and compatibility with analytic base change, including nonreduced test bases. The closed line incidence has fibers a point at distinct eigenvalues or a nontrivial Jordan block, and ℙ¹ at scalar monodromy.

At a generic unramified pole, show that horizontal formal automorphisms are constant diagonal and preserve the prescribed lattice and thickened-point flag. Recover the lattice by inverse image in a bounded finite Laurent quotient. At a totally ramified pole use the quadratic cover and the sheared model with distinct exponential factors. Recover the downstairs lattice by invariant finite direct image and recover the factorized-structure class from the leading nilpotent flag and the induced action of the ramified coordinate on the finite quotients. Verify the comparison with §1.1's actual decoration functor, including its equivalence relation and base-change laws. The deck exchange of the two branches rules out a rank-one Stokes subobject downstairs.

For the inverse Stokes construction in families, choose a sector cover with uniform exponential decay on small parameter charts. In the model's fundamental solutions the horizontal transition cocycle differs from the identity by terms flat at the pole. Split it smoothly using an angular partition of unity and solve the resulting ∂̄ equation by a Cauchy–Green operator and a uniformly convergent Neumann series on a smaller disk. Prove holomorphic parameter dependence, the common formal expansion and the meromorphic pole bound. Check the forward family construction and both inverse comparisons on morphisms, including finite nilpotent thickenings. Use equivariant reconstruction on the ramified cover and descend the lattice by the averaging projector. (BV89, Part I, Theorem 4.5.1, for the local Malgrange–Sibuya construction.)

Apply ComplexComparisonPartII C5.6's `RegularSingular` and `CanonicalLogExtension` to the logarithmic model. Compare its chosen strip lattice with the prescribed resonant lattices and flags above. Use its monodromy comparison under the strip hypothesis and retain exp(−2πiλ) as the spectral convention. Prove determinant compatibility on actual exterior-power lattices, including integer residue shifts, Stokes maps and deck action. Construct the rank-one extension with the prescribed trace residues and compare it with the determinant of the decorated reconstruction.

Construct restriction, refinement and changes of sectorial normalization, and prove their composition and descent laws for all three local types. Classify the logarithmic extensions by closed line incidence, prove uniqueness of the irregular lattices and their decorations, and construct the parameter-dependent Stokes inverse with its family and morphism comparisons. Construct the determinant/lattice comparison and rank-one reconstruction with their resonance and tensor conventions, compatible with gluing and admitted base change. Prove that integrable time extension is equivalent to strong local constancy of these data at the stated local scope.

**Checks.**

- A rank-one exponential exp(1/z) has irregular growth despite trivial ordinary monodromy; ordinary monodromy alone cannot classify the object.
- A nontrivial unipotent logarithmic monodromy matrix differs from the identity although both eigenvalues equal 1.
- On a quadratic cover, one full turn in z exchanges the two formal exponential branches; a sectorial construction that returns each branch individually without the deck action fails descent.

*Needs:* Internal: 1.1, 1.2, 3.1, 3.2, 3.8, 3.9, 3.10; [Complex manifolds, holomorphic bundles and observations](#supplier-complex) (K1; K3.0; K3.HolomorphicStalk; K3.MeromorphicGermField; K4; K7.1); [Regular-singular comparison](#supplier-regular-singular) (ComplexComparisonPartII C5.6, `RegularSingular` and `CanonicalLogExtension`).

### 4.2 The Betti family and complete transport

Use the local analytic data of 4.1 over the admitted marked time problem of 3.2, retained exponent lifts, and fixed closed spectral/determinant constraints; singular affine quotients are permitted.

For every admitted profile, glue §4.1's decorated local data with the local system on the punctured curve. Construct the forgetful functor Forθ to the ordinary representation/Stokes groupoid and its affine quotient map qθ, and set βθ = qθ ∘ Forθ. Forθ forgets the holomorphic lattices, flags and factorized extension choices while retaining the prescribed formal grading, Stokes maps and deck action. The ordinary target retains the local characteristic-polynomial constraints, formal grading and monodromy, Stokes factors, deck relations, global product relation and specified determinant character. These conditions define the entire closed-constraint quotient Rθ independently of RH. Retain the exponent lifts as separate fiber-product coordinates, including the scalar and allowed unipotent strata at resonance. Construct the determinant morphism to the rank-one character family, its version with the compatible regular-singular determinant varying, and restriction along a prescribed determinant-character section. (VDPS09, §§1–3; BY15, Proposition 19, Theorem 21 and Corollary 22.)

On a marked chart let X₀ be the affine scheme of framed monodromy matrices, formal monodromies, Stokes factors and invertible links satisfying the ordinary relations. For fixed determinant let G be the product of the global SL₂ frame group and the local formal frame groups. The local factors at unramified irregular poles are determinant-one diagonal tori. At a totally ramified pole with a fixed branch-exchanging monodromy representative, use its centralizer in the determinant-one torus, which is finite. Compare this presentation with allowing the representative to vary in its twisted coset and dividing by the torus. Stokes root groups give coordinates of X₀. Form the ordinary quotient X₀//G over the multiplicative exponent base, then analytify and pull back along the map from the time and additive exponent chart. Add the logarithmic line incidences of §4.1 to obtain a projective G-equivariant morphism X→X₀ on the chart. Use the uniqueness of the generic irregular decorations to compare this framed scheme with the decorated data. Prove the chart-change and marking laws for the decorated data and their forgetful map.

In the four-logarithmic-point specialization, let T be an admitted chart of four ordered points on ℙ¹, T̃ its marking cover and Rep₂(C,D) the unfixed-determinant GL₂ conjugacy quotient. Let A₂^(4) consist of four monic quadratic local characteristic polynomials with nonzero constant terms whose product is 1. Write Λ₂^(4)(d) for the two ordered residue lifts at each pole satisfying d+Σᵢⱼλⱼ^(i)=0, and rh:Λ₂^(4)(d)→A₂^(4) for the characteristic polynomials with eigenvalues exp(−2πiλⱼ^(i)). The construction gives, after analytification, R_log^un = (Rep₂(C,D)×_T T̃)×_(A₂^(4))Λ₂^(4)(d), with its determinant morphism and fixed-determinant restrictions. Retain the full λ-coordinate and compare with I13's character-family construction in §2. Variation of λ is an external parameter direction; time transport fixes λ.

Prove that these analytified character families and exponent pullbacks are Hausdorff and locally compact, including singular points. Construct product descriptions over simply connected admissible time charts and compare them under changes of marking and Stokes-sector presentation. Prove independence, composition, inverse and homotopy laws, then concatenate along compact paths to obtain complete transport. For the ramified types extend BOA14 §10, Theorem 10.2's untwisted isotopy construction by retaining the exponential covering, formal grading and deck action of BY15, constructing deck-compatible groupoid equivalences and descending the framing action and closed constraints. The construction acts on singular coarse fibers and on the required decoration spaces.

Construct restriction, gluing, gauge-conjugation and change-of-marking functors, retaining their natural isomorphisms. Construct the framed schemes X and X₀, the frame action and the projective incidence morphism. Construct Forθ, qθ and βθ and verify their ordinary quotient and marking laws. Construct the determinant morphisms and restrictions, including the four-point GL₂ specialization R_log^un with its full exponent coordinate. Prove local products and complete transport, and their compatibility with Forθ, qθ, βθ, determinant restrictions and changes of marking.

**Checks.**

- θ and θ + 1 give the same exponential eigenvalue but need not give the same logarithmic lattice; the comparison target retains θ.
- A reducible representation and its semisimplification can have the same coarse character. Distinct flags over scalar local monodromy can also give distinct decorated objects with the same ordinary character. These are two separate losses of information, through quotient formation and through Forθ.
- Transport around a nontrivial loop may act nontrivially on the fiber; completeness does not imply trivial monodromy.

Construct the finite-type framed representation/Stokes varieties and their affine quotients using §1.3, and apply §1.2 analytification and the exponent pullbacks. Use reductive invariant theory at the reductive framing-group stages and explicit descent at the other quotient stages, retaining the local unipotent Stokes groups. Prove root/deck isotopy, ramified descent, stabilizer compatibility, holomorphicity and Hausdorff/local-compactness on every admitted stratum. Express the constructed quotient universal properties using SchemeAndStackFoundations §1.17.

*Needs:* Internal: 1.2, 1.3, 3.2, 4.1; [Quotient predicates](#supplier-quotient-predicates) (1.17); [Covering spaces and universal covers](#supplier-covers) (Stage 0.2–0.4; Stage 1.5; Stage 2.6–2.8); [Smooth bundle and connection foundations](#supplier-smooth) (B1.5; B5.0; B5.2); [Marked-curve charts](#supplier-curves) (ComplexCurveModuli D0.3, D3–D5; SchemeAndStackFoundations 4.15); [Reductive GIT](#supplier-reductive-git).

### 4.3 Riemann–Hilbert and compatibility on the whole phase space

Use the full stable moduli family of 3.5 with the loci of 3.8, the splitting and flatness of 3.9–3.10, the comparisons of 3.12, and the reconstruction and Betti family of 4.1–4.2. Allow compatible regular-singular determinant lines to vary over their rank-one moduli base, within the same genus-zero, rank-two, structural-degree-four data and weight chambers.

Construct RHθ: Mθᵃⁿ → Rθ by composing §4.1's forward decorated analytic correspondence with βθ on §1.3's universal-object covers, and prove holomorphic descent, presentation independence and admitted analytic base-change compatibility. Use this construction also in determinant-relative form: the base retains the compatible regular-singular line connection, and a prescribed section gives the fixed-determinant family. Construct the relative coarse family on universal-line covers and prove its descent using §1.3.

On the framed presentation X of §4.2, compare connection stability with a rational GIT linearization on each time and exponent chart. When there is no totally ramified pole, a rank-one Stokes subobject gives a saturated invariant line in the reconstructed bundle. Compute its degree as minus the sum of its lifted residues. Let αᵢⱼ be the parabolic weights with their actual graded-piece convention, and let cᵢ be 1 at a logarithmic point and the thickening length mᵢ at an unramified irregular point. Use effective Betti weights βᵢⱼ = cᵢαᵢⱼ − Re λᵢⱼ. At a logarithmic resonance, use the incidence line with its actual lifted residue to compute the induced weights. For each possible branch and flag pattern of a rank-one Stokes subobject, the sum of the lifted residues must be integral. Shrink around the center of the chart so that the patterns that can occur have fixed integral sums. Choose one rational vector β′ preserving the finite set of stability signs and the order of the two effective weights at a resonant point.

For each logarithmic pole use the incidence line for the higher effective weight. At a resonant center with unequal shifts, the smaller shift selects that line since the difference of the original parabolic weights has absolute value less than 1. With equal shifts use the corresponding residue flag. On a nonresonant chart, the complementary eigenspace is recovered by spectral projection if the labels need to be exchanged. For a common divisible positive integer K use the flag factor 𝒪(K(β′ᵢ,high−β′ᵢ,low)) and the unramified torus character with exponent difference −K(β′ᵢ₁−β′ᵢ₂).

Apply the relative Hilbert–Mumford criterion to §4.2's projective incidence morphism and the chosen linearization. Its frame group is linearly reductive over ℂ, including the finite ramified factors. For a one-parameter subgroup with global weights (−a,a), a>0, show that the limit exists exactly when the weight-a line W is a rank-one Stokes subobject and the local subgroup weights match it through the invertible links. A subgroup with trivial global part and a limit has trivial local parts by the same links. Prove that the weight on the limiting fiber of the linearized sheaf is 2Ka times (½ Σᵢⱼ β′ᵢⱼ − Σᵢ β′ᵢ(W)), where β′ᵢ(W) is the weight selected by W. Match positivity and nonnegativity with the strict and weak parabolic slope inequalities, respectively. If a totally ramified pole occurs, its finite formal frame group and invertible link exclude a nontrivial one-parameter subgroup with a limit. Use a relatively ample flag linearization there.

Compare the stable quotient of X with the full stable analytic connection family by §4.1's inverse on actual families and morphisms. Account for the finite scalar center, local quotient presentations, analytic base change and the prescribed determinant. This gives the chartwise analytic isomorphism with the weighted decorated Betti quotient. Under it the ordinary RH map is the map induced by X→X₀.

Construct the marked rank-one de Rham and Betti families D_dR and D_B over the same time/exponent base, with the trace residues, degree and logarithmic lattice retained. Prove that their RH₁ is an analytic isomorphism using the canonical logarithmic extension supplied by ComplexComparisonPartII C5.6 and its prescribed-lattice comparison in §4.1, including family and marking compatibility. Use the determinant/lattice comparison of §4.1 to prove det_B ∘ RH = RH₁ ∘ det_dR. This determinant/RH square is commutative.

Prove a coarse determinant-restriction lemma on these admitted families. In this lemma M^un, R^un and M_L^det denote marked analytic coarse spaces; the superscript un means that no determinant identification is chosen. Let (L,∇L) be a compatible line connection over their common time/exponent base. Put δ_L=RH₁(L,∇L) and R_det(L)=det_B⁻¹(δ_L). Construct an isomorphism M_L^det ≅ M^un ×_(R^un) R_det(L), with the determinant identification retained in the actual-family source of M_L^det. Prove it by mutually inverse coarse morphisms on §1.3's presentations and their universal properties, accounting for Gm inertia, μ₂ inertia and base-line twists with square trivialization. A Cartesian square of actual-family stacks alone is insufficient: prove descent of these inverse morphisms and their admitted analytic base-change laws. Carry out the comparison over universal-line covers of D_dR as well, and descend it to identify the determinant-relative coarse family with the corresponding pullback of M^un. Prove compatibility with the certified determinant transport. The Cartesian assertion concerns this restriction square.

For four logarithmic points, §1.3 gives M_log^un over T×Λ₂^(4)(d); write M̃_log^un=(M_log^un)ᵃⁿ×_T T̃. Match the ordered residues, degree, generic weights and actual-family equivalence with I13 Definition 4.3: Q_PVI(S) consists of families modulo isomorphism after a base-line twist with its canonical relative connection and transported flags. Construct Q_PVI ≅ M_I13|_(g=0,r=2,n=4) on locally Noetherian test schemes and the induced fppf, analytic-sheafification and coarse comparisons through §1.3. Identify the resulting RH_log^un: M̃_log^un → R_log^un with I13's map, retaining the full λ-coordinate and all marking and base-change laws. Its determinant line has degree d and trace residue Σⱼλⱼ^(i) at each pole.

For every profile define Vθ^nr by irreducibility of the ordinary generalized monodromy object and λᵢ,₁−λᵢ,₂ ∉ ℤ at each logarithmic pole. Irreducibility excludes a common rank-one subobject compatible with global monodromy, formal grading, Stokes maps and deck action. Let Uθ^nr be the complement of §3.8's reducible locus with the same exponent condition. Prove that Uθ^nr and Vθ^nr are open. Prove local uniqueness of the logarithmic lattice and labelled flag from the nonresonant lifts, of the unramified lattice and filtration from the labelled formal summands, and of the ramified lattice and factorized-structure class from the prescribed w²=z model with deck descent. Retain the distinct leading eigenvalues and a₁₀ ≠ 0 hypotheses. Prove holomorphic dependence and gluing to a stable connection of the prescribed degree and determinant; establish Uθ^nr=RHθ⁻¹(Vθ^nr) and a two-sided inverse jθ^nr. This includes the four-logarithmic-point profile. On a logarithmically resonant parameter fiber Vθ^nr is empty.

For four logarithmic points, prove the stronger inverse theorem with Vθ the union of the smooth loci of Rθ,b and Uθ=RHθ⁻¹(Vθ), including smooth points on resonant exponent fibers. Compare the fixed-determinant functors and markings with IIS06 Definition 4.9 and Theorem 4.10, and prove that this inverse extends jθ^nr. For the other profiles set (Uθ,Vθ,jθ)=(Uθ^nr,Vθ^nr,jθ^nr). Prove both inverse identities and their marking and base-change laws; retain every fiber and decoration outside Uθ. Compare the ordinary inverse with IS12 Theorem 5.1 on its generic unramified scope.

Apply §0.3 to the holomorphic flat splittings of §2.4 and §§3.9–3.10 to obtain local horizontal sections through every initial point. Use §2.2's strong total representatives on these sections and prove that their local systems and Stokes data give §4.2's transport. Descend to all source points, including resonance, reducible and apparent loci, and to the determinant-relative and four-logarithmic auxiliary families. This all-point comparison is independent of RH invertibility; §4.5 records local existence.

Construct the RH maps through Forθ and qθ, prove the numerical stability comparison and identify the actual analytic coarse family with the weighted decorated Betti quotient on each chart. Prove the rank-one RH isomorphism, commutative determinant/RH square and coarse determinant-restriction lemma, including descent when the compatible determinant varies. Construct the four-logarithmic Q_PVI/I13 comparison and identify the specialized RH map with its full time/exponent and actual-family data. Construct jθ^nr for every profile and the stronger PVI inverse on smooth character fibers, with both inverse identities and their compatibility laws. Prove all-point horizontal compatibility for the full source and determinant-relative families.

**Checks.**

- At a logarithmic pole write Δ=β′ᵢ,high−β′ᵢ,low. For global weights (−a,a), the flag factor 𝒪(KΔ) contributes −KaΔ if the incidence line is W and +KaΔ otherwise. In the latter case the limit is the weight-(−a) line. These are weights on the linearized sheaf itself.
- Distinct points of an exceptional RH fiber can have the same ordinary character; no two-sided inverse exists on that fiber.
- The source retains scalar and unipotent logarithmic strata. The PVI smooth-character inverse includes smooth resonant points even when Vθ^nr is empty.
- Retaining exponent lifts distinguishes θ from θ+1 even when their exponential eigenvalues agree.
- For a fixed stable object E₀, E₀⊠O and E₀⊠O(1) over ℙ¹ have the same unfixed-determinant Q_PVI class but need not be isomorphic as actual families. A fixed-determinant base-line twist requires a square trivialization.

*Needs:* Internal: 0.3, 1.1, 1.2, 1.3, 1.5, 2.2, 2.3, 2.4, 3.3, 3.5, 3.8, 3.9, 3.10, 3.12, 4.1, 4.2; [Regular-singular comparison](#supplier-regular-singular) (ComplexComparisonPartII C5.6, `RegularSingular` and `CanonicalLogExtension`); [Reductive GIT](#supplier-reductive-git).

### 4.4 Properness and stable realization for classical families

Use the admitted time and additive exponent base of the ten classical profiles, the determinant-relative RH maps of §4.3 and a parabolic weight chamber with stable equal to semistable. Include all allowed resonant and reducible strata, generic ramified local types and bundle splitting types.

Apply the relative invariant Proj contract to the projective G-equivariant incidence map X→X₀ of §4.2 and the relatively ample rational linearization of §4.3 after clearing denominators. Use ComplexComparisonPartII §C−1.1 to analytify the projective quotient morphism, obtain its analytic properness and pull it back to the time and additive exponent chart. Use §C−1.2 to analytify locally separated algebraic-space presentations through their étale relations. Use the equality of stable and semistable on the chart and prove on the quotient charts of §4.3 that the analytic pullback of the stable geometric quotient is the coarse space of the analytic stable quotient stack. Identify the resulting morphism with the ordinary RH map, including at resonance where the linearization is unchanged. This gives properness over the admitted time and exponent base and under analytic base change. Carry out the same comparison over local frames of a varying compatible determinant connection and descend by §4.3.

Prove surjectivity on each fixed time and exponent fiber. Lift an irreducible ordinary Stokes object to the local decorations of §4.1 and glue it to a connection with the specified determinant and degree. Its irreducibility gives stability. A totally ramified pole makes every Stokes object irreducible by the exchange of the two branches. For the five profiles without a totally ramified pole, show that every reducible coarse point is represented by the sum of two rank-one Stokes objects. On the punctured sphere the choice of local branches and eigenvalues gives finitely many such characters. Identify the five ordinary fixed-parameter quotients with the cubic surfaces of VDPS09 §§3.1, 3.2, 3.4, 3.7 and 3.9, checking the marking and determinant normalizations. For the four irregular cubics write the equation as A(x,y)z+B(x,y)=0 and verify coprimality of A and B at every permitted parameter. For the four-logarithmic cubic show that the discriminant in z cannot be a square by comparing its degree-four and degree-two terms. These computations give irreducible surfaces with dense irreducible-character loci. The image contains those loci and is closed by properness, so it contains each full ordinary fiber.

Compare the four-logarithmic specialization with I13 Theorem 2.2 and IIS06 Theorem 4.10, retaining the exact stability, degree, residue and determinant hypotheses of §4.3. Use I13 Proposition 5.3 and §6 to identify the irreducibility and density statements needed for the stronger PVI inverse. Combine them with §4.3 to obtain bimeromorphicity and analytic resolution on the fixed-parameter fibers, including resonance, and the corresponding total-family comparison. IS12 Theorem 5.1 supplies the inverse comparison in its generic unramified scope. For the remaining admitted profiles and strata, prove properness and surjectivity by the incidence, stability, quotient and density arguments above.

Apply the relative projectivity theorem to the actual incidence space and linearization and prove the analytic stable-quotient comparison. Identify its analytic base change on every time and additive exponent chart with the actual ordinary RH map. Prove properness on the full parameter family and its determinant-relative version, with analytic base-change laws. Prove full-target surjectivity using irreducible realization, finiteness of the reducible coarse locus in the unramified profiles, and closedness of the image. Recover the four-logarithmic family theorem and its stronger fiberwise comparison with the PVI resolution.

**Checks.**

- On a logarithmically resonant exponent fiber, the nonresonant inverse locus is empty. Check that the projective comparison on the chart still covers the entire fiber.
- At a logarithmic pole, scalar monodromy permits the full projective line of local incidence flags. A nontrivial Jordan matrix with the same eigenvalues permits one line.
- Check a stable connection with split meromorphic data in the PV profile. On 𝒪 ⊕ 𝒪(−∞) use d + [[a,0],[b,−a]] dz/[z(z−1)], with b=−tz+t−η and 2a=zb−z+1 for t≠0 and η∉ℤ. The two invariant saturated lines generated meromorphically by e₂ and ze₁+e₂ each have degree −1. For weights in (0,1/8) the connection is stable, so retain its image in the decorated quotient.
- The index 2·4−2·2−2=2 in the comparison with I13 is positive. Verify the degree/residue equation, the generic weights and the retained exponent fiber product separately.
- Check the projective model for a varying determinant on local determinant frames. The Cartesian comparison used to restrict to a fixed determinant is the coarse restriction of §4.3.

*Needs:* Internal: 1.2, 1.3, 3.3, 4.1, 4.2, 4.3; [Native topological properness](#supplier-proper) (IsProperMap); [Reductive GIT](#supplier-reductive-git); [Complex analytic spaces and analytification](#supplier-analytic-spaces) (ComplexComparisonPartII §§C−1.1–C−1.2).

#### Examples

An exceptional RH fiber can be a projective curve. A chosen point on it is still an initial condition and has its own horizontal lift; taking an arbitrary inverse of the coarse RH map would discard this information. A trivial-bundle chart may fail the strong Riemann–Hilbert problem at an isolated time even though the full bundle-valued connection continues.

### 4.5 Local holomorphic horizontal sections

Use the holomorphic flat splitting of §§3.9–3.10 and its admitted parameter charts.

A geometric Painlevé germ is a horizontal-section germ of the holomorphic flat splitting of §§3.9–3.10, with specified initial point, in the sense of §0.3. Verify the joint-holomorphic hypotheses on the admitted classical parameter charts and apply §0.3 to obtain the evaluation bijection, local existence and uniqueness, and holomorphic parameter dependence.

Verify the joint-holomorphic family hypotheses and identify geometric Painlevé germs with the imported section germs. Use the general evaluation bijection and naturality on the actual classical fibers.

**Checks.**

- On π: B × F → B with the product splitting, a horizontal section is b ↦ (b,x₀), not an arbitrary map B → F.
- A section must satisfy dπ ∘ ds = id; a constant map into the total space is not a section over a nonconstant time neighborhood.
- For the holomorphic vector field q′ = q² with q(0) = 1, the local solution is 1/(1 − t); local existence does not imply continuation in the affine phase chart through t = 1.

*Needs:* Internal: 3.9, 3.10, 0.3.

### 4.6 Complete strong isomonodromic transport

Use the strong isomonodromic splitting and its uniqueness from §§3.9–3.10, the local reconstruction of §4.1, and transport of decorated Betti data from §§4.2–4.3. For the proper-semiconjugacy comparison use the proper RH map of §4.4.

For every allowed fixed exponent θ, every initial point x₀ in the fiber over b₀, and every compact piecewise C¹ path in Bθ starting at b₀, construct a unique horizontal lift on the whole path. Transport the marking and the fixed decorated monodromy and Stokes data of x₀, including the logarithmic incidences. Reconstruct the connection over each time chart with the prescribed varying irregular coefficients. In the absence of a totally ramified pole, all rank-one subobjects have constant lifted residues, flag intersections and length-weighted parabolic degrees, so stability is preserved by §4.3. With a totally ramified pole the connection stays irreducible. Glue the reconstructions by full faithfulness on overlaps.

Prove that the glued analytic family has a strong total integrable connection. At logarithmic points move the actual flagged model in the moving polar coordinate, with regular time part preserving the flag. At unramified irregular points use the total differentials of the exponential polynomials at fixed residues. At a totally ramified point integrate the odd irregular form on w²=z and verify descent after undoing the shearing. In the basis (1,w), if q₁ is the odd exponential primitive on the cover, the off-diagonal time part is d_time(q₁/w) times the matrix [[0,z],[1,0]]. Check the space pole bound m, time pole bound m−1, invariance of the kernel lattice and the determinant residue correction ½. Use the horizontality of the fixed sectorial transitions for the total model. Restrict the reconstructed family to dual-number time directions and identify its derivative with the existing splitting by uniqueness of the strong extension. This proves the geometric Painlevé property for the given splitting. (I23, Definition 10.1 and Proposition 10.7.)

Compare with IIS06 Theorem 5.12 for the four-logarithmic family and IS12 §6 and Theorem 6.3 in its generic unramified scope. For all admitted profiles and strata construct the lift by the fixed decorated-data reconstruction and strong-extension comparison above.

Also apply §0.4 to the proper RH map of §4.4, the ordinary transport of §4.2 and the all-point compatibility of §4.3. Identify its lift with the reconstructed one by local uniqueness, including initial points in exceptional fibers.

Construct the full horizontal lift from fixed decorated Betti data, verify stability and the strong total pole and lattice conditions, and identify it with the given splitting. Derive the same lift from proper semiconjugacy and prove agreement through every allowed initial point.

**Checks.**

- At a resonant logarithmic pole retain the incidence flag during reconstruction and verify the moving-coordinate total connection preserves its kernel lattice.
- In the totally ramified model the time part displayed above preserves z𝒪e₀ ⊕ 𝒪e₁. Its space part has determinant residue 2c+½ when c is the common residue before undoing the shearing.
- For an initial point in an exceptional fiber, compare both lifts through that specified point. Properness of RH and local uniqueness suffice for the semiconjugacy argument even when the phase projection is nonproper.

*Needs:* Internal: 0.4, 3.9, 3.10, 4.1, 4.2, 4.3, 4.4, 4.5.

### 4.7 Classical transport, universal-cover sections and descent

Use the complete flat classical connection and its symplectic-preservation identity.

Apply §0.5 to the flatness of §3.10 and completeness of §4.6. Its construction produces the actual endpoint transport, fundamental-groupoid action and universal-cover horizontal section through every classical initial point. Identify its endpoint maps with horizontal lifting for the connection of §3.9. Use §3.11 and §0.6 for symplectic preservation. Descend precisely for initial points fixed by the resulting deck/monodromy action; completeness alone does not imply single-valuedness on Bθ.

Identify the imported transport and universal-cover sections on the classical moduli family. Verify presentation compatibility and the actual stabilizer condition for descent.

**Checks.**

- A path followed by its reversal gives the identity on every initial condition, including exceptional points.
- On B = ℂ× with H = qp/(2t), the equations are q′ = q/(2t), p′ = −p/(2t). A positive generator of π₁(B) sends (q,p) to (−q,−p), and two such loops give the identity. The symplectic multiplier is (−1)(−1) = 1, and the first loop acts nontrivially away from the origin.
- In that model only the origin is fixed by the generator. Every other initial point gives a complete section on the universal cover that does not descend to B; completeness alone is insufficient for descent.

*Needs:* Internal: 3.10, 3.11, 4.6, 0.5, 0.6.

### 4.8 Observations on Painlevé phase spaces

Use the classical phase family, a candidate observation Q with its declared domain, and the class of horizontal sections on which evaluation is claimed. For each such section, supply one of the admissibility certificates below; a non-identically-infinite certificate is additionally required for scalar meromorphic evaluation.

For a candidate observation with the supplied admissibility data, apply the observable construction of §0.7. The admissibility certificate is an actual holomorphic ℙ¹-valued map on a neighborhood of the section image; or compatible local numerator–denominator presentations whose restrictions are not both identically zero; or a specified resolution, holomorphic observation and holomorphic lift, with independence proved on the claimed domain or the lift retained as marking. From these data construct the admissible evaluation, using one-variable cancellation or the specified lift as appropriate, and prove the required overlap comparisons. Retain the observer, its domain, solution strata and normalization as part of the specified evaluation data. A certificate excluding an identically infinite evaluation is separate from admissibility as an ℙ¹-valued observation.

Each concrete observation target supplies its candidate and proves these input conditions on every solution stratum for which it claims evaluation. For the classical profiles, §7.2 constructs the standard q candidates, their domains and overlaps, and the certificates for cancellation or lifting, choice independence, non-infinity and coverage. These certificates are the inputs to the evaluation construction above.

From a candidate observation and its supplied admissibility certificates, construct the marked observation and evaluation of §0.7 on exactly the declared sections and domains. Compare normalizations, local ratios and resolved lifts through the general observable naturality law, retaining any marking required for independence. Export the separate non-infinity hypothesis consumed by §4.9.

**Checks.**

- Q ≡ ∞ is an everywhere defined ℙ¹-valued observer, but it does not produce an ordinary meromorphic function with isolated poles.
- The rational map [x:y] on ℂ² is undefined on the constant curve (0,0); rationality alone does not define a pullback along every solution.
- In the infinity chart, Q(t) = 1/t becomes 1/Q(t) = t, holomorphic at 0. Its pole is a chart event, not a failure of geometric continuation.

*Needs:* Internal: 4.5, 4.7, 0.7.

### 4.9 Meromorphic evaluation on the classical time curve

Use the proved time-curve dimension, the complete horizontal section and an observer with the verified pullback and non-infinity conditions.

Verify the one-dimensional time conclusion of §3.4 and apply §0.7 to §§4.7–4.8. Every claimed non-identically-infinite scalar evaluation is meromorphic on the universal cover of the admitted time curve, with finite-order poles at its interior scalar singularities. The observer, its resolution or cancellation and choice-independence certificates on every claimed stratum, and the non-infinity certificate are supplied by the corresponding concrete observation target as inputs to §4.8; §7.2 supplies them for the standard classical q. Under these conditions, apply the same meromorphic evaluation theorem to each observation. Single-valued descent is governed by the scalar observation-invariance criterion of §0.7.

Export the meromorphic evaluation theorem only on the verified classical observer domains.

**Checks.**

- For q′=q² and q(0)=1, q(t)=1/(1−t) has a simple pole at 1 while its projective evaluation is holomorphic.
- On the logarithmic time plane s↦exp(s/2) is holomorphic and changes sign under s↦s+2πi. Its square descends to the punctured time plane.
- An observation identically equal to ∞ on a horizontal section is projective-valued. Check the non-infinity certificate before exporting an ordinary meromorphic scalar.

*Needs:* Internal: 3.4, 4.7, 4.8, 0.7.

### Examples

The affine equation q′ = q² has a movable pole at t = 1 for q(0) = 1. Its projective vector field extends in u = 1/q as u′ = −1. This separates affine-coordinate escape from geometric continuation. On B = ℂ*, a horizontal system can have complete continuation on the universal cover and nontrivial monodromy around 0; this does not contradict the theorem.

## Layer 5: Initial-condition surfaces, symmetries and Riccati reductions

### Dependencies

Use the relative Picard and surface contracts, and use the phase comparison in §5.2 for the PVI applications of the intrinsic pair results.

### 5.1 Additive Okamoto–Painlevé pairs

Use a smooth rational projective surface with effective anticanonical divisor Y, simple normal-crossing support, and Y·Y_i=0 for every component. Require the additive identity component of Pic⁰(Y) and the nonfibered condition below.

Define the comparison groupoid of smooth projective rational surfaces S with a nonzero effective anticanonical divisor Y, satisfying Y·Yᵢ = 0 for every irreducible component, with D = Y_red a simple normal-crossing divisor. Require additive type, expressed by the additive identity component of Pic⁰(Y), and nonfibered type: no elliptic fibration has a fiber nY with n ≥ 1. Retain markings when a root basis or normalized time is used. Construct the relative versions of these conditions. (STT02, Definitions 1.1 and 1.3, Proposition 1.2 and Tables 2–3.)

Write Y = Σᵢ mᵢDᵢ. Fix the intersection pairing x·y on Pic(S), and use ⟨x,y⟩ = −x·y for root lengths. Define the boundary lattice R_∂ = Σᵢ ℤ[Dᵢ], its integral orthogonal complement R_∂^⊥ = {x ∈ Pic(S) : x·[Dᵢ] = 0 for every i}, and δ = [Y] = −K_S. Prove δ ∈ R_∂ ∩ R_∂^⊥ and δ·δ = 0. Retain these as sublattices of Pic(S), with δ present; no quotient by ℤδ is taken. Construct their marked relative versions and intersection-preserving transport. The symmetry roots, their integral span inside R_∂^⊥, and their parameter hyperplanes are the outputs of §5.5.

Construct R_∂, R_∂^⊥ and δ inside Pic(S), their pairings with the declared sign, and the weighted boundary intersection graph. Prove invariance under pair isomorphisms and compatibility with admissible families. Compare the complement S ∖ D with its logarithmic tangent and two-form sheaves. Supply the inclusion R_∂^⊥ → Pic(S) and its marked-family comparisons to §5.5; the construction of a symmetry-root basis belongs to that target.

**Checks.**

- A smooth elliptic anticanonical boundary has elliptic Picard identity component, not additive, and is excluded.
- A multiplicative cycle has multiplicative Picard identity component and is excluded.
- Requiring a global affine-plane chart would exclude the D₈ case; that additional requirement is absent.
- A boundary component of self-intersection −2 has squared root length 2, whereas δ has square zero and remains a nonzero Picard class. R_∂^⊥ is defined by all boundary components, not only by orthogonality to K_S.

For the possibly nonreduced anticanonical Y, verify projectivity, flatness and finite presentation for the admitted family and prove the universal-functions condition. Apply the supplied relative Picard space and identity-component criterion with the affine H² vanishing and dimension calculation of §1.5. Compute the identity component with normalization, units and successive nilpotent-thickening exact sequences, and prove the additive-group comparison defining additive type. Construct Θ(−log D) as derivations preserving the reduced-boundary ideal, with D=Yred SNC; multiplicities belong to Y, not to the SNC predicate. Prove the relative Picard lattice/intersection and deformation comparisons on the actual surface family. SchemeAndStackFoundations §5.9 supplies intersection pairings for surfaces over fields or arithmetic surfaces. Construct the family comparison over the admitted bases using these pairings and the supplied relative Picard space.

*Needs:* Internal: 1.5; [Relative Picard spaces and identity components](#supplier-relative-picard) (ComplexComparisonPartII §C3.2d.2–§C3.2d.3 and §C3.2f.1–§C3.2f.2); [Cohomology with supports](#supplier-supports) (2.7); [Divisors, modifications and surface intersections](#supplier-surfaces) (3.4; 4.11; 4.17; 5.9–5.10); [Algebraic vector bundles and finite locally free sheaves](#supplier-bundles) (L0A–L0C; L1A–L1B; L2A–L2B).

### 5.2 PVI compactification and the boundary classification

For the four-logarithmic PVI phase family use the weights, determinant and markings of IIS Part II, Theorem 4.1. Construct the relative compactification by stable parabolic φ-connections and identify it with the relative blowup surface S over the time and exponent base. Compare the relative anticanonical divisor Y, including multiplicities, with the vanishing of det φ. Write D for its reduced support. Identify the full stable phase family with U = S ∖ D and compare the relative symplectic form and horizontal splitting on U, including the exceptional and bundle-jumping charts. Use IIS06 §§5 and 10 for the flow and coordinate comparisons. Construct the relative rational two-form on S whose divisor on each fiber is −Y and identify its restriction to U with the phase form.

Classify the eight affine boundary diagrams of additive pairs in §5.1 using STT02, Proposition 1.2 and Tables 2–3. Global identifications of the other connection families with relative compactification complements are outside this target. Their displayed local connection charts are compared in §7.2.

**Checks.**

- Verify the four logarithmic poles, degree −1 determinant and the weight inequalities in IIS Part II, Theorem 4.1.
- Compare the complement of det φ = 0 with the stable connection family, including the PVI exceptional curves.
- Check the pole multiplicities of the rational two-form against Y, including components of multiplicity greater than one.

*Needs:* Internal: 3.3, 3.4, 3.5, 3.6, 3.7, 3.8, 3.9, 3.10, 3.11, 3.12, 5.1; [Cohomology with supports](#supplier-supports) (2.7); [Divisors, modifications and surface intersections](#supplier-surfaces) (3.4; 4.11; 4.17; 5.9–5.10); [Quot/Hilbert and parameter schemes](#supplier-quot) (4.14).

### 5.3 The boundary deformation space and time direction

Use the nonfibered additive pair families of §5.1. The comparison with the connection-moduli time direction uses the PVI identification of §5.2.

Let F = Θ_S(−log D) and N_D = O_S(D)/O_S. Construct L = H⁰(D,F ⊗ N_D), prove that it is one-dimensional for these pairs, and construct its injection into local cohomology. Establish the family/base-change theorem for L and, on the PVI comparison family of §5.2, identify its Kodaira–Spencer image with the time direction of §3.9. Prove the connecting-map/intersection-matrix identity intrinsically from the boundary intersection pairing, uniformly for the admitted boundary graphs. (TER02, Theorem 2.1 and Proposition 2.1; STT02, Theorem 3.1.)

The first boundary-layer construction supplies a line and its injection into the full supported-cohomology space. TER02 Conjecture 2.1 concerns equality with that space; the results of ST04 Appendix A apply under their stated additional hypotheses. A generator of the line depends on a choice of time normalization. Prove equality of the lifted distributions by the deformation comparison and uniqueness on the prescribed algebraic complement.

Construct the first boundary-layer line, its injection into supported cohomology and its restriction maps. Prove the intersection-matrix formula and the dimension calculation without choosing a scalar Painlevé chart. Establish locally free base change and the comparison of its Kodaira–Spencer image with the time tangent line.

**Checks.**

- Rescaling a chosen nonzero time vector rescales its image in L, while L itself is unchanged.
- The injection L → H¹_D(S,F) alone does not prove that its target is one-dimensional.
- Over A = ℂ[ε]/(ε²), the module A/(ε) has a one-dimensional fiber at the unique point but is not a free rank-one A-module: its ℂ-length is 1 instead of 2. Constant fiber dimension alone therefore does not establish the claimed locally free base change; the actual cohomological hypotheses must be proved.

Use SchemeAndStackFoundations 2.6 and 2.7 for quasi-coherent and supported cohomology, the localization exact sequence, and the Noetherian colimit-of-Ext comparison. Use JacobianChallenge Layer C for coherent proper pushforwards and its separately stated base-change criteria. For the family of logarithmic surfaces, construct F and N_D as sheaves, the first boundary-layer injection and its connecting-map/intersection-matrix comparison. Prove the properness, coefficient flatness and cohomology/base-change hypotheses that make the relative H0(D,F tensor N_D) invertible, and prove arbitrary base-change compatibility through the finite-projective complex or the precise surjectivity criterion, including over nonreduced bases. Compare this line with the Kodaira–Spencer time line through its injection into supported H1_D.

*Needs:* Internal: 3.9, 3.10, 3.11, 3.12, 5.1, 5.2; [Cohomology with supports](#supplier-supports) (2.7); [Divisors, modifications and surface intersections](#supplier-surfaces) (3.4; 4.11; 4.17; 5.9–5.10); [Cohomology, duality and curve degree](#supplier-cohomology) (2.2; 2.6; 2.20; 3.3); [Elementary deformation theory](#supplier-deformation) (4.2–4.6); [Proper coherent direct images and base change](#supplier-proper-cohomology) (Layer C).

#### Examples

The boundary type E₈ is associated with one ramified rank-two presentation, while E₇ has two. Thus a boundary label and a connection presentation are different kinds of data. The first boundary-layer line has dimension 1 and maps injectively into the supported cohomology group as specified in §5.3.

### 5.4 Functors on decorated connections

Use an admitted decorated connection, together with an invariant local quotient for a modification or the specified line connection, duality or relabeling data.

Construct elementary modifications along an invariant local flag, tensor product with an admitted rank-one connection, duality and relabeling as functors between the actual decorated moduli problems. Specify the new determinant, exponent and stability data and the locus on which the transformed object is stable. Use the kernel construction for a modification, its induced connection, and the inverse modification; retain the comparison arrows. Extend these functors to strong integrable families by preservation of the allowed pole filtration and kernel lattices. (IIS06, Definition 3.5 and §7; I23, §§2–4 and Definition 10.1.)

For each operation g, construct its parameter-and-time map φ_g and the saturated stable domains 𝔘_g and 𝔘′_g on which the operation and its inverse have the required decorated types. Construct F_g: 𝔘_g → 𝔘′_g over φ_g, its inverse functor and the two natural inverse comparisons. For the coarse maps p_g: 𝔘_g → U_g and p′_g: 𝔘′_g → U′_g, construct the induced map F̄_g: U_g → U′_g and prove p′_g ∘ F_g ≃ F̄_g ∘ p_g by the coarse universal property, compatibly with pullback. For an asserted birational correspondence of the ambient coarse spaces, specify dense open subsets V_g and V′_g and prove that the restricted maps are mutual inverses. The horizontal and symplectic laws belong to §5.5; §7.4 compares the resulting coarse map with formulas in the charts of §7.2.

Construct the transformed bundle and connection before passing to coarse moduli, with their determinant and local-type formulas. Prove pullback, composition and inverse comparisons on their specified domains. Specify the transformed weights and prove the stability comparison, using a wall-crossing correspondence on the loci where it is required. Construct F̄_g and the commuting coarse-moduli diagram over φ_g; for each birational claim exhibit the dense inverse opens and their inverse laws. Supply this geometric map and its domain to the coordinate comparison in §7.4.

**Checks.**

- Modifying along a one-dimensional quotient at a logarithmic pole changes the bundle degree by −1; leaving the determinant unchanged fails the determinant comparison.
- Tensoring rank two by a line connection L changes the determinant by L², including its connection; it does not construct a square root of a previously fixed odd-degree determinant.
- The inverse modification recovers the original decorated object with its arrow on the common admissible locus, while forgetting the distinguished flag need not permit the inverse.
- The image of an object under F_g and under the induced coarse map must agree after applying p′_g. A coordinate formula alone does not discharge this descent diagram or the two inverse comparisons.

*Needs:* Internal: 3.1, 3.5, 3.9, 1.1; [Algebraic vector bundles and finite locally free sheaves](#supplier-bundles) (L0A–L0C; L1A–L1B; L2A–L2B).

### 5.5 Horizontal and symplectic transformation laws

Use the connection functors and descended maps of §5.4, the deformation pairing and intrinsic splitting of targets 3.5–3.12, the lattices of §5.1, and the marked-surface comparison of §5.2.

For F̄_g over φ_g, prove dF̄_g ∘ h = h′ ∘ dφ_g on the relative time tangent bundles by applying the uniqueness of strong extensions to the transformed family. Compute F̄_g⁎ω′ by the induced map of deformation complexes and trace pairing, and prove F̄_g⁎ω′ = ω for each symplectic generator on its stated domain. Construct the resulting action groupoid on the parameterized moduli family, and establish relations by natural isomorphisms of the functors. On a marked surface compare its action on Pic(S) with the corresponding integral root reflections and diagram automorphisms. For each profile, construct the symmetry simple-root classes in the integral lattice R_∂^⊥ of §5.1, their span R_sym, their Cartan pairings and the associated parameter hyperplanes; identify explicitly when R_sym equals R_∂^⊥. Use the pairing ⟨x,y⟩ = −x·y and prove integrality of the reflection x ↦ x − 2⟨x,α⟩α/⟨α,α⟩ for each root α used. Retain δ in the lattice action, and specify an empty root system for a profile with no reflection roots. (IIS06, Theorem 7.4 and Theorem 10.13 for PVI; STT02, Tables 2–3 and the marked deformation construction.)

Construct the symmetry action from the functors of §5.4 together with additional reflections on the moduli of marked pairs. For PVI use §5.2 to transfer the marked-pair correspondences to the full connection family and compare the horizontal and symplectic structures. For other types use the actual domains of the connection functors and the explicit local chart comparisons of §7.2 as downstream checks. These marked-pair reflections include the central PVI reflection, which is not generated by the local gauge modifications of §5.4. IIS06 Remark 7.5(2) describes a Fourier-transform realization; a realization by Fourier–Laplace transformation or middle convolution requires a functor on the decorated moduli problems and its strong-extension comparison. Use the marked-surface construction for the additional reflections here. The cited theorems of IIS06 concern PVI; state the domain and check each local comparison before transferring a marked-pair identity to a connection chart. Prove the reflection and Coxeter relations, effective-locus conditions and extension across chart complements, and supply these results to the coordinate comparisons in §7.4. For every global automorphism, prove regular extension over its full stated domain in addition to the identity of rational maps on a dense open set.

Construct the profile-specific symmetry root data in R_∂^⊥, the marked-pair reflection correspondences and their comparison with the descended connection-functor generators on their common domains. Prove the horizontal identity over φ_g, the relative two-form identity, relations and compatibility with parameter changes; deduce that the induced maps send horizontal solutions to horizontal solutions. Record the regular domain and the extension theorem for each claimed global map.

**Checks.**

- The PVI central reflection sends κ₀ to −κ₀ and κⱼ to κⱼ + κ₀ for j = 1,2,3,4. It preserves 2κ₀ + Σκⱼ = 1: at κ₀ = 1/2, κⱼ = 0 the transformed tuple has κ₀ = −1/2 and κⱼ = 1/2, giving −1 + 2 = 1. Omitting the κ₀ sign change gives 3 instead. Local integer shifts and sign changes alone do not construct this reflection.
- A reflection squared must give the original marked family with its comparison arrow, not merely the same boundary diagram.
- A birational formula with a pole on an invariant curve is not an automorphism of that curve until a regular extension is proved.

*Needs:* Internal: 3.6, 3.7, 3.12, 5.1, 5.2, 5.3, 5.4; [Cohomology with supports](#supplier-supports) (2.7); [Divisors, modifications and surface intersections](#supplier-surfaces) (3.4; 4.11; 4.17; 5.9–5.10).

### 5.6 Invariant rational curves and Riccati dynamics

Use an interior smooth rational curve of self-intersection −2 in an admitted nonfibered additive pair, its stated semiuniversal pair deformation, and the time-direction comparison of §5.3.

For the admitted nonfibered additive pair, construct the local family of an interior smooth rational curve C with C² = −2. Fix the external parameters at α₀ and, for the curve C in the fiber over (α₀,t₀), construct its family locally along the time base {α₀}×U, with U an analytic or étale neighborhood of t₀; an extension in external-parameter directions is defined on a nodal-curve locus whose existence and comparison with the semiuniversal pair deformation must be proved. Prove invariance under the time distribution using the logarithmic deformation sequence. Retain the étale or finite base change needed to continue that family; descent to the original base requires its own monodromy check. On the resulting relative ℙ¹-bundle, identify the restricted connection as a projective linear connection, using H⁰(ℙ¹,Tℙ¹) ≅ sl₂. The coordinate lemma then has q′ = a(t)q² + b(t)q + c(t). Construct local linear rank-two lifts, and construct a global lift when its lifting obstruction vanishes. (ST04, §2.4, Proposition 2.1, Remark 2.4 and Definition 2.3.) The connection-moduli comparison through §5.2 is for PVI. The PVI comparison with the Gauss equation is IIS06 Theorem 5.15. Its Theorem 5.16 assumes analytic Painlevé property; the geometric construction here follows from the logarithmic deformation sequence and time-direction comparison.

Classify these interior nodal configurations by the boundary intersection lattice under ST04 Theorem 3.1's hypotheses. Deduce its nonexistence statement for the E₈, D₇ and D₈ boundary types. Linearization gives the relevant classical special-function families after the coordinate comparisons; the parameter restrictions and normalizations remain part of those lemmas.

Construct restriction of h to the invariant curve family and prove that its projection to time remains a splitting. Compare two projective coordinates by the induced Möbius gauge law, and compare local rank-two linearizations. Prove preservation under the admitted geometric transformations when they extend as regular isomorphisms along the whole curve family; otherwise construct the closure and prove the required curve and invariance properties separately. Compare the nodal-curve condition with reducible connections or exceptional RH fibers via the PVI comparison of §5.2.

**Checks.**

- A holomorphic vertical vector field on ℙ¹ has a polynomial coefficient of degree at most two in an affine coordinate; a cubic coefficient fails regularity at infinity.
- A ramified generic local factor forces global irreducibility, but an E₇ ramified presentation can still have an invariant Riccati curve. Thus “Riccati if and only if globally reducible connection” is not a presentation-independent theorem.
- A family of curves can be permuted by continuation around the time base; a local invariant curve does not automatically give a globally labeled subfamily.
- A rational solution need not lie on a Riccati curve; ST04 §6.2 supplies this distinction. The classification above concerns interior nodal curves and their invariant Riccati dynamics.

*Needs:* Internal: 3.9, 3.10, 3.11, 3.12, 5.1, 5.2, 5.3, 5.4, 5.5; [Cohomology with supports](#supplier-supports) (2.7); [Divisors, modifications and surface intersections](#supplier-surfaces) (3.4; 4.11; 4.17; 5.9–5.10); [Quot/Hilbert and parameter schemes](#supplier-quot) (4.14); [Complex manifolds, holomorphic bundles and observations](#supplier-complex) (K1; K3.0; K3.HolomorphicStalk; K3.MeromorphicGermField; K4; K7.1).

### Examples

In the PII chart of §7.5 the curve p = 0 is invariant at α = −1/2. Its Riccati equation is the coordinate expression of a projective connection on that curve. The rational seed q = 0 at α = 0 lies at a different parameter value and is treated by the seed and transformation constructions of §7.5.

## Layer 6: Determinant lines and tau sections

### Dependencies

Use the Fredholm, inversion, trace and Toeplitz contracts. Apply them to the marked families of Layers 3–4 with the specified determinant and index comparisons.

Construct the holomorphic determinant line and canonical section for general index-zero Fredholm families in §6.1, then apply this construction to the marked Painlevé RHP families in §§6.2–6.5. For these families construct the operator realization, prove its index and holomorphic dependence, and establish the line/frame comparisons and the stated JMU/Hamiltonian identities. For a trace-class realization with its determinant comparison, use the generic trace-class determinant of RandomMatrices §8.3.

Bibliographic information and source locators are listed in the [references](#references). The construction models are MAL04 and BERT17. The JMU comparison uses BERT10 with the corrections in BERT16 at the precise loci stated below. Real orientation lines, Toeplitz index results and trace-class determinants retain their distinct scopes.

### 6.1 Holomorphic determinant lines for index-zero Fredholm families

Use finite-dimensional determinant and exact-sequence conventions, bounded local splittings and holomorphic Banach-space inversion.

For a holomorphic family T_s: H₀ → H₁ of bounded complex Fredholm operators of index zero on a finite-dimensional complex manifold S, with H₀,H₁ fixed complex Hilbert spaces, construct a holomorphic line L_T and its canonical determinant section τ_T. Use the complex specialization of the native Fredholm, determinant-line and finite-dimensional stabilization objects to construct its holomorphic atlas and coherent gluing. Adopt the convention L_T,s = det(ker T_s)* ⊗ det(coker T_s), dual to the real orientation-line convention. Include families in which the dimensions of kernel and cokernel jump. (MAL04, §2, printed pp. 1372–1374, gives the determinant-extension model; BERT17, §1, gives an RHP application within its stated symbol class.)

Locally choose a finite-dimensional complex space F and a: F → H₁ such that (T_s,a): H₀ ⊕ F → H₁ is surjective. Prove that K = ker(T,a) is a holomorphic vector bundle of rank dim F, using a local bounded splitting and holomorphic inversion. Set L_F = det K* ⊗ det F and τ_F = det(K → F), where K → F is the projection. Construct comparison maps under adding stabilizing summands and then through common refinements; prove their cocycle and section-compatibility laws before gluing. Fix the exact-sequence sign convention by requiring that a finite-dimensional family has its ordinary determinant in the standard determinant frame. Prove independence of all stabilization choices, holomorphic base change and naturality under isomorphisms of operator families. Use these same comparison laws to extend from fixed Hilbert spaces to holomorphic Hilbert bundles with specified local trivializations.

Identify τ_T(s) ≠ 0 exactly with invertibility of T_s. Include identically singular families, for which τ_T vanishes identically. An effective determinant divisor requires τ_T to be nonzero as a section on each connected component. Construct the line's transition cocycle from the stabilization comparisons; closedness of a proposed curvature two-form alone does not supply this cocycle. Applications use the pullback line and section and prove their RHP realizations and logarithmic-derivative formulas. The base category consists of finite-dimensional complex manifolds and holomorphic maps. Nonreduced analytic bases lie outside this construction: their operator families must retain nilpotent coefficients as sheaf-valued data, which pointwise operators do not determine.

Construct the stabilization kernel bundles, determinant lines and canonical sections with the declared dual convention and finite-dimensional sign calibration. Prove refinement compatibility, the cocycle law, stabilization independence and holomorphic base change. Prove naturality under operator-family isomorphisms and glue the Hilbert-bundle version through its specified trivializations. Identify the section’s nonvanishing locus with the invertible-operator locus without assuming generic nonvanishing or a divisor.

**Checks.**

- For T_s: ℂ → ℂ, z ↦ sz, the standard frames give τ(s) = s, fixing the dual convention.
- For T_s(z) = s²z, verify that the zero has order two while dim ker T₀ = 1. Thus vanishing order and kernel dimension can differ.
- An everywhere invertible constant family has a nonvanishing determinant section. For an identically singular index-zero family, construct its holomorphic determinant line and verify that its canonical section is identically zero.
- Two finite-dimensional stabilizations must give the same section after comparison through a common refinement, and a third stabilization must not change that comparison.

- On the dual-number base, T=ε and T=0 have the same pointwise operator but determinant sections ε and 0. The distinction requires nilpotent operator coefficients on this nonreduced base, which lies outside the manifold-base category.

Consume Mathlib's complex ContinuousLinearMap.IsFredholm and nonempty_fredholmPackage, Tau Ceti's IsFredholm.exists_stabilization_kernel_coordinates, kernelHomeomorph and contDiffAt_kerSection, and the pointwise detLine/detLineCongr API. The latter has fibre det ker(T) tensor det coker(T)*; use its dual for L_T. These scalar-generic suppliers apply over C. This target constructs the holomorphic determinant bundle, its canonical section, stabilization comparisons and holomorphic base-change laws. For the holomorphic transition maps use native analytic inversion in the bounded-operator Banach algebra and the actual finite-dimensional stabilization charts.

*Needs:* [Native complex Fredholm and determinant carriers](#supplier-fredholm) (IsFredholm; nonempty_fredholmPackage; exists_stabilization_kernel_coordinates; kernelHomeomorph; contDiffAt_kerSection; detLine; detLineCongr); [Native analytic inversion](#supplier-inversion) (analyticAt_inverse; analyticAt_inverse_one_sub); [Complex manifolds, holomorphic bundles and observations](#supplier-complex) (K1; K3.0; K3.HolomorphicStalk; K3.MeromorphicGermField; K4; K7.1).

### 6.2 Determinant lines for Painlevé families

Use the holomorphic complex index-zero determinant construction of §6.1 and its operator-family isomorphism and base-change laws.

Specify the determinant construction for a marked Painlevé operator family using §6.1's holomorphic complex index-zero determinant line, canonical section, finite-dimensional stabilizations and coherent comparison maps. Set L_T = det(ker T)* ⊗ det(coker T) on the same native complex operator carriers. The required input consists of a holomorphic index-zero operator family and the comparison maps satisfying §6.1's identity, composition and section-compatibility laws. Section 6.3 constructs these families and comparisons from the marked connection data. The line and section in this application are the pullbacks of §6.1's objects with this dual convention.

Specify the dual convention and the pullback identifications with §6.1's line and section. Specify the holomorphic index-zero, comparison-cocycle and descent conditions for the families constructed in §6.3.

**Checks.**

- On a marked Painlevé chart with invertible RHP operator compare its canonical section with the pullback of the nonzero section in §6.1.
- At a point of the PVI bundle-jump locus compare the vanishing test in the two marked RHP presentations using the comparison furnished by §6.3.
- Compare the pullback lines and sections when a ramified presentation changes its sheet marking.

*Needs:* Internal: 6.1.

### 6.3 An index-zero RHP realization and descent

Use the decorated connection families of §§3.1, 3.5, 3.6 and 3.9, the local analytic reconstruction and comparison of §§4.1–4.3, the time bases of §1.2, and the determinant interface of §6.2. Include the selected auxiliary reference/modification, contours, lattices, branches and normalization. Construct the Fredholm realization and index-zero proof in this target. The descent comparisons are operator, chain or stable equivalences whose added auxiliary complexes are everywhere acyclic.

Construct an analytic RHP chart from the specified decorated connection family and the analytic comparison of §§4.1–4.3. Retain the reference bundle or modification, contours, local lattices, branches, framings and normalization in its marking data. Construct the associated Fredholm operator and prove its index zero and holomorphic dependence. For the closed-contour model use a holomorphic invertible jump symbol in a fixed contour neighborhood and zero determinant winding. Compare the solvable normalized RHP with the corresponding marked connection and pull back §6.2's line and section. For every ramified and resonant stratum retained by §§3.1–3.3, construct an analytic sectorial model and its adapter, and prove the operator, solvability and determinant comparisons. The cited closed-contour constructions supply the initial operator model; this target constructs its sectorial, ramified and resonant comparisons. (BERT17, §1 and Theorem 2.2; MAL04, §2.)

On ℙ¹, rank E = 2 and deg E = d give χ(E(−1)) = d and χ(E(k)) = d + 2k + 2. For odd d, every common integral line twist has nonzero Euler characteristic; in particular, E(−1) has index −1 for a degree-minus-one phase object. Construct a normalized index-zero complex or modification and its comparison with the original connection. When applying Malgrange's degree-zero sewn-bundle construction, include this comparison in the RHP realization.

Keep the reference bundle and auxiliary modification in the input marking. For operator, chain or stable equivalences with everywhere acyclic added auxiliary complexes, construct unit transition factors for the line and section. A general change of reference bundle or modification defines a different normalized problem and can change the zero divisor. Construct its relative determinant factor or meromorphic transformation together with the divisor of that factor. Apply BERT17's factorization comparisons to the admitted factorization equivalences.

Construct RHP marking charts and the operator-family functor from their connection data. Prove comparison isomorphisms for changes of contour, factorization or normalization which give the same Fredholm family or a proved holomorphic chain/stable equivalence, with their identity and composition laws. Construct an equivariant line and section on the marked moduli groupoid/stack. Descend to a coarse space only after proving trivial stabilizer action on the line and section. Construct the analytic adapters for every admitted ramified and resonant stratum, specifying their domains and proving the operator, index-zero, holomorphic-dependence and solvability comparisons.

**Checks.**

- For a valid degree-minus-one phase connection, compute the index of E(−1) as −1 and compare it with the normalized index-zero RHP complex.
- Scalar automorphisms act by the Euler-characteristic weight, which is zero here. Check the action of each other stabilizer in the marked groupoid for the coarse-descent comparison.
- Two elementary jump factorizations can give different scalar Fredholm determinants. Compute their nonzero transition factor and verify the corresponding line-section comparison.

For the initial closed-contour model construct the actual Hardy/Toeplitz comparison and apply T1–T3 to its continuous invertible matrix symbol. Verify zero determinant winding and holomorphic dependence. Prove normalized solvability equivalent to invertibility through the reconstruction map. Zero Fredholm index alone is insufficient for matrix symbols. Sectorial, resonant and ramified models require the separate comparisons specified in this target.

*Needs:* Internal: 3.1, 3.5, 3.6, 3.9, 4.1, 4.2, 4.3, 6.2, 1.2; [Cohomology, duality and curve degree](#supplier-cohomology) (2.2; 2.6; 2.20; 3.3); [Elementary deformation theory](#supplier-deformation) (4.2–4.6); [Stacks, inertia and restricted coarse-space criteria](#supplier-stacks) (1.18–1.23); [Trace-class ideal carrier](#supplier-trace-ideal) (OI-B01–OI-B19; OI-B23; OI-B29–OI-B30); [Matrix-symbol Toeplitz index](#supplier-toeplitz) (T1–T3); [Generic trace-class determinant](#supplier-trace-determinant) (8.3, generic operator-theory prefix).

### 6.4 The tau divisor and variational formulas

Use the determinant section of §6.3, the condition that it is not identically zero on each connected smooth chart where its divisor is constructed, and the generic JMU and vertex-correction hypotheses specified below.

Prove that the determinant section vanishes precisely where its normalized RHP is not solvable. On a reduced connected smooth chart where it is not identically zero, construct its effective Cartier divisor; obtain a global divisor only through the line comparisons. This divisor records failure of the selected RHP normalization and can contain regular intrinsic phase points through which a horizontal solution continues in another chart. On each 6.1 stabilization chart, choose holomorphic frames for the equal-rank bundles K_stab and F and let S(s) represent the projection K_stab→F. The canonical section has representative det S. Prove d log(det S)=Tr(S⁻¹dS) on its nonvanishing locus and the actual logarithmic correction for a change of determinant frame. This gives the determinant-frame form and scalar normalization on every constructed RHP chart, including the ramified and resonant adapters. Equivalently, K_fin=I−S on the finite-dimensional space F gives the displayed trace-class identity. For an infinite-dimensional integrable-kernel realization, construct a trace-norm holomorphic family K and the comparison τ=u det(I−K), with u nowhere zero. On the trace-class locus where I−K is invertible, prove d log τ=d log u−Tr((I−K)⁻¹dK) and the frame-change law. The JMU/Hamiltonian comparison has the generic domain specified below. (BERT17, Theorem 2.2, Proposition 2.3, formula (3.6), Theorem 3.3 and §3.1.2.)

Compare with the JMU form only under the stated formal-normalization hypotheses: the generic unramified diagonalizable-leading-term and logarithmic nonresonance locus of BERT10 Assumption 3.1 and §5.1, Proposition 5.1. Use BERT16 Definition 2.1 for the corrected sign, Theorem 2.1 for vertex curvature, and Theorem 2.2, which replaces BERT10 Theorem 5.1. The corrected local formula uses ω_M − θ_V, with dθ_V = η_V on the monodromy parameters. Along fixed-monodromy time directions θ_V has no component. Match the factorization and frame corrections in this restriction. On the full monodromy-and-time space retain the curvature terms of the Malgrange form and its modifications. Compare a contour graph with a contour without vertices by a sewing map that accounts for the vertex terms.

Construct the section's divisor and its naturality under the comparisons of §6.3. Prove the local variational identity and its change under a nonvanishing frame multiplier. Construct the comparison with the selected JMU normalization on the generic unramified, diagonalizable-leading-term and logarithmically nonresonant locus stated above. On each ramified or resonant stratum use §6.3's RHP adapter to construct the determinant section and its finite-dimensional stabilization differential; the JMU comparison is restricted to the stated generic locus. For the infinite-dimensional trace formula prove the trace-class realization and determinant-frame comparison.

**Checks.**

- A zero of the chosen tau representative can occur while the intrinsic horizontal solution continues through that time in another bundle chart.
- For the family T_s = s², verify a double zero of the determinant section and a one-dimensional kernel at s = 0.
- For a graph with nontrivial vertex limits, compute the BERT16 vertex correction and include its transformation in any sewing comparison with disjoint closed contours.
- The local connection d + [[0,z⁻²],[z⁻¹,0]]dz has projective slope 1/2: after z = w² and the gauge diag(1,w), its leading coefficient is 2(E₁₂ + E₂₁)/w². It is outside the JMU comparison locus here. Its index-zero RHP adapter carries the determinant section and its finite-dimensional stabilization logarithmic derivative on the ramified chart.

- On an infinite-dimensional complex Hilbert space, T_s=e^s I is a holomorphic invertible Fredholm family, but T_s⁻¹dT_s=I ds has no trace-class trace. Its determinant-line section has local finite-dimensional stabilization representatives, while the infinite-dimensional trace expression is undefined.

*Needs:* Internal: 4.1, 6.2, 6.3, 1.2; [Generic trace-class determinant](#supplier-trace-determinant) (8.3, generic operator-theory prefix).

### 6.5 Hamiltonians, frames and scalar normalization

Use JMU/Hamiltonian comparison only on the generic unramified nonresonant locus; broader scalar normalization uses the finite-dimensional stabilization logarithmic form of the constructed canonical RHP determinant section τ_T, a fixed nonvanishing frame e, a regular base point t₀ with τ_T(t₀) ≠ 0, and a chosen scalar value c ∈ ℂ× on the time leaf. An infinite-dimensional trace expression additionally requires the verified trace-class realization and frame comparison.

On the JMU comparison locus of §6.4, choose a time coordinate and symplectic chart for the dynamics of §3.11. Derive the relation between the selected determinant-frame logarithmic derivative and the local Hamiltonian, proving its coefficient and its gauge, factorization and time-only correction terms from §6.4. Specify the Hamiltonian convention and the local primitive, including its ambiguity by a function of time. The Hamiltonian/JMU identity has precisely this generic domain; scalar normalization on the broader RHP-chart domain uses the stabilization logarithmic form below. (MAL04, Theorem 5.12 in its logarithmic Schlesinger scope; BERT10, §5.1, Proposition 5.1, with BERT16.)

For every marked RHP chart of §6.3, including its ramified and resonant charts, write the fixed canonical section as τ_T = f e in the chosen determinant frame. In the stabilization frame of §6.4, f = det S and d log f = Tr(S⁻¹dS) on the nonvanishing locus. For e′ = a e the coefficient is f′ = a⁻¹f, so d log f′ = d log f − d log a. An infinite-dimensional realization f = u det(I−K), with its determinant-frame comparison, gives d log f = d log u − Tr((I−K)⁻¹dK) on the trace-class locus where I−K is invertible. (BERT17, Proposition 2.3 and formula (3.6).)

The coefficient f and its value f(t₀) are fixed by τ_T and e. Define the separately normalized scalar function f_norm = c f/f(t₀), and prove f_norm(t₀) = c, d log f_norm = d log f, and f_norm e = (c/f(t₀))τ_T. Thus choosing a base-point value gives a specified constant multiple of the canonical section, while retaining the original section and frame for comparison. Equivalently the chosen fiber value is c e(t₀); under a frame change transform c as the coefficient of that same fiber value. This normalization applies to the marked RHP charts of §6.3, using the stabilization logarithmic form on the nonvanishing locus.

The differential-equation normalization is along a fixed-monodromy horizontal time leaf, away from the chosen divisor. A prescribed closed scalar logarithmic one-form and a nonzero base-point value determine a unique solution on a connected simply connected domain. Prove its equality with f_norm wherever that one-form equals d log f, and compute the holonomy obstruction to descent when such local solutions are continued around a loop. On a full monodromy-and-time domain, the same scalar normalization theorem requires closedness after the frame corrections. Simple connectedness alone does not remove curvature of a line connection.

On the specified JMU comparison locus, compare the symplectic/time convention of §3.11 with the variational identity and record all correction terms. On the broader RHP-adapter locus use the finite-dimensional stabilization identity with its prescribed determinant frame; use an infinite-dimensional trace formula only after its additional trace-class comparison has been proved. Prove the transformation laws under a time change, a time-dependent symplectic chart change and a determinant-frame change. Construct f_norm = c f/f(t₀), its proportionality comparison with τ_T in the fixed frame, and its base-point and logarithmic-derivative laws. Prove uniqueness for the corresponding scalar differential equation on a connected simply connected regular domain, and identify the holonomy obstruction to descent.

**Checks.**

- If an identity uses d log τ = H dt, replacing H by H + c(t) requires multiplying τ by exp(∫c(t)dt), with the integration constant fixed.
- Under the time change u = φ(t), the same logarithmic one-form has coefficient (dt/du)H; an unchanged scalar coefficient would fail the comparison.
- Two representatives differing by a nonzero constant define the same logarithmic derivative but are different normalized scalar functions until the base-point values agree.
- For T_s(z) = sz in the standard determinant frame, f(s) = s. With s₀ = 1 and c = 2, f_norm(s) = 2s; it is the coefficient of twice the canonical section, while the original canonical coefficient remains s.

*Needs:* Internal: 3.11, 3.12, 6.3, 6.4; [Complex manifolds, holomorphic bundles and observations](#supplier-complex) (K1; K3.0; K3.HolomorphicStalk; K3.MeromorphicGermField; K4; K7.1).

### Examples

Compute the determinant sections, divisor multiplicities and invertibility loci for the one-dimensional operator families s, s² and 1. Compare a valid degree-minus-one phase connection with its auxiliary index-zero RHP complex. For a contour/factorization change, compute the line-section comparison and the transition factor between scalar representatives.

## Layer 7: Classical forms of Painlevé equations

### Dependencies

Use Layers 3–4 and §0.8 for local charts and their continuation. Use Layer 5 for transformations on their proved domains and Layer 6 for the tau comparisons.

### 7.1 First-jet coordinates and scalar Painlevé equations

Use a classical time curve, a phase surface with its nonlinear connection, a local observer and a jet-isomorphism domain. The generic jet theorem assumes neither a symplectic form nor the Painlevé property.

Use §0.8, formulated for an observer bundle and its first-jet bundle. For the classical time curve and phase surface, supply a local observer and prove that the induced jet map is an isomorphism on the stated domain. Apply the general equivalence between horizontal germs and scalar second-order germs on that domain. In a time/phase chart, write h(∂t) = ∂t + A∂q + B∂p and J(t,q,p) = (t,q,A); if p = P(t,q,v) is its inverse on the stated domain, the coordinate comparison is q″ = (A_t + A A_q + B A_p)(t,q,P(t,q,q′)). The chain-rule theorem and intrinsic jet construction belong to the general framework. A_p ≠ 0 gives a local inverse only. Individual classical chart constructions belong to §7.2; meromorphic continuation additionally uses §4.9 and is not a hypothesis of the jet theorem.

Verify each chart/observer jet-isomorphism domain and record its complement. Derive the scalar formula as the coordinate expression of the imported jet construction.

**Checks.**

- If A = p, the inverse is p = q′ and the scalar equation is q″ = B(t,q,q′).
- If A is independent of p, J forgets the momentum and cannot be a jet chart; scalar uniqueness then cannot be inferred from geometric uniqueness by this argument.
- For A = p² there are two momentum branches away from p = 0; local invertibility does not identify the two branches globally.
- If a scalar formula divides by q, compare a solution crossing q = 0 through overlapping phase charts. Distinguish its continuation from extra solutions of the denominator-cleared equation outside the original rational domain.

*Needs:* Internal: 3.4, 3.7, 3.9, 0.8.

### 7.2 Exhaustive presentation and equation comparisons

Use the profile classification of §3.4, the intrinsic moduli, splitting and symplectic form of §§3.5–3.12, and the observer and continuation theorems of §§4.8–4.9. Construct in this target the local source-comparison lemmas, concrete charts and standard observers, parameter/time substitutions, jet inverses, observer-admissibility certificates and coverage/overlap comparisons for those profiles.

Prove the following sign comparison for the source Hamiltonian system. In VDPS09 §4.1 the displayed equations p′ = F H_q, q′ = −F H_p, with F depending only on q, have kernel form dp ∧ dq/F + dH ∧ dt. The printed minus sign in that extended form is inconsistent with those equations, including the PI instance (44), (46), (47). On F ≠ 0, set Q = q, P = p/F(q), K(Q,P,t) = −H(F(Q)P,Q,t), using the source's argument order H(p,q,t); then dQ ∧ dP + dK ∧ dt is the negative of the correct source form and gives the convention of §3.11. Prove this identity directly and use it to compare each source Hamiltonian with §3.11.

VDPS09's printed PV equation (3) also disagrees with its system (2) and Hamiltonian (5). Differentiating q′ = 2p/t gives the exponent term [θ₀²(q − 1)² − θ₁²q²]/[2q(q − 1)t²], in place of the printed θ₀²/(2qt²) + θ₁²/[2(q − 1)t²]. At t = 1, q = 2, p = 0, θ₀ = 0, θ₁ = 1, θ∞ = 1, the compatible system gives q″ = 2 while the printed scalar equation gives 7/2. Use the expression derived from the compatible system in the PV dictionary below. Prove these two local algebraic lemmas in this target and use them in the presentation comparisons and in §7.4.

For every profile in §3.4 construct a concrete time/Darboux or equivalent symplectic chart from the connection moduli, with its inverse on its actual image. Identify h in this chart by the strong integrable extension of §3.9, apply §7.1, and prove the parameter and time-substitution dictionary to the standard equation below, including the required marking covers. The required comparison records the chosen local frames, the determinant convention, the chart domain, the momentum inverse, every denominator, and the omitted loci. For the charts used in the scalar comparison, prove the overlap identifications and state their coverage of initial germs and observer strata. Derive the scalar expression from the compatible system using the source-comparison lemmas above. (VDPS09, §2.2, Table 1 and §4; IIS06, Theorems 10.6, 10.10 and 10.13; DLMF, §32.2(i), equations 32.2.1–32.2.6.)

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

The scalar meromorphic continuation targets in [Suggested.lean](Suggested.lean) use the following time domains. Establish the result for each germ realized by a chart and observation of §§4.8–4.9. For the standalone scalar results use the direct analytic continuation proof of JK94 as a second route. Apply the monodromy theorem on the simply connected time cover, and verify the hypotheses on the holomorphic initial disk and its denominators. The primitive coefficient conditions are tabulated in §7.3.

| Lean target | Equation and continuation domain |
|---|---|
| `painleveI_meromorphic_extension` | PI on ℂ |
| `painleveII_meromorphic_extension` | PII on ℂ |
| `painleveIII_meromorphic_extension` | Primitive PIII on the logarithmic time plane, using `Complex.isCoveringMap_exp` |
| `painleveIV_meromorphic_extension` | PIV on ℂ |
| `painleveV_meromorphic_extension` | Ordinary and degenerate PV on the logarithmic time plane |
| `painleveVI_meromorphic_extension` | PVI on a supplied holomorphic universal cover of ℂ ∖ {0,1} |

For the logarithmic time plane, fix a point above the initial time and require agreement near that point. For PVI use the same comparison at a chosen lift in the holomorphic cover. The scalar statements concern the original rational ODE where its denominators are nonzero.

Prove the source extended-form sign comparison and the compatible PV elimination before using the presentation dictionaries. Export one comparison package per listed presentation, containing the explicit formulas, parameter map, inverse jet chart and overlap maps. Compare the source-specific Hamiltonian and the convention of §3.11 by equality of extended forms. Identify all excluded denominators and the phase charts through their allowed zero loci. Construct each standard q and supply its domain, overlap, stratum-coverage, cancellation/lift and non-infinity certificates to §§4.8–4.9. Deduce the standard scalar Painlevé property from §4.9 on every observer stratum covered by the comparison.

**Checks.**

- Verify ten presentation rows and eight boundary types, with two presentations for each of D₆ and E₇.
- In the PV source check t = 1, q = 2, p = 0, θ₀ = 0, θ₁ = 1, θ∞ = 1, the compatible elimination gives q″ = 2, not the printed 7/2.
- The standard PI scaling above changes both q and t. Rescaling t alone does not recover the coefficient 6 of q².
- PII's two linear-system presentations have different local singularity data; equality of their scalar solution formulas is not equality of input objects.
- A PIII comparison with γ = 4, δ = −4 cannot cover γ = δ = 0 by a nonzero scaling; the latter belongs to the boundary analysis of §7.3.

*Needs:* Internal: 3.4, 3.5, 3.6, 3.7, 3.8, 3.9, 3.10, 3.11, 3.12, 4.8, 4.9, 7.1.

### 7.3 Complete coefficient-boundary coverage

Use all standard PIII and PV coefficient tuples and specify the domains of the nonzero scalings and inversions. Keep the primitive and quadrature cases separate.

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

**Checks.**

- For PIII, the coefficient tuple (α,β,γ,δ)=(1,1,0,1) gives D₇.
- For PIII, (1,1,0,0) gives D₈, while (0,1,0,1) is a quadrature case.
- For PV, δ=0 and γ≠0 gives the degenerate presentation. Setting γ=δ=0 gives the quadrature boundary.

*Needs:* Internal: 7.1, 7.2; [Formal scalar and vector-valued Laurent algebra](#supplier-formal-series) (L1–L4; L5–L6 for finite-extension steps in 1.1); [Covering spaces and universal covers](#supplier-covers) (Stage 0.2–0.4; Stage 1.5; Stage 2.6–2.8).

### 7.4 Hamiltonian, sigma and linear-system realizations

Use the geometric transformations, determinant-variation results and coordinate comparisons on their actual domains. The source-sign and PV-elimination lemmas and the PI/PII Hamiltonian normalizations are supplied by §7.2. Sigma reconstruction uses the explicit analytic and nondegeneracy conditions below, with constant parameters and connected open time domains.

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

    t(t−1)K_ε = q(q−1)(q−t)p²
                − [θ₀(q−1)(q−t) + θ₁q(q−t) + (θ_t−ε)q(q−1)]p
                + (A−θ∞)(A+θ∞−2ε)(q−t)/4
                + [(t−1)θ₀+tθ₁](θ_t−ε)/2.

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

For every fixed model construct a local converse as follows. Set S₀ = S, S₁ = XS and S₂ = X²S, and define Δ = (∂_qS₀)(∂_pS₁) − (∂_pS₀)(∂_qS₁). At a phase point x₀ where Δ ≠ 0 and E_v(t,S₀,S₁,S₂) ≠ 0, apply the holomorphic inverse theorem to the fixed map (t,q,p) ↦ (t,S₀,S₁). Construct inverse neighborhoods and the inverse branch I_(x₀). The implicit function theorem identifies the germ of E = 0 through (t₀,S₀(x₀),S₁(x₀),S₂(x₀)) with the graph of S₂ transported by I_(x₀); prove this identification using the forward identity. For a holomorphic sigma solution in that germ, define (q(t),p(t)) = I_(x₀)(t,σ(t),σ′(t)). Differentiating S₀ and S₁ gives the two equations dS_i((q′,p′) − (K_p,−K_q)) = 0, i = 0,1; the nonzero determinant Δ proves both Hamilton equations. Prove both inverse laws on the constructed neighborhoods and analytic dependence on parameters, retaining x₀ as part of the inverse-branch data.

These hypotheses define a concrete sufficient open domain. In PI, PII and PIV, Δ = −S₂ and E_v = 2v. In PV, D₇ and D₈, Δ = −tS₂ and E_v = 2t²v. In PIII(D₆), Δ = S₁ − tS₂ and E_v = 2t(tv − u). In PVI use the displayed determinant Δ and E_v = 2u t²(t − 1)²v. Thus, on the Hamiltonian domains, the additional conditions are respectively v ≠ 0; t ≠ 0 and v ≠ 0; t ≠ 0 and tv − u ≠ 0; and t(t − 1)uvΔ ≠ 0. The D₈ Hamiltonian also requires q ≠ 0. The stronger connected-branch PI and PII converses below extend beyond these pointwise conditions by their explicit identities. The sigma conclusions consist of the forward identities, these local inverse branches and the PI/PII connected-branch and affine-branch analyses below. For continuation of a reconstructed phase trajectory across a zero of an inverse denominator, prove the geometric phase-chart comparison.

For PI, use σ = H_I with H_I from §7.2. The equation is E_I = (σ″)² + 4(σ′)³ + 2tσ′ − 2σ = 0, and reconstruction is q = −σ′, p = −σ″ (DLMF 32.6.2–32.6.8). On a connected open time domain require holomorphic σ and σ″ not identically zero, equivalently a point at which σ″ ≠ 0. Differentiating gives E_I′ = 2σ″(σ‴ + 6(σ′)² + t); the identity theorem yields the Hamilton equations everywhere on that domain. Prove H_I(q,p,t) = σ from E_I = 0. The excluded affine branches are exactly σ = at + 2a³, and their constant q = −a never solves PI on an open time domain. In particular, σ ≡ 0 is a spurious scalar solution.

For PII, fix c = α + 1/2 and σ = H_II with H_II from §7.2. Put u = σ′, v = σ″,

    E = v² + 4u³ + 2u(tu−σ) − c²/4
    D = σ‴ + 6u² + 2tu − σ

The sigma equation is E = 0 (DLMF 32.6.13). Require holomorphic σ on a connected open time domain and v not identically zero. On the open subset u ≠ 0 define q = (2v+c)/(4u), p = −2u (DLMF 32.6.14–32.6.15). Prove the identities

    E′ = 2vD
    p′ − (2qp+c) = 0

    q′ − (p−q²−t/2) = D/(2u) − E/(4u²)
    H_II(q,p,t) − σ = E/(2u).

Since v is not identically zero, E = 0 implies D = 0 by the identity theorem. This proves both Hamilton equations and H_II = σ on u ≠ 0. No pointwise condition v ≠ 0 is needed there. Conversely, Hamilton trajectories satisfy σ′ = −p/2 and σ″ = 2qσ′ − c/2 and hence E = 0. At an isolated zero of u, prove extension of the reconstructed trajectory into the full phase space and its comparison with the sigma observation using §4.6, §§4.8–4.9 and the chart comparisons.

If v ≡ 0, write σ = at+b. The sigma relation becomes 4a³−2ab = c²/4. For a ≠ 0, it gives b = 2a²−c²/(8a), but reconstruction yields constant q = c/(4a), p = −2a, incompatible with q′ = p−q²−t/2 on an open time domain. For a = 0, the sigma relation requires c = 0 and permits every b. The Hamilton identity forces b = 0; at b = 0 the genuine Riccati family p = 0, q′ = −q²−t/2 has σ ≡ 0. Retain its phase initial point: different q values give the same sigma function, so there is no sigma-only inverse on this family. Distinguish the spurious affine sigma solutions from the noninjectivity of the sigma observation on this invariant Riccati family.

For the finite sigma inventory, construct each fixed sigma observation, prove its equation and parameter/time comparison, and construct the stated inverse branches with their actual nondegeneracy and domain conditions. Prove the PI and PII forward identities, the analytic converse on the specified non-affine branches, and the affine-branch diagnostics; keep the PII Riccati phase data. Construct the coordinate transformations Ψ_g and their commuting diagrams with F̄_g, including comparison of denominators with the geometric domains. Compare Hamiltonian and tau logarithmic derivatives using §6.5's fixed-section coefficient and its separately normalized scalar function.

**Checks.**

- For PII with c = 0, σ(t) = t+2 satisfies E = 0 and σ′ = 1, but reconstructed q = 0, p = −2 has first Hamilton residual 2+t/2. At t = 0 that residual is 2, although H_II = σ. The sigma equation, nonzero reconstruction denominator and Hamiltonian identity all hold on this branch, while the Hamilton equations fail.
- For PI, σ ≡ 0 satisfies the sigma equation but gives q ≡ 0, which does not solve PI. The condition σ″ not identically zero excludes this branch.
- For PII at c = 0, distinct local solutions of q′ = −q²−t/2 all give the same σ ≡ 0; the inverse must retain their different phase initial points.
- A coordinate Bäcklund formula and the descended transformation must have identical chart values on their common domain; a denominator vanishing in one chart alone does not determine whether the geometric map is undefined.

*Needs:* Internal: 3.11, 4.6, 4.8, 4.9, 5.4, 5.5, 6.4, 6.5, 7.1, 7.2, 7.3; [Complex manifolds, holomorphic bundles and observations](#supplier-complex) (K1; K3.0; K3.HolomorphicStalk; K3.MeromorphicGermField; K4; K7.1).

### 7.5 Concrete normalizations and special-solution checks

Use the PI/PII connection-moduli comparisons, Hamiltonian normalizations and momentum inverse of §7.2, the first-jet lemma and the admitted geometric transformations. Derive the seed solution identities in this target, retaining the exceptional domains and the Riccati parameter α=−1/2.

Use the PI chart H = p²/2 − 2q³ − tq and the PII chart H = p²/2 − (q² + t/2)p − (α + 1/2)q proved from the moduli comparisons in §7.2, and apply §7.1. The PII jet inverse is p = q′ + q² + t/2. The polynomial chart covers all finite (q,q′), while poles use the other phase charts. Establish its parameter dictionary with §7.2. (VDPS09, §§4.10–4.11; DLMF, §§32.2, 32.6 and 32.9.)

Construct the rational and classical-function families in the orbits of the proved seed objects under §§5.4–5.5's admitted transformations, and derive their coordinate formulas. The special-solution output consists of these generated families, with the transformation domains and parameter changes retained.

**Checks.**

- At α = 0, q = 0 and p = t/2 form a horizontal section in this chart.
- At α = 1 and t ≠ 0, q = −1/t and p = 2/t² + t/2 satisfy both Hamilton equations; at t = 0 their geometric continuation uses another chart.
- At α = −1/2, p = 0 is invariant and q′ = −q² − t/2. Setting q = u′/u gives u″ = −tu/2 on u ≠ 0; this is the projective linearization of §5.6, with zeros of u interpreted in ℙ¹.
- H ↦ H + c(t) preserves the displayed horizontal trajectories and changes a normalized Hamiltonian tau representative by the corresponding exponential primitive when the identity of §6.5 applies.

*Needs:* Internal: 5.4, 5.5, 5.6, 6.5, 7.1, 7.2, 7.3, 7.4.

### Examples

The scalar equation may have an apparent denominator at a regular geometric initial point. A denominator-cleared polynomial identity may also admit functions absent from the original equation. Use first-jet charts and observer overlap maps to distinguish geometric continuation from these extra scalar solutions and to compare solution germs on their actual domains.

## Downstream consumers

Within this roadmap, Layers 1–2 supply the moduli and strong-extension interfaces used in Layers 3–4. The geometric continuation in Layer 4 supplies the observer theorem used by Layer 7. Layer 5 supplies the PVI compactification, pair geometry and geometric symmetries on their proved domains. Layer 6 supplies the determinant and tau comparisons used for the Hamiltonians and sigma forms.

## References

- **I13.** Michi-aki Inaba. *[Moduli of parabolic connections on a curve and Riemann–Hilbert correspondence](https://arxiv.org/abs/math/0602004v2)*. Journal of Algebraic Geometry 22 (2013), 407–480. Cited preprint: arXiv math/0602004v2, 6 June 2012; Theorems 2.1–2.2, Definition 4.3, Proposition 5.3, and §6, Lemma 6.1, Propositions 6.1–6.2 and the proof of Theorem 2.2. Theorem 2.2 is the comparison for the four-logarithmic specialization. Proposition 5.3 and the proof of Theorem 2.2 supply its fiberwise irreducibility and character-locus geometry. The four-logarithmic specialization retains the exponent fiber product and the exact numerical and stability hypotheses.

- **SAB12.** Claude Sabbah. *[Introduction to Stokes structures](https://arxiv.org/abs/0912.2762v5)*. Lecture Notes in Mathematics 2060, Springer, 2012. Cited version: arXiv 0912.2762v5, 3 April 2012; Definition 2.22, Proposition 5.5, Theorem 5.8 and Proposition 5.12. The meromorphic/Stokes correspondence includes ramification and the regular-singular specialization. Specified lattices, flags and their family comparisons are constructed in §4.1.

- **I23.** Michi-aki Inaba. *[Moduli Space of Factorized Ramified Connections and Generalized Isomonodromic Deformation](https://sigma-journal.com/2023/013/)*. SIGMA 19 (2023), 013, 72 pages. Publisher version, 22 March 2023. Locators: Definitions 2.1–2.8; Remark 2.9; Theorems 5.1, 7.5, 8.1, 9.7 and 11.6; equation (6.9); Propositions 3.3, 6.3, 7.2, 8.2–8.3, 10.7 and 10.10; Definitions 10.1 and 11.4; Corollaries 4.3–4.4, 9.11 and 11.8; equations (8.2), (11.2) and (11.5).

- **BV89.** D. G. Babbitt and V. S. Varadarajan. *[Local moduli for meromorphic differential equations](https://numdam.org/item/AST_1989__169-170__1_0/)*. Astérisque 169–170 (1989). Part I, Theorem 4.5.1 for the local Malgrange–Sibuya construction.

- **IS12.** Michi-aki Inaba; Masa-Hiko Saito. *[Moduli of unramified irregular singular parabolic connections on a smooth projective curve](https://arxiv.org/abs/1203.0084v3)*. Kyoto Journal of Mathematics 53(2) (2013), 433–482. Cited version: arXiv 1203.0084v3 (22 November 2012); the key retains the preprint year. Locators: Theorem 5.1; §6, Remark 6.3 and Theorem 6.3.

- **HEU10.** Viktoria Heu. *[Universal isomonodromic deformations of meromorphic rank 2 connections on curves](https://www.numdam.org/item/AIF_2010__60_2_515_0/)*. Annales de l'Institut Fourier 60(2) (2010), 515–549. Published text through NUMDAM; printed pp. 515–549. Locators: Theorem 1.1; Definitions 2.3 and 2.10; §2.

- **VDPS09.** Marius van der Put; Masa-Hiko Saito. *[Moduli spaces for linear differential equations and the Painlevé equations](https://arxiv.org/abs/0902.1702v5)*. Annales de l'Institut Fourier 59(7) (2009), 2611–2667. Cited version: arXiv 0902.1702v5 (12 November 2009); the source-form sign and PV-elimination corrections are proved in §7.2. Locators: §2.2, Table 1, preprint pp. 18–19; §3; §4.1 and §§4.3–4.11; equations (12), (17) and (22).

- **IIS06.** Michi-aki Inaba; Katsunori Iwasaki; Masa-Hiko Saito. *[Dynamics of the Sixth Painlevé Equation](https://arxiv.org/abs/math/0501007v2)*. Séminaires et Congrès 14 (2006), 103–167. Cited version: arXiv math/0501007v2 (6 March 2005). Locators: Definitions 2.1–2.2 and 2.11; Lemma 2.12; Definitions 3.5 and 4.9; Theorem 4.10, Corollary 4.11, and Theorems 4.12, 5.15–5.16, 7.4, 10.6, 10.10 and 10.13; §§5, 7 and 10.

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

- **SGA1XII.** A. Grothendieck et al.; Exposé XII by M. Raynaud. [Revêtements étales et groupe fondamental (SGA 1), Exposé XII: Géométrie algébrique et géométrie analytique](https://arxiv.org/pdf/math/0206203v2). XII Theorem and Definition 1.1 (analytification); §2 (coherent sheaf comparison); §3.1 (morphism properties, including properness); Theorem 4.2 (proper relative direct-image comparison); Corollary 4.3 (cohomology); Theorem 4.4 (proper coherent GAGA).

- **SERREGAGA.** J.-P. Serre. [Géométrie algébrique et géométrie analytique](https://www.numdam.org/article/AIF_1956__6__1_0.pdf). §§1–2; §3 no.12 Theorems1–3 and proofs nos.13–17.

- **GR84.** H. Grauert and R. Remmert. [Coherent Analytic Sheaves](https://link.springer.com/book/10.1007/978-3-642-69582-7). Chapter I, Complex Spaces (pp.1–37); Chapter X, Direct Image Theorem (pp.188–222).

- **KED09.** K. S. Kedlaya. [Good formal structures for flat meromorphic connections, I: Surfaces](https://arxiv.org/pdf/0811.0190v4). §2.1 (field and constants); §2.2 (regular modules and regulating lattices); Theorem2.3.3 and its proof; §2.4 (Deligne–Malgrange lattices).

- **DEL70.** P. Deligne. [Équations différentielles à points singuliers réguliers](https://publications.ias.edu/sites/default/files/Number9.pdf). II §5, Proposition5.4 (extension for a section of ℂ→ℂ/ℤ); Corollary5.6 (nonresonant monodromy/residue comparison); Theorem5.9 (regular-singular algebraic/analytic correspondence); II §6.6 (principal-parts analytification of differential operators and proper hypercohomology comparison), PDF p.103 / printed p.101. Read the [April 1971 erratum](https://publications.ias.edu/sites/default/files/Erratum%20to%20SLN%20163.pdf): omit II1.23–1.24 and use the corrected II4.1 proof in the higher-dimensional argument leading to II5.7/5.9. The cited one-dimensional statements retain their scopes.

- **ACV03.** D. Abramovich, A. Corti and A. Vistoli. [Twisted bundles and admissible covers](https://arxiv.org/pdf/math/0106211). §5.1, Theorem5.1.5 and construction; Stacks Project tag04V2 for hypotheses.

- **PICREL.** The Stacks Project Authors. [The Picard functor and its properties](https://stacks.math.columbia.edu/tag/0D2C). Proposition99.11.8, tag0D2C; Lemma108.9.3, tag0DNI; Lemma108.9.5, tag0DPK; the Picard gerbe Lemma108.9.1 in tag0DMD.

- **MFK94.** D. Mumford, J. Fogarty and F. Kirwan. [Geometric Invariant Theory, third edition](https://link.springer.com/book/9783540569633). Chapter 1 covers reductive invariant theory and the quotient construction used for the framed filtered connections in I23, Theorem 5.1.

- **GHH15.** M. G. Gulbrandsen, L. H. Halle and K. Hulek. [A relative Hilbert–Mumford criterion](https://arxiv.org/abs/1404.7267). Manuscripta Mathematica 148 (2015), 283–301. Proposition 2.6 gives projectivity of the relative quotient. Corollary 1.1 and Theorem 3.3 give the relative numerical criterion. Definition 3.1 uses the geometric line bundle convention of §1.1.

- **KMS93.** Ivan Kolář, Peter W. Michor and Jan Slovák. [Natural Operations in Differential Geometry](https://www.emis.de/monographs/KSM/kmsbookh.pdf). Springer, 1993. §9.3, p. 78, and Theorem 9.8, p. 81.

- **Teschl12.** Gerald Teschl. [Ordinary Differential Equations and Dynamical Systems](https://www.mat.univie.ac.at/~gerald/ftp/book-ode/ode.pdf). AMS, 2012. Theorem 2.2, p. 38, and Corollary 2.15, pp. 52–53.

- **IY08.** Yulij Ilyashenko and Sergei Yakovenko. [Lectures on Analytic Differential Equations](https://www.wisdom.weizmann.ac.il/~yakov/thebook1.pdf). Theorem 1.1, pp. 1–2 of the author draft linked here.

- **IIS Part II.** Michi-aki Inaba, Katsunori Iwasaki and Masa-Hiko Saito. [Moduli of Stable Parabolic Connections, Riemann–Hilbert Correspondence and Geometry of Painlevé Equation of Type VI, Part II](https://arxiv.org/pdf/math/0605025). Theorem 4.1, preprint p. 11.

- **JK94.** Nalini Joshi and Martin D. Kruskal. [A Direct Proof that Solutions of the Six Painlevé Equations Have No Movable Singularities Except Poles](https://doi.org/10.1002/sapm1994933187). Studies in Applied Mathematics 93 (1994), 187–207.
