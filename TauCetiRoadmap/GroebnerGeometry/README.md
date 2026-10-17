# Gröbner bases, affine semigroups and algebraic degenerations

Build polynomial normal forms and subalgebra subduction as reusable algebraic
geometry tools. Develop affine semigroup presentations, normalization, orbit
geometry and degree, then construct flat initial degenerations. Work out minor
and flag-minor algebras, trivalent-tree degenerations and permutation invariants
on the same APIs. Algebraic independence, initial ideals and special fibres
are theorem targets, rather than conclusions inferred from a list of generators.

## Scope, conventions and suppliers

Polynomial variables are finite when a finite Gröbner basis, algorithm or
finite-type geometry is asserted. Division with unit leading coefficients
retains Mathlib's more general coefficient-ring hypotheses. Normal forms,
Buchberger and SAGBI completion work over a field k. Geometric point/orbit
statements use algebraically closed k; the ring and scheme constructions precede
that specialization. All semigroup algebras here use native `AddMonoidAlgebra k S`.
Use `AddMonoidAlgebra.toMultiplicativeAlgEquiv` to compare with
`MonoidAlgebra k (Multiplicative S)`, the native toric coordinate-ring carrier.

An initial term is the **largest** term for `m : MonomialOrder σ`;
use `m.degree`, `m.leadingCoeff`, `m.leadingTerm` and its well-founded synonym
order. Weight initials select terms of maximal weight and may have several
terms. Keep them distinct from a monomial-order leading term. Monoid exponents
are additive and generators map to monomials with coefficient 1. Affine degree
and projective degree are different invariants.

An affine semigroup is a finitely generated additive submonoid S of a finite
free abelian group L. Use its generated group L_S, not an oversized ambient
lattice, for normalization, torus characters and lattice indices. The algebra
k[S] may be nonnormal. Normal cone/fan geometry consumes the existing toric
objects; it is not recast as a private class of varieties.

| Supplier | Interface used here |
| --- | --- |
| Mathlib monomial orders and polynomial rings | `MonomialOrder`, `MvPolynomial`, finite supports, leading terms, native `sPolynomial` and its cancellation/degree lemmas, `MonomialOrder.lex`/`degLex`, `div`/`div_set`, ideal span/quotient, Dickson/Noetherian theory and finite polynomial algebra. |
| Mathlib algebra and schemes | Native monoid algebras and their universal properties, `AddMonoidAlgebra.scalarTensorEquiv`/`instIsPushout` and scheme `pullbackSpecIso`, group completion/localization, integral closure, normalization, flat modules, `IsFiltration`/`IsRingFiltration`, `Scheme`, `Spec`, native graded algebra and `Proj`. |
| [AnalyticToricGeometry Layer 0](../AnalyticToricGeometry/README.md) and native `TauCeti.Toric` | Integral lattices, `PointedCone`, dual semigroups, Gordan finiteness, face localization and normal affine cone/fan schemes. The semigroup-presentation and normalization comparisons here extend those carriers. Analytic charts/manifolds remain there. |
| [SchurWeyl](../RepresentationTheory/SchurWeyl/README.md), [ClassicalGroups Layer 6](../RepresentationTheory/ClassicalGroups/README.md) and native tableau/GT modules | `BoundedSSYT`, semistandard conventions, Schur polynomial/count APIs, `GTPattern`, `gtPatternEquivSSYT`, interlacing deletion and characteristic-zero representation branching. This roadmap builds the additive pattern/monomial-algebra comparison. |
| [StableReduction Layers 2,4](../StableReduction/README.md) | Relative Proj of finitely generated graded quasi-coherent algebras and projective morphisms; Rees blowup and its charts/universal property, used for the explicit cubic-scroll/blowup comparison. The increasing-filtration Rees algebra below has an explicit extended-Rees comparison with native ideal `reesAlgebra`. |
| [AlgebraicVectorBundles L0,L2A](../AlgebraicVectorBundles/README.md) | Finite locally free sheaves, their tensor/dual, graded symmetric-algebra and affine graded-ring/base-change APIs, used with relative Proj for the explicit F1 construction in G6. |
| [SchemeAndStackFoundations §§0.3,2.6,5.7](https://github.com/TauCetiProject/TauCetiRoadmap/pull/779) | Relative Proj/O(d) and its StableReduction comparison, coherent projective-space cohomology and Serre vanishing, algebraic `Chow.K0/G0` over its fixed field κ, resolution property and proper G0 pushforward, for G4 and the F1 section comparisons in G6. Use its named construction and comparison interfaces. |

Follow the `MonomialOrder.IsRemainder`, `IsGroebnerBasis` and S-polynomial
design of [Mathlib PR29203](https://github.com/leanprover-community/mathlib4/pull/29203)
and [PR34873](https://github.com/leanprover-community/mathlib4/pull/34873).
Build needed targets in Tau Ceti on that design and adopt Mathlib declarations
when available. For generic minors follow
[PR40266](https://github.com/leanprover-community/mathlib4/pull/40266)'s
`Matrix.mvPolynomialMinor`/`determinantalIdeal` interfaces. The
[Gröbner-basis discussion](https://leanprover.zulipchat.com/#narrow/stream/217875-Is%20there%20code%20for%20X%3F/topic/Gr%C3%B6bner%20bases)
records the division/remainder direction; a tactic's internal Gröbner engine
does not replace the mathematical API.

This roadmap owns polynomial minor/flag-minor presentations, straightening
and flat families. Scheme identifications with Grassmannians or flags, section
comparisons, and geometric Schubert ideals are outside its scope; they consume
these polynomial results. No scheme identification with a homogeneous space is
an input to this roadmap. Rational highest-weight modules and crystals remain
with their representation suppliers; character identities here do not assert
semisimple decomposition in characteristic p.

## G1. Ideals, normal forms and elimination

Construct the ideal generated by leading terms of an ideal I. A Gröbner basis
G of I is a subset of I with the same leading-term ideal. Build subset/span,
monic rescaling, zero removal, transport, extension by redundant generators
and change-of-coefficients APIs. Separate ring statements with unit leading
coefficients from field statements. Define remainders using a bounded-degree
division representation and irreducibility of every remaining monomial;
the condition concerns divisibility, not merely comparison of total degrees.

Prove ideal membership iff a Gröbner remainder is zero, uniqueness of the
irreducible remainder, the quotient basis of standard monomials and its
linear normal-form map. Give additive/scalar/product-reduction equations,
idempotence, kernel I and compatibility with quotient multiplication.
For homogeneous ideals construct graded versions and their homogeneous bases.

Use native `m.sPolynomial`, its lcm formula and leading-coefficient cancellation
lemmas; construct the missing remainder/standard-representation API for it.
Prove Buchberger's criterion and certified completion: each nonzero reduced
S-polynomial strictly enlarges the monomial ideal, so Noetherianity gives
termination in finitely many variables. Supply the finite Gröbner existence
theorem, unique reduced monic basis and equivalence of generator sets by
normal forms. Executable operations on computable fields return mathematical
certificates; no complexity bound is presumed. Use native lexicographic and
graded lexicographic orders; construct graded reverse lexicographic order in
the same `MonomialOrder` API, with its comparison and well-foundedness lemmas.
Pin the usual antitone single-variable convention: X_i precedes X_j iff j≤i
in the ordered variable index. In G5 use `OrderDual` of the lexicographic
row-subset index, so P_I<P_J when I precedes J lexicographically.

Prove elimination/intersection, saturation by an element, colon ideals and
ideal equality computations, with the added-variable localization comparison.
Prove that any finite set of comparisons in the given monomial order is represented
by positive integral weights, including bounded-total-degree comparisons;
prove the finite linear-inequality separation lemma used for this. Do not
claim that one weight represents every comparison of an arbitrary term order.
Build weight initials, refinement by a term order and finite Gröbner-cone
inequalities, with the finite reduction certificates that certify an unchanged
initial ideal. Extend scalar fields without changing initial ideals/bases.

## G2. Semigroup presentations, normalization and degree

For finitely many exponents a_i, construct the exponent map from N^i, its
image S and the polynomial-to-monoid-algebra surjection X_i↦chi^(a_i).
Its kernel is generated by binomials X^u−X^v with equal exponent image.
Prove the presentation over arbitrary commutative coefficient rings,
finite binomial generation and elimination computation. First use Noetherianity
over Z to select finitely many of the defining binomials; base change their
ideal/presentation to arbitrary R using the freeness of Z[S], rather than
assuming R is Noetherian. For domain coefficients prove k[S] is a domain. Give unit groups, group completion, dimension
rank(L_S), localization to k[L_S], products and monoid-map functoriality.

Define saturation inside L_S by the existence of a positive multiple in S.
Identify it with the integral points of the rational cone, prove finite
generation/finite normalization and identify k[sat S] with the integral closure
of k[S] in its own fraction field. Prove normality iff S is saturated, with
the field/integrally-closed coefficient hypotheses explicit. Construct the
canonical comparison to `TauCeti.Toric.affineToricScheme` for dual semigroups
over C using `toMultiplicativeAlgEquiv`. Construct the integral model
`Spec (AddMonoidAlgebra Z S)` and consume native
`AddMonoidAlgebra.scalarTensorEquiv Z R` and `instIsPushout` for every
commutative coefficient ring R, together with `pullbackSpecIso`. Its C base change is the native
normal affine toric scheme when S is that cone's dual semigroup. A direct
k-to-C base change is asserted only with a chosen algebra structure k→C.
Do not normalize in a larger fraction field by enlarging the lattice.

For a monoid face F, construct its prime monomial ideal, closed face scheme
and the localized orbit Spec k[gp F]. Prove the orbit/face bijection on
geometric points, dimensions, closure order and stabilizer character group.
Retain lattice-index stabilizers, including finite nonreduced ones in positive
characteristic. Compare normalization on each orbit; it need not be a
one-to-one map on every boundary orbit. Supply the dense torus action as a
native coaction and compare cone faces and semigroup faces.

For a positive integral grading with a nonempty finite family of generators
of degree 1,
construct Proj k[S], its affine degree-zero charts and the homogeneous
monomial-map projective image. Define the Hilbert function by homogeneous
component rank and prove equality with the count of semigroup elements of
that degree. Build the rational Hilbert series and compare the eventual Hilbert polynomial
with Mathlib's `Polynomial.hilbertPoly p d` over Q when its rational Hilbert
series is `p/(1−T)^d`. Prove the graded-module/counting-series comparison
from the component ranks, using the native eventual coefficient theorem;
that polynomial API does not itself supply this module comparison. Counting
is over Q even when k has positive characteristic.
For the saturated monoid prove the Ehrhart count for the generator polytope;
construct the lattice-normalized measure and the leading-coefficient theorem.
For nonsaturated S use finite normalization/conductor estimates to prove
the same leading term. Degree is dimension factorial times the leading
coefficient, hence normalized polytope volume in the **difference lattice**
generated by a_i−a_j. Prove projective dimension rank(L_S)−1 and the primitive
simplex normalization, including the zero-dimensional projective case.
Treat the empty generator family separately: S={0}, k[S]=k in degree 0
and Proj k[S] is empty; the rank-minus-one dimension formula does not apply.

## G3. Subalgebras, SAGBI and subduction

For a subalgebra A of k[x], define its initial algebra as the subalgebra
generated by the leading terms of all its elements. The exponent set of its
nonzero elements is an additive submonoid; prove the monomial-algebra
isomorphism with the initial algebra. A SAGBI basis B is a subset of A whose
leading terms generate this algebra. Build zero removal, normalization,
scalar-field extension, transport and inclusion APIs.

Construct subduction: cancel a leading term using a product of basis elements
with that exponent, record the polynomial expression and recurse in the
well-founded monomial order. For a SAGBI basis every element subducts to zero,
so B generates A. For a general finite B, retain both the expression and the
nonzero remainder; it must not be called an element outside A merely because
the particular subduction procedure stopped.

Construct the toric relation ideal of the leading monomials of B using G2's
exponent presentation. Prove the SAGBI criterion: B is SAGBI for k[B] iff
substituted generators of that relation ideal admit zero subductions. Give
standard representations for these relations and the induced presentation
of k[B]. Completion repeatedly adjoins nonzero subductions with their
membership certificates. Prove termination under finite generation of the
full initial algebra and fairness of the relation processing; without that
hypothesis completion may be infinite even when A is finitely generated.
Prove uniqueness of quotient normal forms using the presentation ideal;
expressions as polynomials in a redundant SAGBI generating set need not be unique.

## G4. Rees algebras and flat initial families

Use native `IsFiltration` and `IsRingFiltration` for the increasing
multiplicative polynomial/subalgebra filtration by nonnegative integral
weight, with the lower stages as the native F_lt family. Construct its
Rees algebra inside A[t]. Give the graded
sum/subalgebra comparison, t action, associated graded, fibre at 0, fibre at 1,
generic localization and naturality under filtered homomorphisms. Compare
ideal-power Rees algebras through the extended Rees ring inside native
Laurent polynomials: `R[It,t^(-1)]` has nonnegative graded part equal to
Mathlib `reesAlgebra I`, and quotient by `t^(-1)` equal to `gr_I R`.
Construct `gr_I R = ⨁_{n≥0} I^n/I^(n+1)` and its graded multiplication,
unit, quotient maps and functoriality, using native direct sums and quotients.
The increasing Z-indexed I-adic filtration is F_j=R for j≥0 and
F_j=I^(−j) for j<0; its F_j/F_(j−1) pieces identify the nonpositive
indices with the displayed nonnegative associated-graded degrees.
Prove these comparisons and their generator/base-change maps; the ordinary
ideal Rees ring need not contain t as a scalar parameter. Build the homogenized polynomial presentation and prove its
t-saturation; multiplying an equation by a power of t can create an unwanted
component at 0.

For finitely generated ideals construct the flat weight-initial quotient
family. For a finite SAGBI basis construct the finite-type subalgebra Rees
family with fibres A and its initial algebra, choosing weights from the finite
relation/subduction certificates. Prove flatness over k[t] from the actual
torsion-free module/PID theorem and identify every fibre and base change.
For homogeneous data construct the projective flat family using relative Proj.
Prove preservation of the Hilbert function, Hilbert polynomial, dimension
and degree. For every finitely generated Z-graded module over a standard
polynomial ring (bounded below, allowing graded shifts), define its Hilbert function by the finite-dimensional rank
of each graded piece, its formal Laurent Hilbert series and its eventual
polynomial.
Prove rationality and the alternating graded-syzygy numerator formula; compare
with G2's monoid-counting functions. Here κ denotes the same field k, under PR779's fixed-field
notation. For a homogeneous flat family embedded in a fixed `P^N_{κ[t]}`,
prove `[i_0* O_{X_0}]=[i_1* O_{X_1}]` in `Chow.K0(P^N_κ)`. First form
the coherent pushforward classes in `Chow.G0`, then transport through PR779's
`K0.toG0_bijective` for the regular ambient projective space. This roadmap
owns the projective-space comparison. Consume O(d), coherent cohomology,
Serre vanishing and proper G0 pushforward from §§0.3,2.6,5.7. For
π:P^N_κ→Spec κ define the Hilbert-polynomial map by
`[F] ↦ (m ↦ rank π_!([F]·[O(m)]))`, proving additivity, polynomiality
and independence of representatives. Prove K0 is free on `[O(−i)]`,
0≤i≤N, and this map injective. For spanning, prove every coherent sheaf
on P^N_κ is the sheafification of a finitely generated graded module.
Use its graded free resolution to express its class through O(d), and
prove the exact projective coordinate Koszul complex gives
`(1−[O(−1)])^(N+1)=0`; reduce all twists to the stated basis.
For independence use the binomial Euler polynomials of O(m−i).
Construct the graded-module sheafification API on projective space: restriction
and localization charts, exactness, `S(−d)~ = O(−d)`,
`(S/I)~ = i_*O_X`, and the comparison of `(S/I)_m` with
`Γ(X,O_X(m))` for sufficiently large m. Prove graded Hilbert syzygy
over κ[x_0,...,x_N], giving finite graded free resolutions and their
sheafified locally free resolutions. Identify each fibre class's polynomial
with its preserved Hilbert polynomial; injectivity proves the equality.
For the graded-flat initial families, also prove the direct numerator formula
`[i_*O_X]=Σ_d k_d[O(−d)]` where
`Σ_d k_d T^d = HS_(S/I)(T)(1−T)^(N+1)`. Their preserved full Hilbert
function makes these numerators equal. For every closed subscheme X of P^N_A over a Noetherian ring A,
construct its saturated homogeneous-ideal presentation and prove the
closed-subscheme/presentation comparison, restriction and Proj base change.
For a flat X over A=κ[t], prove its saturated graded quotient is
torsion-free over κ[t], using the projective affine charts and saturation;
each graded piece is finite free. Identify fibre schemes with Proj of
the base-changed quotient, and deduce constant fibre Hilbert polynomials
using the large-degree section comparison. Small-degree functions of the
separately saturated fibre presentations need not be constant. This supplies
the general scheme-flat family used in the K0 equality above. The two classes are in that one ambient
group; no identification of the intrinsic K0 groups or cohomology rings of
the fibres is asserted.

## G5. Minor, flag-minor and invariant algebras

Construct generic rectangular matrix minors with sorted indices, alternating
signs and the repeated-index zero rule. Follow `Matrix.mvPolynomialMinor`
and `determinantalIdeal` on pair-indexed variables; construct the
`MvPolynomial.renameEquiv` comparison along `toLex`, including all minors
and determinantal ideals. The flag-minor formula below is the transported
first-column minor under that equivalence. Fix row-major lexicographic variable
order, with z_(0,0) largest, then z_(0,1), and so on; prove every minor with
sorted rows and columns has its main diagonal as leading term. Construct this
as a native `MonomialOrder` through the lexicographically ordered variable
index, not the product partial order. Prove determinant exchange/shuffle
identities with all indices/signs, polynomial identities over Z and their
base changes. For maximal minors, give the polynomial presentation by Plücker
relations, prime ideal, standard-monomial basis and a certified Gröbner order.
On Plücker variables P_I, use graded reverse lexicographic order with
P_I<P_J when sorted row subsets I precede J lexicographically. Prove
the quadratic straightening relations are a Gröbner basis and their initial
ideal is generated by P_I P_J for pairs incomparable in componentwise order.
Prove spanning by a well-founded straightening order and independence by
distinct diagonal leading monomials. Use native bounded semistandard tableaux,
with weak rows/strict columns, rather than a second tableau type. This is the
polynomial algebra theorem; scheme and section identifications are consumers.

For an n-by-n matrix fix flag minors using increasing row subset I and the
first card(I) columns. Prove diagonal SAGBI and standard-monomial bases of
the flag-minor subalgebra, with its fundamental multigrading. Identify its
initial exponent monoid with the nonnegative part of native `GTPattern n`,
constructing the complete pointwise `AddCommMonoid` API, its nonnegative
`AddSubmonoid`, and `shift m` as addition of the constant pattern. The map
from diagonal exponent e to a pattern is
`P.entry c j = if n < j then 0 else Σ_{r<j} e(r,c)`;
prove its inverse by successive differences, its interlacing/nonnegativity
and additive equivalence with the generated initial monoid. For row subset
`I={i_0<...<i_(d−1)}`, the diagonal exponent is that of `∏_{c<d}z_(i_c,c)`.
The row-subset generators number 2^n−1, including the determinant. Prove finite
generation, saturation, pattern/tableau/content comparisons and the Rees
degeneration. The **initial** algebra is the pattern semigroup algebra;
the original flag algebra is not thereby toric. Prove that inverting the full determinant corresponds to all native integer
patterns: its multiplication is `GTPattern.shift 1`, and localization permits
`shift c` for every integer c. Compare this additive localization with the
existing native shift/tableau and rational-weight branching API.

For generic n-by-2 matrices over a field k with the right action Z↦Zg,
prove that the minors are the SL2 group-scheme invariant algebra through
the coaction of native
`TauCeti.SpecialLinear.coordinateHopfAlgebra k 2` on this
matrix polynomial ring, with its native base-change isomorphisms. Use
native `TauCeti.Comodule`, `SpecialLinear.standardComodule` and
`Comodule.fixedSubcomodule`. Pin the right coaction on
`MvPolynomial (Fin n × Fin 2) k` by
`z_(i,r) ↦ Σ_s z_(i,s) ⊗ x_(s,r)`, with each row a copy of the
native standard comodule. Build the multiplicative map by `aeval`, prove
coassociativity and counit on generators, then give its fixed submodule the resulting subalgebra structure.
Prove the invariant-algebra theorem by straightening in every characteristic. Compare invariants of k-points
over infinite k; finite-field point invariants require a separate comparison
and are not substituted for group-scheme invariants.

For a permutation subgroup G of S_n construct its polynomial invariant
subalgebra and orbit-sum basis. For every admissible term order prove finite
SAGBI iff G is generated by transpositions, equivalently a product of full
symmetric groups on its orbits. The elementary symmetric polynomials in each
block supply the positive case; prove the nonfinite case through the invariant
leading-exponent monoid. This statement concerns the specified permutation
coordinates, not every linear change of variables. For the alternating group and characteristic different from 2, give
for n≥2 the presentation k[e_1,...,e_n,Delta], where `Delta=∏_{i<j}(x_i−x_j)`,
with the discriminant-square relation. For n≥3 prove nonfinite SAGBI
for every order in every characteristic using the permutation criterion.
In three variables with lex x>y>z and characteristic different from 2,
put e1=x+y+z, e2=xy+xz+yz and compute (e1 e2−Delta)/2.
Prove its leading monomial is x²z, and that this exponent is outside
the monoid generated by x, xy, xyz and x²y. Handle n=1 separately,
where the alternating group is trivial and its invariant algebra is k[x].
No assertion about arbitrary linear reductive groups follows from this criterion.

## G6. Explicit geometric and tree calculations

Compute the affine semigroup hypersurface x^2 y=z^3 using exponents
(3,0),(0,3),(2,1). Its generated lattice has coordinate sum divisible by 3;
normalization adds (1,2), not all of N^2. Identify the normalized ring with
the cubic Veronese monoid algebra, exhibit the integral element z^2/x and its
relations. Compute its four affine face orbits, their closure order and
stabilizers. In the grading (a,b)↦(a+b)/3, identify Proj k[S] with
the plane cubic x²y=z³ and its normalization with P¹ via the cubic
Veronese map; compute the two projective boundary orbits and dense torus.

For the five exponents (2,0,0),(1,1,0),(1,0,1),(0,2,0),(0,1,1), prove
the presentation ad−b^2, ae−bc, be−cd, normality and the four extremal rays.
Compute ten affine orbits with the four one-dimensional and four
two-dimensional support patterns, and nine projective orbits. Construct
the projective cubic scroll and identify it with `Bl_p P^2`, embedded by
`|2H−E|`, using StableReduction's blowup/chart API. Define F1 as
PR779 §0.3's relative Proj over P¹ of L2A's
`gradedSymmetricAlgebra (O⊕O(1))`. Reach StableReduction's blowup carrier
through §0.3's relative-Proj agreement. Consume L2A's
shared affine graded-ring/restriction/base-change interface as Layer2's
relative-Proj input, and
PR779 §0.3's compatible relative-Proj/O(1) carrier and §2.6's
H0(P¹,O(d)) calculation. Its quotient convention identifies this F1
with PR779 §5's lines-convention P(O⊕O(−1)). Consume its
tautological O_P(1), identify it with that blowup,
and compare its cubic polarization `O_P(1)⊗pi*O(1)` with `2H−E`.
Prove π_*O_P(m)=Sym^m(O⊕O(1)) for m≥0 and the line-twist rule,
so the cubic polarization has five independent sections. Verify degree 3 in the generated difference lattice.

Compute the nonnormal Whitney umbrella semigroup
`S=⟨(1,0),(1,1),(0,2)⟩`, ring k[u,v,w]/(v²−u²w), generated group Z²
and normalization k[x,y]. On the y-axis face, gp(F)=0×2Z; the stabilizer
character group is Z⊕Z/2, so the stabilizer scheme is G_m×mu2.
Normalization restricts on that orbit to y↦y²: two-to-one on geometric
points outside characteristic 2, and purely inseparable/bijective on points
in characteristic 2, with a nonreduced mu2 stabilizer.

For every finite trivalent tree with n≥3 labelled leaves, define the
leaf-pair path exponent in its edge lattice, including a combinatorial path
existence/uniqueness API. Prove the generated lattice/parity description,
full rank 2n−3, nonnegative triangle constraints at internal vertices and
normality via integral path decomposition. Build the quartet binomial ideal
and prove it is the whole presentation ideal. Here P_ij is the variable of the polynomial ring k[P_ij:i<j], mapped
to the sorted-row minor of an n-by-2 matrix with diagonal initial
z_(i,0)z_(j,1); equivalently its image is the column-pair minor of
the transposed two-row matrix. A four-leaf split 12|34 gives
P13 P24−P14 P23. Choose positive rational internal-edge lengths and
scale to integers; define w(P_ij) as the total internal-edge length of
the unique i–j path. Leaf-edge lengths change weights by a leaf grading
and do not change the Plücker initial ideal. Pin arbitrary leaf labels using a chosen planar embedding
and its linearized circular leaf order rho: for i<j put epsilon_(ij)=+1
if rho(i)<rho(j), and −1 otherwise. Construct the k-algebra involution of k[P_ij:i<j] given by
`P_ij↦epsilon_(ij) P_ij`.
For the path-length weights just defined, prove it identifies the path-toric
ideal with the maximal-weight Plücker initial ideal. The pure-difference ideal itself
appears when the chosen circular order is 1,...,n. For split 13|24, the
Plücker initial is P12P34+P14P23 while the unsigned toric binomial is
P12P34−P14P23; the sign map reconciles them in every characteristic.

Supply the whole initial-ideal equality
proof, not only the initial relations; compare Hilbert bases/counts via G5. Construct the flat affine/projective family with this
fibre and its scalar/label-change maps. For the split 12|34 and unit internal-edge length, use the G4 parameter t
and saturated relation `P13P24−P14P23−t²P12P34`; its fibre at 1 is the
sorted-minor Plücker relation and its special fibre at 0 is the toric relation.
Compare the diagonal minor initial monoid of G5 with the comb-tree path monoid,
using the explicit path/diagonal exponent map and its additive inverse.

Compute projective dimension 2n−4 and degree Catalan_(n−2), including the
polynomial minor algebra Hilbert function and its leading coefficient.
Treat n=2 as the separate point case.

For the square flag matrix of size 2, compute the flag-minor
algebra k[z00,z10,det Z] and its free diagonal exponent monoid. For size 3,
name a=z00,b=z10,c=z20, d,e,f as the size 2 minors on sorted
row subsets {0,1},{0,2},{1,2} and first two columns, and g=det Z. Prove the presentation
k[a,b,c,d,e,f,g]/(af−be+cd), initial presentation with relation af−be,
and fundamental-multigraded Hilbert series
(1−uv)/((1−u)^3(1−v)^3(1−w)). Compare the fixed-top-row
(2,1,0) count 8 with ClassicalGroups' existing branching example. Geometric
Grassmannian/flag scheme identifications are outside this polynomial scope.

## Dependency order and references

G1 precedes G2's monomial relation presentation, which supplies G3's
certified subduction/SAGBI criterion. G4 uses G1–G3; G5 uses those algebraic
tools and the existing tableau/pattern foundations; G6 uses G2–G5 and the
stated relative-Proj, graded symmetric-algebra and blowup suppliers.
G4 owns its projective-space K0/Hilbert-polynomial comparison after the
fixed-field K0/G0 foundations; G6 owns the explicit F1 pushforward/twist, blowup and section comparisons
after relative Proj and its O(1) supplier. No Schubert or representation classification result
depends back on a geometric conclusion used to prove these polynomial bases.

References: Cox–Little–O'Shea, *Ideals, Varieties, and Algorithms*, division,
elimination and Buchberger chapters; Sturmfels, *Gröbner Bases and Convex
Polytopes*, initial algebras and toric ideals; [Miller–Sturmfels Chapter 14](https://pages.uoregon.edu/njp/MS.pdf),
minor/flag SAGBI and semigroup geometry;
[Borovik–Hibi §1](https://arxiv.org/abs/2601.06897), ASL straightening
Gröbner order (variables increasing along the poset); [Reichstein Theorem 1.7](https://personal.math.ubc.ca/~reichst/sagbi.pdf) and
[Thiéry–Thomassé](https://arxiv.org/abs/math/0607380),
permutation SAGBI criterion; [Kogan–Miller](https://arxiv.org/abs/math/0303208),
flag toric degeneration. These examples are intrinsic specification targets, not instructions to copy
an external implementation.
