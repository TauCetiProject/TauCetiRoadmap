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

- [HopfRinow](../../Completed/HopfRinow/README.md), Layers 0–4: the reconciled distance and
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
- [ConformalMapping L3/L5](../ConformalMapping/README.md) supplies the Riemann map/closed-disc Jordan correspondence and plane separation/filled-hull floor. [GeometricMeasureTheory G1/G6](../GeometricMeasureTheory/README.md) and [DifferentialGeometry5.6](../DifferentialGeometry/README.md) supply rectifiable length/arclength, Jordan index, proximity/reparametrization and trace-area-zero comparisons. [GeometricMeasureTheory G3–G5](../GeometricMeasureTheory/README.md#g3--distributional-bv-and-variation-measures) supplies the generic BV/variation/perimeter floor; R4.9 constructs its spherical chart comparisons and symmetrization applications. R4.9 constructs the spherical component-cover, annular, round-regularization and finite-family shortening applications. [Isoperimetry I3/I6](../Isoperimetry/README.md#i6--full-planar-jordan-theorem-and-compatibility) supplies the Euclidean Jordan inequality for the normal-chart weak small-area application; R4.9 owns spherical symmetrization and the sharp spherical utility.
- [CharacteristicClasses C1.5/C2/C3](../CharacteristicClasses/README.md) supplies the ordinary finite RP²/cup/Thom comparisons used on the tautological disk bundle in R4.9; [AlgebraicTopology Stage6](../AlgebraicTopology/README.md) supplies its absolute cup/relative cap, singular small-chain and homotopy APIs. R4.9 owns the direct relative cover cocycle on its curve space and the particular finite cycle/cap-localization adapters.
- Native Mathlib `Besicovitch.exist_disjoint_covering_families` and its finite-dimensional normed-real-space instance supply disjoint closed-ball color families and open-ball covering for R4.9's finite geometric parameter cutoffs. R4.9 constructs the finite extraction, cutoffs and geometric-operator estimates. Its principal shortening route is length-controlled round regularization followed by the actual-metric smooth flow, with its own finite-time blowup, local exit-cost and family-stopping applications.
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

### R3.1. H¹ paths and the speed topology

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

For the interval path carrier compare the H¹ topology with the course's
speed metric
`d_s(γ,η)=sup_t dist(γ(t),η(t))+‖|γ′|−|η′|‖_L²`.
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

### R3.3. Nonconjugate round-sphere paths, in three independent branches

Keep the ordinary path carrier, chosen endpoints and endpoint-change maps fixed throughout these calculations. The full result uses the three constructions below; the n=2 argument is not a premise of the n>=3 producer or of circle winding.

#### R3.3a. Lacunary cells in dimensions n>=3

For the unit round S^n, n>=3, fix p,q with q neither p nor -p and angle theta∈(0,pi). The two oriented great-circle arcs and their extra full turns have lengths theta+2*pi*k and 2*pi-theta+2*pi*k. The Jacobi/index comparison gives indices 2*k*(n-1) and (2*k+1)*(n-1), and no nullity at these nonconjugate endpoints. The actual finite broken-geodesic critical-band theorem and coherent exhaustion therefore give exactly one cell in every dimension j*(n-1), j>=0, on the ordinary path CW-type model. Since n-1>=2, no cells have adjacent dimensions and every cellular boundary is0. Hence integral H_i is Z in multiples of n-1 and0 otherwise. Use the genuine CW/homology colimit for the unbounded exhaustion. There is no1-cell, so the based path model is simply connected by the relative-cell connectivity theorem. Endpoint change by a chosen reference path transports this to Omega S^n. In particular Omega S3 has free integral homology Z in even degrees and is simply connected. The n2 Hopf bridge and n1 winding are distinct consumers/branches, never premises here.

#### R3.3b. Winding components for the circle

Use the native real covering of Circle with period2*pi, after the designated round-S1 homeomorphism. For fixed endpoint angle theta, lift every path starting at the fixed real lift; its endpoint lies at theta+2*pi*k for a unique integer k. General parameter covering homotopy lifting makes the endpoint label locally constant. In each k fibre, straight interpolation between two real lifted paths fixes both endpoints and contracts it to the linear path; descent gives the contraction of that ordinary path component. Thus the path carrier has the homotopy type of the discrete integers, H0 is the direct sum of one Z per winding and all higher homology vanishes. The label is the actual native winding/fundamental-group generator, with concatenation convention compared. This does not import a higher-sphere or n2 Hopf calculation.

#### R3.3c. The n=2 Hopf comparison

Use the designated native complex projective line and the unit sphere of C², compared to the actual real S3 by the real-linear isometry (Re z0,Im z0,Re z1,Im z1). The map z↦C*z is the principal Circle Hopf bundle. On the projective chart z0≠0, w=z1/z0, use the section (1,w)/sqrt(1+|w|²) and fibre coordinate z0/|z0|; on z1≠0 use the analogous section. Prove the inverse and transition formulas, joint continuity/smoothness and fibrewise free transitive right action. These local trivializations construct the actual fibre-bundle projection, hence the native Serre lifting predicate; no final projective cohomology or circle Chern classification is a prerequisite.

The CP1-to-unit-S2 map descends
h(z)=(2 Re(conj(z0)*z1),2 Im(conj(z0)*z1),|z0|²−|z1|²).
Compute its squared norm as (|z0|²+|z1|²)²=1 and its exact Circle fibres. The two affine chart/stereographic inverse formulas prove bijectivity, continuity and smoothness of both directions. Alternatively compact-to-Hausdorff gives the homeomorphism before the chart smooth comparison. Pin [1:0] to the north pole; the displayed chart has positive complex orientation at that pole. A different conjugation convention reverses its orientation and must be compared explicitly. This is a pointed homeomorphism/diffeomorphism needed by homotopy; no unproved equality of FS and round metric normalizations is imported.

Apply the ACTUAL early Hopf homotopy LES. For Omega S3 the independent n>=3 Riemannian lacunary CW argument gives a cell in each nonnegative even dimension and none in odd dimensions, so its integral homology is Z in even degrees and0 in odd degrees, and pi1(Omega S3)=0. Its CW model also has exactly one0-cell, hence is connected; the actual native zero-loop comparison then identifies pi1(S3) as trivial, without using the n2 result. Do not use the n=2 calculation here. The Hopf LES supplies the connecting homomorphism pi2(S2)→pi1(S1), computed by disc lifting; combine it with the native loop shift pi1(Omega S2)≃pi2(S2). No globally chosen continuous path-lifting function Omega S2→S1 is assumed. The adjoint of the normalized raw suspension homeomorphism Sigma S1→S2 gives a based continuous map s:S1→Omega S2. Compute the connecting homomorphism on its adjoint sphere by the explicit Hopf clutching function: its winding is±1 (pin the sign from the preceding charts), so the induced map on the pi1 groups is an isomorphism. This computation is the missing degree/winding step; it is not implied by numerical cell counts.

Multiply s with the loop of the Hopf projection to define S1×Omega S3→Omega S2. The Hopf LES and the native higher asphericity of S1 give isomorphisms in every higher homotopy group, while the winding calculation gives pi1 and connectedness gives pi0. The map is a weak equivalence on the actual CW-type/compact-generation models, so the independent DGF weak-equivalence homology comparison applies. Integral Kunneth has no Tor here because H*(S1;Z) and the already computed H*(Omega S3;Z) are free. It yields H_j(Omega S2;Z)=Z for every j>=0, not a general assertion that all fibration homologies split. Native circle winding/fundamental-group and the actual raw-suspension and product/Tor floors precede this step. Preserve n=1's separate integer winding components and n>=3's original lacunary proof, and retain all antipodal Bott, geometric suspension, and later James/EHP programmes independently.

Every map above has the specified basepoints, ordinary-loop/concatenation comparison and naturality to the owned path CW/H1 models. Its exact generic Hopf-bundle and CP1 chart inputs remain existing SB/CK/native owners; the R3 application adds the source n=2 homology argument, not another general projective-space or classifying-space theory. 

The n=2 construction consumes the preceding independent n>=3 lacunary branch and the circle winding/higher-asphericity interfaces. It does not consume an all-dimensional sphere-path homology theorem containing its own conclusion. Only after all three constructions are complete assemble the all-dimensional nonconjugate path result, with endpoint-change and cellular generators compared. R1 retains the separate metric-normalization comparison for its CP1 example; no Fubini–Study/round metric equality is a premise of this pointed topological Hopf bridge.

On the equator w=e^(i*theta), the displayed chart sections satisfy s_1=s_0*w^(-1). Compute the boundary winding using that transition together with the actual oriented disc-boundary convention in DGF's connecting map; record its sign against AT's interval-last suspension homeomorphism. If the chosen generator requires the opposite sign, apply the explicit inversion on S1 rather than suppressing the sign. The magnitude-one winding supplies the required pi1 isomorphism. Construct the ordinary-loop product map with the constant loop at every designated basepoint, and compare its induced product homomorphism with (x,y)↦s_*x+(Omega Hopf)_*y using the actual loop unit/reparametrization homotopies.

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
   **Ricci lower bounds and relative volume, after the radial and cut-locus constructions.**

   Let M be connected complete n-dimensional smooth Riemannian, n>=2, and Ric>=(n−1)κg. For model volume Vκ(r), prove Vol(B(p,r))/Vκ(r) is nonincreasing for positive radii before the positive-curvature model pole, with the usual constant-curvature model domain. In particular for κ=0 it is nonincreasing for all r>0 and at most one after normalizing by ω_n r^n. Supply annulus/restricted-polar versions, small-ball limit1, measure-zero cut locus, arbitrary center, density/metric pullback and scaling comparisons. State positive-curvature maximal radii explicitly. Do not substitute a sectional Rauch hypothesis for Ricci lower bounds.

   Proof programme: on the star domain before first cut, let J(t,θ) be the positive normal exponential Jacobian, A its shape/Riccati endomorphism and h=tr A. From the Jacobi equation derive h'+tr(A²)+Ric(γ',γ')=0, hence h'+h²/(n−1)+(n−1)κ<=0 by trace Cauchy–Schwarz. Use the actual small-t asymptotic J/t^(n−1)→1 to prove J/sκ^(n−1) nonincreasing. Set J=0 beyond the cut time; this adds only downward jumps. Prove measurability and the native density/polar change-of-variables on the cut-truncated domain. Integrate over the SAME angular unit sphere and then radially; the elementary ratio-of-integrals lemma yields the ball ratio. Prove the n=1 interval/circle cases separately; no vacuous Ricci plane condition gives Euclidean rigidity there.

   Construct the following equality API, also consumed by PositiveMass P2.3. Equality of the flat volume ratio on all positive radii forces equality of the radial densities a.e.; smoothness on the star domain upgrades it there. The Riccati inequality has equality, so A=(1/t)Id and the radial metric is Euclidean before cut. Prove absence of a finite cut obstruction from the equality of density and the actual cut/conjugate/loop alternative, and construct the complete local-isometry covering from the exponential model. Show any nontrivial covering identification strictly reduces the full ball volume, so equality yields a global Euclidean isometry. For equality only up to a radius, retain the actual normal-domain/radius hypotheses and ball conclusion; do not infer global flatness. PositiveMass P2.3 supplies its separate asymptotically Euclidean large-ball lower limit and combines it with this comparison and the small-ball limit; neither positive-mass theory nor a zero-mass hypothesis is an input to the present comparison.

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

   Let p:E→M be a surjective topological covering of connected finite-dimensional Hausdorff second-countable boundaryless smooth real manifolds, with E carrying the smooth atlas pulled back from M, so p is a local diffeomorphism. For a smooth positive Riemannian g on M, define g_E(v,w)=g(dp(v),dp(w)). In each covering chart dp is invertible; hence this is smooth and positive. Prove the projection is a local Riemannian isometry, lengths/energy and Levi–Civita connection/Jacobi/curvature tensors are preserved in each sheet, and local curvature/Ricci inequalities pull back with their exact constants and dimension.

   If M is complete, prove E is complete without assuming it. A base geodesic extends for every real time by Hopf–Rinow. Lift its restrictions on compact intervals from a given sheet point; covering uniqueness makes these lifts compatible on overlaps, and the native smooth-lift/local-isometry comparison makes the glued lift a geodesic with the chosen initial velocity. Thus E is geodesically complete. On each connected component the converse Hopf–Rinow gives completeness for the induced finite length metric. For connected E this is the required metric, with unchanged manifold topology. A disconnected cover is treated componentwise; no finite cross-component distance is installed.

   For the based-path universal cover, consume the actual installed TauCeti UniversalCover carrier/projection, local path-connected and semilocally simply-connected covering theorem, simple connectivity and path connectivity. The native covering theorem permits empty fibres outside the based component; connected manifolds are path connected, giving surjectivity here. Small coordinate balls provide the local hypotheses. Construct its smooth atlas by the actual native chartedSpaceComap/IsLocalDiffeomorph result, never an alternative total-space topology.

   The fibre over the basepoint is in bijection with endpoint-fixed based loop homotopy classes by the explicit UniversalCover endpoint/class structure; prove the maps and casts are inverse. Only a cardinal bijection is needed here; no convention-incorrect group isomorphism is asserted. The independently owned LieGroupoidsPoisson G0.0 countable-coordinate/overlap-components argument makes pi1 countable. Over a countable evenly covered basis, there are countably many sheets (each fibre is in bijection with the basepoint fibre by path lifting); their chart bases give second countability of the universal cover. Prove Hausdorffness using either distinct base neighborhoods or disjoint sheets over the same point. This establishes the actual standing manifold hypotheses before applying Riemannian results upstairs.

   Export the conditional conclusion: IF the connected universal-cover manifold constructed above is compact, its fibre is closed by continuity and T1 of the base, and discrete by the covering theorem; compactness of that closed fibre then implies finiteness. The fibre/loop-class bijection proves pi1 finite. The Myers CALLER supplies the compactness hypothesis only AFTER applying its sine-index diameter bound upstairs. The cover producer neither invokes Myers to construct/complete the cover nor assumes finite pi1; this separates the early construction from the caller conclusion. This argument does not use cover classification, K(G,1), higher homotopy or a finite-pi1 hypothesis in constructing the cover. Pullback metrics along cover morphisms and base isometries have the expected functoriality.

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
   **The round real-projective quotient, with low-dimensional and orientation branches.**

   For every n>=0 use the native unit sphere in EuclideanSpace R (Fin(n+1)) with its antipodal integer-unit action and the actual installed TauCeti.RealProjectiveSpace n orbit quotient. The native projection is continuous, surjective, a quotient covering map and has equality exactly x=y or x=-y; its compactness/path-connectedness/unique-zero-dimensional carrier are existing declarations. Construct its comparison with AT4.6's native Projectivization R (Fin(n+1)→R), after the WithLp linear homeomorphism. Send a unit vector to its one-dimensional span. Surjectivity chooses a nonzero vector on the line and normalizes it; if two unit vectors span the same line the real scalar has absolute value1, hence is±1. The induced quotient bijection is continuous, and compact-to-Hausdorff gives the homeomorphism. Pin representative, inverse, topology and basepoint equations. This comparison is an owned construction, not supplied by the mere generic quotient theorem.

   In the projective chart with coordinate i nonzero choose its unit representative with positive i-th coordinate. The affine ratio vector gives the explicit smooth section, with normalizing denominator sqrt(1+sum ratios²)>0. Compare it with the lifted smooth antipodal-cover atlas and AT's designated projective atlas by these coordinate maps; the identity is a diffeomorphism and no second projective manifold/topology is installed. The antipodal action is a smooth round isometry, free even on S0. The generic Riemannian quotient/pullback metric then descends the round metric, and in each local sheet sectional curvature equals1 for n>=2. In dimensions0/1 the sectional statement has no two-plane test and is vacuous; no positive Ricci Myers hypothesis is inferred there. Compactness is from the actual sphere quotient, before any classification of complete space forms.

   For n>=1 the connected sphere is oriented by outward-normal-first orientation. The antipodal map on ambient R^(n+1) has determinant (-1)^(n+1); its boundary-sphere degree is the same sign. Prove the normal/tangent orientation comparison, not determinant(-Id on a fixed abstract n-plane), which would give the wrong exponent. A quotient orientation pulls back to an invariant sphere orientation; conversely an invariant orientation descends in the covering charts. On connected S^n every orientation differs by one global sign, so an orientation-reversing deck transformation obstructs every descent. Thus RP^n is orientable exactly for odd n when n>=1. RP0 is a single point and is orientable separately. This is a concrete quotient/parity comparison, not a full Stiefel–Whitney or Killing–Hopf classification input.

   For n>=2 consume the ACTUAL native RealProjectiveSpace.fundamentalGroupMulEquivAt n hn x to integer units, with hn:2<=n, and transport by the preceding homeomorphism. The source's unqualified pi1=Z2 must keep that guard. RP1 is the circle with fundamental group Multiplicative Z via the native Line comparison (or the explicit double-angle circle quotient and native winding theorem); RP0 is the unique point with trivial pi1. Compare chosen lifts/monodromy and antipodal deck labels, with the opposite harmless only because the two-element deck group is commutative. Do not confuse Nat.card=0 in the n1 cardinality trichotomy with an empty fundamental group. All three dimension branches remain required.

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


### R4.9. Three simple closed geodesic images on a smooth two-sphere

For every smooth positive-definite Riemannian metric g on the standard smooth S², construct three distinct nonconstant embedded closed geodesic IMAGES. Identify all changes of parametrization and reversal, so neither a multiple traversal nor an orientation change gives another image. Allow degenerate closed geodesics and nonisolated geodesic families. Transport the theorem along an actual smooth diffeomorphism to an abstract smooth two-sphere. Construct the following curve-space, finite-family and relative-homology APIs before the multiplicity theorem.

Notation in this section is scoped. V is the curve-image/point space and A its point locus; V_space denotes the spacing balls. The width c, contact component c_contact, selected-side area A_side, annulus area A_ann, graph coefficient A_par and graph error E_diff have separate meanings. Use B_len for a length ceiling, a_cover for the component-cover class, a_cut for the positive clock cutoff, a_diff for diffusion, L_min for a positive length floor, K_gauss for Gaussian curvature, K_c for the critical image set and K_image for a compact parameter image. Q_disk is the Thom disk bundle, Q_graph the graph curvature expression and Q_low the low-length sublevel. The round ambient chord is D_ch; the arbitrary-metric sine comparison is psi_CA, its ratio is beta_CA and the family-clock cutoff is chi_clock. The endpoint labels are A_endpt,B_endpt; the normal-graph metric bounds G_min,v_max are positive numerical box constants, while g₀ is the round metric. Defect scale η_def, V-neighborhood radius η_V, spacing radius C_space, local epsilon allowances and their declared time windows are fixed in the clause using them.

#### R4.9.0. Rectifiable simple-curve space and length topology

Let V consist of rectifiable Jordan curve images and point-curves A={p:p∈S²}. Use the generic GMT length and arclength carriers. For Jordan parametrizations define the unoriented Fréchet distance d_F by the infimum of sup_t d_g(γ(t),η(h(t))) over circle homeomorphisms of either orientation, and extend it to constants by the corresponding constant maps. Put d_V(C,D)=d_F(C,D)+|L_g(C)−L_g(D)|. Prove independence of parametrization, triangle inequality and definiteness, including comparisons with compact-image Hausdorff distance. Identify A as a closed copy of S², prove length continuous, and construct the quotient-valued continuous constant-speed arclength representative on each positive-length band, with local representatives taken modulo rotations and reversal. Prove this from Fréchet matching, subarc lower semicontinuity and convergence of total lengths; image Hausdorff convergence alone is insufficient. At constants prove uniform diameter collapse. Use this definite metric for all later families and deformations; no completeness, manifold or CW-type assumption on V is required. For any Fréchet match by a circle homeomorphism h, approximate h uniformly by piecewise-linear circle homeomorphisms h_n of the same orientation; if η is Lipschitz, then η∘h_n is Lipschitz and its image differs from η∘h by at most Lip(η)·||h_n−h||∞. Use this approximation whenever a winding or index supplier is stated only for absolutely continuous/Lipschitz reparametrizations, with the positive distance from the tested point to the image preserved by choosing n large. Also prove the Riemannian metric-derivative identity: for every Lipschitz γ:I→(S²,d_g), md(γ,t)=|γ′(t)|_g for almost every t. In a smooth normal chart, compare d_g on a sufficiently small neighborhood with the frozen norm g_{γ(t)}; the distortion tends to1 as the neighborhood shrinks, and the metric derivative agrees with the norm of the chart derivative at Lebesgue points. Thus GMT’s metric variation equals ∫|γ′|_g for the Lipschitz parametrizations used below; the piecewise-smooth Hopf–Rinow length formula alone is not enough.

#### R4.9.1. The two-sheet component cover and point avoidance

For a nonconstant C decorate it by either complementary component of S²\C. Over a point p retain two formal tags (p,empty) and (p,full), with the point remembered. Construct an actual two-sheeted cover E→V with locally constant sheet permutations and cocycle laws. Near a Jordan curve choose test points on its opposite sides, use a smooth stereographic chart from one of them and a compact chart neighborhood, and apply the supplied planar Jordan/index/proximity theorems to parametrized Fréchet matches. Prove that nearby curves still separate the test points and that overlap labels agree or exchange continuously.

Near a constant use a small coordinate ball and a distant test point. Show that a sufficiently short curve in that ball has its small component in the coordinate convex hull; its other component contains the distant point. Extend these labels to the empty/full tags, with compatible transitions to nonconstant charts. Prove continuity of the empty section on A. Using trace area zero, winding stability of component indicators and dominated convergence, prove the component-area comparison and a uniform ε>0 for which each curve of length<ε has a unique component of area<Area_g(S²)/2. This gives a section of E over V^{<ε} extending the empty section on A, without requiring a contraction of the whole short-curve space.

For each p set V_p={C:p∉image(C)}, including constants q≠p. Prove it open and construct a continuous section on V_p by choosing the component not containing p, and empty at constants. Prove this in the cover charts, including the actual locally constant agree/exchange transition to the short-curve section on overlaps.

#### R4.9.2. Relative cover class and finite Thom detection

Construct the absolute singular mod2 class a_cover∈H¹(V;F₂) of this cover and the relative lift α∈H¹(V,A;F₂) fixed by the empty section. Construct these directly on singular cochains: choose lifts at vertices agreeing with empty on A, assign the endpoint discrepancy of lifted paths, and use lifting over singular triangles to prove the cocycle law. Prove independence by a relative coboundary, naturality and image(α)=a_cover. Compare with the associated real line on finite models, rather than apply a CW-type classification theorem to arbitrary V.

Let Q_disk=D(γ¹) over RP² be the finite tautological disk bundle `(v,t)~(−v,−t)`, v∈S², −1≤t≤1, with boundary S(γ¹)≃S². Define q:Q_disk→V by the round plane circle `{x:v·x=t}`, sending |t|=1 to the point t v. Prove Fréchet-plus-g-length continuity with local frames, including uniform length collapse at the boundary for arbitrary g. The selected side `{x:v·x>t}` gives empty at t=+1 and full at t=−1; its exchange identifies the pulled-back cover with the orientation cover of π*γ¹. The boundary EMPTY frame is t v. Prove q*a_cover=π*w₁(γ¹) and q*α=τ, the mod2 Thom class, by its fiber-interval value1 with those endpoint frames.

Use the ordinary finite RP²/cup/Thom theorem to prove image(τ)=π*w₁, τ²=π*w₁∪τ and τ³=π*w₁²∪τ, with the powers interpreted by the absolute-image cup action on the relative group. Prove ⟨π*w₁²∪τ,[Q_disk,∂Q_disk]⟩=1. Define z₃=q_*[Q_disk,∂Q_disk], z₂=a_cover∩z₃, z₁=a_cover²∩z₃ in H_i(V,A;F₂). Use the ABSOLUTE cup/relative cap module action and prove ⟨α,z₁⟩=1. Thus all three classes are nonzero and subordinate. The finite model supplies the calculation; no homotopy equivalence V≃RP³ or parametric Schoenflies theorem is a premise.

#### R4.9.3. Positive widths and finite parameter carriers

Define c_i as the infimum over finite relative singular-cycle representatives of z_i of the maximum length on their compact support. The explicit finite model gives c₃<∞. Construct support-preserving subdivision and cap representatives to prove c₁≤c₂≤c₃. The short-curve section trivializes α relatively to A on V^{<ε}; its nonzero pairing with z₁ gives c₁≥ε>0.

Construct a finite cycle-to-polyhedron-pair adapter for the chosen three minimax cycles, of dimension≤3: realize the finite singular-cycle face identifications as a finite polyhedral pair, triangulate it compatibly with the relative faces mapping into A, and construct its evaluation map to V. From this chosen carrier derive the matching singular-simplex maps, relative chain representatives and subdivision/chain homotopies on the existing AT singular carrier. Prove that these maps represent the original relative class and preserve the dimension bound; use this same finite polyhedral carrier for the parameter embedding and shortening. Only these finite parameter carriers need a polyhedral model; do not assume V has finite CW type or identify arbitrary singular cycles with an unspecified cube-family notation.

#### R4.9.4. Approximate geodesics with equality of limiting length

Fix 0<η_def<inj_g(S²)/4 using R4.6. For C of positive length, let D_{η_def}(C) be the supremum of arcLength−d_g(endpoints) over connected subarcs of arclength≤min(η_def,L(C)/2), using its constant-speed representative. Prove nonnegativity and continuity in d_V on positive bounded-length bands. Defect zero means every sufficiently short arc minimizes distance.

If 0<L_min≤L(C_j)≤B_len, L(C_j)→c and D_{η_def}(C_j)→0, prove uniform subsequential convergence of constant-speed representatives modulo rotation/reversal. For short parameter intervals the limiting endpoint distance equals c times interval length. Deduce a nonconstant constant-speed locally minimizing geodesic, smooth by the geodesic ODE at every point including the periodic seam, with length EXACTLY c. Lower semicontinuity alone does not prove that equality. The compactness conclusion applies to this specified small-defect class.

#### R4.9.5. Simplicity, primitive traversal and critical-set localization

Exclude transverse crossings of the limiting geodesic by a planar alternating-endpoint/Jordan stability lemma for two disjoint parameter arcs of the embedded approximants. At tangential returns use ODE uniqueness: equal velocities give a shorter period; opposite velocities imply a reversal symmetry forcing zero velocity at its midpoint. Thus a limit without transverse crossings traverses a primitive embedded closed geodesic k times.

Construct a smooth normal annulus around the primitive image by its unit normal, the exponential/Fermi map, local inverse-function theorem and compact embeddedness. Uniform PARAMETRIZED convergence gives a homotopy of annular projections of degree±k. The generic Jordan winding theorem in a smooth planar annulus gives degree0 or±1 for an embedded curve there. Hence k=1. The homotopy of parametrized annular projections supplies the degree comparison.

For c>0 let K_c be the simple unoriented geodesic images of length c. Prove K_c compact in V using compact initial unit-tangent data, ODE dependence and the preceding no-crossing/no-iterate limit theorem; allow infinite or positive-dimensional K_c. For every open U⊃K_c prove that curves in a sufficiently small length strip about c with sufficiently small D_{η_def} lie in U. Derive this by contradiction from approximate-geodesic compactness, including the case K_c=∅.

#### R4.9.6. Uniform embedded-preserving finite-family shortening

Fix a finite ceiling B_len>c>0 and an open U containing K_c. Construct 0<σ<c and δ>0 with c+2δ<B_len, depending only on g,B_len,c,U, independently of the parameter space. For every continuous u:(P,P₀)→(V,A), with P any compact finite polyhedron and max L_g(u)≤c+δ, construct a homotopy H relative to P₀, through Jordan images or points, whose endpoint u′ satisfies

`u′(P) ⊂ V^{<c−σ} ∪ U`,  `max_(P×[0,1]) L_g(H) ≤ c+2δ < B_len`.

Fix every input point-curve throughout, including those outside P₀. The constants σ,δ are uniform over the families; regularization mesh, parameter subdivision and flow times may depend on the particular compact family. Construct the restriction and cubical face-identification laws below for this intrinsic family construction, together with comparison laws for its compatible choices. Intermediate curves lie below the declared ceiling and their endpoints lie in the low union U. The ordered analytic construction below preserves embedded images and point inputs.

##### R4.9.6a. Length-controlled parametric regularization

Choose the standard round metric g₀ as an auxiliary regularization device. Prove that the topology d_F+|ΔL| on Jordan images and points is independent of the smooth positive-definite metric on compact S². Use separate type synonyms S²_g and S²_(g₀), each carrying its own Riemannian distance, with the identity smooth diffeomorphism and its bi-Lipschitz metric comparison. Define the induced image/point bijection V_g→V_(g₀) and prove it and its inverse continuous. On positive-length bands work in the uniform quotient of constant-speed representatives by rotations and reversal. For each convergent sequence choose matched representatives with uniformly bounded Lipschitz constants, then use weak derivative convergence and convergence of arclength energy to obtain strong derivative convergence in a fixed smooth embedding; this proves convergence of length for the other metric. At points use uniform metric norm equivalence and length tending to zero. Construct the corresponding transport under a smooth diffeomorphism of compact surfaces, with variation and reparametrization laws. These are concrete curve-carrier/homeomorphism interfaces for the two-metric regularization.

Construct the shared periodic, interior and conditional blowup theorems in6b first, then their round applications here. Before any round area evolution or annulus nonfattening application, own the following signed boundary curvature–area construction on the actual unit-round-sphere carrier with metric g₀, its fixed orientation and canonical Riemannian area.

For a selected smooth Jordan disk D, orient ∂D with D on the left. Let n_D be its inward unit conormal in the sphere and let k_D be the signed geodesic curvature defined by ∇_T T=k_D n_D for the unit-speed positive boundary tangent. Construct the boundary arclength integral and its comparison with DG's oriented line integral, and prove
`∫_(∂D) k_D ds_(g₀) + Area_(g₀)(D) = 2π`.
This is a theorem for either selected side, with its own induced orientation and normal; it does not designate a smaller side. For a smooth annular domain Ann use the two induced boundary orientations, inward conormals into Ann, and prove
`∫_(∂Ann) k_Ann ds_(g₀) + Area_(g₀)(Ann) = 0`.
Give the restriction, orientation-reversal, disk-difference and parameter-dependent integral laws needed for these actual domains.

Build the signed turning input here: an oriented smooth embedded planar Jordan curve bounding a disk on its left has tangent-map degree+1 and signed Euclidean total curvature2π. Construct the tangent-angle lift on intervals, its degree/turning-integral identity, and the Jordan orientation comparison giving degree+1; unsigned Fenchel is a different theorem. For a selected spherical disk choose a stereographic pole in the opposite open component, transport it to a compact planar smooth Jordan disk, and use R1's stereographic metric and conformal connection comparisons. For g₀=e^(2u)(dx²+dy²), prove the signed boundary identity `k_(g₀) ds_(g₀)=(k_e+∂_(n_out)u)ds_e` and curvature identity `K_(g₀)dA_(g₀)=−Δu dxdy`. DG's Green/Stokes theorem and the signed turning theorem then give the disk formula because K_(g₀)=1. Derive the annulus formula by subtracting the two nested disk formulas and reversing the inner boundary. Own these geometric/line-integral/volume comparisons here; generic Stokes alone does not assert them.

For a smooth moving Jordan disk establish the signed moving-boundary formula `A_side′=−∫k_D ds` with the same curvature/normal convention. Combine it with the owned disk identity to obtain `A_side′=A_side−2π`, and construct its continuous finite-endpoint area trace. For two nested evolving smooth boundaries prove the corresponding variation formula with both induced annulus orientations on their common lifetime; the annulus identity gives `A_ann′=A_ann`, hence `A_ann(t)=exp(t−s)A_ann(s)` before either boundary loses smooth existence. Retain the nesting and endpoint-trace hypotheses when taking approximation limits. These focused round disk/annulus theorems supply the applications in this section; no general Gauss–Bonnet–Chern theorem is a prerequisite. The arbitrary-metric finite-time alternative and the disk area equation give finite extinction exactly when A_side(0)≠2π; area bisection excludes finite collapse.

Construct the round circular-singularity theorem by a small-length closed-curve distance comparison. For an embedded round flow extinct at (p,T), enter once L≤L_*<2π. The spherical distance of a pair is at most its shorter arc l≤L/2<π, so antipodal pairs are excluded and m≠0. Use the exact ambient chord `D_ch=|X(y)−X(x)|` in ℝ³ and `ψ(L,l)=(L/π)sin(πl/L)`, where l is the shorter arclength. Prove that a positive constant `0<β≤1` with D_ch≥βψ initially retains this inequality for all later times before T; equivalently the minimum D_ch/ψ is nondecreasing. Include the continuous diagonal value1, the two half-arc branches at l=L/2 and a strict ε first-contact barrier. The exact ambient equation is `X_t=κ_e+X`; the measure/subarc equations are `L′=−∫|κ_e|²ds+L` and `l′=−∫_arc|κ_e|²ds+l`. Homogeneity `Lψ_L+lψ_l=ψ` cancels the pure homothety contribution in D_ch/ψ. At contact set θ=πl/L, `w=(Y−X)/D_ch`, `m=(X+Y)/2` and `c_contact=β cosθ`. The sphere and first-variation identities give `T_x·w=T_y·w=c_contact`, `T_x·m=Dc/2`, `T_y·m=−Dc/2` and `c²≤|m|²`. Resolve the remaining tangent components in the line orthogonal to span(X,Y). For equal residual signs the (+,+) second variation gives `D_t≥D_ch(1−c²/|m|²)≥0`, while ψ_t≤0. For opposite residual signs the (+,−) variation gives `D_t≥D_ch−4βπ²ψ/L²`. Own the ambient-ℝ³ closed Fenchel inequality `∫|κ_e|ds≥2π` and the endpoint-tangent turning bound on the selected arc, followed by Cauchy–Schwarz: `∫_arc|κ_e|²ds≥4(acos c_contact)²/l≥4π²l/L²` and `∫|κ_e|²ds≥4π²/L`. Hence the corresponding geodesic-curvature energies are at least `(4π²/L²−1)l` and `(4π²/L²−1)L`. Since ψ_L,ψ_l≥0 on θ∈[0,π/2], `−ψ_t≥(4π²/L²−1)ψ`, making `(D_ch−βψ)_t≥0` in the opposite-sign case too. Construct the finite-dimensional first/second-variation, turning and Fenchel lemmas with their regular-closed/arc hypotheses, then apply the strict barrier argument. This exact spherical calculation yields the scale-independent bound `D_ch≥(2β/π)l` while L→0.

Construct two distinct isoperimetric outputs. For the extinction application, once the selected shrinking side lies in a fixed small normal ball, compare its metric area and boundary length with their Euclidean chart values and consume [Isoperimetry I3/I6](../Isoperimetry/README.md#i6--full-planar-jordan-theorem-and-compatibility). This proves a uniform weak estimate `L²≥c_iso A_side` for small selected-side area. The side inside that chart is identified by Jordan separation and A_side→0. Retain the sharp spherical theorem `L²≥A_side(4π−A_side)` for every rectifiable round Jordan image as a separate utility. Consume [GeometricMeasureTheory G3–G5](../GeometricMeasureTheory/README.md#g3--distributional-bv-and-variation-measures) for derivative measures, BV compactness and perimeter lower semicontinuity in Euclidean charts. Construct the smooth-chart/pullback and partition-of-unity comparisons for spherical finite-perimeter sets here. Build spherical two-point polarization of finite-perimeter sets, prove area preservation and perimeter nonincrease, and use BV compactness and a sequence of polarizations toward a fixed pole to obtain a spherical cap of the same area. Transfer the perimeter comparison to rectifiable Jordan boundaries and compute the cap area/length. Use complements for areas above2π. This spherical symmetrization and its limit/normalization are owned here; the planar supplier supplies the local weak estimate.

Use the closed comparison to exclude Type II at round extinction. The selected shrinking side satisfies `A_side(t)=2π(1−exp(t−T))`; the local weak estimate gives `L(t)²≥c_len(T−t)` on a terminal interval. Hamilton selection with `λ_i²(T−t_i)→∞` then has λ_iL(t_i)→∞. Prove the round application of the conditional mass and tangent theorems in6b: the closed comparison gives linear local mass, proper arclength exhaustion and multiplicity-one pointed limits; the periodic total-curvature identity on the finite physical interval gives the finite sign-loss budget. The shared eternal-selection and disjoint-window theorem yields a proper noncompact strictly convex eternal planar limit. Its attained-maximum Harnack equality and translator classification give a grim reaper, contradicting the scale-independent closed comparison. Thus `sup_(t<T)(T−t)||k||∞²<∞`. The positive-length-floor closed application in6b supplies the separate arbitrary-metric nonpoint exclusion.

For round Type I at the fixed extinction centre p prove `d_g₀(X(q,t),p)≤∫_t^T||k||∞ds≤2C_I sqrt(T−t)` for every material point. After scaling by `(2(T−t))^(−1/2)` the whole image stays in a fixed ball. The area equation gives rescaled selected-side area→π; combine it with the weak isoperimetric lower bound, the round local-mass estimate and the shared smooth tangent compactness theorem to prevent an empty or zero-size limit. Localized monotonicity selects a nonempty compact embedded planar shrinker, so a line is excluded. Classify that shrinker as a circle. With p,T and a normal-graph/tangential gauge fixed, prove full smooth precompactness; every subsequential limit is the same centred unit-circle image, hence the whole rescaled family converges in C∞ as unoriented embedded images. Retain normalized-flow stability and tangent uniqueness as additional utilities: compute the circle linearization and stable subspace after centre/time/gauge modulation, establish a coercive estimate and nonlinear/spherical-metric remainder bounds at every required finite Sobolev order, and prove graph persistence and convergence. These utilities use the same explicit normalization and are distinct from compactness plus classification.

Construct full great-circle convergence for immortal round flows by nonlinear area-bisecting Morse–Bott modulation. The area equation and the immortal primitive annular limits give L→2π and every curvature derivative→0. On a late latitude graph u over an accumulation great circle use the exact area constraint `∫sin u ds=0`. Prove by the implicit-function theorem that it determines the unstable constant mode from the remaining small graph; use the two rotational parameters to impose zero first harmonics. The linearized operator is `∂s²+1`; the remaining modes have eigenvalues≤−3. Establish the quasilinear coercive energy estimate, persistence on the chosen graph slice and decay at all finite orders. Derive the rotation equation and prove its velocity is integrable, giving one limiting great circle. Include the already geodesic case. Construct this nonlinear slice/constraint and the estimates, rather than infer them from the linear spectrum alone.

Retain the Gage threshold and polar/intersection outputs as separate utilities. From L→2π and curvature decay derive `∫sqrt(1+k_g²)ds<3π` on a late tail. Prove the fixed-great-circle intersection theorem from periodic scalar zero number and uniqueness. For each curve C_t, let S_t be the closure in RP² of the unoriented poles whose great circles meet C_t in at least four distinct points (a coincident great circle has infinitely many intersection points). Prove nesting first for the unclosed pole sets by the fixed-great-circle zero-number theorem, and hence for their closures. Construct the tangent polar curve with length∫|k_g|→0. Prove the rotation-to-tangency/convex-hull estimate and the closing lemma placing every accumulation pole in the actual closed set S_t, including the geodesic and tangency degeneracies. The area constraint in that closing lemma is ∫sin u=0; its proof must account for this nonlinear constraint when great circles are written as `tan u=a cos s+b sin s`. Prove the closing and pole-diameter estimates for these closed sets, including poles approaching a tangency, and deduce great-circle uniqueness. These are full geometric construction targets independent of the main modulation proof.

Construct the raw round avoidance track for nested smooth disk exhaustions of both components of a Jordan image. Before any smooth-boundary conclusion, define the closed track as the intersection of the evolved closed annuli, prove the weak-set avoidance law, maximality, exhaustion independence and restriction in time. Prove common survival for approximants of one fixed nondegenerate Jordan image using two fixed closed round balls strictly in its complementary components: their shrinking circle barriers live for `−log cos a_+` and `−log cos a_-`, and avoidance plus the finite-time point-collapse alternative excludes earlier collapse. This lifetime uses the two balls alone.

Own the conditional one-sided smooth-boundary theorem. For a nested exhaustion by smooth Jordan disk flows on a common positive interval, with uniform positive-time length ceilings, two-sided noncollapse from surviving complementary balls and the actual avoidance/nesting laws, construct a smooth single embedded boundary for the limit of each side on every smaller positive interval. Use dissipation to choose an intermediate curvature-energy slice, constant-speed H² compactness and the local parabolic graph estimates. Prove the needed limit-boundary regularity: rule out multiplicity and tangential self-contact using the one-sided nesting, strong avoidance, local embedded sheet/degree comparisons and the boundary-of-domain topology, then propagate the intermediate smooth graph to the requested time. An integral energy bound supplies an intermediate slice; the parabolic argument supplies the later estimates. Construct these boundary/degree statements on the actual limit domains. This conditional theorem has the uniform length ceiling as input, with the finite-length and general-Jordan applications obtaining it by their separate constructions.

After smooth one-sided boundaries have been constructed, prove the conditional annulus nonfattening theorem. For the nested approximating annuli, apply the signed annulus boundary identity and moving-boundary variation constructed above on the common smooth lifetime to get `A_ann′=A_ann` and `A_ann(t)=exp(t)A_ann(0)`. Retain the actual inner/outer orientations and initial-area trace in this formula. If their initial areas tend to0, their areas at a fixed common surviving positive time tend to0. Avoidance, the smooth-boundary limits and annular degree then identify the two boundaries as one smooth Jordan image and identify the raw track with that image. Prove uniqueness among smooth positive-time boundary flows having the declared trace. This conditional theorem takes actual smooth boundary and nesting inputs and is independent of the source of the length ceilings.

For every finite-length Jordan image γ construct smooth nested inside/outside conformal approximants with boundary lengths converging to L_g₀(γ), using the Poisson/BV theorem below. The two fixed complementary balls give common survival. Monotonicity gives the uniform length ceiling directly from these initial lengths, and dissipation supplies the intermediate good slice for the conditional one-sided smooth-boundary theorem. Apply conditional annulus nonfattening only after those boundaries exist. This produces the finite-length positive-time round engine without spacing, foliation length estimates or a Dirichlet wedge premise.

Construct the positive Poisson/BV adapter on actual continuous finite-variation boundary traces. Consume [ConformalMapping L3/L5](../ConformalMapping/README.md) for the holomorphic disc map, its continuous injective closed-disc extension and Cauchy floor, and [GeometricMeasureTheory G1](../GeometricMeasureTheory/README.md#g1--rectifiable-curves-and-arclength) for arclength factorization. In a stereographic chart away from a pole in the other component write `z=Z∘ell`, with ell the continuous cumulative Euclidean variation and Z a unit-speed Lipschitz representative. Prove the derivative-measure substitution `Dz=(Z′∘ell)Dell`, `ell_*Dell=ds` and `|Dz|=Dell`, with generalized-inverse handling of constant pieces. Deduce `∫||dDz/d|Dz|||_(g(z))d|Dz|=∫||Z′||_(g(Z))ds=L_g(z)` from the Lipschitz metric-derivative identity. Derive the positive Poisson representation from Cauchy and harmonic uniqueness, with `P_r(θ)=(1−r²)/(1−2r cosθ+r²)` of average1. Finite-measure Fubini gives `D(P_r*z)=P_r*Dz`. Positivity and convexity give the norm bound; split near and far angular pairs and use uniform metric continuity and the vanishing Poisson tail to prove the weighted length limsup. Uniform convergence and lower semicontinuity give equality. Apply the theorem to radial maps for both complementary domains, retaining trace, orientation and nesting laws.

Prove the finite-length engine’s own initial Fréchet and exact-length trace. Use fixed nested Schoenflies annuli around γ and smooth inner/outer barriers to trap each positive-time image for small time. Prove degree one in each annulus by the actual Jordan/avoidance and parametrized annulus laws. Constant-speed representatives have a uniform Lipschitz ceiling; every uniform subsequential limit has image γ, degree one and length≤L_g₀(γ). Use γ’s arclength homeomorphism and variation to show that any genuine backtracking would add positive length, so the limit is a monotone one-traversal parametrization. This proves unoriented Fréchet convergence; metric lower semicontinuity gives the exact length trace. Construct the required topological annuli and degree homotopies, including the absence of a nearest-point map for a rough γ.

For every Jordan image γ of spherical area zero, including nonrectifiable images, construct its maximal smooth round curve-shortening flow for positive time with unparametrized uniform/Fréchet trace γ as t↓0, unique up to reparametrization. Prove it persists for all time exactly when γ bisects the sphere's area, and otherwise becomes extinct in finite time. Use nested smooth disk exhaustions of both complementary components. A `(C,θ)`-spacing is a finite set of points y_i whose closed radius-C balls and antipodal balls miss γ, such that for every test point x two well-defined great circles through x and selected y_i have angle greater than π/2−θ. Prove existence for each Jordan curve and stability under sufficiently close Jordan approximation. For 0<r<π/2 let M_(r,g)(γ) count the components of γ∩B_(2r)(g) meeting the closed r-neighbourhood of g, and M_r be its supremum over great circles. Prove finiteness and uniform approximation bounds with buffered scales. For 0<α≪1, choose a spacing centre y and let `V_space=B_C(y)∪B_C(−y)`, disjoint from γ. For a test point x choose a great circle g through x,y and 2r<αC. Write C_space=C for the actual spacing radius above, so `V_space=B_(C_space)(y)∪B_(C_space)(−y)` is disjoint from γ. Pin 0<C_space<π/2, y∈g and 0<α<1/10. Set `C_graph=C_space/2`, `C_core=C_graph/2` and choose a gluing radius `C_glue` strictly between C_graph and C_space, for example 3C_space/4. The spacing input remains C_space; the smaller radii specify where initial graphs, their gluing and evolved estimates are imposed.

Use the normal strip coordinates `F(s,u)=cos(u)g(s)+sin(u)n`, with oriented circle parameter s, fixed unit normal n to its plane and projection π_g(F(s,u))=g(s). For a radius a define `I_a=(B_a(y)∪B_a(−y))∩g`. Choose r>0 with `4r<α C_graph` and let `R_evol=2(1+α)r<π/2`. Require the strict margins `cos(R_evol)cos(C_glue)>cos(C_space)` and `cos(R_evol)cos(C_core)>cos(C_graph)`. In particular `cos(2r)cos(C_graph)>cos(C_space)`. Define the initial graph window `U_graph=π_g⁻¹(I_(C_graph))∩B_(2r)(g)` and the larger gluing window using I_(C_glue) at that height.

A leafable curve is a smooth embedded closed curve ℓ⊂B_(2r)(g) such that `π_g:ℓ∩U_graph→I_(C_graph)` is a diffeomorphism. Thus every point of each full prescribed graph arc has exactly one point of the normal graph, with no additional components in U_graph. Require tangent angle≤α/2 to the latitude direction on this initial graph. Coverage is part of the definition, not an angle test on whatever spatial-ball intersection happens to exist. No slope condition is imposed outside this graph window.

Construct the domain comparisons explicitly. For s measured from y, `cos d(F(s,u),y)=cos(u)cos(s)`, and likewise at −y. Prove that the WHOLE initial graph and gluing cylinders lie in the actual γ-free spacing balls V_space, using the strict margins above; their closed subwindows have compact separation from γ. The spatial-ball restriction of a nonzero latitude projects onto a shorter arc, so that restriction is not required to surject onto the larger spacing arc. Nonzero latitudes are valid initial leaves. Prove also `V_space∩B_R(g)⊂π_g⁻¹(I_(C_space))∩B_R(g)` for the heights used, and `π_g⁻¹(I_(C_core))∩B_(R_evol)(g)⊂B_(C_graph)(y)∪B_(C_graph)(−y)`. These identify the actual smaller domains in the two-ball barriers and positive-time estimates.

Prove from full two-arc coverage, embeddedness and Jordan separation in the complementary strip rectangles that the annular projection has degree±1. Construct initial leafable foliations in this same class, allowing outer leaves in B_(2r)(g)\B_r(g). Perform every imposed graph normalization and its smooth gluing inside the γ-free spacing windows; leave the required freedom outside those windows for the intersection-count construction. Prove that this yields at most `2M_(r,g)(γ)` intersections per leaf, at the original multiplicity scale r. A local low-slope modification is not imposed in a region that may contain γ; the γ-free support is part of this proof.

Construct the buffered straightening and common-lifetime theorem with those actual windows. For a straightening construction requiring initial containment B_(r_st)(g), set `r_st=2r`, use `4r<α C_graph` and the declared time/spacing margins, and prove the comparison of its graph hypotheses. Do not infer containment in B_r from B_(2r). The auxiliary straightening scale does not change the original multiplicity scale or counted intersections. Prove persistence of graph and angle estimates only on the specified smaller core arcs I_(C_core) and their buffered cylinders/spatial balls for the declared time interval; unchanged full initial-arc coverage at positive time is not a premise or conclusion. Prove that the evolved family covers the required B_r(g) region, preserves degree and intersection bounds, and reaches the stated global straightening angle. Retain the coefficient and time-window hypotheses for the transverse-foliation grid. Derive constants for each original C_space by the explicit substitutions C_graph=C_space/2 and r_st=2r, so the original uniform spacing-family statement is retained. Use the constructions of [Lauer §4 and §8](https://arxiv.org/html/1601.05704#S4) with these coordinate-domain, free-support and radius comparisons. Apply the scalar parabolic Harnack theorem of6b to the positive linearized leaf separation, with the actual coefficient and time-window bounds from the straightening charts.

Construct the barrier-arc families used in straightening. For each fixed spacing/angle reserve and sufficiently small strip radius r, build smooth embedded convex U-turn arcs with the seven barrier properties: fixed endpoints near the spacing centre; confinement in the narrow strip and chosen wedge; a controlled tip near the antipodal ball; two graph arms; one intersection with each prescribed pencil great circle; a fixed tip-angle reserve; and nonnegative geodesic curvature. Use short geodesic arm pieces and a convex rounded tip in the actual spherical charts, smooth the joins with quantitative angle/strip margins, and keep straight endpoint pieces so all initial curvature jets vanish. Prove this construction with continuous choices and uniform constants. For their Dirichlet evolution derive k≥0 from `k_t=k_ss+k³+k`, k=0 at the endpoints, and prove the boundary-safe single-intersection laws by the homogeneous-Dirichlet/local intersection theorem. Establish the angle monotonicity and retain a subarc whose tangent angle relative to the strip frame runs from π/4 to3π/4 while remaining in that interval until the tip enters the target ball. In `g₀=dr²+cos²r ds²`, `|theta_ell−k_g|≤C r` and `dr/dell=sin theta`; that subarc has length≤C_1 r and turning≥π/4 for small r. Hence `∫k_g²ds≥c_turn/r`, so a uniform initial length ceiling gives straightening time `T_st(r)≤C_st r`. Prove the angle window and its preservation as geometric outputs of this family, not extra hypotheses on arbitrary input curves. Construct the moving barriers and their intersection comparison with each leaf, and conclude the stated straightening angle and grid estimates.

For each spacing radius C_space and sufficiently small θ construct T_space(C_space,θ)>0; for 0<t<T_space choose buffered multiplicity scale r(C_space,θ,t) and C_len(C_space,θ,t)<∞ so every smooth embedded curve with that spacing satisfies `L(γ_t)≤C_len M_r(γ)` whenever its flow exists. This is a spacing-only length theorem. For approximants of one fixed Jordan image use the independent two-ball common lifetime, and then evaluate this length theorem at times below both lifetimes. The straightening/multiplicity length construction supplies the general-Jordan ceiling and is independent of the finite-length ceiling above.

For arbitrary area-zero Jordan images, use the spacing/multiplicity theorem to supply positive-time length bounds, then apply the conditional one-sided boundary and annulus nonfattening theorems. Construct the general initial Fréchet trace by the evolved finite crosscut/foliation grid and its arcwise separation laws, retaining arbitrary nonrectifiable initial images. This trace construction is separate from the finite-length no-backtracking proof. Prove uniqueness up to reparametrization and the area-bisection maximal-lifetime criterion, and apply the round circular/immortal outputs to its positive-time slices.

For Jordan data converging at a common surviving positive time prove joint length convergence by the final-limsup subsequence and Fatou curvature-energy argument. At a suitable intermediate time use bounded liminf curvature energy and a positive lower length bound for arclength H² compactness and C¹ convergence. Identify the support and exact traversal by the annular degree-one theorem, then use positive-time graph dependence. The general area-zero flow and the finite-length exact trace are distinct outputs with their own hypotheses.

Construct the fixed-endpoint Dirichlet application for the leaf barriers. Choose a closed spherical lune Ω bounded by two distinct great-circle barriers, endpoints A_endpt,B_endpt on the respective boundaries away from the vertices, and a smooth embedded initial arc with interior in int Ω and all initial endpoint curvature jets zero. The endpoints used in the leaf construction lie in a common strictly convex neighborhood, so their short joining segment has length<π. Instantiate the interval parabolic inverse and quasilinear theorem of6b, in moving graph charts with zero endpoint data and actual corner compatibility. Fixed endpoints give k=0 and, for constant curvature, k_ss=0 at positive time; derive the higher even-jet compatibility identities and boundary estimates while treating odd jets as unknowns. Construct parameter dependence, avoidance, wedge containment and curvature-bounded continuation on these domains.

Derive endpoint localization from this initial wedge/embedded-arc data. Start with a small endpoint neighborhood meeting only its initial end branch, which exists by compact embeddedness. Construct a quantitative geodesic-foliation/barrier system there, with lateral boundary comparisons and interval intersection counts, and prove that its evolution keeps the whole curve’s intersection with a smaller neighborhood on one controlled endpoint graph. Prove uniform slope, curvature and compatible higher boundary bounds. In particular, for each fixed positive intrinsic separation a prove a positive δ_a, uniform in time, such that `d(A_endpt,F(q,t))≥δ_a` whenever the subarc from A_endpt has length≥a; prove the analogous B_endpt statement. The graph estimate controls the remaining shorter subarc. Construct the no-remote-return assertion through the foliation’s boundary-safe avoidance and one-sheet intersection laws; derive all constants from the given initial arc, wedge and endpoint geometry. This endpoint-localization theorem is an owned geometric construction, rather than an additional condition imposed on the input.

Prove the spherical pair-domain comparison with that endpoint theorem. For 0<d<π and parallel signed normal endpoint components α_n,β_n the short-geodesic index form is `Hess d=((α_n²+β_n²)cos d−2α_nβ_n)/sin d`; derive it from the sine Jacobi field. At an interior minimum of distance/subarc-length choose the endpoint variation sign making β_n=α_n, obtaining the favorable curvature-vector difference≥`2α_n²tan(d/2)`. At a fixed-endpoint edge the second variation instead gives the possibly negative `−cot(d)β_n²`; use the proved endpoint graph ratio and δ_a/L_max for the remote subarc. Include diagonal limits and compact initial-time bounds. Strict interior containment and nonvertex endpoints exclude the lune’s only possible antipodal pair, so d<π at all contacts. This gives a positive ratio for the whole parameter-pair domain with uniform constants.

Apply the shared conditional blowup package to the Dirichlet flow. Its distance/subarc ratio gives linear local mass and proper arclength limits, and the boundary estimates keep high-curvature selections away from the endpoints. Prove the homogeneous-Dirichlet total-curvature identity `V′=−2Σ_interior|k_s|−|k_s(A_endpt)|−|k_s(B_endpt)|+∫K_gauss|k|ds` in the distributional sense; on a finite physical singular-time interval it gives a finite sign-loss budget. These inputs supply interval Type-I/II selection and exclusion, hence existence for all time. For infinite time use L≥d(A_endpt,B_endpt)>0 and dissipation. With K_gauss=1, boundary compatibility gives `E₀′=−2E₁+∫k⁴+2E₀` and `E₁′=−2E₂+∫(7k²+2)k_s²`; the boundary terms vanish by k=0 and k_ss=0. Prove the higher boundary energy/trace ladder and decay. Limits are geodesic segments inside Ω; show the long great-circle arc exits the lune, identify its unique joining segment there, and use the positive Dirichlet Jacobi gap `(π/d(A_endpt,B_endpt))²−1` plus nonlinear remainder control to obtain integrable late motion and full smooth convergence.

Use the shared periodic normal-graph parabolic theorem in R4.9.6b for the round metric. For an oriented smooth Jordan curve let A(t) be the area of its selected component. Gauss–Bonnet and A′=−∫k_g ds give `A′=A−2π` on the unit sphere. Establish the area convention and its continuous finite-endpoint trace. The arbitrary-metric finite-time alternative below then gives extinction in finite time exactly when A(0)≠2π; A(0)=2π excludes finite collapse.

For comparison estimates, fix an actual smooth reference flow and express the nearby flow as a normal graph `u(s,t)` over it in one fixed tubular strip and gauge on a common short-time interval. The zero graph is the reference solution; in the graph-difference equation write the lower-order residual as `b(s,t,u,u_s)` with `b(s,t,0,0)=0`. Require the principal coefficient `a≥a₀>0`, uniformly bounded coefficient jets on a fixed compact coefficient box, and common initial H² and C¹ reserves placing the graph inside that box. Put `Y_m(t)=||u(·,t)||_{H^m(S¹)}²` for m≥2. Then prove `Y₂′+a₀||u_sss||²₂≤C(1+Y₂³)`, `||u_t||₂≤C`, and `||u(t)−u(0)||C¹≤C t^{1/8}` on the common short-time interval.

Obtain an integrable coefficient `A_par(t)=1+||u_ss||²∞` for this same reference-flow graph. Prove the differentiated composition/commutator bounds and `Y_m′+a₀Y_(m+1)≤C_m A_par(t)(1+Y_m)`; time averaging on successive interior intervals supplies all positive-time derivatives from the stated initial H²/C¹ reserve. For convergence to the reference, define `E_diff(t)=||u(·,t)||²_{L²(S¹)}` and prove `E_diff′+a₀||u_s||²₂≤C A_par(t)E_diff`, then use interpolation and finite graph restarts. These are local comparison estimates for the selected reference-flow chart and do not restrict the separate common-survival theorem’s arbitrary smooth input flows. Construct these a priori estimates in actual parabolic function spaces and obtain dependence for the common-surviving finite-length engine.

For every compact finite-polyhedron family u and every ε>0, choose a continuous positive small round time on its nonpoint parameter locus, tending to0 at point parameters and below the survival bound. Joint continuity in V and positive-time smooth dependence give an embedded/point homotopy fixed at every input point, with `L_g(H(p,t))≤L_g(u(p))+ε`, and positive-length endpoints continuous in C∞ away from point parameters. The round auxiliary homotopy has the stated upper g-length allowance. For the intrinsic cubical construction below, choose the time cap on the compact curve image so identified input curves receive the same time.

##### R4.9.6b. Shared parabolic and conditional blowup theory; arbitrary-metric applications

Construct one shared periodic normal-graph theorem for every fixed smooth surface metric and use its round specialization in6a. On the compact graph coefficient box, `u_t=a(s,t,u,u_s)u_ss+b(s,t,u,u_s)` on ℝ/ℤ has a≥a₀>0. Establish short-time existence, energy estimates, compactness and restart while the graph/box persist; prove uniqueness by the L² difference estimate, smooth dependence by differentiated equations, and positive-time smoothing. Reparametrize to obtain geometric uniqueness, embeddedness/avoidance, L′=−∫k²ds, derivative bounds and curvature-bounded continuation.

Construct the linear Dirichlet parabolic inverse independently on a compact interval I=[0,l_I]. Fix 0<alpha_par<1, positive ellipticity a≥a_0 and bounds for a,b,c in the required parabolic Hölder spaces. For `v_t−a v_xx−b v_x−c v=f`, construct a unique solution in `C^(2+alpha_par,1+alpha_par/2)` for f in `C^(alpha_par,alpha_par/2)`, initial data in C^(2+alpha_par), boundary data in C^(1+alpha_par/2), and the actual corner equalities. These include equality of initial/boundary values and equality of the boundary time derivative with a v_0,xx+b v_0,x+c v_0+f at each corner; impose the corresponding differentiated identities at higher finite orders. Prove the inverse estimate with its ellipticity, coefficient, interval and time bounds by the frozen Dirichlet heat inverse, localization/reflection, Schauder estimates and continuity/patching. Use the small-time coefficient reserve for a quasilinear contraction, then construct uniqueness, smooth parameter dependence, positive-time regularity and continuation while the graph/ellipticity and boundary coefficient bounds persist. This is the interval floor used by the spherical fixed-endpoint application, distinct from the periodic construction.

Construct the general periodic linear zero-number theorem for `w_t=a w_xx+b w_x+c w`: on each compact time strip the coefficients are smooth and bounded with the finite derivatives used by the proof, and a≥a₀>0. Either the solution is identically zero, or at every positive interior time its spatial zero set is finite, its zero number is nonincreasing, and a multiple zero gives a strict drop across that time. Prove uniqueness and the identical-zero branch separately. Linearizing the graph difference gives the intersection corollary, with coincident geometric curves handled by uniqueness. In a fixed periodic parametrization of a smooth flow, the curvature equation is a linear equation of this form for w=k, with a=|∂xX|^(−2), the actual reparametrization drift, and c=k²+K_gauss; all coefficients have the stated bounds on compact smooth time strips. This gives the curvature-zero corollary used in BII. Construct separately the local interval theorem on boxes with nonzero lateral values, and the homogeneous-Dirichlet theorem on a fixed compact interval: for a nonzero solution with zero endpoint values the number of interior sign changes is finite at positive interior times, nonincreasing, and drops at interior multiple zeros and the corresponding boundary degeneracies. Prove its boundary classification and separate identical-zero alternative. Apply these domain-specific versions to graph differences and curvature with their actual lateral or endpoint conditions.

Construct the local interior graph/curvature compactness adapter. On a parabolic box with positive separation from its parabolic boundary, a uniform curvature bound and smooth bounded ambient metric jets give small moving graphical patches with controlled height/slope. Derive these patches by the arclength turning bound and a controlled normal/time reparametrization. Apply cutoff energy and parabolic interior estimates on nested boxes, tracking the coefficient jets and cutoff losses. If |k|≤K/r on the outer box, prove bounds `|D_s^j ∂t^q k|≤C_(j,q) r^(−1−j−2q)` on its fixed smaller box, with constants depending on K, box margins and the corresponding rescaled ambient jets. These estimates require no lateral boundary values and supply local smooth pointed subsequence compactness with the separately stated local mass/sheet bounds. They feed point-picking, BI selection and tangent passage.

Construct scalar parabolic Harnack on nested interior cylinders for nonnegative solutions of the linear equation above, with uniform ellipticity and explicit bounded coefficient/geometry/time-gap hypotheses: the supremum on the earlier cylinder is bounded by a finite constant times the infimum on the later cylinder. Include the bounded-potential normalization and the identical-zero case. Its application to positive leaf separation uses actual graph-linearization and straightening estimates. Periodic, local-interior and Dirichlet boundary estimates retain their separate domains and boundary hypotheses.

Give the conditional blowup package one owner here. Type I means `sup_(t<T)(T−t)||k||infinity²<infinity`; Type II is its unbounded complement on a finite singular interval. Its inputs are actual smooth embedded curve flows on interior parabolic domains, uniformly bounded rescaled ambient metric jets, a declared linear local-mass bound `Length(C_t∩B_R(y))≤Lambda R`, controlled local sheets/injectivity and graphical reparametrizations, the parabolic-box derivative estimates above, and the precise monotonicity/error or point-selection hypotheses below. For interval applications require that the outer boxes/cutoffs miss the fixed endpoints, with scaled endpoint distance tending to infinity in a tangent sequence. Under smooth pointed convergence and the mass bound prove the Gaussian tail estimate by dyadic annuli `C Lambda Σ_(j≥0)(2^j R) exp(−c_tail 4^j R²)` and passage of full centered Gaussian ratios. Construct center-uniform local regularity, fixed-center nonflat selection, eternal selection and finite-loss convexity once on these inputs. Closed positive-length, round extinction and interval flows establish their separate application inputs; the conditional package does not require a closed curve or a positive limiting length.

Prove separately the arbitrary-metric maximal-time alternative: for finite maximal time, length and diameter tend to zero and the image converges to one point; for infinite time, subsequences converge smoothly to primitive embedded positive-length closed geodesics. The point limit identifies the finite-time alternative, while the family clock below stops at a positive cutoff length. The round finite-collapse conclusion consumes the finite-time output and Gauss–Bonnet area ODE; circular-singularity asymptotics and great-circle convergence remain separate outputs. The maximal-time alternative follows from the separate global arguments below.

For the arbitrary-metric closed application consume R3’s compact-set uniform normal/strong-convexity radius and smooth two-endpoint short-segment/logarithm theorem, themselves using SBC B6.0, and R4.6’s injectivity consequence. Choose a uniform convex-normal radius r_J within those domains, with the segment and endpoint derivatives smooth on the resulting pair domain including its diagonal. Define `C_J≥0` by the endpoint Jacobi distance-Hessian bound: for `0<d=d_g(x,y)<r_J`, endpoint vectors `V∈T_xS²`, `W∈T_yS²`, and parallel transport `P:T_xS²→T_yS²` along the minimizing geodesic, prove `|Hess d_g((V,W),(V,W))−d^(−1)||(PV−W)^⊥||²|≤C_J d (||V||²+||W||²)`, where the perpendicular projection is to its terminal unit tangent. Construct a uniform `C_J` from the Jacobi index form and compact metric bounds. Assuming `L(t)≥ℓ>0` on a finite interval, derive from this estimate the surface chord–arc inequality

For `psi_CA(L,l)=(L/pi)sin(pi l/L)`, prove the near-pair comparison `d_g(x,y)≥N_CA^(−1) exp(−K_time t) psi_CA(L(t),l(x,y))` when d_g(x,y)<r_J and `0≤l≤L(t)/2`. Include the initial continuous diagonal ratio, the half-arc branches and the two endpoint-normal signs in the Jacobi-Hessian first-contact argument. For the complementary pairs use d_g(x,y)≥r_J and L(t)≤L(0). Choose N_CA from the actual initial near-pair distortion and far-pair ceiling; take `K_time>4C_J+4pi²/L_min²`. Since sin theta≥2theta/pi on [0,pi/2], conclude

`d_g(x,y)≥beta_CA l(x,y)`, `beta_CA=2exp(−K_time T)/(pi N_CA)>0`.

Prove the application mass estimate explicitly. Fixing one point of C_t∩B_R, all other points there have shorter intrinsic distance≤2R/beta_CA from it, so total ball length≤4R/beta_CA. Normal-coordinate comparison gives a rescaled mass constant, for example Lambda≥8/beta_CA on sufficiently small declared charts. The round closed comparison supplies the analogous constant from its own fixed beta_arc, and the interval distance/subarc comparison gives≤4R/theta_D. Uniform-family use requires a common positive ratio and the same metric/box margins. Use those bounds for the shared tail and compactness theorem. Proper noncompact arclength limits additionally use the actual domain exhaustion and chord–arc injectivity; derivative estimates alone do not imply them.

For the shared localized monotonicity and center-uniform regularity theorem, fix a normal radius r_J and choose `2r_0<r_J`. Let the smooth radial cutoff chi_y equal1 on B_(r_0)(y), have range[0,1], and be supported in B_(2r_0)(y); in an interval application this support lies away from its endpoints. With q=d_g(y,z)²/2 and tau=T−t set `rho=(4pi tau)^(−1/2)exp(−q/(2tau))`. For 0<tau≤r_0² define `Theta_chi(y,T;tau)=∫_(C_(T−tau))chi_y(z)(4pi tau)^(−1/2)exp(−d_g(y,z)²/(4tau))ds`, using the same localized ratio notation Θ_χ below. Establish the material-time identity

`(∂tρ−k²ρ)+∂ssρ = −ρ|kN+(∇q)^⊥/(2τ)|² + ρ(1−Hess q(T,T))/(2τ)`.

Use the material-time convention for `∂tρ` in the material-time identity. Multiplying that identity by χ and integrating gives the exact cutoff formula

`d/dt ∫χρ ds = −∫χρ|kN+(∇q)^⊥/(2τ)|² ds + E_g(t)+E_χ(t)`,

where `E_g(t)=∫χρ(1−Hess q(T,T))/(2τ) ds` and `E_χ(t)=∫((D_sχ)(D_sρ)+ρ k D_Nχ)ds`. Thus the cutoff error is supported where χ varies; on this convex ball `1−Hess q(T,T)=O_g(d_g(y,·)²)` for its declared centre y. Construct the following conditional center-uniform epsilon-regularity criterion. For fixed `g`, outer cutoff profile, cylinder shape and local-mass bound `Λ`, require the flow and its local-mass estimate on every ball meeting each fixed support `supp(χ_y)` throughout the full integration interval `[s−r²,s]`; these hypotheses apply even when the support extends outside the smaller conclusion cylinder. Prove that there are `ε_*>0`, `r₁∈(0,r₀]` and `C,C_j` such that for every radius `0<r≤r₁`, any smooth flow on the scale-r cylinder satisfying, for every center `(y,s)` in the smaller cylinder and every admissible terminal time, the fixed-scale ratio bound `Θ_{χ_y}(y,s;r²)<1+ε_*/2`, the integrated error bound `∫_(s−r²)^s (|E_g|+|E_χ|)dt≤ε_*/2`, and the local mass estimate `Length(C_t∩B_R(y))≤ΛR` on the rescaled balls used in point-picking, obeys `sup_(Q_(r/2))|k|≤C/r` and `sup_(Q_(r/4))|D_s^j k|≤C_j/r^(j+1)`. Derive the criterion by contradiction: if no positive `ε_*` works, take a sequence with ratio and error excess tending to zero and unbounded normalized curvature. Point-pick and rescale; use the interior parabolic-box derivative theorem on strictly smaller boxes and the common Λ local mass/sheet bound to construct smooth pointed compactness. Pass the center-uniform Gaussian bounds to the limit at every admissible center and scale. For the resulting smooth normalized limit, the density is at least one at a point on a smooth embedded curve; the upper bounds force density exactly one at every center lying on the limit flow and every admissible backward scale. Equality in the Euclidean monotonicity identity makes the limit a static line, contradicting the unit-curvature point. This contradiction establishes a positive ε_* uniform in the declared small scales and cylinder data. The constants are uniform over flows satisfying the same `Λ` and the stated cylinder/error bounds. The cutoff `χ_y` is the same outer radial profile centered at `y`; the theorem fixes r₁, the cylinder-inclusion ratios, error allowance and constants uniformly for all 0<r≤r₁. The chosen r is then free to shrink in the singular-centre application. The neighborhood conclusion has the declared center-uniform hypotheses. To derive the fixed-center density gap at a singular point, argue by contradiction: if `limsup_(τ↓0) Θ_χ(x_*,T;τ)<1+ε_*/4`, choose one sufficiently small fixed `r>0` for which the ratio at `(x_*,T;r²)` is below `1+ε_*/4` and the full-interval cutoff/ambient error budget is below `ε_*/4`. The defining integral is over the smooth time `T−r²`, so at this fixed positive scale it varies continuously with center and terminal time. Prove the corresponding full-interval error bound also persists in a neighborhood of `(x_*,T)`; shrink that neighborhood so the same fixed-scale ratios stay below `1+ε_*/2` and the errors stay below `ε_*/2`. Monotonicity then propagates the ratio bound from `r²` to all smaller scales for those nearby centers. Applying the center-uniform criterion gives curvature bounded near `(x_*,T)`, contradicting singularity. Thus prove `limsup_(τ↓0) Θ_χ(x_*,T;τ)≥1+ε_s` for a positive `ε_s` determined by the error margin. Construct the fixed-scale continuity lemma, persistence of the full-interval error bound, monotonicity propagation and this density-gap application. The constants and cutoff/error allowances are part of these owned theorems, not implicit in their names. For tangent passage use the shared local-mass/Gaussian-tail theorem. For each fixed rescaled scale R, local smooth convergence and cutoff/ambient error estimates give convergence of the centered ratios; the tail estimate then permits passage to the full Gaussian ratio. This fixed-center continuity and monotonicity argument excludes a flat tangent. Blow up at that fixed center and scale; prove smooth pointed compactness on parabolic balls and convergence to the shrinker equation, using the material-time identity and cutoff formula stated above.

Construct the shared Type-II point-picking and eternal-selection theorem on a finite physical singular interval [0,T). Assume unbounded normalized curvature, uniform rescaled local mass/sheets and ambient jets, the interior derivative theorem, and actual expanding arclength domains; in the boundary case supply endpoint exclusion. Choose Hamilton points (x_i,t_i), lambda_i=|k(x_i,t_i)|→infinity with `lambda_i²(T−t_i)→infinity`, and prove the curvature bounds and spacetime domain exhaustion used for pointed compactness. Obtain a complete eternal embedded planar limit with |k|≤1 and |k|(0,0)=1. Prove properness and noncompactness when the application supplies the uniform chord–arc and arclength-exhaustion bounds.

For the shared finite-loss convexity theorem suppose each approximating flow has a nonnegative curvature sign-loss measure mu_loss of finite total mass on [0,T), with the distributional inequality `dV≤C_amb V dt−dmu_loss`, V uniformly bounded there, and mu_loss dominating `2Σ_interior|k_s|dt` at simple sign-changing zeros. Assume the actual periodic or interval zero theorem and smooth interior convergence. If the eternal limit changes sign, choose a compact interval and time subwindow carrying a persistent simple zero with |k_s| bounded below. Rescaling preserves its integrated loss. Select pairwise disjoint physical windows of duration O(lambda_i^(−2))=o(T−t_i) converging to T; each has a fixed positive mu_loss mass, contradicting finiteness. The ambient term vanishes after rescaling. Therefore the nonflat eternal limit is one-signed, and the strong maximum principle makes it strictly convex. Construct the attained-spacetime-maximum differential Harnack equality and the classification of complete convex translators, giving the grim reaper in the noncompact case. Finite loss is required only on the finite physical singular interval; no infinite-immortal-time budget is inferred from V′≤C_amb V.

Prove the closed periodic application of that budget directly. For `V(t)=∫|k|ds`, curvature evolution and `ds_t=−k²ds` yield in the distributional/zero-number sense

`dV/dt=−2 Σ_(z simple sign-changing zero of k)|D_s k(z)| + ∫K_gauss |k|ds`.

The cubic terms cancel and each transverse zero contributes the jump of sgn k. The periodic multiple-zero theorem gives the integrated identity through exceptional times. On finite [0,T), `V(t)≤exp(||K_gauss||infinity T)V(0)`, so the integrated interior sign loss is finite. In the Dirichlet application the separately derived endpoint terms are additional nonnegative losses; the same conditional theorem then applies. Derive these budgets before invoking the shared convexity conclusion.

For the closed arbitrary-metric positive-length application, the Jacobi comparison gives local mass, arclength exhaustion and proper noncompact tangents. Instantiate the shared fixed-center Type-I theorem and eternal Type-II theorem with those inputs. A nonflat planar shrinker `k+a<X,N>=0`, a>0, has first integral `k exp(−a|X|²/2)`; bounded curvature then bounds its image, contradicting proper noncompactness. The grim reaper contradicts the same chord–arc bound. Thus finite maximal time forces L→0. Use the compact-set strong-convexity and short-segment theorem to obtain nested convex-ball confinement and one limiting point.

For an immortal flow first exclude limiting length0 by the supplied uniform small strongly convex ball and its smooth pair-geodesic distance barriers and the maximum principle. Put `E_j=∫|D_s^j k|² ds`. Prove `E₀→0`, its time integrability and `||k||∞→0` using

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

Patch charts using a global current test map `Φ(C)=(2^(−j)∫_C α_j)_(j≥1)`. Choose smooth one-forms `α_j` whose real linear span is dense and normalize each so `||α_j||_{C¹}≤1` and the comass `||dα_j||_∞≤1`; rescaling each nonzero form preserves density of the span. Use uniform C¹ bounds and quotient by overall sign for unoriented images. On the compact controlled Lipschitz graph closure, prove continuity of Φ in the C⁰ graph topology by strip Stokes and injectivity up to orientation. Equip unoriented images with the quotient metric `d_{±}([v],[w])=min(‖v−w‖_{ℓ²},‖v+w‖_{ℓ²})`; for an image C and nonempty K_c set `r_Φ(C)=dist_{d_{±}}([Φ(C)],[Φ(K_c)])`. For every η>0 choose b_η,r_η>0 such that every controlled graph with `|L_g(C)−c|≤b_η` and `r_Φ(C)<r_η` satisfies `dist_V(C,K_c)<η`. To prove this joint modulus, argue by contradiction: a violating sequence with length tolerance tending to zero and current distance tending to zero has a C⁰-convergent subsequence in the compact controlled graph closure; compactness of K_c and continuity of Φ identify its limit with a member of K_c, modulo orientation, by injectivity of the dense current tests. Thus its Fréchet distance and length difference both tend to zero, contradicting the fixed V-distance. Choose η small enough for the signed-height C⁰ chart-reset threshold as well as the desired V-neighborhood. This argument applies only on the controlled graph closure; it asserts no global inverse-continuity on V. When K_c is empty, use the separate empty-critical-set branch in R4.9.6d rather than defining r_Φ. For a smooth variation with velocity `kN` (up to tangential reparametrization), Cartan’s formula and Stokes give `d/dt ∫_{C(t)}α_j=∫_{C(t)}dα_j(kN,T)ds`; hence its absolute value is at most `||dα_j||_∞∫|k|ds`. Cauchy–Schwarz and `Σ_(j≥1)4^(−j)=1/3` give `||Φ̇||≤C_B||k||₂`, `C_B=√(B_len/3)`, whenever length≤B_len. For controlled smooth graphs in the fixed graph union with `|L_g−c|≤b₁` and `r_Φ≥r₀/2`, prove `||k||₂≥m>0`: the graph ODE gives H² control for small curvature, hence a C¹ geodesic limit in K_c and a contradiction. Crossing a width r₀/2 annulus costs at least `e=m r₀/(2C_B)` of g-length. In a single fixed graph chart put `G_min=inf_box G>0` and `v_max=sup_box sqrt(G²+p²)<∞`. From u_t=v k/G and ds_curve=v ds_base obtain `||u_t||_(L²(ds_base))≤(sqrt(v_max)/G_min)||k||_(L²(ds_curve))`. Define `C_graph=sqrt(v_max)/G_min`; crossing an actual L²(ds_base) annulus of widthρ/2 costs `mρ/(2C_graph)`.

##### R4.9.6d. Family stopping and localization

After the final-neighbourhood construction in6c, prove a global curvature gap outside that final C¹-open N_s on a strip `|L−c|≤b_gap`: `∫k² ds≥μ>0`. If embedded curves with lengths tending to c had curvature energy tending to zero, their constant-speed parametrizations would have a uniform H² bound; use covariant acceleration and the fixed smooth sphere embedding to pass to a C¹ geodesic limit. The crossing/annular arguments identify a primitive embedded geodesic of length c, and the low-order definition puts the approximating curves in N_s, a contradiction. This supplies the declared strip and curvature-energy lower bound μ. For K_c empty, the same contradiction gives a gap on the whole strip with N_s empty.

When K_c is nonempty, choose σ,δ,ε>0 with `ε<δ/4`, `max(σ,δ+ε)<min(b_gap,b_exit)`, `σ+δ+ε<e` and `c+2δ<B_len`. Thus the entire interval traversed above the low target lies inside both the curvature-gap and exit bands. For empty K_c choose the ceiling and gap-strip reserves without invoking an entry annulus or exit cost e. Choose `0<a_cut<a_cut+η_cut<c−σ` and a smooth nondecreasing chi_clock with chi_clock=0 on lengths≤a_cut and chi_clock=1 on lengths≥a_cut+η_cut. Given the ordinary smooth flow S_t(C), solve

`dt_C/dτ=chi_clock(L_g(S_(t_C)(C)))`, `t_C(0)=0`, and set `S̃_τ(C)=S_(t_C(τ))(C)`.

Prove completeness for every finite artificial time. Since 0≤chi_clock≤1, physical time cannot escape to infinity in finite τ. Approaching a finite maximal physical time would force length to zero by6b; the scalar clock becomes stationary at positive cutoff length before that singularity. Local smooth-flow and scalar ODE dependence give finite-time smooth-family continuity; the smooth flat cutoff has no corner at L=a_cut. The positive cutoff makes every finite artificial time well-defined.

Put `Q_low={L<c−σ}`, `B_entry=N_s∪Q_low` and `A_end=U∪Q_low`. While a trajectory is outside N_s and above the low target, the clock has speed1 and length decreases at rate at least μ, so it reaches the OPEN set B_entry in finite artificial time. A trajectory entering Q_low stays there. After entry into N_s, any exit from U while still above c−σ would cost e, exceeding the available length reserve σ+δ+ε; it therefore reaches Q_low first. This proves post-entry confinement from B_entry into A_end. The post-entry conclusion applies to trajectories entering N_s. For empty K_c take B_entry=A_end=Q_low and use only the gap and monotone length.

For a compact smooth-topology family, choose at each parameter a finite time whose image lies in the open B_entry. Continuity gives an open parameter neighborhood landing in B_entry at that SAME time. A finite subcover and the maximum of these artificial times are valid: all parameters have entered B_entry and stay in A_end thereafter. More generally, for a locally finite partition of unity on the compact parameter image, suppose every chart active at C supplies an entry time τ_i(C) for this same starting curve and same flow, with entry into B_entry. The minimum τ_min among the finitely many active times is an actual entry; post-entry confinement keeps the trajectory in A_end for all later times. Thus any convex weighted time τ(C)=Σ_i φ_i(C)τ_i(C)≥τ_min is safe. It need not exceed every active chart's entry time. Continuity still requires the stated locally finite cover, continuous local times and common flow domain. Construct the cap on the compact parameter image by the finite/local selection below. The resulting common-time homotopy is continuous and nonincreasing in g-length.

For a V-continuous family first apply6a with allowance ε, obtaining F⁺ continuous in V globally and in C∞ away from its original point locus. The compact subset `P_high={p:L_g(F⁺(p))≥c−σ}` is disjoint from that locus and carries the preceding finite-cover construction; all remaining endpoints are already in Q_low and stay there. Near any point parameter, actual V-continuity of F⁺ fixing that point gives `L_g(F⁺(p))<a_cut`, so the clock is stationary there. This point-neighborhood argument uses the actual vanishing length at the point locus. Concatenate regularization and this slowed g-flow. It fixes all input points and stays below `c+δ+ε<c+2δ`, with endpoint in A_end. One clock and time chosen for a family restrict to its faces;6e constructs the exact cubical descent and compatible-choice comparisons from those intrinsic data.

##### R4.9.6e. Intrinsic relative cubical construction and restriction laws

Choose the regularization cap on the compact image K_image=u(P) in V. On K_image outside the point locus use the local common-survival and g-length allowance neighborhoods to construct a continuous positive cap b(C), shrinking it to zero as C approaches A; set b=0 on K_image∩A. This is a continuous selection from actual admissible intervals [0,b_local(C)], constructed by a locally finite partition on the metrizable positive-length locus. Halve a cap to leave a reserve. The regularization `S_round(C,s b(C)/2)` therefore depends on the input image C itself. Prove its continuity, all-point fixation and the same length bound. For positive-time smooth dependence at nonpoints consume the actual common-survival normal-graph parameter-dependence theorem in6a. Use one cap on the union of the compact images of all faces in the chosen finite family, rather than independently selecting incompatible face times.

Suppose a finite cubical or simplicial parameter presentation has actual face-identification maps and its input u is equal on the identified faces. The equality may arise from reversal of contour parametrization; V already identifies that reversal. The intrinsic cap gives equal regularized curves on those faces, and the same length cutoff chi_clock and common artificial time give equal subsequent curves. Prove the equality at every homotopy time and descend the entire construction through the finite parameter quotient. Point-valued faces and every other originally point-valued parameter are fixed throughout. Construct the induced relative singular-chain prism and subdivision maps and prove their boundary formulas on the supplied AT singular carrier. This is a reusable relative-family output. The width-realization argument consumes the finite-chain adapter and AT prism/subdivision identity; it does not require every reusable cover/choice API below.

On the pullback cover u*E, lift the homotopy starting from its tautological initial side: construct `H̃:u*E×I→E` over H, with H̃((p,e),0)=e. This does not choose a global side section on P. Prove existence and uniqueness by local cover charts and finite parameter-prism subdivision, with the empty/full data fixed on point parameters. Uniqueness gives deck-exchange equivariance and all face/restriction laws, including orientation-reversing presentation identifications. This exports the pulled-back side data and relative-cover compatibility for later consumers; it is not an extra premise of the cap localization argument. No CW-type hypothesis on V is used.

For two admissible intrinsic caps on the same compact image, their convex interpolation stays positive off A and vanishes on A. It remains below the pointwise maximum of the two safe caps, whose whole interval is admissible. Apply regularization and the finite-cover clock construction to this joint compact comparison family. Choose one common artificial endpoint time at least as large as the two previously selected times and all joint-family entry times. At either end enlarge the old clock time to the common time; post-entry confinement keeps those endpoints in the low union. The middle comparison uses the same common time. This constructs an actual comparison of the shortening choices, with the original point locus fixed, the same length ceiling and localized endpoints. The same method on any required finite product of parameter cells supplies compatible finite higher comparisons. The estimates in6a and6d use compact parameter families, so these comparison products do not require a dimension-dependent geometric cell bound. Restriction of jointly chosen data is the declared face law.

Construct the finite parameter geometry API independently for the selected dimension≤3 cycle carriers: embed each triangulated carrier into R⁷ by moment-curve vertices and prove simplex intersections and relative-face identifications. For finite parameter cutoffs consume native Besicovitch's finite-dimensional theorem, whose conclusion is disjoint closed-ball color families and an open-ball cover; construct the finite extraction, shrunk cover and supported cutoffs. These finite-dimensional embedding and covering results are additional reusable outputs alongside the shortening and cap-localization theorem. The main localization proof chooses σ,δ from geometric entry/exit reserves; family mesh and the number of cells may vary.


#### R4.9.7. Cap localization, realization and three images

Prove the singular-chain localization lemma using the shortening theorem and the R4.9.3 finite relative-chain adapter, which realizes finite relative representatives with their polyhedral face identifications. Consume AlgebraicTopology’s singular small-chain theorem and subdivision chain homotopy, together with its cap-product boundary identity and relative-chain prism formula. Apply these identities to the shortened representative to show it still represents z_(i+1); use the finite-chain adapter and relative prism identity in the realization. If c_i=c_(i+1)=c and `a_cover|U=0` for an open U⊃K_c, deform a finite representative of z_(i+1) below c+δ. Subdivide subordinate to V^{<c−σ}∪U. Choose a cohomologous absolute cocycle for a_cover vanishing on U by extending its coboundary correction. Its cap kills U-supported pieces and gives a representative of z_i below c−σ. Prove the actual relative-boundary, cap and homotopy identities, contradicting the width. The acting class is absolute and the homology target remains relative to A.

If adjacent widths agree, K_c meets every point p, since otherwise U=V_p and the avoidance section would give a_cover|U=0. Consequently K_c contains infinitely many images globally: finitely many rectifiable images have area zero and cannot cover S². This gives at least one geodesic through each point, not an infinite family through each point. If K_(c_i) were empty, apply the shortening with U=∅ to lower its nonzero minimax class; hence every width is realized. Three distinct widths give three different images by length. An equal adjacent pair gives infinitely many images and therefore at least three. These alternatives prove the arbitrary-smooth-metric theorem, including geodesic degeneracies, with all reparametrizations and reversal already identified.

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

### R7.0. Scalar Bochner identity and the first positive eigenvalue

For a smooth real function f on a smooth finite-dimensional Riemannian manifold with Levi-Civita connection, prove in the positive-Laplacian convention
`Delta^+ |df|^2 + 2|Hess f|^2 + 2 Ric(grad f,grad f) = 2 <df,d Delta^+ f>`.
The statement is local and needs no compactness, Hodge theorem, cohomology or Spin structure. Derive it in a normal frame from the product/metric connection rule, symmetry of Hess f and curvature commutation of its third derivatives; compare its sign with `Delta^+=−div grad` and the native curvature convention. Prove frame/coordinate and isometry/pullback invariance. Give the finite-regularity version only with the actual derivative regularity needed for every term. On a closed connected manifold of real dimension n>=2 integrate using DG Green to obtain the Hessian/Ricci identity and, for Ric>=(n−1)k g with k>0, combine trace Cauchy-Schwarz and the actual eigen-equation with the energy identity to prove lambda1>=nk. Equality forces Hess f=−k f g for a mean-zero first eigenfunction; [Yamabe Y9](../Yamabe/README.md#y9-existence-uniqueness-and-rigidity) supplies the separate complete Obata radial-rigidity theorem. Boundary/noncompact versions retain the actual boundary or compact-support terms. This refines the scalar consequence of R7's Weitzenbock calculus without consuming its later harmonic-form vanishing theorem.

The local identity includes dimensions0 and1. The positive first-eigenvalue and equality statements require n>=2, a nonzero mean-zero eigenfunction, and the actual positive first eigenvalue supplied by the compact scalar spectral construction. In dimension1 the Ricci bound Ric>=(n−1)k g is vacuous and yields no bound depending on an arbitrary k: a circle of circumference L has first eigenvalue(2*pi/L)^2. A connected dimension0 manifold is a point and has no first positive scalar eigenspace. Boundary and noncompact statements keep the boundary or compact-support terms instead of applying the closed integral argument.

### R7.1–R7.8. Bundle identities and geometric consequences

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

### R8.1. Finite harmonic-polynomial construction

Let m>=1, n=m+1 and d>=0. On Euclidean R^n use its actual standard quadratic norm r^2=sum x_i^2 and ordinary Euclidean differential Laplacian sum partial_i^2; on the unit round S^m use the geometric nonnegative Laplacian Delta_S^+=-div grad. Use native homogeneous MvPolynomial carriers, their ordinary derivative/evaluation maps and the actual round metric from R4.7. All assertions below are finite polynomial/differential constructions; no analytic completeness or classification of every spherical eigenfunction is an input or an output.

The round polar metric away from0 is dr^2+r^2 g_S and its density is r^m dr dV_S. The coordinate divergence formula therefore gives Delta_R=partial_r^2+(m/r)partial_r-r^(-2)Delta_S^+. For p homogeneous of degree d and h=p restricted to the unit sphere, p(r theta)=r^d h(theta). Substitution yields Delta_R p=r^(d-2)[d(d+m-1)h-Delta_S^+h]. Hence a harmonic homogeneous p restricts to a smooth spherical eigenfunction with eigenvalue d(d+m-1). This is a one-way inclusion, not surjectivity onto the whole eigenspace. Its O(n)-equivariance follows from the norm and Euclidean Laplacian invariance and the action (g.p)(x)=p(g^(-1)x). Restriction is injective: if h=0, homogeneity gives p=0 away from0; continuity gives the origin too, and the real polynomial evaluation map is injective. For complex coefficients apply this to real and imaginary parts.

Write P_d for homogeneous degree-d polynomials, with P_e=0 for negative e, and H_d=ker(Delta_R:P_d->P_(d-2)). For harmonic homogeneous h_l, Euler's degree equation and the product rule give
Delta_R(r^(2k) h_l)=2k(2l+n+2k-2) r^(2k-2) h_l.
For k>=1 this coefficient is strictly positive because n>=2. Induct on d, starting d=0,1 where every homogeneous polynomial is harmonic. The inductive decomposition of P_(d-2) into the summands r^(2k) H_(d-2-2k) diagonalizes the map q->Delta_R(r^2 q): each summand is multiplied by the nonzero coefficient 2(k+1)(2(d-2-2k)+n+2k). It is therefore a linear isomorphism of P_(d-2). For p in P_d choose its unique q with Delta_R(r^2 q)=Delta_R p; then h=p-r^2q is harmonic. The same invertibility proves uniqueness, giving P_d=H_d directsum r^2 P_(d-2), and iterating gives the harmonic homogeneous decomposition.

The native monomial basis gives dim P_d=binomial(n+d-1,d). Thus dim H_d=binomial(m+d,d)-binomial(m+d-2,d-2), with the second term zero for d<2. This proves the dimension of the constructed harmonic-polynomial subspace and its injective spherical restriction. It does not identify every smooth/L2 eigenfunction, construct the global spectral Hilbert basis or prove highest-weight irreducibility. Those remain the separate full R8/CK spectrum/representation phases, with their actual mandatory suppliers.

The proof programme must transport the Euclidean derivative identities to the actual round native metric/volume and use the stated m,d/degree and coefficient conventions, including d=0,1 and m=1.

### R8.2. Spectral completeness and eigenspace identification

After the finite polynomial construction, consume K5a's compact scalar spectral decomposition to prove that restriction identifies the constructed harmonic degree-d space with the ENTIRE smooth and L2 eigenspace for lambda_d=d(d+m−1). Establish orthogonality, completeness and the comparison of the polynomial and Hilbert spectral bases, with the actual smooth-domain/elliptic-regularity interface. Retain the dimension formula binomial(m+d,d)−binomial(m+d−2,d−2), the second term zero for d<2; constants d=0 and the m=1 Fourier pair are explicit. These surjectivity and completeness outputs are later than the one-way finite polynomial calculation and are not inputs to it. Preserve O(m+1)-equivariance throughout.

### R8.3. Orthogonal highest weights and low ranks

Construct the harmonic-polynomial representation and compare its
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
R4.9 uses R4.6's short-geodesic/injectivity estimates, the geodesic ODE, the planar Jordan/arclength/winding theorems, and finite AT/CC constructions. Its topological order is the Fréchet-plus-length carrier and component cover, relative cocycle/finite Thom detection, positive widths, and finite parameter carriers. The shared periodic normal-graph theorem, general nonzero linear zero-number theorem, interior parabolic-box compactness and scalar Harnack feed their stated g₀/arbitrary-g applications; the fixed-endpoint construction separately uses the Dirichlet boundary theorem. The round closed small-length two-point comparison precedes its Type-II exclusion and circular Type-I/stability output. Final entry neighbourhoods consume the local exit constants before the global curvature-gap theorem. The round branch then constructs its finite-length Jordan smoothing/trace and weak-set avoidance outputs; its finite-collapse conclusion consumes the arbitrary-g finite-time alternative plus the Gauss–Bonnet area ODE, while circular-singularity asymptotics and great-circle convergence are separate outputs with the routes stated in R4.9.6a. The arbitrary-g branch separately proves the finite-time BI/BII exclusion, the immortal derivative estimate as a reusable output, compact primitive geodesic sets, and smooth local graph/exit estimates. The safe family clock, intrinsic restriction/cubical face-identification laws and compatible-choice comparisons feed uniform point-relative finite-family localization and cap/minimax realization. No minimax or three-geodesic conclusion is an input to either smooth-flow analysis. R4.8's distinct-endpoint path theorem and DGF's free-loop Morse/Bott machinery keep their separate scopes.
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
The speed metric in R3.1 gives the H1 topology but is not assumed complete; H1 charts are constructed independently. R3.3a's n>=3 lacunary proof and R3.3b's n=1 lifting proof precede R3.3c's Hopf homology calculation. Only their conjunction supplies the all-dimensional path result. R4.3 constructs the smooth universal-cover manifold, its second countability and complete pullback metric before R4.5 applies the sine-test bound upstairs; finite pi1 is a conclusion after compactness, not a hypothesis of that construction. R4.1's Ricci-volume comparison uses R4.6's cut-truncated polar/nullity interface, and its global equality conclusion has its own complete-cover/no-identification argument. R7.0's local scalar Bochner identity precedes Hodge/Spin/cohomology; its integrated Lichnerowicz/equality consequence requires n>=2. R8.1's finite harmonic-polynomial restriction, Fischer decomposition and dimension require no K5a spectral completeness or highest-weight classification; R8.2–R8.4 retain all those later actual suppliers. The round RP example in R4.7 consumes the actual antipodal quotient/projectivization atlas and native pi1 branches without a global space-form classification premise.

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
- I. A. Taimanov, [On the existence of three nonselfintersecting closed geodesics on manifolds homeomorphic to the 2-sphere](https://doi.org/10.1070/IM1993v040n03ABEH002177), Russian Acad. Sci. Izv. Math.40:3 (1993),565–590: simple-image multiplicity and shortening/minimax architecture. R4.9 specifies its own curve metric, relative finite model and uniform shortening maps.
- M. E. Gage, [Curve shortening on surfaces](https://www.numdam.org/item/ASENS_1990_4_23_2_229_0/), Ann. Sci. École Norm. Sup.23 (1990),229–256: surface evolution, continuation and long-time derivative estimates.
- B. Ma, [Curve shortening flow on Riemann surfaces with possible ambient conic singularities](https://arxiv.org/html/2007.00089v3), smooth-surface §§2–5: Jacobi distance comparison and localized singularity analysis. R4.9 constructs the explicit centered nonflat and eternal blowup milestones needed for its positive-length reduction.
- J. Lauer, [The evolution of Jordan curves on S² by curve shortening flow](https://arxiv.org/abs/1601.05704), round-sphere zero-area Jordan evolution and initial trace.
- M. A. Grayson, “Shortening embedded curves,” *Annals of Mathematics* 129 (1989), 71–111: finite-time/immortal curve-shortening alternatives and embedded-curve asymptotics; R4.9 states the precise consequences it uses as owned targets.
- S. Angenent, “The zero set of a solution of a parabolic equation,” *Journal für die reine und angewandte Mathematik* 390 (1988), 79–96: one-dimensional zero-number input for scalar parabolic differences.
- B. White, “A local regularity theorem for mean curvature flow,” *Annals of Mathematics* 161 (2005), 1487–1519: center-uniform Gaussian-density local regularity criterion; R4.9 owns its forced-curve specialization and cutoff/error hypotheses.
- P. T. Allen, A. Layne and K. Tsukahara, [The Dirichlet problem for curve shortening flow](https://arxiv.org/abs/1208.3510v2), arXiv:1208.3510v2 (2015): fixed-endpoint flow in convex constant-curvature domains; R4.9 states the actual wedge, boundary-flatness and nonconjugacy hypotheses it consumes.
- M. G. Dobbins, [Continuous dependence of curvature flow on initial conditions](https://arxiv.org/html/2106.08907v1), Lemma2.2 for pre-extinction Hausdorff dependence; R4.9 supplies its length and positive-time parabolic upgrades.

- D. Azagra, J. Ferrera, F. López-Mesas and Y. Rangel,
  [*Smooth approximation of Lipschitz functions on Riemannian manifolds*](https://arxiv.org/abs/math/0602051),
  for R7.8's quantitative smoothing and intrinsic-distance comparison.
- G. Toth and W. Ziller,
  [Spherical minimal immersions of the 3-sphere](https://ems.press/content/serial-article-files/42818?nt=1),
  introduction and spherical-harmonic setup, for Takahashi/eigenmap normalization
  and the distinction between full eigenspace maps and arbitrary eigenfunction lists.
