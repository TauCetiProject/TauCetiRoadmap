# Temperley–Lieb trace positivity, operator algebras, and annular modules

Develop the Hermitian and operator-algebraic theory of Temperley–Lieb
algebras, together with affine diagram algebras and their annular modules.
The principal theorem determines exactly which positive real loop parameters
make the closure trace positive at every level. Its proof belongs to diagram
algebra and is independent of the operator-algebraic construction of Jones
projections in a subfactor. Build the positive quotients, their compatible
C*-tower and unitary tensor category, and usable APIs for their traces,
expectations, representations and tensor products.

## Scope, conventions, and dependencies

The ordinary complex-parameter diagram theory is supplied by
[TemperleyLieb Layers0–7](../TemperleyLieb/README.md):
planar matchings, composition, the linear pivotal category, the diagram/presentation
isomorphism, closure trace, ordinary cellular algebras and Gram polynomials,
Jones–Wenzl idempotents, negligible ideals and the algebraic fusion quotients.
[PivotalSpherical Layers0–4](../PivotalSpherical/README.md)
supplies general pivotal/spherical traces, finite semisimple categories and
fusion-category terminology. Build the required missing targets in Tau Ceti
in these designs and consume their APIs. The dependencies specify the
mathematics regardless of their publication or implementation status.

Use the native `TauCeti.TemperleyLieb R δ n` presentation and its universal
property in `TauCeti.Algebra.TemperleyLieb.Basic`. Its generators are
`e δ i`, `i : Fin (n−1)`. Prose generator labels e_i and p_i
are one-based: e_i is native `e δ (i−1)`, for 1≤i<n.
Thus the last e_n in TL_(n+1) is native index n−1. The relations are

```
e_i² = δ e_i,       e_i e_(i±1) e_i = e_i,
e_i e_j = e_j e_i   when |i−j|≥2.
```

The diagram algebra and native presentation must be related by an algebra
isomorphism commuting with generators, strand inclusions and traces; do
not develop a second unrelated presented algebra. Products stack the left
factor on top of the right, matching Mathlib's `End` multiplication
`x*y=y≫x`. Ordinary category composition `f≫g` puts g on top of f.
For δ≠0 the normalized generators `p_i=δ⁻¹e_i` are idempotents and
satisfy `p_i p_(i±1) p_i=δ⁻²p_i`. The normalized formula is never used
at δ=0.

Write `[r](δ)` for TemperleyLieb Layer0's quantum-integer target
`qInt`, the evaluation
of `Polynomial.Chebyshev.S` at index r−1. It is a polynomial in δ:
`[0]=0`, `[1]=1`, `[2]=δ`, `[r+2]=δ[r+1]−[r]`.
When q∈ℂ× and δ=q+q⁻¹ this agrees with the usual Laurent sum, including
q=±1 by evaluation. The native spin trace uses δ=−(q+q⁻¹);
replace q by −q when comparing it with the positive-loop convention.
No singular rational expression defines a quantum integer.

For admissible positive δ use one carrier uniformly:
`Q_n=AnalyticTL δ n ⧸ R_n`, where R_n is its bilinear trace radical.
Prove R_n=0 when δ≥2 and identify that quotient with the original
algebra by the canonical *-isomorphism; do not redefine Q_n in that case.

For every complex δ the reflection that fixes coefficients is a linear
anti-involution. Call it r. Coefficient conjugation instead carries the
δ-algebra to the conjugate-δ-algebra. For **real δ**, their composite
is the conjugate-linear adjoint `x†`. Keep this adjoint distinct from the
R-linear `StarRing` reflection in the algebraic roadmap: in particular
`(i·1)†=−i·1`. Use a type synonym of the native complex presentation to
carry the conjugate-linear `StarRing` and `StarModule ℂ` instances, and
compare it with the diagram carrier explicitly. For general complex δ
there is a conjugate-linear map between the two different fibers;
Hermitian positivity is asserted only after the real specialization.

The closure trace T_n is **unnormalized**: `T_n(1)=δ^n`,
`T_(n+1)(ι_n x)=δT_n(x)` and
`T_(n+1)(ι_n(x)e_n)=T_n(x)`. Its Hermitian form is
`H_n(x,y)=T_n(x†y)`, conjugate-linear in x. For nonzero real δ,
`τ_n=δ⁻ⁿT_n` is the normalized Markov trace; it can have a different
sign from T_n when δ<0. At δ=0 normalized traces and normalized Jones
projections are undefined. The algebraic algebras and closure traces
remain defined there.

- [CStarAlgebras C1–C4](../CStarAlgebras/README.md) supplies finite matrix
  C*-algebras, ideals, continuous functional calculus and the concrete
  CP-map interfaces; V13a owns their general CP foundations. C5 supplies
  spatial tensor products and C*-inductive limits.
  [CStarClassification CL2](../CStarClassification/README.md) supplies
  Bratteli-diagram/AF presentations. This roadmap supplies the TL path
  instances, finite diagram-quotient C*-norms, trace representations
  and the elementary unitary TL category.
- [VonNeumannAlgebras V0–V1](../VonNeumannAlgebras/README.md) supplies
  GNS representations and weak closures; V4 supplies normal functionals
  and V6 tracial L². V13a supplies general CP maps. The
  construction here supplies their specific input states and trace Hilbert
  spaces. It asserts no factor classification or index theorem.
- [CategoricalOperatorAlgebras CA1a,CA2a](../CategoricalOperatorAlgebras/README.md)
  supplies the elementary C*-category, dagger tensor and unitary-duality
  interfaces instantiated by A6, independently of normal bimodules and
  planar/module reconstruction.
- Ordinary cellular forms, their simple heads, their Gram-polynomial
  specialization, and their algebraic semisimplicity criterion belong to
  TemperleyLieb Layer5. Here compare those bilinear forms with Hermitian
  forms and use the path/block decomposition for positivity. Affine
  standard modules and their separate winding-parameter classification
  belong to A7 below.

The selected categorical scope is the ordinary TL unitary quotient and its
explicit finite-dimensional Hom spaces. General C*/W* categories, arbitrary
unitary dual functors, Q-systems and categorical realization are separate
operator-algebra developments. Planar algebras, subfactor basic constructions,
index restriction and realization, affine Hecke algebras and their quiver
geometry, modular characteristic-p representation theory, braided TQFT,
and the classification of all unitary annular representations are outside
this roadmap. Algebraic affine simple modules are included; no positivity
is inferred from their bilinear pairings.

[Suggested.lean](Suggested.lean) gives representative target interfaces.
This README is the definitive specification.

## A1. Complex fibers, reflection, and trace interfaces

Consume the ordinary complex diagram algebra and presentation equivalence.
Use TemperleyLieb Layer4's comparison `presentedTLEquiv` between the
native n-strand presentation and the diagram algebra `TLAlg ℂ δ n`, with
its generator and strand-inclusion compatibilities; all transported APIs
commute with this map.
Develop base change in the loop parameter, coefficient-conjugation maps,
identity/composition and generator formulas. For real δ construct the
conjugate-linear adjoint on the analytic synonym by reversing words and
conjugating their coefficients: `freeConj` conjugates coefficients on the
free complex algebra through its monoid-algebra model, `adjointLift`
composes it with Mathlib's word reversal into the opposite algebra, and
`adjoint` is its descent through `RingQuot.lift`, which needs δ real so
that conjugation fixes the relation `e_i²=δe_i`. Prove involutivity,
additivity, reversal of multiplication and conjugate-scalar compatibility. Compare with vertical reflection of diagrams and the
algebraic linear reflection. Prove their commuting-square and involution
identities, including the complex-parameter conjugate-fiber form.

Transport strand inclusions, closure traces and last-strand closure maps
from the diagram category to the native presentation. Include levels zero
and one, where the algebra is ℂ; handle the initial strand inclusion without
truncated-index artifacts. Prove the native spin `markovTrace` agrees with
T_n for every q∈ℂ× realizing its signed loop parameter. Use the algebraic
Markov-trace uniqueness theorem and compare all of its normalization,
traciality and Markov hypotheses. Deduce independence of q, including
q↔q⁻¹. Supply usable evaluation lemmas for basis diagrams, generators,
ordered words, adjoints and inclusions.

For real δ prove `T_n(x†)=conjugate(T_n(x))` and that H_n is Hermitian.
Prove sesquilinearity, symmetry and naturality under inclusions and closure,
with the actual factor δ under inclusion. Define the bilinear trace
radical by `R_n={x:∀y,T_n(xy)=0}`; prove it is a two-sided ideal and is
adjoint invariant. Distinguish it from the cell-form radical, a submodule
of a cell module, and the Jacobson radical of the algebra. Give transport,
quotient and universal factorization APIs for this ideal.

At δ=0 show T_n is zero for n>0 because every closure of a nonempty
matching has at least one loop; T_0 is the identity of ℂ. Thus the
closure form is trivially positive semidefinite at those levels, but it
cannot be normalized to a state. This is an algebraic boundary example,
not a positive-dimensional unitary tensor category. At negative real δ,
T_1(1)=δ already excludes positivity of the unnormalized forms at all
levels. These examples pin the hypothesis δ>0 in the main theorem.

## A2. Cellular and path comparisons

Consume the ordinary cell modules with labels t, `0≤t≤n` and
`t≡n mod2`, dimension
`d_(n,p)=binom(n,p)−binom(n,p−1)` for `p=(n−t)/2`, and link-state
bilinear Gram form. For real δ conjugate the coefficients in its first
argument to obtain the associated Hermitian form. Prove its invariant
identity against the conjugate-linear adjoint. Give matrix/basis
comparisons, radical quotient transport. Neither nondegeneracy nor algebraic semisimplicity
implies Hermitian positivity.

Use the universal Gram polynomial of TemperleyLieb Layer5. In rational
function notation, with p=(n−t)/2, its determinant is

```
det G_(n,t) = Π_(j=1)^p ([t+1+j]/[j])^(d_(n,p−j)).
```

The Gram label t is the number of through strings, exactly as in the
supplier. Ridout–Saint-Aubin's G_(n,p) has p arcs and is this G_(n,n−2p).

The identity to consume is the polynomial identity before specialization,
not a quotient of evaluated zero denominators. Compare the integer-polynomial
recurrence and the diagram Gram matrix; include the anchors
`det G_(2,0)=δ`, `det G_(3,1)=δ²−1`,
`det G_(4,2)=[4]`, `det G_(4,0)=δ²(δ²−1)`.
For δ=0 recover the characteristic-zero semisimplicity parity exception
from that supplier, including the semisimple TL_3 with indefinite cell
form and the nonsemisimple TL_2. There is no claim that the algebra's
Jacobson radical equals a trace radical.

Construct the paths on the half-line graph A_∞ from vertex 0 with steps
±1 and nonnegative heights, and on A_(m−1) with heights 0,…,m−2.
Develop path enumeration by length and endpoint, restriction, extensions,
concatenation and reversal. Consume the half-diagram/path bijection, Jones–Wenzl path/block
idempotents and algebraic matrix-unit multiplication from TemperleyLieb
Layers1,6–7. Compare these path carriers and their inclusion branching.
What this layer adds is the conjugate-adjoint comparison and normalization
in positive-weight regions: use the positive `Real.sqrt` of every positive
quantum-weight ratio in path intertwiners. Prove the resulting matrix
units have conjugate transpose as adjoint, and expose their generator
and inclusion formulas. No arbitrary complex square-root choice sets
the unitary normalization, and no indefinite block is declared positive.

In the positive-weight case prove the decomposition of the n-strand
algebra into matrix blocks indexed by endpoint t, with one basis vector
for each n-step path ending there. Each diagonal minimal projection has
closure trace `[t+1]`; off-diagonal matrix units have trace zero.
Prove the block trace formula
`T_n(x)=Σ_t [t+1] Tr(x_t)`, its value on 1, and the identity
`Σ_t (#paths_(n,t))[t+1]=δ^n`. Expose the branching rule giving the
Markov trace and last-strand closure on these blocks. The root-of-unity
version is the quotient construction in A3, rather than extending
nonzero-denominator matrix units through a singular level.

## A3. Positive Jones quotients and negligible ideals

For δ=2cos(π/m), m≥3, f_(m−1) exists since its construction uses
`[1],…,[m−1]`, and its trace is `[m]=0`. Consume the algebraic
negligible-tensor-ideal generation theorem and compare its components
with the closure-trace radicals R_n. For n<m−1 the ideal is zero.
For n≥m−1 its component is the two-sided ideal generated by the
embedded f_(m−1), equivalently by diagrams with that idempotent as a
subdiagram. Prove these statements commute with strand inclusions,
reflection, horizontal tensoring and last-strand closure.

Use the uniform analytic quotient Q_n fixed above. Develop the
quotient map, representative-independent
product/adjoint/trace, faithful trace, basis reduction and dimension.
Use the relation f_(m−1)=0 to reduce through-string counts, and prove
the surviving path matrix units form a basis indexed by pairs of n-step
paths on A_(m−1) with common endpoint. Show
`Q_n≅⊕_t M_(#paths_(n,t))(ℂ)` as *-algebras and
`dim Q_n=Σ_t (#paths_(n,t))²`. Identify the descended trace with the
positive weighted block trace of A2. Prove compatibility of the ordinary
and root path formulas before the first removed level.

Give the tower branching along adjacent vertices, and prove all Q_n→Q_(n+1)
strand maps injective, including levels zero and one. Establish existence
and uniqueness of normalized trace-preserving conditional expectations
E_n:Q_(n+1)→Q_n by the scaled last-strand closure, with E_nι_n=id,
bimodularity, trace preservation and
the Markov formula `τ_(n+1)(ι_n(x)p_n)=δ⁻²τ_n(x)`.
The n=0 map is the scalar trace; specify it separately from a nonexistent
last generator. Give the algebraic blockwise formula. A5 supplies the
C*-positivity/CP and trace-Hilbert comparisons after installing their norms.

Include the boundary distinction at n=m−1: TL_(m−1) can be semisimple
while its trace radical is nonzero. At δ=1, TL_2 is the semisimple
algebra ℂ⊕ℂ and f_2 is a nonzero trace-null idempotent; Q_2=ℂ.
This is a concrete counterexample to identifying the trace radical with
the Jacobson radical. Cell-form radicals, algebra radicals and tensor
negligibility retain their respective definitions throughout.

## A4. Positivity at every level

For δ>0 prove the equivalence

```
(∀ n≥0, ∀ x∈TL_n(ℂ,δ), T_n(x†x)≥0)
  ↔ δ∈{2cos(π/m): m∈ℕ, m≥3} ∪ [2,∞).
```

All inequalities use the real value of the Hermitian trace. For an
inadmissible 0<δ<2, put θ=arccos(δ/2) and k=⌊π/θ⌋. Prove
that T_n is positive semidefinite exactly when n<k, and positive
definite at each of those levels. The first negative witness is f_k;
its image at every higher level remains negative by the inclusion
trace factor δ>0. For admissible δ the all-level result above applies.
No subfactor, basic construction or II₁ factor is a hypothesis.

For necessity, if 0<δ<2 write δ=2cosθ with 0<θ<π/2. Unless θ=π/m
for an integer m≥3, choose the first negative quantum integer `[k+1]`,
with `[1],…,[k]` strictly positive. The Jones–Wenzl idempotent f_k is
defined and selfadjoint and has `T_k(f_k†f_k)=[k+1]<0`.
Prove the trigonometric sign/first-zero alternatives needed to justify
this choice, including rational θ/π that is not reciprocal to an integer.
Supply the first-bad-level formula and recurrence comparisons.

For sufficiency when δ≥2 prove every `[r]>0` for r≥1 from the
hyperbolic/Laurent formula and at δ=2 from its polynomial limit;
no division by q−q⁻¹ is used at q=1. A2's block
formula makes T_n positive definite for every n, because each weight
is positive and the *-operation is the matrix adjoint. For
δ=2cos(π/m), use A3's trace-descending quotient and paths on A_(m−1).
Their weights `[1],…,[m−1]` are positive and `[m]=0`; the quotient trace
is positive definite and its pullback is positive semidefinite. The preceding positive-quotient construction supplies this root-level
argument and its agreement with the nonsingular initial levels.

Prove the positivity/null-space consequences used elsewhere:
Cauchy–Schwarz for H_n, equality of `{x:H_n(x,x)=0}` and R_n,
ideal and adjoint stability, and nondegeneracy on the quotient. Give the
trace-compatible factorization criterion for *-representations through
that quotient. For compatible *-homomorphisms ρ_n from every AnalyticTL δ n
into tracial *-algebras (B_n,σ_n), if σ_n is positive and
`σ_n∘ρ_n=δ⁻ⁿT_n`, conclude δ is admissible by pullback positivity.
No injectivity of ρ_n is needed. A single low level instead gives
the finite-level condition just stated.

Work out δ=½ at level two, with f_2=1−δ⁻¹e_1 and
`T_2(f_2)=δ²−1<0`; δ=1 and m=3; δ=√2 and m=4;
δ=(1+√5)/2 and m=5; and δ=2. These examples test the loop value,
projection scaling, zero quantum integer and first vanishing trace.

## A5. C*-tower and trace representations

Prove a reusable finite-dimensional lemma: a unital complex *-algebra
with a faithful positive trace becomes a C*-algebra under the operator
norm of left multiplication on its trace Hilbert space. Build the
Hilbert space from its definite sesquilinear form, prove L(x)†=L(x†),
faithfulness from L(x)1=x, boundedness and completeness by finite
dimension, and the C*-identity. Its norm and star agree with every
*-matrix decomposition.

For admissible positive δ apply this lemma to the uniform Q_n,
using the analytic quotient star and its faithful descended trace.
Prove the resulting C*-norm agrees with the positive path/block
representation and is independent of the positive-normalization choices.
Now prove A3's expectations positive and completely positive in these
C*-structures, and identify them with the trace-Hilbert orthogonal
projections. The algebraic closure form supplies the inner product,
and the normalized trace supplies the compatible unit vector; no norm is defined on the
unquotiented trace-null algebra by pretending its form is definite.

Prove the strand maps unital isometric *-homomorphisms and the closure
expectations contractive UCP maps. Consume CStarAlgebras C5's C*-inductive-limit construction to define
B_δ for this system. Prove its TL generator, density and trace
comparison lemmas and identify the path Bratteli diagram using
CStarClassification CL2's AF presentation. Transport cofinal-system
comparisons and the universal property from that supplier, and construct
the induced normalized trace τ. Prove τ is faithful on B_δ,
using the expectations onto stages: they converge pointwise in norm to
the identity, and for positive x with τ(x)=0 each E_n(x) is zero by
faithfulness of its finite-stage trace. Develop these compatible expectations
and their norm-convergence API before using this argument.

Construct `L²(B_δ,τ)`, the inclusions of the stage trace Hilbert spaces,
and their dense union. Compare the GNS representation with the direct
limit of left-multiplication representations and prove its faithfulness.
Use V1 to take its weak closure, extend the trace normally, and compare
the finite-stage expectations, orthogonal projections and generated
normal subalgebras. Prove the expectation onto each stage extends from
B_δ and agrees with trace-Hilbert projection. This is the trace
representation of the TL tower; factor type, subfactor inclusions and
classification require separate theorems.

For negative δ prove the algebraic sign isomorphism
`TL_n(δ)→TL_n(−δ)`, `e_i↦−e_i`, and its conjugate-adjoint compatibility.
Prove the trace relation `T_n^δ(x)=(-1)^nT_n^(−δ)(signMap x)`
from the Markov characterization, and the normalized-trace compatibility.
Thus for δ≠0 the normalized forms are positive at every level exactly
when |δ| is admissible. Compare these finite algebras and their normalized
C*-towers, without claiming that the original negative categorical
dimension defines a unitary spherical TL category: the trace of the
identity of its one-strand object remains negative.

## A6. The unitary TL category

Define a dedicated wrapper category `UnitaryTL_δ`: objects wrap the
ordinary TL object n, and Hom(n,m) is a type synonym of the complex
linear diagram Hom space modulo its negligible subspace. Use this
quotient uniformly; the negligible subspace is zero for δ≥2.
Composition and scalar action descend, and the canonical linear
comparison maps commute with cups, caps and diagram operations.
The wrapper carries its own conjugate-linear dagger. Its End stars
come from that dagger, so TemperleyLieb Layer4's coefficient-fixing End star is
never installed on these Hom synonyms.

Prove the concrete dagger laws `f††=f`, `(f≫g)†=g†≫f†`,
`(c f)†=conjugate(c) f†`, addition and identity compatibility.
To prove positivity of Hom(n,m), bend/rotate its n+m boundary
points to the ordinary End((n+m)/2) diagram pairing when n+m is
even; prove equality of closure-loop pairings and of their trace
radicals. For odd n+m the Hom space is zero. This gives definite
quotient Hom inner products from A4, beyond just End positivity.
For the additive envelope define the trace by the sum of diagonal
closure traces and prove positivity/faithfulness of its End forms
by summing the definite component Hom forms.
Identify each Hom(n,m) with a corner of the positive endomorphism algebra
of n⊕m in the additive envelope. Apply A5's finite-dimensional faithful-trace lemma to that additive
End algebra and restrict its left-regular norm to each corner.
Prove independence of the envelope realization and agreement of
End(n) with Q_n.

Instantiate the native dagger and C*-category interfaces of
[CategoricalOperatorAlgebras CA1a,CA2a](../CategoricalOperatorAlgebras/README.md),
using its finite linking/Hom, tensor and unitary-duality axioms,
independent of its bimodule and realization milestones.
This is a concrete normed dagger tensor category:
prove its C*-category
axioms explicitly, including bounded composition,
`‖f†f‖=‖f‖²`, positivity in each endomorphism algebra and completeness
of every finite-dimensional Hom space. Show tensor product respects
adjoints and is contractive on morphisms, by an explicit *-homomorphism
from the finite-dimensional spatial tensor product of endomorphism
algebras. For admissible positive δ supply the cups/caps and both conjugate
equations. Prove cap is cup† in the prescribed bending convention,
the dual tensorator is unitary and `(f∨)†=(f†)∨`. Identify these
conjugate solutions as CA2a's balanced solutions, including their
sum/subobject transport, and prove their spherical trace is the
given positive closure trace. This constructs the
TL example directly; it does not require a later general categorical
operator-algebra realization theorem.

Transport the algebraic additive/Karoubi envelope through this normed
structure. Compare splitting an arbitrary idempotent with splitting a
selfadjoint projection: prove it is isomorphic to a projection image in
its finite-dimensional C*-endomorphism algebra and construct the
unitary comparison for two projection splittings. Prove finite
biproducts and tensor products preserve the completed Hom spaces and
that duality descends. Compare `Karoubi(Mat_(TL/N))` with the
algebraic supplier's `Karoubi(Mat_(TL))/N` by a monoidal linear
equivalence, then transport its algebraic classifications. Arbitrary
idempotents are not declared selfadjoint.

Consume TemperleyLieb Layer7's simple classification and tensor
decompositions. For δ≥2 the simple objects are the Jones–Wenzl objects X_r, r≥0,
with quantum dimensions `[r+1]` and the untruncated step-two rule
`X_a⊗X_b≅⊕_(c=|a−b|,|a−b|+2,…,a+b) X_c`.
Normalize the intertwiners to make these decompositions unitary. For
δ=2cos(π/m), the simples are X_0,…,X_(m−2), and the range becomes

```
|a−b| ≤ c ≤ min(a+b, 2m−4−a−b),    c≡a+b mod2.
```

Prove all surviving quantum dimensions positive, transport the supplier's
finite fusion-category conditions using the PivotalSpherical vocabulary,
and prove compatibility
with A3's endomorphism blocks and tensor ideals. Give the quantum-dimension
and fusion computations at m=3,4,5. The δ≥2 category has infinitely many
simple objects and is not declared a fusion category.

## A7. Affine diagrams and finite-dimensional standard modules

Construct the affine TL category at each complex loop parameter δ. Its
objects are natural numbers. Morphisms are complex linear combinations of
nonintersecting diagrams on a cylinder, equivalently periodic rectangle
diagrams with marked seams and boundary points. Remove contractible loops
with coefficient δ; retain essential circles and the integral winding of
through strings as diagram data. Specify isotopy relative to the marked
boundaries and prove a discrete normal-form classification of diagrams,
so equality, gluing and winding calculations have actual combinatorial
algorithms. Composition is stacking with the same order as the ordinary
category. Prove associativity, identity and the reflection formulas,
including conjugation to the conjugate-δ fiber. Horizontal juxtaposition
of annuli is not silently declared an ordinary tensor product.

Let ATL_n(δ) be the endomorphism algebra. Give its diagram basis,
through-string filtration, rotation and its inverse for n>0, and the
cap/cup and seam-generator computations. Prove the usual cyclic TL
and rotation-conjugacy relations where their indices make sense, without
using that list as a complete presentation. Treat n=0,1,2 through their
diagram definitions. ATL_0 is the polynomial algebra in an essential
circle; ATL_1 is the Laurent algebra of through-string winding. For n>0
show the winding diagrams give infinite dimension. Give insertion of an
ordinary rectangle into a cut annulus, prove the induced ordinary TL
algebra map injective by its distinct diagram basis, and expose the
restriction of affine modules to it.

Use ℂ throughout the following representation classification. To compare
with Graham–Lehrer fix v∈ℂ× with `δ=−v−v⁻¹`; v is their quantum
parameter, and differs by a sign from the positive-loop q in A1–A6.
For `0≤t≤n`, `n−t` even, and z∈ℂ×, construct W_(t,z)(n) from monic
affine diagrams t→n, meaning every source point goes to a distinct target.
Quotient the right winding action by its character: when t>0 one positive
rotation has value z and negative rotation z⁻¹; when t=0 an essential
circle has value z+z⁻¹. Composition that loses a through string acts by
zero. Construct the left ATL_n action and prove all relations, scalar
compatibility and representative independence. Give a finite standard
basis and `dim W_(t,z)(n)=binom(n,(n−t)/2)`, the seam/winding action
matrices, functorial diagram maps between object sizes and their
composition rules. At t=0 compare z and z⁻¹ explicitly.

Construct the invariant **bilinear** pairing
`W_(t,z)(n)×W_(t,z⁻¹)(n)→ℂ` by gluing reflected monic diagrams,
killing non-monic composites and evaluating the character. Reflection
here fixes coefficients; it does not conjugate them. Develop its adjoint
invariance, Gram matrix, left and right radicals, dual-module comparison
and specialization. Define L_(t,z)(n) as the quotient by the first
radical. Prove it is either zero or absolutely simple and that the
radical is the unique maximal submodule when the head is nonzero.
A bilinear perfect pairing between opposite winding parameters gives
no positive Hilbert-space structure by itself.

Classify the **finite-dimensional** irreducible ATL_n modules by the
nonzero L_(t,z)(n). The label equivalence is `(0,z)∼(0,z⁻¹)`; all other
labels retain z. Remove the class `(0,v)∼(0,v⁻¹)` when v²=−1 and
n>0 is even, where the head is zero. Prove distinct remaining label
classes have inequivalent heads and prove completeness by selecting a
winding eigenvector at the minimal through-string level of an irreducible
module. Include the n=0 polynomial characters and n=1 Laurent characters.
The theorem quantifies over finite-dimensional modules; an
infinite-dimensional algebra does not become finite-dimensional because
its standard modules are.

Develop the explicit intertwiners and decomposition theory over ℂ.
On the valid labels define a parameter order by the reflexive transitive
closure of the elementary successors

```
0≤t<s≤n,  s−t=2k,  ε∈{+1,−1},
z²=v^(εs),   y=z v^(−εk),   (t,z)≼(s,y).
```

Descend through the t=0 label equivalence and prove antisymmetry,
finiteness of the relevant upper sets and invariance under v↔v⁻¹.
Construct the cell maps `W_(s,y)→W_(t,z)` by the explicit standard-diagram
sum of Graham–Lehrer Theorem3.4, including its forest coefficients,
rotation covariance and cap cancellation. Build the forest-polynomial
recurrence and the four diagram cases establishing these identities,
and prove injectivity of the successor maps.

Compute the affine Gram determinant in the finite monic-diagram bases.
Construct the universal matrix over `ℤ[X,Z,Z⁻¹]`, where X is the
contractible-loop value and Z is the right winding character; at t=0
an essential circle evaluates to `Z+Z⁻¹`. Put `m=(n−t)/2` and

```
a_(n,r)=binom(n,(n−r)/2)−binom(n,(n−r)/2−1),
E_(n,r)=binom(n,(n−r)/2),
T_0(X)=2,  T_1(X)=X,  T_(r+1)(X)=X T_r(X)−T_(r−1)(X),
F_r(X,Z)=Z²+Z⁻²−(−1)^r T_r(X).
```

Here a negative lower binomial index means zero. The ordinary cell
multiplicity is a_(n,r); it occurs in the intermediate restriction
blocks. Prove the block triangularization and scalar Gram recurrences,
cancel their quantum-integer factors as rational-function identities,
and then prove the telescoping equality
`Σ_(r≤s≤n, s≡r mod2) a_(n,s)=E_(n,r)`. Thus the **final affine**
exponent is E_(n,r). Transport the diagram bases, seam conventions and
winding character explicitly when using another presentation of the
periodic algebra. A twist parameter weighting individual strand
translations is not identified with Z just by its name.

Prove, before specialization, the Laurent-polynomial identity

```
det G_(t,Z)(n;X) = σ_(n,t) Π_(t<r≤n, r≡t mod2) F_r(X,Z)^E_(n,r),
σ_(n,t)=(−1)^((t+1) Σ_(t<r≤n, r≡t mod2) E_(n,r)).
```

Use matching reflected standard orders on the two bases for this sign.
Each diagonal entry has leading X-term X^m with coefficient one,
and each off-diagonal entry has smaller X-degree. Prove these diagram
facts and `Σ_r r E_(n,r)=m binom(n,m)`; comparison of leading terms
then fixes σ, rather than leaving an unspecified parameter-dependent
unit. For independent row/column permutations give the actual determinant
sign adapter; reciprocal winding rescalings on the opposite-parameter
bases cancel. The empty product for t=n is one, including n=0,1.
At `X=δ=−v−v⁻¹` prove `T_r(δ)=(−1)^r(v^r+v⁻r)`, so the factors become
`z²+z⁻²−v^r−v⁻r` in the quantum convention already fixed above.
The polynomial identity remains valid at singular parameters; do not
evaluate a rational expression with zero denominators.

Include the six-state n=4,t=0 calculation. Writing d for X and
`a=z+z⁻¹`, one compatible simultaneous order has Gram matrix

```
[d², d,  a,  a,  ad, a²]
[d,  d², ad, ad, a,  d ]
[a,  ad, d², a², d,  a ]
[a,  ad, a², d², d,  a ]
[ad, a,  d,  d,  d², ad]
[a², d,  a,  a,  ad, d²].
```

Its determinant is `(d²−a²)^4 ((d²−2)^2−a²)`. At d=3,a=0 it is
321489; the powers are four and one. At d=a=3 the rank is two and
nullity four. Keeping a=3 and substituting d=3+h, its determinant has
leading term `51840 h^4`. These are actual standard-module tests:
for the first take z=i and any nonzero root of `v²+3v+1=0`; for the
second take `z=(3+sqrt(5))/2` and v=−z. Neither is the excluded
zero-head label. Include n=2,t=0, with determinant `d²−a²`, and the
t=n empty-product case as normalization boundaries.

Include n=3,t=1 to pin the winding normalization when t>0. The three
monic states have the defect at position k and an arc on the other two
points. Each diagonal entry is X; the off-diagonal entries form a
three-cycle whose product is the full twist of the single through string
squared, `Z^(±2)`, with reciprocal entries opposite. The determinant is
`X³−3X+Z²+Z⁻²`, which is the formula above with E_(3,3)=1 and
σ_(3,1)=1. In the per-step twist u of Morin-Duchesne–Saint-Aubin, where
a defect moving one position left gains a factor u, the same determinant
reads `X³−3X+u⁶+u⁻⁶`; hence Z=u³ here, and identifying Z with u is wrong.
A model whose cycle product is Z instead of Z² would give `Z+Z⁻¹`.

For the deformation keep z fixed and substitute the independent loop
variable x into this universal polynomial matrix. Work over the discrete
valuation ring `ℂ[x]_(x−δ)`. Its determinant is not the zero polynomial,
so Smith normal form gives specialization nullity at most

```
Σ_(t<r≤n, r≡t mod2) E_(n,r) ord_(x−δ) F_r(x,z).
```

Compute each order in the loop variable. At a root of unity several
factors can vanish together, and a factor can have higher order; sum
the actual valuations with their affine multiplicities. Do not replace
them by the number of distinct vanishing labels. Compare the injected
successor images and their intersections, including coincident factors
and the exceptional zero-head exclusion, with this corrected bound.
Then
use the injective successor maps and induction on the finite parameter
order to determine composition factors. For each valid label establish
`[W_(t,z)]=Σ_((t,z)≼(s,y)) [L_(s,y)]` in the finite-length module
Grothendieck group, with multiplicity one. After this comparison prove
`dim Hom(W_(s,y),W_(t,z))=1` when `(t,z)≼(s,y)` and zero otherwise,
with identity maps included and labels in the nonzero-head domain.
Give explicit radical
filtrations and dimensions of heads; no semisimplicity of ATL_n itself
is inferred from these module formulas. Characteristic-p variants of this
classification and the full affine Hecke interpretation are outside scope.

## Sources and interface evidence

- [TemperleyLieb](../TemperleyLieb/README.md)
  Layers0–7 supplies the ordinary algebraic prerequisites; use its
  quantum-integer, diagram, cellular and tensor-ideal vocabulary.
  Native `TauCeti.Algebra.TemperleyLieb.Basic` and `.MarkovTrace` supply
  the presentation, generator universal property and signed spin trace.
  The [Lean TL discussion](https://leanprover.zulipchat.com/#narrow/stream/610393-Tau%20Ceti/topic/Getting%20started%3A%20roadmaps/near/608535813)
  identifies that existing roadmap; adopt its ownership and the native
  implementation bridges rather than another ordinary TL presentation.
- Penneys, [*Unitary Quantum Symmetries Lite*, Chapter4](https://people.math.osu.edu/penneys.2/UQSL/PartI/UQSLPartIChapter4.pdf),
  §§4.1–4.3 for the positive-loop diagram convention, trace and
  Jones–Wenzl formulas; Theorem4.3.17, printed150, for the necessary
  all-level positivity restriction; §4.4's path multiplication and
  diagonal trace weights, printed154–155; §4.5, printed158–159, for
  the trace-descending root quotient and truncated path basis.
  The sufficiency proof uses the weights `[t+1]` in the stated
  positive-quantum-integer ranges and the positive quotient pullback.
- Ridout–Saint-Aubin, [*Standard Modules, Induction and the Structure of
  the Temperley–Lieb Algebra*](https://arxiv.org/abs/1204.4505),
  Theorem4.7, equation4.20, printed20, for the ordinary Gram determinant
  and its restriction recurrence; Corollary4.8 and Proposition4.9 for
  the critical and zero-loop examples. These are the Gram comparisons
  with the existing algebraic supplier, separate from Hermitian positivity.
- Iohara–Lehrer–Zhang, [*Temperley–Lieb Algebras at Roots of Unity,
  a Fusion Category and the Jones Quotient*](https://math.univ-lyon1.fr/~iohara/Doc/ILZ.pdf),
  §§2–3 for the normalized trace, ordinary cell forms, the Jones–Wenzl
  generator of its radical, and the semisimple/trace-degenerate boundary.
  Its loop is `−(q+q⁻¹)`; apply the explicit sign conversion.
- Chen, [*The Temperley–Lieb categories and skein modules*](https://arxiv.org/abs/1502.06845),
  Theorem2.3.2 for the Jones–Wenzl recursion, Theorems2.4.6 and3.3.5
  for generic multiplicity and tensor decomposition, Theorem4.0.8 for
  algebraic semisimplicity, and §§5.2–5.4, especially Theorems5.4.4–5.4.5,
  for the negligible quotient, truncated range and root semisimplicity.
  The loop convention is `q+q⁻¹`.
- Morin-Duchesne–Saint-Aubin, [*A homomorphism between link and XXZ modules
  over the periodic Temperley–Lieb algebra*](https://arxiv.org/html/1203.4996#S4.SS4),
  Corollary4.2 and Proposition4.3, for the restriction products and their
  telescoping to affine binomial exponents. Their `C_j=cos(jΛ)`,
  `Λ=π−λ`, and loop `−2cosΛ` fix the quantum sign. Construct the
  explicit winding-character/basis comparison before transporting their
  per-translation twist to the module convention in A7.
- Chen–Przytycki, [*The Gram determinant of the type B Temperley–Lieb
  algebra*](https://arxiv.org/html/0802.1083v2#S2), §2, for the
  zero-through-string annular Chebyshev normalization and all-size
  determinant. Use the stated six-diagram comparison for n=4.
- Graham–Lehrer, [*The Representation Theory of Affine Temperley–Lieb
  Algebras*](https://doi.org/10.5169/seals-63902), *L'Enseignement
  Mathématique*44 (1998), 173–218: Definitions2.5–2.6, printed188,
  for diagrams and standard modules; Theorem2.8, printed189–191, for
  finite-dimensional simple heads; Theorem3.4, printed197–201, for
  explicit intertwiners; Corollary4.7, printed211, for the determinant;
  Theorem5.1, printed212–215, for the characteristic-zero homomorphism
  and composition-factor formulas. The later cellular/diagram survey's
  §3 summarizes these targets; the original section proofs supply their
  determinant and successor-map inputs.

For the module identities construct the essentially small abelian
category of finite-dimensional ATL_n-modules, using finite matrix
representations as small models; these modules have finite length.
Consume [GrothendieckEulerForms](../GrothendieckEulerForms/README.md)
and `TauCeti.CategoryTheory.GrothendieckGroup.Abelian` for its K₀.

Use Mathlib's `TwoSidedIdeal`, linear and bilinear maps, matrix algebras,
quotients, `StarRing`, `StarModule`, C*-norms and positive-linear
states. Required
new constructions belong in Tau Ceti. Open upstream work determines API
shape and never postpones a required target or assigns it to Mathlib.
