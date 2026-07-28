# Roadmap: approximation numbers and Hilbert-space singular values

Approximation numbers measure how well a bounded linear operator can be
approximated in operator norm by operators of bounded rank.  For
`T : E →L[𝕜] F`, the zero-based approximation number is

```text
aₙ(T) = inf { ‖T - R‖ : rank R ≤ n }.
```

They are defined on general normed spaces, while on finite-dimensional Hilbert
spaces they coincide with the usual zero-based singular values.  This roadmap
builds the complete reusable API connecting those two viewpoints: 

* the field-generic approximation-number theory,
* its behavior under addition and composition,
* its relation to finite rank and compact approximation,
* adjoint invariance,
* its identification with singular values in finite dimensions (Eckart--Young),
* and its relation to subspaces via the finite-dimensional min--max formula (Courant--Fischer).


Suggested homes:

```text
TauCeti/Analysis/OperatorIdeal/ApproximationNumber/
TauCeti/Analysis/InnerProductSpace/OperatorModulus.lean
TauCeti/Analysis/InnerProductSpace/CourantFischer.lean
```

`Suggested.lean` gives prototype signatures.  The markdown specification is
definitive; the prototypes are neither exhaustive nor prescriptive about proof
architecture.

## Generality and pinned conventions

### Zero-based indexing

The primitive is indexed from zero:

```text
aₙ(T) = dist(T, {R : rank R ≤ n}).
```

Thus `a₀(T) = ‖T‖`, and the finite-dimensional identification is exactly
`aₙ(T) = σₙ(T)` with Mathlib's zero-based singular-value sequence.  The
one-based convention common in parts of the operator-ideal literature is
obtained by the documented translation `sₙ(T) = aₙ₋₁(T)` for `n ≥ 1`; Tau Ceti
does not maintain a duplicate one-based API.

### Real-valued approximation numbers

`approximationNumber T n : ℝ`, accompanied by
`approximationNumber_nonneg`.  This follows Mathlib's primary conventions for
`norm`, `dist`, and finite-dimensional singular values and avoids a parallel
`ℝ≥0` API.  Later operator-ideal gauges may legitimately be `ℝ≥0∞`-valued;
that is a different object, whose value may be infinite off the ideal.

### Rectangular operators and independent universes

The source and target are distinct spaces and may lie in independent universes.
The definition and all field-generic laws are stated for
`T : E →L[𝕜] F`.  Rank comparisons use `LinearMap.rank` and explicit
`Cardinal.lift` lemmas where universes differ.  Square operators are
specializations, not the primitive interface.

### Scalar generality

The approximation-number layer is stated over a
`NontriviallyNormedField 𝕜` and seminormed `𝕜`-spaces whenever the proof uses
only norm and rank.

Adjoint invariance and finite-dimensional singular-value results are stated
over `[RCLike 𝕜]`.  The reusable CFC construction of the operator modulus is
initially complex, because the relevant continuous functional calculus for
Hilbert-space operators is currently registered over `ℂ`.  A real theorem must
not be claimed merely by writing `[RCLike 𝕜]`; it requires a grounded real CFC
or a separately specified complexification argument.

### Namespace and normal forms

The intended public declarations extend `ContinuousLinearMap`, enabling dot
notation such as `T.approximationNumber n`.  This choice must be coordinated
with active Mathlib work before implementation lands.

The approximation number, not a finite-dimensional singular-value expression,
is the normal form for the field-generic theory.  Consequently the
finite-dimensional identification is a named theorem rather than a global
`@[simp]` rule.

## Existing Mathlib material to consume

- **Bounded maps and operator norm:** `ContinuousLinearMap`, `‖T‖`, composition,
  adjoints, and the normed-space structure on bounded maps.
- **Rank:** `LinearMap.rank`, finite-rank lemmas, rank bounds for sums and
  compositions, and `Module.finrank` in finite dimension.
- **Order completeness:** real infima and the `iInf`/`ciInf` API needed for the
  defining distance.
- **Hilbert-space spectral theory:** `ContinuousLinearMap.adjoint`,
  finite-dimensional `LinearMap.singularValues`, self-adjoint eigenvalue
  enumeration, orthogonal projections, and the spectral-theory tools needed
  for the Courant--Fischer formula.
- **Positive square roots:** the continuous functional calculus and `CFC.sqrt`
  on complex Hilbert-space operators, used to define
  `|T| = (T⋆T)^(1/2)` on the source.
- **Compact operators:** `IsCompactOperator` and closure properties for
  finite-rank and norm-limit arguments.

Do not introduce private wrappers around these notions merely to restate a
single hypothesis.

## Related Work

As of 2026-07-27, Mathlib PR
[#32126](https://github.com/leanprover-community/mathlib4/pull/32126) is an open
draft developing a zero-based `ContinuousLinearMap.singularValue` for general
normed spaces, valued in `ℝ≥0`, together with elementary approximation-number
laws and finite-dimensional singular-value identification.

Before implementation begins in Tau Ceti, coordinate with that PR's authors and
Mathlib reviewers.  The acceptable outcomes are:

1. consume the Mathlib API if it lands;
2. help reconcile and land the Mathlib API;
3. develop the missing Tau Ceti layer against the intended Mathlib interface
   while avoiding a competing permanent definition.

The zero-based convention is compatible.  The name and codomain differ from the
current staged Tau Ceti proposal, so they must be resolved before the first code
PR, not by maintaining both APIs.

See also the
[public Mathlib discussion of singular values and approximation numbers](https://leanprover-community.github.io/archive/stream/217875-Is-there-code-for-X%3F/topic/Singular.20Value.20Decomposition.html).

## What is missing

Mathlib does not currently provide a stable, complete approximation-number API
with all of the following in one dependency chain:

- intrinsic characterization by rank-constrained approximants;
- additive and two-sided composition inequalities;
- operator-norm Lipschitz continuity;
- the precise approximable/compact boundary;
- adjoint invariance at Hilbert-space generality;
- a reviewed rectangular modulus API;
- finite-dimensional Eckart--Young at the chosen indexing convention;
- an exact finite-dimensional min--max equality;
- the general infinite-dimensional lower-bound principle used by perturbation
  theory.

This roadmap builds that chain without assuming the later symmetric-ideal
layer.

---

## Part A -- approximation numbers on normed spaces

### A1 -- definition and intrinsic characterization

Define `ContinuousLinearMap.approximationNumber T n : ℝ` as the infimum of
`‖T - R‖` over bounded maps `R` with `R.rank ≤ n`.

Build the complete basic API:

- the exposed `_eq_iInf` characterization;
- `aₙ(T) ≤ ‖T - R‖` for every admissible `R`;
- the universal lower-bound characterization;
- equality when a best rank-`≤ n` approximant is supplied;
- `a₀(T) = ‖T‖`;
- antitonicity in `n`;
- `0 ≤ aₙ(T) ≤ ‖T‖`;
- `aₙ(0) = 0`;
- existence of an admissible approximant within every positive `ε` of the
  infimum.

The definition body should not be a simplifier normal form.  Downstream proofs
should normally use the upper- and lower-bound characterizations.

### A2 -- addition and perturbation continuity

Prove the exact zero-based additive inequality

```text
aₘ₊ₙ(S + T) ≤ aₘ(S) + aₙ(T).
```

Derive:

- `aₙ(S + T) ≤ aₙ(S) + ‖T‖`;
- `|aₙ(S) - aₙ(T)| ≤ ‖S - T‖`;
- continuity of `T ↦ aₙ(T)` in operator norm.

The index `m + n` is part of the pinned zero-based convention; no truncated
subtraction should appear.

### A3 -- ideal inequalities and homogeneity

For composable bounded maps, prove:

```text
aₙ(T ∘ B)       ≤ aₙ(T) ‖B‖,
aₙ(A ∘ T)       ≤ ‖A‖ aₙ(T),
aₙ(A ∘ T ∘ B)   ≤ ‖A‖ aₙ(T) ‖B‖,
aₙ(c • T)        = ‖c‖ aₙ(T).
```

These are the elementary two-sided ideal laws needed by every later operator
ideal.  Any stronger rank-splitting product inequality must be stated and
proved as a separate target rather than hidden behind the phrase
"multiplicativity."

### A4 -- rank, approximability, and compactness

Prove:

- `aₙ(T) = 0` whenever `rank T ≤ n`;
- `aₙ(T) → 0` exactly when `T` is a norm limit of finite-rank operators;
- every such approximable operator is compact;
- on Hilbert spaces, every compact operator is approximable, hence
  `aₙ(T) → 0`.

The final implication is not asserted for arbitrary Banach spaces: compact
operators need not be norm limits of finite-rank operators without an
approximation-property hypothesis.  If Tau Ceti introduces a named
`ApproximableOperator` predicate, it should be justified by multiple consumers;
otherwise state the sequence-of-finite-rank characterization directly.

---

## Part B -- Hilbert-space singular-value theory

### B1 -- adjoint invariance

For real and complex Hilbert spaces, prove

```text
aₙ(T⋆) = aₙ(T).
```

The proof should use rank invariance under adjoint and the isometry of the
adjoint operation.  This theorem may be a simplifier because it removes an
adjoint from the approximation-number expression.

### B2 -- the rectangular modulus over complex Hilbert spaces

For `T : E →L[ℂ] F`, define

```text
|T| = (T⋆ T)^(1/2) : E →L[ℂ] E.
```

Develop the reusable object API, including:

- nonnegativity and self-adjointness;
- `|T| |T| = T⋆T`;
- uniqueness as the nonnegative square root;
- `‖|T|x‖ = ‖Tx‖`;
- `ker |T| = ker T`;
- `‖|T|‖ = ‖T‖`;
- the natural pre- and post-composition norm identities;
- commutation of moduli when the Gram operators commute.

This part does **not** claim a general polar decomposition and does not use one
as an unstated input.  In particular, a general infinite-dimensional theorem
`aₙ(T) = aₙ(|T|)` is not a target here unless the required partial-isometry
infrastructure is separately grounded.  Finite-dimensional singular-value
identification below provides the needed modulus connection in its valid
setting.

### B3 -- finite-dimensional Eckart--Young

For finite-dimensional real or complex inner-product spaces, use Mathlib's
zero-based singular values and prove

```text
aₙ(T) = T.toLinearMap.singularValues n
```

The lower inequality must state that every rank-`≤ n` approximant has error at
least the `n`th singular value.  The upper inequality constructs the truncated
singular approximation.  The theorem must cover rectangular maps and the range
`n ≥ finrank 𝕜 E`, where both sides vanish.

### B4 -- exact finite-dimensional min--max

Prove an exact intrinsic equality, for example in the equivalent orthogonal-tail
form

```text
aₙ(T) = inf { ‖T ∘ P_(V⊥)‖ : finrank V ≤ n }.
```

The final theorem must specify:

- the subspace lies in the source;
- the dimension condition is `finrank V ≤ n` under zero-based indexing;
- the infimum behavior when `n` is at least the source dimension;
- its equivalence with the unit-vector formulation
  `inf_V sup_{x∈V⊥, ‖x‖=1} ‖Tx‖`.

Coordinate-span lemmas and eigenbasis calculations are support lemmas, not a
substitute for this equality.

### B5 -- unconditional infinite-dimensional lower bound

For arbitrary Hilbert spaces, prove:

```text
if rank V > n and c ‖x‖ ≤ ‖Tx‖ for every x ∈ V,
then c ≤ aₙ(T).
```

Also provide the finite-dimensional unit-vector and linearly-independent-family
forms used by applications.  Do not present this one-sided theorem as a full
infinite-dimensional min--max equality.  An upper or equality theorem requires
additional compactness or approximation hypotheses and belongs only after those
hypotheses are stated explicitly.

---

## Acceptance examples

The development is accepted only when its abstractions compute correctly on
concrete operators.

1. **Zero and identity:** all approximation numbers of zero vanish; for the
   identity on an `r`-dimensional Hilbert space, the first `r` approximation
   numbers are one and the rest are zero.
2. **Orthogonal projection:** a rank-`r` orthogonal projection has exactly `r`
   nonzero approximation numbers, all equal to one.
3. **Rectangular diagonal map:** a coordinate map with prescribed nonnegative
   diagonal entries has approximation numbers equal to those entries sorted in
   decreasing order, including unequal source and target dimensions.
4. **Rank cutoff:** an explicit rank-`r` map satisfies `aₙ(T) = 0` for `n ≥ r`.
5. **Min--max:** on a small diagonal matrix, the orthogonal-tail infimum selects
   the span of the largest singular directions and returns the next singular
   value.
6. **Compact Hilbert operator:** a diagonal compact operator with coefficients
   tending to zero has approximation numbers tending to zero.

These examples are theorem-level tests of the API, not merely `#eval` checks.

## Ordering and PR slices

1. **Coordination and conventions:** resolve the relationship with Mathlib
   PR #32126 and confirm the public name/codomain.
2. **A1:** definition and intrinsic characterization.
3. **A2--A3:** additive, Lipschitz, composition, and homogeneity laws.
4. **A4:** finite-rank vanishing and the approximable/compact boundary.
5. **B1:** adjoint invariance.
6. **B3 and Courant--Fischer support:** finite-dimensional Eckart--Young.
7. **B4--B5:** exact finite-dimensional min--max and the general lower-bound
   theorem.
8. **B2:** the reviewed complex rectangular modulus API, if it has not already
   landed independently.

Each PR should be dependency-closed and should not mix a representation
migration in downstream Davis--Kahan code with new Tau Ceti mathematics.

## References

- A. Pietsch, [*Operator Ideals*](https://www.sciencedirect.com/bookseries/north-holland-mathematical-library/vol/20/suppl/C), North-Holland Mathematical Library 20, North-Holland, 1980.

- A. Pietsch, [*Eigenvalues and s-Numbers*](https://openlibrary.org/books/OL2708279M/Eigenvalues_and_s-numbers), Cambridge Studies in Advanced Mathematics 13, Cambridge University Press, 1987.

- I. C. Gohberg and M. G. Kreĭn, [*Introduction to the Theory of Linear Nonselfadjoint Operators in Hilbert Space*](https://bookstore.ams.org/MMONO/18), Translations of Mathematical Monographs 18, American Mathematical Society, 1969.

- R. Bhatia, [*Matrix Analysis*](https://doi.org/10.1007/978-1-4612-0653-8), Graduate Texts in Mathematics 169, Springer, 1997.

- C. Eckart and G. Young, ["The Approximation of One Matrix by Another of Lower Rank"](https://doi.org/10.1007/BF02288367), *Psychometrika* 1(3) (1936), 211--218.

- L. Mirsky, ["Symmetric Gauge Functions and Unitarily Invariant Norms"](https://doi.org/10.1093/qmath/11.1.50), *Quarterly Journal of Mathematics* 11(1) (1960), 50--59.

- M. Ullrich, ["Inequalities between s-Numbers"](https://doi.org/10.1007/s43036-024-00386-x),
  *Advances in Operator Th:contentReference[oaicite:13]{index=13}2.


## Mathlib References

- **Adjoints:** [`ContinuousLinearMap.adjoint`](https://leanprover-community.github.io/mathlib4_docs/Mathlib/Analysis/InnerProductSpace/Adjoint.html).

- **Finite-dimensional singular values:** [`LinearMap.singularValues`](https://leanprover-community.github.io/mathlib4_docs/Mathlib/Analysis/InnerProductSpace/SingularValues.html).

- **Positive square roots:** [`CFC.sqrt`](https://leanprover-community.github.io/mathlib4_docs/Mathlib/Analysis/SpecialFunctions/ContinuousFunctionalCalculus/Rpow/Basic.html).

- **Compact operators:** [`IsCompactOperator`](https://leanprover-community.github.io/mathlib4_docs/Mathlib/Analysis/Normed/Operator/Compact/Basic.html).

- **Rank:** [`LinearMap.rank`](https://leanprover-community.github.io/mathlib4_docs/Mathlib/LinearAlgebra/Dimension/LinearMap.html).

## Provenance and coordination

An implementation of most of Parts A and B exists in the Davis--Kahan
  [formalization repository](https://github.com/AIQ-Kitware/aiq-dkps-formalization) under `ForTauCeti/`.
The base of this work was adapted in part from Mathlib PR #32126 and developed further for
  Davis--Kahan perturbation theory.
