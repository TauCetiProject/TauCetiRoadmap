# Roadmap: projections, slices and Kakeya sets in the plane

**Summary.** This roadmap proves the classical theorems on how the Hausdorff dimension and the area
of a set in the Euclidean plane behave under orthogonal projection onto lines and under
intersection with vertical lines, and applies them to sets containing a unit segment in every
direction. Its objects are the Riesz capacity of a set, defined from the energy of a measure, the
orthogonal projection onto the line through the origin in the direction `(cos θ, sin θ)`, the
vertical slices of a plane set, and Kakeya sets: plane sets containing a unit segment in every
direction. "Almost every direction" refers to Lebesgue measure on the angle `θ`.

The headline theorems are these.

- *Kaufman and Marstrand, small dimension.* If `α < 1` and a set has positive `α`-capacity, then
  almost every projection has positive `α`-capacity. Consequently a compact set `K` projects, in
  almost every direction, onto a set of Hausdorff dimension `min(dim K, 1)`.
- *Kaufman and Marstrand, large dimension.* A set of positive `1`-capacity, in particular every
  compact set of dimension greater than one, has projections of positive length in almost every
  direction; for a σ-compact set the integral over `[0, π)` of the lengths of its projections is at
  least `π²` times its `1`-capacity.
- *Marstrand's slicing theorem.* If `μ` is a measure on the line giving every closed interval of
  radius `r` measure at most `C r^α`, then for every plane set `F` and `μ`-almost every `x` the
  vertical slice of `F` over `x` has dimension at most `dim F − α`, read as `0` when `dim F < α`.
  For Lebesgue measure, `α = 1`.
- *Besicovitch and Davies.* There is a compact set of zero area containing a unit segment in every
  direction; every closed set containing a unit segment in every direction has Hausdorff
  dimension `2`, and the `ε`-neighbourhood of any set containing a unit segment in every direction
  has area at least `1/(8 log(1/ε))` for `0 < ε ≤ 1/2`.

The roadmap builds on FractalGeometry, whose energy criterion (a measure of finite `s`-energy
charging a set forces infinite `s`-dimensional Hausdorff measure) and Frostman's lemma for compact
sets are what capacity is made of here; on Mathlib's Hausdorff measure and dimension, Lebesgue
measure on the Euclidean plane and Tonelli's theorem; and on Tau Ceti's Eilenberg inequality, which
already gives the slicing theorem for Lebesgue measure and is used by Davies' theorem.
GeometricMeasureTheory treats rectifiable sets, and PolynomialMethodInCombinatorics treats Kakeya
sets over finite fields; neither is consumed.

Layer 1 below defines capacity and identifies the dimension of a compact set as the critical
exponent of capacity. Layer 2 proves the projection theorems below dimension one from an averaging
identity for energies, and Layer 3 the positive-length theorems from Mattila's inequality. Layer 4
is the slicing theorem for measures with a power bound on balls. Layer 5 constructs a Besicovitch
set and proves the lower bounds for Kakeya sets, using Marstrand's projection theorem of Layer 2 and
the slicing theorem for Lebesgue measure through point–line duality.

## Conventions

- The plane is `EuclideanSpace ℝ (Fin 2)` with its Euclidean norm, Borel σ-algebra and Lebesgue
  measure `volume`; a point `p` has coordinates `p 0` and `p 1`. Areas, lengths of unit segments
  and directions all refer to this norm. The line is `ℝ` with `volume`.
- `dimH` is Mathlib's Hausdorff dimension, with values in `ℝ≥0∞`, and `μH[s]` is Mathlib's
  `s`-dimensional Hausdorff measure. Subtraction in `ℝ≥0∞` is truncated: `a − b = 0` when `a ≤ b`.
- The `s`-energy of a measure `μ` on a metric space is `∫⁻ x, ∫⁻ y, edist x y ^ (-s) ∂μ ∂μ`,
  written `E_s(μ)`. This is the integral of FractalGeometry 3.3, copied verbatim; the power is
  `ENNReal.rpow`, so for `s > 0` the kernel is `∞` on the diagonal (`0 ^ (−s) = ∞`), for `s = 0`
  it is `1`, and for `s < 0` it is `edist x y ^ |s|`, which vanishes on the diagonal.
- `proj θ x = cos θ · x 0 + sin θ · x 1` is the projection onto the line in the direction
  `(cos θ, sin θ)`, identified with `ℝ`. Since `proj (θ + π) = −proj θ`, a property of the image
  holds for almost every `θ ∈ ℝ` exactly when it holds for almost every `θ ∈ [0, π)`; the
  statements quantify over `θ ∈ ℝ` with Lebesgue measure, and the integrals over directions are
  over `[0, π)`.
- The vertical slice of `F` over `x` is the fibre `F ∩ {p : p 0 = x}`, a subset of the plane; it
  is isometric to the set `{y : (x, y) ∈ F}` of the sources, so the two have the same dimension.
  The slice may be empty, and `dimH ∅ = 0`.
- A set contains a unit segment in every direction when for every `e` with `‖e‖ = 1` there is `p`
  with `segment ℝ p (p + e) ⊆ K`. A segment in direction `e` is one in direction `−e`, so only
  directions modulo `π` matter. `thickening ε K` is the open `ε`-neighbourhood `{z : dist z K < ε}`.
- In Checks and examples, `C` is the middle-thirds Cantor set (Mathlib's `cantorSet`), placed on a
  coordinate axis of the plane when it is a factor of a product.

## Layer 1: Riesz capacity

### 1.1 Capacity

For a metric space `X` with a σ-algebra and `s ∈ ℝ`, define `capacity s A`, in `ℝ≥0∞`, as the
supremum of `E_s(μ)⁻¹` over the probability measures `μ` on `X` with `μ Aᶜ = 0`, where `∞⁻¹ = 0`
(Bishop and Peres, Definition 3.4.1, where the measures are supported on `A`). A set that carries no
probability measure, the empty set in particular, has capacity `0`; for a set that does, capacity
`0` means that every probability measure on it has infinite `s`-energy.

- `capacity s A ≠ 0` exactly when some probability measure `μ` with `μ Aᶜ = 0` has
  `E_s(μ) < ∞`.
- Capacity is monotone in the set: a measure that gives `Aᶜ` measure zero gives `Bᶜ` measure zero
  for `A ⊆ B`.
- *Reduction to compact sets.* In the plane (and in every finite-dimensional real normed space), if
  `capacity s A ≠ 0` there is a compact `K' ⊆ A` with `capacity s K' ≠ 0`. Take `μ` with finite
  energy and `μ Aᶜ = 0`, a measurable null set containing `Aᶜ`, whose complement `B ⊆ A` has
  `μ B = 1`, and, by inner regularity of finite Borel measures, a compact `K' ⊆ B` with
  `μ K' > 0`; the normalised restriction of `μ` to `K'` has energy at most `E_s(μ) / μ(K')²`.
- For `s = 0` the energy of a probability measure is `1`, so, for the Borel σ-algebra (where the
  unit mass at a point of a nonempty set `A` gives `Aᶜ` measure zero), a nonempty set has
  `0`-capacity `1`.

**Checks.**

- Lebesgue measure on `[0, 1]` has `s`-energy `2/((1 − s)(2 − s))` for `s < 1`, for instance `8/3`
  at `s = 1/2`, and infinite `1`-energy; so `capacity (1/2) [0, 1] ≥ 3/8`.
- A unit mass has `s`-energy `∞` for `s > 0`, so every finite set has capacity `0` for every
  `s > 0`. With the kernel set to `0` on the diagonal, a point would have capacity `∞`.
- The empty set has capacity `0` for every `s`, including `s = 0`, where a nonempty set has
  capacity `1` for the Borel σ-algebra: no probability measure gives the whole space measure zero.

*Needs:* Mathlib `MeasureTheory.IsProbabilityMeasure`, `ENNReal.inv_top`; for the bullets,
`MeasureTheory.exists_measurable_superset_of_null` and `MeasurableSet.exists_isCompact_lt_add`
(inner regularity of finite measures on the plane).

### 1.2 Capacitary dimension

Prove `dimH_eq_iSup_capacity`: for a compact subset `K` of a finite-dimensional real normed space
with its Borel σ-algebra, `dimH K` is the supremum of `s` over the real `s` with
`capacity s K ≠ 0` (Bishop and Peres, Theorem 3.4.2, last clause). If `0 < s` and
`capacity s K ≠ 0`, a probability measure on `K` with finite `s`-energy gives `μH[s] K = ∞` by the
energy criterion of FractalGeometry 3.3, so `s ≤ dimH K`. Exponents `s ≤ 0` contribute
`ENNReal.ofReal s = 0` and do not affect the supremum.

Conversely let `0 ≤ t < dimH K` and pick a real `s` with `t < s < dimH K`, so that `s > 0` and
`μH[s] K = ∞`. Frostman's lemma, FractalGeometry 3.2, gives a finite Borel measure `μ` with
`m = μ K ≠ 0`, `μ Kᶜ = 0`, so that `m` is the total mass, and `μ (closedBall x r) ≤ r^s` for all
`x` and `r`. In particular `μ {x} ≤ 0^s = 0` for every `x`. Fix `x` and split the points `y ≠ x` by
`d = ‖x − y‖` into the shells `2^(−k−1) < d ≤ 2^(−k)`, `k ≥ 0`, on which the kernel `d^(−t)` is at
most `2^((k+1)t)` and the mass at most `μ (closedBall x 2^(−k)) ≤ 2^(−ks)`, and the set `d > 1`, on
which the kernel is at most `1` and the mass at most `m`. Hence
`∫ ‖x − y‖^(−t) dμ(y) ≤ Σ_(k ≥ 0) 2^((k+1)t) 2^(−ks) + m = 2^t / (1 − 2^(t−s)) + m` for every `x`,
with no bound on `diam K` needed. Integrating in `x` gives `E_t(μ) ≤ m (m + 2^t / (1 − 2^(t−s)))`,
so the probability measure `μ / m`, which gives `Kᶜ` measure zero, has `t`-energy at most
`1 + 2^t / (m (1 − 2^(t−s)))`, which is finite, and `capacity t K ≠ 0`. The computation covers
`t = 0`, where the kernel is `1` and the energy of `μ / m` is `1`. So the supremum is at least
every `t < dimH K`, hence at least `dimH K`. The converse for compact sets stated in prose in
FractalGeometry 3.3 has the same conclusion (Bishop and Peres, Theorem 3.4.2(i), proved there by
the same sum over shells); this direction uses only `exists_frostman_measure`.

**Checks.**

- `K = ∅`: no exponent has positive capacity, the supremum is `0 = dimH ∅`.
- `K` a single point: capacity is `1` at `s = 0` and `0` for `s > 0`, so the supremum is `0`.
- `K = [0, 1]` in `ℝ`: the capacity is positive for `s < 1` (first Check of 1.1) and `0` for
  `s ≥ 1`, because `μH[1] [0, 1] = 1` is finite; the supremum is `1` and is not attained.

*Needs:* 1.1; FractalGeometry 3.2 (`exists_frostman_measure`) and 3.3
(`hausdorffMeasure_eq_top_of_energy_ne_top`); Mathlib `hausdorffMeasure_of_lt_dimH`,
`le_dimH_of_hausdorffMeasure_eq_top`, `ENNReal.tsum_geometric`.

### Examples

For the middle-thirds Cantor set `C`, FractalGeometry 5.1 gives `dimH C = log 2 / log 3`, so by 1.2
the Cantor set has positive `s`-capacity for every `s < log 2 / log 3` and capacity `0` for every
larger `s`.

### Dependencies

Layer 1 uses FractalGeometry 3.2 and 3.3 and Mathlib's Hausdorff measure, dimension and inner
regularity.

## Layer 2: Projections below dimension one

### 2.1 The projections

Define `proj θ : EuclideanSpace ℝ (Fin 2) → ℝ` by `proj θ x = cos θ · x 0 + sin θ · x 1`, the
inner product with `(cos θ, sin θ)` (Bishop and Peres, Section 3.5; Hochman, Section 7.1, with the
unit vector in place of the angle).

- `proj θ` is linear and `1`-Lipschitz, so `dimH (proj θ '' A) ≤ min (dimH A) 1` for every `A` and
  every `θ`, the bound `1` being the dimension of `ℝ`.
- For `x = r (cos φ, sin φ)`, `proj θ x = r cos(θ − φ)`.
- `proj (θ + π) = −proj θ`, so the image in direction `θ + π` is the reflection of the image in
  direction `θ`: same dimension, length and capacity.

**Checks.**

- `proj 0 x = x 0` and `proj (π/2) x = x 1`.
- For `K = C × {0}` with `C` the Cantor set, `proj (π/2) '' K = {0}` has dimension `0`, while
  `min (dimH K) 1 = log 2 / log 3`: the projection theorems below hold for almost every direction,
  not for every one.

*Needs:* Mathlib `LipschitzWith.dimH_image_le`, `Real.dimH_univ`, `dimH_mono`.

### 2.2 The averaging identity for energies

Prove `setLIntegral_energy_map_proj`: for every s-finite measure `μ` on the plane and every real
`α`, the integral over `θ ∈ [0, π)` of the `α`-energy of the image measure `μ.map (proj θ)` equals
`C_α · E_α(μ)`, where `C_α = ∫ θ in [0, π), |cos θ|^(−α)` (the computation in the proofs of Bishop
and Peres, Theorem 3.5.1, and Hochman, Theorem 7.2). By the change of variables for image measures
the energy of `μ.map (proj θ)` is `∫∫ |proj θ (x − y)|^(−α) dμ dμ`; Tonelli's theorem moves the
`θ`-integral inside, and for `x ≠ y` with `x − y = r (cos φ, sin φ)` the inner integral is
`r^(−α) ∫ θ in [0, π), |cos(θ − φ)|^(−α) = r^(−α) C_α`, by `π`-periodicity. On the diagonal both
integrands are `∞` for `α > 0`, `1` for `α = 0` and `0` for `α < 0`, and the identity holds there
too. For `α ≥ 1`, `C_α = ∞`; if `μ ≠ 0` then `E_α(μ) ≠ 0`, the kernel being positive everywhere
(`∞` on the diagonal), so the right side, and with it the left, is `∞`; if `μ = 0` both are `0`.
For a unit mass and every `α > 0`, the energy of the mass and of each of its images is
`0 ^ (−α) = ∞`, and both sides are `∞`. Tonelli's theorem, which this route uses, needs `μ`
s-finite; the sources take a finite measure.

- `C_α = √π · Γ((1 − α)/2) / Γ(1 − α/2)` is finite exactly when `α < 1`, and
  `C_α · (1 − α) → 2` as `α → 1`.

**Checks.**

- `C_0 = π`, `C_(−1) = 2`, `C_(1/2) = √π · Γ(1/4)/Γ(3/4) ≈ 5.2441`, `C_(1/4) ≈ 3.8558`.
- For Lebesgue measure on the unit segment `[0, 1] × {0}` and `α < 1`, the image under `proj θ` is
  Lebesgue measure on an interval of length `|cos θ|`, scaled by `1/|cos θ|`, whose `α`-energy is
  `|cos θ|^(−α) · 2/((1 − α)(2 − α))`; integrating gives `C_α · 2/((1 − α)(2 − α))`, as the identity
  says.

*Needs:* 2.1; Mathlib `MeasureTheory.lintegral_lintegral_swap` (Tonelli, for s-finite measures),
`MeasureTheory.lintegral_map`, `MeasureTheory.Measure.map_apply`.

### 2.3 Kaufman's theorem for capacities

Prove `ae_capacity_proj_ne_zero`: if `α < 1` and `capacity α A ≠ 0` for a set `A` in the plane,
then `capacity α (proj θ '' A) ≠ 0` for almost every `θ` (Bishop and Peres, Theorem 3.5.1, stated
there for compact `K` and `0 < α < 1`). By the reduction of 1.1, take a compact `K' ⊆ A` and a
probability measure `ν` with `ν K'ᶜ = 0` and finite `α`-energy. By 2.2 and `C_α < ∞`, the energy of
`ν.map (proj θ)` is finite for almost every `θ ∈ [0, π)`, hence, by `π`-periodicity, for almost
every `θ`. That image is a probability measure giving the complement of the compact set
`proj θ '' K'` measure zero, so `capacity α (proj θ '' K') ≠ 0`, and monotonicity of capacity
passes to `proj θ '' A`. For `α ≤ 0` the argument is the same, and the statement also follows from
the nonemptiness of `A`.

**Checks.**

- `α = 1` is excluded, and the theorem is false there: the closed unit disk carries a probability
  measure of finite `1`-energy (the measure with density `1/(2π √(1 − |x|²))` has energy `π/2`, see
  the Checks of 3.1), so its `1`-capacity is positive; but each projection is `[−1, 1]`, of finite
  `μH[1]` measure, so by the energy criterion it carries no measure of finite `1`-energy.
- For the unit segment `[0, 1] × {0}` and `α = 1/2`, the capacity is positive and the projection in
  direction `π/2` is the point `{0}`, of capacity `0`: one direction may fail.

*Needs:* 1.1 (definition, monotonicity and the reduction to compact sets), 2.1, 2.2; Mathlib
`MeasureTheory.ae_lt_top`, `MeasureTheory.Measure.map_apply`.

### 2.4 Marstrand's projection theorem

Prove `ae_dimH_proj_eq`: for a compact set `K` in the plane,
`dimH (proj θ '' K) = min (dimH K) 1` for almost every `θ` (Marstrand's theorem; Bishop and Peres,
Corollary 3.5.2, stated there for `dim K ≤ 1`; Hochman, Theorem 7.2, stated there for Borel sets).
The upper bound holds for every `θ` (2.1). For the lower bound, let `0 < α < min (dimH K) 1` be
rational. By 1.2, `capacity α K ≠ 0`; by 2.3, `capacity α (proj θ '' K) ≠ 0` for almost every `θ`;
and by 1.2 again, applied to the compact set `proj θ '' K ⊆ ℝ`, `α ≤ dimH (proj θ '' K)` for those
`θ`. A countable intersection over rational `α` gives one set of full measure. When `dimH K > 1`
the same argument with `α < 1` gives dimension `1`, which is why the theorem is stated with the
minimum. Hochman states the theorem for Borel sets; it is stated here for compact sets because
the route passes through 1.2, that is through Frostman's lemma of FractalGeometry 3.2, which is for
compact sets.

**Checks.**

- For the Cantor dust `C × C`, of dimension `2 log 2 / log 3 ≈ 1.2619` by FractalGeometry 5.3, the
  minimum is `1`; for `C × {0}` it is `log 2 / log 3`.
- For the segment `[0, 1] × {0}`, every projection is an interval of length `|cos θ|`, of dimension
  `1` except at `θ ≡ π/2`.

*Needs:* 1.2, 2.1, 2.3; Mathlib `LipschitzWith.dimH_image_le`, `Real.dimH_univ`,
`IsCompact.image`.

### Examples

The graph of the Cantor function `c` on `[0, 1]`, a compact set of dimension `1`, has projection
`[0, 1]` in direction `π/2`; by 2.4 almost every projection has dimension `1`.

### Dependencies

Layer 2 uses Layer 1 (1.1 and 1.2) and Mathlib's Tonelli theorem and image measures.

## Layer 3: Projections of positive length

### 3.1 Mattila's inequality

Prove `setLIntegral_inv_volume_proj_le`: for a σ-compact set `A` in the plane and a probability
measure `μ` with `μ Aᶜ = 0`, `∫ θ in [0, π), volume(proj θ '' A)⁻¹ ≤ E_1(μ)` (Bishop and Peres,
Lemma 3.5.5, for compact sets; the statement here is for σ-compact sets). For a compact set `K`
the route is that of the source. Write `μ_θ = μ.map (proj θ)` and
`φ_θ(t) = liminf_(δ → 0) μ_θ(t − δ, t + δ)/(2δ)`. By Fatou's lemma and Tonelli's theorem,
`∫ θ in [0, π), ∫ φ_θ dμ_θ` is at most the lower limit of
`(2δ)⁻¹ ∫∫ |{θ : |proj θ (x − y)| < δ}| dμ dμ`; the set of directions has measure
`2 arcsin(δ/|x − y|)` for `δ ≤ |x − y|` and `π` otherwise, which is at most `π δ/|x − y|`, so
dominated convergence (with `E_1(μ) < ∞`, the case `E_1(μ) = ∞` being trivial) gives the bound
`E_1(μ)`. For almost every `θ`, `φ_θ < ∞` holds `μ_θ`-almost everywhere, so `μ_θ` is absolutely
continuous (Bishop and Peres, Lemma 3.5.6, proved there by a dyadic covering) and `φ_θ` is its
density `f_θ` almost everywhere (Lebesgue differentiation). Then `∫ φ_θ dμ_θ = ∫ f_θ²`, and the
Cauchy–Schwarz inequality on the compact set `proj θ '' K`, which carries `μ_θ`, gives
`1 ≤ volume(proj θ '' K) · ∫ f_θ²`.

For σ-compact `A`, by inner regularity of `μ` there are compact `K' ⊆ A` with `μ K'` as close to
`1` as we like (`A` is a Borel set). The normalised restriction of `μ` to `K'` is a probability
measure carried by `K'` with `1`-energy at most `E_1(μ)/μ(K')²`, and
`volume(proj θ '' A)⁻¹ ≤ volume(proj θ '' K')⁻¹` for every `θ`; so the compact case bounds the
left side by `E_1(μ)/μ(K')²` for every such `K'`, hence by `E_1(μ)`.

- For compact `K`, `θ ↦ volume(proj θ '' K)` is upper semicontinuous: with `R` a bound for the norm
  on `K`, `|proj θ' x − proj θ x| ≤ R |θ' − θ|` on `K`, so `proj θ' '' K` lies in the closed
  `R |θ' − θ|`-neighbourhood of the compact set `proj θ '' K`, whose length tends to that of
  `proj θ '' K` as the radius tends to `0`. For `A = ⋃ K_n` with `K_n` compact, `proj θ '' A` is the
  increasing union of the compact sets `proj θ '' (K_1 ∪ … ∪ K_n)`, so its length is the supremum of
  their lengths. Hence for σ-compact `A` the integrand is measurable and the left side is the
  Lebesgue integral of a measurable function; nothing is claimed for sets that are not σ-compact.

**Checks.**

- The closed unit disk with the measure of density `1/(2π √(1 − |x|²))`: its potential
  `∫ |x − y|⁻¹ dμ(y)` equals `π/2` at every point of the disk (in polar coordinates about `x` the
  radial integral is `π/2 − arcsin((σ − ρ)/(σ + ρ))` over `2π`, with `ρ`, `σ` the distances to the
  boundary in the two opposite directions, and the arcsine terms cancel), so its `1`-energy is
  `π/2`. Every projection has length `2`, and the left side is `π/2`: equality.
- The same disk with normalised area measure has `1`-energy `16/(3π) ≈ 1.6977 > π/2`: the inequality
  is strict for that measure.
- For `μ` a unit mass the right side is `∞`, and the left side is `∞` too, the projections being
  points.

*Needs:* 1.1 (definition), 2.1; Mathlib `MeasureTheory.lintegral_lintegral_swap`,
`MeasureTheory.lintegral_liminf_le`, `MeasureTheory.tendsto_lintegral_of_dominated_convergence`,
`Besicovitch.ae_tendsto_rnDeriv`, `ENNReal.lintegral_mul_le_Lp_mul_Lq`, `IsCompact.image`,
`IsSigmaCompact`, `MeasurableSet.exists_isCompact_lt_add`, `MeasureTheory.lintegral_mono`; for the
bullet, `tendsto_measure_cthickening_of_isCompact`, `UpperSemicontinuous.measurable`,
`MeasureTheory.measure_iUnion_eq_iSup_accumulate`, `Measurable.iSup`.

### 3.2 Kaufman's theorem for length

Prove `ae_volume_proj_pos_of_capacity`: if `capacity 1 A ≠ 0` for a set `A` in the plane, then
`volume (proj θ '' A) > 0` for almost every `θ` (Bishop and Peres, Theorem 3.5.3, stated there for
compact `K`). By the reduction of 1.1 take a compact `K' ⊆ A` and a probability measure on it of
finite `1`-energy. By 3.1 the reciprocal lengths of the projections of `K'` have finite integral
over `[0, π)`; the function `θ ↦ volume(proj θ '' K')` is measurable (the bullet of 3.1), so
the reciprocal is finite for almost every `θ ∈ [0, π)`. Reflection (2.1) extends this to almost
every `θ`, and `proj θ '' K' ⊆ proj θ '' A`.

**Checks.**

- The unit segment has `1`-capacity `0` (its `μH[1]` measure is finite) and positive-length
  projections in every direction but one: the converse fails.
- The four-corner Cantor set (the product of two copies of the set of numbers with base-`4` digits
  in `{0, 3}`) has dimension `1` (FractalGeometry 5.3 with `m = 4` and four digit vectors) and
  projections of zero length in almost every direction (Bishop and Peres, Theorem 9.5.3); by this
  theorem its `1`-capacity is `0`.

*Needs:* 1.1, 2.1, 3.1; Mathlib `MeasureTheory.ae_lt_top`, `MeasureTheory.measure_mono`.

### 3.3 Marstrand's theorem for length

Prove `ae_volume_proj_pos`: a compact set `K` in the plane with `dimH K > 1` has projections of
positive length in almost every direction (Hochman, Theorem 7.6, stated there for Borel sets, the
standing assumption of those notes). By 1.2 some `s > 1` has `capacity s K ≠ 0`. For a probability
measure `μ` on `K` and `D = max 1 (diam K)`, the kernels satisfy
`|x − y|⁻¹ ≤ D^(s − 1) |x − y|^(−s)` for `x, y ∈ K` (both sides are `∞` on the diagonal, and
`D ≥ 1` keeps the factor positive when `K` is a point), so `E_1(μ) ≤ D^(s − 1) E_s(μ)` and
`capacity 1 K ≠ 0`; then 3.2 applies. The source states the theorem for Borel sets; it is stated
here for compact sets because the route passes through 1.2, that is through Frostman's lemma of
FractalGeometry 3.2, which is for compact sets.

**Checks.**

- The four-corner Cantor set of 3.2 has dimension exactly `1` and projections of zero length in
  almost every direction: `dimH K > 1` cannot be weakened to `dimH K ≥ 1`.
- The Cantor dust `C × C` has dimension `≈ 1.2619 > 1`, so almost every projection has positive
  length, while `proj 0 '' (C × C) = C` is Lebesgue-null.

*Needs:* 1.1, 1.2, 3.2.

### 3.4 Mattila's bound for the Favard length

Prove `pi_sq_mul_capacity_le_favard`: for σ-compact `A`,
`π² · capacity 1 A ≤ ∫ θ in [0, π), volume(proj θ '' A)` (Bishop and Peres, Theorem 3.5.4, for
compact sets; the statement here is for σ-compact sets, for which the integrand is measurable by
the bullet of 3.1). For compact `K` and a probability measure `μ` on `K` of finite `1`-energy, 3.1
bounds `∫ volume(proj θ '' K)⁻¹` by `E_1(μ)`; the lengths are finite, since the images are compact,
and positive for almost every `θ` (3.2), and the Cauchy–Schwarz inequality gives
`π² ≤ (∫ volume(proj θ '' K)) · E_1(μ)`. Take the supremum over `μ`; if no such `μ` exists the
capacity is `0`. For σ-compact `A` and a probability measure `μ` with `μ Aᶜ = 0` and finite
`1`-energy, take compact `K' ⊆ A` as in 3.1: the normalised restriction of `μ` to `K'` gives
`π² μ(K')² E_1(μ)⁻¹ ≤ ∫ volume(proj θ '' K') ≤ ∫ volume(proj θ '' A)`, and `μ K'` tends to `1`.

**Checks.**

- For the closed unit disk the right side is `2π`. With the measure of 3.1 the capacity is at least
  `(π/2)⁻¹ = 2/π`, and the theorem gives at most `2π/π² = 2/π`: the `1`-capacity of the disk is
  exactly `2/π`, and the bound is attained.
- For a unit segment the right side is `∫ |cos θ| = 2` and the left side is `0`, its `1`-capacity
  being `0` (3.2): no inequality in the reverse direction holds.

*Needs:* 1.1, 2.1, 3.1, 3.2; Mathlib `ENNReal.lintegral_mul_le_Lp_mul_Lq`,
`MeasurableSet.exists_isCompact_lt_add`, `MeasureTheory.lintegral_mono`.

### Examples

The Cantor dust `C × C` has `1`-capacity positive, since its dimension exceeds `1` (1.2), so its
Favard length is positive by 3.4.

### Dependencies

Layer 3 uses Layer 1 (1.1, 1.2) and Layer 2 (2.1); it does not use 2.2 to 2.4.

## Layer 4: Slices

### 4.1 Marstrand's slicing theorem for Frostman measures

Prove `ae_dimH_inter_preimage_le`: let `μ` be a measure on `ℝ`, `α ≥ 0` and `C ≥ 0` with
`μ (closedBall x r) ≤ C · r^α` for all `x` and `r`. Then for every set `F` in the plane, for
`μ`-almost every `x`, `dimH (F ∩ {p : p 0 = x}) ≤ dimH F − α` in `ℝ≥0∞` (Bishop and Peres,
Theorem 3.3.1, for a probability measure on `[0, 1]` and `F ⊆ [0, 1]²`; the statement here is on
the whole line, for any measure and any set, with the truncated difference). No measurability of
`F` or of the slices is assumed; "almost every" means that the exceptional set is contained in a
`μ`-null set.

The route is that of the source. If `dimH F < α`, then `μH[α] F = 0`, so the projection
`{p 0 : p ∈ F}` has `μH[α]` measure `0` (the projection is `1`-Lipschitz), hence `μ` measure `0`: a
set of diameter `d` lies in a closed ball of radius `d/2`, so its `μ` measure is at most `C · d^α`.
For `μ`-almost every `x` the slice is then empty. If `dimH F ≥ α`, let `γ > dimH F` and `ε, δ > 0`.
Cover `F` by sets `D_j` of diameter less than `ε` with `Σ (diam D_j)^γ < δ`, and let `I_j` be the
smallest closed interval containing the first coordinates of `D_j`. The slices of the `D_j` cover
the slice of `F` over `x` and have diameter at most `diam D_j`, so the `ε`-approximate
`(γ − α)`-dimensional Hausdorff content of that slice is at most
`g(x) = Σ_j 1_(I_j)(x) (diam D_j)^(γ − α)`, a measurable function with
`∫ g dμ ≤ C Σ (diam D_j)^γ < C δ`. Hence the set where the content exceeds `η` has outer measure at
most `C δ / η` for every `δ`, so it is null; taking `ε` and `η` along `1/n`, `μH[γ − α]` of the
slice is `0` for `μ`-almost every `x`, and `dimH` of the slice is at most `γ − α`. Let `γ` decrease
to `dimH F` along a sequence.

- For `μ = volume` the hypothesis holds with `α = 1` and `C = 2`, since
  `volume (closedBall x r) = 2r`; this is Marstrand's slicing theorem (Bishop and Peres,
  Theorem 1.6.1; Hochman, Theorem 8.1 and Corollary 8.2, for compact sets). For Lebesgue measure
  it is also a consequence of Tau Ceti's Eilenberg inequality
  (`LipschitzOnWith.ae_hausdorffMeasure_inter_preimage_eq_zero` applied to the first coordinate),
  which is the form Layer 5 uses.

**Checks.**

- `F = [0, 1] × C`: `dimH F = 1 + log 2 / log 3` (both product inequalities of FractalGeometry 5.5,
  after exchanging the factors; the maximum distance on the product and the Euclidean one are
  bi-Lipschitz equivalent), and every slice over `x ∈ [0, 1]` is a copy of `C`: equality for
  Lebesgue measure. With `μ` the Cantor distribution and `F = C × [0, 1]`, which satisfies the
  hypothesis with `α = log 2 / log 3` and constant `4`, the slices over `x ∈ C` are unit segments,
  of dimension `1 = dimH F − α`: equality again.
- `F = {0} × [0, 1]`, of dimension `1`: the slice over `0` has dimension `1 > 0 = dimH F − 1`, at a
  single, Lebesgue-null `x`. With `μ` the unit mass at `0`, which satisfies no bound with `α > 0`,
  the conclusion fails: the hypothesis on `μ` is needed.
- `F = C × C`: almost every slice for Lebesgue measure is empty, since `C` is null, and
  `dimH F − 1 ≈ 0.2619`: the inequality can be strict. `F = C × {0}`: `dimH F − 1` is `0` in
  `ℝ≥0∞`, and the slices are points or empty.
- `α = 0`: every measure with `μ (closedBall x r) ≤ C` satisfies the hypothesis, and the conclusion
  is the monotonicity `dimH (F ∩ …) ≤ dimH F`.

*Needs:* Mathlib `MeasureTheory.Measure.hausdorffMeasure_apply`,
`dimH_le_of_hausdorffMeasure_ne_top`, `hausdorffMeasure_of_lt_dimH`,
`LipschitzWith.dimH_image_le`, `MeasureTheory.exists_measurable_superset_of_null`.

### Examples

For the Sierpiński triangle `G` of FractalGeometry 5.2, almost every vertical slice has dimension
`1/2` (Bishop and Peres, Example 1.6.4), below the bound `log 3 / log 2 − 1 ≈ 0.585` of 4.1.

### Dependencies

Layer 4 uses Mathlib's Hausdorff measures only. It does not use Layers 1 to 3.

## Layer 5: Kakeya and Besicovitch sets

### 5.1 A Besicovitch set of zero area

Prove `exists_isCompact_volume_eq_zero_segment`: there is a compact set in the plane of zero area
containing a unit segment in every direction (Besicovitch; Bishop and Peres, Theorem 9.1.1, with the
sequence and the covering of Lemma 9.1.2). The route is the source's. Let `a_0 = 0` and, for
`2^n ≤ k < 2^(n+1)`, `a_k = k 2^(−n) − 1` for `n` even and `a_k = 2 − k 2^(−n)` for `n` odd, so that
the `a_k` sweep the points `j 2^(−n)` back and forth and consecutive terms from index `2^n` on
differ by at most `2^(−n)`. With `g(t) = t − ⌊t⌋` put
`f_k(t) = Σ_(1 ≤ m ≤ k) (a_(m−1) − a_m) 2^(−m) g(2^m t)` and `f = lim f_k`, and let `K₀` be the
closure of `{(a, f(t) + a t) : a, t ∈ [0, 1]}`. For fixed `t` the points with `a ∈ [0, 1]` form a
segment of slope `t` and length `√(1 + t²) ≥ 1`, so `K₀` contains a unit segment in every direction
of angle in `[0, π/4]`, and the union of `K₀` with its rotations by `π/4`, `π/2` and `3π/4` contains
one in every direction.

Zero area. On each half-open dyadic interval `I = [j 2^(−k), (j + 1) 2^(−k))`, `f_k(t) + a_k t` is
constant, and `|f − f_k| ≤ 2^(−n−k)` when `k ≥ 2^n`. Fix `n`. Every `a ∈ [0, 1]` lies within
`2^(−n)` of some `a_k` with `2^n ≤ k < 2^(n+1)`; cover the interval of radius `2^(−n)` about `a_k`
by `2^(k+1)` intervals `J` of length `2^(−k−n)`. For `a ∈ J` and `t ∈ I`, `f(t) + a t` stays within
`3 · 2^(−n−k)` of a number depending only on `J` and `I`, so the part of `K₀` over `J` lies in `2^k`
rectangles of area `6 · 2^(−2n−2k)`, plus one rectangle of area `2^(−2k−2n)` for `t = 1`. The total
area of this finite union of closed rectangles is at most
`12 · 2^(−n) + 2^(2−2n−2^n) ≤ 13 · 2^(−n)`, and the union, being closed, contains `K₀`. Rotations
preserve area.

**Checks.**

- The sequence begins `0, 0, 1, 1/2, 0, 1/4, 1/2, 3/4, 1, 7/8, 3/4, 5/8, 1/2, 3/8, 1/4, 1/8`, the
  sequence of Bishop and Peres, Lemma 9.1.2; consecutive differences from index `2^n` on are at most
  `2^(−n)`, including across the turns (for instance `a_7 = 3/4` and `a_8 = 1`).
- The cover areas are, exactly, `6.1875`, `3.0146…` and `1.5002…` for `n = 1, 2, 3`, below
  `13 · 2^(−n)`; in exact rational arithmetic, for a grid of `54 × 98` values of `(a, t)` and the
  series truncated at `m = 40`, every point `(a, f(t) + a t)` lies in the cover for `n = 1, 2, 3`.

*Needs:* Mathlib `segment`, `Metric.isCompact_of_isClosed_isBounded`,
`LinearIsometryEquiv.measurePreserving`
and `Orientation.rotation` (rotations of the plane preserve `volume`).

### 5.2 The Minkowski form of the Kakeya bound

Prove `volume_thickening_ge`: if `K` contains a unit segment in every direction and `0 < ε ≤ 1/2`,
then `volume (thickening ε K) ≥ 1/(8 log(1/ε))` (Bishop and Peres, Theorem 9.1.3, which asserts
`1/log(1/ε)` for all sufficiently small `ε`). No measurability of `K` is assumed. The route is that
of the source, with the constant worked out. Let `n = ⌊1/ε⌋ ≥ 2` and choose unit segments `ℓ_i ⊆ K`
in the directions of angle `iπ/n`, `0 ≤ i < n`, and let `Ψ` be the sum of the indicator functions of
their `ε`-neighbourhoods. Each neighbourhood has area `2ε + πε² ≥ 2ε`, so `∫ Ψ ≥ 2εn ≥ 1`, since
`εn > 1 − ε ≥ 1/2`. Each lies in an open strip of width `2ε`, and two strips at angle `φ` meet in a
parallelogram of area `4ε²/sin φ`, so `∫ Ψ² ≤ ∫ Ψ + 4ε² n T_n` with
`T_n = Σ_(k=1)^(n−1) 1/sin(kπ/n)`. From `sin x ≥ 2x/π` on `[0, π/2]`, `T_n ≤ n H_⌊n/2⌋`, with `H_m`
the harmonic number, and `εn ≤ 1` gives `4ε² n T_n ≤ 4 H_⌊n/2⌋ ≤ 4(1 + log(n/2))`. The
Cauchy–Schwarz inequality gives `volume {Ψ > 0} ≥ (∫ Ψ)² / ∫ Ψ² ≥ 1/(1 + 4 H_⌊n/2⌋)`, the last
because `x ↦ x²/(x + c)` increases and `∫ Ψ ≥ 1`. Finally `1 + 4(1 + log(n/2)) ≤ 8 log(1/ε)` because
`log n ≤ log(1/ε)` and `5 − 4 log 2 ≤ 4 log 2 ≤ 4 log(1/ε)`.

**Checks.**

- `T_n ≤ n H_⌊n/2⌋` and `1 + 4 T_n/n ≤ 8 log n` for every `n` from `2` to `3000`, the ratio of the
  two sides being largest at `n = 2` (`3` against `8 log 2 ≈ 5.545`). For `ε = 1/10`, `n = 10`,
  `T_10 ≈ 15.450 ≤ 22.83`, and the bound is `≈ 0.0543`.
- A parallelogram cut out by two open strips of width `0.2` at angle `π/7` has area
  `0.04 / sin(π/7) ≈ 0.0922`.
- The bound is informative for the set of 5.1: its area is `0`, while the areas of its
  `ε`-neighbourhoods decrease no faster than `1/(8 log(1/ε))`; the order `1/log(1/ε)` is attained
  (Bishop and Peres, Lemma 9.1.2).

*Needs:* Mathlib `Metric.thickening`, `segment`, `ENNReal.lintegral_mul_le_Lp_mul_Lq`,
`MeasureTheory.Measure.addHaar_image_linearMap` (the area of a parallelogram).

### 5.3 Segments in a set of directions

Prove `one_add_dimH_le_dimH`: let `K` be a closed set in the plane and `E` a nonempty set of unit
vectors such that for every `e ∈ E`, `K` contains `segment ℝ p (p + t • e)` for some `p` and some
`t > 0`. Then `1 + dimH E ≤ dimH K` (Bishop and Peres, Theorem 9.1.4, stated there for compact `K`
and a compact set `E` of directions; neither compactness of `E` nor boundedness of `K` is used
here). The route is the source's point–line duality, with the bookkeeping made explicit.

First let every `e ∈ E` satisfy `|e 1| ≤ |e 0|`, so that its slope `e 1 / e 0` lies in `[−1, 1]`.
For a closed interval `I` of positive length with rational endpoints and `N ∈ ℕ`, let `S(I, N)` be
the set of points `(a, b)` with `|a| ≤ 1`, `|b| ≤ N` and `(x, b + a x) ∈ K` for all `x ∈ I`: a
compact set, since `K` is closed. Each segment of `K` in a direction of `E` has a horizontal extent
of positive length, so the slopes of `E` lie in the countable union of the first-coordinate
projections `P(I, N)` of the sets `S(I, N)`. For `x ∈ I`, the vertical slice of `K` over `x`
contains `{b + a x : (a, b) ∈ S(I, N)}`, which is `√(1 + x²)` times the projection of `S(I, N)` in
the direction `(x, 1)/√(1 + x²)`; as `x` runs over `I` this direction runs over an interval of
angles, by a diffeomorphism, so by 2.4 the slice over almost every `x ∈ I` has dimension at least
`min (dimH S(I, N)) 1 ≥ dimH P(I, N)`. By the slicing theorem for Lebesgue measure (Tau Ceti's
Eilenberg inequality, as in 4.1), almost every slice has dimension at most `dimH K − 1`. As `I` has
positive length, some `x` satisfies both, and `dimH P(I, N) ≤ dimH K − 1`; here `dimH K ≥ 1`,
because `K` contains a segment, so the truncated difference is the true one. The map from slopes `a`
to unit vectors `±(1, a)/√(1 + a²)` is Lipschitz, so `dimH E ≤ sup dimH P(I, N) ≤ dimH K − 1`. In
general split `E` into the vectors with `|e 1| ≤ |e 0|` and the rest, and treat the rest after
rotating `K` by `π/2`, an isometry; `dimH` of a union of two sets is the larger dimension.
The route needs the sets `S(I, N)` compact, for 2.4, and closedness of `K` gives that; nothing is
claimed here for sets that are not closed.

**Checks.**

- `E` a single vector: the conclusion `1 ≤ dimH K` is the dimension of a segment.
- `E = ∅` is excluded: for `K = ∅` the conclusion would read `1 ≤ 0`.
- Sharpness: for a nonempty compact set `D` of angles in `[0, π/4]` and `E` the corresponding unit
  vectors, the union of the segments from `(cos φ, sin φ)` to `2(cos φ, sin φ)`, `φ ∈ D`, is
  bi-Lipschitz to `D × [1, 2]` and has dimension `dimH D + 1 = 1 + dimH E` by the product
  inequalities of FractalGeometry 5.5.

*Needs:* 2.1, 2.4; Tau Ceti `LipschitzOnWith.ae_hausdorffMeasure_inter_preimage_eq_zero`; Mathlib
`MeasureTheory.addHaar_image_eq_zero_of_differentiableOn_of_addHaar_eq_zero` (the change of variable
from `x` to the angle of `(x, 1)` keeps null sets null),
`dimH_iUnion`, `dimH_union`, `LipschitzWith.dimH_image_le`, `Isometry.dimH_image`,
`dimH_le_of_hausdorffMeasure_ne_top`, `MeasureTheory.hausdorffMeasure_real`.

### 5.4 Davies' theorem

Prove `dimH_eq_two`: a closed set in the plane containing a unit segment in every direction has
Hausdorff dimension `2` (Davies' theorem; Bishop and Peres, Theorem 9.1.4, for compact sets;
Hochman, Theorem 8.9, whose statement line prints the value `1`, while its proof, for sets
containing a whole line in every direction, gives `2`). Apply 5.3 with `E` the unit circle, which
has dimension at least `1` because its first-coordinate projection is `[−1, 1]`; and `dimH K ≤ 2`,
the dimension of the plane. Bishop and Peres assume `K` compact; Hochman's Theorem 8.9 falls under
the standing assumption of those notes that sets are Borel. Closedness is assumed here because the
route of 5.3 needs the sets `S(I, N)` compact; nothing is claimed for sets that are not closed.

**Checks.**

- The compact set of 5.1 has area `0` and dimension `2`: zero area does not lower the dimension.
- The closed unit disk contains a unit segment in every direction and has dimension `2` by Mathlib's
  `Real.dimH_of_nonempty_interior`; the content of the theorem is for sets of zero area.

*Needs:* 5.3; Mathlib `Real.dimH_univ_eq_finrank`, `LipschitzWith.dimH_image_le`,
`Real.dimH_of_nonempty_interior`.

### Examples

The compact set of 5.1 is the extreme case of the layer: by 5.1 its area is zero, by 5.4 its
Hausdorff dimension is `2`, and by 5.2 its `ε`-neighbourhoods have area at least `1/(8 log(1/ε))`.

### Dependencies

Layer 5 uses Layer 2 (2.1, 2.4) for 5.3 and 5.4, and Tau Ceti's Eilenberg inequality; 5.1 and 5.2
use Mathlib only. It does not use Layers 3 and 4.

## Scope and ownership

This roadmap owns: the Riesz capacity of a set and the capacitary description of the dimension of
compact sets (Layer 1); the projection onto lines, the averaging identity for energies, Kaufman's
and Marstrand's projection theorems in both regimes and Mattila's inequality and Favard-length
bound (Layers 2 and 3); the slicing theorem for measures with a power bound on balls (Layer 4); the
existence of a compact Besicovitch set of zero area, the Minkowski-form Kakeya bound, the bound
`1 + dim E` for sets with segments in a set `E` of directions, and Davies' theorem (Layer 5).

Stated by other roadmaps and consumed, not restated:

- FractalGeometry 3.2 (`exists_frostman_measure`, Frostman's lemma for compact sets) and 3.3
  (`hausdorffMeasure_eq_top_of_energy_ne_top`, the energy criterion) are the inputs of 1.2; the
  passage from Frostman's measure to a probability measure of finite energy is done in the route of
  1.2, in agreement with the converse for compact sets that 3.3 states in prose. Capacity is built
  on the energy integral of 3.3, copied verbatim; that roadmap declares no energy function and no
  capacity. Its 5.1 to 5.5 (dimensions of the Cantor set, of digit-restricted sets and of products)
  are used only in Checks.
- GeometricMeasureTheory owns rectifiable sets and the coarea formula, and nothing passes between
  the two. Besicovitch's theorem on the projections of purely unrectifiable sets (Hochman,
  Theorem 7.7) is stated neither there nor here.
- PolynomialMethodInCombinatorics Layer 4 owns Kakeya sets over finite fields (Dvir's bound); the
  sets of Layer 5 are subsets of the real plane and nothing passes between the two.

Already in the library and consumed, not restated: Hausdorff measure and dimension with their
behaviour under Lipschitz maps and isometries and the dimension of open sets; `μH[1] = volume` on
`ℝ`; Tonelli's theorem; inner regularity of finite measures on the plane; Lebesgue differentiation.
Tau Ceti's Eilenberg inequality (`LipschitzOnWith.lintegral_hausdorffMeasure_inter_preimage_le` and
its almost-everywhere corollaries) bounds the integral of the Hausdorff measures of the fibres of a
Lipschitz map into a finite-dimensional space against a Haar measure; with the first coordinate it
gives the slicing theorem for Lebesgue measure, which is therefore not a separate target. 4.1 above
differs: its measure on the line is any measure with a power bound on balls, a Frostman measure for
instance, not a Haar measure.

Outside this roadmap: Marstrand's projection theorems (2.4, 3.3) for Borel or analytic sets, which
need Frostman's lemma for such sets; projections in higher dimensions and onto subspaces of higher
dimension; Kaufman's dimension bound for the exceptional directions and its refinements;
Fourier-analytic proofs and the Fourier dimension; Hawkes' theorem on the intersections of the
Cantor set with its translates, whose proof needs the dimension of digit-frequency sets; Kakeya sets
in higher dimensions and the Kakeya conjecture; Besicovitch's projection theorem for purely
unrectifiable sets.

## Exact supplier contracts

### From Mathlib

- `Mathlib/Topology/MetricSpace/HausdorffDimension.lean`: `dimH` (values in `ℝ≥0∞`); `dimH_mono`;
  `dimH_union` and `dimH_iUnion` (finite and countable stability); `hausdorffMeasure_of_lt_dimH`
  (`μH[d] s = ∞` for `d < dimH s`); `le_dimH_of_hausdorffMeasure_eq_top` and
  `dimH_le_of_hausdorffMeasure_ne_top` (for `d : ℝ≥0`); `LipschitzWith.dimH_image_le`;
  `Isometry.dimH_image`; `Real.dimH_univ` (`dimH (univ : Set ℝ) = 1`);
  `Real.dimH_univ_eq_finrank` and `Real.dimH_of_nonempty_interior` (dimension of a
  finite-dimensional real normed space and of its subsets with nonempty interior).
- `Mathlib/MeasureTheory/Measure/Hausdorff.lean`: `MeasureTheory.Measure.hausdorffMeasure` (notation
  `μH[d]`); `MeasureTheory.Measure.hausdorffMeasure_apply` (the definition through covers of
  diameter at most `r`, empty sets contributing `0`); `MeasureTheory.hausdorffMeasure_real`
  (`μH[1] = volume` on `ℝ`).
- `Mathlib/MeasureTheory/Measure/Prod.lean` and the files of
  `Mathlib/MeasureTheory/Integral/Lebesgue/`: `MeasureTheory.lintegral_lintegral_swap` (Tonelli, for
  s-finite measures and an a.e.-measurable integrand); `MeasureTheory.lintegral_map`;
  `MeasureTheory.Measure.map_apply` (for a measurable map and a measurable set);
  `MeasureTheory.lintegral_liminf_le` (Fatou);
  `MeasureTheory.tendsto_lintegral_of_dominated_convergence`; `MeasureTheory.ae_lt_top` (a
  measurable function of finite integral is finite almost everywhere);
  `ENNReal.lintegral_mul_le_Lp_mul_Lq` (Hölder, used with exponents `2, 2`).
- `Mathlib/MeasureTheory/Measure/MeasureSpaceDef.lean`:
  `MeasureTheory.exists_measurable_superset_of_null`. `Mathlib/MeasureTheory/Measure/Regular.lean`:
  `MeasurableSet.exists_isCompact_lt_add` (for a measure that is inner regular for compact sets,
  which Mathlib provides for finite measures on complete separable metric spaces,
  `Mathlib/MeasureTheory/Measure/RegularityCompacts.lean`).
- `Mathlib/MeasureTheory/Covering/Besicovitch.lean`: `Besicovitch.ae_tendsto_rnDeriv` (ratios of
  measures of closed balls converge almost everywhere to the Radon–Nikodym derivative, for locally
  finite measures on a space with the Besicovitch covering property, which finite-dimensional real
  normed spaces have).
- `Mathlib/MeasureTheory/Measure/Lebesgue/EqHaar.lean`:
  `MeasureTheory.Measure.addHaar_image_linearMap` (a linear map multiplies a Haar measure by
  `|det|`). `Real.volume_closedBall` (`volume (closedBall a r) = ofReal (2r)`).
- `Mathlib/MeasureTheory/Measure/Haar/InnerProductSpace.lean`:
  `LinearIsometryEquiv.measurePreserving`. `Mathlib/Analysis/InnerProductSpace/TwoDim.lean`:
  `Orientation.rotation` (rotations of an oriented two-dimensional inner product space, linear
  isometries).
- `Mathlib/Analysis/InnerProductSpace/PiL2.lean`: `EuclideanSpace`.
  `Mathlib/Analysis/Convex/Segment.lean`: `segment`. `Mathlib/Topology/MetricSpace/Thickening.lean`:
  `Metric.thickening`. `IsCompact.image`; `Metric.isCompact_of_isClosed_isBounded` (closed bounded
  sets of a proper space). `ENNReal.inv_top` (`∞⁻¹ = 0`); `MeasureTheory.IsProbabilityMeasure`;
  `MeasureTheory.measure_mono`.
- For the σ-compact sets of 3.1 and 3.4: `Mathlib/Topology/Compactness/SigmaCompact.lean`:
  `IsSigmaCompact` (a countable union of compact sets). `tendsto_measure_cthickening_of_isCompact`
  (`Mathlib/MeasureTheory/Constructions/BorelSpace/Metric.lean`: the measures of the closed
  `r`-neighbourhoods of a compact set in a proper space tend to its measure as `r → 0`);
  `UpperSemicontinuous.measurable` and `Measurable.iSup` (countable suprema), in
  `Mathlib/MeasureTheory/Constructions/BorelSpace/Order.lean`;
  `MeasureTheory.measure_iUnion_eq_iSup_accumulate` (continuity from below for arbitrary sets,
  `Mathlib/MeasureTheory/Measure/Continuity.lean`); `MeasureTheory.lintegral_mono` (no measurability
  assumed). For 1.2: `ENNReal.tsum_geometric` (`Σ rⁿ = (1 − r)⁻¹` in `ℝ≥0∞`).

### From Tau Ceti

- `TauCeti/MeasureTheory/Function/Coarea/Eilenberg.lean`:
  `LipschitzOnWith.ae_hausdorffMeasure_inter_preimage_eq_zero` (if `f` is Lipschitz on `A` with
  values in an `m`-dimensional real normed space with a Haar measure `μ`, `t ≥ 0` and
  `μH[m + t] A = 0`, then `μH[t] (A ∩ f ⁻¹' {y}) = 0` for `μ`-almost every `y`; no measurability is
  assumed) and `LipschitzOnWith.lintegral_hausdorffMeasure_inter_preimage_le`. Used in the route of
  5.3 with `f` the first coordinate and `μ = volume`; `Suggested.lean` imports no Tau Ceti module,
  since no statement mentions it.

### From TauCetiRoadmap.FractalGeometry

- §3.2: `exists_frostman_measure` (for compact `K` in a finite-dimensional real normed space with
  its Borel σ-algebra, `s ≥ 0` and `μH[s] K ≠ 0`, a finite measure `μ` with `μ K ≠ 0`, `μ Kᶜ = 0`
  and `μ (closedBall x r) ≤ ENNReal.ofReal r ^ s` for all `x` and all real `r`), used in 1.2.
- §3.3: the energy integral `∫⁻ x, ∫⁻ y, edist x y ^ (-s) ∂μ ∂μ`, copied verbatim into the
  definition of `capacity`; `hausdorffMeasure_eq_top_of_energy_ne_top` (on a metric space with its
  Borel σ-algebra, if `s > 0`, `μ A ≠ 0` and the `s`-energy of `μ` is finite, then `μH[s] A = ∞`; no
  finiteness of `μ` and no measurability of `A`), used in 1.2.
- §5.1 to §5.5 (`dimH_cantorSet`, `dimH_sierpinskiSimplex`, `dimH_digitRestricted`,
  `dimH_prod_le`, `add_dimH_le_dimH_prod`), in Checks only.

## References

- Christopher J. Bishop and Yuval Peres, *Fractals in Probability and Analysis*, draft of
  1 December 2015 on the first author's page,
  [book1Dec15.pdf](https://www.math.stonybrook.edu/~bishop/classes/math324.F15/book1Dec15.pdf).
  The numbering used above is that of this draft: Theorem 1.6.1 and Example 1.6.4 (pp. 26–28),
  Theorem 3.3.1 (p. 92), Definition 3.4.1 and Theorem 3.4.2 (p. 94), Theorem 3.5.1 and
  Corollary 3.5.2 (p. 96), Theorems 3.5.3 and 3.5.4 and Lemmas 3.5.5 and 3.5.6 (pp. 98–101),
  Theorem 9.1.1, Lemma 9.1.2, Theorems 9.1.3 and 9.1.4 (pp. 263–268), Theorem 9.5.3 (p. 285).
- Michael Hochman, *Lectures on fractal geometry and dynamics*, notes of 27 June 2012 on the
  author's page,
  [course-notes.june-26.pdf](https://math.huji.ac.il/~mhochman/courses/fractals-2012/course-notes.june-26.pdf):
  Theorem 7.2 (p. 60), Theorems 7.6 and 7.7 (p. 63), Theorem 8.1 and Corollary 8.2 (pp. 75–76),
  Definition 8.7 and Theorems 8.8 and 8.9 (p. 77).
