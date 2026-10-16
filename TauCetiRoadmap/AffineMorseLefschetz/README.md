# Complex Morse theory, affine topology and weak Lefschetz

Develop the topology controlled by the Levi form: real Morse index bounds,
closed holomorphic embeddings, proper pseudoconvex exhaustions, affine CW
dimension and projective hyperplane sections. Include integral homology and
relative homotopy, as well as the compact-pair topology needed when the
projective variety has singularities contained in the hyperplane.

## Carriers, conventions and suppliers

Use Mathlib complex `ChartedSpace`/`IsManifold` and `MDifferentiable ℂ`;
[ComplexKahlerGeometry K1,K3,K7](../ComplexKahlerGeometry/README.md) supplies
holomorphic submanifolds, scalar restriction, analytic germs, projective
charts and the complex orientation. Its K5 elliptic theory and K6 Hard
Lefschetz are independent of the weak hyperplane results here.
[MorseTheory M1–M4](../MorseTheory/README.md) supplies intrinsic Hessians,
indices, fine Morse approximation, compact-band attachment and proper CW
exhaustion. [RiemannianGeometry R5–R6](../RiemannianGeometry/README.md) supplies
second fundamental forms, shape operators, normal endpoint maps and the
distance-squared critical/Hessian/focal comparison. Its Euclidean formulas
follow R5 independently of global Jacobi comparison.
[AlgebraicTopology Stages 2–4,6,8](../AlgebraicTopology/README.md) supplies
singular pairs, CW/cofibration machinery, UCT, compact manifold duality and
relative homotopy. [DifferentialGeometry 10.2](../DifferentialGeometry/README.md)
supplies sharp Sard and chartwise null-set transport. A4 owns the noncompact and compactification duality
extensions used here. [GeometricTopology Layer 11](../GeometricTopology/README.md)
supplies actual simplicial complexes, realizations and subdivisions.
[RealAlgebraicGeometry Layers 3–6](../RealAlgebraicGeometry/README.md)
supplies semialgebraic sets/maps, CAD and projection closure; A4 owns finite
semialgebraic triangulation, which that roadmap does not supply.

All manifolds are finite-dimensional, Hausdorff and second-countable, with
boundaryless models. The complex dimension is n, the real dimension 2n.
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

For `ρ_a(x)=‖i(x)−a‖²`, consume R6 smoothness, nonnegativity, the critical-point
normal-vector test and Hessian `2(g−g(B, a−i(x)))`. Prove the complex identity
`Hess ρ_a(v,v)+Hess ρ_a(Jv,Jv)=4‖di(v)‖²` at critical points.
Its Levi form is positive everywhere. Consume R6's normal-endpoint/Sard
comparison showing bad centers lie in a Lebesgue-null set and good centers
are dense, with its total-space/chart and canonical-Haar measure comparisons.

If i is a closed holomorphic embedding, consume R6's properness and compact
sublevel theorem and identify the complex embedding with its real carrier.
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

Build finite triangulation of a compact semialgebraic set compatible with a
finite family of closed semialgebraic subsets: produce an actual finite
simplicial complex, a semialgebraic homeomorphism of its realization and
subcomplexes realizing the subsets. Supply restrictions, compatible
subdivisions and dimension comparison. Own semialgebraic dimension from CAD
cells, its independence, finite-union/product/closure and fiber-dimension API,
and comparison with smooth real and reduced complex analytic dimensions.
Follow Bochnak–Coste–Roy §9.2: prove generic linear changes making the finite
polynomial family quasi-monic in the last variable; after compatible base
refinements prove continuous extension of bounded section functions to cell
closures. Construct the inductive simplicial lift over a triangulated base
and finite-family compatibility refinement. Prove compact extension, gluing
and bijectivity; compact-to-Hausdorff gives inverse continuity. CAD cells
alone are not a triangulation.

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
[AlgebraicTopology Stage 6.0](../AlgebraicTopology/README.md)'s generic lim¹,
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
hypothesis matters using a punctured compact curve or an open submanifold
whose chosen distance sublevel is not compact. For projective curves identify
the n=1 degree-zero surjectivity conclusion. For n≥2 compare hyperplane
connectedness, π₁ and low-degree groups of smooth projective hypersurfaces
with the ambient projective calculation. Include projective varieties whose
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
