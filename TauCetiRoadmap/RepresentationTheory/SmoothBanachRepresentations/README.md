# Roadmap: smooth vectors in real and complex Banach representations

**Summary.** Extend the complex smooth-vector theory of AutomorphicFormsOnReductiveGroups §2.7 to real coefficients and unrestricted finite-dimensional Lie-group test functions, and prove support-controlled Dixmier–Malliavin factorization, exactness, smooth tensor comparisons and spectral invariance. The library includes strongly continuous actions which are neither unitary nor globally uniformly bounded. The complete smooth topology, mixed domains and differentiated actions are used throughout; none is replaced by the ambient Banach topology.

## Scope and ownership

[AutomorphicFormsOnReductiveGroups §2.7](../../AutomorphicFormsOnReductiveGroups/README.md#27-smooth-fréchet-representations-and-globalization) owns the complex Banach smooth carrier, all-word domain criterion, complete derivative topology, Lie/enveloping action, smoothing and density, including compact-finite density in the smooth topology. Its §0.1a owns complex test functions for the archimedean groups with finitely many components. Layers 1–4 here extend those contracts to real coefficients and, for tests, arbitrary finite-dimensional Hausdorff Lie groups, with the nonunimodular conventions below; Layer 2 also specifies the finite-k domain criterion. Layer 6 adds prescribed support of the factors and the function-support refinement to §2.7's finite-sum factorization. Layers 7–8 add the general Banach exactness, tensor, dual and algebra interfaces.

[CompactGroups Layer 5](../CompactGroups/README.md) supplies representative-function density; its named gap for the topology-free finite-orbit-span API and generic complex Banach density is recorded below. AutomorphicFormsOnReductiveGroups §2.1 consumes that gap and owns the complete locally convex extension. There is no second compact-finiteness predicate here. Tau Ceti already constructs the completed locally convex projective tensor of a finite family of spaces with given seminorm families over every normed field (`TauCeti.CompletedProjectiveTensorProduct`), with its continuous pure-tensor map, continuous universal property, functoriality and flip. [NoncommutativeGeometry N1](../../NoncommutativeGeometry/README.md) owns the rest of the completed locally convex projective tensor, over ℝ and over ℂ alike: the cross property, associativity, the scalar unit, finite sums, Fréchet completeness and the comparison with B4. §7.2a owns only the two scalar-comparison maps between real and complex tensors, including their Banach cases; no other tensor law is a target here. [BanachSpaceTheory B4](../../BanachSpaceTheory/README.md) owns Banach projective tensors over both fields and states no map between its real and complex tensors. [LocallyAnalyticDistributions §0.2](../../LocallyAnalyticDistributions/README.md#02-strict-sequences-and-three-space-properties) owns the Fréchet open mapping theorem over every complete nontrivially normed field, with no ultrametric hypothesis; §7.2 consumes it at ℝ and ℂ and plans no open mapping theorem of its own. LieGroups Layers 0–3 and OneParameterSemigroups Part A own the Lie and closed-generator foundations; the two-sided generator theory of strongly continuous one-parameter groups, including its link with orbit-continuous representations of ℝ, the inverse function theorem on manifolds, automatic smoothness of continuous homomorphisms, the restriction and quotient of a continuous representation along an invariant subspace, point-norm continuous actions on C\*-algebras with the derivation, star and unit laws of their one-parameter generators, and resolvent integrals over contour cycles in complex Banach algebras are already in Tau Ceti and are consumed as listed below.

No pinned declaration proves the Fréchet open mapping theorem over ℝ or ℂ. The pinned theorems that deduce openness of a linear surjection onto an infinite-dimensional target from conditions on its source and target need, in Mathlib, a Banach source and target (`ContinuousLinearMap.isOpenMap`), a σ-compact source group and a Hausdorff Baire target (`AddMonoidHom.isOpenMap_of_sigmaCompact`), a target carrying the module topology (`IsModuleTopology.isOpenMap_of_surjective`) or a target carrying the quotient topology of the source (`Submodule.isOpenMap_mkQ`); in Tau Ceti they need a seminormed source (`TauCeti.isOpenMap_of_exists_norm_le`, `LinearMap.isOpenMap_of_isTate`) or a nonarchimedean one (`TauCeti.HasZeroSequenceOfUnits.isOpenMap` and `LinearMap.isOpenMap_of_isTateRing`, which applies it). The first proves the surjective-implies-open direction of Henkel's open mapping theorem (Henkel, Theorem 1.6, p.4) only for a nonarchimedean source, with a Baire target; the published theorem has no nonarchimedean hypothesis and contains the Fréchet case over ℝ and ℂ, where the units 1/n tend to 0. Let V be a Fréchet space over ℝ or ℂ that is not normable and W an infinite-dimensional Fréchet space over the same field. No single seminorm defines the topology of V. V is not σ-compact: by Baire one of countably many compact sets covering it would have interior, and a Hausdorff topological vector space over ℝ or ℂ with a compact neighbourhood of 0 is finite-dimensional. V is not nonarchimedean: an open subgroup contains the small real multiples of each vector and their integer multiples, hence is all of V, whereas V is nonzero and Hausdorff. W does not carry the module topology: every linear functional on a module with the module topology is continuous (`IsModuleTopology.continuous_of_linearMap`), whereas W has a discontinuous one (W contains a null sequence of linearly independent vectors; send each of them to 1 and extend along a Hamel basis). That W carries the quotient topology of V along a continuous linear surjection is the conclusion of the open mapping theorem, not a hypothesis available to it.

[NoncompactQuantumSymmetry M0](../../NoncompactQuantumSymmetry/README.md#layer-3-m0--smooth-vectors-compact-types-and-semisimple-representation-bridges) consumes Layers 0–4, read on a complex Hilbert space, for the integrated operators, Gårding space, smooth vectors, mixed-word domains and derived Lie and enveloping actions of strongly continuous unitary representations, and owns the Hilbert-adjoint statements on that domain: skew-symmetry of real generators, Nelson's operator, analytic vectors, and the elliptic and central closures. Layers 0–4 cover unitary actions as a special case and state none of those adjoint results. [NoncommutativeGeometry N6](../../NoncommutativeGeometry/README.md#n6-smooth-noncommutative-two-tori-and-differential-calculus) owns the smooth noncommutative torus: its identification with the smooth vectors of the two-torus gauge action, the two-sided finite-order comparison of its rapid-decay and derivative seminorms, and its inverse closure at every matrix level. Layer 8 states the generic smooth-algebra theorems and no torus estimate.

Mathlib supplies the native representation, manifold, test-function, distribution and integral carriers. Differentiable orbit smoothness here differs from open-stabilizer smoothness for totally disconnected groups. Build needed adapters in Tau Ceti with native vocabulary and adopt Mathlib's designs when available. No implementation is held for an upstream addition.

## Conventions

Let G be a finite-dimensional Hausdorff real Lie group without boundary. Connectedness and second countability of G are not standing hypotheses. Let E be a Banach space over 𝕜=ℝ or ℂ, without a separability hypothesis. Use Mathlib's `ContRepresentation 𝕜 G E`, a monoid homomorphism into continuous linear endomorphisms, together with the explicit hypothesis

`∀ v : E, Continuous (fun g : G => π g v)`.

The predicate `HasContinuousOrbits` records this hypothesis. All carriers range over arbitrary Lean universes; no countability bound on the group or separability bound on the Banach space is imposed. In Lean the scalar parameter has `RCLike`, specializing to ℝ and ℂ, and the real normed-space structure is compatible through `IsScalarTower ℝ 𝕜 E`. That structure alone does not assert this continuity. The group law supplies inverse operators. Do not replace strong continuity by continuity in operator norm, nor assume `sup_g ‖π(g)‖<∞`. For example, π(t)v=e^t v on the additive real group is in scope. State operator bounds by inequalities with constants rather than introducing a private boundedness predicate. The Lie algebra is real even when E is complex. Use the native Lie algebra of left-invariant derivations and its tangent-space comparison from LieGroups. Differentiate the left action `π(gh)=π(g)π(h)`.

Fix a nonzero regular left Haar measure μ. Native `Measure.IsHaarMeasure` includes finiteness on compact sets, left invariance and positivity on nonempty open sets, but not regularity on an arbitrary group; the integral headlines also carry `Measure.Regular` explicitly. Adopt [BanachAlgebras A7](../../BanachAlgebras/README.md)'s modular convention

`∫ F(xg) dμ(x) = c(g) ∫ F(x) dμ(x)`.

Write D(G)=C_c∞(G,𝕜), using `LieTestFunction`, as the compact-support subtype of Mathlib's `ContMDiffMap`; in a Euclidean chart compare it with Mathlib's existing `TestFunction`, not a second Euclidean test-function theory. Write

`π(f)v = ∫_G f(g) • π(g)v dμ(g)`,
`(f*h)(x) = ∫_G f(y)h(y⁻¹x) dμ(y)`.

Use the native Bochner integral and prove its integrability before its identities. For X in the real Lie algebra write

`dπ(X)v = d/dt|₀ π(exp(tX))v`,
`L_X f(g) = d/dt|₀ f(g exp(tX))`,
`R_X f(g) = d/dt|₀ f(exp(tX)g)`.

L is left invariant; R is right invariant. X↦R_X is an anti-Lie map, whereas X↦−R_X is a Lie map. In these conventions `dπ(X)π(f)v=π(−R_X f)v`. For a Banach star-algebra action the star law is `dπ(X)(a*)=(dπ(X)a)*`; the Hilbert skew-adjoint pairing law is a different specialization.

## Exact supplier contracts

### From Mathlib

Consume `ContRepresentation`, `ContIntertwiningMap` and `ContRepresentation.restrict` (restriction along a monoid homomorphism) in `Mathlib/RepresentationTheory/Continuous/Basic.lean` (the former bundles a monoid homomorphism into continuous linear endomorphisms, not continuity in the group variable); `ContMDiff`, `ContMDiffMap`, `LinearPMap`, `Seminorm`, `WithSeminorms`, `UniversalEnvelopingAlgebra`, `TestFunction`, `Distribution`, `TemperedDistribution`, the algebraic `TensorProduct` and `UniformSpace.Completion`. For inverse closure in Layer 8 use `contDiffAt_ringInverse` in `Mathlib/Analysis/Calculus/ContDiff/Operations.lean`, smoothness of `Ring.inverse` at every unit of a complete normed algebra, composed with a smooth orbit through `ContDiffAt.comp_contMDiffAt` in `Mathlib/Geometry/Manifold/ContMDiff/NormedSpace.lean`. Use `Continuous.integrable_of_hasCompactSupport` in `Mathlib/MeasureTheory/Function/LocallyIntegrable.lean` for the continuous compact-support orbit integrand (it assumes only an opens-measurable space and a measure finite on compacts, and no separability of the target), and `banach_steinhaus` for uniform operator bounds. For the completed quotients of §7.2a use `QuotientAddGroup.completeSpace_right` in `Mathlib/Topology/Algebra/IsUniformGroup/Basic.lean`: the quotient of a complete first-countable uniform additive group by a subgroup is complete. Native Bochner integrals are total functions: integral identities require integrability, not merely a displayed integral. Native distribution topologies do not assert the fixed-support strong-dual comparison of Layer 5.

### From Tau Ceti

Consume `oneParameterSubgroup` and `contMDiff_oneParameterSubgroup` in `TauCeti/Geometry/Lie/Exponential/Basic.lean`; `TauCeti.Semigroups.StronglyContinuousSemigroup` in `TauCeti/Analysis/Semigroups/Basic.lean`, its generator with the density theorem `StronglyContinuousSemigroup.dense_domain` in `Generator/Basic.lean` and closedness `isClosed_generator` in `Generator/Closed.lean`, and its smooth-vector/power dictionary in `Generator/SmoothVectors.lean`.

For the one-parameter generators of Layer 0 consume `ContRepresentation.toStronglyContinuousGroup` in `TauCeti/RepresentationTheory/Continuous/OneParameter.lean`: over `RCLike 𝕜` with `IsScalarTower ℝ 𝕜 V`, it turns a `ContRepresentation 𝕜 (Multiplicative ℝ) V` with continuous orbits into a `TauCeti.Semigroups.StronglyContinuousGroup V` of real operators, t↦π(t) with scalars restricted to ℝ. Consume `StronglyContinuousGroup` and its forward semigroup `toSemigroup` in `TauCeti/Analysis/Semigroups/Group/Basic.lean`, and in `TauCeti/Analysis/Semigroups/Group/Generator.lean` its real `domain` and `generator`; the derivative dictionary `mem_domain_of_hasDerivAt_zero` and `generator_eq_of_hasDerivAt_zero` (a vector whose orbit has a two-sided derivative at 0 is in the domain, with that derivative as value); on a complete space `hasDerivAt_zero` and `hasDerivAt` (every domain orbit is two-sidedly differentiable at every time, with derivative U(t)Ax) and `reflect_generator` (time reversal negates the generator on the same domain); the group invariance `map_mem_domain` and `generator_map`; and `generator_commute_of_commute` for bounded operators commuting with the group. For complex scalars consume `StronglyContinuousSemigroup.IsComplexLinear`, `complexDomain` and `complexGenerator` in `TauCeti/Analysis/Semigroups/Generator/ComplexLinear.lean`, stated for the real structure obtained by restricting a complex normed space.

For the exponential-product chart of §6.1 consume the manifold inverse function theorem `TauCeti.isLocalDiffeomorphAt_of_mfderiv_eq` in `TauCeti/Geometry/Manifold/LocalDiffeomorph/Basic.lean` (a map of class Cⁿ, n≥1, on an open set is a Cⁿ local diffeomorphism at an interior point where its manifold derivative is a continuous linear equivalence). Its two-factor model `Submodule.isLocalDiffeomorphAt_lieExpMulLieExp_zero_of_isCompl` in `TauCeti/Geometry/Lie/Exponential/ProductChart.lean` treats only (X,Y)↦lieExp X·lieExp Y on complementary subspaces; the second factor is the exponential of a subspace, so it does not iterate to d one-parameter factors. For §4.1 consume `TauCeti.Lie.contMDiff_of_continuous_monoidHom` in `TauCeti/Geometry/Lie/AutomaticSmoothness.lean`: a continuous homomorphism between finite-dimensional real Lie groups is smooth.

For Layer 7 consume `ContRepresentation.subrepresentation` and `ContRepresentation.quotient` in `TauCeti/RepresentationTheory/Continuous/Subrepresentation.lean`, the restriction of a continuous representation to a submodule preserved by every operator and its descent to the quotient carrying the quotient topology. They assert nothing about continuity of orbits.

Consume `TauCeti.Complexification`, `ContinuousLinearMap.complexify`, `TauCeti.Complexification.ofRealLI` and `TauCeti.Complexification.reCLM` in `TauCeti/Analysis/Normed/Module/Complexification.lean` for real Banach actions.

For the locally convex tensors of §§7.2a–7.3 consume, in `TauCeti/Analysis/Normed/Module/PiTensorProduct/`, all stated for a finite family `⨂[𝕜] i, E i` of modules with given seminorm families, the two-factor tensor being the family (E,F): `PiTensorProduct.projectiveSeminormOf`, `projectiveSeminormOf_tprod_le` and `projectiveSeminormOf_mono` in `Projective/Seminorm.lean`, over `NormedField 𝕜`, where the pure-tensor estimate is only the inequality ≤; `TauCeti.ProjectiveTensorProduct` with `withSeminorms`, `instFirstCountableTopology` (countable seminorm families over a nontrivially normed field) and `continuous_tprod` in `Projective/Topology.lean`; `TauCeti.CompletedProjectiveTensorProduct`, the `UniformSpace.Completion` of that topology, with `tprod`, `continuousLinearMap_ext` (agreement on pure tensors), `lift`, `map`, `map_id` and `map_comp` in `Projective/Completion.lean`; `CompletedProjectiveTensorProduct.liftEquiv` in `UniversalProperty.lean`, over `NontriviallyNormedField 𝕜`, the linear equivalence between continuous multilinear maps into a complete Hausdorff space with a defining seminorm family and continuous linear maps on the completed tensor; and `CompletedProjectiveTensorProduct.reindex`, `reindex_refl`, `reindex_trans` and `map_comp_reindex` in `Reindex/Completion.lean`, the relabelling of factors, which for two factors is the flip. These enter at 𝕜=ℝ and 𝕜=ℂ through NoncommutativeGeometry N1.

For the C\*-algebra case of §8.1 consume `TauCeti.CStarAction` and `CStarAction.comp` in `TauCeti/Analysis/CStarAlgebra/Action/Basic.lean`: a homomorphism of G into `A ≃⋆ₐ[ℂ] A` for a possibly nonunital C\*-algebra A, with norm-continuous orbits, and its pullback along a `ContinuousMonoidHom`. For `CStarAction (Multiplicative ℝ) A` consume, in `TauCeti/Analysis/CStarAlgebra/Action/Generator/Basic.lean`, the closed complex `generator` with dense domain (`isClosed_generator`, `dense_generator_domain`), its domain as the nonunital star subalgebra `generatorDomain`, the Leibniz rule `generator_mul`, the star law `generator_star` and, for unital A, `generator_one`.

For holomorphic closure in §8.1 consume `TauCeti.Contour.Cycle` with `TauCeti.Contour.Cycle.integral`, `TauCeti.Contour.Cycle.IsIn`, `TauCeti.Contour.Cycle.windingNumber`, `TauCeti.Contour.Cycle.IsNullHomologous`, `TauCeti.Contour.Cycle.trace` and `TauCeti.Contour.Cycle.integral_comp_comm` in `TauCeti/Analysis/Contour/Cycle/Basic.lean` (finite integer combinations of closed piecewise-C¹ curves, the additively extended contour integral and winding number, and commutation of continuous linear maps with an integral whose contour integrand is integrable), and, in `TauCeti/Analysis/Normed/Algebra/HolomorphicFunctionalCalculus/Cycle.lean`, for a complete normed ℂ-algebra, `TauCeti.Contour.Cycle.integral_smul_resolvent_eq_of_windingNumber_eq` (the resolvent integral `∫_Γ f(z)(z1−a)⁻¹dz` of f holomorphic on an open U is the same for any two cycles in U∖σ(a), null-homologous in U, with equal winding numbers about σ(a)) and `TauCeti.Contour.Cycle.integral_eval_smul_resolvent` (for a cycle in the resolvent set winding once around σ(a), the integral of p(z)(z1−a)⁻¹ is 2πi·p(a) for every complex polynomial p). With f holomorphic near σ(a) and an admissible Γ, f(a) is (2πi)⁻¹ times this integral.

For the globally bounded comparison of §1.3 consume `ContRepresentation.integratedOperatorL1` and `ContRepresentation.integratedOperatorL1_toL1` in `TauCeti/RepresentationTheory/Continuous/Integrated/Basic.lean`: over a nontrivially normed field, for a `ContRepresentation 𝕜 (Multiplicative M) E` of an additive monoid M, commutative or not, with an R1 Borel topology, continuous orbits and `‖π(g)‖≤C` for all g, and a measure μ with `InnerRegularCompactLTTop`, the bounded map f↦π(f) on `L¹(M,μ)` with π(f)v the Bochner integral of f(g)•π(g)v.

For the Haar-density route, consume `TauCeti.chartVolumeDensity`, `TauCeti.chartVolumeDensity_pos` and `TauCeti.contMDiffOn_chartVolumeDensity` in `TauCeti/Geometry/Manifold/Riemannian/VolumeDensity/Basic.lean`, and `Homeomorph.measurePreserving_riemannianVolume` in `TauCeti/Geometry/Manifold/Riemannian/VolumeDensity/Isometry.lean`. Positivity is on the chart domain, smoothness requires a smooth Riemannian bundle, and the global isometry theorem requires Lindelöf source and target; Layer 1 applies it only on the open σ-compact subgroup.

### From TauCetiRoadmap.LieGroups and TauCetiRoadmap.OneParameterSemigroups

[LieGroups Layers 0–3](../LieGroups/README.md) supplies the Lie algebra and its identification with the tangent space at 1, the exponential and its chart at the identity, Ad and the bracket. It states no chart built from products of several exponentials; that chart is a target of §6.1. [OneParameterSemigroups Part A](../../../Completed/OneParameterSemigroups/README.md) supplies the closed generators and their powers. Only these clauses enter; classification and representation decompositions do not.

### From TauCetiRoadmap.AutomorphicFormsOnReductiveGroups and TauCetiRoadmap.CompactGroups

Consume AutomorphicFormsOnReductiveGroups §0.1a's archimedean tests and §2.7's complex smooth-vector contracts at the scope just specified. Its differentiation named L_X is this roadmap's R_X: both differentiate f(exp(tX)g). Its unimodular involution extends here with the modular factor. Its §2.1 supplies the complete Hausdorff locally convex compact-finite density theorem for jointly continuous actions of compact Hausdorff groups.

What CompactGroups must provide (gap:banach-gfinite-density), as required by AutomorphicFormsOnReductiveGroups §2.1: for any group representation over a field, finite-dimensional orbit span and its invariant submodule, closed under addition, scalars and equivariant linear maps; for a compact Hausdorff group acting strongly continuously on a complex Banach space, density of that submodule. The proof uses CompactGroups Layer 5 representative-function uniform density and Haar approximate identities. This contract includes non-Lie compact groups and assumes no operator-norm continuity.

### From TauCetiRoadmap.BanachSpaceTheory and TauCetiRoadmap.NoncommutativeGeometry

Consume BanachSpaceTheory B4's real/complex completed Banach projective tensor and bounded-bilinear universal property. Consume NoncommutativeGeometry N1's completed locally convex projective tensor E⊗̂_(π,𝕜)F of Hausdorff locally convex spaces over 𝕜=ℝ and over 𝕜=ℂ, the pinned `TauCeti.CompletedProjectiveTensorProduct` of the family (E,F) with the projective seminorms `π_(p,q)(t)=inf Σ_i p(x_i)q(y_i)` over representations t=Σ_i x_i⊗y_i: its cross property `π_(p,q)(x⊗y)=p(x)q(y)`, the continuous-bilinear universal property into complete Hausdorff locally convex spaces (pinned `CompletedProjectiveTensorProduct.liftEquiv`), functoriality and flip, associativity, the scalar unit, finite sums, Fréchet completeness for Fréchet factors, and agreement with B4 for Banach factors.

The two scalar-comparison maps between real and complex tensors are targets of §7.2a; no other law of the locally convex tensor is a target of this roadmap.

### From TauCetiRoadmap.BanachAlgebras

[BanachAlgebras A7](../../BanachAlgebras/README.md), the chosen approximate identity and integrated-representation clauses, supplies Haar/modular conventions, localized Bochner/Fubini comparisons and globally bounded L¹ actions. Its A1–A2 supplies unitization, Banach inversion and holomorphic functional calculus for Layer 8. Layer 1 builds smooth tests and estimates depending on compact support; no global operator bound is imposed.

### From TauCetiRoadmap.LocallyAnalyticDistributions

[LocallyAnalyticDistributions §0.2](../../LocallyAnalyticDistributions/README.md#02-strict-sequences-and-three-space-properties), the theorem **Fréchet open mapping**: over a complete nontrivially normed field K, a continuous surjective K-linear map between K-modules carrying Hausdorff, metrizable, complete uniform additive group structures whose topologies are given by families of K-seminorms (native `WithSeminorms`) is open. Its statement carries no ultrametric hypothesis on K or on the seminorms. It enters only in §7.2, at K=ℝ and K=ℂ, for the smooth quotient map E∞→(E/M)∞; source and target satisfy its hypotheses with the countable word-seminorm families of Layer 2. Nothing else of that roadmap enters; its nonarchimedean locally convex category does not.

## How to read the build

Layers 0–1 give real generators and the general test calculus. Layers 2–4 transport the supplied complex theory and establish the finite-regularity and real comparisons. Layer 5 constructs the scalar parametrix and its Banach-norm passage; Layer 6 gives support-controlled finite factorizations. Layer 7 uses those factorizations for quotient lifting, LocallyAnalyticDistributions §0.2's Fréchet open mapping theorem for the quotient topology and, for tensor operations, N1's real and complex locally convex tensors with the scalar comparisons of §7.2a. Layer 8 uses Layers 0–4 for algebra and spectral invariance, and Layer 6 only for the exact Gårding-domain identification. Proof routes below specify sufficient inputs; another proof may use a different subset of suppliers.

## Layer 0: Strong actions, local bounds and one-parameter generators

The generators are those of Tau Ceti's strongly continuous one-parameter groups, taken along one-parameter subgroups; this layer adds their dependence on X and on the coefficient field, the compact operator bounds (by native uniform boundedness) and the mixed word domains. Casselman, p.1, fixes the orbit convention.

### 0.1 Strong actions

Extend the supplied complex strong-action results to real coefficients: strong continuity implies joint continuity of `(g,v)↦π(g)v` (Bernstein–Krötz, Remark 2.4(a), p.7, by the equicontinuity criterion of Lemma 2.3, p.6). On every compact K⊆G prove `∃ C≥0, ∀ g∈K, ‖π(g)‖≤C` by uniform boundedness applied to the compact images of each orbit (Bernstein–Krötz, Remark 2.4(b), p.7). Derive locally uniform operator bounds from relatively compact neighborhoods. Include restriction to open/closed subgroups, finite products, conjugation, continuous intertwiners and realification. These preserve the explicit orbit-continuity hypothesis.

*Needs:* Mathlib `banach_steinhaus`; compactness of orbit images; AutomorphicFormsOnReductiveGroups §2.7 for the complex case.

### 0.2 One-parameter generators

For X in the Lie algebra let π_X be the restriction `π.restrict (oneParameterSubgroup X)` (Mathlib's `ContRepresentation.restrict` along the monoid homomorphism underlying Tau Ceti's `oneParameterSubgroup X`), a representation of `Multiplicative ℝ` with t↦π(exp(tX)); its orbits are continuous because `oneParameterSubgroup X` is continuous. Define A_X as the `generator` of `ContRepresentation.toStronglyContinuousGroup` applied to π_X, a native real `LinearPMap` on E. Its graph-closedness and dense domain, the two-sided derivative dictionary (v lies in the domain exactly when t↦π(exp(tX))v is differentiable at 0, the derivative then being A_X v, and each domain orbit is differentiable at every t), invariance of the domain under every π(exp(tX)), commutation with them and with bounded operators commuting with them, and the time-reversal law are the pinned group API listed under the Tau Ceti contract; none of it is proved again here. Do not introduce a parallel unbounded-operator carrier. The targets of this subsection are the laws that depend on X and on 𝕜:

- Scaling: for real s the group of sX is t↦π(exp((st)X)). For s≠0 prove that D(A_sX)=D(A_X) and A_sX=s·A_X, using the two-sided dictionary when s<0 (at s=−1 this is pinned `reflect_generator`); A_0=0 with domain E.
- Coefficients: D(A_X) is a 𝕜-submodule of E and A_X is 𝕜-linear on it, since each π(exp(tX)) is 𝕜-linear. For 𝕜=ℂ identify these with pinned `complexDomain` and `complexGenerator`: prove `IsComplexLinear` for the forward semigroup of π_X, after identifying the given real structure of E with the restriction of its complex structure through `IsScalarTower ℝ ℂ E`.

No additivity A_(X+Y)=A_X+A_Y is asserted on these domains: linearity in X holds on E¹ and is proved in Layer 2.

*Needs:* Mathlib `ContRepresentation.restrict`; Tau Ceti `oneParameterSubgroup`, `ContRepresentation.toStronglyContinuousGroup`, the `StronglyContinuousGroup` generator API (`domain`, `generator`, `hasDerivAt_zero`, `mem_domain_of_hasDerivAt_zero`, `generator_eq_of_hasDerivAt_zero`, `reflect_generator`) and, for 𝕜=ℂ, `complexDomain` and `complexGenerator`; LieGroups Layer 0 for t↦exp(tX).

### 0.3 Mixed word domains

Give explicit recursively composable word domains: for a word `(X₁,…,X_r)`, A_X₁⋯A_Xr v is defined by starting with the rightmost operator, requiring each preceding domain membership. The empty word is v. Prove truncation, linearity, restrictions and compatibility with native powers for repeated X. Products of closed generators are not asserted closed as operators on E.

*Needs:* Layer 0.2 generator domains and native powers of `LinearPMap`.

The reusable word-domain API consists of:

- The empty word is defined everywhere and acts as identity.
- A word is defined exactly when its suffix is defined and its value lies in the first generator's domain; sums and scalars preserve this condition.
- Repeating X gives the native domain of the corresponding power; intertwiners preserve all these domains.

**Checks.**

- For π(t)x=e^t x on ℝ, the group U(t)=π(exp(tX)) of `toStronglyContinuousGroup` at X=1 has U(0)x=x, U(s+t)x=e^s e^t x and A₁x=x, and ‖π(t)‖=e^t is unbounded globally; on [−1,1] the bound is e.
- In the same model the group of 2X is e^(2t), so A₂x=2x=2·A₁x, and the group of −X is e^(−t), so A₋₁x=−x. The wrong law A_sX=A_X would give A₂x=x, and A_sX=|s|·A_X would give A₋₁x=x.
- For the rotation π(t)z=e^(it)z of ℝ on ℂ, A₁1=i and A₁i=−1=i·A₁1, the derivative at 0 of t↦e^(it)i, so the generator is ℂ-linear; a conjugate-linear map with A₁1=i would give A₁i=1 instead.
- On L²(ℝ²) with translations, f(x,y)=1_[0,1](x−y)·φ(x+y) for a smooth bump φ is constant along (1,1) in its first factor, so it lies in the domain of A_(1,1); translating it along (1,0) moves the jump and gives difference-quotient squared norm of order ‖φ‖²/|t|, so f is outside the domain of A_(1,0). Generator domains are not additive in X.
- In L∞(ℝ), translation of 1_[0,1] changes it by norm 1 for every 0<|t|<1, so this action fails `HasContinuousOrbits`; translation on L² has difference norm √(2|t|), tending to 0.
- For X=0, A₀=0 with full domain; the empty word sends x to x and every nonempty zero word sends x to 0.
- In the affine matrix representation with H=diag(1,0), N=E₁₂ and v=(0,1), A_H A_N v=(1,0), while A_N A_H v=0; the word order matters.
- For translation on L²(ℝ), v=1_[0,1] has difference-quotient squared norm 2/|t| for 0<|t|<1; its generator derivative does not exist although its orbit is continuous.

### Examples

The exponential real character, the rotation of ℂ, affine matrices and the L² translation step functions distinguish strong continuity, the scaling and coefficient laws of the generators, word order and differentiability.

### Dependencies

Mathlib uniform boundedness and `ContRepresentation.restrict`; Tau Ceti `oneParameterSubgroup`, `ContRepresentation.toStronglyContinuousGroup` and the `StronglyContinuousGroup` generator API, with `complexDomain` and `complexGenerator` for 𝕜=ℂ; LieGroups Layers 0–3; OneParameterSemigroups Part A.

## Layer 1: Smooth tests, local Haar density and compact-support integration

These are real and general-group extensions of AutomorphicFormsOnReductiveGroups §0.1a. Casselman, p.1, gives the integrated left action; the Haar chart-density argument below supplies the additional localization.

### 1.1 General test spaces

Build `LieTestFunction`, the native subtype defining D(G), extending §0.1a to real coefficients and groups without a component-count or unimodularity restriction, with its linear structure, support/zero-extension/translation and inversion rules. On each compact K construct `D_K(G)={f∈D(G):tsupport f⊆K}` with derivative seminorms in a finite atlas, independent of atlas and equivalent to invariant-derivative seminorms. Prove completeness and continuity of restriction, differentiation, multiplication and chart transport. Compare chart-supported tests exactly with native Euclidean `TestFunction` and `ContDiffMapSupportedIn`. Use Mathlib's smooth bump functions to extend compactly supported chart tests by zero and to construct finite cutoff decompositions. Give D(G) the locally convex final topology of these fixed-support spaces and prove the universal property needed below: a linear map out of D(G) is continuous exactly when its restriction to every D_K(G) is. Do not call this an LF topology for a group with no countable compact exhaustion. These manifold statements are this roadmap's own; their Euclidean model is native: `ContDiffMapSupportedIn` carries the fixed-support derivative seminorms and `TestFunction.continuous_iff_continuous_comp` (`Mathlib/Analysis/Distribution/TestFunction.lean`) is the final-topology universal property, and the proofs here transport them through a finite atlas with a smooth partition of unity.

*Needs:* AutomorphicFormsOnReductiveGroups §0.1a; LieGroups Layer 0 charts; native test functions with `TestFunction.continuous_iff_continuous_comp`, supported smooth maps and smooth bumps.

### 1.2 Smooth Haar density

Prove that Haar measure has a strictly positive smooth density in every Lie chart. Construct a smooth left-invariant positive Riemannian metric from an inner product on the Lie algebra; reuse TauCeti's chart volume density, smoothness, change-of-variables and isometry invariance, then Haar uniqueness. Account for the hypotheses of those native measure theorems: a symmetric relatively compact identity neighborhood generates an open σ-compact Lie subgroup H, which is second countable/Lindelöf; prove the inherited open-subgroup Lie/manifold structure and apply the volume theorem there. Any compact subset of G meets only finitely many left cosets of H. Translate and glue the local comparisons on these cosets. Prove independence from H and the charts. Thus no global σ-finiteness or second countability of G is imposed. If G is connected, H=G. The statement is this roadmap's own assembly of pinned inputs: the pinned chart volume density of the left-invariant metric gives a positive smooth density for one left-invariant measure on H, and Mathlib's Haar uniqueness on open sets, `measure_isHaarMeasure_eq_smul_of_isOpen` (`Mathlib/MeasureTheory/Measure/Haar/Unique.lean`, which needs local compactness and no second countability), gives μ(s)=c·ν(s) on open subsets s of H for one constant c>0, where ν is that Riemannian Haar measure, hence μ=c·ν on H since both are regular.

*Needs:* LieGroups Layer 0; native Riemannian volume-density and isometry declarations listed above; Haar uniqueness `measure_isHaarMeasure_eq_smul_of_isOpen`; the open-subgroup localization constructed here.

### 1.3 Local integrated operators

For continuous scalar f of compact support K the integrand `g↦f(g)•π(g)v` is continuous with compact support, so it is integrable, strong measurability included, by native `Continuous.integrable_of_hasCompactSupport`, with no separability hypothesis on E. Prove the bound

   `‖π(f)v‖ ≤ C_K ‖f‖₁ ‖v‖`.

   The definition `smear` is the displayed Bochner integral on native carriers. Produce the bounded linear operator π(f); prove linearity, continuous-intertwiner naturality and independence of representatives. The bound is local in K. A bounded action of all L¹(G) follows under the extra global operator bound, and agrees with A7.IntegratedRepresentations. With `‖π(g)‖≤C` for all g, reading G as `Multiplicative (Additive G)`, π(f) is the pinned `ContRepresentation.integratedOperatorL1` evaluated on the class of f (`ContRepresentation.integratedOperatorL1_toL1`), which is the same Bochner integral and is not built again; the regular Haar measure μ satisfies its hypothesis `InnerRegularCompactLTTop` by Mathlib's instance for regular measures in `Mathlib/MeasureTheory/Measure/Regular.lean`.

*Needs:* Layer 0.1 compact operator bounds; native `Continuous.integrable_of_hasCompactSupport` and Bochner integration; BanachAlgebras A7.IntegratedRepresentations and Tau Ceti `ContRepresentation.integratedOperatorL1` for the globally bounded comparisons.

### 1.4 Convolution and modular covariance

Prove associativity, support `tsupport(f*h)⊆tsupport(f)·tsupport(h)`, smoothness of test convolution, and `π(f*h)=π(f)π(h)`, using compact localized Fubini and changes of variables (Bernstein–Krötz, §2.5, pp.11–12, for the convolution algebra of compactly supported and rapidly decreasing measures and the multiplicativity of the integrated action). Prove left covariance `π(g)π(f)=π(L_g f)`, `L_g f(x)=f(g⁻¹x)`. Prove the modular right-translation and involution comparisons with A7; for unitary representations obtain `π(f*)=π(f)*`. These statements precede the derived action.

*Needs:* Layers 1.1–1.3; BanachAlgebras A7 localized Fubini and modular convention.

### 1.5 Smooth approximate identities

For every identity neighborhood U choose nonnegative smooth u_U with support in U and integral one. Give shrinking-support and fixed-compact bounds and show π(u_U)v→v in E, uniformly for v in norm-compact sets. Use the neighborhood net and compare choices. In dimension zero G is discrete; identify the unit test at e as `1_{e}/μ({e})` and treat smoothing and factorization directly.

*Needs:* Layers 0.1,1.1,1.2; native smooth bumps and continuity of the orbit.

The test-space and integrated-operator API includes:

- Addition, scalar multiplication, translation, inversion and zero extension preserve tests with the indicated transformed compact supports; fixed-support inclusions and derivatives are continuous.
- The locally convex final topology is characterized by continuity on every fixed-support space; compact support, not a global countable exhaustion, controls each integral.
- The integrated map is linear in the test and the vector, commutes with continuous intertwiners, and respects convolution in the stated order.
- The smooth mass-one kernels form a neighborhood net and approximate identity on norm-compact sets of vectors.

**Checks.**

- On ℝ a nonzero compact bump is a test, whereas 1 has noncompact support and |x| is not smooth at 0. The zero test has empty support and integrates to 0.
- On a discrete group with μ({1})=2, the convolution unit is 1₍₁₎/2: its square at 1 is (1/2)²·2=1/2. An unnormalized characteristic function squares to 2·1₍₁₎.
- Translating a bump supported in [−1,1] to centres n gives support [n−1,n+1]; all derivatives eventually vanish on any fixed compact, but this nonzero sequence does not converge to 0 in the test final topology.
- For K=∅ or K={0} in ℝ, D_K={0}: a continuous function vanishing off a point also vanishes at that point. For K=[−1,1] a bump is nonzero, and changing its support to [2,4] excludes it from D_K.
- In a fixed-support space on ℝ, the sequence sin(nx)/n times a bump equals O(1/n) in degree zero, while its first derivative at an interior point where the bump is 1 can equal 1. Uniform convergence alone is insufficient.
- In the affine group (a,b)(a′,b′)=(aa′,b+ab′), left Haar is da db/a². Right translation by (a₀,0) multiplies the integral by a₀, so c(a₀,0)=a₀; the smooth chart density is a⁻²>0.
- For counting measure on S₃, `δ_s*δ_t=δ_(st)`; with s=(12),t=(23), st and ts are different three-cycles. This detects reversed convolution order.
- In a trivial action on the scalar line, an integral-one kernel sends 1 to 1, an integral-zero kernel sends it to 0, and a kernel supported away from 1 cannot serve all shrinking identity neighborhoods. This tests mass and localization separately.
- On a group with uncountably many discrete components, every compact subset meets finitely many cosets of the chosen open subgroup; finite support still gives a finite integral, without global σ-finiteness.

### Examples

Discrete groups, the affine group and S₃ pin the mass, modular factor and convolution order.

### Dependencies

Layer 0 compact operator bounds; LieGroups Layer 0 charts; AutomorphicFormsOnReductiveGroups §0.1a; BanachAlgebras A7; native tests, smooth bump functions and Bochner integration.

## Layer 2: Orbit regularity and the smooth-vector topology

### 2.1 Finite regularity and real smooth topology

AutomorphicFormsOnReductiveGroups §2.7 supplies the complex all-order statement. The real and finite-k extensions below use its topology and the native closed-generator interface (Casselman, p.1, for iterated domains and the Fréchet topology).

For real coefficients define E^k by `ContMDiff I 𝓘(ℝ,E) k (fun g=>π(g)v)`, and E∞ by k=∞. The predicate `IsLieSmoothVector` and the algebraic submodule `lieSmoothVectors` express this on native carriers over either field. They are AutomorphicFormsOnReductiveGroups §2.7's `IsLieSmoothVector` and `lieSmoothVectors` with the scalar field generalized from ℂ to 𝕜=ℝ or ℂ; at 𝕜=ℂ they are §2.7's definitions, so the library has one declaration of each, at this generality, and no identification lemma between two names. Show these are invariant 𝕜-subspaces. For any basis `(X_i)` of the real Lie algebra prove that v∈E^k exactly when all composable basis words of length≤k are defined; for E∞ use all finite lengths. For E∞ this is Casselman's inductive description of the smooth vectors (Casselman, p.1); the finite-k criterion is this roadmap's own, proved by the frame argument of the next paragraph. Prove equivalence with the quantification over arbitrary X's, and independence of the chosen basis. State the finite-k result for natural k, including k=0, where strong continuity gives E^0=E. Pure powers in separate basis directions are not a replacement for mixed words.

For the finite-k extension over either field prove the analytic bridge in that equivalence. A continuous Banach-valued function with continuous derivatives along a smooth frame is C¹: in charts, interpret frame derivatives as distribution derivatives by curve integration and integration by parts, invert the smooth frame coefficient matrix, and use Euclidean mollifiers plus the Banach-valued fundamental theorem of calculus to recover the coordinate derivative. Prove this lemma using native chart/test/distribution and Bochner APIs, including its Banach-valued/weak-pairing comparison. Iterate it on `g↦π(g)A_w v`. Conversely differentiate a smooth orbit along the invariant frame. This proves linearity in X and the mixed-word dictionary without assuming unproved invariance of generator domains under Ad(G).

For the real extension, with the complex topology supplied by §2.7, put

`p_m(v)=Σ_(basis words w, |w|≤m) ‖A_w v‖`.

Use a type synonym of the algebraic smooth submodule carrier for its stronger topology; transport the module structure and retain a separate continuous inclusion into E. Do not inherit the ambient norm topology as the smooth topology. Use native `Seminorm` and `WithSeminorms` for this topology. Prove it is Hausdorff, metrizable, locally convex and complete, and prove the continuous injective inclusion E∞→E (Bernstein–Krötz, Lemma 2.15, p.10, completeness through the identification of E∞ with the G-invariant smooth E-valued functions, and Remark 2.13(a), p.10, independence of the basis up to equivalence of seminorms). Identify this topology with the initial topology of all word evaluations into E, and with uniform-on-compact orbit-derivative seminorms. For completeness, Cauchy limits of each word coordinate are linked successively by closedness of each first-order A_X; no closedness of arbitrary E-operator products is used. Give equivalent seminorms from U(𝔤), once Layer 3 is built, with explicit finite-order comparison constants.

E∞ is a Fréchet space and need not be normable. Do not give it a fictitious norm in order to apply normed-manifold `ContMDiff`. For maps from finite-dimensional manifolds into E∞ define smoothness through the E-valued word-coordinate maps and prove the corresponding derivative/chain/product rules and equivalence with smoothness in the compatible locally convex calculus. The action on E∞ is jointly continuous and these orbit maps are smooth in that sense; its composition with E∞→E agrees with the original smooth orbit. This coordinate criterion is the calculus interface used in Layer 5–Layer 8.

*Needs:* Layer 0 closed generators; Layer 1 localized tests; AutomorphicFormsOnReductiveGroups §2.7 complex topology and domain criterion; native Seminorm and WithSeminorms.

The real smooth carrier and topology have the following API, identified with the supplied complex API after scalar comparison:

- Addition, scalar multiplication and the G-action preserve every E^k; the smooth inclusion into E is continuous and injective.
- Each word evaluation is continuous for the smooth topology, and the topology is initial for these evaluations and independent of the basis.
- Closed-generator compatibility makes coordinatewise Cauchy limits a smooth vector; compact-open derivative seminorms give the same topology.
- A map into the smooth space is smooth in the locally convex sense exactly when all its E-valued word coordinates are smooth.

**Checks.**

- For a trivial action every positive word vanishes, so p_m(v)=‖v‖ and E^k=E for every k, including 0. For the zero space each seminorm is 0.
- In C(S¹) with rotations, v_n(x)=exp(inx)/n has p₀=1/n and p₁=1/n+1; convergence in the ambient norm is not convergence in the smooth topology.
- In the same model exp(ix) has p_m=m+1 for the basis ∂x; after replacing that basis by 2∂x it has p_m=2^(m+1)−1. The topologies agree, not the individual seminorms.
- For the L² step function of Layer 0, E⁰ membership holds but E¹ membership fails since 2/|t| diverges. This tests both directions of the finite-domain criterion.

### Examples

Trivial actions and circle modes distinguish the smooth topology from the norm topology.

### Dependencies

Layer 0 closed generators; Layer 1 localized tests; AutomorphicFormsOnReductiveGroups §2.7 complex topology and domain criterion; native Seminorm and WithSeminorms.

## Layer 3: Differentiated actions and integration by parts

The complex core is imported from AutomorphicFormsOnReductiveGroups §2.7. The extensions and sign comparisons below follow by differentiating the integrated action in Casselman, p.1; the nonunimodular right formula is derived from BanachAlgebras A7’s stated modular convention.

### 3.1 Real Lie and enveloping action

For real E, extending §2.7, on E∞ construct `dπ : 𝔤 →ₗ⁅ℝ⁆ Module.End 𝕜 E∞`, continuous in X and with each dπ(X) continuous for the Fréchet topology. Prove additivity, real scalar linearity and `[dπ(X),dπ(Y)]=dπ([X,Y])`, by differentiating the smooth action and LieGroups' bracket convention. Give the estimates `p_m(dπ(X)v)≤C_X,m p_(m+1)(v)`. Identify the complex case with §2.7’s complexified Lie action and extend through the native universal property to U(𝔤) or U(𝔤_ℂ); prove multiplication order, unit, filtration and ordered-word compatibility. Only the existing algebraic enveloping universal property and finite word spanning are needed, not highest-weight representation theory.

*Needs:* Layer 2 real smooth topology; AutomorphicFormsOnReductiveGroups §2.7; LieGroups Layer 0 bracket; native enveloping universal property.

### 3.2 Conjugation and restriction

Prove `π(g)dπ(X)π(g)⁻¹=dπ(Ad(g)X)` on E∞, its mixed-word form and locally uniform bounds for π(g):E∞→E∞. The covariance is this roadmap's own: it is the derivative at t=0 of `π(g)π(exp(tX))π(g)⁻¹=π(exp(t·Ad(g)X))`, the conjugation formula for one-parameter subgroups of LieGroups Layer 1, and Bernstein–Krötz, Remark 2.18, p.12, uses the same comparison of left and right derivatives through Ad for the regular representation. Prove full G-invariance even when G is disconnected. Natural restriction to open subgroups identifies the same smooth vectors/topology; restrictions to general Lie subgroups give the continuous inclusion and the derived-action comparison, without asserting equality of smooth-vector spaces.

*Needs:* Layer 3.1; LieGroups Layer 1 Ad; Layer 2 word seminorms.

### 3.3 Smoothing and derivative estimates

Extend §2.7 smoothing to real coefficients and the general tests of Layer 1, with all mixed derivatives of π(f)v by differentiating the translated test. Explicitly,

   `dπ(X)π(f)v=π(−R_X f)v`,
   `dπ(X₁)⋯dπ(X_r)π(f)v=π((−R_X₁)⋯(−R_Xr)f)v`.

   In the second formula operator composition is read right to left on both sides. Prove the anti-bracket law for R and the resulting Lie homomorphism for −R. For fixed support K, give all bounds `p_m(π(f)v)≤C_K Σ_(|w|≤m) ‖(−R)_w f‖₁ ‖v‖`; hence fixed-support smoothing is continuous into E∞. The headline `isLieSmoothVector_smear` establishes this for arbitrary v∈E and both coefficient fields.

*Needs:* Layers 1.1–1.4 and Layer 2; AutomorphicFormsOnReductiveGroups §2.7 smoothing with its L_X translated to R_X.

### 3.4 Modular integration by parts

For smooth v prove the other integration-by-parts formula

   `π(f)dπ(X)v=π(q_X f−L_X f)v`,
   `q_X=d/dt|₀ log c(exp(tX))`.

   Derive it from the stated modular change of variables; prove q is real linear, vanishes on brackets and agrees with `tr(ad X)` in this modular convention. In the unimodular case q=0. For star-algebra actions prove the distinct star-derivation law in Layer 8. State all integration-by-parts domains explicitly.

*Needs:* Layers 1.4,3.1; BanachAlgebras A7 modular convention; LieGroups Layer 1 for the adjoint trace.

The derived-action comparison API includes:

- Derived words act in right-to-left composition order; the empty word is identity and the enveloping unit acts as identity.
- Derived generators commute with intertwiners and transform by Ad under conjugation; each is bounded by the next smooth seminorm.
- Smoothing has the fixed-support word estimates and the two different left/right integration-by-parts identities displayed above.

**Checks.**

- On the affine group, L_H=a∂a and L_N=a∂b, whereas R_H=a∂a+b∂b and R_N=∂b. Thus [L_H,L_N]=L_N and [R_H,R_N]=−R_N; applying both R_H and L_H to b gives b and 0 respectively. This also pins the supplier’s L_X as this roadmap’s R_X.
- With c(e^t,0)=e^t, q_H=1=tr(ad H), q_N=0 and q_[H,N]=0. Integration of L_H f against da db/a² gives ∫f, so ∫(q_H f−L_H f)=0 for the trivial action.
- For π(t)x=e^t x and a compact test f, −∫f′(t)e^t dt=∫f(t)e^t dt, fixing the minus sign in smoothing; q=0 on ℝ.
- The matrices H,N of Layer 0 satisfy [H,N]v=(1,0)=Nv; reversing the bracket would give (−1,0).

### Examples

The affine group and the exponential character fix both derivative conventions and the modular correction.

### Dependencies

Layers 1–2; LieGroups Layers 0–1 bracket and Ad; AutomorphicFormsOnReductiveGroups §2.7; BanachAlgebras A7 modular convention; native enveloping universal property.

## Layer 4: Density and smoothing in the complete topology

### 4.1 Real approximation and compact-finite comparison

The complex approximation is supplied by AutomorphicFormsOnReductiveGroups §2.7 (Casselman, p.1, for norm density). The real comparison uses complexification and projection as follows.

Prove π(u_U)v→v in every p_m when v∈E∞, using the Ad-covariance bounds and local uniform strong continuity on the finitely many word coordinates. For real E this extends §2.7; for complex E identify its supplied approximation with the general test construction. Thus the net converges in the Fréchet topology as well as in E. For arbitrary v∈E, Layer 1 and Layer 3 give smooth approximants converging in norm, so E∞ is dense (`lieSmoothVectors_dense`, with both coefficient fields). Prove the uniform-on-compact refinement in E∞ and independence of the smooth approximate identity. Identify native one-parameter `StronglyContinuousSemigroup.smoothVectors`, for the forward semigroup `toSemigroup` of `ContRepresentation.toStronglyContinuousGroup`, with this definition when G=(ℝ,+); the two-sided orbit derivatives come from pinned `StronglyContinuousGroup.hasDerivAt`. Keep this comparison separate from the many-direction frame proof.

For compact Lie G use the supplied finite-orbit-span predicate and AutomorphicFormsOnReductiveGroups §2.7 complex smooth-topology density, through §2.1 and the CompactGroups gap. For real E, use the actual `TauCeti.Complexification E` with `ContinuousLinearMap.complexify` to extend the action, and `ofRealLI`/`reCLM` to include and project. The product-topology comparison proves strong continuity of the complexified action. A finite-dimensional complex orbit span is finite-dimensional over ℝ, and its real-part image contains the real orbit span of the projected vector. Hence projection of complex G-finite approximants gives real G-finite approximants, with the native real-part norm bound. Prove that these maps commute with every derived word and are continuous for the smooth seminorms, so the same adapter applies to the stronger topology. This is the real specialization of the shared theorem, not another predicate or generic complex density owner. For the real extension every G-finite vector is smooth, because its finite-dimensional invariant span carries a continuous homomorphism of G into the units of its real endomorphism algebra, which is smooth by Tau Ceti's automatic-smoothness theorem `TauCeti.Lie.contMDiff_of_continuous_monoidHom`. Transport the supplied compact-finite smooth-topology density to real E. A direct route to the real comparison is: first smooth with f, then approximate f in the finitely many invariant-derivative L¹ seminorms by representative functions, by convolving a Peter–Weyl uniform approximation on the side where derivatives remain on f. Prove those derivative and support formulas; uniform C(G) density alone is not used as a C∞ approximation theorem. This comparison does not enter generic compact-group G-finite density.

*Needs:* Layers 1–3; AutomorphicFormsOnReductiveGroups §§2.1,2.7; CompactGroups Layer 5 and its declared gap; native complexification; Tau Ceti `TauCeti.Lie.contMDiff_of_continuous_monoidHom` and Mathlib's Lie group structure on the units of a complete normed algebra.

The real approximation API includes convergence in each word seminorm, uniformity on compact subsets of the smooth space, and compatibility with complex inclusion and real-part projection.

**Checks.**

- In a trivial action, every mass-one kernel sends v to v; the approximation error in each p_m is 0.
- For rotation on C(S¹), a character exp(inx) has one-dimensional orbit span and is smooth; a smooth Fourier series with infinitely many nonzero frequencies has infinite orbit span. Finite Fourier sums approximate it in every derivative seminorm.
- For K=∏ C₂ acting on C(K,ℂ), a function depending on r coordinates has orbit span of dimension at most 2^r, and finite-coordinate functions approximate every continuous function uniformly. K is not discrete and has zero-dimensional identity component, so it is not Lie; only the generic compact density supplier applies.
- The real projection sends z=x+iy to x, with ‖x‖≤‖z‖; on a fixed real vector, projection after inclusion is x, not 2x or 0. Applied to complexified rotations it recovers the two-dimensional real span of sin and cos.

### Examples

Circle modes and the profinite product of C₂ separate the Lie comparison from the compact-group supplier.

### Dependencies

Layers 1–3; AutomorphicFormsOnReductiveGroups §§2.1,2.7; CompactGroups Layer 5 and its declared gap; native complexification; Tau Ceti automatic smoothness.

## Layer 5: The one-variable factorization engine

### 5.1 Scalar parametrix and passage to vectors

The scalar targets refine Casselman, Lemmas 4.1–4.2, pp.9–10, and Lemma 5.1, p.12; the vector passage expands the proof of Proposition 6.1, p.13. The simultaneous bounds and Banach-norm comparison are explicit proof obligations below.

The headline `scalarParametrix` states the scalar existence and convergence theorem on native `TestFunction` and `Distribution`: for every ε>0 and β:ℕ→ℝ positive at every n≥1, there are α:ℕ→ℝ positive at every n≥0 and real smooth tests g,h supported in [−ε,ε], with α_n≤β_n for n≥1, whose alternating even-derivative partial sums converge to δ₀+[h] in the native compact-convergence topology. Here [g] is `Distribution.ofFun` with Lebesgue measure, δ₀ is `Distribution.delta 0`, and D is `Distribution.lineDerivCLM (1 : ℝ)` at infinite order. Smooth compact support ensures local integrability, so [g] is integration against g, not the zero value assigned to non-locally-integrable functions. The fixed-support strong-dual comparison and vector passage below are additional targets.

Prove the analytic lemma used by full Dixmier–Malliavin, rather than treating it as an unnamed supplier. For ε>0 and arbitrary positive numbers β_n (n≥1), construct positive α_n with α_n≤β_n (n≥1) and g,h∈C_c∞(ℝ) supported in [−ε,ε], such that

`(Σ_(n≤N) (−1)^n α_n δ^(2n))*g → δ+h`

in the space of compactly supported distributions, with all partial supports in one fixed compact. The tests g,h are real valued, so the engine acts directly on real Banach spaces as well: the even real Fourier reciprocal and real cutoff give a real Fourier inverse and a real remainder. There is no upper restriction on α₀. Use native `TemperedDistribution` with its pointwise topology for the Fourier stage, native `Distribution` with compact-convergence topology for tests, and prove the fixed-support extension/restriction comparisons to C∞ duals used here. A native pointwise topology is not a strong-dual theorem. Use the Fourier convention `f̂(y)=∫exp(−2πixy)f(x)dx`; absorb `(2π)^(−2n)` into the freely selected α_n consistently.

Build the whole proof API: rapidly increasing λ_j with λ_(j+1)≥2λ_j; convergence and coefficient estimates of the entire product `∏(1+z²/λ_j²)`; positivity and arbitrarily small prescribed nonconstant even coefficients; Schwartz reciprocal on ℝ and its Fourier transform; the partial-multiplier bound 0≤(Σ_(n≤N)a_n y^(2n))/∏(1+y²/λ_j²)≤1; tempered-distribution convergence to 1; Fourier transport to the δ identity; smooth cutoffs; uniform derivative estimates on the cutoff tail; and smooth convergence of that tail to h. Establish coefficient selection simultaneously for the supplied bounds and all derivative estimates by a countable diagonal construction. In bounding `λ^(r+1)e^(−2πλ)`, split at its maximum `(r+1)/(2π)`, rather than assuming global monotonicity. Rescale to the prescribed support. Use Mathlib/TauCeti Fourier, Schwartz, test and distribution APIs, building each missing product/estimate/compact-distribution comparison here.

Own the distribution-to-vector passage. For a fixed smooth orbit and common compact support, the scalar tests obtained by pairing its localized E-valued orbit with the dual unit ball form a relatively compact subset of scalar C∞ in the compact-open derivative topology: apply scalar Arzelà–Ascoli on each derivative level and a diagonal argument, using one additional bounded derivative. Distributional convergence with a fixed support has an equicontinuous finite-order bound, so convergence is uniform on that compact test family. Hahn–Banach then gives convergence in E norm. Apply the same argument to each word-coordinate orbit to obtain convergence in every p_m. Give the cutoff and sign of integration of δ^(r) against the orbit explicitly. Weak scalar distribution convergence alone is not silently upgraded to Banach-norm convergence.

For X and finitely many smooth vectors, choose the α_n so that all series

`η=Σ_(n≥0) (−1)^n α_n A_X^(2n)v`

converge in E∞. With g,h as above obtain

`π_X(g)η=v+π_X(h)v`, hence `v=π_X(g)η−π_X(h)v`,

where `π_X(g)=∫g(t)π(exp(tX))dt`. Both inner vectors are smooth. The coefficients, even-derivative signs and the signs in this equality are part of the interface. Prove simultaneous choices for any finite family of vectors and all their countably many seminorm bounds.

*Needs:* Layers 1–3 fixed-support tests, complete smooth topology and word calculus; native Fourier/Schwartz/distribution APIs; scalar Arzelà–Ascoli, uniform boundedness and Hahn–Banach.

The scalar-parametrix API includes arbitrary positive bounds on every nonconstant coefficient, simultaneous choices for finitely many smooth vectors, arbitrarily small prescribed supports, fixed-support distribution convergence and convergence of the resulting vector series in every word seminorm.

**Checks.**

- The scalar partial sums at N=0 and N=1 are α₀[g] and α₀[g]−α₁D²[g]. A compactly supported test equal to 1 near [−ε,ε] pairs with either sum as α₀∫g and with the limit as 1+∫h. Omitting the n=0 term would instead give 0 on the left.
- At ε=0, smooth functions supported in {0} are zero, so the proposed limit would read 0=δ₀, contradicted by a test taking value 1 at 0. The strict positivity of ε excludes this case; β₀ can be 0 or negative because no bound on α₀ uses it.
- On the exponential orbit e^t v, A^(2n)v=v. Pairing δ^(2n) with that orbit gives v, so the vector series coefficient remains (−1)^nα_n; dropping the alternating sign changes the n=1 term from −α₁v to +α₁v.
- At frequency y=0 the partial/full multiplier ratio is 1; for y real it lies in [0,1] because all coefficients are positive and the partial sum omits positive terms. At N=0 and y≠0 it is strictly below 1.
- For r=0, λe^(−2πλ) has derivative e^(−2πλ)(1−2πλ), positive at λ=1/(4π) and negative at λ=1/π; its maximum is at 1/(2π). A globally decreasing bound is false.
- If α₁≤β₁ and α₁D₃≤1 are both required with β₁=1/10,D₃=100, α₁ must be at most 1/100; taking the maximum 1/10 violates the second bound by giving 10. Coefficient selection uses simultaneous upper bounds.
- For X=0, η=α₀v and the identity reduces to α₀(∫g)v=(1+∫h)v. No bound on α₀ is asserted; forcing α₀≤β₁ would add an unsupported condition.
- Scalar weak convergence alone fails to give norm convergence: in ℓ², e_n converges weakly to 0 while ‖e_n‖=1. The fixed-support equicontinuity and compact dual-paired orbit family are essential to the passage above.

### Examples

The exponential character tests the alternating coefficients, while the ℓ² basis tests the passage from scalar to norm convergence.

### Dependencies

Layers 1–3 fixed-support tests, complete smooth topology and word calculus; native Fourier/Schwartz/distribution APIs; scalar Arzelà–Ascoli, uniform boundedness and Hahn–Banach.

## Layer 6: Full Dixmier–Malliavin with support control

### 6.1 Prescribed-support factorization

Casselman, Proposition 6.1, p.13, supplies the support-controlled vector theorem. The real coefficients and unrestricted-component case follow by the Layer 5 real construction and Layer 1 open-subgroup localization. The function-support refinement is proved by retaining the fixed-support derivative spaces at each step.

The headline `dixmierMalliavin` states, for either coefficient field, that for every v∈E∞ and every open identity neighborhood U there exists a finite family `f_j∈D(G)`, `v_j∈E∞`, with `tsupport(f_j)⊆U` and

`v=Σ_j π(f_j)v_j`.

The empty sum handles v=0. No common bound on the number of terms is needed in the public interface, and no one-term factorization is asserted.

For an ordered basis X₁,…,X_d of the Lie algebra define the exponential-product map ℝ^d→G,

`Φ(t₁,…,t_d)=exp(t₁X₁)⋯exp(t_dX_d)`.

Prove that Φ is smooth, from Tau Ceti `contMDiff_oneParameterSubgroup` and smoothness of multiplication; that Φ(0)=1; and that its manifold derivative at 0 sends t to Σ_i t_iX_i under LieGroups' identification of the Lie algebra with the tangent space at 1, since the i-th partial derivative at 0 is the velocity of t↦exp(tX_i). As (X_i) is a basis this derivative is a linear isomorphism, so Φ is a local diffeomorphism at 0 by `TauCeti.isLocalDiffeomorphAt_of_mfderiv_eq`, as in the pinned two-factor chart. Casselman's proof of Proposition 6.1, p.13, uses this chart when it treats an iterated convolution of line measures as smooth on the image of exp(ℝX₁)exp(ℝX₂).

Prove `dixmierMalliavin` by applying Layer 5 successively along X₁,…,X_d to the finite family of inner smooth vectors at each step. Choose a box around 0 so small that Φ is a diffeomorphism from it onto an identity neighborhood and maps the closed supporting box into U. Each final branch is an ordered convolution of d compactly supported line measures. If `Φ*μ=J(t)dt`, Layer 1 gives smooth J>0 and the resulting density on G is

`f(Φ(t))=(∏_i g_i(t_i))/J(t)`,

extended by zero. Prove its smoothness and support, including a compact margin inside the chart, and prove the exact equality between the iterated integrated operators and π(f). Treat d=0 by Layer 1's discrete unit test. For a group with many components use the open σ-compact subgroup from Layer 1 and extension by zero; E∞ for that subgroup equals E∞ for G, since left cosets are open and orbit maps there are fixed bounded linear transforms of the local orbit.

Deduce the two exact algebraic equalities, not merely closure equalities:

`E∞=span{π(f)v : f∈D(G), v∈E}`
`   =span{π(f)v : f∈D(G), v∈E∞}`.

These identify the Gårding domain with the smooth vectors and keep the witnesses of finite sums and prescribed supports.

The headline `dixmierMalliavin_function` is the function version: every φ∈D(G) is a finite sum `Σ_j f_j*h_j`, with tsupport(f_j)⊆U and tsupport(h_j)⊆tsupport(φ). In this proof the terminal factors are limits of series of derivatives of φ in a fixed-support smooth function space; derivatives and that topology retain tsupport(φ). Track these terminal factors through the basis iteration rather than appealing to an arbitrary orbit translate. Compare convolution densities with the vector statement. Prove continuity and intertwiner compatibility of each integrated factorization expression; no continuous global choice of factorizations is required.

*Needs:* Layers 1,2,3,5; for the exponential-product chart, Tau Ceti `oneParameterSubgroup`, `contMDiff_oneParameterSubgroup` and `TauCeti.isLocalDiffeomorphAt_of_mfderiv_eq`, Mathlib smooth multiplication and LieGroups Layer 0 for the tangent space at 1; Haar chart-density comparison of Layer 1.

The exponential-product chart is smooth, sends 0 to 1, has derivative t↦Σ_i t_iX_i at 0 and is a local diffeomorphism there. The factorization API retains finite sums, prescribed first-factor support, smooth inner vectors, finite-family choices and naturality under continuous intertwiners; it asserts neither one factor nor a continuous choice of factors.

**Checks.**

- v=0 and φ=0 admit n=0, with empty sum 0 and no support obligations.
- On the trivial group of Haar mass 2, f(1)=1/2 and w=v give π(f)w=v. For functions take h=φ; convolution also gives φ, including when φ=0.
- In an abelian product chart with constant Haar density J=2, dividing the product kernel by J gives integral ∏∫g_i; omitting the divisor doubles it. J is positive, so division has no zero denominator.
- On the affine group of Layer 1, with H=diag(1,0) and N=E₁₂ of Layer 0, exp(tH)=(e^t,0) and exp(sN)=(1,s). In the order (H,N), Φ(t)=(e^(t₁),e^(t₁)t₂) has Jacobian determinant e^(2t₁), equal to 1 at 0, and pulls da db/a² back to dt₁dt₂, so J≡1. In the order (N,H), Φ(s)=(e^(s₂),s₁) and J(s)=e^(−s₂). The density depends on the order of the basis, so it cannot be dropped from f(Φ(t)).
- On ℝ² with X₁=X₂=e₁, which is not a basis, Φ(t)=(t₁+t₂,0) has derivative of rank 1 at 0 and is not a local diffeomorphism; the basis hypothesis of the chart is needed. For d=1, Φ(t)=exp(tX₁) is the exponential chart in the coordinate t.
- A derivative of a bump supported in [−1,1] still has topological support in [−1,1], and a limit in that fixed-support smooth space vanishes at 2. Translating the bump by 3 would instead allow a nonzero value at 3 and cannot justify the function-support refinement.

### Examples

Zero vectors, the one-point group, constant-density product charts and the two orders of the affine exponential-product chart test the finite sum, the support normalization and the Haar density.

### Dependencies

Layers 1,2,3,5; Tau Ceti one-parameter subgroups and the manifold inverse function theorem for the exponential-product chart; LieGroups Layer 0; Haar chart-density comparison of Layer 1.

## Layer 7: Functorial operations and exactness

These are consequences of the factorization in Casselman, Proposition 6.1, p.13, and the specified tensor universal properties. The proofs below give the additional quotient-topology, scalar and dense-range conclusions; no tensor isomorphism is inferred from factorization.

### 7.1 Intertwiners and subspaces

Every native continuous intertwining map T:E→F restricts to a continuous linear map E∞→F∞ commuting with π(f), dπ and U(𝔤). Prove identity, composition and isomorphism laws, including restriction-of-scalars compatibility. For a closed invariant subspace M, with the pinned `ContRepresentation.subrepresentation` (its orbits are continuous because the inclusion is an isometry), prove `M∞=M∩E∞`, with the induced smooth topology.

*Needs:* Layers 1–3 integrated operators, word domains and smooth topology; native continuous intertwiners; Tau Ceti `ContRepresentation.subrepresentation`.

### 7.2 Quotient lifting

On the Banach quotient E/M by a closed invariant subspace use the pinned `ContRepresentation.quotient`, and prove only that its orbits are continuous, which follows from continuity of the quotient map. The headline `smooth_lift` proves lifting through every surjective continuous intertwiner between strong Banach representations; in particular prove surjectivity of `E∞→(E/M)∞` using Layer 6: factor a quotient smooth vector, lift each inner vector arbitrarily to E, and smooth those lifts with the same kernels. Prove the resulting short sequence of smooth spaces is exact, with the kernel topology just identified. This proves lifting without assuming differentiability of arbitrary linear lifts or a complemented M. For the quotient-topology comparison apply the Fréchet open mapping theorem of LocallyAnalyticDistributions §0.2, at K=𝕜=ℝ or ℂ, to the smooth quotient map E∞→(E/M)∞: it is a continuous linear surjection between Hausdorff complete metrizable spaces whose topologies are given by the countable word-seminorm families of Layer 2, hence open, so (E/M)∞ carries the quotient topology of E∞/M∞. A normed-space open mapping theorem alone does not apply to E∞.

*Needs:* Layers 0.1,7.1 and 6; Banach quotients and Tau Ceti `ContRepresentation.quotient`; LocallyAnalyticDistributions §0.2 (Fréchet open mapping), at ℝ and ℂ.

### 7.2a Scalar comparisons of locally convex projective tensors

The completed projective tensors E⊗̂ℝF of real and E⊗̂ℂF of complex Hausdorff locally convex spaces are NoncommutativeGeometry N1's, on the pinned `TauCeti.CompletedProjectiveTensorProduct` at 𝕜=ℝ and at 𝕜=ℂ, with N1's cross property, universal property, Fréchet completeness and comparison with B4. This section builds no tensor product and proves no law of one. It owns the two maps that compare the real and complex tensors. They are this roadmap's own; each is induced by the universal property of the completed projective tensor (Grothendieck 1952, Chapitre I, n° 1, Théorème 1, p.76, and the completed product with its universal property for complete targets, p.77), in its pinned form `CompletedProjectiveTensorProduct.liftEquiv`, and each is identified by its values on pure tensors through `CompletedProjectiveTensorProduct.continuousLinearMap_ext`.

For real Fréchet E and F let E_ℂ be the complexification E×E of `TauCeti.Complexification` with its product topology. Construct the complex-linear topological isomorphism `(E⊗̂ℝF)_ℂ ≃ E_ℂ⊗̂ℂF_ℂ` sending (x⊗y)⊗1 to (x⊗1)⊗(y⊗1): the forward map is the complex-linear extension of the continuous real-linear map induced by the real-bilinear (x,y)↦(x⊗1)⊗(y⊗1), the inverse is induced by the complex universal property from the continuous complex-bilinear map `(x+ix′, y+iy′) ↦ (x⊗y−x′⊗y′)⊗1 + i·(x⊗y′+x′⊗y)⊗1`, and both composites are the identity on the dense span of pure tensors. Prove naturality in E and F and compatibility with the flip and associativity. For complex Fréchet E and F construct the continuous real-linear balancing map `E_ℝ⊗̂ℝF_ℝ → (E⊗̂ℂF)_ℝ` induced by (x,y)↦x⊗y. Prove that for continuous seminorms p,q of E,F the complex projective seminorm is the quotient seminorm of the real one by the span of the elements ix⊗y−x⊗iy, since a complex representation is a real representation of the same cost and a real representation of a lift is a complex representation of the same cost; hence the algebraic balancing map is a topological quotient map. Prove that for a metrizable locally convex space X, a subspace N, the Hausdorff completion X̂ and the closure N̄ of N in X̂, the canonical map from the Hausdorff completion of X/N to X̂/N̄ is a topological isomorphism: X̂/N̄ is complete by Mathlib's `QuotientAddGroup.completeSpace_right`, since X̂ is first countable, it is Hausdorff because N̄ is closed, and the separated quotient of X/N embeds in it densely with the same quotient seminorms. Hence the balancing map is surjective with kernel the closed span of the elements ix⊗y−x⊗iy, and the induced real-linear bijection from that quotient is a topological isomorphism; no open mapping theorem is used. For complex Banach E and F the realifications are Banach, so through N1's comparisons with B4 over ℝ and over ℂ the balancing map is a continuous real-linear map from B4's real completed Banach tensor E_ℝ⊗̂ℝF_ℝ to the realification of B4's complex completed Banach tensor E⊗̂ℂF, induced by (x,y)↦x⊗y; prove that on these factors it is surjective with kernel the closed span of the elements ix⊗y−x⊗iy and that the induced bijection is isometric for the two projective norms, since the complex projective norm is the quotient norm of the real one. Prove that both scalar-comparison maps are natural in continuous linear maps of the factors. Neither scalar comparison uses a smooth-vector theorem.

*Needs:* NoncommutativeGeometry N1 over ℝ and over ℂ (cross property, universal property, Fréchet completeness, comparison with B4); Tau Ceti `CompletedProjectiveTensorProduct.liftEquiv`, `CompletedProjectiveTensorProduct.continuousLinearMap_ext`, `CompletedProjectiveTensorProduct.reindex` and `TauCeti.Complexification`; native `TensorProduct` and `UniformSpace.Completion`; BanachSpaceTheory B4; Mathlib `QuotientAddGroup.completeSpace_right` for the completed quotient in the balancing isomorphism.

The scalar-comparison API includes the complexification isomorphism with its pure-tensor formula, its naturality in both factors and its compatibility with the flip and associativity, and the balancing quotient with its kernel, its induced topological isomorphism, its isometric Banach case and its naturality.

**Checks.**

- For E=F=ℝ, ℝ⊗̂ℝℝ=ℝ and the complexification isomorphism sends (1⊗1)⊗1 to 1⊗1 in ℂ⊗̂ℂℂ=ℂ; a map rescaling pure tensors by a constant c≠1 would send it to c.
- In the same case the bilinear map defining the inverse sends (i,i), that is x=y=0 and x′=y′=1, to (0−1)·(1⊗1)⊗1=−(1⊗1)⊗1, matching i⊗i=i²(1⊗1)=−1 in ℂ⊗ℂℂ. With x⊗y+x′⊗y′ in place of x⊗y−x′⊗y′ the value would be +(1⊗1)⊗1, which is not complex-bilinear: it must equal i times the value i·(1⊗1)⊗1 at (1,i).
- For E=ℝ² and F=ℝ³ the complexification isomorphism matches (ℝ²⊗ℝℝ³)_ℂ, of complex dimension 6, with ℂ²⊗ℂℂ³, of complex dimension 6, and sends (e₁⊗e₁)⊗1 to (e₁⊗1)⊗(e₁⊗1). The balancing map for the complex spaces ℂ² and ℂ³ goes from ℂ²_ℝ⊗ℝℂ³_ℝ, of real dimension 4·6=24, onto (ℂ²⊗ℂℂ³)_ℝ, of real dimension 12, so its kernel has real dimension 12: the two comparisons are different maps.
- For E=F=ℂ viewed over ℝ, ℂ_ℝ⊗ℝℂ_ℝ has real dimension 4 and ℂ⊗ℂℂ=ℂ has real dimension 2; the balancing map sends i⊗1 and 1⊗i both to i and 1⊗1 and i⊗i to 1 and −1, so its kernel is spanned by i⊗1−1⊗i and 1⊗1+i⊗i, of real dimension 4−2=2, and it is a quotient, not an isomorphism; the quotient norm of 1 is 1, the cost of the lift 1⊗1, which equals |1|.
- For the Banach spaces E=F=ℂ, identify ℂ_ℝ with Euclidean ℝ² by 1↦e₁, i↦e₂, so that the real projective norm is the trace norm of the 2×2 matrix of a tensor. Then 1⊗i−i⊗1 is the rotation matrix with rows (0,1) and (−1,0), of singular values 1 and 1, so its real projective norm is 2 while its image i−i is 0; and 1⊗i has real projective norm 1 and image i of norm 1, as the isometry of the induced bijection requires.

### 7.3 Smooth tensor comparison

Prove finite-product compatibility with the smooth topology. On the completed Banach projective tensor of two strong representations construct the diagonal strong action with local operator bounds, using B4's universal property. Pure tensors of smooth vectors are smooth and `dπ(X)(v⊗w)=dπ_E(X)v⊗w+v⊗dπ_F(X)w`. Prove the higher binomial/shuffle identities and continuity on the smooth spaces. These are this roadmap's own; their method is the product rule for a bounded bilinear map, `IsBoundedBilinearMap.contDiff` and `ContinuousLinearMap.hasFDerivAt_of_bilinear` in Mathlib, applied to (v,w)↦v⊗w along the orbit g↦π_E(g)v⊗π_F(g)w. For the completed locally convex projective tensor of the two smooth Fréchet spaces over 𝕜 consume NoncommutativeGeometry N1 at that 𝕜, ℝ or ℂ. Prove the smooth-pure-tensor bilinear map is jointly continuous by the shuffle seminorm bounds, then use that single universal property to construct its continuous linear map into the diagonal smooth space. Prove the map intertwines actions and derived words and commutes with realification/complexification through the scalar-comparison maps of §7.2a. The seminorm construction, Hausdorff completion and universal property are the pinned `TauCeti.CompletedProjectiveTensorProduct` and `CompletedProjectiveTensorProduct.liftEquiv`, with N1's laws over both fields; this section rebuilds none of them. No assertion of injectivity or isomorphism is made without approximation/nuclear hypotheses. Prove density of the span of smooth pure tensors in the diagonal smooth space: apply a smoothing kernel to norm approximants, choose the norm approximants with both tensor factors smooth, then approximate that smoothed smooth-pure-tensor integral in every finite collection of derivative seminorms by sums of translated smooth pure tensors. This identifies the needed dense range without a false tensor-isomorphism assertion.

*Needs:* Layers 0–4 word bounds and smooth approximation; BanachSpaceTheory B4; NoncommutativeGeometry N1 over ℝ and ℂ, with Tau Ceti `CompletedProjectiveTensorProduct.liftEquiv`; §7.2a for the scalar comparisons.

### 7.4 Continuous contragredients

For the continuous dual define the invariant subspace of functionals whose contragredient orbit g↦λ∘π(g⁻¹) is norm continuous, and prove it closed (Bernstein–Krötz, §3.1, p.13, from the equicontinuity of Lemma 2.3, p.6). Prove its strong action and apply Layer 0–Layer 6 there. Compare differentiated pairings and the negative transpose on the relevant common domains. Do not assert strong continuity on the entire Banach dual; the translation action on dual measures supplies a counterexample. For a strongly continuous one-parameter semigroup these are Phillips' theorems on the adjoint semigroup: the subspace of norm-continuous adjoint orbits is the closure of the domain of the adjoint generator, the adjoint semigroup is strongly continuous on it, and its generator is the largest restriction of the adjoint generator with domain and range in that subspace (Phillips, Definition 2.2, p.274, Theorem 2.1, p.275, Theorem 2.2, p.277). For the group the proofs are given here: closedness since a norm limit of norm-continuous orbits is norm continuous, uniformly on compacts by the Layer 0.1 local bound; strong continuity on the subspace by its definition; and the pairing by differentiating t↦λ(π(exp(−tX))x) at t=0, which gives `⟨dπ′(X)λ, x⟩ = −⟨λ, dπ(X)x⟩` for λ in the dual first-order domain and x∈E¹, the negative transpose. The sign is that of the one-parameter group t↦π(exp(−tX))ᵗ, whose generator is minus the transpose of dπ(X) restricted to the subspace, as in Phillips' identification of the adjoint generator.

*Needs:* Layer 0.1 local bounds; native continuous duals; Layers 0–6 applied to the norm-continuous contragredient subspace; Phillips' one-parameter theorems are the model, not a supplier.

The continuous-dual carrier is the subspace of E′ consisting of λ for which g↦λ∘π(g⁻¹) is norm continuous; local operator bounds prove it closed. Its API includes invariant closed linear structure, a strongly continuous action, natural dual intertwiners and the derivative pairing on the common domains. The tensor comparison has source the completed projective tensor of the two smooth Fréchet spaces and target the smooth space of the diagonal Banach tensor action; its pure-tensor values, continuity and dense range determine the claimed map.

**Checks.**

- For the trivial actions, projection ℝ²→ℝ lifts 1 to (1,0), and its smooth kernel is {0}×ℝ, exactly its ordinary kernel; the zero quotient lifts 0 to 0.
- The quotient comparison needs the word topology on the target. For the rotations (α_t f)(x)=f(x−t) on C(S¹) and M={0}, the smooth quotient map is the identity of C∞(S¹). The vectors f_n=sin(nx)/n have p₀(f_n)=1/n and p₁(f_n)=1/n+1, since the derivative along the basis vector is −cos(nx). So f_n→0 in the sup norm but not in p₁: the identity from C∞(S¹) with its word topology onto C∞(S¹) with the sup norm alone is continuous and bijective but not open. The open mapping theorem does not apply to that incomplete target.
- For π_E(t)=e^t and π_F(t)=e^(2t), the tensor orbit of 1⊗1 is e^(3t), so its derivative is 3=1+2; the second derivative is 9=1+4+4.
- On C(S¹)′, rotating δ₁ to δ_z gives ‖δ_z−δ₁‖=2 for z≠1; δ₁ is excluded from the continuous-dual carrier. Haar measure has constant orbit and is included, as is 0.
- If π(t)x=e^t x, the contragredient sends λ to e^(−t)λ, so its derivative pairs as −λ(x), the negative transpose. Identity intertwiners preserve every factorization unchanged.

### Examples

Real scalar characters, projection ℝ²→ℝ and translated point masses test exactness, tensors and the dual restriction; high circle modes test the smooth target topology of the quotient comparison.

### Dependencies

Layers 0–4 for maps, products, duals and tensor estimates; Layer 6 for smooth lifting; BanachSpaceTheory B4; NoncommutativeGeometry N1 for real and complex locally convex tensors and §7.2a for their scalar comparisons. LocallyAnalyticDistributions §0.2 (Fréchet open mapping), at ℝ and ℂ, for the quotient comparison of §7.2, which uses it independently of factorization; Tau Ceti `ContRepresentation.subrepresentation` and `ContRepresentation.quotient`.

## Layer 8: Smooth Banach algebras, star and spectral invariance

### 8.1 Smooth algebras and spectral invariance

The proofs apply BanachAlgebras A1–A2 inversion and the pinned resolvent integrals over contour cycles to the word topology of AutomorphicFormsOnReductiveGroups §2.7 and its real extension. For isometric actions of a Lie group on a Banach algebra, the smooth elements form a dense Fréchet subalgebra satisfying the Leibniz seminorm estimate and are spectrally invariant, also at every matrix level (Schweitzer, Theorem 2.2, p.10, Theorem 1.17, p.8, and Theorem 4.1, p.14). The extension to strongly continuous actions that are not isometric, with the local operator bounds of Layer 0 in place of isometry, the real case, the star law for Banach star-algebras and holomorphic closure through the resolvent integral are this roadmap's own.

Let A be a real or complex Banach algebra with a strongly continuous action by bounded linear algebra automorphisms. Apply the same E∞ carrier, not a second smooth-element definition. Prove it is a dense complete Fréchet subalgebra; prove continuity of multiplication by the full iterated Leibniz/shuffle estimates for the p_m. Each dα(X) is a continuous derivation on A∞ and X↦dα(X) is a real Lie homomorphism into native derivations. For complex A give the complexified Lie and enveloping actions and the coproduct product rule; enveloping operators of higher degree are not all derivations.

For a Banach star-algebra with bounded star and a star-preserving action, prove closedness under star, continuity of star for every p_m and `dα(X)(a*)=(dα(X)a)*`: the star is a continuous real-linear map, so it commutes with every derivative of the orbit. Include units, invariant elements, equivariant bounded algebra/star homomorphisms and unitization comparisons. Do not require automorphisms to be isometric except when that follows from the C\*-algebra specialization.

For a complex C\*-algebra A the action is the pinned `TauCeti.CStarAction G A`. Build the adapter sending α to the `ContRepresentation ℂ G A` given by g↦`α.toContinuousLinearMap g`, whose orbits are continuous by `continuous_orbit`, and take A∞ to be the E∞ of that representation. For X in the Lie algebra, `α.comp (oneParameterSubgroup X)` is a `CStarAction (Multiplicative ℝ) A`; its pinned complex `generator` restricts to the real group generator (`CStarAction.generator_restrictScalars`), hence to dα(X) on A∞, and on A∞ the first-order Leibniz rule, star law and unit law are the restrictions of the pinned `generator_mul`, `generator_star` and `generator_one`. This section extends them to A∞ with its Fréchet topology, to all orders and to all of the Lie algebra, and does not prove the first-order laws again.

The headline `smooth_inverse` states inverse closure over either field and needs no orbit-continuity hypothesis: for unital A with any action by algebra automorphisms, if a∈A∞ is invertible in A, then its inverse lies in A∞, since `α(g)(a⁻¹)=α(g)(a)⁻¹` writes its orbit as the smooth orbit of a composed with inversion, which is smooth on the open set of units of a complete normed algebra (`contDiffAt_ringInverse`) (Schweitzer, Theorem 1.17, p.8, with Theorem 2.2, p.10, for isometric actions). Give the recursive derivative estimates and `dα(X)(a⁻¹)=−a⁻¹dα(X)(a)a⁻¹`. Prove the result at every matrix level; for nonunital A use the scalar unitization and identify its smooth elements with the unitization of A∞. The headline `smooth_resolventIntegral` states holomorphic closure for complex A on the pinned resolvent integral over contour cycles, again with no orbit-continuity hypothesis: for unital A with an action by algebra automorphisms, a∈A∞, a cycle Γ whose trace lies in the resolvent set of a and f:ℂ→ℂ continuous on the trace of Γ, the integral `∫_Γ f(z)(z1−a)⁻¹dz`, that is `TauCeti.Contour.Cycle.integral` of `f z • resolvent a z` over Γ, lies in A∞. When f is holomorphic on an open U⊇σ(a) and Γ lies in U∖σ(a), is null-homologous in U and winds once around every point of σ(a), this integral is 2πi·f(a): it is the same for all such Γ (`TauCeti.Contour.Cycle.integral_smul_resolvent_eq_of_windingNumber_eq`) and equals 2πi·p(a) for every polynomial p (`TauCeti.Contour.Cycle.integral_eval_smul_resolvent`). So f(a)∈A∞, which is holomorphic closure; BanachAlgebras A2's calculus is built on the same `TauCeti.Contour.Cycle.integral`. Prove it as follows: each α(g) is a continuous unital algebra automorphism, so σ(α(g)a)=σ(a), α(g)((z1−a)⁻¹)=(z1−α(g)a)⁻¹, and α(g) commutes with the cycle integral (`TauCeti.Contour.Cycle.integral_comp_comm`); hence the orbit of the integral is the orbit of a followed by b↦∫_Γ f(z)(z1−b)⁻¹dz, which is smooth on the open set of b whose resolvent set contains the compact trace of Γ, by differentiating `Ring.inverse` (`contDiffAt_ringInverse`) under the integral uniformly on that trace. Give the derivative seminorm estimates of the integral in terms of those of a. No Fréchet-valued integral is used.

For a `TauCeti.CStarAction G A` on a complex C\*-algebra A, §2.1, §4.1 and the results above show that A∞ with its inclusion into A satisfies the hypotheses of OperatorKTheory K3 §3.5: a dense \*-subalgebra carrying a metrizable complete Hausdorff locally convex topology with continuous multiplication and star, continuously and injectively included in A, and inverse-closed at every matrix level and, for nonunital A, after unitization. K3 §3.5 states the K₀/K₁ comparison for every such subalgebra and does not depend on this roadmap.

*Needs:* Layers 0–4; BanachAlgebras A1–A2; Mathlib `contDiffAt_ringInverse`; Tau Ceti `TauCeti.CStarAction` with the generator laws listed in the Tau Ceti contract, `oneParameterSubgroup`, and the cycle and resolvent-integral declarations listed there; Layer 6 only for exact Gårding identification.

The smooth algebra API includes continuous multiplication and star, invariant units, equivariant homomorphisms, scalar unitization, real and complex derivation rules, the `TauCeti.CStarAction` adapter with its first-order laws read off the pinned generator, all matrix levels of inverse closure and complex holomorphic closure through the cycle resolvent integral.

**Checks.**

- With a trivial action on ℝ or ℂ, the unit 2 and its inverse 1/2 are smooth; the derivative of each is 0. The unit hypothesis excludes 0 in a nonzero algebra.
- For conjugation by diag(e^t,1) on M₂(ℝ), a=I+E₁₂ has derivative E₁₂ and inverse I−E₁₂ with derivative −E₁₂; −a⁻¹E₁₂a⁻¹=−E₁₂, fixing the inverse rule without commutativity.
- On M₂(ℂ) with conjugation by diag(e^t,1), a=I+E₁₂ has σ(a)={1} and `(z1−a)⁻¹=(z−1)⁻¹I+(z−1)⁻²E₁₂`. For Γ the circle |z−1|=1/2, run once counterclockwise, the resolvent integral of f is 2πi(f(1)I+f′(1)E₁₂): for f(z)=1/z, holomorphic off 0, it is 2πi(I−E₁₂)=2πi·a⁻¹, with orbit 2πi(I−e^tE₁₂), and for f(z)=z² it is 2πi(I+2E₁₂)=2πi·a², with orbit 2πi(I+2e^tE₁₂). Both orbits are smooth, and the factor 2πi is the normalization of the pinned integral; reading the integral as f(a) itself would give the wrong value at f=1, namely 2πi·I instead of I.
- A scalar action a↦e^t a is linear but not an algebra action: at a=b=1 the multiplicativity sides are e^t and e^(2t). The algebra-action hypotheses exclude it.
- On the smooth circle, D²(fh)=D²f·h+2Df·Dh+f·D²h; at f=h=exp(ix) the value at 0 is −4, whereas a derivation rule would give −2.
- On C(S¹) with the left rotations (α_t f)(x)=f(x−t) of §1.4 and pointwise conjugation as star, f=exp(ix) has `Df=−i·exp(ix)` and `D(f*)=i·exp(−ix)=(Df)*`, the star law. The Hilbert skew-adjoint sign `−(Df)*` would give `−i·exp(−ix)` instead. With the opposite rotation f(x+t) every displayed value changes sign and the star law still holds, so the rotation direction is part of the Check.
- Conjugation by diag(e^t,1) on M₂(ℂ) acts by algebra automorphisms but does not preserve the star: `dα(E₁₂)=E₁₂`, so `(dα(E₁₂))*=E₂₁`, while `dα(E₁₂*)=dα(E₂₁)=−E₂₁`. Conjugation by the unitary diag(e^(it),1) gives `dα(E₁₂)=iE₁₂` and `dα(E₂₁)=−iE₂₁=(iE₁₂)*`. The star statements of §8.1, and so the application to OperatorKTheory K3 §3.5, assume a star-preserving action.

### Examples

Unipotent 2×2 matrices and circle modes test noncommutative inversion, the higher Leibniz rule and the star law; diagonal conjugations on M₂(ℂ) separate star-preserving actions from other algebra actions.

### Dependencies

Layers 0–4; BanachAlgebras A1–A2; Mathlib `contDiffAt_ringInverse`; Tau Ceti `TauCeti.CStarAction` and its one-parameter generator laws, and the cycle resolvent integrals; Layer 6 only for exact Gårding identification.

## Downstream consumers

- [NoncompactQuantumSymmetry M0](../../NoncompactQuantumSymmetry/README.md#layer-3-m0--smooth-vectors-compact-types-and-semisimple-representation-bridges), item 1, uses Layers 0–4 in the strongly continuous unitary Hilbert case and owns the adjoint statements listed under Scope and ownership.
- [CompactQuantumMetricSpaces §4.5](../../CompactQuantumMetricSpaces/README.md) uses the differentiable vectors and orbit derivatives of §2.1, the Lie action of §3.1 and the smooth Fréchet star algebra of §8.1 for its derivative seminorms on compact connected Lie groups.
- [QuantitativeOrbitMethodAndMicrolocalAnalysisOnLieGroups §§0.2, 0.6](../../QuantitativeOrbitMethodAndMicrolocalAnalysisOnLieGroups/README.md) uses the smooth-vector topology of §2.1, the derived action and integration by parts of §§3.1 and 3.4, and the Gårding identification of §6.1.

These consumer applications are not prerequisites for the generic results. [OperatorKTheory K3 §3.5](../../OperatorKTheory/README.md) is not a consumer: it states the K₀/K₁ comparison for arbitrary dense inverse-closed Fréchet star subalgebras of C\*-algebras, and §8.1 records that the smooth algebras of strongly continuous actions by \*-automorphisms satisfy its hypotheses.

## References

- Bill Casselman, [*The theorem of Dixmier & Malliavin*](https://personal.math.ubc.ca/~cass/research/pdf/Dixmier-Malliavin.pdf), revision of 24 January 2016: p.1 (smooth vectors, integrated action and density); Proposition 1.3, p.4 (entire products); Lemmas 4.1–4.2, pp.9–10 (scalar parametrix and tail bound); Lemma 5.1, p.12 (compact support); Proposition 6.1, p.13 (support-controlled vector factorization). The alternating signs and simultaneous upper bounds in Layer 5 are fixed by its Fourier convention, not by the signless display or the maximum of upper bounds in the exposition.
- R. S. Phillips, [*The adjoint semi-group*](https://msp.org/pjm/1955/5-2/pjm-v5-n2-p10-s.pdf), Pacific Journal of Mathematics 5 (1955), 269–283: Definition 2.2, p.274 (the subspace X⁺); Theorem 2.1, p.275 (strong continuity of the adjoint semigroup on X⁺ and its generator as the largest restriction of the adjoint generator); Theorem 2.2, p.277 (X⁺ is the subspace of norm-continuous adjoint orbits). Cited for the one-parameter model of the continuous contragredient in Layer 7.
- Timo Henkel, [*An Open Mapping Theorem for rings which have a zero sequence of units*](https://arxiv.org/abs/1407.5647v2), arXiv:1407.5647v2 (2014): Theorem 1.6, p.4 (over a topological ring with a sequence of units tending to 0, a continuous linear map between Hausdorff modules with countable bases of neighbourhoods of 0, whose source is complete, is open if and only if it is surjective and its target is complete; no nonarchimedean hypothesis). Cited under Scope and ownership for what the pinned nonarchimedean form omits.
- Joseph Bernstein and Bernhard Krötz, [*Smooth Fréchet globalizations of Harish-Chandra modules*](https://arxiv.org/abs/0812.1684v3), arXiv:0812.1684v3 (2013), the version read, to which all locators refer: Lemma 2.3, p.6 (continuity of an action from dense continuous orbits and local equicontinuity); Remark 2.4, p.7 (for Banach spaces, joint continuity from continuous orbits, and local boundedness of operator norms); Remark 2.13(a), p.10 (independence of the basis) and Lemma 2.15, p.10 (smooth vectors as invariant smooth functions, completeness); §2.5, pp.11–12 (the convolution algebra of measures and multiplicativity of the integrated action); Remark 2.18, p.12 (left and right derivatives compared through Ad); §3.1, p.13 (the closed subspace of the dual with continuous orbits). Cited in Layers 0–4 and §7.4.
- Larry B. Schweitzer, [*Spectral invariance of dense subalgebras of operator algebras*](https://arxiv.org/abs/funct-an/9211009v2), arXiv:funct-an/9211009v2 (1993), the version read, to which all locators refer: Theorem 1.17, p.8 (strong spectral invariance implies spectral invariance); Theorem 2.2, p.10 (for an isometric action of a Lie group on a Banach algebra, the smooth elements satisfy the Leibniz seminorm estimate and are strongly spectrally invariant); Theorem 4.1, p.14 (matrix algebras). Cited in §8.1 for the isometric case.
- Alexander Grothendieck, [*Résumé des résultats essentiels dans la théorie des produits tensoriels topologiques et des espaces nucléaires*](https://www.numdam.org/item/10.5802/aif.46.pdf), Annales de l'Institut Fourier 4 (1952), 73–112: Chapitre I, n° 1, Théorème 1, p.76 (the projective tensor topology and its universal property for continuous bilinear maps), and p.77 (the completed projective tensor and its universal property for complete targets). Cited in §7.2a for the method of the scalar comparisons.
- Jacques Dixmier and Paul Malliavin, *Factorisations de fonctions et de vecteurs indéfiniment différentiables*, Bulletin des Sciences Mathématiques 102 (1978), 305–330, Lemma 2.5 and Theorems 3.1, 3.3. The primary locators are uncertified; Casselman's stated locators support the factorization route above. The stronger function-support statement has the explicit fixed-support proof route in Layer 6.
