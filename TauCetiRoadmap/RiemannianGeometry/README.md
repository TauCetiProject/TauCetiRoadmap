# Roadmap: curvature, Jacobi fields, submanifolds, and Bochner geometry

**Summary.** Develop the reusable graduate Riemannian geometry that connects curvature to
geodesic variation, the topology of complete manifolds, extrinsic geometry, and
harmonic forms. The milestones include full curvature calculus, Jacobi and index
theory, comparison and space forms, minimal submanifolds and spherical eigenmaps,
focal geometry, and the real Weitzenböck–Bochner package. Definitions come with
their coordinate, naturality, regularity, and computational APIs.

This README is the roadmap. `Suggested.lean` is its acceptance test: it states the
headline theorems below against the pinned Mathlib and Tau Ceti, and its docstring names
the headlines that are not yet statable there.

The sub-roadmap [Local geometry of Riemannian surfaces](Surfaces/README.md) owns polar
coordinates and normal strips on surfaces, integration up to normal cut times on surface
domains, Gauss–Bonnet for disks with corners and the turning theorem with corners,
nonpositively curved normal balls without completeness, and conformal invariance of the
surface Dirichlet energy. It is independently definitive and states its boundaries with the
milestones below.

## Scope and ownership

This roadmap extends the curvature, Jacobi, comparison, immersion and Bochner
programme on its existing carriers. HopfRinow Layers 0–4 own connections,
geodesics, exponential maps and completeness. SmoothBundlesConnections B5.1
owns reconstruction from smooth transport, including its inverse dictionary on
differentiable germs. GeometricTopology Layer 1 owns normal bundles and tubular
neighbourhoods, and [GeometricTopology](../GeometricTopology/README.md)'s smooth-triangulation
theorem (Whitehead: every smooth manifold admits a smooth triangulation) owns smooth
triangulation; R5a owns the metric orthogonal-to-quotient comparison and R3.2 the finite marked-point
refinement. ComplexKahlerGeometry K5a owns the bundle analytic and Hodge theory;
PseudodifferentialOperators P1.0 owns the smooth differential-operator, jet,
symbol, density-transpose, formal-adjoint, Laplace-type and canonical
Bochner-connection core on finite-rank bundles. R7 consumes that core for
geometric curvature identities and vanishing consequences; its one variant,
R7.3's Laplace-type theorem for D*D, differs from P1.0's Dirac-type
theorem only in allowing D:E→F between bundles of different ranks. R4.7 owns the
completeness of the quotient of a complete Riemannian manifold by a free properly
discontinuous group of isometries, built on the library's quotient manifold, quotient
metric and curvature naturality, and the space-form quotients; PseudodifferentialOperators P7a consumes
these; R4.7 uses no PseudodifferentialOperators target, so P1.0 → R7 and R4.7 → P7a form
no cycle. R5b owns the Dirichlet realization of a symmetric Schrödinger operator
`∇*∇+K` on a Riemannian vector bundle with a metric connection, the normal
Jacobi operator being the normal-bundle case: its
form on W¹,²₀, the self-adjoint operator that form represents, built on Tau Ceti's
Lax–Milgram solution operator, and its boundary-domain identification. It is
stated for forms that are coercive after a shift with a compact dense embedding,
the only case R5b uses; no general closed-form representation is a target here.
R5c owns, on R5b's realization, the boundary estimates of every Sobolev
order, the index on smooth sections, the scalar
first-eigenfunction theory on closed connected manifolds and connected domains
with strict domain monotonicity, and the scalar Dirichlet problem; on closed
manifolds it consumes K5a's spectral decomposition,
and for the ordered eigenvalues and the min–max principle
[VariationalMethods](../VariationalMethods/README.md) 3.1 and 4.1–4.4.

The following are already in Tau Ceti, and this roadmap cites them rather than
restating them: the first and second Bianchi identities, the metric skew symmetry
and pair interchange of the curvature tensor, its chart formula and its
smoothness, the covariant derivative ∇R with its contraction to ∇Ric and its
naturality under local isometries, and the Ricci identity with and without
torsion (R1.1); the parallel-curvature predicate ∇R=0, its consequence from
constant sectional curvature and its pullback along local isometries, in
particular to open submanifolds (R1.2); the constant-scaling laws for the
connection and the curvatures, the connection and curvatures of a product metric
and the connection of a warped product (R1.3); the constant-curvature Ricci and
scalar contractions, the
characterization of constant sectional curvature by the curvature tensor,
Schur's theorem, the constancy of the Einstein factor, the parallel-curvature
characterization of locally symmetric surfaces, the conformal-change laws for
the connection and for curvature, Ricci and scalar curvature, and the connection
and curvature of an ad-invariant left-invariant metric, the left-invariant metric of an inner
product on the Lie algebra with its bi-invariance for an Ad-invariant product and
the completeness of every left-invariant metric, completeness of homogeneous
Riemannian manifolds, and the pointwise curvature operator on bivectors with its
symmetry, Rayleigh quotients and isometry naturality (R1); the regularity,
fixed-chart formula and reparametrization law of covariant differentiation along
curves (R2) and the commutation of mixed covariant derivatives up to curvature on a
parametrized surface (R3); the Banach-valued weak derivative on an interval, its
characterization as a constant plus the primitive of the weak derivative, its continuous
and absolutely continuous representative with the fundamental theorem of calculus, the
fundamental theorem of calculus for absolutely continuous curves in finite dimension,
their composition with C¹ maps, and the smoothness of the exponential map on its open
domain in the tangent bundle (R3.1); smoothness of geodesics
of a smooth metric up to the ends of their parameter sets, the Jacobi predicate
with uniqueness from initial data, the Wronskian, the constant-curvature
solutions, the absence of endpoint-zero Jacobi fields under nonpositive sectional
curvature, the finite-dimensional solution space, the Gauss lemma and the
identification of d(exp_p) along a radial geodesic with the Jacobi field of
initial data (0,w) (R2); the normal coordinate fields with their vanishing
covariant derivatives and vanishing first metric derivatives at the centre
(§2.2); conjugacy, conjugate
multiplicity, its positivity criterion and its bound n−1 (R3); the model sine and
cosine (R4.1); the curvature of the round sphere of every radius and of the
half-space model, the full isometry groups of Euclidean space and of the round
sphere, the normal form of the isometries of the half-space model and the
determination of an isometry of a connected manifold by its value and
differential at one point (R4.7); the Gauss formula for a map into a real
inner-product space whose differential preserves inner products, which gives the
round-sphere connection and the flat-ambient case of the induced connection
(R4.7, R5a); the round metric in stereographic coordinates and the second
fundamental form and shape operator of a parametrization in a Euclidean space
(R5a.2); pullback metrics along immersions, the smooth atlas of the
based-path universal cover with its local-diffeomorphism projection, the bijection
of its basepoint fibre with the fundamental group and the finiteness of the
fundamental group when the universal cover is compact (R4.3); the
norm-nondecreasing exponential differential under nonpositive sectional curvature
(R4.4); the quotient manifold of a free properly discontinuous smooth action and
the descended invariant metric, and the naturality of the curvature tensor,
sectional, Ricci and scalar curvature under local Riemannian isometries (R4.3,
R4.7); the critical points, Hessian and Hessian kernel of the squared distance
along a parametrization in a Euclidean space, properness of the squared distance from a
point along a closed embedding and its almost-everywhere nondegeneracy and Morse
property along an immersion, and the normal exponential of an embedding with its
open natural domain, its smoothness and its differential along the zero section
(R6); the Lax–Milgram solution operator of a coercive form along a continuous linear
map, with its compactness, symmetry, eigenbasis and Rayleigh principle (R5b); the
Laplace–Beltrami operator, the pointwise
scalar Bochner identity and the Lichnerowicz eigenvalue bound (R7.0); the de Rham
cohomology of a manifold (R7.6, R7.7); the polynomial
Laplacian, the Fischer decomposition, the dimension of the harmonic
polynomials, their orthogonal-group action and their injective restriction to
the unit sphere (R8.1); chartwise null sets and Sard's theorem in equal
dimensions. Real Lipschitz extension, and the charted space and quotient covering
of the orbit space of a free properly discontinuous action, are already in
Mathlib. The exact
declarations are in the supplier contracts. These are inputs, not
construction targets; each section below owns only what goes beyond them.
R4.6 owns the transfer of chartwise nullity to the Riemannian volume, which R6
reuses for the focal set.
DGFloer Layer 1 item 7 owns the complex projective form comparison
ω_g=π·ω_FS, including closedness and the integral-one normalization on CP¹.
R1 owns the round Hopf quotient metrics, curvature and geodesic periods;
its metric construction does not consume that later form comparison.

## Conventions

Work with finite-dimensional real, Hausdorff, second-countable, boundaryless smooth
manifolds and smooth positive-definite Riemannian metrics. Express these through
Mathlib's `ModelWithCorners`, `ChartedSpace`, `IsManifold`, `RiemannianBundle`,
`IsContMDiffRiemannianBundle`, and
[`IsRiemannianManifold`](https://leanprover-community.github.io/mathlib4_docs/Mathlib/Geometry/Manifold/Riemannian/Basic.html#IsRiemannianManifold).
Impose connectedness,
orientation, completeness, compactness, and positive dimension on each result
that needs them. Geodesic domains and exponential domains remain explicit.

Use

`R(X,Y)Z = ∇_X∇_Y Z − ∇_Y∇_X Z − ∇_[X,Y] Z`,

`K(span(X,Y)) = ⟨R(X,Y)Y,X⟩ / (|X|²|Y|²−⟨X,Y⟩²)`.

The unit round sphere has sectional curvature +1. The pointwise curvature tensor
is Tau Ceti's `CovariantDerivative.curvatureTensor` in
`TauCeti/Geometry/Manifold/VectorBundle/CovariantDerivative/Curvature/Tensor.lean`;
sectional/Ricci/scalar curvature use
the existing covariant-derivative APIs, including their independent-vector
hypotheses. The curvature operator on bivectors is characterized by
`⟨Rop(X∧Y),Z∧W⟩ = ⟨R(X,Y)W,Z⟩`, so on constant curvature κ it is κ Id.

Energy is `½∫|γ′|²`. The index integrand is
`⟨D_t X,D_t Y⟩−⟨R(X,γ′)γ′,Y⟩`. The nonnegative Hodge/rough Laplacians
have scalar sign `Δ⁺=−div grad`. On functions Δ⁺ is the negative of Tau Ceti's
`TauCeti.Manifold.laplaceBeltrami`, whose convention is `Δ=div grad`; it is not
a second definition. On the line, `TauCeti.Manifold.laplaceBeltrami` sends x² to
2, so Δ⁺(x²)=−2.
Increasing wedges of an orthonormal coframe are orthonormal; repeated ordered
indices and sums over increasing pairs must have an explicit conversion.

For an isometric immersion f, use
`B(X,Y)=(∇^N_X df(Y))^⊥`, `S_η X=−(∇^N_X η)^⊤`, and
`⟨S_ηX,Y⟩=⟨B(X,Y),η⟩`. Mean curvature is the **averaged vector**
`H=(1/m)tr B` for m>0. The outward-normal unit sphere has B=−g times its
position vector; this fixes all normal and variation signs. Zero-dimensional
immersions use trace B=0 and are treated separately from the average formula.

## Exact supplier contracts

### From Mathlib

Use `LipschitzOnWith.extend_real` in `Mathlib/Topology/MetricSpace/Lipschitz.lean`
for extension of a real K-Lipschitz function from any subset of a pseudometric
space, with K a nonnegative real and no nonemptiness assumption on the subset.
Use the native manifold, finite-dimensional inner-product, smooth bundle and
covering carriers named below, with their stated hypotheses.
For the path-space topology use `TopologicalSpace.compactlyGenerated`,
`eq_compactlyGenerated` and the sequential-space instance of
`UCompactlyGeneratedSpace` in
`Mathlib/Topology/Compactness/CompactlyGeneratedSpace.lean`.
In particular metrizable path spaces retain their topology under k-ification;
no categorical coreflector or unrestricted exponential law is an input here.
For R4.7 use `MulAction.instChartedSpaceQuotient` in
`Mathlib/Geometry/Manifold/Instances/Quotient.lean`, the charts of the orbit space of a
free properly discontinuous action pushed forward along the orbit projection, and
`isQuotientCoveringMap_quotientMk_of_properlyDiscontinuousSMul` in
`Mathlib/Topology/Covering/Quotient.lean`, that the orbit projection of such an action
is a quotient covering map.
For R5a.3 use `IsLocalDiffeomorph.diffeomorphOfBijective` in
`Mathlib/Geometry/Manifold/LocalDiffeomorph.lean`, a bijective local diffeomorphism is a
diffeomorphism, and `Homeomorph.contractibleSpace` in
`Mathlib/Topology/Homotopy/Contractible.lean` with the instance
`SimplyConnectedSpace.ofContractible` in
`Mathlib/AlgebraicTopology/FundamentalGroupoid/SimplyConnected.lean`: a space
homeomorphic to a contractible one is simply connected, a real normed space being
contractible by the instance `RealTopologicalVectorSpace.contractibleSpace` in
`Mathlib/Analysis/Convex/Contractible.lean`.

### From Tau Ceti

Use `CovariantDerivative.ricciTensor_eq_of_curvatureTensor_eq_smul_sub`
in `TauCeti/Geometry/Manifold/VectorBundle/CovariantDerivative/Curvature/Ricci.lean`
and `CovariantDerivative.scalarCurvature_eq_of_curvatureTensor_eq_smul_inner_sub`
in `TauCeti/Geometry/Manifold/VectorBundle/CovariantDerivative/Curvature/Scalar.lean`:
the tensor equation R(w,u)v=B(u,v)w−B(w,v)u gives Ric=(n−1)B,
and its constant-curvature specialization gives Scal=n(n−1)κ.
Use `TauCeti.SmoothEmbedding.NormalSpace` and
`TauCeti.SmoothEmbedding.normalClassL` in
`TauCeti/Geometry/Manifold/SmoothEmbedding/NormalSpace/Basic.lean` for the quotient
normal fibres and their continuous quotient projection. These give the fibre
quotient topology; R5a constructs its smooth metric comparison.
Use `TauCeti.inducedRiemannianMetric` and `TauCeti.inducedRiemannianMetric_inner`
in `TauCeti/Geometry/Manifold/Riemannian/Induced.lean` for a C^(n+1) map
with injective differential into a real inner-product space. R5a.3 uses its
pullback inner-product equation to identify the paraboloid metric, with n=∞.
Use `TauCeti.IsNullSet` in `TauCeti/Geometry/Manifold/Measure.lean` for null
subsets of a manifold: a set is null when its image in every extended chart is
null for every Haar measure on the model; subsets and countable unions of null
sets are null, and on a finite-dimensional model a null set has empty interior.
Use `TauCeti.isNullSet_image_criticalPoints` in
`TauCeti/Geometry/Manifold/Sard/EqualDimension.lean` for Sard's theorem in
equal dimensions: for a differentiable map from a Lindelöf manifold to a
manifold whose finite-dimensional model has the same dimension, the image of
the set of non-regular points is null. Every Sard application in this roadmap
has this form (`exp_p` on `T_pM` in R4.6, the normal exponential and the
Euclidean normal map in R6), and the standing second countability gives the
Lindelöf hypothesis. Use `TauCeti.riemannianVolume_apply_of_subset` and
`TauCeti.chartRiemannianVolume_apply` in
`TauCeti/Geometry/Manifold/Riemannian/VolumeDensity/` for the value of the
Riemannian volume on a measurable subset of a chart source, the Lebesgue
integral of the chart density over its chart image; R4.6 owns the transfer
from chartwise nullity to the Riemannian volume built on them.
The pointwise hypotheses of the curvature contractions include the displayed tensor identity; no curvature
value is inferred from an empty family of two-planes in dimensions zero or one.

For R1, in `TauCeti/Geometry/Manifold/VectorBundle/CovariantDerivative/Curvature/`,
each for a metric-compatible torsion-free connection on the tangent bundle such as
the Levi-Civita connection:
`CovariantDerivative.hasConstantSectionalCurvature_iff_isConstantCurvatureTensor`
(`Polarization.lean`), constant sectional curvature κ holds exactly when
R(w,u)v=κ(⟨u,v⟩w−⟨w,v⟩u) at every point, in every dimension;
`CovariantDerivative.eq_of_forall_hasSectionalCurvatureAt` (`Schur.lean`), Schur's
theorem: on a preconnected manifold of dimension at least three, a pointwise
sectional curvature κ(x) shared by all two-planes at x is constant;
`CovariantDerivative.eq_of_ricciTensor_eq_smul_inner` (`Einstein.lean`), Einstein's
constancy theorem: Ric=a g forces a to be constant on a preconnected manifold of
positive dimension other than two;
`CovariantDerivative.hasParallelCurvature_iff_isLocallyConstant_scalarCurvature_of_finrank_eq_two`
(`LocallySymmetric.lean`), a surface has ∇R=0 exactly when its scalar curvature
2K is locally constant; and, for the rescaled smooth metric e^(2φ)g,
`Bundle.ContMDiffRiemannianMetric.curvatureOperator_leviCivitaConnection_rescale`,
`Bundle.ContMDiffRiemannianMetric.ricciTensor_leviCivitaConnection_rescale` and
`Bundle.ContMDiffRiemannianMetric.scalarCurvature_rescale` (`Conformal.lean`), the
curvature, Ricci and scalar curvature laws, written with Tau Ceti's Δ=div grad, with
`Bundle.ContMDiffRiemannianMetric.scalarCurvature_rescale_of_finrank_eq_two` (`Conformal.lean`),
its surface case `Scal(e^(2φ)g)=e^(−2φ)(Scal(g)−2Δφ)`; and
`Bundle.ContMDiffRiemannianMetric.leviCivitaConnection_rescale_apply` in
`TauCeti/Geometry/Manifold/VectorBundle/CovariantDerivative/LeviCivita/Conformal.lean`,
the connection law `∇̃_X Y=∇_X Y+(2f)⁻¹(df(X)Y+df(Y)X−g(X,Y)grad f)` for the metric f g
with f>0, which for f=e^(2φ) is `∇_X Y+dφ(X)Y+dφ(Y)X−g(X,Y)grad φ`.
In `TauCeti/Geometry/Manifold/Riemannian/LieGroup/BiInvariant.lean`,
`CovariantDerivative.IsLeviCivitaConnection.apply_mulInvariantVectorField` gives
∇_(X_a)X_b=½X_[a,b] and `CovariantDerivative.IsLeviCivitaConnection.curvatureTensor_one`
gives R(a,b)c=−¼[[a,b],c] at the identity, for a left-invariant metric whose inner
product at the identity is ad-invariant.
In `TauCeti/Geometry/Manifold/Riemannian/LieGroup/LeftInvariant.lean`, for a
finite-dimensional Lie group G and a symmetric positive-definite form b on T₁G:
`TauCeti.leftInvariantMetric`, the metric whose value at x is b on the
translates to the identity by L_(x⁻¹), C^m on a C^n Lie group when m+1≤n;
`TauCeti.leftInvariantMetric_inner_mfderiv_mul_left`, left translations are
isometries of it; `TauCeti.leftInvariantMetric_inner_mfderiv_mul_right`, for an
Ad-invariant b right translations are isometries too, so the metric is
bi-invariant; `TauCeti.completeSpace_of_inner_mulInvariantVectorField`, every
Riemannian metric on G in which the left-invariant fields have constant inner
products is complete for its Riemannian distance, with no compactness; and
`TauCeti.completeSpace_leftInvariantMetric`, the same for the metric of b. In
`TauCeti/Geometry/Manifold/Riemannian/Homogeneous.lean`,
`TauCeti.completeSpace_of_isPretransitive_isom_of_finiteDimensional`: a
finite-dimensional Riemannian manifold whose isometry group acts transitively is
complete. For the curvature operator, in
`TauCeti/Geometry/Manifold/VectorBundle/CovariantDerivative/Curvature/ExteriorSquare.lean`,
for a metric-compatible connection on the tangent bundle:
`CovariantDerivative.curvatureEndomorphism`, the pointwise endomorphism Rop of
Mathlib's Gram exterior square ⋀²T_xM with `⟨Rop(u∧v),w∧z⟩=⟨R(u,v)z,w⟩`;
`CovariantDerivative.isSymmetric_curvatureEndomorphism`, its symmetry for a
torsion-free connection; `CovariantDerivative.sectionalCurvature_eq_curvatureEndomorphism`,
sectional curvature as its Rayleigh quotient on simple bivectors; and
`CovariantDerivative.hasSectionalCurvatureAt_iff_curvatureEndomorphism_eq_smul_id`,
constant sectional curvature κ at a point exactly when Rop=κ Id there. In
`TauCeti/Geometry/Manifold/Riemannian/Isometry/ExteriorSquare.lean`,
`TauCeti.IsLocalRiemannianIsometry.map_curvatureEndomorphism`: the exterior square
of the differential of a local Riemannian isometry intertwines the two curvature
operators on all bivectors.
For R1's mixed polarization (§1.1 item 4), in
`TauCeti/LinearAlgebra/Multilinear/SectionalPolarization.lean`, over every
commutative ring and for a four-linear form T skew in its first pair and in its
last pair and satisfying the first Bianchi identity:
`LinearMap.six_mul_apply_eq_of_cyclic_eq_zero`, the six-term identity writing
6T(x,y,z,w) through the values k(a,b)=T(a,b,b,a); `LinearMap.eq_of_cyclic_eq_zero`,
two such forms with the same k are equal when 6 is not a zero divisor; and
`LinearMap.eq_of_cyclic_eq_zero_of_linearIndependent`, agreement of k on linearly
independent pairs suffices over a domain with 6≠0. The pointwise four-tensor
`CovariantDerivative.riemannCurvatureTensor`, Rm(u,v,w,z)=⟨R(u,v)w,z⟩, with its
two skew symmetries and first Bianchi identity, is in `Curvature/Riemann.lean`.

For R1.1, also in `TauCeti/Geometry/Manifold/VectorBundle/CovariantDerivative/Curvature/`:
`CovariantDerivative.curvatureTensor_cyclic_eq_zero` (`Bianchi.lean`), the first
Bianchi identity `R(u,v)w+R(v,w)u+R(w,u)v=0` for a torsion-free connection on the
tangent bundle; `CovariantDerivative.IsMetricCompatible.inner_curvatureTensor_eq_neg`
(`Metric.lean`), `⟨R(u,v)w,z⟩=−⟨w,R(u,v)z⟩` for a smooth metric-compatible connection
on a finite-rank bundle with a C² fibre metric;
`CovariantDerivative.IsMetricCompatible.inner_curvatureTensor_swap_pairs`
(`Bianchi.lean`), pair interchange `⟨R(u,v)w,z⟩=⟨R(w,z)u,v⟩` for a metric-compatible
torsion-free connection on the tangent bundle;
`CovariantDerivative.covariantDerivative_curvatureOperator_cyclic_eq_zero`
(`SecondBianchi.lean`), the second Bianchi identity, the vanishing cyclic sum of
(∇_X R)(Y,Z)σ for a smooth connection on any vector bundle, differentiated with a
smooth torsion-free connection on the tangent bundle;
`CovariantDerivative.curvatureTensor_symm_trivializationAt` (`Coordinates.lean`), the
chart formula `R(a,c)w = dΓ(a)(w,c)−dΓ(c)(w,a)+Γ(Γ(w,c),a)−Γ(Γ(w,a),c)` through the
model-space Christoffel map Γ of the chart; `CovariantDerivative.contMDiff_curvatureTensorCLM`
(`Smoothness.lean`), the curvature tensor of a smooth connection is a smooth section
of the iterated hom bundle, with no metric or torsion hypothesis;
`CovariantDerivative.derivCurvatureTensor` (`Derivative.lean`), the pointwise tensor
`(∇_vR)(u,w)s`; `CovariantDerivative.derivRicciTensor_eq_trace` (`ContractedBianchi.lean`),
∇Ric is the trace of ∇R; and `CovariantDerivative.secondCovariantDerivative_sub_swap`
with `CovariantDerivative.secondCovariantDerivative_sub_swap_of_isTorsionFree`
(`SecondCovariantDerivative.lean`), the Ricci identity
`∇²s(u,v)−∇²s(v,u)=R(u,v)s−∇_(T(u,v))s` for a smooth section s, and its torsion-free
form `∇²s(u,v)−∇²s(v,u)=R(u,v)s`. In
`TauCeti/Geometry/Manifold/Riemannian/Isometry/LocallySymmetric.lean`,
`TauCeti.IsLocalRiemannianIsometry.mfderiv_derivCurvatureTensor`: a local Riemannian
isometry f satisfies `df_x((∇_vR)(u,w)s)=(∇_(df_x v)R)(df_x u,df_x w)(df_x s)` for the
two Levi-Civita connections.

For R1.2: `CovariantDerivative.HasParallelCurvature` in
`TauCeti/Geometry/Manifold/VectorBundle/CovariantDerivative/Curvature/LocallySymmetric.lean`,
∇R=0 at every point for a smooth connection on the tangent bundle, the torsion
unrestricted, and in the same file
`CovariantDerivative.HasConstantSectionalCurvature.hasParallelCurvature`, a
metric-compatible torsion-free connection of constant sectional curvature has
parallel curvature; `TauCeti.IsLocalRiemannianIsometry.hasParallelCurvature` in
`TauCeti/Geometry/Manifold/Riemannian/Isometry/LocallySymmetric.lean`, parallel
curvature of the target pulls back to the source of a local Riemannian isometry; and
`Bundle.ContMDiffRiemannianMetric.isLocalRiemannianIsometry_restrictOpenTangentSpace`
in `TauCeti/Geometry/Manifold/Riemannian/Isometry/Restriction.lean`, the inclusion of
an open submanifold with the restricted metric is a local Riemannian isometry.

For R1.3, in `TauCeti/Geometry/Manifold/Riemannian/Scaling.lean`, for a smooth metric g
and a constant c>0: `Bundle.ContMDiffRiemannianMetric.leviCivitaConnection_rescale_const_apply`,
the Levi-Civita connections of cg and g agree on every vector field differentiable at
the point; `Bundle.ContMDiffRiemannianMetric.ricciTensor_leviCivitaConnection_rescale_const`,
the two Ricci tensors agree; `Bundle.ContMDiffRiemannianMetric.scalarCurvature_rescale_const`,
Scal(cg)=c⁻¹Scal(g); and
`Bundle.ContMDiffRiemannianMetric.sectionalCurvature_leviCivitaConnection_rescale_const`,
K(cg)=c⁻¹K(g) on every pair of tangent vectors. In
`TauCeti/Geometry/Manifold/VectorBundle/CovariantDerivative/`, for the product of two
smooth metrics on M×N: `TauCeti.Manifold.tangentSpaceProdEquiv_leviCivitaConnection_prodVectorField`
(`LeviCivita/Prod.lean`), the product connection acts factor by factor on product
fields; `TauCeti.Manifold.tangentSpaceProdEquiv_curvatureTensor_leviCivitaConnection_prod`,
`TauCeti.Manifold.ricciTensor_leviCivitaConnection_prod` and
`TauCeti.Manifold.scalarCurvature_leviCivitaConnection_prod` (`Curvature/Prod.lean`),
the product curvature tensor is the product of the factor tensors, and the Ricci and
scalar curvatures are the sums of those of the factors; and
`TauCeti.Manifold.IsWarpedProduct.tangentSpaceProdEquiv_leviCivitaConnection_prodVectorField`
(`LeviCivita/WarpedProd.lean`), the Levi-Civita connection of the warped product
`g_M+f²g_N` on a product field (Y₁,Y₂) in the direction (u₁,u₂) at (x,y),
`(∇_(u₁)Y₁−f⟨u₂,Y₂⟩grad f, ∇_(u₂)Y₂+(df(u₁)/f)Y₂+(df(Y₁)/f)u₂)` with f, df and
grad f taken at x. Naturality of the Levi-Civita connection under a local Riemannian
isometry, `df_x(∇_v f*Y)=∇_(df_x v)Y`, is
`TauCeti.IsLocalRiemannianIsometry.mfderiv_leviCivitaConnection_mpullback` in
`TauCeti/Geometry/Manifold/Riemannian/Isometry/LeviCivita.lean`.

For R2, in `TauCeti/Geometry/Manifold/Riemannian/Jacobi/`: the Jacobi predicate
`TauCeti.Manifold.IsJacobiFieldOn` (`Basic.lean`), a C² section of γ*TM along a
geodesic on a parameter set satisfying `D_t²J+R(J,γ′)γ′=0`, with no boundaryless
hypothesis, and its constant Wronskian `wronskian_eq` (`Basic.lean`);
`eq_of_eq_of_alongCurveWithin_eq` (`Uniqueness.lean`), two Jacobi fields on a
preconnected parameter set with equal value and covariant derivative at one
parameter agree on that set; `TauCeti.Manifold.IsGeodesicCurveOn.contMDiffOn_infty`
(`TauCeti/Geometry/Manifold/Riemannian/Geodesic/Smoothness.lean`), a geodesic of a
smooth metric on a boundaryless manifold, required only to be C², is C^∞ on its
whole parameter set when that set has unique derivatives, a nondegenerate closed
interval up to its endpoints included;
`eq_zero_of_endpoints_eq_zero_of_sectionalCurvature_nonpos` (`Convexity.lean`),
under nonpositive sectional curvature on independent pairs along γ, a Jacobi
field vanishing at two distinct parameters of a preconnected parameter set
vanishes on it; `TauCeti.Manifold.jacobiFieldSpace` and `finrank_jacobiFieldSpace_le`
(`Space.lean`), the solution space and its dimension bound 2n;
in `Conjugate.lean`, `TauCeti.Manifold.IsConjugateOn`, two distinct parameters
of the set at which a Jacobi field nonzero somewhere on the set vanishes,
`TauCeti.Manifold.conjugateMultiplicity`, the dimension of the Jacobi fields
vanishing at both parameters, `TauCeti.Manifold.conjugateMultiplicity_pos_iff`,
the multiplicity is positive exactly at conjugate parameters of a preconnected set,
`TauCeti.Manifold.conjugateMultiplicity_le`, it is at most n−1 when the velocity at
the initial parameter is nonzero, and
`TauCeti.Manifold.not_isConjugateOn_of_sectionalCurvature_nonpos`, no conjugate
parameters under nonpositive sectional curvature; and
`exists_eq_curvatureCosine_smul_add_curvatureSine_smul` (`Model.lean`), the normal
Jacobi fields in constant curvature κ as model cosine and sine multiples of
parallel fields. `TauCeti.Manifold.IsKillingField` restricts to a Jacobi field along every
geodesic (`TauCeti/Geometry/Manifold/Riemannian/Killing.lean`), and
`Jacobi/Exponential.lean` proves that t↦d(exp_p)_(tv)(tw) is a Jacobi field along
the radial geodesic; its `TauCeti.Manifold.IsJacobiFieldOn.eq_mfderiv_riemannianExp`
gives the converse: a Jacobi field X along t↦exp_p(tv) on a preconnected parameter
set containing 0 inside the maximal geodesic interval of v, with X(0)=0 and
D_tX(0)=w, is X(t)=d(exp_p)_(tv)(tw) there, with no completeness hypothesis.
`TauCeti.Manifold.inner_mfderiv_riemannianExp_radial`
(`TauCeti/Geometry/Manifold/Riemannian/Geodesic/Gauss/Basic.lean`) is the Gauss
lemma `⟨d exp_v(v),d exp_v(w)⟩=⟨v,w⟩` for v in `expDomain` at p, on a boundaryless
Hausdorff manifold.

For covariant differentiation along curves (R2, R3), in
`TauCeti/Geometry/Manifold/VectorBundle/CovariantDerivative/AlongCurve/`, for a
connection on the tangent bundle of a finite-dimensional C² manifold over a complete
nontrivially normed field: `CovariantDerivative.contMDiffOn_alongCurveWithin`
(`Regularity.lean`), when the connection is C^k on every chart trivialization base set
and the section lift t↦(γ(t),X(t)) is C^(k+1) on a `UniqueDiffOn` parameter set s, the
lift of D_tX is C^k on s, the section X being arbitrary and not required to extend to a
vector field; `CovariantDerivative.eventuallyEq_sectionCoord_alongCurveWithin`
(`Regularity.lean`), near a parameter of s where that lift is C¹ and γ lies in the base
set of a fixed chart, the reading of D_tX in that chart is the fixed-chart formula, the
derivative of the coordinates of X plus the Christoffel contraction of X with the
velocity; `CovariantDerivative.symmL_alongCurveInChartWithin` (`Chart.lean`), chart
independence of that formula, for a curve and field differentiable within s at a point of
unique derivatives; and `CovariantDerivative.alongCurveWithin_comp` (`Basic.lean`), the
reparametrization law `D_t(X∘φ)(t)=φ′(t)·(D_tX)(φ(t))` for φ differentiable within s′ at t
and mapping s′ into s, the curve and field reading differentiably at φ(t). In
`TauCeti/Geometry/Manifold/VectorBundle/CovariantDerivative/Curvature/Surface.lean`,
`CovariantDerivative.alongCurve_alongCurve_sub_alongCurve_alongCurve`: for a smooth
connection on the tangent bundle of a smooth Hausdorff real manifold of finite dimension,
a parametrized surface f(q,r) and a field W along it whose lift
(q,r)↦(f(q,r),W(q,r)) is C² at (u,v), `D_qD_rW−D_rD_qW=R(∂_qf,∂_rf)W` at (u,v), with no
metric or torsion hypothesis; the derivatives are taken along the full parameter lines,
not within a parameter set. `TauCeti.Manifold.curveVelocityWithin` in
`TauCeti/Geometry/Manifold/MFDeriv/Curve.lean` is the velocity γ′(t) of a curve within a
parameter set s, the manifold derivative of γ within s at t applied to the unit vector, with
the junk value 0 where γ is not differentiable within s at t; the Jacobi equation, R3's
`indexForm` and the unit-speed hypotheses of R4.1 and R5a.3 read velocities through it.

For the H¹ paths of R3.1, in `TauCeti/Analysis/Sobolev/WeakDeriv/`, for u,u′:ℝ→F with F
a real normed space and a≤b: `TauCeti.HasWeakLineDerivOn` (`Basic.lean`), taken for
Lebesgue measure, the open set (a,b) and the direction 1, says that F is complete, that
u and u′ are locally integrable on (a,b) and that `∫φ′u=−∫φu′` for every smooth φ with
compact support in (a,b); `TauCeti.hasWeakLineDerivOn_Ioo_iff_exists_ae_eq_add_intervalIntegral`
(`Interval.lean`), for F complete, u′ locally integrable on (a,b) and t₀∈(a,b), u′ is
the weak derivative of u on (a,b) exactly when u is almost everywhere on (a,b) a
constant plus t↦∫_(t₀)^t u′; and, for u′ integrable on (a,b),
`TauCeti.HasWeakLineDerivOn.exists_continuousOn_ae_eq`, u has a representative v
continuous on [a,b], `TauCeti.HasWeakLineDerivOn.integral_eq_sub`, every such
representative satisfies `∫_s^t u′=v(t)−v(s)` for s,t∈[a,b], and
`TauCeti.HasWeakLineDerivOn.absolutelyContinuousOnInterval` and
`TauCeti.HasWeakLineDerivOn.ae_hasDerivAt`, every such representative is absolutely
continuous on [a,b] with classical derivative u′(t) at almost every t∈(a,b]. In
`TauCeti/MeasureTheory/Integral/IntervalIntegral/AbsolutelyContinuousFun.lean`, for a
curve γ absolutely continuous on [a,b] in a finite-dimensional real normed space with
derivative V(t) at almost every t∈(a,b]:
`AbsolutelyContinuousOnInterval.intervalIntegrable_of_ae_hasDerivAt`, V is integrable on
[a,b], and `AbsolutelyContinuousOnInterval.integral_eq_sub_of_ae_hasDerivAt`,
`∫_a^b V=γ(b)−γ(a)`. Applied on the subintervals [t₀,t] (Mathlib's
`AbsolutelyContinuousOnInterval.mono`) and combined with the preceding equivalence, they
make V the weak derivative of γ on (a,b). `AbsolutelyContinuousOnInterval.comp_of_contDiffAt`
(`TauCeti/MeasureTheory/Function/AbsolutelyContinuous/Comp.lean`): for a curve γ
absolutely continuous on [a,b] in a real normed space and a map φ into a real normed
space that is C¹ at every point of γ([a,b]), φ∘γ is absolutely continuous on [a,b]. In
`TauCeti/Geometry/Manifold/Riemannian/Geodesic/Exponential.lean`, for a smooth
boundaryless Hausdorff manifold modelled on a finite-dimensional real normed space with
a smooth Riemannian metric: `TauCeti.Manifold.isOpen_setOfPred_mem_expDomain`, the
tangent vectors z∈T_xM lying in `expDomain` at x form an open subset of TM, and
`TauCeti.Manifold.contMDiffOn_riemannianExp_tangentBundle`, z↦exp_x(z) is C^∞ on that
subset.

For §2.2, in `TauCeti/Geometry/Manifold/Riemannian/Geodesic/Normal/Coordinates.lean`,
for a normal domain U at p: `TauCeti.Manifold.normalCoordinateField`, the field X_w
whose value at exp_p(v) is d(exp_p)_v(w), the coordinate field ∂_i when w=e_i;
`TauCeti.Manifold.IsNormalDomain.leviCivitaConnection_normalCoordinateField_self`,
∇X_w=0 at p, the vanishing of the Christoffel symbols of normal coordinates at the
centre; and `TauCeti.Manifold.IsNormalDomain.mfderiv_inner_normalCoordinateField_self`,
the first derivatives of q↦⟨X_(w₁)(q),X_(w₂)(q)⟩ vanish at p.

For R4.1, `TauCeti.curvatureSine` and `TauCeti.curvatureCosine` in
`TauCeti/Analysis/SpecialFunctions/Trigonometric/Curvature.lean` are the solutions
of y″+κy=0 with initial data (0,1) and (1,0), for every sign of κ, with their
derivatives and smoothness.

For R4.3, `Bundle.ContMDiffRiemannianMetric.pullback` and
`Bundle.ContMDiffRiemannianMetric.pullback_inner` in
`TauCeti/Geometry/Manifold/Riemannian/Pullback/Basic.lean`: the C^n metric
(v,w)↦g(df(v),df(w)) pulled back along a C^(n+1) map with injective differential,
in particular along a local diffeomorphism. In
`TauCeti/Geometry/Manifold/Instances/UniversalCover.lean`, for a locally
path-connected, semilocally simply connected charted space X:
`TauCeti.UniversalCover.instChartedSpace` and `TauCeti.UniversalCover.instIsManifold`,
the charts of X pulled back along the based-path universal cover, a C^n manifold
when X is one, and `TauCeti.UniversalCover.isLocalDiffeomorph_proj`, the projection
is a C^n local diffeomorphism. `TauCeti.UniversalCover.fiberEquivFundamentalGroup`
in `TauCeti/AlgebraicTopology/UniversalCover/Basic.lean` is the bijection, not a
group isomorphism, of the basepoint fibre with the fundamental group, and
`TauCeti.UniversalCover.finite_fundamentalGroup_of_compactSpace` in
`TauCeti/AlgebraicTopology/UniversalCover/Compact.lean` gives a finite fundamental
group when the universal cover of a space with closed points is compact.

For R4.4, `TauCeti.Manifold.norm_le_norm_mfderiv_riemannianExp_of_sectionalCurvature_nonpos`
in `TauCeti/Geometry/Manifold/Riemannian/Jacobi/Comparison.lean`: on a boundaryless
manifold, for v in `expDomain` at p with nonpositive sectional curvature at every
point of the radial segment t↦exp_p(tv), 0≤t≤1, every w∈T_pM has
`|w|≤|d(exp_p)_v(w)|`; completeness, unit speed and orthogonality are not assumed.

For R4.6, `TauCeti.Orientable` in `TauCeti/Geometry/Manifold/Orientation/Basic.lean`: the
class asserting that a manifold with corners carries a manifold orientation, an orientation
of its tangent spaces compatible with the chart Jacobians; `synge` assumes it and
`synge_orientable_of_odd` concludes it.

For R4.7, `TauCeti.instIsManifoldQuotient` and `TauCeti.isLocalDiffeomorph_quotientMk`
in `TauCeti/Geometry/Manifold/Instances/Quotient.lean`: the orbit space of a free
properly discontinuous action by C^n maps on a C^n manifold is a C^n manifold, and
the orbit projection is a C^n local diffeomorphism. In
`TauCeti/Geometry/Manifold/Riemannian/Pullback/Descent.lean`:
`Bundle.ContMDiffRiemannianMetric.quotient`, the smooth metric on the orbit space of
a free properly discontinuous smooth action by isometries of g, with
`Bundle.ContMDiffRiemannianMetric.quotient_inner_mfderiv`, its value on the images of
two tangent vectors is their g-inner product;
`Bundle.ContMDiffRiemannianMetric.isLocalRiemannianIsometry_descend`, the projection
is a local Riemannian isometry onto the descended metric; and
`Bundle.ContMDiffRiemannianMetric.scalarCurvature_quotient`, the descended metric has
the scalar curvature of g. For R4.3 and R4.7, in
`TauCeti/Geometry/Manifold/Riemannian/Isometry/Curvature.lean`, for a local Riemannian
isometry f between Hausdorff manifolds:
`TauCeti.IsLocalRiemannianIsometry.mfderiv_curvatureTensor`,
`df_x(R(u,v)w)=R(df_x u,df_x v)(df_x w)`;
`TauCeti.IsLocalRiemannianIsometry.sectionalCurvature_mfderiv` and
`TauCeti.IsLocalRiemannianIsometry.ricciTensor_mfderiv`, f preserves sectional and Ricci
curvature; and `TauCeti.IsLocalRiemannianIsometry.scalarCurvature_map`, likewise scalar
curvature.

For the R4.7 models, in `TauCeti/Geometry/Manifold/Riemannian/`:
`TauCeti.hasConstantSectionalCurvature_sphere` (`Sphere/Curvature.lean`), the round
unit sphere `TauCeti.sphereRoundMetric` (`Sphere/Basic.lean`) has constant sectional
curvature 1; `TauCeti.hasConstantSectionalCurvature_sphereRoundMetricOfRadius`
(`Sphere/Radius.lean`), the round metric of radius r>0 has constant sectional
curvature 1/r²; `TauCeti.UpperHalfSpace.hasConstantSectionalCurvature`
(`Hyperbolic/UpperHalfSpace/Curvature.lean`), the metric `(|dx|²+dt²)/t²` on the
upper half-space of E×ℝ has constant sectional curvature −1, for every
finite-dimensional E including E=0; `LinearIsometryEquiv.unitSphereIsomHom_surjective`
and `LinearIsometryEquiv.unitSphereIsomMulEquiv` (`Isometry/Sphere/Classification.lean`),
every Riemannian isometry of the round unit sphere of an (n+1)-dimensional inner-product
space is the restriction of a unique ambient linear isometry, n=0 included, so the
orthogonal group is its full isometry group; `TauCeti.RiemannianIsometry.affineIsometryMulEquiv`
and `TauCeti.RiemannianIsometry.stabilizerZeroMulEquiv` (`Isometry/Euclidean.lean`),
the Riemannian isometry group of a real inner-product space is its affine isometry
group and the isotropy group of the origin is its linear isometry group;
`TauCeti.UpperHalfSpace.exists_eq_similarity_or_exists_eq_inversion_mul_similarity`
(`Isometry/UpperHalfSpace.lean`), for finite-dimensional E every isometry of the
half-space model is a similarity `(x,t)↦(cAx+b,ct)` with c>0 and A a linear isometry,
or such a similarity followed by an inversion in a sphere centred on the boundary
hyperplane; and `TauCeti.RiemannianIsometry.ext_of_mfderiv_eq` (`Isometry/Ext.lean`),
two Riemannian isometries of a preconnected boundaryless Hausdorff smooth Riemannian
manifold with the same value and differential at one point are equal.

For the round-sphere connection of R4.7 and the flat-ambient case of R5a,
`CovariantDerivative.IsLeviCivitaConnection.inner_apply_eq_inner_mvfderiv` in
`TauCeti/Geometry/Manifold/VectorBundle/CovariantDerivative/LeviCivita/Immersion.lean`
is the Gauss formula: for a Levi-Civita connection ∇ of a C¹ metric on a C² manifold M
and a map f:M→F into a real inner-product space that is C² at x and whose differential
preserves inner products at every point, `⟨∇_X Y,w⟩=⟨D_X(df Y),df w⟩` for vector fields
X,Y differentiable at x and every w∈T_xM, where D_X(df Y) is the ambient derivative of
y↦df_y(Y(y)); so df_x(∇_X Y) is the orthogonal projection of D_X(df Y) onto the range of
df_x. The round metric is the ambient inner product on the images under the inclusion
(`TauCeti.inner_tangentSpace_sphere` in `TauCeti/Geometry/Manifold/Riemannian/Sphere/Basic.lean`),
so the formula applies to Sⁿ→ℝⁿ⁺¹. In
`TauCeti/Geometry/Manifold/Riemannian/Sphere/Stereographic.lean`,
`TauCeti.inner_mfderiv_stereographic'_symm`: for a unit vector v of an (n+1)-dimensional
real inner-product space, the round metric pulled back along the inverse of Mathlib's
stereographic chart `stereographic' n v` is `(4/(|y|²+4))²` times the Euclidean inner
product at y∈ℝⁿ. That chart projects from v onto the hyperplane orthogonal to v through
−v, so the equatorial coordinate is x=y/2 and the coefficient becomes `4/(1+|x|²)²`.

For the coordinate calculations of R5a.2 and the Euclidean focal geometry of R6, in
`TauCeti/Analysis/InnerProductSpace/`, for a map i:V→E from a finite-dimensional real
normed space into a real inner-product space: `TauCeti.secondFundamentalForm`
(`SecondFundamentalForm.lean`), B(v,w) the component of D²i(x)(v,w) orthogonal to the
range of Di(x), symmetric when i is C² at x (`ContDiffAt.secondFundamentalForm_apply_comm`)
and unchanged, up to the derivative of the reparametrization, under precomposition with a
map C² at the point whose derivative is surjective (`ContDiffAt.secondFundamentalForm_comp`);
`TauCeti.shapeOperator` (`ShapeOperator.lean`), for injective Di(x) the endomorphism S_ν of
V with `⟨Di(S_ν v),Di w⟩=⟨ν,B(v,w)⟩` (`TauCeti.inner_fderiv_shapeOperator_apply`), and 0
otherwise, self-adjoint for the induced metric when i is C² at x
(`ContDiffAt.inner_fderiv_shapeOperator_apply_comm`); in `SquaredDistance.lean`,
`TauCeti.fderiv_norm_sq_sub_comp_eq_zero_iff`, the function h_a(y)=|i(y)−a|² is critical at
x exactly when i(x)−a is orthogonal to the range of Di(x), for i differentiable at x, and
`TauCeti.fderiv_fderiv_norm_sq_sub_comp_apply`, its Hessian at x is
`2(⟨Di v,Di w⟩+⟨i(x)−a,D²i(x)(v,w)⟩)` for i C² at x; and in `ShapeOperator.lean`, for i C²
at x with Di(x) injective, `TauCeti.fderiv_fderiv_norm_sq_sub_comp_apply_eq_inner_shapeOperator`,
when i(x)−a is normal that Hessian is `2⟨Di((1−S_(a−i(x)))v),Di w⟩`, and
`TauCeti.ker_fderiv_fderiv_norm_sq_sub_add_smul_comp`, for a normal ν and t≠0 its kernel at
a=i(x)+tν is the t⁻¹-eigenspace of S_ν. These concern one parametrization on a vector
space; R5a and R6 own the manifold forms and the comparison with R5a's intrinsic B and S.

For R5a.3, the R4.3 contract's `Bundle.ContMDiffRiemannianMetric.pullback` and
`Bundle.ContMDiffRiemannianMetric.pullback_inner`, applied along the exponential map at
the paraboloid vertex, whose differential is injective everywhere;
`TauCeti.isLocalDiffeomorph_of_mfderiv_eq` in
`TauCeti/Geometry/Manifold/LocalDiffeomorph/Basic.lean`, the inverse function theorem:
a C^n map (1≤n) from a boundaryless manifold whose differential is a continuous linear
equivalence at every point is a C^n local diffeomorphism; and `IsCoveringMap.injective`
in `TauCeti/Topology/Homotopy/Covering.lean`: a covering map from a path-connected space
onto a simply connected space is injective.

For R5b, in `TauCeti/Analysis/InnerProductSpace/Variational/`, for a bounded coercive
bilinear form B on a real Hilbert space V and a continuous linear map J:V→H into a real
inner-product space: `IsCoercive.formSolutionMap` (`Spectrum.lean`), the Lax–Milgram
solution map H→V sending h to the unique u with B(u,v)=⟨h,Jv⟩ for every v
(`IsCoercive.apply_formSolutionMap`, `IsCoercive.eq_formSolutionMap`);
`IsCoercive.formSolutionOperator`, the composite S of J with that map, an operator H→H,
compact when J is (`IsCoercive.isCompactOperator_formSolutionOperator`), symmetric when B
is (`IsCoercive.isSymmetric_formSolutionOperator`), with nonnegative quadratic form
(`IsCoercive.inner_formSolutionOperator_self_nonneg`) and kernel the orthogonal complement
of the range of J (`IsCoercive.ker_formSolutionOperator`);
`IsCoercive.exists_hilbertBasis_forall_apply_eq_smul_inner`, for H complete, J compact
with dense range and B symmetric, a Hilbert basis of H of vectors Ju with
B(u,v)=κ⟨Ju,Jv⟩ for every v and κ>0, in which S is diagonal with eigenvalues κ⁻¹; and
`IsCoercive.isLeast_rayleighQuotient` (`Rayleigh.lean`), for J compact and nonzero and B
symmetric, ‖S‖⁻¹ is the least value of B(v,v)/‖Jv‖² over the v with Jv≠0. These rest on
Mathlib's Lax–Milgram equivalence `IsCoercive.continuousLinearEquivOfBilin` in
`Mathlib/Analysis/InnerProductSpace/LaxMilgram.lean`.

For R5c: `TauCeti.IsRegularValue` in `TauCeti/Geometry/Manifold/RegularValue.lean`, every
point of the level a point where the manifold derivative is surjective, for the defining
functions of item 3; `TauCeti.Manifold.laplaceBeltrami_eq_sum_hessian` in
`TauCeti/Geometry/Manifold/Riemannian/Laplacian.lean`, Δf(x) is the sum of the values
Hess f(e_i,e_i) of the scalar Hessian over every orthonormal basis (e_i) of T_xM; in
`TauCeti/Geometry/Manifold/Riemannian/DivergenceTheorem.lean`, on a boundaryless manifold
and for f of compact support, Green's first identity
`TauCeti.Manifold.integral_mul_laplaceBeltrami`, `∫fΔg=−∫⟨grad f,grad g⟩` for f of class C¹
and g of class C², and Green's second identity
`TauCeti.Manifold.integral_mul_laplaceBeltrami_right_eq_left`, `∫fΔg=∫(Δf)g` for f and g of
class C²; in `TauCeti/Analysis/Sobolev/W1p/`, for an open subset Ω of a finite-dimensional
real inner-product space and 1≤p<∞: `TauCeti.W1p.posPartAbove` (`ChainRule.lean`), the
truncation (u−k)⁺ of u∈W^(1,p)(Ω) at a level k≥0, again in W^(1,p)(Ω), with weak gradient
`1_(u>k)∇u`, whose level-0 case is the positive part `TauCeti.W1p.posPart`;
`TauCeti.W1p.posPart_mem_w1p0Submodule` (`Truncation.lean`), u⁺ lies in W^(1,p)₀(Ω) when u
does; and `TauCeti.W1p0.extendByZeroL` (`Extension.lean`), extension by zero as a continuous
linear map W^(1,p)₀(Ω)→W^(1,p)₀(Ω′) for Ω⊂Ω′, preserving the norms of the value and of the
gradient; and, in `Spectrum.lean` of the R5b paragraph,
`IsCoercive.finiteDimensional_eigenspace_formSolutionOperator`: for J compact, the
eigenspaces of S at nonzero eigenvalues are finite-dimensional.

For R6, `TauCeti.ae_forall_isManifoldNondegenerateCriticalPoint_norm_sq_sub_comp` in
`TauCeti/Geometry/Manifold/Morse/SquaredDistance.lean`: for a C² map i:M→V with
injective differential from a second-countable boundaryless C² manifold modelled on
a finite-dimensional space into a finite-dimensional real inner-product space, for
almost every a∈V for every Haar measure, every critical point of `x↦|i(x)−a|²` is
nondegenerate; `TauCeti.ae_isMorse_norm_sq_sub_comp`, for a smooth such i this
function is `TauCeti.IsMorse` for almost every a; and
`TauCeti.isProperMap_norm_sq_sub_comp` in
`TauCeti/Topology/Maps/Proper/Metric.lean`: along a closed embedding of a
topological space into a proper normed group, `x↦|i(x)−a|²` is a proper map for
every a. Neither genericity statement needs closedness of i.

For the normal exponential of R6, in `TauCeti/Geometry/Manifold/TubularNeighborhood/Riemannian/`,
for a C^n embedding f:M→N (n≠0) into a smooth boundaryless Hausdorff manifold with a
smooth Riemannian metric, on the total space of Tau Ceti's intrinsic quotient normal
bundle: `TauCeti.SmoothEmbedding.normalExpDomain` (`Basic.lean`), the normal classes whose
orthogonal representatives lie in `expDomain` at f(p), which contains the zero section
and is star-shaped in each fibre; `TauCeti.SmoothEmbedding.normalExp` (`Basic.lean`), the
ambient exponential of the orthogonal representative;
`TauCeti.SmoothEmbedding.isOpen_normalExpDomain` and
`TauCeti.SmoothEmbedding.contMDiffOn_normalExp` (`Regularity.lean`), for a
finite-dimensional source the domain is open and the map is C^m on it when m+1≤n; and
`TauCeti.SmoothEmbedding.mfderiv_normalExp_zeroSection_apply` (`Differential.lean`), for
n≥2 its differential at the zero section is (u,v)↦df(u)+v, v read as its orthogonal
representative.

For R7.6 and R7.7, `TauCeti.deRhamCohomology` in
`TauCeti/Geometry/Manifold/DeRham/Basic.lean`: the cohomology of the complex of
smooth real differential forms of a C² manifold under the exterior derivative,
Mathlib's categorical homology, with its class map from closed forms; b_p is its
dimension in degree p. The curvature operator is
`CovariantDerivative.curvatureEndomorphism` (the R1 contract above).

For R7.0, in `TauCeti/Geometry/Manifold/Riemannian/`:
`TauCeti.Manifold.laplaceBeltrami` (`Laplacian.lean`), Δ=div grad on functions;
`TauCeti.Manifold.laplaceBeltrami_norm_sq_mgradient` (`Bochner.lean`), for smooth f
and an orthonormal basis (e_i) of T_xM,
`Δ|grad f|²=2Σ_(i,j)Hess f(e_i,e_j)²+2 d(Δf)(grad f)+2 Ric(grad f,grad f)`;
`TauCeti.Manifold.finrank_mul_le_of_laplaceBeltrami_eq_neg_mul` (`Lichnerowicz.lean`),
on a compact boundaryless manifold of dimension n≥2 with Ric≥(n−1)k g for a real k,
every λ>0 with a nonzero smooth f satisfying Δf=−λf has nk≤λ.

For R8.1, in `TauCeti/RingTheory/MvPolynomial/Harmonic.lean`, over a field of
characteristic zero with a nonempty finite set of variables: `MvPolynomial.laplacian`
(Σᵢ∂ᵢ²), `MvPolynomial.normSq` (ΣᵢXᵢ²), `MvPolynomial.harmonicSubmodule` (the
harmonic homogeneous polynomials H_d), the Fischer decomposition
`MvPolynomial.harmonicSubmodule_sup_map_mulLeft_normSq` with
`MvPolynomial.disjoint_ker_laplacian_map_mulLeft_normSq` (P_(e+2)=H_(e+2)⊕r²P_e),
its iteration `MvPolynomial.homogeneousSubmodule_eq_iSup_map_mulLeft_normSq_pow`
(P_d is the sum of the r^(2k)H_(d−2k) for k≤d/2), and the dimension formula
`MvPolynomial.finrank_harmonicSubmodule_add_finrank`
(dim H_(e+2)+dim P_e=dim P_(e+2)); `MvPolynomial.harmonicRep` in
`TauCeti/RingTheory/MvPolynomial/Harmonic/Orthogonal.lean`, the action
(g·p)(x)=p(g⁻¹x) of the orthogonal group on H_d; and
`MvPolynomial.harmonicSphereRestriction_injective` in
`TauCeti/Analysis/MvPolynomial/Sphere.lean`, injectivity of restriction of real
harmonic homogeneous polynomials to the unit sphere. For R8.2,
`MvPolynomial.harmonicSphereRestriction` in the same file, the real-linear map sending
a real harmonic homogeneous polynomial of degree d in the variables σ to its
restriction, a continuous function on the unit sphere of `EuclideanSpace ℝ σ`; the
round metric `TauCeti.sphereRoundMetric` with its `RiemannianBundle` instance
(`TauCeti/Geometry/Manifold/Riemannian/Sphere/Basic.lean`); and
`TauCeti.Manifold.laplaceBeltrami` (the R7.0 contract).

For R8.3, in `TauCeti/RepresentationTheory/ClassicalGroups/WeylDimension/`, for a Young
diagram μ read through its first r rows, indexed from i=0: `TauCeti.oddOrthogonalWeylDimension`
(`OddOrthogonal.lean`), the type-Bᵣ Weyl product `∏ lᵢ/rᵢ·∏_(i<j)(lᵢ²−lⱼ²)/(rᵢ²−rⱼ²)` with
lᵢ=μᵢ+r−i−½ and rᵢ=r−i−½, as a natural number, and
`TauCeti.evenOrthogonalWeylDimension` (`EvenOrthogonal.lean`), the type-Dᵣ product
`∏_(i<j)(lᵢ²−lⱼ²)/(rᵢ²−rⱼ²)` with lᵢ=μᵢ+r−1−i and rᵢ=r−1−i; their one-row values
`TauCeti.oddOrthogonalWeylDimension_eq_choose_add_choose_of_colLen_le_one`, for SO(2n+3)
the value `binomial(d+2n+1,2n+1)+binomial(d+2n,2n+1)` on the row (d), and
`TauCeti.evenOrthogonalWeylDimension_eq_choose_add_choose_of_colLen_le_one`, for SO(2n+4)
the value `binomial(d+2n+2,2n+2)+binomial(d+2n+1,2n+2)`; and the rank-one and rank-two cases
`TauCeti.oddOrthogonalWeylDimension_one_eq_two_mul_rowLen_add_one` (2d+1 for SO(3)) and
`TauCeti.evenOrthogonalWeylDimension_two` ((λ₁−λ₂+1)(λ₁+λ₂+1) for SO(4)). These are numbers:
that they are dimensions of irreducible modules is ClassicalGroups Layer 5.

### From the named roadmaps

The following contracts specify each supplier and section consumed.

- [HopfRinow](../../Completed/HopfRinow/README.md), Layers 0–4: the reconciled distance and
  piecewise smooth length, Levi-Civita existence/uniqueness/regularity, intrinsic
  covariant differentiation along curves, geodesic spray/flow, natural-domain
  `TauCeti.Manifold.riemannianExp`, normal balls/logarithms, Gauss lemma, first
  energy variation, minimizing geodesics, completeness and smooth-isometry
  transport. Use its existing `alongCurveWithin` carrier and proved chart-change laws;
  the arbitrary-section regularity, fixed-chart formula and reparametrization law
  needed for iterated covariant differentiation are Tau Ceti's (Tau Ceti contract).
- [DifferentialGeometry](../DifferentialGeometry/README.md), Layers 0–3, 5–9, 12:
  ordinary forms and exterior calculus, orientation, smooth flows,
  integration/Stokes, de Rham/singular comparison, metrics, gradient/Hessian,
  divergence and the canonical density/measure bridge. Sard's theorem is not
  consumed from it: every Sard application here is between manifolds of equal
  dimension and uses the pinned Tau Ceti theorem named in the Tau Ceti contract.
- [SmoothBundlesConnections](../SmoothBundlesConnections/README.md), B1.4–B1.5/B2–B5/B6.0:
  actual smooth pullback/tensor/dual/End bundles, metric connections and their
  induced derivatives, curvature, parallel transport/holonomy, and real/complex
  bundle L². B5.1 supplies the complete connection/transport inverse dictionary, including
  smooth families with varying endpoints, thin invariance and concatenation.
  Its uniqueness is on smooth local sections and differentiable germs; equality
  on arbitrary raw sections requires a common extension convention.
  B5.2 supplies countability of the fundamental group of a connected,
  second-countable, locally path-connected, locally simply connected space.
  B6.0 supplies uniform normal and strong-convexity radii on compact sets and
  the variable-base inverse-function theorem for `(x,v)↦(x,exp_x v)`.
- [GeometricTopology](../GeometricTopology/README.md), Layer 1: the actual normal
  bundle and tubular neighbourhood theorem; Layer 7: the existing intrinsic
  curvature construction and `TauCeti.riemannianVolume`. This roadmap extends
  their geometric identities and comparison theory. General immersions use the
  corresponding orthogonal subbundle of f*TN; for embeddings it is canonically
  the Layer 1 normal bundle, with the same induced topology. R5a constructs the smooth orthogonal-complement-to-quotient
  comparison on this supplied normal bundle.
  Layer 8 owns the eight three-dimensional model geometries; R4.7 compares its
  constant-curvature models with their native `ModelGeometry.Space` instances.
  Its smooth-triangulation theorem (Whitehead: every smooth manifold admits a
  smooth triangulation) supplies smooth triangulation.
  R3.2 constructs the finite marked-point refinement and its marked-pair identification.
  R5c uses the smooth collars of §1.1 and the gluing along the boundary of §1.3.
- [ComplexKahlerGeometry](../ComplexKahlerGeometry/README.md), K5a: real/complex
  bundle Sobolev/Rellich, distributional regularity and global estimates for
  smooth Laplace-type systems, the formal-adjoint L² comparison, compact resolvent, Green operator,
  real de Rham Hodge theorem and harmonic representatives. This roadmap owns
  curvature identities and their geometric consequences, not another Hodge or
  bundle L² construction. [PDE](../PDE/README.md) supplies scalar weak-derivative,
  extension and elliptic estimates through K5a. The vector-valued
  interval weak-derivative/absolutely-continuous comparison needed for paths is Tau
  Ceti's (Tau Ceti contract, R3.1 paragraph). K7.1 supplies
  the smooth complex projective carrier used by R1.
- [PseudodifferentialOperators](../PseudodifferentialOperators/README.md), P1.0:
  smooth section differential operators with their order filtration, finite jets
  and truncations, the equivalent iterated-commutator order, geometric and Fourier
  principal symbols with the composition and adjoint symbol formulas, density
  transposes and metric formal adjoints. Consume its negative-trace connection
  Laplacian, its identification with ∇*∇ and compact-support energy identity for
  a metric connection and the canonical density, its Laplace-type predicate with
  leading scale c>0, and its unique canonical Bochner connection and zeroth-order
  remainder. The canonical connection is metric, and the remainder fibrewise
  self-adjoint, for an operator formally self-adjoint with respect to the
  canonical Riemannian density and the chosen fibre metrics. Of P1.0's
  Dirac-type theorem only the case D:E→E is assumed; R7.3 derives the
  D:E→F case from the composition and adjoint symbol formulas. R5b's normal
  Jacobi operator and R7's geometric operators are P1.0 differential operators.
- [PDE A1–A6, C13, D16–D19, E20–E22](../PDE/README.md): Sobolev, trace and
  energy/interior estimates for R5b's Dirichlet specialization to a bundle
  (E,∇,K), of which the normal Jacobi operator is a case; for R5c the
  agreement of W¹,² with the Bessel-potential scale (A3), the embeddings (A4),
  the trace kernel and extension operator (A6), the strong maximum principle
  for variable symmetric principal coefficients (C13) and the global
  `H^(k+2)` regularity of scalar operators (E20).
  R5b constructs its boundary H² estimate and exact operator domain; these are
  not supplied by closed-manifold K5a or PDE E's interior regularity theorem.
  The abstract coercive-form solution operator, its compactness, symmetry,
  eigenbasis and Rayleigh principle are Tau Ceti's (Tau Ceti contract, R5b
  paragraph); R5b constructs the self-adjoint operator its shifted form
  represents, its geometric form and its boundary-domain identification.
- [VariationalMethods](../VariationalMethods/README.md) 3.1, 4.1–4.4: compact
  form pairs, the ordered eigenbasis, expansions, Courant–Fischer and the
  counting function, at 𝕜=ℝ, for R5c.
- [GeneralizedCohomology G4.0b](../GeneralizedCohomology/README.md#g4-generalized-lerayhirsch-thom-and-euler-theory):
  smooth quaternionic projective and Stiefel carriers, the smooth Hopf
  quotient submersion and its classical homogeneous-space diffeomorphism.
  R1 equips these supplied carriers with its normalized metrics; this
  finite-dimensional smooth supplier uses no RiemannianGeometry result.
- [TopologicalKTheory T6.6](../TopologicalKTheory/README.md): the smooth
  classical homogeneous-space/Grassmannian comparison consumed by R1's
  projective examples, after the early G4.0b smooth carriers.
- [CharacteristicClasses C2.0](../CharacteristicClasses/README.md): relative
  bundle disc/sphere CW models and disc-attachment comparison consumed by R3.
- [ConformalMapping L3/L5](../../Completed/ConformalMapping/README.md) supplies the Riemann map/closed-disc Jordan correspondence and plane separation/filled-hull floor. [GeometricMeasureTheory G1/G6](../GeometricMeasureTheory/README.md) and [DifferentialGeometry 5.6](../DifferentialGeometry/README.md) supply rectifiable length/arclength, Jordan index, proximity/reparametrization and trace-area-zero comparisons. [GeometricMeasureTheory G3–G5](../GeometricMeasureTheory/README.md#g3--distributional-bv-and-variation-measures) supplies the generic BV/variation/perimeter floor; R4.9 constructs its spherical chart comparisons and symmetrization applications. R4.9 constructs the spherical component-cover, annular, round-regularization and finite-family shortening applications. [Isoperimetry I3/I6](../Isoperimetry/README.md#i6--full-planar-jordan-theorem-and-compatibility) supplies the Euclidean Jordan inequality for the normal-chart weak small-area application; R4.9 owns spherical symmetrization and the sharp spherical utility.
- [CharacteristicClasses C1.5/C2/C3](../CharacteristicClasses/README.md) supplies the ordinary finite RP²/cup/Thom comparisons used on the tautological disk bundle in R4.9; [AlgebraicTopology Stage 6](../AlgebraicTopology/README.md) supplies its absolute cup/relative cap, singular small-chain and homotopy APIs. R4.9 owns the direct relative cover cocycle on its curve space and the particular finite cycle/cap-localization adapters.
- Native Mathlib `Besicovitch.exist_disjoint_covering_families` and its finite-dimensional normed-real-space instance supply disjoint closed-ball color families and open-ball covering for R4.9's finite geometric parameter cutoffs. R4.9 constructs the finite extraction, cutoffs and geometric-operator estimates. Its principal shortening route is length-controlled round regularization followed by the actual-metric smooth flow, with its own finite-time blowup, local exit-cost and family-stopping applications.
- [SpinGeometry G1.2/G2.2/G3.4](../SpinGeometry/README.md): the finite Clifford
  module and exterior-symbol comparisons used by R7. These precede the later
  Spin Dirac/index targets and have no R7 analytic input.
- [AlgebraicTopology](../AlgebraicTopology/README.md), Stages 2,4–8, and
  [UniversalCovers](../../Completed/UniversalCovers/README.md): actual CW and
  relative homology, coefficient-sensitive Betti/Euler statements, duality,
  homotopy and covering results. AT4.4 supplies the raw reduced-suspension
  quotient and its normalized sphere homeomorphism; R3 constructs its curried
  based-loop map and homotopy-group suspension comparison. DGFloer Layer 1
  item 2 supplies the Hopf homotopy exact sequence and homology invariance
  under weak equivalence. Its standing Moore-path convention supplies the
  length-change carrier; R3 constructs the ordinary fixed-interval comparisons.
  R4 supplies its fundamental-class/weak-contractibility argument,
  and AT8.5 supplies Whitehead's CW comparison. AT8.11a supplies
  `finiteSourceMappingCWType`, `basedLoopCWType`, their fixed-interval/Kelley
  comparisons and the relative homotopy comparison for products with the interval;
  these complete contracts, rather than a new compact-generation construction,
  are the inputs to R3.
- [RepresentationTheory/LieGroups L0–L2](../RepresentationTheory/LieGroups/README.md):
  native Lie-group/manifold carriers, Ad and dAd=ad for the invariant metrics.
  SBC B1.4–B1.5 supplies smooth G/H, principal quotient bundles and the
  kernel/horizontal subbundles for the R1 submersion construction.
- [RepresentationTheory/ClassicalGroups](../RepresentationTheory/ClassicalGroups/README.md)
  Layers 3/5 and [CompactGroups](../RepresentationTheory/CompactGroups/README.md): complex orthogonal-group highest-weight/dimension targets, invariant
  products and complete reducibility. R8 constructs the harmonic-polynomial
  representation and identifies its complexification with the specific
  highest-weight module; it does not assume a supplied harmonic-tensor carrier.

The shared analytic order is that of the suppliers: PseudodifferentialOperators
P1.0 uses the bundle operations, metrics and connections of
SmoothBundlesConnections B2–B4, DifferentialGeometry's compact-support
integration and ComplexKahlerGeometry K5a's initial density bundle,
independently of K5a's distributional and Sobolev completions, which then
extend P1.0's fixed operators. R7's global
consequences consume K5a's real/complex Sobolev scales, weak H² realization,
compact resolvent and real de Rham Hodge theory. K5a applies in arbitrary real
base dimension and identifies real bundles with conjugation-fixed complexifications.

[MorseTheory M1–M6](../MorseTheory/README.md) owns ordinary Morse functions,
normal forms, compact-band deformation, cell attachments and abstract Morse–Bott
attachments and gradient convergence. [HeegaardFloer Lane M](../HeegaardFloer/README.md#lane-m-morse-homology-stage-0)
owns Morse–Smale trajectories and Morse homology.
R3 defines the single general complete-manifold finite broken-geodesic carrier
and path-sublevel comparison for any complete smooth metric. It needs no
Bott-chain construction beyond the abstract finite-dimensional Morse–Bott
theorem. MorseTheory M2 owns ordinary attachments and M5 owns the abstract
finite-dimensional Morse–Bott theorem.
[DGFloer](../DGFloer/README.md) consumes R2–R3 for generic Jacobi/index/path
geometry and owns free-loop extensions and CP/HP applications on the same
finite-vertex carriers and short-segment interpolation. R3 owns the round-sphere antipodal
Morse–Bott calculation below.

RicciFlow owns the differentiable sphere theorem and
Hamilton's three-dimensional positive-Ricci theorem. [AffineMorseLefschetz](../AffineMorseLefschetz/README.md)
owns the complex shape-operator and affine Lefschetz applications; it consumes
R5a/R6's real immersion/focal APIs. R3 owns the Morse proof and normalized
suspension-map comparison for sphere Freudenthal connectivity.

## How to read the build

The curvature and connection algebra in R1 supplies R2's Jacobi theory; R2 then
supplies the normal-coordinate jets labelled R1.4, on which the Euclidean
limits of rescaled metrics labelled R1.5 rest. R3 builds the finite index
and path-space theory, R4 the comparison and geodesic multiplicity results,
R5 immersion geometry and volume variations, and R6 their focal consequences.
R7 applies the supplied analytic theory to curvature identities and vanishing,
and R8 identifies the spherical harmonic representations and minimal eigenmaps.
The direct round model in R4.7 precedes the projective examples and does not
use the comparison or path-space theorems.

## Layer 1: curvature and connection algebra

### R1. Intrinsic curvature calculus and normal-coordinate jets

### 1.1 Curvature identities

1. Consume the existing pointwise curvature/sectional/Ricci/scalar carriers and
   their identities, all Tau Ceti's (supplier contract): the first Bianchi
   identity `CovariantDerivative.curvatureTensor_cyclic_eq_zero`, metric skew
   symmetry `CovariantDerivative.IsMetricCompatible.inner_curvatureTensor_eq_neg`,
   pair interchange `CovariantDerivative.IsMetricCompatible.inner_curvatureTensor_swap_pairs`,
   the second Bianchi identity
   `CovariantDerivative.covariantDerivative_curvatureOperator_cyclic_eq_zero`, the
   chart formula `CovariantDerivative.curvatureTensor_symm_trivializationAt`,
   smoothness of the tensor `CovariantDerivative.contMDiff_curvatureTensorCLM`,
   the tensor ∇R `CovariantDerivative.derivCurvatureTensor` with its contraction
   `CovariantDerivative.derivRicciTensor_eq_trace` and its naturality under local
   isometries `TauCeti.IsLocalRiemannianIsometry.mfderiv_derivCurvatureTensor`,
   and the Ricci identity `∇²s(X,Y)−∇²s(Y,X)=R(X,Y)s` with its torsion
   correction `−∇_(T(X,Y))s`
   (`CovariantDerivative.secondCovariantDerivative_sub_swap_of_isTorsionFree`,
   `CovariantDerivative.secondCovariantDerivative_sub_swap`). R1 owns what goes
   beyond them: the moving-frame form of R and ∇R through the connection 1-forms of
   a smooth local frame, skew-symmetric for an orthonormal frame, with the frame
   components smooth on the frame's domain.
   For End-valued curvature match SBC B4's covariant exterior derivative and
   `Ω=dω+½[ω∧ω]`, `d_∇Ω=0`, explaining the equivalent matrix
   `F=dA+A∧A` convention: section coefficients are columns and
   `∇s=ds+A s`, with matrix multiplication in the wedge. Include `(d_∇)²=R∧·`, the canonical tangent-valued
   identity 1-form/torsion comparison and the affine/skew-adjoint difference of
   metric connections as supplier acceptance checks.
2. Sectional curvature determines an algebraic Riemannian curvature tensor by
   an explicit polarization identity (Andrews, *Lectures on Differential
   Geometry*, Lecture 16, Proposition 16.2.1, p. 154), and constant sectional
   curvature κ is the identity `R(X,Y)Z=κ(⟨Z,Y⟩X−⟨Z,X⟩Y)`: both are Tau Ceti's
   `CovariantDerivative.hasConstantSectionalCurvature_iff_isConstantCurvatureTensor`
   (supplier contract), consumed here. In dimensions zero and one there are no
   two-planes, so every κ satisfies both sides; no κ is inferred there.
3. Schur's theorem (`CovariantDerivative.eq_of_forall_hasSectionalCurvatureAt`)
   on preconnected manifolds of dimension at least three, and Einstein's
   constancy theorem (`CovariantDerivative.eq_of_ricciTensor_eq_smul_inner`): if
   Ric_x(u,v)=a(x)g_x(u,v) for every x,u,v on a preconnected manifold of positive
   dimension other than two, then a is constant (Nicolaescu, *Lectures on the
   Geometry of Manifolds*, Exercise 4.2.38, p. 196, for dimension at least three,
   with a=Scal/n by Example 4.2.36, p. 195). Both are Tau Ceti's and consumed
   here. Local symmetry ∇R=0 is Tau Ceti's `CovariantDerivative.HasParallelCurvature`,
   and that constant sectional curvature implies it is
   `CovariantDerivative.HasConstantSectionalCurvature.hasParallelCurvature`
   (supplier contract). Prove that parallel transport preserves R exactly when
   this condition holds (§1.2), and consume Tau Ceti's
   `CovariantDerivative.hasParallelCurvature_iff_isLocallyConstant_scalarCurvature_of_finrank_eq_two`
   for surfaces: K is locally constant, hence constant on each connected surface.
   Flat curvature on an open set is equivalent
   to a local Euclidean isometry around every point of that set. For the flat
   implication use B5's local parallel frames, torsion-free closed coframes and
   DG's local primitives, then the shared manifold inverse-function theorem.
4. Pin the mixed form of the polarization in item 2. For the covariant
   four-tensor `r(x,y,z,w)=⟨R(x,y)z,w⟩`, Tau Ceti's
   `CovariantDerivative.riemannCurvatureTensor`, put `Q(x,y)=r(x,y,y,x)`. This
   numerator is defined for all vectors, including dependent pairs; on
   independent pairs it is sectional curvature times the Gram determinant.
   Prove

   ```
   B_Q(x,w;y,z) = Q(x+w,y+z) − Q(x+w,y−z)
                 − Q(x−w,y+z) + Q(x−w,y−z),
   24 r(x,y,z,w) = B_Q(x,w;y,z) − B_Q(y,w;x,z)
   ```

   for every four-linear form over a commutative ring that is skew in its first pair and in its last pair and
   satisfies the first Bianchi identity, the hypotheses of Tau Ceti's six-term
   identity `LinearMap.six_mul_apply_eq_of_cyclic_eq_zero`, and specialize it
   pointwise to `CovariantDerivative.riemannCurvatureTensor` of a
   metric-compatible torsion-free connection. Multilinearity alone gives
   `B_Q(x,w;y,z)=4(r(x,y,z,w)+r(w,y,z,x)+r(x,z,y,w)+r(w,z,y,x))`; the two skew
   symmetries, the first Bianchi identity and pair interchange in the form
   `2r(x,y,z,w)=2r(z,w,x,y)`, which holds over every commutative ring, then
   reduce the difference to `24r(x,y,z,w)`, the common factor 4 absorbing the 2.
   No inner product, orthonormality or independence enters. Reconstruction of r
   from Q, the vanishing of Q on dependent pairs and the reduction to
   independent pairs are Tau Ceti's (supplier contract) and are not reproved
   here. Andrews writes sectional curvature in the slot convention
   `K(σ)=R(e₁,e₂,e₁,e₂)`; translate his display into the convention above.

   **Checks.**
   - Orthonormal x,y in constant curvature +1, with z=y and w=x: here
     `Q(a,b)=|a|²|b|²−⟨a,b⟩²`, so `B_Q(x,x;y,y)=Q(2x,2y)=16` (the other
     three terms have a zero argument), while `B_Q(y,x;x,y)` has
     `Q(x+y,x+y)=0`, `Q(x+y,x−y)=4`, `Q(y−x,x+y)=4`, `Q(y−x,x−y)=0`, hence
     equals −8; the right side is `16−(−8)=24=24·r(x,y,y,x)` with K=1. A
     formula with the two B_Q terms interchanged, or with the constant 12
     or 48, fails on this pair.
   - Dependent pairs: `Q(x,λx)=λ²r(x,x,x,x)=0` by skew symmetry, so the
     formula is evaluated on dependent arguments without any division; the
     numerator `⟨R(x,y)x,y⟩=r(x,y,x,y)` of the opposite slot order gives
     `−K` on orthonormal pairs, the wrong sign.
   - Without the first Bianchi identity the formula is false: for a
     nondegenerate skew form ω on ℝ⁴ with `ω(e₁,e₂)=ω(e₃,e₄)=1` and all
     other basis pairs zero, `r(x,y,z,w)=ω(x,y)ω(z,w)` is skew in each pair
     and symmetric under pair interchange, with `Q(x,y)=−ω(x,y)²`; at
     `(e₁,e₂,e₃,e₄)` the right side is `8−(−8)=16` while
     `24·r(e₁,e₂,e₃,e₄)=24`.

   *Needs:* Tau Ceti's six-term polarization identity and
   `CovariantDerivative.riemannCurvatureTensor` with its skew symmetries and
   first Bianchi identity (supplier contract); item 2; Mathlib iterated linear
   maps over a commutative ring.

### 1.2 Local symmetry and the Einstein factor

The local-symmetry predicate ∇R=0 is Tau Ceti's `CovariantDerivative.HasParallelCurvature`
(supplier contract). Its pullback along a local Riemannian isometry is
`TauCeti.IsLocalRiemannianIsometry.hasParallelCurvature`; restriction to an open
submanifold is the case of the inclusion, a local Riemannian isometry by
`Bundle.ContMDiffRiemannianMetric.isLocalRiemannianIsometry_restrictOpenTangentSpace`.
Both are consumed here. This roadmap owns the parallel-transport characterization
along every smooth path and the flat ⇔ locally Euclidean equivalence of §1.1
item 3. The parallel-transport
characterization is the general statement that a tensor field is parallel
exactly when every parallel transport preserves it, proved from the
along-curve derivative of SmoothBundlesConnections B5.0 applied to R: parallel
transport along a path solves the linear initial-value problem `∇_(d/dt)u=0`, so
the restriction of a section to a path is the transport of its initial value
exactly when its covariant derivative along the path vanishes, by uniqueness for
that problem (Nicolaescu, *Lectures on the Geometry of Manifolds*, §3.3.2,
equation (3.3.7), pp. 103–104). The
dimension-two statement is Tau Ceti's
`CovariantDerivative.hasParallelCurvature_iff_isLocallyConstant_scalarCurvature_of_finrank_eq_two`
(supplier contract), which writes R in the constant-curvature form of §1.1
item 2 with κ=K(x)=Scal(x)/2.

**Checks.**

- Euclidean space has R=0 and ∇R=0; the zero-dimensional case also satisfies
  the predicate, without determining a sectional-curvature parameter.
- The unit sphere has R=g∧g and ∇R=0 because ∇g=0. Scaling its metric by 4
  gives K=1/4 and still ∇R=0; local symmetry does not mean K=0.
- For g=dx²+e^(2x²)dy² on ℝ², K=−2−4x² and ∂_xK at x=1 is −8;
  hence ∇R≠0 there: this metric fails the predicate, so a predicate satisfied
  by every smooth metric is excluded.
- For Einstein constancy the unit S³ has a=2 and the radius-two S³ has a=1/2.
  Their disjoint union is Einstein pointwise with unequal factors, so
  connectedness is essential. In dimension two the preceding variable-curvature
  metric satisfies Ric=Kg with nonconstant K, so dimension two is excluded; in
  dimension one Ric=0, so a=0 and the statement holds there.

*Needs:* Tau Ceti's Schur, Einstein, parallel-curvature and locally symmetric
surface theorems and its curvature symmetries (supplier contract); SmoothBundlesConnections
B3–B5 (induced tensor connections and parallel transport); HopfRinow Layer 0
(Levi-Civita connection). The R1.4 jet calculation and the R1.5 rescaling
limits are in Layer 2.

### 1.3 Metric changes, Lie groups and submersions
Use Mathlib's tensor, Gram, continuous-linear-map and finite-dimensional spectral
APIs. Consume SBC B2's exterior-square smooth bundle Λ²TM, whose fibre at x is
Mathlib's Gram exterior square ⋀²T_xM, and pin its musical isometry with K5a’s
degree-2 real Gram form bundle. The curvature operator Rop is Tau Ceti's pointwise
`CovariantDerivative.curvatureEndomorphism` on these fibres (supplier contract);
R1 proves that it is a smooth section of End(Λ²TM) on that shared identified
carrier. No second unconnected exterior bundle is used. The constant-scaling
laws, under which a constant c>0 preserves the connection and the curvature and
Ricci tensors and scales K and Scal by 1/c
(`Bundle.ContMDiffRiemannianMetric.leviCivitaConnection_rescale_const_apply`,
`Bundle.ContMDiffRiemannianMetric.ricciTensor_leviCivitaConnection_rescale_const`,
`Bundle.ContMDiffRiemannianMetric.scalarCurvature_rescale_const`,
`Bundle.ContMDiffRiemannianMetric.sectionalCurvature_leviCivitaConnection_rescale_const`),
the connection and the curvature, Ricci and scalar curvature of a product metric
(`TauCeti.Manifold.tangentSpaceProdEquiv_leviCivitaConnection_prodVectorField`,
`TauCeti.Manifold.tangentSpaceProdEquiv_curvatureTensor_leviCivitaConnection_prod`,
`TauCeti.Manifold.ricciTensor_leviCivitaConnection_prod`,
`TauCeti.Manifold.scalarCurvature_leviCivitaConnection_prod`) and the Levi-Civita
connection of a warped product
(`TauCeti.Manifold.IsWarpedProduct.tangentSpaceProdEquiv_leviCivitaConnection_prodVectorField`)
are Tau Ceti's (supplier contract) and consumed here. Along a smooth map f with
invertible differential the pullback metric f*g makes f a local Riemannian isometry
onto g, by `Bundle.ContMDiffRiemannianMetric.pullback_inner`, so the connection and
curvature of f*g are those of g by the supplied naturality theorems
`TauCeti.IsLocalRiemannianIsometry.mfderiv_leviCivitaConnection_mpullback` and
`TauCeti.IsLocalRiemannianIsometry.mfderiv_curvatureTensor`; pullbacks along
immersions of lower dimension are R5a's Gauss equation.

R1 owns the curvature of a warped product M×_f N, the metric g=g_M+f²g_N for a smooth
f>0 on M, derived from the supplied connection (Barzen–Leymann, *Mathematics of
Spacetime*, Lemma 35 and Lemma 36, pp. 61–62, whose curvature tensor has the opposite
sign). For X,Y,Z tangent to M and U,V,W tangent to N, with k=dim N, Hess f and grad f
taken on M and Δ=div grad on M:

- `R(X,Y)Z` is the curvature of g_M, and `R(X,Y)V=R(V,W)X=0`;
- `R(V,X)Y=−f⁻¹ Hess f(X,Y) V`;
- `R(V,W)U=R_N(V,W)U−f⁻²|grad f|²(g(W,U)V−g(V,U)W)`;
- `Ric(X,Y)=Ric_M(X,Y)−k f⁻¹ Hess f(X,Y)`, `Ric(X,V)=0` and
  `Ric(V,W)=Ric_N(V,W)−(f⁻¹Δf+(k−1)f⁻²|grad f|²) g(V,W)`.

**Checks.**

- For dx²+e^(2x)dy² on ℝ² (M=N=ℝ, f=e^x, k=1), a unit horizontal X=∂x and a unit
  vertical V give `⟨R(V,X)X,V⟩=−f″/f=−1`, the hyperbolic plane; the opposite sign
  convention would give +1.
- The unit sphere minus two antipodal points is (0,π)×_(sin) S^k with S^k unit. On
  vertical g-orthonormal V,W, `⟨R_N(V,W)W,V⟩=1/sin²t` and the correction is
  `−cos²t/sin²t`, so K=1; on mixed planes K=−(−sin t)/sin t=1, and
  `Ric(∂t,∂t)=−k(−sin t)/sin t=k`. Dropping the |grad f|² term would give 1/sin²t on
  vertical planes.
- On the same (0,π)×_(sin) S^k, f⁻¹Δf=f″/f=−1 with Δ=div grad, so a g-unit vertical V
  has `Ric(V,V)=(k−1)/sin²t−(−1+(k−1)cot²t)=k`, the unit-sphere value; at k=2,
  t=π/3 this is 4/3+2/3=2. Reading Δ as Δ⁺=−div grad gives f⁻¹Δ⁺f=+1 and
  `Ric(V,V)=k−2`, which is 4/3−4/3=0 at the same point. The other Checks have Δf=0
  or test only sectional curvature, so this one fixes the sign of the Δf term.
- Euclidean ℝ^(k+1)∖{0} is (0,∞)×_r S^k: Hess f=0 and |grad f|²=1, so
  `R(V,W)U=R_N(V,W)U−(g_N(W,U)V−g_N(V,U)W)=0`, flat as required, and the
  vertical Ricci curvature is `(k−1)g_N−(k−1)r⁻²·r²g_N=0`.
- For f≡1 every correction vanishes and the formulas are Tau Ceti's product
  curvature theorems.

*Needs:* Tau Ceti's warped-product connection, Hessian and gradient (supplier
contract); R1 curvature algebra.

For g̃=e^(2u)g with A_XY=du(X)Y+du(Y)X−g(X,Y)grad u, the identities ∇̃=∇+A,
`R̃(X,Y)Z=R(X,Y)Z+(∇_X A)(Y,Z)−(∇_Y A)(X,Z)+A(X,A(Y,Z))−A(Y,A(X,Z))`
and, in dimension n with Δ⁺=−tr Hess,
`Ric̃=Ric−(n−2)(Hess u−du⊗du)+(Δ⁺u−(n−2)|du|²)g` and
`Scal̃=e^(−2u)(Scal+2(n−1)Δ⁺u−(n−1)(n−2)|du|²)` are Tau Ceti's conformal-change
theorems of the supplier contract (written there with Δ=div grad=−Δ⁺), consumed
here.

For a supplied positive Ad-invariant inner product on a finite-dimensional
real Lie algebra, the bi-invariant metric on the native Lie-group carrier is
Tau Ceti's `TauCeti.leftInvariantMetric`, with its left and right invariance
(`TauCeti.leftInvariantMetric_inner_mfderiv_mul_left`,
`TauCeti.leftInvariantMetric_inner_mfderiv_mul_right`) and its completeness
(`TauCeti.completeSpace_leftInvariantMetric`); every finite-dimensional
left-invariant metric, compact or not, is complete by
`TauCeti.completeSpace_of_inner_mulInvariantVectorField` (supplier contract).
These are consumed here. On left-invariant fields, ∇_X Y=½[X,Y] and R(X,Y)Z=−¼[[X,Y],Z] under
the curvature convention above are Tau Ceti's
`CovariantDerivative.IsLeviCivitaConnection.apply_mulInvariantVectorField` and
`CovariantDerivative.IsLeviCivitaConnection.curvatureTensor_one` (supplier
contract), consumed here (Andrews, *Lectures on Differential Geometry*,
Lecture 16, Corollary 16.8.5, p. 162, whose curvature tensor has the opposite
sign, so that his `R_ijkl=¼c_ijp c_klp` is −¼[[X,Y],Z] here). For a closed
subgroup H≤G, prove that every G-invariant Riemannian metric on G/H is complete:
the left action of G is a transitive action by isometries, so Tau Ceti's
`TauCeti.completeSpace_of_isPretransitive_isom_of_finiteDimensional` applies. An Ad-invariant
product exists when the adjoint image has compact closure; its existence is
a separate hypothesis for an arbitrary Lie group.
For a smooth Riemannian submersion build its horizontal/vertical projections
h,v for the given metric, comparing SBC's splitting after choosing that
metric as its auxiliary metric, and pin
`A_X Y=v∇_(hX)(hY)+h∇_(hX)(vY)` and
`T_X Y=h∇_(vX)(vY)+v∇_(vX)(hY)`.
Develop their tensor, symmetry, integrability, connection and O'Neill curvature
formulas with naturality under isometries preserving the submersion. For a
horizontal initial vector, prove its geodesic stays horizontal and projects to
a base geodesic. Prove local horizontal lifting of every base geodesic from a
chosen point in its fiber, and full-interval lifting when the total metric is
complete; incomplete submersions have only maximal-interval lifts. For a
closed H≤G and the supplied Ad(G)-invariant product, construct the normal
homogeneous metric on SBC B1.4's G/H with horizontal space h^perp and prove
G→G/H is a Riemannian submersion. The more general Ad(H)-invariant product
on a reductive complement gives a G-invariant homogeneous metric; do not call
it normal without the Ad(G)-invariant full-group product.

This generic connection/submersion lane precedes R2 and uses no projective
carrier or normal-coordinate jet theorem.

The curvature-operator API comprises:

- Its pairing with simple bivectors, its symmetry for the Levi-Civita connection,
  sectional curvature as its Rayleigh quotient and the constant-curvature
  characterization Rop=κ Id are Tau Ceti's (supplier contract); R1 proves that
  x↦Rop_x is a smooth section of End(Λ²TM).
- Isometry naturality is Tau Ceti's
  `TauCeti.IsLocalRiemannianIsometry.map_curvatureEndomorphism`; restriction to an
  open submanifold is its case for the inclusion, a local Riemannian isometry by
  `Bundle.ContMDiffRiemannianMetric.isLocalRiemannianIsometry_restrictOpenTangentSpace`.
- Its contractions recover Ricci and scalar curvature with the standing sign:
  `Ric(u,u)=Σ_i⟨Rop(e_i∧u),e_i∧u⟩` and `Scal=2 tr Rop` for an orthonormal basis (e_i).

**Checks.**

- In flat space Rop=0; in dimension one Λ² is zero, so this does not determine κ.
- On curvature +1 and −1 spaces the eigenvalues on unit simple bivectors are
  +1 and −1 respectively; exchanging the last curvature slots reverses them.
- On S²×H² with unit curvature magnitudes, the two factor bivectors have
  eigenvalues +1 and −1 and the four mixed bivectors have eigenvalue 0.
  Thus the operator is neither positive nor negative semidefinite.

*Needs:* Tau Ceti's pair interchange and product curvature (supplier contract);
SmoothBundlesConnections B2.1 exterior bundles; ComplexKahlerGeometry K5a's
degree-two Gram metric.

The horizontal/vertical projection API comprises:

- h+v=Id, h²=h, v²=v and hv=vh=0 on the total tangent bundle.
- Their ranges are the orthogonal complement of ker(dπ) and ker(dπ), respectively.
- They are smooth and commute with restriction and submersion-preserving isometries.

**Checks.**

- For ℝ²→ℝ, (x,y)↦x, with the product metric, h(a,b)=(a,0), v(a,b)=(0,b).
- For the identity submersion h=Id and v=0; for the submersion to a point
  h=0 and v=Id. Interchanging the two projections fails these cases.
- For dx²+e^(2x)dy² at x=log 2, v(∂y)=∂y has norm 2 while h(∂y)=0;
  projection does not normalize its nonzero output to length one.

*Needs:* SmoothBundlesConnections B1.5's kernel subbundle and metric orthogonal
splitting; smooth positive Gram inversion.

The O'Neill A-tensor API comprises:

- The displayed formula is tensorial in both entries; only the horizontal
  part of its first entry contributes, and its second entry switches type.
- On horizontal X,Y, A_XY=½v[X,Y] and A_XY=−A_YX.
- A vanishes exactly when the horizontal distribution is integrable;
  restriction and submersion-preserving isometries intertwine it.

**Checks.**

- On a product submersion A=0 for every pair of tangent vectors.
- For the unit Hopf submersion S³→CP¹, a horizontal orthonormal complex-line
  pair has |v[X,Y]|=2 and |A_XY|=1, yielding base curvature 1+3=4.
- Interchanging that pair negates its nonzero vertical A-value; with vertical
  first entry A_UY=0. A symmetric bracket formula fails the first test.

*Needs:* h,v, the Levi-Civita connection and torsion-free bracket identity;
SmoothBundlesConnections B1.5. The Hopf Check uses the quotient metric below.

The O'Neill T-tensor API comprises:

- The displayed formula is tensorial in both entries; only the vertical
  part of its first entry contributes, and its second entry switches type.
- On vertical U,V, T_UV=T_VU is the second fundamental form of a fibre.
- T vanishes exactly when the fibres are totally geodesic; restriction and
  submersion-preserving isometries intertwine it.

**Checks.**

- For a product submersion T=0, including its vertical-vertical component.
- For (ℝ²,dx²+e^(2x)dy²)→ℝ, the unit vertical U=e^(−x)∂y satisfies
  T_UU=−∂x and |T_UU|=1: Γˣ_yy=−e^(2x) and U has no x-component.
- For dx²+e^(4x)dy², U=e^(−2x)∂y gives T_UU=−2∂x and norm 2.
  Thus T≡0 and a fixed unit normalization both fail.

*Needs:* h,v, the Levi-Civita connection and metric compatibility; the
vertical distribution is integrable because it is the kernel of a submersion.
The warped-product Checks follow directly from the metric Christoffel formula.

**Projective metric examples.** This block follows the generic submersion
construction and the indicated smooth-carrier suppliers. Its curvature and
geodesic calculations also consume R4.7's independently constructed round
model, whose connection is Tau Ceti's Gauss formula for the inclusion and which
uses no R3 theorem.
On [ComplexKahlerGeometry K7.1](../ComplexKahlerGeometry/README.md)'s
smooth CP^d carrier and [GeneralizedCohomology G4.0b](../GeneralizedCohomology/README.md#g4-generalized-lerayhirsch-thom-and-euler-theory)'s
smooth HP^d carrier, construct metrics as the quotients of the round unit
spheres S^(2d+1) and S^(4d+3) by the circle and unit-quaternion Hopf actions.
For HP^d consume G4.0b's smooth Hopf quotient submersion and its diffeomorphism
with Sp(d+1)/(Sp(d)×Sp(1)); prove that the quotient metric makes this map a
Riemannian submersion. For CP^d construct the general smooth Hopf map as
SBC B1.4's free circle quotient, consuming SBC's S³→CP¹ example when d=1,
and prove the general quotient is diffeomorphic to K7.1's chart-built native
projectivization carrier. Consume TopologicalKTheory T6.6's classical quotient
comparison with U(d+1)/(U(d)×U(1)), with base point the last coordinate line,
matching the ordered blocks and the HP convention.
On both classical Lie algebras pin the product `⟨X,Y⟩=−½ Re tr(XY)`;
for sp(d+1) take the trace in quaternionic (d+1)-by-(d+1) matrices, or
`−¼ Re tr(XY)` in their doubled complex representation. Prove its induced
quotient metric equals the round Hopf quotient metric. This normalization
has primitive unit-speed geodesic period π. For d≥2 the sectional curvature
bounds 1 and 4 are both attained; CP¹ and HP¹ have constant curvature 4 and are
round spheres of radius ½, while d=0 is a point. Derive the curvature range
from O'Neill's horizontal-curvature formula for a Riemannian submersion,
`K_B(π_*X,π_*Y)=K_M(X,Y)+¾|[X,Y]^v|²` for horizontal orthonormal X,Y
(O'Neill, *The fundamental equations of a submersion*, Michigan Math. J. 13
(1966), 459–469, Theorem 2 and Corollary 1), on the round S^(2d+1): the vertical
component of [X,Y] is `2⟨X,JY⟩` times the unit fibre direction Jz, so
`K(X,Y)=1+3⟨X,JY⟩²`, which lies in [1,4], equals 4 exactly on complex lines
(Y=±JX) and equals 1 exactly on totally real planes; on HP^d the same
computation with the three complex structures gives `K(X,Y)=1+3Σ_k⟨X,J_kY⟩²`.
Derive the period from horizontal great circles: for a unit v with v⊥z and
v⊥Jz, `γ(t)=cos t·z+sin t·v` is horizontal at every time, its projection is a
geodesic of the quotient, and `γ(t+π)=−γ(t)` is its first return to the line
through z. Pin the normalization by the orbit map: for X in the orthogonal
complement of u(d)⊕u(1) in u(d+1), `−½ Re tr(X²)=|X e_(d+1)|²` is the round
norm of the orbit velocity, while on the u(1) summand `−½ Re tr(X²)` is half of
it, so the comparison is a statement about the quotient U(d+1)/(U(d)×U(1)) and
not about the orbit map onto the sphere.

**Checks.**

- For X=[[0,−1],[1,0]], −tr(X²)/2=1=|Xe₂|². For X=diag(0,i),
  these quantities are 1/2 and 1; the norm comparison is horizontal for
  the projective quotient, not the sphere orbit map on all Lie-algebra vectors.
- A horizontal great circle returns to its projective line after π, when
  its sphere representative is −z; the sphere representative first returns at 2π.
- CP¹ has radius 1/2, curvature 4 and metric area π. CP⁰ is a point
  with no tangent two-plane or nonconstant unit-speed geodesic.

*Needs:* R1 submersion formulas; R4.7 direct round model;
ComplexKahlerGeometry K7.1; GeneralizedCohomology G4.0b;
TopologicalKTheory T6.6.

### Examples

On unit S³, Ric=2g and Scal=6. On ℝ³ both vanish. For ∇=d+a dx,
transport from x to y is exp(−a(y−x)); differentiating inverse transport
recovers s′+as, fixing the supplier convention.

### Dependencies

R1 connection algebra uses HopfRinow Layer 0, SmoothBundlesConnections B2–B5,
finite-dimensional tensor algebra and Tau Ceti's curvature identities, parallel
curvature, constant-scaling, product and warped-product connection theorems. Its
homogeneous metrics use LieGroups
L0–L2, SmoothBundlesConnections B1.4–B1.5 and Tau Ceti's left-invariant metrics
and homogeneous completeness; its curvature operator is Tau Ceti's pointwise
curvature endomorphism. The projective examples additionally
use ComplexKahlerGeometry K7.1, GeneralizedCohomology G4.0b,
TopologicalKTheory T6.6 and the direct round-model calculation in R4.7.

## Layer 2: Jacobi fields and normal-coordinate jets

### R2. General Jacobi fields and exponential derivatives

Native C² `IsGeodesicCurveOn` solutions for a smooth metric are C^∞ on their whole
parameter set, closed-interval endpoints included, by Tau Ceti's
`TauCeti.Manifold.IsGeodesicCurveOn.contMDiffOn_infty` (supplier contract); R2
consumes this and owns no geodesic-regularity statement.

### 2.1 Jacobi fields and their initial data

Jacobi fields are Tau Ceti's `TauCeti.Manifold.IsJacobiFieldOn` (supplier
contract): for a geodesic γ on a parameter set, a C² section X of γ*TM with
`D_t²X+R(X,γ′)γ′=0`. Its C² lift to the tangent bundle and the parameter-set
unique-derivative hypothesis are part of the definition, and the predicate
needs no boundaryless model; the initial-data and geometric theorems below use
the standing boundaryless hypothesis, and `exists_jacobi_initial_data` and
`rauch_norm_ge_of_sectional_le` are stated on this predicate. On a compact interval [a,b], require a<b for
the initial-data theorems. Tau Ceti supplies linearity, restriction, overlap
uniqueness, affine reparametrization, smooth-isometry transport, smoothness of
Jacobi fields of a smooth metric, uniqueness from initial data
(`eq_of_eq_of_alongCurveWithin_eq`, on any preconnected parameter set), the
constant Wronskian (`wronskian_eq`), the splitting into a tangential field
`(a+bt)γ′` and a normal Jacobi field, the solution space
`TauCeti.Manifold.jacobiFieldSpace` with dimension at most 2n
(`finrank_jacobiFieldSpace_le`), the variation field of a family of geodesics as
a Jacobi field, and the Jacobi field t↦d(exp_p)_(tv)(tw) along a radial geodesic.

Iterated covariant differentiation along γ uses Tau Ceti's along-curve regularity
(supplier contract), consumed here: `CovariantDerivative.contMDiffOn_alongCurveWithin`
makes D_tX of a C^(k+1) section lift on a `UniqueDiffOn` parameter set C^k,
`CovariantDerivative.eventuallyEq_sectionCoord_alongCurveWithin` gives its fixed-chart
formula near every parameter, `CovariantDerivative.symmL_alongCurveInChartWithin` its
chart independence and `CovariantDerivative.alongCurveWithin_comp` its reparametrization
law; R2 owns no along-curve regularity statement. Trivialize along γ by
parallel transport and obtain a linear second-order ODE on a **fixed** tangent
space. Prove global solvability (`exists_jacobi_initial_data`) on each
prescribed compact geodesic interval for arbitrary (X(t₀),D_tX(t₀)), smooth
dependence on the data, and with Tau Ceti's uniqueness the identification of the
solution space with two copies of the initial tangent space, so its dimension
is exactly 2n. This solution space consists of sections on the interval, or the
quotient of extended sections by equality there; freely chosen values outside
the interval are not part of it. This does not require completeness of the
whole manifold.

Conversely to Tau Ceti's variation theorem, realize any initial-data solution by
a smooth geodesic variation on a common compact time interval, using smooth
initial position/velocity and the joint geodesic flow. This converse does not
promise fixed endpoints beyond first order. The identity
`d exp_(tv)(tw)=X(t)` for a Jacobi field with X(0)=0 and D_tX(0)=w along
t↦exp_p(tv) is Tau Ceti's `TauCeti.Manifold.IsJacobiFieldOn.eq_mfderiv_riemannianExp`
(supplier contract), consumed here; prove its version with varying basepoint, for
the variable-base exponential map `(x,v)↦exp_x v` of SBC B6.0. The affine-parameter
scaling of the tangential part is explicit, and constant geodesics are the
separate affine-vector-field case.
The Gauss radial-length identity `|d exp_v(v)|=|v|` is the case w=v of Tau Ceti's
Gauss lemma `TauCeti.Manifold.inner_mfderiv_riemannianExp_radial` (supplier
contract). For the equality
case in the radial-versus-angular length comparison, require d exp to be
nonsingular along the compared domain before concluding the angular component
vanishes; the norm inequality alone does not exclude a singular kernel.

For constant curvature κ, Tau Ceti writes every normal Jacobi solution with
model cosine and sine coefficients of parallel fields
(`exists_eq_curvatureCosine_smul_add_curvatureSine_smul`), gives the
positive-curvature conjugate time π/(√κ c) at speed c, the conjugate multiplicity
`TauCeti.Manifold.conjugateMultiplicity`, and the nonpositive-curvature absence of
Jacobi fields vanishing at two parameters
(`eq_zero_of_endpoints_eq_zero_of_sectionalCurvature_nonpos`). Use these
formulas for the sphere examples, space forms and normal jets; compute the
multiplicity n−1 at every conjugate time of a nonconstant geodesic in positive
constant curvature. Tau Ceti also proves that a Killing field restricts to a
Jacobi field along every geodesic and the identity `∇²_(Y,Z)X=R(Y,X)Z`, where
∇²_(Y,Z)X=∇_Y∇_ZX−∇_(∇_YZ)X; prove the complete local-flow isometry
characterization of Killing fields.

The Jacobi equation and initial-data identification are Milnor, §14, p. 77;
the geodesic-variation realization is Lemma 14.4, pp. 80–81. Milnor uses the
opposite curvature sign: his R(γ′,X)γ′ is our R(X,γ′)γ′.

- The predicate is linear in X, restricts to nondegenerate subintervals and
  is preserved by smooth isometries and affine changes of parameter.
- Initial value and covariant derivative identify solutions on [a,b] with
  two copies of the initial tangent space; values outside [a,b] are quotiented out.
- Geodesic variations give exactly the Jacobi solutions, with the initial-data
  and differential-of-exponential comparisons stated above.

**Checks.**

- On a flat unit-speed geodesic J(t)=u+tv has D²J=0 and curvature term 0;
  its data at zero are (u,v), including u=v=0.
- On a unit great circle with parallel unit normal E, J(t)=sin(t)E has
  D²J=−sin(t)E and R(J,γ′)γ′=sin(t)E. Its endpoints at 0 and π vanish,
  excluding a nonpositive-curvature conclusion on the sphere.
- On a flat unit-speed geodesic J(t)=t²E has residual 2E≠0 and is not Jacobi;
  vanishing at one point alone does not impose the differential equation.

*Needs:* Tau Ceti's Jacobi theory, its exponential-differential identification and
Gauss lemma (supplier contract); HopfRinow Layers 0–2 (along-curve derivative and
smooth geodesic flow); SmoothBundlesConnections B5.0 (parallel trivialization) and,
for the varying-basepoint version only, B6.0 (the variable-base exponential map); R1
connection and curvature algebra; linear ODE existence on a compact interval.

### 2.2 Normal-coordinate jets (R1.4)

Build smooth orthonormal geodesic frames at a point, including their induced
tensor frames. Pin their radial-parallel construction. Choose a star-shaped
normal ball B about 0 in T_pM and an orthonormal basis (e_i) at p. For v∈B set
`E_i(exp_p v)=P_(s↦exp_p(sv),0→1)(e_i)`, with E_i(p)=e_i.
Consume SBC B5's smooth parameter-dependent parallel transport to prove
this frame smooth jointly in v, including v=0, and orthonormal throughout
exp_p(B). Prove it is parallel along every radial geodesic and deduce
`∇_w E_i(p)=0` for every w∈T_pM, with the corresponding induced tensor-frame
identities. The coordinate frame `d(exp_p)_v(e_i)`, Tau Ceti's
`TauCeti.Manifold.normalCoordinateField` at e_i (supplier contract), and this
transported frame have the same value at p; they are not identified away from p.
Derive the vanishing covariant derivatives from radial parallelism, rather
than assuming d exp is parallel transport (Bishop, *Riemannian Geometry*, §6.11,
p. 41, for this canonical frame, the normal-coordinate basis at p translated in
parallel along the radial geodesics, and Problem 6.12, p. 41, for its
second-order expansion, whose connection forms vanish at p).

The transported-frame API comprises:

- joint smoothness of `(v,i)↦E_i(exp_p v)` on the normal ball, including at
  v=0, as a smooth frame of TM over exp_p(B);
- orthonormality of (E_i) at every point of exp_p(B), from the isometry
  property of parallel transport;
- parallelism along every radial geodesic s↦exp_p(sv), that is
  `D_s E_i(exp_p(sv))=0`;
- vanishing covariant derivatives at the centre, `∇_w E_i(p)=0` for every
  w∈T_pM, with the induced identities for the tensor frames built from (E_i)
  and their dual coframe.

**Checks.**

- On Euclidean space with the flat metric, parallel transport is the identity,
  so `E_i(p+v)=e_i` for every v, and the transported frame coincides with the
  coordinate frame `d(exp_p)_v(e_i)=e_i`; a definition that rotated the frame
  with v would fail this.
- On the unit two-sphere with T=v/|v| and Y⊥T unit, at t=π/2 the transported
  vector E_Y(exp_p(tT)) has norm 1 while the coordinate vector
  `d(exp_p)_(tT)(Y)` has norm sin(π/2)/(π/2)=2/π, so a definition identifying
  the transported frame with the coordinate frame away from p is wrong even
  though the two agree at t=0 and in the flat Check.
- Transporting the basis (2e_1,e_2,…,e_n) instead of an orthonormal one gives
  a first vector of constant norm 2 along every radial geodesic, so the
  orthonormality clause fails; the definition must start from an orthonormal
  basis of T_pM, not from any basis.
- Transport along a non-radial path is a different operator: on the unit
  two-sphere, transporting a tangent vector around the geodesic triangle with
  three right angles rotates it by π/2, so a frame defined by transport along
  arbitrary paths from p would not be single-valued; the radial path in the
  definition is what makes E_i a function of the point.

In a normal chart the first derivatives of g vanish at the centre and the
coordinate fields are parallel there (Nicolaescu, *Lectures on the Geometry of
Manifolds*, Proposition 4.1.25 and Lemma 4.1.26, p. 151): these are Tau Ceti's
`TauCeti.Manifold.IsNormalDomain.mfderiv_inner_normalCoordinateField_self` and
`TauCeti.Manifold.IsNormalDomain.leviCivitaConnection_normalCoordinateField_self`
(supplier contract), consumed here. Characterize the quadratic/cubic jets by R and
∇R. With orthonormal vectors e_i at p,
v in its tangent normal ball, pin
`exp_p*g(e_i,e_j)=δ_ij−⅓⟨R(e_i,v)v,e_j⟩`
`−⅙⟨(∇_vR)(e_i,v)v,e_j⟩+O(|v|⁴)`
(Brewin, *Riemann normal coordinate expansions using Cadabra*, §5, the
third-order metric expansion, p. 9, and §11, equation (11.1), p. 15; his
`R_acbd x^c x^d` is `⟨R(e_a,v)v,e_b⟩` in the convention of this roadmap, both
being `+K|v|²` on the unit sphere for e_a=e_b ⊥ v).
State the remainder as an actual local norm bound uniform over unit e_i,e_j. Derive these expansions
from R2's Jacobi equation, not an assumed Taylor formula for exp. In
particular for unit T,Y with Y⊥T,
`|d exp_(tT)(tY)|²=t²−⅓K(T,Y)t⁴+O(t⁵)`.
*Needs:* HopfRinow (Completed) Layers 2–3 (normal balls, Gauss lemma),
SmoothBundlesConnections B5.0 (smooth parameter-dependent parallel transport),
R2 (Jacobi fields and `d exp`), Tau Ceti's normal coordinate fields (supplier
contract).

### 2.3 Euclidean limits of rescaled metrics (R1.5)

Let N be a fixed smooth Riemannian n-manifold, C⊂N compact, `p_j∈C`,
`E_j:ℝⁿ→T_(p_j)N` linear isometries and `λ_j→∞`. For each fixed L>0 prove
that `F_j(x)=exp_(p_j)(E_j(x)/λ_j)` is defined on a neighbourhood of the
closed Euclidean L-ball and is a diffeomorphism onto its image for all large
j, and that `g_j=λ_j²F_j*g` converges to the Euclidean metric in every C^m
norm on that ball: uniform convergence of all coefficient derivatives of order
at most m. Include convergence of the inverse coefficients and the volume
densities, and convergence of the Christoffel symbols to zero with every fixed
finite number of derivatives. Make the coefficient bounds uniform over the
centres in C and all orthonormal frames, consuming SBC B6.0's uniform normal
radius and smooth dependence of the exponential map on its base point;
constants depend on g and C, and sectional-curvature bounds alone do not
supply the higher-derivative bounds. Identify the sectional curvature of g_j
with λ_j⁻² times that of g by Tau Ceti's
`Bundle.ContMDiffRiemannianMetric.sectionalCurvature_leviCivitaConnection_rescale_const`
with c=λ_j² (supplier contract), and
check that a Euclidean metric is unchanged by the construction. The
coefficients of g_j at x in the basis (e_a) are those of exp_(p_j)*g on (E_j e_a)
at E_j(x)/λ_j, so the limit is driven by the normal-coordinate expansion of §2.2,
`exp_p*g(e_a,e_b)=δ_ab−⅓⟨R(e_a,v)v,e_b⟩+O(|v|³)` (Bishop, *Riemannian Geometry*,
Theorem 6.11, p. 41, in his index notation): at v=E_j(x)/λ_j the correction is
O(λ_j⁻²), and each derivative in x adds a factor λ_j⁻¹. Its first-order case is the
vanishing of the first derivatives of g at the centre, Tau Ceti's
`TauCeti.Manifold.IsNormalDomain.mfderiv_inner_normalCoordinateField_self`
(Nicolaescu, *Lectures on the Geometry of Manifolds*, Proposition 4.1.25, p. 151).
The uniformity in the
centre and the frame is the content owned here.

*Needs:* the R1.4 jets (§2.2); SmoothBundlesConnections B6.0 (uniform normal
radius on compact sets and the variable-base exponential map); Tau Ceti's
constant-scaling law
`Bundle.ContMDiffRiemannianMetric.sectionalCurvature_leviCivitaConnection_rescale_const`
and normal coordinate fields (supplier contract).

### Examples

For orthogonal unit T,Y on the unit sphere, |d exp_(tT)(tY)|²=sin²t
=t²−t⁴/3+O(t⁶). In Euclidean space this is exactly t². Thus the jet
coefficient agrees with the Jacobi residual checks.

### Dependencies

R2 uses R1 connection and curvature algebra, HopfRinow Layers 0–3 and
SmoothBundlesConnections B5.0. The R1.4 jets use R2 initial-data and
exponential-derivative comparisons; they are not inputs to those comparisons.
R1.5 uses the R1.4 jets, SmoothBundlesConnections B6.0 and Tau Ceti's
constant-scaling law.

## Layer 3: index forms and path topology

### R3. Second variation, index forms and conjugate points

Construct smooth and piecewise smooth variations and their endpoint constraints
on the actual curve/section types. First construct the shared ambient real module
of continuous piecewise C¹ sections of γ*TM on [a,b], with subdivision-independent
C¹ lifts on the pieces and linear endpoint evaluations. Construct the bulk index
integral as a real `LinearMap.BilinForm` on this module. Its fixed-endpoint
restriction I is on V₀₀={X | X(a)=0 and X(b)=0}; R3 uses this restriction.
Construct the smooth-submodule and H¹ completion comparisons and continuous
endpoint traces, with their inclusion/restriction laws. The periodic and R6
mixed-endpoint subspaces use this same ambient interval-section module, with
their own endpoint constraints. Starting from HopfRinow's first variation,
first prove the first-variation formula for continuous piecewise smooth curves,
including the jump of tangent velocity at each corner. Mixed covariant
derivatives commute up to curvature by Tau Ceti's
`CovariantDerivative.alongCurve_alongCurve_sub_alongCurve_alongCurve` (supplier
contract), `D_sD_tW−D_tD_sW=R(∂_sf,∂_tf)W` wherever the field is C², consumed at
interior parameters of each smooth piece of a variation. R3 owns its one-sided
form at the end parameters of each closed piece [t_i,t_(i+1)]×(−ε,ε), where the
variation is defined only within that set and the pinned theorem, stated for
derivatives along full parameter lines, does not apply: both sides are continuous
on the closed piece for a C² variation, by Tau Ceti's along-curve regularity, and
agree on its interior. Interchange
derivative/integral under compact-parameter hypotheses, and derive the second
energy variation, including endpoint acceleration and corner terms. For fixed
endpoints its Hessian is the pinned index form. For length, use normal fields
along a unit-speed nonconstant geodesic and state the tangential/reparametrization
degeneracy separately. On smooth closed geodesics also prove the second
variation on periodic fields/variations; periodic endpoint terms cancel. This
is the closed-geodesic formula consumed by R4.6's Synge argument; DGFloer
owns the wider free-loop Morse theory. Give the smooth-density/approximation comparison with
piecewise C¹ and H¹ fields.

Prove integration by parts, symmetry and the endpoint-Jacobi kernel criterion.
Conjugacy and its multiplicity are Tau Ceti's `TauCeti.Manifold.IsConjugateOn`
(a Jacobi field nonzero somewhere on the parameter set vanishing at two distinct
parameters) and `TauCeti.Manifold.conjugateMultiplicity` (the dimension of that
solution subspace), with `TauCeti.Manifold.conjugateMultiplicity_pos_iff` and the
bound n−1 for nonzero velocity, `TauCeti.Manifold.conjugateMultiplicity_le`
(supplier contract); they are consumed here. Prove the equivalence of conjugacy
with the singular differential of exp and with nullity of the endpoint index form,
with the radial direction excluded for a nonconstant geodesic, and prove that the
multiplicity equals `dim ker(d exp_(bv))` with the initial-time/velocity rescaling
explicit.

Use a finite subdivision into strongly convex normal neighborhoods. Split
endpoint-zero fields into piecewise Jacobi interpolation and fields zero at all
nodes, prove index orthogonality, and prove positivity on the latter summand.
Identify the index/nullity with the finite matrix on node values. Prove finiteness
of the index, defined first as the supremum in `ℕ∞` of the dimensions of finite
negative-definite subspaces; the reduction proves this value is attained.
Prove the Morse index theorem: index equals the sum of conjugate multiplicities
strictly inside the interval; endpoint conjugacy supplies nullity, not index.
Track the index jump as the endpoint moves. No infinite-dimensional spectral
assertion substitutes for this finite reduction.

The headline `morse_index` states it on smooth sections. Define
`IsEndpointZeroSmoothSection` for a section X of γ*TM over [a,b]: its lift
t↦(γ(t),X(t)) to the tangent bundle is smooth on [a,b] and X(a)=X(b)=0. Define
`indexForm` as the bulk integral `∫_a^b ⟨D_tX,D_tY⟩−⟨R(X,γ′)γ′,Y⟩`, with D_t Tau
Ceti's covariant derivative along γ within [a,b] and γ′ its velocity within [a,b];
on smooth sections it is the restriction of I. For a<b and γ a geodesic on [a,b],
`morse_index` says that the largest k for which some k smooth endpoint-zero sections
have `indexForm(Z,Z)<0` for every nonzero linear combination Z of them exists and
equals the sum over t∈(a,b) of `TauCeti.Manifold.conjugateMultiplicity` of the pair
(a,t). The smooth index equals the index of I on V₀₀: smooth endpoint-zero sections
are dense in V₀₀ for the H¹ norm, I is continuous for that norm, and a family on
whose span I is negative definite stays so under small perturbation, its Gram
matrix being negative definite; the reverse inequality is monotonicity under
inclusion of test spaces.

- `IsEndpointZeroSmoothSection` is closed under sums and scalar multiples, so the
  index above is that of I on a linear subspace of V₀₀.
- `indexForm` is symmetric and bilinear on smooth sections, and equals
  `−∫_a^b ⟨D_t²X+R(X,γ′)γ′,Y⟩` when Y vanishes at both ends.
- `morse_index` holds for every geodesic, the constant ones included.

**Checks.**

- X(t)=sin(πt)E on [0,1], E parallel, satisfies `IsEndpointZeroSmoothSection`;
  X(t)=tE fails it, since X(1)=E≠0; the tent min(t,1−t)E lies in V₀₀ but fails
  smoothness at t=1/2, and on a flat geodesic its form value 1 is the limit of
  those of smooth endpoint-zero approximations, as density requires.
- On a constant geodesic the Jacobi fields are X(t)=u+(t−a)v in one tangent
  space; vanishing at a and at t≠a forces u=v=0, so every multiplicity is 0, the
  sum is 0, and `indexForm(X,X)=∫|X′|²≥0` has index 0.
- On a unit great circle of the unit S², [a,b]=[0,3π/2], the field
  X(t)=sin(2t/3)E has `indexForm(X,X)=(4/9)(3π/4)−3π/4=−5π/12<0`, and the only
  interior conjugate parameter is π, of multiplicity 1, so both sides are 1. With
  +⟨R(X,γ′)γ′,Y⟩ in place of −, the same field gives (4/9)(3π/4)+3π/4>0 and every
  normal field has positive form value, so the opposite curvature sign would make
  the index 0 against the multiplicity 1 at π.
- On [0,2π] the conjugate parameters are π and 2π; the sum over the open interval
  counts only π and gives n−1, whereas counting the endpoint 2π would give
  2(n−1).

Prove minimizing segments have index zero (positive-semidefinite index form). A conjugate point strictly
before the endpoint produces an explicitly smoothed shortening variation;
segments with no conjugate point in `(a,b]` are strictly locally minimizing
among uniformly close fixed-endpoint curves up to nondecreasing reparametrization
for length, or uniquely at the fixed affine parametrization for energy.
Global minimizing and absence of conjugacy remain distinct. R6 supplies the
submanifold-endpoint and focal versions on its mixed-endpoint subspace of the
same ambient interval-section module, with the bulk form restricted there.

The index theorem uses Milnor, Theorem 15.1, p. 83; endpoint nullity uses
Theorem 14.1, pp. 78–79. With energy ½∫|γ′|² the Hessian is half Milnor's energy
Hessian, so its index and nullity are unchanged.

- The index is unchanged by positive scaling of the form and by isomorphism
  of its section space, and is monotone under inclusion of test spaces.
- The finite broken-Jacobi reduction attains the index and identifies the kernel
  with endpoint-zero Jacobi fields.
- Endpoint focality contributes to nullity; only interior times contribute to index.

**Checks.**

- For a flat geodesic, I(X,X)=∫|X′|²≥0 and endpoint-zero fields have
  zero index and nullity; for X(t)=sin(πt)E on [0,1], I=π²/2>0.
- On a unit spherical geodesic in dimension n≥2 of length L, the normal test
  X(t)=sin(πt/L)E has I=(π²/L−L)/2. At L=π this is zero and the
  transverse nullity is n−1; the index is still zero.
- At L=3π/2 the same I=−5π/12<0 and the index is n−1, accounting for
  the first interior conjugate time π. Counting the final endpoint at L=π
  as index would give the wrong value n−1.
- Sign of the commutator: on the unit sphere with
  f(q,r)=(sin r cos q, sin r sin q, cos r) and W=∂_rf, the meridians are geodesics,
  so D_rW=0, while D_qW=D_r∂_qf=cos r e_θ with e_θ=(−sin q, cos q, 0). Hence
  `D_qD_rW−D_rD_qW=sin r e_θ`, and `R(∂_qf,∂_rf)∂_rf=|∂_rf|²∂_qf−⟨∂_qf,∂_rf⟩∂_rf=sin r e_θ`
  for K=1; the opposite curvature sign would give −sin r e_θ.

*Needs:* R2 Jacobi theory; HopfRinow Layer 3 (first variation);
Tau Ceti `CovariantDerivative.alongCurve_alongCurve_sub_alongCurve_alongCurve`
(mixed covariant derivatives) and `CovariantDerivative.contMDiffOn_alongCurveWithin`
(along-curve regularity); Tau Ceti `TauCeti.Manifold.conjugateMultiplicity`
(supplier contract); SmoothBundlesConnections B6.0 (strongly convex
subdivisions); finite-dimensional bilinear-form inertia. R6's mixed-endpoint form is a later application.

### R3.1. H¹ paths and the speed topology

Define the H¹ path carrier using continuous curves whose readings on a finite
coordinate subdivision have weak first derivatives in L². The weak derivative of a
coordinate reading, valued in a finite-dimensional real space, is Tau Ceti's
`TauCeti.HasWeakLineDerivOn` on the open subinterval; an L² weak derivative on a
bounded interval is integrable, so the reading has a continuous representative that
is absolutely continuous with the fundamental theorem of calculus and classical
derivative equal to the weak one almost everywhere, and conversely an absolutely
continuous reading has its almost-everywhere derivative as weak derivative (Tau Ceti
contract, R3.1 paragraph). Pin its topology by local exponential charts
V↦(t↦exp_(γ(t))V(t)) along reference smooth paths γ, built from the exponential
map, which is smooth on an open domain in the tangent bundle containing the zero
section (Tau Ceti contract), with section norm `(∫(|V|²+|D_tV|²))^(1/2)`; prove
chart/subdivision independence, the one-dimensional Sobolev chain rule (a change of
chart φ that is C¹ near the compact image keeps an absolutely continuous reading u
absolutely continuous, with derivative Dφ(u)u′ almost everywhere, and Dφ is bounded
on that image, so the derivative stays in L²), continuity into the compact-open
carrier, and relative smooth density. Piecewise C¹ paths have the induced H¹
topology. Prove energy is continuous.
For every absolutely continuous finite-energy
curve on [a,b], prove Cauchy–Schwarz
`Length(γ)²≤2(b−a)Energy(γ)` and its restriction to each subinterval.
For b>a prove equality exactly when the speed is constant almost everywhere,
including the zero-speed case.

For the interval path carrier define the speed metric on finite-energy
absolutely continuous paths by
`d_s(γ,η)=sup_t dist(γ(t),η(t))+‖|γ′|−|η′|‖_L²`
and compare the H¹ topology with it.
Prove that convergence to an existing H¹ path in this metric is equivalent
to convergence in the preceding H¹ charts. In a common finite coordinate
subdivision, uniform convergence and bounded energy give weak convergence
of coordinate derivatives; convergence of the speed L² norms and uniform
metric coefficients then give strong convergence in the fixed weighted
Hilbert derivative space. Prove the converse using the one-dimensional
Sobolev embedding and the reverse triangle inequality for speeds. This
metric induces that topology but need not be complete: on an interval,
fixed-endpoint triangular waves of amplitude tending to zero and speed one
almost everywhere form a d_s-Cauchy sequence with no d_s limit. Do not use
completeness of this particular metric in constructing the Hilbert charts.

**Checks.**

- On [0,1] in ℝ, γ(t)=t has energy 1/2 and length 1, so the
  Cauchy–Schwarz inequality is equality; its H¹ norm is √(4/3).
- For γ(t)=t² the energy is 2/3 and length is 1, giving the strict
  inequality 1<4/3; equality cannot be characterized by monotonicity alone.
- Unit-speed triangular waves with n teeth and amplitude 1/(2n) have
  speed norm 1 and uniform norm 1/(2n). Their mutual speed-metric
  distances tend to zero, but their distances to the zero path tend to 1,
  demonstrating the stated incompleteness.
- The Cantor function c on [0,1], read as a path in ℝ, is continuous and monotone
  with total variation 1, and has classical derivative 0 almost everywhere. A
  carrier defined by an almost-everywhere classical derivative in L² would admit it
  with energy 0, and the Cauchy–Schwarz inequality for its length, the total
  variation 1, would read 1≤0. It has no integrable weak derivative: such a
  derivative would equal the classical derivative 0 almost everywhere, and the
  fundamental theorem of calculus would give c(1)−c(0)=0, not 1. So c is not an
  H¹ path.

*Needs:* Tau Ceti `TauCeti.HasWeakLineDerivOn`,
`TauCeti.hasWeakLineDerivOn_Ioo_iff_exists_ae_eq_add_intervalIntegral`,
`TauCeti.HasWeakLineDerivOn.exists_continuousOn_ae_eq`,
`TauCeti.HasWeakLineDerivOn.integral_eq_sub`,
`TauCeti.HasWeakLineDerivOn.absolutelyContinuousOnInterval` and
`TauCeti.HasWeakLineDerivOn.ae_hasDerivAt` (interval weak derivatives, the continuous
representative and its fundamental theorem of calculus; the one-dimensional embedding
`|u(y)−u(x)|≤|y−x|^(1/2)‖u′‖_(L²(a,b))` follows from that theorem by Cauchy–Schwarz),
`AbsolutelyContinuousOnInterval.intervalIntegrable_of_ae_hasDerivAt` and
`AbsolutelyContinuousOnInterval.integral_eq_sub_of_ae_hasDerivAt` (the converse for
absolutely continuous readings, applied on the subintervals [t₀,t] through Mathlib's
`AbsolutelyContinuousOnInterval.mono`) and `AbsolutelyContinuousOnInterval.comp_of_contDiffAt`
(chart changes); Tau Ceti `TauCeti.Manifold.isOpen_setOfPred_mem_expDomain` and
`TauCeti.Manifold.contMDiffOn_riemannianExp_tangentBundle` (exponential charts);
Tau Ceti `CovariantDerivative.eventuallyEq_sectionCoord_alongCurveWithin` (fixed-chart
formula for D_t, used for the chart section norm) and
`CovariantDerivative.contMDiffOn_alongCurveWithin` (along-curve regularity),
supplier contract; R3 first variation and compact-interval section spaces.

### R3.2. Finite broken geodesics and path CW models

For a connected complete manifold with its given smooth Riemannian metric, fixed endpoints
p,q, a positive energy bound c and subdivision t₀<⋯<t_r, put T=t_r−t₀>0.
Define the continuous discrete energy on all finite tuples first:
`E_Δ(x₁,…,x_(r−1))=½Σ_(j=1)^r dist(x_(j−1),x_j)²/(t_j−t_(j−1))`,
with x₀=p and x_r=q. The finite vertex manifold is the open subset
`E_Δ<c` of M^(r−1). Prove openness from continuity of distance before
constructing any short-geodesic interpolation.

Prove discrete Cauchy–Schwarz and the triangle estimate
`dist(p,x_j)≤Σ_(i=1)^j dist(x_(i−1),x_i)≤√(2T E_Δ)<√(2Tc)`.
Define admissibility `Adm(c,t)` to mean: c>0, t is strictly increasing
with these endpoints, and there exist ρ>0 and a compact closed ball
centered at p with radius greater than `√(2Tc)+ρ`, on which ρ is below
SBC B6.0's uniform normal/strong-convexity bounds, with
`max_j(t_j−t_(j−1))<ρ²/(2c)`. Hopf–Rinow properness and B6.0
supply such bounds; sufficiently fine subdivisions are admissible. Prove
admissibility is preserved under decreasing the positive cutoff and
under subdivision refinement with the same time endpoints. Each
nonnegative energy summand then
gives `dist(x_(j−1),x_j)²≤2E_Δ(t_j−t_(j−1))<ρ²`.
Specify the open pair-normal domain
`{(x,y):x∈B(p,√(2Tc)), dist(x,y)<ρ}`, including its diagonal.
B6.0 supplies smooth logarithms/segments there using the larger compact
ball and its margin. Thus each edge in the energy carrier belongs to
this domain. Only then construct the unique short minimizing
segments and prove smooth dependence on both endpoints using SBC B6.0.
For compact M also construct one global radius supplying smooth short
segments for every pair at distance<ρ. DGFloer owns its closed-loop
energy-cut and distance-cut carriers using that interpolation. These
compact-set radius bounds precede R4's injectivity-radius function.

For two admissible subdivisions with one refining the other, construct
the geodesic-insertion map from coarse to fine and vertex-forgetting map
from fine to coarse. Prove insertion preserves discrete energy exactly
and forgetting does not increase it. Compare cutoffs by inclusion, and
prove these maps and their homotopies commute with further refinement;
different finite products are related by maps, not identified as subsets.
Prove the energy-cutoff path
sublevel deformation retracts to the corresponding broken-geodesic sublevel by
straightening each segment, with continuity and nonincreasing energy. Prove every
compact family in the piecewise C¹/H¹ path topology is captured by some
subdivision/cutoff; continuous compact families in the compact-open carrier
first use a relative parametric smoothing/finite-energy comparison. Prove
independence/refinement comparisons. These are Milnor §16 finite objects.
Construct CP^d/HP^d examples using R1's normalized Hopf-submersion metrics.
The general finite-vertex construction takes any complete smooth metric as
input, including R1's complete invariant metrics.
Prove that critical points of the energy on the finite vertex manifold are
in bijection with geodesics p→q on [t₀,t_r] of energy<c, in both
directions, and that the Hessian is R3's node-value index matrix (Milnor
16.2–16.3). Prove every admissible subdivision satisfies the strongly
convex subdivision hypothesis of that reduction at every such geodesic.
The general Jacobi/index APIs are supplied here.
Consume MorseTheory M1–M2's native critical-point/index/chart comparisons,
compact-band deformation and simultaneous finite critical-level cell attachments
(Milnor Theorems 3.1–3.5 and Remark 3.4). Verify their compact-band hypotheses
for each finite vertex energy carrier, and prove the attaching maps and relative
homotopies commute with the path-space and subdivision comparisons. R4 consumes
the same supplier for its no-critical-value/minimax step.

For every strict energy cutoff a<c prove compactness of its sublevel inside
the open carrier E_Δ<c of an Adm(c,t) subdivision. For nonconjugate endpoints derive that critical
points are nondegenerate and isolated, and that there are finitely many in
each compact band and countably many overall. Prove Milnor Theorem 17.3: a CW
model with one λ-cell per geodesic of index λ. Consume MorseTheory M2's
compatible-cell/telescope and Milnor Lemmas 3.6–3.7 extension machinery for
the increasing cutoff/subdivision sequence; prove all refinement attachment
and sublevel homotopies commute with its telescope maps.
Pin the ordinary fixed-endpoint carrier as native `Path p q` with topology
induced from `ContinuousMap I M`; compare it with DGFloer's standing
Moore-path carriers, by fixed-interval reparametrization and explicit
length-change/retracing homotopies. It is metrizable here, so k-ification preserves
its topology. Compact-family capture gives a weak equivalence from the CW
model. Consume AT8.11a's finite-source based-pair mapping-space CW-type
targets `finiteSourceMappingCWType` and `basedLoopCWType`
(Milnor 1959) for loops at p, using the interval endpoint pair
and the marked CW pair (M,{p}). Consume AT8.11a's comparison of fixed-interval
loops with its Kelley mapping carrier and its relative interval-product
homotopy comparison. The native sequential-space instance and
`eq_compactlyGenerated` identify k-ification with the original topology on
these metrizable path spaces. R3 constructs its sphere suspension range from
its Morse filtration.
[GeometricTopology](../GeometricTopology/README.md)'s smooth-triangulation theorem
(Whitehead: every smooth manifold admits a smooth triangulation) supplies a smooth
triangulation. Construct here its finite marked-point
refinement: for every finite set F of distinct points of M, refine the locally
finite triangulation so that each point of F is a vertex. In the simplex whose
relative interior contains a chosen point, stellar subdivision at that point,
extended over its star, preserves the underlying polyhedron and all existing
vertices; finitely many such refinements suffice. Restricting each smooth simplex
to the new affine simplices preserves smooth triangulation. The vertex-only
subcomplex on F realizes exactly F, so the resulting homeomorphism identifies
(|K|,|F|) with (M,F). Prove compatibility with inclusions of marked subsets and
transport through MorseTheory M1's smooth model-change atlas equivalence.

- The refinement retains local finiteness and gives the same topology on M.
- The marked subcomplex has no positive-dimensional simplices and realizes exactly F.
- The marked-pair homeomorphism agrees with the original triangulation off the subdivision maps.

**Checks.**

- An interior point of an edge in a triangulated circle becomes a vertex; the
  containing edge splits into two and the underlying circle is unchanged.
- For F empty the original triangulation and pair (M,∅) suffice.
- Two distinct points inside one edge give three subedges and two distinct
  marked vertices; identifying them would change the marked pair.

*Needs:* GeometricTopology's smooth-triangulation theorem (Whitehead); AlgebraicTopology
Stage 4.1 (CW pairs); the finite stellar subdivision constructed here.
 Use the endpoint-change equivalence
below to obtain CW type for paths p→q, then AT's Whitehead comparison
upgrades the weak equivalence to a homotopy equivalence. Own all parametric
smoothing/finite-energy comparison maps used to enter this ordinary carrier.
For a chosen path η from p to q, construct the endpoint-change homotopy
equivalence between loops at p and paths p→q by concatenation with η and
its reversal, with explicit reparametrization/retracing homotopies and topology
comparisons; the equivalence depends on η.

**Checks.**

- On a flat line with vertices 0,1/2,1 at times 0,1/2,1, the discrete
  energy is 1/2, equal to the affine segment's energy; omitting the
  time denominators would give 1/4.
- With coincident vertices the discrete energy is zero and the interpolation
  is constant. Strictly increasing times are still required to divide by their gaps.
- On the unit circle, antipodal adjacent vertices have two minimizing arcs;
  an admissible subdivision excludes that pair by its strict normal-radius
  bound. Merely bounding the number of vertices would not ensure a smooth interpolation.

*Needs:* R3.1 finite-energy paths; SmoothBundlesConnections B6.0;
MorseTheory M1–M5; GeometricTopology smooth triangulation and the marked
refinement above; AlgebraicTopology Stage 8.11a.

### R3.3. Nonconjugate round-sphere paths, in three independent branches

Keep the ordinary path carrier, chosen endpoints and endpoint-change maps fixed throughout these calculations. The full result uses the three constructions below; the n = 2 argument is not a premise of the n ≥ 3 construction or of circle winding.

Their conclusion for loops is the headline `singularHomology_loopSpace_sphere`: for n ≥ 2 and a point p of the unit Sⁿ, the integral singular homology of `Path p p` is ℤ in every degree divisible by n − 1 and 0 in every other degree. R3.3a gives the case n ≥ 3 and R3.3c the case n = 2; R3.3b shows why n = 1 is excluded. The statement for every n ≥ 2 is Hatcher, *Algebraic Topology*: Theorem 4J.1, p. 471, makes ΩΣX weakly homotopy equivalent to the James reduced product J(X) for a connected CW complex X, here X = Sⁿ⁻¹ with ΣSⁿ⁻¹ = Sⁿ, and Proposition 3C.8, p. 288, identifies H_*(J(X); ℤ) with the tensor algebra on H̃_*(X; ℤ) when H_*(X; ℤ) is free, here one ℤ in degree n − 1, so one ℤ in each degree divisible by n − 1. The Morse-theoretic branches below are this roadmap's route to it.

#### R3.3a. Lacunary cells in dimensions n ≥ 3

For the unit round Sⁿ, n ≥ 3, fix p, q with q neither p nor −p and angle θ ∈ (0, π). The two oriented great-circle arcs and their extra full turns have lengths θ + 2πk and 2π − θ + 2πk. The Jacobi/index comparison gives indices 2k(n − 1) and (2k + 1)(n − 1), and no nullity at these nonconjugate endpoints. The finite broken-geodesic critical-band theorem and coherent exhaustion therefore give exactly one cell in every dimension j(n − 1), j ≥ 0, on the ordinary path CW-type model. Since n − 1 ≥ 2, no cells have adjacent dimensions and every cellular boundary is 0. Hence integral Hᵢ is ℤ in multiples of n − 1 and 0 otherwise. Use the CW/homology colimit for the unbounded exhaustion. There is no 1-cell, so the based path model is simply connected by the relative-cell connectivity theorem. Endpoint change by a chosen reference path transports this to ΩSⁿ. In particular ΩS³ has free integral homology ℤ in even degrees and is simply connected. The n = 2 Hopf comparison (R3.3c) and the n = 1 winding branch (R3.3b) are separate consumers, never premises here.

#### R3.3b. Winding components for the circle

Use the native real covering of `Circle` with period 2π, after the designated round-S¹ homeomorphism. For fixed endpoint angle θ, lift every path starting at the fixed real lift; its endpoint lies at θ + 2πk for a unique integer k. General parameter covering homotopy lifting makes the endpoint label locally constant. In each k fibre, straight interpolation between two real lifted paths fixes both endpoints and contracts it to the linear path; descent gives the contraction of that ordinary path component. Thus the path carrier has the homotopy type of the discrete integers, H₀ is the direct sum of one ℤ per winding and all higher homology vanishes. The label is the native winding/fundamental-group generator, with concatenation convention compared. This does not import a higher-sphere or n = 2 Hopf calculation.

#### R3.3c. The n = 2 Hopf comparison

Use the designated native complex projective line and the unit sphere of ℂ², compared to the real S³ by the real-linear isometry (Re z₀, Im z₀, Re z₁, Im z₁). The map z ↦ ℂ·z is the principal circle Hopf bundle. On the projective chart z₀ ≠ 0, w = z₁/z₀, use the section (1, w)/√(1 + |w|²) and fibre coordinate z₀/|z₀|; on z₁ ≠ 0 use the analogous section. Prove the inverse and transition formulas, joint continuity/smoothness and fibrewise free transitive right action. These local trivializations construct the fibre-bundle projection, hence the native Serre lifting predicate; no final projective cohomology or circle Chern classification is a prerequisite.

The map from CP¹ to the unit S² descends from
`h(z)=(2 Re(conj(z₀)z₁), 2 Im(conj(z₀)z₁), |z₀|²−|z₁|²)`.
Compute its squared norm as (|z₀|² + |z₁|²)² = 1 and its exact circle fibres. The two affine chart/stereographic inverse formulas prove bijectivity, continuity and smoothness of both directions. Alternatively compact-to-Hausdorff gives the homeomorphism before the chart smooth comparison. Pin [1:0] to the north pole; the displayed chart has positive complex orientation at that pole. A different conjugation convention reverses its orientation and must be compared explicitly. This is a pointed homeomorphism/diffeomorphism needed by homotopy; no unproved equality of FS and round metric normalizations is imported.

Apply the Hopf long exact homotopy sequence. For ΩS³ the independent n ≥ 3 lacunary CW argument (R3.3a) gives a cell in each nonnegative even dimension and none in odd dimensions, so its integral homology is ℤ in even degrees and 0 in odd degrees, and π₁(ΩS³) = 0. Its CW model also has exactly one 0-cell, hence is connected; the native zero-loop comparison then identifies π₁(S³) as trivial, without using the n = 2 result. Do not use the n = 2 calculation here. The Hopf sequence supplies the connecting homomorphism π₂(S²) → π₁(S¹), computed by disc lifting; combine it with the native loop shift π₁(ΩS²) ≃ π₂(S²). No globally chosen continuous path-lifting function ΩS² → S¹ is assumed. The adjoint of the normalized raw suspension homeomorphism ΣS¹ → S² gives a based continuous map s : S¹ → ΩS². Compute the connecting homomorphism on its adjoint sphere by the explicit Hopf clutching function: its winding is ±1 (pin the sign from the preceding charts), so the induced map on the π₁ groups is an isomorphism. This computation is the degree/winding step; it is not implied by numerical cell counts.

Multiply s with the loop of the Hopf projection to define S¹ × ΩS³ → ΩS². The Hopf sequence and the native higher asphericity of S¹ give isomorphisms in every higher homotopy group, while the winding calculation gives π₁ and connectedness gives π₀. The map is a weak equivalence on the CW-type/compact-generation models, so the independent DGFloer weak-equivalence homology comparison applies. The integral Künneth formula has no Tor term here because H_*(S¹; ℤ) and the already computed H_*(ΩS³; ℤ) are free. It yields H_j(ΩS²; ℤ) = ℤ for every j ≥ 0, not a general assertion that all fibration homologies split. Native circle winding/fundamental group and the raw-suspension and product/Tor floors precede this step. Preserve the separate integer winding components for n = 1 and the original lacunary proof for n ≥ 3, and retain all antipodal Bott, geometric suspension, and later James/EHP programmes independently.

Every map above has the specified basepoints, ordinary-loop/concatenation comparison and naturality to the owned path CW/H1 models. Its generic Hopf-bundle and CP¹ chart inputs remain with their existing SmoothBundlesConnections, ComplexKahlerGeometry and native owners; the R3 application adds the n = 2 homology argument, not another general projective-space or classifying-space theory. 

The n = 2 construction consumes the preceding independent n ≥ 3 lacunary branch and the circle winding/higher-asphericity interfaces. It does not consume an all-dimensional sphere-path homology theorem containing its own conclusion. Only after all three constructions are complete assemble the all-dimensional nonconjugate path result, with endpoint-change and cellular generators compared. R1 retains the separate metric-normalization comparison for its CP¹ example; no Fubini–Study/round metric equality is a premise of this pointed topological Hopf bridge.

On the equator w = e^(iθ), the displayed chart sections satisfy s₁ = s₀·w⁻¹. Compute the boundary winding using that transition together with the oriented disc-boundary convention in DGFloer's connecting map; record its sign against AlgebraicTopology's interval-last suspension homeomorphism. If the chosen generator requires the opposite sign, apply the explicit inversion on S¹ rather than suppressing the sign. The magnitude-one winding supplies the required π₁ isomorphism. Construct the ordinary-loop product map with the constant loop at every designated basepoint, and compare its induced product homomorphism with (x, y) ↦ s_*x + (ΩHopf)_*y using the loop unit and reparametrization homotopies.

**Stereographic Hopf circles and the quotient disk.** Compare this same
bundle with its orbit picture in real three-space: the stereographic images
of the Hopf fibres are pairwise linked circles filling ℝ³ together with one
line (Lyons, *An elementary introduction to the Hopf fibration*, section
"Seeing the Hopf fibration", Investigations (L) and (M) and Figure 10, arXiv v1
pp. 13–15: (L) gives the line and the circles, (M) their pairwise linking; Lyons projects
from a point of the axis fibre and uses quaternion coordinates, which the
chart below transports to the complex coordinates of R3.3c). Set P=(0,i) in
S³⊂ℂ² and use the stereographic chart
`σ(z₀,z₁)=(Re z₀,Im z₀,Re z₁)/(1−Im z₁)` from P. Construct its smooth
inverse and its extension identifying S³ with the one-point compactification
of ℝ³. For 0<r<1, the sets |z₁|=r are product tori: use
`(z₀,z₁)=(√(1−r²)e^(iα),r e^(iβ))` to prove the diagonal Circle orbits
have slope(1,1). Prove their stereographic images are embedded circles.
Handle |z₁|=0 and |z₁|=1 as the two exceptional coordinate-circle fibres:
the former is the unit circle in the xy-plane, and the latter is the
z-axis together with the compactification point P. These circles and tori
exhaust S³ and give the stated picture in ℝ³, retaining the axis as a line
there rather than asserting it is a Euclidean circle.

For the closed complex unit disk, the inverse image of its inclusion in
the xy-plane is
`j(u)=(2u/(1+|u|²),i(|u|²−1)/(1+|u|²))`.
Prove j has values in S³, σ(j(u))=(Re u,Im u,0), and every orbit with
z₁≠0 meets j(int D²) exactly once: for |u|,|v|≤1 some ζ in Circle has
`ζ·j(u)=j(v)` exactly when u=v or |u|=|v|=1, and every point of S³ is
`ζ·j(u)` for some ζ and some u with |u|≤1. Its boundary is precisely the
entire z₁=0 fibre. Construct the continuous bijection
`D²/∂D²→CP¹`, induced by u↦ℂ·j(u), and prove it is a homeomorphism
using compactness and the Hausdorff projective model. Compare this map
with the preceding CP¹≃S² charts. This identifies the actual orbit quotient,
including the collapsed boundary, rather than another abstract sphere.

The disk centre corresponds to [0:1], which the preceding h sends south.
Use the specified orientation-preserving rotation
`R(x,y,z)=(x,−y,−z)` and H=R∘h for the picture with centre called north,
so `H(z₀,z₁)=(2Re(conj(z₀)z₁),−2Im(conj(z₀)z₁),|z₁|²−|z₀|²)`.
Prove H is a smooth submersion and its north fibre is L={z₀=0}. At
(0,z₁)∈L its normal vectors `(z₁/2,0)` and `(i z₁/2,0)` map under dH
to the standard ordered tangent basis at north; prove they give the
normal-bundle trivialization supplied by the differential. The picture's
infinity P lies in L, so use the distinct source marked point b=(1,0) and
target marked point H(b)=south for the based framed fibre, with regular
value north; P remains the stereographic infinity. The general Hopf bundle
stays with the preceding suppliers.

**Checks.**
- `|j(u)|²=(4|u|²+(|u|²−1)²)/(1+|u|²)²=1` for every u; `j(0)=(0,−i)` and
  `j(u)=(u,0)` when |u|=1, so the disk centre lies over [0:1] and the
  boundary circle is the z₁=0 fibre. The lift with the opposite sign in
  the second coordinate, `(2u,i(1−|u|²))/(1+|u|²)`, also lies in S³ but
  sends the centre to P, the one point σ does not chart.
- On j(u), `1−Im z₁=2/(1+|u|²)`, hence `σ(j(u))=(Re u,Im u,0)`: the chart
  returns the disk to itself. P=(0,i) is the only point with 1−Im z₁=0.
- Orbit relation: for |u|<1 the second coordinate of j(u) is `−is` with
  `s=(1−|u|²)/(1+|u|²)>0`, so `ζ·j(u)=j(v)` forces |u|=|v| and then ζ=1
  and u=v; for |u|=1 the orbit of j(u)=(u,0) is the whole fibre {(ζu,0)}.
  The open disk alone misses that fibre, and the closed disk without the
  boundary collapse is not injective on orbits.
- On |z₁|=r the orbit of `(√(1−r²),r)` is `(√(1−r²)e^(iθ),re^(iθ))`, the
  diagonal (α,β)=(θ,θ) of the torus; at r=0 and r=1 the tori degenerate
  to the two exceptional fibres.
- `H(0,ζ)=(0,0,1)` for |ζ|=1 and `H(1,0)=(0,0,−1)`; without the rotation
  R, h sends L to the south pole. At (0,ζ), dH applied to (ζ/2,0) is
  `(2Re(conj(ζ/2)ζ),−2Im(conj(ζ/2)ζ),0)=(1,0,0)` and applied to
  (iζ/2,0) is `(2Re(conj(iζ/2)ζ),−2Im(conj(iζ/2)ζ),0)=(0,1,0)`; the
  third component vanishes because `|z₁|²−|z₀|²` is stationary in z₀ at
  z₀=0. Listing the two normal vectors in the other order reverses the
  orientation of the framing.

*Needs:* R3.3c (the Hopf bundle, its charts and the map h), Mathlib `Circle`
and its scalar action, `EuclideanSpace`, and the stereographic charts of the
sphere.

### R3.4. Antipodal Morse–Bott attachments and suspension

For antipodal endpoints
on Sⁿ, n≥2, construct the critical S^(n−1) family for each length (2k+1)π,
prove index 2k(n−1), nullity n−1 and negative normal bundle
`(TS^(n−1))^(⊕2k)`, and apply MorseTheory M5's finite-dimensional
Morse–Bott attachments on this carrier. Verify that the geodesic-direction
map into the vertex tuple is a smooth embedding, that the Hessian kernel is
exactly its tangent bundle, and that each regular band is compact and has
only the indicated isolated critical family. Prove the negative bundle is oriented:
its determinant is an even tensor power of det(TS^(n−1)), with the canonical
paired orientation. For the critical family of index λ=2k(n−1), state the
integral band relative homology as `H_i(band_upper,band_lower;ℤ)≃
H_(i−λ)(S^(n−1);ℤ)`. The family of shortest antipodal geodesics gives
`S^(n−1)→Path(p,−p;Sⁿ)`. Using AT8.1's relative-cell connectivity theorem
and subsequent attachment indices≥2(n−1), prove this inclusion induces
π_q isomorphisms for q≤2n−4 and a surjection for q=2n−3 (n≥3).
Consume [CharacteristicClasses C2.0](../CharacteristicClasses/README.md#c2-thom-euler-and-gysin-theory)'s
`bundleDiskSphereRelCW` and `bundleDiskAttachmentCWModel` for the negative bundles on the
critical families, verifying all new relative cells have dimension ≥2(n−1).
Carry the commuting square and component/homotopy isomorphisms from this
relative CW model to each actual regular energy sublevel when applying
AT8.1's transport theorem. Start with Z₀=S^(n−1), with its 0-cell and
(n−1)-cell, and construct Z_k inductively by C2.0 from Z_(k−1) and the
next M5 negative-bundle attachment. Construct compatible maps from these
models to the finite energy sublevels. Pass the connectivity ranges to the
whole Path(p,−p) by compact-family capture both of sphere maps and of their
relative null-homotopies; nonconjugacy is not used for this Morse–Bott tower.

Consume DGFloer Layer 2 item 3's ordinary sphere/loop evaluation and
currying, with its based homotopy naturality and native loop comparisons.
Define j:S^(n−1)→ΩSⁿ to be the curry of AT4.4's actual raw
`reducedSuspensionSphereHomeomorph`, using its interval-last convention.
For the shortest-geodesic family pin p=e₀, the direction sphere
`{0}×S^(n−1)⊂ℝ^(n+1)`, v₀=e₁ and
γ_v(t)=cos(πt)p+sin(πt)v. Concatenate γ_v with reverse γ_(v₀).
Rectify the loop at v₀ to the constant loop by its explicit retracing
homotopy and the sphere-basepoint cofibration. Compare the adjoint with
the unreduced meridian quotient followed by collapse of the reference
meridian. With outward-first sphere generators and interval coordinate
last, prove its degree is (−1)^(n+1). Normalize by reflecting the e₂
direction coordinate, fixing v₀, exactly when n is even. Prove the resulting
adjoint has degree +1 and is based homotopic to the chosen raw sphere
homeomorphism. Thus the normalized minimum-family map is based homotopic
to j after endpoint change. Use the native loop homotopy-group equivalence
`pathLoopSpaceMulEquiv` to identify j_* with the suspension homomorphism
π_q(S^(n−1))→π_(q+1)(Sⁿ), including the degree and basepoint equations.
This supplies the Morse proof of the sphere Freudenthal range independently;
stable homotopy calculations are outside this roadmap.

**Checks.**

- Degree at n=2: the adjoint sends (v,s) with s∈(0,½) to cos(2πs)e₀+sin(2πs)v,
  and the reverse half lies on the meridian of v₀=e₁ in span(e₀,e₁). The point
  e₂ of S² avoids that meridian and has the single preimage v=e₂, s=¼. There the
  outward-first basis of S¹⊂span(e₁,e₂) is −e₁, since det(e₂,−e₁)=1, and the
  interval-last basis (−e₁,∂_s) goes to (−e₁,−e₀) up to positive factors. With
  outward normal e₂ and the basis (e₀,e₁,e₂), det(e₂,−e₁,−e₀)=det(e₂,e₁,e₀)=−1,
  so the degree is −1=(−1)^(2+1). n is even, so the e₂ reflection, of degree −1
  on S¹ and fixing v₀=e₁, is applied and the normalized degree is +1.
- Degree at n=3: at v=e₂, s=¼ the outward-first basis of S² is (e₃,e₁), since
  (e₂,e₃,e₁) is a cyclic, hence even, reordering of (e₁,e₂,e₃); its image is
  (e₃,e₁,−e₀), and det(e₂,e₃,e₁,−e₀)=−det(e₂,e₃,e₁,e₀)=+1 in the basis
  (e₀,e₁,e₂,e₃), the reordering being a 4-cycle, hence odd. The degree is
  +1=(−1)^(3+1) and no reflection is applied. With the interval coordinate first
  instead of last, the sign changes by (−1)^(n−1) and the degree would be +1 for
  every n, so the convention is what makes the parity rule.
- Index of the critical families: for antipodal endpoints the geodesics of
  length 3π (k=1) pass the interior conjugate parameters π and 2π, each of
  multiplicity n−1, so the index is 2(n−1); the final endpoint 3π is conjugate
  and adds n−1 to the nullity, not to the index, and counting it would give
  3(n−1). For n=2 and k=1 this is index 2 on a circle family.
- Connectivity range at n=3: S²→ΩS³ must give π₂(S²)=ℤ→π₂(ΩS³)=π₃(S³)=ℤ an
  isomorphism (q=2≤2n−4) and π₃(S²)=ℤ→π₃(ΩS³)=π₄(S³)=ℤ/2 only a surjection
  (q=3=2n−3), the Hopf map going to the generator; an isomorphism at q=2n−3
  is false.

### Examples

On a flat interval of length L, the affine path from p to q has
energy |q−p|²/(2L). On the unit circle, endpoint angles 0 and π/2 admit
lengths |π/2+2πk|, k∈ℤ, separating the winding components.

### Dependencies

R3 uses R2 and HopfRinow first variation; its finite subdivision uses
SmoothBundlesConnections B6.0. Its CW/path comparisons use MorseTheory M1–M5,
GeometricTopology smooth triangulation, AlgebraicTopology Stages 4 and 8,
CharacteristicClasses C2.0 and DGFloer Layer 1 item 2. The topology comparison
uses the pinned compact-generation results and AlgebraicTopology §8.11a. R3.1's
H¹ paths use Tau Ceti's interval weak derivatives, absolutely continuous curves,
smooth exponential map on the tangent bundle, along-curve regularity and fixed-chart
formula.

## Layer 4: comparison and geodesic multiplicity

### R4. Comparison, complete manifolds and space forms

1. Prove the index comparison/minimizing lemma for Jacobi fields with fixed
   endpoint values. The model sine `s_κ(t)=sin(√κt)/√κ`, t, or
   `sinh(√(−κ)t)/√(−κ)` according to the sign of κ is Tau Ceti's
   `TauCeti.curvatureSine` (supplier contract), on which `rauch_norm_ge_of_sectional_le`
   and `modelBallVolume` are stated. For unit-speed γ and
   normal Jacobi J with J(0)=0, prove `K≤κ ⇒ |J(t)|≥s_κ(t)|D_tJ(0)|`
   before the first positive model zero (`rauch_norm_ge_of_sectional_le`:
   the data live on [0,b] with b>0, the bound
   `⟨R(u,v)v,u⟩≤κ(|u|²|v|²−⟨u,v⟩²)` holds for every pair of tangent vectors
   at every point, J(0)=0 and D_tJ(0)⊥γ′(0), and b<π/√κ when κ>0; the
   conclusion is `s_κ(t)|D_tJ(0)|≤|J(t)|` for every t∈[0,b]; Eschenburg,
   *Comparison Theorems in Riemannian Geometry*, §3, Rauch I, p. 14, the
   special case of Theorem 3.3, p. 13, with the curvature-κ model as the
   comparison solution and J as the other); for K≥κ prove the reversed bound
   before conjugacy of γ and the model zero. Include the two-manifold Rauch
   statement with equal initial derivative norms and curvature ordered along
   the compared normal planes. State equality as the curvature equation along
   the corresponding parallel/Jacobi directions; equality for all initial
   normal directions gives the model pullback metric and local isometry.

   The model function API comprises: `s_κ''+κs_κ=0` with `s_κ(0)=0`,
   `s_κ'(0)=1`, from Tau Ceti's derivative formulas; `s_κ>0` on (0,π/√κ) for
   κ>0 and on (0,∞) otherwise, with first positive zero π/√κ exactly when κ>0;
   the scaling law
   `s_(κ/c²)(ct)=c·s_κ(t)` for c>0; and monotonicity in κ, `s_κ(t)≤s_λ(t)`
   for λ≤κ and t in the common positivity range.

   **Checks.**

   - `s_0(3)=3`, `s_1(t)=sin t` and `s_(−1)(t)=sinh t`; at t=π/2 the three
     values for κ=1,0,−1 are 1, π/2 and sinh(π/2)≈2.3013, increasing as κ
     decreases.
   - `s_4(t)=sin(2t)/2` has first positive zero π/2 and `s_4'(0)=1`; the
     wrong normalization `sin(κt)/κ` would give first zero π/4 and the wrong
     model `sin(√κ t)` would give `s'(0)=√κ=2`.
   - On the sphere of radius 5/2 (K=4/25) compared with κ=1, the Jacobi field
     J=(5/2)sin(2t/5)E vanishes at t=5π/2 where s_1=1: the inequality
     `1≤0` fails there, so the guard b<π/√κ is needed; on [0,b] with b<π
     the bound `sin t≤(5/2)sin(2t/5)` holds, as at t=π/2 where 1≤1.4695.

   On a smooth normal-distance domain derive radial Hessian zero and the
   corresponding transverse lower/upper bounds by `(s_κ'/s_κ)g`, together
   with the Laplacian trace and the scalar sign dictionary. There let S be the
   Hessian endomorphism of r on the orthogonal complement of grad r; in a
   parallel trivialization along each unit-speed radial geodesic γ prove
   `S′+S²+R(·,γ′)γ′=0` and `tS(t)→Id` in operator norm as t↓0, and derive the
   lower bound under radial `K≤κ` and the upper bound under radial `K≥κ` by
   comparison with `s_κ'/s_κ`, before the first positive model zero. Prove
   that r² extends smoothly across p with `Hess(r²)_p=2g_p`, and that under
   radial `K≤κ` the Hessian of r² is positive definite on every such normal ball
   of radius below `π/(2√κ)` when κ>0, and on every such ball when κ≤0. Derive Günther
   lower-volume comparison from sectional upper bounds: on connected complete M
   with K≤κ, at p use 0<r<inj(p), and also r<π/√κ when κ>0, to conclude
   Vol_g(B(p,r))≥Vol_κ(B_κ(r)) in the model of the same dimension. The headline
   `guenther` states it with the hypothesis that exp_p is injective on the
   tangent ball of radius r, which on a complete manifold holds exactly when
   r≤inj(p), so the statement needs no injectivity-radius carrier (Kwong,
   *Quantitative comparison theorems in Riemannian and Kähler geometry*,
   Theorem 10(2), p. 27: under K≤κ, for r below the first positive zero of s_κ,
   the volume density in geodesic polar coordinates is at least s_κ(r)^(n−1),
   which integrated over the ball inside the injectivity radius is Günther's
   inequality, cited there as Gray, *Tubes*, Theorem 3.17). Treat the
   low-dimensional cases directly. For radial comparisons beyond this full-ball
   range retain the actual cut-time-truncated polar domain; cut-locus nullity
   does not remove its radial truncation. Distinguish Bishop–Gromov global
   relative-volume monotonicity from Ricci lower bounds. Use the Jacobi
   determinant/Riccati equation, trace Cauchy–Schwarz and model s_κ to prove
   the radial density inequalities before integrating. Supply radial-Jacobian,
   polar-integration bridges, consuming R4.6’s cut-locus carrier and
   volume-nullity theorem.
   **Ricci lower bounds and relative volume, after the radial and cut-locus constructions.**

   Let M be a connected complete n-dimensional smooth Riemannian manifold, n ≥ 2, with Ric ≥ (n−1)κg. For the model volume Vκ(r), prove Vol(B(p,r))/Vκ(r) is nonincreasing for positive radii before the positive-curvature model pole, with the usual constant-curvature model domain (Zhu, *The comparison geometry of Ricci curvature*, Theorem 3.1, p. 226, and Corollary 3.3(1), p. 228; `bishopGromov`: with `modelBallVolume κ n r = ∫_0^r s_κ(t)^(n−1) dt`, the model ball volume divided by the volume of the unit (n−1)-sphere, the statement is `Vol(B(p,s))/Vκ(s) ≤ Vol(B(p,r))/Vκ(r)` for 0<r≤s, and s<π/√κ when κ>0, with the Ricci hypothesis `Ric(v,v)≥(n−1)κ|v|²` on every tangent vector; the Lean statement carries no dimension hypothesis, because in dimensions 0 and 1 the model volume is r and the ratio is nonincreasing directly for a point, the line and the circle). In particular for κ=0 it is nonincreasing for all r>0 and at most one after normalizing by ω_n rⁿ.
Supply annulus/restricted-polar versions, the small-ball limit 1, measure-zero cut locus, arbitrary center, density/metric pullback and scaling comparisons. State positive-curvature maximal radii explicitly. Do not substitute a sectional Rauch hypothesis for Ricci lower bounds.

   The model ball volume API comprises: `Vκ(0)=0`, `Vκ` is continuous and
   strictly increasing on [0,π/√κ) for κ>0 and on [0,∞) otherwise, with
   derivative `s_κ(r)^(n−1)`; `V₀(r)=rⁿ/n` for n≥1; and the scaling law
   `V_(κ/c²)(cr)=cⁿ·Vκ(r)` for c>0, n≥1.

   **Checks.**

   - n=2, κ=0: `V₀(r)=r²/2`, which is the disc area πr² divided by the
     circle length 2π; a definition with exponent n instead of n−1 would give
     r³/3.
   - n=2, κ=1: `V₁(r)=1−cos r`, the spherical cap area 2π(1−cos r) divided by
     2π; at r=π this is 2, the whole unit sphere's area 4π over 2π.
   - n=3, κ=0: `V₀(r)=r³/3`, the ball volume 4πr³/3 over the unit-sphere area
     4π; n=1 and n=0 both give `Vκ(r)=r` since the natural-number exponent
     n−1 is 0.
   - On the unit two-sphere (Ric=g, κ=1) the ratio `Vol(B(p,r))/V₁(r)` is the
     constant 2π for r<π, while the flat normalization `Vol(B(p,r))/r²` is
     2π(1−cos r)/r², equal to 2.888, 2.224 and 1.273 at r=1, 2, π,
     nonincreasing as the κ=0 case of the theorem requires; on the hyperbolic
     plane (Ric=−g, outside the κ=0 hypothesis) `2π(cosh r−1)/r²` is 3.41 at
     r=1 and 4.34 at r=2, increasing, so the Ricci hypothesis is not removable.


   Proof programme: on the star domain before first cut, let J(t,θ) be the positive normal exponential Jacobian, A its shape/Riccati endomorphism and h=tr A. From the Jacobi equation derive `h′+tr(A²)+Ric(γ′,γ′)=0`, hence `h′+h²/(n−1)+(n−1)κ≤0` by trace Cauchy–Schwarz. Use the small-t asymptotic `J/t^(n−1)→1` to prove `J/s_κ^(n−1)` nonincreasing. Set J=0 beyond the cut time; this adds only downward jumps. Prove measurability and the native density/polar change of variables on the cut-truncated domain. Integrate over one and the same angular unit sphere and then radially; the elementary ratio-of-integrals lemma yields the ball ratio. Prove the n=1 interval/circle cases separately; no vacuous Ricci plane condition gives Euclidean rigidity there.

   Construct the following equality API, also consumed by PositiveMass §2.3. Equality of the flat volume ratio on all positive radii forces equality of the radial densities a.e.; smoothness on the star domain upgrades it there. The Riccati inequality has equality, so A=(1/t)Id and the radial metric is Euclidean before cut. Prove absence of a finite cut obstruction from the equality of density and the actual cut/conjugate/loop alternative, and construct the complete local-isometry covering from the exponential model. Show any nontrivial covering identification strictly reduces the full ball volume, so equality yields a global Euclidean isometry. For equality only up to a radius, retain the actual normal-domain/radius hypotheses and ball conclusion; do not infer global flatness. PositiveMass §2.3 supplies its separate asymptotically Euclidean large-ball lower limit and combines it with this comparison and the small-ball limit; neither positive-mass theory nor a zero-mass hypothesis is an input to the present comparison.

2. On a connected complete noncompact manifold, prove a ray exists from every
   point by compactness of initial unit directions and a limit of minimizing
   segments. For p∈M let M_p be its connected component, carrying the restricted smooth
   Riemannian structure and its finite intrinsic length metric. Assume that
   metric is complete. If N is a nonempty closed embedded submanifold of M
   and N∩M_p is nonempty, prove the intrinsic distance from p to N∩M_p is
   attained, and every minimizing segment to that intersection meets N
   orthogonally. Prove the usual statement when M is connected and complete
   as a specialization. Points of N in other components are not competitors
   for this finite intrinsic distance. In particular R disjoint-union R, with
   p in one component and N the other component, has no such minimizing
   segment; closedness/nonemptiness alone is insufficient. Construct the
   component's open smooth restriction and metric comparison explicitly,
   rather than assuming a globally finite Riemannian length distance between
   disconnected components.
   Include first variation with a moving endpoint, consuming R3's corner formula.
3. Prove a local Riemannian isometry from a nonempty complete manifold to a
   connected manifold is a surjective covering. Use finite-length path lifting
   and proper closed balls, and prove pullback metrics preserve length, curvature
   and completeness on Riemannian coverings. Prove the related covering criterion
   for a local diffeomorphism with `|df(v)|≥|v|` and complete domain.
   A surjective local isometry with an incomplete domain need not be a covering;
   compute the punctured-line→circle example.
   **Complete pullback metrics and the universal covering manifold.**

   Let p:E→M be a surjective topological covering of connected finite-dimensional Hausdorff second-countable boundaryless smooth real manifolds, with E carrying the smooth atlas pulled back from M, so p is a local diffeomorphism. For a smooth positive Riemannian g on M, the metric g_E(v,w)=g(dp(v),dp(w)) is Tau Ceti's `Bundle.ContMDiffRiemannianMetric.pullback` along p (supplier contract), smooth and positive because dp is injective; it is consumed here. Prove the projection is a local Riemannian isometry and that lengths, energy, the Levi–Civita connection and Jacobi fields are preserved in each sheet; the curvature tensor, sectional and Ricci curvature are preserved by Tau Ceti's naturality theorems for local Riemannian isometries (supplier contract), so local curvature and Ricci inequalities pull back with their exact constants and dimension.

   If M is complete, prove E is complete without assuming it. A base geodesic extends for every real time by Hopf–Rinow. Lift its restrictions on compact intervals from a given sheet point; covering uniqueness makes these lifts compatible on overlaps, and the native smooth-lift/local-isometry comparison makes the glued lift a geodesic with the chosen initial velocity. Thus E is geodesically complete. On each connected component the converse Hopf–Rinow gives completeness for the induced finite length metric. For connected E this is the required metric, with unchanged manifold topology. A disconnected cover is treated componentwise; no finite cross-component distance is installed.

   For the based-path universal cover, consume Tau Ceti's `TauCeti.UniversalCover` carrier and projection, its covering theorem for locally path-connected and semilocally simply connected spaces, simple connectivity and path connectivity. The native covering theorem permits empty fibres outside the based component; connected manifolds are path connected, giving surjectivity here. Small coordinate balls provide the local hypotheses. Its smooth atlas, pulled back along the projection, and the local-diffeomorphism property of the projection are Tau Ceti's `TauCeti.UniversalCover.instChartedSpace`, `TauCeti.UniversalCover.instIsManifold` and `TauCeti.UniversalCover.isLocalDiffeomorph_proj` (supplier contract); no alternative total-space topology is used.

   The bijection of the basepoint fibre with the fundamental group is Tau Ceti's `TauCeti.UniversalCover.fiberEquivFundamentalGroup` (supplier contract), a bijection and not a group isomorphism, which is all that is needed here. SmoothBundlesConnections B5.2 makes π₁ countable for connected,
   second-countable, locally path-connected, locally simply connected spaces;
   coordinate balls verify the last two hypotheses here. Over a countable evenly covered basis, there are countably many sheets (each fibre is in bijection with the basepoint fibre by path lifting); their chart bases give second countability of the universal cover. Prove Hausdorffness using either distinct base neighborhoods or disjoint sheets over the same point. This establishes the actual standing manifold hypotheses before applying Riemannian results upstairs; R4.3 owns this second countability and Hausdorffness and the completeness of the pullback metric below.

   The conditional conclusion, that π₁ is finite when the universal cover is compact, is Tau Ceti's `TauCeti.UniversalCover.finite_fundamentalGroup_of_compactSpace` (supplier contract), which needs only closed points of the base: the basepoint fibre is closed, discrete by the covering theorem and so finite, and the fibre bijection transfers finiteness. Myers's theorem (R4.5) supplies the compactness hypothesis only after applying its sine-index diameter bound upstairs. The cover construction neither invokes Myers to construct or complete the cover nor assumes finite π₁; this separates the early construction from the R4.5 conclusion. This argument does not use cover classification, K(G,1), higher homotopy or a finite-π₁ hypothesis in constructing the cover. Pullback metrics along cover morphisms and base isometries have the expected functoriality.

4. Cartan–Hadamard (`cartanHadamard_isCoveringMap`): on connected M, K≤0 and completeness imply exp_p is a covering from T_pM (Nicolaescu, *Lectures on the Geometry of Manifolds*, Theorem 6.2.6, p. 238).
   Its norm-nondecreasing differential, `|w|≤|d(exp_p)_v(w)|` for every v in
   `expDomain` and every w, is Tau Ceti's
   `TauCeti.Manifold.norm_le_norm_mfderiv_riemannianExp_of_sectionalCurvature_nonpos`
   (supplier contract); completeness makes `expDomain` all of T_pM, so exp_p is a
   local diffeomorphism from the complete flat T_pM satisfying the hypothesis of the
   preceding covering criterion, which gives the covering. The simply connected specialization gives
   a global smooth exponential diffeomorphism, a unique geodesic between any
   two points at fixed affine parametrization (which is minimizing), and
   contractibility; a general connected manifold has Euclidean universal-cover
   topology and is aspherical. State nonemptiness and the basepoint explicitly.
   *Needs:* Tau Ceti
   `TauCeti.Manifold.norm_le_norm_mfderiv_riemannianExp_of_sectionalCurvature_nonpos`
   (norm-nondecreasing exponential differential), R4.3 (covering criterion),
   HopfRinow (Completed) Layer 4 (completeness).
5. Bonnet–Myers (`bonnetMyers_distance`): for connected complete n≥2 and
   `Ric(v,v)≥λ|v|²` with λ>0, prove diameter≤π√((n−1)/λ), compactness and finite
   fundamental group at every basepoint (`myers_finite_fundamentalGroup`)
   (Nicolaescu, *Lectures on the Geometry of Manifolds*, Theorem 5.2.26,
   p. 220, with λ=(n−1)/r², for the diameter bound and compactness; Example 6.2.29,
   p. 243, for compactness of the Riemannian universal cover, from which R4.3's
   fibre finiteness gives finite `π₁`). Sum the sine-test-field index forms along a minimizing
   geodesic, then apply the same bound to the Riemannian universal cover.
6. Define `inj(p)=sup{r≥0 | exp_p restricts to a diffeomorphism from
   the tangent open r-ball onto the metric r-ball}`, valued in [0,∞], and
   `inj(M)=inf_p inj(p)`. Construct the cut locus on the shared exponential and
   minimizing-geodesic carriers. On connected complete M prove that
   `dist(p,q)<inj(p)` gives a unique minimizing geodesic from p to q at fixed
   affine parametrization, including the constant geodesic when p=q; hence
   the same conclusion holds when `dist(p,q)<inj(M)`. On connected complete M prove cut-time
   continuity on the unit tangent sphere bundle, valued in (0,∞], and
   cut-time characterization by first
   conjugacy or loss of uniqueness, closedness/measurability and volume-nullity.
   The conjugate values of p are the critical values of `exp_p` on `T_pM`, a
   differentiable map between manifolds of the same dimension, so they are
   chartwise null by `TauCeti.isNullSet_image_criticalPoints`; the critical
   set is closed in `T_pM`, so its image is σ-compact and measurable. Cover
   the remaining locus by countably
   many pairs of nonsingular inverse-exponential branches; their equal-distance
   locus is a regular hypersurface because distinct minimizing geodesics have
   distinct terminal velocities. Prove chart nullity, including the
   infinite-cut-time convention. Own the transfer of chartwise nullity to the
   Riemannian volume: a subset of M that is `TauCeti.IsNullSet` has
   `TauCeti.riemannianVolume` zero, because countably many chart sources cover
   M, the volume of a measurable subset of a chart source is the integral of
   the continuous chart density over its chart image
   (`TauCeti.chartRiemannianVolume_apply`), and a Haar-null chart image lies
   in a Borel null set whose preimage in the chart source is measurable;
   conversely a subset of a chart source of Riemannian volume zero has
   Lebesgue-null chart image, the chart density being positive. Hence the cut
   locus of p has Riemannian volume zero. Prove the cut
   relation is closed and symmetric and that squared distance is smooth
   off this relation, including its smooth extension across the diagonal.
   Supply the smooth polar-coordinate domain and full-measure integration
   comparison needed by R4.1. OptimalTransport Layer 7 consumes these geometric
   objects and owns its semiconcavity and measurable selections. Consume SBC
   B6.0's positive uniform normal radius on compact manifolds to prove
   `inj(M)>0`. Minimize length in each free homotopy class
   on a closed compact manifold using arclength parametrization, Arzelà–Ascoli, lower semicontinuity and
   uniform normal-neighborhood homotopies;
   a nontrivial class gives a nonconstant closed geodesic. Prove Synge's compact connected
   even-dimensional oriented positive-sectional-curvature theorem (`synge`:
   compact connected orientable M of even dimension with `⟨R(u,v)v,u⟩>0` on
   every linearly independent pair is simply connected; dimension zero is
   included, a point being simply connected; Bishop, *Riemannian Geometry*,
   Theorem 7.9, p. 50) using
   holonomy, an odd-dimensional special-orthogonal fixed vector and the closed
   index variation. Include the odd-dimensional orientability consequence
   (`synge_orientable_of_odd`: compact connected M of odd dimension with the
   same curvature hypothesis is orientable; Bishop, Problem 7.11, p. 50) and
   the real-projective counterexamples distinguishing the hypotheses: RP² has
   K=1 and fundamental group ℤ/2 and is excluded only by orientability; the
   flat torus is orientable with fundamental group ℤ² and is excluded only by
   strict positivity; RP³ has K=1, is orientable and has fundamental group
   ℤ/2, so in odd dimension the conclusion is orientability, not simple
   connectivity.
   The even-dimensional conclusion is simple connectivity.
   The injectivity-radius API includes isometry invariance, positive local
   normal radius, the uniqueness statement below the radius, and the cut-time
   characterization above (Nicolaescu, *Lectures on the Geometry of
   Manifolds*, Definition 4.1.23, p. 151, for the injectivity radius; Lee,
   Chapter 10, section on cut points, for the cut-time characterization).

   **Checks.**

   - On ℝⁿ, exp_p(v)=p+v and every radius works, so inj(p)=∞.
   - On the circle of circumference 2π, inj(p)=π: distances less than π have
     one minimizing arc; the antipode at π has two. A non-strict inequality
     would assert false uniqueness.
   - On unit Sⁿ, n≥2, inj(p)=π and the antipode has transverse conjugate
     multiplicity n−1; the metric scaled by 4 has inj(p)=2π.
   - On ℝⁿ with the identity chart and the flat metric, chartwise nullity is
     Lebesgue nullity and the Riemannian volume is Lebesgue measure (chart
     density 1), so the transfer changes nothing. A transfer that read nullity
     in the chart at one point only would miss the part of a set outside that
     chart's source: on S¹ the antipode of p lies outside a chart at p whose
     source omits it, so nullity is quantified over every chart.
   - On the flat square torus ℝ²/ℤ² the cut locus of the image of the origin
     is the image of the two segments x=½ and y=½: closed, of total length 2,
     so nonempty and not discrete, yet of Riemannian area zero; its image in
     the unit-square chart is two segments, Lebesgue null. On unit S² the
     critical values of `exp_p` are p and its antipode: `|v|=π` maps to the
     antipode and `|v|=2π` back to p, each with singular differential, so the
     set is two points, and volume-nullity records neither the antipode's
     conjugate multiplicity n−1=1 nor the return to p.

   *Needs:* HopfRinow Layers 2–4; R2 (differential of exp); R3 (index);
   SmoothBundlesConnections B6.0; Tau Ceti `TauCeti.isNullSet_image_criticalPoints`
   (Sard in equal dimensions), `TauCeti.IsNullSet` and
   `TauCeti.chartRiemannianVolume_apply` (null-set transfer).

7. Consume the existing `TauCeti` round-sphere RiemannianBundle and
   `Riemannian/Hyperbolic.lean`, `Hyperbolic/UpperHalfSpace/Basic.lean` objects and
   GT Layer 7’s `HyperbolicMetric`; compare with GT Layer 8's native
   `ModelGeometry.Space` in dimension 3. The curvature +1 of the round unit sphere,
   the curvature 1/r² of the round metric of radius r>0 and the curvature −1 of the
   half-space metric `(|dx|²+dt²)/t²` are Tau Ceti's
   `TauCeti.hasConstantSectionalCurvature_sphere`,
   `TauCeti.hasConstantSectionalCurvature_sphereRoundMetricOfRadius` and
   `TauCeti.UpperHalfSpace.hasConstantSectionalCurvature` (supplier contract),
   consumed here. Develop the missing model formulas in all n≥2:
   Euclidean, round sphere and hyperbolic space (hyperboloid, half-space and ball), including
   explicit isometries, geodesics and exponential maps, the curvature −1 of the
   hyperboloid and ball models, and the scaling of geodesics and exponential maps
   with the radius.
   This direct model construction is independent of R3 and R4's comparison
   theorems. The round-sphere Levi-Civita connection is the tangential
   projection of the ambient derivative: this is Tau Ceti's Gauss formula
   `CovariantDerivative.IsLeviCivitaConnection.inner_apply_eq_inner_mvfderiv`
   applied to the inclusion Sⁿ→ℝⁿ⁺¹, whose differential preserves inner products
   by `TauCeti.inner_tangentSpace_sphere` (supplier contract), consumed here.
   R4.7 derives the great-circle geodesics from it: for orthonormal p,v the curve
   t↦cos t·p+sin t·v has ambient acceleration −γ(t), which is normal to the
   sphere, so its covariant acceleration vanishes. It precedes
   R1's projective curvature/period calculations and R3's projective examples;
   the global space-form classification below uses the remaining R4 machinery.
   Use type synonyms carrying the induced Riemannian distance via
   `TauCeti.MetricSpace.ofRiemannianMetric` for connected models, with the
   compatible `EMetricSpace.ofRiemannianMetric`/edist version for disconnected
   carriers, and prove `IsRiemannianManifold`; the sphere’s
   subtype chordal metric needs this comparison. Native `UpperHalfSpace`
   already has its Riemannian distance; consume it. Pin the ball metric
   `4|dx|²/(1−|x|²)²` on |x|<1 and prove K=−1 for it.
   The isometry groups of Euclidean space, the affine isometries with the orthogonal
   group as isotropy at the origin (`TauCeti.RiemannianIsometry.affineIsometryMulEquiv`,
   `TauCeti.RiemannianIsometry.stabilizerZeroMulEquiv`), of the round unit sphere, the
   orthogonal group (`LinearIsometryEquiv.unitSphereIsomMulEquiv`, from
   `LinearIsometryEquiv.unitSphereIsomHom_surjective`), and of the half-space model,
   the similarities `(x,t)↦(cAx+b,ct)` and their composites with one boundary-centred
   inversion
   (`TauCeti.UpperHalfSpace.exists_eq_similarity_or_exists_eq_inversion_mul_similarity`),
   acting transitively (`TauCeti.UpperHalfSpace.isPretransitive_isom`), are Tau Ceti's
   (supplier contract) and consumed here. R4.7 owns the semidirect-product
   identification E(n)=ℝⁿ⋊O(n) of the affine isometry group, by translation part and
   linear part, and the identification of the isometry group of the hyperboloid model
   with O⁺(n,1), with its action on the future unit hyperboloid.
   On the hyperboloid restrict the fixed ambient Lorentz form to its tangent
   hyperplanes and prove positivity; construct the Riemannian metric and compute
   its connection directly rather than applying a Riemannian ambient immersion
   theorem to an indefinite ambient form. Build continuation and monodromy of
   local constant-curvature isometry germs from their value/tangent data, using
   completeness to continue along finite paths and simple connectivity to
   remove path dependence.
   Prove the Killing–Hopf universal-cover classification (`killingHopf_euclidean`,
   `killingHopf_sphere`, `killingHopf_hyperbolic`: a connected complete simply
   connected Riemannian manifold modelled on ℝⁿ with constant sectional
   curvature 0, 1 or −1 is isometric to Euclidean n-space, to the unit sphere
   of ℝ^(n+1), or to the upper half-space model of hyperbolic n-space with the
   metric `(|dx|²+dt²)/t²`; the spherical case needs n≥2, since the line
   satisfies the curvature hypothesis vacuously for n=1 and is not a circle,
   and the hyperbolic case needs n≥1 so that the two dimensions agree, while
   the Euclidean case holds for every n, a point and the line included;
   Barzen–Leymann, *Mathematics of Spacetime*, Theorem 9, p. 60, with the
   hyperboloid sheet as the model of curvature −1) and the quotient
   description by free properly discontinuous discrete smooth isometries.
   For a free properly discontinuous group of smooth isometries of any Riemannian
   manifold, none of the following needs constant curvature: the quotient atlas is
   Mathlib's `MulAction.instChartedSpaceQuotient` and the orbit projection is a
   covering by Mathlib's `isQuotientCoveringMap_quotientMk_of_properlyDiscontinuousSMul`;
   the quotient is a smooth manifold with the projection a local diffeomorphism by
   Tau Ceti's `TauCeti.instIsManifoldQuotient` and `TauCeti.isLocalDiffeomorph_quotientMk`;
   and the descended metric, for which the projection is a local Riemannian isometry,
   is Tau Ceti's `Bundle.ContMDiffRiemannianMetric.quotient` with
   `Bundle.ContMDiffRiemannianMetric.isLocalRiemannianIsometry_descend` (supplier
   contracts). Curvature, sectional and Ricci curvature, and so their pointwise
   bounds, descend because the projection is a local Riemannian isometry, by Tau Ceti's
   `TauCeti.IsLocalRiemannianIsometry.mfderiv_curvatureTensor`,
   `TauCeti.IsLocalRiemannianIsometry.sectionalCurvature_mfderiv` and
   `TauCeti.IsLocalRiemannianIsometry.ricciTensor_mfderiv`. R4.7 consumes these and owns
   what goes beyond them: completeness of the quotient metric when the source is
   complete. Specialize this generic quotient to the preceding
   space-form classification and to free finite-group actions on closed manifolds
   used by PDO P7a.
   Extend Tau Ceti's `TauCeti.RiemannianIsometry.ext_of_mfderiv_eq`, stated for
   Riemannian isometries, to local Riemannian isometries: two local Riemannian
   isometries M→N of a connected boundaryless source with the same value and
   differential at one point agree on M. Classify even-dimensional spherical space
   forms as the sphere and real projective space; the round-sphere isometry group
   entering this classification is the supplied orthogonal group. For real projective space consume AlgebraicTopology Stage 4.6's
   native projectivization, coordinate-atlas and CW comparison; identify the
   generic isometric quotient with that carrier and descend the round metric.
   **The round real-projective quotient, with low-dimensional and orientation branches.**

   For every n ≥ 0 use the native unit sphere in `EuclideanSpace ℝ (Fin (n+1))` with its antipodal integer-unit action and Tau Ceti's orbit quotient `TauCeti.RealProjectiveSpace` n. The native projection is continuous, surjective, a quotient covering map and identifies x and y exactly when x = y or x = −y; its compactness/path-connectedness/unique-zero-dimensional carrier are existing declarations. Construct its comparison with AlgebraicTopology AT4.6's native `Projectivization` ℝ (Fin (n+1) → ℝ), after the `WithLp` linear homeomorphism. Send a unit vector to its one-dimensional span. Surjectivity chooses a nonzero vector on the line and normalizes it; if two unit vectors span the same line the real scalar has absolute value 1, hence is ±1. The induced quotient bijection is continuous, and compact-to-Hausdorff gives the homeomorphism. Pin representative, inverse, topology and basepoint equations. This comparison is an owned construction, not supplied by the mere generic quotient theorem.

   In the projective chart with coordinate i nonzero choose its unit representative with positive i-th coordinate. The affine ratio vector gives the explicit smooth section, with normalizing denominator √(1 + Σ ratios²) > 0. Compare it with the lifted smooth antipodal-cover atlas and AT's designated projective atlas by these coordinate maps; the identity is a diffeomorphism and no second projective manifold/topology is installed. The antipodal action is a smooth round isometry, free even on S⁰. The generic Riemannian quotient/pullback metric then descends the round metric, and in each local sheet sectional curvature equals 1 for n ≥ 2. In dimensions 0 and 1 the sectional statement has no two-plane test and is vacuous; no positive-Ricci Myers hypothesis is inferred there. Compactness is from the sphere quotient, before any classification of complete space forms.

   For n ≥ 1 the connected sphere is oriented by the outward-normal-first orientation. The antipodal map on the ambient ℝⁿ⁺¹ has determinant (−1)ⁿ⁺¹; its boundary-sphere degree is the same sign. Prove the normal/tangent orientation comparison, not determinant(-Id on a fixed abstract n-plane), which would give the wrong exponent. A quotient orientation pulls back to an invariant sphere orientation; conversely an invariant orientation descends in the covering charts. On connected Sⁿ every orientation differs by one global sign, so an orientation-reversing deck transformation obstructs every descent. Thus RPⁿ is orientable exactly for odd n when n ≥ 1. RP⁰ is a single point and is orientable separately. This is a concrete quotient/parity comparison, not a full Stiefel–Whitney or Killing–Hopf classification input.

   For n ≥ 2 consume Tau Ceti's `TauCeti.RealProjectiveSpace.fundamentalGroupMulEquivAt` n hn x to the integer units, with hn : 2 ≤ n, and transport it by the preceding homeomorphism. The source's unqualified π₁ = ℤ/2 must keep that guard. RP¹ is the circle with fundamental group `Multiplicative ℤ` via the native line comparison (or the explicit double-angle circle quotient and native winding theorem); RP⁰ is the unique point with trivial π₁. Compare chosen lifts/monodromy and antipodal deck labels, with the opposite harmless only because the two-element deck group is commutative. Do not confuse `Nat.card` = 0 in the n = 1 case of the cardinality trichotomy with an empty fundamental group. All three dimension branches remain required.

   Complete connected dimension 1 manifolds are a line or a circle with
   its circumference parameter; dimension 0 is a point, independently of κ.

   **Checks.**

   - Ball normalisation: for c|dx|²/(1−|x|²)² in dimension two, φ=½log c−log(1−r²)
     has Δφ=4/(1−r²)², so K=−e^(−2φ)Δφ=−4/c. The pinned c=4 gives K=−1; dropping
     the 4 gives K=−4.
   - Ball distance: from 0 to x it is `∫_0^|x| 2/(1−t²)dt=log((1+|x|)/(1−|x|))`,
     which is log 3≈1.0986 at |x|=½. The hyperboloid-to-ball map
     x↦(x₁,…,x_n)/(1+x₀) sends (cosh d, sinh d, 0,…) to tanh(d/2), whose ball
     distance from 0 is d; at d=log 3 the image has |x|=(3−1)/(3+1)=½, agreeing
     with the first value.
   - Hyperboloid metric: at (cosh s, sinh s, 0,…) the tangent vector
     (sinh s, cosh s, 0,…) has Lorentz square −sinh²s+cosh²s=1, so the restricted
     form is positive there and t↦(cosh t, sinh t, 0,…) has unit speed; the
     Euclidean square cosh 2s of the same vector would make that curve's speed
     unbounded, so the ambient Euclidean metric is the wrong model.
   - Sphere-to-projectivization comparison: e₁ and −e₁ span the same line, the
     scalar being −1, and e₁ and (e₁+e₂)/√2 span different lines; sending a unit
     vector to its ray ℝ₊x instead would separate e₁ from −e₁ and give back the
     sphere.
   - Orientation parity: the antipodal map of Sⁿ has degree det(−Id on ℝⁿ⁺¹)=(−1)ⁿ⁺¹,
     +1 for n=1 (RP¹ is a circle, orientable), −1 for n=2 (RP² is not orientable)
     and +1 for n=3 (RP³ is orientable). The wrong model det(−Id on ℝⁿ)=(−1)ⁿ
     would make RP¹ nonorientable and RP² orientable.
8. For every pair p≠q on a connected compact boundaryless Riemannian manifold
   of dimension at least one, prove `two_distinct_geodesics`: there are geodesics
   γ,η on [0,1], both starting at p and ending at q, with γ(t)≠η(t) for some
   t∈[0,1]. For simply connected M this is a special case of Morse's theorem
   (*The Calculus of Variations in the Large*, Theorem 13.3, p. 239, as recalled
   in Caponio–Javaloyes, *A remark on the Morse theorem about infinitely many
   geodesics between two points*, §1, p. 1): on a complete connected manifold
   whose based loop space has nonzero homology in infinitely many degrees, any
   two points are joined by infinitely many geodesics, and Serre's theorem
   supplies that hypothesis for a compact simply connected manifold of positive
   dimension, whose top mod-2 homology is nonzero (the wider clause of
   Caponio–Javaloyes, §1, p. 1, every compact manifold, needs the simple
   connectivity).
   For nontrivial π₁(M) the loop-space hypothesis fails in general (on the
   circle and the flat torus the based loop space is homotopy equivalent to the
   discrete group π₁(M), with homology in degree 0 only) and the two geodesics
   come from distinct lifted path classes, as in the route below. Their
   extensions outside [0,1] are irrelevant. An increasing affine
   self-reparametrization fixing 0 and 1 is the identity, so this distinguishes
   oriented geodesics rather than arbitrary extensions or affine rescalings.
   Specify the equivalence as oriented paths up to increasing affine
   reparametrization, allowing distinct traversals of the same closed curve.
   Build the finite-dimensional Lusternik–Schnirelmann/minimax critical-point
   existence lemma using R3’s no-critical-value deformation, including
   degenerate critical points. Apply it on R3’s finite energy-cutoff approximations and compact-family
   capture/path-sublevel comparison. Supply the topology bridge explicitly:
   a closed positive-dimensional manifold is noncontractible by fundamental
   class/duality (mod 2 without orientation). If all homotopy groups vanished,
   DGFloer Layer 1 item 2's homology invariance under weak equivalence would
   give the mod-2 homology of a point, contradicting that class. The based-loop isomorphism
   `π_k(ΩM)≃π_(k+1)(M)` transfers it to the fixed-endpoint path space. Consume
   R3's ordinary path carrier and DGFloer's standing Moore comparison, AT’s CW, homology
   and duality objects, R3's endpoint-change equivalence and its actual CW/path
   homotopy comparison, proving these specific bridges here.
   Nontrivial fundamental group already gives distinct lifted path classes.
   Prove the minimax dichotomy: either the class has critical value strictly
   above the minimum, or the minimum critical set contains more than one
   geodesic. If its only minimum were one geodesic, a sufficiently small
   sublevel would lie in a contractible coordinate neighbourhood, killing
   the nonzero class transported by the no-critical-band deformation.
   A singular exponential differential alone does not integrate a Jacobi field
   into a fixed-endpoint geodesic family.


### R4.9. Three simple closed geodesic images on a smooth two-sphere

For every smooth positive-definite Riemannian metric g on the standard smooth S², construct three distinct nonconstant embedded closed geodesic images. Identify all changes of parametrization and reversal, so neither a multiple traversal nor an orientation change gives another image. Allow degenerate closed geodesics and nonisolated geodesic families. Transport the theorem along an actual smooth diffeomorphism to an abstract smooth two-sphere: the headline `three_simple_closed_geodesics` takes any smooth manifold diffeomorphic to the standard two-sphere with any smooth Riemannian metric and produces three periodic geodesics, each injective on one period, with pairwise distinct images (the Lyusternik–Shnirel'man theorem as stated and proved in Taimanov, Izv. RAN Ser. Mat. 56:3 (1992), 605–635, abstract; English translation Russian Acad. Sci. Izv. Math. 40:3 (1993), 565–590). Construct the following curve-space, finite-family and relative-homology APIs before the multiplicity theorem.

*Needs:* R4.6 (injectivity radius, short geodesics), R3 (geodesic ODE, second variation), ConformalMapping (Completed) L3/L5, GeometricMeasureTheory G1/G3–G6, Isoperimetry I3/I6, CharacteristicClasses C1.5/C2/C3, AlgebraicTopology Stage 6, DifferentialGeometry 5.6, Mathlib `Besicovitch.exist_disjoint_covering_families`.

Notation in this section is scoped. V is the curve-image/point space and A its point locus; V_space denotes the spacing balls. The width c, contact component c_contact, selected-side area A_side, annulus area A_ann, graph coefficient A_par and graph error E_diff have separate meanings. Use B_len for a length ceiling, a_cover for the component-cover class, a_cut for the positive clock cutoff, a_diff for diffusion, L_min for a positive length floor, K_gauss for Gaussian curvature, K_c for the critical image set and K_image for a compact parameter image. Q_disk is the Thom disk bundle, Q_graph the graph curvature expression and Q_low the low-length sublevel. The round ambient chord is D_ch; the arbitrary-metric sine comparison is ψ_CA, its ratio is β_CA and the family-clock cutoff is χ_clock; inside code spans Greek letters are spelled out by name. The endpoint labels are A_endpt,B_endpt; the normal-graph metric bounds G_min,v_max are positive numerical box constants, while g₀ is the round metric. Defect scale η_def, V-neighborhood radius η_V, spacing radius C_space, local ε allowances and their declared time windows are fixed in the clause using them.

#### R4.9.0. Rectifiable simple-curve space and length topology

Let V consist of rectifiable Jordan curve images and point-curves A={p:p∈S²}. Use the generic GMT length and arclength carriers. For Jordan parametrizations define the unoriented Fréchet distance d_F by the infimum of sup_t d_g(γ(t),η(h(t))) over circle homeomorphisms of either orientation, and extend it to constants by the corresponding constant maps. Put d_V(C,D)=d_F(C,D)+|L_g(C)−L_g(D)|. Prove independence of parametrization, triangle inequality and definiteness, including comparisons with compact-image Hausdorff distance. Identify A as a closed copy of S², prove length continuous, and construct the quotient-valued continuous constant-speed arclength representative on each positive-length band, with local representatives taken modulo rotations and reversal. Prove this from Fréchet matching, subarc lower semicontinuity and convergence of total lengths; image Hausdorff convergence alone is insufficient. At constants prove uniform diameter collapse. Use this definite metric for all later families and deformations; no completeness, manifold or CW-type assumption on V is required. For any Fréchet match by a circle homeomorphism h, approximate h uniformly by piecewise-linear circle homeomorphisms h_n of the same orientation; if η is Lipschitz, then η∘h_n is Lipschitz and its image differs from η∘h by at most Lip(η)·||h_n−h||∞. Use this approximation whenever a winding or index supplier is stated only for absolutely continuous/Lipschitz reparametrizations, with the positive distance from the tested point to the image preserved by choosing n large. Also prove the Riemannian metric-derivative identity: for every Lipschitz γ:I→(S²,d_g), md(γ,t)=|γ′(t)|_g for almost every t. In a smooth normal chart, compare d_g on a sufficiently small neighborhood with the frozen norm g_(γ(t)); the distortion tends to 1 as the neighborhood shrinks, and the metric derivative agrees with the norm of the chart derivative at Lebesgue points. Thus GMT’s metric variation equals ∫|γ′|_g for the Lipschitz parametrizations used below; the piecewise-smooth Hopf–Rinow length formula alone is not enough.

- Reparametrization and reversal leave d_F, length and d_V unchanged.
- The point locus inherits d_g and is closed; length is 1-Lipschitz for d_V.
- On a positive-length band, Fréchet-plus-length convergence gives convergence
  of constant-speed representatives modulo rotation and reversal.

**Checks.**

- Two point-curves p,q have d_V(p,q)=d_g(p,q); at p=q this is zero.
- A round circle at colatitude r from the north pole has distance
  r+2π sin r from that point-curve, tending to zero as r↓0.
- A Jordan parametrization and its reversal have d_V=0, although their
  same-parameter uniform distance may be positive. An oriented metric would
  incorrectly distinguish those representatives.

*Needs:* GeometricMeasureTheory G1/G6 (rectifiable curves and arclength);
HopfRinow Layer 0 (intrinsic distance); R4.6 (normal charts). The length term
is part of the definition, independent of later shortening or minimax.

#### R4.9.1. The two-sheet component cover and point avoidance

For a nonconstant C decorate it by either complementary component of S²\C. Over a point p retain two formal tags (p,empty) and (p,full), with the point remembered. Construct an actual two-sheeted cover E→V with locally constant sheet permutations and cocycle laws. Near a Jordan curve choose test points on its opposite sides, use a smooth stereographic chart from one of them and a compact chart neighborhood, and apply the supplied planar Jordan/index/proximity theorems to parametrized Fréchet matches. Prove that nearby curves still separate the test points and that overlap labels agree or exchange continuously.

Near a constant use a small coordinate ball and a distant test point. Show that a sufficiently short curve in that ball has its small component in the coordinate convex hull; its other component contains the distant point. Extend these labels to the empty/full tags, with compatible transitions to nonconstant charts. Prove continuity of the empty section on A. Using trace area zero, winding stability of component indicators and dominated convergence, prove the component-area comparison and a uniform ε>0 for which each curve of length<ε has a unique component of area<Area_g(S²)/2. This gives a section of E over V^(<ε) extending the empty section on A, without requiring a contraction of the whole short-curve space.

For each p set V_p={C:p∉image(C)}, including constants q≠p. Prove it open and construct a continuous section on V_p by choosing the component not containing p, and empty at constants. Prove this in the cover charts, including the actual locally constant agree/exchange transition to the short-curve section on overlaps.

**Checks.**

- The equator has two hemisphere decorations, each of area 2π in the
  round metric; equal area does not identify the two sheets.
- A point-curve retains two tags of areas 0 and 4π. Omitting the point
  from a tag would collapse the whole point locus to two elements.
- A sufficiently small round latitude has a cap of area
  2π(1−cos r)<2π; a tested point in the opposite cap selects this small
  component. Crossing the curve changes the selected side, so avoidance
  of the tested point is necessary.

*Needs:* R4.9.0; ConformalMapping L3/L5; DifferentialGeometry 5.6 and
GeometricMeasureTheory G1/G6 (Jordan components, index and area-null trace).

#### R4.9.2. Relative cover class and finite Thom detection

Construct the absolute singular mod2 class a_cover∈H¹(V;F₂) of this cover and the relative lift α∈H¹(V,A;F₂) fixed by the empty section. Construct these directly on singular cochains: choose lifts at vertices agreeing with empty on A, assign the endpoint discrepancy of lifted paths, and use lifting over singular triangles to prove the cocycle law. Prove independence by a relative coboundary, naturality and image(α)=a_cover. Compare with the associated real line on finite models, rather than apply a CW-type classification theorem to arbitrary V.

Let Q_disk=D(γ¹) over RP² be the finite tautological disk bundle `(v,t)~(−v,−t)`, v∈S², −1≤t≤1, with boundary S(γ¹)≃S². Define q:Q_disk→V by the round plane circle `{x:v·x=t}`, sending |t|=1 to the point t v. Prove Fréchet-plus-g-length continuity with local frames, including uniform length collapse at the boundary for arbitrary g. The selected side `{x:v·x>t}` gives empty at t=+1 and full at t=−1; its exchange identifies the pulled-back cover with the orientation cover of π*γ¹. The boundary empty frame is t v. Prove q*a_cover=π*w₁(γ¹) and q*α=τ, the mod2 Thom class, by its fiber-interval value 1 with those endpoint frames.

Use the ordinary finite RP²/cup/Thom theorem to prove image(τ)=π*w₁, τ²=π*w₁∪τ and τ³=π*w₁²∪τ, with the powers interpreted by the absolute-image cup action on the relative group. Prove ⟨π*w₁²∪τ,[Q_disk,∂Q_disk]⟩=1. Define z₃=q_*[Q_disk,∂Q_disk], z₂=a_cover∩z₃, z₁=a_cover²∩z₃ in H_i(V,A;F₂). Use the absolute cup/relative cap module action and prove ⟨α,z₁⟩=1. Thus all three classes are nonzero and subordinate. The finite model supplies the calculation; no homotopy equivalence V≃RP³ or parametric Schoenflies theorem is a premise.

**Checks.**

- On one fibre interval of the tautological disk bundle, its two boundary
  empty frames differ by sign; the relative class evaluates to 1 in 𝔽₂.
- The empty frame trivializes the cover on the point locus, so the relative
  cocycle is zero on simplices wholly in that locus.
- With u the degree-one class of RP², ⟨u²,[RP²]⟩=1 and u³=0, while
  the Thom pairing ⟨π*u²∪τ,[Q_disk,∂Q_disk]⟩=1. Replacing this relative
  pairing by u³ on the base would give zero and lose the third class.

*Needs:* R4.9.1; CharacteristicClasses C1.5/C2/C3; AlgebraicTopology Stage 6.

#### R4.9.3. Positive widths and finite parameter carriers

Define c_i as the infimum over finite relative singular-cycle representatives of z_i of the maximum length on their compact support. The explicit finite model gives c₃<∞. Construct support-preserving subdivision and cap representatives to prove c₁≤c₂≤c₃. The short-curve section trivializes α relatively to A on V^(<ε); its nonzero pairing with z₁ gives c₁≥ε>0.

Construct a finite cycle-to-polyhedron-pair adapter for the chosen three minimax cycles, of dimension≤3: realize the finite singular-cycle face identifications as a finite polyhedral pair, triangulate it compatibly with the relative faces mapping into A, and construct its evaluation map to V. From this chosen carrier derive the matching singular-simplex maps, relative chain representatives and subdivision/chain homotopies on the existing AT singular carrier. Prove that these maps represent the original relative class and preserve the dimension bound; use this same finite polyhedral carrier for the parameter embedding and shortening. Only these finite parameter carriers need a polyhedral model; do not assume V has finite CW type or identify arbitrary singular cycles with an unspecified cube-family notation.

**Checks.**

- In the round metric the circle family has maximum length 2π, so it
  gives c₃≤2π. All nonconstant simple round geodesics have length 2π,
  and the realization theorem therefore gives c₁=c₂=c₃=2π.
- Scaling g to 4g multiplies every representative's maximum length by 2;
  hence all three widths double, to 4π in the round example.
- A relative chain supported entirely on the point locus has maximum
  length 0 and relative class 0, so it cannot represent any z_i.

*Needs:* R4.9.2; AlgebraicTopology Stage 6 cap products, relative chains and
subdivision. The round equality is an acceptance example using R4.9.7,
not an input to positivity of widths.

#### R4.9.4. Approximate geodesics with equality of limiting length

Fix 0<η_def<inj_g(S²)/4 using R4.6. For C of positive length, let D_(η_def)(C) be the supremum of arcLength−d_g(endpoints) over connected subarcs of arclength≤min(η_def,L(C)/2), using its constant-speed representative. Prove nonnegativity and continuity in d_V on positive bounded-length bands. Defect zero means every sufficiently short arc minimizes distance.

If 0<L_min≤L(C_j)≤B_len, L(C_j)→c and D_(η_def)(C_j)→0, prove uniform subsequential convergence of constant-speed representatives modulo rotation/reversal. For short parameter intervals the limiting endpoint distance equals c times interval length. Deduce a nonconstant constant-speed locally minimizing geodesic, smooth by the geodesic ODE at every point including the periodic seam, with length exactly c. Lower semicontinuity alone does not prove that equality. The compactness conclusion applies to this specified small-defect class.

The geodesic-defect API comprises:

- It is independent of rotation, reversal and choice of constant-speed representative.
- It is nonnegative, bounded above by min(η_def,L/2), and continuous on
  every positive bounded-length band in d_V.
- It vanishes precisely when all arcs in its defining length range minimize
  distance; under g↦a²g and η_def↦aη_def, for a>0, it scales by a.

**Checks.**

- A unit-round great circle has defect 0 for 0<η_def<π/4: every tested arc
  of length s has endpoint distance s.
- For the latitude of colatitude π/6 on the unit sphere, L=π and an arc
  of length s≤η_def<π/4 has endpoint distance arccos(3/4+cos(2s)/4).
  Its defect is η_def−arccos(3/4+cos(2η_def)/4)>0; the difference increases
  with s. The identically zero definition fails this example.
- Replacing g by 4g and η_def by 2η_def doubles both arc lengths and endpoint
  distances, so the preceding positive defect becomes exactly twice its value;
  a dimensionless quotient of length and distance fails this scaling test.

*Needs:* R4.9.1 constant-speed representatives and Fréchet-plus-length topology;
R4.6 injectivity radius; HopfRinow local minimizing segments and geodesic ODE.
The compactness route uses equicontinuity, compactness of S² and the endpoint
length equality on short intervals, without any parabolic-flow theorem.


#### R4.9.5. Simplicity, primitive traversal and critical-set localization

Exclude transverse crossings of the limiting geodesic by a planar alternating-endpoint/Jordan stability lemma for two disjoint parameter arcs of the embedded approximants. At tangential returns use ODE uniqueness: equal velocities give a shorter period; opposite velocities imply a reversal symmetry forcing zero velocity at its midpoint. Thus a limit without transverse crossings traverses a primitive embedded closed geodesic k times.

Construct a smooth normal annulus around the primitive image by its unit normal, the exponential/Fermi map, local inverse-function theorem and compact embeddedness. Uniform parametrized convergence gives a homotopy of annular projections of degree ±k. The generic Jordan winding theorem in a smooth planar annulus gives degree 0 or ±1 for an embedded curve there. Hence k=1. The homotopy of parametrized annular projections supplies the degree comparison.

For c>0 let K_c be the simple unoriented geodesic images of length c. Prove K_c compact in V using compact initial unit-tangent data, ODE dependence and the preceding no-crossing/no-iterate limit theorem; allow infinite or positive-dimensional K_c. For every open U⊃K_c prove that curves in a sufficiently small length strip about c with sufficiently small D_(η_def) lie in U. Derive this by contradiction from approximate-geodesic compactness, including the case K_c=∅.

#### R4.9.6. Uniform embedded-preserving finite-family shortening

Fix a finite ceiling B_len>c>0 and an open U containing K_c. Construct 0<σ<c and δ>0 with c+2δ<B_len, depending only on g,B_len,c,U, independently of the parameter space. For every continuous u:(P,P₀)→(V,A), with P any compact finite polyhedron and max L_g(u)≤c+δ, construct a homotopy H relative to P₀, through Jordan images or points, whose endpoint u′ satisfies

`u′(P) ⊂ V^{<c−σ} ∪ U`,  `max_(P×[0,1]) L_g(H) ≤ c+2δ < B_len`.

Fix every input point-curve throughout, including those outside P₀. The constants σ,δ are uniform over the families; regularization mesh, parameter subdivision and flow times may depend on the particular compact family. Construct the restriction and cubical face-identification laws below for this intrinsic family construction, together with comparison laws for its compatible choices. Intermediate curves lie below the declared ceiling and their endpoints lie in the low union U. The ordered analytic construction below preserves embedded images and point inputs.

##### R4.9.6a. Length-controlled parametric regularization

Choose the standard round metric g₀ as an auxiliary regularization device. Prove that the topology d_F+|ΔL| on Jordan images and points is independent of the smooth positive-definite metric on compact S². Use separate type synonyms S²_g and S²_(g₀), each carrying its own Riemannian distance, with the identity smooth diffeomorphism and its bi-Lipschitz metric comparison. Define the induced image/point bijection V_g→V_(g₀) and prove it and its inverse continuous. On positive-length bands work in the uniform quotient of constant-speed representatives by rotations and reversal. For each convergent sequence choose matched representatives with uniformly bounded Lipschitz constants, then use weak derivative convergence and convergence of arclength energy to obtain strong derivative convergence in a fixed smooth embedding; this proves convergence of length for the other metric. At points use uniform metric norm equivalence and length tending to zero. Construct the corresponding transport under a smooth diffeomorphism of compact surfaces, with variation and reparametrization laws. These are concrete curve-carrier/homeomorphism interfaces for the two-metric regularization.

Construct the shared periodic, interior and conditional blowup theorems in R4.9.6b first, then their round applications here. Before any round area evolution or annulus nonfattening application, own the following signed boundary curvature–area construction on the actual unit-round-sphere carrier with metric g₀, its fixed orientation and canonical Riemannian area.

For a selected smooth Jordan disk D, orient ∂D with D on the left. Let n_D be its inward unit conormal in the sphere and let k_D be the signed geodesic curvature defined by ∇_T T=k_D n_D for the unit-speed positive boundary tangent. Construct the boundary arclength integral and its comparison with DG's oriented line integral, and prove
`∫_(∂D) k_D ds_(g₀) + Area_(g₀)(D) = 2π`.
This is a theorem for either selected side, with its own induced orientation and normal; it does not designate a smaller side. For a smooth annular domain Ann use the two induced boundary orientations, inward conormals into Ann, and prove
`∫_(∂Ann) k_Ann ds_(g₀) + Area_(g₀)(Ann) = 0`.
Give the restriction, orientation-reversal, disk-difference and parameter-dependent integral laws needed for these actual domains.

Build the signed turning input here: an oriented smooth embedded planar Jordan curve bounding a disk on its left has tangent-map degree +1 and signed Euclidean total curvature 2π. Construct the tangent-angle lift on intervals, its degree/turning-integral identity, and the Jordan orientation comparison giving degree +1; unsigned Fenchel is a different theorem. For a selected spherical disk choose a stereographic pole in the opposite open component, transport it to a compact planar smooth Jordan disk, and use Tau Ceti's stereographic form of the round metric, `TauCeti.inner_mfderiv_stereographic'_symm`, and its conformal connection law `Bundle.ContMDiffRiemannianMetric.leviCivitaConnection_rescale_apply` (supplier contract). For g₀=e^(2u)(dx²+dy²), prove the signed boundary identity `k_(g₀) ds_(g₀)=(k_e+∂_(n_out)u)ds_e`; the curvature identity `K_(g₀)dA_(g₀)=−Δu dxdy` is Tau Ceti's surface law `Bundle.ContMDiffRiemannianMetric.scalarCurvature_rescale_of_finrank_eq_two` with Scal=2K, the flat metric and dA_(g₀)=e^(2u)dxdy. DG's Green/Stokes theorem and the signed turning theorem then give the disk formula because K_(g₀)=1. Derive the annulus formula by subtracting the two nested disk formulas and reversing the inner boundary. Own these geometric/line-integral/volume comparisons here; generic Stokes alone does not assert them.

For a smooth moving Jordan disk establish the signed moving-boundary formula `A_side′=−∫k_D ds` with the same curvature/normal convention. Combine it with the owned disk identity to obtain `A_side′=A_side−2π`, and construct its continuous finite-endpoint area trace. For two nested evolving smooth boundaries prove the corresponding variation formula with both induced annulus orientations on their common lifetime; the annulus identity gives `A_ann′=A_ann`, hence `A_ann(t)=exp(t−s)A_ann(s)` before either boundary loses smooth existence. Retain the nesting and endpoint-trace hypotheses when taking approximation limits. These focused round disk/annulus theorems supply the applications in this section; no general Gauss–Bonnet–Chern theorem is a prerequisite. The arbitrary-metric finite-time alternative and the disk area equation give finite extinction exactly when A_side(0)≠2π; area bisection excludes finite collapse.

Construct the round circular-singularity theorem by a small-length closed-curve distance comparison. For an embedded round flow extinct at (p,T), enter once L≤L_*<2π. The spherical distance of a pair is at most its shorter arc l≤L/2<π, so antipodal pairs are excluded and m≠0. Use the exact ambient chord `D_ch=|X(y)−X(x)|` in ℝ³ and `ψ(L,l)=(L/π)sin(πl/L)`, where l is the shorter arclength. Prove that a positive constant `0<β≤1` with D_ch≥βψ initially retains this inequality for all later times before T; equivalently the minimum D_ch/ψ is nondecreasing. Include the continuous diagonal value 1, the two half-arc branches at l=L/2 and a strict ε first-contact barrier. The exact ambient equation is `X_t=κ_e+X`; the measure/subarc equations are `L′=−∫|κ_e|²ds+L` and `l′=−∫_arc|κ_e|²ds+l`. Homogeneity `Lψ_L+lψ_l=ψ` cancels the pure homothety contribution in D_ch/ψ. At contact set θ=πl/L, `w=(Y−X)/D_ch`, `m=(X+Y)/2` and `c_contact=β cosθ`. The sphere and first-variation identities give `T_x·w=T_y·w=c_contact`, `T_x·m=Dc/2`, `T_y·m=−Dc/2` and `c²≤|m|²`. Resolve the remaining tangent components in the line orthogonal to span(X,Y). For equal residual signs the (+,+) second variation gives `D_t≥D_ch(1−c²/|m|²)≥0`, while ψ_t≤0. For opposite residual signs the (+,−) variation gives `D_t≥D_ch−4βπ²ψ/L²`. Own the ambient-ℝ³ closed Fenchel inequality `∫|κ_e|ds≥2π` and the endpoint-tangent turning bound on the selected arc, followed by Cauchy–Schwarz: `∫_arc|κ_e|²ds≥4(acos c_contact)²/l≥4π²l/L²` and `∫|κ_e|²ds≥4π²/L`. Hence the corresponding geodesic-curvature energies are at least `(4π²/L²−1)l` and `(4π²/L²−1)L`. Since ψ_L,ψ_l≥0 on θ∈[0,π/2], `−ψ_t≥(4π²/L²−1)ψ`, making `(D_ch−βψ)_t≥0` in the opposite-sign case too. Construct the finite-dimensional first/second-variation, turning and Fenchel lemmas with their regular-closed/arc hypotheses, then apply the strict barrier argument. This exact spherical calculation yields the scale-independent bound `D_ch≥(2β/π)l` while L→0.

Construct two distinct isoperimetric outputs. For the extinction application, once the selected shrinking side lies in a fixed small normal ball, compare its metric area and boundary length with their Euclidean chart values and consume [Isoperimetry I3/I6](../Isoperimetry/README.md#i6--full-planar-jordan-theorem-and-compatibility). This proves a uniform weak estimate `L²≥c_iso A_side` for small selected-side area. The side inside that chart is identified by Jordan separation and A_side→0. Retain the sharp spherical theorem `L²≥A_side(4π−A_side)` for every rectifiable round Jordan image as a separate utility. Consume [GeometricMeasureTheory G3–G5](../GeometricMeasureTheory/README.md#g3--distributional-bv-and-variation-measures) for derivative measures, BV compactness and perimeter lower semicontinuity in Euclidean charts. Construct the smooth-chart/pullback and partition-of-unity comparisons for spherical finite-perimeter sets here. Build spherical two-point polarization of finite-perimeter sets, prove area preservation and perimeter nonincrease, and use BV compactness and a sequence of polarizations toward a fixed pole to obtain a spherical cap of the same area. Transfer the perimeter comparison to rectifiable Jordan boundaries and compute the cap area/length. Use complements for areas above 2π. This spherical symmetrization and its limit/normalization are owned here; the planar supplier supplies the local weak estimate.

Use the closed comparison to exclude Type II at round extinction. The selected shrinking side satisfies `A_side(t)=2π(1−exp(t−T))`; the local weak estimate gives `L(t)²≥c_len(T−t)` on a terminal interval. Hamilton selection with `λ_i²(T−t_i)→∞` then has λ_iL(t_i)→∞. Prove the round application of the conditional mass and tangent theorems in R4.9.6b: the closed comparison gives linear local mass, proper arclength exhaustion and multiplicity-one pointed limits; the periodic total-curvature identity on the finite physical interval gives the finite sign-loss budget. The shared eternal-selection and disjoint-window theorem yields a proper noncompact strictly convex eternal planar limit. Its attained-maximum Harnack equality and translator classification give a grim reaper, contradicting the scale-independent closed comparison. Thus `sup_(t<T)(T−t)||k||∞²<∞`. The positive-length-floor closed application in R4.9.6b supplies the separate arbitrary-metric nonpoint exclusion.

For round Type I at the fixed extinction centre p prove `d_g₀(X(q,t),p)≤∫_t^T||k||∞ds≤2C_I sqrt(T−t)` for every material point. After scaling by `(2(T−t))^(−1/2)` the whole image stays in a fixed ball. The area equation gives rescaled selected-side area→π; combine it with the weak isoperimetric lower bound, the round local-mass estimate and the shared smooth tangent compactness theorem to prevent an empty or zero-size limit. Localized monotonicity selects a nonempty compact embedded planar shrinker, so a line is excluded. Classify that shrinker as a circle. With p,T and a normal-graph/tangential gauge fixed, prove full smooth precompactness; every subsequential limit is the same centred unit-circle image, hence the whole rescaled family converges in C∞ as unoriented embedded images. Retain normalized-flow stability and tangent uniqueness as additional utilities: compute the circle linearization and stable subspace after centre/time/gauge modulation, establish a coercive estimate and nonlinear/spherical-metric remainder bounds at every required finite Sobolev order, and prove graph persistence and convergence. These utilities use the same explicit normalization and are distinct from compactness plus classification.

Construct full great-circle convergence for immortal round flows by nonlinear area-bisecting Morse–Bott modulation. The area equation and the immortal primitive annular limits give L→2π and every curvature derivative→0. On a late latitude graph u over an accumulation great circle use the exact area constraint `∫sin u ds=0`. Prove by the implicit-function theorem that it determines the unstable constant mode from the remaining small graph; use the two rotational parameters to impose zero first harmonics. The linearized operator is `∂s²+1`; the remaining modes have eigenvalues≤−3. Establish the quasilinear coercive energy estimate, persistence on the chosen graph slice and decay at all finite orders. Derive the rotation equation and prove its velocity is integrable, giving one limiting great circle. Include the already geodesic case. Construct this nonlinear slice/constraint and the estimates, rather than infer them from the linear spectrum alone.

Retain the Gage threshold and polar/intersection outputs as separate utilities. From L→2π and curvature decay derive `∫sqrt(1+k_g²)ds<3π` on a late tail. Prove the fixed-great-circle intersection theorem from periodic scalar zero number and uniqueness. For each curve C_t, let S_t be the closure in RP² of the unoriented poles whose great circles meet C_t in at least four distinct points (a coincident great circle has infinitely many intersection points). Prove nesting first for the unclosed pole sets by the fixed-great-circle zero-number theorem, and hence for their closures. Construct the tangent polar curve with length∫|k_g|→0. Prove the rotation-to-tangency/convex-hull estimate and the closing lemma placing every accumulation pole in the actual closed set S_t, including the geodesic and tangency degeneracies. The area constraint in that closing lemma is ∫sin u=0; its proof must account for this nonlinear constraint when great circles are written as `tan u=a cos s+b sin s`. Prove the closing and pole-diameter estimates for these closed sets, including poles approaching a tangency, and deduce great-circle uniqueness. These are full geometric construction targets independent of the main modulation proof.

Construct the raw round avoidance track for nested smooth disk exhaustions of both components of a Jordan image. Before any smooth-boundary conclusion, define the closed track as the intersection of the evolved closed annuli, prove the weak-set avoidance law, maximality, exhaustion independence and restriction in time. Prove common survival for approximants of one fixed nondegenerate Jordan image using two fixed closed round balls strictly in its complementary components: their shrinking circle barriers live for `−log cos a_+` and `−log cos a_-`, and avoidance plus the finite-time point-collapse alternative excludes earlier collapse. This lifetime uses the two balls alone.

Own the conditional one-sided smooth-boundary theorem. For a nested exhaustion by smooth Jordan disk flows on a common positive interval, with uniform positive-time length ceilings, two-sided noncollapse from surviving complementary balls and the actual avoidance/nesting laws, construct a smooth single embedded boundary for the limit of each side on every smaller positive interval. Use dissipation to choose an intermediate curvature-energy slice, constant-speed H² compactness and the local parabolic graph estimates. Prove the needed limit-boundary regularity: rule out multiplicity and tangential self-contact using the one-sided nesting, strong avoidance, local embedded sheet/degree comparisons and the boundary-of-domain topology, then propagate the intermediate smooth graph to the requested time. An integral energy bound supplies an intermediate slice; the parabolic argument supplies the later estimates. Construct these boundary/degree statements on the actual limit domains. This conditional theorem has the uniform length ceiling as input, with the finite-length and general-Jordan applications obtaining it by their separate constructions.

After smooth one-sided boundaries have been constructed, prove the conditional annulus nonfattening theorem. For the nested approximating annuli, apply the signed annulus boundary identity and moving-boundary variation constructed above on the common smooth lifetime to get `A_ann′=A_ann` and `A_ann(t)=exp(t)A_ann(0)`. Retain the actual inner/outer orientations and initial-area trace in this formula. If their initial areas tend to 0, their areas at a fixed common surviving positive time tend to 0. Avoidance, the smooth-boundary limits and annular degree then identify the two boundaries as one smooth Jordan image and identify the raw track with that image. Prove uniqueness among smooth positive-time boundary flows having the declared trace. This conditional theorem takes actual smooth boundary and nesting inputs and is independent of the source of the length ceilings.

For every finite-length Jordan image γ construct smooth nested inside/outside conformal approximants with boundary lengths converging to L_g₀(γ), using the Poisson/BV theorem below. The two fixed complementary balls give common survival. Monotonicity gives the uniform length ceiling directly from these initial lengths, and dissipation supplies the intermediate good slice for the conditional one-sided smooth-boundary theorem. Apply conditional annulus nonfattening only after those boundaries exist. This produces the finite-length positive-time round engine without spacing, foliation length estimates or a Dirichlet wedge premise.

Construct the positive Poisson/BV adapter on actual continuous finite-variation boundary traces. Consume [ConformalMapping L3/L5](../../Completed/ConformalMapping/README.md) for the holomorphic disc map, its continuous injective closed-disc extension and Cauchy floor, and [GeometricMeasureTheory G1](../GeometricMeasureTheory/README.md#g1--rectifiable-curves-and-arclength) for arclength factorization. In a stereographic chart away from a pole in the other component write `z=Z∘ell`, with ell the continuous cumulative Euclidean variation and Z a unit-speed Lipschitz representative. Prove the derivative-measure substitution `Dz=(Z′∘ell)Dell`, `ell_*Dell=ds` and `|Dz|=Dell`, with generalized-inverse handling of constant pieces. Deduce `∫||dDz/d|Dz|||_(g(z))d|Dz|=∫||Z′||_(g(Z))ds=L_g(z)` from the Lipschitz metric-derivative identity. Derive the positive Poisson representation from Cauchy and harmonic uniqueness, with `P_r(θ)=(1−r²)/(1−2r cosθ+r²)` of average 1. Finite-measure Fubini gives `D(P_r*z)=P_r*Dz`. Positivity and convexity give the norm bound; split near and far angular pairs and use uniform metric continuity and the vanishing Poisson tail to prove the weighted length limsup. Uniform convergence and lower semicontinuity give equality. Apply the theorem to radial maps for both complementary domains, retaining trace, orientation and nesting laws.

Prove the finite-length engine’s own initial Fréchet and exact-length trace. Use fixed nested Schoenflies annuli around γ and smooth inner/outer barriers to trap each positive-time image for small time. Prove degree one in each annulus by the actual Jordan/avoidance and parametrized annulus laws. Constant-speed representatives have a uniform Lipschitz ceiling; every uniform subsequential limit has image γ, degree one and length≤L_g₀(γ). Use γ’s arclength homeomorphism and variation to show that any genuine backtracking would add positive length, so the limit is a monotone one-traversal parametrization. This proves unoriented Fréchet convergence; metric lower semicontinuity gives the exact length trace. Construct the required topological annuli and degree homotopies, including the absence of a nearest-point map for a rough γ.

For every Jordan image γ of spherical area zero, including nonrectifiable images, construct its maximal smooth round curve-shortening flow for positive time with unparametrized uniform/Fréchet trace γ as t↓0, unique up to reparametrization. Prove it persists for all time exactly when γ bisects the sphere's area, and otherwise becomes extinct in finite time. Use nested smooth disk exhaustions of both complementary components. A `(C,θ)`-spacing is a finite set of points y_i whose closed radius-C balls and antipodal balls miss γ, such that for every test point x two well-defined great circles through x and selected y_i have angle greater than π/2−θ. Prove existence for each Jordan curve and stability under sufficiently close Jordan approximation. For 0<r<π/2 let M_(r,g)(γ) count the components of γ∩B_(2r)(g) meeting the closed r-neighbourhood of g, and M_r be its supremum over great circles. Prove finiteness and uniform approximation bounds with buffered scales. For 0<α≪1, choose a spacing centre y and let `V_space=B_C(y)∪B_C(−y)`, disjoint from γ. For a test point x choose a great circle g through x,y and 2r<αC. Write C_space=C for the actual spacing radius above, so `V_space=B_(C_space)(y)∪B_(C_space)(−y)` is disjoint from γ. Pin 0<C_space<π/2, y∈g and 0<α<1/10. Set `C_graph=C_space/2`, `C_core=C_graph/2` and choose a gluing radius `C_glue` strictly between C_graph and C_space, for example 3C_space/4. The spacing input remains C_space; the smaller radii specify where initial graphs, their gluing and evolved estimates are imposed.

Use the normal strip coordinates `F(s,u)=cos(u)g(s)+sin(u)n`, with oriented circle parameter s, fixed unit normal n to its plane and projection π_g(F(s,u))=g(s). For a radius a define `I_a=(B_a(y)∪B_a(−y))∩g`. Choose r>0 with `4r<α C_graph` and let `R_evol=2(1+α)r<π/2`. Require the strict margins `cos(R_evol)cos(C_glue)>cos(C_space)` and `cos(R_evol)cos(C_core)>cos(C_graph)`. In particular `cos(2r)cos(C_graph)>cos(C_space)`. Define the initial graph window `U_graph=π_g⁻¹(I_(C_graph))∩B_(2r)(g)` and the larger gluing window using I_(C_glue) at that height.

A leafable curve is a smooth embedded closed curve ℓ⊂B_(2r)(g) such that `π_g:ℓ∩U_graph→I_(C_graph)` is a diffeomorphism. Thus every point of each full prescribed graph arc has exactly one point of the normal graph, with no additional components in U_graph. Require tangent angle≤α/2 to the latitude direction on this initial graph. Coverage is part of the definition, not an angle test on whatever spatial-ball intersection happens to exist. No slope condition is imposed outside this graph window.

Construct the domain comparisons explicitly. For s measured from y, `cos d(F(s,u),y)=cos(u)cos(s)`, and likewise at −y. Prove that the whole initial graph and gluing cylinders lie in the actual γ-free spacing balls V_space, using the strict margins above; their closed subwindows have compact separation from γ. The spatial-ball restriction of a nonzero latitude projects onto a shorter arc, so that restriction is not required to surject onto the larger spacing arc. Nonzero latitudes are valid initial leaves. Prove also `V_space∩B_R(g)⊂π_g⁻¹(I_(C_space))∩B_R(g)` for the heights used, and `π_g⁻¹(I_(C_core))∩B_(R_evol)(g)⊂B_(C_graph)(y)∪B_(C_graph)(−y)`. These identify the actual smaller domains in the two-ball barriers and positive-time estimates.

Prove from full two-arc coverage, embeddedness and Jordan separation in the complementary strip rectangles that the annular projection has degree ±1. Construct initial leafable foliations in this same class, allowing outer leaves in B_(2r)(g)\B_r(g). Perform every imposed graph normalization and its smooth gluing inside the γ-free spacing windows; leave the required freedom outside those windows for the intersection-count construction. Prove that this yields at most `2M_(r,g)(γ)` intersections per leaf, at the original multiplicity scale r. A local low-slope modification is not imposed in a region that may contain γ; the γ-free support is part of this proof.

Construct the buffered straightening and common-lifetime theorem with those actual windows. For a straightening construction requiring initial containment B_(r_st)(g), set `r_st=2r`, use `4r<α C_graph` and the declared time/spacing margins, and prove the comparison of its graph hypotheses. Do not infer containment in B_r from B_(2r). The auxiliary straightening scale does not change the original multiplicity scale or counted intersections. Prove persistence of graph and angle estimates only on the specified smaller core arcs I_(C_core) and their buffered cylinders/spatial balls for the declared time interval; unchanged full initial-arc coverage at positive time is not a premise or conclusion. Prove that the evolved family covers the required B_r(g) region, preserves degree and intersection bounds, and reaches the stated global straightening angle. Retain the coefficient and time-window hypotheses for the transverse-foliation grid. Derive constants for each original C_space by the explicit substitutions C_graph=C_space/2 and r_st=2r, so the original uniform spacing-family statement is retained. Use the constructions of [Lauer §4 and §8](https://arxiv.org/html/1601.05704#S4) with these coordinate-domain, free-support and radius comparisons. Apply the scalar parabolic Harnack theorem of R4.9.6b to the positive linearized leaf separation, with the actual coefficient and time-window bounds from the straightening charts.

Construct the barrier-arc families used in straightening. For each fixed spacing/angle reserve and sufficiently small strip radius r, build smooth embedded convex U-turn arcs with the seven barrier properties: fixed endpoints near the spacing centre; confinement in the narrow strip and chosen wedge; a controlled tip near the antipodal ball; two graph arms; one intersection with each prescribed pencil great circle; a fixed tip-angle reserve; and nonnegative geodesic curvature. Use short geodesic arm pieces and a convex rounded tip in the actual spherical charts, smooth the joins with quantitative angle/strip margins, and keep straight endpoint pieces so all initial curvature jets vanish. Prove this construction with continuous choices and uniform constants. For their Dirichlet evolution derive k≥0 from `k_t=k_ss+k³+k`, k=0 at the endpoints, and prove the boundary-safe single-intersection laws by the homogeneous-Dirichlet/local intersection theorem. Establish the angle monotonicity and retain a subarc whose tangent angle relative to the strip frame runs from π/4 to 3π/4 while remaining in that interval until the tip enters the target ball. In `g₀=dr²+cos²r ds²`, `|theta_ell−k_g|≤C r` and `dr/dell=sin theta`; that subarc has length≤C_1 r and turning≥π/4 for small r. Hence `∫k_g²ds≥c_turn/r`, so a uniform initial length ceiling gives straightening time `T_st(r)≤C_st r`. Prove the angle window and its preservation as geometric outputs of this family, not extra hypotheses on arbitrary input curves. Construct the moving barriers and their intersection comparison with each leaf, and conclude the stated straightening angle and grid estimates.

For each spacing radius C_space and sufficiently small θ construct T_space(C_space,θ)>0; for 0<t<T_space choose buffered multiplicity scale r(C_space,θ,t) and C_len(C_space,θ,t)<∞ so every smooth embedded curve with that spacing satisfies `L(γ_t)≤C_len M_r(γ)` whenever its flow exists. This is a spacing-only length theorem. For approximants of one fixed Jordan image use the independent two-ball common lifetime, and then evaluate this length theorem at times below both lifetimes. The straightening/multiplicity length construction supplies the general-Jordan ceiling and is independent of the finite-length ceiling above.

For arbitrary area-zero Jordan images, use the spacing/multiplicity theorem to supply positive-time length bounds, then apply the conditional one-sided boundary and annulus nonfattening theorems. Construct the general initial Fréchet trace by the evolved finite crosscut/foliation grid and its arcwise separation laws, retaining arbitrary nonrectifiable initial images. This trace construction is separate from the finite-length no-backtracking proof. Prove uniqueness up to reparametrization and the area-bisection maximal-lifetime criterion, and apply the round circular/immortal outputs to its positive-time slices.

For Jordan data converging at a common surviving positive time prove joint length convergence by the final-limsup subsequence and Fatou curvature-energy argument. At a suitable intermediate time use bounded liminf curvature energy and a positive lower length bound for arclength H² compactness and C¹ convergence. Identify the support and exact traversal by the annular degree-one theorem, then use positive-time graph dependence. The general area-zero flow and the finite-length exact trace are distinct outputs with their own hypotheses.

Construct the fixed-endpoint Dirichlet application for the leaf barriers. Choose a closed spherical lune Ω bounded by two distinct great-circle barriers, endpoints A_endpt,B_endpt on the respective boundaries away from the vertices, and a smooth embedded initial arc with interior in int Ω and all initial endpoint curvature jets zero. The endpoints used in the leaf construction lie in a common strictly convex neighborhood, so their short joining segment has length<π. Instantiate the interval parabolic inverse and quasilinear theorem of R4.9.6b, in moving graph charts with zero endpoint data and actual corner compatibility. Fixed endpoints give k=0 and, for constant curvature, k_ss=0 at positive time; derive the higher even-jet compatibility identities and boundary estimates while treating odd jets as unknowns. Construct parameter dependence, avoidance, wedge containment and curvature-bounded continuation on these domains.

Derive endpoint localization from this initial wedge/embedded-arc data. Start with a small endpoint neighborhood meeting only its initial end branch, which exists by compact embeddedness. Construct a quantitative geodesic-foliation/barrier system there, with lateral boundary comparisons and interval intersection counts, and prove that its evolution keeps the whole curve’s intersection with a smaller neighborhood on one controlled endpoint graph. Prove uniform slope, curvature and compatible higher boundary bounds. In particular, for each fixed positive intrinsic separation a prove a positive δ_a, uniform in time, such that `d(A_endpt,F(q,t))≥δ_a` whenever the subarc from A_endpt has length≥a; prove the analogous B_endpt statement. The graph estimate controls the remaining shorter subarc. Construct the no-remote-return assertion through the foliation’s boundary-safe avoidance and one-sheet intersection laws; derive all constants from the given initial arc, wedge and endpoint geometry. This endpoint-localization theorem is an owned geometric construction, rather than an additional condition imposed on the input.

Prove the spherical pair-domain comparison with that endpoint theorem. For 0<d<π and parallel signed normal endpoint components α_n,β_n the short-geodesic index form is `Hess d=((α_n²+β_n²)cos d−2α_nβ_n)/sin d`; derive it from the sine Jacobi field. At an interior minimum of distance/subarc-length choose the endpoint variation sign making β_n=α_n, obtaining the favorable curvature-vector difference≥`2α_n²tan(d/2)`. At a fixed-endpoint edge the second variation instead gives the possibly negative `−cot(d)β_n²`; use the proved endpoint graph ratio and δ_a/L_max for the remote subarc. Include diagonal limits and compact initial-time bounds. Strict interior containment and nonvertex endpoints exclude the lune’s only possible antipodal pair, so d<π at all contacts. This gives a positive ratio for the whole parameter-pair domain with uniform constants.

Apply the shared conditional blowup package to the Dirichlet flow. Its distance/subarc ratio gives linear local mass and proper arclength limits, and the boundary estimates keep high-curvature selections away from the endpoints. Prove the homogeneous-Dirichlet total-curvature identity `V′=−2Σ_interior|k_s|−|k_s(A_endpt)|−|k_s(B_endpt)|+∫K_gauss|k|ds` in the distributional sense; on a finite physical singular-time interval it gives a finite sign-loss budget. These inputs supply interval Type-I/II selection and exclusion, hence existence for all time. For infinite time use L≥d(A_endpt,B_endpt)>0 and dissipation. With K_gauss=1, boundary compatibility gives `E₀′=−2E₁+∫k⁴+2E₀` and `E₁′=−2E₂+∫(7k²+2)k_s²`; the boundary terms vanish by k=0 and k_ss=0. Prove the higher boundary energy/trace ladder and decay. Limits are geodesic segments inside Ω; show the long great-circle arc exits the lune, identify its unique joining segment there, and use the positive Dirichlet Jacobi gap `(π/d(A_endpt,B_endpt))²−1` plus nonlinear remainder control to obtain integrable late motion and full smooth convergence.

Use the shared periodic normal-graph parabolic theorem in R4.9.6b for the round metric. For an oriented smooth Jordan curve let A(t) be the area of its selected component. Gauss–Bonnet and A′=−∫k_g ds give `A′=A−2π` on the unit sphere. Establish the area convention and its continuous finite-endpoint trace. The arbitrary-metric finite-time alternative below then gives extinction in finite time exactly when A(0)≠2π; A(0)=2π excludes finite collapse.

For comparison estimates, fix an actual smooth reference flow and express the nearby flow as a normal graph `u(s,t)` over it in one fixed tubular strip and gauge on a common short-time interval. The zero graph is the reference solution; in the graph-difference equation write the lower-order residual as `b(s,t,u,u_s)` with `b(s,t,0,0)=0`. Require the principal coefficient `a≥a₀>0`, uniformly bounded coefficient jets on a fixed compact coefficient box, and common initial H² and C¹ reserves placing the graph inside that box. Put `Y_m(t)=||u(·,t)||_{H^m(S¹)}²` for m≥2. Then prove `Y₂′+a₀||u_sss||²₂≤C(1+Y₂³)`, `||u_t||₂≤C`, and `||u(t)−u(0)||C¹≤C t^{1/8}` on the common short-time interval.

Obtain an integrable coefficient `A_par(t)=1+||u_ss||²∞` for this same reference-flow graph. Prove the differentiated composition/commutator bounds and `Y_m′+a₀Y_(m+1)≤C_m A_par(t)(1+Y_m)`; time averaging on successive interior intervals supplies all positive-time derivatives from the stated initial H²/C¹ reserve. For convergence to the reference, define `E_diff(t)=||u(·,t)||²_{L²(S¹)}` and prove `E_diff′+a₀||u_s||²₂≤C A_par(t)E_diff`, then use interpolation and finite graph restarts. These are local comparison estimates for the selected reference-flow chart and do not restrict the separate common-survival theorem’s arbitrary smooth input flows. Construct these a priori estimates in actual parabolic function spaces and obtain dependence for the common-surviving finite-length engine.

For every compact finite-polyhedron family u and every ε>0, choose a continuous positive small round time on its nonpoint parameter locus, tending to 0 at point parameters and below the survival bound. Joint continuity in V and positive-time smooth dependence give an embedded/point homotopy fixed at every input point, with `L_g(H(p,t))≤L_g(u(p))+ε`, and positive-length endpoints continuous in C∞ away from point parameters. The round auxiliary homotopy has the stated upper g-length allowance. For the intrinsic cubical construction below, choose the time cap on the compact curve image so identified input curves receive the same time.

##### R4.9.6b. Shared parabolic and conditional blowup theory; arbitrary-metric applications

Construct one shared periodic normal-graph theorem for every fixed smooth surface metric and use its round specialization in R4.9.6a. On the compact graph coefficient box, `u_t=a(s,t,u,u_s)u_ss+b(s,t,u,u_s)` on ℝ/ℤ has a≥a₀>0. Establish short-time existence, energy estimates, compactness and restart while the graph/box persist; prove uniqueness by the L² difference estimate, smooth dependence by differentiated equations, and positive-time smoothing. Reparametrize to obtain geometric uniqueness, embeddedness/avoidance, L′=−∫k²ds, derivative bounds and curvature-bounded continuation.

Construct the linear Dirichlet parabolic inverse independently on a compact interval I=[0,l_I]. Fix 0<α_par<1, positive ellipticity a≥a_0 and bounds for a,b,c in the required parabolic Hölder spaces. For `v_t−a v_xx−b v_x−c v=f`, construct a unique solution in `C^(2+alpha_par,1+alpha_par/2)` for f in `C^(alpha_par,alpha_par/2)`, initial data in C^(2+α_par), boundary data in C^(1+α_par/2), and the actual corner equalities. These include equality of initial/boundary values and equality of the boundary time derivative with a v_0,xx+b v_0,x+c v_0+f at each corner; impose the corresponding differentiated identities at higher finite orders. Prove the inverse estimate with its ellipticity, coefficient, interval and time bounds by the frozen Dirichlet heat inverse, localization/reflection, Schauder estimates and continuity/patching. Use the small-time coefficient reserve for a quasilinear contraction, then construct uniqueness, smooth parameter dependence, positive-time regularity and continuation while the graph/ellipticity and boundary coefficient bounds persist. This is the interval floor used by the spherical fixed-endpoint application, distinct from the periodic construction.

Construct the general periodic linear zero-number theorem for `w_t=a w_xx+b w_x+c w`: on each compact time strip the coefficients are smooth and bounded with the finite derivatives used by the proof, and a≥a₀>0. Either the solution is identically zero, or at every positive interior time its spatial zero set is finite, its zero number is nonincreasing, and a multiple zero gives a strict drop across that time. Prove uniqueness and the identical-zero branch separately. Linearizing the graph difference gives the intersection corollary, with coincident geometric curves handled by uniqueness. In a fixed periodic parametrization of a smooth flow, the curvature equation is a linear equation of this form for w=k, with a=|∂xX|^(−2), the actual reparametrization drift, and c=k²+K_gauss; all coefficients have the stated bounds on compact smooth time strips. This gives the curvature-zero corollary used in BII. Construct separately the local interval theorem on boxes with nonzero lateral values, and the homogeneous-Dirichlet theorem on a fixed compact interval: for a nonzero solution with zero endpoint values the number of interior sign changes is finite at positive interior times, nonincreasing, and drops at interior multiple zeros and the corresponding boundary degeneracies. Prove its boundary classification and separate identical-zero alternative. Apply these domain-specific versions to graph differences and curvature with their actual lateral or endpoint conditions.

Construct the local interior graph/curvature compactness adapter. On a parabolic box with positive separation from its parabolic boundary, a uniform curvature bound and smooth bounded ambient metric jets give small moving graphical patches with controlled height/slope. Derive these patches by the arclength turning bound and a controlled normal/time reparametrization. Apply cutoff energy and parabolic interior estimates on nested boxes, tracking the coefficient jets and cutoff losses. If |k|≤K/r on the outer box, prove bounds `|D_s^j ∂t^q k|≤C_(j,q) r^(−1−j−2q)` on its fixed smaller box, with constants depending on K, box margins and the corresponding rescaled ambient jets. These estimates require no lateral boundary values and supply local smooth pointed subsequence compactness with the separately stated local mass/sheet bounds. They feed point-picking, BI selection and tangent passage.

Construct scalar parabolic Harnack on nested interior cylinders for nonnegative solutions of the linear equation above, with uniform ellipticity and explicit bounded coefficient/geometry/time-gap hypotheses: the supremum on the earlier cylinder is bounded by a finite constant times the infimum on the later cylinder. Include the bounded-potential normalization and the identical-zero case. Its application to positive leaf separation uses actual graph-linearization and straightening estimates. Periodic, local-interior and Dirichlet boundary estimates retain their separate domains and boundary hypotheses.

Give the conditional blowup package one owner here. Type I means `sup_(t<T)(T−t)||k||infinity²<infinity`; Type II is its unbounded complement on a finite singular interval. Its inputs are actual smooth embedded curve flows on interior parabolic domains, uniformly bounded rescaled ambient metric jets, a declared linear local-mass bound `Length(C_t∩B_R(y))≤Lambda R`, controlled local sheets/injectivity and graphical reparametrizations, the parabolic-box derivative estimates above, and the precise monotonicity/error or point-selection hypotheses below. For interval applications require that the outer boxes/cutoffs miss the fixed endpoints, with scaled endpoint distance tending to infinity in a tangent sequence. Under smooth pointed convergence and the mass bound prove the Gaussian tail estimate by dyadic annuli `C Lambda Σ_(j≥0)(2^j R) exp(−c_tail 4^j R²)` and passage of full centered Gaussian ratios. Construct center-uniform local regularity, fixed-center nonflat selection, eternal selection and finite-loss convexity once on these inputs. Closed positive-length, round extinction and interval flows establish their separate application inputs; the conditional package does not require a closed curve or a positive limiting length.

Prove separately the arbitrary-metric maximal-time alternative: for finite maximal time, length and diameter tend to zero and the image converges to one point; for infinite time, subsequences converge smoothly to primitive embedded positive-length closed geodesics. The point limit identifies the finite-time alternative, while the family clock below stops at a positive cutoff length. The round finite-collapse conclusion consumes the finite-time output and Gauss–Bonnet area ODE; circular-singularity asymptotics and great-circle convergence remain separate outputs. The maximal-time alternative follows from the separate global arguments below.

For the arbitrary-metric closed application consume R3’s compact-set uniform normal/strong-convexity radius and smooth two-endpoint short-segment/logarithm theorem, themselves using SBC B6.0, and R4.6’s injectivity consequence. Choose a uniform convex-normal radius r_J within those domains, with the segment and endpoint derivatives smooth on the resulting pair domain including its diagonal. Define `C_J≥0` by the endpoint Jacobi distance-Hessian bound: for `0<d=d_g(x,y)<r_J`, endpoint vectors `V∈T_xS²`, `W∈T_yS²`, and parallel transport `P:T_xS²→T_yS²` along the minimizing geodesic, prove `|Hess d_g((V,W),(V,W))−d^(−1)||(PV−W)^⊥||²|≤C_J d (||V||²+||W||²)`, where the perpendicular projection is to its terminal unit tangent. Construct a uniform `C_J` from the Jacobi index form and compact metric bounds. Assuming `L(t)≥ℓ>0` on a finite interval, derive from this estimate the surface chord–arc inequality

For `psi_CA(L,l)=(L/pi)sin(pi l/L)`, prove the near-pair comparison `d_g(x,y)≥N_CA^(−1) exp(−K_time t) psi_CA(L(t),l(x,y))` when d_g(x,y)<r_J and `0≤l≤L(t)/2`. Include the initial continuous diagonal ratio, the half-arc branches and the two endpoint-normal signs in the Jacobi-Hessian first-contact argument. For the complementary pairs use d_g(x,y)≥r_J and L(t)≤L(0). Choose N_CA from the actual initial near-pair distortion and far-pair ceiling; take `K_time>4C_J+4pi²/L_min²`. Since sin θ ≥ 2θ/π on [0, π/2], conclude

`d_g(x,y)≥beta_CA l(x,y)`, `beta_CA=2exp(−K_time T)/(pi N_CA)>0`.

Prove the application mass estimate explicitly. Fixing one point of C_t∩B_R, all other points there have shorter intrinsic distance ≤ 2R/β_CA from it, so total ball length ≤ 4R/β_CA. Normal-coordinate comparison gives a rescaled mass constant, for example Λ ≥ 8/β_CA on sufficiently small declared charts. The round closed comparison supplies the analogous constant from its own fixed β_arc, and the interval distance/subarc comparison gives ≤ 4R/θ_D. Uniform-family use requires a common positive ratio and the same metric/box margins. Use those bounds for the shared tail and compactness theorem. Proper noncompact arclength limits additionally use the actual domain exhaustion and chord–arc injectivity; derivative estimates alone do not imply them.

For the shared localized monotonicity and center-uniform regularity theorem, fix a normal radius r_J and choose `2r_0<r_J`. Let the smooth radial cutoff χ_y equal 1 on B_(r_0)(y), have range [0, 1], and be supported in B_(2r_0)(y); in an interval application this support lies away from its endpoints. With q=d_g(y,z)²/2 and τ=T−t set `rho=(4pi tau)^(−1/2)exp(−q/(2tau))`. For 0<τ≤r_0² define `Theta_chi(y,T;tau)=∫_(C_(T−tau))chi_y(z)(4pi tau)^(−1/2)exp(−d_g(y,z)²/(4tau))ds`, using the same localized ratio notation Θ_χ below. Establish the material-time identity

`(∂tρ−k²ρ)+∂ssρ = −ρ|kN+(∇q)^⊥/(2τ)|² + ρ(1−Hess q(T,T))/(2τ)`.

Use the material-time convention for `∂tρ` in the material-time identity. Multiplying that identity by χ and integrating gives the exact cutoff formula

`d/dt ∫χρ ds = −∫χρ|kN+(∇q)^⊥/(2τ)|² ds + E_g(t)+E_χ(t)`,

where `E_g(t)=∫χρ(1−Hess q(T,T))/(2τ) ds` and `E_χ(t)=∫((D_sχ)(D_sρ)+ρ k D_Nχ)ds`. Thus the cutoff error is supported where χ varies; on this convex ball `1−Hess q(T,T)=O_g(d_g(y,·)²)` for its declared centre y. Construct the following conditional center-uniform ε-regularity criterion. For fixed `g`, outer cutoff profile, cylinder shape and local-mass bound `Λ`, require the flow and its local-mass estimate on every ball meeting each fixed support `supp(χ_y)` throughout the full integration interval `[s−r²,s]`; these hypotheses apply even when the support extends outside the smaller conclusion cylinder. Prove that there are `ε_*>0`, `r₁∈(0,r₀]` and `C,C_j` such that for every radius `0<r≤r₁`, any smooth flow on the scale-r cylinder satisfying, for every center `(y,s)` in the smaller cylinder and every admissible terminal time, the fixed-scale ratio bound `Θ_{χ_y}(y,s;r²)<1+ε_*/2`, the integrated error bound `∫_(s−r²)^s (|E_g|+|E_χ|)dt≤ε_*/2`, and the local mass estimate `Length(C_t∩B_R(y))≤ΛR` on the rescaled balls used in point-picking, obeys `sup_(Q_(r/2))|k|≤C/r` and `sup_(Q_(r/4))|D_s^j k|≤C_j/r^(j+1)`. Derive the criterion by contradiction: if no positive `ε_*` works, take a sequence with ratio and error excess tending to zero and unbounded normalized curvature. Point-pick and rescale; use the interior parabolic-box derivative theorem on strictly smaller boxes and the common Λ local mass/sheet bound to construct smooth pointed compactness. Pass the center-uniform Gaussian bounds to the limit at every admissible center and scale. For the resulting smooth normalized limit, the density is at least one at a point on a smooth embedded curve; the upper bounds force density exactly one at every center lying on the limit flow and every admissible backward scale. Equality in the Euclidean monotonicity identity makes the limit a static line, contradicting the unit-curvature point. This contradiction establishes a positive ε_* uniform in the declared small scales and cylinder data. The constants are uniform over flows satisfying the same `Λ` and the stated cylinder/error bounds. The cutoff `χ_y` is the same outer radial profile centered at `y`; the theorem fixes r₁, the cylinder-inclusion ratios, error allowance and constants uniformly for all 0<r≤r₁. The chosen r is then free to shrink in the singular-centre application. The neighborhood conclusion has the declared center-uniform hypotheses. To derive the fixed-center density gap at a singular point, argue by contradiction: if `limsup_(τ↓0) Θ_χ(x_*,T;τ)<1+ε_*/4`, choose one sufficiently small fixed `r>0` for which the ratio at `(x_*,T;r²)` is below `1+ε_*/4` and the full-interval cutoff/ambient error budget is below `ε_*/4`. The defining integral is over the smooth time `T−r²`, so at this fixed positive scale it varies continuously with center and terminal time. Prove the corresponding full-interval error bound also persists in a neighborhood of `(x_*,T)`; shrink that neighborhood so the same fixed-scale ratios stay below `1+ε_*/2` and the errors stay below `ε_*/2`. Monotonicity then propagates the ratio bound from `r²` to all smaller scales for those nearby centers. Applying the center-uniform criterion gives curvature bounded near `(x_*,T)`, contradicting singularity. Thus prove `limsup_(τ↓0) Θ_χ(x_*,T;τ)≥1+ε_s` for a positive `ε_s` determined by the error margin. Construct the fixed-scale continuity lemma, persistence of the full-interval error bound, monotonicity propagation and this density-gap application. The constants and cutoff/error allowances are part of these owned theorems, not implicit in their names. For tangent passage use the shared local-mass/Gaussian-tail theorem. For each fixed rescaled scale R, local smooth convergence and cutoff/ambient error estimates give convergence of the centered ratios; the tail estimate then permits passage to the full Gaussian ratio. This fixed-center continuity and monotonicity argument excludes a flat tangent. Blow up at that fixed center and scale; prove smooth pointed compactness on parabolic balls and convergence to the shrinker equation, using the material-time identity and cutoff formula stated above.

Construct the shared Type-II point-picking and eternal-selection theorem on a finite physical singular interval [0,T). Assume unbounded normalized curvature, uniform rescaled local mass/sheets and ambient jets, the interior derivative theorem, and actual expanding arclength domains; in the boundary case supply endpoint exclusion. Choose Hamilton points (x_i,t_i), λ_i=|k(x_i,t_i)|→∞ with `lambda_i²(T−t_i)→infinity`, and prove the curvature bounds and spacetime domain exhaustion used for pointed compactness. Obtain a complete eternal embedded planar limit with |k|≤1 and |k|(0,0)=1. Prove properness and noncompactness when the application supplies the uniform chord–arc and arclength-exhaustion bounds.

For the shared finite-loss convexity theorem suppose each approximating flow has a nonnegative curvature sign-loss measure μ_loss of finite total mass on [0,T), with the distributional inequality `dV≤C_amb V dt−dmu_loss`, V uniformly bounded there, and μ_loss dominating `2Σ_interior|k_s|dt` at simple sign-changing zeros. Assume the actual periodic or interval zero theorem and smooth interior convergence. If the eternal limit changes sign, choose a compact interval and time subwindow carrying a persistent simple zero with |k_s| bounded below. Rescaling preserves its integrated loss. Select pairwise disjoint physical windows of duration O(λ_i^(−2))=o(T−t_i) converging to T; each has a fixed positive μ_loss mass, contradicting finiteness. The ambient term vanishes after rescaling. Therefore the nonflat eternal limit is one-signed, and the strong maximum principle makes it strictly convex. Construct the attained-spacetime-maximum differential Harnack equality and the classification of complete convex translators, giving the grim reaper in the noncompact case. Finite loss is required only on the finite physical singular interval; no infinite-immortal-time budget is inferred from V′≤C_amb V.

Prove the closed periodic application of that budget directly. For `V(t)=∫|k|ds`, curvature evolution and `ds_t=−k²ds` yield in the distributional/zero-number sense

`dV/dt=−2 Σ_(z simple sign-changing zero of k)|D_s k(z)| + ∫K_gauss |k|ds`.

The cubic terms cancel and each transverse zero contributes the jump of sgn k. The periodic multiple-zero theorem gives the integrated identity through exceptional times. On finite [0,T), `V(t)≤exp(||K_gauss||infinity T)V(0)`, so the integrated interior sign loss is finite. In the Dirichlet application the separately derived endpoint terms are additional nonnegative losses; the same conditional theorem then applies. Derive these budgets before invoking the shared convexity conclusion.

For the closed arbitrary-metric positive-length application, the Jacobi comparison gives local mass, arclength exhaustion and proper noncompact tangents. Instantiate the shared fixed-center Type-I theorem and eternal Type-II theorem with those inputs. A nonflat planar shrinker `k+a<X,N>=0`, a>0, has first integral `k exp(−a|X|²/2)`; bounded curvature then bounds its image, contradicting proper noncompactness. The grim reaper contradicts the same chord–arc bound. Thus finite maximal time forces L→0. Use the compact-set strong-convexity and short-segment theorem to obtain nested convex-ball confinement and one limiting point.

For an immortal flow first exclude limiting length 0 by the supplied uniform small strongly convex ball and its smooth pair-geodesic distance barriers and the maximum principle. Put `E_j=∫|D_s^j k|² ds`. Prove `E₀→0`, its time integrability and `||k||∞→0` using

`E₀′=−2E₁+∫k⁴+2∫K_gauss k²`,
`E₁′=−2E₂+7∫k²k_s²−2∫K_gauss k k_ss`.

For n≥1, the exact net energy expansion is

`E_n′=−2E_(n+1)+∫D^(n+1)k P_n−2∫D^(n+1)k D^(n−1)(K_gauss k)+∫k²(D^n k)²`,
`P_n=−2D^(n−1)(k³)−2Σ_(j=0)^(n−2)D^j(k²D^(n−1−j)k)`.

The last positive term combines the commutator contribution with the negative measure derivative. Prove the cubic total-order bounds, interpolation and ambient-coefficient bounds giving `E_n′≤−E_(n+1)+C_n E₀` on each sufficiently late tail. Bootstrap uniform decay of every fixed derivative order by compactness and distributional differentiation in the fixed coordinate x∈R/Z, where `∂x=L(t)D_s`; retain the converging length factors. Extract primitive embedded geodesic limits using the oriented annular maximum-sheet argument. Prove the corresponding compactness facts uniformly on compact smooth initial-data sets where they are used. The arbitrary-metric conclusion asserts subsequential geodesic convergence. This immortal-flow theorem is a reusable output; the finite-time width localization does not consume it.

##### R4.9.6c. Smooth local graph retention and positive exit cost

Let K_c be nonempty and U a V-open neighborhood. Consume the primitive normal-annulus construction and the shared local periodic flow theorem, then construct nested controlled smooth graph neighborhoods of the whole compact K_c, with an initial entry candidate N_entry contained in U, uniform signed-distance Fermi tubes, positive dwell time and chart-reset laws. Choose N_entry by low-order height/slope and weak-functional bounds, so it contains an actual C¹-open neighborhood of K_c. The final N_s is selected after the exit constants and retains this C¹-open property. Compactness of K_c follows from initial unit-tangent data: transverse self-crossings persist, tangential returns reduce by the geodesic ODE, and annular degree excludes an iterated limit. Allow nonisolated and infinite K_c.

In a tube `g=dr_F²+G(s,r_F)² ds²`, `G(s,0)=1`, `G_{r_F}(s,0)=0`, put p=u_s, v²=G²+p² and

`Q_graph=u_ss−GG_{r_F}−(G_s/G)p−2(G_{r_F}/G)p²`.

Prove the exact formulas `k=GQ_graph/v³`, `u_t=Q_graph/v²`, `δL/δu=−Gk`; the linearization is `u_t=u_ss+K_gauss(s)u`. Choose initial slope M₀, then the bootstrap slope M and coefficient-box bounds, then small height. Establish scalable retention using the two-point modulus for all ordered shortest circle arcs, with the antipodal bound and a uniform initial near-diagonal reserve. In the first-contact proof use the strict auxiliary barrier `F_ε=F−εe^(κt)`, κ>B_reaction; the unmodified F need not be strictly negative on the diagonal. Finite short/sliding windows retain slope and height until controlled chart reset. Prove chart overlap/quotient control uniformly over K_c. The resulting neighborhoods have the stated V and C¹ properties; construct the additional positive-time derivative bounds for each stronger finite C^k exit statement.

For every V-open `U⊃K_c`, choose `η_V>0` with `Ω₂={dist_V(·,K_c)<2η_V}⊂U` and `Ω={dist_V(·,K_c)<η_V}`. Choose all constants from `(g,c,K_c,U,B_len)` before quantifying over trajectories. With the uniform graph tube, initial slope `M₀`, bootstrap slope `M` and coefficient box, dwell time, height and finite base net fixed, choose `0<b₀<η_V/8`. For nonempty K_c, let Φ be the current-test map defined below, pass its values to the unoriented quotient metric `d_{±}([v],[w])=min(‖v−w‖_{ℓ²},‖v+w‖_{ℓ²})`, and set `r_Φ(C)=dist_{d_{±}}([Φ(C)],[Φ(K_c)])`. Choose a reset tolerance η_* > 0 small enough that V-distance below η_* from K_c lies below the signed-height C⁰ chart-reset threshold with a fixed reserve. Apply the joint compact-closure modulus from the current tests with η=min(η_V/2,η_*); it gives b₀,r₀>0 such that `|L_g−c|≤b₀` and `r_Φ<r₀` imply `dist_V(·,K_c)<η`. When K_c is empty, use the separate empty-critical-set branch in R4.9.6d. Start in the inner height/slope reserve with r_Φ<r₀/2. Retain the trajectory only while it is controlled and r_Φ<r₀. At any proposed first loss of graph control the reset criterion supplies another controlled chart, excluding such loss before r_Φ reaches r₀. Therefore an exit from Ω, and hence from U, must first cross r_Φ=r₀ while control persists. U itself may extend beyond the graph tube. On the controlled crossing annulus prove `||k||₂≥m>0` for a smaller band `|L_g−c|≤b₁`. Define `b_exit=min(b₀,b₁,c/4,(B_len−c)/2)`, `C_(B_len)=√(B_len/3)`, and `e=m r₀/(2C_(B_len))`; now choose the final N_s⊂N_entry satisfying all entry reserves, after r₀,b_exit,m,e are fixed. The controlled annular gap used for this exit cost is independent of the later global curvature gap. Thus there are `b_exit,e>0` and a C¹-open `N_s`, depending only on `(g,c,K_c,U,B_len)`, such that for every `T>0` and every smooth embedded g-CSF `C(t)`, `0≤t≤T`, if `C(0)∈N_s`, `|L_g(C(t))−c|<b_exit` for every `t∈[0,T]`, and `C(t)` leaves `U` at some time `t≤T`, then `L_g(C(0))−L_g(C(T))≥e`. The length identity and `||Φ̇||≤C_(B_len)||k||₂` give this cost on the full annular crossing. The annular gap is asserted only for controlled smooth graphs in `|L_g−c|≤b₁`; outside that band a geodesic of another length may violate the bound. The family reserves additionally require `max(σ,δ+ε)<min(b_gap,b_exit)` and `σ+δ+ε<e`. Keep `b_exit`, `b_gap` and `b₁` distinct. This theorem supplies entry and exit control for the declared smooth trajectories.

Patch charts using a global current test map `Φ(C)=(2^(−j)∫_C α_j)_(j≥1)`. Choose smooth one-forms `α_j` whose real linear span is dense and normalize each so `||α_j||_{C¹}≤1` and the comass `||dα_j||_∞≤1`; rescaling each nonzero form preserves density of the span. Use uniform C¹ bounds and quotient by overall sign for unoriented images. On the compact controlled Lipschitz graph closure, prove continuity of Φ in the C⁰ graph topology by strip Stokes and injectivity up to orientation. Equip unoriented images with the quotient metric `d_{±}([v],[w])=min(‖v−w‖_{ℓ²},‖v+w‖_{ℓ²})`; for an image C and nonempty K_c set `r_Φ(C)=dist_{d_{±}}([Φ(C)],[Φ(K_c)])`. For every η>0 choose b_η,r_η>0 such that every controlled graph with `|L_g(C)−c|≤b_η` and `r_Φ(C)<r_η` satisfies `dist_V(C,K_c)<η`. To prove this joint modulus, argue by contradiction: a violating sequence with length tolerance tending to zero and current distance tending to zero has a C⁰-convergent subsequence in the compact controlled graph closure; compactness of K_c and continuity of Φ identify its limit with a member of K_c, modulo orientation, by injectivity of the dense current tests. Thus its Fréchet distance and length difference both tend to zero, contradicting the fixed V-distance. Choose η small enough for the signed-height C⁰ chart-reset threshold as well as the desired V-neighborhood. This argument applies only on the controlled graph closure; it asserts no global inverse-continuity on V. When K_c is empty, use the separate empty-critical-set branch in R4.9.6d rather than defining r_Φ. For a smooth variation with velocity `kN` (up to tangential reparametrization), Cartan’s formula and Stokes give `d/dt ∫_{C(t)}α_j=∫_{C(t)}dα_j(kN,T)ds`; hence its absolute value is at most `||dα_j||_∞∫|k|ds`. Cauchy–Schwarz and `Σ_(j≥1)4^(−j)=1/3` give `||Φ̇||≤C_B||k||₂`, `C_B=√(B_len/3)`, whenever length≤B_len. For controlled smooth graphs in the fixed graph union with `|L_g−c|≤b₁` and `r_Φ≥r₀/2`, prove `||k||₂≥m>0`: the graph ODE gives H² control for small curvature, hence a C¹ geodesic limit in K_c and a contradiction. Crossing a width r₀/2 annulus costs at least `e=m r₀/(2C_B)` of g-length. In a single fixed graph chart put `G_min=inf_box G>0` and `v_max=sup_box sqrt(G²+p²)<∞`. From u_t=v k/G and ds_curve=v ds_base obtain `||u_t||_(L²(ds_base))≤(sqrt(v_max)/G_min)||k||_(L²(ds_curve))`. Define `C_graph=sqrt(v_max)/G_min`; crossing an actual L²(ds_base) annulus of width ρ/2 costs `mρ/(2C_graph)`.

##### R4.9.6d. Family stopping and localization

After the final-neighbourhood construction in R4.9.6c, prove a global curvature gap outside that final C¹-open N_s on a strip `|L−c|≤b_gap`: `∫k² ds≥μ>0`. If embedded curves with lengths tending to c had curvature energy tending to zero, their constant-speed parametrizations would have a uniform H² bound; use covariant acceleration and the fixed smooth sphere embedding to pass to a C¹ geodesic limit. The crossing/annular arguments identify a primitive embedded geodesic of length c, and the low-order definition puts the approximating curves in N_s, a contradiction. This supplies the declared strip and curvature-energy lower bound μ. For K_c empty, the same contradiction gives a gap on the whole strip with N_s empty.

When K_c is nonempty, choose σ,δ,ε>0 with `ε<δ/4`, `max(σ,δ+ε)<min(b_gap,b_exit)`, `σ+δ+ε<e` and `c+2δ<B_len`. Thus the entire interval traversed above the low target lies inside both the curvature-gap and exit bands. For empty K_c choose the ceiling and gap-strip reserves without invoking an entry annulus or exit cost e. Choose `0<a_cut<a_cut+η_cut<c−σ` and a smooth nondecreasing χ_clock with χ_clock=0 on lengths ≤ a_cut and χ_clock=1 on lengths ≥ a_cut+η_cut. Given the ordinary smooth flow S_t(C), solve

`dt_C/dτ=chi_clock(L_g(S_(t_C)(C)))`, `t_C(0)=0`, and set `S̃_τ(C)=S_(t_C(τ))(C)`.

Prove completeness for every finite artificial time. Since 0≤χ_clock≤1, physical time cannot escape to infinity in finite τ. Approaching a finite maximal physical time would force length to zero by R4.9.6b; the scalar clock becomes stationary at positive cutoff length before that singularity. Local smooth-flow and scalar ODE dependence give finite-time smooth-family continuity; the smooth flat cutoff has no corner at L=a_cut. The positive cutoff makes every finite artificial time well-defined.

Put `Q_low={L<c−σ}`, `B_entry=N_s∪Q_low` and `A_end=U∪Q_low`. While a trajectory is outside N_s and above the low target, the clock has speed 1 and length decreases at rate at least μ, so it reaches the open set B_entry in finite artificial time. A trajectory entering Q_low stays there. After entry into N_s, any exit from U while still above c−σ would cost e, exceeding the available length reserve σ+δ+ε; it therefore reaches Q_low first. This proves post-entry confinement from B_entry into A_end. The post-entry conclusion applies to trajectories entering N_s. For empty K_c take B_entry=A_end=Q_low and use only the gap and monotone length.

For a compact smooth-topology family, choose at each parameter a finite time whose image lies in the open B_entry. Continuity gives an open parameter neighborhood landing in B_entry at that same time. A finite subcover and the maximum of these artificial times are valid: all parameters have entered B_entry and stay in A_end thereafter. More generally, for a locally finite partition of unity on the compact parameter image, suppose every chart active at C supplies an entry time τ_i(C) for this same starting curve and same flow, with entry into B_entry. The minimum τ_min among the finitely many active times is an actual entry; post-entry confinement keeps the trajectory in A_end for all later times. Thus any convex weighted time τ(C)=Σ_i φ_i(C)τ_i(C)≥τ_min is safe. It need not exceed every active chart's entry time. Continuity still requires the stated locally finite cover, continuous local times and common flow domain. Construct the cap on the compact parameter image by the finite/local selection below. The resulting common-time homotopy is continuous and nonincreasing in g-length.

For a V-continuous family first apply R4.9.6a with allowance ε, obtaining F⁺ continuous in V globally and in C∞ away from its original point locus. The compact subset `P_high={p:L_g(F⁺(p))≥c−σ}` is disjoint from that locus and carries the preceding finite-cover construction; all remaining endpoints are already in Q_low and stay there. Near any point parameter, actual V-continuity of F⁺ fixing that point gives `L_g(F⁺(p))<a_cut`, so the clock is stationary there. This point-neighborhood argument uses the actual vanishing length at the point locus. Concatenate regularization and this slowed g-flow. It fixes all input points and stays below `c+δ+ε<c+2δ`, with endpoint in A_end. One clock and time chosen for a family restrict to its faces; R4.9.6e constructs the exact cubical descent and compatible-choice comparisons from those intrinsic data.

##### R4.9.6e. Intrinsic relative cubical construction and restriction laws

Choose the regularization cap on the compact image K_image=u(P) in V. On K_image outside the point locus use the local common-survival and g-length allowance neighborhoods to construct a continuous positive cap b(C), shrinking it to zero as C approaches A; set b=0 on K_image∩A. This is a continuous selection from actual admissible intervals [0,b_local(C)], constructed by a locally finite partition on the metrizable positive-length locus. Halve a cap to leave a reserve. The regularization `S_round(C,s b(C)/2)` therefore depends on the input image C itself. Prove its continuity, all-point fixation and the same length bound. For positive-time smooth dependence at nonpoints consume the actual common-survival normal-graph parameter-dependence theorem in R4.9.6a. Use one cap on the union of the compact images of all faces in the chosen finite family, rather than independently selecting incompatible face times.

Suppose a finite cubical or simplicial parameter presentation has actual face-identification maps and its input u is equal on the identified faces. The equality may arise from reversal of contour parametrization; V already identifies that reversal. The intrinsic cap gives equal regularized curves on those faces, and the same length cutoff χ_clock and common artificial time give equal subsequent curves. Prove the equality at every homotopy time and descend the entire construction through the finite parameter quotient. Point-valued faces and every other originally point-valued parameter are fixed throughout. Construct the induced relative singular-chain prism and subdivision maps and prove their boundary formulas on the supplied AT singular carrier. This is a reusable relative-family output. The width-realization argument consumes the finite-chain adapter and AT prism/subdivision identity; it does not require every reusable cover/choice API below.

On the pullback cover u*E, lift the homotopy starting from its tautological initial side: construct `H̃:u*E×I→E` over H, with H̃((p,e),0)=e. This does not choose a global side section on P. Prove existence and uniqueness by local cover charts and finite parameter-prism subdivision, with the empty/full data fixed on point parameters. Uniqueness gives deck-exchange equivariance and all face/restriction laws, including orientation-reversing presentation identifications. This exports the pulled-back side data and relative-cover compatibility for later consumers; it is not an extra premise of the cap localization argument. No CW-type hypothesis on V is used.

For two admissible intrinsic caps on the same compact image, their convex interpolation stays positive off A and vanishes on A. It remains below the pointwise maximum of the two safe caps, whose whole interval is admissible. Apply regularization and the finite-cover clock construction to this joint compact comparison family. Choose one common artificial endpoint time at least as large as the two previously selected times and all joint-family entry times. At either end enlarge the old clock time to the common time; post-entry confinement keeps those endpoints in the low union. The middle comparison uses the same common time. This constructs an actual comparison of the shortening choices, with the original point locus fixed, the same length ceiling and localized endpoints. The same method on any required finite product of parameter cells supplies compatible finite higher comparisons. The estimates in R4.9.6a and R4.9.6d use compact parameter families, so these comparison products do not require a dimension-dependent geometric cell bound. Restriction of jointly chosen data is the declared face law.

Construct the finite parameter geometry API independently for the selected dimension≤3 cycle carriers: embed each triangulated carrier into R⁷ by moment-curve vertices and prove simplex intersections and relative-face identifications. For finite parameter cutoffs consume native Besicovitch's finite-dimensional theorem, whose conclusion is disjoint closed-ball color families and an open-ball cover; construct the finite extraction, shrunk cover and supported cutoffs. These finite-dimensional embedding and covering results are additional reusable outputs alongside the shortening and cap-localization theorem. The main localization proof chooses σ,δ from geometric entry/exit reserves; family mesh and the number of cells may vary.


#### R4.9.7. Cap localization, realization and three images

Prove the singular-chain localization lemma using the shortening theorem and the R4.9.3 finite relative-chain adapter, which realizes finite relative representatives with their polyhedral face identifications. Consume AlgebraicTopology’s singular small-chain theorem and subdivision chain homotopy, together with its cap-product boundary identity and relative-chain prism formula. Apply these identities to the shortened representative to show it still represents z_(i+1); use the finite-chain adapter and relative prism identity in the realization. If c_i=c_(i+1)=c and `a_cover|U=0` for an open U⊃K_c, deform a finite representative of z_(i+1) below c+δ. Subdivide subordinate to V^(<c−σ)∪U. Choose a cohomologous absolute cocycle for a_cover vanishing on U by extending its coboundary correction. Its cap kills U-supported pieces and gives a representative of z_i below c−σ. Prove the actual relative-boundary, cap and homotopy identities, contradicting the width. The acting class is absolute and the homology target remains relative to A.

If adjacent widths agree, K_c meets every point p, since otherwise U=V_p and the avoidance section would give a_cover|U=0. Consequently K_c contains infinitely many images globally: finitely many rectifiable images have area zero and cannot cover S². This gives at least one geodesic through each point, not an infinite family through each point. If K_(c_i) were empty, apply the shortening with U=∅ to lower its nonzero minimax class; hence every width is realized. Three distinct widths give three different images by length. An equal adjacent pair gives infinitely many images and therefore at least three. These alternatives prove the arbitrary-smooth-metric theorem, including geodesic degeneracies, with all reparametrizations and reversal already identified.

The covering, model and comparison APIs serve geometric topology without changing
its canonical volume or three-dimensional geometric-structure objects.

### Examples

The universal cover of a circle has fibre ℤ and countably many sheets;
that of S² has one sheet. For the unit circle the paths with angles πt/2
and −3πt/2 have the same endpoints on [0,1], but opposite points at t=1/2.
The line has only one affine geodesic between two fixed endpoints, so
compactness in the two-geodesic theorem cannot be dropped.

### Dependencies

The direct round-model part of R4.7 uses Tau Ceti's Gauss formula, R1 and
HopfRinow only. Comparison
uses R2–R3; Cartan–Hadamard uses Tau Ceti's norm-nondecreasing exponential
differential and R4.3's covering criterion, not R3. R4.3 uses Tau Ceti's
universal-cover manifold, fibre bijection and pullback metric, and
SmoothBundlesConnections B5.2, before applying Myers. R4.7's quotients use
Mathlib's quotient atlas and covering and Tau Ceti's quotient manifold,
descended metric and curvature naturality.
R4.6 supplies cut-locus integration to R4.1. R4.8 uses R3 and the topological
contracts named there; R4.9 uses its separately stated planar, parabolic and
finite-relative-homology inputs, never its own minimax conclusion.

## Layer 5: immersions and volume variation

### R5. Isometric immersions and minimal geometry

### R5a. Immersion geometry and first variation

For a smooth isometric immersion f:M→N, construct the tangent/normal orthogonal
splitting of f*TN and the pullback ambient connection. For embeddings compare the
orthogonal-complement normal bundle with GT Layer 1's normal bundle.
For every immersion construct the smooth bundle equivalence from
ν_f={ (p,w) : w⊥range(df_p) } to f*TN/df(TM), over M, sending w to [w];
its inverse sends [v] to the orthogonal projection of v onto ν_f,p. Smoothness
follows in local frames from the inverse positive Gram matrix of df and the
formula v↦v−df((df*df)⁻¹df*v). This is independent of the representative since
adding df(u) leaves the projection unchanged. The quotient norm equals the
normal norm. For embeddings use the native `TauCeti.SmoothEmbedding.NormalSpace`
fibres and identify their smooth assembly with the supplied normal bundle; for immersions the fibre is indexed by p, even when two images coincide.

- The two bundle maps are inverse, fibrewise linear and smooth over the identity of M.
- The comparison respects the quotient projection and the induced metric and topology.
- Restriction and isometries intertwining the immersions preserve the comparison.

**Checks.**

- For the line x↦(x,0), [(a,b)] maps to (0,b), with quotient norm |b|;
  projecting to (a,0) would not be independent of the representative.
- For the identity immersion the quotient and normal fibres are zero.
- For a point immersed in ℝ² the tangent image is zero and the comparison is
  the identity on ℝ², excluding a uniformly zero comparison.

*Needs:* SmoothBundlesConnections B2.1 (smooth pullback and Hom bundles);
GeometricTopology Layer 1 (embedding normal bundle); finite-dimensional
orthogonal projection and smooth inversion of positive Gram matrices.

Prove the induced tangential connection is Levi-Civita. For a flat ambient N, a
real inner-product space, this is Tau Ceti's Gauss formula
`CovariantDerivative.IsLeviCivitaConnection.inner_apply_eq_inner_mvfderiv`
(supplier contract), consumed here; R5a owns the case of a Riemannian ambient N,
through the pullback ambient connection. Define B,
the normal connection and S, and prove tensoriality/symmetry/self-adjointness,
frame/normal-change laws and smoothness. Include Gauss, Codazzi and Ricci
equations with the pinned signs, their sectional contraction, and Theorema
Egregium for surfaces and higher-dimensional hypersurfaces. By pair symmetry
they determine every component with at least three tangent slots and
⟨R^N(X,Y)η,ξ⟩; first Bianchi also determines the X↔Y-antisymmetric part
of ⟨R^N(X,η)Y,ξ⟩. Its symmetric part, the one-tangent components and the
all-normal components are not determined by these equations. Compare a
geodesic in hyperbolic space with a Euclidean line for the mixed-sectional case.
For tangent X,Y,Z,W and normal η,ξ pin
`⟨R^M(X,Y)Z,W⟩=⟨R^N(X,Y)Z,W⟩`
`+⟨B(X,W),B(Y,Z)⟩−⟨B(X,Z),B(Y,W)⟩`,
`(R^N(X,Y)Z)^⊥=(∇^⊥_X B)(Y,Z)−(∇^⊥_Y B)(X,Z)`, and
`⟨R^⊥(X,Y)η,ξ⟩=⟨R^N(X,Y)η,ξ⟩+⟨[S_η,S_ξ]X,Y⟩`,
with the normal covariant derivative of B also differentiating its tangent slots.

The second fundamental form API comprises:

- B is a smooth symmetric normal-valued bilinear form, independent of tangent frames.
- It transforms naturally under ambient isometry and open restriction.
- B=0 is equivalent to total geodesicity; its contractions give the averaged
  mean curvature only in positive source dimension.

**Checks.**

- On an affine Euclidean plane B=0; a fixed nonzero bilinear form is excluded.
- On the outward unit sphere B(X,Y)=−⟨X,Y⟩ν, so a unit tangent e has B(e,e)=−ν.
- On the unit cylinder in ℝ³, B(e_θ,e_θ)=−ν and B(e_z,e_z)=0.
  Its two principal values differ, excluding the model B=−gν for every immersion.

The shape-operator API comprises:

- S is linear in the normal argument and self-adjoint on each tangent fibre.
- It is paired with B by ⟨S_ηX,Y⟩=⟨B(X,Y),η⟩.
- Normal-frame changes, ambient isometries and restriction preserve that pairing.

**Checks.**

- On an affine Euclidean plane S_η=0 for every η.
- On the outward unit sphere S_ν=−Id and S_(−ν)=Id; forgetting normal linearity fails.
- On the unit cylinder S_ν has eigenvalues −1,0; its Gauss curvature is
  (−1)·0=0, whereas the unit sphere gives (−1)·(−1)=1.

The normal-connection API comprises:

- It is the normal projection of the pullback ambient derivative, satisfies
  the scalar Leibniz law, and preserves the induced normal metric.
- It commutes with restriction and immersion-preserving ambient isometries.
- Normal-frame changes obey the connection transformation law; its curvature
  is the Rᵖᵉʳᵖ used in the Ricci equation above.

**Checks.**

- For ℝ²⊂ℝ⁴ with constant normal e₃, ∇ᵖᵉʳᵖ_(∂x)e₃=0.
- For the same inclusion ∇ᵖᵉʳᵖ_(∂x)(x e₃)=e₃; the identically zero
  operation fails the Leibniz law.
- With n₁=cos x e₃+sin x e₄ and n₂=−sin x e₃+cos x e₄,
  ∇ᵖᵉʳᵖ_(∂x)n₁=n₂ and ∇ᵖᵉʳᵖ_(∂x)n₂=−n₁, so its matrix is skew
  and the derivative of ⟨n₁,n₂⟩ is 1−1=0.

*Needs:* R1 curvature and tensor connections; R5a smooth normal comparison;
SmoothBundlesConnections B2–B4; Tau Ceti's Gauss formula for a flat ambient
(supplier contract).

#### R5a.1. Orientation-free C² relative volume

Own the C² regularity of the relative-volume functional on these same immersion carriers,
without requiring orientability of the source P. Take a jointly smooth
family of immersions F_t:P→N, F_0=f, for t in an open interval about 0.
For compact P, including smooth boundary or corners, impose no support restriction
on the family for this C² regularity theorem. For noncompact P require F_t=f
outside one fixed compact subset of the interior, uniformly in that interval. Use the native
orientation-free measure `TauCeti.riemannianVolume` for g_0=f*g_N.
Define the positive relative density J_t by the square root of the
Gram determinant of g_t=F_t*g_N relative to g_0, and prove
`dvol_(g_t)=J_t dvol_(g_0)`. Prove chart/basis independence, compatibility
with DG12's volume densities and with the positive oriented volume form
when an orientation is chosen. This is a density comparison on the same
metric, not a second Riemannian measure.

On each compact parameter subinterval, use compactness of P (in the compact
case), or of the fixed variation support (in the noncompact case), and positivity
for uniform lower Gram and parameter-derivative bounds. Prove the relative-volume functional
`V(t)=∫_P(J_t−1) dvol_(g_0)` is C² and compute its first two derivatives
by differentiation under the integral. On a compact source compare it to
`Vol(F_t)−Vol(F_0)`. On a noncompact source J_t−1 and its relevant derivatives
have the fixed compact support, so V is finite without finite total volume.
The compact case includes pointwise fixed-boundary families F_t|∂P=f|∂P
without requiring them to be fixed on a collar; the C² regularity assertion also
allows moving boundary values and asserts no boundary-variation formula.
Compact interior support on noncompact sources and its smooth-domain restrictions
retain the support-away-from-boundary hypothesis. State explicit mixed parameter/
spatial regularity hypotheses for any finite-regularity extension; joint
smoothness supplies all required derivatives here.

This construction uses only native metric/volume calculus, DG12 and the
earlier immersion carriers. R5a.2's first variation and R5b's Hessian use this
same relative-volume functional. CalibratedGeometry C3 consumes its C²
dependence and supplies the comparison with C2's oriented chain integration.

The relative-density API comprises:

- J_t is positive and smooth, independent of charts and bases, and J_0=1.
- Its multiplication with the reference density gives the induced volume density.
- Restriction and change of reference metric respect the density ratio, and
  joint smooth variation permits the stated two derivatives under the integral.

**Checks.**

- For the constant immersion family, J_t=1 and both variation derivatives
  of the relative density vanish.
- For a Euclidean homothety F_t=(1+t)f in dimension m, with |t|<1,
  J_t=(1+t)^m, J′_0=m and J″_0=m(m−1); using the Gram determinant
  without its square root would double the first derivative.
- In dimension zero the empty Gram determinant is 1, so J_t=1 and
  both derivatives are zero. Changing orientation in positive dimension
  also leaves J_t positive; a signed determinant is the wrong density.

*Needs:* R5a induced metric; DifferentialGeometry Layer 12 densities;
compact-parameter differentiation under the integral. The fixed compact
support condition handles noncompact sources.

#### R5a.2. First variation and immersion examples

Define principal curvatures as the eigenvalues of S_ν for a chosen unit normal
on a hypersurface, and for source dimension m>0 define H=(tr B)/m.

- The principal values are real with multiplicities, independent of tangent
  orthonormal frame, and change sign when ν is reversed.
- H is a smooth normal vector field, independent of all frame choices; for a
  hypersurface ⟨H,ν⟩ is the average of the principal values.
- Ambient isometries and restriction preserve H; minimality is H=0.

**Checks (principal curvatures).**

- A Euclidean hyperplane has every principal value 0.
- The unit sphere has outward values all −1 and inward values all +1.
- The unit cylinder has values −1,0, including the zero multiplicity in its spectrum.

**Checks (averaged mean curvature).**

- On an affine plane H=0.
- On the unit two-sphere tr B=−2ν and H=−ν; on the radius-two sphere
  H=−ν/2. Using the trace without division gives −2ν in the first case.
- On the unit cylinder tr B=−ν and H=−ν/2; reversing the choice of ν changes
  both scalar principal signs and ν, leaving this vector unchanged.

*Needs:* R5a's B/S pairing; the finite-dimensional self-adjoint spectral theorem;
positive source dimension for division by m. The first-variation theorem below
additionally uses R5a.1's relative-volume functional and DifferentialGeometry
Layer 12 integration and divergence.

Prove total geodesicity iff B=0 and hence minimality. For compact boundaryless immersions, and for
compactly supported variations on noncompact boundaryless immersions, derive
the first volume variation
`δVol=∫div_M X^⊤−m⟨H,X^⊥⟩`; compact support kills the divergence term.
Stationarity is equivalent to H=0. In Euclidean space prove `Δ⁺f=−mH`, hence
minimality iff all coordinate functions are harmonic. For submanifolds of a
round sphere prove the sphere/Euclidean mean-curvature dictionary and the
minimal cone equivalence away from the cone vertex. For an m-dimensional
submanifold of the unit sphere, pin
`H_C(rx)=m/((m+1)r)·H_M(x)` for r>0, using the spherical H_M and the
(m+1)-dimensional Euclidean cone.

Give reusable coordinate formulas for induced metrics, Christoffel coefficients,
B, S, H and K of a parametrization F of an open subset of ℝ^m in a Euclidean space;
the cross-product formula raises an index with the inverse first fundamental form.
Their building blocks are Tau Ceti's (supplier contract), consumed here: the induced
metric `g_ij=⟨∂_iF,∂_jF⟩` is `TauCeti.inducedRiemannianMetric_inner`, the
Christoffel symbols of the first kind `⟨∇_(∂_i)∂_j,∂_k⟩=⟨∂_i∂_jF,∂_kF⟩` are the
Gauss formula `CovariantDerivative.IsLeviCivitaConnection.inner_apply_eq_inner_mvfderiv`
on the coordinate fields, and B and S in the parametrization are
`TauCeti.secondFundamentalForm` and `TauCeti.shapeOperator`, paired by
`TauCeti.inner_fderiv_shapeOperator_apply`. R5a.2 owns their identification with
R5a's intrinsic B and S, the coordinate formulas for H and K, and the examples
below. On the unit round sphere in equatorial stereographic coordinates x,
the metric `g_ij=4δ_ij/(1+|x|²)²` is Tau Ceti's
`TauCeti.inner_mfderiv_stereographic'_symm` under the substitution y=2x between
Mathlib's chart `stereographic'` and the equatorial one, with the Jacobian factor 2²
(at x=0 the coefficient is 2²·(4/4)²=4; omitting that factor gives 1), and K=1 is
`TauCeti.hasConstantSectionalCurvature_sphere` (supplier contract). Compute
`Γ^k_ij=−2(δ^k_i x_j+δ^k_j x_i−δ_ij x_k)/(1+|x|²)` and H=−position. Compute the
helicoid `(u,v)↦(v cos u,v sin u,a u)` with pitch a≠0
(H=0, K=−a²/(a²+v²)²), and the paraboloid `(u,v)↦(v cos u,v sin u,v²)`
on v>0 (with a separate Cartesian chart at its vertex),
`K=4/(1+4v²)²` and `H=(2+4v²)/(1+4v²)^(3/2)·ν`,
where `ν=(−2v cos u,−2v sin u,1)/√(1+4v²)`.

For surfaces of revolution `(u,v)↦(f(v)cos u,f(v)sin u,g(v))`, assume f>0 and
`f′²+g′²>0` on the coordinate interval. Compute the metric, all Christoffel
symbols and geodesic equations; for arclength geodesics prove Clairaut's
`f(v)cos β=f(v)² u′` is constant, with β the angle to the parallel circle
direction. Classify regular rotational minimal surfaces
locally: planar pieces and the catenoid family, with complete connected
nonplanar rotational examples classified up to rigid motion and scaling.
Derive the correct generating-curve ODE without assuming g is an invertible
parameter at every point.

#### R5a.3. Paraboloid geodesics and the vertex pole

For the paraboloid z=x²+y², prove completeness of the induced metric using
its closed proper graph embedding and the local comparison of intrinsic and
coordinate distances. In polar coordinates away from the vertex the metric is
`(1+4r²)dr²+r²dθ²`. For every maximal all-time nonconstant nonmeridional
geodesic, reparametrize by unit speed and choose an angular orientation so
`r²θ′=a>0`. Construct a real angular lift on all ℝ; the conserved nonzero
momentum keeps the curve away from the vertex. Prove

`(r′)²=(r²−a²)/(r²(1+4r²))`,

`r″=a²/(r³(1+4r²))−4r(r′)²/(1+4r²)`.

There is a unique turning time. Translate it to zero, with r(0)=a and
θ(0)=θ₀, and prove `r(−t)=r(t)` and `θ(−t)=2θ₀−θ(t)`.
Use uniqueness for the smooth second-order geodesic system, including
`r″(0)=1/(a(1+4a²))>0`; uniqueness for the squared first integral does
not establish passage through the turn. On the outgoing branch prove

`T_a(R)=∫_a^R s√(1+4s²)/√(s²−a²) ds`,

`A_a(R)=∫_a^R a√(1+4s²)/(s√(s²−a²)) ds`,

with `t=T_a(r(t))` and `θ(t)−θ₀=A_a(r(t))` for t≥0.
Prove integrability at a by comparison with `(s−a)^(−1/2)`, continuity
from value zero, and strict increase on [a,∞). For R≥a prove
`T_a(R)≥R²−a²` and `A_a(R)≥2a log(R/a)`. These integral comparisons
prove r(t)→∞ and unbounded angular winding without inferring derivative
limits from bounded monotonicity.

For each n≥0 construct the unique R_n>a with `A_a(R_n)=(n+1)π` and
put t_n=T_a(R_n). Prove t_n>0, both sequences strictly increase to infinity,
and `γ(t_n)=γ(−t_n)`. The equal points have distinct radii R_n. Prove
these crossings transverse: the polar tangent vectors are
`(r′(t_n),a/R_n²)` and `(−r′(t_n),a/R_n²)`, with nonzero determinant.
Thus the conclusion concerns infinitely many distinct self-intersection
points of the all-time image; a restricted geodesic segment need not cross
itself. The meridians are the separate a=0 case. That every nonmeridional
geodesic of z=x²+y² meets itself infinitely often is Wilson,
*Differential Geometry, Examples 3* (Cambridge, Lent 2016), Problem 14, p. 2;
the headline adds transversality, crossing times symmetric about the turning
time and unbounded crossing radii. Clairaut's relation r cos φ=const along a
geodesic of a surface of revolution, φ the angle with the parallels, is
Nicolaescu, *Lectures on the Geometry of Manifolds*, Theorem 5.1.17, p. 212;
with unit speed it is the conserved momentum r²θ′=a used above.

At the vertex use the Cartesian chart and radial arclength
`ℓ(r)=∫_0^r √(1+4s²) ds`. The radial/rotational exponential variations
give a normal Jacobi field whose length is r(ℓ)>0 for ℓ>0. Combine this
with the tangential Jacobi field to prove the vertex has no conjugate points,
despite `K=4/(1+4r²)²>0`. Hence the exponential map at the vertex has no
critical point, and on the complete surface it is a covering map by the
argument of Nicolaescu, *Lectures on the Geometry of Manifolds*, proof of
Theorem 6.2.6, p. 238: the pulled-back metric exp*g on the tangent plane is
positive definite and makes exp a local Riemannian isometry onto S; the radial
lines are therefore geodesics of exp*g for all time, so exp*g is complete by
Hopf–Rinow, and R4.3's criterion for a local Riemannian isometry from a
nonempty complete manifold onto a connected one makes exp a surjective
covering. There nonpositive curvature serves only to exclude critical points.
R4.3's other criterion, for a local diffeomorphism with `|df(v)|≥|v|` and
complete domain, does not apply here, since positive curvature makes d exp
shorten angular vectors. A covering of the simply connected S by the connected
tangent plane has one sheet, so the exponential map is a smooth bijective local
diffeomorphism, hence a diffeomorphism.

**Checks.**
- The polar metric is `(1+4r²)dr²+r²dθ²`: from z=x²+y², dz=2r dr and
  dx²+dy²=dr²+r²dθ²; forgetting the graph height gives the flat plane, whose
  geodesics never cross themselves.
- For a=1 the first integral gives r′=0 exactly at r=1 and
  `r″(0)=1/(1·5)=1/5>0`; the squared first integral alone admits the circle
  r≡1, which is not a geodesic because the radial equation then reads
  `−rθ′²=−1≠0`.
- At R=a both `T_a(a)` and `A_a(a)` vanish, as do the bounds `R²−a²` and
  `2a log(R/a)`: the bounds are sharp at the turning radius, and they hold
  because `√(1+4s²)≥2s` and `√(s²−a²)≤s` make the integrands at least 2s
  and 2a/s.
- The crossing determinant at t_n is `2a r′(t_n)/R_n²>0` because r′>0 on
  the outgoing branch; a tangential return would need r′(t_n)=0, which
  happens only at the turn.
- At the vertex K=4 and the radial Jacobi field satisfies `r″+Kr=0` with
  `r(0)=0`, `r′(0)=1` and `r(ℓ)>0` for all ℓ>0, so there is no conjugate
  point although K>0; on the round sphere of curvature 4 the same initial
  data vanish again at ℓ=π/2.
- For v of length ℓ along a meridian and a unit w⊥v, `|d(exp)_v(w)|=r(ℓ)/ℓ`.
  At r=1, `ℓ(1)=√5/2+arsinh(2)/4≈1.4789`, so the value is ≈0.6762<1: the
  criterion `|df(v)|≥|v|` fails, and only the local-isometry criterion for
  exp*g yields the covering.

Define `paraboloidGraph` on ℝ² by (x,y)↦(x,y,x²+y²). The paraboloid is a
smooth surface S with a global graph chart, a smooth diffeomorphism e : S → ℝ²,
and any smooth Riemannian bundle on S whose inner product is
⟨d(F∘e)_x u,d(F∘e)_x v⟩ for this fixed graph F. This determines the metric
exactly; the order-one regularity used by the native geodesic predicate is a
consequence of smooth regularity for the same bundle. The metric lives on S,
not on the coordinate plane, because ℝ² already carries its flat metric.

- Projection onto the first two coordinates is the inverse on the graph.
- The differential is (u,v)↦(u,v,2xu+2yv), hence is injective everywhere.
- The induced metric is u·v+4(x·u)(x·v), and in polar coordinates is
  (1+4r²)dr²+r²dθ² for r>0; Cartesian coordinates include the vertex.

**Checks.**

- F(0,0)=(0,0,0), and the metric at the vertex is the Euclidean inner product.
- F(1,0)=(1,0,1); the radial unit coordinate vector has metric square 5
  and the angular unit coordinate vector has metric square 1.
- F(−1,0)=(−1,0,1)≠F(1,0); replacing the graph by its height alone would
  identify these two points and would not be an immersion at the vertex.

The headline `paraboloid_geodesic_crossings` applies to any native geodesic
of S on all ℝ with unit speed in this metric, read in the chart as a curve γ
in ℝ² with nonzero angular momentum at zero.
It produces a time t₀ and positive strictly increasing τ_n→∞ with
γ(t₀+τ_n)=γ(t₀−τ_n), strictly increasing unbounded Euclidean radial coordinates,
and nonzero determinant of the two chart velocities at each crossing.
The headline `paraboloid_vertex_pole` identifies the exponential map at the
vertex e⁻¹(0) on the entire tangent plane with a smooth diffeomorphism onto S.
These are the geometric headlines of this section.
Their statements use the graph immersion with its induced smooth metric and
the native geodesic and exponential carriers. The integral estimates above
are part of their proof and Checks; the induced-metric comparison is part of
R5a's immersion construction.

*Needs:* HopfRinow (Completed) Layers 2–4 (geodesic ODE, exponential map,
completeness, and completeness of exp*g from its radial geodesics), R2 (Jacobi
fields and `d exp`), R3 (conjugate points), R4.3 (a local Riemannian isometry
from a nonempty complete manifold onto a connected one is a surjective
covering), R5a.2 (surface-of-revolution formulas and Clairaut's relation); Tau
Ceti `TauCeti.Manifold.contMDiffOn_riemannianExp_tangentBundle` (smoothness of
the exponential map at the vertex), `Bundle.ContMDiffRiemannianMetric.pullback`
and `Bundle.ContMDiffRiemannianMetric.pullback_inner` (the metric exp*g on the
tangent plane), `TauCeti.IsLocalRiemannianIsometry.mfderiv_leviCivitaConnection_mpullback`
(exp carries the Levi-Civita connection of exp*g to that of g, so the radial
lines are geodesics of exp*g), `TauCeti.isLocalDiffeomorph_of_mfderiv_eq` (exp,
with invertible differential everywhere, is a local diffeomorphism) and
`IsCoveringMap.injective` (a covering of the simply connected S by the
path-connected tangent plane has one sheet); Mathlib
`Homeomorph.contractibleSpace` and `SimplyConnectedSpace.ofContractible` (S is
simply connected through e) and `IsLocalDiffeomorph.diffeomorphOfBijective` (the
bijective local diffeomorphism exp is a diffeomorphism).

### R5b. General normal second variation and hypersurface stability

This item consumes R5a's immersion geometry, R5a.1's orientation-free
C² relative-volume lemma and R5a.2's first variation. CalibratedGeometry C3
also consumes R5a.1; R5b has no CalibratedGeometry input. No current,
minimizing-regularity or positive-mass theorem is an input here.

For a smooth minimal isometric immersion f:P^m→N and smooth compactly
supported normal fields V,W, construct their smooth normal variations
using the pullback normal bundle and the ambient exponential on its
actual local domain. The sources may be nonorientable. On noncompact P,
vary only a compact region containing the variation support and use R5a.1's
relative-volume functional rather than a possibly infinite total volume.
For sources with boundary use variations fixed on a neighborhood of that
boundary. Prove acceleration independence at minimality and the polarized
second-volume-variation formula for normal fields at a minimal immersion:

`Q(V,W)=∫[⟨∇⊥V,∇⊥W⟩−Σ_i⟨R^N(V,e_i)e_i,W⟩`
`−Σ_ij⟨B(e_i,e_j),V⟩⟨B(e_i,e_j),W⟩] dvol_P`.

Prove frame independence, symmetry, compact-support locality, smooth
isometry transport and the actual normal Jacobi differential operator,
its ellipticity, principal symbol and formal self-adjointness. Stability
means Q(V,V)≥0 for every such normal section. Do not identify normal
sections with scalar functions unless a global unit normal is supplied.

For a two-sided hypersurface choose a smooth unit normal ν, set
`A(X,Y)=⟨B(X,Y),ν⟩`, and construct the hypersurface Jacobi operator
`L=Δ⁺−(|A|²+Ric_N(ν,ν))`. Prove
`Q(φν,ψν)=∫[⟨∇φ,∇ψ⟩−(|A|²+Ric_N(ν,ν))φψ]=∫φ Lψ`.
With R5a's B convention, the derivative of trace scalar mean curvature
at a minimal hypersurface is `−Lφ`; that of the averaged scalar mean
curvature is `−Lφ/m`, m>0. Prove these actual linearizations, normal-reversal
and orientation independence. On a one-sided hypersurface give the normal
line-bundle form and its double-cover scalar description with deck-odd
sections, not the scalar inequality for every function on the cover.

Prove the W¹,²_0 quadratic-form extension on relatively compact smooth
domains and its agreement with the smooth form. Consume PDE A1–A6, D16–D19 and
E20–E22's Sobolev, trace and bounded-domain elliptic/Dirichlet estimates, and own
their finite-chart specialization to bundles. Let E be a smooth real vector
bundle of finite rank over a Riemannian manifold M, with a fibre metric, a
metric connection ∇ (SmoothBundlesConnections B2–B4) and a smooth section K of
End(E) with K_x symmetric for the fibre metric at every x, and let
`L=∇*∇+K`, where `∇*∇` is PseudodifferentialOperators P1.0's connection
Laplacian, with form `∫_D[⟨∇u,∇v⟩+⟨Ku,v⟩] dvol`. The normal Jacobi operator
and the second-variation form Q above are the case M=P, E=ν_f, ∇=∇⊥ and
`⟨Ku,v⟩=−Σ_i⟨R^N(u,e_i)e_i,v⟩−Σ_ij⟨B(e_i,e_j),u⟩⟨B(e_i,e_j),v⟩`. The
specialization comprises actual
metric/connection weights, trace-compatible transitions, bounded
potential, coercive shift, form closure and compact embedding. On a relatively
compact smooth domain D⊂M write V=W¹,²₀(D;E), H=L²(D;E), J:V→H for the
inclusion, injective and compact with dense range, and Q for the extended form,
bounded and symmetric on V. Prove the coercive shift: for k₀≥0 with
`⟨K_x e,e⟩≥−k₀|e|²` for every x∈D̄ and e∈E_x, `Q(u,u)≥‖∇u‖²−k₀‖Ju‖²`, so there
are c≥0 and α>0
with `Q(u,u)+c‖Ju‖²≥α‖u‖²_V` for every u∈V.

Define the Dirichlet operator L_D of L, the Dirichlet Jacobi operator in the
normal-bundle case, as the partial operator on H whose graph
is the set of pairs (Ju,f) with Q(u,v)=⟨f,Jv⟩ for every v∈V; injectivity and
dense range of J make u and f unique, and its domain is the image under J of the
u for which v↦Q(u,v) is bounded by a multiple of ‖Jv‖. Prove that L_D is
self-adjoint with `⟨L_D x,x⟩≥−c‖x‖²` on its domain, that `(L_D+c)⁻¹` is the
solution operator S, Tau Ceti's `IsCoercive.formSolutionOperator` of the shifted
form B=Q+c⟨J·,J·⟩ along J, hence compact, symmetric and positive with zero
kernel, and that L_D does not depend on the choice of c and α. A route: S is
bounded, symmetric and injective on H, so the inverse of S on its range, which is
dense, is self-adjoint; and Ju lies in that range exactly when v↦Q(u,v) is
bounded by a multiple of ‖Jv‖, by the Riesz representation on the closure of the
range of J, which is H. The Dirichlet eigenvalues are κ−c for the variational
eigenvalues κ of the basis of `IsCoercive.exists_hilbertBasis_forall_apply_eq_smul_inner`,
of finite multiplicity and accumulating only at +∞; when V≠0 the least is
`‖S‖⁻¹−c`, by `IsCoercive.isLeast_rayleighQuotient`. Prove the index statement:
the supremum of the dimensions of subspaces of V on which Q is negative definite
is the number of negative Dirichlet eigenvalues counted with multiplicity, and is
attained on the span of their eigenvectors. Construct the domain/regularity
comparison and compact resolvent on those compact domains. This is not a general
closed-form or spectral theory: only forms that are coercive after a shift, along
a compact embedding with dense range, occur. CKG K5a retains compact-boundaryless
bundle Laplace theory and PDO P5/P6 does not supply a Dirichlet boundary theorem.

- L_D is self-adjoint and bounded below by −c, and `(L_D+c)⁻¹=S` is compact.
- Its eigenvalues are κ−c, of finite multiplicity, and its eigenvectors form a
  Hilbert basis of H.
- The index of Q on V is the number of negative eigenvalues of L_D, with
  multiplicity.

**Checks.**

- V=H=ℝ, J=id, Q(u,v)=2uv, c=0, α=2: the solution map sends h to h/2, so S=½Id
  and L_D=2Id, the multiplication Q represents. Exchanging the two entries of the
  graph, the plausible inverse convention, gives ½Id instead.
- V=H=ℝ, J=id, Q(u,v)=−uv: the shift c=1 gives B=0, which is not coercive, and
  c=2 gives B(u,v)=uv with α=1, S=Id and L_D=S⁻¹−2=−Id, the multiplication Q
  represents; c=3 gives S=½Id and the same L_D=2−3=−1. The sign error S⁻¹+c
  would give 3Id.
- On an arc D of length ℓ of the equator of the round unit S², A=0 and
  Ric_N(ν,ν)=1, so L=−d²/ds²−1 and the Dirichlet eigenvalues are (πk/ℓ)²−1, k≥1,
  with eigenfunctions sin(πks/ℓ); c=2 and α=1 are admissible. At ℓ=3π/2 exactly one
  eigenvalue, 4/9−1=−5/9, is negative, so the index is 1, R3's geodesic index n−1
  at L=3π/2 for n=2; at ℓ=π the least eigenvalue is 0, nullity without index.
- Form domain versus operator domain, on the flat interval D=(0,π) with
  Q(φ,ψ)=∫φ′ψ′: the tent function φ=min(s,π−s) lies in V, but Q(φ,v)=2v(π/2) is
  not bounded by a multiple of the L² norm of v, so φ∉dom L_D; s(π−s) lies in
  dom L_D with L_D(s(π−s))=2.

Own the boundary H² estimate for `L=∇*∇+K` on a relatively compact smooth domain D
with smooth boundary and the actual smooth bundle E and connection ∇, in
particular the normal bundle and ∇⊥. For
L, a weak u∈W¹,²₀ with Lu=f∈L², that is Q(u,v)=⟨f,Jv⟩ for every v∈V, satisfies
`‖u‖_(W²,²)≤C(‖f‖_(L²)+‖u‖_(L²))`. Construct the finite-chart bundle W²,²
carrier and equivalent transition/trace norms. Prove the boundary estimate by
smooth boundary flattening, localized tangential difference quotients and the
first-order energy estimate; control connection/metric commutators and recover
the second normal derivative from the uniformly elliptic normal coefficient.
The principal symbol is the scalar metric symbol times the identity. This
boundary H² theorem is a target here, not an assumed PDE E theorem.
Own the Dirichlet-domain identification: L_D has domain exactly W²,²(D;E)∩W¹,²₀(D;E), with graph norm
equivalent to W²,². Compare it with the smooth differential operator and give
interior/up-to-boundary higher regularity for smooth data by the same chart
argument. No global Fredholm claim on an arbitrary noncompact base is inferred.

Own the scalar Gauss equation of a minimal hypersurface with full scalar curvature:
`Scal_P=Scal_N−2Ric_N(ν,ν)+(tr A)²−|A|²`, and
the full-scalar stability inequality: at minimality stability is
`∫(2|∇φ|²+Scal_P φ²)≥∫(Scal_N+|A|²)φ²`.
In dimension 2, `Scal_P=2K`, so the ambient full scalar appears with
coefficient 1/2 in the equivalent surface inequality. Boundary/free-boundary
formulas require their own stated variation class and outward/normal
second-fundamental-form signs; the compactly supported interior formula
does not silently include them. CalibratedGeometry C6 retains its special
Lagrangian/Hodge Hessian identity on its existing carrier.

### R5c. Schrödinger operators on compact manifolds: spectrum, principal eigenfunction and Dirichlet problem

R5b supplies the Dirichlet realization of a symmetric Schrödinger operator on
a Riemannian vector bundle over a relatively compact smooth domain, the
normal Jacobi operator being a case. R5c adds the closed manifolds, regularity
up to the boundary at every order,
the min–max characterization, the index on smooth sections and, for
scalar operators, the theory of the lowest eigenvalue (simplicity, positivity,
strict domain monotonicity), the first positive eigenvalue of Δ⁺ with its
Rayleigh characterization, and the inhomogeneous Dirichlet problem with
positivity.

Let (M,g) be a Riemannian manifold of dimension m≥1, E→M a smooth real vector
bundle of finite rank with a fibre metric and a metric connection ∇
(SmoothBundlesConnections B2–B4), and K a smooth section of End(E) with K_x
symmetric for the fibre metric at every x, as in R5b. The symmetric bundle
Schrödinger operator is

`L=∇*∇+K`,

where `∇*∇` is PseudodifferentialOperators P1.0's connection Laplacian, the
negative metric trace of the second covariant derivative. It is a P1.0
differential operator of Laplace type with leading scale 1, formally
self-adjoint for the canonical density. In the scalar case E is the trivial
line with ∇=d and K is a smooth function q, and

`L=Δ⁺+q`, that is `Lu=−Δu+qu`

for Tau Ceti's `TauCeti.Manifold.laplaceBeltrami` Δ; prove this identification
from `TauCeti.Manifold.laplaceBeltrami_eq_sum_hessian`. R5b's normal Jacobi
operator is the case M=P, E=ν_f, ∇=∇⊥ and
`⟨Ku,v⟩=−Σ_i⟨R^N(u,e_i)e_i,v⟩−Σ_ij⟨B(e_i,e_j),u⟩⟨B(e_i,e_j),v⟩`,
and its hypersurface Jacobi operator is the scalar case `q=−(|A|²+Ric_N(ν,ν))`.

The standing manifolds are boundaryless and no carrier for manifolds with
boundary is introduced: as in R5b, a compact manifold with smooth boundary is
the closure of a relatively compact smooth domain D⊂M, an open subset with
compact closure each of whose boundary points has a chart of M in which D is
the half-space x_m>0. Its boundary ∂D is a compact embedded hypersurface, and
g, E, ∇ and K on D̄ are the restrictions of the data on M. The Dirichlet case
is ∂D≠∅. In the closed case, ∂D=∅, D is a compact union of connected
components of M; replace M by D, so that M is compact and D=M. Write C^∞(D̄;E)
for the sections of E over D that are smooth up to the boundary, that is
smooth on D with every derivative, in charts of M and smooth local frames of
E, extending continuously to D̄, and C^∞_c(D;E) for the smooth sections with
compact support in D.

Write H=L²(D;E), V=W¹,²₀(D;E), which is W¹,²(M;E) in the closed case, J:V→H
for the inclusion and

`Q(u,v)=∫_D[⟨∇u,∇v⟩+⟨Ku,v⟩] dvol_g`.

Fix k₀≥0 with `⟨K_x e,e⟩≥−k₀|e|²` for every x∈D̄ and e∈E_x. Then
`Q(u,u)≥‖∇u‖²−k₀‖Ju‖²`, and the shifted form Q+c⟨J·,J·⟩ is coercive on V for
every c>k₀.

In the Dirichlet case R5b supplies, for (E,∇,K): the
finite-chart Sobolev carriers and the W¹,²₀ form extension, the compact
inclusion J with dense range, the self-adjoint Dirichlet operator L_D with
`(L_D+c)⁻¹=S` for S Tau Ceti's `IsCoercive.formSolutionOperator` of the shifted
form along J, the Hilbert basis of eigensections with eigenvalues κ−c, the
least eigenvalue as the least Rayleigh quotient, the index statement on V, the
boundary H² estimate, the operator domain W²,²∩W¹,²₀ and regularity up to the
boundary for smooth data. Consume them; none is proved again here.
Construct the finite-chart carriers W^(k,2)(D;E) for every k≥0 as
R5b constructs W²,², and prove the boundary estimate at every order: for
f∈W^(k,2)(D;E), a u∈V with Q(u,v)=⟨f,Jv⟩ for every v∈V lies in
W^(k+2,2)(D;E), and

`‖u‖_(W^(k+2,2))≤C_k(‖f‖_(W^(k,2))+‖u‖_(L²))`,

by R5b's boundary flattening and tangential difference quotients applied to
the tangentially differentiated equation, the equation itself giving the
normal derivatives; for scalar L the boundary step is PDE E20's global
H^(k+2) theorem in boundary charts. Prove that C^∞(D̄;E) is the intersection
of the W^(k,2)(D;E), k≥0, from PDE A4's embeddings through A6's extension
operator in boundary charts; in these terms R5b's regularity for smooth data
is that f∈C^∞(D̄;E) gives u∈C^∞(D̄;E).

In the closed case nothing of this is rebuilt: consume
[ComplexKahlerGeometry](../ComplexKahlerGeometry/README.md) K5a. For c>k₀ the
operator L+c is a formally self-adjoint nonnegative Laplace-type system on the
compact boundaryless M, and K5a supplies its Gårding inequality, the
compactness and dense range of J, its H² realization, self-adjoint with
compact resolvent, a Hilbert basis of L²(M;E) of smooth eigensections, and
elliptic regularity. Here V is K5a's first-order Sobolev space of E, and
Q+c⟨J·,J·⟩ is K5a's energy form of L+c. Define L_D, for D=M, as that
realization minus c. Prove
that it does not depend on c, that `(L_D+c)⁻¹=S` for the solution operator S
of Q+c⟨J·,J·⟩ along J as in R5b, and that its eigenvalues are those of L+c
minus c.

*Needs:* R5b (the Dirichlet realization for (E,∇,K)); ComplexKahlerGeometry
K5a (closed case); PDE A4, A6 and E20; PseudodifferentialOperators P1.0 (the
connection Laplacian); SmoothBundlesConnections B2–B4; Tau Ceti
`TauCeti.Manifold.laplaceBeltrami`,
`TauCeti.Manifold.laplaceBeltrami_eq_sum_hessian` and
`IsCoercive.formSolutionOperator`.

In both cases let D be nonempty and E of positive rank, so that H is
infinite-dimensional, since m≥1. Deduce from the realization that the
spectrum of L_D is real,
consists of eigenvalues of finite multiplicity
(`IsCoercive.finiteDimensional_eigenspace_formSolutionOperator`) and has no
finite accumulation point. List the eigenvalues with multiplicity as

`μ₁≤μ₂≤…`, `μ_k→+∞`,

written μ_k(L,D), or μ_k(L) in the closed case. Prove that every eigensection
lies in C^∞(D̄;E) and vanishes on ∂D, and that there is a Hilbert basis (u_k)
of H with `Lu_k=μ_k u_k`. For the order and the variational characterization
consume [VariationalMethods](../VariationalMethods/README.md) 3.1 and 4.1–4.4:
J and Q with the coercive shift above form a compact form pair, μ_k is its
eigenvalue λ_(k−1) in VariationalMethods' indexing from 0, its 4.2 identifies
the μ_k with the numbers κ−c, κ the variational eigenvalues of Tau Ceti's
basis `IsCoercive.exists_hilbertBasis_forall_apply_eq_smul_inner` as in R5b,
and its Courant–Fischer theorem is the Rayleigh min–max characterization

`μ_k=min_(W⊂V, dim W=k) max_(u∈W, u≠0) Q(u,u)/‖Ju‖²`,

attained on the span of u₁,…,u_k; for k=1 it is
`IsCoercive.isLeast_rayleighQuotient` for the shifted form. The abstract
ordered eigenbasis and min–max theorem are not proved again here.

Prove the index statement. Call a section admissible if it lies in C^∞(M;E)
in the closed case, and in C^∞_c(D;E) in the Dirichlet case. Every admissible
u lies in the domain of L_D with L_D u=Lu, so `⟨u,Lu⟩_(L²)=Q(u,u)`. The
supremum of the dimensions of the spaces W of admissible sections with
⟨u,Lu⟩<0 for every nonzero u∈W is finite and equals the number of k with
μ_k<0, the number of negative eigenvalues counted with multiplicity. In the
Dirichlet case the same holds, with the same number, for the spaces of
sections in C^∞(D̄;E) vanishing on ∂D. A route: these sections lie in V, a
section in C^∞(D̄;E) vanishing on ∂D being in W¹,²₀ by the trace-kernel
theorem of PDE A6 in boundary charts, and C^∞_c(D;E) is dense in V. On V the
supremum is the number of negative eigenvalues: this is the index statement
of the realization above, the value at 0 of the counting function of
VariationalMethods 4.4. Since Q is bounded on V, negative definiteness on a
finite-dimensional subspace of V is stable under small perturbations of a
basis in the norm of V, so such a subspace is approximated by one of the same
dimension in C^∞_c(D;E).

*Needs:* the realization above; VariationalMethods 3.1 and 4.1–4.4; PDE A6
(the trace kernel); Tau Ceti
`IsCoercive.finiteDimensional_eigenspace_formSolutionOperator`,
`IsCoercive.exists_hilbertBasis_forall_apply_eq_smul_inner` and
`IsCoercive.isLeast_rayleighQuotient`.

**Scalar principal eigenfunction.** Let `L=Δ⁺+q` and let D be connected.
Prove:

1. μ₁(L,D) is simple, and its eigenspace is spanned by a φ₁∈C^∞(D̄) with φ₁>0
   on D. In the Dirichlet case φ₁ vanishes on ∂D. The headline
   `exists_pos_dirichletEigenfunction_neg_laplaceBeltrami_add` states the
   Dirichlet case on D̄, a compact manifold with boundary modelled on
   Mathlib's `𝓡∂ m`, among the functions smooth up to the boundary and
   vanishing on it. Every compact Riemannian manifold with boundary arises
   so: a collar (GeometricTopology §1.1), glued along the boundary (§1.3),
   extends the manifold, and the metric extends across the boundary by
   ComplexKahlerGeometry K5a's Seeley extension, staying positive definite on a
   neighbourhood of D̄. On a closed connected M
   the headline `exists_pos_eigenfunction_neg_laplaceBeltrami_add` states
   this among smooth functions, with μ₁ their least Rayleigh quotient
   `(∫|∇u|²+∫qu²)/∫u²`.
2. On a closed connected M there is a smooth h>0 with Lh=0 if and only if
   μ₁(L)=0.
3. Strict domain monotonicity: for connected relatively compact smooth
   domains D₁ and D₂ of M with D̄₁⊂D₂ and D₁≠D₂, where D₂ may be closed, that
   is D₂=M for a compact connected M, `μ₁(L,D₁)>μ₁(L,D₂)`. The headline
   `exists_rayleigh_lt_of_pos_dirichletEigenfunction` states it with
   Dᵢ={ρᵢ<0} for smooth ρᵢ with regular value 0 and {ρᵢ≤0} compact, D₂=M
   closed being ρ₂=−1. Every relatively compact smooth domain has such a ρ,
   glued by a partition of unity from −x_m in boundary charts and ±1 away from
   ∂D. μ₁(L,D₁) is given by a positive eigenfunction smooth up to ∂D₁ and
   vanishing there (item 1), and μ₁(L,D₂)<μ₁(L,D₁) is written as a smooth
   function supported in D₂ whose Rayleigh quotient is below μ₁(L,D₁).
4. For q=0 on a closed connected M, μ₁(Δ⁺)=0 with eigenspace the constants,
   the first positive eigenvalue `λ₁(Δ⁺)=μ₂(Δ⁺)` is positive and has a smooth
   eigenfunction, and

   `λ₁(Δ⁺)=inf{∫|∇f|²/∫f² : f∈C^∞(M), f≠0, ∫f=0}`,

   the infimum being attained at the λ₁-eigenfunctions. The headline
   `exists_pos_laplaceBeltrami_eigenvalue_isLeast` states the positivity of
   λ₁(Δ⁺), its smooth eigenfunction and this characterization. It gives the
   Poincaré–Wirtinger inequality `∫(f−a)²≤λ₁(Δ⁺)⁻¹∫|∇f|²` for f∈C^∞(M), a
   the mean of f, with least constant λ₁(Δ⁺)⁻¹. R7.0's Lichnerowicz
   bound is a lower bound for every positive eigenvalue; the existence of the
   least one, its eigenfunction and this characterization are owned here.

A route: for item 1, let u lie in the μ₁-eigenspace.
Then |u|=u⁺+(−u)⁺∈V with Q(|u|,|u|)=Q(u,u) and ‖J|u|‖=‖Ju‖, by Tau Ceti's
truncation `TauCeti.W1p.posPartAbove` at level 0 in charts. In the Dirichlet
case it preserves the zero-boundary class
(`TauCeti.W1p.posPart_mem_w1p0Submodule`); in the closed case there is no
boundary condition, and V is W¹,² in charts by PDE A3.
So |u| attains the least Rayleigh
quotient and, by the expansion of Q in the eigenbasis (VariationalMethods
4.3), lies in the μ₁-eigenspace; hence |u|∈C^∞(D̄). Write q−μ₁=c⁺−c⁻ with
c⁺,c⁻≥0 continuous. Then `Δ|u|−c⁺|u|=−c⁻|u|≤0` for Tau Ceti's Δ, and the
strong maximum principle of PDE C13 in charts (variable symmetric principal
part, zeroth-order coefficient −c⁺≤0; Gilbarg–Trudinger, Theorem 3.5) makes
the zero set of |u| open in D. It is closed and D is connected, so a nonzero
u has no zero in D, hence one sign; and if the eigenspace had dimension at
least 2, some nonzero element would vanish at a chosen point of D. For
item 2, φ₁ is such an h when μ₁=0; conversely Green's identity
`TauCeti.Manifold.integral_mul_laplaceBeltrami_right_eq_left` gives
`μ₁∫φ₁h=∫(Lφ₁)h=∫φ₁Lh=0`, and ∫φ₁h>0. For item 3, extension by zero
(`TauCeti.W1p0.extendByZeroL` in charts) maps V for D₁ into V for D₂ and
preserves Q and the L² norm, so μ₁(L,D₂)≤μ₁(L,D₁). In case of equality the
extension of the first eigenfunction of D₁ attains the least Rayleigh
quotient on D₂, so it is a first eigenfunction there; it is continuous and
vanishes on ∂D₁, which is nonempty and contained in D₂, against item 1. For
item 4, a harmonic function f on a closed connected manifold is constant,
since Green's first identity `TauCeti.Manifold.integral_mul_laplaceBeltrami`
with g=f gives ∫|∇f|²=0; the functions of
mean zero are the L²-orthogonal complement of u₁, so μ₂ is the constrained
minimum of VariationalMethods 4.1 over the elements of V of mean zero, in
which the smooth functions of mean zero are dense; and the
Poincaré–Wirtinger inequality is the Rayleigh bound for f−a, which has mean
zero, with equality at the λ₁-eigenfunctions.

*Needs:* the realization and the min–max characterization above; PDE A3
(closed case) and C13; VariationalMethods 4.1 and 4.3; GeometricTopology
§1.1 and §1.3 and ComplexKahlerGeometry K5a's Seeley extension (for the
headline on a manifold with boundary); Tau
Ceti
`TauCeti.W1p.posPartAbove`, `TauCeti.W1p.posPart_mem_w1p0Submodule`,
`TauCeti.W1p0.extendByZeroL`, `TauCeti.Manifold.integral_mul_laplaceBeltrami`
and `TauCeti.Manifold.integral_mul_laplaceBeltrami_right_eq_left`.

**Scalar Dirichlet problem.** Let D be a relatively compact smooth domain
such that every connected component of D̄ meets ∂D, let `L=Δ⁺+q`, and suppose
μ₁(L,D)>0. Prove that for every f∈C^∞(D̄) and every smooth function φ on ∂D
there is exactly one u∈C^∞(D̄) with

`Lu=f on D`, `u=φ on ∂D`,

and that u>0 on D̄ whenever f≥0 on D and φ>0 on ∂D. Prove the Friedrichs
inequality in this form: if every connected component of D̄ meets ∂D, then
μ₁(Δ⁺,D)>0, that is `‖Ju‖²≤μ₁(Δ⁺,D)⁻¹‖∇u‖²` on W¹,²₀(D). So the theorem holds
for L=Δ⁺ with no hypothesis on the spectrum. The headline
`existsUnique_dirichletProblem_neg_laplaceBeltrami_add` states it on D̄ as in
item 1, with μ₁(L,D)>0 written as positivity of Q on the nonzero smooth
functions vanishing on ∂D, which is equivalent because the first
eigenfunctions are such functions, and with φ the restriction to ∂D of a
smooth function on D̄.

A route: for 0<t<1, `Q(u,u)≥t‖∇u‖²+((1−t)μ₁−tk₀)‖Ju‖²`, so Q is coercive on V
for small t. Extend φ to a smooth Φ on M through a tubular neighbourhood of
∂D (GeometricTopology Layer 1) and a cutoff. Lax–Milgram
(`IsCoercive.continuousLinearEquivOfBilin`) gives a unique w∈V with
Q(w,v)=⟨f−LΦ,Jv⟩ for every v∈V; w∈C^∞(D̄) by the boundary estimate, and
u=Φ+w. Two solutions in C^∞(D̄) differ by an element of V, by the trace-kernel
theorem, which solves the homogeneous weak equation and so vanishes. For
positivity, u⁻=max(−u,0) has compact support in D, since u is continuous on D̄
and positive on ∂D; so u⁻∈V, and `Q(u⁻,u⁻)=−∫f u⁻≤0` gives u⁻=0. With
q=q⁺−q⁻, `Δu−q⁺u=−q⁻u−f≤0` for u≥0, so by PDE C13 the zero set of u is open
and closed in D; u is positive near ∂D, which every component of D̄ meets, so u
has no zero. For the Friedrichs inequality, Q≥0 when q=0, and an eigenfunction
for the eigenvalue 0 has ∇u=0: it is locally constant on D, lies in C^∞(D̄)
and vanishes on ∂D, which every component of D̄ meets, so it vanishes.

*Needs:* the boundary estimate and the Rayleigh characterization of μ₁
above; GeometricTopology Layer 1 (a tubular neighbourhood of ∂D); PDE A6 (the
trace kernel) and C13; Mathlib `IsCoercive.continuousLinearEquivOfBilin`; Tau
Ceti `TauCeti.W1p.posPartAbove` (u⁻ is the truncation of −u at level 0).

For R5b's normal Jacobi operators these statements give: the Morse index of a
minimal immersion over a closed source or over a relatively compact smooth
domain D of its source, the supremum of the dimensions of the spaces of smooth
normal fields, with compact support in D in the Dirichlet case, on which
R5b's second-variation form is negative definite, is the number of negative
eigenvalues of its normal Jacobi
operator; a closed connected two-sided minimal hypersurface has a positive
Jacobi function exactly when μ₁(L)=0; and on a stable two-sided minimal
hypersurface, a connected relatively compact smooth domain D whose closure
lies in a larger such domain has μ₁(L,D)>0, so that Lu=0 has exactly one
solution with u=1 on ∂D, smooth up to the boundary and positive on D̄.

The statements for scalar operators on bounded Euclidean domains are
Gilbarg–Trudinger, Chapter 8: Theorems 8.12–8.14 for regularity up to the
boundary, Theorem 8.37 for the eigenvalue sequence, its variational
characterization and the eigenfunction basis, and Theorem 8.38 for the simple
first eigenvalue with its positive eigenfunction.

- In the Dirichlet and in the closed case, the eigenvalues `μ₁≤μ₂≤…→+∞` of
  L_D have finite multiplicity and are
  given by the min–max formula, and its eigensections are smooth up to the
  boundary and contain a Hilbert basis of L²(D;E).
- The index of ⟨u,Lu⟩ on smooth admissible sections is the number of negative
  eigenvalues, with multiplicity.
- For scalar L on a connected domain, μ₁ is simple with a positive
  eigenfunction and decreases strictly when the domain grows; on a closed
  connected M, Lh=0 has a positive solution exactly when μ₁=0.
- On a closed connected M, `λ₁(Δ⁺)=μ₂(Δ⁺)>0` is the least Rayleigh quotient of
  the smooth functions of mean zero.
- If μ₁(L,D)>0, in particular for L=Δ⁺, the Dirichlet problem Lu=f, u=φ has
  exactly one solution smooth up to the boundary, positive for f≥0 and φ>0.

**Checks.**

- Sign and closed spectrum. On the unit circle `Δ⁺=−d²/dx²` has eigenvalues
  0,1,1,4,4,…: μ₁=0 is simple with constant eigenfunctions, and λ₁(Δ⁺)=1 with
  eigenfunctions cos x and sin x and Rayleigh quotient ∫cos²x/∫sin²x=1. On the
  unit two-sphere the eigenvalues are j(j+1), j≥0, with multiplicity 2j+1, so
  λ₁=2 has multiplicity 3: simplicity is a statement about μ₁ only. With Tau
  Ceti's Δ=div grad the operator is −Δ+q; reading it as Δ+q turns the circle
  spectrum into 0,−1,−1,−4,…, unbounded below, and μ_k→+∞ fails.
- Index and positive solutions. On the unit circle with q=−1 the eigenvalues
  are k²−1, that is −1,0,0,3,3,…: the index is 1, and Lh=0 has the solutions
  cos x and sin x but no positive one, as μ₁=−1≠0; for q=0, μ₁=0 and h=1. For
  a smooth q≥0, not identically 0, on a closed connected M,
  Q(u,u)=∫|∇u|²+∫qu² vanishes only for u=0 (u is a constant c with c²∫q=0),
  so μ₁(Δ⁺+q)>0 and Lh=0 has only the solution 0. The totally geodesic
  S² in the unit S³ has A=0 and Ric_N(ν,ν)=2, so L=Δ⁺−2 with eigenvalues
  j(j+1)−2, that is −2, then 0 three times, then 4: index 1, nullity 3 and no
  positive Jacobi function.
- Dirichlet problem on D=(0,π)⊂ℝ, where Δ⁺+q with q constant has eigenvalues
  k²+q and eigenfunctions sin kx, k≥1. For q=0, μ₁=1>0, and f=1, φ=1 give
  u=1+x(π−x)/2>0. For q=−2, μ₁=−1<0 and 0 is not an eigenvalue: f=0, φ=1 has
  the unique solution `u=cos(√2(x−π/2))/cos(√2π/2)`, with
  u(π/2)=1/cos(√2π/2)≈−1.65<0, so positivity needs μ₁>0. For q=−1, μ₁=0, and
  f=0, φ=1 has no solution, since cos x+b sin x equals −1 at π.
- Domains and bundles. D₁=(π/4,3π/4) and D₂=(0,π) have μ₁(Δ⁺,D₁)=4>1=μ₁(Δ⁺,D₂);
  an arc of length ℓ<2π of the unit circle has μ₁=(π/ℓ)²>¼, while μ₁=0 on the
  circle. D=(0,π)∪(2π,3π) has μ₁=μ₂=1, with nonnegative first eigenfunctions
  vanishing on a component, so connectedness is needed in item 1. On the
  Möbius line bundle over the unit circle with its flat metric connection and
  K=0, the sections are the functions with u(x+2π)=−u(x) and the eigenvalues
  are (j+½)², j≥0, each of multiplicity 2: μ₁=μ₂=¼ and every eigensection has
  a zero, so simplicity and positivity are scalar statements.

### Examples

For the outward unit sphere S_ν=−Id and H=−ν, so increasing its radius
has first area derivative m times its area. For the paraboloid, the
putative circle r=1, θ=t satisfies speed and momentum but has radial
geodesic residual −1; the actual turning geodesic has r″=1/5.

### Dependencies

R5a uses R1, SmoothBundlesConnections B2–B4 and GeometricTopology Layer 1.
R5a.1 uses DifferentialGeometry Layer 12 densities; R5a.2 and R5b use R5a.1.
R5a.3 additionally uses R2, R3, R4.3 and HopfRinow. R5b consumes PDE's Sobolev, trace and
boundary estimates and Tau Ceti's Lax–Milgram solution operator
`IsCoercive.formSolutionOperator` with its eigenbasis and Rayleigh principle; its
normal Jacobi operator, principal symbol and formal self-adjointness use
PseudodifferentialOperators P1.0's operator, symbol and formal-adjoint carriers.
R5b's Dirichlet realization is stated for a bundle with a metric connection of
SmoothBundlesConnections B2–B4 and for P1.0's connection Laplacian.
R5c uses R5b's Dirichlet realization with its PDE and Tau Ceti inputs, PDE
A3, A4 and A6, C13's strong maximum principle and E20's global regularity,
ComplexKahlerGeometry K5a on closed manifolds, VariationalMethods 3.1 and
4.1–4.4 for the ordered eigenvalues and the min–max principle,
PseudodifferentialOperators
P1.0's connection Laplacian, SmoothBundlesConnections B2–B4, GeometricTopology
Layer 1's tubular neighbourhoods and collars, and Tau Ceti's Laplace–Beltrami
operator,
Green identities, Sobolev truncation and extension by zero.

## Layer 6: focal points and squared distance

### R6. Focal geometry and squared-distance Morse functions

For a smooth embedding f:M→N, the normal exponential on its natural domain
`{(p,v)∈νM | v∈expDomain(f(p))}`, the ambient exponential of the orthogonal
representative, is Tau Ceti's `TauCeti.SmoothEmbedding.normalExp` on
`TauCeti.SmoothEmbedding.normalExpDomain`; the openness of that domain, the
smoothness of the map on it and its differential (u,v)↦df(u)+v along the zero
section are `TauCeti.SmoothEmbedding.isOpen_normalExpDomain`,
`TauCeti.SmoothEmbedding.contMDiffOn_normalExp` and
`TauCeti.SmoothEmbedding.mfderiv_normalExp_zeroSection_apply` (supplier contract),
consumed here. GeometricTopology Layer 1 owns the tubular neighbourhood theorem.
For complete ambient N the domain is all of νM, since `expDomain` is then the
whole tangent space. R6 owns the immersion case: for an immersion f:P→N define
the normal exponential on R5a's pullback normal bundle by the same formula, prove
its natural domain open and the map smooth there from HopfRinow's open
`expDomain` and smooth exponential, and prove that for an embedding it is Tau
Ceti's `normalExp` under R5a's comparison of the orthogonal normal bundle with
the quotient one. R6 owns focal critical-point and index/Hessian geometry.
Define a focal point as a critical domain point, with multiplicity the kernel
dimension there; the focal set in N is the image of those points. Distinct
critical domain points can give the same ambient value with different
multiplicities. The zero section is nonfocal. For t₀>0 characterize its kernel
by nonzero Jacobi fields satisfying
`X(0)∈T_pM`, `(D_tX)(0)+S_(γ′(0))X(0)∈ν_pM`, `X(t₀)=0`.
Prove the converse geodesic-variation realization and compare derivatives of
normal exp in base/fiber directions with the induced normal connection.
The normal exponential is a differentiable map from its open domain in the
n-manifold νM, second countable, to the n-manifold N, so
`TauCeti.isNullSet_image_criticalPoints` makes the focal set chartwise null in
N, and R4.6's transfer makes it null for the ambient Riemannian measure.

For a finite interval a<b, a geodesic γ normal to the immersed initial
submanifold at γ(a)=f(p), and final endpoint fixed, use the subspace
V_M0={X | X(a)∈range(df_p) and X(b)=0} of R3's ambient continuous
piecewise C¹ interval sections. Identify T_pM with range(df_p) by the
immersion differential. Restrict the bulk index integral to V_M0 and set
`I_M(X,Y)=I_bulk(X,Y)−⟨S_(γ′(a))X(a),Y(a)⟩`.
Construct its inclusion of V₀₀ and prove the restriction is exactly R3's I.
Prove its smooth/piecewise C¹/H¹ comparisons on this mixed subspace using
the endpoint traces; do not impose a derivative condition on every test field.
Integration by parts identifies its kernel with Jacobi fields satisfying
`(D_tX)(a)+S_(γ′(a))X(a)∈ν_pM` in addition to the two value conditions.
Prove the converse normal-geodesic variation realization, finiteness and
attainment of index, the sum of focal multiplicities strictly inside (a,b),
and focal nullity at b. State the nonfocal-endpoint specialization explicitly.
Passing an interior focal point produces a shortening variation with its
initial point still in M. As a regression, for the unit circle in ℝ²,
p=(1,0), γ(t)=(1−t,0) and X(t)=(1−t/b)(0,1), prove
`I_M(X,X)=1/b−1`: it is negative for b>1 and X is a nonzero kernel
field at b=1. R3's endpoint-zero Euclidean form has neither conclusion.

**Checks.**

- For a Euclidean plane, the normal exponential is (p,v)↦p+v;
  its derivative is the identity after tangent/normal splitting and
  focal multiplicity is zero.
- For the inward normal to the unit circle, the tangent derivative of
  the normal exponential is 1−t; at t=1 its kernel has dimension one.
- For the identity immersion, the normal bundle has zero fibre and its
  exponential is the identity of M. For a point in Euclidean space,
  it is translation from the whole ambient tangent space; neither has
  focal points. A zero map would falsely make every vector focal.

*Needs:* R5a normal bundle and shape operator; HopfRinow exponential map;
Tau Ceti `TauCeti.SmoothEmbedding.normalExp`, `TauCeti.SmoothEmbedding.normalExpDomain`,
`TauCeti.SmoothEmbedding.isOpen_normalExpDomain`,
`TauCeti.SmoothEmbedding.contMDiffOn_normalExp` and
`TauCeti.SmoothEmbedding.mfderiv_normalExp_zeroSection_apply` (the embedding case);
R2 Jacobi variation and R3 mixed-endpoint section comparisons.

In Euclidean ambient space compute the normal-exponential derivative block and
`det(I−tS_v)`. Focal times along a unit normal are 1/κ_i for nonzero principal
curvatures, with multiplicity; retain both signs of t and use t>0 for the
chosen forward normal ray. For `h_q(p)=|f(p)−q|²`, criticality is normality
and Hessian is `2(g−⟨B, q−f(p)⟩)`; at q=f(p)+tv this is 2(I−tS_v), with kernel the
t⁻¹-eigenspace of S_v for t≠0. In one parametrization these are Tau Ceti's
`TauCeti.fderiv_norm_sq_sub_comp_eq_zero_iff`,
`TauCeti.fderiv_fderiv_norm_sq_sub_comp_apply_eq_inner_shapeOperator` and
`TauCeti.ker_fderiv_fderiv_norm_sq_sub_add_smul_comp` (supplier contract); R6 owns
their manifold form with R5a's intrinsic B and S.
Identify degeneracy/focality and count negative Hessian directions by the
segment f(p)+sv, 0<s<1 when q=f(p)+v: the index of h_q at p is the sum
of those interior focal multiplicities (Milnor, *Morse Theory*, §6,
Lemma 6.9, pp. 37–38, for a nondegenerate endpoint). Degeneracy and focal nullity
use Lemma 6.5, p. 36. Extend the index count to a degenerate endpoint
by the displayed Hessian eigenvalues 2(1−tκ_i): negative eigenvalues count
focal times strictly before t, while zero eigenvalues count endpoint nullity.
This extension is a direct consequence of that calculation, not an additional
claim of Lemma 6.9. Compare with actual
`TauCeti.manifoldMorseIndex` in `Morse/Index.lean`.

The squared-distance exhaustion and genericity theorems are Tau Ceti's and are
consumed here (supplier contract): `TauCeti.isProperMap_norm_sq_sub_comp` makes
h_q proper for every q along a closed embedding;
`TauCeti.ae_forall_isManifoldNondegenerateCriticalPoint_norm_sq_sub_comp` makes
every critical point of h_q nondegenerate for almost every q along a C² immersion,
for every Haar measure; and `TauCeti.ae_isMorse_norm_sq_sub_comp` makes h_q a
`TauCeti.IsMorse` function for almost every q along a smooth immersion (Milnor,
*Morse Theory*, §6, Theorem 6.6). Hence for a smooth closed embedding, h_q is a
proper Morse function for Lebesgue-almost every q. R6 owns the identification of
the exceptional set: h_q has a degenerate critical point at p exactly when q−f(p)
is normal at p and (p,q−f(p)) is a critical point of the normal map
(p,v)↦f(p)+v, so the q for which some critical point of h_q is degenerate form
the image of the focal set. An arbitrary nonclosed embedding does not give a
proper exhaustion: the open unit disc in ℝ² with q=(2,0) has no minimum of h_q.
Of the two chart lemmas
these use, the first, in a chart x↦f(x) of a C² embedding
`∂_i∂_j h_q=2(⟨∂_i f,∂_j f⟩+⟨∂_i∂_j f,f−q⟩)`, is Tau Ceti's
`TauCeti.fderiv_fderiv_norm_sq_sub_comp_apply` (supplier contract); own the second:
for a C¹ normal field ν along f, `⟨∂_i∂_j f,ν⟩=−⟨∂_i f,∂_j ν⟩`. Compare these chart second
derivatives with R5a's intrinsic B/S and normal connection, proving the
Euclidean Hessian and normal-exponential derivative-block formulas on the
shared normal bundle and recovering `2(g−⟨B,q−f(p)⟩)` at a critical point.

GeometricTopology Layer 1 supplies the normal bundle of an embedding and the
tubular neighbourhood theorem; at the pin,
`TauCeti.exists_isTubularNeighborhood_normalBundle` in
`TubularNeighborhood/Euclidean.lean` gives the Euclidean normal tube of a C²
embedding of a compact manifold. R6 owns the ε-tube inversion for
closed-image Euclidean embeddings: the scaled-positive-Hessian argument gives,
for every ε>0 below the injectivity threshold of the normal tube, a
nearest-point retraction with C¹ inverse for C² embeddings and smooth inverse
for smooth embeddings, and compactness supplies a uniform radius. These
Euclidean constructions are independent of R1–R4; the focal/Jacobi/index
consequences follow from R2–R4.

*Needs:* Tau Ceti `TauCeti.isProperMap_norm_sq_sub_comp`,
`TauCeti.ae_forall_isManifoldNondegenerateCriticalPoint_norm_sq_sub_comp` and
`TauCeti.ae_isMorse_norm_sq_sub_comp` (properness and genericity of h_q),
Tau Ceti `TauCeti.fderiv_fderiv_norm_sq_sub_comp_apply`,
`TauCeti.fderiv_fderiv_norm_sq_sub_comp_apply_eq_inner_shapeOperator` and
`TauCeti.ker_fderiv_fderiv_norm_sq_sub_add_smul_comp` (the Hessian of h_q and its
kernel in one parametrization),
Tau Ceti `TauCeti.isNullSet_image_criticalPoints` (Sard in equal dimensions, on
manifolds, for the focal set), with Mathlib
`MeasureTheory.addHaar_image_eq_zero_of_det_fderivWithin_eq_zero` as its
chart-level form, R4.6 (transfer of chartwise nullity to the Riemannian
volume), GeometricTopology Layer 1 (normal bundle, tubular neighbourhood),
Tau Ceti `TauCeti.exists_isTubularNeighborhood_normalBundle` and
`TauCeti.manifoldMorseIndex`, HopfRinow (Completed) Layers 2–3 (exponential
domain), R2 (Jacobi fields), R3 (index form), R5a (B, S, normal connection),
R4.2 (moving-endpoint first variation).

### Examples

For the inward unit normal to the unit circle, Hess h=2(1−t). At
t=1/2,1,2 the Hessian values are 1,0,−2 and the index/nullity pairs are
(0,0),(0,1),(1,0). The endpoint-degenerate case contributes nullity only.

### Dependencies

The Euclidean focal calculation uses R5a and the normal-bundle comparison;
the properness and genericity of the squared distance are Tau Ceti's
`TauCeti.isProperMap_norm_sq_sub_comp`,
`TauCeti.ae_forall_isManifoldNondegenerateCriticalPoint_norm_sq_sub_comp` and
`TauCeti.ae_isMorse_norm_sq_sub_comp`, its Hessian and Hessian kernel in one
parametrization are Tau Ceti's squared-distance and shape-operator theorems, and the
nullity of the focal set uses the pinned equal-dimension Sard theorem and R4.6's
null-set transfer.
General focal/index theory also uses R2–R3 and R4.2 moving-endpoint variation.
No finite fundamental group or global space-form theorem enters the Euclidean proof.

## Layer 7: Bochner identities and curvature vanishing

### R7. Rough Laplacians, Weitzenböck and curvature vanishing

R7 works on PseudodifferentialOperators P1.0's differential operators, symbols,
formal adjoints and canonical Bochner connections, and on ComplexKahlerGeometry
K5a's Sobolev and Hodge analysis. It consumes Tau Ceti's scalar Bochner identity and
Lichnerowicz bound (R7.0), owns their invariance, integrated and equality
statements, and owns the geometric Weitzenböck identities with their vanishing
consequences (R7.1–R7.8).

### R7.0. Scalar Bochner identity and the first positive eigenvalue

For a smooth real function f on a smooth finite-dimensional Riemannian manifold
with its Levi-Civita connection, Tau Ceti's
`TauCeti.Manifold.laplaceBeltrami_norm_sq_mgradient` (supplier contract) is the
pointwise scalar Bochner identity; in the positive-Laplacian convention it reads
`Δ⁺|df|²+2|Hess f|²+2 Ric(grad f,grad f)=2⟨df,dΔ⁺f⟩`.
Tau Ceti's `TauCeti.Manifold.finrank_mul_le_of_laplaceBeltrami_eq_neg_mul` is the
Lichnerowicz bound: on a closed manifold of dimension n≥2 with Ric≥(n−1)k g for
a real k, every λ>0 with a nonzero smooth f satisfying Δ⁺f=λf has λ≥nk. R7.0
consumes both. The identity is local and needs no compactness, Hodge theorem,
cohomology or Spin structure. Prove its frame/coordinate and isometry/pullback
invariance, and its finite-regularity version with the actual derivative
regularity needed for every term. On a closed connected manifold integrate it
with DG's Green formula to obtain
`∫(|Hess f|²+Ric(grad f,grad f))=∫(Δ⁺f)²`, and prove the equality case: for k>0
and λ=nk, a nonzero mean-zero eigenfunction satisfies Hess f=−kfg.
[Yamabe Y9](../Yamabe/README.md#y9-existence-uniqueness-and-rigidity) supplies
the separate complete Obata radial-rigidity theorem. Boundary and noncompact
versions retain the actual boundary or compact-support terms. This refines the
scalar consequence of R7's Weitzenböck calculus without consuming its later
harmonic-form vanishing theorem (Homma, arXiv:math/0307022v1, Example 8.2,
p. 27, for the integrated Ricci eigenvalue estimate).

The local identity includes dimensions 0 and 1. The eigenvalue bound and the
equality statement require n≥2 and a nonzero eigenfunction. In dimension 1 the
Ricci bound Ric≥(n−1)k g is vacuous and yields no bound depending on an
arbitrary k: a circle of circumference L has first positive eigenvalue
(2π/L)², below k once L>2π/√k. A connected manifold of dimension 0 is a point
and has no positive eigenvalue.

**Checks.**

- On the line, f=x² has Δ⁺f=−2, Hess f=2dx², Ric=0 and |df|²=4x²; the
  identity reads −8+8+0=0=2⟨df,d(−2)⟩. Dropping the factor 2 on |Hess f|² gives
  −4≠0.
- On the unit circle f=sin x has Δ⁺f=f, so λ=1, while n=1 gives no bound;
  on the unit two-sphere (Ric=g, k=1, n=2) the coordinate functions have λ=2=nk,
  the equality case, with Hess f=−fg.
- With Tau Ceti's convention Δ=div grad the eigen-equation is Δf=−λf; reading
  it as Δf=λf would make every eigenvalue of a closed manifold nonpositive and
  the bound λ≥nk>0 vacuous.

### R7.1–R7.8. Bundle identities and geometric consequences

1. On actual finite-rank metric bundles with compatible connections, consume
   PseudodifferentialOperators P1.0’s rough-Laplacian definition, invariant negative covariant trace,
   formal L² identification with ∇*∇ and nonnegative energy identity.
   Specialize those supplier identities to geometric moving frames and
   coordinates: `∇*∇φ=−Σ(∇_ei∇_eiφ−∇_(∇_ei ei)φ)`; the shorter sum
   is valid only in a normal frame at its center. Supply the geometric product
   rule `∇*∇(fφ)=(Δ⁺f)φ−2∇_(grad f)φ+f∇*∇φ`, scalar sign, induced tensor/curvature computations and smooth
   distributional/operator-domain comparison with K5a.
2. Consume PseudodifferentialOperators P1.0’s differential-operator filtration on bundle sections:
   locality/restriction, order≤k via iterated commutators, principal symbol on
   symmetric cotangent tensors, connection-independent leading term, coordinate
   and covariant-derivative expansion, composition and formal adjoint symbols.
   Use its `[D,f]` order≤k−1 theorem and geometric/Fourier symbol dictionary
   to compute the d/d*/∇ symbols on the actual DG/SBC carriers: wedge by ξ,
   minus contraction by ξ♯, and tensoring by ξ, respectively; compare their
   adjoints with P1.0's adjoint symbol formula. The jet symbol
   without i and Fourier `σ(∂_j)=iξ_j` are P1.0’s convention dictionary;
   use that dictionary in the geometric identities below. Degreewise d is not an
   invertible-symbol operator in dimension ≥2; in dimension 1, d:Ω⁰→Ω¹
   is elliptic. De Rham ellipticity is exactness of its symbol
   complex, while d+d* is elliptic on the sum of degrees.
3. Consume PseudodifferentialOperators P1.0’s Laplace-type predicate, its
   Dirac-type theorem and its unique canonical Bochner connection and
   zeroth-order remainder. Let D:E→F be a first-order operator between real or
   complex metric bundles, of equal or different ranks, whose geometric symbol c
   satisfies `c(ξ)*c(ξ)=|ξ|² Id_E` for every real covector ξ. Prove the
   **symmetric** polarization `c(α)*c(β)+c(β)*c(α)=2⟨α,β⟩Id_E`, equivalent to
   that condition, by expanding it at α+β. With D* the P1.0 formal adjoint for
   the canonical density and the fibre metrics, prove that D*D is Laplace type
   with scale one: by P1.0's composition and adjoint symbol formulas its
   geometric symbol is `−c(ξ)*c(ξ)=−|ξ|² Id_E` and its Fourier symbol
   `|ξ|² Id_E`. When rank E = rank F, the symbol −c(ξ)* of D* satisfies the same
   condition. Identify D*D’s difference from the rough Laplacian of an
   arbitrary chosen metric connection as an operator of order at most one.
   For a Laplace-type L with scale s>0, formally self-adjoint for the canonical
   density, write P1.0's remainder as the added potential V in
   `L=s(∇ᴸ)*∇ᴸ+V`; here compute V for the actual geometric operators and
   identify the induced metric connection. K5a supplies the Laplace-type
   estimates used in these geometric consequences.

   **Checks.**

   - For D=∂ on the flat real line, c(2)=2 and c(2)*c(2)=4; D*=−∂ and
     D*D=−∂², whose Fourier symbol at ξ=2 is 4, so its scale is one.
   - For d:Ω⁰→Ω¹ on flat ℝ², c(ξ) sends 1 to ξ and c(ξ)*c(ξ)=|ξ|², yet c(ξ) is
     not surjective for ξ≠0. The symbol −c(ξ)* of d* on Ω¹ gives
     c(ξ)c(ξ)*, which is |ξ|² times the orthogonal projection onto ξ and kills
     the covector orthogonal to ξ; the equal-rank clause cannot be dropped.
   - For α=1 and β=2 on the line with c(ξ)=ξ, the polarized sum is 2+2=4,
     equal to 2⟨1,2⟩; a difference in place of the sum gives 0.
   - On the trivial complex line over ℝ with D=∂+i, D*=−∂−i and
     D*D=−∂²−2i∂+1. Its canonical connection is the metric connection d+i dx
     with V=0, whereas relative to the metric connection d the remainder
     −2i∂+1 has order one: it sends x to x−2i.
4. On K5a’s real Gram exterior-form bundles, consume its pointwise real
   wedge/contraction adjoint and Hodge-star laws. Supply the geometric
   induced-connection and real-bundle Weitzenböck comparisons, consuming
   K5a's codifferential/Hodge-star sign identity to identify the covariant formula,
   extending the shared formal-adjoint/de Rham system. Consume SpinGeometry
   G1.2/G2.2/G3.4's wedge/contraction Clifford relations and induced
   Levi-Civita exterior connection, comparing their complexifications with
   these real Gram form bundles. Set a_i=ι_ei and a_i*=e^i∧·, and derive
   `Σ a_i*a_i=p Id`, `Σ_(i<j) a_j*a_i*a_i a_j=binomial(p,2) Id` on degree p.
   A degree 0 endomorphism of 1-forms extends as an ordinary derivation; d is a
   degree 1 graded derivation and Lie differentiation is degree 0. Identify the
   induced connection and exterior curvature action, and compute the real
   Weitzenböck potential
   `ℛ_p=−Σ_(i,j) a_i*a_j R^Λ(e_i,e_j)`.
   Prove `Δ_p=∇*∇+ℛ_p`, self-adjointness/frame independence, and ℛ_1=Ric with
   the metric musical identifications. Supply the ordered/increasing-pair
   dictionaries and Rop spectral-expression API, not just one frame formula
   (Homma, arXiv:math/0307022v1, Theorem 7.1, p. 24, and Example 8.2,
   equations (8.1), p. 27, for the complexified associated-bundle formulas;
   the real and orientation-independent comparisons use the shared Gram carriers).

   **Checks.**

   - Unit Sⁿ: R(eᵢ,eⱼ)e^k=δ_jk e^i−δ_ik e^j on 1-forms, so R^Λ(eᵢ,eⱼ)=aᵢ*aⱼ−aⱼ*aᵢ on
     every degree. With aⱼaᵢ*+aᵢ*aⱼ=δᵢⱼ and N=Σaᵢ*aᵢ, Σ_(i,j)aᵢ*aⱼaᵢ*aⱼ=N and
     Σ_(i,j)aᵢ*aⱼaⱼ*aᵢ=N(n−N+1), so ℛ_p=−(p−p(n−p+1))=p(n−p) Id on degree p. At
     p=1 this is n−1, the Ricci curvature, as ℛ₁=Ric requires; at p=0 and p=n it is
     0, matching b₀=b_n=1. The opposite overall sign would give −p(n−p) and
     ℛ₁=−Ric.
   - Flat torus: R=0, so ℛ_p=0, every harmonic form is parallel, and b_p equals
     binomial(n,p), the equality case of item 6.
   - Unit S²×S²: the area form ω₁=e¹∧e² of the first factor is parallel, hence
     harmonic, so ℛ₂ω₁=Δω₁−∇*∇ω₁=0. Directly, R^Λ(e₁,e₂)=a₁*a₂−a₂*a₁ sends
     e¹∧e² to a₁*(−e¹)−a₂*(e²)=0, the second-factor and mixed terms vanish, and
     ℛ₂ω₁=0, consistent with b₂=2 under Rop≥0.
   - Number identities on degree 2 in dimension 2: Σaᵢ*aᵢ(e¹∧e²)=2e¹∧e², and
     a₂*a₁*a₁a₂(e¹∧e²)=a₂*a₁*a₁(−e¹)=a₂*(−e¹)=e¹∧e²=binomial(2,2)e¹∧e².
5. Prove the section-norm identity
   `Δ⁺|φ|²+2|∇φ|²=2Re⟨∇*∇φ,φ⟩` and Kato's inequality. The classical derivative
   formula is on φ≠0; at its zero set prove the Sobolev weak/a.e. inequality
   using `√(|φ|²+ε²)` and the completed K5a weak-regularity/domain API.
6. On closed connected M, positive ℛ_p implies H^p(M;ℝ)=0; nonnegative ℛ_p
   implies every harmonic p-form is parallel and b_p≤binomial(n,p). Prove
   evaluation injectivity for parallel forms, and compute equality on the flat
   torus with the de Rham/singular comparison. In particular positive Ricci
   kills b_1 (`subsingleton_deRhamCohomology_one_of_ricciTensor_pos`: on a compact
   boundaryless M with Ric(v,v)>0 for every nonzero tangent vector,
   `TauCeti.deRhamCohomology I M 1` is trivial; Nicolaescu, *Lectures on the
   Geometry of Manifolds*, Theorem 12.2.5(b), p. 661, for connected oriented M,
   a nonorientable M reducing to its orientation double cover). The statements
   are componentwise without connectedness. The flat circle (Ric=0, b_1=1) and
   the round two-sphere with two points removed (Ric=g, b_1=1) show that strict
   positivity and compactness are both needed.
7. For Ricci lower bound λ and Rop upper eigenvalue bound Λ, prove
   `⟨ℛ_pω,ω⟩≥p(λ−(p−1)Λ)|ω|²` by genuine spectral diagonalization of the
   whole curvature operator. Develop its exterior Lie-algebra action/sum-of-
   squares formula; if Rop≥ε Id, derive ℛ_p≥ε p(n−p) Id for 1≤p≤n−1.
   Thus positive Rop on closed connected n≥3 gives b_2=0, with the n=2 sphere
   as the sharp hypothesis guard. Independently, `λ>(p−1)Λ` kills b_p for
   1≤p≤n−1; state this Ricci/curvature-operator criterion precisely. If Rop
   has eigenvalues in [α,β] with α>β/2>0, then Ric≥(n−1)α, so the criterion
   holds with λ=(n−1)α and Λ=β for 1≤p≤⌊n/2⌋, since then
   (p−1)β≤2(p−1)α≤(n−2)α<(n−1)α. On closed oriented connected n≥2 manifolds
   Poincaré duality b_p=b_(n−p) covers the remaining interior degrees, so all
   interior Betti numbers vanish. Identify the rational homology sphere with coefficient
   comparison. The stronger result that any positive Rop kills all interior
   Betti numbers follows separately from the sum-of-squares bound above, a
   positive Rop being bounded below by some ε>0 on the compact manifold
   (`subsingleton_deRhamCohomology_of_curvatureEndomorphism_pos`: on a compact
   boundaryless M of dimension n with `⟨Rop_xβ,β⟩>0` for every nonzero bivector β,
   Rop being `CovariantDerivative.curvatureEndomorphism`,
   `TauCeti.deRhamCohomology I M p` is trivial for 0<p<n; Petersen–Wink, *New
   curvature conditions for the Bochner technique*, Corollary, p. 1, for n≥3, a
   positive operator being ⌈n/2⌉-positive, and Bochner's theorem for n=2, where
   Rop>0 means K>0). The unit S²×S² (Rop≥0 with the four mixed bivectors in its
   kernel, b_2=2) and the round n-sphere with two points removed (Rop=Id,
   b_(n−1)=1) show that positivity and compactness are both needed. Diagonal values on basis wedges
   alone never establish positivity of a general endomorphism.
8. On every connected smooth Riemannian manifold prove bounded Lipschitz
   functions admit bounded smooth approximations: for continuous
   η:M→(0,∞) and ε>0 produce smooth g with |g−f|≤η and
   sup|dg|≤Lip(f)+ε. Use min(η,1) so g is bounded even when η is not.
   Own the quantitative
   local mollification/partition-of-unity estimates and derivative-bound
   gluing; a qualitative smooth approximation is insufficient. Prove
   the proof inputs: near-isometric exponential charts and bounded truncation, Euclidean
   convolution preserving the Lipschitz
   bound after the supplied real Lipschitz extension, and countable locally
   finite smooth partitions with approximation
   errors summable against their derivative bounds. Differentiate the glued
   error using Σdψ_i=0 to control the partition term.
   Prove (`riemannianDist_eq_sSup_smooth`)
   `dist(p,q)=sup{|f(p)−f(q)| : f smooth bounded real, sup|df|≤1}`
   for the intrinsic distance, with no completeness assumption (Azagra–Ferrera–
   López-Mesas–Rangel, arXiv:math/0602051v1, Theorem 1, p. 2, for smoothing;
   the distance formula follows by applying it to bounded truncated distance
   and rescaling the derivative bound). For the
   de Rham Clifford action supplied by SpinGeometry G3.4, prove on compactly
   supported smooth sections `[d+d*,M_f]=df∧−ι_(grad f)`. More generally,
   for every nonzero-fibre Hermitian Clifford module with compatible
   connection, skew-adjoint cotangent action c and c(α)²=−|α|² Id, prove
   `[D,M_f]=c(df)`, bounded extension exactly when |df| is bounded,
   and operator norm sup|df|. Prove the pointwise norm identity from the
   Clifford and adjoint equations and pass to L² using the full-support
   Riemannian volume. Compare `sup|df|` with the intrinsic
   Lipschitz constant by integration along paths and infinitesimal tests.
   Recover the distance by the commutator seminorm; the SpinGeometry G6
   spin-Dirac example has the same formula when a spin structure is supplied.
   Include connected open Euclidean domains with their intrinsic path metric.
   General spectral triples use
   [NoncommutativeGeometry](../NoncommutativeGeometry/README.md)'s carriers;
   this item specifies the classical manifold commutator-distance theorem.

### Examples

For f(x)=x² on the Euclidean line, Δ⁺f=−2. On the unit circle,
Δ⁺sin x=sin x. For the bounded 1-Lipschitz function f=0, smoothing
may choose g=0 and both the approximation error and derivative bound are zero.

### Dependencies

R7 uses R1 tensor curvature, DifferentialGeometry exterior calculus and
integration, SmoothBundlesConnections B2–B4, PseudodifferentialOperators P1.0
and ComplexKahlerGeometry K5a; its vanishing theorems are stated on Tau Ceti's
de Rham cohomology and curvature endomorphism. The scalar local identity precedes the global
analytic realization. R7.8 uses Mathlib real Lipschitz extension and owns
the quantitative smooth gluing and Clifford-module norm comparison.

## Layer 8: spherical harmonics and minimal eigenmaps

### R8. Spherical harmonics and minimal eigenmaps

### R8.1. Finite harmonic-polynomial construction

Let m≥1, n=m+1 and d≥0. The polynomial algebra is Tau Ceti's (supplier
contract). Over a field of characteristic zero, real or complex here, with at
least one variable, `MvPolynomial.laplacian` is Σᵢ∂ᵢ², `MvPolynomial.normSq` is
r²=ΣᵢXᵢ² and `MvPolynomial.harmonicSubmodule` is the space H_d of harmonic
homogeneous polynomials of degree d. The Fischer decomposition
P_(e+2)=H_(e+2)⊕r²P_e, its iteration P_d=Σ_(k≤d/2) r^(2k)H_(d−2k) and the
dimension relation dim H_(e+2)+dim P_e=dim P_(e+2) are Tau Ceti's theorems
(Axler–Bourdon–Ramey, *Harmonic Function Theory*, Proposition 5.5, p. 76, and
Theorem 5.7, p. 77). Over ℂ, r² is the coefficient extension of the real
polynomial, not the Hermitian squared norm on complex points. Homogeneous degree
is `MvPolynomial.IsHomogeneous`. On the real unit round Sᵐ use the geometric
nonnegative Laplacian Δ⁺_S=−div grad. The finite algebraic splitting uses no
spherical Laplacian or analytic spectral completeness.

Prove that the iterated decomposition is unique: for p homogeneous of degree d
the components hₖ∈H_(d−2k), 0≤k≤⌊d/2⌋, with p=Σₖ r^(2k)hₖ are unique. Induct on
d using Tau Ceti's one-step disjointness and injectivity of multiplication by
r², which needs at least one variable. The finite range 0≤k≤⌊d/2⌋ excludes
out-of-range indices before natural subtraction is used. With no variables
uniqueness fails: r²=0, P_2=0, and for d=2 the component h₁∈H_0 is arbitrary.

The round polar metric away from 0 is `dr²+r²g_S`, with density `r^m dr dV_S`,
so the coordinate divergence formula gives `Δ_R=∂_r²+(m/r)∂_r−r⁻²Δ⁺_S` for the
Euclidean Laplacian `Δ_R=Σᵢ∂ᵢ²`. For p homogeneous of degree d and h its
restriction to the unit sphere, `p(rθ)=r^d h(θ)`, and substitution yields
`Δ_R p=r^(d−2)(d(d+m−1)h−Δ⁺_S h)`. Hence a harmonic homogeneous p restricts to a
smooth spherical eigenfunction with eigenvalue d(d+m−1). This is a one-way
inclusion, not surjectivity onto the whole eigenspace. Restriction intertwines
Tau Ceti's `MvPolynomial.harmonicRep`, the action (g·p)(x)=p(g⁻¹x), with the
action (g·f)(θ)=f(g⁻¹θ) on functions on Sᵐ, by invariance of r² and of the
Euclidean Laplacian. Restriction is injective: over ℝ this is Tau Ceti's
`MvPolynomial.harmonicSphereRestriction_injective`, and over ℂ apply it to the
real and imaginary parts.

The native monomial basis gives dim P_d=binomial(n+d−1,d). Thus
dim H_d=binomial(m+d,d)−binomial(m+d−2,d−2), the second term zero for d<2.
This is the dimension of the constructed space of spherical eigenfunctions. It
does not identify every smooth or L² eigenfunction, construct the global spectral
Hilbert basis or prove highest-weight irreducibility; those are R8.2 and R8.3,
with their own suppliers. The proof programme transports the Euclidean
derivative identities to the actual round native metric and volume, with the
stated conventions for m, d and the coefficients, including d=0,1 and m=1. The
finite polynomial assertions use the harmonic-polynomial setup of Toth–Ziller,
Introduction, pp. 84–85.

- Restriction is injective on harmonic homogeneous polynomials, over ℝ and ℂ,
  and intertwines O(m+1).
- The iterated Fischer decomposition is unique and gives the stated
  degree-by-degree dimension.
- The restricted harmonic polynomials solve the scalar eigen-equation with
  λ=d(d+m−1).

**Checks.**

- For d=0 the constant polynomial 1 has Δ1=0, eigenspace dimension 1
  and eigenvalue 0; the subtracted dimension term is zero by convention.
- For d=1 the coordinate functions have Δx_i=0; on S² their eigenvalue
  is 2 and the constructed space has dimension 3.
- On ℝ³, Δ|x|²=6, whereas Δ(x₁²−x₂²)=0. Thus degree two has a
  one-dimensional radial summand and a five-dimensional harmonic summand;
  including |x|² as harmonic would give the wrong dimension 6. In the unique
  splitting, p=r² gives q=1,h=0, while p=X₁²−X₂² gives q=0,h=p.
- In three variables p=r⁴ has Δp=20r², unique one-step quotient q=r²,
  and iterated components h₀=h₁=0,h₂=1. A coefficient 6 in every degree
  would instead give the incorrect Laplacian 6r².
- With one variable, p=cX^(d+2) has the unique quotient q=cX^d, since
  Δ(p−X²·bX^d)=(c−b)(d+2)(d+1)X^d; the decomposition needs no second variable.
- The zero polynomial has all components zero; over ℂ, p=i r² has q=i,h=0,
  and at the complex point (1,i) the value of r² is 0 while the Hermitian
  squared norm is 2.

*Needs:* Tau Ceti's harmonic-polynomial algebra (supplier contract); R4.7 round
metric and polar-coordinate divergence; native homogeneous polynomials and
finite-dimensional linear algebra. R8.2 spectral completeness is not an input to
this finite construction.

### R8.2. Spectral completeness and eigenspace identification

After the finite polynomial construction, consume K5a's compact scalar spectral decomposition to prove that restriction identifies the constructed harmonic degree-d space with the entire smooth and L² eigenspace for λ_d=d(d+m−1). The smooth form is the headline `eq_harmonicSphereRestriction_of_laplaceBeltrami_eq_neg_mul`: for m≥1, on the unit round sphere Sᵐ of `EuclideanSpace ℝ (Fin (m+1))` with Tau Ceti's round metric, every nonzero smooth f with `Δf=−λf` for Tau Ceti's `TauCeti.Manifold.laplaceBeltrami` (Δ=div grad) has λ=d(d+m−1) for some d≥0 and is the image of an element of `MvPolynomial.harmonicSubmodule` of degree d under `MvPolynomial.harmonicSphereRestriction`. Since d↦d(d+m−1) is strictly increasing for m≥1, d is determined by λ. For m≥2 this is Taylor, *Introduction to Lie Groups*, §8.2 on S^(n−1) with n=m+1: a smooth eigenfunction with eigenvalue −λ gives a bounded harmonic function r^k g(ω) on the punctured ball, which forces λ=k(k+n−2) with k a nonnegative integer, (8.2.13), p. 399, and restriction is an isomorphism from the harmonic homogeneous polynomials of degree k onto that eigenspace, Proposition 8.2.1, p. 399; for m=1 it is the Fourier basis e^(ikθ), with eigenvalues −k², (8.2.2), p. 398. The L² form follows from the smooth one by K5a's elliptic regularity, every L² eigenfunction being smooth. The bound m≥1 is needed: on S⁰={±1} the Laplacian is zero, every nonzero f has λ=0, and the function with f(1)=1, f(−1)=2 is the restriction of neither a constant (H_0) nor a multiple of X (H_1). Establish orthogonality, completeness and the comparison of the polynomial and Hilbert spectral bases, with the actual smooth-domain/elliptic-regularity interface. Retain the dimension formula binomial(m+d,d)−binomial(m+d−2,d−2), the second term zero for d<2; constants d=0 and the m=1 Fourier pair are explicit. These surjectivity and completeness outputs are later than the one-way finite polynomial calculation and are not inputs to it. Preserve O(m+1)-equivariance throughout.

**Checks.**

- On S¹ (m=1) the restriction of X₁ is cos θ, with `Δcos θ=−cos θ`, so λ=1=1·(1+1−1)
  and d=1; the restrictions of Re and Im of (X₁+iX₂)^d are cos dθ and sin dθ with
  λ=d², a two-dimensional eigenspace for every d≥1.
- On S² (m=2) the restriction of X₁X₂ has λ=6=2·3, and that of X₃ has λ=2. With
  Δ⁺=−div grad in place of Tau Ceti's Δ=div grad, the same hypothesis `Δ⁺f=−λf`
  would give λ=−2 for X₃, which is d(d+1) for no d≥0; this pins the sign.
- On S² the restriction of X₁²=(X₁²−r²/3)+r²/3 is the sum of a degree-2 and a
  degree-0 eigenfunction with the distinct eigenvalues 6 and 0, so it is not an
  eigenfunction; the theorem does not assert that every polynomial restricts to
  one.

*Needs:* R8.1; ComplexKahlerGeometry K5a (compact scalar spectral decomposition and
elliptic regularity); Tau Ceti's round metric, `TauCeti.Manifold.laplaceBeltrami` and
`MvPolynomial.harmonicSphereRestriction` (supplier contract); Mathlib's
Stone–Weierstrass theorem `ContinuousMap.subalgebra_topologicalClosure_eq_top_of_separatesPoints`
for the density of restricted polynomials.

### R8.3. Orthogonal highest weights and low ranks

Construct the harmonic-polynomial representation and compare its
complexification on SO(m+1) with highest weight dε₁ (d times the vector highest weight), consuming ClassicalGroups Layer 3's highest-weight classification
and Layer 5's identification of the dimension of the irreducible module with the
Weyl product. The Weyl products themselves are Tau Ceti's
`TauCeti.oddOrthogonalWeylDimension` (type Bᵣ, SO(2r+1)) and
`TauCeti.evenOrthogonalWeylDimension` (type Dᵣ, SO(2r)) (supplier contract); for N≥3
their value on the one-row weight (d) is `binomial(d+N−2,N−2)+binomial(d+N−3,N−2)`, by
`TauCeti.oddOrthogonalWeylDimension_eq_choose_add_choose_of_colLen_le_one` and
`TauCeti.evenOrthogonalWeylDimension_eq_choose_add_choose_of_colLen_le_one`, which is
dim H_d by R8.1's dimension formula and Pascal's rule. Spell out the low-rank fundamental-weight conversions, and handle SO(2) separately
by its pair of characters for d≥1 and one trivial character for d=0; real form, orientation-group restriction and O-action
are explicit. Construct the complex SO-action by
`(g·p)(x)=p(g⁻¹x)`. Choose rotations
R_θ(x₁,x₂)=(cosθ x₁−sinθ x₂,sinθ x₁+cosθ x₂),
ε₁(R_θ)=e^(iθ), and positive roots with vector highest weight ε₁.
Prove `(x₁−ix₂)^d` is a highest-weight vector with character dε₁.
Use the supplied classification to establish irreducibility; the numerical
Weyl formulas alone are not a supplied highest-weight module.

The supplied classification is read against a maximal torus and a Borel
subgroup of SO_N, which R8.3 fixes as follows; it is the standard choice
(Fulton–Harris, *Representation Theory*, Lecture 18, §18.1 for the
quadratic form, torus and roots of so_N, Lecture 19 for the dominant
weights), written in the standard orthonormal basis. Put `N=m+1≥2`,
`r=⌊N/2⌋`, and use the isotropic basis `u_i=e_(2i−1)+i e_(2i)`,
`v_i=(e_(2i−1)−i e_(2i))/2`, 1≤i≤r, of the complexified coordinate
space, with the unpaired `e_N` kept when N is odd; the standard symmetric
form satisfies `B(u_i,v_j)=δ_ij`, `B(u_i,u_j)=B(v_i,v_j)=0` and
`B(e_N,u_i)=B(e_N,v_i)=0`. The torus consists of the elements acting by
`t_i` on `u_i`, by `t_i⁻¹` on `v_i` and by 1 on `e_N`; its i-th
coordinate is the eigenvalue on `u_i`. The Borel is the stabiliser of the
isotropic flag `⟨u₁⟩⊂⟨u₁,u₂⟩⊂…⊂⟨u₁,…,u_r⟩`, upper triangular in the
ordered basis `(u₁,…,u_r,v_r,…,v₁)` (with `e_N` in the middle when N is
odd); its positive roots are `ε_i±ε_j` for i<j, together with `ε_i` when
N is odd, and the dominant weights are `λ₁≥…≥λ_r≥0` for odd N and
`λ₁≥…≥λ_(r−1)≥|λ_r|` for even N. Call this torus, Borel and coordinate
system the Classical convention. In each consecutive coordinate plane let K act by
`diag(1,−1)`, and let it fix an unpaired last coordinate. Prove
`K²=I`, `KᵀK=I` and `det K=(−1)^r`. Conjugation
`σ(g)=KgK` is an algebraic automorphism of the actual complex SO group;
K need only belong to O, and this automorphism need not be inner in SO.
For every plane, prove `KR_θK=R_(−θ)`. In the isotropic basis prove
`Ku_i=2v_i`, `Kv_i=u_i/2`. Thus the Classical torus coordinate
of `σ(R_θ)` is `t_i=e^(iθ_i)` for simultaneous plane rotations.
Fix the R8 Borel as `σ⁻¹(B_Classical)` and transport every Cartan
coordinate and the B/D positive roots through this dictionary. The
untransported Classical character on `R_θ` is `e^(−iθ)`; do not identify
it directly with the fixed R8 character `e^(iθ)`.

Define `U_K p(x)=p(Kx)` on the actual polynomial model. Using its
O-action, prove that U_K preserves homogeneity and the Laplacian kernel,
and prove `U_K ρ(g) U_K⁻¹=ρ(σ(g))`. It sends the specified polynomial
`(x₁−ix₂)^d` to `(x₁+ix₂)^d`. Prove the latter is a highest vector for
the Classical Borel with torus character `t₁^d`, and transport this
statement to the fixed R8 Borel and character `dε₁`. Apply the actual
rational-group classification through this equivariant comparison.
For SO(2) retain both degree-d characters when d≥1 and the single
constant at d=0; do not infer irreducibility of their two-character sum.

For N≥3 the irreducibility is the headline `harmonic_irreducible`: for N≥3
and every d, a complex subspace of Tau Ceti's `MvPolynomial.harmonicSubmodule`
of degree d in N variables (the complex homogeneous polynomials of degree d
killed by `Σᵢ∂ᵢ²`) that every element of
`Matrix.specialOrthogonalGroup (Fin N) ℝ` maps into itself under
`(g·p)(x)=p(g⁻¹x)` is 0 or the whole space. For N=2 and d≥1 the invariant
lines spanned by `(x₁±ix₂)ᵈ` show that the bound is needed. The statement is
Taylor, *Introduction to Lie Groups*, Proposition 8.5.1, p. 421, for SO(N)
acting by f↦f(g⁻¹·) on the degree-d eigenspace of the Laplacian of S^(N−1),
under the standing hypothesis N≥3 of §8.4, p. 415, transported to H_d by the
equivariant restriction isomorphism of Proposition 8.2.1, p. 399. Its proof is
independent of highest weights: an invariant subspace W≠0 contains, after a
rotation and the projection onto zonal functions, the zonal harmonic of degree d,
unique up to scale by Proposition 8.4.2, p. 415, and so does its orthogonal
complement if W is proper.

**Checks.**
- `R_θu₁=e^(−iθ)u₁` and `R_θv₁=e^(iθ)v₁`: with `R_θe₁=cosθ e₁+sinθ e₂`
  and `R_θe₂=−sinθ e₁+cosθ e₂`, `R_θ(e₁+ie₂)=(cosθ−i sinθ)(e₁+ie₂)`. So
  the Classical coordinate of R_θ is `e^(−iθ)` and that of `σ(R_θ)=R_(−θ)`
  is `e^(iθ)`, the fixed R8 value; reading the Classical coordinate on
  R_θ itself would attach the weight −dε₁ to `(x₁−ix₂)^d`.
- `KR_θK=R_(−θ)`: `diag(1,−1)·[[cosθ,−sinθ],[sinθ,cosθ]]·diag(1,−1)` has
  entries `[[cosθ,sinθ],[−sinθ,cosθ]]`. `Ku₁=e₁−ie₂=2v₁`, `Kv₁=u₁/2`,
  `B(u₁,v₁)=(1·1+i·(−i))/2=1` and `B(u₁,u₁)=1+i²=0`.
- Under `(g·p)(x)=p(g⁻¹x)`, `(R_θ·(x₁−ix₂))(x)=e^(iθ)(x₁−ix₂)` and
  `(R_θ·(x₁+ix₂))(x)=e^(−iθ)(x₁+ix₂)`; the action `p(gx)` would swap the
  two characters. `x₁+ix₂=B(x,u₁)` is a Borel eigenvector for the
  Classical Borel because `g·B(x,u₁)=B(x,gu₁)` and the Borel preserves
  `⟨u₁⟩`.
- `det K=(−1)^r`: for N=2, `K=diag(1,−1)∉SO(2)`, and σ is the inversion
  `R_θ↦R_(−θ)` of the abelian group SO(2), not inner; for N=3,
  `K=diag(1,−1,1)` has det K=−1, and since `−I` is central, σ is
  conjugation by the rotation `−K=diag(−1,1,−1)`, hence inner on SO(3).
- Dimensions: for N=2 and d≥1, H_d is spanned by `(x₁±ix₂)^d`, two
  characters and no highest-weight irreducibility. For N=3 the type-B₁
  Weyl product at λ=(d) is `(d+½)/(½)=2d+1`, equal to dim H_d=2d+1 by R8.1;
  for N=4 the type-D₂ product at (d,0) is `((d+1)²−0²)/(1²−0²)=(d+1)²`,
  equal to dim H_d=`binomial(d+3,3)−binomial(d+1,3)=(d+1)²` (d=2: 10−1=9).
  For N=5, d=2 the one-row value is `binomial(5,3)+binomial(4,3)=10+4=14`
  and dim H_2=15−1=14. Reading the B₁ product with ρ=1 in place of ½ would
  give (d+1)/1=d+1, which is 2 at d=1 against dim H_1=3.

*Needs:* R8.1 (the harmonic-polynomial spaces H_d and their dimensions),
R8.2 (eigenspace identification), ClassicalGroups Layer 3 (connected
SO_N highest-weight classification) and Layer 5 (dimension of the irreducible
module as the Weyl product), Tau Ceti `TauCeti.oddOrthogonalWeylDimension` and
`TauCeti.evenOrthogonalWeylDimension` with their one-row values (supplier
contract), CompactGroups
(complete reducibility and invariant products), Tau Ceti's
`MvPolynomial.harmonicSubmodule` (supplier contract), Mathlib
`Matrix.specialOrthogonalGroup` and `MvPolynomial.aeval`.

### R8.4. Full eigenspace eigenmaps and Takahashi

For an L²-orthonormal basis f_1,…,f_N of a positive eigenspace, prove
`Σf_i²=N/Vol(S^m)` by orthogonal-group transitivity and
`Σdf_i⊗df_i=(λN/(m Vol(S^m)))g` by isotropy invariance and trace.
Normalize the vector-valued map by
`F=√(m Vol(S^m)/(λN))(f_1,…,f_N)`.
It is an isometric immersion into S^(N−1)(√(m/λ)) and is minimal there.
For any isometric immersion into a round sphere prove Takahashi's converse:
minimality iff its Euclidean coordinate functions satisfy Δ⁺f_i=(m/r²)f_i.
An arbitrary list of eigenfunctions need not be an immersion or isometric.

### R8.5. The five-coordinate degree-two example

Compute degree 2 on S²: N=5, not 6. The three diagonal trace-free quadratics
are linearly dependent; pin a five-dimensional traceless-symmetric-matrix model
and an explicit orthonormal coordinate identification. The unit-target map

`(x,y,z) ↦ (√3(x²−y²)/2, √3xy, √3xz, √3yz, (2z²−x²−y²)/2)`

has induced metric 3g; dividing it by √3 gives the isometric minimal immersion
into S⁴(1/√3). Prove its fibers are antipodal pairs and its descent is a smooth
embedding of RP², with induced metric and O(3)-equivariance. These identities,
the stereographic outputs and the catenoid/helicoid/paraboloid computations
are required acceptance cases of the generic APIs.

### Examples

On S² the degree-zero, degree-one and degree-two dimensions are 1,3,5
and eigenvalues 0,2,6. The five-coordinate degree-two unit-target map has
metric 3g; division by √3 gives target radius 1/√3 and metric g.

### Dependencies

R8.1 uses the direct R4.7 model and polynomial calculus. R8.2 additionally
uses ComplexKahlerGeometry K5a; R8.3 uses ClassicalGroups Layers 3/5.
R8.4–R8.5 use R5a, the scalar Laplacian of R7 and those eigenspace comparisons.

## Downstream consumers

DGFloer consumes R2–R3's fixed-interval Jacobi and path geometry for its free-loop
applications. CalibratedGeometry C3 consumes R5a.1's relative volume, and
AffineMorseLefschetz uses R5a/R6's real focal geometry. OptimalTransport Layer 7
uses R4.6's cut-locus objects; SpectralManifolds uses R7.8's commutator-distance
theorem. The following internal order separates the direct model and algebra
constructions from their comparison and analytic applications.

R1's generic connection/tensor/submersion algebra precedes R2; R1's normal
jets follow R2. R4.7's direct model geometry uses Tau Ceti's Gauss formula, R1
and HopfRinow without R3 or R4's comparison theorems. R1's projective metric
examples consume K7.1/G4.0b, that round-model geometry and the generic submersion
formulas; R3's projective examples consume those metrics and R2. SBC B6.0
precedes R3's finite-vertex choice and R4.6's injectivity-radius consequence.
R4's comparison theorems use R1–R3; construct R4.6's cut-locus/nullity part before R4.1's
polar integration, and supply OT Layer 7's geometric injectivity/cut-locus objects; geodesic multiplicity uses R3’s finite approximation and the
R3/AT8.11a ordinary path carrier and DGFloer's standing Moore comparison. R5a uses the shared
bundle/normal interfaces and R1; R5a.1's density lemma precedes R5a.2 and R5b.
R4.9 uses R4.6's short-geodesic/injectivity estimates, the geodesic ODE, the planar Jordan/arclength/winding theorems, and finite AT/CC constructions. Its topological order is the Fréchet-plus-length carrier and component cover, relative cocycle/finite Thom detection, positive widths, and finite parameter carriers. The shared periodic normal-graph theorem, general nonzero linear zero-number theorem, interior parabolic-box compactness and scalar Harnack feed their stated g₀/arbitrary-g applications; the fixed-endpoint construction separately uses the Dirichlet boundary theorem. The round closed small-length two-point comparison precedes its Type-II exclusion and circular Type-I/stability output. Final entry neighbourhoods consume the local exit constants before the global curvature-gap theorem. The round branch then constructs its finite-length Jordan smoothing/trace and weak-set avoidance outputs; its finite-collapse conclusion consumes the arbitrary-g finite-time alternative plus the Gauss–Bonnet area ODE, while circular-singularity asymptotics and great-circle convergence are separate outputs with the routes stated in R4.9.6a. The arbitrary-g branch separately proves the finite-time BI/BII exclusion, the immortal derivative estimate as a reusable output, compact primitive geodesic sets, and smooth local graph/exit estimates. The safe family clock, intrinsic restriction/cubical face-identification laws and compatible-choice comparisons feed uniform point-relative finite-family localization and cap/minimax realization. No minimax or three-geodesic conclusion is an input to either smooth-flow analysis. R4.8's distinct-endpoint path theorem and DGF's free-loop Morse/Bott machinery keep their separate scopes.
R5b additionally uses PDE and Tau Ceti's Lax–Milgram solution operator, with no CalibratedGeometry
input. R1.5 (§2.3) follows the R1.4 jets (§2.2), Tau Ceti's constant-scaling law
`Bundle.ContMDiffRiemannianMetric.sectionalCurvature_leviCivitaConnection_rescale_const`
and SBC B6.0. The Surfaces
sub-roadmap uses HopfRinow, R1, R2, R3, R4.2, R4.9.6a's signed planar turning
theorem and R6, and supplies nothing to this roadmap. R6's Euclidean comparison follows R5a and
owns its chart Hessian/normal-derivative pairing and the identification of the
degenerate squared distances with the focal set, consuming Tau Ceti's
squared-distance properness and genericity theorems and GT Layer 1 only for the
normal bundle and tubular neighbourhood theorem. General
R6 focal/Jacobi/index theory then uses R2–R3/R5a and R4.2’s moving-endpoint comparison. R7 uses R1, DG/SBC, PseudodifferentialOperators P1.0 and K5a;
R8 uses R5a/R7, R4.7’s RP² quotient, and K5a/classical groups.
TopK T6.6 precedes R1's projective comparison; CC C2.0, GT's smooth triangulation and AT's §8.11a mapping-CW targets
precede R3's finite marked-point refinement and path-space comparison. Spin
G1.2/G2.2/G3.4 precede R7's Clifford/de Rham calculations, while the later
Spin Dirac/index consumers follow R7.8.
The speed metric in R3.1 gives the H¹ topology but is not assumed complete; H¹ charts are constructed independently. R3.3a's lacunary proof for n ≥ 3 and R3.3b's lifting proof for n = 1 precede R3.3c's Hopf homology calculation. Only their conjunction supplies the all-dimensional path result. R4.3 consumes Tau Ceti's smooth universal-cover manifold and pullback metric and proves its second countability, Hausdorffness and the completeness of the pullback metric before R4.5 applies the sine-test bound upstairs; finite π₁ is a conclusion after compactness, not a hypothesis of that construction. R4.1's Ricci-volume comparison uses R4.6's cut-truncated polar/nullity interface, and its global equality conclusion has its own complete-cover/no-identification argument. R7.0's local scalar Bochner identity, from Tau Ceti, precedes Hodge, Spin and cohomology; its integrated and equality consequences require n ≥ 2. R8.1's finite harmonic-polynomial restriction, uniqueness of the iterated Fischer decomposition and dimension require no K5a spectral completeness or highest-weight classification; R8.2–R8.4 retain those later suppliers. The round real projective example in R4.7 consumes the antipodal quotient/projectivization atlas and the native π₁ branches without a global space-form classification premise.


The smooth normal-variation order is immersion geometry → R5a.1 density calculus
→ R5a.2/R5b. CalibratedGeometry C3 consumes R5a.1; neither its calibrated
minimization nor GeometricCurrents regularity enters R5b.

## References

- J. M. Lee, *Introduction to Riemannian Manifolds*, second edition: Chapters 7–8
  for curvature/submanifolds, Chapter 10 for Jacobi/variation and focal
  Problems 10-14 and 10-19, Chapter 11 for comparison and Chapter 12 for the
  local-to-global/space-form theorems.
  This is the principal convention reference. Lee does not prove
  the full Morse index or Hodge theorem; those use their separate suppliers.
- J. Milnor, [*Morse Theory*, Annals of Mathematics Studies 51](https://www.jstor.org/stable/j.ctv3f8rb6), Princeton University Press,
  §6 (Lemma 6.5, p. 36; Lemma 6.9, pp. 37–38; Theorem 6.6) for the Euclidean focal-point/squared-distance
  theory and §§13–18 for the finite Jacobi/index and broken-path proof
  architecture.
- B. O'Neill, [The fundamental equations of a submersion](https://doi.org/10.1307/mmj/1028999604),
  Michigan Math. J. 13 (1966), 459–469, Theorem 2 and Corollary 1: the curvature
  identities of a Riemannian submersion used by R1's projective examples.
- B. Andrews, [Lectures on Differential Geometry, Lecture 16: Curvature](https://maths-people.anu.edu.au/andrews/DG/DG_chap16.pdf),
  Australian National University lecture notes, Proposition 16.2.1, p. 154:
  the polarization identity recovering the curvature tensor from sectional
  curvatures, used by §1.1 items 2 and 4 (in the slot convention
  `K(σ)=R(e₁,e₂,e₁,e₂)`); Corollary 16.8.5, p. 162: the connection and
  curvature of a bi-invariant metric, with the opposite curvature sign, used by
  R1.3.
- L. Brewin, [Riemann normal coordinate expansions using Cadabra](https://arxiv.org/abs/0903.2087),
  Class. Quantum Grav. 26 (2009) 175017, arXiv:0903.2087v3, §5 (third-order
  metric expansion, p. 9) and equation (11.1), p. 15: the quadratic and cubic
  jets of the metric in normal coordinates, used by R1.4.
- D. W. Lyons, [An elementary introduction to the Hopf fibration](https://arxiv.org/abs/2212.01642),
  Mathematics Magazine 76 (2003), 87–98, section "Seeing the Hopf
  fibration": the stereographic picture of the Hopf fibres used by R3.3c.
- L. I. Nicolaescu, [Lectures on the Geometry of Manifolds](https://academicweb.nd.edu/~lnicolae/Lectures.pdf),
  author's electronic edition, Definition 4.1.23, Proposition 4.1.25 and
  Lemma 4.1.26, p. 151 (injectivity radius; first-order contact of normal
  coordinates; vanishing of their Christoffel symbols at the centre, used by R1.4),
  Example 4.2.36, p. 195, and Exercise 4.2.38, p. 196 (the Einstein factor is
  Scal/n and is constant in dimension at least three),
  Theorem 5.2.26, p. 220 (Myers: diameter bound and compactness), Theorem 6.2.6,
  p. 238 (Cartan–Hadamard; its proof, an exponential map without critical points on a
  complete manifold is a covering map, is used by R5a.3 for the paraboloid vertex) and
  Example 6.2.29, p. 243 (compactness of the universal
  cover under a positive Ricci lower bound), Theorem 5.1.17, p. 212 (Clairaut's relation
  on a surface of revolution, used by R5a.3), §3.3.2, equation (3.3.7), pp. 103–104
  (parallel transport as the solution of `∇_(d/dt)u=0`, used by §1.2) and
  Theorem 12.2.5(b), p. 661 (Bochner: positive Ricci curvature kills b_1, used by R7.6).
- R. L. Bishop, [Riemannian Geometry](https://arxiv.org/abs/1303.5390), lecture
  notes, arXiv:1303.5390v2 (2013), Theorem 7.9, p. 50 (Synge's theorem in even
  dimension) and Problem 7.11, p. 50 (orientability in odd dimension), used by R4.6;
  Theorem 6.11, p. 41 (normal-coordinate expansion of the metric, used by R1.5),
  and §6.11 with Problem 6.12, p. 41 (the canonical frame by radial parallel
  translation, used by R1.4).
- K.-K. Kwong, [Quantitative comparison theorems in Riemannian and Kähler geometry](https://arxiv.org/abs/1904.08595),
  arXiv:1904.08595v1 (2019), Theorem 10(2), p. 27: the polar volume-density lower
  bound under an upper sectional curvature bound, integrated to Günther's volume
  comparison by R4.1.
- P. Petersen and M. Wink, [New curvature conditions for the Bochner technique](https://arxiv.org/abs/1908.09958),
  Invent. Math. 224 (2021), 33–54, arXiv:1908.09958v4, Corollary, p. 1: vanishing of
  the interior Betti numbers of a closed manifold of dimension n≥3 whose curvature
  operator is ⌈n/2⌉-positive, used by R7.7.
- J.-H. Eschenburg, [Comparison Theorems in Riemannian Geometry](https://myweb.rz.uni-augsburg.de/~eschenbu/comparison.pdf),
  lecture notes (Trento 1994), §3, Theorem 3.3, p. 13, and Rauch I, p. 14: the
  Jacobi-field norm comparison under an upper sectional bound, used by R4.1.
- E. Caponio and M. A. Javaloyes, [A remark on the Morse theorem about infinitely
  many geodesics between two points](https://arxiv.org/abs/1105.3923), arXiv:1105.3923v2
  (2011), §1, p. 1: Morse's theorem (*The Calculus of Variations in the Large*,
  Theorem 13.3, p. 239) and Serre's theorem on the homology of the based loop space
  of a compact simply connected manifold, used by R4.8 for simply connected M (the
  paper's wider clause, every compact manifold, fails for the circle, whose based
  loop space is homotopy-discrete).
- J. Barzen and F. Leymann, [Mathematics of Spacetime: A Guided Tour Through The
  Underlying Differential Topology and Differential Geometry](https://arxiv.org/abs/2606.02616),
  arXiv:2606.02616, Theorem 9, p. 60: the Killing–Hopf classification of complete
  simply connected manifolds of constant sectional curvature, used by R4.7; Lemma 35,
  pp. 61–62, and Lemma 36, p. 62: the curvature and Ricci tensors of a warped product,
  with the opposite curvature sign, used by R1.3.
- Z. Wang, [Riemannian geometry notes](https://xumin.net/c/files/riemannian_geometry.pdf),
  as recorded by X. Liang, Chapters 5–6, provides an accessible finite
  piecewise-Jacobi index reduction and comparison reference.
- Y. Homma,
  [Bochner–Weitzenböck formulas and curvature actions on Riemannian manifolds](https://arxiv.org/abs/math/0307022),
  for the curvature-action/spectral form of the Weitzenböck potential.
- I. A. Taimanov, [On the existence of three nonselfintersecting closed geodesics on manifolds homeomorphic to the 2-sphere](https://www.mathnet.ru/eng/im940), Izv. RAN Ser. Mat. 56:3 (1992), 605–635; English translation Russian Acad. Sci. Izv. Math. 40:3 (1993), 565–590, [doi:10.1070/IM1993v040n03ABEH002177](https://doi.org/10.1070/IM1993v040n03ABEH002177): the three-geodesics theorem, used by R4.9's headline, with simple-image multiplicity and shortening/minimax architecture. R4.9 specifies its own curve metric, relative finite model and uniform shortening maps.
- M. E. Gage, [Curve shortening on surfaces](https://www.numdam.org/item/ASENS_1990_4_23_2_229_0/), Ann. Sci. École Norm. Sup. 23 (1990), 229–256: surface evolution, continuation and long-time derivative estimates.
- B. Ma, [Curve shortening flow on Riemann surfaces with possible ambient conic singularities](https://arxiv.org/html/2007.00089v3), smooth-surface §§2–5: Jacobi distance comparison and localized singularity analysis. R4.9 constructs the explicit centered nonflat and eternal blowup milestones needed for its positive-length reduction.
- J. Lauer, [The evolution of Jordan curves on S² by curve shortening flow](https://arxiv.org/abs/1601.05704), round-sphere zero-area Jordan evolution and initial trace.
- M. A. Grayson, “Shortening embedded curves,” *Annals of Mathematics* 129 (1989), 71–111: finite-time/immortal curve-shortening alternatives and embedded-curve asymptotics; R4.9 states the precise consequences it uses as owned targets.
- S. Angenent, “The zero set of a solution of a parabolic equation,” *Journal für die reine und angewandte Mathematik* 390 (1988), 79–96: one-dimensional zero-number input for scalar parabolic differences.
- B. White, “A local regularity theorem for mean curvature flow,” *Annals of Mathematics* 161 (2005), 1487–1519: center-uniform Gaussian-density local regularity criterion; R4.9 owns its forced-curve specialization and cutoff/error hypotheses.
- P. T. Allen, A. Layne and K. Tsukahara, [The Dirichlet problem for curve shortening flow](https://arxiv.org/abs/1208.3510v2), arXiv:1208.3510v2 (2015): fixed-endpoint flow in convex constant-curvature domains; R4.9 states the actual wedge, boundary-flatness and nonconjugacy hypotheses it consumes.
- M. G. Dobbins, [Continuous dependence of curvature flow on initial conditions](https://arxiv.org/html/2106.08907v1), Lemma 2.2 for pre-extinction Hausdorff dependence; R4.9 supplies its length and positive-time parabolic upgrades.

- S. Zhu, [*The comparison geometry of Ricci curvature*](https://library.slmath.org/books/Book30/files/zhu.pdf),
  in *Comparison Geometry*, MSRI Publications 30 (1997), 221–262, Theorem 3.1,
  p. 226, and Corollary 3.3(1), p. 228: Bishop–Gromov relative volume
  comparison under a Ricci lower bound, used by R4.1.
- D. Azagra, J. Ferrera, F. López-Mesas and Y. Rangel,
  [*Smooth approximation of Lipschitz functions on Riemannian manifolds*](https://arxiv.org/abs/math/0602051),
  for R7.8's quantitative smoothing and intrinsic-distance comparison.
- G. Toth and W. Ziller,
  [Spherical minimal immersions of the 3-sphere](https://ems.press/content/serial-article-files/42818?nt=1),
  introduction and spherical-harmonic setup, for Takahashi/eigenmap normalization
  and the distinction between full eigenspace maps and arbitrary eigenfunction lists.
- W. Fulton and J. Harris, *Representation Theory: A First Course*,
  Graduate Texts in Mathematics 129, Springer, 1991, Lecture 18, §18.1 and
  Lecture 19: the isotropic basis, torus, roots and dominant weights of
  so_N fixed by R8.3's convention bridge.


- A. Hatcher, [*Algebraic Topology*](https://pi.math.cornell.edu/~hatcher/AT/AT.pdf),
  Cambridge University Press (2002), author's electronic edition, Theorem 4J.1, p. 471
  (ΩΣX is weakly equivalent to the James reduced product J(X) for a connected CW
  complex X) and Proposition 3C.8, p. 288 (the homology of J(X) is the tensor algebra
  on the reduced homology of X when the latter is free): the homology of ΩSⁿ, n≥2,
  stated by R3.3's headline.
- M. Taylor, [*Introduction to Lie Groups*](https://mtaylor.web.unc.edu/wp-content/uploads/sites/16915/2021/03/liegp.pdf),
  lecture notes, Department of Mathematics, University of North Carolina (version
  posted 2021), Chapter 8:
  equations (8.2.2), p. 398, and (8.2.13), with Proposition 8.2.1, p. 399 (the
  eigenvalues of the Laplacian of S^(n−1) and the restriction isomorphism from
  harmonic homogeneous polynomials onto its eigenspaces, used by R8.2); Proposition
  8.4.2, p. 415, and Proposition 8.5.1, p. 421 (uniqueness of zonal harmonics for
  n≥3 and irreducibility of SO(n) on each eigenspace, used by R8.3).
- P. M. H. Wilson, [*Differential Geometry, Examples 3*](https://www.dpmms.cam.ac.uk/~pmw1000/dg16.3.pdf),
  University of Cambridge, Part II, Lent 2016, Problem 14, p. 2: every geodesic of
  the paraboloid z=x²+y² that is not a meridian meets itself infinitely often, used
  by R5a.3.
- D. Gilbarg and N. S. Trudinger, *Elliptic Partial Differential Equations of
  Second Order*, Classics in Mathematics, Springer, 2001, Chapter 8: Theorems
  8.12–8.14 (regularity up to the boundary), Theorem 8.37 (the eigenvalue
  sequence, its variational characterization and the eigenfunction basis) and
  Theorem 8.38 (the first eigenvalue is simple with a positive eigenfunction),
  for scalar operators on bounded Euclidean domains, and Theorem 3.5 (the
  strong maximum principle), used by R5c.
- S. Axler, P. Bourdon and W. Ramey, [*Harmonic Function Theory*](https://www.axler.net/HFT.pdf),
  second edition (2001), electronic version of 17 July 2020, Proposition 5.5,
  p. 76, and Theorem 5.7, p. 77: unique finite harmonic decomposition
  of a homogeneous polynomial, over real or complex coefficients.
