# Roadmap: smooth vectors in real and complex Banach representations

**Summary.** Extend the complex smooth-vector theory of AutomorphicFormsOnReductiveGroups §2.7 to real coefficients and unrestricted finite-dimensional Lie-group test functions, and prove support-controlled Dixmier–Malliavin factorization, exactness, smooth tensor comparisons and spectral invariance. The library includes strongly continuous actions which are neither unitary nor globally uniformly bounded. The complete smooth topology, mixed domains and differentiated actions are used throughout; none is replaced by the ambient Banach topology.

## Scope and ownership

[AutomorphicFormsOnReductiveGroups §2.7](../../AutomorphicFormsOnReductiveGroups/README.md#27-smooth-fréchet-representations-and-globalization) owns the complex Banach smooth carrier, all-word domain criterion, complete derivative topology, Lie/enveloping action, smoothing and density, including compact-finite density in the smooth topology. Its §0.1a owns complex test functions for the archimedean groups with finitely many components. Layers 1–4 here extend those contracts to real coefficients and, for tests, arbitrary finite-dimensional Hausdorff Lie groups, with the nonunimodular conventions below; Layer 2 also specifies the finite-k domain criterion. Layer 6 adds prescribed support of the factors and the function-support refinement to §2.7's finite-sum factorization. Layers 7–8 add the general Banach exactness, tensor, dual and algebra interfaces.

[CompactGroups Layer 5](../CompactGroups/README.md) supplies representative-function density; its named gap for the topology-free finite-orbit-span API and generic complex Banach density is recorded below. AutomorphicFormsOnReductiveGroups §2.1 consumes that gap and owns the complete locally convex extension. There is no second compact-finiteness predicate here. [NoncommutativeGeometry N1](../../NoncommutativeGeometry/README.md) owns complex locally convex projective tensors; the required real and scalar-comparison extension is a Part II contract below, not an assumption about N1. [BanachSpaceTheory B4](../../BanachSpaceTheory/README.md) owns Banach projective tensors over both fields. LieGroups Layers 0–3 and OneParameterSemigroups Part A own the Lie and closed-generator foundations.

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

Consume `ContRepresentation` and `ContIntertwiningMap` in `Mathlib/RepresentationTheory/Continuous/Basic.lean` (the former bundles a monoid homomorphism into continuous linear endomorphisms, not continuity in the group variable); `ContMDiff`, `ContMDiffMap`, `LinearPMap`, `Seminorm`, `WithSeminorms`, `UniversalEnvelopingAlgebra`, `TestFunction`, `Distribution` and `TemperedDistribution`. Use `Continuous.integrable_of_hasCompactSupport` in `Mathlib/MeasureTheory/Function/LocallyIntegrable.lean` for the continuous compact-support orbit integrand, and `banach_steinhaus` for uniform operator bounds. Native Bochner integrals are total functions: integral identities require integrability, not merely a displayed integral. Native distribution topologies do not assert the fixed-support strong-dual comparison of Layer 5.

### From Tau Ceti

Consume `oneParameterSubgroup` and `contMDiff_oneParameterSubgroup` in `TauCeti/Geometry/Lie/Exponential/Basic.lean`; `TauCeti.Semigroups.StronglyContinuousSemigroup` in `TauCeti/Analysis/Semigroups/Basic.lean`, its generator and closedness in `Generator/Basic.lean` and `Generator/Closed.lean`, and its smooth-vector/power dictionary in `Generator/SmoothVectors.lean`. These are real semigroups indexed by nonnegative time; the group inverse and restriction of scalars enter the two-sided comparison. Consume `TauCeti.Complexification`, `ContinuousLinearMap.complexify`, `TauCeti.Complexification.ofRealLI` and `TauCeti.Complexification.reCLM` in `TauCeti/Analysis/Normed/Module/Complexification.lean` for real Banach actions.

For the Haar-density route, consume `TauCeti.chartVolumeDensity`, `TauCeti.chartVolumeDensity_pos` and `TauCeti.contMDiffOn_chartVolumeDensity` in `TauCeti/Geometry/Manifold/Riemannian/VolumeDensity/Basic.lean`, and `Homeomorph.measurePreserving_riemannianVolume` in `TauCeti/Geometry/Manifold/Riemannian/VolumeDensity/Isometry.lean`. Positivity is on the chart domain, smoothness requires a smooth Riemannian bundle, and the global isometry theorem requires Lindelöf source and target; Layer 1 applies it only on the open σ-compact subgroup.

### From TauCetiRoadmap.LieGroups and TauCetiRoadmap.OneParameterSemigroups

[LieGroups Layers 0–3](../LieGroups/README.md) supplies the Lie algebra, exponential, Ad, local product charts and smoothness of continuous finite-dimensional homomorphisms. [OneParameterSemigroups Part A](../../../Completed/OneParameterSemigroups/README.md) supplies the closed generators and their powers. Only these clauses enter; classification and representation decompositions do not.

### From TauCetiRoadmap.AutomorphicFormsOnReductiveGroups and TauCetiRoadmap.CompactGroups

Consume AutomorphicFormsOnReductiveGroups §0.1a's archimedean tests and §2.7's complex smooth-vector contracts at the scope just specified. Its differentiation named L_X is this roadmap's R_X: both differentiate f(exp(tX)g). Its unimodular involution extends here with the modular factor. Its §2.1 supplies the complete Hausdorff locally convex compact-finite density theorem for jointly continuous actions of compact Hausdorff groups.

What CompactGroups must provide (gap:banach-gfinite-density), as required by AutomorphicFormsOnReductiveGroups §2.1: for any group representation over a field, finite-dimensional orbit span and its invariant submodule, closed under addition, scalars and equivariant linear maps; for a compact Hausdorff group acting strongly continuously on a complex Banach space, density of that submodule. The proof uses CompactGroups Layer 5 representative-function uniform density and Haar approximate identities. This contract includes non-Lie compact groups and assumes no operator-norm continuity.

### From TauCetiRoadmap.BanachSpaceTheory and TauCetiRoadmap.NoncommutativeGeometry

Consume BanachSpaceTheory B4's real/complex completed Banach projective tensor and bounded-bilinear universal property. Consume NoncommutativeGeometry N1's complex completed locally convex projective tensor: seminorm construction, Hausdorff completion, continuous-bilinear universal property, Fréchet completeness, and comparison with B4.

What NoncommutativeGeometry, Part II must provide (gap:real-locally-convex-tensors): extend N1 from complex spaces to real Hausdorff locally convex spaces, with the same universal property, functoriality, symmetry, associativity, finite sums, Fréchet completeness and Banach comparison. For real Fréchet E,F supply the natural topological complex-linear isomorphism from the complexification of E⊗̂ℝF to Eℂ⊗̂ℂFℂ, taking (x⊗y)⊗1 to (x⊗1)⊗(y⊗1); complexification means E×E with its usual complex structure. For complex Fréchet E,F supply the continuous real-linear balancing quotient from Eℝ⊗̂ℝFℝ onto (E⊗̂ℂF)ℝ, with kernel the closed span of ix⊗y−x⊗iy. Prove naturality and agreement with the Banach comparisons. This Part II starts where N1's complex construction stops; its scalar comparisons use no smooth-vector theorem. Layer 7 consumes this explicit gap, not a revision of N1.

### From TauCetiRoadmap.BanachAlgebras

[BanachAlgebras A7](../../BanachAlgebras/README.md), the chosen approximate identity and integrated-representation clauses, supplies Haar/modular conventions, localized Bochner/Fubini comparisons and globally bounded L¹ actions. Its A1–A2 supplies unitization, Banach inversion and holomorphic functional calculus for Layer 8. Layer 1 builds smooth tests and estimates depending on compact support; no global operator bound is imposed.

## How to read the build

Layers 0–1 give real generators and the general test calculus. Layers 2–4 transport the supplied complex theory and establish the finite-regularity and real comparisons. Layer 5 constructs the scalar parametrix and its Banach-norm passage; Layer 6 gives support-controlled finite factorizations. Layer 7 uses those factorizations for quotient lifting and the independent tensor contracts for tensor operations. Layer 8 uses Layers 0–4 for algebra and spectral invariance, and Layer 6 only for the exact Gårding-domain identification. Proof routes below specify sufficient inputs; another proof may use a different subset of suppliers.

## Layer 0: Strong actions, local bounds and one-parameter generators

The generator comparison extends OneParameterSemigroups Part A from a half-line to a group; the compact bound uses native uniform boundedness. Casselman, p.1, fixes the orbit convention.

### 0.1 Strong actions

Extend the supplied complex strong-action results to real coefficients: strong continuity implies joint continuity of `(g,v)↦π(g)v`. On every compact K⊆G prove `∃ C≥0, ∀ g∈K, ‖π(g)‖≤C` by uniform boundedness applied to the compact images of each orbit. Derive locally uniform operator bounds from relatively compact neighborhoods. Include restriction to open/closed subgroups, finite products, conjugation, continuous intertwiners and realification. These preserve the explicit orbit-continuity hypothesis.

*Needs:* Mathlib `banach_steinhaus`; compactness of orbit images; AutomorphicFormsOnReductiveGroups §2.7 for the complex case.

### 0.2 Two-sided generator comparison

For each X construct the real C₀ semigroup `t≥0↦π(exp(tX))`, using restriction of scalars when 𝕜=ℂ. Its native generator is the unbounded operator A_X. Identify its domain and values with the two-sided derivative at zero of the group orbit. Prove the one-sided/two-sided comparison from the inverse group law; prove that the domain is a 𝕜-submodule and A_X is 𝕜-linear. Retain native `LinearPMap` and its graph-closedness, dense domain, invariance under this one-parameter group and generator commutation. Do not introduce a parallel unbounded-operator carrier.

*Needs:* LieGroups Layer 0; native `oneParameterSubgroup`; OneParameterSemigroups Part A; Layer 0.1 for strong-action bounds.

### 0.3 Mixed word domains

Give explicit recursively composable word domains: for a word `(X₁,…,X_r)`, A_X₁⋯A_Xr v is defined by starting with the rightmost operator, requiring each preceding domain membership. The empty word is v. Prove truncation, linearity, restrictions and compatibility with native powers for repeated X. Products of closed generators are not asserted closed as operators on E.

*Needs:* Layer 0.2 generator domains and native powers of `LinearPMap`.

The real semigroup adapter has operator at t equal to π(exp(tX)), restricted to real scalars; its zero, addition and strong-continuity laws are proved from the group homomorphism before its generator is used. The reusable word-domain API consists of:

- The empty word is defined everywhere and acts as identity.
- A word is defined exactly when its suffix is defined and its value lies in the first generator's domain; sums and scalars preserve this condition.
- Repeating X gives the native domain of the corresponding power; intertwiners preserve all these domains.

**Checks.**

- For π(t)x=e^t x on ℝ, A₁x=x, S(0)x=x, S(s+t)x=e^s e^t x, and ‖π(t)‖=e^t is unbounded globally; on [−1,1] the bound is e.
- In L∞(ℝ), translation of 1_[0,1] changes it by norm 1 for every 0<|t|<1, so this action fails `HasContinuousOrbits`; translation on L² has difference norm √(2|t|), tending to 0.
- For X=0, A₀=0 with full domain; the empty word sends x to x and every nonempty zero word sends x to 0.
- In the affine matrix representation with H=diag(1,0), N=E₁₂ and v=(0,1), A_H A_N v=(1,0), while A_N A_H v=0; the word order matters.
- For translation on L²(ℝ), v=1_[0,1] has difference-quotient squared norm 2/|t| for 0<|t|<1; its generator derivative does not exist although its orbit is continuous.

### Examples

The exponential real character, affine matrices and the L² translation step function distinguish strong continuity, word order and differentiability.

### Dependencies

Mathlib uniform boundedness; LieGroups Layers 0–3; OneParameterSemigroups Part A.

## Layer 1: Smooth tests, local Haar density and compact-support integration

These are real and general-group extensions of AutomorphicFormsOnReductiveGroups §0.1a. Casselman, p.1, gives the integrated left action; the Haar chart-density argument below supplies the additional localization.

### 1.1 General test spaces

Build `LieTestFunction`, the native subtype defining D(G), extending §0.1a to real coefficients and groups without a component-count or unimodularity restriction, with its linear structure, support/zero-extension/translation and inversion rules. On each compact K construct `D_K(G)={f∈D(G):tsupport f⊆K}` with derivative seminorms in a finite atlas, independent of atlas and equivalent to invariant-derivative seminorms. Prove completeness and continuity of restriction, differentiation, multiplication and chart transport. Compare chart-supported tests exactly with native Euclidean `TestFunction` and `ContDiffMapSupportedIn`. Use Mathlib's smooth bump functions to extend compactly supported chart tests by zero and to construct finite cutoff decompositions. Give D(G) the locally convex final topology of these fixed-support spaces and prove the universal property needed below. Do not call this an LF topology for a group with no countable compact exhaustion.

*Needs:* AutomorphicFormsOnReductiveGroups §0.1a; LieGroups Layer 0 charts; native test functions, supported smooth maps and smooth bumps.

### 1.2 Smooth Haar density

Prove that Haar measure has a strictly positive smooth density in every Lie chart. Construct a smooth left-invariant positive Riemannian metric from an inner product on the Lie algebra; reuse TauCeti's chart volume density, smoothness, change-of-variables and isometry invariance, then Haar uniqueness. Account for the hypotheses of those native measure theorems: a symmetric relatively compact identity neighborhood generates an open σ-compact Lie subgroup H, which is second countable/Lindelöf; prove the inherited open-subgroup Lie/manifold structure and apply the volume theorem there. Any compact subset of G meets only finitely many left cosets of H. Translate and glue the local comparisons on these cosets. Prove independence from H and the charts. Thus no global σ-finiteness or second countability of G is imposed. If G is connected, H=G.

*Needs:* LieGroups Layer 0; native Riemannian volume-density and isometry declarations listed above; Haar uniqueness; the open-subgroup localization constructed here.

### 1.3 Local integrated operators

For continuous scalar f of compact support K prove integrability of `g↦f(g)•π(g)v` and the bound

   `‖π(f)v‖ ≤ C_K ‖f‖₁ ‖v‖`.

   The definition `smear` is the displayed Bochner integral on native carriers. Produce the bounded linear operator π(f); prove linearity, continuous-intertwiner naturality and independence of representatives. Supply strong measurability from finite-chart compact localization and separable compact images of each orbit, without requiring separability of E. The bound is local in K. A bounded action of all L¹(G) follows under the extra global operator bound, and agrees with A7.IntegratedRepresentations.

*Needs:* Layer 0.1 compact operator bounds; native `Continuous.integrable_of_hasCompactSupport` and Bochner integration; BanachAlgebras A7.IntegratedRepresentations for the globally bounded comparison.

### 1.4 Convolution and modular covariance

Prove associativity, support `tsupport(f*h)⊆tsupport(f)·tsupport(h)`, smoothness of test convolution, and `π(f*h)=π(f)π(h)`, using compact localized Fubini and changes of variables. Prove left covariance `π(g)π(f)=π(L_g f)`, `L_g f(x)=f(g⁻¹x)`. Prove the modular right-translation and involution comparisons with A7; for unitary representations obtain `π(f*)=π(f)*`. These statements precede the derived action.

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
- For counting measure on S₃, δ_s*δ_t=δ_(st); with s=(12),t=(23), st and ts are different three-cycles. This detects reversed convolution order.
- In a trivial action on the scalar line, an integral-one kernel sends 1 to 1, an integral-zero kernel sends it to 0, and a kernel supported away from 1 cannot serve all shrinking identity neighborhoods. This tests mass and localization separately.
- On a group with uncountably many discrete components, every compact subset meets finitely many cosets of the chosen open subgroup; finite support still gives a finite integral, without global σ-finiteness.

### Examples

Discrete groups, the affine group and S₃ pin the mass, modular factor and convolution order.

### Dependencies

Layer 0 compact operator bounds; LieGroups Layer 0 charts; AutomorphicFormsOnReductiveGroups §0.1a; BanachAlgebras A7; native tests, smooth bump functions and Bochner integration.

## Layer 2: Orbit regularity and the smooth-vector topology

### 2.1 Finite regularity and real smooth topology

AutomorphicFormsOnReductiveGroups §2.7 supplies the complex all-order statement. The real and finite-k extensions below use its topology and the native closed-generator interface (Casselman, p.1, for iterated domains and the Fréchet topology).

For real coefficients define E^k by `ContMDiff I 𝓘(ℝ,E) k (fun g=>π(g)v)`, and E∞ by k=∞. The simple predicate `IsSmoothLieVector` and algebraic submodule `smoothLieVectors` express this on native carriers over either field. The complex all-order construction is the supplied §2.7 carrier; identify these predicates with it. Show these are invariant 𝕜-subspaces. For any basis `(X_i)` of the real Lie algebra prove that v∈E^k exactly when all composable basis words of length≤k are defined; for E∞ use all finite lengths. Prove equivalence with the quantification over arbitrary X's, and independence of the chosen basis. State the finite-k result for natural k, including k=0, where strong continuity gives E^0=E. Pure powers in separate basis directions are not a replacement for mixed words.

For the finite-k extension over either field prove the analytic bridge in that equivalence. A continuous Banach-valued function with continuous derivatives along a smooth frame is C¹: in charts, interpret frame derivatives as distribution derivatives by curve integration and integration by parts, invert the smooth frame coefficient matrix, and use Euclidean mollifiers plus the Banach-valued fundamental theorem of calculus to recover the coordinate derivative. Prove this lemma using native chart/test/distribution and Bochner APIs, including its Banach-valued/weak-pairing comparison. Iterate it on `g↦π(g)A_w v`. Conversely differentiate a smooth orbit along the invariant frame. This proves linearity in X and the mixed-word dictionary without assuming unproved invariance of generator domains under Ad(G).

For the real extension, with the complex topology supplied by §2.7, put

`p_m(v)=Σ_(basis words w, |w|≤m) ‖A_w v‖`.

Use a type synonym of the algebraic smooth submodule carrier for its stronger topology; transport the module structure and retain a separate continuous inclusion into E. Do not inherit the ambient norm topology as the smooth topology. Use native `Seminorm` and `WithSeminorms` for this topology. Prove it is Hausdorff, metrizable, locally convex and complete, and prove the continuous injective inclusion E∞→E. Identify this topology with the initial topology of all word evaluations into E, and with uniform-on-compact orbit-derivative seminorms. For completeness, Cauchy limits of each word coordinate are linked successively by closedness of each first-order A_X; no closedness of arbitrary E-operator products is used. Give equivalent seminorms from U(𝔤), once Layer 3 is built, with explicit finite-order comparison constants.

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

Prove `π(g)dπ(X)π(g)⁻¹=dπ(Ad(g)X)` on E∞, its mixed-word form and locally uniform bounds for π(g):E∞→E∞. Prove full G-invariance even when G is disconnected. Natural restriction to open subgroups identifies the same smooth vectors/topology; restrictions to general Lie subgroups give the continuous inclusion and the derived-action comparison, without asserting equality of smooth-vector spaces.

*Needs:* Layer 3.1; LieGroups Layer 1 Ad; Layer 2 word seminorms.

### 3.3 Smoothing and derivative estimates

Extend §2.7 smoothing to real coefficients and the general tests of Layer 1, with all mixed derivatives of π(f)v by differentiating the translated test. Explicitly,

   `dπ(X)π(f)v=π(−R_X f)v`,
   `dπ(X₁)⋯dπ(X_r)π(f)v=π((−R_X₁)⋯(−R_Xr)f)v`.

   In the second formula operator composition is read right to left on both sides. Prove the anti-bracket law for R and the resulting Lie homomorphism for −R. For fixed support K, give all bounds `p_m(π(f)v)≤C_K Σ_(|w|≤m) ‖(−R)_w f‖₁ ‖v‖`; hence fixed-support smoothing is continuous into E∞. The headline `isSmoothLieVector_smear` establishes this for arbitrary v∈E and both coefficient fields.

*Needs:* Layers 1.1–1.4 and Layer 2; AutomorphicFormsOnReductiveGroups §2.7 smoothing with its L_X translated to R_X.

### 3.4 Modular integration by parts

For smooth v prove the other integration-by-parts formula

   `π(f)dπ(X)v=π(q_X f−L_X f)v`,
   `q_X=d/dt|₀ log c(exp(tX))`.

   Derive it from the stated modular change of variables; prove q is real linear, vanishes on brackets and agrees with `tr(ad X)` in this modular convention. In the unimodular case q=0. Compare the adjoint/involution in the unitary Hilbert case, where real X is skew symmetric on the smooth domain. For star-algebra actions prove the distinct star-derivation law in Layer 8. State all integration-by-parts domains explicitly.

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

Prove π(u_U)v→v in every p_m when v∈E∞, using the Ad-covariance bounds and local uniform strong continuity on the finitely many word coordinates. For real E this extends §2.7; for complex E identify its supplied approximation with the general test construction. Thus the net converges in the Fréchet topology as well as in E. For arbitrary v∈E, Layer 1 and Layer 3 give smooth approximants converging in norm, so E∞ is dense (`dense_smoothLieVectors`, with both coefficient fields). Prove the uniform-on-compact refinement in E∞ and independence of the smooth approximate identity. Identify native one-parameter `StronglyContinuousSemigroup.smoothVectors` with this definition when G=(ℝ,+), including the scalar-restriction and half-line orbit dictionary. Keep this comparison separate from the many-direction frame proof.

For compact Lie G use the supplied finite-orbit-span predicate and AutomorphicFormsOnReductiveGroups §2.7 complex smooth-topology density, through §2.1 and the CompactGroups gap. For real E, use the actual `TauCeti.Complexification E` with `ContinuousLinearMap.complexify` to extend the action, and `ofRealLI`/`reCLM` to include and project. The product-topology comparison proves strong continuity of the complexified action. A finite-dimensional complex orbit span is finite-dimensional over ℝ, and its real-part image contains the real orbit span of the projected vector. Hence projection of complex G-finite approximants gives real G-finite approximants, with the native real-part norm bound. Prove that these maps commute with every derived word and are continuous for the smooth seminorms, so the same adapter applies to the stronger topology. This is the real specialization of the shared theorem, not another predicate or generic complex density owner. For the real extension every G-finite vector is smooth, because its finite-dimensional invariant span carries a continuous representation, smooth by LieGroups' finite-dimensional homomorphism theorem. Transport the supplied compact-finite smooth-topology density to real E. A direct route to the real comparison is: first smooth with f, then approximate f in the finitely many invariant-derivative L¹ seminorms by representative functions, by convolving a Peter–Weyl uniform approximation on the side where derivatives remain on f. Prove those derivative and support formulas; uniform C(G) density alone is not used as a C∞ approximation theorem. This comparison does not enter generic compact-group G-finite density.

*Needs:* Layers 1–3; AutomorphicFormsOnReductiveGroups §§2.1,2.7; CompactGroups Layer 5 and its declared gap; native complexification.

The real approximation API includes convergence in each word seminorm, uniformity on compact subsets of the smooth space, and compatibility with complex inclusion and real-part projection.

**Checks.**

- In a trivial action, every mass-one kernel sends v to v; the approximation error in each p_m is 0.
- For rotation on C(S¹), a character exp(inx) has one-dimensional orbit span and is smooth; a smooth Fourier series with infinitely many nonzero frequencies has infinite orbit span. Finite Fourier sums approximate it in every derivative seminorm.
- For K=∏ C₂ acting on C(K,ℂ), a function depending on r coordinates has orbit span of dimension at most 2^r, and finite-coordinate functions approximate every continuous function uniformly. K is not discrete and has zero-dimensional identity component, so it is not Lie; only the generic compact density supplier applies.
- The real projection sends z=x+iy to x, with ‖x‖≤‖z‖; on a fixed real vector, projection after inclusion is x, not 2x or 0. Applied to complexified rotations it recovers the two-dimensional real span of sin and cos.

### Examples

Circle modes and the profinite product of C₂ separate the Lie comparison from the compact-group supplier.

### Dependencies

Layers 1–3; AutomorphicFormsOnReductiveGroups §§2.1,2.7; CompactGroups Layer 5 and its declared gap; native complexification.

## Layer 5: The one-variable factorization engine

### 5.1 Scalar parametrix and passage to vectors

The scalar targets refine Casselman, Lemmas 4.1–4.2, pp.9–10, and Lemma 5.1, p.12; the vector passage expands the proof of Proposition 6.1, p.13. The simultaneous bounds and Banach-norm comparison are explicit proof obligations below.

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

Prove it by applying Layer 5 successively in an ordered basis of the Lie algebra to the finite family of inner smooth vectors at each step. Choose a sufficiently small box for

`Φ(t₁,…,t_d)=exp(t₁X₁)⋯exp(t_dXd)`

to be a diffeomorphism onto an identity neighborhood and to map the closed supporting box into U. Each final branch is an ordered convolution of d compactly supported line measures. If `Φ*μ=J(t)dt`, Layer 1 gives smooth J>0 and the resulting density on G is

`f(Φ(t))=(∏_i g_i(t_i))/J(t)`,

extended by zero. Prove its smoothness and support, including a compact margin inside the chart, and prove the exact equality between the iterated integrated operators and π(f). Treat d=0 by Layer 1's discrete unit test. For a group with many components use the open σ-compact subgroup from Layer 1 and extension by zero; E∞ for that subgroup equals E∞ for G, since left cosets are open and orbit maps there are fixed bounded linear transforms of the local orbit.

Deduce the two exact algebraic equalities, not merely closure equalities:

`E∞=span{π(f)v : f∈D(G), v∈E}`
`   =span{π(f)v : f∈D(G), v∈E∞}`.

These identify the Gårding domain with the smooth vectors and keep the witnesses of finite sums and prescribed supports.

The headline `dixmierMalliavin_function` is the function version: every φ∈D(G) is a finite sum f_j*h_j, with tsupport(f_j)⊆U and tsupport(h_j)⊆tsupport(φ). In this proof the terminal factors are limits of series of derivatives of φ in a fixed-support smooth function space; derivatives and that topology retain tsupport(φ). Track these terminal factors through the basis iteration rather than appealing to an arbitrary orbit translate. Compare convolution densities with the vector statement. Prove continuity and intertwiner compatibility of each integrated factorization expression; no continuous global choice of factorizations is required.

*Needs:* Layers 1,2,3,5; LieGroups Layer 0 local product chart; Haar chart-density comparison of Layer 1.

The factorization API retains finite sums, prescribed first-factor support, smooth inner vectors, finite-family choices and naturality under continuous intertwiners; it asserts neither one factor nor a continuous choice of factors.

**Checks.**

- v=0 and φ=0 admit n=0, with empty sum 0 and no support obligations.
- On the trivial group of Haar mass 2, f(1)=1/2 and w=v give π(f)w=v. For functions take h=φ; convolution also gives φ, including when φ=0.
- In an abelian product chart with constant Haar density J=2, dividing the product kernel by J gives integral ∏∫g_i; omitting the divisor doubles it. J is positive, so division has no zero denominator.
- A derivative of a bump supported in [−1,1] still has topological support in [−1,1], and a limit in that fixed-support smooth space vanishes at 2. Translating the bump by 3 would instead allow a nonzero value at 3 and cannot justify the function-support refinement.

### Examples

Zero vectors, the one-point group and constant-density product charts test the finite sum and support normalization.

### Dependencies

Layers 1,2,3,5; LieGroups Layer 0 local product chart; Haar chart-density comparison of Layer 1.

## Layer 7: Functorial operations and exactness

These are consequences of the factorization in Casselman, Proposition 6.1, p.13, and the specified tensor universal properties. The proofs below give the additional quotient-topology, scalar and dense-range conclusions; no tensor isomorphism is inferred from factorization.

### 7.1 Intertwiners and subspaces

Every native continuous intertwining map T:E→F restricts to a continuous linear map E∞→F∞ commuting with π(f), dπ and U(𝔤). Prove identity, composition and isomorphism laws, including restriction-of-scalars compatibility. For a closed invariant subspace M prove `M∞=M∩E∞`, with the induced smooth topology.

*Needs:* Layers 1–3 integrated operators, word domains and smooth topology; native continuous intertwiners.

### 7.2 Quotient lifting

Give the Banach quotient E/M its strongly continuous quotient action. The headline `smooth_lift` proves lifting through every surjective continuous intertwiner between strong Banach representations; in particular prove surjectivity of `E∞→(E/M)∞` using Layer 6: factor a quotient smooth vector, lift each inner vector arbitrarily to E, and smooth those lifts with the same kernels. Prove the resulting short sequence of smooth spaces is exact, with the kernel topology just identified. This proves lifting without assuming differentiability of arbitrary linear lifts or a complemented M. For the quotient-topology comparison prove the Fréchet open mapping theorem from Baire: every surjective continuous linear map between Fréchet spaces over ℝ or ℂ is open. Apply it to the smooth quotient map; a normed-space open mapping theorem alone does not apply to E∞.

*Needs:* Layers 0.1,7.1 and 6; Banach quotients; the Fréchet open mapping theorem proved here from Baire.

### 7.3 Smooth tensor comparison

Prove finite-product compatibility with the smooth topology. On the completed Banach projective tensor of two strong representations construct the diagonal strong action with local operator bounds, using B4's universal property. Pure tensors of smooth vectors are smooth and `dπ(X)(v⊗w)=dπ_E(X)v⊗w+v⊗dπ_F(X)w`. Prove the higher binomial/shuffle identities and continuity on the smooth spaces. Consume NoncommutativeGeometry N1 and the explicit Part II tensor gap over the same 𝕜=ℝ or ℂ for the completed locally convex projective tensor of the two smooth Fréchet spaces. Prove the smooth-pure-tensor bilinear map is jointly continuous by the shuffle seminorm bounds, then use that single universal property to construct its continuous linear map into the diagonal smooth space. Prove the map intertwines actions and derived words and commutes with realification/complexification through the Part II gap’s specified scalar-comparison maps. The generic seminorm construction, Hausdorff completion and universal property are owned there, not rebuilt here. No assertion of injectivity or isomorphism is made without approximation/nuclear hypotheses. Prove density of the span of smooth pure tensors in the diagonal smooth space: apply a smoothing kernel to norm approximants, choose the norm approximants with both tensor factors smooth, then approximate that smoothed smooth-pure-tensor integral in every finite collection of derivative seminorms by sums of translated smooth pure tensors. This identifies the needed dense range without a false tensor-isomorphism assertion.

*Needs:* Layers 0–4 word bounds and smooth approximation; BanachSpaceTheory B4; NoncommutativeGeometry N1 and the explicit Part II gap.

### 7.4 Continuous contragredients

For the continuous dual define the closed invariant subspace of vectors whose contragredient orbit is norm continuous. Prove its strong action and apply Layer 0–Layer 6 there. Compare differentiated pairings and the negative transpose on the relevant common domains. Do not assert strong continuity on the entire Banach dual; the translation action on dual measures supplies a counterexample.

*Needs:* Layer 0.1 local bounds; native continuous duals; Layers 0–6 applied to the norm-continuous contragredient subspace.

The continuous-dual carrier is the subspace of E′ consisting of λ for which g↦λ∘π(g⁻¹) is norm continuous; local operator bounds prove it closed. Its API includes invariant closed linear structure, a strongly continuous action, natural dual intertwiners and the derivative pairing on the common domains. The tensor comparison has source the completed projective tensor of the two smooth Fréchet spaces and target the smooth space of the diagonal Banach tensor action; its pure-tensor values, continuity and dense range determine the claimed map.

**Checks.**

- For the trivial actions, projection ℝ²→ℝ lifts 1 to (1,0), and its smooth kernel is {0}×ℝ, exactly its ordinary kernel; the zero quotient lifts 0 to 0.
- For π_E(t)=e^t and π_F(t)=e^(2t), the tensor orbit of 1⊗1 is e^(3t), so its derivative is 3=1+2; the second derivative is 9=1+4+4.
- The completed real tensor ℝ⊗̂ℝℝ is ℝ, and complexifying 1⊗1 maps to 1⊗1 in ℂ⊗̂ℂℂ≅ℂ. The balancing map ℂℝ⊗̂ℝℂℝ→ℂ sends i⊗1 and 1⊗i both to i; their difference is in its kernel, so this map is not an isomorphism.
- On C(S¹)′, rotating δ₁ to δ_z gives ‖δ_z−δ₁‖=2 for z≠1; δ₁ is excluded from the continuous-dual carrier. Haar measure has constant orbit and is included, as is 0.
- If π(t)x=e^t x, the contragredient sends λ to e^(−t)λ, so its derivative pairs as −λ(x), the negative transpose. Identity intertwiners preserve every factorization unchanged.

### Examples

Real scalar characters, projection ℝ²→ℝ and translated point masses test exactness, tensors and the dual restriction.

### Dependencies

Layers 0–4 for maps, products, duals and tensor estimates; Layer 6 for smooth lifting; BanachSpaceTheory B4; NoncommutativeGeometry N1 and the stated Part II gap. The Fréchet open mapping comparison is proved here from Baire, independently of factorization.

## Layer 8: Smooth Banach algebras, star and spectral invariance

### 8.1 Smooth algebras and spectral invariance

The proofs apply BanachAlgebras A1–A2 inversion and resolvent calculus to the word topology of AutomorphicFormsOnReductiveGroups §2.7 and its real extension. The derivative and seminorm estimates below are the new comparisons; NoncommutativeGeometry N6 supplies the torus Fourier conventions.

Let A be a real or complex Banach algebra with a strongly continuous action by bounded linear algebra automorphisms. Apply the same E∞ carrier, not a second smooth-element definition. Prove it is a dense complete Fréchet subalgebra; prove continuity of multiplication by the full iterated Leibniz/shuffle estimates for the p_m. Each dα(X) is a continuous derivation on A∞ and X↦dα(X) is a real Lie homomorphism into native derivations. For complex A give the complexified Lie and enveloping actions and the coproduct product rule; enveloping operators of higher degree are not all derivations.

For a Banach star-algebra with bounded star and a star-preserving action, prove closedness under star, continuity of star for every p_m and `dα(X)(a*)=(dα(X)a)*`. Include units, invariant elements, equivariant bounded algebra/star homomorphisms and unitization comparisons. Do not require automorphisms to be isometric except when that follows from the C*-algebra specialization.

The headline `smooth_inverse` states inverse closure over either field: for unital A, if a∈A∞ is invertible in A, then its inverse lies in A∞, by differentiating `α(g)(a⁻¹)=α(g)(a)⁻¹` and Banach-algebra inversion. Give the recursive derivative estimates and `dα(X)(a⁻¹)=−a⁻¹dα(X)(a)a⁻¹`. Prove the result at every matrix level; for nonunital A use the scalar unitization and identify its smooth elements with the unitization of A∞. For complex A prove holomorphic-functional-calculus closure using A2's resolvent contours and all derivative seminorm estimates: realize contour integration as an E-valued integral with all word coordinates integrable, then use closedness/completeness to place it in A∞. Do not invoke a Banach-valued Bochner theorem on an invented norm for the Fréchet space.

In the C*-algebra case these give exactly the dense inverse-closed Fréchet star-algebra input of OperatorKTheory K3, which owns the K₀/K₁ comparison. NoncommutativeGeometry N6 identifies the torus gauge smooth vectors with rapidly decreasing Fourier series and owns the `2πi` Fourier normalization, traces and differential calculus. Prove that its rapid-decay and derivative seminorm families define the same Fréchet topology by explicit finite-order estimates in both directions, not equality of individual seminorms. With ordered Fourier coefficients a_(r,s), use Q_k(a)=sup_(r,s)(1+|r|+|s|)^k|a_(r,s)| and the Layer 2 coordinate-word sums P_m. Retain δ_j(U₁^rU₂^s)=2πi n_j U₁^rU₂^s. Prove Q_k≤C_k P_k and P_m≤D_m Q_(m+3), with finite positive constants independent of a and θ; coefficient extraction is contractive and the reverse bound uses absolute summability on ℤ². In particular at θ=0, a=1+U₁ has Q_0=1 and P_0=‖a‖=2, so these seminorms are not isometric. Under this topological identification consume the generic density, star, derivation and all-matrix inverse/holomorphic-closure theorems; no Fourier normalization or HFC scope is changed.

*Needs:* Layers 0–4; BanachAlgebras A1–A2; Layer 6 only for exact Gårding identification; NoncommutativeGeometry N6 only for the torus Fourier comparison.

The smooth algebra API includes continuous multiplication and star, invariant units, equivariant homomorphisms, scalar unitization, real and complex derivation rules, all matrix levels of inverse closure and complex holomorphic closure. The torus comparison identifies topologies by two families of finite-order inequalities, not by equality of seminorms.

**Checks.**

- With a trivial action on ℝ or ℂ, the unit 2 and its inverse 1/2 are smooth; the derivative of each is 0. The unit hypothesis excludes 0 in a nonzero algebra.
- For conjugation by diag(e^t,1) on M₂(ℝ), a=I+E₁₂ has derivative E₁₂ and inverse I−E₁₂ with derivative −E₁₂; −a⁻¹E₁₂a⁻¹=−E₁₂, fixing the inverse rule without commutativity.
- A scalar action a↦e^t a is linear but not an algebra action: at a=b=1 the multiplicativity sides are e^t and e^(2t). The algebra-action hypotheses exclude it.
- On the smooth circle, D²(fh)=D²f·h+2Df·Dh+f·D²h; at f=h=exp(ix) the value at 0 is −4, whereas a derivation rule would give −2.
- For the torus generator U₁, δ₁(U₁)=2πiU₁ and δ₁(U₁*)=−2πiU₁*, which equals δ₁(U₁)*. For 1+U₁ at θ=0, Q₀=1 while P₀=2.
- At m=0 the reverse seminorm estimate uses exponent 3: Σ_(r,s)(1+|r|+|s|)^(−3) is finite since the radius-n shell has 4n points; exponent 2 instead gives a divergent harmonic tail.

### Examples

Unipotent 2×2 matrices and 1+U₁ test noncommutative inversion and the nonequality of torus seminorms.

### Dependencies

Layers 0–4; BanachAlgebras A1–A2; Layer 6 only for exact Gårding identification; NoncommutativeGeometry N6 only for the torus Fourier comparison.

## Downstream consumers

[NoncompactQuantumSymmetry M0](../../NoncompactQuantumSymmetry/README.md) uses the unitary Hilbert specialization and owns analytic vectors, elliptic estimates and adjoint closures. [OperatorKTheory K3](../../OperatorKTheory/README.md) uses the inverse-closed Fréchet star-algebra input and owns the K₀/K₁ comparison. NoncommutativeGeometry N6 uses the torus smooth-vector specialization and owns its Fourier identification, trace and differential calculus; the finite-order seminorm comparison in Layer 8 is the additional bridge. These consumer applications are not prerequisites for the generic results.

## References

- Bill Casselman, [*The theorem of Dixmier & Malliavin*](https://personal.math.ubc.ca/~cass/research/pdf/Dixmier-Malliavin.pdf), revision of 24 January 2016: p.1 (smooth vectors, integrated action and density); Proposition 1.3, p.4 (entire products); Lemmas 4.1–4.2, pp.9–10 (scalar parametrix and tail bound); Lemma 5.1, p.12 (compact support); Proposition 6.1, p.13 (support-controlled vector factorization). The alternating signs and simultaneous upper bounds in Layer 5 are fixed by its Fourier convention, not by the signless display or the maximum of upper bounds in the exposition.
- Jacques Dixmier and Paul Malliavin, *Factorisations de fonctions et de vecteurs indéfiniment différentiables*, Bulletin des Sciences Mathématiques 102 (1978), 305–330, Lemma 2.5 and Theorems 3.1, 3.3. The primary locators are uncertified; Casselman's stated locators support the factorization route above. The stronger function-support statement has the explicit fixed-support proof route in Layer 6.
