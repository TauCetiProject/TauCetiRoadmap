# Curvature, Jacobi fields, submanifolds, and Bochner geometry

Develop the reusable graduate Riemannian geometry that connects curvature to
geodesic variation, the topology of complete manifolds, extrinsic geometry, and
harmonic forms. The milestones include full curvature calculus, Jacobi and index
theory, comparison and space forms, minimal submanifolds and spherical eigenmaps,
focal geometry, and the real Weitzenböck–Bochner package. Definitions come with
their coordinate, naturality, regularity, and computational APIs.

The definitive specification is this README. `Suggested.lean` gives selected
interfaces and is not an exhaustive checklist.

## Conventions and suppliers

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
is
[`CovariantDerivative.curvatureTensor`](https://github.com/TauCetiProject/TauCeti/blob/a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039/TauCeti/Geometry/Manifold/VectorBundle/CovariantDerivative/Curvature/Tensor.lean#L148);
sectional/Ricci/scalar curvature use
the existing covariant-derivative APIs, including their independent-vector
hypotheses. The curvature operator on bivectors is characterized by
`⟨Rop(X∧Y),Z∧W⟩ = ⟨R(X,Y)W,Z⟩`, so on constant curvature κ it is κ Id.

Energy is `½∫|γ′|²`. The index integrand is
`⟨D_t X,D_t Y⟩−⟨R(X,γ′)γ′,Y⟩`. The nonnegative Hodge/rough Laplacians
have scalar sign `Δ⁺=−div grad`. They are the negative of
DifferentialGeometry's scalar `laplaceBeltrami`, not a second definition of it.
Increasing wedges of an orthonormal coframe are orthonormal; repeated ordered
indices and sums over increasing pairs must have an explicit conversion.

For an isometric immersion f, use
`B(X,Y)=(∇^N_X df(Y))^⊥`, `S_η X=−(∇^N_X η)^⊤`, and
`⟨S_ηX,Y⟩=⟨B(X,Y),η⟩`. Mean curvature is the **averaged vector**
`H=(1/m)tr B` for m>0. The outward-normal unit sphere has B=−g times its
position vector; this fixes all normal and variation signs. Zero-dimensional
immersions use trace B=0 and are treated separately from the average formula.

Consume these exact suppliers:

- [HopfRinow](../HopfRinow/README.md), Layers 0–4: the reconciled distance and
  piecewise smooth length, Levi-Civita existence/uniqueness/regularity, intrinsic
  covariant differentiation along curves, geodesic spray/flow, natural-domain
  `TauCeti.Manifold.riemannianExp`, normal balls/logarithms, Gauss lemma, first
  energy variation, minimizing geodesics, completeness and smooth-isometry
  transport. Use its existing `alongCurveWithin` carrier and proved chart-change laws;
  R2 supplies the remaining arbitrary-section regularity and reparametrization
  extensions needed for iterated covariant differentiation.
- [DifferentialGeometry](../DifferentialGeometry/README.md), Layers 0–3,5–10,12:
  ordinary forms and exterior calculus, orientation, smooth flows, manifold Sard (Layer 10),
  integration/Stokes, de Rham/singular comparison, metrics, gradient/Hessian,
  divergence and the canonical density/measure bridge.
- [SmoothBundlesConnections](https://github.com/TauCetiProject/TauCetiRoadmap/blob/791dd408dc48930060b28043245bbb1a8d82b5de/TauCetiRoadmap/SmoothBundlesConnections/README.md), B1.4–B1.5/B2–B5/B6.0:
  actual smooth pullback/tensor/dual/End bundles, metric connections and their
  induced derivatives, curvature, parallel transport/holonomy, and real/complex
  bundle L². Transport reconstruction consumes B5's smooth path-family and
  concatenation/reparametrization laws, not an unspecified compatibility axiom.
  B6.0 supplies uniform normal and strong-convexity radii on compact sets.
- [GeometricTopology](../GeometricTopology/README.md), Layer 1: the actual normal
  bundle and normal exponential/tubular interface; Layer 7: the existing intrinsic
  curvature construction and `TauCeti.riemannianVolume`. This roadmap extends
  their geometric identities and comparison theory. General immersions use the
  corresponding orthogonal subbundle of f*TN; for embeddings it is canonically
  the Layer 1 normal bundle, with the same induced topology. The canonical quotient comparison
  is GT Layer 1's orthogonal-complement-to-quotient bundle equivalence; no additional quotient carrier is constructed.
  Layer 8 owns the eight three-dimensional model geometries; R4.7 compares its
  constant-curvature models with their native `ModelGeometry.Space` instances.
  Its smoothing-and-triangulation item 1 supplies the marked CW-pair and
  finite-point refinements consumed by R3.
- [ComplexKahlerGeometry](https://github.com/TauCetiProject/TauCetiRoadmap/blob/a452db2cfef888380d1b7b7ce00fa06d5bad1109/TauCetiRoadmap/ComplexKahlerGeometry/README.md), K5a: real/complex
  bundle Sobolev/Rellich, distributional regularity and global estimates for
  smooth Laplace-type systems, the formal-adjoint L² comparison, compact resolvent, Green operator,
  real de Rham Hodge theorem and harmonic representatives. This roadmap owns
  curvature identities and their geometric consequences, not another Hodge or
  bundle L² construction. [PDE](../PDE/README.md) supplies scalar weak-derivative,
  extension and elliptic estimates through K5a. R3 owns the vector-valued
  interval weak-derivative/absolutely-continuous comparison needed for paths. K7.1 supplies
  the smooth complex projective carrier used by R1; K7.2 supplies its normalized
  Fubini–Study form. PDO P1.0 supplies formal differential adjoints.
- [PDE A.1–6/D16–19/E20–22](../PDE/README.md) and
  [VariationalMethods V2.3–V2.4/V3–V5.2](https://github.com/TauCetiProject/TauCetiRoadmap/blob/515847c411b9f9642d7c1d180b2a6e82bb976e3a/TauCetiRoadmap/VariationalMethods/README.md): Sobolev,
  trace, energy/interior estimates and abstract closed-form/represented-operator
  theory for R5b's normal-Jacobi Dirichlet specialization. R5b constructs its
  boundary H² estimate and exact operator domain; these are not supplied by
  closed-manifold PDO/K5a or PDE E's interior regularity theorem.
  Consume [UnboundedOperators UO-D06](https://github.com/TauCetiProject/TauCetiRoadmap/blob/24e97bb6ab2f84e01c5a3caca0b6cd4d8ec72787/TauCetiRoadmap/OperatorTheory/UnboundedOperators/README.md#uo-d06--closed-forms-and-the-friedrichs-extension)
  for the single generic closed semibounded-form representation, with its
  native partial-operator domain, self-adjointness and real/complex comparison.
  The abstract order is VM V2.3 → UO-D06 → VM V5.1–V5.2; R5b
  supplies its geometric form and boundary-domain identification afterwards.
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
- [SpinGeometry G1.2/G2.2/G3.4](../SpinGeometry/README.md): the finite Clifford
  module and exterior-symbol comparisons used by R7. These precede the later
  Spin Dirac/index targets and have no R7 analytic input.
- [HomotopySpheres §3A.1](https://github.com/TauCetiProject/TauCetiRoadmap/pull/284):
  compact-generation/product foundations for AT's early finite-source mapping
  and based-loop CW-type targets. R3 proves its suspension range independently.
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
  and AT8.5 supplies Whitehead's CW comparison.
- [RepresentationTheory/LieGroups L0–L2](../RepresentationTheory/LieGroups/README.md):
  native Lie-group/manifold carriers, Ad and dAd=ad for the invariant metrics.
  SBC B1.4–B1.5 supplies smooth G/H, principal quotient bundles and the
  kernel/horizontal subbundles for the R1 submersion construction.
- [RepresentationTheory/ClassicalGroups](../RepresentationTheory/ClassicalGroups/README.md)
  Layers 3/5 and [CompactGroups](../RepresentationTheory/CompactGroups/README.md): complex orthogonal-group highest-weight/dimension targets, invariant
  products and complete reducibility. R8 constructs the harmonic-polynomial
  representation and identifies its complexification with the specific
  highest-weight module; it does not assume a supplied harmonic-tensor carrier.

- [PseudodifferentialOperators](https://github.com/TauCetiProject/TauCetiRoadmap/blob/526c10edca87fdb08907b1ad2a044fea1e7829f7/TauCetiRoadmap/PseudodifferentialOperators/README.md), P1:
  generic differential operators, jets, commutator order, geometric/Fourier symbol
  comparison, Dirac polarization and canonical Bochner connection. R7 consumes its rough/de Rham construction and symbol examples, and supplies
  the real geometric curvature/Weitzenböck identities. P5 extends K5a’s p=2
  scale to bundle p≠2/all-order/Hölder theory; P6 supplies arbitrary elliptic
  regularity. PDE retains scalar boundary and Calderón–Zygmund estimates.

The shared analytic order is K5a's pointwise Gram form metric, real star and
density line, then PDO P1.0's differential operators, symbols and density
formal adjoints, then K5a's real/complex distributional Sobolev scales, weak
H² realization, compact resolvent and real de Rham Hodge theory. PDO P1.1
and P2–P6 follow that analytic scale; R7 consumes these objects for its
geometric curvature identities. K5a applies to arbitrary real base dimension
and identifies real bundles with conjugation-fixed complexifications.

[MorseTheory M1–M6](../MorseTheory/README.md) owns ordinary Morse functions,
normal forms, compact-band deformation, cell attachments and abstract Morse–Bott
attachments and gradient convergence. [HeegaardFloer Lane M](../HeegaardFloer/README.md#lane-m-morse-homology-stage-0)
owns Morse–Smale trajectories and Morse homology.
R3 defines the single general complete-manifold finite broken-geodesic carrier
and path-sublevel comparison for any complete smooth metric. It does not need
the Bott-chain constructions in [HomotopySpheres Stage 4B](https://github.com/TauCetiProject/TauCetiRoadmap/pull/284).
MorseTheory M2 owns ordinary attachments and M5 owns the abstract
finite-dimensional Morse–Bott theorem.
[DGFloer](../DGFloer/README.md) consumes R2–R3 for generic Jacobi/index/path
geometry and owns free-loop extensions and CP/HP applications on the same
finite-vertex carriers and short-segment interpolation. R3 owns the round-sphere antipodal
Morse–Bott calculation below.

[RicciFlow](../RicciFlow/README.md) owns the differentiable sphere theorem and
Hamilton's three-dimensional positive-Ricci theorem. [AffineMorseLefschetz](../AffineMorseLefschetz/README.md)
owns the complex shape-operator and affine Lefschetz applications; it consumes
R5a/R6's real immersion/focal APIs. R3 owns the Morse proof and normalized
suspension-map comparison for sphere Freudenthal connectivity.

## R1. Intrinsic curvature calculus and normal-coordinate jets

1. Consume the existing pointwise curvature/sectional/Ricci/scalar carriers.
   Supply every missing metric symmetry, pair interchange and both Bianchi
   identities, their coordinate and moving-frame formulas, and smoothness of
   their scalar and tensor components. Induced tensor connections define ∇R;
   prove frame independence, contraction compatibility and isometry naturality.
   For End-valued curvature match SBC B4's covariant exterior derivative and
   `Ω=dω+½[ω∧ω]`, `d_∇Ω=0`, explaining the equivalent matrix
   `F=dA+A∧A` convention: section coefficients are columns and
   `∇s=ds+A s`, with matrix multiplication in the wedge. Include `(d_∇)²=R∧·`, the canonical tangent-valued
   identity 1-form/torsion comparison and the affine/skew-adjoint difference of
   metric connections as supplier acceptance checks. For the torsion-free
   connection pin the Ricci identity
   `∇²s(X,Y)−∇²s(Y,X)=R(X,Y)s`; identify its torsion correction for a
   connection with torsion.
2. Prove sectional curvature determines an algebraic Riemannian curvature
   tensor by an explicit polarization identity. Identify constant sectional
   curvature κ with `R(X,Y)Z=κ(⟨Z,Y⟩X−⟨Z,X⟩Y)`, hence
   `Ric=(n−1)κg`, scalar curvature `n(n−1)κ`. Include the n<2 cases separately;
   an empty collection of 2-planes must not characterize a nontrivial κ.
3. Prove Schur's theorem on connected n≥3 manifolds and the contracted-Bianchi
   Einstein statement `Ric=a(x)g ⇒ a constant`, also with n≥3. Define local symmetry by ∇R=0,
   prove parallel transport preserves R exactly when this condition holds,
   and prove locally symmetric surfaces have locally constant K, globally constant on
   each connected surface. Constant sectional
   curvature implies local symmetry. Flat curvature on an open set is equivalent
   to a local Euclidean isometry around every point of that set. For the flat
   implication use B5's local parallel frames, torsion-free closed coframes and
   DG's local primitives, then the shared manifold inverse-function theorem.
4. Build smooth orthonormal geodesic frames at a point, including their induced
   tensor frames. In a normal chart prove first derivatives of g vanish and
   characterize the quadratic/cubic jets by R and ∇R. With orthonormal vectors e_i at p,
   v in its tangent normal ball, pin
   `exp_p*g(e_i,e_j)=δ_ij−⅓⟨R(e_i,v)v,e_j⟩`
   `−⅙⟨(∇_vR)(e_i,v)v,e_j⟩+O(|v|⁴)`.
   State the remainder as an actual local norm bound uniform over unit e_i,e_j. Derive these expansions
   from R2's Jacobi equation, not an assumed Taylor formula for exp. In
   particular for unit T,Y with Y⊥T,
   `|d exp_(tT)(tY)|²=t²−⅓K(T,Y)t⁴+O(t⁵)`.

The algebra/connection part precedes R2; the jet computations follow it.
Use Mathlib's tensor, Gram, continuous-linear-map and finite-dimensional spectral
APIs. Consume SBC B2's exterior-square smooth bundle Λ²TM; supply its Gram inner
product and pin its musical isometry with K5a’s
degree-2 real Gram form bundle, and define self-adjoint Rop on that shared
identified carrier. No second unconnected exterior bundle is used. Metric
scaling, products, pullbacks, conformal changes and warped products get full
connection/curvature transformation laws, including scalar/Ricci contractions;
a constant scaling c>0 preserves the connection and scales K by 1/c.
For g̃=e^(2u)g set A_XY=du(X)Y+du(Y)X−g(X,Y)grad u and prove
∇̃=∇+A and
`R̃(X,Y)Z=R(X,Y)Z+(∇_X A)(Y,Z)−(∇_Y A)(X,Z)+A(X,A(Y,Z))−A(Y,A(X,Z))`.
In dimension n, with Δ⁺=−tr Hess, pin
`Ric̃=Ric−(n−2)(Hess u−du⊗du)+(Δ⁺u−(n−2)|du|²)g` and
`Scal̃=e^(−2u)(Scal+2(n−1)Δ⁺u−(n−1)(n−2)|du|²)`.
Reconstruct
a connection from smooth linear path transport by differentiating transported
sections, prove locality/Leibniz/chart independence and uniqueness, and recover
the transport. Use SBC B5’s family/concatenation theorems and compare to its actual
connection rather than merely naming this exercise in a supplier paragraph.

For a supplied positive Ad-invariant inner product on a finite-dimensional
real Lie algebra, construct the corresponding bi-invariant metric on the
native Lie-group carrier and prove invariance and completeness by
`TauCeti.completeSpace_ofRiemannianMetric_of_isPretransitive_isom`,
proving the transitive isometry action on its Riemannian-distance carrier.
This applies in every finite dimension, including noncompact homogeneous
metrics. Prove ∇_X Y=½[X,Y], R(X,Y)Z=−¼[[X,Y],Z] under the curvature convention
above, using left-invariant vector fields and proving that their native
vector-field bracket agrees with the supplied Lie-algebra bracket. Prove every
finite-dimensional left-invariant Riemannian metric, and every invariant
Riemannian metric on a homogeneous quotient, is complete. An Ad-invariant
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

**Projective metric examples.** This block follows the generic submersion
construction and the indicated smooth-carrier suppliers. Its curvature and
geodesic calculations also consume R4.7's independently constructed round
model, which uses R1's connection formulas and no R3 theorem.
On [ComplexKahlerGeometry K7.1](https://github.com/TauCetiProject/TauCetiRoadmap/blob/a452db2cfef888380d1b7b7ce00fa06d5bad1109/TauCetiRoadmap/ComplexKahlerGeometry/README.md#k7-projective-torus-and-hopf-examples)'s
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
round spheres of radius ½, while d=0 is a point. Compare the complex Kähler
form with K7.2's integral-one normalization: `ω_g=π·ω_FS`,
with `ω_g(u,v)=g(Ju,v)` and hence `ω_g(u,Jv)=g(u,v)`.

## R2. General Jacobi fields and exponential derivatives

First upgrade native C² `IsGeodesicCurveOn` solutions for a smooth metric to
C^∞ on the interval interior by bootstrapping the coordinate geodesic ODE;
give the endpoint version when the geodesic extends to an open interval.
For a smooth geodesic γ on a nondegenerate interval, define a Jacobi field as a
C² section X of γ*TM with `D_t²X+R(X,γ′)γ′=0`. Its C² lift to the tangent
bundle and the parameter-set unique-derivative hypothesis are part of the
definition. Extend the existing along-curve carrier: for C^(k+1) curves and
section lifts on a `UniqueDiffOn` parameter set, prove the lift of D_tX is C^k
with its fixed-chart formula near every point. Consume native
`CovariantDerivative.symmL_alongCurveInChartWithin` for chart independence under
its differentiability/unique-derivative hypotheses. Consume HopfRinow's
reparametrization law and prove iterated-derivative regularity before using
the Jacobi equation. The global
smooth solutions then follow by the linear ODE regularity theorem.

Prove linearity, restriction, overlap uniqueness, time translation/scaling and
smooth-isometry transport. Trivialize along γ by parallel transport and obtain a
linear second-order ODE on a **fixed** tangent space. Prove global solvability
on each prescribed compact geodesic interval for arbitrary (X(t₀),D_tX(t₀)),
smooth dependence, and the 2n-dimensional solution-space identification. This
solution space consists of sections on the interval, or the quotient of extended
sections by equality there; freely chosen values outside the interval are not
part of it. This does not require completeness of the whole manifold.

Every smooth variation through geodesics gives a Jacobi field. Conversely realize
any initial-data solution by a smooth geodesic variation on a common compact
time interval, using smooth initial position/velocity and the joint geodesic flow.
This converse does not promise fixed endpoints beyond first order. Prove
`d exp_(tv)(tw)=X(t)` for X(0)=0,D_tX(0)=w, and its version with varying basepoint.
Prove the Wronskian is constant and the splitting into tangential `(a+bt)γ′`
and normal fields for a nonconstant geodesic, with the affine-parameter scaling
explicit. Constant geodesics are the separate affine-vector-field case.
Pin the Gauss radial-length identity `|d exp_v(v)|=|v|`. For the equality
case in the radial-versus-angular length comparison, require d exp to be
nonsingular along the compared domain before concluding the angular component
vanishes; the norm inequality alone does not exclude a singular kernel.

For constant curvature compute all Jacobi solutions with sin/cos, linear or
sinh/cosh coefficients in a parallel frame. Identify positive-curvature conjugate
times/multiplicity and the nonpositive-curvature absence. Use these formulas for
the sphere examples, space forms and normal jets. Prove a Killing field
restricts to a Jacobi field along every geodesic, with the complete local-flow
isometry characterization and the identity
`∇²_(Y,Z)X=R(Y,X)Z`, where ∇²_(Y,Z)X=∇_Y∇_ZX−∇_(∇_YZ)X.

## R3. Second variation, index forms and conjugate points

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
including the jump of tangent velocity at each corner. Then prove mixed
covariant derivatives commute up to curvature, interchange
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
Define conjugacy by a **nonzero** Jacobi field vanishing at both endpoints;
multiplicity is the dimension of that solution subspace. Prove equivalence with
the singular differential of exp and nullity of the endpoint index form, with
radial direction excluded for a nonconstant geodesic. Multiplicity≤n−1; prove it also equals `dim ker(d exp_(bv))` with the
initial-time/velocity rescaling explicit.

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

Prove minimizing segments have index zero (positive-semidefinite index form). A conjugate point strictly
before the endpoint produces an explicitly smoothed shortening variation;
segments with no conjugate point in `(a,b]` are strictly locally minimizing
among uniformly close fixed-endpoint curves up to nondecreasing reparametrization
for length, or uniquely at the fixed affine parametrization for energy.
Global minimizing and absence of conjugacy remain distinct. R6 supplies the
submanifold-endpoint and focal versions on its mixed-endpoint subspace of the
same ambient interval-section module, with the bulk form restricted there.

Define the H¹ path carrier using continuous curves whose readings on a finite
coordinate subdivision have weak first derivatives in L². Pin its topology by
local exponential charts along reference smooth paths, with section norm
`(∫(|V|²+|D_tV|²))^(1/2)`; prove chart/subdivision independence, the
one-dimensional Sobolev chain rule, continuity into the compact-open carrier,
and relative smooth density. Piecewise C¹ paths have the induced H¹ topology.
Construct the finite-dimensional vector-valued interval weak derivative
coordinatewise from PDE's scalar theory, prove equivalence with absolute
continuity and the integral of the derivative, and prove energy is continuous.
For every absolutely continuous finite-energy
curve on [a,b], prove Cauchy–Schwarz
`Length(γ)²≤2(b−a)Energy(γ)` and its restriction to each subinterval.
For b>a prove equality exactly when the speed is constant almost everywhere,
including the zero-speed case.

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
and the marked CW pair (M,{p}). These use
HomotopySpheres Stage 3A.1's compact-generation/product API;
R3 consumes neither the separate smash/suspension comparison targets
nor its
Freudenthal theorem. The smooth-triangulation item 1 in
[GeometricTopology's smoothing-and-triangulation comparison](../GeometricTopology/README.md#the-smoothing-and-triangulation-comparison)
supplies that pair with p as a 0-cell. R3 transports the supplied
triangulation through MorseTheory M1's smooth model-change atlas
equivalence. Use the endpoint-change equivalence
below to obtain CW type for paths p→q, then AT's Whitehead comparison
upgrades the weak equivalence to a homotopy equivalence. Own all parametric
smoothing/finite-energy comparison maps used to enter this ordinary carrier.
For a chosen path η from p to q, construct the endpoint-change homotopy
equivalence between loops at p and paths p→q by concatenation with η and
its reversal, with explicit reparametrization/retracing homotopies and topology
comparisons; the equivalence depends on η.

For nonantipodal distinct endpoints on Sⁿ, n≥2, compute geodesic indices
j(n−1), j≥0. For n≥3 obtain the integral homology from the lacunary CW
complex. For n=2 use SBC B1's Hopf bundle S¹→S³→CP¹ and R1's
CP¹≃S² comparison. Construct `j:S¹→ΩS²` adjoint to the identity of S²
through AT4.4's normalized raw `reducedSuspensionSphereHomeomorph`.
Prove the map `S¹×ΩS³→ΩS²`, `(z,γ)↦j(z)⋆ΩHopf(γ)`, is a weak
equivalence: the Hopf long exact sequence gives the higher homotopy
isomorphisms, and j gives the π₁ generator. Prove the induced homotopy-group
map is (x,y)↦j_*x+(ΩHopf)_*y, using the loop unit homotopies and product
homotopy groups. Apply DGFloer Layer 1 item 2's homology invariance under
weak equivalence, AlgebraicTopology Stage 5 item 1's integral Künneth
and the n=3 calculation
to obtain H_i(ΩS²;ℤ)=ℤ for every i≥0, with the endpoint-change and cellular
generators compared. For S¹
identify winding components and their contractibility. For antipodal endpoints
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
stable homotopy calculations remain with
[HomotopySpheres](https://github.com/TauCetiProject/TauCetiRoadmap/pull/284).

## R4. Comparison, complete manifolds and space forms

1. Prove the index comparison/minimizing lemma for Jacobi fields with fixed
   endpoint values. Define `s_κ(t)=sin(√κt)/√κ`, t, or
   `sinh(√(−κ)t)/√(−κ)` according to the sign of κ. For unit-speed γ and
   normal Jacobi J with J(0)=0, prove `K≤κ ⇒ |J(t)|≥s_κ(t)|D_tJ(0)|`
   before the first positive model zero; for K≥κ prove the reversed bound
   before conjugacy of γ and the model zero. Include the two-manifold Rauch
   statement with equal initial derivative norms and curvature ordered along
   the compared normal planes. State equality as the curvature equation along
   the corresponding parallel/Jacobi directions; equality for all initial
   normal directions gives the model pullback metric and local isometry.
   On a smooth normal-distance domain derive radial Hessian zero and the
   corresponding transverse lower/upper bounds by `(s_κ'/s_κ)g`, together
   with the Laplacian trace and the scalar sign dictionary. Derive Günther
   lower-volume comparison from sectional upper bounds: on connected complete M
   with K≤κ, at p use 0<r<inj(p), and also r<π/√κ when κ>0, to conclude
   Vol_g(B(p,r))≥Vol_κ(B_κ(r)) in the model of the same dimension. Treat the
   low-dimensional cases directly. For radial comparisons beyond this full-ball
   range retain the actual cut-time-truncated polar domain; cut-locus nullity
   does not remove its radial truncation. Distinguish Bishop–Gromov global
   relative-volume monotonicity from Ricci lower bounds. Use the Jacobi
   determinant/Riccati equation, trace Cauchy–Schwarz and model s_κ to prove
   the radial density inequalities before integrating. Supply radial-Jacobian,
   polar-integration bridges, consuming R4.6’s cut-locus carrier and
   volume-nullity theorem.
2. On a connected complete noncompact manifold, prove a ray exists from every
   point by compactness of initial unit directions and a limit of minimizing
   segments. On a complete manifold the distance to a nonempty closed embedded
   submanifold is attained; a minimizing segment to it meets it orthogonally.
   Include first variation with a moving endpoint, consuming R3's corner formula.
3. Prove a local Riemannian isometry from a nonempty complete manifold to a
   connected manifold is a surjective covering. Use finite-length path lifting
   and proper closed balls, and prove pullback metrics preserve length, curvature
   and completeness on Riemannian coverings. Prove the related covering criterion
   for a local diffeomorphism with `|df(v)|≥|v|` and complete domain.
   A surjective local isometry with an incomplete domain need not be a covering;
   compute the punctured-line→circle example.
4. Cartan–Hadamard: on connected M, K≤0 and completeness imply exp_p is a covering from T_pM.
   Establish its nonsingular/expanding differential by R2/comparison and apply
   the preceding covering criterion. The simply connected specialization gives
   a global smooth exponential diffeomorphism, a unique geodesic between any
   two points at fixed affine parametrization (which is minimizing), and
   contractibility; a general connected manifold has Euclidean universal-cover
   topology and is aspherical. State nonemptiness and the basepoint explicitly.
5. Bonnet–Myers: for connected complete n≥2 and
   `Ric(v,v)≥λ|v|²` with λ>0, prove diameter≤π√((n−1)/λ), compactness and finite
   fundamental group. Sum the sine-test-field index forms along a minimizing
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
   conjugacy or loss of uniqueness, closedness/measurability and volume-nullity
   using Sard for conjugate values. Cover the remaining locus by countably
   many pairs of nonsingular inverse-exponential branches; their equal-distance
   locus is a regular hypersurface because distinct minimizing geodesics have
   distinct terminal velocities. Prove chart nullity and its canonical-volume
   comparison, including the infinite-cut-time convention. Prove the cut
   relation is closed and symmetric and that squared distance is smooth
   off this relation, including its smooth extension across the diagonal.
   Supply the smooth polar-coordinate domain and full-measure integration
   comparison needed by R4.1. OptimalTransport Layer 7 consumes these geometric
   objects and owns its semiconcavity and measurable selections. Consume SBC
   B6.0's positive uniform normal radius on compact manifolds to prove
   `inj(M)>0`. Minimize length in each free homotopy class
   on a closed compact manifold using arclength parametrization, Arzelà–Ascoli, lower semicontinuity and
   uniform normal-neighborhood homotopies;
   a nontrivial class gives a nonconstant closed geodesic. Prove Synge's compact connected even
   positive-dimensional oriented positive-sectional-curvature theorem using
   holonomy, an odd-dimensional special-orthogonal fixed vector and the closed
   index variation. Include the odd-dimensional orientability consequence and
   the real-projective counterexamples distinguishing the hypotheses.
   The even-dimensional conclusion is simple connectivity.
7. Consume the existing `TauCeti` round-sphere RiemannianBundle and
   `Riemannian/Hyperbolic.lean`, `Hyperbolic/UpperHalfSpace.lean` objects and
   GT Layer 7’s `HyperbolicMetric`; compare with GT Layer 8's native
   `ModelGeometry.Space` in dimension 3. Develop the missing model formulas in all n≥2:
   Euclidean, round sphere and hyperbolic space (hyperboloid, half-space and ball), including
   explicit isometries, geodesics, exponential maps, curvature and metric scaling.
   This direct model construction is independent of R3 and R4's comparison
   theorems: derive the round-sphere Levi-Civita connection by ambient
   tangential projection, verify curvature+1 and great-circle geodesics from
   R1's connection identities, and prove their scaling laws. It precedes
   R1's projective curvature/period calculations and R3's projective examples;
   the global space-form classification below uses the remaining R4 machinery.
   Use type synonyms carrying the induced Riemannian distance via
   `TauCeti.MetricSpace.ofRiemannianMetric` for connected models, with the
   compatible `EMetricSpace.ofRiemannianMetric`/edist version for disconnected
   carriers, and prove `IsRiemannianManifold`; the sphere’s
   subtype chordal metric needs this comparison. Native `UpperHalfSpace`
   already has its Riemannian distance; consume it. Pin the hyperbolic metrics
   `(|dx|²+dy²)/y²` on y>0 and `4|dx|²/(1−|x|²)²` on |x|<1, both K=−1.
   Consume native `RiemannianIsometry.affineIsometryMulEquiv` for Euclidean
   affine isometries and prove the semidirect-product identification
   E(n)=ℝⁿ⋊O(n). Consume `LinearIsometryEquiv.unitSphereIsomHom` and its
   injectivity, and `UpperHalfSpace.isPretransitive_isom`; complete the
   missing surjectivity/isometry-group descriptions. Identify the hyperbolic group
   O⁺(n,1), with its action on the future unit hyperboloid.
   On the hyperboloid restrict the fixed ambient Lorentz form to its tangent
   hyperplanes and prove positivity; construct the Riemannian metric and compute
   its connection directly rather than applying a Riemannian ambient immersion
   theorem to an indefinite ambient form. Build continuation and monodromy of
   local constant-curvature isometry germs from their value/tangent data, using
   completeness to continue along finite paths and simple connectivity to
   remove path dependence.
   Prove the Killing–Hopf universal-cover classification and the quotient
   description by free properly discontinuous discrete smooth isometries.
   Construct the quotient atlas, descended metric and covering for a free properly
   discontinuous discrete group of smooth isometries on any Riemannian manifold;
   this construction does not require constant curvature. Prove completeness and
   curvature descend when the source has those properties. Specialize this generic
   construction to the preceding space-form classification and to free finite-group
   actions on closed manifolds used by PDO P7a.
   Local isometries of a connected source are determined by value and tangent
   map at one point. Identify round-sphere isometries with O(n+1), and classify
   even-dimensional spherical space forms as the sphere and real projective
   space. For real projective space consume AlgebraicTopology Stage 4.6's
   native projectivization, coordinate-atlas and CW comparison; identify the
   generic isometric quotient with that carrier and descend the round metric.
   Complete connected dimension 1 manifolds are a line or a circle with
   its circumference parameter; dimension 0 is a point, independently of κ.
8. For every pair of distinct points on a connected closed positive-dimensional
   Riemannian manifold, prove at least two geodesics with different unparametrized
   images or traversals; affinely changing the parameter is not a new geodesic.
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


The covering, model and comparison APIs serve geometric topology without changing
its canonical volume or three-dimensional geometric-structure objects.

## R5. Isometric immersions and minimal geometry

### R5a. Immersion geometry and first variation

For a smooth isometric immersion f:M→N, construct the tangent/normal orthogonal
splitting of f*TN and the pullback ambient connection. For embeddings compare the
orthogonal-complement normal bundle, topology and smooth structure literally with
GT Layer 1; for immersions use the pullback fibers, without identifying distinct
points of M. Prove the induced tangential connection is Levi-Civita, define B,
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

#### R5a.1. Orientation-free C² relative volume

Own `volumeVariation_isContDiff` on these same immersion carriers,
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

#### R5a.2. First variation and immersion examples

Build the principal-curvature and averaged-H APIs; prove total geodesicity iff
B=0 and hence minimality. For compact boundaryless immersions, and for
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
B, S, H and K; the cross-product formula raises an index with the inverse first
fundamental form. Compute the unit round sphere in stereographic coordinates, with
`g_ij=4δ_ij/(1+|x|²)²`,
`Γ^k_ij=−2(δ^k_i x_j+δ^k_j x_i−δ_ij x_k)/(1+|x|²)`, K=1 and H=−position. Compute the
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
parameter at every point. On the complete paraboloid prove every nonmeridional
geodesic has infinitely many self-intersections by its conserved angular
momentum, a unique turning radius and reflection symmetry for the **maximal
all-time nonconstant** geodesic; establish the
needed ODE limit estimates rather than inferring derivative limits from
bounded monotonicity. Prove its vertex has no conjugate points by explicit
radial/rotational exponential variations despite positive K.

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
second-volume-variation formula `minimalNormalSecondVariation`:

`Q(V,W)=∫[⟨∇⊥V,∇⊥W⟩−Σ_i⟨R^N(V,e_i)e_i,W⟩`
`−Σ_ij⟨B(e_i,e_j),V⟩⟨B(e_i,e_j),W⟩] dvol_P`.

Prove frame independence, symmetry, compact-support locality, smooth
isometry transport and the actual normal Jacobi differential operator,
its ellipticity, principal symbol and formal self-adjointness. Stability
means Q(V,V)≥0 for every such normal section. Do not identify normal
sections with scalar functions unless a global unit normal is supplied.

For a two-sided hypersurface choose a smooth unit normal ν, set
`A(X,Y)=⟨B(X,Y),ν⟩`, and construct `hypersurfaceJacobiOperator`
`L=Δ⁺−(|A|²+Ric_N(ν,ν))`. Prove
`Q(φν,ψν)=∫[⟨∇φ,∇ψ⟩−(|A|²+Ric_N(ν,ν))φψ]=∫φ Lψ`.
With R5a's B convention, the derivative of trace scalar mean curvature
at a minimal hypersurface is `−Lφ`; that of the averaged scalar mean
curvature is `−Lφ/m`, m>0. Prove these actual linearizations, normal-reversal
and orientation independence. On a one-sided hypersurface give the normal
line-bundle form and its double-cover scalar description with deck-odd
sections, not the scalar inequality for every function on the cover.

Prove the W¹,²_0 quadratic-form extension on relatively compact smooth
domains and its agreement with the smooth form. Consume PDE A.1–6/D16–19/
E20–22's Sobolev, trace and bounded-domain elliptic/Dirichlet estimates, and
[VariationalMethods V2.3–V2.4/V3–V5.2](https://github.com/TauCetiProject/TauCetiRoadmap/blob/515847c411b9f9642d7c1d180b2a6e82bb976e3a/TauCetiRoadmap/VariationalMethods/README.md)'s
abstract coercive, compact-form and represented-operator comparisons, consuming
UO-D06's single generic closed-form representation. Own their finite-chart Riemannian normal-bundle specialization:
actual metric/connection weights, trace-compatible transitions, bounded curvature
potential, coercive shift, form closure and compact embedding. Construct the
Dirichlet self-adjoint realization, domain/regularity comparison, compact resolvent
and variational eigenvalue/index statements on those compact domains. This is not
another generic form/spectral theory; CKG K5a retains compact-boundaryless bundle
Laplace theory and PDO P5/P6 does not supply a Dirichlet boundary theorem.
Own `normalJacobi_boundaryH2Estimate` on a relatively compact smooth domain D
with smooth boundary and the actual smooth normal bundle/connection. For its
normal Jacobi operator L, a weak u∈W¹,²₀ with Lu=f∈L² satisfies
`‖u‖_(W²,²)≤C(‖f‖_(L²)+‖u‖_(L²))`. Construct the finite-chart bundle W²,²
carrier and equivalent transition/trace norms. Prove the boundary estimate by
smooth boundary flattening, localized tangential difference quotients and the
first-order energy estimate; control connection/metric commutators and recover
the second normal derivative from the uniformly elliptic normal coefficient.
The principal symbol is the scalar metric symbol times the identity. This
boundary H² theorem is a target here, not an assumed PDE E theorem.
Own `normalJacobi_dirichletDomain_eq_sobolevTwo_inter_zeroTrace`: the represented
Dirichlet operator has domain exactly W²,²(D;ν)∩W¹,²₀(D;ν), with graph norm
equivalent to W²,². Compare it with the smooth differential operator and give
interior/up-to-boundary higher regularity for smooth data by the same chart
argument. No global Fredholm claim on arbitrary noncompact P is inferred.

Own `minimalHypersurface_scalarGauss` with full scalar curvature:
`Scal_P=Scal_N−2Ric_N(ν,ν)+(tr A)²−|A|²`, and
`minimalHypersurface_stability_fullScalar`: at minimality stability is
`∫(2|∇φ|²+Scal_P φ²)≥∫(Scal_N+|A|²)φ²`.
In dimension 2, `Scal_P=2K`, so the ambient full scalar appears with
coefficient 1/2 in the equivalent surface inequality. Boundary/free-boundary
formulas require their own stated variation class and outward/normal
second-fundamental-form signs; the compactly supported interior formula
does not silently include them. CalibratedGeometry C6 retains its special
Lagrangian/Hodge Hessian identity on its existing carrier.

## R6. Focal geometry and squared-distance Morse functions

Use the actual normal exponential on its open natural domain
`{(p,v)∈νM | v∈expDomain(f(p))}`. GT owns the embedding total-space bundle,
normal-exponential definition and local tube.
Consume GT’s natural-domain openness and smoothness, proved using the shared
expDomain and tangent-bundle exponential lemmas. For complete ambient N the
domain is all of νM. R6 owns focal critical-point and index/Hessian geometry.
For general immersions use R5a’s pullback normal bundle and the same ambient
exponential formula, comparing the embedding specialization to GT literally.
Define a focal point as a critical domain point, with multiplicity the kernel
dimension there; the focal set in N is the image of those points. Distinct
critical domain points can give the same ambient value with different
multiplicities. The zero section is nonfocal. For t₀>0 characterize its kernel
by nonzero Jacobi fields satisfying
`X(0)∈T_pM`, `(D_tX)(0)+S_(γ′(0))X(0)∈ν_pM`, `X(t₀)=0`.
Prove the converse geodesic-variation realization and compare derivatives of
normal exp in base/fiber directions with the induced normal connection.
Manifold Sard then proves the focal set has measure zero for the ambient
Riemannian measure; relate chart Lebesgue nullity to the canonical density.

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

In Euclidean ambient space compute the normal-exponential derivative block and
`det(I−tS_v)`. Focal times along a unit normal are 1/κ_i for nonzero principal
curvatures, with multiplicity; retain both signs of t and use t>0 for the
chosen forward normal ray. For `h_q(p)=|f(p)−q|²`, criticality is normality
and Hessian is `2(g−⟨B, q−f(p)⟩)`; at q=f(p)+tv this is 2(I−tS_v).
Identify degeneracy/focality and count negative Hessian directions by the
segment f(p)+sv, 0<s<1 when q=f(p)+v: the index of h_q at p is the sum
of those focal multiplicities (Milnor Lemma 6.5), with endpoint focality counted
as nullity instead of index. Compare with actual
`TauCeti.manifoldMorseIndex` in `Morse/Index.lean`. Consume GT Layer 1's
`euclideanSquaredDistance_isProper`,
`euclideanNormalEndpoint_criticalImage_isNull`,
`ae_nondegenerateCriticalPoints_euclideanSquaredDistance` for C² closed
embeddings and `ae_isMorse_euclideanSquaredDistance` for smooth closed
embeddings. Those generic proper-exhaustion/almost-everywhere theorems have
no R6 input. R6 owns their intrinsic Hessian/focal/index comparisons;
an arbitrary nonclosed embedding does not give a proper exhaustion.

Consume GeometricTopology Layer 1's direct C² chart lemmas
`euclideanChartSquaredDistanceHessian` and
`euclideanChartNormalDerivativePairing`. Compare their chart second derivatives
with R5a's intrinsic B/S and normal connection, proving the Euclidean Hessian
and normal-exponential derivative-block formulas on that shared normal bundle.
GT owns the scaled-positive-Hessian argument and inversion for every ε>0
injective normal tube of a closed-image Euclidean embedding, with C¹ inverse
for C² embeddings and smooth inverse for smooth embeddings. Compactness
supplies its uniform-radius existence corollary. GT's chart calculation and
nearest-point proof are independent of R1–R6; this roadmap consumes them for
its intrinsic comparisons, then supplies the focal/Jacobi/index consequences
from R2–R4.

## R7. Rough Laplacians, Weitzenböck and curvature vanishing

1. On actual finite-rank metric bundles with compatible connections, consume
   PDO P1’s rough-Laplacian definition, invariant negative covariant trace,
   formal L² identification with ∇*∇ and nonnegative energy identity.
   Specialize those supplier identities to geometric moving frames and
   coordinates: `∇*∇φ=−Σ(∇_ei∇_eiφ−∇_(∇_ei ei)φ)`; the shorter sum
   is valid only in a normal frame at its center. Supply the geometric product
   rule `∇*∇(fφ)=(Δ⁺f)φ−2∇_(grad f)φ+f∇*∇φ`, scalar sign, induced tensor/curvature computations and smooth
   distributional/operator-domain comparison with K5a.
2. Consume PDO P1’s differential-operator filtration on bundle sections:
   locality/restriction, order≤k via iterated commutators, principal symbol on
   symmetric cotangent tensors, connection-independent leading term, coordinate
   and covariant-derivative expansion, composition and formal adjoint symbols.
   Consume its `[D,f]` order≤k−1 theorem, geometric/Fourier symbol dictionary
   and d/d*/∇/adjoint examples for the actual DG/SBC carriers. The jet symbol
   without i and Fourier `σ(∂_j)=iξ_j` are P1’s single convention dictionary;
   use that dictionary in the geometric identities below. Degreewise d is not an
   invertible-symbol operator in dimension ≥2; in dimension 1, d:Ω⁰→Ω¹
   is elliptic. De Rham ellipticity is exactness of its symbol
   complex, while d+d* is elliptic on the sum of degrees.
3. Consume PDO P1’s Dirac/Laplace-type and Bochner-connection theorem. For
   a first-order geometric operator D:E→F with jet symbol c(ξ) and
   `c(ξ)*c(ξ)=|ξ|² Id_E`, use its **symmetric** polarization
   `c(α)*c(β)+c(β)*c(α)=2⟨α,β⟩Id_E`.
   Identify D*D’s Laplace-type symbol and its difference from the rough Laplacian for an
   arbitrary chosen metric connection by order≤1. Consume P1’s unique canonical
   Bochner connection/potential; here compute the potential for the actual
   geometric operators and identify the induced metric connection. K5a supplies
   Laplace-type estimates; PDO P5–P6 supplies the wider all-order/Lp theory.
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
   dictionaries and Rop spectral-expression API, not just one frame formula.
5. Prove the section-norm identity
   `Δ⁺|φ|²+2|∇φ|²=2Re⟨∇*∇φ,φ⟩` and Kato's inequality. The classical derivative
   formula is on φ≠0; at its zero set prove the Sobolev weak/a.e. inequality
   using `√(|φ|²+ε²)` and the completed K5a weak-regularity/domain API.
6. On closed connected M, positive ℛ_p implies H^p(M;ℝ)=0; nonnegative ℛ_p
   implies every harmonic p-form is parallel and b_p≤binomial(n,p). Prove
   evaluation injectivity for parallel forms, and compute equality on the flat
   torus with the de Rham/singular comparison. In particular positive Ricci
   kills b_1. The statements are componentwise without connectedness.
7. For Ricci lower bound λ and Rop upper eigenvalue bound Λ, prove
   `⟨ℛ_pω,ω⟩≥p(λ−(p−1)Λ)|ω|²` by genuine spectral diagonalization of the
   whole curvature operator. Develop its exterior Lie-algebra action/sum-of-
   squares formula; if Rop≥ε Id, derive ℛ_p≥ε p(n−p) Id for 1≤p≤n−1.
   Thus positive Rop on closed connected n≥3 gives b_2=0, with the n=2 sphere
   as the sharp hypothesis guard. Independently, `λ>(p−1)Λ` kills b_p for
   1≤p≤n−1; state this Ricci/curvature-operator criterion precisely. If Rop
   has eigenvalues in [α,β] with α>β/2>0, then Ric≥(n−1)α and this criterion
   for 1≤p≤⌊n/2⌋ and use duality for the remaining interior degrees, killing
   all interior Betti numbers on closed oriented connected
   n≥2 manifolds. Identify the rational homology sphere with coefficient
   comparison. The stronger result that any positive Rop kills all interior
   Betti numbers follows separately from the sum-of-squares bound above. Diagonal values on basis wedges
   alone never establish positivity of a general endomorphism.
8. On every connected smooth Riemannian manifold prove bounded Lipschitz
   functions admit bounded smooth approximations: for continuous
   η:M→(0,∞) and ε>0 produce smooth g with |g−f|≤η and
   sup|dg|≤Lip(f)+ε. Use min(η,1) so g is bounded even when η is not.
   Own the quantitative
   local mollification/partition-of-unity estimates and derivative-bound
   gluing; a qualitative smooth approximation is insufficient. Prove
   the proof inputs: near-isometric exponential charts, McShane extension
   and bounded truncation, Euclidean convolution preserving the Lipschitz
   bound, and countable locally finite smooth partitions with approximation
   errors summable against their derivative bounds. Differentiate the glued
   error using Σdψ_i=0 to control the partition term.
   Prove
   `dist(p,q)=sup{|f(p)−f(q)| : f smooth bounded real, sup|df|≤1}`
   for the intrinsic distance, with no completeness assumption. For the
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

## R8. Spherical harmonics and minimal eigenmaps

For the unit sphere S^m (m≥1), construct restriction of homogeneous degree-d
harmonic polynomials in m+1 variables and prove it identifies them with the
`Δ⁺` eigenspace for λ_d=d(d+m−1). Prove the harmonic homogeneous decomposition
of polynomials, restriction injectivity, dimension
`binomial(m+d,d)−binomial(m+d−2,d−2)` (the second term zero for d<2), completeness
and orthogonality with K5a's spectral decomposition. Include the m=1 Fourier
pair, constants d=0, and O(m+1)-equivariance. Construct the harmonic-polynomial representation and compare its
complexification on SO(m+1) with highest weight dε₁ (d times the vector highest weight), consuming ClassicalGroups Layers 3/5's highest-weight classification targets
and its existing numerical Weyl-dimension APIs (including
`ClassicalGroups/WeylDimension/OddOrthogonal.lean` and
`ClassicalGroups/WeylDimension/EvenOrthogonal.lean`). Spell out the low-rank fundamental-weight conversions, and handle SO(2) separately
by its pair of characters for d≥1 and one trivial character for d=0; real form, orientation-group restriction and O-action
are explicit. Construct the complex SO-action by
`(g·p)(x)=p(g⁻¹x)`. Choose rotations
R_θ(x₁,x₂)=(cosθ x₁−sinθ x₂,sinθ x₁+cosθ x₂),
ε₁(R_θ)=e^(iθ), and positive roots with vector highest weight ε₁.
Prove `(x₁−ix₂)^d` is a highest-weight vector with character dε₁.
Use the supplied classification to establish irreducibility; the numerical
Weyl formulas alone are not a supplied highest-weight module.

For an L²-orthonormal basis f_1,…,f_N of a positive eigenspace, prove
`Σf_i²=N/Vol(S^m)` by orthogonal-group transitivity and
`Σdf_i⊗df_i=(λN/(m Vol(S^m)))g` by isotropy invariance and trace.
Normalize the vector-valued map by
`F=√(m Vol(S^m)/(λN))(f_1,…,f_N)`.
It is an isometric immersion into S^(N−1)(√(m/λ)) and is minimal there.
For any isometric immersion into a round sphere prove Takahashi's converse:
minimality iff its Euclidean coordinate functions satisfy Δ⁺f_i=(m/r²)f_i.
An arbitrary list of eigenfunctions need not be an immersion or isometric.

Compute degree 2 on S²: N=5, not 6. The three diagonal trace-free quadratics
are linearly dependent; pin a five-dimensional traceless-symmetric-matrix model
and an explicit orthonormal coordinate identification. The unit-target map

`(x,y,z) ↦ (√3(x²−y²)/2, √3xy, √3xz, √3yz, (2z²−x²−y²)/2)`

has induced metric 3g; dividing it by √3 gives the isometric minimal immersion
into S⁴(1/√3). Prove its fibers are antipodal pairs and its descent is a smooth
embedding of RP², with induced metric and O(3)-equivariance. These identities,
the stereographic outputs and the catenoid/helicoid/paraboloid computations
are required acceptance cases of the generic APIs.

## Dependency order and validation

R1's generic connection/tensor/submersion algebra precedes R2; R1's normal
jets follow R2. R4.7's direct model geometry uses R1's connection formulas
and HopfRinow without R3 or R4's comparison theorems. R1's projective metric
examples consume K7.1/K7.2/G4.0b, that round-model geometry and the generic submersion
formulas; R3's projective examples consume those metrics and R2. SBC B6.0
precedes R3's finite-vertex choice and R4.6's injectivity-radius consequence.
R4's comparison theorems use R1–R3; construct R4.6's cut-locus/nullity part before R4.1's
polar integration, and supply OT Layer 7's geometric injectivity/cut-locus objects; geodesic multiplicity uses R3’s finite approximation and the
R3/AT8.11a ordinary path carrier and DGFloer's standing Moore comparison. R5a uses the shared
bundle/normal interfaces and R1; R5a.1's density lemma precedes R5a.2 and R5b.
R5b additionally uses PDE and VariationalMethods, with no CalibratedGeometry
input. R6's Euclidean comparison follows R5a and
consumes GT Layer 1's chart Hessian/normal-derivative pairing. GT's nearest-point
theorem has no R6 input. General
R6 focal/Jacobi/index theory then uses R2–R3/R5a and R4.2’s moving-endpoint comparison. R7 uses R1, DG/SBC, PDO P1 and K5a;
R8 uses R5a/R7, R4.7’s RP² quotient, and K5a/classical groups.
TopK T6.6 precedes R1's projective comparison; CC C2.0, GT's marked
triangulation and AT's early §3A.1 mapping-CW targets precede R3. Spin
G1.2/G2.2/G3.4 precede R7's Clifford/de Rham calculations, while the later
Spin Dirac/index consumers follow R7.8.
Give every object identity/linearity/regularity/naturality and local-to-global
  comparison lemmas before its headline theorem. Compile prototypes against the
real Tau Ceti imports; remove supplier mirrors when the actual API is available.

The smooth normal-variation order is immersion geometry → R5a.1 density calculus
→ R5a.2/R5b. CalibratedGeometry C3 consumes R5a.1; neither its calibrated
minimization nor GeometricCurrents regularity enters R5b.

## References and source provenance

- J. M. Lee, *Introduction to Riemannian Manifolds*, second edition: Chapters 7–8
  for curvature/submanifolds, Chapter 10 for Jacobi/variation and focal
  Problems 10-14 and 10-19, Chapter 11 for comparison and Chapter 12 for the
  local-to-global/space-form theorems.
  This is the principal convention reference. Lee does not prove
  the full Morse index or Hodge theorem; those use their separate suppliers.
- J. Milnor, [*Morse Theory*, Annals of Mathematics Studies 51](https://www.jstor.org/stable/j.ctv3f8rb6), Princeton University Press,
  §§13–18 for the finite Jacobi/index and broken-path proof architecture.
- Z. Wang, [Riemannian geometry notes](https://xumin.net/c/files/riemannian_geometry.pdf),
  as recorded by X. Liang, Chapters 5–6, provides an accessible finite
  piecewise-Jacobi index reduction and comparison reference.
- Y. Homma,
  [Bochner–Weitzenböck formulas and curvature actions on Riemannian manifolds](https://arxiv.org/abs/math/0307022),
  for the curvature-action/spectral form of the Weitzenböck potential.
- D. Azagra, J. Ferrera, F. López-Mesas and Y. Rangel,
  [*Smooth approximation of Lipschitz functions on Riemannian manifolds*](https://arxiv.org/abs/math/0602051),
  for R7.8's quantitative smoothing and intrinsic-distance comparison.
- G. Toth and W. Ziller,
  [Spherical minimal immersions of the 3-sphere](https://ems.press/content/serial-article-files/42818?nt=1),
  introduction and spherical-harmonic setup, for Takahashi/eigenmap normalization
  and the distinction between full eigenspace maps and arbitrary eigenfunction lists.
