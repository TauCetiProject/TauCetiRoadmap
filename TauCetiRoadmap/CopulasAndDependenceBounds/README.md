# Roadmap: copulas and dependence bounds

**Summary.** A copula is a law on the cube `[0, 1]^d` all of whose one-dimensional margins are
uniform. Copulas separate the dependence structure of a random vector from its margins, and the
classical theory around them is a short list of exact statements about joint distribution
functions. This roadmap builds that list for random vectors with finitely many real coordinates
and arbitrary margins, atoms included. It states:

- **The Fréchet–Hoeffding bounds.** For every random vector with joint distribution function `H`
  and margins `F₁, …, F_d`, `max(F₁(x₁) + ⋯ + F_d(x_d) − (d − 1), 0) ≤ H(x) ≤ min_i F_i(x_i)`.
  The upper bound is attained for every choice of margins by the comonotone vector, all of whose
  coordinates are quantile functions of one uniform variable; for two coordinates the lower bound
  is attained by the countermonotone vector. The lower bound function is the distribution function
  of a copula exactly when `d ≤ 2`, yet at each single point of the cube some copula attains it, in
  every dimension.
- **Sklar's theorem.** Every law on `ℝ^d` has a copula `C` with `H(x) = C(F₁(x₁), …, F_d(x_d))`;
  conversely a copula and any margins define such a law; when every margin is continuous the copula
  is unique and is the law of the vector `(F_i(X_i))_i`. A copula of `X` is a copula of
  `(T₁(X₁), …, T_d(X_d))` for any nondecreasing maps `T_i`, with no continuity assumption on the
  margins or the maps.
- **Comonotonicity.** For a random vector the following are equivalent: `H(x) = min_i F_i(x_i)`
  for every `x`; the law is the comonotone law of its own margins; the law is carried by a set that
  is totally ordered for the coordinatewise order.
- **Hoeffding's covariance identity.** If `X`, `Y` and `XY` are integrable, then
  `H(x, y) − F(x)G(y)` is Lebesgue integrable on the plane and its integral is `Cov(X, Y)`. With it,
  positively quadrant dependent variables with these moments are independent as soon as they are
  uncorrelated.

The roadmap builds on Tau Ceti's quantile functions (the Galois property of the lower quantile and
inverse transform sampling). Tau Ceti's monotone coupling of two real laws already has a quadrant
formula that is the two-dimensional attainment statement in complementary form; the statements
here are for any number of coordinates. It feeds the Hoeffding-identity
steps of the L-statistics layer of MathematicalStatisticsAsymptotic and any later work on
concordance measures, dependence orders and risk aggregation under dependence uncertainty.

## How to read the build

Layer 1 proves the Fréchet–Hoeffding bounds, their attainment and the dimension dichotomy for the
lower bound. Layer 2 proves Sklar's theorem in its three parts, monotone invariance and the
characterisation of comonotonicity; it uses Layer 1 for the comonotone law. Layer 3 proves
Hoeffding's identity and the independence criterion; it is independent of Layers 1 and 2.

## Conventions

- **Random vectors.** `ι` is a finite type with `d = Fintype.card ι` elements; a law on
  `ι → ℝ` carries the product σ-algebra and the coordinatewise order, so `Set.Iic x` is the lower
  orthant `{y | ∀ i, y i ≤ x i}`. For a probability measure `ν` on `ι → ℝ` the joint distribution
  function is `H(x) = ν.real (Iic x)`, the `i`-th margin is `ν.map (fun y ↦ y i)` and
  `F_i = cdf (ν.map (fun y ↦ y i))`, Mathlib's distribution function.
- **Copulas.** `IsCopula C` says that every margin of the measure `C` on `ι → ℝ` is
  `volume.restrict (Icc 0 1)`. For `d ≥ 1` such a `C` is a probability measure carried by the
  cube `Icc 0 1` (each margin is, and the complement of the cube lies in the union of the slabs
  `{u | u i ∉ Icc 0 1}`), and `u ↦ C.real (Iic u)` on the cube is a copula in the function sense
  of Embrechts–Lindskog–McNeil (Def 2.4, p. 3): it vanishes when some `u i = 0` (the slab
  `{u i ≤ 0}` has mass `0`), it equals `u i` when every other coordinate is `1`, and the signed sum
  over the vertices of a box is the `C`-mass of the half-open box. For `d = 0` the margin condition
  is empty and every measure on the one-point space is a copula; there Sklar's identity forces
  total mass `1`. The measure form is used because every statement below is about laws.
- `IsCopulaOf C ν` is Sklar's identity: `IsCopula C` and
  `ν.real (Iic x) = C.real (Iic fun i ↦ F_i (x i))` for every `x`.
- **Quantiles.** `μ.quantile` is Tau Ceti's lower quantile `t ↦ inf {x | t ≤ cdf μ x}`, used
  only at levels `0 < t < 1`. `comonotoneLaw μ` is the law of `t ↦ ((μ i).quantile t)ᵢ` under the
  uniform law `volume.restrict (Ioo 0 1)`. For two coordinates it is the image of Tau Ceti's
  `MeasureTheory.Measure.quantileCoupling` under `ℝ × ℝ ≃ (Fin 2 → ℝ)`.
- `frechetLower u = max (∑ i, u i - (d - 1)) 0`, computed in `ℝ` (no `ℕ` subtraction).
- **Two variables.** In Layer 3, `X, Y : Ω → ℝ` on a probability space `(Ω, P)`,
  `H(x, y) = P.real {X ≤ x ∧ Y ≤ y}`, `F(x) = P.real {X ≤ x}`, `G(y) = P.real {Y ≤ y}`,
  `cov[X, Y; P]` is Mathlib's covariance `∫ (X − E X)(Y − E Y) dP`, and the plane carries
  `volume` on `ℝ × ℝ`, the product of Lebesgue measures. Positive quadrant dependence (PQD) means
  `F(x) G(y) ≤ H(x, y)` for all `x, y`.

Two facts are used repeatedly and are proved inline where used:

- (Plateaus are null.) For a law `μ` on `ℝ` and a point `x`, the set `{y > x | cdf μ y = cdf μ x}`
  is `μ`-null: it is an interval with left end `x` on which `cdf μ` is constant, so it is a
  countable union of intervals `(x, z]` of mass `cdf μ z − cdf μ x = 0`.
- (Lipschitz bound.) For a probability measure `ν` on `ι → ℝ` and sets `A_i, B_i ⊆ ℝ`,
  `|ν(∏ A_i) − ν(∏ B_i)| ≤ ∑_i ν_i(A_i ∆ B_i)`, since the symmetric difference of the products is
  contained in the union of the slabs `{y | y_i ∈ A_i ∆ B_i}`. For a copula and `A_i = Iic u_i`,
  `B_i = Iic v_i` with `u, v` in the cube this is `|C(u) − C(v)| ≤ ∑ |u_i − v_i|`
  (Embrechts–Lindskog–McNeil, Thm 2.1, p. 4).

## Layer 1: The Fréchet–Hoeffding bounds

### 1.1 The bounds and their attainment

**Target** (`frechetHoeffding_bounds`). For every probability measure `ν` on `ι → ℝ` and every
`x`, `frechetLower (fun i ↦ F_i (x i)) ≤ ν.real (Iic x)` and `ν.real (Iic x) ≤ F_i (x i)` for each
`i` (Embrechts–Lindskog–McNeil, Thm 2.3, p. 5, for copulas; Embrechts–McNeil–Straumann, (12),
p. 13, and the proof of Thm 4, p. 24, for joint laws).

**Target** (`frechetHoeffding_attained`). For `ι` nonempty and probability measures `μ i` on `ℝ`,
`comonotoneLaw μ` has margins `μ i` and joint distribution function
`x ↦ min_i cdf (μ i) (x i)` (written with `Finset.inf'`). For probability measures `μ₁, μ₂` on
`ℝ`, the law of `t ↦ ![μ₁.quantile t, μ₂.quantile (1 − t)]` under the uniform law on `(0, 1)` has
joint distribution function `max (cdf μ₁ x₀ + cdf μ₂ x₁ − 1) 0` (Embrechts–McNeil–Straumann,
Thm 2 and its proof, p. 14, for two coordinates).

*Proof route.* Bounds: with `A_i = {y | y i ≤ x i}`, `Iic x = ⋂ A_i` and `ν(A_i) = F_i(x_i)`.
Monotonicity gives the upper bound. The complement of `⋂ A_i` is `⋃ A_iᶜ`, so the union bound
gives `1 − H(x) ≤ ∑ (1 − F_i(x_i))`, that is `H(x) ≥ ∑ F_i(x_i) − (d − 1)`; with `H(x) ≥ 0` this is
the lower bound. For `d = 0` the intersection is the whole space and both sides equal `1`.
Attainment: the margins of `comonotoneLaw μ` are the images of the uniform law under
`(μ i).quantile`, which are `μ i` by inverse transform sampling. For `t ∈ (0, 1)` the Galois
property gives `(μ i).quantile t ≤ x i ↔ t ≤ cdf (μ i) (x i)`, so the levels sent into `Iic x`
are `(0, m] ∩ (0, 1)` with `m = min_i cdf (μ i) (x i) ∈ [0, 1]`, of length `m`. In the second law
`1 − t ∈ (0, 1)` as well, so the levels sent into `Iic x` are those with
`1 − cdf μ₂ x₁ ≤ t ≤ cdf μ₁ x₀`, an interval of length `max (cdf μ₁ x₀ + cdf μ₂ x₁ − 1) 0`.

*Needs:* Mathlib `ProbabilityTheory.cdf_eq_real`, `MeasureTheory.measure_biUnion_finset_le`;
Tau Ceti `MeasureTheory.Measure.quantile_le_iff`, `MeasureTheory.Measure.map_quantile_volume_Ioo`,
`MeasureTheory.Measure.measurable_quantile`.

### 1.2 The lower bound is a copula only in dimension at most two

**Target** (`exists_isCopula_eq_frechetLower_iff`). Some copula `C` on `ι → ℝ` satisfies
`C.real (Iic u) = frechetLower u` for every `u ∈ Icc 0 1` if and only if `Fintype.card ι ≤ 2`
(Embrechts–Lindskog–McNeil, Ex 2.2, p. 5, for `d ≥ 3`; Embrechts–McNeil–Straumann, p. 13, for
`d = 2`).

*Proof route.* `d = 0`: the Dirac measure at the unique point (the margin condition is empty and
`frechetLower u = 1`). `d = 1`: the image of `volume.restrict (Icc 0 1)` under `t ↦ (fun _ ↦ t)`,
whose distribution function at `u ∈ [0, 1]` is `u = frechetLower u`. `d = 2`: with `ι = {a, b}`,
the image of the uniform law on `(0, 1)` under `t ↦ (t at a, 1 − t at b)`; both margins are uniform
on `(0, 1)`, which is `volume.restrict (Icc 0 1)` because the endpoints are null, and the levels
sent into `Iic u` form the interval `[1 − u_b, u_a] ∩ (0, 1)` of length `max (u_a + u_b − 1) 0`.
`d ≥ 3`: suppose `C` is such a copula and pick three distinct indices `a, b, c`. Let `E_k` be the
event that coordinate `k` is at most `1/2`; it has `C`-probability `1/2` (uniform margin). The
point with coordinates `1/2` at two of the indices and `1` elsewhere has
`frechetLower = max (1 + (d − 2) − (d − 1)) 0 = 0`, so `C(E_a ∩ E_b) = C(E_a ∩ E_c) = C(E_b ∩ E_c)
= 0`. Then `C(E_a ∪ E_b ∪ E_c) = 3/2 > 1`, a contradiction.

**Checks.** The `W`-volume of `[1/2, 1]^d` (the signed sum over its vertices) is `1 − d/2`, which is
`1/2, 0, −1/2, −1, −3/2, −2` for `d = 1, …, 6`; for `d = 2` every box of the grid `{k/4}²` has
nonnegative `W`-volume.

*Needs:* Mathlib `MeasureTheory.Ioo_ae_eq_Icc`, `MeasureTheory.Measure.restrict_congr_set`.

### 1.3 Pointwise sharpness of the lower bound

**Target** (`exists_isCopula_real_Iic_eq_frechetLower`). For every `u ∈ Icc 0 1` there is a
copula `C` with `C.real (Iic u) = frechetLower u`, in every dimension (Embrechts–Lindskog–McNeil,
Thm 2.4, p. 5, for `d ≥ 3`; for `d ≤ 2` it follows from 1.2).

*Proof route* (proved here). Enumerate `ι` as `i₁, …, i_d`, put `a_k = 1 − u_{i_k} ∈ [0, 1]` and
`c_k = a_1 + ⋯ + a_{k−1}`. Let `V` be uniform on `(0, 1)` and `U_{i_k} = fract (V − c_k + u_{i_k})`,
and let `C` be the law of `U`. Each `U_i` is `fract (V + s)` for a constant `s`; for `t ∈ [0, 1]`
the levels `v ∈ (0, 1)` with `fract (v + s) ≤ t` form one or two intervals of total length `t`
(translation by `fract s` on the circle), so every margin is uniform on `[0, 1]` and `C` is a
copula. Write `r = fract (V − c_k)`. If `r < a_k` then `U_{i_k} = r + u_{i_k}`, which exceeds
`u_{i_k}` exactly when `r > 0`; if `r ≥ a_k` then `U_{i_k} = r + u_{i_k} − 1 < u_{i_k}`. So, off the
null set `{fract (V − c_k) = 0}`, coordinate `i_k` exceeds `u_{i_k}` exactly when `V` lies in the
arc `(c_k, c_k + a_k)` of the circle `ℝ/ℤ`. These arcs are consecutive, so their union is the arc
`(0, a_1 + ⋯ + a_d)` up to finitely many points, of length `min (∑ a_k) 1`. Hence
`C.real (Iic u) = 1 − min (∑ a_k) 1 = max (∑ u_i − (d − 1)) 0`. For `d = 0` the construction is
the Dirac measure.

**Checks.** For `d = 1, …, 4` and all `u` with coordinates in `{0, 1/5, 1/2, 2/3, 1}`, the
construction gives `C(u) = W(u)` and `P(U_i ≤ t) = t` at `t = 1/7, 1/2, 5/6`.

*Needs:* Mathlib `Int.fract`.

### Examples

- `d = 2`, `u = (1/2, 1/2)`: `W(u) = 0`, attained by the countermonotone copula; `M(u) = 1/2` by
  the comonotone copula, and the independence copula gives `1/4`.
- Margins `μ₁ = (1/3)δ₀ + (1/6)δ₁ + (1/2)δ₄`, `μ₂ = (δ₋₁ + δ₂)/2`, `μ₃ = (1/5)δ₀ + (4/5)δ₁`:
  at every `x` in `{−2, −1, 0, 1/2, 1, …, 5}³` the comonotone law has distribution function
  `min_i F_i(x_i)`, and the countermonotone law of `μ₁, μ₂` has `max(F₁ + F₂ − 1, 0)`.

### Dependencies

Layer 1 uses Mathlib's distribution functions and union bound and Tau Ceti's quantile functions.

## Layer 2: Sklar's theorem

### 2.1 Existence

**Target** (`exists_isCopulaOf`). Every probability measure `ν` on `ι → ℝ` has a copula:
`∃ C, IsCopulaOf C ν` (Embrechts–Lindskog–McNeil, Thm 2.2, p. 4; Oertel, Cor 2.20, p. 14).

*Proof route.* Work on `(ι → ℝ) × (0, 1)` with `ν ⊗ λ`. For `(y, v)` put
`U_i = F_i(y_i−) + v (F_i(y_i) − F_i(y_i−))`, with `F_i(y−) = ν_i(Iio y)` the left limit, and let
`C` be the law of `U`; one uniform variable serves every coordinate. Each `U_i` lies in `[0, 1]`.

*Uniform margins.* The pair `(y_i, v)` has law `ν_i ⊗ λ`. Fix `t ∈ (0, 1)` and `q = Q_i(t)`, the
quantile; then `F_i(q−) ≤ t ≤ F_i(q)`. If `y < q` then `F_i(y) < t`, so `U_i < t`: mass `F_i(q−)`.
If `y = q`, `U_i ≤ t` holds for a set of `v` of length `(t − F_i(q−)) / ΔF_i(q)` when
`ΔF_i(q) > 0`, which contributes `t − F_i(q−)`; when `ΔF_i(q) = 0` the point carries no mass. If
`y > q` then `F_i(y−) ≥ F_i(q) ≥ t`, and `U_i ≤ t` forces `F_i(y−) = t = F_i(q)` and
`v ΔF_i(y) = 0`, so `F_i(y) = F_i(q)`: `y` lies in a null plateau. The total is `t`, so `U_i` is
uniform on `[0, 1]` and `IsCopula C` holds.

*Sklar's identity.* If `y_i ≤ x_i` then `U_i ≤ F_i(y_i) ≤ F_i(x_i)`. If `y_i > x_i` then
`U_i ≥ F_i(y_i−) ≥ F_i(x_i)`, and `U_i ≤ F_i(x_i)` forces `F_i(y_i−) = F_i(x_i)` and
`v ΔF_i(y_i) = 0`, so `F_i(y_i) = F_i(x_i)` and `y_i` lies in the null plateau above `x_i`. Hence
`{∀ i, U_i ≤ F_i(x_i)}` and `{∀ i, y_i ≤ x_i}` differ by a null set, and
`C.real (Iic F(x)) = ν.real (Iic x)`.

**Checks.** For the laws `ν₂` and `ν₃` of the Examples and every `x` in
`{−1, 0, 1/2, 1, 3/2, 2, 3}^d`,
the law of `U` satisfies Sklar's identity, and `P(U_i ≤ t) = t` at `t = 1/9, 1/3, 1/2, 7/8`.

*Needs:* Mathlib `ProbabilityTheory.cdf_eq_real`, `MeasureTheory.Measure.ext_of_Iic`;
Tau Ceti `MeasureTheory.Measure.leftLim_cdf`, `MeasureTheory.Measure.le_cdf_quantile`,
`MeasureTheory.Measure.measureReal_Iio_quantile_le`, `MeasureTheory.Measure.lt_quantile_iff`.

### 2.2 The converse

**Target** (`isCopulaOf_map_quantile`). For a copula `C` and probability measures `μ i` on `ℝ`, the
image `ν` of `C` under `u ↦ ((μ i).quantile (u i))ᵢ` has margins `μ i`, and `IsCopulaOf C ν`
(Embrechts–Lindskog–McNeil, Thm 2.2, p. 4, last sentence; Oertel, Cor 2.20, p. 14).

*Proof route.* The `i`-th margin of `ν` is the image of `volume.restrict (Icc 0 1)` under
`(μ i).quantile`, which equals the image of `volume.restrict (Ioo 0 1)` (the endpoints are null),
that is `μ i` by inverse transform sampling. `C`-almost every `u` has every `u i ∈ (0, 1)`, since
each margin gives `{0, 1}` mass zero, and there
`(μ i).quantile (u i) ≤ x i ↔ u i ≤ cdf (μ i) (x i)`.
So `ν.real (Iic x) = C.real (Iic fun i ↦ cdf (μ i) (x i))`, and `cdf (μ i)` is the distribution
function of the `i`-th margin of `ν`.

*Needs:* Tau Ceti `MeasureTheory.Measure.quantile_le_iff`,
`MeasureTheory.Measure.map_quantile_volume_Ioo`; Mathlib `MeasureTheory.Ioo_ae_eq_Icc`.

### 2.3 Uniqueness for continuous margins

**Target** (`isCopulaOf_iff_eq_map_cdf`). If every `F_i` is continuous, then `IsCopulaOf C ν`
holds exactly when `C = ν.map (fun y i ↦ F_i (y i))` (Embrechts–Lindskog–McNeil, Thm 2.2, p. 4,
uniqueness, and §2.4, p. 6, for the probability integral transforms).

*Proof route.* `⇐`: a continuous `F_i` gives every point `ν_i`-mass `F_i(x) − F_i(x−) = 0`, so the
probability integral transform sends `ν_i` to `volume.restrict (Icc 0 1)`: `D = ν.map Φ`,
`Φ y = (F_i (y i))ᵢ`, is a copula. Also `{F_i(y_i) ≤ F_i(x_i)}` is `{y_i ≤ x_i}` together with
the null plateau above `x_i`, so `D.real (Iic F(x)) = ν.real (Iic x)`. `⇒`: let `C` be a copula
of `ν`. A continuous distribution function takes every value in `(0, 1)`, so for `u ∈ (0, 1)^ι`
pick `x` with `F_i(x_i) = u_i`; then `C.real (Iic u) = ν.real (Iic x) = D.real (Iic u)`. Both are
copulas, so both distribution functions are continuous on the cube (Lipschitz bound) and agree on
its closure; outside the cube each equals its value at the clamped point `max (min u 1) 0`,
because a copula is carried by `Icc 0 1`. Finally two finite measures on `ι → ℝ` that agree on all
orthants `Iic u` are equal: orthants are closed under intersection (`Iic u ∩ Iic v = Iic (u ⊓ v)`),
are products of the rays `Iic`, which generate the Borel sets of `ℝ`, and cover the space by the
increasing sequence `Iic (fun _ ↦ n)`.

**Checks.** Continuity cannot be dropped: for `ν` the Dirac measure at `(0, 0)` both margins take
only the values `0` and `1`, every copula satisfies Sklar's identity, and the comonotone and
independence copulas differ at `(1/2, 1/2)` (`1/2` against `1/4`).

*Needs:* Tau Ceti `MeasureTheory.Measure.cdf_map_eq_volume_restrict`; Mathlib
`ProbabilityTheory.measure_cdf`, `StieltjesFunction.measure_singleton`, `generateFrom_eq_pi`,
`borel_eq_generateFrom_Iic`, `MeasureTheory.ext_of_generate_finite`.

### 2.4 Invariance under nondecreasing maps

**Target** (`IsCopulaOf.map_monotone`). If `IsCopulaOf C ν` and every `T i : ℝ → ℝ` is monotone,
then `IsCopulaOf C (ν.map fun y i ↦ T i (y i))`, for arbitrary margins
(Embrechts–Lindskog–McNeil, Thm 2.6, p. 6, for strictly increasing maps and continuous margins;
Embrechts–McNeil–Straumann, Prop 2, p. 6, for continuous increasing maps).

*Proof route* (proved here; it needs neither continuity nor strict monotonicity). The map is
measurable since each `T i` is monotone. Fix `y`. The set `D_i = (T i)⁻¹ (Iic (y i))` is a lower
set of `ℝ`, hence one of `∅`, `ℝ`, `Iio a`, `Iic a`. The image law gives `Iic y` mass `ν(∏ D_i)`
and its `i`-th margin has distribution function value `ν_i(D_i)` at `y i`. Choose `x_i^n` with
`ν_i(D_i ∆ Iic x_i^n) → 0`: `−n` for `∅`, `n` for `ℝ`, `a` for `Iic a`, `a − 1/n` for `Iio a`.
By the Lipschitz bound, `|ν(∏ D_i) − ν(Iic x^n)| ≤ ∑ ν_i(D_i ∆ Iic x_i^n) → 0` and
`|C(F(x^n)) − C((ν_i(D_i))ᵢ)| ≤ ∑ |F_i(x_i^n) − ν_i(D_i)| → 0`. Sklar's identity for `ν` equates
the two middle terms, so `ν(∏ D_i) = C.real (Iic (ν_i(D_i))ᵢ)`.

**Checks.** With `T₁ = 0` below `1` and `5` from `1` on, `T₂ = min(·, 1)` and `T₃ ≡ 3`, the
copula of 2.1 for `ν₂` and `ν₃` satisfies Sklar's identity for the image laws at every grid point.

*Needs:* Mathlib `Monotone.measurable`,
`MeasureTheory.measure_biUnion_finset_le`.

### 2.5 Comonotonicity

**Target** (`comonotone_tfae`). For `ι` nonempty and a probability measure `ν` on `ι → ℝ` the
following are equivalent: (a) `ν.real (Iic x) = min_i F_i(x_i)` for every `x`; (b) `ν` is
`comonotoneLaw` of its own margins; (c) some `S ⊆ ι → ℝ` that is a chain for the coordinatewise
order has `ν Sᶜ = 0` (Embrechts–McNeil–Straumann, Thm 2, p. 14, for two coordinates).

*Proof route* (proved here for `d` coordinates). (a) ⇒ (b): by 1.1 the comonotone law of the
margins of `ν` has the same margins and distribution function `min_i F_i(x_i)`; two finite measures
that agree on orthants are equal (2.3). (b) ⇒ (c): the levels `t ∈ (0, 1)` are mapped to a chain,
since each quantile function is monotone on `(0, 1)`; its closure `S` is a chain, because
`{(p, q) | p ≤ q ∨ q ≤ p}` is closed, and `S` is closed, so the comonotone law gives `Sᶜ` mass
`λ{t ∈ (0, 1) | Q(t) ∉ S} = 0`. (c) ⇒ (a): put `A_i = {y | y i ≤ x i}`. The sets `S ∩ A_i` are
nested: if `p ∈ S ∩ A_i \ A_j` and `q ∈ S ∩ A_j \ A_i`, then `p ≤ q` gives `p_j ≤ q_j ≤ x_j` and
`q ≤ p` gives `q_i ≤ p_i ≤ x_i`, both impossible. So `S ∩ Iic x = S ∩ A_j` for some `j`, and since
`ν Sᶜ = 0`, `ν(Iic x) = ν(A_j) = F_j(x_j)`. By the upper bound of 1.1 this is `min_i F_i(x_i)`.
Measurability of `S` is not needed for this step (`measure_inter_conull`).

**Checks.** The law `(1/3)δ_(0,0) + (1/6)δ_(0,1) + (1/2)δ_(2,1)` is carried by a chain and has
`H = min(F₁, F₂)` on the grid; `ν₂` is not comonotone (`H(0, 0) = 1/4` against
`min(F₁(0), F₂(0)) = 3/8`).

*Needs:* 1.1, 2.3 (the orthant uniqueness step); Tau Ceti
`MeasureTheory.Measure.monotoneOn_quantile`; Mathlib `MeasureTheory.measure_inter_conull`.

### Examples

- `ν₂ = (1/4)δ_(0,0) + (1/8)δ_(0,2) + (1/4)δ_(1,1) + (1/8)δ_(2,0) + (1/4)δ_(2,2)` and
  `ν₃ = (1/3)δ_(0,0,1) + (1/6)δ_(1,0,0) + (1/4)δ_(1,2,1) + (1/4)δ_(2,1,0)`: laws with atoms and ties
  in every coordinate, used in the Checks of 2.1 and 2.4.
- `d = 1`: the only copula is the uniform law, and Sklar's identity reads `F(x) = F(x)`.

### Dependencies

2.1–2.4 use Mathlib's distribution functions and Tau Ceti's quantile functions; 2.5 uses 1.1 and
the orthant uniqueness step of 2.3.

## Layer 3: Hoeffding's covariance identity

### 3.1 The identity

**Target** (`hoeffding_covariance`). If `X`, `Y` and `X * Y` are integrable, then
`(x, y) ↦ H(x, y) − F(x) G(y)` is integrable on `ℝ × ℝ` and
`cov[X, Y; P] = ∫ (H(x, y) − F(x) G(y)) d(x, y)` (Embrechts–McNeil–Straumann, (17), p. 16,
attributed there to Hoeffding (1940); no measurability hypothesis is needed beyond what
integrability gives).

*Proof route* (proved here). Integrable functions are almost everywhere strongly measurable, so
`X` and `Y` agree almost everywhere with measurable `X₀` and `Y₀`. Each event `{X ≤ x ∧ Y ≤ y}`
then differs from `{X₀ ≤ x ∧ Y₀ ≤ y}` by a subset of a null set, so `H`, `F` and `G` are unchanged
(`measure_congr`), and so are the covariance and the integrability hypotheses; assume `X` and `Y`
measurable from now on. Integrability of `X`, `Y`, `XY` makes `(X − E X)(Y − E Y)` integrable
with integral `E[XY] − E X · E Y`. Let `(X', Y')` be an independent copy: on `Ω × Ω` with `P ⊗ P`
take `X, Y` of the first factor and `X', Y'` of the second. For real `a, b`,
`a − b = ∫ (1{b ≤ s} − 1{a ≤ s}) ds`, the integrand being `±1` between `a` and `b` and `0`
elsewhere. Hence `(X − X')(Y − Y') = ∫∫ g(s, t) ds dt` with
`g = (1{X' ≤ s} − 1{X ≤ s})(1{Y' ≤ t} − 1{Y ≤ t})`, and `∫∫ |g| = |X − X'| |Y − Y'|`. Its
expectation is at most `E|XY| + 2 E|X| E|Y| + E|XY| < ∞`. By Fubini on `(Ω × Ω) × ℝ²` the map
`(s, t) ↦ E g(s, t)` is integrable, and `E g = 2 (H − F G)` because the cross terms factor by
independence of the copies. On the other side `E[(X − X')(Y − Y')] = 2 (E[XY] − E X · E Y)`.

**Checks.**

- Exact discrete cases: for `ν₂` both sides are `1/4`; for `(1/2)δ_(0,1) + (1/3)δ_(3,−2) +
  (1/6)δ_(1,1)` both are `−11/6`.
- `XY` integrable is needed: for `X = Y` integrable with `E X² = ∞` the integrand
  `min(F(x), F(y)) − F(x)F(y)` is nonnegative and its integral is `Var X = ∞` (the same computation
  with Tonelli), so it is not integrable.
- `X` integrable is needed: for `Z ≥ 1` with `E Z = ∞`, `X = Z` and `Y = −1/Z`, `XY = −1` and `Y`
  are integrable; the pair is comonotone, so `g ≥ 0` pointwise, and Tonelli gives the integral
  `(1/2) E[(Z − Z')(1/Z' − 1/Z)] = E Z · E(1/Z) − 1 = ∞`. Swapping the roles shows the same for `Y`.

*Needs:* Mathlib `MeasureTheory.integral_prod`, `MeasureTheory.integrable_prod_iff`,
`ProbabilityTheory.covariance`, `MeasureTheory.measure_congr`.

### 3.2 Uncorrelated quadrant-dependent variables are independent

**Target** (`indepFun_of_pqd_of_covariance_eq_zero`). If `X`, `Y` and `X * Y` are integrable,
`X` and `Y` are PQD and `cov[X, Y; P] = 0`, then `IndepFun X Y P`.

*Proof route* (proved here). As in 3.1, replace `X` and `Y` by measurable versions: this changes
neither the hypotheses nor `H`, `F`, `G`, and independence passes back along almost everywhere
equality (`ProbabilityTheory.IndepFun.congr`). By 3.1, `H − FG` is integrable, nonnegative by PQD, with integral `0`,
so it vanishes Lebesgue-almost everywhere on the plane. Fix `(x, y)`. Each square
`(x, x + 1/n) × (y, y + 1/n)` has positive measure, so it contains a point `(x_n, y_n)` with
`H(x_n, y_n) = F(x_n) G(y_n)`. As `n → ∞`, `H(x_n, y_n) → H(x, y)` by continuity from above of
`P` along the decreasing events `{X ≤ x_n, Y ≤ y_n}`, and `F(x_n) → F(x)`, `G(y_n) → G(y)` by
right continuity. So `H = FG` everywhere. The joint law of `(X, Y)` and the product of its
marginal laws are finite measures on `ℝ × ℝ` that agree on the rectangles `Iic x ×ˢ Iic y`, a
π-system generating the Borel sets, so they are equal, which is independence.

**Checks.**

- PQD is needed: `X` uniform on `{−1, 0, 1}` and `Y = X²` have covariance `0` and are dependent;
  PQD fails at `(−1, 0)`, where `H = 0 < 1/9 = F(−1) G(0)`.
- Zero covariance is needed: `X = Y` Bernoulli`(1/2)` is PQD with covariance `1/4`.
- `XY` integrable is needed: `X = Y` integrable with `E X² = ∞` is PQD (`min(a, b) ≥ ab` on
  `[0, 1]`), Mathlib's covariance is the junk value `0` (the integrand is not integrable), and `X`
  is not independent of itself.
- `X` integrable is needed: `X = Z`, `Y = −1/Z` as in 3.1 are comonotone, hence PQD; the
  covariance integrand `Z (Y − E Y)` is not integrable, so `cov = 0`; they are dependent.

*Needs:* 3.1; Mathlib `ProbabilityTheory.indepFun_iff_map_prod_eq_prod_map_map`,
`ProbabilityTheory.IndepFun.congr`, `MeasureTheory.ext_of_generate_finite`.

### Examples

- `X = Y` Bernoulli`(p)`: `H − FG` is `p(1 − p)` on `[0, 1) × [0, 1)` and `0` elsewhere, with
  integral `p(1 − p) = Var X`.
- Combined with 1.1, 3.1 gives the covariance bounds of Hoeffding and Fréchet: for laws with
  finite second moments the covariance over all couplings is largest at the comonotone law and
  smallest at the countermonotone law (Embrechts–McNeil–Straumann, Thm 4, p. 24, part 2).

### Dependencies

3.1 uses Mathlib's Fubini theorem and covariance; 3.2 uses 3.1.

## Downstream consumers

- MathematicalStatisticsAsymptotic, Layer 6, §6.4 (L-statistics and the trimmed mean), uses
  Hoeffding's covariance identity in its route and Checks to write `∬ (F(x ∧ y) − F(x)F(y)) dx dy`
  as a variance; 3.1 with `X = Y` square-integrable is that identity.
- Population versions of Kendall's tau and Spearman's rho, whose sample versions and limits are in
  MathematicalStatisticsNonparametric, can be written as functionals of the copula of 2.3.

## Scope and ownership

Owned here: the four definitions `IsCopula`, `IsCopulaOf`, `comonotoneLaw`, `frechetLower`, and
the eleven theorems of Layers 1–3.

Already in the library: Tau Ceti's lower quantile with its Galois property and inverse transform
sampling, the probability integral transform for atomless laws, and the monotone coupling of two
real laws (the quantile coupling of OptimalTransport, Layer 3, §3.7) with the bivariate quadrant
bound `TauCeti.ofReal_cdf_sub_le_measure` (every coupling
gives `Iic a ×ˢ Ioi b` mass at least `cdf μ a − cdf ν b`) and its attainment
`MeasureTheory.Measure.quantileCoupling_Iic_prod_Ioi`. Those two are the bivariate upper bound of
1.1 and its attainment in complementary form; 1.1 is the `d`-coordinate statement, with the lower
bound. Mathlib's covariance and independence are used as defined.

Not treated here: the function-level characterisation of copulas as grounded `d`-increasing
functions with uniform margins (one direction is stated in Conventions as a remark on the
distribution function of a copula); concordance measures (Kendall's tau, Spearman's rho, Blomqvist's
beta) as copula functionals; Archimedean, elliptical and extreme-value copula families; tail
dependence; stochastic orders between univariate laws and dependence orders between copulas;
risk aggregation bounds under dependence uncertainty; the empirical copula process.

## Exact supplier contracts

### From Mathlib

- `ProbabilityTheory.cdf` (`Mathlib/Probability/CDF.lean`) and `ProbabilityTheory.cdf_eq_real`:
  for a probability measure `μ` on `ℝ`, `cdf μ x = μ.real (Iic x)`; `ProbabilityTheory.measure_cdf`:
  `(cdf μ).measure = μ`; `StieltjesFunction.measure_singleton`: `f.measure {a} =
  ofReal (f a − leftLim f a)`.
- `ProbabilityTheory.covariance` (`Mathlib/Probability/Moments/Covariance.lean`):
  `cov[X, Y; μ] = ∫ (X − μ[X]) * (Y − μ[Y]) ∂μ`.
- `ProbabilityTheory.indepFun_iff_map_prod_eq_prod_map_map`
  (`Mathlib/Probability/Independence/Basic.lean`): for a finite measure and `AEMeasurable` maps,
  independence is equality of the joint law with the product of the laws;
  `ProbabilityTheory.IndepFun.congr`: independence passes to almost everywhere equal functions.
- `MeasureTheory.integral_prod`, `MeasureTheory.integrable_prod_iff`
  (`Mathlib/MeasureTheory/Integral/Prod.lean`): Fubini for `SFinite` measures and integrable
  functions.
- `MeasureTheory.measure_biUnion_finset_le`, `MeasureTheory.measure_inter_conull`
  (`μ tᶜ = 0 → μ (s ∩ t) = μ s`, no measurability), `MeasureTheory.measure_congr`
  (`s =ᵐ[μ] t → μ s = μ t`, no measurability), `Monotone.measurable`.
- `generateFrom_eq_pi` (`Mathlib/MeasureTheory/MeasurableSpace/Pi.lean`: generating families of
  the factors that are countably spanning generate the product σ-algebra through boxes),
  `borel_eq_generateFrom_Iic`, `MeasureTheory.ext_of_generate_finite` (finite measures agreeing on
  a generating π-system and on the whole space are equal), `MeasureTheory.Measure.ext_of_Iic`.
- `MeasureTheory.Ioo_ae_eq_Icc` (under `NullSingletonClass`),
  `MeasureTheory.Measure.restrict_congr_set`,
  `Int.fract`.

### From Tau Ceti

- `MeasureTheory.Measure.quantile` (`TauCeti/Probability/Quantile.lean`):
  `μ.quantile t = sInf {x | t ≤ cdf μ x}`.
- `MeasureTheory.Measure.quantile_le_iff`: for `0 < t < 1`, `μ.quantile t ≤ x ↔ t ≤ cdf μ x`;
  `MeasureTheory.Measure.lt_quantile_iff`: `x < μ.quantile t ↔ cdf μ x < t` there.
- `MeasureTheory.Measure.map_quantile_volume_Ioo`: for a probability measure `μ`,
  `(volume.restrict (Ioo 0 1)).map μ.quantile = μ`; `MeasureTheory.Measure.measurable_quantile`;
  `MeasureTheory.Measure.monotoneOn_quantile`: monotone on `Ioo 0 1`.
- `MeasureTheory.Measure.le_cdf_quantile` (`t < 1 → t ≤ cdf μ (μ.quantile t)`) and
  `MeasureTheory.Measure.measureReal_Iio_quantile_le` (for a probability measure and
  `0 < t < 1`, `μ.real (Iio (μ.quantile t)) ≤ t`).
- `MeasureTheory.Measure.cdf_map_eq_volume_restrict`: for a probability measure with
  `NullSingletonClass`, `(cdf ν)` pushes `ν` to `volume.restrict (Icc 0 1)`;
  `MeasureTheory.Measure.leftLim_cdf`: `leftLim (cdf ν) x = ν.real (Iio x)`
  (`TauCeti/Probability/Cdf.lean`).
- Cited for comparison, not used by a route: `MeasureTheory.Measure.quantileCoupling`,
  `MeasureTheory.Measure.quantileCoupling_Iic_prod_Ioi`
  (`TauCeti/MeasureTheory/OptimalTransport/Wasserstein/Quantile/Basic.lean`) and
  `TauCeti.ofReal_cdf_sub_le_measure` (`.../Wasserstein/Rearrangement.lean`).

## References

- P. Embrechts, F. Lindskog and A. McNeil, *Modelling dependence with copulas and applications
  to risk management*, preprint, ETH Zürich, 10 September 2001
  (people.math.ethz.ch/~embrecht/ftp/copchapter.pdf); published in *Handbook of Heavy Tailed
  Distributions in Finance*, Elsevier, 2003, pp. 329–384, doi:10.1016/B978-044450896-6.50010-8.
  Locators refer to the preprint: Def 2.4, p. 3; Thm 2.1, Thm 2.2, p. 4;
  Ex 2.2, Thm 2.3, Thm 2.4, p. 5; §2.4 and Thm 2.6, p. 6.
- P. Embrechts, A. McNeil and D. Straumann, *Correlation and dependency in risk management:
  properties and pitfalls*, preprint, ETH Zürich, November 1998
  (people.math.ethz.ch/~embrecht/ftp/pitfalls.pdf). Prop 2, p. 6; (12), p. 13; Thm 2, p. 14;
  (17), p. 16; Thm 4, p. 24.
- F. Oertel, *An analysis of the Rüschendorf transform – with a view towards Sklar's theorem*,
  arXiv:1312.4997v3, 2015. Prop 2.16, p. 12; Thm 2.18, p. 13; Cor 2.20, p. 14.
