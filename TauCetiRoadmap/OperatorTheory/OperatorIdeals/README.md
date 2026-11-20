# Roadmap: operator ideals, approximation numbers and Hilbert–Schmidt operators

**Summary.** For a bounded linear map `T : E → F` between normed spaces, the `n`-th approximation
number `aₙ(T)` is the operator-norm distance from `T` to the bounded maps of rank at most `n`,
counted from zero, so that `a₀(T) = ‖T‖`. On finite-dimensional inner product spaces these are the
singular values. This roadmap develops their calculus and their Hilbert-space theory, builds from
them the Ky Fan, trace-class, Hilbert–Schmidt and Schatten ideals by one construction from
symmetric gauges on sequences, and describes the Hilbert–Schmidt operators by square-summable
columns. Statements about norms and rank hold over any nontrivially normed field; those using
inner products or adjoints are over `ℝ` or `ℂ`, and say which spaces must be complete.

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
unitarily invariant seminorms and the Frobenius seminorm from
[Majorization](../Majorization/README.md). Its approximation numbers are the ones
[SNumbers](../../SNumbers/README.md) compares with the other s-number sequences on Banach spaces;
its trace class and Hilbert–Schmidt class carry the trace of
[VonNeumannAlgebras](../../VonNeumannAlgebras/README.md) and are the cases `p = 1, 2` of the
noncommutative `Lᵖ` spaces of [NoncommutativeIntegration](../../NoncommutativeIntegration/README.md);
and the Peter–Weyl theorem of [CompactGroups](../../RepresentationTheory/CompactGroups/README.md)
uses that Hilbert–Schmidt operators are compact.

Layer 1 (Part A) treats the approximation numbers, Layer 2 (Part B) the operator-ideal families,
symmetric gauges and the Schatten scale, and Layer 3 (Part C) the column model of the
Hilbert–Schmidt class.

## How to read the build

The three layers are also called Parts A, B and C, and every item carries a label, `OI-A01` to
`OI-A56`, `OI-B01` to `OI-B94` and `OI-C01` to `OI-C20`, by which other roadmaps cite it; each
section heading below lists the labels it carries. Layer 1 defines the approximation numbers on
seminormed spaces and proves their calculus (§1.1), relates them to rank and compactness (§1.2),
proves their invariance under adjoints and moduli and the coercivity lower bounds (§1.3), the
min–max formulas (§1.4) and the Ky Fan inequalities with Eckart–Young (§1.5), and computes them for
identities, projections and diagonal operators (§1.6). Layer 2 sets up operator-ideal families
(§2.1), the operator-norm, Ky Fan, trace-class and Hilbert–Schmidt families (§2.2), Ky Fan dominance
and the finite-dimensional Schatten norms (§2.3), symmetric gauges and the families they induce
(§2.4), the Schatten scale (§2.5) and orthogonal block sums (§2.6). Layer 3 identifies the
Hilbert–Schmidt operators with `ℓ²` families of columns (§3.1) and proves isometric invariance
(§3.2) and Pythagoras identities (§3.3) for the Hilbert–Schmidt energy. Each section's *Needs:*
line lists its inputs, so that a statement proved by another route is not blocked behind an
unrelated section.

## Conventions

1. **Scalars and spaces.** Where a statement involves only norms and rank, `𝕜` is a nontrivially
   normed field and the spaces are seminormed spaces over it (Mathlib `SeminormedAddCommGroup` with
   `NormedSpace 𝕜`), in arbitrary and possibly different universes. Statements that use an inner
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
   `LinearMap.kyFanSum` (Majorization, MAJ-A26).
6. **Gauges and ideals.** Operator gauges take values in `ℝ≥0∞`, and the operators of finite gauge
   form the ideal. The four laws of an operator-ideal gauge `Φ` are subadditivity
   `Φ(S + T) ≤ Φ(S) + Φ(T)`, absolute homogeneity `Φ(cT) = ‖c‖ₑ Φ(T)` (with `0 · ∞ = 0`),
   domination of the operator norm `‖T‖ₑ ≤ Φ(T)`, and the two-sided ideal inequality
   `Φ(ATB) ≤ ‖A‖ₑ Φ(T) ‖B‖ₑ`.
7. **Adjoints and block sums.** `T†` is `ContinuousLinearMap.adjoint T`. The orthogonal block sum
   `T₁ ⊕ T₂` of `T₁ : E₁ → F₁` and `T₂ : E₂ → F₂` is Tau Ceti's
   `T₁.withLpProdMap 2 T₂ : WithLp 2 (E₁ × E₂) →L[𝕜] WithLp 2 (F₁ × F₂)`, acting blockwise;
   OI-B91–OI-B94 of §2.6 hold for the `ℓᵖ` block sum `T₁.withLpProdMap p T₂` with `1 ≤ p ≤ ∞` as
   well.
8. **Columns and energy.** For a Hilbert basis `b = (bᵢ)` of the source, indexed by a type `ι`
   (Mathlib `HilbertBasis ι 𝕜 E`), the *column family* of `T` is `i ↦ T bᵢ` and its *Hilbert–Schmidt
   energy* is `E_b(T) = ∑' i, ‖T bᵢ‖ₑ²` in `ℝ≥0∞`. A family `f = (fᵢ)` in `ℓ²(ι, F)` (Mathlib
   `lp (fun _ : ι => F) 2`) *represents* the operator `T_f x = ∑' i, ⟪bᵢ, x⟫ • fᵢ`.
9. **Sequences.** `ℕ →₀ ℝ≥0` is the type of finitely supported nonnegative sequences, `eₙ` is the
   sequence with a single `1` at `n`, and a permutation of `ℕ` acts on finitely supported sequences
   by Mathlib's `Finsupp.equivMapDomain`. Inequalities between sequences are termwise.
10. **Names.** Library declarations are named in code font by their full names. The one declaration
    of this roadmap's own is `symmetricGaugeFamily_injective` in `Suggested.lean` (§2.4), in the
    namespace `TauCetiRoadmap.OperatorIdeals`; the other target (§2.6) is described in prose.

## Layer 1: approximation numbers and Hilbert-space singular values

### 1.1 Approximation numbers and their calculus (OI-A01–OI-A22)

For a bounded map `T : E → F` between seminormed spaces over a nontrivially normed field, the
approximation numbers `aₙ(T)` of Convention 3 are `ContinuousLinearMap.singularValue` (OI-A01;
Pietsch, *Eigenvalues and s-Numbers*; Gohberg and Kreĭn). Two bounded maps `S : E → F` and
`T : G → H`, possibly between different pairs of spaces, *have the same approximation numbers*
when `aₙ(S) = aₙ(T)` for every `n`; this relation is `ContinuousLinearMap.SameSingularValues`
(OI-A02, unfolded by `ContinuousLinearMap.sameSingularValues_iff`), and it is reflexive (OI-A03,
`ContinuousLinearMap.sameSingularValues_refl`), symmetric (OI-A04,
`ContinuousLinearMap.sameSingularValues_symm`) and transitive (OI-A05,
`ContinuousLinearMap.sameSingularValues_trans`).
The Ky Fan gauge `Kₖ(T)` of Convention 5 is `ContinuousLinearMap.kyFanGauge`, in the same setting
(OI-A06). The calculus below holds in this generality (Pietsch, *Eigenvalues and s-Numbers*;
Ullrich 2024 for inequalities between s-numbers).

- *Infimum formula* (OI-A07). `aₙ(T)` is the greatest lower bound of the set of `‖T − R‖` over the
  bounded `R` with `rank R ≤ n` (`ContinuousLinearMap.isGLB_singularValue`).
- *Upper bound* (OI-A08). If `R` is bounded with `rank R ≤ n`, then `aₙ(T) ≤ ‖T − R‖`
  (`ContinuousLinearMap.singularValue_le_nnnorm_sub`).
- *Lower-bound characterization* (OI-A09). For `c ≥ 0`, `c ≤ aₙ(T)` exactly when `c ≤ ‖T − R‖` for
  every bounded `R` with `rank R ≤ n` (`ContinuousLinearMap.le_singularValue_iff`).
- *Best approximants* (OI-A10). If `rank R ≤ n` and `‖T − R‖ ≤ ‖T − R'‖` for every bounded `R'` with
  `rank R' ≤ n`, then `aₙ(T) = ‖T − R‖` (`ContinuousLinearMap.singularValue_eq_nnnorm_sub`).
- *Near-best approximants* (OI-A11). For every `ε > 0` there is a bounded `R` with `rank R ≤ n` and
  `‖T − R‖ < aₙ(T) + ε`; in the library's form, `aₙ(T) < c` gives such an `R` with `‖T − R‖ < c`
  (`ContinuousLinearMap.exists_rank_le_nnnorm_sub_lt`).
- *Norm, monotonicity, zero map* (OI-A12–OI-A15). `a₀(T) = ‖T‖` (OI-A12,
  `ContinuousLinearMap.singularValue_zero`); `n ↦ aₙ(T)` is antitone (OI-A13,
  `ContinuousLinearMap.antitone_singularValue`); `aₙ(T) ≤ ‖T‖` for every `n` (OI-A14,
  `ContinuousLinearMap.singularValue_le_nnnorm`), so that `supₙ aₙ(T) = ‖T‖`
  (`ContinuousLinearMap.iSup_singularValue`); and `aₙ(0) = 0` for every `n` (OI-A15,
  `ContinuousLinearMap.zero_singularValue`).
- *Perturbation* (OI-A16–OI-A19). `aₙ(S + T) ≤ aₙ(S) + ‖T‖` (OI-A16,
  `ContinuousLinearMap.singularValue_add_le`); `aₘ₊ₙ(S + T) ≤ aₘ(S) + aₙ(T)` (OI-A17,
  `ContinuousLinearMap.singularValue_add_index_le`); `|aₙ(S) − aₙ(T)| ≤ ‖S − T‖` (OI-A18,
  `ContinuousLinearMap.abs_singularValue_sub_singularValue_le`); hence, for each `n`, `T ↦ aₙ(T)`
  is `1`-Lipschitz and continuous in operator norm (OI-A19,
  `ContinuousLinearMap.lipschitzWith_singularValue`, `ContinuousLinearMap.continuous_singularValue`).
- *Ideal and scalar laws* (OI-A20–OI-A22). For composable bounded maps `A`, `T`, `B`,
  `aₙ(ATB) ≤ ‖A‖ aₙ(T) ‖B‖` (OI-A20, `ContinuousLinearMap.singularValue_comp_comp_le`, from the
  one-sided `ContinuousLinearMap.singularValue_comp_le_left` and
  `ContinuousLinearMap.singularValue_comp_le_right`); `aₙ(cT) = ‖c‖ aₙ(T)` for every scalar `c`
  (OI-A21, `ContinuousLinearMap.singularValue_smul`); and for composable `S`, `T`,
  `aₘ₊ₙ(ST) ≤ aₘ(S) aₙ(T)` (OI-A22, `ContinuousLinearMap.singularValue_comp_add_le_mul`).

*Needs:* Mathlib `ContinuousLinearMap` with its operator norm, `LinearMap.rank`; Tau Ceti
`ContinuousLinearMap.singularValue`, `ContinuousLinearMap.SameSingularValues`,
`ContinuousLinearMap.kyFanGauge` and the declarations named above.

**Checks.**
- For `T = diag(3, 1)` on `𝕜²` with the Euclidean norm, `a₀(T) = 3`, `a₁(T) = 1` and `aₙ(T) = 0`
  for `n ≥ 2`: the approximant `diag(3, 0)` is at distance `1`, and every `R` of rank at most `1`
  kills some unit vector `x`, so that `‖T − R‖ ≥ ‖Tx‖ ≥ 1`. Measuring the distance in the
  Frobenius norm instead would give `a₀(T) = √10`, and a one-based infimum over `rank R < n` would
  shift the sequence and give `3` at index `1`.
- For `S = diag(1, 0)` and `T = diag(0, 1)` on `𝕜²`, `S + T` is the identity and `a₁(S + T) = 1`,
  while `a₁(S) = a₁(T) = 0`: the same-index inequality `aₙ(S + T) ≤ aₙ(S) + aₙ(T)` fails, and the
  mixed-index form `a₁₊₀(S + T) ≤ a₁(S) + a₀(T) = 1` holds with equality.

### 1.2 Rank, approximability and compactness (OI-A23–OI-A29)

The vanishing of `aₙ(T)` encodes rank, and its decay encodes approximability by maps of finite
rank (Pietsch, *Eigenvalues and s-Numbers*; Gohberg and Kreĭn).

- *Vanishing from rank* (OI-A23). If `rank T ≤ n`, then `aₙ(T) = 0`
  (`ContinuousLinearMap.singularValue_eq_zero_of_rank_le`); in particular `aₙ(T) = 0` as soon as
  the source has rank at most `n` (`ContinuousLinearMap.singularValue_eq_zero_of_rank_domain_le`).
- *Rank characterization* (OI-A24). Over a complete nontrivially normed field and for normed
  spaces, `aₙ(T) = 0` exactly when `rank T ≤ n`
  (`ContinuousLinearMap.singularValue_eq_zero_iff_rank_le`). No finite dimension is assumed; the
  finite-dimensional normed spaces are a special case.
- *Finite-rank approximation* (OI-A25). On seminormed spaces, `aₙ(T) → 0` exactly when there are
  bounded `Rₙ` with `rank Rₙ ≤ n` and `‖T − Rₙ‖ → 0`
  (`ContinuousLinearMap.tendsto_singularValue_nhds_zero_iff`).
- *Finite rank implies compactness* (OI-A26). Over a locally compact (equivalently, proper)
  nontrivially normed field, a continuous linear map with finite-dimensional range is compact
  (`LinearMap.HasFiniteRange.isCompactOperator`, finite range being Mathlib's
  `LinearMap.HasFiniteRange`); the target may be any topological vector space.
- *Approximability implies compactness* (OI-A27). Over a locally compact nontrivially normed field,
  if `F` is complete and `aₙ(T) → 0`, then `T` is compact
  (`ContinuousLinearMap.isCompactOperator_of_tendsto_singularValue`).
- *Compactness implies approximability on an inner product target* (OI-A28). Over `ℝ` or `ℂ`, if
  `E` is a normed space, `F` an inner product space, not necessarily complete, and `T` compact,
  then `aₙ(T) → 0` (`IsCompactOperator.tendsto_singularValue`): composing `T` with the orthogonal
  projection onto the span of the centres of a finite `ε`-net of the image of the unit ball gives
  an approximant of finite rank within `ε`.
- *Compactness characterization* (OI-A29). If `F` is a Hilbert space, `T` is compact exactly when
  `aₙ(T) → 0` (`ContinuousLinearMap.isCompactOperator_iff_tendsto_singularValue`). Only OI-A27
  uses completeness of the target and only OI-A28 its inner product; the source keeps the
  hypotheses of §1.1.

*Needs:* §1.1; Mathlib `IsCompactOperator`, `isCompactOperator_of_tendsto`,
`LinearMap.HasFiniteRange`, `Submodule.starProjection`; Tau Ceti the declarations named above.

**Checks.**
- The identity of an infinite-dimensional Hilbert space has `aₙ = 1` for every `n` (§1.6, OI-A51),
  so it is not compact, as it should not be.
- The diagonal operator on `ℓ²(ℕ, 𝕜)` with coefficients `1/(n + 1)` has `aₙ = 1/(n + 1)` (§1.6,
  OI-A55), so it is compact by OI-A29, while `aₙ > 0` for every `n` gives `rank > n` for every `n`
  by OI-A24: the decay `aₙ → 0` does not force eventual vanishing, and a characterization of
  compactness by finite rank would be wrong.

### 1.3 Hilbert-space invariance and lower bounds (OI-A30–OI-A34)

Adjoints and moduli preserve the approximation numbers, and coercivity on a large subspace bounds
them from below (Pietsch, *Eigenvalues and s-Numbers*; Gohberg and Kreĭn).

- *Adjoint invariance* (OI-A30). Over `ℝ` or `ℂ`, for `T` between Hilbert spaces,
  `aₙ(T†) = aₙ(T)` for every `n` (`ContinuousLinearMap.singularValue_adjoint`): an approximant `R`
  of `T` gives the approximant `R†` of `T†`, of the same rank and at the same distance.
- *Modulus invariance* (OI-A31). For `T` between Hilbert spaces over `ℝ` or `ℂ`,
  `aₙ(|T|) = aₙ(T)` for every `n`, where `|T| = √(T†T)` is the modulus of PolarDecomposition
  (PD-A36), Tau Ceti's `ContinuousLinearMap.modulus` (`ContinuousLinearMap.singularValue_modulus`).
  More generally, two bounded maps from one space into Hilbert spaces with `‖Tx‖ = ‖Ax‖` for every
  `x` have the same approximation numbers (`ContinuousLinearMap.singularValue_eq_of_forall_norm_apply_eq`).
- *Coercive-subspace lower bound* (OI-A32). Over a nontrivially normed field, with `E` a normed
  space, if a subspace `V ≤ E` has rank greater than `n` and `c‖x‖ ≤ ‖Tx‖` for every `x ∈ V`,
  then `c ≤ aₙ(T)` (`ContinuousLinearMap.le_singularValue_of_lt_rank`).
- *Unit-vector form* (OI-A33). Over `ℝ` or `ℂ`, the same conclusion follows when `c ≤ ‖Tx‖` for
  every unit vector `x ∈ V` (`ContinuousLinearMap.le_singularValue_of_lt_rank_of_unit_norm`).
- *Independent-family form* (OI-A34). The same conclusion follows when `V` is the span of `n + 1`
  linearly independent vectors and `c‖x‖ ≤ ‖Tx‖` on `V`
  (`ContinuousLinearMap.le_singularValue_of_linearIndependent`).

*Needs:* §1.1; PolarDecomposition PD-A36 (Tau Ceti `ContinuousLinearMap.modulus`); Mathlib
`ContinuousLinearMap.adjoint`, `Module.rank`; Tau Ceti the declarations named above.

### 1.4 Min–max formulations (OI-A35–OI-A40)

Over `ℝ` or `ℂ`, with `E` an inner product space, the approximation numbers localize to orthogonal
complements of small subspaces and to finite restrictions (Horn and Johnson, *Matrix Analysis*,
for the matrix min–max principle; Gohberg and Kreĭn).

- *Orthogonal-tail formula* (OI-A35). If `E` is complete, `aₙ(T)` is the infimum, over subspaces
  `V ≤ E` with `rank V ≤ n`, of the operator norm of `T` restricted to `V⊥`
  (`ContinuousLinearMap.singularValue_eq_iInf_nnnorm_comp_orthogonal`). For each such `V` the
  inequality `aₙ(T) ≤ ‖T restricted to V⊥‖` holds without completeness
  (`ContinuousLinearMap.singularValue_le_nnnorm_comp_orthogonal`).
- *Dimension cutoff* (OI-A36). If the source has rank at most `n`, the value in OI-A35 is `0`: the
  candidate `V = E` has `V⊥ = 0`, and `aₙ(T) = 0` by
  `ContinuousLinearMap.singularValue_eq_zero_of_rank_domain_le`.
- *Closed-unit-ball form* (OI-A37). For each candidate `V`, the norm of `T` restricted to `V⊥` is the
  supremum of `‖Tx‖` over `x ∈ V⊥` with `‖x‖ ≤ 1`: Mathlib's
  `ContinuousLinearMap.sSup_unitClosedBall_eq_norm` applied to the restriction
  `T ∘L Vᗮ.subtypeL`.
- *Converse localization property* (OI-A38). A pair `(E, F)` has the *converse min–max
  localization property* when for every bounded `T : E → F`, every `n` and every `0 ≤ r < aₙ(T)`
  there are `s > r` and `n + 1` linearly independent vectors on whose span `s‖x‖ ≤ ‖Tx‖`. It is
  `TauCeti.HasMinMaxLowerBound 𝕜 E F`, defined over any nontrivially normed field and seminormed
  spaces (unfolded by `TauCeti.hasMinMaxLowerBound_iff`).
- *Converse localization* (OI-A39). Over `ℝ` or `ℂ`, if `E` is a Hilbert space and `F` an inner
  product space, the pair `(E, F)` has the property of OI-A38
  (`TauCeti.HasMinMaxLowerBound.of_completeSpace`). The input is the alternative
  `ContinuousLinearMap.exists_linearIndependent_or_exists_rank_le`: for `c ≥ 0`, either `T` is
  `c`-coercive on the span of `n + 1` linearly independent vectors, or `‖Tx‖ ≤ c‖x‖` on the
  orthogonal complement of a subspace of rank at most `n`.
- *Finite-restriction supremum* (OI-A40). On a pair with the property of OI-A38, `aₙ(T)` is the
  least upper bound of the constants `s` for which `T` is `s`-coercive on the span of some `n + 1`
  linearly independent vectors (`TauCeti.HasMinMaxLowerBound.isLUB_singularValue`); for a normed
  source, this least-upper-bound property characterizes the pairs with the property of OI-A38
  (`TauCeti.hasMinMaxLowerBound_iff_forall_isLUB`).

*Needs:* §§1.1, 1.3; Mathlib `Submodule.orthogonal`, `Submodule.subtypeL`,
`ContinuousLinearMap.sSup_unitClosedBall_eq_norm`; Tau Ceti the declarations named above.

**Checks.**
- For `T = diag(3, 1)` on `𝕜²` and `n = 1`, the candidate `V = span(e₀)` leaves `T` restricted to
  `span(e₁)`, of norm `1 = a₁(T)`, while `V = span(e₁)` leaves norm `3`. The formula takes the
  infimum over `V`; a supremum would give `3 = a₀(T)`.

### 1.5 Ky Fan gauges, Eckart–Young and perturbation (OI-A41–OI-A50)

Prefix sums of approximation numbers are the Ky Fan gauges; in finite dimension they are the Ky Fan
sums of singular values (Bhatia, *Matrix Analysis*; Eckart and Young 1936).

- *Elementary laws* (OI-A41–OI-A46). `K₁(T) = ‖T‖` (OI-A41, `ContinuousLinearMap.kyFanGauge_one`);
  `Kₖ(cT) = ‖c‖ Kₖ(T)` (OI-A42, `ContinuousLinearMap.kyFanGauge_smul`); for composable bounded maps,
  `Kₖ(ATB) ≤ ‖A‖ Kₖ(T) ‖B‖` (OI-A43, `ContinuousLinearMap.kyFanGauge_comp_comp_le`); over `ℝ` or `ℂ`
  and for `T` between Hilbert spaces, `Kₖ(T†) = Kₖ(T)` (OI-A44,
  `ContinuousLinearMap.kyFanGauge_adjoint`); for `k > 0`, `‖T‖ ≤ Kₖ(T)` (OI-A45,
  `ContinuousLinearMap.nnnorm_le_kyFanGauge`); and `Kₖ(T) ≤ k ‖T‖` (OI-A46,
  `ContinuousLinearMap.kyFanGauge_le_mul_nnnorm`). All but the adjoint law hold on seminormed
  spaces over any nontrivially normed field.
- *Pair-local triangle inequality* (OI-A47). Over `ℝ` or `ℂ`, for inner product spaces `E`, `F`
  whose pair has the property of OI-A38, `Kₖ(S + T) ≤ Kₖ(S) + Kₖ(T)` for all bounded
  `S, T : E → F` and every `k` (`TauCeti.HasMinMaxLowerBound.kyFanGauge_add_le`). The localization
  of OI-A38 reduces the inequality to finite-dimensional compressions
  (`TauCeti.HasMinMaxLowerBound.exists_singularValue_le_compression`), where Ky Fan's maximum
  principle `ContinuousLinearMap.norm_sum_inner_le_kyFanGauge` applies.
- *Ky Fan triangle inequality* (OI-A48). Over `ℝ` or `ℂ`, for bounded `S, T : E → F` with `E` a
  Hilbert space and `F` an inner product space, `Kₖ(S + T) ≤ Kₖ(S) + Kₖ(T)` for every `k`
  (`ContinuousLinearMap.kyFanGauge_add_le`).
- *Eckart–Young* (OI-A49). Between finite-dimensional inner product spaces, `aₙ(T) = σₙ(T)` for
  every `n`, including the zero tail from the dimension of the source on
  (`ContinuousLinearMap.singularValue_eq_linearMap_singularValues`); hence `Kₖ(T)` is the Ky Fan sum
  `σ₀(T) + ⋯ + σₖ₋₁(T)` (`ContinuousLinearMap.kyFanGauge_eq_kyFanSum`).
- *Weyl's perturbation bound* (OI-A50). For linear maps `A`, `B` between finite-dimensional inner
  product spaces, `|σₙ(A) − σₙ(B)| ≤ ‖A − B‖` for every `n`
  (`LinearMap.abs_singularValues_sub_singularValues_le`).

*Needs:* §§1.1, 1.3, 1.4; Majorization MAJ-A26 (Tau Ceti `LinearMap.kyFanSum`); Mathlib
`LinearMap.singularValues`; Tau Ceti the declarations named above.

**Checks.**
- With `S = diag(1, 0)` and `T = diag(0, 1)` on `𝕜²` as in §1.1, `K₁(S + T) = 1 ≤ 2` and
  `K₂(S + T) = 2 = K₂(S) + K₂(T)`: the Ky Fan sums are subadditive although `a₁` alone is not.
- For `T : 𝕜² → 𝕜³`, `(x, y) ↦ (x + y, 0, 0)`, `T†T` has eigenvalues `2` and `0`, so `σ(T) = (√2, 0)`
  and `a₀(T) = ‖T‖ = √2`, `a₁(T) = 0` (rank one). Reading the singular values off the diagonal of
  the matrix would give `1` and `0`, and contradict `a₀(T) = ‖T‖`.

### 1.6 Finite and diagonal models (OI-A51–OI-A56)

Identities, projections and diagonal maps exercise the indexing, the rank cutoff, the min–max
formula and the decay of the approximation numbers (Pietsch, *Eigenvalues and s-Numbers*).

- *Identity* (OI-A51). On a normed space `E` over a nontrivially normed field, of rank `r`, a
  possibly infinite cardinal, `aₙ(id) = 1` for `n < r` and `aₙ(id) = 0` for `n ≥ r`
  (`ContinuousLinearMap.singularValue_id`); for finite-dimensional `E`, `aₙ(id) = 1` below the
  dimension and `0` at and above it (`ContinuousLinearMap.singularValue_id_of_finiteDimensional`).
- *Projection* (OI-A52). Over `ℝ` or `ℂ`, the orthogonal projection onto a subspace `U` that has an
  orthogonal projection has `aₙ = 1` for `n < rank U` and `aₙ = 0` otherwise, so a projection of
  rank `r` has exactly `r` approximation numbers equal to `1`
  (`Submodule.singularValue_starProjection`); `U` may be infinite-dimensional.
- *Rectangular diagonal* (OI-A53). Let `E` and `F` have dimensions `m` and `n`, with orthonormal
  bases, and let `D : E → F` have matrix entries `d_k` at position `(k, k)` for `k < min(m, n)` and
  zeros elsewhere. If a permutation `σ` of the indices below `min(m, n)` lists the `|d_k|` in
  nonincreasing order, then `a_k(D) = |d_σ(k)|` for `k < min(m, n)` and `a_k(D) = 0` from `min(m, n)`
  on (`Matrix.singularValue_toLin_of_ite_val_eq`,
  `Matrix.singularValue_toLin_of_ite_val_eq_eq_zero_of_le`). The general form, for a map sending an
  orthonormal basis to pairwise orthogonal vectors, is
  `ContinuousLinearMap.singularValue_eq_of_pairwise_inner_eq_zero`.
- *Finite diagonal min–max* (OI-A54). For a diagonal map `D` on a finite-dimensional space with
  coefficients ordered by nonincreasing magnitude, the span `V` of the first `n` basis vectors in
  that order attains the infimum of OI-A35: `‖D restricted to V⊥‖ = aₙ(D)`
  (`OrthonormalBasis.nnnorm_toLin_diagonal_comp_orthogonal_spanIndices`), and `aₙ(D)` is the
  `(n + 1)`-st largest magnitude by OI-A53.
- *Infinite diagonal* (OI-A55). For a bounded coefficient sequence `d` whose magnitudes `|dₙ|`
  are nonincreasing, the diagonal operator on `ℓ²(ℕ, 𝕜)` (and on `ℓᵖ(ℕ, 𝕜)` for every
  `1 ≤ p ≤ ∞`) has `aₙ = |dₙ|`, which is `sup` of `|dₘ|` over `m ≥ n` (`lp.singularValue_diagonalCLM`
  for Tau Ceti's `lp.diagonalCLM`); every nonincreasing sequence in `ℝ≥0` arises this way
  (`lp.exists_singularValue_diagonalCLM_eq`).
- *Infinite diagonal decay* (OI-A56). If moreover `|dₙ| → 0`, then `aₙ → 0`
  (`lp.tendsto_singularValue_diagonalCLM`), and over `ℝ` or `ℂ` the operator is compact by OI-A29.

*Needs:* §§1.1–1.4; Tau Ceti `lp.diagonalCLM`; Mathlib `OrthonormalBasis`, `Matrix.toLin`; Tau Ceti
the declarations named above.

**Checks.**
- For `D : 𝕜³ → 𝕜²` with diagonal entries `d₀ = 1` and `d₁ = −2`, `a₀(D) = 2 = ‖D‖`, `a₁(D) = 1`
  and `aₙ(D) = 0` for `n ≥ 2`. Reading the entries in their given order would give `a₀ = 1 ≠ ‖D‖`,
  and dropping the absolute values would give a negative value.

### Examples

- The identity of `ℓ²(ℕ, 𝕜)` has `aₙ = 1` for every `n` (OI-A51 with `r = ℵ₀`), so it is not
  compact (OI-A29) and its Ky Fan gauges are `Kₖ = k`.
- The diagonal operator on `ℓ²(ℕ, 𝕜)` with coefficients `1/(n + 1)` has `aₙ = 1/(n + 1)` (OI-A55),
  is compact (OI-A56), has infinite rank (OI-A24), and its Ky Fan gauge `Kₖ` is the harmonic number
  `1 + 1/2 + ⋯ + 1/k`.
- A rank-one operator `x ↦ ⟪u, x⟫ • v` with `u, v ≠ 0` has `a₀ = ‖u‖ ‖v‖` (OI-A12) and `aₙ = 0`
  for `n ≥ 1` (OI-A23).
- The identity, projection, rectangular diagonal and diagonal min–max models of §1.6 are the
  acceptance examples of this layer.

### Dependencies

PolarDecomposition PD-A36, the bounded-operator modulus, for §1.3. Majorization MAJ-A26, the Ky Fan
sums of a finite-dimensional linear map, for §1.5. Mathlib bounded linear maps, rank, adjoints,
orthogonal projections, compact operators and `LinearMap.singularValues`. Tau Ceti the
approximation numbers and the declarations named in §§1.1–1.6.

## Layer 2: symmetric operator ideals and Schatten norms

### 2.1 The ideal-family interface (OI-B01–OI-B19)

Over `𝕜` with `RCLike 𝕜`, an *operator-ideal family* assigns to every pair of Hilbert spaces `E`
in a universe `v` and `F` in a universe `w` a gauge `Φ : (E →L[𝕜] F) → ℝ≥0∞` with the four laws of
Convention 6; the ideal inequality is required for `L : F → G`, `A : E → F` and `R : H → E` with
`E`, `H` in universe `v` and `F`, `G` in universe `w`. It is `TauCeti.OperatorIdealFamily 𝕜`
(OI-B01; Pietsch, *Operator Ideals*). A *symmetric* family is a family on one universe
(`v = w`) whose gauge satisfies `Φ(T†) = Φ(T)` for every `T` between Hilbert spaces of that
universe: `TauCeti.SymmetricOperatorIdealFamily 𝕜` (OI-B02). A family restricts on each pair to an
*operator gauge*, a gauge with the first three laws, `TauCeti.OperatorGauge 𝕜 E F`
(`TauCeti.OperatorIdealFamily.operatorGauge`).

- *Finite-gauge ideal* (OI-B03, OI-B13, OI-B14). The operators of finite gauge form a submodule of
  `E →L[𝕜] F`, `TauCeti.OperatorGauge.finiteSubmodule`, with `T` in it exactly when `Φ(T) < ∞`
  (`TauCeti.OperatorGauge.mem_finiteSubmodule`); closure under addition and under scalar
  multiplication is the submodule property.
- *Carrier* (OI-B04, OI-B16, OI-B17). The type `TauCeti.OperatorGauge.Carrier` of finite-gauge
  operators, for a normed target, is a normed space with `‖T‖ = Φ(T).toReal`
  (`TauCeti.OperatorGauge.Carrier.norm_def`), and the passage to the real norm loses nothing:
  `ENNReal.ofReal ‖T‖ = Φ(T)` (`TauCeti.OperatorGauge.Carrier.ofReal_norm_eq_gauge`). It is a type
  separate from the subtype of the submodule, which carries the operator norm.
- *Consequences of the laws* (OI-B05–OI-B11). Every family has `Φ(0) = 0` (OI-B05,
  `TauCeti.OperatorIdealFamily.gauge_zero`); `Φ(T) = 0` only for `T = 0` (OI-B06,
  `TauCeti.OperatorIdealFamily.gauge_eq_zero_iff`); `Φ(−T) = Φ(T)` (OI-B07,
  `TauCeti.OperatorIdealFamily.gauge_neg`); the gauge of a finite sum is at most the sum of the
  gauges (OI-B08, `TauCeti.OperatorIdealFamily.gauge_sum_le`); `Φ(AT) ≤ ‖A‖ₑ Φ(T)` (OI-B09,
  `TauCeti.OperatorIdealFamily.gauge_comp_left_le`) and `Φ(TB) ≤ Φ(T) ‖B‖ₑ` (OI-B10,
  `TauCeti.OperatorIdealFamily.gauge_comp_right_le`); and composition on either side with a map of
  norm at most `1` does not increase the gauge (OI-B11,
  `TauCeti.OperatorIdealFamily.gauge_comp_left_le_self`,
  `TauCeti.OperatorIdealFamily.gauge_comp_right_le_self`).
- *Extensionality* (OI-B12). Two families are equal when their gauges agree on every pair and every
  operator (`TauCeti.OperatorIdealFamily.ext`; for symmetric families
  `TauCeti.SymmetricOperatorIdealFamily.ext`).
- *Outer composition* (OI-B15). A finite-gauge operator stays of finite gauge after bounded
  composition on either side (`TauCeti.OperatorIdealFamily.comp_left_mem_finiteSubmodule`,
  `TauCeti.OperatorIdealFamily.comp_right_mem_finiteSubmodule`).
- *Contractive inclusion* (OI-B18). The inclusion of the carrier into the bounded operators is a
  bounded linear map of norm at most `1` (`TauCeti.OperatorGauge.Carrier.toContinuousLinearMapL`,
  `TauCeti.OperatorGauge.Carrier.norm_toContinuousLinearMapL_le`).
- *Completeness* (OI-B19). A family is *complete* when the carrier of every pair is a Banach space:
  `TauCeti.OperatorIdealFamily.IsComplete`. A family whose gauges are lower semicontinuous in the
  operator-norm topology is complete (`TauCeti.OperatorIdealFamily.isComplete_of_lowerSemicontinuous`;
  for one pair with a complete target and a lower semicontinuous gauge,
  `TauCeti.OperatorGauge.completeSpace_carrier_of_lowerSemicontinuous`).

*Needs:* Mathlib `ContinuousLinearMap.adjoint`, `Submodule`, `ENNReal`; Tau Ceti the declarations
named above.

### 2.2 Concrete families and Hilbert–Schmidt energy (OI-B20–OI-B23, OI-B25–OI-B41)

The operator-norm, Ky Fan, trace-class and Hilbert–Schmidt families instantiate §2.1; the
Hilbert–Schmidt gauge comes from the energy of the columns (Pietsch, *Operator Ideals*; Simon,
*Trace Ideals*; Reed and Simon I, for the Hilbert–Schmidt class).

- *Operator-norm family* (OI-B25, OI-B26, OI-B20). The family with gauge `‖T‖ₑ` is
  `TauCeti.OperatorIdealFamily.opNorm` (`TauCeti.OperatorIdealFamily.gauge_opNorm`); its ideal is
  every bounded operator (`TauCeti.OperatorIdealFamily.finiteSubmodule_opNorm`) and it is complete
  (`TauCeti.OperatorIdealFamily.opNorm_isComplete`). Its symmetric form is
  `TauCeti.SymmetricOperatorIdealFamily.opNorm`.
- *Ky Fan families* (OI-B27, OI-B28, OI-B21). For `k > 0` the family with gauge `Kₖ(T)` is
  `TauCeti.OperatorIdealFamily.kyFan` (`TauCeti.OperatorIdealFamily.gauge_kyFan`); `k > 0` gives
  domination of the norm and OI-A48 gives subadditivity. Its ideal is every bounded operator
  (`TauCeti.OperatorIdealFamily.finiteSubmodule_kyFan`), it is complete
  (`TauCeti.OperatorIdealFamily.kyFan_isComplete`), and for `k = 1` it is the operator-norm family
  (`TauCeti.OperatorIdealFamily.kyFan_one`).
- *Nuclear gauge* (OI-B29). `ν(T) = ∑' n, aₙ(T)` in `ℝ≥0∞` is `ContinuousLinearMap.nuclearENorm`,
  on seminormed spaces; it is the supremum of the Ky Fan gauges
  (`ContinuousLinearMap.nuclearENorm_eq_iSup_kyFanGauge`), finite exactly when `(aₙ(T))` is summable
  (`ContinuousLinearMap.nuclearENorm_ne_top_iff_summable`), subadditive for operators from a
  Hilbert space into an inner product space (`ContinuousLinearMap.nuclearENorm_add_le`) and
  invariant under adjoints between Hilbert spaces (`ContinuousLinearMap.nuclearENorm_adjoint`).
- *Trace-class family* (OI-B30, OI-B23). The family with gauge `ν` is
  `TauCeti.OperatorIdealFamily.traceClass` (`TauCeti.OperatorIdealFamily.gauge_traceClass`); its
  ideal is the operators with summable approximation numbers
  (`TauCeti.OperatorIdealFamily.mem_finiteSubmodule_traceClass_iff`), and it is complete
  (`TauCeti.OperatorIdealFamily.traceClass_isComplete`). Its symmetric form is
  `TauCeti.SymmetricOperatorIdealFamily.traceClass`.
- *A bounded operator outside the trace class* (OI-B31). The identity of an infinite-dimensional
  Banach space over `ℝ` or `ℂ`, in particular of an infinite-dimensional Hilbert space, has
  `ν(id) = ∞` (`ContinuousLinearMap.nuclearENorm_id_eq_top`).
- *Hilbert–Schmidt energy* (OI-B32). For `T` between inner product spaces and a Hilbert basis `b`
  of the source, `E_b(T) = ∑' i, ‖T bᵢ‖ₑ²` in `ℝ≥0∞` is `ContinuousLinearMap.hilbertSchmidtEnergy`.
- *Parseval expansion* (OI-B33). For a Hilbert basis `c` of the target,
  `E_b(T) = ∑' i, ∑' j, ‖⟪cⱼ, T bᵢ⟫‖ₑ²` (`ContinuousLinearMap.hilbertSchmidtEnergy_eq_tsum_tsum`).
- *Adjoint swap* (OI-B34). For `T` between Hilbert spaces and Hilbert bases `b` of the source and
  `c` of the target, `E_c(T†) = E_b(T)` (`ContinuousLinearMap.hilbertSchmidtEnergy_adjoint`): both
  are the double sum of OI-B33, and the exchange of the two `ℝ≥0∞`-valued sums (Mathlib
  `ENNReal.tsum_comm`) is the whole content.
- *Basis independence* (OI-B35). For `T` between Hilbert spaces, `E_b(T)` does not depend on the
  Hilbert basis `b` of the source (`ContinuousLinearMap.hilbertSchmidtEnergy_indep`).
- *Hilbert–Schmidt norm* (OI-B36). For `T` between Hilbert spaces, `‖T‖_HS = √(E_b(T))` on
  operators of finite energy. Tau Ceti's `ContinuousLinearMap.hilbertSchmidtNorm` is defined for
  every `T` as `√(E_b(T).toReal)`, which is `0` when the energy is infinite; it may be computed in
  any Hilbert basis (`ContinuousLinearMap.hilbertSchmidtNorm_eq_sqrt`), and for finite energy its
  square recovers the energy (`ContinuousLinearMap.ofReal_sq_hilbertSchmidtNorm`). The statements
  below about `‖T‖_HS` assume finite energy where they need it.
- *Minkowski for unconditional `ℝ≥0∞` sums* (OI-B37). For any index type `ι`, functions
  `a, b : ι → ℝ≥0∞` and a real exponent `p ≥ 1`,
  `(∑' i, (a i + b i)^p)^(1/p) ≤ (∑' i, (a i)^p)^(1/p) + (∑' i, (b i)^p)^(1/p)`, with every power
  `ENNReal.rpow` and no summability hypothesis, infinite sums and infinite terms allowed
  (`ENNReal.Lp_add_le_tsum`); the exponent is finite, the supremum norm being the case `p = ∞` of
  §2.5. With `p = 2` it gives the triangle inequality `E_b(S + T)^(1/2) ≤ E_b(S)^(1/2) + E_b(T)^(1/2)`
  (`ContinuousLinearMap.rpow_hilbertSchmidtEnergy_add_le`).
- *Domination* (OI-B38). For `T` between Hilbert spaces with `E_b(T) < ∞`, `‖T‖ ≤ ‖T‖_HS`
  (`ContinuousLinearMap.norm_le_hilbertSchmidtNorm`); in energy form, `‖T‖ₑ² ≤ E_b(T)` for every `T`
  (`ContinuousLinearMap.enorm_sq_le_hilbertSchmidtEnergy`).
- *Adjoint invariance* (OI-B39). `‖T†‖_HS = ‖T‖_HS` for `T` between Hilbert spaces
  (`ContinuousLinearMap.hilbertSchmidtNorm_adjoint`).
- *Ideal inequality* (OI-B40). For `T` between Hilbert spaces with finite energy and bounded `A`,
  `B`, `‖ATB‖_HS ≤ ‖A‖ ‖T‖_HS ‖B‖` (`ContinuousLinearMap.hilbertSchmidtNorm_comp_comp_le`); in
  energy form, `E_b(ATB) ≤ ‖A‖ₑ² E_c(T) ‖B‖ₑ²` for every `T`, with `b` and `c` Hilbert bases of the
  sources of `B` and `T` (`ContinuousLinearMap.hilbertSchmidtEnergy_comp_comp_le`).
- *Hilbert–Schmidt family* (OI-B41, OI-B22). The family with gauge `E_b(T)^(1/2)`, computed in any
  Hilbert basis of the source, is `TauCeti.OperatorIdealFamily.hilbertSchmidt`
  (`TauCeti.OperatorIdealFamily.gauge_hilbertSchmidt`); its ideal is the operators of finite energy
  (`TauCeti.OperatorIdealFamily.mem_finiteSubmodule_hilbertSchmidt_iff`), the real value of its
  gauge is `‖T‖_HS` (`TauCeti.OperatorIdealFamily.toReal_gauge_hilbertSchmidt`), and it is complete
  (`TauCeti.OperatorIdealFamily.hilbertSchmidt_isComplete`). Its symmetric form is
  `TauCeti.SymmetricOperatorIdealFamily.hilbertSchmidt`.

*Needs:* §2.1; §1.1 and OI-A48; Mathlib `HilbertBasis`, `ENNReal.tsum_comm`, `ENNReal.rpow`; Tau
Ceti the declarations named above.

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

### 2.3 Ky Fan dominance and finite-dimensional Schatten norms (OI-B42–OI-B52, OI-B54–OI-B55)

Ky Fan dominance turns the comparison of prefix sums into the comparison of gauges; the
finite-dimensional Schatten norms are the singular-value models (Mirsky 1960; Bhatia, *Matrix
Analysis*).

- *Ky Fan dominance* (OI-B42). A family `Φ` is *Ky Fan dominant* when `Kₖ(A) ≤ Kₖ(B)` for every `k`
  implies `Φ(A) ≤ Φ(B)`, for `A : E → F` and `B : G → H` on possibly different pairs of Hilbert
  spaces (sources in universe `v`, targets in universe `w`):
  `TauCeti.OperatorIdealFamily.IsKyFanDominant`. Requiring it across pairs makes operators with the
  same approximation numbers have the same gauge (`TauCeti.OperatorIdealFamily.gauge_eq_of_sameSingularValues`),
  and a Ky Fan dominant family on one universe is invariant under adjoints
  (`TauCeti.OperatorIdealFamily.gauge_adjoint`).
- *Membership transport* (OI-B43). For a Ky Fan dominant family, if `B` lies in its ideal and
  `Kₖ(A) ≤ Kₖ(B)` for every `k`, then `A` lies in its ideal
  (`TauCeti.OperatorIdealFamily.mem_finiteSubmodule_of_forall_kyFanGauge_le`).
- *Dominant families* (OI-B44–OI-B46). The operator-norm family, since `‖A‖ = K₁(A)` (OI-B44,
  `TauCeti.OperatorIdealFamily.isKyFanDominant_opNorm`), every Ky Fan family (OI-B45,
  `TauCeti.OperatorIdealFamily.isKyFanDominant_kyFan`) and the trace-class family, since
  `ν = supₖ Kₖ` (OI-B46, `TauCeti.OperatorIdealFamily.isKyFanDominant_traceClass`), are Ky Fan
  dominant.
- *Finite-dimensional Schatten norm* (OI-B47). For finite-dimensional inner product spaces `E`, `F`
  over `ℝ` or `ℂ` and real `p ≥ 1`, `‖T‖_p = (∑_{i < dim E} σᵢ(T)^p)^(1/p)` defines a unitarily
  invariant seminorm on linear maps `E → F` in the sense of Majorization (MAJ-B01, Tau Ceti's
  `TauCeti.UnitarilyInvariantSeminorm`). It is `TauCeti.UnitarilyInvariantSeminorm.schatten 𝕜 E F p`,
  for `p : ℝ≥0∞` with `1 ≤ p`, with the formula for finite `p`
  (`TauCeti.UnitarilyInvariantSeminorm.schatten_apply_of_ne_top`) and the operator norm at `p = ∞`
  (`TauCeti.UnitarilyInvariantSeminorm.schatten_top`).
- *Laws* (OI-B48–OI-B51). `‖·‖_p` is subadditive, being a seminorm (OI-B48); it vanishes only at `0`
  (`TauCeti.UnitarilyInvariantSeminorm.schatten_apply_eq_zero_iff`, OI-B49); `‖T†‖_p = ‖T‖_p`
  (`TauCeti.UnitarilyInvariantSeminorm.schatten_apply_adjoint`, OI-B50); and (OI-B51) if
  `‖Cy‖ ≤ c‖y‖` for every `y` then `‖CA‖_p ≤ c ‖A‖_p`
  (`TauCeti.UnitarilyInvariantSeminorm.schatten_comp_le_left`), if `c ≥ 0` and `‖Cx‖ ≤ c‖x‖` for
  every `x` then `‖AC‖_p ≤ c ‖A‖_p` (`TauCeti.UnitarilyInvariantSeminorm.schatten_comp_le_right`),
  and the two combine (`TauCeti.UnitarilyInvariantSeminorm.schatten_comp_comp_le`); the factors may
  change the source and target spaces.
- *Nuclear endpoint* (OI-B52). At `p = 1`, `‖T‖₁ = ∑ᵢ σᵢ(T)` is the nuclear seminorm
  (`TauCeti.UnitarilyInvariantSeminorm.schatten_one`, for `TauCeti.UnitarilyInvariantSeminorm.nuclear`).
- *Frobenius endpoint* (OI-B54). At `p = 2`, `‖T‖₂` is the Frobenius seminorm of Majorization
  (MAJ-B31, Tau Ceti's `TauCeti.UnitarilyInvariantSeminorm.frobenius`)
  (`TauCeti.UnitarilyInvariantSeminorm.schatten_two`).
- *Finite-dimensional energy identity* (OI-B55). For a finite-dimensional source,
  `E_b(T) = ENNReal.ofReal (‖T‖_F²)` (`ContinuousLinearMap.hilbertSchmidtEnergy_eq_ofReal_sq_frobenius`).

*Needs:* §§2.1, 2.2; §1.5 (OI-A49); Majorization MAJ-B01 and MAJ-B31 (Tau Ceti
`TauCeti.UnitarilyInvariantSeminorm`, `TauCeti.UnitarilyInvariantSeminorm.frobenius`); Mathlib
`LinearMap.singularValues`; Tau Ceti the declarations named above.

**Checks.**
- For `T = diag(3, 4)` on `𝕜²`, `σ(T) = (4, 3)`, so `‖T‖₁ = 7`, `‖T‖₂ = 5`, which is the Frobenius
  value `√(9 + 16)`, and `‖T‖_∞ = 4 = ‖T‖`; the values decrease in `p`.

### 2.4 Symmetric gauges and induced families (OI-B56–OI-B73)

A symmetric gauge on finitely supported sequences extends by a supremum over dominated finitely
supported sequences; applied to the approximation numbers it gives an operator-ideal family
(Gohberg and Kreĭn, symmetric norming functions; Mirsky 1960).

- *Symmetric gauge* (OI-B56). A *symmetric gauge* is a function `Φ : (ℕ →₀ ℝ≥0) → ℝ≥0` that is
  subadditive, positively homogeneous (`Φ(c a) = c Φ(a)` for `c ∈ ℝ≥0`), invariant under every
  permutation of `ℕ`, monotone, and normalized by `Φ(e₀) = 1`: `TauCeti.SymmetricGauge`. Then
  `Φ(c eₙ) = c` for every `n` (`TauCeti.SymmetricGauge.map_single`).
- *Two-sided bound* (OI-B57, OI-B58). `supₙ aₙ ≤ Φ(a) ≤ ∑ₙ aₙ` for every `a : ℕ →₀ ℝ≥0`
  (`TauCeti.SymmetricGauge.iSup_le_apply`, `TauCeti.SymmetricGauge.apply_le_sum`).
- *Extension* (OI-B59). For `a : ℕ → ℝ≥0∞`,
  `Φ∞(a) = sup {Φ(b) : b : ℕ →₀ ℝ≥0, (b n : ℝ≥0∞) ≤ a n for all n}` in `ℝ≥0∞`
  (`TauCeti.SymmetricGauge.extend`). It is a supremum rather than a sum so that it is defined for
  every sequence and equals `∞` off the ideal. It agrees with `Φ` on finitely supported sequences
  (`TauCeti.SymmetricGauge.extend_coe`), is invariant under permutations
  (`TauCeti.SymmetricGauge.extend_comp_perm`), and lies between the supremum and the sum of the
  sequence (`TauCeti.SymmetricGauge.iSup_le_extend`, `TauCeti.SymmetricGauge.extend_le_tsum`).
- *Truncation formula* (OI-B60). For finite-valued `a : ℕ → ℝ≥0`, let `a<N` agree with `a` on
  `{0, …, N − 1}` and vanish elsewhere; then `Φ∞(a)` is the supremum over `N` of `Φ(a<N)`, with no
  antitonicity hypothesis (`TauCeti.SymmetricGauge.extend_coe_eq_iSup_indicator`).
- *Laws of the extension* (OI-B61–OI-B63). If `a ≤ b` then `Φ∞(a) ≤ Φ∞(b)` (OI-B61,
  `TauCeti.SymmetricGauge.extend_mono`); `Φ∞(c a) = c Φ∞(a)` for every `c ∈ ℝ≥0∞`, in particular
  for real `c ≥ 0` (OI-B62, `TauCeti.SymmetricGauge.extend_smul`); and `Φ∞(a + b) ≤ Φ∞(a) + Φ∞(b)`
  (OI-B63, `TauCeti.SymmetricGauge.extend_add_le`).
- *Induced family* (OI-B64, OI-B65). Over `ℝ` or `ℂ`, the rectangular family induced by `Φ` has
  gauge `T ↦ Φ∞(n ↦ aₙ(T))`: `TauCeti.SymmetricGauge.operatorIdealFamily`, whose gauge is
  `TauCeti.SymmetricGauge.opGauge` (`TauCeti.SymmetricGauge.operatorIdealFamily_gauge`,
  `TauCeti.SymmetricGauge.opGauge_def`).
- *Its four laws* (OI-B66–OI-B69). The induced gauge is subadditive for operators from a Hilbert
  space into an inner product space (OI-B66, `TauCeti.SymmetricGauge.opGauge_add_le`, from OI-A48
  and the weak-majorization transfer `TauCeti.SymmetricGauge.extend_le_extend_of_forall_sum_le`);
  absolutely homogeneous (OI-B67, `TauCeti.SymmetricGauge.opGauge_smul`); at least the operator
  norm (OI-B68, `TauCeti.SymmetricGauge.enorm_le_opGauge`); and satisfies the two-sided ideal
  inequality (OI-B69, `TauCeti.SymmetricGauge.opGauge_comp_comp_le`). The last three hold on
  seminormed spaces over any nontrivially normed field.
- *Adjoint invariance across universes* (OI-B70). For `T : E → F` between Hilbert spaces in
  possibly different universes, the induced gauge of `T† : F → E` equals that of `T`
  (`TauCeti.SymmetricGauge.opGauge_adjoint`).
- *Symmetric view* (OI-B71). On one universe the induced family is a symmetric family,
  `TauCeti.SymmetricGauge.symmetricOperatorIdealFamily`.
- *Faithfulness* (OI-B72). If two symmetric gauges `Φ` and `Ψ` induce the same family over `𝕜`,
  then `Φ∞(a) = Ψ∞(a)` for every antitone `a : ℕ → ℝ≥0∞`. For `𝕜` and the spaces of the families
  in the lowest universe this is `TauCeti.SymmetricGauge.extend_eq_of_operatorIdealFamily_eq`.
  **Target:** prove it for `𝕜` in an arbitrary universe `u` and families over sources in an
  arbitrary universe `v` and targets in an arbitrary universe `w`, `symmetricGaugeFamily_injective`.
  A route: if `a 0 = ∞` both sides are `∞` by OI-B59; otherwise `a` is the approximation-number
  sequence of a diagonal operator on `ℓ²(ℕ, 𝕜)` (OI-A55), carried by
  linear isometric equivalences to a Hilbert space over `𝕜` in universe `v` and one in universe
  `w`, under which approximation numbers do not change
  (`ContinuousLinearMap.singularValue_comp_linearIsometryEquiv`). *Needs:* OI-A55, OI-B59, OI-B65;
  Tau Ceti `lp.exists_singularValue_diagonalCLM_eq`,
  `ContinuousLinearMap.singularValue_comp_linearIsometryEquiv`.
- *Membership by approximation numbers* (OI-B73). Operators with the same approximation numbers,
  possibly on different pairs of spaces, have the same induced gauge
  (`TauCeti.SymmetricGauge.opGauge_eq_of_sameSingularValues`), hence the same membership in every
  induced family.

*Needs:* §§1.1, 1.3, 1.5 (OI-A48), 2.1; Tau Ceti
`TauCeti.SymmetricGauge.extend_le_extend_of_forall_sum_le` and the declarations named above.

**Checks.**
- The constant sequence `1` has `Φ∞ = 1` for the supremum gauge of §2.5 and `Φ∞ = ∞` for every
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

### 2.5 Ky Fan transfer and the Schatten scale (OI-B24, OI-B74–OI-B88, OI-B90)

Weak majorization transfers prefix-sum comparisons to every symmetric gauge, and the `ℓᵖ` gauges
produce the Schatten scale with its endpoints (Bhatia, *Matrix Analysis*; Simon, *Trace Ideals*).

- *Weak-majorization transfer* (OI-B74). For `a, b : ℕ → ℝ≥0∞` with `a` antitone, if
  `∑_{n<k} aₙ ≤ ∑_{n<k} bₙ` for every `k`, then `Φ∞(a) ≤ Φ∞(b)`
  (`TauCeti.SymmetricGauge.extend_le_extend_of_forall_sum_le`; the finitely supported form is
  `TauCeti.SymmetricGauge.apply_le_apply_of_forall_sum_le`). Only `a` need be antitone.
- *Ky Fan dominance of induced families* (OI-B75). Every induced family is Ky Fan dominant
  (`TauCeti.SymmetricGauge.isKyFanDominant_operatorIdealFamily`); on seminormed spaces,
  `Kₖ(S) ≤ Kₖ(T)` for every `k` gives `Φ(S) ≤ Φ(T)`
  (`TauCeti.SymmetricGauge.opGauge_le_of_forall_kyFanGauge_le`).
- *`ℓᵖ` gauges* (OI-B76, OI-B77). For real `p ≥ 1`, `Φ_p(a) = (∑ₙ aₙ^p)^(1/p)` is a symmetric gauge,
  `TauCeti.SymmetricGauge.lpGauge p hp` (`TauCeti.SymmetricGauge.lpGauge_apply`); its five laws are
  the fields of the structure.
- *Schatten families* (OI-B78, OI-B24). For real `p ≥ 1`, `TauCeti.OperatorIdealFamily.schatten 𝕜 p hp`
  is the family induced by `Φ_p` (`TauCeti.OperatorIdealFamily.schatten_def`), with gauge
  `(∑' n, aₙ(T)^p)^(1/p)` in `ℝ≥0∞` (`TauCeti.OperatorIdealFamily.gauge_schatten`), ideal the
  operators with `∑ aₙ(T)^p < ∞` (`TauCeti.OperatorIdealFamily.mem_finiteSubmodule_schatten_iff`),
  and complete (`TauCeti.OperatorIdealFamily.schatten_isComplete`); its gauge is lower
  semicontinuous in the operator-norm topology
  (`TauCeti.OperatorIdealFamily.lowerSemicontinuous_gauge_schatten`).
- *Symmetric Schatten families* (OI-B79). `TauCeti.SymmetricOperatorIdealFamily.schatten`.
- *The endpoint `p = ∞`* (OI-B80–OI-B82, OI-B85). The family with gauge `‖T‖` is the operator-norm
  family `TauCeti.OperatorIdealFamily.opNorm` of §2.2; it is the family induced by the supremum
  gauge `TauCeti.SymmetricGauge.supGauge` (`TauCeti.SymmetricGauge.operatorIdealFamily_supGauge`),
  whose extension is the supremum of the sequence (`TauCeti.SymmetricGauge.extend_supGauge`), so its
  gauge is `supₙ aₙ(T) = ‖T‖` (`TauCeti.SymmetricGauge.opGauge_supGauge`,
  `ContinuousLinearMap.iSup_singularValue`). Its symmetric form (OI-B81) is
  `TauCeti.SymmetricOperatorIdealFamily.opNorm`, the symmetric family of the supremum gauge
  (`TauCeti.SymmetricGauge.symmetricOperatorIdealFamily_supGauge`).
- *Finite endpoints* (OI-B83, OI-B84, OI-B86). `S₁` is the trace-class family
  (`TauCeti.OperatorIdealFamily.schatten_one`) and `S₂` the Hilbert–Schmidt family
  (`TauCeti.OperatorIdealFamily.schatten_two`); the symmetric families agree at the three endpoints
  (`TauCeti.SymmetricOperatorIdealFamily.schatten_one`,
  `TauCeti.SymmetricOperatorIdealFamily.schatten_two`,
  `TauCeti.SymmetricGauge.symmetricOperatorIdealFamily_supGauge`).
- *Monotonicity of the scale* (OI-B87, OI-B88). If `1 ≤ p ≤ q`, then `Φ_q(T) ≤ Φ_p(T)`
  (`TauCeti.OperatorIdealFamily.gauge_schatten_le_of_le`; the underlying comparison of `ℓᵖ` sums
  in `ℝ≥0∞` is `ENNReal.Lq_le_Lp_tsum`), hence `S_p ⊆ S_q`
  (`TauCeti.OperatorIdealFamily.finiteSubmodule_schatten_le_of_le`).
- *Hilbert–Schmidt reconciliation* (OI-B90). For `T` from a Hilbert space into an inner product
  space and every Hilbert basis `b` of the source, `∑' n, aₙ(T)² = E_b(T)` in `ℝ≥0∞`
  (`ContinuousLinearMap.tsum_singularValue_sq_eq_hilbertSchmidtEnergy`). The inequality
  `E_b(T) ≤ ∑' n, aₙ(T)²` needs no completeness
  (`ContinuousLinearMap.hilbertSchmidtEnergy_le_tsum_singularValue_sq`); the energy is finite
  exactly when the approximation numbers are square-summable
  (`ContinuousLinearMap.hilbertSchmidtEnergy_ne_top_iff_summable_singularValue_sq`); and between
  Hilbert spaces `‖T‖_HS² = ∑' n, aₙ(T)²` (`ContinuousLinearMap.sq_hilbertSchmidtNorm_eq_tsum_singularValue_sq`).

*Needs:* §§2.2–2.4; §1.5 (OI-A48); Tau Ceti `ENNReal.Lq_le_Lp_tsum` and the declarations named
above.

**Checks.**
- For `r ≥ 1`, the diagonal operator on `ℓ²(ℕ, 𝕜)` with coefficients `(n + 1)^(−1/r)` has
  `aₙ = (n + 1)^(−1/r)` (OI-A55) and lies in `S_q` exactly when `∑ (n + 1)^(−q/r) < ∞`, that is when
  `q > r`. For `1 ≤ p < r < q` it lies in `S_q` and not in `S_p`, so the inclusions of OI-B88 are
  strict and do not reverse.
- For the diagonal operator with coefficients `1/(n + 1)`, both sides of OI-B90 are
  `∑ 1/(n + 1)² = π²/6`, computed in the standard basis.

### 2.6 Orthogonal block sums (OI-B89, OI-B91–OI-B94)

The approximation numbers of an orthogonal block sum merge those of the blocks by generalized
order statistics; the merge records the `n`-th largest value in the generalized sense and need not
list every entry of the union, which matters for noncompact blocks with infinite plateaus
(Gohberg and Kreĭn; Pietsch, *Eigenvalues and s-Numbers*).

- *Generalized decreasing merge* (OI-B89). For bounded `a, b : ℕ → ℝ≥0`, `(a ⊔↓ b)ₙ` is the
  supremum of the `r ∈ ℝ≥0` for which some injective `q : Fin (n + 1) → ℕ ⊕ ℕ` has
  `r ≤ (Sum.elim a b) (q i)` for every `i`: the largest threshold reached by `n + 1` distinct
  entries of the union of `a` and `b`. It is `TauCeti.decreasingMerge`
  (`TauCeti.decreasingMerge_def`); it is symmetric in `a` and `b` (`TauCeti.decreasingMerge_comm`)
  and antitone for bounded `a` and `b` (`TauCeti.antitone_decreasingMerge`). For antitone `a` and
  `b`, `r ≤ (a ⊔↓ b)ₙ` exactly when `r ≤ aₖ` for `k < i` and `r ≤ bₖ` for `k < j` for some
  `i + j = n + 1` (`TauCeti.le_decreasingMerge_iff`), and `(a ⊔↓ b)₀ = max(a₀, b₀)`
  (`TauCeti.decreasingMerge_zero`).
- *Approximation numbers of a block sum* (OI-B91). Over `ℝ` or `ℂ`, for `T₁ : E₁ → F₁` and
  `T₂ : E₂ → F₂` with `E₁`, `E₂` Hilbert spaces and `F₁`, `F₂` inner product spaces,
  `aₙ(T₁ ⊕ T₂) = (a(T₁) ⊔↓ a(T₂))ₙ` for every `n` (`ContinuousLinearMap.singularValue_withLpProdMap`).
  The inequality `≤` holds on seminormed spaces over any nontrivially normed field
  (`ContinuousLinearMap.singularValue_withLpProdMap_le`), and `≥` for blocks whose pairs have the
  property of OI-A38 (`ContinuousLinearMap.decreasingMerge_le_singularValue_withLpProdMap`).
- *Symmetric-gauge block formula* (OI-B92). In the setting of OI-B91, for every symmetric gauge `Φ`,
  `Φ(T₁ ⊕ T₂) = Φ∞(n ↦ (a(T₁) ⊔↓ a(T₂))ₙ)` (`TauCeti.SymmetricGauge.opGauge_withLpProdMap`).
- *Block bounds* (OI-B93, OI-B94). For every symmetric gauge `Φ`,
  `max(Φ(T₁), Φ(T₂)) ≤ Φ(T₁ ⊕ T₂) ≤ Φ(T₁) + Φ(T₂)`, on seminormed spaces over any nontrivially
  normed field (`TauCeti.SymmetricGauge.opGauge_le_opGauge_withLpProdMap_left`,
  `TauCeti.SymmetricGauge.opGauge_le_opGauge_withLpProdMap_right`,
  `TauCeti.SymmetricGauge.opGauge_withLpProdMap_le_add`).
- **Target:** *block bounds for every family.* For every operator-ideal family `Φ`, Hilbert spaces
  `E`, `F`, a bounded `T : E → F`, and maps `P₁, P₂ : E → E` and `Q₁, Q₂ : F → F` of norm at most
  `1` with `T = Q₁TP₁ + Q₂TP₂`, prove `max(Φ(Q₁TP₁), Φ(Q₂TP₂)) ≤ Φ(T) ≤ Φ(Q₁TP₁) + Φ(Q₂TP₂)`.
  The upper bound is subadditivity applied to the splitting and the lower bound is the two-sided
  ideal inequality applied to each compression. With `P` and `Q` the coordinate projections of
  `WithLp 2 (E₁ × E₂)` and `WithLp 2 (F₁ × F₂)`, and the ideal inequality once more for the
  inclusions of the blocks, it gives `max(Φ(T₁), Φ(T₂)) ≤ Φ(T₁ ⊕ T₂) ≤ Φ(T₁) + Φ(T₂)` for every
  family. *Needs:* §2.1 (`TauCeti.OperatorIdealFamily.gauge_comp_left_le_self`,
  `TauCeti.OperatorIdealFamily.gauge_comp_right_le_self`, the field `gauge_add_le` of
  `TauCeti.OperatorIdealFamily`).

*Needs:* §§1.1–1.4 (OI-A38, OI-A39), 2.1, 2.4; Tau Ceti `ContinuousLinearMap.withLpProdMap` and the
declarations named above; Mathlib `WithLp`.

**Checks.**
- For `a = (3, 1, 0, 0, …)` and `b = (2, 2, 0, 0, …)`, `a ⊔↓ b = (3, 2, 2, 1, 0, 0, …)`: at `n = 3`
  the four largest entries are `3, 2, 2, 1`, and from `n = 4` on any five distinct entries include
  a `0`. So `diag(3, 1) ⊕ diag(2, 2)` has trace norm `8 = 4 + 4` and operator norm
  `3 = max(3, 2)`: the two bounds of OI-B93 and OI-B94 are attained by the `ℓ¹` and supremum
  gauges.
- For `a = (1, 1, 1, …)` and `b = (1/2, 0, 0, …)`, `(a ⊔↓ b)ₙ = 1` for every `n`, which is the
  approximation-number sequence of the identity of `ℓ²(ℕ, 𝕜)` summed with a rank-one block of norm
  `1/2`. The value `1/2` appears at no index: a definition that sorts the union of the two
  sequences into one nonincreasing sequence has no place for it.

### Examples

- The operator-norm and Ky Fan families have every bounded operator in their ideals (OI-B26,
  OI-B28); the identity of an infinite-dimensional Hilbert space lies outside the trace class
  (OI-B31) and outside every `S_p` with finite `p`.
- The concrete families are `TauCeti.OperatorIdealFamily.opNorm`, `TauCeti.OperatorIdealFamily.kyFan`,
  `TauCeti.OperatorIdealFamily.traceClass` and `TauCeti.OperatorIdealFamily.hilbertSchmidt`
  (OI-B25, OI-B27, OI-B30, OI-B41), and the Schatten families of §2.5.
- The diagonal operator with coefficients `1/(n + 1)` lies in `S_p` exactly for `p > 1`; it is
  Hilbert–Schmidt with `‖T‖_HS = π/√6` and not trace class.

### Dependencies

Layer 1. Majorization MAJ-B01 and MAJ-B31, unitarily invariant seminorms and the Frobenius
seminorm, for §2.3. Mathlib Hilbert bases, `ℝ≥0∞`-valued sums and `WithLp`. Tau Ceti the
declarations named in §§2.1–2.6.

## Layer 3: Hilbert–Schmidt operators as ℓ² of columns

### 3.1 The column model (OI-C01–OI-C14)

Relative to a Hilbert basis `b` of the source, an operator is determined by its columns, and the
operators of finite energy are exactly those with square-summable columns (Reed and Simon I;
Simon, *Trace Ideals*). Throughout, `𝕜` is `ℝ` or `ℂ`, `E` an inner product space and `b` a Hilbert
basis of `E`.

- *Columns* (OI-C01). The column family of `T : E → F` is the function `i ↦ T bᵢ` (Convention 8);
  the statements below are written with this function, and no separate declaration is needed.
- *Represented operator* (OI-C02, OI-C09, OI-C13). For `F` a Banach space and `f ∈ ℓ²(ι, F)`, the
  series `T_f x = ∑' i, ⟪bᵢ, x⟫ • fᵢ` converges absolutely, with
  `∑' i, ‖⟪bᵢ, x⟫‖ ‖fᵢ‖ ≤ ‖x‖ ‖f‖` (`HilbertBasis.tsum_norm_inner_mul_norm_le`), and `f ↦ T_f` is a
  bounded linear map `ℓ²(ι, F) → (E →L[𝕜] F)` of norm at most `1`: `HilbertBasis.columnOperator`
  (`HilbertBasis.columnOperator_apply`, `HilbertBasis.norm_columnOperator_le`).
- *Membership* (OI-C03, OI-C04). For `F` an inner product space, `E_b(T) < ∞` exactly when the
  column family lies in `ℓ²` (`ContinuousLinearMap.hilbertSchmidtEnergy_ne_top_iff_memℓp`), exactly
  when `i ↦ ‖T bᵢ‖²` is summable (`ContinuousLinearMap.hilbertSchmidtEnergy_ne_top_iff_summable`).
- *Columns of `T_f`* (OI-C05). `T_f bᵢ = fᵢ` (`HilbertBasis.columnOperator_apply_self`), and `T_f = T`
  exactly when `fᵢ = T bᵢ` for every `i` (`HilbertBasis.columnOperator_eq_iff`).
- *Reconstruction* (OI-C06). An operator whose column family lies in `ℓ²` is the operator
  represented by it (`HilbertBasis.columnOperator_mk`); by OI-C03 this covers every operator of
  finite energy.
- *Injectivity and uniqueness* (OI-C07, OI-C08). Two `ℓ²` families representing the same operator
  are equal (`HilbertBasis.columnOperator_injective`); for `F` a Hilbert space, every operator of
  finite energy has exactly one representing family (`HilbertBasis.existsUnique_columnOperator_eq`),
  and the represented operators are exactly the operators of finite energy
  (`HilbertBasis.range_columnOperator`).
- *Operator-norm bound* (OI-C10). `‖T_f‖ ≤ ‖f‖` (`HilbertBasis.norm_columnOperator_apply_le`).
- *Norm identity* (OI-C11). `∑' i, ‖T_f bᵢ‖² = ‖f‖²`
  (`HilbertBasis.tsum_norm_columnOperator_apply_self_sq`); for `E` and `F` Hilbert spaces,
  `‖T_f‖_HS = ‖f‖` (`HilbertBasis.hilbertSchmidtNorm_columnOperator`).
- *Energy identity* (OI-C12). For `F` a Hilbert space, `E_b(T_f) = ‖f‖ₑ²`
  (`HilbertBasis.hilbertSchmidtEnergy_columnOperator`).
- *Hilbert–Schmidt operators are compact* (OI-C14). For `F` a Hilbert space, if `E_b(T) < ∞` then
  `T` is compact (`ContinuousLinearMap.isCompactOperator_of_hilbertSchmidtEnergy_ne_top`); every
  `T_f` is compact, as the norm limit of the operators represented by the finite truncations of `f`
  (`HilbertBasis.isCompactOperator_columnOperator`).

*Needs:* §2.2 (OI-B32); Mathlib `HilbertBasis`, `lp`, `Memℓp`, `IsCompactOperator`; Tau Ceti the
declarations named above.

**Checks.**
- The family `fᵢ = (1/(i + 1)) • bᵢ` in `ℓ²(ℕ, ℓ²(ℕ, 𝕜))` with the standard basis `b` represents the
  diagonal operator with coefficients `1/(i + 1)`, and `‖f‖² = π²/6 = E_b(T_f)`. The columns
  `i ↦ bᵢ` of the identity have norm `1` and do not lie in `ℓ²`, so the identity is represented by
  no family, as OI-C08 requires of an operator of infinite energy.

### 3.2 Isometric conjugation (OI-C15–OI-C17)

The energy is invariant under isometries on the left and coisometries on the right (Simon, *Trace
Ideals*).

- *Left isometric invariance* (OI-C15). If `U : F → G` satisfies `‖Ux‖ = ‖x‖` for every `x`, then
  `E_b(UT) = E_b(T)` (`ContinuousLinearMap.hilbertSchmidtEnergy_isometry_comp`), with no
  completeness; between Hilbert spaces also `‖UT‖_HS = ‖T‖_HS`
  (`ContinuousLinearMap.hilbertSchmidtNorm_isometry_comp`).
- *Right coisometric invariance* (OI-C16). For `V : E → F` and `T : F → G` between Hilbert spaces,
  if `‖V† x‖ = ‖x‖` for every `x`, then `‖TV‖_HS = ‖T‖_HS`
  (`ContinuousLinearMap.hilbertSchmidtNorm_comp_coisometry`), and `E_b(TV) = E_c(T)` for Hilbert
  bases `b` of `E` and `c` of `F` (`ContinuousLinearMap.hilbertSchmidtEnergy_comp_coisometry`).
- *Two-sided conjugation* (OI-C17). Under both hypotheses, `‖UTV‖_HS = ‖T‖_HS`
  (`ContinuousLinearMap.hilbertSchmidtNorm_isometry_comp_coisometry`), and in energy form
  `E_b(UTV) = E_c(T)` (`ContinuousLinearMap.hilbertSchmidtEnergy_isometry_comp_coisometry`).

*Needs:* §2.2 (OI-B32, OI-B34, OI-B36); Tau Ceti the declarations named above.

**Checks.**
- The isometry `V : 𝕜 → 𝕜²`, `x ↦ (x, 0)`, has `V†(y₁, y₂) = y₁`, which does not preserve norms. For
  `T` the identity of `𝕜²`, `‖T‖_HS = √2` while `‖TV‖_HS = ‖V‖_HS = 1`: on the right the hypothesis
  must be on `V†`, and an isometry does not suffice.

### 3.3 Pythagoras along orthogonal families (OI-C18–OI-C20)

Families that split squared norms split the energy, with no countability or summability
hypotheses (Simon, *Trace Ideals*).

- *Left Pythagoras* (OI-C18). If `Pⱼ : F → G` satisfy `∑' j, ‖Pⱼ v‖ₑ² = ‖v‖ₑ²` for every `v ∈ F`,
  then `∑' j, E_b(Pⱼ T) = E_b(T)` (`ContinuousLinearMap.tsum_hilbertSchmidtEnergy_comp_left`); no
  completeness or finite energy is needed. The orthogonal projections onto a subspace and onto its
  complement form such a family (`ContinuousLinearMap.hilbertSchmidtEnergy_starProjection_comp_add_orthogonal`).
- *Right Pythagoras* (OI-C19). For `E`, `F` and `H` Hilbert spaces, if `Qⱼ : H → E` satisfy
  `∑' j, ‖Qⱼ† v‖ₑ² = ‖v‖ₑ²` for every `v ∈ E`, then `∑' j, E_b'(T Qⱼ) = E_b(T)` for Hilbert bases `b`
  of `E` and `b'` of `H` (`ContinuousLinearMap.tsum_hilbertSchmidtEnergy_comp_right`); `H = E` is the
  case of endomorphisms of the source.
- *Joint Pythagoras* (OI-C20). Under the hypotheses of OI-C18 on the target and of OI-C19 on the
  source, `∑' j, ∑' i, E_b'(Pᵢ T Qⱼ) = E_b(T)`
  (`ContinuousLinearMap.tsum_tsum_hilbertSchmidtEnergy_comp`).

*Needs:* §2.2 (OI-B32, OI-B34); Tau Ceti the declarations named above.

**Checks.**
- For the coordinate projections `P₀`, `P₁` of `𝕜²` and `T` the identity, `‖P₀v‖² + ‖P₁v‖² = ‖v‖²`
  and `E(P₀) + E(P₁) = 1 + 1 = 2 = E(id)`.

### Examples

- The column model is identified with the basis-independent energy by OI-C03, OI-B35 and OI-C12,
  and its bounded representation map is OI-C09 to OI-C13.
- A rank-one operator `x ↦ ⟪u, x⟫ • v` has columns `⟪u, bᵢ⟫ • v` and energy
  `∑ |⟪u, bᵢ⟫|² ‖v‖² = ‖u‖² ‖v‖²`, in agreement with `a₀² = ‖u‖² ‖v‖²` and OI-B90.

### Dependencies

Layer 2, §2.2: the energy, the Hilbert–Schmidt norm and the adjoint swap. Mathlib `lp`, `Memℓp` and
`HilbertBasis`. Tau Ceti the declarations named in §§3.1–3.3.

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
elementary part of Layer 1 was adapted in part from the Mathlib proposal for singular values cited
in the references and developed further for spectral perturbation theory; the source provenance,
authorship and licensing notices are recorded in the corresponding modules.

## Scope and ownership

**This roadmap owns** every item labelled `OI-…` above: the approximation numbers of bounded maps
between seminormed spaces with their calculus, their relation to rank and compactness, their
Hilbert-space invariances, min–max formulas, Ky Fan gauges and finite-dimensional identification
(Layer 1); operator-ideal families and their carriers, the operator-norm, Ky Fan, trace-class,
Hilbert–Schmidt and Schatten families, the Hilbert–Schmidt energy and norm, Minkowski's inequality
for `ℝ≥0∞`-valued sums, Ky Fan dominance, the finite-dimensional Schatten seminorms, symmetric
gauges with their extension and induced families, and orthogonal block sums with the generalized
decreasing merge (Layer 2); and the column model of the Hilbert–Schmidt class with its isometric
invariance and Pythagoras identities (Layer 3).

**Already in the library.** Every item of Layers 1–3 is in Tau Ceti at the pinned version, under
the names given above, except the two targets that remain: faithfulness OI-B72 for scalars and
spaces in arbitrary universes (§2.4, `symmetricGaugeFamily_injective`; Tau Ceti proves it in the
lowest universe), and the block bounds OI-B93–OI-B94 for an arbitrary operator-ideal family (§2.6;
Tau Ceti proves them for the families induced by symmetric gauges). Where the library's statement
is more general than the item, the section says so: OI-A24 holds without finite dimension, OI-A55
for complex coefficients and on every `ℓᵖ`, OI-B42 compares operators on different pairs of
spaces, OI-B74 needs only `a` antitone, and OI-B91–OI-B94 hold for `ℓᵖ` block sums. Mathlib
supplies the finite-dimensional singular values `LinearMap.singularValues` and the unit-ball form
of the operator norm used in OI-A37.

**Owned elsewhere and consumed here.**

- *The bounded-operator modulus* `|T| = √(T†T)` belongs to PolarDecomposition (PD-A36) and is Tau
  Ceti's `ContinuousLinearMap.modulus`; §1.3 uses it. Finite singular systems belong to
  PolarDecomposition, Part C.
- *Finite-dimensional Ky Fan sums, unitarily invariant seminorms and the Frobenius seminorm* belong
  to Majorization (MAJ-A26, MAJ-B01, MAJ-B31) and are Tau Ceti's `LinearMap.kyFanSum`,
  `TauCeti.UnitarilyInvariantSeminorm` and `TauCeti.UnitarilyInvariantSeminorm.frobenius`; §§1.5
  and 2.3 use them. The finite-dimensional Schatten seminorms of §2.3 are this roadmap's, built on
  them.
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
- `ENNReal.tsum_comm`, `ENNReal.rpow`, `Finsupp.equivMapDomain`, `CFC.sqrt`.

### From Tau Ceti

Paths are under `TauCeti/Analysis/`. Each declaration is assumed as stated there; the sections
above give its hypotheses.

- Approximation numbers (`OperatorIdeal/ApproximationNumber/Basic.lean`):
  `ContinuousLinearMap.singularValue`, `ContinuousLinearMap.kyFanGauge`,
  `ContinuousLinearMap.isGLB_singularValue`, `ContinuousLinearMap.singularValue_le_nnnorm_sub`,
  `ContinuousLinearMap.le_singularValue_iff`, `ContinuousLinearMap.singularValue_eq_nnnorm_sub`,
  `ContinuousLinearMap.exists_rank_le_nnnorm_sub_lt`, `ContinuousLinearMap.singularValue_zero`,
  `ContinuousLinearMap.antitone_singularValue`, `ContinuousLinearMap.singularValue_le_nnnorm`,
  `ContinuousLinearMap.iSup_singularValue`, `ContinuousLinearMap.zero_singularValue`,
  `ContinuousLinearMap.singularValue_add_le`, `ContinuousLinearMap.singularValue_add_index_le`,
  `ContinuousLinearMap.abs_singularValue_sub_singularValue_le`,
  `ContinuousLinearMap.lipschitzWith_singularValue`, `ContinuousLinearMap.continuous_singularValue`,
  `ContinuousLinearMap.singularValue_comp_le_left`, `ContinuousLinearMap.singularValue_comp_le_right`,
  `ContinuousLinearMap.singularValue_comp_comp_le`, `ContinuousLinearMap.singularValue_smul`,
  `ContinuousLinearMap.singularValue_comp_add_le_mul`,
  `ContinuousLinearMap.singularValue_eq_zero_of_rank_le`,
  `ContinuousLinearMap.singularValue_eq_zero_of_rank_domain_le`,
  `ContinuousLinearMap.kyFanGauge_one`, `ContinuousLinearMap.kyFanGauge_smul`,
  `ContinuousLinearMap.kyFanGauge_comp_comp_le`, `ContinuousLinearMap.nnnorm_le_kyFanGauge`,
  `ContinuousLinearMap.kyFanGauge_le_mul_nnnorm`.
- Same approximation numbers (`OperatorIdeal/ApproximationNumber/Equivalence.lean`):
  `ContinuousLinearMap.SameSingularValues`, `ContinuousLinearMap.sameSingularValues_iff`,
  `ContinuousLinearMap.sameSingularValues_refl`, `ContinuousLinearMap.sameSingularValues_symm`,
  `ContinuousLinearMap.sameSingularValues_trans`. Isometric invariance
  (`OperatorIdeal/ApproximationNumber/Isometry.lean`):
  `ContinuousLinearMap.singularValue_comp_linearIsometryEquiv`.
- Rank and compactness (`OperatorIdeal/ApproximationNumber/Compact.lean`,
  `Normed/Operator/Compact/FiniteRank.lean`): `ContinuousLinearMap.singularValue_eq_zero_iff_rank_le`,
  `ContinuousLinearMap.tendsto_singularValue_nhds_zero_iff`,
  `LinearMap.HasFiniteRange.isCompactOperator`,
  `ContinuousLinearMap.isCompactOperator_of_tendsto_singularValue`,
  `IsCompactOperator.tendsto_singularValue`,
  `ContinuousLinearMap.isCompactOperator_iff_tendsto_singularValue`.
- Hilbert-space invariance (`OperatorIdeal/ApproximationNumber/Adjoint.lean`,
  `OperatorIdeal/ApproximationNumber/Modulus.lean`, `InnerProductSpace/Modulus.lean`):
  `ContinuousLinearMap.singularValue_adjoint`, `ContinuousLinearMap.kyFanGauge_adjoint`,
  `ContinuousLinearMap.modulus`, `ContinuousLinearMap.singularValue_modulus`,
  `ContinuousLinearMap.singularValue_eq_of_forall_norm_apply_eq`.
- Min–max (`OperatorIdeal/ApproximationNumber/MinMax.lean`, `.../Attainment.lean`):
  `ContinuousLinearMap.le_singularValue_of_lt_rank`,
  `ContinuousLinearMap.le_singularValue_of_lt_rank_of_unit_norm`,
  `ContinuousLinearMap.le_singularValue_of_linearIndependent`, `ContinuousLinearMap.singularValue_id`,
  `ContinuousLinearMap.singularValue_id_of_finiteDimensional`,
  `ContinuousLinearMap.singularValue_le_nnnorm_comp_orthogonal`,
  `ContinuousLinearMap.singularValue_eq_iInf_nnnorm_comp_orthogonal`,
  `ContinuousLinearMap.exists_linearIndependent_or_exists_rank_le`, `TauCeti.HasMinMaxLowerBound`,
  `TauCeti.hasMinMaxLowerBound_iff`, `TauCeti.HasMinMaxLowerBound.of_completeSpace`,
  `TauCeti.HasMinMaxLowerBound.isLUB_singularValue`, `TauCeti.hasMinMaxLowerBound_iff_forall_isLUB`,
  `TauCeti.HasMinMaxLowerBound.exists_singularValue_le_compression`,
  `OrthonormalBasis.nnnorm_toLin_diagonal_comp_orthogonal_spanIndices`.
- Ky Fan and Eckart–Young (`OperatorIdeal/ApproximationNumber/KyFan.lean`, `.../EckartYoung.lean`,
  `InnerProductSpace/KyFan.lean`): `LinearMap.kyFanSum`, `ContinuousLinearMap.kyFanGauge_eq_kyFanSum`,
  `ContinuousLinearMap.norm_sum_inner_le_kyFanGauge`, `TauCeti.HasMinMaxLowerBound.kyFanGauge_add_le`,
  `ContinuousLinearMap.kyFanGauge_add_le`, `ContinuousLinearMap.singularValue_eq_linearMap_singularValues`,
  `LinearMap.abs_singularValues_sub_singularValues_le`.
- Models (`OperatorIdeal/ApproximationNumber/Projection.lean`, `.../FiniteDiagonal.lean`,
  `.../Diagonal.lean`, `Normed/Lp/Diagonal/Basic.lean`): `Submodule.singularValue_starProjection`,
  `ContinuousLinearMap.singularValue_eq_of_pairwise_inner_eq_zero`,
  `Matrix.singularValue_toLin_of_ite_val_eq`, `Matrix.singularValue_toLin_of_ite_val_eq_eq_zero_of_le`,
  `lp.diagonalCLM`, `lp.singularValue_diagonalCLM`, `lp.tendsto_singularValue_diagonalCLM`,
  `lp.exists_singularValue_diagonalCLM_eq`.
- Families and carriers (`OperatorIdeal/Carrier.lean`, `OperatorIdeal/Family.lean`,
  `OperatorIdeal/Family/Carrier.lean`): `TauCeti.OperatorGauge`,
  `TauCeti.OperatorGauge.finiteSubmodule`, `TauCeti.OperatorGauge.mem_finiteSubmodule`,
  `TauCeti.OperatorGauge.Carrier`, `TauCeti.OperatorGauge.Carrier.norm_def`,
  `TauCeti.OperatorGauge.Carrier.ofReal_norm_eq_gauge`,
  `TauCeti.OperatorGauge.Carrier.toContinuousLinearMapL`,
  `TauCeti.OperatorGauge.Carrier.norm_toContinuousLinearMapL_le`,
  `TauCeti.OperatorGauge.completeSpace_carrier_of_lowerSemicontinuous`,
  `TauCeti.OperatorIdealFamily`, `TauCeti.SymmetricOperatorIdealFamily`,
  `TauCeti.OperatorIdealFamily.ext`, `TauCeti.SymmetricOperatorIdealFamily.ext`,
  `TauCeti.OperatorIdealFamily.gauge_zero`, `TauCeti.OperatorIdealFamily.gauge_eq_zero_iff`,
  `TauCeti.OperatorIdealFamily.gauge_neg`, `TauCeti.OperatorIdealFamily.gauge_sum_le`,
  `TauCeti.OperatorIdealFamily.gauge_comp_left_le`, `TauCeti.OperatorIdealFamily.gauge_comp_right_le`,
  `TauCeti.OperatorIdealFamily.gauge_comp_left_le_self`,
  `TauCeti.OperatorIdealFamily.gauge_comp_right_le_self`, `TauCeti.OperatorIdealFamily.operatorGauge`,
  `TauCeti.OperatorIdealFamily.comp_left_mem_finiteSubmodule`,
  `TauCeti.OperatorIdealFamily.comp_right_mem_finiteSubmodule`, `TauCeti.OperatorIdealFamily.IsComplete`,
  `TauCeti.OperatorIdealFamily.isComplete_of_lowerSemicontinuous`.
- Concrete families (`OperatorIdeal/OperatorNorm.lean`, `OperatorIdeal/Family/KyFan/Basic.lean`,
  `OperatorIdeal/Nuclear/Basic.lean`, `OperatorIdeal/Family/TraceClass.lean`,
  `OperatorIdeal/Family/HilbertSchmidt.lean`): `TauCeti.OperatorIdealFamily.opNorm`,
  `TauCeti.OperatorIdealFamily.gauge_opNorm`, `TauCeti.OperatorIdealFamily.finiteSubmodule_opNorm`,
  `TauCeti.OperatorIdealFamily.opNorm_isComplete`, `TauCeti.SymmetricOperatorIdealFamily.opNorm`,
  `TauCeti.OperatorIdealFamily.kyFan`, `TauCeti.OperatorIdealFamily.gauge_kyFan`,
  `TauCeti.OperatorIdealFamily.finiteSubmodule_kyFan`, `TauCeti.OperatorIdealFamily.kyFan_isComplete`,
  `TauCeti.OperatorIdealFamily.kyFan_one`, `ContinuousLinearMap.nuclearENorm`,
  `ContinuousLinearMap.nuclearENorm_eq_iSup_kyFanGauge`,
  `ContinuousLinearMap.nuclearENorm_ne_top_iff_summable`, `ContinuousLinearMap.nuclearENorm_add_le`,
  `ContinuousLinearMap.nuclearENorm_adjoint`, `ContinuousLinearMap.nuclearENorm_id_eq_top`,
  `TauCeti.OperatorIdealFamily.traceClass`, `TauCeti.OperatorIdealFamily.gauge_traceClass`,
  `TauCeti.OperatorIdealFamily.mem_finiteSubmodule_traceClass_iff`,
  `TauCeti.OperatorIdealFamily.traceClass_isComplete`, `TauCeti.SymmetricOperatorIdealFamily.traceClass`,
  `TauCeti.OperatorIdealFamily.hilbertSchmidt`, `TauCeti.OperatorIdealFamily.gauge_hilbertSchmidt`,
  `TauCeti.OperatorIdealFamily.mem_finiteSubmodule_hilbertSchmidt_iff`,
  `TauCeti.OperatorIdealFamily.toReal_gauge_hilbertSchmidt`,
  `TauCeti.OperatorIdealFamily.hilbertSchmidt_isComplete`,
  `TauCeti.SymmetricOperatorIdealFamily.hilbertSchmidt`.
- Hilbert–Schmidt energy and norm (`InnerProductSpace/HilbertSchmidt/Basic.lean`,
  `OperatorIdeal/ApproximationNumber/HilbertSchmidt.lean`, `MeanInequalities.lean`):
  `ContinuousLinearMap.hilbertSchmidtEnergy`, `ContinuousLinearMap.hilbertSchmidtEnergy_eq_tsum_tsum`,
  `ContinuousLinearMap.hilbertSchmidtEnergy_adjoint`, `ContinuousLinearMap.hilbertSchmidtEnergy_indep`,
  `ContinuousLinearMap.hilbertSchmidtNorm`, `ContinuousLinearMap.hilbertSchmidtNorm_eq_sqrt`,
  `ContinuousLinearMap.ofReal_sq_hilbertSchmidtNorm`, `ContinuousLinearMap.rpow_hilbertSchmidtEnergy_add_le`,
  `ContinuousLinearMap.norm_le_hilbertSchmidtNorm`, `ContinuousLinearMap.enorm_sq_le_hilbertSchmidtEnergy`,
  `ContinuousLinearMap.hilbertSchmidtNorm_adjoint`, `ContinuousLinearMap.hilbertSchmidtNorm_comp_comp_le`,
  `ContinuousLinearMap.hilbertSchmidtEnergy_comp_comp_le`,
  `ContinuousLinearMap.hilbertSchmidtEnergy_eq_ofReal_sq_frobenius`,
  `ContinuousLinearMap.tsum_singularValue_sq_eq_hilbertSchmidtEnergy`,
  `ContinuousLinearMap.hilbertSchmidtEnergy_le_tsum_singularValue_sq`,
  `ContinuousLinearMap.hilbertSchmidtEnergy_ne_top_iff_summable_singularValue_sq`,
  `ContinuousLinearMap.sq_hilbertSchmidtNorm_eq_tsum_singularValue_sq`, `ENNReal.Lp_add_le_tsum`,
  `ENNReal.Lq_le_Lp_tsum`.
- Ky Fan dominance (`OperatorIdeal/Family/KyFan/Dominance.lean`):
  `TauCeti.OperatorIdealFamily.IsKyFanDominant`,
  `TauCeti.OperatorIdealFamily.mem_finiteSubmodule_of_forall_kyFanGauge_le`,
  `TauCeti.OperatorIdealFamily.gauge_eq_of_sameSingularValues`, `TauCeti.OperatorIdealFamily.gauge_adjoint`,
  `TauCeti.OperatorIdealFamily.isKyFanDominant_opNorm`, `TauCeti.OperatorIdealFamily.isKyFanDominant_kyFan`,
  `TauCeti.OperatorIdealFamily.isKyFanDominant_traceClass`,
  `TauCeti.SymmetricGauge.isKyFanDominant_operatorIdealFamily`.
- Finite-dimensional Schatten seminorms (`InnerProductSpace/UnitarilyInvariantSeminorm/Basic.lean`,
  `.../Schatten.lean`, `.../Frobenius.lean`, `.../KyFan.lean`): `TauCeti.UnitarilyInvariantSeminorm`,
  `TauCeti.UnitarilyInvariantSeminorm.schatten`, `TauCeti.UnitarilyInvariantSeminorm.schatten_apply_of_ne_top`,
  `TauCeti.UnitarilyInvariantSeminorm.schatten_top`,
  `TauCeti.UnitarilyInvariantSeminorm.schatten_apply_eq_zero_iff`,
  `TauCeti.UnitarilyInvariantSeminorm.schatten_apply_adjoint`,
  `TauCeti.UnitarilyInvariantSeminorm.schatten_comp_le_left`,
  `TauCeti.UnitarilyInvariantSeminorm.schatten_comp_le_right`,
  `TauCeti.UnitarilyInvariantSeminorm.schatten_comp_comp_le`,
  `TauCeti.UnitarilyInvariantSeminorm.schatten_one`, `TauCeti.UnitarilyInvariantSeminorm.schatten_two`,
  `TauCeti.UnitarilyInvariantSeminorm.nuclear`, `TauCeti.UnitarilyInvariantSeminorm.frobenius`.
- Symmetric gauges (`OperatorIdeal/SymmetricGauge/Basic.lean`, `.../Lp.lean`):
  `TauCeti.SymmetricGauge`, `TauCeti.SymmetricGauge.map_single`, `TauCeti.SymmetricGauge.iSup_le_apply`,
  `TauCeti.SymmetricGauge.apply_le_sum`, `TauCeti.SymmetricGauge.extend`,
  `TauCeti.SymmetricGauge.extend_coe`, `TauCeti.SymmetricGauge.extend_comp_perm`,
  `TauCeti.SymmetricGauge.iSup_le_extend`, `TauCeti.SymmetricGauge.extend_le_tsum`,
  `TauCeti.SymmetricGauge.extend_coe_eq_iSup_indicator`, `TauCeti.SymmetricGauge.extend_mono`,
  `TauCeti.SymmetricGauge.extend_smul`, `TauCeti.SymmetricGauge.extend_add_le`,
  `TauCeti.SymmetricGauge.supGauge`, `TauCeti.SymmetricGauge.extend_supGauge`,
  `TauCeti.SymmetricGauge.apply_le_apply_of_forall_sum_le`,
  `TauCeti.SymmetricGauge.extend_le_extend_of_forall_sum_le`, `TauCeti.SymmetricGauge.lpGauge`,
  `TauCeti.SymmetricGauge.lpGauge_apply`.
- Induced families and the Schatten scale (`OperatorIdeal/Family/SymmetricGauge.lean`,
  `.../SymmetricGauge/Faithfulness.lean`, `OperatorIdeal/Family/Schatten.lean`):
  `TauCeti.SymmetricGauge.opGauge`, `TauCeti.SymmetricGauge.opGauge_def`,
  `TauCeti.SymmetricGauge.enorm_le_opGauge`, `TauCeti.SymmetricGauge.opGauge_supGauge`,
  `TauCeti.SymmetricGauge.opGauge_smul`, `TauCeti.SymmetricGauge.opGauge_comp_comp_le`,
  `TauCeti.SymmetricGauge.opGauge_le_of_forall_kyFanGauge_le`,
  `TauCeti.SymmetricGauge.opGauge_eq_of_sameSingularValues`, `TauCeti.SymmetricGauge.opGauge_add_le`,
  `TauCeti.SymmetricGauge.opGauge_adjoint`, `TauCeti.SymmetricGauge.operatorIdealFamily`,
  `TauCeti.SymmetricGauge.operatorIdealFamily_gauge`, `TauCeti.SymmetricGauge.symmetricOperatorIdealFamily`,
  `TauCeti.SymmetricGauge.operatorIdealFamily_supGauge`,
  `TauCeti.SymmetricGauge.symmetricOperatorIdealFamily_supGauge`,
  `TauCeti.SymmetricGauge.extend_eq_of_operatorIdealFamily_eq`, `TauCeti.OperatorIdealFamily.schatten`,
  `TauCeti.OperatorIdealFamily.schatten_def`, `TauCeti.OperatorIdealFamily.gauge_schatten`,
  `TauCeti.OperatorIdealFamily.mem_finiteSubmodule_schatten_iff`,
  `TauCeti.OperatorIdealFamily.lowerSemicontinuous_gauge_schatten`,
  `TauCeti.OperatorIdealFamily.gauge_schatten_le_of_le`,
  `TauCeti.OperatorIdealFamily.finiteSubmodule_schatten_le_of_le`,
  `TauCeti.OperatorIdealFamily.schatten_isComplete`, `TauCeti.SymmetricOperatorIdealFamily.schatten`,
  `TauCeti.OperatorIdealFamily.schatten_one`, `TauCeti.OperatorIdealFamily.schatten_two`,
  `TauCeti.SymmetricOperatorIdealFamily.schatten_one`, `TauCeti.SymmetricOperatorIdealFamily.schatten_two`.
- Block sums (`OperatorIdeal/DecreasingMerge.lean`, `OperatorIdeal/ApproximationNumber/BlockSum.lean`,
  `OperatorIdeal/Family/BlockSum.lean`, `Normed/Lp/ProdLp.lean`): `TauCeti.decreasingMerge`,
  `TauCeti.decreasingMerge_def`, `TauCeti.decreasingMerge_comm`, `TauCeti.antitone_decreasingMerge`,
  `TauCeti.le_decreasingMerge_iff`, `TauCeti.decreasingMerge_zero`, `ContinuousLinearMap.withLpProdMap`,
  `ContinuousLinearMap.singularValue_withLpProdMap`, `ContinuousLinearMap.singularValue_withLpProdMap_le`,
  `ContinuousLinearMap.decreasingMerge_le_singularValue_withLpProdMap`,
  `TauCeti.SymmetricGauge.opGauge_withLpProdMap`,
  `TauCeti.SymmetricGauge.opGauge_le_opGauge_withLpProdMap_left`,
  `TauCeti.SymmetricGauge.opGauge_le_opGauge_withLpProdMap_right`,
  `TauCeti.SymmetricGauge.opGauge_withLpProdMap_le_add`.
- The column model (`InnerProductSpace/HilbertSchmidt/Columns.lean`): `HilbertBasis.columnOperator`,
  `HilbertBasis.tsum_norm_inner_mul_norm_le`, `HilbertBasis.columnOperator_apply`,
  `HilbertBasis.norm_columnOperator_le`, `HilbertBasis.columnOperator_apply_self`,
  `HilbertBasis.columnOperator_eq_iff`, `HilbertBasis.columnOperator_mk`,
  `HilbertBasis.columnOperator_injective`, `HilbertBasis.existsUnique_columnOperator_eq`,
  `HilbertBasis.range_columnOperator`, `HilbertBasis.norm_columnOperator_apply_le`,
  `HilbertBasis.tsum_norm_columnOperator_apply_self_sq`, `HilbertBasis.hilbertSchmidtNorm_columnOperator`,
  `HilbertBasis.hilbertSchmidtEnergy_columnOperator`, `HilbertBasis.isCompactOperator_columnOperator`,
  `ContinuousLinearMap.hilbertSchmidtEnergy_ne_top_iff_memℓp`,
  `ContinuousLinearMap.hilbertSchmidtEnergy_ne_top_iff_summable`,
  `ContinuousLinearMap.isCompactOperator_of_hilbertSchmidtEnergy_ne_top`.
- Isometric invariance and Pythagoras (`InnerProductSpace/HilbertSchmidt/Isometry.lean`,
  `.../Pythagoras.lean`): `ContinuousLinearMap.hilbertSchmidtEnergy_isometry_comp`,
  `ContinuousLinearMap.hilbertSchmidtNorm_isometry_comp`,
  `ContinuousLinearMap.hilbertSchmidtEnergy_comp_coisometry`,
  `ContinuousLinearMap.hilbertSchmidtNorm_comp_coisometry`,
  `ContinuousLinearMap.hilbertSchmidtEnergy_isometry_comp_coisometry`,
  `ContinuousLinearMap.hilbertSchmidtNorm_isometry_comp_coisometry`,
  `ContinuousLinearMap.tsum_hilbertSchmidtEnergy_comp_left`,
  `ContinuousLinearMap.hilbertSchmidtEnergy_starProjection_comp_add_orthogonal`,
  `ContinuousLinearMap.tsum_hilbertSchmidtEnergy_comp_right`,
  `ContinuousLinearMap.tsum_tsum_hilbertSchmidtEnergy_comp`.

### From TauCetiRoadmap.PolarDecomposition

PD-A36, the modulus `|T| = √(T†T)` of a bounded operator between Hilbert spaces over `ℝ` or `ℂ`, as
Tau Ceti's `ContinuousLinearMap.modulus`; assumed as stated there.

### From TauCetiRoadmap.Majorization

MAJ-A26, the Ky Fan sums of a linear map between finite-dimensional inner product spaces (Tau Ceti
`LinearMap.kyFanSum`); MAJ-B01, rectangular unitarily invariant seminorms (Tau Ceti
`TauCeti.UnitarilyInvariantSeminorm`); MAJ-B31, the Frobenius seminorm (Tau Ceti
`TauCeti.UnitarilyInvariantSeminorm.frobenius`). Assumed as stated there.

## References

- A. Pietsch, *Operator Ideals*, North-Holland, 1980; *Eigenvalues and s-Numbers*, Cambridge
  Studies in Advanced Mathematics 13, Cambridge University Press, 1987.
- I. C. Gohberg and M. G. Kreĭn, *Introduction to the Theory of Linear Nonselfadjoint Operators in
  Hilbert Space*, Translations of Mathematical Monographs 18, AMS, 1969.
- B. Simon, *Trace Ideals and Their Applications*, 2nd ed., AMS, 2005; M. Reed and B. Simon,
  *Methods of Modern Mathematical Physics I*: the Hilbert–Schmidt class as `ℓ²` of columns.
- R. Bhatia, *Matrix Analysis*, GTM 169, Springer, 1997: Ky Fan inequalities and majorization.
- C. Eckart and G. Young, "The approximation of one matrix by another of lower rank",
  *Psychometrika* **1** (1936), 211–218.
- L. Mirsky, "Symmetric gauge functions and unitarily invariant norms", *Quart. J. Math.* **11**
  (1960), 50–59.
- R. A. Horn and C. R. Johnson, *Matrix Analysis*, 2nd ed., Cambridge University Press, 2013,
  Thm. 4.2.6.
- M. Ullrich, "Inequalities between s-numbers", *Adv. Oper. Theory* **9** (2024), art. 75.
- The Mathlib proposal for singular values, `ContinuousLinearMap.singularValue : ℕ → ℝ≥0`, indexed
  from zero, https://github.com/leanprover-community/mathlib4/pull/32126, and the Lean Zulip thread
  "Singular Value Decomposition",
  https://leanprover-community.github.io/archive/stream/217875-Is-there-code-for-X%3F/topic/Singular.20Value.20Decomposition.html.
- AIQ DKPS formalization repository, Kitware, Inc., https://github.com/AIQ-Kitware/aiq-dkps-formalization.
