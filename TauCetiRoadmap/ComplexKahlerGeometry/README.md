# Roadmap: complex manifolds, Dolbeault theory and Kähler geometry

**Summary.** This roadmap develops the local analytic and differential geometry of complex
manifolds on Mathlib's complex `IsManifold` carrier and the pinned Tau Ceti almost-complex and
Dolbeault calculus: the Newlander–Nirenberg theorem, the Dolbeault–Grothendieck lemma with its
parameter-dependent solver, the convergent local algebra of holomorphic germs (Weierstrass
preparation, Rückert's Nullstellensatz, Oka and Cartan coherence, the singular locus, Hartogs
extension), holomorphic and Hermitian bundles with Chern connections, Koszul–Malgrange and the
flat-bundle/local-system equivalences, the real and complex-coefficient elliptic analysis of
compact manifolds (bundle distributions, the all-real-order Sobolev scale, Laplace-type
regularity, the Hodge theorem), Serre duality, the Kähler identities with Hodge decomposition,
Hard Lefschetz and the Hodge–Riemann relations, the projective, torus, Riemann-surface and Hopf
computations, and the Frölicher spectral sequence with the Iwasawa manifold. Its end theorems,
stated in `Suggested.lean` where the pins allow, are `newlander_nirenberg`,
`dolbeault_grothendieck_polydisc`, `hartogs_extension`, `weierstrass_preparation`,
`isRegularLocalRing_holomorphicStalk`, `finiteDimensional_dolbeaultCohomology`,
`finrank_dolbeaultCohomology_serre`, `finrank_complexDeRhamCohomology_eq_sum_dolbeault`,
`finrank_dolbeaultCohomology_symm` and `hard_lefschetz`; the definitions `polydisc`,
`dolbeaultCocycles`, `dolbeaultCoboundaries`, `DolbeaultCohomology`, `mextDerivℂ`,
`deRhamCocycles`, `deRhamCoboundaries`, `ComplexDeRhamCohomology`, `IsKahlerForm` and
`lefschetzPow` of the same file make them statable. Every construction is a reusable theory
with restriction, gluing, functoriality and transport laws, not only a statement of Hodge
decomposition or of the Kähler identities.

## Scope and ownership

This roadmap owns, by layer:

- **Layer 1 (K1):** the tangent-index and chart-sign comparisons of the complex orientation on
  DifferentialGeometry's orientation carrier, the one-variable coordinate test for
  holomorphicity, the holomorphic inverse and implicit function theorems on manifolds,
  holomorphic submanifolds in every codimension, the complex-bilinear extension of the pinned
  Nijenhuis tensor and the Newlander–Nirenberg theorem.
- **Layer 2 (K2):** the whole-polydisc Dolbeault–Grothendieck lemma, the parameter-dependent
  one-variable solver, multivariable Taylor and Laurent approximation on product domains,
  Dolbeault cohomology with its wedge and functoriality, the sheaves of holomorphic forms, the
  Čech/derived comparison on paracompact manifolds and the Dolbeault theorem.
- **Layer 3 (K3):** the realified analytic atlas, holomorphic germs and Weierstrass
  preparation, the one-variable meromorphic germ field, the Noetherian and factorial
  properties, local parametrization, Rückert's Nullstellensatz, Oka and Cartan coherence in
  their primitive local form, reduced analytic subsets with their regular and singular loci, and
  the Riemann and Hartogs extension theorems.
- **Layer 4 (K4):** the sheaf of holomorphic sections of a native bundle, the section/
  reconstruction equivalence, Chern connections, Koszul–Malgrange, holomorphic connections and
  the flat-bundle/local-system equivalences, including the componentwise assembly for locally
  constant finite rank.
- **Layer 5 (K5):** on real manifolds, densities, bundle tests and distributions, the
  differential-operator core needed for the analysis here, the Fréchet section topology and its
  Montel property, the compact-bundle Sobolev scale, Laplace-type elliptic regularity, the
  spectral theory of nonnegative Laplace-type systems and the real Hodge theorem; on complex
  manifolds, the local Hermitian identities, Dolbeault Hodge theory and Serre duality.
- **Layer 6 (K6):** the Kähler identities, Bochner–Kodaira–Nakano, Hodge decomposition, Hard
  Lefschetz, the Hodge–Riemann relations and polarizations, and integration over the regular
  locus of a compact analytic subvariety as a de Rham functional with its ambient real homology
  class.
- **Layer 7 (K7):** the projective family on `Projectivization ℂ (Fin (n+1) → ℂ)` with its
  affine charts, line bundles, Fubini–Study form and Hodge numbers, complex tori and Riemann
  surfaces with their genus dictionary, and the primary Hopf surface.
- **Layer 8 (K8):** the Frölicher spectral sequence, nilmanifold cohomology comparisons and the
  Iwasawa manifold.

It leaves to named roadmaps:

- ComplexManifolds owns scalar restriction and atlas transport (Milestone 1), the canonical
  complex orientation (Milestone 2), the Riemann sphere atlas on `OnePoint ℂ` (Milestone 3),
  discrete holomorphic quotients and open gluing (Milestones 4–6) and the holomorphic-transition
  mixin on native vector bundles with cocycle gluing and bundle operations (Milestone 7).
  ComplexTori owns complex-torus quotients and descent (Milestone 1).
- DifferentialGeometry owns smooth forms, the exterior derivative, pullback, wedge, orientations,
  integration, Stokes, densities, the real de Rham complex and the de Rham theorem. The pinned
  Tau Ceti owns the complex scalar action on forms, the type decomposition, `∂` and `∂̄`, the
  Nijenhuis tensor, the real Hodge star and the codifferential (see the Tau Ceti contract);
  none of them is constructed again here.
- AlgebraicTopology owns singular cohomology and products, the CW structure of complex
  projective space (Stage 4.6), the generic filtered-complex spectral sequence (Stage 5.0) and
  the fundamental class of a compact oriented manifold (Stage 6.3).
- GlobalHolomorphicFunctions owns Runge approximation, the global scalar `∂̄` solver on arbitrary
  plane domains, the exactness of smooth two-forms there, and the global theory of isolated
  singularities and Mittag–Leffler. Nothing of it is consumed here: this roadmap's solver (2.2)
  is stated on discs, punctured discs and their products, where Taylor and Laurent truncation
  replace Runge approximation; its Cauchy–Green operator is the classical compact-support one
  (2.1); its meromorphic germ field (3.3) is built on Mathlib's `MeromorphicAt`; and its plane
  de Rham computations (5.6) use Mayer–Vietoris on slit covers. A parameter-dependent solver on
  arbitrary plane domains is not planned here.
- RealAnalyticGeometry consumes K1–K5b and K6.0 for its semianalytic, Stein and coherent-sheaf
  theory, and owns the native coherent `SheafOfModules` predicate and the compatible analytic
  triangulation. The integral fundamental class of a singular compact analytic cycle, which
  needs that triangulation, is the subject of ComplexKahlerGeometry, Part II, which starts where
  this roadmap stops: at the real de Rham functional of integration over the regular locus and
  its ambient real homology class (6.2).
- PseudodifferentialOperators consumes K5a: its differential-operator core (5.2), density and
  distribution carriers, Fréchet section topology, Sobolev scale and Laplace-type theory.
  PseudodifferentialOperators owns jet bundles, the iterated-commutator characterization of the
  order, the connection expansion of symbols, Peetre's theorem and the pseudodifferential
  calculus; nothing of PseudodifferentialOperators is consumed here.
- PDE owns the scalar real-domain Sobolev, Hölder, Schauder, embedding, Rellich and elliptic
  estimates on domains; SmoothBundlesConnections owns principal and associated bundles,
  complexification, fibre metrics, the Hilbert space of square-integrable sections, connections,
  curvature, parallel transport and circle-bundle classes; VariationalMethods and
  OperatorTheory/UnboundedOperators own the abstract closed-form and compact-pair spectral
  theory; LieGroupoidsPoisson owns the Chevalley–Eilenberg complex of a Lie algebroid;
  PlanarTopology and SurfaceTopology own the topological surface conventions and the
  classification of compact surfaces; HodgeStructures owns the linear Hodge-structure objects.
- Kept variants: the Laplace-type class of 5.2 is the chart-local class of second-order
  systems with scalar principal symbol, not PseudodifferentialOperators' jet-defined general
  operator; the Hartogs theorem of 3.5 is stated both on `ℂⁿ` and across analytic subsets of
  codimension two of a manifold.

## Conventions

Manifolds are finite-dimensional, Hausdorff and second-countable, without boundary; compactness
and connectedness are stated where used. Complex manifolds use Mathlib's complex `IsManifold`
on a finite-dimensional complex model space `E`; holomorphic means `MDifferentiable ℂ` in
charts, and 3.1 proves its equivalence to complex analytic and complex `ContMDiff ∞` maps. The
same charts make `M` a real smooth manifold modelled on `𝓘(ℝ, E)` (the pinned scoped instance
`TauCeti.ComplexManifold.isManifold_real`), and every form, orientation and metric on a complex
manifold is a form, orientation or metric of that real structure.

The complex structure `J` of a complex manifold is the pinned
`TauCeti.SmoothAlmostComplexStructure.ofComplexManifold E M`, multiplication by `i` on every
tangent space `E`; it satisfies `J² = −1` and `N_J = 0`. Complex-valued forms are the pinned
`TauCeti.SmoothForm 𝓘(ℝ, E) M ℂ k` with its complex scalar action; `T^(1,0)` and `T^(0,1)` are
the `+i` and `−i` eigensubbundles of `J` in `TM ⊗ ℂ`, a form has type `(p,q)` in the pinned
sense `TauCeti.SmoothForm.IsOfType`, and `∂`, `∂̄` are the pinned `del` and `delBar`, so that
`d = ∂ + ∂̄` on an integrable structure. Write `d^c = i(∂̄ − ∂)`, so `dd^c = 2i∂∂̄`.
Hermitian inner products are conjugate-linear in the first argument and linear in the second.

The degree-two carrier is DifferentialGeometry 0.4's `SmoothForm I M ℝ 2`, with closedness
`mextDerivₗ ω = 0`. A real two-form `ω` on a complex manifold is a Kähler form, `IsKahlerForm`,
when it is closed, `J`-invariant in both arguments and `ω(v, Jv) > 0` for `v ≠ 0`; the
associated metric is `g(u,v) = ω(u, Jv)`. This agrees with Tau Ceti's `SmoothTwoForm.Compatible`
convention through DifferentialGeometry 0.4's `legacySmoothTwoFormEquiv`, a comparison proved in
6.1. On `(TM, J)` set `h_T(u,v) = g(u,v) + iω(u,v)` (conjugate-linear first slot). Transport
through `u ↦ u^(1,0) = (u − iJu)/2`: if `g_ℂ` is the complex-bilinear extension of `g`, then
`h_T(u^(1,0), v^(1,0)) = 2 g_ℂ(bar(u^(1,0)), v^(1,0))`. In holomorphic coordinates,
`ω = (i/2) Σ h_T(∂_(z_k), ∂_(z_j)) dz^j ∧ dbar(z^k)`; the standard metric has
`h_T(∂_(z_j), ∂_(z_k)) = δ_jk` and `ω = Σ dx^j ∧ dy^j`. A coframe's `h_T`-dual norm is its
complexified-real Gram norm divided by `√2`.

For a source's tensor notation `h_src,tensor = 2 Σ dz^j ⊗ dbar(z^j)` alongside
`ω = (i/2) Σ dz^j ∧ dbar(z^j)`, pin the slots before comparing metrics:
`h_src,tensor(u,v) = 2 h_T(v,u)`. This tensor is linear in its first argument and
conjugate-linear in its second; convert it to the native Hermitian convention by
`h_src,native(u,v) = h_src,tensor(v,u) = 2 h_T(u,v)`. The associated fundamental form of this
converted metric is `2ω`; the unconverted tensor is not a conjugate-linear-first Hermitian
metric.

For a column of section coefficients in a holomorphic frame with metric matrix
`h = (h(e_i, e_j))`, the Chern connection is `d + A` with `A = h⁻¹ ∂h`. Frame change
`e′ = e g` gives `h′ = g* h g` and `A′ = g⁻¹ A g + g⁻¹ dg`. Its curvature is `dA + A ∧ A`. The
normalized Fubini–Study form is `ω_FS = (i/(2π)) ∂∂̄ log(1 + Σ|z_j|²)`; its integral over a
projective line is `1`. The `O(1)` Chern curvature is `−2πi ω_FS`. These conventions match the
dual-character line in SmoothBundlesConnections and GeometricQuantization.

Hodge Laplacians are the nonnegative operators `Δ_d = dd* + d*d` and `Δ_∂̄ = ∂̄∂̄* + ∂̄*∂̄`. On
functions the real one is the negative of DifferentialGeometry 12.3's `laplaceBeltrami`, the
divergence of the gradient; never use one sign for both without the comparison theorem. Fourier
conventions: `ξ` is the angular frequency, `σ_F(∂_j) = iξ_j`; Mathlib's Fourier variable is
`ζ = ξ/(2π)` and its Bessel weight is `⟨ζ⟩^s`.

## Exact supplier contracts

### From Mathlib

- Complex manifolds: `IsManifold 𝓘(ℂ, E) ∞ M`, `IsManifold.maximalAtlas`, `mfderiv`,
  `MDifferentiable.exists_eq_const_of_compactSpace` and `MDifferentiable.isLocallyConstant`
  (`Mathlib/Geometry/Manifold/Complex.lean`), `TopologicalSpace.Opens` manifold instances,
  `ContDiffAt.to_localInverse` and `ContDiffAt.implicitFunction` over `ℂ`,
  `differentiableAt_complex_iff_differentiableAt_real`, `real_linearMap_map_smul_complex` and
  `ContinuousLinearMap.complexOfReal` (`Mathlib/Analysis/Complex/Conformal.lean`).
- Sheaves and local algebra: `smoothSheafCommRing` with `smoothSheafCommRing.isUnit_stalk_iff`
  and `smoothSheafCommRing.instLocalRing_stalk` (`Mathlib/Geometry/Manifold/Sheaf/`),
  `SheafOfModules`, `Opens.overPullbackSheafEquivOver`, `sheafRestrict`,
  `IsRegularLocalRing`, `ringKrullDim`, `UniqueFactorizationMonoid`,
  `PowerSeries.IsWeierstrassFactorization`, `MvPolynomial.mul_esymm_eq_sum`,
  `AnalyticOnNhd.eqOn_of_preconnected_of_eventuallyEq`, `MeromorphicAt` and
  `meromorphicOrderAt_eq_int_iff`, `Filter.Germ`.
- Analysis: `TestFunction Ω F ⊤` with its LF topology and
  `TestFunction.continuous_iff_continuous_comp`, `Distribution Ω F n`, `TemperedDistribution`,
  `TemperedDistribution.MemSobolev`, `BesselPotentialSpace`, `TemperedDistribution.besselPotential`,
  `fourierMultiplierCLM`, `SchwartzMap.fourier_convolution`,
  `TemperedDistribution.memSobolev_zero_iff`, `Lp.toTemperedDistribution`, `MontelSpace` and
  `ContinuousLinearEquiv.toCompactConvergenceCLM`, `verticalClosedStrip`, `DiffContOnCl` and
  `Complex.HadamardThreeLines.norm_le_interp_of_mem_verticalClosedStrip'`, `circleMap`,
  `circleIntegral`, `Complex.slitPlane` and `Complex.starConvex_one_slitPlane`,
  `ContMDiffSection`, `ContMDiffVectorBundle`, `CovariantDerivative.leviCivitaConnection`.
- Topology and algebra: the quotient topology on `Projectivization ℂ V`
  (`Mathlib/Topology/Algebra/Projectivization.lean`), `OnePoint.equivProjectivization`,
  `CWComplex`, `FundamentalGroupoid`, `SpectralObject`, `LinearMap.det_restrictScalars`,
  `Algebra.norm_complex_eq`, `Orientation.volumeForm`.

### From Tau Ceti

All at the pinned revision; nothing listed here is constructed again.

- `TauCeti.SmoothForm I M F k` (`Geometry/Manifold/DifferentialForm/Smooth.lean`) with its
  scalar action `TauCeti.SmoothForm.instModule` by any scalars acting continuously on `F` and
  commuting with `ℝ` (`DifferentialForm/MapCoeff.lean`), `mapCoeff`, `mextDerivₗ`
  (`DifferentialForm/Regularity.lean`) and `mextDerivₗ_smul`, `mextDerivₗ_mapCoeff`
  (`MapCoeff.lean`), `SmoothForm.wedgeWith` and `wedge` (`DifferentialForm/Wedge/Smooth/Basic.lean`)
  with `mextDerivₗ_wedgeWith` (`Wedge/Leibniz.lean`), `homotopyOperator`
  (`DifferentialForm/HomotopyOperator.lean`).
- `TauCeti.SmoothAlmostComplexStructure` (`Geometry/Symplectic/Manifold/AlmostComplex/Basic.lean`),
  its Nijenhuis tensor `nijenhuis : TangentSpace I x →L[ℝ] TangentSpace I x →L[ℝ] TangentSpace I x`
  with `nijenhuis_apply` (the expression `[JX,JY] − [X,Y] − J[JX,Y] − J[X,JY]` on fields
  differentiable at `x`), `nijenhuis_eq_zero_iff`, `nijenhuis_antisymm` and `nijenhuis_self`
  (`Geometry/Symplectic/Manifold/Nijenhuis.lean`), under `[IsManifold I ∞ M]` and
  `[FiniteDimensional ℝ E]`; the eigenbundle involutivity criteria
  `isInvolutiveComplexDistribution_eigenspace_I_iff` and `…_neg_I_iff`
  (`AlmostComplex/Eigenbundle.lean`); `IsPseudoholomorphicWithinAt`, `IsPseudoholomorphicOn`
  and `IsPseudoholomorphic` (`Geometry/Symplectic/Manifold/JHolomorphic.lean`);
  `TauCeti.SmoothTwoForm` with `Tames` and `Compatible` (`Geometry/Symplectic/Manifold/TwoForm.lean`).
- `TauCeti.SmoothForm.IsOfType φ J p q` and `typeProjection p q : Module.End ℂ (SmoothForm I M F k)`
  with `sum_typeProjection`, `isOfType_typeProjection`, `typeProjection_typeProjection`,
  `IsOfType.mapCoeff` and `IsOfType.mpullback` (`DifferentialForm/AlmostComplexType.lean`).
- `del`, `delBar : SmoothForm I M F k →ₗ[ℂ] SmoothForm I M F (k+1)`, `IsOfType.del`,
  `IsOfType.delBar`, `IsOfType.mextDerivₗ_eq_add_del_add_delBar_add` (the four bidegrees of
  `d`), `del_apply_apply`, `delBar_apply_apply` (`∂̄f(v) = (df(v) + i df(Jv))/2`),
  `delBar_apply_eq_zero_iff`, `delBar_delBar_apply` (`∂̄∂̄f(v,w) = −(1/4) ∂f(N_J(v,w))`),
  `del_del_apply`, `del_delBar_add_delBar_del`, `mextDerivₗ_eq_del_add_delBar_of_nijenhuis_eq_zero`,
  `mpullback_del`, `mpullback_delBar` (naturality under pseudoholomorphic maps),
  `mapCoeff_del_of_map_smul_conj` and `mapCoeff_delBar_of_map_smul_conj` (conjugation exchanges
  `∂` and `∂̄`) (`DifferentialForm/Dolbeault/Basic.lean`); on complex manifolds
  `mextDerivₗ_eq_del_add_delBar_ofComplexManifold`, `del_del_ofComplexManifold`,
  `delBar_delBar_ofComplexManifold`, `del_delBar_add_delBar_del_ofComplexManifold`
  (`Dolbeault/ComplexManifold.lean`); the graded Leibniz rules `del_wedgeWith` and
  `delBar_wedgeWith` (`Dolbeault/Leibniz.lean`); `delBar_eq_zero_iff_isPseudoholomorphic` and
  `kerDelBarZeroEquiv` (`Dolbeault/Holomorphic.lean`).
- `TauCeti.SmoothAlmostComplexStructure.ofComplexManifold E M`, `ofComplexManifold_apply`,
  `isPseudoholomorphicOn_ofComplexManifold_iff` and `nijenhuis_ofComplexManifold`
  (`Geometry/Manifold/Complex/AlmostComplexStructure.lean`); the scoped instance
  `TauCeti.ComplexManifold.isManifold_real` (`Geometry/Manifold/Complex/Orientation.lean`).
- `TauCeti.SmoothForm.hodgeStar (o : Manifold.Orientation I M (Fin m)) (hkl : k + l = m)`,
  `hodgeStar_hodgeStar` (`⋆⋆ = (−1)^(k·l)`), `inner_smul_riemannianVolumeForm_eq_wedge_hodgeStar`
  (`⟨α,β⟩ vol = α ∧ ⋆β`), `hodgeStar_neg_orientation` (`Geometry/Manifold/Riemannian/HodgeStar.lean`);
  `codifferential` (`(−1)^(m(k+2)+1) ⋆d⋆` on `(k+1)`-forms), `hodgeStar_codifferential` and
  `integralTopForm_inner_mextDeriv_eq_inner_codifferential` (`Riemannian/Codifferential.lean`);
  `laplaceBeltrami` (`Riemannian/Laplacian.lean`); `TauCeti.riemannianVolume` and
  `isLocallyFiniteMeasure_riemannianVolume` (`Riemannian/VolumeDensity/Volume.lean`);
  `riemannianVolumeForm`, `IsContMDiffRiemannianBundle`.
- `TauCeti.analyticOnNhd_iff_differentiableOn_of_finiteDimensional`,
  `DifferentiableOn.analyticOnNhd_of_finiteDimensional` and the polydisc Cauchy formula
  (`Analysis/Complex/CauchyIntegralPolydisc.lean`), `TauCeti.analyticAt_circleIntegral` and
  `TauCeti.analyticOnNhd_circleIntegral`, `ImplicitFunctionData.contDiffAt_implicitFunction`
  and `ImplicitFunctionData.analyticAt_implicitFunction` (`Analysis/Analytic/Inverse.lean`).

### From TauCetiRoadmap.ComplexManifolds

Milestones 1 and 2: real restriction, atlas transport, the canonical complex orientation in
DifferentialGeometry 2.1's carrier, its atlas independence, product law and preservation by
biholomorphisms, and the real determinant positivity through `LinearMap.det_restrictScalars`
and `Algebra.norm_complex_eq`. Milestone 3: the `OnePoint ℂ` atlas. Milestone 4: free properly
discontinuous holomorphic quotients with their projection and descent laws. Milestones 5–6: open
gluing and its topology. Milestone 7: the holomorphic-transition mixin on native
`VectorBundle ℂ F E`, cocycle gluing, tensor, dual and exterior operations, the canonical bundle
and the codimension-one normal bundle (items 7.4–7.5).

### From TauCetiRoadmap.ComplexTori

Milestone 1: the fixed complex torus `ℂⁿ/Λ` as a complex manifold with its quotient and descent.

### From TauCetiRoadmap.DifferentialGeometry

0.1 the wedge and its permutation formula; 0.3 rough forms, pullback and the coefficient-map
compatibility of the paired wedge; 0.4 bundled forms with `legacySmoothTwoFormEquiv` and
`legacySmoothTwoFormEquiv_isClosed_iff`; 1.1–1.3 the exterior derivative, its naturality and
`d² = 0`; 2.1 `Manifold.Orientation` with fibres `Orientation ℝ (TangentSpace I x) ι` and 2.2
`IsOrientationPreservingAt`, pullback along open inclusions and product orientations; 5.2
`integralTopForm` with `integralTopForm_pos`; 5.3 Stokes and agreement with `curveIntegral`; 5.4
`homotopyOperator`; 5.5 `Density`, `RoughDensity`, `toDensity`, `integralDensity` and
`integralTopForm_eq_integralDensity`; 6.1–6.2 the real de Rham complex, its cohomology and the
star-convex Poincaré lemma; Layer 7 Mayer–Vietoris; 8.3–8.5 smooth chains, the de Rham map and
the de Rham theorem; 9.3 Poincaré duality; 12.1 metrics; 12.3 `laplaceBeltrami`; 12.4
`riemannianVolumeForm`, `riemannianDensity`, full support and
`integral_riemannianVolume_eq_integralDensity`. Its chain integration and Stokes already allow
complete vector-valued coefficients; its de Rham comparison is stated over `ℝ`.

### From TauCetiRoadmap.SmoothBundlesConnections

B2.1 associated bundles and complexification `ℂ ⊗_ℝ V` with inclusion and conjugation; B2.2 fibre
metrics `h.inner x : V_x →L⋆[𝕜] V_x →L[𝕜] 𝕜` and the Hilbert space of square-integrable sections
over `[RCLike 𝕜]` for finite-rank bundles with an `IsOpenPosMeasure`; B2.3 operations on
square-integrable sections; B2.4 measures from smooth densities; B3 connections and induced
connections; B4 curvature and gauge transformations; B5.0 and B5.2 parallel transport and
holonomy; B6.0–B6.1 good covers and the Čech comparison for scalar sheaves; B6.2 the circle
class `c₁(P)`; B6.3 rank-one Chern–Weil.

### From TauCetiRoadmap.AlgebraicTopology

Stage 4.6: the quotient topology on `Projectivization ℂ (Fin (n+1) → ℂ)` and its finite CW
structure with one cell in each even dimension `0, 2, …, 2n` and characteristic maps
`z ↦ [z : √(1−|z|²)]`; Stage 4's CW theory, cellular/singular comparison and
`cwSubcomplexNeighborhoods`; Stage 4.7 `simplicialRealizationCW`; Stage 5.0 the generic
filtered-complex spectral sequence; Stage 6 cohomology, cup products, Poincaré duality and
universal coefficients; Stage 6.3 the fundamental class of a compact oriented manifold; Stage 7
the Euler characteristic.

### From TauCetiRoadmap.RealAlgebraicGeometry (Completed)

Layer 7: analytic inversion and the local complexification of real-analytic germs in model
spaces.

### From TauCetiRoadmap.PDE

§1.3 (A3): the Euclidean comparison `H^(k,2) = W^(k,2)` with equivalent norms for every
nonnegative integer `k`; §1.7 (A7): Hölder spaces; §2.2 (B9): the `L^p` Riesz–Thorin theorem;
§5.3 (E22) and §5.6 (E25): Schauder estimates, consumed by 1.4's Newlander–Nirenberg route. PDE
supplies scalar real-domain estimates, not system estimates.

### From TauCetiRoadmap.VariationalMethods and TauCetiRoadmap.OperatorTheory/UnboundedOperators

VariationalMethods §2.2–2.4: the `RCLike` coercive solution operator with its `toRealBilin`
comparison to Mathlib's `IsCoercive.continuousLinearEquivOfBilin`, energy spaces, forcing maps
and semibounded shifts; §3.1: compact form pairs and their finite orthogonal sums; Layers 3–4:
the compact-embedding form/solution-operator spectral theorem; §5.1–5.2: the represented
operator `CompactFormPair.operator`, its graph and domain characterization, compact resolvent
and eigen-expansion. UnboundedOperators §4.7 (UO-D06): `closedFormOperator`, closed-form
representation, real-shift self-adjointness, both adjoint inclusions and witness independence;
`CompactFormPair.operator` is its specialization on the same form/inclusion data. The abstract
order is VariationalMethods §2.3, then UnboundedOperators §4.7, then VariationalMethods §5.1,
with §3–4 also preceding §5.1; §5.3's geometric comparison follows 5.6 and is not an input.

### From TauCetiRoadmap.LieGroupoidsPoisson

§G1.3a: the all-degree real Chevalley–Eilenberg differential of a finite-rank Lie algebroid and
its Cartan identities, consumed by 8.2.

### From TauCetiRoadmap.PlanarTopology and TauCetiRoadmap.SurfaceTopology

PlanarTopology's surface convention (the half-space-charted carrier) and Layer 6's
`Surface.Orientation`; SurfaceTopology Layers 2–3 (presentations and realization), Layer 6
(polygonal schemas and normal forms) and Layer 8 (the classification of compact surfaces).

### From Completed/HodgeStructures

The linear real and rational Hodge-structure objects that 6.2's decomposition instantiates.

## How to read the build

Layer 1 fixes the complex orientation, the holomorphic inverse and implicit function theorems
and, on the pinned Nijenhuis tensor, the Newlander–Nirenberg theorem; its orientation part
precedes 7.1, and 3.1's several-variable calculus precedes its analytic statements. Layer 2
builds the Dolbeault–Grothendieck lemma from the compact-support Cauchy–Green operator and
Taylor and Laurent truncation, then Dolbeault cohomology, the holomorphic-form sheaves and the Dolbeault theorem; its
bundle-valued comparison follows Layer 4. Layer 3 develops the convergent local algebra of germs
and analytic subsets that Layers 4, 6 and 7 and RealAnalyticGeometry consume. Layer 4 builds
holomorphic bundles, Chern and holomorphic connections and the flat correspondence. Layer 5 is
the analytic core: 5.1–5.8 work on real manifolds (densities, tests and distributions, the
differential-operator core, Fréchet and Sobolev carriers, elliptic regularity, spectral theory,
the real Hodge theorem and the componentwise adapter), 5.9–5.10 instantiate it on Hermitian
manifolds and prove Serre duality. Layer 6 adds the Kähler identities, Hodge decomposition, Hard Lefschetz and analytic
cycles. Layer 7 computes projective spaces, tori, Riemann surfaces and the Hopf surface, and
Layer 8 the Frölicher spectral sequence and the Iwasawa manifold. Every local definition and
bundle construction has restriction, gluing, functoriality and transport laws before it becomes
a global theorem's input.

## Layer 1: complex structures and type calculus (K1)

### 1.1 Realification, the complex orientation and holomorphic differentials

Consume ComplexManifolds Milestones 1 and 2, including the orientation construction, atlas
independence, product law and preservation by biholomorphisms. These targets use
DifferentialGeometry 2.1's `Manifold.Orientation`, whose fibres are
`Orientation ℝ (TangentSpace I x) ι`. Reindex `Fin (2 * finrank ℂ E)` to `Fin (finrank ℝ E)`
using the scalar-restriction dimension equality, and prove that every chart sign of the
resulting orientation lift is positive, from Milestone 2's real determinant positivity
expressed by `LinearMap.det_restrictScalars` and `Algebra.norm_complex_eq`. The carrier is
literally DifferentialGeometry 2.1's `Manifold.Orientation`; this layer owns only the
tangent-index and positive-chart-sign comparisons and constructs no second orientation. The
consumed orientation laws include compatibility with DifferentialGeometry 2.2's pullback along
open inclusions and along the identity between compatible atlases, and with its product
orientation. Prove, from the same determinant comparison, that every local biholomorphism is
`IsOrientationPreservingAt` for these complex orientations, and transport the orientation and
these laws together.

Holomorphic differentials are complex-linear: a smooth map is holomorphic iff its differential
intertwines `J`, equivalently carries `T^(1,0)` into `T^(1,0)`; this is the pinned
`isPseudoholomorphicOn_ofComplexManifold_iff`. In the flat one-variable chart make the criterion
explicit: for a `C¹` real map `φ : U → V` between open subsets of `ℂ` and an ambient
representative near each point, write `dφ = φ_z dz + φ_z̄ dz̄`. The pullback of `dz` is of type
`(1,0)` exactly when `φ_z̄ = 0`; preservation of all target `(1,0)` covectors is therefore
equivalent to this equation (the converse tests `dz`, coefficient `1`). Equivalently, for the
real-linear covector `ℓ = Dφ(z)`, complex-linearity is `ℓ(i) = i·ℓ(1)`; use
`real_linearMap_map_smul_complex` and `ContinuousLinearMap.complexOfReal` to construct the
complex-linear map, and `differentiableAt_complex_iff_differentiableAt_real` to identify this
with complex differentiability under the real `C¹` hypothesis. Pointwise covectors need only the
`C¹` map; the bundled smooth-form pullback requires a smooth map. This is a coordinate test for
the pinned criterion, not another type-form carrier.

**Checks.**

- Multiplication by `i` on `ℂ` has real determinant `|i|² = 1 > 0`; a definition that used the
  real determinant of conjugation `z ↦ z̄`, which is `−1`, would reverse the orientation.
- For `A = diag(2, i)` on `ℂ²` the real determinant is `|det_ℂ A|² = |2i|² = 4`, so the chart
  sign is `+1`; the product law gives the product orientation of `ℂ × ℂ` from two copies of the
  one-variable orientation.
- For `φ(z) = z̄`, `φ_z̄ = 1` and the pullback of `dz` is `dz̄`, of type `(0,1)`; for
  `φ(z) = z²`, `φ_z̄ = 0` and the pullback `2z dz` is of type `(1,0)`.

*Needs:* ComplexManifolds Milestones 1–2; DifferentialGeometry 2.1–2.2; Mathlib
`LinearMap.det_restrictScalars`, `Algebra.norm_complex_eq`,
`differentiableAt_complex_iff_differentiableAt_real`; Tau Ceti
`isPseudoholomorphicOn_ofComplexManifold_iff`.

### 1.2 Holomorphic inverse and implicit functions and holomorphic submanifolds

Consume `ContDiffAt.to_localInverse` and `ContDiffAt.implicitFunction` over `ℂ`, with
RealAlgebraicGeometry Layer 7's analytic inverse and complexification comparison, and prove
their complex-manifold transport, composition and inverse laws, with the relevant derivative
invertible. For holomorphic `G(z, v)` with invertible `v`-derivative at `(z₀, v₀)`, construct the
joint holomorphic implicit map `F(z, w)` near `(z₀, G(z₀, v₀))`, with `F(z₀, G(z₀, v₀)) = v₀` and
`G(z, F(z, w)) = w`, and prove its local uniqueness. Consume
`ImplicitFunctionData.contDiffAt_implicitFunction` and
`ImplicitFunctionData.analyticAt_implicitFunction`, which already give joint smooth and analytic
regularity of `implicitFunction.uncurry`, by applying their data to `(z, v) ↦ (z, G(z, v))`; prove
the holomorphic chart and local-uniqueness adapters from those joint theorems, the fixed-level
`ContDiffAt.implicitFunction` wrapper supplying the single-level specialization.

Develop holomorphic submanifolds, embeddings and their tangent and normal exact sequences,
extending ComplexManifolds item 7.4's codimension-one normal bundle to arbitrary codimension.
Prove the equivalence of regular holomorphic parametrizations and regular holomorphic zero sets.

**Checks.**

- For `G(z, v) = v² − z` at `(1, 1)`, the implicit map is `F(z, w) = √(z + w)` with the branch
  `F(1, 0) = 1`; the other branch `−√(z + w)` fails `F(z₀, G(z₀, v₀)) = v₀`, which pins the
  uniqueness clause.
- The zero set of `w − z²` in `ℂ²` is the graph of a regular parametrization `z ↦ (z, z²)`;
  the zero set of `w² − z³` is not a submanifold at the origin, where the differential vanishes,
  so regularity of the defining function is not dropped.
- A holomorphic map whose complex differential is invertible at a point has a holomorphic local
  inverse; `z ↦ z̄` has invertible real differential but no holomorphic inverse, excluding the
  real inverse function theorem as a substitute.

*Needs:* Mathlib `ContDiffAt.to_localInverse`, `ContDiffAt.implicitFunction`; Tau Ceti
`ImplicitFunctionData.contDiffAt_implicitFunction`,
`ImplicitFunctionData.analyticAt_implicitFunction`; RealAlgebraicGeometry Layer 7;
ComplexManifolds Milestone 7.

### 1.3 Type calculus and the complex-bilinear Nijenhuis tensor

For any smooth almost complex structure consume the pinned type decomposition
(`IsOfType`, `typeProjection`, `sum_typeProjection`), the complex scalar action on forms, the
four bidegrees of `d` (`IsOfType.mextDerivₗ_eq_add_del_add_delBar_add`), the Nijenhuis tensor
`nijenhuis` with `nijenhuis_apply` (the expression `[JX,JY] − [X,Y] − J[JX,Y] − J[X,JY]` with
DifferentialGeometry's bracket evaluation `dα(X,Y) = Xα(Y) − Yα(X) − α([X,Y])`, without a `1/2`
factor), `nijenhuis_antisymm`, the pinned evaluation formulas `delBar_delBar_apply`
(`∂̄²f(v,w) = −(1/4) ∂f(N_J(v,w))`) and `del_del_apply`, and the involutivity criteria
`isInvolutiveComplexDistribution_eigenspace_I_iff` and `…_neg_I_iff`, which say that `N_J = 0`
exactly when both eigenbundles are involutive.

Own what the pin lacks. Apply SmoothBundlesConnections B2.1's complexification to `TM` and
identify its `±i` eigensubbundles with the eigenbundle carriers of the pinned involutivity
criteria. Extend `N_J` complex-bilinearly to `TM ⊗ ℂ` and prove its type identities: it carries
two `(0,1)` vectors to a `(1,0)` vector, two `(1,0)` vectors to a `(0,1)` vector, and vanishes on a
`(1,0)` and a `(0,1)` vector; on parts of real vectors, `N(X^(0,1), Y^(0,1)) = N(X,Y)^(1,0)` and
its conjugate. Deduce from the pinned real formulas the evaluations on `(0,1)` fields,
`∂̄²f(X,Y) = −(1/4) ∂f(N_J(X,Y))`, and on `(1,0)` fields, `∂²f(X,Y) = −(1/4) ∂̄f(N_J(X,Y))`, by
projecting real tangent vectors to their `(0,1)` or `(1,0)` components. For the convention
`N′ = N/4`, prove the corresponding formulas without the factor `1/4`. The first right-hand side
uses `∂f`, as its type requires.

**Checks.**

- A constant `J` on a vector space has `N_J = 0`; for `ℂⁿ` the pinned `nijenhuis_ofComplexManifold`
  gives this for `J = i`.
- On `ℝ⁴` with coordinates `(x, y, u, v)` and `J∂_x = ∂_y`, `J∂_y = −∂_x`,
  `J∂_u = ∂_v + y∂_x`, `J∂_v = −∂_u − y∂_y`, one has `J² = −1` and
  `N_J(∂_x, ∂_u) = [∂_y, ∂_v + y∂_x] = ∂_x ≠ 0`: a non-integrable structure, the negative
  control for Layer 1.4.
- The expression with the signs reversed, `[JX,JY] − [X,Y] + J[JX,Y] + J[X,JY]`, is not
  tensorial: replacing `Y` by `fY` adds `2((JX)f·JY − (Xf)·Y)`, while the pinned expression adds
  `0`; so the sign convention is forced by tensoriality.

*Needs:* Tau Ceti `nijenhuis`, `nijenhuis_apply`, `delBar_delBar_apply`, `del_del_apply`,
`isInvolutiveComplexDistribution_eigenspace_I_iff`; SmoothBundlesConnections B2.1;
DifferentialGeometry 1.1.

### 1.4 The Newlander–Nirenberg theorem

Prove the smooth **Newlander–Nirenberg theorem**, `newlander_nirenberg`: if `N_J = 0` on a real
manifold modelled on the finite-dimensional complex space `E`, then every point lies in the
source of a chart of the maximal smooth atlas that is pseudoholomorphic on its source from
`(M, J)` to `E` with its structure `ofComplexManifold E E` (multiplication by `i`); such charts
have holomorphic transition maps, form a complex atlas compatible with the smooth structure, and
induce `J`. The converse is the pinned `nijenhuis_ofComplexManifold`. The proof includes the
local complex first-order coordinate equations and transition holomorphicity. Follow Webster's
rapidly converging proof (webster-nn, pp. 303–316): construct Henkin's homotopy operator on
strictly convex domains with its half-derivative Hölder–Zygmund gain, smoothing operators and
their tame estimates, the nonlinear correction estimates and the shrinking-domain Nash–Moser
iteration; prove convergence and invertibility of the composed coordinate maps and smooth
regularity by bootstrapping. These analytic prerequisites belong here, consuming PDE §1.7's
Hölder spaces and §5.3/§5.6's Schauder estimates. A fixed-Hölder contraction using polydisc
Cauchy–Green alone does not give the required derivative control, and real Frobenius alone does
not give the theorem. LieGroupoidsPoisson consumes the eigensubbundle/involutivity dictionary
and builds the complex Lie algebroid structures.

**Checks.**

- For the structure of a complex manifold, `ofComplexManifold E M`, the given holomorphic
  charts satisfy the conclusion by `isPseudoholomorphicOn_ofComplexManifold_iff`, so the theorem
  is consistent with the pinned direction.
- For the non-integrable `J` on `ℝ⁴` of 1.3, no chart is pseudoholomorphic on an open set,
  since a pseudoholomorphic chart would give `N_J = 0` there; the hypothesis is not vacuous.
- In dimension zero (`E = 0`) every chart is pseudoholomorphic and the theorem is trivial; for
  `E = ℂ` it recovers the existence of isothermal coordinates for an almost complex structure on
  a surface, where `N_J = 0` holds automatically: `N_J(v, Jv) = −N_J(Jv, v) = J N_J(v, v) = 0` by
  `nijenhuis_antisymm`, the pinned identity `N_J(Jv, w) = −J N_J(v, w)` and `nijenhuis_self`.

*Needs:* 1.3; Tau Ceti `IsPseudoholomorphicOn`, `IsManifold.maximalAtlas`; PDE §1.7, §5.3,
§5.6; webster-nn.

### Examples

The complex plane with `J = i` and the orientation `dx ∧ dy`; the non-integrable structure on
`ℝ⁴` of 1.3; the graph `w = z²` and the cuspidal zero set `w² = z³` of 1.2.

### Dependencies

Mathlib `IsManifold`, `mfderiv`, `maximalAtlas`, `ContDiffAt.implicitFunction`; Tau Ceti
`SmoothAlmostComplexStructure`, `nijenhuis`, `IsOfType`, `del`, `delBar`,
`IsPseudoholomorphicOn`, `ofComplexManifold`; ComplexManifolds Milestones 1, 2, 7;
DifferentialGeometry 1.1, 2.1–2.2; SmoothBundlesConnections B2.1; RealAlgebraicGeometry Layer 7;
PDE §1.7, §5.3, §5.6; 3.1 for the several-variable calculus of 1.2.

## Layer 2: Dolbeault calculus and the local lemmas (K2)

### 2.1 The Dolbeault–Grothendieck lemma on a polydisc

On an integrable complex manifold consume the pinned `∂` and `∂̄` on all smooth forms with
their bidegrees, squares zero, anticommutation (`del_del_ofComplexManifold`,
`delBar_delBar_ofComplexManifold`, `del_delBar_add_delBar_del_ofComplexManifold`), graded
Leibniz rule (`del_wedgeWith`, `delBar_wedgeWith`), conjugation
(`mapCoeff_delBar_of_map_smul_conj`) and naturality under holomorphic pullback
(`mpullback_delBar` with `isPseudoholomorphicOn_ofComplexManifold_iff`).

Define `polydisc r` as the open polydisc `{z : ∀ j, |z_j| < r_j}` of `ℂⁿ`, an open subset and
hence an open complex submanifold of the model space; it is empty when some `r_j ≤ 0`. Prove the
**Dolbeault–Grothendieck lemma** `dolbeault_grothendieck_polydisc` (Demailly, Chapter I,
(3.29), for a neighbourhood of a point; the whole-polydisc statement follows from 2.2): a smooth
`∂̄`-closed form of type `(p, q+1)` on the whole polydisc is `∂̄ψ` for a smooth form `ψ` of type
`(p, q)` on the whole polydisc. For the scalar Cauchy–Green step own the compact-support
operator `Tφ(z) = (1/π) ∫ φ(ζ)/(z − ζ) dA(ζ)` on `C_c^∞(ℂ)` (Demailly, Chapter I, (3.2) and
(3.4)): with `dA` the Lebesgue `volume` on `ℂ` normalized by
`Complex.volume_preserving_equiv_real_prod`, prove local integrability of `1/z` in two real
dimensions, the weak identity `∫ (1/(πζ)) ∂̄φ(ζ) dA(ζ) = −φ(0)` for every `φ ∈ C_c^∞(ℂ)` (so
`∂̄(1/(πz)) = δ₀` through integration by parts, not a pointwise claim), transfer of derivatives
under the convolution, smoothness of `Tφ`, and the identities `∂̄Tφ = φ` and `T(∂̄φ) = φ`. For
the approximation step use 2.3's finite-rank truncation operators, whose coefficient functionals
are fixed circle integrals independent of external parameters. Reduce the `(p, q+1)` case to the scalar one coefficientwise, by induction on the
number of variables occurring in `dz̄`, using 2.2 for the parameters that the induction carries.

**Checks.**

- For `n = 1` and `f = z̄` on the unit disc, `u = z̄²/2` solves `∂̄u = f`, while `u = |z|²` gives
  `∂̄u = z`: the operator is `∂/∂z̄`, not `∂/∂z`.
- For `n = 2`, the form `z̄₂ dz̄₁` is not `∂̄`-closed (`∂̄(z̄₂ dz̄₁) = dz̄₂ ∧ dz̄₁ ≠ 0`) and has
  no primitive since `∂̄² = 0`; the closedness hypothesis is not dropped.
- For `n = 0` the polydisc is a point, every form of positive degree is `0`, and `ψ = 0` works;
  for `r_1 ≤ 0` the polydisc is empty and the statement is vacuous.

*Needs:* Tau Ceti `delBar`, `IsOfType`, `ofComplexManifold`, the opens-manifold instances;
Mathlib `Complex.volume_preserving_equiv_real_prod`; 2.2–2.3; Demailly, Chapter I, (3.2), (3.4).

### 2.2 The parameter-dependent one-variable solver

For whole-polydisc exactness and successive Dolbeault elimination, prove one joint
parameter-dependent one-variable solver. Let `P` be a finite-dimensional smooth parameter
manifold, `Ω ⊆ ℂ` an open disc `D(0, R)`, `0 < R ≤ ∞`, or a punctured disc `D(0, R) ∖ {0}`,
and `Q ⊆ ℂ^m` a product of such discs and punctured discs. For jointly smooth `f : P × Q × Ω → ℂ` with `∂̄_(q_j) f = 0` for
every complex parameter coordinate, construct jointly smooth `u` with `∂̄_z u = f` and
`∂̄_(q_j) u = 0`. This includes `Q = P = point` (the scalar case), `Q = point` with general `P`
(smooth parameters) and `P = point` with holomorphic `Q`; it covers the polydisc and the
punctured-plane products `ℂ* × ℂ`, `ℂ × ℂ*` and `ℂ* × ℂ*` of 2.3 and 7.3. Do not patch with a
partition of unity in `Q`.

*Parameter Cauchy–Green.* For a fixed `χ ∈ C_c^∞(Ω)` independent of all parameters and jointly
smooth `f` on `P × Q × Ω`, extend `χ f(p, q, ·)` by zero and apply 2.1's operator `T`. The map `(p, q, z) ↦ T(χ f(p, q, ·))(z)` is jointly `C^∞`; in parameter charts
every smooth derivative in `p` commutes with `T`, and `∂̄_(q_j) T(χ f) = T(χ ∂̄_(q_j) f)`; its
`z`-equation is `∂̄_z T(χ f) = χ f`. Prove these by differentiating under the integral with the
common compact spatial support, and smoothness in `z` after the kernel substitution `ζ = z − ξ`,
using local integrability of the Cauchy kernel. The region `ℂ ∖ tsupport χ` where `T(χ f)` is
holomorphic is independent of `p` and `q`; in particular, when `f` is holomorphic in `Q`, so is
`T(χ f)`.

Choose a nested exhaustion of `Ω` by concentric closed discs, or closed annuli for a punctured
disc, `K_j ⊂ int K_j^+ ⊂ K_j^+ ⊂ int K_(j+1)`, so that every function holomorphic near `K_j^+`
is approximated on `K_j` by its Taylor or Laurent truncations (2.3). Use the
open shell cover whose late members are `int K_(j+1) ∖ K_(j−1)^+` (finitely many initial sets),
and a locally finite smooth partition `χ_j` compactly supported in these members, so `supp χ_j`
misses a neighbourhood of `K_(j−1)^+` for all large `j`. Write `f_j = χ_j f`; then `T f_j` is
holomorphic on a neighbourhood of `K_(j−1)^+`. Apply 2.3's truncation operator `A_j`, chosen
for `K_(j−1)^+` and a circle (or pair of circles) `L_j` inside that holomorphy neighbourhood,
and set
`u_j = T f_j − A_j(T f_j)`; for the finitely many initial indices use `u_j = T f_j`. Thus
`∂̄_z u_j = f_j`, and on each fixed earlier compact the tail is bounded by the operator-norm error
`sup_(K_(j−1)^+) |h − A_j h| ≤ ε_j sup_(L_j) |h|`.

For parameter dependence apply these same spatial operators to all parameter values:
`T f_j(p, q, ·)` is differentiable in `p` and preserves `q`-holomorphy by differentiation under
its compactly supported integral; `A_j h(q, ·) = Σ_k c_k(h(q, ·)) z^k`, with `c_k` the fixed circle
integrals, preserves both because its coefficient functionals and output monomials are fixed. On each relatively compact parameter chart in
`P`, exhaust that chart and `Q` by compact subsets and define mixed seminorms using finitely many
parameter coordinates. Choose `ε_j` against the finite suprema of every required parameter
derivative of `T f_j` on a slightly larger product compact and collar; Cauchy estimates on
slightly larger `Q`-compacts control holomorphic-parameter derivatives, and on `K_(j−1)^+` they
control the `z`-derivatives on `K_(j−1)`. Use a diagonal schedule so the `j`-th tail correction
and every mixed derivative through order `j` are at most `2^(−j)` on each earlier compact
product. No smallness is imposed on the prescribed new-shell datum: it contributes only finitely
often on each compact, while the corrected tails have summable bounds. The series converges in
every compact-product smooth seminorm, permits termwise differentiation, solves `∂̄_z u = f` and
remains holomorphic in `Q`. For general `P`, carry this out in relatively compact parameter
charts and glue with a locally finite smooth partition of unity in `P`; multiplication by those
functions preserves `q`-holomorphy because the partition is independent of `Q`.

**Checks.**

- With `P = Q = point` and `f = 1` on `Ω = ℂ`, `u = z̄` solves the equation; the shell
  corrections vanish because `T(χ_j)` is already entire after correction on each compact.
- With `Q = ℂ ∖ {0}` and `f(q, z) = q⁻¹`, the solution `u = q⁻¹ z̄` is holomorphic in `q`; a
  solution `q⁻¹ z̄ + q̄` would satisfy `∂̄_z u = f` but not `∂̄_q u = 0`, which the conclusion
  excludes.
- With `Q = ℂ` and `f(q, z) = q̄`, the hypothesis `∂̄_q f = 0` fails and no `u` with
  `∂̄_z u = f` and `∂̄_q u = 0` exists (apply `∂̄_q` to both sides): the holomorphy hypothesis on
  the datum is necessary.

*Needs:* 2.1's Cauchy–Green operator; 2.3's truncation operators; Mathlib `circleIntegral` for
the Cauchy estimates.

### 2.3 Taylor and Laurent approximation on product domains

Own the one-variable finite-rank truncation operators. For a closed disc `K = D̄(0, r)` and a
circle `L = {|ζ| = ρ}` with `r < ρ`, define `A_N h = Σ_(k≤N) c_k(h) z^k` with
`c_k(h) = (2πi)⁻¹ ∮_L h(ζ) ζ^(−k−1) dζ`, and on a closed annulus the two-sided Laurent
truncation with the inner and outer circle integrals; prove the Cauchy estimate
`sup_K |h − A_N h| ≤ (r/ρ)^(N+1)/(1 − r/ρ) · sup_L |h|` for `h` holomorphic on a neighbourhood of
the closed disc or annulus bounded by `L` (Rainer, Theorem 7.4, for the Laurent expansion), so
that `ε` can be prescribed by choosing `N`; the functionals `c_k` are fixed and preserve smooth
and holomorphic dependence on parameters. Prove the multivariable Taylor approximation on `ℂⁿ`
and Laurent approximation on `ℂ* × ℂ` and `ℂ* × ℂ*` by product truncations, with their compact
exhaustions, locally finite gluing and convergence of all smooth derivatives; do not infer the
product-domain statements from the one-variable ones without the product exhaustion. Develop
the product-domain approximation and gluing laws. With 2.2 the solver yields solutions on the full
open parameter/domain products, so the sheaves `𝒪` and `Ω^p` of 2.4 are acyclic on the product
domains used here and 7.3's punctured-plane cover of `ℂ² ∖ {0}` is a Leray cover. Here `𝒪` is
Mathlib's `smoothSheafCommRing` for `𝓘(ℂ, ℂ)`, with the carrier comparison of 3.1.

**Checks.**

- On `ℂ* × ℂ`, the function `z₁⁻¹ z₂` is the limit of its own Laurent expansion and has no
  Taylor expansion at the origin; the approximation uses negative powers of `z₁` only.
- On `ℂ* × ℂ*`, `H¹(U, 𝒪)` of the two-set cover of `ℂ² ∖ {0}` by `ℂ* × ℂ` and `ℂ × ℂ*` is
  spanned by the monomials `z₁^(−m) z₂^(−n)`, `m, n ≥ 1`, the Laurent monomials on the overlap not
  holomorphic on either piece (7.3).
- The Taylor approximation on `ℂ²` of `exp(z₁ z₂)` converges with all derivatives on every
  compact; the partial sums are polynomials, so the approximants are entire.
- For `h = 1/(1 − z)` on `|z| < 1`, `K = D̄(0, 1/2)`, `L = {|ζ| = 3/4}`: `A_N h = Σ_(k≤N) z^k`
  and the error on `K` is `(1/2)^(N+1)/(1/2) = 2^(−N)`, within the Cauchy bound
  `(2/3)^(N+1)/(1 − 2/3) · 4`; the truncation operators are finite-rank, so a sequence of them
  with growing `N` is not a single bounded operator.

*Needs:* Mathlib `circleIntegral`, `smoothSheafCommRing`; rainer-advanced-complex-analysis,
Theorem 7.4; 3.1; 2.2 for the acyclicity statements.

### 2.4 Dolbeault cohomology, holomorphic-form sheaves and the Dolbeault theorem

Define `dolbeaultCocycles p q` as the `∂̄`-closed forms in the image of the pinned type
projection `typeProjection p q` in degree `p + q`, `dolbeaultCoboundaries p q` as the
`∂̄`-image of the type-`(p, q−1)` forms (zero for `q = 0`), and `DolbeaultCohomology p q`, the
Dolbeault group `H^(p,q)_∂̄(M)`, as the image of the cocycles in the quotient of all
`(p+q)`-forms by the coboundaries; it is a complex vector space because `delBar` and
`typeProjection` are complex-linear. Prove the induced maps on `H^(p,q)` are complex-linear,
define its quotient maps, functoriality under holomorphic maps (from `mpullback_delBar`), the
wedge product (from `delBar_wedgeWith`) and the identification of `H^(p,0)` with holomorphic
`p`-forms; for `p = 0` this is the pinned `kerDelBarZeroEquiv`.

Construct the sheaves `Ω^p` of holomorphic `p`-forms and of smooth type forms, prove the latter
fine and acyclic using partitions of unity, and prove the **Dolbeault theorem**
`H^q(M; Ω^p) ≃ H^(p,q)_∂̄(M)` with naturality and products (Demailly, Chapter I, (3.29) and
Chapter IV; Wells, Chapter II). Build the analytic-sheaf, Čech and derived comparison using
Mathlib's Ext-based sheaf cohomology carrier: prove fine implies acyclic on paracompact
Hausdorff manifolds and the Čech comparison for acyclic covers. Prove that for every abelian
sheaf on a paracompact Hausdorff manifold the colimit of Čech cohomology over locally finite open
refinements agrees with derived sheaf cohomology: construct refinement maps, prove independence
up to cochain homotopy, use paracompact shrinking for exactness after refinement, and compare
with an injective or flabby resolution. No coherent Cartan B is an input. RealAnalyticGeometry
R3.2 consumes this colimit theorem after proving vanishing on an arbitrarily fine cofinal family
of finite-order Stein covers; it does not assume the sheaf acyclic on their intersections.
SmoothBundlesConnections B6.1 supplies the scalar good-cover comparison where it applies, not a
coherent-sheaf theorem.

After Layer 4 constructs `𝒪(E)`, `E`-valued type forms and `∂̄_E`, prove the bundle-valued
comparison `H^q(M; 𝒪(Ω^p ⊗ E)) ≃ H^(p,q)(M; E)` for every finite-rank holomorphic bundle `E`, its
naturality, and `Ω^(n,q)(E*) ≃ Ω^(0,q)(E* ⊗ K_M)`.

Acceptance: whole-polydisc exactness (2.1), and no nonzero holomorphic one-form on 7.1's
`Projectivization ℂ (Fin 2 → ℂ)`. Consume `MDifferentiable.exists_eq_const_of_compactSpace` for
functions on connected compact complex manifolds and `MDifferentiable.isLocallyConstant` without
connectedness; do not assert global constancy for disconnected manifolds.

**Checks.**

- `H^(0,0)_∂̄(M)` is the space of holomorphic functions (`kerDelBarZeroEquiv`); on a compact
  connected `M` it is `ℂ`, and on a compact `M` with `c` components it is `ℂ^c`.
- `H^(p,q)_∂̄` of the polydisc vanishes for `q ≥ 1` by 2.1 and equals the holomorphic
  `p`-forms for `q = 0`; on a compact Riemann surface `H^(1,0)` is the finite-dimensional space
  of holomorphic one-forms, whereas the quotient of all `(1,0)`-forms by the coboundaries (zero
  in that degree) is infinite-dimensional, so the group must be the image of the cocycles, not
  the ambient quotient.
- For `p + q > 2 dim_ℂ M` there are no nonzero forms and the group is `0`; for `p > dim_ℂ M` or
  `q > dim_ℂ M` the type-`(p, q)` projection is `0` and the group is `0`.

*Needs:* 2.1; Tau Ceti `typeProjection`, `delBar`, `kerDelBarZeroEquiv`, `mpullback_delBar`,
`delBar_wedgeWith`; Mathlib sheaf cohomology, `MDifferentiable.exists_eq_const_of_compactSpace`;
Layer 4 for the bundle-valued comparison; 7.1 for the acceptance example.

### Examples

The unit disc and the polydisc with the explicit primitives of 2.1; the punctured-plane products
and their Laurent monomials of 2.3; the Riemann sphere of 7.1, where `H^(1,0) = 0`.

### Dependencies

Tau Ceti `del`, `delBar`, `IsOfType`, `typeProjection`, the Dolbeault Leibniz and naturality
lemmas, `kerDelBarZeroEquiv`; rainer-advanced-complex-analysis, Theorem 7.4; Mathlib
`circleIntegral`, `Complex.volume_preserving_equiv_real_prod`, `smoothSheafCommRing`, sheaf
cohomology and the constancy theorems; 3.1; Demailly, Chapter I; Layer 4 and 7.1 for the later
items only.

## Layer 3: analytic germs and subvarieties (K3)

### 3.1 Several-variable calculus and the real-analytic atlas (K3.0)

This subsection supplies Layer 1's holomorphic/analytic comparisons and precedes it in the
build. Consume the pinned polydisc Cauchy formula,
`DifferentiableOn.analyticOnNhd_of_finiteDimensional` and
`TauCeti.analyticOnNhd_iff_differentiableOn_of_finiteDimensional`, including their
finite-dimensional complex domain, complete codomain and open-set hypotheses, and
`TauCeti.analyticAt_circleIntegral` and `TauCeti.analyticOnNhd_circleIntegral` for jointly
analytic integrands near the parameter set times the integration circle. Prove Osgood's lemma
(a continuous separately holomorphic function is holomorphic) and its locally uniform contour
bounds, then use that joint analyticity with the native parametric integral theorem. Consume
Mathlib's one-variable Cauchy theory as well; construct the manifold and chart transports.

Prove `realified_isManifold_analytic`: apply `AnalyticAt.restrictScalars` to the analytic chart
transitions and inverses, then `AnalyticAt.contDiffAt`, to build the realified atlas's
`HasGroupoid M (contDiffGroupoid ω 𝓘(ℝ, E))`, that is real `IsManifold 𝓘(ℝ, E) ω M`; its
underlying smooth structure agrees with ComplexManifolds Milestone 1 and with the pinned
`isManifold_real`. Export the real-analytic transition and local defining-equation comparisons
that RealAnalyticGeometry's analytic triangulation and the Part II cycle theory require. Use
the native `contDiffGroupoid` at order `ω`; no separate analytic groupoid carrier is needed.

**Checks.**

- The transition `z ↦ 1/z` between the two charts of the Riemann sphere is analytic on
  `ℂ ∖ {0}`, so `OnePoint ℂ` is a real-analytic surface; its realification is the smooth
  structure of ComplexManifolds Milestone 3.
- `z ↦ z̄` is real-analytic but not holomorphic, so the real-analytic groupoid is strictly
  larger than the holomorphic one; the theorem passes from the smaller to the larger, never
  back.
- The real analogue of Osgood's lemma fails: `f(x, y) = x y / (x² + y²)` extended by `0` is
  real-analytic in each variable separately but not continuous at the origin; the complex lemma
  rests on the Cauchy formula in each variable, which has no real counterpart.

*Needs:* Tau Ceti `analyticOnNhd_iff_differentiableOn_of_finiteDimensional`,
`analyticAt_circleIntegral`, `analyticOnNhd_circleIntegral`; Mathlib `AnalyticAt.restrictScalars`,
`AnalyticAt.contDiffAt`, `contDiffGroupoid`; ComplexManifolds Milestone 1.

### 3.2 Holomorphic germs and Weierstrass preparation (K3.HolomorphicStalk)

Define holomorphic germs on every finite-dimensional complex manifold `M` modelled on `E` as the
stalks of Mathlib's `smoothSheafCommRing 𝓘(ℂ, E) 𝓘(ℂ) M ℂ`, the sheaf of complex-smooth, that is
holomorphic, functions; retain the chosen point, local coordinates and the convergent
multivariable power-series comparison. Consume the pinned `IsLocalRing` instance
`smoothSheafCommRing.instLocalRing_stalk` and `smoothSheafCommRing.isUnit_stalk_iff` after 3.1
identifies analytic and complex-smooth sections. Supply restriction, pullback and the
maximal-ideal comparison (the germs vanishing at the point). Consume
`AnalyticOnNhd.eqOn_of_preconnected_of_eventuallyEq` for the identity theorem. Develop the
several-variable convergent power-series comparison `𝒪_(M,x) ≃ ℂ{z₁, …, z_n}`.

Prove the **Weierstrass preparation theorem** `weierstrass_preparation` and its uniqueness
`weierstrass_preparation_unique` (Demailly, Chapter II, (2.1)): when `w ↦ f(0, w)` vanishes to
order exactly `d`, the germ `f` is a unit times a monic degree-`d` polynomial in `w` whose
coefficients are holomorphic germs vanishing at the origin, uniquely. Prove the Weierstrass
division theorem (Demailly, Chapter II, (2.3)) with its remainder bound. Construct the
contour/power-sum proof: the power sums of the roots of `w ↦ f(z, w)` near `0` are
`(2πi)⁻¹ ∮ w^k ∂_w f / f dw`, holomorphic in `z` by 3.1's parametric Cauchy theory, and the
coefficients follow by Newton's identities, consuming `MvPolynomial.mul_esymm_eq_sum`; own the
logarithmic-derivative root count used here. Align the factorization law with
`PowerSeries.IsWeierstrassFactorization`.

**Checks.**

- `f(z, w) = w² − z` has order `2` at `0`; its preparation is `u = 1`, `P = w² − z`, with the
  coefficient `a₀(z) = −z` vanishing at the origin.
- `f(z, w) = e^z w` has order `1`; its preparation is `u = e^z`, `P = w`; a definition that
  required `u = 1` would exclude this germ.
- `f(z, w) = z` vanishes identically on `w ↦ f(0, w)`, so no `d` satisfies the order hypothesis
  and no Weierstrass polynomial in `w` exists without a coordinate change; the hypothesis is
  necessary.
- In the stalk at `0` of `ℂ`, the germ of `z` is a non-unit and `1 + z` is a unit, by
  `isUnit_stalk_iff`; the maximal ideal is `(z)`.

*Needs:* 3.1; Mathlib `smoothSheafCommRing`, `smoothSheafCommRing.instLocalRing_stalk`,
`smoothSheafCommRing.isUnit_stalk_iff`, `AnalyticOnNhd.eqOn_of_preconnected_of_eventuallyEq`,
`MvPolynomial.mul_esymm_eq_sum`, `PowerSeries.IsWeierstrassFactorization`.

### 3.3 The one-variable meromorphic germ field (K3.MeromorphicGermField)

For `a ∈ ℂ`, use the holomorphic stalk `𝒪_a` of 3.2 and its comparison with holomorphic
neighbourhood representatives in `Filter.Germ (𝓝 a) ℂ`. Prove `𝒪_a` is a domain by the identity
theorem and construct `K_a = FractionRing 𝒪_a`. Identify it with a field structure on the
subring of punctured germs `Filter.Germ (𝓝[≠] a) ℂ` represented by `MeromorphicAt f a`, using
the finite-power analytic characterization of `MeromorphicAt` and `meromorphicOrderAt_eq_int_iff`;
treat the zero germ separately. Prove the holomorphic-to-punctured map injective, every fraction
of finite pole order, every such punctured germ a fraction, and all operations compatible with
these maps. For a local biholomorphism taking `a` to `b`, prove the pullback comparison with
`K_b` and its local-inverse identities.

Build the finite-pole Laurent decomposition directly from the finite-power characterization of
`MeromorphicAt` (the classical Laurent theorem is Rainer, Theorem 7.4): choose
`N ≥ 0` and an analytic germ `h` with `f(z) = (z − a)^(−N) h(z)` on a punctured neighbourhood,
split `h(z) = Σ_(j<N) c_j (z − a)^j + (z − a)^N q(z)`, and identify the finite principal part and
the holomorphic germ `q`. Prove that changing `N`, shrinking the neighbourhood or changing the
punctured representative gives the same principal coefficients and regular germ; prove
uniqueness by multiplying the difference by a high power and comparing Taylor coefficients.
Include `N = 0` and the zero germ. Identify the coefficient of order `−k`, `k ≥ 1`, with
`(2πi)⁻¹ ∮_(|z−a|=ρ) f(z)(z − a)^(k−1) dz` for every small `ρ > 0`, using the native Cauchy
coefficient formulas and annulus invariance, and prove agreement with the classical Laurent
coefficients.
Transport restriction, finite sums, products and differentiation to this field; in the product
formula a fixed negative coefficient is a finite convolution because both Laurent series are
bounded below. Identify the regular subring with `𝒪_a` and its value-at-`a` homomorphism to
`ℂ`; the value a meromorphic representative assigns at its centre is never used. This target
has no quantum-field-theory prerequisite and treats poles only.

**Checks.**

- `1/(z − a)` has principal part `1/(z − a)`, regular germ `0`, and coefficient of order `−1`
  equal to `(2πi)⁻¹ ∮ dz/(z − a) = 1`.
- `(z − a)^(−2)(1 + (z − a)²)` has principal part `(z − a)^(−2)`, regular germ `1`, and its
  value at `a` through the regular evaluation is `1`; `(z − a)/(z − a)` is the unit germ `1`
  with value `1`, whatever a representative assigns at `a`.
- The product `(z − a)^(−1) · (z − a)^(−1)` has order `−2` and coefficient `c_(−2) = 1` by the
  convolution formula, and `𝒪_a` is a domain: `z · z = 0` has no nonzero solution.

*Needs:* 3.2; Mathlib `Filter.Germ`, `MeromorphicAt`, `meromorphicOrderAt_eq_int_iff`,
`circleIntegral`; rainer-advanced-complex-analysis, Theorem 7.4.

### 3.4 Local algebra, the Nullstellensatz and coherence

Prove the holomorphic stalk is Noetherian (Demailly, Chapter II, (2.7)), factorial ((2.10),
`uniqueFactorizationMonoid_holomorphicStalk`) and a regular local ring of Krull dimension `n`
with the coordinate germs as regular parameters (`isRegularLocalRing_holomorphicStalk`). Follow
Demailly, Chapter II, §4: prove local parametrization of a pure-dimensional analytic germ by a
finite branched projection to a polydisc ((4.19)), elimination under finite projections, density
of regular points and the dimension and finite-fibre formulas. Prove the hypersurface weak
Nullstellensatz: for irreducible `f`, a germ `h` vanishing on the zero germ of `f` is divisible
by `f`. Prove **Rückert's Nullstellensatz** `I(V(𝔞)) = √𝔞` for every ideal `𝔞` of the
convergent local ring ((4.22)) using local parametrization.

Prove **Oka coherence** ((3.19)) via Weierstrass division and relations induction in the
primitive local form: for every open `U`, every finite tuple of holomorphic functions on `U` and
every `x ∈ U`, construct a neighbourhood `V` of `x` and finitely many holomorphic relation
vectors on `V` whose germs generate the relation module at every point of `V`. Own **Cartan's
coherence theorem** for the reduced ideal sheaf ((4.29)) as a separate local-algebra target:
for every closed analytic subset `A` of an open complex manifold, locally the common zero set of
finitely many holomorphic functions, and every point, construct a neighbourhood and finitely
many holomorphic functions whose germs generate its reduced ideal at every point of that
neighbourhood; by Rückert this ideal is the radical of the defining ideal, so the construction
produces generators of the radical. Prove it by reducing to irreducible germs, using local
parametrization and the Weierstrass-polynomial description on the branched cover, and applying
the Oka relations theorem; recombine local irreducible components by `I_A = ⋂ I_(A_k)`,
generating each finite intersection from Oka relations of concatenated tuples `(f, −g)`. Give
also the local-generator statement for ideals specified by a finite holomorphic tuple.
RealAnalyticGeometry R3.2 owns the native coherent `SheafOfModules` predicate and the
translation of these primitive statements to it; these local proofs consume only the preceding
convergent local algebra.

**Checks.**

- In `𝒪_1 = ℂ{z}`, `𝔞 = (z²)` has `V(𝔞) = {0}` and `I(V(𝔞)) = (z) = √𝔞`; `𝔞 = (z₁ z₂)` in
  `𝒪_2` is radical and `I(V(𝔞)) = 𝔞`.
- The relation module of `(z₁, z₂)` in `𝒪_2` is generated by the single Koszul relation
  `(z₂, −z₁)`; the relation module of `(z, z²)` in `𝒪_1` by `(z, −1)`.
- The cusp germ `w² − z³` is irreducible in `𝒪_2` though its zero set is singular; the node
  `w² − z² − z³` is reducible in `𝒪_2` (two branches `w = ±z√(1 + z)`) though irreducible as a
  polynomial. Factoriality is a statement about germs, not polynomials.
- The ring `𝒪_0` of a zero-dimensional manifold is `ℂ`, of Krull dimension `0`; `𝒪_1` is a
  discrete valuation ring, of dimension `1`, with uniformizer `z`.

*Needs:* 3.2; Mathlib `IsRegularLocalRing`, `ringKrullDim`, `UniqueFactorizationMonoid`;
Demailly, Chapter II, §§2–4.

### 3.5 Analytic subsets, singular loci and extension theorems

Define reduced analytic subsets, their dimension, regular and singular loci and locally finite
irreducible components. For every pure `k`-dimensional reduced analytic subset `V`, construct on
the subtype `Reg(V)` Layer 1's holomorphic-submanifold atlas with model `ℂ^k`; prove second
countability, the complex `IsManifold` instance, compatibility with the subspace topology, and
that its inclusion is a holomorphic embedding. Export 3.1's realification and the smooth
immersion and tangent comparisons. For subsets of mixed dimension apply this to each
constant-dimensional regular piece.

Prove that the singular locus of every reduced analytic subset is a closed analytic subset, of
strictly smaller complex dimension when nonempty (Demailly, Chapter II, (4.31)): use the local
generators of the reduced ideal and the holomorphic Jacobian criterion on each local irreducible
component, then include the intersections of distinct components; local parametrization and its
discriminant give density of regular points and the dimension drop. This covers subsets that
are not pure-dimensional. For a compact analytic subset `V`, build the finite descending
sequence `S₀ = V`, `S_(i+1) = Sing(S_i)` until it is empty; split each regular difference
`S_i ∖ S_(i+1)` by its constant complex dimension and connected components, and prove the pieces
lying in `V` are locally closed analytic submanifolds, semianalytic in the realified atlas. Prove
the family of pieces finite: each point of `V` has a neighbourhood meeting finitely many
components of each regular difference, because local parametrization gives finitely many
analytic branches through the point, each with connected regular locus on a small
neighbourhood; compactness of `V` then bounds the number of pieces, and the dimension drop
bounds the iteration count. The components of `M ∖ V` form a locally finite family, finite when
`M` is compact. The iterates can have components of different dimensions, so no whole regular
difference is given a single fixed-dimensional model. Prove the analytic closure theorem for a
regular-locus component and the locally finite global component decomposition. Prove an
irreducible reduced analytic subset has connected regular locus, and conversely, first for
hypersurfaces and then from local parametrization and density in general.

On a complex manifold, prove the Riemann extension theorem: locally bounded holomorphic
functions on the complement of a nowhere-dense analytic subset extend across it. Prove
**Hartogs extension** `hartogs_extension` on `ℂⁿ`, `n ≥ 2` (Demailly, Chapter I, (3.28)): for
an open `Ω` and a compact `K ⊆ Ω` with `Ω ∖ K` connected, every holomorphic function on `Ω ∖ K`
extends holomorphically to `Ω`; and its manifold form across an analytic subset `A` with
`dim_ℂ A ≤ n − 2` in an `n`-dimensional complex manifold, without a boundedness assumption. No
extension theorem for singular ambient spaces is asserted. Work out the node `z² = w² + w³` and
the cusp `z² = w³`, distinguishing global irreducibility from local analytic branches on the
actual zero sets and germs.

**Checks.**

- `Sing(z² = w³) = {0}`, of dimension `0 < 1`; `Sing({z₁ z₂ = 0}) = {0}`, the intersection of
  the two components; a smooth curve has empty singular locus.
- For `K = {0} ⊂ ℂ²` every holomorphic function on `ℂ² ∖ {0}` extends to `ℂ²` (7.3's Hopf
  input); for `n = 1`, `1/z` on `ℂ ∖ {0}` does not extend, so the hypothesis `n ≥ 2` is
  necessary; for `K` a closed spherical shell `{1 ≤ |z| ≤ 2}` in `ℂ²`, the complement is
  disconnected and the function equal to `1` inside and `0` outside does not extend, so the
  connectedness hypothesis is necessary.
- `z₁/z₂` is holomorphic on `{z₂ ≠ 0} ⊂ ℂ²` and unbounded near the hyperplane `z₂ = 0`, and
  does not extend: Riemann extension needs local boundedness in codimension one, while Hartogs
  extension across `{0}` (codimension two) needs none.
- For `V = {z₁ z₂ = 0} ∩ {|z| ≤ 1}`, the sequence is `S₀ = V`, `S₁ = {0}`, `S₂ = ∅`, and the
  regular pieces are the two punctured closed discs, each a connected one-dimensional
  submanifold.

*Needs:* 3.4; 1.2 for the submanifold atlas; 3.1 for the realification; Demailly, Chapter I,
(3.28) and Chapter II, (4.31).

### Examples

The Riemann sphere's analytic transitions (3.1); `w² − z` and `e^z w` (3.2); `1/(z − a)` and
`(z − a)^(−2)(1 + (z − a)²)` (3.3); the cusp and the node (3.4, 3.5); `ℂ² ∖ {0}` (3.5).

### Dependencies

Tau Ceti polydisc Cauchy theory and parametric circle integrals; Mathlib `smoothSheafCommRing`
and its stalk, `Filter.Germ`, `MeromorphicAt`, `IsRegularLocalRing`, `UniqueFactorizationMonoid`,
`MvPolynomial.mul_esymm_eq_sum`, `PowerSeries.IsWeierstrassFactorization`; ComplexManifolds
Milestone 1; RealAlgebraicGeometry Layer 7 (through 1.2);
1.2; Demailly, Chapters I–II; rainer-advanced-complex-analysis.

## Layer 4: holomorphic and Hermitian bundles (K4)

### 4.1 Holomorphic bundles and their section sheaves

Consume ComplexManifolds Milestone 7's holomorphic-transition mixin on the native bundle,
cocycle gluing, tensor, dual and exterior operations and the canonical bundle `Ω^n`. Construct
the holomorphic `Hom(E, F) ≃ E* ⊗ F` comparison from those operations, and compare the
underlying smooth complex bundles with SmoothBundlesConnections B2.1. Build holomorphic
sections and their local frame, transition and restriction formulas. Supply the
`RingCat`-valued holomorphic structure sheaf `R` for `SheafOfModules`: compose 3.2's
`smoothSheafCommRing` with `forget₂ CommRingCat RingCat` and verify the sheaf condition. For
each open `U`, identify the structure sheaf on `U` with `R` restricted by `sheafRestrict`,
compatibly with ring operations, restrictions and germ maps, and use
`Opens.overPullbackSheafEquivOver` to compare with the over-site carrier. These are the
ring-sheaf inputs for bundle sections here and for RealAnalyticGeometry R3.2's coherent analytic
sheaves.

For a fixed finite-dimensional complex normed model `F` and every native `VectorBundle ℂ F E`
with that mixin, construct the sheaf of holomorphic sections in `SheafOfModules` over `R`. Put
`r = finrank ℂ F`. Define sections by holomorphic local frame coordinates, prove frame
independence and local freeness of rank `r` at every point, and compare with sections of the
bundle glued by Milestone 7 from a holomorphic `GL_r` cocycle. Conversely reconstruct the native
`F`-bundle from a locally free `𝒪`-module of rank `r` at every point, transporting its local
bases to `F`. Prove the section/reconstruction equivalence, including morphisms and pullbacks.
This fixed-model theorem does not identify a varying-rank sheaf with a single
`VectorBundle ℂ F E`; 4.4 supplies the locally finite-rank scope. ComplexComparisonPartII C−1.1, C0.4
and C5.1–C5.2 and FormalConnectionsOpers F2.4 consume this layer's holomorphic bundle and
connection carriers for analytification; this layer constructs no algebraic analytification.

**Checks.**

- The sections of the trivial line bundle are the holomorphic functions, and its section sheaf
  is `𝒪` itself, free of rank `1`.
- The section sheaf of `O(1)` on `ℂP¹` (7.2) is locally free of rank `1` with global sections
  the linear forms, of dimension `2`; a sheaf with global sections of dimension `3` is `O(2)`'s,
  so the transition cocycle, not only the rank, determines the bundle.
- A locally free module whose rank is `1` on one component and `2` on another is not the
  section sheaf of any fixed-model bundle `VectorBundle ℂ F E`; 4.4 handles it.

*Needs:* ComplexManifolds Milestone 7; SmoothBundlesConnections B2.1; 3.2; Mathlib
`SheafOfModules`, `sheafRestrict`, `Opens.overPullbackSheafEquivOver`.

### 4.2 Chern connections and Koszul–Malgrange

Prove existence and uniqueness of the **Chern connection** on a Hermitian holomorphic bundle
(Ballmann, Theorem 3.18; Demailly, Chapter V, §12), with `(0,1)` part `∂̄_E` and metric
compatibility; prove the local formula `A = h⁻¹∂h`, curvature of type `(1,1)` (Demailly,
Chapter V, (12.4)), frame independence, tensor, dual and pullback formulas. Construct Dolbeault
operators on complex bundles and prove **Koszul–Malgrange**: an integrable `(0,1)` connection
gives a holomorphic bundle structure recovering the given operator, sections being holomorphic
exactly when `∂̄_E s = 0`. Build its local frame-solving theorem and gluing, first in rank one
and then at arbitrary fixed finite rank. For rank `r`, build the induced almost complex structure
on the total space from the `(0,1)` connection, prove its Nijenhuis tensor vanishes iff the
connection is integrable, and apply 1.4's Newlander–Nirenberg theorem to obtain local
holomorphic bundle frames; prove projection, fibre addition and scalar multiplication
holomorphic for that structure. Use 1.2's holomorphic implicit-function theorem to obtain local
sections through a basis and prove they remain a frame, giving compatibility with the fibrewise
complex-linear structure. This supplies the nonlinear rank-`r` solvability step rather than
assuming scalar `∂̄` solves a matrix equation. GeometricQuantization consumes this holomorphic
prequantum line dictionary.

**Checks.**

- On the trivial line with metric `h = e^(−φ)`, `A = −∂φ` and the curvature is `∂∂̄φ`, of type
  `(1,1)`; for `h = 1` the Chern connection is `d`.
- On `O(1)` over the chart `ℂ ⊂ ℂP¹` with `h = (1 + |z|²)^(−1)`, the curvature is
  `∂∂̄ log(1 + |z|²) = −2πi ω_FS`, pinning the sign of the Conventions.
- On a trivial line over a curve, the operator `∂̄ + a` with `a` a smooth `(0,1)`-form is
  automatically integrable, and its holomorphic functions are `e^(−u) f` with `∂̄u = a` and `f`
  holomorphic; for `a = 0` the holomorphic structure is the standard one, and a definition that
  took `a` instead of `−a` in the gauge would give `e^(u) f`, which does not satisfy
  `(∂̄ + a)(e^u f) = 0`.

*Needs:* 4.1; 1.2; 1.4; Ballmann, Theorem 3.18; Demailly, Chapter V, §12.

### 4.3 Holomorphic connections and local systems

Define a holomorphic connection on a holomorphic bundle `E` as a `ℂ`-linear sheaf operator
`∇ : E → Ω¹_hol ⊗ E` with `∇(fs) = df ⊗ s + f∇s`; its contraction with a holomorphic vector field
is `𝒪`-linear in that field. Give local holomorphic connection matrices, their gauge-change law,
pullback, tensor, dual and Hom operations and curvature. Construct the smooth connection `D`
agreeing with `∇` on local holomorphic sections and prove uniqueness; it has `(0,1)` part `∂̄_E`
and holomorphic `(1,0)` coefficients, and prove the converse. Prove `D²` equals the holomorphic
curvature `∇²` viewed as a smooth `(2,0)`-form, so their flatness criteria coincide; every
holomorphic connection on a complex curve is flat (this concerns holomorphic connections; the
Chern connection of 4.2 has `(1,1)` curvature). For flat holomorphic connections prove parallel
local frames are holomorphic. With a frame `e` at a basepoint, continue it along `γ` to
`e_γ = e · M(γ)`, and pin `T_γ ∘ e = e ∘ M(γ)`, where `T_γ` is SmoothBundlesConnections B5's
source-to-target parallel transport; thus `M(γ) = e⁻¹ T_γ e`, with the same frame-bundle
holonomy, not its inverse. The inverse in B5's deck quotient remains in that quotient action.
Prove the flat correspondence first at fixed rank `r` on the native fixed-model bundles; its
local-system carrier is a functor from `FundamentalGroupoid M` to `ModuleCat ℂ` whose value at
every object has dimension `r`, including all connection-preserving fibrewise linear maps and
natural transformations, not only isomorphisms.

**Checks.**

- On the trivial line over `ℂ ∖ {0}` with `∇ = d + λ dz/z`, the parallel sections are
  `c z^(−λ)` and the monodromy around the unit circle in the frame `e = 1` is
  `M(γ) = e^(−2πiλ)`; for `λ = 1/2` it is `−1`, and the opposite sign convention would give the
  inverse `e^(2πiλ)`, which agrees only for `λ ∈ ℤ/2`.
- Every holomorphic connection on a curve is flat because holomorphic `(2,0)`-forms vanish on a
  curve; on `ℂ²`, `∇ = d + z₂ dz₁` has curvature `dz₂ ∧ dz₁ ≠ 0`, so flatness is a condition in
  dimension two.
- The smooth connection `D` of `∇ = d + λ dz/z` has `(0,1)` part `∂̄` and `(1,0)` coefficient
  `λ dz/z`; a `D` with `(0,1)` part `∂̄ + a`, `a ≠ 0`, does not come from a holomorphic
  connection on the given holomorphic structure.

*Needs:* 4.1; 4.2; SmoothBundlesConnections B5.0, B5.2; Mathlib `FundamentalGroupoid`.

### 4.4 Componentwise finite-rank assembly (K4.ComponentwiseFiniteRankAssembly)

Retain the full pointwise finite-dimensional scope on a disconnected `M`: local systems have
finite-dimensional values at each object, with no uniform bound on their dimensions. Prove that
connected components `C` of `M` are open complex submanifolds, that their disjoint union is
homeomorphic to `M`, and that the rank is constant on each component. For an arbitrary rank
function `r : ConnectedComponents M → ℕ`, use the model `F_C = (Fin (r C) → ℂ)` on `C` and
Milestone 7's native fixed-`F` construction there. Define the componentwise category of these
native bundles with connections; its morphisms are families of connection-preserving linear
bundle maps, including maps between objects with different rank functions. Construct the
assembly over `M` with fibre at `x` the fibre over `x` in its component, and total space the
disjoint union of the component total spaces; give its local charts, smooth and holomorphic
transition comparisons and projection on the open component cover; reconstruct its sheaf of
sections by sections over `U ∩ C`, with componentwise connections and restriction and gluing.
Prove restriction and assembly inverse up to natural bundle and sheaf isomorphism. This is an
explicit family-and-assembly adapter on native fixed-model bundles, not a purported global
`VectorBundle ℂ F E` instance with varying `finrank ℂ F`.

Apply restriction and assembly and the fixed-rank section/reconstruction theorem also without a
connection: locally free `𝒪`-modules of arbitrary locally constant finite rank correspond to
componentwise native holomorphic bundles, with all holomorphic fibrewise linear maps, using the
same section sheaf on the open component cover; no flatness is imposed on this comparison.

Use the absence of paths between distinct components to compare the full componentwise
category with pointwise finite-dimensional functors on `FundamentalGroupoid M` and with locally
constant sheaves of `ℂ`-modules having finite-dimensional stalks. Prove the three category
equivalences for flat holomorphic connections, flat smooth `ℂ`-linear connections and those
local systems, and recover the equivalences of isomorphism groupoids. Use local parallel frames
and path transport, including inverse sheaf gluing, stalk and monodromy naturality. Extract
`(D^(0,1), D^(1,0))` by Koszul–Malgrange. Construct the inverse holomorphic object as `L ⊗ 𝒪`
with connection `1 ⊗ d`, using constant `GL_(r C)` transition cocycles componentwise, and
identify its section sheaf with that tensor sheaf. Include units, counits, all morphisms and
naturality under holomorphic pullback, with the rank function pulled back along the induced
component map. Cover rank zero and the empty base, and permit unbounded ranks across infinitely
many components. These constructions keep the analytic correspondence on the componentwise
carriers without changing the fixed finite-rank hypotheses of the elliptic theorems of Layer 5.

For bundle-valued forms construct `∂_∇`, `∂̄` and curvature identities on the pinned form
carrier. Prove the torsion tensor and Cartan frame structure equations for tangent connections,
consuming the existing covariant-derivative curvature and torsion laws and translating frame
conventions; the dual and tensor-connection exercises are specializations of
SmoothBundlesConnections B3, not new connection objects.

**Checks.**

- For `M` two points with ranks `1` and `2`, the assembled total space is `ℂ ⊔ ℂ²`, its sheaf
  of sections has stalks `ℂ` and `ℂ²`, and the local system is the pair of vector spaces with
  no transport between them.
- A morphism from the rank function `(1, 2)` to `(2, 1)` is a pair of linear maps
  `ℂ → ℂ²`, `ℂ² → ℂ`; a definition admitting only isomorphisms would exclude it.
- The empty base has the zero rank function and the terminal category; a single connected
  component recovers 4.3's fixed-rank equivalence, with `r C = r`.

*Needs:* 4.1; 4.3; ComplexManifolds Milestone 7; SmoothBundlesConnections B3.

### Examples

The trivial line with metric `e^(−φ)`; `O(1)` on `ℂP¹` with the Fubini–Study metric; the
connection `d + λ dz/z` on `ℂ ∖ {0}`; the two-point base with ranks `1` and `2`.

### Dependencies

ComplexManifolds Milestone 7; SmoothBundlesConnections B2.1, B3, B5; 1.2, 1.4, 3.2; Mathlib
`SheafOfModules`, `FundamentalGroupoid`; Ballmann; Demailly, Chapter V.

## Layer 5: compact Hermitian elliptic theory and Serre duality (K5)

Subsections 5.1–5.8 (K5a) are real and complex-coefficient analysis on real manifolds; they use
DifferentialGeometry, SmoothBundlesConnections B2–B4, PDE §1.3, VariationalMethods §2.2–§5.2,
UnboundedOperators §4.7, AlgebraicTopology and Mathlib, with Mathlib's
`CovariantDerivative.leviCivitaConnection` as the base connection. Subsections 5.9–5.10 (K5b)
are their complex-manifold and holomorphic-bundle applications. PseudodifferentialOperators,
RiemannianGeometry, SpinGeometry, HeegaardFloer, Hyperfunctions, RelativisticQuantumFieldTheory
and HamiltonianReduction consume 5.1–5.8; nothing of PseudodifferentialOperators is consumed
here.

### 5.1 Pointwise algebra, densities, bundle tests and distributions (K5a)

Consume SmoothBundlesConnections B2.2's `RCLike` `L²` section construction. The bundle is
DifferentialGeometry's alternating bundle `V_x = T_xM [⋀^Fin k]→L[ℝ] E_x`, with `E_x = 𝕜` in the
scalar cases. Prove its identification with the exterior-power bundle, its `VectorBundle 𝕜`
structure and the basis-independent `Gram ⊗ h_E` metric as B2.2's fibre metric
`h.inner x : V_x →L⋆[𝕜] V_x →L[𝕜] 𝕜`, with chartwise smoothness and positivity. Use
`μ = TauCeti.riemannianVolume I M`; consume DifferentialGeometry 12.4's full-support comparison
to provide B2.2's `IsOpenPosMeasure μ`, and the pinned `isLocallyFiniteMeasure_riemannianVolume`
with its finite-dimensional, continuous-metric, Borel and Lindelöf hypotheses (second
countability supplies Lindelöf). Use B2.4's compactly supported smooth densities and
`MeasureTheory.Lp` comparison on these bundles.

Pin the pointwise product on exterior forms by Gram determinants, making increasing wedges of
an orthonormal real coframe orthonormal (not summing over all ordered tuples). The real Hodge
star is the pinned `TauCeti.SmoothForm.hodgeStar o hkl` on an oriented manifold, with
`hodgeStar_hodgeStar` (`⋆⋆ = (−1)^(k·l)` for `k + l = m`, that is `(−1)^(k(m−k))`),
`inner_smul_riemannianVolumeForm_eq_wedge_hodgeStar` (`⟨α,β⟩ vol = α ∧ ⋆β`, `vol` the native
volume form) and `hodgeStar_neg_orientation`; the codifferential is the pinned `codifferential`
with `hodgeStar_codifferential` and `integralTopForm_inner_mextDeriv_eq_inner_codifferential`.
Own what the pin lacks: isometry and oriented-isometry naturality of the star, the wedge and
contraction adjoint identities, and the unoriented case. Construct the orientation line from the
sign-of-determinant tangent-frame transition cocycle, identify its square with the trivial line
and its oriented trivializations with DifferentialGeometry's orientations; without an
orientation the star codomain is twisted by this line and its local sign changes glue. This
pointwise algebra precedes the elliptic scale; RiemannianGeometry and SpinGeometry consume it
for their Clifford–star and chirality comparisons. Complex-linearly extend the real star to the
complexified exterior algebra and pin `α ∧ ⋆β = B_ℂ(α,β) vol = ⟨bar α, β⟩_Gram vol`, where
`B_ℂ` is the bilinear extension of the real Gram product and the Hermitian product is
conjugate-linear in its first slot. Define `barStar β = ⋆(bar β)` on these complexified real
forms and prove `α ∧ barStar β = ⟨β, α⟩ vol`. For a finite-dimensional orthogonal complex
structure on the real fibre, prove the pointwise `(p,q)` type law for the star and `barStar` on
its complexified exterior algebra; this algebra uses no integrability or holomorphic bundle, and
5.9 transports the law to type bundles.

Equip DifferentialGeometry 5.5's `Density V (finrank ℝ V)` with pointwise `AddCommGroup` and
`Module ℝ` extending its `SMul ℝ`, prove evaluation on any basis a linear equivalence with `ℝ`,
and transport its rank-one topology through this equivalence, proving basis independence and
continuity of the `|det|` action. Construct the smooth real density line bundle of `M`, with
local transition `|det D(chart change)|`, its dual, tensor and pullback maps and its
`ContMDiffVectorBundle ∞` structure; identify its smooth sections with the chart-smooth values of
5.5's `RoughDensity` carrier, and scalar-extend it to `𝕜` for complex coefficient bundles.
Define the bundle tests of `E` as the compactly supported smooth sections of
`E* ⊗ (density line)`, using `ContMDiffSection` with `ContMDiffVectorBundle ∞` and fixed-compact
derivative seminorms. Prove equivalence with chart and frame seminorms and independence of atlas
and auxiliary connection on each fixed compact support. Equip the tests with the final locally
convex topology for the chart and frame extension maps from `TestFunction Ω F ⊤`, pinned by
their extension-by-zero formula, and prove the universal continuity criterion: a linear map
into a locally convex space is continuous iff its compositions with every such native test map
are continuous. Prove this topology equals the fixed-compact inductive limit and its real and
complex scalar compatibility. Define the bundle distributions of `E` as the continuous linear
functionals on the tests with the compact-convergence topology, matching `Distribution Ω F ⊤`;
keep the pointwise topology of `TemperedDistribution` distinct, and prove the localized
test-pairing maps into these carriers continuous by uniform estimates on compact test families,
without identifying topologies. Build frame, chart, restriction and gluing comparisons with
native real-test `F`-valued distributions. For `𝕜 = ℂ` complex-linearly extend real tests and
prove compatibility with `TemperedDistribution`'s complex-test convention. Prove compactly
supported Euclidean distributions extend uniquely to tempered distributions after cutoff, with
the explicit test pairing and cutoff independence on their support, and finite derivative order
on each fixed compact support.

For every real bundle `V`, consume B2.1's fibres `ℂ ⊗_ℝ V_x`, their inclusion and conjugation
and the dual and tensor comparison for density-valued tests. Prove the real topological linear
equivalence from the tests of `V_ℂ` to pairs of real tests of `V`, `φ = ι(φ_R) + iι(φ_I)`, with
multiplication by `i` corresponding to `(φ_R, φ_I) ↦ (−φ_I, φ_R)` and conjugation to
`(φ_R, −φ_I)`, continuous in the LF topologies. Construct the real-linear continuous extension
of real distributions, `u_ℂ(φ) = u(φ_R) + i u(φ_I)`, and its inverse on fixed points by
evaluation on included real tests; construct distribution conjugation `κu(φ) = conj(u(κφ))` as a
continuous real-linear involution and prove the extension image is exactly its fixed-point
subspace, with the compact-convergence subspace topology.

**Checks.**

- The Hodge star of `dx` on oriented `ℝ²` is `dy` and `⋆⋆dx = −dx`, the sign
  `(−1)^(1·1)` of `hodgeStar_hodgeStar`; on `ℝ³`, `⋆⋆ = +1` on one-forms.
- The density line of the Möbius band is trivial (a positive smooth density exists on every
  manifold) while its orientation line is not: densities and orientations are different
  objects, which the twisted star records.
- A smooth section `s` of `E` defines the distribution `φ ↦ ∫ ⟨φ, s⟩`, injectively; on `ℝⁿ`
  with the Lebesgue density the tests of the trivial line are `TestFunction` and the
  distributions are `Distribution`.
- Bumps `φ_j` of height `1` supported in `[j, j+1]` do not converge to `0` in the LF topology
  (the functional `φ ↦ Σ_j j φ(j + 1/2)` is continuous and unbounded on them), though they
  converge to `0` in every fixed-compact seminorm.
- Complexification of the real distribution `δ₀` on `ℝ` is `φ ↦ φ_R(0) + i φ_I(0) = φ(0)`, and
  conjugation fixes it; `i δ₀` is not fixed.

*Needs:* SmoothBundlesConnections B2.1–B2.4; DifferentialGeometry 5.5, 12.4; Tau Ceti
`hodgeStar`, `codifferential`, `riemannianVolume`, `isLocallyFiniteMeasure_riemannianVolume`;
Mathlib `ContMDiffSection`, `TestFunction`, `TestFunction.continuous_iff_continuous_comp`,
`Distribution`, `TemperedDistribution`.

### 5.2 Differential operators, symbols and formal adjoints (K5a)

Own the differential-operator core that this layer's analysis uses. Define a linear differential
operator of order at most `m` from a finite-rank bundle `E` to `F` over `[RCLike 𝕜]` as a
linear map on smooth sections that is local and, in every chart and pair of frames, is
`Σ_(|α|≤m) A_α(x) ∂^α` with smooth matrix coefficients; prove the chart-change law of the
coefficients, restriction to open sets, composition (orders add), the order-zero case
(bundle homomorphisms), and that covariant derivatives, the exterior derivative, `∂̄` and rough
Laplacians of SmoothBundlesConnections B3 connections are differential operators of orders `1`,
`1`, `1` and `2`. Define the Fourier principal symbol `σ_F(P)(x, ξ) = Σ_(|α|=m) A_α(x)(iξ)^α` on
the cotangent bundle with the convention `σ_F(∂_j) = iξ_j` (complexify real operators), prove
it well defined, multiplicative and compatible with restriction and frame change, and the
geometric symbol `σ_geom(P)(df) = (1/m!)[…[P, f], …, f]` (`m` commutators) with its comparison
`σ_F = i^m σ_geom`. Define the Laplace-type predicate: order at most `2` and Fourier principal
symbol `c |ξ|²_g Id` for a fixed `c > 0`; prove restriction, frame invariance, positive rescaling
and the `c = 1` comparison, and that `∇*∇` for a metric connection is Laplace-type with `c = 1`.
Construct the bilinear density transpose `P^t` on density-valued tests and the metric formal
adjoint `P*` by their local derivative formulas, prove integration by parts on compact supports,
reversal of composition and compatibility with restriction, and define the action of `P` on
bundle distributions by transposition, agreeing with `P` on smooth sections. These definitions
are the chart-local ones; PseudodifferentialOperators P1.0 owns jet bundles, the
iterated-commutator characterization of the order filtration and the connection expansion of
symbols, and consumes this core.

**Checks.**

- For `D = ∂ + 3` on the trivial real line, `D(1) = 3` and `D(x²)` at `x = 2` is `4 + 12 = 16`;
  its Fourier symbol at `ξ = 2` is `2i`, its geometric symbol `2`.
- For `P = a(x)∂` on the trivial line with density `dx`, `P* = −conj(a)∂ − conj(a′)`; at
  `a = x` the zeroth-order term is `−1`, so merely negating the leading derivative is wrong.
- `Δ_d = −Σ ∂_j²` on functions on `ℝⁿ` has Fourier symbol `|ξ|²` (`c = 1`); on `ℂ` with the
  standard metric, `Δ_∂̄ = ∂̄*∂̄ = −2∂_z∂_z̄ = −(1/2)(∂_x² + ∂_y²)` on functions has symbol
  `(1/2)|ξ|²` (`c = 1/2`); the first-order operator `d` is not Laplace-type.
- Multiplication by `3` has zero commutator with every scalar function but is not the zero
  operator: order zero is a nonzero class.

*Needs:* 5.1; SmoothBundlesConnections B3–B4; Mathlib `CovariantDerivative.leviCivitaConnection`.

### 5.3 Distribution local structure (K5a.DistributionLocalStructure)

Own the continuous-primitive and supported finite-jet structure on these distribution carriers
(Hörmander, Theorems 2.3.4 and 2.3.5), before their consumers.

For an interval `I` and `J` relatively compact in `I`, choose `χ ∈ C_c^∞(I)` equal to `1` near
the closure of `J`, and `χ̃ ∈ C_c^∞(I)` equal to `1` near `supp χ`. Put `w = χu`, extended by
`0` to `ℝ`. Choose compact support stages around both cutoffs and prove a finite order `k` for
`w` there. Prove the density and extension theorem from smooth tests to `C^k` compact tests on a
slightly larger stage, by mollification with support control and the `C^k` bound; express the
result on the order-indexed `Distribution Ω F (k : ℕ∞)` carrier and its smooth-test restriction,
keeping its native compact-convergence topology and proving the restriction map continuous
without identifying the finite-order topology with a subspace topology on `Distribution Ω F ⊤`.
Use `χ̃` to pair `w` with arbitrary `C^k` functions near its compact support, and prove
independence of this second cutoff. For `m ≥ k + 2` put `H_m(t) = t_+^(m−1)/(m−1)!`, which is
`C^(m−2)`. Define `F(x) = ⟨w(t), χ̃(t) H_m(x − t)⟩` using that finite-order extension; prove
continuity from `C^k` translation continuity on the common compact `t`-stage, and the pairing
identity `⟨F, ψ⟩ = ⟨w, χ̃(t) ∫_ℝ H_m(x − t) ψ(x) dx⟩` for every compact smooth `ψ`, by a Fubini
interchange in the `C^k` test topology, even though `H_m` is noncompact and not smooth. Its
distribution derivative `D^m H_m = δ` and the pairing identity give `D^m F = w`, hence
`D^m F = u` on `J`. The order is that of `w`, not of an unspecified uncut distribution.

Own the supported finite-jet structure. For a closed embedded submanifold `S` of codimension
`q`, in every product normal chart `(y, z)`, prove that a distribution supported in `S` has a
locally finite-order expression `u = Σ_(|α|≤N) u_α(y) ⊗ ∂_z^α δ(z)` on compact chart stages,
with unique tangential distribution coefficients; `N` may depend on the stage. Construct the
coefficients by proper normal projection of `z^β` times `u` with a cutoff equal to `1` near
`S`, giving `(−1)^|β| β! u_β`, and prove by the Taylor–Hadamard remainder argument that the
remaining distribution vanishes. Prove restriction, chart, density and bundle transport and
compatibility of finite stages; coordinate normal jets transform by their normal-jet law. For
`S` a point, deduce finite delta-derivative sums and linear independence. For scalar pullback
under positive dilation prove `∂^α δ` has degree `−q − |α|`. Application-specific scaling and
wavefront bounds belong to the consumers.

For every `n ≥ 1` own the nonextension example `exp(1/‖x‖²)` on the punctured Euclidean space.
Choose a nonzero nonnegative smooth bump `φ` supported in the unit ball and `0 < c < 1/4`, put
`φ_ε(x) = φ((x − εe₁)/(cε))`; all small supports lie in one fixed compact ball and avoid `0`. A
finite-order extension would bound its value by `C ε^(−N)`, while its positive punctured-domain
integral is at least `C′ ε^n exp((1 + c)^(−2) ε^(−2))`, a contradiction for every finite `N`.
Transport by the Euclidean chart comparison; dimension `0` is separate. Own the delta-series
failure: with a compact smooth test equal near `0` to `1/(1 + 2x)` and supported inside
`(−1/4, 1/4)`, `⟨δ^(n)/n!, φ⟩ = 2^n`, so the partial sums of `Σ δ^(n)/n!` do not converge in
`𝒟′`. The point-supported analytic-functional interpretation belongs to Hyperfunctions HF5;
these generic theorems supply the Hyperfunctions and RelativisticQuantumFieldTheory examples
and use no hyperfunction or renormalization theorem.

**Checks.**

- For `w = δ` on `ℝ` (`k = 0`, `m = 2`), `F(x) = H₂(x) = x_+` is continuous and `D²F = δ`;
  with `m = 1`, `H₁ = 1_(t>0)` is not continuous, which is why `m ≥ k + 2`.
- For `u = δ′` at a point of `ℝ`, the coefficient formula gives `u₁ = 1` from
  `⟨z u, 1⟩ = ⟨δ′, z⟩ = −1 = (−1)^1 1! u₁`; the dilation degree of `δ′` on `ℝ` is `−2`, of `δ`
  on `ℝ^q` is `−q`.
- `⟨δ^(n)/n!, φ⟩ = (−1)^n φ^(n)(0)/n! = (−1)^n (−2)^n = 2^n` for `φ = 1/(1 + 2x)` near `0`;
  for the test `φ = 1/(1 − 2x)` the values would be `(−2)^n`, equally divergent.
- On the support ball of `φ_ε`, `|x| ≤ (1 + c)ε`, so `exp(1/|x|²) ≥ exp((1 + c)^(−2) ε^(−2))`
  and the integral is at least that times `(cε)^n ∫φ`.

*Needs:* 5.1; Mathlib `Distribution Ω F n`; hormander-alpdo1, Theorems 2.3.4 and 2.3.5.

### 5.4 The smooth-section Fréchet topology and the Montel property (K5a.SmoothSectionMontel)

Construct the Fréchet topology on all smooth sections of every finite-rank bundle, including
`E* ⊗ (density line)`, from a countable exhaustion by compact chart and frame sets and all
derivative seminorms; prove completeness, atlas independence and continuous restriction.
Identify its continuous dual with compactly supported distributions: continuity bounds the
pairing by finitely many seminorms and hence forces compact support. For a finite-dimensional
second-countable Hausdorff manifold `M` and a finite-rank real or complex bundle `E`, prove
every bounded subset has compact closure: on each compact chart set apply Arzelà–Ascoli to every
derivative using the next derivative bound, choose a diagonal subsequence along the exhaustion
and derivative orders, and show the limits are compatible smooth sections; include finite,
disconnected and compact `M`. Install the native `MontelSpace` instance; do not define another
Montel predicate. Consume `ContinuousLinearEquiv.toCompactConvergenceCLM` for the strong/
compact-convergence comparison of the dual, supplying the Hausdorff and scalar hypotheses; its
two continuity directions use that compact sets are von Neumann bounded and every bounded set
lies in its compact closure. The new targets are the smooth-section Montel instance and its
bundle and density adapters, transported through the trivializations of 5.1. This comparison
supplies the strong dual on Euclidean configuration spaces and on the compact sphere; it does
not identify the LF test topology or the pointwise Schwartz-dual topology with either topology
by notation. HeegaardFloer, Hyperfunctions and RelativisticQuantumFieldTheory consume this
carrier.

**Checks.**

- On the circle, `sin(jx)/j` converges to `0` in `C⁰` but not in `C¹` (its derivatives
  `cos(jx)` have sup norm `1`), and its second derivatives `−j sin(jx)` are unbounded, so it is
  neither convergent nor bounded in the Fréchet topology.
- The functional `φ ↦ Σ_(j∈ℕ) φ(j)` on `C^∞(ℝ)` is not continuous (no finite compact bounds
  it), while `φ ↦ φ(0) + φ′(1)` is, with support `{0, 1}`.
- The `C⁰` unit ball of `C(S¹)` is not relatively compact (`sin(jx)` has no convergent
  subsequence), so the Banach space `C(S¹)` is not Montel; the set of smooth functions with all
  derivatives bounded by `1` is relatively compact in `C^∞(S¹)` by Arzelà–Ascoli.

*Needs:* 5.1; Mathlib `MontelSpace`, `ContinuousLinearEquiv.toCompactConvergenceCLM`.

### 5.5 The compact-bundle Sobolev scale (K5a)

For compact `M` define the Sobolev space `H^s(E)`, `s ∈ ℝ`, as the subspace of bundle
distributions whose localizations `χ_i u` in a fixed finite smooth bundle atlas, after tempered
extension, satisfy `TemperedDistribution.MemSobolev s 2`, bundled in
`BesselPotentialSpace ℝⁿ F_i s 2`. Choose a real continuous linear equivalence from the model
space of `M` to `EuclideanSpace ℝ (Fin n)`, finite-dimensional complex Hilbert fibre models
`F_i` and cutoffs `χ_i` supported inside chart and frame domains with `Σ χ_i² = 1`; extension by
zero is distributional. Pin the norm `‖u‖² = Σ_i ‖χ_i u‖²_(Bessel s)`. Prove the localization map
injective with closed image in `PiLp 2` of those complete spaces, by overlap compatibility and
the reconstruction `Σ χ_i(χ_i u)`, after the Euclidean cutoff and chart-change estimates below.
Define `H^s_loc` on noncompact `M` by membership of every compactly supported chart localization,
with its localization seminorm topology. For real bundles use the complexification and the
real-distribution comparison of 5.1, not an unidentified subspace of complex distributions:
equip complexified real Hilbert fibre models, identified with `EuclideanSpace ℂ (Fin r)`, with
the sesquilinear extension `h(a + ib, c + id) = g(a,c) + g(b,d) + i(g(a,d) − g(b,c))`; the real
inclusion is isometric and componentwise `star` is antiunitary. Construct conjugation on Schwartz
functions, tempered distributions and Bessel spaces; Fourier conjugation includes the reflection
`ξ ↦ −ξ`, and since the real-order Bessel symbol is real and even, conjugation commutes with
`besselPotential` and is isometric on every `H^s`, including negative `s`. Choose real cutoffs
and complexified real frames; localization, tempered extension and reconstruction commute with
conjugation, so the fixed part of the closed compatible-tuple carrier is a closed real Hilbert
subspace with inner product `Re⟨·,·⟩`, canonically a subspace of the real bundle distributions.
Prove real chart independence, norm equivalence, density and all scale, duality and regularity
comparisons on this carrier, and the real `H^s_loc`. Consume B2.1's isometric geometric
`L²(V_ℂ)` complexification; at `s = 0` compose it with the distribution extension to give the
real `H⁰(V) ≃L[ℝ] L²(V)` with the same distributional image and equivalent norms (the
complexification identity is isometric; the `s = 0` comparison with the atlas norm is a norm
equivalence). Real adjoints and orthogonal projections use the geometric inner product.

Before chart estimates, construct the Euclidean bilinear density pairing on
`BesselPotentialSpace` `H^s(ℝⁿ; F) × H^(−s)(ℝⁿ; F*) → 𝕜`, and prove its continuous-dual
identification by weighted Plancherel and reciprocal Fourier weights, first on Schwartz
functions and then by density; this Euclidean duality precedes the bundle carrier's closed-image
argument. In the complex Euclidean case compare the Fourier-side bilinear pairing
`B_F(f,g) = ∫ f̂(ξ) ĝ(ξ) dξ` with the spatial pairing `B₀(f,g) = ∫ f(x) g(x) dx`: for
`Rg(x) = g(−x)`, `B_F(f,g) = B₀(f, Rg)` by bilinear Plancherel, `R` is an involutive isometry on
every real-order `H^s`, and the two transposes satisfy `T^(t_F) = R T^(t₀) R` on Schwartz
functions. Prove the abstract reciprocal-Fourier-weight duality lemma with its pairing
normalization and the transpose bound with the same constant in matched primal and dual norms;
apply it to the Bessel norms and to angular-weight norms with their constant, then extend by
density. For matrix multiplication the `B_F` transpose is multiplication by `A(−x)ᵀ`, not a
Hermitian adjoint.

Consume PDE §1.3 (A3)'s Euclidean `H^(k,2) = W^(k,2)` comparison with equivalent norms for every
nonnegative integer `k`, componentwise in each fibre model. Construct pullback of distributions
by smooth diffeomorphisms using the dual density pushforward and its Jacobian, with support,
composition and localized tempered comparisons. Prove multiplication and compactly localized
chart-change estimates first at nonnegative integer orders by the chain rule, coefficient
derivative bounds and the Jacobian change of variables; obtain negative integers by transpose
and density. Build the `p = 2` Hilbert interpolation theorem from weighted Fourier `L²`,
`verticalClosedStrip`, `DiffContOnCl`,
`Complex.HadamardThreeLines.norm_le_interp_of_mem_verticalClosedStrip'` and the bounded-operator
interpolation argument; PDE §2.2 (B9) supplies the distinct `L^p` Riesz–Thorin theorem.
Construct complex-order multipliers `Λ^z` from `fourierMultiplierCLM` with symbol
`exp((z/2) log(1 + |ζ|²))`, prove temperate growth at each `z`, analytic dependence and
imaginary-axis `L²` isometry; apply three-lines first to Schwartz functions with smooth
compactly supported Fourier transform, then extend to every real `s`. Prove choice-independent
equivalent norms, smooth density, the connection `W^(k,2)` comparison and localization
naturality. Own global matrix multiplication by every smooth `A : ℝⁿ → Hom(F, G)` with all
derivatives, including order `0`, uniformly bounded: bounded `H^s → H^s` for each real `s` by the
integer Leibniz estimates, density transpose and interpolation. Prove the differential-operator
mapping theorem: for every differential operator `P` of 5.2 of order at most `m`,
`P : H^(s+m)(E) →L[𝕜] H^s(F)` for every real `s` on a compact base, with cutoff and local
versions on chart domains, from the Fourier-multiplier bound for each `∂_j` composed with the
matrix multipliers in `P`'s local formula, patched by the localization maps. For a smooth
diffeomorphism `φ : ℝⁿ → ℝⁿ` whose positive-order derivatives and those of `φ⁻¹` are uniformly
bounded, prove pullback extends to a continuous linear isomorphism of each `H^s` inverse to
pullback by `φ⁻¹`, agreeing with distributional pullback: construct the tempered pullback first
by proving the dual density pushforward `f ↦ |det Dφ⁻¹| (f ∘ φ⁻¹)` continuous on Schwartz
functions (bounded first derivatives give linear growth and properness, higher bounds control
each seminorm), define pullback on tempered distributions by this transpose, and compare with the
local construction; the adjoint at negative orders includes the Jacobian factor. For bounded
smooth domains `U, V`, define a smooth diffeomorphism of their closures as a mutually inverse
pair satisfying `ContDiffOn ℝ ∞` on each closure; construct extension across a smooth boundary
by a collar, the half-space Seeley extension and a finite partition of unity, with derivative
estimates; extend such a closure diffeomorphism to open neighbourhoods by the inverse function
theorem and compactness; prove the estimate on `C_c^∞(V)` with both norms computed after zero
extension, and export the completion isomorphism and its compatibility with distributional
pullback (the completion of tests in the whole-space norm is not the restriction Sobolev space).

Prove for every real `s` the weight equivalence `(1 + |ξ|)^(2s) ≍ (1 + |ξ|²)^s` with explicit
constants (`1` and `2^|s|`), and compare the completed norms before using either weight. Prove
the continuous embeddings `H^s → C^k` for `s > k + n/2` and supported Rellich `H^s → H^r` for
every real `r < s`; for fixed compact support the compactness `H^s → C^k` under the same strict
margin, by choosing `k + n/2 < r < s`. Patch to compact bundles with the sum over the finite
atlas of `sup_x Σ_(|α|≤k) |D^α(χ_j f_j)(x)|` in bundle frames, equivalent to connection norms.
For every smooth bundle map `A : E → F` on a compact base prove `u ↦ Au : H^s(E) →L[𝕜] H^s(F)`
for every real `s`. For Rellich, fix a common compact support, make Fourier transforms and their
frequency derivatives uniformly bounded on bounded frequency balls by the distributional
pairing bounds, apply Arzelà–Ascoli there, bound the high-frequency `H^r` tail by `⟨ζ⟩^(2(r−s))`
times the `H^s` bound, and take a diagonal subsequence, then patch. Use the Riemannian density to
identify `E* ⊗ (density line)` with `E*` in the continuous bilinear density pairing
`H^s(E) × H^(−s)(E*) → 𝕜`, which identifies `H^(−s)(E*)` with the continuous dual of `H^s(E)`;
Hermitian Riesz transport to `E` is conjugate-linear and gives the pairing `∫⟨v, u⟩`, consistent
with Mathlib's conjugate-first inner product. Finite distribution order and these embeddings
show every bundle distribution lies locally in some `H^(−N)`. Prove `H⁰(E)` and B2.2's geometric
`L²` have the same distributional image and equivalent norms, using
`TemperedDistribution.memSobolev_zero_iff`, the distribution map `s ↦ (φ ↦ ∫ φ(s))`, the chart
metric and density bounds and B2.2's chart isometries (a continuous linear equivalence, not an
isometry for the atlas norm). Every formal adjoint, self-adjoint realization, harmonic projection
and orthogonal Hodge splitting uses B2.2's inner product `∫⟨s, t⟩_h dμ`; the atlas `H^s` inner
products provide the Hilbert scale and compactness. Compare 5.2's formal density adjoints with
that geometric `L²` pairing even on nonorientable manifolds.

**Checks.**

- On the circle, `‖e^(ikθ)‖_(H^s) ≍ (1 + k²)^(s/2)`; at `s = 0` this is the `L²` norm up to the
  atlas constant, and `δ ∈ H^s(ℝⁿ)` exactly for `s < −n/2`.
- On `ℝ`, `H^1 ⊂ C⁰` (`s = 1 > 0 + 1/2`) while `|x|^(1/2) χ` lies in `H^s` for every `s < 1`
  and not in `C¹`: the margin `s > k + n/2` is strict.
- `(1 + |ξ|²) ≤ (1 + |ξ|)² ≤ 2(1 + |ξ|²)`, so for `s ≥ 0`
  `(1 + |ξ|²)^s ≤ (1 + |ξ|)^(2s) ≤ 2^s (1 + |ξ|²)^s`; the constants are `1` and `2^|s|`, not `1`
  and `1`.
- Pullback by the dilation `x ↦ 2x` on `ℝ` is bounded on every `H^s` with norm depending on `s`,
  and its transpose carries the Jacobian factor `1/2`; the pullback `u ↦ u(2·)` of `δ` is
  `δ/2`, not `δ`.
- Multiplication by `x` is not bounded on `H^s(ℝ)` (unbounded coefficient), while
  multiplication by a smooth function with all derivatives bounded is, with the `H^s` operator
  norm at most `sup|f|` plus a lower-order constant.

*Needs:* 5.1; 5.2; PDE §1.3 (A3), §2.2 (B9); SmoothBundlesConnections B2.1–B2.2; Mathlib
`BesselPotentialSpace`, `TemperedDistribution.MemSobolev`, `TemperedDistribution.besselPotential`,
`fourierMultiplierCLM`, `TemperedDistribution.memSobolev_zero_iff`, `verticalClosedStrip`,
`DiffContOnCl`, `Complex.HadamardThreeLines.norm_le_interp_of_mem_verticalClosedStrip'`.

### 5.6 Complex-coefficient integration and de Rham cohomology (K5a)

Own the complex-linear manifold top-form integration and pairing by real and imaginary parts on
DifferentialGeometry's carrier, agreeing with 8.4's vector-valued simplex and chain integrals and
Stokes, and use that agreement for the complex-linear de Rham integration map and its
naturality. On an oriented real Riemannian manifold extend compactly supported smooth top-form
integration to integrable `f dvol_g` through the `L¹` density completion, independent of
approximants. Combine 5.5's `integralTopForm_eq_integralDensity` and 12.4's
`integral_riemannianVolume_eq_integralDensity` to prove
`∫_M f dvol_g = ∫ f d(riemannianVolume I M)` for integrable complex `f`, first on compactly
supported smooth functions and then by `L¹` density; use this in every `L²` formal-adjoint and
Hodge pairing identity.

Define `mextDerivℂ`, the pinned exterior derivative `mextDerivₗ` on `SmoothForm 𝓘(ℝ, E) M ℂ k`
made complex-linear by `mextDerivₗ_smul`; `deRhamCocycles k` as its kernel and
`deRhamCoboundaries k` as the image from degree `k − 1` (zero for `k = 0`); and the complex de
Rham cohomology `ComplexDeRhamCohomology k`, the image of the cocycles in the quotient of all
`k`-forms by the coboundaries, a complex vector space. Prove the quotient maps complex-linear and
the complex-linear isomorphism `H_dR(M; ℂ) ≃ ℂ ⊗_ℝ H_dR(M; ℝ)` by scalar extension of
DifferentialGeometry 6.1's real complex, and include the singular-cohomology comparison supplied
by DifferentialGeometry 8.5 and AlgebraicTopology Stage 6. Prove `H²_dR(ℂ ∖ {0}; ℂ) = 0` on this
carrier by DifferentialGeometry Layer 7's Mayer–Vietoris sequence for the slit cover below and
6.2's star-convex Poincaré lemma: the two slit domains and the two components of their
intersection are star-convex, so the connecting map from `H¹` of the intersection, which
vanishes, surjects onto `H²` of the punctured plane.

As a punctured-plane regression, compute `H¹_dR(ℂ ∖ {0}; ℂ) ≃ ℂ` on this carrier. Give `ℂ ∖ {0}`
its open-subtype structure with model `𝓘(ℝ, ℂ)`. For a smooth closed complex one-form `ω`, let
`γ(t) = circleMap 0 1 t` as a curve in the subtype and define the positive unit-circle period
`Per(ω) = ∫₀^(2π) ω(γ(t))(deriv (circleMap 0 1) t) dt`; prove `Per(f dz) = circleIntegral f 0 1`
when the form is the covector `v ↦ f(z)v`. Set `P([ω]) = (2πi)⁻¹ Per(ω)`; exact forms have zero
period by the `C¹` path fundamental theorem, so `P` is well defined and complex-linear. Use the
slit domains `V_+ = ℂ ∖ (−∞, 0]` (`Complex.slitPlane`, star-convex about `1` by
`Complex.starConvex_one_slitPlane`) and `V_− = ℂ ∖ [0, ∞)` (its image under `z ↦ −z`,
star-convex about `−1`). Apply DifferentialGeometry 6.2's star-convex primitive target, built
from 5.4's radial homotopy, to obtain primitives `g_±` of `ω` on these domains. Split the circle
into four arcs: `1 → i` and `−i → 1` in `V_+`, `i → −1` and `−1 → −i` in `V_−`; the overlap
components are connected, so `g_+ − g_−` is constant there, with values `c_U`, `c_L`, and the
interval fundamental theorem on the four arcs (DifferentialGeometry 5.3's comparison with
`curveIntegral`) gives `Per(ω) = c_U − c_L`. Zero period makes the constants equal and the local
primitives glue; for general `ω`, `ω − k dz/z` with `k = (2πi)⁻¹ Per(ω)` is exact, so
`[ω] = k[dz/z]`, and since `Per(dz/z) = 2πi`, `P` is an equivalence. Construct `dz/z` as a
smooth form through 0.3, prove `dz/z = β + iα` in the polar notation of 1.4, define `Log_+` as
the principal logarithm on `V_+` and `Log_−(z) = log(−z) + iπ` on `V_−`, so `Log_− − Log_+` is
`0` on the upper overlap and `2πi` on the lower; `d Log_± = dz/z` proves closedness of `dz/z`,
and `c_U = 0`, `c_L = −2πi` give `Per(dz/z) = 2πi`. As a disc regression compute
`H⁰_dR(D; ℂ) ≃ ℂ` and `H¹_dR(D; ℂ) = H²_dR(D; ℂ) = 0` on the unit disc with 5.4's
`homotopyOperator` for `H(z, t) = tz`; degree-two forms are closed by dimension.

**Checks.**

- `Per(dz/z) = 2πi` and `P([dz/z]) = 1`; the form `dz̄/z̄` has period `−2πi`, and
  `dz/z − dz̄/z̄ = 2i dθ` has period `4πi`.
- `H⁰_dR(ℂ ∖ {0}; ℂ) = ℂ` (connected), `H²_dR(ℂ ∖ {0}; ℂ) = 0` by Mayer–Vietoris; a cohomology
  defined as the quotient of all closed `k`-forms modulo `0` would be infinite-dimensional in
  degree `1`.
- `H_dR(S¹; ℂ) ≃ ℂ ⊗ H_dR(S¹; ℝ)` has dimensions `1, 1`; the complex-linear structure on the
  quotient is the one induced by `mextDerivℂ`, so `[i ω] = i[ω]`.
- For the disc, `homotopyOperator` applied to `dz̄ ∧ dz` gives the one-form primitive
  `z̄ dz` up to an exact form, and `H²_dR(D; ℂ) = 0`; on the punctured plane the same form
  `dz̄ ∧ dz = 2i dx ∧ dy` is exact too, with primitive `i(x dy − y dx)`, consistent with
  `H² = 0`.

*Needs:* 5.1; DifferentialGeometry 0.3, 5.2–5.5, 6.1–6.2, 8.4–8.5, 12.4; Tau Ceti
`mextDerivₗ`, `mextDerivₗ_smul`, `homotopyOperator`; DifferentialGeometry Layer 7;
Mathlib `circleMap`, `circleIntegral`, `Complex.slitPlane`, `Complex.starConvex_one_slitPlane`;
AlgebraicTopology Stage 6.

### 5.7 Laplace-type estimates, spectral theory and the real Hodge theorem (K5a)

Use 5.2's differential-operator carrier, Laplace-type predicate, restriction-compatible symbol
and formal-adjoint maps and density transpose. Own local elliptic estimates for Laplace-type
operators on finite-rank real Riemannian and complex Hermitian bundles over `[RCLike 𝕜]`, with
smooth coefficients and principal symbol `c g^(ij) ξ_i ξ_j Id`, `c > 0`, including the `c = 1`
normalization and the positive-scalar rescaling of norm, resolvent and Green-operator
identities. Use frozen-principal-part Fourier estimates at every real order and absorb smooth
matrix lower-order coupling by interpolation and interior cutoffs; compare the integer-order
conclusions with PDE's scalar estimates, without using its `H¹`-weak theorem as the
distributional starting step. Prove frame invariance, localization and partition estimates and
bundle Sobolev Rellich compactness, with `s ∈ ℝ` throughout. Build the local regularizing
mollifier and Friedrichs commutator estimates for smooth matrix coefficients, uniform for
`0 < ε ≤ 1`: for chart-localized order-two `P` and convolution regularizer `J_ε`,
`[P, J_ε] : H^r → H^(r−1)` bounded independently of `ε` for every real `r`, with nested cutoff
versions and strong `J_ε → Id` on each fixed order. Prove them from Fourier convolution and the
explicit Fourier targets proved here: Peetre's inequality `⟨ζ + η⟩^s ≤ 2^(|s|/2) ⟨ζ⟩^s ⟨η⟩^|s|`
for every real `s`, the weighted Schur test and the `L¹ * L²` Young bound, consuming
`SchwartzMap.fourier_convolution`. For every smooth compactly supported matrix `f` and `s ∈ ℝ`
prove `[Λ^s, M_f] : H^(s−1) → L²` bounded, hence
`‖fw‖_(H^s) ≤ sup_x ‖f(x)‖ ‖w‖_(H^s) + C_(f,s) ‖w‖_(H^(s−1))`, with the fibre operator norm and
the native Bessel norm `‖Λ^s w‖₂`, leading coefficient `1`; compare with the equivalent
angular-frequency and connection norms. This lets the small principal coefficient term be
absorbed on small charts, interpolation absorbing the lower-order terms. For cutoffs `χ, χ′` with
`χ′ = 1` near `supp χ`, every real `s` and `r < s + 2`, prove for smooth `u`

    ‖χu‖_(H^(s+2)) ≤ C (‖χ′Pu‖_(H^s) + ‖χ′u‖_(H^r)).

Apply the uniform regularization and commutator estimates and weak compactness to gain one
derivative from `H^r_loc`, and iterate from the proved finite negative local order to
distributional regularity: `Pu ∈ H^s_loc` implies `u ∈ H^(s+2)_loc`, including the explicit
`L²_loc → H¹_loc` starting step. On compact boundaryless manifolds give the global estimate with
any `r < s + 2`, extend it to the operator domains, and prove `L²`-weak solutions with
`Pu ∈ H^s` lie in `H^(s+2)`; smooth right-hand sides give smooth solutions. HamiltonianReduction
R5 consumes this smooth-coefficient layer at smooth reference connections for the Laplace
operator of `d_A ⊕ d_A*`; compute the exterior-multiplication and contraction symbols to prove
`σ_F((d_A ⊕ d_A*)*(d_A ⊕ d_A*)) = |ξ|²_g Id` on each degree for every smooth metric connection
`A`.

For every formally self-adjoint nonnegative Laplace-type system on a compact boundaryless base,
identify its form and inclusion in B2.2's geometric `L²` with VariationalMethods §5.1's
`CompactFormPair.operator`, the specialization of UnboundedOperators §4.7's `closedFormOperator`
on the same form and inclusion data; UnboundedOperators owns closed-form representation,
real-shift self-adjointness, both adjoint inclusions and witness independence, and §5.1 applies
these and owns its compact-pair comparisons. Prove here that the operator domain and the
adjoint/maximal weak domain are `H²` by elliptic regularity, obtaining the geometric `H²`
realization, and that the shifted energy form is coercive on `H¹` by its scalar principal part
and bounded lower-order coefficients. Consume VariationalMethods §2.2–2.4's `RCLike` coercive
solution operator with its `toRealBilin` comparison (complex Hermitian forms use the
realification and `i`-test supplied there), `H¹` Rellich and Layers 3–4's abstract
compact-embedding spectral theorem, with §5.1–5.2's same-operator compact-resolvent, graph and
eigen-expansion comparisons, to obtain the finite-dimensional kernel, complete smooth
eigensections, the Green inverse on the kernel's orthogonal complement and its projection and
recovery identities. Apply this to `Δ_d` and `Δ_A`; PseudodifferentialOperators P7 and
HamiltonianReduction R5 consume it for smooth reference operators.

Pin `d*` as the formal `L²` adjoint and the nonnegative Hodge Laplacian `Δ = d*d + dd*`, with
`σ_F(Δ_d) = |ξ|²_g Id`; prove its self-adjoint realization with domain `H²` and compact
resolvent, then its eigensection decomposition. On functions it is the negative of
DifferentialGeometry 12.3's `laplaceBeltrami`. Construct harmonic projection and the Green
operator, the orthogonal harmonic/exact/coexact splitting, and the **de Rham Hodge theorem** on
compact real Riemannian manifolds, identified with DifferentialGeometry's de Rham cohomology.
Consume the pinned `codifferential` sign `d* = (−1)^(m(k+1)+1) ⋆d⋆` on `k`-forms of an oriented
`m`-manifold (the pin states it on `(k+1)`-forms as `(−1)^(m(k+2)+1)`) and prove `⋆Δ_d = Δ_d⋆`;
PseudodifferentialOperators P1.1, RiemannianGeometry R7 and 5.9 consume these identities.

**Checks.**

- On the circle, `P = −∂² + 1` has symbol `ξ² + 1`, is an isomorphism `H^(s+2) → H^s`, and
  the interior estimate holds with no lower-order term; `Δ_d e^(ikθ) = k² e^(ikθ)`, nonnegative,
  while `laplaceBeltrami e^(ikθ) = −k² e^(ikθ)`.
- On the flat torus `T²` the harmonic one-forms are the constant-coefficient forms, of
  dimension `2 = b₁`; the harmonic projection of `cos(x) dx` is `0` and of `dx + cos(x) dx` is
  `dx`.
- `d* = (−1)^(m(k+1)+1) ⋆d⋆` at `m = 3`, `k = 1` gives the sign `(−1)^7 = −1`; the pinned
  `codifferential` on `(k+1)`-forms with `k = 0` gives `(−1)^(3·2+1) = −1`, the same.
- Peetre at `s = −1`, `η = −ζ`: `1 = ⟨0⟩^(−1) ≤ 2^(1/2) ⟨ζ⟩^(−1) ⟨ζ⟩` holds, while the
  version with `⟨η⟩^s` in place of `⟨η⟩^|s|` would demand `1 ≤ 2^(1/2) ⟨ζ⟩^(−2)`, false for
  `|ζ| ≥ 1`.
- Rescaling `P ↦ cP` multiplies the resolvent `(P + λ)⁻¹` by `c⁻¹` at `λ ↦ cλ` and the Green
  operator by `c⁻¹`; the harmonic projection is unchanged.

*Needs:* 5.2; 5.5; VariationalMethods §2.2–2.4, §3.1, Layers 3–4, §5.1–5.2; UnboundedOperators
§4.7 (UO-D06); PDE §1.3; Tau Ceti `codifferential`, `laplaceBeltrami`; Mathlib
`SchwartzMap.fourier_convolution`, `IsCoercive.continuousLinearEquivOfBilin`;
DifferentialGeometry 6.1, 12.3; hormander-alpdo1 for the local regularity route; wells-dacm,
Chapter IV.

### 5.8 Componentwise compact transport (K5a.ComponentwiseCompact)

For a compact locally connected boundaryless manifold `M` and a smooth real or complex bundle
family assembled from native fixed-model bundles `E_C` on its connected components (4.4's
assembly in the holomorphic case; in the real smooth case construct the same restriction and
pasting adapter from native smooth bundles), prove the component open cover has a finite
subcover; components are disjoint and nonempty, so every component occurs, and they are clopen
and compact. Give the resulting finite component index and restrict the metric, density and all
bundle operations to each `C`; the rank `r(C)` may vary. This is an analytic adapter on the
componentwise carriers, without constructing a fixed-`F` bundle from a rank bound.

Define smooth sections on the assembled family by pointwise pasting of the component
`ContMDiffSection` carriers, with restriction and pasting inverse topological linear maps for the
section seminorms; construct the compactly supported density-dual tests and their LF topology
with restriction and clopen extension-by-zero maps, and compare with the finite product of
component test spaces. For distributions pin `u_C(φ_C) = u(ext_C φ_C)` and `u(φ) = Σ_C u_C(φ|_C)`,
inverse continuous linear maps for the compact-convergence topologies, with restriction,
evaluation, scalar and conjugation compatibility. Prove the induced measure on each `C` agrees
with restriction of the measure on `M`, prove the finite component integration formula, and
construct geometric `L²` on the family from measurable sections with square-integrable fibre
norm modulo almost-everywhere equality; restriction and measurable pasting descend to inverse
isometries with `PiLp 2 (fun C => L²(E_C))`, whose inner product is the finite sum of the
component integrals. For every real `s` define the assembled `H^s` by component membership and
prove equivalence with localization in the disjoint union of the finite atlases; pin the
sum-of-squares norm, identified isometrically with `PiLp 2` of the component spaces, with
completeness, embeddings, interpolation, density, localization and duality for every real `s`;
the density pairing is the sum of component pairings, and realification, conjugation and
Hermitian Riesz transport commute with these maps. At `s = 0` compare with geometric `L²` by the
component equivalences.

For a finite-order local differential operator between these families, prove its smooth and
distributional action commutes with restriction and clopen extension, so it acts by the
component operators, and likewise for density transposes and formal adjoints with the summed
Green pairing, transporting the Sobolev mapping bounds; a general nonlocal operator may couple
components. For the formally self-adjoint nonnegative Laplace-type systems, prove the maximal
weak domain is the finite product of component domains, hence the assembled `H²`, with the
domain, action and graph comparison with the finite orthogonal sum of the component realizations
by testing against single-component extensions; choose common shifts and coercivity constants by
finite maxima and minima. Consume VariationalMethods §3.1's finite orthogonal-sum transport for
the resulting compact form pair and identify its represented operator with the component
operator through UnboundedOperators §4.7's graph characterization; no second representation or
self-adjointness theorem is owned here. Prove compactness of the assembled resolvent, the
componentwise harmonic projection and Green inverse with their recovery identities, and the
complete eigenbasis indexed by the disjoint union of the component indices, coincident
eigenvalues keeping the sum of their multiplicities. Treat empty `M` and zero-rank component
bundles by the zero spaces and empty eigenbases. None of these finite-component estimates
supplies a uniform rank, shift or constant for a noncompact base; Layer 4 keeps its
unbounded-rank scope there.

**Checks.**

- For `M` two circles with ranks `1` and `2`, `L²` is `L²(S¹) ⊕ L²(S¹; ℂ²)` with the sum inner
  product, the eigenbasis of `Δ_d` on functions is the union of the two Fourier bases, and the
  eigenvalue `0` has multiplicity `2`.
- For empty `M` every space is `0` and the eigenbasis is empty; for connected `M` the adapter
  is the identity on 5.5's carrier.
- A nonlocal operator such as the projection onto the span of a section supported on both
  circles couples components and is excluded from the block statement.

*Needs:* 5.1, 5.5, 5.7; 4.4; VariationalMethods §3.1; UnboundedOperators §4.7.

### 5.9 Local Hermitian identities on arbitrary complex manifolds (K5b.0)

Consume Layers 1, 2, 4 and 5.1–5.2. The Gram, type and star identities, the Dolbeault formal
adjoint on compact supports and the principal symbol `σ(Δ_∂̄_E)(ξ) = (1/2)|ξ|²_g Id` hold on
arbitrary Hermitian complex manifolds and their open sets, without compactness;
RealAnalyticGeometry R3.1 consumes them for its weighted noncompact estimate. Prove
`dvol_g = ω^n/n!` for the complex orientation. Identify the `(p,q)` summands as smooth
Gram-orthogonal subbundles with their orthogonal splitting and coefficient-space models, and
prove the complex Dolbeault formal-adjoint instantiation on 5.1–5.2's density and `L²` laws. For
`H_kl = h_T(∂_(z_k), ∂_(z_l))`, pin `|dz_j|²_Gram = 2(H⁻¹)_jj` and `dz_j♯ = 2 Σ_k (H⁻¹)_kj ∂_(z_k)`;
thus `|dz_j|² = 2` and `dz_j♯ = 2∂_(z_j)` where `H = I`. For a `(1,0)` coframe `ψ` orthonormal in
the complexified-real Gram product, define `e_θ = θ ∧ ·` and `i_θ = e_θ* = ι_(θ♯)` with `♯` the
conjugate-linear Gram dual; prove the `(1,0)` and `(0,1)` cotangent subspaces Gram-orthogonal,
and for `ψ_j` and its conjugate pin `i_j = e_j*`, `bar(i_j) = bar(e_j)*`,
`e_θ i_η + i_η e_θ = ⟨η, θ⟩_Gram`, so the two same-type anticommutators are `δ_jk` and both
mixed-type anticommutators vanish; interior at the ordinary dual-frame vector is a different
normalization. A unitary `(1,0)` coframe `φ` for `h_T*` has Gram norm `√2`; prove the scaling
`ψ = φ/√2` and `e_(φ_j) i_(φ_k) + i_(φ_k) e_(φ_j) = 2δ_jk`. Transport 5.1's pointwise type law to
the complex-linear Hodge star `⋆ : Ω^(p,q) → Ω^(n−q,n−p)`, its degree square identities, and
the `(n−p,n−q)` type of `barStar β = ⋆(bar β)`. Pin `α ∧ barStar β = ⟨β, α⟩ dvol` and
`∂̄* = −⋆∂⋆`. Consume 5.7's `⋆Δ_d = Δ_d⋆` and prove `barStar Δ_∂̄ = Δ_∂̄ barStar`. For a
Hermitian holomorphic bundle `E` construct the conjugate-linear
`barStar_E : Ω^(p,q)(E) → Ω^(n−p,n−q)(E*)` by the fibrewise metric identification; pin
`α ∧_ev barStar_E β = ⟨β, α⟩_(Gram⊗h_E) dvol_g` with `wedgeWith` and evaluation `(s, φ) ↦ φ(s)`
in that order, and its integral and norm consequence; use this slot order in the Serre pairing.
Prove the inverse and square laws and `barStar_E Δ_∂̄_E = Δ_∂̄_(E*) barStar_E`, where `E*` has
B2.2's Riesz-transported dual metric.

**Checks.**

- On `ℂ` with the standard metric, `ω = dx ∧ dy`, `dvol = ω` (`n = 1`); on `ℂ²`,
  `ω² = 2 dx₁ ∧ dy₁ ∧ dx₂ ∧ dy₂`, so `ω²/2! = dvol`.
- `|dz|²_Gram = |dx + i dy|² = 2` and `dz♯ = 2∂_z`; the dual-frame normalization would give
  `∂_z`, half the correct value.
- `e_(ψ_1) i_(ψ_1) + i_(ψ_1) e_(ψ_1) = 1` and `e_(ψ_1) i_(bar ψ_1) + i_(bar ψ_1) e_(ψ_1) = 0`;
  for the unitary coframe `φ = √2 ψ` the same-type anticommutator is `2`.
- The symbol of `Δ_∂̄` on functions on `ℂ` is `(1/2)|ξ|²` (5.2), half that of `Δ_d`, the
  local form of the Kähler identity `Δ_d = 2Δ_∂̄` of 6.1.

*Needs:* 1.3; 2.1; 4.2; 5.1; 5.2; 5.7; Tau Ceti `wedgeWith`.

### 5.10 Compact Dolbeault Hodge theory and Serre duality (K5b.1)

For Layer 4's pointwise finite-rank holomorphic bundles on a compact base, consume 5.8 on the
component restrictions, including `E`-valued type forms, the dual bundle and `E* ⊗ K_M`; prove
that clopen restriction and pasting intertwine `∂̄`, its geometric adjoint, the Dolbeault
Laplacian and `barStar_E`, and transport the `H²` realization, harmonic and Green maps and the
decomposition through those comparisons. Identify the Dolbeault complex and its cohomology with
the finite products of component complexes, compatibly with the section-sheaf comparison of 2.4;
the global integration pairing is the sum of the component integrals with the pinned slot order.
Use the component perfect pairings and the finite-product dual comparison to obtain the global
finite-dimensionality and Serre duality for varying ranks, including rank zero and empty `M`;
impose no connectedness or single fibre model on the compact conclusion.

On compact boundaryless Hermitian manifolds, consume 5.9's symbol and instantiate 5.7's
estimates, regularity, self-adjoint `H²` realization in B2.2's geometric `L²`, compact
resolvent, kernel and smooth eigenbasis at `c = 1/2`, equivalently using `2Δ_∂̄_E` at `c = 1`.
Construct harmonic projection and the Green operator, prove the orthogonal decomposition into
harmonic, `∂̄`-exact and `∂̄*`-exact terms, and identify Dolbeault cohomology with harmonic
forms: the **Hodge theorem** `finiteDimensional_dolbeaultCohomology` (Wells, Chapter IV, §§4–5),
every `H^(p,q)_∂̄(M)` finite-dimensional on a compact complex manifold.

Prove the integration pairing `H^(p,q)(M; E) × H^(n−p,n−q)(M; E*) → ℂ` nondegenerate,
identifying the second factor with the dual of the first; derive holomorphic-bundle **Serre
duality** `H^q(M; E)* ≃ H^(n−q)(M; E* ⊗ K_M)` via the Dolbeault comparison (Demailly, Chapter
VI, (7.3); Wells, Chapter IV, §5). With trivial coefficients this is
`finrank_dolbeaultCohomology_serre`, `h^(p,q) = h^(n−p,n−q)` for `p, q ≤ n`. Prove finite
Hodge numbers, metric independence and the dual Hodge-diamond symmetry on compact complex
manifolds; no Kähler hypothesis is needed for these Hermitian statements. For scalar
coefficients transport `barStar` through the harmonic identification to an anti-complex-linear
isomorphism `H^(p,q)(M) ≃ H^(n−p,n−q)(M)` with its inverse and square sign; it depends on the
metric and differs from the complex-linear pointwise star, whose type is `(n−q,n−p)`.

**Checks.**

- On `ℂP¹`, `h^(0,0) = h^(1,1) = 1` and `h^(1,0) = h^(0,1) = 0`, and Serre duality pairs
  `(0,0)` with `(1,1)` and `(1,0)` with `(0,1)`; on an elliptic curve all four numbers are `1`.
- On the Hopf surface (7.3), `h^(0,1) = h^(2,1) = 1` and `h^(1,0) = h^(1,2) = 0`: Serre duality
  `(0,1) ↔ (2,1)` holds while Hodge symmetry `h^(1,0) = h^(0,1)` fails, so the duality theorem
  does not use a Kähler hypothesis and the symmetry theorem of 6.2 does.
- For empty `M` all Hodge numbers are `0`; for `M` with `c` components `h^(0,0) = c`, and the
  duality pairs it with `h^(n,n) = c`.
- The metric independence: the Hodge numbers of `ℂP¹` computed with the Fubini–Study metric and
  with a conformally rescaled metric agree, though the harmonic representatives differ.

*Needs:* 2.4; 4.1–4.2; 5.7; 5.8; 5.9; wells-dacm, Chapter IV; Demailly, Chapter VI, (7.3).

### Examples

Oriented `ℝ²` and `ℝ³` for the star signs; the Möbius band's density line; the circle and the
flat torus for the Sobolev scale and the Hodge theorem; the punctured plane and the disc for
complex de Rham cohomology; `ℂP¹`, the elliptic curve and the Hopf surface for Hodge numbers.

### Dependencies

DifferentialGeometry 0.3, 5.2–5.5, 6.1–6.2, 8.4–8.5, 12.3–12.4; SmoothBundlesConnections
B2.1–B2.4, B3–B4; PDE §1.3, §2.2; VariationalMethods §2.2–2.4, §3.1, Layers 3–4, §5.1–5.2;
UnboundedOperators §4.7; AlgebraicTopology Stage 6; DifferentialGeometry Layer 7; Tau
Ceti `hodgeStar`, `codifferential`, `laplaceBeltrami`, `riemannianVolume`, `mextDerivₗ`,
`wedgeWith`, `homotopyOperator`; Mathlib `TestFunction`, `Distribution`, `TemperedDistribution`,
`BesselPotentialSpace`, `MontelSpace`, `fourierMultiplierCLM`, the Hadamard three-lines theorem,
`CovariantDerivative.leviCivitaConnection`; Layers 1, 2, 4; hormander-alpdo1; wells-dacm;
Demailly, Chapter VI.

## Layer 6: Kähler identities and Hodge decomposition (K6)

### 6.1 Local Kähler and curvature identities (K6.0)

The Kähler predicate is `IsKahlerForm`: a real smooth two-form on a complex manifold that is
closed, `J`-invariant and positive on `(v, Jv)`. Prove its comparison with Tau Ceti's
`SmoothTwoForm.Compatible` and `IsClosed` through DifferentialGeometry 0.4's
`legacySmoothTwoFormEquiv`, and with the real-carrier predicate "compatible, closed and
`N_J = 0`" on an almost complex manifold through 1.4's Newlander–Nirenberg theorem. Prove the
equivalences (Ballmann, Theorem 4.17): closedness of the fundamental form, `∇J = 0` for the
Levi-Civita connection, and holomorphic coordinates with `h_ij = δ_ij + O(|z|²)` at a point.
Prove the adapted unitary frame lemma, the standard Kähler structure on `ℂⁿ`, that complex
submanifolds inherit Kähler metrics, and that every Hermitian metric on a complex curve is
Kähler. Develop `L = ω ∧ ·`, its adjoint `Λ`, primitive forms and `[Λ, L] = (n − k)` on degree
`k` (Demailly, Chapter VI, §5.3). Prove the **Kähler identities** `[Λ, ∂] = i∂̄*`,
`[Λ, ∂̄] = −i∂*` and their adjoint and conjugate forms, explicitly `[Λ, d] = −(d^c)*` and
`[L, d*] = d^c` (Demailly, Chapter VI, §6; Ballmann, §5.1); for `d_c = d^c/(4π)` prove the
commutator identities with the factor `4π`. Prove `Δ_d = 2Δ_∂ = 2Δ_∂̄`, preserving type
(Ballmann, Theorem 5.25).

For a Hermitian holomorphic bundle `E` with 4.2's Chern connection, prove the pointwise
Lefschetz algebra on `E`-valued forms and the twisted Kähler identities `[Λ, ∂̄_E] = −i(D′_E)*`
with their adjoints. Prove `Δ″_E = Δ′_E + [iΘ(E), Λ]` and the integrated
**Bochner–Kodaira–Nakano identity** on compactly supported smooth forms (Demailly, Chapter VII,
(1.2)). On `(n,k)`-forms prove the curvature lower bound: if `iΘ(E) ≥ aω ⊗ Id_E` in the Nakano
sense then `[iΘ(E), Λ] ≥ ka Id` for `k ≥ 1`, with the pointwise bounds for scalar weight
curvature. Define Nakano positivity by its Hermitian form on `T^(1,0)M ⊗ E` and prove the
contraction/eigenvalue calculation in a unitary frame. This local layer uses Layers 1, 2, 4 and
5.1–5.2's formal-adjoint comparison; it uses no compact Hodge theorem. RealAnalyticGeometry R3
consumes these identities and owns their complete-metric weighted existence theory.

**Checks.**

- On `ℂ` with `ω = dx ∧ dy` and `J = i`: `dω = 0`, `ω(iu, iv) = ω(u, v)`, `ω(1, i) = 1 > 0`
  and `g(1,1) = ω(1, i) = 1`; the form `−dx ∧ dy` is closed and invariant but `−dx ∧ dy(1, i) = −1`,
  so it is not a Kähler form for `J = i`.
- On `ℂ` (`n = 1`), `[Λ, L]` is `1` on functions (`Λ(fω) = f`) and `−1` on two-forms, the
  values `n − 0` and `n − 2`.
- On `ℂ` with the flat metric, `Δ_d f = −(∂_x² + ∂_y²) f` and `Δ_∂̄ f = −2∂_z∂_z̄ f`, so
  `Δ_d = 2Δ_∂̄` on functions, the normalization of the identity.
- For a line bundle on a curve with `iΘ = aω`, `[iΘ, Λ]` acts on `(1,1)`-forms as `a`, the bound
  `ka Id` with `k = 1`; on functions it acts as `−a`, which is why the bound is stated on
  `(n,k)`-forms with `k ≥ 1`.
- Every Hermitian metric on a curve is Kähler because three-forms vanish; the Hopf surface of
  7.3 carries no Kähler metric because `H²_dR = 0`.

*Needs:* 1.3, 1.4; 2.1; 4.2; 5.1–5.2; DifferentialGeometry 0.4; Tau Ceti
`SmoothTwoForm.Compatible`; Ballmann, Theorems 4.17 and 5.25, §5.1; Demailly, Chapter VI, §§5–6,
Chapter VII, (1.2).

### 6.2 Compact Kähler Hodge theory and analytic cycles (K6.1)

On a compact Kähler manifold prove the `∂∂̄`-lemma (Demailly, Chapter VI, (8.6)), then the
**Hodge decomposition** `H^k_dR(M; ℂ) ≃ ⊕_(p+q=k) H^(p,q)(M)` ((8.5)), in Lean the dimension
form `finrank_complexDeRhamCohomology_eq_sum_dolbeault`, Hodge conjugation and **Hodge
symmetry** `finrank_dolbeaultCohomology_symm`, and compatibility with wedge and singular cup
products and with integral and rational coefficient images. Construct the pure real and
rational Hodge structures using Completed/HodgeStructures. Prove that odd Betti numbers are
even, `even_finrank_complexDeRhamCohomology_odd`, including the degree-one obstruction that
SymplecticGeometry consumes. Define `lefschetzPow ω j`, the iterated wedge `α ↦ α ∧ ω^j` on
complex forms, and prove **Hard Lefschetz** `hard_lefschetz` ((8.17); Ballmann, Theorem 5.31):
for `k ≤ n`, `L^(n−k) : H^k → H^(2n−k)` is an isomorphism, stated on forms as the two conditions
that a closed `k`-form whose image is exact is exact and that every closed `(2n−k)`-form is
cohomologous to an image. Prove the primitive decomposition and the **Hodge–Riemann bilinear
relations**: for a nonzero primitive `(p,q)` class `α`, `k = p + q ≤ n`, the real number
`i^(p−q) (−1)^(k(k−1)/2) ∫ α ∧ bar(α) ∧ ω^(n−k)/(n−k)!` is positive. Construct the associated real
polarization, and a rational polarization when the Kähler class is rational. Prove `[ω^k] ≠ 0`
for `0 ≤ k ≤ n` on nonempty compact Kähler manifolds (Ballmann, Theorem 4.23), and that a
nonzero holomorphic `k`-form is `d`-closed with nonzero de Rham class.

For a nonempty compact pure `k`-dimensional analytic subvariety `V`, construct integration over
`V_reg` as a de Rham functional, not an unspecified singular fundamental class. Define it by
5.6's `L¹` extension on the complex-oriented smooth manifold `V_reg` with the metric induced by
DifferentialGeometry 12.1's pullback along the regular-locus immersion of 1.2 and 3.5's
holomorphic-submanifold carrier and its realification; construct and install as local
instances the `RiemannianBundle`, `IsContinuousRiemannianBundle` and
`IsContMDiffRiemannianBundle` structures for that metric, preserving the given topology, and
derive local compactness and σ-compactness from the second-countable manifold structure before
applying `riemannianVolume`. For each metric separately, write the pulled-back top form as
`f dvol_g` and integrate the `L¹` function `f`. Own the Lelong local finite-mass estimates
(Demailly, Chapter III, (2.6)–(2.7)), and deduce integrability from them and the boundedness of
the ambient form on compact `M`. Prove agreement with 5.2's `integralTopForm` when the pullback
has compact support, independence of the induced metric, Wirtinger's calibrated volume equality
(Demailly, Chapter III, (1.25)) and Stokes for analytic sets. Own the analytic cutoff lemma: for a
compactly supported smooth `(2k−1)`-form `β` on `M`, construct smooth ambient cutoffs `χ_j`
vanishing near `S = V_sing`, tending to one on `V_reg`, with `∫_(V_reg) |dχ_j ∧ ι*β| → 0` and
convergence of the integrals of `χ_j ι*(dβ)` to the `L¹` integral of `ι*(dβ)`; derive these
bounds from the analytic local parametrizations, their finite-sheet mass estimates and the
lower-dimensional singular-set covering estimates, proving the covering and gradient bounds
(dimension drop alone is not an integral estimate). Combine compact-support Stokes with the
cutoff lemma to obtain `∫_(V_reg) dβ = 0`. Prove positivity `∫_(V_reg) ω^k/k! > 0`, hence the
nonzero functional `[α] ↦ ∫_(V_reg) α` on `H^(2k)_dR(M; ℝ)`. Via the real de Rham comparison and
the perfect evaluation pairing for compact ambient manifolds (AlgebraicTopology Stage 6's
universal coefficients and DifferentialGeometry 9.3), identify this functional with a nonzero
ambient class in `H_(2k)(M; ℝ)`; an integral singular cycle on `V` is not presupposed. The
integral fundamental class `[V] ∈ H_(2k)(V; ℤ)` of a singular `V`, through a triangulation of
`M` with `V` and `S` as subcomplexes, is the subject of ComplexKahlerGeometry, Part II, which
consumes RealAnalyticGeometry R5; this roadmap stops at the real functional and its ambient
class.

**Checks.**

- On an elliptic curve, `b₁ = h^(1,0) + h^(0,1) = 1 + 1 = 2`, `h^(1,0) = h^(0,1)`, and
  `b₁` is even; the Hopf surface has `h^(1,0) = 0 ≠ 1 = h^(0,1)` and `b₁ = 1`, which the
  theorems exclude because it is not Kähler.
- For a `(1,0)`-form `α = f dz` on a curve, `i ∫ α ∧ bar(α) = i ∫ |f|² dz ∧ dz̄ = 2 ∫ |f|² dx dy
  > 0`, the Hodge–Riemann sign at `(p,q) = (1,0)`; for `β = f dz̄`, `(−i) ∫ β ∧ bar(β) =
  2 ∫ |f|² dx dy > 0`, the sign at `(0,1)`.
- On `ℂP¹ × ℂP¹` with `ω = ω₁ + ω₂`, the class `ω₁ − ω₂` is primitive of type `(1,1)`
  (`k = 2 = n`) and `(−1)^1 ∫ (ω₁ − ω₂)² = −(−2) = 2 > 0`: primitive `(1,1)` classes have
  negative square, the Hodge index theorem.
- Hard Lefschetz at `k = n` is the identity; at `k = 0` on a curve it is `[f] ↦ [fω]` from
  `H⁰ = ℂ^c` to `H² = ℂ^c`, an isomorphism because `∫ ω > 0` on each component.
- A projective line `V` in `ℂP²` has `∫_V ω_FS = 1 > 0` and `[V] ↦ ∫_V` is the functional dual
  to `u`; for a nodal cubic in `ℂP²`, `V_reg` is noncompact but `∫_(V_reg) dβ = 0` still holds
  by the cutoff lemma, and `∫_(V_reg) ω_FS = 3`.

*Needs:* 5.6; 5.7; 5.9–5.10; 6.1; 1.2, 3.5; DifferentialGeometry 5.2, 9.3, 12.1;
AlgebraicTopology Stage 6; Completed/HodgeStructures; Tau Ceti `wedgeWith`, `riemannianVolume`;
Demailly, Chapter III, (1.25), (2.6)–(2.7), Chapter VI, (8.5)–(8.7), (8.17); Ballmann, Theorems
4.23 and 5.31.

### Examples

`ℂ` and `ℂⁿ` with the flat Kähler form; curves with any Hermitian metric; `ℂP¹ × ℂP¹` and the
class `ω₁ − ω₂`; the projective line and the nodal cubic in `ℂP²`; the Hopf surface as the
negative control.

### Dependencies

Layers 1, 2, 4, 5; DifferentialGeometry 0.4, 5.2, 9.3, 12.1; AlgebraicTopology Stage 6;
Completed/HodgeStructures; Tau Ceti `SmoothTwoForm`, `wedgeWith`, `riemannianVolume`;
ballmann-kahler; Demailly, Chapters III, VI and VII.

## Layer 7: projective, torus, Riemann-surface and Hopf examples (K7)

### 7.1 Projective charts and orientation (K7.1)

Use the single carrier `Projectivization ℂ (Fin (n+1) → ℂ)` with AlgebraicTopology Stage 4.6's
quotient topology from the nonzero vectors. Consume ComplexManifolds Milestones 1–3's
complex-manifold, real-restriction and atlas-transport interfaces, 3.1's finite-dimensional
holomorphic calculus and 1.1's complex orientation. This construction precedes associated
bundles and uses neither SmoothBundlesConnections B2 nor Layer 5.

Construct the affine chart on `U_i = {[v] : v_i ≠ 0}` by the ratios `(v_(i.succAbove j)/v_i)_(j :
Fin n)`, with the coordinate enumeration `Fin.succAbove i`, its inverse insertion
`Fin.insertNth i 1 z` and the chart model `Fin n → ℂ` with `𝓘(ℂ, Fin n → ℂ)`. Prove openness,
representative independence, the inverse `[1 : z]` in those coordinate positions, chart
homeomorphism and holomorphic transition maps, and give the complex-linear comparison to
`EuclideanSpace ℂ (Fin n)` and its real scalar restriction. These affine charts construct the
projective manifold directly; Milestone 4's discrete quotient theorem is not used for the `ℂ*`
action. Prove `T2Space`, `CompactSpace`, `SecondCountableTopology` and `ConnectedSpace` for every
`n ≥ 0`: chart ratios separate distinct lines, the continuous surjection from the unit sphere
gives compactness, the finite atlas second countability; `ℂP⁰` is a point. Prove the underlying
real smooth atlas and its complex orientation agree with Layer 1. Upgrade
`OnePoint.equivProjectivization ℂ` to a homeomorphism and a biholomorphism for Milestone 3's
`OnePoint ℂ` atlas, by `t ↦ [t : 1]`, `∞ ↦ [1 : 0]` and `Fin 1 → ℂ ≃ ℂ`; supply chart, inclusion,
coordinate-permutation and linear-action naturality. Projective-family consumers use the
`Projectivization` carrier; Riemann-sphere consumers use `OnePoint ℂ` and this biholomorphism,
and every `ℂP¹` example and transport theorem goes through it.

**Checks.**

- On `ℂP¹` the chart on `U₀` sends `[1 : z]` to `z` and the chart on `U₁` sends `[w : 1]` to
  `w`; the transition is `z = 1/w` on `ℂ ∖ {0}`, holomorphic, and the biholomorphism with
  `OnePoint ℂ` sends `∞ = [1 : 0]` to the point of `U₀` with coordinate `0`.
- `ℂP⁰` is a single point, compact and connected; `ℂPⁿ` is compact as the image of the sphere
  `S^(2n+1)` and connected as the image of a connected space.
- The complex orientation of `ℂP¹` restricted to the chart `U₀` is `dx ∧ dy`, and the transition
  `z ↦ 1/z` preserves it (its real determinant `|−1/z²|² > 0`), so no chart sign is negative.

*Needs:* AlgebraicTopology Stage 4.6 (topology); ComplexManifolds Milestones 1–3; 1.1; 3.1;
Mathlib `Projectivization`, `OnePoint.equivProjectivization`, `Fin.succAbove`, `Fin.insertNth`.

### 7.2 Projective bundles, forms and cohomology (K7.2)

Construct the tautological `O(−1)`, its dual powers `O(k)`, Hermitian metrics and the
normalized Fubini–Study form `ω_FS = (i/(2π)) ∂∂̄ log(1 + Σ|z_j|²)`. Prove the holomorphic tensor
and dual laws `O(a) ⊗ O(b) ≃ O(a + b)` and `O(k)* ≃ O(−k)` for all integers by their transition
maps. Prove global well-definedness, positivity, closedness, the Chern curvature formula
`Θ(O(1)) = −2πi ω_FS` and the hyperplane identity `∫_(ℂPⁿ) ω_FS ∧ β = ∫_H β` for every closed
degree-`(2n−2)` form `β`, in the real de Rham carrier. Prove `∫_(ℂPⁿ) ω_FS^n = 1` with the
complex orientation. Identify `H⁰(O(k))` with the homogeneous polynomials of degree `k` for
`k ≥ 0` by the local transition and Hartogs argument (the Borel–Weil theorem for `ℂPⁿ`;
knutson-borel-weil, p. 1), of dimension `binomial(n + k, n)`; for `ℂP¹` prove `H⁰(O(k)) = 0` for
`k < 0` from its two charts and the Laurent and Cauchy growth estimates. Construct the
holomorphic isomorphism `K_(ℂP¹) ≃ O(−2)` from `dz = −w⁻² dw`, keeping the transition-frame
convention. With 5.10's Serre duality deduce `H¹(O(−1)) = 0` and `h⁰(O(−1)) − h¹(O(−1)) = 0`,
independently of Riemann–Roch or the classification of `Pic(ℂP¹)`.

Consume AlgebraicTopology Stage 4.6's finite CW structure on `Projectivization ℂ (Fin (n+1) → ℂ)`
(one cell in each even dimension `0, 2, …, 2n`, characteristic maps `z ↦ [z : √(1−|z|²)]`) and
its cellular/singular comparison, without Stage 7's Euler-characteristic theorem. Own the
cellular and cup calculation `H*(ℂPⁿ; ℤ) = ℤ[u]/(u^(n+1))`, `|u| = 2`, using Stage 6's cellular
groups and products, with `u` the hyperplane class normalized by `⟨u, [ℂP¹]⟩ = +1`; use Stage
6's Poincaré duality and the restrictions to `ℂP^k` to identify the powers of `u` and the cup
multiplication beyond the additive groups. Compare the real image of `u` with `[ω_FS]` and with
SmoothBundlesConnections B6.2's `c₁(P)` for the Hopf circle bundle `P`, whose dual-character
associated line is `O(1)`, using B6.3's Chern–Weil comparison; this `c₁` is the independently
constructed circle-bundle class and does not consume CharacteristicClasses' universal class.
CharacteristicClasses C1.5 consumes these finite carrier inclusions, cup rings and
restriction-normalized classes for its finite-to-infinite comparison. Prove nonempty closed
complex submanifolds of projective space compact Kähler with `h^(k,k) ≥ 1` for `0 ≤ k ≤ dim`
from nonzero Kähler powers; these are GeometricQuantization's inputs, whose scaled symplectic
forms use `k ≥ 1`.

**Checks.**

- On the chart `U₀` of `ℂP¹`, `ω_FS = (1/π) dx ∧ dy/(1 + r²)²` and
  `∫ ω_FS = (1/π) · 2π ∫₀^∞ r dr/(1 + r²)² = 1`; the unnormalized `(i/2)∂∂̄ log(1 + |z|²)` has
  integral `π`.
- `h⁰(O(2)) = binomial(3, 1) = 3` on `ℂP¹` (the quadratic forms), `h⁰(O(−1)) = 0`, and
  `H¹(O(−1)) ≃ H⁰(O(−1))* = 0` by Serre duality with `K ≃ O(−2)`.
- `c₁(O(1)) = (i/(2π)) Θ(O(1)) = (i/(2π))(−2πi ω_FS) = ω_FS`, whose class evaluates to `1` on
  `[ℂP¹]`, so `[ω_FS] = u`; the opposite curvature sign would give `[ω_FS] = −u`, contradicting
  the positivity `∫ ω_FS > 0`.
- `H*(ℂP²; ℤ) = ℤ[u]/(u³)` has ranks `1, 0, 1, 0, 1`, and `u² ≠ 0` is the Poincaré dual of a
  point, so `u ∪ u` is not detected by the additive groups alone.

*Needs:* 7.1; 2.4; 3.5 (Hartogs); 4.1–4.2; 5.10; 6.2; AlgebraicTopology Stage 4.6 and Stage 6;
SmoothBundlesConnections B6.2–B6.3; knutson-borel-weil.

### 7.3 Tori, Riemann surfaces and the Hopf surface (K7.3)

For a complex torus `ℂⁿ/Λ` with a full real lattice, consume ComplexTori Milestone 1's quotient
and descent. Prove its flat Kähler structure, the invariant holomorphic forms and
`h^(p,q) = binomial(n, p) binomial(n, q)`, including the elliptic curve and its genus/Betti
dictionary. For every compact connected Riemann surface define the geometric genus `g = h^(1,0)`
and prove `h^(0,0) = h^(1,1) = 1`, `h^(0,1) = g` and `b₁ = 2g` by Hodge comparison. Prove the
topological dictionary: use 1.1's realification and complex orientation to construct the
topological surface required by PlanarTopology's surface convention; own the adapter from its
real two-dimensional atlas to the half-space-charted carrier, with empty boundary, `T2`,
compactness and connectedness, and compare the complex orientation with PlanarTopology Layer 6's
`Surface.Orientation`. Consume SurfaceTopology Layers 2–3's presentation and realization
comparisons, Layer 6's polygon normal forms and Layer 8's classification to obtain the unique
orientable closed model of genus `j` and a homeomorphism; transport the complex orientation to
that model, comparing it with the polygon orientation (and an orientation-reversing reflection
when needed). This layer owns the orientation adapter; a classification homeomorphism does not
assert compatibility with a preassigned smooth triangulation. Construct the comparison of that
realization with AlgebraicTopology's standard CW model (one vertex, `2j` edges, one face
attached by the product of commutators), treating `j = 0` by the sphere comparison, and compute
`b₁ = 2j`, hence `g = j`. On this oriented CW model compute `H²(Σ; ℤ) ≃ ℤ`, identify its
generator by evaluation on Stage 6.3's fundamental class, and compute the integral degree-one
cup pairing on the `2g` polygon generators as the standard unimodular symplectic matrix,
preserving the complex orientation. IndexTheory consumes these integral comparisons. Define the
geometric genus of a compact `n`-fold as `h^(n,0)`; theta sections of positive torus line bundles
are GeometricQuantization's.

Construct the primary **Hopf surface** `(ℂ² ∖ {0})/(z ↦ 2z)` using ComplexManifolds Milestone
4's free properly discontinuous holomorphic quotient and its diffeomorphism to `S¹ × S³`.
Compute its de Rham groups and prove it is not Kähler since `H²(M; ℝ) = 0`. Prove `h^(1,0) = 0`
by 3.5's Hartogs extension and dilation invariance, compute `h^(0,1) = 1`, and identify the
failure of Hodge symmetry. Own the Laurent and Čech computation of `H¹(ℂ² ∖ {0}, 𝒪)` on 2.3's
Leray cover and its dilation action: its invariant part is zero, while `H¹(ℤ, 𝒪(ℂ²)) ≃ ℂ` by
coefficientwise coinvariants; own the covering Čech/group-cohomology (Cartan–Leray) comparison
and obtain `h^(0,1) = 1`. Extend the Laurent computation to `Ω¹` with its twisted action:
holomorphic monomials times `dz_j` have weights `2^(d+1)` (`d ≥ 0`); `H¹` Laurent monomials
`z₁^(−m) z₂^(−n) dz_j` have weights `2^(1−m−n)` (`m, n ≥ 1`); no weight is `1`, so coinvariants
and invariants vanish and `h^(1,1) = 0`. Prove the full diamond has exactly
`h^(0,0) = h^(0,1) = h^(2,1) = h^(2,2) = 1` and all others zero, so `b_k = Σ_(p+q=k) h^(p,q)`
despite the failure of symmetry, and that the Hopf surface admits no holomorphic embedding in
any `ℂPⁿ`.

**Checks.**

- An elliptic curve has `h^(1,0) = h^(0,1) = 1`, `g = 1`, `b₁ = 2`; `ℂP¹` has `g = 0`,
  `b₁ = 0`; a genus-two surface has `b₁ = 4` and cup matrix the block sum of two copies of
  `((0,1),(−1,0))`.
- The dilation weight of `z₁^a z₂^b dz_j` is `2^(a+b+1) ≥ 2`, and of `z₁^(−m) z₂^(−n) dz_j` with
  `m, n ≥ 1` is `2^(1−m−n) ≤ 1/2`; the weight `1` would need `a + b + 1 = 0`, impossible, so the
  invariant and coinvariant parts of `H⁰` and `H¹` of `Ω¹` vanish.
- `S¹ × S³` has Betti numbers `1, 1, 0, 1, 1`; the Hodge numbers `h^(0,0) = h^(0,1) =
  h^(2,1) = h^(2,2) = 1` sum to these degreewise, while `h^(1,0) = 0 ≠ h^(0,1)`.
- A compact complex surface with `b₂ = 0` is not projective, since a Kähler class would give
  `[ω] ≠ 0` in `H²`.

*Needs:* 1.1; 2.3–2.4; 3.5; 5.10; 6.2; ComplexTori Milestone 1; ComplexManifolds Milestone 4;
PlanarTopology Layer 6; SurfaceTopology Layers 2–3, 6, 8; AlgebraicTopology Stage 4, Stage 6
and Stage 6.3; DifferentialGeometry Layer 7.

### Examples

`ℂP¹` with its two charts and `ω_FS`; `ℂP²` and its cup ring; the elliptic curve and the
genus-two surface; the Hopf surface.

### Dependencies

AlgebraicTopology Stages 4.6, 6, 6.3; ComplexManifolds Milestones 1–4; ComplexTori Milestone 1;
SmoothBundlesConnections B6.2–B6.3; PlanarTopology; SurfaceTopology; DifferentialGeometry Layer
7; Layers 1–6; Mathlib `Projectivization`, `OnePoint.equivProjectivization`;
knutson-borel-weil.

## Layer 8: the Frölicher spectral sequence and non-Kähler comparison (K8)

### 8.1 The Frölicher spectral sequence

Construct the spectral sequence of the double complex of smooth type forms, with
`E₁^(p,q) = H^(p,q)_∂̄`, converging to complex de Rham cohomology (Demailly, Chapter VI, §11).
Consume AlgebraicTopology Stage 5.0's generic filtered-complex spectral sequence and own its
decreasing cohomological column-filtration adapter, with `d_r : E_r^(p,q) → E_r^(p+r,q−r+1)`,
finite filtration and associated-graded convergence; use Mathlib's `SpectralObject` and
bicomplex carriers and create no other spectral-sequence object. Prove `E₁`-degeneration in the
compact Kähler case from 6.2.

**Checks.**

- On a compact Kähler manifold `E₁ = E_∞`, so `b_k = Σ_(p+q=k) h^(p,q)`; the inequality
  `b_k ≤ Σ_(p+q=k) h^(p,q)` holds on every compact complex manifold, and on the Hopf surface it
  is an equality although the surface is not Kähler, so equality does not characterize Kähler
  manifolds.
- On the Iwasawa manifold `d₁ : E₁^(1,0) → E₁^(2,0)` is nonzero (8.2), so the sequence does not
  degenerate at `E₁`; `Σ_(p+q=1) h^(p,q) = 5 > 4 = b₁`.
- The differential `d_r` has bidegree `(r, 1 − r)`; a column filtration indexed by `q` instead
  of `p` would give `(1 − r, r)`, so the first page's differential would be `∂̄`, not `∂`.

*Needs:* 2.4; 5.6; 6.2; AlgebraicTopology Stage 5.0; Mathlib `SpectralObject`.

### 8.2 Nilmanifold cohomology and the Iwasawa manifold

Construct the complex Heisenberg group, its Gaussian-integer lattice, the compact Iwasawa
quotient and the invariant form equations. Compute `h^(1,0) = 3`, `h^(0,1) = 2`, `b₁ = 4`, with
a proof that the invariant-form calculation gives the relevant cohomology (angella-iwasawa,
Theorem 4.1 and Appendix A). Exhibit the nonzero first spectral differential and the failure of
an additive Hodge decomposition on this compact complex manifold. Own the Heisenberg group and
lattice, the freeness and proper discontinuity of its holomorphic lattice action and
cocompactness; consume ComplexManifolds Milestone 4 for the quotient complex manifold and its
projection and descent. Consume LieGroupoidsPoisson §G1.3a's all-degree real Chevalley–Eilenberg
differential and own its scalar-extension and complex-summand adapter: on the underlying real
algebra, identify the complexification with `𝔤 ⊕ bar(𝔤)`, with zero mixed bracket, and construct
the complex-linear Chevalley–Eilenberg complex of `bar(𝔤)` and the invariant Dolbeault
bicomplex. Own **Nomizu's theorem**, the real de Rham comparison for compact nilmanifolds
(angella-iwasawa, Theorem 2.1), and **Sakane's theorem**, the Dolbeault comparison for compact
complex parallelizable nilmanifolds (sakane-parallelisable, Theorem 1, pp. 188–189;
angella-iwasawa, Theorem 2.3). For the constructed central extensions by compact tori, filter
the Chevalley–Eilenberg complex by base degree and prove the Hochschild–Serre `E₂`
identification with base cohomology tensor central-fibre cohomology. For the de Rham complex own
the central-torus bundle spectral-sequence page identifications (vertical de Rham `E₁`, then
base cohomology `E₂`); for Dolbeault own the Borel spectral-sequence construction for these
holomorphic central-torus fibrations: fibrewise `∂̄`-harmonic projection and
translation-invariant fibre cohomology, the smooth local-system/trivial-monodromy comparison
and the base/fibre `E₂` identification. Prove the inclusion from invariant to full filtered
complexes induces the comparison on these pages; apply induction on the central torus quotient
and the finite-filtration comparison theorem. Stage 5.0's generic machinery supplies
convergence and naturality, not these geometric page identifications. Apply Sakane only to this
complex-parallelizable nilpotent class; an invariant subcomplex alone does not prove its
inclusion a quasi-isomorphism.

**Checks.**

- The invariant `(1,0)`-forms `dz₁`, `dz₂`, `dz₃ − z₁ dz₂` are holomorphic, so `h^(1,0) = 3`;
  `∂̄(dz̄₃ − z̄₁ dz̄₂) = −dz̄₁ ∧ dz̄₂ ≠ 0`, so only `dz̄₁`, `dz̄₂` survive and `h^(0,1) = 2`.
- `∂(dz₃ − z₁ dz₂) = −dz₁ ∧ dz₂ ≠ 0`, the nonzero `d₁`; `b₁ = 4 < 5 = h^(1,0) + h^(0,1)`, and
  `b₁` is even while the decomposition still fails.
- For the three-torus `ℂ³/Λ` (abelian base case) the same construction gives `h^(1,0) =
  h^(0,1) = 3` and `b₁ = 6`, so the failure is a nilpotency effect, not a general nilmanifold
  one.

*Needs:* 2.4; 5.6; 8.1; 8.3; ComplexManifolds Milestone 4; LieGroupoidsPoisson §G1.3a;
angella-iwasawa; sakane-parallelisable.

### 8.3 Nilpotent central reduction (K8.NilpotentCentralReduction)

Supply the existence and lattice theorem needed at every induction step of 8.2, for a
finite-dimensional simply connected real nilpotent Lie group `G` with a discrete uniform
lattice `Γ`, including the universal-cover and lifted-lattice comparison for a connected
nilpotent presentation of the same compact quotient. Prove the restricted Malcev rationality
statement from `Γ`: using global exponential and Baker–Campbell–Hausdorff coordinates and a
`Γ`-adapted Malcev basis, `𝔤_ℚ = span_ℚ(log Γ)` is a rational Lie form of `𝔤`, and rational
ideals give closed connected exponential subgroups with uniform lattice intersection and
discrete cocompact projected lattice; own the finite-generation, rational-basis and
subgroup/lattice arguments. In the nonabelian case take the last nonzero lower-central ideal of
`𝔤`; prove it positive-dimensional, central, proper and rational for this form; put
`A = exp(𝔞)`. Prove `A` closed, connected and simply connected, `Γ ∩ A` a uniform lattice, `AΓ`
closed, and the image `Γ̄` in `G/A` discrete and cocompact. Construct `G/A` as a simply connected
nilpotent Lie group of strictly smaller dimension using quotient Baker–Campbell–Hausdorff charts,
and the smooth principal torus bundle `G/Γ → (G/A)/Γ̄` with fibre `A/(Γ ∩ A)`, its local
trivializations and translation transition maps; prove the resulting cohomology local systems
have trivial monodromy by centrality. For simply connected complex nilpotent `G`, apply this to
the underlying real group; the last nonzero lower-central ideal is a complex ideal by complex
bilinearity of the bracket (without requiring the rational form itself to be `i`-stable), so
`A` is a complex central subgroup, its lattice has real rank `2 dim_ℂ A`, and `A/(Γ ∩ A)` is a
complex torus. Own the complex quotient charts and local holomorphic sections for `G/A` and
prove the torus bundle holomorphic, with complex-nilpotent simply connected base of smaller
dimension. Prove freeness, proper discontinuity and compactness for each lattice action before
consuming Milestone 4's quotient and descent; the continuous central quotient, rationality,
lattice existence and principal-torus comparison are targets here. Use real and complex tori,
including dimension zero, as the abelian base cases, and compare the left/right lattice-quotient
and invariant-form conventions by inversion, with the corresponding Chevalley–Eilenberg chain
map, before applying §G1.3a. The central reduction follows the nilpotent case in Sakane, whose
lattice step invokes the restricted Malcev theory owned here.

**Checks.**

- For the complex Heisenberg group with the Gaussian-integer lattice, the last nonzero
  lower-central ideal is the centre `{(0, 0, z₃)}`, `A/(Γ ∩ A)` is the elliptic curve `ℂ/ℤ[i]`,
  and `G/A = ℂ²` with lattice `ℤ[i]²`: the Iwasawa manifold is a holomorphic torus bundle over
  a two-dimensional complex torus.
- For abelian `G = ℂⁿ` the lower central series is trivial and the induction stops at the torus
  base case with no reduction step.
- The lattice `Γ = {(a, b, c) : a, b, c ∈ ℤ[i]}` is uniform: the quotient is compact because
  `Γ ∩ A` and `Γ̄` are both cocompact; the discrete subgroup `{(0, 0, c) : c ∈ ℤ}` meets `A` in a
  rank-one lattice and has noncompact quotient, so the uniformity hypothesis is not dropped.

*Needs:* ComplexManifolds Milestone 4; LieGroupoidsPoisson §G1.3a; sakane-parallelisable,
pp. 188–189.

### Examples

The Iwasawa manifold and its invariant forms; the three-torus as the abelian base case; the
Heisenberg lattice and its centre.

### Dependencies

Layers 2, 5, 6; AlgebraicTopology Stage 5.0; ComplexManifolds Milestone 4; LieGroupoidsPoisson
§G1.3a; Mathlib `SpectralObject`; angella-iwasawa; sakane-parallelisable; Demailly, Chapter VI,
§11.

## Downstream consumers

- RealAnalyticGeometry consumes K1–K2's type calculus, K3.0 and K3's convergent local algebra and
  primitive coherence statements, K4's structure and section sheaves and Chern connection,
  K5a's local analysis, K5b.0's local identities and K6.0's Kähler and Bochner–Kodaira–Nakano
  identities; ComplexKahlerGeometry, Part II consumes RealAnalyticGeometry R5 and 6.2 for the
  integral fundamental class of analytic cycles.
- PseudodifferentialOperators consumes 5.1–5.8: the density and distribution carriers, the
  differential-operator core of 5.2, the Fréchet section topology, the Sobolev scale, the
  real Hodge star and codifferential identities and the Laplace-type theory; its P1.0 jets and
  P1.1 Peetre theorem follow 5.4.
- ComplexComparisonPartII consumes K2–K6.1 (its C−1.1, C0.4, C5.1–C5.4), FormalConnectionsOpers
  F2.4 consumes K1, K3.0 and K4, and GeometricQuantization consumes K1–K7 and K4's
  Koszul–Malgrange dictionary.
- CharacteristicClasses C1.5 consumes K4 and 7.1–7.2's projective carrier, line bundles,
  Fubini–Study form and cup ring; AlgebraicTopology Stage 7 consumes 7.1's carrier for its
  Euler-characteristic check; IndexTheory consumes 7.3's genus, Betti and cup comparisons and
  7.2's `K_(ℂP¹) ≃ O(−2)`.
- HeegaardFloer, Hyperfunctions and RelativisticQuantumFieldTheory consume 5.4's Fréchet carrier
  and 5.3's distribution local structure; RelativisticQuantumFieldTheory consumes 3.3's
  meromorphic germ field; HamiltonianReduction R5, RiemannianGeometry R7 and SpinGeometry consume
  5.1, 5.7 and the star and codifferential identities; VariationalMethods §5.3's geometric
  comparison follows 5.7.
- LieGroupoidsPoisson consumes 1.3's eigenbundle and involutivity dictionary; SymplecticGeometry
  consumes 6.2's odd-Betti obstruction; the roadmaps on main that cite K5a and K7 (DGFloer,
  TaubesGromov, SeibergWittenTheory, Yamabe, PositiveScalarCurvature, MorseTheory,
  GeometricCurrents, TopologicalSheafCohomology, Orbifolds, NilpotentOrbits, ComplexCurveModuli,
  AffineMorseLefschetz, TopologicalKTheory, GeneralizedCohomology) consume the Sobolev scale,
  the Hodge theorem and the projective examples.

## References

- Jean-Pierre Demailly, *Complex Analytic and Differential Geometry*, manuscript
  (demailly-agbook): Chapter I, (3.28) Hartogs extension, (3.29) the Dolbeault–Grothendieck
  lemma; Chapter II, (2.1) Weierstrass preparation, (2.3) Weierstrass division, (2.7) the
  Noetherian property, (2.10) factoriality, (3.19) Oka's coherence theorem, (4.19) local
  parametrization, (4.22) the Nullstellensatz, (4.29) Cartan's theorem, (4.31) the singular
  locus; Chapter III, (1.25) Wirtinger's inequality, (2.6)–(2.7) Lelong's theorem on the current
  of integration; Chapter V, §12, (12.4) the Chern connection and its curvature; Chapter VI, §5.3
  primitive forms, §6 commutation relations, (7.3) Serre duality, (8.5)–(8.7) Hodge
  decomposition and the `∂∂̄`-lemma, (8.17) Hard Lefschetz, §11 the Hodge–Frölicher spectral
  sequence; Chapter VII, (1.2) Bochner–Kodaira–Nakano.
- Werner Ballmann, *Lectures on Kähler Manifolds* (ballmann-kahler): Theorem 3.18 the Chern
  connection, Theorem 4.17 the Kähler equivalences, Theorem 4.23 nonvanishing of `[ω^k]`, §5.1
  and Theorem 5.25 the Kähler identities and Laplacians, Theorem 5.31 Hard Lefschetz.
- S. M. Webster, *A new proof of the Newlander–Nirenberg theorem*, Math. Z. 201 (1989),
  pp. 303–316 (webster-nn): the convex-domain homotopy operator and rapidly converging iteration.
- Raymond O. Wells, *Differential Analysis on Complex Manifolds*, Graduate Texts in Mathematics
  (wells-dacm): Chapter II for Dolbeault cohomology and the Dolbeault theorem, Chapter IV, §§4–5
  for elliptic Hodge theory and Serre duality.
- L. Hörmander, *Linear Partial Differential Operators* (hormander-alpdo1): Theorems 2.3.4 and
  2.3.5, the local structure of distributions.
- Armin Rainer, *Advanced Complex Analysis*, lecture notes (rainer-advanced-complex-analysis):
  Theorem 7.4 the Laurent expansion.
- Allen Knutson, *Borel–Weil*, course notes (knutson-borel-weil), p. 1: sections of `O(k)` on
  projective space.
- Yusuke Sakane, *On compact complex parallelisable solvmanifolds*, Osaka J. Math. 13 (1976)
  (sakane-parallelisable): Theorem 1 and the nilpotent case, pp. 188–189.
- Daniele Angella, *The cohomologies of the Iwasawa manifold and of its small deformations*,
  J. Geom. Anal. 23 (2013) (angella-iwasawa): Theorem 2.1 (Nomizu's theorem), Theorem 2.3
  (Sakane's theorem), Theorem 4.1 and Appendix A for the Iwasawa cohomology tables.
