# Roadmap: successive minima and Minkowski's theorems

**Summary.** This roadmap develops the successive minima of a convex body with respect to a lattice,
and both sharp halves of Minkowski's second theorem, in a finite-dimensional real normed space with
an arbitrary additive Haar measure. It also covers the hermitian Gram–Hadamard bound, integral bases
with a prescribed flag, and Minkowski's linear forms theorem. We want it because these are the basic
quantitative tools of the geometry of numbers: Siegel's lemma and its Bombieri–Vaaler form, bases
of unit lattices of controlled height, the Subspace Theorem, lattice-point counting and reduction
theory all start from them.

The roadmap builds on Mathlib's `ZLattice`, `ConvexBody`, `gauge` and Minkowski's first theorem. It
adopts the foundational successive minima of
[Mathlib PR #35812](https://github.com/leanprover-community/mathlib4/pull/35812) and adds a
real-valued `Fin d`-indexed adapter. On that adapter it proves:
- the gauge-threshold calculus;
- attainment of all minima by one independent family, for bodies that need not be symmetric;
- monotonicity in the body and the lattice, and transport along linear equivalences;
- an integral basis whose flag contains the strict sublevels;
- both halves of Minkowski's second theorem, with equality on weighted cross-polytopes and boxes.

The end theorems are `minkowski_second_lower` (2.1.4) and `minkowski_second_upper` (3.21).

| Layer | Construction |
| --- | --- |
| 0 | Gram determinants and integral bases with a prescribed flag |
| 1 | Successive minima |
| 2 | Minkowski's lower inequality and the linear forms theorem |
| 3 | Minkowski's upper inequality |

Layer 1 needs Layer 0.2 only for the integral minimum flag (1.13). Layer 2 needs Layer 1. Layer 3
needs Layer 1 and the transport argument of 2.1.4. Layer 0.1 is independent of the rest.

Suggested home: `TauCeti/MeasureTheory/Group/GeometryOfNumbers/` for `MeasureTheory.successiveMin`
and Layers 1–3, beside Mathlib's `Mathlib/MeasureTheory/Group/GeometryOfNumbers.lean`;
`TauCeti/Analysis/InnerProductSpace/` for Layer 0.1; and `TauCeti/Algebra/Module/ZLattice/` for
Layer 0.2.

## Scope and boundaries

### Owned here

- The hermitian Gram–Hadamard inequality and its coordinate form (0.1).
- The integral basis with the flags of a prescribed real basis of lattice vectors (0.2).
- The foundational `MeasureTheory.successiveMin` of Mathlib PR #35812, its real `Fin d` adapter
  `successiveMin` and the natural-index extension `successiveMinNat`, with:
  - the threshold calculus;
  - positivity and monotonicity in the index;
  - attainment by one real basis;
  - monotonicity in the body and the lattice;
  - scaling and transport along linear equivalences;
  - the integral minimum flag (Layer 1).
- Minkowski's second theorem, both halves, with an explicit additive Haar measure, and the box and
  cross-polytope minima that show both are sharp (2.1, 3).
- Minkowski's linear forms theorem with its boundary convention (2.2).

### Already in Mathlib or Tau Ceti

These are used without restatement:
- Blichfeldt's theorem, `MeasureTheory.exists_pair_mem_lattice_not_disjoint_vadd`.
- Minkowski's first theorem in its strict and compact forms,
  `MeasureTheory.exists_ne_zero_mem_lattice_of_measure_mul_two_pow_lt_measure` and
  `…_le_measure`.
- The Gram determinant of the image of an orthonormal basis as a squared normal determinant,
  `LinearMap.normDet_sq_eq_det_gram`.
- The squared covolume as a Gram determinant, Tau Ceti's `ZLattice.covolume_sq_eq_det_gram`.
- In Tau Ceti, in `TauCeti/Algebra/Module/ZLattice/AdaptedBasis.lean` and `GaugeBasis.lean`:
  - the triangular, reduced lattice basis adapted to a real basis of lattice vectors,
    `ZLattice.exists_basis_triangular`;
  - the lattice basis of controlled gauge, `ZLattice.exists_basis_gauge_le` and
    `ZLattice.exists_basis_gauge_le_max_one_mul` (Cassels, Ch. V, Lemma 8).
- Tau Ceti's squared-norm successive minima of a positive definite integral lattice,
  `TauCeti.IntegralLattice.successiveMinimum`, and its Minkowski bound
  `TauCeti.IntegralLattice.IsPosDef.prod_successiveMinimum_mul_pi_pow_le`. Those are natural numbers
  on the `IntegralLattice` carrier, bounded through the Euclidean ball. The minima here are real
  numbers on `ConvexBody` carriers, bounded by the exact volume of the body.

### Not owned here

Other geometry of numbers built on this roadmap is out of scope, including:
- the comparison between the real minima here and Tau Ceti's squared-norm minima;
- covolumes of orthogonal projections, duals and primitive intersections;
- ordered-product and ball-volume bounds;
- lattice-point counting, transference, star bodies and reduction theory.

Siegel's lemma, Bombieri–Vaaler and the heights of lattices belong to
[DiophantineApproximationAndTranscendence](../DiophantineApproximationAndTranscendence/README.md)
and [HeightsAndUnits](../HeightsAndUnits/README.md).

## Conventions

**Lattices and volumes.** A lattice is a `Submodule ℤ E` with `DiscreteTopology` and
`IsZLattice ℝ`. A lattice of lower rank is moved into its real span before any volume is taken.
Minkowski's second theorem takes any explicit additive Haar measure `μ` on a finite-dimensional real
normed space and uses `μ` for both the body measure and `ZLattice.covolume L μ`. Euclidean volume
targets use the canonical volume of the space in question, with volume `1` in dimension zero. Gram
matrices use Mathlib's convention that the inner product is conjugate-linear in the first argument.
An oriented determinant is never used as a covolume.

**Convex bodies and minima.** A body is a `ConvexBody E` with `0` in its interior. Central symmetry
is a separate hypothesis, assumed only where stated. The gauge is Mathlib's `gauge`. The successive
minima are real numbers indexed by `i : Fin d`, `d = finrank ℝ E`, with `i` meaning the `(i+1)`-st
minimum. There is no minimum in dimension zero. The polar of a box is a weighted cross-polytope.

**Mathlib PR #35812.** Build `MeasureTheory.successiveMin` here, with the name, signature and
definition of
[revision `8423d1c`, lines 63–304](https://github.com/khwilson/mathlib4/blob/8423d1c878e50d8504a230ffd9b6ec76ce6a08eb/Mathlib/MeasureTheory/Group/GeometryOfNumbers.lean#L63-L304),
so that adopting the PR when it lands is a deletion plus an import. The
[Zulip design discussion](https://leanprover-community.github.io/archive/stream/217875-Is-there-code-for-X%3F/topic/Minkowski.20Lattice.20Theorem.html)
motivates the arbitrary-set core and the separate geometric hypotheses. Reuse the PR's monotonicity,
threshold-attainment and directional-family and basis results with their hypotheses. A directional
basis is a real ambient basis, not necessarily an integral lattice basis. The PR's `proof_wanted`
form of Minkowski's second theorem supplies no proof. Both product inequalities, the gauge flags and
the transport laws are targets here.

## Headline signatures

The opening theorem block of `Suggested.lean` states `minkowski_second_lower` (2.1.4) and
`minkowski_second_upper` (3.21) against the real-valued adapter `successiveMin` (1.1). The source
locators and checks for these signatures are in their numbered targets below.

## Layer 0: Gram determinants and integral bases with a prescribed flag

### 0.1 Gram determinants and the Hadamard inequality

Prove `orthonormal_coordinate_hadamard` (0.1.1): for an orthonormal basis `b : Fin n → E` over an
`RCLike` field and any `v : Fin n → E`, `‖det_b(v)‖ ≤ ∏ i, ‖v_i‖`.
`b` is a full orthonormal basis; `n = 0` and dependent families are allowed.
For every family, dependent or not, Mathlib's Gram–Schmidt orthonormal basis `e` of `v` has
`det_e(v) = ∏ i, ⟪e_i, v_i⟫`, and each factor has norm at most `‖v_i‖`. The determinants `det_b`
and `det_e` differ by the determinant of an orthonormal change of basis, which has norm one.
(Source: Couveignes2020, §3, printed p.494 (physical PDF p.8), Gram/covolume calculation.)
*Needs:* Mathlib `InnerProductSpace.gramSchmidtOrthonormalBasis`,
`InnerProductSpace.gramSchmidtOrthonormalBasis_det`, `norm_inner_le_norm`,
`Orientation.abs_volumeForm_apply_le`, `LinearMap.normDet_sq_eq_det_gram`.
**Checks.**

- Orthogonal real columns (2,0),(0,3) attain determinant norm 6 and product norm 6.
- Columns (1,0),(1,1) have determinant norm 1 and product norm √2; equality fails.
- Duplicate nonzero columns have determinant 0 and positive product norms.

Prove `hermitian_gram_hadamard` (0.1.2): for any `v : Fin n → E` in a normed `RCLike`
inner-product space, `det Gram(v)` is the scalar image of its real part, and
`0 ≤ Re(det Gram(v)) ≤ ∏ i, ‖v_i‖²`. The ambient space need not be finite-dimensional.
`E` is normed, not merely seminormed; `n` may be zero. There is no linear independence or
nonsingularity assumption.
Reality and nonnegativity are positive semidefiniteness of the Gram matrix. For the bound, a
dependent family has Gram determinant zero. An independent one is a basis of its `n`-dimensional
span, where the Gram entries are unchanged. For an orthonormal basis `b` of that span
`det Gram(v) = ‖det_b(v)‖²`, which 0.1.1 bounds.
(Source: Couveignes2020, §3, printed p.494 (physical PDF p.8), Gram/covolume calculation.)
*Needs:* Mathlib `Matrix.det_gram_ne_zero_iff_linearIndependent`, `Matrix.posSemidef_gram`,
`finrank_span_eq_card`, `LinearMap.normDet_sq_eq_det_gram`, 0.1.1
`orthonormal_coordinate_hadamard`.
**Checks.**

- The empty Gram determinant and diagonal product both equal 1.
- Family (1,i) in ℂ has Gram [[1,i],[−i,1]], determinant 0 and diagonal product 1. The
  unconjugated matrix [[1,i],[i,−1]] also has determinant 0, so this family does not test
  conjugation.
- The single vector i in ℂ has Gram determinant 1, whereas its unconjugated bilinear Gram
  determinant i·i = −1 is negative: conjugation is what makes the determinant nonnegative.
- Real vectors (1,0),(1,1) have Gram [[1,1],[1,2]], determinant 1 and diagonal product 2.
- A single vector has Gram determinant `‖v₀‖²`, the equality case of the bound. In `ℂ²` the vectors
  `(1,0),(0,i)` have Gram determinant 1 and coordinate determinant of squared norm 1.

Prove `gram_uniform_bound` (0.1.3): if `D ≥ 0` and every `v_i` in `v : Fin n → E` satisfies
`‖v_i‖² ≤ D`, then `Re(det Gram(v)) ≤ D^n`.
The bound is on squared norms, not individual coefficients; `n = 0` is allowed.
(Source: Couveignes2020, §3, printed p.494 (physical PDF p.8), Gram/covolume calculation.)
*Needs:* 0.1.2 `hermitian_gram_hadamard`.
**Checks.**

- `n = 0`, `D = 0` gives `1 ≤ 0^0 = 1`.
- A nonempty zero family with `D = 0` has determinant 0.
- Two orthogonal vectors of squared norm 5 attain determinant 25, so replacing `D^n` by `D` fails.

### 0.2 Integral bases with a prescribed flag

`E` is a finite-dimensional real normed space, `L` a discrete `ℤ`-submodule, and
`d = finrank ℝ E`. Reuse `Basis` and `Basis.flag`. Flag indices are zero-based.

Prove `exists_integral_basis_same_flag` (0.2.1): for a real basis `w : Fin d → E` with `w_i ∈ L`,
there is an integral basis `b : Fin d → L` whose real extension has exactly the same basis flags as
`w` at every `k = 0, …, d`.
Equality concerns real prefix spans, not equality of the vectors or of their integral spans. The
`w_i` need not be an integral basis. `L` is full as a consequence, not a hypothesis.
Tau Ceti's `ZLattice.exists_basis_triangular` gives an integral basis `b` with `b_j` in the real
span of `w_0, …, w_j`. So the `k`-th flag of `b` lies in that of `w`. Both have dimension `k`,
because `b` is real-linearly independent: its real span contains every `w_i`, so it is all of `E`.
(Source: Cassels, Ch. I, Theorem I; Henk2002, p.3, prefix-span equality and (2.1).)
*Needs:* Tau Ceti `ZLattice.exists_basis_triangular`; Mathlib `Module.Basis.flag`,
`Module.Basis.span`, `linearIndependent_of_top_le_span_of_card_eq_finrank`,
`Submodule.eq_of_le_of_finrank_eq`, `finrank_span_eq_card`.
**Checks.**

- The columns (1,1),(1,−1) have determinant −2: an independent integral-valued real basis is not
  necessarily an integral basis.
- For the standard real basis of ℝ³, x lies in flag 2 exactly when `x_2 = 0`.
- For `w = ((2,0),(0,1))` in ℤ², every admissible `b` has `b_0 = ±(1,0)`: the first vector is the
  primitive generator of `L ∩ ℝ·w_0`, not `w_0` itself.
- In dimension zero the empty basis is the only one, and its single flag is the zero space.

### Examples

The basis `(2,0),(0,3)` spans a lattice of covolume `6` and Gram determinant `36 = 6²`, as
`ZLattice.covolume_sq_eq_det_gram` predicts, and 0.1.2 is an equality for it. The unimodular shear
`(1,0),(1,1)` of the standard basis has Gram determinant `1 < 2 = ‖(1,0)‖²‖(1,1)‖²`. The empty
family in the zero space has Gram determinant `1`.

### Dependencies

Mathlib `Matrix.gram`, `InnerProductSpace.gramSchmidtOrthonormalBasis`,
`LinearMap.normDet_sq_eq_det_gram` and `Module.Basis.flag`; Tau Ceti
`ZLattice.exists_basis_triangular`.

## Layer 1: Successive minima

This layer defines the successive minima `λ_i(L, K)` of a convex body `K` with `0` in its interior
with respect to a discrete full lattice `L`, as real numbers indexed by `Fin d` with `d = dim E`.
It proves their gauge-threshold calculus and their attainment by one independent family, for bodies
that need not be symmetric. It proves their monotonicity in the body and the lattice and their
transport along linear equivalences. It ends with the integral minimum flag (1.13). The minima are
defined on the carriers `IsZLattice` and `ConvexBody`, and the symmetry hypothesis is imposed only
where a statement needs it.

The symmetric-body source for the definition and gauge calculus of 1.1–1.7 and the scaling law of
1.10 is Evertse2023, §2.3, Lemma 2.8, printed pp.23–24 (physical pp.13–14). The proofs below also
give the stated nonsymmetric extension.

*Standing hypotheses.* `E` is a finite-dimensional real normed vector space; `L` is a discrete full
`ℤ`-submodule (the `IsZLattice` carrier). `K` is a `ConvexBody E` with `0` in its interior. No
replacement gauge or lattice carrier is introduced. Write `d = finrank ℝ E`. An index `i : Fin d`
means the source's `(i.val+1)`-st minimum. There is no minimum to evaluate when `d = 0`. Symmetry is
assumed only in statements that need it.

For the coordinate checks in ℤ², write `K₂₃ = [−1/2,1/2]×[−1/3,1/3]` and
`K₃₂ = [−1/3,1/3]×[−1/2,1/2]`. Their gauges are respectively `max(2|x₀|,3|x₁|)` and
`max(3|x₀|,2|x₁|)`; both have ordered minima (2,3).

**Definition** (1.1). Define `MeasureTheory.successiveMin L s i`, for a `ℤ`-submodule `L` of a real
normed space `E`, an arbitrary set `s` and `i : ℕ`, as
`sInf {r : ℝ≥0 | i < Set.finrank ℝ (r • s ∩ L)}`, following the Mathlib proposal. Define
`successiveMin L K i`, for `K : ConvexBody E` and `i : Fin d`, as
`(MeasureTheory.successiveMin L (K : Set E) i.val : ℝ)`.

In finite dimension prove `successiveMin_def`: the adapter is the real infimum of the `t > 0` such
that the dilate `t·K` contains `i.val+1` real-linearly independent vectors of `L`. This is a
real-valued function on carriers. The `Fin d` index excludes every index `≥ d`, at which no such `t`
exists and the infimum would be the junk value `sInf ∅ = 0`. Its geometric laws require `L` discrete
and full and `0 ∈ interior K`; central symmetry is needed for Minkowski's product inequalities.

The proof of `successiveMin_def` uses the equivalence between the finite rank threshold and an
independent family of length `i.val+1`. Zero dilation has rank zero, and both infima give zero for
an empty threshold set. This comparison needs finite dimension but no discreteness, fullness,
interior or symmetry. The gauge-threshold, attainment, monotonicity and transport API is 1.2–1.12;
the integral minimum flag is 1.13. The prescribed box and cross-polytope minima are
`successiveMin_box` (2.1.5) and `successiveMin_crosspolytope` (2.1.6).

For a closed body with zero in its interior and `t > 0`, `x ∈ t·K` exactly when `gauge K x ≤ t`,
and only the zero vector has gauge zero. This identifies the dilation infimum with the least gauge
threshold of `successiveMin_isLeast`, which is how the gauge calculus below is read off the
definition.
*Needs:* Mathlib `ConvexBody`, `gauge`, `gauge_le_one_iff_mem_closure`, `finrank_span_eq_card`,
`gauge_closedBall`.
**Checks.**

- For `L = ℤ ⊂ ℝ` and `K = [−2,2]`, `λ_0(L,K) = 1/2`.
- For `L = ℤ²` and `K = K₂₃`, `(λ_0, λ_1) = (2,3)`, attained by `e₀, e₁` in that order.
- For the zero lattice in `ℝ^0` and its singleton convex body, the product over all minima indices
  is 1.
- For `L = 2ℤ` in ℝ and `K = [−1,1]`, `λ_0 = 2`, not 1.
- On `K = closedBall(0,1)`, the gauge-threshold condition of `successiveMin_isLeast` is
  `dim span{x ∈ L : ‖x‖ ≤ r} ≥ i.val+1`.
- In ℤ² with the unit square, vectors (1,1),(1,−1) independently attain both minima 1, but their
  integral span has index two.
- In ℤ and `K = [−1,1]`, the attained minimum 1 has nonzero boundary witnesses; the strict sublevel
  `{x ∈ ℤ : gauge K x < 1}` is `{0}`.
- For a lattice that is not full (`ℤ(1,0)` in `ℝ²`) the minima beyond the rank are the junk value
  `0` of `sInf ∅` in both definitions; the comparison still holds. The geometric laws of this
  layer retain `IsZLattice ℝ L`.
- For the nondiscrete subgroup `ℤ + ℤ√2` in ℝ and `K = [−1,1]`, both definitions give zero; the
  adapter identity does not assert attainment or positivity.

**Natural-index extension** (1.1a). Define `successiveMinNat L K i` for `i : ℕ` to be
`successiveMin L K ⟨i, hi⟩` if `hi : i < d`, and zero otherwise. Prove `successiveMinNat_of_lt` for
the first branch and `successiveMinNat_of_le` for `d ≤ i`. The extension is zero-based, so an index
`i` below `d` still denotes the source's `(i+1)`-st minimum. These identities are definitional and
need no discreteness, fullness, interior or symmetry hypotheses. In finite dimension prove
`successiveMinNat_eq`: `successiveMinNat L K i = (MeasureTheory.successiveMin L (K : Set E) i : ℝ)`
for every natural index, using the zero rank threshold beyond `d`. They apply when a dimension
formula is a proved equality rather than a definitional one. Positivity and monotonicity concern the
restriction to indices below `d`; the zero extension need not be monotone on ℕ.
(Source: Evertse2023, §2.3, definition of successive minima, printed p.23, with the zero-based
reindexing of 1.1; the out-of-range value is the explicit convention here.)
*Needs:* 1.1 `successiveMin` and Mathlib `Fin`.
**Checks.**

- For ℤ² and `K₂₃`, the natural-index values at 0, 1 and 2 are 2, 3 and 0; index 2 is not a third
  positive minimum.
- In dimension zero every natural-index value is zero in both the adapter and the foundational
  definition, while the product over `Fin 0` remains one.
- For a space with proved dimension `d · card ι`, with `d = 2` and `card ι = 3`, index `d · 1 = 2`
  denotes the third minimum, and index 6 has value zero. The proof of the dimension formula supplies
  the bound required by `successiveMinNat_of_lt`.

Prove `finite_gauge_sublevel` (1.2): for every real `R`, the set `{x ∈ L : gauge K x ≤ R}` is
finite. `K` need not be symmetric.
For `R < 0` the set is empty. For `R ≥ 0` it lies in the compact dilate `R·K`, because the closed
bounded body `K` has `gauge K x ≤ R` exactly when `x ∈ R·K`, the case `R = 0` leaving only `x = 0`.
A discrete lattice meets a bounded set in finitely many points.
*Needs:* Mathlib `gauge_nonneg`, `gauge_eq_zero`, `gauge_smul_of_nonneg`,
`gauge_le_one_iff_mem_closure`, `ConvexBody.isClosed`, `ConvexBody.isCompact`,
`ZSpan.setFinite_inter`, `Module.Basis.ofZLatticeBasis`, `Module.Basis.ofZLatticeBasis_span`,
`absorbent_nhds_zero`, `IsCompact.isVonNBounded`.
**Checks.**

- A negative bound gives the empty set.
- Bound zero gives precisely the zero lattice vector.
- For ℤ² and the unit square, bound 2 gives 25 points.
- For ℤ and the nonsymmetric body `[−1/10,1]`, bound 2 gives exactly the three points 0, 1, 2.

Prove `successiveMin_isLeast` (1.3): for every `i : Fin d`, `λ_i(L,K)` is the least element of
`A_i = {r ≥ 0 : dim span_ℝ{x ∈ L : gauge K x ≤ r} ≥ i.val+1}`.
The rank `r ↦ dim span_ℝ{x ∈ L : gauge K x ≤ r}` is a nondecreasing step function of `r` whose jumps
lie among the finitely many gauge values of lattice vectors below any bound (1.2), and a full
lattice reaches rank `d`. So `A_i` is a closed ray starting at one of those values. For `r > 0` its
members are the admissible dilations of `successiveMin_def`, because `x ∈ r·K` exactly when
`gauge K x ≤ r`. `r = 0` is not a member, since only the zero vector has gauge zero.
*Needs:* Mathlib `Submodule.finrank_mono`, `finrank_span_eq_card`, `gauge_le_one_iff_mem_closure`,
`gauge_eq_zero`, `absorbent_nhds_zero`, `ConvexBody.isCompact`, `IsCompact.isVonNBounded`, 1.1
`successiveMin_def`, 1.2 `finite_gauge_sublevel`.
**Checks.**

- `A_i` contains its endpoint; replacing ≤ by < in the membership assertion is false.
- For `K₂₃` the rank jumps from zero to one at 2 and from one to two at 3; for `K₃₂` the first
  rank-one span is `ℝe₁` instead of `ℝe₀`.
- At threshold zero the lattice sublevel spans dimension zero, so no valid minimum index qualifies.

Prove `successiveMin_pos` (1.4): for every `i : Fin d`, `0 < λ_i(L,K)`. `K` need not be symmetric.
By 1.3, `λ_i` is a member of `A_i`. The rank at the threshold 0 is that of the span of the zero
vector, which is below `i.val+1`, so `λ_i ≠ 0`.
*Needs:* 1.3 `successiveMin_isLeast`, 1.2 `finite_gauge_sublevel`.
**Checks.**

- For `(1/2)ℤ` and the unit interval the minimum is 1/2: positivity does not imply a lower bound
  of 1.
- For `(1/2)ℤ` and the nonsymmetric body `[−1/10,1]`, the minimum is again 1/2, attained by 1/2 and
  not by −1/2, whose gauge is 5.
- For the subgroup `ℤ + ℤ√2` of ℝ, which is not discrete, the dilation infimum for `[−1,1]` is 0:
  discreteness of `L` is load-bearing.

Prove `successiveMin_monotone` (1.5): the function `i ↦ λ_i(L,K)` on `Fin d` is monotone. `K` need
not be symmetric.
For `i ≤ j` the threshold set `A_j` of 1.3 is contained in `A_i`, so its least element is at least
that of `A_i`.
*Needs:* 1.3 `successiveMin_isLeast`.
**Checks.**

- The unit cube has a constant sequence of minima; strict monotonicity is false.
- For ℤ² and the nonsymmetric rectangle `[−1/10,1]²`, both minima are 1.
- The order is that of the index, not of the coordinates: for ℤ² and `K₃₂` the minima are (2,3),
  with `λ_0` attained by `e₁` and `λ_1` by `e₀`.

Prove `successiveMin_le_iff` (1.6): for `r ≥ 0`, `λ_i(L,K) ≤ r` if and only if
`i.val+1 ≤ dim_ℝ span_ℝ((L : Set E) ∩ r·(K : Set E))`.
*Needs:* Mathlib `gauge_eq_zero`, `gauge_smul_of_nonneg`, `gauge_le_one_iff_mem_closure`,
`Submodule.finrank_mono`, `absorbent_nhds_zero`, `ConvexBody.isCompact`, `IsCompact.isVonNBounded`,
1.3 `successiveMin_isLeast`.
**Checks.**

- At `r = 0` the right side is false for every valid index.
- At `r = λ_i` the threshold holds.

Prove `exists_successiveMin_witnesses` (1.7): there exists a real basis `b` indexed by `Fin d` such
that `b_i ∈ L`, `gauge K b_i = λ_i(L,K)`, and every `x ∈ L` of gauge `< λ_i` lies in
`span_ℝ{b_j : j < i}`. In particular `b_i ∈ λ_i K`, and all minimum bounds are attained by one
independent family. `K` need not be symmetric.
The family is chosen greedily, in two steps.
1. Prove `exists_min_gauge_outside`: if `W < E` is a proper real subspace, there is `v ∈ L ∖ W` with
   `gauge K v ≤ gauge K x` for every `x ∈ L ∖ W`; in particular the selected gauge is positive. A
   full lattice is not contained in `W`, and by 1.2 the minimum is taken over finitely many gauge
   values.
2. Prove `exists_greedy_gauge_family`: there is a real-linearly-independent family `v : Fin d → L`
   such that `a_i = gauge K v_i` is positive and nondecreasing, and every `x ∈ L` with
   `gauge K x < a_i` lies in `span_ℝ{v_j : j < i}`. Here `v_i` is the vector of step 1 for `W` the
   span of `v_0, …, v_(i−1)`, appended with `linearIndependent_finSnoc`.

The family has `d` members and thus is a real basis; no integral-basis claim is made. For `r < a_i`
every lattice vector of gauge at most `r` lies in a span of dimension `i`, and for `r ≥ a_i` the
vectors `v_0, …, v_i` qualify, so by 1.3 `a_i = λ_i`. Since `K` is closed and `λ_i > 0`,
`gauge K b_i = λ_i` gives `b_i ∈ λ_i K`.
*Needs:* Mathlib `IsZLattice`, `Set.exists_min_image`, `gauge_pos`, `absorbent_nhds_zero`,
`ConvexBody.isCompact`, `IsCompact.isVonNBounded`, `linearIndependent_finSnoc`,
`finrank_span_eq_card`, `basisOfLinearIndependentOfCardEqFinrank'`,
`gauge_le_one_iff_mem_closure`, `gauge_smul_of_nonneg`, 1.2 `finite_gauge_sublevel`, 1.3
`successiveMin_isLeast`, 1.4 `successiveMin_pos`.
**Checks.**

- For ℤ² and `W = ℝe₀`, the least outside gauge is 3 for `K₂₃` and 2 for `K₃₂`. The respective
  outside witnesses are `e₁` with gauge 3 and `e₁` with gauge 2.
- `W = ⊤` is excluded because the complement is empty.
- Repeated minima are allowed: the unit square has both values 1.
- Strict inequality in the flag is essential: `e_0` has gauge equal to the first minimum and does
  not lie in the zero prefix.
- The unit-square diagonal pair has determinant −2 and attains both minima, so attainment alone does
  not certify an integral basis.
- The zero-dimensional family is an empty real basis and has no minimum value to evaluate.
- For the nonsymmetric body `[−1/10,1]` and `L = ℤ` the minimum 1 is attained by 1 but not by −1,
  whose gauge is 10; outside the symmetric case a witness family is not closed under negation.

Prove `successiveMin_antitone_body` (1.8): if `K ⊆ K'` and both bodies contain zero in their
interior, then `λ_i(L,K') ≤ λ_i(L,K)` for every `i`.
(Source: direct body-monotonicity deduction from the threshold definition in Evertse2023, §2.3,
printed p.23.)
*Needs:* Mathlib `Submodule.finrank_mono`, 1.6 `successiveMin_le_iff`, 1.4 `successiveMin_pos`.
**Checks.**

- Changing `[−1,1]` to `[−2,2]` divides the only minimum by two.

Prove `successiveMin_monotone_lattice` (1.9): if `L ≤ M` are discrete full lattices in the same
`E`, then `λ_i(M,K) ≤ λ_i(L,K)`.
(Source: deduction from the threshold definition in Evertse2023, §2.3, printed p.23; Lemma 2.8,
pp.23–24, supplies attainment, rather than stating lattice monotonicity.)
*Needs:* Mathlib `Submodule.finrank_mono`, 1.6 `successiveMin_le_iff`, 1.4 `successiveMin_pos`.
**Checks.**

- `2ℤ ⊂ ℤ` gives minima 2 and 1 for the unit interval.

Prove `successiveMin_smul_body` (1.10): for `c > 0`, `λ_i(L, cK) = λ_i(L,K)/c`, with the scalar
action on `ConvexBody`.
Since `gauge_(cK) = c⁻¹·gauge_K`, the threshold set `A_i` of 1.3 for `cK` is `c⁻¹` times the one for
`K`.
*Needs:* Mathlib `gauge_smul_left_of_nonneg`, `ConvexBody.coe_smul`, 1.3 `successiveMin_isLeast`.
**Checks.**

- Scaling the unit interval by 3 changes its minimum from 1 to 1/3.

Prove `successiveMin_linearEquiv` (1.11): let `e : E ≃ₗ[ℝ] F`, `L' = e(L)` as integral submodules,
and `K' = e(K)` as convex bodies. For valid indices `i, j` with `i.val = j.val`,
`λ_j(L',K') = λ_i(L,K)`. `E, F` are finite-dimensional normed real spaces, and the discrete, full
and interior hypotheses are understood. The equivalence need not be orthogonal or unimodular.
(Source: Evertse2023, §2.3, change-of-coordinates remark after Theorem 2.9, printed pp.24–25
(physical pp.14–15); the nonsingularity hypothesis is corrected as in Misprints M2.)
*Needs:* Mathlib `LinearEquiv.finrank_eq`, 1.6 `successiveMin_le_iff`, 1.4 `successiveMin_pos`.
**Checks.**

- Scaling both ℤ and `[−1,1]` by 2 preserves minimum 1; scaling only the lattice gives 2.
- A shear acts simultaneously on the standard lattice and unit square without changing their two
  minima.

Prove `successiveMin_first_le_iff` (1.12): if `d > 0` and `r ≥ 0`, `λ_0(L,K) ≤ r` if and only if
there exists `x ∈ L` with `x ≠ 0` and `x ∈ rK`.
(Source: Evertse2023, §2.3, definition and Lemma 2.8, pp.23–24; Henk2002, p.2 before Theorem 1.2.)
*Needs:* Mathlib `finrank_span_eq_card`, `Submodule.finrank_mono`, 1.6 `successiveMin_le_iff`.
**Checks.**

- For ℤ and the unit interval, `r = 1` has witnesses ±1, while every `0 ≤ r < 1` has none.

Prove `exists_integral_minimum_flag` (1.13): there is an integral basis `b : Fin d → L` such that
`x ∈ L` and `gauge K x < λ_i` imply that `x` belongs to the real flag of `b` at `i`, the span of its
first `i` vectors.
Symmetry of `K` is not assumed. No bound on the individual gauges of the `b_i` is claimed; only the
attained real basis's flag is preserved. Tau Ceti's `ZLattice.exists_basis_gauge_le_max_one_mul`
is the form that bounds the vectors, at the cost `max 1 ((i+1)/2)`.
Apply 0.2.1 to the real basis of 1.7: the integral basis it returns has the same real flags, and
those contain the strict sublevels.
(Source: Henk2002, pp.3–4, (2.1)–(2.3).)
*Needs:* Mathlib `Module.Basis.flag`, 1.7 `exists_successiveMin_witnesses`, 0.2.1
`exists_integral_basis_same_flag`.
**Checks.**

- The nonzero constant vector in ℝ² does not belong to flag zero; equality at the first minimum is
  not a strict sublevel.
- The empty standard basis of `ℝ⁰` has flag zero equal to the entire zero space.
- For ℤ² and `K₂₃`, the lattice vectors of gauge below `λ_1 = 3` are 0 and `±e₀`, so `b₀ = ±e₀`;
  the integral basis ((1,1),(0,1)) fails, because its first flag does not contain `e₀`. For `K₃₂`
  the required first flag is `ℝe₁`.

### Examples

For `L = ℤ^d` and the cube `K = [−1,1]^d` every minimum is `1`. For positive half-widths `a_i`, both
the weighted cross-polytope `{Σ|x_i|/a_i ≤ 1}` and the box `∏[−a_i,a_i]` have the reciprocals
`1/a_i` as their successive minima, sorted in increasing order. With half-widths `(2,1)` the minima
are `(1/2,1)`, not `(1,2)`.

### Dependencies

Layer 0.2 (for 1.13); Mathlib `ConvexBody`, `gauge` and its calculus, `IsZLattice`,
`ZSpan.setFinite_inter`, `Module.Basis.flag`.

## Layer 2: Minkowski's lower inequality and the linear forms theorem

### 2.1 Minkowski's lower inequality and its sharpness

Prove `weighted_crosspolytope_volume` (2.1.1): let `E` be a finite-dimensional real inner-product
space with canonical volume, `o` an orthonormal basis and `b` any real basis, both indexed by
`Fin n`. For positive `a_i`,
`volume{x : Σ_i a_i·|b.repr(x)_i| ≤ 1} = ofReal((2^n/n!)·|det_o(b)|/∏_i a_i)`. Dimension zero is
included.
`E` has the canonical inner-product volume; `o` is orthonormal and `b` is a basis, not an arbitrary
dependent family. Each `a_i > 0`. `n` can be zero.
(Source: Evertse2023, §2.3, proof of the lower bound in Theorem 2.9, printed p.27 (physical p.17).)
*Needs:* Mathlib `MeasureTheory.volume_sum_rpow_le`, `Real.Gamma_nat_eq_factorial`,
`MeasureTheory.Measure.addHaar_image_linearMap`, `OrthonormalBasis.measurePreserving_repr`,
`PiLp.volume_preserving_ofLp`, `Matrix.det_mul`, `volume_euclideanSpace_eq_dirac`,
`Matrix.det_diagonal`.
**Checks.**

- `n = 0` gives volume one.
- With the standard basis and `a = (2,3)`, the planar diamond has area 1/3.
- Replacing the basis by `(2e_0,3e_1)`, with `a = (1,1)`, gives area 12.

Prove `weighted_crosspolytope_subset` (2.1.2): let `K` be symmetric about zero with zero in its
interior. For a real basis `b` and positive `a_i`, if `b_i ∈ a_i K` for every `i`, then
`{x : Σ_i a_i|b.repr(x)_i| ≤ 1} ⊆ K`.
`K : ConvexBody E`, `0 ∈ interior K`, and `x ∈ K` implies `−x ∈ K`. `b` is a finite real basis. All
`a_i` are positive. The containment is independent of any lattice or volume normalization.
(Source: Evertse2023, §2.3, Lemma 2.10 and lower-bound proof, printed pp.26–27 (physical
pp.16–17); the indexing is corrected as in Misprints M1.)
*Needs:* Mathlib `gauge_le_of_mem`, `gauge_sum_le`, `gauge_neg`, `gauge_smul_of_nonneg`,
`gauge_le_one_iff_mem_closure`, `absorbent_nhds_zero`.
**Checks.**

- The diamond with vertices `±e_0, ±e_1` is contained in the unit square.
- Without symmetry, containing `b_i/a_i` does not imply containing its negative.

Prove `covolume_le_abs_basis_det` (2.1.3): in a finite-dimensional real inner-product space with
canonical volume, let `L` be a discrete full lattice, `o` an orthonormal basis and `b` a real basis
with every `b_i ∈ L`. Then `covolume(L) ≤ |det_o(b)|`.
Both bases have the full ambient rank, including rank zero. `L` is discrete and full. The measure is
the intrinsic canonical Euclidean volume.
(Source: Evertse2023, §2.3, lower-bound proof, printed p.27 (physical p.17).)
*Needs:* Mathlib `ZLattice.covolume_div_covolume_eq_relIndex'`,
`ZLattice.covolume_eq_det_mul_measureReal`, `ZLattice.covolume_pos`,
`ZSpan.fundamentalDomain_ae_parallelepiped`, `OrthonormalBasis.volume_parallelepiped`,
`instIsZLatticeRealSpan`, `Module.Basis.restrictScalars`.
**Checks.**

- The diagonal and antidiagonal vectors in ℤ² have absolute determinant 2 ≥ 1.
- For `2ℤe_0 ⊕ 3ℤe_1` the basis determinant and covolume are both 6.

Prove `minkowski_second_lower` (2.1.4): for a discrete full lattice `L` in a finite-dimensional real
normed space `E`, an additive Haar measure `μ` and a symmetric convex body `K` with zero in its
interior, `(2^d/d!)·covolume(L,μ) ≤ (∏_{i : Fin d} λ_i(L,K))·μ.real(K)`. Here `d = finrank ℝ E` and
`μ` is explicit; on an inner-product space one may take canonical Euclidean volume. The formula
holds also for `d = 0`.

`E` has a normed additive group, a real normed-space structure and its Borel measurable structure;
`μ` is any additive Haar measure. `L` is a discrete full integral submodule. `K` is compact convex,
centrally symmetric about zero, and has zero in its interior. A lower-rank lattice is first
considered as a full lattice in its real span with that span's own volume. No ambient-volume
inequality for a measure-zero subspace is claimed.

*Transport to Euclidean space.* For both product inequalities, transport once by the continuous
linear equivalence `e = toEuclidean`, with lattice `e(L)`, body `e(K)` and measure `ν = μ.map e`.
This is an additive Haar measure by Mathlib `ContinuousLinearEquiv.isAddHaarMeasure_map`. The
equivalence and its inverse preserve these transported measures, `ZLattice.covolume_comap`
identifies the covolumes, and 1.11 `successiveMin_linearEquiv` identifies minima with equal index
values. In Euclidean space `ν = c·volume` for a finite positive `c`. The fundamental-domain formula
makes the covolume scale by `c`, while the minima are measure independent. Multiplying the
canonical-volume inequality by `c` gives the `ν`-measure inequality and hence the original
`μ`-measure inequality. (Source: Mathlib `MeasureTheory.Measure.isAddLeftInvariant_eq_smul` and
`ZLattice.covolume_eq_measure_fundamentalDomain`.)

*Euclidean case.* Take the attaining basis `b` of 1.7, so that `b_i ∈ λ_i K`. By 2.1.2 the
cross-polytope with weights `λ_i` lies in `K`, 2.1.1 gives its volume
`(2^d/d!)·|det_o(b)|/∏_i λ_i`, and 2.1.3 bounds `covolume(L)` by `|det_o(b)|`.
(Source: Evertse2023, §2.3, Theorem 2.9 and its complete lower-bound proof, printed pp.24, 26–27.)
*Needs:* Mathlib `toEuclidean`, `ContinuousLinearEquiv.isAddHaarMeasure_map`,
`ZLattice.covolume_comap`, `ConvexBody.isCompact`, `volume_euclideanSpace_eq_dirac`,
`MeasureTheory.Measure.isAddLeftInvariant_eq_smul`,
`ZLattice.covolume_eq_measure_fundamentalDomain`, 1.11 `successiveMin_linearEquiv`, 1.7
`exists_successiveMin_witnesses`, 1.4 `successiveMin_pos`, 2.1.1 `weighted_crosspolytope_volume`,
2.1.2 `weighted_crosspolytope_subset`, 2.1.3 `covolume_le_abs_basis_det`.
**Checks.**

- For ℤ² and the unit diamond, product 1 times area 2 equals `2²/2!`.
- For ℤ² and the unit square, product 1 times area 4 is strictly larger than 2.
- For `2ℤ` and `[−3,3]`, minimum 2/3 times length 6 equals `4 = (2/1!)·2`.
- For dimension zero with canonical volume both sides are 1.
- In `Fin 2 → ℝ` with the sup norm, ℤ² and the unit diamond have minima (1,1). With `μ` three times
  product Lebesgue measure, `μ.real(K) = 6` and `covolume(L,μ) = 3`, giving equality `6 = 2·3`
  without an inner-product structure.
- Twice canonical volume doubles both sides; the box and diamond equality cases survive any
  `c > 0`; in rank zero `μ({0}) = c` and both sides are `c` rather than 1.

Prove `successiveMin_box` (2.1.5): let `b` be a real basis of `E` indexed by `Fin d`,
`L = span_ℤ(range b)`, and `a : Fin d → ℝ` positive and nondecreasing. If `K` is the convex body
`{x : ∀ j, a_j|b.repr(x)_j| ≤ 1}`, then `λ_i(L,K) = a_i` for every `i`.
`b : Basis (Fin d) ℝ E` where `d = finrank ℝ E`. `L` is exactly its integral span. All `a_i > 0`
and `a` is monotone. The stated set is the carrier of `K`.
(Source: Evertse2023, §2.3, Example 2, printed pp.25–26 (physical pp.15–16).)
*Needs:* Mathlib `finrank_span_eq_card`, `Submodule.finrank_mono`, 1.6 `successiveMin_le_iff`, 1.4
`successiveMin_pos`.
**Checks.**

- `a = (2,3)` gives minima 2, 3.
- `a = (1,1,4)` gives a repeated first value; the two shortest lattice vectors may be opposites and
  still fail to be independent.

Prove `successiveMin_crosspolytope` (2.1.6): with `b`, `L` and positive nondecreasing `a` as in
2.1.5, let `K = {x : Σ_j a_j|b.repr(x)_j| ≤ 1}`. Then `λ_i(L,K) = a_i`. Together with 2.1.1, this
attains equality in 2.1.4.
`b : Basis (Fin d) ℝ E` where `d = finrank ℝ E`. `L` is exactly its integral span. All `a_i > 0`
and `a` is monotone. The weighted ℓ¹ set is the carrier of `K`.
(Source: Evertse2023, §2.3, Example 3 and Exercise 2.9, printed p.26 (physical p.16).)
*Needs:* Mathlib `finrank_span_eq_card`, `Submodule.finrank_mono`,
`ZLattice.covolume_eq_det_mul_measureReal`, 1.6 `successiveMin_le_iff`, 1.4 `successiveMin_pos`,
2.1.1 `weighted_crosspolytope_volume`.
**Checks.**

- `a = (2,3)`, `b` standard in ℝ² gives minima 2, 3 and area 1/3, so the product-volume is 2.
- Empty dimension has no minimum index and still attains the volume-product equality 1.

### 2.2 Minkowski's linear forms theorem

Prove `linear_forms_box_volume` (2.2.1): for `n ≥ 0`, an invertible real `n×n` matrix `A` and
positive `a_i`, the set `C = {x ∈ ℝ^n : ∀ i, |(Ax)_i| ≤ a_i}` has volume
`ofReal(2^n·(∏ a_i)/|det A|)`.
The matrix is square and `det A ≠ 0`; all `a_i > 0`. Lebesgue measure is the product volume on
`Fin n → ℝ`. `n = 0` is allowed for this volume identity.
(Source: Evertse2023, §2.2, Corollary 2.6, printed p.20 (physical p.10).)
*Needs:* Mathlib `LinearMap.det_toLin'`, `LinearMap.equivOfDetNeZero`,
`MeasureTheory.Measure.addHaar_preimage_linearMap`, `Real.volume_Icc_pi`.
**Checks.**

- For `n = 1`, `A = (−2)` and `a = 3` the set is `[−3/2,3/2]` of length 3.
- For `A = diag(2,3)`, `a = (2,3)`, the region is the unit square of area 4.
- For `n = 0` the determinant, coordinate product and volume are one.

Prove `minkowski_linear_forms` (2.2.2): for `n ≥ 1`, an invertible real `n×n` matrix `A` and
positive `a_i` with `∏ a_i ≥ |det A|`, there exists `z ∈ ℤ^n`, `z ≠ 0`, with
`|Σ_j A_ij z_j| ≤ a_i` for every `i`. Every coordinate inequality is non-strict, including at
equality in the determinant bound.
`n ≥ 1`, `A : Matrix (Fin n) (Fin n) ℝ`, `det A ≠ 0`, all `a_i > 0`, and `∏ a_i ≥ |det A|`. No
rationality of the matrix entries is required.
(Source: Evertse2023, §2.2, Corollary 2.6 and complete proof, printed p.20 (physical p.10).)
*Needs:* Mathlib `MeasureTheory.exists_ne_zero_mem_lattice_of_measure_mul_two_pow_le_measure`,
`ZSpan.isAddFundamentalDomain'`, `ZSpan.volume_fundamentalDomain`, `instIsZLatticeRealSpan`, 2.2.1
`linear_forms_box_volume`.
**Checks.**

- For `n = 1`, `A = (2)`, `a = 2`, `z = 1` is a boundary witness; replacing ≤ with < would
  eliminate every nonzero integer witness.
- A determinant of −2 has the same threshold as 2.
- `n = 0` is excluded: its only integer vector is zero despite the empty-product determinant
  inequality.

### Examples

The cross-polytope attains the lower bound `2^d/d!`. For Dirichlet approximation apply the linear
forms theorem to `x − αy` and `y` with bounds `(1/T, T)`, `T > 1`: the determinant is `1`, so there
is a nonzero integer pair with `|x − αy| ≤ 1/T` and `|y| ≤ T`. Since `1/T < 1`, `y = 0` would also
force `x = 0`, so the denominator is nonzero.

### Dependencies

Layer 1; Mathlib's first convex body theorem, `ZLattice.covolume` with its fundamental-domain and
Haar-scaling lemmas, `toEuclidean`, and the Haar-measure image lemmas.

## Layer 3: Minkowski's upper inequality

The upper inequality follows Henk's short proof through volumes of unions of translates of `½K`
along a flag of coordinate boxes.

*Standing notation for 3.11–3.16 and 3.20.* These are sets, finite unions and scalar images, not
new box or lattice carrier types. For `d, q ∈ ℕ`, write `M_q = {z ∈ ℤ^d : −q ≤ z_j ≤ q for every
j}`, a finite interval in the function lattice. Write `c(z) = (z_j : ℝ)_j`,
`U_q(S) = ⋃_{z ∈ M_q} (c(z) + S)`, and `M_q^k = {z ∈ M_q : z_j = 0 when k ≤ j < d}`. Write
`U_q^k(S)` for the same union restricted to `M_q^k`. Indices are zero-based. A cutoff
`k ∈ {0, …, d}` retains the first `k` coordinates; the transverse dimension is `d − k`.
Empty-coordinate products and volumes use the zero-dimensional convention.

*Standing notation for 3.2–3.7.* `E` and `F` are finite-dimensional real normed vector spaces with
their Borel measurable structures; `μ` and `ν` are additive Haar measures on `E` and `F`. Use their
product measure `μ×ν`. The spaces may have dimension zero. For a finite indexing type `I` and
`v : I → E`, write `U_v(K) = ⋃_{i ∈ I} {(v_i + x, y) : (x,y) ∈ K}`. Write `f₁,r(x,y) = (rx, y)` and
`f₂,r(x,y) = (x, ry)`. These are ordinary finite unions and linear maps, not new constructors or
carrier types.

Prove `finite_interior_disjoint_translate_volume` (3.1): let `K ⊆ E` be compact and convex, and
`v : I → E` a finite family. If `v_i + int(K)` and `v_j + int(K)` are disjoint whenever `i ≠ j`,
then `μ(⋃_i (v_i + K)) = |I|·μ(K)`. Equality is in the nonnegative extended reals.
`E` is finite-dimensional real normed with Borel structure; `μ` is an additive Haar measure. No
symmetry, origin condition or positive-dimensional interior of `K` is required. The index type may
be empty. Repeated translation vectors are not silently deduplicated; the stated
interior-disjointness hypothesis controls when the cardinal factor is valid.
(Source: Henk2002, p.5 (3.2), and p.6 the two volume factorizations after (3.4).)
*Needs:* Mathlib `Convex.addHaar_frontier`, `Convex.translate`, `Homeomorph.image_interior`,
`IsCompact.image`, `IsCompact.isClosed`, `IsClosed.measurableSet`, `MeasureTheory.measure_iUnion₀`,
`MeasureTheory.measure_preimage_mul_right`.
**Checks.**

- The closed intervals `[0,1]` and `[1,2]` have union of real volume 2 despite sharing an endpoint.
- Two copies of `[0,1]` have union volume 1, not 2; their interiors are not disjoint.

Prove `finite_translate_section` (3.2): for every `K ⊆ E×F`, `y ∈ F` and finite `v : I → E`,
`{x : (x,y) ∈ U_v(K)} = ⋃_i (v_i + {x : (x,y) ∈ K})`.
(Source: Henk2002, p.6, the section inclusion between (3.6) and the successive integrations.)
**Checks.**

- The union of translates of `[0,1]` indexed by `Fin 0` is the empty real set.

Prove `convex_section_enlargement` (3.3): if `K ⊆ E×F` is convex and `r ≥ 1`, then for every
`y ∈ F` there exists `t ∈ E` such that `{x : (x,y) ∈ U_v(K)} ⊆ t + {x : (x,y) ∈ U_v(f₁,r(K))}`.
(Source: Henk2002, p.6, pointwise `t(x)` inclusion immediately after (3.6).)
*Needs:* Mathlib `Convex.add_smul_sub_mem`, 3.2 `finite_translate_section`.
**Checks.**

- `[2,3] ⊆ [4,6] − 2`, using `a = 2` and `r = 2`.
- `[2,3]` is not a subset of its dilation `[4,6]` about zero; the translation cannot be omitted.
- There is no real `t` with `{0,1,3} ⊆ {0,2,6} + t`; arbitrary nonconvex sections do not satisfy
  the containment.

Prove `section_union_volume_mono` (3.4): for convex `K ⊆ E×F`, `r ≥ 1` and every `y ∈ F`,
`μ{x : (x,y) ∈ U_v(K)} ≤ μ{x : (x,y) ∈ U_v(f₁,r(K))}`.
(Source: Henk2002, p.6, the inequality between section-volume integrals.)
*Needs:* Mathlib `MeasureTheory.measure_preimage_mul_right`, 3.3 `convex_section_enlargement`.
**Checks.**

- At `r = 1`, `f₁,r(K) = K` for every subset of `ℝ×ℝ`, so every section inequality is an equality.

Prove `partial_dilation_union_volume` (3.5): for compact convex `K ⊆ E×F`, finite `v : I → E` and
`r ≥ 1`, `(μ×ν)(U_v(K)) ≤ (μ×ν)(U_v(f₁,r(K)))`.
(Source: Henk2002, p.6 (3.6) and the three-line successive-integration argument ending on p.7.)
*Needs:* Mathlib `IsCompact.image`, `isCompact_iUnion`, `IsCompact.isClosed`,
`IsClosed.measurableSet`, `measurable_measure_prodMk_right`,
`MeasureTheory.Measure.prod_apply_symm`, `MeasureTheory.lintegral_mono`, 3.4
`section_union_volume_mono`.
**Checks.**

- At `r = 1` both measurable unions are the same, so the product-volume comparison is an equality.
- For an empty index type both sides are zero, including when either factor has dimension zero.
- The integration uses only the two measurable section-volume functions; no measurable choice of
  the pointwise center is permitted as an unstated premise.

Prove `complementary_dilation_union` (3.6): for any real `r`, any `K ⊆ E×F` and finite
`v : I → E`, `U_v(rK) = f₂,r(U_v(f₁,r(K)))`.
(Source: Henk2002, p.6, identity `M_q^i + K_{i+1} = f₂(M_q^i + f₁(K_i))`.)
**Checks.**

- On `ℝ×ℝ`, `f₁,2(3,5) = (6,5)`.
- On `ℝ×ℝ`, `f₂,2(3,5) = (3,10)`; it must leave the translation coordinate unchanged.

Prove `transverse_union_volume` (3.7): for compact convex `K ⊆ E×F`, finite `v : I → E` and
`r ≥ 1`, `r^(dim F)·(μ×ν)(U_v(K)) ≤ (μ×ν)(U_v(rK))`, interpreting the scalar factor by the
nonnegative extended-real inclusion.
(Source: Henk2002, p.6 (3.5), using the partial maps and (3.6).)
*Needs:* Mathlib `MeasureTheory.Measure.addHaar_image_linearMap`, `LinearMap.det_prodMap`,
`LinearMap.det_smul`, `MeasureTheory.Measure.prod.instIsHaarMeasure`, 3.5
`partial_dilation_union_volume`, 3.6 `complementary_dilation_union`.
**Checks.**

- For `F = EuclideanSpace ℝ (Fin 0)`, the factor `2^(dim F)` is 1, not 2 or zero.

Prove `gauge_linearEquiv` (3.8): for real modules `E, F`, a linear equivalence `e : E ≃ₗ[ℝ] F`,
`K ⊆ E` and `x ∈ E`, `gauge_{e(K)}(e(x)) = gauge_K(x)`. No convexity, boundedness, symmetry or
nonempty-interior hypothesis is needed.
`E, F` are real modules with additive commutative group structure. Both the set and the evaluation
point are transformed; this is a comparison for the gauge, not another gauge definition.
(Source: direct deduction from Mathlib `gauge_def'`; Henk2002, p.5, §3, uses the accompanying
reduction to a standard lattice.)
*Needs:* Mathlib `gauge_def'`.
**Checks.**

- For `K = [−1,1]`, transforming `K` and `x = 1` by multiplication by 2 gives
  `gauge_[−2,2](2) = 1`.
- Keeping `K = [−1,1]` while replacing `x = 1` by `x = 2` gives gauge 2, not 1.

Prove `convex_cluster_intersection_null` (3.9): for finite families `A : I → Set E`,
`B : J → Set E` of convex sets, if `int(A_i)` and `int(B_j)` are disjoint for every `i, j`, then
`μ((⋃_i A_i) ∩ (⋃_j B_j)) = 0`.
`E` is finite-dimensional real normed, with Borel structure and an additive Haar measure `μ`. The
families may be empty; the individual convex sets need not be closed or bounded. The unions need not
be convex.
(Source: Henk2002, p.6, the volume factorizations immediately after (3.4).)
*Needs:* Mathlib `mem_frontier_iff_notMem_interior`, `Convex.addHaar_frontier`,
`MeasureTheory.measure_iUnion_null_iff`, `MeasureTheory.measure_union_null`,
`MeasureTheory.measure_mono_null`.
**Checks.**

- `([0,2] ∪ [1,3]) ∩ ([3,5] ∪ [4,6])` has real volume zero.
- `[0,2] ∩ [1,3]` has volume one: dropping cross-interior disjointness is false.

Prove `clustered_translate_volume` (3.10): for compact convex `K ⊆ E`, finite `u : I → E` and
`v : J → E`, suppose `int(u_i + v_j + K)` and `int(u_i′ + v_j′ + K)` are disjoint whenever
`j ≠ j′`, for all `i, i′`. Then `μ(⋃_j ⋃_i (u_i + v_j + K)) = |J|·μ(⋃_i (u_i + K))`.
`E` is finite-dimensional real normed and Borel; `μ` is an additive Haar measure. Both index types
may be empty. Within each row `j`, the sets may overlap and the labels `i` may repeat.
(Source: Henk2002, p.6, the two factorizations following (3.4).)
*Needs:* Mathlib `Convex.translate`, `Homeomorph.image_interior`, `IsCompact.image`,
`isCompact_iUnion`, `IsCompact.isClosed`, `IsClosed.measurableSet`, `MeasureTheory.measure_iUnion₀`,
`MeasureTheory.measure_preimage_mul_right`, 3.9 `convex_cluster_intersection_null`.
**Checks.**

- The union of `[0,2], [1,3], [3,5], [4,6]` has volume `6 = 2·3`, not `4·2 = 8`.
- Repeating `[0,1]` within a row does not double that row's volume; two touching translated rows
  still have total volume 2.

Prove `strict_flag_translate_separation` (3.11): let `K ⊆ ℝ^d` be a symmetric convex body with 0 in
its interior, `t > 0` and `0 ≤ k ≤ d`. Suppose every `z ∈ ℤ^d` with `gauge_K(c(z)) < t` has
`z_j = 0` for `j ≥ k`. If `x, y ∈ ℤ^d` differ in some coordinate `j ≥ k`, then
`c(x) + int((t/2)K)` and `c(y) + int((t/2)K)` are disjoint.
The flag condition is strict. No assertion about points of gauge `t` is made. A minimum vector need
not be a basis vector, and no equality between a real and integral basis is assumed.
(Source: Henk2002, pp.5–6, (3.2) and (3.4), using the strict flag from (2.3).)
*Needs:* Mathlib `interior_subset_gauge_lt_one`, `gauge_smul_left_of_nonneg`, `gauge_add_le`,
`gauge_neg`, `absorbent_nhds_zero`.
**Checks.**

- The open intervals `(−1/2,1/2)` and `(1/2,3/2)` are disjoint, even though the corresponding
  closed intervals touch.
- Replacing the half-body by the whole unit interval makes translates centered at 0 and 1 overlap
  on `(0,1)`.

Prove `lattice_box_row_volume` (3.12): for compact convex `S ⊆ ℝ^d`, `q ∈ ℕ` and `k ≤ d`, assume
`c(x) + int(S)` and `c(y) + int(S)` are disjoint for all `x, y ∈ M_q` whose tails (coordinates
`j ≥ k`) differ. Then `volume(U_q(S)) = (2q+1)^(d−k)·volume(U_q^k(S))`.
Lebesgue volume is the product volume on `ℝ^d`. The statement is in the nonnegative extended reals,
with the natural cardinal factor cast into that space.
(Source: Henk2002, p.6, the two displayed volume factorizations after (3.4).)
*Needs:* Mathlib `Equiv.piEquivPiSubtypeProd`, `Pi.card_Icc`, `Int.card_Icc`, 3.10
`clustered_translate_volume`.
**Checks.**

- For `q = 1`, `k = 1`, `d = 2` and `S = [−1,1]×[−1/2,1/2]`, the prefix union has area 4 and the
  full union area `12 = 3·4`; summing nine individual areas would incorrectly give 18.
- `M_0` consists only of zero in every dimension, so every row-volume factor at `q = 0` is one.

Prove `coordinate_transverse_union_volume` (3.13): for `k ≤ d`, compact convex `S ⊆ ℝ^d`, a finite
family `v : I → ℝ^d` with `(v_i)_j = 0` whenever `j ≥ k`, and `r ≥ 1`,
`r^(d−k)·volume(⋃_i (v_i + S)) ≤ volume(⋃_i (v_i + rS))`.
No symmetry or origin condition is required for `S`. The family may be empty or have repeated
labels. This is the product-space inequality expressed in coordinate space, not a new geometric
carrier.
(Source: Henk2002, p.6, (3.5) and the coordinate maps `f₁, f₂`.)
*Needs:* Mathlib `Equiv.piEquivPiSubtypeProd`, `Homeomorph.piEquivPiSubtypeProd`,
`MeasureTheory.volume_preserving_piEquivPiSubtypeProd`, `Module.finrank_fintype_fun_eq_card`, 3.7
`transverse_union_volume`.
**Checks.**

- For `d = 3`, `k = 1`, `r = 2` the multiplier is 4, not the ambient factor 8.
- For `k = d` the multiplier is `r^0 = 1`; for `k = 0` it is `r^d`.

Prove `flag_box_volume_ratio` (3.14): for `K ⊆ ℝ^d` a symmetric convex body with 0 in its interior,
`0 < s ≤ t`, `q ∈ ℕ` and `k ≤ d`, assume `gauge_K(c(z)) < t` implies `z_j = 0` for all `j ≥ k`.
Then `(t/s)^(d−k)·volume.real(U_q((s/2)K)) ≤ volume.real(U_q((t/2)K))`.
`K` is the compact nonempty `ConvexBody`; compactness is used to convert finite union measures to
real volume.
(Source: Henk2002, pp.5–6, (3.3)–(3.5).)
*Needs:* Mathlib `IsCompact.measure_lt_top`, `isCompact_iUnion`, `IsCompact.image`, 3.11
`strict_flag_translate_separation`, 3.12 `lattice_box_row_volume`, 3.13
`coordinate_transverse_union_volume`.
**Checks.**

- If `s = t > 0`, the ratio inequality is an equality, for every `q` and cutoff.
- For `q = 1`, `K = [−1,1]×[−1/3,1/3]`, `s = 1`, `t = 3`, `k = 1`, the smaller and larger union
  areas are 3 and 15. The required factor gives `9 ≤ 15`; the incorrect ambient exponent gives
  `27 ≤ 15`, which is false.

Prove `first_box_volume` (3.15): for `K ⊆ ℝ^d` a symmetric convex body with 0 in its interior and
`s > 0`, suppose `gauge_K(c(z)) < s` for an integer vector `z` implies `z = 0`. Then for every
`q ∈ ℕ`, `volume.real(U_q((s/2)K)) = (2q+1)^d·(s/2)^d·volume.real(K)`.
`K` is the compact nonempty `ConvexBody`; compactness is used to convert finite union measures to
real volume.
(Source: Henk2002, p.5, (3.2).)
*Needs:* Mathlib `Pi.card_Icc`, `Int.card_Icc`, `MeasureTheory.Measure.addHaar_smul_of_nonneg`,
`IsCompact.measure_lt_top`, 3.11 `strict_flag_translate_separation`, 3.1
`finite_interior_disjoint_translate_volume`.
**Checks.**

- For `q = 1` and `K = [−1,1]²` with `s = 1`, the union area is `9 = 3²·(1/2)²·4`.
- For `q = 1`, `K = [−2,2]×[−1,1]` and `s = 1/2`, the union area is `9/2 = 3²·(1/4)²·8`.

Prove `outer_lattice_box_volume` (3.16): for any compact `S ⊆ ℝ^d` there is `R ≥ 0` such that, for
every `q ∈ ℕ`, `volume.real(U_q(S)) ≤ (2q+2R)^d`.
`S` need not be convex, symmetric or nonempty. `R` depends on `S` and `d` but is chosen once,
independently of `q`.
(Source: Henk2002, p.5, (3.1).)
*Needs:* Mathlib `IsCompact.isBounded`, `isBounded_iff_forall_norm_le'`,
`MeasureTheory.measureReal_mono`, `Real.volume_Icc_pi`.
**Checks.**

- For `q = 1` and `R = 3/2` in dimension two, the enclosing area is `(2+3)² = 25`, bounding the
  anisotropic row example of area 15.
- In dimension zero the right side is one, including `q = R = 0`; the empty union's volume is zero.

Prove `weighted_ratio_product` (3.17): for `n ∈ ℕ` and positive `a : Fin (n+1) → ℝ`,
`a_0^(n+1)·∏_{i : Fin n} (a_{i+1}/a_i)^(n−i) = ∏_{j : Fin (n+1)} a_j`.
All `a_j` are strictly positive, so every denominator is nonzero. No monotonicity is needed for this
algebraic identity. With `n = 0` the ratio product is empty and both sides are `a_0`.
(Source: Henk2002, p.7, the final product expansion.)
*Needs:* Mathlib `Fin.prod_univ_succ`.
**Checks.**

- For `a = (2,3,5)`, `2³·(3/2)²·(5/3) = 30 = 2·3·5`.
- For `a = (2,2,5)`, the repeated ratio is one and the identity gives 20.
- For `n = 0`, the empty ratio product gives `a_0^1 = a_0`.

Prove `weighted_volume_chain` (3.18): for positive `a : Fin (n+1) → ℝ`, nonnegative
`V : Fin (n+1) → ℝ` and `B ≥ 0`, assume `a_0^(n+1) B ≤ V_0` and `(a_{i+1}/a_i)^(n−i) V_i ≤ V_{i+1}`
for every `i : Fin n`. Then `(∏_j a_j) B ≤ V_n`.
All sequence entries and endpoints use `Fin (n+1)`. The recurrence has exactly `n` inequalities, so
for `n = 0` the conclusion is the initial inequality.
(Source: Henk2002, p.7, the chain of inequalities after (3.6).)
*Needs:* 3.17 `weighted_ratio_product`.
**Checks.**

- For `a = (2,3,5)`, `B = 1` and `V = (8,18,30)`, the two recurrence steps are equalities and the
  endpoint is 30.
- With `B = 0` and `V` identically zero the conclusion holds; a proof that divides by a volume would
  be invalid.

Prove `large_box_comparison_limit` (3.19): for `d ∈ ℕ` and real `R, B`, if
`(2q+1)^d B ≤ (2q+2R)^d` for every `q ∈ ℕ`, then `B ≤ 1`.
The scalar statement does not require `R ≥ 0` or `B ≥ 0`; the geometric application supplies both.
The denominator `2q+1` is always strictly positive. Dimension zero is allowed.
(Source: Henk2002, p.7, the last display and its conclusion for all `q`.)
*Needs:* Mathlib `tendsto_add_mul_div_add_mul_atTop_nhds`, `le_of_tendsto'`.
**Checks.**

- For `R = 1/2` the ratio `(2q+2R)/(2q+1)` is identically one.
- For `d = 0` both powers are one even when the numerator vanishes.

Prove `coordinate_flag_upper` (3.20): let `K` be a symmetric convex body in `ℝ^d` with 0 in its
interior, and let `a : Fin d → ℝ` be positive and nondecreasing. Suppose for every `i` and
`z ∈ ℤ^d`, `gauge_K(c(z)) < a_i` implies `z_j = 0` for all `j ≥ i`. Then
`(∏_i a_i)·volume.real(K) ≤ 2^d`.
The `a_i` are threshold data satisfying the explicit flag condition; the statement does not define a
new successive-minimum invariant. The conclusion includes `d = 0`.
(Source: Henk2002, §3, pp.5–7, (3.1)–(3.6) and final display.)
*Needs:* Mathlib `MeasureTheory.Measure.volume_pi_eq_dirac`, `ConvexBody.isCompact`, 3.14
`flag_box_volume_ratio`, 3.15 `first_box_volume`, 3.18 `weighted_volume_chain`, 3.16
`outer_lattice_box_volume`, 3.19 `large_box_comparison_limit`.
**Checks.**

- For ℤ² and `K = [−3,3]×[−1,1]`, thresholds (1/3,1) give product-volume 4, exactly `2²`.
- For the unit diamond and thresholds (1,1), the product-volume is `2 < 4`.
- For `d = 0` the product-volume and the bound are both one.

Prove `minkowski_second_upper` (3.21): for a discrete full `ℤ`-lattice `L` in a finite-dimensional
real normed space `E`, an additive Haar measure `μ` and a centrally symmetric convex body `K` with 0
in its interior, `(∏_{i : Fin d} λ_i(L,K))·μ.real(K) ≤ 2^d·covolume(L,μ)`, where `d = dim_ℝ E` and
`λ_i` is the zero-based successive minimum of 1.1. The measure `μ` is explicit; on an inner-product
space one may take canonical Euclidean volume. The formula includes `d = 0`.
`E` carries its Borel structure and `μ` is an additive Haar measure. Use the Euclidean and
Haar-scalar transport of 2.1.4; neither the definition of the minima nor the flag changes under it.
Then prove the canonical intrinsic Euclidean volume case. `L` uses `Submodule ℤ E`,
`DiscreteTopology` and `IsZLattice`; `K` uses `ConvexBody`. Lower-rank lattices are first regarded
as full lattices in their real spans, with intrinsic measure. No ambient-volume conclusion for a
lower-dimensional body is substituted.
In the Euclidean model, let `b` be the integral basis of 1.13 and transport by its coordinate
isomorphism `E ≃ ℝ^d`. It sends `L` to `ℤ^d` and `K` to a symmetric convex body of volume
`volume(K)/covolume(L)` with the same gauge values (3.8). There the strict flag condition of 3.20
holds with `a_i = λ_i`, which are positive and nondecreasing by 1.4 and 1.5, and 3.20 gives the
bound.
(Source: Henk2002, p.2 Theorem 1.3 and complete §3 proof, pp.5–7.)
*Needs:* Mathlib `toEuclidean`, `ContinuousLinearEquiv.isAddHaarMeasure_map`,
`ZLattice.covolume_comap`, `Module.Basis.ofZLatticeBasis_repr_apply`,
`Module.Basis.mem_flag_iff_repr_eq_zero`, `Module.Basis.equivFun`, `Convex.linear_image`,
`Homeomorph.image_interior`, `IsCompact.image`, `IsCompact.isClosed`, `IsClosed.measurableSet`,
`ZLattice.volume_image_eq_volume_div_covolume'`, `ZLattice.covolume_pos`,
`IsCompact.measure_lt_top`, 1.11 `successiveMin_linearEquiv`, 1.13
`exists_integral_minimum_flag`, 3.8 `gauge_linearEquiv`, 1.4 `successiveMin_pos`, 1.5
`successiveMin_monotone`, 3.20 `coordinate_flag_upper`.
**Checks.**

- For `L = 2ℤ` and `K = [−3,3]`, minimum 2/3 times length 6 is `4 = 2·covolume(L)`; omitting the
  covolume would assert `4 ≤ 2`.
- For `L = 2ℤ×3ℤ` and `K = [−2,2]×[−1,1]`, minima (1,3) and area 8 give `24 = 4·6`.
- In the zero-dimensional canonical space the empty product, volume, covolume and `2^0` are all one.
- In `Fin 2 → ℝ` with the sup norm, `L = 2ℤ×3ℤ` and `K = [−2,2]×[−1,1]` have minima (1,3). With `μ`
  three times product Lebesgue measure, `μ.real(K) = 24` and `covolume(L,μ) = 18`, so
  `3·24 = 4·18`.
- Twice canonical volume doubles both sides; an equality box remains an equality for `c > 0`; in
  dimension zero both sides equal `μ({0})`.

### Examples

For `L = ℤ^d` and the cube `K = [−1,1]^d` every minimum is `1`, and the product
`λ_1⋯λ_d · vol K = 2^d` attains the upper bound. The box `∏[−a_i,a_i]` attains it for all positive
half-widths (2.1.5).

### Dependencies

Layer 1, and the Euclidean and Haar-scalar transport of 2.1.4; Mathlib `Convex.addHaar_frontier`,
`ZLattice.volume_image_eq_volume_div_covolume'`, the product-measure section lemmas and the
Haar-measure image lemmas.

## Provenance

The section texts are adapted, with the author's agreement, from the geometry-of-numbers layers of
CBirkbeck's GeometryOfNumbersAndQuadraticArithmetic roadmap, which builds on this one.

A sorry-free formalization of most of this material, written against a recent Mathlib, is in
[rwst/Subspace-Theorems](https://github.com/rwst/Subspace-Theorems) at commit `09835cb`, under
`ArithmeticHeights/` (Apache-2.0, by Ralf Stephan). Its statements use its own carriers: a
real-valued `ZLattice.successiveMinimum` defined as the dilation infimum of 1.1, natural-number
indices, and convex, symmetric, bounded sets with nonempty interior. Its minima calculus therefore
covers symmetric bodies only. Porting it means restating it against the carriers above, not
copying its interfaces.

| Here | Source file | Source declarations |
| --- | --- | --- |
| 1.1, 1.4, 1.5, 1.7, 1.10 | `SuccessiveMinima.lean` | `successiveMinimum`, `successiveMinimum_pos`, `successiveMinimum_le_of_le`, `exists_linearIndependent_gauge_eq_successiveMinimum`, `mem_span_of_gauge_lt_successiveMinimum`, `successiveMinimum_smul` |
| 1.13, in the stronger form with integral flags | `MinkowskiSecond.lean` | `exists_basis_mem_span_int_of_gauge_lt` |
| 2.1.4 | `MinkowskiSecond.lean` | `covolume_le_prod_successiveMinimum_mul_measure` |
| 3.21 | `MinkowskiSecond.lean` | `prod_successiveMinimum_mul_measure_le` |
| 0.1.2 (real matrix form) | `Hadamard.lean` | `det_mul_transpose_self_le_prod`, `sum_sq_norm_plucker_row_le_prod` |

Its proof of the upper inequality takes Weyl's route, as in Cassels, Ch. VIII, not Henk's. The
lattice bases of `AdaptedBasis.lean` and `MinimaBasis.lean` are already in Tau Ceti as
`ZLattice.exists_basis_triangular` and `ZLattice.exists_basis_gauge_le`.

## References

- **Cassels** — J. W. S. Cassels, *An Introduction to the Geometry of Numbers*, Springer, 1959.
- **Couveignes2020** — Jean-Marc Couveignes, *Enumerating number fields*. Annals of Mathematics
  192 (2020), 487–497.
  https://annals.math.princeton.edu/wp-content/uploads/annals-v192-n2-p04-s.pdf
- **Evertse2023** — Jan-Hendrik Evertse, *Diophantine approximation, Chapter 2: Geometry of
  numbers*. Author-hosted dio19-2.pdf linked by the Fall 2023 course page.
  https://pub.math.leidenuniv.nl/~evertsejh/dio19-2.pdf
- **Henk2002** — Martin Henk, *Successive Minima and Lattice Points*. arXiv:math/0204158v1
  (12 April 2002); Rend. Circ. Mat. Palermo (2), Suppl. 70 (2002), 377–384.
  https://arxiv.org/pdf/math/0204158v1

## Misprints in the sources

The following passages of the sources are misprinted or incomplete as printed; the targets above
use the corrected statements.

- **M1** (Evertse2023, Lemma 2.10, printed p.26 (physical p.16).) The coefficients of the `r` given
  vectors are indexed by `i = 1, …, r`, matching both sums. The ambient dimension is `n`.
- **M2** (Evertse2023, remark after Theorem 2.9, printed pp.24–25 (physical pp.14–15).) Require an
  invertible real linear transformation (a linear equivalence). Its nonzero determinant permits
  cancellation in the following covolume-to-volume quotient.
