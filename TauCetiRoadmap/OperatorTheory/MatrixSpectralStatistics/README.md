# Matrix spectral statistics: rank factorizations, spectral measurability, and concentration

Spectral methods in statistics — principal component analysis, spectral embedding, classical
multidimensional scaling — all run one pipeline: estimate a Hermitian matrix from samples,
control the estimation error, push that control through eigenvalue and eigenvector
perturbation theory, and read off a stable embedding or a stable minimizer.

Mathlib has the deterministic linear algebra (the Hermitian spectral theorem, `Matrix.rank`,
`Matrix.PosSemidef`) and the probability spine (`ProbabilityTheory.variance`, independence,
the Bochner integral), but not the estimation layer that connects them: nothing bounds a
matrix's Euclidean operator norm by its entries, the sorted eigenvalue indexing
`Matrix.IsHermitian.eigenvalues₀` carries almost no theory, no spectral function of a random
matrix is known to be measurable, there is no sample-mean or second-moment API, no matrix
concentration statement, and no factorization realizing `Matrix.rank` as an inner dimension.

This roadmap builds that toolkit as three Parts that meet in the statistics. A positive
semidefinite matrix of rank at most `d` *is* the Gram matrix of `n` points in `𝕜^d` (Part A —
the multidimensional-scaling embedding step). Entrywise error on a Hermitian matrix controls
spectral error, and spectral quantities of a *random* Hermitian matrix are measurable, so
probability statements about them are well posed (Part B). A sample second moment
concentrates about the population matrix — entrywise by Chebyshev and a union bound, hence
spectrally through Part B's bridge (Part C).

Composed with
[`SpectralSubspacePerturbation`](../SpectralSubspacePerturbation/README.md), this is how a
perturbation theorem becomes a statistical one: Part C supplies `‖M̂ − M‖ ≤ ε` with
probability `1 − δ`, Part B makes the spectral quantities of `M̂` measurable, and Part A
realizes the estimated Gram structure as an explicit embedding.

Suggested home: `TauCeti/LinearAlgebra/Matrix/`, `TauCeti/Analysis/Matrix/`,
`TauCeti/Probability/Moments/`, with two supporting lemmas in `TauCeti/MeasureTheory/`.

## Standing conventions

- **Matrices, deliberately.** Parts B and C are about concrete matrices with entrywise
  hypotheses, not abstract operators. This is not a lapse into coordinates: statistical data
  arrives as a matrix, entrywise, and the bounds a statistician can assume are entrywise
  bounds. The abstract operator theory lives in
  [`PolarDecomposition`](../PolarDecomposition/README.md); here we build the bridge from
  entries to spectra.
- **Scalar fields, pinned per Part.** Rank factorization (Part A) is over an arbitrary
  `Field`; the Gram/positive-semidefinite factorization and deterministic spectral bridge
  (Part B) are over `RCLike`, for Hermitian matrices. The sample-moment and concentration
  layer (Part C) remains over `ℝ` for its present real-valued statistical model.
- **Sorted eigenvalues: transport, never re-prove.** The decreasing indexing is Mathlib's
  `Matrix.IsHermitian.eigenvalues₀`, indexed by `Fin (Fintype.card n)` and antitone by
  `Matrix.IsHermitian.eigenvalues₀_antitone`. This roadmap defines no second sorted-eigenvalue
  function. Facts stated upstream for the matrix-indexed `eigenvalues` are *transported* along
  the defining index equivalence.
- **Inner dimensions are `Fin r`, not a subtype.** A caller who wants "at most `d` rows" gets
  `Fin d` directly, with the `≤`-relaxed form stated beside the exact-rank form, so no
  cardinality-equivalence transport is ever needed at a use site.
- **No new predicates for one-line bounds.** Entrywise control in Part B is the hypothesis
  `∀ i j, ‖A i j‖ ≤ ε`; the real Part C specialization may write absolute values. Operator
  control at `LinearMap` level is `∀ x, ‖T x‖ ≤ C * ‖x‖`,
  carried directly in the style of Mathlib's `norm_cfc_le` — never wrapped in a named
  predicate or an ad-hoc sup norm.
- **Dimension constants are explicit.** The entrywise-to-operator comparison
  carries the factor `n`, and the union bound carries `n²`. Neither is dimension-free and
  neither may be silently dropped: the Part C concentration bounds are *wrong*, not merely
  weak, without them. Where the constant is suboptimal by design (Part C), the statement
  says so.
- **Independence is pairwise; means are common.** Sample-moment identities assume pairwise
  independence and a common mean, never full mutual independence or identical distribution;
  the i.i.d. forms are corollaries. The scaled-sum identity is stated as `r⁻²` times the sum
  of individual errors — the independence-free shape — rather than as `r⁻¹` times an average.
- **Uncentered moments are the primitive.** Chebyshev is stated in raw second-moment form, with
  no centering and no measurability of the variable itself; the sample second moment is the
  uncentered empirical second-moment matrix; centering is the scatter operator's job. The mean
  of the empty family is `0` by Mathlib's total-inverse convention, and the add-one mean
  identity is deliberately stated to hold *at* `n = 0`.

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
  and `Matrix.isSymmetric_toEuclideanLin_iff` — the bridge Part B's sorted eigenvalues sit on.
- **Probability:** `ProbabilityTheory.variance` with `IndepFun.variance_sum`;
  `meas_ge_le_variance_div_sq`, the *centered* Chebyshev inequality — the uncentered form is
  missing; `MemLp`, the Bochner integral, `MeasureTheory.TendstoInMeasure`. The covariance API
  has no trace identity and no sample-mean lemmas.
- **Hermitian continuous functional calculus:** Mathlib's generic `cfc` for Hermitian
  matrices over `RCLike`, including continuity in the operator variable (`continuousOn_cfc`);
  Part B consumes this calculus directly and proves only the matrix/random-matrix corollaries.

The roadmap builds the missing bridges and statistical corollaries below. Hermitian CFC
itself and generic continuity in the operator variable are consumed from Mathlib.

---

## What is missing (build here)

* Rank factorization through `Fin r` as an iff, the positive-semidefinite Gram factorization
  behind multidimensional scaling, and their uniqueness statements — up to `GL` for general
  factors, up to a left unitary for Gram factors.
* A `MeasurableSpace` instance for `Matrix`, which Mathlib lacks entirely, and the
  measurability of spectral functions of a random matrix.
* The entrywise-to-spectral bridge for the sorted eigenvalues of a Hermitian matrix.
* The elementary matrix concentration that follows: Chebyshev and a union bound over the
  entries, converted to simultaneous eigenvalue and operator-norm control.

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

Existence over the group rather than a quotient type; there is no quotient object here.
Minimal rank only. The Gram statement uses `LinearIsometryEquiv`, the same carrier
[`OrthogonalGeometry`](../OrthogonalGeometry/README.md) states Gram rigidity against.

### Part B — matrix spectra and spectral measurability

Everything else in this family is about abstract operators; this Part is about matrices, and
about matrices whose entries are random.

**Objects.** Hermitian matrices over `RCLike` as Euclidean operators
(`Matrix.toEuclideanLin`); the decreasingly sorted spectrum
`Matrix.IsHermitian.eigenvalues₀`; and the generic Mathlib continuous functional calculus
`cfc h B` for Hermitian `B`; and, for a deterministic threshold `c`, the canonical
orthogonal spectral projector `spectralProjectionIci c B` onto the eigenspaces with
eigenvalue in `[c, ∞)`.

**API to develop.**

- **Entrywise-to-operator comparison**: for an `RCLike` square matrix,
  `∀ i j, ‖A i j‖ ≤ ε` gives
  `∀ x, ‖Matrix.toEuclideanLin A x‖ ≤ n · ε · ‖x‖`.
- **Entrywise eigenvalue perturbation**: Weyl's inequality, consumed from
  [`PolarDecomposition`](../PolarDecomposition/README.md),
  composed with the comparison gives that entrywise `ε`-close Hermitian matrices have
  sorted eigenvalues within `n · ε`, together with the a-priori bound on the eigenvalues
  themselves. This composite is the whole reason the pair exists: entrywise control in,
  spectral conclusions out.
- **The sorted-indexing theory** (the second gap), stated against Mathlib's
  `Matrix.IsHermitian.eigenvalues₀` and its antitonicity, transported and not re-proved:
  the rank
  count against nonzero sorted eigenvalues, nonnegativity for positive semidefinite matrices,
  and the **vanishing tail**. Positive semidefiniteness is essential there rather than
  convenient: a rank-one Hermitian matrix with a negative eigenvalue sorts it *last*.
- **Fixed-threshold spectral projectors:** for deterministic `c`, construct the orthogonal
  projector onto the sum of eigenspaces with eigenvalue in `[c, ∞)` and prove its Borel
  measurability as a function of a Hermitian matrix. No eigenbasis is selected. If `c` lies
  strictly inside a population eigengap, then on the event that the operator perturbation is
  smaller than the distance from `c` to the population spectrum, Weyl's inequality preserves
  the number of eigenvalues above `c`. The sample projector then selects exactly the
  corresponding spectral cluster. This is the measurable object used by the probability
  pipeline; no globally defined top-`k` eigenspace is required.
- **Concentration consumers**: the probability of a complement, needing no measurability, and
  the family converting "with high probability the error is at most `rate i`" into
  `TendstoInMeasure`.

**Milestone B1 — continuity and measurability of Hermitian CFC in the matrix.** Mathlib already
provides the Hermitian continuous functional calculus over `RCLike` and generic continuity
theorems for `cfc` in the operator variable. This roadmap packages the matrix consequence: for
fixed continuous `h`, `B ↦ cfc h B` is continuous on Hermitian matrices and therefore measurable
for measurable Hermitian random matrices, with **no measurable selection of an eigenbasis**.
Use Mathlib's `continuousOn_cfc` locally on a compact spectral interval, with the interval
chosen from a local operator-norm bound. Continuous CFC measurability is one deterministic
spectral bridge; the discontinuous indicator needed for a spectral projector is handled by the
separate fixed-threshold construction above. The threshold is deterministic and lies inside a
specified population gap, so ties at the threshold are excluded on the perturbation event rather
than resolved by a measurable eigenbasis convention.

### Part C — sample moments and matrix concentration

The applied end of the toolkit.

**Objects.** The sample mean of random vectors; the uncentered empirical second-moment matrix
`sampleSecondMoment V ω = fun k l => n⁻¹ Σ_i V i ω k * V i ω l`, Hermitian — no sample mean is
subtracted, so it is not a covariance; and the unnormalized centered scatter operator
`Σ_i (z i − mean z) ⊗ (z i − mean z)` on a general inner-product space.

**API to develop.**

- **Uncentered Chebyshev**: from `∫ Y² ≤ v`, `P {η < Y} ≤ v/η²`, with no centering,
  nonnegativity, or measurability of `Y` beyond integrability of `Y²` — the raw form
  concentration arguments apply to error norms.
- **Sample-mean mean-squared error**: the scalar identity and its vector form
  `∫ ‖r⁻¹ Σ X_k − μ‖² = r⁻² Σ_k ∫ ‖X_k − μ‖²`, under pairwise independence and a common mean
  only, coordinatewise over an orthonormal basis; with the i.i.d. collapse and the `γ/r` decay.
- **Centered scatter**: the **exact add-one update**
  `S(snoc z y) = S(z) + n/(n+1) · rankOne δ δ` with `δ = y − mean z` — an identity, not an
  estimate, and exact accounting for the mean shift is what makes the scatter incrementally
  computable — with the mean update, the vanishing of the centered sum, positivity, Löwner
  growth, and the quadratic-form versions.
- **Matrix concentration**: the union bound `P {∃ k l, η < |Ŝ_{kl} − A_{kl}|} ≤ n² v/η²`, then
  through Part B's entrywise-to-operator comparison, eigenvalue concentration and its one-sided
  floor; specialized to the empirical second moment by the per-entry mean-square bound `v/n`
  from the scalar sample-mean identity.

**Milestone C1 — eigenvalue concentration.** Second moments of the entries give, by Chebyshev
and a union bound, simultaneous control of every sorted eigenvalue with probability
`1 − n²v/η²`.

**Milestone C2 — the operator-norm deviation event**, on the *same* hypotheses as C1, so that
the two are visibly one event read two ways:

```lean
P {ω | ∀ x, ‖Matrix.toEuclideanLin (Shat ω - A) x‖ ≤ (n : ℝ) * η * ‖x‖}
  ≥ 1 - ENNReal.ofReal ((n : ℝ) ^ 2 * v / η ^ 2)
```

This is the event the spectral-subspace perturbation statistics consumes directly.
**C1 and C2 are sibling consequences of the entrywise event**: eigenvalue closeness does not
bound an operator-norm difference, since two matrices can have identical spectra and differ by
a rotation. C1 follows through Weyl's inequality and C2 through Part B's norm comparison.

The entrywise event should be a named lemma with the Chebyshev and union-bound cost paid
once, and both conclusions read off it, so that the probability `1 − n²v/η²` is the same
number in both rather than two coincidentally equal bounds.

**C2 is stated without symmetry**: the operator-norm bound applies to `Ŝ ω − A` directly,
while C1 carries Hermitian hypotheses for the eigenvalues. This keeps C2 available when
symmetry is established elsewhere.

This roadmap uses Chebyshev's inequality and a union bound, producing factors `n` and `n²`.

## Worked examples (acceptance criteria)

### Part A — rank factorization and positive-semidefinite Gram factorization

**Acceptance examples.** The Gram matrix of `n` explicit points in `𝕜^d` has rank `≤ d`; a
diagonal positive semidefinite matrix factors through its number of nonzero entries; the easy
direction recovers `rank_mul_le`.

### Part B — matrix spectra and spectral measurability

**Acceptance examples.** `cfc id B = B`; a two-cluster Hermitian family with a fixed cutoff
inside the gap has a measurable `spectralProjectionIci` of constant rank on the corresponding
operator-norm neighborhood; for a
diagonal matrix the perturbation bound checked against explicit eigenvalues; a concentration
bound with rate `1/√n` feeding the `TendstoInMeasure` conversion.

### Part C — sample moments and matrix concentration

**Acceptance examples.** I.i.d. coordinates with a fourth-moment bound give an explicit `v` and
the `v/n` entry rate; `η = c/(2d)` keeps a population eigenvalue floored at `c` above `c/2`
with high probability — the eigengap the Davis–Kahan applications of
[`SpectralSubspacePerturbation`](../SpectralSubspacePerturbation/README.md) need; the add-one
scatter identity checked against a two-point family.

## Ordering

**Part A is an independent leaf**: it needs nothing beyond Mathlib and is submittable
immediately, as a single small contribution.

**Parts B and C are a chain.** Part C consumes Part B. Internal order:
within Part B, norm comparisons → eigenvalue perturbation → sorted-indexing theory → the
Hermitian-CFC continuity/measurability corollary; within Part C, scalar moments → sample mean → matrix concentration → sample
second moment, with the centered scatter independent of the rest.

**External.** [`PolarDecomposition`](../PolarDecomposition/README.md), for
Courant–Fischer and Weyl's inequality behind the entrywise eigenvalue bridge. Hermitian CFC
and continuity in the operator variable are consumed directly from Mathlib.

## Definitions

**D1** `cfc h B` — Mathlib's Hermitian continuous functional calculus, used directly
rather than redefined through an eigenbasis sum.

**D2** `n⁻¹ ∑ᵢ Vᵢ Vᵢᵀ` — the uncentered empirical second-moment matrix.

## References

- R. A. Horn, C. R. Johnson, *Matrix Analysis*, 2nd ed. (2013) — spectral theorem, positive
  semidefinite Gram factorizations, Weyl's inequality (Theorem 4.3.1).
- R. Bhatia, *Matrix Analysis* (GTM 169, 1997) — eigenvalue perturbation (Corollary III.2.6).
- T. F. Cox, M. A. A. Cox, *Multidimensional Scaling*, 2nd ed. (2001), §2.2–2.3 — classical
  scaling: the positive semidefinite Gram embedding step.
- R. Vershynin, *High-Dimensional Probability* (2018) — sample second-moment concentration
  and its uses.

## Acknowledgements

An Apache-2.0 implementation of Part A and of most of Parts B and C exists in the
[AIQ DKPS formalization](https://github.com/AIQ-Kitware/aiq-dkps-formalization) (Kitware,
Inc.), in `TauCeti.*` and `TauCeti.Matrix.*` namespaces. The public API and proof structure
may change during integration.

Milestone A2 is specified above and not implemented there.
