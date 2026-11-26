# Roadmap: mean width and Cauchy's formulas

**Summary.** This roadmap builds the classical integral geometry of support functions in a
finite-dimensional real inner product space. The support function of a compact set `K` is
`h_K(u) = max over x in K of ⟪x, u⟫`, its width in a direction `u` is `h_K(u) + h_K(−u)`, and its
mean width is the average of the width over the unit sphere for the uniform law. Sets are
compact (except in the parallelepiped criterion), usually convex and nonempty; length is the
one-dimensional Hausdorff measure, or the variation of a continuous parametrization.

The headline theorems are these.

- **Cauchy's perimeter formula.** In a plane, the boundary of a compact convex set with nonempty
  interior has length `π` times its mean width. In the complex plane this is
  `∫₀^{2π} h_K(e^{iθ}) dθ`. A segment, whose boundary is itself, shows that the interior cannot
  be dropped. Barbier's theorem follows: a nonempty compact convex plane set of constant
  width `w` has perimeter `π w`.
- **Crofton's formula for curves.** In dimension `d ≥ 1`, a curve continuous on `[a, b]` has length
  `1 / m_d` times the average over unit directions `u` of the variation of `⟪u, γ⟫`, where
  `m_d = Γ(d/2) / (√π Γ((d+1)/2))` is the average of `|⟪e, u⟫|` for a unit vector `e`
  (`m₂ = 2/π`, `m₃ = 1/2`). A closed continuous curve therefore has length at least `2 / m_d`
  times the mean width of the convex hull of its trace.
- **Mean width under a decomposition of the identity.** If unit vectors `v_i` and positive
  weights `c_i` satisfy `∑ c_i ⟪v_i, x⟫ v_i = x` for all `x`, and a nonempty compact convex set
  `S` satisfies `|⟪v_i, x⟫| ≤ 1` on `S`, then the mean width of `S` is at most `2 d m_d`, the mean
  width of the cube `[−1, 1]^d`, with equality exactly when `S` is the cube of an orthonormal
  basis. John's theorem supplies such data for a symmetric convex body in John's position.
- **Rogers–Shephard.** A compact convex set `K` in dimension `n` has
  `vol(K − K) ≤ C(2n, n) vol(K)`.

The support function is that of ConvexAnalysisAndDuality, taken real-valued; the uniform law on
the sphere, the identification of curve length with Hausdorff length and the gauge lemmas are
those of the pinned Tau Ceti. Isoperimetry identifies the perimeter of a convex body with the
Hausdorff length of its boundary, so Cauchy's formula here is also a formula for that perimeter,
and BanachSpaceTheory's John's theorem is the natural source of the decompositions of the last
layer.

Layer 1 below is the calculus of support and width functions, Layer 2 the difference body (when
it is a parallelepiped, and its volume), Layer 3 mean width and its spherical constants,
Layer 4 Crofton's and Cauchy's formulas, and Layer 5 the bound for decompositions of the
identity.

## Conventions

- `E` is a real inner product space, finite-dimensional from Layer 2 on (Layer 2.1 works in any
  real vector space), with `d = finrank ℝ E`,
  Borel σ-algebra and Lebesgue measure `volume`. Inner products are `⟪x, u⟫`; sets are added and
  scaled pointwise (`K + L`, `c • K`, `K − K`, `a +ᵥ K`).
- **Support function.** `realSupportFunction K u` is the `EReal.toReal` of
  ConvexAnalysisAndDuality's `supportFunction (innerₗ E) K u = ⨆ x ∈ K, ⟪x, u⟫`, written `h_K(u)`
  here. It is `0` for the empty set and in every direction in which `K` is unbounded; all
  statements assume `K` compact, and nonempty where the junk value would matter.
- **Width.** `widthFunction K u = h_K(u) + h_K(−u)`, written `w_K(u)`. `K` has constant width `w`
  when `w_K(u) = w` for every unit vector `u`.
- **Uniform law on the sphere.** `σ` is Tau Ceti's `TauCeti.Probability.uniformSphereMeasure E`,
  the surface measure `volume.toSphere` divided by its total mass; it is a probability measure
  when `d ≥ 1` and the zero measure when `d = 0`.
- **Mean width.** `meanWidth K = ∫ w_K(u) dσ(u)`, the average width, not the average of the
  support function: a ball of radius `r` has mean width `2r`.
- **Spherical constant.** `sphereAbsMean n = Γ(n/2) / (√π Γ((n+1)/2))`, written `m_n`, with real
  division; `m_0 = 0` because Mathlib sets `Γ(0) = 0`.
- **Length.** The length of a set is `μHE[1]`, the one-dimensional Hausdorff measure normalized
  as in Mathlib (`μHE[1] = μH[1]`, Tau Ceti `Measure.euclideanHausdorffMeasure_one`); the length
  of a curve `γ` on `[a, b]` is `eVariationOn γ (Icc a b)`, valued in `[0, ∞]`.
- **Parallelepipeds and cubes.** `parallelepiped v = {∑ tᵢ vᵢ | t ∈ [0, 1]^ι}` (Mathlib). The
  cube of an orthonormal basis `b` is `{x | ∀ i, |⟪bᵢ, x⟫| ≤ 1}`, which equals the zonotope
  `∑ᵢ [−bᵢ, bᵢ]`.

## Layer 1: support and width functions

### 1.1 The support function of a compact set

Prove `realSupportFunction_spec`: for a nonempty compact `K`,

- `h_K(u)` is the greatest value of `⟪x, u⟫` on `K`;
- `h_{K+L} = h_K + h_L` for every nonempty compact `L`;
- `h_{c•K} = c h_K` for `c ≥ 0`;
- `h_{−K}(u) = h_K(−u)`;
- if `K ⊆ closedBall 0 R` then `|h_K(u) − h_K(v)| ≤ R ‖u − v‖`.

(Proved here.) *Route.* `x ↦ ⟪x, u⟫` is continuous, so `IsCompact.exists_isMaxOn` gives a
maximizer `x₀ ∈ K`; the `EReal` supremum over `K` of `⟪x, u⟫` is then the real number `⟪x₀, u⟫`
(each term is at most it and one term equals it), and `toReal` returns it. For a sum, the
maximizers add: `⟪x + y, u⟫ ≤ h_K(u) + h_L(u)` on `K + L` with equality at the sum of maximizers.
For `c > 0` substitute `x = c y`; for `c = 0`, `0 • K = {0}` since `K` is nonempty and both sides
vanish. For `−K` substitute `x = −y`. For the Lipschitz bound, `⟪x, u⟫ ≤ ⟪x, v⟫ + ‖x‖ ‖u − v‖ ≤
h_K(v) + R ‖u − v‖` for `x ∈ K`, then take the maximum and exchange `u`, `v`. Sublinearity and
the closed convex hull criterion are ConvexAnalysisAndDuality's (Scope) and are not used.

**Checks.**
- `K = {p}`: `h_K(u) = ⟪p, u⟫`. `K = closedBall c r` (`r ≥ 0`): `h_K(u) = ⟪c, u⟫ + r ‖u‖`.
- Empty set: the definition gives `0` (the `toReal` of `⊥`), so the first item fails for `K = ∅`
  (no greatest element of the empty image); nonemptiness is needed.
- Open interval `K = (0, 1)` in `ℝ`: `h_K(1) = 1` is not attained, so compactness (closedness)
  is needed for the first item.

*Needs:* Mathlib `IsCompact.exists_isMaxOn`; ConvexAnalysisAndDuality §2.1 `supportFunction`
(definition).

### 1.2 Width and diameter

Prove `widthFunction_spec`: if `E` is nontrivial and `K` is nonempty and compact, then
`w_K = h_{K−K}`, `w_K ≥ 0`, and the diameter of `K` is the greatest value of `w_K` on the unit
sphere.

(Proved here.) *Route.* `w_K(u) = h_K(u) + h_{−K}(u) = h_{K+(−K)}(u)` by 1.1, and `K − K` is
`K + (−K)`; it is nonnegative since `0 ∈ K − K`. For a unit vector `u` and `x, y ∈ K`,
`⟪x − y, u⟫ ≤ ‖x − y‖ ≤ diam K` (`Metric.dist_le_diam_of_mem`, `K` bounded), so `w_K(u) ≤ diam K`.
The distance attains its maximum on the compact `K ×ˢ K` at `(x, y)`, and that maximum is
`diam K` (`Metric.diam_le_of_forall_dist_le`). If `x ≠ y`, `u = (x − y) / ‖x − y‖` has
`w_K(u) ≥ ⟪x − y, u⟫ = diam K`. If `x = y`, `K` is a point, `diam K = 0`, and any unit vector
(one exists since `E` is nontrivial) has width `0`.

**Checks.**
- `E = {0}`: the unit sphere is empty and has no greatest width, so nontriviality is needed.
- Equilateral triangle with side `1` in the plane: widths range over `[√3/2, 1]`; the maximum `1`
  is the diameter, the minimum `√3/2` is the height.

*Needs:* 1.1; Mathlib `Metric.dist_le_diam_of_mem`, `Metric.diam_le_of_forall_dist_le`,
`IsCompact.exists_isMaxOn`.

### Examples

- For `K = [0, 1]²` and `u = (cos θ, sin θ)`, `w_K(u) = |cos θ| + |sin θ|`, with maximum `√2`,
  the diameter.

### Dependencies

1.1: ConvexAnalysisAndDuality §2.1 (definition), Mathlib. 1.2: 1.1, Mathlib.

## Layer 2: the difference body

### 2.1 When the halved difference body is a parallelepiped

Prove `exists_half_smul_sub_eq_vadd_parallelepiped_iff`: let `V` be a real vector space, `ι` a
finite type, `K ⊆ V` convex and `v : ι → V` linearly independent. Then `½(K − K)` is a translate
of `parallelepiped v` if and only if `K` is.

(Proved here.) *Route.* Write `Q = {∑ sᵢ vᵢ | s ∈ [−1, 1]^ι}`; by `mem_parallelepiped_iff`,
`parallelepiped v − parallelepiped v = Q = 2 • (parallelepiped v − ½ ∑ vᵢ)`. If
`K = b +ᵥ parallelepiped v`, then `½(K − K) = ½ Q = (−½ ∑ vᵢ) +ᵥ parallelepiped v`.

Conversely let `½(K − K) = c +ᵥ parallelepiped v`. The right side is nonempty, so `K` is
nonempty; fix `k₀ ∈ K`. Since `0 ∈ ½(K − K)`, `c = −p` for some `p` in the parallelepiped, so
`c` and every element of `K − K` lie in `W = span v`, and `K ⊆ k₀ + W`. Let `φᵢ` be the
coordinates on `W` for the basis `v` (`LinearIndependent.repr`). In these coordinates
`c +ᵥ parallelepiped v` is the box `∏ [cᵢ, cᵢ + 1]`; since `½(K − K)` equals its own negative,
this box equals `∏ [−cᵢ − 1, −cᵢ]`, so `cᵢ = −½` and `K − K = Q`. Hence for each `i` the values
`φᵢ(x − k₀)`, `x ∈ K`, are bounded with supremum minus infimum `1` (the supremum of `φᵢ` on
`K − K` is that difference). Let `mᵢ` be the infimum and `K₀ = K − (k₀ + ∑ (mᵢ + ½) vᵢ)`, whose
coordinates lie in `[−½, ½]`, so `K₀ ⊆ ½Q`, with `K₀ − K₀ = Q`. For `σ ∈ {−1, 1}^ι`,
`∑ σᵢ vᵢ ∈ Q = K₀ − K₀` is `x − y` with `x, y ∈ K₀`; coordinates `xᵢ − yᵢ = σᵢ` with
`xᵢ, yᵢ ∈ [−½, ½]` force `xᵢ = σᵢ/2`, so every point `½ ∑ σᵢ vᵢ` lies in `K₀`. By convexity `K₀`
contains their convex hull, which is the image of `convexHull {−½, ½}^ι = [−½, ½]^ι`
(`convexHull_pi`, `convexHull_pair`, `segment_eq_Icc`) under the linear map `s ↦ ∑ sᵢ vᵢ`
(`LinearMap.image_convexHull`), that is `½Q`. So `K₀ = ½Q = (−½ ∑ vᵢ) +ᵥ parallelepiped v`, and
`K = (k₀ + ∑ mᵢ vᵢ) +ᵥ parallelepiped v`. No topology is used.

**Checks.**
- Linear independence is needed: `T = conv{(0,0), (2,0), (0,2)}` in `ℝ²` is convex and
  `½(T − T)` is the hexagon with vertices `±(1,0), ±(0,1), ±(1,−1)`, which is
  `−(1,0) +ᵥ parallelepiped ((1,0), (0,1), (1,−1))`; `T` is a triangle, not a translate of that
  hexagon.
- Convexity is needed: the boundary `∂Q₁` of the unit square satisfies `∂Q₁ − ∂Q₁ = [−1, 1]²`
  (for `s, t ∈ [0, 1]`: `(s, t) = (1, t) − (1 − s, 0)` and `(s, −t) = (s, 0) − (0, t)`, and the
  other signs by swapping), so `½(∂Q₁ − ∂Q₁) = −(½, ½) +ᵥ parallelepiped (e₁, e₂)`, while `∂Q₁` is
  not a translate of the square.
- `ι` empty: the parallelepiped is `{0}` and both sides say that `K` is a single point; for
  `K = ∅` both sides are false.

*Needs:* Mathlib `parallelepiped`, `mem_parallelepiped_iff`, `LinearIndependent.repr`,
`convexHull_pi`, `convexHull_pair`, `segment_eq_Icc`, `LinearMap.image_convexHull`.

### 2.2 The Rogers–Shephard inequality

Prove `volume_sub_le_choose_mul_volume`: if `E` has dimension `n` and `K ⊆ E` is compact and
convex, then `vol(K − K) ≤ C(2n, n) vol(K)` (Rogers–Shephard 1957; statement for convex bodies
in Colesanti, p. 3, (5)).

(Proved here.) *Route.* If `K = ∅`, then `K − K = ∅` and both sides are `0`. If `K` is nonempty
with empty interior, its affine span is a proper affine subspace
(`Convex.interior_nonempty_iff_affineSpan_eq_top`), so `K − K` lies in the proper subspace
parallel to it and has volume `0` (`Measure.addHaar_submodule`). If `K` is nonempty and `n = 0`,
`K = K − K = {0}` and both volumes are `1 = C(0, 0)`. Otherwise `n ≥ 1` and `0 < vol K < ∞`.

Let `D = K − K`, compact, convex, symmetric, with `0` in its interior, and `g` its gauge, which is
continuous (`continuous_gauge`) with `{g ≤ s} = s • D` for `s > 0`
(`TauCeti.setOfPred_gauge_le_eq_closure_smul_of_pos`, `D` closed), hence
`vol(D ∩ {g ≤ s}) = sⁿ vol D` for `s ∈ [0, 1]` (`Measure.addHaar_smul`; the point `{0}` is null).

Let `f(x) = vol(K ∩ (K + x))`. Tonelli for the indicator of the closed set
`{(x, y) | y ∈ K, y − x ∈ K}` (`lintegral_lintegral_swap`) and invariance of `volume` under
translation and negation give `∫ f = vol(K)²`, and `f = 0` off `D`. For `x ∈ D` put `t = g(x) ∈
[0, 1]`. If `t = 0` then `x = 0` (`D` is bounded) and `f(0) = vol K`. If `t > 0` then
`z = x / t ∈ D`, `z = a − b` with `a, b ∈ K`, and for every `k ∈ K` the point
`y = (1 − t) k + t a` lies in `K` and `y − x = (1 − t) k + t b` lies in `K`. So
`(1 − t) • K + t a ⊆ K ∩ (K + x)` and `f(x) ≥ (1 − t)ⁿ vol K`.

By the layer-cake formula (`lintegral_comp_eq_lintegral_meas_le_mul`) and the distribution of
`g` above, `∫_D (1 − g)ⁿ = vol D · ∫₀¹ (1 − r)ⁿ n r^{n−1} dr = vol D · n! n! / (2n)!`, Euler's beta
integral `n · Γ(n) Γ(n + 1) / Γ(2n + 1)` (Mathlib `Complex.betaIntegral_eq_Gamma_mul_div`). Hence
`vol(K)² = ∫ f ≥ vol K · vol D / C(2n, n)`; dividing by `vol K ∈ (0, ∞)` gives the claim.

**Checks.**
- The standard simplex `T = {x ≥ 0, ∑ xᵢ ≤ 1}` in `ℝⁿ` gives equality: `T − T` is the set where
  the positive parts and the negative parts of the coordinates each sum to at most `1`; the
  orthant with `k` positive coordinates contributes `1 / (k! (n − k)!)`, so
  `vol(T − T) = ∑_k C(n, k)² / n! = C(2n, n) vol T` (Vandermonde): ratios `2, 6, 20` for
  `n = 1, 2, 3`.
- `[0, 1]²`: `K − K = [−1, 1]²` has area `4 ≤ C(4, 2) = 6`.
- Convexity is needed: `K = [0, 1] ∪ [10, 11]` in `ℝ` has
  `K − K = [−11, −9] ∪ [−1, 1] ∪ [9, 11]` of length `6 > C(2, 1) · 2 = 4`.
- The beta integral: `∫₀¹ n r^{n−1} (1 − r)ⁿ dr = 1/2, 1/6, 1/20, 1/70` for `n = 1, …, 4`.

*Needs:* Mathlib `Convex.interior_nonempty_iff_affineSpan_eq_top`, `Measure.addHaar_submodule`,
`continuous_gauge`, `Measure.addHaar_smul`, `lintegral_lintegral_swap`,
`lintegral_comp_eq_lintegral_meas_le_mul`, `Complex.betaIntegral_eq_Gamma_mul_div`; Tau Ceti
`TauCeti.setOfPred_gauge_le_eq_closure_smul_of_pos`.

### Examples

- The lower bound `2ⁿ vol K ≤ vol(K − K)` for nonempty measurable `K` in dimension `n ≥ 1` is
  Tau Ceti's Brunn–Minkowski inequality `TauCeti.volume_rpow_add_volume_rpow_le` for `K` and
  `−K`, with `vol(−K) = vol K`; the square `[0, 1]²` gives equality, and with 2.2 the
  difference body of a planar convex body has between `4` and `6` times its area.

### Dependencies

2.1: Mathlib. 2.2: Mathlib, Tau Ceti `TauCeti.setOfPred_gauge_le_eq_closure_smul_of_pos`
(and Tau Ceti's Brunn–Minkowski inequality for the Example).

## Layer 3: mean width

### 3.1 Mean width

Prove `meanWidth_spec`: for nonempty compact `K`, `meanWidth K = 2 ∫ h_K dσ`; the mean width is
additive under Minkowski sums of nonempty compact sets, positively homogeneous
(`meanWidth (c • K) = c · meanWidth K` for `c ≥ 0`), monotone (`K ⊆ L` with `L` compact gives
`meanWidth K ≤ meanWidth L`), invariant under every rigid motion `x ↦ a + f x` with `f` a linear
isometry, and nonnegative.

(Proved here.) *Route.* By 1.1 `h_K` is continuous, hence bounded on the sphere, and `σ` is
finite (`TauCeti.Probability.isFiniteMeasure_uniformSphereMeasure`), so every integrand here is
integrable. `σ` is invariant under `u ↦ −u` (`LinearIsometryEquiv.map_uniformSphereMeasure` for
`LinearIsometryEquiv.neg ℝ`), so `∫ h_K(−u) dσ = ∫ h_K dσ` and `meanWidth K = 2 ∫ h_K dσ`.
Additivity and homogeneity follow from 1.1 and linearity of the integral; monotonicity from
`h_K ≤ h_L` pointwise (the maximizer of 1.1 for `K` lies in `L`); invariance from
`h_{a + f K}(u) = ⟪a, u⟫ + h_K(f⁻¹ u)`, the cancellation of `⟪a, u⟫ + ⟪a, −u⟫` in the width and
`LinearIsometryEquiv.map_uniformSphereMeasure` for `f⁻¹`; nonnegativity from 1.2 (for `d = 0`
the measure is zero and every statement reads `0 = 0` or `0 ≤ 0`).

**Checks.**
- A ball of radius `r ≥ 0` in dimension `d ≥ 1` has width `2r` in every unit direction, so
  mean width `2r`; the plausible variant `∫ h_K dσ` (no factor two) would give `r`, and a
  variant averaging `h_K` against the unnormalized surface measure would give `r` times the
  area of the sphere.
- Additivity needs nonemptiness: `∅ + L = ∅` has mean width `0`, not `meanWidth L`.

*Needs:* 1.1, 1.2; Tau Ceti `TauCeti.Probability.uniformSphereMeasure`,
`TauCeti.Probability.isFiniteMeasure_uniformSphereMeasure`,
`LinearIsometryEquiv.map_uniformSphereMeasure`.

### 3.2 The spherical constant and zonotopes

Prove `integral_abs_inner_and_meanWidth_zonotope`: for every `v ∈ E`,
`∫ |⟪v, u⟫| dσ(u) = m_d ‖v‖`, and for every finite family `w`,
`meanWidth (∑ᵢ [−wᵢ, wᵢ]) = 2 m_d ∑ᵢ ‖wᵢ‖`.

(Proved here.) *Route.* For `d ≥ 2`, Tau Ceti's
`TauCeti.Probability.map_sq_inner_uniformSphereMeasure` says that `⟪v, u⟫²` has the law of
`‖v‖² Y` with `Y` beta-distributed with parameters `1/2` and `β = (d − 1)/2`.
Hence `∫ |⟪v, u⟫| dσ = ‖v‖ ∫ y^{1/2} dBeta(1/2, β)`, and
`TauCeti.Probability.integral_rpow_mul_one_sub_rpow_betaMeasure` (exponents `1/2` and `0`) gives
`B(1, β) / B(1/2, β) = Γ(β + 1/2) / (√π Γ(β + 1)) = m_d`, using `ProbabilityTheory.beta` (the
quotient of Gamma values), `Real.Gamma_one_half_eq` and `Real.Gamma_add_one`. For `d = 1`, `σ`
gives mass `1/2` to each of the two unit vectors
(`TauCeti.Probability.map_inner_uniformSphereMeasure_of_finrank_eq_one`), so the average is
`‖v‖ = m₁ ‖v‖`. For `d = 0`, `v = 0` and `σ = 0`. For the zonotope, `h_{[−w, w]}(u) = |⟪w, u⟫|`,
so by 1.1 the zonotope has support function `∑ᵢ |⟪wᵢ, u⟫|` and width twice that; integrate.

**Checks.**
- `m₁ = 1`, `m₂ = 2/π`, `m₃ = 1/2`, `m₄ = 4/(3π)`, `m₅ = 3/8` from the Gamma formula. Independently,
  `m₂ = (1/2π) ∫₀^{2π} |cos θ| dθ = 2/π`, and `m₃ = 1/2` because `⟪e, u⟫` is uniform on `[−1, 1]`
  in dimension three (Archimedes); the density `(1 − t²)^{(d−3)/2}` of `⟪e, u⟫` gives the same
  values for `d = 2, …, 7`.
- The cube `[−1, 1]^d` (`wᵢ = eᵢ`) has mean width `2 d m_d`: `2`, `8/π`, `3`, `32/(3π)` for
  `d = 1, …, 4`. The segment `[0, v] = v/2 + [−v/2, v/2]` has mean width `m_d ‖v‖`, not
  `2 m_d ‖v‖` (that is `[−v, v]`).

*Needs:* 1.1, 3.1; Tau Ceti `TauCeti.Probability.map_sq_inner_uniformSphereMeasure`,
`TauCeti.Probability.integral_rpow_mul_one_sub_rpow_betaMeasure`,
`TauCeti.Probability.map_inner_uniformSphereMeasure_of_finrank_eq_one`; Mathlib
`ProbabilityTheory.beta`, `Real.Gamma_one_half_eq`, `Real.Gamma_add_one`.

### 3.3 Mean width in the plane

Prove `meanWidth_eq_integral_exp`: for compact `K ⊆ ℂ`,
`meanWidth K = (1/π) ∫₀^{2π} h_K(e^{iθ}) dθ`.

(Proved here.) *Route.* Tau Ceti's `TauCeti.Probability.map_homeomorphCircle'_haarAddCircle`
identifies `σ` on the unit circle of `ℂ` with the image of the Haar probability of
`AddCircle (2π)` under `θ ↦ e^{iθ}` (`AddCircle.homeomorphCircle'_apply_mk`). By
`AddCircle.volume_eq_smul_haarAddCircle` and `AddCircle.intervalIntegral_preimage`,
`∫ w_K dσ = (1/2π) ∫₀^{2π} (h_K(e^{iθ}) + h_K(−e^{iθ})) dθ`; the integrand is continuous by 1.1
(or zero, for `K = ∅`). Since `−e^{iθ} = e^{i(θ+π)}`, periodicity turns the second integral into
the first, giving `(1/π) ∫₀^{2π} h_K(e^{iθ}) dθ`.

**Checks.**
- Unit disc: `h = 1`, mean width `2`. Square `[−1, 1]²`: `h(θ) = |cos θ| + |sin θ|`, mean width
  `8/π`, agreeing with 3.2.

*Needs:* 1.1, 3.1; Tau Ceti `TauCeti.Probability.map_homeomorphCircle'_haarAddCircle`; Mathlib
`AddCircle.homeomorphCircle'_apply_mk`, `AddCircle.volume_eq_smul_haarAddCircle`,
`AddCircle.intervalIntegral_preimage`.

### Examples

- The equilateral triangle with side `1` has mean width `3/π` (by 4.3), between its minimal
  width `√3/2` and its diameter `1`.

### Dependencies

3.1: 1.1, 1.2, Tau Ceti. 3.2: 1.1, 3.1, Tau Ceti, Mathlib. 3.3: 1.1, 3.1, Tau Ceti, Mathlib.

## Layer 4: length, Crofton's formula and Cauchy's formula

### 4.1 Crofton's formula for curves

Prove `ofReal_mul_eVariationOn_eq_lintegral`: if `γ : ℝ → E` is continuous on `[a, b]`, then
`m_d · V(γ) = ∫ V(⟪u, γ⟫) dσ(u)` in `[0, ∞]`, where `V` is the variation on `[a, b]` (Ghomi,
Lemma 2.3, p. 5, for rectifiable plane curves, where `m₂ = 2/π` gives the factor `1/4` with
respect to `dθ`).

(Proved here.) *Route.* For a partition `a = t₀ ≤ … ≤ t_k = b` with increments
`Δⱼ = γ(t_{j+1}) − γ(t_j)`, 3.2 and `lintegral_finsetSum` give
`∫ ∑ⱼ |⟪u, Δⱼ⟫| dσ = m_d ∑ⱼ ‖Δⱼ‖`. Let `P_k` be the dyadic partition of `[a, b]` into `2^k` equal
pieces and `S_k(f)` the corresponding sum `∑ⱼ |f(t_{j+1}) − f(t_j)|`; refining a partition does
not decrease such sums (triangle inequality), so `S_k(f)` is monotone in `k`. For `f` continuous
on `[a, b]` with values in a normed space, `sup_k S_k(f) = V(f)`: `S_k(f) ≤ V(f)`
(`eVariationOn.sum_le`), and for a monotone sequence `u₀ ≤ … ≤ u_N` in `[a, b]` and `ε > 0`, uniform
continuity (`IsCompact.uniformContinuousOn_of_continuous`) gives `k` with
`‖f(x) − f(y)‖ < ε` when `|x − y| ≤ (b − a)/2^k`; rounding each `u_i` down to a point `p_i` of
`P_k` keeps the order and changes the sum by at most `2Nε`, and the sum over the `p_i` is at most
`S_k(f)`. Apply this to `γ` and to each `⟪u, γ⟫`. Each `u ↦ S_k(⟪u, γ⟫)` is continuous, and
monotone in `k`, so the monotone convergence theorem (`lintegral_iSup`) and
`ENNReal.mul_iSup` give `∫ V(⟪u, γ⟫) dσ = sup_k m_d S_k(γ) = m_d V(γ)`, including the value `∞`.
If `a ≥ b` both sides are `0`; if `d = 0` both are `0` (`m₀ = 0`, `σ = 0`).

**Checks.**
- Circle of radius `r` in the plane, `γ(t) = r e^{it}` on `[0, 2π]`: length `2πr`, every
  projection has variation `4r`, and `m₂ · 2πr = 4r`.
- Segment `γ(t) = t e₁` on `[0, 1]` in `ℝ³`: the projection on `u` has variation `|u₁|`, of
  average `m₃ = 1/2`.

*Needs:* 3.2; Mathlib `eVariationOn.sum_le`, `IsCompact.uniformContinuousOn_of_continuous`,
`lintegral_finsetSum`, `lintegral_iSup`, `ENNReal.mul_iSup`,
`ofReal_integral_eq_lintegral_ofReal`.

### 4.2 Closed curves and the mean width of their hull

Prove `ofReal_two_mul_meanWidth_convexHull_le`: if `γ` is continuous on `[a, b]` and
`γ a = γ b`, then `2 · meanWidth (conv γ([a, b])) ≤ m_d · V(γ)`. In the plane this gives
`length ≥ π · meanWidth`, which is at least `π` times the minimal width (Ghomi, Corollary 2.4,
p. 6, for the minimal width).

(Proved here.) *Route.* If `a > b` the trace is empty and the left side is `0`. Otherwise
`A = γ([a, b])` is compact and nonempty. For a unit vector `u` let `f = ⟪u, γ⟫`, with maximum
`M` at `s` and minimum `m` at `s'` on `[a, b]`. Splitting `[a, b]` at `s` and `s'`
(`eVariationOn.Icc_add_Icc`) and bounding the variation of each piece below by the distance of
its end values gives, if `s ≤ s'`, `V(f) ≥ |f(a) − M| + (M − m) + |m − f(b)| ≥ 2(M − m)`, since
`f(a) = f(b)`; if `s' < s` the same bound holds with `M` and `m` exchanged in the outer terms.
Here `M − m = w_A(u)`, and `w_{conv A} = w_A`: the closed half-space `{⟪x, u⟫ ≤ h_A(u)}`
contains `A`, hence `conv A` (`convexHull_min`), and `A ⊆ conv A`. Integrating over `σ` and
applying 4.1 gives `ofReal(2 · meanWidth (conv A)) ≤ ∫ V(⟪u, γ⟫) dσ = m_d · V(γ)`
(`ofReal_integral_eq_lintegral_ofReal`; the width is continuous by 1.1).

**Checks.**
- Closedness is needed: the segment from `0` to `e₁` in `ℝ³`, traversed once, has length `1`
  and `2 · meanWidth = 2 m₃ = 1 > m₃ · 1 = 1/2`.
- Equality occurs: the boundary of the unit square in a plane of `ℝ³`, of length `4`, has
  `2 · meanWidth = 2 (m₃ + m₃) = 2 = m₃ · 4`.

*Needs:* 1.1, 3.1, 4.1; Mathlib `eVariationOn.Icc_add_Icc`, `convexHull_min`,
`ofReal_integral_eq_lintegral_ofReal`.

### 4.3 Cauchy's perimeter formula

Prove `euclideanHausdorffMeasure_frontier_eq`: if `finrank ℝ E = 2` and `K` is compact, convex,
with nonempty interior, then `μHE[1] (frontier K) = π · meanWidth K`. With 3.3, for `K ⊆ ℂ` this
is `∫₀^{2π} h_K(e^{iθ}) dθ` (for smooth ovals: Resnikoff, §2.2.2, eq. (2.28), p. 15, and the
theorem after it, p. 16).

(Proved here.) *Route.*

1. *A parametrization of the boundary.* Fix `c` in the interior of `K`, an orthonormal basis
   `b₀, b₁` of `E` (`stdOrthonormalBasis`), `e(θ) = cos θ b₀ + sin θ b₁` and `K' = −c +ᵥ K`, a
   convex neighbourhood of `0` contained in some `closedBall 0 R`. Its gauge `g` is continuous
   (`continuous_gauge`) and `g(e θ) ≥ 1/R > 0` (`le_gauge_of_subset_closedBall`). Put
   `γ(θ) = c + g(e θ)⁻¹ • e θ`, continuous and `2π`-periodic. By `gauge_smul_of_nonneg`,
   `g(γ θ − c) = 1`, so `γ θ − c ∈ frontier K'` (`gauge_eq_one_iff_mem_frontier`) and
   `γ θ ∈ frontier K` (translation is a homeomorphism). Conversely, for `x ∈ frontier K`,
   `y = x − c ≠ 0` (`c` is interior), and with `z = ⟪b₀, y⟫ + ⟪b₁, y⟫ i ∈ ℂ` and `θ = arg z`
   (shifted by `2π` into `[0, 2π)`), `Complex.norm_mul_cos_arg` and `Complex.norm_mul_sin_arg` give
   `y = ‖y‖ e(θ)`; then `g(e θ) = 1/‖y‖` and `γ θ = x`. If `γ θ = γ θ'` then `e θ` and `e θ'` are
   positive multiples of each other, hence equal, so `θ = θ'` for `θ, θ' ∈ [0, 2π)`. Thus `γ` maps
   `[0, 2π]` onto `frontier K`, is injective on `(0, 2π)`, and `γ 0 = γ 2π`.
2. *Length of the boundary.* Tau Ceti's
   `ContinuousOn.eVariationOn_eq_euclideanHausdorffMeasure_image` gives
   `μHE[1] (frontier K) = V(γ)` on `[0, 2π]`.
3. *Each projection is unimodal.* Fix a unit vector `u`, let `f = ⟪u, γ⟫`, `M = h_K(u)` and
   `m = −h_K(−u)`. A maximizer of `⟪·, u⟫` on `K` is not interior (moving along `u` increases the
   value), so it lies on the frontier, and `M`, `m` are the maximum and minimum of `f` on
   `[0, 2π]`; `m < M` because `c ± εu ∈ K` for small `ε > 0`.
   *Two points on each level.* For `m < t < M`, the line `L_t = {⟪·, u⟫ = t}` meets
   `frontier K` in exactly two points. Indeed `⟪·, u⟫` maps the interior of `K`, which is convex
   (hence connected, `Convex.isPreconnected`) and open, onto an open interval whose closure
   contains `[m, M]`, since `K = closure (interior K)`
   (`Convex.closure_interior_eq_closure_of_nonempty_interior`); so some interior `y` lies on
   `L_t`. `L_t ∩ K` is a compact segment `[p, q]` containing `y`, with `p ≠ q` because a small
   segment of `L_t` around `y` lies in `K`. Every point of the open segment `(p, q)` lies in an
   open segment from `y` to `p` or to `q`, or is `y`, hence is interior
   (`Convex.openSegment_interior_closure_subset_interior`); `p` and `q` are frontier points,
   being limits of points of `L_t` outside `K`. So `frontier K ∩ L_t = {p, q}`, and by step 1 the
   value `t` is taken by `f` at exactly two points of `[0, 2π)`.
   *Unimodality.* Let `θ_M, θ_m ∈ [0, 2π)` with `f(θ_M) = M`, `f(θ_m) = m`; suppose
   `θ_M < θ_m` (otherwise apply the argument to `−f`, exchanging the roles). Then `f` is
   antitone on `[θ_M, θ_m]`: if `s < s'` there with `f(s) < f(s')`, then `θ_M < s < s' < θ_m`
   (since `f(θ_M) = M` and `f(θ_m) = m`), and for `t` strictly between `f(s)` and `f(s')` the
   intermediate value theorem (`intermediate_value_Icc`, `intermediate_value_Icc'`) gives
   parameters with value `t` in `(θ_M, s)`, `(s, s')` and `(s', θ_m)`, and a fourth one in
   `(θ_m, 2π) ∪ [0, θ_M)`: on `[θ_m, 2π]` if `f(2π) ≥ t` (the endpoint `2π` counts as `0`, which is
   then not `θ_M` because `f(0) = t < M`), on `(0, θ_M)` if `f(0) < t`. Four parameters in
   `[0, 2π)` with value `t ∈ (m, M)` contradict the two-point property. The same argument shows
   that `f` is monotone on `[θ_m, 2π]` and on `[0, θ_M]`.
   *Variation.* By `eVariationOn.Icc_add_Icc` and `MonotoneOn.eVariationOn_eq` (for `−f` on the
   antitone piece), `V(f) = (M − f(0)) + (M − m) + (f(2π) − m) = 2(M − m) = 2 w_K(u)`, using
   `f(0) = f(2π)`.
4. *Averaging.* By 4.1 with `m₂ = Γ(1)/(√π Γ(3/2)) = 2/π` (`Real.Gamma_one`,
   `Real.Gamma_add_one`, `Real.Gamma_one_half_eq`), `ofReal(2/π) · V(γ) = ∫ ofReal(2 w_K) dσ =
   ofReal(2 · meanWidth K)` (`ofReal_integral_eq_lintegral_ofReal`; `w_K` is continuous by 1.1 and
   `σ` is a probability measure). The right side is finite, so `V(γ) = ofReal(π · meanWidth K)`.

**Checks.**
- Triangle `(0,0), (1,0), (0,1)`: `∫₀^{2π} h_K(e^{iθ}) dθ = 2 + √2`, its perimeter. Unit square:
  `4`. Quadrilateral `(0,0), (3,0), (4,2), (1,3)`: `3 + √5 + 2√10` on both sides. Disc of
  radius `r`: `2πr = π · 2r`.
- The interior is needed: a segment of length `ℓ` in the plane is its own frontier, with
  `μHE[1] = ℓ`, while `π · meanWidth = π m₂ ℓ = 2ℓ`.

*Needs:* 1.1, 3.1, 4.1; Tau Ceti `ContinuousOn.eVariationOn_eq_euclideanHausdorffMeasure_image`,
`TauCeti.Probability.isProbabilityMeasure_uniformSphereMeasure`; Mathlib `stdOrthonormalBasis`,
`continuous_gauge`, `le_gauge_of_subset_closedBall`, `gauge_smul_of_nonneg`,
`gauge_eq_one_iff_mem_frontier`, `Complex.norm_mul_cos_arg`, `Complex.norm_mul_sin_arg`,
`Convex.isPreconnected`, `Convex.closure_interior_eq_closure_of_nonempty_interior`,
`Convex.openSegment_interior_closure_subset_interior`, `intermediate_value_Icc`,
`intermediate_value_Icc'`, `eVariationOn.Icc_add_Icc`, `MonotoneOn.eVariationOn_eq`,
`Real.Gamma_one`, `Real.Gamma_add_one`, `Real.Gamma_one_half_eq`,
`ofReal_integral_eq_lintegral_ofReal`.

### 4.4 Barbier's theorem

Prove `euclideanHausdorffMeasure_frontier_eq_of_constant_width`: if `finrank ℝ E = 2` and `K`
is nonempty, compact, convex, of constant width `w`, then `μHE[1] (frontier K) = π w`
(Barbier; Resnikoff, §2.2.2, p. 16, states it as a consequence of the formula for ovals).

(Proved here.) *Route.* `σ` is a probability measure, so `meanWidth K = w`. If `w > 0`, `K` has
nonempty interior: otherwise its affine span is a proper affine subspace
(`Convex.interior_nonempty_iff_affineSpan_eq_top`), a point or a line, and a unit vector `u`
orthogonal to its direction has `w_K(u) = 0`. Then 4.3 applies. If `w = 0`, 1.2 gives
`diam K = 0`, so `K = {p}`; `frontier {p} = {p}` (`interior_singleton`) and a point has
`μHE[1] = μH[1]`-measure `0` (`Measure.euclideanHausdorffMeasure_one`,
`Measure.nullSingletonClass_hausdorff`). The case `w < 0` does not occur (1.2).

**Checks.**
- The Reuleaux triangle of width `1` is bounded by three circular arcs of radius `1` and angle
  `π/3`, of total length `π`.
- The unit disc: width `2`, perimeter `2π`.

*Needs:* 1.2, 3.1, 4.3; Tau Ceti `Measure.euclideanHausdorffMeasure_one`; Mathlib
`Convex.interior_nonempty_iff_affineSpan_eq_top`, `interior_singleton`,
`Measure.nullSingletonClass_hausdorff`.

### Examples

- For a plane convex body, 4.2 and 4.3 together say that among closed curves whose trace has
  convex hull `K`, the boundary of `K` (traversed once) is the shortest.

### Dependencies

4.1: 3.2, Mathlib. 4.2: 1.1, 3.1, 4.1, Mathlib. 4.3: 1.1, 3.1, 4.1, Tau Ceti, Mathlib.
4.4: 1.2, 3.1, 4.3, Tau Ceti, Mathlib.

## Layer 5: mean width under a decomposition of the identity

### 5.1 The cube bound

Prove `meanWidth_le_of_isotropic`: let `vᵢ` (`i` in a finite type) be unit vectors and `cᵢ > 0`
with `∑ᵢ cᵢ ⟪vᵢ, x⟫ vᵢ = x` for every `x`, and let `S` be nonempty, compact and convex with
`|⟪vᵢ, x⟫| ≤ 1` for all `i` and `x ∈ S`. Then `meanWidth S ≤ 2 d m_d`, with equality if and only
if `S = {x | ∀ j, |⟪bⱼ, x⟫| ≤ 1}` for an orthonormal basis `b` indexed by `Fin d`. For symmetric
bodies in John's position (contact points `vᵢ` with weights `cᵢ`) this is the theorem of
Schechtman and Schmuckenschläger, with Barthe's equality case, as stated in Böröczky–Fodor–Hug,
Theorem 1.1(ii), p. 3–4; here no symmetry, no ball inside `S` and no restriction on the `vᵢ`
(repetitions and opposite pairs allowed) are assumed.

(Proved here.) *Route.*

1. *Inequality.* Pairing the decomposition with `u` gives, for `x ∈ S`,
   `⟪x, u⟫ = ∑ᵢ cᵢ ⟪vᵢ, x⟫ ⟪vᵢ, u⟫ ≤ Z(u) := ∑ᵢ cᵢ |⟪vᵢ, u⟫|`, so `h_S ≤ Z` and, as `Z` is even,
   `w_S ≤ 2Z`. By 3.2, `meanWidth S ≤ 2 m_d ∑ᵢ cᵢ`. Pairing the decomposition at `x = b'ⱼ` with
   `b'ⱼ` and summing over an orthonormal basis `b'` (`OrthonormalBasis.sum_inner_mul_inner`) gives
   `d = ∑ᵢ cᵢ ‖vᵢ‖² = ∑ᵢ cᵢ`.
2. *Equality forces `h_S = Z`.* If `meanWidth S = 2 d m_d`, then `2Z − w_S` is continuous (1.1),
   nonnegative and of integral `0`. The measure `σ` is positive on nonempty open subsets of the
   sphere: `volume.toSphere` is (`Measure.toSphere.instIsOpenPosMeasure`), and `σ` is its
   multiple by the inverse of its total mass (`TauCeti.Probability.uniformSphereMeasure_def`),
   which is not `0` because the total mass is finite (`Measure.isOpenPosMeasure_smul`). So
   `2Z − w_S`, vanishing almost everywhere (`integral_eq_zero_iff_of_nonneg`), is identically
   `0` (`Continuous.ae_eq_iff_eq`): `2Z = w_S` on the sphere; with `h_S ≤ Z` at `u`
   and `−u` this gives `h_S = Z` on the sphere, and on all of `E` by homogeneity (1.1). (For
   `d = 0` the sphere is empty, there are no unit vectors, `S = {0}` and both sides of the
   equivalence hold.)
3. *The contact vectors are an orthonormal basis up to signs.* At `u = v_t`, with
   `a_i = ⟪vᵢ, v_t⟫ ∈ [−1, 1]`: `1 ≥ h_S(v_t) = Z(v_t) = ∑ᵢ cᵢ |aᵢ| ≥ ∑ᵢ cᵢ aᵢ² = ⟪v_t, v_t⟫ = 1`
   (the first inequality is the hypothesis on `S`, the last equality the decomposition paired
   with `v_t`). So `cᵢ |aᵢ| (1 − |aᵢ|) = 0`, and as `cᵢ > 0` each pair `vᵢ, v_t` is orthogonal or
   `vᵢ = ±v_t` (`abs_real_inner_div_norm_mul_norm_eq_one_iff`). Group the indices by the line
   `ℝ vᵢ` and choose one unit vector `r_ℓ` on each line `ℓ`; these are orthonormal, and since
   `(±r)⟪±r, x⟫ = r⟪r, x⟫` the decomposition reads `x = ∑_ℓ C_ℓ ⟪r_ℓ, x⟫ r_ℓ` with `C_ℓ` the sum
   of the `cᵢ` on `ℓ`. At `x = r_ℓ` this gives `C_ℓ = 1`; every `x` lies in the span of the `r_ℓ`,
   so there are exactly `d` lines, and the `r_ℓ`, reindexed by `Fin d`, form an orthonormal basis
   `b` (`basisOfOrthonormalOfCardEqFinrank`).
4. *`S` is the cube.* Now `Z(u) = ∑ⱼ |⟪bⱼ, u⟫|`, the support function of the cube
   `Q = {x | ∀ j, |⟪bⱼ, x⟫| ≤ 1} = ∑ⱼ [−bⱼ, bⱼ]` (1.1). Each `bⱼ` is some `±vᵢ`, so the
   hypothesis gives `S ⊆ Q`. If `x ∈ Q \ S`, separation of `x` from the closed convex `S`
   (`geometric_hahn_banach_point_closed`, the functional represented by a vector `y` through
   `InnerProductSpace.toDual`) gives
   `⟪x, y⟫ > h_S(y) = Z(y) = h_Q(y) ≥ ⟪x, y⟫`, a contradiction. So `S = Q`.
5. *Converse.* If `S = Q` for an orthonormal basis `b`, then `S = ∑ⱼ [−bⱼ, bⱼ]` and 3.2 gives
   `meanWidth S = 2 m_d · d`.

**Checks.**
- Positivity of the weights is needed: in the plane, `v = (cos 30°, sin 30°)`,
  `(cos 30°, −sin 30°)`, `(1, 0)` with `c = (2, 2, −2)` decompose the identity exactly; the set
  where `|⟪vᵢ, x⟫| ≤ 1` is the hexagon with vertices `(0, ±2)`, `(±1, ±(2 − √3))`, of perimeter
  `16 − 4√3 > 8`, so by 4.3 its mean width `(16 − 4√3)/π` exceeds `2 · 2 · m₂ = 8/π`.
- Unit vectors are needed: `vᵢ = eᵢ/2`, `cᵢ = 4` in the plane decompose the identity, and
  `S = [−2, 2]²` has mean width `16/π > 8/π`.
- Closedness is needed for the equality case: the open cube satisfies every other hypothesis and
  has the mean width of the closed cube. Convexity is needed: the `2^d` vertices of the cube
  have the same support function as the cube. Nonemptiness is needed in dimension `0`, where
  `S = ∅` has mean width `0 = 2 · 0 · m₀` but is not the cube `{0}`.
- Strict inequality: `v` at angles `0°, 60°, 120°` with `cᵢ = 2/3` decompose the identity in the
  plane, and the regular hexagon `{|⟪vᵢ, x⟫| ≤ 1}` has perimeter `4√3 < 8`. Repeated contacts:
  `e₁, e₁, e₂` with `c = (1/2, 1/2, 1)` give equality exactly for `[−1, 1]²`.

*Needs:* 1.1, 3.1, 3.2; Tau Ceti `TauCeti.Probability.uniformSphereMeasure_def`; Mathlib
`OrthonormalBasis.sum_inner_mul_inner`, `Measure.toSphere.instIsOpenPosMeasure`,
`Measure.isOpenPosMeasure_smul`, `integral_eq_zero_iff_of_nonneg`, `Continuous.ae_eq_iff_eq`,
`InnerProductSpace.toDual`,
`abs_real_inner_div_norm_mul_norm_eq_one_iff`, `basisOfOrthonormalOfCardEqFinrank`,
`geometric_hahn_banach_point_closed`.

### Examples

- In dimension three the bound reads `meanWidth S ≤ 3`, that is `∫ h_S dσ ≤ 3/2`, the value for
  the cube `[−1, 1]³`. The octahedron `{|x₁| + |x₂| + |x₃| ≤ √3}` satisfies the hypotheses with
  the eight unit vectors `(±1, ±1, ±1)/√3` and weights `3/8` (their weighted sum of `v vᵀ` is the
  identity, and `|⟪v, x⟫| ≤ (|x₁| + |x₂| + |x₃|)/√3 ≤ 1` on it); it is not a cube, so its mean
  width is strictly less than `3`.

### Dependencies

5.1: 1.1, 3.1, 3.2, Tau Ceti, Mathlib (and 4.3 for the first Check).

## Downstream consumers

- For a symmetric convex body in John's position, BanachSpaceTheory 7.2 (John's theorem and the
  contact-point decomposition) supplies unit contact vectors and positive weights as in 5.1, so
  5.1 bounds the mean width of such a body by that of the cube.
- A covering argument of the kind described under Related work (Scope), which averages the
  lengths of planar projections, would use 4.3 on the projections and 5.1 with 2.1 for the halved
  difference body.
- Isoperimetry: combined with its §2.3 (the perimeter of a compact convex set with nonempty
  interior is the Hausdorff length of its boundary), 4.3 expresses the planar perimeter as
  `π` times the mean width.

## Scope and ownership

Owned here: the real support function and width of compact sets with the calculus of 1.1–1.2,
the parallelepiped criterion for the halved difference body and the Rogers–Shephard upper bound,
mean width with its spherical constant, Crofton's formula for curves, Cauchy's perimeter
formula, Barbier's theorem, and the cube bound for decompositions of the identity.

Left to other roadmaps and the libraries:
- ConvexAnalysisAndDuality §2.1 defines `supportFunction` (copied verbatim in `Suggested.lean`)
  and states its sublinearity, closedness and the criterion that support functions agree exactly
  when closed convex hulls do; these are not restated, and the one separation step 5.1 needs is
  written out in its route.
- BanachSpaceTheory 7.2 states John's theorem and its contact-point decomposition; 5.1 takes the
  decomposition as a hypothesis.
- Isoperimetry §2.3 states that the perimeter of a convex body is the Hausdorff measure of its
  boundary.
- The pinned Tau Ceti already has the uniform law on the sphere with its rotation invariance and
  the laws of `⟪v, u⟫` and `⟪v, u⟫²`, the identification of the length of a continuous curve
  that is injective on the open interval with the Hausdorff length of its trace, the gauge
  lemmas, the Brunn–Minkowski inequality and the moments of the beta law.

Not treated: Cauchy's surface-area formula in dimension `d ≥ 3` and Kubota's formulas,
quermassintegrals and mixed volumes, the Steiner polynomial, Urysohn's inequality, Gołąb's
theorem on unit circles of Minkowski planes, the Blaschke–Lebesgue theorem, the formula for the
mean width of a three-dimensional polytope through its edge lengths and dihedral angles, and the
equality case of Rogers–Shephard.

Related work. A November 2026 preprint by Aiger, Har-Peled and Žužić (arXiv:2611.32334)
announces a proof of Hadwiger's covering conjecture in dimension three, with a Lean development
of its own. According to its authors, the argument uses that the halved difference body in
John's position has spherical average of the support function at most `3/2`, with equality only
for cubes, the three-dimensional case of 2.1, and Cauchy's formula on planar projections of
polytopes. This roadmap states these classical facts in every dimension where they hold (2.1,
4.3, 5.1), in its own form, and does not state or use the covering result.

## Exact supplier contracts

### From Mathlib

- Convex sets and gauges: `convexHull_min`, `convexHull_pi`, `convexHull_pair`,
  `segment_eq_Icc`, `LinearMap.image_convexHull`, `Convex.isPreconnected`,
  `Convex.closure_interior_eq_closure_of_nonempty_interior`,
  `Convex.openSegment_interior_closure_subset_interior`,
  `Convex.interior_nonempty_iff_affineSpan_eq_top` (finite-dimensional normed space),
  `continuous_gauge` and `gauge_eq_one_iff_mem_frontier` (convex neighbourhood of `0`),
  `le_gauge_of_subset_closedBall` (absorbent set in a ball), `gauge_smul_of_nonneg`,
  `geometric_hahn_banach_point_closed` (closed convex set, point outside),
  `InnerProductSpace.toDual`.
- Linear algebra: `parallelepiped`, `mem_parallelepiped_iff`, `LinearIndependent.repr`,
  `stdOrthonormalBasis`, `OrthonormalBasis.sum_inner_mul_inner`,
  `basisOfOrthonormalOfCardEqFinrank`, `abs_real_inner_div_norm_mul_norm_eq_one_iff`.
- Metric and order: `IsCompact.exists_isMaxOn`, `IsCompact.uniformContinuousOn_of_continuous`,
  `Metric.dist_le_diam_of_mem`, `Metric.diam_le_of_forall_dist_le`, `intermediate_value_Icc`,
  `intermediate_value_Icc'`, `interior_singleton` (no isolated points).
- Variation: `eVariationOn`, `eVariationOn.sum_le`, `eVariationOn.Icc_add_Icc`,
  `MonotoneOn.eVariationOn_eq` (real-valued, monotone on the set).
- Measure: `Measure.addHaar_submodule` (proper subspace), `Measure.addHaar_smul`,
  `Measure.toSphere.instIsOpenPosMeasure`, `Measure.isOpenPosMeasure_smul` (nonzero scalar),
  `lintegral_lintegral_swap`, `lintegral_comp_eq_lintegral_meas_le_mul`, `lintegral_finsetSum`,
  `lintegral_iSup` (measurable, monotone), `ENNReal.mul_iSup`,
  `ofReal_integral_eq_lintegral_ofReal` (integrable, a.e. nonnegative),
  `integral_eq_zero_iff_of_nonneg`, `Continuous.ae_eq_iff_eq` (open-positive measure),
  `Measure.nullSingletonClass_hausdorff` (positive dimension),
  `MeasureTheory.Measure.euclideanHausdorffMeasure` (`μHE[1]`).
- Circle and special functions: `AddCircle.homeomorphCircle'_apply_mk`,
  `AddCircle.volume_eq_smul_haarAddCircle`, `AddCircle.intervalIntegral_preimage`,
  `Complex.norm_mul_cos_arg`, `Complex.norm_mul_sin_arg`, `Real.Gamma_one`, `Real.Gamma_add_one`,
  `Real.Gamma_one_half_eq`, `ProbabilityTheory.beta`, `Complex.betaIntegral_eq_Gamma_mul_div`.

### From Tau Ceti

- `TauCeti.Probability.uniformSphereMeasure` (`Probability/Distributions/Uniform/Sphere/Basic`),
  with `TauCeti.Probability.uniformSphereMeasure_def`,
  `TauCeti.Probability.isFiniteMeasure_uniformSphereMeasure`,
  `TauCeti.Probability.isProbabilityMeasure_uniformSphereMeasure` (nontrivial `E`) and
  `LinearIsometryEquiv.map_uniformSphereMeasure`.
- `TauCeti.Probability.map_sq_inner_uniformSphereMeasure` (`…/Sphere/Coordinate`, `2 ≤ d`),
  `TauCeti.Probability.map_inner_uniformSphereMeasure_of_finrank_eq_one`
  (`…/Sphere/OneDimensional`), `TauCeti.Probability.map_homeomorphCircle'_haarAddCircle`
  (`…/Sphere/Circle`).
- `TauCeti.Probability.integral_rpow_mul_one_sub_rpow_betaMeasure`
  (`Probability/Distributions/Beta/Basic`, positive parameters and exponents as stated).
- `ContinuousOn.eVariationOn_eq_euclideanHausdorffMeasure_image`
  (`Topology/EMetricSpace/CurveLength`: continuous on `[a, b]`, injective on `(a, b)`) and
  `Measure.euclideanHausdorffMeasure_one` (`Geometry/Euclidean/Volume/Measure`).
- `TauCeti.setOfPred_gauge_le_eq_closure_smul_of_pos` (`Analysis/Convex/Gauge`: convex
  neighbourhood of `0`, `t > 0`).
- `TauCeti.volume_rpow_add_volume_rpow_le` (`MeasureTheory/Measure/Lebesgue/BrunnMinkowski/Basic`:
  positive dimension, nonempty null-measurable sets), in the Examples of Layer 2 only.

### From TauCetiRoadmap.ConvexAnalysisAndDuality

- §2.1 `supportFunction` (definition, copied verbatim). No theorem of that roadmap is used in a
  route.

## References

- S. Ghomi, *The length, width, and inradius of space curves*, arXiv:1605.01144v3: Lemma 2.3
  (Cauchy–Crofton), p. 5; Corollary 2.4, p. 6.
- H. L. Resnikoff, *On curves and surfaces of constant width*, arXiv:1504.06733v1: §2.2.2,
  eq. (2.28), p. 15, and the following theorem, p. 16.
- K. J. Böröczky, F. Fodor, D. Hug, *Strengthened inequalities for the mean width and the ℓ-norm
  of origin symmetric convex bodies*, Math. Ann. 393 (2025) 271–316, arXiv:2410.11460v1:
  Theorem 1.1, p. 3–4.
- A. Colesanti, *Functional inequalities related to the Rogers–Shephard inequality*,
  arXiv:math/0512098v1: p. 3, (5) and (6).
- C. A. Rogers, G. C. Shephard, *The difference body of a convex body*, Arch. Math. 8 (1957)
  220–233.
- J. A. Tropp, *ACM 204: Lectures on Convex Geometry*, Caltech lecture notes (2018),
  doi:10.7907/geda-h205: Definition 2.5.5 (support function); Theorem 14.5.1 and Lemma 14.5.2
  (John's characterization by contact points), p. 125.
- D. Aiger, S. Har-Peled, G. Žužić, arXiv:2611.32334v2 (context only, under Scope).
