# Smooth vectors in Banach representations of Lie groups

Build the smooth-vector theory of strongly continuous Banach representations of finite-dimensional real Lie groups: compact-support integration, closed infinitesimal generators, the complete smooth-vector topology, the derived Lie and enveloping actions, and the full finite-sum theorem of Dixmier–Malliavin. Develop its exactness and tensor operations and its Banach-algebra specialization. The aim is a reusable analytic representation theory, including actions that are neither unitary nor uniformly bounded on the whole group.

## Objects, scope and conventions

Let G be a finite-dimensional Hausdorff real Lie group without boundary. Connectedness and second countability of G are not standing hypotheses. Let E be a Banach space over 𝕜=ℝ or ℂ, without a separability hypothesis. Use Mathlib's `ContRepresentation 𝕜 G E`, a monoid homomorphism into continuous linear endomorphisms, together with the explicit hypothesis

`∀ v : E, Continuous (fun g : G => π g v)`.

That structure alone does not assert this continuity. The group law supplies inverse operators. Do not replace strong continuity by continuity in operator norm, nor assume `sup_g ‖π(g)‖<∞`. For example, π(t)v=e^t v on the additive real group is in scope. State operator bounds by inequalities with constants rather than introducing a private boundedness predicate. The Lie algebra is real even when E is complex. Use the native Lie algebra of left-invariant derivations and its tangent-space comparison from LieGroups. Differentiate the left action `π(gh)=π(g)π(h)`.

Fix a nonzero regular left Haar measure μ. Adopt [BanachAlgebras A7](../../BanachAlgebras/README.md)'s modular convention

`∫ F(xg) dμ(x) = c(g) ∫ F(x) dμ(x)`.

Define `D(G)=C_c∞(G,𝕜)` as the compact-support subtype of Mathlib's `ContMDiffMap`; in a Euclidean chart compare it with Mathlib's existing `TestFunction`, not a second Euclidean test-function theory. Define

`π(f)v = ∫_G f(g) • π(g)v dμ(g)`,
`(f*h)(x) = ∫_G f(y)h(y⁻¹x) dμ(y)`.

Use the native Bochner integral and prove its integrability before its identities. For X in the real Lie algebra write

`dπ(X)v = d/dt|₀ π(exp(tX))v`,
`L_X f(g) = d/dt|₀ f(g exp(tX))`,
`R_X f(g) = d/dt|₀ f(exp(tX)g)`.

L is left invariant; R is right invariant. X↦R_X is an anti-Lie map, whereas X↦−R_X is a Lie map. In these conventions `dπ(X)π(f)v=π(−R_X f)v`. For a Banach star-algebra action the star law is `dπ(X)(a*)=(dπ(X)a)*`; the Hilbert skew-adjoint pairing law is a different specialization.

## Existing foundations and ownership

Use Mathlib's `ContRepresentation`, `ContIntertwiningMap`, `ContMDiff`, `ContMDiffMap`, `ContinuousLinearMap`, `LinearPMap`, `Seminorm`, `WithSeminorms`, Lie homomorphisms, Lie modules, `UniversalEnvelopingAlgebra`, Bochner integration, `TestFunction` and `Distribution`. Use TauCeti's `oneParameterSubgroup` and `contMDiff_oneParameterSubgroup`, and `StronglyContinuousSemigroup` with its native generator, closedness, domains of powers and smooth-orbit comparison. Prove the adapters here; native one-parameter smooth vectors do not by themselves give mixed Lie-algebra word domains.

Dependencies are early, named clauses:

- [LieGroups](../LieGroups/README.md), Layers 0–3: the native Lie algebra, exp/Ad, one-parameter subgroups and the local ordered-product exponential chart. No classification, maximal torus or representation decomposition is needed.
- [OneParameterSemigroups Part A](../../OneParameterSemigroups/README.md): real C₀ semigroups and their closed `LinearPMap` generators, with the actual TauCeti generator API used where present.
- [BanachAlgebras A7.ChosenApproximateIdentity and A7.IntegratedRepresentations](../../BanachAlgebras/README.md): Haar/modular conventions, localized Bochner measurability/Fubini, and comparison with globally uniformly bounded L¹ representations. SB1 supplies the smooth kernels and local compact-support estimates needed without that global bound. The localized integration proofs use neither A7's Fourier theory nor Johnson's theorem.
- [BanachSpaceTheory B4](../../BanachSpaceTheory/README.md): the completed Banach projective tensor and bounded-bilinear universal property, used in SB7. [NoncommutativeGeometry N1.Tensor](../../NoncommutativeGeometry/README.md#n1tensor-completed-locally-convex-projective-tensors) is the sole owner of the early completed locally convex projective tensor contract over both ℝ and ℂ, with scalar restriction/complexification comparisons; SB7 consumes it on the smooth Fréchet spaces. N1.Tensor precedes SB7 and uses no SB result. The later SB8→N6 torus application is a separate edge.
- [BanachAlgebras A1–A2](../../BanachAlgebras/README.md): unitization, inversion and holomorphic functional calculus, used only in SB8. [OperatorKTheory K3](../../OperatorKTheory/README.md) consumes the resulting inverse-closed Fréchet algebra; SB8 does not depend on K-theory.

This roadmap owns generic Lie smooth vectors, their complete locally convex topology, compactly supported smoothing and full Dixmier–Malliavin. [AutomorphicFormsOnReductiveGroups §2.1](https://github.com/TauCetiProject/TauCetiRoadmap/blob/04038f3cfbc018183bfe4190d837ce8e778f67aa/TauCetiRoadmap/AutomorphicFormsOnReductiveGroups/README.md#21-compact-finite-vectors-and-admissibility) owns the common topology-free orbit-span API and generic complex Banach compact-group G-finite density. CompactGroups Layer5.1 retains its compact-group application witnesses and covariance refinements; SB4 consumes that interface and supplies the real-case adapter and stronger smooth-topology comparison. NoncompactQuantumSymmetry M0 consumes this theory in the unitary Hilbert case and owns Nelson analytic vectors, elliptic estimates and adjoint-closure theorems. NoncommutativeGeometry N6 consumes SB8 and owns the torus Fourier/rapid-decay identification and its normalized derivations. These specializations do not feed the generic proofs.

The word “smooth” here refers to differentiable orbit maps. Mathlib's developing smooth representation API for open stabilizers of totally disconnected groups is a different notion: follow [Mathlib PR41525](https://github.com/leanprover-community/mathlib4/pull/41525) and [PR41520](https://github.com/leanprover-community/mathlib4/pull/41520)'s use of native representation carriers without conflating their stabilizer condition with `ContMDiff`. Follow [PR37932](https://github.com/leanprover-community/mathlib4/pull/37932)'s exponential-map design and adopt Mathlib's resulting vocabulary when present. Build the needed adapters in TauCeti now. A suitable implementation home is `TauCeti/RepresentationTheory/Continuous/SmoothBanach/`.

## SB0. Strong actions, local bounds and one-parameter generators

1. Prove that strong continuity implies joint continuity of `(g,v)↦π(g)v`. On every compact K⊆G prove `∃ C≥0, ∀ g∈K, ‖π(g)‖≤C` by uniform boundedness applied to the compact images of each orbit. Derive locally uniform operator bounds from relatively compact neighborhoods. Include restriction to open/closed subgroups, finite products, conjugation, continuous intertwiners and realification. These preserve the explicit orbit-continuity hypothesis.
2. For each X construct the real C₀ semigroup `t≥0↦π(exp(tX))`, using restriction of scalars when 𝕜=ℂ. Its native generator is the unbounded operator A_X. Identify its domain and values with the two-sided derivative at zero of the group orbit. Prove the one-sided/two-sided comparison from the inverse group law; prove that the domain is a 𝕜-submodule and A_X is 𝕜-linear. Retain native `LinearPMap` and its graph-closedness, dense domain, invariance under this one-parameter group and generator commutation. Do not introduce a parallel unbounded-operator carrier.
3. Give explicit recursively composable word domains: for a word `(X₁,…,X_r)`, A_X₁⋯A_Xr v is defined by starting with the rightmost operator, requiring each preceding domain membership. The empty word is v. Prove truncation, linearity, restrictions and compatibility with native powers for repeated X. Products of closed generators are not asserted closed as operators on E.

## SB1. Smooth tests, local Haar density and compact-support integration

1. Build `D(G)`, its linear structure, support/zero-extension/translation and inversion rules. On each compact K construct `D_K(G)={f∈D(G):tsupport f⊆K}` with derivative seminorms in a finite atlas, independent of atlas and equivalent to invariant-derivative seminorms. Prove completeness and continuity of restriction, differentiation, multiplication and chart transport. Compare chart-supported tests exactly with native Euclidean `TestFunction` and `ContDiffMapSupportedIn`. Use Mathlib's smooth bump functions to extend compactly supported chart tests by zero and to construct finite cutoff decompositions. Give D(G) the locally convex final topology of these fixed-support spaces and prove the universal property needed below. Do not call this an LF topology for a group with no countable compact exhaustion.
2. Prove that Haar measure has a strictly positive smooth density in every Lie chart. Construct a smooth left-invariant positive Riemannian metric from an inner product on the Lie algebra; reuse TauCeti's chart volume density, smoothness, change-of-variables and isometry invariance, then Haar uniqueness. Account for the hypotheses of those native measure theorems: a symmetric relatively compact identity neighborhood generates an open σ-compact Lie subgroup H, which is second countable/Lindelöf; prove the inherited open-subgroup Lie/manifold structure and apply the volume theorem there. Any compact subset of G meets only finitely many left cosets of H. Translate and glue the local comparisons on these cosets. Prove independence from H and the charts. Thus no global σ-finiteness or second countability of G is imposed. If G is connected, H=G.
3. For continuous scalar f of compact support K prove integrability of `g↦f(g)•π(g)v` and the bound

   `‖π(f)v‖ ≤ C_K ‖f‖₁ ‖v‖`.

   Produce the bounded linear operator π(f); prove linearity, continuous-intertwiner naturality and independence of representatives. Supply strong measurability from finite-chart compact localization and separable compact images of each orbit, without requiring separability of E. The bound is local in K. A bounded action of all L¹(G) follows under the extra global operator bound, and agrees with A7.IntegratedRepresentations.
4. Prove associativity, support `tsupport(f*h)⊆tsupport(f)·tsupport(h)`, smoothness of test convolution, and `π(f*h)=π(f)π(h)`, using compact localized Fubini and changes of variables. Prove left covariance `π(g)π(f)=π(L_g f)`, `L_g f(x)=f(g⁻¹x)`. Prove the modular right-translation and involution comparisons with A7; for unitary representations obtain `π(f*)=π(f)*`. These statements precede the derived action.
5. For every identity neighborhood U choose nonnegative smooth u_U with support in U and integral one. Give shrinking-support and fixed-compact bounds and show π(u_U)v→v in E, uniformly for v in norm-compact sets. Use the neighborhood net and compare choices. In dimension zero G is discrete; identify the unit test at e as `1_{e}/μ({e})` and treat smoothing and factorization directly.

## SB2. Orbit regularity and the smooth-vector topology

Define E^k by `ContMDiff I 𝓘(ℝ,E) k (fun g=>π(g)v)`, and E∞ by k=∞. Show these are invariant 𝕜-subspaces. For any basis `(X_i)` of the real Lie algebra prove that v∈E^k exactly when all composable basis words of length≤k are defined; for E∞ use all finite lengths. Prove equivalence with the quantification over arbitrary X's, and independence of the chosen basis. State the finite-k result for natural k, including k=0, where strong continuity gives E^0=E. Pure powers in separate basis directions are not a replacement for mixed words.

Own the analytic bridge in that equivalence. A continuous Banach-valued function with continuous derivatives along a smooth frame is C¹: in charts, interpret frame derivatives as distribution derivatives by curve integration and integration by parts, invert the smooth frame coefficient matrix, and use Euclidean mollifiers plus the Banach-valued fundamental theorem of calculus to recover the coordinate derivative. Prove this lemma using native chart/test/distribution and Bochner APIs, including its Banach-valued/weak-pairing comparison. Iterate it on `g↦π(g)A_w v`. Conversely differentiate a smooth orbit along the invariant frame. This proves linearity in X and the mixed-word dictionary without assuming unproved invariance of generator domains under Ad(G).

On E∞ put

`p_m(v)=Σ_(basis words w, |w|≤m) ‖A_w v‖`.

Use a type synonym of the algebraic smooth submodule carrier for its stronger topology; transport the module structure and retain a separate continuous inclusion into E. Do not inherit the ambient norm topology as the smooth topology. Use native `Seminorm` and `WithSeminorms` for this topology. Prove it is Hausdorff, metrizable, locally convex and complete, and prove the continuous injective inclusion E∞→E. Identify this topology with the initial topology of all word evaluations into E, and with uniform-on-compact orbit-derivative seminorms. For completeness, Cauchy limits of each word coordinate are linked successively by closedness of each first-order A_X; no closedness of arbitrary E-operator products is used. Give equivalent seminorms from U(𝔤), once SB3 is built, with explicit finite-order comparison constants.

E∞ is a Fréchet space and need not be normable. Do not give it a fictitious norm in order to apply normed-manifold `ContMDiff`. For maps from finite-dimensional manifolds into E∞ define smoothness through the E-valued word-coordinate maps and prove the corresponding derivative/chain/product rules and equivalence with smoothness in the compatible locally convex calculus. The action on E∞ is jointly continuous and these orbit maps are smooth in that sense; its composition with E∞→E agrees with the original smooth orbit. This coordinate criterion is the calculus interface used in SB5–SB8.

## SB3. Differentiated actions and integration by parts

1. On E∞ construct `dπ : 𝔤 →ₗ⁅ℝ⁆ Module.End 𝕜 E∞`, continuous in X and with each dπ(X) continuous for the Fréchet topology. Prove additivity, real scalar linearity and `[dπ(X),dπ(Y)]=dπ([X,Y])`, by differentiating the smooth action and LieGroups' bracket convention. Give the estimates `p_m(dπ(X)v)≤C_X,m p_(m+1)(v)`. Construct the complexified Lie action when 𝕜=ℂ and extend through the native universal property to U(𝔤) or U(𝔤_ℂ); prove multiplication order, unit, filtration and ordered-word compatibility. Only the existing algebraic enveloping universal property and finite word spanning are needed, not highest-weight representation theory.
2. Prove `π(g)dπ(X)π(g)⁻¹=dπ(Ad(g)X)` on E∞, its mixed-word form and locally uniform bounds for π(g):E∞→E∞. Prove full G-invariance even when G is disconnected. Natural restriction to open subgroups identifies the same smooth vectors/topology; restrictions to general Lie subgroups give the continuous inclusion and the derived-action comparison, without asserting equality of smooth-vector spaces.
3. Prove smoothing and all mixed derivatives of π(f)v by differentiating the translated test. Explicitly,

   `dπ(X)π(f)v=π(−R_X f)v`,
   `dπ(X₁)⋯dπ(X_r)π(f)v=π((−R_X₁)⋯(−R_Xr)f)v`.

   In the second formula operator composition is read right to left on both sides. Prove the anti-bracket law for R and the resulting Lie homomorphism for −R. For fixed support K, give all bounds `p_m(π(f)v)≤C_K Σ_(|w|≤m) ‖(−R)_w f‖₁ ‖v‖`; hence fixed-support smoothing is continuous into E∞. This establishes that every π(f)v is smooth, for arbitrary v∈E.
4. For smooth v prove the other integration-by-parts formula

   `π(f)dπ(X)v=π(q_X f−L_X f)v`,
   `q_X=d/dt|₀ log c(exp(tX))`.

   Derive it from the stated modular change of variables; prove q is real linear, vanishes on brackets and agrees with `tr(ad X)` in this modular convention. In the unimodular case q=0. Compare the adjoint/involution in the unitary Hilbert case, where real X is skew symmetric on the smooth domain. For star-algebra actions prove the distinct star-derivation law in SB8. State all integration-by-parts domains explicitly.

## SB4. Density and smoothing in the complete topology

Prove π(u_U)v→v in every p_m when v∈E∞, using the Ad-covariance bounds and local uniform strong continuity on the finitely many word coordinates. Thus the net converges in the Fréchet topology as well as in E. For arbitrary v∈E, SB1 and SB3 give smooth approximants converging in norm, so E∞ is dense. Prove the uniform-on-compact refinement in E∞ and independence of the smooth approximate identity. Identify native one-parameter `StronglyContinuousSemigroup.smoothVectors` with this definition when G=(ℝ,+), including the scalar-restriction and half-line orbit dictionary. Keep this comparison separate from the many-direction frame proof.

For compact Lie G consume the same shared §2.1 orbit-span predicate and Banach density theorem through CompactGroups Layer5.1's application interface. For real E, use the actual `TauCeti.Complexification E` with `ContinuousLinearMap.complexify` to extend the action, and `ofRealLI`/`reCLM` to include and project. The product-topology comparison proves strong continuity of the complexified action. A finite-dimensional complex orbit span is finite-dimensional over ℝ, and its real-part image contains the real orbit span of the projected vector. Hence projection of complex G-finite approximants gives real G-finite approximants, with the native real-part norm bound. Prove that these maps commute with every derived word and are continuous for the smooth seminorms, so the same adapter applies to the stronger topology. This is the real specialization of the shared theorem, not another predicate or generic complex density owner. Every G-finite vector is smooth, because its finite-dimensional invariant span carries a continuous representation, smooth by LieGroups' finite-dimensional homomorphism theorem. Prove that G-finite vectors are dense also in the topology of E∞: first smooth with f, then approximate f in the finitely many invariant-derivative L¹ seminorms by representative functions, by convolving a Peter–Weyl uniform approximation on the side where derivatives remain on f. Prove those derivative and support formulas; uniform C(G) density alone is not used as a C∞ approximation theorem. This comparison does not enter generic compact-group G-finite density.

## SB5. The one-variable factorization engine

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

## SB6. Full Dixmier–Malliavin with support control

For every v∈E∞ and every open identity neighborhood U prove the existence of a finite family `f_j∈D(G)`, `v_j∈E∞`, with `tsupport(f_j)⊆U` and

`v=Σ_j π(f_j)v_j`.

The empty sum handles v=0. No common bound on the number of terms is needed in the public interface, and no one-term factorization is asserted.

Prove it by applying SB5 successively in an ordered basis of the Lie algebra to the finite family of inner smooth vectors at each step. Choose a sufficiently small box for

`Φ(t₁,…,t_d)=exp(t₁X₁)⋯exp(t_dXd)`

to be a diffeomorphism onto an identity neighborhood and to map the closed supporting box into U. Each final branch is an ordered convolution of d compactly supported line measures. If `Φ*μ=J(t)dt`, SB1 gives smooth J>0 and the resulting density on G is

`f(Φ(t))=(∏_i g_i(t_i))/J(t)`,

extended by zero. Prove its smoothness and support, including a compact margin inside the chart, and prove the exact equality between the iterated integrated operators and π(f). Treat d=0 by SB1's discrete unit test. For a group with many components use the open σ-compact subgroup from SB1 and extension by zero; E∞ for that subgroup equals E∞ for G, since left cosets are open and orbit maps there are fixed bounded linear transforms of the local orbit.

Deduce the two exact algebraic equalities, not merely closure equalities:

`E∞=span{π(f)v : f∈D(G), v∈E}`
`   =span{π(f)v : f∈D(G), v∈E∞}`.

These identify the Gårding domain with the smooth vectors and keep the witnesses of finite sums and prescribed supports.

Prove also the function version: every φ∈D(G) is a finite sum f_j*h_j, with support(f_j)⊆U and support(h_j)⊆support(φ). In this proof the terminal factors are limits of series of derivatives of φ in a fixed-support smooth function space; derivatives and that topology retain support(φ). Track these terminal factors through the basis iteration rather than appealing to an arbitrary orbit translate. Compare convolution densities with the vector statement. Prove continuity and intertwiner compatibility of each integrated factorization expression; no continuous global choice of factorizations is required.

## SB7. Functorial operations and exactness

1. Every native continuous intertwining map T:E→F restricts to a continuous linear map E∞→F∞ commuting with π(f), dπ and U(𝔤). Prove identity, composition and isomorphism laws, including restriction-of-scalars compatibility. For a closed invariant subspace M prove `M∞=M∩E∞`, with the induced smooth topology.
2. Give the Banach quotient E/M its strongly continuous quotient action. Prove surjectivity of `E∞→(E/M)∞` using SB6: factor a quotient smooth vector, lift each inner vector arbitrarily to E, and smooth those lifts with the same kernels. Prove the resulting short sequence of smooth spaces is exact, with the kernel topology just identified. This proves lifting without assuming differentiability of arbitrary linear lifts or a complemented M. The quotient-topology comparison follows from the Fréchet open mapping theorem; include its Baire proof/actual native comparison as a target if that general locally convex theorem is not present, rather than using a normed-only theorem on E∞.
3. Prove finite-product compatibility with the smooth topology. On the completed Banach projective tensor of two strong representations construct the diagonal strong action with local operator bounds, using B4's universal property. Pure tensors of smooth vectors are smooth and `dπ(X)(v⊗w)=dπ_E(X)v⊗w+v⊗dπ_F(X)w`. Prove the higher binomial/shuffle identities and continuity on the smooth spaces. Consume N1.Tensor over the same 𝕜=ℝ or ℂ for the completed locally convex projective tensor of the two smooth Fréchet spaces. Prove the smooth-pure-tensor bilinear map is jointly continuous by the shuffle seminorm bounds, then use that single universal property to construct its continuous linear map into the diagonal smooth space. Prove the map intertwines actions and derived words and commutes with realification/complexification through N1.Tensor’s actual scalar-comparison maps. The generic seminorm construction, Hausdorff completion and universal property are owned there, not rebuilt here. No assertion of injectivity or isomorphism is made without approximation/nuclear hypotheses. Prove density of the span of smooth pure tensors in the diagonal smooth space: apply a smoothing kernel to norm approximants, choose the norm approximants with both tensor factors smooth, then approximate that smoothed smooth-pure-tensor integral in every finite collection of derivative seminorms by sums of translated smooth pure tensors. This identifies the needed dense range without a false tensor-isomorphism assertion.
4. For the continuous dual define the closed invariant subspace of vectors whose contragredient orbit is norm continuous. Prove its strong action and apply SB0–SB6 there. Compare differentiated pairings and the negative transpose on the relevant common domains. Do not assert strong continuity on the entire Banach dual; the translation action on dual measures supplies a counterexample.

## SB8. Smooth Banach algebras, star and spectral invariance

Let A be a real or complex Banach algebra with a strongly continuous action by bounded linear algebra automorphisms. Apply the same E∞ carrier, not a second smooth-element definition. Prove it is a dense complete Fréchet subalgebra; prove continuity of multiplication by the full iterated Leibniz/shuffle estimates for the p_m. Each dα(X) is a continuous derivation on A∞ and X↦dα(X) is a real Lie homomorphism into native derivations. For complex A give the complexified Lie and enveloping actions and the coproduct product rule; enveloping operators of higher degree are not all derivations.

For a Banach star-algebra with bounded star and a star-preserving action, prove closedness under star, continuity of star for every p_m and `dα(X)(a*)=(dα(X)a)*`. Include units, invariant elements, equivariant bounded algebra/star homomorphisms and unitization comparisons. Do not require automorphisms to be isometric except when that follows from the C*-algebra specialization.

For unital A prove inverse closure: if a∈A∞ is invertible in A, then its inverse lies in A∞, by differentiating `α(g)(a⁻¹)=α(g)(a)⁻¹` and Banach-algebra inversion. Give the recursive derivative estimates and `dα(X)(a⁻¹)=−a⁻¹dα(X)(a)a⁻¹`. Prove the result at every matrix level; for nonunital A use the scalar unitization and identify its smooth elements with the unitization of A∞. For complex A prove holomorphic-functional-calculus closure using A2's resolvent contours and all derivative seminorm estimates: realize contour integration as an E-valued integral with all word coordinates integrable, then use closedness/completeness to place it in A∞. Do not invoke a Banach-valued Bochner theorem on an invented norm for the Fréchet space.

In the C*-algebra case these give exactly the dense inverse-closed Fréchet star-algebra input of OperatorKTheory K3, which owns the K₀/K₁ comparison. NoncommutativeGeometry N6 identifies the torus gauge smooth vectors with rapidly decreasing Fourier series and owns the `2πi` Fourier normalization, traces and differential calculus. Prove that its rapid-decay and derivative seminorm families define the same Fréchet topology by explicit finite-order estimates in both directions, not equality of individual seminorms. With ordered Fourier coefficients a_(r,s), use Q_k(a)=sup_(r,s)(1+|r|+|s|)^k|a_(r,s)| and the SB2 coordinate-word sums P_m. Retain δ_j(U₁^rU₂^s)=2πi n_j U₁^rU₂^s. Prove Q_k≤C_k P_k and P_m≤D_m Q_(m+3), with finite positive constants independent of a and θ; coefficient extraction is contractive and the reverse bound uses absolute summability on ℤ². In particular at θ=0, a=1+U₁ has Q_0=1 and P_0=‖a‖=2, so these seminorms are not isometric. Under this topological identification consume the generic density, star, derivation and all-matrix inverse/holomorphic-closure theorems; no Fourier normalization or HFC scope is changed.

## Proof order and references

Build SB0 and SB1 first, then SB2–SB4. SB5's scalar analytic parametrix and its vector passage use SB2's completeness and SB3's word-coordinate calculus. SB6 uses SB5 and the local product chart. SB7's quotient lifting uses SB6; no quotient lifting is used to prove SB6. Its tensor clause uses the independent early N1.Tensor over the same real or complex scalar field; N1.Tensor does not consume SB7 or the later N6 application. SB8 uses only SB0–SB4 for its algebra/calculus/spectral results and SB6 for its exact Gårding-domain identification. Compact Peter–Weyl and the Hilbert/torus consumer comparisons have no edge back into the generic argument.

The mathematical reference is Dixmier–Malliavin, *Factorisations de fonctions et de vecteurs indéfiniment différentiables*, Lemma2.5 and Theorems3.1/3.3, including the identity-neighborhood support refinement. [Casselman's exposition](https://personal.math.ubc.ca/~cass/research/pdf/Dixmier-Malliavin.pdf), §§5–6, expands the parametrix estimates. With the Fourier convention above the vector series retains `(−1)^n`; the signless series in the displayed proof of Casselman's Proposition6.1 is not the convention used here. The scope here is Banach representations; a theorem about arbitrary complete locally convex representations is not presumed from the Banach proof.
