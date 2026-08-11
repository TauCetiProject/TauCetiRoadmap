# Operator ideals: approximation numbers, symmetric ideals, and Hilbert–Schmidt structure

Singular values do not stop at finite dimension. For a bounded operator between normed
spaces their natural continuation is the sequence of **approximation numbers**

```text
aₙ(T) = inf { ‖T − R‖ : rank R ≤ n },
```

the operator-norm distances to the ranks. On finite-dimensional Hilbert spaces these *are*
the singular values (Eckart–Young); in infinite dimensions they are the prototype
**s-numbers** (Pietsch), and the gauges of the sequence `n ↦ aₙ(T)` — Ky Fan partial sums,
`ℓᵖ` sums, the supremum — carve the bounded operators into the classical **symmetric
operator ideals**: the finite-rank-approximable operators, the Schatten classes, trace
class, Hilbert–Schmidt.

Mathlib has the static functional-analysis stack — `ContinuousLinearMap`, operator norms and
adjoints, `LinearMap.rank`, finite-dimensional `LinearMap.singularValues`, the continuous
functional calculus, `IsCompactOperator`, the `lp` spaces — but none of the s-number layer:
no approximation numbers, no object over which a theorem can be stated once for "an
arbitrary symmetric ideal norm", and no Schatten, trace-class or Hilbert–Schmidt theory.

The symmetric-ideal interface laws should hold unconditionally, and the standard instances —
operator norm, Ky Fan, Hilbert–Schmidt, trace class, Schatten `p` — should be constructed
rather than postulated.

Suggested homes: `TauCeti/Analysis/OperatorIdeal/ApproximationNumber/`,
`TauCeti/Analysis/OperatorIdeal/Family/`,
`TauCeti/Analysis/InnerProductSpace/HilbertSchmidt/`.

## Standing conventions

- **Zero-based indexing.** `aₙ(T) = dist(T, {R : rank R ≤ n})`, so `a₀(T) = ‖T‖`, matching
  Mathlib's zero-based singular values index for index. The one-based literature convention
  is the translation `sₙ(T) = aₙ₋₁(T)`.
- **Mathlib-shaped approximation numbers, `ℝ≥0∞` ideal gauges.** The approximation-number
  sequence uses the upstream-facing name and codomain
  `ContinuousLinearMap.singularValue T n : ℝ≥0`. Gauges coerce these values to `ℝ≥0∞` and are
  `∞` off their ideal: a number attached to one operator, versus a gauge whose finiteness
  *defines* a class.
- **Rectangular, independent universes.** Source and target are distinct spaces in
  independent universes throughout the base layer; rank comparisons use `LinearMap.rank` with
  explicit `Cardinal.lift`. Square operators are specializations.
- **Scalar ladder.** Norm-and-rank over `NontriviallyNormedField 𝕜` on seminormed spaces;
  adjoint invariance and Eckart–Young over `RCLike 𝕜`. The finite-restriction min–max
  converse is a pair-level proof lemma: direct over `ℂ`, and obtained once by complexification
  over `ℝ`. Ky Fan subadditivity and the induced symmetric-ideal theory expose only the
  natural `[RCLike 𝕜]` hypothesis to callers.
- **The approximable/compact boundary.** `aₙ(T) → 0` characterizes finite-rank approximability
  on any normed pair, and approximable implies compact over a `ProperSpace` scalar. The
  converse is claimed **only for a Hilbert target** — it fails for general Banach spaces
  without an approximation property, and the hypothesis sits on the target because that is
  where the property lives.
* **One** **`ℝ≥0∞`** **gauge is the sole datum of an ideal family**, the ideal being its finiteness domain. This follows the symmetric-norming-function construction of Gohberg–Kreĭn and is
  the presentation used throughout this roadmap, with an extensionality theorem for the
  induced families. Four laws suffice — subadditivity, absolute homogeneity, domination of
  the operator norm, and the two-sided composition bound — and closure under module
  operations follows.
- **Hilbert spaces at the family layer, forced by the examples.** The four laws are norm-only,
  but of the motivating gauges only the operator norm survives outside Hilbert space: Ky Fan
  subadditivity runs through singular values and majorization. No proof in the interface uses
  the inner product, so re-widening is mechanical if a Banach instance appears.
- **Two structures for the universe split.** The rectangular family keeps source and target
  universes independent; the adjoint exchanges them, so the symmetric family is a second
  structure over the diagonal instantiation.
- **Ky Fan dominance is a class, not a field.** It is false for an arbitrary family satisfying
  the four laws, so a family carries it as a property rather than as data.
- **Hilbert–Schmidt is `ℓ²` of columns, not a tensor product.** Isomorphic models, unequal
  cost: the `ℓ²` route inherits inner product and completeness from Mathlib's `lp`, leaving
  only the column bijection. The Hilbert basis is an explicit parameter of every statement;
  basis-independence of the *energy* is a theorem of Part B.
- **Normal forms.** The approximation number is the normal form of the field-generic theory;
  its identification with singular values is a named theorem, not a global `@[simp]`.

## What Mathlib already has (consume)

Reused: `ContinuousLinearMap` with its operator norm and
[`adjoint`](https://leanprover-community.github.io/mathlib4_docs/Mathlib/Analysis/InnerProductSpace/Adjoint.html);
`LinearMap.rank`, `Module.finrank` and `Cardinal` arithmetic for cross-universe rank bounds;
[`LinearMap.singularValues`](https://leanprover-community.github.io/mathlib4_docs/Mathlib/Analysis/InnerProductSpace/SingularValues.html)
(zero-based), self-adjoint eigenbases and
[`CFC.sqrt`](https://leanprover-community.github.io/mathlib4_docs/Mathlib/Analysis/SpecialFunctions/ContinuousFunctionalCalculus/Rpow/Basic.html);
[`IsCompactOperator`](https://leanprover-community.github.io/mathlib4_docs/Mathlib/Analysis/Normed/Operator/Compact/Basic.html);
`HilbertBasis` with Parseval; and `lp` with its inner-product instance at `p = 2`.
`ENNReal.tsum_comm` is the whole content of adjoint invariance for the Hilbert–Schmidt energy.

The gaps to fill are:

- **No finite-rank-implies-compact lemma.** A Part A target.
- **No hypothesis-free `ℝ≥0∞` Minkowski for `tsum`.** `NNReal.Lp_add_le_tsum` carries
  summability hypotheses on both summands and there is no `ENNReal` `tsum` form; the energy
  layer needs one at `1 ≤ p`.
- **Approximation-number shape.** Mathlib PR
  [#32126](https://github.com/leanprover-community/mathlib4/pull/32126) proposes the finite-rank
  infimum as zero-based `ContinuousLinearMap.singularValue : ℕ → ℝ≥0`; see also the
  [Zulip thread](https://leanprover-community.github.io/archive/stream/217875-Is-there-code-for-X%3F/topic/Singular.20Value.20Decomposition.html).
  Tau Ceti uses that spelling, indexing and codomain for the missing API, so adoption of an
  upstream implementation is deletion plus import rather than migration between parallel
  approximation-number interfaces.

## What is missing (build here)

* The approximation numbers `aₙ(T)` on seminormed spaces over a `NontriviallyNormedField`,
  with the additive and multiplicative index laws, the two-sided ideal bound, and the
  rank/compactness boundary.
* Their Hilbert identifications: adjoint invariance, Eckart–Young against the
  finite-dimensional singular values, and both directions of the min–max principle.
* `OperatorIdealFamily` — one `ℝ≥0∞` gauge on every Hilbert pair, with its four laws — and
  the symmetric family for the diagonal case, where the adjoint keeps source and target in
  one universe.
* The Ky Fan dominance class, and the symmetric-gauge construction realizing a family from a
  gauge on sequences, together with its injectivity.
* The Schatten scale `S_p` for `1 ≤ p ≤ ∞`, obtained from that construction rather than built
  separately, with the nesting `S_p ⊆ S_q`.
* Hilbert–Schmidt operators as `ℓ²` of columns: the energy, its basis-independence, the
  reconciliation with `S₂`, and the named corollary **Hilbert–Schmidt ⇒ compact**.

## The build, in layers

The labels in Parts A–C form the complete mathematical obligation set for this roadmap.
Each label names one definition or theorem. Milestones, definitions, and acceptance examples
cite these labels. `Suggested.lean` cites the labels represented by its sample declarations.

### Part A — approximation numbers and Hilbert-space singular values

**Objects.** The approximation-number sequence assigns to a bounded map `T : E → F` the
zero-based distances `aₙ(T)` from `T` to the maps of rank at most `n`. The relation of having
the same approximation-number sequence compares maps on different Hilbert-space pairs. The
Ky Fan gauge is the prefix sum `Kₖ(T) = ∑_{n<k} aₙ(T)`.

#### Approximation-number definitions and elementary calculus

- **OI-A01 — Approximation number.** For a bounded map `T : E → F` on seminormed spaces over
  a nontrivially normed field, define `aₙ(T) = inf {‖T-R‖ : rank R ≤ n}` with values in
  `ℝ≥0` and zero-based indexing.
- **OI-A02 — Equality of approximation-number sequences.** Define the relation between two
  bounded maps that requires equality of `aₙ` for every `n`.
- **OI-A03 — Reflexivity.** Every bounded map has the same approximation numbers as itself.
- **OI-A04 — Symmetry.** Equality of approximation-number sequences is symmetric.
- **OI-A05 — Transitivity.** Equality of approximation-number sequences is transitive.
- **OI-A06 — Ky Fan gauge.** Define `Kₖ(T) = ∑_{n<k} aₙ(T)`.
- **OI-A07 — Infimum formula.** The approximation number is the infimum in `OI-A01` over the
  bounded rank-`≤ n` approximants.
- **OI-A08 — Approximation upper bound.** If `rank R ≤ n`, then `aₙ(T) ≤ ‖T-R‖`.
- **OI-A09 — Universal lower-bound characterization.** A scalar `c` satisfies `c ≤ aₙ(T)`
  exactly when `c ≤ ‖T-R‖` for every bounded `R` of rank at most `n`.
- **OI-A10 — Best-approximant attainment.** A rank-`≤ n` approximant attaining the infimum
  satisfies `aₙ(T)=‖T-R‖`.
- **OI-A11 — Near-best approximant.** For every positive `ε`, there is a bounded `R` of rank
  at most `n` with `‖T-R‖ < aₙ(T)+ε`.
- **OI-A12 — Zeroth approximation number.** `a₀(T)=‖T‖`.
- **OI-A13 — Antitonicity.** The sequence `n ↦ aₙ(T)` is antitone.
- **OI-A14 — Operator-norm bound.** `aₙ(T) ≤ ‖T‖` for every `n`.
- **OI-A15 — Zero operator.** `aₙ(0)=0` for every `n`.
- **OI-A16 — Fixed-index perturbative triangle bound.**
  `aₙ(S+T) ≤ aₙ(S)+‖T‖`.
- **OI-A17 — Mixed-index additive inequality.**
  `a_{m+n}(S+T) ≤ aₘ(S)+aₙ(T)`.
- **OI-A18 — Lipschitz continuity at a fixed index.**
  `|aₙ(S)-aₙ(T)| ≤ ‖S-T‖`.
- **OI-A19 — Norm continuity.** For each `n`, the map `T ↦ aₙ(T)` is continuous in operator
  norm.
- **OI-A20 — Two-sided ideal inequality.** For composable bounded maps,
  `aₙ(A T B) ≤ ‖A‖ aₙ(T) ‖B‖`.
- **OI-A21 — Scalar homogeneity.** `aₙ(cT)=‖c‖ aₙ(T)`.
- **OI-A22 — Mixed-index product inequality.** For composable bounded maps,
  `a_{m+n}(ST) ≤ aₘ(S)aₙ(T)`.

#### Rank, approximability, and compactness

- **OI-A23 — Vanishing from rank.** If `rank T ≤ n`, then `aₙ(T)=0`.
- **OI-A24 — Finite-dimensional rank characterization.** In finite dimension,
  `aₙ(T)=0` exactly when `rank T ≤ n`.
- **OI-A25 — Finite-rank approximation characterization.** `aₙ(T) → 0` exactly when there is
  a sequence of bounded maps `(Rₙ)` with `rank Rₙ ≤ n` and `‖T-Rₙ‖ → 0`.
- **OI-A26 — Finite rank implies compactness.** Over a proper scalar field, every finite-rank
  bounded map is compact.
- **OI-A27 — Approximability implies compactness.** Over a proper scalar field, every
  operator satisfying the equivalent conditions of `OI-A25` is compact.
- **OI-A28 — Compactness implies approximation on a Hilbert target.** If the target is an
  inner-product space and `T` is compact, then `aₙ(T) → 0`.
- **OI-A29 — Hilbert-target compactness characterization.** With a Hilbert target,
  `T` is compact exactly when `aₙ(T) → 0`.

`OI-A28` places the inner-product structure on the target. The source retains the general
normed-space hypotheses of the approximation-number layer, and the target may be incomplete.

#### Hilbert-space invariance and lower bounds

- **OI-A30 — Adjoint invariance.** Over `RCLike`, `aₙ(T†)=aₙ(T)`.
- **OI-A31 — Modulus invariance.** Over `RCLike`, `aₙ(|T|)=aₙ(T)`, with the modulus supplied
  by `PolarDecomposition`.
- **OI-A32 — Coercive-subspace lower bound.** If a subspace `V` has rank greater than `n`
  and `‖Tx‖ ≥ c‖x‖` for every `x ∈ V`, then `c ≤ aₙ(T)`.
- **OI-A33 — Unit-vector lower-bound form.** The conclusion of `OI-A32` follows from the
  corresponding lower bound on the unit vectors of `V`.
- **OI-A34 — Independent-family lower-bound form.** The conclusion of `OI-A32` follows when
  `V` is the span of `n+1` linearly independent vectors on which the same uniform lower bound
  holds.

#### Min–max formulations

- **OI-A35 — Orthogonal-tail min–max equality.** On a complete source Hilbert space,
  `aₙ(T)` equals the infimum over subspaces `V` of dimension at most `n` of the operator norm
  of `T` on `V⊥`.
- **OI-A36 — Dimension cutoff.** If `n` is at least the source dimension, the orthogonal-tail
  value in `OI-A35` is `0`.
- **OI-A37 — Closed-unit-ball formulation.** For each candidate `V`, the tail norm in
  `OI-A35` is the supremum of `‖Tx‖` over `x ∈ V⊥` with `‖x‖ ≤ 1`.
- **OI-A38 — Pair-level min–max localization property.** Define the property that every
  strict lower bound `r<aₙ(T)` is improved by a uniform lower bound on the span of `n+1`
  linearly independent vectors.
- **OI-A39 — Converse min–max localization.** Every Hilbert-space pair over `RCLike`
  satisfies the property in `OI-A38`.
- **OI-A40 — Finite-restriction supremum.** `aₙ(T)` is the least upper bound of the lower
  bounds obtained from the `(n+1)`-generated finite restrictions in `OI-A38`.

#### Ky Fan gauges and finite-dimensional identification

- **OI-A41 — First Ky Fan gauge.** `K₁(T)=‖T‖`.
- **OI-A42 — Ky Fan homogeneity.** `Kₖ(cT)=‖c‖Kₖ(T)`.
- **OI-A43 — Ky Fan two-sided ideal inequality.**
  `Kₖ(ATB) ≤ ‖A‖ Kₖ(T) ‖B‖`.
- **OI-A44 — Ky Fan adjoint invariance.** `Kₖ(T†)=Kₖ(T)`.
- **OI-A45 — Ky Fan lower comparison.** If `0<k`, then `‖T‖ ≤ Kₖ(T)`.
- **OI-A46 — Ky Fan upper comparison.** `Kₖ(T) ≤ k‖T‖`.
- **OI-A47 — Pair-local Ky Fan triangle inequality.** On a pair satisfying `OI-A38`,
  `Kₖ(S+T) ≤ Kₖ(S)+Kₖ(T)`.
- **OI-A48 — Ky Fan triangle inequality.** Over every `RCLike` Hilbert-space pair,
  `Kₖ(S+T) ≤ Kₖ(S)+Kₖ(T)`.
- **OI-A49 — Eckart–Young identification.** In finite-dimensional Hilbert spaces,
  `aₙ(T)=σₙ(T)` for every `n`, including the zero tail past the source dimension.
- **OI-A50 — Weyl singular-value perturbation bound.** In finite dimension,
  `|σₙ(T)-σₙ(S)| ≤ ‖T-S‖`.

#### Acceptance theorems

- **OI-A51 — Identity example.** For a finite-dimensional identity map, `aₙ(id)=1` below the
  dimension and `aₙ(id)=0` at and above the dimension.
- **OI-A52 — Projection example.** A rank-`r` orthogonal projection has exactly `r`
  approximation numbers equal to `1` and the remaining terms equal to `0`.
- **OI-A53 — Rectangular diagonal example.** A finite rectangular diagonal map has
  approximation numbers equal to its diagonal magnitudes arranged in decreasing order,
  including unequal source and target dimensions.
- **OI-A54 — Finite diagonal min–max example.** For a finite diagonal map, the minimizer in
  `OI-A35` is the span of the largest singular directions and the value is the next singular
  value.
- **OI-A55 — Infinite diagonal tail formula.** For a diagonal operator on
  `ℓ²(ℕ,𝕜)` with antitone nonnegative coefficients `(dₙ)`, `aₙ(T)=sup_{m≥n} dₘ`.
- **OI-A56 — Infinite diagonal convergence example.** If the coefficients in `OI-A55` tend
  to `0`, then `aₙ(T) → 0` and `T` is compact.

**Milestone A1 — Eckart–Young.** `OI-A49`–`OI-A50`.

**Milestone A2 — Ky Fan triangle inequality.** `OI-A47`–`OI-A48`.

**Milestone A3 — compactness and approximability on Hilbert targets.** `OI-A28`–`OI-A29`.

### Part B — symmetric operator ideals and Schatten norms

**Objects.** An operator-ideal family assigns an `ℝ≥0∞` gauge to bounded maps between every
pair of Hilbert spaces and carries subadditivity, absolute homogeneity, domination of the
operator norm, and the two-sided ideal inequality. A symmetric family adds adjoint
invariance on the diagonal universe. A symmetric gauge is a normalized permutation-invariant
monotone sublinear gauge on finitely supported nonnegative sequences.

#### Ideal-family interface

- **OI-B01 — Operator-ideal family.** Define a rectangular family of `ℝ≥0∞` gauges with the
  four laws: subadditivity, absolute homogeneity, domination of operator norm, and the
  two-sided composition inequality.
- **OI-B02 — Symmetric operator-ideal family.** Define the diagonal specialization of
  `OI-B01` together with adjoint invariance.
- **OI-B03 — Finite-gauge ideal.** For a family `Φ`, the bounded maps with `Φ(T)<∞` form a
  submodule.
- **OI-B04 — Ideal carrier.** Define the type of finite-gauge operators with norm given by
  the finite real value of the family gauge.
- **OI-B05 — Zero gauge.** Every operator-ideal family satisfies `Φ(0)=0`.
- **OI-B06 — Definiteness.** If `Φ(T)=0`, then `T=0`.
- **OI-B07 — Negation invariance.** `Φ(-T)=Φ(T)`.
- **OI-B08 — Finite-sum subadditivity.** The gauge of a finite sum is at most the sum of the
  gauges.
- **OI-B09 — Left composition bound.** `Φ(AT) ≤ ‖A‖ Φ(T)`.
- **OI-B10 — Right composition bound.** `Φ(TB) ≤ Φ(T) ‖B‖`.
- **OI-B11 — Contractive composition.** Composition on either side by contractions has gauge at most the
  original gauge.
- **OI-B12 — Family extensionality.** Two operator-ideal families are equal when their gauges
  agree on every Hilbert-space pair and every bounded map.
- **OI-B13 — Ideal closure under addition.** Finite-gauge operators are closed under
  addition.
- **OI-B14 — Ideal closure under scalar multiplication.** Finite-gauge operators are closed
  under scalar multiplication.
- **OI-B15 — Ideal closure under outer composition.** Finite-gauge operators remain in the
  ideal after bounded composition on either side.
- **OI-B16 — Ideal normed-space structure.** The carrier in `OI-B04` is a normed space with
  `‖T‖ = Φ(T).toReal`.
- **OI-B17 — Lossless finite-gauge norm.** For a finite-gauge operator,
  `ENNReal.ofReal ‖T‖ = Φ(T)` under the ideal norm.
- **OI-B18 — Contractive inclusion.** The inclusion of the ideal carrier into bounded
  operators has operator norm at most `1`.
- **OI-B19 — Completeness property.** Define the property that the normed ideal carrier of a
  family is complete on every Hilbert-space pair.
- **OI-B20 — Operator-norm family completeness.** The operator-norm ideal family satisfies
  `OI-B19`.
- **OI-B21 — Ky Fan family completeness.** Every finite Ky Fan family satisfies `OI-B19`.
- **OI-B22 — Hilbert–Schmidt family completeness.** The Hilbert–Schmidt family satisfies
  `OI-B19` over `RCLike`.
- **OI-B23 — Trace-class family completeness.** The trace-class family satisfies `OI-B19`.
- **OI-B24 — Finite Schatten family completeness.** Every finite-exponent Schatten family
  with `1≤p` satisfies `OI-B19`.

#### Concrete families and Hilbert–Schmidt energy

- **OI-B25 — Operator-norm family.** Construct the family with gauge `Φ(T)=‖T‖`.
- **OI-B26 — Operator-norm carrier.** The finite-gauge carrier of `OI-B25` is the whole space
  of bounded operators.
- **OI-B27 — Ky Fan family.** For `0<k`, construct the family with gauge `Kₖ(T)`.
- **OI-B28 — Ky Fan carrier.** The finite-gauge carrier of every family in `OI-B27` is the
  whole space of bounded operators.
- **OI-B29 — Nuclear gauge.** Define `ν(T)=∑' n, aₙ(T)` in `ℝ≥0∞`.
- **OI-B30 — Trace-class family.** Construct the operator-ideal family whose gauge is
  `OI-B29`.
- **OI-B31 — Bounded non-trace-class operator.** On an infinite-dimensional Hilbert space,
  there exists a bounded operator with infinite nuclear gauge.
- **OI-B32 — Hilbert–Schmidt energy.** For a Hilbert basis `(bᵢ)`, define
  `E_b(T)=∑' i, ‖Tbᵢ‖ₑ²` in `ℝ≥0∞`.
- **OI-B33 — Parseval expansion for Hilbert–Schmidt energy.** The energy in `OI-B32` admits
  the Parseval expansion obtained by expressing each column in any orthonormal basis of the
  target.
- **OI-B34 — Adjoint energy swap.** For bases of source and target,
  `E_b(T)=E_c(T†)`.
- **OI-B35 — Basis independence.** `E_b(T)` is independent of the Hilbert basis `b`.
- **OI-B36 — Hilbert–Schmidt norm.** Define the Hilbert–Schmidt norm as the square root of
  the finite value of `E_b(T)` on finite-energy operators.
- **OI-B37 — Minkowski for unconditional `ℝ≥0∞` sums.** For `1≤p`, the `ℓᵖ` Minkowski
  inequality extends to a total `tsum` inequality in `ℝ≥0∞`.
- **OI-B38 — Hilbert–Schmidt domination.** `‖T‖ ≤ ‖T‖_{HS}` for every finite-energy `T`.
- **OI-B39 — Hilbert–Schmidt adjoint invariance.** `‖T†‖_{HS}=‖T‖_{HS}`.
- **OI-B40 — Hilbert–Schmidt ideal inequality.**
  `‖ATB‖_{HS} ≤ ‖A‖ ‖T‖_{HS} ‖B‖`.
- **OI-B41 — Hilbert–Schmidt family.** Construct the operator-ideal family determined by the
  Hilbert–Schmidt norm.

#### Ky Fan dominance and finite-dimensional Schatten norms

- **OI-B42 — Ky Fan dominance property.** Define the property that `Kₖ(A)≤Kₖ(B)` for every
  `k` implies `Φ(A)≤Φ(B)`.
- **OI-B43 — Membership transport under Ky Fan dominance.** A Ky Fan dominant family carries
  finite-gauge membership from `B` to `A` whenever all Ky Fan prefixes of `A` are bounded by
  those of `B`.
- **OI-B44 — Operator-norm Ky Fan dominance.** The operator-norm family is Ky Fan dominant.
- **OI-B45 — Ky Fan family dominance.** Every finite Ky Fan family is Ky Fan dominant.
- **OI-B46 — Trace-class Ky Fan dominance.** The trace-class family is Ky Fan dominant.
- **OI-B47 — Finite-dimensional Schatten norm.** For real `p≥1`, define the rectangular
  unitarily invariant norm `(∑ᵢ σᵢ(T)^p)^(1/p)`.
- **OI-B48 — Schatten triangle inequality.** The norm in `OI-B47` is subadditive.
- **OI-B49 — Schatten definiteness.** The norm in `OI-B47` vanishes exactly at the zero
  operator.
- **OI-B50 — Schatten adjoint invariance.** `‖T†‖_p=‖T‖_p`.
- **OI-B51 — Schatten ideal inequalities.** The finite-dimensional Schatten norm satisfies
  the left, right, and two-sided ideal bounds.
- **OI-B52 — Nuclear endpoint.** In finite dimension, the `p=1` Schatten norm equals the
  nuclear norm.
- **OI-B53 — Operator-norm endpoint.** The `p=∞` endpoint equals the operator norm.
- **OI-B54 — Frobenius endpoint.** The `p=2` Schatten norm equals the rectangular Frobenius
  seminorm from `Majorization`.
- **OI-B55 — Finite-dimensional energy identity.** In finite dimension,
  `E_b(T)=ENNReal.ofReal(‖T‖_F²)`.

#### Symmetric gauges and induced ideal families

- **OI-B56 — Symmetric gauge.** Define a gauge `Φ` on finitely supported nonnegative
  sequences that is subadditive, positively homogeneous, permutation invariant, monotone,
  and normalized by `Φ(e₀)=1`.
- **OI-B57 — Supremum lower bound for a symmetric gauge.**
  `supₙ aₙ ≤ Φ(a)` for every finitely supported nonnegative sequence `a`.
- **OI-B58 — Sum upper bound for a symmetric gauge.**
  `Φ(a) ≤ ∑ₙ aₙ` for every finitely supported nonnegative sequence `a`.
- **OI-B59 — Extension to arbitrary sequences.** Define
  `Φ∞(a)=sup {Φ(b) : b finitely supported, b≤a}` with values in `ℝ≥0∞`.
- **OI-B60 — Initial truncation formula.** If `a` is antitone, then
  `Φ∞(a)=sup_N Φ(a restricted to {0,…,N-1})`.
- **OI-B61 — Monotonicity of the extension.** If `a≤b`, then `Φ∞(a)≤Φ∞(b)`.
- **OI-B62 — Homogeneity of the extension.** For `c≥0`, `Φ∞(ca)=cΦ∞(a)`.
- **OI-B63 — Subadditivity of the extension.** `Φ∞(a+b)≤Φ∞(a)+Φ∞(b)`.
- **OI-B64 — Symmetric-gauge ideal family.** For `RCLike 𝕜`, construct the rectangular
  operator-ideal family induced by `Φ`.
- **OI-B65 — Induced gauge formula.** The family in `OI-B64` has gauge
  `T ↦ Φ∞(n ↦ aₙ(T))`.
- **OI-B66 — Induced-family subadditivity.** The gauge in `OI-B65` is subadditive.
- **OI-B67 — Induced-family homogeneity.** The gauge in `OI-B65` is absolutely homogeneous.
- **OI-B68 — Induced-family operator-norm domination.** `‖T‖≤Φ∞(a(T))`.
- **OI-B69 — Induced-family composition bound.** The gauge in `OI-B65` satisfies the
  two-sided ideal inequality.
- **OI-B70 — Cross-universe adjoint invariance.** The rectangular induced gauge of `T†`
  equals that of `T` after exchanging source and target universes.
- **OI-B71 — Symmetric diagonal view.** Package `OI-B70` as a symmetric operator-ideal family
  on the diagonal universe.
- **OI-B72 — Injectivity on antitone sequences.** Equality of two induced families forces
  equality of the corresponding extended gauges on every antitone sequence.
- **OI-B73 — Approximation-number membership invariance.** Operators with the same
  approximation-number sequence have the same finite-gauge membership in every induced
  symmetric-gauge family.

#### Ky Fan transfer and infinite-dimensional Schatten families

- **OI-B74 — Symmetric-gauge weak-majorization transfer.** For antitone nonnegative
  sequences `a,b`, if every prefix sum of `a` is at most the corresponding prefix sum of
  `b`, then `Φ∞(a)≤Φ∞(b)`.
- **OI-B75 — Induced-family Ky Fan dominance.** Every symmetric-gauge family from `OI-B64`
  satisfies `OI-B42`.
- **OI-B76 — Schatten symmetric gauge.** For every finite real `p≥1`, define
  `Φ_p(a)=(∑ aₙ^p)^(1/p)` as a symmetric gauge.
- **OI-B77 — Schatten gauge laws.** `OI-B76` satisfies subadditivity, positive homogeneity,
  permutation invariance, monotonicity, and normalization.
- **OI-B78 — Finite-exponent Schatten family.** Define the rectangular family induced from
  `OI-B76`.
- **OI-B79 — Finite-exponent symmetric Schatten family.** Package the diagonal
  adjoint-invariant view of `OI-B78`.
- **OI-B80 — Infinite-exponent Schatten family.** Define the rectangular `p=∞` family with
  gauge `‖T‖`.
- **OI-B81 — Infinite-exponent symmetric Schatten family.** Package the diagonal
  adjoint-invariant view of `OI-B80`.
- **OI-B82 — Infinite-endpoint approximation-number formula.** The gauge of `OI-B80` equals
  `supₙ aₙ(T)`.
- **OI-B83 — Trace-class endpoint.** The finite-exponent family at `p=1` equals the
  trace-class family.
- **OI-B84 — Hilbert–Schmidt endpoint.** The finite-exponent family at `p=2` has the
  Hilbert–Schmidt gauge.
- **OI-B85 — Operator-norm endpoint family.** The infinite-exponent family equals the
  operator-norm family.
- **OI-B86 — Endpoint symmetry.** The corresponding diagonal symmetric families agree at
  the three endpoints in `OI-B83`–`OI-B85`.
- **OI-B87 — Schatten scale monotonicity.** If `1≤p≤q`, then `Φ_q(T)≤Φ_p(T)`.
- **OI-B88 — Schatten ideal inclusion.** If `1≤p≤q`, then `S_p⊆S_q`.
- **OI-B89 — Strict Schatten inclusions.** For `p<q`, an intermediate-power diagonal
  operator witnesses strictness of `S_p⊆S_q`.
- **OI-B90 — Hilbert–Schmidt reconciliation.** For every Hilbert basis `b`,
  `∑' n, aₙ(T)² = E_b(T)` in `ℝ≥0∞`.

#### Orthogonal block sums

- **OI-B91 — Approximation numbers of a block sum.** For a block-diagonal operator on
  orthogonal source and target decompositions, its approximation-number sequence is the
  decreasing rearrangement of the union of the block sequences.
- **OI-B92 — Symmetric-gauge block formula.** Every symmetric gauge applied to a block sum is
  the same gauge applied to the decreasing rearrangement in `OI-B91`.
- **OI-B93 — Block lower bound.** For two blocks,
  `max(Φ(T₁),Φ(T₂)) ≤ Φ(T₁⊕T₂)`.
- **OI-B94 — Block upper bound.** For two blocks,
  `Φ(T₁⊕T₂) ≤ Φ(T₁)+Φ(T₂)`.

**Milestone B1 — symmetric gauges and induced families.** `OI-B56`–`OI-B73`.

**Milestone B2 — Ky Fan dominance.** `OI-B74`–`OI-B75`.

**Milestone B3 — Schatten families and reconciliation.** `OI-B76`–`OI-B90`.

**Milestone B4 — orthogonal block sums.** `OI-B91`–`OI-B94`.

### Part C — Hilbert–Schmidt operators as an `ℓ²` space of columns

**Objects.** For a Hilbert basis `(bᵢ)` of the source, the column family of `T` is
`i ↦ Tbᵢ`. An `ℓ²` family `(fᵢ)` represents the bounded operator
`x ↦ ∑' i, ⟪bᵢ,x⟫ fᵢ`.

- **OI-C01 — Column family.** Define the columns `i ↦ Tbᵢ` of a bounded operator relative to
  a Hilbert basis.
- **OI-C02 — Operator represented by `ℓ²` columns.** For `f ∈ ℓ²(ι,E)`, define the bounded
  operator `x ↦ ∑' i, ⟪bᵢ,x⟫ fᵢ`.
- **OI-C03 — Column membership characterization.** The column family of `T` belongs to `ℓ²`
  exactly when `E_b(T)<∞`.
- **OI-C04 — Column summability characterization.** The condition in `OI-C03` is equivalent
  to summability of `i ↦ ‖Tbᵢ‖²`.
- **OI-C05 — Columns of the represented operator.** The column family of the operator in
  `OI-C02` is `f`.
- **OI-C06 — Reconstruction from columns.** Every finite-energy operator equals the operator
  represented by its `ℓ²` column family.
- **OI-C07 — Injectivity of column representation.** Two `ℓ²` column families representing
  the same bounded operator are equal.
- **OI-C08 — Unique column representative.** Every finite-energy operator has a unique
  `ℓ²` column representative relative to `b`.
- **OI-C09 — Linearity of column representation.** The map `f ↦ T_f` from `OI-C02` is linear.
- **OI-C10 — Operator-norm bound.** `‖T_f‖≤‖f‖₂`.
- **OI-C11 — Hilbert–Schmidt norm identity.**
  `‖f‖₂² = ∑' i, ‖T_f bᵢ‖²`.
- **OI-C12 — Energy identity.** The `ℝ≥0∞` energy of `T_f` equals the extended square of the
  `ℓ²` norm of `f`.
- **OI-C13 — Continuity of column representation.** The linear map `f ↦ T_f` is bounded.
- **OI-C14 — Hilbert–Schmidt operators are compact.** If `E_b(T)<∞`, then `T` is compact.
- **OI-C15 — Left isometric invariance.** If `U` preserves norms, then
  `E_b(UT)=E_b(T)`.
- **OI-C16 — Right coisometric invariance.** If `V†` preserves norms, then
  `‖TV‖_{HS}=‖T‖_{HS}`.
- **OI-C17 — Two-sided isometric conjugation.** Under the hypotheses of `OI-C15` and
  `OI-C16`, `‖UTV‖_{HS}=‖T‖_{HS}`.
- **OI-C18 — Left Pythagoras.** If `(P_j)` satisfies
  `∑' j, ‖P_jv‖ₑ²=‖v‖ₑ²` for every `v`, then
  `∑' j, E_b(P_jT)=E_b(T)`.
- **OI-C19 — Right Pythagoras.** The analogous pointwise norm splitting on the source side
  splits Hilbert–Schmidt energy under right composition.
- **OI-C20 — Joint Pythagoras.** Independent pointwise norm splittings on source and target
  give the corresponding double-sum decomposition of Hilbert–Schmidt energy.

The representation `OI-C02` identifies the finite-energy operators with an `ℓ²` column
model. Its norm and energy identities `OI-C11`–`OI-C12` connect that model to the
Hilbert–Schmidt family from Part B.

**Milestone C1 — isometric conjugation.** `OI-C15`–`OI-C17`.

**Milestone C2 — Pythagoras along orthogonal families.** `OI-C18`–`OI-C20`.

## Worked examples (acceptance criteria)

### Part A

The acceptance examples are `OI-A51`–`OI-A56`, together with the rank-vanishing theorem
`OI-A23` on an explicit finite-rank map.

### Part B

The operator-norm and Ky Fan carriers are `OI-B26` and `OI-B28`. The trace-class boundary is
witnessed by `OI-B31`. The concrete family constructions are `OI-B25`, `OI-B27`, `OI-B30`,
and `OI-B41`.

### Part C

The column model is identified with the basis-independent energy by `OI-C03`, `OI-B35`, and
`OI-C12`. Its bounded representation map is `OI-C09`–`OI-C13`.

## Ordering

Part A consumes the modulus and finite-dimensional singular-value theory from
[`PolarDecomposition`](../PolarDecomposition/README.md) and the finite-dimensional Ky Fan
inequality from [`Majorization`](../Majorization/README.md). Part B consumes Part A and the
majorization engine. Part C consumes the Hilbert–Schmidt energy and ideal theory from Part B,
together with Mathlib's `lp` and `HilbertBasis` APIs.

The Peter–Weyl roadmap
[`RepresentationTheory/CompactGroups`](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/RepresentationTheory/CompactGroups/README.md)
consumes the Hilbert–Schmidt operator API `OI-C01`–`OI-C14` and the compactness conclusion
`OI-C14`.

## Definitions

**D1 (`OI-B59`, `OI-B60`).** The extension of a symmetric gauge is
`Φ∞(a)=sup {Φ(b) : b finitely supported, b≤a}`. For antitone `a`, it is the supremum of the
values on the initial truncations.

**D2 (`OI-B64`, `OI-B65`).** The ideal family induced by a symmetric gauge has gauge
`T ↦ Φ∞(n ↦ aₙ(T))`.

**D3 (`OI-B76`).** For `1≤p<∞`, the `ℓᵖ` symmetric gauge is
`Φ_p(a)=(∑ aₙ^p)^(1/p)`.

**D4 (`OI-B80`, `OI-B82`).** The `p=∞` family has gauge `‖T‖`, equivalently `supₙ aₙ(T)`.

**D5 (`OI-B47`).** The finite-dimensional Schatten `p`-norm is
`(∑_{i<dim E} σᵢ(T)^p)^(1/p)`.

**D6 (`OI-C02`).** An `ℓ²` column family `(fᵢ)` represents the operator
`x ↦ ∑' i, ⟪bᵢ,x⟫ fᵢ`.

## References

- A. Pietsch, *Operator Ideals*, North-Holland, 1980; *Eigenvalues and s-Numbers*, Cambridge
  Studies in Advanced Mathematics 13, 1987.
- I. C. Gohberg and M. G. Kreĭn, *Introduction to the Theory of Linear Nonselfadjoint
  Operators in Hilbert Space*, AMS Translations of Mathematical Monographs 18, 1969.
- B. Simon, *Trace Ideals and Their Applications*, 2nd ed., AMS, 2005; M. Reed and B. Simon,
  *Methods of Modern Mathematical Physics I* — the Hilbert–Schmidt class as `ℓ²` of columns.
- R. Bhatia, *Matrix Analysis*, GTM 169, Springer, 1997 — Ky Fan inequalities and
  majorization.
- C. Eckart and G. Young, "The approximation of one matrix by another of lower rank",
  *Psychometrika* **1** (1936), 211–218; L. Mirsky, "Symmetric gauge functions and unitarily
  invariant norms", *Quart. J. Math.* **11** (1960), 50–59.
- R. A. Horn and C. R. Johnson, *Matrix Analysis*, 2nd ed., Cambridge, 2013, Thm. 4.2.6.
- M. Ullrich, "Inequalities between s-numbers", *Adv. Oper. Theory* **9** (2024), art. 75.

## Acknowledgements

An Apache-2.0 implementation of nearly all of the above exists in the AIQ DKPS
[formalization repository](https://github.com/AIQ-Kitware/aiq-dkps-formalization) under
`ForTauCeti/` (namespaces `TauCeti.*` and `ContinuousLinearMap.*`), Copyright Kitware, Inc.,
with per-module provenance headers. The public API and proof structure may change during
integration.

Part A's elementary layer was adapted in part from Mathlib PR
[#32126](https://github.com/leanprover-community/mathlib4/pull/32126) and developed further
for spectral perturbation theory; migration must preserve provenance, authorship and
licensing while allowing review to improve the public API.
