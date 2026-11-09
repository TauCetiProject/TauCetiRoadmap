# Roadmap: global holomorphic functions of one complex variable

**Summary.** Build global one-variable approximation, prescribed isolated singularities and
divisors, and weighted genus-one products from the local complex-analysis and contour
libraries and AnalyticNumberTheoryPartI's primary products and factorization. Develop the
comparison metric on Tau Ceti's compact-open holomorphic function algebra, Cauchy–Green, global
smooth ∂̄ solvability, Cousin I, exactness of planar two-forms and the vanishing of the real
degree-two de Rham cohomology of arbitrary open subsets of ℂ.

## Scope and ownership

This roadmap owns the global plane-domain results and their analytic comparison interfaces.
The local holomorphic, analytic-order, meromorphic and compact-convergence carriers are in
Mathlib; contour cycles, winding and primitive/logarithm results are in Tau Ceti, and so is
the compact-open algebra `holomorphicFunctions U` of holomorphic functions on an open set,
with its closedness in `C(U,ℂ)`, its completeness, its continuous restrictions and its finite
jets, and so is the algebra `holomorphicGerms s` of germs near a set `s` of functions
holomorphic on a neighborhood of `s`, with its evaluations, restrictions and the germ map from
`holomorphicFunctions U`. Tau Ceti owns the Wirtinger operators, the compact-support
Cauchy transform with its ∂̄ identity and reconstruction, the filled-in predicate, the
filledness of a closed ball minus a thickening of the complement and the existence of a filled
compact exhaustion of an open set, generic manifold forms with their exterior derivative,
paired wedge and Leibniz rule, the coordinate forms dz and dz̄ on the plane, the de Rham
complex of real smooth forms with its cohomology `deRhamCohomology`, and the
winding-weighted Green theorem for contour cycles; none of these is a target here, and
DifferentialGeometry is not a supplier.
Layer 7.2 proves the vanishing `H²_dR(U;ℝ)=0` of a plane domain on Tau Ceti's
`deRhamCohomology`, from its real two-form exactness.
ConformalMapping L5 owns Jordan separation and filled-hull topology. Layer 7.2 here owns
only the planar coordinate forms on an open subset of ℂ: the coordinate differentials
dx, dy as exterior derivatives of coordinate functions, dz, dz̄ as pullbacks of the native
plane forms along the inclusion, products of smooth coefficients with forms through the
native paired wedge, coefficient extraction for two-forms, real and complex two-form
exactness, and the real degree-two vanishing. No operation on forms over a general manifold
is constructed here.

ZerosOfLFunctions, Layer 5.1–5.4, owns the zero-support API, the genus-one factor and its
basic API, its canonical product under order-one growth, and the entire logarithm.
AnalyticNumberTheoryPartI §§0.15–0.15a owns the primary factors of every genus, the
compact-summability product theorem, locally uniform primary products with variable genera and
exact orders, equal-divisor factorization of entire functions, and the full Weierstrass
factorization of every nonzero entire function without a growth hypothesis.
Layer 1 here extends that mathematics to weighted divisors given directly with inverse-square
summability, without an entire function or growth bound as input, and adds the derivative
identities of the primary factors of every genus. These are extensions of the stated contracts,
not a reassignment of their genus-one special case; ZerosOfLFunctions and
AnalyticNumberTheoryPartI are suppliers, not consumers.

Tau Ceti proves that `closedBall a r \ thickening δ Ωᶜ` is filled in an open Ω
(`IsOpen.isFilledIn_closedBall_sdiff_thickening`) and that every open subset of a proper real
normed space has some filled compact exhaustion (`IsOpen.exists_isFilledIn_compact_exhaustion`,
whose statement does not name its stages). Layer 2.1 proves the nesting and the union of the
explicit stages `closedBall 0 (n+1) \ thickening (n+1)⁻¹ Ωᶜ`, the Runge exhaustion that the
comparison metric and the boundary-zero construction use. Layer 2 owns the holomorphic hull
of a compact subset of a plane domain, its equality with the filled set, and the Runge
equivalences on it. Hyperfunctions consumes
this roadmap's one-variable results and is downstream, so nothing of it is an input here.
ComplexKahlerGeometry K2 owns parameter-dependent solvers, and K5a owns the complex-coefficient
de Rham comparison; they consume this roadmap's scalar results and complex two-form exactness.

The native sine product and cotangent series, and the exponential finite-product majorant,
are supplied results, not new theorems. Layer 6 retains their comparison calculations as
proof-route examples. The sharp finite-product inequality is a distinct target.

## Conventions

Work with scalar functions on arbitrary open Ω⊆ℂ, including empty and disconnected Ω.
Use `DifferentiableOn ℂ`, native analytic orders and native locally finite divisors.
Analytic order ∞ is distinguished from order zero; the zero function's totalized native
meromorphic divisor is zero, so AnalyticNumberTheoryPartI §0.15a's equal-divisor factorization
requires both functions nonzero.
Smoothness means `ContDiffOn ℝ ∞`; smooth functions on the open subtype of ℂ are
`ContMDiff 𝓘(ℝ, ℂ) 𝓘(ℝ, ℂ) ∞`. The function space `H(U)` carries the native compact-open
uniformity of `C(U,ℂ)`; no further uniformity or metric instance is installed on it, and all
index types are universe-polymorphic.
Unordered products use the cofinite finite-subset product filter; an explicitly paired
series has only the stated pairing. Empty products equal one.

The positive real basis of ℂ is (1,i), dA=dx dy is native Lebesgue area, and
∂̄=(∂x+i∂y)/2, ∂z=(∂x−i∂y)/2. Thus dz∧dz̄ evaluated on (1,i) is −2i.
For `u : ℂ → ℂ`, ∂̄u(z) is Tau Ceti's `conjWirtingerDeriv u z 1` and ∂z u(z) is
`wirtingerDeriv u z 1`; Suggested.lean writes equations in these operators without the
factor 1/2, as `u_x+i u_y=2f` with `u_x=fderiv ℝ u z 1` and `u_y=fderiv ℝ u z i`.
An outer boundary is counterclockwise and holes are clockwise. For the unit disk,
∮ dz/z=2πi and ∫dA=π. For the annulus 1<|z|<2, the outer-minus-inner index at
0 is 1−1=0 and its oriented area is 4π−π=3π. These normalizations are used in every layer.
Rainer's domain means a nonempty open set, not necessarily connected (§Notation, p. v);
the empty cases here follow directly from the definitions.

## Exact supplier contracts

### From Mathlib

- `Function.locallyFinsuppWithin` in `Mathlib/Topology/LocallyFinsupp.lean` is a function
  supported inside the specified set with support locally finite there. Openness is a
  separate hypothesis. `MeromorphicOn.divisor` in `Mathlib/Analysis/Meromorphic/Divisor.lean`
  uses that carrier and sends infinite order to zero. Use `AnalyticOnNhd.divisor_apply`,
  `AnalyticAt.analyticOrderAt_eq_natCast` and `meromorphicOrderAt_eq_int_iff` with their
  analytic-unit and neighborhood hypotheses.
- `ContinuousMap.compactConvergenceUniformSpace`,
  `ContinuousMap.tendsto_iff_tendstoLocallyUniformly`,
  `CompactExhaustion.hasAntitoneBasis_compactConvergenceUniformity` and the complete-space
  instance in `Mathlib/Topology/UniformSpace/CompactConvergence.lean` apply to the locally
  compact open subtype and complete codomain ℂ. `CompactExhaustion` supplies ordinary compact
  exhaustions, without a Runge condition. `TendstoLocallyUniformlyOn.deriv` in
  `Mathlib/Analysis/Complex/LocallyUniformLimit.lean` passes locally uniform convergence of
  holomorphic functions on an open set to their derivatives.
- `Complex.logDeriv_tendsto` in
  `Mathlib/Analysis/Complex/LocallyUniformLimit.lean` requires local uniform convergence,
  eventual holomorphy and a nonzero limit at the point. `logDeriv_tprod_eq_tsum` in
  `Mathlib/Analysis/Calculus/LogDerivUniformlyOn.lean` also requires summable logarithmic
  derivatives and factor nonvanishing.
- `Real.prod_one_add_le_exp_sum` in `Mathlib/Analysis/Complex/Exponential.lean` applies to
  nonnegative real terms. `Finset.norm_prod_one_add_sub_one_le`,
  `multipliable_one_add_of_summable` and `tprod_one_add_ne_zero_of_summable` in
  `Mathlib/Analysis/SpecialFunctions/Log/Summable.lean` supply the exponential estimate
  and pointwise product consequences.
- `Complex.integerComplement`, `summable_cotTerm`, `cot_series_rep`,
  `HasProdLocallyUniformlyOn_euler_sin_prod` and
  `multipliableUniformlyOn_euler_sin_prod_on_compact` supply integer exclusions, the paired
  cotangent series and sine products. Their files are `Mathlib/Analysis/Complex/IntegerCompl.lean`
  and `Mathlib/Analysis/SpecialFunctions/Trigonometric/Cotangent.lean`.
  The quotient sin(πz)/(πz) has totalized value zero at z=0, whereas the product there is one.
- `Complex.GammaSeq_tendsto_Gamma` in `Mathlib/Analysis/SpecialFunctions/Gamma/Beta.lean`
  and `Real.tendsto_harmonic_sub_log` in `Mathlib/NumberTheory/Harmonic/EulerMascheroni.lean`
  supply the reciprocal-Gamma normalization; pole exclusions remain explicit for logarithmic derivatives.
- `SmoothPartitionOfUnity.exists_isSubordinate` in
  `Mathlib/Geometry/Manifold/PartitionOfUnity.lean` applies on a finite-dimensional,
  Hausdorff, σ-compact smooth manifold to an open cover of a closed set.
  `contMDiff_inclusion` handles open-subtype inclusions; `contMDiffAt_subtype_iff` in
  `Mathlib/Geometry/Manifold/ContMDiff/Basic.lean` reads smoothness of a restriction to an open
  subtype at a point as smoothness of the ambient map there, and `contMDiffOn_iff_contDiffOn`
  in `Mathlib/Geometry/Manifold/ContMDiff/NormedSpace.lean` compares manifold and normed-space
  smoothness on a subset of a normed space.
- `Complex.volume_preserving_equiv_real_prod` fixes area normalization.
  The low-regularity route uses locally compact Baire, product Fubini,
  `MeasureTheory.integral_eq_of_hasDerivAt_off_countable_of_le`,
  `VectorMeasure.exists_extension_of_isSetSemiring_of_le_measure`,
  `variation_le_of_forall_enorm_le`, the signed/complex Radon–Nikodym declarations and
  `VitaliFamily.ae_tendsto_average_norm_sub` under the explicit hypotheses in Layer 0.2.

### From Tau Ceti

Use `TauCeti.Contour.Cycle` and its trace, integral and winding number from
`TauCeti/Analysis/Contour/Cycle/Basic.lean`, and its homology-Cauchy and integer-index API.
Use `TauCeti.Contour.isExactOn_of_forall_closed_integral_eq_zero`,
`TauCeti.Contour.exists_differentiableOn_eqOn_exp_comp_of_isExactOn`, and
`TauCeti.Contour.exists_differentiableOn_eqOn_exp_comp_of_filledHull_subset`
from `TauCeti/Analysis/Contour/Primitive.lean`: retain openness, continuity or holomorphy,
all closed-path periods, and nowhere-zero hypotheses. `TauCeti.morera` supplies the
rectangle-conservative criterion. No alias of these statements is an acceptance target here.

Use `TauCeti.wirtingerDeriv` and `TauCeti.conjWirtingerDeriv` from
`TauCeti/Analysis/Complex/Wirtinger/Basic.lean`, with `wirtingerDeriv_apply`,
`conjWirtingerDeriv_apply`, `wirtingerDeriv_add_conjWirtingerDeriv` and
`fderiv_apply_eq_smul_wirtingerDeriv_add_smul_conjWirtingerDeriv`, and
`TauCeti.differentiableAt_iff_conjWirtingerDeriv_apply_one_eq_zero` from
`TauCeti/Analysis/Complex/Wirtinger/Holomorphic.lean`, which assumes `DifferentiableAt ℝ`.
Use the compact-support Cauchy transform `w ↦ ∫ z, (w − z)⁻¹ • f z` of
`TauCeti/Analysis/Complex/Pompeiu/Basic.lean`:
`HasCompactSupport.two_pi_inv_smul_integral_sub_inv_smul_fderiv_apply_one_add_I_smul_apply_I`
reconstructs a compactly supported `C¹` map `u` as `(2π)⁻¹ ∫ (w − z)⁻¹ • (u_x + i u_y)`,
`HasCompactSupport.conjWirtingerDeriv_integral_sub_inv_smul_apply_one` gives `∂̄` of the
transform of a compactly supported `C¹` map as `π` times the map, and
`TauCeti.differentiableOn_integral_sub_inv_smul_compl` gives holomorphy off a compact set
outside which the datum vanishes; all three assume `C¹`, not smoothness. Use
`TauCeti.exists_contDiff_conjWirtingerDeriv_apply_one_eq_of_hasCompactSupport` from
`TauCeti/Analysis/Complex/Wirtinger/Potential.lean`, a `Cⁿ` `∂̄`-primitive of a compactly
supported `Cⁿ` datum for `n ≥ 1`, and `Complex.locallyIntegrable_inv` from
`TauCeti/Analysis/Complex/CauchyKernel.lean`.
Use `TauCeti.IsFilledIn` from `TauCeti/Topology/FilledIn.lean`, no connected component of
`Ω \ K` relatively compact in `Ω`, and `IsOpen.exists_isFilledIn_compact_exhaustion` from
`TauCeti/Analysis/Normed/Module/Exhaustion.lean`: for an open subset `Ω` of a proper real
normed space, there exist compact stages `K n ⊆ interior (K (n + 1))` with union `Ω`, each
filled in `Ω`. The statement is existential: the stages its proof builds are not exported, so it
is cited only where an unspecified exhaustion suffices. From the same file use
`IsOpen.isFilledIn_closedBall_sdiff_thickening`: for open `Ω`, a centre `a`, `0 ≤ r` and
`0 < δ`, the set `closedBall a r \ thickening δ Ωᶜ` is filled in `Ω`.
Use the smooth-form carrier of `TauCeti/Geometry/Manifold/DifferentialForm/`: `RoughForm` and
`RoughForm.ofFunction` (`Basic.lean`), `IsSmoothForm` and `SmoothForm` (`Smooth.lean`),
`mextDeriv` and `mextDeriv_ofFunction` (`ExtDeriv.lean`), `isSmoothForm_ofFunction_iff` (the
degree-zero form of a function is a `Cⁿ` form exactly when the function is `Cⁿ`, for
`[IsManifold I 1 M]`) and `isSmoothForm_mextDeriv` (the exterior derivative of a `Cᵖ` form is
`Cⁿ` when `n + 1 ≤ p`, for `[IsManifold I 2 M]`) (`Regularity.lean`), `mextDeriv_mextDeriv`
for a `C²` bundle form (`Squared.lean`), the paired wedge `RoughForm.wedgeWith` with
`wedgeWith_apply_one_one` and `wedgeWith_flip` (`Wedge/Basic.lean`), the Leibniz rule
`mextDeriv_wedgeWith` at a point where both forms are differentiable (`Wedge/Leibniz.lean`),
`mpullback` along a smooth map with `mpullback_apply` (`Pullback/Basic.lean`,
`Pullback/Smooth.lean`), `mpullback_mextDeriv_ofFunction_apply` (at a point where `f` is
differentiable and `g` is differentiable at `f x`, the pullback by `f` of `d g` is `d (g ∘ f)`)
and its global form `mpullback_mextDeriv_ofFunction` (`Naturality.lean`),
`mpullback_inclusion_apply`, `RoughForm.extendByZero` and `IsSmoothForm.extendByZero` for open
subsets (`Opens.lean`), and the plane forms `SmoothForm.complexDz` and
`SmoothForm.complexDzBar`, both of type `SmoothForm 𝓘(ℝ, ℂ) ℂ ℂ 1`, with their evaluations
`SmoothForm.complexDz_apply` and `SmoothForm.complexDzBar_apply` and the Wirtinger pullback
formula `mpullback_complexDz` (`Plane/Complex.lean`): for every `f : ℂ → ℂ` and `z`, with no
regularity hypothesis, the pullback of `dz` by `f` at `z` is
`wirtingerDeriv f z 1 • dz + conjWirtingerDeriv f z 1 • dz̄`, evaluated on a tangent vector by
`mpullback_complexDz_apply`.
Use the real de Rham complex of `TauCeti/Geometry/Manifold/DeRham/Basic.lean`, for a manifold
`M` modelled on `I` with `[IsManifold I 2 M]`: `closedForms I M k` and `exactForms I M k`, the
submodules of `SmoothForm I M ℝ k` of forms with vanishing `mextDeriv` and of exterior
derivatives of smooth `(k−1)`-forms, `exactForms_le_closedForms`,
`mem_closedForms_of_finrank_le` (every smooth `k`-form is closed once `k` is at least the
dimension of the model space), the quotient `deRhamCohomology I M k`, the homology of that
complex in degree `k`, with `deRhamCohomology.mk` surjective from `closedForms I M k` and
`deRhamCohomology.mk_eq_zero_iff` characterizing the kernel as `exactForms I M k`.
Use the compact-open holomorphic algebra of `TauCeti/Analysis/Complex/HolomorphicFunctions/`:
`holomorphicFunctions U : Subalgebra ℂ C(U, ℂ)` for `U : Opens ℂ`, whose carrier is the
continuous maps agreeing on `U` with a function `DifferentiableOn ℂ` on `U`, with the
topology inherited from compact convergence (`Basic.lean`); `mem_holomorphicFunctions_iff_extend`
(membership is holomorphy of the zero extension), `HolomorphicFunctions.of` and
`HolomorphicFunctions.extend` with `of_extend`, `isClosed_holomorphicFunctions`, the
`CompleteSpace` instance, `HolomorphicFunctions.tendsto_iff_tendstoLocallyUniformlyOn`
(convergence is `TendstoLocallyUniformlyOn` of the zero extensions on `U`),
`HolomorphicFunctions.restrict` along `V ≤ U` with `restrict_comp` and `continuous_restrict`;
`HolomorphicFunctions.jet` (the first `n` derivatives at a point of `U`, linear, with
`jet_eq_zero_iff` reading its vanishing as analytic order at least `n`) and
`finrank_quotient_ker_jet_le` (`Jet.lean`); and `norm_le_mul_pow_of_mem_ker_jet` with
`exists_finiteDimensional_quotient_norm_le` (`RestrictionEstimate.lean`): on the kernel of the
`(n+1)`-jet at the centre of a disc of radius `R` inside `U`, a bound `M` on that disc gives the
bound `M (r/R)^(n+1)` on the closed disc of radius `r < R`.
Use the holomorphic germ algebra of `TauCeti/Analysis/Complex/Germ/Algebra.lean`:
`holomorphicGerms s : Subalgebra ℂ (Germ (𝓝ˢ s) ℂ)` for any `s : Set ℂ`, the germs near `s`
of functions analytic at every point of `s`, equivalently holomorphic on an open neighborhood
of `s` (`mem_holomorphicGerms_iff_exists_open`), with no compactness or nonemptiness assumed
(at `s = ∅` it is the zero algebra); the algebra homomorphisms `holomorphicGerms.eval x hx`
to ℂ at points `x ∈ s` and `holomorphicGerms.restrict` along `t ⊆ s`, with
`holomorphicGerms.eval_restrict`; and `HolomorphicFunctions.toGerm`, the algebra homomorphism
from `holomorphicFunctions U` to `holomorphicGerms s` for `s ⊆ U` (`HolomorphicFunctions/Germ.lean`).
Use `TauCeti.Contour.Cycle.green_winding` from `TauCeti/Analysis/Green/Cycle.lean`: for a
cycle with trace in an open `U`, null-homologous in `U`, and real `C¹` fields `P, Q` on `U`,
the integer-weighted circulation equals the integral over `U` of the winding-weighted curl.

### From TauCetiRoadmap.ZerosOfLFunctions

Consume Layer 5.1's countable locally finite zero support, Layer 5.2's genus-one factor
`E₁` and basic API (its value one at zero, its single simple zero at one,
`deriv E₁ z = −z exp z`, its logarithmic derivative and its small-disk estimate), Layer
5.3's growth-to-summability canonical product, and Layer 5.4's entire logarithm. The
inverse-square-input extension is stated in Layer 1.2.
Use the native contour logarithm implementation for the logarithm contract.

### From TauCetiRoadmap.AnalyticNumberTheoryPartI

Consume §0.15's primary factor `elementaryFactor` with its normalization, simple zero at one,
sharp estimate `|1−E_p(w)|≤|w|^(p+1)` on the closed unit disk and identification of `E₁` with
ZerosOfLFunctions' genus-one factor; its compact-summability product theorem with additive
orders and unit tail; and its countable variable-genus product with exact orders,
`exists_entire_primary_product_exact`. Consume §0.15a's equal-divisor factorization
`exists_entire_exp_mul_of_divisor_eq` for two entire functions, neither identically zero, and
its full Weierstrass factorization: every nonzero entire `f` with zero order `m` at the origin
is `z^m exp(g(z)) ∏ E_(p_a)(z/a)^(m_a)` over its nonzero zeros `a` with multiplicities `m_a`,
for admissible genera `p_a` and an entire `g`, without a growth hypothesis; `z^m` times the
§0.15 product over the nonzero zeros has the native divisor of `f`, and `g` is the
equal-divisor factor.
For a fixed choice of genera, `g` is unique up to an additive constant in `2πiℤ`; the genera
are not unique.

**Checks** of the consumed factorization.

- For f=z, m=1, the nonzero-zero index is empty, the product is 1 and g=0 give z=z·1·1.
- For f=(z−1)², with genus 0 at the zero 1, the product is (1−z)² and g=0; the exponent is the
  multiplicity 2, not 1.
- For f=exp(z), m=0, the product is 1 and g=z; the empty zero set does not force f to be
  constant.

### From TauCetiRoadmap.ConformalMapping

Consume L5's Jordan separation and filled-hull topology for Layer 6's boundary construction.
Its orientation-to-winding comparison and finite-hole assembly are targets of Layer 6.
No geometric mapping theorem enters the scalar Cauchy–Green or global ∂̄ solver.

## How to read the build

Layer 0 develops real-plane calculus and compact-support Cauchy–Green. Layer 1 develops
summable products, building on AnalyticNumberTheoryPartI's primary products. Layer 2 (GH0)
supplies hulls, the comparison metric on Tau Ceti's compact-open holomorphic algebra, and
Runge; Layer 3 (GH1) realizes divisors and boundary noncontinuation; Layer 4 (GH2) realizes
isolated singularities. Layer 6 (GH4) applies these results, and AnalyticNumberTheoryPartI's
factorization, to products, approximation and contours. Layer 7 (GH5) solves global ∂̄ and
Cousin I and proves planar two-form exactness and the real degree-two de Rham vanishing.
Layer k is cited by consumers as GH(k−2); the full factorization labelled GH3 is
AnalyticNumberTheoryPartI's, so there is no Layer 5. Each route
lists its own inputs; Layer 7's scalar solver does not use Layer 6's Green theorem.
Suggested.lean states the headline theorems on pinned carriers; the form-level statements of
Layer 7.2 are on Tau Ceti's smooth-form carrier and its de Rham cohomology.

## Layer 0: real-plane calculus and compact-support Cauchy–Green

### 0.1 Wirtinger operators

The Wirtinger operators are Tau Ceti's `wirtingerDeriv` and `conjWirtingerDeriv`, evaluated
on the direction `1`: for `u : ℂ → ℂ`,
`∂̄u(z)=conjWirtingerDeriv u z 1=(fderiv ℝ u z 1+i*fderiv ℝ u z i)/2` and
`∂_z u(z)=wirtingerDeriv u z 1=(fderiv ℝ u z 1−i*fderiv ℝ u z i)/2`, by
`conjWirtingerDeriv_apply` and `wirtingerDeriv_apply`.
Under `DifferentiableAt ℝ u z`, `∂̄u(z)=0` iff `DifferentiableAt ℂ u z` is
`differentiableAt_iff_conjWirtingerDeriv_apply_one_eq_zero`; derive the open-set version
under real differentiability at each point: for `u` real-differentiable at every point of an
open `Ω`, `DifferentiableOn ℂ u Ω` iff `∂̄u=0` on `Ω`. Smoothness uses
`ContDiffOn ℝ ∞`, with `open scoped ContDiff`; native `⊤` in this order type is analytic
order `ω`, and does not express the smooth compact-support inputs.

The operator API, proved from the native defining formulas, is:

- Both operators are complex-linear in smooth coefficient functions and satisfy the product rule.
- For real-differentiable u, du=∂z u dz+∂̄u dz̄, which is
  `fderiv_apply_eq_smul_wirtingerDeriv_add_smul_conjWirtingerDeriv`; vanishing ∂̄ is
  equivalent to complex differentiability.
- Restriction to an open neighborhood preserves both operators; iterated operators commute on smooth functions.

**Checks.**

- For u(z)=z, (∂z u,∂̄u)=(1,0); omitting 1/2 would give (2,0).
- For u(z)=z̄, the pair is (0,1); exchanging signs would reverse the two entries.
- For u(z)=|z|², the pair is (z̄,z); at z=i this is (−i,i), distinguishing conjugation.

These are direct real-coordinate differentiations; the differential convention agrees with
Rainer, §10, equation (10.1), p. 23 (rainer line 1189).
*Needs:* Tau Ceti's Wirtinger derivatives; Mathlib `fderiv`, real/complex differentiability
and the chain and product rules.

### 0.2 Low-regularity Cauchy–Riemann criterion (Looman–Menchoff)

The target `differentiableOn_complex_of_continuous_real_lineDerivatives_cr` states: for an open `Ω ⊆ ℂ` and `f = u + i v : ℂ → ℂ` with `ContinuousOn f Ω`, prove that
existence at every point of `Ω` of the four real coordinate partial derivatives, together
with `u_x = v_y` and `u_y = -v_x`, implies `DifferentiableOn ℂ f Ω`. Encode the two
directional complex derivatives with `HasLineDerivAt ℝ f` in directions `1` and
`Complex.I`; the CR equations are precisely `f_I = Complex.I * f_1`. Conversely,
complex differentiability gives these coordinate partials and CR. The assertion is local
and requires no connectedness assumption. Do not assume continuity or local integrability
of the partial derivatives, or replace coordinate partial existence by real Fréchet
differentiability. Keep the separate countable-exception / almost-everywhere-CR extension
outside this assertion.

One proof route is as follows. If the conclusion fails, let `E` be the points of `Ω` having no
relative neighborhood on which `f` is holomorphic. Then `E` is relatively closed in `Ω`;
if it is empty the conclusion already holds. Regard `Ω` as an open subtype of `ℂ` and
`E` as a closed subtype of `Ω`. Install their local `LocallyCompactSpace` structures
using `IsOpen.locallyCompactSpace` and `IsClosed.locallyCompactSpace`, then apply
the native locally compact Hausdorff Baire instance to `E`;
do not claim that a relatively closed subset of an open domain is complete in the
inherited metric.

For each integer `n ≥ 1`, let `E_n` contain those `z ∈ E` for which, for every real `h`
with `0 < |h| ≤ 1/n`, `|f(z+h)-f(z)| ≤ n|h|` whenever `z+h ∈ Ω`, and
`|f(z+i h)-f(z)| ≤ n|h|` whenever `z+i h ∈ Ω`. These endpoint-in-domain clauses are part
of the definition. For a fixed increment the failure set is open relative to `E`, so
`E_n` is relatively closed. Existence of the two coordinate partials at each `z ∈ E`
implies `E = ⋃_{n≥1} E_n`. Baire gives some `N ≥ 1` and a nonempty relatively open part
of `E` contained in `E_N`. Choose an ordinary bounded open rectangle `K` around one of
its points with `closure K ⊂ Ω` and `E ∩ K ⊂ E_N`.

Identify the real plane with `ℂ` through `Complex.measurableEquivRealProd`.
Use `Complex.volume_preserving_equiv_real_prod` to transport the scalar product-area
integrals and `m(R\E)` to native complex `volume` in the content and density steps.

Prove the following balanced-rectangle scalar estimate. For a closed nondegenerate
rectangle `R`, write `w_R,h_R` for its side lengths and assume `1/2 ≤ w_R/h_R ≤ 2`.
Let the ambient function `φ : ℝ×ℝ → ℝ` satisfy `ContinuousOn φ R` and have both coordinate
partial derivatives at every point of `R`. Let `N ≥ 0` and let `F ⊆ R` be closed and
nonempty. Suppose that for every `(x,y) ∈ F` and all `(ξ,y),(x,η) ∈ R`,
`|φ(ξ,y)-φ(x,y)| ≤ N|ξ-x|` and `|φ(x,η)-φ(x,y)| ≤ N|η-y|`.
Let `J=[a,b]×[α,β]` be the smallest rectangle containing `F`. Then

`|∫_a^b (φ(x,β)-φ(x,α)) dx - ∬_F ∂_yφ dxdy| ≤ 5N m(R\F)`,

`|∫_α^β (φ(b,y)-φ(a,y)) dy - ∬_F ∂_xφ dxdy| ≤ 5N m(R\F)`,

where `m` is planar Lebesgue measure. If `J` is degenerate in either coordinate, both
expressions are zero: use zero-length interval integrals and the zero area of `F`.

Own the one-dimensional interpolation proof. On a nonempty closed vertical slice `P` of
`F`, write `g(y)=φ(x,y)` for `y∈[α,β]`. Adjoin `α,β` to `P` with their actual values
`g(α),g(β)`. The increment hypotheses at points of `P` make these enlarged data
`N`-Lipschitz, including the pair of endpoints by comparison through any point of `P`.
Extend the data affinely over each complementary component interval. Prove that the
interpolant is `N`-Lipschitz and has the original endpoint values. Its derivative on a
gap is the endpoint secant slope, bounded by `N`. At non-isolated points of `P` which
are not gap endpoints, prove by difference quotients that its derivative agrees with
`g'`. Isolated points and gap endpoints form a countable exceptional set; the disjoint
gap intervals are countable by assigning distinct rationals. Define the derivative to
be zero on the exceptional set. Prove its measurability from difference quotients and
its interval integrability using the bound `N` on the finite interval. Apply native
`MeasureTheory.integral_eq_of_hasDerivAt_off_countable_of_le` to obtain the endpoint
identity. Subtract the integral of `g'` over `P`; the remaining error is at most `N`
times the length of `[α,β]\P`. The interpolation and accumulation-point proof are
targets here; the native FTC supplies the final identity after its continuity,
off-countable derivative and `IntervalIntegrable` hypotheses have been proved.

For an empty vertical slice with `x∈[a,b]`, take points `(x_β,β),(x_α,α)∈F` attaining
the top and bottom. Bound `|φ(x,β)-φ(x,α)|` along
`(x,β)→(x_β,β)→(x_α,β)→(x_α,α)→(x,α)`.
All four increments have an endpoint in `F`. The three horizontal distances total at
most `2w_J`, so the bound is `N(2w_J+h_J)≤5N h_R`. Let `S` be the set of such empty
slices in `[a,b]`. Use the full-height region `S×R_y ⊆ R\F`, of area `m₁(S)h_R`, for
this contribution. The gap regions of the nonempty slices lie in `J\F` and are
disjoint from `S×R_y`. Their combined error is therefore at most `5N m(R\F)`.
Exchange axes for the second inequality, using the other aspect-ratio bound.

Discharge the Fubini premises explicitly. The restrictions of `φ` to `R` are continuous
and Borel measurable. Express each partial derivative on the interior as a pointwise
limit of measurable coordinate difference quotients. Set it to zero outside its domain
for this measurability argument; boundary lines have area zero. The increment bounds
pass to the derivative limit on `F`, giving absolute value at most `N` there; hence the
restricted derivatives are integrable on this finite-area set. Sections of `F` are
closed. Use product-measure Fubini with its `AEStronglyMeasurable` and integrability
premises to identify these area integrals with the section integrals above. These
arguments add no hypothesis on the partial derivatives of the headline theorem.

Apply the scalar estimate to both real components of `f` on a balanced cell `R ⊂ K`
with side lengths at most `1/N` and `F=E∩R≠∅`. The CR equations cancel the two area
integrals in each component of the contour integral, giving
`|λ(J)|≤20N m(R\E)`, where `λ` is the positively oriented boundary integral and `J`
is the smallest rectangle containing `F`. To pass from `J` to `R`, subdivide `R\J`
into finitely many rectangular strips. Each strip's open interior avoids `E`, while
its boundary may meet `E`. Native Cauchy–Goursat applies to continuity on the closed
strip and holomorphicity in its interior. Cancel shared edges to obtain `λ(R)=λ(J)`.
Handle a degenerate `J` by zero-length edges and cancellation; then `λ(J)=0`. If
`R` misses `E`, apply Cauchy–Goursat directly. Thus every such balanced cell satisfies
`|λ(R)|≤20N m(R\E)`.

For an arbitrary nondegenerate closed rectangle `R ⊂ K`, set
`δ=min(w_R,h_R,1/N)`, `m=ceil(w_R/δ)`, `n=ceil(h_R/δ)`, and subdivide equally into
`m` columns and `n` rows. Each cell side lies in `[δ/2,δ]`; each cell has aspect ratio
in `[1/2,2]` and side lengths at most `1/N`. Summing the cell estimates and cancelling
internal edges gives `|λ(R)|≤20N m(R\E)`; common boundaries have zero area. Prove this
finite grid construction without assuming finite tiling by squares.

Define the complex boundary-integral content on `∅` together with nondegenerate
half-open rectangles `[a,b)×[c,d)` whose closure lies in `K`, with value zero at `∅`.
Prove its set-semiring axioms and finite additivity by collecting all coordinate
endpoints of each finite disjoint partition, refining to a common finite grid, and
cancelling opposite internal edges. The preceding estimate gives
`‖A(Q)‖ₑ≤20N area(Q)` on the whole semiring. Apply native
`VectorMeasure.exists_extension_of_isSetSemiring_of_le_measure` with the finite measure
`μ=20N·volume|_K`, proving its domination and measurability hypotheses. Since `K` is
bounded, contain it in a ball of finite volume to prove `volume K<∞` and the required
`IsFiniteMeasure μ`. Use
`variation_le_of_forall_enorm_le` to obtain `c.variation≤μ` and hence `c≪volume`.

Construct `ComplexMeasure.HaveLebesgueDecomposition c volume` locally from the real and
imaginary signed-measure decomposition instances for σ-finite volume. Use
`ComplexMeasure.rnDeriv`, `integrable_rnDeriv`, and
`singularPart_add_withDensity_rnDeriv_eq`. Prove singular-part elimination componentwise:
`ComplexMeasure.absolutelyContinuous_ennreal_iff` gives absolute continuity of `c.re`
and `c.im`. Each signed density measure is absolutely continuous by
`Measure.withDensityᵥ_absolutelyContinuous`; subtract it from the corresponding signed
measure to show its singular part is absolutely continuous. Native
`SignedMeasure.mutuallySingular_singularPart` makes it mutually singular to volume.
For each component, split every measurable set at a measurable singularity witness,
use singularity on one side and absolute continuity on the volume-null side, and then
additivity to obtain zero. Since the complex singular part is assembled from these two
signed singular parts, it is zero as well. This identifies `c` with its integrable
complex RN density `g`.

Use `VitaliFamily.ae_tendsto_average_norm_sub` for the native closed-ball Vitali family
on `ℂ`, supplied by the finite-dimensional real Besicovitch-covering instance. Transfer
the norm-average limit to centered half-open squares `Q_r` of half-side `r>0`:
`Q_r⊆closedBall(x,√2r)`, `area(Q_r)=4r²`, and
`area(closedBall(x,√2r))=2πr²`, using native `Complex.volume_closedBall`. The average of any nonnegative integrable function
over `Q_r` is at most `π/2` times its average over that ball. Use the positive-radius
rescaling `r↦√2r` to transfer the limit as `r→0⁺`; in particular the square average of
`‖g(y)-g(x)‖` tends to zero. Apply the same comparison to the measurable-set density
theorem for `E∩K`. At almost every `x∈K\E`, a neighborhood avoids `E`, and all
sufficiently small rectangle content values vanish. At almost every `x∈E∩K`, density
of `E` is one and `|c(Q_r)|/area(Q_r)≤20N area(Q_r\E)/area(Q_r)→0`.
The square differentiation identity therefore gives `g=0` almost everywhere on `K`.
Domination makes `c` vanish off `K`, so `c=0` and all rectangle contour integrals in
`K` vanish.

Prove the all-corner Morera bridge. Native `Complex.IsConservativeOn f K` quantifies
every pair `z,w` with `Rectangle z w⊆K`, including reversed and degenerate rectangles.
For degenerate coordinate intervals, use zero-length interval integrals and cancellation
of remaining opposite edges. For nondegenerate rectangles use the half-open content
identity and boundary formula. Handle every corner order using
`intervalIntegral.integral_symm` and `Complex.wedgeIntegral_add_wedgeIntegral_eq`.
Apply native `TauCeti.morera` with `ContinuousOn f K` to obtain holomorphicity on `K`,
contradicting `E∩K≠∅`.

This target consumes native locally compact Baire, rectangle Cauchy–Goursat/Morera,
off-countable FTC, product Fubini, finite vector-measure extension, variation domination,
complex RN decomposition, Besicovitch/Vitali differentiation, and measurable-set density.
Its new proof targets are the balanced scalar estimate and interpolation construction,
the measurability/Fubini instantiation, finite-grid rectangle content, complex singular-part
elimination, square-to-ball adapter, and all-corner Morera bridge. Use native
`VectorMeasure`/`ComplexMeasure` carriers throughout.

The headline is Gray–Morris, Theorem 3, p. 247 (gray-morris line 66).
The rectangle route adapts their Appendix, Lemma 1 and proof, pp. 252–254
(gray-morris line 310); the balanced-cell, local-Baire and dominated-measure details above
are the explicit local versions needed for that argument.

The proof constructions have the following API: the bad set is relatively closed; its
increment-bound sets are relatively closed and cover it; slice interpolation preserves
endpoint values and the Lipschitz bound; the rectangle content is additive, dominated and
recovers its Radon–Nikodym density. Each comparison is local on a compact rectangle.

**Checks.**

- For f=z², fx=2z and fy=2iz, so i fx−fy=0 and every rectangle integral is zero.
- For f=z̄, fx=1 and fy=−i, so i fx−fy=2i; the counterclockwise unit-square integral of z̄ dz
  is 2i, not zero, in agreement with Layer 6's identity ∮F dz=2i∫∂̄F dA.
- For φ(x,y)=y and F=R=[0,1]², the scalar boundary difference and area derivative integral
  are both 1, so the estimate reads 0≤0. For a horizontal singleton slice F, both are zero.
- For interpolation data g(0)=0, g(1)=1 with N=1, the gap slope is 1 and the endpoint
  difference is 1; the constant interpolant fails the endpoint law.
- A centered square of half-side r has area 4r² and its containing ball has area 2πr²;
  at r=1 the average-comparison factor is π/2, not 2π.

*Needs:* Mathlib locally compact Baire, rectangle Cauchy–Goursat, off-countable FTC,
product Fubini, dominated vector-measure extension, variation, signed/complex Radon–Nikodym,
Besicovitch/Vitali differentiation and density; Tau Ceti Morera. The new interpolation,
content and comparison steps are the targets specified above, independent of all later layers.

### 0.3 Compact-support Cauchy–Green

Let `dA` be native Lebesgue `volume` on ℂ, normalized by
`Complex.volume_preserving_equiv_real_prod`. The compact-support Cauchy–Green operator is
Tau Ceti's Cauchy transform: for compactly supported `C¹` φ,
`Tφ(z)=(1/π)∫φ(ζ)/(z−ζ) dA(ζ)`, the integral `π⁻¹ ∫ (z − ζ)⁻¹ • φ(ζ)` of
`TauCeti/Analysis/Complex/Pompeiu/Basic.lean`, whose kernel is locally integrable by
`Complex.locallyIntegrable_inv`. The identities `∂̄Tφ=φ`
(`HasCompactSupport.conjWirtingerDeriv_integral_sub_inv_smul_apply_one`, which gives
`∂̄∫(z−ζ)⁻¹φ(ζ)=πφ`), `T(∂̄φ)=φ`
(`HasCompactSupport.two_pi_inv_smul_integral_sub_inv_smul_fderiv_apply_one_add_I_smul_apply_I`,
which reads `(2π)⁻¹∫(z−ζ)⁻¹(φ_x+iφ_y)(ζ)=φ(z)`) and holomorphy of `Tφ` off the support of
φ (`differentiableOn_integral_sub_inv_smul_compl`) are native for compactly supported `C¹`
data; the normalization and sign are fixed by that displayed kernel, `z−ζ` and not `ζ−z`.
The fundamental-solution identity
`∫ ζ, (1/(π*ζ))*∂̄φ(ζ) dA(ζ) = −φ(0)`
for every smooth compactly supported test function φ is the reconstruction identity at
`z=0`; it defines `∂̄(1/(πz))=δ₀` through integration by parts and is not a pointwise
derivative claim or a sesquilinear test pairing. Bochner integrals use the native complex
Banach carrier. A smooth compactly supported datum has a smooth `∂̄`-primitive on the plane
(`exists_contDiff_conjWirtingerDeriv_apply_one_eq_of_hasCompactSupport` with `n=∞`).

Prove here what the native transform does not state. For bounded measurable compactly
supported input, prove integrability of the translated kernel for each z, complex-linearity
and commutation with translations. For smooth compactly supported input, prove that `Tφ`
itself is smooth with every derivative transferred to the datum, `∂^α(Tφ)=T(∂^α φ)`, by
differentiating the convolution with the locally integrable kernel. These scalar analytic
results use native real-plane measure and calculus, independently of a manifold-form
implementation. For a
cutoff `α` equal to one near `K`, apply the reconstruction identity to `αf`; the remaining
cutoff-derivative term has support separated from `K`. Its integral kernel is smooth on the product
of that support with `K`, so Riemann sums approximate the integral uniformly on `K`. Prove the uniform Riemann-sum lemma: for compact `K₁,K₂` and continuous `G:K₁×K₂→ℂ`,
partition a bounded box containing `K₁` into half-open squares of mesh δ, retain the finitely
many cells meeting `K₁`, and choose a sample in each positive-area intersection. The sums
`Σ_{j,k}G(z_{jk},ξ)Area(S_{jk}∩K₁)` converge uniformly in `ξ∈K₂` to
`∫_{K₁}G(z,ξ)dA(z)`. Bound the error by `Area(K₁)ω_G(√2δ)` using the uniform modulus
on `K₁×K₂` (and state the boundary-cell convention). Record `dz∧dz̄=−2i dA` only as a
later coordinate identity; this scalar lemma uses real-plane Bochner area measure and no form carrier. This is the compact-product lemma used with the cutoff derivative kernel. These belong to the GH0 preparatory layer and precede Runge approximation. In particular, if α is compactly supported in U and α=1 near K, then on K
`f(ξ)=T(∂̄(αf))(ξ)=(1/π)∫ f(ζ)∂̄α(ζ)/(ξ−ζ) dA(ζ)`; the support of `∂̄α` is separated
from K. The cutoff satisfies `HasCompactSupport α`, `tsupport α ⊆ U`, and `α=1` near K;
f is holomorphic on U and αf is extended by zero outside U.

The transform API is:

- For bounded measurable compactly supported data the defining integral is integrable at every point.
- It is complex-linear on such data and commutes with translations; smooth compactly supported
  data give smooth outputs, with derivatives transferred to the datum.
- On compactly supported `C¹` data it is a right inverse to ∂̄, and its application to ∂̄φ
  reconstructs φ; both are native. No compact support of the output is claimed.

**Checks.**

- For φ=0, Tφ=0, ∂̄Tφ=0 and T(∂̄φ)=0.
- For a radial smooth cutoff φ with φ(0)=1 and φ=0 beyond radius 1,
  the weak kernel integral is −1: its radial expression is ∫₀¹φ′(r)dr=−1.
  Reversing z−ζ to ζ−z would change the right-inverse sign.
- The kernel norm integral over a radius-r disk is 2πr; at r=1 it is 2π, although
  the kernel has no finite bound near zero.
- For constant G=c the quadrature sum and integral both equal c·Area(K₁), with error 0;
  for zero-area K₁ both vanish, including every boundary cell.

The inverse and reconstruction are Rainer, Theorem 10.2 and proof, pp. 23–24;
the cutoff identity is Theorem 10.3, p. 24 (rainer lines 1255, 1295).
The quadrature estimate is derived from uniform continuity and area additivity as above.
*Needs:* Layer 0.1; the native Cauchy transform identities; real-plane Lebesgue integration,
smooth cutoffs and differentiation under integrals. No manifold Stokes theorem is an input.



### Examples

For z and z̄ the operator pairs are (1,0) and (0,1); a unit radial cutoff has weak kernel integral −1. The subsection Checks fix the detailed conventions.

### Dependencies

Native real/complex calculus and measure theory; Tau Ceti's Wirtinger derivatives, Cauchy
transform and Morera. No later layer supplies an input.

## Layer 1: preparatory locally uniform products

### 1.1 Derivatives and logarithmic bounds of the primary factors

The primary factor `elementaryFactor`, `Eₚ(w)=(1−w)exp(Qₚ(w))` with `Qₚ(w)=Σₖ₌₁ᵖ wᵏ/k`, its
normalization `Eₚ(0)=1`, its single simple zero at `w=1`, its sharp estimate
`|1−Eₚ(w)|≤|w|^(p+1)` on the closed unit disk, the compact-summability product theorem and
the countable variable-genus product with exact orders, `exists_entire_primary_product_exact`,
are AnalyticNumberTheoryPartI §0.15, and `E₁` is ZerosOfLFunctions Layer 5.2's factor.
Prove here the derivative identities of every genus: `Eₚ′(w)=−wᵖ exp(Qₚ(w))` on ℂ, by
differentiating the defining formula with `Qₚ′(w)=Σₖ₌₀^(p−1) wᵏ=(1−wᵖ)/(1−w)` for `w≠1`
and the telescoping `−1+(1−w)Qₚ′(w)=−wᵖ` for every `w`, and `Eₚ′(w)/Eₚ(w)=−wᵖ/(1−w)` for
`w≠1`; the case `p=1` is ZerosOfLFunctions Layer 5.2's `deriv E₁ z = −z exp z`. Prove the
normalized logarithmic bound `log ‖E₁(w)‖≤‖w‖²` for `‖w‖≤1`: the sharp estimate gives
`‖E₁(w)‖≤1+‖w‖²` and `Real.log (1+t) ≤ t` for `t ≥ 0`; at `w=1` the left side is
`Real.log 0 = 0`. These identities are the differentiation of the defining formula in
Rainer, Remark 15.4, p. 38 (rainer line 2030).

The primary-factor API here consists of the two derivative identities for every genus, the
logarithmic derivative off `w=1`, and the genus-one logarithmic bound on the closed disk;
the factor itself, its zero and its sharp estimate are consumed.

**Checks.**

- E₁′(1)=−e, from Eₚ′(w)=−wᵖ exp(Qₚ(w)) at p=1, agreeing with ZerosOfLFunctions Layer 5.2.
- E₀′(w)=−1 for every w, since Q₀=0 and E₀(w)=1−w; a formula with the sign reversed
  would give +1.
- E₂′(−1)=−exp(−1/2): Q₂(−1)=−1+1/2 and (−1)²=1; differentiating E₂=(1−w)exp(w+w²/2)
  directly gives exp(Q₂)(−1+(1−w)(1+w))=−w² exp(Q₂).
- At w=1/2, log ‖E₁(w)‖=log((1/2)e^(1/2))≈−0.193≤1/4; at w=1 the bound reads 0≤1.

*Needs:* AnalyticNumberTheoryPartI §0.15; ZerosOfLFunctions Layer 5.2; Mathlib `deriv` of
products and exponentials, geometric sums and `Real.log` with its totalized value at zero.

### 1.2 Genus-one products over weighted zero support

For AnalyticNumberTheoryPartI §0.15's primary factor Eₚ, whose normalization, zero and
genus-one identification are that section's, with the derivative identities of 1.1,
supply the following weighted-support specialization without choosing an enumeration.
Let `S⊂ℂ\{0}` be countable, meet each compact set in finitely many points, and carry
finite multiplicities `m:S→ℕ`. Zero multiplicities are allowed; for actual zero support
they are positive. If `Σ_(ρ:S) m(ρ)/‖ρ‖²<∞`, then

`P(z)=∏' (ρ:S), E₁(z/ρ)^(m(ρ))`

converges locally uniformly on ℂ, is entire, satisfies `P(0)=1`, and has analytic order
`m(ρ)` at each `ρ∈S` and zero order elsewhere. Its native meromorphic divisor has these
same values, cast to ℤ. Include empty and finite support.

Apply AnalyticNumberTheoryPartI's `exists_entire_primary_product_exact` to `ι=Σ (ρ:S), Fin (m ρ)`,
`a(ρ,j)=ρ`, and constant `p=1`. Compact finiteness of S and finiteness of every `Fin (m ρ)`
give cofinite escape for a. For each `R>0`, summing over the finite fibers gives exactly
`Σ_(i:ι) (R/‖a i‖)² = R² Σ_(ρ:S) m(ρ)/‖ρ‖²`.
Prove the local-uniform product grouping identity between this repeated-index product
and the product of powers over S, including convergence at zeros; do not justify the
identity merely by manipulating totalized `tprod` values. Identify the zero fiber at ρ
with `Fin (m ρ)` and translate `analyticOrderAt` through the native
`AnalyticOnNhd.divisor_apply` formula. Thus equal multiplicities give equality of native
divisors, without a private zero-divisor carrier.

Expose a native-divisor form: for `D : Function.locallyFinsuppWithin Set.univ ℤ`
on ℂ, with `∀ z, 0≤D z`, `D 0=0`, and
`Σ_(ρ:D.support) (D ρ)/‖ρ‖²<∞` (real casts), construct the normalized entire product
with factors `E₁(z/ρ)^((D ρ).toNat)` and native divisor exactly D. Derive countability
and compact finiteness from D rather than asking the consumer to supply them.
The real cast agrees with the natural multiplicity because D is nonnegative.

The signatures `exists_entire_genusOne_product` and
`exists_entire_genusOne_product_of_divisor` test this summability-input extension.
When D is the divisor of an order-one entire function nonzero at zero, the normalized
product is the supplied canonical product, by uniqueness of its locally uniform limit.
The growth/counting argument and the linear bound on the exponential factor belong to
the supplier contract; neither is an input to the summability-input theorem.

The weighted-product API identifies the grouped and repeated-index limits, their normalization,
analytic orders and native divisors; restriction to compact disks and insertion of zero
multiplicities preserve the limit. This is the inverse-square-input consequence of
AnalyticNumberTheoryPartI §0.15, using Rainer, Theorem 14.3, pp. 35–36 (rainer line 1868).

**Checks.**

- S=∅ or D=0 gives P=1 and divisor 0, with P(0)=1.
- S={1}, m(1)=2 gives P(z)=(1−z)² exp(2z); the analytic order and divisor at 1 are both 2.
- S={2}, m(2)=0 contributes factor 1 and order 0; forbidding zero multiplicity would lose this input.
- For S={1}, m=2, the repeated-index majorant is 2R²=R²·2, fixing the real multiplicity cast.

*Needs:* AnalyticNumberTheoryPartI §0.15; ZerosOfLFunctions Layer 5.1's support API; finite-fiber grouping for
locally uniform products and the native analytic-order/divisor comparison.

### 1.3 Variable exponents, genus, and logarithmic derivatives

For any escaping sequence, the universal choice `p_n=n−1`, indexed by n≥1, is admissible:
on each disk of radius R the tail has `R/|a_n|≤1/2`, hence its majorant is at most `2^(−n)`.
For constant p, define the genus of the repeated nonzero zero list to be the least p∈ℕ with
`Σ |a_n|^(−p−1)<∞`, and infinity if none exists; use genus zero for finite/empty lists.
Prove that this summability is equivalent to absolute locally uniform convergence of the
primary-factor deviations on compact disks for a fixed p. This is the unordered absolute
criterion; a product grouped in opposite pairs can converge even when its ungrouped
genus-zero criterion fails. AnalyticNumberTheoryPartI §0.15a's factorization permits variable
p_n and therefore imposes no finite-genus hypothesis.

For holomorphic factors f_i on open U, finite partial products P_s converging locally uniformly
to F, and an open V⊆U on which every factor and F are nonzero, prove locally uniform convergence
on compact subsets of V of
`logDeriv P_s = Σ_{i∈s} f'_i/f_i` to `F'/F`.
Use the unordered finite-subset filter when convergence is unordered, or the specified
partial-product sequence when an order is part of the data. Consume
`Complex.logDeriv_tendsto` from `Mathlib/Analysis/Complex/LocallyUniformLimit.lean` and
the finite-product rule with their exact derivative and nonvanishing hypotheses. An unpaired
series of principal parts receives no value from a paired-product identity.

The genus API assigns the least admissible constant genus, is invariant under permutation
and finite insertion, and distinguishes absolute convergence from prescribed pairing.
Logarithmic derivatives are taken only on the simultaneous nonvanishing locus.

**Checks.**

- A finite or empty zero list has genus 0; its reciprocal-power sum is a finite sum or 0.
- For aₙ=n, Σ1/n diverges and Σ1/n² converges, giving genus 1; pairing ±n can nevertheless
  produce convergent factors 1−z²/n².
- For aₙ=2ⁿ, Σₙ≥₁1/2ⁿ=1, giving genus 0. With variable pₙ=n−1 and ratio at most 1/2,
  the tail bound is 2⁻ⁿ, whose sum from N is 2¹⁻ᴺ.

This is derived from the expansion of AnalyticNumberTheoryPartI §0.15's primary factor and Rainer,
Remark 15.4, p. 38 (rainer line 2030); logarithmic-derivative passage uses the pinned theorem in
the supplier contract.
*Needs:* AnalyticNumberTheoryPartI §0.15; native power-series estimates and `Complex.logDeriv_tendsto` with
nonzero limit and holomorphic approximants; the finite-product derivative rule.

### 1.4 Sharp finite-product majorant

For every finite set `s` and `u : ι → ℂ`, put `P_s=∏_(i∈s)(1+u_i)` and
`A_s=∏_(i∈s)(1+‖u_i‖) : ℝ`. Prove both inequalities

`‖P_s−1‖ ≤ A_s−1` and `A_s ≤ exp(Σ_(i∈s) ‖u_i‖)`.

The first is `norm_prod_one_add_sub_one_le_prod_one_add_norm_sub_one`, a separate sharp
finite-induction target: the native
`Finset.norm_prod_one_add_sub_one_le` supplies the exponential consequence but does not
state this intermediate bound. For insertion of a fresh index, use
`P_(insert i s)−1=(P_s−1)(1+u_i)+u_i`, the triangle inequality,
`‖1+u_i‖≤1+‖u_i‖`, and `A_s≥1`. For the second bound use
`Real.prod_one_add_le_exp_sum` (`Mathlib/Analysis/Complex/Exponential.lean`) applied to the
nonnegative family `t_i=‖u_i‖`. Expose the combined bound `‖P_s−1‖≤exp(Σ_(i∈s)‖u_i‖)−1`
for consumers.
No factor is divided out: zero factors, `u_i=0`, and an empty index set are allowed;
for the empty set `P_s=A_s=1` and the sharp error is zero. These finite estimates precede
the arbitrary-set uniform-tail and holomorphic product targets below. They do not introduce
a logarithm of a vanishing factor or replace either sequential or unordered convergence.

The finite-product API includes insertion, disjoint-union multiplication and the sharp error
bound, with no nonvanishing hypotheses. The sharp inequality is the monomial expansion
in Rainer, proof of Proposition 14.2, p. 35 (rainer line 1843).

**Checks.**

- The empty product gives ‖1−1‖=0 and 1−1=0.
- With two terms u₁=u₂=1, both sharp sides are 3, while the exponential comparison is 4≤e².
- With u₁=−1 and u₂=0, the product is 0 and both sharp sides are 1; division by a factor is invalid.

*Needs:* Mathlib finite products, triangle inequality and `Real.prod_one_add_le_exp_sum`;
the sharp step uses only finite induction, independently of all infinite-product conclusions.

### 1.5 Uniform-tail product criterion

For an arbitrary set X and functions `u_n : X → ℂ`, assume each u_n is bounded on X,
each series `Σ_n |u_n(x)|` converges, and these series have uniformly vanishing tails on X:
for every ε>0 there is N such
that `Σ_(n≥N) |u_n(x)|<ε` for every x∈X. Prove uniform convergence of the sequential
partial products `P_N(x)=∏_(n<N)(1+u_n(x))`, and that the limit vanishes at x exactly when
one factor vanishes. State empty-X and finite-factor cases. This criterion does not require
summability of `Σ_n sup_X |u_n|`. Identify the limit with the native pointwise
`∏' n, (1+u_n(x))` and prove `HasProdUniformlyOn` on X through the unordered
finite-subset filter, as well as convergence of the displayed sequential products.

Use boundedness of the finite head and a uniformly small absolute tail to obtain one bound
C for the full absolute sums. Finite product estimates give
`|P_M−P_N|≤exp(C)(exp(ε)−1)` uniformly once the tail is below ε. The relative estimate
`|P_M−P_N|≤|P_N|(exp(ε)−1)` gives a nonzero tail and the zero criterion. Reuse
`Finset.norm_prod_one_add_sub_one_le`, `multipliable_one_add_of_summable`, and
`tprod_one_add_ne_zero_of_summable` from `Analysis/SpecialFunctions/Log/Summable.lean`
for the finite estimate and pointwise product and nonvanishing conclusions; the new
interface supplies the uniform tail control.
For holomorphic u_n on open Ω, assume pointwise absolute summability and uniformly
vanishing absolute tails on every compact K⊆Ω. Apply the
criterion on compact neighborhoods, then use native local-uniform holomorphic closure.
Prove both the sequential partial-product conclusion and the unordered finite-subset-filter
conclusion `HasProdLocallyUniformlyOn`; the same absolute-tail estimate controls all omitted
finite subsets, so reordering does not change the limit. Prove the order identity
`analyticOrderAt F z = ∑' n, analyticOrderAt (fun w => 1+u_n w) z` in `ℕ∞` for z∈Ω,
including infinite order when a factor has zero germ. A sufficiently small uniform absolute
tail is a unit on a compact disk, leaving only finitely many factors carrying nonzero order.
When no factor vanishes identically on the component, these orders are finite and the
identity is a finite sum. Use native analytic order and its factorization characterization.
The stronger compact-sup-summability criterion of AnalyticNumberTheoryPartI §0.15 is also a
useful sufficient condition.

The uniform-tail product API supplies sequential and unordered convergence, nonvanishing
exactly off the union of factor zero sets, and addition of germ orders. It is the
uniform-tail form of Rainer, Theorem 14.3, pp. 35–36 (rainer line 1868).

**Checks.**

- On an empty set every uniform error bound is vacuous, and the empty product is 1.
- One factor u₀=−1 followed by zero deviations gives product 0 and infinite germ order;
  omitting zero germs would make the order statement false.
- On X=ℕ, set uₙ(x)=1/(n+1) when x=n and 0 otherwise. The uniform absolute tail is
  1/(N+1)→0, while Σₙ supₓ|uₙ(x)| is the divergent harmonic series.

*Needs:* Layer 1.4, native pointwise product and nonvanishing theorems, holomorphic local-uniform
limits and analytic orders; the finite-head bound supplies uniform Cauchy control.



### Examples

The double factor at 1 has order 2, and the empty product has value 1 and order 0. The subsection Checks fix the detailed conventions.

### Dependencies

ZerosOfLFunctions Layer 5.1–5.4, AnalyticNumberTheoryPartI §0.15 and native product/analytic-order
APIs. No global factorization is used.

## Layer 2: plane domains, compact hulls, and Runge approximation (GH0)

### 2.1 Holomorphic hulls and Runge exhaustions

Define `holomorphicHull`, the Ω-holomorphic hull of nonempty compact K⊆Ω by all z∈Ω satisfying
|g(z)|≤sup_(w∈K)|g(w)| for every g holomorphic on Ω; the empty set has empty
hull. Equivalently every real bound for an Ω-holomorphic function on K holds at the point;
this formulation also forces the empty hull to be empty. Prove extensivity, monotonicity
and idempotence directly from the definition. Prove compactness without any approximation
theorem: the hull is relatively closed in Ω, the identity function bounds it inside the
closed disk of radius sup_(w∈K)|w|, and for ζ∉Ω the function 1/(z−ζ) gives
dist(z,ζ)≥dist(K,ζ) on the hull, so the hull is closed in ℂ and bounded. Prove the
maximum-principle inclusion: every component of Ω∖K whose closure is compact and contained
in Ω has boundary inside K and lies in the hull. The reverse inclusion is
`holomorphicHull_eq_fill` in 2.5, after scalar Runge.
For compact K⊆Ω and open Ω, prove equality of the extended set distances to the complement:
`(⨅ z∈K̂_Ω, ⨅ w∈Ωᶜ, edist z w) = (⨅ z∈K, ⨅ w∈Ωᶜ, edist z w)`.
Empty infima are ∞, covering K=∅ and Ω=ℂ. For nonempty K and nonempty complement,
deduce the ordinary distance equality to ∂Ω. Prove also `K̂_Ω⊆conv(K)`, using
`sup_{w∈K} ℓ(w)` for each continuous real-linear functional ℓ to separate points from the
ordinary convex hull; exponential holomorphic functions realize these real support bounds.
The Runge exhaustion of Ω is the explicit sequence
`K_n=closedBall 0 (n+1) \ thickening (n+1)⁻¹ Ωᶜ` for n∈ℕ. Each stage is compact, as a closed
ball minus an open set (`isCompact_closedBall`, `isOpen_thickening`); it lies in Ω, since
every point of Ωᶜ lies in its own thickening; and it is filled in Ω
(`IsFilledIn (K n) Ω`: no component of Ω∖K_n is relatively compact in Ω) by Tau Ceti's
`IsOpen.isFilledIn_closedBall_sdiff_thickening` with r=n+1 and δ=(n+1)⁻¹. Prove the nesting
`K_n⊆int K_(n+1)`: a point of K_n has norm at most n+1 and extended distance at least
(n+1)⁻¹ to Ωᶜ, so it lies in the open set `ball 0 (n+2) \ cthickening (n+2)⁻¹ Ωᶜ`, which is
contained in K_(n+1). Prove `⋃ₙ K_n=Ω`: a point z of the open set Ω has positive extended
distance to the closed set Ωᶜ (∞ when Ωᶜ is empty), so z∈K_n as soon as ‖z‖≤n+1 and (n+1)⁻¹
is at most that distance. Prove its compact cofinality: a compact subset of Ω is covered by
the open interiors and so lies in one stage. Tau Ceti's
`IsOpen.exists_isFilledIn_compact_exhaustion` asserts only that some filled compact
exhaustion exists; Layers 3.1, 3.2, 4.1 and 7.1, which need no stage formula, may use it,
while 2.2 and 3.3 use the explicit stages and the nesting, union and cofinality proved here.
Prove also that the hull of any compact K is filled in Ω: a component of
Ω∖K̂ with compact closure in Ω would lie in the hull of K̂, which is K̂ itself, by the
maximum-principle inclusion and idempotence (Rainer, Lemma 11.3, items (1), (2) and (4),
pp. 27–28, and the construction in the proof of Theorem 12.1, p. 31).

The hull API includes compactness, extensivity, monotonicity, idempotence, the
maximum-principle inclusion of relatively compact complementary components, and the
distance and convex-hull comparisons. The exhaustion API has nested interiors, union Ω and
compact cofinality, proved here, with the compactness and filledness of every stage from the
native theorems above.
These are Rainer, Lemma 11.3, pp. 27–28 (rainer line 1437), apart from its item (3), which
is the hull equality of 2.5; the exhaustion is its recursive compact-cofinal consequence.

**Checks.**

- For K=∅, the universal bound B=−1 for f=0 excludes every point, so its hull is ∅;
  both extended distance infima are ∞.
- For K={2≤|z|≤3} in Ω={|z|<4}, the hull is {|z|≤3}; the common distance to Ωᶜ is 1.
- For the same K in Ω={1<|z|<4}, the hull is K. The function 1/z excludes |z|<2;
  filling this ambient hole would be wrong.
- In Ω=ℂ the complement is empty and its thickening is empty, so the stage K_n is
  the closed ball of radius n+1, which is its own hull.
- For Ω the open unit disk, the thickening of radius 1 of {|z|≥1} is {z≠0}, so K_0={0},
  K_1={|z|≤1/2} and K_2={|z|≤2/3}; 0 lies in int K_1, as nesting requires. Reading the
  thickening radius as n+1 instead of (n+1)⁻¹ would remove the whole disk from every stage.

*Needs:* Tau Ceti's `IsOpen.isFilledIn_closedBall_sdiff_thickening`; Mathlib compact closed
balls, open thickenings, extended distances and connected components; the maximum
principle and the elementary separating functions z, 1/(z−ζ) and exp(az). No later
subsection is used.

### 2.2 Holomorphic functions with compact-open convergence

For an open set `U : TopologicalSpace.Opens ℂ`, `H(U)` is Tau Ceti's `holomorphicFunctions U`:
the complex subalgebra of native `C(U,ℂ)` of continuous maps that agree on `U` with a function
`DifferentiableOn ℂ` on `U`, with the topology and uniformity inherited from compact
convergence on `C(U,ℂ)`. Its contract is consumed, not restated: membership is holomorphy of
the zero extension (`mem_holomorphicFunctions_iff_extend`), so values outside `U` play no
role; the subalgebra is closed (`isClosed_holomorphicFunctions`) and complete (its
`CompleteSpace` instance); convergence of a net in `H(U)` is `TendstoLocallyUniformlyOn` of
the zero extensions on the open set `U` (`HolomorphicFunctions.tendsto_iff_tendstoLocallyUniformlyOn`);
restriction to a smaller open set is a continuous algebra homomorphism
(`HolomorphicFunctions.restrict`, `continuous_restrict`); the finite jet at a point of `U` is
linear with kernel of codimension at most `n` (`HolomorphicFunctions.jet`,
`finrank_quotient_ker_jet_le`); and on the kernel of the `(n+1)`-jet at the centre of a disc
of radius `R` inside `U`, a bound on that disc gives the bound times `(r/R)^(n+1)` on the
concentric closed disc of radius `r<R` (`norm_le_mul_pow_of_mem_ker_jet`). Point evaluation
and the algebra operations are continuous because the topology is the compact-open one. On
`U=∅` the space `H(U)` has one element. What remains here is quantitative: an explicit metric
realizing this uniformity and the continuity of differentiation.

Use Mathlib’s native compact-convergence infrastructure:
`CompactExhaustion.hasAntitoneBasis_compactConvergenceUniformity` gives an entourage basis;
its countable-generation instance on a locally compact σ-compact source supplies
metrizability; and `ContinuousMap.tendsto_iff_tendstoLocallyUniformly` identifies convergence.
Construct the following explicit comparison metric for that same uniformity. Keep the
comparison distance on `C(U,ℂ)` as an explicit definition and prove that it induces the native
uniformity; install no metric instance on `C(U,ℂ)` or on `H(U)`. Use the explicit filled
exhaustion of 2.1, reindexed by integers n≥1, with Ω the underlying set of U,

`K_n = closedBall 0 n \ thickening (1/n) Ωᶜ = {z : ℂ | ‖z‖ ≤ n ∧ Metric.infEDist z Ωᶜ ≥ ENNReal.ofReal (1/n)}`.

Its compactness is native; the nesting `K_n ⊆ int K_(n+1)` and the cofinality among compact
subsets of Ω are proved in 2.1.
For Ω=ℂ the extended distance to its empty complement is ∞; only the radius cutoff remains.
For Ω=∅ every K_n is empty. The metric construction uses no Runge
theorem and no normal-family theorem. Any cofinal nested compact exhaustion gives the same
uniformity, by the native compact-exhaustion basis theorem.

For continuous maps f,g on U put `s_n(f,g)=sup_(z∈K_n) |f(z)−g(z)|`, with value zero for
empty K_n, and define

`d_C(f,g)=Σ_(n≥1) 2^(−n) s_n(f,g)/(1+s_n(f,g))`.

Prove it is a metric on `C(U,ℂ)`, and restrict it to d on H(U). Bound each term by
`2^(−n)`; use monotonicity and subadditivity of `t/(1+t)` for the triangle inequality and
cofinality for separation. Also compare with the metric using `min(1,s_n)`, via
`min(1,t)/2 ≤ t/(1+t) ≤ min(1,t)` for t≥0.

Prove equality of uniformities, rather than only a statement about convergent sequences.
A finite collection of compact-sup conditions is controlled by one K_N and the smallest
requested tolerance ε. The inequality `d_C(f,g)<2^(−N)ε/(1+ε)` implies those conditions.
Conversely, bound the geometric tail after N by ε/2 and the finite initial sum by ε/2 using
finitely many compact-sup conditions. Deduce that convergence and the Cauchy property for d
are exactly uniform convergence and uniform Cauchy convergence on every compact subset of U,
and that d is independent of the exhaustion. For every compact K⊆Ω, restriction
to native `C(K,ℂ)` is uniformly continuous for d, using cofinality and the same quantitative
bound. Since `H(U)` is complete for the native uniformity, d is a complete metric on `H(U)`.

Define the derivative map `H(U) → H(U)`, sending `f` to the restriction to `U` of
`deriv (HolomorphicFunctions.extend f)`, holomorphic on `U` by the native derivative of a
holomorphic function, and prove its compact-open continuity by `TendstoLocallyUniformlyOn.deriv`
and the Cauchy estimates on compact neighborhoods; it is complex-linear. These are
function-space results independent of Montel; ConformalMapping's compactness criterion is
stated on ambient families and does not consume this space.

The function-space API is:

- The displayed metric induces exactly the native compact-convergence uniformity on `C(U,ℂ)`
  and on `H(U)`, independently of the exhaustion; compact restrictions are uniformly
  continuous for it, and it is complete on `H(U)`.
- The derivative map is a continuous complex-linear endomorphism of `H(U)` for the compact-open
  topology; point evaluation, open restriction and the algebra operations are continuous.

**Checks.**

- On U=∅ there is one function; every compact seminorm and the distance are 0.
- On a nonempty U with every exhaustion stage nonempty, constants differing by 1 have
  distance Σₙ≥₁2⁻ⁿ/2=1/2; replacing the comparison metric by an unbounded sup norm is wrong.
- On ℂ the constant functions 1/(n+1) are Cauchy on every compact and tend to the holomorphic
  zero map; their displayed distance to zero is 1/(n+2).
- For t=1, min(1,t)/2=t/(1+t)=1/2≤1, fixing both comparison constants.
- On the open unit disk, fₙ(z)=zⁿ/n tends to 0 compact-openly and so does fₙ′(z)=zⁿ⁻¹; the
  sup norms over the whole disk are 1/n and 1, so differentiation is continuous for the
  compact-open topology and not for the sup norm on U.

The metric and derivative-continuity targets are Rainer, §11, equation (11.2) and
Exercises 19–20, p. 25 (rainer lines 1313, 1329); completeness is Tau Ceti's.
*Needs:* Tau Ceti's `holomorphicFunctions` contract; Mathlib compact-convergence uniformity,
compact exhaustions and the locally uniform derivative theorem; Layer 2.1's explicit exhaustion
stages with their nesting and cofinality; no Runge or Montel theorem is needed.

### 2.3 Neighborhood-holomorphic restrictions on a compact set

For compact K⊆ℂ, the germs near K of functions holomorphic on some open neighborhood of K
form Tau Ceti's `holomorphicGerms K`; neighborhoods may depend on the function, and the
algebra laws, the evaluations at points of K, the restriction to a smaller set and the germ map
`HolomorphicFunctions.toGerm` from `holomorphicFunctions U` for open U⊇K are native. Define
the value map from `holomorphicGerms K` to native `C(K,ℂ)`, sending a germ g to
`x ↦ holomorphicGerms.eval x x.2 g`; it is continuous on K because a representative is
holomorphic on a neighborhood of K, and it is a complex algebra homomorphism because each
evaluation is. Define O(K) as its range, a complex subalgebra of `C(K,ℂ)`. The value map need not be
injective: for K={0} the germs of z and of 0 have the same value, so O({0})=ℂ while
`holomorphicGerms {0}` is infinite-dimensional; for the closed unit disk it is injective, by
the identity theorem on a connected neighborhood. Restriction of continuous maps to a smaller
compact K′⊆K carries O(K) into O(K′), by `holomorphicGerms.eval_restrict`, and the
restriction to K of `holomorphicFunctions U` for open U⊇K lands in O(K) through
`HolomorphicFunctions.toGerm`. Express Runge approximation as density of the restriction
image of H(Ω) in O(K), with its inherited sup-norm topology. Distinguish this space from
functions merely holomorphic on the interior of K.

Prove by explicit examples that O(K) need not be open or closed in C(K,ℂ). For the closed
unit disk, small nonzero multiples of `conj z` tend to zero in norm but cannot extend
holomorphically across the disk, so O(K) is not open. The polynomial partial sums of
`Σ_(n≥0) z^n/(n+1)^2` converge uniformly on that disk to a continuous function. Its derivative
along the real radius tends to infinity as r→1: use nonnegative derivative coefficients,
their divergent sum at 1, and finite-head lower bounds as r increases to 1. A holomorphic
extension near the closed disk would have bounded derivative near 1, a contradiction.
Thus O(K) is not closed. These are counterexamples to a general open/closed assertion;
for finite K, O(K)=C(K,ℂ) by polynomial interpolation, including empty K.

The neighborhood-restriction API is the value map with its range O(K), the examples of its
kernel, finite interpolation and the dense image of H(Ω) under the Runge condition; the
algebra operations, evaluation and restriction are the native germ algebra's.
The carrier is Rainer, §11, p. 25 (rainer line 1333); the examples are derived using power series.

**Checks.**

- For K=∅, both O(K) and C(K,ℂ) contain exactly one function.
- For K={0,1}, a+(b−a)z realizes arbitrary values (a,b), so O(K)=C(K,ℂ).
- For K={0}, the germs of z and of 0 both have value 0, and O({0})=ℂ is one-dimensional;
  taking O(K) to be the germ algebra itself would make it infinite-dimensional.
- On the closed unit disk, εz̄ has norm |ε| and is not in O(K) for ε≠0, whereas 0 is.
- For Σzⁿ/(n+1)² the uniform coefficient tail tends to 0, but at radius 1 its formal
  derivative sum Σₙ≥₁ n/(n+1)² diverges, excluding a neighborhood extension.

*Needs:* Tau Ceti's `holomorphicGerms`, `holomorphicGerms.eval`, `holomorphicGerms.eval_restrict` and
`HolomorphicFunctions.toGerm`; Mathlib continuous maps on compact sets, polynomial interpolation
and power-series differentiation; Layer 2.5 for the density conclusion only.

### 2.4 Contour integration and compact-open closure

For finite piecewise-C¹ curves on compact parameter intervals [a,b] with a≤b, prove the integral estimate
`|∫_γ f−∫_γ g| ≤ sup_(trace γ)|f−g| · length(γ)` with `TauCeti.Contour`’s integral and
`length(γ)=∫|γ′|`, under the continuity/integrability hypotheses. Treat a=b as zero length and reverse orientation
by negation, retaining the same length bound. Derive continuity of integration
under uniform convergence on the trace, and the finite-cycle version by summing with the
cycle coefficients. Supply the rectangle/wedge-integral comparison to this contour API.
Also give a disk-Morera proof of compact-open holomorphic closure: rectangle and wedge
integrals pass to uniform limits as interval integrals, giving `IsConservativeOn`; apply
Mathlib’s `Complex.isConservativeOn_and_continuousOn_iff_isDifferentiableOn` directly. Tau Ceti's
`isClosed_holomorphicFunctions` already consumes `TendstoLocallyUniformlyOn.differentiableOn`;
the contour argument is a reusable proof route and continuity result, rather than a second
holomorphic-limit predicate or a second closedness theorem.

**Checks.**

- A constant path has length 0 and integral 0.
- On the unit circle f−g=1, the integral difference is 0 and the estimate is 0≤2π.
- Reversing a unit circle changes ∫dz/z from 2πi to −2πi, with the same length 2π.

This is the norm estimate for the native interval integral and the native rectangle Morera
criterion, applied with the stated continuity hypotheses.
*Needs:* Tau Ceti piecewise-C¹ integrals and finite cycles; Mathlib Bochner integral norm bounds
and `Complex.isConservativeOn_and_continuousOn_iff_isDifferentiableOn`.

### 2.5 Runge equivalences, pole pushing, and interpolation

Define `IsRungeCompactPair Ω K` as the conjunction of `IsOpen Ω`, `IsCompact K`, `K ⊆ Ω` and
Tau Ceti's `IsFilledIn K Ω`, the native absence of relatively compact complementary
components, named and not written out. Prove `isRungeCompactPair_iff_approximation`, the universal Runge equivalence: for compact K⊆Ω, the property that every
function holomorphic on every open neighborhood U of K can be uniformly approximated
on K by functions holomorphic on Ω holds if and only if no component of Ω\K is
relatively compact in Ω. Quantify over U and f in this equivalence. For any individual
such f, the no-hole condition supplies approximants with error below each ε>0. Also expose the equivalent hull equality and
the point-separation criterion, with their directions stated. Prove `holomorphicHull_eq_fill`:
for compact K⊆Ω, the hull equals K together with every component of Ω∖K whose closure is
compact and contained in Ω (Rainer, Lemma 11.3, item (3), pp. 27–28, rainer line 1437).
Layer 2.1 supplies the inclusion of these components. For the reverse inclusion, let K̃ be
K together with those components. Prove K̃ compact: Ω∖K̃ is open as a union of components
of Ω∖K, and for a relatively compact open neighborhood W of K in Ω only finitely many
relatively compact components of Ω∖K leave W, since each such component meets ∂W and
contains one of finitely many disks disjoint from K that cover ∂W. Prove that Ω∖K̃ has no
relatively compact component, so (Ω,K̃) is a Runge pair, and apply the point-separation
direction of the scalar equivalence to K̃: every a∈Ω∖K̃ has an f∈H(Ω) with
|f(a)|>sup_K̃|f|≥sup_K|f|, so a∉K̂_Ω. Hence K̂_Ω=K holds exactly when Ω∖K has no
relatively compact component; in particular every stage of 2.1's explicit exhaustion, being
filled in Ω, is its own hull. Specialize to polynomial
approximation on compact `K ⊂ ℂ` iff `ℂ \ K` is connected. Include the rational approximation
variant with a specified pole set meeting every component of the complement in the sphere.
Develop pole-pushing on nested compacta, rather than treating a picture or a single pole move as
the theorem. In the one-pole geometric-series step, assume `dist(a,K), dist(b,K) > 2δ` and
`|a−b|<δ`; then the expansion ratio is below `1/2`. For arbitrary `f∈H(ℂ\{a})`, first
truncate its Laurent series on a neighborhood of `K`, then push the finitely many pole terms. State
the uniform error on `K` and the finite chain hypotheses explicitly. Prove the finite-jet interpolation refinement: for a finite subset of K and
prescribed finite jet orders, the approximants may match the given neighborhood function’s
jets exactly while retaining arbitrary uniform approximation error on K. Build a finite
Hermite interpolation polynomial P matching those jets, using the Chinese remainder theorem
for the pairwise coprime powers `(X-a)^(m_a+1)`. Put `Q(z)=∏_a(z-a)^(m_a+1)`.
The quotient `(f-P)/Q` extends holomorphically at the marked points by the native analytic
order/factorization criterion. Apply scalar Runge to this extended quotient and set the
approximant to `P+Qg`. The error on K is bounded by `sup_K|Q|` times the quotient-approximation
error (use `max(1,sup_K|Q|)` to choose its tolerance). This preserves the jets even if K has
empty interior or a marked point lies on its boundary, without a later neighborhood lemma.

For the finite-chain pole-pushing construction on nonempty K, first choose `4δ₁<dist(w₀,K)` and
`w∈Θ∩B(w₀,δ₁)` when Θ is a connected component of Ω∖K and w₀∈closure Θ∖Ω. Join the initial
pole to w by a compact path in Θ, using openness and connectedness. Subdivide it with a
positive uniform separation from K, and finish with the straight segment from w to w₀ in
the K-free ball. Only separation from K is required of the final segment. For an unbounded
complementary component, move the pole to a sufficiently large point w in that component
and truncate its geometric expansion in z/w on K to obtain polynomials. This route handles
the unbounded component even when its closure contains no finite point of ℂ∖Ω; a finite excluded endpoint
is required only for the corresponding bounded-component construction.

Use the preparatory compact-support reconstruction and uniform Riemann-sum lemma under
their stated support hypotheses. Form finite sums of simple fractions, move poles across
complementary components using the geometric-series expansions, control errors uniformly on K,
and pass to hulls and an exhaustion. Prove the compactness and connected-component lemmas
used at each step, then derive the point-separation criterion with its precise quantifiers.

Also prove `exists_finite_rank_runge_operator`, the finite-rank linear Runge operator used by GH5 and CKG K2. If K⊆Ω is compact
and Runge and U⊃K is open, choose a compact collar L⊂U∩Ω with K⊂int L. For every ε>0,
construct N<∞, points ζ₁,…,ζ_N∈int L, weights w_j∈ℂ and g_j∈H(Ω), all independent of
f, such that the fixed linear operator
`A_ε f(z)=Σ_{j=1}^N w_j f(ζ_j)g_j(z)` satisfies
`sup_K |f−A_ε f| ≤ ε sup_L |f|` for every f∈H(U). The proof must yield this operator-norm
bound, not just pointwise existence of an approximant: start with the fixed-cutoff Cauchy–Green
formula, approximate its kernel integral by Riemann sums on K, control the sample and quadrature
terms by Cauchy estimates using the collar L, and push each of the finitely many fixed kernel
poles to a function in H(Ω), with the accumulated error bounded by ε sup_L|f|. State the
support/collar choices that make all estimates uniform. The finite-rank form is essential: it
commutes with differentiation in external smooth parameters and preserves holomorphic dependence
on external complex parameters.

The Runge-pair API includes equivalence with approximation and hull equality, restriction
of the approximation conclusion to smaller compacts, finite-jet interpolation and the fixed
finite-rank operator. Rainer, Theorem 11.1, p. 25 and Theorem 11.7, p. 29
(rainer lines 1338, 1550) supply scalar and rational Runge; the finite-rank and jet statements
are the explicit cutoff/quadrature and Hermite-interpolation consequences above.

**Checks.**

- A closed disk inside a larger disk has no relatively compact complementary component;
  polynomials approximate its neighborhood-holomorphic functions.
- The annulus K={2≤|z|≤3} inside {|z|<4} fails the condition: 1/z has circle period 2πi,
  whereas every disk-holomorphic approximant has period 0.
- The same K inside {1<|z|<4} satisfies the condition: 1/z itself is an admissible approximant.
- For K=∅, choose L=∅ and N=0; the finite-rank estimate has no evaluation points and is vacuous.
  For f=0, B=0, both sides of every nonempty-K estimate are 0.

*Needs:* Layer 0.3's cutoff reconstruction and uniform quadrature, Cauchy estimates, finite
pole-pushing and compact connected-component arguments; native polynomial CRT for finite jets.
The hull equality uses Layer 2.1's hull API after the scalar equivalence is proved.



### Examples

The annulus hull is the closed radius-3 disk in the disk ambient domain and the annulus itself in the annular ambient domain. The subsection Checks fix the detailed conventions.

### Dependencies

Layer 0 for scalar Runge; native compact-convergence and topology for function spaces. Within this layer, 2.1's hull API precedes 2.5, and 2.5's hull equality follows its scalar equivalence.

## Layer 3: prescribed zeros and divisor realization (GH1)

### 3.1 Divisors and zero-free Runge approximation

In `exists_holomorphic_with_zero_orders`, for a relatively closed discrete `E ⊆ Ω` and multiplicity `m : E → ℕ`, construct `f` holomorphic
on Ω with zero order exactly `m z` at every z in E and no other zeros, including the all-zero
multiplicity and empty-E cases. State the local order using the existing analytic/meromorphic
order APIs, including `AnalyticAt.analyticOrderAt_eq_natCast` and
`meromorphicOrderAt_eq_int_iff`; consume their order/factor characterizations with their exact
nonzero and unit hypotheses instead of reproving them here. Use the native locally-finite divisor
carrier when its hypotheses match; do not introduce a parallel closed-discrete predicate.

In `exists_meromorphic_with_divisor`, extend to integer divisors `ν : E → ℤ`: produce a meromorphic function with order `ν z` at each
z in E and order zero outside E, and require `meromorphicOrderAt f z ≠ ⊤` at every z∈Ω. This
excludes identically-zero components and makes the divisor statement meaningful. For every native
`MeromorphicOn F Ω`, construct holomorphic f,g with
`∀ᶠ z in codiscreteWithin Ω, g z ≠ 0 ∧ F z = f z / g z`.
The headline `exists_holomorphic_quotient` in Layer 4 states this consequence.
This is equality off a relatively closed discrete exceptional set, equivalently equality of the
meromorphic germs; arbitrary total-function values at exceptional points are not constrained.
Require g not identically zero on each nonempty connected component of Ω, including components
on which F has zero germ. State componentwise behavior when Ω is disconnected. The quotient statement is a consequence of
positive and negative parts of the divisor and the two realization theorems; it is not the
finite-support `extract_zeros_poles` result.

First prove `exists_zero_free_holomorphic_approximation`, zero-free Runge approximation: if K is Runge in Ω and u is holomorphic and
nowhere zero on a neighborhood of K, approximate u uniformly on K by a function holomorphic
and nowhere zero on all of Ω. Prove the winding-class extension needed for this result;
ordinary scalar Runge approximation only controls zeros near K. If Ω is disconnected, carry the
construction on all its components together: use one finite dual-cycle family over V and the
simultaneous correction below, not separate componentwise period systems. Prove a concrete
Runge-neighborhood construction. Fix a square grid and a dyadic mesh sequence δ_n=2^(−n)δ₀;
let L_n be the finite union of closed squares of mesh δ_n meeting K. For small δ₀, prove
K⊂int L_n⊂L_n⊂U∩Ω. The fixed-grid refinement gives L_(n+1)⊂L_n. Prove the hulls
H_n=(L_n)^_Ω (the Ω-holomorphic hull of L_n) are nested compacta and their intersection is K: for each holomorphic g,
continuity and L_n shrinking to K give sup_(L_n)|g|→sup_K|g|, while K is Runge. Hence for
every open N⊃K some H_n⊂N; otherwise nested compactness would give a point of
(⋂H_n)\N. Choose such n with H_n⊂U∩Ω and set V=int H_n. The hull H_n is compact and
Runge. Prove V is relatively compact and finite-connectivity, `closure V=H_n` for this finite
square-cell construction (or give the exact replacement compact Runge neighborhood with the same
hull), and every bounded component of ℂ\V meets ℂ\Ω. The proof must establish finite
polygonal boundary and local finiteness for this square construction; do not assume arbitrary
regular cells are affine convex cells.
For each bounded connected component B_k of ℂ\V choose a point a_k∈B_k\Ω. Prove the
finite dual-grid-boundary lemma: construct a cycle σ_k : `TauCeti.Contour.Cycle` whose finitely
many closed piecewise-C¹ terms lie in V and for which
`Cycle.IsIn σ_k V` and `Cycle.windingNumber a_l σ_k=δ_kl` for all bounded complementary
components B_l. The cycle terms may lie on several connected components of V. Build them from
finite oriented grid boundaries pushed into V; prove the boundary winding and disjoint-component
properties for this actual finite polyhedral construction. Do not postulate an abstract H₁(V;ℤ)
carrier or a basis theorem.
For a holomorphic nowhere-zero u on a neighborhood of V, define
`w_k=(2πi)⁻¹ Cycle.integral (u′/u) σ_k`. Define the finite image cycle u_*σ_k by composing
its supported curve generators with u; prove those compositions remain closed piecewise-C¹, and
prove the chain-rule identity between this integral and `2πi` times the winding of u_*σ_k about
0. Since 0 is outside its trace, `exists_int_windingNumber_of_not_mem_trace` makes w_k an integer.
Use the native `PiecewiseC1ClosedCurve.of`, its raw-curve integral comparison, and `Cycle`'s
additive integral/winding API; introduce only the needed finite composition and chain-rule adapter. For any finite cycle γ with `Cycle.IsIn γ V`, choose integers n_k(γ) satisfying
`(n_k(γ):ℂ)=Cycle.windingNumber a_k γ`. Prove
`Cycle.IsNullHomologous (γ−Σ_k n_k(γ) • σ_k) V`: at points outside V, winding is locally
constant on each complementary component; it is zero on the unbounded component, while on B_l
the subtracted cycle has winding `Cycle.windingNumber a_l γ−(n_l(γ):ℂ)=0`. Thus
`homologyCauchyTheorem` gives
`Cycle.integral (u′/u) γ = Σ_k n_k(γ) • Cycle.integral (u′/u) σ_k
=2πiΣ_k (n_k(γ):ℂ)w_k`, with no homology-group abstraction.
Set the exponents to these w_k and define the single rational function
`R(z)=∏_k(z−a_k)^{w_k}` on all Ω (empty product 1 when there are no bounded complementary
components). Every pole lies at a_k∉Ω, so R is holomorphic and nowhere zero on Ω. The
logarithmic-derivative period of R on σ_k is 2πi w_k. The null-homology identity above therefore
shows that `(u/R)′/(u/R)` has zero integral on every closed piecewise-C¹ cycle in V. Apply the
native exactness criterion and primitive-to-logarithm theorem on each component of V; the
componentwise logarithms together form one element of H(V), even when V is disconnected.
Approximate that function by the finite-rank GH0 operator/Runge theorem and exponentiate. The
boundary-cycle construction and its winding-decomposition identity are the explicit planar
prerequisites; scalar Runge approximation alone does not supply them.
Choose a nested Runge compact exhaustion of Ω. Each stage meets the relatively closed
discrete divisor in a finite set. Form finite divisor products over E∩K_n and their shell
ratios; approximate each inverse shell ratio on K_n by the globally nowhere-zero functions
just constructed, with error small enough that the corrected shell factor differs from 1
by at most 2^(−n). Prove compatibility of the resulting expressions on overlapping compacta,
locally uniform convergence of the tail products, nonvanishing away from the marked points,
and the exact local integer order at each marked point. Handle finitely many early factors
and negative divisor orders separately. Expose these estimates and the zero-free
approximation theorem as reusable API, rather than assuming a divisor theorem as a premise.
Also give a direct arbitrary-Ω divisor construction independent of zero-free Runge. Work
componentwise. For proper Ω split the marked points into E_b={a∈E: dist(a,ℂ\Ω)<1} and
E_∞={a∈E: dist(a,ℂ\Ω)≥1}; isolate any finite exceptional points and zero. The E_∞ points
escape every bounded set, so consume AnalyticNumberTheoryPartI's `exists_entire_primary_product_exact` for
their repeated list. For each a∈E_b choose b_a∈ℂ\Ω with
`|a−b_a|<2 dist(a,ℂ\Ω)` and put `w_a(z)=(b_a−a)/(z−b_a)`. On every compact K⊂Ω,
`w_a→0` along the E_b list: a bounded subsequence of E_b can accumulate only at ∂Ω, where
its distance to ℂ\Ω tends to zero, while an unbounded subsequence has |b_a|≥|a|−2 and
|w_a|=O_K(|a|⁻¹). For `p≥0` define `B_p(w)=(1+w) exp(Σ_{k=1}^p (−1)^k w^k/k)`; record the identity
`B_p(w)=E_p(−w)` for AnalyticNumberTheoryPartI §0.15's primary factor, not a second family of factors.
It has one simple zero at w=−1. For |w|≤1, consume that section's sharp estimate
`|B_p(w)−1|≤|w|^(p+1)`. Raise it to the prescribed multiplicity and choose p_a by a
diagonal compact exhaustion so the deviations are summable on
each compact. Finite exceptional factors are retained separately. These factors are holomorphic on
Ω (their only possible singularity is at b_a∉Ω), have exactly the prescribed zeros, and the locally uniform
product is nonzero off E; prove exact orders at E and nonvanishing of the tail product. When
Ω=ℂ, use AnalyticNumberTheoryPartI's product theorem for the whole sequence. Both divisor
constructions consume only AnalyticNumberTheoryPartI §0.15, earlier preparatory results and
GH0; AnalyticNumberTheoryPartI §0.15a's factorization is not a prerequisite of this milestone.

The divisor-realization API includes exact orders, finite nonzero germs on every component,
restriction and products/quotients corresponding to addition/subtraction of divisor data.
The zero-free approximation API retains a nonvanishing approximant on the whole ambient domain.
These are Rainer, Proposition 15.2 and Theorem 15.3, pp. 36–38
(rainer lines 1950, 1997); the explicit finite-cycle proof supplies the winding extension.

**Checks.**

- The zero divisor is realized by 1, whose analytic and meromorphic orders are 0 everywhere;
  the identically zero function has analytic order ∞ and is excluded.
- The divisor 2[0]−[1] is realized by z²/(z−1) as a meromorphic germ, with orders 2 and −1.
- For Ω=∅ the order assertions have no points; for two disjoint disks constant 1 on both
  has order 0 on both, so no connectedness hypothesis is needed.
- On an annulus, u=z has winding 1 and is already a global zero-free approximant;
  exponentials alone have winding 0 and cannot supply the whole approximation theorem.

*Needs:* Layers 1 and 2; AnalyticNumberTheoryPartI §0.15; native divisors and analytic orders; Tau Ceti closed periods,
integer winding and primitive-to-logarithm. The cycle-composition and finite-grid dual cycles
are the explicit targets in this subsection, not an assumed homology basis.

### 3.2 Boundary zeros and domains of holomorphy

The headline `exists_holomorphic_no_meromorphic_boundary_germ` states: for every open Ω construct a holomorphic f on Ω with no meromorphic continuation through
any local boundary germ. Precisely, for every ξ∈∂Ω, disk D centered at ξ and connected component
C of D∩Ω with ξ∈closure C, no meromorphic function on D agrees with f on C.

Use a compact exhaustion `K_n⊂int K_(n+1)` with union Ω. Cover K₁ and each compact shell
`K_n\int K_(n−1)` by finitely many open disks with closure in Ω and radii less than 1/n.
For n≥3 choose all disks in that shell disjoint from K_(n−2); prove this is possible because
K_(n−2) lies in the interior of K_(n−1). Choose a distinct point in each disk, avoiding the
finitely many earlier choices. The set E of all chosen points is relatively closed discrete:
any compact in Ω lies in some K_N and all disks from shells n≥N+2 avoid it.

To verify accumulation within each local branch, fix ξ,D,C as above and choose x_j∈C tending
to ξ. Choose a covering disk for each x_j in its earliest exhaustion shell. The shell indices
tend to infinity because every K_N is compact inside Ω. Their radii tend to zero; eventually
the disks lie in D, and their connectedness, containment in Ω and intersection with C put
them wholly in C. The chosen points therefore lie in C and tend to ξ. Each fixed covering
disk has closure inside Ω, so a subsequence uses distinct disks and hence distinct points.
The prescribed-zero theorem supplies f with exact zero set E and no other zeros. A meromorphic extension on D would
have zeros accumulating at its interior point ξ; remove any possible pole at ξ and apply the
analytic identity theorem to conclude that the extension is zero. This contradicts the nonzero
values of f on the nonempty open set C\E. Include Ω empty and boundary empty as vacuous
boundary cases. Derive the arbitrary-disk statement for every component: if D meets Ω but is not
contained in Ω, fix any component C of D∩Ω, choose z∈C and w∈D\Ω, and follow the segment
from z to w. Convexity of D keeps the segment in D. Its first exit ξ from Ω lies in D∩∂Ω, and
the initial segment stays in C. A sufficiently short tail before ξ lies in one component of a
centered disk about ξ, still contained in C, whose closure contains ξ. Any meromorphic extension
on D agreeing on C (or agreeing near z, by the identity theorem on C) would contradict the
centered boundary-germ result on that local component. For an interior germ
`g∈M(D_r(z))` agreeing with f near `z∈Ω`, if the disk were not contained in Ω, follow a segment
from z to a point of `D_r(z)\Ω` and take its first exit. The component containing z accumulates
at that boundary point, contradicting the centered result. Thus `D_r(z)⊆Ω`. State that the identity
principle is applied on the connected component containing the initial agreement neighborhood.

The shell-zero API gives local finiteness inside Ω and accumulation in every boundary branch,
so the identity theorem excludes continuation of each local branch.
This strengthens the shell proof of Rainer, Theorem 15.5, p. 39 (rainer line 2086) to
meromorphic extensions using finite pole order.

**Checks.**

- For Ω=∅ or ℂ the boundary is empty and f=1 satisfies the boundary clause vacuously.
- In the unit disk, zeros 1−1/n (n≥2) accumulate at 1 and force any meromorphic extension
  there to have infinitely many zeros near an interior point; its only possible extension
  germ is zero, contradicting any nonzero interior value.
- A compact subset contained in K_N meets no chosen disk from shells n≥N+2,
  so its zero count is bounded by the finite number of earlier chosen disks.

*Needs:* Layer 3.1, Layer 2 compact exhaustion, shrinking shell covers, and the analytic
identity theorem after removing a finite-order pole.

### 3.3 Whole-overlap zero-set construction

As an alternative explicit zero-set construction for the whole-overlap consequence,
for every open Ω construct one holomorphic f on Ω admitting no
holomorphic extension to any ball centered at any boundary point: for every a∈∂Ω and r>0
there is no holomorphic F on B(a,r) agreeing with f on all of B(a,r)∩Ω. No connectedness
assumption on Ω is needed; the ball claim is vacuous for Ω=∅ and Ω=ℂ. For nonempty Ω,
also prove that for every connected open V strictly containing Ω
there is no holomorphic F on V whose restriction is f. Connectedness of V is essential:
an unrelated disjoint open component can otherwise be added. The nonempty hypothesis belongs
to this larger-domain claim. For Ω=ℂ there is no strict larger plane domain.

For nonempty proper Ω use GH1's prescribed-zero theorem with multiplicity one. Choose a countable dense sequence
`a_j` in the nonempty boundary, allowing repetitions. For n≥1 and j≤n choose pairwise distinct
`z_(n,j) ∈ Ω∩B(a_j,1/n) \ D_n`, using the explicit filled exhaustion stages
`D_n = closedBall 0 n \ thickening (1/n) Ωᶜ` of Layer 2.1, as indexed in 2.2, with the nesting and
cofinality proved there. The intersection with
the ball is infinite, and every point of D_n has distance at least 1/n from a_j∈Ωᶜ.
Let E be the set of these points. Every D_m meets only finitely many levels n<m, so E is
relatively closed and discrete in Ω. For each fixed j the chosen points converge to a_j;
closedness then gives ∂Ω⊆closure E. The exact-zero function is not identically zero on any
nonempty open component, since a relatively discrete set cannot contain an open subset.

A ball extension would have zeros accumulating at its center and hence vanish on the whole
ball by the identity theorem, contradicting agreement with f off E in the overlap. For a
connected larger V, Ω is a nonempty proper relatively open subset of V, so its relative
boundary in V is nonempty. Choose a∈∂Ω∩V; zeros from E accumulate at a inside V, so the
identity theorem makes F vanish on V, again a contradiction. This argument uses the global
set E; it does not require E to accumulate through every individual component of Ω.

This dense-boundary construction gives an alternative direct proof of the whole-overlap
and connected-larger-domain consequences of the stronger theorem. It does not establish accumulation through every local component; the
shell-cover construction above supplies the stronger meromorphic branchwise theorem.

**Checks.**

- On the unit disk, each fixed dense-boundary point aⱼ is a limit of selected zeros with
  distances less than 1/n, hence limit distance 0.
- For D_m, levels n≥m contribute 0 points; the earlier levels contribute finitely many.
- Adding a disjoint disk to a domain permits the value 0 on that new component without
  changing f on Ω, so connectedness of a strict larger domain is essential.

This is the whole-overlap consequence of Layer 3.2; its alternative zero construction uses
the same identity-theorem argument as Rainer, Theorem 15.5, p. 39 (rainer line 2086).
*Needs:* Layer 3.1, the explicit exhaustion stages of Layer 2.1 with their nesting and
cofinality, separability of the boundary and the identity theorem.



### Examples

The divisor 2[0]−[1] is realized by z²/(z−1); shell zeros accumulate only at the boundary. The subsection Checks fix the detailed conventions.

### Dependencies

Layers 1–2, native analytic orders, and Tau Ceti period/logarithm and winding contracts.

## Layer 4: Mittag–Leffler and isolated singularities (GH2)

### 4.1 Principal parts and singular germs

The target `exists_meromorphic_prescribed_principal_parts` states: for a relatively closed discrete set E in Ω and a finite principal part `p_a(w) =
Σ_(k=1..N_a) c_(a,k) (w−a)^(−k)` at every a ∈ E, construct meromorphic f on Ω having exactly
those principal parts and no other poles. Prove uniqueness modulo addition of a holomorphic
function and natural restriction/translation/scaling rules. Also prove `exists_holomorphic_prescribed_isolated_singularities`, the general isolated-singularity
version: for each a∈E let U_a be an open neighborhood of a and φ_a holomorphic on U_a\{a}. Construct f holomorphic
on Ω\E such that f−φ_a has a holomorphic extension near a. This includes essential
singularities; the finite-principal-part meromorphic theorem is its pole-only
specialization. State equality of singular germs modulo holomorphic germs, uniqueness
modulo a holomorphic function on Ω, and restriction compatibility. Build the local
Laurent decomposition into its holomorphic part and punctured negative part, allowing
an infinite negative Laurent series in the general theorem.

Proof route: first prove that the negative Laurent part of a germ holomorphic on
a punctured disk converges on the whole punctured plane, giving a global singular
representative for each isolated singularity, including essential ones. Order the
closed discrete data in finite batches along the Runge exhaustion. Approximate each
batch's singular representatives on the preceding compact by functions holomorphic
on Ω and subtract those approximants. Enforce summable errors on preceding compacta;
prove locally uniform convergence away from E and holomorphic extension of the
difference at each marked point. Prove Laurent-coefficient extraction and the
finite-principal-part specialization.

The singularity API includes uniqueness modulo H(Ω), restriction, translation/scaling and
finite principal-part specialization. The holomorphic quotient consequence retains equality
on the codiscrete nonzero-denominator locus, not arbitrary assigned pole values.
The finite-principal-part theorem is Rainer, Theorem 12.1, p. 31 (rainer line 1603), whose
singular parts are given on the whole punctured plane; the isolated-singularity theorem, with
singular germs given on punctured neighborhoods, is Rainer, Theorem 15.7, pp. 39–40 (rainer
line 2126), which in addition prescribes a vanishing order of f−φ_a at a, and which the route
above reaches from Theorem 12.1 through the negative Laurent part; the quotient is Rainer,
Theorem 15.6, p. 39 (rainer line 2116).

**Checks.**

- Empty singularity data allow f=0; no spurious pole is required.
- At a=0, the principal part 2/z is realized by f=2/z with zero holomorphic remainder.
- The punctured germ exp(1/z) is allowed by the isolated-singularity theorem and excluded
  by finite-pole data; its remainder can again be 0.
- With E={0}, U_0 the ball of radius 1/2 about 0 and φ_0(z)=1/z+1/(z−1/2), the datum is
  admissible although φ_0 is not holomorphic on ℂ∖{0}; f=1/z realizes it, with remainder
  −1/(z−1/2), holomorphic at 0. A hypothesis of global singular parts would exclude it.
- Altering a total meromorphic function at its pole changes no punctured germ: at 0 the
  assigned value can be 7 while the quotient representation agrees away from 0.

*Needs:* Layers 1–3, native Laurent decomposition and local analytic/meromorphic orders,
Runge exhaustion corrections and locally uniform convergence away from the discrete support.



### Examples

The prescribed germs 2/z and exp(1/z) distinguish poles from essential singularities. The subsection Checks fix the detailed conventions.

### Dependencies

Layers 1–3, Laurent decomposition, Runge corrections and holomorphic local-uniform closure.

## Layer 6: products, approximation, and contour examples (GH4)

The following formulas and examples are explicit targets with the stated convergence hypotheses.

### 6.1 Sine, cosine, cotangent, and shifted sine

Starting with the supplied sine product, derive the cosine product
`cos(πz) = ∏_(n≥1) (1 − 4z²/(2n−1)²)`.
The respective simple zero sets are `ℤ` and `ℤ+1/2`. On `ℂ\ℤ`, derive from compact-uniform
product convergence
`π cot(πz) = z⁻¹ + Σ_(n≥1) 2z/(z² − n²)`,
where `n` and `-n` terms are paired. The paired series converges locally uniformly away from
`ℤ`. Its residue at each integer is `1`. The half-integer shift gives `-π tan(πz)` with
simple poles of residue `1` at `ℤ+1/2`; state its symmetric pairing and local-uniform domain.
Also prove the one-sided genus-one product
`∏_{n≥1}(1+z/n)e^{-z/n}`: it converges locally uniformly and its zeros are exactly the negative
integers. Also prove the all-z identity
`(Complex.Gamma z)⁻¹ = z exp(γz)∏_{n≥1}(1+z/n)e^{-z/n}`, where γ is
`Real.eulerMascheroniConstant`, using the totalized native reciprocal at poles. The product is
entire with simple zeros exactly at the nonpositive integers and agrees with native reciprocal
Gamma on its regular locus. State pole exclusions when using native Gamma or digamma.
Reuse `Complex.tendsto_euler_sin_prod` in `EulerSineProd.lean`; the cotangent series theorem is
root-namespaced `cot_series_rep` in `Cotangent.lean`, not `Complex.cot_series_rep`. For compact-uniform
product convergence use `HasProdLocallyUniformlyOn_euler_sin_prod` and
`multipliableUniformlyOn_euler_sin_prod_on_compact`; consume these with their stated compact and
zero-exclusion hypotheses, and derive the cosine product from `sin(2πz)=2sin(πz)cos(πz)` by splitting even and odd factors in finite products, passing to the locally uniform limit, and checking the constant at zero. For reciprocal Gamma,
pass from the native Gamma sequence to the normalized product using the harmonic/logarithmic
limit defining `Real.eulerMascheroniConstant`; identify the entire product with the totalized native
reciprocal Gamma, including its zeros at the poles.

For `α∈ℂ\ℤ`, put `a_n=n-α` and choose a fixed enumeration of `ℤ`. Since
`Σ |a_n|^{-2}<∞`,
`P_α(z) = ∏_(n∈ℤ) E₁(z/a_n)`
converges locally uniformly and has exactly the simple zeros `a_n`. The quotient
`sin(π(z+α))/P_α(z)` is zero-free entire, so define its entire logarithm `g_α` and obtain
`sin(π(z+α))=e^{g_α(z)}P_α(z)` and `e^{g_α(0)}=sin(πα)`. On compacta avoiding the shifted lattice,
`π cot(π(z+α)) = g'_α(z) + Σ_(n∈ℤ) ((z+n+α)⁻¹ − (n+α)⁻¹)`.
The difference summands are `O(|n|^{-2})`, hence absolutely and locally uniformly summable.
An unpaired series of simple principal parts is not assigned a value; any such expansion must
specify symmetric partial sums. Determine the scalar and linear exponential explicitly:
`sin(π(z+α)) = sin(πα) exp(πz cot(πα)) ∏_(n∈ℤ) (1 + z/(n+α)) exp(−z/(n+α))`.
The bilateral genus-one product converges independently of enumeration because its tail
factor deviations are bounded on each compact by a constant times `|n+α|⁻²`.
Reindex by `n↦−n` to identify it with `P_α`; prove ordering independence from absolute
local-uniform convergence. Subtract the symmetrically paired cotangent
expansions at `z+α` and `α`; their difference is the absolutely convergent series displayed
above. It follows that `g'_α=π cot(πα)` away from the zeros, hence everywhere by analytic
continuation. Evaluation at zero supplies `e^{g_α(0)}=sin(πα)` and gives the formula without
choosing a branch of the logarithm of that nonzero constant.

For reciprocal Gamma, consume `Complex.GammaSeq_tendsto_Gamma`,
`Complex.Gamma_mul_Gamma_one_sub`, and the `Complex.digamma` recurrence/reflection API in
Mathlib's `Gamma/Beta.lean` and `Gamma/Digamma.lean`. Name the harmonic/logarithmic limit
`Real.tendsto_harmonic_sub_log` from `Mathlib/NumberTheory/Harmonic/EulerMascheroni.lean`. State pole exclusions when taking
logarithmic derivatives. These native special-function facts do not replace the sine-product
proof or global product API.

**Checks.**

- At z=0 the cosine product is 1, and reciprocal Gamma is 0 because of its origin factor.
- At z=1/2, the cosine product has a zero factor, so both sides are 0.
- For α=1/2, the shifted-sine prefactor is sin(π/2)=1 and the linear exponent coefficient
  π cot(π/2)=0, recovering the cosine product.

These are derived product comparisons from Layer 1 and the native sine, cotangent, Gamma
sequence and Euler-constant limits in the supplier contracts; the shift uses absolute summability.
*Needs:* Layer 1, AnalyticNumberTheoryPartI §0.15a's equal-divisor factorization and
ZerosOfLFunctions Layer 5.4's entire logarithm, native sine/cosine identities, cotangent
series, Gamma sequence and harmonic-logarithmic limit, with the specified nonzero denominators.

### 6.2 Independent paired-cotangent strip proof

Use the following strip argument as a worked comparison route for the supplied paired
cotangent identity, alongside its product/logarithmic-derivative route. Its intermediate
estimates belong to this README's examples. Write
`U=ℂ\{(k:ℂ) | k∈ℤ}`,
`q_N(z)=Σ_(k=−N)^N (z−k)⁻¹`, and
`q(z)=z⁻¹+Σ_(n≥1)((z−n)⁻¹+(z+n)⁻¹)`.
The infinite sum is specifically this paired series, not an unpaired bilateral sum.

First prove local uniform convergence of `q_N` to q on U using
`(z−n)⁻¹+(z+n)⁻¹=2z/(z²−n²)` and compact-dependent `O(n⁻²)` bounds.
Give the finite truncation/pairing comparison, holomorphy on U, and the residue-one
local decomposition at each integer. Derive periodicity directly from the finite identity

`q_N(z+1)−q_N(z)=(z+N+1)⁻¹−(z−N)⁻¹`.

Its two boundary terms converge locally uniformly to zero away from the indicated poles;
thus `q(z+1)=q(z)` on U. Put `c(z)=π cos(πz)/sin(πz)`. Prove its regular locus and
residue-one decompositions using elementary sine/cosine differentiation and their integer
zeros. Cancel the principal parts to construct an actual entire function F satisfying
`F=c−q` on U, with its values at the integers obtained by removable extension. Do not
assign zero arbitrarily at the poles. Prove uniqueness and one-periodicity of this extension.

Prove uniform bounds on the full closed fundamental strip `|Re z|≤1/2`, rather than
only at `z=iy`. For `|Im z|≥1` and n≥1,

`‖2z/(z²−n²)‖ ≤ 3|Im z|/((n−1/2)²+(Im z)²)`.

The decreasing-function integral comparison gives
`Σ_(n≥1) |y|/((n−1/2)²+y²) ≤ 1+π/2` for `|y|≥1`.
Together with `‖1/z‖≤1`, this bounds q by `4+3π/2` on those two strip tails.
Use the exponential formula for cotangent to bound c there by
`π(1+exp(−2π))/(1−exp(−2π))`. On the remaining compact rectangle
`|Re z|≤1/2`, `|Im z|≤1`, use continuity of the entire extension F, including the
removed pole at zero. Periodicity moves every complex number into this strip, so F is
globally bounded. Consume native Liouville only after this bound, giving F constant.

Determine the constant without invoking the desired cotangent series. For real `y>0`, prove

`q(iy)=−i(1/y+2 S_y)`, where
`S_y=(1/y) Σ_(n≥1) 1/(1+(n/y)²)`.

Construct the improper-Riemann comparison from finite upper and lower rectangular sums
for the decreasing function `t↦1/(1+t²)` on `[0,R]`. Prove the improper integral is π/2
using the arctangent derivative and limit; control the infinite tail by
`∫_R^∞ 1/(1+t²) dt ≤ 1/R` for `R>0`. Pass from finite sums to the summable infinite
series, obtaining the explicit all-`y>0` estimate
`0≤π/2−S_y≤1/y`. Hence `q(iy)→−πi`. Independently the exponential formula gives
`c(iy)→−πi`, so the constant F is zero. Conclude `c=q` on U, and compare this independently
constructed proof with the existing native theorem afterwards. The zero value `y=0` is
excluded from the Riemann/vertical-limit claims; integers are excluded from the final identity.
No absolute convergence of `Σ_(k∈ℤ)(z−k)⁻¹` is claimed. This alternative does not remove
the existing sine/cosine/Gamma/shifted-product or contour examples.

The paired-series API in this worked route consists of symmetric-truncation convergence,
integer residues, period one and the strip and imaginary-axis estimates; it uses the native
integer complement and paired series rather than a new regular-locus carrier.

**Checks.**

- With N=0, q₀(z+1)−q₀(z)=(z+1)⁻¹−z⁻¹, exactly the stated boundary correction.
- At z=i, a paired term is −2i/(1+n²); both terms have negative imaginary part.
- At y=1, S₁=(π coth π−1)/2, so π/2−S₁ is about 0.4941, inside [0,1].
- The model and paired limits are both −πi as y→∞, so their difference has constant value 0.

This is a direct finite-sum, improper-integral and Liouville derivation of the supplied
cotangent identity; it does not define an additional theorem of the library.
*Needs:* native sine/cosine derivatives, removable singularities, inverse-square summability,
arctangent integral and Liouville; the displayed bounds are the intermediate mathematical estimates.

### 6.3 Theta, hyperbolic sine, divisors, and ratio products

For real `0<r<1`, define
`H_r(z) = ∏_(n≥1) (1 + r^(2n−1) e^z)(1 + r^(2n−1) e^(−z))`.
On each compact `K⊆D_R`, the sum of factor deviations is bounded by
`2 e^R Σ r^(2n-1)+Σ r^(4n-2)<∞`; hence the product is entire. Reindex finite partial products,
then take compact-uniform limits, to prove
`H_r(z+2 log r)=r^{-1}e^{-z}H_r(z)`. Here `log r` is the real logarithm; do not assert this
formula for arbitrary complex `r`. Include the finite-product proof without cancellation at a
possible zero. The hyperbolic sine identity is
`sinh(πz) = πz ∏_(n≥1) (1 + z²/n²)`,
proved by `sin(iw)=i sinh(w)` from the sine product.

Product instances must include their actual reciprocal-power checks. For the integer lattice
minus zero use genus one and `Σ_{n≠0}|n|^{-2}<∞`; for half-integers use genus one and pair
opposite roots. For `a_n=log n`, `n≥2`, every integer choice `p_n≥n` is admissible, including strict choices
at any or all indices. For fixed `R`, choose N with `q=R/log N<1`; for n≥N the actual factor
bound is `(R/log n)^{p_n+1}≤q^{p_n+1}≤q^{n+1}`. This gives a summable geometric tail;
handle the finite initial factors separately. For
`z∏_{n≥1}E_{n-1}(z/log(n+1))`, isolate `n=1` and use exponent `p_n+1=n`. For
`Λ=(ℤ+iℤ)\{0}`, order finite products by radius and use genus two. Unit squares around lattice
points in the `k`th unit annulus lie in an annulus of fixed enlarged width, so the shell count is
`O(k)` and `Σ_{λ∈Λ}|λ|^{-3}<∞`. This proves the full-lattice product, independent of ordering and grouping.

For the square lattice use the explicit Manhattan-shell enumeration:
`z ∏_(N≥1) ∏_(m,n∈ℤ, |m|+|n|=N) E₂(z/(n+im))`, where `E₂(w) = (1−w) exp(w + w²/2)`.
For `Λ=ℤ+iℤ`, this has simple zero set all of `Λ`, including zero. Each shell has `4N` points and `|n+im|≥N/√2`. On `|z|≤R`, AnalyticNumberTheoryPartI §0.15's sharp estimate `|E₂(w)−1|≤|w|³` for `|w|≤1` bounds each sufficiently large shell's total deviation by `4N(√2R/N)^3`. The shell bounds are summable, so the product converges compact-uniformly and independently of ordering. Consume that sharp estimate `|1−E_p(w)|≤|w|^{p+1}` for `|w|≤1` and the proved
admissibility of `p_n=n−1` for every escaping sequence; do not repeat that proof here. State the
genus criterion and logarithmic-derivative theorem from the preparatory product layer,
including nonvanishing of both factors and limit and compact avoidance of every zero.
A concrete sparse illustration is `a_n=2^n`: its genus-zero product
`∏_{n≥1}(1-z/2^n)` converges locally uniformly since on `|z|≤R` the tail sum of factor
deviations is `Σ_{n≥N}R/2^n=R·2^(1-N)`, which tends to zero as `N→∞`. This is an additional
example; each separately specified sequence requires its own convergence estimate.

For sequences `a_n,b_n` with `Σ|a_n-b_n|<∞`, the ratio product
`∏_(n≥1) (z−a_n)/(z−b_n) = ∏_(n≥1) (1 + (b_n−a_n)/(z−b_n))`
converges locally uniformly on `ℂ \ closure{b_n : n≥1}`; on each compact set disjoint from the pole
closure the denominators have a positive lower bound, and the perturbations are summable. State the
summability premise separately from pole-set separation, and handle removable numerator/pole
coincidences by cancellation. For `a_n=2/n²`, `b_n=1/n²`, no numerator zero cancels a pole, since
`2/m²=1/n²` would imply `m²=2n²`. Each pole is genuine: after removing its factor the remaining product converges to a nonzero
value near that pole. The pole closure `{1/n²:n≥1}∪{0}` therefore gives the maximal open
holomorphy domain for this example, including exclusion of continuation across the accumulation
point 0 by its nearby genuine poles.

The example-product API supplies local-uniform convergence, exact zeros, the theta shift,
ordering independence for absolutely convergent products and exclusion of pole accumulation points.
All are derived from AnalyticNumberTheoryPartI §0.15's product theorem (Rainer, Theorem 14.3,
pp. 35–36, rainer line 1868) and the explicit estimates above.

**Checks.**

- For r=1/2, the theta shift factor at z=0 is 2; the finite reindexing ratio tends to 2,
  fixing the inverse power r⁻¹ and the sign of z.
- The Manhattan shell N=1 has 4 points of norm 1; its four reciprocal cubes sum to 4,
  below the displayed bound 8√2. The shell N=2 has 8 points.
- For aₙ=2ⁿ the deviation tail from N is R·2¹⁻ᴺ; at R=1,N=2 it is 1/2.
- In the ratio example b₁=1 and a₁=2, the factor has a genuine pole at 1; cancellation
  would require m²=2n², which has no positive integer solutions.

*Needs:* Layer 1; AnalyticNumberTheoryPartI §0.15; native sine/hyperbolic identities, lattice shell counts and compact
separation from the pole closure; every ratio denominator is bounded away from zero on the stated compact.

### 6.4 Polynomial and rational approximation examples

For the crescent `Ω={z∈ℂ: |z|<1 and |2z−1|>1}`, prove compact-open polynomial density in
`H(Ω)` and the failure of global uniform approximation for all holomorphic functions.
Its complement is the union of the closed exterior of the unit disk and the closed disk
`{|2z−1|≤1}`; these meet at `1`, so the complement is connected. The polar description
`0<θ<2π`, `max(0,cos θ)<r<1` identifies Ω with an open rectangle and proves connectedness.
Take a compact exhaustion and fill its bounded complementary components. Prove that each
filled compact stays in Ω: the connected set `ℂ\Ω` meets the unbounded complementary
component and therefore lies wholly in it. Arrange nested interiors and connected compact
complements, then use GH0 polynomial Runge and diagonal approximation. For the separate
global-sup assertion use `f(z)=1/z`. Every `−t`, `0<t<1`, lies in Ω and `|f(−t)|=1/t`.
Every polynomial is bounded on the unit disk, so every `p−f` is unbounded on Ω. Continuity
on this open set also gives infinite essential supremum. Thus no sequence of polynomials
has global `L∞(Ω)` error tending to zero, despite the compact-open density. As a second
boundary-pole witness on this same crescent, take `f(z)=1/(z+1)` and `z_t=-1+t` for
`0<t<1`. Then `|z_t|=1-t<1` and `|2z_t-1|=3-2t>1`, so `z_t∈Ω` and
`|f(z_t)|=1/t→∞`. Every polynomial remains bounded on the unit disk, hence its uniform
error against this second witness is infinite as well.

Apply the native compact-support Cauchy–Pompeiu identity, Layer 0.3's uniform Riemann-sum lemma,
finite-chain pole-pushing and rational pole-set theorem to these approximation examples.
Use their stated compact separation, error bounds and sphere-complement pole-set hypotheses.

**Checks.**

- At z=−1/2, |z|=1/2 and |2z−1|=2, so the point lies in the crescent.
- At z=−t with t↓0, |1/z|=1/t→∞, whereas every polynomial is bounded on the unit disk.
- At z=−1+t with t↓0, |1/(z+1)|=1/t→∞, giving the second distinct boundary obstruction.

These are direct applications of rational Runge (Rainer, Theorem 11.7, p. 29) and the
computed complement geometry, not global-uniform approximation theorems.
*Needs:* Layer 2.5, the holomorphic hull construction, compact exhaustion and polynomial boundedness on a closed disk.

### 6.5 Full-boundary Cauchy–Pompeiu formula

Give piecewise-`C¹` Jordan parametrizations `γ₀,…,γₘ`, with `m<∞`, and write `Dⱼ` for the
bounded Jordan component enclosed by the image of `γⱼ`. Require the closed hole interiors
`closure(Dⱼ)` (`1≤j≤m`) to be pairwise disjoint and contained in `D₀`; define
`Δ := D₀ \ ⋃_{j=1}^m closure(Dⱼ)`. Thus `Δ` is the bounded finitely connected region with outer
boundary `γ₀` and hole boundaries `γ₁,…,γₘ`. Parameterize every `γⱼ` counterclockwise around its
own bounded component. Define the oriented boundary cycle by
`C_Δ := [γ₀] − Σ_{j=1}^m [γⱼ]` in the existing free-abelian `TauCeti.Contour.Cycle`; this is the
same orientation as the outer curve counterclockwise and each hole curve clockwise. Here `[γ]`
denotes the native cycle generator bundled from its closed piecewise-`C¹` parameterization.

Prove the region-boundary adapter: `trace(C_Δ)=∂Δ`, `n_{C_Δ}=1` on `Δ`, and
`n_{C_Δ}=0` on `ℂ\closure(Δ)`. Use ConformalMapping L5 for the single-Jordan separation and
filled-hull topology. GH4 must also prove the orientation-to-winding statement for the chosen
counterclockwise parameterizations and assemble the finitely many disjoint hole indices; L5 alone
does not state that winding conclusion. Suppose `Ω` is open, `closure(Δ)⊆Ω`, `f : ℂ → ℂ` is
`C¹` on `Ω` as a real map, and `ξ∈Δ`. The formal theorem target is the area-integral identity

`f(ξ) = (2πi)⁻¹ ∫_(C_Δ) f(z)/(z−ξ) dz − π⁻¹ ∫_Δ ∂̄f(z)/(z−ξ) dA(z)`.

The signature `cauchyPompeiu` states this on a native cycle C: Δ is bounded and open,
closure Δ⊆Ω with Ω open, trace C=∂Δ, and off that trace the cycle index is 1 on Δ
and 0 elsewhere. These hypotheses also allow cycles beyond finite Jordan boundaries.
The preceding boundary construction proves them for every specified Jordan region.

Here `dA` is positive planar Lebesgue measure. Record the source's equivalent plus-wedge display
as the coefficient identity `dz∧dz̄=−2i dA` in the positive basis `(1,i)`; do not introduce
an independent integral of a 2-form. Use `Cycle.integral` for the boundary term and Bochner area
integration; prove integrability from boundedness of `∂̄f` on `closure(Δ)` and local integrability
of `z↦‖z−ξ‖⁻¹` in two dimensions.

For sufficiently small `ε>0` with `B̄_ε(ξ)⊆Δ`, let `S_ε` be the positively oriented circle cycle
and set `C_ε=C_Δ−S_ε`, `U_ε=Ω\B̄_{ε/2}(ξ)`, and `F(z)=f(z)/(z−ξ)` on `U_ε`. Prove `C_ε` has
trace in `U_ε` and its total winding number vanishes on `ℂ\U_ε`: outside `Ω`, both component
indices vanish; on `B̄_{ε/2}(ξ)`, the domain-boundary and circle indices are both `1` and cancel.
On `U_ε` off the traces, its index equals `1` on `Δ\B̄_ε(ξ)` and `0` elsewhere. On `U_ε`,
`∂̄F=(∂̄f)/(z−ξ)` by the real `C¹` product rule and `∂̄((z−ξ)⁻¹)=0`. Apply
Tau Ceti's winding-weighted cycle Green identity `Cycle.green_winding` to the two real forms
associated to `F dz`: for `F=u+iv`, use `u dx−v dy` and `v dx+u dy`. Add the explicit local
coordinate comparison target: on each native cycle generator,
`(F∘γ)·γ′=(u∘γ)x′−(v∘γ)y′+i((v∘γ)x′+(u∘γ)y′)`; extend by finite integer additivity. This
identifies the real and imaginary parts of `Cycle.integral F` with the two finite real circulation
integrals, without introducing a second cycle or contour-integral carrier. The two curls are
`−vₓ−uᵧ=−2 Im(∂̄F)` and `uₓ−vᵧ=2 Re(∂̄F)`, so their identities combine to
`∮_{C_ε}F dz=2i∫_{Δ\B̄_ε(ξ)}∂̄F dA`; traces are area-null. This gives the punctured
Cauchy–Pompeiu identity. As `ε↓0`, the counterclockwise circle integral of `F dz` tends to
`2πi f(ξ)`, and the exact error estimate is
`|∮_{S_ε}F dz−2πi f(ξ)|≤2π sup_{|z−ξ|=ε}|f(z)−f(ξ)|`, which tends to zero. Set
`M=sup_{z∈closure(Δ)}|∂̄f(z)|<∞`; the deleted area term is at most `2πMε`. The source
plus-wedge and minus-area versions then agree by `dz∧dz̄=−2i dA`.

As a real/imaginary Stokes cross-check for the GH5 disk monomial moment, let `F=u+iv` be smooth
on a neighborhood of the closed unit disk. Interpret `∮_{|z|=1}F dz̄` as the pair of
existing real curve integrals associated to the one-forms `u dx+v dy` and `v dx−u dy`; do not
introduce a second complex contour carrier. Their curls are `vₓ−uᵧ` and `−uₓ−vᵧ`, which combine
to `−2i∂_zF`. Specialize `Cycle.green_winding` to the positive unit-circle cycle (index one on the open disk)
to obtain
`∮_{|z|=1}F dz̄=−2i∫_{|z|<1}∂_zF dA`. For `m,n∈ℕ` and
`F=z^(m+1)z̄^n/(m+1)`, this recovers the GH5 disk moment identity. This cross-check belongs
to GH4 because it consumes the native Green theorem; the GH5 target itself uses polar area
integration only.

The region-boundary adapter must prove the Jordan separation/orientation-to-winding facts and hole
cancellation, then identify the geometric boundary with `trace(C_Δ)`; it must not assume a graph-cell
decomposition. Consume `Cycle.green_winding` for real `C¹` fields on an open set and a native
`TauCeti.Contour.Cycle` with trace in that set and null-homologous in it; it imposes no
nonzero-speed or finite-cell-division hypothesis. Use the local `Cycle.integral`
real/imaginary-coordinate comparison above with that cycle theorem. GH0 and GH5’s scalar
solver remain independent of the Green theorem and ConformalMapping; GH5’s form consequences
consume the native form carrier as stated below. GH4 consumes the native Green theorem and
ConformalMapping L5 for Jordan separation, and there is no CKG edge for this boundary formula.

For the upper/lower/real-axis example, let
`K_{1,n}={|z|≤n, Im z≥1/n}`, `K_{2,n}={|z|≤n, Im z≤-1/n}`,
`K_{3,n}={|Re z|≤n, Im z=0}`. Use neighborhoods
`U_{1,n}={|z|<n+1, Im z>1/(n+1)}`, `U_{2,n}={|z|<n+1, Im z<−1/(n+1)}` and
`U_{3,n}={|Re z|<n+1, |Im z|<1/(2n)}`; these are disjoint and contain their respective compact
pieces. Prescribe values `1,-1,0` there.
Prove `ℂ\K_n` is connected and choose polynomial `P_n` with each piece's error at most `1/n`.
For each fixed point, membership eventually lies in the appropriate piece, giving pointwise limit
`1` above the real axis, `-1` below, and `0` on it; this is not uniform convergence on `ℂ`.

For the point-value constrained example, for each integer n≥1 define five compact pieces and
pairwise disjoint open neighborhoods by
`K₁ⁿ={|z|≤n, Im z≥1/n}`, `K₂ⁿ={|z|≤n, Im z≤−1/n}`,
`K₃ⁿ={Im z=0, 1/n≤Re z≤n}`, `K₄ⁿ={Im z=0, −n≤Re z≤−1/n}`,
and `K₅ⁿ={0}`, with `Kⁿ=⋃₁⁵Kᵢⁿ`. Set
`U₁ⁿ=int K₁ⁿ⁺¹`, `U₂ⁿ=int K₂ⁿ⁺¹`,
`U₃ⁿ={|Im z|<1/(2n), 1/(2n)<Re z<2n}`,
`U₄ⁿ={|Im z|<1/(2n), −2n<Re z<−1/(2n)}`, and
`U₅ⁿ={|z|<1/(3n)}`, with `Uⁿ=⋃₁⁵Uᵢⁿ`. Prove `Kᵢⁿ⊆Uᵢⁿ` and pairwise disjointness of these open sets. Define the target to be `1` on `K₅ⁿ` and `0` on the other four pieces, and the corresponding locally constant function on the disjoint neighborhoods. Verify directly that `ℂ\Kⁿ` is connected, then apply polynomial Runge to obtain `Q_n^m` with error `1/m`. Since `|Q_n^m(0)-1|≤1/m`, normalize
`P_n=Q_n^{n+1}/Q_n^{n+1}(0)`. Then `P_n(0)=1` and
`sup_{Kⁿ\{0}}|P_n|≤(1/(n+1))/(1-1/(n+1))=1/n`; prove pointwise convergence to zero at every fixed nonzero point. This is constrained approximation via a finite interpolation/normalization argument, not ordinary Runge density alone.

Include the annulus-hull comparison with `K = closure(D_3(0)) \ D_2(0)`, `Ω₁=D_4(0)`, and
`Ω₂ = D_4(0) \ closure(D_1(0))`. Compute `K̂_{Ω₁} = closure(D_3(0))` and
`K̂_{Ω₂}=K`. For the transfer theorem, let
Ω₁ and Ω₂ be open, K⊆Ω₁∩Ω₂ compact, and suppose the compact hull H=`K̂_{Ω₂}` is contained in Ω₁, prove:
for every f holomorphic on Ω₁ and ε>0 there is g holomorphic on Ω₂ with
`sup_{z∈H}|f(z)−g(z)|<ε`. The hull H is Runge in Ω₂ and Ω₁ is its holomorphic
neighborhood, so GH0 applies on H; in particular the same error bound holds on K.

Include the explicit example
`e^z−1 = z e^{z/2} ∏_{n≥1}(1+z²/(4π²n²))`. Prove the identity by relating the sine product
at `z/(2πi)` to `e^z−1`, with the exponential prefactor computed explicitly and local-uniform
convergence proved. This identity and the reciprocal-Gamma formula are separate targets.

The Stone–Weierstrass comparison is stated as real polynomials in `x,y` dense in real-valued
`C(K,ℝ)` for compact `K⊆ℝ²`; their complex linear span is dense in `C(K,ℂ)`. The Euler example is included above with its independent convergence/identity proof obligation. The two-domain
annulus hull example and the approximation implication when `K̂_{Ω₂}⊆Ω₁` use the actual
holomorphic-neighborhood and compact hypotheses. This differs
from holomorphic polynomial approximation, which requires connected complement. For arbitrary
open `Ω`, approximate by `H(Ω)` or rational functions under GH0's actual complement and pole-set
conditions, not by complex polynomials without extra hypotheses.

The oriented boundary-cycle API includes trace equality, indices inside the region and holes,
integer additivity and the real/imaginary circulation comparison, with the source and target
cycle and integral carriers specified above. The scalar formula is Rainer, Proposition 10.1,
p. 23 (rainer line 1216); the finite-cycle generalization uses Tau Ceti's `Cycle.green_winding`.

**Checks.**

- On the unit disk with f=1 and ξ=0, the boundary term is (2πi)⁻¹·2πi=1 and the area term is 0.
- With f(z)=z̄ and ξ=0, the boundary integral and the odd area integral ∫1/z are both 0.
- With f(z)=|z|² and ξ=0, the boundary term is 1 and π⁻¹∫1 dA=1, giving 0=1−1;
  reversing the area sign would give 2.
- On 1<|z|<2 the index at the hole center is 1−1=0, while the index at 3/2 is 1−0=1.
- For the point-normalized polynomials with n=1, the bound is (1/2)/(1−1/2)=1;
  the denominator is bounded below by 1/2, not merely assumed nonzero.

*Needs:* Tau Ceti's `Cycle.green_winding`; ConformalMapping L5 for Jordan separation only;
Tau Ceti cycles, winding, circle integrals and Layer 0.1 derivatives. The boundary adapter,
coordinate comparison and small-circle/error estimates are the local targets above.

### 6.6 Product logarithmic derivatives and boundary examples

For each pole family identify principal parts before summing. Cotangent poles at integers have
residue one; the regularized series is `1/z+Σ_{n≥1}2z/(z²-n²)`. Derive this by symmetric
pairing and local-uniform convergence, not by assigning a value to an unpaired bilateral sum.
The same rule applies to shifted lattices and logarithmic derivatives of products. Preserve the
local pole exclusions and verify residues directly.

For arbitrary-domain boundary noncontinuation, consume
GH1’s branchwise meromorphic noncontinuation theorem
and its shell-cover proof, including the arbitrary-disk and interior-germ corollaries.
The product and cotangent examples here retain their explicit pole, residue, and
logarithmic-derivative calculations.

**Checks.**

- Near z=0 the cotangent principal part is 1/z, with residue 1.
- Near a simple product zero a, the logarithmic derivative has principal part 1/(z−a);
  a double zero changes the residue to 2.
- The shifted sine at α=1/2 has poles at half-integers in its logarithmic derivative,
  with residue 1 and none at the integers.

*Needs:* Layers 1 and 3, AnalyticNumberTheoryPartI §0.15a, the native paired cotangent formula and local meromorphic orders.
These are the explicit local-pole calculations for the preceding examples.



### Examples

On the unit disk the |z|² Cauchy–Pompeiu identity at zero is 0=1−1; clockwise holes subtract their index. The subsection Checks fix the detailed conventions.

### Dependencies

Layers 0–4 and AnalyticNumberTheoryPartI §§0.15–0.15a as used by each example; Tau Ceti's cycle Green theorem and ConformalMapping L5 only for the boundary formula.

## Layer 7: global smooth ∂̄ solvability and Cousin I (GH5)

### 7.1 Global smooth solvability and closed completion

Prove the global one-variable inhomogeneous Cauchy–Riemann theorem. In `exists_smooth_conjWirtingerDeriv_eq`, for every open `Ω⊆ℂ` and every `f∈C^∞(Ω)`,
construct `g∈C^∞(Ω)` with `∂̄g=f`, stated as `g_x+i g_y=2f`; no simple connectivity is assumed. Use `ContDiffOn ℝ ∞` for smoothness, with `open scoped ContDiff`; native `⊤`
in this order type denotes analytic order `ω`, so it does not express the smooth
compact-support input. Consume the native Wirtinger operators, real-differentiability
criterion and compact-support Cauchy transform of Layer 0. The proof route is a global one-variable
shell construction:

1. Consume the native compact-support Cauchy transform of Layer 0.3 and its uniform Riemann-sum estimate.
   GH5 supplies the exhaustion-shell cover and support/extension adapters, correction estimates,
   and convergence of the resulting solution.
2. Choose a compact Runge exhaustion from GH0 and construct a countable locally finite open
   cover by relatively compact exhaustion shells. On the real smooth open subtype `M=Ω`, apply
   native `SmoothPartitionOfUnity.exists_isSubordinate` from
   `Mathlib/Geometry/Manifold/PartitionOfUnity.lean` to this cover and the closed set `s=univ`.
   Check its finite-dimensional smooth-manifold, Hausdorff and σ-compact hypotheses for M.
   It gives smooth nonnegative χ_j, locally finite supports, sum one, and
   `tsupport χ_j ⊆ shell_j`. Relative compactness of each shell makes these topological supports
   compact in M; prove that their images in ℂ are compact subsets of Ω. Use the open-subtype
   smoothness and extension-by-zero adapters to make `φ_j=χ_j f` smooth and compactly supported
   on ℂ. Set `u_j=Tφ_j`. Then `∂̄u_j=φ_j`; the chosen shell separation makes terms from later
   shells holomorphic near earlier compacts. Generic smooth-partition existence is a native
   input; the shell construction and these support/comparison properties are GH5 targets.
3. Correct each `u_j` on preceding compacts by a GH0 finite-rank linear `H(Ω)` operator,
   choosing its error parameter against the sup norm of the current holomorphic tail on the
   collar L. Use a slightly larger Runge compact at each stage so Cauchy estimates on its interior
   control every derivative on the preceding compact. The fixed operator acts on each shell datum
   independently of its values, and the summable seminorm errors make the series converge in
   `C^∞_loc(Ω)` with `∂̄` equal to `Σφ_j=f`.

Classify the full solution space. Given any smooth particular solution `u₀` on an open Ω,
a smooth `u` solves `∂̄u=f` exactly when `u=u₀+h` for a unique `h∈H(Ω)`. The difference
satisfies the homogeneous Cauchy–Riemann equation, whose native differentiability criterion
makes it holomorphic; conversely holomorphic functions are smooth and have zero `∂̄`.
No connectedness or simple connectivity is required. On ℂ the right-hand side `f(z)=z̄`
has all solutions `u(z)=z̄²/2+h(z)` with h entire. For `f(z)=z e^{−|z|²}`, use
`u₀(z)=−e^{−|z|²}`. Since this particular solution is bounded, a solution is bounded exactly
when its entire summand is bounded. Liouville gives precisely `u(z)=−e^{−|z|²}+c`, `c∈ℂ`.
For `f(z)=z`, the particular solution `u₀(z)=|z|²`; all solutions are
`|z|²+h(z)` for h entire. For the related exactness exercise, `dg=f dz` with smooth g forces
`∂̄g=0`, hence g is holomorphic. Merely `∂_z g=f` does not: `f=0`, `g(z)=z̄` is a counterexample.

In `exists_smooth_closed_completion`, for every smooth `f` on an arbitrary open Ω, construct a smooth `g` such that
`ω=g dz+f dz̄` is closed. Apply global solvability to the smooth datum `∂_z f`,
obtaining `∂̄g=∂_z f`, stated as `g_x+i g_y=f_x−i f_y`, and prove
`dω=(∂_z f−∂̄g) dz∧dz̄=0` on the differential-form carrier of 7.2; the form-level
statement is `exists_smooth_closed_completion_form` there.
For a fixed f, all such coefficients are `g=g₀+h`, with h holomorphic on Ω.
The conclusion is closedness; a global primitive additionally requires vanishing periods.

The solver API is:

- Every smooth datum on an open plane set has a smooth global solution, with no connectivity assumption.
- Solutions form an affine space under H(Ω), with unique holomorphic difference from a chosen solution.
- Closed completion solves ∂̄g=∂z f; all completing coefficients differ by a holomorphic function.

**Checks.**

- For f=z̄, u=z̄²/2 has ∂̄u=z̄; at z=1 both sides equal 1.
- For f=z, u=|z|² gives ∂̄u=z; for closed completion g=z̄ gives ∂̄g=∂z f=1.
- For f=z exp(−|z|²), u=−exp(−|z|²) has the stated derivative; at z=1 it is e⁻¹.
- For f=0, g=z̄ has ∂z g=0 but dg=dz̄≠0; specifying ∂z g alone does not specify dg.

The solver is Rainer, Theorem 12.2, p. 31 (rainer line 1630); the affine solution space and
closed completion follow by subtracting solutions and applying the operator to ∂z f.
*Needs:* Layers 0 and 2, native smooth partition of unity, the stated shell support and
extension-by-zero adapters, and holomorphic Cauchy derivative estimates. Closed completion
uses the scalar solver and Layer 0.1; no Layer 6 input is needed.

### 7.2 Planar coordinate forms and two-form exactness

Take `U : TopologicalSpace.Opens ℂ`, the open subtype `M := ↥U` and the model
`I := 𝓘(ℝ, ℂ)`; `M` is a finite-dimensional real smooth manifold without boundary.
The inclusion `ι : M → ℂ` induces a smooth identification of the tangent bundle with the
trivial bundle of fibre ℂ: at `z : M`, `mfderiv I I ι z : TangentSpace I z →L[ℝ] ℂ` and its
inverse are the mutually inverse coordinate tangent maps. Write `e_z : ℂ ≃L[ℝ] TangentSpace I z`
for the inverse identification. For every ambient `u : ℂ → ℂ`, prove the restriction comparison
`ContDiffOn ℝ ∞ u (U : Set ℂ) ↔ ContMDiff I I ∞ (fun z : M => u z)` from Mathlib's
`contMDiffOn_iff_contDiffOn` and `contMDiffAt_subtype_iff` on the open set U, and the same
comparison for real-valued functions with the target model `𝓘(ℝ, ℝ)`. Throughout, `d v` for a smooth coefficient function `v` with values
in ℝ or in ℂ means `mextDeriv (RoughForm.ofFunction I v)` on Tau Ceti's carrier. The
degree-zero form of a smooth function on `M` is a smooth form by `isSmoothForm_ofFunction_iff`,
and `d v` is then smooth by `isSmoothForm_mextDeriv`; `mextDeriv_ofFunction` evaluates `d v` as
`mfderiv`.

Define the real coordinate differentials `dx = d(Re ∘ ι)` and `dy = d(Im ∘ ι)`, real-valued
one-forms, and the complex coordinate differentials `dz` and `dz̄` as the pullbacks
`mpullback` of the native plane forms `SmoothForm.complexDz` and `SmoothForm.complexDzBar`
along the smooth inclusion `ι`; prove `dz = d ι` and `dz̄ = d(conj ∘ ι)`, where `conj` is
`starRingEnd ℂ`: on ℂ the plane forms are `d id` and `d conj` at every point, by
`mextDeriv_ofFunction` with `SmoothForm.complexDz_apply` and `SmoothForm.complexDzBar_apply`,
and `mpullback_mextDeriv_ofFunction` along the smooth `ι` gives the pullbacks. All four are
exterior derivatives of smooth coordinate functions, so `d(dx)=d(dy)=d(dz)=d(dz̄)=0` by
`mextDeriv_mextDeriv`, whose `C²` bundle-form hypothesis the degree-zero form of a smooth
function satisfies. A product of a smooth coefficient function with a form means the
paired wedge `RoughForm.wedgeWith` of its degree-zero form with that form, with pairing the
continuous real-bilinear multiplication of ℝ for real coefficients and of ℂ for complex
coefficients; `dx∧dy` and `dz∧dz̄` are the paired wedges with the same pairings. No
coefficient space is changed anywhere: a real-valued form is never regarded as
complex-valued, and no postcomposition of a form by a linear map is used.

For smooth `u : M → ℂ`, define its real coordinate derivatives by evaluating `mfderiv`
on `e_z 1` and `e_z i`, and put `∂z u=(∂x u−i*∂y u)/2` and `∂barz u=(∂x u+i*∂y u)/2`. The
decomposition `du=(∂z u) dz+(∂barz u) dbarz` of complex-valued one-forms is assembled from
native identities. Let `ũ : ℂ → ℂ` be smooth on `U` with `u = ũ ∘ ι`, for instance the zero
extension of `u`, smooth on `U` by the restriction comparison. At each point `x` of `M`,
`mpullback_mextDeriv_ofFunction_apply` gives `du = ι^*(dũ)` at `x` and `dũ = ũ^*(d id)` at
`ι x`; the pointwise form is the one that applies, since `ũ` is differentiable only on `U`.
The form `d id` is the plane form `SmoothForm.complexDz`, as above, and `mpullback_complexDz`
writes `ũ^*dz = (wirtingerDeriv ũ (ι x) 1) dz + (conjWirtingerDeriv ũ (ι x) 1) dz̄` with no
regularity hypothesis. Pulling back along `ι` is linear at each point (`mpullback_apply`), so
`du = (wirtingerDeriv ũ (ι x) 1) dz + (conjWirtingerDeriv ũ (ι x) 1) dz̄` on `M`. What is
proved here is the comparison of coefficients: `∂z u(x) = wirtingerDeriv ũ (ι x) 1` and
`∂barz u(x) = conjWirtingerDeriv ũ (ι x) 1`, the ambient derivatives used by GH5, whatever
representative `ũ` is chosen, since two representatives agree on the open set `U`. For a
smooth real-valued `v : M → ℝ`, prove `dv=(∂x v) dx+(∂y v) dy` directly: at `x`, both sides
send `e_x w` to `∂x v(x)·Re w+∂y v(x)·Im w`; the real case below uses this identity.
By the determinant wedge evaluation `wedgeWith_apply_one_one`,
`dz∧dz̄` takes the value `1·(−i)−i·1=−2i` on `(e_z 1,e_z i)`, and `dx∧dy` takes the value
`1·1−0·0=1` there. A real-alternating two-form on the two-dimensional real space ℂ is
determined by its value on the pair `(1,i)`, so every smooth complex-valued two-form `η`
has the unique form `η=h dz∧dbarz` with `h(z)=η_z(e_z 1,e_z i)/(−2i)`, and every smooth
real-valued two-form `η` has the unique form `η=h dx∧dy` with `h(z)=η_z(e_z 1,e_z i)`; prove
`h` smooth in both cases. Extend `h` by zero off `U`; the restriction comparison gives an
ambient function smooth on `U`.

The closed completion of 7.1 on this carrier is `exists_smooth_closed_completion_form`: for
smooth `f : M → ℂ` there is smooth `g : M → ℂ` with `d(g dz+f dz̄)=0`, the products being the
paired wedges of the degree-zero forms of `g` and `f` with `dz` and `dz̄`. Extend `f` by zero
off `U`, smooth on `U` by the restriction comparison, take `g` from the scalar closed
completion of that extension, restricted to `M`; the Leibniz rule with `d(dz)=d(dz̄)=0` gives
`d(g dz+f dz̄)=dg∧dz+df∧dz̄=((∂z g) dz+(∂barz g) dz̄)∧dz+((∂z f) dz+(∂barz f) dz̄)∧dz̄
=(∂z f−∂barz g) dz∧dz̄=0`, using `dz∧dz=dz̄∧dz̄=0` and `dz̄∧dz=−dz∧dz̄`.

For the complex case, `exists_mextDeriv_eq_complex_two_form`: apply GH5 to `h`, obtaining `u`
with `∂barz u=h`, restrict to `M`, and use the `mextDeriv_wedgeWith` Leibniz rule with
`d(dz)=0` to obtain `d(−u dz)=−du∧dz=(∂barz u) dz∧dbarz=η`, since `dz∧dz=0`; the one-form
`−u dz` is smooth by `IsSmoothForm` of a paired wedge of smooth forms. For the real case,
`exists_mextDeriv_eq_real_two_form`: apply GH5 to the datum `h/2`, obtaining `u` with
`∂barz u=h/2`, and set `β=(Im u) dx+(Re u) dy`, a real-valued one-form with the real smooth
coefficients `Re ∘ u` and `Im ∘ u`. The real Leibniz rule with `d(dx)=d(dy)=0` gives
`dβ=((Re u)_x−(Im u)_y) dx∧dy=2 Re(∂barz u) dx∧dy=η`. Thus every smooth real-valued two-form
on `M` is exact. Prove `subsingleton_deRhamCohomology_two`, the vanishing `H²_dR(U;ℝ)=0` on
Tau Ceti's `deRhamCohomology 𝓘(ℝ, ℂ) M 2`: every class is `deRhamCohomology.mk` of a closed
two-form by `mk_surjective`, every smooth two-form on `M` is closed by
`mem_closedForms_of_finrank_le` since the model space ℂ has real dimension 2, and the real
exactness puts every such form in `exactForms 𝓘(ℝ, ℂ) M 2`, so the class is zero by
`mk_eq_zero_iff`. No hypothesis on `U` is needed: for `U=∅` the only form is zero, for `U=ℂ`
this is the degree-two Poincaré lemma of the plane, and for disconnected `U` the solver works
on each component at once. CKG K5a consumes the complex exactness on this same open-subtype
carrier and owns its complex-coefficient quotient comparison, including `H²_dR(U;ℂ)=0`.

The coordinate-form API includes the tangent trivialization, the ambient/restricted
smoothness comparison for real and complex values, dx, dy, dz and dz̄ as exterior
derivatives of coordinate functions with their evaluations and vanishing exterior
derivatives, the identification of the coefficients of du with the ambient Wirtinger
derivatives, the decomposition of dv for real-valued v, unique coefficient extraction for
real and complex two-forms, the form-level closed completion, real and complex exactness,
and the real degree-two de Rham vanishing. Smoothness of degree-zero forms and of their
exterior derivatives, and the Wirtinger decomposition of a pulled-back dz, are native. These
are direct consequences of the native exterior derivative, pullback naturality, Leibniz rule,
determinant wedge convention and de Rham complex together with Layer 7.1, not an additional
generic form carrier or a generic operation on forms.

**Checks.**

- dx and dy on (e_z 1, e_z i) give rows (1,0) and (0,1), and dz and dz̄ give rows (1,i) and
  (1,−i); exchanging dx and dy reverses orientation, and omitting conj would make dz̄ equal dz.
- dz∧dz̄ on (e_z 1, e_z i) is −2i and dx∧dy is 1; hence the coefficient of dz∧dz̄ in itself is
  (−2i)/(−2i)=1, and the opposite order dz̄∧dz would give +2i.
- For η=dz∧dz̄, h=1 and u=z̄; then d(−z̄ dz)=dz∧dz̄, with coefficient +1. Using +u dz instead
  would give −dz∧dz̄.
- For η=dx∧dy, h=1 and the datum is 1/2; u=z̄/2 has Re u=x/2 and Im u=−y/2, so
  β=(x dy−y dx)/2, whose derivative is dx∧dy; its value on (e_z 1, e_z i) is 1. Taking
  β=(Re u) dx+(Im u) dy instead would give dβ=((Im u)_x−(Re u)_y) dx∧dy=0.
- For f=z̄ on ℂ the closed completion is g=0 up to a holomorphic summand, since ∂z f=0, and
  d(z̄ dz̄)=dz̄∧dz̄=0; for f=z it is g=z̄ and d(z̄ dz+z dz̄)=dz̄∧dz+dz∧dz̄=0, whereas g=0
  would leave d(z dz̄)=dz∧dz̄≠0.
- On U=ℂ the class of dx∧dy in H²_dR(ℂ;ℝ) is zero, with primitive (x dy−y dx)/2. On the
  circle every one-form is closed by the same dimension count, yet dθ is not exact and H¹ is
  ℝ; the vanishing here rests on the exactness theorem, not on closedness alone.

*Needs:* Layers 7.1 and 0.1; Tau Ceti's `RoughForm`, `RoughForm.ofFunction`, `IsSmoothForm`,
`SmoothForm`, `isSmoothForm_ofFunction_iff`, `isSmoothForm_mextDeriv`, `mextDeriv`,
`mextDeriv_ofFunction`, `mextDeriv_mextDeriv`, `RoughForm.wedgeWith`,
`wedgeWith_apply_one_one`, `mextDeriv_wedgeWith`, `mpullback`, `mpullback_apply`,
`mpullback_mextDeriv_ofFunction`, `mpullback_mextDeriv_ofFunction_apply`,
`SmoothForm.complexDz`, `SmoothForm.complexDzBar`, `SmoothForm.complexDz_apply`,
`SmoothForm.complexDzBar_apply`, `mpullback_complexDz`, `mpullback_complexDz_apply`,
`closedForms`, `exactForms`, `mem_closedForms_of_finrank_le`, `deRhamCohomology`,
`deRhamCohomology.mk_surjective` and `deRhamCohomology.mk_eq_zero_iff`; Mathlib
`contMDiffAt_subtype_iff`, `contMDiffOn_iff_contDiffOn`, the open-subtype tangent maps,
`Complex.reCLM`, `Complex.imCLM` and `starRingEnd ℂ`.

### 7.3 Coordinate worked examples

 Keep these scalar computations in GH5; the disk moment is
proved by polar area integration and has no form-carrier or CKG dependency. On all of `ℂ`, prove
`d(i z²)=2iz dz` and `d(i|z|²)=i(z̄ dz+z dz̄)`, as identities of
complex-valued real one-forms with the coefficient pairing specified above. Also prove
`d(|z|²)=2(x dx+y dy)` and `d(|z|⁴)=4(x²+y²)(x dx+y dy)`. On `ℂ\{0}`, prove
`d((log|z|)²)=log(x²+y²)(x dx+y dy)/(x²+y²)`, using
`log|z|=½ log(x²+y²)`; keep the expression `(log|z|)²` distinct from `log(|z|²)`.
Using the Layer 0 Wirtinger operators, for `m,n∈ℤ` prove on `ℂ\{0}`
`∂_z(z^mz̄^n)=m z^(m−1)z̄^n` and
`∂_{z̄}(z^mz̄^n)=n z^mz̄^(n−1)`. For `m,n∈ℕ`, prove the corresponding formulas on
all of `ℂ`, reading the derivative term as zero when its exponent is zero: `∂_z=0` if `m=0`
and `m z^(m−1)z̄^n` otherwise; `∂_{z̄}=0` if `n=0` and
`n z^mz̄^(n−1)` otherwise.

Let `D=ball 0 1 ⊂ ℂ` with native Lebesgue area `volume`. For `m,n∈ℕ`, prove
`∫_D z^mz̄^n dvolume = if m=n then π/(m+1) else 0`, by polar coordinates: the angular
integral vanishes unless `m=n`, while the equal-index radial integral is
`2π∫₀¹ r^(2m+1)dr=π/(m+1)`. State that `D` is the open unit disk and that `m,n` are natural
exponents; negative powers are not part of this disk-integrability claim. GH4's separate
real/imaginary Green specialization supplies a Stokes cross-check, not a prerequisite for this
GH5 computation.

These are derived coordinate computations using the real chain and product rules and the
polar Jacobian r, not attributed exercise statements. For the differential convention use
Rainer, §10, equation (10.1), p. 23 (rainer line 1189); the polar kernel calculation in the
proof of Proposition 10.1, p. 23 (rainer line 1237), uses the same area normalization.

**Checks.**

- At z=1 in direction 1, d(iz²)=2i and d(i|z|²)=2i; at z=i in direction 1 they are
  −2 and 0 respectively, distinguishing the two functions.
- At z=2 in direction 1, d(|z|²)=4 and d(|z|⁴)=32; the logarithm-square formula gives
  2 log(2)·(1/2)=log 2 on the left and log(4)·2/4=log 2 on the right.
- For (m,n)=(0,0), both monomial derivatives vanish; for (1,1) they are (z̄,z).
  On the punctured plane m=−1,n=0 gives ∂z(z⁻¹)=−z⁻², equal to −1 at z=1.
- The disk moments for (m,n)=(0,0),(1,0),(1,1) are π, 0 and π/2, respectively;
  the denominator m+1 is always positive. Negative exponents are excluded.

*Needs:* Layer 0.1, native real differentiation and polar change of variables; Layer 7.2
only for the bundled form presentation. The scalar disk calculation uses no Green theorem.

### 7.4 Cousin I and planar de Rham consequences (GH5.1)

For `additive_cousin_I`, for every open Ω⊆ℂ and arbitrary open
cover {Uᵢ}, prove: every
holomorphic additive 1-cocycle `c_ij` with `c_ij+c_jk+c_ki=0` is a coboundary. Choose a smooth
partition ρₖ with locally finite supports subordinate to the cover and set `b_i=Σ_k ρ_k c_ik` on `U_i`.
Verify `b_i-b_j=c_ij`, so `∂̄b_i` is one global smooth datum; solve `∂̄u=∂̄b_i` by GH5,
and check `b_i-u` are holomorphic and glue with the required differences. For the Mittag–Leffler application,
use `Ω₀=Ω\E` and small disjoint disks around the marked points, and verify this is an open
cover. Layer 7.2 gives exactness for every complex-valued and every real-valued smooth
two-form on the open subtype and the vanishing of Tau Ceti's real degree-two de Rham
cohomology; no quotient is constructed here. CKG K5a consumes the complex exactness
statement and proves its own complex de Rham comparison on the generic form carrier. The open plane
domain is Hausdorff and paracompact. This uses no singular/de Rham comparison or fundamental class.

The Cousin API permits arbitrary index types and open covers, with the convention
cᵢⱼ=bᵢ−bⱼ; only the subordinate partition's supports need be locally finite. A refinement
restricts the solution, and the difference of two solutions glues to a global holomorphic function.
This is Rainer, Proposition 12.3 and Theorem 12.4, p. 32 (rainer lines 1658, 1689).

**Checks.**

- For a two-set cover with c₁₂=1 and c₂₁=−1, choose b₁=1,b₂=0; the differences are 1 and −1.
- On a one-set cover the triple equation is 3c₁₁=0, forcing c₁₁=0; b₁=0 works.
- For the empty cover of the empty domain, all intersection equations are vacuous.
- Countably many copies Uᵢ=Ω form a non-locally-finite cover when Ω≠∅, but the zero cocycle
  still has bᵢ=0; local finiteness of the cover is not a necessary hypothesis.

*Needs:* Layer 7.1, native subordinate smooth partitions with locally finite supports,
restriction/gluing of smooth functions and the homogeneous CR criterion. The exactness
statements are Layer 7.2's.

### Examples

The constant two-set cocycle has coboundary (1,0), and d((x dy−y dx)/2)=dx∧dy. The subsection Checks fix the detailed conventions.

### Dependencies

Layers 0 and 2 for the scalar solver; Tau Ceti's smooth-form carrier and de Rham complex for the form consequences. ComplexKahlerGeometry is a consumer only.

## Downstream consumers

ComplexKahlerGeometry K2 consumes Layer 0.3's derivative transfer and Riemann-sum estimate
for the native Cauchy transform, GH0's finite-rank Runge operators and the planar exhaustion
for its parameter solver; K5a consumes GH5.1's complex
two-form exactness for its complex de Rham comparison. Layer 7.2 proves `H²_dR(U;ℝ)=0` for
an open `U⊆ℂ` on Tau Ceti's `deRhamCohomology`, available to every consumer.
Hyperfunctions HF2 uses the one-variable input through those analytic layers.
ConformalMapping's compactness criterion is stated on ambient families and consumes nothing
here; its L5 boundary topology is an independent input only to Layer 6. ZerosOfLFunctions
remains an earlier supplier.

## References

- Armin Rainer, *Advanced Complex Analysis*, 112-page institutional version hosted in 2025,
  based on the Vienna 2016–2017 course. [Legal institutional text](https://www.tuwien.at/mg/arainer/wp-content/uploads/2025/03/advanced-complex-analysis.pdf).
  Proposition 10.1 and Theorems 10.2–10.3, pp. 23–24; §11, equation (11.2), Exercises 19–20,
  Theorem 11.1, Lemma 11.3 and Theorem 11.7, pp. 25–29; Theorems 12.1–12.4,
  pp. 31–32; Propositions 14.1–14.2 and Theorem 14.3, pp. 34–36;
  Proposition 15.2, Theorem 15.3, Remark 15.4 and Theorems 15.5–15.7, pp. 36–40.
  Locators use printed pages, not PDF page numbers; rainer lines 1189–2136.
- J. D. Gray and S. A. Morris, *When Is a Function That Satisfies the Cauchy–Riemann
  Equations Analytic?*, American Mathematical Monthly 85 (1978), 246–256.
  [Legal author copy](https://www.sidneymorris.net/Morris51.pdf).
  Theorem 3, p. 247; Appendix, Lemma 1 and proof, pp. 252–254;
  gray-morris lines 66 and 310–396. The local Baire and balanced-rectangle details in
  Layer 0 specify the hypotheses used in transporting this proof.
