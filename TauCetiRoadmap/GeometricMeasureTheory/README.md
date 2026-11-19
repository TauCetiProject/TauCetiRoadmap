# Roadmap: geometric measure theory — rectifiability, BV and finite perimeter

**Summary.** This roadmap builds Euclidean geometric measure theory as a reusable library, from the
length of a rectifiable curve to the structure of sets of finite perimeter and the Gauss–Green
formula. Its objects are rectifiable curves; countably rectifiable sets with their approximate
tangent planes; functions of bounded variation (BV) on an open set `Ω`, whose distributional
derivative `Du` is a vector-valued Radon measure; and sets of locally finite perimeter, whose
indicators are locally BV, with their essential boundary, reduced boundary `∂*E` and outer normal
`ν_E`. Every ambient space is a finite-dimensional real inner product space of dimension `n` with
Lebesgue measure, and `Hᵏ` is the `k`-dimensional Hausdorff measure normalized to agree with
Lebesgue measure on `k`-planes.

The headline theorems are these.

- *Coarea.* If `f : ℝⁿ → ℝᵐ` is Lipschitz with `m ≤ n`, `A` is Lebesgue measurable and `g ≥ 0` is
  measurable, then integrating over `y ∈ ℝᵐ` the integral of `g` over the fibre `A ∩ f⁻¹(y)` against
  `Hⁿ⁻ᵐ` gives `∫_A g J f`, where `J f = √det(Df Dfᵀ)`; the derivative need not be surjective.
- *De Giorgi and Federer.* If `E` has locally finite perimeter in `Ω`, then `∂*E` is countably
  `(n − 1)`-rectifiable, the blow-ups of `E` at every point of `∂*E` converge to the half-space
  bounded by the outer normal, the perimeter measure `|Dχ_E|` is `Hⁿ⁻¹` restricted to `∂*E`, and the
  essential boundary differs from `∂*E` by an `Hⁿ⁻¹`-null set. For every Lebesgue-measurable `E`, the
  perimeter of `E` in `Ω` is at most `Hⁿ⁻¹` of its essential boundary in `Ω`, hence of its
  topological boundary.
- *Gauss–Green and traces.* If `E` has locally finite perimeter in `Ω` and `φ` is a `C¹` vector field
  with compact support in `Ω`, then `∫_E div φ = ∫_{∂*E} ⟪φ, ν_E⟫ dHⁿ⁻¹`. Every BV function on a
  bounded Lipschitz domain has an `Hⁿ⁻¹`-integrable boundary trace, the approximate limit of the
  function from inside, and integration by parts against compactly supported `C¹` fields holds with
  a trace term.
- *Jordan curves.* If `C` is a Jordan curve in the plane with `H¹(C) < ∞`, the bounded component of
  its complement has perimeter `H¹(C)`. An absolutely continuous simple closed parametrization of
  `C` has winding number one sign `σ = ±1` at every point inside and `0` outside, and for a
  unit-speed parametrization `γ` the outer normal at `γ(t)` is `−σ i γ'(t)` for almost every `t`.

The roadmap rests on Tau Ceti's rectifiability and bounded-variation library. [PDE](../PDE/README.md)
supplies the weak derivatives, Lipschitz domains and Sobolev trace that the BV theory extends;
[ConformalMapping](../../Completed/ConformalMapping/README.md) supplies the Jordan curve theorem and
[DifferentialGeometry](../DifferentialGeometry/README.md) the Green identity for absolutely
continuous curves, both used for planar Jordan domains; [Isoperimetry](../Isoperimetry/README.md)
uses the whole roadmap for the sharp isoperimetric inequality.

The layers below are built in order: Layer 1 curves and arclength; Layer 2 tangent planes,
graphs and the coarea formula; Layer 3 the vector-measure derivative and operations on `BV(Ω)`;
Layer 4 strict approximation, compactness and regular levels; Layer 5 the blow-up theorem and
De Giorgi's and Federer's theorems; Layer 6 Gauss–Green, Lipschitz domains, BV traces and Jordan
curves.

## Conventions

1. **Spaces.** The ambient spaces are finite-dimensional real inner product spaces `E`
   (`[NormedAddCommGroup E] [InnerProductSpace ℝ E] [FiniteDimensional ℝ E]` with
   `[MeasurableSpace E] [BorelSpace E]`), with `volume` for Lebesgue measure and `n = finrank ℝ E`;
   `EuclideanSpace ℝ (Fin n)` is one instance. Results transfer between spaces by linear isometry
   equivalences, not by coordinate-specific theories. In dimension two the real inner product
   space `ℂ` is included, with `J v = I * v` the rotation by a quarter turn. Metric curve results
   are stated in the generality their statements permit (metric, pseudometric or normed targets).
   Bounded Lipschitz domains are open sets of `WithLp 2 (ℝ × E)` satisfying
   `Set.IsLipschitzDomainWith`, the boundary-regularity and chart convention of PDE §1.6; their
   dimension is `n = 1 + finrank ℝ E`.
2. **Measurability.** Lebesgue measurability of a set means `NullMeasurableSet E volume`;
   `MeasurableSet` is used for a Borel representative, and results transfer by equality almost
   everywhere. The perimeter theory accommodates every Lebesgue-measurable representative,
   including null modifications of Borel sets. Measurability is stated separately wherever it is
   needed.
3. **Hausdorff measure.** `Hᵏ` is Mathlib's normalized Euclidean Hausdorff measure
   [`MeasureTheory.Measure.euclideanHausdorffMeasure`](https://leanprover-community.github.io/mathlib4_docs/Mathlib/Geometry/Euclidean/Volume/Measure.html#MeasureTheory.Measure.euclideanHausdorffMeasure),
   written `μHE[k]`; on a `k`-dimensional inner product space it is `volume`
   (`InnerProductSpace.euclideanHausdorffMeasure_eq_volume`). Comparisons with Mathlib's raw
   Hausdorff measure `μH[k]` go through `TauCeti.euclideanHausdorffMeasure_eq_smul_hausdorffMeasure`;
   the two normalizations are never exchanged silently. `Hⁿ⁻¹` is `μHE[finrank ℝ E - 1]`, and `H⁰`
   is counting measure.
4. **Curves.** A rectifiable parametrized curve is a continuous map on a compact real interval with
   `BoundedVariationOn`; its length is `eVariationOn`, its cumulative arclength Mathlib's
   `variationOnFromTo`, and its unit-speed reparametrization Mathlib's `naturalParameterization`.
   No new path or length carrier replaces Mathlib's maps, `Path` or total variation. Lengths are
   extended nonnegative first; conversion to real length requires a finiteness theorem.
5. **Rectifiable sets.** A countably `k`-rectifiable set is one covered, up to an `Hᵏ`-null set, by
   countably many Lipschitz images of subsets of `ℝᵏ`: `TauCeti.CountablyRectifiable k s`.
   It is distinct from finite `Hᵏ` measure and from parametrized rectifiability of a curve.
6. **BV functions.** For `u : E → ℝ` and an open `Ω : Opens E`, the total variation `|Du|(Ω)` is
   `TauCeti.totalVariationOn volume Ω u`, the supremum of `∫ u div φ` over smooth
   compactly supported vector fields in `Ω` with pointwise norm at most one. `BV_loc(Ω)` means `u`
   locally integrable on `Ω` with locally finite variation: every compact `K ⊆ Ω` has an open
   neighbourhood `U` with `|Du|(U) < ∞`; it is written as this pair of hypotheses, with no globally
   finite measure assumed. `BV(Ω)` is `TauCeti.MemBV volume Ω u` (integrable on `Ω` with
   `|Du|(Ω) < ∞`), and the normed a.e.-quotient is `TauCeti.BV volume Ω` with norm
   `‖u‖_{L¹(Ω)} + |Du|(Ω)`. The derivative is represented as `Du = σ_u |Du|`, with
   `|Du| = TauCeti.variationMeasure volume Ω u` (a measure on the subtype `Ω`) and
   `σ_u = TauCeti.polarDensity volume Ω u`, through `∫ u div φ = −∫ ⟪φ, σ_u⟫ d|Du|`. Variation and
   derivative are invariant under equality a.e. on `Ω`. Composition results give the correct BV
   identity or a variation inequality; the classical chain rule is never applied across jumps.
7. **Perimeter.** The perimeter of a set `s` in `Ω` is `TauCeti.perimeter volume Ω s`, the total
   variation of its indicator: extended and defined for every set; for Lebesgue-measurable `s` it is
   the supremum of `∫_s div φ` over the same test fields (`TauCeti.perimeter_eq_iSup`). A set has locally finite perimeter in `Ω` when its
   indicator is in `BV_loc(Ω)`; the perimeter measure is `|Dχ_s|`, whose value on `Ω` is the
   perimeter. Finite perimeter on the whole space means `P(s; ⊤) < ∞` and does not require finite
   volume; membership of the indicator in `BV` requires finite volume as well. Every theorem says
   which of the two it assumes. Complements have the same perimeter.
8. **Boundaries and the normal.** The topological frontier, the essential boundary
   (`TauCeti.essentialBoundary`, the points at which `s` has neither density `0` nor density `1`,
   densities taken over closed balls as in `TauCeti.HasDensityAt`) and the
   reduced boundary (`TauCeti.reducedBoundary`) are distinct; the last two are independent of the
   a.e. representative. The outer normal is `TauCeti.outerNormal`, with the sign
   `Dχ_E = −ν_E |Dχ_E|`, so that `Dχ_E = −ν_E Hⁿ⁻¹⌊∂*E` once Layer 5 identifies the perimeter
   measure.
9. **Jacobians.** The Jacobian of a linear map between inner product spaces is Mathlib's
   [`LinearMap.normDet`](https://leanprover-community.github.io/mathlib4_docs/Mathlib/Analysis/InnerProductSpace/NormDet.html#LinearMap.normDet),
   which is `0` on non-injective maps; the area Jacobian of `f` at `x` is `(fderiv ℝ f x).normDet`
   and the coarea Jacobian is the norm determinant of the adjoint, `(fderiv ℝ f x).adjoint.normDet`.
   No other Jacobian for rectangular linear maps is introduced.
10. **Real-valued forms.** Real-valued statements establish integrability and finiteness before
    using `ENNReal.toReal` or a Bochner integral. Null-set choices, chart choices and
    parametrizations disappear from the final measures and geometric invariants. Every comparison
    stated below is a target in its own right, alongside the named theorems.
11. **The acceptance file.** `Suggested.lean` states, in the namespace
    `TauCetiRoadmap.GeometricMeasureTheory`, the headline theorems of the layers below that are not
    Tau Ceti declarations, together with the predicates `IsApproxTangentPlane` and
    `IsTangentialDifferential` that two of them need.

## Layer 1: rectifiable curves and arclength

This layer completes the comparison of the length of a curve with its derivative. Its inputs are
the arclength factorization, the length formulas for absolutely continuous and `C¹` curves, the
comparison of length with the `H¹` measure of the trace and the Banach indicatrix, all named in the
supplier contracts (Layer 1 group), on Mathlib's `eVariationOn`, `variationOnFromTo` and
`naturalParameterization` (Convention 4).

### 1.1 Metric speed, the derivative and the arclength factorization

Prove that for a finite-dimensional real normed space `V` and `γ : ℝ → V` with
`BoundedVariationOn γ (Icc a b)`, the metric derivative `TauCeti.metricDerivative γ t` equals
`‖deriv γ t‖ₑ` for almost every `t ∈ [a, b]`.

Prove the fundamental theorem of calculus for the arclength factorization. Let `γ` be absolutely
continuous on `[a, b]` with values in `V`, `a ≤ b`, let `s(t) = variationOnFromTo γ (Icc a b) a t` be
its cumulative arclength and `c = naturalParameterization γ (Icc a b) a` its unit-speed
reparametrization, so that `γ = c ∘ s` on `[a, b]`
(`LocallyBoundedVariationOn.naturalParameterization_variationOnFromTo`).
Then `s'(t) = ‖γ'(t)‖` for almost every `t` (`s` is absolutely continuous by
`AbsolutelyContinuousOnInterval.absolutelyContinuousOnInterval_variationOnFromTo`); for almost every `t`
with `γ'(t) ≠ 0`, `c` is differentiable at `s(t)` with `‖c'(s(t))‖ = 1` and `γ'(t) = ‖γ'(t)‖ c'(s(t))`;
and `γ(t) − γ(a) = ∫_0^{s(t)} c'` for every `t ∈ [a, b]`. Constant pieces of `γ` are handled by the
factorization: no inverse of `s` is used, since `s` is not injective where `γ` pauses. That a
nonconstant arclength parametrization has speed one almost everywhere is
`HasConstantSpeedOnWith.ae_norm_deriv_eq` applied to `HasUnitSpeedOn`.

*Route.* At points of differentiability the metric derivative is `‖γ'(t)‖ₑ`
(`HasDerivAt.metricDerivative_eq`), and Mathlib's a.e. differentiability of BV maps into
finite-dimensional spaces gives the first statement; the proof of
`AbsolutelyContinuousOnInterval.eVariationOn_eq_lintegral_enorm_deriv` makes this step for absolutely
continuous curves. For the second, `s' ≥ ‖γ'‖` almost everywhere is
`BoundedVariationOn.ae_metricDerivative_le_enorm_deriv_variationOnFromTo` with the first statement,
and equality follows by integrating both sides against the length formula; `c` is
absolutely continuous with speed one by
`BoundedVariationOn.absolutelyContinuousOnInterval_naturalParameterization` and
`BoundedVariationOn.hasUnitSpeedOn_naturalParameterization`, and the chain rule for a monotone
absolutely continuous change of parameter is
`AbsolutelyContinuousOnInterval.ae_hasDerivAt_comp_of_monotoneOn`, which gives
`γ'(t) = s'(t) c'(s(t))` almost everywhere; the set of `t` with `s'(t) > 0`
and `s(t)` a non-differentiability point of `c` is null because the image under `s` of
`s'(t) dt` on `[a, b]` is Lebesgue measure on `[0, s(b)]`
(`AbsolutelyContinuousOnInterval.map_withDensity_deriv_of_monotoneOn`). The
integral identity is `AbsolutelyContinuousOnInterval.integral_deriv_eq_sub_of_finiteDimensional`
for `c`. *Needs:* Mathlib `BoundedVariationOn.ae_differentiableAt_of_mem_uIcc`, `variationOnFromTo`,
`naturalParameterization`, `HasUnitSpeedOn`; Tau Ceti `TauCeti.metricDerivative`,
`HasDerivAt.metricDerivative_eq`, `LocallyBoundedVariationOn.naturalParameterization_variationOnFromTo`,
`HasConstantSpeedOnWith.ae_norm_deriv_eq`, `AbsolutelyContinuousOnInterval.eVariationOn_eq_lintegral_enorm_deriv`,
and the declarations named in the route.

**Checks.**
- Let `C` be the Cantor–Lebesgue function and `φ(t) = (t + C(t))/2`, a strictly increasing
  continuous map of `[0, 1]` onto itself that is not absolutely continuous (`φ' = 1/2` almost
  everywhere while `φ(1) − φ(0) = 1`). The curve `γ(t) = exp(2πi φ(t))` is closed, injective on
  `[0, 1)`, and has length `2π`, since variation is invariant under monotone reparametrization.
  Almost everywhere `‖γ'(t)‖ = 2π φ'(t) = π`, so `∫_0^1 ‖γ'‖ = π ≠ 2π`: the first statement holds for
  this BV curve, while the length formula and the factorization identities need absolute
  continuity.
- `γ : [0, 3] → ℝ` equal to `t` on `[0, 1]`, to `1` on `[1, 2]` and to `t − 1` on `[2, 3]` has length
  `2`; since `γ` is nondecreasing, `s = γ` and `c(ℓ) = ℓ` on `[0, 2]`. The arclength `s` is constant
  on `[1, 2]`, so a definition of the arclength parametrization as `γ ∘ s⁻¹` is not available, while
  `γ = c ∘ s` holds; on `(1, 2)`, `γ' = 0 = s'` and the factorization identities say nothing about
  `c'`.

### Examples

- The circle traversed twice, `t ↦ exp(it)` on `[0, 4π]`, has fibre multiplicity
  `#{t ∈ [0, 4π] | exp(it) = z}` equal to `2` at every point `z` of the unit circle other than `1`
  (`TauCeti.encard_Icc_zero_four_pi_inter_preimage_circleMap`) and `3` at `z = 1`, so the Banach
  indicatrix `ContinuousOn.eVariationOn_eq_lintegral_encard` gives it length twice the `H¹` measure of
  its trace (`TauCeti.eVariationOn_circleMap_Icc_zero_four_pi`), that is `4π` by
  `Complex.euclideanHausdorffMeasure_sphere`; the trace measure is that of the circle traversed once.
- Prove that the curve `γ(t) = exp(2πi φ(t))` of the first Check has cumulative arclength
  `s(t) = 2π φ(t)`, so that its arclength parametrization is `θ ↦ exp(iθ)` on `[0, 2π]`; Layer 6
  recovers the perimeter and the area of its inside through this parametrization.

### Dependencies

Mathlib's variation, constant-speed and absolutely continuous APIs and the supplier contracts of the
Layer 1 group; no other layer.

## Layer 2: rectifiability, area and coarea

This layer gives countably rectifiable sets their tangent structure and completes the area and
coarea formulas: approximate tangent planes and the density theorem, graphs in every codimension,
tangential differentiation with the tangential area formula, and the coarea formula for every
Lipschitz map. It uses countable rectifiability with its closure and transport API, the area formula
for Lipschitz maps with weights and extended multiplicity, sphere measure, polar integration, slicing,
and the coarea formulas for linear maps and for maps with surjective derivative, all named in the
supplier contracts (Layer 2 group). The differentiability, covering, measurability and approximation
lemmas these targets need are targets of this layer, using Mathlib's Rademacher theorem rather than
presuming nonlinear area or coarea.

### 2.1 Approximate tangent planes and the density theorem

Define `IsApproxTangentPlane k M x P`: the subspace `P` is the approximate tangent plane of `M ⊆ E`
at `x` in dimension `k` with multiplicity one when, for every continuous compactly supported
`φ : E → ℝ`, `r⁻ᵏ ∫_M φ((y − x)/r) dHᵏ(y) → ∫_P φ dHᵏ` as `r → 0⁺` (Simon 1983, Definition 11.2,
p. 60). Prove
`ae_existsUnique_isApproxTangentPlane`: if `M` is countably `k`-rectifiable, `Hᵏ`-measurable and
`Hᵏ(M ∩ K) < ∞` for every compact `K`, then at `Hᵏ`-almost every `x ∈ M` exactly one `k`-dimensional
subspace is the approximate tangent plane of `M` at `x` (Simon 1983, Theorem 11.6 with Remark 11.5,
p. 61).

- *Uniqueness.* For every `M` and `x`, at most one `k`-dimensional subspace satisfies the predicate.
- *Density theorem.* Under the same hypotheses, `Hᵏ(M ∩ closedBall x r) / (ω_k rᵏ) → 1` as `r → 0⁺`
  for `Hᵏ`-almost every `x ∈ M`, where `ω_k` is the volume of the unit ball of `ℝᵏ`.
- *Measurability.* There is a Borel measurable map `x ↦ P_x` into the orthogonal projections of `E`
  such that `P_x` projects onto the approximate tangent plane of `M` at `x` for `Hᵏ`-almost every
  `x ∈ M`.
- *Locality and null modifications.* If `M =ᵐ M'` for `Hᵏ`, the predicate holds for `M` and `M'` at
  the same points; if `M ⊆ M'` with both satisfying the hypotheses, their tangent planes agree at
  `Hᵏ`-almost every point of `M`.
- *Transport.* For a linear isometry equivalence `e`, `P` is the approximate tangent plane of `M` at
  `x` if and only if `e(P)` is that of `e(M)` at `e(x)`.

*Route.* `TauCeti.CountablyRectifiable.exists_bilipschitz_cover` covers `M` up to a null set by
bi-Lipschitz images of Borel sets; at a density point of one piece where its chart is
differentiable with injective derivative (Rademacher), the blow-up is the image of the derivative,
and the other pieces have density zero there by `TauCeti.ae_tendsto_euclideanHausdorffMeasure_inter_closedBall_div`.
*Needs:* Tau Ceti `TauCeti.CountablyRectifiable`, `TauCeti.CountablyRectifiable.exists_bilipschitz_cover`,
`TauCeti.ae_tendsto_euclideanHausdorffMeasure_inter_closedBall_div`,
`MeasureTheory.Measure.mul_euclideanHausdorffMeasure_le_measure`,
`LipschitzWith.lintegral_image_eq_lintegral_normDet_fderiv_mul`; Mathlib `LipschitzWith.ae_differentiableAt`,
`LipschitzOnWith.extend_finite_dimension` (the charts are Lipschitz on their pieces and are extended
to the whole space before Rademacher's theorem and the area formula apply).

**Checks.**
- If `M = P` is a `k`-dimensional subspace, then `r⁻ᵏ ∫_P φ((y − x)/r) dHᵏ(y) = ∫_P φ dHᵏ` for every `r > 0` and
  `x ∈ P`, by the scaling `Hᵏ(rA) = rᵏ Hᵏ(A)`; a normalization by `r^{1−k}` would give the limit `0`.
- `M` the union of the two coordinate axes in `ℝ²`, `k = 1`: at the origin the blow-ups of `H¹⌊M` are
  `H¹⌊M` itself, which is not `H¹` on any line, so there is no approximate tangent line there; at
  every other point of `M` the tangent line is the axis through it. The theorem is an almost
  everywhere statement and could not hold at every point.
- For the circle of radius `ρ` in `ℝ²` and `x` on it, the arc within distance `r` of `x` has length
  `4ρ arcsin(r/(2ρ))`, and `4ρ arcsin(r/(2ρ)) / (2r) → 1`; dividing by `r` instead of `ω_1 r = 2r`
  would give `2`.

### 2.2 Graphs in every codimension

Prove that for finite-dimensional real inner product spaces `E`, `F` and a linear map `A : E → F`,
the graph map `v ↦ (v, A v)` into `WithLp 2 (E × F)` has norm determinant `√det(I + A* A)`.
Consequently, for a Lipschitz `φ : E → F` with graph map `G(x) = (x, φ(x))` and every measurable
`s ⊆ E`, `H^{dim E}(G(s)) = ∫_s √det(I + Dφ(x)* Dφ(x)) dx`: `G` is Lipschitz and injective, so
`LipschitzWith.lintegral_normDet_fderiv_eq_euclideanHausdorffMeasure_image` gives `H^{dim E}(G(s))`
as the integral of `(fderiv ℝ G x).normDet`, which the linear identity evaluates. Prove the same for
`φ` locally Lipschitz on an open `U` and measurable `s ⊆ U`. Prove that at every point `x` where
`φ` is differentiable and which is a Lebesgue point of `Dφ`, so at almost every point, and at every
point when `φ` is `C¹`, the graph of `Dφ(x)` is the approximate tangent plane of `G(E)` at `G(x)` (§2.1).
For `F = ℝ`, after the isometry exchanging the two factors, the integrand is `√(1 + ‖∇φ‖²)`
(`ContinuousLinearMap.normDet_normalGraphL`), and on a measurable set of points of differentiability
the formula is `TauCeti.euclideanHausdorffMeasure_normalGraphEmbedding_image_eq_lintegral_sqrt_one_add_norm_fderiv_sq`;
the target covers Lipschitz `φ` into every `F`; the `C¹` case with `F = ℝ` is Simon 1983, 8.6(3),
p. 48. *Needs:* §2.1; Tau Ceti
`LipschitzWith.lintegral_normDet_fderiv_eq_euclideanHausdorffMeasure_image`, `LinearMap.normDet_coprod_of_orthogonal`,
`LinearMap.det_one_add_comp_comm`; Mathlib `LinearMap.normDet`, `LinearMap.normDet_sq_eq_det_gram`,
`LipschitzWith.ae_differentiableAt`.

**Checks.**
- The graph of the identity of `ℝ²` is the plane `{(x, x)}` in `ℝ⁴`; `x ↦ (x, x)` scales lengths by `√2`
  and areas by `2 = √det(2I)`, whereas the codimension-one factor `√(1 + ‖A‖²)` with the operator norm
  would give `√2`.

### 2.3 Tangential differentiation and the tangential area formula

Let `M` satisfy the hypotheses of §2.1, `F` be a finite-dimensional real inner product space and
`f : E → F` be Lipschitz. Define `IsTangentialDifferential k M f x P L`, for a subspace `P` of `E`
with orthogonal projection `π_P` and a linear map `L : P → F`: for every `ε > 0`, the set of `y ∈ M`
with `‖f(y) − f(x) − L(π_P(y − x))‖ > ε ‖y − x‖` has `Hᵏ`-density zero at `x`, that is `Hᵏ` of its
intersection with `closedBall x r` is `o(rᵏ)` as `r → 0⁺`. When `P` is the approximate tangent plane
`T_xM` of `M` at `x` (§2.1), such an `L` is the tangential differential of `f` along `M` at `x`.
Prove that for `Hᵏ`-almost every `x ∈ M` the tangential differential exists and is unique; that it is
unchanged by null modifications of `M`; that it is compatible with charts: for a Lipschitz
`h : ℝᵏ → E` and a Borel `A ⊆ ℝᵏ` on which `h` is injective with `h(A) ⊆ M`, at almost every `a ∈ A`
at which `h` and `f ∘ h` are differentiable and `Dh(a)` is injective, `Dh(a)` maps `ℝᵏ` onto
`T_{h(a)}M` and the tangential differential at `h(a)` composed with `Dh(a)` is `D(f ∘ h)(a)`, so it
does not depend on the chart used to compute it; and that it is the restriction of `Df(x)` to `T_xM`
wherever `f` is differentiable at `x`. With the tangential Jacobian `J^M f(x)`, the norm
determinant of the tangential differential on `T_xM`, prove the tangential area formula
`lintegral_normDet_mul_eq_lintegral_tsum_of_isTangentialDifferential`: if, for `Hᵏ`-almost every
`x ∈ M`, `P x` is a `k`-dimensional subspace that is the approximate tangent plane of `M` at `x` and
`L x : P x → F` satisfies `IsTangentialDifferential k M f x (P x) (L x)`, then for measurable
`g : E → [0, ∞]`, `∫_M g J dHᵏ = ∫_F Σ_{x ∈ M ∩ f⁻¹(y)} g(x) dHᵏ(y)`, where `J(x)` is the norm
determinant of `L x` and the fibre sum is taken in `[0, ∞]`, the integral of `g` against counting
measure on the fibre (Simon 1983, 12.1–12.5, pp. 67–69). By the uniqueness statements of §2.1 and of
this section, `J = J^M f` almost everywhere on `M`. On a `C¹` graph (§2.2) the tangential
differential and Jacobian are the classical ones. *Needs:* §2.1, §2.2; Tau Ceti
`LipschitzWith.lintegral_normDet_fderiv_mul_eq_lintegral_tsum`, `TauCeti.CountablyRectifiable.exists_bilipschitz_cover`;
Mathlib `LipschitzWith.ae_differentiableAt`.

**Checks.**
- `M` the unit circle in `ℝ²`, `k = 1`, `f(x, y) = x`: the tangential Jacobian at `(cos θ, sin θ)` is
  `|sin θ|`, and `∫_M |sin θ| dθ = 4`, which equals `∫_{−1}^{1} #(M ∩ f⁻¹(t)) dt = 2 · 2`. Using the
  full derivative `Df = (1, 0)` instead, its norm determinant `0` (a non-injective map `ℝ² → ℝ`) gives
  `0` and its norm `1` gives `2π`.
- For `M` a `k`-dimensional subspace and `f` linear, the tangential differential is the restriction
  of `f` to `M` and the formula is `LinearMap.euclideanHausdorffMeasure_image_eq_normDet_mul_volume`
  for that restriction when it is injective.
- `M = ℝ × ℤ` in `ℝ²`, `k = 1`, `f(t, m) = t` and `g(t, m) = 2^{−|m|}` for `t ∈ [0, 1]`, `0` otherwise:
  `J = 1`, the left side is `Σ_{m ∈ ℤ} 2^{−|m|} = 3`, and every fibre over `[0, 1]` has sum `3`, so the
  right side is `3`. A fibre sum set to `∞` whenever infinitely many terms are positive would give `∞`.

### 2.4 The coarea formula for Lipschitz maps

Prove `lintegral_setLIntegral_inter_preimage_eq_setLIntegral_mul_normDet_adjoint`: for
finite-dimensional real inner product spaces `E`, `F` with `dim F ≤ dim E`, a Lipschitz `f : E → F`,
a Lebesgue-measurable `s ⊆ E` and a measurable `g : E → [0, ∞]`,
`∫_F ∫_{s ∩ f⁻¹(y)} g dH^{dim E − dim F} dy = ∫_s g(x) J f(x) dx`, with the coarea Jacobian
`J f(x) = (fderiv ℝ f x).adjoint.normDet` and no surjectivity of the derivative assumed (Simon 1983,
12.6–12.7, pp. 69–70, for `dim F < dim E`; for `dim F = dim E` it is the area formula, as the second
Check below says).

- *Fibre measurability.* The function `y ↦ ∫_{s ∩ f⁻¹(y)} g dH^{dim E − dim F}` is a.e.-measurable.
- *Fibres.* For almost every `y`, `s ∩ f⁻¹(y)` is countably `(dim E − dim F)`-rectifiable (Simon
  1983, 12.8(2), p. 70) and meets every compact set in finite `H^{dim E − dim F}` measure.
- *Exceptional set.* The set where `J f = 0`, the points where `f` is not differentiable included,
  meets almost every fibre in an `H^{dim E − dim F}`-null set. For the non-differentiability points,
  a Lebesgue-null set by Rademacher's theorem, this is Eilenberg's
  `LipschitzOnWith.ae_euclideanHausdorffMeasure_inter_preimage_eq_zero`.
- *Real form.* For `g : E → ℝ` with `g · J f` integrable on `s`, for almost every `y` the function `g`
  is integrable on `s ∩ f⁻¹(y)` for `H^{dim E − dim F}`, the fibre integrals are integrable in `y`,
  and the identity holds with Bochner integrals.
- *Locally Lipschitz form.* The identity holds for `f` locally Lipschitz on an open set containing
  `s`.

*Route.* On the set where the derivative exists and is surjective this is
`MeasureTheory.lintegral_euclideanHausdorffMeasure_inter_preimage_eq_lintegral_normDet_adjoint_fderiv`,
extended to weights by approximation with simple functions; the remaining set is handled by the
exceptional-set statement, proved through the perturbation `(x, z) ↦ f(x) + εz` on `E × F`, whose
derivative is surjective, and Eilenberg's inequality. *Needs:* Tau Ceti
`MeasureTheory.lintegral_euclideanHausdorffMeasure_inter_preimage_eq_lintegral_normDet_adjoint_fderiv`,
`MeasureTheory.ae_euclideanHausdorffMeasure_inter_preimage_eq_zero_of_hasFDerivWithinAt`,
`LipschitzOnWith.ae_euclideanHausdorffMeasure_inter_preimage_eq_zero`,
`LinearMap.lintegral_setLIntegral_preimage_singleton`, `LinearMap.normDet_adjoint_pos_iff`,
`LipschitzOnWith.lintegral_hausdorffMeasure_inter_preimage_le`,
`LipschitzOnWith.ae_euclideanHausdorffMeasure_inter_preimage_lt_top`,
`LipschitzOnWith.aemeasurable_euclideanHausdorffMeasure_inter_preimage`, `TauCeti.CountablyRectifiable`;
Mathlib `LipschitzWith.ae_differentiableAt`, `exists_partition_approximatesLinearOn_of_hasFDerivWithinAt`.

**Checks.**
- `f(x) = ‖x‖` on `ℝⁿ`, `n ≥ 2`, `s` the ball of radius `R`, `g = 1`: `J f = 1` almost everywhere and
  the formula reads `∫_0^R Hⁿ⁻¹(sphere 0 r) dr = ∫_0^R n ω_n r^{n−1} dr = ω_n Rⁿ`, the volume of the
  ball, in agreement with `TauCeti.euclideanHausdorffMeasure_sphere`. The norm determinant of `Df` itself, a
  non-injective map `ℝⁿ → ℝ`, is `0`, so a Jacobian without the adjoint would give `0`.
- For `dim F = dim E` the fibres carry `H⁰`, counting measure, and the formula is the area formula
  with multiplicity.

### Examples

- Prove that the graph of the identity of `ℝ²` over a measurable `s ⊆ ℝ²`, the image of `s` under
  `x ↦ (x, x)`, has `H²` measure `2 |s|`, and that the graph of a Lipschitz `φ : ℝ → ℝ` over `[a, b]`
  has `H¹` measure `∫_a^b √(1 + φ'²)`, as instances of §2.2.
- The volume of a ball is the integral of the measures of the spheres
  (`TauCeti.volume_inter_ball_eq_lintegral_Ioo_euclideanHausdorffMeasure_inter_sphere` with `s` the
  whole space); the first Check of §2.4 is the same identity read through the coarea formula.
- The unit circle has `H¹ = 2π` (`Complex.euclideanHausdorffMeasure_sphere`). With Mathlib's raw
  `μH[2]` the unit sphere of `ℝ³` would have measure `16` instead of `4π`, the factor `ω_2 / 2² = π / 4`
  of Convention 3.

### Dependencies

Layer 1 is not used. The supplier contracts of the Layer 2 group and Mathlib's Rademacher theorem.

## Layer 3: distributional BV and variation measures

This layer completes the distributional BV theory: the derivative `Du` as a vector measure, the
lattice, cutoff, transport and Sobolev operations at the level of `BV(Ω)`, the one-dimensional theory
and the Cantor–Lebesgue function. It uses the total variation, the variation measure, the polar and
Lebesgue decompositions, the normed space `BV(Ω)` with restriction and Lipschitz composition, the
transport of variation, the comparison with weak derivatives and measure-valued integration by parts,
all named in the supplier contracts (Layer 3 group).

### 3.1 The derivative as a vector measure

Prove that for `u` locally integrable on `Ω` with `|Du|(Ω) < ∞`, the set function
`B ↦ ∫_B σ_u d|Du|` on Borel subsets of the subtype `Ω` is an `E`-valued
`MeasureTheory.VectorMeasure`, the derivative `Du` (it is `MeasureTheory.Measure.withDensityᵥ` of
`σ_u` against `|Du|`); that it is the unique `E`-valued vector measure `ν` on `Ω` whose components
`⟪v, ν⟫` satisfy `∫ u ∂_v ψ = −∫ ψ d⟪v, ν⟫` for every `v ∈ E` and every test function `ψ` on `Ω`; and
that its variation in Mathlib's sense, `MeasureTheory.VectorMeasure.variation`, is `|Du|`. For `u` in
`BV_loc(Ω)`, prove the same for each open `U` with compact closure contained in `Ω`, and
compatibility: for `U ≤ U'` the derivative of `u` on `U` is the restriction of that on `U'`. Prove
localization of the polar density: for open `U ≤ Ω`, `σ_u` on `U` agrees `|Du|`-almost everywhere on
`U` with `σ_u` on `Ω`, through the identification `TauCeti.variationMeasure_eq_comap_inclusion` of
the variation measures. *Route.* Existence and the variation identity follow from
`MeasureTheory.Measure.variation_withDensityᵥ` and `‖σ_u‖ = 1` almost everywhere (the representation
by a Radon measure and a density of norm one is Simon 1983, 6.1, p. 35); uniqueness is the
content, through the uniqueness of regular vector measures with the same integrals against
compactly supported continuous functions and the density of test functions among them. *Needs:*
Tau Ceti `TauCeti.variationMeasure`, `TauCeti.polarDensity`,
`TauCeti.integral_divergenceCLM_mul_eq_neg_integral_inner_polarDensity`,
`TauCeti.integral_lineDeriv_mul_eq_neg_integral_mul_inner_polarDensity`,
`TauCeti.ae_norm_polarDensity_eq_one`, `TauCeti.ae_eq_polarDensity`,
`TauCeti.variationMeasure_eq_comap_inclusion`,
`MeasureTheory.VectorMeasure.ext_of_integral_eq_on_compactlySupported`; Mathlib
`MeasureTheory.VectorMeasure`, `MeasureTheory.VectorMeasure.variation`,
`MeasureTheory.Measure.withDensityᵥ`, `MeasureTheory.Measure.variation_withDensityᵥ`.

**Checks.**
- On `ℝ`, `u = 1_{(0,∞)}` has `Du = δ_0` and `σ_u(0) = 1`, since `∫_0^∞ ψ' = −ψ(0)`; `u = 1_{(−∞,0)}` has
  `Du = −δ_0`. A convention with `+∫ ⟪φ, σ_u⟫ d|Du|` would reverse both signs.
- For `u(x) = ⟪a, x⟫` on a bounded open `Ω`, `Du = a · volume` on `Ω` and `|Du|(Ω) = ‖a‖ |Ω|`.

### 3.2 Operations on BV functions and on `BV(Ω)`

- *Lattice.* For `u, v` in `BV(Ω)`, `max(u, v)` and `min(u, v)` are in `BV(Ω)` with
  `|D max(u, v)|(Ω) + |D min(u, v)|(Ω) ≤ |Du|(Ω) + |Dv|(Ω)`, and `BV(Ω)` is a lattice under a.e.
  maximum and minimum. That `|u|` is in `BV(Ω)` with `|D|u||(Ω) ≤ |Du|(Ω)` is `TauCeti.MemBV.comp_lipschitz`
  and `TauCeti.totalVariationOn_comp_lipschitz_le` for the `1`-Lipschitz `t ↦ |t|`.
- *Cutoffs.* For a smooth `χ` with `|χ| ≤ c` and `‖∇χ‖ ≤ c'`, `χ u` is in `BV(Ω)` whenever `u` is, and
  multiplication by `χ` is a bounded linear operator on `BV(Ω)`; the variation bound
  `|D(χu)|(Ω) ≤ c |Du|(Ω) + c' ‖u‖_{L¹(Ω)}` is `TauCeti.totalVariationOn_mul_le` with the gradient
  bound.
- *Transport.* For an affine isometry equivalence `f` and an open `V` with `f(V) = Ω`, `u ↦ u ∘ f` is a
  linear isometric isomorphism `BV(Ω) ≅ BV(V)`. For `r > 0`, `u ↦ u(r ·)` maps `BV(Ω)` onto
  `BV(r⁻¹Ω)` with `‖u(r ·)‖_{L¹(r⁻¹Ω)} = r⁻ⁿ ‖u‖_{L¹(Ω)}` and `|D(u(r ·))|(r⁻¹Ω) = r^{1−n} |Du|(Ω)`.
- *Sobolev functions.* For `u` in `W^{1,1}(Ω)` (`TauCeti.W1p volume Ω 1`), the function `u` is in
  `BV(Ω)`, its variation measure being `‖∇u‖ · volume` on `Ω`
  (`TauCeti.HasWeakFDerivOn.variationMeasure_eq_withDensity`), and `u ↦ u` is a bounded linear
  injection `W^{1,1}(Ω) → BV(Ω)` whose image is the set of `u` in `BV(Ω)` with `|Du|` absolutely
  continuous with respect to Lebesgue measure. The local versions, for `W^{1,1}_loc` and `BV_loc`, are
  `TauCeti.exists_hasWeakFDerivOn_iff` with `TauCeti.HasWeakFDerivOn.variationMeasure_eq_withDensity`.

*Route.* The lattice bound integrates the submodularity of perimeter over the superlevel sets
`{max(u, v) > t} = {u > t} ∪ {v > t}` and `{min(u, v) > t} = {u > t} ∩ {v > t}` through the
scalar coarea formula `TauCeti.totalVariationOn_eq_lintegral_perimeter`. The other items lift the variation-level statements of the supplier
contracts to `BV(Ω)`. *Needs:* Tau Ceti
`TauCeti.perimeter_union_add_perimeter_inter_le`, `TauCeti.totalVariationOn_eq_lintegral_perimeter`,
`TauCeti.totalVariationOn_min_const_add_max_const` (the case of a constant `v`), `TauCeti.totalVariationOn_mul_le`, `AffineIsometryEquiv.totalVariationOn_comap`,
`TauCeti.totalVariationOn_comp_smul`, `TauCeti.HasWeakFDerivOn.totalVariationOn_eq_setLIntegral_enorm`,
`TauCeti.HasWeakFDerivOn.variationMeasure_eq_withDensity`,
`TauCeti.HasWeakFDerivOn.totalVariationOn_lt_top_iff_integrableOn`, `TauCeti.exists_hasWeakFDerivOn_iff`,
`TauCeti.MemBV.exists_hasWeakFDerivOn_integrableOn`, `TauCeti.MemBV.comp_lipschitz`, `TauCeti.BV`,
`TauCeti.W1p`, `TauCeti.W1p.hasWeakFDerivOn`, `TauCeti.mem_w1pSubmodule_iff_hasWeakFDerivOn`;
PDE §1.1–§1.3.

**Checks.**
- On `ℝ`, `u = 1_{(0,2)}` and `v = 1_{(1,3)}`: `max = 1_{(0,3)}` and `min = 1_{(1,2)}` each have variation
  `2`, and `|Du| + |Dv| = 4`, so the lattice inequality is an equality. For `u = 1_{(0,1)}` and
  `v = 1_{(1,2)}`, `max = 1_{(0,2)}` almost everywhere and `min = 0`, so the left side is `2 < 4`: the
  jumps at `1` cancel, and the statement cannot be strengthened to an equality.
- `u = 1_{ball 0 1}` on `ℝⁿ`: `u(r ·) = 1_{ball 0 (1/r)}` has variation `n ω_n r^{1−n}` and `L¹` norm
  `ω_n r^{−n}`; the factor `r^{n−1}` in place of `r^{1−n}` is the usual slip.
- `u(x) = |x|` on `(−1, 1)` is in `W^{1,1}` with `|Du| = volume`, absolutely continuous; `1_{(0,1)}` on
  `(−1, 1)` is in `BV` with `|Du| = δ_0` and is not in `W^{1,1}`.

### 3.3 One-dimensional BV

Prove that for an open interval `I ⊆ ℝ` and `u` locally integrable on `I`, `|Du|(I)` is the essential
variation of `u` on `I`, the infimum of `eVariationOn v I` over the functions `v` equal to `u` almost
everywhere on `I`, attained by the right-continuous representative when it is finite. Prove that
for `f : ℝ → ℝ` with `BoundedVariationOn f univ`, the derivative of §3.1 on `Ω = ⊤`, pushed forward
along the inclusion of the subtype `⊤` into `ℝ`, is Mathlib's `BoundedVariationOn.vectorMeasure`, and
the push-forward of `TauCeti.variationMeasure volume ⊤ f` is its variation; the atom at a point `x` is
`f(x⁺) − f(x⁻)` (`BoundedVariationOn.vectorMeasure_singleton`). This turns the inequality
`BoundedVariationOn.totalVariationOn_le_variation_vectorMeasure` into an equality of measures.
*Needs:* §3.1; Tau Ceti `BoundedVariationOn.totalVariationOn_le_variation_vectorMeasure`,
`BoundedVariationOn.integral_deriv_smul_eq_neg_integral_vectorMeasure`,
`BoundedVariationOn.totalVariationOn_lt_top`, `TauCeti.Real.ofReal_sum_abs_sub_le_totalVariationOn`;
Mathlib `eVariationOn`, `BoundedVariationOn.vectorMeasure`, `BoundedVariationOn.vectorMeasure_singleton`,
`BoundedVariationOn.variation_vectorMeasure_Ioo_right`.

**Checks.**
- A step function `u = Σᵢ cᵢ 1_{[aᵢ, aᵢ₊₁)}` with `a₀ < a₁ < … < a_m`: `Du = Σᵢ (cᵢ − cᵢ₋₁) δ_{aᵢ}` (with
  `c₋₁ = c_m = 0`) and `|Du|(ℝ) = Σᵢ |cᵢ − cᵢ₋₁|`, which is also its pointwise variation; the atoms
  sit at the endpoints.
- The indicator of `ℚ` has infinite pointwise variation on every interval and `|Du| = 0`, since it
  vanishes almost everywhere: the comparison is with the essential variation, not the pointwise one.

### 3.4 The Cantor–Lebesgue function

For the Cantor–Lebesgue function `C = TauCeti.cantorFunction` (`0` on `(−∞, 0]`, `1` on
`[1, ∞)`), prove that `C` is in `BV_loc(ℝ)` with `|DC|(ℝ) = 1`; that `DC` is the Stieltjes measure
`StieltjesFunction.measure` of `TauCeti.cantorStieltjesFunction`, so that it is a probability measure
without atoms, concentrated on the Cantor set and singular with respect to Lebesgue measure, the
properties of that Stieltjes measure named in the supplier contracts; that `C` is in `BV(Ω)` for every bounded
open `Ω`, and not in `BV(ℝ)` (it is not integrable); and that the absolutely continuous part of `DC`
in the Lebesgue decomposition `TauCeti.withDensity_enorm_acDerivativeDensity_add_singularPart` vanishes, so `C` is not in `W^{1,1}_loc`. This is the named
singular BV example, consumed by Isoperimetry's example of a homeomorphism that is not absolutely
continuous. *Needs:* §3.3; Tau Ceti `TauCeti.cantorFunction`, `TauCeti.continuous_cantorFunction`,
`TauCeti.monotone_cantorFunction`, `TauCeti.eVariationOn_cantorFunction`,
`TauCeti.ae_hasDerivAt_cantorFunction`, `TauCeti.not_absolutelyContinuousOnInterval_cantorFunction`,
`TauCeti.cantorStieltjesFunction`, `TauCeti.mutuallySingular_cantorStieltjesFunction_measure_volume`,
`TauCeti.cantorStieltjesFunction_measure_compl_cantorSet`, `TauCeti.acDerivativeDensity`,
`TauCeti.withDensity_enorm_acDerivativeDensity_add_singularPart`, `BoundedVariationOn.totalVariationOn_lt_top`.

**Checks.**
- `|DC|(ℝ) = 1` while `∫ |C'| = 0`: a variation defined as the integral of the pointwise derivative
  misses all of it.
- `C(0) = 0`, `C(1) = 1`, `C(1/3) = C(2/3) = 1/2`, and `DC([1/3, 2/3]) = 0`: `DC` gives no mass to the
  middle third, on which `C` is constant.

### Examples

- Prove that for `a < b` the indicator of `(a, b)` has derivative `δ_a − δ_b` on `ℝ`, whose total
  variation `2` is the perimeter `TauCeti.Real.perimeter_Ioo`, and that a step function
  `u = Σᵢ cᵢ 1_{[aᵢ, aᵢ₊₁)}` has the endpoint atoms of the first Check of §3.3 as its derivative.
- Prove that `u(x) = ⟪a, x⟫` on a bounded open `Ω` has `Du = a · volume` on `Ω` (§3.1); its variation
  measure `‖a‖ · volume` and its polar density `a/‖a‖` for `a ≠ 0` come from
  `TauCeti.HasWeakFDerivOn.variationMeasure_eq_withDensity` and
  `TauCeti.HasWeakFDerivOn.ae_norm_smul_polarDensity_eq`.
- The Cantor–Lebesgue function of §3.4 is the singular continuous example: its derivative is a
  probability measure without atoms, concentrated on the Cantor set.

### Dependencies

The supplier contracts of the Layer 3 group, PDE §1.1–§1.3 for `W^{1,1}`, and Mathlib's vector
measures. Layers 1 and 2 are not used.

## Layer 4: approximation, compactness and scalar coarea

This layer gives strict approximation on arbitrary open sets, `L¹` compactness on bounded Lipschitz
domains, and the identification of the perimeters of regular superlevel sets with the Hausdorff
measure of the level sets. It uses lower semicontinuity of variation under `L¹_loc` convergence, weak
convergence of the derivative measures under locally bounded variation, compactness in `L¹_loc` for
families locally bounded in `L¹` and variation, convolution estimates, strict approximation on the
whole space, the scalar coarea formula `|Du|(Ω) = ∫ P({u > t}; Ω) dt` with measurability in `t`, the
local measure identity, layer-cake and truncation formulas, the approximation of Lebesgue-measurable
sets of finite volume by bounded smooth sets, BV Poincaré on balls, the BV Sobolev inequality and the
relative isoperimetric inequality `min(|E ∩ B_r|, |B_r \ E|)^{(n−1)/n} ≤ C_n P(E; B_r)` for `n ≥ 2`,
all named in the supplier contracts (Layer 4 group). The scalar coarea formula is an equality in
`[0, ∞]` and so contains its converse: a locally integrable `u` with `∫ P({u > t}; Ω) dt < ∞` has
finite variation on `Ω`. The relative isoperimetric inequality is the nonsharp input of Layer 5 and
does not use the sharp isoperimetric theorem.

### 4.1 Strict approximation on open sets

Prove `exists_contDiffOn_tendsto_totalVariationOn`: every `u` integrable on an open `Ω` is the
`L¹(Ω)` limit of functions smooth on `Ω` whose variations on `Ω` converge to `|Du|(Ω)`, finite or
infinite (Anzellotti–Giaquinta 1978, Theorem 1, p. 2, when `|Du|(Ω) < ∞`). Prove the local version:
for `u` locally integrable on `Ω`, smooth `u_j` converge to `u` in `L¹` on every compact subset of `Ω`
with `|Du_j|(Ω) → |Du|(Ω)`.

*Route.* Take a locally finite partition of unity `(χᵢ)` subordinate to an exhaustion of `Ω` by
relatively compact open sets and mollify each `χᵢ u` at a scale `εᵢ` small enough that its support
stays in `Ω`, that its `L¹` distance to `χᵢ u` is small, and that the commutator terms
`ρ_{εᵢ} ⋆ (u ∇χᵢ) − u ∇χᵢ` are small in `L¹` (`TauCeti.tendsto_setLIntegral_enorm_normed_convolution_sub`);
since `Σᵢ u ∇χᵢ = u ∇(Σᵢ χᵢ) = 0`, testing the sum against a field `φ` bounds its variation by
`|Du|(Ω)` plus the sum of those errors. Lower semicontinuity gives the reverse inequality. The case
`Ω = ⊤` is `MeasureTheory.Integrable.exists_contDiff_hasCompactSupport_strict_approximation`.
*Needs:* Tau Ceti `MeasureTheory.Integrable.exists_contDiff_hasCompactSupport_strict_approximation`,
`TauCeti.tendsto_setLIntegral_enorm_normed_convolution_sub`, `TauCeti.totalVariationOn_mul_le`,
`TauCeti.totalVariationOn_le_liminf`.

**Checks.**
- `Ω = (0, 1)` and `u = 1`: `u_j(x) = 1 + sin(jx)/j` converges to `u` in `L¹` but `|Du_j|(Ω) = ∫_0^1 |cos(jx)| dx → 2/π`,
  not `0`: `L¹` approximation alone is not strict, and lower semicontinuity gives only `≥`.
- `Ω = (0, 1)` and `u(x) = sin(1/x)`, integrable with infinite variation: the approximants have
  variations tending to `∞`.

### 4.2 Compactness on bounded Lipschitz domains

Prove that for a bounded Lipschitz domain `Ω` (Convention 1), every sequence `u_j` with
`sup_j (‖u_j‖_{L¹(Ω)} + |Du_j|(Ω)) < ∞` has a subsequence converging in `L¹(Ω)` to some `u` in `BV(Ω)`,
with `|Du|(Ω) ≤ liminf |Du_j|(Ω)`; equivalently, bounded sets of `BV(Ω)` are relatively compact in
`L¹(Ω)`. *Route.* Compactness on compact subsets of `Ω`
(`TauCeti.isCompact_closure_of_setLIntegral_le_of_totalVariationOn_le`; Simon 1983, Theorem 6.3,
p. 37) and a uniform bound, in each boundary chart, of `∫ |u|` over the boundary layer of width `δ`
by `δ` times the BV norm, proved for smooth `u` by integrating along the chart's vertical lines and
extended by §4.1. *Needs:* §4.1; Tau Ceti `TauCeti.isCompact_closure_of_setLIntegral_le_of_totalVariationOn_le`,
`TauCeti.totalVariationOn_le_liminf`, `Set.IsLipschitzDomainWith`; PDE §1.6.

**Checks.**
- On `(0, 1)`, `u_j(x) = sin(jπx)` is bounded in `L¹` with variation `2j`; no subsequence converges in
  `L¹`, so the variation bound cannot be dropped.
- On the unbounded `(0, ∞)`, `u_j = 1_{(j, j+1)}` has BV norm `3` and no `L¹`-convergent subsequence:
  boundedness of `Ω` is needed.

### 4.3 Regular levels

Prove that for `u` of class `C¹` on `Ω` and a level `t` at which `∇u(x) ≠ 0` for every `x ∈ Ω` with
`u(x) = t`, `P({u > t}; Ω) = Hⁿ⁻¹({u = t} ∩ Ω)`, the reduced boundary of `{u > t}` in `Ω` is
`{u = t} ∩ Ω`, and the outer normal there is `−∇u/‖∇u‖` (Simon 1983, §14, p. 72, for an open set
whose boundary in `Ω` is a `C¹` hypersurface, with the inner normal). By Sard's theorem on a set,
`TauCeti.addHaar_image_criticalPoints_eq_zero` applied on `Ω`, almost every level of a `u` smooth on
`Ω` is regular on `Ω`, so the scalar coarea formula reads `|Du|(Ω) = ∫ Hⁿ⁻¹({u = t} ∩ Ω) dt` for such
`u`. This identifies with `Hⁿ⁻¹` of the level sets the
perimeters of the regular superlevel sets selected by `ContDiff.exists_mem_Ioo_surjective_fderiv_perimeter_le`
in the smooth approximation of sets. No statement of this layer asserts that the approximation of
sets preserves the equality cases of an inequality. The affine case is
`TauCeti.perimeter_setOf_inner_lt`. *Needs:* Tau Ceti
`TauCeti.euclideanHausdorffMeasure_normalGraphEmbedding_image_eq_lintegral_sqrt_one_add_norm_fderiv_sq`,
`TauCeti.integral_trace_fderiv_mul_indicator_eq_integral_inner_outerNormal`,
`TauCeti.perimeter_setOf_inner_lt`, `Continuous.frontier_setOf_lt_eq_of_fderiv_ne_zero` (stated for
`u` continuous on `E` and regular on the whole level set, so applied after localizing to `Ω`),
`TauCeti.reducedBoundary_subset_frontier`, `TauCeti.addHaar_image_criticalPoints_eq_zero`,
`ContDiff.exists_mem_Ioo_surjective_fderiv_perimeter_le`, `TauCeti.totalVariationOn_eq_lintegral_perimeter`;
Mathlib's implicit function theorem.

**Checks.**
- `u(x) = ‖x‖²` and `t = r² > 0`: `{u > t}` is the exterior of the closed ball, of perimeter
  `n ω_n r^{n−1}` (`TauCeti.perimeter_closedBall`, `TauCeti.perimeter_compl`), which is `Hⁿ⁻¹` of the sphere;
  the normal `−x/‖x‖` points into the ball, out of `{u > t}`.
- `n = 1`, `u(x) = x²`, `t = 0`: the level is critical, `{u > 0} = ℝ \ {0}` has perimeter `0`, and
  `H⁰({0}) = 1`; the regularity hypothesis is needed.

### Examples

- Strict approximation of the indicator of `(1/2, 1)` in `(0, 1)` by `ψ(j(x − 1/2))`, with `ψ` smooth,
  nondecreasing, `0` on `(−∞, 0]` and `1` on `[1, ∞)`: these converge in `L¹` and have variation `1`
  for `j ≥ 2`, equal to the variation of the indicator.
- The exterior of a ball as a regular superlevel set of `‖x‖²` (first Check of §4.3).

### Dependencies

Layer 3 (§3.2 for cutoffs); the supplier contracts of the Layer 4 group; PDE §1.6 for §4.2.

## Layer 5: finite perimeter and boundary structure

This layer proves the structure theory of sets of finite perimeter: relative smooth approximation
and truncation by balls, the blow-up theorem, De Giorgi's structure theorem and Federer's theorem.
It uses the perimeter with its invariance under null modification, complements, isometries,
translations and dilations, its locality in `Ω`, submodularity, cut by balls, compactness and lower
semicontinuity; the Lebesgue density theorem for the essential interior, exterior and boundary; the
reduced boundary and outer normal with the Gauss–Green formula against `|Dχ_s|`; the upper and lower
density estimates at reduced-boundary points; and the rigidity of sets with constant normal, named
in the supplier contracts (the Layer 3 group for the transport of perimeter, the Layer 4 group for
compactness and the relative isoperimetric inequality, the Layer 5 group for the rest). The blow-up, covering and rectifiability arguments
are targets of this layer resting on Layers 2–4; a reduced-boundary predicate without the
representation theorem does not discharge it.

### 5.1 Relative smooth approximation and truncation by balls

Prove that for every Lebesgue-measurable `s` and open `Ω` there are functions `u_j` smooth on `Ω` and
levels `t_j ∈ (0, 1)` regular for `u_j` on `Ω` such that `{u_j > t_j}` converges to `s` in measure on
every compact subset of `Ω` and `P({u_j > t_j}; Ω) → P(s; Ω)`, finite or infinite, with no
finite-volume assumption (Maggi 2012, §13.2, p. 150, for sets of finite perimeter in the whole
space). Prove the truncation inequality with Hausdorff measure: for a
Lebesgue-measurable `s` and a point `x₀`, for almost every `r > 0`,
`P(s ∩ ball x₀ r) ≤ P(s; ball x₀ r) + Hⁿ⁻¹(s ∩ sphere x₀ r)` in `[0, ∞]`; it combines
`TauCeti.ae_perimeter_inter_ball_le`, whose boundary term is the derivative of `ρ ↦ |s ∩ ball x₀ ρ|`,
with `TauCeti.ae_hasDerivAt_measureReal_inter_ball`, which identifies that derivative.

*Route* for the approximation. Apply the local strict approximation of §4.1 to the indicator of `s`
on `Ω`. By the scalar coarea formula `TauCeti.totalVariationOn_eq_lintegral_perimeter` and Sard's
theorem on `Ω` (`TauCeti.addHaar_image_criticalPoints_eq_zero`), each interval of levels contains a
level regular on `Ω` whose superlevel set has perimeter in `Ω` at most the variation of `u_j` on `Ω`
divided by the length of the interval; this `Ω`-local selection is proved here as the whole-space
`ContDiff.exists_mem_Ioo_surjective_fderiv_perimeter_le` is, which assumes `u` smooth on all of `E`.
Lower semicontinuity gives the reverse inequality. The whole-space case for sets of finite volume is
`MeasureTheory.NullMeasurableSet.exists_smooth_perimeter_approximation`. *Needs:* §4.1, §4.3; Tau Ceti
`TauCeti.ae_perimeter_inter_ball_le`, `TauCeti.ae_hasDerivAt_measureReal_inter_ball`,
`TauCeti.addHaar_image_criticalPoints_eq_zero`, `TauCeti.totalVariationOn_eq_lintegral_perimeter`,
`TauCeti.perimeter_le_liminf`.

**Checks.**
- The exterior of the unit ball in `ℝⁿ` has infinite volume and perimeter `n ω_n`; its indicator is
  not in `BV(ℝⁿ)`. A definition of finite perimeter as membership of the indicator in `BV` would
  exclude it, and the approximation of this section covers it.
- For `s = (0, 1)²` in `ℝ²`, `x₀ = 0` and `r = 1/2`: `s ∩ ball 0 (1/2)` is a quarter disc with
  `P = 1/2 + 1/2 + π/4`, while `P(s; ball 0 (1/2)) = 1` (the two edges inside the ball) and
  `H¹(s ∩ sphere 0 (1/2)) = π/4`; the inequality is an equality here, and a version without the
  boundary term fails.

### 5.2 Density and blow-up at reduced-boundary points

Prove `tendsto_measure_preimage_add_smul_symmDiff_setOf_inner_lt_inter`: at every point `x` of the
reduced boundary of `s` in `Ω`, the rescaled sets `(s − x)/r` converge in measure on every compact set,
as `r → 0⁺`, to the half-space `{y | ⟪y, ν_s(x)⟫ < 0}` (Simon 1983, Theorem 14.3, p. 73, stated with
the inner normal). Prove that `s` has density `1/2` at every
point of its reduced boundary (`TauCeti.HasDensityAt volume s x (1/2)`), so that the reduced boundary
lies in the essential boundary in every dimension (for `2 ≤ n` the inclusion alone is
`TauCeti.reducedBoundary_subset_essentialBoundary`); that the rescaled perimeter measures converge
weakly to `Hⁿ⁻¹` on the hyperplane `ν_s(x)^⊥`; and that `|Dχ_s|(closedBall x r)/(ω_{n−1} r^{n−1}) → 1`.
*Needs:* Tau Ceti `TauCeti.eventually_neg_le_integral_divergenceCLM_mul_indicator_preimage`,
`TauCeti.integral_divergenceCLM_mul_indicator_nonneg_of_tendsto_measure_symmDiff_inter`,
`TauCeti.ae_eq_setOf_inner_lt_of_ae_outerNormal_eq`,
`TauCeti.exists_subseq_tendsto_measure_symmDiff_inter_of_perimeter_le`,
`TauCeti.eventually_variationMeasure_closedBall_le`, `TauCeti.eventually_ofReal_pow_le_mul_measure_inter_ball`,
`TauCeti.eventually_ofReal_pow_le_mul_variationMeasure_closedBall`, `TauCeti.perimeter_setOf_inner_lt`, `TauCeti.perimeter_ball_setOf_inner_lt`, `TauCeti.perimeter_le_liminf`.
The lower density estimates `TauCeti.eventually_ofReal_pow_le_mul_measure_inter_ball` and
`TauCeti.eventually_ofReal_pow_le_mul_variationMeasure_closedBall` and the inequality
`TauCeti.min_measure_inter_measure_sdiff_rpow_le_perimeter` assume `2 ≤ n`. In dimension one, if `s`
has locally finite perimeter in an open `Ω ⊆ ℝ`, then `s ∩ Ω` agrees almost everywhere with `Ω ∩ W`
for a union `W` of intervals whose endpoints in `Ω` form a locally finite subset of `Ω`, the reduced
boundary of `s` in `Ω` is that set of endpoints, and the
statements of this section and of §5.3–§5.4 are proved directly; in dimension zero the reduced
boundary is empty.

**Checks.**
- `s` the unit ball and `x = e₁`: `ν_s(x) = e₁`, and `(s − e₁)/r` converges to `{y₁ < 0}`.
- `s = {y₂ > 0}` in `ℝ²`: the outer normal is `−e₂`, and `{⟪y, −e₂⟫ < 0} = {y₂ > 0}` is `s` itself; the
  inner normal would give the complement.
- At a corner of the unit square the density is `1/4` and the corner is not in the reduced boundary;
  at the midpoint of an edge the density is `1/2`.

### 5.3 De Giorgi's structure theorem

Prove `countablyRectifiable_reducedBoundary`: the reduced boundary of a set of locally finite perimeter
in `Ω` is countably `(n − 1)`-rectifiable; and `variationMeasure_indicator_eq_comap_restrict_reducedBoundary`:
its perimeter measure `|Dχ_s|` on `Ω` is `Hⁿ⁻¹` restricted to the reduced boundary (Simon 1983,
Theorem 14.3, p. 72, for a set of locally finite perimeter in an open set).

- `Dχ_s = −ν_s Hⁿ⁻¹⌊∂*s`: the polar density of `χ_s` is `−ν_s` at `Hⁿ⁻¹`-almost every point of `∂*s`
  (from the identity and the `|Dχ_s|`-almost everywhere statement `TauCeti.ae_outerNormal_eq`).
- `P(s; U) = Hⁿ⁻¹(∂*s ∩ U)` for every open `U ≤ Ω`.
- At `Hⁿ⁻¹`-almost every `x ∈ ∂*s`, `ν_s(x)^⊥` is the approximate tangent plane of `∂*s` (§2.1).

*Route.* The ratio `|Dχ_s|(closedBall x r)/(ω_{n−1} r^{n−1})` tends to `1` at every point of `∂*s`
(§5.2). Its lower bound and `MeasureTheory.Measure.mul_euclideanHausdorffMeasure_le_measure` give
`|Dχ_s| ≥ Hⁿ⁻¹⌊∂*s`, so `∂*s` has locally finite `Hⁿ⁻¹` measure; its upper bound and a Vitali
covering give `|Dχ_s| ≤ 2^{n−1} Hⁿ⁻¹⌊∂*s` on subsets of `∂*s`, and with the concentration of `|Dχ_s|`
on `∂*s` (`TauCeti.ae_mem_reducedBoundary`) the two measures are mutually absolutely continuous.
Rectifiability comes next: the blow-up puts `∂*s` near each of its points inside a narrow cone around
the hyperplane `ν_s(x)^⊥`, and a covering argument places `∂*s` in countably many Lipschitz graphs.
Only then does the density theorem of §2.1 for the rectifiable `∂*s` give `Hⁿ⁻¹⌊∂*s` density one at
`Hⁿ⁻¹`-almost every point of `∂*s`, so that the Radon–Nikodym derivative of `|Dχ_s|` with respect to
`Hⁿ⁻¹⌊∂*s`, the limit of the ratio of the two measures on small balls (`Besicovitch.ae_tendsto_rnDeriv`),
is `1` almost everywhere; the upper density bound alone does not give equality. The variation measure
lives on the subtype `Ω`, and the comparison transports `Hⁿ⁻¹⌊∂*s` along the inclusion of `Ω`.
*Needs:* §5.2, §2.1; Tau Ceti `TauCeti.CountablyRectifiable`,
`MeasureTheory.Measure.mul_euclideanHausdorffMeasure_le_measure`,
`TauCeti.ae_tendsto_euclideanHausdorffMeasure_inter_closedBall_div`, `TauCeti.ae_mem_reducedBoundary`,
`TauCeti.ae_outerNormal_eq`; Mathlib `Besicovitch.ae_tendsto_rnDeriv`.

**Checks.**
- The ball of radius `r` about `c`: the reduced boundary is the sphere, `Dχ = −((x − c)/r) Hⁿ⁻¹⌊sphere`
  and `|Dχ|(ℝⁿ) = Hⁿ⁻¹(sphere) = n ω_n r^{n−1}`, agreeing with `TauCeti.perimeter_ball` and
  `TauCeti.euclideanHausdorffMeasure_sphere`.
- The unit square in `ℝ²`: the reduced boundary is the boundary without its four corners and
  `P = 4 = H¹`.
- In dimension one, `s = (0, 1) ∪ (2, 3)`: the reduced boundary is `{0, 1, 2, 3}` and `|Dχ_s|` is counting
  measure on it, total `4`, as `H⁰` is counting measure.
- With Mathlib's raw `μH[2]` on `ℝ³` the identity would give the unit ball perimeter `16` instead of
  `4π`: the normalized measure is required.

### 5.4 Federer's theorem and the perimeter bound

Prove `euclideanHausdorffMeasure_essentialBoundary_inter_diff_reducedBoundary`: for `s` of locally
finite perimeter in `Ω`, the points of `Ω` in the essential boundary and outside the reduced boundary
form an `Hⁿ⁻¹`-null set (Maggi 2012, Chapter 16, pp. 183–184, for sets of locally finite perimeter in
the whole space; the form in `Ω` follows by applying it to `s ∩ B` for balls `B` with closure in `Ω`,
whose radii are chosen, by the truncation inequality of §5.1, so that `s ∩ B` has finite perimeter).
Prove
`perimeter_le_euclideanHausdorffMeasure_essentialBoundary_inter`:
for every Lebesgue-measurable `s` and open `Ω`, `P(s; Ω) ≤ Hⁿ⁻¹(∂ᴹs ∩ Ω)` in `[0, ∞]`, where `∂ᴹs` is the
essential boundary.

- *Inclusions.* `∂*s ⊆ s^{(1/2)} ⊆ ∂ᴹs`, with `s^{(1/2)}` the points of density `1/2`, in every dimension
  (from §5.2).
- *Equality.* For `s` of locally finite perimeter in `Ω`, `P(s; Ω) = Hⁿ⁻¹(∂ᴹs ∩ Ω)`.
- *Criterion.* If `Hⁿ⁻¹(∂ᴹs ∩ K) < ∞` for every compact `K ⊆ Ω`, then `s` has locally finite
  perimeter in `Ω`.
- *Frontier.* `P(s; Ω) ≤ Hⁿ⁻¹(frontier s ∩ Ω)`, from the bound and
  `TauCeti.essentialBoundary_subset_frontier`.

The proof of the bound includes the criterion: finite `Hⁿ⁻¹` measure of the boundary is a conclusion
about the perimeter, never a smoothness hypothesis. *Needs:* §5.1, §5.3; Tau Ceti `TauCeti.essentialBoundary`,
`TauCeti.measure_essentialBoundary`, `TauCeti.reducedBoundary_subset_essentialBoundary`,
`TauCeti.essentialBoundary_subset_frontier`, `TauCeti.min_measure_inter_measure_sdiff_rpow_le_perimeter`,
`TauCeti.perimeter_le_liminf`.

**Checks.**
- `s` the unit ball together with `ℚⁿ` outside it, a null dense set: `P(s) = n ω_n`, the essential
  boundary is the sphere with `Hⁿ⁻¹ = n ω_n`, and the frontier is the complement of the open ball, of
  infinite `Hⁿ⁻¹` measure. The bound by the frontier holds and is far from equality; the punctured
  ball likewise has perimeter `n ω_n` and a frontier with one extra point.
- In `ℝ`, `s = ⋃_k (1/(2k + 1), 1/(2k))`: on `Ω = (0, 1)` every compact set meets finitely many
  endpoints, so the criterion gives locally finite perimeter, while `P(s; (0, 1)) = ∞`, which equals
  `H⁰` of the infinite set of endpoints.

### Examples

- Prove that for `r > 0` the ball `ball c r` has reduced boundary `sphere c r` with outer normal
  `(x − c)/r`, and that its exterior `(closedBall c r)ᶜ`, a set of infinite volume, has the same
  perimeter `n ω_n r^{n−1}` (`TauCeti.perimeter_closedBall`, `TauCeti.perimeter_compl`), the same reduced
  boundary and the opposite normal.
- Prove that in `EuclideanSpace ℝ (Fin n)`, `n ≥ 1`, the punctured ball `ball 0 1 \ {0}` and the union of
  `ball 0 1` with the points of rational coordinates have perimeter `n ω_n` and essential boundary
  `sphere 0 1`, while their frontiers are `sphere 0 1 ∪ {0}` and the complement of `ball 0 1`
  (first Check of §5.4).
- Prove that the square `(0, 1)²` has perimeter `4`, essential boundary its whole frontier and
  reduced boundary the frontier without the four corners, at which its density is `1/4`.
- In dimension one, a finite disjoint union of bounded open intervals with disjoint closures has
  reduced boundary the set of endpoints and perimeter the number of endpoints (third Check of §5.3).

### Dependencies

Layers 2–4 (§2.1 for the tangent planes of `∂*s`, §4.1 and §4.3 for §5.1, Layer 4's relative
isoperimetric inequality for the density estimates). The sharp isoperimetric inequality is not used.

## Layer 6: traces, Gauss–Green and classical domains

This layer proves the Gauss–Green formula against `Hⁿ⁻¹` on the reduced boundary, identifies the
perimeter, normal and surface measure of Lipschitz and `C¹` domains, constructs the trace of a BV
function on a bounded Lipschitz domain with integration by parts, extension and gluing, and computes
the perimeter and outer normal of the inside of a rectifiable Jordan curve. Its inputs beyond Layers
1–5 are the Lipschitz-domain model and Sobolev trace of PDE §1.6, Jordan separation from
ConformalMapping §5.3, the winding number of ContourIntegration Layer 0 with the index calculus of
absolutely continuous curves named in DifferentialGeometry 5.6.1, and the Green identity for
absolutely continuous curves from DifferentialGeometry 5.6.3, used through the declarations named in
the supplier contracts (Layer 6 group).

### 6.1 The Gauss–Green formula on the reduced boundary

Prove `integral_trace_fderiv_mul_indicator_eq_setIntegral_reducedBoundary`: for `s` of locally finite
perimeter in `Ω` and a `C¹` vector field `φ` with compact support in `Ω`,
`∫_s div φ = ∫_{∂*s} ⟪φ, ν_s⟫ dHⁿ⁻¹` (Simon 1983, 14.1 and Theorem 14.3, p. 72, with the inner normal).
Prove the extension to fields without compact support:
if `P(s; ⊤) < ∞`, `φ` is `C¹` and bounded, `div φ` is integrable on `s`, and either `|s| < ∞` or
`∫_s ‖φ‖ < ∞`, the same identity holds with `Ω = ⊤`. The BV form, `∫ u div φ = −∫ ⟪φ, σ_u⟫ d|Du|`, is
`TauCeti.integral_trace_fderiv_mul_eq_neg_integral_inner_polarDensity`. *Needs:* §5.3; Tau Ceti
`TauCeti.integral_trace_fderiv_mul_indicator_eq_integral_inner_outerNormal`.

**Checks.**
- `s` the ball of radius `R` and `φ(x) = x` near it: `∫_s div φ = n ω_n Rⁿ` and
  `∫_{sphere} ⟪x, x/R⟫ dHⁿ⁻¹ = R · n ω_n R^{n−1}`; the inner normal would give the opposite sign.
- `s` the exterior of the unit ball in `ℝⁿ`, `n ≥ 2`, and `φ(x) = x/‖x‖ⁿ` outside `ball 0 (1/2)`, smooth
  inside: `div φ = 0` on `s` and `P(s) = n ω_n`, but `|s| = ∞` and `∫_s ‖φ‖ = ∞`; the left side is `0` and
  the right side is `−n ω_n`. The flux escapes to infinity, so the extension needs its hypotheses.

### 6.2 Lipschitz and `C¹` domains

Prove that a bounded Lipschitz domain `Ω` has finite perimeter, that `Hⁿ⁻¹`-almost every point of
`∂Ω` lies in its reduced boundary, and that `|Dχ_Ω| = Hⁿ⁻¹⌊∂Ω`, so `P(Ω; U) = Hⁿ⁻¹(∂Ω ∩ U)` for open
`U`; finiteness holds because `Hⁿ⁻¹(∂Ω) < ∞` (Anzellotti–Giaquinta 1978, Proposition 3, p. 6). In a
boundary chart in which `Ω` is `{(t, y) | t > γ(y)}` with `γ` Lipschitz, the outer normal at
`(γ(y), y)` is `(−1, ∇γ(y))/√(1 + ‖∇γ(y)‖²)` for almost every `y`, transported by the chart's
isometry. Consequently the divergence theorem `∫_Ω div φ = ∫_{∂Ω} ⟪φ, ν_Ω⟫ dHⁿ⁻¹` holds for every
compactly supported `C¹` field, with the classical graph formulas for normal and surface measure.
For a `C¹` domain the reduced boundary is all of `∂Ω` and `ν_Ω` is the continuous classical normal.
For a bounded open set with smooth boundary, viewed as a manifold with boundary, the outer normal and
`Hⁿ⁻¹⌊∂Ω` agree with the outward unit normal and induced boundary volume of DifferentialGeometry 12.5;
this comparison is not an input of the flat theory. *Needs:* §5.3, §6.1; Tau Ceti
`Set.IsLipschitzDomainWith`, `Set.IsLipschitzChartWith.lintegral_frontier_inter_eq`,
`TauCeti.isLipschitzDomainWith_of_contDiffAt`, `TauCeti.setIntegral_setOf_inner_lt_trace_fderiv`;
DifferentialGeometry 12.5 for the last comparison.

**Checks.**
- The unit cube `(0, 1)ⁿ`: `P = 2n`, the outer normal is `±eᵢ` on the faces, and the edges are outside
  the reduced boundary but `Hⁿ⁻¹`-null.
- The Lipschitz domain `{(t, y) ∈ ℝ² | t > |y|}`: at `(|y|, y)` the normal is `(−1, sign y)/√2`, pointing
  out of the domain; the opposite sign points into it.

### 6.3 BV traces on bounded Lipschitz domains

Prove `exists_trace_memBV`: for a bounded Lipschitz domain `Ω` (Convention 1) there is a constant `C`
such that every `u` in `BV(Ω)` has a trace `g` on `∂Ω`, integrable for `Hⁿ⁻¹`, with
`∫_{∂Ω} |g| dHⁿ⁻¹ ≤ C (‖u‖_{L¹(Ω)} + |Du|(Ω))`; at `Hⁿ⁻¹`-almost every `x ∈ ∂Ω`, `g(x)` is the approximate
limit of `u` from inside, `|ball x r|⁻¹ ∫_{Ω ∩ ball x r} |u − g(x)| → 0`; and for every compactly
supported `C¹` vector field `φ` on the whole space,
`∫_Ω u div φ = −∫_Ω ⟪φ, σ_u⟫ d|Du| + ∫_{∂Ω} ⟪φ, ν_Ω⟫ g dHⁿ⁻¹`, the integration by parts formula with
trace term (Anzellotti–Giaquinta 1978, Theorems 4, 7 and 8, pp. 12–16, for bounded open sets with
`P(Ω) = Hⁿ⁻¹(∂Ω) < ∞` and a boundary condition that Lipschitz boundaries satisfy, p. 12; §6.2 gives
the first for bounded Lipschitz domains).

- *The operator.* The trace is unique (by the approximate limit) and is a bounded linear operator
  `BV(Ω) → L¹(∂Ω, Hⁿ⁻¹)` on `TauCeti.BV volume Ω`.
- *Locality.* If `u = v` almost everywhere on `Ω ∩ U` for an open `U`, their traces agree
  `Hⁿ⁻¹`-almost everywhere on `∂Ω ∩ U`.
- *Sobolev agreement.* On `W^{1,1}(Ω)` the trace is `TauCeti.W1p.frontierTrace` for `p = 1`.
- *Extension.* There is a bounded linear extension operator from `BV(Ω)` to `BV` of the whole space
  whose extensions put no variation on `∂Ω`.
- *Zero extension.* The extension of `u` by `0` is in `BV` of the whole space, with
  `D(u 1_Ω) = Du⌊Ω − g ν_Ω Hⁿ⁻¹⌊∂Ω`.
- *Gluing.* For disjoint bounded Lipschitz domains `Ω₁`, `Ω₂`, `u_i` in `BV(Ω_i)` with traces `g_i`,
  and `Γ = ∂Ω₁ ∩ ∂Ω₂ ∩ Ω` where `Ω` is the interior of `closure(Ω₁ ∪ Ω₂)`, the function equal to `u_i`
  on `Ω_i` is in `BV(Ω)` with `|Du|(Ω) = |Du₁|(Ω₁) + |Du₂|(Ω₂) + ∫_Γ |g₁ − g₂| dHⁿ⁻¹`.

The boundary charts and the surface measure are those of PDE §1.6, through
`Set.IsLipschitzDomainWith` and `Set.IsLipschitzChartWith.lintegral_frontier_inter_eq`; no second
domain type is introduced. *Needs:* §4.1, §6.1, §6.2 (the identification `ν_Ω` of the outer normal on
`∂Ω`); Tau Ceti `Set.IsLipschitzDomainWith`, `Set.IsLipschitzChartWith.lintegral_frontier_inter_eq`,
`TauCeti.W1p.frontierTrace`, `TauCeti.W1p.lipschitzChartExtensionL` (the chart reflection whose BV
analogue gives the extension), `TauCeti.MemBV`,
`TauCeti.BV`, `TauCeti.polarDensity`, `TauCeti.variationMeasure`; PDE §1.6.

**Checks.**
- `u = 1` on `Ω`: the trace is `1` and the formula is the divergence theorem of §6.2. The zero extension
  gives `D(1_Ω) = −ν_Ω Hⁿ⁻¹⌊∂Ω`, matching the sign of Convention 8; a zero-extension formula with `+g ν_Ω`
  would contradict it.
- `u = 1_{ball 0 (1/2)}` on the unit ball: the trace is `0`, since `u` vanishes near `∂Ω`, and
  `|Du|(Ω) = Hⁿ⁻¹(sphere 0 (1/2))`.
- Gluing in dimension one: `Ω₁ = (−1, 0)`, `Ω₂ = (0, 1)`, `u₁ = 0`, `u₂ = 1`: `|Du|({0}) = 1 = |g₁ − g₂|`.
- The slit disc `ball 0 1 \ ([0, 1) × {0})` in `ℝ²` is not a Lipschitz domain; the angle function
  `θ ∈ (0, 2π)` is in `BV` there and has the two one-sided limits `0` and `2π` on the slit, so no
  approximate limit from inside exists: the Lipschitz hypothesis is needed.

### 6.4 Rectifiable Jordan curves

Prove `exists_windingNumber_eq_of_injOn_Ico`: for `γ : ℝ → ℂ` absolutely continuous on `[a, b]`,
`a < b`, closed and injective on `[a, b)`, with trace `C`, there is one sign `σ ∈ {1, −1}` such that
the winding number `TauCeti.Contour.windingNumber γ a b` is `σ` on the inside
`filledHull C \ C` and `0` outside `filledHull C` (the last part, on the unbounded complementary
component, is `AbsolutelyContinuousOnInterval.windingNumber_eq_zero_of_unbounded_component`). Prove `perimeter_filledHull_sdiff`: a Jordan curve
`C` with `H¹(C) < ∞` bounds an inside `Ω = filledHull C \ C` of finite perimeter `P(Ω) = H¹(C)`; that
a planar region bounded by a simple closed curve has finite perimeter exactly when the curve has
finite length is Federer 1958, p. 450. Prove
`exists_ae_outerNormal_filledHull_sdiff_eq`: for a unit-speed parametrization `γ` of `C` on `[a, b]`,
closed and injective on `[a, b)`, with Jordan index `σ`, at almost every `t` the point `γ(t)` lies in the
reduced boundary of `Ω` and the outer normal there is `−σ J γ'(t)` with `J v = I * v`.

- *Orientation.* `σ` is the orientation of `γ`: for a unit-speed `γ`, `σ = 1` exactly when the
  measure-theoretic inner normal `−ν_Ω(γ(t))` is `i γ'(t)` for almost every `t`, that is, when `Ω`
  lies to the left of the direction of motion. Its laws under change of parameter are the index laws
  `AbsolutelyContinuousOnInterval.windingNumber_comp_of_monotoneOn` and
  `AbsolutelyContinuousOnInterval.windingNumber_comp_of_antitoneOn` read on the inside: a monotone
  absolutely continuous change of parameter onto `[a, b]` keeps `σ` when it is increasing and
  negates it when it is decreasing, the reversal `t ↦ γ(a + b − t)` among the latter.
- *Boundary measure.* For a unit-speed `γ`, `|Dχ_Ω|` is the image of Lebesgue measure on `[a, b]` under
  `γ`, and `Dχ_Ω = −ν_Ω |Dχ_Ω|` is the image of `σ J γ'(t) dt`. Clockwise and counterclockwise
  parametrizations give the same perimeter.

The sign `σ` is a conclusion, not a hypothesis of Green's theorem, and `frontier Ω = C` alone gives no
equality of perimeter and length: the proof establishes the boundary normal and the measure
comparison. *Route.* Jordan separation and the filled hull (ConformalMapping §5.3, through
`TauCeti.IsJordanCurve.frontier_filledHull_sdiff`), the Green identity for absolutely continuous
curves `TauCeti.Green.green_ac_winding` (DifferentialGeometry 5.6.3), whose index-one flux form
`TauCeti.Green.green_ac_flux` is the identity `Dχ_Ω = γ_*(J γ' dt)` against `C¹` fields once the
index is `1` inside, the arclength factorization of Layer 1, and De Giorgi's and Federer's theorems with §6.1 (the prior formalization MovingSofa
develops Jordan-curve area and Hausdorff length). *Needs:* §1.1, §5.3, §5.4, §6.1; Tau Ceti
`TauCeti.filledHull`, `TauCeti.IsJordanCurve`, `TauCeti.IsJordanCurve.frontier_filledHull_sdiff`,
`TauCeti.Contour.windingNumber`, `AbsolutelyContinuousOnInterval.windingNumber_eq_zero_of_unbounded_component`,
`TauCeti.Green.green_ac_winding`, `BoundedVariationOn.exists_simple_closed_arclength_parametrization`,
`ContinuousOn.eVariationOn_eq_euclideanHausdorffMeasure_image`,
`AbsolutelyContinuousOnInterval.windingNumber_comp_of_monotoneOn`,
`AbsolutelyContinuousOnInterval.windingNumber_comp_of_antitoneOn`, `TauCeti.Green.green_ac_flux`;
Mathlib `HasUnitSpeedOn`.

**Checks.**
- The counterclockwise unit circle `γ(t) = exp(it)` on `[0, 2π]`: `σ = 1`, `−σ J γ'(t) = −i · i e^{it} = e^{it}`,
  the outward radial direction, and `P(ball 0 1) = 2π = H¹(C)`. The clockwise circle has `σ = −1` and the
  same normal and perimeter.
- The square with vertices `0, 1, 1 + i, i` in this order: `σ = 1`, `P = 4`, and the normal is `−i` on the
  bottom edge, traversed with `γ' = 1`.
- The non-absolutely-continuous circle of Layer 1, `γ(t) = exp(2πi φ(t))` on `[0, 1]` with
  `φ(t) = (t + C(t))/2`: its almost-everywhere derivative is `γ' = πi γ`, so the index integral
  `(2πi)⁻¹ ∫_0^1 γ'/γ` about `0` is `1/2` and `½ ∫_0^1 Im(conj(γ) γ')` is `π/2`, while through the
  arclength parametrization `θ ↦ exp(iθ)` on `[0, 2π]` the index inside is `1`, the perimeter `2π` and
  the area `π`. The index theorem needs absolute continuity, and the invariants of the inside go
  through the arclength parametrization.
- The Koch snowflake is a Jordan curve with `H¹ = ∞`; the hypothesis of `perimeter_filledHull_sdiff`
  fails for it.

### Examples

- Prove that a box `∏ᵢ (aᵢ, bᵢ)` has perimeter `2 Σᵢ Πⱼ≠ᵢ (bⱼ − aⱼ)` and `Dχ = −Σ ν Hⁿ⁻¹⌊face`, with
  `ν = ±eᵢ` on the two faces orthogonal to `eᵢ`; and that the annulus `ball 0 R \ closedBall 0 r`,
  `0 < r < R`, has perimeter `n ω_n (R^{n−1} + r^{n−1})`, with outer normal `x/‖x‖` on the outer sphere
  and `−x/‖x‖` on the inner one (§6.2).
- Prove that for the non-absolutely-continuous parametrization `γ(t) = exp(2πi φ(t))` of the unit
  circle (Layer 1, Examples), the arclength parametrization `θ ↦ exp(iθ)` on `[0, 2π]` gives the
  inside the perimeter `2π = H¹(C)`, the Jordan index `1` and the area `π`, the last through
  `TauCeti.signedArea_eq_intCast_mul_volume_real_of_windingNumber_eq` with index `1`, while the index
  integral and the signed area computed with the almost-everywhere derivative of `γ` give `1/2` and
  `π/2` (third Check of §6.4).
- Real-valued forms of these identities use the finiteness theorems of Layer 5 before
  `ENNReal.toReal` (Convention 10).

### Dependencies

Layers 1, 4 and 5; PDE §1.6 for Lipschitz domains and the Sobolev trace; ConformalMapping §5.3,
ContourIntegration Layer 0 and DifferentialGeometry 5.6.1 and 5.6.3 through their Tau Ceti
declarations for §6.4; DifferentialGeometry 12.5 for the smooth-domain comparison of §6.2 only.

## Downstream consumers

- **Isoperimetry** consumes Layers 1–2 (arclength, Hausdorff length, surface measure, area and coarea,
  sphere normalization), Layers 3–5 (BV, perimeter, strict approximation, reduced boundary, the
  frontier bound of §5.4) and Layer 6 (Gauss–Green and §6.4), and the Cantor example of §3.4.
- **DifferentialGeometry** consumes Layers 1–2 (arclength, the variation–speed identity, the
  arclength factorization and Hausdorff length); its section *Rectifiable curves and geometric
  measure theory* builds the geometric line integral on the arclength factorization and leaves the
  perimeter and normal of rectifiable Jordan domains to §6.4.
- **GaussianIsoperimetryAndClusters** consumes §2.4 (weighted coarea), §2.3, §2.2, §5.2–§5.4 and §6.2.
- **Varifolds** consumes Layer 2 (approximate tangent planes, tangential differentiation, the area
  formula with multiplicity and `C¹` graphs).
- **GeometricCurrents** consumes Layers 2–6 (rectifiability and approximate tangents, BV and local
  perimeter, De Giorgi's structure theorem, traces and Gauss–Green).
- **SobolevDifferentialForms** consumes §6.1–§6.3 (Gauss–Green, the outer normal of Lipschitz
  domains, BV traces and gluing).
- **RiemannianGeometry** consumes Layer 1 and §6.4 (arclength, the Jordan index and the area-null
  trace) and Layers 3–5; its sub-roadmap
  [RiemannianGeometry/Surfaces](../RiemannianGeometry/Surfaces/README.md) consumes the arclength of
  Layer 1 and the area and coarea formulas of Layer 2.
- **OptimalTransport** consumes the weighted area formula of Layer 2; **Yamabe** and
  **SobolevMapsBetweenManifolds** consume the area and coarea formulas of Layer 2; **Poincare3D**
  consumes Layers 1–2 (rectifiability and the area formula).

## Scope and ownership

This roadmap owns the targets of Layers 1–6 above: the metric theory of rectifiable curves (length,
arclength and their comparisons with Hausdorff measure), countable rectifiability with approximate
tangents, tangential differentiation, area and coarea formulas,
distributional BV and its comparison with Sobolev functions, approximation and compactness, the
scalar coarea formula, the perimeter API, De Giorgi's and Federer's structure theorems, BV traces and
the Gauss–Green formula, and the perimeter and normal of rectifiable Jordan domains. The scope is
finite-dimensional real inner product spaces, with metric curve results in the generality their
statements permit.

Other roadmaps cite the layers by their former labels G1–G6; each label names the same layer:

| Former numbering | Now |
|---|---|
| G1 — Rectifiable curves and arclength | Layer 1: rectifiable curves and arclength |
| G2 — Rectifiability, area, and coarea | Layer 2: rectifiability, area and coarea |
| G3 — Distributional BV and variation measures | Layer 3: distributional BV and variation measures |
| G4 — Approximation, compactness, and scalar coarea | Layer 4: approximation, compactness and scalar coarea |
| G5 — Finite perimeter and boundary structure | Layer 5: finite perimeter and boundary structure |
| G6 — Traces, Gauss–Green, and classical domains | Layer 6: traces, Gauss–Green and classical domains |

Parts of this plan are Tau Ceti declarations, consumed by name and not planned again; they are listed
with their hypotheses under the supplier contracts, grouped by layer:

- Layer 1: all of the metric curve theory except §1.1, including the AC length formula
  `AbsolutelyContinuousOnInterval.eVariationOn_eq_lintegral_enorm_deriv`, the comparison of trace
  measure and length `eVariationOn.euclideanHausdorffMeasure_image_le` and
  `ContinuousOn.eVariationOn_eq_euclideanHausdorffMeasure_image`, and the nullity of rectifiable
  planar traces `LocallyBoundedVariationOn.addHaar_image_eq_zero`.
- Layer 2: the closure API of countable rectifiability, the area formula in all its forms, Lipschitz
  Sard, the codimension-one graph formula, sphere measure and its comparison with Mathlib's angular
  measure, polar integration, `H⁰` as counting measure, slicing by linear projections, the comparison
  of `μHE` and `μH`, and the coarea formula for linear maps and for maps with surjective derivative.
- Layer 3: total variation, the variation measure and its localization, the polar and Lebesgue
  decompositions, `BV(Ω)` with completeness, restriction and Lipschitz composition, transport of
  variation and perimeter, the weak-derivative comparison with `|Du| = ‖∇u‖ · volume`, measure-valued
  integration by parts and agreement with smooth calculus, the one-dimensional comparison inequality,
  and the Cantor–Lebesgue function with its continuity, monotonicity, endpoint values, variation one,
  vanishing derivative almost everywhere and singular Stieltjes measure on the Cantor set.
- Layer 4: lower semicontinuity of variation, weak convergence of the derivative measures, `L¹_loc`
  compactness, convolution estimates and strict approximation on the whole space, the scalar coarea
  formula with its measurability, local measure identity, layer-cake and truncation formulas, the
  smooth approximation of sets of finite volume with Sard's theorem and the selection of regular
  levels, BV Poincaré on balls, the BV Sobolev inequality and the nonsharp relative isoperimetric
  inequality.
- Layer 5: the perimeter API, the Lebesgue density theorem for the essential boundary, the reduced
  boundary and outer normal with Gauss–Green against `|Dχ_s|`, the density estimates and the rigidity
  of constant normals.
- Layer 6: the divergence theorem on half-spaces; the Lipschitz-domain model, chart surface measure,
  `W^{1,p}` trace and extension of PDE §1.6; the Jordan curve and filled-hull declarations of
  ConformalMapping §5.3; the winding number of ContourIntegration Layer 0 with the index calculus of
  absolutely continuous curves (vanishing on the unbounded component, invariance under monotone
  reparametrization) named in DifferentialGeometry 5.6.1; and the Green identity of
  DifferentialGeometry 5.6.3.

Owned elsewhere and consumed here:

- [PDE](../PDE/README.md) §1.1–§1.3 owns weak derivatives, `W^{1,p}` (Tau Ceti's `TauCeti.HasWeakFDerivOn`
  and `TauCeti.W1p`), smooth density and the Fourier comparison; §1.5–§1.6 own Sobolev Poincaré, the
  Lipschitz-domain predicate, the graph surface measure of Lipschitz domains, the Sobolev trace,
  extension and Rellich. This roadmap owns the BV versions and their agreement with those results
  (BV Poincaré and compactness in Layer 4 with §4.2, the `W^{1,1}` comparison of §3.2, traces and
  extension in §6.3), and extends the actual weak-derivative APIs to measure-valued derivatives rather than
  introducing another weak derivative.
- [ConformalMapping](../../Completed/ConformalMapping/README.md) §5.3 owns the Jordan curve theorem
  and the filled-hull topology, and §5.6 the topological Jordan index theorem and its piecewise-`C¹`
  case; §6.4 here owns the absolutely continuous case with the outer normal and perimeter.
- [ContourIntegration](../../Completed/ContourIntegration/README.md), Layer 0, owns the winding
  number `TauCeti.Contour.windingNumber`.
- [DifferentialGeometry](../DifferentialGeometry/README.md), Layer 5.6, owns planar curve integrals,
  the index calculus of absolutely continuous curves (5.6.1) and Green's area identity for them
  (5.6.3), and its section *Rectifiable curves and geometric measure theory* owns the geometric line integral of rectifiable
  curves built on Layer 1's factorization; Layer 1 does not use those integrals. Its 12.5 owns the
  divergence theorem on manifolds with boundary, compared with §6.2 here; the flat theory does not
  require manifold Stokes.
- [Isoperimetry](../Isoperimetry/README.md) owns the sharp Euclidean isoperimetric constants,
  Brunn–Minkowski, rearrangements, ball rigidity and the sharp planar curve inequality, and in I3
  the identification of the signed area `½ ∫ Im(conj(γ) γ')` of a closed absolutely continuous Jordan
  parametrization with `σ` times the area of its inside, which uses the index theorem of §6.4 (Tau
  Ceti's `TauCeti.signedArea_eq_intCast_mul_volume_real_of_windingNumber_eq` gives it from the
  index). The nonsharp relative estimate of Layer 4 is a foundation of Layer 5, not a dependency on
  the sharp theorem.
- Currents, varifolds and the regularity theory of minimizing hypersurfaces are outside this roadmap;
  [Varifolds](../Varifolds/README.md) builds them on Layer 2 and
  [GeometricCurrents](../GeometricCurrents/README.md) on Layers 2–6.

## Exact supplier contracts

### From Mathlib

- *Measures and Hausdorff measure:* `MeasureTheory.Measure.euclideanHausdorffMeasure` (`μHE[k]`) with
  `InnerProductSpace.euclideanHausdorffMeasure_eq_volume` (`μHE[finrank ℝ V] = volume`),
  `EuclideanSpace.euclideanHausdorffMeasure_eq_volume` and `MeasureTheory.Measure.euclideanHausdorffMeasure_zero`
  (`μHE[0] = μH[0]`); the raw `MeasureTheory.Measure.hausdorffMeasure` (`μH[d]`);
  `LinearMap.euclideanHausdorffMeasure_image_eq_normDet_mul_volume` (the image of `s` under a linear `f`
  has `μHE[dim U]` measure `normDet f · volume s`); `Isometry.euclideanHausdorffMeasure_image` and
  `LinearIsometry.normDet_eq_one`, through which the intrinsic area and coarea statements transport
  along isometries.
- *Jacobians and calculus:* `LinearMap.normDet` (the absolute determinant on the range, `0` for a
  non-injective map), `LinearMap.normDet_sq_eq_det_gram` (its square is the Gram determinant) and
  `ContinuousLinearMap.adjoint`; Rademacher's theorem
  `LipschitzWith.ae_differentiableAt` and `LipschitzOnWith.ae_differentiableWithinAt_of_mem`;
  the Lipschitz extension `LipschitzOnWith.extend_finite_dimension` (into a finite-dimensional space);
  `exists_partition_approximatesLinearOn_of_hasFDerivWithinAt`; the implicit function theorem;
  the Gagliardo–Nirenberg–Sobolev inequality `MeasureTheory.eLpNorm_le_eLpNorm_fderiv_one` for
  compactly supported `C¹` functions.
- *Curves:* `eVariationOn`, `BoundedVariationOn`, `LocallyBoundedVariationOn`, `variationOnFromTo`,
  `naturalParameterization`, `HasConstantSpeedOnWith`, `HasUnitSpeedOn`, `AbsolutelyContinuousOnInterval`,
  `Path`; the variation API `eVariationOn.mono`, `eVariationOn.Icc_add_Icc`, `eVariationOn.union`,
  `eVariationOn.comp_eq_of_monotoneOn`, `eVariationOn.comp_eq_of_antitoneOn` (invariance under monotone
  reparametrization, needing no continuity), `variationOnFromTo.comp_eq_of_monotoneOn`,
  `eVariationOn.lowerSemicontinuous_uniformOn`, `eVariationOn.edist_le`;
  `BoundedVariationOn.continuousWithinAt_variationOnFromTo_iff`, `variationOnFromTo.self`,
  `variationOnFromTo.eq_of_le`, `variationOnFromTo.monotoneOn`;
  `BoundedVariationOn.ae_differentiableAt_of_mem_uIcc` (finite-dimensional targets);
  `BoundedVariationOn.vectorMeasure` (for `f : α → E` of bounded variation on `univ`, `α` a densely
  ordered linear order with the order topology, second countable, with compact closed intervals and
  its Borel σ-algebra, and `E` a complete normed group), with
  `BoundedVariationOn.vectorMeasure_singleton` (the atom at `a` is the jump of `f` there) and
  `BoundedVariationOn.variation_vectorMeasure_Ioo_right` (the variation of `Ioo a b` is the
  `eVariationOn` there of the right limit of `f`).
- *Vector measures and representation:* `MeasureTheory.VectorMeasure`,
  `MeasureTheory.VectorMeasure.variation`, `MeasureTheory.Measure.withDensityᵥ` with
  `MeasureTheory.Measure.variation_withDensityᵥ` (for integrable `f`, the variation of
  `μ.withDensityᵥ f` is `μ.withDensity ‖f‖ₑ`), `MeasureTheory.Measure.Regular`, and test
  functions `𝓓(Ω, E)`.
- *Integration and decomposition of measures:* the Bochner integral `MeasureTheory.integral`; the
  Lebesgue decomposition `MeasureTheory.Measure.haveLebesgueDecomposition_add`
  (`μ = μ.singularPart ν + ν.withDensity (μ.rnDeriv ν)`) with `MeasureTheory.Measure.singularPart`
  and the Radon–Nikodym derivative `MeasureTheory.Measure.rnDeriv`; the change of variables formula
  `MeasureTheory.lintegral_image_eq_lintegral_abs_det_fderiv_mul` (for `f` injective on a measurable
  `s` with derivative `f'` within `s`); the Riesz–Markov–Kakutani theorem
  `RealRMK.integral_rieszMeasure` (a positive linear functional on `C_c(X, ℝ)`, `X` locally compact
  Hausdorff, is integration against `RealRMK.rieszMeasure`).
- *Covering and density:* `Besicovitch.ae_tendsto_measure_inter_div` and the Vitali families of
  `Mathlib/MeasureTheory/Covering/`; `cantorSet` and `cantorSetEquivNatToBool`.

### From Tau Ceti

Paths are under `TauCeti/`. All the declarations below are proved.

**Layer 1 group.**
- `TauCeti.metricDerivative` (`MeasureTheory/Function/MetricDerivative/Basic.lean`; the `limsup` of
  `edist (γ s) (γ t) / edist s t` as `s → t`) and `HasDerivAt.metricDerivative_eq` (at a point of
  differentiability it is `‖γ'(t)‖ₑ`); for `γ` absolutely continuous on `[a, b]` with values in a
  pseudometric space, `AbsolutelyContinuousOnInterval.ae_tendsto_metricDerivative` (the difference
  quotients converge to the metric derivative at almost every `t`),
  `AbsolutelyContinuousOnInterval.lintegral_metricDerivative_lt_top` and
  `AbsolutelyContinuousOnInterval.edist_le_lintegral_metricDerivative` (the distance between two
  times is at most the integral of the metric derivative between them).
- `AbsolutelyContinuousOnInterval.eVariationOn_eq_lintegral_metricDerivative` (pseudometric target,
  `eVariationOn γ (uIcc a b) = ∫⁻ t in uIoc a b, metricDerivative γ t`),
  `AbsolutelyContinuousOnInterval.eVariationOn_eq_lintegral_enorm_deriv` (finite-dimensional normed
  target, `∫⁻ ‖deriv γ‖ₑ`), `AbsolutelyContinuousOnInterval.integral_norm_deriv_eq_eVariationOn_toReal`
  (for `a ≤ b`), `AbsolutelyContinuousOnInterval.intervalIntegrable_deriv_of_finiteDimensional`,
  `AbsolutelyContinuousOnInterval.absolutelyContinuousOnInterval_variationOnFromTo`,
  `AbsolutelyContinuousOnInterval.ae_hasDerivAt_comp_of_monotoneOn`,
  `AbsolutelyContinuousOnInterval.integral_deriv_eq_sub_of_finiteDimensional`,
  `AbsolutelyContinuousOnInterval.map_withDensity_deriv_of_monotoneOn` (for `θ` absolutely continuous
  and monotone on `[a, b]`, the image under `θ` of `θ'(t) dt` on `[a, b]` is Lebesgue measure on
  `[θ a, θ b]`), and `BoundedVariationOn.ae_metricDerivative_le_enorm_deriv_variationOnFromTo` (a
  pseudometric curve of bounded variation on `[a, b]` has metric derivative at most the derivative of
  its cumulative variation almost everywhere)
  (`MeasureTheory/Function/MetricDerivative/Variation.lean` and the absolutely continuous function files).
- `TauCeti.eVariationOn_eq_lintegral_enorm_derivWithin` (`Analysis/Calculus/MetricVariation.lean`; for
  `f` of class `C¹` on `Icc a b`, `eVariationOn f (Icc a b) = ∫⁻ ‖derivWithin f (Icc a b) t‖ₑ`).
- Arclength (`Topology/MetricSpace/Arclength/Basic.lean`, `…/SimpleClosed.lean`; metric targets,
  `γ` continuous and of bounded variation on `Icc a b`, `a ≤ b`, the zero-length case included):
  `LocallyBoundedVariationOn.naturalParameterization_variationOnFromTo` (local bounded variation
  suffices: `γ = c ∘ s` on `[a, b]` for the natural parametrization `c` and the cumulative arclength `s`), `BoundedVariationOn.image_variationOnFromTo_Icc`,
  `BoundedVariationOn.exists_arclength_factorization` (a `1`-Lipschitz `g` on `[0, L]` with
  `g ∘ variationOnFromTo = γ` and unit speed), `BoundedVariationOn.eqOn_naturalParameterization` (every
  such `g` agrees with the natural parametrization on `[0, L]`),
  `BoundedVariationOn.hasUnitSpeedOn_naturalParameterization`,
  `BoundedVariationOn.exists_arclength_homeomorph` (`γ` injective on `Ioo a b`: a strictly increasing
  homeomorphism `Icc a b ≃ₜ Icc 0 L` equal to the cumulative arclength),
  `BoundedVariationOn.exists_simple_closed_arclength_parametrization` (`γ` injective on `Ico a b`,
  `γ a = γ b`: a unit-speed `1`-Lipschitz parametrization with the same simplicity).
- `BoundedVariationOn.absolutelyContinuousOnInterval_naturalParameterization`
  (`MeasureTheory/Function/MetricDerivative/ConstantSpeed.lean`; metric target, `γ` continuous and of
  bounded variation on `Icc a b`, `a ≤ b`: the natural parametrization is absolutely continuous on
  `[0, L]`) and `LocallyBoundedVariationOn.strictMonoOn_variationOnFromTo_of_injOn_Ioo`
  (`Topology/EMetricSpace/VariationOnFromTo.lean`; `f` locally of bounded variation on `Icc a b` and
  injective on `Ioo a b`, no continuity: the cumulative variation from any `c ∈ Icc a b` is strictly
  increasing there).
- `HasConstantSpeedOnWith.ae_metricDerivative_eq` and `HasConstantSpeedOnWith.ae_norm_deriv_eq`
  (`MeasureTheory/Function/MetricDerivative/ConstantSpeed.lean`; speed `l` almost everywhere on `uIcc a b`).
- Trace measure (`Analysis/ConstantSpeed.lean`, `Topology/EMetricSpace/CurveLength.lean`):
  `eVariationOn.euclideanHausdorffMeasure_image_le` and `eVariationOn.hausdorffMeasure_image_le` (no
  hypothesis on `f`), `ContinuousOn.eVariationOn_eq_euclideanHausdorffMeasure_image` and
  `ContinuousOn.eVariationOn_eq_hausdorffMeasure_image` (`γ` continuous on `Icc a b`, injective on
  `Ioo a b`; finite or infinite), `ContinuousOn.boundedVariationOn_iff_euclideanHausdorffMeasure_image_lt_top`,
  `LocallyBoundedVariationOn.addHaar_image_eq_zero` (an additive Haar measure in dimension at least two
  gives a locally BV trace measure `0`).
- Banach indicatrix (`MeasureTheory/Function/AreaFormula/Curve.lean`, `…/Circle.lean`):
  `ContinuousOn.eVariationOn_eq_lintegral_encard` (finite-dimensional inner product target, `γ`
  continuous on `Icc a b`), `LipschitzOnWith.lintegral_enorm_deriv_mul_eq_lintegral_tsum` (weighted),
  `TauCeti.eVariationOn_circleMap_Icc_zero_four_pi` (the length of `circleMap c R` on `[0, 4π]` is
  twice `μHE[1]` of the circle), `TauCeti.encard_Icc_zero_four_pi_inter_preimage_circleMap` (for
  `R ≠ 0` and `θ ∈ (0, 2π)`, the point `circleMap c R θ` has two preimages in `[0, 4π]`), `Complex.euclideanHausdorffMeasure_sphere` (`r ≥ 0`: the circle of
  radius `r` has `μHE[1]` measure `2πr`).
- `TauCeti.IsCurveJoining`, `TauCeti.isCurveJoining_extend`, `TauCeti.exists_isCurveJoining_of_continuousOn`
  (`Topology/MetricSpace/Length.lean`), `TauCeti.eVariationOn_le_liminf_of_eventually_le`
  (`Topology/EMetricSpace/BoundedVariation.lean`), and the `Path` comparisons `Path.eVariationOn_reparam`,
  `Path.eVariationOn_trans`, `Path.eVariationOn_subpath`, `Path.eVariationOn_symm` (`Topology/Path/Variation.lean`).

**Layer 2 group.**
- `TauCeti.CountablyRectifiable` (`Geometry/MeasureTheory/Rectifiable/Basic.lean`; Convention 5) with
  its closure and transport API, among it `TauCeti.CountablyRectifiable.mono` (arbitrary subsets),
  `TauCeti.CountablyRectifiable.mono_ae`, `TauCeti.CountablyRectifiable.congr` (null modification),
  `TauCeti.CountablyRectifiable.of_null`, `TauCeti.CountablyRectifiable.iUnion`,
  `TauCeti.CountablyRectifiable.image` (maps Lipschitz on the set),
  `TauCeti.CountablyRectifiable.isometry_image_iff`, and
  `TauCeti.CountablyRectifiable.exists_bilipschitz_cover` (`…/Bilipschitz.lean`; finite-dimensional
  inner product spaces, Borel pieces with bi-Lipschitz charts).
- Density (`Geometry/Euclidean/Volume/Measure.lean`, `MeasureTheory/Covering/HausdorffDensity.lean`):
  `TauCeti.ae_tendsto_euclideanHausdorffMeasure_inter_closedBall_div` (for `A` null-measurable for
  `μHE[k]` with finite measure, the ratio `μHE[k](A ∩ closedBall x r)/(ω_k rᵏ)` tends to `0` at
  `μHE[k]`-almost every `x` outside `A`), `TauCeti.ae_tendsto_hausdorffMeasure_inter_closedBall_div` (the
  raw form); `MeasureTheory.Measure.mul_hausdorffMeasure_le_measure` (for an outer regular `μ` and
  `d ≥ 0`: if at every `x ∈ A`, `c (2r)^d ≤ μ(closedBall x r)` for arbitrarily small `r > 0`, then
  `c · μH[d](A) ≤ μ(A)`) and its normalized form `MeasureTheory.Measure.mul_euclideanHausdorffMeasure_le_measure`
  (the same with `c ω_k rᵏ` and `μHE[k]`).
- Area formula (`MeasureTheory/Function/AreaFormula/`): `LipschitzWith.lintegral_normDet_fderiv_mul_eq_lintegral_tsum`
  (Lipschitz `f` between finite-dimensional inner product spaces, Lebesgue-measurable `s`, measurable
  weight; the fibre sums are taken in `[0, ∞]`), `LipschitzWith.lintegral_normDet_fderiv_eq_lintegral_encard`
  (the unweighted form, an infinite fibre counting `∞`),
  `LipschitzWith.lintegral_image_eq_lintegral_normDet_fderiv_mul` and
  `LipschitzWith.lintegral_normDet_fderiv_eq_euclideanHausdorffMeasure_image` (injective on a
  measurable `s`),
  `LipschitzWith.integral_normDet_fderiv_mul_eq_integral_tsum` (real-valued form for a weight with
  values in `ℝ≥0`, under integrability),
  `LipschitzWith.euclideanHausdorffMeasure_image_setOf_normDet_fderiv_eq_zero` (Lipschitz Sard).
- Graphs, spheres, polar integration: `TauCeti.euclideanHausdorffMeasure_normalGraphEmbedding_image_eq_lintegral_sqrt_one_add_norm_fderiv_sq`
  (`MeasureTheory/Function/AreaFormula/Graph.lean`; for `φ : E → ℝ` differentiable at every point of a
  measurable `s`, the graph `y ↦ (φ y, y)` in `WithLp 2 (ℝ × E)` of `s` has `μHE[dim E]` measure
  `∫_s √(1 + ‖∇φ‖²)`), with the linear algebra `ContinuousLinearMap.normDet_normalGraphL`,
  `DifferentiableAt.normDet_fderiv_normalGraphEmbedding`, `LinearMap.normDet_coprod_of_orthogonal` and
  `LinearMap.det_one_add_comp_comm` (`Analysis/InnerProductSpace/NormDet.lean`,
  `Analysis/Calculus/FDeriv/WithLp.lean`, `LinearAlgebra/Determinant/Basic.lean`); `TauCeti.euclideanHausdorffMeasure_sphere`
  (`r > 0`: `μHE[n − 1] (sphere c r) = n · volume (ball 0 1) · r^{n−1}`),
  `TauCeti.toSphere_volume_eq_comap_euclideanHausdorffMeasure` (Mathlib's angular measure),
  `TauCeti.lintegral_eq_lintegral_Ioi_setLIntegral_sphere`, `TauCeti.integral_eq_integral_Ioi_setIntegral_sphere`,
  `TauCeti.volume_inter_ball_eq_lintegral_Ioo_euclideanHausdorffMeasure_inter_sphere`,
  `TauCeti.ae_hasDerivAt_measureReal_inter_ball` (for Lebesgue-measurable `s`, at almost every `r` the
  derivative of `ρ ↦ |s ∩ ball c ρ|` is `μHE[n − 1](s ∩ sphere c r)`) (`Geometry/Euclidean/Volume/`),
  `TauCeti.hausdorffMeasure_zero_eq_count`,
  `TauCeti.euclideanHausdorffMeasure_eq_smul_hausdorffMeasure` (`μHE[k] = (ω_k / 2ᵏ) • μH[k]`),
  `Submodule.lintegral_setLIntegral_preimage_orthogonalProjectionOnto` (slicing).
- Coarea (`MeasureTheory/Function/Coarea/`): `LinearMap.lintegral_setLIntegral_preimage_singleton`
  (linear maps, a.e.-measurable weight on the whole space) and
  `LinearMap.lintegral_euclideanHausdorffMeasure_inter_preimage_singleton` (linear maps, unweighted, a
  null-measurable `s`);
  `MeasureTheory.lintegral_euclideanHausdorffMeasure_inter_preimage_eq_lintegral_normDet_adjoint_fderiv`
  (`f` differentiable with surjective derivative at every point of a Lebesgue-measurable `s`;
  unweighted); `MeasureTheory.ae_euclideanHausdorffMeasure_inter_preimage_eq_zero_of_hasFDerivWithinAt`
  (a Lebesgue-null set `N` at every point of which `f` has a derivative within `N` meets almost every
  fibre in a null set); Eilenberg's null-set form `LipschitzOnWith.ae_euclideanHausdorffMeasure_inter_preimage_eq_zero`
  (for `f` Lipschitz on `A` into a space of dimension `m` and `μHE[m + k] A = 0`, almost every fibre
  of `A` is `μHE[k]`-null); `LinearMap.normDet_adjoint_pos_iff`
  (the coarea Jacobian of a linear map is positive exactly when it is surjective); Eilenberg's
  inequality `LipschitzOnWith.lintegral_hausdorffMeasure_inter_preimage_le` with
  `LipschitzOnWith.ae_euclideanHausdorffMeasure_inter_preimage_lt_top`; unweighted fibre measurability
  `LipschitzOnWith.aemeasurable_euclideanHausdorffMeasure_inter_preimage`.

**Layer 3 group** (`Analysis/BoundedVariation/`; `E` a finite-dimensional real inner product space,
`Ω : Opens E`, Haar-dependent statements with `[μ.IsAddHaarMeasure]`, used here with `volume`).
- `TauCeti.totalVariationOn` (Convention 6) with `TauCeti.totalVariationOn_congr_ae`, `TauCeti.totalVariationOn_mono`,
  `TauCeti.totalVariationOn_add_le`, `TauCeti.totalVariationOn_le_liminf` (lower semicontinuity under `L¹` convergence on
  compact subsets).
- `TauCeti.variationMeasure` (a regular measure on `Ω`, `0` when `u` is not in `BV_loc(Ω)`) with
  `TauCeti.variationMeasure_preimage_coe` (its value on an open `U ≤ Ω` is `|Du|(U)`), `TauCeti.eq_variationMeasure`,
  `TauCeti.variationMeasure_eq_comap_inclusion`.
- Test fields: `TestFunction.divergenceCLM` (`Analysis/Distribution/TestFunction/Divergence.lean`; the
  divergence `𝓓(Ω, E) →L[ℝ] 𝓓(Ω, ℝ)`).
- `TauCeti.polarDensity` with `TauCeti.integral_divergenceCLM_mul_eq_neg_integral_inner_polarDensity`,
  `TauCeti.integral_lineDeriv_mul_eq_neg_integral_mul_inner_polarDensity` (the componentwise identity
  `∫ u ∂_v ψ = −∫ ψ ⟪v, σ_u⟫ d|Du|`), `TauCeti.ae_norm_polarDensity_eq_one`, `TauCeti.ae_eq_polarDensity`;
  `TauCeti.acDerivativeDensity` with `TauCeti.withDensity_enorm_acDerivativeDensity_add_singularPart`
  (Lebesgue decomposition); `TauCeti.exists_regular_lineDeriv_ofFun_apply_eq` (for a direction `v`, a
  pair of regular measures `ν₁`, `ν₂` on `Ω`, possibly infinite, with `∂_v u(ψ) = ∫ ψ dν₁ − ∫ ψ dν₂`;
  the pair is not unique).
- `MeasureTheory.VectorMeasure.ext_of_integral_eq_on_compactlySupported`
  (`MeasureTheory/VectorMeasure/Uniqueness.lean`; real or complex vector measures on a locally compact
  space with regular variation and equal integrals against compactly supported continuous functions
  are equal).
- `TauCeti.MemBV`, `TauCeti.memBV_congr_ae`; `TauCeti.BV` (normed, with `[OpensMeasurableSpace E]`;
  complete by `TauCeti.BV.instCompleteSpace`), `TauCeti.BV.restrictL` (restriction to an open `U ≤ Ω`, a
  continuous linear map of norm at most one);
  `TauCeti.MemBV.comp_lipschitz` (`g` Lipschitz with `g 0 = 0`) and
  `TauCeti.totalVariationOn_comp_lipschitz_le`; `TauCeti.totalVariationOn_mul_le` (smooth bounded
  cutoffs, variation level).
- Transport: `LinearIsometryEquiv.totalVariationOn_comp`, `AffineIsometryEquiv.totalVariationOn_comap`,
  `TauCeti.totalVariationOn_comp_add_right`, `TauCeti.totalVariationOn_comp_smul` (dilation by `r > 0`
  multiplies the variation by `r / rⁿ`), with the perimeter analogues `LinearIsometryEquiv.perimeter_preimage`,
  `TauCeti.perimeter_preimage_add_right`, `TauCeti.perimeter_preimage_smul` (the same factor `r / rⁿ` for
  the preimage) and `TauCeti.perimeter_smul` (`[Nontrivial E]`: the image `r • s` in `r • V` has perimeter
  `r^{n−1}` times that of `s` in `V`).
- Weak derivatives: `TauCeti.HasWeakFDerivOn.totalVariationOn_eq_setLIntegral_enorm`,
  `TauCeti.HasWeakFDerivOn.variationMeasure_eq_withDensity` (Haar: the variation measure of a weakly
  differentiable `u` is `‖∇u‖ₑ` times the measure on `Ω`),
  `TauCeti.HasWeakFDerivOn.totalVariationOn_lt_top_iff_integrableOn`, `TauCeti.exists_hasWeakFDerivOn_iff`
  (weakly differentiable iff `BV_loc` with `|Du|` absolutely continuous),
  `TauCeti.MemBV.exists_hasWeakFDerivOn_integrableOn`; from the Sobolev side `TauCeti.W1p`,
  `TauCeti.W1p.hasWeakFDerivOn` and `TauCeti.mem_w1pSubmodule_iff_hasWeakFDerivOn`
  (`Analysis/Sobolev/W1p/Basic.lean`).
- Integration by parts and smooth calculus: `TauCeti.integral_trace_fderiv_mul_eq_neg_integral_inner_polarDensity`
  (`C¹` fields with compact support in `Ω`), `LocallyLipschitzOn.totalVariationOn_eq_setLIntegral_enorm_fderiv`.
- One dimension (`…/OneDimensional.lean`, `…/Real.lean`): `BoundedVariationOn.totalVariationOn_le_variation_vectorMeasure`,
  `BoundedVariationOn.integral_deriv_smul_eq_neg_integral_vectorMeasure`, `BoundedVariationOn.totalVariationOn_lt_top`,
  `TauCeti.Real.ofReal_sum_abs_sub_le_totalVariationOn`, `TauCeti.Real.perimeter_Ioo` (for `a < b`, the
  interval `(a, b)` has perimeter `2` in `ℝ`).
- Cantor–Lebesgue function (`Analysis/SpecialFunctions/CantorFunction.lean`): `TauCeti.cantorFunction`,
  `TauCeti.continuous_cantorFunction`, `TauCeti.monotone_cantorFunction`, `TauCeti.cantorFunction_zero`,
  `TauCeti.cantorFunction_one`, `TauCeti.eVariationOn_cantorFunction`, `TauCeti.ae_hasDerivAt_cantorFunction`,
  `TauCeti.not_absolutelyContinuousOnInterval_cantorFunction`, `TauCeti.cantorStieltjesFunction`,
  `TauCeti.cantorStieltjesFunction_measure_compl_cantorSet`,
  `TauCeti.mutuallySingular_cantorStieltjesFunction_measure_volume`.

**Layer 4 group** (`Analysis/BoundedVariation/`).
- `TauCeti.tendsto_integral_inner_polarDensity_of_tendsto_lintegral_enorm_sub` (weak convergence of
  `Du_j` under locally bounded variation and `L¹_loc` convergence).
- Compactness: `TauCeti.isCompact_closure_of_setLIntegral_le_of_totalVariationOn_le`,
  `TauCeti.exists_subseq_tendsto_setLIntegral_enorm_sub_of_totalVariationOn_le`,
  `TauCeti.exists_subseq_tendsto_measure_symmDiff_inter_of_perimeter_le` (sets of locally bounded
  perimeter, no volume bound).
- Convolution and approximation: `TauCeti.totalVariationOn_convolution_le`,
  `TauCeti.tendsto_totalVariationOn_normed_convolution` (whole space),
  `TauCeti.exists_mollifier_seq_of_isCompact_closure`,
  `MeasureTheory.Integrable.exists_contDiff_hasCompactSupport_strict_approximation` (whole space).
- Scalar coarea (`…/Coarea.lean`, `…/Truncation.lean`): `TauCeti.totalVariationOn_eq_lintegral_perimeter`
  (`u` locally integrable on `Ω`; finite or infinite), `TauCeti.measurable_perimeter_setOf_lt`,
  `TauCeti.ae_perimeter_setOf_lt_lt_top`, `TauCeti.variationMeasure_apply_eq_lintegral`,
  `TauCeti.integral_divergenceCLM_mul_eq_integral_integral_indicator` (layer cake),
  `TauCeti.totalVariationOn_max_min_const_eq_lintegral_perimeter` (truncation),
  `LocallyLipschitzOn.lintegral_perimeter_eq_setLIntegral_enorm_fderiv`.
- Sets: `MeasureTheory.NullMeasurableSet.exists_smooth_perimeter_approximation` (a Lebesgue-measurable
  set of finite volume, whole space; smooth superlevel sets at regular levels with compact closure),
  `ContDiff.exists_mem_Ioo_surjective_fderiv_perimeter_le` (`…/RegularLevel.lean`; a regular level in
  every interval with perimeter bounded by the variation over the interval's length),
  `Continuous.frontier_setOf_lt_eq_of_fderiv_ne_zero` (`Analysis/Calculus/FDeriv/LevelSet.lean`; for
  `u` continuous on `E` with nonzero derivative at every point of the level set, the frontier of the
  superlevel set is the level set), and Sard's theorem on a set
  `TauCeti.addHaar_image_criticalPoints_eq_zero` (`Analysis/Calculus/Sard/OutermostStratum.lean`;
  for `f` of class `C^k` at every point of a set `U`, `k ≥ (dim E)² + 1`, met by `C^∞` maps, the
  critical values of `f` on `U` are Haar-null) with its global form
  `ContDiff.addHaar_image_criticalPoints_eq_zero`.
- Inequalities: `TauCeti.setLIntegral_enorm_sub_setAverage_le_mul_totalVariationOn_of_eq_ball` (BV
  Poincaré on a ball), `TauCeti.eLpNorm_le_totalVariationOn` (BV Sobolev),
  `TauCeti.min_measure_inter_measure_sdiff_rpow_le_perimeter` (`2 ≤ n`, the ball inside `Ω`, a constant
  depending only on `n` and the measure of the unit ball).

**Layer 5 group.**
- `TauCeti.perimeter` (Convention 7) with `TauCeti.perimeter_eq_iSup`, `TauCeti.perimeter_congr_ae`, `TauCeti.perimeter_mono`,
  `TauCeti.perimeter_compl` (Haar), `TauCeti.perimeter_le_liminf`, `TauCeti.perimeter_union_add_perimeter_inter_le`,
  `TauCeti.perimeter_inter_ball_le_add_liminf`, `TauCeti.ae_perimeter_inter_ball_le` (for null-measurable
  `s`, at almost every `r`, `P(s ∩ ball x₀ r) ≤ P(s; ball x₀ r)` plus the derivative of
  `ρ ↦ |s ∩ ball x₀ ρ|`), `TauCeti.perimeter_ball` and `TauCeti.perimeter_closedBall` (`r > 0`: perimeter
  `n ω_n r^{n−1}` in the whole space), `TauCeti.perimeter_setOf_inner_lt` (for a unit `ν`, the
  half-space `{⟪x, ν⟫ < c}` has perimeter in `Ω` the `μHE[n − 1]` measure of the hyperplane piece in
  `Ω`), `TauCeti.perimeter_ball_setOf_inner_lt` (the half-space `{⟪y, ν⟫ < ⟪x, ν⟫}` bounded by the
  hyperplane through the centre has perimeter `ω_{n−1} r^{n−1}` in `ball x r`),
  `Convex.perimeter_lt_top`.
- Density (`MeasureTheory/Covering/EssentialBoundary.lean`): `TauCeti.HasDensityAt`,
  `TauCeti.essentialInterior`, `TauCeti.essentialExterior`, `TauCeti.essentialBoundary`, with
  `TauCeti.ae_hasDensityAt_indicator`, `TauCeti.measure_essentialBoundary` (null-measurable `s`),
  `TauCeti.essentialBoundary_congr_ae`, `TauCeti.essentialBoundary_compl`, `TauCeti.essentialBoundary_subset_frontier`.
- Reduced boundary (`Analysis/BoundedVariation/ReducedBoundary.lean`): `TauCeti.reducedBoundary`,
  `TauCeti.outerNormal` (Convention 8), `TauCeti.norm_outerNormal`, `TauCeti.ae_mem_reducedBoundary`, `TauCeti.ae_outerNormal_eq`,
  `TauCeti.reducedBoundary_eq_empty_of_not` (empty unless `s` has locally finite perimeter in `Ω`),
  `TauCeti.reducedBoundary_congr_ae`, `TauCeti.reducedBoundary_compl`, `TauCeti.reducedBoundary_subset_frontier`,
  `TauCeti.integral_trace_fderiv_mul_indicator_eq_integral_inner_outerNormal` (Gauss–Green against
  `|Dχ_s|` for `C¹` fields with compact support in `Ω`), and `TauCeti.reducedBoundary_subset_essentialBoundary`
  (`…/LowerDensityEstimates.lean`, `2 ≤ n`).
- Density estimates and blow-up pieces: `TauCeti.eventually_variationMeasure_closedBall_le`,
  `TauCeti.eventually_ofReal_pow_le_mul_measure_inter_ball` and `TauCeti.eventually_ofReal_pow_le_mul_perimeter_ball`
  (both `2 ≤ n`, through the Hölder conjugate exponent), `TauCeti.eventually_neg_le_integral_divergenceCLM_mul_indicator_preimage`,
  `TauCeti.integral_divergenceCLM_mul_indicator_nonneg_of_tendsto_measure_symmDiff_inter` (`…/BlowUp.lean`),
  `TauCeti.ae_eq_setOf_inner_lt_of_ae_outerNormal_eq` (`…/HalfSpace.lean`; a set of locally finite
  perimeter in the whole space with constant normal is a.e. empty, everything or a half-space).

**Layer 6 group.**
- Lipschitz domains (`Analysis/Sobolev/LipschitzDomain/`): `Set.IsLipschitzDomainWith` (open, a
  Lipschitz graph chart with constant `L` at every frontier point, ambient `WithLp 2 (ℝ × E)`),
  `Set.IsLipschitzChartWith.lintegral_frontier_inter_eq` (surface measure in a chart),
  `TauCeti.isLipschitzDomainWith_of_contDiffAt` (`…/ContDiff.lean`; at each frontier point a chart whose
  graph function `φ` has `ContDiffAt ℝ 1 φ 0` and `‖fderiv ℝ φ 0‖ < L`, with one `L` for all points,
  gives `Set.IsLipschitzDomainWith`), `TauCeti.W1p.frontierTrace` (bounded
  trace `W^{1,p}(Ω) → Lᵖ(∂Ω, μHE[dim E])` for `1 ≤ p < ∞` on a bounded Lipschitz domain, restriction on
  functions continuous up to the boundary), `TauCeti.W1p.exists_extensionL_of_isLipschitzDomainWith`
  (a continuous linear right inverse of restriction `W^{1,p}(ℝⁿ) → W^{1,p}(Ω)`, with no explicit form),
  `TauCeti.W1p.lipschitzChartExtensionL` (`…/Extension.lean`; the explicit extension through one
  Lipschitz chart: cutoff, reflection across the graph in flattened coordinates, return to the original
  coordinates).
- `TauCeti.setIntegral_setOf_inner_lt_trace_fderiv` (`MeasureTheory/Integral/DivergenceTheorem/InnerHalfSpace.lean`;
  the divergence theorem on a half-space against `μHE[n − 1]`).
- Planar topology (ConformalMapping §5.3): `TauCeti.filledHull` (`Topology/FilledHull.lean`),
  `TauCeti.IsJordanCurve` (`Topology/JordanCurve/Basic.lean`),
  `TauCeti.IsJordanCurve.frontier_filledHull_sdiff` (`Analysis/Complex/PlaneSeparation/Inside.lean`;
  the inside has frontier `C`).
- Winding numbers (ContourIntegration Layer 0, with the absolutely continuous index calculus named in
  DifferentialGeometry 5.6.1): `TauCeti.Contour.windingNumber`;
  `AbsolutelyContinuousOnInterval.windingNumber_eq_zero_of_unbounded_component` (closed absolutely
  continuous curves: the index vanishes on the unbounded complementary component of the trace);
  `AbsolutelyContinuousOnInterval.windingNumber_comp_of_monotoneOn` and
  `AbsolutelyContinuousOnInterval.windingNumber_comp_of_antitoneOn`
  (`Analysis/Contour/Winding/AbsolutelyContinuous/Reparam.lean`; for `γ` absolutely continuous on
  `[c, d]` and `θ` absolutely continuous and monotone on `[a, b]`, `a ≤ b`, mapping the endpoints to
  `c, d` in the monotone case and to `d, c` in the antitone case, the index of `γ ∘ θ` on `[a, b]` off
  the trace is that of `γ` on `[c, d]`, respectively its negative).
- Green (DifferentialGeometry 5.6.3): `TauCeti.Green.green_ac_winding` (`Analysis/Green/Winding.lean`; for `γ` closed
  and absolutely continuous on `[a, b]`, `a < b`, an open `U` containing the trace, `C¹` real `P`, `Q`
  on `U` and the winding number vanishing outside `U`: the circulation of `P dx + Q dy` along `γ` is the
  integral over `U` of the curl weighted by `TauCeti.Green.windingWeight γ a b`, the winding number set
  to `0` on the trace, with both sides integrable), and its index-one flux form
  `TauCeti.Green.green_ac_flux` (`Analysis/Green/IndexOne.lean`; for `γ` closed and absolutely
  continuous with index `1` throughout the inside `Ω` of its trace and `C¹` real `X`, `Y` on an open set
  containing `filledHull`: `∫_Ω (∂ₓX + ∂ᵧY) = ∫_a^b (X(γ) Im γ' − Y(γ) Re γ')`, both sides integrable).
- Signed area: `TauCeti.signedArea` (`½ ∫_a^b (x y' − y x')` with `deriv γ`) and
  `TauCeti.signedArea_eq_intCast_mul_volume_real_of_windingNumber_eq`
  (`Analysis/Green/Examples/CurveArea/Winding.lean`; for `γ` closed and absolutely continuous on
  `[a, b]`, `a < b`, whose index is an integer `n` throughout the inside of its trace, the signed area
  is `n` times the area of the inside).

### From TauCetiRoadmap.PDE

§1.1–§1.3 (weak derivatives, `W^{1,p}`, density) and §1.6 (the Lipschitz-domain predicate, boundary
charts, graph surface measure, Sobolev trace and extension), consumed through the Tau Ceti
declarations above; only the conventions of those sections are assumed beyond them.

### From TauCetiRoadmap.ConformalMapping (Completed)

§5.3, the Jordan curve theorem: for every Jordan curve `C ⊆ ℂ`, `ℂ \ C` has two components, the bounded
one `filledHull C \ C` with frontier `C`. Consumed through `TauCeti.IsJordanCurve.frontier_filledHull_sdiff`.

### From TauCetiRoadmap.ContourIntegration (Completed)

Layer 0, the generalized winding number `TauCeti.Contour.windingNumber`, for §6.4.

### From TauCetiRoadmap.DifferentialGeometry

5.6.1, the index calculus of closed absolutely continuous curves (vanishing on the unbounded
component, reparametrization laws) on Tau Ceti's declarations named above, for §6.4; 5.6.3, Green's identity for closed absolutely continuous curves (Tau Ceti's `TauCeti.Green.green_ac_winding`),
for §6.4; 12.5, the divergence theorem on a manifold with boundary, for the smooth-domain comparison of
§6.2 only.

## References

- Francesco Maggi, *Sets of Finite Perimeter and Geometric Variational Problems*, Cambridge University
  Press, 2012, DOI 10.1017/CBO9781139108133, with its contents, synopses and index on
  [CVGMT](https://cvgmt.sns.it/paper/1880/): the approximation of sets of finite perimeter by smooth
  sets (§13.2) and Federer's theorem (Chapter 16), Layer 5.
- Leon Simon, [*Lectures on Geometric Measure Theory*](https://maths.anu.edu.au/files/CMAProcVol3-Complete_1.pdf),
  Proceedings of the Centre for Mathematical Analysis 3, Australian National University, 1983:
  approximate tangent planes and the area and coarea formulas on rectifiable sets (§§8 and 10–12,
  Layer 2), BV functions (§6, Layers 3–4) and sets of locally finite perimeter (§14, Layers 4–6).
- Gabriele Anzellotti and Mariano Giaquinta, [*Funzioni BV e tracce*](http://www.numdam.org/item/RSMUP_1978__60__1_0/),
  Rend. Sem. Mat. Univ. Padova 60 (1978), 1–21: strict approximation on open sets (§4.1), the
  perimeter of open sets whose boundary has finite `Hⁿ⁻¹` measure (§6.2) and BV traces (§6.3).
- Herbert Federer, [*A note on the Gauss–Green theorem*](https://doi.org/10.1090/S0002-9939-1958-0095245-2),
  Proc. Amer. Math. Soc. 9 (1958), 447–451: the perimeter of planar regions bounded by simple closed
  curves (§6.4).
- Prior formalizations, sources of mathematical and API evidence rather than dependencies or prescribed
  proofs: [MovingSofa](https://github.com/deancureton/MovingSofa) (Jordan-curve area and Hausdorff-length
  developments, Layers 1 and 6); the [Humanfia public source archive](https://huggingface.co/datasets/humanfia-lab/lean-eval-source/tree/main/problems/isoperimetric_inequality),
  [Jonathan Ho's isoperimetric development](https://github.com/hojonathanho/isoperimetric) (also
  [in LeanPool](https://github.com/LeanPool/lean-pool/tree/main/LeanPool/Isoperimetric)) and
  [kim-em/isoperimetric](https://github.com/kim-em/isoperimetric), whose relation to the target
  Isoperimetry describes. Any use of existing code follows the repository's coordination and attribution
  rules; the targets are judged against the intrinsic statements above.
