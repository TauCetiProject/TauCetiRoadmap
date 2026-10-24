# Roadmap: conformal mapping and the geometric theory of holomorphic functions, part II

**Summary.** This roadmap develops analytic covering maps of punctured plane domains, their Schwarzian equations, and quantitative growth on the disc. Its principal example is the universal cover of the plane with the Nth roots of unity removed. The two summits are the Gamma formula for its conformal radius and an effective circle mean bound uniform in N. Along the way it builds complex linear ODE comparisons and continuation, meromorphic local bases, finite Blaschke products, normalized Herglotz formulas, hypergeometric continuation and disc-local Nevanlinna theory.

## Scope and ownership

Reuse [ConformalMapping](https://github.com/TauCetiProject/TauCetiRoadmap/tree/main/TauCetiRoadmap/ConformalMapping) for planar conformal mapping: **L1** (normal families and Montel compactness for locally bounded holomorphic families), **L2** (Schwarz lemma, its equality case, disc automorphisms and their invariance of the Poincaré metric), **L3** (normalized Riemann mapping, logarithm and root branches), and **L4** (analytic continuation, monodromy and Schwarz reflection). Its planar Riemann mapping theorem does not supply uniformization of an abstract analytic universal cover; that extension is a target of Layer 1 here. Boundary correspondence and Schwarz–Christoffel theory remain in ConformalMapping.

Reuse [UniversalCovers](https://github.com/TauCetiProject/TauCetiRoadmap/tree/main/Completed/UniversalCovers), **Stage 0** (the universal-cover carrier, local sheets and simply connected total space), **Stage 1** (deck transformations and the fundamental-group action), and **Stage 2** (based lifts). The carrier is `TauCeti.UniversalCover a`, with its existing quotient topology and projection. For its complex charts, specialize `TauCeti.Geometry.Manifold.Instances.UniversalCover` to the complex model: `TauCeti.UniversalCover.instChartedSpace`, `instIsManifold` and `isLocalDiffeomorph_proj` already provide the lifted atlas and local holomorphic projection. Its `contMDiff_iff` also tests regularity of a lift by continuity and regularity of its projected map. The atlas agreements and checks below fix their use here. General atlas compatibility for covers belongs to [DifferentialGeometry, Layer 2.3](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/DifferentialGeometry/README.md#layer-2-orientations-and-the-orientation-double-cover).

Reuse [FuchsianOrbifolds](https://github.com/TauCetiProject/TauCetiRoadmap/tree/main/TauCetiRoadmap/FuchsianOrbifolds), **Layer 0** (effective projective action, discreteness, stabilizers and free-locus quotients), **Layer 2** (hyperbolic polygons, reflected side pairings, Poincaré's theorem, presentations and area), **Layer 3** (primitive cusp data, full stabilizers, cusp charts and transport), and **Layer 4** (the cusp compactification of a cofinite quotient). Layer 6 gives only the symmetric roots-cover instances. For Shimizu's inequality use `Subgroup.inv_le_abs_apply_one_zero_of_upperRightHom_mem` in `TauCeti.Analysis.Complex.Fuchsian.Shimizu`; Layer 8 adds the estimate involving both matrix entries that this particular group needs. Generic orbifold compactification, degree and genus theory belong to FuchsianOrbifolds.

Mathlib supplies analytic functions, iterated complex derivatives, meromorphic order, divisors, trailing coefficients, circle averages, proximity and characteristic functions, the ordinary hypergeometric series, Gamma and digamma functions, and elementary special-function identities. Import those interfaces and extend them. In particular, use `MeromorphicOn.divisor`, `Real.circleAverage`, `ValueDistribution.proximity` and `meromorphicTrailingCoeffAt`. Do not replace a meromorphic scalar representative by a projective-valued function without a comparison theorem.

Interior zero removal is supplied by Mathlib’s `MeromorphicOn.exists_canonicalDecomp` and `Complex.CanonicalDecomp.divisor_eq_divisor` in `Mathlib/Analysis/Complex/CanonicalDecomposition.lean`. Layer 3 retains the boundary-parameter factor and finite-product interfaces, which compare the reciprocal native canonical factor with the native disc automorphism, and uses the supplied decomposition rather than a second zero-removal target. Logarithmic circle integrability is supplied by Mathlib's `MeromorphicOn.circleIntegrable_log_norm` and `MeromorphicOn.circleIntegrable_posLog_norm` in `Mathlib/Analysis/SpecialFunctions/Integrability/Log.lean` and `Mathlib/Analysis/SpecialFunctions/Integrability/PosLog.lean`, respectively; it is not a separate target here. Tau Ceti also supplies generic power descent in `TauCeti.Analysis.Complex.RootsOfUnity.Descent` and the complex Herglotz formula in `TauCeti.Analysis.Complex.Herglotz`. Layer 1 specializes descent to the roots cover, including its derivative and omitted-value properties; Layer 3 constructs the normalized analytic logarithm to which the native Herglotz formula is applied. Neither layer rebuilds those general inputs.

Reuse [ClassicalArithmeticCompletion §6.20](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/ClassicalArithmeticCompletion/README.md#layer-6-topic-20) for the conformal radius on proper simply connected open domains, its reciprocal Riemann-map derivative, monotonicity and affine covariance. The radius here extends that object to pointed hyperbolic domains using universal covers; §1.3 compares them on their common domain. Their totalizations outside that domain remain distinct.

Reuse [DiophantineApproximationAndTranscendence §5.1](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/DiophantineApproximationAndTranscendence/README.md) for holomorphic matrix and scalar initial-value existence, uniqueness and solution-space dimension on positive-radius discs. Layer 0 owns the equation/germ and unscaled-jet comparison and continuation on general domains.

Reuse [RiemannianGeometry](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/RiemannianGeometry/README.md), **R4.3** for Hausdorffness and second countability of the native universal-cover manifold and for complete pullback metrics with preserved curvature, and **R4.7** for the curvature −1 disc model and Killing–Hopf classification. Layer 1 compares the real and complex lifted atlases and identifies the pulled-back conformal metric with that disc model.

Reuse [PDE](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/PDE/README.md), **Lane C, items 12–15**, for Euclidean harmonic and subharmonic theory, maximum and Harnack principles, Green and Poisson kernels, and Perron construction with boundary barriers. Layer 1 transports the local theory through holomorphic charts and constructs the surface envelope, smooth-boundary Dirichlet solution and logarithmic Green pole, agreeing with the planar constructions.

Reuse [ComplexCurveModuli D0.4](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/ComplexCurveModuli/README.md#d0-smooth-curves-finite-type-and-the-classification-floor) for complete finite-area curvature −1 metrics on stable punctured components and their cusp-end expansion. Section 1.7 compares that metric to the actual covering and the Fuchsian cusp compactification; arbitrary infinitely connected plane domains still require §1.1. The twice-punctured-plane metric also supplies the finite-type disc coordinate used in §1.1 to exclude the plane alternative. The modular-uniformization and Little Picard programme remains with ModularForms, Layer 10, as assigned in ConformalMapping’s relationship specification.

## Conventions

* Write 𝔻 = {z∈ℂ : |z|<1}, ℍ = {τ∈ℂ : Im τ>0}, μ_N = {ζ∈ℂ : ζ^N=1}, and ζ_N = exp(2πi/N). Every roots-cover statement assumes an integer N≥2.
* All derivatives are complex derivatives. A linear equation is monic of positive order n. Its initial jet contains derivatives of orders 0,…,n−1, without factorial rescaling.
* A hyperbolic plane domain is connected and open with at least two distinct omitted points. A pointed holomorphic universal cover is surjective onto that domain. On a disconnected open set, use the component containing the specified point.
* The normalized cover F_N:𝔻→ℂ∖μ_N satisfies F_N(0)=0. For inverse formulas use the orientation F_N′(0)>0 real. Its half-plane version is F̃_N=F_N∘C⁻¹, where C(z)=i(1+z)/(1−z). The cusp at i∞ has limiting value 1. The shorthand F_N(1)=1 denotes this limit, never an interior value.
* Projective groups use the effective action of PSL₂(ℝ). Matrix calculations may use an SL₂(ℝ) lift; statements must be invariant under its negation. A primitive cusp width generates the **full** parabolic stabilizer, rather than just exhibiting some translation in it. The triangle supergroup is orientation preserving.
* Integrals over circles are probability Haar means, equivalently `(2π)⁻¹` times the angular integral. Write m(r,f) for the mean of log⁺|f|. T_D and N_D are the disc-local characteristic and pole count defined in Layer 7; their centre contribution uses log r and can be negative for a centre pole.
* Meromorphic order describes a punctured germ. Nonnegative order permits a removable singularity with an incorrectly assigned scalar value. Pointwise holomorphy requires continuity of that representative. A finite scalar value at zero never substitutes for a nonnegative centre order.
* Native rational expressions are totalized by Lean's division. Analytic and inverse statements retain their nonzero-denominator guards. Native hypergeometric series values outside their convergence disc never stand for analytic continuation.
* Constants labelled effective must come from explicit numerical estimates. An absolute constant is independent of N and r. The fixed-level constant C_N may depend on N; it is used only for the finite completion in Layer 9. Existential real constants in `Suggested.lean` state the analytic bounds; effectivity additionally requires producing the constants and thresholds specified here.

## Exact supplier contracts

### From Mathlib

From Mathlib, use complex differentiability and `AnalyticAt`/`AnalyticOnNhd` on the actual open domains, with `deriv` and `iteratedDeriv` over ℂ (`Mathlib/Analysis/Calculus/IteratedDeriv/Defs.lean`). `Complex.norm_deriv_le_one_of_mapsTo_ball` supplies the derivative Schwarz inequality after a based lift is constructed. The normalized complex Poisson kernel is supplied by `DiffContOnCl.circleAverage_re_herglotzRieszKernel_smul`; `hasDerivAt_circleAverage_herglotzRieszKernel_smul` differentiates the boundary integral when the boundary data are circle-integrable and the evaluation point is strictly inside the circle. These Schwarz and kernel declarations are in `Mathlib/Analysis/Complex/Schwarz.lean` and `Mathlib/Analysis/Complex/Poisson.lean`. Neither is an existence theorem for an analytic logarithm. `Differentiable.exists_eq_const_of_bounded` in `Mathlib/Analysis/Complex/Liouville.lean` applies to the entire bounded lift used in §1.1.

For finite zero removal, `MeromorphicOn.exists_canonicalDecomp` requires meromorphicity on the closed radius-R disc and nonzero meromorphic germs there. It produces `Complex.CanonicalDecomp f G R`: G is in meromorphic normal form on the closed disc and zero-free in the open disc; the decomposition equality holds off a discrete set. `Complex.CanonicalDecomp.divisor_eq_divisor` identifies the remaining divisor with f’s boundary divisor for R>0. For a nonzero holomorphic f near the closed disc, normal form and nonnegative order make G holomorphic there; continuity extends the equality across removed interior zeros. Interior factors are reciprocals of `Complex.canonicalFactor 1 a`; boundary factors are constants of modulus one, so boundary zeros persist. In particular f(z)=z² gives G=1, while f(z)=z−1 leaves a boundary zero; f≡0 is excluded from this decomposition contract and handled separately in §3.6.

For the disc-local value-distribution interfaces, use `Mathlib/Analysis/Meromorphic/Divisor.lean`, `Mathlib/Analysis/Meromorphic/TrailingCoefficient.lean`, `Mathlib/Analysis/Complex/JensenFormula.lean`, `Mathlib/MeasureTheory/Integral/CircleAverage.lean` and the `Proximity/Basic.lean`, `LogCounting/Basic.lean` and `CharacteristicFunction.lean` files under `Mathlib/Analysis/Complex/ValueDistribution/`. `MeromorphicOn.divisor f K` uses the native punctured meromorphic order on K. `divisor_restrict`, `divisor_fun_inv` and `divisor_fun_pow` are consumed only under genuine `MeromorphicOn` hypotheses. Compactness of a closed subdisc inside 𝔻 gives the finite divisor support; `divisor_ball_support_finite` supplies the corresponding open-ball statement. `MeromorphicOn.circleAverage_log_norm` is the closed-disc Jensen formula with `meromorphicTrailingCoeffAt`. Its finite nonzero trailing coefficient, rather than the assigned value at a pole or removable singularity, is the centre constant. `Real.circleAverage` and `ValueDistribution.proximity f ⊤ r` use the same probability normalization; `ValueDistribution.proximity_pow_top` supplies m(r,f^n)=n m(r,f) for natural n, leaving the local pole-divisor scaling to Layer 7. The native global `ValueDistribution.logCounting` and `ValueDistribution.characteristic` are used only for globally meromorphic comparison tests, not through a fabricated global extension of a disc function.

From Mathlib, `MeromorphicOn.circleIntegrable_log_norm` and `MeromorphicOn.circleIntegrable_posLog_norm` require only meromorphicity on `sphere c |R|` and yield circle integrability at centre c and radius R. Their hypotheses permit zeros, poles, the identically zero function and R=0, using native totalized logarithms. For 0<r<1, restriction of disc meromorphicity to `sphere 0 r` discharges this contract. Changing finitely many circle values preserves the circle averages for r>0.

For special functions, `ordinaryHypergeometric_radius_top_of_neg_nat₁` and `ordinaryHypergeometric_radius_top_of_neg_nat₂` in `Mathlib/Analysis/SpecialFunctions/OrdinaryHypergeometric.lean` supply entire convergence for terminating numerator parameters. `ordinaryHypergeometric_eq_tsum`, `ordinaryHypergeometric_zero` and `ordinaryHypergeometricSeries_radius_eq_one` supply the native coefficient series, value one at zero and convergence disc when a,b,c avoid nonpositive integers. Termwise differentiation, the Gauss equation, continuation near one and the uniform parameter estimates are targets below. `Complex.digamma_one`, `digamma_one_sub` and `digamma_apply_add_nat` in `Mathlib/Analysis/SpecialFunctions/Gamma/Digamma.lean` fix the Euler constant, reflection and finite reciprocal-sum conventions, with poles excluded. `Real.Gamma_pos_of_pos`, `Real.Gamma_mul_Gamma_one_sub` and `Real.Gamma_mul_Gamma_add_half` in `Mathlib/Analysis/SpecialFunctions/Gamma/Basic.lean` and `Mathlib/Analysis/SpecialFunctions/Gamma/Beta.lean` supply positivity, reflection and duplication on their stated domains. `Complex.Gamma_ne_zero_of_re_pos`, `Complex.Gamma_ofReal` and `Real.BohrMollerup.tendsto_log_gamma` are inputs to the locally uniform log-Gamma expansion, with the last limit in `Mathlib/Analysis/SpecialFunctions/Gamma/BohrMollerup.lean`.

### From Tau Ceti

The native disc–half-plane coordinate is C(z)=i(1+z)/(1−z) on |z|<1 and C⁻¹(τ)=(τ−i)/(τ+i) on Im τ>0. These are inverse holomorphic maps, C(0)=i, and z→1 corresponds to the cusp at infinity; no value at the boundary point 1 is part of the interior map.

Its compatibility agreements in this roadmap are:

* Scalar formula: C(z)=i(1+z)/(1−z) for |z|<1.
* Inverse agreement: C⁻¹(C(z))=z and C(C⁻¹(τ))=τ on the stated domains.
* Imaginary-part agreement: Im C(z)=(1−|z|²)/|1−z|²>0 on the disc.

**Checks.**

* C(0)=i; the inverse Cayley direction would send i to zero instead.
* C(1/2)=3i, fixing the upper-half-plane sign and the factor in the imaginary-part formula.
* The rational formula has zero denominator at z=1; the interior biholomorphism does not assign it a complex value.

(CDT-journal, p.667; Remark 5.0.1.) *Needs:* Tau Ceti `TauCeti.bijOn_I_mul_one_add_div_one_sub_ball` and `TauCeti.I_mul_one_add_sub_I_div_add_I_div_one_sub` in `TauCeti.Analysis.Complex.UpperHalfPlane.Cayley` (reuse the native coordinate).

Use the native Cayley bijections and inverse identity in `TauCeti.Analysis.Complex.UpperHalfPlane.Cayley`. The notation C fixes the direction used here; the coordinate and its holomorphic bijection theory are imported.

The native complex atlas on the topological cover is also a supplier. For a connected open Ω⊆ℂ and a base point a∈Ω, use the complex one-dimensional manifold structure on the existing TauCeti.UniversalCover a furnished by `TauCeti.UniversalCover.instChartedSpace` and `instIsManifold`. Its projection to Ω is a local biholomorphism by `TauCeti.UniversalCover.isLocalDiffeomorph_proj` with complex scalars. Inverse covering sheets give charts whose transition functions are restrictions of the identity on Ω. The required uniqueness means compatibility of atlases making this projection locally biholomorphic, rather than literal equality of chosen charted-space records.

The atlas agreements consumed here are:

* Projection: The projection is the existing TauCeti.UniversalCover.proj.
* Chart: Each covering sheet gives a holomorphic chart by the base plane coordinate.
* Topology: The manifold topology equals the existing quotient topology of UniversalCover.

**Checks.**

* For Ω=𝔻, the cover projection is a biholomorphism.
* For a nontrivial annulus the projection is not injective.
* On an overlap of two lifted plane-coordinate charts, the transition is the identity.

(CDT-journal, §5.1, setup preceding Definition 5.1.1, p.667.) *Needs:* Tau Ceti `TauCeti.UniversalCover`; `TauCeti.UniversalCover.isCoveringMap`; `TauCeti.UniversalCover.simplyConnectedSpace`; `TauCeti.UniversalCover.instChartedSpace`, `instIsManifold` and `isLocalDiffeomorph_proj` in `TauCeti.Geometry.Manifold.Instances.UniversalCover`; `IsLocalHomeomorph.chartAt_chartedSpaceComap_apply` in `TauCeti.Geometry.Manifold.Instances.Comap`; [UniversalCovers — Stage 0: port the foundations](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/Completed/UniversalCovers/README.md#stage-0-port-the-foundations-into-tauceti); [DifferentialGeometry — Layer 2.3](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/DifferentialGeometry/README.md#layer-2-orientations-and-the-orientation-double-cover).

From Tau Ceti, `TauCeti.IsAnalyticContinuationAlong` supplies a family of analytic germs transported continuously along a path; ODE continuation existence is proved here. Use `TauCeti.unitDiscMoebius` and `TauCeti.coe_unitDiscMoebius` for the interior Blaschke factor. The boundary-parameter extension in Layer 3 is the additional interface. The Cayley coordinate, lifted cover manifold and native Shimizu inequality use the compatibility agreements in these contracts.

From Tau Ceti, `TauCeti.descendPow` requires a nonzero natural exponent m. `descendPow_pow` gives the factorization at u under invariance by all mth roots of unity at u; `differentiableOn_descendPow` requires an open set s, holomorphy on s and that invariance at every u∈s, and yields holomorphy on `(· ^ m) '' s`. `TauCeti.image_pow_ball` identifies this image with the ball of radius r^m for r≥0. Apply these to f=F_N^N and s=𝔻. The derivative at zero and ramification away from the selected branch are the additional roots-cover assertions. In `TauCeti.Analysis.Complex.Herglotz`, `DiffContOnCl.circleAverage_herglotzRieszKernel_smul_re_add` assumes `DiffContOnCl ℂ L (ball c R)` and w∈ball c R; its conclusion is the boundary-real-part integral plus `(L c).im * I = L w`. For an analytic log L with L(0)=0 the imaginary constant vanishes. These inputs are consumed from the pinned Tau Ceti modules named above. The image-of-ball identity is in `TauCeti/Analysis/Complex/RootsOfUnity/Quotient.lean`.

### From TauCetiRoadmap.ConformalMapping

From ConformalMapping L1 consume Montel compactness for locally bounded holomorphic families, used in the normalized univalent limit of §1.1 after its local bounds are proved. From L2 consume the classification of automorphisms fixing zero as rotations, the equality case of the derivative Schwarz inequality, and invariance of the curvature −1 Poincaré metric under disc automorphisms. From L3 consume normalized planar Riemann maps, their holomorphic inverses, and analytic logarithm and root branches on simply connected plane domains. Use the native `TauCeti.IsNormalizedRiemannMapOn φ Ω a` in `TauCeti.Analysis.Complex.Conformal.RiemannMapping.Normalization`: it requires a∈Ω, holomorphy, a bijection Ω→𝔻, φ(a)=0 and positive real φ′(a). Its direction is domain to disc. From L4 consume path monodromy and reflection across analytic circle sides. In particular, a planar Riemann map cannot supply the uniformization theorem for the abstract universal-cover surface in Layer 1.

### From TauCetiRoadmap.UniversalCovers

From UniversalCovers Stage 0 consume its existing carrier, covering projection, local sheets and simply connected total space, after verifying the local path-connectedness and semilocal simple connectedness of a connected plane domain. Stage 1 supplies the deck action; Stage 2 supplies the unique based lift from a simply connected source and the identification of two lifts by a deck transformation. The regularity criterion for the native analytic atlas, listed in the Tau Ceti contract, makes the continuous based lift holomorphic when its projection is holomorphic.

### From TauCetiRoadmap.FuchsianOrbifolds

From FuchsianOrbifolds Layer 0 consume the effective `PSL(2, ℝ)` action, discreteness and proper discontinuity, and the local biholomorphic quotient on the free locus. Its Layer 2 supplies actual geodesic regions, paired sides, the Poincaré polygon theorem, presentations and the native hyperbolic measure/area formula. A region with named vertices alone is not a fundamental-domain witness. Layer 3 supplies the full primitive parabolic stabilizer, normalized cusp charts and horoball transport. Layer 4 supplies the cusp compactification for a cofinite group. Neither contract identifies a puncture of a specified sphere with a parabolic cusp: the finite-puncture cusp comparison in §1.7 proves that identification and its nonzero leading coefficient. The paper-specific subgroups in Layer 6 are subgroups of this effective projective group; their regions are measurable subsets of its native hyperbolic plane, and their areas use `(MeasureTheory.volume : Measure UpperHalfPlane)` after Cayley transport. `UpperHalfPlane.volume_def` in Mathlib's `Analysis.Complex.UpperHalfPlane.Measure` fixes its density dx dy/y². No free area parameter or predicate storing the desired presentation is introduced.

From Tau Ceti, consume `TauCeti.exists_eqOn_const_mul_of_leftInvOn_ball_of_map_zero` in `TauCeti.Analysis.Complex.Conformal.UnitDisc.Automorphism.Rotation`, re-exported by `.Classification`, for rotation uniqueness; `TauCeti.logDeriv_deriv_comp` in `TauCeti.Analysis.Complex.Conformal.PreSchwarzian` for the pre-Schwarzian; and `Subgroup.isFundamentalDomain_dirichletDomain` in `TauCeti.Analysis.Complex.Fuchsian.DirichletDomain` for the measurable domain `TauCeti.dirichletDomain Γ p` at a free point. `MeasureTheory.covolume` and `Subgroup.IsCofinite` in `TauCeti.Analysis.Complex.Fuchsian.Covolume` measure the actual quotient. `Subgroup.CuspDatum` in `TauCeti.Analysis.Complex.Fuchsian.Cusp.Datum` records the width and full stabilizer. Consume its `disjoint_smul_horodisc_horodisc` and `mem_stabilizer_of_mem_horodisc_of_smul_mem_horodisc` in `TauCeti.Analysis.Complex.Fuchsian.Cusp.Horodisc`; `Subgroup.im_smul_mul_im_le_sq_of_upperRightHom_mem` and `Subgroup.im_smul_mul_im_le_abs_mul_of_upperRightHom_mem` in `TauCeti.Analysis.Complex.Fuchsian.Shimizu` provide the height bounds. `TauCeti.UpperHalfPlane.volume_triangle` and `volume_idealRegion_neg_one_one` in `TauCeti.Analysis.Complex.UpperHalfPlane.Triangle` and `.IdealRegion` fix Gauss–Bonnet area and its ideal limit. Layer 6 identifies the particular regions and groups, rather than reconstructing this geometry.

### From TauCetiRoadmap.ClassicalArithmeticCompletion

From TauCetiRoadmap.ClassicalArithmeticCompletion §6.20 consume the reciprocal derivative formula, monotonicity and affine covariance specified there on proper simply connected pointed open domains, with the supplier's zero value outside its eligible class.

### From TauCetiRoadmap.DiophantineApproximationAndTranscendence

From TauCetiRoadmap.DiophantineApproximationAndTranscendence §5.1 consume the holomorphic linear-system and scalar initial-value theorems on discs, including the evaluation linear equivalence and dimension equal to the order. Restriction to a disc around an ordinary point supplies the germ comparison in §0.2.

### From TauCetiRoadmap.RiemannianGeometry

From TauCetiRoadmap.RiemannianGeometry R4.3 consume Hausdorffness and second countability of the native based-path universal-cover manifold of a connected finite-dimensional Hausdorff second-countable smooth real manifold. Consume its pullback metric on a surjective smooth covering, its completeness when the base is complete, and preservation of curvature by the local isometry. From R4.7 consume the complete simply connected curvature −1 space-form classification and the disc metric `4|dz|²/(1−|z|²)²`. No finite-area assertion for the universal cover is used.

### From TauCetiRoadmap.PDE

From TauCetiRoadmap.PDE Lane C, items 12–15 consume the Euclidean mean-value, maximum and Harnack principles, harmonic replacement by Poisson kernels, and Perron/barrier Dirichlet construction. Boundary attainment is used only where a barrier is supplied. The surface Perron theorem, the surface Dirichlet theorem and Green function transport this theory to holomorphic surface charts, prove the surface-global assertions, and agree with the supplied planar constructions.

### From TauCetiRoadmap.ComplexCurveModuli

From TauCetiRoadmap.ComplexCurveModuli D0.4 consume the complete finite-area conformal metric and its cusp-end expansion for a sphere with at least three punctures. Section 1.7 supplies the comparison with the disc-cover metric and the primitive Fuchsian q-coordinate; the supplier does not itself assert that comparison.

For §1.1 use D0.4 on the sphere punctured at 0, 1 and ∞, without a disc-cover premise. RiemannianGeometry R4.3 and R4.7 then give an oriented isometry of its native universal-cover metric to the disc. The complex/real atlas comparison and the orientation-preserving isometry comparison make that isometry holomorphic. This is the finite-type metric-to-cover adapter constructed in §1.1; the general noncompact surface coordinate is constructed independently there.

## How to read the build

The layers are arranged by mathematical dependencies. Layer 0 supplies complex differential equations; Layer 1 supplies analytic covers; Layer 2 gives the inverse equation; Layer 3 supplies logarithmic integrals; Layer 4 and Layer 5 evaluate the inverse and radius; Layer 6 identifies the covering groups; Layer 7 localizes value distribution; Layer 8 bounds large values geometrically; Layer 9 proves uniform mean growth. Read the targets as library specifications, including the APIs and examples attached to each construction. The acceptance test `Suggested.lean` states the headline theorems on the pinned carriers, with only the simple definitions needed to state them. It includes abstract noncompact surface uniformization on native complex manifolds. The finite-puncture cusp comparison, marked symmetric polygons and presentations, continued connection formula and uniform cusp asymptotic require constructed maps or carriers absent at the pins; their full specifications are given here and the missing constructions are identified in the module docstring.

## Layer 0: complex linear equations and meromorphic local bases

Begin with analytic complex linear equations. Their initial jets, continuation and singular-point bases supply the inverse-cover calculations without identifying identity monodromy with meromorphic extension.

### 0.1 Analytic complex linear differential equations

For a connected open Ω⊆ℂ and n≥1, an analytic monic linear equation is y^(n)+Σ (0≤j<n) a_j y^(j)=0 with each a_j holomorphic on Ω; its initial-value map at x₀∈Ω records the n derivatives 0 through n−1. The corresponding companion first-order system is over ℂ, with complex-analytic coefficients.

Use `LinearEquation Ω n` for the coefficient record and `LinearEquation.IsSolution E y` for the analytic solution predicate on Ω. Its scalar representatives are compared only on Ω or as germs, so their values outside the domain do not enter uniqueness. Define the companion matrix on `Fin n`: its superdiagonal entries are one, its last row is −a_j(x), and all other entries are zero. For an analytic vector v, the equation v′=A(x)v is equivalent to its first coordinate y satisfying the scalar equation together with v_j=y^(j). Prove both directions of this correspondence, preserving the unscaled jet.

Its API comprises:

* An analytic family a_j on a connected open Ω, with n≥1, constructs the monic order-n equation.
* `LinearEquation.initialJet` evaluates the unscaled jet (y(x₀),…,y^(n−1)(x₀))∈ℂ^n at x₀∈Ω.
* Scalar solutions correspond to analytic solutions of the companion first-order system, preserving that jet.
* `LinearEquation.IsSolution` requires both analyticity on Ω and the homogeneous equation; it respects equality on Ω and is closed under complex linear combinations.

**Checks.**

* For n=1 and a₀=0, solutions on a connected Ω are constants.
* For n=2 with zero coefficients, solutions are affine functions and their initial jet is (y(x₀),y′(x₀)).
* a₀(x)=1/x is not an analytic coefficient on a domain containing 0.
* The zero function satisfies the solution predicate for every equation. For n=1, a₀=1, the constant one fails it whereas exp(−x) satisfies it.
* With n=3 and y(x)=x² at zero, the initial jet is (0,0,2), not (0,0,1); this distinguishes derivatives from Taylor coefficients.
* For n=1 and coefficient a₀, the companion matrix is the one-by-one matrix [−a₀]; using +a₀ would make exp(−z) fail when a₀=1.
* For y″=0, the companion matrix is [[0,1],[0,0]], and v=(u+vx,v) satisfies v′=Av. The constant vector (0,1) does not, despite its first coordinate solving the scalar equation.

(TeschlODE, §1.2, equation (1.18), p.7.) *Needs:* DiophantineApproximationAndTranscendence §5.1; Tau Ceti `TauCeti.IsAnalyticContinuationAlong`.

### 0.2 Analytic linear initial-value theorem

For the equation above and x₀∈Ω, every complex initial jet has a unique holomorphic solution germ at x₀; the solution-germ space is linearly isomorphic to ℂ^n.

Construct the complex solution subspace of analytic germs at x₀. Under x₀∈Ω, its unscaled initial-jet map is a complex linear equivalence with `Fin n → ℂ`. Its inverse must be complex linear, and its evaluation at the standard coordinate vectors supplies the normalized fundamental basis. Restrict Ω to a positive-radius disc about x₀ and apply DiophantineApproximationAndTranscendence §5.1; local existence, uniqueness and disc dimension are consumed. Prove the scalar-germ comparison with those supplied disc solutions.

The germ-space API comprises:

* Addition and complex scalar multiplication descend through germ equality.
* The forward linear equivalence evaluates the n unscaled derivatives.
* The inverse linear equivalence solves the equation with the specified jet.

**Checks.**

* For y′=0, the germ-space equivalence is evaluation at x₀ and its inverse sends c to the constant germ c.
* For y″=0, the inverse sends (u,v) to the germ u+v(x−x₀), so a nonzero second entry cannot be discarded.
* For y‴=0 at zero, the jet (0,0,2) corresponds to x²; a factorial-rescaled inverse would return 2x² instead.

(TeschlODE, §4.3, Theorem 4.7, p.130; TeschlODE line 6243.) *Needs:* DiophantineApproximationAndTranscendence §5.1; Layer 0, analytic complex linear differential equations.

### 0.3 Continuation of linear ODE solutions

On a connected open Ω, each local solution germ of an analytic monic order-n equation continues along every continuous path in Ω; continuation is in TauCeti.IsAnalyticContinuationAlong and preserves the differential equation.

(TeschlODE, §4.3, Theorem 4.7 and its proof, p.130.) *Needs:* DiophantineApproximationAndTranscendence §5.1; Layer 0, analytic linear initial-value theorem; Tau Ceti `TauCeti.IsAnalyticContinuationAlong`; [ConformalMapping, Layers list, L4 analytic continuation and reflection](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/ConformalMapping/README.md).

### 0.4 Global solutions on simply connected domains

The headline theorem is `LinearEquation.global_initial_value`. For a simply connected open Ω and analytic monic order-n equation, every unscaled initial jet at x₀∈Ω has an analytic solution on all of Ω, unique as a restriction to Ω. With the solution-space operations, this gives a linear isomorphism to ℂ^n and complex dimension n.

(TeschlODE, §4.3, Theorem 4.7 and its proof, p.130.) *Needs:* DiophantineApproximationAndTranscendence §5.1; Layer 0, continuation of linear ode solutions; Layer 0, analytic linear initial-value theorem; [ConformalMapping, Layers list, L4 analytic continuation and reflection](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/ConformalMapping/README.md).

### 0.5 Meromorphic trivial local monodromy

At an isolated singular point α, the equation's domain must contain a deleted neighbourhood of α (`Ω ∈ nhdsWithin α {α}ᶜ`). The meromorphic-basis condition requires that the full n-dimensional local solution space has a basis of single-valued functions meromorphic on a full neighbourhood of α. This includes finite pole orders; it is stronger than identity of the analytic continuation representation alone.

Construct the punctured solution-germ subspace of `Filter.Germ (nhdsWithin α {α}ᶜ) ℂ` represented by analytic solutions on a sufficiently small deleted neighbourhood contained in Ω. Its construction requires the displayed neighbourhood hypothesis even for the zero vector. The meromorphic-basis condition supplies a `Basis (Fin n) ℂ` of this space and a meromorphic extension of every basis germ to α. Having only some single-valued solutions is insufficient: the basis must have n elements, exhausting the ordinary-point solution space. To prove identity monodromy, choose a small circle around α inside that deleted neighbourhood and identify its ordinary-point solution germs using initial jets; the actual continuation operator around this loop is the identity on the full space.

Its API comprises:

* The witness is a basis of the full local solution space consisting of meromorphic germs at α.
* The maximum of the finitely many pole orders bounds the pole order of every solution.
* Continuation around the puncture is the identity on these germs; the converse requires an additional regularity hypothesis.

**Checks.**

* At an ordinary point an analytic basis satisfies the condition with pole bound zero.
* The order-one equation xy′+y=0 on a punctured disc has basis x⁻¹ and pole bound one.
* The equation x²y′+y=0 has the single-valued solution e^(1/x); identity topological monodromy does not give a meromorphic basis.

(CDT-journal, §2, proof of Corollary 2.0.5, p.636 (meromorphic local bases).) *Needs:* Layer 0, analytic linear initial-value theorem.

### 0.6 Simultaneous algebraic pole clearing

Let L have coefficients in ℚ̄(x), let α be an algebraic singular point with the meromorphic-basis condition, and let p∈ℚ̄(x) be nonconstant and regular at α. There is a nonzero q∈ℚ̄[t] such that q(p(x)) times every local solution is holomorphic at α. One can clear finitely many such singularities simultaneously. A nonzero rational polynomial also suffices for any finite set of algebraic images: use sufficiently high powers of their minimal polynomials, thereby adjoining the finite conjugate closure; the original image set need not be Galois-saturated.

(CDT-journal, p.636; Corollary 2.0.5.) *Needs:* Layer 0, meromorphic trivial local monodromy.

### Examples

For y″=0, the jet (u,v) at x₀ gives y(x)=u+v(x−x₀); thus the jet convention contains no factorial. For xy′+y=0 on a deleted neighbourhood of zero, every solution is c/x, so multiplication by x clears all poles at once. For x²y′+y=0, exp(1/x) returns to itself after a loop but has an essential singularity: topological identity monodromy cannot replace the meromorphic-basis condition. (CDT §1.1.6, p.632; the definition preceding Corollary 2.0.5, p.636.)

### Dependencies

Complex analytic derivatives and finite-dimensional linear algebra; the existing analytic-continuation and path-monodromy interfaces. The local complex analytic theorem is supplied by DiophantineApproximationAndTranscendence §5.1; this layer compares its disc solutions with germs and transports them along paths (TeschlODE, Theorem 4.7, p.130; TeschlODE line 6243).

## Layer 1: analytic universal covers and pointed radius

Establish hyperbolic uniformization and make based holomorphic covers usable through lifting, uniqueness and extremality. The roots-of-unity family is the distinguished example.

### 1.1 Hyperbolic uniformization of the cover

Prove `SurfaceUniformization.noncompactCoordinate`: a connected, noncompact, simply connected, Hausdorff second-countable one-dimensional complex analytic manifold admits a biholomorphism onto an open subset of ℂ. This is analytic existence on the native abstract manifold carrier, including injectivity and a holomorphic inverse. The planar Riemann mapping theorem is applied only after that coordinate exists (Uniformization, arXiv:2008.12189v2, Theorem 1, p.2; Uniformization line 39).

Consume PDE Lane C, items 12–15 for the Euclidean harmonic/subharmonic theory, maximum and Harnack principles, Poisson replacement and Perron construction with boundary barriers. On connected Hausdorff second-countable one-dimensional complex analytic manifolds, the following targets add compatibility under holomorphic chart changes and the surface-global constructions; the surface need not be simply connected or noncompact.

Prove the surface Perron theorem: the supremum of a nonempty locally bounded above family of continuous subharmonic functions, closed under maxima and harmonic replacement on coordinate discs, is harmonic (Uniformization, Theorem 6 and Appendix A, pp.4,11; Uniformization line 152). *Needs:* PDE Lane C, items 12–15; the native complex manifold charts.

Prove the surface Dirichlet theorem: on a compact connected smooth bordered subsurface with nonempty boundary, every continuous real boundary datum has a unique continuous extension harmonic in the interior, lying between its minimum and maximum. Smooth-boundary barriers in charts give boundary attainment (Uniformization, Theorem 6 and Appendix B, pp.4,11–12; Uniformization line 155). *Needs:* PDE Lane C, items 12–15; the surface Perron theorem and holomorphic chart compatibility.

Prove the surface Green function: on such a subsurface with a specified interior point, construct a function continuous off that point, positive and harmonic on the punctured interior and zero on the boundary, whose sum with log of the coordinate modulus extends harmonically at the point. Its plane specialization agrees with the supplied Green function (Uniformization, Proposition 9, pp.5–6; Uniformization line 213). *Needs:* PDE Lane C, items 12–15; the surface Perron theorem; the surface Dirichlet theorem and removable harmonic singularities.

The bordered-disc embedding theorem gives a biholomorphism from the interior of a compact simply connected smooth bordered subsurface with one boundary circle to 𝔻 (Theorem 10, pp.6–8). The surface exhaustion theorem exhausts a noncompact simply connected surface by such subsurfaces with nested interiors (Theorem 12, pp.8–10). Normalize these embeddings at one point in one fixed coordinate. The normalized limit-embedding theorem uses the compactness of normalized univalent disc functions and a diagonal compact limit to give a nonconstant injective global map; the argument principle rules out collisions in the limit (Lemma 13 and §7, pp.10–11, Appendix D, pp.13–14). These are construction theorems, not hypotheses asserting that a uniformizing map exists.

**Checks.**

* On the closed radius-R disc with pole zero, the Green function is log(R/|z|); its regular part is log R. This fixes both the logarithmic sign and boundary value.
* Constant Dirichlet boundary data c give the constant c, fixing boundary attainment and uniqueness.
* On the unit circle, boundary data Re z extend as Re z on the disc, rather than the zero function.
* On the annulus 1≤|z|≤R with R>1, data zero on the inner circle and one on the outer circle give log|z|/log R. The surface Dirichlet theorem does not require simple connectivity.
* ℂ admits the coordinate id, and exp:ℂ→ℂ∖{0} is nonconstant; one omitted finite value cannot force the disc alternative.
* 𝔻 admits the coordinate id and its normalized radius-r exhaustion maps tend to id; the Riemann sphere fails the noncompactness hypothesis and cannot admit a nonconstant global map to ℂ.

For a connected open Ω⊆ℂ with two distinct omitted points and a∈Ω, apply `SurfaceUniformization.noncompactCoordinate` to the lifted analytic atlas on its native universal cover. Consume RiemannianGeometry R4.3’s Hausdorffness and second-countability theorem for the native based-path universal-cover manifold. Compare its underlying real atlas with the complex charted-space instance imported here: both pull back the same plane charts along the same projection. These supplied topological properties discharge the standing hypotheses of `SurfaceUniformization.noncompactCoordinate`. The cover is noncompact because its surjective continuous projection has noncompact image Ω.

Construct the twice-punctured-plane disc-cover theorem: the native universal cover of ℂ∖{0,1}, with the pullback of ComplexCurveModuli D0.4’s complete curvature −1 metric, admits an orientation-preserving isometry to the standard hyperbolic disc. Completeness, simple connectivity and curvature come from RiemannianGeometry R4.3; R4.7 gives the isometry. Prove the orientation-preserving isometry comparison: an orientation-preserving Riemannian isometry between connected Riemann surfaces carrying smooth positive metrics conformal to their complex structures is a biholomorphism. In complex charts its real derivative preserves angles and orientation, hence is complex linear; apply the same argument to the inverse. Use this comparison for the classification isometry of the native lifted atlas. This constructs the actual disc cover without applying the general covering-existence target. For two distinct omitted values b,c, the affine map x↦(x−b)/(c−b) lands in ℂ∖{0,1}. If the general cover’s plane-coordinate image were ℂ, lift this affine projection through the twice-punctured-plane disc cover. The lift is a bounded entire function, hence constant by Liouville, whereas its projection is nonconstant. Thus the coordinate image is proper.

Planar Riemann mapping then identifies that image with 𝔻. Choosing a source automorphism sending zero to the based lift gives `PointedCover.exists_cover : Nonempty (PointedCover Ω a)` under `IsOpen Ω`, `IsConnected Ω`, `a ∈ Ω` and two distinct omitted points. The general domain may have infinitely many complementary components. The affine denominator c−b is nonzero.

**Checks.**

* The identity of the standard disc preserves orientation and is holomorphic; conjugation is an isometry reversing orientation and is not holomorphic. Thus the isometry comparison must retain its orientation premise.
* The complete cylindrical metric on ℂ∖{0} has curvature zero. Its plane universal cover fails the curvature −1 premise, so this example cannot select a disc coordinate.
* For the sphere punctured at 0, 1 and ∞, the supplied curvature −1 metric has area 2π. Its universal-cover metric is complete, has infinite area and admits the disc coordinate; completeness, rather than finite area upstairs, enters the adapter (McMullenRS, Theorem 2.9, p.9; McMullenRS line 318).

(Uniformization, Theorem 1 and §§3–7, pp.2–11; McMullenRS, Theorem 2.9, p.9 for the omitted-values input; CDT-journal, §5.1, setup before Definition 5.1.1, p.667.) *Needs:* the imported complex atlas on the native universal cover; UniversalCovers Stage 0; RiemannianGeometry R4.3 native-cover manifold topology; PDE Lane C, items 12–15 through the three surface targets above; ConformalMapping L1 normal families and L3 planar Riemann maps; ComplexCurveModuli D0.4 and RiemannianGeometry R4.7 for the finite-type adapter; Mathlib `Differentiable.exists_eq_const_of_bounded` for its bounded lift.

### 1.2 Pointed analytic cover uniqueness

For an open Ω⊆ℂ, two holomorphic universal covers F,G:𝔻→Ω with F(0)=G(0)=a are related by a unique disc automorphism fixing 0, hence by a rotation. Their derivatives at 0 have equal norms. A holomorphic disc map into Ω fixing a lifts uniquely through F after choosing its lift at 0.

The light scalar record `PointedCover Ω a` bundles `toFun : ℂ → ℂ`, holomorphy and `MapsTo` on 𝔻, `toFun 0=a`, an actual `IsCoveringMap` between `Complex.UnitDisc` and the subtype Ω, and surjectivity onto Ω. It differs from the native topological universal-cover carrier by fixing a holomorphic disc coordinate. For existence assume Ω is connected and open, a∈Ω and its complement contains two distinct points; for comparisons it suffices to assume Ω open and exhibit a `PointedCover`.

Its API, for Ω open, comprises:

* For two based covers F and G, a unique ζ with |ζ|=1 satisfies G(z)=F(ζz) for all |z|<1.
* Every holomorphic f:𝔻→Ω with f(0)=a has a unique holomorphic lift l:𝔻→𝔻 with l(0)=0 and F∘l=f; uniqueness is equality on 𝔻.
* Every such cover satisfies F′(z)≠0 at every |z|<1.

**Checks.**

* The identity gives a `PointedCover 𝔻 0`; z↦2z gives one for D(0,2).
* The square map is not a pointed disc cover, because its derivative at zero vanishes.
* A cover of one component of a disconnected Ω is not surjective onto Ω and cannot satisfy this record.

(CDT-journal, §5.1, normalization discussion after Lemma 5.1.2, p.668.) *Needs:* Tau Ceti `TauCeti.exists_eqOn_const_mul_of_leftInvOn_ball_of_map_zero` in `TauCeti.Analysis.Complex.Conformal.UnitDisc.Automorphism.Classification`; Layer 1, hyperbolic uniformization of the cover; [UniversalCovers — stage 2 lifting criterion and galois correspondence](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/Completed/UniversalCovers/README.md#stage-2-lifting-criterion-and-galois-correspondence); [ConformalMapping, Layers list, L2 Schwarz lemma extensions](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/ConformalMapping/README.md).

### 1.3 The pointed conformal radius

For a connected hyperbolic plane domain Ω and a∈Ω, define R(Ω,a)=|F′(0)| for any holomorphic universal cover F:𝔻→Ω with F(0)=a. The positive real number is independent of the cover. If an open set is disconnected, apply this construction to the connected component containing a, never to a nonsurjective cover of the whole set.

The scalar `conformalRadius Ω a` can use the infimum of {r∈ℝ : ∃F : PointedCover Ω a, r=|F′(0)|}. Existence and rotation uniqueness show this set is a nonempty singleton under the stated hypotheses. The totalized infimum on other domains is not assigned a geometric interpretation.

Its API comprises:

* For every pointed holomorphic universal cover of an open Ω, R(Ω,a)=|F′(0)|>0.
* For proper, open, simply connected Ω and a∈Ω, this radius equals ClassicalArithmeticCompletion §6.20’s cr(Ω,a). Transport the supplied derivative comparison and affine-change laws through this equality.
* For hyperbolic Ω, a∈Ω and b≠0, R(bΩ+c,ba+c)=|b|R(Ω,a), agreeing with the supplied law on simply connected domains.

**Checks.**

* R(𝔻,0)=1.
* R(D(0,2),0)=2.
* ℂ∖{0} does not satisfy the two-omitted-point hyperbolic-domain hypothesis.
* For φ(z)=z/2 on D(0,2), the comparison with the normalized domain-to-disc Riemann map gives 1/|φ′(0)|=2, fixing the direction of the reciprocal.

(CDT-journal, §5.1, discussion preceding Theorem 5.1.4, p.668.) *Needs:* ClassicalArithmeticCompletion §6.20; Layer 1, pointed analytic cover uniqueness; Layer 1, hyperbolic uniformization of the cover.

### 1.4 Extremality of the pointed cover

For a pointed holomorphic universal cover F:𝔻→Ω and a holomorphic φ:𝔻→Ω with φ(0)=F(0)=a, |φ′(0)|≤R(Ω,a). Equality holds exactly when the based lift of φ is a rotation, equivalently when φ is a holomorphic universal cover.

(Mathlib `Complex.affine_of_mapsTo_ball_of_norm_dslope_eq_div`, `Mathlib/Analysis/Complex/Schwarz.lean`, equality case after a based lift.) *Needs:* Layer 1, pointed analytic cover uniqueness; Layer 1, the pointed conformal radius; Mathlib `Complex.norm_deriv_le_one_of_mapsTo_ball`; [ConformalMapping, Layers list, L2 Schwarz lemma extensions](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/ConformalMapping/README.md).

### 1.5 Monotonicity of conformal radius

For connected hyperbolic domains Ω⊆Ω′ and a∈Ω, R(Ω,a)≤R(Ω′,a). Apply the preceding extremal inequality to the pointed covering of Ω followed by inclusion. This is the extension to hyperbolic domains; on the common simply connected class it agrees through the comparison in §1.3 with ClassicalArithmeticCompletion §6.20’s radius monotonicity.

(Mathlib `Complex.affine_of_mapsTo_ball_of_norm_dslope_eq_div`, `Mathlib/Analysis/Complex/Schwarz.lean`, equality case after a based lift.) *Needs:* Layer 1, extremality of the pointed cover.

### 1.6 Projective realization of analytic deck transformations

For a connected hyperbolic plane domain Ω and a pointed holomorphic universal cover F:𝔻→Ω, its existing topological deck transformations are holomorphic disc automorphisms. Conjugation through C identifies their action with a discrete subgroup of PSL₂(ℝ), acting freely on ℍ, and the analytic quotient is Ω. For a finite punctured plane this is its Fuchsian covering group.

(CDT-journal, §5.1, setup preceding Definition 5.1.1, p.667.) *Needs:* the imported complex atlas on the native universal cover; Layer 1, hyperbolic uniformization of the cover; the native Cayley coordinate; [UniversalCovers — stage 2 lifting criterion and galois correspondence](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/Completed/UniversalCovers/README.md#stage-2-lifting-criterion-and-galois-correspondence); [ConformalMapping, Layers list, L2 Schwarz lemma extensions](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/ConformalMapping/README.md); [FuchsianOrbifolds — layer 0 the effective projective möbius action](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/FuchsianOrbifolds/README.md#layer-0-the-effective-projective-möbius-action).

### 1.7 Finite-puncture cusp comparison

For a finite set S⊂ℙ¹ with |S|≥3 and a holomorphic universal disc cover of ℙ¹∖S, prove the finite-puncture cusp comparison: the effective deck subgroup of PSL₂(ℝ) is cofinite, its parabolic cusp orbits correspond bijectively to S, and the quotient identification extends to a biholomorphism from the cusp compactification to ℙ¹. At a finite puncture p and a primitive positive cusp coordinate q=exp(2πiστ/w), the covering is p+cq+O(q²) with c≠0. At infinity the same assertion holds for its reciprocal in the local coordinate 1/X. A nonprimitive generator does not give a uniformizing coordinate.

First prove the complete pullback-metric comparison: for the finite S above, the supplied complete curvature −1 conformal metric g on ℙ¹∖S and a holomorphic universal cover π:𝔻→ℙ¹∖S, the pullback satisfies `π*g = 4|dz|²/(1−|z|²)²`. RiemannianGeometry R4.3 gives completeness and curvature −1 of π*g through the native universal cover and its based-cover equivalence with 𝔻. Apply R4.7’s complete simply connected space-form classification to obtain an isometry from this disc to the standard hyperbolic disc. Choose its orientation positive, composing with complex conjugation of the standard disc if needed. Apply the orientation-preserving isometry comparison (§1.1) to obtain a holomorphic disc automorphism. ConformalMapping L2’s invariance of the standard metric under disc automorphisms gives the stated equality (McMullenRS, §16, p.147; McMullenRS line 5348, for the model normalization). *Needs:* §1.6 projective deck realization; ComplexCurveModuli D0.4 complete conformal metric; RiemannianGeometry R4.3 complete pullback and curvature, R4.7 Killing–Hopf and the disc model; ConformalMapping L2 hyperbolic metric invariance; the orientation-preserving isometry comparison (§1.1).

Descend this equality to the quotient before transferring the supplied metric’s finite area to the native covolume. The universal disc itself has infinite area. The metric cusp ends then identify parabolic ends; apply the FuchsianOrbifolds Layers 3–4 charts and compactification. The extended quotient map is biholomorphic in the puncture coordinate, so its first coefficient is nonzero. This proves the logarithmic inverse expansion used by the accessory parameters without a roots-specific polygon or a dependency on Layer 6 (Hem88, Theorem 3.1, pp.97–115, uncertified primary locator; CDT-journal, proof of Lemma 5.1.8, (5.1.13), p.670).

Its API comprises:

* The pullback metric is the stated curvature −1 disc metric.
* The effective deck subgroup has finite native covolume.
* Punctures correspond bijectively to cusp orbits, including the puncture at infinity.
* The quotient identification extends to a holomorphic equivalence of the cusp compactification with ℙ¹.
* In each primitive puncture coordinate the first q-coefficient is nonzero.

**Checks.**

* For the pullback metric, the squared length of the coordinate vector 1 at zero is 4, fixing the curvature −1 disc normalization. Its universal-disc area is infinite, even when the quotient has finite area.
* Scaling the squared standard metric by c>0 changes curvature to −1/c; the curvature hypothesis forces c=1.
* Pulling the standard metric back by z↦z/2 gives `|dz|²/(1−|z|²/4)²`, also of curvature −1, but the radial segment to 1 has finite length log 3. Completeness is essential for the complete pullback-metric comparison.
* For S={0,1,∞}, there are three cusp orbits and area 2π in curvature −1; a comparison counting only finite punctures would give two.
* In a primitive chart, X(q)=p+cq+O(q²) gives inverse τ=(w/(2πi))log(X−p)+a holomorphic term; its Schwarzian has double-pole coefficient 1/2, independent of w and c≠0.
* On the intermediate cusp cover, replacing the primitive translation by its mth power for m≥2 gives X−p=cq_m^m+O(q_m^(2m)); the vanishing first coefficient detects the wrong cusp coordinate.

(Hem88, Theorem 3.1, uncertified; CDT-journal, (5.1.13), p.670.) *Needs:* §1.6 projective deck realization; the complete pullback-metric comparison; ComplexCurveModuli D0.4 complete finite-area metrics and cusp ends; RiemannianGeometry R4.3 complete pullback and R4.7 Killing–Hopf; ConformalMapping L2 hyperbolic metric invariance; FuchsianOrbifolds Layers 3–4 cusp charts and compactification.

### 1.8 The normalized roots-of-unity covering

For an integer N≥2 choose a holomorphic universal cover F_N:𝔻→ℂ∖μ_N with F_N(0)=0. For the explicit inverse-germ calculations orient it with F_N′(0)>0 real. Its half-plane form is F̃_N=F_N∘C⁻¹; the standard cusp chart is chosen so that its limit at i∞ is 1. The notation F_N(1)=1 denotes that cusp limit, not evaluation in the disc.

Bundle the oriented cover as `RootsCover N`. Its API comprises:

* F_N(0)=0, and for |z|<1 and ζ^N=1, F_N(z)≠ζ.
* The half-plane form satisfies F̃_N(C(z))=F_N(z) on the disc.
* F_N′(0)>0 is real, and changes of source rotation preserve its norm.

**Checks.**

* For N=2 the target is ℂ∖{−1,1}.
* 0 is in the target and its chosen preimage is 0.
* F_N(1)=1 is a cusp limit and 1 is omitted from all interior values.
* Precomposing the positively oriented cover with z↦iz gives derivative iF_N′(0), which has the same norm but is not positive real. It fails the orientation required by the inverse-germ formula.

(CDT-journal, p.667; Definition 5.1.1.) *Needs:* Layer 1, hyperbolic uniformization of the cover and pointed analytic cover uniqueness; the native Cayley coordinate (existence and uniqueness).

Prove the real radial limit at 1 and interior omission for every oriented cover. Precomposition by iz has derivative iF_N′(0), with positive imaginary part. The radial endpoint is fixed by conjugation symmetry, local inverse continuation on [0,1), and the puncture comparison, not by assigning a boundary value (CDT-journal, Definition 5.1.1, p.667). *Needs:* the finite-puncture cusp comparison (§1.7); pointed analytic cover uniqueness and ConformalMapping L4 for local inverse continuation along [0,1) (cusp limit).

### 1.9 Nonvanishing derivative of the cover

For every N≥2 and |z|<1, F_N′(z)≠0. A holomorphic covering between one-dimensional complex manifolds is a local biholomorphism, hence has nonzero complex derivative.

(CDT-journal, p.668; Lemma 5.1.2.) *Needs:* Layer 1, the normalized roots-of-unity covering; the imported complex atlas on the native universal cover.

### 1.10 Rotation equivariance of the covering

For N≥2 and ζ^N=1, F_N(ζz)=ζF_N(z) for |z|<1. For the standard left action τ↦(aτ+b)/(cτ+d), the matrix r̃_N=[cos(π/N),−sin(π/N);sin(π/N),cos(π/N)] corresponds through C to multiplication by ζ_N⁻¹. Its inverse corresponds to ζ_N. In Tau Ceti’s convention `Matrix.SpecialLinearGroup.rotation θ = !![cos θ, sin θ; -sin θ, cos θ]`, this r̃_N is `rotation (-Real.pi / N)`. CDT Lemma 5.1.2 displays this matrix with ζ_N on the left; under the standard left action that relation holds for r̃_N⁻¹, as the N=3 computation in Layer 6 shows. Both have projective order N; use the displayed r̃_N in the subgroup presentations below.

(CDT-journal, p.668; Lemma 5.1.2.) *Needs:* Layer 1, the normalized roots-of-unity covering; Layer 1, pointed analytic cover uniqueness; Layer 1, nonvanishing derivative of the cover; [FuchsianOrbifolds — layer 0 the effective projective möbius action](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/FuchsianOrbifolds/README.md#layer-0-the-effective-projective-möbius-action).

### 1.11 The descended power map

For N≥2 there is a unique holomorphic G_N:𝔻→ℂ∖{1} with G_N(z^N)=F_N(z)^N. Specialize the native `TauCeti.descendPow` to F_N^N and use equivariance for root independence; unlike generic descent, this target identifies its derivative, omitted value and ramification for the roots cover. G_N(0)=0. It is ramified at the lifts of zero other than the chosen local branch and is not asserted to be a universal covering.

Its API comprises:

* G_N(z^N)=F_N(z)^N for |z|<1, and G_N(0)=0.
* G_N′(0)=F_N′(0)^N, hence |G_N′(0)|=R(ℂ∖μ_N,0)^N.
* Any two Nth roots of an input give identical defining values.
* G_N has a simple zero at zero. If 0<|z|<1 and F_N(z)=0, it has zero order N at z^N and G_N′(z^N)=0; the source power map is locally unramified at z and F_N has a simple zero there.

**Checks.**

* If F_N(z)=az+O(z^(N+1)), then G_N(w)=a^Nw+O(w²).
* The local inverse exists at 0 because a≠0.
* For N=2, choosing z or −z gives the same G_2(z²).
* At a nonzero lift z of the target zero, G_N′(z^N)=0 for N≥2. This rules out treating the descended map as an unramified universal cover.

(CDT-journal, p.671; Definition 5.1.15.) *Needs:* Layer 1, rotation equivariance of the covering; Tau Ceti `TauCeti.descendPow`, `descendPow_pow`, `differentiableOn_descendPow` and `image_pow_ball`.

### 1.12 Derivative of the descended power map

G_N′(0)=F_N′(0)^N and |G_N′(0)|=|F_N′(0)|^N for N≥2.

(CDT-journal, p.671; Definition 5.1.15.) *Needs:* Layer 1, the descended power map; Layer 1, nonvanishing derivative of the cover.

### Examples

The identity disc cover gives R(𝔻,0)=1; z↦2z gives R(D(0,2),0)=2. If φ(z)=F(az) with |a|<1, its derivative norm is |a|R(Ω,0), strictly below the cover radius; when |a|=1 it is again a cover. For N=2, equivariance says F₂(−z)=−F₂(z), so the two roots of w give the same descended value. The map z↦z² is not an unramified disc cover at zero. (CDT §1.1.6, p.632; Lemma 5.1.2, p.668; Definition 5.1.15, p.671.)

### Dependencies

Layer 0 for local uniqueness tools; the existing universal-cover carrier, complex atlas and based lifts; disc automorphisms and the Schwarz equality case. Surface uniformization on that carrier is an explicit target, including exclusion of the plane by the two omitted values and exclusion of the compact sphere. It is not an invocation of planar Riemann mapping.

## Layer 2: schwarzians and accessory parameters

The Schwarzian makes the inverse covering independent of projective coordinates. Its cusp principal parts and regularity at infinity determine the symmetric differential equation.

### 2.1 The Schwarzian derivative

For a holomorphic f with f′≠0 on an open set, define S(f)(x)=f‴(x)/f′(x)−(3/2)(f″(x)/f′(x))². With P(f)=`logDeriv (deriv f)`, the native pre-Schwarzian, this equals (P(f))′−(1/2)P(f)². The totalized native derivative expression carries no Schwarzian claims at points where f′=0.

Use `schwarzian` for the totalized scalar derivative expression. Its API comprises:

* For a≠0, S(x↦ax+b)=0.
* For holomorphic f with f′≠0, S(f)=(P(f))′−(1/2)P(f)², with the native pre-Schwarzian P(f).
* S(f∘g)=(S(f)∘g)(g′)²+S(g) when f,g are holomorphic with the relevant derivatives nonzero.
* Postcomposition by a Möbius map with nonzero determinant leaves S unchanged wherever its denominator is nonzero.

**Checks.**

* S(x↦2x+1)=0.
* For x≠0, S(x↦x²)(x)=−3/(2x²).
* For x≠0, S(x↦1/x)(x)=0.

(CDT-journal, p.669; Remark 5.1.10.) *Needs:* Mathlib `iteratedDeriv` and `deriv`; Tau Ceti `TauCeti.Analysis.Complex.Conformal.PreSchwarzian`.

### 2.2 Schwarzian chain rule

For g holomorphic near x and f holomorphic near g(x), with g′(x)≠0 and f′(g(x))≠0, S(f∘g)(x)=S(f)(g(x))g′(x)²+S(g)(x).

(CDT-journal, p.669; Remark 5.1.10.) *Needs:* Layer 2, the schwarzian derivative.

### 2.3 Möbius invariance of the Schwarzian

For ad−bc≠0 and M(w)=(aw+b)/(cw+d), S(M∘f)=S(f) where f is locally univalent and cf+d≠0. A branch change of the inverse of a holomorphic cover is a projective transformation, so its Schwarzian is branch-independent.

(CDT-journal, p.669; Remark 5.1.10.) *Needs:* Layer 2, schwarzian chain rule; Layer 1, pointed analytic cover uniqueness; [FuchsianOrbifolds — layer 0 the effective projective möbius action](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/FuchsianOrbifolds/README.md#layer-0-the-effective-projective-möbius-action).

### 2.4 The Schwarzian differential equation

On a sufficiently small simply connected neighbourhood where w′≠0, choose an analytic square root of w′. Then v₁=w/√w′ and v₂=1/√w′ are independent solutions of y″+(1/2)S(w)y=0 and w=v₁/v₂. Conversely a quotient of independent solutions of y″+Qy=0 has Schwarzian 2Q wherever its denominator is nonzero.

(CDT-journal, p.669; (5.1.11).) *Needs:* Layer 2, the schwarzian derivative; Layer 0, analytic linear initial-value theorem; [ConformalMapping, Layers list, L3 Riemann mapping theorem](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/ConformalMapping/README.md).

### 2.5 Hempel’s accessory-parameter formula

Let S={p₀,…,p_N}⊂ℂ consist of distinct finite points, |S|≥3; thus infinity is unpunctured in ℙ¹∖S. For a local inverse τ of its holomorphic universal cover, S(τ)(X)=(1/2)Σ_k(X−p_k)⁻²+Σ_k m_k/(X−p_k) for constants m_k. The branch-independent Schwarzian is rational and has the stated principal parts.

Construct this punctured-sphere cover by moving one p_k to infinity with a Möbius chart and applying Layer 1 to the resulting plane with at least two omitted points. Transport the cover back through that chart. The local cusp expansion supplies the double-pole coefficient 1/2, and Möbius invariance makes the continued Schwarzian single valued; regularity at the unpunctured infinity gives the constraints below. This proof supplies the accessory-parameter input invoked by CDT.

(CDT-journal, proof of Lemma 5.1.8, equation (5.1.13), p.670; Hem88, Theorem 3.1 (uncertified primary locator).) *Needs:* Layer 1, the finite-puncture cusp comparison (§1.7); Layer 2, möbius invariance of the schwarzian; Layer 1, hyperbolic uniformization of the cover; [FuchsianOrbifolds — layer 3 cusps and q coordinates](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/FuchsianOrbifolds/README.md#layer-3-cusps-and-q-coordinates).

### 2.6 Accessory-parameter constraints at infinity

With Hempel’s finite set S and infinity unpunctured, Σ m_k=0, Σ(2m_kp_k+1)=0, and Σ(m_kp_k²+p_k)=0. These are exactly cancellation of the X⁻¹, X⁻² and X⁻³ coefficients, so the Schwarzian is O(X⁻⁴) at infinity.

(CDT-journal, equation (5.1.14), p.670.) *Needs:* Layer 2, hempel’s accessory-parameter formula; Layer 2, schwarzian chain rule.

### 2.7 Accessory parameters for the symmetric punctures

Form the companion cover by composing F̃_N with sphere inversion, assigning ∞ at each zero of F̃_N and using the holomorphic reciprocal coordinate there. On the finite chart where F̃_N≠0 this is X=1/F̃_N, and its target is ℙ¹∖({0}∪μ_N). Its accessory parameters are m₀=0 and m_k=−(1/2+1/(2N))ζ_N^(−k), k=1,…,N. Rotational symmetry and the three infinity constraints determine them.

(CDT-journal, proof of Lemma 5.1.8 following (5.1.14), pp.670–671.) *Needs:* Layer 2, accessory-parameter constraints at infinity; Layer 1, rotation equivariance of the covering.

### 2.8 The rational Schwarzian for the roots cover

The headline theorem is `roots_inverse_schwarzian`. For every analytic local inverse ψ_N at x∉μ_N whose value lies in 𝔻 and whose composition with F_N is the identity near x, S(ψ_N)(x)=((N²−1)x^(N−2)+x^(2N−2))/(2(x^N−1)²) at x. Obtain this by changing the companion coordinate X=1/x; S(1/x)=0 and the squared derivative factor is essential.

(CDT-journal, p.669; Lemma 5.1.8.) *Needs:* Layer 2, accessory parameters for the symmetric punctures; Layer 2, schwarzian chain rule.

### 2.9 The linear equation of the inverse covering

For N≥2 the local inverse ψ_N fixing zero is a quotient η₁/η₂ of independent solutions of 4(x^N−1)²y″+((N²−1)x^(N−2)+x^(2N−2))y=0. Choose the quotient normalization to agree with the actual inverse germ; an arbitrary basis gives it only up to a Möbius map.

(CDT-journal, p.669; Lemma 5.1.8.) *Needs:* Layer 2, the rational schwarzian for the roots cover; Layer 2, the schwarzian differential equation; Layer 0, analytic linear initial-value theorem.

### Examples

For w(x)=x² at x≠0, w′=2x,w″=2,w‴=0, giving S(w)=−3/(2x²). Inverting the coordinate has S(x↦1/x)=0, while its chain-rule weight is x⁻⁴. For N=2 the roots inverse has S(ψ₂)(0)=3/2; with ψ₂′(0)=γ₂⁻¹ and ψ₂″(0)=0 this gives ψ₂‴(0)=3/(2γ₂). These checks fix the sign and the factor one half in the inverse ODE. (CDT Remark 5.1.10, p.669; proof of Lemma 5.1.8, pp.670–671.)

### Dependencies

Layer 0 initial values, Layer 1 holomorphic covering and equivariance, logarithm/root branches and the imported projective action and logarithmic cusp charts. The accessory-parameter target requires the cusp expansion, analytic descent of the Schwarzian, absence of extra singularities and rationality; principal-part algebra alone is insufficient.

## Layer 3: finite Blaschke products and quotient representation

Develop boundary-compatible factors and the normalized logarithmic integral. Removing the interior zeros gives a zero-free function to which the Herglotz formula applies; smoothing then supplies a multiplier with two controlled boundary norms.

### 3.1 Boundary-compatible Blaschke factors

For |a|≤1 define b_a(z)=(z−a)/(1−āz) if |a|<1, and b_a(z)=−a if |a|=1. The boundary formula is the removable extension of the same rational expression; it has no zero. The interior factor is the existing Tau Ceti unitDiscMoebius after coercion; the new wrapper adds only the removable boundary extension in CDT’s convention.

Its API comprises:

* For |a|<1, the factor is (z−a)/(1−āz); for |a|=1 it is the constant −a.
* For |a|≤1 and |z|=1, its modulus is one.
* For a,z∈`Complex.UnitDisc`, the scalar factor equals the coercion of `TauCeti.unitDiscMoebius a z`. The wrapper extends the native interior factor to boundary parameters.

**Checks.**

* b_0(z)=z; the opposite Möbius sign would give −z.
* b_1(z)=−1, including at z=1 after removable extension; raw totalized 0/0 would give zero there.
* b_(−1)(z)=1; using the parameter itself rather than its negative gives the wrong boundary constant.

(CDT-journal, proof of Lemma 2.3.1, p.640 (the finite zero divisor).) *Needs:* Tau Ceti `TauCeti.unitDiscMoebius`; Tau Ceti `TauCeti.coe_unitDiscMoebius`.

### 3.2 Finite Blaschke products

For a finite family |a_i|≤1 and multiplicities n_i∈ℕ, set B(z)=∏_i b_(a_i)(z)^n_i, with the empty product equal to 1. It is holomorphic near the closed unit disc and has boundary modulus one. It maps the open disc into the closed disc; strict image in the open disc requires at least one positive multiplicity at an interior zero.

Its API comprises:

* An empty family has B=1, and concatenating finite zero families multiplies their products.
* On |z|=1, the product has modulus one.
* A product with a positive interior multiplicity has |B(z)|<1 for |z|<1; a boundary-only product has modulus one there.

**Checks.**

* The product over Fin 0 is 1.
* One zero a=0 of multiplicity two gives B(z)=z².
* One boundary zero a=1 of multiplicity one gives B=−1, not an open-disc-valued map.

(CDT-journal, proof of Lemma 2.3.1, p.640 (the finite zero divisor).) *Needs:* Layer 3, boundary-compatible blaschke factors.

### 3.3 Herglotz representation of a normalized logarithm

For R>0 and g holomorphic and zero-free on a neighbourhood of the closed disc |z|≤R, with g(0)=1, construct the unique analytic log L with L(0)=0 and exp L=g. Unlike the native formula for an already given holomorphic L, this target supplies that normalized logarithm and the identity Re L=log|g|. For |z|<R, L(z)=∫_(|w|=R) log|g(w)|(w+z)/(w−z) dμ_Haar(w).

(CDT-journal, proof of Lemma 2.3.1, p.640; equations (6.1.9)–(6.1.10), p.680.) *Needs:* Tau Ceti `DiffContOnCl.circleAverage_herglotzRieszKernel_smul_re_add`; Mathlib `DiffContOnCl.circleAverage_re_herglotzRieszKernel_smul`; [ConformalMapping, Layers list, L3 Riemann mapping theorem](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/ConformalMapping/README.md).

### 3.4 The derivative Herglotz formula

Under the preceding normalized zero-free hypotheses, for |z|<R, g′(z)/g(z)=∫_(|w|=R) 2w log|g(w)|/(w−z)² dμ_Haar(w). The differentiated identity also holds without g(0)=1 after normalizing by g(0).

(CDT-journal, p.680; Lemma 6.1.7.) *Needs:* Layer 3, herglotz representation of a normalized logarithm; Mathlib `hasDerivAt_circleAverage_herglotzRieszKernel_smul`.

### 3.5 The phase in the complex quotient identity

For a zero-free holomorphic G near the closed disc of radius r>0, exp(∫ log|G(w)|(w+z)/(w−z)dμ)=G(z)|G(0)|/G(0) for |z|<r. Thus a complex quotient formula reconstructing G requires the constant phase G(0)/|G(0)|; a formula of absolute values does not.

(CDT-journal, proof of Lemma 2.3.1, pp.640–641.) *Needs:* Layer 3, herglotz representation of a normalized logarithm.

### 3.6 Radial smoothing of the quotient multiplier

If g is holomorphic near the closed unit disc, the radius-r Blaschke/Herglotz construction for r>1 sufficiently close to 1 gives a multiplier h holomorphic on a neighbourhood of the closed unit disc with h(0)=1. The resulting boundary bounds converge to m(1,g) as r decreases to 1, including boundary zeros by integrable logarithmic control.

(CDT-journal, proof of Lemma 2.3.1, pp.640–641.) *Needs:* Mathlib `MeromorphicOn.exists_canonicalDecomp` and `Complex.CanonicalDecomp.divisor_eq_divisor`; Layer 3, the phase in the complex quotient identity; Mathlib `ValueDistribution.proximity`; Mathlib `MeromorphicOn.circleAverage_log_norm`.

### 3.7 Nevanlinna’s quotient representation

The headline theorem is `quotient_representation`. For ε>0 and g holomorphic near the closed unit disc, there is h holomorphic near that disc with h(0)=1 and max{sup_(|z|=1) log|h(z)|,sup_(|z|=1) log|h(z)g(z)|}≤m(1,g)+ε. The zero function g is handled separately. Use logarithmic suprema, not suprema of |h|.

(CDT-journal, Lemma 2.3.1 and its proof, pp.639–641.) *Needs:* Layer 3, radial smoothing of the quotient multiplier; Layer 3, the phase in the complex quotient identity; Mathlib `ValueDistribution.proximity`.

### 3.8 Optimality of the quotient bound

If g,h are holomorphic near the closed unit disc and h(0)=1, then m(1,g)≤max{sup_(|z|=1) log|h(z)|,sup_(|z|=1) log|h(z)g(z)|}. This is the lower bound in Remark 2.3.3; use the a.e. logarithmic identity across isolated zeros.

(CDT-journal, p.641; Remark 2.3.3.) *Needs:* Mathlib `MeromorphicOn.circleAverage_log_norm`; Mathlib `ValueDistribution.proximity`.

### Examples

For g=i the logarithmic boundary integral is zero. Its exponential is 1, and multiplying by the phase G(0)/|G(0)|=i reconstructs g. For g(z)=z−1 the boundary factor b₁=−1 leaves G(z)=1−z with a zero on the boundary; this cannot be fed to the zero-free closed-disc Herglotz theorem without enlarging/rescaling the radius to a circle avoiding zeros. For g=h=1 both logarithmic suprema and m(1,g) are zero. (CDT Lemma 2.3.1 and Remark 2.3.3, pp.639–641; (6.1.10), p.680.)

### Dependencies

Analytic logarithms, native disc Möbius factors, compact finite zero divisors, removable singularities and the Poisson/Herglotz kernel. The native closed-disc Jensen and meromorphic logarithm integrability theorems justify the boundary-zero limits on the slightly enlarged disc; the disc-local characteristic of Layer 7 is not needed for this construction.

## Layer 4: hypergeometric inverse germs and continuation

Connect the rational Schwarzian equation to the native Gauss series. Distinguish its series germ from its analytic continuation near the singular value one, and give uniform control of the continued coefficients.

### 4.1 The Gauss hypergeometric equation

For arbitrary complex numerator parameters a,b, denominator parameter c outside the nonpositive integers and |x|<1, the native ₂F₁(a,b;c;x) satisfies x(1−x)y″+(c−(a+b+1)x)y′−aby=0. The value and first Taylor coefficient at 0 are 1 and ab/c. If a or b is a nonpositive integer the series terminates and the polynomial Gauss identity holds on all ℂ. Use the supplied entire-radius theorems for these cases; c must still avoid denominator poles. In particular ₂F₁(0,1;1;x)=1 and ₂F₁(−1,1;1;x)=1−x for every x∈ℂ, both of which solve the equation.

(DLMF-15-10, equation 15.10.1, DLMF-15-10 line 76; CDT-journal, proof of Lemma 5.1.16, p.672.) *Needs:* Mathlib `ordinaryHypergeometric`; Mathlib `ordinaryHypergeometric_eq_tsum`; Mathlib `ordinaryHypergeometric_zero`; Mathlib `ordinaryHypergeometricSeries_radius_eq_one`; `ordinaryHypergeometric_radius_top_of_neg_nat₁` and `ordinaryHypergeometric_radius_top_of_neg_nat₂`.

**Checks.**

* At a=0,b=c=1, the series is 1 on all ℂ, and every term of Gauss’s equation vanishes.
* At a=−1,b=c=1, the series is 1−x on all ℂ; the equation reduces to −1+x+1−x=0. This tests the terminating case without imposing |x|<1.
* c=0 is excluded: the classical ordinary hypergeometric function has a denominator-parameter pole; Lean’s totalized ab/c is not a classical analytic initial-value assertion there.

### 4.2 The descended inverse differential equation

After x=u^N the two solutions η_i(u) of the roots inverse equation give φ_i(x)=η_i(x^(1/N)) on a compatible punctured branch, satisfying x(x−1)²φ″+(1−1/N)(x−1)²φ′+(1/4+(x−1)/(4N²))φ=0.

(CDT-journal, Lemma 5.1.16, equation (5.1.17), p.671; its change-of-variable calculation, p.672.) *Needs:* Layer 2, the linear equation of the inverse covering.

### 4.3 The two hypergeometric solutions

Let a_±=(N±1)/(2N). On compatible branches near a punctured zero, √(1−x)x^(1/N)₂F₁(a_+,a_+;2a_+;x) and √(1−x)₂F₁(a_−,a_−;2a_−;x) solve the transformed equation. Their leading terms x^(1/N) and 1 match the normalized η₁,η₂ after substituting x=u^N.

(CDT-journal, proof of Lemma 5.1.16, equations (5.1.17)–(5.1.19), pp.671–672.) *Needs:* Layer 4, the gauss hypergeometric equation; Layer 4, the descended inverse differential equation; Layer 0, analytic linear initial-value theorem.

### 4.4 The normalized inverse-ratio germ

For N≥2 set J_N(u)=u·₂F₁(a_+,a_+;2a_+;u^N)/₂F₁(a_−,a_−;2a_−;u^N) near u=0, where a_±=(N±1)/(2N). The denominator is 1 at zero. Thus J_N is holomorphic with J_N(0)=0 and J_N′(0)=1. Its expression is a genuine analytic germ and avoids an unjustified global principal-root identity.

Use `inverseRatio N u` for this scalar germ expression. Its API, for N≥2, comprises:

* The formula is the displayed quotient of the native `ordinaryHypergeometric` functions.
* J_N(0)=0 and J_N′(0)=1.
* J_N(ζu)=ζJ_N(u) for ζ^N=1 wherever the germ expression is defined.

**Checks.**

* J_2(0)=0.
* J_2′(0)=1.
* The third complex derivative of J_2 at zero is 3/2, corresponding to the cubic coefficient 1/4; the identity germ would give zero.

(CDT-journal, p.671; Lemma 5.1.16.) *Needs:* Mathlib `ordinaryHypergeometric`; Mathlib `ordinaryHypergeometric_zero`; Mathlib `ordinaryHypergeometricSeries_radius_eq_one`; Layer 4, the two hypergeometric solutions.

### 4.5 Matching the actual covering inverse

The headline theorem is `inverseRatio.cover_inverse`. For the oriented cover with F_N′(0)>0, ψ_N(u)=|F_N′(0)|⁻¹J_N(u) as germs at zero. The inverse of G_N is φ_N(x)=|F_N′(0)|^(−N)x(₂F₁(a_+,a_+;2a_+;x)/₂F₁(a_−,a_−;2a_−;x))^N. For an unoriented cover replace the real prefactor by F_N′(0)⁻¹ and its Nth power.

(CDT-journal, proof of Lemma 5.1.16, pp.671–672.) *Needs:* Layer 4, the normalized inverse-ratio germ; Layer 4, the two hypergeometric solutions; Layer 1, derivative of the descended power map; Layer 2, the linear equation of the inverse covering.

### 4.6 Zero-balanced hypergeometric continuation

For positive real a and 0<|x|<1 on a fixed compatible branch of log x, the analytic continuation of ₂F₁(a,a;2a;1−x) equals Γ(2a)/Γ(a)² times Σₖ≥₀(a)_k² x^k/(k!)²·(−log x+2(ψ(k+1)−ψ(k+a))). This refers to the continued analytic function, not the totalized native series value outside its disc. The proof needs only a∈[1/4,3/4]. A more general finite-valued parameter statement must also exclude poles of 2a.

(CDT-journal, p.672; Lemma 5.1.20; [DLMF 15.8.10](https://dlmf.nist.gov/15.8.E10), specialized to m=0 and b=a, with the normalization in [15.2.2](https://dlmf.nist.gov/15.2.E2).) *Needs:* Mathlib `ordinaryHypergeometric`; Mathlib `ordinaryHypergeometric_eq_tsum`; Mathlib `Complex.digamma`.

The coefficient at k=0 is −log x−2γ−2ψ(a). Subsequent coefficients use ψ(k+1), without an index shift. DLMF's bold hypergeometric function is divided by Γ(2a); restoring the ordinary normalization gives the prefactor above. The principal formula uses |arg x|<π; other compatible logarithmic branches are obtained by continuation of both sides along the same path. Prove convergence on the chosen branch and identify the continued solution with the native series on their common domain.

### 4.7 Uniform digamma coefficient control

For a∈[1/4,3/4] and k≥1, 0≤ψ(k+1)−ψ(k+a)≤ψ(2)−ψ(5/4), and the difference decreases in both k and a. This uses the coefficient ψ(k+1)−ψ(k+a), not ψ(k)−ψ(k+a).

(CDT-journal, p.676; Lemma 5.2.9; the reciprocal-series formula [DLMF 5.7.6](https://dlmf.nist.gov/5.7.E6).) *Needs:* Mathlib `Complex.digamma`; Mathlib `Complex.digamma_apply_add_nat`.

### 4.8 Uniform zero-balanced remainder

For each fixed M₀>0, a∈[1/4,3/4] and 0<|x|≤e^(−M₀N), N≥2, the k≥1 part of the zero-balanced series and its a-derivative have bounds uniform in a,N, with size O₍M₀₎(|x|(1+|log x|)). The derivative control is required to gain the factor 1/N when comparing a_+ and a_−.

(CDT-journal, p.676; Lemma 5.2.9.) *Needs:* Layer 4, zero-balanced hypergeometric continuation; Layer 4, uniform digamma coefficient control.

### Examples

At N=2, a₊=3/4 and a₋=1/4. The first coefficients of the numerator and denominator series are 3/8 and 1/8, giving J₂(u)=u+(1/4)u³+O(u⁵); hence J₂‴(0)=3/2. In the connection formula k=0 contributes −log x−2γ−2ψ(a), because ψ(1)=−γ. At a=1/2 and k=1, ψ(2)−ψ(3/2)=2log 2−1>0, which pins the index k+1. (CDT Lemmas 5.1.16 and 5.1.20, pp.671–672; Lemma 5.2.9, p.676.)

### Dependencies

Layers 0–2, the native ordinary hypergeometric series and Gamma/digamma functions. Continued branches require an analytic overlap comparison with the native series, and the uniform tail estimate requires dominated differentiation in the real parameter. The totalized native series outside its convergence disc is never used as a continued branch.

## Layer 5: exact conformal radius and its expansion

The inverse germ and its real cusp limit determine the radius. Gamma identities give both a closed formula and an absolutely convergent odd-zeta expansion, with effective remainder bounds.

### 5.1 The explicit Gamma radius

For N≥2 define γ_N=16^(1/N)Γ(1+1/(2N))²Γ(1−1/N)/(Γ(1−1/(2N))²Γ(1+1/N)), using the native real Gamma function and positive real power. All Gamma arguments are positive. A totalized arithmetic expression outside N≥2 is not assigned a uniformization interpretation.

Use `gammaRadius N` for this expression. Its API comprises:

* The formula is the displayed expression in the native real Gamma function.
* For N≥2 it is positive and equals Γ((N−1)/(2N))²Γ(1+1/N)/(Γ((N+1)/(2N))²Γ(1−1/N)).
* It tends to one as N tends to infinity.

**Checks.**

* γ_2=Γ(1/4)^4/(4π²).
* γ_3=Γ(1/6)^3/(12π^(3/2)).
* The totalized expression at N=1 is zero through Γ(0)=0; it is not a positive hyperbolic radius.

(CDT-journal, Theorem 5.1.4, p.668; CDT-journal line 2382.) *Needs:* Mathlib `Real.Gamma`; Mathlib `Real.Gamma_pos_of_pos`.

### 5.2 Positivity of the Gamma radius

For every N≥2, γ_N>0 and every Gamma factor in its denominator is nonzero.

(CDT-journal, Theorem 5.1.4, p.668; CDT-journal line 2382.) *Needs:* Layer 5, the explicit gamma radius; Mathlib `Real.Gamma_pos_of_pos`.

### 5.3 The alternative Gamma expression

For N≥2, γ_N=Γ((N−1)/(2N))²Γ(1+1/N)/(Γ((N+1)/(2N))²Γ(1−1/N)).

(CDT-journal, proof of Theorem 5.1.4, pp.672–673 (Gamma duplication and reflection).) *Needs:* Layer 5, the explicit gamma radius; Mathlib `Real.Gamma_mul_Gamma_one_sub`; Mathlib `Real.Gamma_mul_Gamma_add_half`; Mathlib `Real.Gamma_pos_of_pos`.

### 5.4 The boundary limit of the inverse ratio

Along the compatible real branch x→1 from below, the ratio s_N(x)=x^(1/N)₂F₁(a_+,a_+;2a_+;x)/₂F₁(a_−,a_−;2a_−;x) tends to Γ(1+1/N)Γ(a_−)²/(Γ(1−1/N)Γ(a_+)²). The inverse cover approaches a boundary point of modulus one.

(CDT-journal, p.672; Proof of Theorem 5.1.4.) *Needs:* Layer 1, the finite-puncture cusp comparison (§1.7); Layer 4, zero-balanced hypergeometric continuation; Layer 4, matching the actual covering inverse; Layer 1, the normalized roots-of-unity covering; [FuchsianOrbifolds — layer 3 cusps and q coordinates](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/FuchsianOrbifolds/README.md#layer-3-cusps-and-q-coordinates).

### 5.5 The conformal radius of the punctured plane

The headline theorem is `roots_conformal_radius`. For N≥2 and every holomorphic universal cover F_N:𝔻→ℂ∖μ_N with F_N(0)=0, |F_N′(0)|=R(ℂ∖μ_N,0)=γ_N. In particular |F_2′(0)|=Γ(1/4)^4/(4π²) and |F_3′(0)|=Γ(1/6)^3/(12π^(3/2)).

(CDT-journal, Theorem 5.1.4, p.668; CDT-journal line 2382.) *Needs:* Layer 5, the boundary limit of the inverse ratio; Layer 5, the alternative gamma expression; Layer 1, the pointed conformal radius; Layer 1, pointed analytic cover uniqueness; Mathlib `Real.Gamma_mul_Gamma_one_sub`; Mathlib `Real.Gamma_mul_Gamma_add_half`.

### 5.6 The local log-Gamma Taylor series

For |z|<1, the analytic branch of log Γ(1+z) vanishing at z=0 is −γz+Σₖ≥₂(−1)^kζ(k)z^k/k. For real −1<z<1 this is the ordinary log of the positive real Gamma function.

(CDT-journal, p.673; proof of Theorem 5.1.4; [DLMF 5.7.3](https://dlmf.nist.gov/5.7.E3), combined with the log(1+z) Taylor series for |z|<1.) *Needs:* Mathlib `Real.Gamma`; Mathlib `Complex.Gamma`; Mathlib `Complex.Gamma_ne_zero_of_re_pos`; Mathlib `Complex.Gamma_ofReal`; Mathlib `Real.BohrMollerup.tendsto_log_gamma`; Mathlib `Complex.digamma`.

### 5.7 The odd-zeta radius series

For every integer N≥2, log γ_N=(log 16)/N+Σₖ≥₁(2^(2k)−1)ζ(2k+1)/(2^(2k−1)(2k+1)N^(2k+1)), with an absolutely convergent series of positive terms.

(CDT-journal, proof of Theorem 5.1.4, p.673 (the log-Gamma expansion).) *Needs:* Layer 5, the local log-gamma taylor series; Layer 5, the explicit gamma radius; Layer 5, positivity of the gamma radius.

### 5.8 The positive radius expansion

The headline theorem is `gammaRadius.positive_expansion`. For N≥2 write γ_N=16^(1/N)(1+ζ(3)/(2N³)+3ζ(5)/(8N⁵)+E_N). Then E_N>0 and there is an explicit absolute C with E_N≤C/N⁶. Consequently this is the positive O(N⁻⁶) remainder of CDT (5.1.6).

(CDT-journal, Theorem 5.1.4, p.668; CDT-journal line 2382.) *Needs:* Layer 5, the odd-zeta radius series.

### Examples

Reflection and duplication give γ₂=Γ(1/4)⁴/(4π²)≈4.37687923 and γ₃=Γ(1/6)³/(12π^(3/2))≈2.5810565. The first two nonzero log-radius terms after (log 16)/N are ζ(3)/(2N³) and 3ζ(5)/(8N⁵); exponentiating also produces the positive N⁻⁶ term ζ(3)²/(8N⁶). At N=1 the arithmetic definition is zero, so its positive-radius interpretation is restricted to N≥2. (CDT Theorem 5.1.4, p.668; proof and Example 5.1.22, p.673.)

### Dependencies

Layer 1 pointed radius, Layer 4 inverse matching and continued cusp limit, and native Gamma reflection/duplication. The log-Gamma target requires a locally uniform logarithmic product limit and justified interchange of sums. An explicit tail and exponential remainder estimate supplies effectivity and positivity.

## Layer 6: the symmetric covering groups and their domains

Apply the projective-action and polygon theory of FuchsianOrbifolds to the specific roots cover. Build its primitive cusp datum, free deck presentation, power stabilizer and index-two triangle extension.

### 6.1 The symmetric ideal polygon

For N≥2 the deck group Γ_N of F_N has the ideal 2N-gon centred at zero with vertices exp(πik/N), k=0,…,2N−1, as the Cayley transport of `TauCeti.dirichletDomain Γ̃_N UpperHalfPlane.I`; its measurable fundamental-domain theorem is consumed from `TauCeti.Analysis.Complex.Fuchsian.DirichletDomain`. Its sides join adjacent vertices by hyperbolic geodesics; the prescribed side pairings recover the roots-of-unity quotient.

(CDT-journal, p.674; Proposition 5.2.1.) *Needs:* Layer 1, the normalized roots-of-unity covering; Layer 1, rotation equivariance of the covering; [FuchsianOrbifolds — layer 0 the effective projective möbius action](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/FuchsianOrbifolds/README.md#layer-0-the-effective-projective-möbius-action); [FuchsianOrbifolds — layer 2 hyperbolic polygons and cofinite groups](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/FuchsianOrbifolds/README.md#layer-2-hyperbolic-polygons-and-cofinite-groups); [ConformalMapping, Layers list, L3 Riemann mapping theorem](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/ConformalMapping/README.md); [ConformalMapping, Layers list, L4 analytic continuation and reflection](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/ConformalMapping/README.md).

### 6.2 The primitive cusp translation

The full stabilizer of i∞ in Γ̃_N is generated by τ↦τ+h_N where h_N=2cot(π/(2N))>0. This is the primitive positive generator, packaged as a native `Subgroup.CuspDatum` of width h_N with its full-stabilizer equality.

(CDT-journal, p.674; Proposition 5.2.1.) *Needs:* Layer 6, the symmetric ideal polygon; [FuchsianOrbifolds — layer 3 cusps and q coordinates](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/FuchsianOrbifolds/README.md#layer-3-cusps-and-q-coordinates).

### 6.3 The free deck-group presentation

Γ̃_N is free of rank N on t̃_N and r̃_N^k t̃_N r̃_N^(−k), k=1,…,N−1, where t̃_N is the primitive cusp translation. The projective rotation r̃_N has order N but is not a nontrivial element of the torsion-free deck group.

(CDT-journal, p.674; Proposition 5.2.1.) *Needs:* Layer 6, the symmetric ideal polygon; Layer 6, the primitive cusp translation; Layer 1, rotation equivariance of the covering; [FuchsianOrbifolds — layer 2 hyperbolic polygons and cofinite groups](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/FuchsianOrbifolds/README.md#layer-2-hyperbolic-polygons-and-cofinite-groups).

### 6.4 The power-map stabilizer group

Let Φ̃_N=⟨Γ̃_N,r̃_N⟩≤PSL₂(ℝ); by the deck presentation it equals ⟨r̃_N,t̃_N⟩. Its disc conjugate is Φ_N. The definition uses the existing projective action and subgroup closure; it is the paper-specific orientation-preserving (N,∞,∞) group, not a newly defined generic triangle-group theory.

Its API comprises:

* Γ̃_N≤Φ̃_N and Φ̃_N=⟨r̃_N,t̃_N⟩.
* Conjugation through C identifies the half-plane and disc actions.
* The index [Φ̃_N:Γ̃_N] is N.

**Checks.**

* For N=2 the quotient Φ̃_2/Γ̃_2 has order two.
* The image of r̃_N in the quotient has exact order N.
* For N≥2, r̃_N fixes i and is not a nontrivial deck transformation of the unramified cover.

For this action comparison use the actual conjugated action z↦C⁻¹(g(C(z))) on 𝔻 for every g∈Φ̃_N, and prove that composition and inversion agree with the native projective action. The two subgroup carriers are related by that group isomorphism, not by an unrelated action with the same generators.

(CDT-journal, p.674; Definition 5.2.3.) *Needs:* Layer 6, the free deck-group presentation; Layer 1, rotation equivariance of the covering; [FuchsianOrbifolds — layer 0 the effective projective möbius action](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/FuchsianOrbifolds/README.md#layer-0-the-effective-projective-möbius-action).

### 6.5 The largest invariance group of the power cover

F̃_N^N is invariant under Φ̃_N, and any g∈PSL₂(ℝ) satisfying F̃_N(gτ)^N=F̃_N(τ)^N for all τ∈ℍ lies in Φ̃_N. Hence Φ̃_N is exactly its full orientation-preserving invariance group and is discrete.

(CDT-journal, p.675; Corollary 5.2.4.) *Needs:* Layer 6, the power-map stabilizer group; Layer 1, the descended power map; Layer 1, nonvanishing derivative of the cover; [FuchsianOrbifolds — layer 0 the effective projective möbius action](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/FuchsianOrbifolds/README.md#layer-0-the-effective-projective-möbius-action).

### 6.6 The fundamental quadrilateral

The fundamental domain of Φ_N is the hyperbolic quadrilateral with vertices 0,exp(−πi/N),1,exp(πi/N), in that cyclic order. Its half-plane image has vertices i,−cot(π/(2N)),i∞,cot(π/(2N)), up to boundary orientation, and area 2π−2π/N, by the native `TauCeti.UpperHalfPlane.volume_triangle` Gauss–Bonnet theorem and its ideal-vertex limit.

(CDT-journal, p.675; Corollary 5.2.4.) *Needs:* Layer 6, the power-map stabilizer group; Layer 6, the symmetric ideal polygon; the native Cayley coordinate; [FuchsianOrbifolds — layer 2 hyperbolic polygons and cofinite groups](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/FuchsianOrbifolds/README.md#layer-2-hyperbolic-polygons-and-cofinite-groups).

### 6.7 The half-rotation involution

The headline theorem is `half_rotation_involution`. Let s̃ be the rotation about i of projective order 2N satisfying s̃²=r̃_N, and let s be its disc conjugate. Then 1−F̃_N(s̃τ)^N=1/(1−F̃_N(τ)^N) for τ∈ℍ. All denominators are nonzero because the covering omits μ_N. With the matrix convention of §1.10 the disc conjugate is s(z)=exp(−πi/N)z. The inverse rotation exp(πi/N)z used by the scalar signature gives the same Nth-power value, since these arguments differ by an Nth-root rotation and §1.10 gives equivariance.

(CDT-journal, p.675; Lemma 5.2.6.) *Needs:* Layer 6, the fundamental quadrilateral; Layer 1, the descended power map; Layer 1, rotation equivariance of the covering; [ConformalMapping, Layers list, L4 analytic continuation and reflection](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/ConformalMapping/README.md); [FuchsianOrbifolds — layer 2 hyperbolic polygons and cofinite groups](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/FuchsianOrbifolds/README.md#layer-2-hyperbolic-polygons-and-cofinite-groups).

### 6.8 The index-two triangle supergroup

Set Ψ̃_N=⟨s̃,t̃_N⟩. Then Φ̃_N is normal of index two in Ψ̃_N, and a fundamental domain for the disc action is the geometric triangle with vertices 0,1,exp(πi/N) and angles π/N,0,0. Distinguish this geometric triangle from Φ̃_N’s (N,∞,∞) orbifold signature; the full reflection group is not a subgroup of PSL₂(ℝ).

Define s̃ by the determinant-one matrix [cos(π/(2N)),−sin(π/(2N));sin(π/(2N)),cos(π/(2N))], so its projective square is the displayed r̃_N. The triangle region is the intersection in 𝔻 of the geodesic half-planes bounded by its three sides. Prove measurability, covering of 𝔻 by its Ψ_N-translates and almost-everywhere disjointness of the interiors of distinct translates. After transport by C its native hyperbolic volume, computed by `TauCeti.UpperHalfPlane.volume_triangle` and the ideal-vertex limit, is π−π/N; the Φ_N quadrilateral has volume 2π−2π/N. The orientation assertion uses the actual holomorphic projective action and excludes the antiholomorphic reflection τ↦−conj τ from that group.

Its API comprises:

* Ψ̃_N is generated by s̃ and t̃_N, with [Ψ̃_N:Φ̃_N]=2.
* The specified triangle is a measurable fundamental domain for its disc action.
* The projective action preserves orientation; reflection constructions are consumed through the existing triangle theory.

**Checks.**

* For N=2 the Φ area is π and the Ψ area is π/2.
* The nontrivial coset is represented by s̃, whose square lies in Φ̃_N.
* An antiholomorphic reflection is not an element of PSL₂(ℝ).

(CDT-journal, p.675; Remark 5.2.8.) *Needs:* Layer 6, the half-rotation involution; Layer 6, the power-map stabilizer group; [FuchsianOrbifolds — layer 2 hyperbolic polygons and cofinite groups](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/FuchsianOrbifolds/README.md#layer-2-hyperbolic-polygons-and-cofinite-groups).

### Examples

For N=2, h₂=2 and the ideal quadrilateral has area 2π. The power stabilizer has index two over the deck group and area π; its index-two supergroup has area π/2. For N=3 the displayed matrix r̃₃ sends τ=2i to (3√3+8i)/13. Cayley inversion gives (τ−i)/(τ+i)=1/3 before the action and −1/6−(√3/6)i afterwards, equal to ζ₃⁻¹/3. Thus that matrix represents the inverse disc rotation in the standard left action. The supergroup's triangular region has angle π/N at zero but is a fundamental region for the stated orientation-preserving group; it is not a claim that its abstract orbifold orders are (N,∞,∞). (CDT Proposition 5.2.1, p.674; Corollary 5.2.4, Lemma 5.2.6 and Remark 5.2.8, p.675.)

### Dependencies

Layer 1 actual roots cover and descended map; FuchsianOrbifolds Layers 0, 2 and 3, including its projective action, free-locus quotient, measured polygon regions, side pairings and full primitive cusp datum; analytic reflection. Establish the reflected polygon covering and its cusp permutation, then identify it with F_N by based-cover uniqueness.

## Layer 7: value distribution on the open disc

Localize the native divisor and characteristic machinery to compact subdiscs. Keep the centre term and punctured-germ conventions explicit, so Jensen and the first main theorem apply without an extension to the whole plane.

### 7.1 The disc-local pole-counting function

For f meromorphic on 𝔻 and 0<r<1 set D_r=−min(divisor(f,closedBall(0,r)),0), the negative part of the native integer local divisor. Define N_D(r,f)=Σᶠ_a D_r(a)log(r·|a|⁻¹)+D_r(0)log r. Native totalized log makes the summand at a=0 zero; the separate centre term restores its pole weight. Poles on |a|=r have weight zero. No extension of the disc divisor to a globally locally finite divisor is required.

Use `discCounting f r` for this local pole count. Its API comprises:

* For f meromorphic on 𝔻 and 0<r<1, N_D=Σ_(0<|a|<r)ord⁻_a(f)log(r/|a|)+ord⁻_0(f)log r.
* For globally meromorphic f and 0<r<1, it agrees with `ValueDistribution.logCounting f ⊤ r`.
* For meromorphic functions equal near the closed disc of radius r, their local pole counts agree.
* For f meromorphic on 𝔻, n∈ℕ and 0<r<1, N_D(r,f^n)=nN_D(r,f).

**Checks.**

* For 0<r<1, N_D(r,z↦1/z)=log r<0.
* For the constant one and the identically zero function N_D=0; infinite meromorphic order must not be mistaken for a pole.
* For a≠0 and r=|a|<1, N_D(r,z↦1/(z−a))=0 although f has a pole on the boundary circle.

(CDT-journal, p.679; 6.1.1.) *Needs:* Mathlib `MeromorphicOn.divisor`; Mathlib `MeromorphicOn.divisor_ball_support_finite`; Mathlib `MeromorphicOn.divisor_restrict`; Mathlib `ValueDistribution.logCounting`.

### 7.2 The disc-local characteristic

For f meromorphic on 𝔻 and 0<r<1 define T_D(r,f)=ValueDistribution.proximity f ∞ r+N_D(r,f). Reuse the native proximity function exactly. The local divisor wrapper is the only change from the native global characteristic; do not assert nonnegativity for a general centre pole or manufacture a global meromorphic extension.

Use `discCharacteristic f r` for this local characteristic. Its API, for 0<r<1, comprises:

* T_D(r,f)=m(r,f)+N_D(r,f), using the native `ValueDistribution.proximity`.
* For globally meromorphic f, it agrees with `ValueDistribution.characteristic f ⊤ r`.
* For holomorphic f on 𝔻, it equals m(r,f).
* For n∈ℕ and f meromorphic on 𝔻, T_D(r,f^n)=nT_D(r,f).

**Checks.**

* For every constant c, T_D(r,c)=log⁺|c|, including c=0 with totalized positive logarithm zero.
* For 0<r<1, T_D(r,z↦z)=0.
* For 0<r<1, T_D(r,z↦1/z)=0: m=−log r cancels N_D=log r.

(CDT-journal, p.679; 6.1.1.) *Needs:* Layer 7, the disc-local pole-counting function; Mathlib `ValueDistribution.proximity`; Mathlib `ValueDistribution.characteristic`.

### 7.3 Pole-counting positivity at a regular centre

For f meromorphic on 𝔻 whose meromorphic germ at 0 has no pole (meromorphicOrderAt f 0≥0, including infinite order), N_D(r,f)≥0 whenever 0<r<1. A totalized scalar value at 0 is not a regularity hypothesis.

(CDT-journal, p.679; Lemma 6.1.2.) *Needs:* Layer 7, the disc-local pole-counting function.

### 7.4 Vanishing of the local pole count

For f meromorphic on 𝔻 with no pole in its meromorphic germ at 0, N_D(r,f)=0 iff every germ at |z|<r has nonnegative meromorphic order, equivalently admits a holomorphic removable extension. For a scalar representative also continuous on this open disc, this is equivalent to pointwise holomorphicity of f there. Without that continuity guard, arbitrary isolated point values need not agree with the extensions. A pole on |z|=r has zero weight and is permitted; no closed-disc conclusion is inferred.

(CDT-journal, p.679; Lemma 6.1.2.) *Needs:* Layer 7, pole-counting positivity at a regular centre; Mathlib `MeromorphicOn.divisor`; Mathlib `MeromorphicAt`; Mathlib `MeromorphicAt.meromorphicOrderAt_nonneg_iff`; Mathlib `MeromorphicAt.analyticAt`.

For example, the representative equal to 2 at zero and 1 elsewhere has zero divisor and zero local pole count but is discontinuous at zero. This distinguishes removable punctured germs from pointwise analytic scalar functions.

For this test representative the value is two at zero and one everywhere else. Its deleted germ at zero is the constant-one germ, so its native meromorphic order is zero. These are properties of a scalar representative, not a second notion of meromorphic function.

**Checks.**

* Its assigned value at zero is two, whereas its punctured limit is one.
* At every nonzero point it is locally the constant one, and at zero it is meromorphic with order zero in the native punctured-germ convention.
* For 0<r<1 its pole count is zero, but it is neither continuous nor analytic at zero; omitting continuity from the pointwise analytic criterion would admit this counterexample.

### 7.5 The disc-local Jensen identity

For f meromorphic on 𝔻, with nonzero meromorphic germ at 0, and 0<r<1, ∫ log|f|dμ=N_D(r,1/f)−N_D(r,f)+log|c(f,0)|, where c(f,0) is the native nonzero meromorphic trailing coefficient at 0.

(CDT-journal, p.680; proof of the first main theorem, Poisson–Jensen discussion and (6.1.4).) *Needs:* Layer 7, the disc-local pole-counting function; Mathlib `MeromorphicOn.circleIntegrable_log_norm` and `MeromorphicOn.circleIntegrable_posLog_norm`; Mathlib `MeromorphicOn.circleAverage_log_norm`; Mathlib `MeromorphicOn.divisor_fun_inv`.

### 7.6 The local first main inversion identity

For f meromorphic on 𝔻 with nonzero germ at 0 and 0<r<1, T_D(r,f)−T_D(r,1/f)=log|c(f,0)|. Neither global meromorphicity nor a regular centre is required; the trailing coefficient must be finite and nonzero.

(CDT-journal, p.680; equation (6.1.4).) *Needs:* Layer 7, the disc-local characteristic; Layer 7, the disc-local jensen identity; Mathlib `MeromorphicOn.circleIntegrable_log_norm` and `MeromorphicOn.circleIntegrable_posLog_norm`; Mathlib `ValueDistribution.proximity`; Mathlib `ValueDistribution.characteristic_sub_characteristic_inv_of_ne_zero`.

### 7.7 Translation bound for proximity

For a∈ℂ and circle-integrable local meromorphic f, |m(r,f−a)−m(r,f)|≤log⁺|a|+log 2. This follows from the pointwise positive-log triangle bound, including zeros via totalized log⁺.

(CDT-journal, equation (6.1.5), p.680.) *Needs:* Mathlib `ValueDistribution.proximity`; Mathlib `MeromorphicOn.circleIntegrable_log_norm` and `MeromorphicOn.circleIntegrable_posLog_norm`.

### 7.8 The translated local first main theorem

The headline theorem is `local_first_main_translation`. For f meromorphic on 𝔻 with f−a having a nonzero germ at 0, and 0<r<1, |T_D(r,f)−T_D(r,1/(f−a))−log|c(f,a)||≤log⁺|a|+log 2. The coefficient is the nonzero leading meromorphic coefficient of f−a; the identically constant f=a case is excluded.

(CDT-journal, p.679; equation (6.1.3), with proof on p.680.) *Needs:* Layer 7, the local first main inversion identity; Layer 7, translation bound for proximity; Layer 7, the disc-local pole-counting function.

### 7.9 The local characteristic power law

For f meromorphic on 𝔻, n∈ℕ and 0<r<1, T_D(r,f^n)=nT_D(r,f). For n=0 both sides are zero. Pole and zero multiplicities and positive log norms scale by n.

(CDT-journal, p.682; last equality of equation (6.2.3), together with §6.1.1 on p.679.) *Needs:* Layer 7, the disc-local characteristic; Mathlib `MeromorphicOn.divisor_fun_pow`; Mathlib `ValueDistribution.proximity`.

### 7.10 Radial monotonicity of holomorphic proximity

For holomorphic h on 𝔻 and 0<r≤ρ<1, m(r,h)≤m(ρ,h). The positive log norm is subharmonic; this supplies the small-radius transfer used to remove 1/r from the logarithmic derivative estimate.

(CDT-journal, p.683; Corollary 6.2.9.) *Needs:* Mathlib `ValueDistribution.proximity`; Mathlib `DiffContOnCl.circleAverage_re_herglotzRieszKernel_smul`; Layer 3, herglotz representation of a normalized logarithm.

### Examples

For f(z)=1/z and 0<r<1, the proximity is −log r and the centre pole count is log r, so T_D=0. For f(z)=az with a≠0, Jensen gives log r+log|a|, fixing the trailing coefficient a and the sign of the zero-minus-pole count. A pole at a≠0 with r=|a| contributes zero; it prevents a closed-disc holomorphy conclusion but not the open-disc criterion. The function equal to 2 at zero and 1 elsewhere has order zero and zero count everywhere while failing continuity at zero. (CDT §6.1.1, p.679; Poisson–Jensen and (6.1.4), p.680.)

### Dependencies

Native local meromorphic orders, divisors, trailing coefficients, normalized circle averages and proximity; local Jensen on compact subdiscs, with the circle logarithms interpreted almost everywhere. Radial monotonicity needs the sub-mean property of log⁺|h|, including zeros. The localization must not extend a divisor by zero across accumulating unit-circle poles.

## Layer 8: quantitative cusp geometry and maximum growth

Use the uniform inverse asymptotic to place small cusp values in horoballs. The projective group and its primitive translation control every transported horoball; the half rotation turns this into a bound on large values.

### 8.1 Uniform cusp asymptotics of the inverse ratio

For M₀>0 there is C(M₀) such that for all N≥2, M≥M₀ and 0<|x|<e^(−MN), on a compatible logarithmic branch, |s_N(1−x)/γ_N−(1−x)^(1/N)(−log x−2γ−2ψ(a_+))/(−log x−2γ−2ψ(a_−))|≤C(M₀)|x|/N. Here γ is Euler’s constant and a_±=(N±1)/(2N).

(CDT-journal, p.676; Lemma 5.2.9.) *Needs:* Layer 4, zero-balanced hypergeometric continuation; Layer 4, uniform zero-balanced remainder; Layer 5, the alternative gamma expression; Mathlib `Complex.digamma_one`.

### 8.2 Height near a small cusp value

For M₀>0 and 0<ε<1, there is an effective N₀(ε,M₀) such that, for N≥N₀, M≥M₀ and τ in the fundamental quadrilateral Ω̃′_N, |F̃_N(τ)^N−1|<e^(−MN) implies Im τ>2N²M(1−ε)/π².

(CDT-journal, p.676; Lemma 5.2.12.) *Needs:* Layer 8, uniform cusp asymptotics of the inverse ratio; Layer 6, the fundamental quadrilateral; the native Cayley coordinate; Mathlib `Complex.digamma_one_sub`.

### 8.3 Disc diameter of a transformed horoball

For D>0 and a projective real determinant-one matrix g=[a b;c d], C⁻¹(g{Im τ≥D}) is a disc tangent to the unit circle at (a−ic)/(a+ic), with Euclidean diameter E(g,D)=2/(1+D(a²+c²)). In particular E≤2/(D(a²+c²)).

As a subset of 𝔻 this is the intersection with the closed Euclidean disc of centre (1−E/2)(a−ic)/(a+ic) and radius E/2; its tangency point on the unit circle is excluded. Determinant one gives a²+c²>0, so the tangent-point and diameter denominators are nonzero.

(CDT-journal, p.677; Lemma 5.2.16.) *Needs:* Tau Ceti `TauCeti.Analysis.Complex.Fuchsian.Cusp.Horodisc` precise invariance; the native Cayley coordinate; [FuchsianOrbifolds — layer 0 the effective projective möbius action](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/FuchsianOrbifolds/README.md#layer-0-the-effective-projective-möbius-action); [FuchsianOrbifolds — layer 3 cusps and q coordinates](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/FuchsianOrbifolds/README.md#layer-3-cusps-and-q-coordinates).

### 8.4 Shimizu for the power-map group

For N≥2 and every determinant-one representative [a b;c d] of an element of the discrete group Φ̃_N, h_N(|a|+|c|)≥1, where h_N=2cot(π/(2N)). The generic supplier input is: in a discrete PSL₂(ℝ) group containing translation by h>0, every c≠0 satisfies |c|≥1/h.

(CDT-journal, proof of Lemma 5.2.18, p.678 (Shimizu applied to the full power stabilizer).) *Needs:* Layer 6, the largest invariance group of the power cover; Layer 6, the primitive cusp translation; [FuchsianOrbifolds — layer 3 cusps and q coordinates](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/FuchsianOrbifolds/README.md#layer-3-cusps-and-q-coordinates).

The geometric height form is `Subgroup.im_smul_mul_im_le_sq_of_upperRightHom_mem`; the two-width form is `Subgroup.im_smul_mul_im_le_abs_mul_of_upperRightHom_mem`. Use the native Shimizu theorem in `TauCeti.Analysis.Complex.Fuchsian.Shimizu`. For a lift with c≠0 it gives h_N|c|≥1. Handle c=0 from the full primitive cusp stabilizer, and use the rotation generator when the a entry is needed. The result is invariant under changing the sign of the lift.

### 8.5 The paper-specific exceptional cusp set

For N,M define S(M,N)={z∈𝔻:|F_N(z)^N−1|<e^(−MN)}. For sufficiently large N it is contained in the union of the Φ_N-translates of the cusp horoball with D comparable to N²M. Large values |F_N(z)|>e^M+1 lie in the rotated set sS(M,N), by the half-rotation involution.

Its API comprises:

* For z∈𝔻, membership means exactly |F_N(z)^N−1|<e^(−MN).
* Beyond the source large-N threshold, S is contained in the specified Φ-translated cusp horoballs.
* For M>0, large values |F_N(z)|>e^M+1 imply z∈sS(M,N) and z∉S(M,N).
* The source rotation s preserves |z|, so exclusion of S from |z|≤r also excludes sS.

**Checks.**

* For M>0, 0∉S(M,N), since |F_N(0)^N−1|=1>e^(−MN).
* For M>0 choose t∈(0,1) with t^N=1−exp(−MN)/2. It is not an omitted root; surjectivity supplies z∈𝔻 with F_N(z)=t, and z∈S(M,N). This positive membership witness rules out the empty-set definition.
* If |F_N(z)|^N>1+e^(MN), then |1−F_N(s⁻¹z)^N|<e^(−MN).

More precisely, for each M₀>0 and 0<ε<1 produce an effective N₀(ε,M₀)≥2 such that for N≥N₀ and M≥M₀,
S(M,N)⊆⋃ (g∈Φ̃_N) C⁻¹(g{τ∈ℍ : Im τ≥2N²M(1−ε)/π²}). This uses the actual half-plane region and its projective translates. For exclusion take M₀=2, ε=1/2 and D=N²M/π², as in the proof of Lemma 5.2.18; the union is not a generic set of unspecified small discs.

(CDT-journal, Lemma 5.2.18, p.678; CDT-journal line 2957.) *Needs:* Tau Ceti `TauCeti.Analysis.Complex.Fuchsian.Cusp.Horodisc` precise invariance; Layer 8, height near a small cusp value; Layer 8, disc diameter of a transformed horoball; Layer 8, shimizu for the power-map group; Layer 6, the half-rotation involution; [FuchsianOrbifolds — layer 3 cusps and q coordinates](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/FuchsianOrbifolds/README.md#layer-3-cusps-and-q-coordinates).

### 8.6 Excluding the cusp horoballs

There are effective absolute A,N₀ such that for all N≥N₀, 0<r<1 and M=N/(1−r), neither S(M,N) nor sS(M,N) meets the closed radius-r disc. All the translated horoballs have diameter ≤A(1−r)/N<1−r after increasing N₀.

(CDT-journal, Lemma 5.2.18, p.678; CDT-journal line 2957.) *Needs:* Layer 8, the paper-specific exceptional cusp set; Layer 8, disc diameter of a transformed horoball; Layer 8, shimizu for the power-map group.

The transported horoball has diameter at most 4h_N²/D after the matrix-entry estimate. With D of order N²M this is at most A/M. Substituting M=N/(1−r) gives A(1−r)/N, so the strict exclusion follows once N>A.

### 8.7 The large-N maximum growth bound

The headline theorem is `large_n_max_growth`. There exist explicit absolute C,N₀ such that for all integers N≥N₀ and 0<r<1, sup_(|z|=r)log|F_N(z)|≤CN/(1−r). This is the large-N statement of Lemma 5.2.18; the proof does not establish it for every N≥2.

(CDT-journal, Lemma 5.2.18, p.678; CDT-journal line 2957.) *Needs:* Layer 8, excluding the cusp horoballs.

### Examples

For the identity lift g and D=1, the inverse-Cayley horoball has centre 1/2 and diameter 1, tangent at 1. For general g, changing the SL₂ representative to −g leaves a²+c² and E unchanged. The estimate h_N(|a|+|c|)≥1 gives a²+c²≥1/(2h_N²), so E≤4h_N²/D. With D=N²M/π² and M=N/(1−r), the diameter is at most A(1−r)/N, which is strictly below 1−r once N>A. The half rotation sends large values into the rotated exceptional set while preserving radius. (CDT Lemmas 5.2.16 and 5.2.18, pp.677–678.)

### Dependencies

Layers 4–6 for uniform continued coefficients, radius, measured domains and the roots-specific groups; the native Shimizu inequality and full primitive stabilizer for its c=0 case. Extract an effective threshold from the inverse expansion, and use the full power stabilizer for all transported horoballs.

## Layer 9: logarithmic derivatives and uniform mean growth

Circle-kernel estimates control logarithmic derivatives. A pivot rational map compares the characteristic multiplied by N with the characteristic itself. Absorb their difference, then combine the large-level argument with effective estimates for each of the finitely many small levels.

### 9.1 The inverse-square kernel mean

For 0<r<R and |w|=R, the normalized circle mean ∫_(|z|=r)|z−w|^(−2)dμ(z)=1/(R²−r²). This is the exact kernel integral used in the logarithmic-derivative proof.

(CDT-journal, equation (6.1.12), p.680, used in the proof on p.681.) *Needs:* Mathlib `DiffContOnCl.circleAverage_re_herglotzRieszKernel_smul`.

### 9.2 Boundary L1 control of the logarithm

For R>0 and g holomorphic and zero-free near the closed radius-R disc with g(0)=1, ∫_(|w|=R)|log|g(w)||dμ(w)=2m(R,g). The mean of log|g| is zero, so its positive and negative parts have equal means.

(CDT-journal, proof of Lemma 6.1.7, p.681, following equation (6.1.12).) *Needs:* Layer 3, herglotz representation of a normalized logarithm; Mathlib `ValueDistribution.proximity`.

### 9.3 The logarithmic mean estimate

For nonnegative circle-integrable H and normalized Haar measure, ∫log⁺H≤log⁺(∫H)+1/e. Equivalently control the entropy of the region H≥1 before applying Jensen there; retain a harmless absolute constant if the measure-zero region occurs.

(CDT-journal, proof of Lemma 6.1.7, p.681 (entropy estimate).) *Needs:* Mathlib circle integration, Jensen inequality and real logarithms.

### 9.4 The zero-free logarithmic derivative estimate

The headline theorem is `normalized_log_derivative`. For g holomorphic and zero-free near the closed radius-R disc, g(0)=1 and 0<r<R, m(r,g′/g)≤log⁺((m(R,g)/r)·R/(R−r))+log 2+1/e. Use ≤ in the reusable signature; the source states the corresponding strict bound.

(CDT-journal, p.680; Lemma 6.1.7.) *Needs:* Layer 3, the derivative herglotz formula; Layer 9, the inverse-square kernel mean; Layer 9, boundary l1 control of the logarithm; Layer 9, the logarithmic mean estimate; Mathlib `ValueDistribution.proximity`.

### 9.5 Uniform transfer from small radii

For 0<r<1 put ρ=max(r,1/4) and R=(1+r)/2. Then ρ≥1/4, ρ<R and R−ρ≥(1−r)/4. If h is holomorphic on 𝔻, m(r,h)≤m(ρ,h), allowing the log-derivative bound at ρ to remove its 1/r factor uniformly.

(CDT-journal, p.683; proof of Corollary 6.2.9.) *Needs:* Layer 7, radial monotonicity of holomorphic proximity.

### 9.6 The logarithmic derivative of the omitted-value function

Let f=1−F_N^N, N≥2, and 0<r<1. Set R=(1+r)/2 and L_N(r)=log(max(1,sup_(|z|=R)log⁺|F_N(z)|)). Then m(r,f′/f)≤C(log(N/(1−r))+L_N(r)) for an absolute effective C. f is zero-free and f(0)=1.

(CDT-journal, p.683; Corollary 6.2.9.) *Needs:* Layer 9, the zero-free logarithmic derivative estimate; Layer 9, uniform transfer from small radii; Layer 1, the normalized roots-of-unity covering; Mathlib `ValueDistribution.proximity`.

### 9.7 The pivot rational function

For N≥2 set p_N(x)=x^N/(x^N−1) on ℂ∖μ_N. Its companion maps are q_N(x)=x^N and u_N(x)=1/(x^N−1), with p_N=1+u_N. The native rational expression can be totalized at roots, but all analytic statements retain the omitted-root guard.

Use `pivotMap N x` for the totalized rational expression. Its API comprises:

* On x^N≠1, the formula is x^N/(x^N−1) and p_N=1+u_N.
* For N≥2, its N poles are the distinct Nth roots of unity.
* The composition p_N∘F_N is holomorphic on 𝔻 because the cover omits every pole.

**Checks.**

* p_N(0)=0 for N≥2.
* p_2(2)=4/3.
* x=1 is a genuine pole of the analytic rational map; a totalized field value there is not its analytic extension.

(CDT-journal, p.682; (6.2.4).) *Needs:* Mathlib field division, complex powers and meromorphic order.

### 9.8 The pivot partial-fraction identity

For N≥2 and x^N≠1, p_N(x)=(x/N)Σ_(ζ∈μ_N)1/(x−ζ). The roots are distinct over ℂ and the sum is finite.

(CDT-journal, p.682; (6.2.4).) *Needs:* Layer 9, the pivot rational function.

### 9.9 The pivot chain identity

For f=1−F_N^N and |z|<1, p_N(F_N(z))=(F_N(z)/(NF_N′(z)))·(f′(z)/f(z)). The denominators f,F_N′ and N are nonzero; both sides are zero at z=0.

(CDT-journal, p.682; equation (6.2.7).) *Needs:* Layer 9, the pivot rational function; Layer 1, nonvanishing derivative of the cover; Layer 1, the normalized roots-of-unity covering.

### 9.10 The pivot characteristic lower bound

For N≥2 and 0<r<1, T_D(r,p_N∘F_N)≥N T_D(r,F_N)−log 4.

(CDT-journal, p.682; equation (6.2.3).) *Needs:* Layer 9, the pivot rational function; Layer 7, the local characteristic power law; Layer 7, the translated local first main theorem; Layer 7, translation bound for proximity.

### 9.11 Effective mean growth at fixed omitted sets

For each fixed N≥2 there is an explicit C_N such that T_D(r,F_N^N)≤C_N log(N/(1−r)) for all 0<r<1. This is the fixed-puncture Tsuji/Kraus–Roth input; prove it with an effective constant throughout the small-radius range as well as near the boundary.

(CDT-journal, §6 opening, pp.678–679, citing [Tsu52, Theorem 11]; §5 opening, p.667, for [KR16].) *Needs:* Layer 1, the normalized roots-of-unity covering; Layer 7, the disc-local characteristic.

Prove the bound with C_N from fixed-puncture geometry or the Tsuji/Kraus–Roth argument, retaining a bound on 0<r≤1/4. An asymptotic assertion as r→1 alone does not discharge this target. The proof must produce the number used by finite-level completion.

### 9.12 Equivalence of the three mean estimates

For N≥2 and each 0<r<1, the characteristics of F_N^N, F_N^N/(F_N^N−1), and 1/(F_N^N−1) differ by an absolute additive constant at most log 4. The translated first main theorem uses c(F_N^N,1)=−1, of modulus one.

(CDT-journal, §6.2.2 and equation (6.2.3), p.682; first main theorem (6.1.3), p.679.) *Needs:* Layer 9, the pivot characteristic lower bound; Layer 7, the translated local first main theorem; Layer 7, translation bound for proximity; Layer 1, the normalized roots-of-unity covering.

### 9.13 The logarithmic derivative at the omitted value one

For N≥2, g=1−F_N is holomorphic and zero-free on 𝔻 with g(0)=1. For 0<r<1, m(r,F_N′/(1−F_N))≤C(log(N/(1−r))+L_N(r)), using R=(1+r)/2 in L_N.

(CDT-journal, p.683; Corollary 6.2.11.) *Needs:* Layer 9, the zero-free logarithmic derivative estimate; Layer 9, uniform transfer from small radii; Layer 1, the normalized roots-of-unity covering; Mathlib `ValueDistribution.proximity`.

### 9.14 The pole divisor of the covering logarithmic derivative

For N≥2 and 0<r<1, N_D(r,F_N′/F_N)=N_D(r,1/F_N). All zeros of F_N are simple because F_N′ is nonzero; their poles in the logarithmic derivative have order one. The reciprocal F_N/F_N′ is holomorphic and has zero pole count.

(CDT-journal, p.683; (6.2.13).) *Needs:* Layer 1, nonvanishing derivative of the cover; Layer 7, the disc-local pole-counting function; Mathlib `MeromorphicOn.divisor`.

### 9.15 The covering derivative reciprocal bound

For N≥2 and 0<r<1, m(r,F_N/F_N′)≤T_D(r,F_N)+C(log(N/(1−r))+L_N(r)), where the outer radius in L_N is (1+r)/2. The ratio is holomorphic since F_N′ never vanishes.

(CDT-journal, p.683; Corollary 6.2.11.) *Needs:* Layer 9, the logarithmic derivative at the omitted value one; Layer 9, the pole divisor of the covering logarithmic derivative; Layer 1, nonvanishing derivative of the cover; Layer 7, the local first main inversion identity; Layer 5, the odd-zeta radius series; Mathlib `ValueDistribution.proximity`.

### 9.16 The pivot characteristic upper bound

For N≥2 and 0<r<1, T_D(r,p_N∘F_N)≤T_D(r,F_N)+C(log(N/(1−r))+L_N(r)). All three composed factors are holomorphic, so their characteristics are proximity means.

(CDT-journal, p.684; equation (6.2.15).) *Needs:* Layer 9, the pivot chain identity; Layer 9, the logarithmic derivative of the omitted-value function; Layer 9, the covering derivative reciprocal bound; Layer 7, the disc-local characteristic; Mathlib `ValueDistribution.proximity`.

### 9.17 The large-N mean-growth estimate

For N≥N₀ of the maximum-growth theorem and 0<r<1, T_D(r,F_N^N)≤C log(N/(1−r)), with an effective absolute C. The large-N maximum bound on the outer circle gives L_N(r)≤C′log(N/(1−r)).

(CDT-journal, p.684; equations (6.2.16) and the following N/(N−1) absorption.) *Needs:* Layer 9, the pivot characteristic lower bound; Layer 9, the pivot characteristic upper bound; Layer 8, the large-n maximum growth bound; Layer 7, the local characteristic power law.

### 9.18 Completing the finitely many small levels

Given the large-N effective constants C,N₀ and effective fixed-level constants C_N for 2≤N<N₀, the maximum of C and that finite list is an effective absolute constant proving T_D(r,F_N^N)≤C*log(N/(1−r)) for every N≥2 and 0<r<1.

(CDT-journal, Theorem 6.0.1, p.679; CDT-journal line 3017.) *Needs:* Layer 9, the large-n mean-growth estimate; Layer 9, effective mean growth at fixed omitted sets.

### 9.19 Uniform mean growth of the covering powers

The headline theorem is `uniform_mean_growth`. There is an explicit absolute C such that for every integer N≥2, 0<r<1 and p∈{x↦x^N,x↦x^N/(x^N−1),x↦1/(x^N−1)}, the normalized circle mean ∫_(|z|=r)log⁺|p(F_N(z))|dμ_Haar(z)≤C log(N/(1−r)). The cover is normalized at zero; the bound is independent of its source rotation.

(CDT-journal, Theorem 6.0.1, p.679; CDT-journal line 3017.) *Needs:* Layer 9, completing the finitely many small levels; Layer 9, equivalence of the three mean estimates; Layer 1, pointed analytic cover uniqueness; Mathlib `ValueDistribution.proximity`.

### Examples

For N=2, p₂(2)=4/3 and (2/2)(1/(2−1)+1/(2+1))=4/3, fixing the 1/N coefficient. Near zero F_N(z)=az+O(z^(N+1)) gives f′/f=−Na^N z^(N−1)+O(z^(2N−1)); multiplying by F_N/(NF_N′) gives −a^N z^N+O(z^(2N)), the same leading term as p_N(F_N). At r=3/4 the outer radius is R=7/8, larger than r; the value (1−r)/2=1/8 would fail the logarithmic-derivative hypothesis. Finally N/(N−1)≤2 for every N≥2, making the characteristic absorption uniform. (CDT (6.2.4) and (6.2.7), p.682; Corollaries 6.2.9 and 6.2.11, pp.683–684; (6.2.16), p.684.)

### Dependencies

Layer 1 covering étaleness and omitted values, Layer 3 differentiated Herglotz, Layer 5 positivity/expansion, Layer 7 local first main theorem and radial monotonicity, and Layer 8 large-N maximum growth. The finite set of smaller N requires explicit fixed-level constants valid for every 0<r<1; the asymptotic fixed-puncture assertion alone does not supply an effective maximum.

## Downstream consumers

The conformal-radius formula supplies explicit analytic sizes for arithmetic holonomy and algebraicity criteria. The uniform mean-growth bound supplies the quantitative circle-integral input for such criteria without imposing a global meromorphic extension. The ODE, Schwarzian, finite Blaschke, normalized logarithmic integral and disc-local Nevanlinna interfaces can be reused for other finitely punctured plane domains; the roots-cover polygon presentations and uniform constants are specific to μ_N.

## References

**CDT-journal (CDT)**: Frank Calegari, Vesselin Dimitrov and Yunqing Tang, [*The unbounded denominators conjecture*](https://www.math.uchicago.edu/~fcale/papers/UDC.pdf), *Journal of the American Mathematical Society* **38** (2025), 627–702, [DOI 10.1090/jams/1053](https://doi.org/10.1090/jams/1053). Page numbers refer to the printed journal pagination. Section 1.1.6 and the proof of Corollary 2.0.5 motivate the ODE interfaces; Lemma 2.3.1 supplies the quotient representation; §§5–6 supply the quantitative covering theory. Where CDT invokes Hempel's accessory parameters, special-function connection formulas or fixed-puncture growth theory, the target includes the proof of that input, with its hypotheses stated here. The source invocation supplies the mathematical locator, while the targets specify the required proofs.

**Hem88**: Joachim A. Hempel, *On the uniformization of the n-punctured sphere*, Bull. London Math. Soc. 20 (1988), 97–115, DOI 10.1112/blms/20.2.97, Theorem 3.1 and Lemma 3.3 (uncertified primary locators). **Tsu52**: Masatsugu Tsuji, *Theory of Fuchsian groups*, Jpn. J. Math. 21 (1951/1952), 1–27, DOI 10.4099/jjm1924.21.0_1, Theorem 11. **KR16**: Daniela Kraus and Oliver Roth, *Sharp lower bounds for the hyperbolic metric of the complement of a closed subset of the unit circle and theorems of Schwarz-Pick-, Schottky- and Landau-type for analytic functions*, Constr. Approx. 43 (2016), 47–69, DOI 10.1007/s00365-015-9313-3 (uncertified locator: §1). These provide background for the stated accessory and fixed-puncture growth targets; the effective fixed-level assertion in Layer 9 includes its own proof and small-radius estimates.

**TeschlODE**: Gerald Teschl, [*Ordinary Differential Equations and Dynamical Systems*](https://www.mat.univie.ac.at/~gerald/ftp/book-ode/ode.pdf), author's preliminary version, §1.2, equation (1.18), p.7, and §4.3, Theorem 4.7 and its proof, p.130.

**McMullenRS**: Curtis T. McMullen, [*Riemann Surfaces*](https://abel.math.harvard.edu/~ctm/math213b/%68ome/course/course.pdf), Harvard Math 213b course notes, April 28, 2026, Theorem 2.9, p.9, and Theorem 17.1, p.157. The former gives the triply punctured sphere model; the latter states the abstract classification developed in §1.1. Section 16, p.147, fixes the hyperbolic metric normalization used in §1.7.

**Uniformization**: Cipriana Anghel and Rareș Stan, [*Uniformization of Riemann surfaces revisited*](https://arxiv.org/abs/2008.12189), arXiv:2008.12189v2 (2021), Theorem 1, p.2; Theorem 6, p.4; Proposition 9, pp.5–6; Theorem 10, pp.6–8; Theorem 12, pp.8–10; Lemma 13 and §7, pp.10–11; Appendices A–D, pp.11–14.

**DLMF**: NIST, [*Digital Library of Mathematical Functions*](https://dlmf.nist.gov/), equations 15.8.10 and 15.2.2 for the ordinary zero-balanced continuation after restoring normalization, and 5.7.3 and 5.7.6 for log-Gamma and digamma series; equation 15.10.1 specifies Gauss’s equation. These supply accessible formula locators; the convergence, parameter differentiation and effective estimates specified above remain proof targets.
