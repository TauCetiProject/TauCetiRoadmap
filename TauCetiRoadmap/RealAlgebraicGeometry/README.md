# Real algebraic geometry: sign determination and cylindrical decomposition

This roadmap develops the real algebra of polynomial signs and the geometry of
polynomial roots in families, culminating in a sign-invariant cylindrical
algebraic decomposition (CAD) and quantifier elimination. It also develops the
order-invariant projection theorem of McCallum and valuation-invariant lifting
for Lazard's projection. These are successive milestones of one library.

The foundations construct an algebraic ordered real closure of every ordered
field, and the univariate algebra is over an arbitrary real closed field. The topological
and CAD milestones are over `ℝ`, with complex roots in `ℂ`. This is a definite
scope choice: order-topological connectedness is not the right connectedness
notion over a general real closed field. No theorem here asserts that intervals
in every real closed field are topologically connected.

Suggested homes are `TauCeti/FieldTheory/RealClosure/`,
`TauCeti/Algebra/Polynomial/Sturm/`,
`TauCeti/RingTheory/Polynomial/Subresultant/`, and
`TauCeti/Geometry/RealAlgebraic/`. Every definition needs its basic API:
extensionality, degenerate cases, restriction and transport laws, and the
operations and characterizations specified below. `Suggested.lean` gives
selected target signatures; this README is the specification.

## Vocabulary, boundaries, and existing material

Use `Polynomial R`, `MvPolynomial (Fin n) R`, `Polynomial.resultant`,
`Polynomial.discr`, `Polynomial.rootMultiplicity`, and `IsRealClosed R`.
The latter is Mathlib's field property, not an ordering or topology; ordered
algebraic statements carry `[Field R] [LinearOrder R] [IsStrictOrderedRing R]
[IsRealClosed R]`. Root counts count **distinct** roots unless multiplicities
are expressly included. Zero polynomials have infinitely many zeros and must
be treated separately, never by reading their empty `Polynomial.roots` list
as the zero set.

* [Mathlib's real closed field API](https://github.com/leanprover-community/mathlib4/blob/master/Mathlib/FieldTheory/IsRealClosed/Basic.lean)
  supplies squares and odd-degree roots. Deriving polynomial IVT and Rolle
  from this definition is work in Layer 1. Include the `IsRealClosed ℝ`
  instance, proved from Mathlib's real analysis, as a specialization bridge.
  Layer 1 also constructs algebraic ordered real closures, using
  `AlgebraicClosure`, `IntermediateField`, `RingPreordering`, and
  `Algebra.IsAlgebraic`; a supplied real closed field is not an existence theorem.
  Follow the [Real Closed Fields Project discussion](https://leanprover.zulipchat.com/#narrow/channel/287929-mathlib4/topic/Real.20Closed.20Fields.20Project)
  and [Mathlib PR #41911](https://github.com/leanprover-community/mathlib4/pull/41911)
  for the real-algebra interfaces, including `isRealClosed_of_isAlgClosed_adjoin`.
  That PR concerns the Artin–Schreier characterization by finite algebraic
  closure. Ordered real-closure existence is a separate target here.
  Develop the missing extension theory here and adopt imported results
  when available.
* [The resultant API](https://github.com/leanprover-community/mathlib4/blob/master/Mathlib/RingTheory/Polynomial/Resultant/Basic.lean)
  takes explicit degree bounds with actual degrees as defaults. Its
  coefficient-map theorem preserves those bounds. Use it directly; do not
  confuse specialization of a determinant with recomputation at smaller degrees.
* [Tau Ceti's discriminant API](https://github.com/TauCetiProject/TauCeti/blob/main/TauCeti/RingTheory/Polynomial/Resultant/Discriminant.lean)
  already provides `Polynomial.discr_map_of_natDegree_eq`,
  `Polynomial.Monic.discr_mul`, `Polynomial.Monic.discr_eq_prod_roots_sub_sq`,
  and `Polynomial.Monic.discr_ne_zero_iff`. Import these results. The prototype
  `fiber_discr` checks specialization against the existing API. Unlike
  `Polynomial.resultant`, `Polynomial.discr` has no explicit degree bounds:
  take it at the formal degree before specialization, and use the
  degree-preserving map theorem when comparing to the fiber discriminant.
* [Polynomial root approximation](https://github.com/leanprover-community/mathlib4/blob/master/Mathlib/Analysis/Normed/Field/Approximation.lean)
  already includes `Polynomial.exists_roots_norm_sub_lt_of_norm_coeff_sub_lt`.
  For monic polynomials of the same degree, with the comparison polynomial
  split, it bounds the distance from a root to a nearby comparison root in
  terms of coefficient differences. It does not count the multiplicities
  inside a disc or supply a bijection between root multisets. Layer 4 extends
  this API; it does not redevelop its existing conclusion.
* Import `List.signVariations` from
  [Mathlib's rule of signs file](https://github.com/leanprover-community/mathlib4/blob/master/Mathlib/Algebra/Polynomial/RuleOfSigns.lean);
  it is already in the pinned Mathlib. Follow
  [Mathlib PR #43954](https://github.com/leanprover-community/mathlib4/pull/43954)
  for `Polynomial.sturmSeq`, part of the Sturm–Tarski development by
  Tomaz Mascarenhas, Pedro Saccomani, and Sarah Pereira. Build any missing
  pieces here with those interfaces, and replace them by imports when available.
* The public [Zulip discussion of semialgebraic sets](https://leanprover.zulipchat.com/#narrow/channel/217875-Is-there-code-for-X.3F/topic/Semialgebraic.20Sets)
  points to [lean-omin](https://github.com/rwbarton/lean-omin) and work on
  real closed fields and o-minimality. Use finite Boolean combinations of
  polynomial equalities and strict inequalities as the intrinsic definition;
  closure under projection is a theorem in Layer 6, not a defining closure
  operation. General o-minimal structures, triangulation, real spectra,
  Positivstellensätze, and semialgebraic homology are outside this roadmap.

No dependence on another roadmap is required. The analytic tools specified in
Layer 7 are part of this roadmap to the exact extent used by Layers 7–8.
This is a mathematical library, not a specification of an external solver,
certificate format, tactic, or performance benchmark.

## Conventions and dependency order

A polynomial family in one distinguished variable is
`Polynomial (MvPolynomial (Fin n) ℝ)`. Specialization maps its coefficients by
`MvPolynomial.eval₂Hom (RingHom.id ℝ) x`. Use `MvPolynomial.finSuccEquiv` to
pass from multivariate polynomials to this carrier. The equivalence singles
out coordinate `0`; `Fin.cons t x` reconstructs a point of the cylinder.
Other elimination orders use variable permutations, with evaluation
compatibility proved once. Integer input is mapped by `Int.castRingHom ℝ`
before this equivalence. Define `cylinder S : S × ℝ → (Fin (n+1) → ℝ)` by
`cylinder S (x,t) = Fin.cons t x.val`. Prove its injectivity, continuity,
and topological embedding property. Ambient stack cells are its images;
transport connectedness through this map and prove their semialgebraicity
by the explicit formulas of Layer 3.

A sign is a `SignType`. Sign-invariance means equality of signs at every pair
of points, including sign zero. Variation deletes zeros before counting sign
changes. Counts are natural numbers; differences of counts and Tarski queries
are integers. The Tarski query of `q` at the zeros of nonzero `p` is

```
TaQ(q,p) = #{x : p(x)=0 and q(x)>0} - #{x : p(x)=0 and q(x)<0}.
```

The Lean function is `tarskiQuery p q`: its first argument supplies the roots,
and its second supplies the queried signs.

The development order is:

| Layer | Content | Inputs |
| --- | --- | --- |
| 1 | Ordered real-closure existence, real closed algebra, Sturm–Tarski, Thom encodings | Mathlib algebra |
| 2 | Subresultants and specialization | Mathlib determinants and polynomial division |
| 3 | BKR sign determination and semialgebraic syntax | 1, 2 |
| 4 | Multiplicity-sensitive root continuity and common root matching | 1, 2, Mathlib root approximation and topology |
| 5 | Collins delineability, sections, and sectors | 2–4 |
| 6 | CAD existence and quantifier elimination | 3, 5 |
| 7 | Analytic preparation and McCallum projection | 2, 4–6, Mathlib analysis |
| 8 | Lazard valuations, evaluation, and projection | 2, 5–7 |

## Layer 1: univariate real algebra

### Ordered real-closure existence

For every `K : Type u` with `[Field K] [LinearOrder K]
[IsStrictOrderedRing K]`, construct `R : Type u` with field and compatible
linear order instances, `IsRealClosed R`, and a field embedding
`ι : K →+* R` satisfying `StrictMono ι`. Require `Algebra.IsAlgebraic K R`
under the explicit instance `letI : Algebra K R := ι.toAlgebra`.
The checked target is `exists_realClosure` in `Suggested.lean`.
No countability, Archimedean, or embedding-into-`ℝ` hypothesis is imposed;
the construction is uniform in `K`.

Develop the prerequisite ordered extension theory in
`TauCeti/FieldTheory/RealClosure/`. Use Mathlib's `RingPreordering` with
`RingPreordering.IsOrdering` to express orderings, and develop restriction
and transport along field embeddings. Connect these to `RingCone`, whose
`AddGroupConeClass` instance supplies `eq_zero_of_mem_of_neg_mem`, then use the existing
`LinearOrder.mkOfAddGroupCone` and `IsOrderedRing.mkOfCone` constructors
to obtain compatible linear orders. Prove the following extension results:

* For a field preordering `P` and `-a ∉ P`, the subsemiring generated by
  `P ∪ {a}` excludes `-1` and is a preordering. Deduce by Zorn that every
  field preordering is contained in an ordering.
* For an ordered `K` and a finite field extension `L/K` of odd degree,
  the subsemiring of finite sums `Σ i, ι(cᵢ) * xᵢ²` with `0 ≤ cᵢ`
  excludes `-1`, so it is a preordering. Prove this by algebraic degree
  descent. Extending that preordering gives an order on `L` restricting
  to the specified order on `K`.
* For `a > 0` nonsquare in `K`, prove the same properness in the quadratic
  extension obtained by adjoining a root of `X² - a`. Deduce an ordered
  extension containing a square root of `a`; the square case already has
  such a root in `K`.

Inside `AlgebraicClosure K`, order intermediate fields equipped with an
extension of the given order by inclusion and agreement of orders. Prove
that nonempty chains have upper bounds with a well-defined union order,
and apply Zorn's lemma. Show that a maximal such ordered algebraic extension
has square roots of nonnegative elements and roots of odd-degree polynomials:
use the preceding extension results, an odd-degree irreducible factor, and
the embedding of algebraic extensions into the algebraic closure. Deduce
`IsRealClosed` via `IsRealClosed.of_linearOrderedField`. Track the algebra
maps and algebraicity through subextensions and towers, and retain the
universe of `K` by taking a subtype of `AlgebraicClosure K`.

For a strictly monotone ring homomorphism between ordered fields, use
`RingHom.injective`, `StrictMono.lt_iff_lt`, and
`RingHom.algebraMap_toAlgebra` for injectivity, order reflection, and the
induced algebra map. Develop sign preservation under `Polynomial.map`
and evaluation from those general facts. This existence construction
uses only Mathlib field theory, order theory, and the extension lemmas just
specified; it precedes IVT, Sturm, and quantifier elimination. The univariate
theorems below still accept any supplied real closed field, independently
of the choice of real closure. Reference: BPR Chapter 2 and
[Kuhlmann, real algebraic geometry notes, §1, Theorem 1.2](https://www.math.uni-konstanz.de/algebra/WS0910/Notes08.pdf).

### Polynomial signs over real closed fields

Work over arbitrary ordered `R` with `IsRealClosed R`. Prove the algebraic
characterizations needed to pass from squares and odd roots to polynomial
IVT: adjoining a square root of `-1` gives an algebraically closed field,
irreducible polynomials over `R` have degree one or two, and the irreducible
quadratics have constant nonzero sign. Build this bridge using Mathlib's
`AdjoinRoot`, irreducibility, splitting, and field-extension APIs. This is an
algebraic proof, not an appeal to completeness of `R`.

Prove polynomial IVT, its weak-sign and closed-interval forms, and polynomial
Rolle: if `a < b` and `p(a)=p(b)`, some `c ∈ (a,b)` satisfies `p'(c)=0`.
Supply the elementary consequences used throughout: signs between roots,
multiplicity and sign changes, root separation by derivative roots, derivative
signs immediately to either side of a point, and signs at both infinities.
Use the first nonzero derivative and parity to define one-sided signs, so
endpoint formulas remain algebraic over non-Archimedean fields.

For the signed Euclidean remainder sequence `[p,q,-(p % q),…]`, prove
termination, recurrence, the zero cases, common-factor cancellation, and its
relation to the gcd. Give variation its append, scaling, negation, and
zero-deletion API. Define the Cauchy index with a positive contribution for a
jump from `-∞` to `+∞`, so the index of `p'/p` counts distinct roots. Prove
local contributions, cancellation of removable poles, interval additivity,
and the Euclidean recurrence, then prove:

* Sturm: for nonzero `p` and `a < b` with `p(a)p(b) ≠ 0`, the number of
  distinct roots in `(a,b)` is `V(a)-V(b)` for `(p,p')`.
* Sturm–Tarski: for the same endpoints, the sum of `sign q(x)` over those
  roots is `V(a)-V(b)` for `(p,p'q)`. No squarefreeness assumption is imposed.
* One-sided endpoint and infinite-endpoint versions. Pin the open interval
  formula as `V(a⁺)-V(b⁻)` and add endpoint contributions explicitly for
  `[a,b]`, `(a,b]`, and `[a,b)`. The whole-line version computes `TaQ(q,p)`.

Thom's lemma says every fixed sign vector of the full consecutive list
`p,p',…,p^(degree p)` for a nonzero univariate polynomial defines an interval
(possibly empty or a point). Derive injectivity of the Thom encoding of a root, consisting of the
signs of derivatives of orders `1,…,degree p`, together with the condition
`p(x)=0`. Build restriction, realizability, reconstruction, and comparison
APIs. Pin the ordering rule: for two distinct root encodings let `k` be the
largest differing derivative index; their common sign at `k+1` is nonzero.
If it is positive, the order is the order of their signs at `k`; if negative,
it is the reverse. Prove that rule, including why such a `k+1` exists.

References: Basu–Pollack–Roy (BPR), Chapters 2 and 10; Cohen–Mahboubi;
Li's Sturm–Tarski formalization and Li–Passmore–Paulson.

## Layer 2: subresultants

Define subresultant polynomials and their principal coefficients by
Sylvester minors over a commutative ring. For degree bounds `m,n` and
`0 ≤ j ≤ min m n`, the principal coefficient is the determinant of the map
with columns

```
q, X*q, …, X^(m-j-1)*q, p, X*p, …, X^(n-j-1)*p
```

and rows the coefficients of degrees `j,…,m+n-j-1`, in that order. The
zeroth principal coefficient is exactly `Polynomial.resultant p q m n`.
For equal bounds the terminal determinant is the empty determinant `1`;
for unequal bounds it is a power of the leading coefficient of the
smaller-degree polynomial. For `j < min m n`, define the coefficient of
`X^k`, `0 ≤ k ≤ j`, in the subresultant polynomial by replacing the first
row (degree `j`) with the row of degree `k`, keeping the remaining rows
`j+1,…,m+n-j-1` and the columns unchanged. The determinant above is thus
its coefficient of `X^j`. At the terminal index the scalars are the stated
terminal convention; in particular the equal-degree terminal `1` is not
claimed to be the leading coefficient of a polynomial Bézout combination.
Prove the degree bounds and Bézout identities for the strict-index
subresultant polynomials, symmetry with its sign, scaling laws,
zero/constant/equal-degree cases, and agreement with signed polynomial
remainder sequences and their degree-gap factors.

For nonzero polynomials over a field, using their **actual** degrees, prove
that `degree(gcd(p,q))` is the least index with nonzero principal coefficient.
Prove the distinct-complex-root count formula
`degree p - degree(gcd(p,p'))` in characteristic zero, and the multiplicity
formula for common roots using the minimum of their multiplicities.

Prove coefficient-map compatibility at fixed bounds over any ring. Derive
compatibility at actual degrees under preservation of the leading
coefficients, and prove the degree-drop formulas by truncating to the
specialized degrees. Use the existing `PowerSeries.trunc k ↑p` for
`reductum p k = Σ_{i<k} p.coeff i * X^i`. Develop its
coefficients, nested truncation, derivative, and specialization laws. The
finite set of truncations for `k = 0,…,p.natDegree+1` covers every possible
specialized degree, including the zero polynomial. Prove that this set is
also the finite orbit of `Polynomial.eraseLead` with zero included. No use of the gcd
criterion may silently replace formal degree bounds by specialized degrees.

Pin the signed normalization as well. For `j ≤ min m n`, put

```
s_j = (-1)^(choose(m+n-2j,2) + choose(n-j,2) + (m-j)(n-j)) * psc_j.
```

For larger indices, put `s_m = p.coeff m`, `s_n = q.coeff n` when applicable,
and zero otherwise. The last exponent swaps our column blocks; the other
two translate to BPR's Sylvester–Habicht normalization, as in Vermande's
`subresultantE`. This is `signedPsc` in the prototype. Prove this conversion,
including the terminal and degree-drop cases.

Define permanences minus variations on a coefficient list by ignoring leading
and trailing zeros and summing over consecutive nonzero entries `a,b` with
`k` intervening zeros: contribute `(-1)^choose(k,2) * sign(a*b)` if `k` is
even, and zero if `k` is odd. For nonzero `p,q` of actual degrees `m > n`,
prove that this sum on `[s_m,…,s_0]` equals the whole-line Cauchy index of
`q/p`, with the positive-jump convention of Layer 1. Reduce general numerators
modulo `p`, handling zero remainders separately. Prove the formula from the
signed remainder sequence, and derive Sturm–Tarski and root-count formulas
from principal coefficient data. Reference: BPR Chapter 4 and
[Vermande's signed subresultants](https://github.com/math-comp/cad/blob/master/theories/subresultant.v).

## Layer 3: sign determination and semialgebraic descriptions

The algebraic sign-determination and uniform coefficient-sign formulas in
this layer are over arbitrary real closed fields. Their application to the
semialgebraic predicate below is over `ℝ`.

For nonzero `p` and a finite tuple `q₁,…,qₘ`, define the count `cσ` of distinct
roots of `p` with sign vector `σ ∈ {-1,0,1}^m`. Prove the BKR matrix identity

```
TaQ(∏ qᵢ^eᵢ, p) = Σσ (∏ σᵢ^eᵢ) cσ,       e ∈ {0,1,2}^m.
```

Use `0^0=1`. The one-coordinate matrix has rows indexed by exponents
`0,1,2`, columns by signs `-1,0,1`, and entries `σ^e`; it is invertible over
`ℚ`. Prove the Kronecker-product identity and invertibility, and recover all
counts. Then develop the BKR recursive reduction: restrict to realized sign
columns, choose independent query rows, prove rank and invertibility of the
adapted square matrix, and prove preservation of counts when adjoining a
polynomial. Correctness and termination of sign determination must include
zero polynomials, repeated factors, empty tuples, and zero query values.
This layer includes finite sign determination on the whole line by roots and
complementary intervals, using Layer 1 to justify sample existence.

Define semialgebraic subsets of `ℝ^n` by finite Boolean combinations of
polynomial equations and strict inequalities. Prove the Boolean algebra,
polynomial inverse-image, coordinate permutation, section, and product
APIs directly from this definition. Define semialgebraic functions by their
graphs, including functions with a specified semialgebraic domain. Do not
assume closure of arbitrary images or composition that uses projection.

Build a uniform, finite coefficient-sign description of root counts and
Thom-encoded roots, using the subresultant formulas and explicit degree
cases. This gives quantifier-free descriptions of the graph of the `i`th
ordered distinct root, and of the regions below and above that root, on
coefficient sets with a fixed root count. Counting roots in `(-∞,t)` uses
one-sided signs and handles `p(t)=0`. Applying these descriptions to the
product of a fixed finite active subfamily describes the shared ordered
roots without assuming Tarski–Seidenberg or CAD. This is the bridge used in
Layer 5 to prove that its sections and sectors are semialgebraic.

References: BPR Chapter 10; Cohen–Mahboubi; Cordwell–Tan–Platzer.

## Layer 4: roots in continuous families

For monic `f ∈ ℂ[X]` and `ε > 0`, prove that there is `δ > 0` such that
every monic `g` of the same degree whose coefficients are within `δ` has
an enumeration of its roots, counted with multiplicity, matched bijectively
to an enumeration of the roots of `f`, with all matched distances below
`ε`. Give equivalent disjoint-small-disc and multiset formulations: each
sufficiently small disc around a distinct root contains exactly its
multiplicity many nearby roots, and there are no roots outside the union.

Use Mathlib's approximation estimate as an input, and prove the additional
multiplicity argument. A route within scope is factorization in `ℂ`, a
uniform bound on roots of nearby monic polynomials, compactness of bounded
root tuples, continuity of the elementary symmetric coefficient map, and
uniqueness of the limiting factorization. These intermediate results are
explicit targets. Extend to continuous coefficient families of fixed degree
whose leading coefficient is nowhere zero by monic normalization.

For real coefficient families, derive local preservation of real roots
from conjugation and separated complex discs whenever the number of
distinct complex roots is constant. Prove continuity of the ordered real
roots, local constancy of their number and multiplicities, and global
constancy on a connected base. No globally continuous labelling of complex
roots is claimed; monodromy forbids that in general.

Prove the **family** matching lemma: if each nonzero polynomial has fixed
degree and fixed gcd degree with its derivative, and every pair has fixed
gcd degree, nearby root matchings preserve membership and multiplicity in
every polynomial simultaneously. Derive locally constant numbers of roots
of the product of all nonzero members and a common ordered list of real
roots. Pairwise gcd data must be connected explicitly to this conclusion;
it is not permissible to assume product subresultants are in the projection.

## Layer 5: Collins delineability and stacks

Define the projection algebra over a commutative coefficient ring `A`, on
`Polynomial (MvPolynomial (Fin n) A)`; specialize to `A = ℝ` for delineability.
For a finite family `F`, let `T` contain all reducta of all members. Define
`projection F` to contain every coefficient of every member of `T`, every
principal coefficient for `(r,r')` with `r ∈ T`, and every principal
coefficient for `(r,s)` with `r,s ∈ T`. Use all indices from zero through
the minimum degree. Retaining zero and constant entries and pairs from the
same original polynomial is harmless and pins a simple finite superset of
Collins' projection. Prove finiteness, restriction monotonicity, and the
specialization lemmas. Truncation and principal coefficients are taken
before evaluating base coordinates.

The main theorem is `delineability` in `Suggested.lean`. For **any** connected
`S ⊆ ℝ^n` on which the projection set is sign-invariant, obtain a common
finite stack with continuous functions `θ₀ < … < θₖ₋₁ : S → ℝ` such that:

* Each input has either zero fibers everywhere on `S`, or nonzero fibers
  everywhere, of constant degree.
* Every root of every nonzero fiber is one of the `θᵢ`, and each section is
  used by at least one nonzero polynomial. For each polynomial and section,
  its root multiplicity is a fixed natural number, zero when it is not a root.
* The sections and the `k+1` open sectors partition `S × ℝ`. Each input
  polynomial has constant sign on each part. A nullified input has sign zero
  on the entire cylinder. For `k=0` the sole sector is the whole cylinder.

Prove constant degree by choosing a reductum using the coefficient signs;
apply the Layer 2 gcd criterion to those reducta at their actual degrees;
apply Layer 4's common matching lemma; and use connectedness to pass from
local to global statements. This does not require nonvanishing of the
original leading coefficients or a well-orientedness assumption.

Prove the stack API: disjointness, covering, nonemptiness, projection of each
part onto the whole base, ordering, restriction to a nonempty connected
subset, and uniqueness of the ordered list. Uniqueness concerns the root
list and multiplicities of nonnullified family members; the prototype's
unused multiplicity entries outside the family are not canonical.
For connected bases, prove
sections and sectors connected: sections are continuous images of `S`,
bounded sectors of `S × (0,1)`, and unbounded sectors of `S × (0,∞)` or
`S × (-∞,0)`. When `S` is semialgebraic, use Layer 3 to show the root graphs
and all stack parts are semialgebraic. Semialgebraicity of `S` is not needed
for the purely topological delineability theorem.

Prove coefficient-map naturality and evaluation compatibility for
`MvPolynomial.finSuccEquiv`. Prove `projection_map`: for an injective ring
homomorphism `φ : A →+* B`, mapping the entire projection set equals
projecting the mapped family. Discharge preservation of degrees, reducta,
derivatives, and all fixed-bound principal coefficients explicitly. This
injectivity hypothesis is essential; arbitrary specialization can drop degrees.

Define `integerProjection P` by splitting off the distinguished variable and
projecting entirely over `ℤ`. Prove that its image under `Int.castRingHom ℝ`
is exactly `projection (integerFamily P)`. The prototype `integer_delineability`
applies the same real delineability theorem to `MvPolynomial (Fin (n+1)) ℤ`
using sign-invariance hypotheses on this integer-computed projection. Its
closed proof checks the transport through `integer_projection` and evaluation;
there is no separate polynomial representation or projection theorem.

References: BPR Chapters 5 and 11; Jovanović, Definition 2.5 and Theorem 2.6;
Vermande, Proposition 3.5, Lemma 3.6, and Proposition 3.8.

## Layer 6: CAD and quantifier elimination

Define a CAD recursively as a finite partition into nonempty semialgebraic
cells. In dimension zero it is the singleton partition. In dimension `n+1`
it is obtained from a CAD of `ℝ^n` by choosing a finite ordered continuous
semialgebraic stack over each base cell and taking all its sections and
sectors. Prove every cell connected by induction, using Layer 5's
`stack_connected` and the ambient cylinder embedding. This discharges the
connectedness hypothesis at each subsequent lifting step. Prove the equivalent
finite-partition characterization, projection to each lower level, and cylindricity: two cells have equal or disjoint
projections at every lower level. In particular, every projected cell is
covered by each cell lying over it, not just met at one sample point.

Prove existence of a CAD adapted to any finite set of multivariate
polynomials by induction, applying Layer 5 to the projection CAD. Include
constants, the zero polynomial, the empty input, and cylinders without roots.
Supply a sample in each cell and prove that their sign vectors realize all
and only the realizable sign conditions. This is an existence and
correctness theorem, not a requirement for an efficient sampling program.

Prove projection closure for semialgebraic sets by taking an adapted CAD and
projecting exactly the cells included in the set. Then establish the graph,
image, and composition APIs that require projection, and Tarski–Seidenberg.
Give translation between quantifier-free ordered-ring formulas and finite
Boolean combinations of `MvPolynomial` sign conditions. Connect this to
Mathlib's `FirstOrder.Language` formula and realization APIs, using
`FirstOrder.Language.ring.sum FirstOrder.Language.order` (whose order symbol
is `≤`; strict inequalities are expressed by negating the reversed relation).
Install the compatible ring and order structures using
`FirstOrder.Ring.compatibleRingOfRing` and
`FirstOrder.Language.orderStructure`, then the sum-language structure.
Prove the term-to-polynomial and formula-to-sign-condition realization laws;
after elimination, identify semialgebraic sets with sets definable with
parameters in this structure. Prove existential elimination
by cell projection, universal elimination by complement, and elimination of
arbitrary nested quantifiers with parameters. State semantic equivalence for
every assignment, not just equisatisfiability of closed formulas.

References: BPR Chapter 11; Vermande, Theorems 3.9–3.10. The CAD route in this
layer is over `ℝ`; it does not assert quantifier elimination over every real
closed field as a consequence of a topological argument over `ℝ`.

## Layer 7: analytic preparation and McCallum projection

Build polynomial order of vanishing at a point as the least total degree of
a nonzero Taylor coefficient, with infinity for zero. This is ambient Taylor order, not the order of the
restriction to a base cell. Prove its derivative
characterization, multiplicativity, restriction behavior, and the distinction
between constant sign and constant order. Establish primitive parts, content,
squarefree bases and pairwise coprime bases in a distinguished variable, with
reconstruction of signs and roots for the original family. Content is always
included in projection; it must not disappear during preprocessing.
Also construct the irreducible basis required by Layer 8: finitely many
pairwise nonassociate irreducible primitive factors of positive degree in
the distinguished variable, with units, contents, and exponents reconstructing
each input. Use the unique factorization APIs for `MvPolynomial` and
`Polynomial` over a UFD; prove the primitive-factor and fraction-field
irreducibility bridges. Separate factors independent of the distinguished
variable into the content, and handle zero inputs explicitly.

Define a `d`-dimensional analytic submanifold `S ⊆ Fin n → ℝ` as a
nonempty set with `d ≤ n` and ambient `PartialHomeomorph` charts around each
point. The chart and its inverse satisfy `AnalyticOnNhd ℝ` on their respective
open source and target, and the chart sends its source intersected with `S`
onto its target intersected with `{y | ∀ i, d ≤ i.val → y i = 0}`. Define
analytic functions on `S` using the first `d` coordinates of these charts:
locally their coordinate expressions extend to functions satisfying
`AnalyticOnNhd ℝ` on an open subset of `Fin d → ℝ`. Prove independence of
charts, composition, restriction to relatively open subsets, and the product
and graph constructions. Ordinary analytic delineability is a `Delineation`
whose root functions are analytic in this sense. For Lazard analytic
delineability, use the ordered root coverage and constant positive
multiplicities of the Lazard evaluations, together with analyticity of those
root functions and constancy of the removed base-exponent vector. These are
separate definitions: ordinary fibers can be zero when Lazard evaluations are not.

The finite-dimensional analytic toolkit below is part of this layer. Use
`AnalyticAt` and `AnalyticOnNhd` with scalar field `ℝ` or `ℂ`, and products
of `Fin m → ℂ` with `ℂ`. A polydisc is a product of open balls of positive
radii; the distinguished disc is centered at zero. Establish these targets:

* **Analytic inversion and implicit roots.** For `𝕜 = ℝ` and `𝕜 = ℂ`, a map
  analytic at `a` with derivative a continuous linear equivalence has a
  `PartialHomeomorph` near `a` whose forward and inverse maps are
  `AnalyticOnNhd 𝕜` on source and target. Derive the local implicit-root
  theorem for an analytic `f(w,z)` with `∂f/∂z ≠ 0`. Prove local
  complexification of real analytic functions and chart maps, and the
  conjugation compatibility of extensions of real-valued germs.
* **Analytic dependence on parameters.** Prove the iterated Cauchy integral
  formula on a smaller closed polydisc contained in an open domain and
  deduce `AnalyticOnNhd ℂ f U` from `DifferentiableOn ℂ f U` for open
  `U ⊆ Fin m → ℂ`. In particular, if an integrand is jointly analytic on
  a neighborhood of a parameter point times a fixed circle, its contour
  integral is analytic in the parameter near that point. Establish the
  uniform convergence and integration of the resulting power series.
  Mathlib's one-variable Cauchy theorem is an input to this development,
  not a several-variable theorem to assume.
* **Extension across a coordinate hyperplane.** For a polydisc `U` and disc
  `D`, if `f` is `AnalyticOnNhd ℂ` on `U × (D \ {0})` and locally bounded
  near every point of `U × {0}`, construct `g` with
  `AnalyticOnNhd ℂ g (U × D)` agreeing with `f` off that hyperplane. Prove uniqueness. Use
  the parameter-dependent Cauchy integral to prove joint analyticity of
  the extension, rather than inferring it from pointwise removability.
* **Root covering and power substitution.** For a monic polynomial family
  of degree `d > 0` with analytic coefficients and nowhere-zero discriminant
  on `U × (D \ {0})`, show that projection from its root space is an
  `IsCoveringMap` with `d` points in each fiber and analytic local sections.
  Path lifting, homotopy lifting, monodromy, and the lifting criterion are
  Mathlib's, in `Mathlib/Topology/Homotopy/Lifting.lean`
  (`IsCoveringMap.liftPath`, `IsCoveringMap.liftHomotopy`,
  `IsCoveringMap.monodromyPerm`,
  `IsCoveringMap.existsUnique_continuousMap_lifts_of_range_le`), as is
  simple connectedness of a polydisc (`Convex.contractibleSpace` with
  `SimplyConnectedSpace.ofContractible`); consume them rather than
  redeveloping them. No universal cover or deck group is needed. The
  targets here are: the `FundamentalGroup` of the product of a polydisc
  with a punctured disc is generated by the standard loop around the
  puncture, proved by lifting through `Complex.isCoveringMap_exp` and the
  product API of the fundamental groupoid; for a general `IsCoveringMap`,
  a loop whose lift from `e` is closed lies in the image of the
  fundamental group of the total space at `e`; and, identifying the fiber
  over the basepoint with the `d` roots, `monodromyPerm` of the generator
  is a permutation `σ` of the roots with `σ ^ N = 1` for `N = d!`. Apply
  the lifting criterion to `(w,t) ↦ (w,t^N)` from `U × (D' \ {0})` to
  `U × (D \ {0})`, with `D'` the suitably resized disc: its image in the
  fundamental group is generated by the `N`-th power of the generator, so
  each root at the basepoint extends to a lift, and uniqueness of lifts
  makes the `d` lifts pointwise distinct. Obtain global analytic root
  sections from these `d` lifts and their analytic local expressions.
* **Constant order in a distinguished variable.** For `𝕜 = ℝ` and
  `𝕜 = ℂ` and `g(x,y)` analytic near the origin of `(Fin k → 𝕜) × 𝕜`
  and not identically zero, prove that the following are equivalent:
  `analyticOrderAt (fun y ↦ g (a,y)) 0 = m` for every `a` near `0`, and
  `g = y^m u` near the origin with `u` analytic and `u(0,0) ≠ 0`
  (McCallum–Parusiński–Paunescu, Lemma 4.4). After shrinking the polydisc
  `u` is nowhere zero, which is the form of the `y^a u` hypotheses of the
  parameterized root theorem below.

Use these results and the root bounds of Layer 4 to prove the
Puiseux-with-parameters theorem: for a monic polynomial in `z` with analytic
coefficients in `(x,y)` and discriminant `y^a u(x,y)` with `u` nowhere zero,
substitution `y=t^N` for a positive `N` (one may take `degree!`) splits it
into analytic linear factors on a sufficiently small polydisc. Prove the
root-difference and conjugation properties. Prove the nonmonic version
allowing leading and trailing coefficients to be powers of `y` times units:
the roots on the punctured polydisc have the corresponding Laurent-power
forms, and multiplication by a sufficiently large power of `t` makes them
bounded so that the extension theorem applies.

Prove the local discriminant theorem used for McCallum projection: a real
polynomial of positive constant degree, nowhere nullified on a connected
analytic submanifold of the base, with nonzero discriminant polynomial of
constant order there, is analytically delineable, and has constant order on
each section. Supply the analytic preparation argument linking the order
condition to the parameterized root theorem, rather than treating that link
as a hypothesis. Prove the family theorem for a squarefree, pairwise coprime
primitive basis using the order-invariance of all coefficients,
discriminants, and pairwise resultants. The basis polynomials are either
nullified throughout a base cell or analytically delineable; the lifting
conclusion for ordinary root sections applies to the nonnullified members.

Define McCallum's projection with these data and content. Prove recursive
correctness under an explicit well-orientedness condition: at every positive
dimensional lifting cell no basis polynomial is nullified. This condition
includes the final level because the conclusion here is order-invariance
at every level. At a nullifying zero-dimensional cell, construct a
delineating set from the nonzero
specializations of all mixed partial derivatives through the total degree of
the nullified polynomial. Refine the fiber at their roots and prove, using
the derivative characterization of order, that the ambient order is constant
on each resulting part. Ordinary specialization alone is insufficient: for
`x*T + z²` above `(x,z)=(0,0)`, the fiber is zero but the ambient order is
one when `T ≠ 0` and two at `T = 0`. Prove termination of this finite local
refinement and recursive order-invariance, including content factors.
Prove that the constructed cells are analytic submanifolds, so the local
theorem's hypothesis is discharged.
State the failure condition for this construction when nullification occurs
on a positive dimensional cell. Also prove the usual sign-invariant CAD
variant: only the lower lifting levels require order-invariance; at the
final level a nullified member is identically zero on the cylinder and may
be omitted from root lifting, without a delineating refinement for that
member. Thus this variant allows top-level nullification. A sign-invariant
input at an intermediate level cannot be substituted for the order-invariance
hypothesis needed by subsequent lifting.

References: McCallum, *An improved projection operation for cylindrical
algebraic decomposition* (1998); Brown on nullifying cells and order-invariance;
the parameterized root theorem and its
nonmonic version in McCallum–Parusiński–Paunescu, §4.

## Layer 8: Lazard evaluation and projection

Fix the coordinate order. For a nonzero polynomial, define the Lazard
valuation at a point as the lexicographically least exponent of a nonzero
coefficient after translation by that point. Develop addition and product
laws, finite valuation ranges for a fixed polynomial, and its relation to
successive division and specialization. Lazard evaluation at a base point
successively divides out the largest power of each `Xᵢ-aᵢ` before setting
`Xᵢ=aᵢ`, leaving a nonzero polynomial in the final variable. Prove this
nonzeroness and record the removed exponents. Prove agreement with ordinary
specialization when it is nonzero, and describe exactly how the valuation
on a lifted section appends its root multiplicity.

Turn valuations into orders along monomial test curves
(McCallum–Parusiński–Paunescu, §5.1). Index base exponent vectors
`v : Fin n → ℕ` by the fixed coordinate order, so that the lexicographic
order below is the one defining the Lazard valuation and `j ≻ i` means
that coordinate `j` is less significant than coordinate `i`. For nonempty
`V ⊆ Fin n → ℕ`, an **evaluator** for `V` is `c : Fin n → ℕ` with every
`c i > 0` and, for each `i`, `c i > ∑_{j ≻ i} c j * v j` for every
`v ∈ V`. Prove that every nonempty finite `V` has an evaluator and that
positive multiples of an evaluator are evaluators. For an evaluator `c`
of `V`, if `v ∈ V` and `v` is lexicographically less than
`u : Fin n → ℕ`, then `∑ i, c i * v i < ∑ i, c i * u i`. Write `p + y^c`
for the point with coordinates `p i + y ^ c i`. For a nonzero polynomial
`f` whose Lazard valuation `v` at `p` lies in `V` and an evaluator `c` of
`V`, the one-variable polynomial `y ↦ f(p + y^c)` is nonzero with order
`∑ i, c i * v i` at `y = 0`. For a polynomial `f` in one further
variable `z`, base points `α ∈ ℝⁿ`, and `f_{α,u}(z)` the coefficient of
`(x - α)^u` in the expansion of `f` about `α`, prove the parameterized
identity on a set `S` of base points: if `c` is an evaluator of `V`,
`v ∈ V`, and `f_{α,u} = 0` for every `α ∈ S` and every `u`
lexicographically less than `v`, then for all `α ∈ S`,
`f(α + y^c, z) = y^(∑ i, c i * v i) * (f_{α,v}(z) + y * R(α,y,z))` with
`R` a polynomial in `(α,y,z)`. The vector of base exponents removed by
Lazard evaluation at `α` is the lexicographically least `u` with
`f_{α,u} ≠ 0`, and `f_{α,u}` is then the Lazard evaluation.

Prove the uniform version used by the lifting theorem. The Lazard
valuations of a fixed polynomial have coordinates bounded by its degrees,
so they form a finite set; take `c` an evaluator for the union of the
sets of removed base exponents of `f` over `S` and of Lazard valuations
on `S` of its discriminant, leading coefficient, and trailing
coefficient. Taking `v` lexicographically least among the removed base
exponents of `f` over `S` satisfies the vanishing hypothesis above. For each `g` among the discriminant, leading
coefficient, and trailing coefficient with constant Lazard valuation `w`
on `S`, the order of `y ↦ g(p + y^c)` at `y = 0` equals
`∑ i, c i * w i` for every `p ∈ S`, which is the constant-order input to
the Layer 7 lemma on constant order in a distinguished variable.

For an irreducible primitive basis, define Lazard projection using leading
coefficients, trailing coefficients, discriminants, pairwise resultants,
and content. Prove the analytic lifting theorem for a polynomial of positive
degree in the distinguished variable on a connected analytic submanifold
`S` of the base. Its discriminant, leading coefficient, and trailing
coefficient must be nonzero **formal base polynomials**, each with constant
Lazard valuation on `S`; they may vanish at points of `S`. The conclusion
is analytic Lazard delineability: the ordered roots of its Lazard evaluations
are analytic functions on `S`, with constant multiplicities and a constant
vector of removed base exponents. The roots are roots of **Lazard
evaluations**, not roots of nullified ordinary fibers.
Treat the factor consisting of the distinguished variable separately.
Prove the family theorem giving disjoint sections and constant valuations on
all sections and sectors, with the analytic preparation and valuation
arguments developed from Layer 7. This is the analytic-submanifold version
of Lazard delineability; no claim for arbitrary connected subsets is needed
by the recursive construction in this roadmap.

Finally prove CAD existence by recursive Lazard projection and lifting:
verify analytic submanifold cells at every level, recover sign-invariance
from valuation-invariance and connectedness, and transfer from the basis to
the original family. This construction has no well-orientedness condition.
Include an example where ordinary specialization is nullified but Lazard
evaluation is nonzero, alongside the theorem explaining its treatment.
Reference: McCallum–Parusiński–Paunescu, §§2–5, especially Theorem 5.1.

## Formal precedents and references

These are mathematical and interface precedents, not instructions to copy
code. Coordinate with authors before integrating any existing implementation;
this roadmap requires an independent Mathlib-facing development.

* S. Basu, R. Pollack, M.-F. Roy, [*Algorithms in Real Algebraic Geometry*,
  second edition](https://doi.org/10.1007/3-540-33099-2), 2006. Chapters 2, 4,
  5, 10, and 11 supply the main algebraic and geometric references.
* Q. Vermande, [*Cylindrical Algebraic Decomposition in Coq/Rocq*](https://doi.org/10.1145/3779031.3779100),
  CPP 2026, pp. 45–58 ([author manuscript](https://inria.hal.science/hal-05459452v1/file/cad-cpp.pdf),
  [formalization](https://github.com/math-comp/cad)). This supplies a formal
  CAD correctness proof over real closed fields with semialgebraic
  connectedness. Follow its explicit handling of truncations, zero fibers,
  common root matching, and recursive stacks. The scope here instead uses
  ordinary topology over `ℝ`; its signed subresultant convention also needs
  translation to the determinant convention above.
* C. Cohen and A. Mahboubi, [*Formal proofs in real algebraic geometry:
  from ordered fields to quantifier elimination*](https://doi.org/10.2168/LMCS-8(1:2)2012),
  LMCS 8(1), 2012. Precedent for real closed algebra, sign determination,
  and their reusable interfaces.
* A. Mahboubi, [*Implementing the cylindrical algebraic decomposition
  within the Coq system*](https://doi.org/10.1017/S096012950600586X),
  MSCS 17(1), 2007. Earlier CAD implementation; its correctness proof was
  not completed. Distinguish it from Vermande's correctness development.
* K. Cordwell, Y. K. Tan, A. Platzer, [*A Verified Decision Procedure for
  Univariate Real Arithmetic with the BKR Algorithm*](https://doi.org/10.4230/LIPIcs.ITP.2021.14),
  ITP 2021. Precedent for the BKR matrix invariant and recursive sign determination.
* W. Li, [*The Sturm–Tarski Theorem*](https://www.isa-afp.org/entries/Sturm_Tarski.html),
  AFP 2014; W. Li, G. O. Passmore, L. C. Paulson,
  [*Deciding Univariate Polynomial Problems Using Untrusted Certificates
  in Isabelle/HOL*](https://arxiv.org/abs/1506.08238), JAR 2017.
* D. Jovanović, [*Solving Non-Linear Arithmetic*](https://cs.nyu.edu/media/publications/dejan_thesis.pdf),
  dissertation, 2012, Definition 2.5 and Theorem 2.6. Reference for the full
  Collins projection including reducta.
* S. McCallum, [*An improved projection operation for cylindrical algebraic
  decomposition*](https://doi.org/10.1007/978-3-7091-9459-1_12), 1998.
* C. W. Brown, [*The McCallum projection, lifting, and order-invariance*](https://www.usna.edu/ComputerScience/cstech/reports/2005-02.pdf),
  technical report USNA-CS-TR-2005-02, 2005.
* S. McCallum, A. Parusiński, L. Paunescu,
  [*Validity proof of Lazard's method for CAD construction*](https://arxiv.org/abs/1607.00264),
  Journal of Symbolic Computation 92 (2019), pp. 52–69.
