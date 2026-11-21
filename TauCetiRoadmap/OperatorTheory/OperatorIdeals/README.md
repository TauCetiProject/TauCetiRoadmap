# Roadmap: operator ideals, approximation numbers and Hilbert–Schmidt operators

**Summary.** For a bounded linear map `T : E → F` between normed spaces, the `n`-th approximation
number `aₙ(T)` is the operator-norm distance from `T` to the bounded maps of rank at most `n`,
counted from zero, so that `a₀(T) = ‖T‖`. On finite-dimensional inner product spaces these are the
singular values. This roadmap develops their calculus and their Hilbert-space theory, builds from
them the Ky Fan, trace-class, Hilbert–Schmidt and Schatten ideals by one construction from
symmetric gauges on sequences, and describes the Hilbert–Schmidt operators by square-summable
columns. Statements about norms and rank hold over any nontrivially normed field unless a section
says otherwise: the rank characterization needs a complete field, and the compactness criteria a
locally compact one. Those using inner products or adjoints are over `ℝ` or `ℂ`, and say which
spaces must be complete.

The first main theorem characterizes compactness: if `F` is a Hilbert space over `ℝ` or `ℂ`, a
bounded operator from a normed space into `F` is compact exactly when its approximation numbers
tend to zero. The second is the Ky Fan triangle inequality: for bounded `S` and `T` from a Hilbert
space into an inner product space and every `k`, the sum of the first `k` approximation numbers of
`S + T` is at most the same sum for `S` plus that for `T`, although a single `aₙ` with `n ≥ 1` is
not subadditive. From it, every symmetric gauge `Φ` (a normalized, permutation-invariant, monotone
and sublinear function on finitely supported nonnegative sequences) defines an operator ideal on
Hilbert spaces with gauge `T ↦ Φ(a₀(T), a₁(T), …)`: subadditive, absolutely homogeneous, invariant
under adjoints, at least the operator norm, with `Φ(ATB) ≤ ‖A‖ Φ(T) ‖B‖`, and monotone under
domination of all the Ky Fan sums. The `ℓᵖ` gauges give the Schatten classes `S_p`, with
`S_p ⊆ S_q` for `1 ≤ p ≤ q`, `S₁` the trace class and `S₂` the Hilbert–Schmidt class. The third
theorem joins the two descriptions of `S₂`: for a bounded operator `T` from a Hilbert space into an
inner product space and any Hilbert basis `(bᵢ)` of the source, `∑ₙ aₙ(T)² = ∑ᵢ ‖T bᵢ‖²` in
`[0, ∞]`. When the target is complete as well, the operators for which this is finite are
exactly those represented by a square-summable family of columns, and they are compact. Finally,
the approximation numbers of an orthogonal block sum of two operators from Hilbert spaces into
inner product spaces are the generalized decreasing merge of those of the two blocks.

The roadmap takes the operator modulus `|T| = √(T†T)` from
[PolarDecomposition](../PolarDecomposition/README.md), and finite-dimensional Ky Fan sums,
unitarily invariant seminorms and the operator-norm, nuclear and Frobenius seminorms from
[Majorization](../Majorization/README.md). Its approximation numbers are the ones
[SNumbers](../../SNumbers/README.md) compares with the other s-number sequences on Banach spaces;
its trace class and Hilbert–Schmidt class carry the trace of
[VonNeumannAlgebras](../../VonNeumannAlgebras/README.md) and are the cases `p = 1, 2` of the
noncommutative `Lᵖ` spaces of [NoncommutativeIntegration](../../NoncommutativeIntegration/README.md);
and the Peter–Weyl theorem of [CompactGroups](../../RepresentationTheory/CompactGroups/README.md)
uses that Hilbert–Schmidt operators are compact.

Part A treats the approximation numbers, Part B the operator-ideal families, symmetric gauges and
the Schatten scale, and Part C the column model of the Hilbert–Schmidt class; the guide below lists
their milestones.

## How to read the build

The roadmap is built in three Parts, A, B and C, each divided into milestones: A1 to A6, B1 to B6
and C1 to C3, each a section below headed by its number. Every item carries a label, `OI-A01` to
`OI-A56`, `OI-B01` to `OI-B94` (the label `OI-B53` is not used) and `OI-C01` to `OI-C20`, by which
other roadmaps cite it, and each section heading lists the labels it carries. Seven items are also
the definitions D1 to D7 of the roadmap: D1 is OI-B59 with OI-B60, D2 is OI-B64 with OI-B65, D3 is
OI-B76, D4 is OI-B80 with OI-B82, D5 is OI-B47, D6 is OI-C02 and D7 is OI-B89. An item realised by
the pinned Tau Ceti ends with a line naming the declarations that realise it.

Part A defines the approximation numbers on seminormed spaces and proves their calculus (§A1),
relates them to rank and compactness (§A2), proves their invariance under adjoints and moduli and
the coercivity lower bounds (§A3), the min–max formulas (§A4), and the Ky Fan inequalities with
Eckart–Young and Weyl's perturbation bound (§A5), and computes them for identities, projections and
diagonal operators (§A6). Part B sets up operator-ideal families (§B1), the operator-norm, Ky Fan,
trace-class and Hilbert–Schmidt families with the Hilbert–Schmidt energy (§B2), Ky Fan dominance
and the finite-dimensional Schatten norms (§B3), symmetric gauges and the families they induce
(§B4), the Ky Fan transfer and the Schatten scale (§B5) and orthogonal block sums (§B6). Part C
identifies the Hilbert–Schmidt operators with `ℓ²` families of columns (§C1) and proves isometric
invariance (§C2) and Pythagoras identities (§C3) for the Hilbert–Schmidt energy. Each section's
*Needs:* line lists its inputs, so that a statement proved by another route is not blocked behind
an unrelated section.

## Conventions

1. **Scalars and spaces.** Where a statement involves only norms and rank, `𝕜` is a nontrivially
   normed field and the spaces are seminormed spaces over it (Mathlib `SeminormedAddCommGroup` with
   `NormedSpace 𝕜`), in arbitrary and possibly different universes; a statement that needs a
   complete or locally compact field, or normed spaces, says so. Statements that use an inner
   product, an adjoint, an orthogonal projection or singular values are over `𝕜` with `RCLike 𝕜`,
   that is `ℝ` or `ℂ`. A *Hilbert space* is a complete inner product space; each statement says which
   of its spaces must be complete. Bounded maps are `E →L[𝕜] F`, with operator norm `‖T‖`, its
   `ℝ≥0`-valued form `‖T‖₊` and its `ℝ≥0∞`-valued form `‖T‖ₑ`. Inner products are conjugate-linear
   in the first argument, as in Mathlib.
2. **Rank.** `rank T` is Mathlib's `LinearMap.rank` of the underlying linear map, a cardinal, and
   `rank T ≤ n` compares it with `(n : Cardinal)`; maps of infinite rank are allowed throughout.
3. **Approximation numbers.** `aₙ(T) = inf {‖T − R‖ : R bounded, rank R ≤ n}`, with values in
   `ℝ≥0` and indexed from zero, so that `a₀(T) = ‖T‖`. It is Tau Ceti's
   `ContinuousLinearMap.singularValue T n`, whose name, indexing and codomain are those of the
   Mathlib proposal for singular values cited in the references. The one-based convention of much
   of the literature is `sₙ(T) = aₙ₋₁(T)` for `n ≥ 1`.
4. **Singular values.** For a linear map `T` between finite-dimensional inner product spaces,
   `σₙ(T)` is Mathlib's `LinearMap.singularValues T n`: the singular values in nonincreasing order
   with multiplicity, indexed from zero, and zero from the dimension of the source on.
5. **Ky Fan gauges.** `Kₖ(T) = a₀(T) + ⋯ + aₖ₋₁(T)`, Tau Ceti's `ContinuousLinearMap.kyFanGauge T k`,
   with `K₀(T) = 0`. In finite dimension the Ky Fan sum `σ₀(T) + ⋯ + σₖ₋₁(T)` is Tau Ceti's
   `LinearMap.kyFanSum` (Majorization, section *Ky Fan sums*).
6. **Gauges and ideals.** Operator gauges take values in `ℝ≥0∞`, and the operators of finite gauge
   form the ideal. The four laws of an operator-ideal gauge `Φ` are subadditivity
   `Φ(S + T) ≤ Φ(S) + Φ(T)`, absolute homogeneity `Φ(cT) = ‖c‖ₑ Φ(T)` (with `0 · ∞ = 0`),
   domination of the operator norm `‖T‖ₑ ≤ Φ(T)`, and the two-sided ideal inequality
   `Φ(ATB) ≤ ‖A‖ₑ Φ(T) ‖B‖ₑ`.
7. **Adjoints and block sums.** `T†` is `ContinuousLinearMap.adjoint T`. The orthogonal block sum
   `T₁ ⊕ T₂` of `T₁ : E₁ → F₁` and `T₂ : E₂ → F₂` is Tau Ceti's
   `T₁.withLpProdMap 2 T₂ : WithLp 2 (E₁ × E₂) →L[𝕜] WithLp 2 (F₁ × F₂)`, acting blockwise;
   OI-B91–OI-B94 of §B6 hold for the `ℓᵖ` block sum `T₁.withLpProdMap p T₂` with `1 ≤ p ≤ ∞` as
   well.
8. **Columns and energy.** For a Hilbert basis `b = (bᵢ)` of the source, indexed by a type `ι`
   (Mathlib `HilbertBasis ι 𝕜 E`), the *column family* of `T` is `i ↦ T bᵢ` and its *Hilbert–Schmidt
   energy* is `E_b(T) = ∑' i, ‖T bᵢ‖ₑ²` in `ℝ≥0∞`. A family `f = (fᵢ)` in `ℓ²(ι, F)` (Mathlib
   `lp (fun _ : ι => F) 2`) *represents* the operator `T_f x = ∑' i, ⟪bᵢ, x⟫ • fᵢ`.
9. **Sequences.** `ℕ →₀ ℝ≥0` is the type of finitely supported nonnegative sequences, `eₙ` is the
   sequence with a single `1` at `n`, and a permutation of `ℕ` acts on finitely supported sequences
   by Mathlib's `Finsupp.equivMapDomain`. Inequalities between sequences are termwise.
10. **Names.** Library declarations are named in code font by their full names. The one declaration
    of this roadmap's own is `symmetricGaugeFamily_injective` in `Suggested.lean` (§B4), in the
    namespace `TauCetiRoadmap.OperatorIdeals`; the other target (§B6) is described in prose. The
    declarations of the pinned Tau Ceti that realise an item are named at the end of the item; they
    are library declarations, not declarations of `Suggested.lean`.

## Part A: approximation numbers and Hilbert-space singular values

Approximation numbers extend the singular values of linear maps between finite-dimensional spaces
to bounded operators, by measuring best approximation by maps of bounded rank. This Part develops
their calculus on seminormed spaces, their relation to rank and compactness, their Hilbert-space
invariances and min–max theory, the Ky Fan gauges, and finite and diagonal models. Its objects are
the approximation-number sequence `a(T) = (aₙ(T))ₙ` of a bounded map `T : E → F` (Convention 3), the
relation of having the same approximation numbers, which compares maps on different pairs of spaces,
and the Ky Fan gauge `Kₖ(T) = a₀(T) + ⋯ + aₖ₋₁(T)` (Convention 5).

### A1 Approximation-number calculus (OI-A01–OI-A22)

Approximation numbers measure the distance to the maps of bounded rank; their infimum calculus
supplies the continuity, additive, scalar and two-sided ideal laws used throughout the roadmap.
Throughout this section `𝕜` is a nontrivially normed field and `E`, `F`, `G`, `H` are seminormed
spaces over it, in arbitrary universes (Pietsch, *Eigenvalues and s-Numbers*, Ch. 2; Gohberg and
Kreĭn, Ch. II, for compact operators on Hilbert space). On real or complex Banach spaces and in the
one-based convention, OI-A12 with OI-A13, OI-A16 and OI-A20 are the s-number axioms (S1), (S2) and
(S3) of Ullrich 2024, p. 2, which the approximation numbers satisfy, and Remark 1 there states
OI-A17 and OI-A22.

- **OI-A01 — Approximation number.** For a bounded map `T : E → F` and `n ∈ ℕ`, define
  `aₙ(T) = inf {‖T − R‖ : R : E → F bounded, rank R ≤ n}`, with values in `ℝ≥0` and indexed from
  zero (Ullrich 2024, p. 2, one-based, on real or complex Banach spaces).
  *In Tau Ceti:* `ContinuousLinearMap.singularValue`.
- **OI-A02 — Equality of approximation-number sequences.** Two bounded maps `S : E → F` and
  `T : G → H`, possibly between different pairs of spaces, *have the same approximation numbers*
  when `aₙ(S) = aₙ(T)` for every `n`.
  *In Tau Ceti:* `ContinuousLinearMap.SameSingularValues`, `ContinuousLinearMap.sameSingularValues_iff`.
- **OI-A03 — Reflexivity.** Every bounded map has the same approximation numbers as itself.
  *In Tau Ceti:* `ContinuousLinearMap.sameSingularValues_refl`.
- **OI-A04 — Symmetry.** If `S` has the same approximation numbers as `T`, then `T` has the same
  approximation numbers as `S`.
  *In Tau Ceti:* `ContinuousLinearMap.sameSingularValues_symm`.
- **OI-A05 — Transitivity.** If `S` has the same approximation numbers as `T`, and `T` as `U`, then
  `S` has the same approximation numbers as `U`.
  *In Tau Ceti:* `ContinuousLinearMap.sameSingularValues_trans`.
- **OI-A06 — Ky Fan gauge.** For a bounded map `T : E → F` and `k ∈ ℕ`, define
  `Kₖ(T) = a₀(T) + ⋯ + aₖ₋₁(T)` in `ℝ≥0`, so that `K₀(T) = 0`.
  *In Tau Ceti:* `ContinuousLinearMap.kyFanGauge`.
- **OI-A07 — Infimum formula.** `aₙ(T)` is the greatest lower bound of the set of `‖T − R‖` over
  the bounded `R : E → F` with `rank R ≤ n`.
  *In Tau Ceti:* `ContinuousLinearMap.isGLB_singularValue`.
- **OI-A08 — Approximation upper bound.** If `R : E → F` is bounded with `rank R ≤ n`, then
  `aₙ(T) ≤ ‖T − R‖`.
  *In Tau Ceti:* `ContinuousLinearMap.singularValue_le_nnnorm_sub`.
- **OI-A09 — Universal lower-bound characterization.** For `c ≥ 0`, `c ≤ aₙ(T)` exactly when
  `c ≤ ‖T − R‖` for every bounded `R : E → F` with `rank R ≤ n`.
  *In Tau Ceti:* `ContinuousLinearMap.le_singularValue_iff`.
- **OI-A10 — Best-approximant attainment.** If `R` is bounded with `rank R ≤ n` and
  `‖T − R‖ ≤ ‖T − R'‖` for every bounded `R'` with `rank R' ≤ n`, then `aₙ(T) = ‖T − R‖`.
  *In Tau Ceti:* `ContinuousLinearMap.singularValue_eq_nnnorm_sub`.
- **OI-A11 — Near-best approximant.** For every `ε > 0` there is a bounded `R` with `rank R ≤ n`
  and `‖T − R‖ < aₙ(T) + ε`; equivalently, whenever `aₙ(T) < c` there is such an `R` with
  `‖T − R‖ < c`.
  *In Tau Ceti:* `ContinuousLinearMap.exists_rank_le_nnnorm_sub_lt`.
- **OI-A12 — Zeroth approximation number.** `a₀(T) = ‖T‖`.
  *In Tau Ceti:* `ContinuousLinearMap.singularValue_zero`.
- **OI-A13 — Antitonicity.** The sequence `n ↦ aₙ(T)` is antitone.
  *In Tau Ceti:* `ContinuousLinearMap.antitone_singularValue`.
- **OI-A14 — Operator-norm bound.** `aₙ(T) ≤ ‖T‖` for every `n`; with OI-A12, `supₙ aₙ(T) = ‖T‖`.
  *In Tau Ceti:* `ContinuousLinearMap.singularValue_le_nnnorm`, `ContinuousLinearMap.iSup_singularValue`.
- **OI-A15 — Zero operator.** `aₙ(0) = 0` for every `n`.
  *In Tau Ceti:* `ContinuousLinearMap.zero_singularValue`.
- **OI-A16 — Fixed-index perturbative triangle bound.** For bounded `S, T : E → F` and every `n`,
  `aₙ(S + T) ≤ aₙ(S) + ‖T‖`.
  *In Tau Ceti:* `ContinuousLinearMap.singularValue_add_le`.
- **OI-A17 — Mixed-index additive inequality.** For bounded `S, T : E → F` and all `m, n`,
  `aₘ₊ₙ(S + T) ≤ aₘ(S) + aₙ(T)`.
  *In Tau Ceti:* `ContinuousLinearMap.singularValue_add_index_le`.
- **OI-A18 — Lipschitz continuity at a fixed index.** For bounded `S, T : E → F` and every `n`,
  `|aₙ(S) − aₙ(T)| ≤ ‖S − T‖`.
  *In Tau Ceti:* `ContinuousLinearMap.abs_singularValue_sub_singularValue_le`.
- **OI-A19 — Norm continuity.** For each `n`, the map `T ↦ aₙ(T)` on the bounded maps `E → F` is
  `1`-Lipschitz, hence continuous, in the operator norm.
  *In Tau Ceti:* `ContinuousLinearMap.lipschitzWith_singularValue`, `ContinuousLinearMap.continuous_singularValue`.
- **OI-A20 — Two-sided ideal inequality.** For bounded `B : E → F`, `T : F → G` and `A : G → H`,
  `aₙ(ATB) ≤ ‖A‖ aₙ(T) ‖B‖` for every `n`; in particular `aₙ(AT) ≤ ‖A‖ aₙ(T)` and
  `aₙ(TB) ≤ aₙ(T) ‖B‖`.
  *In Tau Ceti:* `ContinuousLinearMap.singularValue_comp_comp_le`, `ContinuousLinearMap.singularValue_comp_le_left`, `ContinuousLinearMap.singularValue_comp_le_right`.
- **OI-A21 — Scalar homogeneity.** For every scalar `c ∈ 𝕜` and every `n`, `aₙ(cT) = ‖c‖ aₙ(T)`.
  *In Tau Ceti:* `ContinuousLinearMap.singularValue_smul`.
- **OI-A22 — Mixed-index product inequality.** For bounded `T : E → F` and `S : F → G` and all
  `m, n`, `aₘ₊ₙ(ST) ≤ aₘ(S) aₙ(T)`.
  *In Tau Ceti:* `ContinuousLinearMap.singularValue_comp_add_le_mul`.

*Needs:* Mathlib `ContinuousLinearMap` with its operator norm, `LinearMap.rank`.

**Checks.**
- For `T = diag(3, 1)` on `𝕜²` with the Euclidean norm, `a₀(T) = 3`, `a₁(T) = 1` and `aₙ(T) = 0`
  for `n ≥ 2`: the approximant `diag(3, 0)` is at distance `1`, and every `R` of rank at most `1`
  kills some unit vector `x`, so that `‖T − R‖ ≥ ‖Tx‖ ≥ 1`. Measuring the distance in the
  Frobenius norm instead would give `a₀(T) = √10`, and a one-based infimum over `rank R < n` would
  shift the sequence and give `3` at index `1`.
- For `S = diag(1, 0)` and `T = diag(0, 1)` on `𝕜²`, `S + T` is the identity and `a₁(S + T) = 1`,
  while `a₁(S) = a₁(T) = 0`: the same-index inequality `aₙ(S + T) ≤ aₙ(S) + aₙ(T)` fails, and the
  mixed-index form `a₁₊₀(S + T) ≤ a₁(S) + a₀(T) = 1` holds with equality.

### A2 Rank, approximability and compactness (OI-A23–OI-A29)

The vanishing of `aₙ(T)` encodes rank, and its decay encodes approximability by maps of finite
rank; on a Hilbert target the decay characterizes compactness (Pietsch, *Eigenvalues and
s-Numbers*, Ch. 2; Gohberg and Kreĭn, Ch. II, for compact operators). Of the two directions of
OI-A29, only OI-A27 uses completeness of the target and only OI-A28 its inner product; the source
keeps the hypotheses of §A1.

- **OI-A23 — Vanishing from rank.** On seminormed spaces over a nontrivially normed field, if
  `rank T ≤ n` then `aₙ(T) = 0` (axiom (S5) of Ullrich 2024, p. 2); in particular `aₙ(T) = 0` as
  soon as the source has rank at most `n`.
  *In Tau Ceti:* `ContinuousLinearMap.singularValue_eq_zero_of_rank_le`, `ContinuousLinearMap.singularValue_eq_zero_of_rank_domain_le`.
- **OI-A24 — Rank characterization.** Over a complete nontrivially normed field and for normed
  spaces `E`, `F`, `aₙ(T) = 0` exactly when `rank T ≤ n`. No finite dimension is assumed; the
  finite-dimensional normed spaces are a special case.
  *In Tau Ceti:* `ContinuousLinearMap.singularValue_eq_zero_iff_rank_le`.
- **OI-A25 — Finite-rank approximation characterization.** On seminormed spaces over a
  nontrivially normed field, `aₙ(T) → 0` exactly when there are bounded `Rₙ : E → F` with
  `rank Rₙ ≤ n` for every `n` and `‖T − Rₙ‖ → 0`.
  *In Tau Ceti:* `ContinuousLinearMap.tendsto_singularValue_nhds_zero_iff`.
- **OI-A26 — Finite rank implies compactness.** Over a locally compact (equivalently, proper)
  nontrivially normed field, a continuous linear map `T : E → F` with finite-dimensional range
  (Mathlib's `LinearMap.HasFiniteRange`) is compact, for any topological vector spaces `E` and `F`
  over the field.
  *In Tau Ceti:* `LinearMap.HasFiniteRange.isCompactOperator`.
- **OI-A27 — Approximability implies compactness.** Over a locally compact nontrivially normed
  field, if `E` is a seminormed space, `F` a Banach space and `aₙ(T) → 0`, then `T` is compact.
  Route: by OI-A25, `T` is a norm limit of maps of finite rank, which are compact by OI-A26, and a
  norm limit of compact operators into a Banach space is compact (Mathlib
  `isCompactOperator_of_tendsto`).
  *In Tau Ceti:* `ContinuousLinearMap.isCompactOperator_of_tendsto_singularValue`.
- **OI-A28 — Compactness implies approximability on an inner product target.** Over `ℝ` or `ℂ`, if
  `E` is a seminormed space, `F` an inner product space, not necessarily complete, and `T : E → F`
  is compact, then `aₙ(T) → 0`. Route: composing `T` with the orthogonal projection onto the span
  of the centres of a finite `ε`-net of the image of the unit ball gives an approximant of finite
  rank within `ε`.
  *In Tau Ceti:* `IsCompactOperator.tendsto_singularValue`.
- **OI-A29 — Hilbert-target compactness characterization.** Over `ℝ` or `ℂ`, if `E` is a
  seminormed space and `F` a Hilbert space, a bounded `T : E → F` is compact exactly when
  `aₙ(T) → 0`.
  *In Tau Ceti:* `ContinuousLinearMap.isCompactOperator_iff_tendsto_singularValue`.

*Needs:* §A1; Mathlib `IsCompactOperator`, `isCompactOperator_of_tendsto`,
`LinearMap.HasFiniteRange`, `Submodule.starProjection`.

**Checks.**
- The identity of an infinite-dimensional Hilbert space has `aₙ = 1` for every `n` (OI-A51), so it
  is not compact, as it should not be.
- Over `ℝ` or `ℂ`, the diagonal operator on `ℓ²(ℕ, 𝕜)` with coefficients `1/(n + 1)` has
  `aₙ = 1/(n + 1)` (OI-A55), so it is compact by OI-A29, while `aₙ > 0` for every `n` gives
  `rank > n` for every `n` by OI-A24: the decay `aₙ → 0` does not force eventual vanishing, and a
  characterization of compactness by finite rank would be wrong.

### A3 Hilbert-space invariance and lower bounds (OI-A30–OI-A34)

Adjoints and moduli preserve the approximation numbers, and coercivity on a large subspace bounds
them from below; the lower bounds feed the min–max characterization of §A4 (Pietsch, *Eigenvalues
and s-Numbers*, Ch. 2; Gohberg and Kreĭn, Ch. II, for compact operators).

- **OI-A30 — Adjoint invariance.** Over `ℝ` or `ℂ`, for `T : E → F` between Hilbert spaces,
  `aₙ(T†) = aₙ(T)` for every `n`. Route: an approximant `R` of `T` gives the approximant `R†` of
  `T†`, of the same rank and at the same distance.
  *In Tau Ceti:* `ContinuousLinearMap.singularValue_adjoint`.
- **OI-A31 — Modulus invariance.** For `T : E → F` between Hilbert spaces over `ℝ` or `ℂ`,
  `aₙ(|T|) = aₙ(T)` for every `n`, where `|T| = √(T†T)` is the modulus of PolarDecomposition
  (PD-A36), Tau Ceti's `ContinuousLinearMap.modulus`. More generally, if `E` is a seminormed space
  and `T : E → F`, `A : E → G` are bounded maps into Hilbert spaces with `‖Tx‖ = ‖Ax‖` for every
  `x`, then `T` and `A` have the same approximation numbers.
  *In Tau Ceti:* `ContinuousLinearMap.singularValue_modulus`, `ContinuousLinearMap.singularValue_eq_of_forall_norm_apply_eq`.
- **OI-A32 — Coercive-subspace lower bound.** Over a nontrivially normed field, with `E` a normed
  space and `F` a seminormed space, if a subspace `V ≤ E` has rank greater than `n` and
  `c‖x‖ ≤ ‖Tx‖` for every `x ∈ V`, then `c ≤ aₙ(T)`.
  *In Tau Ceti:* `ContinuousLinearMap.le_singularValue_of_lt_rank`.
- **OI-A33 — Unit-vector lower-bound form.** Over `ℝ` or `ℂ`, with `E` a normed space, if a
  subspace `V ≤ E` has rank greater than `n` and `c ≤ ‖Tx‖` for every unit vector `x ∈ V`, then
  `c ≤ aₙ(T)`.
  *In Tau Ceti:* `ContinuousLinearMap.le_singularValue_of_lt_rank_of_unit_norm`.
- **OI-A34 — Independent-family lower-bound form.** In the setting of OI-A32, if
  `v₀, …, vₙ ∈ E` are linearly independent and `c‖x‖ ≤ ‖Tx‖` for every `x` in their span, then
  `c ≤ aₙ(T)`.
  *In Tau Ceti:* `ContinuousLinearMap.le_singularValue_of_linearIndependent`.

*Needs:* §A1; PolarDecomposition PD-A36 (Tau Ceti `ContinuousLinearMap.modulus`); Mathlib
`ContinuousLinearMap.adjoint`, `Module.rank`.

### A4 Min–max formulations (OI-A35–OI-A40)

Over `ℝ` or `ℂ`, with `E` an inner product space, the approximation numbers localize to orthogonal
complements of small subspaces and to finite restrictions; the converse localization is the bridge
used by the Ky Fan estimates of §A5 (Horn and Johnson, *Matrix Analysis*, Thm 4.2.6, for the matrix
min–max principle; Gohberg and Kreĭn).

- **OI-A35 — Orthogonal-tail min–max equality.** If `E` is a Hilbert space and `F` a seminormed
  space, `aₙ(T)` is the infimum, over subspaces `V ≤ E` with `rank V ≤ n`, of the operator norm of
  `T` restricted to `V⊥`. For each such `V` the inequality `aₙ(T) ≤ ‖T restricted to V⊥‖` holds
  without completeness of `E`.
  *In Tau Ceti:* `ContinuousLinearMap.singularValue_eq_iInf_nnnorm_comp_orthogonal`, `ContinuousLinearMap.singularValue_le_nnnorm_comp_orthogonal`.
- **OI-A36 — Dimension cutoff.** If the source has rank at most `n`, the value in OI-A35 is `0`:
  the candidate `V = E` has `V⊥ = 0`, and `aₙ(T) = 0` by OI-A23.
  *In Tau Ceti:* `ContinuousLinearMap.singularValue_eq_zero_of_rank_domain_le`.
- **OI-A37 — Closed-unit-ball formulation.** For each candidate `V` of OI-A35, the norm of `T`
  restricted to `V⊥` is the supremum of `‖Tx‖` over `x ∈ V⊥` with `‖x‖ ≤ 1`. This is Mathlib's
  `ContinuousLinearMap.sSup_unitClosedBall_eq_norm` applied to the restriction
  `T ∘L Vᗮ.subtypeL`.
- **OI-A38 — Pair-level min–max localization property.** Over a nontrivially normed field and
  for seminormed spaces, a pair `(E, F)` has the *converse min–max localization property* when for
  every bounded `T : E → F`, every `n` and every `0 ≤ r < aₙ(T)` there are `s > r` and `n + 1`
  linearly independent vectors on whose span `s‖x‖ ≤ ‖Tx‖`.
  *In Tau Ceti:* `TauCeti.HasMinMaxLowerBound`, `TauCeti.hasMinMaxLowerBound_iff`.
- **OI-A39 — Converse min–max localization.** Over `ℝ` or `ℂ`, if `E` is a Hilbert space and `F`
  an inner product space, the pair `(E, F)` has the property of OI-A38. Route: for `c ≥ 0`, either
  `T` is `c`-coercive on the span of `n + 1` linearly independent vectors, or `‖Tx‖ ≤ c‖x‖` on the
  orthogonal complement of a subspace of rank at most `n`.
  *In Tau Ceti:* `TauCeti.HasMinMaxLowerBound.of_completeSpace`, `ContinuousLinearMap.exists_linearIndependent_or_exists_rank_le`.
- **OI-A40 — Finite-restriction supremum.** On a pair with the property of OI-A38, `aₙ(T)` is the
  least upper bound of the constants `s` for which `T` is `s`-coercive on the span of some `n + 1`
  linearly independent vectors; for a normed source, this least-upper-bound property for every `T`
  and `n` characterizes the pairs with the property of OI-A38.
  *In Tau Ceti:* `TauCeti.HasMinMaxLowerBound.isLUB_singularValue`, `TauCeti.hasMinMaxLowerBound_iff_forall_isLUB`.

*Needs:* §§A1, A3; Mathlib `Submodule.orthogonal`, `Submodule.subtypeL`,
`ContinuousLinearMap.sSup_unitClosedBall_eq_norm`.

**Checks.**
- For `T = diag(3, 1)` on `𝕜²` and `n = 1`, the candidate `V = span(e₀)` leaves `T` restricted to
  `span(e₁)`, of norm `1 = a₁(T)`, while `V = span(e₁)` leaves norm `3`. The formula takes the
  infimum over `V`; a supremum would give `3 = a₀(T)`.

### A5 Ky Fan gauges, Eckart–Young and perturbation (OI-A41–OI-A50)

Prefix sums of approximation numbers are the Ky Fan gauges; Eckart–Young identifies them in finite
dimension with the Ky Fan sums of singular values, which carries finite-dimensional majorization
estimates to the approximation numbers (Bhatia, *Matrix Analysis*; Eckart and Young 1936).
OI-A41–OI-A43, OI-A45 and OI-A46 hold on seminormed spaces over any nontrivially normed field.

- **OI-A41 — First Ky Fan gauge.** `K₁(T) = ‖T‖`.
  *In Tau Ceti:* `ContinuousLinearMap.kyFanGauge_one`.
- **OI-A42 — Ky Fan homogeneity.** For every scalar `c` and every `k`, `Kₖ(cT) = ‖c‖ Kₖ(T)`.
  *In Tau Ceti:* `ContinuousLinearMap.kyFanGauge_smul`.
- **OI-A43 — Ky Fan two-sided ideal inequality.** For bounded `B : E → F`, `T : F → G` and
  `A : G → H` and every `k`, `Kₖ(ATB) ≤ ‖A‖ Kₖ(T) ‖B‖`.
  *In Tau Ceti:* `ContinuousLinearMap.kyFanGauge_comp_comp_le`.
- **OI-A44 — Ky Fan adjoint invariance.** Over `ℝ` or `ℂ`, for `T` between Hilbert spaces and
  every `k`, `Kₖ(T†) = Kₖ(T)`.
  *In Tau Ceti:* `ContinuousLinearMap.kyFanGauge_adjoint`.
- **OI-A45 — Ky Fan lower comparison.** If `k > 0`, then `‖T‖ ≤ Kₖ(T)`.
  *In Tau Ceti:* `ContinuousLinearMap.nnnorm_le_kyFanGauge`.
- **OI-A46 — Ky Fan upper comparison.** For every `k`, `Kₖ(T) ≤ k ‖T‖`.
  *In Tau Ceti:* `ContinuousLinearMap.kyFanGauge_le_mul_nnnorm`.
- **OI-A47 — Pair-local Ky Fan triangle inequality.** Over `ℝ` or `ℂ`, for inner product spaces
  `E`, `F` whose pair has the property of OI-A38, `Kₖ(S + T) ≤ Kₖ(S) + Kₖ(T)` for all bounded
  `S, T : E → F` and every `k`. Route: the localization of OI-A38 reduces the inequality to
  finite-dimensional compressions of `T`, where Ky Fan's maximum principle applies: for orthonormal
  families `u₁, …, uₖ` in `F` and `v₁, …, vₖ` in `E`, `|∑ᵢ ⟪uᵢ, T vᵢ⟫| ≤ Kₖ(T)`.
  *In Tau Ceti:* `TauCeti.HasMinMaxLowerBound.kyFanGauge_add_le`, `TauCeti.HasMinMaxLowerBound.exists_singularValue_le_compression`, `ContinuousLinearMap.norm_sum_inner_le_kyFanGauge`.
- **OI-A48 — Ky Fan triangle inequality.** Over `ℝ` or `ℂ`, for bounded `S, T : E → F` with `E` a
  Hilbert space and `F` an inner product space, `Kₖ(S + T) ≤ Kₖ(S) + Kₖ(T)` for every `k`; it is
  OI-A47 with OI-A39.
  *In Tau Ceti:* `ContinuousLinearMap.kyFanGauge_add_le`.
- **OI-A49 — Eckart–Young identification.** Over `ℝ` or `ℂ`, for a linear map `T` between
  finite-dimensional inner product spaces, `aₙ(T) = σₙ(T)` for every `n`, including the zero tail
  from the dimension of the source on; hence `Kₖ(T)` is the Ky Fan sum `σ₀(T) + ⋯ + σₖ₋₁(T)`.
  *In Tau Ceti:* `ContinuousLinearMap.singularValue_eq_linearMap_singularValues`, `ContinuousLinearMap.kyFanGauge_eq_kyFanSum`.
- **OI-A50 — Weyl singular-value perturbation bound.** Over `ℝ` or `ℂ`, for linear maps `A`, `B`
  between finite-dimensional inner product spaces, `|σₙ(A) − σₙ(B)| ≤ ‖A − B‖` for every `n`.
  *In Tau Ceti:* `LinearMap.abs_singularValues_sub_singularValues_le`.

*Needs:* §§A1, A3, A4; Majorization, section *Ky Fan sums* (Tau Ceti `LinearMap.kyFanSum`);
Mathlib `LinearMap.singularValues`.

**Checks.**
- With `S = diag(1, 0)` and `T = diag(0, 1)` on `𝕜²` as in §A1, `K₁(S + T) = 1 ≤ 2` and
  `K₂(S + T) = 2 = K₂(S) + K₂(T)`: the Ky Fan sums are subadditive although `a₁` alone is not.
- For `T : 𝕜² → 𝕜³`, `(x, y) ↦ (x + y, 0, 0)`, `T†T` has eigenvalues `2` and `0`, so `σ(T) = (√2, 0)`
  and `a₀(T) = ‖T‖ = √2`, `a₁(T) = 0` (rank one). Reading the singular values off the diagonal of
  the matrix would give `1` and `0`, and contradict `a₀(T) = ‖T‖`.

### A6 Finite and diagonal acceptance models (OI-A51–OI-A56)

Identities, projections and diagonal maps exercise the indexing, the rank cutoff, the min–max
formula and the decay of the approximation numbers (Pietsch, *Eigenvalues and s-Numbers*, Ch. 2;
for diagonal operators, Pietsch, *Operator Ideals*, Thm 11.11.3).

- **OI-A51 — Identity example.** On a normed space `E` over a nontrivially normed field, of rank
  `r`, a possibly infinite cardinal, `aₙ(id) = 1` for `n < r` and `aₙ(id) = 0` for `n ≥ r`; for
  finite-dimensional `E`, `aₙ(id) = 1` below the dimension and `0` at and above it.
  *In Tau Ceti:* `ContinuousLinearMap.singularValue_id`, `ContinuousLinearMap.singularValue_id_of_finiteDimensional`.
- **OI-A52 — Projection example.** Over `ℝ` or `ℂ`, the orthogonal projection onto a subspace `U`
  of an inner product space that has an orthogonal projection has `aₙ = 1` for `n < rank U` and
  `aₙ = 0` otherwise, so a projection of rank `r` has exactly `r` approximation numbers equal to
  `1`; `U` may be infinite-dimensional.
  *In Tau Ceti:* `Submodule.singularValue_starProjection`.
- **OI-A53 — Rectangular diagonal example.** Over `ℝ` or `ℂ`, let `E` and `F` be inner product
  spaces of dimensions `m` and `n` with orthonormal bases, and let `D : E → F` have matrix entries
  `d_k` at position `(k, k)` for `k < min(m, n)` and zeros elsewhere. If a permutation `σ` of the
  indices below `min(m, n)` lists the `|d_k|` in nonincreasing order, then `a_k(D) = |d_σ(k)|` for
  `k < min(m, n)` and `a_k(D) = 0` from `min(m, n)` on; unequal source and target dimensions are
  allowed. More generally, a map sending an orthonormal basis to pairwise orthogonal vectors has as
  approximation numbers the norms of those vectors in nonincreasing order.
  *In Tau Ceti:* `Matrix.singularValue_toLin_of_ite_val_eq`, `Matrix.singularValue_toLin_of_ite_val_eq_eq_zero_of_le`, `ContinuousLinearMap.singularValue_eq_of_pairwise_inner_eq_zero`.
- **OI-A54 — Finite diagonal min–max example.** Over `ℝ` or `ℂ`, for a diagonal map `D` on a
  finite-dimensional inner product space with coefficients ordered by nonincreasing magnitude in an
  orthonormal basis, the span `V` of the first `n` basis vectors in that order attains the infimum
  of OI-A35: `‖D restricted to V⊥‖ = aₙ(D)`, and `aₙ(D)` is the `(n + 1)`-st largest magnitude by
  OI-A53.
  *In Tau Ceti:* `OrthonormalBasis.nnnorm_toLin_diagonal_comp_orthogonal_spanIndices`.
- **OI-A55 — Infinite diagonal tail formula.** For a bounded coefficient sequence `d` whose
  magnitudes `|dₙ|` are nonincreasing, the diagonal operator on `ℓ²(ℕ, 𝕜)` (and on `ℓᵖ(ℕ, 𝕜)` for
  every `1 ≤ p ≤ ∞`) has `aₙ = |dₙ|`, which is the supremum of `|dₘ|` over `m ≥ n`; over `ℝ` or
  `ℂ`, every nonincreasing sequence in `ℝ≥0` arises this way.
  *In Tau Ceti:* `lp.singularValue_diagonalCLM`, `lp.exists_singularValue_diagonalCLM_eq`.
- **OI-A56 — Infinite diagonal convergence example.** If moreover `|dₙ| → 0`, then `aₙ → 0`, and
  over a locally compact nontrivially normed field, such as `ℝ` or `ℂ`, the operator is compact by
  OI-A27, `ℓᵖ(ℕ, 𝕜)` being complete.
  *In Tau Ceti:* `lp.tendsto_singularValue_diagonalCLM`, `ContinuousLinearMap.isCompactOperator_of_tendsto_singularValue`.

*Needs:* §§A1–A4; Tau Ceti `lp.diagonalCLM`; Mathlib `OrthonormalBasis`, `Matrix.toLin`.

**Checks.**
- For `D : 𝕜³ → 𝕜²` with diagonal entries `d₀ = 1` and `d₁ = −2`, `a₀(D) = 2 = ‖D‖`, `a₁(D) = 1`
  and `aₙ(D) = 0` for `n ≥ 2`. Reading the entries in their given order would give `a₀ = 1 ≠ ‖D‖`,
  and dropping the absolute values would give a negative value.

### Examples

- Over `ℝ` or `ℂ`, the identity of `ℓ²(ℕ, 𝕜)` has `aₙ = 1` for every `n` (OI-A51, the rank `r`
  being infinite, in fact `2^ℵ₀`), so it is not compact (OI-A29) and its Ky Fan gauges are `Kₖ = k`.
- Over `ℝ` or `ℂ`, the diagonal operator on `ℓ²(ℕ, 𝕜)` with coefficients `1/(n + 1)` has
  `aₙ = 1/(n + 1)` (OI-A55), is compact (OI-A56), has infinite rank (OI-A24), and its Ky Fan gauge
  `Kₖ` is the harmonic number `1 + 1/2 + ⋯ + 1/k`.
- A rank-one operator `x ↦ ⟪u, x⟫ • v` with `u, v ≠ 0` has `a₀ = ‖u‖ ‖v‖` (OI-A12) and `aₙ = 0`
  for `n ≥ 1` (OI-A23).
- The identity, projection, rectangular diagonal, diagonal min–max and infinite diagonal models
  OI-A51–OI-A56 of §A6 are the acceptance examples of this Part, together with the rank-vanishing
  theorem OI-A23 on the explicit rank-one operator above.

### Dependencies

PolarDecomposition PD-A36, the bounded-operator modulus, for §A3. Majorization, section *Ky Fan
sums*: the Ky Fan sums of a finite-dimensional linear map, for §A5. Mathlib bounded linear maps,
rank, adjoints, orthogonal projections, compact operators and `LinearMap.singularValues`. Tau Ceti
the diagonal operators `lp.diagonalCLM`, for §A6.

## Part B: symmetric operator ideals and Schatten norms

Part B turns approximation-number sequences into normed operator ideals. An operator-ideal family
assigns an `ℝ≥0∞`-valued gauge to the bounded maps between every pair of Hilbert spaces, with the
four laws of Convention 6; a symmetric family adds invariance under adjoints on one universe. A
symmetric gauge is a normalized, permutation-invariant, monotone and sublinear gauge on finitely
supported nonnegative sequences, and it gives the common construction behind the Ky Fan,
trace-class, Schatten and Hilbert–Schmidt families, with endpoint and block-sum compatibility
connecting the concrete families.

### B1 Ideal-family interface (OI-B01–OI-B19)

The family interface packages gauges uniformly across source and target Hilbert spaces; its laws
give the common ideal-space API and the finite-gauge carrier with the ideal norm (Pietsch,
*Operator Ideals*). Throughout this section, `𝕜` is `ℝ` or `ℂ` and `Φ` is an operator-ideal family
over `𝕜`, with sources in a universe `v` and targets in a universe `w`.

- **OI-B01 — Operator-ideal family.** An *operator-ideal family* over `𝕜` assigns to every pair of
  Hilbert spaces `E` in the universe `v` and `F` in the universe `w` a gauge
  `Φ : (E →L[𝕜] F) → ℝ≥0∞` with the four laws of Convention 6, subadditivity, absolute
  homogeneity, domination of the operator norm and the two-sided ideal inequality; the ideal
  inequality is required for `L : F → G`, `A : E → F` and `R : H → E` with `E`, `H` in the universe
  `v` and `F`, `G` in the universe `w`. On each pair a family restricts to an *operator gauge*, a
  gauge with the first three laws.
  *In Tau Ceti:* `TauCeti.OperatorIdealFamily`, `TauCeti.OperatorGauge`, `TauCeti.OperatorIdealFamily.operatorGauge`.
- **OI-B02 — Symmetric operator-ideal family.** A *symmetric* family is an operator-ideal family on
  one universe (`v = w`) whose gauge satisfies `Φ(T†) = Φ(T)` for every bounded `T` between Hilbert
  spaces of that universe.
  *In Tau Ceti:* `TauCeti.SymmetricOperatorIdealFamily`.
- **OI-B03 — Finite-gauge ideal.** For Hilbert spaces `E`, `F`, the bounded maps `T : E → F` with
  `Φ(T) < ∞` form a submodule of `E →L[𝕜] F`, the *ideal* of `Φ` on `(E, F)`.
  *In Tau Ceti:* `TauCeti.OperatorGauge.finiteSubmodule`, `TauCeti.OperatorGauge.mem_finiteSubmodule`.
- **OI-B04 — Ideal carrier.** The *carrier* of `Φ` on `(E, F)` is the type of bounded maps
  `T : E → F` with `Φ(T) < ∞`, equipped with the norm `Φ(T).toReal`. It is a type separate from the
  subtype of the submodule of OI-B03, which carries the operator norm.
  *In Tau Ceti:* `TauCeti.OperatorGauge.Carrier`.
- **OI-B05 — Zero gauge.** `Φ(0) = 0`.
  *In Tau Ceti:* `TauCeti.OperatorIdealFamily.gauge_zero`.
- **OI-B06 — Definiteness.** `Φ(T) = 0` exactly when `T = 0`.
  *In Tau Ceti:* `TauCeti.OperatorIdealFamily.gauge_eq_zero_iff`.
- **OI-B07 — Negation invariance.** `Φ(−T) = Φ(T)`.
  *In Tau Ceti:* `TauCeti.OperatorIdealFamily.gauge_neg`.
- **OI-B08 — Finite-sum subadditivity.** For a finite family `(Tᵢ)_{i ∈ s}` of bounded maps
  `E → F`, `Φ(∑_{i ∈ s} Tᵢ) ≤ ∑_{i ∈ s} Φ(Tᵢ)`.
  *In Tau Ceti:* `TauCeti.OperatorIdealFamily.gauge_sum_le`.
- **OI-B09 — Left composition bound.** For bounded `T : E → F` and `A : F → G` with `G` a Hilbert
  space in the universe `w`, `Φ(AT) ≤ ‖A‖ₑ Φ(T)`.
  *In Tau Ceti:* `TauCeti.OperatorIdealFamily.gauge_comp_left_le`.
- **OI-B10 — Right composition bound.** For bounded `T : E → F` and `B : H → E` with `H` a Hilbert
  space in the universe `v`, `Φ(TB) ≤ Φ(T) ‖B‖ₑ`.
  *In Tau Ceti:* `TauCeti.OperatorIdealFamily.gauge_comp_right_le`.
- **OI-B11 — Contractive composition.** In the settings of OI-B09 and OI-B10, if `‖A‖ ≤ 1` then
  `Φ(AT) ≤ Φ(T)`, and if `‖B‖ ≤ 1` then `Φ(TB) ≤ Φ(T)`.
  *In Tau Ceti:* `TauCeti.OperatorIdealFamily.gauge_comp_left_le_self`, `TauCeti.OperatorIdealFamily.gauge_comp_right_le_self`.
- **OI-B12 — Family extensionality.** Two operator-ideal families are equal when their gauges agree
  on every bounded map between every pair of Hilbert spaces; likewise for symmetric families.
  *In Tau Ceti:* `TauCeti.OperatorIdealFamily.ext`, `TauCeti.SymmetricOperatorIdealFamily.ext`.
- **OI-B13 — Ideal closure under addition.** If `Φ(S) < ∞` and `Φ(T) < ∞`, then `Φ(S + T) < ∞`.
  *In Tau Ceti:* `TauCeti.OperatorGauge.finiteSubmodule`.
- **OI-B14 — Ideal closure under scalar multiplication.** If `Φ(T) < ∞`, then `Φ(cT) < ∞` for
  every `c ∈ 𝕜`.
  *In Tau Ceti:* `TauCeti.OperatorGauge.finiteSubmodule`.
- **OI-B15 — Ideal closure under outer composition.** If `Φ(T) < ∞`, then `Φ(AT) < ∞` and
  `Φ(TB) < ∞` for all bounded `A`, `B` as in OI-B09 and OI-B10.
  *In Tau Ceti:* `TauCeti.OperatorIdealFamily.comp_left_mem_finiteSubmodule`, `TauCeti.OperatorIdealFamily.comp_right_mem_finiteSubmodule`.
- **OI-B16 — Ideal normed-space structure.** The carrier of OI-B04 is a normed space over `𝕜` with
  `‖T‖ = Φ(T).toReal`.
  *In Tau Ceti:* `TauCeti.OperatorGauge.Carrier.norm_def`.
- **OI-B17 — Lossless finite-gauge norm.** For every `T` in the carrier,
  `ENNReal.ofReal ‖T‖ = Φ(T)`: the passage to the real norm loses nothing.
  *In Tau Ceti:* `TauCeti.OperatorGauge.Carrier.ofReal_norm_eq_gauge`.
- **OI-B18 — Contractive inclusion.** The inclusion of the carrier into `E →L[𝕜] F` is a bounded
  linear map of norm at most `1`.
  *In Tau Ceti:* `TauCeti.OperatorGauge.Carrier.toContinuousLinearMapL`, `TauCeti.OperatorGauge.Carrier.norm_toContinuousLinearMapL_le`.
- **OI-B19 — Completeness property.** A family is *complete* when its carrier on every pair of
  Hilbert spaces is a Banach space. A family whose gauges are lower semicontinuous in the
  operator-norm topology is complete; for one pair with a complete target, a lower semicontinuous
  gauge has a complete carrier.
  *In Tau Ceti:* `TauCeti.OperatorIdealFamily.IsComplete`, `TauCeti.OperatorIdealFamily.isComplete_of_lowerSemicontinuous`, `TauCeti.OperatorGauge.completeSpace_carrier_of_lowerSemicontinuous`.

*Needs:* Mathlib `ContinuousLinearMap.adjoint`, `Submodule`, `ENNReal`.

### B2 Concrete families and Hilbert–Schmidt energy (OI-B20–OI-B23, OI-B25–OI-B41)

The operator-norm, Ky Fan, trace-class and Hilbert–Schmidt families instantiate §B1; the
Hilbert–Schmidt gauge comes from the energy of the columns, through squared column norms and basis
independence (Pietsch, *Operator Ideals*; Simon, *Trace Ideals*, Ch. 2; Reed and Simon I, Thm VI.22,
for the Hilbert–Schmidt class).

- **OI-B25 — Operator-norm family.** The gauge `Φ(T) = ‖T‖ₑ` is an operator-ideal family; on one
  universe it is a symmetric family.
  *In Tau Ceti:* `TauCeti.OperatorIdealFamily.opNorm`, `TauCeti.OperatorIdealFamily.gauge_opNorm`, `TauCeti.SymmetricOperatorIdealFamily.opNorm`.
- **OI-B26 — Operator-norm carrier.** The ideal of the operator-norm family on `(E, F)` is the
  whole space `E →L[𝕜] F`.
  *In Tau Ceti:* `TauCeti.OperatorIdealFamily.finiteSubmodule_opNorm`.
- **OI-B20 — Operator-norm family completeness.** The operator-norm family is complete in the sense
  of OI-B19.
  *In Tau Ceti:* `TauCeti.OperatorIdealFamily.opNorm_isComplete`.
- **OI-B27 — Ky Fan family.** For `k > 0`, the gauge `Φ(T) = Kₖ(T)` is an operator-ideal family:
  `k > 0` gives domination of the norm (OI-A45) and OI-A48 gives subadditivity. For `k = 1` it is
  the operator-norm family.
  *In Tau Ceti:* `TauCeti.OperatorIdealFamily.kyFan`, `TauCeti.OperatorIdealFamily.gauge_kyFan`, `TauCeti.OperatorIdealFamily.kyFan_one`.
- **OI-B28 — Ky Fan carrier.** For every `k > 0`, the ideal of the Ky Fan family on `(E, F)` is the
  whole space `E →L[𝕜] F`.
  *In Tau Ceti:* `TauCeti.OperatorIdealFamily.finiteSubmodule_kyFan`.
- **OI-B21 — Ky Fan family completeness.** For every `k > 0`, the Ky Fan family is complete in the
  sense of OI-B19.
  *In Tau Ceti:* `TauCeti.OperatorIdealFamily.kyFan_isComplete`.
- **OI-B29 — Nuclear gauge.** For a bounded map `T` between seminormed spaces over a nontrivially
  normed field, define `ν(T) = ∑' n, aₙ(T)` in `ℝ≥0∞`. It is the supremum of the Ky Fan gauges,
  finite exactly when `(aₙ(T))` is summable, subadditive for operators from a Hilbert space into an
  inner product space, and invariant under adjoints between Hilbert spaces.
  *In Tau Ceti:* `ContinuousLinearMap.nuclearENorm`, `ContinuousLinearMap.nuclearENorm_eq_iSup_kyFanGauge`, `ContinuousLinearMap.nuclearENorm_ne_top_iff_summable`, `ContinuousLinearMap.nuclearENorm_add_le`, `ContinuousLinearMap.nuclearENorm_adjoint`.
- **OI-B30 — Trace-class family.** The nuclear gauge `ν` is an operator-ideal family, the
  *trace-class family*; its ideal is the operators with summable approximation numbers, and on one
  universe it is a symmetric family.
  *In Tau Ceti:* `TauCeti.OperatorIdealFamily.traceClass`, `TauCeti.OperatorIdealFamily.gauge_traceClass`, `TauCeti.OperatorIdealFamily.mem_finiteSubmodule_traceClass_iff`, `TauCeti.SymmetricOperatorIdealFamily.traceClass`.
- **OI-B23 — Trace-class family completeness.** The trace-class family is complete in the sense of
  OI-B19.
  *In Tau Ceti:* `TauCeti.OperatorIdealFamily.traceClass_isComplete`.
- **OI-B31 — Bounded non-trace-class operator.** The identity of an infinite-dimensional Banach
  space over `ℝ` or `ℂ` has `ν(id) = ∞`; in particular every infinite-dimensional Hilbert space
  carries a bounded operator with infinite nuclear gauge.
  *In Tau Ceti:* `ContinuousLinearMap.nuclearENorm_id_eq_top`.
- **OI-B32 — Hilbert–Schmidt energy.** For a bounded `T : E → F` between inner product spaces and a
  Hilbert basis `b` of `E`, define `E_b(T) = ∑' i, ‖T bᵢ‖ₑ²` in `ℝ≥0∞`.
  *In Tau Ceti:* `ContinuousLinearMap.hilbertSchmidtEnergy`.
- **OI-B33 — Parseval expansion for Hilbert–Schmidt energy.** For a Hilbert basis `c` of the
  target, `E_b(T) = ∑' i, ∑' j, ‖⟪cⱼ, T bᵢ⟫‖ₑ²`.
  *In Tau Ceti:* `ContinuousLinearMap.hilbertSchmidtEnergy_eq_tsum_tsum`.
- **OI-B34 — Adjoint energy swap.** For `T` between Hilbert spaces and Hilbert bases `b` of the
  source and `c` of the target, `E_c(T†) = E_b(T)`. Route: both are the double sum of OI-B33, and
  the exchange of the two `ℝ≥0∞`-valued sums (Mathlib `tsum_comm`) is the whole content.
  *In Tau Ceti:* `ContinuousLinearMap.hilbertSchmidtEnergy_adjoint`.
- **OI-B35 — Basis independence.** For `T` between Hilbert spaces, `E_b(T)` does not depend on the
  Hilbert basis `b` of the source.
  *In Tau Ceti:* `ContinuousLinearMap.hilbertSchmidtEnergy_indep`.
- **OI-B36 — Hilbert–Schmidt norm.** For `T` between Hilbert spaces of finite energy, define
  `‖T‖_HS = √(E_b(T))`, which does not depend on `b` by OI-B35. The library's form is defined for
  every `T` as `√(E_b(T).toReal)`, which is `0` when the energy is infinite, may be computed in any
  Hilbert basis, and for finite energy has square equal to the energy; the statements below about
  `‖T‖_HS` assume finite energy where they need it.
  *In Tau Ceti:* `ContinuousLinearMap.hilbertSchmidtNorm`, `ContinuousLinearMap.hilbertSchmidtNorm_eq_sqrt`, `ContinuousLinearMap.ofReal_sq_hilbertSchmidtNorm`.
- **OI-B37 — Minkowski for unconditional `ℝ≥0∞` sums.** For any index type `ι`, functions
  `a, b : ι → ℝ≥0∞` and a real exponent `p ≥ 1`,
  `(∑' i, (a i + b i)^p)^(1/p) ≤ (∑' i, (a i)^p)^(1/p) + (∑' i, (b i)^p)^(1/p)`, with every power
  `ENNReal.rpow` and no summability hypothesis, infinite sums and infinite terms allowed; the
  exponent is finite, the supremum norm being the case `p = ∞` of §B5. With `p = 2` it gives the
  triangle inequality `E_b(S + T)^(1/2) ≤ E_b(S)^(1/2) + E_b(T)^(1/2)`.
  *In Tau Ceti:* `ENNReal.Lp_add_le_tsum`, `ContinuousLinearMap.rpow_hilbertSchmidtEnergy_add_le`.
- **OI-B38 — Hilbert–Schmidt domination.** For `T` between Hilbert spaces with `E_b(T) < ∞`,
  `‖T‖ ≤ ‖T‖_HS`; in energy form, `‖T‖ₑ² ≤ E_b(T)` for every `T`.
  *In Tau Ceti:* `ContinuousLinearMap.norm_le_hilbertSchmidtNorm`, `ContinuousLinearMap.enorm_sq_le_hilbertSchmidtEnergy`.
- **OI-B39 — Hilbert–Schmidt adjoint invariance.** For `T` between Hilbert spaces,
  `‖T†‖_HS = ‖T‖_HS`.
  *In Tau Ceti:* `ContinuousLinearMap.hilbertSchmidtNorm_adjoint`.
- **OI-B40 — Hilbert–Schmidt ideal inequality.** For `T` between Hilbert spaces with finite energy
  and bounded `A`, `B`, `‖ATB‖_HS ≤ ‖A‖ ‖T‖_HS ‖B‖`; in energy form, `E_b(ATB) ≤ ‖A‖ₑ² E_c(T) ‖B‖ₑ²`
  for every `T`, with `b` and `c` Hilbert bases of the sources of `B` and `T`.
  *In Tau Ceti:* `ContinuousLinearMap.hilbertSchmidtNorm_comp_comp_le`, `ContinuousLinearMap.hilbertSchmidtEnergy_comp_comp_le`.
- **OI-B41 — Hilbert–Schmidt family.** The gauge `Φ(T) = E_b(T)^(1/2)`, computed in any Hilbert
  basis `b` of the source, is an operator-ideal family, the *Hilbert–Schmidt family*; its ideal is
  the operators of finite energy, the real value of its gauge is `‖T‖_HS`, and on one universe it
  is a symmetric family.
  *In Tau Ceti:* `TauCeti.OperatorIdealFamily.hilbertSchmidt`, `TauCeti.OperatorIdealFamily.gauge_hilbertSchmidt`, `TauCeti.OperatorIdealFamily.mem_finiteSubmodule_hilbertSchmidt_iff`, `TauCeti.OperatorIdealFamily.toReal_gauge_hilbertSchmidt`, `TauCeti.SymmetricOperatorIdealFamily.hilbertSchmidt`.
- **OI-B22 — Hilbert–Schmidt family completeness.** The Hilbert–Schmidt family is complete in the
  sense of OI-B19.
  *In Tau Ceti:* `TauCeti.OperatorIdealFamily.hilbertSchmidt_isComplete`.

*Needs:* §B1; §A1 and OI-A45, OI-A48; Mathlib `HilbertBasis`, `tsum_comm`, `ENNReal.rpow`.

**Checks.**
- For the orthogonal projection `P` of `𝕜²` onto the line through `(1, 1)`, the standard basis
  gives columns of norm `1/√2` each and energy `1/2 + 1/2 = 1`, and the basis
  `((1, 1)/√2, (1, −1)/√2)` gives columns of norms `1` and `0` and energy `1`, as OI-B35 requires.
  The sum of the unsquared column norms would be `√2` in the first basis and `1` in the second, so
  the squares are what makes the energy basis independent.
- The identity of `ℓ²(ℕ, 𝕜)` has infinite energy and `ν = ∞`; the diagonal operator with
  coefficients `1/(n + 1)` has energy `∑ 1/(n + 1)² = π²/6 < ∞` and `ν = ∑ 1/(n + 1) = ∞`, so it is
  Hilbert–Schmidt but not trace class.
- For `T = diag(3, 1)` on `𝕜²`, `‖T‖_HS = √10 ≥ 3 = ‖T‖`, `ν(T) = 4` and `K₁(T) = 3`.

### B3 Ky Fan dominance and finite-dimensional Schatten norms (OI-B42–OI-B52, OI-B54–OI-B55)

Ky Fan dominance turns the comparison of prefix sums into the comparison of gauges; the
finite-dimensional Schatten norms are the singular-value models and the endpoint identifications
that reconcile the finite and infinite-dimensional theories (Mirsky 1960; Bhatia, *Matrix
Analysis*).

- **OI-B42 — Ky Fan dominance property.** A family `Φ` is *Ky Fan dominant* when `Kₖ(A) ≤ Kₖ(B)`
  for every `k` implies `Φ(A) ≤ Φ(B)`, for bounded `A : E → F` and `B : G → H` on possibly
  different pairs of Hilbert spaces (sources in the universe `v`, targets in the universe `w`).
  Requiring it across pairs makes operators with the same approximation numbers have the same
  gauge, and a Ky Fan dominant family on one universe is invariant under adjoints.
  *In Tau Ceti:* `TauCeti.OperatorIdealFamily.IsKyFanDominant`, `TauCeti.OperatorIdealFamily.gauge_eq_of_sameSingularValues`, `TauCeti.OperatorIdealFamily.gauge_adjoint`.
- **OI-B43 — Membership transport under Ky Fan dominance.** For a Ky Fan dominant family, if `B`
  lies in its ideal and `Kₖ(A) ≤ Kₖ(B)` for every `k`, then `A` lies in its ideal.
  *In Tau Ceti:* `TauCeti.OperatorIdealFamily.mem_finiteSubmodule_of_forall_kyFanGauge_le`.
- **OI-B44 — Operator-norm Ky Fan dominance.** The operator-norm family is Ky Fan dominant, since
  `‖A‖ = K₁(A)`.
  *In Tau Ceti:* `TauCeti.OperatorIdealFamily.isKyFanDominant_opNorm`.
- **OI-B45 — Ky Fan family dominance.** For every `k > 0`, the Ky Fan family of OI-B27 is Ky Fan
  dominant.
  *In Tau Ceti:* `TauCeti.OperatorIdealFamily.isKyFanDominant_kyFan`.
- **OI-B46 — Trace-class Ky Fan dominance.** The trace-class family is Ky Fan dominant, since
  `ν = supₖ Kₖ`.
  *In Tau Ceti:* `TauCeti.OperatorIdealFamily.isKyFanDominant_traceClass`.
- **OI-B47 — Finite-dimensional Schatten norm (D5).** For finite-dimensional inner product spaces
  `E`, `F` over `ℝ` or `ℂ` and real `p ≥ 1`, `‖T‖_p = (∑_{i < dim E} σᵢ(T)^p)^(1/p)` defines a
  unitarily invariant seminorm on the linear maps `E → F` in the sense of Majorization (section
  *Rectangular seminorms and transport*, Tau Ceti's `TauCeti.UnitarilyInvariantSeminorm`). The
  library's form is indexed by `p ∈ ℝ≥0∞` with `1 ≤ p`, has this formula for finite `p`, and at
  `p = ∞` is the operator-norm seminorm of Majorization (section *Concrete rectangular seminorms*,
  Tau Ceti's `TauCeti.UnitarilyInvariantSeminorm.opNorm`).
  *In Tau Ceti:* `TauCeti.UnitarilyInvariantSeminorm.schatten`, `TauCeti.UnitarilyInvariantSeminorm.schatten_apply_of_ne_top`, `TauCeti.UnitarilyInvariantSeminorm.schatten_top`.
- **OI-B48 — Schatten triangle inequality.** For linear maps `S, T : E → F`,
  `‖S + T‖_p ≤ ‖S‖_p + ‖T‖_p`: `‖·‖_p` is a seminorm.
  *In Tau Ceti:* `TauCeti.UnitarilyInvariantSeminorm.schatten`.
- **OI-B49 — Schatten definiteness.** `‖T‖_p = 0` exactly when `T = 0`.
  *In Tau Ceti:* `TauCeti.UnitarilyInvariantSeminorm.schatten_apply_eq_zero_iff`.
- **OI-B50 — Schatten adjoint invariance.** `‖T†‖_p = ‖T‖_p`.
  *In Tau Ceti:* `TauCeti.UnitarilyInvariantSeminorm.schatten_apply_adjoint`.
- **OI-B51 — Schatten ideal inequalities.** For linear maps between finite-dimensional inner
  product spaces, possibly changing the source and target spaces: if `‖Cy‖ ≤ c‖y‖` for every `y`,
  then `‖CA‖_p ≤ c ‖A‖_p`; if `c ≥ 0` and `‖Cx‖ ≤ c‖x‖` for every `x`, then `‖AC‖_p ≤ c ‖A‖_p`; and
  if `‖Cy‖ ≤ c‖y‖`, `d ≥ 0` and `‖Dx‖ ≤ d‖x‖` for all `x`, `y`, then `‖CAD‖_p ≤ c d ‖A‖_p`.
  *In Tau Ceti:* `TauCeti.UnitarilyInvariantSeminorm.schatten_comp_le_left`, `TauCeti.UnitarilyInvariantSeminorm.schatten_comp_le_right`, `TauCeti.UnitarilyInvariantSeminorm.schatten_comp_comp_le`.
- **OI-B52 — Nuclear endpoint.** At `p = 1`, `‖T‖₁ = ∑ᵢ σᵢ(T)` is the nuclear seminorm of
  Majorization (section *Concrete rectangular seminorms*, Tau Ceti's
  `TauCeti.UnitarilyInvariantSeminorm.nuclear`).
  *In Tau Ceti:* `TauCeti.UnitarilyInvariantSeminorm.schatten_one`.
- **OI-B54 — Frobenius endpoint.** At `p = 2`, `‖T‖₂` is the rectangular Frobenius seminorm of
  Majorization (section *Concrete rectangular seminorms*, Tau Ceti's
  `TauCeti.UnitarilyInvariantSeminorm.frobenius`).
  *In Tau Ceti:* `TauCeti.UnitarilyInvariantSeminorm.schatten_two`.
- **OI-B55 — Finite-dimensional energy identity.** For a bounded `T : E → F` between inner product
  spaces with `E` finite-dimensional and any Hilbert basis `b` of `E`,
  `E_b(T) = ENNReal.ofReal (‖T‖_F²)`, where `‖T‖_F` is the Frobenius seminorm.
  *In Tau Ceti:* `ContinuousLinearMap.hilbertSchmidtEnergy_eq_ofReal_sq_frobenius`.

*Needs:* §§B1, B2; §A5 (OI-A49); Majorization, sections *Rectangular seminorms and transport*
(Tau Ceti `TauCeti.UnitarilyInvariantSeminorm`) and *Concrete rectangular seminorms* (Tau Ceti
`TauCeti.UnitarilyInvariantSeminorm.opNorm`, `TauCeti.UnitarilyInvariantSeminorm.nuclear`,
`TauCeti.UnitarilyInvariantSeminorm.frobenius`); Mathlib `LinearMap.singularValues`.

**Checks.**
- For `T = diag(3, 4)` on `𝕜²`, `σ(T) = (4, 3)`, so `‖T‖₁ = 7`, `‖T‖₂ = 5`, which is the Frobenius
  value `√(9 + 16)`, and `‖T‖_∞ = 4 = ‖T‖`; the values decrease in `p`.

### B4 Symmetric gauges and induced families (OI-B56–OI-B73)

A symmetric gauge on finitely supported sequences extends by a supremum over dominated finitely
supported sequences; applied to the approximation numbers it gives a uniform operator-ideal family
(Gohberg and Kreĭn, Ch. III: symmetric norming functions from p. 71, and the bounds of OI-B57 and
OI-B58 as relation (3.12) of §3, p. 76; Mirsky 1960).

- **OI-B56 — Symmetric gauge.** A *symmetric gauge* is a function `Φ : (ℕ →₀ ℝ≥0) → ℝ≥0` that is
  subadditive, positively homogeneous (`Φ(c a) = c Φ(a)` for `c ∈ ℝ≥0`), invariant under every
  permutation of `ℕ`, monotone, and normalized by `Φ(e₀) = 1`. Then `Φ(c eₙ) = c` for every `n` and
  every `c ∈ ℝ≥0`.
  *In Tau Ceti:* `TauCeti.SymmetricGauge`, `TauCeti.SymmetricGauge.map_single`.
- **OI-B57 — Supremum lower bound for a symmetric gauge.** `supₙ aₙ ≤ Φ(a)` for every
  `a : ℕ →₀ ℝ≥0`.
  *In Tau Ceti:* `TauCeti.SymmetricGauge.iSup_le_apply`.
- **OI-B58 — Sum upper bound for a symmetric gauge.** `Φ(a) ≤ ∑ₙ aₙ` for every `a : ℕ →₀ ℝ≥0`.
  *In Tau Ceti:* `TauCeti.SymmetricGauge.apply_le_sum`.
- **OI-B59 — Extension to arbitrary sequences (D1).** For `a : ℕ → ℝ≥0∞`, define
  `Φ∞(a) = sup {Φ(b) : b : ℕ →₀ ℝ≥0, (b n : ℝ≥0∞) ≤ a n for all n}` in `ℝ≥0∞`. It is a supremum
  rather than a sum so that it is defined for every sequence and equals `∞` off the ideal. It
  agrees with `Φ` on finitely supported sequences, is invariant under permutations of `ℕ`, and lies
  between the supremum and the sum of the sequence: `supₙ aₙ ≤ Φ∞(a) ≤ ∑' n, aₙ`.
  *In Tau Ceti:* `TauCeti.SymmetricGauge.extend`, `TauCeti.SymmetricGauge.extend_coe`, `TauCeti.SymmetricGauge.extend_comp_perm`, `TauCeti.SymmetricGauge.iSup_le_extend`, `TauCeti.SymmetricGauge.extend_le_tsum`.
- **OI-B60 — Initial truncation formula (D1).** For every finite-valued `a : ℕ → ℝ≥0`, let
  `a<N : ℕ →₀ ℝ≥0` agree with `a` on `{0, …, N − 1}` and vanish elsewhere; then `Φ∞(a)` is the
  supremum over `N` of `Φ(a<N)`, with no antitonicity hypothesis.
  *In Tau Ceti:* `TauCeti.SymmetricGauge.extend_coe_eq_iSup_indicator`.
- **OI-B61 — Monotonicity of the extension.** If `a ≤ b` termwise, then `Φ∞(a) ≤ Φ∞(b)`.
  *In Tau Ceti:* `TauCeti.SymmetricGauge.extend_mono`.
- **OI-B62 — Homogeneity of the extension.** `Φ∞(c a) = c Φ∞(a)` for every `c ∈ ℝ≥0∞`, in
  particular for every real `c ≥ 0`.
  *In Tau Ceti:* `TauCeti.SymmetricGauge.extend_smul`.
- **OI-B63 — Subadditivity of the extension.** `Φ∞(a + b) ≤ Φ∞(a) + Φ∞(b)`.
  *In Tau Ceti:* `TauCeti.SymmetricGauge.extend_add_le`.
- **OI-B64 — Symmetric-gauge ideal family (D2).** Over `ℝ` or `ℂ`, every symmetric gauge `Φ`
  induces a rectangular operator-ideal family, with gauge given by OI-B65.
  *In Tau Ceti:* `TauCeti.SymmetricGauge.operatorIdealFamily`.
- **OI-B65 — Induced gauge formula (D2).** The family of OI-B64 has gauge
  `Φ(T) = Φ∞(n ↦ aₙ(T))`.
  *In Tau Ceti:* `TauCeti.SymmetricGauge.opGauge`, `TauCeti.SymmetricGauge.operatorIdealFamily_gauge`, `TauCeti.SymmetricGauge.opGauge_def`.
- **OI-B66 — Induced-family subadditivity.** For bounded `S, T` from a Hilbert space into an inner
  product space, `Φ∞(a(S + T)) ≤ Φ∞(a(S)) + Φ∞(a(T))`. Route: OI-A48 with the weak-majorization
  transfer OI-B74.
  *In Tau Ceti:* `TauCeti.SymmetricGauge.opGauge_add_le`.
- **OI-B67 — Induced-family homogeneity.** `Φ∞(a(cT)) = ‖c‖ₑ Φ∞(a(T))` for every scalar `c`.
  *In Tau Ceti:* `TauCeti.SymmetricGauge.opGauge_smul`.
- **OI-B68 — Induced-family operator-norm domination.** `‖T‖ₑ ≤ Φ∞(a(T))`.
  *In Tau Ceti:* `TauCeti.SymmetricGauge.enorm_le_opGauge`.
- **OI-B69 — Induced-family composition bound.** For bounded `A`, `T`, `B` composable as
  `ATB`, `Φ∞(a(ATB)) ≤ ‖A‖ₑ Φ∞(a(T)) ‖B‖ₑ`. OI-B67–OI-B69 hold on seminormed spaces over any
  nontrivially normed field.
  *In Tau Ceti:* `TauCeti.SymmetricGauge.opGauge_comp_comp_le`.
- **OI-B70 — Cross-universe adjoint invariance.** For `T : E → F` between Hilbert spaces in
  possibly different universes, the induced gauge of `T† : F → E` equals that of `T`.
  *In Tau Ceti:* `TauCeti.SymmetricGauge.opGauge_adjoint`.
- **OI-B71 — Symmetric diagonal view.** On one universe, the family of OI-B64 with the adjoint
  invariance of OI-B70 is a symmetric operator-ideal family.
  *In Tau Ceti:* `TauCeti.SymmetricGauge.symmetricOperatorIdealFamily`.
- **OI-B72 — Injectivity on antitone sequences.** If two symmetric gauges `Φ` and `Ψ` induce the
  same family over `𝕜`, then `Φ∞(a) = Ψ∞(a)` for every antitone `a : ℕ → ℝ≥0∞`. Classically, `Φ`
  is recovered from the symmetrically normed ideal it generates: for finitely supported `ξ`, `Φ(ξ)`
  is the norm of `diag(ξ)` in that ideal (Gohberg and Kreĭn, Ch. III). For `𝕜` and the spaces of
  the families in the lowest universe this is
  `TauCeti.SymmetricGauge.extend_eq_of_operatorIdealFamily_eq`. **Target:** prove it for `𝕜` in an
  arbitrary universe `u` and families over sources in an arbitrary universe `v` and targets in an
  arbitrary universe `w`, `symmetricGaugeFamily_injective`. A route: if `a 0 = ∞` both sides are
  `∞` by OI-B59; otherwise `a` is the approximation-number sequence of a diagonal operator on
  `ℓ²(ℕ, 𝕜)` (OI-A55), carried by linear isometric equivalences to a Hilbert space over `𝕜` in
  universe `v` and one in universe `w`, under which approximation numbers do not change
  (`ContinuousLinearMap.singularValue_comp_linearIsometryEquiv`). Those two spaces are part of the
  target, because the pinned libraries supply no Hilbert space over `𝕜` in an arbitrary universe:
  `ℓ²(ℕ, 𝕜)` lies in the universe `u` of `𝕜`, and Mathlib gives `ULift` a normed-space structure
  (`ULift.normedSpace`) but no inner product. For every universe `v`, the target constructs a
  Hilbert space over `𝕜` in `Type v` with a `𝕜`-linear isometric equivalence to `ℓ²(ℕ, 𝕜)`: take
  `ℓ²(ℕ, ℂ)` if `im I = 1` in `𝕜` and `ℓ²(ℕ, ℝ)` if `I = 0` (`RCLike.I_eq_zero_or_im_I_eq_one`),
  transport its scalars to `𝕜` along the isometric ring isomorphism `RCLike.complexRingEquiv` or
  `RCLike.realRingEquiv` (isometric by `RCLike.complexLinearIsometryEquiv`,
  `RCLike.realLinearIsometryEquiv`), composing its inner product with the inverse isomorphism, and
  lift it to `Type v` with `ULift`. *Needs:* OI-A55, OI-B59, OI-B65; Tau Ceti
  `lp.exists_singularValue_diagonalCLM_eq`,
  `ContinuousLinearMap.singularValue_comp_linearIsometryEquiv`; Mathlib `ULift.normedSpace`,
  `RCLike.I_eq_zero_or_im_I_eq_one`, `RCLike.complexRingEquiv`, `RCLike.realRingEquiv`,
  `RCLike.complexLinearIsometryEquiv`, `RCLike.realLinearIsometryEquiv`.
- **OI-B73 — Approximation-number membership invariance.** Operators with the same approximation
  numbers, possibly on different pairs of spaces, have the same induced gauge, hence the same
  membership in every induced family.
  *In Tau Ceti:* `TauCeti.SymmetricGauge.opGauge_eq_of_sameSingularValues`.

*Needs:* §§A1, A3, A5 (OI-A48), B1; OI-B74 for OI-B66.

**Checks.**
- The constant sequence `1` has `Φ∞ = 1` for the supremum gauge of §B5 and `Φ∞ = ∞` for every
  `ℓᵖ` gauge with finite `p`; accordingly the identity of `ℓ²(ℕ, 𝕜)` has induced gauge `1` for the
  first and `∞` for the second. A definition applying `Φ` to the support of an infinitely supported
  sequence would not be defined there.
- Every induced gauge of a rank-one operator `x ↦ ⟪u, x⟫ • v` is `‖u‖ ‖v‖`: its approximation
  numbers are `(‖u‖ ‖v‖, 0, 0, …)` and `Φ(c e₀) = c`. Twice the supremum is subadditive,
  homogeneous, symmetric and monotone but not normalized; it would give `2 ‖u‖ ‖v‖`, and its family
  would have twice the operator norm, not the operator norm, as its endpoint.
- The supremum gauge and the `ℓ²` gauge take the values `1` and `√2` on `(1, 1, 0, …)`, so their
  families differ on the identity of `𝕜²`, although both ideals contain every operator on
  finite-dimensional spaces: OI-B72 compares gauges, not ideals.

### B5 Ky Fan transfer and Schatten families (OI-B24, OI-B74–OI-B88, OI-B90)

Weak majorization transfers prefix-sum comparisons to every symmetric gauge, which gives triangle
inequalities and membership transport for all induced families at once; the `ℓᵖ` gauges produce
the Schatten scale with its trace-class, Hilbert–Schmidt and operator-norm endpoints (Bhatia,
*Matrix Analysis*; Simon, *Trace Ideals*, Ch. 2).

- **OI-B74 — Symmetric-gauge weak-majorization transfer.** For `a, b : ℕ → ℝ≥0∞` with `a`
  antitone, if `∑_{n<k} aₙ ≤ ∑_{n<k} bₙ` for every `k`, then `Φ∞(a) ≤ Φ∞(b)`; the same holds for
  finitely supported `a`, `b` and `Φ`. Only `a` need be antitone.
  *In Tau Ceti:* `TauCeti.SymmetricGauge.extend_le_extend_of_forall_sum_le`, `TauCeti.SymmetricGauge.apply_le_apply_of_forall_sum_le`.
- **OI-B75 — Induced-family Ky Fan dominance.** Every family of OI-B64 is Ky Fan dominant in the
  sense of OI-B42; on seminormed spaces, `Kₖ(S) ≤ Kₖ(T)` for every `k` gives
  `Φ∞(a(S)) ≤ Φ∞(a(T))`.
  *In Tau Ceti:* `TauCeti.SymmetricGauge.isKyFanDominant_operatorIdealFamily`, `TauCeti.SymmetricGauge.opGauge_le_of_forall_kyFanGauge_le`.
- **OI-B76 — Schatten symmetric gauge (D3).** For real `p ≥ 1`, define
  `Φ_p(a) = (∑ₙ aₙ^p)^(1/p)` for `a : ℕ →₀ ℝ≥0`.
  *In Tau Ceti:* `TauCeti.SymmetricGauge.lpGauge`, `TauCeti.SymmetricGauge.lpGauge_apply`.
- **OI-B77 — Schatten gauge laws.** For real `p ≥ 1`, `Φ_p` is a symmetric gauge: it is
  subadditive (Minkowski's inequality for finite sums), positively homogeneous, invariant under
  permutations of `ℕ`, monotone, and `Φ_p(e₀) = 1`.
  *In Tau Ceti:* `TauCeti.SymmetricGauge.lpGauge`.
- **OI-B78 — Finite-exponent Schatten family.** For real `p ≥ 1`, the *Schatten family* `S_p` is
  the rectangular family induced by `Φ_p`; its gauge is `(∑' n, aₙ(T)^p)^(1/p)` in `ℝ≥0∞`, its
  ideal is the operators with `∑ aₙ(T)^p < ∞`, and its gauge is lower semicontinuous in the
  operator-norm topology.
  *In Tau Ceti:* `TauCeti.OperatorIdealFamily.schatten`, `TauCeti.OperatorIdealFamily.schatten_def`, `TauCeti.OperatorIdealFamily.gauge_schatten`, `TauCeti.OperatorIdealFamily.mem_finiteSubmodule_schatten_iff`, `TauCeti.OperatorIdealFamily.lowerSemicontinuous_gauge_schatten`.
- **OI-B24 — Finite Schatten family completeness.** For every real `p ≥ 1`, the Schatten family is
  complete in the sense of OI-B19.
  *In Tau Ceti:* `TauCeti.OperatorIdealFamily.schatten_isComplete`.
- **OI-B79 — Finite-exponent symmetric Schatten family.** For real `p ≥ 1`, on one universe the
  Schatten family, with the adjoint invariance of OI-B70, is a symmetric operator-ideal family.
  *In Tau Ceti:* `TauCeti.SymmetricOperatorIdealFamily.schatten`.
- **OI-B80 — Infinite-exponent Schatten family (D4).** The rectangular `p = ∞` family has gauge
  `‖T‖ₑ`: it is the operator-norm family of OI-B25, and it is the family induced by the supremum
  gauge `a ↦ supₙ aₙ`.
  *In Tau Ceti:* `TauCeti.OperatorIdealFamily.opNorm`, `TauCeti.SymmetricGauge.supGauge`, `TauCeti.SymmetricGauge.operatorIdealFamily_supGauge`.
- **OI-B81 — Infinite-exponent symmetric Schatten family.** On one universe the `p = ∞` family is
  the symmetric operator-norm family of OI-B25, and it is the symmetric family induced by the
  supremum gauge.
  *In Tau Ceti:* `TauCeti.SymmetricOperatorIdealFamily.opNorm`, `TauCeti.SymmetricGauge.symmetricOperatorIdealFamily_supGauge`.
- **OI-B82 — Infinite-endpoint approximation-number formula (D4).** The gauge of OI-B80 is
  `supₙ aₙ(T) = ‖T‖`: the extension of the supremum gauge is the supremum of the sequence, and
  OI-A14 gives the value.
  *In Tau Ceti:* `TauCeti.SymmetricGauge.extend_supGauge`, `TauCeti.SymmetricGauge.opGauge_supGauge`, `ContinuousLinearMap.iSup_singularValue`.
- **OI-B83 — Trace-class endpoint.** The Schatten family at `p = 1` is the trace-class family of
  OI-B30.
  *In Tau Ceti:* `TauCeti.OperatorIdealFamily.schatten_one`.
- **OI-B84 — Hilbert–Schmidt endpoint.** The Schatten family at `p = 2` is the Hilbert–Schmidt
  family of OI-B41.
  *In Tau Ceti:* `TauCeti.OperatorIdealFamily.schatten_two`.
- **OI-B85 — Operator-norm endpoint family.** The family induced by the supremum gauge, the
  infinite-exponent family, equals the operator-norm family.
  *In Tau Ceti:* `TauCeti.SymmetricGauge.operatorIdealFamily_supGauge`.
- **OI-B86 — Endpoint symmetry.** The symmetric families agree at the three endpoints: the
  symmetric Schatten family at `p = 1` is the symmetric trace-class family, at `p = 2` the symmetric
  Hilbert–Schmidt family, and the symmetric family of the supremum gauge is the symmetric
  operator-norm family.
  *In Tau Ceti:* `TauCeti.SymmetricOperatorIdealFamily.schatten_one`, `TauCeti.SymmetricOperatorIdealFamily.schatten_two`, `TauCeti.SymmetricGauge.symmetricOperatorIdealFamily_supGauge`.
- **OI-B87 — Schatten scale monotonicity.** If `1 ≤ p ≤ q`, then the `S_q` gauge of `T` is at most
  its `S_p` gauge. Route: the comparison `(∑' i, f i^q)^(1/q) ≤ (∑' i, f i^p)^(1/p)` of `ℓᵖ` sums in
  `ℝ≥0∞` for `0 < p ≤ q` (Tau Ceti `ENNReal.Lq_le_Lp_tsum`).
  *In Tau Ceti:* `TauCeti.OperatorIdealFamily.gauge_schatten_le_of_le`.
- **OI-B88 — Schatten ideal inclusion.** If `1 ≤ p ≤ q`, then `S_p ⊆ S_q` on every pair of Hilbert
  spaces.
  *In Tau Ceti:* `TauCeti.OperatorIdealFamily.finiteSubmodule_schatten_le_of_le`.
- **OI-B90 — Hilbert–Schmidt reconciliation.** For a bounded `T` from a Hilbert space into an inner
  product space and every Hilbert basis `b` of the source, `∑' n, aₙ(T)² = E_b(T)` in `ℝ≥0∞`. The
  inequality `E_b(T) ≤ ∑' n, aₙ(T)²` needs no completeness; the energy is finite exactly when the
  approximation numbers are square-summable; and between Hilbert spaces
  `‖T‖_HS² = ∑' n, aₙ(T)²`.
  *In Tau Ceti:* `ContinuousLinearMap.tsum_singularValue_sq_eq_hilbertSchmidtEnergy`, `ContinuousLinearMap.hilbertSchmidtEnergy_le_tsum_singularValue_sq`, `ContinuousLinearMap.hilbertSchmidtEnergy_ne_top_iff_summable_singularValue_sq`, `ContinuousLinearMap.sq_hilbertSchmidtNorm_eq_tsum_singularValue_sq`.

*Needs:* §§B2–B4; §A5 (OI-A48); Tau Ceti `ENNReal.Lq_le_Lp_tsum`.

**Checks.**
- For `r ≥ 1`, the diagonal operator on `ℓ²(ℕ, 𝕜)` with coefficients `(n + 1)^(−1/r)` has
  `aₙ = (n + 1)^(−1/r)` (OI-A55) and lies in `S_q` exactly when `∑ (n + 1)^(−q/r) < ∞`, that is when
  `q > r`. For `1 ≤ p < r < q` it lies in `S_q` and not in `S_p`, so the inclusions of OI-B88 are
  strict and do not reverse.
- For the diagonal operator with coefficients `1/(n + 1)`, both sides of OI-B90 are
  `∑ 1/(n + 1)² = π²/6`, computed in the standard basis.

### B6 Orthogonal block sums (OI-B89, OI-B91–OI-B94)

The approximation numbers of an orthogonal block sum merge those of the blocks by generalized
order statistics; the merge records the `n`-th largest value in the generalized sense and need not
list every entry of the union, which matters for noncompact blocks with infinite plateaus
(Gohberg and Kreĭn; Pietsch, *Eigenvalues and s-Numbers*).

- **OI-B89 — Generalized decreasing merge (D7).** For bounded `a, b : ℕ → ℝ≥0`, `(a ⊔↓ b)ₙ` is the
  supremum of the `r ∈ ℝ≥0` for which some injective `q : Fin (n + 1) → ℕ ⊕ ℕ` has
  `r ≤ (Sum.elim a b) (q i)` for every `i`: the largest threshold reached by `n + 1` distinct
  entries of the multiset union of `a` and `b`, its generalized `n`-th order statistic. It is
  symmetric in `a` and `b` and antitone. For antitone `a` and `b`, `r ≤ (a ⊔↓ b)ₙ` exactly when
  `r ≤ aₖ` for `k < i` and `r ≤ bₖ` for `k < j` for some `i + j = n + 1`, and
  `(a ⊔↓ b)₀ = max(a₀, b₀)`.
  *In Tau Ceti:* `TauCeti.decreasingMerge`, `TauCeti.decreasingMerge_def`, `TauCeti.decreasingMerge_comm`, `TauCeti.antitone_decreasingMerge`, `TauCeti.le_decreasingMerge_iff`, `TauCeti.decreasingMerge_zero`.
- **OI-B91 — Approximation numbers of a block sum.** Over `ℝ` or `ℂ`, for `T₁ : E₁ → F₁` and
  `T₂ : E₂ → F₂` with `E₁`, `E₂` Hilbert spaces and `F₁`, `F₂` inner product spaces,
  `aₙ(T₁ ⊕ T₂) = (a(T₁) ⊔↓ a(T₂))ₙ` for every `n`. The inequality `≤` holds on seminormed spaces
  over any nontrivially normed field, and `≥` for blocks whose pairs have the property of OI-A38.
  *In Tau Ceti:* `ContinuousLinearMap.singularValue_withLpProdMap`, `ContinuousLinearMap.singularValue_withLpProdMap_le`, `ContinuousLinearMap.decreasingMerge_le_singularValue_withLpProdMap`.
- **OI-B92 — Symmetric-gauge block formula.** In the setting of OI-B91, for every symmetric gauge
  `Φ`, the induced gauge satisfies `Φ(T₁ ⊕ T₂) = Φ∞(n ↦ (a(T₁) ⊔↓ a(T₂))ₙ)`.
  *In Tau Ceti:* `TauCeti.SymmetricGauge.opGauge_withLpProdMap`.
- **OI-B93 — Block lower bound.** For every symmetric gauge `Φ` and bounded `T₁`, `T₂` between
  seminormed spaces over a nontrivially normed field, `max(Φ(T₁), Φ(T₂)) ≤ Φ(T₁ ⊕ T₂)` for the
  induced gauge.
  *In Tau Ceti:* `TauCeti.SymmetricGauge.opGauge_le_opGauge_withLpProdMap_left`, `TauCeti.SymmetricGauge.opGauge_le_opGauge_withLpProdMap_right`.
- **OI-B94 — Block upper bound.** In the setting of OI-B93, `Φ(T₁ ⊕ T₂) ≤ Φ(T₁) + Φ(T₂)`.
  *In Tau Ceti:* `TauCeti.SymmetricGauge.opGauge_withLpProdMap_le_add`.
- **Target:** *block bounds for every family.* For every operator-ideal family `Φ`, Hilbert spaces
  `E`, `F`, a bounded `T : E → F`, and maps `P₁, P₂ : E → E` and `Q₁, Q₂ : F → F` of norm at most
  `1` with `T = Q₁TP₁ + Q₂TP₂`, prove `max(Φ(Q₁TP₁), Φ(Q₂TP₂)) ≤ Φ(T) ≤ Φ(Q₁TP₁) + Φ(Q₂TP₂)`.
  The upper bound is subadditivity applied to the splitting and the lower bound is the two-sided
  ideal inequality applied to each compression. With `P` and `Q` the coordinate projections of
  `WithLp 2 (E₁ × E₂)` and `WithLp 2 (F₁ × F₂)`, and the ideal inequality once more for the
  inclusions of the blocks, it gives `max(Φ(T₁), Φ(T₂)) ≤ Φ(T₁ ⊕ T₂) ≤ Φ(T₁) + Φ(T₂)` for every
  family, extending OI-B93 and OI-B94. *Needs:* §B1 (OI-B11, the subadditivity law of OI-B01).

*Needs:* §§A1–A4 (OI-A38, OI-A39), B1, B4; Tau Ceti `ContinuousLinearMap.withLpProdMap`;
Mathlib `WithLp`.

**Checks.**
- For `a = (3, 1, 0, 0, …)` and `b = (2, 2, 0, 0, …)`, `a ⊔↓ b = (3, 2, 2, 1, 0, 0, …)`: at `n = 3`
  the four largest entries are `3, 2, 2, 1`, and from `n = 4` on any five distinct entries include
  a `0`. So `diag(3, 1) ⊕ diag(2, 2)` has trace norm `8 = 4 + 4` and operator norm
  `3 = max(3, 2)`: the two bounds of OI-B93 and OI-B94 are attained by the supremum and `ℓ¹`
  gauges respectively.
- For `a = (1, 1, 1, …)` and `b = (1/2, 0, 0, …)`, `(a ⊔↓ b)ₙ = 1` for every `n`, which is the
  approximation-number sequence of the identity of `ℓ²(ℕ, 𝕜)` summed with a rank-one block of norm
  `1/2`. The value `1/2` appears at no index: a definition that sorts the union of the two
  sequences into one nonincreasing sequence has no place for it.

### Examples

- The operator-norm and Ky Fan families have every bounded operator in their ideals (OI-B26,
  OI-B28); the identity of an infinite-dimensional Hilbert space lies outside the trace class
  (OI-B31) and outside every `S_p` with finite `p`.
- The concrete families are the operator-norm, Ky Fan, trace-class and Hilbert–Schmidt families
  (OI-B25, OI-B27, OI-B30, OI-B41), and the Schatten families of §B5.
- The diagonal operator with coefficients `1/(n + 1)` lies in `S_p` exactly for `p > 1`; it is
  Hilbert–Schmidt with `‖T‖_HS = π/√6` and not trace class.

### Dependencies

Part A. Majorization, sections *Rectangular seminorms and transport* and *Concrete rectangular
seminorms*: unitarily invariant seminorms and the operator-norm, nuclear and Frobenius seminorms,
for §B3. Mathlib Hilbert bases, `ℝ≥0∞`-valued sums and `WithLp`. Tau Ceti the `ℓᵖ` block sums
`ContinuousLinearMap.withLpProdMap`, for §B6.

## Part C: Hilbert–Schmidt operators as an ℓ² space of columns

The column model identifies the operators of finite Hilbert–Schmidt energy with the `ℓ²` families
of columns relative to a Hilbert basis of the source; its norm and energy identities connect the
representation directly with the Hilbert–Schmidt family of Part B. For a Hilbert basis `b = (bᵢ)`
of the source, the column family of `T` is `i ↦ T bᵢ`, and an `ℓ²` family `f = (fᵢ)` represents the
bounded operator `T_f x = ∑' i, ⟪bᵢ, x⟫ • fᵢ` (Convention 8).

### C1 Hilbert–Schmidt column model (OI-C01–OI-C14)

Relative to a Hilbert basis `b` of the source, an operator is determined by its columns, and the
operators of finite energy are exactly those with square-summable columns (Reed and Simon I;
Simon, *Trace Ideals*, Ch. 2). Throughout, `𝕜` is `ℝ` or `ℂ`, `E` an inner product space and `b` a
Hilbert basis of `E` indexed by `ι`.

- **OI-C01 — Column family.** The column family of a bounded `T : E → F` relative to `b` is the
  function `i ↦ T bᵢ`; the statements below are written with this function, and no separate
  declaration is needed for it.
- **OI-C02 — Operator represented by `ℓ²` columns (D6).** For `F` a Banach space and
  `f ∈ ℓ²(ι, F)`, the series `T_f x = ∑' i, ⟪bᵢ, x⟫ • fᵢ` converges absolutely for every `x ∈ E`,
  with `∑' i, ‖⟪bᵢ, x⟫‖ ‖fᵢ‖ ≤ ‖x‖ ‖f‖`, and defines a bounded operator `T_f : E → F`.
  *In Tau Ceti:* `HilbertBasis.columnOperator`, `HilbertBasis.columnOperator_apply`, `HilbertBasis.tsum_norm_inner_mul_norm_le`.
- **OI-C03 — Column membership characterization.** For `F` an inner product space and a bounded
  `T : E → F`, `E_b(T) < ∞` exactly when the column family `i ↦ T bᵢ` lies in `ℓ²`.
  *In Tau Ceti:* `ContinuousLinearMap.hilbertSchmidtEnergy_ne_top_iff_memℓp`.
- **OI-C04 — Column summability characterization.** For `F` an inner product space, `E_b(T) < ∞`
  exactly when `i ↦ ‖T bᵢ‖²` is summable.
  *In Tau Ceti:* `ContinuousLinearMap.hilbertSchmidtEnergy_ne_top_iff_summable`.
- **OI-C05 — Columns of the represented operator.** For `F` a Banach space and `f ∈ ℓ²(ι, F)`,
  `T_f bᵢ = fᵢ` for every `i`, and for a bounded `T : E → F`, `T_f = T` exactly when `fᵢ = T bᵢ`
  for every `i`.
  *In Tau Ceti:* `HilbertBasis.columnOperator_apply_self`, `HilbertBasis.columnOperator_eq_iff`.
- **OI-C06 — Reconstruction from columns.** For `F` a Banach space, a bounded `T : E → F` whose
  column family lies in `ℓ²` is the operator represented by its column family; by OI-C03 this
  covers every operator of finite energy into a Hilbert space.
  *In Tau Ceti:* `HilbertBasis.columnOperator_mk`.
- **OI-C07 — Injectivity of column representation.** For `F` a Banach space, two families in
  `ℓ²(ι, F)` representing the same operator are equal.
  *In Tau Ceti:* `HilbertBasis.columnOperator_injective`.
- **OI-C08 — Unique column representative.** For `F` a Hilbert space, every bounded `T : E → F` of
  finite energy has exactly one representing family in `ℓ²(ι, F)`, and the represented operators
  are exactly the operators of finite energy.
  *In Tau Ceti:* `HilbertBasis.existsUnique_columnOperator_eq`, `HilbertBasis.range_columnOperator`.
- **OI-C09 — Linearity of column representation.** For `F` a Banach space, the map `f ↦ T_f` from
  `ℓ²(ι, F)` to `E →L[𝕜] F` is linear.
  *In Tau Ceti:* `HilbertBasis.columnOperator`.
- **OI-C10 — Operator-norm bound.** For `F` a Banach space and `f ∈ ℓ²(ι, F)`, `‖T_f‖ ≤ ‖f‖`.
  *In Tau Ceti:* `HilbertBasis.norm_columnOperator_apply_le`.
- **OI-C11 — Hilbert–Schmidt norm identity.** For `F` a Banach space and `f ∈ ℓ²(ι, F)`,
  `∑' i, ‖T_f bᵢ‖² = ‖f‖²`; for `E` and `F` Hilbert spaces, `‖T_f‖_HS = ‖f‖`.
  *In Tau Ceti:* `HilbertBasis.tsum_norm_columnOperator_apply_self_sq`, `HilbertBasis.hilbertSchmidtNorm_columnOperator`.
- **OI-C12 — Energy identity.** For `F` a Hilbert space and `f ∈ ℓ²(ι, F)`, `E_b(T_f) = ‖f‖ₑ²`.
  *In Tau Ceti:* `HilbertBasis.hilbertSchmidtEnergy_columnOperator`.
- **OI-C13 — Continuity of column representation.** For `F` a Banach space, `f ↦ T_f` is a bounded
  linear map `ℓ²(ι, F) → (E →L[𝕜] F)` of norm at most `1`.
  *In Tau Ceti:* `HilbertBasis.columnOperator`, `HilbertBasis.norm_columnOperator_le`.
- **OI-C14 — Hilbert–Schmidt operators are compact.** For `F` a Hilbert space, if a bounded
  `T : E → F` has `E_b(T) < ∞`, then `T` is compact. Route: every `T_f` is the norm limit of the
  operators represented by the finite truncations of `f`, which have finite rank.
  *In Tau Ceti:* `ContinuousLinearMap.isCompactOperator_of_hilbertSchmidtEnergy_ne_top`, `HilbertBasis.isCompactOperator_columnOperator`.

*Needs:* §B2 (OI-B32); Mathlib `HilbertBasis`, `lp`, `Memℓp`, `IsCompactOperator`.

**Checks.**
- The family `fᵢ = (1/(i + 1)) • bᵢ` in `ℓ²(ℕ, ℓ²(ℕ, 𝕜))` with the standard basis `b` represents the
  diagonal operator with coefficients `1/(i + 1)`, and `‖f‖² = π²/6 = E_b(T_f)`. The columns
  `i ↦ bᵢ` of the identity have norm `1` and do not lie in `ℓ²`, so the identity is represented by
  no family, as OI-C08 requires of an operator of infinite energy.

### C2 Isometric conjugation (OI-C15–OI-C17)

The energy is invariant under isometries on the left and coisometries on the right (Simon, *Trace
Ideals*).

- **OI-C15 — Left isometric invariance.** For inner product spaces `E`, `F`, `G` over `ℝ` or `ℂ`, a
  Hilbert basis `b` of `E`, a bounded `T : E → F` and a bounded `U : F → G` with `‖Ux‖ = ‖x‖` for
  every `x`, `E_b(UT) = E_b(T)`, with no completeness; between Hilbert spaces also
  `‖UT‖_HS = ‖T‖_HS`.
  *In Tau Ceti:* `ContinuousLinearMap.hilbertSchmidtEnergy_isometry_comp`, `ContinuousLinearMap.hilbertSchmidtNorm_isometry_comp`.
- **OI-C16 — Right coisometric invariance.** For `V : E → F` and `T : F → G` between Hilbert spaces,
  if `‖V† x‖ = ‖x‖` for every `x ∈ F`, then `‖TV‖_HS = ‖T‖_HS`, and `E_b(TV) = E_c(T)` for Hilbert
  bases `b` of `E` and `c` of `F`.
  *In Tau Ceti:* `ContinuousLinearMap.hilbertSchmidtNorm_comp_coisometry`, `ContinuousLinearMap.hilbertSchmidtEnergy_comp_coisometry`.
- **OI-C17 — Two-sided isometric conjugation.** Under the hypotheses of OI-C15 on `U` and of OI-C16
  on `V`, `‖UTV‖_HS = ‖T‖_HS`, and in energy form `E_b(UTV) = E_c(T)`.
  *In Tau Ceti:* `ContinuousLinearMap.hilbertSchmidtNorm_isometry_comp_coisometry`, `ContinuousLinearMap.hilbertSchmidtEnergy_isometry_comp_coisometry`.

*Needs:* §B2 (OI-B32, OI-B34, OI-B36).

**Checks.**
- The isometry `V : 𝕜 → 𝕜²`, `x ↦ (x, 0)`, has `V†(y₁, y₂) = y₁`, which does not preserve norms. For
  `T` the identity of `𝕜²`, `‖T‖_HS = √2` while `‖TV‖_HS = ‖V‖_HS = 1`: on the right the hypothesis
  must be on `V†`, and an isometry does not suffice.

### C3 Pythagoras along orthogonal families (OI-C18–OI-C20)

Families that split squared norms split the energy, with no countability or summability
hypotheses (Simon, *Trace Ideals*).

- **OI-C18 — Left Pythagoras.** For inner product spaces `E`, `F`, `G` over `ℝ` or `ℂ`, a Hilbert
  basis `b` of `E` and a bounded `T : E → F`, if bounded `Pⱼ : F → G` satisfy
  `∑' j, ‖Pⱼ v‖ₑ² = ‖v‖ₑ²` for every `v ∈ F`, then `∑' j, E_b(Pⱼ T) = E_b(T)`; no completeness or
  finite energy is needed. The orthogonal projections onto a subspace and onto its orthogonal
  complement form such a family.
  *In Tau Ceti:* `ContinuousLinearMap.tsum_hilbertSchmidtEnergy_comp_left`, `ContinuousLinearMap.hilbertSchmidtEnergy_starProjection_comp_add_orthogonal`.
- **OI-C19 — Right Pythagoras.** For `E`, `F` and `H` Hilbert spaces and a bounded `T : E → F`, if
  bounded `Qⱼ : H → E` satisfy `∑' j, ‖Qⱼ† v‖ₑ² = ‖v‖ₑ²` for every `v ∈ E`, then
  `∑' j, E_b'(T Qⱼ) = E_b(T)` for Hilbert bases `b` of `E` and `b'` of `H`; `H = E` is the case of
  endomorphisms of the source.
  *In Tau Ceti:* `ContinuousLinearMap.tsum_hilbertSchmidtEnergy_comp_right`.
- **OI-C20 — Joint Pythagoras.** Under the hypotheses of OI-C18 on the target and of OI-C19 on the
  source, `∑' j, ∑' i, E_b'(Pᵢ T Qⱼ) = E_b(T)`.
  *In Tau Ceti:* `ContinuousLinearMap.tsum_tsum_hilbertSchmidtEnergy_comp`.

*Needs:* §B2 (OI-B32, OI-B34).

**Checks.**
- For the coordinate projections `P₀`, `P₁` of `𝕜²` and `T` the identity, `‖P₀v‖² + ‖P₁v‖² = ‖v‖²`
  and `E(P₀) + E(P₁) = 1 + 1 = 2 = E(id)`.

### Examples

- The column model is identified with the basis-independent energy by OI-C03, OI-B35 and OI-C12,
  and its bounded representation map is OI-C09 to OI-C13.
- A rank-one operator `x ↦ ⟪u, x⟫ • v` has columns `⟪u, bᵢ⟫ • v` and energy
  `∑ |⟪u, bᵢ⟫|² ‖v‖² = ‖u‖² ‖v‖²`, in agreement with `a₀² = ‖u‖² ‖v‖²` and OI-B90.

### Dependencies

Part B, §B2: the energy, the Hilbert–Schmidt norm and the adjoint swap. Mathlib `lp`, `Memℓp` and
`HilbertBasis`.

## Downstream consumers

- [SNumbers](../../SNumbers/README.md) uses Part A, OI-A29, OI-A39 and OI-A49, and states its
  s-numbers with the approximation numbers `ContinuousLinearMap.singularValue`.
- [CompactGroups](../../RepresentationTheory/CompactGroups/README.md) uses Part C, the
  Hilbert–Schmidt column model OI-C01–OI-C14 and the compactness of Hilbert–Schmidt operators
  OI-C14, for the Hilbert–Schmidt route to the compactness of convolution operators.
- [VonNeumannAlgebras](../../VonNeumannAlgebras/README.md) uses the trace class and the
  Hilbert–Schmidt class, OI-B29–OI-B41.
- [NoncommutativeIntegration](../../NoncommutativeIntegration/README.md) uses Parts A and B, and
  identifies its `Lᵖ(B(H), Tr)` with the Schatten class `S_p`.
- [NoncommutativeGeometry](../../NoncommutativeGeometry/README.md) uses OI-A17, OI-A20, OI-A22,
  OI-A30 and OI-B29–OI-B30.
- [AutomorphicSpectralTheory](../../AutomorphicSpectralTheory/README.md) uses OI-B29–OI-B41, OI-B83,
  OI-B90 and OI-C01–OI-C14.
- [RandomMatrices](../../RandomMatrices/README.md) and
  [PainleveEquations](../../PainleveEquations/README.md) use OI-B01–OI-B19, OI-B23 and
  OI-B29–OI-B30, RandomMatrices also Part C.
- [IndexTheory](../../IndexTheory/README.md) uses OI-A25–OI-A30, and
  [BanachSpaceTheory](../../BanachSpaceTheory/README.md) uses OI-A01 and OI-B29–OI-B30.
- [SpectralManifolds](../../SpectralManifolds/README.md) uses Parts A and B.

## Provenance

This section is secondary and prescribes nothing. An Apache-2.0 implementation of nearly all of the
above exists in the AIQ DKPS formalization repository,
https://github.com/AIQ-Kitware/aiq-dkps-formalization, under `ForTauCeti/` (namespaces `TauCeti.*`
and `ContinuousLinearMap.*`), Copyright Kitware, Inc., with per-module provenance headers. The
elementary part of Part A was adapted in part from the Mathlib proposal for singular values cited
in the references and developed further for spectral perturbation theory; the source provenance,
authorship and licensing notices are recorded in the corresponding modules.

## Scope and ownership

**This roadmap owns** every item labelled `OI-…` above: the approximation numbers of bounded maps
between seminormed spaces with their calculus, their relation to rank and compactness, their
Hilbert-space invariances, min–max formulas, Ky Fan gauges and finite-dimensional identification
(Part A); operator-ideal families and their carriers, the operator-norm, Ky Fan, trace-class,
Hilbert–Schmidt and Schatten families, the Hilbert–Schmidt energy and norm, Minkowski's inequality
for `ℝ≥0∞`-valued sums, Ky Fan dominance, the finite-dimensional Schatten seminorms, symmetric
gauges with their extension and induced families, and orthogonal block sums with the generalized
decreasing merge (Part B); and the column model of the Hilbert–Schmidt class with its isometric
invariance and Pythagoras identities (Part C).

**Already in Mathlib.** The finite-dimensional singular values `LinearMap.singularValues`, which
OI-A49 and OI-A50 use, and the unit-ball form of the operator norm,
`ContinuousLinearMap.sSup_unitClosedBall_eq_norm`, which gives OI-A37.

**Owned elsewhere and consumed here.**

- *The bounded-operator modulus* `|T| = √(T†T)` belongs to PolarDecomposition (PD-A36) and is Tau
  Ceti's `ContinuousLinearMap.modulus`; §A3 uses it. Finite singular systems belong to
  PolarDecomposition, Part C.
- *Finite-dimensional Ky Fan sums, unitarily invariant seminorms and the operator-norm, nuclear and
  Frobenius seminorms* belong to Majorization (sections *Ky Fan sums*, *Rectangular seminorms and
  transport* and *Concrete rectangular seminorms*) and are Tau Ceti's `LinearMap.kyFanSum`,
  `TauCeti.UnitarilyInvariantSeminorm`, `TauCeti.UnitarilyInvariantSeminorm.opNorm`,
  `TauCeti.UnitarilyInvariantSeminorm.nuclear` and `TauCeti.UnitarilyInvariantSeminorm.frobenius`;
  §§A5 and B3 use them. The finite-dimensional Schatten seminorms of §B3 are this roadmap's,
  built on them.
- *The other s-number sequences on Banach spaces* (Gelfand, Kolmogorov, Bernstein, Hilbert and
  entropy numbers) belong to SNumbers, and the trace on the trace class to VonNeumannAlgebras.

## Exact supplier contracts

### From Mathlib

- `ContinuousLinearMap` with its operator norm and its forms `‖·‖₊` and `‖·‖ₑ`, and
  `ContinuousLinearMap.adjoint` between inner product spaces (`Mathlib/Analysis/InnerProductSpace/Adjoint.lean`).
- `LinearMap.rank` (`Mathlib/LinearAlgebra/Dimension/LinearMap.lean`), `Module.rank`,
  `Module.finrank` and `Cardinal`; `LinearMap.HasFiniteRange`
  (`Mathlib/Algebra/Module/LinearMap/FiniteRange.lean`).
- `LinearMap.singularValues`, the singular values of a linear map between finite-dimensional inner
  product spaces, nonincreasing with multiplicity, indexed from zero and zero from the dimension of
  the source on (`Mathlib/Analysis/InnerProductSpace/SingularValues.lean`).
- `IsCompactOperator` and `isCompactOperator_of_tendsto` (a norm limit of compact operators into a
  Banach space is compact) (`Mathlib/Analysis/Normed/Operator/Compact/Basic.lean`).
- `ContinuousLinearMap.sSup_unitClosedBall_eq_norm` (the operator norm is the supremum of `‖Tx‖`
  over the closed unit ball, `Mathlib/Analysis/Normed/Operator/NNNorm.lean`).
- `Submodule.starProjection` and `Submodule.HasOrthogonalProjection`, `Submodule.orthogonal`,
  `Submodule.subtypeL`, `OrthonormalBasis`, `Matrix.toLin`.
- `HilbertBasis`, `lp` with its inner product space structure at `p = 2`, `Memℓp`, `WithLp`.
- `tsum_comm`, `ENNReal.rpow`, `Finsupp.equivMapDomain`, `CFC.sqrt`.
- For the target of §B4: `RCLike.I_eq_zero_or_im_I_eq_one`, `RCLike.realRingEquiv` and
  `RCLike.realLinearIsometryEquiv` (`Mathlib/Analysis/RCLike/Basic.lean`),
  `RCLike.complexRingEquiv` and `RCLike.complexLinearIsometryEquiv`
  (`Mathlib/Analysis/Complex/Basic.lean`), and `ULift.normedSpace`
  (`Mathlib/Analysis/Normed/Module/Basic.lean`).

### From Tau Ceti

Paths are under `TauCeti/Analysis/`. Each declaration is assumed as stated there; the sections
above give its hypotheses. The declarations of the pinned Tau Ceti that realise this roadmap's own
items are named in the Parts above, at the end of each item; the roadmap consumes besides them:

- The bounded-operator modulus (`InnerProductSpace/Modulus.lean`): `ContinuousLinearMap.modulus`,
  PolarDecomposition PD-A36, for OI-A31.
- Ky Fan sums of finite-dimensional linear maps (`InnerProductSpace/KyFan.lean`):
  `LinearMap.kyFanSum`, Majorization section *Ky Fan sums*, for OI-A49.
- Unitarily invariant seminorms (`InnerProductSpace/UnitarilyInvariantSeminorm/Basic.lean`,
  `.../OpNorm.lean`, `.../KyFan.lean`, `.../Frobenius.lean`): `TauCeti.UnitarilyInvariantSeminorm`,
  `TauCeti.UnitarilyInvariantSeminorm.opNorm`, `TauCeti.UnitarilyInvariantSeminorm.nuclear`,
  `TauCeti.UnitarilyInvariantSeminorm.frobenius`, Majorization sections *Rectangular seminorms and
  transport* and *Concrete rectangular seminorms*, for §B3.
- Diagonal operators on `ℓᵖ` (`Normed/Lp/Diagonal/Basic.lean`): `lp.diagonalCLM`, for OI-A55,
  OI-A56 and the route to OI-B72.
- `ℓᵖ` block sums (`Normed/Lp/ProdLp.lean`): `ContinuousLinearMap.withLpProdMap`, the block sum of
  Convention 7, for §B6.
- Invariance of approximation numbers under linear isometric equivalences
  (`OperatorIdeal/ApproximationNumber/Isometry.lean`):
  `ContinuousLinearMap.singularValue_comp_linearIsometryEquiv`, for the route to OI-B72.
- Comparison of `ℓᵖ` sums in `ℝ≥0∞` (`MeanInequalities.lean`): `ENNReal.Lq_le_Lp_tsum`, for
  `0 < p ≤ q` the inequality `(∑' i, f i^q)^(1/q) ≤ (∑' i, f i^p)^(1/p)`, for OI-B87.

### From TauCetiRoadmap.PolarDecomposition

PD-A36, the modulus `|T| = √(T†T)` of a bounded operator between Hilbert spaces over `ℝ` or `ℂ`, as
Tau Ceti's `ContinuousLinearMap.modulus`; assumed as stated there.

### From TauCetiRoadmap.Majorization

Section *Ky Fan sums*: the Ky Fan sums of a linear map between finite-dimensional inner product
spaces (Tau Ceti `LinearMap.kyFanSum`). Section *Rectangular seminorms and transport*: rectangular
unitarily invariant seminorms (Tau Ceti `TauCeti.UnitarilyInvariantSeminorm`). Section *Concrete
rectangular seminorms*: the operator-norm, nuclear and Frobenius seminorms (Tau Ceti
`TauCeti.UnitarilyInvariantSeminorm.opNorm`, `TauCeti.UnitarilyInvariantSeminorm.nuclear`,
`TauCeti.UnitarilyInvariantSeminorm.frobenius`). Assumed as stated there.

## References

- A. Pietsch, *Operator Ideals*, North-Holland, 1980; *Eigenvalues and s-Numbers*, Cambridge
  Studies in Advanced Mathematics 13, Cambridge University Press, 1987.
- I. C. Gohberg and M. G. Kreĭn, *Introduction to the Theory of Linear Nonselfadjoint Operators in
  Hilbert Space*, Translations of Mathematical Monographs 18, AMS, 1969.
- B. Simon, *Trace Ideals and Their Applications*, 2nd ed., AMS, 2005; M. Reed and B. Simon,
  *Methods of Modern Mathematical Physics I: Functional Analysis*, Academic Press, 1980: the
  Hilbert–Schmidt class as `ℓ²` of columns.
- R. Bhatia, *Matrix Analysis*, GTM 169, Springer, 1997: Ky Fan inequalities and majorization.
- C. Eckart and G. Young, "The approximation of one matrix by another of lower rank",
  *Psychometrika* **1** (1936), 211–218.
- L. Mirsky, "Symmetric gauge functions and unitarily invariant norms", *Quart. J. Math.* **11**
  (1960), 50–59.
- R. A. Horn and C. R. Johnson, *Matrix Analysis*, 2nd ed., Cambridge University Press, 2013,
  Thm. 4.2.6.
- M. Ullrich, "Inequalities between s-numbers", *Adv. Oper. Theory* **9** (2024), art. 82;
  page numbers as in arXiv:2405.05509v2.
- The Mathlib proposal for singular values, `ContinuousLinearMap.singularValue : ℕ → ℝ≥0`, indexed
  from zero, https://github.com/leanprover-community/mathlib4/pull/32126, and the Lean Zulip thread
  "Singular Value Decomposition",
  https://leanprover-community.github.io/archive/stream/217875-Is-there-code-for-X%3F/topic/Singular.20Value.20Decomposition.html.
- AIQ DKPS formalization repository, Kitware, Inc., https://github.com/AIQ-Kitware/aiq-dkps-formalization.
