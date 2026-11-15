module

public import Mathlib
public import TauCeti.Probability.Exchangeability.FiniteDeFinetti
public import TauCeti.MeasureTheory.VectorMeasure.Decomposition.Jordan

/-!
# Sampling with and without replacement, exact discrepancy: target signatures

The roadmap is README.md; this file is not the roadmap and is not exhaustive. It states the
roadmap's headline theorems against the pinned APIs, so that contributors and reviewers converge
on names and signatures.

Stated below: the collision masses (Section 1.1), the exact collision bound for random populations and for finitely exchangeable
prefix laws (Sections 1.2 and 1.3), its attainment by populations of distinct values (1.4, in
excess and norm forms) and by an exchangeable process (1.5), the one-pair formula (2.4), the
repeated-value bound and its characterization (3.1, 3.3), and the tie-weighted mixture and
finite de Finetti bounds (4.1, 4.2). Every headline is statable at the pins: the excess
`⨆ A, μ A - ν A` and the signed-measure norm
`(μ.toSignedMeasure - ν.toSignedMeasure).totalVariation Set.univ` are both pinned carriers, and
for measures of equal mass the norm is twice the excess (README, Section 0.5). Elaboration checks
the interfaces; it does not establish the truth of the admitted targets.

Notation (README, Conventions): `n = Fintype.card κ`, `m = Fintype.card ι`,
`p = n.descFactorial m / n ^ m`, `t = m.descFactorial 2 / n.descFactorial 2`.
-/

public section

noncomputable section

open MeasureTheory ProbabilityTheory TauCeti.Probability
open scoped ENNReal

namespace TauCetiRoadmap.FiniteSamplingDiscrepancy

variable {ι κ α : Type*} [MeasurableSpace α]

section Finite

variable [Fintype ι] [Fintype κ] [MeasurableSpace κ] [MeasurableSingletonClass κ]

/-! ## Layer 1: the exact collision bound and its attainment -/

/-- **1.1.** The uniform mass of injective index maps is `p`; when `ι → κ` is empty both sides
are zero. -/
theorem uniformOn_injective_apply_eq :
    uniformOn (Set.univ : Set (ι → κ)) {f | Function.Injective f} =
      (Fintype.card κ).descFactorial (Fintype.card ι) /
        (Fintype.card κ : ℝ≥0∞) ^ Fintype.card ι := by
  sorry

/-- **1.1.** The exact collision probability of a uniform index map is `1 - p`. -/
theorem uniformOn_not_injective_apply_eq [Nonempty (ι → κ)] :
    uniformOn (Set.univ : Set (ι → κ)) {f | ¬ Function.Injective f} =
      1 - (Fintype.card κ).descFactorial (Fintype.card ι) /
        (Fintype.card κ : ℝ≥0∞) ^ Fintype.card ι := by
  sorry

/-- **1.2, companion.** The converse inequality of
`sampleWithoutReplacement_le_sampleWithReplacement_add_collision`. -/
theorem sampleWithReplacement_le_sampleWithoutReplacement_add_collision
    {ρ : Measure (κ → α)} [IsProbabilityMeasure ρ] {A : Set (ι → α)} (hA : MeasurableSet A) :
    sampleWithReplacement ρ A ≤ sampleWithoutReplacement ρ A +
      uniformOn (Set.univ : Set (ι → κ)) {k | ¬ Function.Injective k} := by
  sorry

/-- **1.2.** Sampling without replacement from a random population exceeds sampling with
replacement on a measurable event by at most the uniform mass of colliding index maps, which
is `1 - p` by 1.1 when `ι → κ` is nonempty. The converse inequality is the companion target
`sampleWithReplacement_le_sampleWithoutReplacement_add_collision`. -/
theorem sampleWithoutReplacement_le_sampleWithReplacement_add_collision
    {ρ : Measure (κ → α)} [IsProbabilityMeasure ρ] {A : Set (ι → α)} (hA : MeasurableSet A) :
    sampleWithoutReplacement ρ A ≤ sampleWithReplacement ρ A +
      uniformOn (Set.univ : Set (ι → κ)) {k | ¬ Function.Injective k} := by
  sorry

/-- **1.4, excess form.** For distinct values the largest excess of sampling without
replacement over sampling with replacement is exactly the collision probability `1 - p`. -/
theorem iSup_sampleWithoutReplacement_dirac_sub_eq_of_injective (x : κ → α)
    (hx : Function.Injective x) (e : ι ↪ κ)
    (hA : MeasurableSet {f : ι → α | Function.Injective f}) :
    ⨆ (A : Set (ι → α)) (_ : MeasurableSet A),
        sampleWithoutReplacement (ι := ι) (Measure.dirac x) A -
          sampleWithReplacement (ι := ι) (Measure.dirac x) A =
      1 - (Fintype.card κ).descFactorial (Fintype.card ι) /
        (Fintype.card κ : ℝ≥0∞) ^ Fintype.card ι := by
  sorry

/-- **1.4, norm form.** For distinct values the signed-measure norm of the difference of the two
sampling laws is `2 * (1 - p)`. -/
theorem totalVariation_sampleWithoutReplacement_dirac_sub_eq_of_injective [Nonempty κ]
    (x : κ → α) (hx : Function.Injective x) (e : ι ↪ κ)
    (hA : MeasurableSet {f : ι → α | Function.Injective f}) :
    haveI := isProbabilityMeasure_sampleWithoutReplacement (ι := ι) (Measure.dirac x) e
    ((sampleWithoutReplacement (ι := ι) (Measure.dirac x)).toSignedMeasure -
        (sampleWithReplacement (ι := ι) (Measure.dirac x)).toSignedMeasure).totalVariation
      Set.univ =
      2 * (1 - (Fintype.card κ).descFactorial (Fintype.card ι) /
        (Fintype.card κ : ℝ≥0∞) ^ Fintype.card ι) := by
  sorry

/-! ## Layer 2: one repeated pair -/

/-- **2.4.** For the population identifying one pair, the largest excess is
`1 - p - t * min p (1 - p)`. -/
theorem iSup_sampleWithoutReplacement_dirac_update_sub_eq [DecidableEq κ] {a b : κ}
    (hab : a ≠ b) (hmn : Fintype.card ι ≤ Fintype.card κ) :
    ⨆ (A : Set (ι → κ)) (_ : MeasurableSet A),
        sampleWithoutReplacement (ι := ι) (Measure.dirac (Function.update id b a)) A -
          sampleWithReplacement (ι := ι) (Measure.dirac (Function.update id b a)) A =
      ENNReal.ofReal
        (let p : ℝ := (Fintype.card κ).descFactorial (Fintype.card ι) /
            (Fintype.card κ : ℝ) ^ Fintype.card ι
         let t : ℝ := (Fintype.card ι).descFactorial 2 / (Fintype.card κ).descFactorial 2
         1 - p - t * min p (1 - p)) := by
  sorry

/-! ## Layer 3: repeated values -/

/-- **3.1.** A population with a repeated value satisfies the improved bound in both
directions. No hypothesis on `α` and no relation between `m` and `n` is needed. -/
theorem sampleWithoutReplacement_dirac_le_add_of_not_injective (x : κ → α)
    (hx : ¬ Function.Injective x) {A : Set (ι → α)} (hA : MeasurableSet A) :
    let p : ℝ := (Fintype.card κ).descFactorial (Fintype.card ι) /
      (Fintype.card κ : ℝ) ^ Fintype.card ι
    let t : ℝ := (Fintype.card ι).descFactorial 2 / (Fintype.card κ).descFactorial 2
    sampleWithoutReplacement (ι := ι) (Measure.dirac x) A ≤
        sampleWithReplacement (ι := ι) (Measure.dirac x) A +
          ENNReal.ofReal (1 - p - t * min p (1 - p)) ∧
      sampleWithReplacement (ι := ι) (Measure.dirac x) A ≤
        sampleWithoutReplacement (ι := ι) (Measure.dirac x) A +
          ENNReal.ofReal (1 - p - t * min p (1 - p)) := by
  sorry

/-- **3.3.** For `2 ≤ m ≤ n`, the collision probability is the largest excess exactly for
populations of distinct values. -/
theorem iSup_sampleWithoutReplacement_dirac_sub_eq_iff (x : κ → α)
    (hm : 2 ≤ Fintype.card ι) (hmn : Fintype.card ι ≤ Fintype.card κ)
    (hA : MeasurableSet {f : ι → α | Function.Injective f}) :
    (⨆ (A : Set (ι → α)) (_ : MeasurableSet A),
        sampleWithoutReplacement (ι := ι) (Measure.dirac x) A -
          sampleWithReplacement (ι := ι) (Measure.dirac x) A) =
      1 - (Fintype.card κ).descFactorial (Fintype.card ι) /
        (Fintype.card κ : ℝ≥0∞) ^ Fintype.card ι ↔ Function.Injective x := by
  sorry

/-! ## Layer 4: random populations -/

/-- **4.1.** Mixing over a random population, ties on a measurable set `S` reduce the
discrepancy in proportion to `ρ S`. The converse inequality is the companion target. -/
theorem sampleWithoutReplacement_le_add_of_ties (ρ : Measure (κ → α)) [IsProbabilityMeasure ρ]
    (e : ι ↪ κ) {S : Set (κ → α)} (hS : MeasurableSet S) (hS' : ∀ x ∈ S, ¬ Function.Injective x)
    {A : Set (ι → α)} (hA : MeasurableSet A) :
    let p : ℝ := (Fintype.card κ).descFactorial (Fintype.card ι) /
      (Fintype.card κ : ℝ) ^ Fintype.card ι
    let t : ℝ := (Fintype.card ι).descFactorial 2 / (Fintype.card κ).descFactorial 2
    sampleWithoutReplacement (ι := ι) ρ A ≤
      sampleWithReplacement (ι := ι) ρ A +
        ENNReal.ofReal (1 - p - t * min p (1 - p) * (ρ S).toReal) := by
  sorry

end Finite

/-! ## Exchangeable consequences: 1.3, 1.5 and 4.2 -/

/-- **1.3.** Finite de Finetti with the exact collision error `1 - (n)_m / n^m`. -/
theorem ExchangeableAt.finiteDeFinetti_exact_collision
    {Ω : Type*} [MeasurableSpace Ω] {μ : Measure Ω} [IsProbabilityMeasure μ]
    {X : ℕ → Ω → α} {m n : ℕ} (h : ExchangeableAt μ X n) (hmn : m ≤ n)
    (hX : ∀ i : Fin n, AEMeasurable (X i.val) μ) {A : Set (Fin m → α)}
    (hA : MeasurableSet A) :
    prefixLaw μ X m A ≤ sampleWithReplacement (ι := Fin m) (prefixLaw μ X n) A +
        (1 - (n.descFactorial m : ℝ≥0∞) / (n : ℝ≥0∞) ^ m) ∧
      sampleWithReplacement (ι := Fin m) (prefixLaw μ X n) A ≤ prefixLaw μ X m A +
        (1 - (n.descFactorial m : ℝ≥0∞) / (n : ℝ≥0∞) ^ m) := by
  sorry

/-- **1.5.** The bound of 1.3 is attained: a uniformly permuted population of distinct values is
exchangeable at `n`, its `m`-prefix law gives the all-distinct event mass one, and the
with-replacement sample of its `n`-prefix law gives it mass `p`. -/
theorem exists_exchangeableAt_attains_collision [Nonempty α] {m n : ℕ} (hmn : m ≤ n)
    (x : Fin n → α) (hx : Function.Injective x)
    (hA : MeasurableSet {f : Fin m → α | Function.Injective f}) :
    ∃ (Ω : Type) (_ : MeasurableSpace Ω) (μ : Measure Ω) (_ : IsProbabilityMeasure μ)
      (X : ℕ → Ω → α), ExchangeableAt μ X n ∧ (∀ i, Measurable (X i)) ∧
        prefixLaw μ X m {f | Function.Injective f} = 1 ∧
        sampleWithReplacement (ι := Fin m) (prefixLaw μ X n) {f | Function.Injective f} =
          n.descFactorial m / (n : ℝ≥0∞) ^ m := by
  sorry

/-- **4.2.** Finite de Finetti with ties: the `m`-prefix law of a process exchangeable at `n` is
within the tie-reduced error of the with-replacement sample of its `n`-prefix law. The converse
inequality is the companion target. -/
theorem ExchangeableAt.prefixLaw_le_sampleWithReplacement_add_of_ties
    {Ω : Type*} [MeasurableSpace Ω] {μ : Measure Ω} [IsProbabilityMeasure μ]
    {X : ℕ → Ω → α} {m n : ℕ} (h : ExchangeableAt μ X n) (hmn : m ≤ n)
    (hX : ∀ i : Fin n, AEMeasurable (X i.val) μ)
    {S : Set (Fin n → α)} (hS : MeasurableSet S) (hS' : ∀ x ∈ S, ¬ Function.Injective x)
    {A : Set (Fin m → α)} (hA : MeasurableSet A) :
    let p : ℝ := n.descFactorial m / (n : ℝ) ^ m
    let t : ℝ := m.descFactorial 2 / n.descFactorial 2
    prefixLaw μ X m A ≤
      sampleWithReplacement (ι := Fin m) (prefixLaw μ X n) A +
        ENNReal.ofReal (1 - p - t * min p (1 - p) * (prefixLaw μ X n S).toReal) := by
  sorry

end TauCetiRoadmap.FiniteSamplingDiscrepancy
