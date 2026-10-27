# Classification of AF and purely infinite simple C*-algebras

Develop two classification theories with their construction, existence and
uniqueness results: AF algebras by scaled ordered K₀, and Kirchberg algebras
by KK-equivalence, with the K-theoretic specialization under the UCT.
Build the approximation and intertwining methods, dimension groups,
projection comparison, Cuntz-algebra absorption and homomorphism theory
that make those classification theorems usable.

## Scope, conventions and dependencies

Algebras are complex C*-algebras. AF means a sequential increasing union of
finite-dimensional C*-subalgebras with norm-dense union; the zero algebra
and nonunital algebras are included. A UHF algebra is a nonzero unital
inductive limit of full matrix algebras with unital connecting maps;
finite matrix algebras are included. A Kirchberg algebra means a nonzero,
separable, nuclear, purely infinite simple C*-algebra. Unitality, stability
and the UCT are additional hypotheses, never implicit in that name.
Classification of general nonsimple purely infinite algebras, actions, and
stably finite algebras beyond AF is outside this scope.

Use `NonUnitalCStarAlgebra`, `CStarAlgebra`, `NonUnitalStarAlgHom`,
`StarAlgHom`, `StarAlgEquiv`, `IsStarProjection` and `CStarMatrix`.
Nonunital maps need not preserve an ambient unit. All ideals used as
C*-algebras or quotients are norm closed. Write `K=K(ℓ²(ℕ,ℂ))`,
`Aˢ=A⊗min K` and `M(A)` for the multiplier algebra. Stable means
`A≅Aˢ`; stabilization of a unital algebra is generally nonunital.
All tensor products below are minimal unless specified otherwise.

Use these prerequisite developments:

- [CStarAlgebras](../CStarAlgebras/README.md) C1–C2 for hereditary
  algebras, ideals, corners, multipliers and representations; C5–C9 for
  tensors, inductive limits, nuclearity, exactness, lifting and
  finite-dimensional approximation. Its analytic AF-embedding theorem
  is independent of classification and remains owned there.
- [HilbertModules](../HilbertModules/README.md) H1–H4 for compact module
  operators, stabilization, full corners and Morita equivalence.
- [OperatorKTheory](../OperatorKTheory/README.md) K1–K3 for projections,
  K-groups, continuity, exactness and Bott periodicity; K5–K6 for KK,
  products and semisplit exactness; K9 for asymptotic morphisms,
  E-theory and its universal property; K7–K8 for the Cuntz algebras,
  their K-groups and unit classes, bootstrap membership and the UCT.
  In particular `[1]` generates `K₀(O∞)=ℤ`; it is not zero.
- [OperatorAlgebraDynamics](../OperatorAlgebraDynamics/README.md) D1–D4
  for crossed products and duality, and D6 for finite Cuntz-algebra
  groupoid models and D8 for the CAR algebra. These constructions supply examples and the
  translation crossed-product construction in CL5.
- [VonNeumannAlgebras](../VonNeumannAlgebras/README.md) V0 and V3 for
  faithful Hilbert-space representations and finite-dimensional
  matrix-block decomposition. CStarAlgebras C9 supplies the norm perturbation
  theory; tracial L² perturbation is a different result.

Use `TauCeti.Supernatural` from `TauCeti.NumberTheory.Supernatural`
for UHF invariants, including its positive-natural embedding, divisibility,
prime exponents and lattice operations. Ordered groups use existing
additive-group and order structures, with translation-invariant order;
dimension-group interpolation does not require a lattice order.

The positive cone `K₀(A)⁺` is inherited from OperatorKTheory. It is not
assumed to be a proper cone for arbitrary A. The scale is
`Σ(A)={[p] : p is a projection in A}`, without stabilization in the
definition of the scale. Distinguish it from the positive cone, whose
projections lie in matrix algebras. The unit class is part of a unital
classification invariant. The README is definitive;
[Suggested.lean](Suggested.lean) gives representative interfaces.

## CL1. Finite-dimensional maps and approximate intertwining

Develop point-norm topology on *-homomorphisms and continuity of composition.
Pin `Ad(u)(a)=u a u*`. For maps φ,ψ:A→B, approximate unitary equivalence
means that for every finite F⊂A and ε>0 there is a unitary in M(B)
with `‖uφ(a)u*−ψ(a)‖<ε` on F. For separable A this is equivalent
to a sequence of such unitaries. Also develop the version with unitaries
in the minimal unitization of B, and the unital-target specialization.
State which version a theorem establishes. Asymptotic unitary equivalence
uses a norm-continuous path u:[0,∞)→U(M(B)) and pointwise convergence
as t→∞; it does not require u(0)=1. Requiring that initial value is
a separate stronger relation. Prove equivalence-relation, restriction,
stabilization and transport properties, retaining the hypotheses needed
to extend maps to multiplier algebras. Approximate equivalence preserves
K-theory; do not assert that it always preserves the full KK-class.

Classify *-homomorphisms between finite sums of full matrix algebras by
their nonnegative-integer multiplicity matrices. If the source block
sizes are n_i and target sizes m_j, existence means
`∑ᵢ h_ji n_i≤m_j` for each j, with equality for unital maps.
Prove uniqueness up to unitary conjugacy, composition by matrix
multiplication, and the induced K₀ map in minimal-projection coordinates.
Relate this coordinate map to the matrix-unit realization, including
zero blocks and noninjective connecting maps.

Reuse CStarAlgebras C9's norm stability of finite matrix-unit
relations and conjugacy of nearby exact systems by unitaries close
to 1. Derive finite-dimensional semiprojectivity: a map F→D/J, where
J is the closure of an increasing union of ideals J_n, lifts to D/J_n
for some n. Prove the corresponding finite-stage perturbation result
for maps into an inductive limit. These lemmas supply the passage
from local finite-dimensional approximation to nested subalgebras.

Projection cancellation means that projections p,q,r in finite matrix
algebras over B satisfy `p⊕r∼q⊕r ⇒ p∼q`, with equivalence after
embedding in a common matrix algebra. Develop its equivalent
cancellativity formulation for V(B).
If F is finite-dimensional and B is unital with projection cancellation,
prove every group map `K₀(F)→K₀(B)` sending Σ(F) into Σ(B) is induced
by a *-homomorphism. It is unital when the unit class is preserved.
Two such homomorphisms with equal K₀ maps are unitarily conjugate.
Construct orthogonal representatives for the images of minimal
projections, complete them to matrix units, and account for the
complement of the image unit. Establish the nonunital target version
when the minimal unitization has cancellation, with unitization unitaries
and the actual scale condition.

Extend CStarAlgebras C9's finite-dimensional analytic intertwining
to Elliott's approximate-intertwining theorem for sequential
C*-inductive systems, including noninjective connecting maps. For
`A_n→α_n A_{n+1}` and `B_n→β_n B_{n+1}`, use maps
`φ_n:A_n→B_{n+1}` and `ψ_n:B_n→A_n`. On finite sets F_n⊂A_n,
G_n⊂B_n require `ψ_{n+1}φ_n≈α_n` and `φ_nψ_n≈β_n` with
summable positive errors. Require propagation of the finite sets by
all four maps and that every element of every stage is approximated
after passage to later stages. Construct the limit maps from the
Cauchy sequences of forward images; prove they are inverse, give
the tail-error estimates and identify their K-theory maps. Show how
approximately unitary commuting diagrams can be conjugated into
such a diagram, including the multiplier-extension issues for the
maps in question. In particular, for separable A,B, approximate
unitary inverses φ:A→B and ψ:B→A give an isomorphism approximately
unitarily equivalent to φ.

## CL2. AF structure and classification

Prove the equivalence of the sequential dense-union definition of AF,
being a sequential inductive limit of finite-dimensional C*-algebras,
and, for separable A, approximation of every finite subset to every
positive tolerance inside a finite-dimensional C*-subalgebra. Use CL1
to make the approximating subalgebras nested while including a
previously specified finite-dimensional subalgebra. For unital AF
algebras obtain presentations by unital subalgebras and unital maps.

Develop presentations by Bratteli diagrams: finite vertex sets at each
level, positive vertex sizes and finite edge multiplicities satisfying
the block-size inequalities. Construct the associated inductive
system, compute its K₀ connecting maps, and prove invariance under
telescoping and unitary change of matrix-unit choices. Recover a
diagram from an AF presentation. The diagram is presentation data;
classification uses its scaled ordered-group limit.

Prove AF algebras have real rank zero and stable rank one. Here real
rank zero means finite-spectrum self-adjoint elements are dense in
the self-adjoint part, and stable rank one means invertibles are
dense in the minimal unitization, using A itself when A is unital.
Establish the equivalent projection-approximate-unit characterization
of real rank zero for hereditary subalgebras needed here. Prove
projection cancellation, including its matrix and unitization forms;
projection equivalence is determined by K₀. Show that projections
and their equivalences can be represented at finite stages, and
that equality of their limit K₀ classes holds at a sufficiently late
stage. Deduce K₁(A)=0 and identify the cone and scale as the images
of their finite-stage counterparts.

Prove permanence of AF under closed ideals, quotients, hereditary
subalgebras, finite direct sums, stabilization, sequential inductive
limits and minimal tensor products. Deduce invariance under strong
Morita equivalence for separable algebras. Use projection corners
and CL1's perturbation estimates for hereditary subalgebras, rather
than assuming their intersections with the chosen finite stages are
dense. Compute the diagrams and ordered K₀ maps in these constructions.

Prove the finite-stage factorization lemma for scaled positive maps
from a simplicial group into an AF K₀ limit: finite generators,
positive representatives, scale bounds and finitely many specified
equalities can be realized simultaneously at one sufficiently late
stage. Use it and CL1 to lift an intertwining of scaled K₀ groups
to an intertwining of finite-dimensional C*-algebras.

Establish the existence and uniqueness statements for AF algebras A,B:

- Every group homomorphism α:K₀(A)→K₀(B) with
  α(Σ(A))⊆Σ(B) is induced by a *-homomorphism A→B.
- Two maps A→B induce the same K₀ map iff they are approximately
  unitarily equivalent with unitization unitaries. Prove the
  asymptotic version by joining successive implementing unitaries
  through paths in the relative commutants of finite-dimensional
  image subalgebras in the unitization of B. Prove these commutants
  are AF, including the complementary corner when maps are nonunital,
  and prove that the unitary group of a unital AF algebra is path connected.
- Every scaled-group isomorphism is induced by a *-isomorphism.
  Thus `(K₀(A),K₀(A)⁺,Σ(A))` classifies AF algebras; in the
  unital case replace Σ(A) by `[1_A]`, since Σ(A)=[0,[1_A]].
- The ordered group without a scale classifies stable isomorphism.
  Explain this through Σ(A⊗K)=K₀(A)⁺ and stabilization.

These assert existence of an isomorphism realizing the invariant,
not uniqueness as a literal function. For a map φ:A→B of AF algebras,
prove injectivity iff K₀(φ) sends every nonzero element of Σ(A)
to a nonzero element. Include the correspondence between approximately inner automorphisms and
automorphisms acting trivially on K₀.

## CL3. Dimension groups, scales, traces and UHF algebras

A dimension group is a directed partially ordered abelian group G
which is unperforated (`ng≥0`, n≥1, implies g≥0) and has Riesz
interpolation: if a_i≤b_j for i,j∈{1,2}, there is c between both
lower and both upper bounds. Define positive additive maps, ordered
isomorphisms, order units, and order ideals (directed subgroups
hereditary in the positive cone). Develop cones, quotients by order
ideals, positive direct limits, exactness and the interpolation
decomposition of positive sums. Prove torsion-freeness from
unperforation. Do not impose Archimedeanness or rule out infinitesimals.

Prove the countable Effros–Handelman–Shen theorem: a countable
ordered group is a dimension group iff it is a sequential positive
inductive limit of simplicial groups `(ℤ^r,ℕ^r)`. Supply the finite
positive-factorization construction and the enumeration of elements,
positive elements and relations used to build the system. The maps
between simplicial groups need not be injective. In particular, for
a positive map f:ℤ^r→G and x∈ker f, construct positive maps
`α:ℤ^r→ℤ^s` and `β:ℤ^s→G` with βα=f and α(x)=0.
Iterate this relation-killing factorization for finite sets of
relations, proving it from interpolation and unperforation. The
range theorem does not assume a presentation as extra input.

A scale Σ⊆G⁺ contains zero, is upward directed, is hereditary in
G⁺, and generates G⁺ by finite sums. For interpolation groups prove
the equivalent domination form: each g∈G⁺ is bounded above by a
finite sum of elements of Σ. Establish the scaled range theorem:
every countable dimension group with such a scale is realized by an
AF algebra, uniquely up to isomorphism. Build finite-dimensional
blocks and connecting multiplicities from a simplicial presentation,
choosing their units to realize exactly the prescribed scale.
An order unit u gives the unital scale [0,u]; the full positive cone
gives a stable realization. Include the zero group and zero algebra.

Identify the lattice of closed ideals of an AF algebra with the
order ideals of its K₀ group. Prove the inclusion map identifies
K₀(I) with its ordered image and identify K₀(A/I), including scales.
A nonzero AF algebra is simple iff every nonzero positive element
of K₀ is an order unit. Develop the state space S(G,u) of positive
additive maps G→ℝ carrying u to 1 with pointwise convergence.
For unital AF A prove the trace pairing is an affine homeomorphism
`T(A)≅S(K₀(A),[1])`. Construct traces directly from compatible
finite-stage matrix traces; no quasitrace-to-trace theorem is needed
for this AF result. Establish compact Hausdorff topology and compatibility
with positive unital maps. For simple unital AF algebras identify
the positive cone with zero together with elements strictly positive
on every state. Give a simple dimension-group example with a nonzero
infinitesimal, so agreement of trace values alone need not determine
projection equivalence: use G=ℚ⊕ℤ with positive cone
`{(r,n):r>0}∪{0}` and order unit (1,0), whose unique state is
the first coordinate, and compare (1/2,0) with (1/2,1) in its scale.

For a UHF presentation with matrix sizes dₙ dividing dₙ₊₁, define
its supernatural invariant `ν=⨆ₙ Supernatural.ofNat(d_n)`. Prove
presentation independence and the normalized ordered-group formula
`(K₀(A),K₀(A)⁺,[1])=(Q_ν,Q_ν∩ℚ≥0,1)`, where
`Q_ν={a/b : a∈ℤ, b∈ℕ+, Supernatural.ofNat(b)≤ν}`.
Prove this is an additive subgroup; matrix stabilization coordinates
must send a rank-one projection in M_d to 1/d. Construct a UHF
algebra for every supernatural number and prove Glimm's classification.
Prove unital embedding exists exactly when ν≤μ, tensor products
multiply the invariants, and stable isomorphism is equivalent to
`q Q_ν=Q_μ` for some positive rational q. All UHF algebras are
simple and have a unique trace. Compute finite matrix algebras,
the CAR algebra of type 2^∞, the universal UHF algebra of type
∏p^∞, their tensor products and K-theory. Apply the invariant computation
to Dynamics D8's matrix-limit presentation of CAR(ℓ²(ℕ)) to identify
its scaled ordered K₀ as (ℤ[1/2],ℤ[1/2]≥0,1).

## CL4. Pure infiniteness and projection comparison

For positive a,b∈A define Cuntz subequivalence a≼b by the existence
of x_n∈A with `x_n* b x_n→a` in norm. Develop its reflexivity,
transitivity, cutdown estimates, functoriality and compatibility with
hereditary subalgebras. Define the stabilized relation in A⊗K and
compare finite matrix representatives. For projections prove this is
equivalent to Murray–von Neumann subequivalence: some v has
`v*v=p` and `vv*≤q`. Use the preorder on the positive-element subtype, and
use `AntisymmRel` for mutual subequivalence. It is not the ordinary
spectral order on positive elements. A complete Cuntz-semigroup
classification theory is outside this roadmap.

A projection p is infinite if it is equivalent to a proper
subprojection of itself. It is properly infinite if it contains
two orthogonal subprojections each equivalent to p. Prove the
equivalent matrix formulation `p⊕p≼p`, permanence under equivalence
and suitable corners, and repeated splitting into finitely or
countably many orthogonal equivalent subprojections. Keep nonzeroness
explicit: an infinite projection is nonzero, whereas the displayed
proper-infiniteness relation also holds for zero.

For a nonzero simple A, define pure infiniteness by every nonzero
hereditary C*-subalgebra containing an infinite projection. Prove
equivalence with A≄ℂ and the assertion that for every nonzero
positive a,b there is x with `x*ax=b`; also prove equivalence with
absence of characters together with `b≼a` for every nonzero
positive a and every positive b. Establish real rank zero,
proper infiniteness of every
nonzero projection, and the existence of approximate units of
projections. Prove invariance under nonzero hereditary subalgebras,
full corners, stabilization and strong Morita equivalence, and
permanence under nonzero sequential limits of simple purely infinite
algebras. State nonzeroness of the limit separately when maps may vanish.

Develop the slice lemma: a nonzero hereditary subalgebra D of
A⊗min B contains zz* for some nonzero z with z*z=a⊗b,
a,b positive. Include the positive-element compression and
hereditary-transfer lemmas in its proof. Prove Kirchberg's tensor
criterion: for simple A,B, if A is not stably finite and B is
not type I (HilbertModules H3's irreducible-image definition), then
A⊗min B is simple purely infinite. Supply the
non-type-I matrix-compression construction used with the slice lemma;
handle elementary simple algebras by stabilization. In particular
obtain the tensor permanence results used for O₂ and O∞ absorption.

Prove that full properly infinite projections with the same K₀ class
are equivalent, including stabilization and corner transport. For
purely infinite simple A every K₀ class is represented by a nonzero
projection in A, and two nonzero projections are equivalent iff
their classes agree. Thus K₀(A)⁺=K₀(A); its order is not a partial
order unless the group is zero. A nonzero projection may have class
zero. For unital purely infinite simple A prove
`U(A)/U(A)₀≅K₁(A)`, with a norm-continuous path description of U(A)₀.
Build the projection-splitting and unitary-homotopy lemmas needed
for these assertions. Prove Zhang's dichotomy: a separable purely
infinite simple algebra is either unital or stable.

Use the existing universal models of O_n and O∞. Reuse Dynamics D6's
simplicity of finite O_n, prove their pure infiniteness, and prove
both properties for O∞. Nuclearity and K-theory use the owning
roadmaps. Prove a nonzero projection p admits a unital embedding
O∞→pAp iff p is properly infinite. If p is also full and [p]=0,
construct a unital embedding O₂→pAp. Distinguish an embedding into
the corner from a unital embedding into the original algebra.

## CL5. Sequence algebras, O₂ uniqueness and exact embedding

Reuse CStarAlgebras C5's bounded product ℓ∞(A) and norm-null
ideal c₀(A). Construct `A∞=ℓ∞(A)/c₀(A)`, with diagonal inclusion and
quotient norm `‖[(a_n)]‖=limsup ‖a_n‖`. For a free ultrafilter ω
on ℕ construct `Aω=ℓ∞(A)/{(a_n):limω‖a_n‖=0}` and prove its
ultralimit norm formula. These are norm sequence algebras, distinct
from tracial von Neumann ultrapowers. Develop bounded representatives,
functoriality, relative commutants and diagonal reindexing. Prove
projection lifting and, for unital A, unitary and isometry lifting
in these sequence quotients. Prove Aω is purely infinite simple
when A is unital purely infinite simple, using uniform comparison
estimates rather than only pointwise simplicity.

For separable A and unital B, prove approximate unitary equivalence
of maps into Bω, using its unitaries, can be implemented exactly
there by a single unitary in Bω. Prove the
converse transfer from diagonal maps to finite-set approximate
equivalence in B. Include the lifting and diagonal-choice arguments,
and distinguish an exact map into a quotient from its approximately
multiplicative completely positive representatives.

For unital purely infinite simple B, prove any two unital maps
O₂→B are approximately unitarily equivalent. Develop the bounded
exponential-length and K₁-injectivity inputs: unitaries in U(B)₀
are products of self-adjoint exponentials with a uniform finite
bound on the sum of their norms. For a Cuntz pair t₁,t₂ put
`γ(b)=t₁bt₁*+t₂bt₂*`; prove that for every unitary u and ε>0
there is a unitary v with `‖vγ(v*)−u‖<ε`. Apply it to the
unitary comparing the images of the two generating Cuntz pairs.
Construct asymptotically central unital endomorphisms of O₂ and
prove `O₂⊗O₂≅O₂`, including approximate inner half-flip: the
two factor embeddings O₂→O₂⊗O₂ are approximately unitarily
equivalent. These results precede the classification theorem.

Build the finite-dimensional completely positive comparison tools:
excise a state of a unital purely infinite simple algebra on a
prescribed finite set by a nonzero projection; dilate a u.c.p. map
M_n→B, with B unital properly infinite, to `x↦t*π(x)t` for an
isometry t and a possibly nonunital *-homomorphism π. Use these
to approximate nuclear u.c.p. maps B→B by compressions with
isometries when B is unital purely infinite simple. Combine the operator-space exactness and extension
results of CStarAlgebras with finite-dimensional factorizations:
if A is separable unital exact, φ₁:A→B₁ is a unital embedding,
φ₂:A→B₂ is unital, and B₁,B₂ are separable unital with B₂
nuclear, construct u.c.p. maps η_n:B₁→B₂ such that
`η_nφ₁(a)→φ₂(a)`. Prove its ultraproduct representative version,
retaining finite matrix-level inverse bounds. When B₁=B₂ is a
Kirchberg algebra, obtain the corresponding isometric compressions.

Prove the two-sided isometry-to-unitary comparison lemma: if unital
maps φ,ψ:A→B₀ admit isometries in B₀ giving pointwise compressions
from each map to the other, and O₂ embeds unitally into B∩B₀′,
then they are approximately unitarily equivalent in B. Construct
the comparison projections and Cuntz-pair unitary explicitly.
Deduce that any two unital embeddings of a separable unital exact
A into O₂ are approximately unitarily equivalent; more generally
use B⊗O₂ for B unital Kirchberg, and for B simple separable
unital nuclear using CL4's tensor criterion.

Prove the exact embedding theorem: a separable C*-algebra embeds
into O₂ iff it is exact. For nonzero unital A the embedding can
be unital. For separable unital exact A, prove that a unital embedding
`A→(O₂)∞` with a u.c.p. lift `A→ℓ∞(O₂)` gives a unital embedding
A→O₂ by successive unitary corrections. Develop the quasidiagonal
exact case using CStarAlgebras C8 and C9's cone theorem, then the translation
crossed-product and lifting constructions needed to remove the
quasidiagonality assumption. Retain the exact nonnuclear case;
the Choi–Effros lift for a nuclear domain alone does not prove it.
Build the required liftable sequence-algebra embedding with the
operator-space lifting tools of CStarAlgebras C7–C9. Check injectivity
by norm estimates at every stage and prove the unitalization and
corner reductions.

More precisely, establish the following lifting lemma for separable
unital D,E with D≠0 and a nuclear closed ideal J⊲E. If a unital embedding
φ:D→E/J has the property that its algebraic tensor map extends
continuously to
`D⊗min B(ℓ²)→(E⊗min B(ℓ²))/(J⊗min B(ℓ²))`, then φ has a
u.c.p. lift D→E. For a unital embedding φ the hypothesis D≠0 is
equivalent to J≠E, since φ(1)=1 is then nonzero exactly when E/J≠0.
As a negative control, D=0, E=J=ℂ satisfies every other hypothesis
(the zero map 0→0 is a unital embedding and both tensor quotients
vanish), yet no linear map 0→ℂ sends 1=0 to 1. Build the extension-of-CP-maps argument, using
the tensor-kernel criterion for arbitrary coefficient algebras
and reduction to separable subalgebras. Apply it to the following
crossed-product lifting problem: if D embeds unitally into a
separable unital nuclear E and σ∈Aut(D) is approximately inner
in E, construct the injective covariant map
`D⋊σℤ→C(𝕋)⊗E∞` and a u.c.p. lift into `C(𝕋)⊗ℓ∞(E)`.
Use its separable pullback algebra and nuclear ideal
`C(𝕋)⊗c₀(E)` to apply the lemma. Verify its tensor-continuity
hypothesis explicitly: use Dynamics D2's identification of
`(D⋊σℤ)⊗min B(ℓ²)` with `(D⊗min B(ℓ²))⋊_(σ⊗id)ℤ`,
and the approximately implementing unitaries `u_n⊗1` to construct
the tensor-level covariant map into the corresponding quotient.
Identify it with the algebraic tensor map on generators.

For exact separable unital A take
`D=(C₀(ℝ)⊗A)⁺` with translation by 1. Its quasidiagonality
comes from CStarAlgebras C9's cone theorem; embed D into O₂ and apply the
preceding lifting result using O₂ uniqueness. Identify
`(C₀(ℝ)⊗A)⋊ℤ` with `C(𝕋)⊗K⊗A` by the translation
imprimitivity construction, and locate its copy of A. For the scalar
case construct the Hilbert C(𝕋)-module from C_c(ℝ) with inner
product `⟨f,g⟩(x+ℤ)=∑ₙ overline(f(x+n))g(x+n)`. Identify it
with sections of the ℓ²(ℤ) bundle with shift monodromy, and
trivialize this bundle by a norm-continuous unitary path from 1
to the bilateral shift, obtained from its bounded self-adjoint
logarithm. This identifies its compact operators with C(𝕋)⊗K;
then tensor with A using the trivial action on the coefficient.
The crossed product is exact by Dynamics D2. Embed C(𝕋) unitally
into O₂ using a full-spectrum unitary, and use `O₂⊗O₂≅O₂`
coordinatewise to map `C(𝕋)⊗(O₂)∞` injectively into `(O₂)∞`.
Prove injectivity using exactness of C(𝕋) and the sequence-quotient
norm formula, and transport the u.c.p. lift by the same coordinate maps.
The resulting lift and successive corrections embed the crossed
product in O₂. Finally use equivalence of nonzero projections in
O₂, whose K₀ is zero, to identify the resulting corner with O₂
and obtain a unital embedding of A. This proof uses no
classification theorem from CL7–CL8.

## CL6. Tensor absorption

For every nonzero simple separable unital nuclear A prove
`A⊗O₂≅O₂`. Use CL5's embeddings and uniqueness to construct
approximately inverse maps, and apply CL1's intertwining. Prove
the stable version `A⊗O₂≅O₂⊗K` for stable Kirchberg A.
Nuclearity and simplicity are hypotheses of this absorption theorem;
exactness alone suffices only for CL5's embedding theorem.

Develop central-sequence absorption using the norm ultrapower
`M(A)ω∩A′`, where A embeds diagonally in M(A)ω. For nonzero
separable A and nonzero simple separable unital nuclear D with
approximately inner half-flip, prove a unital embedding
`D→M(A)ω∩A′` implies `A≅A⊗D`. Construct the finite-set
approximately central maps, unitary corrections and intertwining;
justify using multiplier representatives for nonunital A. If D
is isomorphic to its infinite tensor power, prove the converse.
Do not replace half-flip by a claim that the full flip automorphism
is approximately inner without proving that stronger assertion.

Prove the O∞ uniqueness theorem for unital maps into unital purely
infinite simple algebras, up to approximate unitary equivalence. Include
the finite-generator comparison and passage from
finite Cuntz families to O∞. Construct its approximately inner
half-flip and `O∞≅⊗ₙO∞`. Prove that for nonzero separable A,
`A≅A⊗O∞` iff O∞ embeds unitally into `M(A)ω∩A′` for a free
ultrafilter. For nonzero simple separable nuclear A, these are
equivalent to pure infiniteness. Build the central isometries
from pure infiniteness and nuclear approximation; this is an
input to, not a consequence of, classification.

For nonzero separable unital A give the finite-set form: O∞ embeds
unitally into Aω∩A′ iff, for every finite F⊂A and ε>0, A contains
two isometries with orthogonal ranges each commuting with F to within ε.
Prove it by lifting isometries and a diagonal choice, and use CL4's
proper-infiniteness criterion for the unit of Aω∩A′. Deduce that
O∞ absorption passes to unital sequential inductive limits, using
finite-set approximation from a stage. Keep this unital argument
distinct from the multiplier formulation for nonunital A.

Relate tensor absorption to the scalar inclusion ℂ→O∞ and its
KK-equivalence from OperatorKTheory K8. Show tensoring by O∞
preserves the relevant KK classes and composition. This is a
statement about KK, separate from the existence of an algebra
isomorphism. Prove the matrix and full-corner compatibilities
needed to use absorption for stable and unital Kirchberg algebras.

## CL7. Full homomorphisms and KK uniqueness

A *-homomorphism φ:A→B is full when φ(a) generates B as a
closed ideal for every nonzero positive a∈A. For nonzero simple
A and simple B this is equivalent to φ being nonzero. Develop
fullness under composition, corners, tensors, stabilization and
homotopy with the hypotheses each operation requires; an arbitrary
homotopy need not consist of full maps. Separately call φ image-full
when the closed ideal generated by φ(A) is B. Prove pointwise fullness
implies image-fullness for nonzero A, and the converse for simple A.
Develop image-fullness under composition, full corners and stabilization
with their required hypotheses. For stable B use multiplier
isometries s₁,s₂ with orthogonal ranges summing to 1 to define
the Cuntz sum `φ⊕ψ=Ad(s₁)φ+Ad(s₂)ψ`. Prove independence of
the isometries up to the relevant unitary equivalence, associativity,
commutativity, and agreement with addition in KK.

Use OperatorKTheory K9's actual asymptotic morphisms. For unital
simple A and an asymptotic morphism φ:A→B, construct a continuous
projection path q_t for sufficiently large t with `‖q_t−φ_t(1)‖→0`
by functional calculus. Call φ full when q_t is a full projection
in B for some sufficiently large t. Prove independence of the
chosen tail projection and time; continuity makes the projection
paths locally unitarily conjugate. For a separable source containing
a full projection p, define image-fullness of an asymptotic morphism
by the same full-tail-projection condition using φ_t(p), and prove
independence of p. Constant morphisms recover image-fullness of
*-homomorphisms: the ideals generated by φ(p) and φ(A) agree.
For simple sources prove this is also equivalent to pointwise fullness,
so it agrees with the full asymptotic notion just defined. As a negative
control take A=ℂ⊕ℂ, B=ℂ, p=(1,1) and φ(z,w)=z: its constant
asymptotic morphism is image-full, but φ(0,1)=0 prevents pointwise
fullness. As a positive control prove a nonzero map from a nonzero
simple source to a simple target satisfies both notions. Homotopy is an
asymptotic morphism into C([0,1],B), retaining the uniform-in-the-
homotopy-parameter defect estimates. Asymptotic unitary equivalence
means a norm-continuous path of unitaries in the minimal unitization
of the target with
`‖u_t φ_t(a)u_t*−ψ_t(a)‖→0`. Prove Phillips' deformation theorem:
for A nonzero simple separable unital nuclear and D₀ nonzero
separable unital, full asymptotic morphisms `A→K⊗O∞⊗D₀` are homotopic
iff asymptotically unitarily equivalent, and each is asymptotically
unitarily equivalent to a genuine full *-homomorphism. Give the
path constructions and estimates using Cuntz isometries, the
O₂ shift homotopy, and absorption. The replacement of an
asymptotic morphism by a homomorphism is a proved result here,
not part of the definition of an asymptotic morphism. Use K9's
reparameterization to pass between time intervals [1,∞) and [0,∞).
The asymptotic unitary equivalences in the following homomorphism
theorems also use target-unitization unitaries.

For such A and separable unital D, form the Cuntz-sum group of
full homomorphisms `A→K⊗O∞⊗D` modulo path-asymptotic unitary
equivalence. Construct its zero from a full map factoring through
O₂, and its inverses using the suspension/Bott construction.
For nonunital D extend the functor by the kernel of its value on
`D⁺→ℂ`. Prove homotopy invariance, stability and half-exactness
using quasicentral approximate units and the path-quotient
construction. Compare with the KK/E universal properties from
OperatorKTheory K6 and K9: construct the map on cycles and its
inverse, show homotopies and degenerate cycles are respected,
and identify the scalar-to-O∞ KK-equivalence. Prove the natural
identification with KK(A,D), with addition as Cuntz sum and
Kasparov product as composition in the stabilized picture.
This supplies the existence theorem as well as uniqueness.

Deduce the following precise homomorphism theorem. If A is nonzero
simple separable unital nuclear and B is nonzero separable unital
with B≅B⊗O∞, every x∈KK(A,B) is represented by a full map
A→B⊗K. Two full such maps have the same KK-class iff they
are homotopic iff they are asymptotically unitarily equivalent.
Prove the stable-domain version for maps between stabilized
Kirchberg algebras, using full corners and the compatible product.
For unital Kirchberg A,B, obtain a unital representative exactly
when x_*([1_A])=[1_B]. Compress the stabilized image unit using
CL4's nonzero projection classification; prove the compression
preserves its KK-class.

For the isomorphism construction, strengthen CL1's intertwining
to retain a chosen KK-class. Use the continuous implementing
paths to make the corrections through compatible homotopies
on increasing finite sets, and prove the limit isomorphism is
homotopic to the chosen initial stabilized map. Point-norm
convergence by itself does not imply eventual equality of
KK-classes. Include the uniform tail estimates for the homotopies
and inverse maps that supply this stronger conclusion.

## CL8. Classification, invariant range and examples

Prove Kirchberg–Phillips classification with realization of the
specified invariant:

- For stable Kirchberg algebras A,B, an invertible x∈KK(A,B)
  is induced by a *-isomorphism A→B. Conversely any isomorphism
  induces an invertible KK-class.
- For unital Kirchberg algebras, the same conclusion holds
  exactly for invertible classes satisfying x_*([1_A])=[1_B].
- For Kirchberg algebras in the bootstrap UCT class, stable
  isomorphism is equivalent to an isomorphism of the graded
  groups (K₀,K₁), with every specified group isomorphism realized.
  In the unital case retain [1] in the invariant and require
  its preservation. Apply OperatorKTheory K8's product-compatible
  lifting of a K-theory isomorphism to a KK-equivalence.

Use the unital-or-stable dichotomy for the remaining separable
nonunital case. Prove that for stable Kirchberg A the map
`Aut(A)→KK(A,A)ˣ` is surjective and its kernel is the
automorphisms asymptotically unitarily equivalent to the identity.
For unital A its image is the subgroup preserving [1]. Do not
replace that kernel by approximately inner automorphisms.

Build the range theorem without assuming a classification of AT
algebras. First construct separable nuclear bootstrap algebras with
arbitrary prescribed countable graded K-groups. Use OperatorKTheory
K8's countable free resolutions `0→P₁→P₀→G→0`. Realize the integer matrix
P₁→P₀ on K₁ by *-homomorphisms between stabilized c₀ sums of
C₀(ℝ), using circle maps of signed degree and orthogonal matrix
blocks. Column finiteness and c₀ convergence must give a bounded
*-homomorphism, including infinite-rank resolutions. The mapping
cone then has K₀=G and K₁=0 by the six-term exact sequence.
Combine this construction and its suspension to obtain
K₀=G₀, K₁=G₁, with the chosen identifications.
For separable nuclear A prove equivalence of bootstrap membership
with OperatorKTheory K8's UCT condition: for every separable D and
both degrees the K-theory action γ is surjective and its canonical
kernel-to-Ext map κ is an isomorphism. Choose a bootstrap realization
B of K_*(A), and use the UCT for B to lift the chosen K-isomorphism
to y∈KK(B,A). By the naturality of γ and κ under Kasparov products,
precomposition by y gives isomorphisms on the outside terms of the
UCT short exact sequences, hence on KK_i(−,D). Construct a left and
right inverse for y by taking D=B and D=A. Thus A is KK-equivalent
to B and belongs to the bootstrap class; the converse is K8's UCT.

Construct a Kirchberg algebra KK-equivalent to any separable
nuclear A, as follows. For nonzero A let I=A⊗K, choose a
unital copy of O₂ in M(I), and form E=I+O₂. Verify that the
quotient copy is injective and obtain a separable unital nuclear
split extension `0→I→E→O₂→0`. Since O₂ is KK-contractible,
I→E is a KK-equivalence, and [1_E]=0. For A=0 use E=O₂.
Set B=E⊗O∞. Obtain a unital full endomorphism θ of B factoring
through O₂ using CL5; its KK-class is zero. With a unital
Cuntz pair in B, form the injective unital endomorphism
`φ(b)=s₁bs₁*+s₂θ(b)s₂*`. Prove KK(φ)=1 and that every
nonzero positive element has full image. The sequential limit
is simple, separable and nuclear. Prove O∞ absorption passes
to this limit using CL6's finite-set central-sequence criterion,
and hence that the limit is a Kirchberg algebra.

Supply the KK argument for the limit: build the mapping telescope
and its semisplit exact sequence for injective sequential systems
of separable nuclear algebras. Use OperatorKTheory K5's countable
additivity to obtain the product groups in the telescope argument.
For a limit L=lim B_n and separable D derive the contravariant Milnor sequence
`0→lim¹ KK₁(B_n,D)→KK₀(L,D)→lim KK₀(B_n,D)→0`,
and its degree-shifted counterpart.
Consume [AlgebraicTopology Stage 6.0](../AlgebraicTopology/README.md)'s generic
countable inverse-system lim¹, the cokernel of `1−shift` on the product,
and its functoriality/constant-tower vanishing. The KK telescope and its
contravariant Milnor sequence are the specific targets here. For the preceding
KK-identity system the bonding maps are identity in both degrees;
prove the odd-degree lim¹ vanishes and the limit map
induces isomorphisms on KK(−,D) for each separable D. Use
the KK-category Yoneda argument to conclude it is a
KK-equivalence. Do not substitute ordinary continuity of KK.

Apply this construction to the bootstrap realizations of G₀,G₁,
and prove bootstrap membership is preserved by the construction.
Stabilizing gives every pair of countable abelian groups as the
K-groups of a stable UCT Kirchberg algebra. For an arbitrary
g∈G₀, choose a nonzero projection with that class in the stable
realization and pass to its full corner. This realizes exactly
`(G₀,g,G₁)` by a unital UCT Kirchberg algebra, including g=0.
Transport the K-groups and unit class through the corner
equivalence, and combine with classification for uniqueness.

Compute the classifications of the finite Cuntz algebras, O∞,
their matrix algebras, stabilizations and tensor products using
OperatorKTheory's Künneth sequence and unit classes. In particular,
O₂ is the unique unital UCT Kirchberg algebra with zero K-groups;
O∞ has invariant (ℤ,1,0). Show for finite n≥2 that
`M_k(O_n)≅M_l(O_n)` iff
`gcd(k,n−1)=gcd(l,n−1)`, for positive k,l. Explain how the
unit class distinguishes these unital algebras even when their
stabilizations agree. Relate full corners and strong Morita
equivalence to the stable classification. These examples use the
UCT for their verified bootstrap models; no assertion that every
nuclear C*-algebra satisfies the UCT is a target.

## Sources and API alignment

- Rørdam, Part I of Rørdam–Størmer, *Classification of Nuclear
  C*-Algebras. Entropy in Operator Algebras*: §§1.2–1.5 for AF
  structure, Theorem 1.3.3 and Proposition 1.3.4 for classification
  and maps, Theorem 1.4.4 and Proposition 1.4.5 for dimension
  groups and scales, and §2.3 for approximate intertwining.
  §§4.1–4.2 give pure infiniteness, corners and Cuntz models;
  Chapters 5–6 give O₂ uniqueness and embedding; Chapter 7
  gives tensor absorption; §§8.2–8.4 give KK representation,
  classification and the Kirchberg-model construction. Keep the
  approximate and path-asymptotic equivalences of Definition
  1.1.15 distinct when using those statements.
- Blackadar, *K-Theory for Operator Algebras*, Chapter 7,
  especially Theorems 7.3.2 and 7.4.1, for finite-stage lifting,
  AF classification and dimension groups; §§21.3 and 21.5,
  especially Theorem 21.5.2, for the mapping-telescope and
  contravariant KK Milnor sequence. CL8 uses its nuclear,
  injective-system specialization.
- [Goodearl–Wehrung, *Representations of distributive semilattices
  in ideal lattices of various algebraic structures*](https://arxiv.org/abs/math/0011083),
  §3, especially Theorem 3.3 and its Triangle Lemma, for positive
  simplicial factorization and the direct-limit representation.
- [Kirchberg–Phillips, *Embedding of exact C*-algebras in the
  Cuntz algebra O₂*](https://arxiv.org/abs/funct-an/9712002),
  Lemmas 2.2–2.7 and Theorem 2.8: liftable sequence-algebra
  embeddings, the tensor criterion for lifting and the translation
  crossed-product proof of exact embedding.
- [Phillips, *A classification theorem for nuclear purely infinite
  simple C*-algebras*](https://ems.press/journals/dm/articles/8965006),
  Theorem 2.3.7 and Corollary 2.3.10 for full asymptotic morphisms;
  Theorems 4.1.1 and 4.1.3 for the homomorphism picture of KK;
  Theorem 4.2.1 and Corollary 4.2.2 for realizing prescribed
  invertible KK-classes; Theorem 4.2.4 for UCT classification.

Reuse Mathlib's matrix order, continuous functional calculus,
unitary-group topology, star homomorphisms, algebraic direct limits
and ordered additive groups. Use `IsDirected`, `DirectedOn` and
`AntisymmRel` with the actual relation rather than introducing a
second order notation. The
[Cuntz-comparison discussion](https://leanprover.zulipchat.com/#narrow/channel/287929-mathlib4/topic/Notation.20for.20AntisymmRel/with/488146684)
explains why ordinary positivity and Cuntz comparison must remain
separate relations. The
[UHF and direct-limit discussion](https://leanprover.zulipchat.com/#narrow/stream/113489-new%20members/topic/Early%20feedback%20on%20approach%20towards%20formalizing%20UHF%20algebras%3F)
develops star-algebra structure over Mathlib's existing algebraic
`DirectLimit` and matrix amplification maps. Follow that design
for the inductive-limit inputs owned by CStarAlgebras C5; account
for the limiting seminorm and completion when connecting maps
are not injective. Use `CStarMatrix` for the resulting C*-norms.

Build on Mathlib's C*-class hierarchy
(`NonUnitalCStarAlgebra`, `CStarAlgebra`) and on its continuous
functional calculus, restricted to closed ideals where needed. The existing
`TauCeti.Supernatural` implementation supplies UHF invariant
arithmetic. Develop the missing classification mathematics in
Tau Ceti with these interfaces, replacing it by Mathlib imports
when corresponding implementations become available.
