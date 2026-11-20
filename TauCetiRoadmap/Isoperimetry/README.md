# Roadmap: Euclidean isoperimetry, sharp inequalities and rigidity

**Summary.** For a Lebesgue-measurable set `E` in `n`-dimensional Euclidean space let `|E|` be
its volume, `P(E)` its perimeter (the total variation of its indicator function, which is the
area of its boundary when the boundary is smooth), and `ω_n` the volume of the unit ball. The
isoperimetric inequality `P(E)ⁿ ≥ nⁿ ω_n |E|ⁿ⁻¹`, for `|E| < ∞`, says that among sets of a given
volume balls have the least perimeter. This roadmap builds the theory around it in every
dimension `n ≥ 2`: its equality cases, its classical form for plane curves, and the sharp
Sobolev inequality equivalent to it, with the symmetrization and convex geometry they need. Sets
matter up to null sets, quantities lie in `[0, ∞]`, and no boundedness, connectedness or boundary
regularity is assumed unless a statement says so.

The first main theorem is rigidity. If `n ≥ 2` and `E` is Lebesgue measurable with
`0 < |E| < ∞`, then `P(E)ⁿ = nⁿ ω_n |E|ⁿ⁻¹` if and only if `E` agrees with a ball of positive
radius up to a null set. The null set is essential: a ball without its centre has the volume and
the perimeter of the ball. As a corollary, every set `E` of finite volume, measurable or not,
satisfies `nⁿ ω_n |E|ⁿ⁻¹ ≤ Hⁿ⁻¹(∂E)ⁿ`, where `∂E` is its frontier and `Hⁿ⁻¹` the
`(n − 1)`-dimensional Hausdorff measure.

The second is the classical planar theorem. If `C` is a Jordan curve in the plane of finite
length `L = H¹(C)` and `A` is the area of the bounded component of its complement, then
`4πA ≤ L²`, with equality if and only if `C` is a circle. The same holds for a closed curve given
by a continuous parametrization of an interval, injective except at the endpoints and of bounded
variation, with `L` its total variation; the parametrization need not be absolutely continuous,
Lipschitz or piecewise smooth.

The third is the sharp Sobolev inequality at the endpoint `p = 1`. If `n ≥ 2` and `u` is
integrable on `ℝⁿ` with total variation `|Du|(ℝⁿ)`, then
`‖u‖_{n/(n−1)} ≤ (n ω_n^{1/n})⁻¹ |Du|(ℝⁿ)`; if moreover `|Du|(ℝⁿ) < ∞` and `u` is not a.e. zero,
equality holds exactly when `u` is a nonzero multiple of the indicator of a ball. On the way the
roadmap proves the Pólya–Szegő principle at `p = 1`: the Schwarz rearrangement of a nonnegative
function in `W¹,¹(ℝⁿ)` lies in `W¹,¹(ℝⁿ)`, and its gradient has no larger `L¹` norm.

The Tau Ceti library supplies the inequality itself, the Prékopa–Leindler and Brunn–Minkowski
inequalities, Steiner symmetrization and Schwarz rearrangement, isoperimetry for convex bodies,
Wirtinger's inequality and the area–energy inequality for closed curves.
[GeometricMeasureTheory](../GeometricMeasureTheory/README.md) supplies De Giorgi's structure
theorem for sets of finite perimeter, the bound `P(E) ≤ Hⁿ⁻¹(∂E)`, and, for a rectifiable Jordan
curve, the identity between the perimeter of its inside and its length, with the Jordan index
theorem.
[ConformalMapping](../../Completed/ConformalMapping/README.md) supplies the inside of a Jordan
curve, [DifferentialGeometry](../DifferentialGeometry/README.md) 5.6 winding numbers and Green's
area identity, and [PDE](../PDE/README.md) Layer 1 weak derivatives and `W¹,ᵖ`; PDE's nonsharp
embeddings do not depend on this roadmap.

## How to read the build

The layers below follow the build, and each opens by recalling what Tau Ceti proves in its area,
which is not planned again. Layer 1 adds the real-valued Prékopa–Leindler inequality. Layer 2
proves that Steiner symmetrization does not increase perimeter, that suitably iterated Steiner
symmetrizations converge to a ball, and that the perimeter of a convex body is the Hausdorff
measure of its boundary. Layer 3 identifies the signed area of a simple closed curve with plus or
minus the area it encloses. Layer 4 proves rigidity, through the slicing theorem and the interval
structure of the sections of a set that Steiner symmetrization does not shorten, and its forms for
the topological frontier, regular open sets and Lipschitz domains. Layer 5 proves Pólya–Szegő in
`BV` and `W¹,¹` and the sharp `BV` Sobolev inequality with its equality cases. Layer 6 proves the
planar theorem for rectifiable Jordan curves and reconciles it with the finite-perimeter and
curve-energy routes. Layers 1–3 do not depend on the sharp inequality; Layers 4–6 use it. Each
*Needs:* line lists what its statement and its route use, item by item, so that a target proved
another way is not blocked behind an unrelated section.

## Conventions

1. **Ambient space.** `E` is a finite-dimensional real inner product space of dimension
   `n = Module.finrank ℝ E`, with its Borel σ-algebra and Lebesgue measure `volume`.
   `EuclideanSpace ℝ (Fin n)` is the model; a statement for one such space transfers to the
   others along linear isometric equivalences, which preserve volume, perimeter and Hausdorff
   measure. In dimension two the oriented real plane is `ℂ`. Write `|s|` for `volume s`, the
   outer volume when `s` is not measurable, and `ω_n = volume (Metric.ball 0 1)`, so `ω_2 = π`.
2. **Hausdorff measure** is Mathlib's normalized Euclidean Hausdorff measure
   `MeasureTheory.Measure.euclideanHausdorffMeasure`, written `μHE[k]` in Lean and `Hᵏ` here; it
   agrees with `volume` on a `k`-dimensional Euclidean space. Any comparison with Mathlib's raw
   Hausdorff measure `μH[k]` is stated explicitly, never made silently.
3. **Variation and perimeter.** For `u : E → ℝ` locally integrable, `|Du|(E)` is Tau Ceti's
   `TauCeti.totalVariationOn volume ⊤ u`, the supremum of `∫ u div φ` over test vector fields
   with `‖φ‖ ≤ 1`, finite or infinite; the perimeter `P(s)` of `s ⊆ E` is Tau Ceti's
   `TauCeti.perimeter volume ⊤ s`, the variation of the indicator of `s`. These are the carriers
   of GeometricMeasureTheory G3–G5. The relative perimeter in an open set `Ω` is
   `TauCeti.perimeter volume Ω s`; a statement uses it only where it says so and proves the
   hypotheses on `Ω` it needs. The headline statements are about whole-space perimeter.
4. **Measurability.** *Lebesgue measurable* means `NullMeasurableSet s volume`; `MeasurableSet`
   is used for Borel sets, and results pass between the two along a.e. equality. Every statement
   about a set is invariant under changing it by a null set unless it says otherwise. The
   Minkowski sum of two measurable sets need not be measurable: statements about it use its
   outer volume.
5. **Values.** Volumes, perimeters, variations and lower integrals take values in `[0, ∞]`, and
   the extended statement is the primary one. A real-valued form carries the finiteness
   hypotheses that make it meaningful; `ENNReal.toReal` is never applied to a quantity not known
   to be finite, so an infinite perimeter is never read as zero, and a Bochner integral is used
   only once integrability is established.
6. **Two kinds of equality.** Equality of sets up to a null set (`s =ᵐ[volume] t`) and literal
   equality are different assertions. Ball rigidity (§4.3) is equality up to a null set; the
   planar equality case (Layer 6) is literal equality of a curve with a circle, and §6.4 proves
   the bridge between them.
7. **Curves.** A curve is `γ : ℝ → ℂ` on an interval `[a, b]` with `a < b`; its trace is
   `γ '' Icc a b` and its length is `eVariationOn γ (Icc a b)`. *Rectifiable* is
   `BoundedVariationOn γ (Icc a b)`; *absolutely continuous* is Mathlib's
   `AbsolutelyContinuousOnInterval γ a b`. A *simple closed curve* is continuous on `[a, b]`,
   has `γ a = γ b`, and is injective on `[a, b)`. A *Jordan curve* is a set `C ⊆ ℂ` with Tau
   Ceti's `TauCeti.IsJordanCurve C` (homeomorphic to the circle), and its *inside* is
   `TauCeti.filledHull C \ C`, the bounded component of its complement; no other predicate for a
   Jordan curve and no other model of its inside is used. The *signed area* of an absolutely
   continuous closed curve is Tau Ceti's `TauCeti.signedArea γ a b = ½ ∫ₐᵇ (x y′ − y x′)`; the
   *geometric signed area* of a continuous curve is Tau Ceti's `TauCeti.rectifiableSignedArea`,
   computed along its arclength parametrization. No statement integrates the derivative of a
   parameter that is not absolutely continuous, and a length inequality uses the total variation
   of the curve, never the energy of an arbitrarily chosen parametrization.
8. **Symmetrization.** For a unit vector `e`, `S_e s` is Tau Ceti's
   `TauCeti.steinerSymmetrization e he s`: on each line parallel to `e` it replaces the section of
   `s` by the open interval of the same length centred on the hyperplane `e⊥ = (ℝ ∙ e)ᗮ` (empty
   for length zero, the whole line for infinite length). Lines are parametrized by Tau Ceti's
   `TauCeti.orthogonalLineEquiv e he : (ℝ ∙ e)ᗮ × ℝ ≃L[ℝ] E`, `(y, t) ↦ y + t • e`, and the
   transverse coordinate `y` carries the volume of the subspace `(ℝ ∙ e)ᗮ`. The Schwarz
   rearrangement of `f : E → [0, ∞]` is Tau Ceti's `TauCeti.schwarzRearrangement volume f`, whose
   superlevel set `{f* > t}` is the centred open ball of volume `|{f > t}|` (the whole space when
   that volume is infinite). For real `u ≥ 0` write `u*` for the real function
   `x ↦ (TauCeti.schwarzRearrangement volume (fun y ↦ ENNReal.ofReal (u y)) x).toReal`.
9. **Convex sets.** Minkowski addition is pointwise addition and scalar multiplication of sets;
   it is not an additive group. Mathlib's `ConvexBody` (nonempty compact convex sets) is used
   where its hypotheses match; positive volume and nonempty interior are separate hypotheses,
   never folded into a definition. For a convex set they are equivalent (Tau Ceti
   `Convex.addHaar_pos_iff_interior_nonempty`).
10. **What a target asks for.** Each target is its full statement. An outer-neighbourhood volume
    inequality without the perimeter comparison, a smooth-only theorem, an area–perimeter
    identity taken as a hypothesis, or an equality hypothesis taken as input does not discharge
    it, and no optimal-transport theorem is an input. Any analytic, geometric or equality lemma
    a route needs and its *Needs:* line does not supply is a target of the same section, and
    every object introduced in a proof receives its basic restriction, invariance and comparison
    API. A *Route* names a route and its inputs; it does not make that route mandatory.
11. **Names.** `Suggested.lean` states the headline theorems in the namespace
    `TauCetiRoadmap.Isoperimetry`; a backticked name of this roadmap's own is declared there, and
    other targets are described in prose.

## Layer 1: Prékopa–Leindler and Brunn–Minkowski

The inequalities of this layer are Tau Ceti's (the supplier contracts below name the
declarations). Lebesgue measure on every finite-dimensional real inner product space has the
Prékopa–Leindler property at every weight `0 ≤ θ ≤ 1`: for measurable `f, g, h : E → [0, ∞]`
with `h((1 − θ)x + θy) ≥ f(x)^(1−θ) g(y)^θ` for all `x, y`, the lower integrals satisfy
`∫ h ≥ (∫ f)^(1−θ) (∫ g)^θ`; the pointwise hypothesis is imposed on the given measurable
representatives, and zero and infinite integrals follow the conventions of `[0, ∞]`. The
property tensorizes over products and is transported by measure-preserving linear maps. The
Brunn–Minkowski inequality `|A + B|^(1/n) ≥ |A|^(1/n) + |B|^(1/n)` holds for nonempty
Lebesgue-measurable `A, B` in positive dimension, with outer volume on the sum, together with its
weighted form for nonnegative coefficients, its multiplicative form and its real-valued forms;
the one-dimensional case holds for compact, Borel and Lebesgue-measurable sets; and for compact
convex `A, B` of positive volume and `c, d > 0`, equality in
`|c • A + d • B|^(1/n) ≥ c |A|^(1/n) + d |B|^(1/n)` holds exactly when `B = v + r • A` for some
vector `v` and some `r > 0`, which with `c = 1 − θ`, `d = θ` is the equality case of the weighted
inequality and with `c = d = 1` that of the unweighted one. Equality in the Prékopa–Leindler
inequality for arbitrary functions is not a target. This layer adds the real-valued form.

### 1.1 Prékopa–Leindler for integrable real functions

Let `0 ≤ θ ≤ 1` and let `f, g, h : E → ℝ` be measurable, nonnegative and integrable, with
`h((1 − θ)x + θy) ≥ f(x)^(1−θ) g(y)^θ` for all `x, y ∈ E`. Prove
`(∫ f)^(1−θ) (∫ g)^θ ≤ ∫ h` for the Bochner integrals and real powers (Tao's exposition,
Theorem 2, stated there in an equivalent form that avoids dilations). The endpoints
`θ ∈ {0, 1}` are monotonicity of the integral, with `x⁰ = 1`. *Route.* Apply Tau Ceti's
inequality to `ENNReal.ofReal ∘ f`, `ENNReal.ofReal ∘ g`, `ENNReal.ofReal ∘ h`, whose pointwise
hypothesis follows from that of `f, g, h` because `ENNReal.ofReal` is monotone and
multiplicative on `[0, ∞)` and commutes with real powers there, and identify the lower integrals
with the Bochner integrals by integrability.
*Needs:* Tau Ceti `TauCeti.hasPrekopaLeindler_volume`, `MeasureTheory.Measure.HasPrekopaLeindler`;
Mathlib `MeasureTheory.ofReal_integral_eq_lintegral_ofReal`, `ENNReal.ofReal_rpow_of_nonneg`.

**Checks.**
- On `ℝ` with `θ = ½`, `f = 1_[0,1]` and `g = 1_[2,3]`: imposing the hypothesis only at `x = y`
  would allow `h = 0`, since the supports are disjoint, and the conclusion `1 ≤ 0` would fail;
  over all pairs the hypothesis forces `h ≥ 1` on `½[0,1] + ½[2,3] = [1, 2]`, so `∫ h ≥ 1`.
- With `f = g = h = exp(−‖x‖²)` the hypothesis holds by convexity of `‖·‖²` and the conclusion
  is an equality, so no constant can be gained.
- Integrability of `h` is needed in the real form: `f = g = 1_[0,1]` and `h = 1` on `ℝ` satisfy
  the hypothesis, and the Bochner integral of the non-integrable `h` is `0` by convention, below
  the left side `1`. The extended form of Tau Ceti has no such hypothesis.

### Examples

- For `A = closedBall 0 r` and `B = closedBall 0 s`, `A + B = closedBall 0 (r + s)` and
  Brunn–Minkowski is an equality, as the equality theorem predicts for homothetic bodies.
- Nonemptiness cannot be dropped when the other set has positive volume: for `A = ∅` and
  `B = ball 0 1`, `A + B = ∅`, and the unweighted inequality would read `0 ≥ ω_n^(1/n)`.
- For `A = {0}` and `B` a ball, `|A + B| = |B|` and the unweighted inequality is an equality
  although `A` is not homothetic to `B`: the equality theorem needs positive volumes.
- On `ℝ`, `A = [0, 1] ∪ [2, 3]` and `B = [0, 1]` give `A + B = [0, 4]`, and `4 > 2 + 1`.

### Dependencies

Tau Ceti's Prékopa–Leindler property; Mathlib's Bochner and lower integrals. No other layer, and
no other roadmap.

## Layer 2: Symmetrization, rearrangements and convex geometry

Tau Ceti's Steiner symmetrization has the measure-theoretic theory of the symmetral: it depends
only on the a.e. class of the set, preserves Borel and Lebesgue measurability, volume, inclusion
and convexity, transforms correctly under translations, dilations and linear isometries,
contracts the volume of symmetric differences (so the `L¹` distance of indicators), is continuous
in its direction, does not increase the second moment `∫_s ‖x‖²` of a Lebesgue-measurable set
(with equality, when that moment is finite, exactly for sets a.e. fixed by it), and, among
Lebesgue-measurable sets of finite volume, fixes in every direction exactly the sets a.e. equal to
centred balls. For bounded convex sets it does not increase perimeter. Tau Ceti's Schwarz
rearrangement is equimeasurable, satisfies the layer-cake formula, preserves every `Lᵖ` norm and
the classes `Lᵖ`, preserves order, contracts `Lᵖ` distances for `1 ≤ p ≤ ∞`, satisfies the
Hardy–Littlewood inequality and preserves Lipschitz bounds; Layer 5 adds its comparisons for `BV`
and `W¹,¹`.
Tau Ceti also proves isoperimetry for convex bodies of positive volume with equality exactly for
closed balls; the identification of the perimeter of a compact convex set with nonempty interior
as the right derivative at `0` of its outer parallel volume `t ↦ |K + t • closedBall 0 1|`; the
right derivative `2 Hⁿ⁻¹(K)` of that function for a compact set in an affine hyperplane and `0` in
codimension at least two; and the isodiametric inequality `|s| ≤ ω_n (diam s / 2)ⁿ` for bounded
`s`, with equality for Lebesgue-measurable `s` exactly when `s` agrees a.e. with a closed ball of
radius `diam s / 2`, and literally for nonempty closed `s`. This layer adds the following.

### 2.1 Steiner symmetrization does not increase perimeter

Prove that for every unit vector `e` and every Lebesgue-measurable `s ⊆ E` of finite volume,
`P(S_e s) ≤ P(s)` (Maggi, §14.1). The inequality is trivial when `P(s) = ∞`. *Route.* By Tau
Ceti's smooth approximation, approximate `s` by bounded open sets `s_j` with smooth compact
frontier, `|s_j ∆ s| → 0` and `P(s_j) → P(s)`. For such a set the lower outer Minkowski content
`liminf_{ε→0⁺} |thickening ε s_j \ s_j| / ε` equals `Hⁿ⁻¹(frontier s_j)`, by the volume of thin
outer collars of a compact smooth hypersurface, and `Hⁿ⁻¹(frontier s_j) = P(s_j)` by
GeometricMeasureTheory G6's comparison of perimeter with surface measure on `C¹` domains. So Tau
Ceti's comparison of the perimeter of a Steiner symmetral with that content, applied to the
closure of `s_j`, which differs from `s_j` by a null set, gives `P(S_e s_j) ≤ P(s_j)`. The
contraction of symmetric differences gives `|S_e s_j ∆ S_e s| → 0`, and lower semicontinuity of
perimeter under `L¹` convergence gives `P(S_e s) ≤ liminf P(S_e s_j) ≤ P(s)`. The identity of the
Minkowski content of a smooth set with the measure of its frontier and the limit argument are
part of the target. Perimeter nonincrease obtained by approximation does not give the
slice-by-slice comparison that rigidity needs; that is §4.1–§4.2.
*Needs:* GeometricMeasureTheory G6 (perimeter of `C¹` domains); Tau Ceti
`MeasureTheory.NullMeasurableSet.exists_smooth_perimeter_approximation`,
`TauCeti.perimeter_steinerSymmetrization_le_liminf`,
`TauCeti.volume_steinerSymmetrization_symmDiff_le`, `TauCeti.nullMeasurableSet_steinerSymmetrization`,
`TauCeti.perimeter_le_liminf`.

**Checks.**
- Two unit discs in `ℂ` centred at `±3e`: every line parallel to `e` at distance `|y| < 1` meets
  them in two intervals of total length `4 √(1 − y²)`, so `S_e s` is the open ellipse with
  semi-axes `1` across and `2` along `e`. Its area is `2π`, that of `s`, and its perimeter is
  about `9.69`, below `P(s) = 4π ≈ 12.57`.
- A variant that replaced each section by a centred interval of length its diameter, rather than
  its measure, would send the same two discs to a set of area `12 + π ≈ 15.14`: it would not even
  preserve volume.
- For a ball, `S_e (ball c r) = ball (c − ⟪e, c⟫ • e) r` (Tau Ceti `TauCeti.steinerSymmetrization_vadd`
  and `TauCeti.steinerSymmetrization_ball_zero`), a translate, so the inequality is an equality in
  every direction.

### 2.2 Iterated Steiner symmetrization converges to the ball

Prove that for every Lebesgue-measurable `s ⊆ E` with `0 < |s| < ∞` there is a sequence of unit
vectors `e₁, e₂, …` such that the successive symmetrals `s₀ = s`, `s_k = S_{e_k} s_{k−1}` satisfy
`|s_k ∆ B| → 0`, where `B = ball 0 r` with `ω_n rⁿ = |s|` (Volčič, Theorems 3.4 and 3.5, for
bounded sets, with almost every random sequence of directions). *Route.* First for bounded `s` of
finite perimeter: the `s_k` lie in a fixed ball, keep their volume and have `P(s_k) ≤ P(s)` by
§2.1, so they are precompact in `L¹` by Tau Ceti's compactness theorem for sets of bounded
perimeter. Writing `m(t) = ∫_t ‖x‖²`,
choose `e_k` with `m(s_k) ≤ inf_e m(S_e s_{k−1}) + 1/k`; then `m(s_k)` decreases to a limit, and
every `L¹` limit point `L` of the `s_k` is fixed a.e. by every `S_e`, since otherwise
`m(S_e L) < m(L)`, and by continuity of `S_e` in the set and of `m` on sets in a fixed ball some
later step would decrease `m` by a fixed amount. By the fixed-point theorem `L` is a centred ball,
of volume `|s|`, so `L = B`. Then for
arbitrary `s` of finite volume: approximate `s` in volume by bounded sets of finite perimeter, run
the bounded case on the approximants with a diagonal choice of directions, and pass to `s` with
the contraction of symmetric differences, controlling the volume outside large balls. Equality in
a single step is not assumed to imply that a set is a ball.
*Needs:* §2.1; Tau Ceti `TauCeti.exists_subseq_tendsto_measure_symmDiff_inter_of_perimeter_le`,
`TauCeti.lintegral_norm_sq_steinerSymmetrization_le`,
`TauCeti.lintegral_norm_sq_steinerSymmetrization_eq_iff`,
`TauCeti.tendsto_volume_steinerSymmetrization_symmDiff`,
`TauCeti.forall_steinerSymmetrization_ae_eq_iff_exists_ae_eq_ball`,
`TauCeti.volume_steinerSymmetrization`, `TauCeti.volume_steinerSymmetrization_symmDiff_le`.

**Checks.**
- For `s = ball c r` with `c ≠ 0`, symmetrizing along an orthonormal basis `e₁, …, e_n` removes
  one coordinate of the centre at each step, and `s_n = ball 0 r` exactly.
- A centred box `∏ (−a_i, a_i)` is fixed by symmetrization along every coordinate direction, so
  a sequence of coordinate directions does not converge to the ball: the directions have to be
  chosen.
- For `s` the union of two disjoint unit balls the limit is the ball of radius `2^(1/n)`, since
  every step preserves volume.

### 2.3 The surface area of a convex body

Prove that a compact convex `K ⊆ E` with nonempty interior has `P(K) = Hⁿ⁻¹(frontier K) < ∞`, so
that the right derivative at `0` of `t ↦ |K + t • closedBall 0 1|`, which Tau Ceti identifies with
`P(K)`, is the Hausdorff measure of the boundary (Tropp, Lecture 8, for the parallel-volume
normalization). *Route.* The inequality `P(K) ≤ Hⁿ⁻¹(frontier K)` is GeometricMeasureTheory G5's
bound for measurable sets. For the reverse, cover the frontier by finitely many boundary charts
in which `K` is the region above the graph of a convex, hence Lipschitz, function over a
hyperplane, and apply GeometricMeasureTheory G6's identification of perimeter with boundary
measure on Lipschitz domains (or G2's area formula on each graph). A nonempty compact convex `K`
with empty interior has `|K| = 0`, `P(K) = 0` and `frontier K = K`. When its affine span is a
hyperplane, the right derivative of its outer parallel volume is `2 Hⁿ⁻¹(K)`, positive and
finite, so it is neither the perimeter `0` nor the boundary area `Hⁿ⁻¹(K)`; when its affine span
has dimension at most `n − 2`, the derivative, the perimeter and `Hⁿ⁻¹(K)` all vanish.
*Needs:* GeometricMeasureTheory G2, G5 and G6; Tau Ceti
`Convex.hasDerivWithinAt_measureReal_add_smul_closedBall`,
`TauCeti.hasDerivWithinAt_volume_real_add_smul_closedBall_of_finrank_add_one_eq`,
`TauCeti.hasDerivWithinAt_volume_real_add_smul_closedBall_of_finrank_add_two_le`,
`Convex.addHaar_pos_iff_interior_nonempty`, `TauCeti.perimeter_congr_ae`, `TauCeti.perimeter_empty`;
Mathlib `Convex.addHaar_frontier`.

**Checks.**
- For `K = closedBall c r` with `r > 0`, `P(K) = n ω_n rⁿ⁻¹` (Tau Ceti
  `TauCeti.perimeter_closedBall`) and `Hⁿ⁻¹(sphere c r) = n ω_n rⁿ⁻¹` (Tau Ceti
  `TauCeti.euclideanHausdorffMeasure_sphere`).
- For the unit square in `ℂ`, `|K + t • closedBall 0 1| = 1 + 4t + πt²`, with right derivative
  `4 = P(K) = H¹(frontier K)`.
- For a segment `K` of length `ℓ` in `ℂ`, `P(K) = 0`, `H¹(frontier K) = ℓ` and
  `|K + t • closedBall 0 1| = 2ℓt + πt²` has right derivative `2ℓ`: three different numbers, so
  the identity of this section needs the nonempty interior.

### Examples

- The Schwarz rearrangement of the indicator of `ball c r` is the indicator of `ball 0 r` (Tau Ceti
  `TauCeti.schwarzRearrangement_indicator`).
- The equilateral triangle of side `1` has diameter `1` and area `√3/4 ≈ 0.433`, below
  `π (1/2)² ≈ 0.785`: the isodiametric inequality is strict, as its equality case predicts.
- The unit cube in `ℝ³` has `P = 6` and `6³ = 216 > 27 · (4π/3) ≈ 113.1`, a strict case of convex
  isoperimetry.

### Dependencies

GeometricMeasureTheory G2, G5 and G6; Tau Ceti's symmetrization, rearrangement, parallel-volume,
convex-isoperimetry and isodiametric theory. Layer 1 is not used. Nothing in this layer depends
on the sharp isoperimetric inequality.

## Layer 3: Sharp periodic inequalities and curve energy

Tau Ceti proves the sharp periodic Wirtinger inequality
`∫ₐᵇ ‖f − ⨍f‖² ≤ ((b − a)/(2π))² ∫ₐᵇ ‖f′‖²` for absolutely continuous `f` with `f a = f b`
valued in any finite-dimensional real inner product space (so real- and complex-valued), with
square-integrable derivative and no mean-zero hypothesis, with equality exactly when
`f − ⨍f = cos(2πt/(b − a)) • u + sin(2πt/(b − a)) • v` on `[a, b]`; the same for weakly
differentiable functions and on the canonical `W¹,²` space, equality holding a.e. It proves the
area–energy inequality `4π |signedArea γ a b| ≤ (b − a) ∫ₐᵇ ‖γ′‖²` for absolutely continuous
closed curves with square-integrable derivative, with equality exactly for constant curves and
circles traversed once at constant angular speed in either orientation, and the equivalent a.e.
equation `γ′ = (± 2πi/(b − a)) (γ − c)`. It identifies the signed area with the integral of the
winding-number weight of DifferentialGeometry 5.6, and with `k` times the area of the inside when
the winding number is the constant `k` there. For curves of bounded variation it has the
arclength parametrization, the constant-speed energy identity `(b − a) ∫ₐᵇ ‖γ′‖² = L²`, the
bound `L² ≤ (b − a) ∫ₐᵇ ‖γ′‖²` for absolutely continuous curves, the geometric signed area with
independence of the factorization, agreement with the derivative integral for absolutely
continuous parameters, invariance under increasing and sign change under decreasing continuous
reparametrizations, and, for continuous closed curves, the sharp inequality
`4π |rectifiableSignedArea γ a b| ≤ L²` with equality exactly for a constant curve and for a
circle traversed once at constant speed relative to arclength. This layer
adds the identification of the signed area of a simple closed curve with the area it encloses.

### 3.1 Signed area of a simple closed curve

Let `γ` be a rectifiable simple closed curve on `[a, b]` with trace `C`. Prove that `C` is a
Jordan curve: `γ` induces a continuous bijection from the circle, the quotient of `[a, b]`
identifying its endpoints, onto the Hausdorff space `C`, hence a homeomorphism. Prove that there
is `σ ∈ {1, −1}` with
`rectifiableSignedArea γ a b = σ · |filledHull C \ C|` (Cufí–Verdera, the Theorem of §1 applied to
`f(z) = z̄`, which writes the signed area of a closed rectifiable curve as the integral of its
winding number over the plane), that `σ = 1` exactly when the winding number of the arclength
parametrization of `γ` is `1` on the inside, and that reversing the
orientation of `γ` changes `σ`; for absolutely continuous `γ` the same holds for `signedArea γ a b`.
With it prove that the trace, the length and the inside of `γ ∘ φ` on `[c, d]` are those of `γ` on
`[a, b]` for every continuous nondecreasing `φ` from `[c, d]` onto `[a, b]`. *Route.* By
GeometricMeasureTheory G1 the arclength parametrization of `γ` is again a simple closed curve,
with the same trace; GeometricMeasureTheory G6's Jordan index theorem for it gives the winding
number `σ` on the inside and `0` on the unbounded component; Tau Ceti's identification of the
signed area with `σ` times the area under a constant winding number, and of the geometric signed
area with the signed area of the arclength parametrization, conclude. The length statement is
Mathlib's invariance of variation under monotone reparametrization, and the trace and the inside
are equal sets.
*Needs:* GeometricMeasureTheory G1 and G6; Tau Ceti `TauCeti.IsJordanCurve`,
`TauCeti.signedArea_eq_intCast_mul_volume_real_of_windingNumber_eq`,
`TauCeti.rectifiableSignedArea_eq_signedArea_naturalParameterization`,
`BoundedVariationOn.image_naturalParameterization_Icc`,
`AbsolutelyContinuousOnInterval.rectifiableSignedArea_eq_signedArea`,
`TauCeti.rectifiableSignedArea_comp_of_antitoneOn`; Mathlib `eVariationOn.comp_eq_of_monotoneOn`.

**Checks.**
- `circleMap c r` on `[θ, θ + 2π]` has signed area `πr²` (Tau Ceti `TauCeti.signedArea_circleMap`),
  `σ = 1` times the area of the disc; the reversed circle gives `−πr²`.
- The circle traversed twice, on `[0, 4π]`, has signed area `2πr²`, twice the area of the disc:
  it is not injective on `[0, 4π)`, and without that hypothesis `σ ∈ {1, −1}` would be false.
- The figure eight `x = cos t`, `y = sin t cos t` on `[0, 2π]` has `x y′ − y x′ = cos³ t`, so its
  signed area is `0`, while its two lobes have positive area; it passes through the origin at
  `t = π/2` and `t = 3π/2`, so it is not simple.

### Examples

- The ellipse `t ↦ a cos t + i b sin t` on `[0, 2π]` has signed area `πab` and energy
  `∫ ‖γ′‖² = π(a² + b²)`, so the area–energy inequality reads `4π² ab ≤ 2π² (a² + b²)`, strict
  for `a ≠ b`. Its Wirtinger inequality is an equality, since `γ − ⨍γ` is a first harmonic: the
  mean-zero Wirtinger equality alone does not force a circle, and the area–energy equality needs
  its own argument.
- For `f = sin(4πt/T)` on `[0, T]`, `∫ f² = T/2` and `∫ f′² = (4π/T)² T/2`, a quarter of the
  sharp constant `(T/(2π))²`; `f = sin(2πt/T)` attains it.

### Dependencies

GeometricMeasureTheory G1 and G6; Tau Ceti's Wirtinger, area–energy and planar Green libraries,
which carry DifferentialGeometry 5.6 and ConformalMapping §5.3. Nothing in this layer depends on
Layers 1, 2 or 4.

## Layer 4: Sharp Euclidean perimeter inequality and ball rigidity

Tau Ceti proves the sharp inequality `P(s)ⁿ ≥ nⁿ ω_n |s|ⁿ⁻¹` for every Lebesgue-measurable `s`
of finite positive volume in dimension `n ≥ 1`, in the extended form, in the root form
`n ω_n^(1/n) |s|^(1 − 1/n) ≤ P(s)` and in a real-valued form for finite perimeter; its proof
contains the case of regular superlevel sets of smooth functions and the approximation of
arbitrary sets of finite volume. A set of volume zero has perimeter zero (perimeter depends only
on the a.e. class), so for `n ≥ 2` the degenerate case reads `0 ≥ 0`. Balls attain equality, with
`P(ball c r) = n ω_n rⁿ⁻¹`, and perimeter scales by `rⁿ⁻¹` under dilation by `r > 0`. The convex
case of rigidity is Tau Ceti's: concavity of `t ↦ |K + t • closedBall 0 1|^(1/n)` for a convex
body `K`, its right derivative `P(K) / (n |K|^((n−1)/n))` at `0`, and the conclusion that a convex
body of positive volume attaining equality is a closed ball. So are essential convexity and
compact convex representatives, used in §4.3. This layer proves rigidity for every
finite-perimeter set and its corollaries.

### 4.1 The slicing theorem for sets of finite perimeter

Let `n ≥ 2`, let `s ⊆ E` be Lebesgue measurable with `0 < |s| < ∞` and `P(s) < ∞`, and let `e` be a
unit vector. Prove that for almost every `y ∈ e⊥` the section `s_y = {t : ℝ | y + t • e ∈ s}` has
finite perimeter in `ℝ`, that its reduced boundary is `{t : y + t • e ∈ ∂*s}`, and that
`⟪ν_s(y + t • e), e⟫ ≠ 0` at each such point, where `∂*s` is the reduced boundary and `ν_s` the
measure-theoretic outer normal, Tau Ceti's `TauCeti.reducedBoundary volume ⊤ s` and
`TauCeti.outerNormal volume ⊤ s` (Maggi, §18.3;
Cagnetti–Colombo–De Philippis–Maggi, Theorem C in §4.4, a form of Vol'pert's theorem, for the
sections of positive length). Include the transport along a.e.
equality: replacing `s` by a set agreeing with it a.e. changes these sections only for a null set
of `y`, the exceptional set depending on `e`. The coordinates `(y, t) ↦ y + t • e` form a
measure-preserving linear equivalence from `e⊥ × ℝ`, with the product of the volumes, onto `E`,
with `‖y + t • e‖² = ‖y‖² + t²`, and almost every section of a Lebesgue-measurable set is
Lebesgue measurable; these are Tau Ceti's and Mathlib's. *Route.* Build the comparison from
GeometricMeasureTheory G2 and G5: the tangential area formula for the projection onto `e⊥` on the
rectifiable set `∂*s`, De Giorgi's structure theorem `|D1_s| = Hⁿ⁻¹ ⌊ ∂*s`, and Tau Ceti's slicing
inequality `∫_{e⊥} P(s_y) dy ≤ P(s)`.
*Needs:* GeometricMeasureTheory G2 (area formula on rectifiable sets) and G5 (structure theorem);
Tau Ceti `TauCeti.reducedBoundary`, `TauCeti.outerNormal`, `TauCeti.orthogonalLineEquiv`,
`TauCeti.measurePreserving_orthogonalLineEquiv`, `TauCeti.ae_nullMeasurableSet_lineSection`,
`TauCeti.volume_eq_lintegral_volume_lineSection`, `TauCeti.lintegral_perimeter_lineSection_le`,
`TauCeti.ae_perimeter_lineSection_lt_top`, `TauCeti.ae_lineSection_ordConnected_iff`; Mathlib
`norm_add_sq_eq_norm_sq_add_norm_sq_of_inner_eq_zero`.

**Checks.**
- For `s = ball 0 1` in `ℂ` and `e = 1`, the section at height `y`, `|y| < 1`, is the interval
  `(−√(1 − y²), √(1 − y²))`, of perimeter `2`, whose two boundary points lie on the circle, where
  the outer normal has horizontal component `±√(1 − y²) ≠ 0`; at `y = ±1` the normal is vertical,
  and these two heights form a null set.
- For the square `(0, 1)²` and `e = 1`, the horizontal sides are parallel to `e` and their normal
  is orthogonal to `e`, but they lie over the null set of heights `{0, 1}`, as the theorem allows.

### 4.2 Steiner equality forces interval sections

Let `n ≥ 2`, let `s` be Lebesgue measurable with `0 < |s| < ∞` and `P(s) < ∞`, and let `e` be a unit
vector with `P(S_e s) = P(s)`. Prove that for almost every `y ∈ e⊥` the section `s_y` agrees a.e.
in `ℝ` with an interval, possibly empty or unbounded (an `OrdConnected` subset of `ℝ`)
(Cagnetti–Colombo–De Philippis–Maggi, §1.2 and Theorem A, for this necessary condition). The
statement passes to every set a.e. equal to `s`, for this fixed `e`. Prove with it the localized
comparison: for every Borel `G ⊆ e⊥`, the perimeter of `S_e s` in the cylinder `G × ℝ` is at most
that of `s`, and equality for `G = e⊥` forces the set of `y` whose section has more than two
essential boundary points to have zero transverse measure. *Route.* §4.1 and the tangential
area formula for the projection onto `e⊥` on `∂*s` give
`P(s; G × ℝ) ≥ ∫_G Σ_{t ∈ ∂*s_y} |⟪ν_s(y + t • e), e⟫|⁻¹ dy`, where the part of `∂*s` on which
`ν_s` is orthogonal to `e` only adds to the left side; each term is the length of a vector
`(1, a_i(y))` built from the slope of the boundary in `y`, and for `S_e s` the sum has two terms
built from half the derivative in `y` of the length of the section. The triangle inequality
`Σ_{i ≤ m} ‖(1, a_i)‖ ≥ ‖(m, Σ ± a_i)‖`, strict against `‖(2, Σ ± a_i)‖` when `m ≥ 4`, gives the
comparison and shows that a section with four or more essential boundary points contributes
strictly more than its symmetral, while a section of finite perimeter that is not a.e. an
interval has at least four. These are targets of this section: perimeter nonincrease obtained by
approximation, as in §2.1, does not supply them.
*Needs:* §2.1, §4.1; Tau Ceti `TauCeti.Real.two_le_perimeter`, `TauCeti.Real.four_le_perimeter`,
`TauCeti.Real.perimeter_eq_two_iff`, `TauCeti.ordConnected_lineSection_steinerSymmetrization`,
`TauCeti.ae_lineSection_ordConnected_iff`.

**Checks.**
- Equality in one Steiner step does not make `s` a translate of `S_e s`: in `ℂ` with `e = i`, let
  `s` be the union of the unit squares `(0, 1) × (0, 1)` and `(2, 3) × (5, 6)`. Every section is an
  interval, `S_e s = ((0, 1) ∪ (2, 3)) × (−½, ½)`, and both sets have perimeter `8`, but no
  translation carries `s` to `S_e s`.
- For the two unit discs of §2.1, the sections over `|y| < 1` are pairs of intervals, a set of
  `y` of positive measure, and indeed `P(S_e s) < P(s)`.

### 4.3 Ball rigidity

Prove `perimeter_pow_eq_iff_exists_ae_eq_ball`: let `n ≥ 2` and let `s ⊆ E` be Lebesgue measurable
with `0 < |s| < ∞`. Then `P(s)ⁿ = nⁿ ω_n |s|ⁿ⁻¹` if and only if there are `c ∈ E` and `r > 0`
with `s =ᵐ[volume] ball c r`. No boundedness, connectedness, convexity or boundary regularity is
assumed, so nonsmooth, disconnected and unbounded representatives are included; finiteness of
`P(s)` follows from either side (Maggi, §14.2; Cagnetti–Colombo–De Philippis–Maggi, §1.2 and
Theorem A).
*Route.* For "if", `P` and `|·|` depend only on the a.e. class and balls attain equality. For "only
if": `S_e s` has the volume of `s`, so the sharp inequality for `S_e s` and §2.1 give
`nⁿ ω_n |s|ⁿ⁻¹ ≤ P(S_e s)ⁿ ≤ P(s)ⁿ`, hence `P(S_e s) = P(s)` for every unit `e`. By §4.2 almost every
section of `s` in every direction is a.e. an interval, so by Tau Ceti's essential convexity `s`
agrees a.e. with a convex set, its set of points of density one, and then with a compact convex
`K` with nonempty interior. Perimeter and volume pass to `K`, which attains equality, and Tau
Ceti's convex rigidity makes `K` a closed ball `closedBall c r` with `r > 0`; it agrees a.e. with
`ball c r` because the sphere is null. Equality for smooth sets and approximation, or convergence
of successive symmetrizations to a ball without loss of perimeter, does not give this conclusion.
*Needs:* §2.1, §4.2; Tau Ceti
`MeasureTheory.NullMeasurableSet.finrank_pow_mul_volume_ball_mul_volume_pow_le_perimeter_pow`,
`TauCeti.volume_steinerSymmetrization`, `TauCeti.nullMeasurableSet_steinerSymmetrization`,
`TauCeti.exists_convex_ae_eq_of_ae_lineSection_ordConnected`,
`MeasureTheory.Measure.exists_isCompact_convex_ae_eq`,
`ConvexBody.perimeter_pow_eq_iff_exists_eq_closedBall`, `TauCeti.perimeter_congr_ae`,
`TauCeti.perimeter_ball_pow`, `MeasureTheory.Measure.addHaar_closedBall_ae_eq_ball`.

**Checks.**
- The punctured ball `ball c r \ {c}` has the volume and the perimeter of the ball, so it attains
  equality; it agrees a.e. with `ball c r` but is not a ball, so a statement with literal equality
  would be false.
- A set of volume zero has `P = 0` and both sides vanish, but it is a.e. equal to no ball of
  positive radius: the hypothesis `|s| > 0` is needed.
- Two separated balls of radius `r` (closures disjoint) have `P(s)ⁿ` equal to twice
  `nⁿ ω_n |s|ⁿ⁻¹`, in every dimension: strict.
- In dimension one the same statement is Tau Ceti's `TauCeti.Real.perimeter_eq_two_iff`: there
  `ω_1 = 2` and `|s|⁰ = 1`, so equality is `P(s) = 2`, which holds exactly for sets a.e. equal to a
  bounded open interval.

### 4.4 The topological-frontier form

Prove `isoperimetric_frontier`: for `n ≥ 2` and every `s ⊆ E` with `|s| < ∞`,
`nⁿ ω_n |s|ⁿ⁻¹ ≤ Hⁿ⁻¹(frontier s)ⁿ`. No measurability is assumed. Prove with it that if
`Hⁿ⁻¹(frontier s) < ∞`, then `frontier s` is Lebesgue-null and `s` is Lebesgue measurable,
since `s` differs from its open interior by a subset of its frontier; and that if
`0 < |s| < ∞`, `Hⁿ⁻¹(frontier s) < ∞` and equality holds, then `s` agrees a.e. with a ball of
positive radius. In particular the inequality holds for every bounded set (Maggi, §14.2, for the
finite-perimeter inequality it rests on). *Route.* If
`Hⁿ⁻¹(frontier s) = ∞` the right side is infinite. Otherwise `s` is Lebesgue measurable as above,
GeometricMeasureTheory G5 gives `P(s) ≤ Hⁿ⁻¹(frontier s)` through its boundary criterion, and the
sharp inequality concludes (for `|s| = 0` the left side is `0`). In the equality case `P(s)` lies
between the two sides of the sharp inequality, so §4.3 applies. Literal equality with a ball is
not asserted for arbitrary representatives, and the converse is not asserted for every null
modification: the frontier is sensitive to null sets.
*Needs:* §4.3; GeometricMeasureTheory G5; Tau Ceti
`MeasureTheory.NullMeasurableSet.finrank_pow_mul_volume_ball_mul_volume_pow_le_perimeter_pow`;
Mathlib `MeasureTheory.Measure.euclideanHausdorffMeasure`.

**Checks.**
- The punctured ball attains equality here too: its frontier is the sphere together with the
  centre, and `Hⁿ⁻¹` of a point is `0` for `n ≥ 2`.
- The ball minus its points with rational coordinates agrees a.e. with the ball, but its
  frontier is the closed ball, of infinite `Hⁿ⁻¹` measure for `n ≥ 2`: the inequality is strict,
  so there is no converse for null modifications.
- The complement of a ball has frontier a sphere, of finite measure, and infinite volume: the
  inequality fails for it, so the finite-volume hypothesis is needed.

### 4.5 Exact rigidity for regular open sets

Prove that a bounded open `U ⊆ E` that is regular, `interior (closure U) = U`, and attains
equality in §4.3 or in §4.4, with `|U| > 0`, is literally a ball `ball c r` with `r > 0` (from the
equality case of Maggi, §14.2).
Prove with it the passage it uses: a regular open set that agrees a.e. with an open ball `B` is
`B`. *Route.* §4.3, or §4.4 through §4.3, gives `U =ᵐ ball c r`. The open sets `U \ closedBall c r`
and `ball c r \ closure U` are null, hence empty, so `closure U = closedBall c r`, and regularity
gives `U = interior (closedBall c r) = ball c r`. Conversely a ball attains equality in both
forms, since `Hⁿ⁻¹(sphere c r) = n ω_n rⁿ⁻¹`.
*Needs:* §4.3, §4.4; Tau Ceti `TauCeti.euclideanHausdorffMeasure_sphere`.

**Checks.**
- The punctured ball is open and attains equality but is not regular: the interior of its
  closure is the ball. Without regularity the conclusion would be false.
- A regular open set a.e. equal to `ball c r` is `ball c r`; for the closed ball, a.e. equal to the
  open one, the passage does not apply because it is not open.

### 4.6 Lipschitz and `C¹` domains

Let `n ≥ 2`. Prove that a nonempty bounded open `Ω ⊆ E` that is a Lipschitz domain in the sense
of PDE §1.6 (Tau Ceti `Set.IsLipschitzDomain`) satisfies `nⁿ ω_n |Ω|ⁿ⁻¹ ≤ Hⁿ⁻¹(frontier Ω)ⁿ`, with
`Hⁿ⁻¹(frontier Ω)` its actual Hausdorff surface area, and that equality holds exactly when
`Ω = ball c r` for some `c` and some `r > 0` (Maggi, §14.2, for the finite-perimeter inequality and
its equality case). For such `Ω` the surface area is the perimeter, `Hⁿ⁻¹(frontier Ω) = P(Ω)`, and
for a `C¹` domain the measure-theoretic outer normal agrees `Hⁿ⁻¹`-a.e. with the classical outward
normal: both are GeometricMeasureTheory G6's comparison for Lipschitz and `C¹` domains, not a
definition chosen to make the inequality immediate. *Route.* §4.4 gives the inequality; a
Lipschitz domain is a regular open set, being locally the region strictly above the graph of a
continuous function, and a nonempty open set has positive volume, so §4.5 gives the equality case.
*Needs:* §4.4, §4.5; PDE §1.6; Tau Ceti `Set.IsLipschitzDomain`.

**Checks.**
- The unit square `(0, 1)²` is a Lipschitz domain that is not `C¹`; it has `H¹(frontier) = 4 = P`,
  and `4π · 1 < 16`: strict.
- The empty set is bounded and open and, having no frontier points, satisfies the definition of a
  Lipschitz domain; it attains `0 = 0` but is no ball of positive radius, so the equality clause
  needs `Ω` nonempty.

### Examples

- For a ball in `ℝ³`, `P = 4πr²` and `|B| = 4πr³/3`, and `(4πr²)³ = 64π³r⁶ = 27 (4π/3) (4πr³/3)²`:
  equality (Tau Ceti `TauCeti.perimeter_ball_pow`).
- The planar annulus `r < |z| < R` has `P = 2π(R + r)` and area `π(R² − r²)`, and
  `P² − 4π · area = 8π² r (R + r) > 0`: strict.
- Two separated balls of radius `r`: `P(s)ⁿ` is twice the right side in every dimension.

### Dependencies

§2.1 for §4.2–§4.3; Tau Ceti's sharp inequality, ball formulas, convex rigidity, essential
convexity and line-section API; GeometricMeasureTheory G2 and G5; PDE §1.6 for §4.6. Layer 1 is used
only through Tau Ceti's convex rigidity, and Layer 3 not at all.

## Layer 5: Sharp BV Sobolev and its equality cases

Throughout this layer `n ≥ 2`. Tau Ceti supplies the Schwarz rearrangement with its `Lᵖ` theory
and its preservation of Lipschitz bounds, the coarea formula `|Du|(E) = ∫ P({u > t}) dt` for
locally integrable `u` and its Lipschitz form `∫ P({u > t}) dt = ∫ ‖∇u‖`, the identification of
the a.e. derivative of a Lipschitz function with its weak derivative, the weak derivative of a
convolution, Jensen's inequality for convolution with a probability kernel, and de la Vallée
Poussin's lemma. Its nonsharp `BV` Sobolev inequality, with a non-explicit constant, is not used.

### 5.1 Pólya–Szegő for the total variation

Prove that for integrable `u : E → ℝ` with `u ≥ 0` a.e., `|Du*|(E) ≤ |Du|(E)`, both sides finite or
infinite (Burchard, Theorem 4.7 at `p = 1` with its proof from the isoperimetric inequality, for
`W¹,¹` functions). *Route.* By the coarea formula both sides are integrals over `t` of the
perimeters of the superlevel sets. For `t > 0`, `{u* > t}` is the centred open ball of volume
`|{u > t}| < ∞`, so its perimeter is at most `P({u > t})` by the sharp inequality and the equality
for balls; for `t < 0` both superlevel sets are a.e. the whole space, of perimeter `0`.
*Needs:* Tau Ceti `TauCeti.totalVariationOn_eq_lintegral_perimeter`,
`TauCeti.lt_schwarzRearrangement_iff`, `TauCeti.addHaar_setOf_lt_schwarzRearrangement`,
`MeasureTheory.NullMeasurableSet.finrank_pow_mul_volume_ball_mul_volume_pow_le_perimeter_pow`,
`TauCeti.perimeter_ball_pow`, `TauCeti.perimeter_congr_ae`.

**Checks.**
- For `u` the indicator of `ball c r`, `u*` is the indicator of `ball 0 r` and both variations are
  `n ω_n rⁿ⁻¹`.
- For `u` the indicator of two disjoint unit balls, `u*` is the indicator of the ball of radius
  `2^(1/n)`, of variation `n ω_n 2^((n−1)/n)`, below `2 n ω_n` (in the plane, `8.89 < 12.57`).

### 5.2 The convex-integrand estimate for Lipschitz functions

Let `h : E → ℝ` be nonnegative, integrable and Lipschitz, so that `h*` is Lipschitz (Tau Ceti).
Prove that for every finite-valued convex nondecreasing `Φ : [0, ∞) → [0, ∞)` with `Φ(0) = 0`,
`∫ Φ(‖∇h*‖) ≤ ∫ Φ(‖∇h‖)` whenever the right side is finite, the gradients being the a.e.
derivatives, which are the weak derivatives (Bianchi–Gardner–Gronchi–Kiderlen, Theorem 5.8).
Prove with it, for `μ_h(t) = |{h > t}|` and `m_h(t) = ∫_{{h = t} ∩ {∇h ≠ 0}} ‖∇h‖⁻¹ dHⁿ⁻¹`: that
`m_h(t) ≤ −μ_h′(t)` for a.e. `t > 0`; that `Hⁿ⁻¹({h = t} ∩ {∇h = 0}) = 0` for a.e. `t`; that
`m_{h*}(t) = −μ_h′(t)` for a.e. `t > 0`, by the nullity of the critical values of the
one-dimensional Lipschitz radial profile of `h*`; and that `s ↦ s Φ(P/s)` is nonincreasing on
`s > 0` for every `P ≥ 0`, so that Jensen's inequality and the level-perimeter inequality combine
in the right direction. Empty levels and zero denominators are treated separately. *Route.* The
Lipschitz coarea formula (GeometricMeasureTheory G2) on each side, GeometricMeasureTheory G5's
bound `P(E) ≤ Hⁿ⁻¹(frontier E)` applied to the open set `{h > t}`, whose frontier lies in
`{h = t}` because `h` is continuous, so that `P({h > t}) ≤ Hⁿ⁻¹({h = t})`, Jensen's inequality
on each level with the weight `‖∇h‖⁻¹ dHⁿ⁻¹`, and the sharp inequality for the levels.
*Needs:* GeometricMeasureTheory G2 and G5; Tau Ceti
`TauCeti.lipschitzWith_toReal_schwarzRearrangement`, `LocallyLipschitzOn.hasWeakFDerivOn_fderiv`,
`LocallyLipschitzOn.lintegral_perimeter_eq_setLIntegral_enorm_fderiv`,
`MeasureTheory.NullMeasurableSet.finrank_pow_mul_volume_ball_mul_volume_pow_le_perimeter_pow`.

**Checks.**
- With `Φ(t) = t` the estimate is §5.1 for Lipschitz `h`.
- For `h = (1 − ‖x − c‖)⁺`, `h* = (1 − ‖x‖)⁺` and the estimate is an equality for every `Φ`.
- For `Φ(t) = t²`, `s Φ(P/s) = P²/s` is decreasing in `s`, as the monotonicity lemma says.

### 5.3 Pólya–Szegő in `W¹,¹`

Prove `exists_hasWeakFDerivOn_schwarzRearrangement`: if `u : E → ℝ` is nonnegative a.e. and
integrable, with an integrable weak derivative `U` on `E`, then `u*` has an integrable weak
derivative `G` on `E` with `∫ ‖G‖ ≤ ∫ ‖U‖`; equivalently `D(u*) = G · volume` has no singular part
(Bianchi–Gardner–Gronchi–Kiderlen, Theorem 6.3 and Corollary 6.5, for the Sobolev membership and
the gradient comparison with the uniform-integrability argument at `p = 1`; only Schwarz
rearrangement is needed here). Prove with it the real-valued form: for integrable `u` with
integrable weak derivative `U`, the rearrangement of `|u|` has an integrable weak derivative of
`L¹` norm at most `∫ ‖U‖`, by `|u| = u⁺ + (−u)⁺` and the positive-part and truncation calculus,
which gives `‖∇|u|‖ = ‖U‖` a.e. *Route.*
- Mollify: `u_j = ρ_j ⋆ u` with nonnegative compactly supported smooth probability kernels
  `ρ_j`; `u_j` is smooth, nonnegative, Lipschitz and integrable, `∇u_j = ρ_j ⋆ U`, `u_j → u` in
  `W¹,¹`, and Jensen gives `∫ Φ(‖∇u_j‖) ≤ ∫ Φ(‖U‖)` for convex nondecreasing `Φ`. Choose by de la
  Vallée Poussin's lemma a superlinear such `Φ`, `Φ(t)/t → ∞`, with `∫ Φ(‖U‖) < ∞`.
- Apply §5.2 to this `Φ` and to `Φ(t) = t`, and derive uniform integrability: for every `ε > 0`
  there is a finite `T > 0` with `∫_A ‖∇u_j*‖ ≤ T |A| + ε` for every measurable `A` and every `j`.
- `u_j* → u*` in `L¹` by the contraction of Schwarz rearrangement, so Tau Ceti's lower
  semicontinuity of variation under `L¹_loc` convergence gives `|D(u*)|(V) ≤ T |V| + ε` for every
  open `V`; outer regularity of `volume` covers a null set by open sets of arbitrarily small
  volume, so the variation measure `|D(u*)|` is absolutely continuous with respect to `volume`.
  Since `u* ∈ L¹` by equimeasurability and `|D(u*)|(E) ≤ |Du|(E) = ∫ ‖U‖ < ∞` by §5.1, Tau Ceti's
  comparison of `BV` with `W¹,¹` gives `u*` an integrable weak derivative `G` with
  `|D(u*)| = ‖G‖ · volume`, so `∫ ‖G‖ ≤ ∫ ‖U‖`, and `u*` is a `TauCeti.W1p` class with weak
  derivative `G`.
A `BV` bound or strict smooth approximation alone does not exclude a singular part in the limit;
the uniform integrability does.
*Needs:* §5.1, §5.2; PDE Layer 1 (the weak-derivative API); Tau Ceti `TauCeti.HasWeakFDerivOn`,
`TauCeti.W1p`, `TauCeti.totalVariationOn_le_liminf`, `TauCeti.variationMeasure`,
`TauCeti.MemBV.exists_hasWeakFDerivOn_integrableOn`,
`TauCeti.HasWeakFDerivOn.variationMeasure_eq_withDensity`,
`TauCeti.HasWeakFDerivOn.hasFDerivAt_convolution_right`,
`ConvexOn.lintegral_ofReal_map_norm_convolution_le`,
`MeasureTheory.Integrable.exists_convexOn_superlinear_integrable`,
`TauCeti.lintegral_edist_rpow_schwarzRearrangement_le`, `TauCeti.lintegral_schwarzRearrangement`.

**Checks.**
- For `u = (1 − ‖x − c‖)⁺`, `u* = (1 − ‖x‖)⁺` and `∫ ‖G‖ = ∫ ‖U‖ = ω_n`.
- The indicator of a ball has finite variation but no integrable weak derivative: its derivative
  is carried by the sphere. It is excluded by the hypothesis, and its rearrangement, an indicator
  of a ball, is not in `W¹,¹` either: the theorem says nothing about `BV` functions.

### 5.4 The radial profile

For `u` as in §5.3 define, for `r > 0`, `v(r) = sup {t > 0 | ω_n rⁿ < |{u > t}|}`, with value `0`
for an empty set and taken in `[0, ∞]` until finiteness is proved; superlevel volumes are finite
for `t > 0` by the `L¹` bound. Prove that `u*(x) = v(‖x‖)` for `x ≠ 0`, that `v(r) < ∞` for `r > 0`,
that `v` is absolutely continuous on every compact subinterval of `(0, ∞)`, that
`n ω_n ∫₀^∞ |v′(r)| rⁿ⁻¹ dr ≤ ∫ ‖U‖`, that `G(x) = v′(‖x‖) x/‖x‖` (as a linear form, through the
inner product) for a.e. `x ≠ 0`, and that `rⁿ⁻¹ v(r) → 0` as `r → 0⁺`. As corollaries of
`D(u*) = G · volume`, the derivative of `u*` has no jump part across spheres, no Cantor part over a
null set of radii and no mass at the origin; they follow from the Sobolev membership of the
rearrangement (Bianchi–Gardner–Gronchi–Kiderlen, Theorem 6.3). *Route.* Absolute
continuity comes from the radial `W¹,¹` representative of §5.3 by comparing weak derivatives on
annuli, where the tangential components vanish; the radial restriction and composition lemmas
are built here against PDE's weak-derivative API. Monotonicity of `v` turns a.e. agreement with
the continuous profile into agreement everywhere on `(0, ∞)` with the `v` fixed above. The
weighted bound and the formula for `G` follow by polar integration,
and the limit at `0` from the weighted bound and `n ≥ 2`. These comparisons use the sharp
inequality and are not inputs to its proof.
*Needs:* §5.3; PDE Layer 1; Tau Ceti `TauCeti.lt_schwarzRearrangement_iff`, `TauCeti.W1p`,
`TauCeti.lintegral_eq_lintegral_Ioi_setLIntegral_sphere`.

**Checks.**
- For `u = (1 − ‖x‖)⁺`, `v(r) = (1 − r)⁺` and `n ω_n ∫₀¹ rⁿ⁻¹ dr = ω_n = ∫ ‖U‖`: equality.
- For `0 < α < n − 1`, `u = (‖x‖^(−α) − 1)⁺` is in `W¹,¹` and radial nonincreasing, so
  `v(r) = r^(−α) − 1` on `(0, 1)` is unbounded at `0`, while `rⁿ⁻¹ v(r) ~ r^(n−1−α) → 0`; such `α`
  exists because `n ≥ 2`.

### 5.5 The sharp `BV` Sobolev inequality

Prove `eLpNorm_le_inv_mul_totalVariationOn`: for integrable `u : E → ℝ` and `p = n/(n − 1)`,
`‖u‖_p ≤ (n ω_n^(1/n))⁻¹ |Du|(E)`, on the whole space, both sides in `[0, ∞]`, and prove
`u ∈ Lᵖ` when `|Du|(E) < ∞`: the bound on the norm alone does not record membership. Prove
`eLpNorm_eq_inv_mul_totalVariationOn_iff`: if moreover `|Du|(E) < ∞` and `u` is not a.e. zero,
equality holds exactly when `u =ᵐ[volume] c · 1_{ball a r}` for some `c ≠ 0`, `a ∈ E` and `r > 0`
(Fusco–Maggi–Pratelli, §1, inequality (1.4) and its equality case, for `BV(ℝⁿ)`);
the zero function attains equality trivially and is treated separately. Prove the `W¹,¹`
corollary `‖u‖_p ≤ (n ω_n^(1/n))⁻¹ ∫ ‖∇u‖`, that no nonzero `W¹,¹` function attains it, and that
smooth compactly supported functions approximating the indicator of a ball make the ratio of the
two sides tend to `1`. *Route.* The coarea formula writes `|Du|(E)` as `∫ P({u > t}) dt`, the
layer-cake formula writes `u⁺` and `u⁻` as integrals of indicators of superlevel sets, the
integral Minkowski inequality bounds `‖u⁺‖_p` by `∫₀^∞ |{u > t}|^(1/p) dt`, and the sharp
inequality bounds each `|{u > t}|^(1/p)` by `(n ω_n^(1/n))⁻¹ P({u > t})`; `u⁻` is treated alike,
and `‖u‖_p ≤ ‖u⁺‖_p + ‖u⁻‖_p` with equality only if one vanishes, since their supports are
disjoint and `p > 1`. In the equality case a.e. superlevel set is a ball by §4.3, the equality
case of the integral Minkowski inequality makes the superlevel sets nested and their indicators
proportional, hence all equal to one ball, and the sign does not change: it does not suffice to
classify each superlevel set as a ball. Nonattainment in `W¹,¹` follows because a nonzero multiple
of a ball indicator has a singular derivative. This is the sharp endpoint complement to PDE's
Sobolev embeddings.
*Needs:* §4.3; Tau Ceti `TauCeti.totalVariationOn`, `TauCeti.totalVariationOn_eq_lintegral_perimeter`,
`MeasureTheory.NullMeasurableSet.finrank_pow_mul_volume_ball_mul_volume_pow_le_perimeter_pow`,
`TauCeti.perimeter_ball`; Mathlib `MeasureTheory.eLpNorm`, `MeasureTheory.MemLp`.

**Checks.**
- For `u = 1_{ball 0 r}`, `‖u‖_p = ω_n^((n−1)/n) rⁿ⁻¹` and `(n ω_n^(1/n))⁻¹ |Du|(E) =
  (n ω_n^(1/n))⁻¹ n ω_n rⁿ⁻¹`, the same number: equality.
- For `u = 1_{B₁} − 1_{B₂}` with disjoint balls of equal volume, the ratio of the left side to the
  right side is `2^(−1/n)`: strict, so cancellation of signs is excluded.
- For `u = 2 · 1_{ball 0 1} + 1_{ball 0 2}` in the plane every superlevel set of positive
  volume is a ball, yet `‖u‖₂ = √(12π) ≈ 6.14` while `(2√π)⁻¹ |Du|(ℂ) = 8π/(2√π) ≈ 7.09`: the
  balls are not all the same, and the classification of each level as a ball is not enough.
- In the plane, `p = 2` and the constant is `(2√π)⁻¹`; for `u = 1_s` the inequality reads
  `|s|^(1/2) ≤ P(s)/(2√π)`, which is `4π |s| ≤ P(s)²`.

### Examples

- Indicators of balls, and their nonzero multiples, are the extremizers of §5.5.
- In the plane, the Lipschitz functions equal to `1` on `ball 0 1`, to `0` outside `ball 0 (1 + ε)`
  and linear in `‖x‖` in between give ratios `0.984`, `0.998` and `0.9998` of the two sides of
  §5.5 for `ε = 0.1`, `0.01` and `0.001`, approaching the constant without attaining it.

### Dependencies

Layer 4 (§4.3, and Tau Ceti's sharp inequality); Tau Ceti's Schwarz rearrangement and coarea
formula; GeometricMeasureTheory G2 and G5; PDE Layer 1's weak derivatives, through Tau Ceti's
carriers.

<a id="i6--full-planar-jordan-theorem-and-compatibility"></a>

## Layer 6: Full planar Jordan theorem and compatibility

Tau Ceti proves the Jordan curve theorem of ConformalMapping §5.3: the complement of a Jordan
curve `C ⊆ ℂ` has exactly two components, the inside `filledHull C \ C`, bounded, open and
connected, and the complement of `filledHull C`; the frontier of the inside is `C`, the interior
of `filledHull C` is the inside and its closure is `filledHull C`. It proves that a continuous
curve on `[a, b]` injective on `(a, b)`, such as a simple closed curve, has length
`eVariationOn γ (Icc a b) = H¹(γ '' Icc a b)`, finite or infinite, so that it is rectifiable
exactly when its trace has finite `H¹`; that such a curve whose trace is a circle satisfies
`L² = 4π A` for the area `A` of the inside of its trace; and that a nonconstant continuous
rectifiable closed curve with `L² = 4π |rectifiableSignedArea γ a b|` traces a circle and has a
disc as inside.

### 6.1 Simple closed curves and Jordan curves

Prove that the trace `C` of a simple closed curve `γ` on `[a, b]` is a Jordan curve (as in §3.1,
without rectifiability) and that every Jordan curve is such a trace. Prove that for a Jordan curve
`C` with `H¹(C) < ∞` the area of the inside is finite and positive and `H¹(C) > 0` (Wiedijk's entry,
for the classical planar statement). *Route.* `γ` induces a continuous bijection from the circle,
the quotient of `[a, b]` identifying its endpoints, onto the Hausdorff space `C`, hence a
homeomorphism; conversely a homeomorphism from the circle composed with `t ↦ exp(2πit)` is such a
`γ`. The inside is a nonempty bounded open set, and `H¹(C) ≥ diam C > 0`.
*Needs:* Tau Ceti `TauCeti.IsJordanCurve`, `TauCeti.filledHull`,
`TauCeti.IsJordanCurve.natCard_connectedComponents_compl_eq_two`,
`TauCeti.IsJordanCurve.isConnected_filledHull_sdiff`, `TauCeti.isBounded_filledHull`.

**Checks.**
- `circleMap c r` on `[0, 2π]` traces `sphere c r`, a Jordan curve (Tau Ceti
  `TauCeti.isJordanCurve_sphere`), of length `2πr = H¹(sphere c r)`.
- The circle traversed twice traces the same circle but has variation `4πr`, twice `H¹`; it is not
  injective on `[0, 4π)`, as the length identity requires.

### 6.2 The parametrized theorem

Prove `simple_closed_rectifiable_isoperimetric`: for a rectifiable simple closed curve `γ` on
`[a, b]` with trace `C`, `4π |filledHull C \ C| ≤ L²` with `L = eVariationOn γ (Icc a b)`, whatever
its orientation, and prove `simple_closed_rectifiable_isoperimetric_eq_iff`: equality holds exactly
when `C = sphere c r` for some `c` and some `r > 0` (Wiedijk's entry, for the inequality and for
equality forcing a circle; the converse is Tau Ceti's). The parametrization is not
assumed absolutely continuous, Lipschitz, differentiable or piecewise smooth, and need not have
constant speed. *Route.* §3.1 gives `|rectifiableSignedArea γ a b| = |filledHull C \ C|`, and Tau
Ceti's sharp inequality for the geometric signed area and its equality case for simple closed curves
conclude.
*Needs:* §3.1, §6.1; Tau Ceti `TauCeti.four_pi_mul_abs_rectifiableSignedArea_le`,
`BoundedVariationOn.eVariationOn_toReal_sq_eq_four_pi_mul_abs_rectifiableSignedArea_iff_exists_image_eq_sphere`.

**Checks.**
- The unit square traversed once has `L = 4` and area `1`, and `4π < 16`: strict.
- The circle traversed twice satisfies `4π · πr² ≤ (4πr)²` but traces a circle without equality:
  the injectivity hypothesis is what makes the equality case true.

### 6.3 The geometric theorem

Prove `jordan_isoperimetric` and `jordan_isoperimetric_eq_iff`: for a Jordan curve `C ⊆ ℂ` with
`H¹(C) < ∞`, `4π |filledHull C \ C| ≤ H¹(C)²`, with equality exactly when `C = sphere c r` for some
`c` and some `r > 0` (Wiedijk's entry, parametrized as in §6.2, for the inequality and for equality
forcing a circle; the converse is Tau Ceti's). Area is Lebesgue measure of the inside and length
is Hausdorff measure of the curve; no parametrization enters the statement. *Route.* Parametrize `C` by
§6.1 and apply §6.2, with `eVariationOn γ (Icc a b) = H¹(C)`.
*Needs:* §6.1, §6.2; Tau Ceti `ContinuousOn.eVariationOn_eq_euclideanHausdorffMeasure_image`.

**Checks.**
- For `C = sphere c r`, `4π · πr² = (2πr)²`: equality.
- For the boundary of the rectangle `[0, a] × [0, b]`, `4πab < 4(a + b)²` since `(a + b)² ≥ 4ab`:
  strict even for the square.

### 6.4 Compatibility with the finite-perimeter and curve-energy routes

Prove that the two other routes give the same theorem, with the same inside `filledHull C \ C` and
the same length `H¹(C)` (Wiedijk's entry, for the theorem both routes reach). For the
finite-perimeter route: GeometricMeasureTheory G6 gives `P(filledHull C \ C) = H¹(C)` for a
rectifiable Jordan curve, and the planar case of the sharp inequality gives
`4π |filledHull C \ C| ≤ H¹(C)²`; in the equality case §4.3 makes the inside a.e. a disc, the
inside is regular open (its closure is `filledHull C` and the interior of that is the
inside), so §4.5 makes it a disc `ball c r` exactly, and then `C`, its frontier, is the circle
`sphere c r`. For the curve-energy route: for the arclength parametrization the constant-speed
energy identity, the area–energy inequality, Green's theorem of DifferentialGeometry 5.6 and §3.1
give the inequality, and its equality case, a circle traversed once at constant speed, is
carried back to the original curve through the trace, without imposing constant speed on the
original parametrization. The converse holds for every continuous simple parametrization of a
circle, rectifiable or not a priori (Tau Ceti).
*Needs:* §3.1, §4.3, §4.5, §6.1; GeometricMeasureTheory G1 and G6; Tau Ceti
`MeasureTheory.NullMeasurableSet.finrank_pow_mul_volume_ball_mul_volume_pow_le_perimeter_pow`,
`TauCeti.IsJordanCurve.interior_filledHull`, `TauCeti.IsJordanCurve.closure_filledHull_sdiff`,
`TauCeti.IsJordanCurve.frontier_filledHull_sdiff`, `HasConstantSpeedOnWith.mul_integral_norm_deriv_sq`,
`TauCeti.mul_integral_norm_sq_eq_four_pi_mul_abs_signedArea_iff`,
`ContinuousOn.eVariationOn_toReal_sq_eq_four_pi_mul_volume_real_filledHull_sdiff_of_image_eq_sphere`.

**Checks.**
- For `C = sphere 0 1`, `P(ball 0 1) = 2π = H¹(C)` (Tau Ceti `TauCeti.perimeter_ball`), and both
  routes give equality.

### Examples

- An ellipse with semi-axes `a ≠ b` encloses area `πab` and is not a circle, so §6.3 makes its
  inequality strict.
- The L-shaped hexagon obtained by removing a unit square from a `2 × 2` square has area `3` and
  length `8`, and `12π ≈ 37.7 < 64`.
- The Koch snowflake is a Jordan curve with `H¹ = ∞`; it is excluded by the finiteness hypothesis,
  though its inside has finite positive area.
- Let `κ` be the Cantor–Lebesgue function of GeometricMeasureTheory's acceptance examples and
  `φ(t) = (t + κ(t))/2` on `[0, 1]`. Then `φ` is an increasing homeomorphism of `[0, 1]` that is not
  absolutely continuous (`φ′ = ½` a.e., while `φ(1) − φ(0) = 1`), and `γ(t) = exp(2πi φ(t))` is a
  continuous simple closed rectifiable curve, of length `2π`, that is not absolutely continuous
  (`‖γ′‖ = π` a.e., integrating to `π < 2π`). Its derivative integral `½ ∫₀¹ (x y′ − y x′)` is
  `π/2`, while its geometric signed area and the area of its inside are `π`: §6.2 applies to it with
  equality, and an argument through the derivative of the original parameter would fail.

### Dependencies

§3.1, §4.3 and §4.5; GeometricMeasureTheory G1 and G6 and its Cantor–Lebesgue example; Tau
Ceti's Jordan curve theorem (ConformalMapping §5.3) and planar Green library
(DifferentialGeometry 5.6).

## Downstream consumers

- [GaussianIsoperimetryAndClusters](../GaussianIsoperimetryAndClusters/README.md) consumes
  Layer 4: essential convexity, which is Tau Ceti's
  `TauCeti.exists_convex_ae_eq_of_ae_lineSection_ordConnected`, and the slicing theorem of §4.1.
- [Yamabe](../Yamabe/README.md) consumes Layer 2's Schwarz rearrangement, which is Tau Ceti's, and
  the convex-integrand estimate of §5.2.
- [SieveMethodsAndPrimePatterns](../SieveMethodsAndPrimePatterns/README.md) consumes Layer 2's
  isoperimetry for convex bodies, which is Tau Ceti's
  `ConvexBody.finrank_pow_mul_volume_ball_mul_volume_pow_le_perimeter_pow`.
- [PDE](../PDE/README.md) names Layers 3 and 5 for the sharp periodic Wirtinger inequality,
  which is Tau Ceti's, and the sharp `BV` Sobolev inequality with its extremizers (§5.5).
- [RiemannianGeometry](../RiemannianGeometry/README.md) cites Layers 3 and 6, and
  [DifferentialGeometry](../DifferentialGeometry/README.md) names them as the owners of the sharp
  curve inequality and its circle equality.
- [ConformalMapping](../../Completed/ConformalMapping/README.md) names Layer 6 as the owner of the
  rectifiable isoperimetric inequality and as a consumer of its §5.3.

## Scope and ownership

**This roadmap owns** the Euclidean isoperimetric theory built on the inequality: the
real-valued Prékopa–Leindler inequality (§1.1); perimeter nonincrease under Steiner
symmetrization, convergence of iterated symmetrizations and the surface area of convex bodies
(§2.1–§2.3); the signed area of a simple closed curve (§3.1); the slicing theorem, the interval
structure of Steiner equality sets, ball rigidity and its frontier, regular-open and
Lipschitz-domain forms (§4.1–§4.6); Pólya–Szegő in `BV` and `W¹,¹`, the radial profile and the
sharp `BV` Sobolev inequality with its equality cases (§5.1–§5.5); and the planar theorem for
rectifiable Jordan curves with its compatibility results (§6.1–§6.4). Other roadmaps cite these
layers by the former numbering of the headings, in which I1 is now Layer 1, I2 is now Layer 2, I3
is now Layer 3, I4 is now Layer 4, I5 is now Layer 5 and I6 is now Layer 6.

**In the Tau Ceti library at the pin**, and so not planned here (exact declarations in the
supplier contracts):

- *Layer 1*: the Prékopa–Leindler property of Lebesgue measure on finite-dimensional real inner
  product spaces with its one-dimensional case, tensorization and linear transport;
  Brunn–Minkowski for nonempty Lebesgue-measurable sets with outer volume on the sum, weighted,
  multiplicative and real-valued; one-dimensional Brunn–Minkowski for compact, Borel and
  Lebesgue-measurable sets; the equality case for compact convex sets of positive volume, in the
  weighted, unweighted and multiplicative forms; positive volume against nonempty interior for
  convex sets. Translation, dilation and monotonicity laws for volume, continuity along
  decreasing compact sets and neighbourhood approximation are Mathlib's.
- *Layer 2*: Steiner symmetrization with its measure-theoretic theory, `L¹` contraction,
  continuity, second-moment monotonicity and fixed points, and perimeter nonincrease for bounded
  convex sets; Schwarz rearrangement with equimeasurability, layer cake, `Lᵖ` norms and classes,
  order preservation, `Lᵖ` contraction and the Hardy–Littlewood inequality; the perimeter of a
  convex body as the first variation of its parallel volume, and the lower-dimensional derivative
  formulas; isoperimetry for convex bodies with equality for closed balls; the isodiametric
  inequality with its equality case.
- *Layer 3*: the sharp periodic Wirtinger inequality with its equality case for absolutely
  continuous functions valued in finite-dimensional real inner product spaces, for weakly
  differentiable functions and on `W¹,²`; the signed area, the area–energy inequality with its
  complete equality analysis and the a.e. equation of the equality case; the comparison with the
  winding-weighted area of DifferentialGeometry 5.6; the arclength parametrization and the
  constant-speed energy identity; the geometric signed area of a rectifiable curve with its
  parametrization laws, and the sharp inequality for it with its equality case.
- *Layer 4*: the sharp inequality for every Lebesgue-measurable set of finite volume, in extended,
  root and real-valued forms, with its smooth and approximation steps; perimeter and volume of
  balls; scaling; the convex-body steps of rigidity; essential convexity and compact convex
  representatives; orthogonal line coordinates, measurability of sections and their a.e.
  invariance; the slicing inequality; the reduced boundary and the measure-theoretic outer normal.
- *Layer 5*: preservation of Lipschitz bounds under Schwarz rearrangement, the weak derivative of
  a Lipschitz function, the weak derivative of a convolution, Jensen's inequality for
  convolution, de la Vallée Poussin's lemma and the coarea formulas.
- *Layer 6*: the equality of the length of a continuous curve injective on the open interval with
  `H¹` of its trace, finite or infinite, so rectifiability exactly for a trace of finite `H¹`; the
  converse of the equality case for every continuous simple parametrization of a circle.

**Owned elsewhere and consumed here.**

- [GeometricMeasureTheory](../GeometricMeasureTheory/README.md): the arclength parametrization of a
  simple closed curve (G1); rectifiability, area and coarea (G2); De Giorgi's structure theorem
  for the reduced boundary, and `P(E) ≤ Hⁿ⁻¹(frontier E)` (G5); Gauss–Green, the comparison
  of perimeter with surface measure on Lipschitz and `C¹` domains, and, for a rectifiable Jordan
  curve, `P(filledHull C \ C) = H¹(C)` with the Jordan index theorem for its arclength
  parametrization (G6); the Cantor–Lebesgue function (acceptance examples).
- [DifferentialGeometry](../DifferentialGeometry/README.md) 5.6: winding numbers of absolutely
  continuous curves, curve integration and Green's theorem, which it retains; the planar area
  identity is used through Tau Ceti.
- [ConformalMapping](../../Completed/ConformalMapping/README.md) §5.3: the Jordan curve theorem and
  the inside of a Jordan curve, used through Tau Ceti.
- [PDE](../PDE/README.md) Layer 1: weak derivatives, `W¹,ᵖ`, density, Poincaré and trace theory,
  and the Lipschitz domains of §1.6. Its nonsharp estimates do not depend on this roadmap.

**Outside this roadmap**: quantitative stability, anisotropic perimeter, isoperimetric
inequalities on curved ambient manifolds, a general Orlicz-space theory (the convex-integrand
estimates of §5.2–§5.3 are supporting results for `p = 1`), and the characterization of equality
in the Prékopa–Leindler inequality for arbitrary functions.

## Exact supplier contracts

### From Mathlib

- `EuclideanSpace`, `Module.finrank`, `InnerProductSpace.volume_ball` (the volume of a ball in a
  finite-dimensional real inner product space), `MeasureTheory.Measure.addHaar_smul`,
  `MeasureTheory.Measure.addHaar_sphere` (spheres are null), `Convex.addHaar_frontier` (the
  frontier of a convex set is null), `tendsto_measure_cthickening_of_isCompact` and
  `MeasureTheory.tendsto_measure_iInter_atTop` (continuity of volume along decreasing sets).
- `MeasureTheory.Measure.euclideanHausdorffMeasure`, notation `μHE[k]`, the normalized Euclidean
  Hausdorff measure, agreeing with `volume` in dimension `k`.
- `ConvexBody`, `Convex`, pointwise Minkowski operations, `Convex.add_smul`
  (`(p + q) • s = p • s + q • s` for convex `s` and `p, q ≥ 0`).
- `MeasureTheory.NullMeasurableSet`, `MeasureTheory.eLpNorm`, `MeasureTheory.MemLp`,
  `MeasureTheory.Integrable`, `MeasureTheory.ofReal_integral_eq_lintegral_ofReal`,
  `ENNReal.ofReal_rpow_of_nonneg`, `norm_add_sq_eq_norm_sq_add_norm_sq_of_inner_eq_zero`.
- `BoundedVariationOn`, `eVariationOn` with `eVariationOn.comp_eq_of_monotoneOn` and
  `eVariationOn.comp_eq_of_antitoneOn`, `HasConstantSpeedOnWith`, `naturalParameterization`,
  `AbsolutelyContinuousOnInterval`, `circleMap`.

### From Tau Ceti

Every declaration below exists at the pin, each theorem with a proof; paths are under `TauCeti/`.

- *Prékopa–Leindler and Brunn–Minkowski* (`MeasureTheory/Integral/PrekopaLeindler.lean`,
  `MeasureTheory/Measure/Lebesgue/BrunnMinkowski/`): `MeasureTheory.Measure.HasPrekopaLeindler`
  (the extended-integral inequality at weight `θ` for measurable functions, pointwise on the
  given representatives) with `MeasureTheory.Measure.HasPrekopaLeindler.prod`,
  `MeasureTheory.Measure.HasPrekopaLeindler.pi`, `MeasureTheory.Measure.HasPrekopaLeindler.map` and
  `MeasureTheory.Measure.HasPrekopaLeindler.of_measurePreserving`;
  `TauCeti.Real.hasPrekopaLeindler_volume` and `TauCeti.hasPrekopaLeindler_volume` (every
  `0 ≤ θ ≤ 1`, on `ℝ` and on a finite-dimensional real inner product space);
  `TauCeti.volume_rpow_add_volume_rpow_le` (nonempty Lebesgue-measurable `A, B`, positive
  dimension, outer volume on `A + B`), `TauCeti.mul_volume_rpow_add_mul_volume_rpow_le` (weighted,
  `c, d ≥ 0`), `TauCeti.volume_rpow_mul_volume_rpow_le` (multiplicative, `0 < θ < 1`),
  `TauCeti.volume_real_rpow_add_volume_real_rpow_le` and
  `TauCeti.mul_volume_real_rpow_add_mul_volume_real_rpow_le` (real-valued, finite outer volume of
  the sum); `TauCeti.Real.volume_add_volume_le_of_isCompact`, `TauCeti.Real.volume_add_volume_le`
  and `TauCeti.Real.volume_add_volume_le_of_nullMeasurableSet` (one-dimensional);
  `Convex.volume_smul_add_smul_eq_iff` (multiplicative equality for compact convex sets of positive
  volume: a translate), `Convex.volume_real_smul_add_smul_rpow_eq_iff` and
  `Convex.exists_eq_vadd_smul_of_volume_real_rpow_le` (additive equality for `c, d > 0`: `B = v + r • A`
  with `r > 0`); `Convex.addHaar_pos_iff_interior_nonempty` and
  `Convex.addHaar_pos_iff_affineSpan_eq_top` (`Analysis/Convex/Measure.lean`).
- *Steiner symmetrization* (`MeasureTheory/Measure/Lebesgue/Steiner/`): `TauCeti.steinerSymmetrization`
  (Convention 8), `TauCeti.steinerSymmetrization_ae_eq`, `TauCeti.nullMeasurableSet_steinerSymmetrization`,
  `TauCeti.volume_steinerSymmetrization`, `TauCeti.steinerSymmetrization_mono`,
  `TauCeti.steinerSymmetrization_vadd`, `TauCeti.steinerSymmetrization_smul`,
  `TauCeti.steinerSymmetrization_image_linearIsometryEquiv`, `TauCeti.convex_steinerSymmetrization`,
  `TauCeti.steinerSymmetrization_ball_zero`, `TauCeti.ordConnected_lineSection_steinerSymmetrization`,
  `TauCeti.volume_steinerSymmetrization_symmDiff_le` and
  `TauCeti.eLpNorm_indicator_steinerSymmetrization_sub_le` (contraction, infinite volumes
  allowed), `TauCeti.tendsto_volume_steinerSymmetrization_symmDiff` (joint continuity in the
  direction and the set, the limit of finite volume), `TauCeti.lintegral_norm_sq_steinerSymmetrization_le`
  and `TauCeti.lintegral_norm_sq_steinerSymmetrization_eq_iff` (second moment; for a finite second
  moment, equality exactly for a.e. fixed sets),
  `TauCeti.forall_steinerSymmetrization_ae_eq_iff_exists_ae_eq_ball` and
  `TauCeti.exists_ae_eq_ball_of_forall_steinerSymmetrization_ae_eq` (fixed points, finite volume),
  `TauCeti.perimeter_steinerSymmetrization_le_of_convex` (bounded convex sets) and
  `TauCeti.perimeter_steinerSymmetrization_le_liminf` (closed sets of finite volume: perimeter of
  the symmetral at most the lower outer Minkowski content).
- *Schwarz rearrangement* (`MeasureTheory/Function/SchwarzRearrangement.lean` and
  `…/SchwarzRearrangement/Lipschitz.lean`): `TauCeti.schwarzRearrangement` (Convention 8),
  `TauCeti.lt_schwarzRearrangement_iff`, `TauCeti.addHaar_setOf_lt_schwarzRearrangement`,
  `TauCeti.schwarzRearrangement_congr_ae`, `TauCeti.schwarzRearrangement_mono_ae`,
  `TauCeti.schwarzRearrangement_indicator`, `TauCeti.lintegral_schwarzRearrangement`,
  `TauCeti.lintegral_rpow_schwarzRearrangement`, `TauCeti.eLpNorm_schwarzRearrangement`,
  `TauCeti.memLp_schwarzRearrangement_iff`, `TauCeti.lintegral_mul_le_lintegral_schwarzRearrangement_mul`
  (Hardy–Littlewood), `TauCeti.lintegral_edist_rpow_schwarzRearrangement_le` and
  `TauCeti.eLpNorm_edist_schwarzRearrangement_le` (contraction for `1 ≤ p`),
  `TauCeti.lipschitzWith_toReal_schwarzRearrangement` (a real `K`-Lipschitz function has a
  `K`-Lipschitz rearrangement of its positive part).
- *Convex geometry*: `Convex.hasDerivWithinAt_measureReal_add_smul_closedBall` (compact convex `K`
  with nonempty interior: right derivative `P(K)` of the parallel volume) and
  `IsCompact.perimeter_le_of_hasDerivWithinAt` (`Analysis/BoundedVariation/ParallelVolume.lean`,
  `…/MinkowskiContent.lean`); `TauCeti.hasDerivWithinAt_volume_real_add_smul_closedBall_of_finrank_add_one_eq`
  and `TauCeti.hasDerivWithinAt_volume_real_add_smul_closedBall_of_finrank_add_two_le` (compact `K`
  in an affine subspace of codimension one, resp. at least two: right derivative `2 Hⁿ⁻¹(K)`, resp.
  `0`; `Geometry/Euclidean/Volume/Parallel.lean`); `ConvexBody.concaveOn_volume_real_add_smul_rpow`,
  `ConvexBody.hasDerivWithinAt_volume_real_add_smul_closedBall_rpow`,
  `ConvexBody.hasDerivWithinAt_volume_real_add_smul_closedBall_rpow_iff_exists_eq_closedBall`,
  `ConvexBody.finrank_pow_mul_volume_ball_mul_volume_pow_le_perimeter_pow` and
  `ConvexBody.perimeter_pow_eq_iff_exists_eq_closedBall` (convex bodies of positive volume,
  positive dimension); `TauCeti.volume_le_volume_closedBall_diam_div_two`,
  `TauCeti.volume_le_ofReal_diam_div_two_pow_mul_volume_ball`,
  `TauCeti.volume_eq_volume_closedBall_diam_div_two_iff_exists_ae_eq` (bounded Lebesgue-measurable
  sets) and `TauCeti.volume_eq_volume_closedBall_diam_div_two_iff_exists_eq` (nonempty closed bounded
  sets) (`MeasureTheory/Measure/Lebesgue/Isodiametric.lean`).
- *Perimeter and variation* (`Analysis/BoundedVariation/`): `TauCeti.totalVariationOn`,
  `TauCeti.perimeter` (Convention 3), `TauCeti.perimeter_congr_ae`, `TauCeti.perimeter_empty`,
  `TauCeti.perimeter_le_liminf` (lower semicontinuity under local `L¹` convergence),
  `TauCeti.perimeter_smul`, `LinearIsometryEquiv.perimeter_image`, `TauCeti.perimeter_ball`,
  `TauCeti.perimeter_closedBall`, `TauCeti.perimeter_ball_pow`;
  `MeasureTheory.NullMeasurableSet.finrank_pow_mul_volume_ball_mul_volume_pow_le_perimeter_pow`,
  `MeasureTheory.NullMeasurableSet.ofReal_mul_volume_real_rpow_mul_le_perimeter` and
  `MeasureTheory.NullMeasurableSet.mul_volume_real_rpow_mul_le_perimeter_toReal` (the sharp
  inequality for Lebesgue-measurable sets of finite positive volume in positive dimension;
  `…/Isoperimetric.lean`); `TauCeti.totalVariationOn_eq_lintegral_perimeter` (coarea, locally
  integrable `u`) and `LocallyLipschitzOn.lintegral_perimeter_eq_setLIntegral_enorm_fderiv`
  (`…/Coarea.lean`); `TauCeti.eLpNorm_le_totalVariationOn` (nonsharp, not used);
  `TauCeti.Real.two_le_perimeter`, `TauCeti.Real.four_le_perimeter` and
  `TauCeti.Real.perimeter_eq_two_iff` (sets of finite measure in `ℝ`; `…/Real.lean`);
  `TauCeti.lintegral_perimeter_lineSection_le` and `TauCeti.ae_perimeter_lineSection_lt_top`
  (`…/Slicing.lean`); `MeasureTheory.NullMeasurableSet.exists_smooth_perimeter_approximation`
  (`…/SmoothApproximation.lean`: a Lebesgue-measurable set of finite volume is the limit, in
  volume and in perimeter, finite or infinite, of bounded open sets whose frontiers are regular
  levels of compactly supported smooth functions);
  `TauCeti.exists_subseq_tendsto_measure_symmDiff_inter_of_perimeter_le` (`…/Compactness.lean`: a
  sequence of sets with locally bounded perimeter in an open set has a subsequence converging
  locally in measure there); `TauCeti.totalVariationOn_le_liminf` (lower semicontinuity of
  variation on an open set under `L¹_loc` convergence of locally integrable functions);
  `TauCeti.variationMeasure`, `TauCeti.MemBV.exists_hasWeakFDerivOn_integrableOn` (an integrable
  function of finite variation whose variation measure is absolutely continuous with respect to
  `volume` has an integrable weak gradient) and
  `TauCeti.HasWeakFDerivOn.variationMeasure_eq_withDensity` (the variation measure of a weakly
  differentiable function is the norm of its weak derivative times `volume`;
  `…/WeakDerivative.lean`); `TauCeti.reducedBoundary` and `TauCeti.outerNormal`
  (`…/ReducedBoundary.lean`: the reduced boundary of a set in an open set and its
  measure-theoretic outer normal, a unit vector on the reduced boundary, with `|Dχ_s|`
  concentrated on the reduced boundary and `Dχ_s = −ν_s |Dχ_s|` for `s` of locally finite
  perimeter; the identification of `|Dχ_s|` with `Hⁿ⁻¹` there is G5's).
- *Hausdorff measure on spheres* (`Geometry/Euclidean/Volume/`):
  `TauCeti.euclideanHausdorffMeasure_sphere` (`Hⁿ⁻¹(sphere c r) = n ω_n rⁿ⁻¹` for `r > 0`;
  `Sphere.lean`) and
  `TauCeti.lintegral_eq_lintegral_Ioi_setLIntegral_sphere` (polar integration of a nonnegative
  measurable function against `Hⁿ⁻¹` on the spheres about any centre, in positive dimension;
  `Polar.lean`).
- *Line sections and convexity* (`MeasureTheory/Measure/Lebesgue/`): `TauCeti.orthogonalLineEquiv`
  (`Analysis/InnerProductSpace/LinearIsometry.lean`), `TauCeti.measurePreserving_orthogonalLineEquiv`,
  `TauCeti.ae_nullMeasurableSet_lineSection`, `TauCeti.volume_eq_lintegral_volume_lineSection`,
  `TauCeti.ae_lineSection_ordConnected_iff` (`OrthogonalSlices.lean`);
  `TauCeti.exists_convex_ae_eq_of_ae_lineSection_ordConnected` (`EssentialConvexity.lean`: a
  Lebesgue-measurable set whose a.e. section in every unit direction is a.e. an interval agrees
  a.e. with a convex set); `MeasureTheory.Measure.exists_isCompact_convex_ae_eq`
  (`Analysis/Convex/Measure.lean`: a set of finite positive measure a.e. equal to a convex set has
  a compact convex representative with nonempty interior);
  `MeasureTheory.Measure.addHaar_closedBall_ae_eq_ball` (`MeasureTheory/Measure/Haar/NormedSpace.lean`).
- *Weak derivatives and convolution*: `TauCeti.HasWeakFDerivOn` (`Analysis/Sobolev/WeakDeriv/Basic.lean`),
  `TauCeti.W1p`, `LocallyLipschitzOn.hasWeakFDerivOn_fderiv` (`…/WeakDeriv/Lipschitz.lean`),
  `TauCeti.HasWeakFDerivOn.hasFDerivAt_convolution_right` (`Analysis/Sobolev/Mollification/Basic.lean`),
  `ConvexOn.lintegral_ofReal_map_norm_convolution_le` (`Analysis/Convolution/Jensen.lean`; `Φ`
  convex and monotone on `[0, ∞)`, `ρ` a probability kernel),
  `MeasureTheory.Integrable.exists_convexOn_superlinear_integrable`
  (`MeasureTheory/Function/DeLaValleePoussin.lean`); `Set.IsLipschitzDomain`
  (`Analysis/Sobolev/LipschitzDomain/Basic.lean`).
- *Curves* (`Analysis/Fourier/`, `Analysis/Green/Examples/CurveArea/`,
  `MeasureTheory/Function/MetricDerivative/ConstantSpeed.lean`,
  `Topology/MetricSpace/Arclength/Basic.lean`, `Topology/EMetricSpace/CurveLength.lean`):
  `ContinuousOn.eVariationOn_eq_euclideanHausdorffMeasure_image` and
  `ContinuousOn.boundedVariationOn_iff_euclideanHausdorffMeasure_image_lt_top` (continuous on
  `[a, b]` and injective on `(a, b)`: the length is `H¹` of the trace, finite or infinite);
  `TauCeti.integral_norm_sub_average_sq_le` and `TauCeti.integral_norm_sub_average_sq_eq_iff`
  (absolutely continuous, values in a finite-dimensional real inner product space),
  `TauCeti.HasWeakLineDerivOn.integral_norm_sub_average_sq_le`,
  `TauCeti.HasWeakLineDerivOn.integral_norm_sub_average_sq_eq_iff`,
  `TauCeti.W1p.integral_norm_sub_average_sq_le`, `TauCeti.W1p.integral_norm_sub_average_sq_eq_iff`;
  `TauCeti.signedArea`, `TauCeti.signedArea_circleMap`, `TauCeti.four_pi_mul_abs_signedArea_le`,
  `TauCeti.mul_integral_norm_sq_eq_four_pi_mul_abs_signedArea_iff`,
  `TauCeti.mul_integral_norm_sq_eq_four_pi_mul_abs_signedArea_iff_ae_hasDerivAt`,
  `TauCeti.signedArea_eq_integral_windingWeight`,
  `TauCeti.signedArea_eq_intCast_mul_volume_real_of_windingNumber_eq` (constant integer winding
  number `k` on the inside: signed area `k` times its area);
  `HasConstantSpeedOnWith.mul_integral_norm_deriv_sq`,
  `AbsolutelyContinuousOnInterval.eVariationOn_toReal_sq_le_mul_integral_norm_deriv_sq`,
  `BoundedVariationOn.image_naturalParameterization_Icc`,
  `BoundedVariationOn.naturalParameterization_toReal_eVariationOn`;
  `TauCeti.rectifiableSignedArea`, `AbsolutelyContinuousOnInterval.rectifiableSignedArea_eq_signedArea`,
  `TauCeti.rectifiableSignedArea_eq_signedArea_of_eqOn_comp`,
  `TauCeti.rectifiableSignedArea_eq_signedArea_naturalParameterization`,
  `TauCeti.rectifiableSignedArea_comp_of_monotoneOn`, `TauCeti.rectifiableSignedArea_comp_of_antitoneOn`,
  `TauCeti.four_pi_mul_abs_rectifiableSignedArea_le`,
  `TauCeti.eVariationOn_toReal_sq_eq_four_pi_mul_abs_rectifiableSignedArea_iff`;
  `ContinuousOn.rectifiableSignedArea_eq_or_eq_neg_of_image_eq_sphere`,
  `ContinuousOn.eVariationOn_toReal_sq_eq_four_pi_mul_volume_real_filledHull_sdiff_of_image_eq_sphere`
  (continuous, injective on `(a, b)`, trace a circle: `L² = 4πA`),
  `BoundedVariationOn.exists_image_eq_sphere_of_isoperimetric_eq`,
  `BoundedVariationOn.exists_filledHull_sdiff_eq_ball_of_isoperimetric_eq`,
  `BoundedVariationOn.eVariationOn_toReal_sq_eq_four_pi_mul_abs_rectifiableSignedArea_iff_exists_image_eq_sphere`
  (`IsoperimetricTrace.lean`).
- *Jordan curves* (`Topology/JordanCurve/Basic.lean`, `Topology/FilledHull.lean`,
  `Analysis/Normed/Module/FilledHull.lean`, `Analysis/Complex/PlaneSeparation/Inside.lean`):
  `TauCeti.IsJordanCurve`, `TauCeti.isJordanCurve_sphere`, `TauCeti.filledHull`,
  `TauCeti.isBounded_filledHull`, `TauCeti.IsJordanCurve.natCard_connectedComponents_compl_eq_two`,
  `TauCeti.IsJordanCurve.isConnected_filledHull_sdiff`, `TauCeti.IsJordanCurve.frontier_filledHull_sdiff`,
  `TauCeti.IsJordanCurve.interior_filledHull`, `TauCeti.IsJordanCurve.closure_filledHull_sdiff`.

### From TauCetiRoadmap.GeometricMeasureTheory

- G1: arclength parametrization of a rectifiable curve, simple when the curve is simple.
- G2: the coarea formula for Lipschitz maps, the tangential area formula on rectifiable sets, and
  the area formula on graphs.
- G5: De Giorgi's structure theorem `|D1_s| = Hⁿ⁻¹ ⌊ ∂*s` for Tau Ceti's reduced boundary and
  outer normal, and `P(E) ≤ Hⁿ⁻¹(frontier E)` for measurable `E`, through the boundary criterion;
  applied to `E = {h > t}` for continuous `h`, whose frontier lies in `{h = t}`, it gives
  `P({h > t}) ≤ Hⁿ⁻¹({h = t})`.
- G6: perimeter equals boundary measure on Lipschitz and `C¹` domains, with the classical outward
  normal; `P(filledHull C \ C) = H¹(C)` for a rectifiable Jordan curve and the Jordan index theorem
  for its absolutely continuous arclength parametrization, with the sign a conclusion.
- Acceptance examples: the Cantor–Lebesgue function, continuous, nondecreasing, from `0` to `1`,
  with derivative `0` a.e.

### From TauCetiRoadmap.DifferentialGeometry

5.6: winding numbers of absolutely continuous curves and Green's theorem for absolutely
continuous cycles, with the winding-weighted area; DifferentialGeometry records 5.6.1–5.6.3 as Tau
Ceti's, and this roadmap uses them through the Tau Ceti declarations above.

### From TauCetiRoadmap.ConformalMapping

§5.3: the Jordan curve theorem, with the inside `filledHull C \ C` open, connected and bounded, of
frontier `C`; used through Tau Ceti's `TauCeti.IsJordanCurve.natCard_connectedComponents_compl_eq_two`
and the declarations above.

### From TauCetiRoadmap.PDE

Layer 1: weak derivatives and the Sobolev classes, whose carriers are Tau Ceti's
`TauCeti.HasWeakFDerivOn` and `TauCeti.W1p`; §1.6: Lipschitz domains, whose predicate is Tau Ceti's
`Set.IsLipschitzDomain`.

## References

- Francesco Maggi, [*Sets of Finite Perimeter and Geometric Variational Problems*](https://cvgmt.sns.it/paper/1880/),
  §14.1 (Steiner's inequality), §14.2 (the Euclidean isoperimetric inequality, with balls as the
  unique minimizers) and §18.3 (slicing perimeters by hyperplanes); GeometricMeasureTheory owns the
  underlying measure and boundary theory.
- F. Cagnetti, M. Colombo, G. De Philippis, F. Maggi,
  [*Rigidity of equality cases in Steiner's perimeter inequality*](https://arxiv.org/abs/1309.1639),
  §1.2 and Theorem A, for the necessary interval-section condition used in §4.2, and Theorem C
  (§4.4, arXiv v1, p. 44), a form of Vol'pert's slicing theorem, for §4.1. Translation rigidity for
  a single symmetrization needs additional hypotheses.
- G. Bianchi, R. J. Gardner, P. Gronchi, M. Kiderlen,
  [*The Pólya–Szegő inequality for smoothing rearrangements*](https://arxiv.org/abs/2206.09833),
  Theorem 5.8, Theorem 6.3 and Corollary 6.5, for the Lipschitz convex-integrand estimate, Sobolev
  membership and the gradient comparison, including the uniform-integrability argument at the
  endpoint `p = 1`; Layer 5 uses only Schwarz rearrangement.
- Aljoša Volčič, [*Random symmetrizations of measurable sets*](https://arxiv.org/abs/0902.0462),
  arXiv v1, Theorems 3.4 and 3.5, for the convergence to the ball of random Steiner
  symmetrizations of bounded measurable sets, used in §2.2.
- Almut Burchard,
  [*A short course on rearrangement inequalities*](https://www.math.toronto.edu/almut/rearrange.pdf),
  2009, Theorem 4.7 and its proof from the isoperimetric inequality, for Pólya–Szegő at `p = 1`
  (§5.1).
- N. Fusco, F. Maggi, A. Pratelli,
  [*The sharp quantitative Sobolev inequality for functions of bounded variation*](https://cvgmt.sns.it/paper/1414/),
  J. Funct. Anal. 244 (2007), §1, inequality (1.4) and its equality case, for the sharp `BV`
  Sobolev inequality of §5.5; its Theorem 1.1 is a quantitative form.
- J. Cufí, J. Verdera,
  [*A general form of Green Formula and Cauchy Integral Theorem*](https://arxiv.org/abs/1306.6832),
  arXiv v1, the Theorem of §1 (Green's formula weighted by the winding number for closed
  rectifiable curves), used in §3.1 with `f(z) = z̄`.
- Terence Tao, [*The Brunn–Minkowski inequality for nilpotent groups*](https://terrytao.wordpress.com/2011/09/16/the-brunn-minkowski-inequality-for-nilpotent-groups/),
  Theorem 2, the Euclidean Prékopa–Leindler inequality (§1.1).
- Joel Tropp, [*Lectures on Convex Geometry*](https://tropp.caltech.edu/notes/Tro18-Lectures-Convex-LN.pdf),
  Lecture 8, for the parallel-volume and intrinsic-volume normalization, including
  lower-dimensional convex bodies.
- Freek Wiedijk, [isoperimetric entry and HOL Light proof](https://www.cs.ru.nl/~freek/100/hol.html#43),
  a classical planar comparison: arbitrary rectifiable simple closed curves and geometric circle
  equality.
- Lean Zulip discussions of [Brunn–Minkowski and Prékopa–Leindler](https://leanprover.zulipchat.com/#narrow/stream/116395-maths/topic/Brunn-Minkowski%20Inequality%20%2B%20Theory)
  and of [convex bodies](https://leanprover.zulipchat.com/#narrow/stream/116395-maths/topic/Convex%20bodies),
  and the Mathlib pull request [mathlib4 44802](https://github.com/leanprover-community/mathlib4/pull/44802)
  on one-dimensional Brunn–Minkowski, including `Real.volume_add_volume_le` and the compact-set
  version, as design references; Tau Ceti's one-dimensional Brunn–Minkowski follows that shape.

Prior formalizations, cited as prior work; none of them is an import or a prescribed proof
strategy, every result is assessed against the statements above, and reuse of code follows the
repository's coordination and attribution rules:

- Humanfia's [public Lean source archive](https://huggingface.co/datasets/humanfia-lab/lean-eval-source/tree/main/problems/isoperimetric_inequality)
  contains a higher-dimensional inequality for bounded sets with volume and the Hausdorff measure
  of the topological frontier, relevant to Layers 1 and 4; the finite-perimeter theory and the
  equality cases are requirements here.
- Jonathan Ho's [isoperimetric repository](https://github.com/hojonathanho/isoperimetric), also
  [in LeanPool](https://github.com/LeanPool/lean-pool/tree/main/LeanPool/Isoperimetric), develops
  Prékopa–Leindler, Brunn–Minkowski and outer-neighbourhood volume inequalities, relevant to
  Layers 1–2; a neighbourhood inequality still needs its bridge to perimeter and rigidity.
- [kim-em/isoperimetric](https://github.com/kim-em/isoperimetric) is a parallel development
  directed at the classical isoperimetric theorem; neither its implementation nor its
  dependencies prescribe this roadmap's design or discharge a target without its full statement.
