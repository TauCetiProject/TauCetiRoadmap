# Roadmap: gravitational lensing

**Summary.** A mass between an observer and a distant point source bends light, and the observer
may see several images of the source. In the thin-lens model the bending is encoded in the lens
map of the plane, which sends a point of the lens plane to the source position whose light
arrives from that direction; the images of a source are the points the lens map sends to it.
This roadmap takes the lens map on `ℂ` as its starting definition, for lenses made of a smooth
part and finitely many point masses, and for the singular isothermal sphere. It proves that
the images are the critical points of a time delay function, computes the images and
magnifications of the two basic lenses, and counts images topologically.

- *Point masses and isothermal spheres.* A point mass `M > 0` at `a` images every source
  `w ≠ a` exactly twice, with signed magnifications `1/2 ± (u² + 2M)/(2u√(u² + 4M))`, where
  `u = |w − a|`; the source `a` itself is imaged onto the Einstein ring `|z − a| = √M`. The
  singular isothermal sphere of Einstein radius `b > 0` images a source `w ≠ 0` twice when
  `|w| < b` and once when `|w| ≥ b`.
- *Image counting.* Let the lens be a twice continuously differentiable potential plus `n` point
  masses of nonzero mass at distinct positions, with lens map of positive definite derivative
  outside some disc and time delay tending to `+∞` at infinity. A source at which no image has
  vanishing Jacobian then has finitely many images, and those of negative Jacobian outnumber
  those of positive Jacobian by exactly `n − 1`. If the masses are positive, some image has
  positive Jacobian. With no point masses the number of images is odd.
- *Point-mass lenses.* For `n ≥ 2` point masses of nonzero mass at distinct positions no source
  has more than `n² + 1` images. For positive masses and a source as above there are at least
  `n + 1` images, with the parity of `n + 1`; so two such masses give three or five images.

The roadmap builds on Mathlib's gradients and real derivatives in the plane and on Tau Ceti's
winding numbers of piecewise continuously differentiable curves, which turn image counting into
an argument principle; the analytic argument principle of Tau Ceti does not apply, since the
lens map is not holomorphic. The sharper bound `5n − 5` of Khavinson and Neumann is not treated
here: its proof uses a fact from complex dynamics that the pinned libraries do not contain.

A design note below fixes the lens map, the time delay and its sign, images, the Jacobian and the
signed magnification. Layer 1 proves Fermat's principle and computes the Jacobian of point
masses. Layer 2 treats the point mass and the isothermal sphere exactly. Layer 3 proves the
argument principle for continuously differentiable maps of the plane. Layer 4 combines Layers 1
and 3 to count images.

## Conventions

- **The plane.** The lens plane and the source plane are both `ℂ`, a real inner product space
  with `inner ℝ z w = Re(conj z · w)`. Gradients are Mathlib's `gradient` for this inner product
  and real derivatives are `fderiv ℝ`; the Jacobian of a map `ℂ → ℂ` at a point is the
  determinant `LinearMap.det` of its real derivative.
- **Lenses.** A lens is a smooth potential `ψ₀ : ℂ → ℝ`, a number `n` of point masses, their
  positions `pos : Fin n → ℂ` and their masses `m : Fin n → ℝ`. Masses are in units in which a
  point mass `M` has Einstein radius `√M`.
- **Winding numbers.** The winding number of a curve `γ : ℝ → ℂ` on `[a, b]` about `z₀` is Tau
  Ceti's `TauCeti.Contour.windingNumber γ a b z₀`, the index integral `(2πi)⁻¹ ∮ dz/(z − z₀)`; it
  is the topological winding number for closed piecewise continuously differentiable curves that
  avoid `z₀`. The circles are Mathlib's `circleMap c R` on `[0, 2π]`, traversed counterclockwise.
- **Counting.** Numbers of images are `Set.ncard`, which is `0` for an infinite set; every count
  below is stated together with the finiteness of the set counted.

## Design note

### D.1 Lens map and images

Define `pointDeflection pos m z = ∑ j, m j / conj (z − pos j)` and the lens map
`lensMap ψ₀ pos m z = z − gradient ψ₀ z − pointDeflection pos m z`. This is the map
`η(x) = x − ∇ψ(x)` of Petters–Werner (§1.2, p. 3) for the potential of D.2, written in complex
form: the gradient of `m log |z − p|` at `z ≠ p` is `m (z − p)/|z − p|² = m / conj (z − p)`.

Define `images ψ₀ pos m w` as the set of `z` with `z ≠ pos j` for every `j` and
`lensMap ψ₀ pos m z = w`. At a position the term `m j / conj 0` has Lean's junk value `0`, so the
lens map is defined everywhere but means nothing at the positions; the images exclude them.

**Checks.**
- One unit mass at `0` and the source `3/2`: the images are `2` and `−1/2`, since `2 − 1/2 = 3/2`
  and `−1/2 + 2 = 3/2`.
- The exclusion is needed: unit masses at `1` and `−1` give `lensMap 0 pos m 1 = 1 − 0 − 1/2 =
  1/2` by the junk value, so without the exclusion the position `1` would count as an image of the
  source `1/2`.

### D.2 Lens potential and time delay

Define `lensPotential ψ₀ pos m z = ψ₀ z + ∑ j, m j · log ‖z − pos j‖` and the time delay (Fermat
potential) of the source `w`, `timeDelay ψ₀ pos m w z = ‖z − w‖²/2 − lensPotential ψ₀ pos m z`
(Petters–Werner, §1.2, p. 2; their microlensing potential, p. 3, is the case of point masses with
a quadratic `ψ₀`). The sign is fixed so that the gradient of the time delay is the lens map minus
the source (1.1): images are its critical points. At a position, `Real.log 0 = 0` is a junk
value; no statement uses the time delay there.

**Checks.**
- One unit mass at `0`, source `0`, point `2`: the gradient of `‖z‖²/2 − log ‖z‖` at `2` is
  `2 − 1/2 = 3/2 = lensMap 0 pos m 2`. With the opposite sign, `‖z‖²/2 + log ‖z‖`, it is `5/2`,
  which is not the lens map.

### D.3 Jacobian, magnification and caustics

Define `lensJacobian ψ₀ pos m z` as the determinant of `fderiv ℝ (lensMap ψ₀ pos m) z`, the signed
magnification `magnification ψ₀ pos m z = (lensJacobian ψ₀ pos m z)⁻¹`, and `NonCaustic ψ₀ pos m w`:
no image of `w` has Jacobian `0`. Where the Jacobian vanishes the magnification has the junk value
`0`. Off the positions, for twice differentiable `ψ₀`, the derivative of the lens map is the
Hessian of the time delay, so a
minimum or a maximum of the time delay has positive Jacobian and a saddle negative Jacobian; the
signed magnification is Petters–Werner's `(−1)^{Ind} / |det Jac η|` (§1.2, p. 3), positive for
minima and maxima and negative for saddles.

**Checks.**
- One unit mass at `0`: the Jacobian is `1 − 1/|z|⁴` (1.2). At the images `2` and `−1/2` of the
  source `3/2` it is `15/16` and `−15`, the magnifications are `16/15` and `−1/15`; the outer
  image is a minimum of the time delay and the inner one a saddle.
- One mass `M > 0` at `a`: the Jacobian vanishes exactly on the Einstein ring `|z − a| = √M`,
  whose points are images of `a` only (2.2), so a source is non-caustic exactly when it is not
  `a`.

### D.4 The singular isothermal sphere

Define, for an Einstein radius `b`, `sisLensMap b z = z − b z/|z|`, the images
`sisImages b w` (the `z ≠ 0` with `sisLensMap b z = w`) and the signed magnification
`sisMagnification b z`, the inverse of the determinant of `fderiv ℝ (sisLensMap b) z`. At the
centre `z/|z|` has the junk value `0` and the lens map is `0`; the centre is not an image. Off the
centre `sisLensMap b − w` is the gradient of `‖z − w‖²/2 − b‖z‖`, the time delay of the potential
`b|z|` (Narayan–Bartelmann, §3.1, p. 18, for the lens equation, and §3.4, Table 2, p. 23,
where the potential of the singular isothermal sphere is proportional to `|θ|`).

**Checks.**
- Off the centre the Jacobian is `1 − b/|z|` (a computation in coordinates), so the critical
  curve is the circle `|z| = b`, which the map sends to `0`.
- With `b = 1` and the source `1/2` the images are `3/2` and `−1/2`, with magnifications `3`
  and `−1`; for the source `2` the only image is `3`, with magnification `3/2`. The point `0`
  satisfies `sisLensMap 1 0 = 0` by the junk value and is excluded from the images of `0`.

## Layer 1: Fermat's principle and the Jacobian

### 1.1 Fermat's principle

Prove `hasGradientAt_timeDelay`: if `ψ₀` is differentiable at `z` and `z` is none of the
positions, the time delay of the source `w` has gradient `lensMap ψ₀ pos m z − w` at `z`. So the
images of `w` are exactly the critical points of the time delay off the positions where `ψ₀` is
differentiable (Petters–Werner, §1.2, p. 3, Fermat's principle in the thin-lens setting).

Route: the gradient of `‖z − w‖²/2` is `z − w`; at `z ≠ p` the function `log ‖z − p‖` has
gradient `(z − p)/‖z − p‖² = 1/conj (z − p)`, by the chain rule for `Real.log` and the norm; the
gradient is linear.

**Checks.**
- Two masses `2/3` at `0` and `5/4` at `3/2 − i/3`, source `1/7 − 2i/5`: at the points
  `1/2 + 7i/5`, `−2 + i` and `3/7 − 3i` the coordinate gradient of the time delay agrees exactly
  with the lens map minus the source.
- The differentiability of `ψ₀` at `z` is needed: for `ψ₀ = |z|` (the isothermal sphere of
  D.4 with `b = 1`), no point masses and `w = 0`, the time delay `‖z‖²/2 − ‖z‖` is not
  differentiable at `0`, while `gradient ψ₀ 0` has the junk value `0`.

*Needs:* D.1, D.2; Mathlib `HasGradientAt`, `hasGradientAt_iff_hasFDerivAt`, `Real.log`.
(Proved here.)

### 1.2 The Jacobian of point masses

Prove `lensJacobian_pointMasses`: with no smooth part, at every `z` that is none of the positions,
`lensJacobian 0 pos m z = 1 − |∑ j, m j/(z − pos j)²|²`.

Route: with `f(z) = ∑ j, m j/(z − pos j)`, holomorphic off the positions, the lens map is
`z − conj (f z)` because the masses are real, and its real derivative is
`v ↦ v − conj (f' z) · conj v`. A real-linear map `v ↦ a v + b conj v` has determinant
`|a|² − |b|²`, and `f' z = −∑ j, m j/(z − pos j)²`.

**Checks.**
- For the two masses of the Check of 1.1, at the same three points, the determinant of the
  coordinate Jacobian equals the formula exactly, and the Jacobian matrix is symmetric, as the
  Hessian of the time delay must be.
- Equal masses `1/2` at `±1/2`: at `0` the sum is `(1/2)/(1/4) + (1/2)/(1/4) = 4` and the
  formula gives `1 − 16 = −15`.

*Needs:* D.1, D.3; Mathlib `fderiv`, `LinearMap.det`, `HasDerivAt.inv`. (Proved here.)

### Examples

The point mass at `0` with the source `3/2`; the two-mass configuration used in both Checks.

### Dependencies

Mathlib `HasGradientAt`, `hasGradientAt_iff_hasFDerivAt`, `Real.log`, `fderiv`,
`LinearMap.det`, `HasDerivAt.inv`; the design note D.1–D.3. No other layer.

## Layer 2: the point-mass lens and the singular isothermal sphere

Throughout this layer `u = |w − a|` for the point mass and `u = |w|` for the isothermal sphere.

### 2.1 Images of a point mass

Prove `pointLens_images`: for a single mass `M > 0` at `a` and a source `w ≠ a`, the images are
exactly the two points `a + (w − a)(u ± √(u² + 4M))/(2u)`. They are distinct, one outside and one
inside the Einstein ring (Narayan–Bartelmann, §2.1.5, equations (23) and (24), p. 10, with
`θ_E² = M`).

Route: an image `z` satisfies `z − a = M/conj (z − a) + (w − a)`. Writing `z − a = t e` with
`e = (w − a)/u`, the term `M/conj (z − a)` is a real multiple of `z − a`, so `z − a` is a real
multiple of `w − a`; then `t − M/t = u`, whose roots are `(u ± √(u² + 4M))/2`, of opposite signs.

**Checks.**
- `M = 1`, `a = 0`, `w = 3/2`: the formula gives `2` and `−1/2`, as in D.1.
- The hypothesis `w ≠ a` is needed: for `w = a` the formula divides by `u = 0`, and the images
  form a circle (2.2).

*Needs:* D.1. (Proved here.)

### 2.2 The Einstein ring

Prove `pointLens_images_self`: a single mass `M > 0` at `a` images the source `a` onto the circle
`|z − a| = √M` (Narayan–Bartelmann, §2.1.4, equation (20), p. 9).

Route: `z − a = M/conj (z − a)` means `|z − a|² = M` with `z ≠ a`.

**Checks.**
- `M = 4`, `a = 0`: the point `2i` is an image of `0`, since `2i − 4/conj (2i) = 2i − 4/(−2i) =
  2i − 2i = 0`.

*Needs:* D.1. (Proved here.)

### 2.3 Magnifications of a point mass

Prove `pointLens_magnification`: for `M > 0` and `w ≠ a`, the signed magnifications of the outer
and inner images of 2.1 are `1/2 + (u² + 2M)/(2u√(u² + 4M))` and
`1/2 − (u² + 2M)/(2u√(u² + 4M))`. Hence the signed magnifications add up to `1`, the inner one is
negative, and the total `|μ₊| + |μ₋|` is `(u² + 2M)/(u√(u² + 4M))` (Narayan–Bartelmann, §2.1.5,
equations (27) and (28), p. 11, in units with `M = 1`; the left-hand side `[1 − (θ_E/θ₋)⁴]⁻¹` of
equation (27) is the signed value, negative as the text after it says, while its right-hand side
`(u² + 2)/(2u√(u² + 4)) − 1/2` with the lower sign is `|μ₋|`).

Route: by 1.2 the Jacobian at an image `z` is `1 − M²/|z − a|⁴`; insert `|z − a| = |t|` with `t`
from 2.1 and use `t₊ t₋ = −M` and `t₊ − t₋ = √(u² + 4M)`.

**Checks.**
- `M = 1`, `u = 3/2`: the formulas give `1/2 + 17/30 = 16/15` and `1/2 − 17/30 = −1/15`, the
  values of D.3; they add up to `1` and the total is `17/15`.
- At `u = √M` (the source on the Einstein ring) the total is `3/√5`.
- The sign matters: `1/2 − 17/30` is negative, while `(17/30) − 1/2 = 1/15` is the absolute
  value only.

*Needs:* 1.2, 2.1, D.3. (Proved here.)

### 2.4 Images of the singular isothermal sphere

Prove `sis_images`: for `b > 0` and `w ≠ 0`, the images are `w + b w/|w|` and `w − b w/|w|`
when `|w| < b`, and `w + b w/|w|` alone when `|w| ≥ b`; the source `0` is imaged onto the circle
`|z| = b` (Narayan–Bartelmann, §3.1, equation (46) and the sentence after it, p. 18, in signed
one-dimensional coordinates).

Route: an image `z ≠ 0` satisfies `z (1 − b/|z|) = w`, so `z` is a real multiple `t w/|w|` with
`t − b · sign t = |w|`; for `t > 0` this is `t = |w| + b`, for `t < 0` it is `t = |w| − b`,
admissible exactly when `|w| < b`. For `w = 0` it is `|z| = b`.

**Checks.**
- `b = 1`, `w = 1/2`: the images are `3/2` and `−1/2`. For `w = 1` (on the circle `|w| = b`) the
  candidate `w − b w/|w| = 0` is the centre and is excluded, leaving the single image `2`.
- For `|w| > b` the point `w − b w/|w|` is not an image: with `b = 1`, `w = 2` it is `1`, which
  the lens map sends to `0`.

*Needs:* D.4. (Proved here.)

### 2.5 Magnifications of the singular isothermal sphere

Prove `sis_magnification`: for `b > 0` and `w ≠ 0`, the signed magnification of the image
`w + b w/|w|` is `1 + b/|w|`, and, when `|w| < b`, that of `w − b w/|w|` is `1 − b/|w|`
(Narayan–Bartelmann, §3.1, equation (47), p. 18). For `|w| < b` the two add up to `2` and their
absolute values to `2b/|w|`.

Route: off the centre the Jacobian is `1 − b/|z|` (radial factor `1`, tangential factor
`1 − b/|z|`); at the two images `|z| = |w| + b` and `|z| = b − |w|`.

**Checks.**
- `b = 1`, `w = 1/2`: `3` and `−1`, as in D.4. `b = 1`, `w = 2`: `3/2`.

*Needs:* 2.4, D.4; Mathlib `fderiv`, `LinearMap.det`. (Proved here.)

### Examples

The point mass with the source `3/2` and the Einstein ring of `M = 4`; the isothermal sphere with
`b = 1` and the sources `1/2`, `1` and `2`.

### Dependencies

Layer 1 (1.2); the design note D.1, D.3, D.4; Mathlib `fderiv`, `LinearMap.det`.

## Layer 3: winding numbers of planar maps

This layer is about arbitrary continuously differentiable maps `f : ℂ → ℂ`, not lenses. Its two
statements are the topological input of Layer 4: the index of a regular zero, and the argument
principle for maps that are not holomorphic (Sète–Luce–Liesen, Theorem 2.6, p. 6, states the
second for continuous maps inside a Jordan curve, with a proof by reference). They are stated for
continuously differentiable maps and circles because the winding number at the pins is the index
integral, which is the topological winding number for piecewise continuously differentiable
curves; continuous differentiability of `f` makes every composite `f ∘ circleMap` such a curve.

### 3.1 The index of a regular zero

Prove `windingNumber_eventually_eq_sign`: if `f` is continuously differentiable near `p`,
`f p = 0` and the Jacobian `det (fderiv ℝ f p)` is nonzero, then for every sufficiently small
`ε > 0` the winding number of `f ∘ circleMap p ε` on `[0, 2π]` about `0` is the sign of that
Jacobian, `+1` or `−1` (the case of `r(z) − conj z` with `r` rational of degree at least `2` is
Sète–Luce–Liesen, Proposition 2.7, p. 7, stated there without proof).

Route: write the derivative as `L v = a v + b conj v`, with `det L = |a|² − |b|² ≠ 0`, so that
`|L v| ≥ ||a| − |b|| · |v|`. By the definition of the derivative,
`|f(p + v) − L v| < ||a| − |b|| · |v|` for small `|v| = ε`, so the curves `f ∘ circleMap p ε` and
`L ∘ circleMap 0 ε` have the same winding number about `0` (Tau Ceti
`TauCeti.IsPiecewiseC1On.windingNumber_eq_of_dist_lt_dist`, the "dog on a leash" lemma; compare
Rouché's theorem in the form of Sète–Luce–Liesen, Theorem 2.3, p. 5). If `|a| > |b|`, the same
lemma compares `L` with `v ↦ a v`, whose winding number is `1`
(`TauCeti.Contour.windingNumber_const_mul`,
`TauCeti.Contour.windingNumber_circleMap_center_eq_one`).
If `|b| > |a|`, it compares `L` with `v ↦ b conj v`; the conjugate circle is the circle traversed
backwards, `conj (circleMap 0 ε t) = circleMap 0 ε (−t)`, whose winding number on `[0, 2π]` is
that of `circleMap 0 ε` on `[0, −2π]` (`TauCeti.Contour.windingNumber_comp_mul_add` with
`t ↦ −t`), which is `−1` (`TauCeti.Contour.windingNumber_circleMap_center`). The sign of the
Jacobian is `+1` exactly when `|a| > |b|`.

**Checks.**
- `f z = z` has Jacobian `1` and winding number `1`; `f z = conj z` has Jacobian `−1` and winding
  number `−1`; `f z = 2z + conj z` has Jacobian `4 − 1 = 3` and winding number `1`.
- The Jacobian hypothesis is needed: `f z = z²` vanishes at `0` with Jacobian `0`, and its winding
  number on every circle about `0` is `2`.
- The zero is needed: `f z = z + 1` has Jacobian `1` at `0` and winding number `0` on the circles
  of radius `ε < 1` about `0`.

*Needs:* Mathlib `HasFDerivAt.isLittleO`, `ContDiffAt`, `LinearMap.det`, `circleMap`; Tau Ceti
`TauCeti.IsPiecewiseC1On.windingNumber_eq_of_dist_lt_dist`,
`TauCeti.Contour.windingNumber_const_mul`, `TauCeti.Contour.windingNumber_circleMap_center_eq_one`,
`TauCeti.Contour.windingNumber_circleMap_center`, `TauCeti.Contour.windingNumber_comp_mul_add`.
(Proved here.)

### 3.2 The argument principle for continuously differentiable maps

Prove `windingNumber_circle_eq_sum`. Let `R > 0`, `ε > 0`, let `S` be a finite set of points
whose closed `ε`-discs are pairwise disjoint and lie in the open disc `|z − c| < R`, and let `f` be
continuously differentiable on an open set `U` that contains every point `x` of the closed disc
`|x − c| ≤ R` at distance at least `ε` from all points of `S`, with `f x ≠ 0` at all such `x`.
Then the winding number of `f ∘ circleMap c R` about `0` is the sum over `p ∈ S` of the winding
numbers of `f ∘ circleMap p ε` (Sète–Luce–Liesen, Theorem 2.6, p. 6, for continuous maps and a
Jordan curve, with the exceptional points inside; here the curves are circles and `f` is
continuously differentiable).

Route. Write `γ = circleMap c R` and `γ_p = circleMap p ε` on `[0, 2π]`, `D_p` for the closed
disc `|x − p| ≤ ε`, and `K` for the compact set `{x : |x − c| ≤ R, |x − p| ≥ ε for all p ∈ S}`.
A point of the circle `γ_p` is at distance at least `ε` from every other point of `S`, since the
closed discs are disjoint, and a point of `γ` is at distance more than `ε` from every point of
`S`, since `D_p` lies in the open disc; so all these circles lie in `K`, the composites `f ∘ γ`
and `f ∘ γ_p` are closed continuously differentiable curves avoiding `0`, and their winding
numbers `N` and `N_p` about `0` are integers
(`TauCeti.IsPiecewiseC1On.exists_int_windingNumber`).
1. *Removing the winding about the points of `S`.* For `p ∈ S` let `u_p(z) = (z − p)/|z − p|`,
   smooth off `p`, and put `F = f · ∏_{p ∈ S} u_p^(−N_p)`, continuously differentiable and
   zero-free on a neighbourhood of `K` (no point of `S` lies in `K`, as `ε > 0`). For closed
   continuously differentiable curves `g`, `h` avoiding `0` the winding number of the pointwise
   product `g h` about `0` is the sum of those of `g` and `h`, and that of `g^k`, `k ∈ ℤ`, is `k`
   times that of `g`: by `TauCeti.Contour.windingNumber_eq_integral_of_avoidance` each is
   `(2πi)⁻¹ ∫ g'/g`, and `(g h)'/(g h) = g'/g + h'/h`. For a closed curve `η` avoiding `p` the
   winding number of `u_p ∘ η` about `0` is that of `η` about `p`: the segment from `η(t) − p` to
   `u_p(η(t))` lies on an open ray from `0`
   (`TauCeti.IsPiecewiseC1On.windingNumber_eq_of_notMem_segment`,
   `TauCeti.Contour.windingNumber_translate`). The circle `γ` winds once about every `p ∈ S`,
   since `|p − c| < R` (`TauCeti.Contour.windingNumber_circleMap_eq_one_of_dist_lt`); `γ_q` winds
   once about `q` (`TauCeti.Contour.windingNumber_circleMap_center_eq_one`) and not at all about
   `p ≠ q` in `S`, since `|p − q| > 2ε`
   (`TauCeti.Contour.windingNumber_circleMap_eq_zero_of_lt_dist`).
   Hence `F ∘ γ_q` has winding number `N_q − N_q = 0` for every `q ∈ S`, and `F ∘ γ` has winding
   number `N − ∑_{p ∈ S} N_p`.
2. *Filling the holes.* Fix `q ∈ S` and let `Φ = F ∘ γ_q`, a `2π`-periodic continuously
   differentiable curve avoiding `0`. Put `L(t) = ℓ + ∫_0^t Φ'/Φ` with `exp ℓ = Φ(0)`
   (`Complex.exp_log`). The derivative of `Φ · exp(−L)` vanishes, so `exp L = Φ`; and
   `L(2π) − L(0)` is `2πi` times the winding number of `Φ`, which is `0` by step 1
   (`TauCeti.Contour.windingNumber_eq_integral_of_avoidance`), so `L` is `2π`-periodic. On `D_q`
   define `G(q + r e^(it)) = exp((r/ε) L(t))` for `0 ≤ r ≤ ε`: by periodicity this depends only on
   the point, it is `1` at `q`, it is continuous on `D_q` (off `q` because `L` is continuous and
   periodic, at `q` because `L` is bounded), and on the circle `|x − q| = ε` it equals `F`. Put
   `G = F` on `K`. The sets `K` and `D_q`, `q ∈ S`, are finitely many closed sets covering the
   closed disc `|x − c| ≤ R`, pairwise meeting only along the circles `|x − q| = ε`, so `G` is
   continuous and zero-free on that disc.
3. *The outer circle.* The straight-line homotopy `(s, t) ↦ (1 − s) γ(t) + s γ(0)` stays in the
   closed disc, which is convex, and fixes the endpoints `γ(0) = γ(2π)`. Composed with `G` it is a
   homotopy through `ℂ ∖ {0}`, with fixed endpoints, from `G ∘ γ = F ∘ γ` to a constant path.
   `TauCeti.Contour.windingNumber_eq_of_pathHomotopy` takes two paths on `[0, 1]` with the same
   endpoints, each piecewise continuously differentiable, and any continuous fixed-endpoint
   homotopy between them that avoids the point: here the loop `t ↦ F(γ(2πt))`, which is
   continuously differentiable, and the constant path at `F(γ(0))`, joined by
   `(s, t) ↦ G((1 − s) γ(2πt) + s γ(0))`. The extension of the first path to `ℝ` agrees with
   `t ↦ F(γ(2πt))` on `(0, 1)`, so the two have the same winding number on `[0, 1]`
   (`TauCeti.Contour.windingNumber_congr_curve`), which is that of `F ∘ γ` on `[0, 2π]`
   (`TauCeti.Contour.windingNumber_comp_mul_add`); the constant path has winding number `0`
   (`TauCeti.Contour.windingNumber_const`). So the winding number of `F ∘ γ` is `0`, and with
   step 1, `N = ∑_{p ∈ S} N_p`.

**Checks.**
- `S` empty: a continuously differentiable zero-free map of the closed disc has winding number
  `0` on its boundary.
- `f z = (z − p)(z − q)` with `c = 0`, `R = 10`, `S = {p, q}`, `p = 0`, `q = 4`, `ε = 1`: the
  outer winding number is `2` and each small one is `1`.
- Disjointness is needed: the same `f` with `q = 1` and `ε = 2` has outer winding number `2`,
  while each of the two small circles encloses both zeros, so the sum is `4`.
- The radius condition is needed: with `R = −1`, `S` empty and `f z = z − c`, the disc is empty,
  so the hypotheses hold, while `circleMap c (−1)` winds once about `c` and the outer winding
  number is `1`.
- The positivity of `ε` is needed: with `ε = −1`, `S = {c + 10}`, `R = 1` and `f z = z − c − 10`,
  the small closed discs are empty and all hypotheses hold, while the outer winding number is `0`
  and the circle `circleMap (c + 10) (−1)` contributes `1`.
- The containment of the small discs is needed: with `S = {c + 20}`, `R = 10`, `ε = 1` and
  `f z = z − c − 20`, the outer winding number is `0` and the small one is `1`.

*Needs:* Mathlib `circleMap`, `Complex.exp_log`, `intervalIntegral.integral_eq_sub_of_hasDerivAt`;
Tau Ceti `TauCeti.IsPiecewiseC1On.exists_int_windingNumber`,
`TauCeti.Contour.windingNumber_eq_integral_of_avoidance`,
`TauCeti.IsPiecewiseC1On.windingNumber_eq_of_notMem_segment`,
`TauCeti.Contour.windingNumber_translate`,
`TauCeti.Contour.windingNumber_circleMap_eq_one_of_dist_lt`,
`TauCeti.Contour.windingNumber_circleMap_eq_zero_of_lt_dist`,
`TauCeti.Contour.windingNumber_circleMap_center_eq_one`,
`TauCeti.Contour.windingNumber_eq_of_pathHomotopy`, `TauCeti.Contour.windingNumber_congr_curve`,
`TauCeti.Contour.windingNumber_comp_mul_add`, `TauCeti.Contour.windingNumber_const`. (Proved
here.)

### Examples

Linear and antilinear maps; `z²`; a quadratic polynomial with two zeros in a large disc.

### Dependencies

Mathlib `HasFDerivAt.isLittleO`, `ContDiffAt`, `LinearMap.det`, `circleMap`, `Complex.exp_log`,
`intervalIntegral.integral_eq_sub_of_hasDerivAt`; Tau Ceti `TauCeti.Contour.windingNumber` and the
lemmas named in 3.1 and 3.2. No other layer.

## Layer 4: counting images

### 4.1 The counting formula and the odd-number theorem

Prove `image_count`. Let `ψ₀` be twice continuously differentiable, the positions distinct and
all masses nonzero. Assume that the lens is subcritical at infinity, that is, for some `R` the
derivative of the lens map is positive definite at every `z` with `|z| ≥ R`, and that the time
delay of `w` tends to `+∞` at infinity (together, Petters–Werner's "isolated", §1.2, pp. 3–4),
and that `w` is non-caustic. Then:

- the images of `w` form a finite set;
- writing `N₊` and `N₋` for the numbers of images with positive and negative Jacobian,
  `N₋ = N₊ + n − 1`, so the number of images is `N = 2N₊ + n − 1`;
- if all masses are positive, `N₊ ≥ 1`.

For `n = 0` this is the odd-number theorem, `N = 2N₊ − 1` (Petters–Werner, Theorem 1, parts 1
and 2, p. 4, stated there for a generic time delay function of a lens whose singularities are
infinite, and Corollary 1, p. 5, attributed there to Burke). Here the singular part consists of
point masses, no genericity is assumed beyond the non-caustic source, and the masses in the
counting formula may have either sign (for a negative mass the potential tends to `+∞` at the
position, which is not an infinite singularity in Petters–Werner's sense); the index count of
Luce–Sète–Liesen (Step 1 of the proof of Theorem 1.1, p. 5) likewise uses no sign of the masses.
The hypothesis on `ψ₀` makes the lens map continuously differentiable with derivative the
Hessian of the time delay, which the route uses.

Route.
1. *Outward on large circles.* For `|z| ≥ R` the positions are inside the disc of radius `R`
   (at a position the derivative has the junk value `0`, which is not positive definite). For a
   unit vector `e`, the function `t ↦ timeDelay ψ₀ pos m w (t e)` on `[R, ∞)` has second
   derivative `inner ℝ (fderiv ℝ (lensMap ψ₀ pos m) (t e) e) e > 0` and tends to `+∞`, so its
   derivative `inner ℝ (lensMap ψ₀ pos m (t e) − w) e` (1.1) is increasing and eventually
   positive. By continuity in `e` and compactness of the unit circle there is `R₁ ≥ R` with
   `inner ℝ (lensMap ψ₀ pos m z − w) z > 0` for `|z| ≥ R₁`.
2. *Finiteness.* By step 1 every image lies in the disc `|z| < R₁`. Near a position `pos j` the
   term `m j/conj (z − pos j)` is unbounded and the rest of the lens map is bounded, so images
   stay a positive distance from the positions. The images thus form a compact set; at each the
   Jacobian is nonzero, so by the inverse function theorem
   (`HasStrictFDerivAt.toOpenPartialHomeomorph`) each is isolated, and the set is finite.
3. *The outer winding number.* On the circle of radius `R₁` about `0`, the straight-line
   homotopy between `z` and `lensMap ψ₀ pos m z − w` avoids `0`, since by step 1 every point of
   it has positive inner product with `z`. So `lensMap ψ₀ pos m − w` has winding number `1` there
   (`TauCeti.IsPiecewiseC1On.windingNumber_eq_of_notMem_segment`,
   `TauCeti.Contour.windingNumber_circleMap_center_eq_one`).
4. *Local indices.* Apply 3.2 to `f = lensMap ψ₀ pos m − w`, continuously differentiable on the
   open set `U` of points that are none of the positions, with `c = 0`, `R = R₁`, `S` the images
   and the positions (all in the open disc `|z| < R₁`) and `ε` so small that the closed
   `ε`-discs about them are disjoint and lie in that disc. The zeros of `f` in `U` are exactly the
   images, so `f` has no zero on the set `K` of 3.2, which lies in `U`. At an image the winding
   number on a small circle is the sign of the Jacobian (3.1, for `ε` small). At a position
   `pos j`, on the circle `|z − pos j| = ε` the term `−m j/conj (z − pos j) = −(m j/ε²)(z − pos j)`
   has modulus `|m j|/ε`, larger than the remainder of `f`, which is bounded near `pos j`, for
   `ε` small; so by the dog-on-a-leash lemma the winding number there is that of a nonzero
   multiple of the circle about its centre, `1` (`TauCeti.Contour.windingNumber_const_mul`,
   `TauCeti.Contour.windingNumber_circleMap_center_eq_one`). By step 3 and 3.2,
   `1 = N₊ − N₋ + n`.
5. *A minimum, for positive masses.* On the complement of the positions the time delay is
   continuous and tends to `+∞` at infinity and, as all `m j > 0`, at each position (there
   `−m j log |z − pos j| → +∞`), so it attains a minimum at some `z₀` off the positions. Its
   gradient vanishes there (`IsLocalMin.hasFDerivAt_eq_zero`), so `z₀` is an image by 1.1.
   Along every line through `z₀` the second derivative of the time delay at `z₀` is `≥ 0`
   (`taylor_mean_remainder_lagrange`); the derivative of the lens map at `z₀` is symmetric
   (`second_derivative_symmetric`), positive semidefinite and invertible, hence positive
   definite, and `N₊ ≥ 1`.

**Checks.**
- Equal masses `1/2` at `±1/2`, source `0`: the images are `0`, `±√5/2` (Jacobians `−15`, `−5/4`)
  and `±i√3/2` (Jacobian `3/4`), so `N₋ = 3 = 2 + 2 − 1` and `N = 5`. Masses `1/2` at `±2`,
  source `0`: images `0` (Jacobian `15/16`) and `±√5` (Jacobian `−80`), so `N₋ = 2`, `N₊ = 1`.
  (For `w = 0` the lens equation splits into `(|z|² − a² − 1) Re z = 0` and
  `(|z|² + a² − 1) Im z = 0` with `a` the half-separation, which gives exactly these points.)
- No point masses, `ψ₀ = log (1 + |z|²)` (the Plummer lens of Petters–Werner, p. 5, with
  `κ₀ = 2` and `γ = 0`): the source `1/10` has three images on the real axis, the roots of
  `θ³ − θ²/10 − θ − 1/10` (signs `−, +, −, +` at `−1, −1/2, 0, 2`). It is non-caustic: the
  caustics are `0` and the circle of radius `(√5 − 1)/2 · √(√5 − 2)`.
- The non-caustic hypothesis is needed: for the same lens the source `0` has the images `0` and
  every point of the unit circle, where the Jacobian vanishes.
- Subcriticality at infinity is needed: for `ψ₀(x + iy) = 2(x sin x + cos x)`, no point masses
  and `w = 0`, the time delay is `y²/2 + g(x)` with `g(x) = x²/2 − 2(x sin x + cos x)`, which
  tends to `+∞`. Its critical points are `x = 0` and the `x` with `cos x = 1/2`, where
  `g'' (x) = 2x sin x ≠ 0` (and `g'' (0) = −1`), so the source is non-caustic and has infinitely
  many images.
- The behaviour at infinity is needed: for `ψ₀(x + iy) = (x² + y²)/2 − eˣ − y²`, no point masses
  and `w = 0`, the time delay is `eˣ + y²`, whose Hessian `diag(eˣ, 2)` is positive definite
  everywhere, but which does not tend to `+∞`; its gradient `(eˣ, 2y)` never vanishes, so there
  is no image and `N₋ = N₊ − 1` fails.
- Distinct positions are needed: two unit masses at `0` act as one mass `2`; the source `1` has
  the two images `2` and `−1` (Jacobians `3/4` and `−3`), while `N₋ = N₊ + 1` would be required.
- Positive masses are needed for `N₊ ≥ 1`: a mass `−1` at `0` and the source `1` give the
  equation `t + 1/t = 1` for an image `t > 0` on the ray through `1` (and no image off it), which
  has no root, so there is no image at all; the counting formula holds, `0 = 0 + 1 − 1`. With the
  same lens and the source `3` the images are `(3 ± √5)/2`, with Jacobians of opposite signs
  (`1 − 1/t⁴`), so `N₋ = N₊ = 1`.

*Needs:* 1.1, D.1–D.3, 3.1, 3.2; Mathlib `HasStrictFDerivAt.toOpenPartialHomeomorph`,
`IsCompact.exists_isMinOn`, `IsLocalMin.hasFDerivAt_eq_zero`, `taylor_mean_remainder_lagrange`,
`second_derivative_symmetric`, `Filter.cocompact`; Tau Ceti
`TauCeti.IsPiecewiseC1On.windingNumber_eq_of_dist_lt_dist`,
`TauCeti.IsPiecewiseC1On.windingNumber_eq_of_notMem_segment`,
`TauCeti.Contour.windingNumber_const_mul`, `TauCeti.Contour.windingNumber_circleMap_center_eq_one`.
(Proved here; for positive masses this is the case of the cited theorem and corollary for this
class of lenses, without their genericity assumption.)

### 4.2 Witt's bound

Prove `pointMasses_images_ncard_le`: for `n ≥ 2` point masses of nonzero mass at distinct
positions and no smooth part, every source has finitely many images, at most `n² + 1` of them
(stated in Petters–Werner, §2.2, p. 6, and attributed there to Witt).

Route. With `B(z) = ∏ j (z − pos j)` and `A = conj w · B + ∑ j m j ∏_{k ≠ j} (z − pos k)`, an image
`z` satisfies `conj z = r(z)` with `r = A/B`; the polynomials `A` and `B` are coprime because
`A(pos j) = m j ∏_{k ≠ j} (pos j − pos k) ≠ 0`, so `r` has exactly the `n` simple poles
`pos j`. Let `A*`, `B*` have the conjugate coefficients and put
`P = ∑ i a*ᵢ Aⁱ Bⁿ⁻ⁱ`, `Q = ∑ i b*ᵢ Aⁱ Bⁿ⁻ⁱ` (degree at most `n²`). Conjugating `conj z = r(z)`
gives `z = A*(conj z)/B*(conj z)`, hence `P(z) = z Q(z)` at every image, as
`P = Bⁿ · A*(r)` and `Q = Bⁿ · B*(r)` off the positions. The polynomial `H = P − z Q` has degree at
most `n² + 1`; it remains to see `H ≠ 0`. `Q ≠ 0`, since otherwise the continuous map `r` would
take values in the finite zero set of `B*` on the connected complement of the positions, and
would be constant. If `H = 0`, then `r*(r(z)) = z` for `z` off the finite zero set `F` of `B Q`,
with `r*` the conjugate rational function, so `r` is injective off `F`. But each `c` outside a
finite set has `n ≥ 2` distinct preimages under `r` off `F`: for `c ≠ conj w` the polynomial
`A − c B` has leading coefficient `conj w − c` and degree `n`; its roots are not poles (there `A`
would vanish too) and are the preimages of `c`; a double root is a zero of `A′B − AB′`, which is
a nonzero polynomial as `r` is not constant, so it occurs only for the finitely many `c` that are
values of `r` at those zeros; and a root lies in `F` only if `c ∈ r(F)`. This contradicts
injectivity. So the images are among the at most `n² + 1` roots of
`H` (`Polynomial.card_roots'`).

**Checks.**
- The bound is attained for `n = 2`: the configuration with masses `1/2` at `±1/2` and source `0`
  of 4.1 has five images, and there `H` has degree exactly `5`.
- `n ≥ 2` is needed: one mass has the Einstein ring as the images of its own position.
- Distinct positions are needed: two unit masses at `0` image the source `0` onto the circle
  `|z| = √2`.
- Nonzero masses are needed: masses `1` and `0` at `0` and `5` image the source `0` onto the unit
  circle.

*Needs:* D.1; Mathlib `Polynomial.card_roots'`, `Polynomial.roots`. (Proved here.)

### 4.3 Point-mass lenses

Prove `pointMasses_images_lower`: for `n` point masses of nonzero mass at distinct positions,
no smooth part and a non-caustic source, the images are finite and their number has the parity
of `n + 1`; if all masses are positive, there are at least `n + 1` images (Petters–Werner,
Theorem 1, parts 1 and 2, p. 4, and the application to microlensing that follows it, p. 4; §2.2,
inequality (2), p. 6; for masses of either sign the parity is wider than these sources).

Route: the two hypotheses of 4.1 on the lens hold for point masses alone. By the computation of
1.2 the derivative of `pointDeflection pos m` at `z` is `v ↦ −B conj v` with
`|B| ≤ ∑ j |m j|/|z − pos j|²`, which tends to `0`, so `inner ℝ (v + B conj v) v ≥ (1 − |B|)|v|²`
is positive for large `|z|` and `v ≠ 0`; and `‖z − w‖²/2` dominates `∑ j m j log ‖z − pos j‖` at
infinity. Then 4.1 gives `N = 2N₊ + n − 1`, and `N₊ ≥ 1` for positive masses.

**Checks.**
- `n = 0`: the lens map is the identity and the only image of `w` is `w`; `N = 1`.
- `n = 1` with a positive mass: the non-caustic sources are those other than the position, and
  they have two images (2.1). With the mass `−1` the sources `1` and `3` have no image and two
  images (the last Check of 4.1), both of the parity of `2`.
- `n = 2`: together with 4.2, `3 ≤ N ≤ 5` and `N` is odd, so `N` is `3` or `5`; both occur in the
  Checks of 4.1 (Petters–Werner, §2.2, p. 6, attributed there to Schneider and Weiss).
- Distinct positions are needed for the parity and positive masses for the lower bound, by the
  last two Checks of 4.1 (two unit masses at `0` give two images of the source `1`; a mass `−1`
  gives none).

*Needs:* 4.1, 1.2, D.1–D.3. (Proved here.)

### Examples

The binary lenses with five and three images; the Plummer lens; the two lenses showing that the
hypotheses at infinity are needed.

### Dependencies

Layer 1 (1.1, 1.2), Layer 3 (3.1, 3.2), the design note; Mathlib
`HasStrictFDerivAt.toOpenPartialHomeomorph`, `IsCompact.exists_isMinOn`,
`IsLocalMin.hasFDerivAt_eq_zero`, `taylor_mean_remainder_lagrange`,
`second_derivative_symmetric`, `Filter.cocompact`, `Polynomial.card_roots'`; Tau Ceti
`TauCeti.IsPiecewiseC1On.windingNumber_eq_of_dist_lt_dist`,
`TauCeti.IsPiecewiseC1On.windingNumber_eq_of_notMem_segment`,
`TauCeti.Contour.windingNumber_const_mul`, `TauCeti.Contour.windingNumber_circleMap_center_eq_one`.
Layer 2 is not used.

## Scope and ownership

This roadmap owns the lens map of a smooth potential with point masses and of the singular
isothermal sphere, their images, time delays, Jacobians and signed magnifications (the design
note); Fermat's principle and the Jacobian of point masses (Layer 1); the images and
magnifications of the point mass and the isothermal sphere (Layer 2); the index of a regular zero
and the argument principle for continuously differentiable maps of the plane (Layer 3); the
counting formula with the odd-number theorem, Witt's bound and the lower bound and parity for
point masses (Layer 4).

Already in the libraries and therefore not targets: winding numbers of piecewise continuously
differentiable curves with their proximity, homotopy, scaling and circle lemmas
(`TauCeti/Analysis/Contour/Winding/`), and the argument principle for analytic functions
(`TauCeti/Analysis/Complex/Conformal/ArgumentPrinciple.lean`); Layer 3 is the analogue for maps
that are not holomorphic, which the lens maps are not. Tau Ceti also has the degree of a loop in
the unit circle, with its homotopy invariance and additivity under products (`Circle.degree`,
`TauCeti/Topology/Circle/Degree.lean`), and the signed count of the preimages of a value under a
map between oriented manifolds of equal dimension (`TauCeti.degreeAtRegularValue`,
`TauCeti/Geometry/Manifold/Degree/Basic.lean`); Layer 3 is stated with the index-integral winding
number of maps on a disc with holes, which is neither, and does not use them.

Neighbouring roadmaps. DifferentialGeometry, Layer 10, plans the Brouwer mapping degree of smooth
maps between compact connected oriented manifolds without boundary, and MorseNovikov, 7.1 and 7.3,
the vector-field Poincaré–Hopf theorem on compact manifolds without boundary, with the local
index `sgn det` of a nondegenerate zero. Layers 3 and 4 here work in the plane, on a disc with
holes and with point-mass poles, and do not depend on either. PlanarTopology, Layer 1, defines an
integer winding number of polygonal loops by a signed ray-crossing count; Layer 3 uses Tau Ceti's
index-integral winding number instead and does not depend on it.

Not treated here:

- The bound of Khavinson and Neumann: for a rational function `r` of degree `n ≥ 2` the equation
  `conj z = r(z)` has at most `5n − 5` solutions, so `n ≥ 2` point masses without shear produce
  at most `5n − 5` images. Its proof uses a fact of complex dynamics (their Fact 1, taken from
  Carleson and Gamelin): an attracting or rationally neutral fixed point of a rational map of
  degree at least two attracts a critical point. Neither pinned library contains that fact.
- The configurations of Rhie attaining `5n − 5` images, and the invariant of Witt and Mao (the
  signed magnifications of the five images of two point masses add up to `1`).
- External shear in Witt's bound, lenses on several planes, the counts of minima, saddles and
  maxima separately, stochastic lensing and the local theory of caustics.
- Deriving the lens equation from general relativity: the lens map is the starting definition.

## Exact supplier contracts

### From Mathlib

- `Mathlib/Analysis/Calculus/Gradient/Basic.lean`: `gradient` (the vector representing the
  derivative of a real function through the inner product), `HasGradientAt`,
  `hasGradientAt_iff_hasFDerivAt`.
- `Mathlib/Analysis/Calculus/FDeriv/Defs.lean`: `fderiv`, `HasFDerivAt.isLittleO` (the
  derivative approximates the map to first order); `Mathlib/Analysis/Calculus/ContDiff/Defs.lean`:
  `ContDiff`, `ContDiffAt`, `ContDiffOn`.
- `Mathlib/LinearAlgebra/Determinant.lean`: `LinearMap.det`.
- `Mathlib/Analysis/Calculus/Deriv/Inv.lean`: `HasDerivAt.inv`.
- `Mathlib/Analysis/Calculus/InverseFunctionTheorem/FDeriv.lean`:
  `HasStrictFDerivAt.toOpenPartialHomeomorph` (a map with invertible strict derivative is a local
  homeomorphism, so its fibre near the point is a single point).
- `Mathlib/Analysis/Calculus/FDeriv/Symmetric.lean`: `second_derivative_symmetric` (the second
  derivative of a twice differentiable function is symmetric).
- `Mathlib/Analysis/Calculus/LocalExtr/Basic.lean`: `IsLocalMin.hasFDerivAt_eq_zero` (the
  derivative vanishes at a local minimum).
- `Mathlib/Analysis/Calculus/Taylor.lean`: `taylor_mean_remainder_lagrange`.
- `Mathlib/Topology/Order/Compact.lean`: `IsCompact.exists_isMinOn` (a continuous function
  on a nonempty compact set attains its minimum).
- `Mathlib/Analysis/SpecialFunctions/Complex/Log.lean`: `Complex.exp_log` (`exp (log x) = x` for
  `x ≠ 0`); `Mathlib/MeasureTheory/Integral/IntervalIntegral/FundThmCalculus.lean`:
  `intervalIntegral.integral_eq_sub_of_hasDerivAt` (the fundamental theorem of calculus).
- `Mathlib/Topology/Defs/Filter.lean`: `Filter.cocompact` (the filter of complements of compact
  sets).
- `Mathlib/Analysis/SpecialFunctions/Complex/CircleMap.lean`: `circleMap`.
- `Mathlib/Algebra/Polynomial/Roots.lean`: `Polynomial.roots`, `Polynomial.card_roots'` (a
  polynomial has at most its degree many roots).
- `Mathlib/Data/Set/Card.lean`: `Set.ncard`.

### From Tau Ceti

- `TauCeti/Analysis/Contour/Winding/Number/Basic.lean`: `TauCeti.Contour.windingNumber` (the
  index integral, junk when its principal value does not exist),
  `TauCeti.Contour.windingNumber_const` (a constant curve has winding number `0`),
  `TauCeti.Contour.windingNumber_congr_curve` (curves agreeing on the open interval have the same
  winding number),
  `TauCeti.Contour.windingNumber_eq_integral_of_avoidance` (for a continuous curve avoiding the
  point, with integrable integrand, it is the ordinary index integral `(2πi)⁻¹ ∫ γ'/(γ − z₀)`).
- `TauCeti/Analysis/Contour/Winding/Number/Circle.lean`:
  `TauCeti.Contour.windingNumber_circleMap_center_eq_one` (the circle `circleMap c R`, `R ≠ 0`,
  winds once about `c` on `[0, 2π]`), `TauCeti.Contour.windingNumber_circleMap_center` (on `[a, b]`
  it winds `(b − a)/2π` times), `TauCeti.Contour.windingNumber_circleMap_eq_one_of_dist_lt` and
  `TauCeti.Contour.windingNumber_circleMap_eq_zero_of_lt_dist` (it winds once about a point inside
  and not at all about a point outside).
- `TauCeti/Analysis/Contour/Winding/Proximity.lean`:
  `TauCeti.IsPiecewiseC1On.windingNumber_eq_of_dist_lt_dist` (two closed piecewise continuously
  differentiable curves closer to each other than the first is to `w` have the same winding
  number about `w`), `TauCeti.IsPiecewiseC1On.windingNumber_eq_of_notMem_segment` (the same when
  `w` lies on no segment joining corresponding points).
- `TauCeti/Analysis/Contour/Winding/Integer.lean`:
  `TauCeti.IsPiecewiseC1On.exists_int_windingNumber` (a closed piecewise continuously
  differentiable curve avoiding `w` has an integer winding number about `w`).
- `TauCeti/Analysis/Contour/Winding/Number/Homotopy.lean`:
  `TauCeti.Contour.windingNumber_eq_of_pathHomotopy` (two piecewise continuously differentiable
  paths joined by a continuous homotopy with fixed endpoints that avoids `w` have the same winding
  number about `w`).
- `TauCeti/Analysis/Contour/Winding/Number/Translate.lean`:
  `TauCeti.Contour.windingNumber_translate` (translating the curve and the point together keeps
  the winding number).
- `TauCeti/Analysis/Contour/Winding/Number/Scale.lean`: `TauCeti.Contour.windingNumber_const_mul`
  (multiplying the curve and the point by `c ≠ 0` keeps the winding number);
  `TauCeti/Analysis/Contour/Winding/Number/Reparam.lean`:
  `TauCeti.Contour.windingNumber_comp_mul_add` (affine reparametrisation).

## References

- A. O. Petters and M. C. Werner, *Mathematics of gravitational lensing: multiple imaging and
  magnification*, arXiv:0912.0490v1 (2009). Section, theorem, corollary and page numbers above are
  those of this version.
- R. Narayan and M. Bartelmann, *Lectures on gravitational lensing*, arXiv:astro-ph/9606001v2
  (1997). Section, equation and page numbers above are those of this version.
- O. Sète, R. Luce and J. Liesen, *Perturbing rational harmonic functions by poles*,
  arXiv:1403.0906v2 (2014): Theorem 2.3 (Rouché's theorem), Theorem 2.6 (the argument principle for
  continuous functions, stated with a proof by reference), Proposition 2.7.
- D. Khavinson and G. Neumann, *On the number of zeros of certain rational harmonic functions*,
  arXiv:math/0401188v2 (2004): Theorem 1 and Corollary 1 (the `5n − 5` bound, not treated here);
  its proof uses Fact 1, attributed there to Carleson and Gamelin.
- R. Luce, O. Sète and J. Liesen, *A note on the maximum number of zeros of r(z) − z̄*,
  arXiv:1410.0134v2 (2014): Step 1 of the proof of Theorem 1.1, p. 5, the index count for rational
  harmonic functions of the lens form, which is the point-mass case of 4.1 in other notation.
- Attributions made in prose without a locator, as given in Petters–Werner: Burke (the
  odd-number theorem), Witt (the bound `n² + 1`), Schneider and Weiss (two point masses give three
  or five images).
