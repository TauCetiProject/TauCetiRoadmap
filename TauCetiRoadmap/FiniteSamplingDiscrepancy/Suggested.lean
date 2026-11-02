import TauCeti.Probability.Exchangeability.FiniteDeFinetti

/-!
# Sampling with and without replacement, exact discrepancy: suggested target signatures

**`README.md` is the definitive roadmap document.** This file is **not** the roadmap and is
**not exhaustive**: it records suggested Lean forms for particular milestones, so that
contributors and reviewers converge on names and signatures. Discharging every statement here
neither finishes a layer nor the roadmap; what the area asks for is what `README.md` says.

The statements are the **eventwise** forms of the milestones. They pin the normalization
independently of a total-variation API: for probability measures of equal mass, "every
measurable event satisfies `P A ≤ Q A + c`" is `etvDist P Q ≤ 2 * c`, and the largest excess
`⨆ A, P A - Q A` is half of `etvDist P Q`. The README states each milestone with Mathlib's
`etvDist` / `tvDist`, which is the form the implementation must provide.

This file elaborates against the repository's dependency pin. That pin predates Mathlib's
`etvDist` / `tvDist`, Tau Ceti's `etvDist_*` event bridges, the exact uniform-count
declarations and the exact-collision finite de Finetti declaration cited by the README; those
are available in newer Tau Ceti and Mathlib sources. Elaboration of this file therefore checks
the eventwise interfaces, not the total-variation interfaces, and does not establish the truth
of the admitted targets.

Notation (README, Conventions): `n = Fintype.card κ`, `m = Fintype.card ι`,
`p = n.descFactorial m / n ^ m`, `t = m.descFactorial 2 / n.descFactorial 2`.
-/

noncomputable section

open MeasureTheory ProbabilityTheory TauCeti.Probability
open scoped ENNReal

namespace TauCetiRoadmap.FiniteSamplingDiscrepancy

variable {ι κ α : Type*} [MeasurableSpace α]

/-! ## L0: deterministic populations and observation -/

section L0

variable [MeasurableSpace κ] [MeasurableSingletonClass κ] [Countable κ]

/-- **L0.1.** Sampling a deterministic population is the pushforward of the selection law by
reading that population. -/
theorem samplePopulation_dirac (σ : Measure (ι → κ)) [SFinite σ] (x : κ → α) :
    samplePopulation σ (Measure.dirac x) = σ.map (fun k i => x (k i)) := by
  sorry

/-- **L0.3.** Observing the population through a measurable map commutes with sampling. -/
theorem samplePopulation_map_comp {β : Type*} [MeasurableSpace β] (σ : Measure (ι → κ))
    (ρ : Measure (κ → α)) [SFinite ρ] {g : α → β} (hg : Measurable g) :
    samplePopulation σ (ρ.map fun x => g ∘ x) = (samplePopulation σ ρ).map fun y => g ∘ y := by
  sorry

end L0

section Finite

variable [Fintype ι] [Fintype κ] [MeasurableSpace κ] [MeasurableSingletonClass κ]

/-! ## L1: distinct values attain the collision bound -/

/-- **L1.1.** Without replacement, a population of distinct values gives the all-distinct event
probability one. -/
theorem sampleWithoutReplacement_dirac_apply_injective (x : κ → α)
    (hx : Function.Injective x) (e : ι ↪ κ)
    (hA : MeasurableSet {f : ι → α | Function.Injective f}) :
    sampleWithoutReplacement (ι := ι) (Measure.dirac x) {f | Function.Injective f} = 1 := by
  sorry

/-- **L1.2.** With replacement, a population of distinct values gives the all-distinct event the
probability `p`; a measure-mass identity, valid for all finite `ι κ`. -/
theorem sampleWithReplacement_dirac_apply_injective (x : κ → α) (hx : Function.Injective x)
    (hA : MeasurableSet {f : ι → α | Function.Injective f}) :
    sampleWithReplacement (ι := ι) (Measure.dirac x) {f | Function.Injective f} =
      (Fintype.card κ).descFactorial (Fintype.card ι) /
        (Fintype.card κ : ℝ≥0∞) ^ Fintype.card ι := by
  sorry

/-- **L1.3, eventwise.** For distinct values the largest excess of sampling without replacement
over sampling with replacement is exactly the collision probability `1 - p`. -/
theorem iSup_sampleWithoutReplacement_dirac_sub_eq_of_injective (x : κ → α)
    (hx : Function.Injective x) (e : ι ↪ κ)
    (hA : MeasurableSet {f : ι → α | Function.Injective f}) :
    ⨆ (A : Set (ι → α)) (_ : MeasurableSet A),
        sampleWithoutReplacement (ι := ι) (Measure.dirac x) A -
          sampleWithReplacement (ι := ι) (Measure.dirac x) A =
      1 - (Fintype.card κ).descFactorial (Fintype.card ι) /
        (Fintype.card κ : ℝ≥0∞) ^ Fintype.card ι := by
  sorry

/-! ## L2: one repeated pair -/

/-- **L2.1, without replacement.** Singleton masses count the embeddings that reproduce the
observed word. -/
theorem sampleWithoutReplacement_dirac_singleton [MeasurableSingletonClass α]
    (x : κ → α) (y : ι → α) :
    sampleWithoutReplacement (ι := ι) (Measure.dirac x) {y} =
      Nat.card {f : ι ↪ κ // x ∘ f = y} / (Fintype.card κ).descFactorial (Fintype.card ι) := by
  sorry

/-- **L2.1, with replacement.** Singleton masses count the index maps that reproduce the
observed word. -/
theorem sampleWithReplacement_dirac_singleton [MeasurableSingletonClass α]
    (x : κ → α) (y : ι → α) :
    sampleWithReplacement (ι := ι) (Measure.dirac x) {y} =
      Nat.card {f : ι → κ // x ∘ f = y} / (Fintype.card κ : ℝ≥0∞) ^ Fintype.card ι := by
  sorry

/-- **L2.3.** A uniform injective selection hits both of two distinct indices with probability
`t`. -/
theorem uniformOn_injective_mem_range_pair {a b : κ} (hab : a ≠ b)
    (hmn : Fintype.card ι ≤ Fintype.card κ) :
    uniformOn {k : ι → κ | Function.Injective k} {k | a ∈ Set.range k ∧ b ∈ Set.range k} =
      (Fintype.card ι).descFactorial 2 / (Fintype.card κ).descFactorial 2 := by
  sorry

/-- **L2.4, eventwise.** For the population identifying one pair, the largest excess is
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

/-! ## L3: repeated values -/

/-- **L3.1, eventwise.** A population with a repeated value satisfies the improved bound in both
directions; no hypothesis on `α` is needed. -/
theorem sampleWithoutReplacement_dirac_le_add_of_not_injective (x : κ → α)
    (hx : ¬ Function.Injective x) (hmn : Fintype.card ι ≤ Fintype.card κ)
    {A : Set (ι → α)} (hA : MeasurableSet A) :
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

/-- **L3.2, the saving.** For `2 ≤ m ≤ n` the improvement over the collision bound is
positive, which gives strictness. -/
theorem pos_saving (n m : ℕ) (hm : 2 ≤ m) (hmn : m ≤ n) :
    let p : ℝ := n.descFactorial m / (n : ℝ) ^ m
    let t : ℝ := m.descFactorial 2 / n.descFactorial 2
    0 < t * min p (1 - p) := by
  sorry

/-- **L3.3, eventwise.** For `2 ≤ m ≤ n`, the collision probability is the largest excess
exactly for populations of distinct values. -/
theorem iSup_sampleWithoutReplacement_dirac_sub_eq_iff (x : κ → α)
    (hm : 2 ≤ Fintype.card ι) (hmn : Fintype.card ι ≤ Fintype.card κ)
    (hA : MeasurableSet {f : ι → α | Function.Injective f}) :
    (⨆ (A : Set (ι → α)) (_ : MeasurableSet A),
        sampleWithoutReplacement (ι := ι) (Measure.dirac x) A -
          sampleWithReplacement (ι := ι) (Measure.dirac x) A) =
      1 - (Fintype.card κ).descFactorial (Fintype.card ι) /
        (Fintype.card κ : ℝ≥0∞) ^ Fintype.card ι ↔ Function.Injective x := by
  sorry

/-- **L3.3, small samples.** With at most one draw the two laws coincide. -/
theorem sampleWithoutReplacement_dirac_eq_of_card_le_one (x : κ → α)
    (hm : Fintype.card ι ≤ 1) :
    sampleWithoutReplacement (ι := ι) (Measure.dirac x) =
      sampleWithReplacement (ι := ι) (Measure.dirac x) := by
  sorry

/-! ## L4: random populations -/

/-- **L4.1, eventwise.** Mixing over a random population, ties on a measurable set `S` reduce the
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

/-! ## L1.4 and L4.2: exchangeable consequences -/

/-- **L1.4, eventwise.** The exact-collision finite de Finetti bound is attained: a uniformly
permuted population of distinct values is exchangeable at `n`, its `m`-prefix law gives the
all-distinct event mass one, and the with-replacement sample of its `n`-prefix law gives it
mass `p`. -/
theorem exists_exchangeableAt_attains_collision [Nonempty α] {m n : ℕ} (hmn : m ≤ n)
    (x : Fin n → α) (hx : Function.Injective x)
    (hA : MeasurableSet {f : Fin m → α | Function.Injective f}) :
    ∃ (Ω : Type) (_ : MeasurableSpace Ω) (μ : Measure Ω) (_ : IsProbabilityMeasure μ)
      (X : ℕ → Ω → α), ExchangeableAt μ X n ∧ (∀ i, Measurable (X i)) ∧
        prefixLaw μ X m {f | Function.Injective f} = 1 ∧
        sampleWithReplacement (ι := Fin m) (prefixLaw μ X n) {f | Function.Injective f} =
          n.descFactorial m / (n : ℝ≥0∞) ^ m := by
  sorry

/-- **L4.2, eventwise.** Finite de Finetti with ties: the `m`-prefix law of a process
exchangeable at `n` is within the tie-reduced error of the with-replacement sample of its
`n`-prefix law. The converse inequality is the companion target. -/
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
