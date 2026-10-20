# Hilbert C*-modules, Morita equivalence, and continuous trace

Build Hilbert C*-modules as a usable analytic theory: adjointable and compact
module operators, tensor products and induction, imprimitivity and stabilization,
continuous-trace algebras and their Dixmier–Douady invariant, and regular
unbounded operators with their local–global principle. The constructions must
support correspondences, crossed products, and operator K-theory without
requiring Hilbert-space properties that fail for general modules.

## Scope, conventions, and dependencies

Coefficient algebras are complex C*-algebras, possibly nonunital. A right Hilbert
A-module E is complete for `‖x‖²=‖⟨x,x⟩_A‖`; its inner product is conjugate-linear
in the first variable and satisfies `⟨x,ya⟩_A=⟨x,y⟩_A a`. Fullness means the
closed linear span of its inner products is A. It is a separate property.
Neither separability nor countable generation is a standing assumption.
State them in the results that use them. Zero algebras and zero modules are
included, with fullness interpreted by the same definition.

Use Mathlib's
[`CStarModule`](https://github.com/leanprover-community/mathlib4/blob/master/Mathlib/Analysis/CStarAlgebra/Module/Defs.lean)
and its opposite-algebra convention: a right A-module is represented by
`CStarModule Aᵐᵒᵖ E`, with `x a = MulOpposite.op a • x` and usual A-valued
inner product `MulOpposite.unop (inner Aᵐᵒᵖ x y)`. The underlying class has a
left scalar action; replacing Aᵐᵒᵖ by A reverses the multiplication convention.
Use `WithCStarModule` where the module norm differs from a pre-existing product
or function-space norm. Retain `NormedAddCommGroup`, `NormedSpace ℂ`, and
`CompleteSpace`, and use Mathlib's C*-algebra, order, star-homomorphism,
continuous-linear-map, quotient, and completion APIs.

An A–B correspondence is a right Hilbert B-module with a specified
*-homomorphism `A→L_B(E)`. Say explicitly when this action is nondegenerate,
meaning the linear span of AE is dense. Keep the left action explicit rather
than installing competing scalar instances. A module unitary is a surjective
inner-product-preserving module map; prove its equivalence with an invertible
adjointable map whose inverse is its adjoint. `K_A(E,F)` means the norm closure
of module rank-one maps, not the Banach-space compact operators.

- [CStarAlgebras C1–C2](https://github.com/TauCetiProject/TauCetiRoadmap/blob/2a35ac0d546695b37b8e36cd92ecc67e7ac93e82/TauCetiRoadmap/CStarAlgebras/README.md) supplies ideals, approximate
  units, hereditary subalgebras, multipliers and strict topology, representations,
  primitive spectra, and the Dauns–Hofmann theorem. C5 supplies spatial tensor
  products and analytic direct limits. C6–C7 supply nuclearity and exactness
  for their Morita-invariance consequences.
- Use Mathlib's closed graph theorem and the separation tools of
  [BanachSpaceTheory B1](../BanachSpaceTheory/README.md).
  [BanachAlgebras A4](../BanachAlgebras/README.md) supplies
  module factorization; use it for essential actions and completion arguments.
- [VonNeumannAlgebras V0](https://github.com/TauCetiProject/TauCetiRoadmap/blob/d231d5b229b03546f4bbd7aeb3021dac5416d2bb/TauCetiRoadmap/VonNeumannAlgebras/README.md) supplies states and
  GNS. Its V7 modules are Hilbert spaces carrying normal representations,
  used for coupling dimension; they are distinct from the A-valued modules
  developed here. H3 and H7 must construct the comparison by interior
  tensoring with a GNS
  representation, prove its normal-representation compatibility wherever V7
  applies, and identify induced intertwiners and tensor associators. Dimension
  theory remains confined to V7's normal Hilbert-space representations.
- [OperatorTheory/SelfAdjointSpectralTheory](../OperatorTheory/SelfAdjointSpectralTheory/README.md)
  supplies the Hilbert-space specialization of partial operators, closed graphs,
  adjoints, and resolvents. Reuse `LinearPMap` and the `zI-T` resolvent convention.
  H6 builds the module-valued adjoint and regularity theory; the Hilbert-space
  Riesz representation theorem does not give that adjoint.
- [TopologicalKTheory T1](https://github.com/TauCetiProject/TauCetiRoadmap/blob/58f69670927e9f48498986e7b6fc0bcf4e48bf1e/TauCetiRoadmap/TopologicalKTheory/README.md) supplies continuous
  finite-rank vector bundles, morphisms, pullbacks, and Hermitian metrics.
  H5 constructs their continuous section modules and supplies Hilbert fields,
  compact-operator bundles, and the analytic section-algebra comparison.
  [CharacteristicClasses C1.2](https://github.com/TauCetiProject/TauCetiRoadmap/blob/046bca7d55d37f36cab21407928935315ea4ef2c/TauCetiRoadmap/CharacteristicClasses/README.md) supplies
  the good-cover constant-coefficient Čech–singular comparison used for S³;
  [AlgebraicTopology Stage 6](../AlgebraicTopology/README.md) supplies its
  ordinary cohomology. [TopologicalSheafCohomology TS1.1–TS1.2](https://github.com/TauCetiProject/TauCetiRoadmap/blob/253015e5e7554b58362c426c4e74dc6c0643d661/TauCetiRoadmap/TopologicalSheafCohomology/README.md#ts1-compact-space-čech-cohomology-and-bounded-hypercohomology)
  supplies the generic fixed-cover abelian cochains, refinement maps and
  homotopies, and small cofinal cover/filtered-cohomology-colimit interfaces
  used in H5. Specialize its coefficient ring to ℤ. H5 owns the
  continuous-function exponential sequence and its Čech connecting map on
  paracompact locally compact Hausdorff bases.
  The general derived sheaf-cohomology and fine-sheaf comparison targets remain
  in [ComplexKahlerGeometry K2](../ComplexKahlerGeometry/README.md), and the
  smooth-function exponential sequence in
  [SmoothBundlesConnections B6](https://github.com/TauCetiProject/TauCetiRoadmap/blob/1c45ab4061b483b832b5d54f597dc69afd3f97a5/TauCetiRoadmap/SmoothBundlesConnections/README.md).

The targets H1–H4 precede H5 and H6; H7 uses H3 and H6. K-theory and KK-theory,
C*-dynamical imprimitivity theorems, and categorical completions consume these
interfaces. Their classification and product theorems are not prerequisites.
[Suggested.lean](Suggested.lean) gives representative signatures against the
existing Mathlib module classes; this README is the specification.

The child [HeisenbergImprimitivity](https://github.com/TauCetiProject/TauCetiRoadmap/blob/18b9874a63178fcd6565ff1014e3c4b283d23293/TauCetiRoadmap/HilbertModules/HeisenbergImprimitivity/README.md) develops
finite-type phase-space lattices, Schwartz–Bruhat and Poisson analysis, positive
twisted pairings, explicit imprimitivity, smooth frames and trace normalization.
It consumes H1–H3; these abstract foundations are independent of that example.
NoncommutativeGeometry N7 retains its two-torus connections, curvature and index
and supplies the child's terminal comparison.

## H1. Modules, completions, and fibers

Develop the inherited algebraic laws of the right action, its compatibility
with complex scalars, polarization, inner-product continuity, and
`⟨xa,y⟩=a*⟨x,y⟩`. Use the existing module Cauchy–Schwarz inequalities and
prove their usual right-module forms:
`⟨x,y⟩*⟨x,y⟩ ≤ ‖x‖²⟨y,y⟩` and `‖⟨x,y⟩‖≤‖x‖‖y‖`.
Give norm recovery by testing inner products against the unit ball and
`‖xa‖≤‖x‖‖a‖`. Prove positivity of every Gram matrix
`(⟨x_i,x_j⟩)_(i,j)` in the appropriate `CStarMatrix` algebra, including the
finite-sum quadratic-form criterion.

Construct the completion of a pre-Hilbert module, and the separated quotient
and completion of a positive semidefinite module. Prove their universal
properties for inner-product-preserving maps and bounded module maps. Include
modules over a dense *-subalgebra, where positivity and norm are measured in
its specified C*-completion. Prove extension of the action to that completion.
The action on a Hilbert A-module is essential: for a contractive approximate
identity `(e_λ)` of A, `x e_λ→x`. Supply the factorization `x=ya` and the
special factorization `x=y⟨y,y⟩` used in compact-operator and separation proofs.

Construct A as a right module over itself with `⟨a,b⟩=a*b`. Its carrier
is A with a right-module instance `CStarModule Aᵐᵒᵖ A`; do not reuse
Mathlib's left self-module inner product on that carrier. Construct the
instance explicitly, or transport the left self-module of Aᵐᵒᵖ along
`MulOpposite.unop`, and prove the action and inner-product formulas.
Construct closed right ideals as submodules of this right self-module,
orthogonal finite sums, and Hilbert direct sums
`⊕_i E_i`. For the last construction require norm convergence of the net of
finite sums `Σ_i⟨x_i,x_i⟩`, and prove the coordinate, inclusion, projection,
and finite-support density statements. The standard module
`H_A=ℓ²(ℕ,A)` uses this norm-summability condition. It is not the Banach space
of sequences for which `Σ_n‖a_n‖²<∞`; prove that the latter embeds densely.
For A=K(ℓ²), use orthogonal rank-one projections p_n and the sequence
`a_n=p_n/√(n+1)` to exhibit the difference. Construct `H⊗A` for a complex Hilbert
space H and its identification with the standard module when H=ℓ²(ℕ).

For a closed submodule F⊆E, define F⊥ and prove it is closed, with
`F⊆F⊥⊥`. Prove F is orthogonally complemented iff its inclusion is
adjointable, equivalently F is the range of an adjointable orthogonal
projection; identify that projection and the decomposition. Do not equip an
arbitrary Banach quotient E/F with an A-valued inner product. For a closed
two-sided ideal J⊆A, prove
`EJ=closure(span {xa : x∈E,a∈J})={x : ⟨x,x⟩∈J}` and construct the Hilbert
A/J-module `E/EJ`. Prove the quotient norm formula, completeness, and
functoriality in E and J. Give the ideal `I_E=closure(span ⟨E,E⟩)`, the
full Hilbert I_E-module structure, and the compatibility of all these constructions.

## H2. Adjointable maps and module compact operators

Define an adjoint by `⟨Tx,y⟩=⟨x,T*y⟩`. Prove uniqueness, complex and
A-linearity and boundedness starting with plain functions satisfying this
identity; use the closed graph theorem after establishing linearity. A
bounded module map is adjointable exactly when it has a function satisfying
this identity, and bounded module maps need not have such a function.
Build the spaces `L_A(E,F)` with addition, composition,
adjoint, operator norm, completeness, and the identities
`‖T*‖=‖T‖`, `‖T*T‖=‖T‖²`, `(ST)*=T*S*`. In particular `L_A(E)` is a
unital C*-algebra, with the zero-module convention allowed. Give positivity,
square roots, functional calculus, orthogonal projections, isometries,
unitaries, and the natural action on E. The forgetful map to complex
continuous linear maps is isometric and respects composition.

Construct `θ_(x,y):E→F`, `z↦x⟨y,z⟩`, and prove
`θ_(x,y)*=θ_(y,x)`, `‖θ_(x,y)‖≤‖x‖‖y‖`, and
`θ_(x,y) θ_(u,v)=θ_(x⟨y,u⟩,v)` whenever the modules match. Develop the
closed spaces `K_A(E,F)`, their two-sided composition ideal property, adjoints,
matrix blocks, and finite-sum approximation. Prove `K_A(E)` acts
nondegenerately on E, its approximate units converge on every vector, and
`L_A(E)≅M(K_A(E))`, compatibly with the existing double-centralizer
multiplier algebra. On bounded sets, its strict topology is exactly
pointwise norm convergence of both T and T* on E. Identify
`K_A(A)≅A`, `L_A(A)≅M(A)`, and `K_A(H_A)≅K(ℓ²)⊗min A`.
For every complex Hilbert space H, including arbitrary nonseparable H,
construct the isometric star isomorphism
`K_A(H⊗A)≅K(H)⊗min A`, sending
θ_(ξ⊗a,η⊗b) to θ_(ξ,η)⊗ab*. Prove finite-rank density and
spatial-norm comparison, naturality under Hilbert unitaries and coefficient
star maps, and its extension
`L_A(H⊗A)≅M(K(H)⊗min A)` with the strict topology on bounded sets.
This specializes to the H_A comparison and includes H=0.
For A=ℂ transport along the commutative opposite-algebra identification
and prove `L_ℂ(H)≅B(H)` and `K_ℂ(H)≅K(H)`, compatibly with adjoints,
operator norm, rank-one operators, positivity and strict/strong-star topology
on bounded sets. Here K(H) is the Banach-space compact-operator ideal
of OperatorTheory. These identifications are the scalar interfaces consumed
by IndexTheory and OperatorKTheory.

For unital A prove `id_E∈K_A(E)` iff E is finitely generated projective:
equivalently E is unitarily isomorphic to `p A^n` for a projection
`p∈M_n(A)`. Construct finite
Parseval frames `x_1,…,x_n` with `Σθ_(x_i,x_i)=id_E`, the analysis and
synthesis maps, and the projection/Gram-matrix comparison. Prove every
finitely generated projective right A-module admits a complete Hilbert
module structure, unique up to unitary isomorphism. Prove every A-linear
isomorphism between two such Hilbert modules is adjointable and its polar
part is a unitary; construct it using the frame formulas.
For the compact-identity implication, approximate the identity by a finite
sum of rank-one maps within norm less than 1, factor through A^n, and use
invertibility and positive square roots to normalize a finite frame.

Develop the closed-range theorem: for adjointable T, closedness of its range
is equivalent to closedness of the range of T*, and yields the orthogonal
decompositions by kernel and adjoint range. Give the bounded generalized
inverse and its projection identities. Prove T admits a polar decomposition
`T=V|T|` with initial space `closure(range T*)` and final space
`closure(range T)` iff both these submodules are orthogonally complemented;
prove uniqueness with these specified support projections.
For existence, prove `closure(range |T|)=closure(range T*)` and extend the
inner-product-preserving map `|T|x↦Tx` between the range closures, using
the orthogonal complements to extend it to all of E.

Include explicit failures of Hilbert-space intuition. In A=C([0,1]), the
ideal `J={f:f(0)=0}` has J⊥=0 and is proper, so its inclusion in A is bounded
and A-linear but not adjointable. The operator `(f,g)↦(g,0)` on A⊕J is
another such map. Multiplication by the coordinate function on A has range
closure J and fails the supported polar-decomposition criterion. For
infinite-dimensional unital A, `id_A=θ_(1,1)` is module compact and is not a compact
operator on the underlying Banach space. Verify these assertions directly.

## H3. Tensor products, induction, and imprimitivity

For a right Hilbert B-module E and a B–C correspondence F, construct the
interior tensor product by balancing the complex algebraic tensor product,
using
`⟨x⊗y,x'⊗y'⟩_C=⟨y,φ(⟨x,x'⟩_B)y'⟩_C`,
quotienting its null space, and completing. Prove positivity by the Gram-matrix
lemma, the balancing identities, density of elementary tensors, and the
universal property for balanced linear maps bounded in this seminorm.
Left adjointable actions and adjointable maps in the first factor induce
adjointable maps on the tensor product. For a map in the second factor,
include intertwining of the B-actions among the hypotheses. Prove the
adjoint and norm estimates, associating unitaries, pentagon coherence, and
the unit unitaries `E⊗_B B≅E` and `B⊗_B F≅F`, the second for a nondegenerate
action. Construct external spatial tensor products of modules and the
interchange unitary with interior products; establish compatibility with
compact module operators. For a closed coefficient ideal J prove the
interior quotient unitary
`(E⊗_B F)/(E⊗_B F)J≅E⊗_B(F/FJ)`.
For external spatial products, identify quotient-by-J with the external
product of the quotient only when the other coefficient algebra is exact,
using CStarAlgebras C7–C9; do not impose this as unrestricted tensor
permanence.

A nondegenerate representation `π:B→B(H_π)` gives the induced Hilbert space
`E⊗_B H_π` and induced representation of any algebra acting on E. Prove
nondegeneracy under the corresponding hypothesis on that action, functoriality
on bounded intertwiners, induction in stages, and compatibility with direct
sums. Identify state localization with the completion of E modulo
`{x:ω(⟨x,x⟩)=0}` and with `E⊗_A H_ω`, using the cyclic GNS vector.

Define an A–B imprimitivity bimodule as a full right Hilbert B-module E
with a specified *-isomorphism `A≅K_B(E)`. Construct its left inner product
by pulling back θ_(x,y), and prove equivalence with the two-full-inner-product
definition and the compatibility identity
`{}_A⟨x,y⟩z=x⟨y,z⟩_B`. The left inner product is linear in its first
variable. Develop the conjugate B–A module, interior products of
imprimitivity bimodules, and the evaluation unitaries
`E⊗_B E*≅A`, `x⊗ȳ↦{}_A⟨x,y⟩`, and
`E*⊗_A E≅B`, `x̄⊗y↦⟨x,y⟩_B`, with their associativity compatibilities.
Prove strong Morita equivalence is an equivalence relation and that induction
along E is an equivalence of nondegenerate representation categories, with
inverse induction along E*.

Construct the linking algebra `K_B(E⊕B)` and its explicit 2×2 corner
multiplication and involution. For an imprimitivity module its diagonal
corners identify with A and B and its off-diagonal corners with E and E*.
Prove the full-corner characterization: A and B are strongly Morita equivalent
iff they are complementary full corners of a C*-algebra, with corner
projections allowed in its multiplier algebra.

Prove the Rieffel correspondence. For a closed ideal J⊆B the corresponding
ideal of A is `closure(span {}_A⟨EJ,E⟩)`. Give the inverse, lattice operations,
the common submodule `closure(IE)=closure(EJ)`, and the induced imprimitivity
modules for the ideals and quotients. Prove
`ker(Ind_E π)=Ind_E(ker π)`, preservation of irreducibility, and the Rieffel
homeomorphism `Prim(B)≅Prim(A)` with its restriction to ideal and quotient
spectra. Deduce Morita invariance of simplicity, being CCR, being type I,
nuclearity, and exactness, supplying the full-corner approximation arguments
for the last two. Here CCR means every irreducible image is K(H), and type I
means each irreducible image contains K(H). Do not infer σ-unitality of one
algebra from Morita equivalence with a σ-unital algebra.

## H4. Countable generation and stabilization

A module is countably generated when a countable subset generates it after
right multiplication, complex linear span, and norm closure. Prove this is
equivalent to σ-unitality of K_A(E). Construct a strictly positive element
of K_A(E) from a normalized generating sequence and conversely recover a
countable generating set from an approximate identity. Prove that an
adjointable map E→F with dense range whose adjoint also has dense range
induces a Hilbert-module unitary E≅F; construct the unitary through the
positive-operator approximation argument, with its domain and convergence
statements.

Prove Kasparov stabilization for any C*-algebra A and countably generated E:
`E⊕H_A≅H_A`. Build the required dense-range adjointable maps and repeated
weighted generating sequences, and exhibit E as a complemented submodule
of H_A. Conversely, every complemented submodule of H_A is countably
generated when A is σ-unital. Keep this qualification: H_A itself need
not be countably generated for arbitrary A.

For σ-unital A and a full Hilbert A-module E, prove that ℓ²(E) contains A
as an orthogonally complemented summand; if E is also countably generated,
prove `ℓ²(E)≅H_A`. Construct the sequence of module vectors whose inner
products sum strictly to 1 in M(A). Deduce Brown–Green–Rieffel:
for σ-unital C*-algebras A and B,
`A strongly Morita equivalent to B ↔ A⊗min K(ℓ²) ≅ B⊗min K(ℓ²)`.
Stable isomorphism implies Morita equivalence without σ-unitality.
Construct the stable isomorphism from an imprimitivity module, and prove
compatibility with a common central C₀(X)-action when the module respects it.
Use K(H) for nonseparable H, Morita equivalent to ℂ but not σ-unital, to
show why σ-unitality is not an unrestricted Morita invariant.

## H5. Continuous fields, continuous trace, and Dixmier–Douady theory

Work over locally compact Hausdorff spaces X. A C₀(X)-algebra has a
nondegenerate *-homomorphism `C₀(X)→Z(M(A))`. Develop fibers
`A_x=A/closure(C₀(X\{x})A)`, restriction to open and closed sets, quotient
norms and upper semicontinuity. Construct the upper semicontinuous C*-bundle whose total space is the
disjoint union of these fibers. Specify a continuous open surjection to X,
C*-algebra fibers, upper semicontinuous total-space norm, continuous
involution, addition and multiplication on the fiber product, and continuous
scalar multiplication. Require the zero-convergence axiom: if base points
converge to x and fiber norms tend to zero, the elements converge to 0_x.
An upper semicontinuous bundle's total space need not be Hausdorff.
Construct its topology from sections of A and fiber-norm neighborhoods.
Prove its enough-sections property (each fiber value extends to a continuous
section), and the isometric C₀(X)-linear identification of A with Γ₀.
Construct the converse from these axioms and enough sections, and identify
its quotient fibers. Prove the section-to-bundle theorem for a *-algebra
of fiberwise dense sections with upper semicontinuous norm functions;
include uniqueness of the topology. Distinguish a continuous field, for
which the total-space norm is continuous, from a general C₀(X)-algebra;
prove continuity is equivalent to openness of Prim(A)→X. Use the
Dauns–Hofmann action when X is the Hausdorff primitive spectrum.

For a Hilbert C₀(X)-module E, construct Hilbert-space fibers E_x using H1,
the continuous field determined by the sections x↦ξ(x), and the unitary
`E≅Γ₀(X,(E_x))`. Build the converse from a continuous Hilbert field
specified by Hilbert fibers and a C(X)-module Γ of sections satisfying:
every norm function x↦‖ξ(x)‖ for ξ∈Γ is continuous; every fiber vector
is the value of a section in Γ; and a section locally uniformly
approximable by Γ belongs to Γ. Prove the construction from a generating
family with merely dense evaluations by taking its local uniform closure.
Prove continuity of inner products by polarization, and construct the total-space topology with
continuous norm and inner product. Give Γ₀ its supremum norm and pointwise
C₀(X)-action, prove completeness, and prove reconstruction in both
directions, including the quotient-fiber identifications. In the module-to-field
direction form Γ by local uniform completion of E's sections, prove it is a
C(X)-module, and use compactly supported cutoffs to recover E as Γ₀;
do not apply a C(X)-module reconstruction theorem directly to the
C₀(X)-module E. Fullness holds
exactly when every fiber is nonzero; zero fibers are permitted. Prove the compact
module-operator field has fibers K(E_x), with the rank-one section formula,
and identify K(E) with its continuous sections vanishing at infinity.
These fields need not be locally trivial and their fiber dimensions may vary.
For continuous finite-rank Hermitian vector bundles use T1's bundle category;
over compact X identify their section modules with the finitely generated
projective modules of H2, including morphisms, tensor products, and pullbacks.
This is the analytic section-module comparison; group completion and
K-theoretic Bott maps belong to TopologicalKTheory and OperatorKTheory.

Construct the unitary dual Â as pure states modulo unitary equivalence
of their cyclic GNS representations, using
[CStarAlgebras C2](https://github.com/TauCetiProject/TauCetiRoadmap/blob/2a35ac0d546695b37b8e36cd92ecc67e7ac93e82/TauCetiRoadmap/CStarAlgebras/README.md)'s pure-state/irreducible-GNS
correspondence. This gives a small carrier without quantifying over a
universe of arbitrary Hilbert spaces. Prove independence of the cyclic
representative, and equip it with the topology induced by `[π]↦ker π`
into Prim(A); describe closed hulls and restrictions to ideals and quotients.
Prove this kernel map surjective, and a homeomorphism for CCR algebras.
For positive operators use V4's extended trace on B(H), including nonseparable
H, and prove invariance under unitary equivalence and compatibility with
rank-one operators. Thus `[π]↦Tr(π(a))` is well-defined in `ℝ≥0∞`.
Use this unitary dual to formulate Fell's condition: each `[π]` has a
neighborhood U and a positive a∈A such that
ρ(a) is a rank-one projection for every `[ρ]∈U`. A has continuous trace when
Â is Hausdorff and this condition holds. Prove such A is CCR, identify Â
with Prim(A), and prove equivalence with density of `m(A)`, the linear span
of positive a for which `[π]↦Tr(π(a))` is finite and continuous. Prove this
span is an ideal with precisely those positive elements, and build its
linear and ideal operations and the local cutoffs needed
in the equivalence; do not assume every positive element has a finite trace.
For local Morita theory assume the spectrum X=Â is Hausdorff, hence
prove the kernel map a homeomorphism onto Prim(A) (Hausdorffness forces
injectivity for the induced topology), and use the Dauns–Hofmann C₀(X)-action.
An A–B imprimitivity module is over X when its central actions agree,
`fξ=ξf`, with multiplier actions
extended nondegenerately. Prove this is equivalent to its Rieffel
homeomorphism being the identity under the specified spectrum identifications.
Prove continuous trace iff local Morita equivalence to C₀(X): each point
has a compact neighborhood F such that the restricted algebra A^F is
Morita equivalent over F to C(F). Supply the rank-one corner and localized
imprimitivity constructions, and prove Morita invariance of continuous trace.

For the classification assume X is also paracompact. Write ČHⁿ(X,𝓕)
for open-cover Čech cohomology of the indicated abelian sheaf. Consume
[TopologicalSheafCohomology TS1.1–TS1.2](https://github.com/TauCetiProject/TauCetiRoadmap/blob/253015e5e7554b58362c426c4e74dc6c0643d661/TauCetiRoadmap/TopologicalSheafCohomology/README.md#ts1-compact-space-čech-cohomology-and-bounded-hypercohomology)
with coefficient ring ℤ for the generic fixed-cover complexes on actual tuple
intersections, ordered/tuple comparison and signs, raw refinement maps and
homotopies, and the small cofinal-cover filtered colimit of cohomology.
For locally compact Hausdorff X use its general point-neighborhood-cover
system and common-refinement/cofinality maps; compactness or finite covers
are not required here. Retain raw refinement functions until their maps
are proved equal on cohomology, and use the directed refinement preorder
only at that stage. The category of all raw refinement functions is not
assumed filtered. Reuse its native `cechComplexFunctor`/sites complexes and
`TauCeti.TopCat.cechOpenDiagram`, `cechTopDiagram` and
`cechRefinementNatTrans` intersections and refinement adapters. Prove the
concrete continuous-function-sheaf specializations commute with those
comparisons, coefficient maps, restrictions and refinements, rather than
constructing a second generic Čech theory. Regard the continuous real,
circle and locally constant integer sheaves as abelian ℤ-module sheaves;
identify the circle's additive module notation with its multiplicative
cocycle notation. H5 constructs the induced cocycle pullbacks along the
stated continuous base maps, their compatibility with these coefficient
specializations and common refinements, and the nonabelian H¹ equivalence
relation used below. That pointed-set cocycle/lifting theory is not an
application of the abelian cochain differential to a nonabelian group.
No compact-only TS1.3 Čech/derived comparison or arbitrary Čech/singular
comparison is used for this paracompact locally compact classification.

Construct the sheaves of continuous real-valued and circle-valued functions
and the locally constant integer sheaf. Prove local exactness of
`0→Z→C(-,ℝ)→C(-,𝕋)→0`, with exponential `t↦exp(2πit)`.
Build the connecting maps after cover refinements giving local logarithms;
prove their independence, exactness, and naturality. Use locally finite
partitions of unity and the resulting cochain contraction to prove
`ČHⁿ(X,C(-,ℝ))=0` for n>0. Deduce the natural isomorphism
`ČH²(X,C(-,𝕋))≅ČH³(X,Z)`. Every H³ in this classification means this
Čech group. Consume the good-cover constant-coefficient comparison for
the finite-CW S³ example; no identification with singular cohomology
on arbitrary paracompact spaces is asserted.

Construct U(H), H=ℓ²(ℕ), as the group of surjective complex-linear
isometries with the strong operator topology, and Aut(K(H)) as the group
of *-automorphisms with the point-norm topology. Prove joint continuity of
multiplication, continuity of inversion, continuity of Ad, and continuity
of evaluation and the actions on H and K(H). This uses actual operator
groups, not finite-dimensional matrix unitary groups. Build locally trivial
bundles with fiber K(H) and structure group Aut(K(H)), their transition
cocycles, isomorphisms,
pullbacks and section C*-algebras. Prove every automorphism is inner and
`Aut(K(H))≅U(H)/𝕋`, with U(H) in the strong operator topology; construct
local continuous sections of the quotient map. Develop the nonabelian H¹
cocycle classification of these bundles, and the lifting obstruction from
`1→𝕋→U(H)→Aut(K(H))→1`. Prove that this obstruction induces a bijection
from their bundle isomorphism classes to H³(X,Z). Prove strong-topology
contractibility of U(H), the extension of a continuous map from a
neighborhood of a closed subset into a contractible target, and the resulting
trivialization of unitary-bundle cocycles on paracompact bases. Construct the
refinement and gluing arguments for injectivity and realization of the
obstruction map; nonabelian H¹ is a pointed set at this stage. The topology
here is strong, not the norm topology of Kuiper's theorem.

Construct δ(A) for every continuous-trace A with identified spectrum X,
without assuming its compact-operator field is already locally trivial.
Choose local A–C₀(X) imprimitivity modules, refine so their overlap
isomorphisms g_ij exist, and prove that on triple overlaps
`g_ij g_jk=ν_ijk g_ik` for continuous scalar unitaries ν_ijk. Prove the
Čech 2-cocycle identity, independence under all choices and refinements,
and compatibility with the compact-operator-bundle obstruction above.
A spectrum-preserving equivalence is an imprimitivity module over X as
defined above.

Prove the Dixmier–Douady classification: A and B are Morita equivalent
over X iff `δ(A)=δ(B)` in H³(X,Z), and every class is realized. For the
converse construct and glue local imprimitivity modules after a scalar
coboundary adjustment; for realization construct the compact-operator
bundle and its section algebra. Give the balanced spatial tensor product
`A⊗_X B` as the quotient by the closed ideal generated by
`(fa)⊗b-a⊗(fb)`. Prove its fiber and local-module formulas and construct
the Brauer group Br(X) of spectrum-preserving Morita classes. Its identity
is C₀(X), its inverse is the conjugate algebra, and
`δ:Br(X)≅H³(X,Z)` is a group isomorphism. Include
`δ(A⊗_X B)=δ(A)+δ(B)`, the negative class for the conjugate algebra,
and naturality under pullback. Construct pullback algebras for arbitrary
continuous maps between the bases with the stated local compactness and
paracompactness, without asserting that composition always maps C₀ sections
to C₀ sections.

For σ-unital continuous-trace A and B with fixed spectrum X, deduce
`δ(A)=δ(B)` iff there is a C₀(X)-linear isomorphism
`A⊗K(ℓ²)≅B⊗K(ℓ²)`. Prove δ=0 iff Morita equivalence over X to C₀(X).
Include C₀(X,K(H)), finite-rank endomorphism bundles, and a compact-operator
bundle over S³ realizing a generator of H³(S³,Z). The last example uses the
ordinary-cohomology comparison and demonstrates a nontrivial obstruction.

## H6. Closed module operators and regularity

Represent a densely defined complex-linear operator T:E→F with `LinearPMap`,
requiring its domain to be stable under the right action and T to be A-linear
there. Define the adjoint domain by existence of a representing vector:
y∈dom(T*) iff some z∈E satisfies `⟨Tx,y⟩=⟨x,z⟩` for every x∈dom(T).
Prove uniqueness by density and construct T*. Continuity of the associated
functional alone is not a substitute for existence of z. Develop graph
inclusion, closure, restrictions, cores, sums on intersections of domains,
and composition on its actual domain. Prove adjoints are closed; if T* is
densely defined, T is closable and `(closure T)*=T*`. A densely defined
operator with densely defined adjoint is semiregular.

A closed semiregular T is regular when `1+T*T` has dense range. Prove the
resulting surjectivity and bounded adjointable inverse, regularity of T*,
and `T**=T`. Give the equivalent orthogonally complemented graph criterion
in E⊕F. Construct the graph Hilbert-module structure on dom(T), its norm
and completeness; the inclusion into E is adjointable iff T is regular,
with adjoint `(1+T*T)⁻¹` considered as a map into the graph module.

Construct the bounded transform `z_T=T(1+T*T)^(-1/2)∈L_A(E,F)`.
Prove its contraction property and give the inverse construction:
contractions z with dense range of `1-z*z` correspond to regular operators,
with domain `range((1-z*z)^(1/2))` and
`T((1-z*z)^(1/2)x)=zx`. Prove well-definedness, adjoint compatibility,
and the formulas recovering `(1+T*T)⁻¹` and the graph projection. Derive
the regular-operator polar-decomposition criterion from the complemented
closures of the ranges, with the same initial/final-space convention as H2.

For selfadjoint regular T construct its nondegenerate C₀(ℝ) functional
calculus in L_A(E), identifying C₀(ℝ) with the subalgebra of C([-1,1])
vanishing at both endpoints under `t↦t/√(1+t²)`. Prove norm, order,
composition and adjoint properties; extend nondegenerately to bounded
continuous functions, with strict convergence for uniformly bounded nets
converging uniformly on compact subsets of ℝ. Construct
the associated unbounded continuous functions on their domains by truncation
and prove the domain/composition identities used for square roots and
resolvents. For nonreal λ prove the resolvent exists with bound
`‖(λI-T)⁻¹‖≤1/|Im λ|`; prove the resolvent identity and compatibility with
the bounded transform. Establish the symmetric-operator criterion:
closed symmetric T is selfadjoint regular iff both T+iμ and T−iμ have dense
range for one μ>0, and then they are surjective for every nonzero real μ.
For a closed semiregular T:E→F prove that T is regular iff the
operator `[[0,T*],[T,0]]` on E⊕F with domain `dom(T)⊕dom(T*)`
is selfadjoint regular.
Use the graph projection and resolvent criteria to prove both directions.

For the scalar Hilbert-space specialization, build the deficiency-space
API needed in H7. For a closed densely defined symmetric S let
`N_±=ker(S*∓i)`. Prove the graph-inner-product decomposition
`dom(S*)=dom(S)⊕N_+⊕N_-`, the boundary-form formula, and the Cayley
partial-isometry correspondence. Classify selfadjoint extensions by unitaries
`U:N_+→N_-`, with domain `dom(S)+{u+Uu:u∈N_+}` and action
`S*(x+u+Uu)=Sx+iu-iUu`. Prove the bijection, including that an extension
exists iff the deficiency Hilbert spaces are unitarily isomorphic. This
Hilbert-space extension theory uses scalar Riesz representation.

## H7. Localization, separation, and the local–global principle

For a representation π:A→B(H_π) localize E to `E⊗_A H_π` and a
semiregular T to the closure of `x⊗h↦Tx⊗h` on
`dom(T)⊙_A H_π`. Prove density, well-definedness, closability, and
`(T*)^π⊆(T^π)*`. Give the equivalent state-quotient construction, the
localization of cores, and compatibility of regular operators, their
bounded transforms, functional calculi and resolvents with localization.

Prove the separation theorem: for a nonempty closed convex L⊆E and x∉L there is
a state ω with the image of x outside the closure of the image of L in
E^ω. For a proper closed submodule L, prove the stronger point-separation
statement with a pure state, equivalently an irreducible cyclic
representation and its cyclic vector. Develop the compact-operator
right ideal K_A(E,L) and its adjoint left ideal K_A(L,E), and induction
through the E–K(E) equivalence
(over I_E when E is not full) used in that proof, including extension of
nondegenerate representations from the ideal I_E to A. Retain the closure of the
localized submodule; its algebraic image need not be closed.

Prove the local–global principle, including the pure-state form:
for closed semiregular T, regularity is equivalent to
`(T*)^π=(T^π)*` for every representation π, and equivalent to that equality
for every state, and for every pure state. For closed densely defined
symmetric T, selfadjoint regularity is equivalent to selfadjointness of
all these localizations, with either all representations, all states, or
all pure states. Relate the two statements using the operator
`[[0,T*],[T,0]]` on `dom(T)⊕dom(T*)` for operators E→E.
Prove localization commutes with this block construction, retaining
`(T*)^π` as the top-right entry before identifying it with `(T^π)*`.
Use the strengthened separation theorem for the pure-state assertion.

Give a concrete selfadjoint nonregular example. Start with
`D=-i d/dt` on H=L²([0,1]) with domain H₀¹([0,1]), prove deficiency indices
(1,1), and parametrize its selfadjoint extensions D_λ by λ∈𝕋 using
normalized deficiency vectors φ_± and the condition `α_+=λ α_-` in the
graph domain of D*. Consume [PDE Lane A.1–A.6](https://github.com/TauCetiProject/TauCetiRoadmap/blob/90cd3694d4b5bd2a5b4d3b89652a958b951210a1/TauCetiRoadmap/PDE/README.md) for weak-derivative
Sobolev spaces, smooth density, integration by parts and boundary traces.
H7 proves the interval specialization: each W¹,² class has a unique
continuous absolutely-continuous representative with L² derivative; its
endpoint values are the PDE traces, and H₀¹ is exactly their common kernel.
Prove its equivalence with the derivative operators' domains and graph
norms, using the fundamental theorem for the weak derivative. This is a
comparison API on PDE's spaces, not a second Sobolev definition.
For the extension parameter use H6's Hilbert-space deficiency API. For any locally compact Hausdorff X, construct the pointwise minimal and
maximal operators on C₀(X,H) with domains C₀(X,dom(D_min/max)), where
the domain carries its graph Hilbert norm. Prove both are regular, mutually
adjoint, and their graph-domain inclusions are adjointable. For a Borel
Λ:X→𝕋 define T_Λ by the boundary equation on these graph sections.
Prove its closedness and semiregularity, and determine point localizations:
on the open set where Λ is locally continuous they are D_Λ(x); at a
point outside that set T_Λ localizes to D_min. For the adjoint distinguish
the interior of the singular set (D_max), its boundary points where Λ
extends continuously from the regular set (the extension's D_λ), and the
remaining boundary points (D_min). Build the local extension and section
approximation arguments; a pointwise limit alone is not a neighborhood
extension hypothesis.
On the Hilbert C([0,1])-module C([0,1],H), take the closed restriction of the pointwise maximal operator whose graph
sections satisfy this boundary condition with
`Λ(s)=exp(i/s)` for s>0 and `Λ(0)=1`. Prove it is selfadjoint but not
regular: its localization at 0 is the nonselfadjoint minimal D. Its
localization in the faithful Lebesgue multiplication representation is
selfadjoint. This proves that one faithful representation cannot replace
all states in the criterion.

Finally prove the following sum criterion with its actual domain hypotheses.
Let S,T be selfadjoint regular operators on E and let 𝓔⊆dom(T) be a dense
A-submodule which is a core for T. Suppose for every real μ≠0 and ξ∈𝓔,
`(S-iμ)⁻¹ξ∈dom(S)∩dom(T)` and `T(S-iμ)⁻¹ξ∈dom(S)`, and the map
`[S,T] · (S-iμ)⁻¹:𝓔→E` extends to a bounded A-linear map E→E.
Prove `[[0,S-iT],[S+iT,0]]` on `(dom(S)∩dom(T))²` is selfadjoint regular.
Build the commutator estimates, graph-norm comparison, closure and
localization steps needed for the theorem. Bounded A-linearity of the
commutator extension is the hypothesis; do not replace it by an unstated
adjointability or a common-core assumption alone.

## Sources and interface evidence

- Raeburn–Williams, *Morita Equivalence and Continuous-Trace C*-Algebras*,
  Chapters 2–3 for Hilbert modules, induction and imprimitivity. In particular
  Lemma 2.5 is Cauchy–Schwarz, Definitions 2.17 and 2.24 give adjoints and
  rank-one maps, Corollary 2.54 identifies multipliers of K(E), Lemma 2.65
  gives Gram positivity, Theorem 3.19 gives linking corners, and Theorem 3.22,
  Proposition 3.24 and Corollaries 3.31–3.33 give the ideal and spectrum
  correspondence. Chapter 4 supplies the cocycle and bundle prerequisites.
- Raeburn–Williams, Definition 5.13 and Proposition 5.15 for continuous trace
  and local Morita equivalence; Proposition 5.24 and Theorem 5.29 for the
  Dixmier–Douady invariant and classification; Theorem 4.85 for compact-operator
  bundles; Theorem 5.49, Proposition 5.50 and Theorem 5.55 for stabilization;
  Corollary 5.56 for stable classification; Theorem 6.3 for the Brauer group.
- Dixmier–Douady, [*Champs continus d'espaces hilbertiens et de
  C*-algèbres*](https://www.numdam.org/article/BSMF_1963__91__227_0.pdf),
  Definition 1, Proposition 4 and §9, for section axioms, Banach-field
  reconstruction and Hilbert fields. H5 supplies the C₀-module specialization
  and quotient inner-product identifications.
- Williams, *Crossed Products of C*-Algebras*, Appendix C, Definitions
  C.16 and C.21 and Theorems C.25–C.26, for upper semicontinuous bundles,
  sections and C₀(X)-algebra reconstruction.
- Liu–Luo–Xu, [*The Polar Decomposition for Adjointable Operators on
  Hilbert C*-Modules and Centered Operators*](https://arxiv.org/abs/1807.01598),
  Theorem 3.8 and Remark 3.11, for the polar-decomposition criterion with
  norm-closed range support projections.
- Blackadar, *Operator Algebras*, II.7, for Hilbert modules, adjointable and
  compact operators, tensor products, multipliers and Morita equivalence.
- Roe, [*Lectures on K-Theory and Operator Algebras*](https://bpb-us-e1.wpmucdn.com/sites.psu.edu/dist/1/4020/files/2017/12/KTheoryNotes-1uvuwyz.pdf),
  Proposition 10.2, for the compact-identity and finite-projectivity criterion.
- Teschl, [*Mathematical Methods in Quantum Mechanics*, second edition](https://www.mat.univie.ac.at/~gerald/ftp/book-schroe/schroe2.pdf),
  §2.6, Theorem 2.27, for the Hilbert-space deficiency extension API; the
  convention U=−V translates his Cayley unitary to the displayed domain.
- Kaad–Lesch, [*A Local Global Principle for Regular Operators in Hilbert
  C*-Modules*](https://arxiv.org/abs/1107.2372), §§2–4 for regularity,
  localization and separation, §6 for the boundary-condition examples,
  Assumption 7.1 and Theorem 7.10 for the sum theorem, and the appended
  erratum Theorems 1.3 and 2.1 for the pure-state principle and separation.
  The erratum attributes the stronger principle to Pierrot, Theorem 1.18.

The [Mathlib module-convention discussion](https://leanprover.zulipchat.com/#narrow/stream/287929-mathlib4/topic/redefining%20%60Inner%60%20in%20%60InnerProductSpace%20%F0%9D%95%9C%20%F0%9D%95%9C%60)
explains the use of the opposite algebra for right modules and the prevention
of scalar-instance diamonds. The
[`WithCStarModule` discussion](https://leanprover.zulipchat.com/#narrow/stream/287929-mathlib4/topic/defeq%20abuse%20in%20%60WithLp%60)
explains type synonyms for the module norm. Follow those designs and the
C*-class unbundling in
[Mathlib PR #24106](https://github.com/leanprover-community/mathlib4/pull/24106).
Use existing `LinearPMap` graphs and closure APIs for partial operators,
the TopCat Čech diagrams and sites complexes for cover cochains, and T1's
bundle APIs. The derived cohomology carrier `Sheaf.H` remains the target
of the neighboring sheaf-comparison developments cited above.
The [sheaf-cohomology design discussion](https://leanprover.zulipchat.com/#narrow/stream/335062-homology/topic/Roadmap%20for%20sheaf%20cohomology)
specifies the Ext-based cohomology and the comparison from cover complexes.
Follow [Mathlib PR #35073](https://github.com/leanprover-community/mathlib4/pull/35073)
for the concrete abelian-group Čech cochains on open covers and their
identification with `cechComplexFunctor`. Consume TS1.1–TS1.2's generic
fixed-cover/refinement and cohomological-colimit interfaces in that shape.
H5 builds their continuous-function-sheaf specialization, continuous
exponential-sequence computations and nonabelian/DD lifting and gluing,
while consuming the good-cover comparison for S³.
Build the missing adjointable, tensor, and cohomological comparison material
in Tau Ceti in those shapes; replace it by imports when matching Mathlib
implementations become available.
