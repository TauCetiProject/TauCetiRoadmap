# Roadmap: finite boxed conic-union hulls

**Summary.** Develop the interface for a finite union of affine conic sets in a common finite
real box: branch membership, scaled bounds, zero and positive weights, exact convex hull,
and compactness of the displayed lift. The same cone carriers occur in branches and lifts.
Empty branches are allowed. Closedness is needed only for compactness and the closed hull.

## Scope and ownership

There is a finite branch index, a finite original-space dimension, branch-dependent finite
residual dimensions, and finite coordinate bounds. The index, individual branches and union
may be empty. Exactness uses carriers of `PointedCone ℝ (Y i)`; compactness uses arbitrary
closed sets. Neither salience, solidness, properness nor feasibility is assumed.

Unbounded unions, common-summand theorems, general extended-valued perspectives, unrestricted
epigraph heights, whole-GDP ideality, algorithms and solver performance are outside this
bounded roadmap. No optimization objective or minimizer interface is required.

## Conventions

The suggested names `Vec`, `LiftPoint` and `Data` describe the spaces and parameters below.

Let `ι` carry `Fintype`, let `n : ℕ`, and let `m : ι → ℕ`. Write `Vec n = Fin n → ℝ`,
`X = Vec n`, `Y i = Vec (m i)`, and `LiftPoint ι n = (ι → ℝ) × (ι → X)`.
`Data ι n` stores `dim = m`, linear maps `map i = A i : X →ₗ[ℝ] Y i`, offsets
`offset i = b i : Y i`, and bounds `lower = l`, `upper = u : X`. It carries no hypotheses.
The sets `K i : Set (Y i)` are separate parameters. The order on `X` is pointwise, so the box
is `Set.Icc l u`. No consistent-bounds premise is implicit.

For `p = (λ,v) : LiftPoint ι n`, `x` is the original-space point, `v i` the disaggregated
variable of branch `i`, and `λ i` its weight. A one-hot lift of `x ∈ B i` means
`λ = Pi.single i 1`, `v = Pi.single i x` (with a decidable equality on `ι`).
Normalization by `(λ i)⁻¹` is restricted to `0 < λ i`.

Mathlib's [`PointedCone`](https://github.com/leanprover-community/mathlib4/blob/1b1ccf4b088b32fa3f23f2de1127433254a81e1e/Mathlib/Geometry/Convex/Cone/Pointed.lean)
is a submodule over nonnegative scalars: its carrier contains zero and is closed under
addition and nonnegative scaling. It does not mean salient; the whole space is allowed.
Use this interface without introducing a second conic predicate.

## Exact supplier contracts

### From Mathlib

At Mathlib `1b1ccf4b088b32fa3f23f2de1127433254a81e1e`:

| Supplier | Contract consumed here |
| --- | --- |
| `PointedCone`, `Submodule.zero_mem`, `PointedCone.convex`, `PointedCone.smul_mem`, `PointedCone.smul_mem_iff` | Zero membership, convexity, nonnegative scaling and cancellation of positive scaling. |
| `Set.Icc`, pointwise function order, `LinearMap` | Coordinate boxes and branch-dependent affine residuals. |
| `Convex.sum_mem`, `subset_convexHull`, `convexHull_min`, `convex_convexHull` | Finite convex combinations and the smallest convex superset. |
| `Finset.sum_subset`, `Finset.single_le_sum` | Restriction to positive support and bounds for simplex weights. |
| `LinearMap.continuous_of_finiteDimensional`, `isClosed_le`, `isClosed_eq`, `isClosed_iInter`, `IsClosed.preimage` | Continuity and closedness of the affine residual and box constraints. |
| `isCompact_Icc`, `IsCompact.prod`, `IsCompact.of_isClosed_subset`, `IsCompact.image`, `IsCompact.isClosed` | Compact boxes, closed subsets, continuous images and closedness. |

### From Tau Ceti

No Tau Ceti declaration is consumed. At `2fd255d997f47c0b5d834ee416c7015d55444ce5`,
`ConvexOn.antitoneOn_mul_map_div` in `TauCeti/Analysis/Convex/Perspective.lean` is a scalar
perspective inequality; it is not used by these targets.

## How to read the build

Read the layers in order: Layer 1 constructs the branch and lift interfaces, Layer 2 identifies
the convex hull, and Layer 3 establishes compactness and the closed hull. The README is the
definitive specification; `Suggested.lean` gives definitions and selected headline signatures,
with intentional admissions rather than proofs. The basic API and all checks are also targets.

## Layer 1: scaled boxes and branch interfaces

### 1.1 Branches and their union

*Needs:* `Data`, pointwise intervals, linear maps, finite unions.

Define `branch` by `branch D K i = B i = {x | x ∈ Set.Icc l u ∧ A i x - b i ∈ K i}`.

**API.**

- Expose `x ∈ branch D K i ↔ x ∈ Set.Icc l u ∧ A i x - b i ∈ K i`.
- Deduce `branch D K i ⊆ Set.Icc l u`.
- Recover both coordinate bounds and residual membership from branch membership.

**Checks.**

- For `n = 1`, `A = 0`, `b = 0`, `K = {0}`, box `[0,1]`, the branch is `[0,1]`.
- With the same box, `A = 0`, `b = 1`, `K = {0}`, the branch is empty.
- If `n = 0`, the original space is a singleton; the residual condition `-b i ∈ K i` decides whether the branch is empty.

Define `boundedUnion` by `boundedUnion D K = U = ⋃ i, B i`.

**API.**

- Expose `x ∈ boundedUnion D K ↔ ∃ i, x ∈ branch D K i`.
- Each `branch D K i` is a subset of `boundedUnion D K`.
- Deduce `boundedUnion D K ⊆ Set.Icc l u`.

**Checks.**

- An empty index gives `U = ∅`.
- An all-empty branch family gives `U = ∅`.
- Adding the empty branch above to the interval branch leaves `U = [0,1]`.

### 1.2 The scaled-box lift and its projections

*Needs:* 1.1, finite sums and scalar multiplication.

Define `lift` by `lift D K = L` by

`L = {(λ,v) | (∀ i, 0 ≤ λ i) ∧ (∑ i, λ i) = 1 ∧
 (∀ i, A i (v i) - λ i • b i ∈ K i) ∧
 (∀ i j, l j * λ i ≤ v i j ∧ v i j ≤ u j * λ i)}`.

This is the finite scaled-box HR-Cone construction of Bernal Neira–Grossmann,
arXiv v3 p. 8, publisher p. 260.

**API.**

- Expose the displayed conjunction as the membership equivalence for `lift`.
- Extract simplex membership, each residual condition `A i (v i) - λ i • b i ∈ K i`
  and each scaled coordinate bound separately.
- Assemble lift membership from these four groups of constraints.

**Checks.**

- The interval branch from 1.1 admits `λ = 1`, `v = 1/2`.
- An empty index makes the simplex equation impossible.
- A zero weight forces its block to zero even for arbitrary sets `K i`.

Define `sumBlocks` by `sumBlocks p = ∑ i, p.2 i`.

**API.**

- Expose the defining finite-sum identity and its coordinatewise form.
- Prove that `sumBlocks` is linear and continuous.
- Evaluate it on a one-hot block family as the selected block.

**Checks.**

- The sum over an empty index is zero.
- Two constant scalar blocks `1/4` and `1/2` sum to `3/4`.
- For `ι = Fin 3`, the one-hot block family `Pi.single 1 w` has `sumBlocks = w`
  for every `w`, including `w = 0`.

Define `projection` by `projection D K = P = {x | ∃ p ∈ L, x = sumBlocks p}`.

**API.**

- Expose `x ∈ projection D K ↔ ∃ p ∈ lift D K, x = sumBlocks p`.
- Prove `projection D K = sumBlocks '' lift D K`.
- Map every lift member into the projection and recover a lift witness for every projected point.

**Checks.**

- For the interval branch of 1.1, `P = [0,1]`; summing weights instead of blocks
  would give `{1}`.
- Empty index gives `P = ∅` despite `sumBlocks` being zero.
- For the interval lift `λ = 1`, `v = 1/2`, the projected point is `1/2`;
  changing only that point to `0` violates the sum equality.

Define `fullLift` by `fullLift D K = F = {q : X × LiftPoint ι n | q.2 ∈ L ∧ q.1 = sumBlocks q.2}`.

**API.**

- Expose its displayed membership equivalence.
- Prove `fullLift D K = (fun p => (sumBlocks p, p)) '' lift D K`.
- Prove `Prod.fst '' fullLift D K = projection D K` and `Prod.snd '' fullLift D K = lift D K`.

**Checks.**

- Retain `(1/2, (1,1/2))` for the single interval branch.
- Changing only its original-space point to zero violates the sum equality.
- Empty index gives `F = ∅`.

### 1.3 Weight and block bounds

*Needs:* 1.2, ordered-field arithmetic and finite-sum inequalities.

For arbitrary sets `K i`, prove the zero-block property: `p ∈ L` and `λ i = 0` imply `v i = 0`
(Gusev–Bernal Neira, arXiv v2, Proposition 1, p. 8, zero-weight proof; and the
finite-scaled-bound discussion preceding Proposition 2, p. 10).
Prove every weight lies in `[0,1]`, every coordinate satisfies
`min (l j) 0 ≤ v i j ≤ max (u j) 0`, and every projected point lies in `Set.Icc l u`.
Expose these simultaneously for the original-space point, weights and blocks of `q ∈ F`.
The containing product box for `L` is

`Set.Icc (fun _ => 0) (fun _ => 1) ×ˢ
 Set.Icc (fun i j => min (l j) 0) (fun i j => max (u j) 0)`.

**Checks.**

- With box `[1,2]`, a zero-weight block is zero, outside the unscaled box.
- With box `[-1,2]` and weight `1/2`, a scalar block lies in `[-1/2,1]`.
- If `l j > u j` for some coordinate `j`, then the scaled inequalities force
  every weight to zero, contradicting `∑ i, λ i = 1`; hence `L = P = F = ∅`.

### 1.4 Normalization and one-hot lifts

*Needs:* 1.1–1.3 and `PointedCone.smul_mem`, `PointedCone.smul_mem_iff`.

For carriers of `K i : PointedCone ℝ (Y i)`, prove the normalization property: if `p ∈ L`
and `0 < λ i`, then `(λ i)⁻¹ • v i ∈ B i` (Ben-Tal–Nemirovski, proof of
Proposition 3.3.5, p. 101, normalization by positive weights). Every `x ∈ B i` has the
one-hot lift defined in Conventions (ibid., equation (3.3.24), p. 100, specializing to
a single nonzero weight). Prove the empty-branch property: if `B i = ∅`, every member
of `L` has `λ i = 0` and `v i = 0`, by normalization and the zero-block property.
An all-empty branch family gives `P = ∅` by the simplex equation.

**Checks.**

- For the interval branch, weight `1/2` and block `1/4` normalize to `1/2`.
- The empty branch in 1.1 has weight and block zero alongside that interval branch.
- Without the cone assumptions, the all-empty conclusion fails: take two branches with
  `A i = 0`, `b i = -2`, `K i = {1}`, box `[0,1]`. Each branch is empty, but
  `λ = (1/2,1/2)`, `v = (0,0)` and `v = (1/2,1/2)` are lift members projecting to zero
  and one, respectively.

### Examples

The interval branch in 1.1 has `λ = 1`, `v = 1/2` as a lift point. The two-branch
noncone control in 1.4 has an empty union but projected points `0` and `1`.

### Dependencies

This layer uses Mathlib `Set.Icc`, `LinearMap`, the pointed-cone scaling API including
`PointedCone.smul_mem_iff`, and finite sums including `Finset.single_le_sum`.
It consumes no other roadmap.

## Layer 2: exact finite-union hull

### 2.1 Exact hull

*Needs:* 1.1–1.4 and the finite convex-combination and convex-hull suppliers.

For carriers of `K i : PointedCone ℝ (Y i)`, prove that `L` and `P` are convex, and
prove `hull_exact`:

`projection D K = convexHull ℝ (boundedUnion D K)`.

The source connection is the bounded case of Bernal Neira–Grossmann Theorem 1(2), `W = {0}`
(arXiv v3 pp. 7–8; publisher pp. 259–260), and Ben-Tal–Nemirovski Proposition 3.3.5(i),
printed p. 100. Those source statements assume nonempty sets and closed proper or
conic-quadratic representations. Here the explicit scaled bounds support empty branches and
cones without closedness; this is the stated bounded variant, not their full unboxed theorem.

One-hot inclusion and convexity give `convexHull ℝ U ⊆ P`. For the reverse inclusion restrict
to strictly positive weights, normalize each corresponding block, apply the finite
convex-combination API, and reconstruct the sum using the zero-block property. Do not choose points
from empty or zero-weight branches.

**Checks.**

- In box `[0,3]`, take scalar branches `[0,1]` (`A = id`, `b = 1`, `K = (-∞,0]`)
  and `[2,3]` (`A = id`, `b = 2`, `K = [0,∞)`). Weights `(1/2,1/2)` and blocks
  `(1/2,1)` give `3/2 ∈ P` outside `U`.
- In box `[0,1]`, let branch 1 have `Y 1 = ℝ`, `A 1 x = x`, `b 1 = 0`,
  `K 1 = [0,∞)`. Let branch 2 have `Y 2 = ℝ²`, `A 2 x = (x,-x)`, `b 2 = 0`,
  and the nonsalient cone `K 2 = ℝ²`. Then `U = P = [0,1]`, and
  `λ = (1/2,1/2)`, `v = (1/2,1/2)` is a lift point over `1`.
- Dropping zero membership can destroy exactness: in box `[0,1]`, branch 1 has
  `A = b = 0`, `K = {0}`, and branch 2 has `A = b = 0`, `K = (0,∞)`.
  Then `U = [0,1]` but `L = P = ∅`, because branch 2's residual is always zero.

### Examples

The branches `[0,1]` and `[2,3]` in box `[0,3]` have `P = [0,3]`. For `x ∈ [0,1]`,
use only branch 1; for `x ∈ [2,3]`, use only branch 2. For `1 ≤ x ≤ 2`, weights
`(2-x,x-1)` on branch points `1` and `2` give blocks `(2-x,2(x-1))` summing to `x`.

### Dependencies

Use 1.1–1.4, Mathlib `Convex.sum_mem`, `subset_convexHull`, `convexHull_min` and
`convex_convexHull`. It consumes no other roadmap.

## Layer 3: compact lift and closed hull

### 3.1 Compactness

*Needs:* 1.2–1.3 and the continuity, closedness and compactness suppliers.

For arbitrary closed sets `K i`, prove `IsClosed L`, containment in 1.3's product box,
and `isCompact_lift`: `IsCompact L`. The continuous-image descriptions give
`isCompact_fullLift`: `IsCompact F`, `isCompact_projection`: `IsCompact P`, and `IsClosed P`.
The full lift includes the original-space point and makes no assertion about additional
epigraph coordinates. These bounded-lift compactness targets follow the explicit scaled
bounds in HR-Cone (Bernal Neira–Grossmann arXiv v3 p. 8; publisher p. 260) and compact
finite-dimensional boxes.

**Checks.**

- For the two intervals in 2.1,
  `L = {(s,1-s,v₁,v₂) | 0 ≤ s ≤ 1, 0 ≤ v₁ ≤ s, 2(1-s) ≤ v₂ ≤ 3(1-s)}`.
  This closed set lies in `[0,1]² × [0,3]²`, and `P = [0,3]`.
- Take `n = 0`, `ι = Fin 2`, `m = (0,1)`, `A 1 = A 2 = 0`, `b 1 = 0`,
  `K 1 = {0}`, `b 2 = 1`, `K 2 = [0,∞)`. Then `B 2 = ∅`,
  `L = {((1,0),0)}` and `P = {0}`: compact, with an empty branch and a
  zero-dimensional residual space in branch 1.
- Closedness is necessary: with one scalar branch in `[0,1]`, put `Y = ℝ²`,
  `A x = (x,0)`, `b = (0,-1)`, `K = {(a,c) | a > 0} ∪ {0}`. This is a
  `PointedCone` carrier without closedness. Here `B = P = (0,1]`; thus `P` and the
  one-branch lift are not closed or compact.

### 3.2 Closed hull

*Needs:* 2.1, 3.1 and `IsCompact.isClosed`.

For closed carriers of `PointedCone ℝ (Y i)`, prove `closed_hull_exact`:

`closure (convexHull ℝ (boundedUnion D K)) = projection D K`.

The source connection is Bernal Neira–Grossmann Theorem 1(2) with `W = {0}` (arXiv v3
pp. 7–8; publisher pp. 259–260) and Ben-Tal–Nemirovski Proposition 3.3.5(i), proof on
printed pp. 100–102, with the same bounded-variant qualification as 2.1.

**Checks.**

- The two intervals in 2.1 have closed hull `[0,3]`.
- For the unequal-dimension nonsalient-cone example in 2.1,
  `closure (convexHull ℝ U) = [0,1] = P`. For empty `ι`, both sides are `∅`.
- In the nonclosed-cone example in 3.1, `closure (convexHull U) = [0,1] ≠ P = (0,1]`.

### Examples

The explicit two-interval lift in 3.1 is closed and contained in `[0,1]² × [0,3]²`;
its sum image is `[0,3]`. The zero-dimensional example has a singleton lift and image.

### Dependencies

Use 1.2–1.3 for 3.1, then 2.1 and 3.1 for 3.2. The Mathlib suppliers include
`isCompact_Icc`, `IsCompact.of_isClosed_subset`, `IsCompact.image` and
`IsCompact.isClosed`. It consumes no other roadmap.

## Downstream consumers

A finite disjunctive model with coordinate bounds can use the membership and image API to
exchange its convex hull for the displayed lift. Empty-branch elimination uses the zero-weight
and zero-block interface. Clients with closed `K i` obtain compactness of the displayed system and
closedness of its projection.

## References

The relevant published mathematics supplies provenance and application context; this roadmap
makes no mathematical novelty claim. Its bounded construction is a qualified interpretation
of the adopted conic-union statement and the explicit finite scaled-box HR-Cone formulation,
including empty-branch interfaces. It does not formalize the unrestricted perspective or
common-recession theory.

- D. E. Bernal Neira and I. E. Grossmann, *Convex mixed-integer nonlinear programs derived from
  generalized disjunctive programming using cones*, Computational Optimization and Applications
  88 (2024), 251–312, [DOI](https://doi.org/10.1007/s10589-024-00557-9): Theorem 1 and equation (2),
  printed pp. 259–260; HR-Cone, p. 260. The adopted theorem gives general inclusions and equality
  conditional on nonempty bounded summands plus a shared closed convex summand. The finite scaled
  bounds of HR-Cone motivate the literal construction here. Corresponding versions are
  [arXiv:2109.09657v1](https://arxiv.org/abs/2109.09657v1), Theorem 1/HR-Cone pp. 10–11, and
  [v3](https://arxiv.org/abs/2109.09657v3), pp. 7–8.
- A. Lodi, M. Tanneau and J. P. Vielma, *Disjunctive cuts in Mixed-Integer Conic Optimization*,
  [arXiv:1912.03166v2](https://arxiv.org/abs/1912.03166v2), version 2 (title page: 8 September 2020), Theorem 4, p. 10:
  the proper-cone sandwich and common-summand result adopted by the preceding source.
- A. Ben-Tal and A. Nemirovski, *Lectures on Modern Convex Optimization* (2001),
  [author-hosted version](https://www2.isye.gatech.edu/~nemirovs/LMCOBookSIAM.pdf), Proposition
  3.3.5, printed pp. 99–102 in the inspected 2001/6/18 layout, for conic-quadratic representable
  sets. The preceding sources print the locator Proposition 2.3.5; no identity of uninspected
  editions is assumed.
- S. Ceria and J. Soares, *Convex programming for disjunctive convex optimization*, Mathematical
  Programming 86 (1999), 595–614, [DOI](https://doi.org/10.1007/s101070050106), Theorem 1 and
  discussion, pp. 600–601: closed-perspective and empty-branch context with its stated hypotheses.
- S. Gusev and D. E. Bernal Neira, *Exact Hull Reformulation for Quadratically Constrained
  Generalized Disjunctive Programs*, [arXiv:2508.16093v2](https://arxiv.org/abs/2508.16093v2),
  17 March 2026, Proposition 1, p. 8, and Proposition 2, p. 10: later finite-scaled-bound and
  positive-semidefinite conic-epigraph context. Its nonconvex quadratic reformulation and
  computational claims are outside this roadmap.

### Software provenance

The author-owned [complete retained library](https://github.com/bernalde/complete-retained-library/tree/59c355eb14ed1eff9664736428ca02b4543200b8)
contains the bounded construction in [Chapter08ContinuousHull.lean](https://github.com/bernalde/complete-retained-library/blob/59c355eb14ed1eff9664736428ca02b4543200b8/lean-modern/Chapter08ContinuousHull.lean),
[Chapter08HullCompact.lean](https://github.com/bernalde/complete-retained-library/blob/59c355eb14ed1eff9664736428ca02b4543200b8/lean-modern/Chapter08HullCompact.lean) and the zero-weight lemma in
[Chapter08.lean](https://github.com/bernalde/complete-retained-library/blob/59c355eb14ed1eff9664736428ca02b4543200b8/lean-modern/Chapter08.lean), with Apache-2.0 software notices. This is secondary provenance,
not the specification or an assertion that those modules have been ported to Tau Ceti. Reuse its
mathematical proof strategy while adopting the native interfaces above and preserving applicable
software attribution.
