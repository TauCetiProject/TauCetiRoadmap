# Approximation, deformation and rigidity of finite factors

Build the correspondence and approximation methods used to distinguish finite
von Neumann algebras and recover group actions from their crossed products.
Develop relative amenability, property (T), spectral gap, Haagerup
approximation and intertwining as reusable theories. Prove a concrete
trivial-fundamental-group theorem, Bernoulli strong rigidity, and solidity
and primeness of free group factors with their analytic proof machinery.

## Scope, conventions and dependencies

A tracial von Neumann algebra `(M,τ)` carries a faithful normal tracial
state, with `τ(1)=1`. It need not be a factor. II₁, separable predual,
diffuseness and finite index are additional hypotheses where stated.
Subalgebras are weakly closed; their units agree with the ambient unit
unless a corner projection is displayed. A corner pMp uses trace
`τ_p(x)=τ(x)/τ(p)`. Inner products are conjugate-linear in the first
variable, `‖x‖₂=τ(x*x)^(1/2)`, and `Ad(u)(x)=uxu*`.

An M–N correspondence has commuting normal unital representations of M
and Nᵐᵒᵖ. Write H≺K for weak containment of correspondences, while
`P≺_M Q` denotes intertwining of subalgebras inside M; the two relations
have different carriers. Approximation uses nets unless a separability
or countability hypothesis permits a sequence. All normal CP maps called
subunital/subtracial satisfy `φ(1)≤1` and `τ∘φ≤τ` on positive elements.

- [Subfactors S1–S2](../Subfactors/README.md) supplies normal
  correspondences, Connes fusion, bounded vectors and the factor
  basic construction/dimension APIs. R1–R2 extends the tracial basic
  construction to arbitrary subalgebras of finite algebras as needed
  for relative approximation and intertwining.
- [VonNeumannAlgebras V2–V8](../VonNeumannAlgebras/README.md)
  supplies normality, tracial L², dimension, expectations, group factors
  and normal discrete crossed products. V2 supplies spatial tensors and algebra membership for Borel logarithms;
  V3 supplies type-I structure, V5–V6 center-valued traces, and V11
  measured-relation algebras. V12 supplies tracial ultrapowers
  and central sequences; V13 supplies injectivity, semidiscreteness,
  hypertraces, R, and finite matrix/L² perturbation. This roadmap
  supplies relative approximation and rigidity, not factor classification.
- [CStarAlgebras C3–C5](../CStarAlgebras/README.md) supplies CP maps,
  Stinespring constructions and tensor norms. [HilbertModules H1–H3](../HilbertModules/README.md)
  supplies compact module operators and the C*-correspondence comparison.
- [FreeProbability F3–F4](../FreeProbability/README.md) supplies the
  tracial free-product Hilbert-space decomposition and its expectations;
  R8 and R10 construct the deformations and spectral-gap arguments.
- Mathlib `ContRepresentation` and the native
  `TauCeti.ContRepresentation.IsUnitary` supply bounded unitary actions,
  as in OperatorAlgebraDynamics D1; discrete-group strong continuity
  follows from the discrete topology. R3–R4 builds the group property-(T),
  positive-definite-kernel and Haagerup inputs required below.
- [OperatorAlgebraDynamics D2](../OperatorAlgebraDynamics/README.md) supplies
  the regular-representation P₂ amenability criterion and its squared-vector
  converse to an invariant mean, used for R3's nonamenable spectral gap.
- VonNeumannAlgebras V11 supplies normal trace-preserving expectations
  onto every subalgebra of a finite tracial algebra, including nonfactors.
  R2 builds the general basic construction from that expectation.
- [AmenableGroups, PR #821](https://github.com/TauCetiProject/TauCetiRoadmap/pull/821)
  supplies group invariant means and Følner theory. R2 identifies their
  operator-algebra consequences using V13's injectivity criterion.

Use Mathlib `VonNeumannAlgebra`, `WStarAlgebra`, `StarAlgHom`,
`CompletelyPositiveMap`, opposite algebras, tensor products, unitary groups,
continuous linear maps and orthogonal projections. Normality uses V4's
predual/ultraweak API. Matrix-corner maps retain their corner unit rather
than being called unital maps into a larger ambient algebra.

Measured actions below are countable discrete groups acting on standard
probability spaces. Freeness means essentially free, and ergodicity and
isomorphisms are modulo null sets. R6 uses the countable measured-relation
algebras supplied by V11; its tracial Cartan/orbit comparison and R7's cost
are owned here. Hausdorff topological groupoid C*-algebras remain in
OperatorAlgebraDynamics. General cocycle superrigidity, all possible factor
fundamental groups, general amalgamated-free-product rigidity, and
classification of free group factors are outside scope. The strong-rigidity
class and amplification direction are pinned in R9.

The definitive specification is this README.
[Suggested.lean](Suggested.lean) prototypes selected interfaces.

## R1. Correspondence coefficients and weak containment

Consume S1's normal correspondences, their intertwiners, direct sums,
conjugates and fusion. Construct the joint algebraic representation
`π_H:M⊙Nᵐᵒᵖ→B(H)` by `π_H(x⊗yᵒᵖ)ξ=xξy`.
Develop coefficient functionals, polarization, finite families and their
matrix positivity. For a right bounded vector ξ, construct
`φ_ξ(x)=R_ξ*π_M(x)R_ξ` as a normal CP map into N, with the
explicit bounded-vector identification from S1. Prove the inner-product
formula, norm/subunital and left/right trace criteria, and covariance
under intertwiners and unitary equivalences.

For a normal CP map φ:M→N construct its correspondence from the positive
form on M⊙N, `⟨x⊗a,y⊗b⟩=τ_N(a*φ(x*y)b)`, null quotient and
completion, and its commuting normal actions. Construct the distinguished
bounded vector and recover φ; include degenerate maps and support corners.
Prove functoriality, direct sums, adjoint coefficient comparisons and the
fusion formula for composition: the cyclic subcorrespondence generated
by ξ_φ⊗ξ_ψ represents ψ∘φ; do not identify it with all of the fusion
when that vector is not cyclic. Compare with C4's
Stinespring and H3's interior tensor product after normal completion.

Define H≺K by `‖π_H(z)‖≤‖π_K(z)‖` for every z∈M⊙Nᵐᵒᵖ.
Prove its equivalence with approximation of every finite family of vector
coefficients on every finite coefficient set by finite sums of K-vector
coefficients. Construct the Fell topology and identify its closure under
arbitrary Hilbert direct sums with this relation. Prove reflexivity,
transitivity, equivalence invariance, conjugation, direct-sum and restriction
properties, and preservation under fusion on either side. Define weak
equivalence as mutual containment and distinguish it from unitary equivalence.

For M–M correspondences identify `L²(M)≺H` with pointwise L²
approximation of the identity by sums of bounded-vector coefficient CP
maps, proving the subunital/subtracial normalization rather than discarding
those conditions. Treat nets and their separable sequential version.
Build the identity and coarse correspondences as examples, including
finite-dimensional and abelian cases. Prove the joint representation
extends to the maximal C*-tensor completion. For every tracial M in the
stated nonfactor scope, prove `‖π_coarse(z)‖=‖z‖_min` on M⊙Mᵐᵒᵖ by
the faithful spatial model and C5's minimal tensor norm. Consume V13b's
commuting-representation criterion, transported by the standard opposite
action, to identify R2's ambient amenability/injectivity of M with
`∀z∈M⊙Mᵐᵒᵖ, ‖π_id(z)‖≤‖z‖_min`, equivalently extension of π_id to a
unital star homomorphism `M⊗min Mᵐᵒᵖ→B(L²(M))`, not necessarily
injective. Prove this is precisely the one-way weak containment
`L²(M)≺coarse(M)` already defined above; it does not assert minimal-norm
equality for the identity action or weak equivalence with the coarse one.

For M=ℂ⊕ℂ with τ(a,b)=(a+b)/2, put e=(1,0), f=(0,1) and
z=e⊗fᵐᵒᵖ. Prove ‖z‖_min=1 and π_coarse(z) is a nonzero projection,
whereas π_id(z)ξ=eξf=0 for every ξ∈L²(M). This finite-dimensional
amenable example distinguishes domination from equality. More generally
for a nontrivial central projection e prove the identity action kills
e⊗(1−e)ᵐᵒᵖ. Retain the full general nonfactor and corner theories,
and R2's corrected `p=1,P=M,Q=ℂ` ambient specialization.

## R2. Amenability relative to a subalgebra

For Q⊆M construct the general tracial basic construction
`⟨M,e_Q⟩=(M∪{e_Q})''` on L²(M), its canonical faithful normal
semifinite trace `Tr(xe_Qy)=τ(yx)`, operator-valued weight and finite-trace
ideal. Prove the dense-span, expectation, commutant and corner comparisons.
Identify `L²(⟨M,e_Q⟩,Tr)` with `L²(M)⊗_Q L²(M)` as an
M–M correspondence. This includes Q with diffuse center and infinite
index; the construction is not confined to the II₁ factor case of S2.

Define P⊆pMp amenable relative to Q inside M when there is a P-central
state Ω on `p⟨M,e_Q⟩p` restricting to τ_p on pMp. The state on the
basic construction is not required normal. Prove equivalent criteria by
normal positive functionals and unit vectors in the corresponding L²
space: moments converge to τ_p and each P-unitary commutator converges
to zero. For p=1 prove the correspondence criterion
`_M L²(M)_P ≺ _M(L²(M)⊗_Q L²(M))_P`, with left M action
and restricted right P action. For a corner prove equivalence with
relative amenability of `P⊕ℂ(1−p)` in M, by adjoining the trace
state on the complementary corner and compressing the central state.
Compress both correspondence actions by p to obtain
`L²(pMp)≺pL²(⟨M,e_Q⟩)p` as pMp–P correspondences; prove
the converse by adjoining the complementary summand. Retain the
normalized trace τ_p in its coefficient-map and finite-set/ε criteria.

Prove invariance, expected-subalgebra, corner, amplification and intermediate-
subalgebra permanence with their precise hypotheses. For p=1,P=M,Q=ℂ prove
this is ambient amenability/injectivity of M, equivalently
`_M L²(M)_M` weakly contained in the coarse M–M correspondence;
identify V13's hypertrace and CP
factorizations with R1's coefficients. For Q=M verify relative amenability
of every P. Compare group-subgroup examples with invariant means on cosets,
and show relative amenability does not assert finite index.
For M=L(F₂), P=Q=ℂ1 and p=1, construct the vacuum state on
`⟨M,e_Q⟩=B(L²(M))`: it restricts to τ and is P-central,
although M is nonamenable. This distinguishes the general M–P
criterion from the ambient M–M specialization.

Develop the localization lemma for asymptotically central bounded vectors
in multiples of relative correspondences: a bounded, nonvanishing net,
with uniform left coefficient bound `‖xξ_i‖≤C‖x‖₂` and asymptotic
P-centrality, produces a nonzero projection in Z(P′∩pMp) on which P is
amenable relative to Q. Construct the limiting normal functional, its
support and spectral cuts, the corner state and its normalization.
For Q=ℂ pass from the compressed image Pe to the nonzero central
summand of P given by the kernel of x↦xe, proving this image normally
isomorphic to that summand. Thus a coarse almost-central net contradicts
absence of an amenable direct summand, even when e is in P′ rather
than P.
Prove amenability stable under arbitrary central direct sums,
using the direct-sum CP approximations and central support exhaustion.
Construct the largest z∈Z(P) with Pz amenable, and prove P(1−z)
has no nonzero amenable direct summand. Apply localization on nonzero
corners to obtain the relative-coarse gap alternative; R10 proves
its specific free-product commutant consequence.

## R3. Property (T), spectral gap and fullness

For unitary group representations define almost invariant vectors by
finite-set/ε estimates. Define relative property (T) for H≤Γ by
uniform finite-set control forcing an H-invariant vector, and group
property (T) by H=Γ. Build restriction, induction, finite-index and
quotient properties, Kazhdan pairs, and the projection-to-invariants
quantitative form. Prove the pair `(ℤ²⋊SL₂(ℤ),ℤ²)` has relative
property (T), and the same for `(ℤ²⋊G,ℤ²)` with nonamenable
G≤SL₂(ℤ), using the action on the dual torus, spectral measures and
the projective-line invariant-measure obstruction. Construct the measures
and equivariance used by that argument.

Define relative property (T) of B⊆M by: for each ε>0 there are finite
F⊂M and δ>0 such that every subunital/subtracial CP map φ with
`‖φ(x)−x‖₂<δ` on F satisfies `‖φ(b)−b‖₂<ε` for all b∈B
with ‖b‖≤1. Prove the equivalent correspondence criterion with
left/right tracial, almost M-central unit vectors and a nearby B-central
vector. Develop their trace normalization, perturbation, corner and
finite amplification comparisons. Prove group relative property (T) iff
`L(H)⊆L(Γ)` is relatively rigid. Prove relative rigidity invariant under tracial isomorphisms and
persistent through any trace-compatible unital inclusion M⊆M̃.
For a CP map on M̃ compress it by E_M, apply rigidity in M,
and use the subunital Schwarz/L² contraction estimate
`‖φ̃(b)−b‖₂²≤2‖b‖₂‖E_M(φ̃(b))−b‖₂`.
Thus L(H) is rigid inside a group-measure-space algebra containing L(Γ).
Property (T) of M is this condition
for B=M; do not identify arbitrary relative rigidity with ambient
property (T) or amenability.

For a unitary representation on the orthogonal complement of its invariant
vectors define spectral gap by a finite test set F and C>0 with
`‖ξ‖²≤CΣ_(g∈F)‖ρ(g)ξ−ξ‖²`. Prove equivalence with failure of
weak containment of the trivial representation there. For trace-preserving
actions use the Koopman representation on `L²(M)⊖ℂ1`. Build the
finite-cylinder Hilbert decomposition for infinite-group Bernoulli actions
here (R8 constructs their deformation), and prove spectral gap
for a nonamenable countable group by quasi-regular representations with
finite stabilizers. This is a spectral-gap theorem, not a property-(T)
assertion for every nonamenable group.

For II₁ factors develop the unitary-commutator spectral-gap inequality.
Define fullness by closedness of the inner automorphism group in the
pointwise predual-norm topology. For separable predual prove fullness,
spectral gap, absence of property Γ and trivial bounded central sequences
are equivalent, comparing with V12's ultrapower APIs. Construct the
unitary quotient topology and the lifting/normalization argument needed
for closedness; a statement about central sequences alone does not define
that topology. Consume V12's free-factor commutator estimate and R_ω
computations as examples.

For an inclusion P⊆M distinguish an all-L² spectral-gap inequality from
the weaker unit-ball condition: almost commuting bounded elements are
L²-close to E_(P′∩M). Prove the latter's equivalence with
`P′∩M^ω=(P′∩M)^ω` when P has separable predual and ω is any free ultrafilter on ℕ.
For any expected Q⊆M construct Q^ω⊆M^ω, prove normality and
trace compatibility, and identify `E_(Q^ω)=(E_Q)^ω` on bounded
representatives. Prove its corner, commutant and inclusion comparisons
before applying them to R10's free-product inclusion.

## R4. Haagerup approximation

Define normalized positive-definite group functions, their GNS unitary
representations, conditionally negative-definite kernels, and the
Schoenberg implication `exp(−tψ)` positive definite. Prove matrix/kernel
positivity, products, limits, restriction, zero extension from subgroups,
and the c₀ condition. A discrete group has the Haagerup property when
normalized c₀ positive-definite functions converge pointwise to 1.
Build proper tree-length kernels for finite-rank free groups. For countable
rank use increasing generator weights to make the length proper; ordinary
unweighted length is not proper in that case. Prove the property for
F_n, `2≤n≤∞`, finite groups, subgroups and increasing countable unions.

For `(M,τ)` define Haagerup approximation by normal subunital/subtracial
CP maps converging pointwise in L², whose L² implementers are compact.
Construct those contractions, the compactness criterion, nets/sequences
and their trace-preserving normalization. Prove the subunital Schwarz
inequality `φ(x)*φ(x)≤‖φ(1)‖φ(x*x)` from Stinespring, and the
resulting L² contractivity for subtracial maps; C4's unital statement
alone does not discharge this normalization. Prove invariance under tracial
isomorphisms, expected subalgebras, corners and finite amplification;
use uniqueness of the normalized faithful normal trace on a finite
factor to prove its isomorphism/trace transport.
Prove a countable group has this property iff its group algebra does,
by Fourier-multiplier maps in one direction and their coefficient functions
in the other. For a finite factor, property (T) together with Haagerup
approximation forces finite dimensionality; prove the compactness argument
on orthogonal unitaries, retaining the factor hypothesis.

For the basic construction define I to be the norm-closed ideal generated
by all Murray–von Neumann finite projections, and I₀ the norm-closed two-sided ideal
in the entire basic construction generated by e_B. Prove I₀⊆I and
for every T∈I,ε>0 a projection z∈Z(B) with τ(1−z)≤ε and
`TJzJ∈I₀`. Do not replace the generating multipliers by elements of M
or identify the two ideals for nonfactor B. Distinguish finiteness of a
projection from finiteness of its scalar Tr; prove their comparison
on the central cuts used below. A relative Haagerup
approximation consists of B-bimodular subunital/subtracial normal CP maps
with L² implementers in I, converging pointwise in L². Prove the
equivalent I₀ version by the central cutoffs and compression
`ψ_z(x)=φ(zxz)`. Develop the module-compact/finite-basis comparison
on these central cuts, and permanence for coefficient-corners. R6 adds the Cartan
compression theorem after defining Cartan pairs. For a
trace-preserving action Γ↷B prove `B⋊Γ` has this relative property
with respect to B iff Γ has the Haagerup property. Compare its Fourier
multiplier implementers with the relative compact ideal. Keep relative
Haagerup approximation and relative amenability as distinct properties.

## R5. Intertwining by bimodules

For a nonzero projection f∈M, P⊆fMf and Q⊆M define `P≺_M Q`
by existence of a nonzero P–Q subcorrespondence of fL²(M) with finite
right Q-dimension. Use the general finite-algebra dimension/center-valued
trace extension of V7, constructed here: projections in Q⊗̄B(ℓ²),
commuting with the standard right action JQJ,
the canonical trace and independence of realization. A finite scalar trace need not bound center-valued
module dimension uniformly; construct a nonzero central spectral cut
with a uniform finite bound before choosing a finite matrix realization.
Prove equivalence with a nonzero positive finite-Tr
operator in `P′∩f⟨M,e_Q⟩f`, and with its nonzero finite-Tr support
projection. Provide support truncation and right-bounded spanning-vector
constructions.

Prove the matrix implementation: for some n≥1, q∈M_n(Q) a projection,
normal unital `θ:P→qM_n(Q)q`, and a nonzero partial isometry
`v∈M_(1,n)(fM)` with v*v≤q, one has `xv=vθ(x)` for all x∈P.
Prove the support/commutant relations, assemble θ from module matrix
coefficients, and reconstruct the bimodule from v. Prove the equivalent
single-corner version after cutting P by a nonzero p∈P, with a map
pPp→qQq and corresponding partial isometry v∈pMq, with
`vv*∈(pPp)′∩pMp` and `v*v∈θ(pPp)′∩qMq`.
Neither support is required to equal its corner unit. A general embedding is not
assumed implementable with n=1 before this cut.

Prove `P⋠_M Q` iff there is a net u_i∈U(P) with
`‖E_Q(x*u_i y)‖₂→0` for every x,y∈M. Supply the simultaneous
finite-tuple/ε criterion, and a sequence when M has separable predual.
Prove unitary conjugacy invariance, corner and amplification transport,
expected-subalgebra comparisons and finite-index transfer with their
actual module hypotheses. Do not assert unrestricted transitivity of
intertwining without the necessary finite-module connection.

Prove relative property (T) of P⊆M together with relative Haagerup
approximation of M with respect to Q implies `P≺_M Q`: combine
uniform control on U(P) with a finite relative-compact approximation and
contradict the expectation-vanishing criterion. Develop the quantitative
uniform-closeness criterion: if `0<ε<1/√2` and
`‖x−E_Q(x)‖₂≤ε√τ(f)` for all x∈P with ‖x‖≤1, then
`P≺_M Q`. For f=1 this is the usual unital criterion. Retain the
corner-trace factor in the convex-hull estimates; an absolute ε bound
on an arbitrarily small corner would give a false criterion.
Prove this criterion for every ε<1 by orthogonality of E_Q:
`‖E_Q(u)‖₂²≥(1−ε²)τ(f)` for u∈U(P), contradicting the
vanishing-unitary criterion. In particular retain ε<1/√2 for R10's
source normalization. Supply group-subgroup and
finite-dimensional corner examples and a diffuse free-product
nonintertwining calculation.

## R6. Cartan pairs and measured orbit relations

A Cartan subalgebra A⊆M is maximal abelian with a faithful normal
expectation and normalizer generating M. Construct its normalizer,
partial normalizers and pseudogroup; prove the matrix-corner and
amplification formulas. For Cartan A,B in a II₁ factor prove
`A≺_M B` gives a unitary carrying A onto B, by patching corner
intertwiners with normalizing partial isometries and central supports.
Thus relative rigidity of B and Haagerup approximation relative to A
make the two Cartans unitarily conjugate. The result singles out rigid
Cartans, not every Cartan of every finite factor.

For standard probability spaces define countable p.m.p. Borel equivalence
relations, specializing V11's nonsingular full groups and full pseudogroups, restrictions,
isomorphisms modulo null sets and graphings. Build the counting measure
and L² convolution representation of their untwisted von Neumann
algebras, using V11's measured-groupoid algebra construction. Verify the
faithful normalized trace, diagonal expectation, Cartan inclusion and
factoriality iff ergodic. For a free p.m.p. countable-group action prove
its relation algebra identifies with V8's group-measure-space crossed
product, on both base functions and group generators. Consume V4's
Lusin–Novikov selection theorem and prove the relation is generated
by countably many measurable partial isomorphisms. R6 owns the
normalizer/relation comparison; V11 owns its nonsingular algebra model.

Prove isomorphism of countable p.m.p. relations iff trace-preserving
isomorphism of their canonical untwisted Cartan inclusions, with the
specified probability-space map implementing the diagonal isomorphism.
Construct both the extension from a relation isomorphism and recovery
of the relation from normalizer supports. Deduce orbit equivalence of
free actions iff isomorphism of these Cartan inclusions. This does not
assert action conjugacy from orbit equivalence, or an untwisted
presentation for every abstract Cartan pair.

Construct relation amplification R^t, t>0, by a measure-t restriction
in the finite counting amplification and normalized measure; in the
ergodic atomless case prove independence of the set and finite amplification
chosen. Prove `(L(R),L∞X)^t≃(L(R^t),L∞(X_t))` as trace-preserving
Cartan pairs, on both diagonal functions and relation operators. Prove compression
and amplification invariance of the rigid/relative-Haagerup Cartan
conditions by normalizer patching and the CP/bimodule corner formulas.
These comparisons are needed to use Cartan uniqueness under factor
amplification, not just inside one unamplified factor.

## R7. Cost and a trivial fundamental group

In R7 the base is atomless standard probability; relations are
countable p.m.p., with ergodicity added for amplification invariance.
For a graphing `(φ_i)` define cost `Σ_i μ(domφ_i)` and C(R) as its
infimum over generating graphings, allowing infinity. Develop generation,
refinement, restriction, null-set and relation-isomorphism invariance,
and treeings (acyclic orbit graphs). Prove a treeing minimizes cost, including infinite-cost countable graphings.
Build cycle removal on a positive-measure set by disjoint intermediate
word images. Consume V11's hyperfinite measured relations and finite exhaustions.
Construct compatible p.m.p. cost-minimizing forests/treeings from
these exhaustions,
and prove `C(R)=1−∫_X 1/|[x]_R| dμ(x)` for hyperfinite p.m.p.
relations, with reciprocal infinite class size zero. Prove the
one-generator treeing cost as a specialization. For a hyperfinite
subrelation S⊆R of finite cost, prove graphing extension: a fixed
cost-minimizing treeing of S can be included in graphings of R with
cost arbitrarily close to C(R), by finite-exhaustion forest sliding
and edge replacement. These give the upper bound of the finite-cost free-product formula
`C(R₁*_(R₃)R₂)=C(R₁)+C(R₂)−C(R₃)` when R₃ is hyperfinite
and R₁,R₂ have finite cost. Define the amalgamated measured free product
by the absence of reduced alternating cycles outside R₃, and construct
its generating graphings. The trivial relation gives R₃ of cost zero.
Prove the lower bound by finite-level graphing
unfoldings and colored edge exchange. Use induction for finite treeings;
for a countable treeing and an arbitrary competing countable graphing
Ψ, express the first q treeing edges piecewise by words in a finite
subfamily Ψ_r outside small exceptional sets, with a fixed word-length
bound L. Conversely restrict those r generators to pieces represented
by words in a finite initial treeing Φ_p, discarding measure below
2⁻q/(2Lr) per generator. Track preimages of discarded sets in the
bounded words and add the missed treeing edges; obtain a graphing
inside R_(Φ_p) and a lower bound tending to C(Φ_q), with total error
at most q·2⁻q. Pass to the increasing edge costs, allowing infinity.
These measurable constructions prove treeing minimality without
assuming a finite-cost minimizer for an infinite-cost relation.
For a free p.m.p. F_n action, `2≤n<∞`, the generator treeing has
C(R)=n. Develop the reduced-word and arbitrary-graphing comparisons,
rather than taking its visible n-edge upper bound as equality.

For ergodic atomless countable p.m.p. relations prove the compression
formula `C(R^t)−1=(C(R)−1)/t`, t>0, in the extended-real convention
(infinite cost stays infinite). Construct complete sections and graphing
induction in both directions. For `1<C(R)<∞` deduce its fundamental
group `{t>0:R^t≃R}` is {1}. Infinite cost does not give that conclusion
from this formula.

For a II₁ factor define `F(M)={t>0:M^t≃M}`, using matrix corners
with unnormalized amplification trace t. Prove independence of corner
choice, multiplication and reciprocal laws and compatibility with V7's
corner dimension. For an ergodic relation with Cartan A, assume that for every
0<t≤1 and every isomorphism θ:L(R)→L(R)^t some unitary u
in the target satisfies `uθ(A)u*=A^t`. Under precisely this
Cartan-preservation hypothesis prove `F(L(R))=F(R)`; prove the
inclusion F(R)⊆F(L(R)) without that hypothesis. Under R6's
rigid/relative-Haagerup conditions establish that Cartan preservation,
including the normalization of corner traces.

For a finite-index subgroup `F_n≤SL₂(ℤ)`, `2≤n<∞`, take its natural
action on ℤ² and dual torus action on 𝕋². Prove essential freeness and
ergodicity, ICC of `ℤ²⋊F_n`, and
`L(ℤ²⋊F_n)≃L∞(𝕋²)⋊F_n` by Fourier transform. Use R3's
relative-(T) pair and R4's Haagerup property to prove uniqueness of the
rigid Cartan across amplifications. Apply its orbit cost n and the
compression formula to prove `F(L(ℤ²⋊F_n))={1}`. Construct the subgroup generated by
`[[1,2],[0,1]]` and `[[1,0],[2,1]]`, prove it free of rank 2 and
of index 12 in SL₂(ℤ) by projective-line ping-pong and integer row
reduction, so this gives an actual example. This theorem does not extend the cost
argument to F_∞ or arbitrary nonamenable subgroups without a finite-cost
hypothesis.

## R8. Deformations, mixing and absorption

Define a tracial deformation of M as normal trace-preserving embeddings
α_t:M→M̃, continuous pointwise in L², with α_0 the given inclusion
and a trace-preserving expectation M̃→M. For an s-malleable deformation
use a one-parameter automorphism group of M̃ and a trace-preserving
involution β fixing M pointwise, with `βα_tβ=α_(−t)`. Construct its
CP compression and prove transversality
`‖α_(2t)(x)−x‖₂≤2‖α_t(x)−E_M(α_t(x))‖₂` for x∈M.
Prove continuity on finite sets, relative-(T) uniform convergence on a
rigid unit ball, and extraction of intertwiners between the original
and deformed subalgebras by convex-hull and polar-decomposition methods.
Track supports, corner traces and normalizer extension.

Define mixing and weak mixing by matrix coefficients off the fixed
subspace, and mixing of relative correspondences by finite bounded-vector
coefficients tending to zero on weakly escaping unitaries. Prove the
finite-module and intertwining consequences with their specified
coefficient algebras. For clustering actions construct a dense *-algebra
N⁰ and decreasing subalgebras B_j: each y∈N⁰ eventually has
E_(B_j)y=τ(y)1; its translates lie in B_j outside a finite group set;
and for each g,j some k has σ_g(B_k)⊆B_j. Prove the higher mixing
identities and Fourier support estimates from this data.

For countably infinite Γ and Bernoulli actions `Γ↷(X₀,μ₀)^Γ` over a nontrivial standard probability
base, build finite-cylinder/tail algebras, freeness, ergodicity, mixing
and clustering. Construct an equivariant diffuse-base enlargement for
atomic bases, and an s-malleable doubled Gaussian-coordinate rotation
with time 1 carrying the first copy to the independent second copy.
Prove β's fixed-copy and time-reversal laws and the L² continuity of
infinite tensor products. This is a sub-s-malleable enlargement of the original algebra;
α_t need not preserve that original algebra. For the diagonal
product extension Ã=A⊗̄D prove intertwining into L(Γ) descends
from M̃=Ã⋊Γ to M=A⋊Γ. A net witnessing nonintertwining in M
also witnesses it in M̃: on finite tensor/Fourier expressions its
expectation coefficients acquire bounded factors τ_D(dσ_g(d′));
extend the L² bound by uniformly bounded dense approximation.
Prove the finite-module descent lemma: if P⊆M has no nonzero
corner embedding into the enlarged abelian base and
`Px⊆Σ_(i=1)^n x_iM` for x,x_i in the enlargement, then x∈M.
Use the finite-trace projection onto that right M-module to prove
it is supported on L²(M). Deduce equality of relative commutants.
Use this control on deformed supports, reflection/doubling, finite-trace
corner extraction and a maximal family of orthogonal corner partial
isometries to obtain the absorption unitary inside the original M.
This supplies the arbitrary atomic-base case in R9.

Prove the Bernoulli group-algebra absorption theorem: for a countably
infinite ICC Λ and M=B⋊Λ, a diffuse relatively rigid Q⊆pMp whose
normalizer P generates a factor is unitarily conjugate into the
corresponding corner/amplification of L(Λ), together with P. Use the
sub-malleable factorial-normalizer case of Popa I Theorem 4.4(i);
Q may be abelian. Prove the regular-rigid amplification lemma used here: on a
factor normalizer corner choose a normalized finite matrix
amplification P₀ and construct a diffuse relatively rigid Q₀⊆P₀
whose ambient normalizer generates P₀. Build the corner transfer
of rigidity through finite-set CP estimates and the transfer of
regularity through normalizing partial isometries; retain the ambient
inclusion and its trace normalization. Q₀ is an auxiliary algebra,
not an assumption of property (T) for P₀. Prove the finite
normalizer-module construction of Theorem 4.2 Steps 1–5. Apply the finite-module descent lemma to P,
not to Q: P is II₁ and no nonzero corner of P embeds into the enlarged
abelian base B̃ or a finite matrix algebra over B̃. Run the deformation on Q₀, using the irreducible factor
normalizer to control the support comparisons, not a no-embedding
hypothesis on the original abelian Q. Extract the nonzero
finite-trace basic-construction element, implement its corner map,
and use quasi-regularity to obtain the P₀-corner intertwiner. Control
its supports by P₀'s relative commutant, then extract and patch the
normalizer corner intertwiners in the original crossed product.
Distinguish the separate type-II₁-Q case of Theorem 4.4(ii), whose
Q-level support and maximality argument is not used for abelian Q.

For the source action Γ↷A in R9 prove
`L(Γ)′∩(A⋊Γ)=ℂ` by ICC Fourier coefficients and ergodicity.
Since H is infinite normal, L(H) is diffuse and its normalizer contains
L(Γ). Thus for Q=θ(L(H)), the target normalizer P contains θ(LΓ)
and `P′∩pMp=ℂp`, so P is a II₁ factor and the preceding support
hypotheses hold. This proves the absorption required in R9 without
assuming the source action is ergodic on H.

## R9. Bernoulli strong rigidity

Let Γ be countable ICC with an infinite normal subgroup H for which
(Γ,H) has relative property (T). Let Γ↷(X,μ) be any free ergodic
p.m.p. action on a standard probability space. Let Λ be countably infinite ICC,
and Λ↷(Y,ν) its Bernoulli action over a nontrivial standard probability
base. For `0<t≤1` prove every isomorphism

```
θ:L∞(X)⋊Γ ≃ (L∞(Y)⋊Λ)^t
```

Use canonical group unitaries u_g in the source and v_h in the
target, with `u_g a u_g*=a∘g⁻¹`; require
`Δ∘g=δ(g)∘Δ`. The isomorphism forces t=1, and has form `Ad(u)∘θ^χ∘θ^(Δ,δ)`: δ:Γ≃Λ is a group
isomorphism, Δ:(X,μ)≃(Y,ν) a probability-space isomorphism intertwining
the actions, and χ:Λ→𝕋 a character. Pin
`θ^χ(f)=f`, `θ^χ(v_h)=χ(h)v_h`, and
`θ^(Δ,δ)(a)=a∘Δ⁻¹`, `θ^(Δ,δ)(u_g)=v_(δg)`.
The source action need not be Bernoulli; the hypotheses are asymmetric.

Use R8 to put θ(LΓ) into a corner of LΛ. Build the target ultrapower
algebra of clustering Fourier coefficients, its closure/module/orthogonality
properties and finite-support approximations. Use R5's basic-construction
criterion to recover a corner intertwiner for the Cartan algebras. Prove
the simultaneous Cartan/group-algebra conjugacy criterion: for a clustering
target and an isomorphism onto pMp with p∈LΛ and source group algebra
inside pLΛp, obtain p central, integral reciprocal trace, the finite normal
kernel/character/cocycle data and full group-algebra equality. Establish the
finite-Fourier-support computation first, then remove that condition by
local quantization in the Cartan and controlled finite-support approximation.

Develop the finite normal subgroup and projective-character bookkeeping
needed in that criterion, and prove ICC eliminates the finite kernel,
forcing p=1 and an honest group isomorphism. Prove the same partial
isometry transports the Cartan and the group generators, so the recovered
map is action conjugacy with precisely the character twist above.
No step infers action conjugacy from an abstract group-algebra isomorphism
alone. Use the support and normalizer hypotheses established in R8.
The source theorem references are listed below.

Deduce trivial fundamental group for Bernoulli factors of these groups
by the reciprocal amplification law, and classification of the selected
Bernoulli presentations by group/action conjugacy with the stated inner
and character ambiguity. Supply the example `Γ=ℤ²⋊F_n` from R7 and
prove both its Bernoulli factor and torus-action factor have
fundamental group {1}, by R9 and R7 respectively. This asserts
the proved class of rigidity results, not a universal uniqueness theorem
for group-measure-space decompositions.

## R10. Solidity and primeness of free group factors

For a finite factor define solidity by amenability of A′∩M for every
diffuse A⊆M. Prove equivalence with: P′∩M diffuse implies P amenable.
Use normal expectations and the double-commutant comparison for this
equivalence. Develop invariance under isomorphism, corners and finite
amplification, the hyperfinite example through normal expectation permanence.

For `N=L(F_n)`, `2≤n≤∞`, build the tracial free product N*N and its
s-malleable deformation. Choose bounded self-adjoint logarithms h_i
of the second copy's
generating Haar unitaries v_i; put `α_t(u_i)=exp(it h_i)u_i`,
`α_t(v_i)=v_i`, and `β(v_i)=v_i*`, `β(u_i)=u_i`. Prove β
fixes the first copy and reverses time.
Prove the generator formulas, automorphism/group law and trace continuity;
time 1 gives a new free copy which together with the first generates N*N.
Identify the orthogonal complement
of L²(N) in L²(N*N) as a sum of coarse N–N correspondences using
F4's reduced-word Hilbert decomposition.

Prove the spectral-gap lemma: for P⊆pM₁p with separable predual and no amenable
direct summand in a tracial free product M₁*M₂,
`P′∩p(M₁*M₂)^ωp⊆pM₁^ωp`. Prove the corner form from
the relative-coarse localization estimate, without adjoining an
amenable scalar complement to P. Use R2's relative-coarse localization and
explicit bounded-vector estimates. Prove a diffuse subalgebra of M₁
has no nonzero corner intertwiner into the free M₂, by the reduced-word
expectation-vanishing calculation. These apply without a property-(T)
assumption on P.

To prove N solid, cut a putative nonamenable P with diffuse commutant
to its nonamenable support, use the spectral-gap control of its commutant
to obtain uniform small-time deformation bounds, and apply R5's
`ε<1/√2` criterion. Iterate the resulting intertwiners by the β symmetry
to force a nonzero diffuse corner into the other free copy, contradicting
the preceding nonintertwining lemma. Establish support nonvanishing,
doubling-time estimates and expectation bounds at each iteration.
This is the deformation proof of solidity, with all its analytic inputs;
it does not require a separate C*-boundary/AO library.

Define a prime II₁ factor by absence of an isomorphism with a tensor
product of two diffuse finite factors. Deduce primeness of L(F_n),
`2≤n≤∞`: solidity makes both tensor factors amenable, their product is
amenable, but the group factor is nonamenable. Use V12/V13 for finite
rank and the expected L(F₂) subgroup for countable rank. Prove finite-dimensional tensor factors are allowed by this
definition, since a matrix algebra is not diffuse, and provide
R⊗̄R≃R as a nonprime example. No comparison of L(F_m) with L(F_n)
for distinct ranks is a classification target.

## Sources and API evidence

- Anantharaman–Popa, [*An Introduction to II₁ Factors*](https://www.math.ucla.edu/~popa/Books/IIun.pdf),
  Chapters 12–19: relation/Cartan comparisons 12.2.2–12.2.7;
  correspondence and amenability 13.3.8–13.4.8; relative-(T) 14.2.1–14.2.8;
  spectral gap/fullness 15.1–15.3; Haagerup approximation 16.1–16.3;
  intertwining 17.1.1–17.1.4; rigid Cartans 18.1.1–18.1.5,
  cost/compression 18.2.3,18.3.2–18.3.3; solidity 19.1–19.2.
- Gaboriau, [*Coût des relations d’équivalence et des groupes*](https://doi.org/10.1007/s002229900019),
  Definitions I.1–I.5, Proposition II.6, Lemma II.8, Theorems IV.1/IV.15
  and proofs IV.35–IV.39, for R7's treeing and compression constructions.
- Popa, [*Deformation and rigidity for group actions and von Neumann
  algebras*](https://www.math.ucla.edu/~popa/ICMpopafinal.pdf), §§5–8,
  especially Theorems 5.1,7.1 and8.1, for the tool/result distinctions.
- Popa, [*Strong rigidity of II₁ factors arising from malleable actions
  of w-rigid groups, I*](https://arxiv.org/abs/math/0305306),
  Theorem 0.1, §§2–4, Lemmas 4.3,4.5 and Theorem 4.4(i) in its
  factorial-normalizer ICC case, with the regular-rigid reduction of
  Theorem 4.2, for R8.
  [*Part II*](https://arxiv.org/abs/math/0407103), Definitions 1.1,1.3,
  Theorems 4.2,5.1–5.2, Lemma 6.1 and Theorems 0.7,0.1, for R9's
  clustering, Cartan recovery and simultaneous conjugacy proof route.

The Mathlib concrete/abstract von Neumann and CP map interfaces determine
carrier and morphism choices. Its ordinary representation/intertwiner
APIs do not yet constitute normal Hilbert correspondences or Popa's
criterion. Adopt current upstream designs and implement required missing
interfaces in Tau Ceti. Existing `NumberTheory.HeckeRing`/ordinary
bimodule work concerns algebraic representation theory and supplies no
replacement for relative finite von Neumann dimension.
