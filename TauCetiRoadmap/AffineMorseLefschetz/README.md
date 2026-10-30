# Complex Morse theory, affine topology and weak Lefschetz

Develop the topology controlled by the Levi form: real Morse index bounds,
closed holomorphic embeddings, proper pseudoconvex exhaustions, affine CW
dimension and projective hyperplane sections. Include integral homology and
relative homotopy, as well as the compact-pair topology needed when the
projective variety has singularities contained in the hyperplane.

## Carriers, conventions and suppliers

Use Mathlib complex `ChartedSpace`/`IsManifold` and `MDifferentiable ℂ`;
[ComplexKahlerGeometry K1,K3,K7](https://github.com/TauCetiProject/TauCetiRoadmap/blob/13b2335ea038b439655df55654e71b19603d8ee1/TauCetiRoadmap/ComplexKahlerGeometry/README.md) supplies
holomorphic submanifolds, scalar restriction, analytic germs, projective
charts and the complex orientation. Its K5 elliptic theory and K6 Hard
Lefschetz are independent of the weak hyperplane results here.
[MorseTheory M1–M4](https://github.com/TauCetiProject/TauCetiRoadmap/blob/9b99d510e79e06d80a053de057f2923d81a9ccbe/TauCetiRoadmap/MorseTheory/README.md) supplies intrinsic Hessians,
indices, fine Morse approximation, compact-band attachment and proper CW
exhaustion. [GeometricTopology Layer1](https://github.com/TauCetiProject/TauCetiRoadmap/blob/87f0ec5b86d9f2c8668d39f9dde23707c76ffac9/TauCetiRoadmap/GeometricTopology/README.md) supplies
the orthogonal normal bundle, the direct finite-C² Euclidean chart Hessian
and normal-derivative pairing, and their normal-endpoint derivative block.
[RiemannianGeometry R5a/R6](https://github.com/TauCetiProject/TauCetiRoadmap/blob/7d5cabbd745d7e1b7e51cc8540b0b6d2e4abef65/TauCetiRoadmap/RiemannianGeometry/README.md) supplies the intrinsic
second fundamental form, shape operator and focal interpretation on these
same carriers, comparing them with that earlier chart calculation.
[AlgebraicTopology Stages 2–4,6,8](https://github.com/TauCetiProject/TauCetiRoadmap/blob/50af6084a401dffe3db1e50dac46fe4bca36f4fd/TauCetiRoadmap/AlgebraicTopology/README.md) supplies
singular pairs, CW/cofibration machinery, UCT, compact manifold duality and
relative homotopy. [DifferentialGeometry 10.2](https://github.com/TauCetiProject/TauCetiRoadmap/blob/350e970ce49f707a327909beac0b7b7c782cc7ee/TauCetiRoadmap/DifferentialGeometry/README.md)
supplies smooth Sard and chartwise null-set transport. A4.0 owns the generic
noncompact/Borel–Moore and compact-support duality before any complex/affine
application, consuming [CharacteristicClasses C1.2a S0–S5](https://github.com/TauCetiProject/TauCetiRoadmap/blob/76a0952b2687a743d384a9ba88769e71d3c9f55e/TauCetiRoadmap/CharacteristicClasses/README.md)'s single supported-cochain
interface, with S5 applied to the supplied collared boundary; A4.1 owns the algebraic compactification comparisons. [GeometricTopology Layer 11](https://github.com/TauCetiProject/TauCetiRoadmap/blob/87f0ec5b86d9f2c8668d39f9dde23707c76ffac9/TauCetiRoadmap/GeometricTopology/README.md)
supplies actual simplicial complexes, realizations and subdivisions.
[RealAlgebraicGeometry Layers 3–6](https://github.com/TauCetiProject/TauCetiRoadmap/blob/350e970ce49f707a327909beac0b7b7c782cc7ee/TauCetiRoadmap/RealAlgebraicGeometry/README.md)
supplies semialgebraic sets/maps, CAD and projection closure; A4 owns finite
semialgebraic triangulation, which that roadmap does not supply.

All manifolds are finite-dimensional, Hausdorff and second-countable. The
complex/affine stages use boundaryless models, complex dimension n and real
dimension 2n; A4.0's generic real-manifold duality also allows the specified
collared boundary and arbitrary real dimension m.
df=0 means real criticality. The real Hessian is d²f without a factor 1/2;
the normalized real Morse chart therefore has diagonal Hessian entries ±2.
For real-valued f define the Levi matrix in holomorphic coordinates by
`L_(j,bar k)=∂²f/(∂z_j∂bar z_k)`. Its diagonal value on the complex tangent
represented by a real v, with ξ_j=dz_j(v), is one quarter of the coordinate
real-second-derivative sum `D²f(v,v)+D²f(Jv,Jv)` at every point.
At a critical point this equals the intrinsic Hessian sum. Define strict
plurisubharmonicity by positive definiteness of this Hermitian Levi form.
Only at a critical point is the ordinary real Hessian coordinate independent;
the Levi form is intrinsic at every point.

Properness and a lower bound accompany every CW-exhaustion theorem. An
arbitrary holomorphic embedding into ℂᴺ does not give a proper distance
function. Affine algebraic sets below are presented by finitely many complex
polynomials; projective sets are presented by homogeneous polynomials in
the actual projective carrier. Work with their classical complex-point
topology and prove the polynomial/chart/analytic comparisons; no unconstructed
scheme analytification is assumed.

Define a smooth point of dimension n to mean X agrees locally in projective
charts with an embedded complex n-dimensional submanifold; the nonsmooth
locus is its complement. Dimension and pure dimension use reduced analytic
germs: every local irreducible component has complex dimension n. A4 builds
the needed dimension comparisons. Jacobian-rank criteria on a presentation
are sufficient tests, not the definition of singularity of the reduced set
(the equations x and x² have the same zero set).

## A0. Polynomial-family projective carriers

Own `complexProjectiveZeroLocus` for a finite family
p:ι→MvPolynomial(Fin N) ℂ with specified homogeneous degrees d:ι→ℕ.
Its carrier is the subtype of the native
`Projectivization ℂ (Fin N → ℂ)` whose corresponding line under
`Projectivization.equivSubmodule` has every p_i zero on every vector.
Give the induced topology from K7.1's same native projective space.
For N>0 identify Fin N with Fin((N−1)+1) by the canonical arithmetic
Fin equivalence and transport K7.1's existing complex atlas through that
coordinate linear equivalence; N=0 is the empty projectivization branch.
Pin every incidence/Jacobian/normal map to this same transported subtype.
Prove `complexProjectiveZeroLocus_mk_iff`: for v≠0, its projective point
lies in that subtype exactly when every p_i(v)=0. Include homogeneous
scalar evaluation, degree0 constant/zero equations, N=0 and empty families.
Build closedness in the compact Hausdorff projective carrier, coordinate-chart
polynomial equations, reindexing and adding/removing redundant equations,
finite-family intersections and their inclusion maps, and functoriality under
injective complex-linear coordinate changes. Prove invariance under replacing
a homogeneous equation by a positive power, at the level of the reduced
zero set rather than its Jacobian presentation. For fixed finite ι and degrees d_i, define the coefficient vector space
P_d=∏_(i:ι) MvPolynomial.homogeneousSubmodule (Fin N) ℂ (d_i), including
zero equations. Give each graded piece the finite-dimensional topology from
its monomial-coefficient equivalence with ℂ^(S_i), where
S_i={α:Fin N→ℕ | Σ_j α_j=d_i}; give P_d the product topology. Prove these
coordinate equivalences and evaluation/derivative continuity and holomorphicity.
Use the coefficient vector space itself as the parameter carrier. Define
`complexProjectiveIncidence d` as the closed subtype
{(c,L):P_d×Projectivization ℂ (Fin N→ℂ) | ∀i,∀v∈line(L), (c_i)(v)=0},
with the two actual projections and its fiber identification with
`complexProjectiveZeroLocus (fun i=>c_i)`. The projection to P_d is proper
because the projective factor is compact; retain the exact projection/pullback
maps and the degenerate N=0, empty-family and degree0 branches.

Display the cone Jacobian for v≠0:
J_p(v)_(i,j)=MvPolynomial.eval v (MvPolynomial.pderiv j (p_i)),
as a complex linear map ℂ^N→ℂ^ι. Consume native
`MvPolynomial.IsHomogeneous.sum_X_mul_pderiv` for
Σ_j v_j J_p(v)_(i,j)=d_i p_i(v). On the zero locus its radial line lies
in the kernel. Define the induced projective differential in the finite
ratio charts, with output in ⊕_i O(d_i); prove its agreement with the
cone matrix, representative rescaling and coordinate-change formulas.
Full rank means surjectivity of J_p(v), equivalently row rank |ι|, and
is independent of the chosen nonzero representative. It forces |ι|≤N−1
at a zero-locus point. On this locus construct K7's induced complex
submanifold of dimension N−1−|ι| and its exact tangent/normal sequence.
In the joint incidence prove the bad-rank locus is closed, so its proper
projection has closed image; the parameter locus where every fiber point
has full rank is open. Its incidence restriction is a proper holomorphic
submersion, with the actual fiber maps, parameter paths and pullback
comparisons used by Four's proper-family argument.
Smoothness of a reduced locus
is still the earlier intrinsic chart definition. FourManifolds owns the
Fermat quartic and Vandermonde-quadric examples on this single carrier.

## A1. Levi calculus and real index bounds

Construct the Hermitian Levi form and its coordinate-change, pullback, sum,
product and increasing-convex composition laws. Prove the local
Wirtinger/real-second-derivative comparison, and its critical-point intrinsic
Hessian version. Give continuity of the Levi eigenvalue bounds under C²
perturbations on compact coordinate sets, and openness in the smooth fine
topology with varying positive tolerances. Establish the maximum principle
on compact complex submanifolds for strictly plurisubharmonic restrictions.

For a symmetric real Hessian B on a complex n-dimensional tangent space,
prove positivity of `B(v,v)+B(Jv,Jv)` for v≠0 forces every negative-definite
real subspace W to have W∩JW=0 and dimℝW≤n. Compare maximal negative
subspaces with Tau Ceti's actual quadratic-form negative inertia and
`manifoldMorseIndex`. For 0≤q≤n, define strongly q-pseudoconvex to mean
the Levi form has at least n−q strictly positive eigenvalues. Prove the
index bound λ≤n+q, using a complex positive subspace and dimension
intersection, and the corresponding perturbation openness. No nonnegative
Levi hypothesis is substituted for the strictly positive directions.
This everywhere-positive convention counts n−q positive directions, so q=0
is strict plurisubharmonicity; it corresponds to Andreotti–Grauert q+1 in
the n−q+1 convention. Positivity holds everywhere here, rather than only
outside a compact set.

Acceptance includes a positive Hermitian quadratic function, the real part
of a holomorphic quadratic form, and a sum of both with explicit inertia.
For a real self-adjoint operator anti-commuting with J prove J identifies its
λ and −λ eigenspaces, including multiplicities and the zero eigenspace.
Use native `Module.End.eigenspace` and finite-dimensional spectral theory.

## A2. Closed embeddings and squared-distance exhaustions

For a holomorphic immersion i:M→ℂᴺ with the induced real metric, identify
the tangent and normal spaces as J-invariant spaces. Prove
`B(Jv,w)=J B(v,w)=B(v,Jw)` and `B(Jv,Jw)=−B(v,w)` for the real second
fundamental form. With `g(S_νv,w)=g(B(v,w),ν)` prove
`S_νJ=−JS_ν` and `S_(Jν)=JS_ν`. Give the complex-bilinear normal-valued
second fundamental form and its relation to these real identities, without
describing a sesquilinear Hermitian pairing as a complex quadratic form.
Deduce the paired eigenvalues and symmetric focal distances on each normal
line, with focal multiplicities and zero-eigenvalue cases explicit.

For `ρ_a(x)=‖i(x)−a‖²`, consume GT Layer1's smoothness/nonnegativity and
proper-distance API. Use R6's normal-critical-point test and intrinsic
Hessian formula `2(g−g(B, a−i(x)))`, under its comparison with GT's
`euclideanChartSquaredDistanceHessian` and `euclideanChartNormalDerivativePairing`
on this same embedding and normal carrier. Prove the complex identity
`Hess ρ_a(v,v)+Hess ρ_a(Jv,Jv)=4‖di(v)‖²` at critical points.
Its Levi form is positive everywhere. Consume GT Layer1's
`euclideanNormalEndpoint_criticalImage_isNull`,
`ae_nondegenerateCriticalPoints_euclideanSquaredDistance` and smooth
`ae_isMorse_euclideanSquaredDistance`, with their total-space/chart/Haar
comparisons. Compare the same normal carrier with R6's intrinsic focal theorem.

For a closed holomorphic embedding consume GT's
`euclideanSquaredDistance_isProper` and compact distance sublevels, identifying
the complex embedding with its underlying real carrier.
Apply M1–M2 and A1 to
give a CW model of real dimension≤n, one cell per critical point with its
actual index, and compatible sublevel maps. State the proper holomorphic
embedding formulation as well. Establish the same conclusion for every
smooth affine algebraic submanifold using closedness of polynomial zero sets
and the Jacobian/holomorphic submanifold comparison.

## A3. Pseudoconvex exhaustions and their topology

Given a smooth proper bounded-below strongly q-pseudoconvex exhaustion,
use A1's fine C² openness and MorseTheory M3's approximation with global C⁰
error<1 to produce a proper bounded-below Morse exhaustion preserving that
positivity. Prove the chosen local tolerances and index bounds survive the
whole exhaustion construction. Give the relative version preserving an
already Morse closed neighborhood. Obtain a CW model of dimension≤n+q.
For strict plurisubharmonicity q=0 this includes A2 independently of its
distance-specific proof. A proper strictly plurisubharmonic exhaustion is
the hypothesis here; a Stein embedding theorem or the Levi problem is not
an implicit premise.

Apply MorseTheory M4's integral H_j vanishing above CW dimension d, H_d
freeness including countably infinite cells, and UCT cohomology vanishing
above d to these actual CW models. Degree-d cohomology can have torsion from
H_(d−1); do not claim its freeness. Give field Betti bounds on each finite
regular band, and comparisons of different exhaustions via the underlying
space's singular groups. Prove a compact complex submanifold of a manifold
with such a strongly q-pseudoconvex exhaustion has complex dimension≤q,
by the maximum/Levi test on its tangent space.

## A4. Compact algebraic pairs, triangulation and complement duality

**A4.0. Locally finite chains and noncompact duality.** This generic
foundation uses AT2–6's chains/cochains/tower algebra, CC C1.2a S0–S5's supported
cohomology and supplied-collared-boundary pair sequence, AT6.0/6.3/6.4's tower/orientation/compact-boundary duality,
MorseTheory M2–M3's proper exhaustions and GT's locally finite triangulations
and collar/corner rounding. It precedes A4.1 and uses
none of A0–A3's complex/affine geometry or Four's smoothing/classification.
Its real smooth-manifold statements also allow collared boundary; the complex
manifold statements in the other stages retain their boundaryless models.

Construct Borel–Moore homology with module-valued local coefficients from
locally finite singular chains on
second-countable locally finite polyhedra and smooth manifolds, with proper-map
functoriality (with a coefficient-system morphism) and restriction to opens.
Own the coefficient transport, boundary, local finiteness and square-zero
proofs and the locally finite singular/simplicial comparison with these coefficients.
For an open V⊂U with compact exhaustion L_s inside V, define restriction on
homology by the zigzag
`C^lf(U;L)→lim_s C(U,U\L_s;L)←lim_s C(V,V\L_s;L|_V)=C^lf(V;L|_V)`.
The left arrow records relative restrictions; the right arrow is levelwise
excision between degreewise-surjective towers and is inverted on homology
using AT 6.0's limit-homology comparison. Prove exhaustion independence,
composition of open restrictions and proper-map compatibility.
Own a locally finite triangulation
of X\A using successive subdivided barycentric-neighborhood shells, compatible
on their overlaps, using that coefficient-sensitive chain comparison.
For the closed/open exact sequence require the closed piece to be a closed
subpolyhedron in a compatible locally finite triangulation, so both pieces
remain in this category. Build the required open-complement triangulation
and subdivision/excision maps rather than assert a sequence for arbitrary
closed subsets. For compact finite triangulated X and subcomplex A, prove
`H_j(X,A;ℤ)≃H_j^BM(X\A;ℤ)` using the cofinal regular neighborhoods.
Own the missing limit argument: identify locally finite chains with the
inverse limit of `C(U,U\K_r)` for a countable compact exhaustion, whose
chain-level transition maps are surjective. Consume
[AlgebraicTopology Stage 6.0](https://github.com/TauCetiProject/TauCetiRoadmap/blob/50af6084a401dffe3db1e50dac46fe4bca36f4fd/TauCetiRoadmap/AlgebraicTopology/README.md)'s generic lim¹,
Milnor chain/cochain sequences and
cofinal-shift naturality. Specialize its cochain sequence to restrictions
to compact exhaustion pieces. For the compact pair, subdivision/excision and cofinal
neighborhood retractions identify the homology tower with a constant tower;
prove its lim¹ vanishes. Extend AT Stage 6's orientation-
local-system duality to noncompact manifolds:
`H_j^BM(U;ℤ)≃H^(m−j)(U;orientation_U)`.
Use integer degree for this formula, extending the native ordinary cochain
complex by zero in negative degrees and proving its nonnegative-degree
comparison. For j>m the right side is zero; avoid natural-number truncated
subtraction turning it into H⁰.
Consume GT's
smooth/PL comparison step 1 countable locally finite smooth triangulation and
its relative/adaptive refinement for general noncompact smooth manifolds;
the polyhedral-complement shell triangulation is the separate A4 construction.
Use a regular compact-sublevel exhaustion K_r from MorseTheory M2–M3.
Before fixing simplex orderings, use the relative/adaptive triangulation
refinement to ensure that every simplex meeting K_r lies in K_(r+1),
for all r. Then take a barycentric subdivision; it preserves this property.
Order its vertices by the dimensions of their
original faces; each simplex is a strict face chain, so this restricts to a
total order and the restricted orders agree on shared faces. Use the local
orientation generators on these ordered top simplices to construct a locally
finite singular fundamental cycle with coefficients in `orientation_U`.
Own the cycle proof: the link of every codimension-1 simplex in a boundaryless
triangulated m-manifold is a 0-sphere, so exactly two top simplices contain
that face; the shared face is literally the same ordered singular simplex.
Prove their transported orientation coefficients cancel in its first-vertex
fibre. Use GT's PL-manifold/link comparison. Whenever further refinement is
needed, perform it first, then barycentrically subdivide and order anew by
face dimension; verify the subdivision comparison with transported
coefficients between the two ordered complexes.
Prove its local orientation characterization, uniqueness, independence of the
triangulation and compatibility with Borel–Moore restriction to opens. A chosen
orientation identifies this cycle with its untwisted integral version.
Prove uniqueness using the twisted Milnor sequence: AT 6.3's local-homology
vanishing gives `H_(m+1)(K_r,∂K_r;orientation_U)=0`, hence lim¹ vanishes;
its top-local-image injectivity determines relative classes on every component.
Use AT 6.4's collar/excision zigzag to compare these groups with
`H_*(U,U\K_r;orientation_U)`, compatibly with cap and orientation restriction.
For manifolds
use that exhaustion and compare
the homology and cohomology Milnor sequences, including both lim¹ terms and
cap-product naturality, to pass from compact-boundary duality to U. Construct
the ordered locally finite fundamental chain from that adaptively refined
then barycentrically subdivided triangulation; its simplices meeting K_r
lie in K_(r+1). Form the
strict shifted tower map
`Φ_r:C^k(K_(r+1);orientation_U)→C_(m−k)(U,U\K_r;ℤ)` by cap with
that cycle and AT 6.3's canonical local-system pairing
`orientation_U⊗orientation_U→ℤ` (o⊗o maps to 1 for each local generator o).
Surviving back faces meeting K_r come from simplices wholly in
K_(r+1), so restriction and projection commute exactly. Use the AT cap
boundary identity; in Hatcher's front-face/back-face convention give the
reindexed cochain complex differential `d^k=(−1)^(k+1)∂`, so this is a
cochain map in every integer degree. Extend the native chain complex using
`ComplexShape.embeddingUpIntLE m`, whose degree map is j↦m−j. Own the
chain isomorphism from its unsigned differential to the signed complex by
degree-k multiplication by `ε_k=(−1)^(k(k+1)/2)`; prove
`ε_(k+1)=(−1)^(k+1)ε_k`, and transport the integer-graded Milnor sequence
and naturality through this isomorphism. Identify Φ's homology map with
AT 6.4's orientation-local-system compact-boundary duality composed with
`H^k(K_(r+1);orientation_U)→H^k(K_r;orientation_U)`.
That restriction need not be an isomorphism;
apply Stage 6.0's cofinal-shift isomorphisms on lim and lim¹, Milnor naturality
and the five lemma, rather than a levelwise-quasi-isomorphism claim. Treat
the resulting duality map as `[φ]↦[z⌢φ]`, with the displayed tensor pairing.
The ε isomorphism transports only Milnor exactness/naturality; it does not
rescale this map. Prove agreement with AT 6.4 for compact boundaryless U.
Treat dimension 0 separately by the product of pointwise coefficient groups on the
discrete manifold, without a half-space/boundary model. Distinguish
it from `H_j(U)≃H_c^(m−j)(U)`.

Export `noncompactPoincareLefschetz` for an m-dimensional smooth manifold
M with collared boundary, Hausdorff and second countable, and any module-valued
local system L. Construct [M,∂M]^BM with its actual boundary class and prove
all four cap isomorphisms, with integer degrees and the displayed orientation
twist: H^k(M;L)≃H_(m−k)^BM(M,∂M;L⊗or_M),
H^k(M,∂M;L)≃H_(m−k)^BM(M;L⊗or_M),
H_c^k(M;L)≃H_(m−k)(M,∂M;L⊗or_M), and
H_c^k(M,∂M;L)≃H_(m−k)(M;L⊗or_M).
For collared boundary first construct the boundaryless collar extension
M⁺=M∪_(∂M×{0})(∂M×(−1,0]). Choose a proper exhaustion there using
MorseTheory M2–M3; rectify it on the specified collar to be product-like
in the normal coordinate, using a proper exhaustion on ∂M, locally finite
collar cutoffs and relative fine perturbations away from that collar. Choose
regular levels for the interior and boundary restrictions. Intersect their
compact sublevels with M, then round their collar corners by GT's relative
rounding, retaining the actual compact boundary pairs and cofinal inclusions.
On each rounded piece take ∂₀K from K∩∂M and ∂₁K from its regular cut,
with their labelled collar/edge comparisons; these collars supply the
excisive triad neighborhoods. Consume AT6.4's single
`compactTriadPoincareLefschetz` and its nested-cut naturality. Its relative
cap maps are the finite-stage maps for all four displayed limits/colimits.
Prove cofinality, including along every noncompact boundary component;
this construction does not apply a boundaryless Morse theorem directly to M.
Use the same locally finite fundamental chain and this compatible compact
exhaustion; relative boundary faces and regular cuts have the actual rounded
models from GT. For compact-support cohomology pass through the filtered
compact-relative colimit; for ordinary cohomology/BM chains retain the
preceding Milnor/lim¹ comparisons. Prove restriction, proper pushforward/
pullback adjunction, supported pair-sequence and boundary-sign compatibility,
and agreement with AT6.4 on compact pieces. Prove H_0^BM(M)=0 when M has no
compact connected component by locally finite proper-ray boundaries. These
are comparisons of CC's supported and this stage's single BM carriers,
not new cohomology definitions. Four's early proper-cobordism calculation
consumes only A4.0.

**A4.1. Algebraic triangulation and complement comparisons.**

Build finite triangulation of a compact semialgebraic set X compatible with a
finite family of semialgebraic subsets S_i of X: produce an actual finite
simplicial complex and a semialgebraic homeomorphism of its realization such
that each S_i is a union of open-simplex images. Closed S_i are realized by
subcomplexes. Supply restrictions, compatible subdivisions and dimension
comparison. Own semialgebraic dimension from CAD
cells, its independence, finite-union/product/closure and fiber-dimension API,
and comparison with smooth real and reduced complex analytic dimensions.
For each nonzero input polynomial p of total degree d, let H_p be its
nonzero homogeneous degree-d part. For the shear `(y,t)↦(y+a t,t)`, prove
that its coefficient of t^d is the constant H_p(a,1). On the parameter
set where this is nonzero it is the last-variable leading coefficient.
Prove simultaneous nonvanishing for a nonempty open dense set of a, using
the nonzero product of these dehomogenized polynomials; treat zero and
constant polynomials separately. This supplies the generic-direction claim.
Then construct the derivative/slicing-family completion of
Bochnak–Coste–Roy §9.1, Proposition9.1.2, retaining every original sign
marker. Prove that its cylindrical cells project to lower cells and that
each cell closure is a union of cells, with the compatible graph-section
restrictions of Theorem9.1.4. Own this preparation before triangulation;
a bare sign-invariant CAD is not assumed to have the frontier property.
Choose the lower-dimensional base triangulation compatible with the projected
strata and signs. Prove continuous extension of bounded section roots to
closed base simplices when the witnessing polynomial specializes to a
nonzero polynomial at every point of the closed simplex. Quasi-monicity
supplies this hypothesis. Use finiteness of the boundary roots, compactness
of the bounded vertical interval, and connected intersections of small balls
with the simplex interior to prove existence and continuity of the limit.
Construct the inductive simplicial lift and finite-family compatibility
refinement. Prove compact extension, gluing and bijectivity;
compact-to-Hausdorff gives inverse continuity. CAD cells alone are not a
triangulation.

Expose a parametrized finite compact lifting theorem. Its input is a
caller-supplied finite quasi-monic polynomial family F closed under last-variable
differentiation ∂_t, with zero and constant derivatives handled separately,
the frontier-compatible cylindrical refinement prepared above, and a base
triangulation compatible with every projected stratum, with its map. Choose
M>0 bounding the compact set's last coordinate, include
`t²−M²` and its derivatives in F, and retain only section heights in [−M,M]
in every completed list. The bounding sections are retained on every face;
all section-coverage claims concern this closed bounded vertical interval.
Export the finite adapted cells, the original marked signs, each section's
witnessing polynomial and constant fiber multiplicity, continuously extended
section functions and lifted face maps. Export as definitions the first
subdivision's vertex orders, the per-simplex completed lists L(σ), their face
restriction maps ρ, the E_l extension maps below, and the second subdivision's
distinguished vertices, so consumers can prove further invariants of those
same maps. Prove each
open-simplex image lies in one adapted cell. Use the coordinate-permutation
adapter `Equiv.swap 0 (Fin.last n)` from the last affine variable in
`Fin (n+1)` to RealAlgebraicGeometry's distinguished coordinate0 and back. Retain all derivative polynomials added by a caller;
no replacement by an unrelated merely sign-invariant CAD is permitted.

Barycentrically subdivide the base **before** completing its stacks. Vertices
are ordered by their chain of controlling faces, with the top vertex in the
controlling open cell. Complete stacks recursively on dimension and this
ordered-face data, retaining the original section functions. Inside a gap
a<b on σ=[v₀<⋯<v_d], use precisely the auxiliary index set
`I={x∈L(F_d): a|F_d<x≤b|F_d}`, where F_d is the opposite face.
It is empty if the gap collapses on F_d. Include the upper endpoint in I;
its auxiliary extension is distinct from the original section b. Assign every
auxiliary index the value a at v_d, retaining b as the original upper endpoint.
For i<d prescribe the facet restriction
`aux_x|F_i=aux^{F_i}_{ρ(x)}` if `ρ(x)≠a|F_id`, and `a|F_i` otherwise,
where F_id=F_i∩F_d and ρ is restriction from F_d to F_id.
For an empty opposite face the top-vertex value is a. Prove these prescriptions
agree on all common faces by the dimension-decreasing recursion. Elements of
L(τ) are pairwise distinct on each open τ; any tagged copies are only local
auxiliary-index labels. Thus ρ is plain function restriction, possibly identifying
heights on a face, and is nondecreasing and natural under iterated restriction.
Prove its surjectivity onto each completed boundary list in [−M,M], using the
fixed top-vertex rule and the included upper-endpoint index. Repetition/padding
is through these maps, not an asserted coherent list on an arbitrary
unsubdivided boundary.
This supplies the boundary lists for the extension below. Only after the
ordered-face preparation may the facet formula be applied. A root present
only on a boundary face is extended into its incident stacks. Prove finiteness
by the finite base/section families and strict decrease of dimension in the
recursive calls, and prove order, shared-face compatibility and coverage.
For a face-coherent boundary list in a gap a≤b on a d-simplex, normalize each
height by r_l=(c_l−a)/(b−a) where b>a. In barycentric coordinates λ use facet
projections p_i removing λ_i and dividing by 1−λ_i, weights
`w_i=∏_{j≠i}λ_j`, `w_*=∏_j λ_j`, and fixed ordered constants
`0<α₁<⋯<α_L<1`. The interior extension is
`E_l=(w_*α_l+Σ_i w_i r_l(p_i))/(w_*+Σ_i w_i)` and the height is
`a+(b−a)E_l`. If I is nonempty, every open facet entering this E-formula
has a<b: facets containing v_d remain in the controlling open cell, and
nonemptiness of I forces a<b on F_d. Thus each normalized facet ratio is
defined there; no arbitrary value for an undefined collapsed-facet ratio is
needed. A gap collapsed on F_d contributes no auxiliary indices. Collapse
on lower-dimensional boundary faces is handled by bounded ratios multiplied
by the vanishing width. Prove positivity/order, semialgebraicity and continuity to
the prescribed boundary heights, including vertices and collapsed gaps;
bounded ratios suffice where b−a tends to zero. Handle d=0 separately.
Expose preparation and extension lemmas separately, with equality on every
shared face. At a noncollapsed boundary point, prove the facets containing
its face have dominant weights and their projected values converge to the
prescribed ratio; the other weights are negligible. At a vertex the weight
of its opposite facet is negligible. At a collapsed point use boundedness
of all ratios and the vanishing factor b−a.
The completed consecutive sections restrict to equal or consecutive sections
on every face. After completing the stacks, barycentrically subdivide the
base so each new simplex has a distinguished vertex in its controlling open
simplex, where every noncollapsed gap is positive. This is a second refinement,
following the initial ordered-face refinement. Prove strict ordering of
affine vertex-height interpolants from this vertex and the exact band/graph
face restrictions. For the band transfer consume
[RealAnalyticGeometry R2 Lemmas11–12 and Lemma14's closed-band continuity](https://github.com/TauCetiProject/TauCetiRoadmap/blob/525a920850e39a4db23a778eec27cb75308b877a/TauCetiRoadmap/RealAnalyticGeometry/README.md#L179-L193),
with the base map as g on each compact closed base simplex. Verify the
collapsed-endpoint condition on every face using the completed lists.
For subdivision construct here a coherent pulling triangulation of these
completed affine bands and graphs. Their vertices are the prescribed upper
and lower endpoints over base vertices, identifying coincident endpoints.
Prove that all their faces have the same graph/band form over base faces,
and that any two cells meet in a common face, using the equal-or-consecutive
section restrictions. Include all such faces. Fix one total order on the
finite set of endpoint vertices. Recursively triangulate a polytope by
coning its least vertex to the pulling triangulations of the facets not
containing it. Prove coverage, simplicial intersections and restriction to
every face, with the same vertex order. All cones use existing vertices;
no interior lifted vertex is added.

Export the normal projection property of the resulting lift. Let K_b be
the final base complex after the two specified refinements, and let
`Ψ_b:|K_b|→B` include their canonical subdivision homeomorphisms and the
original base map. For the lifted complex K_l and triangulation map Φ,
construct a simplicial vertex map `p:K_l→K_b`: every lifted simplex projects
onto a base simplex, allowing dimension drop on vertical faces. Prove the
commuting identity `π∘Φ=Ψ_b∘|p|`, where π drops the last coordinate.
In the rectilinear realization identify |p| with that coordinate projection.
Retain this identity on every face and on restrictions to the marked subsets.
The endpoint-only pulling construction supplies this guarantee; generic
coning to a new interior point does not preserve the final base vertices.

This application consumes R2's displayed endpoint calculus and compact-base
band continuity, not its analytic-coordinate induction or property(A).
The bounded affine and real multiprojective semialgebraic application in
RealAnalyticGeometry R2.1 consumes the exported vertex orders, completed
lists, restriction/extension maps and distinguished vertices to prove the
Nash/analytic-simplex invariant of these same maps. That refinement is a
downstream comparison, not an input to this compact semialgebraic lifting.
A4.1 owns the frontier preparation, completed lists, extension/restriction
maps, projection-compatible pulling triangulation and finite-polynomial
application. R2 retains its generic band-transfer and relative coning
constructions; the interior-point coning is not the present lifting step.
The CAD dimension API precedes lifting and uses neither the analytic
invariant nor RealAnalyticGeometry's Stein/manifold triangulation results.

Apply this to real/imaginary polynomial equations and to projective sets
using the finite affine atlas and a compact real algebraic projector model
for ℂPᴺ. Prove comparison of the models and semialgebraicity of the chart
changes; triangulate a presented projective algebraic pair (X,A) jointly.
Own neighborhood retractions: make A full after barycentric subdivision,
construct an open simplicial neighborhood by barycentric coordinates and
a straight-line strong deformation retraction onto A fixing A. Iterated
subdivisions give cofinal neighborhoods. Prove the NDR/cofibration comparison
and construct AT Stage 8's `BasedTopPair` with basepoint in A.
This applies even when X or A is singular. Give hypersurface and complete-
intersection Jacobian checks for a smooth complement of pure dimension n.

For a compact triangulated pair with oriented smooth complement U of real
dimension 2n obtain the actual natural composite
`H_j(X,A;ℤ)≃H^(2n−j)(U;ℤ)`. Pin naturality under orientation-preserving
isomorphisms of pairs and open restrictions with Borel–Moore restriction
maps, without asserting covariance of ordinary cohomology under arbitrary
inclusions. In particular it applies to a pure-dimensional
projective algebraic X when all its nonsmooth points belong to A and U is
complex n-dimensional. Prove this comparison before invoking affine
cohomology vanishing; compact manifold duality alone does not cover singular X.

## A5. Projective hyperplanes and relative homotopy

For a presented pure n-dimensional projective algebraic X and hyperplane H
containing every nonsmooth point of X, set A=X∩H. Identify U=X\A with a
closed smooth affine submanifold in the standard chart ℂPᴺ\H≃ℂᴺ,
and identify its dimension. Allow whole components contained in H; if U is
empty the relative groups vanish directly. Prove A meets every connected
component of X for n≥1: a component missing H would be a compact positive-
dimensional complex submanifold of the affine chart, contradicting A1.

Combine A2–A4 to prove H_j(X,A;ℤ)=0 for j<n. The pair exact sequence
then gives H_j(A;ℤ)→H_j(X;ℤ) isomorphisms for j<n−1 and surjectivity
for j=n−1. Pin the maps as actual inclusion-induced maps. Include reduced
degree-zero and connected-component statements. For smooth X, DG Sard on
the incidence/dual-projective parameter family gives transverse hyperplanes
forming a dense full-measure set; full-measure means a null exceptional set
in every affine chart of the dual projective parameter space. Verify A is a
smooth hypersurface there.
The homological theorem also applies when A itself is singular under the
stated complement hypothesis.

Prove the relative homotopy strengthening π_j(X,A)=0 for 1≤j<n with
basepoints in A. Use a good-center distance exhaustion ρ on U and the
function F=(1+ρ)⁻¹ on U, extended continuously by 0 on A. Prove continuity
at A from properness of the affine chart coordinates. For every small
regular ε>0 the band ε≤F≤1 is compact inside U; its critical indices
are 2n−λ≥n. Attach the reversed M2 handles to X_ε={F≤ε}, leaving A
fixed, and compare through cofinal ε. Consume M2 handle homotopies fixing
the entire lower sublevel, and prove extension-by-identity over A: the set
`{F<a}∪A` is open and the homotopy is the identity there. For any compact relative disc map,
cellular approximation removes the cells of dimension≥n in dimensions<n,
placing it in a regular neighborhood of A, which A4 retracts onto A.
Prove the pair/basepoint and relative-map homotopies explicitly. Do not
infer relative homotopy vanishing solely from integral homology vanishing.
For every connected X in this smooth-complement scope deduce π_j(A)→π_j(X)
isomorphisms for j<n−1 and surjectivity for j=n−1, with the π₁ and
component cases treated by the actual long exact sequence of pairs. Also
derive homological weak Lefschetz directly from relative high-cell attachment
and the neighborhood retraction; A4 duality gives the independent source
duality proof on the same groups.

## A6. Examples and naturality

Compute ℂⁿ, (ℂ*)ⁿ, affine quadrics and smooth affine hypersurface examples
on the actual exhaustion and CW carriers. Show the complex closed-embedding
hypothesis matters using ℂ²−{0} with its ordinary inclusion into ℂ²:
a bounded distance sublevel can accumulate at the missing origin and is
not compact. State this example without claiming it is Stein. For projective curves identify
the n=1 degree-zero surjectivity conclusion. For n≥2 compare hyperplane
connectedness, π₁ and low-degree groups of smooth projective hypersurfaces
with the ambient projective calculation. For every positive degree d build
the classical degree-d Veronese map on K7.1's native projective carriers,
indexed by the finite set of exponent vectors α:Fin(n+1)→ℕ with Σα=d,
ordered by a fixed lexicographic order. Its image is the A0 common zero
locus of the homogeneous quadratic binomials y_α y_β−y_γ y_δ with
α+β=γ+δ. Prove the ideal/image equality, the reduced image's pure
complex dimension n and its smoothness by explicit coordinate-chart
inverses where an original coordinate is nonzero. Prove well-definedness,
closed holomorphic embedding, compatibility with A0's native chart
transport, properness and those actual local inverses, and the pullback
of O(1) as O(d);
express a homogeneous polynomial as
the corresponding linear functional in those monomials. Identify its A0
zero locus and inclusion with the hyperplane section of the embedded
ambient projective space. Apply A5 to that actual inclusion and transport
the resulting maps back through the Veronese homeomorphism. Degree1 is
the linear case; degree0 equations retain A0's separate conventions.
Include projective varieties whose
singular points all lie in H, verifying the complement and triangulated-pair
hypotheses. Inclusion-induced Lefschetz maps form commuting squares under
inclusions of presented pairs. Duality identifications are natural under
projective-linear isomorphisms and the specified open restrictions.

## References and source assertions

- Milnor, [Morse Theory](https://www.maths.ed.ac.uk/~v1ranick/papers/milnmors.pdf),
  §7, Theorems 7.1–7.4: closed affine embeddings, paired eigenvalues,
  homological and homotopy hyperplane conclusions.
- Hain, [Notes on the Morse theory of complex manifolds](https://sites.math.duke.edu/~hain/teaching/archive/spring_12/mini_s12/levi.pdf):
  Levi positivity and q-pseudoconvex index bounds.
- Bochnak, Coste and Roy, *Real Algebraic Geometry*, §9.2: the compact
  semialgebraic triangulation proof supplying A4.
- Thomas Mark's Math240 December 7, 2001 lecture: complex second
  fundamental form, opposite shape eigenvalues, affine CW/H_n freeness and
  weak hyperplane Lefschetz. A2 supplies the missing closed/proper condition;
  A5 states the smooth-complement hypothesis required by the displayed duality.
