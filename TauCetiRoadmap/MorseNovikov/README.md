# Morse–Novikov homology and dynamical Reidemeister torsion

Build the Morse theory of closed real one-forms, from the completed group-ring
algebra to geometric trajectory complexes and their topological comparison.
Count periodic return orbits with their multiplicities and Lefschetz signs,
and prove that Novikov torsion multiplied by the dynamical zeta function equals
cellular Reidemeister torsion. The resulting library includes nonintegral period
classes, noninjective period homomorphisms, torsion in abelian deck groups,
continuation, Euler structures, and explicit circle, mapping-torus and knot-surgery
calculations.

## Scope, conventions and suppliers

The geometric setting is a finite-dimensional real smooth Hausdorff second-countable
closed connected manifold X. The Novikov complex does not require X to be oriented.
The torsion comparison assumes χ(X)=0; retain the zero convention when a field
component is not acyclic. Smooth one-forms use
[DifferentialGeometry 0–1](../DifferentialGeometry/README.md)'s common smooth-form
carrier and exterior derivative, with its pullback and de Rham comparisons.
A closed one-form α is Morse if its local potentials have nondegenerate critical
points. This predicate includes neither Morse–Smale transversality nor periodic-orbit
nondegeneracy. Use the metric dual V=α♯, and count trajectories of **−V**.

Choose a connected regular abelian covering π:X̃→X on which π*α is exact, with
specified deck-group identification H. Periods factor as
`π₁(X)→H₁(X;ℤ)→H→ℝ`; denote the final homomorphism by P. Write H additively,
monomials as e^h, and use **N=−P** in the Novikov completion. A primitive f̃ satisfies
`f̃(h·x)=f̃(x)+P(h)`. Thus e^h shifts critical values by P(h), and completed chains
are finite above each potential threshold. A downward closed orbit γ has
`N([γ])=−∫γ α>0`. Neither injectivity nor discreteness of N is assumed.
For S¹ use ℝ/ℤ, identified with `Circle` by t↦exp(2πit), and pull back
DG's `circleAngularForm/(2π)` to obtain the angular form with integral 1. The Laurent variable t is the
monomial of the generator of H≅ℤ with **N(h)>0**, not a silently chosen positive
angular deck generator. In the exact N=0 circle example, separately fix
t as the positive angular deck generator; no N(t)>0 condition applies.

The algebraic coefficient ring R is any commutative ring. Torsion over ℤ and
rational characteristic-zero field components is its own layer; do not assume a
Novikov ring over an arbitrary ring is a field. Every geometric deck group H is
finitely generated, proved using a finite CW model of X. N1's completion algebra
also treats arbitrary abelian groups, without claiming a finite field decomposition
in that generality.

| Supplier | Consume and extend at the stated boundary |
| --- | --- |
| Native Mathlib `AddMonoidAlgebra`, `Finsupp`, `HahnSeries`, `LaurentSeries`, `Localization (nonZeroDivisors R)`, `ChainComplex (ModuleCat R) ℤ`, native homology and homotopies | Finite group-ring coefficients, genuinely ordered Hahn supports, Laurent arithmetic, localization and homological algebra. N1 owns period-controlled completion; a Hahn well-founded support alone is weaker than finite support below every real threshold. |
| [MorseTheory M1–M4,M6](../MorseTheory/README.md) | Intrinsic critical Hessians/index/charts, finite compact-band handles/CW models, inequalities and gradient convergence. Local potentials consume these APIs. |
| [HeegaardFloer Lane M,F0](../HeegaardFloer/README.md) | Smooth stable/unstable manifolds, λ-lemma, ordinary broken trajectories/gluing, coherent orientations, ordinary Morse/singular comparison, and Banach-manifold Fredholm/transversality. N2–N3 build closed-one-form/cover and period-cutoff versions; they do not posit moduli spaces as unexplained input fields. |
| [DifferentialGeometry 0–3,5–6,8,10,12](../DifferentialGeometry/README.md) | Forms, local primitives, metrics/musical maps, maximal flows, integration, de Rham/period comparison, smooth homotopies and sharp finite-dimensional Sard. Compactness supplies complete flow here. |
| [AlgebraicTopology 1–7](../AlgebraicTopology/README.md), [DGFloer 1.1](../DGFloer/README.md), [UniversalCovers](../../Completed/UniversalCovers/README.md) | Fundamental groupoid, local systems, cellular/relative singular chains, excision, mapping cones, covering maps and H₁=π₁ᵃᵇ. Consume UniversalCovers Stage 2.8's regular-cover/deck-quotient classification. N2 owns the period-kernel specialization, lifted smooth structure and equivariant cell-chain adapters. |
| [GeometricTopology 1,3–5,11 and its smoothing comparison](../GeometricTopology/README.md) | Tubular/collar/gluing and smooth triangulation, C∞ family topology, actual knot presentations, Seifert-normalized Alexander polynomial and zero-slope surgery. N6 owns the equivariant knot/surgery chain adapter and torsion calculation, rather than assuming the Alexander polynomial already computes torsion. |

Existing Tau Ceti manifold Morse/index and vector-space normal-form APIs are consumed.
The standard-model `MorseChart` and adapted pseudo-gradient family are also implemented
upstream; transport their chart/normalization conventions through MorseTheory M1.
The implemented local invariant graphs, orbit-union/global C¹ vector-space stable
sets and Banach-subset Sard–Smale do not supply all manifold, sharp-regularity or
completed-cover assertions above. Follow the actual hypotheses and build these
adapters here. No Floer complex, spectral sequence, nonabelian torsion, analytic
Ray–Singer torsion or gauge invariant is an input to this development.

Existing work includes [Dongryul Kim's Novikov-series development](https://github.com/dongryul-kim/lean4-novikov),
with its [coefficient/support carrier](https://github.com/dongryul-kim/lean4-novikov/blob/d5e705bd46bca9cb1622a260425388500d7697c2/Novikov/Series/Basic.lean).
It treats real additive-submonoid exponents and, in several variables,
finiteness for every positive weight vector. N1 instead permits an arbitrary
abelian exponent group with a specified, possibly noninjective period map.
For injective N, construct the coefficient-preserving comparison with the
one-variable carrier on the image of N, including convolution and the period
topology. For noninjective N, retain the finite ties in each period fiber and
compare through the supplied kernel splitting below. This general construction
and its comparison are independent of the descent theorem in that project.
Coordinate with its authors before code integration and follow the repository's
licensing and reuse requirements for any copying or adaptation.

## N1. Period-controlled completed group rings and modules

For an abelian group H and homomorphism N:H→ℝ, define Nov(R,H,N) by coefficient
functions a:H→R satisfying
`∀ C:ℝ, {h | a(h)≠0 ∧ N(h)<C}.Finite`.
Use this exact support condition. Prove it is equivalent with ≤C in place of <C,
and that a nonzero support has a lower bound and a least N-value. Prove equality
coefficientwise; construct zero, addition, negation, coefficient scalar maps and
convolution. For each h the pairs `(u,v)` with u+v=h and a(u)b(v)≠0 are finite;
prove this before interpreting the coefficient sum. Prove all commutative-ring and
R-algebra laws by finite support arguments, including the uniform cutoff lemma
needed for associativity. Monomials multiply by adding exponents and are units
with inverse e^(−h). Embed `AddMonoidAlgebra R H` by its actual coefficient map.
For nontrivial R prove this embedding is onto iff N=0.

Put U_C={a | ∀h, N(h)<C→a(h)=0}. These additive subgroups define the separated
period-filtration topology. Prove completeness and the universal completion
property for the group ring with this filtration, density of finite truncations,
continuity of ring operations, and cutoff/convolution compatibility. Scalar change
is coefficientwise; do not identify base change of completed rings with a tensor
product without its own proof. Positive rescaling of N gives the same ring and
topology; −N reverses the completion and is related by h↦−h, not the identity.
For commutative ground rings R,S, a unital homomorphism ρ:R→S, an exponent
homomorphism φ:H→H′ and c>0 satisfying N′∘φ=cN, construct the continuous unital
ring homomorphism P_(ρ,φ):Nov(R,H,N)→Nov(S,H′,N′) with coefficient
`P_(ρ,φ)(a)(h′)=Σ_(φ(h)=h′)ρ(a(h))`, summing over nonzero source coefficients.
Prove this sum and every target sublevel support finite using the period identity.
Prove additivity, multiplication, preservation of 1 and monomials, ground-coefficient
naturality, identity and composition laws by reindexing the actual finite sums.
If U_C and U′_D are the declared period neighborhoods, prove
`P_(ρ,φ)(U_C)⊆U′_(cC)` and deduce continuity. Construct its restrictions to the
nonnegative subrings and strictly positive ideals. With fixed ground ring export
the R-algebra homomorphism specialization. Finite kernel is not required for this
pushforward. With finite kernel also construct restriction φ^* by coefficient
precomposition and prove its support bound. Export the inclusion/restriction cases
used in finite cyclic covers. A pushforward with a finer grading additionally
requires a target degree map commuting with φ, or an explicit degree quotient;
the period identity alone supplies the ungraded map. Do not claim an unrestricted
series pushforward for arbitrary φ or infer flatness, injectivity, or a completed
tensor-product identification from this construction.

Construct the nonnegative-period subring of series supported on N≥0 and its
strictly positive ideal of series supported on N>0. Construct geometric series
for such a, prove both inverse identities for 1−a, and build exp/log between
this ideal and units of the form 1+a over a ℚ-algebra, with convergence and
formal identities in the period topology. Prove filtered infinite
products converge for families whose nonconstant supports escape every cutoff.
Include monomial `(1−e^h)^−1=Σ(k≥0)e^(kh)` when N(h)>0.

For H=ℤ with N(k)=k, construct the coefficient-preserving ring/topological comparison
with native `LaurentSeries R`, retaining the group-ring Laurent-polynomial inclusion.
For a general H and a supplied splitting of the period kernel, give the comparison
with the locally finite subring of Hahn series whose coefficients are finite sums
in the kernel group ring; prove coefficient and topology formulas. The splitting
and ordered period group are data, and this comparison is not the definition.
For finitely generated torsion-free H and a domain R prove Nov is a domain using
leading coefficients in the period-kernel group ring; finite ties in N are retained.

For a free H-set S with finitely many orbits and an equivariant potential
F(hs)=F(s)−N(h), construct completed R-linear combinations of S finite above every
F-threshold. Chosen orbit lifts identify this module with a finite free Nov-module.
Prove change-of-lift matrices are diagonal monomials, cutoff convergence, and the
extension of equivariant matrices to continuous maps. Export the uniform support
estimates for differentials, continuation maps, homotopies and compositions.

## N2. Morse closed one-forms, covers and bounded-period moduli

Define the zero locus using the actual cotangent bundle. Prove local-potential
independence of the critical Hessian and index; compare nondegenerate zero with
transversality of the section α to the zero section. Establish local normal forms,
isolation and finite critical sets. Define negative dual trajectories, stable/unstable
manifolds and Morse–Smale transversality separately. Specify descending orientation
lines over critical points and their deck transport; the sign convention is
`TD(p)=TM(p,q)⊕R(negative-flow tangent)⊕TD(q)`. Compare it with Lane M's
integer boundary convention rather than counting unsigned trajectories.

Construct the period homomorphism by integrating loops, with homotopy, concatenation,
homology and de Rham naturality. Specialize the regular-cover classification to
surjections π₁(X)→H, using π₁-abelianization; π*α is exact iff periods vanish on
that kernel. Build the lifted smooth structure, metric/vector field and primitive,
with deck-equivariance and positive/negative flow comparison. For a connected
regular cover with abelian deck group H, prove that
`H₁(X̃;ℤ) → H₁(X;ℤ) → H → 0` is exact at H₁(X;ℤ) and surjective onto H,
using the subgroup of π₁(X) defining the cover and the natural abelianization
maps. The first arrow need not be injective.

Make that failure explicit on the Klein bottle
`X=([0,1]×(ℝ/ℤ))/((1,y)∼(0,−y))`. Use GT's smooth gluing and AT's
fundamental-group/abelianization APIs to construct the connected smooth cover `C=ℝ_s×(ℝ_y/2ℤ)` and its commuting
deck transformations `A(s,y)=(s+1,−y)`, `B(s,y)=(s,y+1)`. Prove B has
order2 and that these generate a free proper action of `H=ℤ⊕ℤ/2`, with
quotient the same Klein bottle X. The integral closed form α=ds descends
to X, its pullback has primitive s, and `P(n,e)=n`, `N(n,e)=−n`.
Prove that this cover is the universal abelian cover: for the based section
a at y=0 and fiber loop b, use `π₁(X)=⟨a,b | aba⁻¹=b⁻¹⟩`, identify the
cover subgroup with ⟨b²⟩, and identify its deck quotient with H₁(X;ℤ).

The cover retracts onto its length-two fiber circle, so H₁(C;ℤ)=ℤ. Its
positive fiber generator maps to b² on π₁ and to `2[b]=0` on H₁(X;ℤ).
Thus the induced H₁ map is zero on a nonzero group, although the covering
map induces an injective map of fundamental groups. Identify
H₁(X;ℤ)→H with the isomorphism sending [a] to (1,0) and [b] to (0,1).
The native integer/mod2 calibration is in
[`AbelianCoverHomologyTargets.lean`](AbelianCoverHomologyTargets.lean).

For integral period classes construct the circle-valued map and its pullback
cover, then identify a connected component and the divisibility of its deck
generator. Every real class, including irrational ones, has a period-kernel
cover. In the preceding example the minimal period-kernel cover instead has
deck group ℤ and kills b; distinguish it from the larger abelian cover C,
whose period map has kernel ℤ/2. With downward monomial t=A⁻¹ and g=B,
compare N1's completion to `(ℤ[ℤ/2])((t))`, retaining both coefficients at
each period. Exhibit the nonzero factors 1−g and 1+g with product0. This
geometric cover realizes a deck group with torsion. Apply N4's total-quotient
construction to this ring with zero divisors.

For a Morse–Smale pair on compact X, establish a lifted moduli space
for each pair of lifted critical points, with translation quotient and expected
dimension equal to the index difference minus one. Construct compactification, evaluation and gluing under a
fixed upper bound on **potential drop**. Compactness on X is not compactness on X̃:
prove that outside disjoint small critical neighborhoods, drop controls trajectory
length; passages near hyperbolic critical points have controlled entry/exit, and
only finitely many compatible lifts/connecting pieces occur below a fixed drop.
Exclude equal/higher-index broken cycles by Morse–Smale transversality. Prove
index-one signed trajectories are finite at a fixed cutoff, index-two boundary
products give the coherent square-zero identity, and all estimates are uniform on
the compact parameter sets needed in N3. Retain empty and constant-trajectory
cases separately from the free translation quotient.

## N3. The Novikov complex, continuation and cellular comparison

Take coefficients in ℤ first and scalar-extend coefficientwise to R. Define
`CN_i=Nov(R,H,N)⟨chosen lifts of Crit_i(α)⟩`; its differential sums signed
index-one trajectories to **all** lifts of each lower critical point. Use N2 to
prove the output support condition, continuity, Nov-linearity and d²=0. Change
of lifts and descending orientations gives specified chain isomorphisms. Define
homology through native chain complexes, not a private ker/im quotient.

For cohomologous α₀,α₁ on the same cover, construct continuous continuation chain
maps and degree-one homotopies with uniform period estimates; prove constant
identity, concatenation up to homotopy, inverse and independence on homology.
Genericity must concern the full function/metric path, or a generic horizontal
lift on the parameter product. A fixed arbitrary function homotopy with generic
metrics alone need not be transverse. Build genericity in each fixed cohomology
class, relative to prescribed endpoint data, with the actual finite regularity/Baire
and local-perturbation suppliers. Do not require every member of a generic path
to be individually Morse–Smale.

Construct an equivariant finite cellular chain complex of X̃ over ℤ[H] from a
finite CW model of X and actual lifted attaching maps. Its completed version is
`Nov(R,H,N)⊗_(ℤ[H]) Ccell_*(X̃;ℤ)` with the displayed group-ring scalar map.
Prove a chain homotopy equivalence with CN, compatible with subdivisions, cell
models, orientation/lift changes and continuation. Build the alternative controlled
singular-chain model: locally finite chains upstairs with only finitely many
simplices meeting any region {f̃>C}, including the controlled subdivision,
prism and comparison operations. Require the comparison to this carrier, not
merely an isomorphism with an unnamed completed homology.

Prove the exact-form specialization is the group-ring equivariant ordinary Morse
complex. Prove the large-gradient comparison for β=α+C df with C sufficiently
large and a chosen Morse–Smale f: after positive rescaling to df+C⁻¹α, the relevant
critical points and lifted incidence counts correspond, and the flow has no periodic
orbits. Supply the structural-stability/entry-exit and support argument; cohomology
equality and a formal small-perturbation sentence are not proofs. Complete the
Morse-to-cellular chain identification for the triangulation-adapted model and
compare it with ordinary singular homology.

Derive coefficient-change and homotopy naturality through these chain maps. Prove
Novikov inequalities using field-component ranks and finite critical counts; use
a dimension/rank over an actual field, never a rank over an assumed Novikov field.
For n=dim X and [α]≠0 prove H_n^Nov(X;ℤ)=0, with the orientation-local-system
argument valid for nonorientable X as well. Give nonexact classes with zero complex
and examples where Novikov homology is not H_*(X)⊗Nov.

## N4. Based chain torsion and abelian total quotient rings

Build the determinant line of a bounded finite-dimensional chain complex over a
field F and its canonical comparison with the alternating determinant of homology,
using bases of boundaries and lifts through the short exact sequences. Fix the
homological convention that the elementary two-term complex with differential a
from degree 1 to degree 0 has torsion a⁻¹. For acyclic complexes obtain a nonzero
scalar from the chosen ordered chain bases; for nonacyclic complexes define the
scalar to be 0 while retaining the more informative homology-basis determinant
line. Prove independence of boundary bases/lifts, permutation/sign rules, graded
basis-change formula, scalar extension and direct sums. For a degreewise based
short exact sequence of acyclic complexes, prove scalar-torsion multiplicativity
with compatible chain bases and the explicit Koszul sign. For general complexes,
prove determinant-line multiplicativity through the long exact homology sequence,
including its torsion correction with chosen homology bases. Regard that sequence
as an acyclic homological complex with H_i(A), H_i(B), H_i(D) in degrees
3i+2,3i+1,3i respectively, using the same alternating determinant order and
subspace-first lifts. Derive the scalar formula from this comparison; the
zero-extended scalar torsions do not replace the determinant-line formula.
Prove contraction and subdivision identities used below. Do not assert torsion is invariant under every chain homotopy
equivalence: prove its transformation by the based mapping-cone torsion.

For acyclic complexes give the square-minor formula by choosing coordinate subspaces D_i,E_i and using
the **projection** `p_(E_(i−1))∘d|_(D_i)`; these projected maps are isomorphisms.
The differential need not map D_i into E_(i−1) itself. Compute the alternating
product of these minor determinants and reconcile it with the determinant-line
convention, including the overall sign: `τ=±Π_i det(d_s:C_i→C_(i−1))^((-1)^i)`.
For degreewise basis changes A_i, prove
`τ(A⁻¹dA)=τ(d)·Π_i det(A_i)^((-1)^i)` as an exact equality for grading-preserving A.

Use Mathlib `Localization (nonZeroDivisors A)` for total quotients. For a finitely
generated abelian H prove that the total quotient rings of ℤ[H] and Nov(ℤ,H,N)
are finite products of characteristic-zero fields. Construct the finite-torsion/free
splitting and cyclotomic components, prove reducedness and the componentwise
field/localization statements; show the answer is independent of that splitting.
Prove group-ring inclusion sends nonzerodivisors to nonzerodivisors and induces an
injective total-quotient map compatible with the field components. In the
torsion-free case recover native fraction fields and the leading-term domain proof.
Do not replace the general deck group by its free quotient.

Construct the period-order topology on each total-quotient field component:
after a free/torsion and period-kernel splitting, embed it into the Novikov
field with coefficients in the fraction field of the corresponding
characteristic-zero kernel group algebra. Define O(C) by order>C and prove
independence of the splitting, continuity of addition/multiplication and
inversion at nonzero elements. The total quotient has the product topology
over its finitely many field components; completeness of Nov alone is not a
completeness claim for this quotient. Prove rt3 Lemma 2.8's cutoff continuity
of based torsion when the acyclic component set is fixed: a nonzero limiting
minor remains nonzero, and high-order changes in its inverse remain high order.

For a cyclic quotient μ:H→ℤ/k with kernel K, prove Nov(ℤ,H,N) is finite
free of rank k over Nov(ℤ,K,N|K), with coset-monomial basis. Define Norm and
Tr as determinant and trace of multiplication, prove basis independence,
multiplicativity of Norm, Tr=k·coefficient restriction, and over ℚ prove
log Norm(1+x)=Tr log(1+x) in the positive ideal. If μ kills the torsion
subgroup of H, extend Norm to the total quotients, identify corresponding
field components and prove a nonzero component stays nonzero under Norm.
Under this same hypothesis prove cellular and Novikov torsion transform by
Norm, retaining zero on nonacyclic components and pullback Euler structures.
The ring-level Norm and zeta formula do not require this additional
hypothesis; the asserted quotient/torsion comparison does.

For a based finite free complex over either ring, define torsion componentwise,
setting a component to 0 exactly when that component complex is nonacyclic. Retain
partial acyclicity; a single global zero convention would lose information. Define
the ambiguity action by signs and deck monomials on the **whole** total quotient
ring, including 0, and pass to its orbit quotient. Prove torsion's formulas under
ordered orientation/lift changes, regular cellular subdivision and triangulation
changes. Use GT's smooth triangulation/PL comparison and explicit subdivision
mapping cones. Cellular torsion is a simple-homotopy invariant with the stated
based structure, not an invariant of arbitrary unbased homotopy equivalence.

## N5. Periodic return orbits and the dynamical zeta function

The following local return construction is stated for every finite-dimensional
Hausdorff second-countable boundaryless smooth manifold Y, independently
of the standing closed-manifold hypotheses for the Novikov application.
Let V be a C^k vector field on Y, k≥1, nonzero along a compact periodic
orbit. Choose transverse local sections D_p,D_q through orbit points p,q.
Consume DG local flows and the transverse implicit function theorem to
construct the C^k scalar hitting-time branch τ:D_p→ℝ near the fixed
travel time from p to q. On sufficiently small open section neighborhoods,
the induced transition h(z)=Φ_(τ(z))(z) is a C^k local diffeomorphism,
with inverse from the reverse hitting branch. For the primitive return
germs prove P_q=h∘P_p∘h⁻¹, and prove the corresponding identity for each
positive iterate. Thus DP_q=Dh DP_p (Dh)⁻¹; equivalently these are the
derivative-flow return maps on T_pY/ℝV(p) and T_qY/ℝV(q). Spectrum
and the eigenvalue-1 test are independent of section and basepoint.
Only local flows around this compact orbit are required. This early
construction uses neither N2, HF genericity nor the later Novikov
admissibility, support or zeta constructions. Sections are open germs;
an invariant transverse disk is not assumed.

Define a primitive periodic orbit of −α♯ up to rotation, with its least real return
time, and define the k-fold iterate separately. The integer multiplicity p(γ) is
its covering degree over the primitive orbit; it is not the return time. Apply this early generic local-return construction to −α♯ for its transverse return germs and the induced conjugacy of normal-space maps across sections and basepoints. An
isolated return fixed point has local index defined by perturbing the return map
on an isolating transverse chart neighbourhood to have nondegenerate fixed points
and summing `sgn det(1−dg)` over them. Use a generic relative homotopy's
one-dimensional zero cobordism to prove independence of the perturbation.
In transverse dimension zero the isolated point has index 1; in dimension one
the same signed sum applies, with no positive-dimensional boundary sphere assumed.
In dimensions at least two compare with DG 10's degree on the boundary sphere
of `x↦x−return(x)`. Build independence
of chart/isolating neighbourhood, additivity and restriction
and homotopy invariance while the boundary remains fixed-point free. At a
nondegenerate point prove the index is ε below, including transverse dimension 0.
These are the local-index suppliers for N6's closed-orbit degeneration argument.
Extend the index to continuous maps with compact isolated fixed set by a
C⁰-small smooth approximation that stays fixed-point-free on the isolating
boundary. Prove independence by relative approximation of a boundary-avoiding
homotopy; compare this extension with the smooth index. Construct its homological
graph/diagonal intersection description using AT's relative homology, excision
and orientation local system; normalize the two local orientation factors by
their canonical square pairing, so the integer needs no orientation of the
ambient manifold. Prove agreement with the approximation definition and
the partial-domain commutativity formula. For open subsets `U⊆Y₁`,
`V⊆Y₂` of smooth manifolds Y₁,Y₂ and continuous maps `f:U→Y₂`, `g:V→Y₁`, the composites g∘f and f∘g
have domains `f⁻¹(V)⊆U` and `g⁻¹(U)⊆V`. When their fixed sets are compact
and isolated, prove `i(g∘f)=i(f∘g)`; f identifies these fixed sets with inverse g.
No assumption that either composite preserves its isolating neighbourhood is
made. Derive invariance under
conjugation by a homeomorphism of isolating neighbourhoods, including the
piecewise smooth homeomorphisms of a smooth triangulation. This proves
independence of topological as well as smooth charts. This is the interface
for N6's cellular/simplicial Hopf construction. Iterate formulas below apply
to nondegenerate return maps; no universal degenerate-iterate formula is assumed.
An
admissible pair requires every iterate nondegenerate in addition to N2's critical
and trajectory conditions. Define ε(γ)=sgn det(1−dreturn_γ). Establish generic
admissible pairs in each fixed cohomology class by local return-map perturbations
and the countable intersection over bounded-period/iterate windows.

Prove only finitely many closed orbits up to rotation, with iterates included,
have N([γ]) below any prescribed positive threshold. Rule out accumulation on a degenerate orbit and on a broken
cycle through critical points; the latter needs an equal/higher-index segment,
excluded by N2. Include all iterates and prove multiplicity support estimates.
Construct the rational log series
`Σγ ε(γ)/p(γ) · e^[γ]` in the positive period ideal and its exponential ζ.
This uses the completion over ℚ, not an assumed tensor-product commutation with
completion over ℤ. Prove ζ has integral coefficients by the convergent product
over primitive orbits

`ζ=Πγ (1−(−1)^i_−(γ)e^[γ])^(−ε(γ)(−1)^i_−(γ))`,

where i_− counts real return eigenvalues below −1, i_+ those above 1, and
i_0 those in (−1,1), with algebraic multiplicity. Prove
ε(γ^k)=(−1)^i_+ · (−1)^((k+1)i_−), so the exponent is
−(−1)^(i_++i_−)=(−1)^(dim X−i_0). It specializes to
−(−1)^i_0 only in odd dimension. Prove these identities from real/complex
conjugate eigenvalue blocks, then log/product equality and integrality. Show ζ is
a unit with constant term 1. Prove naturality for valid period-support exponent
maps and the finite cyclic cover norm formulas needed for N6, retaining the
individual lift/iterate multiplicities. For 0→K→H→[μ]ℤ/k→0,
prove ζ(X̂)=Norm(ζ(X)) with no torsion-annihilation hypothesis; use
Tr=k·restriction on each orbit term, including shorter primitive lifts.

## N6. Dynamical torsion, bifurcations and geometric calculations

For χ(X)=0 and an admissible pair set
`I(α,g,π)=τ(CN)·ζ ∈ Q(Nov(ℤ,H,N))/(±e^H)`.
Prove that it depends only on [α] and the specified cover, and prove
`I=i(τ(Ccell(X̃)))`, with i the N4 total-quotient map. Include arbitrary real
cohomology classes and all finitely generated abelian deck groups, not just
integral classes or the torsion-free acyclic case.

Construct a generic fixed-cohomology one-parameter family with prescribed
admissible endpoints, at every period cutoff: transverse critical-point slides,
ordinary trajectory tangency/cancellation, isolated critical birth/death and
closed-orbit degenerations, with the semi-isolation and good-parameter conditions
of Hutchings rt3 §2. Consume [HeegaardFloer M.5](https://github.com/TauCetiProject/TauCetiRoadmap/blob/7d7fa6e83b9975bca12a0a620f4e3fab7db029be/TauCetiRoadmap/HeegaardFloer/README.md)'s ordinary local A₂
fold, relative partial-jet transversality and signed elementary chain change.
Construct the closed-one-form specialization using local exact potentials
and exact cutoff perturbations, retaining the global cohomology class,
period cutoffs and cover/lift comparisons. Choose the metric Euclidean in
the resulting Cerf chart and pin the potential and positive metric dual
with precisely that local normalization:
`α_t=d(x₁³/3 ± (t−t₀)x₁ − Σ_(j=2)^i x_j²/2 + Σ_(j>i)x_j²/2)` and
`V_t=(x₁² ± (t−t₀),−x₂,…,−x_i,x_(i+1),…,x_n)`.
The two critical points have indices i and i−1; trajectories use −V_t.
For closed-orbit-only degenerations use rt3 Lemma 3.2's local fixed-point-index
invariance on transverse return discs; a full classification of periodic-orbit
bifurcations is not an assumed supplier. Prove the bifurcation analysis:
opposite trajectory cancellations; closed-orbit local-index conservation; handle slides
between distinct critical points; same-critical-point deck slides; and critical
birth/death with multiply broken return trajectories. Compare the based complex
matrices, determinant/minor factors and zeta factors at each event. For self-slides,
prove the all-order identity using the finite cyclic cover/norm argument. If
h is the slide class, let d be the divisibility of its nonzero image in H/T,
where T is the torsion subgroup. Use two explicitly distinguished cover families:
for k coprime to d, `μ_k:H→ℤ/k` kills T and sends h to 1, for the chain
stabilization; for every k≥2, `ν_k:H→ℤ/(dk)` kills T and sends h to d,
for norm elimination. In the latter `nh∈ker ν_k` iff k divides n.
Construct both from an integral functional equal to 1 on the primitive
class h̄/d, reducing modulo dk for ν_k and multiplying by d⁻¹ modulo k
for μ_k. Both quotients are surjective.
For a slide at p of index i, construct `x=1+Σ_(n≥1)a_n e^(nh)`
with `a₁=±1` the geometric sign of the h-class self-slide trajectory from p
to p: extend N2's determinant-line orientation to the parameterized trajectory
space, with the parameter axis oriented by increasing t. This gives the signed
zero-dimensional family crossing. Prove `d₊=A_p(x)⁻¹d₋A_p(x)`, where A_p(x) multiplies
the chosen p-generator by x and fixes the other generators. Prove this all-order
chain identity using the μ_k covers, with cutoff `R_k=N(kh)` and only events
of drop strictly less than R_k. Let k tend to infinity through values coprime
to d, so these cutoffs exhaust all finite drops and no class kh self-slide is
used in the elementary-matrix step. For each such cutoff choose a semi-isolated
parameter window with admissible endpoints, then perturb its pullback family
non-equivariantly relative to those endpoints. Apply the generic-family theorem
on the compact finite cover and prove the perturbation is small enough that
below that cutoff only the lifted slides occur. Their conjugator is a product
of elementary slide matrices. Recover its equivariance modulo the cutoff by
comparing rows/columns with the endpoint differentials, which are restrictions
of Nov(H)-linear maps: the relevant one-variable series are nonzerodivisors
on Nov(ℤ,H,N), as proved cosetwise over ℤh. The equivariant conjugator has
twisted circulant form, with shift `S^k=e^(kh)` over the kernel Novikov ring.
In the non-split case prove x is determined modulo each cutoff (accounting for
the fixed order shifts of the nonzero baseline row/column); hence every
coefficient a_(n,k) stabilizes as k tends to infinity through coprime values.
Include the case where both the
outgoing boundary of p and every incoming p-coefficient vanish: p splits off
as a homology summand in every field component, and the chain identity is
independent of higher coefficients of x; choose them arbitrarily while retaining
the geometric a₁. Treat event invariance there directly as 0=0.
Define `y=ζ₊/ζ₋` and prove it lies in `1+Σ_(n≥1)ℤ e^(nh)` by showing that
only orbit classes nh are created or destroyed. Write its coefficients b_n.
Construct the compactified return-map graph and prove its leading-coefficient
identity b₁=(−1)^(i+1)a₁ with the fixed orientation convention, then eliminate
every higher coefficient by the ν_k covers and N4's nonvanishing norm lemma
when τ₋ has a nonzero field component, obtaining `y=x^((-1)^(i+1))` by
injectivity of the one-variable slide series in that component. Explicitly,
for `z=x^((-1)^i)y`, prove the e^(kh) coefficient of
`log Norm_(ν_k)(z)` vanishes. Perturb the ν_k pullback family relative to
endpoints below a sufficiently large cutoff. Lifted slides with k not dividing
the lift-index difference are distinct-point slides, which preserve I; a
first self-slide in class kh has no linear term by the already proved chain
and geometric leading-coefficient identities. Thus the cover changes I by
`1+O(e^(2kh))`, without assuming full event invariance in that cover.
Cancel in a nonzero cover component using N4's norm lemma and prove the
injectivity of one-variable series in e^(kh) in that component. Use
`log Norm_(ν_k)(z)=dk·Σ_(k∣n)(log z)_n e^(nh)`:
its e^(kh) coefficient is dk·(log z)_k, hence (log z)_k=0 over ℚ.
Taking k=n kills every coefficient n≥2. The geometric leading-coefficient
identity kills n=1. If all components
are nonacyclic, use preservation of acyclicity under chain conjugation to prove
I₊=I₋=0 without cancelling zero torsion. Thus the event theorem is I₊=I₋ in
the whole total-quotient orbit space. Agreement
of only the linear coefficient is insufficient. Birth/death requires the explicit
entry/exit/gluing analysis and the geometric-series algebra of its return chains.
A generic compact parameter interval can contain infinitely many events: prove
finiteness/isolation at each fixed period cutoff, compatibility of successive
cutoffs and convergence in N4's componentwise total-quotient topology, with
fixed critical lifts or a fixed Euler-structure representative throughout.
Before applying N4's torsion continuity, construct the cutoff limits of
continuation maps and their homotopies to give chain homotopy equivalences
from each one-sided event-limit complex to a neighbouring regular complex.
This proves the acyclic component set is preserved, including at the limits.
Do not assume a
finite event list globally.

Prove topological equality first in the exact triangulation-adapted case, then
apply N3's large-gradient comparison and N6's invariance to α+C df. Positive
rescaling preserves N1's completion. Keep the torsion of the comparison map
visible; an arbitrary quasi-isomorphism cannot substitute for the based calculation.
Include these explicit calculations as theorems:

* S¹ with nonzero period, no critical points: CN=0, τNov=1,
  ζ=(1−t)⁻¹, and τcell=(1−t)⁻¹.
* A nonzero-period circle form perturbed to one maximum/minimum:
  for adjacent chosen lifts, d p̃=±(1−t)q̃; for arbitrary lifts include the
corresponding monomial unit factor. CN acyclic, τNov=(1−t)⁻¹ and ζ=1. The critical-free and
  two-critical-point flows have the same I, while their separate torsions differ.
* Exact α=df on S¹ with universal cyclic cover: N=0, coefficients ℤ[t,t⁻¹],
  d=±(1−t), H₀=ℤ with trivial deck action and H₁=0. Contrast both nonzero-period
  examples with ordinary H_*(S¹) tensored with the coefficient ring.
* Mapping torus of a diffeomorphism of a closed connected fiber S, with the
  downward return-map monodromy φ and the corresponding deck t. Build its
  equivariant cone `1−tφ#`; prove Lefschetz signed fixed-point counts for all
  iterates and the trace/determinant identity
  `ζ=Πi det(1−tφ*|H_i(S;ℚ))^((-1)^(i+1))`.
  Construct the Lefschetz fixed-point formula here by simplicial approximation
  on a smooth triangulation and Hopf's barycentric modification,
  the Hopf trace lemma and N5's continuous local fixed-point index, valid also for nonorientable
  S. Choose a finite smooth triangulation K and construct its local PL charts
  from subdivision stars and the link-sphere property of GT11's smooth
  triangulation comparison. Choose a simplicial approximation
  `a:sd^r K→K` of φ and its homotopic Hopf modification ψ. Define the finite
  chain endomorphism `T_q=a_#,q∘Sd^r_q:C_q(K;ℚ)→C_q(K;ℚ)`.
  Prove ψ has isolated fixed points and, for each q-simplex σ, its total
  interior fixed-point index is `(−1)^q (T_q)_(σ,σ)`.
  Compute the unit local contribution as `(−1)^q ε`, where ε is the oriented
  local degree (expansion along the simplex and transverse contraction).
  Include the reflected 1-simplex: ε=−1 gives index +1. Thus prove
  `Σ index(ψ)=Σ_q (−1)^q tr(T_q)` before applying the Hopf trace lemma.
  Build the finite-triangulation chain adapter here. For each finite simplicial
  complex K and commutative coefficient ring R, construct the native
  `ChainComplex (ModuleCat R) ℕ` free on the q-simplices, with basis orientations
  fixed by a vertex order and orientation reversal acting by −1, with the
  alternating face differential, basis equations, scalar extension and its
  extension by zero to `ChainComplex (ModuleCat R) ℤ`. Consume GT11's chosen
  simplex-cell CW structure on |K|, ordered characteristic maps and signed
  simplicial/cellular boundary identification. Prove this native chain adapter
  agrees with that structure and AT4.2's cellular complex and chain maps. Compose with AT4.3's cellular/singular
  comparison to obtain the homology isomorphism. Prove independence of vertex
  ordering via the orientation-change chain isomorphism, and functoriality
  for simplicial maps f. Consume GT11's cellularity of |f| for these same
  simplex-cell structures, and identify AT4.2's cellular chain map with f_#,
  with degree zero on degenerate images and
  the orientation sign otherwise. AT4.3's naturality on homology then identifies
  f_# with |f|_*, without claiming a strict cellular-to-singular chain map.
  Construct the canonical affine homeomorphism `b_r:|sd^r K|≃ₜ|K|`, mapping
  each subdivision vertex to its barycenter. Use b_r to identify the realizations
  when choosing a as an approximation of φ. Construct simplicial subdivision,
  the last-vertex chain inverse `λ_r#` and both
  composite-to-identity homotopies. Build the finite acyclic-carrier homotopy
  lemma using augmented simplex cone contractions to supply those homotopies.
  Define `λ_r:sd^r K→K` by composing one-step last-vertex maps with fixed
  vertex orders at every subdivision level, and prove it is a simplicial approximation
  of b_r: their images lie in a common original simplex, so straight-line
  interpolation within that simplex gives `|λ_r|≃b_r`. Under the homology
  comparisons, λ_r therefore induces `(b_r)_*`; the chain inverse identities
  force Sd^r to induce `(b_r)_*⁻¹`. Since `|a|≃φ∘b_r`, prove
  T induces φ_* on H_*(S;ℚ). This identifies the
  alternating homology trace with the Lefschetz number of φ.
  Use N5's chart-independent continuous index to compute ψ in its PL charts;
  compare with the smooth index through C⁰-small approximation preserving
  every isolating boundary. Prove global homotopy invariance of the total
  fixed-point index on compact S for continuous homotopies, by approximating
  them and their ends smoothly and applying the generic smooth homotopy's
  fixed-point one-manifold in S×[0,1]: its end signs `sgn det(1−df)` cancel
  without an orientation of S. Thus the PL ψ and smooth φ have the same total.
  Compare graph/diagonal intersection using AT 6's orientation local system
  in the oriented specialization. Reconcile
  the homology determinant with chain torsion and prove an equivariant version
  for a larger abelian cover under its actual support hypotheses.
* Zero-slope surgery X_K on an oriented knot in S³, using GT's meridian/Seifert
  longitude and Conway-normalized Δ_K. Construct H₁(X_K)=ℤ and the corresponding
  infinite cyclic cover. Build the knot-complement cellular/Fox or Seifert-matrix
  Alexander module, prove the polynomial/module presentation comparison, and
  attach the filling chain complex. Prove
  `τcell(X̃_K)=Δ_K(t)/(1−t)^2 mod ±t^ℤ`.
  Thus the total dynamical invariant for every admissible integral-period form
  representing the generator has this value in the correctly directed completion.
  Verify the unknot and right-handed trefoil, including t↦t⁻¹ and lift changes.

## N7. Euler structures and coherent lift normalization

For χ(X)=0 define Euler chains using a nondegenerate vector field's signed zero
0-cycle: their boundary is that cycle, and two are equivalent modulo boundaries.
Construct nonemptiness from Euler=χ and H₀, the H₁(X;ℤ)-torsor action, and the
canonical comparison between different fields via the transverse zero locus of a
parameter family. Prove independence, identity and cocycle laws; no preferred
zero of this torsor is assumed. Build the combinatorial Euler-chain model from
oriented lifted cells, its subdivision transport and comparison with the smooth
model. The construction includes dimension 1 and nonorientable X. The local index
sgn det(dV_p) is independent of local orientation because domain and target
orientations change together; its signed zero-cycle is an ordinary integral
0-cycle and Euler chains are ordinary integral 1-chains. Use the positive dual
field V=α♯, whose Morse-zero sign is (−1)^ind(p), matching the alternating
cell weights. Construct the vector-field Poincaré–Hopf theorem here: compare
zero cycles through a transverse parameter cobordism with a Morse gradient,
then use MorseTheory M4 and AT Stage 7 to prove Σind(V,p)=χ(X).

Construct the Euler-structure normalization on the alternating determinant line,
using coherent critical/cell lifts when critical points/cells are present. The
normalization is a determinant **volume**, not only a literal ordered basis of an
empty chain module. In the zero-critical-point case CN=0 has determinant line
canonically Nov; a nonsingular field supplies its Euler structure ξ₀, the volume
at ξ₀ is1, and the volume at ξ₀+h is e^(image h). This preserves the nontrivial
Euler-structure information even for the zero complex. Pin the action convention
`τ(ξ+h)=e^(image h)τ(ξ)` and prove its comparison with Euler-chain/lift changes.
Define refined τNov, τcell and I as H₁-equivariant maps from the Euler-structure
torsor to Q(Nov)/±1 with this action. Prove the refined equality and continuation,
birth/death and triangulation compatibility. A nonsingular positive dual field supplies its
particular Euler structure, even though trajectory counts use its negative flow; this choice normalizes the mapping-torus calculation.
Do not assert sign removal by a homology orientation for dynamical torsion without
building that separate sign comparison; the definite theorem here retains ±1.

## Order and acceptance

N1 is independent of geometry. N2 uses native Morse/flow topology and HF M/F0;
N3 consumes N1–N2 and AT/GT cellular suppliers. N4's algebra runs independently
of N2–N3, then applies to their based complexes. N5 consumes N1–N2. N6 uses all
five, including its own Lefschetz and knot/surgery adapters; N7 constructs the
Euler carrier before using it to refine N6. Generic ordinary Morse homology is
not proved using the dynamical torsion theorem, and Novikov homology comparison
is not used to infer torsion invariance without its based comparison factor.

Acceptance requires all three circle chain calculations, an irrational-period
noninjective-kernel completion example with finite tied leading coefficients,
a deck group with finite torsion and partially acyclic total-quotient components,
return-map iterate signs in both dimension parities (the three circle calculations supply odd dimension): an attracting and a
repelling orbit on a surface, and the orientation-reversing circle mapping
torus (Klein bottle) with ζ=(1+t)/(1−t). Check period doubling algebraically
by (1+x)/(1−x²)=1/(1−x), and the algebraic cyclic-cover norm/self-slide identities for
H=ℤ⊕ℤ/2 and h=(2,1), using divisibility 2 in H/T. For the
irrational noninjective example fix H=ℤ³ and N(a,b,c)=a+√2b,
with coefficient ring ℤ and kernel generated by (0,0,1); verify finite tied
leading supports and an infinite series whose periods escape each cutoff.
For partial acyclicity use the algebraic two-term complex over H=ℤ/2,
N=0, differential 1−g from degree 1 to degree 0: its two rational components have differential 0 and 2,
so its torsion components are 0 and 1/2. This is explicitly an algebraic
acceptance example, not an asserted geometric fibred example. Include the mapping-
torus Lefschetz/determinant comparison and the two knot-surgery examples. Every
coefficient, lift, orientation and monodromy change is checked by its naturality
formula. Suggested.lean gives representative completion, based-chain, flow and
coefficient interfaces; this README specifies the full mathematical targets.

## References

* M. Hutchings and Y.-J. Lee, [Circle-valued Morse theory and Reidemeister torsion](https://math.berkeley.edu/~hutching/pub/rt2/rt2_published.pdf), Geometry & Topology 3 (1999), 369–396: completed chains, orbit signs, product formula, topological torsion and Euler structures.
* M. Hutchings, [Reidemeister torsion in generalized Morse theory](https://math.berkeley.edu/~hutching/pub/rt3/rt3.pdf), Forum Mathematicum 14 (2002), 209–244: arbitrary closed forms/abelian covers, cutoff bifurcations, finite cyclic covers and refined comparison.
* M. Hutchings and Y.-J. Lee, [Circle-valued Morse theory, Reidemeister torsion, and Seiberg–Witten invariants](https://math.berkeley.edu/~hutching/pub/rt1/rt1_published.pdf), Topology 38 (1999), 861–888: original circle-valued calculations and context. Gauge-invariant comparisons belong to their gauge-theory supplier, rather than being assumed here.
* V. Turaev, Introduction to Combinatorial Torsions, Birkhäuser 2001; Euler structures, nonsingular vector fields, and Reidemeister-type torsions, Math. USSR-Izvestiya 34 (1990), 627–662: based torsion and lift refinement.
* A. Pajitnov, Circle-valued Morse Theory, de Gruyter 2006; J. Milnor, Whitehead torsion, Bull. AMS 72 (1966), 358–426: completed cellular comparison and based elementary chain operations.
* M. Hutchings, [family-Floer transversality correction](https://floerhomology.wordpress.com/2011/06/30/erratum-family1/): generic function/metric paths or generic horizontal connections, not arbitrary fixed function homotopies with metric variations alone.
