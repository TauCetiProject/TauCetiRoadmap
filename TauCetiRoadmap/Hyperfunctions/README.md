# Sato hyperfunctions and analytic generalized functions

Build the Sato sheaf on every Hausdorff, second-countable real-analytic
n-manifold without boundary, for each finite n, including noncompact and
nonorientable manifolds. Include complex and real structures, hyperforms,
hyperdensities and analytic vector bundles of every fixed finite rank r.
Use the native fixed-model manifold and `VectorBundle` carriers. A space
with varying dimension or rank is an explicitly indexed disjoint union of
such components: construct its sheaf by the product of sections on the
component opens and prove restriction, gluing and all operations componentwise.
In dimension0 use arbitrary complex-valued functions on the discrete space.

Use `TopCat.Sheaf (ModuleCat ℂ)`, its actual morphisms, kernels and derived
cohomology. In dimension1 use the explicit holomorphic quotient and its
restriction maps in `Suggested.lean`, with the canonical embedding
characterized in HF4. In all dimensions use analytic closed-support sheaf
cohomology.

## Suppliers and order

[RealAnalyticGeometry R0/R3.0](https://github.com/TauCetiProject/TauCetiRoadmap/blob/525a920850e39a4db23a778eec27cb75308b877a/TauCetiRoadmap/RealAnalyticGeometry/README.md#r30-global-complexification-and-tubes)
owns analytic germ extension, Bruhat–Whitney complexification, its real
structure and uniqueness of its germ, using ComplexManifolds #279's named
manifold/gluing/bundle carriers. Its R3.1/R3.2 owns weighted Stein theory,
approximation, compact-neighborhood bundle generation and coherent Cartan A/B.
[ComplexKahlerGeometry K1/K2/K4](https://github.com/TauCetiProject/TauCetiRoadmap/blob/13b2335ea038b439655df55654e71b19603d8ee1/TauCetiRoadmap/ComplexKahlerGeometry/README.md#k2-dolbeault-calculus-and-the-local-lemmas)
owns the common type-form carrier, holomorphic sheaves/bundles, Dolbeault
resolution and Čech/derived comparisons. K2's parameter solver is used on its
stated product domains. [GlobalHolomorphicFunctions GH0](https://github.com/TauCetiProject/TauCetiRoadmap/blob/30a7252b70e6e7169abc023ea8856ceabb43206a/TauCetiRoadmap/GlobalHolomorphicFunctions/README.md#L192-L220)
supplies its one-variable input.

[CK K5a](https://github.com/TauCetiProject/TauCetiRoadmap/blob/13b2335ea038b439655df55654e71b19603d8ee1/TauCetiRoadmap/ComplexKahlerGeometry/README.md#k5-compact-hermitian-elliptic-theory-and-serre-duality)
owns the global smooth-section compact-C^∞ Fréchet carrier and its compact-
distribution dual, density lines, LF bundle tests, distributions, finite-order
and supported finite-jet structure, and the positive-dimensional exp(1/‖x‖²) nonextension
example. [PDO P1.0/P6/P8](https://github.com/TauCetiProject/TauCetiRoadmap/blob/063cf517a1dcc4d929e0602c6e6f585953aceab8/TauCetiRoadmap/PseudodifferentialOperators/README.md)
owns differential-operator/density transpose, P6’s local interior
distributional elliptic regularity and Sobolev estimates, and the generic
distribution pullback/product calculus. These distribution suppliers precede Hyperfunctions.
HF0 constructs closed-support/relative cohomology and its local sheaf lemma;
HF1 constructs the intrinsic Sato sheaf; HF2 proves purity, top vanishing,
flabbiness and local duality; HF3 supplies analytic operations; HF4 constructs
the distribution embedding and its boundary-value comparison; HF5 exports
arbitrary-open extension. HF3a constructs microfunctions and analytic wavefronts
from the HF0–HF2 sheaves and HF3's wedge representatives, then proves analytic
noncharacteristic pullback and admissible products. Its comparison with the
analytic wavefront of distributions follows the embedding in HF4. The late
RQFT6 hyperfunction adapter consumes HF3–HF5.

### Reusable interfaces and construction order

All section maps, cohomology maps and representative comparisons are natural
in the stated open inclusions and coefficient morphisms. Build the supported
functors both for `ModuleCat ℂ` and for `AddCommGrpCat` (equivalently
`ModuleCat ℤ` for the orientation calculations); prove the underlying-abelian,
complex-scalar and orientation-tensor comparisons. The relative complexes,
analytic sheaf modules and orientation local systems retain their actual
coefficient categories. Consume the native stalk exactness and zero/exactness detection theorems in
`Mathlib.Topology.Sheaves.Abelian`, and derive the needed monomorphism and
coefficient-forgetful comparisons. Consume the native
`IsGrothendieckAbelian` instances from
`Mathlib.Algebra.Category.ModuleCat.AB`,
`Mathlib.Algebra.Category.Grp.AB` and
`Mathlib.Topology.Sheaves.Abelian`, followed by
`CategoryTheory.IsGrothendieckAbelian.enoughInjectives` in
`Mathlib.CategoryTheory.Abelian.GrothendieckCategory.EnoughInjectives`.
Supply `HasSheafify` on every open-set site used here and check the
coefficient and morphism universes in those instances. In the small-universe
case these give enough injectives directly for complex-module and abelian
sheaves. For larger sheaf universes construct the scalar and coefficient
equivalences using `ULift` of the scalar ring, transport them to sheaves and
transport the native instances, with the required sheafification comparisons.
The owned targets are these coefficient/universe transports and the
supported-section, underlying-abelian and orientation comparisons. Consume
`HasDerivedCategory.standard`, `DerivedCategory.Plus` and
`Functor.rightDerivedFunctorPlus` for the resulting bounded-below derived
functors, and prove their comparison with the supported-section resolutions.

| Layer | Usable output and preceding inputs |
| --- | --- |
| HF0 | Closed-support derived functors, support/excision sequences, relative cones, orientation and FlasqueLocality; native sheaf/module/Ext APIs and K2's resolution comparisons. |
| HF1 | Sato sheaves and analytic bundle coefficients, complexification-germ descent and the one-dimensional quotient comparison; R0/R3.0, K1/K3.0/K4 and HF0. |
| HF2 preparation | Scalar top vanishing; FS/DFS strong-dual calculus; properly supported current regularization; Stein bundle duality. K5a's smooth/LF/dual carriers, PDO local regularity, B1/B2, GT3b and K2/R3.2 are the external inputs. |
| HF2.1 | Compact analytic-germ duality, every required complement closed range, dense germ restriction and real-support purity, in that order. The dimension-one quotient is separate. |
| HF2.2–HF2.3 | All-open flabbiness by chart support sequences and locality; manifold/bundle strong compact duality and its support/coordinate maps. |
| HF3–HF3a | Analytic operators, hyperforms, conjugation, external products and wedge boundary values; then conic specialization/microfunctions and noncharacteristic operations. |
| HF4 | Canonical distribution/density/bundle embedding and boundary/wavefront comparisons; HF2.3, HF3–HF3a and the distribution suppliers. |
| HF5 | Surjective restriction on all opens, the complete supported extension fibre, source-qualified examples and quotient transport; HF2–HF4. |

The global smooth-section FS carrier and its compact-current strong dual are
distinct from the LF compact-test carrier and its compact-convergence
continuous dual. Every comparison below proves continuity for those stated
topologies. The microlocal conic sheaves in HF3a are sheaves of complex
modules; their derived operations do not define a topology on hyperfunction
sections by transporting a distribution topology.

## HF0. Closed supports, relative complexes and locality

For closed S⊆X define the left exact supported-section functor
`Γ_S(W,F)=ker(F(W)→F(W\S))`. Construct its right derived functors and the
sheaves `𝓗_S^q(F)` by sheafifying supported cohomology on opens. Prove the
native injective/flabby-resolution comparison, naturality, restriction,
excision and long exact sequences for support inclusions and open triples.
For the purity application construct the degenerate edge comparison: if
`𝓗_S^q(F)=0` for q≠n, prove
`H_Z^(n+j)(W,F)≃H_Z^j(S,𝓗_S^n(F))` for closed Z⊆S, including restriction
and j=0. Also prove the support-truncation implication: if
`𝓗_S^q(F)=0` for q<n, then `H_S^q(W,F)=0` for q<n. Derive both
comparisons from the composed supported-section derived functors, the
bounded-below local hypercohomology filtration and its restriction maps.

Implement closed-support cohomology through the actual sheaf category.
For an open O⊆W let C_O be the sheafification of the free complex-module
Yoneda object corepresenting sections on O. Construct C_(W\S)→C_W and
`Q_S=coker(C_(W\S)→C_W)`. Prove
`Hom(Q_S,F)≃Γ_S(W,F)` and `Ext^q(Q_S,F)≃H_S^q(W,F)` with naturality.
Construct the free-presheaf/sheafification adjunction and its comparison
with the constant-ring `SheafOfModules` carrier for this closed-set support
construction.

Identify derived supports with `Cone(RΓ(W,F)→RΓ(W\S,F))[-1]`. Native
`CochainComplex.mappingCone` has differential `(-d_F a, f a+d_G b)`;
the native shift[-1] changes this to `(d_F a,−f a−d_G b)`. The isomorphism
`(a,b)↦(a,−b)` gives the relative convention

```
A^(p,q)(W) ⊕ A^(p,q−1)(W\S),
d_rel(α,β)=(∂̄α, α|_(W\S)−∂̄β).
```

Use the cone of the ordinary fine Dolbeault resolutions on the two opens.
Prove square zero, cycles, boundaries, complex linearity, resolution
independence, restriction/shrinking, refinement, excision and all product
signs. Build the relative de Rham comparison and type projection. The cup
product for local duality has its specified supports and does not assert
a same-variable product for all hyperfunctions.

Define `or_(M/X)=𝓗_M^n(ℤ_X)` for the real n-codimensional embedding.
Compute its stalks by local Euclidean relative cohomology, identify normal
coordinate generators and sign-of-normal-determinant transitions, and prove
the canonical square pairing `or⊗or≃ℤ_M`. Compare it to the normal-bundle orientation line by these same local
generators. For z=x+iy use normal y before tangent x; its difference
from interleaved complex orientation is `(-1)^(n(n+1)/2)`. Prove coordinate
naturality and use boundary convention `R₀₁=−∂R₁` in relative integration.

Prove **FlasqueLocality** for sheaves of sets and then modules: if every
point has an open neighborhood W on which every restriction F(V)→F(U),
U⊆V⊆W, is surjective, then every open restriction on X is surjective.
Order extensions of a fixed section by their open domains. Glue chains,
apply Zorn, and extend a maximal section across a local flabby neighborhood
to prove its domain is all X. Express the module conclusion using native
`TopCat.Sheaf.IsFlasque`. Derive finite products and locally finite-rank
locally constant twists from this lemma.

## HF1. Intrinsic Sato sheaves and analytic coefficients

For closed totally real M in its R3.0 complexification X define

```
B_M=𝓗_M^n(O_X)⊗_(ℤ_M)or_(M/X),
B_M^(p)=𝓗_M^n(Ω_X^p)⊗_(ℤ_M)or_(M/X).
```

Construct their stalks, restrictions and module/sheaf laws. Use R3.0's germ
uniqueness to compare any two complexifications with identity/composition
coherence, then prove analytic chart descent and local-diffeomorphism transport.
The orientation twist glues the nonorientable case. Before purity these are
cohomology sheaves; the section/relative-cohomology comparison is proved in HF2.

For a rank-r real-analytic complex bundle E, extend its analytic transition
matrices and inverses holomorphically, shrink to a common complexification
germ, prove the cocycle identities there by real-locus uniqueness, and use
K4's native bundle gluing to construct E^hol. Prove germ uniqueness, morphism,
tensor/dual/pullback and chart coherence. A real analytic bundle is handled
by its complexification and real involution. Define B(E) using O(E^hol) and
the same orientation twist. Prove the sheaf-level identification
`B(E)≃B_M⊗_(A_M)E` by local frames, with transition, restriction and
morphism coherence; the tensor product here is a sheaf tensor product. Rank is fixed on each explicitly indexed component.
In dimension1 compare Suggested's actual holomorphic section submodules with
K2/K3's native holomorphic structure sheaf, and its quotient on
`W(U)=ℂ\(ℝ\U)` with this local H¹ definition. Prove the quotient presheaf's
analytic gluing theorem and its restriction/normal-orientation compatibility.
In the ambient-function encoding, holomorphic sections are extended by zero outside their open domain.
Define the analytic scalar sheaf A_M by holomorphic germs along M; it acts
on these cohomology sheaves by restriction and multiplication. Define
hyperdensities as `B_M⊗_(A_M)(Ω_M^n⊗or_M)`.

## HF2. Purity, flabbiness and compact duality

**HF2.AnalyticPreparation — Malgrange top vanishing.**

Own **MalgrangeTopVanishing**: for n≥1, every open Ω⊆ℂⁿ and 0≤p≤n,
`H^n(Ω,Ω^p)=0`; equivalently the top-degree smooth Dolbeault operator is
onto. Use the following constructive real-Laplacian route on Ω⊆ℝ^(2n),
with `Δ=Σ_a∂_a²`.

Own the filled-compact exhaustion and harmonic Runge lemma. There are
compact K_j⊂int K_(j+1) exhausting Ω such that Ω\K_j has no relatively
compact connected component. If h is harmonic on a neighborhood of K_j,
then for every m and ε>0 there is H harmonic on all Ω with
`max_(|α|≤m,x∈K_j)|∂^α(H−h)(x)|<ε`. Prove this by Hahn–Banach and the
compact-distribution dual from K5a: a separating distribution T supported
in K_j annihilates every harmonic function on Ω. Its Newton potential
w=E*T satisfies Δw=T and is real analytic off K_j. Here in real dimension
d=2n, use `E=log‖x‖/(2π)` for d=2 and
`E=‖x‖^(2−d)/((2−d)area(S^(d−1)))` for d>2, proving ΔE=δ.
Annihilation of pole kernels and all their derivatives at points outside Ω
makes every jet of w zero there; harmonic-polynomial annihilation and the
convergent exterior multipole expansion make w zero near infinity.
Filledness implies every component of ℝ^(2n)\K_j is unbounded or meets
ℝ^(2n)\Ω: a bounded component contained in Ω would have compact closure
in Ω and would contradict the filled-exhaustion property. Apply analytic
unique continuation on each of these components of ℝ^(2n)\K_j, using
the zero exterior expansion in the unbounded case and the zero jets at
a point outside Ω in the other case. This gives supp w⊆K_j.
Integration by parts against the germ h gives ⟨T,h⟩=0, proving Runge density.
Own the exhaustion, Newton convolution, multipole expansion and harmonic
analyticity/unique-continuation steps with these exact support hypotheses.

For each bounded open O relatively compact in Ω solve Δv=f weakly using
the gradient completion of C_c∞(O), its Poincaré inequality and Hilbert
Riesz representation, with weak identity `∫∇v·∇η=−∫fη`; PDO's interior elliptic regularity gives a smooth
solution on O. On the exhaustion, subtract the global harmonic Runge
approximants to successive differences, with summable errors in the
successive C^j(K_j) seminorms. Prove convergence to a smooth solution of
Δv=f on all Ω, including disconnected Ω componentwise.

For scalar f solve Δv=4f and use
`∂̄(Σ_j(−1)^(j−1)∂_(z_j)v dbar(z)_[j])=f dbar(z₁)∧…∧dbar(z_n)`.
For the holomorphic-first (p,q)-form convention, multiply the corresponding
coefficientwise primitive with dz_I on the left by (−1)^p. This proves
surjectivity, hence closed range, of the stated top Dolbeault operator.
These Euclidean Poisson/Runge inputs form an independent construction
before purity and compact analytic duality.
Dimension0 is treated directly.

**HF2.AnalyticPreparation.FunctionalDuality — FS/DFS transposition.**
Here FS means Fréchet–Schwartz; DFS means a locally convex space
topologically isomorphic to the strong dual of an FS space. Construct the
actual strong-dual identifications and compact Banach-limit description below.
Consume K5a’s global compact-open C^∞ Fréchet carrier for smooth sections
of every finite-rank bundle on a finite-dimensional second-countable
Hausdorff complex manifold. Prove its nuclear Fréchet–Schwartz (FS) property:
embed by a countable chart/frame restriction family as the closed overlap-
compatible subspace of a countable product of local smooth-section spaces,
prove the local nuclear seminorm estimates and prove the restriction map
is a topological isomorphism from K5a’s topology onto that closed compatible
subspace. Construct continuous differentials and
closed kernels on these carriers.

**HF2.AnalyticPreparation.CurrentResolution — compact currents and regularization.**
For a finite-rank holomorphic bundle E on a complex n-manifold X, put
`𝓔_(p,r)=A^(n−p,n−r)(X,E*)` with this global smooth-section FS
topology. Define the compact (p,r)-current carrier as
`𝓒_c^(p,r)(X,E)=StrongDual ℂ 𝓔_(p,r)` with bounded-convergence
topology. Consume K5a.SmoothSectionMontel for its strong/compact-dual
comparison with K5a's compact-distribution carrier, using the form/density
pairing. For a compact smooth (p,r)-form η valued in E, pair against
α∈𝓔_(p,r) by
`T_η(α)=∫ev(η∧α)`. Define
`(δ_r T)(α)=(-1)^(p+r+1)T(∂̄α)` on the complementary test degree.
This recovers the scalar (n,r) convention at p=n and E trivial.
Prove compatibility with the smooth-form embedding by Stokes, and compare
the graded pairing order with HF0’s relative integration convention.
Write `𝓓_c^(p,r)(X,E)` for smooth compactly supported forms with their
LF topology; for compact S write 𝓓_S for its fixed-support smooth
stage. Prove 𝓓_S is a closed subspace of K5a's global smooth-section
Fréchet carrier and that its subspace topology equals the fixed-compact
stage topology defined by the chart/frame derivative seminorms, hence
𝓓_S is Fréchet. Consume K5a's BundleTest construction,
form/density adapter, identification with the fixed-compact inductive limit
and its universal property. K5a builds that manifold criterion on native
`TestFunction.continuous_iff_continuous_comp` in Euclidean charts; apply the
manifold criterion to these form carriers. This is a different complex from
compact currents. Construct the compact-support Dolbeault/sheaf comparison
using currents, and its comparison with
smooth compact forms, with the integration pairings and properly supported
Dolbeault regularization/chain-homotopy maps. Construct these locally by
convolution with cutoff Cauchy–Green parametrices for n=1 and
Bochner–Martinelli–Koppelman parametrices for n≥2 on (0,q)-forms,
applied in local dz_I and holomorphic bundle frames for Ω^p(E). For |I|=p
transport the (0,q) Dolbeault homotopy H_Dol by
`H_(Dol,p)(dz_I∧β)=(-1)^p dz_I∧H_Dol β`, since
`∂̄(dz_I∧β)=(-1)^p dz_I∧∂̄β`. If its regularization R_Dol satisfies
`∂̄H_Dol+H_Dol∂̄=id−R_Dol`, put
`R_(Dol,p)(dz_I∧β)=dz_I∧R_Dol β` and prove
`∂̄H_(Dol,p)+H_(Dol,p)∂̄=id−R_(Dol,p)`.
The regularization carries no extra (-1)^p sign.
Consume [GeometricTopology item3b's FiniteColourChartRefinement](https://github.com/TauCetiProject/TauCetiRoadmap/blob/ec352c922514fcc0b486415906bf08954acb4ef6/TauCetiRoadmap/GeometricTopology/README.md#finite-colour-chart-refinement)
for underlying real dimension d=2n, with the input open cover chosen
inside coordinate domains and holomorphic frames of Ω^p(E). It exports
countably indexed locally finite OPEN chart families V_j, a colour map
with at most d+1 colours, indexed same-colour disjointness, compact
closures inside the assigned input/chart opens, and a same-index inner
open cover O_j with compact closure inside V_j. Consume this generic
inner cover; the generic dimension, refinement and shrinking theorem has
that single owner. Own the smooth plateau realization and Dolbeault/current
adapters here, followed by the finite analytic kernel shrinkings below.
Use K3.0's realified `IsManifold 𝓘(ℝ,E₀) ω X`, lowered to ∞, where
E₀ is the complex model vector space with `FiniteDimensional ℂ E₀` and
`finrank ℂ E₀=n`, distinct from the holomorphic bundle E. Restrict its normed-space scalars to ℝ. Consume
native `FiniteDimensional.complexToReal` and `finrank_real_of_complex` to
obtain `FiniteDimensional ℝ E₀` and
`finrank ℝ E₀=2·finrank ℂ E₀=2n=d`. The finite-dimensional
real model is locally compact. Native `I.locallyCompactSpace` and
`ChartedSpace.locallyCompactSpace` give local compactness of X; the
closed model range is supplied by native `I.isClosed_range`, not an extra
assumption on the original complex atlas. Local compactness together with
second countability supplies σ-compactness. Local compactness,
Hausdorffness and second countability give paracompactness, hence normality
for the intermediate plateau/kernel shrinkings and cutoffs; Hausdorffness
also makes compact sets closed.
Use native `exists_contMDiffMap_zero_one_of_isClosed` with these real
model and smoothness instances for the plateau cutoffs; the continuous
partition used to construct the coloured cover belongs to GT3b.

Take W_j:=O_j, GT3b's exported same-index inner open cover. Choose only
intermediate plateau opens and smooth real cutoffs φ_j,ψ_j with
`W_j⋐int{φ_j=1}`, `supp φ_j⊂int{ψ_j=1}` and compact supp ψ_j
inside its coloured chart member. All supports here are closed supports;
within each colour the supp ψ_j are disjoint. In that chart/frame put
`H_j=ψ_j H_(Dol,p),j(φ_j·)`, with its paired current transpose signs.
Prove the local kernels smooth off the diagonal and pseudolocal, with
parameter-dependent compact/derivative estimates and smooth local R_Dol
remainder. For each colour c set `H_c=Σ_(j∈c)H_j` and
`R_c=id−δH_c−H_cδ`; these sums are locally finite. Prove each H_c
and R_c has support proper in both kernel projections: a compact input or
output meets only finitely many cutoffs in that colour. With finite N set
`R=R_N⋯R_1`, `H=Σ_(c=1)^N H_c R_(c−1)⋯R_1`.
Prove `δH+Hδ=id−R` by finite telescoping, retaining every cutoff
commutator, and prove both support properness statements for these finite
compositions. Prove the corresponding ∂̄ identities on smooth forms and
the paired current identities with the stated graded signs.

Each R_c regularizes only on its W_j. Expand the cutoff commutators there:
the identity part vanishes, and derivatives of φ_j are separated from W_j
while derivatives of ψ_j vanish nearby. Off-diagonal kernel smoothness and
the smooth local remainder give joint row-kernel smoothness there. Choose
finite nested shrinkings still containing the inner cover W_j. For right
composition use the continuous test-side transposes; for later left
composition split by near/far cutoffs and use pseudolocality and off-diagonal
smoothness. Prove all mixed kernel derivative estimates in this finite
argument. Verify the row formulas by pairing with all compact currents
and glue them by separation, deriving a jointly smooth proper kernel κ
for R. In dimension0
use the discrete identity comparison with H=0. Apply this construction
componentwise for the explicitly indexed dimension/rank components.

Own **CurrentTopologyBridge**
for the actual StrongDual current carriers and the smooth compact-support
LF complex. On complementary global smooth carriers construct the
continuous transpose-test operators of these parametrices, with the HF0
pairing signs. For each target compact and derivative order, prove their
seminorm bounds by finitely many source seminorms on one source compact.
Define the current-to-current homotopies and regularizations as their
signed transposes; native `ContinuousLinearMap.precomp ℂ` gives strong
continuity because a continuous linear map sends bounded sets to bounded
sets. Define compact-current extension by zero along an open inclusion
as the transpose of continuous global smooth restriction, with its
support and integration laws.

For the smoothing regularization R also prove continuity into the
smooth compact-support LF carrier, beyond its current-valued transpose.
Construct its smooth kernel κ with both support projections proper.
For every source compact K, its output is supported in one compact K′
inside X. For every continuous LF seminorm q, let Q_q be its equicontinuous
polar in the continuous dual of the LF tests. Prove the kernel transpose
maps Q_q to a bounded family 𝔅_q in the complementary global smooth predual:
for each compact subset of X and each derivative order, the relevant kernel
derivatives form a bounded family of LF tests supported in one compact,
by properness and the smooth kernel estimates. The fixed-stage continuity
of q bounds these families. Prove the distributional pairing interchange and
`q(RT)=sup_(λ∈Q_q)|T(R^tλ)|≤sup_(b∈𝔅_q)|T(b)|`.
The right side is an actual StrongDual seminorm, proving R is continuous
from compact currents into the LF carrier. Prove that composing this
smooth-valued map with the smooth inclusion gives the current-valued
regularization already defined. For LF-input regularization
and homotopy, prove for each support K an output support K′ and, for each
C^m seminorm there, a bound by one C times a finite higher-derivative
seminorm on K. The LF final-topology criterion gives their continuity.
The smooth-form inclusion into currents is continuous on each compact
stage by the integration estimate against bounded smooth test families,
hence continuous on the LF limit. Prove the signed chain identities in
both complexes and their compatibility with that inclusion. These actual
continuous chain-homotopy comparisons induce the possibly non-Hausdorff
quotient-topology comparisons on the Stein and compact-complement domains
used below, with the strong topology on the current domains and the LF
topology on smooth compact forms.

**HF2.AnalyticPreparation.FunctionalDuality — closed-range and bidual comparisons.**
Own the continuous-map FS instance of the closed-range transposition theorem:
a map has closed range exactly when its transpose image is weak-star closed.
First prove FS reflexivity and `(F₀′_b)′=F₀` for an FS predual F₀;
Hahn–Banach then identifies every strongly closed linear subspace of F₀′_b
as an intersection of kernels of pairings with F₀, hence as weak-star closed. Thus for these FS preduals the
strong and weak-star closed linear subspaces agree. Prove the annihilator
and strong-dual quotient identifications. For a finite FS complex, verify
both adjacent closed ranges before deriving the strong-dual cohomology
identification with the reversed transpose DFS complex. This is the FS
case of [Komatsu’s Theorem19 (1967)](https://doi.org/10.2969/jmsj/01930366).
Fix every transpose sign by HF0’s integration convention.

Consume `BaireSpace.instBarrelledSpace` and `WithSeminorms.banach_steinhaus`
from `Mathlib.Analysis.LocallyConvex.Barrelled`. The Fréchet domain is
barrelled by its complete metrizable topology. For Banach–Steinhaus use the
norm seminorm family on the scalar codomain ℝ or ℂ; its conclusion is
uniform equicontinuity. The domain's directed defining seminorm family
then gives a bound by one C p_j, with C≥0. Consume
[BanachSpaceTheory B1](https://github.com/TauCetiProject/TauCetiRoadmap/blob/b0a72f01220c30a0ef5ed30ab893d364972c05e8/TauCetiRoadmap/BanachSpaceTheory/README.md#b1-duality-and-weak-topologies)
for the real/complex `ContinuousLinearMap.precomp` Banach adjoint,
operator-norm and composition comparisons, canonical bidual naturality
and norming; derive bidual isometry from that norming. Own Schauder’s
theorem on this carrier:
a continuous map of real or complex Banach spaces is compact if and only
if its adjoint is compact. Prove the forward direction by finite ε-nets
on the compact closure of the image ball, and the converse using the
canonical bidual embeddings.

Consume native `ContinuousLinearMap.instCompleteSpace` from
`Mathlib.Topology.Algebra.Module.Spaces.ContinuousLinearMap` for
`StrongDual 𝕜 G₀`, where 𝕜=ℝ or ℂ and G₀ is Fréchet.
Its domain hypotheses are `IsTopologicalAddGroup G₀`,
`ContinuousSMul 𝕜 G₀` and `SequentialSpace G₀`; metrizability supplies
the last. Its scalar codomain has `UniformSpace 𝕜`,
`IsUniformAddGroup 𝕜`, `ContinuousSMul 𝕜 𝕜` and `CompleteSpace 𝕜`.
The topology is uniform convergence on von Neumann bounded sets;
`StrongDual 𝕜 G₀` is the native abbreviation `G₀ →L[𝕜] 𝕜`
from `Mathlib.Topology.Algebra.Module.ContinuousLinearMap.Basic`.
The native instance obtains bounded-set coherence from the sequential
domain. The compact-limit argument below constructs the explicit
continuous linear comparisons `L′_b≃F` and `L≃StrongDual ℂ F`
for its projective Fréchet limit F. For each complementary K5a smooth
carrier 𝓔_(p,r), the compact-current model above is exactly
`StrongDual ℂ 𝓔_(p,r)`. Apply the native instance to the Fréchet
domains F and 𝓔_(p,r); completeness of F comes from its projective
Fréchet construction. Prove each model comparison and its inverse
uniformly continuous for the additive uniformities by continuity and
additivity, then transport completeness through those uniform
equivalences. This covers arbitrary Cauchy filters in the strong duals;
no first countability of those duals is assumed.

Own the DFS-side compact Banach-limit theorem. Let L be a Hausdorff
countable locally convex inductive limit of complex Banach spaces B_j with
compact injective continuous linear bonding maps, using its locally convex
final topology. Put F=lim_j B_j′ with its projective-limit seminorms p_j;
it is a Fréchet space, and the final topology identifies L′ with F as
vector spaces. A finite family of seminorms is dominated by a later p_j.

Consume [BanachSpaceTheory B2](https://github.com/TauCetiProject/TauCetiRoadmap/blob/b0a72f01220c30a0ef5ed30ab893d364972c05e8/TauCetiRoadmap/BanachSpaceTheory/README.md#b2-weak-compactness-and-reflexivity)'s
Gantmacher criterion and compact-implies-weakly-compact theorem. For a
compact Banach map `T:X_B→Y_B`, they give
`T′′(X_B′′)⊆J_(Y_B)(Y_B)`. With the canonical embedding and B1's
adjoint norm comparison, prove the target vector has norm at most ‖T‖
times the bidual norm. A continuous functional on F is bounded by C p_j,
so Hahn–Banach extends it to an element of B_j′′ of
norm≤C. Compatibility of the projective coordinates and this factorization
through the next compact bonding map show it is evaluation at a vector
in B_(j+1), with the corresponding norm bound. No Banach-stage reflexivity
is assumed.

Use this same uniform bound to prove bounded regularity. Each x∈L lies
in a stage B_k, and `|f(x)|≤p_k(f)‖x‖_k`, so ev_x is a continuous linear
functional on F. For bounded A⊂L these evaluations are pointwise bounded
on F, since every f∈F is continuous on L. The Fréchet space F is
barrelled; uniform boundedness makes these evaluations equicontinuous,
bounded by one common C p_j. The preceding
Hahn–Banach/compact-bidual factorization puts all of A in the image of a
bounded ball of B_(j+1). Hausdorff local convexity and Hahn–Banach separation
identify the resulting vectors with the original x∈A. Thus every bounded
subset of L is contained and bounded in one stage.

Stage balls are bounded in L, and bounded regularity gives the converse
control needed for the natural strong-dual topological identification
`a:L′_b≃F`. Schauder compactness of adjoint bonding maps makes F FS.
Put `F′_b:=StrongDual ℂ F`. The preceding factorization proves
surjectivity of canonical evaluation `ι:L→F′_b`, and Hausdorff
Hahn–Banach separation proves its injectivity.
For a bounded subset Q_F⊂F, sup_(Q_F) p_j is finite at each stage, so evaluation
B_j→F′_b is continuous; the final topology gives forward continuity.
For inverse continuity choose a closed absolutely convex zero-neighborhood
U⊂L inside the desired neighborhood. Its polar U° is bounded in F, because
each stage inclusion is continuous. The strong-dual seminorm indexed by
U° controls the inverse via the bipolar identity U°°=U. Prove this pairing
and bipolar comparison explicitly. Thus `ι:L≃F′_b=StrongDual ℂ F`
is a topological linear isomorphism. Derive completeness of L directly
through ι from the native completeness of StrongDual ℂ F, with the
Fréchet domain F. Next apply native
`ContinuousLinearEquiv.arrowCongr a.symm (ContinuousLinearEquiv.refl ℂ ℂ)`
to obtain `F′_b≃StrongDual ℂ (L′_b)`, sending λ to λ∘a.
Compose with ι and prove at every ℓ∈L′_b that
`(ι(x)∘a)(ℓ)=a(ℓ)(x)=ℓ(x)`. This identifies the composite with
canonical evaluation `L≃(L′_b)′_b`; prove its naturality for continuous
linear maps using that pairing identity.

For every FS space F₀, construct the DFS strong dual F₀′_b and prove
canonical evaluation `F₀≃(F₀′_b)′_b` is a topological linear isomorphism.
Prove that the canonical bidual map of F₀′_b is the inverse of the strong
transpose of this evaluation isomorphism, using the evaluation pairings.
Together these results identify each DFS space used here with the strong
dual of its actual FS strong dual, with the natural evaluation maps.
They justify the preduals and bidual maps in the following transposition
argument. Separately prove stability of FS and DFS under the closed
subspaces and separated quotients used here, the DFS open-mapping theorem
and the quotient-to-image isomorphism for a closed-range map.
For a continuous DFS bijection T,
transpose to the FS preduals and use reflexivity to identify (T′)′ with T.
The transpose range is the whole dual, so the closed-range theorem makes
im T′ closed; its annihilator is ker T=0, so Hahn–Banach also makes it
dense. Thus T′ is onto; surjectivity of T makes T′ injective. Fréchet open
mapping and transposing the continuous inverse give continuity of T⁻¹.
For a surjection first pass to its closed-kernel DFS quotient. These are
owned functional-analytic constructions before real-support purity.

**HF2.AnalyticPreparation.SteinBundleDuality — the Stein duality owner.**
For every Stein n-manifold V and finite-rank holomorphic bundle E prove
`H_c^q(V,Ω^p(E))=0` for q<n and the Hausdorff strong-dual isomorphism
`H_c^n(V,Ω^p(E))≃O(V,Ω^(n−p)(E*))'_b`, with its integration pairing,
closed-range statements and functoriality. Use R3.2’s Cartan B directly on
the global smooth Dolbeault resolution on K5a’s bundle Fréchet carrier, with its nuclear FS property supplied by
FunctionalDuality: each positive-degree kernel is the preceding image,
hence that image is closed. Apply FunctionalDuality, checking both adjacent
closed ranges, to the global compact-current transpose complex and its
continuous integration pairing. This gives the stated separated quotients
and strong-dual identification on V from the global smooth-section
resolution and Cartan B.
The scalar/trivial-bundle case below is this theorem’s specialization;
K5b’s compact-manifold Serre theorem is a distinct supplier. Treat n=0
directly. This Stein theorem is independent of real-support purity.

### HF2.1. Flat compact duality and real-support purity

Own **FlatCompactAnalyticDuality** before purity. For every n≥1,
compact K⊆ℝⁿ⊆ℂⁿ and open complex neighborhood V of K, prove
`H_K^q(V,O)=0` for q≠n and a natural complex-linear isomorphism
`H_K^n(V,O)≃A[K]'`, where A[K] is the locally convex inductive limit
of holomorphic functions on neighborhoods of K and the prime means its
**continuous** dual. Fix dz₁∧…∧dz_n and HF0's relative integration/normal
orientation to identify the dual analytic n-form germs. This preparatory
isomorphism is algebraic on the supported cohomology group; the strong
quotient topology comparison is a further target in HF2.3. For K⊆L, prove
that `H_K^n→H_L^n` is exactly the continuous transpose of
`A[L]→A[K]`, using the integration pairing and the natural support maps.
An abstract vector-space identification without this compatibility does not
supply the purity argument below.

**HF2.1a — compact neighborhoods, tautness and germ topology.**

For K=∅ put A[K]=0 and prove all K-supported cohomology groups zero
directly. The ordinary and compact-support groups of V\K=V are respectively
H^q(V,O) and H_c^q(V,O). In the remaining
compact-neighborhood and germ arguments assume K is nonempty.

Prove polynomial convexity of every real compact K. For nonreal z=x+iy,
choose a real linear functional ℓ with ℓ(y)>0. The entire function
exp(−itℓ(z)), t>0, has modulus1 on K and larger modulus at z; Taylor
approximation on K∪{z} yields a polynomial separator. For a real point
x∉K use real Stone–Weierstrass on K∪{x}, approximating the continuous
function0 on K and1 at x within1/3.

Own the elementary compact polynomial-neighborhood lemma. Given an open
U⊇K, choose `closedBall(0,R)` with R>0 and K in its interior. For every point of that
ball outside U choose a polynomial whose modulus is strictly below1 on K
and greater than1 at that point. Each separator is nonconstant because K
is nonempty. Compactness gives finitely many p_i.
Then `P=closedBall(0,R)∩⋂_i{|p_i|≤1}` has
`K⊂int P⊂P⊂U` and is polynomially convex. Prove polynomial convexity
from these defining inequalities and that of the ball. Prove exactly
`int P={z:‖z‖<R and ∀i, |p_i(z)|<1}`: equality in a polynomial
constraint at an interior point would give a local modulus maximum and
force that nonconstant polynomial to be constant. Its interior is
Stein: on these strict ball/polynomial inequalities use the exhaustion
`−log(R²−‖z‖²)−Σ_i log(1−|p_i(z)|²)`, whose ball term is strictly psh.
Apply R3.1’s strictly psh exhaustion criterion and Oka–Weil approximation.
The compact-acyclicity comparison below uses R3.2’s Cartan B on this system.

Own compact tautness in this setting: for a compact K in a paracompact
Hausdorff complex manifold, a sheaf F and q≥0, construct the natural
comparison `colim_(U⊇K) H^q(U,F)≃H^q(K,F|_K)`. Prove it using compact
finite-cover refinements, the paracompact Čech/derived comparison and
exact filtered colimits, including naturality for shrinking neighborhoods
and inclusions of compacts. Thus Cartan B on the cofinal Stein neighborhoods
gives `H^q(K,O|_K)=0` for q>0 in the compact-support sequence.

Identify A[K]’s germ inductive-limit topology with a cofinal system of
bounded holomorphic Banach stages H^∞(U_j), with
`K⊂U_(j+1)`, `closure U_(j+1)⊂U_j` and every U_j relatively compact
in the fixed complex neighborhood V. Choose them cofinal near K and
remove components missing K. Restriction is injective by the identity
theorem, and compact by Cauchy estimates and Montel compactness. Prove
Hausdorffness of the locally convex germ limit using every point-jet
evaluation at points of K: each is continuous by Cauchy estimates; if all
jets vanish, holomorphic Taylor expansion gives a zero neighborhood at
each point of K and hence the zero germ. These evaluations separate germs.
Now apply FunctionalDuality’s compact Banach-limit theorem to obtain the
DFS property, bounded regularity, completeness, FS strong dual and natural
strong-bidual isomorphism. Own independence of the cofinal Banach system
and agreement with the compact-open holomorphic germ inductive limit.

**HF2.1b — compact supports and all closed-range degrees.**

Take a Stein neighborhood V of K, put Ω=V\K, and fix dz₁∧…∧dz_n to
identify the canonical line with the scalar sheaf. Use the compact-current
resolution from CurrentResolution and the actual compact-support sequence
for K⊂V, constructed from the c-soft current resolution and cutoffs:
`…→H_c^r(Ω,O)→H_c^r(V,O)→H^r(K,O|_K)→H_c^(r+1)(Ω,O)→…`.
Prove continuity of extension by zero, the connecting maps and their
integration naturality. For n≥2, compact tautness and
SteinBundleDuality give algebraically

```
A[K] ≃ H_c^1(Ω,O),
H_c^r(Ω,O)=0  for r≠1,n,
H_c^n(Ω,O) ≃ H_c^n(V,O).
```

Prove the required topologies without presuming these algebraic
isomorphisms topological. In this scalar case put
`𝓔_sm^q(Ω)=A^(0,q)(Ω)=𝓔_(n,n−q)(Ω)` for the GLOBAL SMOOTH
(0,q)-form FS carrier, distinguished from analytic germs A[K] and the
real-analytic function sheaf A_M. Put
`d_q=∂̄:𝓔_sm^q(Ω)→𝓔_sm^(q+1)(Ω)`. Use the same current carrier
`𝓒_c^(n,r)(Ω,ℂ)=StrongDual ℂ 𝓔_sm^(n−r)(Ω)` and define
`δ_r=(-1)^(n+r+1)(d_(n−r−1))′:𝓒_c^(n,r)(Ω,ℂ)→𝓒_c^(n,r+1)(Ω,ℂ)`
with the preceding right-wedge pairing convention.
For 2≤r≤n−1 the vanishing H_c^r gives
`im δ_(r−1)=ker δ_r`, a closed DFS subspace. The existing
MalgrangeTopVanishing makes d_(n−1) onto, so FunctionalDuality gives
closed im δ_0. Finally extension by zero to V followed by the already
Hausdorff Stein quotient H_c^n(V,O) is continuous on top currents;
the last algebraic isomorphism identifies its kernel with im δ_(n−1),
so this image is closed as well. By the FS reflexivity/annihilator lemma
these strongly closed linear current images are weak-star closed. Hence
transposition gives closed range of every d_(j−1) with target degree
j=1,…,n. Both top compact-cohomology spaces are now DFS, so their natural
continuous bijection is a topological isomorphism by DFS open mapping.
The last differential uses the earlier Malgrange theorem.
For n=2 the intermediate range is empty; both endpoint arguments remain.

The compact-current kernel/closed-image quotient giving H_c^1(Ω,O)
is now a DFS space by FunctionalDuality. Construct the connecting map
`A[K]→H_c^1(Ω,O)` on each Banach germ stage by
`f↦[∂̄(χf)]` in the scalar Dolbeault resolution, where χ has compact
support in that stage’s neighborhood and equals1 near K. Its derivative
is supported in Ω. Compare this with the (n,*) current resolution using
the fixed dz trivialization: `∂̄(dz∧β)=(-1)^n dz∧∂̄β`. The maps
`Φ_q(β)=(-1)^(n q) dz∧β` therefore form a chain map from the scalar
Dolbeault complex to the (n,*) complex. Use this signed comparison. Prove cutoff
independence. Put S=supp ∂̄χ⊂Ω, a fixed compact for this germ stage.
Cauchy estimates on S bound every derivative of (∂̄χ)f by the Banach
germ-stage norm, giving continuity into the fixed-support smooth space
`𝓓_S^(n,1)(Ω,ℂ)` through the signed dz comparison. Compose its LF
inclusion and the owned continuous smooth-to-current map, then the current
kernel/quotient map, and pass to the germ inductive limit. This is a continuous
bijection between the established DFS spaces; the DFS open-mapping theorem
makes it a topological isomorphism for the Banach-stage germ topology
and the compact-current closed-subquotient topology constructed above.

Apply the closed-range finite-complex duality to obtain
`H^p(Ω,O)'_b≃H_c^(n−p)(Ω,O)` with the integration pairing of
(0,p)-forms and (n,n−p)-currents. The natural top compact-support map and
FS reflexivity identify O(V) with O(Ω); the intermediate vanishings kill
H^p(Ω,O) for 1≤p≤n−2. Both adjacent ranges around degree n−1 are now
closed, so `H^(n−1)(Ω,O)` is its Hausdorff FS kernel/image quotient
and is strongly reflexive. Dualizing the natural topological
`H^(n−1)(Ω,O)′_b≃A[K]` therefore gives
`H^(n−1)(Ω,O)≃A[K]′_b`. The support sequence supplies the claimed
compact concentration and underlying continuous analytic-functional dual.
On Stein V,
`H_K^n≃H^(n−1)(V\K)` is used only for n≥2.

For n=1, the only ordinary differential d_0 is onto by
MalgrangeTopVanishing; its transpose has closed image. Keep instead the
compact-support exact sequence
`0→A[K]→H_c^1(V\K,O)→H_c^1(V,O)→0`.
Prove direct Cauchy/Laurent duality for `O(V\K)/O(V)`, including
closedness of the restriction image O(V), its continuous-dual pairing,
signs and naturality. The two exceptional compact-support degrees have
coalesced, so A[K] is not identified with all H_c^1(V\K,O).

For every n≥1 and every open complex neighborhood W of K, choose a
smaller Stein neighborhood V with K⊂V⊂W. Apply HF0’s natural excision
`H_K^q(W,O)≃H_K^q(V,O)` in every degree and prove compatibility with
support maps and the analytic-functional pairing. This extends the supported-group
conclusions of both dimension cases to arbitrary W. Ordinary complement
cohomology retains its stated Stein hypotheses.

**HF2.1c — dense germs and real-support purity.**

Prove also dense germ restriction for K⊆L real compact. For a germ f near
K choose a fixed polynomially convex compact neighborhood P with
`K⊂int P⊂P⊂domain f`. Oka–Weil approximation uniformly on P gives compact-
open convergence on int P, and Cauchy estimates give convergence of all
derivatives on smaller compacts; the continuous map to A[K] then gives germ
convergence. Polynomials extend near L, so A[L]→A[K] has dense image.
Consequently its continuous transpose is injective.

Own **RealSupportPurity** using this preparation. For a relatively compact
real-open Ω put L=∂Ω, K=closure Ω and use the actual support triangle
`RΓ_L(V,O)→RΓ_K(V,O)→RΓ_(K\L)(V\L,O)`.
The locally closed support Ω is closed in V\L, not in V. Compact
concentration leaves only a possible degree n−1 kernel; naturality identifies
it with the kernel of `A[L]'→A[K]'`, which is zero by dense germ
restriction. Excise to complex neighborhoods W with W∩ℝⁿ=Ω and use exact
stalk filtered colimits. This proves `𝓗_M^q(O)=0` for q<n.

For the upper bound use K2's acyclic intersections in the n-set cover
`V_j=D∩{Im z_j≠0}` of D\I, where D is a real-centered polydisc and
I=D∩ℝⁿ. The finite Čech length gives support degree at most n. Local
frames give `𝓗_M^q(Ω_X^p)=0` for q≠n, 0≤p≤n. HF0's support-truncation
comparison, Cartan B on D and the support sequence yield the precise global
statements, for n≥2,
`O(D)≃O(D\I)` and `H^q(D\I,O)=0` for 1≤q≤n−2.
Export the augmented finite Čech complex of this cover, with alternating
restriction differential, as exact below its top degree: in particular a
compatible degree0 family comes from a unique O(D) function, and every
positive-degree cocycle in the displayed vanishing range is a coboundary.
Derive these exactness statements from the preceding supported-cohomology
purity theorem. In dimension1 the lower support vanishing is q=0;
compute the top quotient on its actual Čech carrier, whose noncompact
restriction image need not be closed. Treat dimension0 directly. Apply HF0's
edge comparison to identify B(U) with twisted relative H^n for every open U.


### HF2.2. Flabbiness

Prove **Flabbiness**, consuming RealSupportPurity and the preceding
MalgrangeTopVanishing. For U⊆V⊆ℝⁿ set `W=ℂⁿ\(ℝⁿ\V)` and `Z=V\U`, closed in W.
The long exact sequence and top vanishing on W\Z, together with the
Dolbeault degree bound on W, give `H_Z^(n+1)(W,O)=0`. Purity's degenerate
edge identifies this with `H_Z^1(V,𝓗_V^n(O))`; the support sequence therefore
makes F(V)→F(U) onto. This works for each real chart. FlasqueLocality yields
global flabbiness of the untwisted cohomology sheaves, their orientation
twists, hyperforms and B(E): each twist/bundle is a finite trivial sum locally.
For arbitrary closed Z⊆M in a Stein complexification neighborhood W, derive
`H_Z^q(W,Ω_W^p)=0`, q>n, as a corollary of purity and flabby supported-section
acyclicity. Include noncompact M and all opens, not only compact supports.

### HF2.3. Manifold and bundle compact duality

Own **ManifoldBundleCompactDuality**, consuming FlatCompactAnalyticDuality,
RealSupportPurity and HF0's orientation/integration comparison. For every
compact K in a real analytic n-manifold M, use R3.0's complexification germ
and strictly psh normal germ, and R3.1's Stein-neighborhood and approximation
interfaces to construct cofinal relatively compact Stein neighborhoods V_j of K,
with closure V_(j+1)⊆V_j, every component meeting K and K O(V_j)-convex.
Own the needed compact totally-real neighborhood lemma, holomorphic-convexity
comparison and continuity of chart transition/germ restriction maps. Construct
the analytic-germ locally convex inductive limits on this cofinal system and
prove independence of neighborhoods and complexification. Neither global
compactness of M nor a global rank bound across components is assumed.

Consume the single general noncompact Stein/bundle theorem
HF2.AnalyticPreparation.SteinBundleDuality, which extends its scalar
specialization used by FlatCompactAnalyticDuality. Transport its pairing
and separated-quotient comparisons to these neighborhoods. For compact
real-support complements use HF2.1b’s separate dimension-one Cauchy
quotient and its restriction-image closedness, also for form coefficients
under their local trivializations.

Upgrade the scalar flat compact duality to the Hausdorff strong-dual
comparison and transport it through finite-chart descent using cup product
and HF0's relative integration signs. Prove the restriction/support maps
continuous with their quotient/strong-dual topologies and establish every
limit/quotient exactness used in this upgrade. Obtain Martineau duality:
hyper-p-forms supported in K are the strong continuous dual of analytic
(n−p)-form germs along K twisted by or_M; scalar hyperfunctions pair with
analytic density germs. Prove nondegeneracy, surjectivity, excision and
coordinate/density naturality. This is the general manifold and topological
enhancement of the upstream flat theorem, and is not an input to purity.

For finite-rank analytic bundle coefficients E use R3.1's finite generation
near K and R3.2's splitting on a smaller Stein neighborhood. Transfer the
scalar pairing through this finite split presentation, pair B(E) with
analytic E* density germs, and prove independence of the presentation and
compatibility with restrictions and transition maps. Work separately on each
fixed-rank component. Export native IsFlasque, all-open extension, restriction
kernels and acyclicity through the native underlying-abelian/module
comparison. Prove dimension0 assertions directly on the discrete sheaf.

## HF3. Analytic operations and boundary values

Define section support and prove closedness, restriction and the relatively
closed kernel criterion. Construct the sheaf of analytic finite-order
differential operators and its B(E) action, with linearity, unit, composition,
Leibniz, restriction and coordinate laws. Coordinate partial derivatives act
on relative representatives. Prove the identification
`B_M⊗_(A_M)Ω_M^p≃B_M^(p)` with **right placement of the form**:
`[(α,β)]⊗ω↦[(α∧ω,β∧ω)]`. In this convention the hyperform differential is
`[(α,β)]↦(-1)^n[(∂α,−∂β)]`. Prove square zero, analytic de Rham comparison,
Leibniz and its coordinate laws. An equivalent left-placement convention
has its degree-dependent signs explicitly transported through this map.

For c(z)=bar z let κ=c* followed by coefficient conjugation on relative
forms. In normal-y coordinates conjugation is
`[(α,β)]⊗or_y↦(-1)^n[κ(α,β)]⊗or_y`.
Prove this defines the antilinear involution extending analytic conjugation,
including orientation transitions, restrictions, real sections and commutation
with the hyperform differential. Construct external products and prove their
support, symmetry, associativity and density signs.

Construct pullback under analytic submersions by the analytic rank theorem:
for a projection p:N×M→M use `p*b=1_N⊠b`, then prove independence of local
product coordinates, composition and chart gluing. Local diffeomorphisms
are included. HF3a constructs pullback under general analytic maps with its analytic
noncharacteristic condition and constructs the resulting admissible
same-variable products. The scalar module here is the analytic sheaf A_M.

For boundary values use W={x+iy:x∈U,‖y‖<r(x)} and its wedge with y∈Γ,
where Γ is nonempty, open, convex, invariant under positive scalars,
0∉Γ, Γ∩(−Γ)=∅, and r:U→(0,∞) is continuous. Choose an open inner cone
Γ₀ with angular closure compact in Γ. On the oriented sphere S^(n−1)
choose a smooth top-degree form ψ with support in Γ₀∩S^(n−1) and integral1,
and pull it back by y↦y/‖y‖. For n=1 use the oriented 0-sphere: ψ=1 on
the upper direction, or ψ=−1 on the lower direction, and zero on the other.
Then `(0,−ψ)` is the relative de Rham Thom representative normalized by
normal-y orientation and `R₀₁=−∂R₁`.

For a holomorphic wedge function f with unrestricted growth define
`bv_Γ(f)=[(0,−f ψ^(0,n−1))]⊗or_y`, extending the second component by zero
outside the inner wedge in W\U. Prove this extension is smooth there,
its relative Dolbeault cocycle identity, and that projection of the displayed
Thom class has the prescribed analytic-function normalization. Two normalized
angular forms differ by d of a compactly supported form on a common inner
angular cone; construct that primitive and project its product with f to
obtain the explicit relative coboundary. Prove cone/radius refinement,
restriction, analytic coordinate transport, linearity and analytic
multiplication/differentiation. A holomorphic extension through U gives its
analytic section. This is the representative used by the boundary-value API.

In dimension1 write quotient classes as (f_+,f_−) modulo germs extending
through U, evaluated as bv_+f_+−bv_−f_−. The explicit relative/quotient map is
`[(0,g)]⊗or_y↦[(-g_+,-g_−)]`. Prove all four normalizations:

```
bv_+f=[(f,0)] ↔ [(0,−f·1_upper)]⊗or_y,
bv_−f=[(0,−f)] ↔ [(0,f·1_lower)]⊗or_y,
1=[(1,0)] ↔ [(0,−1_upper)]⊗or_y,
δ=[(-1/(2πiz),-1/(2πiz))] ↔ [(0,1/(2πiz))]⊗or_y.
```

The last class is the analytic residue-normalized point class; HF4 identifies
it with the distribution delta after constructing the embedding.

## HF3a. Microfunctions and analytic noncharacteristic operations

Use the real-analytic cotangent bundle and its complement of the zero section.
This layer constructs the analytic microlocal condition for hyperfunctions.
PDO P8's smooth wavefront condition for distributions retains its separate
carrier and meaning.

**Conic sheaves and geometric derived functors.** Use native
`DerivedCategory.Plus` for bounded-below complexes of sheaves of complex
modules and `Functor.rightDerivedFunctorPlus`, consuming HF0's
abelian/sheafification, enough-injectives and localization comparisons.
Tensoring with the constant complex sheaf of a
locally closed subset is exact here; prove the flatness and restriction
comparisons used in that assertion. For the locally compact Hausdorff finite-dimensional
spaces and maps used here, construct extension by zero for open inclusions,
closed-inclusion direct image, inverse image, and direct image with proper
support `f_!`: a section over V has support proper over V. Prove exactness
of inverse image, open extension by zero and closed-inclusion direct image,
and left exactness of f_!. Derive the last
functor using c-soft resolutions; prove their acyclicity for these proper-support
functors, resolution independence, restriction and the support localization
triangle. Construct the geometric natural transformations and prove composition,
proper base change, the tensor projection formula and the proper-support
Fubini comparison used by the transforms below. Prove the requisite finite
cohomological-dimension bounds on Euclidean fibres and transfer through locally
finite charts. Use native complexes, shifts, derived categories and tensor
products; these geometric functors extend HF0's ordinary direct image and
supported sections.

For a real rank-d vector bundle V→M construct the category of conic derived
sheaves, meaning invariance under positive fibre dilations with the action,
unit and composition isomorphisms. On `V ×_M V*` put
`P={(v,η):η(v)≤0}` and define the fibrewise Fourier–Sato transform by
`F^∧=Rp₂!((p₁⁻¹F)_P)`, where the subscript means tensoring with the
constant complex sheaf on P extended from that closed subset. Prove
conicity, restriction/base-change naturality, distinguished-triangle and
cohomological-shift compatibility. Construct the inverse transform and prove
`F^∧∧≃a⁻¹F⊗or_(V/M)[−d]`, where a is fibre antipodal and the orientation
line is complexified. Compute the compactly supported cohomology of the
half-space fibres and of their two-transform intersections, including d=0,
the zero vector and boundary cases, to construct the inversion maps and prove
that their compositions are identities. These fibre calculations, base change
and Fubini are the proof of inversion, rather than an assumed integral formula.

**Specialization and microfunction purity.** Consume
[GT Layer1's native quotient normal bundle and open tubular interface](https://github.com/TauCetiProject/TauCetiRoadmap/blob/ec352c922514fcc0b486415906bf08954acb4ef6/TauCetiRoadmap/GeometricTopology/README.md#L341-L391)
for R3.0's closed real-locus embedding M⊂X. Prove the analytic
transition comparison for that same normal bundle, and construct its
deformation space. In local normal coordinates its
positive-parameter identification is `(x,y,t)↦(x,t y)`, t>0; the zero fibre
is `N_M X`. Prove chart gluing and transition laws, the positive-dilation
action, local compactness and the open/closed-fibre maps. With j the open
positive fibre, p its projection to X and s the zero-fibre inclusion, define
`ν_M F=s⁻¹Rj_*p⁻¹F` and `μ_M F=(ν_M F)^∧`. Prove germ independence,
restriction, analytic coordinate and bundle naturality and the comparison of
`Rπ_*μ_M F` with the HF0 complex of sections supported in M. Here π is the
normal-cotangent projection and the comparison is constructed from the support
localization triangle, specialization and Fourier–Sato inversion.

For F=O_X prove the analytic microlocal purity theorem:
`𝓗^q(μ_M O_X)=0` for q≠n off the zero section. Construct the sheaf of
microfunctions `C_M=𝓗^n(μ_M O_X)⊗π⁻¹or_(M/X)` there. For coefficients put
`C(E)=𝓗^n(μ_M O(E^hol))⊗π⁻¹or_(M/X)`, and use Ω_X^p for hyperforms.
Construct the `π⁻¹A_M`-module action by holomorphic germ multiplication,
prove germ independence and, in local frames, identify
`C(E)≃C_M⊗_(π⁻¹A_M)π⁻¹E`, with transition, restriction and coefficient-map
coherence. Construct the spectral morphism `sp:B_M→π_*C_M` and these
coefficient versions. Its restriction to an open is the corresponding open's
spectral map. Identify its kernel with the image of the injective analytic
section map `A_M→B_M`, and prove the analogous bundle-section statement.

Pin the cotangent sign: under z=x+iy, view an analytic covector ξ as the
complex conormal `iξ`; its underlying real conormal is `−ξ dy`.
Thus the identification with real normal covectors η is
`ξ(v)=−η(Jv)`. With the transform's inequality `η(y)≤0`, prove that a
boundary value from imaginary cone Γ has analytic wavefront in
`Γ°={ξ:∀y∈Γ, ξ(y)≥0}`. Verify this convention on the upper and lower
one-dimensional Cauchy boundary values and on HF3's residue-normalized delta.
Prove independence of complexification and analytic coordinates, and transport
the orientation line through the displayed identification with HF0's signs.

The analytic proof uses actual conic wedge representatives. For normal-coordinate
balls, build the relative Dolbeault/Čech complexes on small imaginary tubes
and finite open convex cones, their refinement maps and the deformation
comparison with the specialization/transform complexes. Prove cofinality of
these local systems and compatibility with the signed boundary-value map of
HF3. Establish their exactness away from degree n by the parameter Cauchy
operators of K2, convex-cone separation and shrinking inside strict angular
margins; retain the contour/Stokes boundary terms in the cochain homotopies.
At degree n prove conic-open flabbiness: for conic opens A⊆B in the
punctured normal cotangent bundle, every C_M section on A extends to B.
Compute restrictions through the preceding relative complexes; choose locally
finite cone refinements with strict angular margins, extend the representative
cochains and cancel the new boundary cocycles with their lower-degree
primitives. Prove compatibility of those corrections on nested refinements
and glue the resulting section. Establish the resulting finite conic splitting
lemma with support in prescribed larger conic neighborhoods; this is the
support-controlled input to the decomposition below.
For the degree-n maps prove the edge-of-the-wedge relation theorem: equality
of finite sums of the wedge boundary classes is equivalent, after shrinking
and conic refinement, to an actual coboundary in these relative Čech/Dolbeault
complexes. Construct the cochain refinements and homotopies and prove their
compatibility with further refinements. No growth bound on the holomorphic
functions at the edge is imposed; all contour operations occur strictly
inside their wedges before passing to the boundary class.

Export the following local conic decomposition with margins. Given b near x
and finitely many open conic sets D_j in the punctured cotangent fibres
covering `supp(sp b)` near x, after shrinking write b as an analytic section
plus a finite sum `bv_(Γ_j)(f_j)`, with each closed polar `Γ_j°\{0}`
contained in one prescribed D_j. The cones may be further subdivided into
proper convex cones with compact angular margins inside the D_j. Construct
this decomposition from the preceding complexes, and prove the relation
statement for two such decompositions. This is the local analytic input to
the operations below, with independence proved by cochains rather than by
choosing a vector-space splitting.

**Analytic wavefront and pullback.** Define `WF_A(b)=supp(sp b)` in
`T*M\0`. Prove closed conicity and locality, and identify its base
projection with the complement of the largest open set on which b is an
analytic section; this projection lies in the ordinary section support.
Prove the analytic kernel criterion, inclusion for sums and analytic differential operators,
and the cotangent-change law for analytic diffeomorphisms. Extend it to
finite-rank coefficients by local frames and prove frame independence.
For the external product prove the wavefront inclusion in
`((WF_A b ∪ zero_(supp b)) × (WF_A c ∪ zero_(supp c)))\zero`,
with the correct bundle/density identifications.

For an analytic map f:N→M set
`N_f={(f(x),ξ): ξ≠0 and (df_x)^*ξ=0}`. Under
`WF_A(b)∩N_f=∅`, construct `f*b` as follows. Locally choose the preceding
finite conic decomposition so every polar cone has a strict separation
margin from N_f. Prove the linear cone-separation lemma which chooses source
imaginary cones whose images by df lie strictly inside the corresponding
target wedges. Complexify f using R0 and shrink the radii so its nonlinear
remainder preserves those margins. Compose the holomorphic representatives
with that holomorphic extension and apply the source boundary maps. Prove
that analytic terms, relations and refinement coboundaries are preserved,
using the edge-of-the-wedge homotopies above, then glue. This constructs the
map on the actual Sato sheaves, independently of all local decompositions,
cones, radii and complexifications.

Prove complex linearity, analytic scalar multiplication, agreement with
analytic sections and with HF3's submersion/external-product construction,
restriction and bundle/density transport. Prove
`WF_A(f*b)⊆{(x,(df_x)^*ξ):(f(x),ξ)∈WF_A(b)}\zero`.
Prove identity and composition whenever f, g and f∘g meet the required
noncharacteristic conditions, and compare with analytic submanifold restriction.
For analytic bundle-valued maps use the corresponding pulled-back coefficients.

If `WF_A(b)∩(−WF_A(c))=∅`, define the scalar product by the diagonal pullback
of `b⊠c`. Prove restriction, bilinearity, the unit, analytic-function
agreement and commutativity, with
`WF_A(bc)⊆(WF_A b ∪ WF_A c ∪ {(x,ξ+η):(x,ξ)∈WF_A b,(x,η)∈WF_A c})\zero`.
The first two terms account for one zero covector at a time. Prove associativity and Leibniz on the common domain where
the successive products and the joint diagonal pullback are noncharacteristic;
state those conditions in each theorem. Construct bundle contractions and
graded hyperform products with their Koszul signs on the same domains.
Conjugation sends `(x,ξ)` to `(x,−ξ)` and obeys the corresponding product and
pullback laws. Treat n=0, the empty manifold and rank0 directly; use the
componentwise carriers for arbitrary dimensions and finite ranks.

## HF4. Canonical distribution and density embedding

Construct the canonical injective complex-linear sheaf morphism
`ι:Db_M→B_M` and its density/bundle versions. Use K5a's density-tested
continuous dual and its native Euclidean real-test Distribution comparison;
complexify tests by `T(φ+iψ)=Tφ+iTψ`. Pairings are bilinear. Prove analytic
regular-function agreement, restriction, support equality, analytic operator
compatibility and analytic-submersion naturality. In particular prove
`d(ιu)=ι(du)` with HF3's right-form convention, and conjugation compatibility.
Scalar pullback uses the density transpose and absolute Jacobian; hyperdensities
carry the corresponding density factor.

In dimension1 pin the embedding by the compact Cauchy characterization.
For a compactly supported complex-valued distribution u on ℝ, choose a
real compact smooth χ equal1 on a neighborhood of supp u, complex-linearly
extend its real-test pairing, and set
`C_u(z)=(2πi)^(−1)⟨u_t,χ(t)/(t−z)⟩`, Im z≠0.
Prove holomorphy, independence of χ, and that ι(u) is the quotient class
represented by C_u on both half-planes. In particular
`C_δ(z)=−1/(2πiz)` and `bv_+C_u−bv_−C_u=u` as distributions.
Prove complex linearity and naturality for native test-inclusion restriction.
These properties determine the local embedding. Consume K5a’s interval
compact-cutoff and distribution extension-by-zero API: multiply a local
distribution by a compact smooth cutoff, extend the compact distribution by
zero, and compare on a smaller open where the cutoff is1. Restriction and the
sheaf law give equality for any two such embedding families. These cutoffs
act on distributions; the hyperfunction scalar action remains analytic.

In the model U⊆ℝⁿ fix `W=ℂⁿ\(ℝⁿ\U)`, so W∩ℝⁿ=U. Choose θ(z,t)
smooth on ℂⁿ×U, equal1 near {0}×U, with its **closed support in ℂⁿ×U**
contained in an open tube T satisfying
`{0}×U⊂T⊂{(z,t):‖z‖<min(1,dist(t,ℝⁿ\U))/3}`.
Use infinite distance for the empty complement. For a relative delta-density
representative (τ₁,τ₀₁) use `(θτ₁+∂̄_zθ∧τ₀₁,θτ₀₁)` and substitute z−t
before distribution pairing in t. Prove common compact t-support for every
compact L⊂W, smooth parameter dependence, ∂̄ commutation, the cocycle laws
and independence of cutoff, tube and representative. These smooth cutoffs
act on distribution tests and representatives.

Prove cutoff independence by the explicit relative primitive:
if δθ=θ−θ′, then δθ vanishes near {0}×U and δθτ₀₁ extends smoothly
there by zero; the difference of representatives is
`d_rel(δθτ₀₁,0)`, followed by the same distribution pairing.
For a change by a relative coboundary prove directly that the cutoff operator
`R_θ(σ₁,σ₀₁)=(θσ₁+∂̄θ∧σ₀₁,θσ₀₁)` commutes with d_rel.
For restriction, refine the tube near a retained real open so that its tests
miss the discarded source support, and apply cutoff independence. Common
compact t-stages and finite-order C^k bounds justify every z-parameter
derivative and the relative primitives. Coordinate independence uses HF2.3’s coordinate/density naturality
of ManifoldBundleCompactDuality and this localization. These are the consuming
steps for smooth parameter dependence of the kernel/test pairing.

For n>0 keep the exact Bochner–Martinelli normalization

```
β_n^0=(-1)^(n(n−1)/2)(n−1)!/(2πi)^n
 ·Σ_j(-1)^(j−1)bar(z_j)dbar(z₁)∧…∧omit(dbar(z_j))∧…∧dbar(z_n)/‖z‖^(2n),
δ₀=[(0,−(-1)^(n(n+1)/2)β_n^0)]⊗or_y.
```

The density kernel wedges β with dz₁∧…∧dz_n and uses the ambient orientation
line; identify `or_X⊗or_M^(-1)≃or_(M/X)` by the normal-first convention.
Prove evaluation on analytic density germs, all delta derivatives and
`δ=(bv_−(1/z)−bv_+(1/z))/(2πi)`. Use HF2.3’s ManifoldBundleCompactDuality coordinate/density naturality
for coordinate independence and prove injectivity by analytic Gaussian approximation in
every derivative seminorm required by the localized distribution order,
with exponential bounds on separated supports. Glue through analytic charts
and all bundle/orientation transitions.

Own **ModerateBoundaryComparison** after this embedding: if a holomorphic
wedge function satisfies, for each compact K⊂U and each closed angular
subcone Γ' compactly contained in Γ, `|f(x+iy)|≤C_K,Γ'‖y‖^(−N_K,Γ')`
for x∈K and sufficiently small y∈Γ', prove its distributional boundary
limit exists on LF tests and its image under ι equals HF3's bv. Give the
finite test-seminorm bounds and direction independence; derive derivative
bounds by Cauchy estimates on smaller cones. Also prove this equality for
any independently specified distributional boundary limit with the stated
test convergence. This is the distribution comparison consumer of HF3.

Prove `WF_A(ιu)=WF_A(u)` for distributions, where the right side is the
analytic wavefront criterion, distinct from PDO's smooth wavefront. In a real
analytic chart define its complement by a sequence of compactly supported
distributions u_N, bounded in one fixed compact-support finite-order stage,
agreeing with u near the point. State boundedness by a common compact K,
order m and constant C₀, with `|u_N(φ)|≤C₀ max_(|α|≤m) sup_K|∂^αφ|`
for every N and smooth test φ. Require Fourier estimates
`|û_N(ξ)|≤C^(N+1)(N+1)^N(1+‖ξ‖)^(−N)` in an open conic neighborhood,
for every N≥1. Prove independence of the local sequence, coordinates and
density choices. Use PDO's angular-frequency phase `exp(−i x·ξ)` and prove
its `ξ=2πζ` comparison with Mathlib's Fourier convention. Construct the
analytic cutoff sequences, Cauchy bounds and localized Cauchy/BM contour
estimates giving the equivalence with HF3a's spectral-support definition.
The embedding and microlocal comparison now imply agreement with distribution
pullback/products whenever their analytic noncharacteristic conditions hold;
the weaker smooth-wavefront distribution operations retain their PDO domain.

## HF5. Arbitrary-open extension and examples

For every open U⊆V in M and u∈Db(U), prove
`∃b∈B(V), b|_U=ι_U(u)`. More generally extend every B(U) section. For a
chosen b₀ the complete fibre is `b₀+ker(B(V)→B(U))`, the sections supported
in V\U. Prove the exact restriction sequence and affine-torsor description.
This is an existence statement with the displayed full supported ambiguity.
Growth, regularity, covariance and choices of continuous extension operators
are distinct assertions with their own hypotheses.

In dimension1 construct `L(φ)=Σ_(k≥0)φ^(k)(0)/(k!)²` on analytic germs.
With the pinned derivative pairing this is the formal series
`Σ_(k≥0)(−1)^kδ^(k)/(k!)²`. Cauchy estimates prove continuity on each complex neighborhood and compatibility
with the germ limit. HF2 gives its point-supported hyperfunction. It has
`L(x^m)=1/m!` for every m, so K5a's finite point-jet theorem makes it a
non-distributional hyperfunction. Consume K5a's distributional failure of the source's literal 1/n! series.
Own its analytic-functional qualification: on the holomorphic germ
`1/(1+2z)` its partial sums also give Σ2^n, so they do not converge as an
ordinary point-supported analytic-functional sum. The factorial-square
example is this distinct sign-normalized convergent comparison. The late
RQFT6 source adapter preserves both the literal and the qualification.

Consume K5a's positive-dimensional exp(1/‖x‖²) nonextension theorem, whose
nonnegative test bump has support in the unit ball. HF2/HF4 nevertheless
extend its punctured-domain distribution to a hyperfunction. In dimension1
identify the explicit extension `bv_+(exp(1/z²))`; in higher dimension use
flabbiness. Compare the smooth full-line exp(x²), which is non-tempered,
and exp(−x²). Treat dimension0 directly. Export configuration-space and
linear-quotient coordinate transport through HF3's analytic submersion API;
RQFT6 owns the physical quotient/Haar normalization and graph adapter.

## Theorem completion and primary comparisons

Prove the closed-support, purity, duality, orientation, operation, embedding
and all-open-extension theorems above on the named supplier carriers.
RealAnalyticGeometry R3.0 and K1/K4 consume
[ComplexManifolds #279's manifold, open-gluing and fixed-model bundle interfaces](https://github.com/TauCetiProject/TauCetiRoadmap/blob/581f66fed0f12fe49b8f5dd96aa18d3e435c190a/TauCetiRoadmap/ComplexManifolds/README.md); K5a/PDO supply the distribution prerequisites.
HF0 constructs the normal orientation sheaf and its local-generator comparison.

[Honda–Izawa–Suwa](https://arxiv.org/html/1807.01831) fixes the relative
representative, local-duality and embedding conventions. Theorem2.14 quotes
the classical fundamental theorem. HF2 owns the analytic proof. Ito, Theory of (Vector Valued) Sato
Hyperfunctions, J. Math. Tokushima Univ.20 (1986), §§1.5–1.6, supplies the
compact-duality then boundary-support proof route. FlatCompactAnalyticDuality
consumes AnalyticPreparation.FunctionalDuality and SteinBundleDuality for
the closed-range, reflexivity and strong-dual prerequisites, and constructs
the natural-transpose comparison before RealSupportPurity. HF2.3 supplies
the subsequent manifold, bundle and
strong-topology enhancement. The ordinary-complement comparison retains
the stated Stein and dimension1 quotient conditions.

For HF3a use Sato–Kawai–Kashiwara, “Microfunctions and pseudo-differential
equations,” in *Hyperfunctions and Pseudo-Differential Equations*, Lecture
Notes in Mathematics 287 (1973), 265–529, for microfunctions, analytic
wavefronts and noncharacteristic operations; use Kashiwara–Schapira,
*Sheaves on Manifolds*, Chapters III–IV, for conic sheaves, specialization
and the Fourier–Sato construction. HF3a constructs their stated sheaf,
cochain and geometric-functor prerequisites before using these operations.
