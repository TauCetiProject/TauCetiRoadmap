# Free probability, free products, and random matrix models

Build noncommutative distributions and free independence as usable theories,
with reduced and amalgamated operator-algebraic products, full Fock-space
models, noncrossing cumulants, additive and multiplicative convolution,
free limit theorems, and Gaussian and Haar random-matrix asymptotic freeness.
The combinatorial and analytic constructions must agree: a law computed by
cumulants must be realized by positive states where positivity is asserted,
and a matrix limit must specify which moments and convergence mode it proves.

## Scope, conventions, and dependencies

The algebraic theory uses unital complex algebras and complex-linear
functionals φ with φ(1)=1. A *-probability space additionally has an
involution and `φ(a*a)≥0`; a C*-probability space uses a unital C*-algebra
and an existing positive continuous linear functional with φ(1)=1. A
tracial state satisfies `φ(ab)=φ(ba)`. Faithfulness means
`φ(a*a)=0 → a=0`, and is a separate hypothesis. A W*-probability space
uses a von Neumann algebra and a specified normal state; require its
faithfulness or traciality in the results that use them. Algebraic
expectations are not silently positive or traces.

Use Mathlib's `Algebra`, `LinearMap`, `Subalgebra`, `StarSubalgebra`,
`PositiveLinearMap`, `FreeAlgebra`, `IncidenceAlgebra`, `Finpartition`,
`Polynomial`, `PowerSeries`, probability measures and Bochner integrals.
C*-states use `A →ₚ[ℂ] ℂ` with φ(1)=1, matching V0 and
`PositiveLinearMap.GNS`; consume their automatic continuity and norm-one
interfaces when a continuous-functional view is needed. A joint algebraic distribution
of `(a_i)` is `φ ∘ FreeAlgebra.lift ℂ a`; its *-distribution evaluates
words in generators and their adjoints. Use a type synonym of `FreeAlgebra ℂ (ι×Bool)` for the *-polynomials
and install its conjugate-linear involution by conjugating coefficients, reversing words,
and exchanging a generator with its formal adjoint. Do not reuse the
default `StarRing (FreeAlgebra R X)` from `Algebra.Star.Free`, which fixes
coefficients and generators; the synonym carries its own `StarRing` and
`StarModule ℂ` instances. Prove its universal
property and compatibility with evaluation. Commutative multivariate
polynomials do not encode arbitrary noncommutative words.

Inner products are conjugate-linear in the first argument. Products in a
word follow its displayed order; in Lean use ordered lists, not an unordered
product in a noncommutative algebra. Write `tr_N=N⁻¹ Tr` for normalized
matrix trace. Our semicircular element is `s(h)=ℓ(h)+ℓ(h)*`, of variance
`‖h‖²` and support `[−2‖h‖,2‖h‖]`; this is twice the element normalized
by one-half in Voiculescu–Dykema–Nica. Creation operators satisfy
`ℓ(h)*ℓ(k)=⟪h,k⟫ I` in the second-variable-linear convention.

Cumulants κ_n have n≥1. The scalar law R-transform is
`R(z)=Σ_(n≥1) κ_n z^(n−1)`. The multivariable R-series has no constant
term and has κ_n as its degree-n coefficients; its one-variable version
is zR(z). State which of these conventions an identity uses. Analytic
measure transforms here concern compactly supported probability measures.
Formal identities have their own coefficient-wise proofs and do not assert
global invertibility of analytic transforms.

- [CStarAlgebras C1–C5](../CStarAlgebras/README.md) supplies CFC,
  representations, ideals, tensor products and CP maps; F3 owns its
  enveloping completion and universal norm.
  [VonNeumannAlgebras V0–V4](../VonNeumannAlgebras/README.md) supplies GNS,
  operator topologies, bicommutants, normal representations and spatial
  Hilbert tensors; V6 supplies tracial L², V8 supplies group algebras,
  V10–V11 supplies Tomita theory, and V13a supplies the CP/operator-system
  foundations. F4 defines C*-conditional expectations; the normal finite
  tracial expectations come from
  [NoncommutativeIntegration I4](../NoncommutativeIntegration/README.md).
  This roadmap owns free-product Hilbert spaces, free-product commutants,
  and their modular/trace compatibility.
- [HilbertModules H1–H3](../HilbertModules/README.md) supplies completed
  right Hilbert modules, adjointable maps, orthogonal sums and interior
  tensors. Use `CStarModule Bᵐᵒᵖ E` for right B-modules. F4 owns the
  expectation-GNS module and the reduced amalgamated free-product module.
- [OperatorTheory/SelfAdjointSpectralTheory](../OperatorTheory/SelfAdjointSpectralTheory/README.md)
  supplies bounded spectral measures and functional calculus;
  [OperatorTheory/PolarDecomposition](../OperatorTheory/PolarDecomposition/README.md)
  supplies the actual polar decomposition in F7. F1 owns the
  state-to-scalar-law comparison and its moment/measure interface, consuming
  the Riesz representation theorem and Stone–Weierstrass in Mathlib.
- [OperatorAlgebraDynamics D1–D2](../OperatorAlgebraDynamics/README.md)
  supplies full/reduced group C*-algebras; F3 proves their free-group-product
  comparison. [OperatorKTheory K7](../OperatorKTheory/README.md) owns the
  universal E_n and O∞, while Dynamics D6 owns finite universal O_n; F3 compares their universal
  generators with Fock creation operators without rebuilding their K-theory.
- Use Mathlib's Gaussian distributions, independence and Haar probability
  on compact groups for F8. F8 builds the matrix unitary-group topology,
  compactness, coefficient integrals and Weingarten calculus, consuming
  [RepresentationTheory/SchurWeyl Layer8](../RepresentationTheory/SchurWeyl/README.md)
  for the tensor permutation centralizer and proving its unitary comparison.

F1–F2 are the algebraic/combinatorial foundation. F3–F4 realize free
families, F5 builds convolution and transforms, F6–F7 develop their laws,
and F8 supplies matrix approximations.
Factor/subfactor applications motivate the tracial amalgamated products
and free Gaussian interfaces. Factor rigidity, index, planar-algebra and
classification theorems are outside these milestones. Free entropy, the
isomorphism problem for free-group factors, general unbounded-law analytic
subordination, non-Gaussian Wigner ensembles, almost-sure random-matrix
convergence, and strong convergence of random-matrix operator norms are
outside this roadmap. [Suggested.lean](Suggested.lean) gives representative
interfaces; this README is the specification.

## Shared foundations and matrix comparisons

Consume the existing [RandomMatrices roadmap, PR #397](https://github.com/TauCetiProject/TauCetiRoadmap/pull/397),
whose finite combinatorial prerequisite and Milestones 1,3,5,6 already
specify the common scalar/matrix foundations. The overlapping targets
below refine those same reusable interfaces, with the generality and
conventions specified here; implement each common construction once.
They are milestone dependencies, not a dependency on its later local-law,
large-deviation or stochastic developments. Build any missing supplier
targets in Tau Ceti without waiting for that PR.

| Common interface | Supplier and comparison required here |
| --- | --- |
| Finite noncrossing partitions and permutation combinatorics | RandomMatrices' independent finite prerequisite; F2 pins its native `Finpartition`/`IncidenceAlgebra` realization, cyclic order and complete cumulant-use API. Keep this below every analytic matrix limit. |
| Scalar moment-to-weak convergence and resolvent inversion | RandomMatrices Milestone 3; F1/F5 consume it through the state-to-measure and formal/analytic bridges specified here. Use its native `resolventTransform` m and prove G=−m before comparing R/S formulas. |
| Semicircle and Marchenko–Pastur measures | RandomMatrices Milestone 3 supplies the measure carriers. Identify F6's variance-σ² centered semicircle with `semicircleReal 0 σ²`; for λ>0 its rate-λ jump-one free Poisson law is the dilation by λ of `MP_(1/λ)`, and λ=0 is δ₀. F6 adds the general jump/compound-law theory. |
| Scalar free independence, cumulants, reduced Hilbert products, bounded free convolutions and scalar limit theorems | RandomMatrices Milestone 6 and F1–F6 describe a single common implementation. F1–F5 specify its broader algebraic, C*-completion and formal-series contracts; F4 separately owns the operator-valued and normal amalgamated extensions. Use the same expectations, NC cumulants, free-product representations and scalar laws. |
| Random matrix functions and ensemble carriers | RandomMatrices Milestones 1,5 supply measurable matrix maps, normalized spectral measures, GUE/Ginibre coordinates and Haar laws. F8 extends their representatives to the all-moments `AEEqFun` algebra; prove coordinatewise a.e. equality preserves every integrable star-word and `E tr_N`, and compare each covariance and dimension normalization. |
| Matrix integration and limits | F8 specifies the general expected-star-moment/Weingarten interface, including deterministic limits without a uniform norm bound. The corresponding expected-moment targets of RandomMatrices Milestone 6 use this same interface; that roadmap owns the additional almost-sure, variance/higher-centered-moment and orthogonal conclusions and its matrix applications. |
| Permutation-cycle products | [IntegralHeckeAndGaloisDeterminants §0.2, PR #789](https://github.com/TauCetiProject/TauCetiRoadmap/pull/789) supplies `cycleProduct`/`cycleTerm` in their cyclic traversal order. F8 specializes that scalar-valued functional to `tr_N`, including fixed points, instead of introducing another generic cycle-product API. |

For F8's expected empirical measures consume RandomMatrices Milestone 1's
`empiricalMeasure`/`spectralMeasure` and decreasing Hermitian eigenvalues.
Prove its trace-moment dictionary and measurability comparison with the
all-moments quotient. Moment-to-weak convergence uses Milestone 3's common
law interface; it does not imply an almost-sure or operator-norm conclusion.

## F1. Distributions, moments, and free independence

Develop normalized expectations, positivity, traces, restriction to
subalgebras, state-preserving homomorphisms and transport. For each
introduced distribution give extensionality by words, identity/composition
and relabeling maps, subfamilies, adjoints and substitutions of polynomials.
Prove joint distributions determine every polynomial moment, and equality
of *-distributions is preserved by *-polynomial evaluation. Construct the
GNS realization of a positive normalized *-distribution, distinguishing an
algebraic pre-Hilbert representation from a bounded C*-representation.
For bounded realization fix R_i≥0 and require
`φ(p*X_i*X_i p)≤R_i²φ(p*p)` for every *-polynomial p, with the
analogous adjoint-generator inequalities. Prove these give bounded left
multiplication and its adjoint, with norm at most R_i, and characterize
bounded GNS realizations by these inequalities. Prove a uniform exponential
bound `|φ(w)|≤R^length(w)` on all generator/adjoint words implies the
corresponding bounds through iterated Cauchy–Schwarz. Positivity alone is
not a boundedness theorem.

For a bounded selfadjoint a in a C*-probability space, construct its law μ_a
as the probability measure on ℝ supported in spectrum(a), characterized by
`φ(f(a))=∫ f dμ_a` for continuous f on that spectrum. Prove uniqueness,
`m_n(μ_a)=φ(a^n)`, positivity, compact support, affine pushforwards and
polynomial functional-calculus pushforwards. Compare the CFC construction
with integration of the scalar spectral measure in a GNS representation.
Show every compactly supported probability measure has a bounded
commutative realization. Consume Tau Ceti's
`Measure.ext_of_forall_integral_monomial_eq_of_support` from
`Probability.Moments.CompactDeterminacy` for moment determinacy, and prove
its compatibility with these CFC laws. Define convergence in distribution as convergence of every
word moment, with convergence in *-distribution testing adjoints too.
For scalar laws prove the moment-to-weak-convergence implications used in
F6, using tightness and uniform integrability from higher moments; the
approximating supports need not fit in one fixed compact set.

Unital subalgebras `(A_i)` are free with respect to φ when
`φ(a_1⋯a_n)=0` for every nonempty centered word with
`a_j∈A_(i_j)` and `i_j≠i_(j+1)`. Nonadjacent labels may coincide.
Variables are free when the unital algebras they generate are free;
*-freeness uses the unital *-algebras generated by variables and adjoints.
Develop subfamily, reindexing, restriction, generated-algebra, grouping of
disjoint index sets, and state-preserving image lemmas. Prove multilinear
expansion reduces general moments to centered alternating words, yielding
uniqueness of the joint distribution from factor distributions and freeness.
Include first mixed moment factorization, centered polynomial tests, and
compatibility with norm closure in C*-probability spaces and weak closure
in the tracial von Neumann setting.

Distinguish classical independence of commuting algebras from freeness.
For free variables compute mixed moments that demonstrate the distinction,
including fourth moments of two free centered variance-one semicirculars.
Prove constants form a free family with any other family, and handle empty
families and empty words explicitly. For positive states obtain the
covariance/orthogonality statements used in reduced Hilbert products.
Do not infer positivity of an arbitrary algebraic free-product functional
without the realization in F3.

## F2. Noncrossing partitions and free cumulants

Represent partitions of n ordered positions using
`Finpartition (Finset.univ : Finset (Fin n))`. A partition is noncrossing
when distinct blocks never contain four positions a<b<c<d with a,c in
one and b,d in the other. Develop decidability, finite enumeration,
restriction and increasing relabeling, intervals, block extraction,
singleton insertion/deletion, rotation and concatenation. Equip NC(n)
with refinement order: discrete is bottom, one block is top for n>0,
and NC(0) consists of the empty partition. Prove it is a lattice;
meet is ordinary common refinement, while join is least noncrossing
coarsening and need not equal join in the full partition lattice.
Construct joins and prove their universal property and interval APIs.

Prove `card NC(n)=catalan n`, the Catalan enumeration of noncrossing
pair partitions of 2n, and the recurrences by the block containing the
first position. Develop the correspondence with plane trees and the
permutation model: blocks are cycles in their increasing cyclic order.
Prove the transposition-length/geodesic characterization, cycle-count
formulas, and the noncrossing-pairing criterion used in F8's genus bound.
Construct Kreweras complement on the interlaced positions
`1,bar1,2,bar2,…`, as the largest complementary noncrossing partition.
Prove existence, uniqueness, order reversal, bijectivity, its square's
rotation formula, and `#blocks(π)+#blocks(Kπ)=n+1` for n≥1; both block counts are zero
at n=0. Permutations compose with the rightmost map acting first; for
γ=(1 … n) prove `p_(Kπ)=p_π⁻¹γ`, so K² relabels by γ⁻¹.
Prove the corresponding cycle formulas rather than identifying differently
oriented complements by notation alone.

Use `IncidenceAlgebra.zeta` and `.mu` on the finite NC posets. Prove
interval factorization into products of smaller NC lattices, Möbius
multiplicativity, and `μ(0_n,1_n)=(-1)^(n−1)catalan(n−1)` for n≥1.
Supply the corresponding blockwise formula and both inversion directions;
this Möbius function is distinct from number-theoretic Möbius inversion.
Prove the interval-partition embedding and partial-inversion identities
needed for grouped arguments.

For a word a_1,…,a_n define its block moment φ_π by multiplying scalar
moments of each block, keeping arguments within a block in increasing
order. Define `κ_π=Σ_(σ≤π) φ_σ μ(σ,π)` by Möbius inversion on NC(n),
put `κ_n=κ_(1_n)` for n≥1, and prove κ_π is the product of its block
cumulants. Establish both directions of

```
φ(a_1⋯a_n) = Σ_(π∈NC(n)) κ_π(a_1,…,a_n)
κ_n(a_1,…,a_n) = Σ_(π∈NC(n)) μ(π,1_n) φ_π(a_1,…,a_n).
```

Develop multilinearity, scalar/adjoint transport, vanishing when one input
is 1 for n≥2, centering invariance for n≥2, cyclic invariance for traces,
and complex conjugation with reversed adjoints for *-states. Compute the
first four cumulants and moments with repeated and distinct arguments.
Prove the grouped-product formula: cumulants of products of consecutive
arguments are sums over π with `π∨intervalPartition=liftedPartition`,
including the lift and its compatibility with block restrictions.

Prove subalgebras are free iff every mixed cumulant of order n≥2 vanishes
whenever its labels are not all equal. Give both proofs from the centered
word criterion and grouped-product formula, and expose the generated-
algebra tests. Deduce additivity of cumulants for sums of free families.
For two free families `(a_j)` and `(b_j)`, prove

```
κ_n(a_1b_1,…,a_nb_n) = Σ_(π∈NC(n)) κ_π(a_1,…,a_n) κ_(Kπ)(b_1,…,b_n)
φ(a_1b_1⋯a_nb_n) = Σ_(π∈NC(n)) κ_π(a_1,…,a_n) φ_(Kπ)(b_1,…,b_n).
```

These identities do not require a trace. Prove them by odd/even-position
partitions and the chosen Kreweras convention; include n=1 separately
from the empty-word identity.

## F3. Hilbert free products, Fock space, and operator algebras

Use Mathlib's `LinearAlgebra.FreeProduct ℂ A` and `lift` for the
algebraic unital free product of a set-indexed family of complex algebras;
construct its compatible star structure, its reduced-word linear decomposition after a chosen
splitting by normalized functionals, and its universal property. For
nontrivial unital C*-algebras construct the full unital C*-free product by
the universal C*-seminorm. Control its universe by cyclic representations
of density at most `κ=max(aleph0,Σ_i |A_i|,|I|)` and carrier cardinality
at most κ^aleph0, using a fixed universe/model family. Prove the supremum
agrees with representations in arbitrary larger universes, finiteness on
each word, completeness, and the universal property for unital
*-homomorphisms. For arbitrary pointed factor representations prove
`kerλ_i=kerπ_i`; use V0's faithful representation with a chosen unit vector
to prove factor embeddings. A faithful state is not needed on each A_i.
The empty product is ℂ. Supply relabeling, grouping and universal maps;
a reduced product is a different completion, specified by input states.

For pointed Hilbert spaces `(H_i,ξ_i)` with unit vectors, put
`H_i°=H_i⊖ℂξ_i` and construct

```
H = ℂΩ ⊕ ⊕_(n≥1, i_j≠i_(j+1)) H_(i_1)° ⊗⋯⊗ H_(i_n)°.
```

Give inclusions, word projections, dense finite tensors, and canonical
unitaries `H_i⊗H(i)≅H`, where H(i) has vacuum and words not starting in i.
Construct the left representations λ_i and right representations with
reversed-word convention, and prove their adjoint, norm, unit, multiplication
and commutation identities. For GNS inputs prove the vacuum state on the
full product is positive, restricts to each factor and makes them free.
The reduced C*-product is the norm-closed algebra generated by the λ_i.
Prove its GNS space is the constructed H, and its factor representations
have exactly the kernels of the input GNS representations. State
faithfulness of an input state separately from faithfulness of its GNS
representation. Characterize the latter kernel by
`a∈kerπ_φ ↔ ∀b, φ(b*a*ab)=0`.

Develop expectation-preserving identifications, regrouping of free
products, and the quotient map from full to reduced. Prove the reduced
vacuum state is faithful when the input states are faithful, proving
separation on the reduced C*-algebra by the shortest-word compression
argument. Remove factors equal to ℂ before applying the nontrivial-factor
form of that argument; if only their GNS representations are faithful, prove the factor maps
injective. The vacuum state need not be faithful, as a pure M₂ state
in the one-factor case shows. Prove tracial inputs
give a trace, and construct the conditional expectations onto factors
and subproducts, with their bimodule, positivity and norm properties.
Give the full-versus-reduced example from two copies of C(𝕋) with Haar
states: using `FreeGroup (Fin 2)`, their full and reduced products are
respectively C*(F₂) and C*_r(F₂). Prove the quotient is not injective:
on ℓ²(F₂) the adjacency sum of the four standard generators/inverses has
norm 2sqrt3, while the full trivial character sends it to 4. Consume
OperatorKTheory K7.FreeGroups' early shared reduced-word/path/acyclicity
interface on the native `SimpleGraph.mulCayley` carrier, identified at
n=2 with this four-regular word model. Construct the end-oriented shift
for the upper norm bound and finitely supported radial vectors for the
matching lower bound. This use is before K7's Julg–Valette, free-group PV,
and Toeplitz–Cuntz constructions; none of those analytic/K-theoretic results
is a prerequisite for the tree interface. Thus the trivial character cannot factor through the reduced
algebra, proving the full/reduced distinction directly.

For von Neumann algebras with faithful normal states construct the weak
closure of the left copies, prove their normality, and construct its
faithful normal free-product state. Prove the commutant theorem using the
right copies of the factor commutants and their cyclic vectors. Compute
Tomita conjugation on reduced words, reversing order and applying factor
conjugations, and the modular operator/action using the factor modular
data. For trace inputs prove Δ=1 and the free-product vector is cyclic,
separating and tracial. Identify group von Neumann free products with
`L(Monoid.CoprodI G)` and their canonical traces. Include the representation and
expectation compatibility between C*-reduced products and weak closures.

Construct full Fock space `𝓕(H)=ℂΩ⊕⊕_(n≥1) H^(⊗n)` from completed
Hilbert tensors and ℓ² sums. Define creation ℓ(h), annihilation ℓ(h)*,
and gauge Λ(T), with Λ(T)Ω=0 and T acting on the first tensor factor.
Prove boundedness, `‖ℓ(h)‖=‖h‖`, `‖Λ(T)‖=‖T‖` when H≠0,
linearity/adjoints and the vacuum formulas. For an orthonormal basis give
the creation isometries, orthogonal range projections and strong sum
`Σℓ(e_i)ℓ(e_i)*=1−P_Ω`. Compare finite-rank Fock representations with
K7's Toeplitz–Cuntz algebra, compact vacuum ideal and quotient O_n;
for countably infinite rank prove `O∞→C*(ℓ(e_i))` is an isomorphism,
using K7's faithful finite-stage representations and the nonzero vacuum
complement `1−Σ_(i≤n) ℓ(e_i)ℓ(e_i)*`. Keep vacuum
states on creation algebras distinct from their traces on Gaussian algebras.

For a real Hilbert space H construct its Hilbert complexification,
with its isometric real inclusion, complex inner product and completeness,
and put `s(h)=ℓ(h)+ℓ(h)*`. Prove the vacuum Wick formula over noncrossing pairings,
variance `‖h‖²` and freeness for orthogonal subspaces; F6 identifies
these moments with its explicit semicircle measure.
For `Γ(H)={s(h):h∈H}''` prove the vacuum state is faithful normal tracial.
Construct second quantization for real contractions as
normal unital completely positive trace-preserving maps, with identity,
composition, isometry-induced embeddings and projection-induced conditional
expectations. Prove the reduced-word/tensor implementation and agreement
with orthogonal direct sums and free products.

## F4. Amalgamated freeness and reduced products

For unital inclusions B⊆A_i and conditional expectations E_i:A_i→B,
define a C*-conditional expectation as a unital positive B-bimodule
projection onto B. Develop its norm-one/idempotence properties and prove
complete positivity from the positive matrix `[E(a_i*a_j)]`, testing its
B-valued quadratic form `E((Σa_i b_i)*(Σa_j b_j))`. Use the existing
`CompletelyPositiveMap` (`→CP`) for its CP view.
Construct the algebraic free product over B and its universal property,
without confusing its universal maps with those of a reduced product.
Define B-valued freeness by vanishing of E on centered alternating words.
Develop B-balanced moments, regrouping, restrictions, and uniqueness of
E on the algebraic product from its factor expectations. Prove positivity
and complete positivity through the represented construction below.

Construct `L²(A_i,E_i)` by its B-valued inner product `E_i(a*b)`, null
quotient and completion. Prove left multiplication bounded and adjointable
with adjoint multiplication by a*, and identify the orthogonal decomposition
`L²(A_i,E_i)=B⊕L²(A_i,E_i)°` given by E_i. The left GNS representation
is faithful iff every nonzero a∈A_i has b with `E_i(b*a*ab)≠0`.
Faithful expectation implies this condition; the converse need not hold.
Construct the right Hilbert B-module

```
𝓔 = B ⊕ ⊕_(n≥1, i_j≠i_(j+1))
           L²(A_(i_1),E_(i_1))° ⊗_B⋯⊗_B L²(A_(i_n),E_(i_n))°.
```

Use interior tensors, including the left B-actions. Construct the λ_i by
prefix/deletion formulas and canonical module unitaries, and prove their
boundedness, adjoints and agreement on B. The reduced amalgamated product
is their generated norm-closed algebra, with
`E(T)=⟨1_B,T1_B⟩_B`. Prove E is a unital completely positive conditional
expectation, its restrictions are E_i, and the copies are free over B.
Prove factor embeddings under the stated GNS-faithfulness hypothesis,
the reduced-word density and the module-GNS comparison. Establish uniqueness
by an expectation-preserving isomorphism of represented products, and
associativity/regrouping with all intermediate expectations specified.

Develop expectation-preserving factor embeddings into other systems with
the same B, assuming both source and target expectations have faithful
GNS representations, and prove the induced reduced-product embedding.
Give the obstruction without source GNS faithfulness: A=ℂ⊕ℂ with
E(z,w)=z embeds diagonally into M₂ with ψ(x)=x₁₁, preserving
expectation, but the reduced source kills (0,1) while the target GNS
representation retains its nonzero diagonal image. Retain a pure M₂
vector state as a positive control for faithful GNS representation
without a faithful state. Prove the
free product of B-bimodule unital completely positive maps that fix B and
preserve the expectations exists, assuming both source and target
expectations have faithful GNS representations. Give its word formula,
complete positivity,
composition and restriction properties. Consume the unital specialization
of [OperatorKTheory K4](../OperatorKTheory/README.md)'s Hilbert-module
Kasparov–Stinespring dilation for these CP maps; the strictness condition
is automatic for a unital domain. This early dilation layer precedes
extension invertibility. F4 supplies the free-product assembly and its
word identities. Construct conditional expectations onto factors/subproducts
as cases of this construction. State and prove
faithfulness of the product expectation when all E_i are faithful,
separately from faithful GNS representations. Remove factors equal to B
before the nontrivial-factor compression proof; the zero/one-factor cases
have their direct identifications: the zero-factor product is B;
the one-factor product is the image in the expectation-GNS representation,
equal to the original algebra when that representation is faithful.
For arbitrary inputs put `Ā_i=λ_i(A_i)` and prove that E_i descends to
a conditional expectation `Ē_i:Ā_i→B`, with `Ē_i(λ_i(a))=E_i(a)`.
Identify its expectation-GNS module and represented free product with
the ones already constructed. Prove that E is faithful iff every Ē_i
is faithful: restriction gives necessity on these actual subalgebras,
and the faithful-input theorem gives sufficiency. When each λ_i is
injective, in particular under the stated GNS-faithfulness hypothesis,
this is equivalent to faithfulness of every original E_i. Include the
one-factor example `A=ℂ⊕ℂ`, `B=ℂ1`, `E_i(z,w)=z`: its represented
product is ℂ with faithful identity expectation, although E_i is not
faithful. This demonstrates why restriction to the original A_i
requires injective factor maps.
Do not give the reduced product the unrestricted categorical universal
property of the full product.

For finite von Neumann algebras `(M_i,τ_i)` with faithful normal tracial
states and a common unital von Neumann subalgebra B on which their traces
agree, consume NoncommutativeIntegration I4's faithful normal
trace-preserving E_i. Prove the trivial modular-flow specialization,
uniqueness, and identification with the L² projection onto L²(B,τ).
This supplier applies to arbitrary finite algebras and subalgebras, not
only II₁ factors. Construct their tracial amalgamated
von Neumann product on the scalar Hilbert completion of 𝓔, using L²(B,τ).
Prove the factor embeddings normal, the vacuum trace faithful normal,
and the B-valued expectation faithful normal and trace preserving.
Prove the normal state/expectation-preserving uniqueness, regrouping,
commuting left/right representation formulas and density of reduced words
in L². Construct the orthogonal reduced-word decomposition of L²(M),
its B-bimodule actions and tensor associators. Normality must be proved
from the bounded and L² interfaces, not from algebraic freeness alone.

Include B=ℂ as the scalar product, one factor as its original algebra,
and products of group algebras amalgamated over a common subgroup, with
Fourier-coefficient expectations and the trace-preserving identification
with `Monoid.PushoutI`, using its reduced-word/group universal property. Supply the reduced group-word and
Hilbert tensor identifications. The finite-factor and rigidity properties
of these algebras have their separate owning roadmaps.

## F5. Free convolution, formal series, and scalar transforms

For compactly supported μ,ν on ℝ realize free bounded selfadjoint a,b
and define μ⊞ν as the law of a+b. Prove independence of realization
from F1's uniqueness, associativity, commutativity, δ₀ identity, affine
pushforward laws and support bounds. Develop finite convolution powers,
convolution of freely independent families and transport through their
C*- and von Neumann realizations. Prove cumulants add and expose the corresponding convolution-power APIs.

For a normalized algebraic expectation define moments M(z), cumulant
series C(z) and the shifted law R(z) by

```
M(z)=1+Σ_(n≥1)m_n z^n,
C(z)=1+Σ_(n≥1)κ_n z^n=1+zR(z),
M(z)=C(zM(z))=1+zM(z)R(zM(z)).
```

Use the existing formal `PowerSeries.subst`, `HasSubst` and
`substInvOfIsUnit` APIs for composition and compositional inversion.
Prove the moment/cumulant coefficient, zero-constant and unit-linear
coefficient hypotheses on these objects, and their transport interfaces;
reuse the existing inverse identities and uniqueness. Prove the displayed identities
coefficient by coefficient from the block containing the first position.
Prove exponential cumulant bounds for compactly supported measures and
convergence of their series on a disk. Use `G_μ=−MeasureTheory.resolventTransform μ`, since the native integrand
is `(t−z)⁻¹`. Consume its `analyticOn_resolventTransform` theorem and
prove the sign/conjugation,
sign of imaginary part, normalization at infinity and moment expansion.
Use the local inverse of `w↦G_μ(1/w)` near zero to construct
`K_μ(w)=1/w+R_μ(w)`. Prove the local inverse identities and equality
with the formal series; do not claim G is globally injective.
Establish `R_(μ⊞ν)=R_μ+R_ν` in both senses on their common domain.
Give a scalar Stieltjes-inversion API recovering measures from G, with
integrals over intervals and atom limits; expose density and atom recovery
for the law computations in F6. Distinguish endpoints with atoms
when taking interval limits.

Construct multivariable noncommutative formal series on words in
`FreeMonoid ι`: coefficients are functions on words, product sums over
word decompositions, and the constant coefficient is separated explicitly.
Give unit, associativity, degree filtration, and substitution for finite
index types by series with zero constant coefficient; prove coefficient
extensionality, and the one-variable `PowerSeries` comparison.
The joint degree-n R-coefficient is κ_n; prove that freeness is equivalent
to the absence of mixed coefficients between the specified free families.
A commutative `MvPowerSeries` cannot replace this word-indexed series.

Define boxed convolution by the NC/Kreweras coefficient sum. Prove its
associativity, its unit and inverse construction when the degree-one
coefficients are units, and its identification with joint cumulants of
products of two free families. The one-variable operation is commutative;
no such assertion is imposed in multiple variables. Expose moment/zeta,
cumulant/Möbius and grouped-argument formulas as compatible operations.

For an algebraic variable with m₁≠0 put Ψ(z)=M(z)−1 and define

```
S(z)=(1+z) Ψ^⟨−1⟩(z)/z.
```

Division by z removes a proven zero constant coefficient. Prove this
agrees with `C₀^⟨−1⟩(z)/z`, where `C₀(z)=zR(z)`, and prove the
one-variable boxed-convolution/S-series group isomorphism. Deduce
`S_(ab)=S_a S_b` for free a,b with nonzero means, with no trace hypothesis
for this algebraic moment identity. Compute constant laws, retaining the
nonzero-mean condition; F6 computes
the transforms of its Poisson and compound laws.
For compactly supported μ,ν supported in [0,∞), define μ⊠ν as the law of
`a^(1/2)b a^(1/2)` in a tracial free realization. Prove its independence,
associativity, commutativity, δ₁ identity and δ₀ absorbing law; prove
its moments equal those of ab and its S-transform is the product when
both means are nonzero. A positive compact law of mean zero is δ₀,
so handle that case through the absorbing law rather than defining an
inverse transform with zero linear coefficient.

## F6. Semicircular laws and free limit theorems

Construct the centered semicircle probability measure of variance σ²≥0:
for σ>0 its density is
`(2πσ²)⁻¹ sqrt(4σ²−t²)` on `[−2σ,2σ]`, and at σ=0 it is δ₀.
Prove normalization, symmetry, support, odd moments zero and
`m_(2n)=catalan(n) σ^(2n)`. Its only nonzero cumulant is κ₂=σ².
Prove equivalence of this law, its cumulants and the Fock realization,
including shifts and rescaling. Prove the one-dimensional Gaussian von
Neumann algebra is L(ℤ) by CDF transport from its atomless semicircle spectral measure to
Lebesgue probability on [0,1], then circle Haar probability and V8's
L(ℤ) Fourier model; prove the measure-algebra/L∞ and generator maps.
Using F3's free-product decomposition, identify Γ(H) with the group algebra
of the free group on an orthonormal basis, including zero rank ℂ, rank one
L(ℤ), and the II₁ factor for rank at least two. Define semicircular systems by joint
cumulants: only κ₂ survives, with the specified covariance matrix.
Prove realization for every positive semidefinite real covariance matrix,
change of real coordinates, and the equivalence of orthogonality and
freeness for the centered system. Semicircularity of each variable alone
does not specify a free semicircular system.

Prove the free central limit theorem for freely independent identically
distributed centered selfadjoint variables of variance σ²: the normalized
sum `N⁻¹ᐟ² Σ_(j=1)^N a_j` has moments converging to the semicircle law.
Give the noncrossing pairing proof and the cumulant proof, and their
agreement. Extend to freely independent centered variables satisfying
`sup_j |φ(a_j^k)|<∞` for every positive integer k and
`N⁻¹ Σ_(j=1)^N φ(a_j²)→σ²`. Prove the needed uniform cumulant bounds;
no identical-distribution hypothesis is imposed in this extension.
For C*-realizations deduce weak convergence of the scalar laws by F1's
moment/tightness interface. Also prove the free law of large numbers:
for freely independent identically distributed selfadjoint variables, their
averages converge in moments and the state's GNS L² norm to their mean. Prove the exact
squared L² error is κ₂(a)/N; no trace is needed for that assertion.
These conclusions do not assert operator-norm convergence.

Construct the free Poisson law with rate λ≥0 and jump α∈ℝ by
`κ_n=λα^n`. For jump 1 and λ>0 let
`a=(1−sqrt λ)²`, `b=(1+sqrt λ)²`; prove the measure is

```
max(1−λ,0) δ₀ + 1_[a,b](t) sqrt((b−t)(t−a))/(2πt) dt.
```

Define the density at t=0 by any fixed value and prove the formula as an
a.e. density, including its integrable endpoint singularity at λ=1.
For general jump use pushforward by t↦αt; negative jumps reverse interval
orientation, and λ=0 or α=0 gives δ₀. Prove positivity, total mass,
support, moments and cumulants. Prove the free Poisson limit theorem:
for N large enough that λ/N≤1, the N-fold free convolution of
`(1−λ/N)δ₀+(λ/N)δ_α` converges in moments and weakly to this law.
Give its first-order cumulant expansion and the moment bounds for the
measure conclusion. Identify s² for a semicircular s of variance σ²
as rate 1, jump σ² free Poisson.

For compactly supported ν and λ≥0 construct the compound free Poisson
law with `κ_n=λ∫t^n dν(t)`, by the analogous free rare-event limit.
Give its positivity, compact-support bound, uniqueness, λ-addition
semigroup, jump pushforwards and its transform formulas on F5's native
series, including
`R(z)=λ∫t/(1−tz)dν(t)` and, when the mean is nonzero, the S-series. Include
δ₀ and degenerate jumps rather than assuming a nonzero mean.

Within compactly supported laws define free infinite divisibility by
existence of compactly supported additive free convolution roots of every
positive integer order. Prove the free Lévy–Khintchine criterion: μ is
freely infinitely divisible iff its real cumulants are conditionally
positive, meaning
`Σ_(i,j=1)^r conjugate(c_i)c_j κ_(i+j)≥0` for every r and c∈ℂ^r.
The equivalent transform representation is
`R_μ(z)=κ₁+∫ z/(1−tz) dρ(t)` for a finite positive compactly supported
measure ρ. Supply uniqueness of κ₁ and ρ, the moment/GNS construction of
ρ, and the bounds ensuring bounded realizations. Conversely realize these
cumulants on full Fock space by a scalar, creation/annihilation, and gauge
operator; prove the word-moment recursion and positivity.
Construct the compactly supported convolution semigroup μ_t, t≥0,
with cumulants tκ_n, prove its weak continuity, μ₀=δ₀ and
`μ_s⊞μ_t=μ_(s+t)`, and identify its convolution roots. Prove the
corresponding characterization by moment limits of N-fold powers of
compact laws, with positivity and moment bounds stated in the limit argument.
The general unbounded-law Lévy theory is outside the stated scope.

## F7. Compression, circular and R-diagonal elements

For a projection p free from a specified family and t=φ(p)≠0,
construct the corner probability space `(pAp,φ/t)` with unit p and prove

```
κ_n^(pAp)(pa_(i1)p,…,pa_(in)p)=t^(n−1)κ_n(a_(i1),…,a_(in)).
```

This algebraic identity does not require a trace. For a positive state
have 0<t≤1, and for faithful states p≠0 suffices; prove the positivity
and normalization of the corner state. Derive the law R-transform
`R_compressed(z)=R_a(tz)`, the consequences for semicircular and free
Poisson laws, and preservation of freeness for compressed subfamilies.
Build the product/interval-partition and Kreweras block-count proof.

For matrix units e_ij with `φ(e_ij)=δ_ij/d`, free from `(a_r)`, put
p=e_11 and `a_(ij)^r=e_(1i)a_r e_(j1)` in pAp. Prove their compressed
joint cumulants vanish unless `j_k=i_(k+1)` cyclically, and when this
condition holds equal `d^(1−n)κ_n(a_(r1),…,a_(rn))`. Supply the matrix
reconstruction and normalized trace comparisons. This is a cyclic-index
formula, not independent freeness of all corner matrix entries.

Define a circular element `c=(s₁+i s₂)/sqrt 2` for free variance-one
semicirculars. Compute its full *-distribution: κ₂(c,c*) and κ₂(c*,c)
are 1, all other joint cumulants vanish. Prove coordinate change and
circular-system realization, and identify the laws of c*c and cc* as
rate-one jump-one free Poisson. Define a Haar unitary by
`φ(u^k)=0` for every nonzero integer k; prove its circle-valued spectral
law is Haar probability and compute its alternating cumulants as
`(-1)^(n−1)catalan(n−1)` in degree 2n.

An R-diagonal variable has zero joint cumulants except at even alternating
words in a,a*. Define its two determining sequences from the two starting
letters. Prove reconstruction of all *-moments, adjoint/scalar transport,
rotation invariance and the circular/Haar examples. Prove traciality on
the generated *-algebra is equivalent to equality of the determining
sequences. Give the cumulants of aa* and a*a by their noncrossing-block
formulas, and show their two distributions determine the R-diagonal
*-distribution; in the tracial case either one suffices.

Prove the free-Haar multiplication characterization and the realization
of a tracial R-diagonal *-distribution as uh with u a Haar unitary *-free from positive h having the law of
|a|=(a*a)^(1/2), in a C*-probability space. Distinguish a distribution model from a polar decomposition
inside the original algebra. In a finite von Neumann algebra with faithful
normal trace, if ker(a)=0, prove a is R-diagonal iff its polar decomposition
`a=u|a|` has u Haar and *-free from |a|; prove u is then a unitary.
With nonzero kernel the polar factor is only a partial isometry, so the
Haar-unitary assertion belongs to the distribution model and is not imposed
on that partial isometry.

## F8. Gaussian and Haar random-matrix asymptotic freeness

For each N≥1 use a probability space and measurable complex N×N matrix
entries with all finite moments. Construct the *-algebra of matrix-valued
random variables using `MeasureTheory.AEEqFun` for a.e. equality, with entries in
`⋂_(1≤p<∞) L^p`, and the normalized tracial expectation
`φ_N(X)=E[tr_N(X)]`. Prove integrability, closure under sums/products/star
by Hölder, positivity, normalization and trace identities. Gaussian entries
are unbounded, so this algebra is not M_N(L∞). Develop joint *-moment
convergence across possibly different probability spaces for different N,
and construct its limiting positive tracial polynomial functional by word
limits. A limiting deterministic distribution need not have a bounded
C*-realization; the algebraic limit remains meaningful in that case.

Construct GUE matrices by independent centered diagonal real Gaussians of
variance 1/N and upper-triangular complex Gaussians whose real and imaginary
parts are independent of each other and have variance 1/(2N), with lower
entries their conjugates. All these independent real coordinates are jointly
independent. Prove
`E[G_ij G_kl]=N⁻¹δ_ilδ_jk`. Construct the complex Ginibre ensemble with
independent centered entries satisfying
`E[Z_ij conjugate(Z_kl)]=N⁻¹δ_ikδ_jl` and `E[Z_ij Z_kl]=0`.
Use Mathlib's Gaussian laws and classical independence, and extend
Tau Ceti's `centralMoment_id_two_mul_gaussianReal` and
[StandardDistributions Layer5](../StandardDistributions/README.md) to the finite
real/complex Gaussian Wick formula needed for matrix words from Gaussian
moments and multilinearity. This is classical Wick pairings before any
noncrossing restriction is imposed.

For GUE prove the exact expected normalized-trace expansion, for m=2k≥2,

```
φ_N(G^m)=Σ_(π∈P₂(m)) N^(#cycles(γπ)−1−k),  γ=(1 … m),
```

with moment zero equal to 1 and odd moments zero. Prove the exponent is −2g with g≥0, and g=0
exactly for noncrossing pairings. Give the colored-pairing version for
independent GUE families, the adjoint-sensitive version for Ginibre,
and the leading-term/free Wick comparison. Deduce their joint expected
*-moment convergence to free semicircular or circular systems, respectively.
Include finite-N correction bounds for each fixed word by counting the
positive-genus terms; these are moment errors rather than norm bounds.

For a fixed finite deterministic matrix family D_N whose joint
*-moments under tr_N converge, prove independent GUE families are
asymptotically free from D_N, with the specified free semicircular limit.
No uniform operator-norm bound on D_N is required. Construct the
permutation-trace functional as the product of normalized traces of the
cycle words, prove the exact mixed Wick expansion, and show its subleading
terms vanish because each fixed deterministic trace-word is bounded by
its convergence hypothesis. Identify the leading color-respecting NC sums
with F2's mixed moments, keeping the permutation orientation compatible
with Kreweras complement. Extend the argument to nonselfadjoint Gaussian
families using adjoint colors. Specify bounded realizations only when
the deterministic limiting distribution has them.

Use the existing matrix unitary group and finite-dimensional topology.
Consume `TauCeti.Matrix.isCompact_unitaryGroup` and its `CompactSpace`
instance from `TauCeti.Topology.Algebra.UnitaryGroup`, comparing its
entrywise topology with this matrix realization. Construct normalized
Haar probability and develop invariance and matrix coefficient
measurability. Construct the Haar-averaging orthogonal
projection onto invariant tensors and the correspondence with tensor-power
intertwiners. Consume SchurWeyl Layer8's permutation centralizer for GL_N
and prove the unitary-group comparison by differentiating U(N)'s tensor
action on skew-Hermitian matrices, whose complex span is gl_N, then using
matrix exponentials/polar decomposition to obtain the GL_N centralizer.
Include the
small-dimension relations among permutation tensors. Compute their Gram
matrix `G_(σ,τ)=N^(#cycles(σ⁻¹τ))`. For all N build its inverse on its
range and the invariant projection; for N≥k prove G invertible and define
unitary Weingarten coefficients from G⁻¹. Prove phase invariance makes
unbalanced coefficient integrals zero, and, for N≥k, the balanced formula

```
E[Π_(r=1)^k U_(i_r j_r) conjugate(U_(i'_r j'_r))]
 = Σ_(α,β∈S_k) (Π_r δ_(i_r,i'_(β(r))))
                   (Π_r δ_(j_r,j'_(α(r)))) Wg(N,βα⁻¹).
```

Provide conjugation/inversion symmetries and the inverse-Gram identities.
Derive, for fixed σ∈S_k,
`Wg(N,σ)=N^(#cycles(σ)−2k)(Mob(σ)+O(N⁻²))`, where
`Mob(σ)=Π_(cycles C) (-1)^(|C|−1)catalan(|C|−1)`.
Make each error bound uniform over the finite permutations at fixed k,
and prove it through the finite Gram expansion and transposition-length
geodesics. The large-N formula does not use a matrix inverse at a
singular small dimension.

Prove independent Haar unitary matrices converge in joint *-moments to
free Haar unitaries, and are asymptotically free from any deterministic
finite family with convergent joint *-moments. Supply the full centered
mixed-word proof using Weingarten expansion, the geodesic fixed-point
lemma and vanishing centered cycle traces; a proof for only a single
unitary or single alternating word does not discharge the theorem.
Prove the conjugation version: for deterministic families A_N and B_N
whose separate joint *-distributions converge, and independent Haar U_N,
the families `U_N A_N U_N*` and B_N have free joint limiting
*-distribution. No joint limit of the original combined deterministic
family, and no uniform norm bound, is required.

For selfadjoint sums and the positive matrix products
`A_N^(1/2) U_N B_N U_N* A_N^(1/2)` with A_N,B_N≥0, deduce convergence
of expected empirical spectral measures to the additive/multiplicative
free convolution of the input laws when those limiting laws are compactly
supported. Construct empirical measures from the finite spectral theorem, prove
measurability using continuous ordered eigenvalues of selfadjoint matrices,
and compare every normalized trace moment, and prove tightness and the
higher-moment uniform integrability needed for weak convergence. Give the
semicircle example, sums of independent semicircular ensembles, and Haar
conjugation of deterministic positive matrices as concrete computations.
The scope is expected measures and expected *-moments, as fixed above.

## Sources and interface evidence

- Nica–Speicher, *Lectures on the Combinatorics of Free Probability*,
  Lectures1–7 for distributions, free independence and Fock constructions;
  Theorem8.10 for the CLT; Lectures9–11 for NC lattices, Möbius inversion
  and cumulants, particularly Theorem11.12 and Theorem11.16; Theorem12.7
  for the R-transform and Propositions12.11,12.15 for free Poisson limits;
  Theorem13.16 for compact-support infinite divisibility; Theorems14.4,
  14.10 and14.18 for products and compression; Lecture15, particularly
  Theorem15.10, Proposition15.13 and Corollary15.14, for R-diagonal
  distribution models and the separate injective polar theorem;
  Lectures16–18 for noncommutative series, boxed convolution and S;
  Lectures22–23, especially Theorems22.35,23.13,23.14 and Lemma23.5,
  for Gaussian and Haar expected-moment asymptotic freeness.
- Voiculescu–Dykema–Nica, *Free Random Variables*, §§1.4–1.6 for
  universal, represented and von Neumann products and the commutant theorem;
  Theorem2.6.2 for the Gaussian algebra and real-contraction functor;
  §3.8 for amalgamated expectations. Its half-normalized Gaussian
  convention is translated explicitly above.
- Abadie–Dykema, [*Unique Ergodicity of Free Shifts and Some Other
  Automorphisms of C*-Algebras*](https://jot.theta.ro/jot/archive/2009-061-002/2009-061-002-004.pdf),
  §4 for the expectation-GNS module and represented amalgamated product.
- Dykema, [*Faithfulness of Free Product States*](https://arxiv.org/abs/funct-an/9702014),
  Theorem1.1 and its compression proof for faithful scalar input states.
  Catterall, [*Free Products and Continuous Bundles of C*-Algebras*](https://theses.gla.ac.uk/3865/1/2003CatterallPhD.pdf),
  Chapter2, Theorem2.2.2, for amalgamated expectation faithfulness; trivial
  factors equal to B are removed before applying its nontrivial-factor form.
- Blanchard–Dykema, [*Embeddings of Reduced Free Products of Operator
  Algebras*](https://arxiv.org/abs/math/9911012), Theorems1.3 and2.2,
  for compatible embeddings and expectation-preserving B-bimodule UCP maps;
  Construction3.1 and Lemmas3.3–3.6 for normal product representations and
  expectations. F4 uses the common finite trace's faithful normal state on
  B, so it meets the state-based construction's hypothesis.
- Collins, [*Moments and Cumulants of Polynomial Random Variables on Unitary
  Groups, the Itzykson Zuber Integral and Free Probability*](https://arxiv.org/abs/math-ph/0205010),
  Theorem3.1 and Propositions3.2–3.3 for the full centered-word Haar
  asymptotic-freeness proof, with deterministic joint moment convergence
  and no uniform norm bound. Apply it to the deterministic family together
  with its adjoints to obtain the stated *-moment theorem.
- Collins–Śniady, [*Integration with respect to the Haar measure on unitary,
  orthogonal and symplectic group*](https://arxiv.org/abs/math-ph/0402073),
  Proposition2.2, Corollary2.4, Proposition2.6 and Corollary2.7 for the
  invariant projection, image-algebra Weingarten inverse and asymptotics.

Reuse `Finpartition` rather than a second unrelated partition carrier,
`IncidenceAlgebra.mu` rather than a separately defined inverse, and existing
`catalan` rather than a private sequence. Construct the missing NC, free
probability and Weingarten APIs in Tau Ceti. The
[Lean random-matrix discussion](https://leanprover.zulipchat.com/#narrow/channel/116395-maths/topic/what's.20the.20status.20of.20random.20matrix.20theory.3F/near/499996486)
records an independent free-CLT project and the
[SemicircleLaw project](https://github.com/FredRaj3/SemicircleLaw) develops
classical Wigner moment counting. Follow compatible algebraic-expectation,
Catalan and Gaussian designs; any integration of that external code requires
coordination and license verification under the repository's contribution
rules. These projects do not transfer ownership or create waiting conditions.
