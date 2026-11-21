# Roadmap: dimension of measures and digit sets

**Summary.** The Hausdorff dimension of a set is often computed by placing a measure on it and
watching how fast the measure of small intervals around a point decays. This roadmap builds that
method on the real line, with the intervals of a base-`b` expansion, and applies it to sets of
numbers defined by their digits and to badly approximable numbers. Its objects are the half-open
`b`-adic intervals, the lower local dimension of a measure (the lower limit of
`log μ(Iₙ(x)) / log |Iₙ(x)|` along the `b`-adic intervals `Iₙ(x)` containing `x`), the upper and
lower Hausdorff dimension of a measure, and the set of numbers whose digits occur with prescribed
frequencies. Hausdorff dimension and measure are the library's.

The headline theorems are these.

- *Billingsley's lemma.* Let `b ≥ 2` and let `μ` be a finite measure on the real line. If the lower
  local dimension of `μ` is at most `β` at every point of a set `A`, then `A` has Hausdorff
  dimension at most `β`. If it is at least `α` at every point of `A` and `A` has positive outer
  measure (here neither the finiteness of `μ` nor the base is needed), then `A` has dimension at
  least `α`.
- *Dimension of a measure.* For a nonzero finite measure on the line, the least dimension of a set
  of full measure is the essential supremum of the lower local dimension, and the infimum of the
  dimensions of the sets of positive measure is its essential infimum.
- *Digit frequencies.* For `b ≥ 2` and a probability vector `p` on the digits `0, …, b − 1`, the law
  of a number whose digits are independent with law `p` has dimension `H(p) / log b`, where
  `H(p) = −Σ p_d log p_d`. The theorem of Besicovitch and Eggleston says that the numbers of
  `[0, 1)` in whose expansion each digit `d` has frequency `p_d` form a set of the same dimension
  `H(p) / log b`, also when some `p_d` vanish. In particular the numbers that are not normal in base
  `b`, a Lebesgue-null set, have dimension one.
- *Jarník's theorem.* The badly approximable numbers, those `x` with `q · ‖q x‖` bounded below by a
  positive constant for all `q ≥ 1`, form a set of Hausdorff dimension one. The proof goes through a
  Cantor construction that keeps `k` of the `R` subintervals of every interval, the kept ones
  depending on the interval; such a set has dimension `log k / log R`.

The roadmap builds on FractalGeometry, whose mass distribution principle gives the lower bound in
Billingsley's lemma and whose self-similar measures are the digit measures used here; on
ProbabilisticAndMetricNumberTheory, whose normality predicate and almost-everywhere normality
theorem are used for the non-normal numbers; on Tau Ceti's badly approximable numbers; and on
Mathlib's Hausdorff dimension, digit expansions of reals and strong law of large numbers.

Layer 1 below defines the `b`-adic intervals and the local dimension and proves Billingsley's lemma.
Layer 2 defines the dimensions of a measure and identifies them with the essential bounds of the
local dimension. Layer 3 computes the dimension of the digit measures and of the digit-frequency
sets, using both earlier layers. Layer 4, which uses none of them, proves the Cantor construction
lemma and Jarník's theorem.

## Conventions

- `b` and `R` are natural numbers. A statement that needs `b ≥ 2` says so; statements that stay
  true for `b ≤ 1` by the conventions below carry no base hypothesis, and the Checks say why.
- `Iₙ(x) = badicCell b n x` is the half-open interval `[⌊bⁿ x⌋ / bⁿ, (⌊bⁿ x⌋ + 1) / bⁿ)` of length
  `b⁻ⁿ`, defined for every real `x` (Mathlib's `Int.floor`). For `b ≥ 2` the intervals of level `n`
  partition `ℝ`, each interval of level `n + 1` lies in one of level `n`, and two `b`-adic intervals
  are disjoint or nested. Intervals are half-open, so the non-uniqueness of expansions such as
  `0.1000… = 0.0111…` never arises: the point `1/2` lies in `[1/2, 1)` for `b = 2`.
- Digits are Mathlib's canonical expansion `Real.digits x b j = ⌊x · b^(j+1)⌋ mod b` (`j ≥ 0`), used
  for `x ∈ [0, 1)` only, and `Real.ofDigits ω = Σ ω(j) · b^(−j−1)` for a digit sequence `ω`. For
  `x ∈ [0, 1)` the canonical expansion is the terminating one at `b`-adic rationals (`1/2` has
  binary digits `1, 0, 0, …`), `Real.ofDigits (Real.digits x b) = x` for `b ≥ 2`, and `Iₙ(x)` is the
  set of `y ∈ [0, 1)` whose first `n` digits are those of `x`.
- Logarithms are natural. `ENNReal.log` sends `0` to `⊥` and `∞` to `⊤`; division in `EReal`
  satisfies `⊥ / c = ⊤` for a real `c < 0` and `a / 0 = 0`. Mathlib's `Real.log 0 = 0` is never
  used on a mass.
- `dimH` is Mathlib's Hausdorff dimension, with values in `ℝ≥0∞`, `dimH ∅ = 0`, and a real `s` is
  compared with it as `ENNReal.ofReal s` (so negative `s` count as `0`). `μH[s]` is Mathlib's
  Hausdorff measure. Measures on `ℝ` live on its Borel σ-algebra; `μ A` is the outer measure of an
  arbitrary set `A`.
- A probability vector on the digits is a `PMF (Fin b)`, and `p d` is read as a real number where
  needed. `H(p) = Σ_d negMulLog (p d)` with Mathlib's `Real.negMulLog x = −x log x`, so that a zero
  entry contributes `0`. Entropy is in nats and is divided by `log b`: `H(p) / log b` is the entropy
  in base-`b` units.
- Frequencies count positions `0 ≤ j < N`, as in ProbabilisticAndMetricNumberTheory §2.8.

## Layer 1: Local dimension and Billingsley's lemma

### 1.1 The b-adic intervals

Define `badicCell b n x` as in the Conventions (Bishop and Peres, Section 1.4, p. 16, for `x` in
`[0, 1]`; Hochman, Section 4.2, p. 15).

- For `b ≥ 2`, `x ∈ badicCell b n x`, the cells of level `n` are the intervals `[j/bⁿ, (j+1)/bⁿ)`,
  `j ∈ ℤ`, and `badicCell b (n + 1) x ⊆ badicCell b n x`.
- For `b ≥ 2`, every family of `b`-adic cells has a pairwise disjoint subfamily with the same union,
  namely its maximal members (Hochman, Lemma 4.6).
- For `b ≥ 2` and `x ∈ [0, 1)`, `badicCell b n x` is the set of `y ∈ [0, 1)` with
  `Real.digits y b j = Real.digits x b j` for all `j < n`, by Mathlib's
  `Real.ofDigits_digits_sum_eq` (`bⁿ` times the sum of the first `n` digit terms is `⌊bⁿ x⌋`).

**Checks.**

- `b = 2`, `x = 3/4`: the cells of levels `1, 2, 3` are `[1/2, 1)`, `[3/4, 1)`, `[3/4, 7/8)`, and
  the first three canonical digits of `3/4` are `1, 1, 0`.
- `b = 3`, `x = 1/3`: the cells of level `n ≥ 1` are `[1/3, 1/3 + 3⁻ⁿ)`, and the canonical digits
  are `1, 0, 0, …`; the other expansion `0.0222…` of `1/3` is not the one used.

*Needs:* Mathlib `Int.floor`, `Real.digits`, `Real.ofDigits_digits_sum_eq`.

### 1.2 The lower local dimension

Define `badicLowerLocalDim b μ x` in `EReal` as the lower limit, as `n → ∞`, of
`ENNReal.log (μ (Iₙ(x))) / log (b⁻ⁿ)` (Bishop and Peres, Lemmas 1.4.1 and 1.4.4, pp. 16–19;
Hochman, Definition 6.20, p. 51).

- For `b ≥ 2` and a finite measure `μ`, the local dimension is at least `0` everywhere: a cell has
  mass at most `μ ℝ`, and the quotient of a bounded logarithm by `−n log b` tends to `0`.
- For `b ≥ 2` and `α` real, `α ≤ badicLowerLocalDim b μ x` holds exactly when, for every `α' < α`,
  `μ (Iₙ(x)) < b^(−n α')` for all large `n`; and `badicLowerLocalDim b μ x ≤ β` exactly when, for
  every `β' > β`, `μ (Iₙ(x)) > b^(−n β')` for infinitely many `n`. These are the forms used below.
- For `b ≤ 1` the denominator `log (b⁻ⁿ)` is `0` (it is `log 1` for `b = 1` and `log 0 = 0` for
  `b = 0`, `n ≥ 1`), so the local dimension is identically `0`.

**Checks.**

- Lebesgue measure restricted to `[0, 1)`: every `x ∈ [0, 1)` has `μ (Iₙ(x)) = b⁻ⁿ`, so the local
  dimension is `1`.
- The unit mass at `x₀`: the local dimension is `0` at `x₀` and `⊤` at every `y ≠ x₀`, whose cells
  eventually have mass `0`, with `log 0 = ⊥` and `⊥ / (−n log b) = ⊤`. Computing with
  `Real.log 0 = 0` would give `0` at `y` as well, and a point mass would look zero-dimensional
  everywhere.
- Lebesgue measure on `[0, 1)` plus the unit mass at `0`, `b = 2`: the cell `[0, 2⁻ⁿ)` has mass
  `1 + 2⁻ⁿ`, whose logarithm divided by `−n log 2` is negative (`−0.585` at `n = 1`) and tends to
  `0`, so the local dimension at `0` is `0`; at every other point of `(0, 1)` it is `1` (Hochman,
  Definition 6.22, p. 52).
- Cells are not balls. For the Cantor measure (the self-similar measure of `x ↦ x/3`,
  `x ↦ (x + 2)/3` with equal weights) and `b = 3`, the cell `[1/3, 1/3 + 3⁻ⁿ)` meets the Cantor set
  only in `1/3`, which has mass `0`, so the `3`-adic local dimension at `1/3` is `⊤`, while balls
  about `1/3` have mass comparable to `rˢ` with `s = log 2 / log 3` (Hochman, after
  Definition 6.20). At points of the Cantor set that are not endpoints the `3`-adic value is
  `log 2 / log 3` (Bishop and Peres, Example 1.4.5).

*Needs:* 1.1; Mathlib `ENNReal.log`, `ENNReal.log_zero`, `EReal.bot_div_of_neg_ne_bot`,
`EReal.div_zero`, `Filter.liminf`.

### 1.3 Billingsley's lemma: the lower bound

Prove `le_dimH_of_le_badicLowerLocalDim`: let `μ` be a measure on `ℝ`, `A ⊆ ℝ` with `μ A ≠ 0` and
`α` real. If `α ≤ badicLowerLocalDim b μ x` for every `x ∈ A`, then `ENNReal.ofReal α ≤ dimH A`
(Bishop and Peres, Lemma 1.4.1, pp. 16–17, for Borel `A ⊆ [0, 1]` and finite `μ`; Hochman,
Proposition 4.7, p. 16, for arbitrary `A` and finite `μ`, and Remark 4.8). The statement here
assumes neither finiteness of `μ` nor measurability of `A`, and no base hypothesis; the route uses
none of them.

If `α ≤ 0` there is nothing to prove, and for `b ≤ 1` the hypothesis forces `α ≤ 0` (1.2). Let
`b ≥ 2` and `0 ≤ α' < α`. By 1.2 the sets `A_m` of points `x ∈ A` with `μ (Iₙ(x)) < b^(−n α')` for
all `n > m` increase to `A`, so `μ A_m → μ A` without any measurability (Mathlib's
`Monotone.measure_iUnion`), and `μ A_m ≠ 0` for some `m`. Let `ν` be `μ` restricted to `A_m`. A
closed ball of radius `r` with `b^(−n−1) < r ≤ b^(−n)`, `n > m`, meets at most three cells of level
`n`; each cell `J` that meets `A_m` is `Iₙ(y)` for some `y ∈ A_m`, so
`ν (closedBall x r) ≤ 3 · b^(−n α') ≤ 3 b^α' · r^α'` for every `x` and every `r ≤ b^(−m−1)`. The
mass distribution principle of FractalGeometry 3.1, applied to `ν` and `E = A_m`, gives
`μ A_m = ν A_m ≤ 3 b^α' · μH[α'] A_m`, so `μH[α'] A ≠ 0` and `α' ≤ dimH A`. Let `α'` tend to `α`.

**Checks.**

- `μ A ≠ 0` is needed: for `b ≥ 2` the zero measure has local dimension `⊤` everywhere (1.2), so
  `A = {0}` and `α = 1` satisfy the pointwise hypothesis while `dimH {0} = 0`.
- Lebesgue measure restricted to `[0, 1)`, `A` any set of positive outer Lebesgue measure in
  `[0, 1)` and `α = 1`: the conclusion is `dimH A = 1`.

*Needs:* 1.1, 1.2; FractalGeometry 3.1 (`measure_le_mul_hausdorffMeasure`); Mathlib
`Monotone.measure_iUnion`, `MeasureTheory.Measure.restrict_apply`,
`MeasureTheory.Measure.restrict_apply_self`, `le_dimH_of_hausdorffMeasure_ne_zero`.

### 1.4 Billingsley's lemma: the upper bound

Prove `dimH_le_of_badicLowerLocalDim_le`: let `b ≥ 2`, `μ` a finite measure on `ℝ`, `A ⊆ ℝ` and `β`
real. If `badicLowerLocalDim b μ x ≤ β` for every `x ∈ A`, then `dimH A ≤ ENNReal.ofReal β` (Bishop
and Peres, Lemma 1.4.1, pp. 16–17; Hochman, Proposition 4.7, p. 16). Neither `μ A ≠ 0` nor
measurability of `A` is needed.

Let `β' > max β 0` and `m ≥ 0`. By 1.2 every `x ∈ A` lies in a cell `J = Iₙ(x)`, `n ≥ m`, with
`μ J > |J|^β'`. The maximal ones among these cells are pairwise disjoint and cover `A` (1.1), so
`Σ |J|^β' ≤ Σ μ J ≤ μ ℝ` over a countable cover of `A` by sets of diameter at most `b⁻ᵐ`. Hence
`μH[β'] A ≤ μ ℝ < ∞` (Mathlib's `hausdorffMeasure_le_liminf_tsum`, with `m → ∞`) and
`dimH A ≤ β'`.

**Checks.**

- The base hypothesis is needed: for `b = 1` the local dimension is identically `0` (1.2), so
  Lebesgue measure restricted to `[0, 1)`, `A = [0, 1)` and `β = 0` satisfy the hypothesis while
  `dimH A = 1`.
- Finiteness is needed, and σ-finiteness does not replace it: for the counting measure on the
  rationals of `[0, 1)` (the sum of the unit masses at these points), every cell of a point of
  `[0, 1)` has infinite mass, `log ∞ = ⊤` and `⊤ / (−n log b) = ⊥`, so the local dimension is `⊥` on
  `[0, 1)`, and `A = [0, 1)`, `β = 0` satisfy the hypothesis.
- The hypothesis must hold at every point (Hochman, Remark 4.8): a point mass in `A` gives one
  point of local dimension `0`, which says nothing about the rest of `A`.

*Needs:* 1.1, 1.2; Mathlib `MeasureTheory.Measure.hausdorffMeasure_le_liminf_tsum`,
`dimH_le_of_hausdorffMeasure_ne_top`.

### Examples

For `S ⊆ ℕ` let `A_S` be the set of numbers of `[0, 1)` whose binary digits vanish outside `S`, and
`μ` the law of the number whose digits at positions of `S` are independent fair bits and vanish
elsewhere. Then `μ (Iₙ(x)) = 2^(−#(S ∩ [0, n)))` for `x ∈ A_S`, `μ A_S = 1`, and
1.3 and 1.4 give `dimH A_S = liminf #(S ∩ [0, n)) / n` (Bishop and Peres, Example 1.4.2), the lower
box-counting value of FractalGeometry 2.1.

### Dependencies

Layer 1 uses FractalGeometry 3.1 (for 1.3) and Mathlib's floor, digit expansions, `EReal`
logarithms, outer measures and Hausdorff measure.

## Layer 2: Hausdorff dimension of a measure

### 2.1 Upper and lower dimension

For a measure `μ` on an `EMetricSpace`, define `upperDimH μ` as the infimum of `dimH A` over the
sets `A` with `μ Aᶜ = 0` and `lowerDimH μ` as the infimum of `dimH A` over the sets with `μ A ≠ 0`
(Bishop and Peres, Definition 1.4.3, p. 19, for the first, there written `dim(μ)`; Hochman,
Definition 6.22 and Proposition 6.24, pp. 52–53, for both).

- When the σ-algebra is the Borel one, as on `ℝ`, the infima may be taken over Borel sets only, as
  in the sources. For `upperDimH`: if `μ Aᶜ = 0`, the complement of a measurable null hull of `Aᶜ`
  (Mathlib's `toMeasurable`) is a Borel subset of `A` with null complement. For `lowerDimH`: for
  `sₖ > dimH A` decreasing to `dimH A`, `μH[sₖ] A = 0` (Mathlib's `hausdorffMeasure_of_dimH_lt`), so
  its measurable hull `Gₖ` for `μH[sₖ]` is a Borel set with `μH[sₖ] Gₖ = 0`, and `⋂ Gₖ` is a Borel
  superset of `A` of the same dimension and at least the same measure.
- `lowerDimH μ ≤ upperDimH μ` when `μ ≠ 0`, and the infimum defining `upperDimH` is attained, by a
  countable intersection of sets of full measure (Bishop and Peres, after Definition 1.4.3).
- For `μ = 0`, `upperDimH μ = 0` (take `A = ∅`) and `lowerDimH μ = ∞` (an empty infimum).

**Checks.**

- Lebesgue measure on `[0, 1)` plus the unit mass at `0`: `lowerDimH = 0`, attained by `{0}`, and
  `upperDimH = 1`, since a set of full measure has positive Lebesgue measure. The two notions
  differ, and the lower one is not the dimension `1` of the support (Hochman, after
  Definition 6.22).
- The Cantor measure has `upperDimH = lowerDimH = log 2 / log 3` (Bishop and Peres, Example 1.4.5),
  the dimension of the Cantor set of FractalGeometry 5.1.

*Needs:* Mathlib `dimH`, `dimH_mono`, `hausdorffMeasure_of_dimH_lt`, `MeasureTheory.toMeasurable`,
`MeasureTheory.measure_toMeasurable`.

### 2.2 Dimension of a measure from the local dimension

Prove `upperDimH_eq_essSup_and_lowerDimH_eq_essInf`: for `b ≥ 2` and a nonzero finite measure `μ` on
`ℝ`, `upperDimH μ` equals `essSup (badicLowerLocalDim b μ) μ` and `lowerDimH μ` equals
`essInf (badicLowerLocalDim b μ) μ`, in `EReal` (Bishop and Peres, Lemma 1.4.4, p. 19, for the
first, with `μ` on `[0, 1]`; Hochman, Proposition 6.24, pp. 52–53, for both, with the local
dimension taken along balls, for probability measures on `ℝᵈ`, whose proof applied to the `b`-adic
local dimension gives the statement here directly). Write `f` for the local dimension, so `f ≥ 0`
(1.2).

- `upperDimH μ ≤ essSup f μ`: for real `α > essSup f μ` the set `{f ≤ α}` has null complement and,
  by 1.4, dimension at most `α`.
- `upperDimH μ ≥ essSup f μ`: for real `α < essSup f μ`, `μ {f > α} ≠ 0`; if `μ Aᶜ = 0` then
  `μ (A ∩ {f > α}) = μ {f > α}` by subadditivity, and 1.3 gives `dimH A ≥ α`.
- `lowerDimH μ ≥ essInf f μ`: for real `α < essInf f μ`, `μ {f < α} = 0`; if `μ A ≠ 0` then
  `μ (A ∩ {f ≥ α}) ≠ 0`, and 1.3 gives `dimH A ≥ α`.
- `lowerDimH μ ≤ essInf f μ`: for real `α > essInf f μ`, `μ {f < α} ≠ 0`, and by 1.4 the set
  `{f < α}` has dimension at most `α`.

No measurability of `f` is used: each step compares outer measures.

**Checks.**

- `μ ≠ 0` is needed: for `μ = 0`, `upperDimH μ = 0` while the essential supremum over the zero
  measure is `⊥`.
- `b ≥ 2` is needed: for `b = 1` the local dimension is `0`, while Lebesgue measure on `[0, 1)` has
  `upperDimH = 1`.
- Finiteness is needed: for the counting measure on the rationals of `[0, 1)`, `upperDimH = 0`
  (the rationals have dimension `0`) while the local dimension is `⊥` at every rational of `[0, 1)`
  (1.4), which carry all the mass, so the essential supremum is `⊥`. With the rationals of
  `[0, 1]` the atom at `1` would have local dimension `0`.
- Lebesgue measure on `[0, 1)` plus the unit mass at `0`: the local dimension is `0` at `0`, of mass
  `1`, and `1` on `(0, 1)` (1.2), so the essential bounds are `1` and `0`, as in 2.1.

*Needs:* 1.2, 1.3, 1.4, 2.1; Mathlib `essSup`, `essInf`, `ae_lt_of_essSup_lt`, `ae_lt_of_lt_essInf`.

### Examples

If the local dimension equals a constant `s` at `μ`-almost every point (the measure is exact
dimensional), 2.2 gives `upperDimH μ = lowerDimH μ = s`. This is how Layer 3 computes the dimension
of the digit measures.

### Dependencies

Layer 2 uses Layer 1 (1.2–1.4) and Mathlib's essential supremum and infimum.

## Layer 3: Digit frequencies

### 3.1 Digit measures and digit-frequency sets

For `b ≥ 2` and `p : PMF (Fin b)`, the maps `x ↦ (x + d)/b`, `d ∈ Fin b`, form an iterated function
system of ratio `1/b` in the sense of FractalGeometry 1.1, and by FractalGeometry 1.5
(`IFS.existsUnique_selfSimilarMeasure`) there is exactly one Borel probability measure `μ_p` on
`ℝ` with `Σ_d p_d · (x ↦ (x + d)/b)_* μ_p = μ_p`. By the first bullet of FractalGeometry 1.5 it is
the image under `Real.ofDigits` of the product measure on `ℕ → Fin b` with marginal `p`: the law of
the number whose base-`b` digits are independent with law `p` (Bishop and Peres, Section 1.5,
p. 22, for `b = 2`, and Example 1.5.6, p. 24; Hochman, proof of Proposition 4.9, p. 17). No
separate definition is made; the theorems below quantify over the solutions of this equation.

Define `digitFrequencySet b p` as the set of `x ∈ [0, 1)` such that, for every digit `u`, the
number of `j < N` with `Real.digits x b j = u`, divided by `N`, tends to `p u` (Hochman, the set
`N(p)` before Proposition 4.9, p. 17, for `b = 10`; Bishop and Peres, Example 1.5.1, for `b = 2`).
The frequencies are required to exist.

- If `p (b − 1) < 1`, then `μ_p (Iₙ(x)) = Π_{j<n} p (Real.digits x b j)` for `x ∈ [0, 1)` and
  `μ_p [0, 1) = 1`: the digit sequences that end in a constant tail `b − 1`, the only ones on which
  `Real.ofDigits` and the canonical digits disagree, form a countable set of probability `0`. If
  `p (b − 1) = 1`, `μ_p` is the unit mass at `1`, the fixed point of `x ↦ (x + b − 1)/b`.
- Under `μ_p` the canonical digits are therefore independent with law `p` (for `p (b − 1) < 1`), and
  `μ_p`-almost every point lies in `digitFrequencySet b p`, by the strong law of large numbers
  applied to the indicators of each digit (Bishop and Peres, proof of Lemma 1.5.4, with
  Theorem 1.5.2; Mathlib's `ProbabilityTheory.strong_law_ae`).

**Checks.**

- `b = 2`, `p = (1/2, 1/2)`: `μ_p` is Lebesgue measure on `[0, 1]`, as in the Checks of
  FractalGeometry 1.5. `b = 2`, `p = (1/3, 2/3)`: `μ_p [0, 1/2) = 1/3` and `μ_p [1/2, 3/4) = 2/9`.
- `p (b − 1) = 1` is the exceptional case of the first bullet: `μ_p` is the unit mass at `1`, which
  lies outside `[0, 1)`, and the cell `[1, 1 + b⁻ⁿ)` has mass `1`.
- The frequencies must exist: the number with binary digits `1` exactly at the positions in
  `[(2k)!, (2k + 1)!)` has lower and upper frequency `0` and `1` of the digit `1`, and lies in no
  `digitFrequencySet 2 p`.
- `b = 2`, `p = (1, 0)`: the number with binary digit `1` exactly at the positions `j²` lies in
  `digitFrequencySet 2 p`, although each of its cells of level `n ≥ 1` has `μ_p`-mass `0`.

*Needs:* FractalGeometry 1.1 and 1.5; Mathlib `Real.digits`, `Real.ofDigits`,
`Real.continuous_ofDigits`, `Real.ofDigits_digits`, `PMF`, `ProbabilityTheory.strong_law_ae`.

### 3.2 The dimension of a digit measure

Prove `dimH_digitMeasure`: for `b ≥ 2`, `p : PMF (Fin b)` and a probability measure `μ` on `ℝ` with
`Σ_d p_d · (x ↦ (x + d)/b)_* μ = μ`, both `upperDimH μ` and `lowerDimH μ` equal `H(p) / log b`
(Bishop and Peres, Lemma 1.5.4, p. 22, for `b = 2`, and Example 1.5.6, p. 24, both for the upper
dimension; the lower dimension comes from the same computation through 2.2). By uniqueness
(3.1) `μ = μ_p`. If `p (b − 1) = 1`, `μ` is a unit mass and `H(p) = 0`. Otherwise, for `μ`-almost
every `x`, `log μ (Iₙ(x)) / log (b⁻ⁿ) = −(1/n) Σ_{j<n} log p(x_j) / log b`, and the strong law
applied to `−log p (ω 0)` (a function of finitely many values, almost surely evaluated where
`p > 0`) makes it tend to `H(p) / log b`. So the local dimension is almost surely the constant
`H(p) / log b`, and 2.2 gives both dimensions.

**Checks.**

- `b = 2`, `p = (1/3, 2/3)`: `H(p) = 0.63651` nats and `H(p) / log 2 = 0.91830`. Dividing the
  entropy in bits (`0.91830`) by `log 2` again would give `1.32482 > 1`, impossible for a measure on
  the line.
- `b = 2`, `p = (1/2, 1/2)`: `1`, the dimension of Lebesgue measure. `p` a unit mass: `0`.
- `b = 1` is excluded: the single map is the identity and every probability measure satisfies the
  equation, Lebesgue measure on `[0, 1]` among them, of dimension `1`, while `H(p) = 0`.
- Some normalisation of `μ` is needed: the zero measure satisfies the equation and has
  `lowerDimH = ∞`.

*Needs:* 2.2, 3.1; Mathlib `Real.negMulLog`, `ProbabilityTheory.strong_law_ae`.

### 3.3 The theorem of Besicovitch and Eggleston

Prove `dimH_digitFrequencySet`: for `b ≥ 2` and every `p : PMF (Fin b)`,
`dimH (digitFrequencySet b p) = H(p) / log b` (Hochman, Proposition 4.9, p. 17, for `b = 10`;
Bishop and Peres, Lemma 1.5.4, p. 22, for `b = 2`, and Example 1.5.6, p. 24, for general `b`).
Zero entries of `p` are allowed; the sources' upper-bound argument does not cover them, and the
route below for the upper bound is proved here.

*Lower bound.* If `p (b − 1) = 1` then `H(p) = 0`. Otherwise `μ_p` gives the set
`digitFrequencySet b p ∩ G` mass `1`, where `G` is the set of full `μ_p`-measure on which the local
dimension equals `H(p) / log b` (3.2), and 1.3 applies.

*Upper bound.* Let `q : PMF (Fin b)` have all entries positive. For `x` in the set, all cells of
`x` lie in `[0, 1)`, so `μ_q (Iₙ(x)) = Π_{j<n} q(x_j)` (3.1, `q (b − 1) < 1`), and
`log μ_q (Iₙ(x)) / log (b⁻ⁿ) = −Σ_u (cₙ(u)/n) log q_u / log b`, where `cₙ(u)` counts the digits `u`
among the first `n`. This tends to the cross-entropy `−Σ_u p_u log q_u` divided by `log b` at every
point of the set, so 1.4, applied to the finite measure `μ_q`, bounds the dimension by that
quotient. For `q = (1 − t) p + t · (1/b, …, 1/b)` and `t → 0` the cross-entropy tends to `H(p)`:
a term with `p_u = 0` is `0`, and the others converge. The measure `μ_p` itself cannot be used when
some `p_u = 0`: points of the set may contain the digit `u` (with frequency `0`), and their cells
have `μ_p`-mass `0` and local dimension `⊤` (3.1, last Check).

**Checks.**

- `b = 2`, `p = (1/2, 1/2)`: the simply normal binary numbers, of dimension `1`; `p = (1/3, 2/3)`:
  `0.91830`.
- `b = 3`, `p = (1/2, 1/2, 0)`: `log 2 / log 3 = 0.63093`, the dimension of the Cantor set, and the
  set contains the numbers of the Cantor-type set with digits in `{0, 1}` whose two digits have
  frequency `1/2`.
- Cross-entropy: for `b = 2`, `p = (1/3, 2/3)` and `q = (1/2, 1/2)` the bound is `1`, and `q = p`
  gives `0.91830`. For `p = (1, 0)` and `q = (1 − t, t)` the bound `−log(1 − t) / log 2` is
  `0.15200`, `0.01450`, `0.00144` for `t = 0.1, 0.01, 0.001`, tending to `H(p) = 0`.
- `b = 1` is excluded: every digit is `0`, the set is `[0, 1)`, of dimension `1`, while the formula
  gives `0`.

*Needs:* 1.3, 1.4, 3.1, 3.2; Mathlib `Real.negMulLog`, `Real.continuous_negMulLog`.

### 3.4 Numbers that are not normal

Copy `IsNormalBase` verbatim from ProbabilisticAndMetricNumberTheory §2.8: for `b ≥ 2` and
`x ∈ [0, 1)`, every block of `k` digits occurs at frequency `b⁻ᵏ` among the overlapping windows of
the canonical expansion. Prove `dimH_setOf_not_isNormalBase`: for every `b ≥ 1`, the set of
`x ∈ [0, 1)` that are not normal in base `b` has Hausdorff dimension `1` (Hochman, Corollary 4.10,
p. 18, for numbers that are not simply normal in base ten). By ProbabilisticAndMetricNumberTheory
§2.8 (`borel_normal`) this set is Lebesgue-null.

For `b ≥ 2` and `0 < ε < 1/b`, let `p_ε` give mass `1/b − ε` to the digits `0, …, b − 2` and
`1/b + (b − 1)ε` to `b − 1`. A point of `digitFrequencySet b p_ε` has digit frequencies other than
`1/b`, so it is not normal, and by 3.3 the dimension is at least `H(p_ε) / log b`, which tends to
`1` by continuity of `negMulLog`. The upper bound `1` is Mathlib's `Real.dimH_univ`. For `b = 1`,
`IsNormalBase` requires `2 ≤ b`, so the set is `[0, 1)`, of dimension `1` by
`Real.dimH_of_nonempty_interior`.

**Checks.**

- `b = 10`, `ε = 0.01`: `H(p_ε) / log 10 = 0.98410`; `ε = 0.001`: `0.99981`. The vector must give
  the last digit `1/10 + 9ε`; with `1/10 + 10ε` its entries sum to `1 + ε`.
- The set is Lebesgue-null, so its dimension cannot be obtained from a positive-measure subset; it
  contains `0`, `1/2` and every number with a terminating expansion.

*Needs:* 3.3; ProbabilisticAndMetricNumberTheory §2.8 (`IsNormalBase`; `borel_normal` for the remark
only); Mathlib `Real.dimH_univ`, `Real.dimH_of_nonempty_interior`, `dimH_mono`.

### Examples

For `b = 2` and `p = (p₀, p₁)` the dimension is the binary entropy `h₂(p₁)`, which is `1` only at
`p₁ = 1/2` and `0` at `p₁ ∈ {0, 1}`.

The infimum defining `lowerDimH` (2.1) need not be attained. Let
`p_k = (1/(k + 2), (k + 1)/(k + 2))`, `μ_k` the binary digit measure of 3.1 with weights `p_k`, and
`μ = Σ_{k ≥ 1} 2^(−k) μ_k`. The `μ_k` are carried by the pairwise disjoint sets
`digitFrequencySet 2 p_k` (3.1), so a set of positive `μ`-measure has positive `μ_k`-measure for
some `k`, hence dimension at least `lowerDimH μ_k = H(p_k) / log 2 > 0` (3.2). The set
`digitFrequencySet 2 p_k` has positive `μ`-measure and dimension `H(p_k) / log 2`, which tends to
`0` (3.3). So `lowerDimH μ = 0`, and no set of positive measure has dimension `0`.

### Dependencies

Layer 3 uses Layers 1 and 2 (1.3, 1.4, 2.2), FractalGeometry 1.1 and 1.5,
ProbabilisticAndMetricNumberTheory §2.8, and Mathlib's digit expansions, `negMulLog` and strong
law of large numbers.

## Layer 4: Cantor constructions and badly approximable numbers

### 4.1 Cantor constructions with interval-dependent digits

Prove `dimH_ofDigits_prefixRestricted`: let `R` and `k` be natural numbers and `D` assign to every
finite word `w` in the digits `Fin R` a set `D w` of exactly `k` digits. Then the image under
`Real.ofDigits` of the digit sequences `ω` with `ω n ∈ D (ω 0, …, ω (n − 1))` for every `n` has
Hausdorff dimension `log k / log R` (Beresnevich, Ramírez and Velani, Lemma 7.1, pp. 62–64, with
`k = R − M`). The set is the intersection of the sets `Eₙ`, the union of the `kⁿ` closed intervals
`[Σ_{j<n} w_j R^(−j−1), Σ_{j<n} w_j R^(−j−1) + R⁻ⁿ]` of the admissible words of length `n`: an
admissible sequence lies in every `Eₙ`, and a point of every `Eₙ` lies on a path of the finitely
branching tree of admissible words whose intervals contain it, by König's lemma. This is the
construction of the source, which removes `M` of the `R` closed subintervals of every interval.

The upper bound uses the `kⁿ` intervals of `Eₙ` as covers (`Σ R^(−ns) = 1` for `s = log k / log R`).
For the lower bound, a set of diameter `d` with `R^(−m−1) ≤ d < R⁻ᵐ` meets at most two intervals of
`Eₘ`, hence at most `2 k^(j−m)` intervals of `Eⱼ` for `j ≥ m`; for a finite cover of the compact
set, counting the `kʲ` intervals of `Eⱼ` gives `Σ dᵢˢ ≥ 1/(2k)`.

- If every `D w` has at least `k` digits, the dimension is at least `log k / log R`: choose `k` of
  them at every word and use the monotonicity of `dimH`.

**Checks.**

- `R = 3`, `D w = {0, 2}` for every `w`: Mathlib's `cantorSet`, of dimension `log 2 / log 3`, as in
  FractalGeometry 5.1.
- `R = 5`, `k = 3`, `D w = {s, s + 1, s + 2} mod 5` with `s` the digit sum of `w` mod 5: the
  admissible words of length `1, …, 6` number `3, 9, 27, 81, 243, 729`, and the dimension is
  `log 3 / log 5 = 0.68261`. No single digit set is kept at every step.
- Degenerate cases hold by the conventions: `k = 0` gives the empty set and `log 0 = 0`; `R = 1`,
  `k = 1` gives `{0}` and `log 1 / log 1 = 0`; `R = 0` has no digit sequences.

*Needs:* Mathlib `Real.ofDigits`, `Real.continuous_ofDigits`, `Real.abs_ofDigits_sub_ofDigits_le`,
`MeasureTheory.Measure.hausdorffMeasure_le_liminf_sum`, `le_dimH_of_hausdorffMeasure_ne_zero`,
`dimH_le_of_hausdorffMeasure_ne_top`.

### 4.2 Jarník's theorem

Prove `dimH_setOf_badlyApproximable`: `dimH {x : ℝ | TauCeti.BadlyApproximable x} = 1` (Jarník,
1928; Beresnevich, Ramírez and Velani, Theorem 7.1, p. 62, proof pp. 64–65). Tau Ceti's
`TauCeti.BadlyApproximable x` says that `x` is irrational and `c ≤ q · |q x − round (q x)|` for some
`c > 0` and all `q ≥ 1`; its `badlyApproximable_iff` shows the irrationality clause is automatic, so
this is the set `Bad = {x : inf_q q‖qx‖ > 0}` of the source (Beresnevich, Ramírez and Velani,
Section 1.3, p. 5).

Fix `R ≥ 4` and `δ = 1/2`. Let `Qₙ` be the reduced fractions `a/q` with `R^(n−3) ≤ q² < R^(n−2)`;
these sets partition the rationals (`n ≥ 3`), and two distinct fractions of `Qₙ` are more than
`R^(−n+2)` apart, since `1/(q q') > R^(−n+2)`. An interval of `Eₙ₋₁`, of length `R^(−n+1)`,
therefore meets at most one of the open intervals of radius `δ R⁻ⁿ` about the fractions of `Qₙ`, and
that interval meets at most two of its `R` closed subintervals. Removing two subintervals at every
step, 4.1 with `k = R − 2` gives a set `K` of dimension `log (R − 2) / log R`. Every `x ∈ K`
satisfies `|x − a/q| ≥ δ R⁻ⁿ ≥ δ R⁻³ q⁻²` for `a/q ∈ Qₙ`, so `x` is badly approximable by Tau Ceti's
`badlyApproximable_iff_forall_ratCast`. Let `R → ∞`; the upper bound is `Real.dimH_univ`.

**Checks.**

- `R = 4` gives the bound `1/2`, `R = 10` gives `0.90309`, `R = 100` gives `0.99561`.
- Separation for `R = 4`, `n = 6`: the reduced fractions of `[0, 1]` with denominators `8, …, 15`
  are `54` in number, with least gap `1/210 > 4⁻⁴ = 1/256`. For `n = 4` they are `1/3, 1/2, 2/3`.
- Rationals are excluded: `q = den(r)` gives `q‖q r‖ = 0`. The golden ratio, `√2` and every
  quadratic irrational are badly approximable (Tau Ceti), and a Liouville number is not.
- The set is Lebesgue-null (a consequence of Khinchin's theorem, Beresnevich, Ramírez and Velani,
  Corollary 2.1), so, as in 3.4, the dimension is not seen by Lebesgue measure.

*Needs:* 4.1; Tau Ceti `TauCeti.BadlyApproximable`, `TauCeti.badlyApproximable_iff`,
`TauCeti.badlyApproximable_iff_forall_ratCast`; Mathlib `Real.dimH_univ`, `dimH_mono`.

### Examples

Removing the middle third of every interval in 4.1 (`R = 3`, `k = 2`) gives the Cantor set. In 4.2
the two subintervals removed are those met by a dangerous interval, so the kept digits change from
interval to interval, which FractalGeometry 5.3, with one digit set at every position, does not
allow.

### Dependencies

Layer 4 uses Tau Ceti's badly approximable numbers and Mathlib's digit expansions and Hausdorff
measure; it does not use Layers 1 to 3.

## Scope and ownership

This roadmap owns: the `b`-adic cells of the line and the lower `b`-adic local dimension (1.1, 1.2);
Billingsley's lemma in its two halves (1.3, 1.4); the upper and lower Hausdorff dimension of a
measure and their identification with the essential bounds of the local dimension (Layer 2); the
digit-frequency sets, the dimension of the self-similar digit measures, the theorem of Besicovitch
and Eggleston and the dimension of the non-normal numbers (Layer 3); the Cantor construction with
interval-dependent digits and Jarník's theorem (Layer 4).

Stated by other roadmaps and consumed, not restated:

- FractalGeometry 3.1 (the mass distribution principle for balls) is the input of 1.3, and
  FractalGeometry 1.1 and 1.5 (iterated function systems; existence and uniqueness of the
  self-similar measure, and its description as an image of a product measure) supply the digit
  measures of Layer 3. That roadmap defines no named self-similar measure, so Layer 3 quantifies
  over the solutions of its invariance equation instead of defining one. Its 5.3
  (`dimH_digitRestricted`) is the self-similar case of digit restriction, one digit set for every
  position; 4.1 above lets the kept digits depend on the interval, which is not self-similar, and
  includes the one-dimensional case of its 5.3 with `n = 1`. Its Layer 3 Frostman lemma and energy
  criterion are not used.
- ProbabilisticAndMetricNumberTheory §2.8 owns `IsNormalBase` and Borel's theorem that almost every
  number is normal (`borel_normal`); 3.4 copies the predicate and uses the theorem only for the
  remark that the set is Lebesgue-null. Its §§3.8–3.10 own the mass transference principle and the
  Jarník–Besicovitch theorem on well-approximable numbers; they state no dimension of the badly
  approximable set, which 4.2 proves by a different construction. Its §4.10
  (`bounded_partial_denominators_iff_badlyApproximable`) characterises badly approximable numbers
  by bounded continued-fraction digits; 4.2 does not use continued fractions. The entropy
  `H(p) = Σ negMulLog p_d` of Layer 3 is the finite-label entropy of its §5.1a for the first digit
  under `μ_p`; it is written out as a sum and not redefined.
- DiophantineApproximationAndTranscendence §0.6 uses Tau Ceti's `TauCeti.BadlyApproximable`, the
  predicate of 4.2.
- GeometricMeasureTheory works with Mathlib's Hausdorff measures, as this roadmap does; nothing is
  taken from it.

Already in the library and consumed, not restated: Hausdorff measure and dimension, the dimension of
the line and of open sets, canonical base-`b` digit expansions of reals (`Real.digits`,
`Real.ofDigits`), the strong law of large numbers, essential suprema and infima, `negMulLog`, and
Tau Ceti's badly approximable numbers with their characterisations.

Outside this roadmap: local dimensions along balls and their almost-everywhere agreement with the
`b`-adic ones (Hochman, Proposition 6.21); Billingsley's lemma in `ℝᵈ` and for Vitali covers;
the dimension of sets where digit frequencies fail to exist or satisfy one-sided bounds; normality
of blocks beyond the remark of 3.4; the dimension of numbers with bounded continued-fraction digits
and its asymptotics; badly approximable vectors and Schmidt games; multifractal analysis.

## Exact supplier contracts

### From Mathlib

- `Mathlib/Topology/MetricSpace/HausdorffDimension.lean`: `dimH` (values in `ℝ≥0∞`); `dimH_mono`;
  `le_dimH_of_hausdorffMeasure_ne_zero` (`μH[d] s ≠ 0 → d ≤ dimH s` for `d : ℝ≥0`);
  `dimH_le_of_hausdorffMeasure_ne_top` (`μH[d] s ≠ ∞ → dimH s ≤ d`); `Real.dimH_univ`
  (`dimH (univ : Set ℝ) = 1`); `Real.dimH_of_nonempty_interior` (a set with nonempty interior in a
  finite-dimensional real normed space has dimension the finite rank).
- `Mathlib/MeasureTheory/Measure/Hausdorff.lean`: `MeasureTheory.Measure.hausdorffMeasure`
  (notation `μH[d]`); `hausdorffMeasure_le_liminf_tsum` and `hausdorffMeasure_le_liminf_sum` (an
  upper bound for `μH[d] s` from countable, respectively finite, covers whose diameters tend to `0`
  along a filter).
- `Mathlib/MeasureTheory/Measure/Continuity.lean`: `Monotone.measure_iUnion` (continuity from below
  for a monotone family of arbitrary sets). `Mathlib/MeasureTheory/Measure/Restrict.lean`:
  `Measure.restrict_apply` (`μ.restrict s t = μ (t ∩ s)` for measurable `t`) and
  `Measure.restrict_apply_self` (`μ.restrict s s = μ s` for every `s`).
  `MeasureTheory.toMeasurable` and `measure_toMeasurable` (a measurable hull of the same measure).
- `Mathlib/MeasureTheory/Function/EssSup.lean`: `essSup`, `essInf` (for functions into a
  conditionally complete lattice, here `EReal`); `ae_lt_of_essSup_lt`, `ae_lt_of_lt_essInf`.
- `Mathlib/Analysis/SpecialFunctions/Log/ENNRealLog.lean`: `ENNReal.log : ℝ≥0∞ → EReal`,
  `ENNReal.log_zero` (`log 0 = ⊥`). `Mathlib/Data/EReal/Inv.lean`: `EReal.div_zero` (`a / 0 = 0`),
  `EReal.bot_div_of_neg_ne_bot` (`⊥ / a = ⊤` for `a < 0`, `a ≠ ⊥`). `Filter.liminf`.
- `Mathlib/Analysis/Real/OfDigits.lean`: `Real.digits` (`⌊x · b^(i+1)⌋` mod `b`, under `NeZero b`),
  `Real.ofDigits`, `Real.ofDigits_digits` (`ofDigits (digits x b) = x` for `1 < b`, `x ∈ [0, 1)`),
  `Real.ofDigits_digits_sum_eq`, `Real.abs_ofDigits_sub_ofDigits_le` (sequences agreeing in their
  first `n` digits have values within `b⁻ⁿ`), `Real.continuous_ofDigits`. `Int.floor`.
- `Mathlib/Analysis/SpecialFunctions/Log/NegMulLog.lean`: `Real.negMulLog`,
  `Real.continuous_negMulLog`. `Mathlib/Probability/ProbabilityMassFunction/Basic.lean`: `PMF`.
- `Mathlib/Probability/StrongLaw.lean`: `ProbabilityTheory.strong_law_ae` (pairwise independent,
  identically distributed, integrable real variables have almost surely convergent averages).

### From Tau Ceti

- `TauCeti/NumberTheory/DiophantineApproximation/BadlyApproximable.lean`:
  `TauCeti.BadlyApproximable` (irrational, with `c ≤ q · |q ξ − round (q ξ)|` for some `c > 0` and
  all `q ≥ 1`); `TauCeti.badlyApproximable_iff` (the irrationality clause is automatic);
  `TauCeti.badlyApproximable_iff_forall_ratCast` (equivalently `c / den(r)² ≤ |ξ − r|` for all
  rationals `r`). `Suggested.lean` imports this module.

### From TauCetiRoadmap.FractalGeometry

- §1.1: `IFS` (maps with prescribed Lipschitz ratios in `(0, 1)`).
- §1.5: `IFS.existsUnique_selfSimilarMeasure` (on a nonempty complete metric space, exactly one
  Borel probability measure `μ` with `Σ pᵢ · (F i)_* μ = μ` for a probability vector `p`), and the
  description of that measure as the image of the product measure under the coding map.
- §3.1: `measure_le_mul_hausdorffMeasure` (if `μ (closedBall x r) ≤ C · r^s` for `x ∈ E` and
  `0 < r ≤ ε`, with `C ≠ 0`, `s ≥ 0`, then `μ E ≤ C · μH[s] E`; no finiteness of `μ`, no
  measurability of `E`).

### From TauCetiRoadmap.ProbabilisticAndMetricNumberTheory

- §2.8: `IsNormalBase` (copied verbatim into `Suggested.lean`) and `borel_normal` (for `b ≥ 2`,
  almost every `x ∈ [0, 1)` is normal in base `b`).

## References

- Christopher J. Bishop and Yuval Peres, *Fractals in Probability and Analysis*, draft of
  1 December 2015 on the first author's page,
  [book1Dec15.pdf](https://www.math.stonybrook.edu/~bishop/classes/math324.F15/book1Dec15.pdf).
  The numbering and pages used above are those of this draft.
- Michael Hochman, *Lectures on fractal geometry and dynamics*, notes of 27 June 2012 on the
  author's page,
  [course-notes.june-26.pdf](https://math.huji.ac.il/~mhochman/courses/fractals-2012/course-notes.june-26.pdf).
- Victor Beresnevich, Felipe Ramírez and Sanju Velani, *Metric Diophantine approximation: aspects of
  recent work*, arXiv:1601.01948v1 (2016), [arXiv](https://arxiv.org/abs/1601.01948).
