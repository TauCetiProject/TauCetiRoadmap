# The Yamabe problem and conformal scalar curvature

Develop conformal scalar-curvature geometry on closed smooth manifolds,
the sharp critical Sobolev inequality, the variational and blow-up analysis
of the conformal Laplacian, and the existence and rigidity theory of Yamabe
metrics. Include the low-dimensional Green-function and all-dimensional
locally conformally flat arguments, together with the Weyl-curvature test
functions in higher dimensions.

## Carriers, conventions and ownership

Unless a Euclidean or complete auxiliary space is specified, M is a nonempty
connected closed smooth real n-manifold, n≥3, with a smooth positive
Riemannian metric g. Hausdorffness and second countability are explicit.
No orientation is required. Use native manifold tangent bundles and
`Bundle.ContMDiffRiemannianMetric`, including the existing
`Bundle.ContMDiffRiemannianMetric.rescale` for positive conformal factors.
Use Tau Ceti's orientation-free `TauCeti.riemannianVolume`; compare its
density with oriented integration in every oriented-coordinate computation.
The scalar curvature is the full trace of Ricci, so a unit round sphere
has scalar n(n−1). Use the nonnegative Laplacian Δ⁺=−div grad.

Set a_n=4(n−1)/(n−2), p_n=2n/(n−2), and

`L_g=a_n Δ⁺_g+Scal_g`,

`Q_g(u)=[∫(a_n|du|²+Scal_g u²)dV_g]/[∫|u|^(p_n)dV_g]^(2/p_n)`.

The domain of Q is the nonzero real H¹ space. Its infimum is Y(M,[g]);
prove the same infimum is obtained from positive smooth functions. Metric
rescaling is `ĝ=u^(4/(n−2))g` with u smooth and strictly positive. Products,
curvature traces, weak derivatives and integrals use the native carriers,
not a second private definition of Riemannian manifold or Sobolev function.
Use RiemannianGeometry's instance-driven connection and curvature APIs on
a metric-indexed type synonym of M, carrying the selected native metric.
Construct the identity diffeomorphism between metric-indexed copies and
the induced tangent/tensor transports; prove evaluation agrees with the
explicit `Bundle.ContMDiffRiemannianMetric.rescale_inner` formula. Comparing two metrics must never install
two incompatible metric instances on the same carrier.

| Supplier | Interface used |
| --- | --- |
| [RiemannianGeometry R1–R4,R5c,R7](../RiemannianGeometry/README.md) | Levi-Civita connection, full scalar curvature, general conformal-change formulas, geodesics/normal coordinates and density, comparison geometry and Bochner identities; R1.1 item 3, flat curvature is equivalent to a local Euclidean isometry; R5c, the closed-case self-adjoint realization of `Δ⁺+q` with its eigenbasis, and its item 1, the simple lowest eigenvalue of `Δ⁺+q` on a closed connected manifold with its smooth positive eigenfunction, the least Rayleigh quotient; R7.0, the equality case of the Lichnerowicz bound: for Ric≥(n−1)kg, k>0, an eigenfunction of `Δ⁺` with eigenvalue nk satisfies `Hess f=−kfg`. The normal-coordinate normalization and Obata's theorem are targets here. |
| [PDE Layers 1, 3, 4, 5 (A1–A7, C12–C15, D16–D19, E20–E26)](../PDE/README.md) | Euclidean weak Sobolev spaces, smooth density, extension, compact embedding below the critical exponent, maximum/Harnack principles, linear elliptic existence and local/boundary estimates. Y1–Y3 construct the closed-manifold, critical and conformal-Laplacian bridges explicitly. |
| [DifferentialGeometry 12.2–12.5](../DifferentialGeometry/README.md) | Generic manifold gradient, divergence, Laplace–Beltrami, integration by parts, density and volume comparison, together with its tensor/partition/integration foundations. Y0 owns their conformal transformation, not replacement operators. |
| [ComplexKahlerGeometry K5a](../ComplexKahlerGeometry/README.md) | Generic finite-rank real/complex bundle distributions, all-real-order Hilbert Sobolev scales, realification, compact Rellich, Laplace-type regularity and geometric L² realization. These are written supplier targets, and Y1 uses their real rank-one specialization. |
| [GeometricMeasureTheory G2–G3](../GeometricMeasureTheory/README.md) | Normalized Hausdorff area/change of variables for spherical and stereographic integration. Sobolev rearrangement and its equality classification belong to Y2. |
| [PositiveMass 0.4, 3.0, 3.2, 8.1, 8.3, 8.4](../PositiveMass/README.md) | 0.4: the scalar law for `φ^(4/(n−2))g`, the mass `m(g)+2c` of `u^(4/(n−2))g` for `u=1+c r^(2−n)+o_2(r^(2−n))`, the inversion of a normalized Green expansion and the lifts of ends to finite covers; 3.0: the metric `φ^(4/(n−2))g` of scalar curvature `λ₁φ^(−4/(n−2))>0` from a positive first eigenfunction φ of the conformal Laplacian with λ₁>0; 3.2: the orientation double cover, which removes orientability from 8.1; 8.1: finite-ended nonspin positivity/rigidity in dimensions3–7; 8.3: the spin one-AE-end theorem with arbitrary other complete ends; 8.4: invariance of 8.1–8.3 under isometries and finite covers. The geometric end, mass and Spin hypotheses are verified in Y6–Y8. |
| [AlgebraicTopology Layer 1](../AlgebraicTopology/README.md), [SmoothBundlesConnections B1.4](../SmoothBundlesConnections/README.md), [CharacteristicClasses C1](../CharacteristicClasses/README.md) | van Kampen on the native fundamental-groupoid carrier, associated principal bundles and the oriented orthonormal frame bundle used by the sphere Spin lift. |
| [SpinGeometry G3–G5](../SpinGeometry/README.md), [UniversalCovers Stages 1–4](../../Completed/UniversalCovers/README.md), [DifferentialGeometry 2,4](../DifferentialGeometry/README.md) | Spin pullback/metric-change, native universal-cover/deck/lifting theory, orientation cover and smooth covering transport, and finite-dimensional Frobenius. Y8 constructs the sphere Spin lift, conformal developing map and metric-completeness adapters. |

From Tau Ceti, at the pinned revision:

- `Analysis/PDE/Yamabe/`: the conformal Laplacian `TauCeti.Yamabe.conformalLaplacian`, its
  covariance `TauCeti.Yamabe.conformalLaplacian_rescale`, the scalar law
  `TauCeti.Yamabe.scalarCurvature_rescale_eq_rpow_mul_conformalLaplacian` and its Yamabe-equation
  form `TauCeti.Yamabe.scalarCurvature_rescale_eq_iff_conformalLaplacian_eq`
  (`ConformalLaplacian.lean`); integration by parts, formal symmetry, the energy identity and its
  conformal invariance `TauCeti.Yamabe.integral_mul_conformalLaplacian`,
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
  `TauCeti.WithMetric.integral_abs_rpow_rescale_rpow` (`Riemannian/VolumeDensity/Conformal.lean`).
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
  `Bundle.ContMDiffRiemannianMetric.IsLocallyConformallyFlat.cottonTensor_eq_zero` and the
  reduction
  `Bundle.ContMDiffRiemannianMetric.isLocallyConformallyFlat_iff_forall_weylTensor_eq_zero_and_forall_exists_eventually_hessian_eq`
  (`ConformallyFlat.lean`).
- `TauCeti.roundSphereVolume` with `TauCeti.roundSphereVolume_pos` and
  `TauCeti.roundSphereVolume_eq_two_mul_pi_rpow_div_Gamma` (`Geometry/Euclidean/Volume/Sphere.lean`);
  the round metric `TauCeti.sphereRoundMetric` (`Riemannian/Sphere/Basic.lean`).
- The homogeneous space `TauCeti.D1p0` with `TauCeti.D1p0.ofTestFunctionₗ`,
  `TauCeti.D1p0.sobolevEmbeddingL` and `TauCeti.D1p0.sobolevEmbeddingL_injective`
  (`Analysis/Sobolev/D1p0/Basic.lean`), its translations `TauCeti.D1p0.translate` and dilations
  `TauCeti.D1p0.dilate` (`D1p0/Translation.lean`, `D1p0/Dilation.lean`).
- The critical Sobolev estimate for `C¹` functions on a closed manifold
  `TauCeti.Manifold.exists_eLpNorm_le_mul_eLpNorm_mgradient_two_add` (`Riemannian/Sobolev.lean`);
  the Lichnerowicz bound `TauCeti.Manifold.finrank_mul_le_of_laplaceBeltrami_eq_neg_mul`
  (`Riemannian/Lichnerowicz.lean`).

PositiveMass is a supplier of this roadmap and consumes nothing from it.
Y4–Y6's expansions and test-function construction
and Y8.1's developing geometry use no positive-mass theorem. PositiveMass 8.1
and 8.3 then supply positivity and Euclidean rigidity; Y6's zero-mass
compactification, Y7 and Y8.2–4 consume them. Y9 concludes existence. Y8.1
precedes the zero-mass compactification even in dimensions3–5.

## Y0. Conformal tensors and the conformal Laplacian

1. Consume RiemannianGeometry R1's connection, Ricci and scalar formulas
   for ĝ=e^(2f)g, DG12's gradient/divergence/Laplacian carriers, and Tau
   Ceti's conformal laws for ĝ=fg listed above: connection, curvature,
   Ricci, scalar, Schouten, Weyl and Cotton tensors, gradient (the inverse
   metric), Hessian, Laplacian, volume density, composition and inversion
   of rescalings, and pullback, with the Hessian and Laplacian laws already
   specialized to `u^p g`. The tensor laws are pinned for a smooth metric
   and factor, the curvature-operator law at finite differentiability.
   Prove the Ricci, scalar, Schouten, Weyl and Cotton laws at the actual
   finite differentiability levels each term needs, and specialize them
   to ĝ=u^(4/(n−2))g.
2. Consume Tau Ceti's `TauCeti.Yamabe.scalarCurvature_rescale_eq_rpow_mul_conformalLaplacian`
   and `TauCeti.Yamabe.conformalLaplacian_rescale`
   (`TauCeti/Analysis/PDE/Yamabe/ConformalLaplacian.lean`) for
   `Scal_ĝ=u^(-(n+2)/(n−2)) L_g u` and `L_ĝ(v)=u^(-(n+2)/(n−2)) L_g(uv)`, and
   its formal symmetry, integration-by-parts energy identity and conformal
   invariance of the energy and of the critical integral on smooth functions.
   Deduce `Q_ĝ(v)=Q_g(uv)` for smooth v, and prove it on the weak domain.
   Extend positive smooth multiplication to the Sobolev spaces and prove it
   is an isomorphism; smooth identities alone do not establish the
   weak-domain assertion.
3. Consume Tau Ceti's conformal class with its positive-function
   parametrization, constant-factor redundancy and pullback,
   `Vol(ĝ)=∫u^(p_n)dV_g`, the volume-normalized scalar-functional identity,
   and, for `C²` functions, the equivalence between critical points of Q and
   solutions of `L_g u=λ|u|^(p_n−2)u`, its form for u≥0 and the
   identification of λ with Q at unit Lp norm. Prove the equivalence between
   critical points of Q on the nonzero H¹ space and weak solutions of
   `L_g u=λ|u|^(p_n−2)u`, specialize it to u≥0, and identify λ with Q at
   unit Lp norm on H¹.
4. Consume Tau Ceti's Euclidean conformal Laplacian
   `TauCeti.Yamabe.conformalLaplacian_eq_conformalCoefficient_mul_neg_laplacian`,
   the constant-rescaling law `TauCeti.Yamabe.conformalLaplacian_rescale_const`,
   the unit-sphere scalar curvature `TauCeti.scalarCurvature_sphereRoundMetric_ofLE`,
   the stereographic identity `TauCeti.Yamabe.inner_mfderiv_stereographic'_symm_smul_sub`
   and the spherical area `TauCeti.roundSphereVolume`, the normalized n-dimensional
   measure of Sⁿ in ℝ^(n+1), not the ambient Lebesgue measure of that sphere, with
   its positivity and `2π^((n+1)/2)/Γ((n+1)/2)` value. Prove that the Riemannian
   volume of the round metric is that normalized measure, and the stereographic
   change of variables `∫_(Sⁿ) f dV=∫ f(Φ(x)) U_(t,b)(x)^(p_n) dx` along each map
   Φ of the stereographic identity, with the actual coordinate maps and density
   Jacobians.
5. Consume Tau Ceti's Schouten tensor
   `P=(Ric−Scal·g/[2(n−1)])/(n−2)`, Kulkarni–Nomizu product, Weyl tensor
   and Cotton tensor on the native tensor bundles, with
   `Rm(X,Y,Z,W)=⟨R(X,Y)Z,W⟩`,
   `(P⊙g)(X,Y,Z,W)=P(X,W)g(Y,Z)+P(Y,Z)g(X,W)`
   `−P(X,Z)g(Y,W)−P(Y,W)g(X,Z)`, `W=Rm−P⊙g` and
   `C(X,Y,Z)=(∇_ZP)(X,Y)−(∇_YP)(X,Z)`: their symmetries, contractions,
   Bianchi identities and conformal laws, including invariance of Weyl of
   type(1,3) and of Cotton in dimension3; `div W=(n−3)C` in an orthonormal
   frame; the integrability defect `C(u,v,w)+W(w,v,u,ξ)` of the conformal
   flattening equation `Hess f=P+df⊗df−|df|²g/2` for every value ξ of df,
   solution or not, which vanishes under W=C=0; local conformal flatness,
   defined by a positive factor flattening the metric near each point, with
   its conformal invariance and the forward Weyl–Schouten implications; and
   the reduction of local conformal flatness to W=0 plus local solvability of
   the flattening equation. Compare local conformal flatness with conformal
   Euclidean coordinate charts. Prove the converse Weyl–Schouten
   implications: W=0 implies LCF for n≥4, and C=0 implies LCF for n=3.
   Treat the flattening equation as a first-order system for (f,df) on the
   full jet carrier, prove its involutivity from the pinned defect identity,
   and apply DG4.3's local Frobenius theorem. The resulting e^(2f)g has
   P=0 and W=0, hence is flat; use RiemannianGeometry R1.1 item 3 (flat
   implies locally Euclidean). Supply coordinate transport, smoothness and
   parameter normalization of this system.

## Y1. Closed-manifold analytic interfaces

1. Consume K5a's real bundle distributions and RealBundleSobolev for the
   trivial real line, with its H¹, integer-order and L² identifications.
   Construct the scalar W^(k,p) finite-chart adapter from PDE's weak spaces,
   and prove agreement at p=2 with that same Hilbert carrier. Identify
   equivalent metric/atlas norms, smooth density, continuous H¹→Lp
   at p=p_n, compact H¹→Lq for q<p_n, weak compactness, absolute-value
   truncations and weak chain rules. Compare the same carriers with the
   PDE and bundle-Sobolev suppliers; add the manifold comparison rather than
   another independent weak-derivative theory.
   Consume Tau Ceti's critical Sobolev estimate for `C¹` functions on a
   closed manifold, `TauCeti.Manifold.exists_eLpNorm_le_mul_eLpNorm_mgradient_two_add`,
   and extend it to H¹.
   Consume the native `Analysis/Sobolev/W1p/{Basic,Density,ChainRule}`,
   `Analysis/Sobolev/Embedding` (`TauCeti.W1p0.sobolevEmbeddingL` at
   its explicit Sobolev-conjugate exponent), `Analysis/Sobolev/RellichKondrachov`, and
   `PDE/FundamentalSolution/Euclidean/{Basic,DistributionalLaplacian}`
   modules under their actual Euclidean hypotheses. Their chart, density
   and Green-normalization comparisons are the manifold targets here.
2. Take the self-adjoint realization of L_g as a_n times RiemannianGeometry
   R5c's closed-case realization of `Δ⁺+Scal_g/a_n`, with K5a's H² domain,
   the form `∫(a_n|du|²+Scal_g u²)dV_g` on H¹ and the same eigenfunctions,
   and identify this form with the numerator of Q_g. Obtain
   the first eigenvalue `λ₁(L_g)=a_n μ₁(Δ⁺+Scal_g/a_n)` and the simple
   positive first eigenfunction on connected M from RiemannianGeometry
   R5c item 1, and prove the exact maximum-principle consequences when λ₁>0.
   The scalar potential need not be nonnegative for the spectral construction.
3. Establish the local Lp, Schauder, Harnack and strong maximum estimates
   used below with quantitative dependence on metric coefficients and
   ellipticity. Prove the nonlinear weak-to-smooth positive-solution bootstrap
   for the critical exponent, including the integrability improvement needed
   to start it. Do not assume a critical weak H¹ solution is bounded merely
   from its initial Sobolev embedding.
4. Construct the inverse and positive Green kernel of L_g when λ₁>0, with
   distributional normalization, symmetry, off-diagonal smoothness and
   positivity. Pin normalized G_p by
   `L_g G_p=a_n(n−2)|S^(n−1)| δ_p`, so its leading local singularity is
   r^(2−n). Prove chart-independent distributional meaning, parameter
   regularity away from the diagonal and the requisite local estimates.

## Y2. Sharp Euclidean Sobolev theory

1. For n≥3 consume Tau Ceti's homogeneous D¹,² completion `TauCeti.D1p0`
   of compactly supported smooth real functions by the gradient norm, with
   the dense map of test functions, dilations and translations, and its
   injective embedding `TauCeti.D1p0.sobolevEmbeddingL` into L^(p_n), and the
   constant `Y(Sⁿ)=n(n−1)Vol(Sⁿ)^(2/n)`, `TauCeti.Yamabe.sphereYamabeConstant`.
   Prove the sharp inequality
   `a_n∫|du|² ≥ Y(Sⁿ) (∫|u|^(p_n))^(2/p_n)` on smooth compactly supported u,
   and extend it to D¹,² by density.
2. Construct decreasing rearrangement and the coarea/isoperimetric
   comparison needed for a proof, or the equivalent stereographic
   variational argument with its compactness and equality steps. Prove the
   equality cases in D¹,²: nonzero real multiples of
   `U_(λ,b)(x)=(2λ/(λ²+|x−b|²))^((n−2)/2)`, λ>0.
   The sign and translation/dilation parameters must be recovered, not
   assumed from a guessed radial extremizer.
3. Consume Tau Ceti's bubbles `TauCeti.Yamabe.bubble`: smoothness,
   positivity, exact derivatives, integrability, decay, scaling and the
   moment and cutoff estimates of `Analysis/PDE/Yamabe/Bubble/`, the
   equation `a_n Δ⁺ U=n(n−1)U^(p_n−1)`, their norm/energy equality and their
   stereographic metric interpretation, with logarithmically divergent
   moments treated by truncated integrals with explicit remainder bounds.
   Prove every further moment estimate Y5 and Y6 use in the same form.
4. Transfer the sharp estimate to M with an epsilon loss: for every ε>0
   find Cε with
   `‖u‖_(p_n)² ≤ (a_n/Y(Sⁿ)+ε)∫|du|²+Cε∫u²`.
   Prove the finite-chart localization and metric distortion estimates.

## Y3. Variational compactness below the sphere threshold

1. Prove finiteness and metric/conformal invariance of Y, its continuity
   under C² metric perturbation, the universal bound Y≤Y(Sⁿ), and the
   equivalence between the signs of Y and λ₁(L_g). For λ₁(L_g)>0 consume
   PositiveMass 3.0's metric `φ^(4/(n−2))g` of scalar curvature
   `λ₁φ^(−4/(n−2))`, generally a varying function. For λ₁≤0 the same Tau
   Ceti law gives this metric scalar curvature of the sign of λ₁. This
   construction uses no final critical minimizer.
2. For exponents 2<q<p_n construct nonnegative unit-Lq minimizers and their
   Euler equations. Prove coercive minimizing-sequence bounds, direct-method
   attainment, smooth positivity, uniform energy and multiplier bounds and
   convergence of subcritical infima as q increases to p_n.
3. Establish the precise concentration alternative for these minimizers,
   including local energy measures, epsilon regularity, blow-up rescaling
   and exclusion of mass loss when Y<Y(Sⁿ). Equivalently prove the required
   compactness by the epsilon-Sobolev inequality with a quantitative
   absorption argument; in either proof supply the critical nonlinear
   limit and strong H¹ convergence. Produce a smooth positive unit-Lp
   minimizer when Y<Y(Sⁿ), including Y≤0.

## Y4. Conformal normal coordinates and local expansions

1. For any pole and prescribed finite order N construct a positive global
   conformal factor, normalized at the pole, for which geodesic normal
   coordinates have `det g=1+O(r^N)`. Prove the transformation of the
   curvature jets, vanishing scalar/first scalar derivative at the pole,
   and the contracted second scalar derivative/Weyl-norm identity with
   the sign converted to Δ⁺. Derive the numeric coefficients from the
   fixed curvature convention rather than importing an incompatible Δ.
2. Supply the Taylor bounds with derivatives and uniformity needed for
   cutoff-bubble energy, denominator and annular errors. Construct a
   smooth cutoff, track its scale, and show which terms have order ε⁴,
   ε^(n−2), or logarithmic order.
3. Derive Green expansions in dimensions3,4,5 after this normalization,
   with sufficient derivative bounds to make the inverted metric AE,
   to compute its ADM mass and to control the test-function remainder.
   Include dimension-specific curvature terms and prove that the
   constant called A is independent of the allowed normalized chart.
   A statement only of `G=r^(2−n)+O(1)` is insufficient for these uses.
4. In a locally conformally flat neighborhood construct a conformal
   representative exactly flat near the pole and prove
   `G=r^(2−n)+A+O(r)` with the differentiated remainder estimates.
   This local normalization does not require the final Yamabe theorem.

## Y5. Aubin's strict inequality

For n≥6 and a point where the Weyl tensor is nonzero, construct a global
cutoff bubble in conformal normal coordinates. Compute numerator and
denominator, including all cutoff and curvature remainders, to prove

- for n≥7, `Q(χU_ε)=Y(Sⁿ)−c_n|W(p)|² ε⁴+o(ε⁴)`;
- for n=6, `Q(χU_ε)=Y(S⁶)−c_6|W(p)|² ε⁴ log(1/ε)+O(ε⁴)`.

Here the bubble's fixed scale convention is that in Y2; calculate each
c_n as the corresponding radial integral and prove it strictly positive.
Consequently Y<Y(Sⁿ). Consume Y0.5's Weyl–Schouten characterization.
The Weyl calculation is independent of
positive mass and of the low-dimensional Green expansion.

## Y6. Green blow-up and the test-function bridge

Assume λ₁(L_g)>0. On M\{p} construct `ĝ=G_p^(4/(n−2))g`, prove
scalar flatness away from p, completeness, and the precise AE chart obtained
by inversion. In the Y4 low-dimensional or flat-pole cases verify all decay,
regularity and scalar-integrability hypotheses of the positive-mass theorem.
With PositiveMass 0.2's mass normalization, prove `m_ADM=2A`
in the normalized expansion. Include any dimension-specific curvature
terms in the calculation; only the flat-pole case is an immediate
Schwarzschild leading-term computation, PositiveMass 0.4's mass `2c` of
`(1+c r^(2−n))^(4/(n−2))δ` with c=A.

Construct the glued test function from an inner bubble and the outer Green
function. Prove positivity, smooth gluing, norm/energy estimates and
`Y<Y(Sⁿ)` when A>0. The zero case follows PositiveMass 8.1 and 8.3 and
Y8.1: a Euclidean
blow-up makes g LCF on M\{p}; extend vanishing of W, or Cotton for n=3,
to p by continuity and apply Y0.5. Prove that deleting a point in
dimension≥3 induces the fundamental-group isomorphism, using coordinate
balls and van Kampen on the native fundamental-groupoid carrier. Thus
M\{p}≅ℝⁿ implies M simply connected. Y8.1's developing map on compact M
is a covering of Sⁿ and therefore a conformal diffeomorphism. This gives
the smooth conformal map at p, rather than just a topological compactification.

## Y7. Low dimensions and orientation

For 3≤n≤5, apply PositiveMass 8.1, the finite-ended nonspin theorem, to the
actual complete blow-up in Y6. Prove that A≥0 and that A=0 implies the
conformal sphere. Consume PositiveMass 3.2's orientation double cover and
0.4's lifts of ends to finite covers, through which 8.1 needs no
orientation; verify their completeness/end hypotheses for the blow-up.
No Spin hypothesis is added to the low-dimensional Yamabe theorem.
If Y≤0, use Y3 directly; the Green/positive-mass lane is only needed for
the positive case.

## Y8. Locally conformally flat manifolds in every dimension

1. Construct the conformal atlas transition theorem and the developing
   local conformal map from the simply connected cover to Sⁿ, including
   continuation, monodromy and differential bundle comparison. For n≥3
   prove the local Liouville/Möbius transition result used here. Obtain a
   Spin structure on the round Sⁿ by lifting its oriented frame bundle
   through Spin(n+1)→SO(n+1), identifying the Spin(n) stabilizer and its
   frame action; compare this lift with SpinGeometry G4's actual carrier.
   Prove pullback and metric-change compatibility using G4.2. Pull this
   sphere Spin structure back along the
   oriented conformal tangent isomorphism; no injectivity of the developing
   map is assumed at this stage. Prove independently of positive mass that
   for compact simply connected M the developing local diffeomorphism is
   surjective and a covering of Sⁿ: its image is open and compact, and
   proper local diffeomorphisms are coverings. Since Sⁿ is simply connected
   for n≥3, it is a conformal diffeomorphism. Y6 and Y8.3 consume this lemma.
2. Assume λ₁(L_g)>0. Lift the positive Green blow-up to the universal cover punctured at
   every lift of p. Prove the pole set locally finite and the metric
   complete. Prove G has a positive global minimum on the punctured
   compact manifold, since it tends to infinity at the pole. Bound the blow-up metric below
   by a positive multiple of the complete cover metric. The discrete
   lifted poles are individually at infinite blow-up distance; use both
   facts to exclude every finite-length escaping curve. Show each pole is an AE end with the
   same local expansion and mass 2A. Construct the pulled-back Spin
   structure on this exact punctured metric.
3. Apply PositiveMass 8.3, the spin theorem for one AE end and arbitrary
   other complete ends. Its proof uses localized doubled-Callias problems on
   compact-boundary AE truncations; a global Fredholm inverse on an
   arbitrary non-AE remainder is not an input. Obtain A≥0. If A=0,
   Euclidean zero rigidity leaves one end, while distinct lifted poles
   give distinct AE ends. The deck group acts simply transitively on the
   nonempty pole fibre; deduce exactly one pole and a trivial deck group.
   The resulting compact simply
   connected LCF developing map is a covering of Sⁿ and gives the
   conformal sphere comparison. Prove each covering/compactification
   assertion, rather than assuming a local map is globally injective.
4. Combine Y6 with strict A>0 off the conformal sphere to obtain the
   strict Yamabe inequality for every closed LCF manifold not conformally
   the sphere, with no dimension bound and no Spin assumption downstairs.

## Y9. Existence, uniqueness and rigidity

1. Combine the cases: Y≤0 by Y3; n≥6 with nonzero Weyl tensor by Y5;
   dimensions3–5 by Y7; LCF in every dimension by Y8. Conclude that every
   closed smooth n-manifold, n≥3, has a positive smooth unit-volume
   conformal factor attaining Y, hence a constant-scalar-curvature
   Yamabe metric. For the conformal sphere exhibit a minimizer directly.
   For a disconnected compact manifold prove the componentwise theorem
   and determine the global infimum separately. If any component has
   negative invariant, it is `−(Σ_(Y_i<0)|Y_i|^(n/2))^(2/n)`;
   otherwise it is `min_i Y_i`. Determine the supporting components of
   minimizing functions and when a minimizer can be strictly positive
   on every component. Componentwise existence does not assert one
   global constant scalar when the component signs differ.
2. Prove uniqueness of the unit-volume constant-scalar-curvature metric
   in each conformal class with Y≤0. Give the maximum-principle and
   zero-scalar harmonic arguments, including the equality case.
3. Prove Obata's Hessian/round-sphere theorem by the complete geodesic and
   radial metric argument. For a positive Einstein metric identify all
   conformally related constant-scalar-curvature metrics: homotheties
   unless the metric is round up to scale; in the sphere case identify
   the Möbius conformal factors and their normalized family. Consume the
   Lichnerowicz bound `TauCeti.Manifold.finrank_mul_le_of_laplaceBeltrami_eq_neg_mul`
   and RiemannianGeometry R7.0's equality case (an eigenfunction with
   λ=nk satisfies Hess f=−kfg). With Obata's theorem above, prove that
   λ₁(Δ⁺)=nk forces (M,g) to be isometric to the round sphere of radius
   1/√k.
4. Prove `Y=Y(Sⁿ)` iff the connected conformal manifold is the round
   conformal sphere, and identify its minimizing factors. Explain this
   equality via the already constructed strict-inequality cases and
   the explicit spherical equality classification.

## Y10. Reusable examples and invariant interfaces

Compute the quotient and invariant for round rescalings, flat tori and
closed negative constant-curvature metrics. Give a closed positive-scalar
example with nonunique unit-volume constant-scalar metrics in one conformal
class on S^(n−1)×S¹. For the product cylinder prove the periodic ODE
`u''−(n−2)²u/4+n(n−2)u^((n+2)/(n−2))/4=0`, its positive equilibrium,
and nonconstant positive solutions of minimal period L for L>2π/√(n−2).
Prove the period range and limiting values by the phase-plane energy
integral; the constant equilibrium itself has every period. Normalize
the resulting metrics to volume one. Prove the constant solution is not
minimizing at those lengths by its second variation; stationary solutions
are not identified with minimizers merely from their scalar curvature.
Develop pullback invariance, finite-cover quotient scaling for pulled-back
test functions, and the basic diffeomorphism invariant
`σ(M)=sup_[g] Y(M,[g])`, including the sphere upper bound and its sign
implications. A cover bound must keep its actual direction and degree;
it is not an equality for every cover. Supply the norms and compactness
conditions in continuity statements.

## Sources

Lee–Parker, *The Yamabe Problem*, supplies the conformal, variational,
normal-coordinate and test-function development. Aubin and Schoen's primary
papers give the two strict-inequality lanes. Schoen–Yau's 1988
*Conformally flat manifolds, Kleinian groups and scalar curvature* supplies
the developing-map comparison; Y8 proves its stated modern arbitrary-end
mass application with the explicit hypotheses above. Schoen–Yau's low-dimensional
positive-mass arguments and Cecchini–Zeidler's arbitrary-end spin theorem
are owned by PositiveMass with their separate dimension and end
hypotheses. Ammann–Humbert's corrected compact-spin Green-mass argument
provides an additional comparison in its stated spin scope. The scalar,
mass, Clifford and Green normalizations above govern all comparisons.
