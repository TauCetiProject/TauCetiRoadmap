# Calibrations, volume minimization and special Lagrangian geometry

Develop smooth calibrated geometry from its finite-dimensional linear algebra through
volume minimization, Kähler and special Lagrangian examples, and the deformation theory
of compact special Lagrangian submanifolds. A calibration is a closed real differential
form whose value on every oriented orthonormal frame is at most one. Its equality
planes define geometric first-order equations; the closedness converts their pointwise
volume identity into a comparison with competitors. Build the objects and their
pullback, orientation, product, integration and variation APIs independently of the
special Lagrangian application.

The setting is finite-dimensional smooth real Riemannian manifolds without boundary;
compact oriented immersed submanifolds may have boundary where the comparison states
it explicitly. Use embedded submanifolds for the local deformation space. The
competitors below are smooth submanifolds and finite smooth chains with multiplicity.
Rectifiable currents and their regularity theory are a separate subject: this roadmap
does not use a current compactness or singular regularity theorem. The complex
examples concern Kähler manifolds and normalized parallel complex volume forms;
associative, coassociative and Cayley example-specific linear algebra and
exceptional-holonomy existence/deformation theorems are outside this scope.
Every milestone below is required. [Suggested.lean](Suggested.lean) is illustrative;
this README specifies the complete development.

## Carriers, conventions and dependencies

Use Mathlib's `ContinuousAlternatingMap`, exterior powers, `Orthonormal`,
`OrthonormalBasis` and native tangent bundles. A differential form is a smooth
section of the native bundle of continuous alternating maps, through
[DifferentialGeometry Layer0.3 and Layer1](../DifferentialGeometry/README.md).
Consume its exterior derivative, wedge, pullback, Cartan identities, smooth singular
chains, oriented integration and Stokes. Do not introduce a second de Rham complex
or singular-homology carrier.

[DifferentialGeometry DG12.1/12.4](../DifferentialGeometry/README.md) supplies
pullback metrics for immersions and their positive Riemannian volume forms.
[AlgebraicTopology Stages2/3.1](../AlgebraicTopology/README.md) supplies the
integral singular chain carrier, face maps, subdivision/prism homotopies and
relative chain API used by C2's integer comparison. Use these same native carriers.
[RiemannianGeometry R1/R5a](../RiemannianGeometry/README.md) supplies
Levi-Civita connections, normal bundles and first volume variation.
C3 consumes R5a.1's C² dependence and owns stability by the volume-minimizing comparison;
no general second-volume-variation formula is consumed.
[GeometricTopology Layer1](../GeometricTopology/README.md) supplies tubular
neighbourhoods and their normal exponential descriptions. Its smoothing-and-
triangulation item1 supplies the relative smooth triangulation used in C2. This roadmap proves the
specific normal-section parametrization of nearby embeddings and its regularity.
[ComplexKahlerGeometry K1/K2/K4/K5a/K6.1](https://github.com/TauCetiProject/TauCetiRoadmap/blob/a452db2cfef888380d1b7b7ce00fa06d5bad1109/TauCetiRoadmap/ComplexKahlerGeometry/README.md)
supplies complex tangent/type calculus, Kähler forms, formal adjoints, compact Hodge
theory and canonical-bundle carriers. K5b.0 supplies the Hermitian volume
identity on complex planes; C4 owns the inequality and converse classification;
K6.1's integrated analytic-cycle equality is compared with these pointwise
normalizations. Its singular-set
integration theorem has a single owner there. [PseudodifferentialOperators P5/P6](https://github.com/TauCetiProject/TauCetiRoadmap/blob/526c10edca87fdb08907b1ad2a044fea1e7829f7/TauCetiRoadmap/PseudodifferentialOperators/README.md) supplies bundle Hölder norms, elliptic
Schauder estimates, Sobolev Fredholm realizations and regularity. Instantiate
P5’s Hölder carriers; C6 owns the Hölder Green-operator and Hodge-projection
bounds.

The analytic order is K5a's Gram form metric, real star and density line,
PDO P1.0's differential operators and formal adjoints, K5a's real/complex
distributional Sobolev scale and compact H² Hodge realization, then PDO
P5/P6's bundle Hölder carriers and elliptic estimates. K5a's real de Rham
Hodge theorem applies on the source N in every real dimension, independently
of a complex structure on N. Its geometric L² pairing, harmonic projection
and Green inverse are the objects used in C6; C6 proves their d/δ
compatibilities and Hölder inverse bounds on these same carriers.

[PDE Lane E.22](../PDE/README.md) supplies scalar variable-coefficient
Schauder estimates used componentwise on C6’s diagonal-principal minimal-graph
system. PDE A.1/A.2/A.5 supplies the complete weak-derivative spaces,
W¹,²_0 and Poincaré used with native Lax–Milgram in C6; use their
componentwise ℝⁿ-valued Hilbert-space versions. PDE A.4 supplies the
cutoff Sobolev embeddings and A.7 the local Euclidean Hölder carriers. C6 owns
the vector-system decay, Campanato characterization and iteration
lemmas below. [SmoothBundlesConnections B1.4/B2/B5](https://github.com/TauCetiProject/TauCetiRoadmap/blob/791dd408dc48930060b28043245bbb1a8d82b5de/TauCetiRoadmap/SmoothBundlesConnections/README.md)
supplies smooth G/H, structure-group reductions and holonomy, with
[LieGroups Layer2](../RepresentationTheory/LieGroups/README.md)’s closed-subgroup
Lie structures. DG5.1–5.4/8.3–8.4/9.3 supplies outward-first integration,
Stokes/homotopy operators, smooth-chain comparison and closed fundamental-class
evaluation. C6 owns the nonlinear
section-map estimates and constrained implicit-function argument below; those do
not follow merely from a linear elliptic inverse.

For an oriented k-dimensional source, the calibration equation is
`f*φ=dvol_(f*g)`, with positive volume form. Reversing the source orientation
changes the sign of its integral and of the equality equation. Define comass with
an absolute value; an orientation reversal of an orthonormal frame supplies both
signs for k≥1. Degree zero and degrees exceeding ambient dimension have their
own edge-case statements. On ℂⁿ use `z_j=x_j+i y_j`,
`ω=Σ_j dx_j∧dy_j`, `Ω=dz₁∧…∧dzₙ`, the standard real Euclidean metric and
complex orientation `dx₁∧dy₁∧…∧dxₙ∧dyₙ`. On a Hermitian n-manifold normalize Ω by

`ωⁿ/n! = (−1)^(n(n−1)/2) (i/2)ⁿ Ω∧bar Ω`.

Use the conjugate-first Hermitian convention. A phase θ is a real parameter
modulo 2π; set `φ_θ=Re(e^(−iθ)Ω)`. A phase-θ special Lagrangian is calibrated
by φ_θ, so its oriented volume has positive real part in that phase.

## C1. Comass and equality planes

For a continuous alternating real k-form φ on a finite-dimensional inner-product
space E, characterize the native norm by
`‖φ‖=sup{|φ(v₁,…,vₖ)|: (v_i) orthonormal}`; call this geometric
quantity comass. Construct the
compact Stiefel carrier using its native frame subtype and prove continuity of
evaluation, existence of a maximizer when k≤dim E, and finiteness. For k>dim E
prove every form is zero and comass is zero; for k=0 identify comass with the
absolute value of the constant. Prove `comass(φ)=‖φ‖` for Mathlib's native
continuous-alternating-map operator norm: Gram–Schmidt gives the volume bound
by the product of the input norms, and orthonormal frames give the reverse
inequality. Consume the native norm's triangle, homogeneity, definiteness and
normed-space structure through this equality; do not install a competing norm.
Keep this operator/comass norm distinct from the coefficient Hilbert norm on
the native exterior power, and prove their finite-dimensional comparison.

Prove pullback equality under `LinearIsometryEquiv` (surjective linear
isometries), the comass inequality under arbitrary linear isometric embeddings,
and the operator bound under a general
linear pullback. For `L:ℝᵏ→E` prove

`|φ(L e₁,…,L eₖ)| ≤ comass(φ)·LinearMap.normDet L`,

where `(e_i)` is the standard Euclidean orthonormal basis. Consume native
`LinearMap.normDet` and its Gram and range-restriction identities, including
the rank-deficient case, rather than defining another rectangular Jacobian.
Prove the equivalent simple-multivector formulation using the native exterior
power metric and the orientation-preserving orthonormalization comparison.
Own the Hadamard inequality `det(gram v)≤Π‖v_i‖²` through Gram–Schmidt,
and identify a form with the native exterior power using
`exteriorPower.alternatingMapLinearEquiv` and Riesz. Prove
`‖φ‖≤|φ|_H≤sqrt(binomial(dim E,k))·‖φ‖`, including the zero space cases.

Own the oriented Grassmannian on a general E: its carrier is the sigma type
of rank-k native subspaces P with `Orientation ℝ P (Fin k)`, with topology
from the positive orthonormal-frame quotient for k≥1. Own the smooth
Stiefel manifold of orthonormal k-frames on a general E: realize the Gram
map's level I as a regular submanifold, proving its differential onto
symmetric matrices by the frame variation vA/2. Construct its free proper
SO(k) action and use SBC B1.4 for the quotient atlas. Treat k=0
separately as the two orientation rays of Λ⁰, and k=dim E as the
two orientations of E. Compare coordinate carriers using a linear
isometry to EuclideanSpace followed by the WithLp linear equivalence
to [TopologicalKTheory T1.5](../TopologicalKTheory/README.md)'s coordinate
module. The comparison depends on that chosen isometry ι: the target action
is g↦ιgι⁻¹, and replacing ι by ι′ composes it with ι′ι⁻¹.
Prove that forgetting orientation is a smooth two-sheeted cover of the
T1.5 real Grassmannian transported along ι, with [GeneralizedCohomology G4.0b](../GeneralizedCohomology/README.md)'s
graph-chart smooth structure; compare the quotient and pulled-back graph atlases.
For k≥1 compare with [HomotopySpheres §4A](https://github.com/TauCetiProject/TauCetiRoadmap/pull/284)'s
coordinate oriented carrier and [CharacteristicClasses C1.1a](../CharacteristicClasses/README.md)'s
orientation double cover. Prove these comparisons commute with
CC C1.1a's existing HS identification. For k=0 compare with CC's two-point orientation
cover. The canonically oriented zero-plane point is included as one ray;
no bijection with that single point is asserted.
For rank zero evaluate the constant 0-form with the sign of the chosen
orientation ray; an empty frame alone selects only the canonical ray.
On this carrier construct the closed
equality locus φ(positive orthonormal frame)=1 when comass≤1. Prove a zero
form has no equality planes for 1≤k≤dim E, a unit decomposable form has
exactly its positive supporting plane, and the isometry/orientation laws. Identify the
Euclidean constant decomposable volume calibration: its equality planes are
exactly its positively oriented supporting plane. Treat −φ with the reversed
orientation. Construct external products on orthogonal direct sums and prove
the general bound by `binomial(k+l,k)·comass(φ)·comass(ψ)`, together with
the exact evaluation on a concatenated product frame. If one factor is a unit
decomposable volume form, prove the sharper product-comass bound one and the
product calibration theorem. For general factors carry an explicit bound-one
hypothesis on their external product; orthogonal support alone does not imply
that their product is a calibration; see [Züst's product counterexample](https://arxiv.org/abs/2503.12402v2).
State the product orientation as
first-factor frame followed by second-factor frame.

## C2. Calibrated immersions and integration

Construct the smooth calibration interface with the actual equations `dφ=0`
and `comass(φ_x)≤1` at every point. Prove its preservation by Riemannian
isometries, restriction to open sets and parallel transport for parallel forms: pullback of φ at an endpoint by
the metric parallel-transport isometry equals φ at the start.
Own the torsion-free covariant exterior-derivative identity. For parallel φ,
prove dφ=0 through that
identity and prove the comass is constant on each connected component.
Do not assert that a general closed calibration is parallel.

For an oriented smooth immersion f:Nᵏ→M, define calibratedness by the pullback
equation with the induced metric. Prove equivalence with equality on every
positive orthonormal tangent frame and with the tangent-plane condition in C1.
The equation is independent of oriented charts and parametrization; prove its
transport under orientation-preserving diffeomorphisms and its sign change
under orientation reversal. Prove the pointwise inequality `f*φ≤dvol_(f*g)`
and its absolute version, followed by the integrated inequality on compact
sources. Include finite volume/integrability assumptions for noncompact sources;
no global finite volume is inferred from calibratedness.

For smooth finite chains construct the integral complex on DG8.3's same
`SmoothSimplex I M p` carrier, with chains `SmoothSimplex I M p →₀ ℤ`,
the alternating face boundary and its square-zero identity. Construct
the coefficient-change map to DG8.3's real complex, integral smooth-to-
AT-singular comparison, subdivision and pushforward naturality; prove
integration agrees after coefficient change. Prove the integral smooth-to-singular
comparison is a quasi-isomorphism. Construct ℤ-module chain maps and chain
homotopies on these finitely supported integer generators using DG8.3's
simplex-level `exists_smoothSimplex_homotopicRel` data. Use a single shared
face-compatible choice function and the same subdivision/prism triangulations
as DG8.3 before extending coefficients, so the selected operators' coefficient-
change squares commute literally. Prove both chain-homotopy identities over ℤ,
relative/subdivision/naturality laws, and specified chain homotopies comparing
different choices. Inclusions and induced smooth-chain maps are strictly natural;
smoothing inverses and the choice comparisons have explicit naturality chain
homotopies, not an assumed strictly functorial Whitney approximation. For DG operators built with different choices, use that
specified comparison homotopy rather than claiming literal equality. Those existing
operators are real-only; do not call them ℤ-linear or infer the integer
isomorphism by tensoring a real comparison backwards. Do not create another
smooth simplex carrier. The mass of a parametrized simplex is its integral of the native
norm determinant. Prove subdivision, smooth reparametrization and orientation
compatibility, and the calibration bound by the sum of the absolute-coefficient
masses. Parametrized chain mass counts multiplicity and does not become the
Hausdorff measure of its image when a map folds or covers it several times.
Own the finite integral smooth fundamental chain c_N for compact oriented
N with boundary. Consume GT’s relative smooth triangulation, DG5.1/5.2
and 8.4; use GT's ordered simplex parametrizations with coefficients
ε_σ∈{−1,+1}, and prove shared interior facets cancel as identical
parametrized face maps with opposite coefficients,
`∂c_N=c_(∂N)` with outward-first signs, and `∫_(c_N)η=∫_Nη`. Give
refinement and choice comparisons. The closed-source homology version
consumes DG9.3 and AT6.3; integral chain statements precede their real
coefficient corollaries.

## C3. Volume minimization and stability

Consume RiemannianGeometry R5a.1's `volumeVariation_isContDiff` on native
orientation-free densities, including its fixed-compact-support relative-volume
functional for noncompact sources. C3 owns its comparison with C2's oriented
integration and the calibration-minimization stability consequence below; it does
not reconstruct the generic density calculus or supply an input to R5b.

For compact calibrated oriented N and compact oriented N′ with the same
boundary, require an explicit smooth chain B with
`c_N−c_(N′)=∂B` in the integral smooth-chain carrier, including
the parametrizations and multiplicities. Stokes gives
equal calibration integrals and hence `Vol(N)≤Vol(N′)`. Give the homology-class
version on closed sources through the existing smooth/singular homology
comparison. For competitors agreeing outside a compact region, additionally
require their compact difference to bound a finite integral smooth chain B
there, or a compactly supported homotopy supplying B, and construct that
relative chain comparison. Agreement outside a compact region alone does
not imply the bounding-chain hypothesis. An arbitrary noncompact homology statement is
not a finite-integral hypothesis. Prove equality precisely when the competitor
is calibrated with the specified orientation, by a nonnegative continuous
defect and its zero-integral criterion.

For a compactly supported variation with fixed boundary, use DG5.4's
homotopy operator, its pullback naturality and Stokes to prove the calibration integral is
constant. Consume R5a.1's C² dependence for Vol(f_t), and here compare its
relative-density functional and derivatives with C2's oriented integration. Define stability by the second
derivative at zero being nonnegative; the volume minimum proves it by
elementary calculus. Use R5a’s first variation for compactly supported
interior variations to obtain H=0, and adapt the integral divergence term
through DG12.5's boundary divergence theorem for fixed-boundary variations, whose variation field is
zero on the boundary. State the fixed-boundary/compact-support
hypotheses in every application; arbitrary variations can contribute boundary
terms. The special Lagrangian gradient-graph test is C5’s determinant equation.
Derive the Riemannian product calibration
theorem under C1’s decomposable-factor or explicit product-comass hypotheses,
and the distinction between a stationary minimal submanifold and a
calibrated one. For m≥1 compute the round equator Sᵐ⊂S^(m+1): it is minimal,
but its constant unit normal variation has second volume variation
`−m·Vol(Sᵐ)<0` by differentiating `cos(t)^m Vol(Sᵐ)`, so it cannot
be calibrated by a closed ambient form.

## C4. Hermitian linear algebra and Kähler calibrations

First export the pointwise Hermitian vector-space theorem for every complex
dimension n and 0≤r≤n: the associated real form `ωʳ/r!` has comass1,
with equality precisely on complex r-planes with their complex orientation.
Use the associated real metric g and orthogonal complex structure J,
`ω(v,w)=g(Jv,w)`, and prove naturality under Hermitian isometries.
At r=1 this is `ω(v,w)≤sqrt(g(v,v)g(w,w)−g(v,w)²)`; for independent
v,w equality is equivalent to their positively oriented plane being
J-invariant. Prove this linear theorem without a complex atlas, an
integrability assumption or closedness. Derive its smooth bundlewise form
for a symplectic form ω and an ω-compatible J, with the associated
metric `g(v,w)=ω(v,Jw)`. Expose this linear core on C1's comass
carriers. For the linear proof, use Cauchy–Schwarz
at r=1 and the singular values of the restricted skew-adjoint complex
structure and their Pfaffian/volume comparison in every r. Consume native
finite-dimensional adjoint, spectral and determinant APIs; construct the
real skew-normal-form and Pfaffian comparisons here. A unitary basis
proves the complex-plane normalization independently of complex charts.

For every Kähler manifold instantiate that theorem with its complex
tangent metric and fundamental form. Prove the smooth inequality, comass
and equality classification on the same carriers. Consume
CKG K5b.0 to compare the induced Hermitian metric/volume normalization on
a complex r-plane with the linear theorem. The inequality and its equality
classification come from the preceding linear core. Closedness follows from dω=0 and
the wedge-derivative rule.

Prove a smooth real 2r-submanifold is calibrated exactly when its tangent spaces
are complex, with the orientation specified. For an embedded submanifold use
the holomorphic chart/implicit-function comparison in CKG to identify this with
a complex submanifold. Thus compact complex submanifolds minimize volume in
their oriented homology class and are stable minimal submanifolds. Compare
with CKG K6.1's analytic-cycle normalization on the smooth regular locus;
singular-set Stokes and local finite mass remain CKG's targets. Compute the
flat complex-plane identity `ωʳ/r!=dx₁∧dy₁∧…∧dx_r∧dy_r`
restricted to ℂʳ×0
and the complex product-torus example with rectangular lattice
`a_jℤ+i b_jℤ` (a_j,b_j>0), whose calibrated volume is Π_j a_jb_j.

## C5. Special Lagrangian linear algebra and geometry

For n≥1, on ℂⁿ with the pinned ω/Ω/g, prove φ_θ has comass one and classify its positive
equality n-planes as the oriented Lagrangian planes L with
`Im(e^(−iθ)Ω)|_L=0` and `Re(e^(−iθ)Ω)|_L=dvol_L`. Both the imaginary equation
and the Lagrangian condition are required; do not replace the orientation
inequality by an unoriented vanishing equation. Construct the oriented
Lagrangian Grassmannian `U(n)/SO(n)` through the unitary-frame quotient,
its smooth quotient structure through SBC B1.4 and LieGroups Layer2,
its determinant phase map to U(1), and the fixed-phase fibre
`SU(n)/SO(n)`, with the n=1 and low-rank cases. State the corresponding
unoriented quotient separately and prove how changing orientation changes phase.
Define the standard ω as the pullback of native
[`TauCeti.stdSymplecticForm`](https://github.com/TauCetiProject/TauCeti/blob/a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039/TauCeti/Geometry/Symplectic/StandardCompatible.lean)
along the real-linear realification z↦(Re z,Im z). Consume its
compatible product complex structure and metric, comparing them with
multiplication by i and the Euclidean complex metric. For the real-linear
realification R:ℂⁿ≃ₗ[ℝ]ℝⁿ×ℝⁿ, use native
`SymplecticForm.transport` with R.symm, so its evaluation is
ω₀(Rv,Rw). Own the finite-dimensional linear equivalence from
alternating `LinearMap.BilinForm` values to native Fin-2 continuous
alternating maps, with evaluation φ(![v,w])=B(v,w), inverse,
linearity, continuity and pullback naturality. Through this equivalence,
`standardKahlerForm n ![v,w]=(ω₀.transport R.symm) v w`.
Transport product J by native `AlmostComplexStructure.transport` with
R.symm and compatibility by `Compatible.transport`; prove the transported
J is multiplication by i and compare its `complexModule` instance with
the existing complex module on ℂⁿ. Then consume native
`SymplecticForm.complexAssociatedForm` and `Compatible.hermitianCore`
for the conjugate-first Hermitian form g+iω and the metric comparison.
Use native `SymplecticForm.IsLagrangian` for the plane condition. Prove that this native condition is equivalent to the imaginary
Hermitian-pairing equations in the illustrative frame prototype, and
prove `[A]↦(Aℝⁿ,A_*or)` identifies U(n)/SO(n) homeomorphically
and smoothly with the Lagrangian locus in C1's oriented Grassmannian.
Give the corresponding U(n)/O(n) comparison with the unoriented
Lagrangian locus. [HeegaardFloer F1.3](../HeegaardFloer/README.md) owns the Robbin–Salamon path Maslov index, distinct from the phase class here.

For a Kähler n-manifold with normalized parallel nowhere-vanishing holomorphic
Ω, construct the SU(n)-reduction, compare its metric/volume data with CKG's
native Hermitian bundle and canonical-bundle carriers, and prove each φ_θ is
closed and calibrating. Prove the special Lagrangian equations, minimality,
stability and homological volume bound by C2/C3. On an arbitrary oriented
Lagrangian immersion define its U(1)-valued phase without assuming a global
real lift; build local real lifts. Define the oriented phase class as the
pullback under this phase map of the H¹(U(1);ℤ) class pairing to +1
with AT's outward-first circle fundamental class, transported to U(1)⊂ℂ,
and prove its real de Rham image is [dθ/(2π)]. The classical unoriented
Maslov class uses det² on U(n)/O(n); on this oriented carrier it is
twice the phase class. Prove the cocycle and singular/de Rham comparisons. Prove the
mean-curvature/phase identity for C² oriented Lagrangian immersions:
construct B and H in local coordinates, compare with R5a on smooth
immersions, and with `ω(X,Y)=g(JX,Y)` and
`H_tr=trace B`, prove `H_tr=J grad θ` and `ι_(H_tr)ω=−dθ`. Compare
`H_avg=H_tr/n` with RiemannianGeometry R5a’s averaged mean curvature, and
derive that a connected oriented Lagrangian has H=0 iff its phase is
constant, hence it is special Lagrangian for that phase. Compute flat planes, affine translations, diagonal unitary
images and flat tori, including their phase and orientation.

For a gradient graph `y=∇u(x)` over an open Euclidean domain, prove the
Lagrangian equation using symmetry of the actual Hessian, and the complex
volume formula `Ω|graph=det(I+i Hess u) dx₁…dxₙ`. Derive the phase equation
`Im(e^(−iθ)det(I+i Hess u))=0` with positive real part. The derivative of
the phase-angle operator `Σ arctan λ_j` is
`tr((I+(Hess u)²)⁻¹ Hess v)`; on a solution, the derivative of the imaginary
determinant residual is this expression multiplied by the positive factor
`Re(e^(−iθ)det(I+i Hess u))`. Pin ellipticity on the positive branch and
the real phase-lift equation `Σ arctan λ_j=θ` up to the chosen 2π branch.
Own this nonlinear determinant computation; no global Dirichlet existence
or branch selection theorem is implied by ellipticity.

## C6. Compact special Lagrangian deformation theory

Let N be a compact embedded special Lagrangian without boundary in the
normalized parallel-volume ambient manifold of C5. Choose a tubular
neighbourhood and use small normal sections to parametrize nearby unparametrized
embedded submanifolds. Prove this parametrization induces a homeomorphism
onto a neighbourhood in the C¹ quotient by reparametrization;
transition laws between tubular
choices are in C¹/C∞ topology and on the smooth solution charts below,
not in the full Hölder Banach topology. Via
`β=ι_Vω|_N`, identify the normal bundle with T*N, proving its sign in the
fixed convention. Construct the nonlinear map

`V ↦ (exp_V*ω, exp_V*Im(e^(−iθ)Ω))`.

Use pullbacks along the actual normal exponential embedding, not a pointwise
formal substitution. Prove both components are closed and lie in the Hölder closed-form subspace orthogonal in L² to all harmonic
forms. Use DG1.2/5.3/5.4’s C²-map/C¹-form homotopy and Stokes theorems
on exp(tV), rather than assigning a smooth de Rham class to a merely
Hölder form. This target is defined precisely below. Derive
the derivative `β↦(dβ, −d(★β))`, where ★ is the source Hodge star. In a
positive flat real plane `V=Σ a_j∂_(y_j)` gives `β=−Σ a_j dx_j` and
`ι_V Im Ω=−★β`; transport this identity through positive SU(n) frames.
Equivalently the second component is `(δβ)dvol_N` for the codifferential
δ=d†. Prove the comparison with CKG’s formal-adjoint convention rather than
interchanging exterior derivative, Hodge star and codifferential notation.

For integer k≥2 and 0<α<1 instantiate PDO P5’s Hölder section carriers.
Define `Z_perp^(k−1,α)` by dη=0 and L² pairing zero with every harmonic
form; in top degree this is integral zero on each connected component.
Prove this is a closed Banach subspace, and prove
`Z_perp^(k−1,α)=d(C^(k,α))` using the primitive δGη. Own the
Hölder Green and Hodge-projection bounds by applying smooth-coefficient
Schauder regularity to the Sobolev Green solution from K5a/PDO, without
assuming smooth norm density in full Hölder spaces. From compact Hodge
theory and Schauder estimates prove the derivative's kernel is the harmonic
one-forms and its restriction to their complement is an isomorphism onto that
exact-form target. Prove the exterior-derivative and codifferential compatibility
which makes the two target components independently solvable. Establish the
nonlinear map's `HasStrictFDerivAt` at zero and `ContDiffOn ℝ ∞`
on its specified open ball (hence `ContDiffAt ℝ ∞` there), with explicit
composition, multiplication and normal-exponential estimates between these
spaces. Keep the real part of e^(−iθ)Ω positive in a sufficiently small
C¹ neighbourhood, excluding the phase θ+π zero set. Consume native
`ImplicitFunctionData.contDiffAt_implicitFunction` through this derivative, constructing
the kernel/complement chart rather than asserting surjectivity of d⊕d* on
all forms.

Prove the resulting nearby moduli space is a smooth manifold of dimension
`dim H¹(N;ℝ)=b₁(N)`. Pin the moduli set as embedded phase-θ special Lagrangian submanifolds
near N, modulo parametrization, with the local C¹ quotient topology.
Own the C² graph expression for H, and prove the C^(k,α) solutions
are minimal by C5's C² phase identity. In local graph
coordinates derive the minimal-submanifold system with diagonal principal
part g^(ij)(x,u,Du)∂_ij u, prove uniform ellipticity, apply PDE E.22
componentwise. Own the difference-quotient estimates and
Arzelà–Ascoli passage which bootstrap this C^(2,α) estimate to
each higher spatial order. Prove the parametric gain as well: on
the fixed finite-dimensional k-chart domain in harmonic one-forms,
χ↦V(χ) is smooth
into C^(k′,α) near every point, for every k′≥k, by recentring,
differentiating the equations and uniform Schauder estimates. The k′=k
case proves smoothness on an open chart domain, rather than inferring
neighbourhood smoothness from `ContDiffAt ℝ ∞` at one point.
Own the composition estimate with loss of derivatives, and
compare different tubular choices only on these finite-dimensional
smooth solution charts. Do not assert the reparametrization action is C¹
on all C^(k,α) embeddings. Prove resulting chart compatibility for
different k/α/tubular choices, agreement with the local C∞ quotient
topology, and the tangent identification with harmonic one-forms. Construct
the intrinsic L² metric on this tangent space and its smooth dependence.
For flat special Lagrangian tori identify local deformations and the translation
parameters explicitly. No unobstructed-moduli conclusion is asserted for a
different calibrated geometry or for a submanifold with boundary.

To give the C¹-neighbourhood assertion its full meaning, fix an initial
Hölder exponent α and order k₀≥2. Own the C¹-to-Hölder estimates for
minimal graphs near N: every C¹ weak solution in a sufficiently small
fixed C¹ ball is smooth and satisfies local C^(k₀,α) bounds tending
to zero with its C¹ norm. Write the area as ∫L(x,u,Du), set
A=L_p and b=L_z, and derive the weak Euler–Lagrange equation div A=b.
Prove L_pp satisfies the full Legendre lower bound λ|ξ|² on
matrix-valued ξ near the zero graph, with coefficient bound Λ; at zero
it is √g g^(ij)g_perp_(μν). Own Caccioppoli and the difference-quotient
W²,² membership and estimate. Subtract the zero-graph equation before
differentiation. For w=∂_ℓ u, write the differentiated weak system

`∂_i(a^(ij)_(μν)∂_j w^ν)=∂_i F^i_μ`,

with a=A_p(x,u,Du) and
`F^i_μ=−[A^i_(μ,x_ℓ)(x,u,Du)−A^i_(μ,x_ℓ)(x,0,0)]
        −A^i_(μ,z^ν)(x,u,Du)w^ν
        +δ_(iℓ)[b_μ(x,u,Du)−b_μ(x,0,0)]`.
Keep the derivative of b in divergence form. Prove F is bounded by
C‖u‖_(C¹), and for every ζ∈(0,1) prove
`[F]_ζ≤C_ζ‖u‖_(C^(1,ζ))`. Obtain this differentiated weak
system as the τ→0 limit of the difference-quotient systems:
a_τ→a uniformly, F_τ→F uniformly and
DΔ_τu⇀D∂_ℓu in L²; do not presume a classical third derivative.

Own the following constant-coefficient and Campanato package for real
vector systems. For a constant symmetric Legendre tensor a₀, construct
the homogeneous comparison solution v with w−v∈W¹,²_0(B_r) by
native Lax–Milgram on componentwise ℝⁿ-valued W¹,²_0,
consuming PDE A.1/A.2/A.5 and D.16–17
for the scalar H¹_0 Hilbert/Lax–Milgram setting. Construct its
componentwise `PiLp 2` inner product
`⟨u,v⟩=∫(u·v+Du:Dv)`, prove equivalence of its induced
Hilbert norm with the componentwise weak-Sobolev norm and completeness
before Lax–Milgram. Use the Hilbert norm there and transport the weak
solution and estimates back through this norm equivalence; A.5 supplies
the gradient-form coercivity. Prove its energy decay
`∫_(B_ρ)|Dv|²≤C(ρ/r)^n∫_(B_r)|Dv|²` and gradient-excess decay
`∫_(B_ρ)|Dv−(Dv)_ρ|²≤C(ρ/r)^(n+2)∫_(B_r)|Dv−(Dv)_r|²`,
with uniform C depending on dimensions, λ and Λ. Use difference
quotients/Caccioppoli on all derivatives and PDE A.4 Sobolev
embedding with interior cutoffs for constant coefficients; these bounds apply to general Legendre tensors,
not just scalar diagonal operators. Use PDE A.7 local Euclidean
Hölder carriers and, for every exponent ζ∈(0,1), own the local
Campanato characterization
`f∈C^(0,ζ) ↔ sup_(x,ρ) ρ^(−n−2ζ)∫_(B_ρ(x))|f−f_(x,ρ)|²<∞`,
with comparable interior norms, its Dirichlet-growth consequence for
W¹,² functions, and the quantitative geometric iteration lemma.

First apply frozen comparison to the continuous coefficients a and
bounded F. Prove the estimate
`∫_(B_ρ)|Dw|²≤C[(ρ/r)^n+osc_(B_r)(a)²]∫_(B_r)|Dw|²+C r^n‖F‖∞²`.
For any chosen γ with max(α,1/2)<γ<1, choose the fixed C¹ ball
and chart radius so iteration gives energy growth exponent
κ₀=n−2+2γ∈(0,n). The Dirichlet-growth characterization then gives
w∈C^(0,γ), with norm controlled by ‖u‖_(C¹). Prove this uniform
smallness using smooth x-dependence and closeness to the zero graph,
without assuming a uniform Hölder modulus for arbitrary C¹ embeddings.
Now a and F are C^(0,γ). Own qualitative divergence-form Schauder:
a W¹,² weak solution of this Legendre system with C^(0,γ) coefficients
and C^(0,γ) divergence data is C^(1,γ) locally, with the interior
estimate. Freeze at the actual a(x₀), use the full tensor excess-decay
bound and Campanato iteration. Applied to w=Du this gives
u∈C^(2,γ), hence C^(2,α), before PDE E.22 and the higher diagonal
bootstrap. Every bound uses the zero equation subtracted and tends
to zero with ‖u‖_(C¹). The fixed ball depends only on the initial
α, chosen γ, dimensions, λ, Λ and chart data. Patch finitely many
charts on N; PDE E.22 and higher bootstrapping require no further
shrinking as the derivative order increases.
Define a C¹ phase-θ special Lagrangian graph by its tangent planes
lying in C5's positive equality locus, and apply this chain by the calibration
variation equation, formulated weakly with C¹-form Stokes. Thus every
such nearby graph lies in the k₀-chart ball after a single
k₀-dependent shrinking of the C¹ ball to fit this implicit-function
chart; higher-order regularity requires no additional shrinking. For the C¹ weak variation equation first own smooth approximation
in the C¹ norm, with local support control; pass calibration integrals
and volume comparisons to the limit. Apply Stokes to the smooth
approximations, rather than applying a C²-map pullback theorem to a
merely C¹ map. Prove the C¹ and C∞ quotient topologies agree on this moduli
neighbourhood using uniform higher bounds and Arzelà–Ascoli; no
regularity of arbitrary C¹ embeddings is asserted.

For a smooth normal variation of closed N, prove second volume
variation depends only on V, independently of acceleration, since N
is minimal. Own the special Lagrangian identity
`δ²Vol(V)=∫_N(|dβ|²+|δβ|²) dvol`, using K5a's Gram exterior norm
(|dx₁∧dx₂|=1). Set Ω_θ=e^(−iθ)Ω. Own the pointwise second-jet calibration identity
in an Ω_θ-adapted unitary frame: for a plane graph with infinitesimal matrix A,
the second derivative of volume minus Re Ω_θ is
`(tr A)²+Σ_(i<j)(A_ij−A_ji)²`. Prove it by expanding
`sqrt(det(I+t²AᵀA))` and `Re det(I+i tA)`, and prove its
coordinate-invariant form on the plane locus. For a curve of frames
u_i(t) in the moving ambient tangent spaces, set S_ij=g(u_i,u_j)
and W_ij=ω(u_i,u_j). Prove `det(S+iW)=|Ω_θ(u)|²` and derive
`(vol−ReΩ_θ)′′(0)=|W′(0)|²_Gram+(ImΩ_θ(u)′(0))²` at a positive
orthonormal special Lagrangian frame; this is the frame form of the same identity
without a tangent-space trivialization. The gap and its first
derivative vanish at a special Lagrangian plane, so this second jet
depends only on the first plane variation. Integrate it, use C3's
constant closed-form integral, and identify the first variations of
ω and Im Ω_θ by the derivative already proved above.
Define the normal Jacobi operator here as the differential operator
`𝒥=(V↦ι_Vω)⁻¹∘(dδ+δd)∘(V↦ι_Vω)`. Prove its ellipticity,
formal self-adjointness and Hessian identity by polarization of this
second-variation formula. Identify its kernel with the harmonic
one-forms and the preceding infinitesimal deformation space. This
specialized construction supplies no second-variation formula for
arbitrary minimal submanifolds.

## Dependency order

C1's finite-dimensional theory precedes every geometric application.
C4's Hermitian linear inequality and equality classification use C1 and
finite-dimensional Hermitian linear algebra. Its Kähler bundle application
uses early CKG K1/K2 and compares its equality normalization with K5b.0,
independently of K6.1's analytic-set integration and C3's variation theorem. C2's chain/
integration theory precedes C3. C5's plane and coordinate-phase theory
uses C1 and the early Kähler/parallel-volume data, and its smooth
minimization conclusions consume C2/C3. C6 uses C5, K5a's compact Hodge
operators, PDO's Hölder/qualitative regularity and the stated PDE
estimates. Its weak C¹ graph estimates and C² mean-curvature equation
precede its smoothness conclusion; parametric higher regularity precedes
the C∞ chart and topology comparison. No K6.1 pointwise export or
general minimal-submanifold second-variation formula is assumed.

The smooth variation order is RiemannianGeometry R5a.1 → R5a.2/R5b.
C3 consumes C2 and R5a.1/R5a.2 and does not supply R5b.

## References

Harvey and Lawson, [*Calibrated geometries*, Acta Math. 148 (1982)](https://doi.org/10.1007/BF02392726), is the primary reference for the
calibration method and standard examples. McLean, [*Deformations of calibrated
submanifolds*, Comm. Anal. Geom. 6 (1998)](https://doi.org/10.4310/CAG.1998.v6.n4.a4), supplies the compact deformation
theorem. The mathematical targets and pinned conventions above are authoritative;
reference notation does not override the native carriers or these conventions.
