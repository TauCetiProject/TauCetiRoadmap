# Roadmap: illumination and covering of convex bodies by smaller homothets

**Summary.** A convex body is a nonempty compact convex set with nonempty interior in a real
normed space (such a space is then finite-dimensional, of dimension `d`). Hadwiger's covering
problem asks for the least number of smaller positive homothets of a body `K`, images
`c + t(K − c)` with `0 < t < 1`, whose union contains `K`; Boltyanski's illumination problem asks
for the least number of directions such that every boundary point `x` has, for one of them `u`,
a point `x + s u` with `s > 0` in the interior of `K`. This roadmap defines both notions and the
covering number, and builds their classical theory in every dimension.

The headline theorems are these.

- **Boltyanski's equivalence.** For a convex body and `m ≥ 1`, `K` is covered by `m` smaller
  homothets exactly when it is covered by `m` translates of one smaller homothet, exactly when it
  is covered by `m` translates of its interior, and exactly when `m` directions illuminate it.
- **The bounds.** The covering number of a convex body is attained and is at least `d + 1`; a
  parallelepiped needs exactly `2^d`; a body with a unique supporting hyperplane at every boundary
  point needs exactly `d + 1`.
- **Levi's theorem.** In the plane a convex body has covering number `4` if it is a parallelogram
  and `3` otherwise.
- **Semicontinuity.** A covering of a convex body by `m` smaller homothets persists under small
  perturbations in the Hausdorff metric; within every Hausdorff distance of the cube there are
  bodies with covering number `d + 1`, so the covering number is not lower semicontinuous for
  `d ≥ 2`.

Two tools from the study of the three-dimensional problem are stated in every dimension: the
directions `±w` illuminate exactly the boundary points whose projection along `w` is interior to
the projection of `K`, and a curve that is short in the norm of the difference body `K − K` lies
in one smaller homothet and is illuminated by one direction.

The roadmap rests on Mathlib's convex bodies and their Hausdorff metric, separation theorems,
Helly's theorem, the Krein–Milman lemma on extreme points, gauges and parallelepipeds, and on a
gauge lemma and a lemma on symmetric convex sets of Tau Ceti. Layer 1 holds the definitions, the
illumination criterion by supporting functionals, Boltyanski's equivalence and the reduction to
extreme points; Layer 2 the bounds; Layer 3 the plane; Layer 4 the two tools; Layer 5 continuity.

## Conventions

- **Ambient space.** `E` is a real normed space (`NormedAddCommGroup E`, `NormedSpace ℝ E`) with
  no finite-dimensionality hypothesis. A compact set with nonempty interior contains a closed
  ball, so `E` is finite-dimensional by Mathlib's `FiniteDimensional.of_isCompact_closedBall₀`;
  every route about a convex body obtains the instance this way, and `d` is `finrank ℝ E`. The
  criterion 1.1 holds in every real normed space. Target 5.2 works in `EuclideanSpace ℝ (Fin d)`.
- **Bodies.** `K : ConvexBody E` (Mathlib: nonempty, compact, convex) with the separate
  hypothesis `(interior (K : Set E)).Nonempty`. The definitions are on `Set E`.
- **Homothets.** A smaller homothet of `K` is `AffineMap.homothety c t '' K` with `t ∈ Ioo 0 1`;
  `AffineMap.homothety c t z = t • (z - c) + c`. For `t ≠ 1`,
  `v +ᵥ t • K = AffineMap.homothety ((1 - t)⁻¹ • v) t '' K`, since
  `t • z + (1 - t) • (1 - t)⁻¹ • v = t • z + v`; routes use this line in both directions.
- **Directions.** A family of directions is a `U : Finset E`, and "`m` directions" is
  `U.card ≤ m`. The zero direction is allowed: `illuminatedRegion K 0 = interior K`, which
  contains no frontier point. The empty family illuminates `K` exactly when `frontier K` is empty.
- **Supporting functionals.** A functional is `f : StrongDual ℝ E`; it *supports `K` at `x`* when
  `f ≠ 0` and `f y ≤ f x` for all `y ∈ K` (the point `x` itself need not lie in `K`). No cone of
  functionals is defined; the normal cone of 3.1 is notation inside its route.
- **Parallelepipeds.** `x₀ +ᵥ parallelepiped b` for a basis `b : Basis ι ℝ E` (Mathlib's
  `Module.Basis`) with `Fintype ι`; Mathlib's `parallelepiped b` is
  `{∑ i, t i • b i | t ∈ [0, 1]^ι}`. A parallelogram is the case `ι = Fin 2`.
- **Junk values.** `homothetyCoveringNumber K` is `sInf` of the set of `m` that work, so it is `0`
  when no finite family covers `K` (the parabola region of the 1.2 Checks). Every statement about it
  has the convex-body hypotheses, and 2.1 shows that the set is nonempty there. The gauge of
  `K − K` is `0` off the span of `K − K` when `K` has empty interior; 4.2 keeps the hypothesis.
- Affine invariance of the covering number and monotonicity in `m` are one-step facts and are not
  targets; no route needs them, since 2.2 is stated for every basis and every translate.

## Layer 1: illumination, Boltyanski's equivalence, extreme points

### 1.0 Definitions

- `IsCoveredBySmallerHomothets K m`: there are `c : Fin m → E` and `t : Fin m → ℝ` with every
  `t i ∈ Ioo 0 1` and `K ⊆ ⋃ i, AffineMap.homothety (c i) (t i) '' K`.
- `illuminatedRegion K u = {x | ∃ s, 0 < s ∧ x + s • u ∈ interior K}`.
- `IsIlluminatedBy K U`: `frontier K ⊆ ⋃ u ∈ U, illuminatedRegion K u`.
- `homothetyCoveringNumber K = sInf {m | IsCoveredBySmallerHomothets K m}`.
- `HasUniqueSupportAt K x`: any two nonzero `f g : StrongDual ℝ E` with `f y ≤ f x` and
  `g y ≤ g x` on `K` satisfy `g = c • f` for some `c > 0`. It holds vacuously where nothing
  supports `K`, for instance at interior points.

**Checks.**

- The ratio bound `t < 1` matters: with `t = 1` allowed every set is covered by one copy of
  itself, while the unit square needs four copies with ratios in `Ioo 0 1` (2.2).
- `IsCoveredBySmallerHomothets K 0` holds only for `K = ∅`, so `homothetyCoveringNumber ∅ = 0`.
  For the closed half-plane `{y ≥ 0}` in `ℝ²` one smaller homothet suffices (a homothety
  centred on the line `y = 0` maps the half-plane onto itself), while the parabola region of the
  1.2 Checks is covered by no finite family, so its covering number is the junk value `0`.

### 1.1 The illumination criterion

Prove `mem_illuminatedRegion_iff_forall_support`: let `K ⊆ E` be convex with nonempty interior,
and `x, u ∈ E`. Then `x ∈ illuminatedRegion K u` exactly when `f u < 0` for every `f` that
supports `K` at `x`. (Proved here; for smooth bodies and boundary points the criterion is
used in the proof of Glazyrin, Lemma 2.1, p. 5.)

Route. (⇒) Let `x + s • u ∈ interior K` with `s > 0`, and let `f` support `K` at `x`. Pick `z`
with `f z > 0`; for small `ε > 0`, `x + s • u + ε • z ∈ K`, so
`f x + s f u + ε f z ≤ f x`, and `f u < 0`. (⇐) Suppose the open ray
`R = {x + s • u | s > 0}` misses `interior K`. `interior K` is open, convex (`Convex.interior`)
and nonempty, and `R` is convex and nonempty, so Mathlib's `geometric_hahn_banach_open` gives `g`
and `c` with `g < c` on `interior K` and `c ≤ g` on `R`; `g ≠ 0`. Since
`closure (interior K) = closure K ⊇ K`
(`Convex.closure_interior_eq_closure_of_nonempty_interior`), `g ≤ c` on `K`. Letting `s → 0⁺`
in `g x + s g u ≥ c` gives `g x ≥ c`, so `g` supports `K` at `x`; letting `s → ∞` gives
`g u ≥ 0`. So the right-hand side fails.

At an interior point both sides hold (no nonzero functional attains its maximum over `K` at an
interior point). For `u = 0` and `x ∈ frontier K` both fail: a functional separating `x` from the
open set `interior K` supports `K` at `x`.

**Checks.**

- Convexity is needed: for the L-shaped set `([0, 2] × [0, 1]) ∪ ([0, 1] × [0, 2])` in `ℝ²`, the
  inner corner `x = (1, 1)` and `u = (1, 1)`, the points `x + s • u` lie outside the set for all
  `s > 0`, while no nonzero functional supports the set at `x` (evaluating at `(2, 1)`, `(1, 2)`
  and `(0, 0)` forces `f = 0`), so the right-hand side holds vacuously.
- A nonempty interior is needed: for `K = {0} ⊆ ℝ`, `x = 1`, `u = −1`, the functionals
  supporting `K` at `1` are `y ↦ a y` with `a > 0`, all negative at `u`, while
  `illuminatedRegion K u` is empty.

*Needs:* Mathlib `geometric_hahn_banach_open`, `geometric_hahn_banach_open_point`,
`Convex.interior`, `Convex.closure_interior_eq_closure_of_nonempty_interior`.

### 1.2 Boltyanski's equivalence

Prove `isCoveredBySmallerHomothets_tfae`: for `K : ConvexBody E` with nonempty interior and
`0 < m`, the following are equivalent (`List.TFAE`):

1. `IsCoveredBySmallerHomothets K m`;
2. `∃ t ∈ Ioo 0 1, ∃ v : Fin m → E, K ⊆ ⋃ i, v i +ᵥ t • K`;
3. `∃ w : Fin m → E, K ⊆ ⋃ i, w i +ᵥ interior K`;
4. `∃ U : Finset E, U.card ≤ m ∧ IsIlluminatedBy K U`.

(Boltyanski 1960, as cited by Aiger, Har-Peled and Žužić, p. 1; Martini, Richter and Spirova,
p. 3, cite it as Theorem 34.3 of Boltyanski, Martini and Soltan; a proof for `ℝ³` that does not
use the dimension is Aiger, Har-Peled and Žužić, Proposition 2.14, pp. 7–8. Proved here in every
real normed space.)

Route. Fix `p ∈ interior K`.

- (2 ⇒ 1) The Conventions line with `c i = (1 − t)⁻¹ • v i`.
- (1 ⇒ 3) For `z ∈ K`, `AffineMap.homothety c t z = (t • z + (1 − t) • p) + (1 − t) • (c − p)`,
  and `t • z + (1 − t) • p ∈ interior K` by `Convex.combo_closure_interior_mem_interior` (the
  weight `1 − t` of the interior point is positive). Take `w i = (1 − t i) • (c i − p)`.
- (3 ⇒ 4) `U = Finset.univ.image (fun i => -w i)`. A frontier point `x` lies in some
  `w i +ᵥ interior K`, so `x + 1 • (−w i) ∈ interior K`.
- (4 ⇒ 3) If `U = ∅`, `frontier K = ∅`, so `K` is clopen and nonempty, hence `K = univ`; a nonzero
  normed space is not compact, so `E` is the zero space, `interior K = K`, and `w = 0` works (here
  `0 < m` is used). Otherwise, for `u ∈ U` and `s > 0` let `V u s = {y | y + s • u ∈ interior K}`,
  an open set. These sets cover `K`: a frontier point lies in some `V u s` by hypothesis, and an
  interior point lies in `V u s` for any `u ∈ U` once `s` is small. `K` is compact and nonempty, so
  finitely many of them cover it (`IsCompact.elim_finite_subcover`); let `s₀ > 0` be the least `s`
  that occurs. If `y ∈ K ∩ V u s` and `s₀ ≤ s`, then `y ∈ V u s₀`, because `y + s₀ • u` is the
  combination of `y ∈ K` and `y + s • u ∈ interior K` with weights `1 − s₀/s` and `s₀/s > 0`
  (`Convex.combo_closure_interior_mem_interior`). Hence
  `K ⊆ ⋃ u ∈ U, (−s₀ • u) +ᵥ interior K`; list `U` along a surjection `Fin m → U` (`U` nonempty,
  `U.card ≤ m`).
- (3 ⇒ 2) For `0 < t < 1` let `V t = p +ᵥ t • (−p +ᵥ interior K)`, the image of `interior K`
  under the homothety of centre `p` and ratio `t`; it is open. The sets `V t` increase with `t`:
  for `t ≤ t'` and `y ∈ interior K`, the point `p + (t/t') • (y − p)` is in `interior K`, which is
  convex (`Convex.interior`). Their union is `interior K`: each `V t` is inside it by the same
  convexity, and for `y ∈ interior K` the point `p + t⁻¹ • (y − p)` tends to `y` as `t → 1`, so it
  is in the open set `interior K` for some `t < 1`, and then `y ∈ V t`. So the open sets
  `w i +ᵥ V t` cover `K`; finitely many do (`IsCompact.elim_finite_subcover`), and with `t` the
  largest ratio that occurs, `K ⊆ ⋃ i, w i +ᵥ V t`. Since
  `w i +ᵥ V t ⊆ (w i + (1 − t) • p) +ᵥ t • K`, statement 2 follows.

**Checks.**

- `0 < m` is needed: in the zero space `K = {0} = univ` has empty frontier, so statement 4 holds
  for `m = 0` with `U = ∅`, while statement 1 for `m = 0` says `K ⊆ ∅`. For `m ≥ 1` all four
  statements hold there.
- A nonempty interior is needed: the segment `[0, 1] × {0}` in `ℝ²` is covered by its images
  under the homotheties of ratio `3/5` with centres `(0, 0)` and `(1, 0)`, but it has empty
  interior and equals its frontier, so no direction illuminates any of its points.
- Compactness (part of `ConvexBody`) is needed: the closed region `P = {(x, y) | y ≥ x²}` in
  `ℝ²` is convex with nonempty interior and is illuminated by the single direction `(0, 1)`
  (from `(a, a²)` the point `(a, a² + 1)` is interior). The image of `P` under the homothety of
  centre `c` and ratio `t` is `{(x, y) | y − (1 − t) c₂ ≥ (x − (1 − t) c₁)² / t}`, and since
  `1/t > 1` the points `(x, x²)` with `|x|` large lie in none of finitely many such images.
- The square `[0, 1]²` is covered by the four translates `v +ᵥ (2/3) • [0, 1]²` with
  `v ∈ {0, 1/3}²` (2.2) and illuminated by the four directions `(±1, ±1)`, one for each corner.

*Needs:* Mathlib `Convex.combo_closure_interior_mem_interior`, `Convex.interior`,
`IsCompact.elim_finite_subcover`.

### 1.3 Extreme points suffice

Prove `isIlluminatedBy_iff_extremePoints`: if `E` is nontrivial, `K : ConvexBody E` and
`U : Finset E`, then `U` illuminates `K` exactly when every extreme point of `K` lies in
`illuminatedRegion K u` for some `u ∈ U`. (Proved here.)

Route. If `interior K = ∅`, every `illuminatedRegion K u` is empty, `frontier K = K` is
nonempty and `K` has an extreme point (`IsCompact.extremePoints_nonempty`), so both sides fail.
Let `interior K` be nonempty. (⇒) An extreme point `x` is a frontier point: if
`x ∈ interior K`, take `z ≠ 0` (here `Nontrivial E` is used) and `ε > 0` small; `x` is the
midpoint of `x ± ε • z ∈ K`. (⇐) Let `x ∈ frontier K`, let `S` be the set of functionals
supporting `K` at `x`, and `G = {y ∈ K | ∀ f ∈ S, f y = f x}`. `G` is closed in `K`, hence
compact, and contains `x`. It is an extreme subset of `K` (`IsExtreme`): if `y ∈ G` lies in the
open segment of `a, b ∈ K`, then `f a, f b ≤ f x = f y` forces `f a = f b = f x` for `f ∈ S`.
By `IsCompact.extremePoints_nonempty`, `G` has an extreme point `v`, which is an extreme point
of `K` (`IsExtreme.extremePoints_subset_extremePoints`). Let `u ∈ U` illuminate `v`. Each `f ∈ S`
has `f v = f x ≥ f y` on `K`, so it supports `K` at `v`, and `f u < 0` by 1.1 (⇒) at `v`; by
1.1 (⇐) at `x`, `x ∈ illuminatedRegion K u`.

**Checks.**

- `Nontrivial E` is needed: in the zero space `K = {0}` has empty frontier, so `U = ∅`
  illuminates it, while its extreme point `0` lies in no `illuminatedRegion K u` with `u ∈ ∅`.
- Compactness is needed: for the closed half-plane `{y ≥ 0}` in `ℝ²` there are no extreme
  points, so the right-hand side holds for `U = ∅`, but the frontier is not empty.

*Needs:* 1.1; Mathlib `IsExtreme`, `IsCompact.extremePoints_nonempty`,
`IsExtreme.extremePoints_subset_extremePoints`.

### Examples

- A polytope `convexHull ℝ ↑S` (`S : Finset E`) with nonempty interior is illuminated by the
  directions `p − v`, `v ∈ S`, for a point `p` of its interior: `v + 1 • (p − v) = p`, and
  its extreme points lie in `S` (Mathlib `extremePoints_convexHull_subset`); by 1.3 and 1.2 it is
  covered by `S.card` smaller homothets. A `d`-simplex is covered by `d + 1`, which is optimal by
  2.1.
- The triangle `conv {0, e₁, e₂}` is illuminated by `c − v` for its three vertices `v`, `c` the
  centroid (`v + 1 • (c − v) = c`).

### Dependencies

1.0 is definitions. 1.1 rests on Mathlib only. 1.2 rests on Mathlib and Tau Ceti. 1.3 needs 1.1.

## Layer 2: the bounds `d + 1` and `2 ^ d`, smooth bodies

### 2.1 The covering number is attained and at least `d + 1`

Prove `isCoveredBySmallerHomothets_homothetyCoveringNumber`: for `K : ConvexBody E` with nonempty
interior, `IsCoveredBySmallerHomothets K (homothetyCoveringNumber K)` and
`finrank ℝ E + 1 ≤ homothetyCoveringNumber K`. (The lower bound is stated by Glazyrin, p. 4; proved
here.)

Route. *Attained.* With `p ∈ interior K`, the open sets `(x − p) +ᵥ interior K`, `x ∈ K`, cover
`K`; a finite subfamily covers `K` (`IsCompact.elim_finite_subcover`), and it is nonempty because
`K` is. This is statement 3 of 1.2 for `m` its cardinality, so statement 1 holds, the set in
`homothetyCoveringNumber` is nonempty, and `Nat.sInf_mem` gives the first claim. *Lower bound.*
Let `m = homothetyCoveringNumber K`; `m ≥ 1` because `K` is nonempty. If `finrank ℝ E = 0` we are
done. Otherwise suppose `m ≤ d`. 1.2 gives `U` with `U.card ≤ d` illuminating `K`. There is a
nonzero `f` with `f u ≥ 0` for all `u ∈ U`: if `span ℝ U ≠ ⊤`,
`Submodule.exists_le_ker_of_lt_top` gives a nonzero linear functional vanishing on `U`
(continuous in finite dimension, `LinearMap.toContinuousLinearMap`); if `span ℝ U = ⊤`, `U` is a
basis and the sum of its coordinate functionals is `1` on `U`. Let `x` maximise `f` on `K`
(`IsCompact.exists_isMaxOn`). Then `x ∉ interior K`, so `x ∈ frontier K` and `f` supports `K`
at `x`; by 1.1 every `u` illuminating `x` has `f u < 0`, so no `u ∈ U` does. Contradiction.

**Checks.**

- In dimension `0` the value is `1 = 0 + 1`; for `K = [a, b] ⊆ ℝ` it is `2` (two homothets with
  ratio `3/5` centred at the end points cover, and one smaller homothet has smaller length).
- A nonempty interior is needed: the segment `[0, 1] × {0}` in `ℝ²` is covered by two smaller
  homothets (1.2 Checks) and by no single one (its image has length `t < 1`), so its covering
  number is `2 < 3`.

*Needs:* 1.1, 1.2; Mathlib `IsCompact.elim_finite_subcover`, `Nat.sInf_mem`,
`Submodule.exists_le_ker_of_lt_top`, `LinearMap.toContinuousLinearMap`,
`IsCompact.exists_isMaxOn`.

### 2.2 Parallelepipeds

Prove `isCoveredBySmallerHomothets_parallelepiped_iff`: for a basis `b : Basis ι ℝ E` with
`Fintype ι` and `x₀ : E`, `x₀ +ᵥ parallelepiped b` is covered by `m` smaller homothets exactly
when `2 ^ Fintype.card ι ≤ m`. (Aiger, Har-Peled and Žužić, Lemma 2.15(ii), p. 8, for
parallelepipeds in `ℝ³`; proved here for every finite basis.)

Route. Let `κ y = b.repr (y − x₀)`; by `mem_parallelepiped_iff` and `parallelepiped_basis_eq`,
`P = x₀ +ᵥ parallelepiped b = {y | ∀ i, κ y i ∈ [0, 1]}`. Since `κ` is affine,
`AffineMap.homothety c t '' P = {y | ∀ i, κ y i ∈ [a i, a i + t]}` with `a = (1 − t) • κ c`.
(⇒) The `2 ^ card ι` points `x₀ + ∑ i ∈ S, b i`, `S : Finset ι`, have coordinates the
indicators of `S`; two of them differ by `1` in some coordinate, so a box of side `t < 1`
contains at most one of them. Choosing for each point a homothet containing it gives an
injection `Finset ι → Fin m`. (⇐) `m ≥ 2 ^ card ι ≥ 1`; take a surjection `σ : Fin m → Finset ι`,
ratio `2/3` and centres `c j = x₀ + ∑ i ∈ σ j, b i`, so that the box of `j` is
`[1/3, 1]` in the coordinates `i ∈ σ j` and `[0, 2/3]` in the others. A point of `P` lies in
the box of any `j` with `σ j = {i | κ y i > 1/2}`.

In particular `homothetyCoveringNumber (x₀ +ᵥ parallelepiped b) = 2 ^ Fintype.card ι`.

**Checks.**

- For `ι` empty (`E` the zero space) `P = {x₀}`, and the statement says that `P` is covered
  by `m` homothets exactly when `1 ≤ m`.
- For the cube `[0, 1]^d` a direction `u` illuminates the vertex `v` exactly when `u i > 0`
  wherever `v i = 0` and `u i < 0` wherever `v i = 1` (1.1 with the facet functionals), so each
  direction illuminates at most one vertex and `2^d` directions are needed; for `d = 1, …, 4` an
  exact enumeration over vertex sets gives `2, 4, 8, 16`, and for the parallelepiped spanned by
  `(1, 0, 0)`, `(1, 2, 0)`, `(0, 1, 3)` it gives `8`.

*Needs:* Mathlib `parallelepiped`, `mem_parallelepiped_iff`, `parallelepiped_basis_eq`,
`Module.Basis.repr`, `AffineMap.homothety_apply`.

### 2.3 Smooth bodies

Prove `homothetyCoveringNumber_eq_of_hasUniqueSupportAt`: a convex body with nonempty interior
such that `HasUniqueSupportAt K x` for every `x ∈ frontier K` has
`homothetyCoveringNumber K = finrank ℝ E + 1`. (Attributed to Levi by Glazyrin, p. 5; proved
here.)

Route. Let `e : Basis (Fin d) ℝ E` and `U = {−e 0, …, −e (d − 1), ∑ i, e i}`, so
`U.card ≤ d + 1`. Let `x ∈ frontier K`. A functional separating `x` from the open convex set
`interior K` (`geometric_hahn_banach_open_point`) supports `K` at `x` (1.1 route). Call it `f`.
Some `u ∈ U` has `f u < 0`: if `f (e i) > 0` for some `i` take `−e i`; otherwise every
`f (e i) ≤ 0` and one is negative (`f ≠ 0`), so `f (∑ i, e i) < 0`. Every functional supporting
`K` at `x` is `c • f` with `c > 0`, so it is negative at `u`, and 1.1 gives
`x ∈ illuminatedRegion K u`. So `IsIlluminatedBy K U`; 1.2 with `m = d + 1` and `Nat.sInf_le`
give `≤`, and 2.1 gives `≥`.

**Checks.**

- The hypothesis is needed: the square is not smooth at its corners and has covering number
  `4 > 3` (2.2). The Euclidean disc, a stadium (a rectangle with two half-discs) and every set
  `C + closedBall 0 r` with `C` compact convex and `r > 0` in a Euclidean space satisfy it (5.2).
- A nonempty interior is needed. In `ℓ²` let `A` be the diagonal operator with entries `1/n` and
  `K = {A z | ‖z‖ ≤ 1}`, a compact convex set with empty interior, so `frontier K = K`. A
  nonzero functional `⟪y, ·⟫` attains its maximum over `K` only at `A² y / ‖A y‖`; since `A²` is
  injective, two functionals with the same maximiser are positive multiples of each other, so
  `HasUniqueSupportAt K x` holds at every `x ∈ K`. But `finrank` of `ℓ²` is `0`, and `K` is not
  covered by one smaller homothet (its diameter would shrink by the ratio).
- In dimension `0` the frontier is empty and the value is `1`; for `[a, b] ⊆ ℝ` the supporting
  functionals at an end point are the positive multiples of one functional, and the value is `2`.

*Needs:* 1.1, 1.2, 2.1; Mathlib `geometric_hahn_banach_open_point`, `Nat.sInf_le`.

### Examples

- By the Examples of Layer 1 and 2.1, a `d`-simplex has covering number `d + 1`. By exact
  enumeration over vertex sets (1.3, 1.2), the octahedron in `ℝ³` needs `6`, the triangular
  prism `6`, the square pyramid `5`.
- Perturbations of the cube: cutting one corner off `[0, 3]³` (vertices `(2, 3, 3)`,
  `(3, 2, 3)`, `(3, 3, 2)`) gives covering number `7`, cutting two opposite corners `6`.

### Dependencies

2.1 needs 1.1 and 1.2. 2.2 rests on Mathlib only. 2.3 needs 1.1, 1.2 and 2.1.

## Layer 3: the plane

### 3.1 Levi's theorem

Prove `homothetyCoveringNumber_of_finrank_eq_two`: if `finrank ℝ E = 2` and `K : ConvexBody E`
has nonempty interior, then either `K = x₀ +ᵥ parallelepiped b` for some `x₀` and some
`b : Basis (Fin 2) ℝ E` and `homothetyCoveringNumber K = 4`, or `K` is of no such form and
`homothetyCoveringNumber K = 3`. (Levi 1955, as stated by Aiger, Har-Peled and Žužić, p. 1; Bezdek
and Khan, p. 1, attribute the planar case to Levi; proved here.)

Route. If `K` is a parallelogram, 2.2 with `ι = Fin 2` gives the value `4`. Otherwise 2.1 gives
`≥ 3`, and by 1.2 it suffices to find three directions illuminating `K`. Write `E*` for
`StrongDual ℝ E`, which is two-dimensional. For `x ∈ K` let `N x` be the set of `g ∈ E*` with
`g y ≤ g x` on `K` (notation of this route only), a closed convex cone. Say that `f ∈ E*` is
*inside* `N x` when `f = α • a + β • b` with `a, b ∈ N x` linearly independent and `α, β > 0`,
and that a nonzero `f` is *split* when it is inside no `N x`. Split functionals are closed under
positive scaling. Fix `p ∈ interior K`.

- **L1 (slices).** For `g ∈ N x` nonzero, `g (x − p) > 0`, since `p` is interior. If
  `closedBall p r ⊆ K`, `g ∈ N x` and `g (x − p) = 1`, then `g z ≤ 1` for `‖z‖ ≤ r`, so
  `‖g‖ ≤ 1/r`. For `x ∈ frontier K`, `x ≠ p` and the slice `N x ∩ {g | g (x − p) = 1}` is a
  nonempty compact convex subset of a line of `E*` not through `0`, a segment `[a, b]`, and
  `N x` is the cone on it. If `N x` contains two independent vectors then `a ≠ b`, and `a`, `b`
  are independent. For `x ∈ interior K`, `N x = {0}`.
- **L2 (inside determines the point).** If `f` is inside `N x` and `f ∈ N y` (`y ∈ K`), then
  `y = x`: `f x` and `f y` both equal `max_K f`; with `f = α • a + β • b`, the inequalities
  `a y ≤ a x`, `b y ≤ b x` and `α a y + β b y = α a x + β b x` give `a (y − x) = b (y − x) = 0`,
  and two independent functionals on a two-dimensional space have common kernel `0`.
- **L3 (ends are split).** In L1 with `a`, `b` independent, `a` and `b` are split: if `a` were
  inside `N y`, then `y = x` by L2, so `a = α' • a' + β' • b'` with `a', b' ∈ N x` independent;
  scaling `a'`, `b'` into the slice and evaluating at `x − p` writes `a` as a combination with
  positive weights of two distinct points of `[a, b]`, which an end point is not. Every nonzero
  `f` that is not split is inside some `N x`; then `N x` has independent slice ends `a`, `b`,
  `f` is a positive combination of them, and they are split.
- **L4 (three split functionals with sum zero).** Let `Z` be the set of split functionals. It is
  nonempty: a nonzero functional is split or, by L3, a combination of two split ones.
  (A) If some `z ∈ Z` has `−z ∉ Z`, L3 writes `−z = α • a + β • b` with `a, b ∈ Z` independent
  and `α, β > 0`; take `(z, α • a, β • b)`. (B) Otherwise `Z = −Z`. Take `z ∈ Z` and `g` not on
  the line `ℝ z`; `g` is split, or one of its two independent split ends (L3) is off that line.
  So there is `w ∈ Z` independent of `z`, and `±z, ±w` and all their nonzero multiples lie in
  `Z`. If some `y ∈ Z` is not a multiple of `z` or of `w`, write `y = α • z + β • w` with
  `α, β ≠ 0` and take `(y, −α • z, −β • w)`. (C) If every split functional is a multiple of `z`
  or of `w`, then `K` is the parallelogram
  `P = {y | min_K z ≤ z y ≤ max_K z, min_K w ≤ w y ≤ max_K w}` (`min_K z < max_K z` as `K` has
  interior points), which is `x₀ +ᵥ parallelepiped b` for `x₀` with `z x₀ = min_K z`,
  `w x₀ = min_K w` and `b` the basis dual to `(z, w)` scaled by `max_K z − min_K z` and
  `max_K w − min_K w`. Indeed `K ⊆ P`; conversely let `y ∈ P` and `g ≠ 0`. If `g` is a positive
  multiple of `±z` or `±w`, then `g y ≤ max_K g` by definition of `P`; otherwise `g` is not split,
  hence inside some `N x` with split ends `a`, `b`, which are positive multiples of `±z`, `±w`,
  and `g y = α a y + β b y ≤ α a x + β b x = g x = max_K g`. So no functional separates `y` from
  the closed convex set `K`, and `y ∈ K` (`geometric_hahn_banach_point_closed`). Since `K` is
  not a parallelogram, (A) or (B) holds. In each case the three functionals `f₁, f₂, f₃` are
  split, pairwise independent and `f₁ + f₂ + f₃ = 0`.
- **L5 (the directions).** For each `j` let `u j` be the vector with `f i (u j) = −1` for both
  `i ≠ j` (the two `f i` form a basis of `E*`); then `f j (u j) = 2`. The map
  `s g = (g (u 1), g (u 2), g (u 3))` is a linear isomorphism from `E*` onto the plane
  `W = {s ∈ ℝ³ | s₁ + s₂ + s₃ = 0}`: `∑ j, u j` is killed by every `f i`, hence `0`, and `u 1`,
  `u 2` are independent. It sends `f i` to `3 eᵢ − (1, 1, 1)`. In `W`, with the dot product, the six
  vectors `±(eᵢ − eⱼ)` have equal length and, in the cyclic order
  `e₁ − e₂, e₁ − e₃, e₂ − e₃, e₂ − e₁, e₃ − e₁, e₃ − e₂`, consecutive ones make the angle `π/3`.
  Write `Fᵢ` for the closed sector spanned by `eᵢ − eⱼ` and `eᵢ − eₖ` (`{i, j, k} = {1, 2, 3}`),
  that is `{sⱼ ≤ 0, sₖ ≤ 0}`; `s (f i) = (eᵢ − eⱼ) + (eᵢ − eₖ)` lies in its interior. *Sector
  lemma:* let `A, B ∈ W` be nonzero and not opposite (`B ≠ −c A` for `c > 0`), and suppose every `j`
  has `Aⱼ ≥ 0` or `Bⱼ ≥ 0`. Then `A`, `B` are independent and some `s (f i)` is a combination of `A`
  and `B` with positive weights. Proof: `A` has coordinates of both signs (they sum to `0`), so `A`
  has at most two nonnegative coordinates, and so has `B`; after exchanging `A`, `B` and renaming
  indices, `A₁, A₂ ≥ 0 > A₃` and `B₃ ≥ 0`. If `A`, `B` were dependent, `B = c A` with `c > 0` (as
  `B` is nonzero and not opposite), and `B₃ < 0`; so they are independent. Measure angles from
  `e₁ − e₂`, turning towards `e₁ − e₃`: `A` lies in the arc `[π/3, 2π/3]` (the sector
  `{s₁ ≥ 0, s₂ ≥ 0}`) and `B` in `[π, 2π]` (the half-plane `s₃ ≥ 0`). The cone on `A`, `B` is the
  arc between them of length `< π`. If `B ∈ [π, 4π/3]` it contains the arc `[2π/3, π] = F₂`; if
  `B ∈ [5π/3, 2π]` it contains `[0, π/3] = F₁` (going from `B` through `2π`); if `B ∈ [4π/3, 5π/3]`
  the arc from `A` to `B` contains `F₂` and the arc from `B` to `A` through `2π` contains `F₁`, and
  the shorter of the two is the cone. Length `π` occurs only for opposite `A`, `B`. A cone with two
  independent generators containing `Fᵢ` has `s (f i)` in its interior.
- **L6 (conclusion).** Let `x ∈ frontier K` with slice ends `a`, `b` (L1, possibly `a = b`), and
  suppose no `u j` illuminates `x`. By 1.1, for each `j` some nonzero `g ∈ N x` has
  `g (u j) ≥ 0`; since `g` is a nonnegative combination of `a` and `b`, `a (u j) ≥ 0` or
  `b (u j) ≥ 0`. `N x` contains no opposite pair (L1), so the sector lemma applies to
  `s a`, `s b`: they are independent and some `f i` is a positive combination of `a` and `b`,
  that is inside `N x`, contradicting that `f i` is split. So `{u 1, u 2, u 3}` illuminates `K`.

**Checks.**

- The statement on polygons, by exact enumeration over vertex sets (1.3): the triangle
  `conv {(0, 0), (1, 0), (0, 1)}`, the trapezoids with vertices `(0, 0), (4, 0), (3, 2), (1, 2)`
  and `(0, 0), (5, 0), (4, 1), (1, 1)`, the kite `(0, −1), (2, 0), (0, 3), (−2, 0)`, the pentagon
  `(0, 0), (2, 0), (3, 2), (1, 3), (−1, 2)`, the house `(0, 0), (2, 0), (2, 2), (1, 3), (0, 2)`
  and the hexagon `(±2, 0), (±1, ±2)` have covering number `3`; the unit square and the
  parallelogram `(0, 0), (3, 0), (4, 2), (1, 2)` have `4`.
- The route on the same polygons, where the split functionals are the positive multiples of the
  outer edge normals: the hexagon falls under case (B), the other non-parallelograms under (A),
  the two parallelograms under (C); in each non-parallelogram the three directions `u j` of L5
  satisfy, at every vertex, `n (u j) < 0` for both adjacent outer edge normals `n` for some `j`.
- The sector lemma, for all `A, B ∈ W` with integer first two coordinates in `[−5, 5]` that are
  not zero and not opposite: whenever every `j` has `Aⱼ ≥ 0` or `Bⱼ ≥ 0`, `A` and `B` are
  independent and some `3 eᵢ − (1, 1, 1)` has positive coordinates in the basis `A, B`.
- A nonempty interior is needed: the segment `[0, 1] × {0}` in `ℝ²` is not of the form
  `x₀ +ᵥ parallelepiped b` (it has empty interior) and has covering number `2` (2.1 Checks).

*Needs:* 1.1, 1.2, 2.1, 2.2; Mathlib `geometric_hahn_banach_point_closed`,
`geometric_hahn_banach_open_point`, `Module.Basis.dualBasis`.

### Examples

- Bodies with exactly one pair of parallel boundary segments (the trapezoids above, the stadium)
  and bodies with corners and curved arcs (a half-disc) are not parallelograms and have covering
  number `3`; for the half-disc the split functionals are the outer normals of the arc and of
  the diameter, and case (A) applies.

### Dependencies

3.1 needs 1.1, 1.2, 2.1 and 2.2.

## Layer 4: two directions along a line, and short curves

### 4.1 The two directions `±w`

Prove `mem_illuminatedRegion_or_neg_iff`: let `K : ConvexBody E` have nonempty interior, let
`F` be a real normed space, `π : E →L[ℝ] F` surjective with `LinearMap.ker π = ℝ ∙ w`, and
`x ∈ frontier K`. Then `x ∈ illuminatedRegion K w ∨ x ∈ illuminatedRegion K (−w)` exactly when
`π x ∈ interior (π '' K)`. (Aiger, Har-Peled and Žužić, Lemma 4.1(i), pp. 10–11, for orthogonal
projection in `ℝ³` and the implication from right to left; proved here in this generality.)

Route. `E` is finite-dimensional, hence so is `F = range π`; both are complete, and `π` is open
(`ContinuousLinearMap.isOpenMap`). *Key identity* `π '' interior K = interior (π '' K)`: `⊆` by
openness (`IsOpenMap.image_interior_subset`). For `⊇`, the set `A = π '' interior K` is open,
convex (`Convex.interior`, `Convex.linear_image`) and nonempty, and `π '' K ⊆ closure A`, because
`K ⊆ closure (interior K)` (`Convex.closure_interior_eq_closure_of_nonempty_interior`) and `π` is
continuous (`image_closure_subset_closure_image`). So
`interior (π '' K) ⊆ interior (closure A) = A`
(`Convex.interior_closure_eq_interior_of_nonempty_interior`).

The two sides of the equivalence both say that the line `x + ℝ ∙ w` meets `interior K`. Indeed
`π y = π x` exactly when `y = x + s • w` for a scalar `s`, so by the key identity
`π x ∈ interior (π '' K)` exactly when `x + s • w ∈ interior K` for some `s`. Here `s ≠ 0`, as `x`
is a frontier point of the closed set `K`; and `x + s • w ∈ interior K` with `s > 0` says that `w`
illuminates `x`, with `s < 0` that `−w` does (`x + s • w = x + (−s) • (−w)`).

**Checks.**

- For `w = 0`, `π` is injective and both sides fail at frontier points. In dimension `1` with
  `w ≠ 0`, `F` is the zero space, `π '' K = univ`, and one of `±w` points into `K` from each end.
- A nonempty interior is needed: for the segment `K = {0} × [−1, 1]` in `ℝ²`, `w = (1, 0)` and
  `π (a, b) = b`, the point `x = 0` is a frontier point, `π x = 0` is interior to
  `π '' K = [−1, 1]`, and no direction illuminates `x`.

*Needs:* Mathlib `FiniteDimensional.of_isCompact_closedBall₀`, `ContinuousLinearMap.isOpenMap`,
`IsOpenMap.image_interior_subset`, `Convex.interior`, `Convex.linear_image`,
`Convex.closure_interior_eq_closure_of_nonempty_interior`, `image_closure_subset_closure_image`,
`Convex.interior_closure_eq_interior_of_nonempty_interior`.

### 4.2 Short curves

Prove `exists_subset_vadd_smul_of_variation_le`: let `K : ConvexBody E` have nonempty interior,
`γ : ℝ → E` and `a, b, lam ∈ ℝ`, and suppose that for every `n` and every monotone
`t : ℕ → ℝ` with values in `Icc a b`,
`∑ i ∈ Finset.range n, gauge (K − K) (γ (t (i + 1)) − γ (t i)) ≤ lam`. Then
`γ '' Icc a b ⊆ v +ᵥ lam • K` for some `v`, and if `lam < 1` one direction `u` illuminates every
point of `γ '' Icc a b` that lies on `frontier K`. In the norm of `½ (K − K)` the condition reads
"length at most `2 lam`". (Aiger, Har-Peled and Žužić, Lemma 3.4, pp. 9–10, for continuous curves
in `ℝ³` with `0 ∈ interior K` and length `< 2` in that norm; proved here in every dimension, for
every `lam`, without continuity.)

Route. `E` is finite-dimensional; let `d = finrank ℝ E` and `D = K − K`. `D` is compact, convex
and symmetric, with nonempty interior (it contains `interior K − k` for `k ∈ K`), so `0` is
interior (Tau Ceti `Convex.zero_mem_interior_of_symmetric`); for `g > 0`, `gauge D z ≤ g` gives
`z ∈ g • D` (Tau Ceti `gauge_le_iff_mem_smul_closure`, `D` closed); and `gauge D z = 0` gives
`z = 0` (`D` is bounded). If `a > b` both claims hold trivially. Otherwise the constant chain gives
`0 ≤ lam`.

*Case `lam = 0`.* Every chord has gauge `0`, so `γ` is constant on `Icc a b`, and `v = γ a`
works since `0 • K = {0}`. For the second claim, if `γ a ∈ frontier K` then `u = p − γ a` with
`p ∈ interior K` works (`γ a + 1 • u = p`).

*Case `lam > 0`.* The sets `C s = γ s +ᵥ (−lam) • K`, `s ∈ Icc a b`, are compact and convex, and
`v ∈ C s` means `γ s ∈ v +ᵥ lam • K`. By Helly's theorem (`Convex.helly_theorem_compact'`) it
suffices that any `d + 1` of them meet. Take parameters `s₁ ≤ … ≤ s_k` in `Icc a b` with
`k ≤ d + 1`, put `yⱼ = γ sⱼ`, let `gⱼ = gauge D (y_{j+1} − yⱼ)` for `j < k` and `G = ∑ j, gⱼ`.
The monotone chain `s₁, …, s_k, s_k, …` shows `G ≤ lam`. Each step is a multiple of a difference
of two points of `K`: `y_{j+1} − yⱼ = gⱼ • (qⱼ − pⱼ)` with `pⱼ, qⱼ ∈ K` (a step with `gⱼ = 0` is
`0`, and any point of `K` serves for both). Put `c = ∑ j, gⱼ • pⱼ`. Then

`yⱼ ∈ (y₁ − c) +ᵥ G • K` for every `j`,

because `yⱼ − y₁ + c = ∑ i < j, gᵢ • qᵢ + ∑ i ≥ j, gᵢ • pᵢ` is a sum of points of `K` with
nonnegative weights of total `G`, which lies in `G • K` since `K` is convex (if `G = 0`, all
`yⱼ` coincide and `G • K = {0}`). Moreover `G • K ⊆ (−(lam − G) • k₀) +ᵥ lam • K` for any
`k₀ ∈ K`, again by convexity. So the point `y₁ − c − (lam − G) • k₀` lies in every `C sⱼ`.
Helly gives `v` in every `C s`. For `lam < 1` and `z ∈ K`,
`v + lam • z = (lam • z + (1 − lam) • p) + (v − (1 − lam) • p)` and the first summand is interior
(`Convex.combo_closure_interior_mem_interior`), so `v +ᵥ lam • K ⊆ w' +ᵥ interior K` with
`w' = v − (1 − lam) • p`, and `u = −w'` illuminates every frontier point of `v +ᵥ lam • K`.

**Checks.**

- For the triangle `K = conv {(0, 0), (1, 0), (0, 1)}`, `K − K` is the hexagon
  `{|z₁| ≤ 1, |z₂| ≤ 1, |z₁ + z₂| ≤ 1}` and `gauge (K − K) z = max (|z₁|, |z₂|, |z₁ + z₂|)`. The
  polygonal path through `(0, 0), (1/4, 0), (1/4, 1/4), (0, 1/2)`, traversed linearly on `[0, 3]`,
  has chord sums at most `1/4 + 1/4 + 1/4 = 3/4` (subadditivity of the gauge); it lies in
  `(3/4) • K` (`v = 0`), and with `p = (1/4, 1/4)` the direction `u = (1/4) • p − v = (1/16, 1/16)`
  moves every point of the path into the interior.
- `lam < 1` cannot be relaxed to `lam ≤ 1` in the second claim: for `K = [0, 1]²` and `γ s = (s, 0)`
  on `[0, 1]`, `K − K = [−1, 1]²`, the chord sums are at most `1`, and no direction illuminates both
  `(0, 0)` (it needs `u₁ > 0`) and `(1, 0)` (it needs `u₁ < 0`); nor does the side lie in a
  translate of `t • K` for `t < 1`.
- A nonempty interior is needed: for the segment `K = [0, 1] × {0}` in `ℝ²` and `γ s = (0, s)`,
  `gauge (K − K)` vanishes at every `(0, δ)` (no positive dilate of `K − K` contains it, and
  `sInf ∅ = 0`), so the hypothesis holds with `lam = 0`, but `γ '' [0, 1]` is not a point.

*Needs:* Mathlib `FiniteDimensional.of_isCompact_closedBall₀`, `Convex.helly_theorem_compact'`,
`Convex.combo_closure_interior_mem_interior`, `gauge`; Tau Ceti
`Convex.zero_mem_interior_of_symmetric`, `gauge_le_iff_mem_smul_closure`.

### Examples

- For `K = [0, 1]²`, `w = (1, 0)` and `π (a, b) = b`, the projection is `[0, 1]`, and `±w`
  illuminate exactly the frontier points `(0, b)` and `(1, b)` with `0 < b < 1`.

### Dependencies

4.1 and 4.2 rest on Mathlib and Tau Ceti only.

## Layer 5: continuity in the Hausdorff metric

### 5.1 Upper semicontinuity

Prove `eventually_isCoveredBySmallerHomothets`: if `K : ConvexBody E` has nonempty interior and
`IsCoveredBySmallerHomothets K m`, then `IsCoveredBySmallerHomothets L m` for all `L` in a
neighbourhood of `K` in `ConvexBody E`, whose metric is the Hausdorff distance (Mathlib
`ConvexBody.hausdorffDist_coe`). Consequently
`homothetyCoveringNumber L ≤ homothetyCoveringNumber K` near `K` (`Nat.sInf_le`). (Bezdek and Khan,
Theorem 4.7, p. 13, who attribute it to Boltyanski, Martini and Soltan; proved here.)

Route. `m ≥ 1`, since `K` is nonempty. By 1.2, `K ⊆ ⋃ i, v i +ᵥ t • K` with `t ∈ Ioo 0 1`. Fix
`closedBall p r ⊆ K` with `r > 0`, let `δ = min (r/2) (r (1 − t) / 8)` and
`hausdorffDist K L < δ`; then each point of either set is within `δ` of the other
(`Metric.exists_dist_lt_of_hausdorffDist_lt`, `ConvexBody.hausdorffEDist_ne_top`).
*Step 1:* `closedBall p (r/2) ⊆ L`. Otherwise separate a point `q` of it from the compact convex
`L` (`geometric_hahn_banach_point_closed`): `g y < g q` on `L`. Pick `‖z‖ ≤ 1` with
`g z = ‖g‖` (finite dimension); `q' = q + (r/2) • z ∈ closedBall p r ⊆ K` is within `δ` of some
`l ∈ L`, so `g q + (r/2) ‖g‖ = g q' < g l + δ ‖g‖ < g q + δ ‖g‖`, against `δ ≤ r/2`.
*Step 2:* for `y ∈ L` pick `k ∈ K` with `‖y − k‖ < δ`, write `k = v i + t • k'` with `k' ∈ K`,
and pick `l' ∈ L` with `‖k' − l'‖ < δ`. Then `e = y − v i − t • l'` has `‖e‖ < 2 δ`, so
`e = s • (l'' − p)` with `s = 4 δ / r` and `l'' ∈ closedBall p (r/2) ⊆ L`, and
`y = (v i − s • p) + (t • l' + s • l'') ∈ (v i − s • p) +ᵥ (t + s) • L` (`L` convex), with
`t + s ≤ t + (1 − t)/2 < 1`. The Conventions line turns these translates into homothets.

**Checks.**

- A nonempty interior is needed: the segment `[0, 1] × {0}` in `ℝ²` is covered by two smaller
  homothets, but the rectangles `[0, 1] × [0, δ]` tend to it and need four (2.2).
- For `m = 0` the hypothesis fails for every nonempty `K`.

*Needs:* 1.2; Mathlib `ConvexBody.hausdorffDist_coe`, `ConvexBody.hausdorffEDist_ne_top`,
`Metric.exists_dist_lt_of_hausdorffDist_lt`, `geometric_hahn_banach_point_closed`.

### 5.2 Smooth bodies near the cube

Prove `exists_hausdorffDist_lt_cube`: for every `d` and `ε > 0` there is a compact convex
`L ⊆ EuclideanSpace ℝ (Fin d)` with nonempty interior and
`hausdorffDist L (parallelepiped (EuclideanSpace.basisFun (Fin d) ℝ)) < ε` that is covered by
`d + 1` smaller homothets. Since the cube needs `2 ^ d` (2.2) and `d + 1 < 2 ^ d` for `d ≥ 2`,
the covering number is not lower semicontinuous. (Bezdek and Khan, Example 4.6, p. 13, with
smoothed cubes; Aiger, Har-Peled and Žužić, p. 3; proved here with parallel bodies.)

Route. Let `C` be the cube (compact as `Module.Basis.parallelepiped`, convex by
`convex_parallelepiped`) and `L = C + closedBall 0 (ε/2)`: compact (`IsCompact.add`), convex
(`Convex.add`), with interior containing a ball, and `hausdorffDist L C ≤ ε/2` by
`Metric.hausdorffDist_le_of_mem_dist` (`C ⊆ L`). *Smoothness:* let `x ∈ frontier L`,
`x = c + y` with `c ∈ C`, `‖y‖ ≤ ε/2`; then `‖y‖ = ε/2` (else `x` is interior) and
`closedBall c (ε/2) ⊆ L`, so a functional supporting `L` at `x` supports this ball at `x`.
Writing it as `⟪a, ·⟫` (`InnerProductSpace.toDual`), `⟪a, y⟫ = ‖a‖ ‖y‖`, so `y` is a positive
multiple of `a` (`inner_eq_norm_mul_iff_real`): all functionals supporting `L` at `x` are
positive multiples of `⟪y, ·⟫`. Then 2.3 for the convex body `L` and 2.1 (attained) give the
covering by `d + 1`.

**Checks.**

- For `d = 0` and `d = 1` the statement holds and `d + 1 = 2 ^ d`, so there is no gap.

*Needs:* 2.1, 2.3; Mathlib `Module.Basis.parallelepiped`, `convex_parallelepiped`, `IsCompact.add`,
`Convex.add`, `Metric.hausdorffDist_le_of_mem_dist`, `InnerProductSpace.toDual`,
`inner_eq_norm_mul_iff_real`.

### Examples

- `d = 2`: the squares with rounded corners `[0, 1]² + closedBall 0 r` have covering number `3`
  (2.3) and tend to the square, whose covering number is `4`.

### Dependencies

5.1 needs 1.2. 5.2 needs 2.1 and 2.3 (and 2.2 for the comparison).

## Scope and ownership

This roadmap owns the covering and illumination predicates, the covering number, uniqueness of
supporting hyperplanes as a predicate on points, and the eleven theorems above.

- *ConvexAnalysisAndDuality* (on main) states support at frontier points in finite dimension (1.1),
  the Minkowski–Carathéodory theorem (1.2), support functions (2.1) and normal cones (Conventions,
  3.7). None is used here: the routes use Mathlib's separation theorems with an interior point, 1.3
  uses only the existence of extreme points of a compact convex set, and the normal cone of 3.1 is
  route notation.
- *BanachSpaceTheory* (on main) states John's theorem (7.2), on which proofs of
  three-dimensional covering bounds rest; it is not used. *Isoperimetry* (on main) also works with
  `ConvexBody`; it is not used.
- Already in the libraries and cited: separation (`geometric_hahn_banach_*`), Helly's theorem,
  extreme points of compact sets, gauges, parallelepipeds and `ConvexBody` with its Hausdorff
  metric (Mathlib); the gauge of a convex neighbourhood of `0` and the interior of a symmetric
  convex set (Tau Ceti). Mathlib's `Metric.coveringNumber` is the metric covering number by
  balls, a different notion.
- Not treated: general upper bounds for the covering number (Rogers-type bounds, Lassak's bound
  for symmetric bodies in `ℝ³`, the bounds of Papadoperakis and Prymak), bodies of constant width,
  illumination by points or by affine subspaces, the X-ray number, and support and width
  functions, mean width and Cauchy's formulas.
- A 2026 preprint of Aiger, Har-Peled and Žužić (arXiv 2611.32334) states that every convex
  body in `ℝ³` is covered by eight smaller homothets, which would settle Hadwiger's problem in
  dimension three; the authors state that the proof was found with an AI system and checked in
  Lean 4, and a Lean development accompanies the preprint as an arXiv ancillary file. This
  roadmap neither states nor uses that theorem; it does not use that development, and its
  definitions are not taken from it.

## Exact supplier contracts

### From Mathlib

- `ConvexBody` (`Mathlib/Analysis/Convex/Body.lean`), with `ConvexBody.instPseudoMetricSpace`
  (the topology of 5.1), `ConvexBody.hausdorffDist_coe` and `ConvexBody.hausdorffEDist_ne_top`.
- `geometric_hahn_banach_open`, `geometric_hahn_banach_open_point`,
  `geometric_hahn_banach_point_closed` (`Mathlib/Analysis/LocallyConvex/Separation.lean`;
  topological real vector spaces, locally convex for the closed version).
- `Convex.helly_theorem_compact'` (`Mathlib/Analysis/Convex/Radon.lean`): in a finite-dimensional
  Hausdorff space, a family of compact convex sets any `finrank + 1` of which meet has a common
  point.
- `IsExtreme`, `IsExtreme.extremePoints_subset_extremePoints`, `extremePoints_convexHull_subset`
  (`Mathlib/Analysis/Convex/Extreme.lean`), `IsCompact.extremePoints_nonempty`
  (`Mathlib/Analysis/Convex/KreinMilman.lean`).
- `Convex.combo_closure_interior_mem_interior`, `Convex.interior`,
  `Convex.closure_interior_eq_closure_of_nonempty_interior`,
  `Convex.interior_closure_eq_interior_of_nonempty_interior`
  (`Mathlib/Analysis/Convex/Topology.lean`); `Convex.linear_image`
  (`Mathlib/Analysis/Convex/Basic.lean`); `image_closure_subset_closure_image`.
- `gauge` (`Mathlib/Analysis/Convex/Gauge.lean`).
- `parallelepiped`, `mem_parallelepiped_iff`, `parallelepiped_basis_eq`, `convex_parallelepiped`,
  `Module.Basis.parallelepiped` (`Mathlib/MeasureTheory/Measure/Haar/OfBasis.lean`).
- `AffineMap.homothety`, `AffineMap.homothety_apply`; `FiniteDimensional.of_isCompact_closedBall₀`;
  `ContinuousLinearMap.isOpenMap` (complete spaces), `IsOpenMap.image_interior_subset`;
  `IsCompact.exists_isMaxOn`, `IsCompact.elim_finite_subcover`, `IsCompact.add`, `Convex.add`;
  `Submodule.exists_le_ker_of_lt_top`, `LinearMap.toContinuousLinearMap`, `Module.Basis.dualBasis`;
  `Nat.sInf_mem`, `Nat.sInf_le`; `Metric.exists_dist_lt_of_hausdorffDist_lt`,
  `Metric.hausdorffDist_le_of_mem_dist`; `InnerProductSpace.toDual`,
  `inner_eq_norm_mul_iff_real`; `EuclideanSpace.basisFun`, `StrongDual`.

### From Tau Ceti

- `gauge_le_iff_mem_smul_closure` (`TauCeti/Analysis/Convex/Gauge.lean`): for a convex `s ∈ 𝓝 0`
  in a topological real vector space and `0 < t`, `gauge s x ≤ t ↔ x ∈ t • closure s` (4.2).
- `Convex.zero_mem_interior_of_symmetric` (`TauCeti/Analysis/Convex/Topology.lean`): a convex set
  symmetric about `0` with nonempty interior has `0` in its interior (4.2).

## References

- N. Aiger, S. Har-Peled, D. Žužić, *Hadwiger's covering conjecture in three dimensions*,
  arXiv:2611.32334v2 (2026).
- K. Bezdek, M. A. Khan, *The geometry of homothetic covering and illumination*, in Discrete
  Geometry and Symmetry, Springer Proc. Math. Stat. 234 (2018) 1–30; arXiv:1602.06040v2.
- A. Glazyrin, *Covering by homothets and illuminating convex bodies*, Proc. Amer. Math. Soc. 150
  (2022) 779–793; arXiv:1905.10516v3.
- H. Martini, C. Richter, M. Spirova, *Illuminating and covering convex bodies*, Discrete Math.
  337 (2014) 106–118; arXiv:1308.0791.
- F. W. Levi, *Überdeckung eines Eibereiches durch Parallelverschiebung seines offenen Kerns*,
  Arch. Math. 6 (1955) 369–370, doi:10.1007/BF01900507.
- V. Boltyanski, H. Martini, P. S. Soltan, *Excursions into Combinatorial Geometry*, Universitext,
  Springer (1997), doi:10.1007/978-3-642-59237-9.
- A. Prymak, *A new bound for Hadwiger's covering problem in E³*, SIAM J. Discrete Math. 37
  (2023) 17–24; arXiv:2112.10698.
