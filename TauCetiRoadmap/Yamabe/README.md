# Roadmap: the Yamabe problem and conformal scalar curvature

**Summary.** Develop conformal scalar-curvature geometry on closed smooth manifolds, the sharp
critical Sobolev inequality, the variational and blow-up analysis of the conformal Laplacian, and
the existence and rigidity theory of Yamabe metrics. The headline theorems are the converse
Weyl–Schouten theorem, the sharp Euclidean Sobolev inequality with its equality cases, Aubin's
bound `Y ≤ Y(Sⁿ)`, Theorem A (a minimizer exists when `Y < Y(Sⁿ)`), Aubin's strict inequality for
`n ≥ 6` at a point of nonzero Weyl tensor (Theorem B), Schoen's strict inequality off the
conformal sphere in dimensions 3–5 and for locally conformally flat manifolds (Theorem C), the
Yamabe theorem, uniqueness when `Y ≤ 0`, Obata's rigidity theorems and the characterization of
the conformal sphere by `Y = Y(Sⁿ)`. The low-dimensional Green-function argument, the
all-dimensional locally conformally flat argument and the Weyl-curvature test functions in higher
dimensions are all built. The conformal Laplacian, the Yamabe quotient, the conformal laws of
curvature, the Weyl and Cotton tensors, local conformal flatness, the bubbles and the homogeneous
space `D¹,²` are Tau Ceti's; the positive mass theorems are PositiveMass's.

## Scope and ownership

This roadmap owns:

- Layer 0: the finite-regularity conformal laws, the weak-domain conformal invariance of the
  Yamabe quotient and its weak Euler–Lagrange equation, the round-sphere volume and stereographic
  change of variables, the comparison of local conformal flatness with conformal Euclidean charts,
  and the converse Weyl–Schouten theorem.
- Layer 1: the scalar Sobolev carriers of a closed manifold, the realization and first
  eigenvalue of the conformal Laplacian, the local estimates and the critical bootstrap, and the
  Green function of L_g.
- Layer 2: the sharp Euclidean Sobolev inequality, its equality cases and its transfer to closed
  manifolds with an ε loss.
- Layer 3: the Yamabe invariant, Aubin's bound, the subcritical minimizers and Theorem A.
- Layer 4: conformal normal coordinates, the cutoff-bubble Taylor bounds and the Green
  expansions with the constant A.
- Layer 5: Aubin's strict inequality, Theorem B.
- Layer 6: the Green blow-up, the identity `m_ADM = 2A`, the glued test function and the
  zero-mass compactification.
- Layer 7: Theorem C in dimensions 3–5, through PositiveMass 8.1.
- Layer 8: the developing map of a locally conformally flat manifold, the lifted blow-up and
  Theorem C for locally conformally flat manifolds, through PositiveMass 8.3.
- Layer 9: the Yamabe theorem, uniqueness when `Y ≤ 0`, Obata's theorems with the equality case
  of the Lichnerowicz bound, and the characterization of the conformal sphere.
- Layer 10: the examples of the quotient and the invariant, the cylinder ODE and the invariant
  `σ(M)`.

Boundaries with other roadmaps:

- Tau Ceti proves the conformal Laplacian, its covariance, the scalar law, the energy identity,
  the Yamabe quotient with its Euler–Lagrange equation, the conformal laws of the connection and
  curvature for smooth metrics, the Weyl and Cotton tensors with `div W = (n − 3)C` and the
  integrability identity of the conformal flattening equation, local conformal flatness with the
  forward Weyl–Schouten implications, the bubbles with their energies, moments and cutoff
  estimates, the area of the round sphere and the homogeneous space `D¹,²`. These are supplier
  contracts below; the items consume them and own only what the pin lacks.
- [PositiveMass](../PositiveMass/README.md) is a supplier of this roadmap and consumes nothing
  from it. It owns asymptotically Euclidean ends, the ADM mass and its normalization (0.2), the
  scalar law for `φ^(4/(n−2))g` and the mass shift under a conformal factor (0.4), the
  positive-scalar metric from a positive first eigenfunction (3.0), the torus obstruction to
  positive scalar curvature (3.1), and the positive mass theorems with rigidity (8.1, 8.3) with
  their isometry and finite-cover invariance (8.4). This roadmap owns the identity `m = 2A` for
  the actual Green metric, including its normal-coordinate curvature terms, the conformal
  developing map, the completeness of the lifted blow-up and the compactification of the
  zero-mass conclusion.
- [RiemannianGeometry](../RiemannianGeometry/README.md) owns the curvature calculus and the
  conformal formulas for `e^(2f)g` (R1), the realization of `Δ⁺+q` on a closed manifold and its
  principal eigenfunction (R5c), and the scalar Bochner identity with the equality case of the
  Lichnerowicz bound (R7.0). Obata's theorem is Y9.3's; R7.0 cites it there.
- [DifferentialGeometry](../DifferentialGeometry/README.md) owns the orientation cover (2), local
  Frobenius (4.3) and the gradient, divergence, Laplace–Beltrami operator and densities
  (12.2–12.5); Y0 owns their conformal behaviour, not replacement operators.
- [PDE](../PDE/README.md) owns the Euclidean weak spaces and estimates; ComplexKahlerGeometry K5a
  owns the bundle Sobolev scales and the Laplace-type realization on closed manifolds; Y1 builds
  the scalar closed-manifold comparison.
- [GeometricMeasureTheory](../GeometricMeasureTheory/README.md) G2–G3 own the area and change of
  variables formulas; Sobolev rearrangement and its equality classification are Y2's.
- SpinGeometry, SmoothBundlesConnections, CharacteristicClasses, AlgebraicTopology and the
  completed UniversalCovers roadmap own Spin structures, frame bundles, van Kampen and universal
  covers; Y8 owns the Spin lift of the round sphere, the conformal developing map and the
  metric-completeness adapters built on them.

## Conventions

Unless a Euclidean or complete auxiliary space is specified, M is a nonempty connected closed
smooth real n-manifold, n≥3, with a smooth positive Riemannian metric g. Hausdorffness and second
countability are explicit. No orientation is required. Use native manifold tangent bundles and
`Bundle.ContMDiffRiemannianMetric`, including `Bundle.ContMDiffRiemannianMetric.rescale` for
positive conformal factors. Use Tau Ceti's orientation-free `TauCeti.riemannianVolume`; compare
its density with oriented integration in every oriented-coordinate computation. The scalar
curvature is the full trace of Ricci, so a unit round sphere has scalar n(n−1). The curvature is
`R(X,Y)Z=∇_X∇_YZ−∇_Y∇_XZ−∇_[X,Y]Z` and `Rm(X,Y,Z,W)=⟨R(X,Y)Z,W⟩`, so on the unit sphere
`Rm(X,Y,Y,X)=1` for orthonormal X, Y. Use the nonnegative Laplacian Δ⁺=−div grad; Tau Ceti's
`TauCeti.Manifold.laplaceBeltrami` is `div grad`, so Δ⁺ is its negative.

Set a_n=4(n−1)/(n−2), p_n=2n/(n−2) (Lee–Parker, notation after (1.1), p. 38), and

`L_g=a_n Δ⁺_g+Scal_g`,

`Q_g(u)=[∫(a_n|du|²+Scal_g u²)dV_g]/[∫|u|^(p_n)dV_g]^(2/p_n)`,

which are Tau Ceti's `TauCeti.Yamabe.conformalLaplacian` and `TauCeti.Yamabe.yamabeQuotient`
with `TauCeti.Yamabe.conformalCoefficient` and `TauCeti.Yamabe.criticalExponent`. The domain of Q
is the nonzero real H¹ space. Its infimum is Y(M,[g]); prove the same infimum is obtained from
positive smooth functions (Lee–Parker, (1.5), p. 39, and p. 49). Metric rescaling is
`ĝ=u^(4/(n−2))g` with u smooth and strictly positive. Products, curvature traces, weak
derivatives and integrals use the native carriers, not a second private definition of
Riemannian manifold or Sobolev function. Two metrics on M are compared on Tau Ceti's
metric-indexed copies `TauCeti.WithMetric`, related by the identity diffeomorphism
`TauCeti.WithMetric.diffeomorphWithMetric`, whose inner product is
`TauCeti.WithMetric.inner_def` and, for a rescaling, the explicit
`Bundle.ContMDiffRiemannianMetric.rescale_inner` formula. Comparing two metrics must never
install two incompatible metric instances on the same carrier.

The sphere area `|Sⁿ|` is Tau Ceti's `TauCeti.roundSphereVolume`, the normalized n-dimensional
Hausdorff measure of the unit sphere of ℝ^(n+1), and `Y(Sⁿ)=n(n−1)|Sⁿ|^(2/n)` is
`TauCeti.Yamabe.sphereYamabeConstant`. The bubbles are
`U_(λ,b)(x)=(2λ/(λ²+|x−b|²))^((n−2)/2)`, λ>0, Tau Ceti's `TauCeti.Yamabe.bubble`;
`U_(1,0)^(4/(n−2))δ` is the round metric in stereographic coordinates. The Green function G_p of
L_g at p is normalized by `L_g G_p=a_n(n−2)|S^(n−1)| δ_p`, so its leading singularity is
`r^(2−n)`. The ADM mass is PositiveMass 0.2's, the normalized flux divided by
`2(n−1)|S^(n−1)|`, in which `(1+c r^(2−n))^(4/(n−2))δ` has mass 2c.

Witnesses: on the unit S³, `L=8Δ⁺+6`; on the unit S⁴, `L=6Δ⁺+12`; on ℝⁿ, `L=a_n(−Δ)`. A law with
`(n−2)/(4(n−1))` in place of a_n would give the n=3 bubble metric scalar curvature `3/32` at the
origin instead of 6.

## Exact supplier contracts

### From Mathlib

- `Bundle.ContMDiffRiemannianMetric`, `Bundle.RiemannianBundle`, `IsContMDiffRiemannianBundle`,
  `IsContinuousRiemannianBundle` and `IsRiemannianManifold`
  (`Mathlib/Geometry/Manifold/VectorBundle/Riemannian.lean`,
  `Mathlib/Geometry/Manifold/Riemannian/Basic.lean`): the metric carriers.
- `CovariantDerivative.leviCivitaConnection`
  (`Mathlib/Geometry/Manifold/VectorBundle/CovariantDerivative/LeviCivita.lean`).
- `MeasureTheory.Measure.euclideanHausdorffMeasure`
  (`Mathlib/Geometry/Euclidean/Volume/Measure.lean`), the normalized Hausdorff measure behind
  `TauCeti.roundSphereVolume`.
- `MeasureTheory.eLpNorm_le_eLpNorm_fderiv_of_eq`
  (`Mathlib/Analysis/FunctionalSpaces/SobolevInequality.lean`): the Gagliardo–Nirenberg–Sobolev
  inequality with a non-sharp constant, the a priori input of Y1 and Y2.4.
- `Diffeomorph`, `ContMDiff`, `mfderiv` and `IsMinOn`: the carriers of the statements of
  `Suggested.lean`.

### From Tau Ceti

Each item names its module under `TauCeti/`.

- `Analysis/PDE/Yamabe/`: the conformal Laplacian `TauCeti.Yamabe.conformalLaplacian`, its
  covariance `TauCeti.Yamabe.conformalLaplacian_rescale`, the scalar law
  `TauCeti.Yamabe.scalarCurvature_rescale_eq_rpow_mul_conformalLaplacian` and its Yamabe-equation
  form `TauCeti.Yamabe.scalarCurvature_rescale_eq_iff_conformalLaplacian_eq`, the Euclidean and
  constant-rescaling forms
  `TauCeti.Yamabe.conformalLaplacian_eq_conformalCoefficient_mul_neg_laplacian` and
  `TauCeti.Yamabe.conformalLaplacian_rescale_const` (`ConformalLaplacian.lean`); integration by
  parts, formal symmetry, the energy identity and its conformal invariance
  `TauCeti.Yamabe.integral_mul_conformalLaplacian`,
  `TauCeti.Yamabe.integral_mul_conformalLaplacian_right_eq_left`,
  `TauCeti.Yamabe.integral_mul_conformalLaplacian_self`, `TauCeti.Yamabe.integral_energy_rescale`
  (`Energy.lean`); the volume-normalized total scalar curvature
  `TauCeti.Yamabe.integral_scalarCurvature_rescale_div_riemannianTotalVolume_rpow`
  (`TotalScalarCurvature.lean`); the Yamabe quotient `TauCeti.Yamabe.yamabeQuotient`, its first
  variation and Euler–Lagrange equation
  `TauCeti.Yamabe.forall_hasDerivAt_yamabeQuotient_add_smul_iff_exists_conformalLaplacian_eq`, with
  the multiplier `TauCeti.Yamabe.yamabeQuotient_eq_of_conformalLaplacian_eq_of_integral_eq_one`
  (`Quotient.lean`); `TauCeti.Yamabe.sphereYamabeConstant` (`SphereConstant.lean`); and the bubbles
  `TauCeti.Yamabe.bubble` with `TauCeti.Yamabe.conformalCoefficient_mul_neg_laplacian_bubble`,
  `TauCeti.Yamabe.conformalCoefficient_mul_integral_norm_fderiv_bubble_sq_eq_sphereYamabeConstant`,
  `TauCeti.Yamabe.inner_mfderiv_stereographic'_symm_smul_sub` and the decay, moment and cutoff
  estimates of `Bubble/{Basic,Decay,Energy,Moments,Cutoff,SobolevQuotient,Stereographic}.lean`.
- Conformal change of metric: `Bundle.ContMDiffRiemannianMetric.rescale`,
  `Bundle.ContMDiffRiemannianMetric.rescale_inner`,
  `Bundle.ContMDiffRiemannianMetric.conformalClass` with
  `Bundle.ContMDiffRiemannianMetric.mem_conformalClass_iff_existsUnique_rpow`,
  `Bundle.ContMDiffRiemannianMetric.rescale_const_mul_rpow`,
  `Bundle.ContMDiffRiemannianMetric.rescale_rescale` and
  `Bundle.ContMDiffRiemannianMetric.rescale_inv_rescale`
  (`Geometry/Manifold/VectorBundle/Riemannian/Conformal.lean`);
  `Bundle.ContMDiffRiemannianMetric.pullback_rescale` (`Riemannian/Pullback/Basic.lean`);
  `Bundle.ContMDiffRiemannianMetric.leviCivitaConnection_rescale_apply`
  (`CovariantDerivative/LeviCivita/Conformal.lean`); the curvature-operator, curvature, Ricci,
  scalar, Schouten, Weyl and Cotton laws
  `Bundle.ContMDiffRiemannianMetric.curvatureOperator_leviCivitaConnection_rescale`,
  `Bundle.ContMDiffRiemannianMetric.curvatureTensor_leviCivitaConnection_rescale`,
  `Bundle.ContMDiffRiemannianMetric.ricciTensor_leviCivitaConnection_rescale`,
  `Bundle.ContMDiffRiemannianMetric.scalarCurvature_rescale`,
  `Bundle.ContMDiffRiemannianMetric.schoutenTensor_leviCivitaConnection_rescale`,
  `Bundle.ContMDiffRiemannianMetric.weylTensor_leviCivitaConnection_rescale`,
  `Bundle.ContMDiffRiemannianMetric.cottonTensor_leviCivitaConnection_rescale` and
  `Bundle.ContMDiffRiemannianMetric.cottonTensor_leviCivitaConnection_rescale_of_finrank_eq_three`
  (`CovariantDerivative/Curvature/Conformal.lean`);
  `Bundle.ContMDiffRiemannianMetric.hessian_rescale_rpow` and
  `Bundle.ContMDiffRiemannianMetric.laplaceBeltrami_rescale` (`Riemannian/Hessian/Conformal.lean`);
  `TauCeti.WithMetric.inner_mgradient_rescale` (`Riemannian/Conformal.lean`);
  `TauCeti.WithMetric.integral_riemannianVolume_rescale`,
  `TauCeti.WithMetric.riemannianTotalVolume_rescale_rpow` and
  `TauCeti.WithMetric.integral_abs_rpow_rescale_rpow` (`Riemannian/VolumeDensity/Conformal.lean`);
  the copies `TauCeti.WithMetric` with `TauCeti.WithMetric.diffeomorphWithMetric` and
  `TauCeti.WithMetric.inner_def` (`Riemannian/WithMetric.lean`); `TauCeti.riemannianVolume` and
  `TauCeti.riemannianTotalVolume` (`Riemannian/VolumeDensity/`).
- Conformal curvature (`Geometry/Manifold/VectorBundle/CovariantDerivative/Curvature/`):
  `CovariantDerivative.schoutenTensor` (`Schouten.lean`); `LinearMap.BilinForm.kulkarniNomizu`
  (`LinearAlgebra/BilinearForm/KulkarniNomizu.lean`); `CovariantDerivative.weylTensor` with its
  symmetries, trace-freeness and vanishing in dimension three (`Weyl/Basic.lean`); the divergence
  `CovariantDerivative.IsMetricCompatible.sum_derivWeylTensor_self_eq_mul_cottonTensor`,
  `div W=(n−3)C` (`Weyl/Divergence.lean`); the integrability defect of the conformal flattening
  equation `CovariantDerivative.IsMetricCompatible.conformalFlatteningDeriv_sub_swap` and its
  vanishing under W=C=0,
  `CovariantDerivative.IsMetricCompatible.conformalFlatteningDeriv_sub_swap_eq_inner_curvatureTensor`
  (`Weyl/Integrability.lean`); `CovariantDerivative.cottonTensor` (`Cotton.lean`);
  `Bundle.ContMDiffRiemannianMetric.IsLocallyConformallyFlat` with its conformal invariance,
  `Bundle.ContMDiffRiemannianMetric.IsLocallyConformallyFlat.weylTensor_eq_zero`,
  `Bundle.ContMDiffRiemannianMetric.IsLocallyConformallyFlat.cottonTensor_eq_zero`,
  `TauCeti.Manifold.isLocallyConformallyFlat_rescale_model_space` and the reduction
  `Bundle.ContMDiffRiemannianMetric.isLocallyConformallyFlat_iff_forall_weylTensor_eq_zero_and_forall_exists_eventually_hessian_eq`
  (`ConformallyFlat.lean`).
- `TauCeti.roundSphereVolume` with `TauCeti.roundSphereVolume_pos` and
  `TauCeti.roundSphereVolume_eq_two_mul_pi_rpow_div_Gamma`
  (`Geometry/Euclidean/Volume/Sphere.lean`);
  the round metric `TauCeti.sphereRoundMetric` (`Riemannian/Sphere/Basic.lean`) with its scalar
  curvature `TauCeti.scalarCurvature_sphereRoundMetric_ofLE` (`Riemannian/Sphere/Curvature.lean`);
  `TauCeti.RiemannianIsometry` (`Riemannian/Isometry/Basic.lean`).
- The homogeneous space `TauCeti.D1p0` with `TauCeti.D1p0.ofTestFunctionₗ`,
  `TauCeti.D1p0.sobolevEmbeddingL` and `TauCeti.D1p0.sobolevEmbeddingL_injective`
  (`Analysis/Sobolev/D1p0/Basic.lean`), its translations `TauCeti.D1p0.translate` and dilations
  `TauCeti.D1p0.dilate` (`D1p0/Translation.lean`, `D1p0/Dilation.lean`); the Euclidean Sobolev
  modules `Analysis/Sobolev/W1p/{Basic,Density,ChainRule}`, `Analysis/Sobolev/Embedding` with
  `TauCeti.W1p0.sobolevEmbeddingL`, `Analysis/Sobolev/RellichKondrachov` and
  `Analysis/PDE/FundamentalSolution/Euclidean/{Basic,DistributionalLaplacian}`.
- The critical Sobolev estimate for `C¹` functions on a closed manifold
  `TauCeti.Manifold.exists_eLpNorm_le_mul_eLpNorm_mgradient_two_add` (`Riemannian/Sobolev.lean`);
  the Lichnerowicz bound `TauCeti.Manifold.finrank_mul_le_of_laplaceBeltrami_eq_neg_mul`
  (`Riemannian/Lichnerowicz.lean`); `TauCeti.Manifold.hessian` and
  `TauCeti.Manifold.laplaceBeltrami` (`Riemannian/Laplacian.lean`).

### From TauCetiRoadmap.RiemannianGeometry

[RiemannianGeometry](../RiemannianGeometry/README.md) R1–R4: Levi-Civita connection, full scalar
curvature, the general conformal-change formulas for `e^(2f)g`, geodesics, normal coordinates and
density, and comparison geometry; R1.1 item 3: flat curvature on an open set is equivalent to a
local Euclidean isometry around every point. R5c: the closed-case self-adjoint realization of
`Δ⁺+q` with its eigenbasis, independent of the shift; R5c item 1: on a closed connected manifold
the lowest eigenvalue of `Δ⁺+q` is the least Rayleigh quotient, simple, with a smooth positive
eigenfunction; R5c item 2: a smooth `h>0` with `(Δ⁺+q)h=0` exists exactly when that eigenvalue is
0. R7.0: the scalar Bochner identity and the equality case of the Lichnerowicz bound: for
Ric≥(n−1)kg, k>0, a nonzero mean-zero eigenfunction of `Δ⁺` with eigenvalue nk satisfies
`Hess f=−kfg`. The normal-coordinate normalization and Obata's theorem are targets here.

### From TauCetiRoadmap.PositiveMass

[PositiveMass](../PositiveMass/README.md) 0.2: the ADM mass, its normalization and its existence
for order `t>(n−2)/2` with integrable scalar curvature; under a finite Riemannian covering each
end lifts to deg copies with the mass of the end below. 0.4: the scalar law for `φ^(4/(n−2))g`;
the mass `m(g)+2c` of `u^(4/(n−2))g` for `u=1+c r^(2−n)+o_2(r^(2−n))`; the inversion of a
normalized Green expansion; the lifts of ends to finite covers. 3.0: for λ₁(L_g)>0 with positive
eigenfunction φ, the metric `φ^(4/(n−2))g` of scalar curvature `λ₁φ^(−4/(n−2))>0`. 3.1: a closed
oriented d-manifold, 3≤d≤7, with a nonzero-degree map to `T^d` has no metric of positive scalar
curvature. 3.2: the
orientation double cover, which removes orientability from 8.1. 8.1: positivity and rigidity of
the mass of every end of a complete connected finite-ended AE manifold, 3≤n≤7, Scal≥0, with no
Spin or orientation hypothesis. 8.3: the same for one AE end of a complete connected spin
manifold whose other ends are arbitrary, every n≥3. 8.4: invariance of 8.1–8.3 under isometries
and finite covers. The geometric end, mass and Spin hypotheses are verified in Y6–Y8.

### From TauCetiRoadmap.DifferentialGeometry

[DifferentialGeometry](../DifferentialGeometry/README.md) 2: the orientation cover and smooth
covering transport; 4.3: local Frobenius; 12.2–12.5: generic manifold gradient, divergence,
Laplace–Beltrami, integration by parts, density and volume comparison, with their tensor,
partition and integration foundations.

### From TauCetiRoadmap.PDE

[PDE](../PDE/README.md) Layers 1, 3, 4 and 5 (A1–A7, C12–C15, D16–D19, E20–E26): Euclidean weak
Sobolev spaces, smooth density, extension, compact embedding below the critical exponent,
maximum and Harnack principles, linear elliptic existence and local and boundary estimates.
Y1–Y3 construct the closed-manifold, critical and conformal-Laplacian bridges explicitly.

### From TauCetiRoadmap.ComplexKahlerGeometry

[ComplexKahlerGeometry](../ComplexKahlerGeometry/README.md) K5a: generic finite-rank real and
complex bundle distributions, all-real-order Hilbert Sobolev scales, realification, compact
Rellich, Laplace-type regularity and the geometric L² realization. These are written supplier
targets, and Y1 uses their real rank-one specialization.

### From TauCetiRoadmap.GeometricMeasureTheory

[GeometricMeasureTheory](../GeometricMeasureTheory/README.md) G2–G3: normalized Hausdorff area
and change of variables for spherical and stereographic integration.

### From the topology, bundle, Spin and covering roadmaps

[AlgebraicTopology](../AlgebraicTopology/README.md) Layer 1: van Kampen on the native
fundamental-groupoid carrier. [SmoothBundlesConnections](../SmoothBundlesConnections/README.md)
B1.4 and [CharacteristicClasses](../CharacteristicClasses/README.md) C1: associated principal
bundles and the oriented orthonormal frame bundle used by the sphere Spin lift.
[SpinGeometry](../SpinGeometry/README.md) G3–G5, with G4.2: Spin pullback and metric change.
[UniversalCovers](../../Completed/UniversalCovers/README.md) Stages 1–4: the native universal
cover, deck group and lifting theory.

## How to read the build

Layer k is cited as Yk and its subsection k.n as Yk.n; "Yk item n" means Yk.n. Layer 0 consumes
Tau Ceti's conformal geometry and proves what it lacks, ending with the converse Weyl–Schouten
theorem. Layer 1 builds the closed-manifold analysis of L_g, Layer 2 the sharp Euclidean
Sobolev theory, and Layer 3 the variational theory below the sphere threshold, Theorem A. Layer 4
builds conformal normal coordinates and the Green expansions. Y4–Y6's expansions and
test-function construction and Y8.1's developing geometry use no positive-mass theorem. Layer 5
proves Theorem B from Layer 4 alone. PositiveMass 8.1 and 8.3 then supply positivity and
Euclidean rigidity; Y6's zero-mass compactification, Y7 and Y8.2–Y8.4 consume them. Y8.1 precedes
the zero-mass compactification even in dimensions 3–5. Layer 9 concludes existence, uniqueness and
rigidity, and Layer 10 collects examples and the invariant σ. The Lean name at each headline
target is its signature in `Suggested.lean`.

## Layer 0 (Y0): conformal tensors and the conformal Laplacian

### 0.1 Conformal laws

Consume RiemannianGeometry R1's connection, Ricci and scalar formulas for ĝ=e^(2f)g, DG12's
gradient, divergence and Laplacian carriers, and Tau Ceti's conformal laws for ĝ=fg: connection,
curvature, Ricci, scalar, Schouten, Weyl and Cotton tensors, gradient (the inverse metric),
Hessian, Laplacian, volume density, composition and inversion of rescalings, and pullback, with
the Hessian and Laplacian laws already specialized to `u^p g`. The tensor laws are pinned for a
smooth metric and factor, the curvature-operator law at finite differentiability. Prove the
Ricci, scalar, Schouten, Weyl and Cotton laws at the actual finite differentiability levels each
term needs, and specialize them to ĝ=u^(4/(n−2))g (Lee–Parker, (2.5)–(2.6), p. 43, and (1.1),
p. 38). Construct the tensor transports between the copies `TauCeti.WithMetric` along
`TauCeti.WithMetric.diffeomorphWithMetric`.

**Checks.**

- u≡c on the unit Sⁿ: ĝ is the round sphere of radius `c^(2/(n−2))`, of scalar curvature
  `n(n−1)c^(−4/(n−2))`, and the law gives `c^(−(n+2)/(n−2))·n(n−1)c`, the same.
- The exponents: `4/(n−2)` and `−(n+2)/(n−2)` are 4 and −5 for n=3, 2 and −3 for n=4, 1 and −2
  for n=6.
- `U_(1,0)^(4/(n−2))δ=4(1+|x|²)^(−2)δ` on ℝⁿ is the round metric in stereographic coordinates;
  rescaling by u and then by v is rescaling by uv, since `u^(4/(n−2))v^(4/(n−2))=(uv)^(4/(n−2))`.

*Needs:* RiemannianGeometry R1; DifferentialGeometry 12.2–12.5; the Tau Ceti conformal laws.

### 0.2 The conformal Laplacian and the Yamabe quotient

Consume Tau Ceti's `TauCeti.Yamabe.scalarCurvature_rescale_eq_rpow_mul_conformalLaplacian` and
`TauCeti.Yamabe.conformalLaplacian_rescale` (`TauCeti/Analysis/PDE/Yamabe/ConformalLaplacian.lean`)
for `Scal_ĝ=u^(-(n+2)/(n−2)) L_g u` and `L_ĝ(v)=u^(-(n+2)/(n−2)) L_g(uv)` (Lee–Parker, (1.1),
p. 38, and (2.7), p. 43), and its formal symmetry, integration-by-parts energy identity and
conformal invariance of the energy and of the critical integral on smooth functions. Deduce
`Q_ĝ(v)=Q_g(uv)` for smooth v, and prove it on the weak domain. Extend positive smooth
multiplication to the Sobolev spaces and prove it is an isomorphism; smooth identities alone do
not establish the weak-domain assertion.

**API.**

- Multiplication by a positive smooth u is an isomorphism of H¹ with inverse multiplication by
  `u⁻¹`, and `Q_ĝ(v)=Q_g(uv)` on the nonzero H¹ space.
- `Q_g(cv)=Q_g(v)` for c≠0 on H¹, extending the pinned smooth case.

**Checks.**

- On the unit S³, `L=8Δ⁺+6`, `L1=6`, and `Q(1)=6|S³|^(1−1/3)=6(2π²)^(2/3)≈43.82=Y(S³)`.
- On ℝⁿ, `L=a_n(−Δ)`, and the bubble identity `a_3Δ⁺U_(1,0)(0)=24√2=6U_(1,0)(0)^5` holds with
  `U_(1,0)(0)=√2`, so `U_(1,0)^4δ` has scalar curvature 6 at the origin. A law with
  `(n−2)/(4(n−1))=1/8` in place of `a_3=8` gives `3/32` there.
- `Q(2)=Q(1)` on the unit S³: both numerator and denominator scale by 4.

*Needs:* the Tau Ceti conformal Laplacian and energy identity; 0.1; Y1.1 for the weak domain.

### 0.3 The conformal class and the Euler–Lagrange equation

Consume Tau Ceti's conformal class with its positive-function parametrization, constant-factor
redundancy and pullback, `Vol(ĝ)=∫u^(p_n)dV_g`, the volume-normalized scalar-functional
identity, and, for `C²` functions, the equivalence between critical points of Q and solutions of
`L_g u=λ|u|^(p_n−2)u` (Lee–Parker, (1.2)–(1.4), pp. 38–39), its form for u≥0 and the
identification of λ with Q at unit Lp norm. Prove the equivalence between critical points of Q on
the nonzero H¹ space and weak solutions of `L_g u=λ|u|^(p_n−2)u`, specialize it to u≥0, and
identify λ with Q at unit Lp norm on H¹.

**Checks.**

- The unit-L⁶ constant `u=|S³|^(−1/6)` on the unit S³ solves `Lu=6u=λu^5` with
  `λ=6|S³|^(2/3)=6(2π²)^(2/3)≈43.82`, which is Q(u).
- On a flat torus `Q(1)=0`, and `Q≥0` since Scal=0, so Y=0. On a closed hyperbolic 3-manifold of
  volume V, Scal=−6 and `Q(1)=−6V^(2/3)`; by Hölder `∫u²≤‖u‖_6²V^(2/3)`, so Y=`−6V^(2/3)`.
- The factors u and cu, c>0, give metrics differing by the constant `c^(4/(n−2))`, both in [g];
  the parametrization `u^p g` of [g] by positive u is unique for each p≠0.

*Needs:* 0.2; Y1.1 and Y1.3 for the weak form.

### 0.4 Model examples and the area of the sphere

Consume Tau Ceti's Euclidean conformal Laplacian
`TauCeti.Yamabe.conformalLaplacian_eq_conformalCoefficient_mul_neg_laplacian`, the
constant-rescaling law `TauCeti.Yamabe.conformalLaplacian_rescale_const`, the unit-sphere scalar
curvature `TauCeti.scalarCurvature_sphereRoundMetric_ofLE`, the stereographic identity
`TauCeti.Yamabe.inner_mfderiv_stereographic'_symm_smul_sub` and the spherical area
`TauCeti.roundSphereVolume`, the normalized n-dimensional measure of Sⁿ in ℝ^(n+1), not the
ambient Lebesgue measure of that sphere, with its positivity and `2π^((n+1)/2)/Γ((n+1)/2)`
value. Prove that the Riemannian volume of the round metric is that normalized measure, and the
stereographic change of variables `∫_(Sⁿ) f dV=∫ f(Φ(x)) U_(t,b)(x)^(p_n) dx` along each map Φ of
the stereographic identity, with the actual coordinate maps and density Jacobians.

**Checks.**

- `|S¹|=2π`, `|S²|=4π`, `|S³|=2π²`, `|S⁴|=8π²/3`; the ambient Lebesgue measure of Sⁿ⊂ℝ^(n+1) is
  0.
- The density Jacobian: `∫_(ℝ³) U_(1,0)^6 dx=4π∫_0^∞ 8r²(1+r²)^(−3)dr=2π²=|S³|`.
- Constant rescaling on the unit S³: `L_(4g)1=6/4`, the scalar curvature of the sphere of
  radius 2.

*Needs:* GeometricMeasureTheory G2–G3; the Tau Ceti sphere and stereographic declarations; 0.2.

### 0.5 Weyl–Schouten

Consume Tau Ceti's Schouten tensor `P=(Ric−Scal·g/[2(n−1)])/(n−2)`, Kulkarni–Nomizu product,
Weyl tensor and Cotton tensor on the native tensor bundles, with `Rm(X,Y,Z,W)=⟨R(X,Y)Z,W⟩`,
`(P⊙g)(X,Y,Z,W)=P(X,W)g(Y,Z)+P(Y,Z)g(X,W)` `−P(X,Z)g(Y,W)−P(Y,W)g(X,Z)`, `W=Rm−P⊙g` and
`C(X,Y,Z)=(∇_ZP)(X,Y)−(∇_YP)(X,Z)`: their symmetries, contractions, Bianchi identities and
conformal laws, including invariance of Weyl of type(1,3) and of Cotton in dimension 3;
`div W=(n−3)C` in an orthonormal frame; the integrability defect `C(u,v,w)+W(w,v,u,ξ)` of the
conformal flattening equation `Hess f=P+df⊗df−|df|²g/2` for every value ξ of df, solution or
not, which vanishes under W=C=0; local conformal flatness, defined by a positive factor
flattening the metric near each point, with its conformal invariance and the forward
Weyl–Schouten implications; and the reduction of local conformal flatness to W=0 plus local
solvability of the flattening equation. Compare local conformal flatness with conformal
Euclidean coordinate charts. Prove the converse Weyl–Schouten implications: W=0 implies LCF for
n≥4 (Lee–Parker, p. 43, citing Eisenhart, §28), and C=0 implies LCF for n=3. Treat the
flattening equation as a first-order system for (f,df) on the full jet carrier, prove its
involutivity from the pinned defect identity, and apply DG4.3's local Frobenius theorem. The
resulting e^(2f)g has P=0 and W=0, hence is flat; use RiemannianGeometry R1.1 item 3 (flat
implies locally Euclidean). Supply coordinate transport, smoothness and parameter normalization
of this system. Lean names: `isLocallyConformallyFlat_of_weylTensor_eq_zero`,
`isLocallyConformallyFlat_of_cottonTensor_eq_zero`.

**API.**

- A metric is LCF exactly when each point has a chart in which it is a positive multiple of the
  Euclidean metric: one direction from R1.1 item 3 applied to the flat metric fg, the other from
  `TauCeti.Manifold.isLocallyConformallyFlat_rescale_model_space` transported through the chart.
- Local solvability of the flattening system through every initial value `(f(x),df(x))` at a
  point where W=C=0 nearby, with smooth dependence on the initial value.

**Checks.**

- Unit Sⁿ: `P=g/2`, so `P⊙g(X,Y,Y,X)=1=Rm(X,Y,Y,X)` for orthonormal X, Y, and W=0.
- Unit S²×S²: Ric=g, Scal=4, `P=g/6`, and for unit X in the first factor and Y in the second
  `W(X,Y,Y,X)=0−1/3=−1/3`, while for orthonormal X, X′ in the first factor
  `W(X,X′,X′,X)=1−1/3=2/3`; the trace `2/3−1/3−1/3=0`. So W≠0 and S²×S² is not LCF; the flat T⁴
  has W=0 and is LCF.
- Dimension 3: W=0 always. S²×ℝ, conformal to ℝ³∖{0}, has `P=diag(1/2,1/2,−1/2)` parallel, so
  C=0. The Heisenberg metric `dx²+dy²+(dz−x dy)²` has Scal=−1/2, `P=diag(−3/8,−3/8,5/8)` in the
  orthonormal frame `e₁=∂_x`, `e₂=∂_y+x∂_z`, `e₃=∂_z`, and `C(e₃,e₁,e₂)=1`, so it is not LCF
  although W=0.
- The flattening equation on flat ℝ³: `f=−2log|x|`, the inversion factor `|x|^(−4)`, solves
  `Hess f=df⊗df−|df|²δ/2`; `f=−log|x|`, the cylinder factor, does not: at (1,0,0) the defect is
  `diag(1/2,−1/2,−1/2)`.

*Needs:* the Tau Ceti conformal-curvature declarations; DifferentialGeometry 4.3;
RiemannianGeometry R1.1 item 3.

### Examples

- The round sphere, flat tori and closed hyperbolic manifolds, with the values of L, Q and Y
  above; the stereographic bubble metric; S²×S², S²×ℝ and the Heisenberg metric for the
  Weyl–Schouten theorem.

### Dependencies

Tau Ceti's conformal Laplacian, Yamabe quotient, conformal laws and conformal curvature;
RiemannianGeometry R1; DifferentialGeometry 4.3 and 12.2–12.5; GeometricMeasureTheory G2–G3; Y1.1
and Y1.3 for the weak-domain statements of 0.2–0.3.

## Layer 1 (Y1): closed-manifold analytic interfaces

### 1.1 Sobolev carriers

Consume K5a's real bundle distributions and RealBundleSobolev for the trivial real line, with its
H¹, integer-order and L² identifications. Construct the scalar W^(k,p) finite-chart adapter from
PDE's weak spaces, and prove agreement at p=2 with that same Hilbert carrier. Compare the same
carriers with the PDE and bundle-Sobolev suppliers; add the manifold comparison rather than
another independent weak-derivative theory. Consume Tau Ceti's critical Sobolev estimate for `C¹`
functions on a closed manifold, `TauCeti.Manifold.exists_eLpNorm_le_mul_eLpNorm_mgradient_two_add`,
and extend it to H¹. Consume the native `Analysis/Sobolev/W1p/{Basic,Density,ChainRule}`,
`Analysis/Sobolev/Embedding` (`TauCeti.W1p0.sobolevEmbeddingL` at its explicit Sobolev-conjugate
exponent), `Analysis/Sobolev/RellichKondrachov`, and
`PDE/FundamentalSolution/Euclidean/{Basic,DistributionalLaplacian}` modules under their actual
Euclidean hypotheses. Their chart, density and Green-normalization comparisons are the manifold
targets here.

**API.**

- Equivalent metric and atlas norms, and smooth density.
- Continuous H¹→Lp at p=p_n, compact H¹→Lq for q<p_n, and weak compactness.
- Absolute-value truncations and weak chain rules.

**Checks.**

- n=3: p_3=6. A cutoff-bubble family concentrating at a point is bounded in H¹ with no
  subsequence converging in L⁶, while it converges to 0 in Lq for q<6.
- On a 3-manifold, `|x|^(−1/4)` near a point is in H¹ (`∫r^(−5/2)r²dr<∞`) and in L⁶ but not in
  L^∞; `|x|^(−1/2)` is in neither H¹ nor L⁶, both integrals being `∫r^(−1)dr`.
- `|u|∈H¹` with `|d|u||=|du|` almost everywhere: for a coordinate function `u=x₁` near a point,
  `|d|u||=|du|=1` off the hypersurface `x₁=0`.

*Needs:* ComplexKahlerGeometry K5a; PDE Layer 1 (A1–A7); the Tau Ceti Sobolev modules.

### 1.2 The realization of L_g and its first eigenvalue

Take the self-adjoint realization of L_g as a_n times RiemannianGeometry R5c's closed-case
realization of `Δ⁺+Scal_g/a_n`, with K5a's H² domain, the form `∫(a_n|du|²+Scal_g u²)dV_g` on H¹
and the same eigenfunctions, and identify this form with the numerator of Q_g. Obtain the first
eigenvalue `λ₁(L_g)=a_n μ₁(Δ⁺+Scal_g/a_n)` and the simple positive first eigenfunction on
connected M from RiemannianGeometry R5c item 1, and prove the exact maximum-principle
consequences when λ₁>0. The scalar potential need not be nonnegative for the spectral
construction.

**API.**

- `λ₁(L_g)` is the least Rayleigh quotient `∫(a_n|du|²+Scal_g u²)/∫u²` on nonzero H¹.
- `λ₁(L_g)≤∫Scal_g dV_g/Vol(g)`, by the test function 1, with equality exactly when Scal_g is
  constant.

**Checks.**

- Unit S³: λ₁=6 with φ=1. Flat T³: λ₁=0. Closed hyperbolic 3-manifold: λ₁=−6.
- S²(1)×S¹ of any length: Scal=2 and λ₁=2 with φ=1; through R5c,
  `λ₁=a_3μ₁(Δ⁺+2/8)=8·(1/4)=2`.
- Two disjoint unit S³: λ₁=6 has multiplicity 2, so connectedness is needed for simplicity.

*Needs:* RiemannianGeometry R5c and R5c items 1–2; ComplexKahlerGeometry K5a; 1.1.

### 1.3 Local estimates and the critical bootstrap

Establish the local Lp, Schauder, Harnack and strong maximum estimates used below with
quantitative dependence on metric coefficients and ellipticity. Prove the nonlinear weak-to-smooth
positive-solution bootstrap for the critical exponent, including the integrability improvement
needed to start it (Lee–Parker, Theorem 4.1, p. 52). Do not assume a critical weak H¹ solution is
bounded merely from its initial Sobolev embedding.

**Checks.**

- The bootstrap exponent for `L_g u=λu^(s−1)`: from `u∈L^r`, elliptic regularity and the
  Sobolev embedding give `u∈L^(r′)` with `r′=nr/(ns−n−2r)`, and `r′>r` exactly when
  `r>(s−2)n/2`. At the critical `s=p_3=6`, n=3, this needs `r>6=p_3`, which H¹ does not give: that
  is the integrability improvement.
- A positive constant on a manifold of constant scalar curvature solves the equation and is
  smooth; `|x|^(−1/4)` of 1.1 shows that H¹ alone gives no L^∞ bound.
- The strong maximum principle on the unit S³: a nonnegative solution of `(8Δ⁺+6)u=λu^5` that
  vanishes at a point vanishes identically.

*Needs:* PDE Layers 3–5 (C12–C15, D16–D19, E20–E26); 1.1.

### 1.4 The Green function

Construct the inverse and positive Green kernel of L_g when λ₁>0, with distributional
normalization, symmetry, off-diagonal smoothness and positivity (Lee–Parker, Theorem 2.8, p. 47,
and Lemma 6.1, p. 63). Pin normalized G_p by `L_g G_p=a_n(n−2)|S^(n−1)| δ_p`, so its leading
local singularity is r^(2−n) (Lee–Parker, (6.1), p. 64). Prove chart-independent distributional
meaning, parameter regularity away from the diagonal and the requisite local estimates.

**API.**

- `G_p(x)=G_x(p)`, `G_p>0` off p, and G_p(x) smooth in (p,x) off the diagonal.
- Conformal covariance: for `ĝ=u^(4/(n−2))g`, `Ĝ_p=u(p)^(−1)u^(−1)G_p`.

**Checks.**

- ℝ³: `G=|x|^(−1)` and `−8Δ|x|^(−1)=8·4πδ=32πδ=a_3(3−2)|S²|δ`; for n=4 and n=5 the constants are
  `24π²` and `128π²/3`.
- Unit S³: `G_p=1/(2sin(d/2))`, the reciprocal chordal distance, satisfies `(8Δ⁺+6)G_p=0` off p and
  `G_p=d^(−1)+d/24+O(d³)`; dropping the term 6 leaves `8Δ⁺G_p≠0`, about −6.26 at d=1.
- The normalization `L_gΓ=δ_p` of Ammann–Humbert gives `Γ=G_p/(4(n−1)|S^(n−1)|)`, leading term
  `r^(−1)/(32π)` for n=3.

*Needs:* 1.2–1.3; PDE C15 and the Tau Ceti fundamental-solution modules.

### Examples

- The round sphere, flat tori, closed hyperbolic manifolds and S²×S¹ for λ₁(L_g); the Green
  function of the unit S³.

### Dependencies

ComplexKahlerGeometry K5a; PDE Layers 1, 3, 4 and 5; RiemannianGeometry R5c; the Tau Ceti
Sobolev and fundamental-solution modules; Layer 0.

## Layer 2 (Y2): sharp Euclidean Sobolev theory

### 2.1 The sharp inequality

For n≥3 consume Tau Ceti's homogeneous D¹,² completion `TauCeti.D1p0` of compactly supported
smooth real functions by the gradient norm, with the dense map of test functions, dilations and
translations, and its injective embedding `TauCeti.D1p0.sobolevEmbeddingL` into L^(p_n), and the
constant `Y(Sⁿ)=n(n−1)Vol(Sⁿ)^(2/n)`, `TauCeti.Yamabe.sphereYamabeConstant`. Prove the sharp
inequality `a_n∫|du|² ≥ Y(Sⁿ) (∫|u|^(p_n))^(2/p_n)` on smooth compactly supported u, and extend it
to D¹,² by density (Lee–Parker, Theorem 3.3 and (3.6), p. 50; Aubin 1976a; Talenti 1976). Lean
name: `sphereYamabeConstant_mul_le`.

**Checks.**

- `Y(S³)=6(2π²)^(2/3)≈43.82` and `Y(S⁴)=12(8π²/3)^(1/2)=8√6π≈61.56`.
- The bubble attains it: `a_3∫|∇U_(1,0)|²=12π²≈118.44=Y(S³)(∫U_(1,0)^6)^(1/3)`. The Gaussian
  `e^(−|x|²)` on ℝ³ has quotient `12√3π≈65.30>43.82`.
- D¹,² is not H¹: in ℝ³, `U_(1,0)` has `∇U∈L²` and `U∈L⁶` but `U∉L²`, since `U²r²→2`.

*Needs:* Tau Ceti's `TauCeti.D1p0` and bubble declarations; 2.2's argument.

### 2.2 Equality cases

Construct decreasing rearrangement and the coarea/isoperimetric comparison needed for a proof,
or the equivalent stereographic variational argument with its compactness and equality steps.
Prove the equality cases in D¹,²: nonzero real multiples of `U_(λ,b)`, λ>0 (Lee–Parker,
Theorem 3.3, p. 50, with (3.2), p. 48). The sign and translation/dilation parameters must be
recovered, not assumed from a guessed radial extremizer. Lean name:
`exists_ae_eq_mul_bubble_of_mul_norm_sq_eq`.

**API.**

- Decreasing rearrangement on ℝⁿ with `‖u*‖_q=‖u‖_q` and `‖∇u*‖₂≤‖∇u‖₂` (Pólya–Szegő), and its
  equality case for the extremals.

**Checks.**

- `−3U_(1,0)` and `U_(2,b)(x)=2^(−1/2)U_(1,0)((x−b)/2)` in ℝ³ attain equality.
- Two bubbles with distant centres: as the distance grows the quotient tends to
  `2^(2/n)Y(Sⁿ)`, `2^(2/3)·43.82≈69.57` for n=3, so the sum is not an extremal.
- The Gaussian of 2.1 is strictly above `Y(S³)`.

*Needs:* 2.1; GeometricMeasureTheory G2–G3.

### 2.3 Bubbles

Consume Tau Ceti's bubbles `TauCeti.Yamabe.bubble`: smoothness, positivity, exact derivatives,
integrability, decay, scaling and the moment and cutoff estimates of
`Analysis/PDE/Yamabe/Bubble/`, the equation `a_n Δ⁺ U=n(n−1)U^(p_n−1)`, their norm/energy
equality and their stereographic metric interpretation, with logarithmically divergent moments
treated by truncated integrals with explicit remainder bounds. Prove every further moment
estimate Y5 and Y6 use in the same form.

**Checks.**

- n=3: `U_(1,0)(0)=√2`, `a_3Δ⁺U_(1,0)(0)=24√2=6U_(1,0)(0)^5`.
- With the exponent n−2 in place of (n−2)/2, `U=2/(1+|x|²)` in ℝ³ has `8Δ⁺U(0)=96≠192=6U(0)^5`.
- `∫_(ℝ³)U_(1,0)^6=2π²=|S³|`, the stereographic Jacobian of 0.4.

*Needs:* the Tau Ceti bubble modules.

### 2.4 Transfer to closed manifolds

Transfer the sharp estimate to M with an epsilon loss: for every ε>0 find Cε with
`‖u‖_(p_n)² ≤ (a_n/Y(Sⁿ)+ε)∫|du|²+Cε∫u²` (Lee–Parker, Theorem 2.3, p. 45, whose `(1+ε)σ_n` with
`σ_n=a_n/Y(Sⁿ)` is the same leading coefficient). Prove the finite-chart localization and metric
distortion estimates.

**Checks.**

- n=3: the leading coefficient is `8/43.82≈0.1826`.
- A cutoff bubble concentrating at a point shows the coefficient cannot be below `a_n/Y(Sⁿ)`:
  its `∫u²` tends to 0 while the quotient tends to `Y(Sⁿ)`.
- u=1 on the unit S³: `‖1‖_6²=(2π²)^(1/3)≈2.70`, so `Cε·2π²≥2.70` forces `Cε>0`.

*Needs:* 2.1; 1.1; Mathlib's `MeasureTheory.eLpNorm_le_eLpNorm_fderiv_of_eq`.

### Examples

- Bubbles, cutoff bubbles, the Gaussian and the two-bubble sum on ℝ³.

### Dependencies

Tau Ceti's `TauCeti.D1p0`, sphere constant and bubble modules; GeometricMeasureTheory G2–G3; Y1.1.

## Layer 3 (Y3): variational compactness below the sphere threshold

### 3.1 The invariant and Aubin's bound

Prove finiteness and metric/conformal invariance of Y, its continuity under C² metric
perturbation, the universal bound Y≤Y(Sⁿ) (Lee–Parker, Lemma 3.4, p. 50), and the equivalence
between the signs of Y and λ₁(L_g). For λ₁(L_g)>0 consume PositiveMass 3.0's metric
`φ^(4/(n−2))g` of scalar curvature `λ₁φ^(−4/(n−2))`, generally a varying function. For λ₁≤0 the
same Tau Ceti law gives this metric scalar curvature of the sign of λ₁. This construction uses no
final critical minimizer. Lean name: `exists_yamabeQuotient_lt`.

**API.**

- Y is finite: `Y≥min(0,min Scal_g)·Vol(g)^(2/n)`, by Hölder's `∫u²≤‖u‖_(p_n)²Vol(g)^(2/n)`.
- Y is the same over H¹ and over positive smooth functions.

**Checks.**

- Signs: unit S³ has Y>0, λ₁=6; flat T³ has Y=0, λ₁=0; a closed hyperbolic 3-manifold has
  Y=`−6V^(2/3)`<0, λ₁=−6.
- Aubin's bound: S²(1)×S¹ of length 1 has `Q(1)=2(4π)^(2/3)≈10.81<43.82`, and of length 2π has
  `Q(1)=2(8π²)^(2/3)≈36.81<43.82`.
- On the unit S³ with φ=1 the metric of PositiveMass 3.0 is g itself, with scalar curvature
  `6=λ₁·1`.

*Needs:* 0.2–0.3; 1.2; 2.1; PositiveMass 3.0.

### 3.2 Subcritical minimizers

For exponents 2<q<p_n construct nonnegative unit-Lq minimizers and their Euler equations. Prove
coercive minimizing-sequence bounds, direct-method attainment, smooth positivity, uniform energy
and multiplier bounds and convergence of subcritical infima as q increases to p_n (Lee–Parker,
Theorem 4.1, p. 52, Proposition 4.2, p. 53, and Lemma 4.3, p. 54).

**API.**

- The subcritical quotient `Q^q(u)=∫(a_n|du|²+Scal u²)/‖u‖_q²` and its infimum Y_q.
- For unit volume, |Y_q| is nonincreasing in q, and Y_q is left-continuous at p_n when
  Y>0.

**Checks.**

- Unit S³: `Q^q(1)=6(2π²)^(1−2/q)`, ≈26.66 at q=4, ≈40.04 at q=11/2 and ≈43.82=Y(S³) at q=6.
- The Euler equation `L_g u=Y_q u^(q−1)` at unit Lq norm, with the multiplier `Y_q=Q^q(u)`.
- Unit volume is needed for monotonicity: `‖u‖_q≤‖u‖_(q′)` for q<q′ holds for every u when
  Vol≤1, while on the unit S³ `‖1‖_4=(2π²)^(1/4)≈2.11>‖1‖_6=(2π²)^(1/6)≈1.64`.

*Needs:* 1.1–1.3; 3.1.

### 3.3 Theorem A

Establish the precise concentration alternative for these minimizers, including local energy
measures, epsilon regularity, blow-up rescaling and exclusion of mass loss when Y<Y(Sⁿ).
Equivalently prove the required compactness by the epsilon-Sobolev inequality with a
quantitative absorption argument; in either proof supply the critical nonlinear limit and strong
H¹ convergence. Produce a smooth positive unit-Lp minimizer when Y<Y(Sⁿ), including Y≤0
(Theorem A: Lee–Parker, p. 39, proved by Proposition 4.4 and Theorem 4.5, pp. 54–55). Lean name:
`exists_isMinOn_yamabeQuotient_of_lt`.

**Checks.**

- A closed hyperbolic 3-manifold: the constant minimizes, with Y=`−6V^(2/3)`.
- A flat torus: the constant minimizes, with Y=0.
- The unit S³: the hypothesis fails, Y=Y(S³), and the bubbles transported by conformal
  diffeomorphisms are minimizers concentrating at a point, so no compactness holds.

*Needs:* 2.4; 3.1–3.2; 1.3.

### Examples

- The round sphere, flat tori, hyperbolic manifolds and S²×S¹ of 3.1.

### Dependencies

Layers 0–2; PositiveMass 3.0.

## Layer 4 (Y4): conformal normal coordinates and local expansions

### 4.1 Conformal normal coordinates

For any pole and prescribed finite order N construct a positive global conformal factor,
normalized at the pole, for which geodesic normal coordinates have `det g=1+O(r^N)`. Prove the
transformation of the curvature jets, vanishing scalar/first scalar derivative at the pole, and
the contracted second scalar derivative/Weyl-norm identity with the sign converted to Δ⁺
(Lee–Parker, Theorem 5.1, p. 58). Derive the numeric coefficients from the fixed curvature
convention rather than importing an incompatible Δ.

**API.**

- In these coordinates `dV_g=(1+O(r^N))dx` and `g_rr=1`, so Δ agrees with the Euclidean
  Laplacian on radial functions up to order N.

**Checks.**

- The unit S³ in its own geodesic normal coordinates has `det g=(sin r/r)^4=1−2r²/3+O(r⁴)`, so
  the normalization needs a conformal factor; the round metric is conformal to the flat metric
  near the pole, whose coordinates have `det g=1` exactly.
- After normalization Scal(p)=0 and dScal(p)=0, while the unnormalized unit sphere has
  Scal=n(n−1).
- On a locally conformally flat neighbourhood W=0, so the contracted second scalar derivative at
  the pole vanishes as well, by the Weyl-norm identity.

*Needs:* RiemannianGeometry R1–R2 (normal coordinates and density); Layer 0.

### 4.2 Cutoff-bubble Taylor bounds

Supply the Taylor bounds with derivatives and uniformity needed for cutoff-bubble energy,
denominator and annular errors. Construct a smooth cutoff, track its scale, and show which terms
have order ε⁴, ε^(n−2), or logarithmic order.

**Checks.**

- Lee–Parker's Lemma 3.5 (p. 51) with the curvature weight r²: `∫r²U_ε²r^(n−1)dr` is of order ε⁴
  for n≥7, ε⁴log(1/ε) for n=6 and ε^(n−2) for n≤5.
- n=7: the curvature term ε⁴ dominates the cutoff error ε⁵.
- n=5: both are of order ε³, so the Weyl term alone does not determine the sign there.

*Needs:* 4.1; 2.3.

### 4.3 Green expansions in dimensions 3, 4 and 5

Derive Green expansions in dimensions 3, 4, 5 after this normalization, with sufficient derivative
bounds to make the inverted metric AE, to compute its ADM mass and to control the test-function
remainder. Include dimension-specific curvature terms and prove that the constant called A is
independent of the allowed normalized chart (Lee–Parker, Lemma 6.4, p. 64). A statement only of
`G=r^(2−n)+O(1)` is insufficient for these uses.

**Checks.**

- The unit S³ with the flat representative near the pole: `G=r^(−1)+A+O(r)` with A=0, the
  blow-up being flat ℝ³.
- n=3, 4, 5: `G=r^(2−n)+A+O″(r)`, Lee–Parker, Lemma 6.4(a); for n=6 Lemma 6.4(b) has a term in
  `|W(p)|²log r` instead of a constant, so A is defined for n≤5 and at conformally flat poles.
- The expansion `G=r^(2−n)+O(1)` alone leaves A undetermined, so the mass of 6.1 is not
  computable from it.

*Needs:* 4.1; 1.4.

### 4.4 Locally conformally flat poles

In a locally conformally flat neighborhood construct a conformal representative exactly flat near
the pole and prove `G=r^(2−n)+A+O(r)` with the differentiated remainder estimates. This local
normalization does not require the final Yamabe theorem.

**Checks.**

- The unit Sⁿ: the stereographic representative is flat near the pole and A=0.
- In the flat representative the expansion has no logarithmic term in any dimension, unlike the
  n=6 non-LCF expansion of Lee–Parker, Lemma 6.4(b).
- The inverted metric is `(1+Aρ^(2−n)+O(ρ^(1−n)))^(4/(n−2))δ` in `z=x/|x|²`, `ρ=|z|`.

*Needs:* 0.5; 1.4.

### Examples

- The round sphere in normal and in conformal normal coordinates, with A=0.

### Dependencies

Layers 0–2; RiemannianGeometry R1–R2.

## Layer 5 (Y5): Aubin's strict inequality

### 5.1 Theorem B

For n≥6 and a point where the Weyl tensor is nonzero, construct a global cutoff bubble in
conformal normal coordinates. Compute numerator and denominator, including all cutoff and
curvature remainders, to prove

- for n≥7, `Q(χU_ε)=Y(Sⁿ)−c_n|W(p)|² ε⁴+o(ε⁴)`;
- for n=6, `Q(χU_ε)=Y(S⁶)−c_6|W(p)|² ε⁴ log(1/ε)+O(ε⁴)`

(Theorem B: Lee–Parker, p. 39, with its proof, pp. 58–59, after Aubin 1976b). Here the bubble's
fixed scale convention is that in Y2; calculate each c_n as the corresponding radial integral and
prove it strictly positive. Consequently Y<Y(Sⁿ). Consume Y0.5's Weyl–Schouten characterization.
The Weyl calculation is independent of positive mass and of the low-dimensional Green expansion.
Lean name: `exists_yamabeQuotient_lt_sphereYamabeConstant_of_weylTensor_ne_zero`.

**Checks.**

- The round S⁶ has W=0: the expansion has no negative term and Y(S⁶)≈96.30 is attained, so the
  hypothesis W(p)≠0 is needed.
- S²×S⁴ with the product of unit round metrics has Scal=14, `P=−g/10` on S² and `P=2g/5` on S⁴,
  and `W(X,Y,Y,X)=0−3/10=−3/10` for unit X tangent to S² and Y tangent to S⁴; so W≠0 and
  Y(S²×S⁴)<Y(S⁶).
- n=5 is excluded: by 4.2 the curvature and cutoff errors are both of order ε³.

*Needs:* 4.1–4.2; 2.3; 0.5.

### Examples

- The round S⁶, where W=0 and the strict inequality fails; S²×S⁴ and other products of round
  spheres of total dimension at least 6, where W≠0.

### Dependencies

Layers 0, 2 and 4.

## Layer 6 (Y6): Green blow-up and the test-function bridge

### 6.1 The blow-up metric and its mass

Assume λ₁(L_g)>0. On M\{p} construct `ĝ=G_p^(4/(n−2))g`, prove scalar flatness away from p,
completeness, and the precise AE chart obtained by inversion (Lee–Parker, Theorem 6.5, p. 65). In
the Y4 low-dimensional or flat-pole cases verify all decay, regularity and scalar-integrability
hypotheses of the positive-mass theorem. With PositiveMass 0.2's mass normalization, prove
`m_ADM=2A` in the normalized expansion (Lee–Parker, Lemma 9.7, p. 79, where the mass is 4(n−1)A
in Lee–Parker's normalization). Include any dimension-specific curvature terms in the
calculation; only the flat-pole case is an immediate Schwarzschild leading-term computation,
PositiveMass 0.4's mass `2c` of `(1+c r^(2−n))^(4/(n−2))δ` with c=A.

**API.**

- The AE chart of ĝ near p, its order (1 for n=3, 2 for n=4, 5, n−2 at a flat pole) and the
  integrability of its scalar curvature, which vanishes.

**Checks.**

- The flux of `(1+Aρ^(2−n))^(4/(n−2))δ`: the mass is 2A for n=3, 4, 5, while Lee–Parker's
  normalization gives 8A, 12A, 16A, that is 4(n−1)A.
- Inversion: `z=x/|x|²` pulls δ_z back to `|x|^(−4)δ_x`, so `r^(−4)δ` near p is Euclidean near
  infinity, and the distance to p is `∫_0 r^(−2)dr=∞`: ĝ is complete.
- The unit S³ at any pole: ĝ is flat ℝ³ and m=2A=0.

*Needs:* 1.4; 4.3–4.4; PositiveMass 0.2 and 0.4.

### 6.2 The glued test function and the zero-mass case

Construct the glued test function from an inner bubble and the outer Green function. Prove
positivity, smooth gluing, norm/energy estimates and `Y<Y(Sⁿ)` when A>0. The zero case follows
PositiveMass 8.1 and 8.3 and Y8.1: a Euclidean blow-up makes g LCF on M\{p}; extend vanishing of
W, or Cotton for n=3, to p by continuity and apply Y0.5. Prove that deleting a point in
dimension≥3 induces the fundamental-group isomorphism, using coordinate balls and van Kampen on
the native fundamental-groupoid carrier. Thus M\{p}≅ℝⁿ implies M simply connected. Y8.1's
developing map on compact M is a covering of Sⁿ and therefore a conformal diffeomorphism. This
gives the smooth conformal map at p, rather than just a topological compactification.

**Checks.**

- The unit S³: A=0, and the compactification is the identity of S³.
- Deleting a point: `π₁(Tⁿ∖{p})≅ℤⁿ` for n≥3, while `π₁(T²∖{p})` is free of rank 2, so the
  dimension bound is needed.
- A>0 is needed for the strict inequality: on the unit Sⁿ, where A=0, every quotient is at
  least Y(Sⁿ).

*Needs:* 6.1; 8.1; 0.5; AlgebraicTopology Layer 1; PositiveMass 8.1 and 8.3.

### Examples

- The unit Sⁿ, whose blow-up is flat ℝⁿ with A=0; the flat-pole model
  `(1+Aρ^(2−n))^(4/(n−2))δ` of mass 2A.

### Dependencies

Layers 1 and 4; Y8.1; PositiveMass 0.2, 0.4, 8.1 and 8.3; AlgebraicTopology Layer 1.

## Layer 7 (Y7): low dimensions and orientation

### 7.1 Theorem C in dimensions 3–5

Theorem C (Lee–Parker, p. 40; Schoen 1984) is Y7 for 3≤n≤5 and Y8.4 for locally conformally flat
manifolds. For 3≤n≤5, apply PositiveMass 8.1, the finite-ended nonspin theorem, to the actual
complete blow-up in Y6. Prove that A≥0 and that A=0 implies the conformal sphere. Consume
PositiveMass 3.2's orientation double cover and the lifts of ends to finite covers of 0.2 and
0.4, through which 8.1 needs no orientation; verify their completeness/end hypotheses for the
blow-up. No Spin hypothesis is added to the low-dimensional Yamabe theorem. If Y≤0, use Y3
directly; the Green/positive-mass lane is only needed for the positive case. Lean name:
`exists_yamabeQuotient_lt_sphereYamabeConstant_of_not_conformal`.

**Checks.**

- S²×S¹ is not conformal to S³ (`π₁=ℤ`), and indeed `Q(1)≈10.81<43.82` for length 1.
- The round RP³ is not conformal to S³, and `Q(1)=6(π²)^(2/3)≈27.61<43.82`.
- RP²×S¹ is nonorientable with a metric of positive scalar curvature; 8.1 applies to its
  blow-up without an orientation hypothesis.

*Needs:* Y6; PositiveMass 0.2, 0.4, 3.2 and 8.1.

### Examples

- S²×S¹, the round RP³ and the nonorientable RP²×S¹.

### Dependencies

Layer 6; PositiveMass 0.2, 0.4, 3.2 and 8.1.

## Layer 8 (Y8): locally conformally flat manifolds in every dimension

### 8.1 The developing map

Construct the conformal atlas transition theorem and the developing local conformal map from the
simply connected cover to Sⁿ (Schoen–Yau 1988), including continuation, monodromy and
differential bundle comparison. For n≥3 prove the local Liouville/Möbius transition result used
here. Obtain a Spin structure on the round Sⁿ by lifting its oriented frame bundle through
Spin(n+1)→SO(n+1), identifying the Spin(n) stabilizer and its frame action; compare this lift
with SpinGeometry G4's actual carrier. Prove pullback and metric-change compatibility using G4.2.
Pull this sphere Spin structure back along the oriented conformal tangent isomorphism; no
injectivity of the developing map is assumed at this stage. Prove independently of positive mass
that for compact simply connected M the developing local diffeomorphism is surjective and a
covering of Sⁿ: its image is open and compact, and proper local diffeomorphisms are coverings.
Since Sⁿ is simply connected for n≥3, it is a conformal diffeomorphism. Y6 and Y8.3 consume this
lemma.

**API.**

- Uniqueness of the developing map up to post-composition by a Möbius transformation, and its
  equivariance for the holonomy representation of the deck group.

**Checks.**

- The round Sⁿ: the developing map is the identity.
- The flat Tⁿ: the developing map is the inverse stereographic map ℝⁿ→Sⁿ, missing one point;
  Tⁿ is not simply connected, so the surjectivity lemma does not apply.
- S^(n−1)×S¹, the quotient of ℝⁿ∖{0} by `x↦2x`: the developing map has image Sⁿ minus two
  points and the deck group is ℤ.

*Needs:* 0.5; DifferentialGeometry 2; SpinGeometry G3–G5 with G4.2; SmoothBundlesConnections B1.4;
CharacteristicClasses C1; UniversalCovers Stages 1–4.

### 8.2 The lifted blow-up

Assume λ₁(L_g)>0. Lift the positive Green blow-up to the universal cover punctured at every lift
of p. Prove the pole set locally finite and the metric complete. Prove G has a positive global
minimum on the punctured compact manifold, since it tends to infinity at the pole. Bound the
blow-up metric below by a positive multiple of the complete cover metric. The discrete lifted
poles are individually at infinite blow-up distance; use both facts to exclude every
finite-length escaping curve. Show each pole is an AE end with the same local expansion and mass
2A. Construct the pulled-back Spin structure on this exact punctured metric.

**Checks.**

- S^(n−1)×S¹ with its product metric, Scal=(n−1)(n−2)>0: the lifted poles form a ℤ-orbit, and
  the lifted blow-up has infinitely many AE ends.
- The unit Sⁿ: one lift, one end, mass 0.
- The lower bound: `G≥min G>0` gives `ĝ≥(min G)^(4/(n−2))g` on the cover.

*Needs:* 8.1; 6.1; UniversalCovers Stages 1–4.

### 8.3 Positivity on the cover

Apply PositiveMass 8.3, the spin theorem for one AE end and arbitrary other complete ends
(Cecchini–Zeidler, Theorem B, p. 3). Its proof uses localized doubled-Callias problems on
compact-boundary AE truncations; a global Fredholm inverse on an arbitrary non-AE remainder is
not an input. Obtain A≥0. If A=0, Euclidean zero rigidity leaves one end, while distinct lifted
poles give distinct AE ends. The deck group acts simply transitively on the nonempty pole fibre;
deduce exactly one pole and a trivial deck group. The resulting compact simply connected LCF
developing map is a covering of Sⁿ and gives the conformal sphere comparison. Prove each
covering/compactification assertion, rather than assuming a local map is globally injective.

**Checks.**

- S^(n−1)×S¹: infinitely many poles, so A=0 is impossible and A>0.
- The unit Sⁿ: A=0, one pole, trivial deck group.
- Ammann–Humbert's Theorem 2.2 reaches A≥0 for compact spin LCF manifolds directly, a
  comparison in that spin scope.

*Needs:* 8.1–8.2; PositiveMass 8.3.

### 8.4 Theorem C for locally conformally flat manifolds

Combine Y6 with strict A>0 off the conformal sphere to obtain the strict Yamabe inequality for
every closed LCF manifold not conformally the sphere, with no dimension bound and no Spin
assumption downstairs. Lean name: `exists_yamabeQuotient_lt_sphereYamabeConstant_of_not_conformal`.

**Checks.**

- The flat Tⁿ, n≥3: LCF, Y=0<Y(Sⁿ).
- The round RPⁿ: LCF, not conformal to Sⁿ, and the constant gives `Q(1)=2^(−2/n)Y(Sⁿ)<Y(Sⁿ)`.
- S²×S² is not LCF (0.5); it has n=4, so Theorem C reaches it through Y7, not through Y8.4.

*Needs:* 6.2; 8.3.

### Examples

- The round Sⁿ and RPⁿ, flat tori and S^(n−1)×S¹.

### Dependencies

Layers 0 and 6; PositiveMass 8.3; SpinGeometry G3–G5; SmoothBundlesConnections B1.4;
CharacteristicClasses C1; UniversalCovers Stages 1–4; DifferentialGeometry 2.

<a id="y9-existence-uniqueness-and-rigidity"></a>

## Layer 9 (Y9): existence, uniqueness and rigidity

### 9.1 The Yamabe theorem

Combine the cases: Y≤0 by Y3; n≥6 with nonzero Weyl tensor by Y5; dimensions 3–5 by Y7; LCF in
every dimension by Y8. Conclude that every closed smooth n-manifold, n≥3, has a positive smooth
unit-volume conformal factor attaining Y, hence a constant-scalar-curvature Yamabe metric (the
Yamabe theorem: Lee–Parker, p. 85). For the conformal sphere exhibit a minimizer directly
(Lee–Parker, Theorem 3.2, p. 49). For a disconnected compact manifold prove the componentwise
theorem and determine the global infimum separately. If any component has negative invariant, it
is `−(Σ_(Y_i<0)|Y_i|^(n/2))^(2/n)`; otherwise it is `min_i Y_i`. Determine the supporting
components of minimizing functions and when a minimizer can be strictly positive on every
component. Componentwise existence does not assert one global constant scalar when the component
signs differ. Lean names: `exists_isMinOn_yamabeQuotient`,
`exists_rescale_scalarCurvature_eq_const`.

**Checks.**

- n=4, two components: invariants (−2,−2) give `−(4+4)^(1/2)≈−2.83`; (−1,5) give −1; (3,5) give
  3.
- The unit S³: the constant is a minimizer and the Yamabe metric is g.
- A disjoint union of a unit S³ and a closed hyperbolic 3-manifold: each component has a Yamabe
  metric, of scalar curvatures of opposite signs, so no global constant exists.

*Needs:* Y3, Y5, Y7, Y8.

### 9.2 Uniqueness when Y ≤ 0

Prove uniqueness of the unit-volume constant-scalar-curvature metric in each conformal class with
Y≤0. Give the maximum-principle and zero-scalar harmonic arguments, including the equality case.
Lean name: `eq_of_scalarCurvature_rescale_eq_of_nonpos`.

**Checks.**

- A closed hyperbolic manifold: the unique unit-volume constant-scalar-curvature metric in the
  class is `V^(−2/n)g`.
- A flat torus: two scalar-flat metrics `u^(4/(n−2))g` have harmonic, hence constant, u, and
  unit volume fixes the constant.
- Y>0 has no uniqueness: on the unit Sⁿ the Möbius pullbacks of the round metric form a
  noncompact family of unit-volume constant-scalar-curvature metrics.

*Needs:* 0.3; 1.2–1.3; 3.1.

### 9.3 Obata's theorems and the Lichnerowicz equality case

Prove Obata's Hessian/round-sphere theorem by the complete geodesic and radial metric argument
(Obata 1962). For a positive Einstein metric identify all conformally related
constant-scalar-curvature metrics: homotheties unless the metric is round up to scale (Obata
1971); in the sphere case identify the Möbius conformal factors and their normalized family
(Lee–Parker, Proposition 3.1, p. 48, and Theorem 3.2, p. 49). Consume the Lichnerowicz bound
`TauCeti.Manifold.finrank_mul_le_of_laplaceBeltrami_eq_neg_mul` and RiemannianGeometry R7.0's
equality case (an eigenfunction with λ=nk satisfies Hess f=−kfg). With Obata's theorem above,
prove that λ₁(Δ⁺)=nk forces (M,g) to be isometric to the round sphere of radius 1/√k. Lean names:
`nonempty_riemannianIsometry_sphere_of_hessian_eq`,
`nonempty_riemannianIsometry_sphere_of_laplaceBeltrami_eq`,
`exists_forall_eq_of_ricciTensor_eq_smul`, `exists_diffeomorph_of_conformalLaplacian_eq`.

**Checks.**

- The unit S²: Ric=g, k=1, the coordinate functions have λ=2=nk and `Hess x_i=−x_i g`. The unit
  S³: Ric=2g, k=1, λ=3=nk.
- The round RP²: Ric=g, but the first positive eigenvalue is 6>2, since the coordinate functions
  are odd; RP² is not the sphere and the equality case does not occur.
- n=1 is excluded: the line carries `f=sin` with `f″=−f` and is not a circle.
- S²×S² is Einstein with Ric=g and not round, so its conformal constant-scalar-curvature metrics
  are homotheties; on the unit S³ the factors `U_(λ,b)` in stereographic coordinates are not.

*Needs:* RiemannianGeometry R7.0; Tau Ceti's Lichnerowicz bound and `TauCeti.RiemannianIsometry`;
0.5; RiemannianGeometry R2–R4 (geodesics and the radial metric).

### 9.4 The conformal sphere

Prove `Y=Y(Sⁿ)` iff the connected conformal manifold is the round conformal sphere, and identify
its minimizing factors. Explain this equality via the already constructed strict-inequality cases
and the explicit spherical equality classification. Lean name: `forall_le_yamabeQuotient_iff`.

**Checks.**

- The unit S³: Y=Y(S³)≈43.82.
- The round RP³: by 9.3 its Yamabe metric is a homothety of the Einstein metric, so
  Y=`Q(1)=6(π²)^(2/3)≈27.61<Y(S³)`, and `2^(2/3)·27.61≈43.82=Y(S³)` for its double cover.
- The flat T³: Y=0.

*Needs:* 9.1; 9.3; 2.2.

### Examples

- The round sphere, real projective spaces, flat tori, hyperbolic manifolds, S²×S² and their
  disjoint unions.

### Dependencies

Layers 3, 5, 7 and 8; RiemannianGeometry R7.0; Tau Ceti's Lichnerowicz bound.

## Layer 10 (Y10): reusable examples and invariant interfaces

### 10.1 Model computations

Compute the quotient and invariant for round rescalings, flat tori and closed negative
constant-curvature metrics. Develop pullback invariance and finite-cover quotient scaling for
pulled-back test functions. A cover bound must keep its actual direction and degree; it is not an
equality for every cover.

**Checks.**

- Round rescaling: `Q_(c²g)(u)=Q_g(u)`, since Q is conformally invariant; on the unit S³ both are
  ≈43.82.
- Finite covers: for an m-sheeted cover, `Q(π*u)=m^(2/n)Q(u)`, so `Y(M̃)≤m^(2/n)Y(M)`; for S³→RP³,
  `6(2π²)^(2/3)=2^(2/3)·6(π²)^(2/3)`, while the factor m would give ≈55.21.
- Hyperbolic: Y=`−6V^(2/3)` for n=3, `−n(n−1)V^(2/n)` in general.

*Needs:* Layers 0 and 3.

### 10.2 The product cylinder

Give a closed positive-scalar example with nonunique unit-volume constant-scalar metrics in one
conformal class on S^(n−1)×S¹. For the product cylinder prove the periodic ODE
`u''−(n−2)²u/4+n(n−2)u^((n+2)/(n−2))/4=0`, its positive equilibrium, and nonconstant positive
solutions of minimal period L for L>2π/√(n−2). Prove the period range and limiting values by the
phase-plane energy integral; the constant equilibrium itself has every period. Normalize the
resulting metrics to volume one. Prove the constant solution is not minimizing at those lengths
by its second variation; stationary solutions are not identified with minimizers merely from
their scalar curvature.

**Checks.**

- The ODE is `L u=n(n−1)u^(p_n−1)` on S^(n−1)×ℝ, of scalar curvature (n−1)(n−2), divided by
  −a_n: `(n−1)(n−2)/a_n=(n−2)²/4` and `n(n−1)/a_n=n(n−2)/4`.
- The equilibrium has `u₀^(4/(n−2))=(n−2)/n`, and the linearization `v″+(n−2)v=0` has period
  `2π/√(n−2)`: 2π for n=3, √2π for n=4.
- At n=3 and L=4π the mode `cos(2πt/L)` has `(2π/L)²=1/4<1=n−2`, a negative second variation of
  the constant.

*Needs:* 10.1; 0.3.

### 10.3 The invariant σ

Develop the basic diffeomorphism invariant `σ(M)=sup_[g] Y(M,[g])`, including the sphere upper
bound and its sign implications. Supply the norms and compactness conditions in continuity
statements.

**Checks.**

- `σ(Sⁿ)=Y(Sⁿ)`: the round metric attains Aubin's bound.
- `σ(Tⁿ)=0` for 3≤n≤7: the flat metric gives Y=0, and Y>0 would give a metric of positive scalar
  curvature (3.1), excluded by PositiveMass 3.1's torus obstruction.
- `σ(M)≤Y(Sⁿ)` for every M, by 3.1.

*Needs:* 3.1; PositiveMass 3.1.

### Examples

- The round sphere and RP³, flat tori, hyperbolic manifolds and S^(n−1)×S¹.

### Dependencies

Layers 0, 3 and 9; PositiveMass 3.1.

## Downstream consumers

- YangMillsConnectionsAndCaloricGauge consumes Y2.1's sharp Euclidean Sobolev inequality, in
  dimension four.
- RiemannianGeometry R7.0 cites Y9.3, at the anchor of Layer 9, as the owner of Obata's theorem,
  and consumes nothing from this roadmap.
- PositiveMass lists Y6–Y8 as consumers of its 8.1 and 8.3, GeometricCurrents cites Y7's use of
  PositiveMass's nonspin theorem, and DifferentialGeometry lists this roadmap among the
  consumers of its sections 2, 4 and 12.2–12.5. These are supplier statements; none of them
  consumes this roadmap.

## References

- J. M. Lee, T. H. Parker, *The Yamabe problem*, Bull. Amer. Math. Soc. (N.S.) 17 (1987),
  37–91, doi:10.1090/S0273-0979-1987-15514-5: notation and (1.1)–(1.5), pp. 38–39; Theorems A
  and B, p. 39; Theorem C, p. 40; (2.5)–(2.7) and the Weyl–Schouten statement, p. 43;
  Theorem 2.3, p. 45; Theorem 2.8, p. 47; Proposition 3.1 and (3.2), p. 48; Theorem 3.2, p. 49;
  Theorem 3.3, (3.6) and Lemma 3.4, p. 50; Lemma 3.5, p. 51; Theorem 4.1, p. 52;
  Proposition 4.2, p. 53; Lemma 4.3 and Proposition 4.4, p. 54; Theorem 4.5, p. 55; Theorem 5.1
  and the proof of Theorem B, pp. 58–59; Lemma 6.1, p. 63; (6.1) and Lemma 6.4, p. 64;
  Theorem 6.5, p. 65; Lemma 9.7, p. 79; the Yamabe theorem, p. 85. It supplies the conformal,
  variational, normal-coordinate and test-function development.
- L. P. Eisenhart, *Riemannian geometry*, Princeton University Press (1926), §28, as cited by
  Lee–Parker, p. 43, for Weyl–Schouten in dimension n≥4 (uncertified).
- T. Aubin, *Problèmes isopérimétriques et espaces de Sobolev*, J. Differential Geom. 11 (1976),
  573–598, doi:10.4310/jdg/1214433725 (cited as Aubin 1976a): the sharp Sobolev constant.
- T. Aubin, *Équations différentielles non linéaires et problème de Yamabe concernant la
  courbure scalaire*, J. Math. Pures Appl. 55 (1976), 269–296 (cited as Aubin 1976b): the strict
  inequality of Y5 and the bound of Y3.1.
- G. Talenti, *Best constant in Sobolev inequality*, Ann. Mat. Pura Appl. 110 (1976), 353–372,
  doi:10.1007/BF02418013: the sharp Sobolev constant and its extremals.
- R. Schoen, *Conformal deformation of a Riemannian metric to constant scalar curvature*,
  J. Differential Geom. 20 (1984), 479–495, doi:10.4310/jdg/1214439291: the strict inequality of
  Y6–Y8 through the Green function and the positive mass theorem.
- R. Schoen, S.-T. Yau, *Conformally flat manifolds, Kleinian groups and scalar curvature*,
  Invent. Math. 92 (1988), 47–71, doi:10.1007/BF01393992: the developing-map comparison of Y8;
  Y8 proves its stated modern arbitrary-end mass application with the explicit hypotheses above.
- M. Obata, *Certain conditions for a Riemannian manifold to be isometric with a sphere*,
  J. Math. Soc. Japan 14 (1962), 333–340, doi:10.2969/jmsj/01430333: the Hessian theorem of Y9.3.
- M. Obata, *The conjectures on conformal transformations of Riemannian manifolds*, J. Differential
  Geom. 6 (1971), 247–258, doi:10.4310/jdg/1214430407: the conformal constant-scalar-curvature
  metrics of a positive Einstein metric, Y9.3.
- S. Cecchini, R. Zeidler, *The positive mass theorem and distance estimates in the spin
  setting*, arXiv:2108.11972v2 (Trans. Amer. Math. Soc. 377 (2024), 5271–5288,
  doi:10.1090/tran/8942): Theorem B, p. 3, the arbitrary-end spin theorem owned by PositiveMass
  8.3 and applied in Y8.3.
- B. Ammann, E. Humbert, *Positive mass theorem for the Yamabe problem on spin manifolds*,
  arXiv:math/0304043v3, which adds a term missing from the printed version (Geom. Funct. Anal. 15
  (2005), 567–576, doi:10.1007/s00039-005-0521-z): Theorem 2.2, the locally conformally flat case,
  and Section 3, dimensions 3, 4 and 5, both for compact spin manifolds. Its Green function Γ has
  `L_gΓ=δ_p`, so its constant term is `A/(4(n−1)|S^(n−1)|)`; it is an additional comparison for
  Y7 and Y8 in that spin scope.

Schoen–Yau's low-dimensional positive-mass arguments and Cecchini–Zeidler's arbitrary-end spin
theorem are owned by PositiveMass with their separate dimension and end hypotheses. The scalar,
mass, Clifford and Green normalizations above govern all comparisons.
