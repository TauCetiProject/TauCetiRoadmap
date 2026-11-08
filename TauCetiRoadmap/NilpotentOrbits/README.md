# Nilpotent orbits, Springer resolution and subregular geometry

Build the complex nilpotent cone as an algebraic variety with its actual adjoint
action, orbit and centralizer API, polynomial exponential comparison, and resolution.
Then construct the transverse subregular surfaces, their exceptional curves and
component actions, and compare their intersection lattices with the oriented
root and coroot data. Suggested home: `TauCeti/Algebra/Lie/Nilpotent/` for the
linear-algebraic dictionaries and `TauCeti/AlgebraicGeometry/Nilpotent/` for the
schemes, actions and resolutions.

## Scope and conventions

The principal setting is a smooth connected adjoint semisimple affine algebraic
group G over ℂ and its finite-dimensional complex Lie algebra 𝔤. Use the
ReductiveGroups Hopf-algebra, scheme and represented-points dictionaries for the
same G, and their actual differential and adjoint maps. Keep smoothness,
connectedness, affineness, finite type, adjointness and semisimplicity as separate
hypotheses. No new monolithic algebraic-group class is introduced.

For semisimple central isogenies construct the differential isomorphism and
its nilpotent-cone, orbit-set, orbit-closure and dimension comparisons.
Centralizers and their component groups require their actual separate maps;
they are not asserted invariant. The exponential chapter also treats
connected reductive complex groups, using zero central coordinate for their
nilpotent cone and genuine unipotence in a faithful representation. In a
reductive Lie algebra, ad-nilpotence alone includes the entire center. In a
nonadjoint group, Ad-unipotence can include nontrivial central semisimple
elements. Neither test replaces the stated targets.

Use native `LieAlgebra.ad`, `LieDerivation`, `IsNilpotent`, `Module.End.IsSemisimple`
and `IsSl2Triple`. A triple is ordered (h,e,f), with [h,e]=2e,
[h,f]=−2f and [e,f]=h. Native `IsSl2Triple` requires h≠0, so existence
statements using it assume e≠0; zero is treated directly. A slice associated
to such a triple is S=e+ker(ad f). Choose the positive Borel B with Lie
algebra 𝔟 and nilradical 𝔫; the Killing pairing identifies (𝔤/𝔟)* with
𝔫, fixing the convention in T*(G/B)≃G×ᴮ𝔫. All maps must respect this
choice and have change-of-Borel and change-of-triple comparisons.

The nilpotent scheme is the zero fiber of the specified adjoint quotient, with
its scheme structure. Its complex points equal the ad-nilpotent elements in
the semisimple setting. An equality about complex points is not an equality
of schemes or an assertion about arbitrary nonreduced coefficient rings.
In particular, a matrix being nilpotent over such a ring does not by itself
make all of its characteristic coefficients zero. Carry the defining
invariant equations through every functor-of-points statement. N5 defines the
unipotent variety as a reduced closed subscheme over ℂ, independently of a
faithful representation. Every test-algebra comparison base-changes that fixed
scheme; taking a new reduction after base change would change the functor.

## Prerequisites and ownership

| Supplier | Exact material consumed |
| --- | --- |
| Mathlib Lie and linear algebra | Endomorphism Jordan–Chevalley existence and uniqueness over perfect fields; native Lie derivations, Killing innerness and center-free adjoint injectivity; native nonzero sl₂-triple vocabulary. |
| [LieHighestWeight Layers 0–2 and 7](../RepresentationTheory/LieHighestWeight/README.md) | Complete finite-dimensional sl₂ theory, Cartan/root and generalized-weight decompositions, representation semisimplicity and the Lie invariant restriction maps. |
| [RootSystems](../RepresentationTheory/RootSystems/README.md) | Finite roots, oriented Cartan matrices, bases, Weyl action, rank and component decompositions. |
| [ReductiveGroups Layers 0–9, 11C](../ReductiveGroups/README.md) | Actual algebraic Lie/adjoint dictionary, smooth homogeneous quotients and centralizers, group Jordan decomposition, genuine unipotence, Borels and flags, root subgroup/cocharacter and central-isogeny maps, and the full algebraic adjoint quotient. |
| [ReflectionInvariantTheory](../ReflectionInvariantTheory/README.md) | Finite-W invariant algebra and the actual Cartan quotient, compared with the same adjoint quotient. |
| [LieGroups generic Layers0–7](../RepresentationTheory/LieGroups/README.md#layer-7-complexification-and-real-forms) and the cited local analytic/realification suppliers | Finite-dimensional integration and the tangent/realification/global holomorphic exponential on an already-given complex group; these generic maps precede the FCO lower dictionary and use no FCO compact-form output. The local analytic prefix uses ComplexKahlerGeometry K3.0/K1, ComplexComparisonPartII C−1.1 and the named realification maps, without proper GAGA. |
| [FormalConnectionsOpers F2.4 and lower F4.3](../FormalConnectionsOpers/README.md#f2-algebraic-sheaf-connections-and-differential-operators) | On the same native Hopf-points carrier: Maurer–Cartan/cotangent rank, fixed complex atlas, tangent/counit derivation bracket comparison, analytic connectedness by algebraic root generation, and the actual central-torus/closed-derived/finite-isogeny dictionary. This is before compact-form invocation. |
| [LieGroups Layer7 algebraic compact-form specialization](../RepresentationTheory/LieGroups/README.md#layer-7-complexification-and-real-forms) | Apply the specialization to this actual smooth connected affine reductive complex G with RG1's faithful closed representation and the lower FCO point/tangent/center/derived data. Construct its compact embedded real form and complexified differential, using the independent compact semisimple integration/metric/Hopf–Rinow/Bonnet–Myers inputs. No exceptional or positive-octonion G2 application is a premise. |
| [CharacteristicClasses C5.1](../CharacteristicClasses/README.md#c5-compact-lie-restriction-and-universal-rational-rings) | Homogeneous compact Chevalley restriction using LG5A/6's actual invariant metric, center/derived splitting and geometric root/Weyl comparison; independent LHW7 Lie-Chevalley/Killing/coadjoint restriction square; compact group versus infinitesimal invariants, center tensor and finite-degree real descent. Its universal-ring/transgression chapters are not inputs here. |
| [FormalConnectionsOpers finite F4.3 exports](../FormalConnectionsOpers/README.md#f4-intrinsic-opers-and-the-dskostant-slice) | The entire invariant adapter after those inputs: matched algebraic/compact torus and pinning, Zariski-density/coaction comparison, actual Cartan restriction, Q descent and flat base change to char0 split fields. Then consume its existing finite principal triple, exponent basis, Kostant slice and regular-nilpotent/simple-root/unique-Borel theorems. The later loop-gauge, oper and quantum-center applications are not prerequisites here. |
| [AlgebraicVectorBundles](../AlgebraicVectorBundles/README.md) | Locally free sheaves, dualized total spaces, tangent/cotangent bundles and their map/base-change API. The associated Springer bundle and its Killing identification are constructed below. |
| [ComplexKahlerGeometry](../ComplexKahlerGeometry/README.md) and scheme/commutative-algebra foundations | Complex-point/analytic comparisons when used; regular local rings, dimensions, divisors and intersection degrees. The particular surface resolutions and intersection calculations remain targets here. |

Use the finite principal exports from F4.3 once; do not construct a second
principal triple, Kostant section, invariant-algebra engine or regular-nilpotent
classification. The phase order is generic LG tangent/realification/exp →
FCO lower algebraic-point/tangent/center/derived dictionary → LG algebraic
compact-form specialization → LG5A/6 geometric maps and C5.1 restriction →
the full FCO invariant/descent adapter → finite principal/regular exports.
Independent LHW7 and finite-W algebra enter before C5.1; they do not consume
its output. N1 consumes the invariant adapter, whereas N2 consumes the finite
principal/regular exports. Read the finite cut by its actual sentence before
F4.3's `d+f+v(t)` gauge construction, not as the whole oper unit. The comparison maps from those exports to the objects below
are targets here. FCO's oper, loop and affine/deformed Springer constructions
remain its consumers and are not prerequisites of finite nilpotent geometry.
ReductiveGroups' signed integral Jacobi and pinned fixed-Lie folding theorems
are independent of this roadmap; its geometric folding application consumes
the final chapter below.

For a geometric foundation invoked below that is not yet implemented, construct
the named specialization at its indicated phase. In particular N1 owns the
flag-incidence and associated-bundle constructions, N2 the orbit-openness and
characteristic arguments, N7 the resolution and cone local-ring calculations,
and N8 the surface divisors and intersection pairing. N5.0 constructs the
zero-fiber reducedness and complete-intersection prerequisites before the
exponential factors through coordinate ideals; N7 consumes these results for
normality and resolution geometry. A reference to a flag,
cotangent bundle, smooth source or root diagram does not supply those maps.

## N0. Internal Jordan decomposition and adjoint orbits

1. Compare the actual Lie algebra of G with its native finite-dimensional
   Killing Lie algebra and every faithful closed representation used below.
   Export the tangent, bracket, adjoint and differential equations, compatibility
   with central isogenies, products and change of faithful representation.
   Define semisimple and nilpotent elements through the actual adjoint
   endomorphism in the center-free setting.
2. Construct internal Jordan decomposition x=xₙ+xₛ, with [xₙ,xₛ]=0,
   ad(xₙ) nilpotent and ad(xₛ) semisimple. Native endomorphism decomposition
   does not already put its parts inside 𝔤. For a Lie derivation D prove
   that its semisimple part acts by λ on each generalized λ-eigenspace and
   that brackets of generalized λ and μ vectors lie in the generalized
   λ+μ space. This proves its semisimple part satisfies Leibniz; subtraction
   gives the nilpotent part. Apply this to ad(x), consume native
   `LieDerivation.IsKilling.exists_eq_ad` and center-free injectivity, and
   reconstruct the two elements in 𝔤. Prove uniqueness, equivariance,
   compatibility with products and faithful representations. Polynomial
   expressions in D are not presumed to be derivations merely because they
   are polynomial expressions.
3. Construct algebraic stabilizers and centralizers and compare their tangent
   Lie algebras with ker(ad x). For the actual adjoint action construct the
   locally closed smooth orbit Oₓ, its homogeneous quotient G/C_G(x),
   tangent [𝔤,x], and dimension dim G−dim C_G(x). Supply orbit maps,
   differential/kernel laws, equivariant transport, products, closure
   inclusions and the conjugacy equivalence relation. Characteristic zero
   supplies smooth stabilizers through the existing group-scheme dictionary;
   prove the application hypotheses.
4. Distinguish the centralizer as a group, its Lie algebra, its identity
   component, its finite component group and its action on each geometric
   object. Export inclusion/conjugation and central-isogeny maps. Define a
   regular element by minimal centralizer dimension. These internal Jordan,
   orbit and centralizer constructions form the independent N0 lower phase;
   the actual comparison with FCO F4.3's finite regular export is made in
   N2.3 after that export, not used as a premise here.

## N1. The cone, quotient and early incidence construction

1. Use O(𝔤)=Sym(𝔤*) with the actual dual-space convention. Construct χ:𝔤→𝔤//G
   from RG11C's invariant algebra and compare its pullback with the Cartan
   quotient and FCO's finite invariant maps. Define 𝒩=χ⁻¹(0), retaining the
   augmentation at the origin and the full coordinate ideal. Prove its
   closedness, G-equivariance, scalar action and base-change equations.
   On complex points prove x∈𝒩 iff ad(x) is nilpotent, using N0 and
   invariant separation of semisimple orbits. Retain the scheme structure;
   reducedness and the complete-intersection structure are proved in N5.0.
2. Construct the flag variety ℬ=G/B as the actual quotient parametrizing
   Borel subgroups and Lie Borel subalgebras, with their universal subbundle
   and nilradical subbundle. Prove properness and smoothness of ℬ and the
   precise quotient/subbundle point dictionaries. Construct the closed
   incidence scheme {(x,B′):x∈Lie Rᵤ(B′)} in 𝔤×ℬ and its associated-bundle
   isomorphism G×ᴮ𝔫. Prove the total space smooth and irreducible and its
   projection to 𝔤 regular, proper and with image in 𝒩. Properness follows
   from the closed incidence realization over proper ℬ, not from a vector
   bundle projection being proper.
3. Prove every nilpotent complex element belongs to a Borel nilradical,
   supplying the Engel/solvable-subalgebra and Borel-containment steps and
   their comparison with the algebraic group. Thus the incidence projection
   is surjective onto the cone on complex points. Prove the corresponding
   topological image equality and deduce irreducibility of the cone. This
   early incidence construction does not assume the later birational
   resolution or a previously established dense regular orbit.
4. Export rank, dimension and product conventions, including the zero Lie
   algebra: its cone is a point and its only orbit is zero. For reductive
   groups separately compare the zero-central-coordinate cone with the
   larger ad-nilpotent locus z(𝔤)×𝒩(𝔤_der).

## N2. General triples, finite orbits and the dense regular orbit

1. Prove Jacobson–Morozov for each nonzero nilpotent e with native
   `IsSl2Triple h e f`, and construct the corresponding Lie embedding and
   algebraic SL₂ homomorphism into the actual G. Pin its differential and
   cocharacter, including the possible central kernel. The zero element
   has the separate degenerate bracket data (0,0,0); it is not an instance
   of the native nonzero predicate. Prove conjugacy of triples with fixed
   e by the appropriate identity-component/unipotent centralizer maps.
2. Normalize a triple's h into the chosen dominant Cartan. Prove its simple
   root values are in {0,1,2}, and construct the associated integer grading,
   cocharacter parabolic, its connected grade-zero centralizer and the
   grade-two action. The sl₂ decomposition proves [𝔤(0),e]=𝔤(2); use
   the differential/orbit dictionary to prove that each such e has an
   open centralizer orbit in the irreducible grade-two space. Two such
   open orbits coincide. Prove the actual uniqueness and change-of-triple
   laws, giving an injection of nilpotent orbit classes into the finite
   set of weighted diagrams, and hence finiteness. Neither the {0,1,2}
   bound nor conjugacy of equal characteristics is assumed as a table.
3. Consume the existing principal/regular nilpotent orbit and unique-Borel
   theorem from FCO F4.3. Here compare N0's independently defined minimal-
   centralizer regular locus with this finite export through the actual
   Lie/group dictionary. Compare the chosen positive/negative conventions
   by actual conjugation. Prove the regular orbit is open and dense in
   𝒩 and its closure is all 𝒩. Derive dim 𝒩=dim 𝔤−rank 𝔤 and the
   centralizer dimension rank 𝔤. Compare the principal element with the
   open set of nonzero simple-root coefficients in each Borel nilradical.
4. Construct the finite quotient of nilpotent elements by actual G-conjugacy,
   chosen representatives and their conjugacy witnesses. Two elements
   are conjugate exactly when their normalized weighted diagrams agree.
   Define the closure order by Oⱼ⊆closure(Oᵢ), prove it is a partial
   order and express every orbit closure as the finite union of its lower
   orbits. Prove strict boundary orbits have smaller dimension. Export
   centralizer-dimension, product and central-isogeny equations. The
   representatives and conjugators are choices, with change-of-choice laws;
   the explicit partition/dominance classification in type A is N4.

## N3. Subregular strata and semisimple products

For a nonzero simple 𝔤 construct the unique subregular orbit and prove
its closure is 𝒩 minus the regular orbit, an irreducible closed subset
of codimension two. Construct its actual centralizer and tangent dimension
criteria and the open inclusion into that complement. Prove uniqueness and
the codimension statement by the root/centralizer stratification, with
its exact rank-one calculation, rather than only drawing an orbit diagram.
For rank one the subregular orbit is {0} in the two-dimensional cone.

For 𝔤=∏ᵢ𝔤ᵢ prove the cone and regular orbit are the corresponding products.
The nonregular complement is the union of products in which at least one
simple factor is nonregular. Prove its irreducible components are indexed
by a single subregular degeneration in one nonzero simple factor, their
codimensions and intersections. Do not assert irreducibility for a product
with several nonzero factors. Rank zero has no subregular orbit. Export
these statements under the actual central-isogeny and component-label maps.

## N4. Type A: Jordan chains, partitions and dimensions

Construct Jordan-chain bases for nilpotent n×n complex matrices and recover
the partition from the sequence dim ker(Xᵏ), proving its invariance,
uniqueness and completeness for conjugacy. Build the actual conjugator
between equal block forms. Compare GLₙ and SLₙ conjugacy by an explicit
centralizer determinant correction over ℂ, retaining n=0 and n=1 cases.
Construct the trace-zero inclusion, not a separate private matrix carrier.

For partition λ prove the endomorphism centralizer dimension Σⱼ(λ′ⱼ)²
using homomorphisms between Jordan chains. For n>0 its intersection with
slₙ has dimension Σⱼ(λ′ⱼ)²−1; prove trace surjectivity using the identity
and characteristic zero. Thus the orbit has dimension
n²−Σⱼ(λ′ⱼ)². Construct the corresponding algebraic group centralizer,
its units/open-locus comparison and the same dimension, and compare with N0.
The regular partition is (n), and for n≥2 the subregular partition is
(n−1,1). Verify their dimensions and codimension two; for n≤1 the cone
is a point and there is no subregular partition. Develop the dominance
criterion for orbit-closure containment by explicit rank inequalities,
degenerations between block forms and their converse, retaining scheme
and set-level claims separately.

## N5. Polynomial exponential and genuine unipotents

### N5.0. Reduced zero fiber before polynomial factorization

Prove that N1's specified zero-fiber scheme is reduced and a complete
intersection before using reducedness to factor any polynomial map. Choose
homogeneous positive-degree polynomial generators f1,...,fr of the invariant
algebra, retaining the independent degree-one central coordinates in the
reductive case. Their augmentation ideal defines the same zero fiber; give
change-of-generator comparisons without asserting a canonical generator choice.
Use N1's irreducibility and N2's dimension dim 𝔤−r to prove height r of the
ideal (f1,...,fr). Apply the regular-sequence criterion in the polynomial
coordinate ring to obtain the complete-intersection and Cohen–Macaulay
properties and absence of embedded associated primes. Supply the polynomial-
quotient regular-sequence, associated-prime and generic-reduced comparison
lemmas used here, consuming native commutative algebra where available. From F4.3's actual finite
Kostant section, prove that dχ is surjective on the regular nilpotent orbit,
with its G-transport and the central-coordinate projection. The zero fiber is
therefore generically smooth and generically reduced. Deduce reducedness from
these commutative-algebra statements, with the actual ideal-radical equality.
Include products, the reductive center and the rank-zero point. This proof
uses no slice, Springer resolution or N7 normality theorem.

### N5.1. The fixed unipotent scheme and its defining ideal

For a faithful closed representation ρ:G→GL(V), let Jρ⊂O(G) be generated by
the coefficients of det(TI−ρ(g))−(T−1)^dim(V). Construct the closed subscheme
𝒰_G with defining ideal I_U=√Jρ. Prove that its complex points are exactly
the genuinely unipotent elements. Use the characteristic-zero Jordan and
representation dictionary and the affine Nullstellensatz to prove √Jρ is
independent of ρ. Use native `Ideal.radical` and
`MvPolynomial.vanishingIdeal_zeroLocus_eq_radical` after a finite polynomial
presentation of O(G); construct the quotient and point-evaluation adapters
for this presentation. Thus 𝒰_G is the reduced closed subscheme supported on
these points, with its specified embedding into G. Construct conjugation and
inversion, comparisons for products of groups, central-isogeny and change-
of-representation maps on these fixed schemes, including their equations
on coordinate rings.

For each complex algebra A, use the base change (𝒰_G)_A and retain the whole
ideal I_U in its A-point equations. Neither the equations Jρ alone nor the
condition that ρ(g)−I has some vanishing power defines this A-point functor.
As a required test take G=G_m. The representation into GL1 gives Jρ=(t−1),
whereas diag(t,t^−1) gives Jρ=((t−1)^2); their radicals agree. Over
A=ℂ[ε]/(ε²), the latter unsaturated equations admit t=1+ε, whose matrix
logarithm has nonzero central coordinate. The fixed 𝒰_G is the identity
scheme and excludes that A-point, matching the zero-central-coordinate cone.
Prove these ideal and test-point equations explicitly. The reduced-variety
convention and exponential comparison are recorded in
[Bertoloni Meli–Imai–Youcis, §2.1, Proposition 2.3](https://arxiv.org/html/2203.01768v3#S2.SS1).

### N5.2. Polynomial maps, ideal factorization and inverse laws

Choose a positive uniform bound N for a faithful representation. Derive the
bound on the universal nilpotent matrix from its characteristic coefficients:
they are positive-degree invariant functions in N1's augmentation ideal, so
Cayley–Hamilton gives X^N=0 in the actual coordinate ring. On 𝒰_G the
characteristic equations lie in I_U and similarly give (U−I)^N=0. Enlarge a
zero-dimensional representation by a trivial line when a positive bound is
needed; retain the rank-zero group. Construct the regular matrix polynomials
exp_N(X)=Σ_(k<N) X^k/k! and
log_N(U)=Σ_(1≤k<N) (−1)^(k+1)(U−I)^k/k over ℚ-algebras.

Consume Mathlib's existing `IsNilpotent.exp`, `exp_eq_sum`, `map_exp` and
unit/inverse laws. Prove exp_N equals that native exponential under the
stated vanishing-power hypothesis; export bound independence and ring-map
naturality. Use TauCeti's `RingTheory/Nilpotent/Exp` unit and divided-power
comparisons on their actual ℚ-algebra carriers. When comparing RG's integral
root-subgroup models, consume `RingTheory/Nilpotent/BaseChangeAction` only
with its supplied stable lattice, divided-power preservation and parameter-
ring algebra hypotheses; it is not a general unipotent-scheme constructor.
The polynomial logarithm and its inverse-series identities remain targets.

First prove on complex points that exp_N(X) lies in G and is genuinely
unipotent, by the following same-carrier construction owned here. Apply
F2.4/F4.3's lower dictionary in
[FormalConnectionsOpers](../FormalConnectionsOpers/README.md) to H=G(ℂ), on its
fixed native Hopf point carrier, with its finite-dimensional Hausdorff complex
Lie-group atlas. Let θ_G identify the algebraic counit-derivation Lie algebra
with H's analytic `GroupLieAlgebra`, using the inverse of that dictionary's
tangent comparison. Transport the faithful closed representation and its
algebraic differential through the actual point and tangent comparisons;
prove its point map ρ(ℂ) is a holomorphic group homomorphism and its analytic
differential is the transported dρ. Consume
[LieGroups Layers0 and3](../RepresentationTheory/LieGroups/README.md#layer-0-the-exponential-map-and-one-parameter-subgroups)
and the generic pre-compact-form Layer7 realification/global-exponential
interfaces, with their finite-dimensional, smooth, Hausdorff and boundaryless
real-model hypotheses. For E_G(X)=exp_H(θ_G X), their homomorphism naturality and
matrix/unit comparison give the actual equation
ρ(ℂ)(E_G(X))=exp_matrix(dρ(X)).

Prove this matrix value equals exp_N(dρ(X)): use native
`NormedSpace.exp_eq_tsum_rat`, the vanishing of every power of degree at least N,
and the finite-support sum comparison, on the finite-dimensional complex
matrix algebra and its rational scalar restriction. Compare with
`IsNilpotent.exp_eq_sum` and consume
`IsNilpotent.isNilpotent_exp_sub_one` to obtain genuine unipotence. Thus the
polynomial matrix is the faithful image of the displayed actual G(ℂ)-point,
and lies in N5.1's fixed unipotent scheme on complex points. Retain the point,
faithful-image equation, tangent/naturality diagrams, change-of-representation
comparisons and conjugation equations as outputs of this construction. This
pointwise bridge uses generic Lie-group exponential theory; no exponential
isomorphism for a noncommutative Borel radical is assumed.
For unipotent u construct the polynomial curve
c_u(t)=Σ_(j<N) binomial(t,j)(u−I)^j. Prove c_u(m)=u^m for nonnegative
integers m, its determinant is1, and c_u(t+s)=c_u(t)c_u(s). The integer
points are Zariski dense, so the closed embedding of G makes c_u a group
morphism G_a→G. Compute its derivative at0 as log_N(u); the tangent
map puts this logarithm in Lie G, and the Jordan/representation dictionary
puts it in the zero-central-coordinate cone. Retain the actual maps and
the differential equations, not just the existence of a one-parameter group.
Then use N5.0's reduced source and I_U's radical definition to prove
actual pullback ideal containments for both maps. Give the induced coordinate-
ring homomorphisms, not only point-set factorizations. Reducedness here is available before it is used.

Prove the two truncated formal-series identities in these universal quotient
rings. Use the faithful closed embedding and its injective differential to
obtain inverse scheme morphisms 𝒩≃𝒰_G. Export their conjugation equivariance,
bound and representation independence and compatibility with every complex-
algebra base change. The all-A statement follows by base-changing these fixed
morphisms and ideals, without replacing either scheme by a new A-point
nilpotence condition. An analytic exponential alone does not supply this step.

Compare central isogenies on these schemes and show the genuine unipotent
lift is unique, distinguishing the full preimage that can include central
semisimple factors. In adjoint semisimple G compare genuine unipotence with
Ad-unipotence. In a connected reductive G retain the genuine target and zero
central coordinate. In SL₂, −I has trivial adjoint action but is not
unipotent; include this boundary. Supply the exp/log formulas on root
subgroups and nilradicals and their compatibility with N1's universal
nilradical bundle and N4's Jordan blocks.

## N6. Slodowy slices and transverse geometry

For each nonzero nilpotent e and chosen triple, construct S=e+ker(ad f)
as a closed affine subspace, its embedding in 𝔤 and the actual direct
sum 𝔤=[𝔤,e]⊕ker(ad f) supplied by finite-dimensional sl₂ theory.
Prove transversality of G×S→𝔤 at the orbit and the corresponding smooth
local morphism statements, then the change-of-triple equivariances.
For e=0 use S=𝔤 directly. Construct the contracting action
t·(e+v)=t²Ad(λ(t⁻¹))(e+v), prove it extends to t=0 with limit e,
and compute its positive weights on ker(ad f). Construct χ|S and its
zero fiber S∩𝒩; prove the relevant flatness and dimension statements
from the actual graded maps and quotient rather than a dimension name.

For subregular e in a simple factor prove S∩𝒩 is a normal surface
with its unique singular point e, and compute its tangent and local ring.
For rank one this is the A₁ cone in sl₂ with e=0. For a product,
specify the one-factor degeneration and compare the slice with the
regular factors; arbitrary product orbits need not have surface slices.
The full centralizer C_G(e) is not assumed to preserve S. The triple
centralizer C_G(e,h,f) does preserve it and acts on its quotient fibers.

## N7. Springer resolution and cone geometry

Complete N1's incidence construction by the Killing isomorphism
T*ℬ≃G×ᴮ𝔫, with inverse, bundle projection, G-action and universal
point equations. Under this equivalence μ([g,x])=Ad_g(x). Prove μ
regular and proper with a smooth source, and prove it is birational and
an isomorphism over the regular nilpotent orbit by the existing unique-Borel
theorem. A resolution of a singular cone is not asserted to be a smooth
morphism: in sl₂ the fiber over zero is ℙ¹ while regular fibers are points.
Construct every Springer fiber as the actual scheme-theoretic fiber and
compare its reduced complex-point description with containing Borels.

Consume N5.0's actual reduced zero-fiber and complete-intersection theorems.
Prove flatness of the invariant quotient and normality of 𝒩 in the stated
characteristic-zero semisimple scope. Supply the local-ring calculations,
the Cohen–Macaulay/S2 consequence and the smooth regular locus with its
codimension-two complement required for Serre's normality criterion.
Compare with the original quotient-ideal scheme, retaining products and
the rank-zero point; the earlier reducedness is not inferred from a
set-level incidence image or from this resolution.

Pull μ back to the chosen slice. Prove the resulting total space is smooth,
the map to S∩𝒩 proper and birational, and in the subregular case a
minimal surface resolution. Give the actual fiber-product maps and their
equivariance; smoothness of the source after this base change is a theorem,
not a general property of arbitrary base changes of a resolution.

## N8. ADE surfaces and exceptional intersection lattices

Construct local or completed-local isomorphisms, with inverses, between
the actual subregular surface germ and the appropriate hypersurface:
xy+zᵐ⁺¹=0 for Aₘ (m≥1); x²+y²z+zᵐ⁻¹=0 for Dₘ (m≥4);
x²+y³+z⁴=0, x²+y³+yz³=0 and x²+y³+z⁵=0 for E₆,E₇,E₈.
Use isomorphisms of the complete local ℂ-algebras at e and at the origin,
with the defining maximal ideals and continuous inverse maps. Lift them
to isomorphisms of the completed resolved neighborhoods over those rings.
Compare their special fibers and first infinitesimal neighborhoods to
transfer the actual exceptional curves and normal-bundle intersection
degrees to the algebraic Springer resolution. Construct these completion
and comparison lemmas at this phase. Do not assert a global polynomial
isomorphism from a germ calculation. Treat D₃ as A₃ through an explicit
reindexing.

Resolve these particular surfaces by explicit charts and proper maps,
proving their identification with the restricted Springer resolution.
Construct all exceptional irreducible curves, show each is ℙ¹, prove
their transversality/incidence and self-intersection −2, and compute the
full intersection pairing on their free integral divisor lattice. Prove
the negative matrix is the specified ADE Cartan matrix through an actual
component-index bijection, including the rank and determinant. Construct
the root and coroot pairing and its change-of-label maps. The divisor,
normal-bundle degree and local intersection-multiplicity lemmas needed
for these surfaces are included here with their full basic API.

For simply laced 𝔤 the exceptional graph has its corresponding ADE
type. The nonsimply-laced subregular surface types are Bₙ→A₂ₙ₋₁,
Cₙ→Dₙ₊₁, F₄→E₆ and G₂→D₄, with explicit small-rank identifications
and rank restrictions. These are surface types, not already the fixed-Lie
folding output. This dictionary and the transverse setup are discussed in
[Lehn–Namikawa–Sorger, introduction and §2](https://arxiv.org/html/1002.4107v2).

## N9. Component actions and the oriented folding comparison

Construct the action of the triple centralizer C_G(e,h,f) on S, its
nilpotent fiber and restricted resolution. Independently construct the
full C_G(e) action on the Springer fiber. Prove the Levi/unipotent-radical
comparison and the induced isomorphism of their component groups in the
stated characteristic-zero setting. Compare the two actions on exceptional
components. Prove the identity component acts trivially on the finite
component set and construct the effective finite diagram action, with its
kernel, orbit maps and central-isogeny/change-of-triple comparisons.

Identify the full effective action rather than choosing a generator from
the picture. For the G₂ subregular surface of type D₄, distinguish the
full S₃ component action from an order-three triality subgroup, constructing
both and their actual permutations when used. The same underlying D₄ curve
occurs for C₃ with S₂ action and for type D₄ with trivial effective component
action; keep the input Lie type and its actual action in every comparison. The relevant centralizer action on Dynkin curves
is studied in [Goodwin–Hille–Röhrle](https://arxiv.org/abs/math/0608579);
the action and its comparison maps are construction targets here.

From the integral exceptional intersection lattice construct the actual
invariant/coinvariant lattices, index maps, length factors and root/coroot
pairing. Compare them with ReductiveGroups 9A.1b's pinned fixed-Lie
construction, respecting the actual group action and oriented Cartan
entries. In particular A₂ₙ₋₁ fixed-Lie folding gives Cₙ, whereas the
corresponding subregular input above was Bₙ; Dₙ₊₁ fixed-Lie folding gives
Bₙ, whereas that geometric input was Cₙ. Prove the dual comparison rather
than silently identify these root data. F₄ and G₂ also require the explicit
long/short coroot transport even though their type names are self-dual.
Export the full diagram, lattice and Lie comparison squares for that
consumer. No geometric McKay equivalence, universal deformation theorem,
perverse-sheaf construction or Springer representation is an unstated
premise of this finite surface library.

## Validation and proof order

`Suggested.lean` contains native lower-interface prototypes and honest
construction targets. It is secondary to this specification and is not
an exhaustive list of its obligations. Imported theorems are used with
their actual field, finite-dimensional and nondegeneracy hypotheses.

The order begins with native/LHW/RG algebraic and independent local
analytic/smooth floors. Generic LG7 tangent/realification/exp precedes the
lower FCO dictionary; its actual data precede the LG algebraic compact-form
specialization. LG5A/6 and independent LHW7 feed C5.1, then FCO's entire
invariant/coaction/rational-descent adapter. N0 lower internal Jordan and
orbit/centralizer maps are independent of the FCO regular-locus comparison.
N1 consumes the algebraic quotient and invariant adapter and constructs early
incidence/irreducibility. FCO retains its finite principal/regular theorem;
any shared Jordan/centralizer calculation can use the independent N0 lower
phase. Only after that finite export does N2.3 compare N0's independently defined
regular locus; N2 constructs the general triples/finiteness/dense regular orbit.
Continue with N3/N4, then N5.0 zero-fiber reducedness/complete intersection →
N5.1 fixed reduced unipotent scheme → N5.2 polynomial ideal factorizations →
N6 slices → N7 birational resolution/normality/local rings → N8 exceptional
curves → N9 actions and RG folding comparison. N1 uses no
N7 birationality for its image or irreducibility. No later FCO affine/oper/
quantum-center, LG exceptional/G2/flag, compact BG/transgression or cameral
fundamental-group theorem feeds back into this finite prerequisite chain.
