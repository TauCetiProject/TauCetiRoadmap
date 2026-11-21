# Roadmap: Hankel forms and real moment problems

**Summary.** A real sequence `m₀, m₁, m₂, …` defines the Hankel quadratic forms
`∑_{i,j<n} m_{i+j} ξᵢ ξⱼ`. A measure μ on the real line *represents* `m` when every power `xᵏ` is
μ-integrable and `∫ xᵏ dμ = m_k` for every `k`; it represents `m` up to degree `d` when this holds
for `k ≤ d`. Such a measure is finite, because the constant `1` is integrable. This roadmap
characterizes the sequences that have a representing measure on the line, on the half-line and on
a compact interval, in terms of positive semidefinite Hankel matrices, and it solves the truncated
problem on the line. The theorems are stated in semidefinite form, so they cover singular Hankel
matrices and measures with finitely many atoms; the determinant form of Stieltjes's theorem is the
one statement about measures of infinite support only.

The headline theorems are these.

- *Hamburger's theorem, semidefinite form.* A real sequence `m` is represented by some measure on
  ℝ if and only if every Hankel matrix `(m_{i+j})_{i,j<n}` is positive semidefinite. If moreover
  one of them is singular, `m` is the moment sequence of finitely many positive point masses,
  and only one measure represents it.
- *Stieltjes's theorem.* `m` is represented by a measure carried by `[0, ∞)` if and only if the
  Hankel matrices of `m` and of the shifted sequence `(m_{k+1})` are all positive semidefinite.
  All their determinants are positive exactly when such a measure exists with infinite support.
- *Compact intervals and Hausdorff's theorem.* For `a ≤ b`, `m` is represented by a measure
  carried by `[a, b]` if and only if the Hankel matrices of `m` and of
  `(a + b) m_{k+1} − m_{k+2} − ab m_k` are positive semidefinite, and then no other measure on ℝ
  represents `m`. A sequence is represented by a measure carried by `[0, 1]` if and only if it is
  completely monotone: `∑_{j≤n} (−1)ʲ C(n, j) m_{k+j} ≥ 0` for all `n` and `k`.
- *The truncated Hamburger problem.* `m₀, …, m_{2k}` are the first moments of some measure on ℝ
  if and only if the Hankel matrix of size `k + 1` is positive semidefinite and either positive
  definite or of the same rank as its leading block of size `k`; a measure with exactly that rank
  many atoms then has the same moments, and when the matrix is singular it is the only one.

The roadmap builds on SpecialFunctionsOrthogonalPolynomialsGeneral, whose Hamburger theorem for
positive Hankel determinants and measures of infinite support it extends to the semidefinite case,
and whose bound on the support of a measure with geometrically growing moments it uses. It sits
beside PositiveDefiniteSequencesAndToeplitzForms, which treats Toeplitz forms and the
trigonometric moment problem on the circle. Tau Ceti supplies
moment determinacy for compactly supported measures and the indeterminate log-normal example;
Mathlib supplies positive semidefinite matrices, ranks and Prokhorov's theorem.

Layer 1 below treats Hankel forms of sequences and of measures and computes the rank of a moment
Hankel matrix. Layer 2, which uses it, treats singular Hankel matrices and proves Hamburger's
theorem. Layer 3, which uses Layer 2, treats the half-line and compact intervals. Layer 4 solves
the truncated problem from Layers 1 and 2.

## Conventions

- **Measures.** All measures are `μ : Measure ℝ` with the Borel σ-algebra. `RepresentsUpTo μ m d`
  says that for every `k ≤ d` the function `x ↦ xᵏ` is `μ`-integrable and `∫ xᵏ dμ = m k`;
  `Represents μ m` says this for every `k`. The integral is Mathlib's Bochner integral, which is
  `0` for a function that is not integrable, so the integrability clause is part of every
  statement. Integrability of `x ↦ x⁰ = 1` makes `μ` finite. `∫ xᵏ dμ` is Mathlib's
  `ProbabilityTheory.moment id k μ`.
- **"Carried by."** A measure is carried by a set `S` when `∀ᵐ x ∂μ, x ∈ S`. The support
  `μ.support` is Mathlib's topological support; on ℝ its complement is `μ`-null
  (`MeasureTheory.Measure.measure_compl_support`). `μ.support.encard` is its cardinality in `ℕ∞`.
- **Hankel matrices.** `hankelMatrix m` is the matrix `(m (i + j))` indexed by `ℕ × ℕ`, and
  `hankelSection m n` its leading section `(m (i + j))_{i,j<n}`, indexed by `Fin n`. The section
  of size `0` is the empty matrix, which is positive definite, with determinant `1` and rank `0`.
  `(hankelSection m n).det` is SpecialFunctionsOrthogonalPolynomialsGeneral's `hankelDet m n`.
  The shift of `m` is `k ↦ m (k + 1)`.
- **Positivity.** `Matrix.PosSemidef` and `Matrix.PosDef` are Mathlib's; for a matrix indexed by
  `ℕ` they quantify over finitely supported vectors, so `hankelMatrix m` is positive semidefinite
  exactly when every section is (1.1). Hankel matrices are symmetric, so the Hermitian part of
  both notions is automatic. Ranks are Mathlib's `Matrix.rank` over ℝ.
- **The Riesz functional.** `L_m` is the linear functional on `ℝ[X]` with `L_m(Xᵏ) = m k`, that
  is `p.sum fun k a => a * m k`. For a polynomial `p = ∑_{i<n} ξᵢ Xⁱ`, `L_m(p²)` is the Hankel
  form `ξᵀ (hankelSection m n) ξ`.
- **Atomic representations.** A finite set `s ⊆ ℝ` with weights `w` positive on `s` represents
  `m` on a set of indices when `m k = ∑_{x ∈ s} w x · xᵏ` there; this is the moment sequence of
  `∑_{x ∈ s} w x δ_x`.
- **Complete monotonicity.** `IsCompletelyMonotoneSeq m` says
  `∑_{j ≤ n} (−1)ʲ C(n, j) m (k + j) ≥ 0` for all `n, k : ℕ`. By `fwdDiff_iter_eq_sum_shift` the
  sum is `(−1)ⁿ Δⁿ m (k)` for Mathlib's forward difference `fwdDiff 1`.

## Layer 1: Hankel forms of sequences and of measures

### 1.1 Hankel matrices and positive functionals

Define `hankelMatrix m` and `hankelSection m n`. Prove, for every `m : ℕ → ℝ`:

- `posSemidef_hankelMatrix_iff`: `hankelMatrix m` is positive semidefinite if and only if every
  `hankelSection m n` is, if and only if `L_m(p²) ≥ 0` for every `p : ℝ[X]` (Schmüdgen, Ten
  Lectures, Theorem 1.12, equivalence of (ii), (iii) and (iv), pp. 14–15; Proposition 9.2,
  p. 68);
- `sum_mul_eq_zero_of_sum_mul_self_eq_zero`, **the kernel is an ideal:** if `hankelMatrix m` is
  positive semidefinite and `L_m(p²) = 0`, then `L_m(p q) = 0` for every `q : ℝ[X]` (Schmüdgen,
  Ten Lectures, Proposition 9.3 (i), pp. 68–69, stated there for functionals on a
  finite-dimensional space of polynomials).

Route: `L_m(p q) = ξ_pᵀ (hankelSection m n) ξ_q` for polynomials of degree less than `n` with
coefficient vectors `ξ_p`, `ξ_q` (Schmüdgen, Proposition 9.2 (i)). A finitely supported vector on
`ℕ` lives on some `{0, …, n − 1}`, and `L_m(p²)` is the form of the section of size `n`. For the
kernel statement apply `Matrix.PosSemidef.dotProduct_mulVec_zero_iff` to a section of size larger
than `deg p + deg q`: the form vanishes at `ξ_p`, so the section kills `ξ_p`, and `L_m(p Xʲ) = 0`
for every `j` below that size.

**Checks.**
- `m = (1, 0, 0, …)` (the moments of `δ₀`): every section is `diag(1, 0, …, 0)`, positive
  semidefinite; `L_m(X²) = 0` and indeed `L_m(X q) = 0` for every `q`.
- Positive semidefiniteness is needed for the kernel statement: `m = (1, 0, −1, 0, 0, …)` has
  `L_m(X²) = −1`, `L_m((1 + X²)²) = 1 − 2 = −1`, and its section of size `2` is `diag(1, −1)`.
  For `p = 1 + X` the value `L_m(p²) = 1 + 0 − 1 = 0`, while `L_m(p · 1) = 1 ≠ 0`.

*Needs:* Mathlib `Matrix.PosSemidef`, `Matrix.PosSemidef.submatrix`,
`Matrix.PosSemidef.dotProduct_mulVec_zero_iff`, `Finsupp`.

### 1.2 Representing measures and the rank of a moment section

Define `RepresentsUpTo μ m d` and `Represents μ m` as in the Conventions. Prove:

- if `μ` represents `m` up to degree `2n`, the section of size `n + 1` is positive semidefinite,
  with form `ξᵀ (hankelSection m (n + 1)) ξ = ∫ p_ξ² dμ` for `p_ξ = ∑_{i≤n} ξᵢ Xⁱ`; so every
  `hankelMatrix m` with `Represents μ m` is positive semidefinite;
- `rank_hankelSection_eq_min`: if `RepresentsUpTo μ m (2 * n)`, then the rank of
  `hankelSection m (n + 1)` is `min (n + 1) |supp μ|`, with `|supp μ| = μ.support.encard`
  (Schmüdgen, Ten Lectures, Proposition 9.10, pp. 71–72, for finitely atomic measures; the
  general case is proved here by the route below).

Route: `∫ p_ξ² dμ = 0` exactly when `p_ξ` vanishes `μ`-almost everywhere, that is on
`μ.support`, since `p_ξ` is continuous and the complement of the support is null. So the kernel of
the section is the space of polynomials of degree at most `n` vanishing on the support. It is `0`
when the support has more than `n` points (`Polynomial.card_roots'`), and it has dimension
`n + 1 − s` when the support has `s ≤ n + 1` points, by Lagrange interpolation at those points
(`Lagrange.basis`).

The rank formula contains SpecialFunctionsOrthogonalPolynomialsGeneral 2.4's statement that
`Δ_n > 0` exactly when `n ≤ |supp μ|`; the rank also counts the support when the determinant
vanishes.

**Checks.**
- `δ₀ + δ₁` (moments `2, 1, 1, …`): the sections of sizes `0, …, 5` have ranks
  `0, 1, 2, 2, 2, 2` and those of sizes `0, …, 4` determinants `1, 2, 1, 0, 0`.
- `(δ₋₁ + δ₁)/2` (moments `1, 0, 1, 0, …`): ranks `0, 1, 2, 2, 2, 2`. The zero measure: every rank
  is `0` and the support is empty.
- Lebesgue measure on `[0, 1]` (moments `1/(k + 1)`): every section is a Hilbert matrix, of full
  rank; the determinants of sizes `1, 2, 3` are `1, 1/12, 1/2160`.
- The integrability clause is needed: for the Cauchy measure `dx/(π(1 + x²))` the function `x` is
  not integrable, so its Bochner integral is `0`, and so is that of `x²`. Without the clause the
  Cauchy measure would "represent" `(1, 0, 0)` up to degree `2`, whose section of size `2` has
  rank `1`, while the support is infinite.

*Needs:* 1.1; Mathlib `MeasureTheory.Measure.support`,
`MeasureTheory.Measure.measure_compl_support`, `MeasureTheory.Integrable`, `Matrix.rank`,
`Polynomial.card_roots'`, `Lagrange.basis`.

### Examples

The moment sequences of `δ₀`, `δ₀ + δ₁`, `(δ₋₁ + δ₁)/2`, the zero measure and Lebesgue measure on
`[0, 1]`, with the ranks of their sections.

### Dependencies

Mathlib `Matrix.PosSemidef`, `Matrix.PosSemidef.submatrix`,
`Matrix.PosSemidef.dotProduct_mulVec_zero_iff`, `Matrix.rank`, `MeasureTheory.Measure.support`,
`MeasureTheory.Measure.measure_compl_support`, `MeasureTheory.Integrable`,
`Polynomial.card_roots'`, `Lagrange.basis`. No other layer.

## Layer 2: the Hamburger moment problem

### 2.1 Singular sections

- `eq_of_representsUpTo_of_not_posDef`: if `hankelSection m (k + 1)` is not positive definite,
  any two measures representing `m` up to degree `2k` are equal (Zalar, Theorem 2.4 (i), p. 6,
  for `m₀ > 0` and `k ≥ 1`; the cases `m₀ = 0` and `k = 0` are proved here, see the Checks).
- `exists_atomic_of_not_posDef`: if `hankelMatrix m` is positive semidefinite and
  `hankelSection m n` is not positive definite, there are a finite set `s` with fewer than `n`
  points and weights `w` positive on `s` with `m k = ∑_{x ∈ s} w x · xᵏ` for every `k`, and the
  section of every size `N` has rank `min N |s|` (Schmüdgen, Ten Lectures, Proposition 1.13,
  p. 15, and Theorem 9.5, p. 69, in one variable).

Route for uniqueness: a nonzero vector `ξ` with `ξᵀ (hankelSection m (k + 1)) ξ = 0` gives a
nonzero polynomial `p` of degree at most `k` with `∫ p² dμ = ∫ p² dν = 0` (1.2), so both measures
are carried by the finite set `Z` of roots of `p`, with `|Z| ≤ k`. Their masses at the points of
`Z` solve `∑_{z ∈ Z} c_z zʲ = m j` for `j < |Z|`, a system with an invertible Vandermonde matrix
(`Matrix.det_vandermonde`), so the masses agree; when `p` is a nonzero constant both measures are
`0`.

Route for the atoms: let `r < n` be the largest size with `hankelSection m r` positive definite
and take a nonzero `ξ` in the kernel of the section of size `r + 1`. Its polynomial `p` has degree
exactly `r`, since the section of size `r` is positive definite. By 1.1 `L_m` vanishes on the
ideal `(p)`. The roots of `p` are real and simple: if `p = (X − a)² h`, put `q = (X − a) h`; if
`p = ((X − u)² + v²) h` with `v ≠ 0`, put `q = v h`, noting that `L_m(((X − u) h)²) ≥ 0`. In both
cases `L_m(q²) ≤ L_m(p h) = 0` and `q ≠ 0` has degree less than `r`, which contradicts the
positive definiteness of the section of size `r`. With the roots `x₁, …, x_r` and the Lagrange
basis `ℓᵢ`, every polynomial is congruent modulo `p` to `∑ᵢ q(xᵢ) ℓᵢ`, so
`L_m(q) = ∑ᵢ L_m(ℓᵢ) q(xᵢ)`; and `L_m(ℓᵢ) = L_m(ℓᵢ²) > 0`, since `ℓᵢ² − ℓᵢ` vanishes at every root.
The ranks follow from 1.2 applied to the measure `∑ᵢ L_m(ℓᵢ) δ_{xᵢ}`.

**Checks.**
- `m_k = 2 (−1)ᵏ + 3 · 2ᵏ`: the sections of sizes `0, …, 4` have determinants `1, 5, 54, 0, 0`;
  the kernel of the section of size `3` is spanned by `(−2, −1, 1)`, that is
  `X² − X − 2 = (X + 1)(X − 2)`, and the weights are `2` at `−1` and `3` at `2`.
- Positive semidefiniteness is needed: `m = (−1, 0, 0, …)` has section `[−1]` of size `1`, not
  positive definite, and is not `∑ w x · xᵏ` with positive weights, whose value at `k = 0` is
  nonnegative.
- The hypothesis of the uniqueness statement is needed: the moments of Lebesgue measure on
  `[0, 1]` up to degree `4` give a positive definite section of size `3`, and the Gauss measure
  with nodes `1/2 − √15/10`, `1/2`, `1/2 + √15/10` and weights `5/18`, `8/18`, `5/18` has the same
  moments `1, 1/2, 1/3, 1/4, 1/5` (and `1/6`), but sixth moment `57/400 ≠ 1/7`.
- `k = 0`: a section `[m₀]` that is not positive definite has `m₀ ≤ 0`, and only the zero measure
  can have mass `m₀`.

*Needs:* 1.1, 1.2; Mathlib `Matrix.det_vandermonde`, `Lagrange.basis`, `Polynomial.card_roots'`,
`MeasureTheory.Measure.dirac`.

### 2.2 Hamburger's theorem

`posSemidef_hankelMatrix_iff_exists_represents`: `hankelMatrix m` is positive semidefinite if and
only if some measure on ℝ represents `m` (Schmüdgen, Ten Lectures, Theorem 1.12, (i) ⇔ (iii),
pp. 14–15).

Route: the reverse direction is 1.2. For the forward direction, if every section is positive
definite, every Hankel determinant is positive (`Matrix.PosDef.det_pos`), and
SpecialFunctionsOrthogonalPolynomialsGeneral 7.3 gives an orthogonality measure, whose powers are
integrable and whose moments are `m`. Otherwise some section is not positive definite and 2.1
gives the atomic measure `∑_{x ∈ s} w x δ_x`.

When every section is positive definite the representing measure need not be unique; the
indeterminate case is outside this roadmap.

**Checks.**
- The Gaussian moments `1, 0, 1, 0, 3, …` have all sections positive definite; `δ₀ + δ₁` has a
  singular section of size `3` and is the only measure with its moments (2.1).
- Indeterminacy: Tau Ceti's `TauCeti.Probability.logNormalMomentPerturbation ε` for
  `|ε| ≤ 1` all have every power integrable and moments `e^{k²/2}`
  (`TauCeti.Probability.integral_pow_logNormalMomentPerturbation`), and distinct `ε` give
  distinct measures (`TauCeti.Probability.injOn_logNormalMomentPerturbation`); so the
  positive semidefinite sequence `e^{k²/2}` has infinitely many representing measures.
- `m = (1, 2, 1, …)` with `m₂ = 1`: the section of size `2` is `[[1, 2], [2, 1]]`, with
  eigenvalue `−1`; no measure of mass `1` has first moment `2` and second moment `1`.

*Needs:* 1.2, 2.1; SpecialFunctionsOrthogonalPolynomialsGeneral 7.3; Mathlib
`Matrix.PosDef.det_pos`.

### Examples

`2 δ₋₁ + 3 δ₂` recovered from the kernel of a section; the Gaussian; the log-normal family.

### Dependencies

Layer 1. SpecialFunctionsOrthogonalPolynomialsGeneral 7.3. Mathlib `Matrix.det_vandermonde`,
`Matrix.PosDef.det_pos`, `Lagrange.basis`, `Polynomial.card_roots'`,
`MeasureTheory.Measure.dirac`. Tau Ceti `TauCeti.Probability.logNormalMomentPerturbation` and its
moment lemmas (Checks only).

## Layer 3: the half-line and compact intervals

### 3.1 Stieltjes's theorem

- `stieltjes_iff_exists_represents`: `hankelMatrix m` and the Hankel matrix of the shift
  `k ↦ m (k + 1)` are both positive semidefinite if and only if some measure carried by `[0, ∞)`
  represents `m` (Schmüdgen, Ten Lectures, Theorem 1.15, (i) ⇔ (iii), p. 15).
- `stieltjes_det_pos_iff`: every `(hankelSection m n).det` and every determinant of a section of
  the shift is positive if and only if some measure carried by `[0, ∞)` with infinite support
  represents `m` (Simon, Theorem 1, p. 4, for `m₀ = 1`; with `m₀ > 0` by scaling).

Route for the first: put `s_{2k} = m_k` and `s_{2k+1} = 0`. Splitting indices by parity, the
Hankel form of `s` is the sum of the forms of `m` (even indices) and of the shift (odd indices),
so `hankelMatrix s` is positive semidefinite. By 2.2 some `ν` represents `s`; its reflection
`x ↦ −x` represents `s` too, since the odd moments vanish, so the symmetrization `ν'` does. The
image of `ν'` under `x ↦ x²` (`MeasureTheory.Measure.map`) is carried by `[0, ∞)` and has moments
`∫ x^{2k} dν' = m_k`. Conversely, for `μ` carried by `[0, ∞)` the form of the shift is
`∫ x p² dμ ≥ 0`.

Route for the second: if all determinants of `m` and of the shift are positive,
SpecialFunctionsOrthogonalPolynomialsGeneral 7.3 gives measures representing `m` and the shift, so
both Hankel matrices are positive semidefinite (1.2), and the first statement gives `μ`; its
support is infinite, since by 1.2 a support of `s` points makes the section of size `s + 1`
singular. Conversely, `μ` and `μ.withDensity (fun x => ENNReal.ofReal x)`, which represents the
shift and whose support contains the infinite set `μ.support ∩ (0, ∞)`, have every power
integrable and infinite support, so 7.3 (its easy direction) gives positive determinants.

**Checks.**
- `δ₋₁` (moments `(−1)ᵏ`): `hankelMatrix m` is positive semidefinite, but the section of size `1`
  of the shift is `[−1]`.
- The exponential law (moments `k!`): the sections of sizes `0, …, 4` have determinants
  `1, 1, 1, 4, 144`, those of the shift `1, 1, 2, 24, 3456`; the sequence `s` of the route has
  section determinants `1, 1, 1, 1, 2, 8` for sizes `0, …, 5`.
- No uniqueness is claimed: the log-normal measures of the Check of 2.2 are carried by `(0, ∞)`.
- `δ₀ + δ₁`: positive semidefinite with its shift (moments `1, 1, …` of `δ₁`), but the
  determinant of size `3` is `0` and the support is finite.

*Needs:* 1.2, 2.2; SpecialFunctionsOrthogonalPolynomialsGeneral 7.3; Mathlib
`MeasureTheory.Measure.map`, `MeasureTheory.Measure.withDensity`.

### 3.2 Compact intervals

`exists_unique_represents_Icc_iff`: let `a ≤ b`. `hankelMatrix m` and the Hankel matrix of
`k ↦ (a + b) m (k + 1) − m (k + 2) − a b m (k)` are both positive semidefinite if and only if some
measure carried by `[a, b]` represents `m`; that measure is then the only measure on ℝ that
represents `m` (Schmüdgen, Ten Lectures, Theorem 1.16, (i) ⇔ (ii), p. 16, for `a < b`; the case
`a = b` and the uniqueness are proved here by the route below).

Route: the second form is `L_m((b − X)(X − a) p²)`, which is `≥ 0` for a measure on `[a, b]`.
Conversely, let `μ` represent `m` (2.2). The case `p = Xⁿ` and the bound
`|m_{2n+1}| ≤ (m_{2n} m_{2n+2})^{1/2}` from a `2 × 2` principal minor give
`m_{2n+2} ≤ |a + b| (m_{2n} m_{2n+2})^{1/2} + |ab| m_{2n}`, hence `m_{2n+2} ≤ c² m_{2n}` with
`c = (|a + b| + ((a + b)² + 4|ab|)^{1/2})/2`, and `∫ x^{2n} dμ ≤ m₀ c^{2n}`. By
SpecialFunctionsOrthogonalPolynomialsGeneral 7.4 (its auxiliary bound on the support) every
representing measure is carried by `[−c, c]`. On that compact set polynomials approximate
`f^{1/2}` uniformly for every continuous `f ≥ 0`, so `∫ (b − x)(x − a) f dμ ≥ 0`, and
`(b − x)(x − a) ≥ 0` `μ`-almost everywhere: `μ` is carried by `[a, b]`. Two representing measures
are carried by `[−c, c]` and have the same moments, so they are equal
(`TauCeti.Measure.ext_of_forall_integral_pow_eq_of_support`).

**Checks.**
- Lebesgue measure on `[0, 1]`, `a = 0`, `b = 1`: the second sequence is
  `m_{k+1} − m_{k+2} = 1/((k + 2)(k + 3))`, that is `1/6, 1/12, 1/20, 1/30, …`, the moments of
  `x(1 − x) dx`.
- `δ₂` with `a = 0`, `b = 1`: the second sequence is `−2^{k+1}`, not positive semidefinite.
- The hypothesis `a ≤ b` is needed: for `a = 1`, `b = 0` and `δ_{1/2}` both matrices are positive
  semidefinite (the second sequence is `(1/4)(1/2)ᵏ`), but no nonzero measure is carried by the
  empty set `[1, 0]`.
- `a = b = 3`: `δ₃` satisfies both conditions (the second sequence is `0`), and `δ₂` fails the
  second (`−(2 − 3)² 2ᵏ`).
- The uniqueness is among all measures on ℝ, which the log-normal family of 2.2 shows is a real
  restriction on `m`.

*Needs:* 1.1, 1.2, 2.2; SpecialFunctionsOrthogonalPolynomialsGeneral 7.4; Tau Ceti
`TauCeti.Measure.ext_of_forall_integral_pow_eq_of_support`; Mathlib
`polynomialFunctions_closure_eq_top` (Weierstrass).

### 3.3 Hausdorff's theorem

Define `IsCompletelyMonotoneSeq m`. Prove `isCompletelyMonotoneSeq_iff_exists_represents`: `m` is
completely monotone if and only if some measure carried by `[0, 1]` represents `m` (Schmüdgen, Ten
Lectures, Theorem 1.18, p. 16). By 3.2 that measure is the only representing measure on ℝ.

Route: for `μ` on `[0, 1]` the sum is `∫ xᵏ (1 − x)ⁿ dμ ≥ 0`. Conversely (Hausdorff's route
through Bernstein polynomials) put `w_{n,j} = C(n, j) ∑_{i ≤ n − j} (−1)ⁱ C(n − j, i) m (j + i)`,
which is `≥ 0` and is `L_m` of the Bernstein polynomial `bernsteinPolynomial ℝ n j`. These weights
sum to `m₀`, and `∑_j w_{n,j} (j/n)ᵏ` is `L_m` of the Bernstein approximation of `xᵏ`, a
polynomial of degree at most `k` whose coefficients tend to those of `xᵏ`; so the moments of
`μ_n = ∑_j w_{n,j} δ_{j/n}` tend to `m_k`. The `μ_n` are carried by `[0, 1]`, hence tight; by
Prokhorov's theorem (`isCompact_closure_of_isTightMeasureSet`, after normalizing by `m₀ > 0`) a
subsequence converges weakly to a measure carried by the closed set `[0, 1]`, whose moments are
the limits, since `xᵏ` agrees on `[0, 1]` with a bounded continuous function. When `m₀ = 0` every
weight is `0`, so every `m_k` is the limit `0` and the zero measure represents `m`.

**Checks.**
- Lebesgue measure on `[0, 1]`: `∑_j (−1)ʲ C(n, j)/(k + j + 1) = k! n!/(n + k + 1)! > 0`.
- The factor `(−1)ⁿ` is essential: the plain forward difference `Δm(0) = m₁ − m₀` of `1/(k + 1)`
  is `1/2 − 1 = −1/2`, so `Δⁿ m ≥ 0` fails for Lebesgue measure.
- `(1, 1/2, 1/2, …)`, the moments of `(δ₀ + δ₁)/2`, is completely monotone; `(1, 1/2, 0, 0, …)`
  is not: `n = 3`, `k = 0` gives `1 − 3/2 + 0 − 0 = −1/2`, although `n = 1, 2` at `k = 0` give
  `1/2` and `0`.
- `δ₂` (moments `2ᵏ`) fails at `n = 1`, `k = 0` with `−1`; `δ₋₁` fails at `n = 0`, `k = 1`.
- The library's difference: `IsCompletelyMonotoneSeq m` is `∀ n k, 0 ≤ (−1)ⁿ (fwdDiff 1)^[n] m k`
  by `fwdDiff_iter_eq_sum_shift`, which writes `Δⁿ m (k)` as `∑_j (−1)^{n−j} C(n, j) m (k + j)`.

*Needs:* 3.2 (for the uniqueness sentence); Mathlib `bernsteinPolynomial`,
`bernsteinPolynomial.sum`, `isCompact_closure_of_isTightMeasureSet`,
`MeasureTheory.ProbabilityMeasure`, `fwdDiff_iter_eq_sum_shift`, `MeasureTheory.Measure.dirac`.

### Examples

Lebesgue measure on `[0, 1]` in all three theorems; `δ₋₁` and `δ₂` as non-examples; the
exponential law on `[0, ∞)`.

### Dependencies

Layers 1 and 2. SpecialFunctionsOrthogonalPolynomialsGeneral 7.3 and 7.4. Tau Ceti
`TauCeti.Measure.ext_of_forall_integral_pow_eq_of_support`. Mathlib `MeasureTheory.Measure.map`,
`MeasureTheory.Measure.withDensity`,
`polynomialFunctions_closure_eq_top`, `bernsteinPolynomial`, `bernsteinPolynomial.sum`,
`isCompact_closure_of_isTightMeasureSet`, `fwdDiff_iter_eq_sum_shift`.

## Layer 4: the truncated Hamburger moment problem

### 4.1 Existence

`exists_representsUpTo_iff`: for `m : ℕ → ℝ` and `k : ℕ`, some measure represents `m` up to
degree `2k` if and only if `hankelSection m (k + 1)` is positive semidefinite and either positive
definite or of the same rank as `hankelSection m k` (Zalar, Theorem 2.4, (1) ⇔ (5), p. 6,
restating Curto and Fialkow 1991, Theorems 3.9 and 3.10, for `m₀ > 0` and `k ≥ 1`; the cases
`m₀ = 0` and `k = 0` are proved here, see the Checks).

Route. Necessity: the section is positive semidefinite by 1.2. If it is singular, the route of
2.1 shows that a representing measure has finitely many atoms `s ≤ k`, and 1.2 gives rank
`min(k + 1, s) = s = min(k, s)` for both sections. Sufficiency, the flat case: a positive
semidefinite section whose rank `r` equals that of the section of size `k` extends, by the
recursion `m_j = ∑_{i<r} φᵢ m_{j−r+i}` of its generating polynomial `X^r − ∑ φᵢ Xⁱ`, to a full
sequence all of whose sections are positive semidefinite of rank at most `r` (Zalar,
Proposition 2.1 (4), (c) ⇔ (e), p. 5, applied one step at a time); 2.1 then gives an atomic
representation. The positive definite case: choose `m_{2k+1}` freely and
`m_{2k+2} = uᵀ (hankelSection m (k + 1))⁻¹ u` with `u = (m_{k+1}, …, m_{2k+1})`, which makes the
section of size `k + 2` positive semidefinite of rank `k + 1` (a Schur complement,
`Matrix.PosDef.fromBlocks₁₁`), and apply the flat case (Zalar, Theorem 2.4 (ii), p. 7).

**Checks.**
- `m = (1, 0, 0, 0, 1)`, `k = 2`: the section of size `3` is `diag(1, 0, 1)`, positive semidefinite
  of rank `2`, but the section of size `2` is `diag(1, 0)`, of rank `1`. No measure exists: the
  vector `(0, 1, 0)` gives `∫ x² dμ = 0`, so `μ = m₀ δ₀` and `m₄ = 0`.
- `m = (1, 0, 1, 0, 1)`: both sections have rank `2`, and `(δ₋₁ + δ₁)/2` represents `m`.
- `m = (0, 0, 0, 0, 1)`: the section of size `3` is positive semidefinite of rank `1`, the section
  of size `2` has rank `0`, and no measure of mass `0` has fourth moment `1`. This is a case with
  `m₀ = 0`, outside the source's hypothesis, where the statement still holds.
- `k = 0`: the condition reads `m₀ ≥ 0` (for `m₀ = 0` both ranks are `0`), and `m₀ δ_x` represents
  `m₀` for every `x`.
- `δ₋₂ + 2δ₁ + 3δ₃` (moments `6, 9, 33, 75, 261, …`): for `k = 0, 1, 2` the section of size
  `k + 1` is positive definite; for `k = 3, 4` it is singular and both sections have rank `3`.

*Needs:* 1.2, 2.1; Mathlib `Matrix.rank`, `Matrix.PosDef.fromBlocks₁₁`,
`Matrix.det_vandermonde`.

### 4.2 Minimal representing measures

`exists_atomic_of_representsUpTo`: if `μ` represents `m` up to degree `2k`, a finite set `s` with
exactly `rank (hankelSection m (k + 1))` points and weights positive on `s` represent `m` on
`0, …, 2k` (Zalar, Theorem 2.4, (1) ⇔ (2), p. 6, for `m₀ > 0`, `k ≥ 1`). When the section is
singular this measure is `μ` itself (2.1); when it is positive definite it has `k + 1` atoms.

Route: in the singular case `μ` is atomic with `s` atoms and rank `s` (route of 4.1); in the
positive definite case the extension of the route of 4.1 has rank `k + 1`, and 2.1 gives `k + 1`
atoms. When `μ` has infinite support, the `(k + 1)`-point Gauss measure of
SpecialFunctionsOrthogonalPolynomialsGeneral 5.3 (`gauss_quadrature`, exact up to degree
`2k + 1`) is one such measure; 4.2 also covers finite supports and singular sections.

**Checks.**
- Lebesgue measure on `[0, 1]` up to degree `4`: rank `3`, and the three-point Gauss measure of
  the Check of 2.1 represents `m` there.
- `m = (1, 0, 1, 0, 1)`: rank `2`, atoms `±1` with weights `1/2`.
- `m₀ = 0`: rank `0`, and the empty set represents `m`.

*Needs:* 1.2, 2.1, 4.1.

### Examples

`(1, 0, 0, 0, 1)` with no representing measure; `(1, 0, 1, 0, 1)` with exactly one; the moments
of Lebesgue measure on `[0, 1]` up to degree `4` with many, among them a three-point one.

### Dependencies

Layers 1 and 2. Mathlib `Matrix.rank`, `Matrix.PosDef.fromBlocks₁₁`, `Matrix.det_vandermonde`.

## Scope and ownership

This roadmap owns the targets stated above: Hankel matrices of real sequences and their kernel
(1.1); representing measures and the rank of moment sections (1.2); uniqueness for singular
sections and the atomic representation of positive semidefinite Hankel sequences with a singular
section (2.1); Hamburger's theorem in semidefinite form (2.2); Stieltjes's theorem in its
semidefinite and determinant forms (3.1); the Hankel characterization of moment sequences on a
compact interval with uniqueness (3.2); completely monotone sequences and Hausdorff's theorem
(3.3); the truncated Hamburger moment problem and its minimal representing measures (Layer 4).

Already in the libraries and therefore not targets:

- Tau Ceti's moment determinacy for finite measures carried by a common compact set
  (`TauCeti.Measure.ext_of_forall_integral_pow_eq_of_support`, in
  `TauCeti/Probability/Moments/CompactDeterminacy.lean`) and with a finite exponential moment
  (`TauCeti.Measure.ext_of_forall_integral_pow_eq_of_exists_integrable_exp`). Once the growth
  bound of the route of 3.2 places every representing measure on one compact interval, the first
  gives the uniqueness in 3.2 and 3.3.
- Tau Ceti's log-normal moment family (`TauCeti/Probability/Distributions/LogNormal/`
  `MomentIndeterminacy.lean`), used in Checks.
- Tau Ceti's `TauCeti.sub_nonneg_of_posSemidef_hankel`: a positive semidefinite infinite Hankel
  matrix of a sequence bounded above has `m₀ ≥ m₁`. It uses the same carrier
  (`Matrix.PosSemidef fun i j : ℕ => a (i + j)`) as `hankelMatrix` here.
- Tau Ceti's completely monotone functions on `[0, ∞)` and the Hausdorff–Bernstein–Widder
  theorem (`TauCeti.hausdorff_bernstein_widder`,
  `TauCeti.hausdorff_bernstein_widder_difference`), the formalization of
  Completed/OneParameterSemigroups Part B. `IsCompletelyMonotoneSeq` is the notion for sequences,
  whose representing measures live on `[0, 1]` rather than being Laplace transforms on `[0, ∞)`;
  nothing here restates Part B.

Left to other roadmaps:

- SpecialFunctionsOrthogonalPolynomialsGeneral owns, among much else, Hankel determinants of the
  moments and their positivity (2.4), Gauss quadrature (5.3), the functional of a recurrence and
  Favard's theorem (7.1–7.2), Hamburger's theorem for positive Hankel determinants and measures
  with infinite support (7.3) and uniqueness for bounded recurrence data with its support bound
  (7.4). This roadmap cites 7.3, 7.4 and 5.3 and restates none of them: 2.2 is the semidefinite
  statement, which also covers finitely atomic measures; 1.2 computes the rank of a section, of
  which 2.4's positivity criterion is the full-rank case; and 4.2 asks only for some measure with
  rank-many atoms and the moments up to degree `2k`, which for a measure of infinite support the
  Gauss measure of 5.3 provides.
- Toeplitz sections and the trigonometric moment problem on the circle are not treated here;
  PositiveDefiniteSequencesAndToeplitzForms treats them (its Layers 3 and 5). 2.1 and 4.1 here are
  the analogues on the line of its 3.4 and 5.1–5.3, for Hankel rather than Toeplitz sections;
  nothing there is restated, and this roadmap does not depend on it.
- ClassicalArithmeticCompletion 6.21 owns the Hankel determinant of a sequence over a commutative
  ring; this roadmap uses only real Hankel matrices.

Outside the scope: the indeterminate moment problem, its Nevanlinna parametrization and the
Carleman and Krein criteria; Haviland's theorem and moment problems in several variables,
including the flat extension theorem there; the truncated Stieltjes problem and the truncated
problem on a compact interval, with the Markov–Lukács description of polynomials nonnegative on
an interval; the Schur algorithm, Nevanlinna–Pick interpolation and the Carathéodory–Fejér problem
for bounded analytic functions; Szegő theory, orthogonal polynomials on the unit circle and the
asymptotics of orthogonal polynomials on the line; Schoenberg's theorem on radial positive
definite functions.

## Exact supplier contracts

### From Mathlib

- `Mathlib/LinearAlgebra/Matrix/PosDef.lean`: `Matrix.PosSemidef` (Hermitian and
  `0 ≤ ∑ᵢ ∑ⱼ star xᵢ Mᵢⱼ xⱼ` for every finitely supported `x`), `Matrix.PosDef` (the same sum
  positive for `x ≠ 0`), `Matrix.PosSemidef.submatrix` (any reindexing),
  `Matrix.PosSemidef.dotProduct_mulVec_zero_iff` (for a positive semidefinite matrix over a finite
  index type, `star x ⬝ᵥ A *ᵥ x = 0` iff `A *ᵥ x = 0`), `Matrix.PosDef.det_pos`,
  `Matrix.PosDef.fromBlocks₁₁` (for `A` positive definite, `fromBlocks A B Bᴴ D` is positive
  semidefinite iff `D − Bᴴ A⁻¹ B` is).
- `Mathlib/LinearAlgebra/Matrix/Rank.lean`: `Matrix.rank`. `Mathlib/LinearAlgebra/Vandermonde.lean`:
  `Matrix.det_vandermonde` (`det (vandermonde v) = ∏ᵢ ∏_{j > i} (v j − v i)`).
- `Mathlib/Algebra/Polynomial/Roots.lean`: `Polynomial.card_roots'` (at most `natDegree` roots).
  `Mathlib/LinearAlgebra/Lagrange.lean`: `Lagrange.basis`.
- `Mathlib/MeasureTheory/Measure/Support.lean`: `MeasureTheory.Measure.support`,
  `MeasureTheory.Measure.measure_compl_support` (in a hereditarily Lindelöf space the complement
  of the support is null). Measure theory: `MeasureTheory.Integrable`, `MeasureTheory.integral`
  (`0` for a non-integrable function), `MeasureTheory.Measure.dirac`, `MeasureTheory.Measure.map`,
  `MeasureTheory.Measure.withDensity`, `MeasureTheory.ProbabilityMeasure`,
  `ProbabilityTheory.moment`.
- `Mathlib/MeasureTheory/Measure/Prokhorov.lean`: `isCompact_closure_of_isTightMeasureSet` (a
  tight set of probability measures on a Hausdorff space with its Borel σ-algebra has
  compact closure).
- `Mathlib/RingTheory/Polynomial/Bernstein.lean`: `bernsteinPolynomial`,
  `bernsteinPolynomial.sum` (the Bernstein polynomials of degree `n` sum to `1`).
  `Mathlib/Topology/ContinuousMap/Weierstrass.lean`: `polynomialFunctions_closure_eq_top`
  (polynomials are dense in `C(Icc a b, ℝ)`).
- `Mathlib/Algebra/Group/ForwardDiff.lean`: `fwdDiff`, `fwdDiff_iter_eq_sum_shift`
  (`Δ_hⁿ f y = ∑_{k ≤ n} ((−1)^{n−k} C(n, k)) • f (y + k • h)`).

### From Tau Ceti

- `TauCeti/Probability/Moments/CompactDeterminacy.lean`:
  `TauCeti.Measure.ext_of_forall_integral_pow_eq_of_support` (two finite measures on ℝ with null
  complement of a common compact set and equal moments `∫ xⁿ` are equal), used in 3.2.
- `TauCeti/Probability/Moments/Determinacy.lean`:
  `TauCeti.Measure.ext_of_forall_integral_pow_eq_of_exists_integrable_exp`, named in the scope
  section.
- `TauCeti/Probability/Distributions/LogNormal/MomentIndeterminacy.lean`:
  `TauCeti.Probability.logNormalMomentPerturbation`,
  `TauCeti.Probability.integrable_pow_logNormalMomentPerturbation`,
  `TauCeti.Probability.integral_pow_logNormalMomentPerturbation` (for `|ε| ≤ 1`, every power is
  integrable with integral `e^{n²/2}`), `TauCeti.Probability.injOn_logNormalMomentPerturbation`
  (injective on `[−1, 1]`), used in the Checks of 2.2, 3.1 and 3.2.
- `TauCeti/Analysis/Matrix/PosSemidef/Basic.lean`: `TauCeti.sub_nonneg_of_posSemidef_hankel`,
  and `TauCeti/Analysis/CompletelyMonotone/Bernstein/HausdorffBernsteinWidder.lean`,
  `TauCeti/Analysis/CompletelyMonotone/FiniteDifference/Laplace.lean`:
  `TauCeti.hausdorff_bernstein_widder`, `TauCeti.hausdorff_bernstein_widder_difference`, named
  in the scope section.

### From TauCetiRoadmap.SpecialFunctionsOrthogonalPolynomialsGeneral

- 7.3, Hamburger's theorem, `exists_measure_iff_hankelDet_pos`: for `m : ℕ → ℝ`,
  `0 < hankelDet m n` for every `n` iff `m` is the moment sequence of an orthogonality measure
  (every power integrable and infinite support), with `hankelDet m n` the determinant of
  `(m (i + j))_{i,j<n}`. Used in 2.2 and 3.1.
- 7.4, its auxiliary bound: a finite measure `ν` with `∫ x^{2k} dν ≤ C M^{2k}` for every `k` and
  `M ≥ 0` is carried by `[−M, M]`. Used in 3.2.
- 5.3, Gauss quadrature, `gauss_quadrature`: for an orthogonality measure the `n`-point Gauss
  measure has positive weights and integrates every polynomial of degree at most `2n − 1`
  exactly. Named in 4.2.

## References

- K. Schmüdgen, *Ten Lectures on the Moment Problem*, arXiv:2008.12698, version 1 (August 2020):
  Theorem 1.12, pp. 14–15; Proposition 1.13 and Theorem 1.15, p. 15; Theorems 1.16 and 1.18,
  p. 16; Propositions 9.2 and 9.3, pp. 68–69; Theorem 9.5, p. 69; Proposition 9.10, pp. 71–72.
- B. Simon, The classical moment problem as a self-adjoint finite difference operator,
  *Adv. Math.* 137 (1998), 82–203; arXiv:math-ph/9906008, Theorem 1, p. 4. Page numbers refer to
  the arXiv version.
- A. Zalar, The strong truncated Hamburger moment problem with and without gaps,
  arXiv:2101.00486, version 2 (May 2022): Proposition 2.1, pp. 4–5; Theorem 2.4, pp. 6–7, which
  restates R. Curto and L. Fialkow, Recursiveness, positivity, and truncated moment problems,
  *Houston J. Math.* 17 (1991), 603–635, Theorems 3.9 and 3.10.
- The theorems of Hamburger (1920), Stieltjes (1894) and Hausdorff (1920) are named as Schmüdgen's
  preface dates them.
