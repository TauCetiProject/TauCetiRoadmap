# Operator K-theory, extensions, and KK-theory

Build K-theory of complex C*-algebras from projections and unitaries, with
stability, homotopy, Bott periodicity and exact sequences. Develop extensions
and their index maps, graded Kasparov theory and its product, the universal
coefficient and Künneth theorems on their bootstrap domain, crossed-product
calculations, and E-theory. The output is a reusable functorial library whose
geometric comparison, grading and boundary signs are explicit.

## Scope, conventions, and dependencies

The basic K-groups and their exact sequences apply to arbitrary complex
C*-algebras, including nonunital and nonseparable ones. In KK and E-theory,
retain the separability, σ-unitality and countable-generation assumptions
specified in each milestone. Tensor products of C*-algebras are spatial
unless explicitly marked maximal; graded tensor products include their
Koszul signs. Put `K=K(ℓ²(ℕ,ℂ))` and use the rank-one corner for stabilization.
The zero algebra is included, and its K-groups vanish.

Use `CStarMatrix (Fin n) (Fin n) A`, `IsStarProjection`, `unitary A`, and
Mathlib's units, paths and homotopies. A right projective module over A uses
`Module Aᵐᵒᵖ`; a right Hilbert module uses
`CStarModule Aᵐᵒᵖ`, with inner products linear in the second variable.
For projections p and q of possibly different matrix sizes, Murray–von
Neumann equivalence means there is a rectangular matrix v with `v*v=p`
and `vv*=q`, where the first star is conjugate transpose. Use rectangular
matrix multiplication, not casts identifying unequal matrix sizes.

- [CStarAlgebras C1–C2](https://github.com/TauCetiProject/TauCetiRoadmap/blob/2a35ac0d546695b37b8e36cd92ecc67e7ac93e82/TauCetiRoadmap/CStarAlgebras/README.md) supplies ideals,
  quotients, multipliers and functional calculus. C5 supplies spatial
  tensors, C*-inductive limits and the path/cone/mapping-cone API.
  C6–C8 supplies nuclearity, exactness
  and completely positive liftings under their respective hypotheses.
- [BanachAlgebras](../BanachAlgebras/README.md) supplies holomorphic
  functional calculus, used for idempotent loops in the direct Bott proof.
- [HilbertModules H1–H4](https://github.com/TauCetiProject/TauCetiRoadmap/blob/0cd29293b2012f2bff9e33d7c9f29d393df577fc/TauCetiRoadmap/HilbertModules/README.md) supplies compact and
  adjointable module operators, tensor products, Morita equivalence and
  stabilization. H5 supplies the analytic Serre–Swan equivalence; H6–H7
  supplies regular operators and their bounded transforms.
- [OperatorAlgebraDynamics D1–D4](https://github.com/TauCetiProject/TauCetiRoadmap/blob/ef4dd5c067cd5ecfa71a31ff107eb7b16ba3e24c/TauCetiRoadmap/OperatorAlgebraDynamics/README.md)
  supplies full and reduced crossed products, Green imprimitivity and
  Takai duality. Their K-theory and KK consequences belong here.
- [GrothendieckEulerForms Layers 1–2](../GrothendieckEulerForms/README.md)
  supplies categorical Grothendieck groups and universal properties.
  Consume actual `TauCeti.SplitK0` and
  `Algebra.GrothendieckAddGroup`, comparing their presentations rather
  than defining another group-completion mechanism.
- [TopologicalKTheory T1–T6](https://github.com/TauCetiProject/TauCetiRoadmap/blob/58f69670927e9f48498986e7b6fc0bcf4e48bf1e/TauCetiRoadmap/TopologicalKTheory/README.md) supplies
  finite-rank continuous bundles, geometric K-groups of compact pairs
  and compact supports, and geometric complex Bott periodicity. This
  roadmap proves the comparison with `K_i(C₀(X))` and Bott for general
  C*-coefficients. T5's geometric Thom and T7's real KO theory remain
  there. No geometric index theorem is a prerequisite for periodicity.
- Use Mathlib's `ContinuousLinearMap.IsFredholm`, `FredholmPackage` and
  index, together with Tau Ceti's compact-perturbation and continuous-family
  APIs. [OperatorTheory](../OperatorTheory/README.md) supplies Hilbert
  spectral theory and compact operators.
  [PseudodifferentialOperators](https://github.com/TauCetiProject/TauCetiRoadmap/blob/063cf517a1dcc4d929e0602c6e6f585953aceab8/TauCetiRoadmap/PseudodifferentialOperators/README.md)
  owns elliptic symbols, parametrices and Fredholm operators on manifolds;
  this roadmap owns the general Calkin, module-index and K-pairing bridges.

K₀ of a unital algebra sends a rank-one projection in `M_n(ℂ)` to 1, so
`[1_(M_n)]` has value n. The Hilbert-space index is
`dim ker T − dim coker T`. Suspensions are `SA=C₀((0,1),A)`; identify the
open interval with ℝ by the increasing map `t↦tan(π(t−1/2))`.
Put `CA=C₀((0,1],A)` with quotient evaluation at1 and ideal SA.
The index boundary of this cone extension is `θ_A:K₁(A)→K₀(SA)`;
its exponential boundary is the positive Bott map b_A below. Fix
`S²A=C₀((0,1)_s,C₀((0,1)_t,A))` and
`z=tan(π(s−1/2))+i tan(π(t−1/2))`, so the outer coordinate is real.
Under the compactification
`ℂ⁺≃S²`, the Bott class is `β=[L]−1`, where L is the tautological line
with first-to-second disc transition z, as in TopologicalKTheory. Its
projection representative is

```
p(z) = (1+|z|²)⁻¹ [[|z|², z], [conjugate z, 1]],
p(∞) = diag(1,0),       β = [p] − [p(∞)].
```

Prove that comparison with the geometric class, including the sign:
TopologicalKTheory's rank-one dual Koszul symbol represents −β. Products,
boundary maps and Thom maps must retain their chosen orientation; no
unnamed isomorphism with ℤ determines a generator's sign.

## K1. Projections, projective modules, and K₀

Develop finite matrix amplification, corner inclusions and block sums with
their norm and star identities, arbitrary finite reindexing, associativity
and permutation conjugacies. For projections develop rectangular
Murray–von Neumann equivalence, reflexivity, symmetry, transitivity,
orthogonal sums, unitary conjugacy and functoriality under *-homomorphisms.
Prove that projections at distance less than one are conjugate by a
unitary in the identity path component of the unitization. A norm-continuous
projection path gives equivalence of its endpoints; after matrix
stabilization equivalence gives a projection homotopy. Supply the actual
rotation paths and perturbation formulae used in these implications.

Form V(A), the additive commutative monoid of matrix projections modulo
rectangular equivalence, with addition induced by block sum and zero from
the zero projection. Prove independence of matrix sizes and reindexing,
the equality criterion, and functoriality. For unital A, define K₀(A) by
`Algebra.GrothendieckAddGroup (V A)`. Prove its universal property, generation
by differences, and the equality criterion
`[p]−[q]=[p']−[q']` iff some matrix projection r makes
`p⊕q'⊕r ∼ p'⊕q⊕r`. Do not assume cancellation in V(A).

For arbitrary A use the forced C*-unitization `A⁺` and its augmentation
`ε:A⁺→ℂ`; define `K₀(A)=ker K₀(ε)`. Prove the split decomposition
`K₀(A⁺)≃K₀(A)⊕ℤ`, the comparison with the preceding unital construction,
and functoriality for nonunital *-homomorphisms. Give representatives as
differences of unitization projections with equal scalar rank; after
stabilization and scalar unitary conjugation arrange equal scalar
projections. Explain and prove why projections in matrices over A alone
need not generate K₀(A); K3 supplies the Bott-class example after
periodicity establishes its nonvanishing.

Construct the essentially small additive category of finitely generated
projective right modules over unital A, with right-linear morphisms and
finite biproducts. Identify its objects with ranges `p Aⁿ`, consuming
HilbertModules H2's algebraic-module/polar-unitary comparison. Prove essential smallness using
finite matrix presentations and obtain a natural isomorphism between
K₀(A) and `TauCeti.SplitK0` of this category. For idempotent matrix
representatives prove conversion to self-adjoint projections and agreement
of the resulting K-classes. The category and projection monoid live in
the algebra's universe up to the existing small-model equivalences.

Develop the canonical positive cone from actual projections over A and the
scale from projections in A itself. Define the resulting preorder; prove
partial-order statements only when the cone is proper. For unital A
record the distinguished order unit `[1_A]` and naturality under unital
maps. For tracial states τ construct the additive pairing using the
unnormalized matrix trace `τ_n(p)=∑ᵢτ(p_ii)`. Prove independence of
representatives, positivity, continuity under the appropriate inductive
limits and compatibility with *-homomorphisms. For a nonunital tracial
state use `τ⁺(a+λ)=τ(a)+λ` on forced unitization, and pair the
representative `[e]−[p_n]` as `τ⁺_n(e)−n`. Include finite-dimensional
direct sums. The compact-operator example uses its K₀ rank-one generator
and the ordinary densely defined trace on finite-rank/Pedersen-ideal
elements; it does not assume a tracial state on K.
Dimension-group classification of AF algebras belongs to CStarClassification;
this layer supplies its projection and trace invariants.

For compact Hausdorff X use H5's Serre–Swan equivalence to identify
`K₀(C(X))` with geometric K⁰(X), naturally for continuous maps and
compatibly with products and rank functions on disconnected spaces.
Extend to locally compact Hausdorff X using unitization/compactification,
with proper pullback and open-extension compatibility. Do not identify
compactly supported K-theory with unrestricted bundle theory on a
noncompact space.

## K2. Unitaries, K₁, and functorial properties

For unital A form the stable unitary group by the inclusions
`u↦diag(u,1)` and define K₁(A) by stable norm-homotopy classes. Develop
representatives, class equality after one common finite stabilization,
block-sum addition, the identity class, inverse by adjoint, and the
rotation homotopies proving commutativity and agreement with multiplication
of equal-sized unitaries. Compare with invertible matrices by the polar
deformation `x↦x(x*x)^(-t/2)` and prove naturality of that comparison.
Consume Mathlib's unitary logarithm charts, local path connectedness and
finite-exponential-product description of the identity component.

For nonunital A use unitization unitaries whose scalar part is the identity.
Prove every K₁ class admits such a representative, that homotopies can be
chosen with that scalar condition, and agreement with
`ker(K₁(A⁺)→K₁(ℂ))`. Develop maps for arbitrary *-homomorphisms, identity,
composition, homotopy invariance, direct sums and zero maps for both
K-groups. Prove finite-matrix stability and `K_i(A)≃K_i(A⊗K)` with the
rank-one corner, comparing all matrix sizes and all rank-one choices.

Prove continuity of K₀ and K₁ for C*-inductive systems, including
noninjective connecting maps: projections and unitaries lift approximately
to a finite stage and are corrected by functional calculus, and stabilized
equivalences and homotopies descend after increasing the stage. Supply
the uniform estimates for compact homotopy parameters. Deduce countable
direct-sum additivity and countability of K-groups for separable A.
Use H3–H4 to prove Morita invariance for σ-unital algebras, identify the map
induced by an imprimitivity module, and prove identity, composition and
agreement with full-corner maps; distinguish the chosen natural map from
an abstract existence of a stable isomorphism.

Consume CStarAlgebras C5's path, cone, suspension and mapping-cone
algebras and their pullback/extension API, with the cone/evaluation
convention fixed above. Establish their K-theory sequences and
homotopies, cone contractibility, and the action of orientation reversal
on suspension classes. Develop the elementary exactness and lifting
lemmas before using Bott to close a six-term sequence.

## K3. Bott periodicity, boundary maps, and products

Define the positive Bott map `b_A:K₀(A)→K₁(SA)` on unitization
representatives by

```
f_e(t) = exp(2πit)e + (1−e),
b_A([e]−[p_n]) = [f_e f_(p_n)⁻¹].
```

Both endpoints and the scalar part of the resulting loop are the identity.
Prove independence of representatives and naturality. Prove this map is
an isomorphism for arbitrary A. A direct proof must supply uniform
approximation of invertible loops, correction of approximate homotopies,
stabilized polynomial-loop reduction, the companion-matrix reduction to
degree one, and spectral separation followed by holomorphic functional
calculus to obtain an idempotent loop. Prove uniqueness of the resulting
stable idempotent class as well as existence. This makes the coefficient
Bott theorem independent of KK-theory and of geometric index theory.
The exponential boundary of `0→SA→CA→A→0` is b_A. For a
unitization projection e with scalar projection p, use the self-adjoint
lift `x(s)=p+s(e−p)` in the unitization of the cone, whose scalar part
is the fixed p. Prove that its exponential loop is homotopic to
`f_e f_p⁻¹` by the explicit homotopy

```
H(r,s) = exp(2πi[s e+(1−r)(1−s)p]) exp(2πi r(1−s)p),
0≤r,s≤1.
```

Its r=0 end is `exp(2πi x(s))` and its r=1 end is `f_e(s)f_p(s)⁻¹`.
For every r both s-endpoints and the scalar part are the identity.
Prove these identities and norm continuity without assuming e commutes
with p. For the other parity use θ_A as fixed above. Prove
`θ_(Sℂ)(b_ℂ[1])=β` in the ordered (s,t) plane.
For the index lift of `u(t)=exp(2πit)`, take
`w=diag(u,1) R(s) diag(1,u⁻¹) R(s)⁻¹`, where R(s) is real rotation
through `π(1−s)/2`: w(0,t)=1 and w(1,t)=diag(u,u⁻¹).
The projection `w diag(1,0) w⁻¹` has boundary frame u on the s=1
edge and frame1 on the other edges; compare its positive clutching
with the displayed tautological projection. Derive `K_i(S²A)≃K_i(A)`
with these coordinate and boundary maps and no unspecified parity
isomorphism. Show β is nonzero, and that `C₀(ℝ²)` has no nonzero
actual matrix projections, giving K1's unitization example. Prove the comparison with
TopologicalKTheory's periodicity through the bundle/projection maps.

For every short exact sequence `0→J→A→Q→0`, construct the natural
cyclic six-term sequence, with no separability or completely positive
splitting assumption. Its boundary maps are
`δ₁:K₁(Q)→K₀(J)` and `δ₀:K₀(Q)→K₁(J)`. Construct the index boundary
by lifting `diag(u,u⁻¹)` to an invertible matrix w over the unitization
and taking `[w p_n w⁻¹]−[p_n]`, with idempotents converted to projections
by K1. Prove lift independence and agreement with the partial-isometry
formula whenever such a lift v exists:

```
δ₁[u] = [1−v*v] − [1−vv*].
```

For a projection e over Q⁺, with scalar part p_n, choose a self-adjoint
lift x over A⁺ and prove
`δ₀([e]−[p_n])=[exp(2πi x)]`. The exponential is a unitary equal to
the identity modulo J. Prove additivity, naturality for morphisms of
extensions, exactness at all six positions, and the compatibility of
the two boundaries with suspension and Bott, recording signs explicitly.
Develop mapping-cone and relative K-groups, the long exact sequence of
a *-homomorphism, excision for ideals, and the identifications relating
these presentations to the six-term sequence. Include the Toeplitz
extension constructed in CStarAlgebras C8: its symbol z has boundary −1 because its lift is the
unilateral shift. Compute the K-groups of the Toeplitz algebra and
the maps of that extension.

Construct external products
`K_i(A)⊗ℤK_j(B)→K_(i+j)(A⊗B)`, initially on projection and unitary
representatives and then with suspension for the odd cases. Prove
well-definedness, bilinearity, naturality, associativity, the scalar unit,
and graded commutativity under the tensor flip. Establish compatibility
with stability, Bott and boundary maps whenever tensoring the extension
in question preserves its exactness. State that exactness hypothesis
explicitly, and include the sufficient condition that the other tensor
factor is exact. Compare products for commutative algebras with tensor
products of bundles and geometric external products. Compute the sphere
and torus examples with their generators and grading.
Pin the odd-by-odd torus product to `q*β`: q collapses the two
coordinate circles in 𝕋² and has degree +1 from the ordered (s,t)
two-cell to the complex-oriented sphere. Thus the positive winding
classes satisfy `[z_s]×[z_t]=q*β` for the tautological β fixed above.
Construct the representative and prove this pinning using the ordered
suspension and clutching maps. K5–K6 owns the subsequent explicit
Clifford/KK product comparison; K3's product construction does not use
KK-theory. NoncommutativeGeometry N2 computes its cyclic pairing.

Develop topological K-theory of dense inverse-closed Fréchet subalgebras
`𝒜⊆A`, where the Fréchet topology is stronger than the ambient C*-norm
topology, and require inverse closure of unitizations in the nonunital
case. Use a metrizable complete Hausdorff locally convex complex topological
vector space with continuous multiplication and star, and an injective
continuous dense *-algebra map to A. In Lean use `MetrizableSpace`,
`CompleteSpace`, `IsTopologicalAddGroup`, `LocallyConvexSpace`,
continuous scalar action and `ContinuousStar`; the topology need not
come from one norm. Use matrix idempotents and invertibles; paths use the Fréchet
topology. Prove matrix spectral invariance, holomorphic-functional-calculus
closure, perturbation and homotopy lifting, and that inclusion induces
isomorphisms on K₀ and K₁. Compare algebraic projective-module K₀ with
this topological K₀. Establish the useful sufficient condition of a
complete stronger Banach *-algebra norm satisfying
`|||xy|||≤C(|||x|||‖y‖+‖x‖|||y|||)` for a fixed C, by spectral-radius
comparison. The smooth-algebra differential calculus and its cyclic
cohomology are outside this roadmap.

## K4. Fredholm indices and extensions

Construct the Calkin algebra `Q(H)=B(H)/K(H)` and prove Atkinson's
theorem: a bounded operator on a Hilbert space is Fredholm exactly when
its Calkin class is invertible, equivalently when it has a bounded
two-sided parametrix modulo compact operators. Compare this predicate
and index with `ContinuousLinearMap.IsFredholm` and its existing index.
Under `K₀(K(H))≃ℤ` for infinite-dimensional separable H, prove that
the index boundary is `dim ker T−dim coker T`. Derive the index's
homotopy, compact-perturbation and composition laws through this comparison,
using the existing Fredholm theorems where they already supply the result.

For σ-unital A consume HilbertModules H1–H2's standard module
`H_A=ℓ²(ℕ,A)` and its identifications `K(H_A)≃A⊗K` and
`L(H_A)≃M(A⊗K)`. Construct its multiplier and corona extension. Prove the vanishing of the
multiplier algebra's K-groups by the countable-shift swindle and develop
the resulting K₀(A)-valued index. At this stage A has the trivial grading;
a grading on E is an A-linear selfadjoint unitary γ, with its orthogonal
even/odd summands. Build graded direct sums, parity reversal and homogeneous
operator blocks from HilbertModules H2. Define graded Fredholm pairs using
countably generated Hilbert A-modules and odd adjointable F with
`F−F*` and `F²−1` compact. Develop direct sums, unitary equivalence,
homotopy, stabilization and degenerate pairs, and prove their homotopy
group is naturally K₀(A). Supply the stabilization and perturbation
steps relating this model to the corona boundary. Do not require a
Fredholm module operator to have finitely generated projective kernel
and cokernel: construct the index without that assumption and prove
the difference-of-kernels formula when those hypotheses hold.

Build Hilbert-module Kasparov–Stinespring dilation before extension
invertibility. For a strict CP map `φ:A→L_B(E)` construct E_φ from
A⊙E with inner product `⟨a⊗ξ,b⊗η⟩=⟨ξ,φ(a*b)η⟩`, its
null quotient/completion, nondegenerate representation π and adjointable
V with φ(a)=V*π(a)V. Strictness means φ(h_λ) converges strictly
for an approximate unit of A. Prove minimality, unitary uniqueness,
countable generation for separable A and countably generated E, and
the complemented-submodule compression when φ is nondegenerate.
Also prove the standard-module dilation for every CP contraction
`A→L_B(H_B)` when A is separable and B σ-unital: a representation
on H_B⊕H_B whose 11-corner is φ, using stabilization and the
non-strict-map enlargement when strictness is unavailable. This last
corollary supplies arbitrary CP lifts in the extension argument; the
strict theorem is not silently applied to all maps.

For separable A and σ-unital B develop extensions by `B⊗K` and their
Busby invariants `τ:A→Q(B⊗K)`. Prove reconstruction by the multiplier
pullback, characterize essential extensions by injectivity of τ, and
identify split extensions with Busby maps admitting *-homomorphic lifts.
Distinguish equality of Busby maps, conjugacy by a multiplier unitary,
and conjugacy by a corona unitary. Construct a complete pair of multiplier
isometries `s₀,s₁∈M(B⊗K)` satisfying
`sᵢ* sⱼ=δᵢⱼ1` and `s₀s₀*+s₁s₁*=1`. Use H1's standard right module
H_B and H2's `L_B(H_B)≃M(B⊗K)`: on finitely supported sequences put
`Sᵢ(b)_((2n)+i)=b_n` for i=0,1, with every other coordinate zero.
Prove preservation of the norm-summable B-valued inner product, extend by
finite-support density, and construct the adjoints by extracting the
even and odd coordinates. The resulting unitary
`W:H_B⊕H_B→H_B`, `W(x,y)=S₀x+S₁y`, has inverse
`z↦(S₀*z,S₁*z)`. Transport Sᵢ through the stated adjointable/multiplier
comparison to obtain sᵢ; B need not be unital. Include B=0 using the
zero algebra's unit0 and the zero-module unitary, without imposing a
nonzero-unit hypothesis.

Writing q for the multiplier quotient map, define the actual sum by
`(τ₀⊞ₛτ₁)(a)=Σ_(i=0,1) q(sᵢ)τᵢ(a)q(sᵢ)*`. Prove linearity, star and
multiplication from the pair relations. No unitality of A or τᵢ is needed;
when A is unital and both τᵢ are unital, the range-sum identity proves
the sum is unital. For any other complete pair t construct
`U=t₀s₀*+t₁s₁*` with inverse `s₀t₀*+s₁t₁*`. Prove
`U*U=UU*=1`, `Usᵢ=tᵢ`, and
`q(U)(τ₀⊞ₛτ₁)(a)q(U)*=(τ₀⊞ₜτ₁)(a)` for every a.
Orthogonal ranges alone do not suffice: on ℓ²(ℕ), the even/odd pair has
range sum1, whereas the pair sending e_n to e_(3n) and e_(3n+1)
has range sum1−R with R the infinite-rank projection onto e_(3n+2).
For two unital scalar split Busby maps their sums send1 respectively to
1 and1−q(R) in the Calkin algebra, which are not unitarily conjugate.
Prove R is noncompact and retain this example as a boundary test.

Use complete pairs for both ordinary and unital strong extension addition.
For split inputs, the same formula on their multiplier *-homomorphic lifts
is a lift of the sum. Prove compatibility with multiplier-unitary equivalence,
commutativity and associativity using the block permutations and regrouping
unitaries of H_B finite sums. Define stable equivalence by allowing addition
of split extensions on both sides. The resulting Ext monoid has the split
class as zero; it is not a group by definition.

Prove that a stable extension class is invertible precisely when its
Busby invariant admits a completely positive contractive multiplier
lift. Use the standard-module dilation and its complementary diagonal
corner to construct the inverse Busby map. Develop the equivalence of this lift condition with a completely
positive contractive section of the associated extension. Consequently
Ext(A,B) is a group when A is separable nuclear. Include the natural
pullback and ideal-variable constructions needed for the comparison
with KK₁ in K6. Keep unital extensions and unital equivalences as
explicitly distinguished constructions rather than silently imposing
unitality on the stable Ext theory. Define unital strong Ext separately
using all unital Busby maps, multiplier-unitary equivalence and
addition of unital split extensions. Prove its invertibility criterion:
a CP contractive multiplier lift exists, and that lift need not be unital.
The KK/unit-evaluation comparison is constructed in K6 after KK
and its extension correspondence; no bivariant group is needed to
construct these extension semigroups.

## K5. Graded cycles and KK-groups

Develop ℤ/2-graded C*-algebras, graded Hilbert modules, graded tensor
products and adjointable operators, using the ungraded constructions of
HilbertModules H1–H4. Prove the graded Kasparov stabilization theorem:
for countably generated graded E over σ-unital graded B, E is a graded
orthogonally complemented summand of `H_B⊕H_B` with the two opposite
standard gradings, and `E⊕(H_B⊕H_B)≅H_B⊕H_B` by a degree-zero unitary.
Supply even/odd generating sequences and the homogeneous block formulas
for compact and adjointable operators. A grading on an algebra is an
involutive *-automorphism, equivalently its even/odd decomposition;
it need not be implemented by an inner multiplier. Fix complex Clifford
algebras with odd self-adjoint generators `e_i²=1` and
`e_i e_j=−e_j e_i` for distinct i,j. Prove their graded tensor
identifications, matrix models and graded Morita periodicity. Pin
Cl₂→M₂(ℂ) by `e₁↦[[0,1],[1,0]]`,
`e₂↦[[0,i],[−i,0]]`, with grading conjugation by diag(1,−1).
The graded Morita module is ℂ^(1|1); these generator orders are part
of the Clifford/suspension comparison, not adjustable matrix labels. These
are the analytic complex Clifford conventions; geometric real KO and
its signature conventions remain in TopologicalKTheory.

Pin the two-odd-factor period reduction `Cl₁⊗̂Cl₁→Cl₂` by
`e⊗1↦e₂`, `1⊗e↦e₁`. The individual generators and the displayed
Cl₂ matrix model stay fixed. The two-suspension comparison cycle is
`s e₂+t e₁`, with even-to-odd block `t−is=−iz` in the ordered
plane; its clutching winding is positive and its class is β.
The unswapped reduction `e⊗1↦e₁`, `1⊗e↦e₂` instead has
block `s−it=conjugate z` and class −β. Prove the comparison between
these two reductions acts by −1 after graded Morita equivalence.
Use the displayed swapped reduction in the parity-reduced K/KK product
comparisons. Relative to the unswapped convention the adapter contributes
`(−1)^(pq)` for p,q∈{0,1}; prove its coherence for triple products
from `pq+(p+q)r=qr+p(q+r)` modulo two. This records a choice of
period reduction, not a change to the underlying Kasparov product.

For separable graded A and σ-unital graded B, define a Kasparov cycle
`(E,φ,F)` with E a countably generated graded right Hilbert B-module,
φ a graded *-homomorphism into L(E), and F odd and adjointable. For
every homogeneous a require compactness of

```
Fφ(a) − (−1)^degree(a) φ(a)F,
(F²−1)φ(a),
(F−F*)φ(a).
```

Define degenerate cycles by vanishing of these expressions. Develop
unitary equivalence, direct sum, change of coefficients by interior
tensor product, and homotopy via cycles over `C([0,1],B)`. Prove
homotopy is an equivalence relation and obtain the abelian group
KK(A,B). Fix its universe by the standard-module picture: stabilize
cycles onto complemented graded submodules of the fixed H_B⊕H_B,
then take the homotopy quotient of that set of operators/representations.
Prove equivalence with arbitrary-module cycles. KK(A,B) lives in
max(u_A,u_B), independent of a chosen larger module universe; compare
this construction under universe lifts. Ext uses the fixed corona of
B⊗K, and K9's asymptotic maps use fixed source/target carriers. Its inverse cycle is `(Eᵒᵖ,φ∘γ_A,−F)`, where Eᵒᵖ has
reversed grading and γ_A is A's grading automorphism. Supply the
rotation homotopy to a degenerate cycle for their direct sum. Prove compact-perturbation
and operator-homotopy invariance with their actual defect estimates.
Develop normalized self-adjoint contractive representatives and the
standard-module picture by stabilization, retaining the representation
on any degenerate summand. Construct contravariance in A and covariance
in B, their commuting actions, homotopy invariance and stability.

Prove countable additivity in the first variable: for separable graded A_n
and σ-unital graded B, restriction to the summands induces
`KK_i(⨁⁽c₀⁾_n A_n,B) ≃ ∏_n KK_i(A_n,B)` in both degrees.
Construct the inverse from countable sums of normalized cycles; use
the c₀ condition to control the compact defects. Prove independence
of representatives, injectivity by compatible homotopies, and naturality.
This supplies the product groups in the contravariant mapping-telescope
sequence used by CStarClassification CL8.

Put `KK_i(A,B)=KK(A,B⊗̂Cl_i)` for all graded A,B and i modulo2;
ordinary K-group identifications use trivially graded B. Prove the equivalent suspension and Clifford pictures,
including the graded Morita maps establishing two-periodicity. Normalize
the one-suspension comparison with the positive winding class
`u(t)=exp(2πit)` (the Cayley form `(x−i)/(x+i)` in the increasing
real coordinate), and the two-suspension comparison with the displayed
`s e₂+t e₁` cycle, β in the ordered plane and the fixed Cl₂ matrices.
Construct these comparison
cycles and prove their scalar evaluation, rather than selecting their
sign from an abstract ℤ-isomorphism. Identify
`KK_i(ℂ,B)≃K_i(B)` and `KK_i(A,ℂ)` with analytic K-homology via
even and odd Fredholm modules. Prove these identifications are natural
and agree with K4's index. Give classes of *-homomorphisms and
imprimitivity modules, including the identity class represented by
`(A,id,0)`. Specify the compact left-action condition that makes this
a cycle and show how nonunitality is handled.

Build the unbounded-cycle interface on HilbertModules H6–H7. Require
an odd regular self-adjoint D, a dense graded *-subalgebra of A whose
represented elements preserve Dom(D) and have bounded adjointable
graded commutators with D, and compactness of
`φ(a)(1+D²)⁻¹` for all a∈A. Prove that
`F=D(1+D²)^(-1/2)` is a bounded Kasparov cycle, including the
functional-calculus commutator estimates. Prove every KK-class in this
scope has an unbounded representative, constructing the strictly positive
compact regularizer and its domain rather than postulating it. No
unbounded-product formula follows merely from bounded-transform
surjectivity; the product is constructed in K6. Spectral triples and
their geometric index theorems are outside this roadmap.

## K6. Kasparov product, exactness, and index pairings

Develop quasicentral approximate units with simultaneous estimates on
countable sets and Kasparov's technical theorem. In its ungraded form,
for a σ-unital J, σ-unital subalgebras A₁,A₂ of M(J), and a separable
linear subspace Δ of M(J), assume `A₁A₂⊆J` and `[A₁,Δ]⊆A₁`.
Construct positive contractions M,N in M(J) such that

```
M+N=1,     MA₁⊆J,     NA₂⊆J,     [M,Δ]⊆J.
```

Prove the graded version with even M,N, including the approximate-unit
diagonal construction and functional-calculus commutator estimates.
Use this theorem for countably generated modules; verify σ-unitality
of the compact-operator algebras to which it is applied.

For separable graded A,D and σ-unital graded B, construct
`KK(A,D)×KK(D,B)→KK(A,B)`. On cycles its module is
`E=E₁⊗_D E₂`. For homogeneous ξ∈E₁ let `T_ξ(η)=ξ⊗η`.
The product operator F must be an F₂-connection: both
`T_ξ F₂−(−1)^degree(ξ) F T_ξ` and
`F₂ T_ξ*−(−1)^degree(ξ) T_ξ* F` are compact between the
appropriate modules. For normalized self-adjoint representatives also
require positivity modulo K(E) of
`φ(a)[F₁⊗1,F]φ(a*)` for all a, where the bracket is the graded
commutator, hence an anticommutator for the two odd operators.
Construct connections, use the technical theorem to construct product
operators, and prove uniqueness up to operator homotopy. Establish
independence of all cycle and connection choices, bilinearity,
associativity, identity classes, and compatibility with homomorphisms,
Morita equivalences, suspension and the K3 external product, using K5's
explicit parity-reduction adapter. Record its minus sign for two odd
factors when comparing with the unswapped Clifford convention; include
the resulting signs in the K-theory/K-homology index interchange and
the ordered two-circle/Dirac example. Develop
the external KK product and its graded interchange law.

Form the additive KK-category of separable graded C*-algebras with
Kasparov product as composition. A KK-equivalence is an invertible
morphism; prove the induced isomorphisms in both variables and the
Morita, homotopy and Bott examples. Prove split exactness and the
universal property: a stable, homotopy-invariant, split-exact functor
from separable C*-algebras to an additive category factors through
the KK-category, uniquely with the specified action on homomorphisms;
this universal property concerns trivially graded coefficient algebras.
Build the quasihomomorphism picture: pairs of *-homomorphisms
`φ₀,φ₁:A→M(B⊗K)` whose differences lie in `B⊗K`, with common
unitary conjugacy, stabilization, degenerates and homotopy. Compare
this picture with cycles. Construct the associated split extension
`D={(a,φ₀(a)+b) | a∈A, b∈B⊗K}`, with its two sections
`a↦(a,φ₀(a))` and `a↦(a,φ₁(a))`; prove that their difference
under a split-exact functor gives the required action of a KK-class.

For a semisplit extension of separable graded C*-algebras
`0→J→A→Q→0`, with a grading-preserving completely positive
contractive section, construct the extension element in `KK₁(Q,J)`.
Prove the six-term exact sequences in both variables for separable
coefficient algebras; identify their boundaries with product by this
class and compare them with K3's index and positive-exponential maps.
Develop naturality for morphisms of extensions, suspension, mapping
cones and the product boundary identities with their graded signs.
For trivially graded A,B identify `KK₁(A,B)` with the invertible
stable extension classes of K4, proving the comparison between the
compact-perturbation, operator-homotopy and Hilbert-module-homotopy
pictures used in that identification. State the semisplit hypothesis at every application of KK
excision; K-theory's exactness for arbitrary extensions does not remove
it from the bivariant statement.

For separable unital A and separable stable J, prove the natural
six-term comparison of Manuilov–Thomsen Theorem 3. Write U(A,J)
for invertible strong unital stable extension classes and E(A,J)
for ordinary invertible classes. The exact cycle is

```
KK₀(A,J) → K₀(J) → U(A,J) → KK₁(A,J)
          → K₁(J) → U(A,SJ) → KK₀(A,J).
```

The KK-to-K maps are restriction along ℂ→A, equivalently
unit evaluation. The K-to-U maps use corona-unitary index classes
and conjugation of an absorbing unital split Busby map. Build the
relative commutant corona K₁/KK comparison and the absorbing
representation constructions needed to prove exactness. Prove the
kernel of U(A,J)→KK₁(A,J) is K₀(J)/im(unit evaluation);
its image is the kernel of KK₁(A,J)→K₁(J). No nuclearity is
needed for this invertible-class comparison. Include A=M_n, J=K:
ordinary Ext vanishes but U(M_n,K)=ℤ/n. For nonempty compact
metrizable X, evaluation at a point makes unit evaluation onto,
and K₁(K)=0; deduce U(C(X),K)≃KK₁(C(X),K).
This compares stable classes. Essential Busby maps require the
separate unital absorption theorem in K8.

Construct the index pairing
`K_i(A)×KK_i(A,ℂ)→ℤ` as Kasparov product and prove its representative
formulae. For an even Fredholm module and a projection p, it is the
Fredholm index of the compressed operator from the even to the odd
summand. For an odd self-adjoint involutive representative F and a
unitary u, put `P=(1+F)/2`; the odd pairing is the index of `PuP`
on PH. With the Clifford/suspension maps fixed in K5, prove as a
Kasparov-product identity `⟨[z],[2P_Hardy−1]⟩=−1`. Here P_Hardy is
ToeplitzOperators T1's projection onto nonnegative Fourier modes, transported
through its normalized AddCircle/Circle Haar comparison; its compressed
operator is the unilateral shift with cokernel dimension 1. This
is the scalar compatibility theorem, not the definition of the sign. Prove
compactness of the relevant commutators and Fredholmness, extend to
unitization differences, and establish homotopy invariance and
compatibility with pullback, pushforward and geometric K-theory.

## K7. Equivariance, descent, and crossed-product calculations

For a second-countable locally compact G and separable graded G-algebras
A,B, develop equivariant Hilbert modules with norm-continuous orbit maps,
grading-preserving actions, and

```
g(ξb) = (gξ)β_g(b),       ⟨gξ,gη⟩ = β_g(⟨ξ,η⟩).
```

The individual transformations are complex-linear isometries and need
not be B-linear. Define equivariant Kasparov cycles by an equivariant
representation φ and an odd F satisfying K5's conditions, norm continuity
of `g↦gFg⁻¹`, and compactness of `(gFg⁻¹−F)φ(a)` for every g,a.
Construct homotopies, groups, functoriality, restriction along continuous
group homomorphisms where the specified actions pull back, and the
equivariant Kasparov product. Prove the equivariant connection and
technical-theorem estimates needed for existence and associativity.
In the equivariant technical theorem require σ-compact G and prove
`g↦g(M)` norm continuous and `g(M)−M∈J`, alongside the ordinary
ideal/commutator estimates.
For compact G prove averaging gives invariant representatives and
develop exact sequences for equivariant semisplit extensions, with
equivariant completely positive contractive sections.

Construct the full crossed-product Hilbert module from `C_c(G,E)`,
proving positivity and completion of its convolution-valued inner
product and compatibility with Dynamics D1's Haar and involution
conventions. Build the left action and descended cycle and prove
functoriality and compatibility of
`j_G:KK_G(A,B)→KK(A⋊G,B⋊G)` with identities and Kasparov products.
For compact G, still second countable as above, and separable graded
G-algebra B with a grading-preserving action, put
`K_i^gr(D)=KK_i(ℂ,D)` for a graded C*-algebra D, using K5's fixed
Clifford degree and period comparisons and trivially graded ℂ.
Equip B⋊G with the grading induced by B and trivial grading on the group
unitaries; prove compatibility with the full crossed-product construction.
Prove the graded Green–Julg isomorphism
`KK_G^i(ℂ,B)≃K_i^gr(B⋊G)` in both degrees, natural in equivariant graded
coefficient maps. Construct the forward map from descent and the trivial
representation projection `p_G=∫_G u_g dg∈C*(G)` for normalized Haar measure,
meaning the integrated constant function1 in `C_c(G)`, not an assumed
operator-norm Bochner integral of the multiplier unitaries:
`x↦[p_G]⊗_(C*(G))j_G(x)`, with the Clifford factor carrying the trivial
G-action. For the inverse construct the regular B⋊G–B correspondence
`L²(G,B)` from D1–D2 and H1–H3: use the Hilbert-module completion of
`C_c(G,B)` for `⟨ξ,η⟩=∫ ξ(r)*η(r)dr`, not the Banach-space
Bochner L² norm of B-valued functions, with
`ρ(b)ξ(r)=β_(r⁻¹)(b)ξ(r)`, `λ_sξ(r)=ξ(s⁻¹r)` and the commuting
semilinear G-action `V_gξ(r)=β_g(ξ(rg))`. For compact G prove the
integrated left action has image in `K_B(L²(G,B))`, by continuous
B-valued kernel approximation on G×G and finite-rank module operators.
Tensor a degree-zero graded cycle over B⋊G with this correspondence,
with F⊗1, the induced grading and this G-action. For degree i externally
tensor the correspondence with Cl_i carrying the trivial G-action and
construct the grading-preserving generator comparison
`(B⋊G)⊗̂Cl_i≃(B⊗̂Cl_i)⋊G`. Apply the same cycle construction over
B⊗̂Cl_i, retaining its Clifford grading. Prove the compactness and
continuity requirements in both degrees, and that this is inverse to the
forward map by the normalized-Haar projection and the corresponding
module unitaries/homotopies. Prove both composites are identities.
For trivially graded B, use K5's ordinary K comparison to obtain
`KK_G^i(ℂ,B)≃K_i(B⋊G)` with K1–K3's ordinary K-groups and their
fixed signs. Do not forget a nontrivial grading when applying this ordinary
comparison. Include nonunital and zero B under the same definitions.
For B=ℂ identify degree zero with the complex representation ring and prove
degree one vanishes. For compact Lie G compare the commutative
case with TopologicalKTheory T6's equivariant bundles. Construct the
comparison maps; do not identify an equivariant bundle group with a
crossed-product K-group merely by matching their names.

### K7.FreeGroups. Tree comparison, free-group PV and rank invariants

For finite n≥1 put `F_n=FreeGroup (Fin n)` and label its distinguished
generators by `g_(j+1)=FreeGroup.of j`, j∈Fin n. Use the full/reduced group algebras and regular
quotient `q_n:C*(F_n)→Cr*(F_n)` constructed in Dynamics D1–D2. The group is
discrete and countable, so the equivariant KK scope fixed above applies.
Build the following tree and Toeplitz interfaces before using their
K-theory consequences. These are separate constructions from the ℤ-action
PV sequence below and from the Toeplitz–Cuntz algebras E_n.

**Tree and full/reduced KK comparison.** Consume Mathlib's
`SimpleGraph.mulCayley`, `SimpleGraph.IsTree` and `FreeGroup.toWord`. Prove
that this native Cayley graph on the positive free generators is a tree,
with edges `g→g g_i`; its geometric edges are indexed by `F_n×Fin n`.
Identify n=2 with FreeProbability F3's four-regular reduced-word model
and build the shared reduced-word/path/acyclicity interface once, uniformly
in finite n. This combinatorial interface precedes both F3's adjacency-norm
calculation and the following JV construction. F3 owns its end-oriented
shift and radial-vector norm bounds; FactorRigidity R4 owns proper
length/Haagerup kernels. Neither analytic development nor the later E_n
Toeplitz–Cuntz construction is a prerequisite for this tree interface.
Left translation preserves the positive-edge orientation. Root it at1. A vertex v≠1
has a unique adjacent vertex v′ on its path to1. On the vertex and edge
Hilbert spaces define `Fδ_1=0` and `Fδ_v=±δ_e`, where e is that last
geometric edge and the sign compares `v→v′` with its fixed positive
orientation. Prove that F is onto, `F*F=1−p_1`, `FF*=1`, and its
defect `Fλ(g)−π_edges(g)F` vanishes on vertices outside the root-to-g⁻¹
geodesic and has range in the edge span of the root-to-g geodesic, hence
has finite rank. Here p_1 is the rank-one projection at the root. Under the
chosen edge indexing, the vertex representation is λ and the edge
representation is the n-fold regular representation. Form their actual
even equivariant Kasparov cycle using the odd operator with off-diagonal
blocks F,F*. Both graded representation summands factor through Cr*(F_n).

Construct and verify the Julg–Valette homotopy showing this cycle represents
`1∈KK_(F_n)(ℂ,ℂ)`. One explicit model uses the root-parent operator
`Pδ_1=0`, `Pδ_v=δ_v′`, the projection p_1, and
`T_t=1−tP+(sqrt(1−t²)−1)p_1` for `0≤t<1`. On finitely supported vectors
use the finite-path inverse of `1−tP` to define `T_t⁻¹ λ(g) T_t`;
prove that this composite extends to a unitary θ_t(g). Do not assume
T_t has a bounded inverse on the whole Hilbert space. Prove finite-rank
differences θ_t(g)−λ(g), their norm continuity as compact operators,
strong continuity of θ_t(g), and the endpoint
`θ_1(g)=F*π_edges(g)F+p_1`. With θ_0=λ this gives a genuine Kasparov
homotopy from the zero difference cycle to `1−[λ,π_edges,F]`. Supply the
C([0,1])-module adjointability and compact-defect estimates; strong
operator convergence alone is not the homotopy condition. For this
finite-valence tree the parent operator is bounded. Use Pierre Julg,
[*A new look at the Julg–Valette homotopy for groups acting on trees*](https://arxiv.org/html/1310.6941),
§§1–5, for this construction, checking the oriented-edge normalization
against the displayed partial-isometry identities.

Construct reduced descent alongside the full descent above, using D2's
regular module norms, quotient module completion and descended compact
operators. Prove identity, product, homotopy and full-to-reduced comparison
laws. In particular prove the following factorization adapter for the
finite-rank free-group cycle: after tensoring the cycle with a separable
F_n-algebra A and applying full descent, its left action factors through
`A⋊r F_n`, since its group representation is weakly contained in λ.
Prove that factorization by the regular norm estimate/Fell absorption,
not by simplicity or by an asserted universal normal quotient. It defines
`x_A∈KK(A⋊r F_n,A⋊F_n)`. For the actual regular quotient q_A prove both

```
[q_A] ⊗_(A⋊r F_n) x_A = 1_(A⋊F_n),
x_A ⊗_(A⋊F_n) [q_A] = 1_(A⋊r F_n).
```

The first identity is the full descent of the proved equivariant unit
class; the second is its reduced descent, using the comparison law.
For A=ℂ obtain the invertibility of `[q_n]` in KK and hence its actual
isomorphisms on both K-groups, fixing `[1]` and every generator-unitary
class. This supplies the content needed here from K-amenability; it does
not assert ordinary amenability or injectivity of q_n. No free-group
K-group calculation or PV sequence is used to prove this comparison.

**Selected-generator Toeplitz extension and PV.** For a unital C*-algebra
A with an action α of F_n, put `B_n=A⋊_(α,r)F_n`,
`B_(n−1)=A⋊_(α|F_(n−1),r)F_(n−1)` and let i:A→B_(n−1) and
k:B_(n−1)→B_n be the canonical inclusions. For n=1 set B_0=A.
For A=0 all these algebras and maps are zero; make nonzero-representation
arguments only in the nonzero case.
Prove the reduced subgroup inclusion is faithful by regular coset
representations. Define Γ_n to be the identity together with reduced
words whose final syllable has positive exponent whenever its generator
is g_n; a final syllable using another generator has either sign. Prove
`g_i Γ_n=Γ_n` for i<n and `g_n Γ_n=Γ_n∖{1}`. In a faithful covariant
representation `A⊆B(H_0)`, with implementing unitaries t_g, realize B_n
by `ρ(a)=1⊗a` and `(u_g ξ)(h)=t_g ξ(g⁻¹h)`. Compress to
`ℓ²(Γ_n,H_0)`: the restricted U_i, i<n, are unitaries and the restricted
S_n is an isometry, with `P_1=1−S_n S_n*` the root-fibre projection.
Prove representation independence of the resulting Toeplitz algebra
`T_(n,α)=C*(ρ(A),U_1,…,U_(n−1),S_n)` and construct the exact sequence

```
0 → K(ℓ²(Γ_n))⊗A → T_(n,α) → B_n → 0,
```

whose symbol sends ρ(a),U_i,S_n to a,u_i,u_n. The compact ideal is the
one generated by P_1. If ω(g) replaces the reduced-word generators by
U_i,S_n,S_n*, pin its matrix-unit map, for g′,g∈Γ_n, to
`e_(g′,g)⊗a ↦ ω(g′)P_1 ω(g⁻¹)ρ(α_g(a))`. Prove the multiplication,
star, norm, density and kernel identities, and use the root corner for
K2 stability. The matrix-unit indices are Γ_n, not the whole F_n.

The inclusion `d:B_(n−1)→T_(n,α)` uses ρ and U_i, i<n.
Prove d_* is an isomorphism on K₀ and K₁ by the two-representation
Toeplitz quasihomomorphism and its rotation homotopy: construct the
representations into the stabilized multiplier algebra agreeing modulo
the compact ideal, identify their difference on d, and prove both inverse
K-group compositions by that homotopy. Consume K1–K2 stability/homotopy
and K6's quasihomomorphism comparison in the separable case. Extend to
arbitrary unital A by directed limits of separable unital α-invariant
subalgebras, proving compatible reduced norm and Toeplitz inclusions.
This is a K₀/K₁-isomorphism target; it is not inferred from an unstated
KK-equivalence of d. K3's six-term sequence then yields the cyclic exact
sequence

```
K₀(A) --i_*∘(1−α_(g_n⁻¹)*)--> K₀(B_(n−1)) --k_*--> K₀(B_n)
  ↑ δ₁                                                    ↓ δ₀
K₁(B_n) <--k_*-- K₁(B_(n−1)) <--i_*∘(1−α_(g_n⁻¹)*)-- K₁(A).
```

Here δ₁:K₁(B_n)→K₀(A) and δ₀:K₀(B_n)→K₁(A) are the actual extension
boundaries transported by the root corner. Prove the displayed ideal-map
formula using `P_1=1−S_nS_n*` and the inverse automorphism in the covariance
identity `S_n*ρ(a)S_n=ρ(α_(g_n⁻¹)(a))`. This fixes the direction of α
and is not obtained by treating F_n as a single ℤ-action. Use
Pimsner–Voiculescu, [*K-groups of reduced crossed products by free groups*](https://jot.theta.ro/jot/archive/1982-008-001/1982-008-001-006.html),
J. Operator Theory8 (1982), Lemmas1.1–1.3, the §2 two-representation
construction and Theorem3.1, with their unital coefficient hypotheses.

**Canonical K-groups and rank distinction.** Apply the selected-generator
sequence to A=ℂ with trivial action. Prove
`δ₁[u_n]=−[1]` from the lift S_n and K3's index convention, and
`δ₁[u_i]=0` for i<n from the unitary lifts U_i. Induct from n=0 and
n=1 to construct the canonical isomorphisms

```
K₀(Cr*(F_n)) ≃ ℤ,               [1] ↦ 1,
K₁(Cr*(F_n)) ≃ (Fin n → ℤ),     [λ(g_i)] ↦ e_i.
```

The positive new coordinate uses −δ₁; the raw Toeplitz boundary is not
relabelled as +1. Prove that the canonical maps from ℤ and the free abelian
group on the displayed unitary classes are isomorphisms. Transport through
the actual q_n KK-equivalence to obtain the full-algebra groups with the
same unit and distinguished generators, and prove q_n* is the identity in
these coordinates. These assertions include Pimsner–Voiculescu
Corollary3.2. Simplicity and unique trace belong to Dynamics D2.FreeGroups;
they are not used to compute the K-groups. No membership in K8's nuclear
bootstrap class, nuclearity, or UCT classification is inferred here.

For an arbitrary basis type ι, build the full and reduced algebras of
`FreeGroup ι` as the C*-inductive limits over its finite basis subsets.
For full algebras prove faithfulness of the inclusion by its group
retraction killing generators outside the subset and the full universal
property. For reduced algebras consume Dynamics D2's regular right-coset subgroup
embeddings, already constructed before the Powers and K-theory results.
Prove norm compatibility, dense union and naturality of all finite-rank
unit/generator identifications. K2 directed-limit continuity then gives, with no
cardinality restriction on ι,

```
K₀(C*(FreeGroup ι)) ≃ ℤ ≃ K₀(Cr*(FreeGroup ι)),
K₁(C*(FreeGroup ι)) ≃ (ι →₀ ℤ) ≃ K₁(Cr*(FreeGroup ι)).
```

The unit has coordinate1, each positive free generator has its corresponding
Finsupp basis coordinate, and the canonical full-to-reduced map induces
these identities. This limit argument asserts K-group isomorphisms,
without extending the separable KK category or the finite-valence homotopy
to uncountable groups. The empty basis gives ℂ and a singleton basis gives
C(𝕋). Finally prove that distinct finite ranks m,n give nonisomorphic
reduced group C*-algebras: a *-isomorphism would induce an additive-group
isomorphism ℤ^m≃ℤ^n, whose rationalized dimensions force m=n. In particular
`Cr*(F₂)≄Cr*(F₃)`. This says nothing about isomorphism of their von Neumann
weak closures.

For any C*-algebra A and automorphism α prove the Pimsner–Voiculescu
six-term exact sequence with horizontal maps `1−α_*` and the canonical
inclusion into `A⋊_αℤ`. Fix U by `UaU*=α(a)`, and take T_α
inside `(A⋊_αℤ)⊗T`. First make the KK construction for separable A;
then obtain the arbitrary-A sequence by the invariant-subalgebra limits
described below. T_α is the closure of the span
`(aU^(i−j))⊗S^i(S*)^j`, a∈A, i,j≥0. This definition covers
nonunital A. Its symbol map sends that expression to aU^(i−j).
Identify its ideal with A⊗K by
`a⊗e_ij↦U^i a U^(−j)⊗e_ij`; the distinguished corner is e_00,
not an unspecified translated rank-one projection. Put j(a)=a⊗1,
construct its inverse class x∈KK(T_α,A) by the Toeplitz
quasihomomorphism/shift homotopy, and prove both inverse products.
Compute the ideal-inclusion map followed by x as `1−[α⁻¹]` in
KK(A,A), and hence `1−(α⁻¹)_*` on K-groups. To display `1−α_*`, precompose
that map with `−α_*` on the ideal's K-group and transport the adjacent
boundary by the inverse `−(α⁻¹)_*`. Prove naturality and comparison
of these normalized boundaries with the extension index maps. Extend the theorem
to arbitrary A using directed unions of separable α-invariant
subalgebras and K2 continuity. Include the identity automorphism and
rotations of the circle as computations. For every real θ define
`α(f)(z)=f(exp(2πiθ)z)` and
`A_θ=C(𝕋)⋊_αℤ`; v(z)=z is the coordinate unitary and u is
U, so `uv=exp(2πiθ)vu`. Prove its universal unitary presentation
with these relations from Dynamics D1, including injectivity of the
coordinate copy, with no irrationality hypothesis. Define the canonical
trace `τ=HaarIntegral∘E` using D2's expectation. Prove its faithfulness
and comparison under integral parameter shifts; identify θ=0 with C(𝕋²).
The following unique-trace, generator and trace-range assertions assume
irrational 0<θ<1. Prove τ the unique normalized trace by invariance of the circle
Fourier coefficients and vanishing of the nonzero crossed-product
Fourier modes under conjugation by v. Prove K₀(A_θ)=K₁(A_θ)=ℤ²,
with K₁ basis [u],[v]. Construct a Powers–Rieffel projection of trace
θ from continuous circle functions, verify its projection relations,
and use its class x with `[1]` as K₀ basis. Compute its PV boundary
against [v] in the specified ideal corner and transport convention,
including the sign, and prove `τ(x)=θ` and trace range ℤ+θℤ.
The positive trace value fixes x rather than allowing its negative as
an unnamed PV generator. Build the rotation-number/determinant proof
of the range and of this normalization. The smooth
rotation algebra and its cyclic cocycles are outside this roadmap.

Construct the Toeplitz–Cuntz algebra E_n, universal for n isometries
with orthogonal ranges and `∑s_i s_i*≤1`, and its faithful creation
representation on the Hilbert space of finite words. Prove Toeplitz
uniqueness: orthogonal-range isometries with nonzero defect generate
a canonical copy of E_n. Build its circle gauge action, faithful
gauge expectation and core matrix/compact blocks, and prove the
corresponding uniqueness theorem; verify the vacuum defect to apply
it to creation operators and to the finite O_∞ stages. Prove that the
ideal generated by `1−∑s_i s_i*` is the compact operators and that
the quotient is O_n. Prove the scalar unital inclusion induces
`K₀(E_n)≃ℤ`, with `[1]↦1`, and `K₁(E_n)=0`, by the Toeplitz
homotopy and stability argument, including its coefficient-algebra
version. Run that argument for stable homotopy-invariant split-exact
functors using K6, obtaining that ℂ→E_n is a KK-equivalence.
Use `0→K→E_n→O_n→0` to compute K₀(O_n)=ℤ/(n−1),
K₁(O_n)=0 for n≥2: the inclusion sends the vacuum rank-one
class to `[1]−Σ[s_i s_i*]=(1−n)[1]` in K₀(E_n).
Thus the quotient carries `[1]` to 1 mod(n−1), with the generator
fixed by the actual extension maps. Dynamics D6 supplies the finite
universal O_n. Construct O_∞ as the universal unital algebra of countably
many isometries with orthogonal ranges. Identify it with the unital
inductive limit of the E_n, checking injectivity of the finite-stage
representations and compatibility of the scalar inclusions. Deduce
`K₀(O_∞)≃ℤ`, with `[1]↦1`, and `K₁(O_∞)=0`. Its absorption
and classification properties belong to CStarClassification.

Develop the mapping torus
`M_α={f∈C([0,1],A) | f(1)=α(f(0))}` and its extension with quotient
evaluation at 0 and ideal SA. With K3's positive Bott and exponential
conventions its K₀-to-K₁ boundary is `b_A∘(α_*−1)`: use the lift
`x(t)=(1−t)p+tα(p)` to prove the sign. Identify the other boundary
through suspension and prove the resulting mapping-torus sequence.
Relate it to crossed products via induction and the Thom isomorphism,
with the suspension reversal or ideal identification needed to match
the Pimsner–Voiculescu `1−α_*` convention stated explicitly.

For a strongly continuous action α of ℝ on any A prove Connes–Thom,
`t_α:K_i(A)≃K_(i+1)(A⋊_αℝ)`. Fix the Fourier identification for
the trivial scalar action using characters `s↦exp(isx)`, with x
increasing from −∞ to +∞. Normalize `t_0(1)` as the class of
`u(x)=(x+i)/(x−i)`, of winding number −1. This is the negative of
K3's positive suspension generator. Develop naturality for equivariant
*-homomorphisms, exterior equivalence of actions, suspension compatibility,
and the translation-action calculation. For separable trivially graded A
construct Blackadar's Thom cycle from a real multiplier function tending
to −1 at −∞ and +1 at +∞, prove its compact commutators and the
normalization above, and construct the inverse using the dual action.
Use Dynamics D4's Takai identification to prove both Kasparov products
are identity; this is the primary KK proof. Pass to arbitrary A through
directed separable α-invariant subalgebras, proving continuity and
compatibility of the Thom maps. Build the Wiener–Hopf extension and
its boundary identification as a consequence: deduce vanishing of the
middle K-groups from that exact sequence and the proven Thom isomorphism.
Compare with Takai duality using Dynamics D4's character conventions.

## K8. Bootstrap UCT and Künneth

Fix one universe u for the C*-algebra category and define the bootstrap
class N as an inductively generated predicate on its separable nuclear
algebras, with universe-lift comparisons. Define it as
the smallest class containing ℂ, closed under countable inductive
limits, two-out-of-three for extensions, and KK-equivalence among
separable nuclear algebras. Develop its closure and example API,
including separable commutative and AF algebras, suspensions, stabilization,
and crossed products by ℤ and ℝ using K7. Put the finite Cuntz
algebras in N using the semisplit extension with E_n: first put E_n
in N by its scalar KK-equivalence, then use two-out-of-three for O_n.
Put O_∞ in N using its inductive limit. For commutative examples
prove compact metrizable spaces are inverse limits of finite polyhedra
using refining finite-cover nerves and comparison maps. Put finite CW
function algebras in N by cell-attachment extensions and induction,
then use the function-algebra direct limits. Handle noncompact second-
countable locally compact spaces through one-point compactification
and its evaluation ideal. These topological bridges are targets here.
Membership in N is
an explicit hypothesis in the theorems below; no claim that nuclearity
alone implies membership is a target.

Use Mathlib's `CategoryTheory.Abelian.Ext` on `ModuleCat ℤ` and
`CategoryTheory.Tor` for the homological algebra. Build the bridges
from countable free abelian presentations to these derived-functor
objects: length-one projective resolutions over ℤ, computation of
Ext¹ and Tor₁, naturality, balanced tensor symmetry, and the required
vanishing criteria. Prove that Ext¹ takes direct sums in its first
variable to products and that Tor₁ commutes with direct sums in either
variable; include the cyclic-group computations. Prove freeness of subgroups of countable
free abelian groups and identify the concrete resolution kernels and
cokernels with the native Ext/Tor groups.

Construct geometric free resolutions of K-groups. For separable A,
realize generators by a *-homomorphism from a commutative algebra with
spectrum a countable disjoint union of lines and planes into `SA⊗K`,
surjective on K-theory. Replace A by `S²A⊗K` to obtain the geometric free resolution, as
in Blackadar §23.5; compare its K-groups back through the fixed Bott
and stability maps. After this explicit replacement,
form its semisplit mapping-cone extension; show that the associated
K-theory sequence is a free resolution. Develop the KK exact-sequence
comparison, bootstrap induction and resolution independence needed
for the following natural short exact sequence, for A∈N and separable B:

```
0 → ⊕_(j=0,1) Ext¹ℤ(K_j(A), K_(j+i+1)(B))
  → KK_i(A,B)
  → ⊕_(j=0,1) Homℤ(K_j(A), K_(j+i)(B)) → 0.
```

Indices are modulo 2. Identify the right map with action on K-theory
by Kasparov product. Construct the left map, prove naturality in both
variables, and prove existence of a splitting without claiming a
natural choice. Prove the right map is an isomorphism if K_*(A) is
free or K_*(B) divisible. No finite-generation hypothesis is imposed.
For separable nuclear A not assumed in N, construct the canonical
map κ from the kernel of the K-theory action γ to the degree-shifted
Ext¹ group: use K6's semisplit-extension picture and the short exact
K-group extension associated to a class with zero K-theory action.
Use `ShortComplex.ShortExact.extClass` in the native Abelian.Ext API
for this extension class and prove its agreement with the concrete
free-resolution presentation.
Prove representative independence, additivity and naturality under
Kasparov products. Define the UCT condition on such A by requiring,
for every separable B and both degrees, that γ is surjective and κ
is an isomorphism. Identify the UCT injection above with κ⁻¹.
This pins the condition used in CStarClassification independently
of prior knowledge that A belongs to N.
For A,B∈N prove that a graded K-group isomorphism lifts to a
KK-equivalence, using the product behavior of the UCT kernel rather
than assuming an arbitrary lift is invertible. This classifies the
KK-invariant; *-isomorphism classification is owned by CStarClassification.
In particular, prove the unital scalar inclusion `ℂ→O_∞` is a
KK-equivalence by K7's unit-preserving computation and this UCT argument.

Apply UCT to compact subsets X of ℂ. Build the planar topological
input through finite planar polyhedral neighborhoods and continuity:
`K₀(C(X))≃C(X,ℤ)` is free abelian, and `K₁(C(X))` is the direct
sum of copies of ℤ indexed by bounded components of `ℂ∖X`.
Construct the winding generators `x↦(x−λ)/|x−λ|` for one λ in
each bounded complementary component and their compatibility under
neighborhood restriction. Compare locally constant integer functions
with those on the profinite space `ConnectedComponents X` and consume
`LocallyConstant.freeOfProfinite` (Nöbeling); prove the component-quotient
bridge. Torsion-freeness alone would not make the UCT Ext¹ term vanish.
Identify the UCT Hom map with index pairing against the winding
generators. Supply essential unital representatives and the absorption
argument when passing from the following Ext classification to actual
unitary equivalence modulo compacts. For nonempty compact X an evaluation
class in KK₀(C(X),ℂ) pairs to1 with the unit. Use K6's comparison
exact sequence to deduce unital strong Ext→ordinary Ext is an
isomorphism in this case. Then apply the separate unital absorption
theorem to essential Busby maps; a general unital comparison
isomorphism is not used.

For an essentially normal operator T on an infinite-dimensional separable
Hilbert space, construct its extension of `C(X)` by compact operators,
where `X=σ_e(T)`. Prove the Brown–Douglas–Fillmore classification for
compact subsets X of ℂ: its Ext group is the product of one copy of ℤ
for each bounded connected component of `ℂ∖X`, represented by
`λ↦index(T−λ)`. Prove local constancy and vanishing on the unbounded
component, realize every such collection of integers, and prove
completeness of the invariant. In particular, two essentially normal
operators with the same essential spectrum are unitarily equivalent
modulo compact perturbation exactly when their index functions agree;
T is a compact perturbation of a normal operator exactly when its
index function vanishes. Establish the passage from stable extension
equivalence to these operator statements, using absorption and the
Weyl–von Neumann–Voiculescu theorem of CStarAlgebras C8. Include the
unilateral shift as the basic obstruction to a normal compact perturbation.

For A∈N and any C*-algebra B prove the spatial Künneth sequence

```
0 → ⊕_(j+k=i) K_j(A)⊗ℤK_k(B)
  → K_i(A⊗B)
  → ⊕_(j+k=i+1) Tor₁ℤ(K_j(A),K_k(B)) → 0.
```

The first arrow is K3's external product. Prove naturality, the
noncanonical splitting, and the identification of the right map through
the free resolution. Extend from separable B by directed-limit
continuity, proving the needed compatibility of the algebraic terms
with those limits. If either graded K-group is torsion-free, prove
the Tor term vanishes and the external product is an isomorphism.
No finite-generation hypothesis is imposed on this tensor-product
theorem. Include torsion examples where the Tor contribution is nonzero,
as well as computations for tensor products of commutative, AF and
rotation algebras.

## K9. Asymptotic morphisms and E-theory

For separable C*-algebras A,B define an asymptotic morphism as maps
`φ_t:A→B`, t≥1, continuous in t at each a, with addition, complex
scalar multiplication, multiplication and star defects tending to zero
in norm. No exact linearity or multiplicativity at finite t is required.
Prove asymptotic contractivity at each a, so the induced map into
`B_∞=C_b([1,∞),B)/C₀([1,∞),B)` is a *-homomorphism. Develop
equivalence by pointwise norm difference tending to zero and homotopy
by asymptotic morphisms into `C([0,1],B)`, with the defects uniform
in the homotopy parameter. Prove the equivalence and homotopy laws,
functoriality for genuine *-homomorphisms, and reparameterization
invariance.

Supply the continuous-selection bridge needed for uniformization:
prove the Bartle–Graves theorem that a surjective continuous linear
map between real Banach spaces has a continuous, positively homogeneous
nonlinear right inverse with a uniform linear norm bound. Derive it
from the open mapping theorem, locally finite partitions of unity and
successive approximate sections. Derive the global norm bound from
continuity at zero and positive homogeneity. Mathlib's `NonlinearRightInverse`
supplies a norm-controlled right inverse but has no continuity field;
the continuous selection is an additional theorem, not an instance
inferred from that structure. Apply it to `C_b→B_∞` on underlying
real spaces to replace any asymptotic morphism by an equivalent
continuous map `A→C_b([1,∞),B)`. Prove its asymptotic defects and
contractivity estimates are uniform on compact input sets.

For uniform representatives φ:A→B and ψ:B→C construct a sufficiently
fast continuous increasing `r(t)→∞` so that `ψ_(r(t))∘φ_t` is an
asymptotic morphism. Use countable dense sets and compact-uniform
estimates to prove existence, independence of reparameterization and
representatives, and associativity on homotopy classes. Develop the
asymptotic homotopy category with genuine homomorphisms as its specified
comparison functor.

Define `E(A,B)=[[SA,SB⊗K]]`. Construct addition by stabilized block
sum, the inverse by reversal of the domain suspension SA, identity classes, the
reparameterized product and the resulting additive category. Prove
stability and Bott periodicity in both variables, with the explicit
comparison to K3's suspension conventions; put
`E₁(A,B)=E(A,SB)≃E(SA,B)`. Construct boundary classes using
quasicentral approximate units and prove the six-term exact sequences
in each variable for every extension of separable C*-algebras,
without a semisplitting hypothesis. Prove naturality, mapping-cone
compatibility and the boundary-product description.

Prove E-theory's universal property for stable, homotopy-invariant,
half-exact functors on separable C*-algebras to abelian categories:
half-exact means that an extension is sent to a sequence whose
image at the middle object equals the kernel of the following map.
Construct the factorization and prove its uniqueness and compatibility
with composition, including the contravariant version. Construct the
canonical natural transformation `KK_i(A,B)→E_i(A,B)`, preserving
addition, products, homomorphism classes and suspension, and identify
`E_i(ℂ,B)` with K_i(B). If `KK(A,−)` is half-exact, prove this
comparison is an isomorphism for every separable B; in particular prove
it for separable nuclear A using completely positive lifting. This
distinguishes KK's semisplit excision from E-theory's excision for all
separable extensions while retaining the concrete comparison between
their cycles and boundary classes.

## Sources and implementation interfaces

- [Blackadar, *K-Theory for Operator Algebras*, second edition](https://www.bruceblackadar.com/Mathematics/book6.pdf):
  §§5–9 for projection/unitary models, directed limits, Bott and boundary
  formulae; §§10 and 19.9 for crossed products; §§12 and 14–19 for the
  technical theorem, grading, extensions, cycles and product; §20 for
  equivariance and descent; §§22–23 for bootstrap UCT and Künneth;
  §25 for asymptotic morphisms and E-theory. In particular use
  Theorems 9.2.1, 9.3.1, 15.7.1, 16.2.1–2, 18.4.3, 18.6.1,
  19.5.7, 23.1.1 and 23.1.3 with their stated hypotheses.
- [Roe, *Lectures on K-Theory and Operator Algebras*](https://bpb-us-e1.wpmucdn.com/sites.psu.edu/dist/1/4020/files/2017/12/KTheoryNotes-1uvuwyz.pdf):
  Lectures 7–8 for continuity, exactness and the Toeplitz proof of
  coefficient Bott periodicity; 10–12 for projective modules and
  Fredholm pairs; 14–16 for inverse-closed dense subalgebras; 19–21
  for the Connes–Thom construction and its winding −1 normalization.
- [Messerschmidt, *A Pointwise Lipschitz Selection Theorem*](https://arxiv.org/abs/1611.08435),
  Theorem 5.1: the classical Bartle–Graves continuous positively
  homogeneous selection theorem used in K9. The stronger pointwise
  Lipschitz conclusion of Theorem 5.2 is outside this roadmap's scope.
- [Cuntz, *K-theory for certain C*-algebras. II*](https://www.theta.ro/jot/archive/1981-005-001/1981-005-001-009.pdf),
  Theorem 1.5 and §2.4, pp. 105–107: Toeplitz exact sequences and
  the unital finite-stage and O_∞ K-theory computations.

Use `CStarMatrix` for finite matrix C*-norms and rectangular operators,
`IsStarProjection` for projections, and
[`Unitary.Connected`](https://leanprover-community.github.io/mathlib4_docs/Mathlib/Analysis/CStarAlgebra/Unitary/Connected.html)
for logarithm charts and the identity path component. Use
`Algebra.GrothendieckAddGroup` and `TauCeti.SplitK0` for the two K₀
presentations, and native Fredholm and derived-functor APIs for the
index and UCT bridges. Suggested signatures in
[Suggested.lean](Suggested.lean) test representative interfaces;
the milestones above specify the complete development.

The Zulip discussions of
[heterogeneous matrix operations and K₀ block sums](https://leanprover.zulipchat.com/#narrow/channel/287929-mathlib4/topic/to_additive.20issues/near/311901875)
and [general linear groups for stable K-theory](https://leanprover.zulipchat.com/#narrow/channel/287929-mathlib4/topic/General.20linear.20group.20.28and.20special.20linear.20group.29/near/564149967)
inform the use of rectangular matrix operations and matrix units.
Follow the resulting Mathlib interfaces, including relevant open PRs,
while building every required bridge in Tau Ceti.

- Manuilov–Thomsen, [*The group of unital C*-extensions*](https://arxiv.org/abs/math/0501472), Lemmas 1–2 and Theorem 3, pp. 2–5, for the strong unital invertible-class comparison, with separable source and stable separable ideal.
