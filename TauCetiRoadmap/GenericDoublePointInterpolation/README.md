# Roadmap: generic double-point interpolation

**Summary.** This roadmap builds value-and-first-derivative interpolation for multivariate
polynomials, the projective double-point theorem that supplies its generic
rank, and a nonvanishing polynomial minor that gives small integer coordinates.
The reusable objects are the bounded polynomial submodule, its coefficient
basis, the native square-zero first-jet algebra, finite double-point quotients,
and universal interpolation matrices. The geometric argument develops the
restriction-rank and residual/trace tools needed for ordinary and differential
Horace induction.

The final theorem is the following. Let k be a field of
characteristic zero, let r,n≥1 and d≥5, and suppose

    m = n(r+1) ≤ N(r,d) = choose(r+d,d).

There is a nonzero polynomial Δ with integer coefficients in the rn point
coordinates such that its principal open is nonempty and every tuple on that
open consists of distinct points and admits arbitrary values and first partial
derivatives of a polynomial of total degree at most d. One can choose such a
tuple with all integer coordinates between 0 and md. This is a theorem about a
nonempty open set of configurations. For example, seven distinct collinear
points in the affine plane have rank 11 in degree 5 although m=N(2,5)=21.

The projective input is the degree-d≥5 range of the Alexander–Hirschowitz
theorem. The plane, cubic and quartic results are included as the bases of its
proof, with their exceptional triples stated explicitly. The proof uses
Brambilla–Ottaviani's plane contact argument, codimension-three cubic
specializations, and differential Horace induction. Couveignes's interpolation
matrix and integer-box argument give the affine and effective endpoint.
These sources support different parts of the development; the native algebraic
comparisons below specify how those parts fit together.

## Scope and ownership

This roadmap owns bounded-degree coefficient coordinates, the native-carrier
adapter for fixed-degree homogenization, first jets, double-point interpolation,
the Veronese and plane specializations, the squared-point families used in its
Horace proof, and the universal minor. General projective bundles and twisting
cohomology belong to AlgebraicModuliForArithmeticGeometry §§1.1–1.2;
determinantal loci and Hilbert functors belong to its §§1.7 and 2.1. General
ideal-sheaf quotient comparisons and Bézout belong to SchemeAndStackFoundations
§§0.28 and 5.12. The exact contracts are listed below.
DiophantineApproximationAndTranscendence §2.7 owns block homogenization and its
dehomogenization identities; the adapter here restricts its one-block case to
the native bounded and homogeneous submodules. This roadmap also owns the Cartier residual sequence (§2.2), finite locally free
pushforward and relative generic smoothness (§2.0), the universal length-two
direction family (§2.4), and plane singular-curve incidence (§3.2). Its compatible
mixed-specialization theorem (§4.3) concerns the specified Horace family. These
constructions use the projective-quotient and ideal-sheaf interfaces just named.

The degree-bounded carrier, its support basis, Euler's homogeneous derivative
identity, finite Chinese remainder and product-grid vanishing are supplied by
Mathlib; the total-degree inclusion and span API is supplied by Tau Ceti.
The coefficient equivalence here specializes the support basis, and the
homogenization equivalence is the native-carrier adapter of the named one-block
supplier. The Veronese morphism is the complete-monomial map from the projective-section
interface; §3.2 owns its construction and tangent and secant-rank calculations.

Arithmetic consumers use the principal-open and integer-box results and supply
their own number-field embedding parametrizations, nonzero pullbacks and
arithmetic counting arguments. IntegralLattices, Layer 0, owns general integral lattice theory;
the metric here is the elementary monomial metric. Higher jets,
positive-characteristic Alexander–Hirschowitz and Waring classification lie
outside this roadmap's scope.

## Conventions

Rings, modules and schemes use a fixed universe u; finite index types stay
small, and the finite parameter type in the pullback theorem may lie in a
separate universe. Lean signatures are polymorphic in those universes.
Geometric lengths over the algebraically closed ground field are dimensions
of the finite coordinate algebra, including its nilpotents.

Write V(R,r,d) for the native submodule
MvPolynomial.restrictTotalDegree (Fin r) R d. Its monomial index is

    A(r,d) = {α : Fin r →₀ ℕ | |α| ≤ d}, where |α| is the sum of its exponents.

Here finite support is Mathlib's Finsupp. The type `Monomials` is A(r,d); `monomialsFintype` supplies its finite type structure in Layer 0. `Bounded` abbreviates the native submodule V(R,r,d). A commutative ring R is sufficient for
coefficient coordinates, homogenization and the jet evaluation formulas.
Dimension and finite quotient statements explicitly use a field. The real
coefficient metric uses R=ℝ. All geometric statements in Layer 2–Layer 5, including
the word *general*, use an algebraically closed field k of characteristic zero
unless an algebraic statement explicitly gives weaker hypotheses.

An ordered affine tuple is P:Fin n→(Fin r→k). A jet row is a pair
(i,z) with z in Option(Fin r): None selects the value and Some j selects the
j-th partial derivative. Thus there are n(r+1) rows, indexed by `JetRows`. We use genuine partial
polynomial derivatives, with exponent coefficients in k; no factorial or
inverse coordinate appears. Products with exponent decrement are zero when
the original exponent is zero. The target is a product of square-zero algebras,
not a product of reduced residue fields.

For projective statements, P^r means projective dimension r and has r+1
homogeneous coordinates. A double point 2P is cut out by the square of its
point ideal sheaf and has length r+1. In a hyperplane H≅P^(r−1), a double point
has length r. Distinct support is a separate hypothesis for all product,
length and degeneration statements. The empty tuple has ideal top and
zero-dimensional quotient; the algebraic carriers also allow r=0 and d=0.
The hyperplane rank inequalities and ordinary Horace estimates use r≥1,d≥1,
so the residual degree d−1 is an ordinary nonnegative polynomial degree.

For a finite subscheme X and a finite-dimensional linear system D of degree d,
write h(X,D) for restriction rank and h(X,d) for the full system. *Independent*
means h(X,D)=length X. *Maximal rank* means h(X,D)=min(dim D,length X), which
means injectivity rather than surjectivity in the overfilled case. AH(r,d,q)
means that q general distinct double points in P^r have degree-d maximal rank.
General assertions mean a nonempty Zariski-open subset of the specified ordered
parameter scheme. They do not quantify over every distinct tuple.

The exceptional triples relevant to the induction are

    d = 2 with 2 ≤ q ≤ r, and (r,d,q) = (2,4,5), (3,4,9), (4,3,7), (4,4,14).

The geometric endpoint uses d≥5 and so has none of these exceptions. The
one-dimensional Hermite theorem uses arbitrary distinct points over any field.
In all division formulas below u is an integer; only in the critical range is
its nonnegativity established. This prevents natural-number subtraction from
silently changing a statement when the dividend is negative.

## Exact supplier contracts

### From Mathlib

The polynomial submodule and basis are supplied at Mathlib commit `6b7abb3c7686292736be2955bd3eb9ebf63b456a`.
Their hypotheses are used as written: in particular, the affine first-jet
identities do not require characteristic zero, while the geometric genericity
arguments do.

| Mathlib declarations | What is reused |
| --- | --- |
| [MvPolynomial.restrictTotalDegree, basisRestrictSupport, mem_restrictTotalDegree, monomial_mem_restrictSupport](https://github.com/leanprover-community/mathlib4/blob/6b7abb3c7686292736be2955bd3eb9ebf63b456a/Mathlib/RingTheory/MvPolynomial/Basic.lean) | The submodule of polynomials of total degree ≤d, its admissible monomials and its restricted monomial basis. |
| [MvPolynomial.pderiv, pderiv_monomial, pderiv_X, pderiv_mul](https://github.com/leanprover-community/mathlib4/blob/6b7abb3c7686292736be2955bd3eb9ebf63b456a/Mathlib/Algebra/MvPolynomial/PDeriv.lean) | Partial differentiation, including the exponent-decrement formula and Leibniz rule. |
| [MvPolynomial.eval, aeval, eval_monomial, aeval_monomial](https://github.com/leanprover-community/mathlib4/blob/6b7abb3c7686292736be2955bd3eb9ebf63b456a/Mathlib/Algebra/MvPolynomial/Eval.lean) | Evaluation and algebra evaluation, including evaluation in square-zero algebras and substitution. |
| [MvPolynomial.homogeneousSubmodule](https://github.com/leanprover-community/mathlib4/blob/6b7abb3c7686292736be2955bd3eb9ebf63b456a/Mathlib/RingTheory/MvPolynomial/Homogeneous.lean) | The native fixed-degree homogeneous submodule. |
| [MvPolynomial.lcoeff](https://github.com/leanprover-community/mathlib4/blob/6b7abb3c7686292736be2955bd3eb9ebf63b456a/Mathlib/Algebra/MvPolynomial/Basic.lean) | Coefficient extraction as a linear map. |
| [Sym.equivNatSum](https://github.com/leanprover-community/mathlib4/blob/6b7abb3c7686292736be2955bd3eb9ebf63b456a/Mathlib/Data/Finsupp/Multiset.lean), [Sym.card_sym_eq_choose](https://github.com/leanprover-community/mathlib4/blob/6b7abb3c7686292736be2955bd3eb9ebf63b456a/Mathlib/Data/Sym/Card.lean) | Degree-d exponent tuples as size-d multisets, and their stars-and-bars count. Only the slack-coordinate adapter is new here. |
| [TrivSqZeroExt, TrivSqZeroExt.inr_mul_inr](https://github.com/leanprover-community/mathlib4/blob/6b7abb3c7686292736be2955bd3eb9ebf63b456a/Mathlib/Algebra/TrivSqZeroExt/Basic.lean) | The existing algebra R⊕M and the vanishing of products of infinitesimal terms. |
| [Ideal.quotientInfRingEquivPiQuotient](https://github.com/leanprover-community/mathlib4/blob/6b7abb3c7686292736be2955bd3eb9ebf63b456a/Mathlib/RingTheory/Ideal/Quotient/Operations.lean) | Finite Chinese remainder for pairwise comaximal ideals. The scalar-compatible algebra upgrade is checked here. |
| [Matrix.rank_of_det_ne_zero, rank_submatrix_le, rank_eq_finrank_range_toLin](https://github.com/leanprover-community/mathlib4/blob/6b7abb3c7686292736be2955bd3eb9ebf63b456a/Mathlib/LinearAlgebra/Matrix/Rank.lean) | Determinant and submatrix rank bounds, and matrix rank as dimension of the range of its represented linear map. |
| [MvPolynomial.eq_zero_of_eval_zero_at_prod_finset](https://github.com/leanprover-community/mathlib4/blob/6b7abb3c7686292736be2955bd3eb9ebf63b456a/Mathlib/Combinatorics/Nullstellensatz.lean) | A polynomial over a domain vanishing on a product of sufficiently large coordinate sets is zero. |
| [MvPolynomial.degreeOf_le_totalDegree](https://github.com/leanprover-community/mathlib4/blob/6b7abb3c7686292736be2955bd3eb9ebf63b456a/Mathlib/Algebra/MvPolynomial/Degrees.lean) | The coordinate-degree bound used for the integer grid. |
| [PrimeSpectrum.basicOpen, mem_basicOpen](https://github.com/leanprover-community/mathlib4/blob/6b7abb3c7686292736be2955bd3eb9ebf63b456a/Mathlib/RingTheory/Spectrum/Prime/Topology.lean) | The principal open D(Δ) and its pointwise membership criterion. |
| [AlgebraicGeometry.Spec, Spec.map, Spec.algebraMap, Spec.map_apply](https://github.com/leanprover-community/mathlib4/blob/6b7abb3c7686292736be2955bd3eb9ebf63b456a/Mathlib/AlgebraicGeometry/Scheme.lean), [AffineSpace.SpecIso, homOverEquiv](https://github.com/leanprover-community/mathlib4/blob/6b7abb3c7686292736be2955bd3eb9ebf63b456a/Mathlib/AlgebraicGeometry/AffineSpace.lean) | Actual affine schemes, evaluation morphisms over Spec k, the polynomial-spectrum identification and the existing affine-space functor of points. |

Mathlib also supplies `MvPolynomial.IsHomogeneous.sum_X_mul_pderiv` in
`Mathlib/RingTheory/MvPolynomial/EulerIdentity.lean` (line 73); it holds over a
commutative semiring, including degree zero.
Use `AlgebraicGeometry.Scheme.Hom.dense_smoothLocus_of_perfectField` in
`Mathlib/AlgebraicGeometry/Morphisms/Smooth.lean` (line 361) for a reduced
scheme locally of finite presentation over a perfect field. This is an
absolute smooth-locus theorem, not the relative contract below.
Use `MvPolynomial.funext` in `Mathlib/Algebra/MvPolynomial/Funext.lean`
(line 82) over an infinite integral domain for the rational realization of
the generic rank locus.

### From Tau Ceti

Tau Ceti supplies the total-degree inclusion and span lemmas in
[RingTheory/MvPolynomial/RestrictTotalDegree](https://github.com/TauCetiProject/TauCeti/blob/a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039/TauCeti/RingTheory/MvPolynomial/RestrictTotalDegree.lean),
including `MvPolynomial.restrictTotalDegree_mono`,
`MvPolynomial.restrictTotalDegree_eq_span` and
`TauCeti.MvPolynomial.apply_mem_of_basis`. Their contracts concern inclusion and linear extension on the
submodule, whereas the targets here add coefficient coordinates, homogenization
and jets.

The sheaf of relative differentials is Tau Ceti
`AlgebraicGeometry.Scheme.relativeDifferentials` in
`TauCeti/AlgebraicGeometry/Modules/Differentials/Basic.lean` (line 85), with
its universal derivation and universal property. Its affine section comparison
is `TauCeti.AlgebraicGeometry.relativeDifferentialsSectionsEquiv` in
`TauCeti/AlgebraicGeometry/Modules/Differentials/Quasicoherent.lean` (line 180).
Use `TauCeti.AlgebraicGeometry.ZariskiTangentSpace` in
`TauCeti/AlgebraicGeometry/TangentSpace/Basic.lean` (line 65) for the dual of
`m / m^2` over the residue field. This tangent carrier alone specifies no
relative differential of a morphism. In §2.0 construct the differential at a geometric point Spec Ω→X by
dualizing the map on relative differentials. Use the Zariski tangent spaces
at the resulting Ω-rational points of X_Ω and Y_Ω. This base change of the
schemes is essential at a nonclosed underlying point.

### From TauCetiRoadmap.AlgebraicVectorBundles

Consume §L0B, quasicoherent and finite locally free sheaves: the affine
finite-projective equivalence, rank, tensor and pullback comparisons. Layer 2
§2.0 adds restriction of scalars along a finite locally free morphism, rather
than a second construction of the finite locally free sheaf carrier.

### From TauCetiRoadmap.DiophantineApproximationAndTranscendence

Consume §2.7, `blockHomogenize`, with one block, affine variables Fin r and
block degree d, over every commutative ring. Use its linearity, monomial and
coefficient formulas, homogeneity and both dehomogenization identities on
bounded inputs and homogeneous outputs. Rename the single homogenizing
variable to None and the affine variables to Some. Layer 0 bundles these
identities into the equivalence of native submodules and its chart comparison.

### From TauCetiRoadmap.SchemeAndStackFoundations

Consume §0.28, IdealPullback: `quotientPresheaf`, `quotientToClosedNatTrans_isIso`
for affine morphisms, and `allOpenSheafComparison` after sheafification.
These do not identify a non-affine global quotient presheaf with all sections.
Consume §2.6, `projectiveSpace_cohomology`, §4.12, `generic_flatness`,
and §5.12, `bezout_inequality`,
with the proper-intersection hypothesis retained for its equality statement.

### From TauCetiRoadmap.AlgebraicModuliForArithmeticGeometry

Consume §1.1, ProjectiveBundles.projectiveBundle and integerTwists, on
quasicoherent modules and their invertible quotient convention; specialize to
the free module of rank r+1. Consume §1.2,
ProjectiveBundles.projectiveBundle.projectiveSpaceCechComparison, over a
commutative ring, with q=0 and nonnegative twist d: use its natural coefficient
basis comparison, together with the native H⁰/global-section equivalence.
Layer 0 owns its chart-normalized polynomial adapter.
Consume §1.7, rankLocus, for maps between finite locally free sheaves and
its scheme-theoretic base-change law. Consume §2.1, hilbertFunctorAsQuot,
for separated morphisms of finite presentation, parametrizing finitely
presented flat proper closed subschemes. Layers 1–2 and 4 construct the
squared-point specializations and construct the direction family of §2.4.

## How to read the build

Layer 0 fixes coefficient and section coordinates. Layer 1 identifies first
jets with doubled points. Layer 2 supplies finite locally free sections, relative generic smoothness,
restriction ranks, residuals and curvilinear families. Layer 3 proves the plane and cubic bases. Layer 4 uses
ordinary and differential Horace for the projective theorem. Layer 5 constructs
the affine principal open and bounded integer witnesses. The headline signatures
in Suggested.lean use explicit native polynomial and spectrum carriers; the
projective-section and relative-incidence interfaces are specified here.

## Layer 0: Coefficient spaces and fixed homogenization

The bounded space has a native finite monomial basis. This layer exposes that basis as coefficient functions, relates it to homogeneous forms and genuine projective sections, and supplies the real coefficient metric. The cardinality computation builds only the bounded/slack adapter to Mathlib’s multiset equivalence.

### 0.1 The bounded monomial basis

**Binomial count of bounded monomials.** For r,d≥0, the finite set A(r,d)={α:Fin r→₀N | Σα≤d} has cardinality N(r,d)=choose(r+d,d).

Adjoin a slack exponent d−|α| in the None coordinate. This is a bijection with degree-d exponent tuples on Option(Fin r); compose it with Sym.equivNatSum and apply Sym.card_sym_eq_choose. Deleting the slack coordinate proves the inverse formula.
The API has the following properties.

- The Some j coordinate recovers the original exponent α_j.
- The None coordinate is the nonnegative slack exponent d−|α|, using |α|≤d.
- The sum of all homogeneous exponents is d, so deleting None recovers a bounded exponent.

**Checks.**

- For r=0 the unique exponent is zero, giving choose(d,d)=1. At d>0 an extra affine coordinate gives d+1>1; at d=0 both counts are 1, so this boundary is only a positive Check. At d=2 the counts are 1 and 3.
- For d=0 and every r only the zero exponent occurs, giving choose(r,0)=1.
- For r=d=2 the six bounded exponents map to degree-two triples with slack exponents 2,1,1,0,0,0; a coordinatewise degree bound would incorrectly give nine.

*Needs:* `Sym.card_sym_eq_choose` (Mathlib); `Sym.equivNatSum` (Mathlib).

([BO line 18, §1, p.1](https://arxiv.org/pdf/math/0701409v2); [COU line 167, §3, p.491](https://annals.math.princeton.edu/wp-content/uploads/annals-v192-n2-p04-s.pdf)).

**Dimension of bounded polynomials.** For any field k and r,d≥0, finrank_k(MvPolynomial.restrictTotalDegree (Fin r) k d)=N(r,d).

Use basisRestrictSupport on the admissible exponent set. Its cardinality is N(r,d), so the dimension follows from the native finite-basis dimension formula. No extra space of formal coefficient lists is used as the polynomial carrier.

*Needs:* `MvPolynomial.restrictTotalDegree` (Mathlib); `MvPolynomial.basisRestrictSupport` (Mathlib); [Binomial count of bounded monomials](#01-the-bounded-monomial-basis).

([COU line 167, §3, p. 491, bounded polynomial dimension](https://annals.math.princeton.edu/wp-content/uploads/annals-v192-n2-p04-s.pdf)).

**Coefficient coordinates.** For a commutative ring R, identify the native bounded submodule V(R,r,d) with functions A(r,d)→R by a linear equivalence c_d; its α-coordinate is the actual MvPolynomial coefficient.

Restrict the native coefficient representation to A(r,d), then use finiteness to replace the finitely supported coordinate function by an ordinary function. The inverse is the finite sum of admissible monomials, and native polynomial coefficient extensionality proves both inverse identities.

The API has the following properties.

- c_d(f)(α)=coeff_α(f).
- c_d⁻¹(a)=Σ over α∈A(r,d) of a_α X^α.
- f=g iff c_d(f)=c_d(g).

**Checks.**

- For r=2,d=2 the coordinates are 1,x,y,x²,xy,y², six in all.
- For d=0 there is one coordinate and c_0(C a)=a.
- For r=1,d=3 and f=2+3x², coordinates are (2,0,3,0).

*Needs:* `MvPolynomial.basisRestrictSupport` (Mathlib); `MvPolynomial.restrictTotalDegree` (Mathlib); [Binomial count of bounded monomials](#01-the-bounded-monomial-basis).

([COU line 167, §3 pp. 491,493](https://annals.math.princeton.edu/wp-content/uploads/annals-v192-n2-p04-s.pdf)).

### 0.2 Homogeneous forms and sections

**Fixed-degree homogenization.** For a commutative ring R, the fixed-degree homogenization is a linear equivalence V(R,r,d)≃ homogeneousSubmodule (Option(Fin r)) R d. It sends X^α to X₀^(d−Σα)∏X_j^α_j; inverse evaluation sets X₀=1.

Restrict DiophantineApproximationAndTranscendence §2.7 block homogenization
to one block of degree d and inputs in V(R,r,d). Rename the block variable
to None and affine variables to Some. Bundle the supplied linearity,
homogeneity and inverse identities into the native-submodule equivalence.
The adapter's multiplication comparison relates degrees d,e and d+e.

The API has the following properties.

- X^α maps to X₀^(d−Σα)X^α.
- Setting X₀=1 is the inverse on degree-d homogeneous forms.
- H(d+e)(fg)=H_d(f)H_e(g), for f∈V_d and g∈V_e; targets have different degrees.

**Checks.**

- At d=2, 1+x maps to X₀²+X₀X₁. Over a nontrivial ring this differs from 1+X₁; in the zero ring both are zero.
- At d=0 constants remain constants; with r=0 the constant 1 maps to X₀^d, including X₀⁰=1. Both are the one-block supplier formulas.
- The monomial X₀X₁ in degree 2 dehomogenizes to x in the native degree≤2 submodule.

*Needs:* DiophantineApproximationAndTranscendence §2.7 block homogenization and its two inverse identities; `MvPolynomial.homogeneousSubmodule` (Mathlib); `MvPolynomial.aeval` (Mathlib).

([COU line 167, §3 p. 491](https://annals.math.princeton.edu/wp-content/uploads/annals-v192-n2-p04-s.pdf)).

**Homogeneous forms and twisting sections.** For every commutative ring R and d≥0, the fixed-homogenization equivalence followed by the supplier homogeneous-form/section equivalence identifies V(R,r,d) with H⁰(P^r_R,O(d)), compatibly with restriction to the chart X₀≠0.

Compose this homogenization with the homogeneous-form/global-section equivalence of AlgebraicModuliForArithmeticGeometry §§1.1–1.2. The comparison with the chart uses the actual O(d) trivialization there. Its monomial calculation determines the restriction square, rather than comparing dimensions alone.

*Needs:* [Fixed-degree homogenization](#02-homogeneous-forms-and-sections); AlgebraicModuliForArithmeticGeometry §§1.1–1.2.

([COU line 167, §3 p. 491](https://annals.math.princeton.edu/wp-content/uploads/annals-v192-n2-p04-s.pdf)).

### 0.3 The real coefficient metric

**Coefficient Gram form.** Over ℝ, the bounded real polynomial space has positive definite bilinear form G(f,g)=Σ over α∈A(r,d) of coeff_α(f)coeff_α(g). Transporting the Euclidean structure along c_d makes the monomials orthonormal; the integral lattice consists exactly of integral coordinate tuples.

Pull the finite-dimensional Euclidean inner product back through the coefficient equivalence. A nonzero polynomial has a nonzero coefficient, giving strict positivity of the sum of squares. Use this transport to equip the bounded real submodule with its norm and inner product; integral tuples form its additive ℤ-coordinate subgroup.

The API has the following properties.

- G(f,g)=Σ coeff_α(f)coeff_α(g).
- For real f≠0, G(f,f)>0.
- For the transported Euclidean norm, c_d is an isometry and the integral coordinates are Z^A(r,d).

**Checks.**

- For r=2,d=2, G(x,y)=0 and G(x,x)=1.
- At d=0, G(C a,C b)=ab.
- The native polynomial 2+x has integral coordinates and squared norm 5.

*Needs:* [Coefficient coordinates](#01-the-bounded-monomial-basis).

([COU line 240, §3, p. 493, monomial coefficient metric](https://annals.math.princeton.edu/wp-content/uploads/annals-v192-n2-p04-s.pdf)).

### Examples

The degree-two basis in two variables is 1,x,y,x²,xy,y²; the polynomial 2+x has squared coefficient norm 5.

### Dependencies

Mathlib bounded polynomial and monomial APIs; Tau Ceti total-degree APIs; DiophantineApproximationAndTranscendence §2.7; AlgebraicModuliForArithmeticGeometry §§1.1–1.2.

## Layer 1: First-jet algebras and double-point evaluation

The first jet is the order-one square-zero algebra, whose infinitesimal dimension is r. This layer connects that algebra to squared evaluation ideals, CRT, the bounded linear evaluation map and its matrix. The affine identities hold over their stated rings or fields in every characteristic; the projective comparison imports AlgebraicModuliForArithmeticGeometry §§1.1–1.2 and SchemeAndStackFoundations §0.28.

### 1.1 The local square-zero algebra

**First-jet algebra evaluation.** Define `jetAlgebra` by native algebra evaluation. For any commutative ring k and P∈k^r, jetAlgebra_P:k[x₁,…,x_r]→ₐ[k]TrivSqZeroExt k (Fin r→k) sends X_j to (P_j,e_j). Its value part is f(P) and its square-zero part is (∂_j f(P))_j.

Use algebra evaluation with X_j sent to the sum of the scalar P_j and the infinitesimal coordinate e_j. The square-zero multiplication kills all terms with two infinitesimals. Expanding monomials gives exactly the native partial-derivative formula in every characteristic.

The API has the following properties.

- fst(jetAlgebra_P(f))=eval P f.
- snd(jetAlgebra_P(f))(j)=eval P(pderiv j f).
- jetAlgebra_P(X_j)=(P_j,e_j).

**Checks.**

- At the origin, jetAlgebra(X₁)=(0,e₁). Over a nontrivial ring e₁≠0; in the zero ring this jet is zero.
- jetAlgebra(C a)=(a,0).
- At the origin, X₁² maps to zero in the native square-zero extension; an order-two jet retaining quadratics would fail.

*Needs:* `MvPolynomial.aeval` (Mathlib); `MvPolynomial.aeval_monomial` (Mathlib); `MvPolynomial.pderiv_monomial` (Mathlib); `TrivSqZeroExt` (Mathlib).

([COU line 167, §3, p.491](https://annals.math.princeton.edu/wp-content/uploads/annals-v192-n2-p04-s.pdf); [BO line 119, §2, Proposition 2.1, p.3](https://arxiv.org/pdf/math/0701409v2)).

**Kernel of one first jet.** For a field k and P∈k^r, jetAlgebra_P is surjective and its kernel is (ker(eval P))². This assertion holds in every characteristic.

Translate to variables X_j−P_j. Constants and those translated variables generate the scalar and infinitesimal target coordinates. The remaining terms have translated total degree at least two and lie in m_P²; Leibniz proves the reverse kernel inclusion.

*Needs:* [First-jet algebra evaluation](#11-the-local-square-zero-algebra); `MvPolynomial.eval` (Mathlib); `TrivSqZeroExt.inr_mul_inr` (Mathlib).

([COU line 167, §3, p.491](https://annals.math.princeton.edu/wp-content/uploads/annals-v192-n2-p04-s.pdf); [BO line 119, §2, Proposition 2.1, p.3](https://arxiv.org/pdf/math/0701409v2)).

**Distinct point ideals and their powers.** For a field k and distinct P,Q∈k^r, the evaluation ideals m_P,m_Q and their squares are comaximal.

Select a coordinate in which P and Q differ. The two translated coordinate functions have nonzero constant difference, so a scalar multiple expresses 1 in m_P+m_Q. Apply the native coprime-power identity to obtain m_P²+m_Q²=top.

*Needs:* `MvPolynomial.eval` (Mathlib); [Kernel of one first jet](#11-the-local-square-zero-algebra).

([COU line 167, §3, p. 491, distinct-point squared ideal decomposition](https://annals.math.princeton.edu/wp-content/uploads/annals-v192-n2-p04-s.pdf)).

### 1.2 The finite double-point scheme and its quotient

**Squared union ideal.** For a commutative ring R and P:Fin n→R^r, `doubleIdeal` is (⋂ᵢ ker(eval Pᵢ))². Over a field k with injective P, it equals ⋂ᵢ(ker(eval Pᵢ))²; Spec(k[x]/doubleIdeal(P)) is the affine double-point scheme.

Take the infimum of the actual evaluation ideals and square that ideal. Over a field with distinct supports, pairwise comaximality identifies the finite infimum with a product, and squaring the product gives the infimum of the squared factors. SchemeAndStackFoundations §0.28 turns the affine quotient into its closed subscheme and compares it with the projective chart.

The API has the following properties.

- doubleIdeal(P)=(⋂ ker(eval P_i))².
- Over a field with injective P, doubleIdeal(P)=⋂ (ker(eval P_i))².
- Permuting the finite tuple leaves doubleIdeal unchanged.

**Checks.**

- For r=1,n=1,P=0, the ideal is (x²); over a nontrivial ring it differs from (x), while both are zero in the zero ring.
- For n=0 the ideal is top and the quotient is the zero ring; over a field its dimension is 0.
- For r=1,P=0 over a nontrivial ring, x² is zero modulo doubleIdeal, but is nonzero modulo (x³).
- Over ℤ, distinct supports 0 and 2 have point-ideal sum (x,2), which excludes 1; distinctness alone over a ring does not give the field CRT argument.

*Needs:* `MvPolynomial.eval` (Mathlib); [Distinct point ideals and their powers](#11-the-local-square-zero-algebra).

([COU line 167, §3 p. 491](https://annals.math.princeton.edu/wp-content/uploads/annals-v192-n2-p04-s.pdf)).

**Double-point quotient comparison.** The headline `doublePointQuotient` asserts existence of the following algebra equivalence with its specified quotient map.  For a field k and injective P:Fin n→k^r, k[x]/doubleIdeal(P)≃ₐ[k]Πᵢ TrivSqZeroExt k(k^r), with the class of f mapped to (jetAlgebra(Pᵢ)(f))_i.

Apply Ideal.quotientInfRingEquivPiQuotient to the squared ideals, then the first isomorphism theorem to each jetAlgebra. Verify preservation of scalar constants to obtain an algebra equivalence, including the nonreduced multiplication in every factor.

The API has the following properties.

- The class of f maps to its tuple of native first jets.
- Multiplication is the native square-zero multiplication in each factor.
- A tuple permutation commutes with the induced product-factor permutation.

**Checks.**

- For r=2,n=1 the quotient has basis 1,x−P₁,y−P₂ and dimension 3.
- For n=0 both sides are the zero-dimensional empty product algebra.
- For r=1,P=(0,1), the class of x(x−1) is nonzero, but its square is zero; the reduced quotient would kill the class.

*Needs:* [Squared union ideal](#12-the-finite-double-point-scheme-and-its-quotient); [Kernel of one first jet](#11-the-local-square-zero-algebra); [Distinct point ideals and their powers](#11-the-local-square-zero-algebra); `Ideal.quotientInfRingEquivPiQuotient` (Mathlib).

([COU line 167, §3 p. 491](https://annals.math.princeton.edu/wp-content/uploads/annals-v192-n2-p04-s.pdf)).

**Length of distinct double points.** For a field k, injective P:Fin n→k^r gives finrank_k(k[x]/doubleIdeal(P))=n(r+1); the projective double-point scheme on the affine chart has the same length.

The algebra equivalence is linear over k. Each factor has the basis of a scalar and r infinitesimal coordinates. Finite-product dimension gives n(r+1), and the affine finite-scheme comparison identifies this with geometric length.

*Needs:* [Double-point quotient comparison](#12-the-finite-double-point-scheme-and-its-quotient); SchemeAndStackFoundations §§0.28, 2.6.

([COU line 167, §3 p. 491](https://annals.math.princeton.edu/wp-content/uploads/annals-v192-n2-p04-s.pdf)).

### 1.3 Bounded values and derivatives

**Bounded first-jet evaluation.** For a commutative ring R, define `firstJetMap`, denoted J(P,d), from V(R,r,d) to the R-module Fin n→Option(Fin r)→R by J(f)_i(None)=f(P_i) and J(f)_i(Some j)=∂_j f(P_i). The row index contains n(r+1) entries.

Restrict the evaluations and derivative evaluations to the native bounded submodule. Their product is a linear map with the stated Option-indexed codomain. On monomials its entries are the value monomial and the exponent-weighted monomial of one lower degree.

The API has the following properties.

- J(f)_i(None)=eval P_i f.
- J(f)_i(Some j)=eval P_i(pderiv j f).
- The α column is P_i^α in the value row and α_jP_i^(α−e_j) in derivative row j; zero exponent gives zero.

**Checks.**

- For one point 0 in A² and d=1, 1,x,y give the identity 3×3 matrix.
- At d=0 gradients vanish; over a nontrivial ring, for r≥1,n=1 the map is not onto.
- For f=x² at P=3 in A¹, J(f)=(9,6), using native pderiv.

*Needs:* [First-jet algebra evaluation](#11-the-local-square-zero-algebra); `MvPolynomial.restrictTotalDegree` (Mathlib); `MvPolynomial.pderiv` (Mathlib).

([COU line 167, §3 p. 491](https://annals.math.princeton.edu/wp-content/uploads/annals-v192-n2-p04-s.pdf)).

**Value projection.** For a commutative ring R, the value map from V(R,r,d) to Fin n→R is evaluation at P; it is the None-row projection of J.

Project firstJetMap to its None coordinates. This is the usual value evaluation map, whose native linear kernel is the bounded-polynomial vanishing subspace. The projection retains its codomain and reindexing laws without introducing a second vanishing predicate.

The API has the following properties.

- valueMap(f)(i)=eval P_i f.
- valueMap is the None-row projection of J.
- f∈ker(valueMap) iff every f(P_i)=0.

**Checks.**

- At points 0,1 in A¹, valueMap(x)=(0,1).
- For n=0 the codomain is the zero module and the kernel is all V_d.
- At one point 0, x has value 0 and derivative 1, which is nonzero over a nontrivial ring.

*Needs:* [Bounded first-jet evaluation](#13-bounded-values-and-derivatives).

([COU line 167, §3 p. 491](https://annals.math.princeton.edu/wp-content/uploads/annals-v192-n2-p04-s.pdf)).

**Derivatives of vanishing polynomials.** For a commutative ring R, the derivative map from the value kernel to Fin n→Fin r→R evaluates native partial derivatives.

Restrict the Some-coordinate projection of firstJetMap to LinearMap.ker(valueMap). The inherited subtype map identifies its values with actual derivatives. Point permutations act simultaneously on the kernel inclusion and derivative target.

The API has the following properties.

- The (i,j) coordinate is ∂_j f(P_i).
- It equals the Some-row projection of J on ker(valueMap).
- Permuting points permutes the derivative target coordinates.

**Checks.**

- At P=0,d=1,r=1, x lies in the value kernel and maps to 1.
- For one point and d=0, the value kernel is zero.
- At P=0,d=2, over a nontrivial ring x² is a nonzero element of the value kernel with zero derivative.

*Needs:* [Value projection](#13-bounded-values-and-derivatives); [Bounded first-jet evaluation](#13-bounded-values-and-derivatives).

([COU line 167, §3 p. 491](https://annals.math.princeton.edu/wp-content/uploads/annals-v192-n2-p04-s.pdf)).

**Surjectivity through the value kernel.** For any field k and tuple P, J(P,d) is onto iff valueMap(P,d) is onto and derivativeOnKernel(P,d) is onto.

For a map into a product, surjectivity is equivalent to surjectivity onto the first factor and onto the second factor from the kernel of the first projection. Lift the value tuple first and correct its derivatives using a polynomial in the value kernel.

*Needs:* [Bounded first-jet evaluation](#13-bounded-values-and-derivatives); [Value projection](#13-bounded-values-and-derivatives); [Derivatives of vanishing polynomials](#13-bounded-values-and-derivatives).

([COU line 167, §3 p. 491](https://annals.math.princeton.edu/wp-content/uploads/annals-v192-n2-p04-s.pdf)).

### 1.4 Matrix rank and projective restriction

**Monomial first-jet matrix.** For a commutative ring R, `firstJetMatrix`(P,d) has rows Fin n×Option(Fin r) and columns A(r,d), entry P_i^α for None and α_jP_i^(α−e_j) for Some j. Its linear map in coefficient coordinates is J.

Represent firstJetMap in coefficient coordinates and the standard row-coordinate basis. Native evaluation and pderiv_monomial determine all matrix entries and the mulVec equality. The Option row index records precisely one value and r derivatives per support.

The API has the following properties.

- The None row at α equals P_i^α.
- The Some j row equals α_jP_i^(α−e_j), with zero when α_j=0.
- firstJetMatrix(P,d)·c_d(f)=J(P,d)(f).

**Checks.**

- For r=1,n=1,d=1,P=0, columns 1,x give the identity 2×2 matrix.
- For d=0 the single column has value 1 and every derivative entry 0.
- For r=2,n=2,d=2 the native matrix is 6×6, not 2×18.

*Needs:* [Coefficient coordinates](#01-the-bounded-monomial-basis); [Bounded first-jet evaluation](#13-bounded-values-and-derivatives); `MvPolynomial.eval_monomial` (Mathlib); `MvPolynomial.pderiv_monomial` (Mathlib).

([COU line 167, §3 p. 491](https://annals.math.princeton.edu/wp-content/uploads/annals-v192-n2-p04-s.pdf)).

**Full row rank criterion.** For a field k, J(P,d) is onto iff rank(firstJetMatrix(P,d))=n(r+1).

Apply Matrix.rank_eq_finrank_range_toLin to the matrix representation. The target dimension is n(r+1); equality of range dimension with target dimension is equivalent to a full range and hence surjectivity.

*Needs:* [Monomial first-jet matrix](#14-matrix-rank-and-projective-restriction); [Dimension of bounded polynomials](#01-the-bounded-monomial-basis); `Matrix.rank_eq_finrank_range_toLin` (Mathlib).

([COU line 167, §3 p. 491](https://annals.math.princeton.edu/wp-content/uploads/annals-v192-n2-p04-s.pdf)).

**Well-poised double points.** For a field k and any finite tuple P, `WellPoised`(P,d) means J(P,d) is surjective. For injective P, the projective restriction comparison identifies this with COU’s well-poisedness of 2P in degree d.

Define the predicate directly as Function.Surjective(firstJetMap P d). Permuting points gives an invertible target-coordinate permutation, while increasing d includes the old bounded submodule in the new one. The scheme interpretation is established by the separate projective comparison.

The API has the following properties.

- WellPoised(P,d) iff Surjective(J(P,d)).
- WellPoised is unchanged under a permutation of points.
- If d≤e and WellPoised(P,d), then WellPoised(P,e).

**Checks.**

- One point in A^r is well poised in degree 1.
- For r≥1 one point is not well poised in degree 0.
- Seven distinct collinear points in A² are not well poised in degree 5, although 21=choose(7,5).

*Needs:* [Bounded first-jet evaluation](#13-bounded-values-and-derivatives).

([COU line 167, §3 p. 491](https://annals.math.princeton.edu/wp-content/uploads/annals-v192-n2-p04-s.pdf)).

**Restriction to projective double points.** For d≥0 and an injective affine-chart tuple P, the H⁰(P^r,O(d))→H⁰(2P,O(d)) restriction map is J(P,d) under fixed homogenization and the chart’s O(d) trivialization; therefore the projective restriction is onto iff WellPoised(P,d).

Extend the finite affine subscheme through the standard open chart, square its ideal sheaf and trivialize O(d) there. Fixed homogenization and the double-point quotient comparison identify source and target with the native polynomial and jet modules. Check the restriction square on the monomial basis.

*Needs:* [Homogeneous forms and twisting sections](#02-homogeneous-forms-and-sections); [Double-point quotient comparison](#12-the-finite-double-point-scheme-and-its-quotient); [Well-poised double points](#14-matrix-rank-and-projective-restriction); AlgebraicModuliForArithmeticGeometry §§1.1–1.2; SchemeAndStackFoundations §§0.28, 2.6.

([COU line 167, §3 p. 491](https://annals.math.princeton.edu/wp-content/uploads/annals-v192-n2-p04-s.pdf)).

### Examples

At one support in A², 1,x,y give the three independent first jets. At supports 0,1 in A¹ the nonzero class x(x−1) has square zero.

### Dependencies

Layer 0; Mathlib square-zero algebras and Chinese remainder; SchemeAndStackFoundations §0.28; AlgebraicModuliForArithmeticGeometry §§1.1–1.2.

## Layer 2: Restriction rank, Horace and curvilinear families

This layer applies the general geometry interfaces to interpolation. Restriction rank always means the range dimension of a genuine section map, including for a proper linear subsystem. Residual/trace estimates use left exactness only. The curvilinear criterion and proper direction incidence supply the logical and geometric tools for the differential argument.

### 2.0 Finite locally free sections and relative generic smoothness

**Finite locally free pushforward of a line bundle.** For every finite locally
free morphism f:Z→S and invertible O_Z-module L, construct the O_S-module
f_*L. It is finite locally free of rank equal to the locally constant rank of
f_*O_Z. For every g:T→S and the cartesian square with f':Z_T→T and g':Z_T→Z,
the natural map g*f_*L→f'_*g'*L is an isomorphism; g need not be flat.
On affine opens this is restriction of scalars for a rank-one projective
module over a finite locally free algebra. Descent identifies these affine
comparisons with the sheaf pushforward (COU line 179, §3, p.491, finite-section
interpretation; Stacks, Lemma 10.78.2 (00NX), finite projective/locally free equivalence).

The API has the following properties.

- On Spec A with Z=Spec B and L associated to the B-module M, f_*L is associated to M viewed as an A-module.
- If B is locally free of rank n over A and M is invertible over B, this A-module is locally free of rank n, including n=0.
- The base-change map identifies A'⊗_A M with the pushforward of the pulled-back line bundle and respects identity and composite base changes.

**Checks.**

- For B=k×k and M=B, the pushforward is k², of dimension 2; replacing it by one copy of k would lose a component.
- With A=k[ε]/ε², base change gives A² of rank 2, and the nonflat quotient A→k gives k² again.
- The empty finite scheme has pushforward 0 of rank 0. For f the identity and L invertible, the rank is 1 and the comparison map is the identity.

*Needs:* SchemeAndStackFoundations §0.28 (affine quotient/sheaf comparisons);
AlgebraicVectorBundles §L0B (affine finite-projective comparison); Mathlib finite projective modules and tensor products; AlgebraicModuliForArithmeticGeometry
§2.1 (the finite locally free Hilbert subfunctor).

**Relative generic smoothness.** For a dominant k-morphism f:X→Y of integral finite-type schemes over a
characteristic-zero field, prove that
there is a dense open X°⊂X on which f is smooth of relative dimension
`dim X - dim Y`. Intersect X° with the inverse image of the dense smooth
locus of Y; on this dense open X is smooth over k as well. At every
geometric point x of this open, the differential
T_xX→T_f(x)Y is surjective, of rank dim Y and kernel dimension dim X−dim Y.
Use separability of the function-field extension and the smooth local
presentation (VAK line 27200, Theorem 25.3.1, p.681, and VAK line 14012, Definition 12.6.2, p.355).

The differential has the following API.

- For an affine polynomial map its tangent map is multiplication by the Jacobian evaluated at the geometric point.
- The differential of the identity is the identity, and that of a composite is the composite, with the residue-field pullbacks included.
- On the smooth open its rank and kernel dimension have the stated values; outside that open no surjectivity is asserted.

**Checks.**

- Spec(ℂ[ε]/ε²) has tangent dimension 1 and dimension 0 and empty smooth locus over ℂ; it is excluded by integrality of X.
- The projection A²_ℚ→A¹_ℚ has differential rank 1 and relative dimension 2−1=1 at every point.
- For x↦x² on A¹_ℚ, the differential has rank 1 on x≠0 and rank 0 at 0. Over 𝔽₂ it is zero everywhere, excluding an inseparable characteristic-two extension of the claim.
- At the generic point of A¹_k the local maximal ideal is zero, so its absolute local-ring cotangent dimension is 0. After extension to Ω=overline(k(t)), the associated Ω-rational point of A¹_Ω has tangent dimension 1, as required for the relative differential.

*Needs:* Mathlib `AlgebraicGeometry.Scheme.Hom.dense_smoothLocus_of_perfectField`
for the absolute smooth locus; Mathlib `AlgebraicGeometry.SmoothOfRelativeDimension`; Tau Ceti relative differentials and Zariski tangent spaces; SchemeAndStackFoundations §4.12 generic flatness; characteristic-zero separability.

### 2.1 Ranks of section maps

**Restriction rank of a finite scheme.** For d≥0, a zero-dimensional subscheme X⊂P^r_k and a finite-dimensional linear system D⊂H⁰(P^r,O(d)), h(X,D) is the rank of the actual restriction D→H⁰(X,O(d)|X). Independence means h(X,D)=length(X). Write h(X,d) for the full system.

Restrict the actual section map to D and take the dimension of its linear range. Rank-nullity gives its kernel formula, while finite-scheme length is the dimension of the twisted target section module. The kernel is a subspace of D, also when D is a proper subsystem.

The API has the following properties.

- h(X,D)=dim D−dim ker(D→H⁰(X,O(d)|X)).
- h(X,D)≤min(dim D,length X).
- h(∅,D)=0.

**Checks.**

- For a simple point and the full degree 0 constant system, h=1.
- For D=0, h(X,D)=0 even when X has positive length.
- For one affine double point and d=1, h=r+1, agreeing with the native first-jet matrix.

*Needs:* AlgebraicModuliForArithmeticGeometry §§1.1–1.2; SchemeAndStackFoundations §§0.28, 2.6.

([BO line 602, §6, Lemma 6.1, pp.12–14](https://arxiv.org/pdf/math/0701409v2)).

**Restriction rank on disjoint unions.** For disjoint finite schemes A,B and D as above, h(A∪B,D)=h(B,D)+h(A,ker(D→H⁰(B,O(d)|B))).

Sections on a disjoint union split into a product. Project the restriction image onto the B factor; its kernel is the restriction image on A of the B-vanishing subspace of D. Rank-nullity proves the identity for this native kernel.

*Needs:* [Restriction rank of a finite scheme](#21-ranks-of-section-maps); SchemeAndStackFoundations §§0.28, 2.6.

([BO line 602, §6, Lemma 6.1, pp.12–14](https://arxiv.org/pdf/math/0701409v2)).

### 2.2 Hyperplane residuals and ordinary Horace

**Cartier residual and trace.** For a locally Noetherian scheme Y, a closed
subscheme X⊂Y, an effective Cartier divisor i:H→Y and an invertible sheaf L
on Y, define Res_H(X) by I_X:I_H and Tr_H(X) by (I_X+I_H)/I_H. Construct the
exact sequence of sheaves on Y

    0 → I_Res ⊗ L(-H) → I_X ⊗ L → i_*(I_Tr,H ⊗ i*L) → 0.

Locally, multiplication by a non-zero-divisor t defining H identifies the
kernel with `(I_X : t)`; reduction modulo t identifies the image with the
trace ideal. These local identifications glue. Taking sections is left exact
and does not assert surjectivity on sections (BO line 389, §4, equation (1), p.8).

The API has the following properties.

- On an affine open with H=(t), the residual ideal is `(I_X : t)` and the trace ideal is `(I_X + (t))/(t)`.
- The first map has source I_Res⊗L(-H), target I_X⊗L and is multiplication by the Cartier equation in a trivialization; the second is restriction to H.
- For flat base changes the residual and trace sequence pulls back to the corresponding sequence; arbitrary base change is claimed only when the pulled-back Cartier equation remains regular and the ideal-quotient comparison is an isomorphism.

**Finite-scheme residual and trace.** For r≥1, finite closed X⊂P^r_k, a
hyperplane H and d≥1, specialize the sequence with L=O(d), obtaining
`0 → I_Res(d-1) → I_X(d) → i_*I_Tr,H(d) → 0`.

For q distinct full double points with exactly u supports on H, the trace has
u double points in H, and the residual has q−u off-H doubles and u reduced
on-H supports: locally (m²:x_r)=m and (m²+(x_r))/(x_r) is the squared point
ideal on H. A length-two direction transverse to H has trace and residual
length 1; a direction contained in H has trace length 2 and empty residual.

**Checks.**

- In A³ with H=(z=0), the double origin has lengths 4=1+3; treating its trace as a full ambient double gives the wrong length 4.
- The direction cut out by (x,y,z²) has lengths 2=1+1; its trace and residual are the reduced origin.
- The tangent direction (y,z,x²) has lengths 2=0+2, and the empty scheme gives 0=0+0; residual and trace must not be interchanged.

*Needs:* Squared union ideal; SchemeAndStackFoundations §0.28;
AlgebraicModuliForArithmeticGeometry §§1.1–1.2 (twists).
(Source: BO line 389, §4, pp.7–8, the Cartier sequence (1).)

**Castelnuovo dimension bound.** For every finite closed X⊂P^r_k, hyperplane H,
and r,d≥1, dim H⁰(I_X(d))≤dim H⁰(I_Res(d−1))+dim H⁰(I_Tr,H(d)). Equivalently,
h(X,d)≥h(Res,d−1)+h(Tr,d), with the trace rank computed in H.

Left exactness identifies the first section space with the kernel and bounds
the image by the trace section space. Pascal's identity converts dimensions
to ranks. This includes full doubles, mixed curvilinear schemes and empty X.

*Needs:* Finite-scheme residual and trace; Restriction rank of a finite scheme;
Dimension of bounded polynomials. (Source: BO line 389, §4, pp.7–8; §6,
Theorem 6.4, pp.16–19, mixed use at BO line 858.)

**Ordinary Horace criterion.** For r,d≥1 and q distinct double points with exactly u supports on H, suppose trace and residual have maximal rank. If both ur≤N(r−1,d) and q(r+1)−ur≤N(r,d−1), or both reverse inequalities hold, then X has maximal rank in degree d.

The lengths of trace and residual are ur and q(r+1)−ur. Insert their maximal ranks into the Castelnuovo bound. In either of the two matched inequality ranges the lower bound equals min(N(r,d),q(r+1)); the general rank upper bound gives equality.

*Needs:* [Castelnuovo dimension bound](#22-hyperplane-residuals-and-ordinary-horace); [Squared union ideal](#12-the-finite-double-point-scheme-and-its-quotient); [Length of distinct double points](#12-the-finite-double-point-scheme-and-its-quotient).

([BO line 358, §4, Theorem 4.1, pp.7–8](https://arxiv.org/pdf/math/0701409v2)).

### 2.3 Testing independence on curvilinear subschemes

**Independent subschemes.** If X is D-independent and Y⊂X is a finite subscheme, then Y is D-independent. If restriction to X is injective, restriction to every finite superscheme is injective.

For Y⊂X, the finite target section module for Y is a quotient of the one for X; a surjective restriction map therefore remains surjective after composition. A section vanishing on a superscheme also vanishes on X, proving the injective assertion.

*Needs:* [Restriction rank of a finite scheme](#21-ranks-of-section-maps); SchemeAndStackFoundations §§0.28, 2.6.

([BO line 602, §1, p.1; §6, Lemma 6.1, pp.12–14](https://arxiv.org/pdf/math/0701409v2)).

**Curvilinear criterion at one support.** For X contained in a double point, X is D-independent iff every curvilinear subscheme ξ⊂X of length≤2 is D-independent.

Induct on length inside the square-zero coordinate algebra of one double point. Choose a section vanishing at the support but nonzero on a length-two direction. Its equation cuts length by one; the induction hypothesis gives full rank on that section, and the extra nonzero condition completes the rank.

*Needs:* [Restriction rank of a finite scheme](#21-ranks-of-section-maps); [Independent subschemes](#23-testing-independence-on-curvilinear-subschemes); [Kernel of one first jet](#11-the-local-square-zero-algebra); SchemeAndStackFoundations §§0.28, 2.6.

([BO line 602, §6, Lemma 6.1, pp.12–14](https://arxiv.org/pdf/math/0701409v2)).

**Curvilinear reduction.** If X is a finite subscheme of a union of distinct double points, then X is D-independent iff every curvilinear ξ⊂X, with at most length 2 at each support, is D-independent.

Separate one support from the others and apply the disjoint-rank formula to the kernel of the other restrictions. Induction tests every length-two direction for that kernel system; the one-point criterion then recovers the full local component. Iterate over supports.

*Needs:* [Curvilinear criterion at one support](#23-testing-independence-on-curvilinear-subschemes); [Restriction rank on disjoint unions](#21-ranks-of-section-maps); [Independent subschemes](#23-testing-independence-on-curvilinear-subschemes).

([BO line 602, §6, Lemma 6.1, pp.12–14](https://arxiv.org/pdf/math/0701409v2)).

### 2.4 Families and limits

**Universal length-two direction family.** For X/k smooth separated of
finite type, construct π:D=P_X(Ω¹_(X/k))→X using the invertible-quotient
convention of AlgebraicModuliForArithmeticGeometry §1.1. The first infinitesimal
diagonal neighborhood V(I_Δ²)⊂X×_kX, viewed over its first projection, has
algebra O_X⊕Ω¹_(X/k), with square-zero second summand. Its pullback to D has
the quotient algebra O_D⊕O_D(1), induced by π*Ω¹_(X/k)→O_D(1). The resulting
closed family is finite locally free of rank two over D. The projection D→X
is projective (VAK line 22730, §21.2.20, and VAK line 22798, Theorem 21.2.24, pp.572–574).

The API has the following properties.

- The geometric fiber at a nonzero cotangent-line quotient is the length-two closed subscheme at that support with the prescribed tangent direction.
- The quotient algebra has multiplication `(a,u)(b,v) = (ab,av+bu)`; its infinitesimal line squares to zero.
- The incidence quotient commutes with arbitrary parameter base change and with base extension of k; over S→Spec k use the relative diagonal and Ω¹_(X_S/S).

**Checks.**

- For X=A²_k, D=A²_k×P¹_k. At the origin, dx↦1, dy↦0 gives ideal (y,x²), while dx↦1, dy↦1 gives (y−x,x²); both algebras have basis 1,ε and different embedded directions.
- For X=Spec k, Ω¹=0 and D is empty. For X=A¹_k there is one direction at each support, with algebra k[ε]/ε² of length 2.
- In the algebra at the origin, ε²=0 whereas ε is nonzero; replacing it by k×k would introduce two reduced supports.
- After base change to A=k[δ]/δ², the quotient is A⊕Aε with ε²=0, free of rank 2 over A; nonreduced parameters retain the direction.

*Needs:* AlgebraicModuliForArithmeticGeometry §1.1 (universal invertible quotient);
SchemeAndStackFoundations §0.28 (closed quotients); Tau Ceti relative differentials;
Mathlib `TrivSqZeroExt`.

**Rank in flat point families.** Let X/k be a scheme, L an invertible sheaf
on X, D⊂H⁰(X,L) a finite-dimensional k-subspace, T any k-parameter scheme,
and Z⊂X×_kT a finite locally free family of fixed length over T. The locus
where D restricts to Z_t with rank at least t₀ is open in T. A specialization
cannot increase rank. In the interpolation applications X=P^r and L=O(d).

Push the twisting restriction forward along the finite-flat family and use base change and local freeness from AlgebraicModuliForArithmeticGeometry §§1.7, 2.1; Layer 2 §2.0 finite locally free pushforward. In local bundle coordinates the rank-at-least-t locus is a union of nonvanishing t-minor opens. Determinantal closed sets imply that a specialization cannot increase rank.

*Needs:* [Restriction rank of a finite scheme](#21-ranks-of-section-maps); AlgebraicModuliForArithmeticGeometry §§1.7, 2.1; Layer 2 §2.0 finite locally free pushforward.

([BO line 602, §6 pp. 14–18](https://arxiv.org/pdf/math/0701409v2)).

**Proper limits of curvilinear failures.** Let X/k be smooth separated of
finite type, L an invertible sheaf, D⊂H⁰(X,L) a
finite-dimensional k-subspace, and H⊂X a smooth effective Cartier divisor.
For pairwise distinct sections of X over a trait, all lying in positive-dimensional
components, a failure of D-independence
on the generic doubled union is witnessed, after a residue-field extension,
by one length-two subscheme at each support. The projective direction
parameter is proper over the support parameter. After a valuative base
change, the bad tuple extends to a flat length-two family at each support,
with the same rank failure and special directions either contained in H or
transverse to H at supports specializing onto H. Distinctness is required
on the whole trait.

Each local length-two subscheme is parametrized by a tangent line, with its universal incidence family. Properness of the projective direction parameter extends a generic bad incidence tuple after a valuative base change. The resulting flat limit retains length and supplies its tangent/transverse classification.

*Needs:* [Curvilinear reduction](#23-testing-independence-on-curvilinear-subschemes); [Rank in flat point families](#24-families-and-limits); Layer 2 §2.4 universal length-two direction family; Layer 2 §2.0 finite locally free pushforward; AlgebraicModuliForArithmeticGeometry §§1.7, 2.1.

([BO line 764, §6 Theorem 6.4, cases after Step 3, pp. 17–19](https://arxiv.org/pdf/math/0701409v2)).

### Examples

In A³ a transverse direction has residual/trace lengths 1,1; a tangent direction has lengths 0,2. The matrix [t] has rank 1 off zero and rank 0 at zero.

### Dependencies

Layers 0–1; AlgebraicVectorBundles §L0B; SchemeAndStackFoundations §§0.28, 4.12;
AlgebraicModuliForArithmeticGeometry §§1.1, 1.7, 2.1; pinned Tau Ceti relative
differentials and tangent spaces. Within the layer, §2.0 precedes restriction
ranks, §2.2 supplies residuals, and §2.4 supplies direction families and limits.

## Layer 3: Plane and cubic interpolation bases

This layer provides the low-degree inputs for the induction. Finite integer rank witnesses replace the finite computer calculations by explicit determinant assertions. Plane interpolation uses generic tangent/contact geometry. Cubic interpolation uses general codimension-three configurations and a remainder subscheme contained in a double point.

### 3.1 Exact low-degree rank witnesses

**Exact integer rank witnesses.** If an integer constraint matrix has a t×t minor nonzero modulo101, its rank over every characteristic-zero field is at least t. For homogeneous degree d>0 in characteristic zero, vanishing of all r+1 partials at a nonzero vector implies vanishing of the form itself.

A determinant nonzero modulo 101 is a nonzero integer, and the canonical integer map into a characteristic-zero field is injective. The native minor/rank criterion gives the lower bound. Separately, Mathlib’s `MvPolynomial.IsHomogeneous.sum_X_mul_pderiv`, Σx_j∂_jF=dF, shows that all homogeneous partials imply the value condition when d is invertible.

*Needs:* `Matrix.rank_eq_finrank_range_toLin` (Mathlib); `MvPolynomial.IsHomogeneous.sum_X_mul_pderiv` (Mathlib).

([BO line 932, §5, pp.9–12; §6, p.19](https://arxiv.org/pdf/math/0701409v2)).

**Quadrics with prescribed singular points.** For r≥1 and q≥0 general distinct points in P^r, the space of singular quadrics has dimension choose(r+2−q,2) when 0≤q≤r+1 and is zero for q≥r+1. In particular at least r+1 general double points leave no quadrics.

Write a quadric as a symmetric bilinear form, using characteristic zero to divide by two. Singularity at independent supports puts their vector span into its radical. Quadrics on the quotient of dimension r+1−q have dimension choose(r+2−q,2); r+1 supports leave a zero quotient.

*Needs:* [Restriction to projective double points](#14-matrix-rank-and-projective-restriction); [Restriction rank of a finite scheme](#21-ranks-of-section-maps).

([BO line 264, §3 p. 6](https://arxiv.org/pdf/math/0701409v2)).

**Low-degree near-exception ranks.** The headline `nearExceptionRanks` gives distinct rational affine witnesses for the following list.  Generic homogeneous jet ranks at cubic(r,q)=(2,3),(2,4),(3,5),(4,6),(4,8),(7,15) and quartic(r,q)=(2,4),(2,6),(3,8),(3,10),(4,13),(4,15) are respectively 9,10,20,30,35,120 and 12,15,32,35,65,70.

For each listed triple construct the homogeneous monomial derivative matrix at distinct integer projective supports. A minor of the stated size is nonzero modulo 101, so its characteristic-zero rank reaches the dimensional upper bound. Rank openness gives the corresponding generic assertion; no rank at an exceptional count is inferred from a neighboring count.

*Needs:* [Exact integer rank witnesses](#31-exact-low-degree-rank-witnesses); [Rank in flat point families](#24-families-and-limits).

([BO line 932, §2, p.6; §3, pp.6–7; §5, pp.9–12; §6, p.19](https://arxiv.org/pdf/math/0701409v2)).

### 3.2 Plane interpolation through tangent and contact geometry

**Veronese morphism and tangent spaces.** For r≥0,d≥1, construct the
morphism v_d:P^r_k→P^(N(r,d)−1)_k whose homogeneous coordinates are all degree-d
monomials, by the complete O(d) section system and the projective-quotient
interface. The monomials have no common zero, and v_d is a closed immersion.
When the cone is written as v^d in Sym^d(k^(r+1)), identify it with these
complete-monomial coordinates using the normalized polarization pairing:
the pairing of dual monomials X^α and e^α is the inverse of the multinomial
coefficient `d! / product(alpha_j!)`. Thus F pairs with v^d as F(v).
These coefficients are nonzero in characteristic zero. The tangent formula
below uses this pairing, while the native first-jet matrix uses ordinary
monomial coefficients.
For d=0 the same formula gives the constant map to P⁰, with no immersion
claim when r≥1 (BO line 42, §1, p.1, Veronese definition).

The API has the following properties.

- At a nonzero vector v its image has coordinates v^α with |α|=d, modulo common nonzero scalar.
- Rescaling v by c≠0 rescales every output coordinate by c^d, giving the same projective point; changing the monomial ordering permutes the output coordinates.
- Pullback of O(1) is O(d), and the map is compatible with field extension and the fixed affine-chart homogenization.

**Checks.**

- On P¹ with d=2, [a:b] maps to [a²:ab:b²]; [1:1] and [2:2] give [1:1:1] and [4:4:4], the same projective point.
- For d=1 the coordinate map is the identity up to ordering. For d=0, [1:0] and [0:1] both map to [1], excluding a closed-immersion assertion.
- At [1:0] in degree 2, the chart map t↦(t,t²) has tangent vector (1,0); omitting the mixed monomial would give derivative zero in characteristic 2.
- In degree 2, (e₀+e₁)² has symmetric-power coefficients (1,2,1), while its complete-monomial coordinates are (1,1,1). The mixed dual monomial pairs with e₀e₁ as 1/2, so its value is 2·(1/2)=1; pairing it with the derivative 2e₀e₁ also gives 1.

*Needs:* AlgebraicModuliForArithmeticGeometry §§1.1–1.2 (projective quotients and twists);
Layer 0 §0.2 (monomial section comparison).

**Veronese tangents and double-point conditions.** For d≥1 and nonzero v∈k^(r+1), the tangent space to the affine Veronese cone at v^d is v^(d−1)k^(r+1); its annihilator in degree-d forms is the squared point ideal in degree d.

Differentiate the degree-d Veronese map; its differential is multiplication by d v^(d−1), and d is invertible. At a coordinate support the annihilator consists of forms with zero value and first derivatives. Coordinate change identifies that annihilator with the degree-d part of the squared point ideal.

*Needs:* [Kernel of one first jet](#11-the-local-square-zero-algebra); [Homogeneous forms and twisting sections](#02-homogeneous-forms-and-sections); SchemeAndStackFoundations §§0.28, 2.6.

([BO line 119, §2, Proposition 2.1, p.3](https://arxiv.org/pdf/math/0701409v2)).

**Terracini span for the Veronese family.** For r,d,q≥1, at general q Veronese points and a general point in their span, the tangent to their q-secant variety is the span of their tangent spaces; its affine dimension is the restriction rank of the q double points.

Let U be the open of ordered q-tuples of linearly independent Veronese
points. Over U take the projective bundle of their q tautological lines and
its map f to the reduced secant variety, sending coefficients to their sum.
Restrict to nonzero coefficients and the inverse image of the smooth locus
of the secant variety. Source and target are smooth integral finite-type
schemes and f is dominant. The absolute smooth-locus theorem gives the dense
smooth target open; Layer 2 §2.0 relative generic smoothness gives the surjective differential on
a dense source open. Its image, computed in local coordinates, is the span
of the support tangents. If q exceeds the number of independent Veronese
points, first use a spanning subtuple, whose tangents already fill the ambient
space. Affine cone dimensions are one more than projective dimensions.

*Needs:* Layer 2 §2.0 relative generic smoothness; [Veronese tangents and double-point conditions](#32-plane-interpolation-through-tangent-and-contact-geometry); SchemeAndStackFoundations §§0.28, 2.6.

([BO line 131, §2 Lemma 2.2, pp. 3–4](https://arxiv.org/pdf/math/0701409v2)).

**Plane singular-curve incidence.** For a nonzero degree-d plane form F over
an algebraically closed characteristic-zero field and a reduced plane curve
C of degree ℓ≥1, if F and all its first derivatives vanish along C, prove
`2 C ≤ div(F)`, hence 2ℓ≤d. For q general distinct points of P² lying on some
nonzero degree-ℓ form, prove q≤N(2,ℓ)−1=ℓ(ℓ+3)/2. These are separate claims:
the second is a dimension bound on the incidence of curves and points.
For the first, factor F at the generic smooth point of each reduced component;
multiplicity one would give a nonzero normal derivative. For the second,
independent evaluation on the N(2,ℓ)-dimensional full section space gives the
bound (BO line 205, Lemma 2.3, and BO line 245, proof of Theorem 2.4, pp.5–6).

**Checks.**

- The form x² in affine plane coordinates is singular along x=0 and contains twice that line; x has normal derivative 1 and fails the hypothesis.
- For ℓ=1, two general plane points lie on a line and three general noncollinear points do not: the bound is 1·4/2=2.
- For ℓ=2 the bound is 2·5/2=5. Five general points lie on a conic, whereas six do not; the double conic in degree 4 witnesses 2ℓ=d.

*Needs:* SchemeAndStackFoundations §5.12 (plane intersections and Bézout);
Layer 0 §0.2 (forms and sections); Layer 2 §2.1 (restriction rank).

**Contact curve in the defective plane case.** For d,q≥1 and general q points in the Veronese plane, a defective tangent span has positive-dimensional contact through each support. For a general nonzero degree-d form singular at those supports this yields a reduced plane curve C of degree l through them with 2C contained in its divisor.

For the secant-incidence morphism just specified, a defective tangent span
has dimension smaller than both q(r+1)−1 and the ambient projective dimension.
Its general fiber therefore has dimension q(r+1)−1−dim σ_q>0. Independent
support vectors make the coefficient tuple unique once its supports and span
point are fixed, so a positive-dimensional fiber must move a support.
Permutation symmetry and a general choice of the incidence point give a
positive-dimensional projection through each support. On the dense smooth
part of that fiber, Terracini identifies every support tangent with a subspace
of the fixed tangent at the span point; closedness extends this inclusion to
the reduced projection closure. The contact locus is proper because the
Veronese surface spans the ambient space and the fixed tangent span is
proper. Thus these positive-dimensional closures in P² are curves.
SchemeAndStackFoundations §5.12 and Layer 3 §3.2 plane singular-curve incidence identifies
their double containment in the singular divisor and gives 2ℓ≤d and
q≤ℓ(ℓ+3)/2 for general plane supports.

*Needs:* Layer 2 §2.0 relative generic smoothness; [Terracini span for the Veronese family](#32-plane-interpolation-through-tangent-and-contact-geometry); SchemeAndStackFoundations §§0.28, 2.6; SchemeAndStackFoundations §5.12 and Layer 3 §3.2 plane singular-curve incidence.

([BO line 205, §2 Lemma 2.3 p. 5 and Theorem 2.4 p. 6](https://arxiv.org/pdf/math/0701409v2)).

**Plane contact numerical reduction.** In degrees d≥5 in the plane critical-count argument of BO’s Theorem 2.4, the bounds 2l≤d and q≤l(l+3)/2, with q the relevant critical floor count, force d=6.

Substitute q=floor(N(2,d)/3) and ℓ≤floor(d/2) into q≤ℓ(ℓ+3)/2. Separate even and odd d and calculate the small boundary values explicitly. The only possible degrees left beyond d≤4 are sextics.

*Needs:* [Contact curve in the defective plane case](#32-plane-interpolation-through-tangent-and-contact-geometry); [Binomial count of bounded monomials](#01-the-bounded-monomial-basis).

([BO line 232, §2 Theorem 2.4 proof, p. 6](https://arxiv.org/pdf/math/0701409v2)).

**Exact sextic plane critical ranks.** The headline `sexticPlane` gives distinct rational affine witnesses.  There exist distinct plane point configurations for which degree 6 homogeneous jet ranks are 27 at q=9 and 28 at q=10. Thus the corresponding generic ranks are maximal.

Construct integer homogeneous derivative matrices for 9 and 10 distinct plane supports and exhibit nonzero minors of sizes 27 and 28 modulo 101. Determinant lifting gives the same characteristic-zero lower bounds, and openness on the irreducible support parameter gives the generic ranks.

*Needs:* [Exact integer rank witnesses](#31-exact-low-degree-rank-witnesses); [Rank in flat point families](#24-families-and-limits).

([BO line 232, §2 Theorem 2.4 proof, p. 6; sextic base](https://arxiv.org/pdf/math/0701409v2)).

**Plane interpolation input.** The headline `planeDoublePointRank` states its affine realization over every characteristic-zero field. General double points in P² impose maximal-rank conditions in every degree, except (d,q)=(2,2) and (4,5). The endpoint needed here includes both critical counts in every d≥5. The affine headline has d≥0 and q≥0 and excludes exactly (d,q)=(2,2),(4,5).

Combine the contact-curve numerical reduction with the sextic and low-degree rank witnesses. The quadric radical formula gives the quadratic exception and a doubled conic gives the quartic exception. Independence passes to subsets and injectivity to supersets, extending the two critical counts to every count.

*Needs:* [Plane contact numerical reduction](#32-plane-interpolation-through-tangent-and-contact-geometry); [Exact sextic plane critical ranks](#32-plane-interpolation-through-tangent-and-contact-geometry); [Quadrics with prescribed singular points](#31-exact-low-degree-rank-witnesses); [Low-degree near-exception ranks](#31-exact-low-degree-rank-witnesses); [Independent subschemes](#23-testing-independence-on-curvilinear-subschemes).

([BO line 232, §2, Theorem 2.4, p.6](https://arxiv.org/pdf/math/0701409v2)).

### 3.3 Codimension-three cubic systems

**Projectively distinct supports.** For a field k, `ProjectivelyDistinct` on a family of vectors in k^(r+1)
means that every vector is nonzero and that P_i=cP_j for c∈k implies i=j.
It expresses distinct projective supports without choosing representatives up
to equality of vectors. In the finite headlines k=ℚ, and a vector subspace
of dimension r−2 represents a projective codimension-three subspace.

The predicate has the following API.

- Every support vector is nonzero, including in a singleton family.
- Multiplication of each vector by its own nonzero scalar preserves the predicate.
- For integral support vectors viewed over ℚ, proportionality by a nonzero integer also violates the predicate at distinct indices; vector inequality alone does not establish distinct projective images.

**Checks.**

- The vectors e₀,e₁ in ℚ² satisfy the predicate: neither is zero and e₀=c e₁ has no scalar solution.
- The vectors e₀,2e₀ are unequal as vectors but fail the predicate, since e₀=(1/2)(2e₀); merely testing vector injectivity is insufficient.
- The empty family satisfies the predicate. A singleton zero vector fails its nonzero clause, whereas a singleton e₀ satisfies it.

(Source: BO line 466, §5, Propositions 5.2–5.4, pp.9–11; native vector formulation of their projective incidences.)

*Needs:* Native vector spaces and scalar multiplication over a field.

**Three-subspace cubic base rank witnesses.** The headline `threeSubspaceCubicBases` gives rational subspaces and support vectors. For r=5,6,7, choose L₀,L₁,L₂⊂ℚ^(r+1), each of dimension r−2, with L_a+L_b=ℚ^(r+1) for a≠b and L₀∩L₁∩L₂=0. Choose three supports on each L_a, outside the other two spaces, all nine projectively distinct. The only homogeneous cubic vanishing on every vector of the three spaces and with every partial derivative zero at all nine supports is zero. The full-column integer constraint matrices have ranks 56,84,120.

Choose integer subspace frames and support vectors in the prescribed incidences for dimensions 5,6,7. Build the homogeneous derivative constraints together with value constraints at integer sample points on each space, and any specified remainder-direction constraints. A full-column minor has nonzero residue modulo 101, giving ranks 56,84,120. These are necessary conditions for a containing cubic, so full column rank excludes it; openness yields the general assertion.

*Needs:* [Exact integer rank witnesses](#31-exact-low-degree-rank-witnesses); [Rank in flat point families](#24-families-and-limits).

([BO line 466, §5 Proposition 5.2 pp. 9–10](https://arxiv.org/pdf/math/0701409v2)).

**Checks.**

- In r=5 the subspace dimensions are 3, pairwise intersection dimensions 0 and triple intersection dimension 0; containment alone has rank 30, and the singularity conditions raise it to 56=choose(8,3).
- In r=6 these dimensions are 4,1,0, and the containment/singularity ranks are 57 and 84=choose(9,3).
- In r=7 they are 5,2,0, and the ranks are 93 and 120=choose(10,3). Omitting singularities leaves kernels of dimensions 26,27,27 in these three cases.

**Three-subspace cubic recursion.** For r≥5, three general codimension 3 subspaces and three general points on each admit no cubic containing the spaces and singular at all nine points.

For r≥8 specialize the nine supports to a general hyperplane and use the r−1 assertion on the trace. The residual is a quadric containing the three general codimension-three spaces. A coefficient calculation shows its space is zero, so the residual/trace bound completes the induction.

*Needs:* [Three-subspace cubic base rank witnesses](#33-codimension-three-cubic-systems); Layer 2 §2.2 Cartier residual and trace for the union with the positive-dimensional subspaces; [Rank in flat point families](#24-families-and-limits).

([BO line 466, §5, Proposition 5.2, pp.9–10](https://arxiv.org/pdf/math/0701409v2)).

**Two-subspace cubic base rank witnesses.** The headline `twoSubspaceCubicBases` gives rational witnesses for r=5,7. The two vector spaces have dimension r−2 and sum ℚ^(r+1); their pairwise intersection dimension is r−5. There are r−2 supports in each space outside the other, and three outside both spaces, all 2(r−2)+3 projectively distinct. A homogeneous cubic vanishing on both spaces and with every partial zero at every support is zero. The integer rank witness ranks are 56 and 120; openness gives the corresponding general configurations.

Choose integer subspace frames and support vectors in the prescribed incidences for dimensions 5,7. Build the homogeneous derivative constraints together with value constraints at integer sample points on each space, and any specified remainder-direction constraints. A full-column minor has nonzero residue modulo 101, giving ranks 56,120. These are necessary conditions for a containing cubic, so full column rank excludes it; openness yields the general assertion.

*Needs:* [Exact integer rank witnesses](#31-exact-low-degree-rank-witnesses); [Rank in flat point families](#24-families-and-limits).

([BO line 492, §5 Proposition 5.3 p. 10, P⁷ base](https://arxiv.org/pdf/math/0701409v2)).

**Checks.**

- For r=5, the two vector spaces have dimensions 3,3 and intersection 0; containment rank 20 leaves 36 cubic coefficients, and the nine double supports raise the rank to 56.
- For r=7, the dimensions are 5,5 and intersection 2; containment rank 66 leaves 54 coefficients, and the thirteen double supports raise the rank to 120.
- Removing the three ambient double supports leaves at least 36−18=18 coefficients in r=5 and at least 54−30=24 in r=7: each support on a contained codimension-three space contributes at most three normal conditions. Those outside supports cannot be omitted.

**Two-subspace cubic recursion.** For r≥3,r≠4, two general codimension 3 spaces L,M, r−2 general double points on each and three general ambient double points leave no cubic containing L∪M.

Use the direct r=3 case and the r=5,7 bases. In r=6 or r≥8 introduce a third codimension-three space, specialize r−5 supports from each original list to its intersections, and move the three ambient supports into it. The trace is the r−3 two-space assertion; the kernel is killed by the three-space assertion with its nine remaining singularities.

*Needs:* [Two-subspace cubic base rank witnesses](#33-codimension-three-cubic-systems); [Three-subspace cubic recursion](#33-codimension-three-cubic-systems); [Rank in flat point families](#24-families-and-limits).

([BO line 492, §5, Proposition 5.3, p.10](https://arxiv.org/pdf/math/0701409v2)).

**One-subspace cubic base rank witnesses.** The headline `oneSubspaceCubicBases` gives both rational witnesses. For r=5 there exist a vector space L⊂ℚ⁶ of dimension 3, three double supports on L, six outside L, and a further nonzero Q∈L, all ten supports projectively distinct, with a transverse vector w∉L. A homogeneous cubic F vanishing on L, singular at the nine double supports, and satisfying F(Q)=0 and Σ_j w_j∂_jF(Q)=0 is zero. The last two conditions define η⊂2Q with lengths 2 and length(η∩L)=1. For r=7 take L⊂ℚ⁸ of dimension 5, seven double supports on L and eight outside L, all fifteen projectively distinct; no remainder condition is imposed. The only containing cubic singular at those supports is zero. Witness ranks are 56 and 120; openness gives the corresponding general configurations.

Choose integer subspace frames and support vectors in the prescribed incidences for dimensions 5,7. Build the homogeneous derivative constraints together with value constraints at integer sample points on each space, and any specified remainder-direction constraints. A full-column minor has nonzero residue modulo 101, giving ranks 56,120. These are necessary conditions for a containing cubic, so full column rank excludes it; openness yields the general assertion.

*Needs:* [Exact integer rank witnesses](#31-exact-low-degree-rank-witnesses); [Rank in flat point families](#24-families-and-limits).

([BO line 517, §5 Proposition 5.4 pp. 10–11](https://arxiv.org/pdf/math/0701409v2)).

**Checks.**

- In r=5 containment has rank 10 and the nine double supports give combined rank 55. The transverse derivative at Q raises it to 56; the value at Q is already zero by containment.
- With local L=(z₁=z₂=z₃=0) and w in the z₁ direction, η has algebra ℚ[ε]/ε² with z₁↦ε. Its trace on L kills ε, giving 2=1+1; if w were tangent, its trace length would be 2 and the derivative would add no condition to a containing cubic.
- In r=7 containment has rank 35 and the fifteen double supports raise it to 120; no extra support or remainder is used. The support counts are 7=7·6/6 and 8=r+1.

**One-subspace cubic recursion.** For r≥3,r≠4, let L have codimension 3. If r≠2 mod3, prescribe r(r−1)/6 general distinct double supports on L and r+1 general ambient double supports outside L. If r≡2 mod3, prescribe (r+1)(r−2)/6 general distinct double supports on L, r+1 general ambient double supports outside L, and a general η⊂2Q at a further general Q∈L of length δ_r=(r+1)/3 and trace length δ_r−1. No nonzero cubic containing L satisfies these conditions.

Introduce a second codimension-three space M. Specialize the required on-L supports to L∩M and r−2 ambient supports to M; in the remainder case place η inside M with the prescribed trace. The restriction image is controlled by the r−3 one-space assertion and the kernel by the two-space assertion. Use a finite-flat η family inside a double point to preserve the trace and length requirements.

*Needs:* [One-subspace cubic base rank witnesses](#33-codimension-three-cubic-systems); [Two-subspace cubic recursion](#33-codimension-three-cubic-systems); [Rank in flat point families](#24-families-and-limits).

([BO line 517, §5, Proposition 5.4, pp.10–11](https://arxiv.org/pdf/math/0701409v2)).

**Cubic critical-count remainder.** Put q_r=floor((r+3)(r+2)/6) and δ_r=N(r,3)−(r+1)q_r. Then δ_r=0 for r≠2 mod3 and δ_r=(r+1)/3 otherwise. For r≥2,r≠4, q_r general double points together with a general η⊂2Q of length δ_r impose N(r,3) independent conditions.

Compute δ_r by r modulo three. A codimension-three specialization puts q_(r−3) doubles and the trace of η on L, leaving r+1 ambient doubles. Apply the lower-dimensional critical assertion to the trace and the one-space assertion to the kernel. In P² the three coordinate supports leave only the triangle cubic x₀x₁x₂, and its value at [1:1:1] kills it.

*Needs:* [One-subspace cubic recursion](#33-codimension-three-cubic-systems); [Low-degree near-exception ranks](#31-exact-low-degree-rank-witnesses); [Independent subschemes](#23-testing-independence-on-curvilinear-subschemes).

([BO line 461, §5, Theorem 5.1, pp.9–12](https://arxiv.org/pdf/math/0701409v2)).

**Cubic maximal-rank input.** The headline `cubicDoublePointRank` states the affine realization over every characteristic-zero field. For r≥2, general q double points in P^r have maximal rank in degree 3 unless (r,q)=(4,7). In dimension 4 only q≤6 or q≥8 are used in the induction. The affine headline has r≥2 and q≥0 and excludes exactly (r,q)=(4,7).

The remainder assertion gives the critical floor independence. When δ_r>0, enlarging η to its containing double point kills the kernel at the critical ceiling count. Use subset and superscheme monotonicity; in dimension four use the separate six-point and eight-point bases.

*Needs:* [Cubic critical-count remainder](#33-codimension-three-cubic-systems); [Low-degree near-exception ranks](#31-exact-low-degree-rank-witnesses); [Independent subschemes](#23-testing-independence-on-curvilinear-subschemes).

([BO line 461, §5, Theorem 5.1, pp.9–12; §3, p.7](https://arxiv.org/pdf/math/0701409v2)).

### 3.4 The quartic starting dimension

**Quartic P⁵ critical rank.** The headline `quarticFive` gives a distinct rational affine witness.  There is a configuration of 21 distinct points in P⁵ whose homogeneous quartic first-derivative constraint matrix has full rank 126. Therefore 21 general double points impose independent quartic conditions.

At 21 distinct integer supports in P⁵, an integer homogeneous quartic derivative matrix has a 126-minor nonzero modulo 101. This reaches both the source and target dimensions. Lift the determinant and use rank openness to obtain the general quartic assertion.

*Needs:* [Exact integer rank witnesses](#31-exact-low-degree-rank-witnesses); [Rank in flat point families](#24-families-and-limits).

([BO line 932, §6 p. 19 final quartic base](https://arxiv.org/pdf/math/0701409v2)).

### Examples

The plane sextic ranks are 27 and 28; the quartic rank for 21 supports in P⁵ is 126. The exceptional cubic at (r,q)=(4,7) is excluded from the cubic maximum-rank claim.

### Dependencies

Layers 0–2; SchemeAndStackFoundations §5.12, Layer 2 §2.0 relative generic smoothness and Layer 3 §3.2 plane singular-curve incidence.

## Layer 4: Differential Horace and generic projective interpolation

The differential theorem connects the trace and two lower-degree predecessors, with both critical counts handled explicitly. This layer first establishes the arithmetic and residual tools, then the moving-family rank argument, and finally the quartic and degree-at-least-five induction. Maximal rank is maintained throughout, so overfilled systems give injectivity.

For r≥2 and d≥4, the two critical counts satisfy
floor(N(r,d)/(r+1))≤q≤ceil(N(r,d)/(r+1)). Define the integer division data by

    ru + e = q(r+1) − N(r,d−1), with 0 ≤ e < r.

Fix a hyperplane H and pairwise distinct, simultaneously general support lists:
Φ consists of u points on H; Γ consists of e further points on H; and Σ
consists of q−u−e points off H. In the full induction all three hypotheses

    AH(r−1,d,u), AH(r,d−1,q−u), AH(r,d−2,q−u−e)

are explicit inputs. The *successful residual setup* means that
Φ∪Σ²∪(Γ²|H) is independent in degree d−1, with total length N(r,d−1).
This is obtained by the partial-residual, restriction-injectivity and
simple-point results below. A *simultaneous choice* intersects the trace and
residual nonempty opens in their irreducible parameter scheme. The trace used
in the overfilled branch is the selected partial trace Φ²|H∪Γ₀ with
|Γ₀|=ν, rather than the full Γ trace.

### 4.1 Integer division and the Horace size inequalities

**Horace trace-size inequality.** For r≥2,d≥4,0≤q≤ceil(N(r,d)/(r+1)), let integers u,e satisfy ru+e=q(r+1)−N(r,d−1) and 0≤e<r. Then re+u≤N(r−1,d−1).

Bound q(r+1) by N(r,d)+r and insert the division relation and Pascal identity. Use 0≤e<r to estimate re+u. The sharp estimate includes the small pairs (r,d)=(3,4),(4,4),(5,4), which are checked by integer division rather than asymptotics.

*Needs:* [Binomial count of bounded monomials](#01-the-bounded-monomial-basis).

([BO line 733, §6 Lemma 6.3(i), pp. 15–16](https://arxiv.org/pdf/math/0701409v2)).

**Horace residual-size inequality.** For the same r,d,q,u,e, N(r,d−2)≤(q−u−e)(r+1).

Eliminate q with ru+e=q(r+1)−N(r,d−1), then insert the trace bound for u+re. Pascal gives N(r,d−1)−N(r−1,d−1)=N(r,d−2). The resulting positive lower bound also forces q−u−e≥0.

*Needs:* [Horace trace-size inequality](#41-integer-division-and-the-horace-size-inequalities).

([BO line 733, §6 Lemma 6.3(ii), pp. 15–16](https://arxiv.org/pdf/math/0701409v2)).

**Large-dimensional quartic residual bound.** For d=4,r≥10 and the integer division data just defined, q−u−e≥r+1.

Specialize the sharper division estimate to d=4, retaining the actual remainder e<r. Check the boundary r=10 and the increasing polynomial bound for larger r. The coarse residual bound alone is weaker than r+1 and is not substituted for this sharp conclusion.

*Needs:* [Horace residual-size inequality](#41-integer-division-and-the-horace-size-inequalities).

([BO line 733, §6 Lemma 6.3(iii), pp. 15–16](https://arxiv.org/pdf/math/0701409v2)).

**Nonnegative critical Horace data.** For r≥2,d≥4 and floor(N(r,d)/(r+1))≤q≤ceil(N(r,d)/(r+1)), the Euclidean-division data u,e above satisfy 0≤u≤q and 0≤q−u−e.

At either critical count q(r+1)≥N(r,d)−r. Comparing with N(r,d−1) makes the dividend nonnegative for r≥2,d≥4. Integer Euclidean division gives u≥0; the residual bound gives q−u−e≥0 and therefore u≤q.

*Needs:* [Horace residual-size inequality](#41-integer-division-and-the-horace-size-inequalities).

([BO line 733, §6, Lemma 6.3, pp.15–16; Theorem 6.4, p.16](https://arxiv.org/pdf/math/0701409v2)).

### 4.2 Filling the residual and trace systems

**Mixed residual rank in degree d−1.** Let q,u,e be critical Horace data and assume AH(r,d−1,q−u). Choose Σ of q−u−e general off-H supports and Γ of e general supports on H. Their full doubles at Σ and H-restricted doubles at Γ have rank (r+1)(q−u)−e in degree d−1; their vanishing-system dimension is u.

Specialize e supports to H, discard their normal derivative conditions and prove independence of the remaining restricted conditions using the lower-degree hypothesis and trace bound. This requires the specialization and transversality argument; row deletion by itself does not establish it. Subtract the independent-condition count from N(r,d−1) to obtain dimension u.

*Needs:* [Horace trace-size inequality](#41-integer-division-and-the-horace-size-inequalities); [Nonnegative critical Horace data](#41-integer-division-and-the-horace-size-inequalities); [Restriction rank on disjoint unions](#21-ranks-of-section-maps); [Rank in flat point families](#24-families-and-limits).

([BO line 764, §6 Theorem 6.4 Step 1 pp. 16–17](https://arxiv.org/pdf/math/0701409v2)).

**Injective residual restriction to H.** Assume AH(r,d−2,q−u−e). By the numerical residual bound, no degree d−2 form vanishes doubly at Σ. Consequently restriction to H is injective on the degree d−1 system vanishing on Σ² and the restricted doubles Γ²|H.

The numerical residual bound makes the degree-(d−2) predecessor overfilled, so its maximal rank kills its kernel. A degree-(d−1) residual section that restricts to zero on H is divisible by the equation of H. Its quotient vanishes doubly at off-H Σ and must therefore be zero.

*Needs:* [Horace residual-size inequality](#41-integer-division-and-the-horace-size-inequalities); [Mixed residual rank in degree d−1](#42-filling-the-residual-and-trace-systems); [Finite-scheme residual and trace](#22-hyperplane-residuals-and-ordinary-horace).

([BO line 764, §6, Theorem 6.4, Step 2, p.16](https://arxiv.org/pdf/math/0701409v2)).

**Killing a residual system with simple points.** If a degree d−1 residual linear system has dimension u and restricts injectively to H, then u general reduced points Φ on H make its restriction map injective. Applied to the Horace residual system this fills N(r,d−1) conditions.

A nonzero restricted section on the reduced hyperplane is nonzero at some k-point. Successively choose a point that lowers the evaluation kernel dimension by one; distinct choices occur on a nonempty open. After u choices the injectively restricted u-dimensional system has zero kernel.

*Needs:* [Injective residual restriction to H](#42-filling-the-residual-and-trace-systems); [Rank in flat point families](#24-families-and-limits); [Restriction rank on disjoint unions](#21-ranks-of-section-maps).

([BO line 764, §6, Theorem 6.4, Step 2, p.16](https://arxiv.org/pdf/math/0701409v2)).

**Underfilled trace with simple remainder.** In the underfilled critical case q(r+1)≤N(r,d), assuming AH(r−1,d,u), choose Φ,Γ on H as above so h(Φ²|H∪Γ,d)=ru+e. Every subcollection of the simple Γ points preserves independence.

The underfilled division identity gives ru+e≤N(r−1,d). Use AH(r−1,d,u) for Φ, then add e general simple points to its remaining section system. Intersect this open with the residual-filling open for Φ; irreducibility gives a simultaneous choice.

*Needs:* [Killing a residual system with simple points](#42-filling-the-residual-and-trace-systems); [Independent subschemes](#23-testing-independence-on-curvilinear-subschemes); [Rank in flat point families](#24-families-and-limits).

([BO line 764, §6, Theorem 6.4, Step 3, p.17](https://arxiv.org/pdf/math/0701409v2)).

### 4.3 The moving finite-flat family

**Moving supports and hyperplanes.** For fixed Γ={γ_i}⊂H, choose an actual algebraic family δ_i(t_i) with δ_i(0)=γ_i and general δ_i(t_i) off H, together with hyperplanes H_i(t_i) through δ_i(t_i) specializing to H. The corresponding full and hyperplane-restricted double-point families are finite flat over the parameter open.

In a chart choose δ_i(t_i)=γ_i+t_i v_i with v_i transverse to H and vary a hyperplane equation through δ_i(t_i). Construct the squared-point and hyperplane-restricted families here in affine coordinates, and glue them using SchemeAndStackFoundations §0.28. Use Layer 2 §2.0 finite locally free pushforward for the general family operations. Restrict to the open where supports remain distinct; full and hyperplane-restricted fibres have lengths r+1 and r.

The API has the following properties.

- δ_i(0)=γ_i and H_i(0)=H.
- The double-point and restricted double-point families have constant ranks r+1 and r over the distinct-support open.
- Any parameter base change pulls back the same squared-ideal incidence family.

**Checks.**

- In A² with H=(y=0), δ(t)=(a,t) and H_t=(y=t) give the stated fibres.
- At t=0 the double point retains length 3; it does not become reduced.
- Intersecting its double scheme with H_t gives length 2, agreeing with the local square-zero quotient.

*Needs:* [Proper limits of curvilinear failures](#24-families-and-limits); AlgebraicModuliForArithmeticGeometry §§1.7, 2.1; Layer 2 §2.0 finite locally free pushforward; SchemeAndStackFoundations §§0.28, 2.6.

([BO line 764, §6 Theorem 6.4, moving families in the first and second cases, pp. 17–18](https://arxiv.org/pdf/math/0701409v2)).

**Compatible bad-incidence specialization.** In the critical Horace
setup of this layer, with its successful residual system and the independent trace selected in the relevant branch, let B be the distinct-support open in the e-fold product of
support-parameter curves, with a chosen zero configuration. Let C→B be the
product of projective tangent-line parameters and let W⊂C be the closed locus
where the fixed system I_(Φ²∪Σ²)(d) on the union of e length-two directions has
rank less than 2e. The fixed base Φ²∪Σ² is d-independent of length (r+1)(q−e), so this is equivalent to total rank less than (r+1)(q−e)+2e. In the overfilled branch restrict the directions at the
hyperplane-restricted indices to their moving hyperplanes. Under a generic
failure, prove existence of a diagram in W containing a
lift of the generic support configuration, the mixed configurations with
F supports on H and G supports off H, and a common all-zero specialization.
At that special point F are the transverse directions and G the tangent ones.

The allowed changes are restriction to parameter neighborhoods retaining the
zero and generic points, finite dominant covers, and proper modifications
that are isomorphisms on a dense open. Every selected mixed stratum dominates its specified support stratum;
this dominance is part of the conclusion. The pulled-back direction schemes must remain finite flat of length
two with distinct supports. The same determinantal upper-rank bound must hold
at every point of the diagram. The transverse F directions must stay transverse
on the relevant mixed stratum; the G directions specialize to directions in H.
A modification with no such mixed stratum cannot be used. No product of
independent sections or uniquely chosen limit is asserted.

The target is the existence of this whole diagram for the specified Horace
family under generic failure, with the successful residual and trace hypotheses.
Its route uses the closure of the bad incidence over the product parameter and
proves dominance of the selected mixed strata together with their common
specialization. Proper limits along single traits alone do not prove that
compatibility. Both differential contradictions consume this theorem.

The diagram has the following API.

- Its maps to B and C commute with the generic, mixed and all-zero specialization maps, and the direction family is pulled back from the universal incidence.
- Every selected mixed stratum dominates the prescribed support stratum; its transverse indices stay transverse, and its tangent indices have the common special limit in H.
- Factoring through W supplies the same strict upper rank bound throughout the diagram, while the pulled-back direction schemes remain finite flat of length two with distinct supports.

**Checks.**

- For one moving support δ(t)=(a,t) and a fixed transverse direction, the limit direction has trace length 1 and residual length 1; the generic and special direction lengths are both 2.
- For two constant directions with F={1}, G={2}, the mixed support tuple is ((a,0),(b,t)); at t≠0 its residual direction lengths are 1 and 2, and its trace direction lengths are 1 and 0.
- The graph of [s:t] over A² minus the origin has axis limits [0:1] and [1:0]. Its blowup separates these points; neither properness nor a trait lift identifies them or guarantees a prescribed mixed stratum through either one.
- For e=0 the rank condition is rank<0, so W is empty; no natural subtraction may turn this into a nonempty rank-zero locus.

*Needs:* Curvilinear reduction; Rank in flat point families;
Moving supports and hyperplanes; Killing a residual system with simple points;
Underfilled trace with simple remainder, or the independent partial trace
specified in the overfilled branch; Layer 2 §2.4 universal direction family;
AlgebraicModuliForArithmeticGeometry §§1.1, 1.7.
(Source: BO line 846, Theorem 6.4,
pp.17–19, inequalities (3)–(4), and BO line 914, the final paragraph of the second case; the compatibility requirement is
additional to its pointwise description.)

**Transverse curvilinear limit rank.** Assume the chosen partial trace Φ²|H∪Γ₀ is d-independent, with F⊆Γ₀ a set of f moving length 2 directions whose limits are transverse to H. Their special traces retain one reduced support each, so h(Φ²|H∪F,d)=ru+f. Their local residuals have length 1 each. Those reduced F residuals, Φ, Σ² and the tangent length-two limits at G form a subscheme of the successful residual setup; their degree-(d−1) rank is u+(r+1)(q−u−e)+f+2g, with no extra rank added to the already filled system.

The local ideal of a transverse length-two direction has a reduced length-one trace and a reduced length-one residual. Independence of the selected partial trace gives rank ru+f by subset monotonicity. Subset independence in the filled system supplies this smaller scheme’s rank.

*Needs:* Compatible bad-incidence specialization (Layer 4 §4.3); [Moving supports and hyperplanes](#43-the-moving-finite-flat-family); [Finite-scheme residual and trace](#22-hyperplane-residuals-and-ordinary-horace); [Proper limits of curvilinear failures](#24-families-and-limits); [Independent subschemes](#23-testing-independence-on-curvilinear-subschemes); [Killing a residual system with simple points](#42-filling-the-residual-and-trace-systems).

([BO line 764, §6 Theorem 6.4 first case p. 18](https://arxiv.org/pdf/math/0701409v2)).

**Tangent directions in the moving residual.** In the critical Horace setup with the successful Step2 (d−1)-independent residual system Φ∪Σ²∪Γ²|H, take g bad curvilinear directions whose limits lie in H and f transverse indices, with f+g=e. Keep the tangent supports at a general nonzero parameter during the mixed residual estimate. They contribute 2g independent residual conditions; combined residual rank is at least u+(r+1)(q−u−e)+f+2g.

Split indices into transverse F and tangent G. Use the compatible bad-incidence specialization of §4.3 to place the F supports on H while G stays off H, preserving the bad rank bound and the common special configuration. Combine the successful residual setup, subset independence and rank semicontinuity to obtain the lower bound.

*Needs:* Compatible bad-incidence specialization (Layer 4 §4.3); [Killing a residual system with simple points](#42-filling-the-residual-and-trace-systems); [Moving supports and hyperplanes](#43-the-moving-finite-flat-family); [Rank in flat point families](#24-families-and-limits); [Proper limits of curvilinear failures](#24-families-and-limits).

([BO line 764, §6 Theorem 6.4 first case p. 18](https://arxiv.org/pdf/math/0701409v2)).

### 4.4 The two critical-count arguments

**Underfilled differential Horace contradiction.** For r≥2,d≥4 and critical q with q(r+1)≤N(r,d), assume the compatible bad-incidence specialization theorem, AH(r−1,d,u), AH(r,d−1,q−u), AH(r,d−2,q−u−e), and the simultaneous residual/trace setup above. A curvilinear failure at the e moved supports would have rank below (r+1)(q−e)+2e, while the mixed specialization has rank at least that number. Hence a nonempty open set of moves is independent.

Curvilinear reduction and the compatible bad-incidence specialization theorem give the required generic, mixed and special configurations inside the same closed failure locus. Add the mixed residual bound u+(r+1)(q−u−e)+f+2g to the trace bound ru+f. Since f+g=e, this is (r+1)(q−e)+2e, contradicting the closed upper-rank condition of failure.

*Needs:* Compatible bad-incidence specialization (Layer 4 §4.3); [Transverse curvilinear limit rank](#43-the-moving-finite-flat-family); [Tangent directions in the moving residual](#43-the-moving-finite-flat-family); [Castelnuovo dimension bound](#22-hyperplane-residuals-and-ordinary-horace); [Curvilinear reduction](#23-testing-independence-on-curvilinear-subschemes); [Rank in flat point families](#24-families-and-limits); [Underfilled trace with simple remainder](#42-filling-the-residual-and-trace-systems).

([BO line 764, §6, Theorem 6.4, first case, pp.17–18](https://arxiv.org/pdf/math/0701409v2)).

**Overfilled partial-length reduction.** For r≥2,d≥4 and critical q with q(r+1)>N(r,d), assume AH(r−1,d,u), AH(r,d−1,q−u), AH(r,d−2,q−u−e), and the successful simultaneous residual/trace setup. Put ν=N(r−1,d)−ru. If ν<0 ordinary Horace applies. Otherwise 0≤ν<e; choose Γ₀⊆Γ with ν supports so Φ²|H∪Γ₀ is independent. Replacing the moved e doubles by ν full doubles and e−ν hyperplane-restricted doubles gives a subscheme of length exactly N(r,d).

For ν≥0 select ν simple trace supports from Γ and keep only the corresponding full moving doubles; at the other indices use hyperplane-restricted doubles. Its length is (q−e)(r+1)+ν(r+1)+(e−ν)r=N(r,d). If ν<0, trace injectivity and the filled residual already give ordinary Horace.

*Needs:* [Nonnegative critical Horace data](#41-integer-division-and-the-horace-size-inequalities); [Horace residual-size inequality](#41-integer-division-and-the-horace-size-inequalities); [Ordinary Horace criterion](#22-hyperplane-residuals-and-ordinary-horace); [Moving supports and hyperplanes](#43-the-moving-finite-flat-family); [Killing a residual system with simple points](#42-filling-the-residual-and-trace-systems); [Independent subschemes](#23-testing-independence-on-curvilinear-subschemes); [Rank in flat point families](#24-families-and-limits).

([BO line 764, §6 Theorem 6.4 second case p. 18](https://arxiv.org/pdf/math/0701409v2)).

**Overfilled differential Horace contradiction.** Under the overfilled partial-length reduction hypotheses, its successful setup and the compatible bad-incidence specialization theorem, with ν≥0, apply the mixed-parameter transverse/tangent argument to its independent selected trace Φ²|H∪Γ₀, not to the full Γ trace. This makes the partial-length subscheme independent and therefore makes the full q-double-point system injective in degree d.

In the partial scheme, every direction at a restricted index belongs to the tangent set G. Transverse F is consequently a subset of the ν selected trace supports, where the trace rank bound applies. The same mixed-rank contradiction gives independence at length N(r,d); enlarging to all full doubles preserves injectivity.

*Needs:* Compatible bad-incidence specialization (Layer 4 §4.3); [Overfilled partial-length reduction](#44-the-two-critical-count-arguments); [Transverse curvilinear limit rank](#43-the-moving-finite-flat-family); [Tangent directions in the moving residual](#43-the-moving-finite-flat-family); [Independent subschemes](#23-testing-independence-on-curvilinear-subschemes); [Curvilinear reduction](#23-testing-independence-on-curvilinear-subschemes).

([BO line 764, §6 Theorem 6.4 second case pp. 18–19](https://arxiv.org/pdf/math/0701409v2)).

### 4.5 The differential induction theorem

**Differential Horace induction step.** For r≥2,d≥4 and a critical q, suppose AH(r−1,d,u), AH(r,d−1,q−u), and AH(r,d−2,q−u−e) for the division data. Then AH(r,d,q) holds. Here AH means generic maximal rank, not independence when the system is overfilled.

Choose the residual and trace configurations on simultaneous nonempty opens using all three predecessor hypotheses. Use the underfilled contradiction when q(r+1)≤N(r,d), and the partial-length argument or its ordinary branch otherwise. A witness and rank openness give AH(r,d,q).

*Needs:* [Mixed residual rank in degree d−1](#42-filling-the-residual-and-trace-systems); [Killing a residual system with simple points](#42-filling-the-residual-and-trace-systems); [Underfilled differential Horace contradiction](#44-the-two-critical-count-arguments); [Overfilled differential Horace contradiction](#44-the-two-critical-count-arguments).

([BO line 764, §6, Theorem 6.4, pp.16–19](https://arxiv.org/pdf/math/0701409v2)).

### 4.6 The univariate base

**Univariate Hermite interpolation.** The headline `univariateHermiteRank` states the rank formula. For any field k, every injective n-tuple in A¹ with 2n≤d+1 has surjective first-jet evaluation. More generally its rank is min(d+1,2n).

The pairwise comaximal ideals (x−P_i)² have product a monic polynomial of degree 2n. Division gives a unique representative of degree less than 2n in the quotient. Below that degree the restriction is injective; at and above it the map is surjective. This reasoning uses no division by factorials.

*Needs:* [Double-point quotient comparison](#12-the-finite-double-point-scheme-and-its-quotient); [Full row rank criterion](#14-matrix-rank-and-projective-restriction).

([BO line 943, §1 univariate remark p. 1; §7.1 opening paragraph p. 19](https://arxiv.org/pdf/math/0701409v2)).

### 4.7 Quartic induction and the exception schedule

**Quartic P⁷ ordinary Horace input.** Assuming the quartic 30-point assertion in P⁶, quartic q=41 and q=42 in P⁷ have maximal rank by specializing u=30 supports to a hyperplane; both ordinary Horace inequalities have the matching direction.

Use u=30 hyperplane supports. The quartic trace has dimension and length 210; the cubic residual has source dimension 120 and lengths 118 or 126 for q=41 or 42. Cubic maximal rank and general simple-point selection supply the residual. The quartic input in P⁶ is a hypothesis of this argument.

*Needs:* [Cubic maximal-rank input](#33-codimension-three-cubic-systems); [Ordinary Horace criterion](#22-hyperplane-residuals-and-ordinary-horace); [Killing a residual system with simple points](#42-filling-the-residual-and-trace-systems).

([BO line 932, §6 p. 19](https://arxiv.org/pdf/math/0701409v2)).

**Quartic induction inputs.** The headline `quarticDoublePointRank` states the affine realization over every characteristic-zero field, for r≥5 and every q≥0. Quartic critical counts have maximal rank for r≥5. For r=6,8,9 the differential Horace data avoid the low-degree exceptions; for r≥10 its degree-2 residual vanishing system is zero by q−u−e≥r+1.

Induct increasingly in dimension from r=5. Handle r=7 by ordinary Horace and r=6,8,9 by the differential theorem with explicit critical division data. For r≥10, the quartic arithmetic bound ensures at least r+1 supports in the quadratic predecessor, so its kernel vanishes. The other predecessors are the cubic theorem and the smaller-dimensional quartic theorem.

*Needs:* [Quartic P⁵ critical rank](#34-the-quartic-starting-dimension); [Quartic P⁷ ordinary Horace input](#47-quartic-induction-and-the-exception-schedule); [Quadrics with prescribed singular points](#31-exact-low-degree-rank-witnesses); [Cubic maximal-rank input](#33-codimension-three-cubic-systems); [Differential Horace induction step](#45-the-differential-induction-theorem); [Large-dimensional quartic residual bound](#41-integer-division-and-the-horace-size-inequalities).

([BO line 932, §6 p. 19 final induction](https://arxiv.org/pdf/math/0701409v2)).

**Exception-avoiding induction schedule.** For r≥3,d≥5 and each critical q, the differential-Horace predecessor triples avoid all exceptional AH cases, once the plane and cubic inputs and the quartic bases are used. The induction is lexicographic in degree and then dimension; the r=2 case is supplied independently.

Use the complete low-degree exception list. For d=5 examine quartic and cubic predecessors; for d=6 examine the quartic residual; for d≥7 their degrees are at least five. Combine the quartic schedule and critical division inequalities to exclude every exceptional predecessor for r≥3. The plane case is a separate input.

*Needs:* [Plane interpolation input](#32-plane-interpolation-through-tangent-and-contact-geometry); [Cubic maximal-rank input](#33-codimension-three-cubic-systems); [Quartic induction inputs](#47-quartic-induction-and-the-exception-schedule); [Nonnegative critical Horace data](#41-integer-division-and-the-horace-size-inequalities).

([BO line 932, §6 p. 19 final induction](https://arxiv.org/pdf/math/0701409v2)).

### 4.8 The projective endpoint

**Generic characteristic-zero double-point rank.** Over algebraically closed characteristic-zero k, for r≥1,d≥5 and every q≥1, a nonempty Zariski-open subset of ordered distinct q-tuples in (P^r)^q has homogeneous degree-d jet rank min(N(r,d),q(r+1)). The headline `genericDoublePointRank` states its affine first-jet realization over every characteristic-zero field, for every q≥0: some injective P:Fin q→k^r has firstJetMatrix rank min(N(r,d),q(r+1)).

Prove the two critical counts by lexicographic induction in degree then dimension, with the separate plane and univariate inputs. Pass to subsets below the floor count and add supports above the ceiling count. Irreducibility and rank openness turn each maximal-rank witness into the required nonempty open.
For the affine headline intersect this open with the standard chart. A
nonzero rank-size minor, multiplied by one nonzero coordinate difference
for each pair of supports, is a nonzero polynomial over ℚ. Polynomial
extensionality over the infinite field ℚ supplies a rational tuple where the
product is nonzero. The same nonzero rational determinant stays nonzero in
every characteristic-zero field; the dimensional upper bound gives equality.
For q=0 the empty matrix has rank 0. The identical rational-minor descent gives the plane, cubic and quartic affine headlines from their respective geometric rank opens; it is independent of the integer-box theorem.

**Checks.**

- For r=1,d=5,q=0 the rank is 0=min(6,0). For q=1 the origin gives rank 2=min(6,2).
- For r=1,d=5,q=4, supports 0,1,2,3 give rank 6=min(6,8): the conclusion is injectivity, with an eight-dimensional jet target that cannot be filled.
- The assumption r≥1 excludes r=0,q=2, where both affine supports must be equal and no injective tuple exists, although the scalar evaluation matrix still has rank 1.

*Needs:* [Differential Horace induction step](#45-the-differential-induction-theorem); [Exception-avoiding induction schedule](#47-quartic-induction-and-the-exception-schedule); [Univariate Hermite interpolation](#46-the-univariate-base); [Plane interpolation input](#32-plane-interpolation-through-tangent-and-contact-geometry); [Independent subschemes](#23-testing-independence-on-curvilinear-subschemes); [Rank in flat point families](#24-families-and-limits); [Restriction to projective double points](#14-matrix-rank-and-projective-restriction); `MvPolynomial.funext` (Mathlib).

([BO line 18, §1, Theorem 1.1, p.1; §6, conclusion, p.19](https://arxiv.org/pdf/math/0701409v2)).

### Examples

For (r,d,q)=(3,6,21), the division data are (u,e)=(9,1). For quartics in P⁷, trace length 210 and residual lengths 118,126 match source dimensions 210,120.

### Dependencies

Layers 0–3; the three explicitly named predecessor AH assertions; compatible bad-incidence specialization (§4.3).

## Layer 5: Affine principal opens and integer coordinates

The projective theorem meets the affine chart and gives a full-row-rank witness. The universal integer matrix then yields a chosen nonzero maximal minor, a principal open and an integer box point. Polynomial pullback is conditional on nonvanishing in the consumer’s parameter family.

### 5.1 The affine chart and universal matrix

**Passing to the dense affine chart.** The ordered-distinct affine chart of
(P^r)^n is a nonempty dense open for r,n≥1. For every d≥0, whenever the
projective maximal-rank locus is nonempty, it meets this chart, where fixed
homogenization identifies the projective and bounded-polynomial first-jet
ranks. In the endpoint range d≥5, §4.8 supplies that nonempty rank locus.

Intersect the generic projective rank locus with the standard chart in every factor and with the complement of all support diagonals. These are nonempty opens in the irreducible projective product. Apply the actual homogeneous-section/first-jet comparison on that chart.

*Needs:* [Generic characteristic-zero double-point rank](#48-the-projective-endpoint); [Restriction to projective double points](#14-matrix-rank-and-projective-restriction); SchemeAndStackFoundations §§0.28, 2.6.

([COU line 167, §3, p.491](https://annals.math.princeton.edu/wp-content/uploads/annals-v192-n2-p04-s.pdf); [BO line 18, §1, Theorem 1.1, p.1](https://arxiv.org/pdf/math/0701409v2)).

**Universal first-jet matrix.** Define `universalJetMatrix` by evaluating `firstJetMatrix` at independent polynomial variables. For r,n,d≥0 define a matrix U(r,n,d) over ℤ[Tᵢⱼ] with the same row and column indices as firstJetMatrix. Its entries are T_i^α and α_jT_i^(α−e_j). Evaluation in any commutative ring at a tuple P gives firstJetMatrix(P,d).

Use native integer polynomials in variables indexed by Fin n×Fin r. Rename each monomial into the i-th coordinate block and apply the exponent-decrement derivative formula. Evaluation through the canonical integer algebra map commutes with the entries and their determinants.

The API has the following properties.

- Evaluating Tᵢⱼ=P_ij in k gives firstJetMatrix(P,d).
- The value entry is the product of T_i coordinates to exponent α.
- The derivative entry is α_j times the exponent-decremented monomial, zero when α_j=0.

**Checks.**

- For r=n=d=1, the matrix in columns 1,x is [[1,T],[0,1]], determinant 1.
- For d=0 all derivative rows are zero.
- Evaluating at P=3 gives the native value 9 and derivative 6 for x².

*Needs:* [Monomial first-jet matrix](#14-matrix-rank-and-projective-restriction); `MvPolynomial.aeval` (Mathlib); `MvPolynomial.pderiv_monomial` (Mathlib).

([COU line 229, §3 pp. 491–492](https://annals.math.princeton.edu/wp-content/uploads/annals-v192-n2-p04-s.pdf)).

### 5.2 A selected determinant and its principal open

**Selected determinant.** Define `selectedMinor` for a column embedding JetRows n r→A(r,d) as the
determinant of that square submatrix of U. The fixed row ordering is used for
both rows and the domain of the column embedding.

The API has the following properties.

- Evaluation at any ring-valued tuple gives the selected determinant of its specialized first-jet matrix.
- Precomposing the column embedding by one transposition changes the sign, with the same row ordering on both sides.
- At a tuple with repeated supports and n≥2, the determinant vanishes because its value rows repeat.

**Checks.**

- At one point in A¹, columns (1,x) give [[1,T],[0,1]] and determinant 1.
- Swapping those columns gives [[T,1],[1,0]] and determinant −1 over ℤ, fixing the sign convention.
- For n=2,r=1,d=3, supports 0,0 duplicate value rows and give determinant 0; at supports 0,1 the same ordered columns (1,x,x²,x³) give determinant 1.

(Source: COU line 229, §3, pp.491–492; determinant specialization is the native algebraic reformulation.)

**Degree of a first-jet minor.** For any m=n(r+1) chosen-column minor Δ of U, totalDegree Δ≤md and degreeOf(T_ij)≤md. The bound remains valid when Δ=0.

Expand a selected determinant into its signed permutation products. Each value entry has total degree at most d and each nonzero derivative entry at most d−1, giving total degree at most md for every term and their sum. Coordinate degree is bounded by total degree, also for the zero polynomial.

*Needs:* [Universal first-jet matrix](#51-the-affine-chart-and-universal-matrix); `MvPolynomial.degreeOf_le_totalDegree` (Mathlib).

([COU line 229, §3 pp. 491–492](https://annals.math.princeton.edu/wp-content/uploads/annals-v192-n2-p04-s.pdf)).

**Evaluation prime.** Define `evaluationPrime` for a field k and an ordered tuple P as the kernel
of k[T]→k, Tᵢⱼ↦Pᵢⱼ. Its primality follows from Mathlib
`RingHom.ker_isPrime`. The target is the native PrimeSpectrum of k[T].
The parameter scheme and evaluation morphism use Mathlib's Spec directly.
The API has the following properties.

- The underlying ideal is the kernel of evaluation k[T]→k at P.
- Every coordinate difference Tᵢⱼ−Pᵢⱼ evaluates to zero and belongs to that ideal.
- Its point belongs to D(Δ) exactly when Δ evaluates nonzero at P.

**Checks.**

- At the origin over ℚ, every Tᵢⱼ belongs to the evaluation ideal and 1 does not.
- In one coordinate, the rational tuples 0 and 1 give ideals (T) and (T−1); T lies only in the first, so their spectrum points differ.
- With nr=0 the polynomial algebra is k, the evaluation kernel is (0), and the parameter scheme is Spec k with its unique point.

(Source: COU line 229, §3, p.492; kernel and spectrum identification is the native algebraic reformulation.)

**Principal-open full-jet locus.** For any field k, r,n,d≥0 and any selected minor mapped into k[T], D(Δ)⊂Spec(k[T]) is the native principal open. Its k-points are exactly ordered affine tuples with eval_P Δ≠0; each such tuple is injective and J(P,d) is onto. A tuple with nonzero evaluation makes this open nonempty; no existence of such a tuple is needed for the implication.

Map the selected integer determinant into k[T]. Use the existing AffineSpace.SpecIso to identify the ordered affine parameter space with Spec k[T]. A tuple gives the native evaluation morphism Spec k→Spec k[T] over Spec k; its image is the evaluation prime kernel and it avoids Δ exactly when its evaluation is nonzero. The selected square submatrix then gives full row rank. Repeated supports would duplicate value rows, so nonvanishing also gives distinctness.

*Needs:* [Universal first-jet matrix](#51-the-affine-chart-and-universal-matrix); `PrimeSpectrum.basicOpen` (Mathlib); `PrimeSpectrum.mem_basicOpen` (Mathlib); `AlgebraicGeometry.Spec.map` and `Spec.map_apply` (Mathlib); `AlgebraicGeometry.AffineSpace.SpecIso` (Mathlib).

([COU line 167, §3 p. 491](https://annals.math.princeton.edu/wp-content/uploads/annals-v192-n2-p04-s.pdf)).

### 5.3 Integer boxes and polynomial parametrizations

**Bounded integer specialization.** The headline `integerGridForMinor` works over every characteristic-zero field k for any r,n,d≥0 and any nonzero selected minor Δ. With B=n(r+1)d, there is an ordered integer tuple with every coordinate in {0,…,B} and Δ nonzero. Its first jets are surjective after embedding the integers into k.

For each variable take the B+1 integers 0,…,B with B=md. The contrapositive of Mathlib’s product-finset vanishing theorem gives an integer assignment where the nonzero Δ remains nonzero. Injectivity of ℤ→k preserves the determinant, giving distinct supports and surjective first jets.

*Needs:* [Degree of a first-jet minor](#52-a-selected-determinant-and-its-principal-open); `MvPolynomial.eq_zero_of_eval_zero_at_prod_finset` (Mathlib); [Principal-open full-jet locus](#52-a-selected-determinant-and-its-principal-open).

([COU line 229, §3 pp. 491–492](https://annals.math.princeton.edu/wp-content/uploads/annals-v192-n2-p04-s.pdf)).

**Nonzero maximal minor.** For every characteristic-zero field k, in the endpoint range r,n≥1,d≥5,n(r+1)≤N(r,d), there exists a choice of n(r+1) distinct columns of U whose determinant Δ∈Z[T] evaluates nonzero at an affine distinct configuration over k. In particular Δ is nonzero.

At an affine full-row-rank witness choose m linearly independent columns. Form their square determinant in the integer universal matrix before evaluating. The value at the witness is nonzero, so the integer polynomial is nonzero as well. Other choices of m columns need not have nonzero determinants. Take the initial witness over an algebraic closure; its selected integer polynomial is nonzero in ℤ[T]. The bounded integer specialization then gives a witness over k itself.

*Needs:* [Bounded integer specialization](#53-integer-boxes-and-polynomial-parametrizations) for an arbitrary nonzero selected minor; [Passing to the dense affine chart](#51-the-affine-chart-and-universal-matrix); [Universal first-jet matrix](#51-the-affine-chart-and-universal-matrix); [Full row rank criterion](#14-matrix-rank-and-projective-restriction).

([COU line 229, §3, pp.491–492: generic rank on p.491 and polynomial minors on p.492; the integer universal minor is the algebraic reformulation here](https://annals.math.princeton.edu/wp-content/uploads/annals-v192-n2-p04-s.pdf)).

**Generic affine Hermite interpolation.** The headline `genericAffinePrincipalOpen` includes the nonzero integer minor and the nonempty full-jet principal open.  For a characteristic-zero field k, r≥1,d≥5,n≥1 and n(r+1)≤N(r,d), a nonempty Zariski-open locus of ordered distinct n-tuples in (A^r_k)^n has surjective value-and-first-derivative evaluation on the native degree≤d submodule. One nonempty principal open D(Δ) suffices.

Combine the selected-minor witness, its principal-open membership criterion and the matrix representation of firstJetMap. The resulting nonempty principal open lies in the ordered-distinct locus and every tuple there is well poised.

*Needs:* Nonzero maximal minor; [Principal-open full-jet locus](#52-a-selected-determinant-and-its-principal-open); [Well-poised double points](#14-matrix-rank-and-projective-restriction).

([COU line 167, §3, p.491](https://annals.math.princeton.edu/wp-content/uploads/annals-v192-n2-p04-s.pdf); [BO line 18, §1, Theorem 1.1, p.1](https://arxiv.org/pdf/math/0701409v2)).

**Polynomial parameter pullback.** The headline `parameterPullback` works over any characteristic-zero field k. Let θ=(θ_ij) be an integer-polynomial point parametrization in a finite set of parameters S. If Δ∘θ is nonzero and each parameter degree is at most B_s, there is an integer parameter vector with 0≤u_s≤B_s for which Δ(θ(u))≠0 and θ(u) is a distinct well-poised configuration after embedding into k.

Form Δ∘θ using native algebra substitution. Apply the coordinatewise product-finset theorem to this nonzero pullback with sets 0,…,B_s, then commute substitution with evaluation. Characteristic-zero integer lifting places the resulting tuple in the selected principal open.

*Needs:* [Universal first-jet matrix](#51-the-affine-chart-and-universal-matrix); [Principal-open full-jet locus](#52-a-selected-determinant-and-its-principal-open); `MvPolynomial.eq_zero_of_eval_zero_at_prod_finset` (Mathlib).

([COU line 229, §3 p. 492](https://annals.math.princeton.edu/wp-content/uploads/annals-v192-n2-p04-s.pdf)).

### 5.4 A boundary test for genericity

**Special collinear configurations fail.** For P_i=(i,0)∈Q²,0≤i≤6,d=5, the first-jet matrix has rank 11 rather than 21. Thus the dimension inequality alone does not imply every distinct tuple is well poised.

The value and x-derivative rows factor through f(x,0), a six-dimensional polynomial space. The y-derivative rows factor through the independent coefficient slice of degree at most four, of dimension five. Ordinary univariate evaluation separates both slices at seven points, proving the exact rank 11.

*Needs:* [Monomial first-jet matrix](#14-matrix-rank-and-projective-restriction); [Full row rank criterion](#14-matrix-rank-and-projective-restriction).

([COU line 167, §3 p. 491 genericity condition; authored counterexample](https://annals.math.princeton.edu/wp-content/uploads/annals-v192-n2-p04-s.pdf)).

### Examples

Seven collinear rational plane points have degree-five rank 6+5=11. For one point in A¹, the selected linear minor is 1 and its integer witness is the origin.

### Dependencies

Layers 0–4; Mathlib determinant, spectrum and product-grid vanishing APIs.

## Downstream consumers

For a fixed choice of columns, let Δ be the determinant of the corresponding
square submatrix of U. Layer 5 exports four compatible facts: evaluation gives
that selected minor of firstJetMatrix; its nonzero locus is a native basic
open; its points are distinct and well poised; and its coordinate degrees
are bounded. The choice of a nonzero minor is existential and depends on the
full-rank witness. The degree estimate applies to every selected minor,
including a zero one. These two quantifiers are kept separate.

The integer-grid theorem can be used before or after a polynomial
parametrization. Before parametrization it supplies independent point
coordinates. After parametrization the caller supplies the nonzero polynomial
Δ∘θ and bounds for its individual parameter degrees. In either case the
integer evaluation is proved nonzero in ℤ, and characteristic zero preserves
it in k. The proof obtains the initial generic witness over an algebraic closure, then descends the nonzero integer minor and its integer-grid witness to every characteristic-zero field.

For projective consumers the restriction comparison must carry its O(d)
trivialization and base-change square. For arithmetic consumers the coordinate
identification is the native monomial coefficient identification, and the real
norm is the transported ℓ² norm. None of the interpolation statements asserts
that an arithmetic parametrization meets the generic locus without its
nonzero-pullback hypothesis.

## Worked examples

The low-degree assertions in Layer 3 admit a uniform exact rank witness interface.
Choose integer homogeneous support vectors and integer frames for the specified
linear subspaces. Columns are all homogeneous monomials of the prescribed
degree. Double-support rows are the r+1 homogeneous partials. Euler's identity
is used only with nonzero degree in characteristic zero. For a cubic required
to contain a linear subspace, evaluations at sample points on that subspace
are necessary conditions, so full column rank of the resulting matrix suffices
to exclude a containing cubic. It does not assert that those evaluation samples
form a basis for every containing-form ideal. A remainder length-two row pair
consists of its value and derivative in the specified transverse direction.

The following determinant sizes are the exact numerical contracts. Each
witness uses distinct projective supports, and subspace witnesses retain the
listed incidence and general-position requirements. A nonzero determinant
modulo 101 lifts to every characteristic-zero field. The passage from one
witness to general configurations uses the appropriate irreducible incidence
parameter and the rank-open theorem of Layer 2.

| Degree and configuration | Required rank |
| --- | ---: |
| Cubic, three codimension-three spaces, r=5,6,7 | 56,84,120 |
| Cubic, two codimension-three spaces, r=5,7 | 56,120 |
| Cubic, one codimension-three space, r=5,7 | 56,120 |
| Cubic, (r,q)=(2,3),(2,4),(3,5),(4,6),(4,8),(7,15) | 9,10,20,30,35,120 |
| Quartic, (r,q)=(2,4),(2,6),(3,8),(3,10),(4,13),(4,15) | 12,15,32,35,65,70 |
| Sextic in P², q=9,10 | 27,28 |
| Quartic in P⁵, q=21 | 126 |

These finite determinants discharge only the specified bases. Their algebraic
lifting, Euler comparison and generic openness are mathematical statements to
prove, as are the unbounded cubic recursion and Horace induction. Exact
arithmetic for selected small dimensions does not replace the symbolic
exception-avoiding induction argument.

## References

- **ST:** The Stacks Project, [Lemma 10.78.2 (00NX)](https://stacks.math.columbia.edu/tag/00NX), finite projective and finite locally free modules. The restriction-of-scalars and tensor comparisons in §2.0 are the affine application.
- **VAK:** Ravi Vakil, *The Rising Sea: Foundations of Algebraic Geometry*,
  [18 November 2017 draft](https://math.stanford.edu/~vakil/216blog/FOAGnov1817public.pdf),
  Definition 12.6.2, p.355; §21.2.20 and Theorem 21.2.24, pp.572–574;
  Theorem 25.3.1, p.681.
  The numbering refers to this draft.
- **BO:** Maria Chiara Brambilla and Giorgio Ottaviani, *On the
  Alexander–Hirschowitz Theorem*, [arXiv:math/0701409v2](https://arxiv.org/pdf/math/0701409v2),
  10 September 2007. The relevant material is Theorem 1.1 and §§2–6,
  printed pp.1–19. The arbitrary-distinct univariate observation is also in
  the opening paragraph of §7.1, p.19. Source dimension n is called r here.
- **COU:** Jean-Marc Couveignes, *Enumerating number fields*,
  [Annals of Mathematics 192 (2020), 487–497](https://annals.math.princeton.edu/wp-content/uploads/annals-v192-n2-p04-s.pdf),
  §3, printed pp.491–493. This supplies the affine interpretation, matrix,
  minor, small integer box and coefficient metric. BO's Theorem 1.1 supplies
  the inclusive degree-5 endpoint.
