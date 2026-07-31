# Matrix spectral statistics: rank factorizations, argmin stability, and concentration

Spectral methods in statistics — principal component analysis, spectral embedding, classical
multidimensional scaling — all run one pipeline: estimate a symmetric matrix from samples,
control the estimation error, push that control through eigenvalue and eigenvector
perturbation theory, and read off a stable embedding or a stable minimizer.

Mathlib has the deterministic linear algebra (the Hermitian spectral theorem, `Matrix.rank`,
`Matrix.PosSemidef`) and the probability spine (`ProbabilityTheory.variance`, independence,
the Bochner integral), but not the estimation layer that connects them: nothing bounds a
matrix's Euclidean operator norm by its entries, the sorted eigenvalue indexing
`Matrix.IsHermitian.eigenvalues₀` carries almost no theory, no spectral function of a random
matrix is known to be measurable, there is no sample-mean or sample-covariance moment API, no
matrix concentration statement, no Berge maximum theorem, and no factorization realizing
`Matrix.rank` as an inner dimension.

This roadmap builds that toolkit as four Parts that meet in the statistics. A positive
semidefinite matrix of rank at most `d` *is* the Gram matrix of `n` points in `𝕜^d` (Part A —
the multidimensional-scaling embedding step). A minimizer over a fixed compact feasible set
moves upper-hemicontinuously when the objective is perturbed (Part B — argmin stability).
Entrywise error on a symmetric matrix controls spectral error, and spectral quantities of a
*random* symmetric matrix are measurable, so probability statements about them are well posed
(Part C). A sample covariance concentrates about the population matrix — entrywise by
Chebyshev and a union bound, hence spectrally through Part C's bridge (Part D).

Composed with
[`SpectralSubspacePerturbation`](../SpectralSubspacePerturbation/README.md), this is how a
perturbation theorem becomes a statistical one: Part D supplies "`Σ̂` is within `ε` of `Σ` with
probability `1 − δ`", Part C makes the spectral quantities of `Σ̂` measurable, Part B transfers
the bound to minimizers of spectral objectives, and Part A realizes the estimated Gram
structure as an explicit embedding.

The goal is to build the reusable theory of these objects, not to race to the composite. The
bar for done: a formalizer working from a spectral-methods paper finds each object — rank
factorizations, argmin correspondences, sorted eigenvalues, spectral transforms, sample
moments — defined at the pinned generality and equipped with its basic API, so that the
concentration and stability theorems are consequences of a developed theory.

Suggested home: `TauCeti/LinearAlgebra/Matrix/`, `TauCeti/Topology/`,
`TauCeti/Analysis/Matrix/`, `TauCeti/Probability/Moments/`, with two supporting lemmas in
`TauCeti/MeasureTheory/`.

## Scope boundary

This roadmap owns matrix-level statements with **entrywise** hypotheses, the measurability of
spectral functions of a random matrix, and the elementary concentration that follows. It does
not own the abstract operator theory those statements are compared against — that is
[`HilbertSpaceOperatorFoundations`](../HilbertSpaceOperatorFoundations/README.md) — and it
does not own random matrix theory: limiting spectral distributions, universality, and the
sharp dimensional constants of matrix Bernstein are out of scope, and the deliberately
elementary route taken in Part D says so in its statements.

## Generality bar

Decide these up front; do not silently specialize.

- **Matrices, deliberately.** Parts C and D are about concrete matrices with entrywise
  hypotheses, not abstract operators. This is not a lapse into coordinates: statistical data
  arrives as a matrix, entrywise, and the bounds a statistician can assume are entrywise
  bounds. The abstract operator theory lives in the foundations roadmap; here we build the
  bridge from entries to spectra.
- **Scalar fields, pinned per Part.** Rank factorization (Part A) over an arbitrary `Field`;
  the Gram/positive-semidefinite factorization over `RCLike`. The spectral–statistical chain
  (Parts C–D) is developed over `ℝ` for real symmetric matrices; the `RCLike` form of the norm
  comparisons is an explicit Part C milestone, never a silent assumption.
- **Sorted eigenvalues: transport, never re-prove.** The decreasing indexing is Mathlib's
  `Matrix.IsHermitian.eigenvalues₀` for matrices and `LinearMap.IsSymmetric.eigenvalues` for
  operators. Facts stated upstream for the matrix-indexed `eigenvalues` are *transported*
  along the defining index equivalence rather than duplicated.
- **Inner dimensions are `Fin r`, not a subtype.** A caller who wants "at most `d` rows" gets
  `Fin d` directly, with the `≤`-relaxed form stated beside the exact-rank form, so no
  cardinality-equivalence transport is ever needed at a use site.
- **Fixed feasible set, said out loud.** Part B formalizes the *fixed-constraint* case of
  Berge's theorem: the compact `K` does not vary with the parameter. The parameter-varying
  constraint correspondence is a later milestone of the same Part, and every statement says
  which case it is.
- **Sequential methods, with their hypotheses visible.** Compactness is consumed through
  subsequences, so the standing hypotheses are `FirstCountableTopology` on the point space,
  `T2Space` exactly where Mathlib's `UpperHemicontinuousAt` needs the compact set closed, and
  `(𝓝 p₀).IsCountablyGenerated` on the parameter filter — not the compact-open topology.
- **No new predicates for one-line bounds.** Entrywise control is the hypothesis
  `∀ i j, |A i j| ≤ ε`, and operator control at `LinearMap` level is `∀ x, ‖T x‖ ≤ C * ‖x‖`,
  carried directly in the style of Mathlib's `norm_cfc_le` — never wrapped in a named
  predicate or an ad-hoc sup norm.
- **Dimension constants are explicit and honest.** The entrywise-to-operator comparison
  carries the factor `n`, and the union bound carries `n²`. Neither is dimension-free and
  neither may be silently dropped: downstream bounds are *wrong*, not merely weak, without
  them. Where the constant is suboptimal by design (Part D), the statement says so.
- **Independence is pairwise; means are common.** Sample-moment identities assume pairwise
  independence and a common mean, never full mutual independence or identical distribution;
  the i.i.d. forms are corollaries. The scaled-sum identity is stated as `r⁻²` times the sum
  of individual errors — the independence-free shape — rather than as `r⁻¹` times an average.
- **Uncentered moments are the primitive.** Chebyshev is stated in raw second-moment form, with
  no centering and no measurability of the variable itself; the sample covariance is the
  uncentered empirical second-moment matrix; centering is the scatter operator's job. The mean
  of the empty family is `0` by Mathlib's total-inverse convention, and the add-one mean
  identity is deliberately stated to hold *at* `n = 0`.

## What Mathlib already has

- **Matrix linear algebra:** `Matrix.rank` with `rank_mul_le` and the column-space API;
  `Matrix.PosSemidef` with `posSemidef_conjTranspose_mul_self` and
  `rank_conjTranspose_mul_self`; `Matrix.IsHermitian.spectral_theorem`, `eigenvalues`,
  `eigenvectorUnitary`; `Matrix.toEuclideanLin` and the `ℓ²` operator-norm API.
- **Two gaps, stated precisely.** (1) There is **no entrywise-to-operator-norm comparison**:
  nothing bounds `‖toEuclideanLin A‖` by entrywise control of `A`. (2) The sorted indexing
  **`Matrix.IsHermitian.eigenvalues₀` carries almost no theory**: it is the primitive from
  which `eigenvalues` is *defined*, yet upstream it has only `eigenvalues₀_antitone` and the
  characteristic-polynomial identities, while the rank count and positivity are stated only
  for `eigenvalues`. Any "top-`k` eigenvalues" statement needs the sorted indexing, so both
  gaps are prerequisites for the statistics rather than conveniences.
- **Topology:** `IsCompact.exists_isMinOn`, `IsCompact.tendsto_subseq`, `IsMinOn`, and the
  hemicontinuity *definitions* `UpperHemicontinuousAt` and `LowerHemicontinuousAt` with the
  sequential criterion — but no Berge theorem.
- **Spectral theory of operators:** `LinearMap.IsSymmetric.eigenvalues` / `eigenvectorBasis`
  and `Matrix.isSymmetric_toEuclideanLin_iff` — the bridge Part C's sorted eigenvalues sit on.
- **Probability:** `ProbabilityTheory.variance` with `IndepFun.variance_sum`;
  `meas_ge_le_variance_div_sq`, the *centered* Chebyshev inequality — the uncentered form is
  missing; `MemLp`, the Bochner integral, `MeasureTheory.TendstoInMeasure`. The covariance API
  has no trace identity and no sample-mean lemmas.
- **Approximation:** Stone–Weierstrass, `Polynomial.aeval` on matrices with `continuous_aeval`,
  and the Borel-space constructions — the ingredients of Part C's measurability argument.

Everything below is absent upstream. Before implementing, re-check the Zulip and the open
Mathlib pull requests, particularly around hemicontinuity and matrix concentration.

---

## Part A — rank factorization and positive-semidefinite Gram factorization

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

**Milestone A2 — uniqueness up to the obvious action.** This is what a reader asks immediately
after seeing an existence iff, and it is the difference between a *factorization theorem* and
an existence lemma. Two statements, whose acting groups differ in a way that is easy to get
wrong:

- **rank factorization at the exact rank**: the factors are unique up to a change of basis of
  the intermediate space, `L' = L g` and `R' = g⁻¹ R` for some `g ∈ GL (Fin r) 𝕜`;
- **Gram factorization**: unique up to a *left unitary*, at a fixed factor size and with no
  rank hypothesis.

They are one milestone because they are the two uniqueness statements of the same Part and
share an idea — the factor is determined by its Gram data up to the symmetry group of the
intermediate space — but the groups differ, because the second remembers an inner product and
the first does not. Stating them together is what stops a reader assuming the general-field
statement carries a unitary.

**Only the minimal-rank case is claimed.** At `r > M.rank` the factors are *not* unique up to
`GL (Fin r) 𝕜` — the extra columns are unconstrained — so the statement carries `r = M.rank`
and not the `≤ r` of Milestone A1. This is the hypothesis a reader is most likely to drop.

**The multidimensional-scaling consumer fixes the second statement's shape.** Classical scaling
recovers points from a Gram matrix, and the recovered configuration is meaningful only up to a
rigid motion; `A' = U A` is exactly that indeterminacy. A statement quantified the other way —
a unitary on the `n` side — would be false and would look plausible.

**Decided.** Existence over the group rather than a quotient type; there is no quotient object
here and inventing one would be a second, unasked-for design. Minimal rank only.
**Open.** Whether the Gram statement wants `Matrix.unitaryGroup` or a bundled
`LinearIsometryEquiv`. That depends on which the eventual consumer holds, and there is no
consumer yet.

**Acceptance examples.** The Gram matrix of `n` explicit points in `𝕜^d` has rank `≤ d`; a
diagonal positive semidefinite matrix factors through its number of nonzero entries; the easy
direction recovers `rank_mul_le`.

## Part B — Berge's maximum theorem

Argmin stability under objective perturbation.

**Objects.** For jointly continuous `g : P → X → ℝ` and a nonempty compact `K ⊆ X`: the argmin
correspondence `p ↦ {x ∈ K | IsMinOn (g p) K x}` and the value function
`p ↦ ⨅ x : K, g p x`.

**API to develop.**

- The **engine**, and the actual content of the fixed-constraint case: a sequence of
  *approximate* minimizers in a compact set (`F (z k) ≤ F x + ε x k` for `x ∈ K`, with
  `ε x k → 0`) has a subsequence converging to a genuine minimizer on `K`. This is the recovery
  half of the fundamental theorem of Γ-convergence, with a global-comparison variant beside it.
- The **sequential uniform-convergence step**: along `p k → p₀`, the evaluation difference
  `g (p k) (x k) − g p₀ (x k)` vanishes for points staying in `K`, proved by the subsequence
  criterion, in exactly the form Berge consumes.

**Milestone B1 — Berge at fixed `K`, in three forms**, because three consumers want three
shapes: a closed-graph sequential statement, a statement through Mathlib's own
`UpperHemicontinuousAt`, and a uniform `ε`–`δ` modulus whose `δ` depends only on `(p₀, ε)` and
so avoids measurable selection of minimizers. The family form measures closeness by a finite
family of continuous invariants vanishing on the diagonal rather than by the ambient metric —
the case where minimizers are determined only up to a symmetry group.

**Milestone B2 — the value function** at fixed `K` is continuous, by the squeeze between a
fixed minimizer of `g p₀` and the moving minimizers.

**Milestone B3 — the classical theorem, over a varying constraint correspondence.** This is the
classical statement's actual generality and the first thing a reviewer who knows Berge will ask
for. **The fixed-constraint case is a special case of it, not a step toward it**: the engine
that proves the fixed case does not generalize by adding a hypothesis, because with `K` varying
the approximate-minimizer sequence need not stay in one compact set.

Both hemicontinuity predicates already exist upstream, so nothing here defines a hemicontinuity
notion. What the milestone adds is a correspondence `Γ : P → Set X` that is

- **nonempty- and compact-valued** — both essential, for opposite reasons: the first makes the
  value function finite, the second is what makes an argmin exist at all;
- **upper hemicontinuous** — what bounds the argmin set from outside and gives the closed-graph
  half;
- **lower hemicontinuous** — what the value function's *upper* semicontinuity needs, and the
  half the fixed-constraint development never had to prove, a constant correspondence being
  trivially lower hemicontinuous.

The conclusion: the value function `v p = ⨅ x ∈ Γ p, g p x` is continuous, and the argmin
correspondence is upper hemicontinuous with nonempty compact values.

**The decomposition is the substance, and belongs in the roadmap because it is what makes the
milestone reviewable**: continuity of `v` splits into *lower* semicontinuity from upper
hemicontinuity of `Γ` and *upper* semicontinuity from lower hemicontinuity of `Γ`, and each
half is provable on its own. Asking for "Berge's theorem" as a single target hides that it is
two independent lemmas with opposite hypotheses, and hides that half of it is already available
from Milestone B2.

**Scope, honestly.** The vocabulary is upstream, so what is genuinely new is the two theorems
above and nothing else; mistaking this for "define hemicontinuity, then prove Berge" is what
makes it look large.

**Decided.** Mathlib's hemicontinuity predicates, not a bespoke correspondence structure.
**Open.** Whether the sequential characterizations force `[FirstCountableTopology]` in the
varying case as they do at fixed `K`. At fixed `K` that hypothesis is a proof artifact the
roadmap asks to remove; whether the varying case can avoid it is genuinely unknown, so it is
not promised.

**Acceptance examples.** `g p x = ‖x − p‖²` on a compact `K`: the argmin correspondence is the
metric projection, and the modulus form is nontrivial exactly where the projection is
set-valued; a symmetric objective whose minimizers form an orbit, exercising the
invariant-family modulus.

## Part C — matrix spectra and spectral measurability

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

  The eigenvalue statements downstream stay real for now: `sortedEigenvalues` is built on
  `LinearMap.IsSymmetric.eigenvalues`, and generalizing the *spectral* layer is a different and
  larger question than generalizing one norm inequality. Doing the norm half alone is
  worthwhile because it is what the operator-norm deviation event of Part D consumes, and it
  removes an `ℝ`-only hypothesis from the entry point of the Part rather than from its
  interior.
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
glued over a countable entrywise-bound cover by the countable-restriction lemma of
[`SelfAdjointSpectralTheory`](../SelfAdjointSpectralTheory/README.md). This is the statement
that makes the statistical track well posed: without it, "the top-`k` eigenspace of the sample
covariance" carries no measurability and no probability statement about it means anything.

**Acceptance examples.** `specTransform id hB = B`, the spectral theorem read entrywise; for a
diagonal matrix the perturbation bound checked against explicit eigenvalues; a concentration
bound with rate `1/√n` feeding the `TendstoInMeasure` conversion.

## Part D — sample moments and matrix concentration

The applied end of the toolkit.

**Objects.** The sample mean of random vectors; the uncentered empirical second-moment matrix
`sampleCovariance V ω = fun k l => n⁻¹ Σ_i V i ω k * V i ω l`, Hermitian; and the centered
scatter operator `Σ_i (z i − mean z) ⊗ (z i − mean z)` on a general inner-product space.

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
  through Part C's perturbation bound the eigenvalue concentration and its one-sided floor;
  specialized to the empirical covariance by the per-entry mean-square bound `v/n` from the
  scalar sample-mean identity.

**Milestone D1 — eigenvalue concentration.** Second moments of the entries give, by Chebyshev
and a union bound, simultaneous control of every sorted eigenvalue with probability
`1 − n²v/η²`.

**Milestone D2 — the operator-norm deviation event**, on the *same* hypotheses as D1, so that
the two are visibly one event read two ways:

```lean
P {ω | ∀ x, ‖Matrix.toEuclideanLin (Shat ω - A) x‖ ≤ (n : ℝ) * η * ‖x‖}
  ≥ 1 - ENNReal.ofReal ((n : ℝ) ^ 2 * v / η ^ 2)
```

This is the event the spectral-subspace perturbation statistics consumes directly, and it is
**not a corollary of D1**: eigenvalue closeness does not bound an operator-norm difference, since
two matrices can have identical spectra and differ by a rotation. Both descend from the same
entrywise event, D1 through Weyl's inequality and D2 through Part C's norm comparison — they
are siblings, not parent and child.

**Structuring the proof that way is part of the milestone**: the entrywise event should be a
named lemma with the Chebyshev and union-bound cost paid once, and both conclusions read off
it, so that the probability `1 − n²v/η²` is literally the same number in both rather than two
coincidentally equal bounds. In the other order the argument gets written twice.

**No symmetry hypothesis appears in D2**, deliberately: `Ŝ ω − A` needs none for an
operator-norm bound, whereas D1 needs both matrices Hermitian to have eigenvalues at all.
Dropping the hypothesis where it is not used is what lets this event be consumed by an
application that has already discharged symmetry elsewhere.

**The route is deliberately elementary, and the statement must say so.** Chebyshev plus a union
bound costs a factor `n` (entrywise to operator) and `n²` (the union bound); a matrix Bernstein
inequality would give `log n` dimension dependence, at the price of the matrix Laplace-transform
machinery Mathlib does not have. The trade — a weaker constant from ingredients that exist over
a sharper constant requiring a substantial new development — is right for a first pass, but the
bound is **not sharp in the dimension**, and nothing downstream may treat the `n`-dependence as
intrinsic. A matrix-Bernstein upgrade is future work *on top of* this API, not a replacement for
it.

**Acceptance examples.** I.i.d. coordinates with a fourth-moment bound give an explicit `v` and
the `v/n` entry rate; `η = c/(2d)` keeps a population eigenvalue floored at `c` above `c/2`
with high probability — the eigengap a downstream Davis–Kahan application needs; the add-one
scatter identity checked against a two-point family.

## Dependency ordering

**Parts A and B are independent leaves**: they need nothing beyond Mathlib — not each other,
not Parts C–D, and no other roadmap — and are submittable immediately and in parallel, each as
a single small contribution.

**Parts C and D are a chain.** Part C consumes
[`HilbertSpaceOperatorFoundations`](../HilbertSpaceOperatorFoundations/README.md) for
Courant–Fischer and Weyl's inequality with the sorted eigenvalue API, and
[`SelfAdjointSpectralTheory`](../SelfAdjointSpectralTheory/README.md) for the countable
restrict-cover gluing lemma and the measurability toolkit around the functional calculus.
Part D consumes Part C and nothing else. Internal order: within Part C, norm comparisons →
eigenvalue perturbation → sorted-indexing theory → measurability; within Part D, scalar moments
→ sample mean → matrix concentration → sample covariance, with the centered scatter independent
of the rest.

## References

- R. A. Horn, C. R. Johnson, *Matrix Analysis*, 2nd ed. (2013) — spectral theorem, positive
  semidefinite Gram factorizations, Weyl's inequality (Theorem 4.3.1).
- R. Bhatia, *Matrix Analysis* (GTM 169, 1997) — eigenvalue perturbation (Corollary III.2.6).
- T. F. Cox, M. A. A. Cox, *Multidimensional Scaling*, 2nd ed. (2001), §2.2–2.3 — classical
  scaling: the positive semidefinite Gram embedding step.
- C. Berge, *Topological Spaces* (1963), and C. D. Aliprantis, K. C. Border, *Infinite
  Dimensional Analysis*, 3rd ed. (2006), Ch. 17 — the maximum theorem, hemicontinuity.
- G. Dal Maso, *An Introduction to Γ-Convergence* (1993) — recovery of minimizers from
  approximate minimizers.
- J. A. Tropp, *An Introduction to Matrix Concentration Inequalities* (Found. Trends ML, 2015)
  — the sharper `log n` route deliberately not taken here.
- R. Vershynin, *High-Dimensional Probability* (2018) — sample covariance concentration and its
  uses.

## Provenance

A complete implementation of Parts A and B and of most of Parts C and D exists in the AIQ DKPS
formalization (Kitware, Inc., Apache-2.0), in `TauCeti.*` and `TauCeti.Matrix.*` namespaces. It
establishes feasibility and provides source provenance for integration, but this roadmap
specifies the desired mathematics intrinsically and does not prescribe the donor API or proof
architecture.

Milestones A2, B3 and the `RCLike` half of C1 are specified above and not implemented there.
Several Part A and B statements are additionally pinned as data by a conformance harness in
that repository, which constrains renames on the donor side but not the API asked for here;
in particular a `[DecidableEq n]` instance carried by three Part A rank theorems is an artifact
of that pinning and should be dropped upstream.
