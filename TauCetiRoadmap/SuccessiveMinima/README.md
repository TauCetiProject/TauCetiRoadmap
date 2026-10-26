# Roadmap: successive minima and Minkowski's theorems

**Summary.** This roadmap develops the successive minima of a convex body with respect to a lattice
and the lower half of Minkowski's second theorem, in a finite-dimensional real normed space with an
arbitrary additive Haar measure, together with the sharpness of both halves. It also covers the
hermitian Gram–Hadamard bound, integral bases with a prescribed flag, and Minkowski's linear forms
theorem. We want it because these are the basic quantitative tools of the geometry of numbers:
Siegel's lemma and its Bombieri–Vaaler form, bases of unit lattices of controlled height, the
Subspace Theorem, lattice-point counting and reduction theory all start from them.

The roadmap builds on Mathlib's `ZLattice`, `ConvexBody`, `gauge` and Minkowski's first theorem,
and on Tau Ceti's real-valued body minima `ZLattice.successiveMin`, with their attainment, threshold
calculus and the upper half of Minkowski's second theorem. It adopts the foundational successive
minima of
[Mathlib's successive-minima proposal](https://github.com/leanprover-community/mathlib4/pull/35812),
identifies them with Tau Ceti's body minima, and proves on the body minima:
- the rank forms of the threshold calculus, and one real basis attaining all minima with the
  strict-sublevel flags, for bodies that need not be symmetric;
- monotonicity in the body and the lattice, and transport along linear equivalences;
- an integral basis whose flag contains the strict sublevels;
- the lower half of Minkowski's second theorem, with equality on weighted cross-polytopes, and
  equality in the upper half on weighted boxes;
- Minkowski's first theorem on successive minima.

The end theorem is `minkowski_second_lower` (2.1.4).

| Layer | Construction |
| --- | --- |
| 0 | Gram determinants and integral bases with a prescribed flag |
| 1 | Successive minima |
| 2 | Minkowski's lower inequality and the linear forms theorem |
| 3 | Translate volumes and consequences of the upper inequality |

Layer 1 needs Layer 0.2 only for the integral minimum flag (1.11). Layer 2 needs Layer 1. Layer 3
needs Tau Ceti's upper inequality and the body-minimum API. Layer 0.1 is independent of the rest.

Suggested home: `TauCeti/MeasureTheory/Group/GeometryOfNumbers/` for `MeasureTheory.successiveMin`
and its lemmas (1.1b), beside Mathlib's `Mathlib/MeasureTheory/Group/GeometryOfNumbers.lean`;
`TauCeti/Algebra/Module/ZLattice/SuccessiveMinima.lean` for the rest of Layer 1;
`TauCeti/NumberTheory/GeometryOfNumbers/` for Layers 2 and 3;
`TauCeti/Analysis/InnerProductSpace/` for Layer 0.1; and `TauCeti/Algebra/Module/ZLattice/` for
Layer 0.2.

## Scope and boundaries

### Owned here

- The hermitian Gram–Hadamard inequality and its coordinate form (0.1).
- The integral basis with the flags of a prescribed real basis of lattice vectors (0.2).
- The foundational `MeasureTheory.successiveMin` of Mathlib's successive-minima proposal, its
  identification with Tau Ceti's `ZLattice.successiveMin`, and the natural-index extension
  `successiveMinNat`, with:
  - the proposal's lemmas on the foundational definition (1.1b);
  - the rank forms of the threshold calculus;
  - attainment by one real basis with the strict-sublevel flags;
  - monotonicity in the body and the lattice;
  - scaling and transport along linear equivalences;
  - the integral minimum flag (Layer 1).
- The lower half of Minkowski's second theorem, with an explicit additive Haar measure, and the box
  and cross-polytope minima that show both halves are sharp (2.1).
- Minkowski's linear forms theorem with its boundary convention (2.2).
- Two volume lemmas for translates of convex sets, the coordinate form of the upper inequality, and
  Minkowski's first theorem on successive minima, `λ_0^d·μ(K) ≤ 2^d·covolume(L,μ)` (Layer 3).

### Already in Mathlib or Tau Ceti

These are used without restatement:
- Blichfeldt's theorem, `MeasureTheory.exists_pair_mem_lattice_not_disjoint_vadd`.
- Tau Ceti's real-valued successive minima of a `ℤ`-submodule with respect to a convex body, in
  `TauCeti/Algebra/Module/ZLattice/SuccessiveMinima.lean`: `ZLattice.successiveMin L K i` for
  `i : Fin (finrank ℝ E)`, the real infimum of the `t ≥ 0` such that `t • K` contains `i+1`
  real-linearly independent vectors of `L`. For a discrete full `L` and `0 ∈ interior K`, with no
  symmetry, it supplies:
  - the threshold `ZLattice.successiveMin_le_iff` and its attainment
    `ZLattice.successiveMin_isLeast`, both stated with independent families;
  - positivity `ZLattice.successiveMin_pos` and monotonicity `ZLattice.monotone_successiveMin`;
  - independent lattice vectors attaining all minima,
    `ZLattice.exists_linearIndependent_gauge_eq_successiveMin`;
  - the strict-sublevel flag of such vectors,
    `ZLattice.mem_span_image_Iio_of_gauge_lt_successiveMin`;
  - a lattice vector of least gauge outside a proper subspace,
    `ZLattice.exists_mem_notMem_forall_gauge_le`.

  For symmetric `K` it supplies the integral basis with `b_i ∈ (max 1 ((i+1)/2)·λ_i)·K`,
  `ZLattice.exists_basis_mem_smul_successiveMin`.
- The upper half of Minkowski's second theorem, in Tau Ceti's
  `TauCeti/NumberTheory/GeometryOfNumbers/MinkowskiSecond.lean`:
  `ZLattice.prod_successiveMin_mul_measureReal_le_two_pow_mul_covolume`, which is
  `(∏_i λ_i(L,K))·μ.real(K) ≤ 2^d·covolume(L,μ)` for a discrete full `L`, an arbitrary additive Haar
  measure `μ` and a symmetric `K : ConvexBody E`, with no interior hypothesis. Its general form
  `ZLattice.prod_mul_measure_le_two_pow_mul_covolume` takes independent lattice vectors `a_i` and
  numbers `g_i ≥ 0` such that every lattice vector of gauge below `g_j` lies in the span of
  `a_0, …, a_(j−1)`. The `ENNReal` form is
  `ZLattice.prod_successiveMin_mul_measure_le_two_pow_mul_covolume`.
- The gauge of a preimage under a linear map, Tau Ceti's `LinearMap.gauge_preimage`, and the gauge
  sublevels of a convex body as its dilates, `ConvexBody.gauge_le_iff_mem_smul` and
  `ConvexBody.gauge_pos_iff`.
- Minkowski's first theorem in its strict and compact forms,
  `MeasureTheory.exists_ne_zero_mem_lattice_of_measure_mul_two_pow_lt_measure` and
  `…_le_measure`.
- The Gram determinant of the image of an orthonormal basis as a squared normal determinant,
  `LinearMap.normDet_sq_eq_det_gram`.
- The squared covolume as a Gram determinant, Tau Ceti's `ZLattice.covolume_sq_eq_det_gram`.
- In Tau Ceti, in `TauCeti/Algebra/Module/ZLattice/AdaptedBasis.lean` and `GaugeBasis.lean`:
  - the triangular, reduced lattice basis adapted to a real basis of lattice vectors,
    `ZLattice.exists_basis_triangular`;
  - the lattice basis of controlled gauge, the general form of HeightsAndUnits 2.1,
    `ZLattice.exists_basis_gauge_le` and `ZLattice.exists_basis_gauge_le_max_one_mul` (Cassels,
    Ch. V, Lemma 8, p.135; the per-index constant of the second follows from it when the given
    vectors are ordered by gauge).
- The squared-norm successive minima of a positive definite integral lattice
  ([IntegralLattices](../IntegralLattices/README.md) 2F), in Tau Ceti as
  `TauCeti.IntegralLattice.successiveMinimum`, and their Minkowski bound
  `TauCeti.IntegralLattice.IsPosDef.prod_successiveMinimum_mul_pi_pow_le`. Those are natural numbers
  on the `IntegralLattice` carrier, bounded through the Euclidean ball. The minima here are
  `ZLattice.successiveMin`, real numbers on `ConvexBody` carriers, bounded by the exact volume of
  the body.

### Not owned here

Other geometry of numbers built on this roadmap is out of scope, including:
- the comparison between the real minima here and the squared-norm minima of IntegralLattices 2F,
  which belongs to GeometryOfNumbersAndQuadraticArithmetic;
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
minima of a body are Tau Ceti's `ZLattice.successiveMin`, real numbers indexed by `i : Fin d`,
`d = finrank ℝ E`, with `i` meaning the `(i+1)`-st minimum; no second body-minimum function is
introduced. There is no minimum in dimension zero. The polar of a box is a weighted cross-polytope.

**Mathlib's successive-minima proposal.** Build `MeasureTheory.successiveMin` here, with the name,
signature and definition of
[revision `8423d1c`, lines 63–304](https://github.com/khwilson/mathlib4/blob/8423d1c878e50d8504a230ffd9b6ec76ce6a08eb/Mathlib/MeasureTheory/Group/GeometryOfNumbers.lean#L63-L304),
so that adopting the proposal if it lands is a deletion plus an import. The
[Zulip design discussion](https://leanprover-community.github.io/archive/stream/217875-Is-there-code-for-X%3F/topic/Minkowski.20Lattice.20Theorem.html)
motivates the arbitrary-set core and the separate geometric hypotheses. The proposal's junk-value,
monotonicity, threshold-attainment and directional-family and basis lemmas are built here as well,
with its names and hypotheses (1.1b). A directional basis is a real ambient basis, not necessarily
an integral lattice basis. The
proposal's `proof_wanted` form of Minkowski's second theorem supplies no proof; the upper inequality
is Tau Ceti's, and the lower one is 2.1.4.

## Headline signatures

The opening theorem block of `Suggested.lean` states `minkowski_second_lower` (2.1.4) against the
body minima `successiveMin` (1.1). Its source locators and checks are in 2.1.4 below.

`Suggested.lean` imports only Mathlib, so it restates `ZLattice.successiveMin` with its Tau Ceti
definition, as `TauCetiRoadmap.SuccessiveMinima.successiveMin`, and states every body-minimum target
against it. The Tau Ceti declarations listed above are not restated there.

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
`InnerProductSpace.gramSchmidtOrthonormalBasis_det`, `norm_inner_le_norm`.
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
`d = finrank ℝ E`. Reuse `Basis` and `Basis.flag`. Flag indices are zero-based. Prefix spans
of an integral basis `b` are written `span ℝ {b j | j < k}`, because its real extension
`Basis.ofZLatticeBasis` needs the fullness instance that 0.2.1 derives. After 0.2.1 they are
`(Basis.ofZLatticeBasis ℝ L b).flag k`.

Prove `exists_integral_basis_same_flag` (0.2.1): for a real basis `w : Fin d → E` with `w_i ∈ L`,
there is an integral basis `b : Fin d → L` whose real extension has exactly the same basis flags as
`w` at every `k = 0, …, d`.
Equality concerns real prefix spans, not equality of the vectors or of their integral spans. The
`w_i` need not be an integral basis. `L` is full as a consequence, not a hypothesis.
Tau Ceti's `ZLattice.exists_basis_triangular` gives an integral basis `b` with `b_j` in the real
span of `w_0, …, w_j`. So the `k`-th flag of `b` lies in that of `w`. Both have dimension `k`,
because `b` is real-linearly independent: its real span contains every `w_i`, so it is all of `E`.
(Source: Cassels, Ch. I, Theorem I B, pp.11–13; Henk2002, p.3, prefix-span equality and (2.1).)
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

The successive minima `λ_i(L, K)` of a convex body `K` with `0` in its interior with respect to a
discrete full lattice `L` are Tau Ceti's `ZLattice.successiveMin L K i`, real numbers indexed by
`Fin d` with `d = dim E`. Tau Ceti proves their attainment, positivity, monotonicity in the index
and threshold calculus in terms of independent families, for bodies that need not be symmetric.
This layer builds the foundational definition of Mathlib's proposal on arbitrary sets and proves
that it agrees with `ZLattice.successiveMin` (1.1). It then proves the rank forms of the threshold
calculus and one real basis attaining all minima with the strict-sublevel flags, as corollaries of
the Tau Ceti API. It proves their monotonicity in the body and the lattice and their transport
along linear equivalences, and ends with the integral minimum flag (1.11). The minima live on the
carriers `IsZLattice` and `ConvexBody`, and the symmetry hypothesis is imposed only where a
statement needs it.

Write `λ_i` for `ZLattice.successiveMin L K i` below. The Tau Ceti inputs are used as follows.

| Role | Tau Ceti declaration |
| --- | --- |
| threshold with independent families | `ZLattice.successiveMin_le_iff`, `ZLattice.successiveMin_le` |
| attainment of the threshold | `ZLattice.successiveMin_isLeast` |
| positivity, monotonicity in the index | `ZLattice.successiveMin_pos`, `ZLattice.monotone_successiveMin` |
| one independent family attaining all minima | `ZLattice.exists_linearIndependent_gauge_eq_successiveMin` |
| strict-sublevel flags of that family | `ZLattice.mem_span_image_Iio_of_gauge_lt_successiveMin` |
| least gauge outside a proper subspace | `ZLattice.exists_mem_notMem_forall_gauge_le` |
| gauge sublevels as dilates | `ConvexBody.gauge_le_iff_mem_smul`, `ConvexBody.gauge_pos_iff` |

The symmetric-body source for the definition and gauge calculus of 1.1–1.5 and the scaling law of
1.8 is Evertse2023, §2.3, Lemma 2.8, printed pp.23–24 (physical pp.13–14). The proofs below also
give the stated nonsymmetric extension. 1.5 is Cassels, Ch. VIII, Lemma 1, p.204, which is stated
for any bounded star body and so needs no symmetry.

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
`sInf {r : ℝ≥0 | i < Set.finrank ℝ (r • s ∩ L)}`, following the Mathlib proposal. The body minimum
is Tau Ceti's `ZLattice.successiveMin L K i`, for `K : ConvexBody E` and `i : Fin d`: the real
infimum of the `t ≥ 0` such that the dilate `t·K` contains `i.val+1` real-linearly independent
vectors of `L`.

In finite dimension prove `MeasureTheory.coe_successiveMin`: for every `ℤ`-submodule `L`, every
`K : ConvexBody E` and every `i : Fin d`,
`(MeasureTheory.successiveMin L (K : Set E) i.val : ℝ) = ZLattice.successiveMin L K i`.
This comparison needs no discreteness, fullness, interior or symmetry. The `Fin d` index excludes
every index `≥ d`, at which no such `t` exists and both infima are the junk value `sInf ∅ = 0`. The
geometric laws of the minima require `L` discrete and full and `0 ∈ interior K`; central symmetry is
needed for Minkowski's product inequalities.

In finite dimension a set `S` has `i.val < Set.finrank ℝ S` exactly when it contains `i.val+1`
real-linearly independent vectors: extract an independent family spanning `span ℝ S`, or bound the
rank below by the family. So the two threshold sets correspond under `ℝ≥0 → ℝ`, and the real
infimum of the image of a set of `ℝ≥0` is the coercion of its infimum, also when the set is empty.
The threshold calculus, attainment, monotonicity and transport targets are 1.2–1.10; the integral
minimum flag is 1.11. The prescribed box and cross-polytope minima are `successiveMin_box` (2.1.5)
and `successiveMin_crosspolytope` (2.1.6).

For a closed body with zero in its interior and `t > 0`, `x ∈ t·K` exactly when `gauge K x ≤ t`
(`ConvexBody.gauge_le_iff_mem_smul`), and only the zero vector has gauge zero
(`ConvexBody.gauge_pos_iff`). This identifies the dilation infimum with the least gauge threshold of
`successiveMin_isLeast_gauge` (1.3), which is how the gauge calculus below is read off the
definition.
*Needs:* Mathlib `Set.finrank`, `exists_linearIndependent`, `finrank_span_eq_card`,
`LinearIndependent.fintype_card_le_finrank`, `Submodule.finrank_mono`, `NNReal.coe_sInf`; Tau Ceti
`ZLattice.successiveMin_def`.
**Checks.**

- For `L = ℤ ⊂ ℝ` and `K = [−2,2]`, `λ_0(L,K) = 1/2` (`successiveMin_int_Icc`).
- For `L = ℤ²` and `K = K₂₃`, `(λ_0, λ_1) = (2,3)`, attained by `e₀, e₁` in that order
  (`successiveMin_box_two_three`).
- For the zero lattice in `ℝ^0` and its singleton convex body, the product over all minima indices
  is 1.
- For `L = 2ℤ` in ℝ and `K = [−1,1]`, `λ_0 = 2`, not 1.
- On `K = closedBall(0,1)`, the gauge-threshold condition of `successiveMin_isLeast_gauge` is
  `dim span{x ∈ L : ‖x‖ ≤ r} ≥ i.val+1`.
- In ℤ² with the unit square, vectors (1,1),(1,−1) independently attain both minima 1, but their
  integral span has index two.
- In ℤ and `K = [−1,1]`, the attained minimum 1 has nonzero boundary witnesses; the strict sublevel
  `{x ∈ ℤ : gauge K x < 1}` is `{0}`.
- For a lattice that is not full (`ℤ(1,0)` in `ℝ²`) the minima beyond the rank are the junk value
  `0` of `sInf ∅` in both definitions; the comparison still holds. The geometric laws of this
  layer retain `IsZLattice ℝ L`.
- For the nondiscrete subgroup `ℤ + ℤ√2` in ℝ and `K = [−1,1]`, both definitions give zero; the
  comparison does not assert attainment or positivity.

**Natural-index extension** (1.1a). Define `successiveMinNat L K i` for `i : ℕ` to be
`ZLattice.successiveMin L K ⟨i, hi⟩` if `hi : i < d`, and zero otherwise. Prove
`successiveMinNat_of_lt` for the first branch and `successiveMinNat_of_le` for `d ≤ i`. The
extension is zero-based, so an index `i` below `d` still denotes the source's `(i+1)`-st minimum.
These identities are definitional and need no discreteness, fullness, interior or symmetry
hypotheses. In finite dimension prove `successiveMinNat_eq`:
`successiveMinNat L K i = (MeasureTheory.successiveMin L (K : Set E) i : ℝ)` for every natural
index: below `d` this is 1.1, and beyond it both sides are zero by `successiveMin_of_finrank_le`
(1.1b). They apply when a
dimension formula is a proved equality rather than a definitional one. Positivity and monotonicity
concern the restriction to indices below `d`; the zero extension need not be monotone on ℕ.
(Source: Evertse2023, §2.3, definition of successive minima, printed p.23, with the zero-based
reindexing of 1.1; the out-of-range value is the explicit convention here.)
*Needs:* Tau Ceti `ZLattice.successiveMin`, Mathlib `Fin`, 1.1 `MeasureTheory.coe_successiveMin`,
1.1b `successiveMin_of_finrank_le`.
**Checks.**

- For ℤ² and `K₂₃`, the natural-index values at 0, 1 and 2 are 2, 3 and 0; index 2 is not a third
  positive minimum (`successiveMinNat_box_two_three`).
- In dimension zero every natural-index value is zero in both `successiveMinNat` and the
  foundational definition, while the product over `Fin 0` remains one.
- For the standard lattice in `ℝ⁶` and the box with weights `(1,2,3,4,5,6)` (half-widths
  `1,1/2,1/3,1/4,1/5,1/6`), the natural-index values at `2 = 2·1` and `6 = 2·3` are `3` and `0`
  (`successiveMinNat_box_six`, and an `example` for index 6). The indices are transported along the
  proved dimension equality, which supplies the bounds of `successiveMinNat_of_lt` and
  `successiveMinNat_of_le`.

**Foundational lemmas** (1.1b). Build, with the names and hypotheses of the proposal's revision
`8423d1c`, its lemmas on `MeasureTheory.successiveMin L s i`. `E` is finite-dimensional
throughout. Every lemma except `successiveMin_of_finrank_le` and `successiveMin_of_setFinrank_le`
assumes `DiscreteTopology L`.
1. The junk values: `successiveMin_of_finrank_le` (`finrank ℝ E ≤ i`),
   `successiveMin_of_setFinrank_le` (`Set.finrank ℝ L ≤ i`) and `successiveMin_of_finrank_int_le`
   (`finrank ℤ L ≤ i`) each give `0`.
2. For absorbent `s`, the threshold set is nonempty: `exists_lt_setFinrank_smul_inter`
   (`i < finrank ℤ L`) and `exists_lt_setFinrank_smul_inter_zLattice` (`IsZLattice ℝ L`,
   `i < finrank ℝ E`). Below the rank the minima are monotone in the index, `successiveMin_mono`
   (`i ≤ j`, `j < finrank ℤ L`).
3. For convex `s` with `s ∈ 𝓝 0` and `i < finrank ℤ L`,
   `exists_linearIndependent_of_successiveMin_lt`: for `successiveMin L s i < r`, the set
   `r • s ∩ L` contains `i+1` integrally independent vectors.
4. For convex compact `s` with `s ∈ 𝓝 0`, attainment. For `i < finrank ℤ L` the threshold set is
   closed, `isClosed_setOf_lt_setFinrank_smul_inter`, so it contains its infimum,
   `lt_setFinrank_successiveMin_smul`. The directional family `exists_directional_set'` is a
   real-independent `v : Fin (finrank ℤ L) → E` with `v j ∈ successiveMin L s j • s ∩ L`.
   `exists_directional_set` is the same family as an integrally independent family in `L`.
   For `IsZLattice ℝ L`, `exists_directional_basis` is a real basis of `E` with the same property.

They rest on five auxiliary lemmas of the same revision, built here with its names and statements.
The first two are in its
[`ZLattice/Basic.lean`](https://github.com/khwilson/mathlib4/blob/8423d1c878e50d8504a230ffd9b6ec76ce6a08eb/Mathlib/Algebra/Module/ZLattice/Basic.lean#L681-L693):
`setFinrank_real_eq_setFinrank_int_of_subset_discreteTopology` (a set of vectors of a discrete `L`
has equal real and integral `Set.finrank`) and `setFinrank_real_eq_finrank_int`. Both come from
Mathlib's `Real.finrank_eq_int_finrank_of_discrete`. The next two are in its
[`Gauge.lean`](https://github.com/khwilson/mathlib4/blob/8423d1c878e50d8504a230ffd9b6ec76ce6a08eb/Mathlib/Analysis/Convex/Gauge.lean#L493-L513):
`setOf_gauge_le_eq_closure_smul_of_pos` and `setOf_gauge_le_eq_closure_smul`, which say
`{x | gauge s x ≤ a} = closure (a • s)` for convex `s ∈ 𝓝 0`, with `a > 0`, or with `a ≥ 0` and
`s` von Neumann bounded in a `T1Space`. The last is in its
[`Convex/Basic.lean`](https://github.com/khwilson/mathlib4/blob/8423d1c878e50d8504a230ffd9b6ec76ce6a08eb/Mathlib/Analysis/Convex/Basic.lean#L573-L574):
`Convex.smul_mono_of_zero_mem`, `p • s ⊆ q • s` for convex `s ∋ 0` and `0 ≤ p ≤ q`.

A `ConvexBody` with `0` in its interior is convex, compact and a neighbourhood of `0`. On such a
body, and through 1.1, these lemmas are the foundational counterparts of Tau Ceti's body-minimum
API: `lt_setFinrank_successiveMin_smul` of `ZLattice.successiveMin_isLeast`, `successiveMin_mono`
of `ZLattice.monotone_successiveMin`, and `exists_directional_basis` of
`ZLattice.exists_linearIndependent_gauge_eq_successiveMin`. They extend that API to arbitrary sets
and to lattices of lower rank. The body-minimum targets below use the Tau Ceti API.
(Source: the proposal, revision `8423d1c`, lines 80–304.)
*Needs:* Mathlib `Real.finrank_eq_int_finrank_of_discrete`, `ZLattice.rank`,
`Module.Free.exists_basis`, `Absorbent.absorbs_finite`, `absorbent_nhds_zero`,
`Submodule.exists_fun_fin_finrank_span_eq`, `Set.finrank_mono`, `setOfPred_gauge_le_eq`,
`gauge_le_one_iff_mem_closure`, `closure_smul₀'`, `AddSubgroup.isClosed_of_discreteTopology`,
`IsSeqClosed.isClosed`, `IsClosed.csInf_mem`, `LinearIndependent.finSnoc`,
`basisOfLinearIndependentOfCardEqFinrank`, 1.1 `MeasureTheory.successiveMin`.
**Checks.**

- For `L = ℤ(1,0)` in `ℝ²` and the unit square, `successiveMin L s 1 = 0` by
  `successiveMin_of_setFinrank_le`, although `1 < finrank ℝ E = 2`. Since `λ_0 = 1`,
  `successiveMin_mono` fails at `j = 1` without `j < finrank ℤ L`.
- For `L = 2ℤ` and `s = [−1,1]` the index-0 threshold set is `[2,∞)` and contains its infimum `2`.
  For the open interval `s = (−1,1)`, which is convex and a neighbourhood of `0` but not compact, it
  is `(2,∞)`, and `2 • (−1,1) ∩ 2ℤ = {0}`: `lt_setFinrank_successiveMin_smul` fails, so compactness
  is load-bearing.
- For `ℤ²` and the unit square, `(1,1),(1,−1)` satisfies the conclusion of
  `exists_directional_basis` but spans a sublattice of index two.

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

Prove `successiveMin_isLeast_gauge` (1.3): for every `i : Fin d`, `λ_i(L,K)` is the least element of
`A_i = {r ≥ 0 : dim span_ℝ{x ∈ L : gauge K x ≤ r} ≥ i.val+1}`. `K` need not be symmetric.
For `r > 0`, `gauge K x ≤ r` exactly when `x ∈ r·K`, and a set contains `i.val+1` real-linearly
independent vectors exactly when its span has dimension at least `i.val+1`. So for `r > 0` the
members of `A_i` are the thresholds of `ZLattice.successiveMin_le_iff`, and `λ_i` is a lower bound
of `A_i` by `ZLattice.successiveMin_le`. `r = 0` is not a member, since only the zero vector has
gauge zero. `λ_i` is a member by `ZLattice.successiveMin_isLeast`, because `λ_i > 0`.
*Needs:* Mathlib `Submodule.finrank_mono`, `finrank_span_eq_card`, `exists_linearIndependent`; Tau
Ceti `ConvexBody.gauge_le_iff_mem_smul`, `ConvexBody.gauge_pos_iff`, `ZLattice.successiveMin_le`,
`ZLattice.successiveMin_isLeast`, `ZLattice.successiveMin_pos`.
**Checks.**

- `A_i` contains its endpoint; replacing ≤ by < in the membership assertion is false.
- For `K₂₃` the rank jumps from zero to one at 2 and from one to two at 3; for `K₃₂` the first
  rank-one span is `ℝe₁` instead of `ℝe₀`.
- At threshold zero the lattice sublevel spans dimension zero, so no valid minimum index qualifies.

Prove `successiveMin_le_iff_finrank` (1.4): for `r ≥ 0`, `λ_i(L,K) ≤ r` if and only if
`i.val+1 ≤ dim_ℝ span_ℝ((L : Set E) ∩ r·(K : Set E))`.
This is `ZLattice.successiveMin_le_iff` with the independent family in `L ∩ r·K` replaced by the
dimension of the span of `L ∩ r·K`.
*Needs:* Mathlib `exists_linearIndependent`, `finrank_span_eq_card`, `Submodule.finrank_mono`; Tau
Ceti `ZLattice.successiveMin_le_iff`.
**Checks.**

- At `r = 0` the right side is false for every valid index.
- At `r = λ_i` the threshold holds.

Prove `exists_successiveMin_witnesses` (1.5): there exists a real basis `b` indexed by `Fin d` such
that `b_i ∈ L`, `gauge K b_i = λ_i(L,K)`, and every `x ∈ L` of gauge `< λ_i` lies in
`span_ℝ{b_j : j < i}`, which is `b.flag i.castSucc`. In particular `b_i ∈ λ_i K`, and all minimum
bounds are attained by one independent family. `K` need not be symmetric.
`ZLattice.exists_linearIndependent_gauge_eq_successiveMin` gives `d` real-linearly independent
lattice vectors with these gauges, which form a real basis. Their strict-sublevel flags are
`ZLattice.mem_span_image_Iio_of_gauge_lt_successiveMin`. Since `K` is closed and `λ_i > 0`,
`gauge K b_i = λ_i` gives `b_i ∈ λ_i K`. The family need not be an integral basis; 1.11 supplies
one with the same flags.
*Needs:* Mathlib `basisOfLinearIndependentOfCardEqFinrank'`,
`coe_basisOfLinearIndependentOfCardEqFinrank'`, `Module.Basis.flag`; Tau Ceti
`ZLattice.exists_linearIndependent_gauge_eq_successiveMin`,
`ZLattice.mem_span_image_Iio_of_gauge_lt_successiveMin`, `ZLattice.successiveMin_pos`,
`ConvexBody.gauge_le_iff_mem_smul`.
**Checks.**

- Repeated minima are allowed: the unit square has both values 1.
- Strict inequality in the flag is essential: `e_0` has gauge equal to the first minimum and does
  not lie in the zero prefix.
- The unit-square diagonal pair has determinant −2 and attains both minima, so attainment alone does
  not certify an integral basis.
- The zero-dimensional family is an empty real basis and has no minimum value to evaluate.
- For the nonsymmetric body `[−1/10,1]` and `L = ℤ` the minimum 1 is attained by 1 but not by −1,
  whose gauge is 10; outside the symmetric case a witness family is not closed under negation.

Prove `successiveMin_antitone_body` (1.6): if `K ⊆ K'` and both bodies contain zero in their
interior, then `λ_i(L,K') ≤ λ_i(L,K)` for every `i`.
(Source: direct body-monotonicity deduction from the threshold definition in Evertse2023, §2.3,
printed p.23.)
The independent family attaining `λ_i(L,K)` lies in `λ_i·K ⊆ λ_i·K'`.
*Needs:* Mathlib `Set.smul_set_mono`; Tau Ceti `ZLattice.successiveMin_isLeast`,
`ZLattice.successiveMin_le`.
**Checks.**

- Changing `[−1,1]` to `[−2,2]` divides the only minimum by two.

Prove `successiveMin_monotone_lattice` (1.7): if `L ≤ M` are discrete full lattices in the same
`E`, then `λ_i(M,K) ≤ λ_i(L,K)`.
(Source: deduction from the threshold definition in Evertse2023, §2.3, printed p.23; Lemma 2.8,
pp.23–24, supplies attainment, rather than stating lattice monotonicity.)
The independent family attaining `λ_i(L,K)` consists of vectors of `M`. `ZLattice.successiveMin_le`
assumes nothing of `M`.
*Needs:* Tau Ceti `ZLattice.successiveMin_isLeast`, `ZLattice.successiveMin_le`.
**Checks.**

- `2ℤ ⊂ ℤ` gives minima 2 and 1 for the unit interval.

Prove `successiveMin_smul_body` (1.8): for `c > 0`, `λ_i(L, cK) = λ_i(L,K)/c`, with the scalar
action on `ConvexBody`.
Since `gauge_(cK) = c⁻¹·gauge_K`, the threshold set `A_i` of 1.3 for `cK` is `c⁻¹` times the one for
`K`.
*Needs:* Mathlib `gauge_smul_left_of_nonneg`, `ConvexBody.coe_smul`, 1.3
`successiveMin_isLeast_gauge`.
**Checks.**

- Scaling the unit interval by 3 changes its minimum from 1 to 1/3.

Prove `successiveMin_linearEquiv` (1.9): let `e : E ≃ₗ[ℝ] F`, `L' = e(L)` as integral submodules,
and `K' = e(K)` as convex bodies. For valid indices `i, j` with `i.val = j.val`,
`λ_j(L',K') = λ_i(L,K)`. `E, F` are finite-dimensional normed real spaces, and `L`, `K` satisfy the
standing hypotheses. `L'` is discrete and full and `0 ∈ interior K'` as a consequence of `L' = e(L)`
and `K' = e(K)`, not as hypotheses. The equivalence need not be orthogonal or unimodular.
(Source: Evertse2023, §2.3, change-of-coordinates remark after Theorem 2.9, printed pp.24–25
(physical pp.14–15); the nonsingularity hypothesis is corrected as in Misprints M2.)
*Needs:* Mathlib `LinearEquiv.finrank_eq`, `LinearEquiv.toContinuousLinearEquiv`,
`Submodule.map_equiv_eq_comap_symm`, `ZLattice.comap_discreteTopology`, `instIsZLatticeComap`,
`Homeomorph.image_interior`, `LinearIndependent.map'`; Tau Ceti `ZLattice.successiveMin_isLeast`,
`ZLattice.successiveMin_le`.
**Checks.**

- Scaling both ℤ and `[−1,1]` by 2 preserves minimum 1; scaling only the lattice gives 2.
- A shear acts simultaneously on the standard lattice and unit square without changing their two
  minima.

Prove `successiveMin_first_le_iff` (1.10): if `d > 0` and `r ≥ 0`, `λ_0(L,K) ≤ r` if and only if
there exists `x ∈ L` with `x ≠ 0` and `x ∈ rK`.
(Source: Evertse2023, §2.3, definition and Lemma 2.8, pp.23–24; Henk2002, p.2 before Theorem 1.2.)
This is `ZLattice.successiveMin_le_iff` at index zero, where one vector is independent exactly when
it is nonzero.
*Needs:* Mathlib `linearIndependent_unique_iff`; Tau Ceti `ZLattice.successiveMin_le_iff`.
**Checks.**

- For ℤ and the unit interval, `r = 1` has witnesses ±1, while every `0 ≤ r < 1` has none.

Prove `exists_integral_minimum_flag` (1.11): there is an integral basis `b : Fin d → L` such that
`x ∈ L` and `gauge K x < λ_i` imply that `x` belongs to the real flag of `b` at `i`, the span of its
first `i` vectors.
Symmetry of `K` is not assumed. No bound on the individual gauges of the `b_i` is claimed; only the
attained real basis's flag is preserved. The form that bounds the vectors, at the cost
`max 1 ((i+1)/2)` and for a symmetric body, is Tau Ceti's
`ZLattice.exists_basis_mem_smul_successiveMin`, which is
[HeightsAndUnits](../HeightsAndUnits/README.md) 2.1.
Apply 0.2.1 to the real basis of 1.5: the integral basis it returns has the same real flags, and
those contain the strict sublevels.
(Source: Cassels, Ch. VIII, Lemma 2, p.204, there with integer coefficients; Henk2002, pp.3–4,
(2.1)–(2.3).)
*Needs:* Mathlib `Module.Basis.flag`, 1.5 `exists_successiveMin_witnesses`, 0.2.1
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

Layer 0.2 (for 1.11); Tau Ceti `ZLattice.successiveMin` and its API; Mathlib `ConvexBody`, `gauge`
and its calculus, `IsZLattice`, `ZSpan.setFinite_inter`, `Module.Basis.flag`.

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

*Transport to Euclidean space.* Transport once by the continuous
linear equivalence `e = toEuclidean`, with lattice `e(L)`, body `e(K)` and measure `ν = μ.map e`.
This is an additive Haar measure by Mathlib `ContinuousLinearEquiv.isAddHaarMeasure_map`. The
equivalence and its inverse preserve these transported measures, `ZLattice.covolume_comap`
identifies the covolumes, and 1.9 `successiveMin_linearEquiv` identifies minima with equal index
values. In Euclidean space `ν = c·volume` for a finite positive `c`. The fundamental-domain formula
makes the covolume scale by `c`, while the minima are measure independent. Multiplying the
canonical-volume inequality by `c` gives the `ν`-measure inequality and hence the original
`μ`-measure inequality. (Source: Mathlib `MeasureTheory.Measure.isAddLeftInvariant_eq_smul` and
`ZLattice.covolume_eq_measure_fundamentalDomain`.)

*Euclidean case.* Take the attaining basis `b` of 1.5, so that `b_i ∈ λ_i K`. By 2.1.2 the
cross-polytope with weights `λ_i` lies in `K`, 2.1.1 gives its volume
`(2^d/d!)·|det_o(b)|/∏_i λ_i`, and 2.1.3 bounds `covolume(L)` by `|det_o(b)|`.
(Source: Evertse2023, §2.3, Theorem 2.9 and its complete lower-bound proof, printed pp.24, 26–27.)
*Needs:* Mathlib `toEuclidean`, `ContinuousLinearEquiv.isAddHaarMeasure_map`,
`ZLattice.covolume_comap`, `ConvexBody.isCompact`, `volume_euclideanSpace_eq_dirac`,
`MeasureTheory.Measure.isAddLeftInvariant_eq_smul`,
`ZLattice.covolume_eq_measure_fundamentalDomain`; Tau Ceti `ZLattice.successiveMin_pos`; 1.9
`successiveMin_linearEquiv`, 1.5 `exists_successiveMin_witnesses`, 2.1.1
`weighted_crosspolytope_volume`, 2.1.2 `weighted_crosspolytope_subset`, 2.1.3
`covolume_le_abs_basis_det`.
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
and `a` is monotone. The stated set is the carrier of `K`. Together with
`ZLattice.covolume_eq_det_mul_measureReal`, this attains equality in Tau Ceti's upper inequality.
(Source: Evertse2023, §2.3, Example 2, printed pp.25–26 (physical pp.15–16).)
*Needs:* Mathlib `finrank_span_eq_card`, `Submodule.finrank_mono`; Tau Ceti
`ZLattice.successiveMin_pos`; 1.4 `successiveMin_le_iff_finrank`.
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
`ZLattice.covolume_eq_det_mul_measureReal`; Tau Ceti `ZLattice.successiveMin_pos`; 1.4
`successiveMin_le_iff_finrank`, 2.1.1 `weighted_crosspolytope_volume`.
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

## Layer 3: Translate volumes and consequences of the upper inequality

The upper half of Minkowski's second theorem is Tau Ceti's
`ZLattice.prod_successiveMin_mul_measureReal_le_two_pow_mul_covolume`, listed under *Already in
Mathlib or Tau Ceti*. This layer proves two volume lemmas for finite unions of translates of convex
sets, the coordinate form of the upper inequality for `ℤ^d`, and Minkowski's first theorem on
successive minima.

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


Prove `convex_cluster_intersection_null` (3.2): for finite families `A : I → Set E`,
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


Prove `coordinate_flag_upper` (3.3): let `K` be a symmetric convex body in `ℝ^d = Fin d → ℝ`, with
its product volume, and let `a : Fin d → ℝ` be nonnegative. For `z ∈ ℤ^d` write
`c(z) = (z_j : ℝ)_j`. Suppose for every `i` and `z ∈ ℤ^d`, `gauge_K(c(z)) < a_i` implies `z_j = 0`
for all `j ≥ i`. Then `(∏_i a_i)·volume.real(K) ≤ 2^d`.
The `a_i` are threshold data satisfying the explicit flag condition; the statement does not define a
new successive-minimum invariant. Neither monotonicity of `a` nor `0 ∈ interior K` is assumed. The
conclusion includes `d = 0`.
Apply `ZLattice.prod_mul_measure_le_two_pow_mul_covolume` to the lattice `span_ℤ(range e)` of the
standard basis `e`, with the vectors `e_i` and the numbers `a_i`. Its lattice vectors are the
`c(z)`, and `z_j = 0` for all `j ≥ i` says that `c(z)` lies in the span of `e_0, …, e_(i−1)`. The
standard lattice has covolume one, and the `ENNReal` bound becomes a real one because `K` is
compact.
(Source: Henk2002, §3, pp.5–7, the coordinate form of (3.1)–(3.6) and the final display.)
*Needs:* Mathlib `Pi.basisFun`, `ZLattice.covolume_eq_det`, `Module.Basis.toMatrix_self`,
`Module.Basis.mem_span_image`, `Module.finrank_fin_fun`, `ConvexBody.isCompact`,
`IsCompact.measure_lt_top`, `ENNReal.toReal_mono`; Tau Ceti
`ZLattice.prod_mul_measure_le_two_pow_mul_covolume`.
**Checks.**

- For ℤ² and `K = [−3,3]×[−1,1]`, thresholds (1/3,1) give product-volume 4, exactly `2²`.
- For the unit diamond and thresholds (1,1), the product-volume is `2 < 4`.
- For `d = 0` the product-volume and the bound are both one.

Prove `minkowski_first_successiveMin` (3.4): for a discrete full `ℤ`-lattice `L` in a
finite-dimensional real normed space `E`, an additive Haar measure `μ`, a centrally symmetric convex
body `K` with 0 in its interior, and `0 < d`, `λ_0(L,K)^d·μ.real(K) ≤ 2^d·covolume(L,μ)`. This is
Minkowski's first theorem on successive minima, read off the first minimum rather than a lattice
point.
By `ZLattice.monotone_successiveMin` and `ZLattice.successiveMin_pos`, `0 < λ_0 ≤ λ_i` for every
`i`, so `λ_0^d ≤ ∏_i λ_i`, and the upper inequality gives the bound.
(Source: Henk2002, p.2, Theorem 1.2.)
*Needs:* Mathlib `Finset.prod_le_prod`, `Finset.prod_const`; Tau Ceti `ZLattice.successiveMin_pos`,
`ZLattice.monotone_successiveMin`,
`ZLattice.prod_successiveMin_mul_measureReal_le_two_pow_mul_covolume`.
**Checks.**

- For `L = ℤ` and `K = [−1,1]`, `1·2 ≤ 2·1`, with equality.
- For `L = 2ℤ` and `K = [−3,3]`, `(2/3)·6 = 4 = 2·2`.
- For `L = 2ℤ×3ℤ` and `K = [−2,2]×[−1,1]`, `1²·8 = 8 < 24 = 4·6`, while the upper inequality is an
  equality for the same pair: the first theorem is weaker than the second.
- `d = 0` is excluded because there is no first minimum to evaluate.

### Examples

For `L = ℤ^d` and the cube `K = [−1,1]^d` every minimum is `1`, and the product
`λ_1⋯λ_d · vol K = 2^d` attains the upper bound. The box `∏[−a_i,a_i]` attains it for all positive
half-widths (2.1.5).

### Dependencies

Tau Ceti `ZLattice.prod_mul_measure_le_two_pow_mul_covolume`,
`ZLattice.prod_successiveMin_mul_measureReal_le_two_pow_mul_covolume` and the body-minimum API;
Mathlib `Convex.addHaar_frontier`, `ZLattice.covolume_eq_det` and the Haar-measure translation
lemmas.

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
| 1.1, 1.5, 1.8 | `SuccessiveMinima.lean` | `successiveMinimum`, `exists_linearIndependent_gauge_eq_successiveMinimum`, `mem_span_of_gauge_lt_successiveMinimum`, `successiveMinimum_smul` |
| 1.11, in the stronger form with integral flags | `MinkowskiSecond.lean` | `exists_basis_mem_span_int_of_gauge_lt` |
| 2.1.4 | `MinkowskiSecond.lean` | `covolume_le_prod_successiveMinimum_mul_measure` |
| 0.1.2 (real matrix form) | `Hadamard.lean` | `det_mul_transpose_self_le_prod`, `sum_sq_norm_plucker_row_le_prod` |

The lattice bases of `AdaptedBasis.lean` and `MinimaBasis.lean` are already in Tau Ceti as `ZLattice.exists_basis_triangular` and `ZLattice.exists_basis_gauge_le`.

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
