# Roadmap: global holomorphic functions of one complex variable

**Summary.** Build global one-variable approximation, prescribed isolated singularities and
divisors, arbitrary-genus primary products and full Weierstrass factorization from the local
complex-analysis and contour libraries. Develop compact-open holomorphic function spaces,
Cauchy–Green, global smooth ∂̄ solvability, Cousin I and exactness of planar two-forms on
arbitrary open subsets of ℂ.

## Scope and ownership

This roadmap owns the global plane-domain results and their analytic comparison interfaces.
The local holomorphic, analytic-order, meromorphic and compact-convergence carriers are in
Mathlib; contour cycles, winding and primitive/logarithm results are in Tau Ceti.
DifferentialGeometry, Layers 0–1 and 6.1–6.2, owns generic manifold forms, their exterior
derivative and the real de Rham quotient; its §5.6.3 owns finite-cycle Green.
ConformalMapping L5 owns Jordan separation and filled-hull topology. Layer 7.2 here owns
only the planar coordinate forms on an open subset of ℂ: the coordinate differentials
dx, dy, dz, dz̄ as exterior derivatives of coordinate functions, products of smooth
coefficients with forms through the supplied paired wedge, coefficient extraction for
two-forms, and real and complex two-form exactness. No operation on forms over a general
manifold is constructed here.

ZerosOfLFunctions, Layer 5.2–5.5, owns the zero-support API, the genus-one factor and its
basic API, its canonical product under order-one growth, and the entire logarithm.
Layer 1 here extends that mathematics to arbitrary genera, arbitrary compact-summable
holomorphic deviations, and weighted divisors given directly with inverse-square summability,
without an entire function or growth bound as input. Layer 5 proves full factorization without
finite-order hypotheses. These are extensions of the stated contracts, not a reassignment
of their genus-one special case; ZerosOfLFunctions is a supplier, not a consumer.

Hyperfunctions HF2.AnalyticPreparation owns the generic topological filled-compact
exhaustion of an open subset of ℝ^(2n), in every even dimension, by a route that uses no
holomorphic function; that construction is not a target here. Layer 2 owns the holomorphic
hull of a compact subset of a plane domain and the plane Runge exhaustion obtained by
applying that hull to native compact exhaustions. Hyperfunctions consumes this roadmap's
one-variable results and is downstream, so nothing of it is an input here; on a plane
domain the two exhaustions deliver the same filledness property.
ComplexKahlerGeometry K2 owns parameter-dependent solvers, and K5a owns the complex-coefficient
de Rham comparison; they consume this roadmap's scalar results and complex two-form exactness.

The native sine product and cotangent series, and the exponential finite-product majorant,
are supplied results, not new theorems. Layer 6 retains their comparison calculations as
proof-route examples. The sharp finite-product inequality is a distinct target.

## Conventions

Work with scalar functions on arbitrary open Ω⊆ℂ, including empty and disconnected Ω.
Use `DifferentiableOn ℂ`, native analytic orders and native locally finite divisors.
Analytic order ∞ is distinguished from order zero; the zero function's totalized native
meromorphic divisor is zero, so equal-divisor factorization requires both functions nonzero.
Smoothness means `ContDiffOn ℝ ∞`, whereas analytic manifold maps use order `ω`.
All function-space uniformities are scoped, and all index types are universe-polymorphic.
Unordered products use the cofinite finite-subset product filter; an explicitly paired
series has only the stated pairing. Empty products equal one.

The positive real basis of ℂ is (1,i), dA=dx dy is native Lebesgue area, and
∂̄=(∂x+i∂y)/2, ∂z=(∂x−i∂y)/2. Thus dz∧dz̄ evaluated on (1,i) is −2i.
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
- `ContMDiffMap` in `Mathlib/Geometry/Manifold/ContMDiffMap.lean` supplies the analytic map
  subtype, not a chosen compact-convergence uniformity. `ContinuousMap.compactConvergenceUniformSpace`,
  `ContinuousMap.tendsto_iff_tendstoLocallyUniformly` and the complete-space instance in
  `Mathlib/Topology/UniformSpace/CompactConvergence.lean` apply to the locally compact
  open subtype and complete codomain ℂ. `CompactExhaustion` supplies ordinary compact
  exhaustions, without a Runge condition.
- `Summable.hasProdUniformlyOn_one_add` in
  `Mathlib/Analysis/Normed/Module/MultipliableUniformlyOn.lean` requires a summable eventual
  majorant on the specified set. `Complex.logDeriv_tendsto` in
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
  `contMDiff_inclusion` handles open-subtype inclusions.
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

### From TauCetiRoadmap.DifferentialGeometry

Consume §0.1's determinant-normalized paired wedge, §§0.3–0.4's rough and smooth forms
with `RoughForm.ofFunction` and `RoughForm.wedgeWith`, §1.1's chartwise exterior derivative
with `mextDeriv_ofFunction`, §1.2's pullback naturality, §1.3's `mextDeriv_mextDeriv` and
regularity, §1.4's fixed-bilinear-pairing Leibniz law `mextDeriv_wedgeWith`, §5.6.3's local
finite-cycle Green theorem, and §§6.1–6.2's real de Rham complex and quotient. Products of
smooth coefficient functions with forms are the paired wedge with the fixed real-bilinear
multiplication pairing of ℝ or of ℂ, and complex coordinate differentials are exterior
derivatives of complex-valued coordinate functions; no coefficient-postcomposition
operation on forms is consumed, and none is constructed here.

### From TauCetiRoadmap.ZerosOfLFunctions

Consume Layer 5.2's countable locally finite zero support, Layer 5.3's genus-one factor
and basic API, Layer 5.4's growth-to-summability canonical product, and Layer 5.5's entire
logarithm. The inverse-square-input and arbitrary-genus extensions are stated in Layer 1.
Use the native contour logarithm implementation for the logarithm contract.

### From TauCetiRoadmap.ConformalMapping

Consume L5's Jordan separation and filled-hull topology for Layer 6's boundary construction.
Its orientation-to-winding comparison and finite-hole assembly are targets of Layer 6.
No geometric mapping theorem enters the scalar Cauchy–Green or global ∂̄ solver.

## How to read the build

Layer 0 develops real-plane calculus and compact-support Cauchy–Green. Layer 1 develops
primary factors and summable products. Layer 2 (GH0) supplies hulls, compact-open spaces
and Runge; Layer 3 (GH1) realizes divisors and boundary noncontinuation; Layer 4 (GH2)
realizes isolated singularities; Layer 5 (GH3) gives full factorization. Layer 6 (GH4)
applies these results to products, approximation and contours. Layer 7 (GH5) solves global
∂̄ and Cousin I and proves planar two-form exactness. Each route lists its own inputs;
Layer 7's scalar solver does not use Layer 6's Green theorem. Suggested.lean states the
headline theorems on pinned carriers; generic form and de Rham endpoints remain prose
because their intended carriers are supplied by DifferentialGeometry.

## Layer 0: real-plane calculus and compact-support Cauchy–Green

### 0.1 Wirtinger operators

Define `barDerivative` and `zDerivative`, the Wirtinger operators, by the native real Fréchet derivative:
`∂̄u(z)=(fderiv ℝ u z 1+i*fderiv ℝ u z i)/2` and
`∂_z u(z)=(fderiv ℝ u z 1−i*fderiv ℝ u z i)/2`.
Under `DifferentiableAt ℝ u z`, prove `∂̄u(z)=0` iff `DifferentiableAt ℂ u z`;
derive the open-set versions under real differentiability at each point. Smoothness uses
`ContDiffOn ℝ ∞`, with `open scoped ContDiff`; native `⊤` in this order type is analytic
order `ω`, and does not express the smooth compact-support inputs.

The operator API is:

- Both operators are complex-linear in smooth coefficient functions and satisfy the product rule.
- For real-differentiable u, du=∂z u dz+∂̄u dz̄; vanishing ∂̄ is equivalent to complex differentiability.
- Restriction to an open neighborhood preserves both operators; iterated operators commute on smooth functions.

**Checks.**

- For u(z)=z, (∂z u,∂̄u)=(1,0); omitting 1/2 would give (2,0).
- For u(z)=z̄, the pair is (0,1); exchanging signs would reverse the two entries.
- For u(z)=|z|², the pair is (z̄,z); at z=i this is (−i,i), distinguishing conjugation.

These are direct real-coordinate differentiations; the differential convention agrees with
Rainer, §10, equation (10.1), p. 23 (rainer line 1189).
*Needs:* Mathlib `fderiv`, real/complex differentiability and the chain and product rules.

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
`Complex.volume_preserving_equiv_real_prod`. Prove local integrability of `1/z` in two real
dimensions. Pin the fundamental-solution identity by the following complex bilinear weak
identity for every smooth compactly supported test function φ:
`∫ ζ, (1/(π*ζ))*∂̄φ(ζ) dA(ζ) = −φ(0)`.
This defines `∂̄(1/(πz))=δ₀` through integration by parts; it is not a pointwise derivative
claim or a sesquilinear test pairing. Bochner integrals use the native complex Banach carrier.
For bounded measurable compactly supported input, prove integrability of the translated
kernel for each z. For smooth compactly supported input, prove transfer of derivatives under
the convolution and all smoothness conclusions used below. These scalar analytic results
use native real-plane measure and calculus, independently of a manifold-form implementation.

Define `cauchyGreen` by the integral below. Establish `cauchyGreen_barDerivative` and
`cauchyGreen_barDerivative_reconstruct`, the compact-support Cauchy–Green identities used in its
Cauchy/Pompeiu route: for `φ∈C_c^∞(ℂ)`, `Tφ(z)=(1/π)∫φ(ζ)/(z−ζ) dA(ζ)` is smooth and
`∂̄Tφ=φ`; moreover `T(∂̄φ)=φ`. Fix the normalization/sign by this displayed kernel. For a
cutoff `α` equal to one near `K`, apply the compact-support formula to `αf`; the remaining
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
- On smooth compactly supported data it is a right inverse to ∂̄, and its application to ∂̄φ
  reconstructs φ. No compact support of the output is claimed.

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
*Needs:* Layer 0.1; real-plane Lebesgue integration, polar change of variables, smooth cutoffs,
differentiation under integrals and the scalar circle Cauchy formula. No manifold Stokes theorem is an input.



### Examples

For z and z̄ the operator pairs are (1,0) and (0,1); a unit radial cutoff has weak kernel integral −1. The subsection Checks fix the detailed conventions.

### Dependencies

Native real/complex calculus and measure theory; Tau Ceti Morera. No later layer supplies an input.

## Layer 1: preparatory primary factors and locally uniform products

### 1.1 Arbitrary genera and compact summability

Define `elementaryFactor` by E₀(w)=1−w and `E_p(w)=(1-w) exp(w + … + w^p/p)` for p>0. For a finite or countable sequence of nonzero zeros `a_n` repeated according to multiplicity,
allow the empty and finite cases (empty product `1`), and for an infinite sequence require
`|a_n|→∞`. Prove local-uniform convergence of `∏ E_{p_n}(z/a_n)` under
`Σ_n (R/|a_n|)^(p_n+1)<∞` for every `R>0`, and prove its exact zero divisor in `exists_entire_primary_product_exact`. State the local
order equality `analyticOrderAt F z = Nat.card {n | a_n=z}` when the set is finite; multiplicity
indexing, rather than distinct zero support, supplies the general repeated-zero statement. Prove the sharp estimate `|1−E_p(w)|≤|w|^(p+1)` for `|w|≤1`, the local-uniform
primary-product theorem and its exact zero divisor. Also prove the general locally-uniform product
lemma: for holomorphic `u_j` on open U with `Σ_j sup_K |u_j|<∞` for every compact K⊂U,
`∏_j(1+u_j)` converges locally uniformly to a holomorphic function. At each z let
`J_z={j : u_j(z)=−1}`. Compact summability forces `J_z` finite; require also each factor indexed
by `J_z` to have finite germ order at z (so none vanishes identically near z). Then their orders
sum to the product order, while the remaining tail is a holomorphic unit germ at z. In particular,
if `J_z=∅`, the product is nonzero at z. For the convergence conclusion consume
`Summable.hasProdUniformlyOn_one_add` (or its natural-number variant) from
`Mathlib/Analysis/Normed/Module/MultipliableUniformlyOn.lean` on each compact K, with the
summable majorant `sup_K |u_j|` and continuity supplied by holomorphy. Use its actual
cofinite eventual-majorant hypothesis; the majorant may depend on K. Assemble the compact
conclusions into `HasProdLocallyUniformlyOn` and use native holomorphic-limit closure.
The locally uniform theorem with one global majorant does not itself supply this
compact-dependent adapter. For the additional germ-order and unit-tail conclusions,
discard finitely many terms so `|u_j|≤1/2`, sum the logarithmic series, and treat the finite
factors separately. The weaker uniform-absolute-tail criterion below remains a separate target.

The primary-factor and product API is:

- Every primary factor is entire, normalized to one at zero and has precisely one simple zero at one.
- The compact-summability product has the specified locally uniform limit and the sum of finite
  zero-fiber multiplicities as its exact analytic order.
- Reindexing by an equivalence and grouping finite multiplicity fibers preserve the normalized product.

**Checks.**

- E₀(0)=1 and E₀(1)=0, whereas E₀(−1)=2; dropping the linear factor fails the zero check.
- E₁(1)=0 and E₁′(1)=−e, exactly the supplier's genus-one normalization.
- An empty index has product 1 and order 0 everywhere; two genus-zero factors at a=1
  give (1−z)² and order 2 at 1, not the cardinality 1 of the distinct support.

The product theorem is Rainer, Theorem 14.3, pp. 35–36, and the primary factors are
Remark 15.4, p. 38 (rainer lines 1868, 2030); unordered and repeated-index forms are
obtained from absolute compact summability. For the sharp deviation estimate, expand 1−Eₚ as a power series: its coefficients are
nonnegative real numbers, vanish through degree p, and sum to 1 at w=1. Thus at |w|≤1
the absolute sum is at most |w|ᵖ⁺¹, including p=0 and w=1.
*Needs:* ZerosOfLFunctions Layer 5.3; Mathlib uniform product majorants, holomorphic limits,
analytic order and power series. Exact-order bookkeeping uses a unit tail and the finite product rule.

### 1.2 Genus-one products over weighted zero support

For arbitrary p, the primary-factor API extends the genus-one contract in Scope and
ownership. Writing Qₚ(w)=Σₖ₌₁ᵖ wᵏ/k, prove Eₚ(0)=1, Eₚ(w)=0 iff w=1,
Eₚ′(w)=−wᵖ exp(Qₚ(w)), and Eₚ′/Eₚ=−wᵖ/(1−w) for w≠1. At p=1,
identify this factor with the supplied genus-one factor. The sharp deviation bound gives
the stronger normalized estimate log ‖E₁(w)‖≤‖w‖² on the unit disk;
treat w=1 separately using Real.log 0=0. These identities follow by differentiation of
the defining formula (Rainer, Remark 15.4, p. 38); the small-disk estimate uses Layer 1.1.

Supply the following weighted-support specialization without choosing an enumeration.
Let `S⊂ℂ\{0}` be countable, meet each compact set in finitely many points, and carry
finite multiplicities `m:S→ℕ`. Zero multiplicities are allowed; for actual zero support
they are positive. If `Σ_(ρ:S) m(ρ)/‖ρ‖²<∞`, then

`P(z)=∏' (ρ:S), E₁(z/ρ)^(m(ρ))`

converges locally uniformly on ℂ, is entire, satisfies `P(0)=1`, and has analytic order
`m(ρ)` at each `ρ∈S` and zero order elsewhere. Its native meromorphic divisor has these
same values, cast to ℤ. Include empty and finite support.

Apply the countable-index primary-product theorem to `ι=Σ (ρ:S), Fin (m ρ)`,
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
multiplicities preserve the limit. This is the inverse-square-input consequence of Layer 1.1,
using Rainer, Theorem 14.3, pp. 35–36 (rainer line 1868).

**Checks.**

- S=∅ or D=0 gives P=1 and divisor 0, with P(0)=1.
- S={1}, m(1)=2 gives P(z)=(1−z)² exp(2z); the analytic order and divisor at 1 are both 2.
- S={2}, m(2)=0 contributes factor 1 and order 0; forbidding zero multiplicity would lose this input.
- For S={1}, m=2, the repeated-index majorant is 2R²=R²·2, fixing the real multiplicity cast.

*Needs:* Layer 1.1; ZerosOfLFunctions Layer 5.2's support API; finite-fiber grouping for
locally uniform products and the native analytic-order/divisor comparison.

### 1.3 Variable exponents, genus, and logarithmic derivatives

For any escaping sequence, the universal choice `p_n=n−1`, indexed by n≥1, is admissible:
on each disk of radius R the tail has `R/|a_n|≤1/2`, hence its majorant is at most `2^(−n)`.
For constant p, define the genus of the repeated nonzero zero list to be the least p∈ℕ with
`Σ |a_n|^(−p−1)<∞`, and infinity if none exists; use genus zero for finite/empty lists.
Prove that this summability is equivalent to absolute locally uniform convergence of the
primary-factor deviations on compact disks for a fixed p. This is the unordered absolute
criterion; a product grouped in opposite pairs can converge even when its ungrouped
genus-zero criterion fails. The general factorization theorem permits variable p_n and
therefore imposes no finite-genus hypothesis.

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

This is derived from the primary-factor expansion and Rainer, Remark 15.4, p. 38
(rainer line 2030); logarithmic-derivative passage uses the pinned theorem in the supplier contract.
*Needs:* Layer 1.1; native power-series estimates and `Complex.logDeriv_tendsto` with
nonzero limit and holomorphic approximants; the finite-product derivative rule.

### 1.4 Sharp finite-product majorant

For every finite set `s` and `u : ι → ℂ`, put `P_s=∏_(i∈s)(1+u_i)` and
`A_s=∏_(i∈s)(1+‖u_i‖) : ℝ`. Prove both inequalities

`‖P_s−1‖ ≤ A_s−1` and `A_s ≤ exp(Σ_(i∈s) ‖u_i‖)`.

The first is a separate sharp finite-induction target: the native
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
The stronger compact-sup-summability criterion is also a useful sufficient condition.

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

ZerosOfLFunctions Layer 5.2–5.5 and native product/analytic-order APIs. No global factorization is used.

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
Construct the Runge exhaustion from holomorphic hulls: start with a native compact
exhaustion of Ω, choose each next compact stage with the preceding hull in its interior,
and take its Ω-holomorphic hull. Compactness of each hull and compact cofinality make
these choices possible. The result has nested interiors, union Ω, compact cofinality and
no relatively compact complementary component: a component of Ω∖K̂ with compact closure
in Ω would lie in the hull of K̂, which is K̂ itself, by the maximum-principle inclusion
and idempotence (Rainer, Lemma 11.3, items (1), (2) and (4), pp. 27–28, and the
construction in the proof of Theorem 12.1, p. 31). The ordinary distance exhaustion used
for the comparison metric below does not require this hull operation.

The hull API includes compactness, extensivity, monotonicity, idempotence, the
maximum-principle inclusion of relatively compact complementary components, and the
distance and convex-hull comparisons. The exhaustion API
has nested interiors and compact cofinality, and each stage equals its holomorphic hull.
These are Rainer, Lemma 11.3, pp. 27–28 (rainer line 1437), apart from its item (3), which
is the hull equality of 2.5; the exhaustion is its recursive compact-cofinal consequence.

**Checks.**

- For K=∅, the universal bound B=−1 for f=0 excludes every point, so its hull is ∅;
  both extended distance infima are ∞.
- For K={2≤|z|≤3} in Ω={|z|<4}, the hull is {|z|≤3}; the common distance to Ωᶜ is 1.
- For the same K in Ω={1<|z|<4}, the hull is K. The function 1/z excludes |z|<2;
  filling this ambient hole would be wrong.
- In Ω=ℂ, the radius-n closed ball is its own hull and a valid exhaustion stage,
  agreeing with the plane instance of the topological exhaustion owner.

*Needs:* Mathlib compact exhaustions and connected components; the maximum principle and
the elementary separating functions z, 1/(z−ζ) and exp(az). No later subsection is used.

### 2.2 Holomorphic functions with compact-open convergence

Define `HolomorphicMapSpace` as follows. For an open set `U : TopologicalSpace.Opens ℂ`, use Mathlib's native bundled analytic maps
`H(U) = ContMDiffMap (modelWithCornersSelf ℂ ℂ) (modelWithCornersSelf ℂ ℂ) U ℂ ω`
(`Mathlib/Geometry/Manifold/ContMDiffMap.lean`).
The complex charted-space and analytic-manifold structures on U are the native restrictions
of those on ℂ. The order is analytic `ω`. Equality is equality of functions on U.

Define `HolomorphicMapSpace.toContinuousMap` by sending such a map to its underlying native continuous map `ι : H(U) → C(U,ℂ)` and prove
injectivity. Equip H(U) with the uniformity induced by ι from native compact convergence on
`C(U,ℂ)`; its topology is compact-open. Install this as a scoped instance in the
`HolomorphicMapTopology.compactConvergenceUniformity`, with the supporting
`HolomorphicMapTopology.openSubtypeLocallyCompact` instance, opened explicitly by consumers: the reducible analytic-map alias
must not install a global uniformity on all native `ContMDiffMap` users. Prove the precise range comparison:
`g ∈ range ι` iff the ambient representative
`g₀(z) = if hz : z∈U then g ⟨z,hz⟩ else 0` satisfies `DifferentiableOn ℂ g₀ U`.
Use the restricted complex charts, complex analyticity versus differentiability on open sets,
and agreement of representatives on U. Values outside U do not affect this condition.
Identify ι with a uniform embedding onto this closed subspace. This comparison connects
the manifold-map bundle with the existing ambient `DifferentiableOn` API; it is not an
additional definition of holomorphicity.

Use Mathlib’s native compact-convergence infrastructure:
`CompactExhaustion.hasAntitoneBasis_compactConvergenceUniformity` gives an entourage basis;
its countable-generation instance on a locally compact σ-compact source supplies
metrizability; and `ContinuousMap.tendsto_iff_tendstoLocallyUniformly` identifies convergence.
Construct the following explicit complete comparison metric for that same uniformity,
retaining it definitionally with `MetricSpace.replaceUniformity`. Scope the resulting
metric instance in the same `HolomorphicMapTopology` namespace as the induced uniformity;
keep the comparison distance on `C(U,ℂ)` as an explicit definition, without installing
a competing global metric instance on that native carrier. Use the elementary exhaustion,
for integers n≥1 and Ω the underlying set of U,

`K_n = {z : ℂ | ‖z‖ ≤ n ∧ Metric.infEDist z Ωᶜ ≥ ENNReal.ofReal (1/n)}`.

Prove compactness, `K_n ⊆ int K_(n+1)`, and cofinality among compact subsets of Ω.
For Ω=ℂ the extended distance to its empty complement is ∞; only the radius cutoff remains.
For Ω=∅ every K_n is empty and H(U) has one element. The metric construction uses no Runge
theorem and no normal-family theorem. Any cofinal nested compact exhaustion gives the same
uniformity, by the native compact-exhaustion basis theorem.

For continuous maps f,g on U put `s_n(f,g)=sup_(z∈K_n) |f(z)−g(z)|`, with value zero for
empty K_n, and define

`d_C(f,g)=Σ_(n≥1) 2^(−n) s_n(f,g)/(1+s_n(f,g))`.

Prove it is a metric on `C(U,ℂ)`, and restrict it through ι to d on H(U). Bound each term by
`2^(−n)`; use monotonicity and subadditivity of `t/(1+t)` for the triangle inequality and
cofinality for separation. Also compare with the metric using `min(1,s_n)`, via
`min(1,t)/2 ≤ t/(1+t) ≤ min(1,t)` for t≥0.

Prove equality of uniformities, rather than only a statement about convergent sequences.
A finite collection of compact-sup conditions is controlled by one K_N and the smallest
requested tolerance ε. The inequality `d_C(f,g)<2^(−N)ε/(1+ε)` implies those conditions.
Conversely, bound the geometric tail after N by ε/2 and the finite initial sum by ε/2 using
finitely many compact-sup conditions. Deduce that convergence and the Cauchy property are
exactly uniform convergence and uniform Cauchy convergence on every compact subset of U.
Prove the representative-level equivalence with `TendstoLocallyUniformlyOn` on the open
ambient set Ω, and independence from the exhaustion. For every compact K⊆Ω, restriction
to native `C(K,ℂ)` is uniformly continuous, using cofinality and the same quantitative bound.

The headline `complete_holomorphicMapSpace` asserts completeness for this induced uniformity.
For completeness, the open subtype U is locally compact Hausdorff and therefore compactly
coherent. Native `ContinuousMap.compactConvergenceUniformSpace` and its completeness theorem
make `C(U,ℂ)` complete. After the metric/uniformity comparison, prove that range ι is closed:
a convergent sequence of its continuous maps yields ambient representatives converging locally
uniformly on Ω, and `TendstoLocallyUniformlyOn.differentiableOn` preserves holomorphy there.
Use the range comparison to lift the limit to H(U). Thus the induced metric on H(U) is
complete. Establish the open-subtype/ambient local-uniform convergence adapter explicitly.

Reuse the native complex-algebra operations and constants on `ContMDiffMap` from
`Mathlib.Geometry.Manifold.Algebra.SmoothFunctions`; prove their continuity for the scoped
compact-convergence topology. Provide continuous point evaluation, restriction to smaller
open sets and compact subsets, and compatibility with the continuous-map and ambient
holomorphic APIs. Open-set restriction uses composition with the native smooth inclusion
(`contMDiff_inclusion`, `ContMDiffMap.comp`); reuse native restriction homomorphisms where
their codomain structure matches. Give the derivative map
and prove its compact-open continuity by the native locally uniform derivative theorem and
Cauchy estimates on compact neighborhoods. These are function-space results independent of
Montel; ConformalMapping L1 consumes this topology for its compactness criterion.

The function-space API is:

- The continuous-map inclusion is injective, identifies its range with ambient holomorphic
  restrictions, and is a uniform embedding with closed image.
- The induced uniformity is complete; the displayed metric induces exactly this uniformity,
  independently of the exhaustion, and compact restrictions are uniformly continuous.
- Pointwise algebra, point evaluation, open restriction and differentiation are continuous;
  the inclusion preserves pointwise multiplication and constants.

**Checks.**

- On U=∅ there is one map; every compact seminorm and the distance are 0.
- On a nonempty U with every exhaustion stage nonempty, constants differing by 1 have
  distance Σₙ≥₁2⁻ⁿ/2=1/2; replacing the comparison metric by an unbounded sup norm is wrong.
- On ℂ the constant functions 1/(n+1) are Cauchy on every compact and tend to the holomorphic
  zero map; their displayed distance to zero is 1/(n+2).
- For t=1, min(1,t)/2=t/(1+t)=1/2≤1, fixing both comparison constants.

The metric, completeness and derivative-continuity targets are Rainer, §11, equation (11.2)
and Exercises 19–20, p. 25 (rainer lines 1313, 1329).
*Needs:* Mathlib analytic maps, compact-convergence uniformity/completeness, compact exhaustions,
open-subtype smoothness and holomorphic local-uniform limits; no Runge or Montel theorem is needed.

### 2.3 Neighborhood-holomorphic restrictions on a compact set

For compact K⊆ℂ, define O(K) as the complex subspace of native `C(K,ℂ)` consisting of
restrictions of functions holomorphic on some open neighborhood of K. Neighborhoods may depend
on the function. Prove the subspace laws by intersecting two neighborhoods, and express Runge
approximation as density of the restriction image of H(Ω) in O(K), with its inherited sup-norm
topology. Distinguish this space from functions merely holomorphic on the interior of K.

Prove by explicit examples that O(K) need not be open or closed in C(K,ℂ). For the closed
unit disk, small nonzero multiples of `conj z` tend to zero in norm but cannot extend
holomorphically across the disk, so O(K) is not open. The polynomial partial sums of
`Σ_(n≥0) z^n/(n+1)^2` converge uniformly on that disk to a continuous function. Its derivative
along the real radius tends to infinity as r→1: use nonnegative derivative coefficients,
their divergent sum at 1, and finite-head lower bounds as r increases to 1. A holomorphic
extension near the closed disk would have bounded derivative near 1, a contradiction.
Thus O(K) is not closed. These are counterexamples to a general open/closed assertion;
for finite K, O(K)=C(K,ℂ) by polynomial interpolation, including empty K.

The neighborhood-restriction API includes complex subspace operations, restriction to smaller
compacts, the continuous restriction from H(Ω), and its dense image under the Runge condition.
The carrier is Rainer, §11, p. 25 (rainer line 1333); the examples are derived using power series.

**Checks.**

- For K=∅, both O(K) and C(K,ℂ) contain exactly one function.
- For K={0,1}, a+(b−a)z realizes arbitrary values (a,b), so O(K)=C(K,ℂ).
- On the closed unit disk, εz̄ has norm |ε| and is not in O(K) for ε≠0, whereas 0 is.
- For Σzⁿ/(n+1)² the uniform coefficient tail tends to 0, but at radius 1 its formal
  derivative sum Σₙ≥₁ n/(n+1)² diverges, excluding a neighborhood extension.

*Needs:* Mathlib continuous-map subspaces, polynomial interpolation and power-series differentiation;
Layer 2.5 for the density conclusion only.

### 2.4 Contour integration and compact-open closure

For finite piecewise-C¹ curves on compact parameter intervals [a,b] with a≤b, prove the integral estimate
`|∫_γ f−∫_γ g| ≤ sup_(trace γ)|f−g| · length(γ)` with `TauCeti.Contour`’s integral and
`length(γ)=∫|γ′|`, under the continuity/integrability hypotheses. Treat a=b as zero length and reverse orientation
by negation, retaining the same length bound. Derive continuity of integration
under uniform convergence on the trace, and the finite-cycle version by summing with the
cycle coefficients. Supply the rectangle/wedge-integral comparison to this contour API.
Also give a disk-Morera proof of compact-open holomorphic closure: rectangle and wedge
integrals pass to uniform limits as interval integrals, giving `IsConservativeOn`; apply
Mathlib’s `Complex.isConservativeOn_and_continuousOn_iff_isDifferentiableOn` directly. The function-space completeness theorem can directly
consume `TendstoLocallyUniformlyOn.differentiableOn`; the contour argument is a reusable
proof route and continuity result, rather than a second holomorphic-limit predicate.

**Checks.**

- A constant path has length 0 and integral 0.
- On the unit circle f−g=1, the integral difference is 0 and the estimate is 0≤2π.
- Reversing a unit circle changes ∫dz/z from 2πi to −2πi, with the same length 2π.

This is the norm estimate for the native interval integral and the native rectangle Morera
criterion, applied with the stated continuity hypotheses.
*Needs:* Tau Ceti piecewise-C¹ integrals and finite cycles; Mathlib Bochner integral norm bounds
and `Complex.isConservativeOn_and_continuousOn_iff_isDifferentiableOn`.

### 2.5 Runge equivalences, pole pushing, and interpolation

Define `IsRungeCompactPair` by openness, compact containment and absence of relatively
compact complementary components. Prove `isRungeCompactPair_iff_approximation`, the universal Runge equivalence: for compact K⊆Ω, the property that every
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
relatively compact component. Specialize to polynomial
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
escape every bounded set, so consume the preparatory primary-product existence/zero-divisor lemma for
their repeated list. For each a∈E_b choose b_a∈ℂ\Ω with
`|a−b_a|<2 dist(a,ℂ\Ω)` and put `w_a(z)=(b_a−a)/(z−b_a)`. On every compact K⊂Ω,
`w_a→0` along the E_b list: a bounded subsequence of E_b can accumulate only at ∂Ω, where
its distance to ℂ\Ω tends to zero, while an unbounded subsequence has |b_a|≥|a|−2 and
|w_a|=O_K(|a|⁻¹). For `p≥0` define `B_p(w)=(1+w) exp(Σ_{k=1}^p (−1)^k w^k/k)`; record the identity
`B_p(w)=E_p(−w)` for the previously defined primary factor, not a second family of factors.
It has one simple zero at w=−1. For |w|≤1, consume the sharp preparatory estimate
`|B_p(w)−1|≤|w|^(p+1)`. Raise it to the prescribed multiplicity and choose p_a by a
diagonal compact exhaustion so the deviations are summable on
each compact. Finite exceptional factors are retained separately. These factors are holomorphic on
Ω (their only possible singularity is at b_a∉Ω), have exactly the prescribed zeros, and the locally uniform
product is nonzero off E; prove exact orders at E and nonvanishing of the tail product. When
Ω=ℂ, use the preparatory product theorem for the whole sequence. Both divisor constructions
consume only earlier preparatory results and GH0; the later full factorization theorem
does not supply a prerequisite to this milestone.

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

*Needs:* Layers 1 and 2, native divisors and analytic orders; Tau Ceti closed periods,
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
`z_(n,j) ∈ Ω∩B(a_j,1/n) \ D_n`, using exactly the `infEDist` distance exhaustion
defined in GH0 (holomorphic functions with compact-open convergence), here renamed D_n. The intersection with
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
*Needs:* Layer 3.1, the metric exhaustion in Layer 2.2, separability of the boundary and the identity theorem.



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
This is Rainer, Theorem 12.1, p. 31 and Theorem 15.6, p. 39 (rainer lines 1603, 2116).

**Checks.**

- Empty singularity data allow f=0; no spurious pole is required.
- At a=0, the principal part 2/z is realized by f=2/z with zero holomorphic remainder.
- The punctured germ exp(1/z) is allowed by the isolated-singularity theorem and excluded
  by finite-pole data; its remainder can again be 0.
- Altering a total meromorphic function at its pole changes no punctured germ: at 0 the
  assigned value can be 7 while the quotient representation agrees away from 0.

*Needs:* Layers 1–3, native Laurent decomposition and local analytic/meromorphic orders,
Runge exhaustion corrections and locally uniform convergence away from the discrete support.



### Examples

The prescribed germs 2/z and exp(1/z) distinguish poles from essential singularities. The subsection Checks fix the detailed conventions.

### Dependencies

Layers 1–3, Laurent decomposition, Runge corrections and holomorphic local-uniform closure.

## Layer 5: full Weierstrass factorization (GH3)

### 5.1 Equal divisors and full factorization

Consume the preparatory primary-product existence and exact-order theorem under its stated
convergence hypotheses.

Supply `exists_entire_exp_mul_of_divisor_eq`, the reusable equal-divisor quotient theorem: if f and F are entire, neither is
identically zero, and their native divisors on ℂ agree, then `f=exp(g) F` for some entire g.
Construct the removable extension q of f/F, prove `f=qF` everywhere and that q never
vanishes, then apply the entire-logarithm theorem. Nontriviality of both functions is
essential: the native divisor of the identically zero function is zero and cannot
distinguish it from a nonvanishing entire function. This theorem applies in particular
to the genus-one product and the original function with the same divisor.

The headline `entire_weierstrass_factorization` states: for every nonzero entire f with zero order m at 0 and nonzero zeros listed with multiplicity,
prove `f(z)=z^m exp(g(z)) ∏ E_{p_n}(z/a_n)` for an admissible sequence p_n and entire g. Prove
that the zero-free quotient extends through its removable singularities, then consume the native
contour primitive-to-logarithm API on ℂ to obtain its entire logarithm and exponential factor. State nonuniqueness under
choice of p_n; for a fixed product and fixed f, two possible logarithms g differ by
2πik with k∈ℤ, constant on ℂ. The product and factorization theorems allow a variable sequence of primary-factor
genera and impose no finite-order hypothesis on the entire function.

The factorization API includes exact multiplicities, normalization of the primary product,
removable quotient extension and the ambiguity 2πik of the entire logarithm for a fixed product.
The full factorization is Rainer, Remark 15.4, p. 38 (rainer lines 2030, 2050); equal-divisor
factorization is the same removable-quotient argument with an arbitrary entire product.

**Checks.**

- For f=z, m=1, the nonzero-zero index is empty, P=1 and g=0 give z=z·1·1.
- For f=(z−1)², choose p=0, P=(1−z)² and g=0; the power is 2, not 1.
- For f=exp(z), m=0, P=1 and g=z; the empty zero set does not force f to be constant.
- For f=0 and F=1, both native divisors are zero but exp(g)·1 cannot vanish;
  this explains both nontriviality hypotheses in the equal-divisor theorem.

*Needs:* Layer 1 primary products, native isolated zeros and analytic orders, removable
singularities, and the supplier's entire logarithm (implemented by the Tau Ceti contour API).



### Examples

The cases z, (z−1)² and exp(z) separate the origin order, repeated zeros and zero-free exponential factor. The subsection Checks fix the detailed conventions.

### Dependencies

Layer 1 exact products, local order/removable singularity APIs and the entire logarithm supplier.

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
*Needs:* Layers 1 and 5, native sine/cosine identities, cotangent series, Gamma sequence and
harmonic-logarithmic limit, with the specified nonzero denominators.

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
For `Λ=ℤ+iℤ`, this has simple zero set all of `Λ`, including zero. Each shell has `4N` points and `|n+im|≥N/√2`. On `|z|≤R`, the sharp preparatory estimate `|E₂(w)−1|≤|w|³` for `|w|≤1` bounds each sufficiently large shell's total deviation by `4N(√2R/N)^3`. The shell bounds are summable, so the product converges compact-uniformly and independently of ordering. Consume the preparatory estimate `|1−E_p(w)|≤|w|^{p+1}` for `|w|≤1` and the proved
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
All are derived from Layer 1's product theorem (Rainer, Theorem 14.3, pp. 35–36,
rainer line 1868) and the explicit estimates above.

**Checks.**

- For r=1/2, the theta shift factor at z=0 is 2; the finite reindexing ratio tends to 2,
  fixing the inverse power r⁻¹ and the sign of z.
- The Manhattan shell N=1 has 4 points of norm 1; its four reciprocal cubes sum to 4,
  below the displayed bound 8√2. The shell N=2 has 8 points.
- For aₙ=2ⁿ the deviation tail from N is R·2¹⁻ᴺ; at R=1,N=2 it is 1/2.
- In the ratio example b₁=1 and a₁=2, the factor has a genuine pole at 1; cancellation
  would require m²=2n², which has no positive integer solutions.

*Needs:* Layers 1 and 5, native sine/hyperbolic identities, lattice shell counts and compact
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

Apply GH0’s compact-support Cauchy/Pompeiu identity, uniform Riemann-sum lemma,
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
DifferentialGeometry 5.6.3's finite integer-weighted-cycle Green identity to the two real forms
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
to `−2i∂_zF`. Specialize DG5.6.3 to the positive unit-circle cycle (index one on the open disk)
to obtain
`∮_{|z|=1}F dz̄=−2i∫_{|z|<1}∂_zF dA`. For `m,n∈ℕ` and
`F=z^(m+1)z̄^n/(m+1)`, this recovers the GH5 disk moment identity. This cross-check belongs
to GH4 because it consumes DG5.6.3; the GH5 target itself uses polar area integration only.

The region-boundary adapter must prove the Jordan separation/orientation-to-winding facts and hole
cancellation, then identify the geometric boundary with `trace(C_Δ)`; it must not assume a graph-cell
decomposition. Consume DG 5.6.3 for local fields on an open set and finite integer-weighted AC
cycles; its full target specializes to native `TauCeti.Contour.Cycle` and imposes no nonzero-speed or
finite-cell-division hypothesis. Use the local `Cycle.integral` real/imaginary-coordinate comparison above with that AC-cycle theorem. GH0 and GH5’s scalar solver remain independent of the DG Green theorem and
ConformalMapping; GH5’s form consequences consume DG0–DG1 and DG6 as stated below. GH4 consumes
DG 5.6.3 and ConformalMapping L5 for Jordan separation. DG has no reverse dependency on GH,
and there is no CKG edge for this boundary formula.

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
p. 23 (rainer line 1216); the finite-cycle generalization uses DifferentialGeometry §5.6.3.

**Checks.**

- On the unit disk with f=1 and ξ=0, the boundary term is (2πi)⁻¹·2πi=1 and the area term is 0.
- With f(z)=z̄ and ξ=0, the boundary integral and the odd area integral ∫1/z are both 0.
- With f(z)=|z|² and ξ=0, the boundary term is 1 and π⁻¹∫1 dA=1, giving 0=1−1;
  reversing the area sign would give 2.
- On 1<|z|<2 the index at the hole center is 1−1=0, while the index at 3/2 is 1−0=1.
- For the point-normalized polynomials with n=1, the bound is (1/2)/(1−1/2)=1;
  the denominator is bounded below by 1/2, not merely assumed nonzero.

*Needs:* DifferentialGeometry §5.6.3; ConformalMapping L5 for Jordan separation only;
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

*Needs:* Layers 1, 3 and 5, the native paired cotangent formula and local meromorphic orders.
These are the explicit local-pole calculations for the preceding examples.



### Examples

On the unit disk the |z|² Cauchy–Pompeiu identity at zero is 0=1−1; clockwise holes subtract their index. The subsection Checks fix the detailed conventions.

### Dependencies

Layers 0–5 as used by each example; DifferentialGeometry §5.6.3 and ConformalMapping L5 only for the boundary formula.

## Layer 7: global smooth ∂̄ solvability and Cousin I (GH5)

### 7.1 Global smooth solvability and closed completion

Prove the global one-variable inhomogeneous Cauchy–Riemann theorem. In `exists_smooth_barDerivative_eq`, for every open `Ω⊆ℂ` and every `f∈C^∞(Ω)`,
construct `g∈C^∞(Ω)` with `∂̄g=f`; no simple connectivity is assumed. Use `ContDiffOn ℝ ∞` for smoothness, with `open scoped ContDiff`; native `⊤`
in this order type denotes analytic order `ω`, so it does not express the smooth
compact-support input. Consume the preparatory Wirtinger operators, real-differentiability
criterion and normalized compact-support operator. The proof route is a global one-variable
shell construction:

1. Consume the GH0 compact-support Cauchy–Green formula and its uniform Riemann-sum estimate.
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
obtaining `∂̄g=∂_z f`, and prove
`dω=(∂_z f−∂̄g) dz∧dz̄=0` on the differential-form carrier below.
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
`ContDiffOn ℝ ∞ u (U : Set ℂ) ↔ ContMDiff I I ∞ (fun z : M => u z)`, using the native
open-subtype smoothness API, and the same comparison for real-valued functions with the
target model `𝓘(ℝ, ℝ)`. Throughout, `d v` for a smooth coefficient function `v` with values
in ℝ or in ℂ means `mextDeriv (RoughForm.ofFunction I v)` on DG0.3's carrier. Prove that the
degree-zero form of a smooth function on `M` is a smooth form in DG0.3's sense, by its
chartwise definition; DG1.3 then supplies the smoothness of `d v`, and DG1.1's
`mextDeriv_ofFunction` evaluates `d v` as `mfderiv`.

Define the real coordinate differentials `dx = d(Re ∘ ι)` and `dy = d(Im ∘ ι)`, real-valued
one-forms, and the complex coordinate differentials `dz = d ι` and `dz̄ = d(conj ∘ ι)`,
complex-valued one-forms, where `conj` is `starRingEnd ℂ`. These are exterior derivatives
of smooth coordinate functions, so `d(dx)=d(dy)=d(dz)=d(dz̄)=0` by DG1.3's
`mextDeriv_mextDeriv`. A product of a smooth coefficient function with a form means the
paired wedge `RoughForm.wedgeWith` of its degree-zero form with that form, with pairing the
continuous real-bilinear multiplication of ℝ for real coefficients and of ℂ for complex
coefficients; `dx∧dy` and `dz∧dz̄` are the paired wedges with the same pairings. No
coefficient space is changed anywhere: a real-valued form is never regarded as
complex-valued, and no postcomposition of a form by a linear map is used.

For smooth `u : M → ℂ`, define its real coordinate derivatives by evaluating `mfderiv`
on `e_z 1` and `e_z i`. Put `∂z u=(∂x u−i*∂y u)/2` and `∂barz u=(∂x u+i*∂y u)/2`, and prove
`du=(∂z u) dz+(∂barz u) dbarz` as an identity of complex-valued one-forms: both sides are
the real-linear map `v ↦ ∂x u·Re v+∂y u·Im v` at every tangent vector. For ambient
smooth-on-`U` functions, prove these derivatives of the restriction agree with the ambient
derivatives used by GH5, including `barDerivative`. By DG0.1's determinant wedge evaluation,
`dz∧dz̄` takes the value `1·(−i)−i·1=−2i` on `(e_z 1,e_z i)`, and `dx∧dy` takes the value
`1·1−0·0=1` there. A real-alternating two-form on the two-dimensional real space ℂ is
determined by its value on the pair `(1,i)`, so every smooth complex-valued two-form `η`
has the unique form `η=h dz∧dbarz` with `h(z)=η_z(e_z 1,e_z i)/(−2i)`, and every smooth
real-valued two-form `η` has the unique form `η=h dx∧dy` with `h(z)=η_z(e_z 1,e_z i)`; prove
`h` smooth in both cases. Extend `h` by zero off `U`; the restriction comparison gives an
ambient function smooth on `U`.

For the complex case, apply GH5 to `h`, obtaining `u` with `∂barz u=h`, restrict to `M`, and
use DG1.4's `mextDeriv_wedgeWith` Leibniz rule with `d(dz)=0` to obtain
`d(−u dz)=−du∧dz=(∂barz u) dz∧dbarz=η`, since `dz∧dz=0`. For the real case, apply GH5 to
the datum `h/2`, obtaining `u` with `∂barz u=h/2`, and set `β=(Im u) dx+(Re u) dy`, a
real-valued one-form with the real smooth coefficients `Re ∘ u` and `Im ∘ u`. The real
Leibniz rule with `d(dx)=d(dy)=0` gives `dβ=((Re u)_x−(Im u)_y) dx∧dy=2 Re(∂barz u) dx∧dy=η`.
Thus every smooth real-valued two-form on `M` is exact and the real degree-two de Rham
quotient vanishes. CKG K5a consumes the complex exactness on this same open-subtype carrier
and owns its complex-coefficient quotient comparison, including `H²_dR(U;ℂ)=0`.

The coordinate-form API includes the tangent trivialization, the ambient/restricted
smoothness comparison for real and complex values, smoothness of degree-zero forms, dx, dy,
dz and dz̄ as exterior derivatives of coordinate functions with their evaluations and
vanishing exterior derivatives, the decomposition of du, unique coefficient extraction for
real and complex two-forms, and real and complex exactness. These are direct consequences
of the supplied exterior derivative, Leibniz rule and determinant wedge convention together
with Layer 7.1, not an additional generic form carrier or a generic operation on forms.

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

*Needs:* Layers 7.1 and 0.1; DifferentialGeometry §§0.1, 0.3–0.4, 1.1, 1.3–1.4 and
6.1–6.2; native open-subtype tangent and smoothness comparisons, `Complex.reCLM`,
`Complex.imCLM` and `starRingEnd ℂ`.

### 7.3 Coordinate worked examples

 Keep these scalar computations in GH5; the disk moment is
proved by polar area integration and has no DG or CKG dependency. On all of `ℂ`, prove
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
cover. For the de Rham consequence consume DG Layer 6.1–6.2's real smooth de Rham complex and quotient
carrier. Layer 7.2 gives exactness for every complex-valued and every real-valued smooth
two-form on the open subtype. CKG K5a consumes the complex exactness
statement and proves its own complex de Rham comparison on the generic form carrier. The open plane
domain is Hausdorff and paracompact. This uses no singular/de Rham comparison or fundamental class.

The Cousin API permits arbitrary index types and open covers, with the convention
cᵢⱼ=bᵢ−bⱼ; only the subordinate partition's supports need be locally finite. A refinement
restricts the solution, and the difference of two solutions glues to a global holomorphic function.
This is Rainer, Proposition 12.3 and Theorem 12.4, p. 32 (rainer lines 1658, 1689).
The degree-two de Rham vanishing is the quotient consequence of Layer 7.2's exactness.

**Checks.**

- For a two-set cover with c₁₂=1 and c₂₁=−1, choose b₁=1,b₂=0; the differences are 1 and −1.
- On a one-set cover the triple equation is 3c₁₁=0, forcing c₁₁=0; b₁=0 works.
- For the empty cover of the empty domain, all intersection equations are vacuous.
- Countably many copies Uᵢ=Ω form a non-locally-finite cover when Ω≠∅, but the zero cocycle
  still has bᵢ=0; local finiteness of the cover is not a necessary hypothesis.

*Needs:* Layer 7.1, native subordinate smooth partitions with locally finite supports,
restriction/gluing of smooth functions and the homogeneous CR criterion. The de Rham
conclusion additionally uses Layer 7.2 and DifferentialGeometry §6.1's quotient.

### Examples

The constant two-set cocycle has coboundary (1,0), and d((x dy−y dx)/2)=dx∧dy. The subsection Checks fix the detailed conventions.

### Dependencies

Layers 0 and 2 for the scalar solver; DifferentialGeometry Layers 0–1 and 6.1–6.2 for form consequences. ComplexKahlerGeometry is a consumer only.

## Downstream consumers

ComplexKahlerGeometry K2 consumes GH0's compact-support transform, finite-rank Runge
operators and planar exhaustion for its parameter solver; K5a consumes GH5.1's complex
two-form exactness for its complex de Rham comparison. Hyperfunctions HF2 uses the
one-variable input through those analytic layers. ConformalMapping's compact-open
applications can use Layer 2's holomorphic function space; its L5 boundary topology is
an independent input only to Layer 6. ZerosOfLFunctions remains an earlier supplier.

## References

- Armin Rainer, *Advanced Complex Analysis*, 112-page institutional version hosted in 2025,
  based on the Vienna 2016–2017 course. [Legal institutional text](https://www.tuwien.at/mg/arainer/wp-content/uploads/2025/03/advanced-complex-analysis.pdf).
  Proposition 10.1 and Theorems 10.2–10.3, pp. 23–24; §11, equation (11.2), Exercises 19–20,
  Theorem 11.1, Lemma 11.3 and Theorem 11.7, pp. 25–29; Theorems 12.1–12.4,
  pp. 31–32; Propositions 14.1–14.2 and Theorem 14.3, pp. 34–36;
  Proposition 15.2, Theorem 15.3, Remark 15.4 and Theorems 15.5–15.6, pp. 36–39.
  Locators use printed pages, not PDF page numbers; rainer lines 1189–2130.
- J. D. Gray and S. A. Morris, *When Is a Function That Satisfies the Cauchy–Riemann
  Equations Analytic?*, American Mathematical Monthly 85 (1978), 246–256.
  [Legal author copy](https://www.sidneymorris.net/Morris51.pdf).
  Theorem 3, p. 247; Appendix, Lemma 1 and proof, pp. 252–254;
  gray-morris lines 66 and 310–396. The local Baire and balanced-rectangle details in
  Layer 0 specify the hypotheses used in transporting this proof.
