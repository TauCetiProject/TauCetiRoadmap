# Roadmap: calibrations, volume minimization and special Lagrangian geometry

**Summary.** This roadmap develops smooth calibrated geometry, from its finite-dimensional linear
algebra through volume minimization, the Kähler and special Lagrangian calibrations, and the
deformation theory of compact special Lagrangian submanifolds. A calibration is a closed real
differential form whose value on every oriented orthonormal frame is at most one. Its equality
planes define geometric first-order equations, and closedness converts their pointwise volume
identity into a comparison with competitors. The objects and their pullback, orientation, product,
integration and variation APIs are built independently of the special Lagrangian application.

The roadmap builds on Mathlib's continuous alternating maps, exterior powers with their Gram inner
product, orthonormal families and `LinearMap.normDet`, on Tau Ceti's linear symplectic and
almost complex structures, and on the differential forms, smooth chains, Riemannian volume, Kähler
and elliptic carriers of the roadmaps named in the supplier contracts. Its end theorems are:

- comass equals the native operator norm, and the linear calibration inequality
  (`norm_eq_sSup_abs_orthonormal`, `abs_eval_le_norm_mul_frameVolume`, Layer 1);
- the fundamental theorem of calibrations for compact oriented submanifolds and finite integral
  smooth chains (Layer 3);
- the Wirtinger inequality for `ωʳ/r!` in every degree with its equality classification, and the
  volume-minimizing property of compact complex submanifolds of Kähler manifolds
  (`norm_kahlerPowerForm`, `isCalibratedFrame_kahlerPowerForm_iff`, Layer 4);
- the special Lagrangian comass and equality-plane classification, and the minimality of special
  Lagrangian submanifolds (`norm_standardSpecialLagrangianForm`, `specialLagrangianFrame_iff`,
  Layer 5);
- McLean's theorem: near a compact special Lagrangian N, the special Lagrangian deformations form a
  smooth manifold of dimension `b₁(N)`, with tangent space the harmonic one-forms, and the second
  variation of volume is the Hodge energy `∫_N(|dβ|²+|δβ|²)` (Layer 6).

[Suggested.lean](Suggested.lean) states the headline theorems of Layers 1, 4 and 5, which are
statable against the pinned libraries; its docstring names the headline theorems of Layers 3, 4, 5
and 6 that are not.

## Scope and ownership

### Owned here

- Comass on finite-dimensional real inner-product spaces, its identification with the native
  operator norm, its comparison with the exterior-power Hilbert norm, the frame-volume inequality,
  the oriented Grassmannian and the smooth Stiefel manifold of a general inner-product space,
  equality planes, and external products (Layer 1).
- Smooth calibrations, calibrated immersions, the integral smooth-chain complex on the
  DifferentialGeometry 8.3 simplex carrier with its integral smooth-to-singular comparison, the
  mass of smooth chains, ordered relative smooth triangulations of compact manifolds with boundary
  and their integral fundamental chains (Layer 2).
- The fundamental theorem of calibrations, its equality case, calibration stability, and the round
  equator non-example (Layer 3).
- The Wirtinger inequality in every degree with its equality case, its Kähler-manifold form and the
  calibration of complex submanifolds (Layer 4).
- Special Lagrangian linear algebra, the oriented Lagrangian Grassmannian and its phase map, the
  identification of the standard Kähler form with Tau Ceti's standard symplectic form, special
  Lagrangian submanifolds of Kähler manifolds with a normalized parallel holomorphic volume form,
  the phase class, the mean-curvature/phase identity, and gradient graphs (Layer 5).
- McLean's deformation theorem, the Hölder Hodge-projection bounds it needs, the C¹-to-Hölder
  regularity of nearby minimal graphs with its vector-valued Campanato package, and the special
  Lagrangian second variation and Jacobi operator (Layer 6).

### Owned elsewhere

- Differential forms, wedge, exterior derivative, pullback, Cartan identities, oriented integration,
  Stokes, the real smooth-chain complex and smoothing: DifferentialGeometry Layers 0–1, 5 and 8.3.
- Integral singular chains, subdivision and prism operators, orientation and fundamental classes:
  AlgebraicTopology Stages 2, 3.1 and 6.3.
- The hermitian Gram–Hadamard inequality `det Gram(v) ≤ Π‖v_i‖²`: SuccessiveMinima 0.1.2
  `hermitian_gram_hadamard`. Layer 1 consumes its real specialization.
- Existence of smooth triangulations of smooth manifolds (Whitehead): GeometricTopology, smoothing
  and triangulation comparison item 1. Its statement fixes no boundary subcomplex and no vertex
  order; the relative ordered version used for fundamental chains is target 2.4 here.
- Levi-Civita connections, normal bundles, the C² relative-volume functional and first variation:
  RiemannianGeometry R1, R5a.1 and R5a.2. No general second-variation formula is consumed.
- Tubular neighbourhoods and normal exponential maps: GeometricTopology Layer 1.
- Complex, Kähler, Hodge and canonical-bundle carriers: ComplexKahlerGeometry K1, K2, K4, K5a,
  K5b.0 and K6.1. The integration of analytic cycles across their singular sets belongs to K6.1.
- Bundle Hölder norms, elliptic Schauder estimates and Sobolev Fredholm theory:
  PseudodifferentialOperators P1.0, P5 and P6.
- Scalar weak-derivative Sobolev spaces, Poincaré, Sobolev embedding, Hölder spaces, the scalar
  Campanato characterization, Lax–Milgram settings and Schauder estimates: PDE Lanes A, D and E.
- The finite orientation double cover of the coordinate Grassmannian: CharacteristicClasses C1.1a,
  on TopologicalKTheory T1.5's finite Grassmannians; the stable classifier comparisons belong to
  TopologicalKTheory T1.6a.
- The Robbin–Salamon Maslov index of Lagrangian paths, and its comparison with the native loop
  invariant `TauCeti.TotallyRealLoop.maslovIndex` (the degree of the `det²` phase loop):
  HeegaardFloer F1.4. The phase class here is a different invariant (the cohomology class of the
  phase map); 5.3 compares it with the native loop invariant on Lagrangian loops in ℂⁿ.
- The pointwise degree-two Wirtinger inequality `ω(v,w) ≤ |v∧w|_g` for an ω-compatible J on Tau
  Ceti's symplectic carriers, with its equality case: HeegaardFloer F2.6c. 4.1 keeps the
  comass-carrier form on ℂⁿ, the r = 1 instance of 4.2, and 4.2's transport to Hermitian vector
  spaces is the all-degree statement.
- Associative, coassociative and Cayley calibrations and exceptional holonomy, rectifiable currents
  and their regularity theory: outside this roadmap. No compactness theorem for currents and no
  singular regularity theorem is used.

## Conventions

- Manifolds are finite-dimensional, Hausdorff, second countable smooth real manifolds without
  boundary, with Riemannian metric g, unless a statement admits a compact source with boundary
  explicitly. Smooth chains carry DifferentialGeometry 8.3's hypotheses (finite dimension, `T2`,
  σ-compactness) wherever smoothing is used.
- For an oriented k-dimensional source with immersion f, the calibration equation is
  `f*φ = dvol_(f*g)` with the positive volume form. Reversing the source orientation changes the sign
  of the oriented integral and of the equation.
- Comass is defined with an absolute value: `comass(φ) = sup |φ(v₁,…,v_k)|` over orthonormal
  frames. An orientation reversal of an orthonormal frame realizes both signs for k ≥ 1. Degree zero
  and degrees above the ambient dimension are stated separately.
- On ℂⁿ: `z_j = x_j + i y_j`, the standard real Euclidean metric `g = Re⟪·,·⟫_ℂ`, the Hermitian
  product conjugate-linear in its first slot, `ω = Σ_j dx_j∧dy_j` so that `ω(v,w) = Im⟪v,w⟫_ℂ`,
  `Ω = dz₁∧⋯∧dzₙ`, and the complex orientation `dx₁∧dy₁∧⋯∧dxₙ∧dyₙ`. The sign witness: at n = 1,
  `ω(1,i) = Im(conj(1)·i) = 1`.
- On a Hermitian n-manifold with associated form ω and orthogonal complex structure J,
  `ω(v,w) = g(Jv,w)`, and a holomorphic volume form is normalized by
  `ωⁿ/n! = (−1)^(n(n−1)/2) (i/2)ⁿ Ω∧Ω̄`. At n = 1 this reads `dx∧dy = (i/2) dz∧dz̄`.
- A phase θ is a real number modulo 2π; `φ_θ = Re(e^(−iθ)Ω)` and `Ω_θ = e^(−iθ)Ω`. A phase-θ special
  Lagrangian is calibrated by `φ_θ`. Joyce's phase convention (Joyce2001SLLectures, line 76) is
  `cos θ Re Ω + sin θ Im Ω`, which equals `Re(e^(−iθ)Ω)`.
- Exterior powers carry Mathlib's Gram inner product, `⟪v₁∧⋯∧v_k, w₁∧⋯∧w_k⟫ = det(⟪v_j,w_i⟫)`, so
  `|dx₁∧dx₂| = 1` (no `1/k!`).
- Product orientations put the first factor's frame first.
- Layer k is also cited as Ck (for example "CalibratedGeometry C2").

## Exact supplier contracts

### From Mathlib

- `ContinuousAlternatingMap` with its operator norm (`ContinuousAlternatingMap.norm_def`,
  `ContinuousAlternatingMap.norm_constOfIsEmpty`,
  `ContinuousAlternatingMap.norm_compContinuousLinearMap_le`), and
  `ContinuousMultilinearMap.norm_compContinuous_linearIsometryEquiv` for pullback along a
  surjective linear isometry. The native norm is an infimum of product-norm bounds; it is not an
  orthonormal-frame supremum, which is target 1.1.
- `LinearMap.normDet` (`Mathlib/Analysis/InnerProductSpace/NormDet.lean`) with
  `LinearMap.normDet_sq_eq_det_gram`, its range-restriction identity and the rank-defect criterion:
  a genuine rectangular volume, `1` on a zero-dimensional domain and `0` on a non-injective map.
- `Matrix.gram` and `Matrix.det_gram_ne_zero_iff_linearIndependent`; `Orthonormal`,
  `OrthonormalBasis`, `EuclideanSpace`, `WithLp`, `PiLp` and `Orientation`.
- Exterior powers `⋀[ℝ]^k E` as submodules of `ExteriorAlgebra`, `exteriorPower.ιMulti`,
  `exteriorPower.alternatingMapLinearEquiv` (the linear dual of an exterior power; a Riesz
  identification is a further step), and the Gram inner product of
  `Mathlib/Analysis/InnerProductSpace/ExteriorPower.lean`, `exteriorPower.inner_ιMulti_ιMulti`.
  That instance requires `FiniteDimensional ℝ E`.
- `Submodule.pow_mem_pow` (powers of a 2-vector lie in the even exterior powers) and
  `LinearMap.continuous_of_finiteDimensional`.
- `ImplicitFunctionData.contDiffAt_implicitFunction`, `HasStrictFDerivAt`, `ContDiffOn`,
  `ContDiffAt`; it applies after the derivative and its complement are supplied and does not
  construct them.
- `Matrix.detRowAlternating`, `ContinuousAlternatingMap.restrictScalars`, Lax–Milgram
  (`IsCoercive.continuousLinearEquivOfBilin`), and the finite-dimensional adjoint, spectral and
  determinant APIs.

### From Tau Ceti

- `TauCeti.stdSymplecticForm` (`TauCeti/Geometry/Symplectic/StandardCompatible.lean`), with
  evaluation `⟪x₁,y₂⟫ − ⟪y₁,x₂⟫` on `(x₁,y₁),(x₂,y₂)`.
- `SymplecticForm.transport` (`TauCeti/Geometry/Symplectic/SymplecticTransport.lean`) and
  `AlmostComplexStructure.transport` (`TauCeti/Geometry/Symplectic/Transport.lean`), both through
  the inverse of the given equivalence, and `Compatible.transport`.
- `SymplecticForm.IsLagrangian` (`TauCeti/Geometry/Symplectic/Lagrangian/Basic.lean`): equality
  with the symplectic orthogonal, not isotropy alone.
- `SymplecticForm.complexAssociatedForm`, `Compatible.hermitianCore`
  (`TauCeti/Geometry/Symplectic/Hermitian.lean`) and `AlmostComplexStructure.complexModule`.
- `TauCeti.TotallyRealLoop.maslovIndex` (`TauCeti/LinearAlgebra/TotallyReal/Maslov/Index.lean`):
  the degree of the loop of Maslov phases `ρ(Λ 0, Λ t)` of a loop Λ of maximal totally real
  subspaces, where `ρ(L₀, A L₀) = det A / conj(det A)`, so that the rotated line `e^(iθ)L₀` in
  ℂⁿ has phase `e^(2inθ)` relative to `L₀`.

### From TauCetiRoadmap.DifferentialGeometry

Layer 0.3 and Layer 1 (forms as smooth sections of the bundle of continuous alternating maps,
wedge, exterior derivative, pullback, Cartan identities), Layer 5.1–5.4 (oriented integration with
outward-first boundary orientation, Stokes, the homotopy operator and its pullback naturality),
8.3 (the carrier `SmoothSimplex I M p`, the real chain complex, `exists_smoothSimplex_homotopicRel`,
smoothing and chain homotopies, under finite dimension, `T2Space` and `SigmaCompactSpace`), 8.4
(integration over smooth chains), 9.3 (closed fundamental-class evaluation), 12.1 and 12.4 (pullback
metrics of immersions and their Riemannian volume forms) and 12.5 (the divergence theorem with
boundary).

### From TauCetiRoadmap.AlgebraicTopology

Stage 2 (integral singular chains, face maps, relative chains), Stage 3.1 (subdivision and prism
homotopies), Stage 6.3 (orientations and fundamental classes, with the outward-first boundary
comparison coordinated with DifferentialGeometry).

### From TauCetiRoadmap.SuccessiveMinima

0.1.2 `hermitian_gram_hadamard`, for any finite family in a normed `RCLike` inner-product space
(dependent and empty families allowed): `0 ≤ Re det Gram(v) ≤ Π‖v_i‖²`.

### From TauCetiRoadmap.RiemannianGeometry

R1 (Levi-Civita connection, normal bundles, second fundamental form), R5a.1
`volumeVariation_isContDiff` (C² dependence of the relative volume of a variation, on
orientation-free densities, with one fixed compact variation support on noncompact sources), and
R5a.2 (first variation and averaged mean curvature).

### From TauCetiRoadmap.GeometricTopology

Layer 1 (tubular neighbourhoods and their normal exponential description) and the smoothing and
triangulation comparison item 1 (existence of smooth triangulations of smooth manifolds).

### From TauCetiRoadmap.ComplexKahlerGeometry

K1 and K2 (complex tangent and type calculus), K4 (Hermitian bundles and canonical bundles), K5a
(the Gram form metric, real star and density line, the real and complex distributional Sobolev
scales, and compact real de Rham Hodge theory on a real manifold of any dimension, with L² pairing,
harmonic projection and Green inverse), K5b.0 (local Hermitian identities, including the Hermitian
volume of complex planes), K6.1 (the analytic-cycle normalization on the regular locus).

### From TauCetiRoadmap.PseudodifferentialOperators

P1.0 (differential operators and formal adjoints), P5 (bundle Hölder carriers and mapping
estimates) and P6 (elliptic Schauder estimates, Sobolev Fredholm realizations and regularity).

### From TauCetiRoadmap.PDE

A.1 and A.2 (weak-derivative Sobolev spaces, `W^{1,2}_0` as a closure), A.4 (Sobolev embeddings with
interior cutoffs), A.5 (Poincaré), A.7 (local Euclidean Hölder spaces) together with the
Campanato/Morrey characterization of Hölder spaces that PDE's build inventory assigns to its Hölder
item, D.16–D.17 (the scalar energy form and coercive Lax–Milgram existence), E.22 (Schauder estimates
for scalar operators with Hölder coefficients). All are scalar; Layer 6 extends them componentwise to
`ℝᵐ`-valued maps.

### From TauCetiRoadmap.SmoothBundlesConnections and RepresentationTheory/LieGroups

SmoothBundlesConnections B1.4 (smooth quotients by free proper actions), B2 (structure-group
reductions) and B5 (holonomy); LieGroups Layer 2 (the closed-subgroup theorem).

### From TauCetiRoadmap.CharacteristicClasses, TopologicalKTheory and GeneralizedCohomology

CharacteristicClasses C1.1a (the finite oriented cover of TopologicalKTheory T1.5's coordinate
Grassmannian, with the rank-zero sign datum kept separate), TopologicalKTheory T1.5 (finite real
Grassmannians and Stiefel quotients), GeneralizedCohomology G4.0b (the graph-chart smooth
structure on those Grassmannians).

## How to read the build

Layer 1 is pure finite-dimensional linear algebra and precedes everything. Layer 2 builds smooth
calibrations, calibrated immersions and the integral smooth-chain machinery; Layer 3 combines them
with Stokes into the fundamental theorem and stability. Layer 4 needs only Layer 1 for its linear
core (the Wirtinger inequality) and Layers 2–3 for its manifold consequences. Layer 5 does the same
for the special Lagrangian calibration and adds the phase and mean-curvature theory. Layer 6 uses
Layer 5, ComplexKahlerGeometry K5a's compact Hodge theory, PseudodifferentialOperators' Hölder
estimates and PDE's scalar estimates to prove McLean's theorem and the second-variation identity.

## Layer 1: Comass and equality planes (C1)

Throughout, E is a real inner-product space and φ a continuous alternating real k-form on E, a
`ContinuousAlternatingMap` `E [⋀^Fin k]→L[ℝ] ℝ`.

### 1.1 Comass and the native norm

Define the comass of φ as `sup{|φ(v₁,…,v_k)| : (v_i) orthonormal}`. On a finite-dimensional E,
prove that comass equals the native operator norm; this is `norm_eq_sSup_abs_orthonormal`, stated
in every degree k (both sides vanish for `k > dim E`; for k = 0 both are `|φ ![]|`). The route: the
comass form of 1.2's inequality, which uses only the definition of comass, bounds `|φ v|` by
`comass(φ)·frameVolume v ≤ comass(φ)·Π‖v_i‖` through `hermitian_gram_hadamard`, which gives the norm
bound, and orthonormal frames give the reverse inequality. Consume the native norm's triangle inequality, homogeneity, definiteness and normed-space
structure through this equality; no competing norm is installed (Harvey–Lawson 1982, II.(3.1),
p. 56, uncertified; McLean1998, line 27).
*Needs:* Mathlib `ContinuousAlternatingMap.norm_def`, `ContinuousAlternatingMap.norm_constOfIsEmpty`;
the comass form of 1.2; SuccessiveMinima 0.1.2.

- On a finite-dimensional E, the frames `Fin k → E` that are orthonormal form a compact subset; the
  evaluation `v ↦ φ v` is continuous on it; for `k ≤ dim E` the comass is attained; comass is finite.
- For `k > dim E` every k-form is zero and has comass zero. For k = 0 the comass is the absolute
  value of the constant.
- Comass is invariant under pullback along a `LinearIsometryEquiv`; along a linear isometric
  embedding the pulled-back form has comass at most that of φ; along a general linear map L the
  operator bound `‖L*φ‖ ≤ ‖φ‖·‖L‖^k` is Mathlib's
  `ContinuousAlternatingMap.norm_compContinuousLinearMap_le`.

**Checks.**

- On ℝ⁴ the form `dx₁∧dx₂ + dx₃∧dx₄` has comass 1, attained at `(e₁,e₂)`; its coefficient Hilbert
  norm is `√2`, so a definition through the Hilbert norm gets 1.3's comparison wrong.
- The 0-form with constant value −3 has comass 3 (absolute value, not the signed value).
- Every 3-form on ℝ² is zero; the comass formula over an empty set of orthonormal 3-frames must
  return 0, not `−∞` or junk.
- On ℝ², `2 dx₁∧dx₂` has comass 2, and `dx₁∧dx₂` evaluated on the non-orthonormal frame
  `((2,0),(0,3))` gives 6: the supremum must be over orthonormal frames only.

### 1.2 Frame volume and the linear calibration inequality

Define `frameVolume v`, for `v : Fin k → E` in any real inner-product space, as `LinearMap.normDet`
of the linear map `ℝᵏ → E` sending the standard basis vector `e_i` to `v_i`. Prove
`|φ(L e₁,…,L e_k)| ≤ comass(φ)·LinearMap.normDet L` for every linear `L : ℝᵏ → E`, including the
rank-deficient case where both sides vanish; for frames this is
`abs_eval_le_norm_mul_frameVolume` on finite-dimensional E. The route: restrict to the range of L,
use the native Gram and range-restriction identities, and an orientation-preserving
orthonormalization (Harvey–Lawson 1982, Lemma II.3.5, p. 57, uncertified). The comass form needs only
the definition of comass; the norm form `abs_eval_le_norm_mul_frameVolume` then follows from 1.1.
*Needs:* Mathlib `LinearMap.normDet`, `LinearMap.normDet_sq_eq_det_gram`; the definition of comass
(1.1) for the comass form, and `norm_eq_sSup_abs_orthonormal` for the norm form.

- `frameVolume v = sqrt(det Gram(v))`; it vanishes exactly when v is linearly dependent; the empty
  frame has volume 1.
- `frameVolume` is invariant under linear isometries of E and under permutation of the frame, and
  scales by `|c|` when one vector is multiplied by c.
- `frameVolume v ≤ Π‖v_i‖`, from SuccessiveMinima 0.1.2.

**Checks.**

- The empty frame has volume 1 (normDet of the map from the zero space).
- The dependent frame `(v, v)` with v ≠ 0 has volume 0, while the product of norms is `‖v‖²`.
- `((2,0),(0,3))` in ℝ² has volume 6.
- `((1,0),(1,1))` has Gram matrix `[[1,1],[1,2]]` and volume 1, while `Π‖v_i‖ = √2`: a definition
  through the product of norms is wrong.

### 1.3 The exterior-power formulation

Identify a k-form with an element of the exterior power through
`exteriorPower.alternatingMapLinearEquiv` and the Riesz isomorphism of the Gram inner product.
Prove the simple-multivector form of 1.2, `|⟪φ̂, v₁∧⋯∧v_k⟫| ≤ comass(φ)·|v₁∧⋯∧v_k|`, and the
comparison of comass with the coefficient Hilbert norm `|φ|_H`,
`comass(φ) ≤ |φ|_H ≤ sqrt(binomial(dim E, k))·comass(φ)`, including the zero-space and `k > dim E`
cases (Harvey–Lawson 1982, II.(3.1), p. 56, uncertified).
*Needs:* Mathlib `exteriorPower.alternatingMapLinearEquiv`, `exteriorPower.inner_ιMulti_ιMulti`; 1.1.

**Checks.**

- In degree 1 comass and Hilbert norm coincide (`binomial(n,1)` is not attained).
- `dx₁∧dx₂ + dx₃∧dx₄` on ℝ⁴: `1 ≤ √2 ≤ √6`.
- The unit decomposable form `dx₁∧⋯∧dx_k` has comass 1 and Hilbert norm 1: the lower bound is
  attained.

### 1.4 The oriented Grassmannian and the Stiefel manifold

Define the oriented Grassmannian of a general E as the sigma type of rank-k subspaces P with an
`Orientation ℝ P (Fin k)`, topologized for k ≥ 1 as the quotient of the positive orthonormal-frame
space. Define the smooth Stiefel manifold of orthonormal k-frames as the level set `Gram = I`,
proving it regular by showing the differential of the Gram map is onto symmetric matrices through the
frame variation `vA/2`. Construct the free proper SO(k) action and use SmoothBundlesConnections B1.4
for the quotient atlas. For k = 0 the carrier is the two orientation rays of `⋀⁰`; for `k = dim E`
it is the two orientations of E.

Compare with the coordinate carriers through a linear isometry ι to `EuclideanSpace` followed by the
`WithLp` linear equivalence to TopologicalKTheory T1.5's coordinate module. The comparison depends on
ι: the target action is `g ↦ ιgι⁻¹`, and replacing ι by ι′ composes the comparison with `ι′ι⁻¹`.
Prove that forgetting orientation is a smooth two-sheeted cover of the T1.5 real Grassmannian
transported along ι, with GeneralizedCohomology G4.0b's graph-chart smooth structure, and compare the
quotient and pulled-back graph atlases. For k ≥ 1 identify this oriented carrier, transported along
ι, with CharacteristicClasses C1.1a's finite oriented cover of the T1.5 Grassmannian, as covers of
that Grassmannian preserving both orientations of each plane. For k = 0 compare with C1.1a's
two-point sign datum: the canonically oriented zero plane is one of the two rays, and no bijection
with a single point is asserted. The 0-form `c` evaluates to `±c` on the two rays; the empty frame
selects only the canonical ray.
*Needs:* Mathlib `Orientation`, `Matrix.gram`; SmoothBundlesConnections B1.4; TopologicalKTheory
T1.5; GeneralizedCohomology G4.0b; CharacteristicClasses C1.1a.

- The oriented Grassmannian is compact for finite-dimensional E, and the orientation-forgetting map
  is a two-sheeted covering for `1 ≤ k`; orientation reversal is its deck involution.
- The Stiefel manifold has dimension `k·dim E − k(k+1)/2`.
- The comparison with C1.1a commutes with orientation reversal and with the isometry action.

**Checks.**

- k = 1 in ℝ: the oriented Grassmannian has two points (the two orientations of ℝ), and C1.1a's
  finite cover of the one-point Grassmannian has two points; the fixed-rank stable classifier
  `BSO(1)` is a point, so it is not the comparison target.
- k = 2 in ℝ³: the oriented Grassmannian is a 2-sphere (via the oriented unit normal) and the
  Stiefel manifold has dimension `6 − 3 = 3`.
- k = 0: two orientation rays, not one point; `k = dim E = 2`: two points.

### 1.5 Equality planes and calibrated frames

An ordered frame v satisfies `IsCalibratedFrame φ v` when it is orthonormal and `φ v = 1`. For a
form of comass at most one these are exactly the positively oriented orthonormal frames of the
equality planes of φ. On the oriented Grassmannian construct the closed equality locus
`{P : φ(positive orthonormal frame of P) = 1}` when `comass(φ) ≤ 1` (Harvey–Lawson 1982, the
contact set II.(3.3), p. 57, uncertified; Joyce2001SLLectures, Definition 2.1, line 53).
*Needs:* 1.1, 1.4.

- A zero form has no equality planes for `1 ≤ k ≤ dim E`.
- A unit decomposable form `e₁*∧⋯∧e_k*` has exactly its positively oriented supporting plane; `−φ`
  has the same plane with the reversed orientation.
- `IsCalibratedFrame` is invariant under pullback by linear isometries and under precomposition of
  the frame with an element of SO(k).

**Checks.**

- `dx₁∧dx₂` on ℝ³: `(e₁,e₂)` is calibrated, `(e₂,e₁)` gives −1, `(e₁,e₃)` gives 0.
- The non-orthonormal frame `((2,0,0),(0,1/2,0))` gives value 1 for `dx₁∧dx₂` but is not calibrated:
  orthonormality is part of the definition.
- k = 0 and `φ = 1`: the empty frame is calibrated; for `φ = −1` nothing is.

### 1.6 External products

For forms φ on E and ψ on F, construct the external product on the orthogonal direct sum `E ⊕ F`,
prove the exact evaluation on a concatenated product frame (first factor first), and the bound
`comass(φ∧ψ) ≤ binomial(k+l,k)·comass(φ)·comass(ψ)`. If one factor is a unit decomposable volume
form, prove `comass(φ∧ψ) = comass(ψ)` and the product calibration theorem: the equality planes are the
products of the factors' equality planes (Harvey–Lawson 1982, Proposition II.7.10, p. 76,
uncertified). For general factors, a product calibration statement carries
an explicit hypothesis `comass(φ∧ψ) ≤ 1`: orthogonal support alone does not imply it (Zust2025Products,
Corollary 1.4, p. 2, line 74; Theorem 1.2, line 59, for the low-degree cases in which equality holds).
*Needs:* 1.1, 1.5.

**Checks.**

- `dx₁ ∧ dx₂` as external product of `dx` on ℝ and `dx` on ℝ: comass 1 and evaluation 1 on
  `(e₁,e₂)`, −1 on `(e₂,e₁)`, while the binomial bound gives `binomial(2,1) = 2`.
- The standard Kähler forms `ω₁` on ℂ and `ω₂` on ℂ give `ω₁∧ω₂ = dx₁∧dy₁∧dx₂∧dy₂`, comass 1 (the frame
  `(e₁,ie₁,e₂,ie₂)` evaluates to 1), while the binomial bound gives `binomial(4,2) = 6`.
- Negative control: orthogonally supported copies of Züst's 8-form Φ on ℝ¹⁶ have comass of their
  product at least `294/256 > 1 = comass(Φ₁)·comass(Φ₂)` (Zust2025Products, line 76).

### Examples

`frameVolume` of `((1,0,0),(1,1,0))` in ℝ³ is 1, and `dx₁∧dx₂` evaluates to 1 on it: equality in
`abs_eval_le_norm_mul_frameVolume` without the frame being orthonormal.

### Dependencies

Mathlib and SuccessiveMinima 0.1.2 for 1.1–1.3 and 1.5–1.6; SmoothBundlesConnections B1.4,
TopologicalKTheory T1.5, GeneralizedCohomology G4.0b and CharacteristicClasses C1.1a for 1.4 only.

## Layer 2: Calibrated immersions and integral smooth chains (C2)

### 2.1 Smooth calibrations

Define a smooth calibration on a Riemannian manifold M as a smooth k-form φ with `dφ = 0` and
`comass(φ_x) ≤ 1` at every point x, comass taken in the metric `g_x` (Joyce2001SLLectures,
Definition 2.1, line 58). Prove its preservation by Riemannian isometries and restriction to open
sets. For a parallel form, the pullback of φ at an endpoint by metric parallel transport equals φ at
the start; own the torsion-free covariant exterior-derivative identity `dφ = Alt(∇φ)`, deduce
`dφ = 0` for parallel φ, and prove that comass is constant on each connected component. A general
closed calibration need not be parallel.
*Needs:* DifferentialGeometry Layers 0.3 and 1; RiemannianGeometry R1; 1.1.

**Checks.**

- `dx₁∧dx₂` on ℝ³ is a smooth calibration.
- `2 dx₁∧dx₂` is closed with comass 2: not a calibration.
- `x₃ dx₁∧dx₂` fails both conditions: `d(x₃ dx₁∧dx₂) = dx₁∧dx₂∧dx₃ ≠ 0`, and its comass is `|x₃|`.

### 2.2 Calibrated immersions

For an oriented smooth immersion `f : Nᵏ → M`, define f to be calibrated by φ when
`f*φ = dvol_(f*g)`. Prove equivalence with `IsCalibratedFrame φ (df(v))` for every positive
orthonormal tangent frame v of `f*g`, and with the tangent-plane condition of 1.5. The equation is
independent of oriented charts and parametrization: prove its transport under
orientation-preserving diffeomorphisms of N and its sign change under orientation reversal. Prove the
pointwise inequality `f*φ ≤ dvol_(f*g)` and its absolute version, and the integrated inequality
`∫_N f*φ ≤ Vol(N)` on compact sources (Harvey–Lawson 1982, Lemma II.3.5, p. 57, uncertified); for
noncompact sources the statement carries finite volume and
integrability hypotheses, since calibratedness does not imply finite volume (Joyce2001SLLectures,
Definition 2.1, line 62).
*Needs:* DifferentialGeometry 5.1–5.2, 12.1, 12.4; 2.1.

**Checks.**

- The plane `x₃ = 0` in ℝ³ with orientation `(e₁,e₂)` is calibrated by `dx₁∧dx₂`; with the reversed
  orientation, `f*φ = −dvol`.
- The plane `x₃ = x₁` gives `f*φ = dvol/√2`: strict inequality.
- The line `ℝ·(1,1)/√2` in ℝ² is calibrated by `(dx₁+dx₂)/√2` and not by `dx₁`.

### 2.3 Integral smooth chains

On DifferentialGeometry 8.3's carrier `SmoothSimplex I M p`, construct the integral chain complex
with chains `SmoothSimplex I M p →₀ ℤ`, the alternating face boundary and `∂∂ = 0`. Construct the
coefficient-change map to 8.3's real complex, the integral smooth-to-singular comparison into
AlgebraicTopology Stage 2's integral singular chains, subdivision and pushforward naturality, and
prove that integration agrees after coefficient change. Prove that the integral smooth-to-singular
comparison is a quasi-isomorphism: construct ℤ-module chain maps and chain homotopies on the finitely
supported integer generators from 8.3's simplex-level `exists_smoothSimplex_homotopicRel` data, with
one shared face-compatible choice function and the same subdivision and prism triangulations as 8.3,
so that the coefficient-change squares commute literally. Prove both chain-homotopy identities over
ℤ, the relative, subdivision and naturality laws, and specified chain homotopies comparing different
choices. Inclusions and induced smooth-chain maps are strictly natural; smoothing inverses and choice
comparisons have explicit naturality chain homotopies. 8.3's operators are real-linear only; the
integral isomorphism is not obtained by tensoring a real comparison backwards.

Define the mass of a parametrized smooth simplex as the integral over the standard simplex of the
native norm determinant of its differential, and of a chain as the sum of absolute coefficients times
masses. Prove subdivision, smooth reparametrization and orientation compatibility, and
`|∫_c φ| ≤ mass(c)` for a smooth calibration φ.
*Needs:* DifferentialGeometry 8.3, 8.4; AlgebraicTopology Stages 2 and 3.1; Mathlib
`LinearMap.normDet`; 1.2, 2.1.

**Checks.**

- For a smooth 2-simplex σ, `∂∂σ = 0` with the face signs `(−1)^i`; dropping the signs gives
  `∂∂σ ≠ 0` in general.
- The integral chain `2σ` maps to `2σ` under coefficient change; the real comparison cannot see the
  torsion `H₁(ℝP²; ℤ) = ℤ/2`, which the integral comparison must preserve.
- A constant simplex has mass 0; the 1-simplex `t ↦ 2t` in ℝ has mass 2; the folded 1-simplex
  `t ↦ |2t−1|` has mass 2 while its image has length 1: mass counts multiplicity.

### 2.4 Ordered relative triangulations and fundamental chains

Prove that every compact smooth manifold N with boundary admits a smooth triangulation, a finite
simplicial complex K with a homeomorphism `h : |K| → N` restricting to a smooth embedding on each
closed simplex, in which `∂N` is the image of a subcomplex (Munkres1966EDT, Chapter II, §10; the
boundaryless case is GeometricTopology's smoothing and triangulation item 1). Fix a total order on
the vertices of K and parametrize each simplex `[v₀ < ⋯ < v_p]` by h composed with the affine map
sending the standard vertex `e_i` to `v_i`; the face maps of these ordered parametrizations are the
ordered parametrizations of the faces, literally, not only up to reparametrization.

For compact oriented N with boundary, define the integral fundamental chain
`c_N = Σ_σ ε_σ σ` over the top simplices, with `ε_σ = ±1` according as the ordered parametrization
preserves orientation. Prove that every interior facet occurs in `∂c_N` twice as the same
parametrized generator with opposite coefficients, so that `∂c_N = c_(∂N)` with outward-first
orientation, and that `∫_(c_N) η = ∫_N η` for every compactly supported top form η. Prove
independence of refinement and of choices up to an explicit boundary. The closed-source homology
version consumes DifferentialGeometry 9.3 and AlgebraicTopology 6.3; the integral chain statements
precede their real corollaries.
*Needs:* GeometricTopology smoothing item 1 (boundaryless case); DifferentialGeometry 5.1, 5.2,
8.3, 8.4, 9.3; AlgebraicTopology 6.3; 2.3.

**Checks.**

- The oriented unit square with vertices `a=(0,0) < b=(1,0) < c=(0,1) < d=(1,1)` and triangles
  `[a,b,d]`, `[a,c,d]`: the orientation signs are `+1` and `−1` (determinants 1 and −1), the
  diagonal `[a,d]` appears in `∂c` as the same generator with coefficients `−1` and `+1`, and
  `∂c = [a,b] + [b,d] − [c,d] − [a,c]`, the counterclockwise boundary.
- A triangulation whose two triangles parametrize the diagonal with opposite vertex orders leaves
  `[a,d] + [d,a]` in `∂c`, which is not zero in the free module: the global vertex order is
  necessary.
- For the interval `[0,1]`, `c = [0,1]` and `∂c = [1] − [0]`, the outward-first boundary.

### Examples

The standard 2-simplex `Δ² ⊂ ℝ²` with vertices `e₀ = (0,0) < e₁ = (1,0) < e₂ = (0,1)` and the
trivial triangulation has `c = [e₀,e₁,e₂]` with sign +1, `∂c = [e₁,e₂] − [e₀,e₂] + [e₀,e₁]`, and
`∫_c dx∧dy = 1/2`.

### Dependencies

2.1 needs Layer 1 and DifferentialGeometry 0.3/1; 2.2 needs 2.1; 2.3 needs DifferentialGeometry 8.3
and AlgebraicTopology Stages 2 and 3.1; 2.4 needs 2.3.

## Layer 3: Volume minimization and stability (C3)

### 3.1 The fundamental theorem of calibrations

Let φ be a smooth calibration on M, N a compact oriented k-submanifold (or immersion) calibrated by
φ and N′ a compact oriented competitor with the same boundary, and suppose
`c_N − c_(N′) = ∂B` for a finite integral smooth chain B, parametrizations and multiplicities
included. Prove `Vol(N) ≤ mass(c_(N′))`, and `Vol(N) ≤ Vol(N′)` for embedded N′: Stokes gives
`∫_N φ = ∫_(N′) φ` and 2.2 gives `∫_(N′) φ ≤ Vol(N′)` (Harvey–Lawson 1982, Theorem II.4.2,
p. 59, uncertified; McLean1998, line 32). Prove equality exactly when N′ is calibrated with the
specified
orientation, through the nonnegative continuous defect `dvol − f*φ` and its zero-integral criterion.
Give the homology-class version on closed sources through DifferentialGeometry 9.3 and the
smooth-to-singular comparison of 2.3. For competitors agreeing outside a compact region, require that
their compact difference bounds a finite integral smooth chain there, or a compactly supported
homotopy supplying one, and construct that relative chain comparison.
*Needs:* DifferentialGeometry 5.2, 8.4; 2.2, 2.3, 2.4.

- Agreement outside a compact region alone does not give the bounding-chain hypothesis.
- A noncompact homology statement is not a finite integral hypothesis and is not asserted.

**Checks.**

- The flat disk `{x₃ = 0, |x| ≤ 1}` in ℝ³ and the upper unit hemisphere have the same boundary; the
  disk is calibrated by `dx₁∧dx₂`, and `π ≤ 2π`.
- The same disk with reversed orientation is not calibrated, and the theorem gives nothing.
- The graph over the disk of a smooth bump function vanishing near the boundary circle has the same
  boundary and strictly larger area; it is not calibrated, consistent with the equality case.

### 3.2 Variations and stability

For a compactly supported variation `f_t` with fixed boundary, prove that `∫ f_t*φ` is constant
through DifferentialGeometry 5.4's homotopy operator, its pullback naturality and Stokes. Consume
RiemannianGeometry R5a.1's C² dependence of `Vol(f_t)` and compare its relative-density functional and
its derivatives with 2.2's oriented integration. Define a minimal immersion to be stable when the
second derivative of volume at zero is nonnegative for every compactly supported variation fixing the
boundary; a volume minimum is stable by elementary calculus. Use R5a.2's first variation for
compactly supported interior variations to obtain `H = 0` for calibrated immersions, and
DifferentialGeometry 12.5's divergence theorem for fixed-boundary variations, whose variation field
vanishes on the boundary. Every application states its fixed-boundary or compact-support hypothesis:
arbitrary variations contribute boundary terms.
*Needs:* DifferentialGeometry 5.4, 12.5; RiemannianGeometry R5a.1, R5a.2; 3.1.

**Checks.**

- The flat disk in ℝ³ has `H = 0` and second variation `∫|∇u|² ≥ 0` for normal variations `u e₃`
  vanishing on the boundary.
- A variation moving the boundary of the disk outward changes its area at first order: the
  fixed-boundary hypothesis is needed.
- For m ≥ 1 the round equator `Sᵐ ⊂ S^(m+1)` is minimal, but its constant unit normal variation has
  volume `cos(t)^m Vol(Sᵐ)` and second derivative `−m·Vol(Sᵐ) < 0`; so it is unstable and is not
  calibrated by any closed ambient form.

### 3.3 Products and the distinction from minimality

Derive the Riemannian product calibration theorem under 1.6's decomposable-factor or explicit
product-comass hypotheses, and record that a stationary minimal submanifold need not be calibrated
(the round equator of 3.2).
*Needs:* 1.6, 3.1, 3.2.

**Checks.**

- `S¹ × {pt}` in the flat torus `S¹ × S¹` is calibrated by `dθ₁` and minimizes length in its
  homology class.
- `{pt} × S¹` is calibrated by `dθ₂`, and the diagonal circle `t ↦ (t,t)` by `(dθ₁+dθ₂)/√2`.
- The round equator `S¹ ⊂ S²` is minimal and not calibrated (second variation `−2π`).

### Examples

A compact calibrated surface in the flat 3-torus: the coordinate 2-torus `T² × {pt}` minimizes area
in its homology class, by `dx₁∧dx₂`.

### Dependencies

3.1 needs 2.2–2.4; 3.2 needs 3.1 and RiemannianGeometry R5a; 3.3 needs 1.6 and 3.2.

## Layer 4: Hermitian linear algebra and Kähler calibrations (C4)

### 4.1 The Wirtinger inequality in degree two

Define `standardKahlerForm n`, the standard Kähler form on ℂⁿ, as the real continuous alternating
2-form `ω(v,w) = Im⟪v,w⟫_ℂ`. Prove `norm_standardKahlerForm`: for n ≥ 1 it has comass one, by
Cauchy–Schwarz, `ω(v,w) ≤ sqrt(g(v,v)g(w,w) − g(v,w)²)`. Prove
`isCalibratedFrame_standardKahlerForm_iff`: an ordered pair `(v,w)` is calibrated exactly when
`‖v‖ = 1` and `w = iv`; for independent v, w equality is equivalent to their positively oriented plane
being J-invariant (Harvey–Lawson 1982, Theorem II.6.11, p. 70, for p = 1, uncertified; McLean1998,
line 43). The proof uses no
complex atlas, integrability or closedness.
*Needs:* Mathlib inner-product API; 1.1, 1.5.

**Checks.**

- n = 1: `ω(1,i) = 1`, `ω(i,1) = −1`, `ω(1,1) = 0`.
- n = 0: the form is zero and has comass 0, so the comass statement needs `1 ≤ n`.
- n = 2: `(e₁, e₂)` gives 0 (a real plane), `(e₁, i e₁)` gives 1.

### 4.2 The Wirtinger inequality in every degree

Define `kahlerBivector n`, the 2-vector `ω̂ = Σ_j e_j ∧ i e_j` in `⋀[ℝ]^2 ℂⁿ`, the metric dual of
ω: `⟪ω̂, v∧w⟫ = Im⟪v,w⟫_ℂ`. Define `kahlerPowerForm n r`, the normalized Kähler power `ωʳ/r!`, as
the real continuous alternating 2r-form `v ↦ ⟪ω̂ʳ, v₀∧⋯∧v_(2r−1)⟫ / r!`, with `ω̂ʳ` the r-th power
in the exterior algebra and the Gram inner product on `⋀[ℝ]^(2r)`. Define `complexRealFrame u`, for
`u : Fin r → ℂⁿ`, as the real frame `(u₀, iu₀, u₁, iu₁, …)`.

Prove `norm_kahlerPowerForm`: for `r ≤ n`, `ωʳ/r!` has comass one. Prove
`isCalibratedFrame_kahlerPowerForm_iff`: a frame v of 2r vectors is calibrated by `ωʳ/r!` exactly when
it is real-orthonormal and `exteriorPower.ιMulti` takes the same value on v as on `complexRealFrame u`
for some complex-orthonormal u; that is, v is a positively oriented orthonormal frame of a complex r-plane with its complex
orientation (Harvey–Lawson 1982, Theorem II.6.11 and Lemma II.6.13, p. 70, uncertified; McLean1998,
lines 37–48). The route: restrict ω
to the real 2r-plane P, put the skew-adjoint restriction of the complex structure in real normal
form with angles `cos θ_j`, so that `ωʳ/r!` on P is `Π_j cos θ_j ≤ 1`, with equality exactly when
every `θ_j = 0`, that is when P is J-invariant and oriented by the complex orientation. Construct the
real skew normal form and its Pfaffian/volume comparison here, consuming the native
finite-dimensional adjoint, spectral and determinant APIs. Transport to every finite-dimensional
Hermitian vector space by a unitary isomorphism with ℂⁿ, and prove naturality under Hermitian
isometries; the transported form is `ωʳ/r!` for the associated form `ω(v,w) = g(Jv,w)`.
*Needs:* Mathlib `exteriorPower.inner_ιMulti_ιMulti`, `Submodule.pow_mem_pow`, spectral theorem;
1.1, 1.5, 4.1.

- `kahlerPowerForm n 1` agrees with `standardKahlerForm n` under `Fin (2·1) = Fin 2`.
- `kahlerPowerForm n r` vanishes for `r > n` (its degree exceeds `2n`).
- `kahlerPowerForm n r` is invariant under the unitary group acting on ℂⁿ.

**Checks.**

- r = 0: the form is the constant 1 (`ω̂⁰ = 1`, empty Gram determinant 1, `0! = 1`), the empty frame
  is calibrated, and comass is 1 even for n = 0.
- n = r = 2: `ω̂² = 2·(e₁∧ie₁∧e₂∧ie₂) + (terms orthogonal to it)`, so `(e₁,ie₁,e₂,ie₂)` evaluates to
  `2/2! = 1`; without the `1/r!` it would be 2.
- n = r = 2: `(ie₁,e₁,e₂,ie₂)` evaluates to −1 (reversed orientation), and the ordering
  `(e₁,e₂,ie₁,ie₂)` evaluates to −1 too: `complexRealFrame` must interleave `u_j, iu_j`.
- n = 4, r = 2: the real coordinate 4-plane `(e₁,e₂,e₃,e₄)` evaluates to 0 (every Gram row against
  `ie_j` vanishes).
- n = 3, r = 2: the frame `(e₁, ie₁, e₂, cos t·ie₂ + sin t·e₃)` evaluates to `cos t`, which is ±1
  exactly when the plane is complex.
- r = 3 > n = 2: the form is zero and has comass 0, so the comass statement needs `r ≤ n`.

### 4.3 Kähler manifolds and complex submanifolds

For every Kähler manifold, instantiate 4.2 bundlewise with the complex tangent metric and fundamental
form: `ωʳ/r!` is a smooth calibration, closed because `dω = 0` and by the derivation rule for wedge
products. Compare the induced Hermitian metric and volume normalization on complex r-planes with
ComplexKahlerGeometry K5b.0. Prove that a smooth real 2r-submanifold is calibrated by `ωʳ/r!` exactly
when its tangent spaces are complex with their complex orientation; for an embedded submanifold
identify this, through ComplexKahlerGeometry's holomorphic charts and implicit-function comparison,
with being a complex submanifold. Conclude that compact complex submanifolds minimize volume in their
homology class and are stable minimal submanifolds (McLean1998, lines 37–48). Compare with
ComplexKahlerGeometry K6.1's analytic-cycle normalization on the smooth regular locus; singular-set
Stokes and local finite mass remain K6.1's.
*Needs:* ComplexKahlerGeometry K1, K2, K5b.0, K6.1; 3.1, 3.2, 4.2.

**Checks.**

- On ℂʳ × 0 ⊂ ℂⁿ, `ωʳ/r!` restricts to `dx₁∧dy₁∧⋯∧dx_r∧dy_r`.
- The complex product torus with lattice `a_jℤ + i b_jℤ` (`a_j, b_j > 0`) has calibrated volume
  `Π_j a_j b_j`.
- The real torus `ℝ²/ℤ² ⊂ ℂ²/(ℤ² + iℤ²)` has `ω|_T = 0`: its tangent frames give ω-value 0, not 1,
  so it is not calibrated by ω although it is minimal (it is special Lagrangian, Layer 5).

### Examples

The complex line `{z₂ = 0}` in ℂ² is calibrated by ω, so its unit disk, of area π, has least area
among compact oriented surfaces with the same boundary circle that differ from it by the boundary of
a finite integral smooth chain (3.1).

### Dependencies

4.1 and 4.2 need only Layer 1; 4.3 needs Layers 2–3 and ComplexKahlerGeometry.

## Layer 5: Special Lagrangian geometry (C5)

### 5.1 Special Lagrangian linear algebra

Define `standardComplexVolume n`, Ω on ℂⁿ as a real continuous alternating n-form with values in ℂ
(`Ω v` is the determinant of the complex matrix whose rows are the coordinate vectors of v), and
`standardSpecialLagrangianForm n θ`, `φ_θ v = Re(e^(−iθ) Ω v)`. For n ≥ 1, prove
`norm_standardSpecialLagrangianForm`: `φ_θ` has comass one. Prove `specialLagrangianFrame_iff`: a
real-orthonormal frame v satisfies `φ_θ v = 1` exactly when it spans a Lagrangian plane
(`Im⟪v_i,v_j⟫_ℂ = 0` for all i, j), `Im(e^(−iθ)Ω v) = 0`, and `Re(e^(−iθ)Ω v) > 0`
(Joyce2001SLLectures, Propositions 2.3 and 2.4, lines 96 and 107, for θ = 0; Harvey–Lawson 1982,
Theorem III.1.10 and Corollary III.1.11, p. 89, uncertified; McLean1998, Proposition 3.2, line 483).
Both the imaginary equation
and the Lagrangian condition are required, and the orientation inequality is not replaced by an
unoriented vanishing equation. The route: for an orthonormal frame `|Ω v| = |det_ℂ v| ≤ 1` with
equality exactly when the frame is complex-orthonormal, that is, Lagrangian.
*Needs:* Mathlib `Matrix.detRowAlternating`, `ContinuousAlternatingMap.restrictScalars`; 1.1, 1.5.

**Checks.**

- n = 1, θ = 0: `φ(z) = Re z`; `z = 1` is calibrated, `z = −1` gives −1, `z = i` gives 0; for
  θ = π/2, `φ(z) = Im z` and `z = i` is calibrated.
- n = 2, θ = 0: `(e₁,e₂)` gives 1; `(ie₁,ie₂)` gives `Re(i²) = −1` and is calibrated for θ = π;
  `(e₁,ie₂)` gives 0 for θ = 0 and is calibrated for θ = π/2.
- n = 2: `(e₁, ie₁)` is orthonormal with `Ω = det[[1,0],[i,0]] = 0`; it is not Lagrangian
  (`Im⟪e₁,ie₁⟫ = 1`) and gives 0.
- n = 0: `φ_θ` is the constant `cos θ`, of comass `|cos θ|`, so the comass statement needs `1 ≤ n`.

### 5.2 The oriented Lagrangian Grassmannian and the symplectic comparison

Construct the oriented Lagrangian Grassmannian `U(n)/SO(n)` through the unitary-frame quotient, its
smooth quotient structure through SmoothBundlesConnections B1.4 and LieGroups Layer 2, its
determinant phase map to U(1), and the fixed-phase fibre `SU(n)/SO(n)` of dimension
`(n² + n − 2)/2` (Joyce2001SLLectures, Proposition 2.3, line 96; McLean1998, Lemma 3.1, line 448).
State the unoriented quotient `U(n)/O(n)` separately and prove that reversing orientation adds π to
the phase. Prove that `[A] ↦ (Aℝⁿ, A_*or)` identifies `U(n)/SO(n)` homeomorphically and smoothly with
the Lagrangian locus in 1.4's oriented Grassmannian, and give the `U(n)/O(n)` comparison with the
unoriented Lagrangian locus.

Prove that `standardKahlerForm` is the pullback of `TauCeti.stdSymplecticForm` along the real-linear
realification `R : ℂⁿ ≃ₗ[ℝ] ℝⁿ × ℝⁿ`, `z ↦ (Re z, Im z)`: use `SymplecticForm.transport` with
`R.symm`, whose evaluation is `ω₀(Rv, Rw)`. Own the finite-dimensional linear equivalence between
alternating `LinearMap.BilinForm` values and Fin-2 continuous alternating maps, with evaluation
`φ(![v,w]) = B(v,w)`, its inverse, linearity, continuity and pullback naturality; through it,
`standardKahlerForm n ![v,w] = (ω₀.transport R.symm) v w`, both sides being
`⟪Re v, Im w⟫ − ⟪Im v, Re w⟫`. Transport the product complex structure by
`AlmostComplexStructure.transport` with `R.symm` and compatibility by `Compatible.transport`; prove
the transported J is multiplication by i, and compare its `AlmostComplexStructure.complexModule`
instance with the complex module of ℂⁿ. Consume `SymplecticForm.complexAssociatedForm` and
`Compatible.hermitianCore` for the conjugate-first Hermitian form `g + iω`. Prove that
`SymplecticForm.IsLagrangian` for the transported form is equivalent to the equations
`Im⟪v_i,v_j⟫ = 0` of `specialLagrangianFrame_iff` on the span of an orthonormal n-frame.
*Needs:* Tau Ceti `TauCeti.stdSymplecticForm`, `SymplecticForm.transport`,
`AlmostComplexStructure.transport`, `SymplecticForm.IsLagrangian`; SmoothBundlesConnections B1.4;
LieGroups Layer 2; 1.4, 5.1.

- The bilinear-to-alternating equivalence is not Tau Ceti's
  `ContinuousAlternatingMap.alternatizeBilinCLM`, which sends an alternating B to `2B`.

**Checks.**

- n = 1: `U(1)/SO(1)` is a circle; the oriented line `e^(iα)ℝ` has `Ω = e^(iα)` and phase α, its
  reverse phase `α + π`; `SU(1)/SO(1)` is a point.
- n = 1, `v = 1`, `w = i`: `standardKahlerForm 1 ![1,i] = 1` and `ω₀((1,0),(0,1)) = 1`.
- `dim U(2)/SO(2) = 4 − 1 = 3` and `dim SU(2)/SO(2) = 2`.
- The symmetric bilinear form `B = ⟪·,·⟫` is not alternating and has no image under the equivalence.

### 5.3 Special Lagrangian submanifolds, phase and mean curvature

For a Kähler n-manifold with a normalized parallel nowhere-vanishing holomorphic n-form Ω, construct
the SU(n)-reduction, compare its metric and volume data with ComplexKahlerGeometry K4's Hermitian and
canonical bundles, and prove that each `φ_θ` is closed and calibrating (McLean1998, lines 450–462).
Derive the special Lagrangian equations `ω|_L = 0`, `Im Ω_θ|_L = 0`, minimality, stability and the
homological volume bound from Layers 2–3.

On an oriented Lagrangian immersion define its U(1)-valued phase without assuming a global real lift,
and build local real lifts. Define the phase class as the pullback under the phase map of the class in
`H¹(U(1); ℤ)` pairing to +1 with AlgebraicTopology's outward-first fundamental class of the circle,
transported to `U(1) ⊂ ℂ`; prove its real de Rham image is `[dθ/2π]`. The classical unoriented Maslov
class uses `det²` on `U(n)/O(n)`, and on oriented Lagrangians it is twice the phase class. For a
loop of Lagrangian planes in ℂⁿ (the tangent planes along a closed curve in an oriented Lagrangian
immersion into ℂⁿ, or a unitary trivialization along the curve) prove that the Maslov class pairs
with the loop to `TauCeti.TotallyRealLoop.maslovIndex`, the degree of its `det²` phase loop, and
hence to twice the phase class; HeegaardFloer F1.4 compares that integer with the Robbin–Salamon
path index. Prove the cocycle and singular/de Rham comparisons. For C² oriented Lagrangian
immersions, construct the second
fundamental form B and `H_tr = trace B` in local coordinates, compare with RiemannianGeometry R5a on
smooth immersions, and with `ω(X,Y) = g(JX,Y)` prove `H_tr = J grad θ` and `ι_(H_tr) ω = −dθ`.
Compare `H_avg = H_tr/n` with R5a's averaged mean curvature, and derive that a connected oriented
Lagrangian has `H = 0` exactly when its phase is constant, hence it is special Lagrangian for that
phase (Harvey–Lawson 1982, Proposition III.2.17, p. 96, uncertified).
*Needs:* ComplexKahlerGeometry K4; RiemannianGeometry R1, R5a; AlgebraicTopology 6.3;
DifferentialGeometry Layers 6 and 8; Tau Ceti `TauCeti.TotallyRealLoop.maslovIndex`; 3.1, 3.2,
5.1, 5.2.

**Checks.**

- The unit circle in ℂ (n = 1) has tangent `ie^(is)` at `e^(is)`, phase `s + π/2`, phase class 1 and
  Maslov class 2; its tangent lines `e^(i(s+π/2))ℝ` have Maslov phase `e^(2is)` relative to the
  tangent line at s = 0, a loop of degree 2, so `TauCeti.TotallyRealLoop.maslovIndex` of the
  tangent loop is 2 and not 1.
- The circle of radius ρ in ℂ: `H_tr` is the inward normal of length `1/ρ`, `grad θ = 1/ρ` along the
  arc-length tangent t, and `J t` is the inward normal: `H_tr = J grad θ`.
- Flat planes, their affine translates and diagonal unitary images `diag(e^(iα_j))ℝⁿ` have constant
  phase `Σ α_j`; the flat torus `ℝⁿ/ℤⁿ` in `ℂⁿ/(ℤⁿ + iℤⁿ)` is special Lagrangian of phase 0.

### 5.4 Gradient graphs

For a gradient graph `y = ∇u(x)` over an open Euclidean domain, prove the Lagrangian equation from the
symmetry of the actual Hessian and `Ω|graph = det(I + i Hess u) dx₁∧⋯∧dxₙ`. Derive the phase equation
`Im(e^(−iθ) det(I + i Hess u)) = 0` with positive real part (Harvey–Lawson 1982, Theorem III.2.3,
p. 91, for θ = 0, uncertified). The derivative of the phase-angle
operator `Σ arctan λ_j` is `tr((I + (Hess u)²)⁻¹ Hess v)`; on a solution, the derivative of the
imaginary determinant residual is this expression times the positive factor
`Re(e^(−iθ) det(I + i Hess u))`. Pin ellipticity on the positive branch (Harvey–Lawson 1982,
Theorem III.2.13, p. 95, uncertified) and the real phase-lift equation `Σ arctan λ_j = θ` up to the
chosen 2π branch. No global Dirichlet existence or branch selection theorem follows from
ellipticity.
*Needs:* Mathlib symmetric second derivative and determinant APIs; 5.1.

**Checks.**

- n = 1, `u = a x²/2`: the graph is the line `y = ax`, `det(1 + ia)` has phase `arctan a`.
- n = 2, `u = x₁x₂`: Hessian eigenvalues ±1, `Σ arctan λ_j = 0`, `det(I + iH) = det[[1,i],[i,1]] = 2`:
  special Lagrangian of phase 0.
- n = 2, `u = (x₁² + x₂²)/2`: `det(I + iI) = (1+i)² = 2i`, phase π/2.

### Examples

The gradient graph of `u = x₁x₂` is the plane `{y₁ = x₂, y₂ = x₁}` in ℂ², spanned by `e₁ + ie₂` and
`e₂ + ie₁`; after normalizing, `Ω = det[[1,i],[i,1]]/2 = 1`, so with the orientation of `(x₁, x₂)`
it is special Lagrangian of phase 0, and each compact piece minimizes area among competitors as in
3.1.

### Dependencies

5.1 needs Layer 1; 5.2 needs 5.1 and Tau Ceti's symplectic linear algebra; 5.3 needs Layers 2–3,
5.2 and ComplexKahlerGeometry; 5.4 needs 5.1.

## Layer 6: Compact special Lagrangian deformations (C6)

Throughout, N is a compact embedded phase-θ special Lagrangian without boundary in the ambient
manifold of 5.3, and k ≥ 2, 0 < α < 1.

### 6.1 Normal parametrization and the deformation map

Choose a tubular neighbourhood (GeometricTopology Layer 1) and parametrize nearby unparametrized
embedded submanifolds by small normal sections. Prove that this induces a homeomorphism onto a
neighbourhood in the C¹ quotient by reparametrization; transition laws between tubular choices hold
in the C¹ and C∞ topologies and on the smooth solution charts of 6.4, not in the full Hölder Banach
topology. Through `β = ι_V ω|_N`, identify the normal bundle with T*N, proving its sign in the fixed
convention (McLean1998, Corollary 3.3 and Remark 3.4, lines 486 and 493). Construct the nonlinear map

    V ↦ (exp_V* ω, exp_V* Im(e^(−iθ)Ω))

by pullback along the actual normal exponential embedding (McLean1998, lines 539–550). Prove that both
components are closed and lie in the Hölder closed-form subspace L²-orthogonal to the harmonic forms
(McLean1998, Lemma 3.12, line 580), using DifferentialGeometry 1.2, 5.3 and 5.4's C²-map/C¹-form
homotopy and Stokes theorems on `exp_(tV)`, not by assigning a de Rham class to a Hölder form.
Derive the derivative `β ↦ (dβ, −d(★β))` at zero, where ★ is the source Hodge star; the second
component equals `(δβ) dvol_N` for the codifferential `δ = d†`, compared with ComplexKahlerGeometry
K5a's formal-adjoint convention (McLean1998, Theorem 3.6 proof, line 572).
*Needs:* GeometricTopology Layer 1; DifferentialGeometry 1.2, 5.3, 5.4; ComplexKahlerGeometry K5a;
5.3.

**Checks.**

- In the positive flat plane ℝⁿ ⊂ ℂⁿ, `V = Σ a_j ∂_(y_j)` gives `β = −Σ a_j dx_j` and
  `ι_V Im Ω = −★β`.
- For the flat torus and constant a, `exp_V` is a translation and both components of the map vanish.
- The sign of β is fixed by `ω(∂_(y_1), ∂_(x_1)) = −1`.

### 6.2 Hölder Hodge theory on N

Instantiate PseudodifferentialOperators P5's Hölder section carriers. Define `Z_⊥^(k−1,α)` as the
`C^(k−1,α)` forms η with `dη = 0` and L² pairing zero with every harmonic form; in top degree this is
integral zero on each connected component. Prove it is a closed Banach subspace and
`Z_⊥^(k−1,α) = d(C^(k,α))` through the primitive `δGη`. Own the Hölder Green and Hodge-projection
bounds by applying smooth-coefficient Schauder regularity (P6) to the Sobolev Green solution of K5a,
without assuming density of smooth forms in full Hölder spaces. Prove that the derivative of 6.1 has
kernel the harmonic one-forms and restricts to an isomorphism from their complement onto the product
of exact targets, and the d/δ compatibility that makes the two components independently solvable
(McLean1998, lines 589–595).
*Needs:* PseudodifferentialOperators P5, P6; ComplexKahlerGeometry K5a; 6.1.

**Checks.**

- On S¹, `f dθ` lies in `Z_⊥` exactly when `∫ f = 0`; `dθ` itself is harmonic and excluded.
- On two disjoint circles, `f = +1` on one and `−1` on the other has total integral 0 but is not in
  `Z_⊥`: the condition is per component.
- On the flat torus `Tⁿ`, the harmonic one-forms are the constant forms, of dimension n = b₁.

### 6.3 C¹-to-Hölder regularity of nearby minimal graphs

Fix α and an order `k₀ ≥ 2`. Own the C¹-to-Hölder estimates: every C¹ weak solution of the minimal
graph system in a sufficiently small fixed C¹ ball is smooth, with local `C^(k₀,α)` bounds tending to
zero with its C¹ norm. Write the area as `∫ L(x,u,Du)`, set `A = L_p` and `b = L_z`, and derive the
weak Euler–Lagrange equation `div A = b`. Prove that `L_pp` satisfies the Legendre lower bound
`λ|ξ|²` on matrix-valued ξ near the zero graph, with upper bound Λ; at zero it is
`√g g^(ij) g⊥_(μν)`. Own Caccioppoli and the difference-quotient `W^(2,2)` membership and estimate.
Subtract the zero-graph equation before differentiating. For `w = ∂_ℓ u` the differentiated weak
system is

    ∂_i(a^(ij)_(μν) ∂_j w^ν) = ∂_i F^i_μ,
    F^i_μ = −[A^i_(μ,x_ℓ)(x,u,Du) − A^i_(μ,x_ℓ)(x,0,0)] − A^i_(μ,z^ν)(x,u,Du) w^ν
            + δ_(iℓ)[b_μ(x,u,Du) − b_μ(x,0,0)],

with `a = A_p(x,u,Du)`, the derivative of b kept in divergence form. Prove `|F| ≤ C‖u‖_(C¹)` and
`[F]_ζ ≤ C_ζ ‖u‖_(C^(1,ζ))` for every ζ ∈ (0,1). Obtain this system as the τ → 0 limit of the
difference-quotient systems (`a_τ → a` and `F_τ → F` uniformly, `DΔ_τ u ⇀ D∂_ℓ u` in L²); no classical
third derivative is presumed.

**Vector-valued constant-coefficient and Campanato package.** For a constant symmetric Legendre
tensor `a₀`, construct the comparison solution v with `w − v ∈ W^(1,2)_0(B_r)` by Lax–Milgram on the
componentwise `ℝᵐ`-valued `W^(1,2)_0`, consuming PDE A.1, A.2, A.5 and D.16–D.17 for the scalar
setting: construct the componentwise `PiLp 2` inner product `⟨u,v⟩ = ∫(u·v + Du:Du)`, prove that its
norm is equivalent to the componentwise weak-Sobolev norm and complete, and transport solutions and
estimates through this equivalence; A.5 supplies the gradient-form coercivity. Prove the energy decay
`∫_(B_ρ)|Dv|² ≤ C(ρ/r)^n ∫_(B_r)|Dv|²` and the excess decay
`∫_(B_ρ)|Dv − (Dv)_ρ|² ≤ C(ρ/r)^(n+2) ∫_(B_r)|Dv − (Dv)_r|²`, with C depending only on dimensions,
λ and Λ, by difference quotients, Caccioppoli and PDE A.4's Sobolev embedding with interior cutoffs;
these hold for general Legendre tensors, not only diagonal ones.

For the Campanato characterization, consume PDE's scalar statement (PDE Lane A.7 with its build
inventory's Campanato/Morrey item) and extend it componentwise, since `|f − f_(x,ρ)|²` is the sum of
the componentwise squares. Its exact form: let `U ⊂ ℝⁿ` be open, `U′ ⋐ U`, `ρ₀ > 0` with
`dist(U′, ∂U) > ρ₀`, `0 < ζ < 1`, and `f ∈ L²_loc(U; ℝᵐ)`, with
`[f]_(ζ,U′) = sup{ρ^(−n−2ζ) ∫_(B_ρ(x))|f − f_(x,ρ)|² : x ∈ U′, 0 < ρ ≤ ρ₀}` (balls interior to U,
radii positive, `f_(x,ρ)` the ball average). If `[f]_(ζ,U′) < ∞`, then f agrees almost everywhere on
U′ with a unique ζ-Hölder function f̃ on U′, with
`[f̃]_(C^(0,ζ)(U′)) ≤ C [f]_(ζ,U′)^(1/2)` and `sup_(U′)|f̃| ≤ C([f]_(ζ,U′)^(1/2) + ‖f‖_(L²(U)))`;
conversely a ζ-Hölder f has `[f]_(ζ,U′) ≤ C [f]_(C^(0,ζ))²`. Uniqueness holds because two continuous
functions that agree almost everywhere agree everywhere; the statement concerns the a.e. class of f,
and a pointwise Hölder conclusion is asserted only for the continuous representative
(Campanato1963, Teorema I.2, printed p. 183, line 224, with `q = 2`, `λ = n + 2ζ`). Own its
Dirichlet-growth consequence: a `W^(1,2)` function with `∫_(B_ρ(x))|Dw|² ≤ Mρ^(n−2+2ζ)` has a ζ-Hölder
representative, by Poincaré on balls; and the quantitative geometric iteration lemma.

**Iteration.** First apply frozen comparison to the continuous coefficients a and bounded F:
`∫_(B_ρ)|Dw|² ≤ C[(ρ/r)^n + osc_(B_r)(a)²] ∫_(B_r)|Dw|² + C r^n ‖F‖_∞²`. For a chosen γ with
`max(α, 1/2) < γ < 1`, choose the fixed C¹ ball and chart radius so that iteration gives energy growth
exponent `κ₀ = n − 2 + 2γ ∈ (0, n)`; the Dirichlet-growth consequence gives a `C^(0,γ)` representative
of w, with norm controlled by `‖u‖_(C¹)`. This smallness comes from smooth x-dependence and closeness
to the zero graph, without a uniform Hölder modulus for arbitrary C¹ embeddings. Then a and F are
`C^(0,γ)`; own qualitative divergence-form Schauder for this Legendre system: a `W^(1,2)` weak
solution with `C^(0,γ)` coefficients and divergence data has a `C^(1,γ)` representative locally, with
the interior estimate, by freezing at `a(x₀)`, the full tensor excess decay and the Campanato
characterization. Applied to `w = Du` this gives `u ∈ C^(2,γ) ⊂ C^(2,α)` before PDE E.22 and the
higher diagonal bootstrap. Every bound uses the subtracted zero equation and tends to zero with
`‖u‖_(C¹)`. The fixed ball depends only on α, γ, dimensions, λ, Λ and chart data; finitely many charts
cover N, and higher orders need no further shrinking.

**C¹ special Lagrangian graphs.** Define a C¹ phase-θ special Lagrangian graph by its tangent planes
lying in 5.1's positive equality locus, and apply the chain above through the calibration variation
equation, formulated weakly with C¹-form Stokes. Own smooth approximation in the C¹ norm with local
support control, pass calibration integrals and volume comparisons to the limit, and apply Stokes to
the smooth approximations rather than a C²-map pullback theorem to a C¹ map. Every such nearby graph
lies in the `k₀`-chart ball after one `k₀`-dependent shrinking of the C¹ ball. Prove that the C¹ and
C∞ quotient topologies agree on this moduli neighbourhood by uniform higher bounds and Arzelà–Ascoli;
no regularity of arbitrary C¹ embeddings is asserted.
*Needs:* PDE A.1, A.2, A.4, A.5, A.7 and its Campanato item, D.16–D.17, E.22; Mathlib Lax–Milgram;
3.2, 5.1.

**Checks.**

- On `B₁(0) ⊂ ℝ`, `f(0) = 1` and `f = 0` elsewhere: every ball average and every Campanato integral
  is 0, the Hölder representative is 0, while f itself is not continuous; a pointwise reading of the
  characterization is false.
- `f(x) = |x|^ζ` on `B₁(0) ⊂ ℝ` has finite Campanato seminorm of exponent ζ, and infinite for every
  larger exponent.
- `f = sign(x)` on `B₁(0) ⊂ ℝ`: `ρ^(−1−2ζ) ∫_(B_ρ(0))|f|² = 2ρ^(−2ζ) → ∞`, so f has no Hölder
  representative for any ζ > 0.
- Constants have Campanato seminorm 0: the sup bound needs the L² term.

### 6.4 McLean's theorem

Establish `HasStrictFDerivAt` at zero and `ContDiffOn ℝ ∞` on a specified open ball for the map of
6.1 between the spaces of 6.2, with explicit composition, multiplication and normal-exponential
estimates. Keep the real part of `e^(−iθ)Ω` positive on a small C¹ neighbourhood, excluding the zero
set of the phase `θ + π`. Apply `ImplicitFunctionData.contDiffAt_implicitFunction` through the
kernel/complement chart; surjectivity of `d ⊕ d*` on all forms is not asserted. Prove that the
special Lagrangian deformations of N, modulo parametrization and with the local C¹ quotient
topology, form a smooth manifold of dimension `dim H¹(N; ℝ) = b₁(N)`, with tangent space the harmonic
one-forms (McLean1998, Theorem 3.6, line 510, and Corollary 3.9, line 530; Joyce2001SLLectures,
Theorem 5.1, line 678). Construct the L² metric on the tangent spaces and its smooth dependence
(McLean1998, Corollary 3.10, line 532).

Own the C² graph expression for H and prove that the `C^(k,α)` solutions are minimal through 5.3's
phase identity. In local graph coordinates derive the minimal-submanifold system with diagonal
principal part `g^(ij)(x,u,Du) ∂_ij u`, prove uniform ellipticity and apply PDE E.22 componentwise;
own the difference-quotient estimates and Arzelà–Ascoli passage that bootstrap to every higher
order. Prove the parametric gain: on the finite-dimensional chart domain in harmonic one-forms,
`χ ↦ V(χ)` is smooth into `C^(k′,α)` near every point for every `k′ ≥ k`, by recentring,
differentiating the equations and uniform Schauder estimates; this proves smoothness on an open chart
domain rather than inferring it from `ContDiffAt ℝ ∞` at one point. Own the composition estimate with
loss of derivatives and compare tubular choices only on these smooth solution charts; the
reparametrization action is not asserted to be C¹ on all `C^(k,α)` embeddings. Prove chart
compatibility for different k, α and tubular choices, agreement with the local C∞ quotient topology,
and the tangent identification. No unobstructed-moduli conclusion is asserted for other calibrated
geometries or for submanifolds with boundary.
*Needs:* Mathlib `ImplicitFunctionData.contDiffAt_implicitFunction`; PDE E.22; 5.3, 6.1, 6.2, 6.3.

**Checks.**

- The flat special Lagrangian torus `Tⁿ` in `T^(2n)`: the deformations are the n translations in the
  `y`-directions, matching `b₁(Tⁿ) = n` (McLean1998, Corollary 3.7, line 519).
- A compact special Lagrangian with `b₁ = 0` is rigid (McLean1998, Corollary 3.8, line 527).
- For n = 1 a special Lagrangian is a straight closed geodesic of phase θ in a flat 2-torus; its
  deformations are the parallel translates, a 1-dimensional family, `b₁(S¹) = 1`.

### 6.5 Second variation and the Jacobi operator

For a smooth normal variation of closed N, prove that the second variation of volume depends only on
the normal field V, independently of acceleration, since N is minimal. Own the special Lagrangian
identity `δ²Vol(V) = ∫_N (|dβ|² + |δβ|²) dvol` with K5a's Gram exterior norm (McLean1998,
Theorem 3.13, p. 723, line 598). Own the pointwise second-jet calibration identity in an
`Ω_θ`-adapted unitary frame: for a plane graph with infinitesimal matrix A, the second derivative of
`vol − Re Ω_θ` is `(tr A)² + Σ_(i<j)(A_ij − A_ji)²`, by expanding `sqrt(det(I + t²AᵀA))` and
`Re det(I + itA)`, with its coordinate-invariant form on the plane locus. For a curve of frames
`u_i(t)` in the moving ambient tangent spaces, with `S_ij = g(u_i,u_j)` and `W_ij = ω(u_i,u_j)`, prove
`det(S + iW) = |Ω_θ(u)|²` and `(vol − Re Ω_θ)″(0) = |W′(0)|²_Gram + (Im Ω_θ(u)′(0))²` at a positive
orthonormal special Lagrangian frame; the gap and its first derivative vanish there, so this second
jet depends only on the first plane variation. Integrate, use 3.2's constancy of closed-form
integrals, and identify the first variations of ω and `Im Ω_θ` by 6.1's derivative.

Define the normal Jacobi operator `𝒥 = (V ↦ ι_V ω)⁻¹ ∘ (dδ + δd) ∘ (V ↦ ι_V ω)`. Prove its
ellipticity, formal self-adjointness and the Hessian identity by polarization of the second
variation, and identify its kernel with the harmonic one-forms and 6.4's tangent space (McLean1998,
Corollary 3.14, line 603). This construction supplies no second-variation formula for arbitrary
minimal submanifolds.
*Needs:* ComplexKahlerGeometry K5a; PseudodifferentialOperators P1.0; 3.2, 6.1, 6.4.

**Checks.**

- n = 1, `A = (a)`: the plane spanned by `1 + ita` has `vol = sqrt(1 + t²a²)` and `Re Ω = 1`, second
  derivative `a² = (tr A)²`.
- n = 2, `A = diag(1, −1)`: `vol = 1 + t² = Re det(I + itA)`, second derivative 0, matching
  `(tr A)² = 0` and zero antisymmetric part (the graph of a harmonic quadratic is special Lagrangian).
- n = 2, `A = [[0,1],[−1,0]]`: `vol = 1 + t²`, `Re det(I + itA) = 1 − t²`, second derivative 4, equal
  to `(A₁₂ − A₂₁)² = 4`; on the frame side `W₁₂(t) = 2t`, `|W′(0)|² = 4` and `Im Ω = 0`.
- On the flat torus, 𝒥 is the Hodge Laplacian on one-forms with kernel the n constant forms.

### Examples

For the flat special Lagrangian torus `Tⁿ = ℝⁿ/ℤⁿ` in `ℂⁿ/(ℤⁿ + iℤⁿ)`, the moduli space near `Tⁿ` is
the n-torus of vertical translates, its L² metric is the flat metric scaled by `Vol(Tⁿ) = 1`, and
the second variation along `V = Σ a_j ∂_(y_j)` is 0.

### Dependencies

6.1 needs 5.3 and GeometricTopology Layer 1; 6.2 needs PseudodifferentialOperators P5–P6 and
ComplexKahlerGeometry K5a; 6.3 needs PDE and 5.1; 6.4 needs 6.1, 6.2 and 6.3; 6.5 needs 6.1 and 6.4.

## Downstream consumers

- FukayaTheory consumes C2's integral smooth-to-singular comparison on the smooth-simplex carrier.
- GeometricCurrents G1–G3 and G6 consume 1.2–1.3 (the comass/Gram and simple-vector comparison),
  1.4 (the oriented-frame quotient topology of the Grassmannian), 2.3 (the integral smooth-chain
  complex, its smooth-to-singular quasi-isomorphism with the integer generator maps and both
  face-compatible chain homotopies, and the agreement of coefficient change with
  DifferentialGeometry 8.3), 2.4 (finite oriented relative fundamental chains) and 3.1–3.2 (the
  calibration minimum, its stability consequence and the oriented-chain comparison).
- RiemannianGeometry R5a.1's relative-volume functional is consumed by C3; RiemannianGeometry consumes
  nothing from this roadmap.

## References

- Harvey, Lawson, *Calibrated geometries*, Acta Math. 148 (1982), 47–157,
  [doi:10.1007/BF02392726](https://doi.org/10.1007/BF02392726) (HarveyLawson1982, uncertified: cited by
  locator only).
- McLean, *Deformations of calibrated submanifolds*, Comm. Anal. Geom. 6 (1998), 705–747,
  [doi:10.4310/CAG.1998.v6.n4.a4](https://doi.org/10.4310/CAG.1998.v6.n4.a4) (McLean1998; line numbers
  refer to the text of the published version).
- Joyce, *Lectures on special Lagrangian geometry*,
  [arXiv:math/0111111v3](https://arxiv.org/abs/math/0111111v3) (2003; first version 2001)
  (Joyce2001SLLectures; line numbers refer to v3).
- Züst, *A calibration on ℝ¹⁶ and Federer's product question*,
  [arXiv:2503.12402v2](https://arxiv.org/abs/2503.12402v2) (Zust2025Products).
- Campanato, *Proprietà di hölderianità di alcune classi di funzioni*, Ann. Scuola Norm. Sup. Pisa
  17 (1963), 175–188, [Numdam](https://www.numdam.org/item/ASNSP_1963_3_17_1-2_175_0/)
  (Campanato1963).
- Munkres, *Elementary Differential Topology*, Annals of Math. Studies 54 (Munkres1966EDT, cited by
  section).

The mathematical targets and conventions above are authoritative; reference notation does not
override the native carriers or these conventions.
