# Matrix spectra: rank factorizations and spectral measurability

Mathlib has the deterministic linear algebra (the Hermitian spectral theorem, `Matrix.rank`,
`Matrix.PosSemidef`), but not the layer above it: nothing bounds a
matrix's Euclidean operator norm by its entries, the sorted eigenvalue indexing
`Matrix.IsHermitian.eigenvalues₀` carries almost no theory, no spectral function of a random
matrix is known to be measurable, and no factorization realizes
`Matrix.rank` as an inner dimension.

A positive
semidefinite matrix of rank at most `d` *is* the Gram matrix of `n` points in `𝕜^d` (Part A —
the multidimensional-scaling embedding step).
Entrywise error on a symmetric matrix controls spectral error, and spectral quantities of a
*random* symmetric matrix are measurable, so probability statements about them are well posed
(Part C).

Suggested home: `TauCeti/LinearAlgebra/Matrix/`,
`TauCeti/Analysis/Matrix/`, with two supporting lemmas in
`TauCeti/MeasureTheory/`.

## Standing conventions

- **Matrices, deliberately.** Part C is about concrete matrices with entrywise
  hypotheses, not abstract operators. This is not a lapse into coordinates: statistical data
  arrives as a matrix, entrywise, and the bounds a statistician can assume are entrywise
  bounds. The abstract operator theory lives in the foundations roadmap; here we build the
  bridge from entries to spectra.
- **Scalar fields, pinned per Part.** Rank factorization (Part A) over an arbitrary `Field`;
  the Gram/positive-semidefinite factorization over `RCLike`. Part C is developed over `ℝ`
  for real symmetric matrices; the `RCLike` form of the norm comparisons is an explicit
  Part C milestone, never a silent assumption.
- **Sorted eigenvalues: transport, never re-prove.** The decreasing indexing is Mathlib's
  `Matrix.IsHermitian.eigenvalues₀` for matrices and `LinearMap.IsSymmetric.eigenvalues` for
  operators. Facts stated upstream for the matrix-indexed `eigenvalues` are *transported*
  along the defining index equivalence.
- **Inner dimensions are `Fin r`, not a subtype.** A caller who wants "at most `d` rows" gets
  `Fin d` directly, with the `≤`-relaxed form stated beside the exact-rank form, so no
  cardinality-equivalence transport is ever needed at a use site.
- **No new predicates for one-line bounds.** Entrywise control is the hypothesis
  `∀ i j, |A i j| ≤ ε`, and operator control at `LinearMap` level is `∀ x, ‖T x‖ ≤ C * ‖x‖`,
  carried directly in the style of Mathlib's `norm_cfc_le` — never wrapped in a named
  predicate or an ad-hoc sup norm.

## What Mathlib already has (consume)

- **Matrix linear algebra:** `Matrix.rank` with `rank_mul_le` and the column-space API;
  `Matrix.PosSemidef` with `posSemidef_conjTranspose_mul_self` and
  `rank_conjTranspose_mul_self`; `Matrix.IsHermitian.spectral_theorem`, `eigenvalues`,
  `eigenvectorUnitary`; `Matrix.toEuclideanLin` and the `ℓ²` operator-norm API.
- **Two gaps.** (1) There is **no entrywise-to-operator-norm comparison**:
  nothing bounds `‖toEuclideanLin A‖` by entrywise control of `A`. (2) The sorted indexing
  **`Matrix.IsHermitian.eigenvalues₀` carries almost no theory**: it is the primitive from
  which `eigenvalues` is *defined*, yet upstream it has only `eigenvalues₀_antitone` and the
  characteristic-polynomial identities, while the rank count and positivity are stated only
  for `eigenvalues`. Any "top-`k` eigenvalues" statement needs the sorted indexing, so both
  gaps are prerequisites for the statistics rather than conveniences.
- **Spectral theory of operators:** `LinearMap.IsSymmetric.eigenvalues` / `eigenvectorBasis`
  and `Matrix.isSymmetric_toEuclideanLin_iff` — the bridge Part C's sorted eigenvalues sit on.
- **Approximation:** Stone–Weierstrass, `Polynomial.aeval` on matrices with `continuous_aeval`,
  and the Borel-space constructions — the ingredients of Part C's measurability argument.

Everything below is absent upstream.

---

## What is missing (build here)

* Rank factorization through `Fin r` as an iff, the positive-semidefinite Gram factorization
  behind multidimensional scaling, and their uniqueness statements — up to `GL` for general
  factors, up to a left unitary for Gram factors.
* A `MeasurableSpace` instance for `Matrix`, which Mathlib lacks entirely, and the
  measurability of spectral functions of a random matrix.
* Sorted eigenvalues of a Hermitian matrix with the entrywise-to-spectral bridge, and the
  `RCLike` norm comparisons that carry it to complex Hermitian matrices.

## The build, in layers

### Part A — rank factorization and positive-semidefinite Gram factorization

The multidimensional-scaling embedding step.

**Objects.** Factorizations `M = L * R` through `Fin r`, and Gram factorizations `B = Aᴴ * A`
with a prescribed number of rows.

**API to develop.**

- The **exact rank factorization**: every `M : Matrix m n 𝕜` over a field factors with inner
  dimension exactly `Fin M.rank`, with `L` listing a basis of the column space and `R` the
  coordinates of each column; and the zero-padded form for any `r ≥ M.rank`.
- The **entrywise spectral expansion** `B i j = Σ_k λ_k · U i k · conj (U j k)` and from it the
  **square Gram factorization** `A = √D · Uᴴ`, then the **rank-controlled factor**: compress
  through the rank factorization and absorb the leftover Gram factor by a second square
  factorization.

**Milestone A1 — the two characterizations.** Both are iffs, and that is the point: the easy
converse (`rank (L * R) ≤ r`; `Aᴴ * A` is positive semidefinite of rank `≤ d`) is what makes
them usable as characterizations rather than constructions.

```lean
theorem rank_le_iff_exists_eq_mul (M : Matrix m n 𝕜) (r : ℕ) :
    M.rank ≤ r ↔ ∃ (L : Matrix m (Fin r) 𝕜) (R : Matrix (Fin r) n 𝕜), M = L * R

-- over `[RCLike 𝕜]`: a PSD matrix of rank ≤ d is the Gram matrix of n points in 𝕜^d
theorem posSemidef_and_rank_le_iff_exists_conjTranspose_mul_self
    {n d : ℕ} (B : Matrix (Fin n) (Fin n) 𝕜) :
    (B.PosSemidef ∧ B.rank ≤ d) ↔ ∃ A : Matrix (Fin d) (Fin n) 𝕜, B = Aᴴ * A
```

**Milestone A2 — uniqueness up to the obvious action**, the difference between a
factorization theorem and an existence lemma. Two statements, whose acting groups differ:

- **rank factorization at the exact rank**: the factors are unique up to a change of basis of
  the intermediate space, `L' = L g` and `R' = g⁻¹ R` for some `g ∈ GL (Fin r) 𝕜`;
- **Gram factorization**: unique up to a *left unitary*, at a fixed factor size and with no
  rank hypothesis.

They are one milestone because they are the two uniqueness statements of the same Part and
share an idea — the factor is determined by its Gram data up to the symmetry group of the
intermediate space — but the groups differ, because the second remembers an inner product and
the first does not; the general-field statement carries no unitary.

**Only the minimal-rank case is claimed.** At `r > M.rank` the factors are *not* unique up to
`GL (Fin r) 𝕜` — the extra columns are unconstrained — so the statement carries `r = M.rank`
and not the `≤ r` of Milestone A1.

**The multidimensional-scaling consumer fixes the second statement's shape.** Classical scaling
recovers points from a Gram matrix, and the recovered configuration is meaningful only up to a
rigid motion; `A' = U A` is exactly that indeterminacy. A statement quantified the other way —
a unitary on the `n` side — would be false.

**Decided.** Existence over the group rather than a quotient type; there is no quotient object
here and inventing one would be a second, unasked-for design. Minimal rank only.
**Open.** Whether the Gram statement wants `Matrix.unitaryGroup` or a bundled
`LinearIsometryEquiv`. That depends on which the eventual consumer holds, and there is no
consumer yet.

### Part C — matrix spectra and spectral measurability

Everything else in this family is about abstract operators; this Part is about matrices, and
about matrices whose entries are random.

**Objects.** Real symmetric matrices as Euclidean operators (`Matrix.toEuclideanLin`, with
symmetry through `Matrix.isSymmetric_toEuclideanLin_iff`); the decreasingly sorted spectrum
`sortedEigenvalues`; the spectral `h`-transform `specTransform h hB = Σ_k h(λ_k) u_k u_kᵀ`.

**API to develop.**

- **Norm comparisons** (the first Mathlib gap): `∑ᵢ ‖xᵢ‖ ≤ √card · ‖x‖` on `EuclideanSpace`,
  and `∀ i j, ‖A i j‖ ≤ ε` gives `‖toEuclideanLin A x‖ ≤ n · ε · ‖x‖`. The factor `n` is what
  a statistician pays and must stay visible.

  The first of these is naturally `RCLike`-generic; the second should be too, and stating it
  that way is the open half of Milestone C1. It costs no new mathematics — Cauchy–Schwarz and
  the triangle inequality are field-generic — but it is not a rename either: the real proof
  uses absolute values and `Real`-specific order lemmas where the general one needs norms.
  Two consequences are decisions rather than bookkeeping: the entrywise hypothesis becomes a
  bound on `‖A i j‖`, so **complex Hermitian matrices are covered by the same statement**, and
  **both constants survive unchanged**, which a complexification argument would not have
  managed. No conjugation is involved: in the pinned Mathlib, `toEuclideanLin` is `𝕜`-linear
  and reduces to plain matrix–vector multiplication, with conjugation entering only the
  adjoint, which this bound never touches.

  The eigenvalue statements of Part C stay real for now: `sortedEigenvalues` is built on
  `LinearMap.IsSymmetric.eigenvalues`, and generalizing the *spectral* layer is a different and
  larger question than generalizing one norm inequality.
- **Entrywise eigenvalue perturbation**: Weyl's inequality, consumed from the foundations
  roadmap, composed with the comparison gives that entrywise `ε`-close symmetric matrices have
  sorted eigenvalues within `n · ε`, together with the a-priori bound on the eigenvalues
  themselves. This composite is the whole reason the pair exists: entrywise control in,
  spectral conclusions out.
- **The sorted-indexing theory** (the second gap), transported and not re-proved: the rank
  count against nonzero sorted eigenvalues, nonnegativity for positive semidefinite matrices,
  and the **vanishing tail**. Positive semidefiniteness is essential there rather than
  convenient: a rank-one Hermitian matrix with a negative eigenvalue sorts it *last*.
- **Concentration consumers**: the probability of a complement, needing no measurability, and
  the family converting "with high probability the error is at most `rate i`" into
  `TendstoInMeasure`.

**Milestone C1 — measurability of the spectral transform**, and the `RCLike` norm comparison
above. For fixed continuous `h`, `specTransform h` is measurable in the matrix, with **no
measurable selection of an eigenbasis** — `B ↦ u_k(B)` is discontinuous at eigenvalue
crossings. The route is that `specTransform h B` is the entrywise limit of matrix polynomials
`p(B)`, by Stone–Weierstrass on a spectral interval bounded via the a-priori eigenvalue bound,
glued over a countable entrywise-bound cover by a countable-restriction lemma. Without it,
"the top-`k` eigenspace of a random matrix" carries no measurability and no probability
statement about it means anything.

## Worked examples (acceptance criteria)

### Part A — rank factorization and positive-semidefinite Gram factorization

**Acceptance examples.** The Gram matrix of `n` explicit points in `𝕜^d` has rank `≤ d`; a
diagonal positive semidefinite matrix factors through its number of nonzero entries; the easy
direction recovers `rank_mul_le`.

### Part C — matrix spectra and spectral measurability

**Acceptance examples.** `specTransform id hB = B`, the spectral theorem read entrywise; for a
diagonal matrix the perturbation bound checked against explicit eigenvalues.

## Ordering

**Part A is an independent leaf**: it needs nothing beyond Mathlib and is submittable
immediately, as a single small contribution.

Part C consumes
[`HilbertSpaceOperatorFoundations`](../HilbertSpaceOperatorFoundations/README.md) for
Courant–Fischer and Weyl's inequality with the sorted eigenvalue API. Internal order: norm
comparisons → eigenvalue perturbation → sorted-indexing theory → measurability.

## Definitions

**D1** `λ₀ ≥ λ₁ ≥ ⋯`, the eigenvalues of the associated Euclidean operator — the decreasingly
sorted spectrum of a Hermitian matrix.

**D2** `∑ₖ h(λₖ) uₖ uₖᵀ` — the spectral `h`-transform.

## References

- R. A. Horn, C. R. Johnson, *Matrix Analysis*, 2nd ed. (2013) — spectral theorem, positive
  semidefinite Gram factorizations, Weyl's inequality (Theorem 4.3.1).
- R. Bhatia, *Matrix Analysis* (GTM 169, 1997) — eigenvalue perturbation (Corollary III.2.6).
- T. F. Cox, M. A. A. Cox, *Multidimensional Scaling*, 2nd ed. (2001), §2.2–2.3 — classical
  scaling: the positive semidefinite Gram embedding step.

## Acknowledgements

An Apache-2.0 implementation of Part A and of most of Part C exists in the
[AIQ DKPS formalization](https://github.com/AIQ-Kitware/aiq-dkps-formalization) (Kitware,
Inc.), in `TauCeti.*` and `TauCeti.Matrix.*` namespaces. The public API and proof structure
may change during integration.

Milestone A2 and the `RCLike` half of C1 are specified above and not implemented there.
Several Part A statements are additionally pinned as data by a conformance harness in
that repository, which constrains renames on the donor side but not the API asked for here;
in particular a `[DecidableEq n]` instance carried by three Part A rank theorems is an artifact
of that pinning and should be dropped upstream.
