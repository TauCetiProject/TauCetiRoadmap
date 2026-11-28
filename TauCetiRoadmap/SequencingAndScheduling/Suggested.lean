import Mathlib

/-!
# Sequencing and scheduling: target signatures

**This file is not the roadmap.** The roadmap is `README.md`. This file states the roadmap's
headline theorems against the pinned Mathlib, each with `sorry`, together with the few
definitions they need; every definition has a real body. Every headline theorem of the README is
statable at the pins and is stated here. The README's remaining targets, API lists and Checks are
not restated.

Jobs form a finite type `J`. A sequence is a bijection `σ : J ≃ Fin (Fintype.card J)` sending a
job to its position, counted from `0`; on one machine the jobs are processed in that order without
idle time, so the completion time of `j` is the sum of the processing times of the jobs at
positions up to that of `j`. Maxima over the jobs are taken in `WithBot ℝ`, so that the empty job
type has the value `⊥`. Preemptive schedules on `m` identical machines assign to each machine and
each job a measurable set of times; two-machine flow-shop schedules are given by start times.
-/

noncomputable section

open Finset MeasureTheory

namespace TauCetiRoadmap.SequencingAndScheduling

variable {J : Type*} [Fintype J]

/-! ## Layer 1: sequences and completion times -/

/-- 1.1 The completion time of the job `j` in the sequence `σ` with processing times `p`: the sum
of `p i` over the jobs `i` whose position is at most that of `j`. -/
def completionTime (p : J → ℝ) (σ : J ≃ Fin (Fintype.card J)) (j : J) : ℝ :=
  ∑ i ∈ univ.filter (fun i => σ i ≤ σ j), p i

/-- 1.2 The total weighted completion time `∑ j, w j * C j` of the sequence `σ`. -/
def weightedCompletion (p w : J → ℝ) (σ : J ≃ Fin (Fintype.card J)) : ℝ :=
  ∑ j, w j * completionTime p σ j

/-- 1.2 Smith's ratio rule. For positive processing times and real weights, a sequence has the
least total weighted completion time if and only if `w j / p j ≤ w i / p i` whenever `i` comes
before `j`. -/
theorem weightedCompletion_le_iff (p w : J → ℝ) (hp : ∀ j, 0 < p j)
    (σ : J ≃ Fin (Fintype.card J)) :
    (∀ τ : J ≃ Fin (Fintype.card J), weightedCompletion p w σ ≤ weightedCompletion p w τ) ↔
      ∀ i j, σ i < σ j → w j / p j ≤ w i / p i := by
  sorry

/-- 1.3 The maximum cost `max_j f j (C j)` of the sequence `σ`, in `WithBot ℝ`; it is `⊥` when
there are no jobs. -/
def maxCost (p : J → ℝ) (f : J → ℝ → ℝ) (σ : J ≃ Fin (Fintype.card J)) : WithBot ℝ :=
  univ.sup fun j => ((f j (completionTime p σ j) : ℝ) : WithBot ℝ)

/-- 1.3 The sequence `σ` respects the precedence relation `r`: `r i j` puts `i` before `j`. -/
def RespectsPrecedence (r : J → J → Prop) (σ : J ≃ Fin (Fintype.card J)) : Prop :=
  ∀ i j, r i j → σ i < σ j

/-- 1.3 Lawler's theorem for `1|prec|fmax`. Let the processing times be nonnegative, the cost
functions nondecreasing and the precedence relation acyclic. If `l` has no successor and its cost
at the total processing time is least among the jobs without successor, then some sequence that
respects the precedences, puts `l` last and has the least maximum cost among all sequences that
respect the precedences exists. -/
theorem exists_respectsPrecedence_maxCost_le_last (p : J → ℝ) (hp : ∀ j, 0 ≤ p j) (f : J → ℝ → ℝ)
    (hf : ∀ j, Monotone (f j)) (r : J → J → Prop) (hr : ∀ j, ¬ Relation.TransGen r j j)
    (l : J) (hl : ∀ k, ¬ r l k)
    (hmin : ∀ k, (∀ k', ¬ r k k') → f l (∑ j, p j) ≤ f k (∑ j, p j)) :
    ∃ σ : J ≃ Fin (Fintype.card J), RespectsPrecedence r σ ∧ (∀ j, σ j ≤ σ l) ∧
      ∀ τ : J ≃ Fin (Fintype.card J), RespectsPrecedence r τ → maxCost p f σ ≤ maxCost p f τ := by
  sorry

/-! ## Layer 2: due dates and on-time sets -/

/-- 2.1 The sequence `σ` is an earliest-due-date sequence: due dates are nondecreasing along it. -/
def IsEDD (d : J → ℝ) (σ : J ≃ Fin (Fintype.card J)) : Prop :=
  ∀ i j, σ i < σ j → d i ≤ d j

/-- 2.1 The maximum lateness `max_j (C j - d j)` of the sequence `σ`, in `WithBot ℝ`. -/
def maxLateness (p d : J → ℝ) (σ : J ≃ Fin (Fintype.card J)) : WithBot ℝ :=
  maxCost p (fun j t => t - d j) σ

/-- 2.1 Jackson's rule. For nonnegative processing times, every earliest-due-date sequence has
the least maximum lateness. -/
theorem IsEDD.maxLateness_le {p d : J → ℝ} (hp : ∀ j, 0 ≤ p j)
    {σ : J ≃ Fin (Fintype.card J)} (hσ : IsEDD d σ) (τ : J ≃ Fin (Fintype.card J)) :
    maxLateness p d σ ≤ maxLateness p d τ := by
  sorry

/-- 2.2 The set `X` of jobs is on time for the processing times `p` and due dates `d`: some
sequence completes every job of `X` by its due date. -/
def IsOnTimeSet (p d : J → ℝ) (X : Finset J) : Prop :=
  ∃ σ : J ≃ Fin (Fintype.card J), ∀ j ∈ X, completionTime p σ j ≤ d j

/-- 2.2 For nonnegative processing times, all jobs can meet their due dates if and only if they
do so in an earliest-due-date sequence. -/
theorem IsEDD.isOnTimeSet_univ_iff {p d : J → ℝ} (hp : ∀ j, 0 ≤ p j)
    {σ : J ≃ Fin (Fintype.card J)} (hσ : IsEDD d σ) :
    IsOnTimeSet p d univ ↔ ∀ j, completionTime p σ j ≤ d j := by
  sorry

/-- 2.3 Unit jobs with integer deadlines: a set `X` is on time if and only if, for every `t`, at
most `t` jobs of `X` have deadline at most `t`. -/
theorem isOnTimeSet_one_iff (D : J → ℕ) (X : Finset J) :
    IsOnTimeSet (fun _ => 1) (fun j => (D j : ℝ)) X ↔
      ∀ t : ℕ, (X.filter (fun x => D x ≤ t)).card ≤ t := by
  sorry

/-- 2.4 Unit jobs with integer deadlines: the on-time sets are the independent sets of a matroid
on the jobs. -/
theorem exists_matroid_indep_iff_isOnTimeSet (D : J → ℕ) :
    ∃ M : Matroid J, M.E = Set.univ ∧
      ∀ X : Finset J, M.Indep (X : Set J) ↔ IsOnTimeSet (fun _ => 1) (fun j => (D j : ℝ)) X := by
  sorry

/-- 2.5 The exchange step of Moore and Hodgson. Let the processing times be nonnegative, `σ` an
earliest-due-date sequence, `k` its first late job and `m` a job of greatest processing time
among those at positions up to that of `k`. Then some on-time set of greatest cardinality does
not contain `m`. -/
theorem exists_isOnTimeSet_card_max_not_mem {p d : J → ℝ} (hp : ∀ j, 0 ≤ p j)
    {σ : J ≃ Fin (Fintype.card J)} (hσ : IsEDD d σ) {k m : J}
    (hk : d k < completionTime p σ k)
    (hfirst : ∀ j, σ j < σ k → completionTime p σ j ≤ d j)
    (hm : σ m ≤ σ k) (hmax : ∀ i, σ i ≤ σ k → p i ≤ p m) :
    ∃ X : Finset J, IsOnTimeSet p d X ∧ m ∉ X ∧
      ∀ Y : Finset J, IsOnTimeSet p d Y → Y.card ≤ X.card := by
  sorry

/-! ## Layer 3: preemptive schedules on identical machines -/

/-- 3.1 A preemptive schedule of the jobs with processing times `p` on `m` identical machines
within the time interval `[0, T]`: `A i j` is the measurable set of times at which machine `i`
processes job `j`. A machine processes one job at a time, a job is processed by one machine at a
time, and job `j` receives total processing time `p j`. -/
structure IsPreemptiveSchedule (p : J → ℝ) (m : ℕ) (T : ℝ) (A : Fin m → J → Set ℝ) : Prop where
  measurableSet : ∀ i j, MeasurableSet (A i j)
  subset_Icc : ∀ i j, A i j ⊆ Set.Icc 0 T
  disjoint_jobs : ∀ i, Pairwise fun j k => Disjoint (A i j) (A i k)
  disjoint_machines : ∀ j, Pairwise fun i i' => Disjoint (A i j) (A i' j)
  sum_volume : ∀ j, ∑ i, volume (A i j) = ENNReal.ofReal (p j)

/-- 3.2 McNaughton's theorem. For nonnegative processing times and `T ≥ 0`, a preemptive schedule
on `m` machines within `[0, T]` exists if and only if no job is longer than `T` and the total
processing time is at most `m * T`. -/
theorem exists_isPreemptiveSchedule_iff (p : J → ℝ) (hp : ∀ j, 0 ≤ p j) (m : ℕ) {T : ℝ}
    (hT : 0 ≤ T) :
    (∃ A, IsPreemptiveSchedule p m T A) ↔ (∀ j, p j ≤ T) ∧ ∑ j, p j ≤ m * T := by
  sorry

/-- 3.2 The optimal preemptive makespan. For at least one job, nonnegative processing times and
`m ≥ 1` machines, the least `T ≥ 0` admitting a preemptive schedule within `[0, T]` is
`max (max_j p j) ((∑ j, p j) / m)`. -/
theorem isLeast_preemptiveMakespan [Nonempty J] (p : J → ℝ) (hp : ∀ j, 0 ≤ p j) {m : ℕ}
    (hm : 1 ≤ m) :
    IsLeast {T : ℝ | 0 ≤ T ∧ ∃ A, IsPreemptiveSchedule p m T A}
      (max (univ.sup' univ_nonempty p) ((∑ j, p j) / m)) := by
  sorry

/-! ## Layer 4: the two-machine flow shop -/

/-- 4.1 A two-machine flow-shop schedule for the processing times `a` on the first machine and
`b` on the second: job `j` runs on the first machine from `s₁ j ≥ 0` for time `a j` and then on
the second machine from `s₂ j` for time `b j`, and no two jobs overlap on either machine. -/
def IsFlowShopSchedule (a b s₁ s₂ : J → ℝ) : Prop :=
  (∀ j, 0 ≤ s₁ j) ∧ (∀ j, s₁ j + a j ≤ s₂ j) ∧
    (∀ i j, i ≠ j → s₁ i + a i ≤ s₁ j ∨ s₁ j + a j ≤ s₁ i) ∧
    (∀ i j, i ≠ j → s₂ i + b i ≤ s₂ j ∨ s₂ j + b j ≤ s₂ i)

/-- 4.1 The schedule `(s₁, s₂)` processes the jobs in the order of `σ` on both machines. -/
def FollowsSequence (a b s₁ s₂ : J → ℝ) (σ : J ≃ Fin (Fintype.card J)) : Prop :=
  ∀ i j, σ i < σ j → s₁ i + a i ≤ s₁ j ∧ s₂ i + b i ≤ s₂ j

/-- 4.1 Permutation schedules suffice. For nonnegative processing times, every flow-shop schedule
finishing by `T` can be replaced by one that processes the jobs in the same order on both
machines and also finishes by `T`. -/
theorem exists_followsSequence_of_isFlowShopSchedule {a b s₁ s₂ : J → ℝ} (ha : ∀ j, 0 ≤ a j)
    (hb : ∀ j, 0 ≤ b j) (hs : IsFlowShopSchedule a b s₁ s₂) {T : ℝ} (hT : ∀ j, s₂ j + b j ≤ T) :
    ∃ (σ : J ≃ Fin (Fintype.card J)) (t₁ t₂ : J → ℝ), IsFlowShopSchedule a b t₁ t₂ ∧
      FollowsSequence a b t₁ t₂ σ ∧ ∀ j, t₂ j + b j ≤ T := by
  sorry

/-- 4.2 Johnson's condition on a sequence: `min (a i) (b j) ≤ min (a j) (b i)` whenever `i` comes
before `j`. -/
def JohnsonCondition (a b : J → ℝ) (σ : J ≃ Fin (Fintype.card J)) : Prop :=
  ∀ i j, σ i < σ j → min (a i) (b j) ≤ min (a j) (b i)

/-- 4.2 Some sequence satisfies Johnson's condition: the jobs with `a j ≤ b j` first, in
nondecreasing order of `a`, then the others in nonincreasing order of `b`. -/
theorem exists_johnsonCondition (a b : J → ℝ) :
    ∃ σ : J ≃ Fin (Fintype.card J), JohnsonCondition a b σ := by
  sorry

/-- 4.2 Johnson's theorem. For nonnegative processing times and a sequence `σ` satisfying
Johnson's condition, whenever some flow-shop schedule finishes by `T`, some flow-shop schedule
that follows `σ` finishes by `T`. -/
theorem JohnsonCondition.exists_followsSequence {a b : J → ℝ} (ha : ∀ j, 0 ≤ a j)
    (hb : ∀ j, 0 ≤ b j) {σ : J ≃ Fin (Fintype.card J)} (hσ : JohnsonCondition a b σ)
    {s₁ s₂ : J → ℝ} (hs : IsFlowShopSchedule a b s₁ s₂) {T : ℝ} (hT : ∀ j, s₂ j + b j ≤ T) :
    ∃ t₁ t₂ : J → ℝ, IsFlowShopSchedule a b t₁ t₂ ∧ FollowsSequence a b t₁ t₂ σ ∧
      ∀ j, t₂ j + b j ≤ T := by
  sorry

end TauCetiRoadmap.SequencingAndScheduling
