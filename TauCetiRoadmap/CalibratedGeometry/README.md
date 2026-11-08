# Roadmap: calibrations, volume minimization and special Lagrangian geometry

**Summary.** This roadmap develops smooth calibrated geometry, from its finite-dimensional linear
algebra through volume minimization, the Kähler and special Lagrangian calibrations, and the
deformation theory of compact special Lagrangian submanifolds. A calibration is a closed real
differential form whose value on every oriented orthonormal frame is at most one. Its equality
planes define geometric first-order equations, and closedness converts their pointwise volume
identity into a comparison with competitors. The objects and their pullback, orientation, product,
integration and variation APIs are built independently of the special Lagrangian application.

The roadmap builds on Mathlib's continuous alternating maps, exterior powers with their Gram inner
product, orthonormal families and `LinearMap.normDet`; on Tau Ceti's comass and mass of
k-vectors, Stiefel manifolds and finite oriented Grassmannians, linear symplectic and almost
complex structures, differential forms with their exterior derivative, pullback, integration and
Hodge star, smooth singular simplices, pullback metrics, Riemannian volume forms, normal
exponential maps, complex manifolds, Sobolev spaces and Campanato estimates; and on the
second-variation, Kähler and elliptic carriers of the roadmaps named in the supplier contracts.
Its end theorems are:

- comass as a supremum over orthonormal frames equals the native operator norm, Tau Ceti's
  simple-vector comass (`norm_eq_sSup_abs_orthonormal`, Layer 1);
- the fundamental theorem of calibrations for compact oriented submanifolds and finite integral
  smooth chains, with its real-homology form on closed sources
  (`immersionVolume_le_of_isCalibratedImmersion`, Layer 3);
- the Wirtinger inequality for `ωʳ/r!` in every degree with its equality classification, and the
  volume-minimizing property of compact complex submanifolds of Kähler manifolds
  (`norm_kahlerPowerForm`, `isCalibratedFrame_kahlerPowerForm_iff`,
  `immersionVolume_le_of_isKahlerMetric`, Layer 4);
- the special Lagrangian comass and equality-plane classification, the calibration property of
  `Re(e^(−iθ)Ω)` on Kähler manifolds with a normalized holomorphic volume form, and the minimality
  of special Lagrangian submanifolds (`norm_standardSpecialLagrangianForm`,
  `specialLagrangianFrame_iff`, `isCalibration_specialLagrangianForm`, Layer 5);
- McLean's theorem: near a compact special Lagrangian N, the special Lagrangian deformations form a
  smooth manifold of dimension `b₁(N)`, with tangent space the harmonic one-forms, and the second
  variation of volume is the Hodge energy `∫_N(|dβ|²+|δβ|²)`
  (`secondVariation_volume_eq_hodgeEnergy`, Layer 6).

[Suggested.lean](Suggested.lean) states the headline theorems of Layers 1, 3, 4, 5 and 6 that are
statable against the pinned libraries; its docstring names those that are not: the chain form of
the fundamental theorem (Layer 3), McLean's theorem and the identification of the Jacobi operator
with the Hodge Laplacian (Layer 6).

## Scope and ownership

### Owned here

- The orthonormal-frame form of comass on finite-dimensional real inner-product spaces and its
  identification with the native operator norm, the norm-determinant form of the frame volume,
  the upper bound in the comparison of comass with the exterior-power Hilbert norm, the oriented
  Grassmannian of a general finite-dimensional inner-product space as the SO(k) quotient of Tau
  Ceti's Stiefel manifold, with its comparisons to the coordinate carriers, equality planes, and
  external products (Layer 1).
- Smooth calibrations, calibrated immersions and their volume; Stokes' theorem for smooth simplices
  and chains, the relative smoothing of singular simplices and the integral and real
  smooth-to-singular quasi-isomorphisms on Tau Ceti's smooth singular subcomplex; chain integration
  and the mass of smooth chains; the vertex orders and ordered simplex parametrizations of relative
  smooth triangulations of compact manifolds with boundary, and their integral fundamental chains
  (Layer 2).
- The fundamental theorem of calibrations, its equality case, calibration stability, and the round
  equator non-example (Layer 3).
- The Wirtinger inequality in every degree with its equality case, the Kähler-manifold form of the
  Wirtinger calibration and the volume minimization of compact complex submanifolds (Layer 4).
  Kähler metrics themselves are ComplexKahlerGeometry K6.0's.
- Special Lagrangian linear algebra, the oriented Lagrangian Grassmannian and its phase map, the
  identification of the standard Kähler form with Tau Ceti's standard symplectic form, normalized
  holomorphic volume forms and their special Lagrangian calibrations, special Lagrangian
  submanifolds of Kähler manifolds with a normalized parallel holomorphic volume form, the phase
  class, the mean-curvature/phase identity in a Kähler ambient, and gradient graphs (Layer 5).
- McLean's deformation theorem, the Hölder Hodge-projection bounds it needs, the C¹-to-Hölder
  regularity of nearby minimal graphs with its Legendre-system comparison, full-tensor energy and
  excess decay and system Caccioppoli inequality, the special Lagrangian second-variation identity
  for immersions, and the identification of RiemannianGeometry R5b's normal Jacobi operator of a
  special Lagrangian with the Hodge Laplacian on one-forms (Layer 6).

### Owned elsewhere

- Differential forms, wedge, the exterior derivative and its naturality, pullback, oriented
  integration of top forms, Stokes' theorem, the homotopy operator, de Rham cohomology with its
  degree-one periods, smooth singular simplices with their simplicial chain complexes and simplex
  integrals, pullback metrics of immersions, Riemannian volume forms, the Hodge star and the
  codifferential: Tau Ceti, by the names listed in the supplier contracts. Cartan calculus, the
  homotopy formula for C¹ forms and the divergence theorem with boundary: DifferentialGeometry 1.4,
  5.4 and 12.5.
- Integral singular chains, subdivision and prism operators, orientation and fundamental classes:
  AlgebraicTopology Stages 2, 3.1 and 6.3.
- Hadamard's inequality for Gram determinants, `Re det Gram(v) ≤ Π‖v_i‖²` for every finite family
  (dependent and empty families included), and for coordinate determinants in an orthonormal
  basis: Tau Ceti `Matrix.re_det_gram_le_prod_norm_sq` and `OrthonormalBasis.norm_det_le_prod_norm`.
  Layer 1 consumes the real case and 5.1 the complex coordinate form.
- The simple-vector characterization of the native norm of a continuous alternating form as its
  comass, the linear calibration inequality `|φ(v)| ≤ ‖φ‖·|v₁∧⋯∧v_k|`, the top-degree comass, the
  Riesz identification of k-forms with k-vectors with the pointwise inner product of forms, the
  lower bound `comass(φ) ≤ |φ|_H` and the comparison of the mass of a k-vector with its norm: Tau
  Ceti, by the names listed in the supplier contracts. 1.1 owns the orthonormal-frame supremum
  and 1.3 the upper bound of the Hilbert-norm comparison.
- Existence of smooth triangulations of smooth manifolds without boundary (Whitehead):
  GeometricTopology, smoothing and triangulation comparison item 1. Its relative refinement, in
  which the collared boundary of a compact manifold is a subcomplex: TangentialBordism B1.5
  (quotient and bundle adapters). Neither fixes a vertex order; 2.4 adds the global vertex order,
  the ordered parametrizations and the integral fundamental chains.
- The Levi-Civita connection of a Riemannian manifold: Mathlib `leviCivitaConnection`. Curvature
  calculus and induced tensor connections: RiemannianGeometry R1. The normal bundle of an
  immersion, the second fundamental form, the normal connection, the C² relative-volume functional
  and first variation: RiemannianGeometry R5a, R5a.1 and R5a.2. The polarized normal second
  variation Q of a minimal immersion with its acceleration independence, stability (`Q(V,V) ≥ 0`
  for every compactly supported normal field V), and the normal Jacobi operator with its
  ellipticity and formal self-adjointness: RiemannianGeometry R5b. 3.2 consumes R5b's stability,
  and 6.5 identifies R5b's Jacobi operator of a special Lagrangian with the Hodge Laplacian.
- The normal exponential of a smooth embedding into a Riemannian manifold and the tubular
  neighbourhood theorem, as a smooth inverse of the normal exponential on a neighbourhood of the
  zero section inside any prescribed neighbourhood of the image, and as a diffeomorphism of the
  whole normal bundle onto an ambient neighbourhood: Tau Ceti `TauCeti.SmoothEmbedding.normalExp`,
  `TauCeti.SmoothEmbedding.exists_partialDiffeomorph_normalExp_subset` and
  `TauCeti.SmoothEmbedding.exists_diffeomorph_normalBundle_riemannian_subset`. Collars of compact
  manifolds with boundary: GeometricTopology Layer 1.
- Complex manifolds with their almost complex structure and canonical orientation: Tau Ceti.
  Complex tangent and type calculus, Hermitian and canonical bundles, Hodge theory, Kähler metrics
  and analytic-cycle carriers: ComplexKahlerGeometry K1, K2, K4, K5a, K5b.0, K6.0 and K6.1. The
  integration of analytic cycles across their singular sets belongs to K6.1.
- Bundle Hölder norms, elliptic Schauder estimates and Sobolev Fredholm theory:
  PseudodifferentialOperators P1.0, P5 and P6.
- First-order Sobolev spaces on open subsets of ℝⁿ and their zero-boundary subspaces,
  zero-boundary Poincaré, the scalar energy form with its weak Dirichlet existence theorem, the
  local Campanato estimate, Morrey's Dirichlet growth theorem and the iteration lemma for decay
  estimates: Tau Ceti, by the names listed in the supplier contracts. Sobolev embeddings and
  interior non-divergence Schauder estimates: PDE 1.4 (A4) and 5.6 (E25).
- The smooth Stiefel manifold of orthonormal k-frames of a finite-dimensional real inner-product
  space E, a compact regular level set of the Gram map of dimension `k·dim E − (k+1)k/2`: Tau Ceti
  `TauCeti.stiefel`. The finite coordinate Grassmannians with their frame-quotient topology, the
  coordinate orthonormal frames and, in positive rank, the finite oriented Grassmannians with their
  proper two-sheeted orientation-forgetting cover: Tau Ceti `TauCeti.finiteGrassmannian`,
  `TauCeti.finiteOrthonormalFrame` and `TauCeti.finiteOrientedGrassmannian`, the carriers of
  TopologicalKTheory T1.5 and CharacteristicClasses C1.1a. C1.1a's comparison of the oriented
  cover with the SO(k) quotient of orthonormal frames and its rank-zero sign datum,
  GeneralizedCohomology G4.0b's graph-chart smooth structure, and TopologicalKTheory T1.6a's
  stable classifier comparisons belong to those roadmaps. 1.4 keeps the coordinate-free oriented
  Grassmannian of a general E, its smooth quotient structure and its comparisons with these
  carriers.
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
  explicitly. Smooth chains are the chains of Tau Ceti's smooth singular subcomplex; every
  statement that smooths singular simplices assumes finite dimension, `T2Space` and
  `SigmaCompactSpace` of a manifold without boundary.
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
  `|dx₁∧dx₂| = 1` (no `1/k!`); forms carry the inner product transported along Tau Ceti's Riesz
  identification, `TauCeti.alternatingFormInner`, for which the increasing wedges of an
  orthonormal coframe are orthonormal.
- Product orientations put the first factor's frame first.
- Layer k is also cited as Ck (for example "CalibratedGeometry C2").

## Exact supplier contracts

### From Mathlib

- `ContinuousAlternatingMap` with its operator norm (`ContinuousAlternatingMap.norm_def`,
  `ContinuousAlternatingMap.norm_constOfIsEmpty`,
  `ContinuousAlternatingMap.norm_compContinuousLinearMap_le`), and
  `ContinuousMultilinearMap.norm_compContinuous_linearIsometryEquiv` for pullback along a
  surjective linear isometry. The native norm is an infimum of product-norm bounds; Tau Ceti
  identifies it with the simple-vector comass (below), and its orthonormal-frame form is target
  1.1.
- `LinearMap.normDet` (`Mathlib/Analysis/InnerProductSpace/NormDet.lean`) with
  `LinearMap.normDet_sq_eq_det_gram`, its range-restriction identity and the rank-defect criterion:
  a genuine rectangular volume, `1` on a zero-dimensional domain and `0` on a non-injective map.
- `Matrix.gram` and `Matrix.det_gram_ne_zero_iff_linearIndependent`; `Orthonormal`,
  `OrthonormalBasis`, `EuclideanSpace`, `WithLp`, `PiLp` and `Orientation`.
- Exterior powers `⋀[ℝ]^k E` as submodules of `ExteriorAlgebra`, `exteriorPower.ιMulti`,
  `exteriorPower.alternatingMapLinearEquiv` (the linear dual of an exterior power; the Riesz
  identification is Tau Ceti's, below), and the Gram inner product of
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
- `Bundle.ContMDiffRiemannianMetric` (a smooth Riemannian metric as a family of inner products on
  the tangent spaces) and `leviCivitaConnection`
  (`Mathlib/Geometry/Manifold/VectorBundle/CovariantDerivative/LeviCivita.lean`), unique up to its
  values on non-differentiable vector fields.
- `SSet.chainComplex` and `SSet.chainComplexMap`
  (`Mathlib/AlgebraicTopology/SimplicialSet/Homology/Basic.lean`): the simplicial chain complex of
  a simplicial set with coefficients in any object, and the chain map of a morphism.

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
- `Matrix.re_det_gram_le_prod_norm_sq` and `OrthonormalBasis.norm_det_le_prod_norm`
  (`TauCeti/Analysis/InnerProductSpace/Gram/Hadamard.lean`): Hadamard's inequality
  `Re det Gram(v) ≤ Π‖v_i‖²` for any finite family over an `RCLike` field (dependent and empty
  families allowed), and `‖det_b v‖ ≤ Π‖v_i‖` for the coordinate determinant in an orthonormal
  basis b.
- Comass and mass (`TauCeti/Analysis/InnerProductSpace/Comass.lean`, `AlternatingForm.lean`,
  `ExteriorPower/Basic.lean` and `TauCeti/Analysis/Normed/Module/Alternating/Dual.lean`), all on
  a finite-dimensional real inner-product space E: `exteriorPower.norm_ιMulti_sq`, the squared
  Gram norm of the wedge `v₁∧⋯∧v_k` is `det Gram(v)`, with Hadamard's
  `exteriorPower.norm_ιMulti_le_prod_norm`; `ContinuousAlternatingMap.le_opNorm_mul_norm_ιMulti`,
  `‖φ v‖ ≤ ‖φ‖·‖v₁∧⋯∧v_k‖` for every family v, dependent families included, into any normed
  target; `ContinuousAlternatingMap.opNorm_le_iff_le_mul_norm_ιMulti`, for `0 ≤ C`, `‖φ‖ ≤ C`
  exactly when `‖φ v‖ ≤ C·‖v₁∧⋯∧v_k‖` for every v, so that the native norm is Federer's comass in
  its simple-vector form; `ContinuousAlternatingMap.norm_eq_norm_apply_orthonormalBasis`, the
  comass of a top-degree form is the norm of its value on an orthonormal basis;
  `TauCeti.alternatingFormEquiv`, the Riesz identification `⋀[ℝ]^k E ≃ₗ[ℝ] E [⋀^Fin k]→L[ℝ] ℝ`,
  `x ↦ (v ↦ ⟪x, v₁∧⋯∧v_k⟫)`, and `TauCeti.alternatingFormInner`, the pointwise inner product of
  forms transported along it, computed in an orthonormal basis by
  `TauCeti.alternatingFormInner_eq_sum`; `TauCeti.norm_alternatingFormEquiv_le`, the comass of
  the form of a k-vector η is at most `‖η‖`; `exteriorPower.formDualEquiv`, a k-vector as a
  functional on forms, whose norm is the mass, with `exteriorPower.formDualEquiv_alternatingFormEquiv`
  (`ξ` pairs with the form of `η` to `⟪η, ξ⟫`), `exteriorPower.norm_formDualEquiv_ιMulti` (the
  mass of a wedge is its Gram norm), `exteriorPower.norm_le_norm_formDualEquiv` and
  `exteriorPower.norm_formDualEquiv_le` (`‖ξ‖ ≤ mass(ξ) ≤ sqrt(binomial(dim E, k))·‖ξ‖`).
- Stiefel manifolds and finite Grassmannians: for a finite-dimensional real inner-product space
  E, `TauCeti.stiefel E k` (`TauCeti/Geometry/Manifold/Instances/Stiefel.lean`), the level set of
  the Gram map whose points are the orthonormal k-frames (`TauCeti.mem_stiefel_iff`), regular by
  `TauCeti.gramSym2Deriv_surjective` (at an orthonormal frame v the derivative of the Gram map
  sends the variation `vA/2` to the symmetric matrix A), of dimension `k·dim E − (k+1)k/2`
  (`TauCeti.index_gramSym2Deriv`), compact (`TauCeti.isCompact_stiefel`), nonempty exactly when
  `k ≤ dim E` (`TauCeti.nonempty_stiefel`), with the smooth manifold instance
  `TauCeti.stiefel.instIsManifold`; `TauCeti.finiteGrassmannian ℝ k N`
  (`TauCeti/Topology/Grassmannian/Basic.lean`), the k-dimensional subspaces of `Fin N → ℝ` with
  the quotient topology of the frame-span map; `TauCeti.finiteOrthonormalFrame`
  (`…/Grassmannian/Orthonormal.lean`), with the orthogonal-orbit description
  `TauCeti.finiteGrassmannian.unitaryOrbitHomeomorph`; and, for positive rank only,
  `TauCeti.finiteOrientedGrassmannian` (`…/Grassmannian/Oriented.lean`), the orientation double
  cover of the tautological bundle, compact, whose orientation-forgetting map
  `TauCeti.finiteOrientedGrassmannian.forget` is a covering
  (`TauCeti.VectorBundleOrientationCover.isCoveringMap_proj`) and proper
  (`TauCeti.VectorBundleOrientationCover.isProperMap_proj`), with deck involution
  `TauCeti.VectorBundleOrientationCover.deck`. No smooth structure on the finite Grassmannians is
  pinned.
- Differential forms (`TauCeti/Geometry/Manifold/DifferentialForm/`): `TauCeti.RoughForm` (a
  pointwise continuous alternating map on each tangent space, no regularity assumed),
  `TauCeti.IsSmoothForm`, `TauCeti.mextDeriv` (computed in charts), `TauCeti.mpullback`,
  `TauCeti.mpullback_mextDeriv` (naturality of d for a C² map and a C¹ form),
  `TauCeti.RoughForm.wedge` and `TauCeti.homotopyOperator`.
- Integration: `TauCeti.integralTopForm` (the integral of a top form against a manifold
  orientation, zero unless the form is compactly supported and integrable) and Stokes' theorem
  `TauCeti.integralTopForm_mextDeriv` on manifolds modelled on the half-space, with the
  outward-first boundary orientation.
- De Rham cohomology `TauCeti.deRhamCohomology` and the period map
  `TauCeti.deRhamCohomology.period` from `H¹_dR(M)` to homomorphisms `π₁(M, x) → ℝ`, injective
  on a connected M (`TauCeti.deRhamCohomology.period_injective`, under `PreconnectedSpace M`);
  on a disconnected M the periods at one base point see only its component.
- Smooth singular simplices (`TauCeti/Geometry/Manifold/SmoothSingular/`): the subcomplex
  `TauCeti.smoothSingularSubcomplex` of the singular simplicial set of M, its simplices
  `TauCeti.SmoothSimplex I M p`, the pushforward `TauCeti.smoothSingularSubcomplexMap` along a
  smooth map, and `TauCeti.SmoothSimplex.integral`, additive and homogeneous in the form and natural
  under pushforward. No Stokes formula for simplices and no smoothing theorem is pinned; both are
  2.3's.
- Triangulations: `TauCeti.IsSmoothTriangulation`, a homeomorphism from the realization of a
  simplicial complex that is an immersion on every closed simplex (Whitehead's notion).
- Riemannian carriers: `Bundle.ContMDiffRiemannianMetric.pullback` (the metric pulled back along
  an immersion, for a target metric of one order more regularity), `TauCeti.riemannianVolumeForm`
  of an orientation, the rough Hodge star `TauCeti.RoughForm.hodgeStar` of an orientation of a
  Riemannian manifold of dimension `k + l` (rough k-forms to rough l-forms, pointwise
  `Orientation.formHodgeStar`, with `α ∧ ⋆β = ⟨α, β⟩ dvol` for the inner product
  `TauCeti.alternatingFormInner` and `⋆⋆ = (−1)^(kl)`; a `C¹` manifold with a Riemannian bundle
  suffices), its smooth restriction `TauCeti.SmoothForm.hodgeStar`, and
  `TauCeti.SmoothForm.codifferential`, the formal adjoint of d with sign `(−1)^(m(k+2)+1) ⋆d⋆` on
  `(k+1)`-forms in dimension m.
- Normal exponential and tubular neighbourhoods
  (`TauCeti/Geometry/Manifold/TubularNeighborhood/Riemannian/`): for a smooth embedding
  `TauCeti.SmoothEmbedding` of a manifold into a boundaryless Hausdorff manifold with a smooth
  Riemannian metric, `TauCeti.SmoothEmbedding.normalExp`, the ambient Riemannian exponential of
  the orthogonal representative of an intrinsic normal class, with the base point as junk value
  outside its natural domain; `TauCeti.SmoothEmbedding.exists_partialDiffeomorph_normalExp_subset`,
  a `C^m` partial diffeomorphism equal to the normal exponential on an open set containing the
  whole zero section, with target inside any prescribed open neighbourhood of the image (second
  countable ambient, nonempty source, no compactness); and
  `TauCeti.SmoothEmbedding.exists_diffeomorph_normalBundle_riemannian_subset`, a diffeomorphism of
  the whole normal bundle onto an open ambient neighbourhood inside a prescribed one, sending the
  zero section to the embedding. The Euclidean normal bundle of a `C^(n+1)` immersion into an
  inner-product space is `TauCeti/Geometry/Manifold/TubularNeighborhood/VectorBundle.lean`'s.
- Complex manifolds: `TauCeti.SmoothAlmostComplexStructure.ofComplexManifold`, multiplication by
  i on every tangent space of a manifold modelled on `𝓘(ℂ, E)`; the scoped instance
  `TauCeti.ComplexManifold.isManifold_real` for the underlying real manifold; and
  `TauCeti.complexManifoldOrientation`, carried by holomorphic charts to
  `TauCeti.complexOrientation`, the orientation of the real basis `(b₀, i b₀, b₁, i b₁, …)` of a
  complex basis b.
- Sobolev spaces and regularity estimates: `TauCeti.W1p` and `TauCeti.W1p0` (real-valued
  first-order Sobolev spaces on an open set and the closure of test functions), zero-boundary
  Poincaré `TauCeti.W1p.norm_value_le_mul_norm_gradient_of_subset_slab` (no connectedness), the
  local Campanato estimate `TauCeti.MeasureTheory.dist_preciseRepresentative_le_of_setAverage_norm_sub_le`
  (any normed target), Morrey's Dirichlet growth theorem
  `TauCeti.W1p.holderOnWith_preciseRepresentative_of_setIntegral_norm_gradient_le`, and the
  iteration lemma `TauCeti.exists_le_mul_div_rpow_mul_add_mul_rpow_of_le_mul_add`, whose
  inhomogeneous exponent must lie strictly below the decay exponent. The scalar divergence-form
  energy form `TauCeti.PDE.energyFormH1` and the existence and uniqueness of weak Dirichlet
  solutions for a bounded coercive form, `TauCeti.PDE.existsUnique_isWeakSolutionDirichlet`.

### From TauCetiRoadmap.DifferentialGeometry

1.4 (Cartan calculus), 5.4 (the homotopy formula `ι₁*ω − ι₀*ω = d(hω) + h(dω)` for C¹ forms on
`N × [0,1]`, proved without Stokes so that N may have boundary) and 12.5 (the divergence theorem
with boundary).

### From TauCetiRoadmap.AlgebraicTopology

Stage 2 (integral singular chains, face maps, relative chains), Stage 3.1 (subdivision and prism
homotopies), Stage 6.3 (orientations and fundamental classes, with the outward-first boundary
comparison).

### From TauCetiRoadmap.RiemannianGeometry

R1 (curvature calculus and the induced connections on tensor bundles), R5a (the normal bundle of
an immersion, the second fundamental form B and the normal connection), R5a.1 (C² dependence of
the relative volume of a variation, on orientation-free densities, with one fixed compact
variation support on noncompact sources), R5a.2 (first variation and averaged mean curvature),
and R5b (for a minimal immersion and compactly supported normal fields V and W, fixed near the
boundary when there is one: the normal variation of V through the ambient exponential,
acceleration independence at minimality, the polarized second-volume-variation formula Q, the
normal Jacobi operator L with `Q(V,W) = ∫⟨LV, W⟩`, its ellipticity and formal self-adjointness,
and stability, `Q(V,V) ≥ 0` for every such V).

### From TauCetiRoadmap.GeometricTopology

Layer 1 (collars of compact manifolds with boundary; its tubular neighbourhoods are not consumed,
Tau Ceti's normal exponential being used instead) and the smoothing and triangulation comparison
item 1 (existence of smooth triangulations of smooth manifolds without boundary, used directly for
closed sources).

### From TauCetiRoadmap.TangentialBordism

B1.5 (quotient and bundle adapters), its relative refinement of Whitehead's smooth triangulation:
for a compact smooth manifold N with collared boundary, a finite simplicial complex K and a
homeomorphism `h : |K| → N` restricting to a smooth embedding on each closed simplex, in which `∂N`
is the image of a subcomplex. B1.5 builds it by triangulating the double compatibly with its
reflection, or the boundary first and then the collar by product subdivision; both refine a
Whitehead smooth triangulation, so each closed simplex stays smoothly embedded. No vertex order and
no simplex parametrization are assumed of it.

### From TauCetiRoadmap.ComplexKahlerGeometry

K1 and K2 (complex tangent and type calculus), K4 (Hermitian bundles and canonical bundles), K5a
(the Gram form metric, real star and density line, the real and complex distributional Sobolev
scales, and compact real de Rham Hodge theory on a real manifold of any dimension, with L² pairing,
harmonic projection and Green inverse), K5b.0 (local Hermitian identities, including the Hermitian
volume of complex planes), K6.0 (Kähler metrics as Hermitian metrics with closed fundamental form,
and their comparisons), K6.1 (the analytic-cycle normalization on the regular locus).

### From TauCetiRoadmap.PseudodifferentialOperators

P1.0 (differential operators and formal adjoints), P5 (bundle Hölder carriers and mapping
estimates) and P6 (elliptic Schauder estimates, Sobolev Fredholm realizations and regularity).

### From TauCetiRoadmap.PDE

1.4 (A4, Sobolev embeddings) and 5.6 (E25, the interior `C^(2,α)` Schauder estimate for `C²`
solutions of scalar non-divergence equations with Hölder coefficients). Both are scalar; Layer 6
applies them componentwise to `ℝᵐ`-valued maps whose systems have diagonal principal part. The
Sobolev carriers, zero-boundary Poincaré, the scalar energy form with its Lax–Milgram existence
theorem, and the Campanato, Dirichlet-growth and iteration estimates are Tau Ceti's (above).

### From TauCetiRoadmap.SmoothBundlesConnections and RepresentationTheory/LieGroups

SmoothBundlesConnections B1.4 (smooth quotients by free proper actions), B2 (structure-group
reductions) and B5 (holonomy); LieGroups Layer 2 (the closed-subgroup theorem).

### From TauCetiRoadmap.CharacteristicClasses, TopologicalKTheory and GeneralizedCohomology

CharacteristicClasses C1.1a (the finite oriented cover of the coordinate Grassmannian, which is
Tau Ceti's `TauCeti.finiteOrientedGrassmannian`, and its comparison with the SO(k) quotient of
orthonormal frames, with the rank-zero sign datum kept separate), TopologicalKTheory T1.5 (finite
real Grassmannians, on Tau Ceti's `TauCeti.finiteGrassmannian`, and Stiefel quotients),
GeneralizedCohomology G4.0b (the graph-chart smooth structure on those Grassmannians).

## How to read the build

Layer 1 is pure finite-dimensional linear algebra and precedes everything. Layer 2 builds smooth
calibrations, calibrated immersions and the integral smooth-chain machinery; Layer 3 combines them
with Stokes into the fundamental theorem and stability. Layer 4 needs only Layer 1 for its linear
core (the Wirtinger inequality) and Layers 2–3 for its manifold consequences. Layer 5 does the same
for the special Lagrangian calibration and adds the phase and mean-curvature theory. Layer 6 uses
Layer 5, ComplexKahlerGeometry K5a's compact Hodge theory, PseudodifferentialOperators' Hölder
estimates, Tau Ceti's Sobolev and Campanato estimates and PDE's scalar Schauder estimates to prove
McLean's theorem and the second-variation identity, and RiemannianGeometry R5b's normal Jacobi
operator for its identification with the Hodge Laplacian.

## Layer 1: Comass and equality planes (C1)

Throughout, E is a real inner-product space and φ a continuous alternating real k-form on E, a
`ContinuousAlternatingMap` `E [⋀^Fin k]→L[ℝ] ℝ`.

### 1.1 Comass and the native norm

Define the comass of φ as `sup{|φ(v₁,…,v_k)| : (v_i) orthonormal}`. On a finite-dimensional E,
prove that comass equals the native operator norm; this is `norm_eq_sSup_abs_orthonormal`, stated
in every degree k (both sides vanish for `k > dim E`; for k = 0 both are `|φ ![]|`). The route: an
orthonormal frame has `‖v₁∧⋯∧v_k‖ = 1`, so Tau Ceti's linear calibration inequality
`ContinuousAlternatingMap.le_opNorm_mul_norm_ιMulti` bounds the supremum by the norm; conversely,
by Tau Ceti's simple-vector characterization `ContinuousAlternatingMap.opNorm_le_iff_le_mul_norm_ιMulti`
it suffices that `|φ v| ≤ comass(φ)·‖v₁∧⋯∧v_k‖` for every frame v, which is the comass form of
1.2, proved from the definition of comass alone. Consume the native norm's triangle inequality,
homogeneity, definiteness and normed-space structure through this equality; no competing norm is
installed (Harvey–Lawson 1982, II.(3.1), p. 56, uncertified; McLean1998, line 27).
*Needs:* Mathlib `ContinuousAlternatingMap.norm_def`, `ContinuousAlternatingMap.norm_constOfIsEmpty`;
Tau Ceti `ContinuousAlternatingMap.le_opNorm_mul_norm_ιMulti`,
`ContinuousAlternatingMap.opNorm_le_iff_le_mul_norm_ιMulti`; the comass form of 1.2.

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

The k-dimensional volume of the parallelepiped spanned by a frame `v : Fin k → E` is the Gram norm
`‖v₁∧⋯∧v_k‖` of its wedge, with `‖v₁∧⋯∧v_k‖² = det Gram(v)` (Tau Ceti
`exteriorPower.norm_ιMulti_sq`) and Hadamard's `‖v₁∧⋯∧v_k‖ ≤ Π‖v_i‖`
(`exteriorPower.norm_ιMulti_le_prod_norm`). The linear calibration inequality
`|φ v| ≤ ‖φ‖·‖v₁∧⋯∧v_k‖`, for every frame including the linearly dependent ones, where both sides
vanish, is Tau Ceti's `ContinuousAlternatingMap.le_opNorm_mul_norm_ιMulti`, and the
characterization `‖φ‖ ≤ C ⇔ ∀ v, |φ v| ≤ C·‖v₁∧⋯∧v_k‖` is
`ContinuousAlternatingMap.opNorm_le_iff_le_mul_norm_ιMulti` (Harvey–Lawson 1982, Lemma II.3.5,
p. 57, uncertified). Two targets remain. Prove the comass form `|φ v| ≤ comass(φ)·‖v₁∧⋯∧v_k‖` from
the orthonormal-frame definition of comass of 1.1 alone: for a linearly independent frame write it
in an orthonormal basis b of its span, so that `φ v = φ(b)·det_b(v)` with
`|det_b(v)| = ‖v₁∧⋯∧v_k‖` and `|φ(b)| ≤ comass(φ)`, and a dependent frame gives zero on both sides;
this is the input of 1.1. Prove the norm-determinant identity
`LinearMap.normDet L = ‖L e₁ ∧ ⋯ ∧ L e_k‖` for every linear `L : ℝᵏ → E`, from
`LinearMap.normDet_sq_eq_det_gram` and `exteriorPower.norm_ιMulti_sq`, so that the inequality
reads `|φ(L e₁,…,L e_k)| ≤ ‖φ‖·LinearMap.normDet L`, the form in which 2.3 measures the mass of a
parametrized simplex.
*Needs:* Tau Ceti `exteriorPower.norm_ιMulti_sq`, `exteriorPower.norm_ιMulti_le_prod_norm`,
`ContinuousAlternatingMap.le_opNorm_mul_norm_ιMulti`; Mathlib `LinearMap.normDet`,
`LinearMap.normDet_sq_eq_det_gram`; the definition of comass (1.1).

- The volume `‖v₁∧⋯∧v_k‖` vanishes exactly when v is linearly dependent
  (`Matrix.det_gram_ne_zero_iff_linearIndependent`); the empty frame has volume 1.
- It is invariant under linear isometries of E and under permutation of the frame, and scales by
  `|c|` when one vector is multiplied by c.
- `LinearMap.normDet` is 0 on a non-injective map and 1 on the map from the zero space, in
  agreement with the identity.

**Checks.**

- The empty frame has volume 1 (the empty Gram determinant; normDet of the map from the zero
  space).
- The dependent frame `(v, v)` with v ≠ 0 has volume 0, while the product of norms is `‖v‖²`.
- `((2,0),(0,3))` in ℝ² has volume 6.
- `((1,0),(1,1))` has Gram matrix `[[1,1],[1,2]]` and volume 1, while `Π‖v_i‖ = √2`: a definition
  through the product of norms is wrong.

### 1.3 The exterior-power formulation

Tau Ceti identifies a k-form φ with a k-vector φ̂ through the Riesz isomorphism
`TauCeti.alternatingFormEquiv` of the Gram inner product, `φ̂ ↦ (v ↦ ⟪φ̂, v₁∧⋯∧v_k⟫)`, so that
`ContinuousAlternatingMap.le_opNorm_mul_norm_ιMulti` reads
`|⟪φ̂, v₁∧⋯∧v_k⟫| ≤ comass(φ)·|v₁∧⋯∧v_k|` and `ContinuousAlternatingMap.opNorm_le_iff_le_mul_norm_ιMulti`
says that comass is the supremum of `⟪φ̂, ξ⟫` over unit simple k-vectors ξ, Harvey–Lawson's
definition (Harvey–Lawson 1982, II.(3.1), p. 56, uncertified). The coefficient Hilbert norm
`|φ|_H` is `sqrt(⟨φ, φ⟩)` for the pointwise inner product `TauCeti.alternatingFormInner`, that is
`‖φ̂‖`. Prove the comparison `comass(φ) ≤ |φ|_H ≤ sqrt(binomial(dim E, k))·comass(φ)`, including
the zero-space and `k > dim E` cases. The lower bound is `TauCeti.norm_alternatingFormEquiv_le` at
`η = φ̂`. For the upper bound, `‖φ̂‖² = ⟪φ̂, φ̂⟫` is the value on φ of the functional
`exteriorPower.formDualEquiv φ̂` (`exteriorPower.formDualEquiv_alternatingFormEquiv`), hence at
most `mass(φ̂)·comass(φ) ≤ sqrt(binomial(dim E, k))·‖φ̂‖·comass(φ)` by
`exteriorPower.norm_formDualEquiv_le`; divide by `‖φ̂‖` when φ is nonzero. Equivalently, in an
orthonormal basis each of the `binomial(dim E, k)` coefficients `φ(e_(i₁),…,e_(i_k))` is a value on
an orthonormal frame, hence at most comass(φ) in absolute value
(`TauCeti.alternatingFormInner_eq_sum`).
*Needs:* Tau Ceti `TauCeti.alternatingFormEquiv`, `TauCeti.alternatingFormInner`,
`TauCeti.norm_alternatingFormEquiv_le`, `exteriorPower.formDualEquiv_alternatingFormEquiv`,
`exteriorPower.norm_formDualEquiv_le`; 1.1.

**Checks.**

- In degree 1 comass and Hilbert norm coincide (`binomial(n,1)` is not attained).
- `dx₁∧dx₂ + dx₃∧dx₄` on ℝ⁴: `1 ≤ √2 ≤ √6`.
- The unit decomposable form `dx₁∧⋯∧dx_k` has comass 1 and Hilbert norm 1: the lower bound is
  attained.

### 1.4 The oriented Grassmannian

Let E be finite-dimensional. Define the oriented Grassmannian of a general E as the sigma type of
rank-k subspaces P with an `Orientation ℝ P (Fin k)`, topologized for k ≥ 1 as the quotient of the
space of orthonormal k-frames, each frame giving its span with the orientation it determines, by
the right action of SO(k) (Hatcher2017VBKT, Section 1.2, p. 31, lines 1219–1221). The frame space
is Tau Ceti's Stiefel manifold `TauCeti.stiefel E k`, a compact smooth manifold of dimension
`k·dim E − (k+1)k/2`, regular through the frame variation `vA/2`
(`TauCeti.gramSym2Deriv_surjective`). Construct the free proper smooth SO(k) action on it and use
SmoothBundlesConnections B1.4 for the quotient atlas. For k = 0 the carrier is the two orientation
rays of `⋀⁰`; for `k = dim E` it is the two orientations of E.

Compare with the coordinate carriers through a linear isometry ι to `EuclideanSpace` followed by the
`WithLp` linear equivalence to the coordinate module `Fin N → ℝ`, `N = dim E`, of Tau Ceti's
`TauCeti.finiteGrassmannian ℝ k N`, TopologicalKTheory T1.5's carrier. The comparison depends on
ι: the target action is `g ↦ ιgι⁻¹`, and replacing ι by ι′ composes the comparison with `ι′ι⁻¹`.
Prove that forgetting orientation is a smooth two-sheeted cover of that Grassmannian transported
along ι, with GeneralizedCohomology G4.0b's graph-chart smooth structure (Hatcher2017VBKT,
Section 1.2, p. 31, lines 1228–1231, for the two-to-one covering), and compare the quotient and
pulled-back graph atlases. For k ≥ 1 identify this oriented carrier, transported along ι, with
Tau Ceti's `TauCeti.finiteOrientedGrassmannian`, CharacteristicClasses C1.1a's finite oriented
cover, as covers of that Grassmannian preserving both orientations of each plane, compatibly with
C1.1a's comparison with the SO(k) quotient of orthonormal frames. For k = 0 compare with C1.1a's
two-point sign datum: the canonically oriented zero plane is one of the two rays, and no bijection
with a single point is asserted (the pinned oriented carrier is defined in positive rank only). The
0-form `c` evaluates to `±c` on the two rays; the empty frame selects only the canonical ray.
*Needs:* Mathlib `Orientation`; Tau Ceti `TauCeti.stiefel`, `TauCeti.mem_stiefel_iff`,
`TauCeti.isCompact_stiefel`, `TauCeti.index_gramSym2Deriv`, `TauCeti.finiteGrassmannian`,
`TauCeti.finiteOrientedGrassmannian`; SmoothBundlesConnections B1.4; TopologicalKTheory T1.5;
GeneralizedCohomology G4.0b; CharacteristicClasses C1.1a.

- The oriented Grassmannian is compact, and the orientation-forgetting map is a two-sheeted
  covering for `1 ≤ k`; orientation reversal is its deck involution.
- For `1 ≤ k ≤ dim E` it is a smooth manifold of dimension `k(dim E − k)`, the Stiefel dimension
  `k·dim E − (k+1)k/2` less `dim SO(k) = k(k−1)/2`, the action being free, and the quotient map
  from `TauCeti.stiefel E k` is a smooth submersion.
- The comparison with C1.1a commutes with orientation reversal and with the isometry action.

**Checks.**

- k = 1 in ℝ: the oriented Grassmannian has two points (the two orientations of ℝ), and C1.1a's
  finite cover of the one-point Grassmannian has two points; the fixed-rank stable classifier
  `BSO(1)` is a point, so it is not the comparison target.
- k = 2 in ℝ³: the oriented Grassmannian is a 2-sphere (via the oriented unit normal), of
  dimension `2·(3 − 2) = 2`, the Stiefel dimension `6 − 3 = 3` less `dim SO(2) = 1`. The quotient
  by O(2) instead of SO(2) is the unoriented `ℝP²`, with one point over each plane instead of two.
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

The frame `((1,0,0),(1,1,0))` in ℝ³ has Gram determinant 1, hence volume `‖v₁∧v₂‖ = 1`, and
`dx₁∧dx₂` evaluates to 1 on it: equality in the linear calibration inequality
`|φ v| ≤ ‖φ‖·‖v₁∧v₂‖` without the frame being orthonormal.

### Dependencies

Mathlib and Tau Ceti's comass, Riesz identification and Hadamard inequality for 1.1–1.3 and
1.5–1.6; Tau Ceti's Stiefel manifold and finite Grassmannians, SmoothBundlesConnections B1.4,
TopologicalKTheory T1.5, GeneralizedCohomology G4.0b and CharacteristicClasses C1.1a for 1.4 only.

## Layer 2: Calibrated immersions and integral smooth chains (C2)

### 2.1 Smooth calibrations

Define `IsCalibration g φ`, for a smooth Riemannian metric g on M (a
`Bundle.ContMDiffRiemannianMetric`) and a real k-form φ (a `TauCeti.RoughForm`): φ is smooth,
`TauCeti.mextDeriv φ = 0`, and `|φ_x(v)| ≤ 1` for every `g_x`-orthonormal frame v of `T_xM`, that is
`comass(φ_x) ≤ 1` in the metric `g_x` at every point (Joyce2001SLLectures, Definition 2.1, line 58,
whose one-sided bound on oriented planes is this absolute bound; Harvey–Lawson 1982,
Definition II.4.1, p. 59, uncertified, which asks for comass exactly one). Prove its preservation by
Riemannian isometries and restriction to open sets. For a parallel form, the pullback of φ at an
endpoint by metric parallel transport equals φ at the start; own the torsion-free covariant
exterior-derivative identity `dφ = Alt(∇φ)` for Mathlib's `leviCivitaConnection` and the induced
connection on forms, deduce `dφ = 0` for parallel φ, and prove that comass is constant on each
connected component. A general closed calibration need not be parallel.
*Needs:* Tau Ceti `TauCeti.RoughForm`, `TauCeti.IsSmoothForm`, `TauCeti.mextDeriv`; Mathlib
`Bundle.ContMDiffRiemannianMetric`, `leviCivitaConnection`; RiemannianGeometry R1 (tensor
connections); 1.1.

- `IsCalibration g φ` is the conjunction of smoothness, closedness and the pointwise comass bound;
  for `k ≥ 1` the absolute bound is equivalent to the one-sided bound `φ_x(v) ≤ 1` on orthonormal
  frames, by swapping two vectors of the frame.
- In degree zero a calibration is a locally constant function with values in `[−1, 1]`.

**Checks.**

- `dx₁∧dx₂` on ℝ³ is a smooth calibration.
- `2 dx₁∧dx₂` is closed with comass 2: not a calibration.
- `x₃ dx₁∧dx₂` fails both conditions: `d(x₃ dx₁∧dx₂) = dx₁∧dx₂∧dx₃ ≠ 0`, and its comass is `|x₃|`.
- Degree zero: the constant function −2 is closed and satisfies the one-sided bound `−2 ≤ 1` on the
  empty frame but has comass 2, so it is not a calibration; a one-sided definition would accept it.

### 2.2 Calibrated immersions

For a smooth immersion `f : Nᵏ → M` (injective `mfderiv` at every point) with an orientation o of
N, pull g back along f by `Bundle.ContMDiffRiemannianMetric.pullback` and define
`immersionVolume g f hf hinj o`, the integral `TauCeti.integralTopForm o` of the Riemannian volume
form `TauCeti.riemannianVolumeForm o` of `f*g`, and `IsCalibratedImmersion g φ f hf hinj o`, the
equation `TauCeti.mpullback f φ = TauCeti.riemannianVolumeForm o`, that is `f*φ = dvol_(f*g)`.
Prove equivalence with `IsCalibratedFrame φ (df(v))` for every positive
orthonormal tangent frame v of `f*g`, and with the tangent-plane condition of 1.5. The equation is
independent of oriented charts and parametrization: prove its transport under
orientation-preserving diffeomorphisms of N and its sign change under orientation reversal. Prove the
pointwise inequality `f*φ ≤ dvol_(f*g)` and its absolute version, and the integrated inequality
`∫_N f*φ ≤ Vol(N)` on compact sources (Harvey–Lawson 1982, Lemma II.3.5, p. 57, uncertified); for
noncompact sources the statement carries finite volume and
integrability hypotheses, since calibratedness does not imply finite volume (Joyce2001SLLectures,
Definition 2.1, line 62).
*Needs:* Tau Ceti `Bundle.ContMDiffRiemannianMetric.pullback`, `TauCeti.riemannianVolumeForm`,
`TauCeti.integralTopForm`, `TauCeti.mpullback`; 2.1.

- `immersionVolume` does not depend on the orientation: reversing o reverses both the volume form
  and the sign of the integral. On a compact source it is the Riemannian volume of `f*g` and is
  positive when N is nonempty.
- `IsCalibratedImmersion` changes into the equation for `−φ` when o is reversed.

**Checks.**

- The plane `x₃ = 0` in ℝ³ with orientation `(e₁,e₂)` is calibrated by `dx₁∧dx₂`; with the reversed
  orientation, `f*φ = −dvol`.
- The plane `x₃ = x₁` gives `f*φ = dvol/√2`: strict inequality.
- The line `ℝ·(1,1)/√2` in ℝ² is calibrated by `(dx₁+dx₂)/√2` and not by `dx₁`.
- The circle `t ↦ (2 cos t, 2 sin t)` in ℝ² has `immersionVolume` 4π for both orientations; a
  definition integrating `f*φ` instead of the volume form would give 0 for `φ = dx₁`.

### 2.3 Integral smooth chains

Consume Tau Ceti's smooth singular subcomplex `TauCeti.smoothSingularSubcomplex` of the singular
simplicial set of M, whose p-simplices are `TauCeti.SmoothSimplex I M p`, and Mathlib's simplicial
chain complex `SSet.chainComplex` of it with coefficients ℤ or ℝ: its chains are the finitely
supported combinations of smooth simplices and its boundary is the alternating face sum, so `∂∂ = 0`
is Mathlib's. The inclusion into singular chains is `SSet.chainComplexMap` of the subcomplex
inclusion, smooth maps act by `TauCeti.smoothSingularSubcomplexMap`, and change of coefficients
`ℤ → ℝ` is the naturality of `SSet.chainComplexFunctor` in the coefficient object. Define chain
integration as the linear extension of `TauCeti.SmoothSimplex.integral`, and prove that it agrees
after coefficient change and is natural under smooth pushforward.

Prove Stokes' theorem for smooth simplices and chains: for a C¹ (p−1)-form η and a smooth
p-simplex σ, `∫_σ dη = Σ_i (−1)^i ∫_(∂_i σ) η`, hence `∫_c dη = ∫_(∂c) η` for every chain c
(Lee2012ISM, Theorem 18.12, uncertified). The route: pull η back along the smooth extension of σ to a
neighbourhood of the standard simplex `fullSimplex p` and integrate one coordinate by the
fundamental theorem of calculus; the faces of the standard simplex carry the signs `(−1)^i`.

Prove the relative smoothing of simplices: on a finite-dimensional `T2Space`, `SigmaCompactSpace`
manifold without boundary, every singular simplex whose faces are smooth is homotopic, relative to
its boundary, to a smooth simplex, with a face-compatible choice. Prove that the integral
smooth-to-singular comparison is a quasi-isomorphism (Lee2012ISM, Theorem 18.7, uncertified):
construct ℤ-module chain maps and chain homotopies on the finitely supported integer generators from
these simplex-level smoothings, with one shared face-compatible choice function and the subdivision
and prism triangulations of AlgebraicTopology Stage 3.1, so that the coefficient-change squares
commute literally. Prove both chain-homotopy identities over ℤ, the relative, subdivision and
naturality laws, and specified chain homotopies comparing different choices. Inclusions and
induced smooth-chain maps are strictly natural; smoothing inverses and choice comparisons have
explicit naturality chain homotopies. The integral isomorphism is not obtained by tensoring a real
comparison backwards; the real comparison is its coefficient change.

Define the mass of a parametrized smooth simplex as the integral over the standard simplex of the
native norm determinant of its differential, and of a chain as the sum of absolute coefficients times
masses. Prove subdivision, smooth reparametrization and orientation compatibility, and
`|∫_c φ| ≤ mass(c)` for a smooth calibration φ.
*Needs:* Tau Ceti `TauCeti.smoothSingularSubcomplex`, `TauCeti.SmoothSimplex`,
`TauCeti.smoothSingularSubcomplexMap`, `TauCeti.SmoothSimplex.integral`, `TauCeti.mextDeriv`; Mathlib
`SSet.chainComplex`, `SSet.chainComplexMap`, `LinearMap.normDet`; AlgebraicTopology Stages 2 and 3.1;
1.2, 2.1.

**Checks.**

- For a smooth 2-simplex σ, `∂∂σ = 0` with the face signs `(−1)^i`; dropping the signs gives
  `∂∂σ ≠ 0` in general.
- The integral chain `2σ` maps to `2σ` under coefficient change; the real comparison cannot see the
  torsion `H₁(ℝP²; ℤ) = ℤ/2`, which the integral comparison must preserve.
- A constant simplex has mass 0; the 1-simplex `t ↦ 2t` in ℝ has mass 2; the folded 1-simplex
  `t ↦ |2t−1|` has mass 2 while its image has length 1: mass counts multiplicity.
- Stokes on the 1-simplex `σ(t) = t` in ℝ with `η = x²`: `∫_σ dη = ∫₀¹ 2t dt = 1`, and
  `∂σ = ∂₀σ − ∂₁σ` is the vertex 1 minus the vertex 0, giving `η(1) − η(0) = 1`; the opposite face
  sign would give −1.

### 2.4 Ordered relative triangulations and fundamental chains

Let N be a compact smooth manifold with boundary, collared by GeometricTopology Layer 1. Take its
relative smooth triangulation from TangentialBordism B1.5: a finite simplicial complex K with a
homeomorphism `h : |K| → N` restricting to a smooth embedding on each closed simplex, in which `∂N`
is the image of a subcomplex (Munkres1966EDT, Chapter II, §10). For closed N take Whitehead's
triangulation from GeometricTopology's smoothing and triangulation item 1. Fix a total order on the
vertices of K and parametrize each simplex `[v₀ < ⋯ < v_p]` by h composed with the affine map
sending the standard vertex `e_i` to `v_i`; the face maps of these ordered parametrizations are the
ordered parametrizations of the faces, literally, not only up to reparametrization.

For compact oriented N with boundary, define the integral fundamental chain
`c_N = Σ_σ ε_σ σ` over the top simplices, with `ε_σ = ±1` according as the ordered parametrization
preserves orientation. Prove that every interior facet occurs in `∂c_N` twice as the same
parametrized generator with opposite coefficients, so that `∂c_N = c_(∂N)` with outward-first
orientation, and that `∫_(c_N) η = ∫_N η` for every compactly supported top form η. Prove
independence of refinement and of choices up to an explicit boundary. For closed oriented N, prove
that the image of `c_N` under 2.3's comparison represents AlgebraicTopology 6.3's fundamental class
of N; the integral chain statements precede their real corollaries.
*Needs:* TangentialBordism B1.5 (relative smooth triangulation); GeometricTopology Layer 1
(collars) and smoothing item 1 (closed case); Tau Ceti `TauCeti.IsSmoothTriangulation`,
`TauCeti.integralTopForm` with its outward-first boundary orientation; AlgebraicTopology 6.3; 2.3.

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

2.1 needs Layer 1, Tau Ceti's forms and Mathlib's Levi-Civita connection; 2.2 needs 2.1 and Tau
Ceti's pullback metrics, volume forms and top-form integration; 2.3 needs Tau Ceti's smooth singular
subcomplex and simplex integrals and AlgebraicTopology Stages 2 and 3.1; 2.4 needs 2.3,
TangentialBordism B1.5, GeometricTopology Layer 1 and smoothing item 1, and AlgebraicTopology 6.3.

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
On closed sources prove the real-homology form `immersionVolume_le_of_isCalibratedImmersion`: for
any ambient M (its model may have boundary or corners), compact Hausdorff sources without
boundary, an immersion f with orientation o calibrated by φ (`IsCalibratedImmersion`), and an
immersion f′ of a k-manifold with orientation o′ such that
`∫_N f*η = ∫_(N′) f′*η` for every smooth closed k-form η on M, the volumes satisfy
`immersionVolume g f … o ≤ immersionVolume g f′ … o′`. The route: η = φ gives
`Vol(f) = ∫_N f*φ = ∫_(N′) f′*φ`, and 2.2's pointwise inequality bounds the right side by
`Vol(f′)`. The period hypothesis is real homology by de Rham's theorem and is weaker than an
integral bounding chain. Derive the integral-homology version: if `f_*[N] = f′_*[N′]` in
`H_k(M; ℤ)`, 2.3's quasi-isomorphism and 2.4's identification of `c_N` with the fundamental class
give a finite integral smooth chain B with `f_*c_N − f′_*c_(N′) = ∂B`, and 2.3's chain Stokes gives
equal periods. For competitors agreeing outside a compact region, require that their compact
difference bounds a finite integral smooth chain there, or a compactly supported homotopy
supplying one, and construct that relative chain comparison.
*Needs:* Tau Ceti `TauCeti.integralTopForm`, `TauCeti.mpullback`; 2.2, 2.3 (chain Stokes and the
smooth-to-singular comparison), 2.4.

- Agreement outside a compact region alone does not give the bounding-chain hypothesis.
- A noncompact homology statement is not a finite integral hypothesis and is not asserted.
- `immersionVolume_le_of_isCalibratedImmersion` holds in degree zero as well: there the period
  hypothesis compares signed point counts on each component of M, and calibrated points all carry
  the sign of the constant value of φ on their component.

**Checks.**

- The flat disk `{x₃ = 0, |x| ≤ 1}` in ℝ³ and the upper unit hemisphere have the same boundary; the
  disk is calibrated by `dx₁∧dx₂`, and `π ≤ 2π`.
- The same disk with reversed orientation is not calibrated, and the theorem gives nothing.
- The graph over the disk of a smooth bump function vanishing near the boundary circle has the same
  boundary and strictly larger area; it is not calibrated, consistent with the equality case.
- Closed sources on the flat torus `ℝ²/ℤ²`: the circle `t ↦ (t, 0)` has length 1 and is calibrated
  by `dx₁`; the curve `t ↦ (t, sin(2πt)/4)` is homotopic to it, has the same periods (1 against
  `dx₁`, 0 against `dx₂`) and length `∫₀¹ sqrt(1 + (π/2)² cos²(2πt)) dt > 1`. The reversed circle
  pairs with `dx₁` to −1, so the period hypothesis fails and nothing is claimed, although its
  length is also 1.

### 3.2 Variations and stability

For a compactly supported variation `f_t` with fixed boundary, prove that `∫ f_t*φ` is constant
through DifferentialGeometry 5.4's homotopy operator, its pullback naturality and Stokes. Consume
RiemannianGeometry R5a.1's C² dependence of `Vol(f_t)` and compare its relative-density functional and
its derivatives with 2.2's oriented integration. Stability of a minimal immersion is
RiemannianGeometry R5b's: `Q(V,V) ≥ 0` for every compactly supported normal field V, fixed near the
boundary when there is one, where Q is the second derivative of volume along R5b's normal variation
of V. Prove that a minimal immersion whose volume is least at `t = 0` along each such normal
variation is stable, by elementary calculus. Use R5a.2's first variation for compactly supported
interior variations to obtain `H = 0` for calibrated immersions, and DifferentialGeometry 12.5's
divergence theorem for fixed-boundary variations, whose variation field vanishes on the boundary.
With the constancy above and 2.2's pointwise inequality, a calibrated immersion f satisfies
`Vol(f_t) ≥ ∫ f_t*φ = ∫ f*φ = Vol(f)` (relative volumes on noncompact sources), so it is stable:
calibrated immersions are stable minimal immersions (McLean1998, lines 32–33; Joyce2001SLLectures,
line 64, for minimality, citing Harvey–Lawson 1982, Theorem II.4.2, p. 59, uncertified). Every
application states its fixed-boundary or compact-support hypothesis: arbitrary variations
contribute boundary terms.
*Needs:* DifferentialGeometry 5.4, 12.5; RiemannianGeometry R5a.1, R5a.2, R5b; 2.2, 3.1.

**Checks.**

- The flat disk in ℝ³ has `H = 0` and second variation `Q(u e₃, u e₃) = ∫|∇u|² ≥ 0` (flat ambient,
  `B = 0`) for normal fields `u e₃` with u compactly supported in the open disk.
- A variation moving the boundary of the disk outward changes its area at first order: the
  fixed-boundary hypothesis is needed.
- For m ≥ 1 the round equator `Sᵐ ⊂ S^(m+1)` is minimal, but its constant unit normal variation has
  volume `cos(t)^m Vol(Sᵐ)` and second derivative `−m·Vol(Sᵐ) < 0`; so it is unstable and is not
  calibrated by any closed ambient form.

### 3.3 Products and the distinction from minimality

Derive the Riemannian product calibration theorem under 1.6's decomposable-factor or explicit
product-comass hypotheses: for calibrations φ₁ on M₁ and φ₂ on M₂ whose pointwise external product
has comass at most one (automatic when one factor is pointwise a unit decomposable form), the form
`π₁*φ₁ ∧ π₂*φ₂` is a calibration on the Riemannian product `M₁ × M₂`, and the product of immersions
calibrated by φ₁ and φ₂, with the product orientation, is calibrated by it (pointwise this is
Harvey–Lawson 1982, Proposition II.7.10, p. 76, uncertified, as in 1.6). Record that a stationary
minimal submanifold need not be calibrated (the round equator of 3.2).
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

3.1 needs 2.2–2.4; 3.2 needs 2.2, 3.1 and RiemannianGeometry R5a and R5b; 3.3 needs 1.6 and
3.2.

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
`(r!)⁻¹` times the form of the 2r-vector `ω̂ʳ` under Tau Ceti's Riesz identification
`TauCeti.alternatingFormEquiv`, that is the real continuous alternating 2r-form
`v ↦ ⟪ω̂ʳ, v₀∧⋯∧v_(2r−1)⟫ / r!`, with `ω̂ʳ` the r-th power in the exterior algebra and the Gram
inner product on `⋀[ℝ]^(2r)`. Define `complexRealFrame u`, for `u : Fin r → ℂⁿ`, as the real frame
`(u₀, iu₀, u₁, iu₁, …)`.

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
Tau Ceti `TauCeti.alternatingFormEquiv`, `TauCeti.norm_alternatingFormEquiv_le`; 1.1, 1.5, 4.1.

- `kahlerPowerForm n 1` agrees with `standardKahlerForm n` under `Fin (2·1) = Fin 2`.
- `kahlerPowerForm n r` vanishes for `r > n` (its degree exceeds `2n`).
- `kahlerPowerForm n r` is invariant under the unitary group acting on ℂⁿ.
- `TauCeti.norm_alternatingFormEquiv_le` bounds its comass by `‖ω̂ʳ‖/r! = sqrt(binomial(n, r))`,
  since `ω̂ʳ = r!·Σ_(|J|=r) ∧_(j∈J)(e_j∧ie_j)` with orthonormal summands; this bound is the comass
  1 only for `r = 0` and `r = n`, and for `n = 2, r = 1` it is `√2`.

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

Let M be a complex manifold modelled on `𝓘(ℂ, E)` for a finite-dimensional complex normed space E,
viewed as a real manifold through `TauCeti.ComplexManifold.isManifold_real`, with the complex
structure `TauCeti.SmoothAlmostComplexStructure.ofComplexManifold` (multiplication by i on each
tangent space E). Kähler metrics, Hermitian metrics with closed fundamental form, are
ComplexKahlerGeometry K6.0's, with its comparisons, the inheritance by complex submanifolds and the
case of curves. `IsKahlerMetric g` writes that predicate on the pinned carriers, so that this
layer's headline is statable: for a smooth Riemannian metric g on the underlying real manifold,
`g_x(iv, iw) = g_x(v, w)` for all x, v, w, and the real 2-form `ω_x(v, w) = g_x(iv, w)` has
`TauCeti.mextDeriv ω = 0`. Prove that it agrees with K6.0's predicate. On flat ℂ with
`g = Re⟪·,·⟫_ℂ` this ω is the standard Kähler form of the Conventions, `ω(1, i) = g(i, i) = 1`.

For every Kähler manifold, instantiate 4.2 bundlewise with the complex tangent metric and fundamental
form: `ωʳ/r!` is a smooth calibration, closed because `dω = 0` and by the derivation rule for wedge
products. Compare the induced Hermitian metric and volume normalization on complex r-planes with
ComplexKahlerGeometry K5b.0. Prove that a smooth real 2r-submanifold is calibrated by `ωʳ/r!` exactly
when its tangent spaces are complex with their complex orientation; for an embedded submanifold
identify this, through ComplexKahlerGeometry's holomorphic charts and implicit-function comparison,
with being a complex submanifold. Conclude that compact complex submanifolds minimize volume in their
homology class and are stable minimal submanifolds (McLean1998, lines 37–48). The real-homology form
is `immersionVolume_le_of_isKahlerMetric`: for a Kähler metric g, a holomorphic immersion f of a
compact complex manifold N of complex dimension r, oriented by `TauCeti.complexManifoldOrientation`,
and an immersion f′ of a compact real 2r-manifold without boundary, with an orientation o′ and the
same integrals of every smooth closed 2r-form, `immersionVolume g f … ≤ immersionVolume g f′ … o′`;
it follows from 3.1 with `φ = ωʳ/r!`. Since `TauCeti.complexOrientation` is the orientation of
`(b₀, ib₀, b₁, ib₁, …)`, the order of `complexRealFrame`, f is calibrated by `ωʳ/r!` itself, not
by its negative. Compare with ComplexKahlerGeometry K6.1's analytic-cycle normalization on the smooth
regular locus; singular-set Stokes and local finite mass remain K6.1's.
*Needs:* Tau Ceti `TauCeti.SmoothAlmostComplexStructure.ofComplexManifold`,
`TauCeti.complexManifoldOrientation`, `TauCeti.RoughForm.wedge`; ComplexKahlerGeometry K1, K2,
K5b.0, K6.0, K6.1; 3.1, 3.2, 4.2.

- `IsKahlerMetric` is the conjunction of the Hermitian identity and the closedness of the
  fundamental form; the fundamental form is then determined by g and is smooth.

**Checks.**

- Flat `ℂⁿ` with `g = Re⟪·,·⟫_ℂ` is Kähler. On ℂ the metric `dx² + 4dy²` is not Hermitian:
  `g(i, i) = 4 ≠ 1 = g(1, 1)`.
- The Hermitian metric `|z|⁻² Re⟪·,·⟫_ℂ` on `ℂ² ∖ 0` is not Kähler: its fundamental form is
  `|z|⁻² ω₀`, and `d(|z|⁻²) ∧ ω₀` has coefficient `−2x₁|z|⁻⁴` on `dx₁∧dx₂∧dy₂`, nonzero off
  `x₁ = 0`; a definition without the closedness clause would accept it.

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
`norm_standardSpecialLagrangianForm`: `φ_θ` has comass one. Prove `specialLagrangianFrame_iff`, for
every n including n = 0: a real-orthonormal frame v satisfies `φ_θ v = 1` exactly when it spans a Lagrangian plane
(`Im⟪v_i,v_j⟫_ℂ = 0` for all i, j), `Im(e^(−iθ)Ω v) = 0`, and `Re(e^(−iθ)Ω v) > 0`
(Joyce2001SLLectures, Propositions 2.3 and 2.4, lines 96 and 107, for θ = 0; Harvey–Lawson 1982,
Theorem III.1.10 and Corollary III.1.11, p. 89, uncertified; McLean1998, Proposition 3.2, line 483).
Both the imaginary equation
and the Lagrangian condition are required, and the orientation inequality is not replaced by an
unoriented vanishing equation. The route: for an orthonormal frame `|Ω v| = |det_ℂ v| ≤ 1` by
Hadamard's inequality in the standard orthonormal basis, with equality exactly when the frame is
complex-orthonormal, that is, Lagrangian. Only the comass statement needs `n ≥ 1`; at n = 0 the
classification reads `cos θ = 1 ⇔ sin θ = 0 ∧ cos θ > 0`.
*Needs:* Mathlib `Matrix.detRowAlternating`, `ContinuousAlternatingMap.restrictScalars`; Tau Ceti
`OrthonormalBasis.norm_det_le_prod_norm`; 1.1, 1.5.

**Checks.**

- n = 1, θ = 0: `φ(z) = Re z`; `z = 1` is calibrated, `z = −1` gives −1, `z = i` gives 0; for
  θ = π/2, `φ(z) = Im z` and `z = i` is calibrated.
- n = 2, θ = 0: `(e₁,e₂)` gives 1; `(ie₁,ie₂)` gives `Re(i²) = −1` and is calibrated for θ = π;
  `(e₁,ie₂)` gives 0 for θ = 0 and is calibrated for θ = π/2.
- n = 2: `(e₁, ie₁)` is orthonormal with `Ω = det[[1,0],[i,0]] = 0`; it is not Lagrangian
  (`Im⟪e₁,ie₁⟫ = 1`) and gives 0.
- n = 0: `φ_θ` is the constant `cos θ`, of comass `|cos θ|`, so the comass statement needs `1 ≤ n`;
  the empty frame is calibrated exactly when `θ ∈ 2πℤ`, where both sides of
  `specialLagrangianFrame_iff` hold, and for `θ = π` both fail (`cos π = −1`).

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

On a complex manifold M as in 4.3 with a smooth Riemannian metric g, define
`IsNormalizedHolomorphicVolumeForm g Ω` for a complex-valued n-form Ω (a `TauCeti.RoughForm` with
coefficients ℂ): Ω is smooth and closed, each `Ω_x` is complex-linear in every argument
(`Ω_x(…, i v_j, …) = i Ω_x(…, v_j, …)`), and `|Ω_x(u)| = 1` for every unitary frame u, that is
every `g_x`-orthonormal n-frame with `g_x(iu_j, u_l) = 0` for all j, l. For a Hermitian g and n the
complex dimension this is the pointwise form of the normalization `ωⁿ/n! = (−1)^(n(n−1)/2) (i/2)ⁿ Ω∧Ω̄`
of the Conventions, and a closed complex-linear n-form is holomorphic. Define
`specialLagrangianForm Ω θ`, the real n-form `Re(e^(−iθ) Ω)`. Holomorphic n-forms are sections of
ComplexKahlerGeometry K4's canonical bundle; the predicate states the normalization pointwise on the
pinned carriers. Prove
`isCalibration_specialLagrangianForm`: for a Kähler metric g and a normalized holomorphic volume
form Ω, every `specialLagrangianForm Ω θ` is a calibration; pointwise this is
`norm_standardSpecialLagrangianForm` transported by a unitary isomorphism of `(T_xM, g_x)` with ℂⁿ,
and closedness is that of Ω (Harvey–Lawson 1982, Theorem III.1.10, p. 89, uncertified; McLean1998,
lines 450–462). On a Kähler manifold a normalized holomorphic volume form of degree the complex
dimension is parallel. Construct the
SU(n)-reduction and compare its metric and volume data with ComplexKahlerGeometry K4's Hermitian
and canonical bundles. Derive the special Lagrangian equations `ω|_L = 0`, `Im Ω_θ|_L = 0`,
minimality, stability and the homological volume bound from Layers 2–3; with
`immersionVolume_le_of_isCalibratedImmersion` the calibration theorem gives the real-homology volume
bound for compact phase-θ special Lagrangian immersions.

On an oriented Lagrangian immersion define its U(1)-valued phase without assuming a global real lift,
and build local real lifts. Define the phase class as the pullback under the phase map of the class in
`H¹(U(1); ℤ)` pairing to +1 with AlgebraicTopology's outward-first fundamental class of the circle,
transported to `U(1) ⊂ ℂ`. Prove that its real image is the class of `dθ/2π` pulled back by the phase
map: on every loop the phase class and the de Rham class of that closed form take the same value,
which determines the de Rham class on each connected component of the Lagrangian through Tau
Ceti's period map `TauCeti.deRhamCohomology.period`, injective on a connected manifold
(`TauCeti.deRhamCohomology.period_injective`) and applied componentwise with a base point in
each component, with no general de Rham theorem. The classical unoriented Maslov
class uses `det²` on `U(n)/O(n)`, and on oriented Lagrangians it is twice the phase class. For a
loop of Lagrangian planes in ℂⁿ (the tangent planes along a closed curve in an oriented Lagrangian
immersion into ℂⁿ, or a unitary trivialization along the curve) prove that the Maslov class pairs
with the loop to `TauCeti.TotallyRealLoop.maslovIndex`, the degree of its `det²` phase loop, and
hence to twice the phase class; HeegaardFloer F1.4 compares that integer with the Robbin–Salamon
path index. Prove the cocycle law of the phase class and its period comparison. For C² oriented Lagrangian
immersions, construct the second
fundamental form B and `H_tr = trace B` in local coordinates, compare with RiemannianGeometry R5a on
smooth immersions, and with `ω(X,Y) = g(JX,Y)` prove `H_tr = J grad θ` and `ι_(H_tr) ω = −dθ`.
Compare `H_avg = H_tr/n` with R5a's averaged mean curvature, and derive that a connected oriented
Lagrangian has `H = 0` exactly when its phase is constant, hence it is special Lagrangian for that
phase. Harvey–Lawson prove this for submanifolds of ℂⁿ through the flat identity (2.19)
(Harvey–Lawson 1982, Proposition III.2.17, p. 96, uncertified); the Kähler-ambient case is the same
computation with `∇Ω = 0` and is owned here.
*Needs:* Tau Ceti `TauCeti.RoughForm`, `TauCeti.IsSmoothForm`, `TauCeti.mextDeriv`,
`TauCeti.deRhamCohomology`, `TauCeti.deRhamCohomology.period`,
`TauCeti.TotallyRealLoop.maslovIndex`; ComplexKahlerGeometry K4; RiemannianGeometry R5a;
AlgebraicTopology 6.3; 3.1, 3.2, 4.3, 5.1, 5.2.

- `specialLagrangianForm Ω (θ + π) = −specialLagrangianForm Ω θ`, and
  `specialLagrangianForm Ω (θ + π/2)` is `Im(e^(−iθ) Ω)`.
- The definition is meant for n equal to the complex dimension m of M. For `0 < n < m` none exists,
  since some unitary n-frame lies in the kernel of the induced functional on n-vectors; for `n > m`
  the zero form is the only one, the normalization being vacuous, and its special Lagrangian forms
  are zero calibrations; in degree zero it is a locally constant function of modulus one.

**Checks.**

- On ℂⁿ with the flat metric, `dz₁∧⋯∧dzₙ` (the form `standardComplexVolume n` at every point) is a
  normalized holomorphic volume form; `2 dz₁∧⋯∧dzₙ` is not, and its special Lagrangian forms have
  comass 2.
- On ℂ the form `dz̄`, `v ↦ conj v`, has modulus one on unit vectors but is not complex-linear:
  `conj(i·1) = −i ≠ i = i·conj(1)`.
- On ℂ² the form `dz₁` (degree 1) vanishes on the unitary 1-frame `e₂`, so it is not normalized.

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

Throughout 6.1–6.4, N is a compact embedded phase-θ special Lagrangian without boundary in the
ambient manifold of 5.3, and k ≥ 2, 0 < α < 1. 6.5 is stated for phase-θ special Lagrangian
immersions of closed manifolds, the inclusion of N being one.

### 6.1 Normal parametrization and the deformation map

Choose a tubular neighbourhood of N: Tau Ceti's
`TauCeti.SmoothEmbedding.exists_partialDiffeomorph_normalExp_subset` gives a smooth inverse of the
normal exponential `TauCeti.SmoothEmbedding.normalExp` on a neighbourhood of the zero section of
the normal bundle, and parametrize nearby unparametrized embedded submanifolds by small normal
sections through it. Prove that this induces a homeomorphism onto a neighbourhood in the C¹
quotient by reparametrization; transition laws between tubular choices (choices of the domain of
the normal exponential) hold in the C¹ and C∞ topologies and on the smooth solution charts of 6.4,
not in the full Hölder Banach topology. Through `β = ι_V ω|_N`, identify the normal bundle with T*N, proving its sign in the fixed
convention (McLean1998, Corollary 3.3 and Remark 3.4, lines 486 and 493). Construct the nonlinear map

    V ↦ (exp_V* ω, exp_V* Im(e^(−iθ)Ω))

by pullback along the normal exponential of the section V (McLean1998, lines 539–550). Prove that both
components are closed and lie in the Hölder closed-form subspace L²-orthogonal to the harmonic forms
(McLean1998, Lemma 3.12, line 580), using the naturality `TauCeti.mpullback_mextDeriv` for a C² map
and a C¹ form, DifferentialGeometry 5.4's homotopy formula for C¹ forms and Stokes' theorem on
`exp_(tV)`, not by assigning a de Rham class to a Hölder form.
Derive the derivative `β ↦ (dβ, −d(★β))` at zero, where ★ is the source Hodge star
(`TauCeti.SmoothForm.hodgeStar`); the second component equals `(δβ) dvol_N` for the codifferential
`δ = d†`, compared with the formal-adjoint sign convention of `TauCeti.SmoothForm.codifferential`
and with ComplexKahlerGeometry K5a (McLean1998, Theorem 3.6 proof, line 572).
*Needs:* Tau Ceti `TauCeti.SmoothEmbedding.normalExp`,
`TauCeti.SmoothEmbedding.exists_partialDiffeomorph_normalExp_subset`, `TauCeti.mpullback_mextDeriv`,
`TauCeti.integralTopForm_mextDeriv`, `TauCeti.SmoothForm.hodgeStar`,
`TauCeti.SmoothForm.codifferential`; DifferentialGeometry 5.4; ComplexKahlerGeometry K5a; 5.3.

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

**Vector-valued constant-coefficient package.** For a constant symmetric Legendre tensor `a₀`,
construct the comparison solution v with `w − v ∈ W^(1,2)_0(B_r)` by Lax–Milgram on the
componentwise `ℝᵐ`-valued `W^(1,2)_0`, with Tau Ceti's real-valued `TauCeti.W1p` and `TauCeti.W1p0`
in each component and the scalar energy form `TauCeti.PDE.energyFormH1` and existence theorem
`TauCeti.PDE.existsUnique_isWeakSolutionDirichlet` as the scalar model: construct the componentwise
`PiLp 2` inner product `⟨u,v⟩ = ∫(u·v + Du:Du)`, prove that its norm is equivalent to the
componentwise weak-Sobolev norm and complete, and transport solutions and estimates through this
equivalence; zero-boundary Poincaré, `TauCeti.W1p.norm_value_le_mul_norm_gradient_of_subset_slab`
in each component, supplies the gradient-form coercivity. Prove the energy decay
`∫_(B_ρ)|Dv|² ≤ C(ρ/r)^n ∫_(B_r)|Dv|²` and the excess decay
`∫_(B_ρ)|Dv − (Dv)_ρ|² ≤ C(ρ/r)^(n+2) ∫_(B_r)|Dv − (Dv)_r|²`, with C depending only on dimensions,
λ and Λ, by difference quotients, Caccioppoli and PDE 1.4 (A4)'s Sobolev embeddings with interior
cutoffs; these hold for general Legendre tensors coupling all components, which the pinned scalar
constant-coefficient decay of `TauCeti/Analysis/PDE/Regularity/ConstantCoefficientDecay.lean` does
not cover.

**Campanato, Dirichlet growth and iteration, consumed.** For `f ∈ L²_loc(U; ℝᵐ)` on an open
`U ⊂ ℝⁿ`, `U′ ⊂ U` with `dist(U′, ∂U) > ρ₀ > 0` and `0 < ζ < 1`, write
`[f]_(ζ,U′) = sup{ρ^(−n−2ζ) ∫_(B_ρ(x))|f − f_(x,ρ)|² : x ∈ U′, 0 < ρ ≤ ρ₀}` (balls interior to U,
`f_(x,ρ)` the ball average). By Cauchy–Schwarz the mean oscillation `⨍_(B_ρ(x))|f − f_(x,ρ)|` is at
most `|B₁|^(−1/2) [f]_(ζ,U′)^(1/2) ρ^ζ` for these x and ρ, which is the hypothesis of Tau Ceti's local
Campanato estimate `TauCeti.MeasureTheory.dist_preciseRepresentative_le_of_setAverage_norm_sub_le`,
stated for any normed target and used here with `EuclideanSpace ℝ (Fin m)`, so no componentwise
extension is needed. It gives, for the precise representative f̃ (which agrees with f almost
everywhere), `|f̃(x) − f̃(y)| ≤ C [f]_(ζ,U′)^(1/2) |x − y|^ζ` for `x, y ∈ U′` with
`|x − y| ≤ ρ₀/2`, and the rate of convergence of the averages gives
`sup_(U′)|f̃| ≤ C([f]_(ζ,U′)^(1/2) + ‖f‖_(L²(U)))`, with `C = C(n, ζ, ρ₀)`. For pairs farther apart only
the supremum bound applies: the Campanato quantity, which sees balls of radius at most ρ₀, controls
no global Hölder seminorm on a disconnected U′, nor on a connected U′ whose diameter is large
compared with ρ₀. The statement concerns the a.e. class of f, and a pointwise Hölder conclusion is
asserted only for the continuous representative (the characterization on a connected domain is
Campanato1963, Teorema I.2, printed p. 183, line 224, with `q = 2`, `λ = n + 2ζ`). The
Dirichlet-growth consequence is Tau Ceti's Morrey theorem
`TauCeti.W1p.holderOnWith_preciseRepresentative_of_setIntegral_norm_gradient_le`, applied to each
component: `∫_(B_ρ(x))|Dw|² ≤ Mρ^(n−2+2ζ)` gives `∫_(B_ρ(x))|Dw| ≤ |B₁|^(1/2) M^(1/2) ρ^(n−1+ζ)` by
Cauchy–Schwarz, its growth hypothesis with exponent ζ. The iteration lemma is Tau Ceti's
`TauCeti.exists_le_mul_div_rpow_mul_add_mul_rpow_of_le_mul_add`, which needs the inhomogeneous
exponent strictly below the decay exponent.

**Iteration.** First apply frozen comparison to the continuous coefficients a and bounded F:
`∫_(B_ρ)|Dw|² ≤ C[(ρ/r)^n + osc_(B_r)(a)²] ∫_(B_r)|Dw|² + C r^n ‖F‖_∞²`. For a chosen γ with
`max(α, 1/2) < γ < 1`, choose the fixed C¹ ball and chart radius so that iteration gives energy growth
exponent `κ₀ = n − 2 + 2γ ∈ (0, n)`: bound `r^n ≤ R^(2−2γ) r^(κ₀)` for `r ≤ R` and apply the iteration
lemma with decay exponent n, oscillation term `ε = osc(a)²` and inhomogeneous exponent `κ₀ < n`. The
Dirichlet-growth consequence then gives a `C^(0,γ)` representative
of w, with norm controlled by `‖u‖_(C¹)`. This smallness comes from smooth x-dependence and closeness
to the zero graph, without a uniform Hölder modulus for arbitrary C¹ embeddings. Then a and F are
`C^(0,γ)`; own qualitative divergence-form Schauder for this Legendre system: a `W^(1,2)` weak
solution with `C^(0,γ)` coefficients and divergence data has a `C^(1,γ)` representative locally, with
the interior estimate, by freezing at `a(x₀)`, the full tensor excess decay and the Campanato
estimate. Applied to `w = Du` this gives `u ∈ C^(2,γ) ⊂ C^(2,α)` before PDE 5.6 (E25) and the
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
*Needs:* Tau Ceti `TauCeti.W1p`, `TauCeti.W1p0`,
`TauCeti.W1p.norm_value_le_mul_norm_gradient_of_subset_slab`, `TauCeti.PDE.energyFormH1`,
`TauCeti.PDE.existsUnique_isWeakSolutionDirichlet`,
`TauCeti.MeasureTheory.dist_preciseRepresentative_le_of_setAverage_norm_sub_le`,
`TauCeti.W1p.holderOnWith_preciseRepresentative_of_setIntegral_norm_gradient_le`,
`TauCeti.exists_le_mul_div_rpow_mul_add_mul_rpow_of_le_mul_add`; PDE 1.4 (A4), 5.6 (E25); Mathlib
Lax–Milgram;
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
- Negative control for a global Hölder bound: n = 1, `U = (−10, 10)`, `U′ = (−3, −1) ∪ (1, 3)`,
  `ρ₀ = 1/2`, and `f = 1` on `[0, 10)`, `0` elsewhere. Every ball centred in U′ of radius at most
  1/2 lies in `(−3.5, −0.5)` or `(0.5, 3.5)`, where f is constant, so `[f]_(ζ,U′) = 0`; yet
  `sup |f̃(x) − f̃(y)|/|x − y|^ζ` over `x ∈ (−3, −1)`, `y ∈ (1, 3)` is `2^(−ζ) > 0`. The local
  estimate holds (pairs within 1/4 lie in one interval) and so does the supremum bound,
  `1 ≤ C√10`.
- The same for a connected set: `f(x) = x` on `U′ = (0, L)`, `U = (−1, L + 1)`, `ρ₀ = 1/2` has
  `[f]_(ζ,U′) = (2/3)(1/2)^(2−2ζ)` for every L, while its ζ-Hölder seminorm on U′ is `L^(1−ζ)`,
  unbounded in L.

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
principal part `g^(ij)(x,u,Du) ∂_ij u`, prove uniform ellipticity and apply PDE 5.6 (E25)'s interior
non-divergence Schauder estimate componentwise;
own the difference-quotient estimates and Arzelà–Ascoli passage that bootstrap to every higher
order. Prove the parametric gain: on the finite-dimensional chart domain in harmonic one-forms,
`χ ↦ V(χ)` is smooth into `C^(k′,α)` near every point for every `k′ ≥ k`, by recentring,
differentiating the equations and uniform Schauder estimates; this proves smoothness on an open chart
domain rather than inferring it from `ContDiffAt ℝ ∞` at one point. Own the composition estimate with
loss of derivatives and compare tubular choices (domains of the normal exponential) only on these
smooth solution charts; the
reparametrization action is not asserted to be C¹ on all `C^(k,α)` embeddings. Prove chart
compatibility for different k, α and tubular choices, agreement with the local C∞ quotient topology,
and the tangent identification. No unobstructed-moduli conclusion is asserted for other calibrated
geometries or for submanifolds with boundary.
*Needs:* Mathlib `ImplicitFunctionData.contDiffAt_implicitFunction`; PDE 5.6 (E25); 5.3, 6.1, 6.2,
6.3.

**Checks.**

- The flat special Lagrangian torus `Tⁿ` in `T^(2n)`: the deformations are the n translations in the
  `y`-directions, matching `b₁(Tⁿ) = n` (McLean1998, Corollary 3.7, line 519).
- A compact special Lagrangian with `b₁ = 0` is rigid (McLean1998, Corollary 3.8, line 527).
- For n = 1 a special Lagrangian is a straight closed geodesic of phase θ in a flat 2-torus; its
  deformations are the parallel translates, a 1-dimensional family, `b₁(S¹) = 1`.

### 6.5 Second variation and the Jacobi operator

Let f be a phase-θ special Lagrangian immersion of a closed oriented manifold N (the inclusion of
the embedded N of 6.1–6.4 is one), and `F_t` a smooth family of immersions of N with `F_0 = f` and
velocity V at `t = 0` normal to `df(TN)`. Own the special Lagrangian identity
`secondVariation_volume_eq_hodgeEnergy`: the second derivative of `Vol(F_t)` at `t = 0` is
`∫_N (|dβ|² + |δβ|²) dvol` for `β = ι_V ω|_N`, the one-form
`contractionPullback ω f V` with `β_x(w) = ω(V(x), df_x w)` (contraction in the first slot), where
the density `hodgeEnergyDensity o β` is the Gram norm squared of `dβ` for
`TauCeti.alternatingFormInner` (K5a's Gram exterior norm) plus the square of the function
`⋆d⋆β = ±δβ`, computed with the rough Hodge star `TauCeti.RoughForm.hodgeStar` for the
orientation o and a Riemannian metric on N that is pointwise the pullback `f*g`, taken as an
instance tied to g by the hypothesis `⟪v, w⟫ = g(df v, df w)` (McLean1998, Theorem 3.13, p. 723,
line 598). The statement takes ω as the real 2-form `ω_x(v, w) = g_x(iv, w)` of `IsKahlerMetric`,
N oriented and of dimension the degree of Ω, and a family that consists of immersions for every
t, so that its volume is defined along the whole family; the sign convention of the codifferential
does not enter, the square of `⋆d⋆β` being independent of it. In particular the second derivative
depends only on V, not on the acceleration or the tangential motion of the family; for general
minimal immersions this acceleration independence is RiemannianGeometry R5b's, and the identity
does not use it, the second-jet argument below giving it directly. Own the pointwise second-jet
calibration identity in an
`Ω_θ`-adapted unitary frame: for a plane graph with infinitesimal matrix A, the second derivative of
`vol − Re Ω_θ` is `(tr A)² + Σ_(i<j)(A_ij − A_ji)²`, by expanding `sqrt(det(I + t²AᵀA))` and
`Re det(I + itA)`, with its coordinate-invariant form on the plane locus. For a curve of frames
`u_i(t)` in the moving ambient tangent spaces, with `S_ij = g(u_i,u_j)` and `W_ij = ω(u_i,u_j)`, prove
`det(S + iW) = |Ω_θ(u)|²` and `(vol − Re Ω_θ)″(0) = |W′(0)|²_Gram + (Im Ω_θ(u)′(0))²` at a positive
orthonormal special Lagrangian frame; the gap and its first derivative vanish there, so this second
jet depends only on the first plane variation. Integrate, use 3.2's constancy of closed-form
integrals, and identify the first variations of `F_t*ω` and `F_t*Im Ω_θ` at `t = 0` with `dβ` and
`−d(★β)`, by DifferentialGeometry 5.4's homotopy formula differentiated along the family and the
pointwise identities `ι_V ω|_N = β` and `ι_V Im Ω_θ|_N = −★β` at special Lagrangian planes (6.1's
linear identification, which is pointwise and holds along immersions); for the inclusion of the
embedded N these first variations are 6.1's derivative.

Prove that RiemannianGeometry R5b's normal Jacobi operator L of f, with `Q(V,W) = ∫⟨LV, W⟩`,
corresponds to the Hodge Laplacian under the bundle isometry `V ↦ ι_V ω|_N` of the normal bundle
onto T*N: `L = (V ↦ ι_V ω)⁻¹ ∘ (dδ + δd) ∘ (V ↦ ι_V ω)` (McLean1998, Corollary 3.14, line 603). The
map is an isometry because i carries the normal space of a Lagrangian plane isometrically onto its
tangent space. The route: L is formally self-adjoint by R5b and the Hodge Laplacian by
ComplexKahlerGeometry K5a; R5b's `Q(V,V)` is the second derivative of volume along R5b's normal
variation of V (composed with a bounded reparametrization of t equal to the identity near 0, so
that every member is an immersion), which `secondVariation_volume_eq_hodgeEnergy` evaluates as
`∫⟨(dδ + δd)β, β⟩`; two formally self-adjoint operators with the same quadratic form agree, by
polarization. Hence the kernel of L, the Jacobi fields, corresponds to the harmonic one-forms, of
dimension `b₁(N)`, which for the embedded N is 6.4's tangent space. Ellipticity and formal
self-adjointness are R5b's for L and K5a's for the Hodge Laplacian; this identification supplies
no second-variation formula for arbitrary minimal submanifolds.
*Needs:* for the identity, Tau Ceti `TauCeti.RoughForm.hodgeStar`, `TauCeti.alternatingFormInner`,
DifferentialGeometry 5.4, 3.2 and 6.1's linear identification; for the Jacobi operator,
RiemannianGeometry R5b, ComplexKahlerGeometry K5a, PseudodifferentialOperators P1.0 and 6.4.

- `contractionPullback ω f V` is linear in V and in ω, and is `f*(ι_V ω)` when V extends to a
  vector field on M; for a tangential V along a Lagrangian immersion it vanishes.
- `hodgeEnergyDensity o β` is nonnegative, vanishes exactly where `dβ = 0` and `d⋆β = 0`, and is
  unchanged by reversing o (both `dβ` and `⋆d⋆β` change at most by sign).

**Checks.**

- Contraction sign: in the positive flat plane ℝⁿ ⊂ ℂⁿ with `V = Σ a_j ∂_(y_j)`,
  `contractionPullback ω f V = −Σ a_j dx_j`, since `ω(∂_(y_j), ∂_(x_j)) = g(i∂_(y_j), ∂_(x_j)) = −1`;
  contracting in the second slot would give `+Σ a_j dx_j`.
- On the flat torus `T²` with `β = sin(2πx₁) dx₂`: `dβ = 2π cos(2πx₁) dx₁∧dx₂`, so
  `|dβ|² = 4π² cos²(2πx₁)` in the Gram norm (a `1/2!` normalization would halve it), while
  `⋆β = −sin(2πx₁) dx₁` is closed and `δβ = 0`; the energy is `∫ = 2π²`.
- On `T²` with `β = sin(2πx₁) dx₁`: `dβ = 0`, `⋆β = sin(2πx₁) dx₂`, `d⋆β = 2π cos(2πx₁) dx₁∧dx₂`
  and `⋆d⋆β = 2π cos(2πx₁)`, the same density `4π² cos²(2πx₁)`; a definition without the `|δβ|²`
  term would give 0.
- The theorem at n = 1 (m = 0): the circle `{y = 0}` in the flat torus `ℂ/(ℤ + iℤ)` is special
  Lagrangian of phase 0; for the family `F_t(x) = (x, t a(x))` with `a = ε sin(2πx)`, the length
  `∫₀¹ sqrt(1 + t²a′(x)²) dx` has second derivative `∫₀¹ a′² = 2π²ε²` at `t = 0`; on the other
  side `β = −a dx`, `dβ = 0` on a 1-manifold, `⋆β = −a`, `⋆d⋆β = −a′`, and
  `∫ a′² dx = 2π²ε²`. A constant a gives a translation and 0 on both sides.
- n = 1, `A = (a)`: the plane spanned by `1 + ita` has `vol = sqrt(1 + t²a²)` and `Re Ω = 1`, second
  derivative `a² = (tr A)²`.
- n = 2, `A = diag(1, −1)`: `vol = 1 + t² = Re det(I + itA)`, second derivative 0, matching
  `(tr A)² = 0` and zero antisymmetric part (the graph of a harmonic quadratic is special Lagrangian).
- n = 2, `A = [[0,1],[−1,0]]`: `vol = 1 + t²`, `Re det(I + itA) = 1 − t²`, second derivative 4, equal
  to `(A₁₂ − A₂₁)² = 4`; on the frame side `W₁₂(t) = 2t`, `|W′(0)|² = 4` and `Im Ω = 0`.
- Immersions: the double cover `f(x) = 2x` of the circle `{y = 0}` in `ℂ/(ℤ + iℤ)`, with
  `N = ℝ/ℤ`, is a special Lagrangian immersion of phase 0 and not an embedding. For
  `F_t(x) = 2x + itε sin(2πx)` the length `∫₀¹ sqrt(4 + 4π²t²ε² cos²(2πx)) dx` has second
  derivative `∫₀¹ 2π²ε² cos²(2πx) dx = π²ε²` at `t = 0`; on the other side `f*g = 4dx²`,
  `β = −2ε sin(2πx) dx`, `⋆d⋆β = −πε cos(2πx)` and `∫₀¹ π²ε² cos²(2πx)·2dx = π²ε²`. Computing the
  energy with the metric `dx²` instead of `f*g` gives `8π²ε²`.
- Jacobi operator on the flat torus `T² ⊂ ℂ²/(ℤ² + iℤ²)` with `V = a(x₁)∂_(y₂)`: R5b's
  `Q(V,V) = ∫|∇⊥V|² = ∫a′²` (flat ambient, `B = 0`), so `LV = −a″∂_(y₂)`; `β = −a dx₂` and
  `(dδ + δd)β = a″ dx₂ = ι_(LV)ω`. For `a = ε sin(2πx₁)` both quadratic forms are `2π²ε²`, the second
  derivative of the area `∫ sqrt(1 + t²a′²)`. Matching L with `−(dδ + δd)` would send V to
  `+a″∂_(y₂)`. The kernel of L is the constant normal fields, `n = b₁(Tⁿ)` of them in general.

### Examples

For the flat special Lagrangian torus `Tⁿ = ℝⁿ/ℤⁿ` in `ℂⁿ/(ℤⁿ + iℤⁿ)`, the moduli space near `Tⁿ` is
the n-torus of vertical translates, its L² metric is the flat metric scaled by `Vol(Tⁿ) = 1`, and
the second variation along `V = Σ a_j ∂_(y_j)` is 0.

### Dependencies

6.1 needs 5.3 and Tau Ceti's normal exponential; 6.2 needs PseudodifferentialOperators P5–P6 and
ComplexKahlerGeometry K5a; 6.3 needs Tau Ceti's Sobolev and Campanato estimates, PDE and 5.1; 6.4
needs 6.1, 6.2 and 6.3; 6.5 needs 3.2, DifferentialGeometry 5.4 and 6.1's linear identification for
the second-variation identity, and RiemannianGeometry R5b, ComplexKahlerGeometry K5a and 6.4 for the
Jacobi operator.

## Downstream consumers

- FukayaTheory consumes C2's integral smooth-to-singular comparison on Tau Ceti's smooth-simplex
  carrier.
- GeometricCurrents G1–G3 and G6 cite 1.2–1.3 for the comass/Gram and simple-vector comparison,
  which Tau Ceti owns (`ContinuousAlternatingMap.le_opNorm_mul_norm_ιMulti`,
  `ContinuousAlternatingMap.opNorm_le_iff_le_mul_norm_ιMulti`, `TauCeti.alternatingFormEquiv`);
  1.2–1.3 here record that identification, the norm-determinant identity and the Hilbert-norm
  comparison. They consume 1.4 (the oriented-frame quotient topology of the Grassmannian), 2.3 (chain integration and Stokes
  on the integral chains of Tau Ceti's smooth singular subcomplex, the smooth-to-singular
  quasi-isomorphism with the integer generator maps and both face-compatible chain homotopies, and
  the agreement of integration with coefficient change), 2.4 (finite oriented relative fundamental
  chains) and 3.1–3.2 (the calibration minimum, its stability consequence and the oriented-chain
  comparison).
- RiemannianGeometry R5a.1's relative-volume functional and R5b's stability are consumed by C3, and
  R5b's normal Jacobi operator by C6; RiemannianGeometry consumes nothing from this roadmap.

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
- Hatcher, *Vector Bundles and K-Theory*, version 2.2 (2017),
  [author's page](https://pi.math.cornell.edu/~hatcher/VBKT/VB.pdf) (Hatcher2017VBKT; line numbers
  refer to version 2.2).
- Lee, *Introduction to Smooth Manifolds*, 2nd ed., Graduate Texts in Mathematics 218 (2012),
  [doi:10.1007/978-1-4419-9982-5](https://doi.org/10.1007/978-1-4419-9982-5) (Lee2012ISM,
  uncertified: cited by locator only).

The mathematical targets and conventions above are authoritative; reference notation does not
override the native carriers or these conventions.
