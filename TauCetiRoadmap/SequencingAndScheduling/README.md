# Roadmap: sequencing and scheduling

**Summary.** This roadmap develops the classical optimality theorems of deterministic machine
scheduling: on one machine, which orders of the jobs minimize the total weighted completion time,
the maximum lateness or a general maximum cost, and which sets of jobs can all meet their due
dates; on identical parallel machines with preemption, the least makespan; in the two-machine flow
shop, the orders that minimize the makespan. A finite set of jobs is given, each with a processing
time; on one machine a schedule is a sequence of the jobs processed without idle time, so the
completion time of a job is the total processing time of the jobs up to and including it. Every
target is a statement about sequences, completion times and schedules as mathematical objects; no
procedure, sorting method or running time is specified.

The headline theorems are these.

- *Smith's ratio rule.* If every processing time `p j` is positive, a sequence minimizes
  `∑ w j C j` if and only if the ratios `w j / p j` are nonincreasing along it; the weights are
  arbitrary real numbers.
- *Jackson's and Lawler's rules.* With nonnegative processing times, every sequence in which the
  due dates are nondecreasing minimizes the maximum lateness, and all jobs can meet their due dates
  exactly when they do so in such a sequence. With nonnegative processing times, nondecreasing
  cost functions and an acyclic precedence relation, among the precedence-respecting sequences of
  least maximum cost there is one that ends with a job without successors whose cost at the total
  processing time is least.
- *On-time sets.* For unit processing times and integer deadlines, the sets of jobs that can all
  be on time are the independent sets of a matroid. For general nonnegative processing times, if
  `k` is the first late job of a due-date order and `m` a longest job up to `k`, some largest
  on-time set leaves out `m` (the exchange step of Moore and Hodgson).
- *McNaughton's and Johnson's theorems.* On `m` identical machines with preemption, jobs with
  nonnegative processing times fit in the interval `[0, T]`, for `T ≥ 0`, if and only if no job is
  longer than `T` and the total is at most `m T`. In the two-machine flow shop with nonnegative
  processing times, a sequence in which `min(a i, b j) ≤ min(a j, b i)` whenever `i` precedes `j`
  is processed on both machines in an optimal schedule.

The roadmap rests on Mathlib alone: finite types and their bijections with `Fin n` for sequences,
sums over finite sets, Mathlib's matroids for the on-time sets of unit jobs, and Lebesgue measure on
the real line for preemptive schedules. It sits beside MatroidOptimization, whose greedy theorem
applies to the matroid of unit jobs, and beside ApproximationGuarantees, whose list schedules are
the non-preemptive counterpart of the preemptive schedules here.

## How to read the build

Layer 1 below defines sequences and completion times and proves Smith's rule and Lawler's rule.
Layer 2 adds due dates: Jackson's rule, the feasibility criterion, the on-time sets of unit jobs
and their matroid, and the exchange step of Moore and Hodgson; it uses the completion times of
Layer 1. Layer 3 treats preemptive schedules on identical machines and depends on no other layer.
Layer 4 treats the two-machine flow shop: the reduction to permutation schedules and Johnson's
theorem; it uses only the sequences of Layer 1. Within a layer the sections are in build order.

## Conventions

- **Jobs and sequences.** Jobs form a finite type `J` with `n = Fintype.card J` elements. A
  sequence is a bijection `σ : J ≃ Fin n`, sending a job to its position counted from `0`; `i`
  precedes `j` in `σ` when `σ i < σ j`. The empty job type has exactly one sequence.
- **One machine.** On one machine the jobs are processed in the order of a sequence, from time `0`
  and without idle time. Idle time inserted into such a schedule moves no completion time earlier,
  so for objectives that are nondecreasing in the completion times (that of 1.2 with nonnegative
  weights, those of 1.3 and of Layer 2) nothing is lost by this restriction.
- **Data.** Processing times, weights, due dates and costs are real numbers; Lenstra–Shmoys take
  integer data, and nothing below uses integrality except the integer deadlines of 2.3 and 2.4.
  Each statement says which of the data it assumes nonnegative or positive, and a Check shows the
  hypothesis is needed where it is not the physical convention alone.
- **Maxima.** The maximum of a cost over the jobs is a `Finset.sup` in `WithBot ℝ`, so it is `⊥`
  for the empty job type and every sequence of no jobs is optimal. Least values over a set of reals
  are stated with `IsLeast`; no infimum of a set of numbers is taken.
- **Preemptive schedules.** Times are real numbers with Lebesgue measure `volume`; the amount of
  processing that a set of times provides is its measure, an element of `ℝ≥0∞`.

## Layer 1: sequences and completion times

### 1.1 Completion times

Define `completionTime p σ j`, the sum of `p i` over the jobs `i` with `σ i ≤ σ j`.

- The completion time of the last job of `σ` is `∑ j, p j`.
- If `p` is nonnegative and `σ i ≤ σ j`, then `completionTime p σ i ≤ completionTime p σ j`.
- Exchanging two adjacent jobs `i`, `j` of a sequence (`(σ j : ℕ) = σ i + 1`) changes no
  completion time except theirs: afterwards `j` completes at `completionTime p σ i − p i + p j`
  and `i` at the old completion time of `j`.
- Deleting a job `l` from a sequence and closing the gap (the sequence of the remaining jobs in the
  same relative order) does not increase any completion time when `p l ≥ 0`, and decreases those
  after `l` by `p l`.

**Checks.**
- Jobs `a, b, c` with `p = (2, 1, 3)` in the order `b, a, c` complete at `3, 1, 6` (for `a, b, c`).
  A definition summing over the jobs strictly before `j` would give `1, 0, 3`: the completion time
  includes the job's own processing.

*Needs:* Mathlib `Finset.sum`, `Finset.filter`, `Equiv`, `Fin`. (Proved here.)

### 1.2 Smith's ratio rule

Define `weightedCompletion p w σ = ∑ j, w j * completionTime p σ j`. Prove
`weightedCompletion_le_iff`: if `0 < p j` for every job, then `σ` minimizes `weightedCompletion p w`
over all sequences if and only if `w j / p j ≤ w i / p i` whenever `σ i < σ j` (Lenstra–Shmoys,
*Elements of Scheduling*, Theorem 4.1, Ch. 4, p. 2, under the standing assumption `w j ≥ 0`,
`p j > 0` of §4.1; the interchange argument there uses no sign of the weights, and the statement
here takes arbitrary real weights). With `w = 1` it says that the sequences of nondecreasing
processing time minimize `∑ j, C j`.

Route: exchanging adjacent jobs `i` before `j` changes the cost by `w i p j − w j p i` (1.1), which
is negative when `w i / p i < w j / p j`; so an optimal sequence has nonincreasing ratios along
adjacent pairs, hence along all pairs. Conversely, any sequence can be carried to a given
ratio-ordered sequence `σ` by exchanges of adjacent pairs that `σ` orders the other way. Started
from an optimal sequence, each such pair has equal ratios, by the first part and the order of `σ`,
so each exchange keeps the cost and the sequence stays optimal; hence `σ` is optimal.

**Checks.**
- `p = (1, 2)`, `w = (1, 3)`: the ratios are `1` and `3/2`; the second job first costs `9`, the
  other order `10`.
- Negative weights go last: `p = (1, 1)`, `w = (−1, 1)`; the second job first costs `−1`, the other
  order `1`.
- Ties: `p = (1, 2)`, `w = (1, 2)` have equal ratios, both orders cost `7` and both satisfy the
  condition.
- Positivity is needed: with `p = (0, 1)` and `w = (1, 1)` the order with the first job first
  costs `1` and is optimal (the other costs `2`), but `1 / 0 = 0` in Lean, so the condition
  `w 1 / p 1 ≤ w 0 / p 0` reads `1 ≤ 0` and fails.

*Needs:* 1.1; Mathlib `Equiv.swap`, `Finset.sum`. (Lenstra–Shmoys Theorem 4.1, generalized as
said.)

### 1.3 Lawler's rule for a maximum cost under precedences

Define `maxCost p f σ`, the maximum over the jobs of `f j (completionTime p σ j)` in `WithBot ℝ`,
for cost functions `f : J → ℝ → ℝ`; and, for a relation `r` on the jobs, `RespectsPrecedence r σ`:
`r i j` implies `σ i < σ j`. Prove `exists_respectsPrecedence_maxCost_le_last`: let `p` be
nonnegative, every `f j` monotone, and `r` acyclic (no `j` with `Relation.TransGen r j j`). If `l`
has no successor (`r l k` for no `k`) and `f l (∑ j, p j) ≤ f k (∑ j, p j)` for every job `k`
without successor, then some sequence respecting `r` puts `l` last and has the least maximum cost
among all sequences respecting `r` (Lenstra–Shmoys, Ch. 3, p. 4: the argument before Theorem 3.3,
for nondecreasing costs as in assumption (1.1) of Ch. 1, p. 3; the theorem there is stated as the
correctness of the resulting procedure, which is not a target here).

Route: a finite acyclic relation has a respecting sequence, and the last job of any respecting
sequence has no successor and completes at `∑ j, p j`, so every respecting sequence costs at least
`f l (∑ j, p j)`. Deleting `l` from a respecting sequence leaves a respecting sequence of the other
jobs, no completion time increases (1.1) and the costs are nondecreasing, so its cost does not
increase. Take a respecting sequence
of the other jobs of least cost and append `l`: it respects `r` because `l` has no successor, and
its cost is the larger of these two lower bounds.

**Checks.**
- Jobs `a, b, c` with unit processing times, `a` before `c`, and costs `f a = 0`, `f b t = t`,
  `f c t = 2t`. The jobs without successor are `b` and `c`, with costs `3` and `6` at time `3`, so
  `l = b`. The sequence `a, c, b` costs `max(0, 4, 3) = 4`, the least; `a, b, c` and `b, a, c`
  both cost `6`.
- Monotonicity is needed: two unit jobs, no precedence, `f 0 = 0` and `f 1 t = 10` for `t = 1`,
  `0` otherwise. Both jobs cost `0` at time `2`, so `l = 0` is allowed, but the only sequence with
  job `0` last costs `10`, while the other costs `0`.
- Acyclicity is needed: with `r a b`, `r b a` and a third job `c` without successor, no sequence
  respects `r`, and the conclusion asserts one.
- Nonnegativity is needed: `p = (−2, −2)`, `f 0 = 0`, and `f 1 t` equal to `0` for `t < −3` and
  `1` otherwise. Both cost `0` at the total `−4`, so `l = 0` is allowed; the sequence with job `0`
  last costs `1`, the other `0`.
- With no precedences and `f j t = t − d j`, the theorem puts last a job of largest due date.

*Needs:* 1.1; Mathlib `Relation.TransGen`, `Finset.sup`, `WithBot`, `Monotone`. (Lenstra–Shmoys,
Ch. 3, p. 4.)

### Examples

The three jobs of the first Check of 1.3 with their three respecting sequences; the ratio-ordered
sequences of 1.2 for jobs of equal ratio, all optimal.

### Dependencies

Within the layer, 1.2 and 1.3 use 1.1. Mathlib `Finset.sum`, `Finset.filter`, `Finset.sup`,
`WithBot`, `Equiv`, `Equiv.swap`, `Fin`, `Monotone`, `Relation.TransGen`.

## Layer 2: due dates and on-time sets

### 2.1 Jackson's rule

Define `IsEDD d σ`: `d i ≤ d j` whenever `σ i < σ j`, and `maxLateness p d σ`, the maximum cost of
1.3 for the costs `t ↦ t − d j`. Prove `IsEDD.maxLateness_le`: if `p` is nonnegative and
`IsEDD d σ`, then `maxLateness p d σ ≤ maxLateness p d τ` for every sequence `τ` (Lenstra–Shmoys,
Theorem 3.1, Ch. 3, p. 2; Karger–Stein–Wein, Theorem 2.3, pp. 8–9, where the computation for the
exchanged pair is written out).

Route: if `k` immediately precedes `j` in `τ` and `d j ≤ d k`, exchanging them gives `k` the old
completion time of `j` and lateness at most the old lateness of `j`, and moves `j` earlier because
`p k ≥ 0`. Such exchanges carry `τ` to `σ`, each reducing the number of pairs ordered differently
by the two sequences, without increasing the maximum lateness.

**Checks.**
- `p = (2, 1)`, `d = (3, 1)`: the due-date order (second job first) has maximum lateness `0`, the
  other order `2`.
- Nonnegativity is needed: `p = (−2, −2)`, `d = (0, 1)`; the due-date order has maximum lateness
  `−2`, the other order `−3`.
- With no jobs both sides are `⊥`.

*Needs:* 1.1, 1.3 (`maxCost`); Mathlib `Finset.sup`, `WithBot`. (Lenstra–Shmoys, Theorem 3.1.)

### 2.2 On-time sets and the feasibility criterion

Define `IsOnTimeSet p d X` for a finite set `X` of jobs: some sequence completes every job of `X`
by its due date. Prove `IsEDD.isOnTimeSet_univ_iff`: if `p` is nonnegative and `IsEDD d σ`, all
jobs are on time in some sequence if and only if they are all on time in `σ` (Lenstra–Shmoys,
Corollary 3.2, Ch. 3, p. 2, whose proof is left there as an exercise; here it follows from 2.1,
since all jobs are on time in a sequence exactly when its maximum lateness is at most `0`).

- On-time sets are closed under subsets, and the empty set is on time.
- For nonnegative `p`, a set `X` is on time if and only if the sequence that lists `X` in
  nondecreasing order of due dates, followed by the other jobs, completes `X` on time: apply 2.1 to
  the jobs of `X` and note that the jobs after `X` do not move those of `X`.

**Checks.**
- `p = (1, 1)`, `d = (1, 1)`: the set of both jobs is not on time, each one-element set is.
- For nonnegative `p`, a job with `p j > d j` belongs to no on-time set. Without nonnegativity it
  may: for `p = (2, −5)` and `d = (1, 0)` the order `1, 0` completes job `0` at `−3`, so `{0}` is
  on time.

*Needs:* 1.1, 2.1. (Lenstra–Shmoys, Corollary 3.2, derived from 2.1.)

### 2.3 Unit jobs with integer deadlines

Take `p j = 1` for every job and deadlines `D : J → ℕ`, the due date of `j` being `D j`. Prove
`isOnTimeSet_one_iff`: `X` is on time if and only if, for every `t : ℕ`, at most `t` jobs of `X`
have `D x ≤ t` (Erickson, *Algorithms*, chapter E, Lemma E.3, p. 5, for deadlines between `1` and
the number of jobs; any natural deadlines are allowed here). In a sequence the job at position `k`
completes at `k + 1`.

Route: if a sequence completes `X` on time, the `t`-th job of `X` in it completes at time at least
`t`, so its deadline is at least `t`. Conversely, listing `X` in nondecreasing order of deadlines
completes every job of `X` with deadline at most `t` by time `t`.

**Checks.**
- `D = (1, 1, 2)`: the on-time sets are `∅`, the three one-element sets, `{0, 2}` and `{1, 2}`;
  `{0, 1}` fails the condition at `t = 1`.
- A job with deadline `0` is in no on-time set: the condition at `t = 0` excludes it, and it
  completes at time at least `1`.

*Needs:* 1.1, 2.2. (Erickson, Lemma E.3.)

### 2.4 The matroid of on-time unit jobs

Prove `exists_matroid_indep_iff_isOnTimeSet`: for deadlines `D : J → ℕ` there is a matroid on `J`
with ground set `Set.univ` whose independent sets are exactly the on-time sets of unit jobs
(Erickson, Lemma E.4, p. 6). The matroid is unique, since a matroid is determined by its ground
set and its independent sets.

Route: build it with `IndepMatroid.ofFinset`. The empty set and subsets are 2.2. For augmentation,
given on-time `X`, `Y` with `#Y < #X`, let `t*` be the largest `t` with `#X(t) ≤ #Y(t)`, where
`X(t)` is the set of jobs of `X` with deadline at most `t`; it exists since `#X(0) = 0` and
`#X(t) > #Y(t)` for large `t`. Then `X` has more jobs of deadline exactly `t* + 1` than `Y`, so some
such job `j` lies in `X \ Y`; the set `insert j Y` satisfies the condition of 2.3, at `t ≤ t*`
because `Y` does and at `t > t*` because `#Y(t) + 1 ≤ #X(t) ≤ t`.

**Checks.**
- For `D = (1, 1, 2)` the bases are `{0, 2}` and `{1, 2}`.
- Unit processing times are needed: for `p = (2, 1, 1)` and `d = (2, 2, 2)` the maximal on-time
  sets are `{0}` and `{1, 2}`, of different sizes, so they are not the independent sets of a
  matroid.
- A job with deadline `0` is a loop of the matroid.

*Needs:* 2.2, 2.3; Mathlib `Matroid`, `IndepMatroid.ofFinset`, `IndepMatroid.ofFinset_indep`.
(Erickson, Lemma E.4.)

### 2.5 The exchange step of Moore and Hodgson

Prove `exists_isOnTimeSet_card_max_not_mem`: let `p` be nonnegative, `σ` a due-date sequence,
`k` a job that is late in `σ` while every job before it is on time, and `m` a job with
`σ m ≤ σ k` whose processing time is largest among the jobs at positions up to `σ k`. Then some
on-time set of greatest cardinality does not contain `m` (Cheriyan–Ravi–Skutella, Lemma 3, p. 2,
with Proposition 1, p. 2, for nonnegative processing times and due dates; the argument does not
use the sign of the due dates, and any real due dates are allowed here). Deleting `m` therefore
leaves the greatest size of an on-time set unchanged and lowers the least number of late jobs by
exactly one, which by induction on the number of jobs gives the optimality of the Moore–Hodgson
procedure for the number of late jobs; that procedure is not a target.

Route: every sequence has a late job among those up to `k`, because the last of them in that
sequence completes no earlier than the sum of their processing times, which is the completion time
of `k` in `σ` and exceeds `d k`, the largest of their due dates. Take a largest on-time set `X`. If
`m ∉ X` there is nothing to prove; otherwise some job `r ≠ m` up to `k` is not in `X`. The set `X'`
obtained from `X` by replacing `m` with `r`, ordered as in `σ`, is on time. The jobs before `k`
complete no later than in `σ`. If `k` is in `X'`, then `m ≠ k`, and `k` completes by the sum of the
processing times of the jobs up to `k` other than `m`; since `p m ≥ p k` this is at most the
completion time in `σ` of the job just before `k`, hence at most its due date, which is at most
`d k`. The jobs after `k` complete `p m − p r ≥ 0` earlier than in the order of `σ` restricted to
`X`, a due-date order of `X`, which is on time by 2.2.

**Checks.**
- `p = (1, 3, 1)`, `d = (2, 3, 4)`, in this order: completion times `1, 4, 5`; the second job is the
  first late one and the longest up to it. The largest on-time sets are `{0, 2}` and `{1, 2}`, and
  `{0, 2}` omits it.
- The choice of the longest job is needed: `p = (1, 2)`, `d = (1, 1)`; the second job is the first
  late one, the only largest on-time set is `{0}`, and it contains the first job, which is not the
  longest.
- The first late job is needed: `p = (2, 2)`, `d = (1, 2)`; both jobs are late, and with `k` the
  second job and `m = k` (a longest job up to `k`) the only largest on-time set is `{1}`, which
  contains `m`.

*Needs:* 1.1, 2.1, 2.2. (Cheriyan–Ravi–Skutella, Lemma 3.)

### Examples

The deadlines `(1, 1, 2)` of 2.3 and 2.4 with their on-time sets and bases; the three jobs of the
first Check of 2.5 with their largest on-time sets.

### Dependencies

Layer 1 (1.1, and `maxCost` of 1.3 for 2.1). Within the layer: 2.2 uses 2.1; 2.3 uses 2.2; 2.4 uses
2.2 and 2.3; 2.5 uses 2.1 and 2.2. Mathlib `Matroid`, `IndepMatroid.ofFinset`,
`IndepMatroid.ofFinset_indep`, `Finset.card`, `Finset.sup`, `WithBot`.

## Layer 3: preemptive schedules on identical machines

### 3.1 Preemptive schedules

Define `IsPreemptiveSchedule p m T A` for `A : Fin m → J → Set ℝ`: every `A i j`, the set of times
at which machine `i` processes job `j`, is measurable and contained in `[0, T]`; for each machine
the sets of different jobs are disjoint; for each job the sets of different machines are disjoint;
and `∑ i, volume (A i j) = ENNReal.ofReal (p j)` for every job.

- For a schedule within `[0, T]`, each machine provides at most `T` units in all, and each job
  receives at most `T`, the measure of `[0, T]`.
- The empty sets give a schedule whenever every `p j` is `0`.

**Checks.**
- Measurability is needed for the first bullet: a Bernstein set `B` (one that meets every
  uncountable closed set, as does its complement) gives disjoint sets `B ∩ [0, 1]` and
  `[0, 1] \ B` of outer measure `1` each, so without measurability one machine would process two
  jobs of length `1` within `[0, 1]`.
- With `m = 0` machines and nonnegative `p`, a schedule exists exactly when every `p j` is `0`.

*Needs:* Mathlib `MeasurableSet`, `MeasureTheory.volume`, `ENNReal.ofReal`, `Pairwise`,
`Disjoint`, `MeasureTheory.measure_biUnion_finset`, `MeasureTheory.measure_mono`, `Real.volume_Icc`.
(Proved here.)

### 3.2 McNaughton's theorem

Prove `exists_isPreemptiveSchedule_iff`: if `p` is nonnegative and `T ≥ 0`, a preemptive schedule
on `m` machines within `[0, T]` exists if and only if `p j ≤ T` for every job and
`∑ j, p j ≤ m * T`. Prove `isLeast_preemptiveMakespan`: for at least one job, nonnegative `p` and
`m ≥ 1`, the least `T ≥ 0` admitting such a schedule is `max (max_j p j) ((∑ j, p j) / m)`
(Karger–Stein–Wein, §2.3.1, the bounds (1) and (2) on p. 13 and Theorem 2.7, p. 14; Lenstra–Shmoys,
§10.1, Ch. 10, pp. 1–2, bound (10.1)).

Route: necessity is the first bullet of 3.1, summed over the machines for the total. Sufficiency is
the wrap-around construction: list the jobs in any order and fill machine `0` on `[0, T)`, then
machine `1`, and so on, splitting a job at time `T`. A split job `j` occupies `[T − s, T)` on one
machine and `[0, p j − s)` on the next, which are disjoint since `p j ≤ T`; the total fits since
`∑ j, p j ≤ m T`. With `m = 0` the conditions force every `p j` to be `0`, and the empty sets serve.
The least value follows from the criterion.

**Checks.**
- `p = (1, 1, 1)` on `m = 2` machines: the least `T` is `3/2`, below the `2` of every schedule
  without preemption.
- `p = (3, 1, 1)`, `m = 2`: the least `T` is `3`, set by the longest job.
- `T ≥ 0` is needed: for one job with `p = 0` and `T = −1` the empty set is a schedule, since
  `[0, −1]` is empty, while `p j ≤ −1` fails.
- Nonnegativity is needed: `p = (1, 1, −5)`, `m = 1`, `T = 1` satisfy both inequalities, but the two
  unit jobs need two units of time on the one machine within `[0, 1]`.
- With no jobs every `T ≥ 0` admits the empty schedule, and both inequalities hold.

*Needs:* 3.1; Mathlib `MeasureTheory.measure_iUnion_le`, `MeasureTheory.measure_biUnion_finset`,
`Real.volume_Icc`, `Real.volume_Ico`, `Finset.sup'`, `IsLeast`. (Karger–Stein–Wein, Theorem 2.7.)

### Examples

The two Checks of 3.2 with their wrap-around schedules.

### Dependencies

No other layer. Mathlib `MeasurableSet`, `MeasureTheory.volume`, `MeasureTheory.measure_mono`,
`MeasureTheory.measure_iUnion_le`, `MeasureTheory.measure_biUnion_finset`, `Real.volume_Icc`,
`Real.volume_Ico`, `ENNReal.ofReal`, `Finset.sup'`, `IsLeast`.

## Layer 4: the two-machine flow shop

### 4.1 Flow-shop schedules and permutation schedules

Every job `j` is processed first on machine 1 for time `a j` and then on machine 2 for time `b j`.
Define `IsFlowShopSchedule a b s₁ s₂` for start times `s₁ s₂ : J → ℝ`: `0 ≤ s₁ j`,
`s₁ j + a j ≤ s₂ j`, and for distinct jobs on each machine one finishes before the other starts.
The schedule finishes by `T` when `s₂ j + b j ≤ T` for every job. Define
`FollowsSequence a b s₁ s₂ σ`: whenever `σ i < σ j`, `i` finishes before `j` starts on both
machines. Prove `exists_followsSequence_of_isFlowShopSchedule`: for nonnegative `a` and `b`, every
schedule finishing by `T` can be replaced by one that follows some sequence and finishes by `T`
(Karger–Stein–Wein, Lemma 2.5, p. 11).

- For nonnegative `a`, `b` and a sequence `σ`, let `c₁` and `c₂` run through the jobs in the order
  of `σ` with `c₁ ← c₁ + a j` and `c₂ ← max c₂ c₁ + b j`, from `0`. Starting each job as early as
  `σ` allows gives a schedule following `σ` that finishes at the last value of `c₂`, and every
  schedule following `σ` finishes no earlier. Call this value the makespan of `σ`.

Route for the lemma: order the jobs by their start on machine 1, a job of length `0` before a job
starting at the same time; this is the order on machine 1. If on machine 2 a job `k` immediately
precedes `j` while `j` comes first on machine 1, `j` is done on machine 1 when `k` starts on
machine 2, so the two can exchange places on machine 2 within the same interval; finitely many
exchanges give the same order on both machines.

**Checks.**
- Jobs `(a, b) = (3, 2), (1, 4), (2, 2)`: the order `0, 1, 2` has makespan `11`, the orders
  `1, 2, 0` and `1, 0, 2` have makespan `9`, the least.
- A single job has makespan `a j + b j`; with no jobs every `T` is met by the empty schedule.

*Needs:* 1.1 (sequences); Mathlib `Equiv`, `Fin`, `Finset.sort`. (Karger–Stein–Wein, Lemma 2.5.)

### 4.2 Johnson's theorem

Define `JohnsonCondition a b σ`: `min (a i) (b j) ≤ min (a j) (b i)` whenever `σ i < σ j`. Prove
`exists_johnsonCondition`: some sequence satisfies it, namely one listing the jobs with
`a j ≤ b j` first in nondecreasing order of `a`, then the others in nonincreasing order of `b`
(the order of Johnson's rule; Karger–Stein–Wein, p. 11, and Lenstra–Shmoys, §13.1, Ch. 13, p. 1).
Prove `JohnsonCondition.exists_followsSequence`: for nonnegative `a`, `b` and `σ` satisfying the
condition, if some flow-shop schedule finishes by `T`, some schedule following `σ` finishes by `T`.
(Proved here, by the route below. The theorem is Johnson's; Karger–Stein–Wein, Theorem 2.6,
pp. 11–12, and Lenstra–Shmoys, §13.1, sketch a different argument for the order of Johnson's rule,
by reducing all processing times by their least value.)

Route for existence: if `i` precedes `j` in that order and both have `a ≤ b`, then
`min (a i) (b j) ≤ a i ≤ min (a j) (b i)`; if both have `a > b`, then
`min (a i) (b j) ≤ b j ≤ min (a j) (b i)`; if `a i ≤ b i` and `a j > b j`, the left side is at most
`a i ≤ b i` and at most `b j < a j`.

Route for the theorem, using the makespan of 4.1.
- *Exchange.* Let `k` immediately precede `j` in a sequence `τ`, let `x` and `y` be the values of
  `c₁` and `c₂` before them, and let `τ'` exchange them. After the pair, `c₁` is `x + a k + a j` in
  both, and `c₂` is `max(y + b k + b j, x + a k + a j + b k + b j − min(a j, b k))` in `τ` and the
  same with `min(a k, b j)` in `τ'`. If `min(a j, b k) ≤ min(a k, b j)`, the value for `τ'` is at
  most that for `τ`, and the recursion for the later jobs is monotone in `c₂`, so the makespan of
  `τ'` is at most that of `τ`.
- *Conclusion.* By 4.1 some sequence `τ` has makespan at most `T`. If `τ ≠ σ`, some adjacent pair
  `k, j` of `τ` has `σ j < σ k`, and the condition for `σ` gives `min(a j, b k) ≤ min(a k, b j)`;
  the exchange does not increase the makespan and lowers by one the number of pairs ordered
  differently by `τ` and `σ`. By induction on that number the makespan of `σ` is at most `T`, and
  the earliest schedule following `σ` finishes by `T`.

**Checks.**
- For the jobs of the Check of 4.1, the orders `1, 2, 0` (Johnson's rule) and `1, 0, 2` satisfy the
  condition and have the least makespan `9`; the other four orders violate it and have makespan
  `10` or `11`.
- The condition must hold for all pairs, not only adjacent ones: jobs `(1, 0), (0, 0), (0, 1)` in
  this order satisfy it on both adjacent pairs, fail it on the first and last, and have makespan
  `2`, while the order `(0, 1), (1, 0), (0, 0)` has makespan `1`.
- With equal jobs every sequence satisfies the condition, and all have the same makespan.

*Needs:* 4.1; Mathlib `Equiv.swap`, `Finset.sort`, `min`, `max`. (Proved here.)

### Examples

The three jobs of the Check of 4.1 with their six orders and makespans `11, 11, 9, 9, 11, 10` for
the orders `012, 021, 102, 120, 201, 210`.

### Dependencies

Layer 1 (sequences of 1.1). Within the layer, 4.2 uses 4.1. Mathlib `Equiv`, `Equiv.swap`, `Fin`,
`Finset.sort`.

## Scope and ownership

This roadmap owns the targets stated above: completion times of sequences, Smith's ratio rule and
Lawler's rule for a maximum cost under precedences; Jackson's rule, on-time sets and the
feasibility criterion, the on-time sets of unit jobs and their matroid, and the exchange step of
Moore and Hodgson; preemptive schedules on identical machines and McNaughton's theorem;
two-machine flow-shop schedules, the reduction to permutation schedules, and Johnson's theorem in
the form of the pairwise condition.

Nothing on these subjects is in the pinned libraries. Mathlib supplies the matroid constructor
`IndepMatroid.ofFinset` used in 2.4 and Lebesgue measure for Layer 3. The rearrangement inequality
of Mathlib (`MonovaryOn.sum_smul_comp_perm_le_sum_smul`, in
`Mathlib/Algebra/Order/Rearrangement.lean`) is a different statement from 1.2, about sums of
products of two sequences rather than weighted completion times, and is not used.

Related roadmaps:

- MatroidOptimization, Layer 2, proves the greedy theorem for every matroid. Applied to the matroid
  of 2.4 with nonnegative penalties of late jobs as weights, it gives an on-time set of unit jobs of
  greatest total penalty. That application is not stated here, and this roadmap does not depend on
  that one; 2.4 states only that the on-time sets form a matroid, which that roadmap does not
  state.
- ApproximationGuarantees, Layer 4 (4.1 and 4.2), owns assignments of jobs to identical machines
  without preemption, their makespan and its lower bounds, and list schedules. The schedules of
  Layer 3 here are preemptive, a different object: the lower bounds of 3.2 are stated for them, and
  the first Check of 3.2 shows that the two optima differ. This roadmap does not depend on that one.

Outside the scope: every procedure for computing a schedule and its running time, complexity and
hardness results; release dates; precedences beyond 1.3 (series-parallel orders, the minimization
of `∑ w j C j` under precedences); the weighted number of late jobs and Lawler–Moore recursions;
total tardiness; parallel machines without preemption, uniform and unrelated machines; flow shops
with three or more machines, open shops and job shops; stochastic scheduling; approximation
guarantees for scheduling.

## Exact supplier contracts

### From Mathlib

- `Mathlib/Logic/Equiv/Defs.lean`: `Equiv` (a bijection with its inverse), used for sequences
  `J ≃ Fin (Fintype.card J)`; `Mathlib/Logic/Equiv/Basic.lean`: `Equiv.swap`.
  `Mathlib/Data/Fintype/Card.lean`: `Fintype.card`; `Mathlib/Data/Finset/Sort.lean`: `Finset.sort`
  (the sorted list of a finite set in a linear order), for the sequences ordered by due date,
  ratio or start time.
- `Mathlib/Algebra/BigOperators/Group/Finset/Defs.lean`: `Finset.sum`;
  `Mathlib/Data/Finset/Filter.lean`: `Finset.filter`; `Mathlib/Data/Finset/Card.lean`:
  `Finset.card`.
- `Mathlib/Data/Finset/Lattice/Fold.lean`: `Finset.sup` (for an order with bottom, `⊥` on the empty
  set) and `Finset.sup'` (on a nonempty set); `Mathlib/Order/TypeTags.lean`: `WithBot`.
  `Mathlib/Order/Bounds/Defs.lean`: `IsLeast`. `Mathlib/Order/Monotone/Defs.lean`: `Monotone`.
  Lean core `Init/Core.lean`: `Relation.TransGen` (the transitive closure of a relation).
- `Mathlib/Combinatorics/Matroid/Basic.lean`: `Matroid` with ground set `M.E` and `M.Indep`.
  `Mathlib/Combinatorics/Matroid/IndepAxioms.lean`: `IndepMatroid.ofFinset` (for `[DecidableEq α]`,
  an `IndepMatroid α`, whose `.matroid` is a matroid, built from a ground set `E` and a predicate on
  `Finset α` that holds for `∅`, is closed under subsets, has the augmentation property and holds
  only for subsets of `E`) with `IndepMatroid.ofFinset_indep` (its independent finite sets are
  those satisfying the predicate).
- `Mathlib/MeasureTheory/MeasurableSpace/Defs.lean`: `MeasurableSet`.
  `Mathlib/MeasureTheory/Measure/Lebesgue/Basic.lean`: `Real.volume_Icc`, `Real.volume_Ico` (the
  measure of an interval is `ENNReal.ofReal` of its length).
  `Mathlib/MeasureTheory/Measure/MeasureSpaceDef.lean`: `MeasureTheory.volume`, Lebesgue measure
  on `ℝ`. `Mathlib/MeasureTheory/OuterMeasure/Basic.lean`: `MeasureTheory.measure_iUnion_le`
  (countable subadditivity) and `MeasureTheory.measure_mono` (monotonicity).
  `Mathlib/MeasureTheory/Measure/Basic.lean`: `MeasureTheory.measure_biUnion_finset` (additivity
  over a finite family of pairwise disjoint measurable sets).
  `Mathlib/Basic/ENNReal/Basic.lean`: `ENNReal.ofReal`.
  `Mathlib/Logic/Pairwise.lean`: `Pairwise`; `Mathlib/Order/Disjoint.lean`: `Disjoint`.

## References

- J. K. Lenstra and D. B. Shmoys (eds.), *Elements of Scheduling*, arXiv:2001.06005, chapters
  dated 15 January 2020. Page numbers are those printed in each chapter: Ch. 1, p. 3, assumption
  (1.1); Ch. 3, p. 2, Theorem 3.1 and Corollary 3.2, and p. 4, the argument before Theorem 3.3;
  Ch. 4, p. 2, Theorem 4.1; Ch. 10, pp. 1–2, §10.1; Ch. 13, p. 1, §13.1.
- D. Karger, C. Stein and J. Wein, *Scheduling Algorithms*, chapter of the CRC *Algorithms and
  Theory of Computation Handbook*, author's copy on D. Karger's page
  (`people.csail.mit.edu/karger/Papers/scheduling.pdf`): Theorem 2.3, pp. 8–9; Lemma 2.5 and
  Theorem 2.6, pp. 11–12; §2.3.1 and Theorem 2.7, pp. 13–14.
- J. Erickson, *Algorithms*, extra chapter E, "Matroids", on the author's page
  (`jeffe.cs.illinois.edu/teaching/algorithms/notes/E-matroids.pdf`): Lemmas E.3 and E.4, pp. 5–6.
- J. Cheriyan, R. Ravi and M. Skutella, *A simple proof of the Moore–Hodgson Algorithm for
  minimizing the number of late jobs*, arXiv:2104.06210v1, 2021: Proposition 1 and Lemma 3, p. 2.
- The results are attributed as these texts attribute them: Smith's ratio rule (Smith, 1956),
  Jackson's rule (Jackson, 1955), Lawler's rule (Lawler), McNaughton's wrap-around construction
  (McNaughton, 1959), Johnson's two-machine theorem (Johnson, 1954), and the procedure of Moore and
  Hodgson (Moore, 1968).
