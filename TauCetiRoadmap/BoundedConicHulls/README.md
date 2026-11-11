# Roadmap: Finite boxed conic-union hulls

**Summary.** Develop the reusable interface for a finite union of affine conic sets in a common finite real
box: membership, scaled-copy bounds, zero and positive weights, exact convex hull, and compactness
of the literal lifted system. The same row cone carriers appear in the branches and in the lift.
The zero-weight and empty-branch API makes the formulation usable without choosing points from
empty sets. Closedness is needed only for compactness and the closed-hull conclusion.

## Scope and ownership

There is one finite branch family, a finite physical dimension, branch-dependent finite residual
dimensions, and explicit finite lower and upper bounds. The branch index, individual branches and
the union may be empty. No salience, solidness, proper-cone or feasibility hypothesis is imposed.
For exactness the rows are carriers of `PointedCone ℝ Y`; for compactness they are arbitrary closed
sets. Include the basic API and the acceptance examples below as part of the development.

Unbounded unions, common-recession theorems, general extended-valued perspectives, unrestricted
epigraph heights, whole-GDP ideality, algorithms and solver performance are outside this roadmap.
Rational polyhedra, cone faces and finite-generator slice theory keep their existing APIs; this
roadmap does not redefine them. No optimization objective or minimizer interface is required.

## Conventions

Let `ι` carry `Fintype`, let `n : ℕ`, and let `m : ι → ℕ`. Put `X = Fin n → ℝ` and
`Y i = Fin (m i) → ℝ`. Fix `A i : X →ₗ[ℝ] Y i`, `b i : Y i`, raw row sets `K i : Set (Y i)`
and `l u : X`. The pointwise order makes the box exactly `Set.Icc l u`. A data bundle contains
only these parameters; in the suggested interfaces the row family is a separate argument.

Mathlib's [`PointedCone`](https://github.com/leanprover-community/mathlib4/blob/1b1ccf4b088b32fa3f23f2de1127433254a81e1e/Mathlib/Geometry/Convex/Cone/Pointed.lean)
is a submodule over nonnegative scalars: its carrier contains zero and is closed under addition
and nonnegative scaling. It does **not** mean salient. In particular the whole residual space is
allowed. Use its native coercion, convexity and scaling API; do not introduce another conic predicate.

With `p = (λ,v) : (ι → ℝ) × (ι → X)`, define

- `B i = {x | x ∈ Set.Icc l u ∧ A i x - b i ∈ K i}` and `U = ⋃ i, B i`;
- `L = {p | (∀ i, 0 ≤ λ i) ∧ (∑ i, λ i) = 1 ∧
  (∀ i, A i (v i) - λ i • b i ∈ K i) ∧
  (∀ i j, l j * λ i ≤ v i j ∧ v i j ≤ u j * λ i)}`;
- `sumBlocks p = ∑ i, v i` and `P = {x | ∃ p ∈ L, x = sumBlocks p}`;
- `F = {q : X × ((ι → ℝ) × (ι → X)) | q.2 ∈ L ∧ q.1 = sumBlocks q.2}`.

Use raw row sets in all these definitions. Specialize the exactness theorems by passing the
carriers of `K i : PointedCone ℝ (Y i)`. Expose membership equivalences for `B`, `L`, `P` and `F`
and the image identities `P = sumBlocks '' L` and `F = (fun p => (sumBlocks p,p)) '' L`.
Inverse normalization is always restricted to strictly positive weights.

**Checks.** The branch membership interface must distinguish a feasible zero-residual row,
an empty row created by zero map/offset one/cone `{0}`, and zero physical dimension. Lift
membership must distinguish a valid one-hot point, the impossible simplex for an empty index,
and the forced zero block at zero weight. Projection and full-lift membership must retain the
sum equality, handle an all-empty family, and agree with their continuous-image descriptions.
Use these checks with the concrete instances in the layers; none adds a nonemptiness premise.

## Exact supplier contracts

At the roadmap's dependency pins (Lean `v4.36.0-rc2`, Mathlib
`1b1ccf4b088b32fa3f23f2de1127433254a81e1e`, Tau Ceti
`2fd255d997f47c0b5d834ee416c7015d55444ce5`), the ground suppliers are:

| Supplier | Contract consumed here |
| --- | --- |
| `PointedCone`, `Submodule.zero_mem`, `PointedCone.convex`, `PointedCone.smul_mem`, `PointedCone.smul_mem_iff` | Zero membership, convexity, nonnegative scaling and positive-scaling cancellation on each native row carrier. |
| `Set.Icc`, pointwise order on finite function spaces, `LinearMap` | Coordinate boxes and dependent affine residuals, with no hidden feasibility assumptions. |
| `Convex.sum_mem`, `subset_convexHull`, `convexHull_min`, `convex_convexHull` | Finite convex combinations and the smallest-convex-superset property. |
| `Finset.sum_subset`, `Finset.single_le_sum`, finite-sum inequalities | Restrict to positive support, bound weights, and reconstruct zero blocks. |
| `LinearMap.continuous_of_finiteDimensional`, `isClosed_le`, `isClosed_eq`, `isClosed_iInter`, `IsClosed.preimage` | Closedness of the literal affine-row and box constraints. |
| `isCompact_Icc`, `IsCompact.prod`, `IsCompact.of_isClosed_subset`, `IsCompact.image`, `IsCompact.isClosed` | Compact finite boxes, closed subsets and continuous finite-sum images. |

These are existing Mathlib contracts. The roadmap builds the branch/lift interfaces linking them.
Tau Ceti's scalar perspective monotonicity and closed carrier homogenization are neighboring
constructions: taking a closure there cannot supply this roadmap's nonclosed-cone exactness.
The literal bounded lift must be developed with its own displayed equations.

## How to read the build

This README is the definitive specification. `Suggested.lean` gives complete definitions and
suggested headline signatures; its intentional `sorry` proofs do not certify any result and are
not an exhaustive checklist. The surrounding basic API and all examples are also targets.
Read the layers in order; Layer 3 uses Layer 2 only for its final closed-hull equality.
Use the repository's pinned dependencies and documented `lake exe cache get` / `lake build`
workflow, and run `python3 .github/scripts/check_roadmap_topics.py` for the metadata.

## Layer 1. Scaled boxes and branch interfaces

*Needs:* The definitions and native ordered-field, finite-sum and cone APIs in the supplier table.

For arbitrary raw row sets establish: a block of weight zero is zero; every weight belongs to
`Set.Icc (0 : ℝ) 1`; every copied coordinate satisfies
`min (l j) 0 ≤ v i j ∧ v i j ≤ max (u j) 0`; and every projected point belongs to `Set.Icc l u`.
For `q ∈ F` expose these bounds simultaneously for its physical coordinate, weights and blocks.
The containing product box for `L` is

`Set.Icc (fun _ => 0) (fun _ => 1) ×ˢ
 Set.Icc (fun i j => min (l j) 0) (fun i j => max (u j) 0)`.

For native cone carriers prove positive-weight normalization `(λ i)⁻¹ • v i ∈ B i` and the
one-hot lift of every `x ∈ U`: at the selected branch use weight one and block `x`, elsewhere
weight and block zero. If `B i = ∅`, every feasible lift has weight and block zero there.
Prove `P = ∅` for an empty index type, and for an all-empty branch family. These statements
must not obtain witnesses from zero-weight or empty branches.

### Examples

 A single branch in dimension one with `A = 0`, `b = 0`, row cone `{0}` and bounds
zero and one has `x = 1/2`, weight one and block `1/2`. Check an empty branch beside it using
`A = 0`, `b = 1` and cone `{0}`; the empty branch has zero weight and block. Check empty index,
all-empty branches and inconsistent bounds in a nonzero physical coordinate.

### Dependencies

 The definitions above, ordered-field arithmetic, finite-sum inequalities,
pointwise interval membership and the existing native cone membership/scaling facts.

## Layer 2. Exact finite-union hull

*Needs:* Layer 1 and the finite convex-combination and hull contracts in the supplier table.

For native cone carriers prove that `L` and `P` are convex and prove

`P = convexHull ℝ U`.

One-hot inclusion and convexity give `convexHull ℝ U ⊆ P`. For the reverse inclusion restrict
the finite sum to strictly positive weights, normalize each block into its branch, use the
finite convex-combination API and reconstruct the full sum using the zero-block theorem.
There is no branch-nonemptiness or closedness premise.

### Examples

 Apply exactness to the positive one-dimensional example and to a two-branch example
with unequal residual dimensions, such as one and two. Instantiate the whole residual space
as a closed nonsalient cone to check that no salience or properness hypothesis has appeared.

### Dependencies

 Layer 1 and the hull/finite-combination contracts in the supplier table.

## Layer 3. Compact lift and closed hull

*Needs:* Layer 1 and the continuity/compactness suppliers; Layer 2 only for the last equality.

For arbitrary closed row sets prove `IsClosed L`, containment in Layer 1's explicit product box
and `IsCompact L`. Use the two image descriptions and continuity of finite sums to prove
`IsCompact F`, `IsCompact P` and `IsClosed P`. The statement about `F` retains the displayed
physical coordinate. It makes no assertion about unrelated epigraph coordinates.

For native cone carriers that are also closed combine this with Layer 2 to prove

`closure (convexHull ℝ U) = P`.

### Examples

 Apply compactness to the positive example and the unequal-residual-dimension example.
Check `n = 0` and residual dimensions `m i = 0`, retaining the correct empty or singleton behavior
rather than adding a common nonemptiness premise. Include the empty and inconsistent-bound
cases from Layer 1 and the closed nonsalient cone case from Layer 2.

### Dependencies

 Layer 1, finite-dimensional continuity, closed preimages/intersections,
compact intervals, finite products and continuous images. Layer 2 supplies only the last equality.

## Downstream consumers

A finite disjunctive model with explicit coordinate bounds can use the membership and image API
to exchange the ordinary convex hull for the displayed conic lift. Empty-branch elimination uses
the zero-weight/block interface. Closed-row clients can use compactness of the full displayed
system and closedness of its projection. These are mathematical consumer interfaces, without
an algorithm, performance claim, objective, minimizer or external-oracle premise.

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
  [arXiv:1912.03166v2](https://arxiv.org/abs/1912.03166v2), 4 September 2020, Theorem 4, p. 10:
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
software attribution. No thesis, publisher PDF or source extract is part of this roadmap.
