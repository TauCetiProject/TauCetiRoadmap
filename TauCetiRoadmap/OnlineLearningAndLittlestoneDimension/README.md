# Roadmap: online learning and the Littlestone dimension

**Summary.** In online classification a learner sees instances one at a time, predicts a binary
label for each, and is then told the true label. Nothing is assumed about how the examples are
chosen except realizability: some member of a known class `H` of classifiers labels every example
correctly. This roadmap asks how many mistakes a learner must make in the worst case, answers it
with a combinatorial invariant of the class, the Littlestone dimension, and proves the
mistake bounds of the perceptron. A learner is a function from the history of labelled examples
and the next instance to a label, and the perceptron is a recursively defined sequence of vectors;
no procedure or running time is a target.

A mistake tree of depth `d` is a complete binary tree of depth `d` whose nodes are labelled by
instances; the class shatters it when every path from the root, read as a list of answers, is
followed by some member of the class. The Littlestone dimension is the supremum of the depths of
the shattered trees, a value in `ℕ ∪ {∞}`; it is `0` for the empty class.

The main theorems are these.

- *Littlestone's theorem.* For every class `H`, the least worst-case number of mistakes of a
  deterministic learner, over all finite sequences that some member of `H` labels correctly,
  equals the Littlestone dimension of `H`; some learner attains it.
- *Comparison with other measures of size.* The VC dimension of a class is at most its
  Littlestone dimension, which for a finite class is at most `⌊log₂ |H|⌋`. The thresholds
  `x ↦ (x < a)` on `ℕ` have VC dimension `1` and infinite Littlestone dimension.
- *The halving bound.* On a finite class, the majority vote of the members consistent with the
  examples already seen, with ties broken towards `true`, makes at most `⌊log₂ |H|⌋` mistakes on
  every sequence that some member labels correctly.
- *Novikoff's bound.* In a real inner product space, if the labels are `±1`, the instances have
  norm at most `R`, and some `u` satisfies `y t ⟪u, x t⟫ ≥ γ > 0` in every round, then the
  perceptron updates at most `(R ‖u‖ / γ)²` times. Without such a `u`, the number of updates is
  bounded by the hinge losses of an arbitrary `u` on the update rounds.

The VC dimension is that of MathematicalStatisticsAsymptotic, whose definition for families of
sets is copied here and applied to the sets where the classifiers are `true`. The online protocol
over the probability simplex and its regret bounds belong to RegretMinimizationAndEquilibria;
here the learners are deterministic classifiers and the bounds count mistakes, not regret.

Layer 1 defines shattered trees and the Littlestone dimension, compares it with the VC dimension
and the size of a finite class, and computes both for thresholds on `ℕ`. Layer 2
defines learners and mistake bounds, proves the halving bound from its own definitions, and
proves Littlestone's theorem from Layer 1. Layer 3, the perceptron, uses no other layer.

## Conventions

- **Classes.** `X` is a type of instances, a classifier is a function `X → Bool`, and a class is
  a set `H : Set (X → Bool)`. The label `true` plays the role of the label `1` of the sources.
- **Trees.** A mistake tree is a function `t : List Bool → X`: the node reached after the answers
  `b₀, …, b_{i−1}` is labelled by `t [b₀, …, b_{i−1}]`, the root by `t []`. Only the nodes at
  depth less than `d` matter for a tree of depth `d`. The sources number the nodes of the tree
  in heap order; the list of answers is the same address.
- **Dimensions in `ℕ∞`.** The Littlestone dimension and the VC dimension take values in `ℕ∞`, with
  `⊤` for an unbounded supremum. The empty class shatters no tree, not even one of depth `0`, and
  the supremum of the empty family is `0`; so the empty class and a one-member class both have
  Littlestone dimension `0`. Part of the literature gives the empty class the value `−1`;
  statements here that would depend on the difference are phrased with shattered trees.
- **Learners.** A learner is a function `A : List (X × Bool) → X → Bool`: at round `i` of a
  sequence `s` of labelled examples it predicts `A (s.take i) (s[i].1)` from the first `i`
  examples. Rounds are numbered from `0`. A learner is deterministic, so an adversary that adapts
  to its predictions produces nothing that a fixed sequence does not.
- **Mistake bounds.** A sequence is realizable by `H` when one member of `H` gives every example
  its label. The mistake bound of `A` on `H` is the supremum in `ℕ∞` of its numbers of mistakes
  over all realizable sequences of all finite lengths.
- **Logarithms.** `Nat.log 2 n` is `⌊log₂ n⌋` for `n ≥ 1` and `0` for `n = 0`. The size of a
  set of classifiers is Mathlib's `Set.ncard`, which is `0` for an infinite set; every statement
  that uses it assumes the class finite.
- **Perceptron.** Instances lie in a real inner product space `E` and labels are reals equal to
  `1` or `−1`. The weights start at `0` and change exactly on the rounds with
  `y t ⟪w t, x t⟫ ≤ 0`, which include every round where the sign of `⟪w t, x t⟫` is wrong and
  every round where it is `0`.

## Layer 1: mistake trees and the Littlestone dimension

### 1.1 Shattered trees and the Littlestone dimension

Define `IsShatteredTree H d t`: for every list of answers `y : Fin d → Bool` there is `h ∈ H`
with `h (t ((List.ofFn y).take i)) = y i` for every `i < d`. Define `littlestoneDim H` as the
supremum in `ℕ∞` of the `d` for which some tree of depth `d` is shattered (Shalev-Shwartz and
Ben-David, Definitions 21.4 and 21.5, p. 291, where the dimension is defined as the largest such
depth). Prove:

- a tree shattered at depth `d + 1` is shattered at depth `d`, so the depths of the shattered
  trees form an initial segment of `ℕ`; when `littlestoneDim H` is finite and `H` and `X` are
  nonempty, a tree of depth `littlestoneDim H` is shattered;
- `littlestoneDim` is monotone in `H`;
- the split characterization: `H` shatters a tree of depth `d + 1` if and only if there is an
  instance `x` such that both `{h ∈ H | h x = false}` and `{h ∈ H | h x = true}` shatter trees of
  depth `d`;
- `littlestoneDim H = 0` if and only if no two members of `H` disagree at any instance.

**Checks.**

- The empty class shatters no tree, since depth `0` already asks for a member, so its dimension
  is `0`; on a nonempty `X` a one-member class shatters only depth `0` and also has dimension
  `0`. On an empty `X` there is no tree at all, and every class has dimension `0`. The split
  characterization is phrased with trees because the inequality form fails at `d = 0`: every
  class satisfies `0 ≤ littlestoneDim`, the empty one included, while a class shatters a tree of
  depth `1` only if it has two members that disagree somewhere.
- A two-member class `{h, not ∘ h}` on a nonempty `X` has dimension `1`: it shatters the depth
  `1` tree at any instance, and a depth `2` tree would need four members.
- The class of all classifiers on an `n`-point set has dimension `n`. The class of the `d`
  indicator functions of single points of a `d`-point set has dimension `1` for `d ≥ 2` and `0`
  for `d = 1` (Shalev-Shwartz and Ben-David, Example 21.3, pp. 291–292).
- Negative control for the tree convention: if every node at depth `i` must carry the same
  instance, the supremum of the depths is the VC dimension instead. The thresholds of 1.3 tell the
  two apart, with value `1` for level-labelled trees and `⊤` here.

*Needs:* Lean core `List.ofFn`, `List.take`. (Proved here.)

### 1.2 Comparison with the VC dimension and with the size of the class

Copy verbatim `vcDimSet` from MathematicalStatisticsAsymptotic 3.5: the supremum in `ℕ∞` of the
sizes of the finite sets `s` such that every `u ⊆ s` is the trace on `s` of a member of the
family. The VC dimension of `H` is `vcDimSet` of the family of sets `{x | h x = true}` for
`h ∈ H`. Prove:

- `vcDimSet_le_littlestoneDim`: the VC dimension of every class is at most its Littlestone
  dimension (Shalev-Shwartz and Ben-David, Theorem 21.9, p. 293; Mohri, Rostamizadeh and
  Talwalkar, Theorem 8.2, p. 180, as a bound on the optimal mistake bound).
- `littlestoneDim_le_log_ncard`: for a finite class, `littlestoneDim H ≤ ⌊log₂ |H|⌋`
  (Shalev-Shwartz and Ben-David, Example 21.2, p. 291).

*Route.* A shattered set `{x₀, …, x_{d−1}}` gives a shattered tree of depth `d` whose nodes at
depth `i` all carry `x_i`. For the second bound, two different answer lists `y ≠ y'` of a
shattered tree of depth `d` first differ at some `i`; they reach the same node there, so the
members that follow them disagree at that node and are different. Hence `2^d ≤ |H|` for every
shattered depth `d` (`Set.ncard_le_ncard_of_injOn`), and `Nat.le_log_of_pow_le` gives
`d ≤ ⌊log₂ |H|⌋`.

**Checks.**

- The empty class has VC dimension `0` (it shatters no set, not even `∅`) and Littlestone
  dimension `0`; both bounds read `0 ≤ 0`.
- For the class of all classifiers on an `n`-point set, `|H| = 2^n` and both bounds are
  equalities: VC dimension, Littlestone dimension and `⌊log₂ |H|⌋` are all `n`.
- For the `d` point indicators of 1.1 with `d ≥ 4`, the Littlestone dimension `1` is far below
  `⌊log₂ d⌋ ≥ 2`.
- For `N ≥ 1`, the restrictions of the thresholds of 1.3 to `{0, …, N − 1}` form a class of
  `N + 1` members with VC dimension `1` and Littlestone dimension `⌊log₂ (N + 1)⌋`, so the second
  bound is attained; for `N = 7` both sides are `3`. For `N = 0` all restrictions coincide and
  the VC dimension is `0`.
- Finiteness is needed in the second bound: for the infinite class of 1.3, `Set.ncard` is `0` and
  `Nat.log 2 0 = 0`, while the Littlestone dimension is `⊤`.

*Needs:* 1.1; MathematicalStatisticsAsymptotic 3.5 `vcDimSet`; Mathlib `Set.ncard`,
`Set.ncard_le_ncard_of_injOn`, `Nat.log`, `Nat.le_log_of_pow_le`.

### 1.3 Thresholds on the natural numbers

Define `thresholds`, the class of the classifiers `x ↦ decide (x < a)` on `ℕ`, one for each
`a : ℕ`. Prove `vcDimSet_thresholds_eq_one_and_littlestoneDim_thresholds_eq_top`: its VC
dimension is `1` and its Littlestone dimension is `⊤` (Shalev-Shwartz and Ben-David, Example
21.4, p. 292, for the thresholds `x ↦ 1[x < a]` on `[0, 1]`, and the end of the proof of Theorem
21.9, p. 293, for the gap; the version on `ℕ` is proved here).

*Route.* A one-point set `{x}` is shattered by `a = 0` and `a = x + 1`, and for `x < z` no
threshold is `false` at `x` and `true` at `z`. For the Littlestone dimension, the binary search
tree on `{0, …, 2^d − 2}` (root `2^(d−1) − 1`, the answer `true` sending the search to the larger
half) is shattered at depth `d` for every `d`.

**Checks.**

- On `{0, 1, 2}` with `d = 2`: root `1`; after the answer `false` the node is `0`, after `true`
  it is `2`. The four answer lists are followed by the thresholds `a = 0, 1, 2, 3`, in the order
  `(false, false), (false, true), (true, false), (true, true)`.
- The same class embeds in the thresholds on `ℝ` through `ℕ ⊆ ℝ`, so those have infinite
  Littlestone dimension as well; their VC dimension is also `1`.

*Needs:* 1.1, 1.2. (Proved here.)

### Examples

The two-member class `{h, not ∘ h}`; the class of all classifiers on a finite set; the point
indicators; the thresholds on `ℕ`, on `{0, …, N − 1}` and on `ℝ`.

### Dependencies

Lean core `List.ofFn`, `List.take`; Mathlib `Set.ncard`, `Set.ncard_le_ncard_of_injOn`, `Nat.log`,
`Nat.le_log_of_pow_le`; MathematicalStatisticsAsymptotic 3.5 `vcDimSet`. No other layer.

## Layer 2: mistake bounds

### 2.1 Learners, realizable sequences and mistake bounds

Define `Learner X`, `mistakes A s`, the number of rounds `i < s.length` with
`A (s.take i) s[i].1 ≠ s[i].2`, `IsRealizable H s` and `mistakeBound A H` as in
[Conventions](#conventions) (Shalev-Shwartz and Ben-David, Definition 21.1, p. 288, with the
supremum over realizable sequences of every length; Mohri, Rostamizadeh and Talwalkar,
equations (8.2) and (8.3), p. 179).

**Checks.**

- `mistakes A [] = 0` for every learner; the learner that always predicts `true` makes `2`
  mistakes on `[(0, false), (1, true), (2, false)]`.
- On the empty class no sequence is realizable, even the empty one, so every learner has mistake
  bound `0`, which agrees with `littlestoneDim ∅ = 0`. On a one-member class `{h}`, the learner
  that predicts `h x` has mistake bound `0`.
- The supremum must range over realizable sequences only: over all sequences, every learner on a
  nonempty `X` would have bound `⊤`, since a sequence that repeats one instance with the label
  opposite to each prediction makes it err in every round.

*Needs:* Lean core `List.take`. (Proved here.)

### 2.2 The halving bound

Define `versionSpace H s`, the members of `H` consistent with every example of `s`, and
`halvingLearner H`, which predicts `true` at `x` exactly when at least half of the version space
(counted by `Set.ncard`) is `true` at `x`. Prove `mistakeBound_halvingLearner_le`: for a finite
class, `mistakeBound (halvingLearner H) H ≤ ⌊log₂ |H|⌋` (Shalev-Shwartz and Ben-David, Theorem
21.3, p. 290, with the same tie-breaking; Mohri, Rostamizadeh and Talwalkar, Theorem 8.1,
p. 180).

*Route.* On a realizable sequence the version space always contains the labelling member, so it
is nonempty. It never grows, and at a mistake the members that agreed with the prediction leave
it; they were at least half of it, also in a tie. After `M` mistakes `1 ≤ |H| / 2^M`, so
`2^M ≤ |H|`.

**Checks.**

- A tie: `H = {h, not ∘ h}` on one point. Both members are in the version space and one of them
  is `true`, so `2 ≤ 2 · 1` and the learner predicts `true`; the label `false` costs one mistake,
  and `⌊log₂ 2⌋ = 1` is attained.
- The bound is attained for all classifiers on an `n`-point set: presenting each point once with
  the label opposite to the prediction gives `n = log₂ 2^n` mistakes.
- Finiteness is needed: for the thresholds of 1.3, the version space of the empty history is the
  whole class, which is infinite, so its `Set.ncard` is `0` and the learner predicts `true` in
  round `0`. The sequence `[(0, false)]`, realizable by `a = 0`, therefore costs one mistake,
  while `Nat.log 2 0 = 0`.

*Needs:* 2.1; Mathlib `Set.ncard`, `Set.ncard_le_ncard`, `Set.ncard_union_eq`, `Nat.log`,
`Nat.le_log_of_pow_le`.

### 2.3 Littlestone's theorem

Prove:

- `isLeast_mistakeBound`: `littlestoneDim H` is the least element of the set of the
  `mistakeBound A H` over all learners `A`. Every learner has mistake bound at least
  `littlestoneDim H` (Shalev-Shwartz and Ben-David, Lemma 21.6, p. 291), and some learner has
  mistake bound exactly `littlestoneDim H` (Lemma 21.7 and Corollary 21.8, p. 293).

It holds for every class, finite or not, and for the empty class.

*Route.* Lower bound: given a learner and a tree of depth `d` shattered by `H`, present the
instance at the current node, take as label the opposite of the prediction, and move to the
child given by that label. After `d` rounds the learner has erred `d` times on a sequence that
the member following this path labels correctly. Upper bound, for finite dimension: the
standard optimal learner predicts the label `r` for which `{h ∈ V | h x = r}` shatters the deeper
trees, `V` being the version space, where an empty set counts as shattering no tree at all and
ties go to `true`. By the split characterization of 1.1, at each mistake the largest depth
shattered by the version space drops by at least one, while the version space stays nonempty.
For infinite dimension the lower bound already gives every learner the bound `⊤`.

**Checks.**

- The comparison in the upper bound must rank an empty part below a one-member part. Ranking
  them by `littlestoneDim`, which is `0` for both, fails already for `H = {fun _ ↦ false}` on one
  point: the part where the member is `true` is empty, the tie sends the prediction to `true`,
  and the learner errs on every round of the sequence that repeats `(x, false)`, so its mistake
  bound is `⊤` while `littlestoneDim H = 0`.
- For the thresholds of 1.3 every learner has mistake bound `⊤`, although their VC dimension is
  `1`.
- A learner with a finite mistake bound exists exactly when `littlestoneDim H < ⊤`: one direction
  is the lower bound, the other the learner that attains the least element. So online
  learnability in the sense of Definition 21.1 (p. 288) of Shalev-Shwartz and Ben-David is
  finiteness of the Littlestone dimension.
- For a finite class the halving learner of 2.2 is one learner, so 2.3 recovers
  `littlestoneDim H ≤ ⌊log₂ |H|⌋` of 1.2.

*Needs:* 1.1, 2.1, 2.2 (the version space). (Proved here.)

### Examples

The tie of the halving learner on a two-member class; the class of all classifiers on `n` points,
where every bound of the layer is attained; the one-member class, on which the wrong ranking of
empty parts fails; the thresholds on `ℕ`.

### Dependencies

Layer 1 (1.1 for 2.3, 1.2 and 1.3 for Checks); Lean core `List.take`; Mathlib `Set.ncard`,
`Set.ncard_le_ncard`, `Set.ncard_union_eq`, `Nat.log`, `Nat.le_log_of_pow_le`.

## Layer 3: the perceptron

### 3.1 The perceptron sequence

For instances `x : ℕ → E` and labels `y : ℕ → ℝ`, define `perceptronWeight x y`:
`w 0 = 0`, `w (t + 1) = w t + y t • x t` if `y t ⟪w t, x t⟫ ≤ 0` and `w (t + 1) = w t`
otherwise; and `perceptronUpdates x y T`, the set of `t < T` with `y t ⟪w t, x t⟫ ≤ 0`
(Shalev-Shwartz and Ben-David, §21.4, p. 303; Mohri, Rostamizadeh and Talwalkar, equation (8.23),
p. 192). Prove that `w T` is the sum of `y t • x t` over the update rounds `t < T`.

**Checks.**

- Round `0` is always an update, since `y 0 ⟪0, x 0⟫ = 0`.
- In `E = ℝ` with `x t = 1` and `y t = 1`: `w 1 = 1`, and no subsequent round is an update.
- In `E = ℝ` with `x t = 1` and `y t = (−1)^t`, every round is an update and the weights
  alternate between `0` and `1`.

*Needs:* Mathlib `inner`. (Proved here.)

### 3.2 Novikoff's bound

Prove `card_perceptronUpdates_le`: let the labels `y t` be `±1` and `‖x t‖ ≤ R` for `t < T`, and
let `u ∈ E` and `γ > 0` satisfy `γ ≤ y t ⟪u, x t⟫` for `t < T`. Then the number of update
rounds among the first `T` is at most `(R ‖u‖ / γ)²` (Mohri, Rostamizadeh and Talwalkar, Theorem
8.8, p. 192, with `ρ = γ / ‖u‖`; Shalev-Shwartz and Ben-David, Theorem 21.16, p. 304, its case
`γ = 1`). The bound does not depend on the dimension of `E`.

*Route.* With `M` updates, `⟪u, w T⟫ ≥ γ M` by 3.1, and `‖w (t + 1)‖² ≤ ‖w t‖² + R²` at each
update by `norm_add_sq_real`, since `2 y t ⟪w t, x t⟫ ≤ 0` and `y t² = 1`. Cauchy–Schwarz
(`real_inner_le_norm`) gives `γ M ≤ ‖u‖ R √M`.

**Checks.**

- The bound is attained: in `E = ℝ` with `x 0 = 1`, `y 0 = 1`, `u = 1`, `γ = 1`, `R = 1` and
  `T = 1` there is one update and `(1 · 1 / 1)² = 1`.
- `γ > 0` is needed: with `x t = 0` the margin condition holds for `γ = 0`, every round is an
  update, and division by zero makes the right side `0`.
- The labels must be `±1`: in `E = ℝ` with `x 0 = 1`, `y 0 = 2`, `u = 1`, `γ = 2`, `R = 1` and
  `T = 1` the margin condition holds and there is one update, while `(1 · 1 / 2)² = 1/4`.
- For `u = 0` the margin condition fails at every round, so it forces `T = 0`, and the bound
  reads `0 ≤ 0`.

*Needs:* 3.1; Mathlib `real_inner_le_norm`, `norm_add_sq_real`, `inner_sum`.

### 3.3 The hinge-loss bound

Prove `card_perceptronUpdates_le_hinge`: let the labels `y t` be `±1` and `‖x t‖ ≤ R` for
`t < T`. For every `u ∈ E`, with `L` the sum of `max 0 (1 − y t ⟪u, x t⟫)` over the update rounds
among the first `T`, the number `M` of those rounds satisfies `M ≤ L + R ‖u‖ √L + R² ‖u‖²`
(Shalev-Shwartz and Ben-David, Theorem 21.16, p. 304).

*Route.* By 3.1, `⟪u, w T⟫` is the sum of `y t ⟪u, x t⟫ ≥ 1 − max 0 (1 − y t ⟪u, x t⟫)` over the
update rounds, so `M − L ≤ ⟪u, w T⟫ ≤ ‖u‖ R √M` as in 3.2. If `M − b √M − L ≤ 0` with
`b, L ≥ 0`, then `M ≤ L + b² + b √L`, by the position of `√M` between the roots of
`z² − b z − L` (the claim in the proof of Theorem 21.16 there). For `T ≥ 1` the hypothesis gives
`R ≥ 0`; for `T = 0`, `M = L = 0` and the right side is `R² ‖u‖² ≥ 0`.

**Checks.**

- When `u` separates with margin `1` every hinge term vanishes, `L = 0`, and the bound is
  `R² ‖u‖²`, the case `γ = 1` of 3.2.
- In `E = ℝ` with `x t = 1`, `y t = (−1)^t`, `u = 1`, `R = 1` and `T = 4`: all four rounds are
  updates, the hinge terms are `0, 2, 0, 2`, so `L = 4`, and `4 ≤ 4 + 2 + 1 = 7`.
- For `u = 0` every hinge term is `1`, `L = M`, and the bound reads `M ≤ M`.

*Needs:* 3.1, 3.2 (its two estimates); Mathlib `real_inner_le_norm`, `norm_add_sq_real`,
`inner_sum`, `Real.sqrt`.

### Examples

Constant and alternating labels on the real line; the one-step example where Novikoff's bound is
attained; labels outside `±1` and a zero margin as negative controls.

### Dependencies

Mathlib `inner`, `real_inner_le_norm`, `norm_add_sq_real`, `inner_sum`, `Real.sqrt`. No other
layer.

## Scope and ownership

This roadmap owns the definitions and theorems stated above: shattered mistake trees and the
Littlestone dimension with its split characterization; the inequalities between the VC
dimension, the Littlestone dimension and `⌊log₂ |H|⌋`; the thresholds on `ℕ`; deterministic
learners, mistakes, realizable sequences and mistake bounds; the version space and the halving
bound; Littlestone's theorem with its corollary on online learnability; the perceptron sequence,
Novikoff's bound and the hinge-loss bound.

Already in the libraries and therefore not targets: the shattering of finite set families and
their VC dimension (Mathlib `Finset.Shatters`, `Finset.vcDim`), with which `vcDimSet` agrees on
finite types; the binary logarithm of natural numbers, cardinalities of sets and the inner
product inequalities used above.

Stated by roadmaps on main and not restated here:

- MathematicalStatisticsAsymptotic 3.5 owns `vcDimSet`, the VC dimension of a family of sets with
  values in `ℕ∞`, and the Sauer–Shelah bound for traces. The definition is copied verbatim above;
  no statement here is about traces, covering numbers or uniform convergence.
- RegretMinimizationAndEquilibria 1.1 and 1.2 own the full-information online protocol over the
  probability simplex, external and swap regret, and the Hedge method with its regret bound. The
  learners here are deterministic classifiers under the realizability assumption, and every
  bound counts mistakes; no regret bound is stated.

Open roadmaps (not on main):

- StatisticalLearningTheory, in its 3.1, defines the VC dimension of a class of classifiers as
  `vcDimSet` of the sets where its members are `true`, the same composite as in 1.2, and proves
  PAC learnability results in its Layer 3; it names the Littlestone dimension of online
  learnability and online-to-batch conversion as outside its scope. Nothing here is about PAC
  learnability or random samples. This roadmap does not depend on that one.
- OnlineConvexOptimization proves the regret bound of online gradient descent in its Layer 2 and
  the online-to-batch conversion in its Layer 5. Shalev-Shwartz and Ben-David derive the
  hinge-loss bound of 3.3 from that regret bound; here it is proved from the recurrence directly,
  and no statement is about the regret of convex losses. This roadmap does not depend on that one.

Outside the scope: the unrealizable case (randomized learners, the weighted majority method,
Cover's impossibility result for deterministic learners, and the characterization of agnostic
online learnability by the Littlestone dimension); multiclass and real-valued analogues of the
Littlestone dimension; Winnow and kernel versions of the perceptron; the equivalence of finite
Littlestone dimension with private PAC learnability; online-to-batch conversion; and every
question of running time.

## Exact supplier contracts

### From Mathlib

- Lean core: `List.ofFn` (the list of the values of `y : Fin d → Bool`) and `List.take` (the
  first `i` entries of a list).
- `Mathlib/Data/Nat/Log.lean`: `Nat.log` (`Nat.log b n` is the largest `k` with `b^k ≤ n` for
  `b > 1` and `n ≥ 1`, and `0` for `n = 0`); `Nat.le_log_of_pow_le` (for `1 < b`, `b^x ≤ y`
  implies `x ≤ Nat.log b y`).
- `Mathlib/Data/Set/Card.lean`: `Set.ncard` (the number of elements of a finite set, `0` for an
  infinite one); `Set.ncard_le_ncard` (a subset of a finite set has at most as many elements);
  `Set.ncard_le_ncard_of_injOn` (a set mapped injectively into a finite set has at most as many
  elements);
  `Set.ncard_union_eq` (for disjoint finite sets the sizes add).
- `Mathlib/Analysis/InnerProductSpace/Basic.lean`: `real_inner_le_norm`
  (`⟪x, y⟫ ≤ ‖x‖ ‖y‖` in a real inner product space); `norm_add_sq_real`
  (`‖x + y‖² = ‖x‖² + 2 ⟪x, y⟫ + ‖y‖²`); `inner_sum` (the inner product with a finite sum is the
  sum of the inner products). `inner` is the inner product of
  `Mathlib/Analysis/InnerProductSpace/Defs.lean`, and `Real.sqrt` the square root on `ℝ`, `0` on
  negative numbers.
- `Mathlib/Combinatorics/SetFamily/Shatter.lean`: `Finset.Shatters` and `Finset.vcDim`, cited in
  the scope only.

### From TauCetiRoadmap.MathematicalStatisticsAsymptotic

- 3.5: `vcDimSet C`, for a family `C : Set (Set X)`, the supremum in `ℕ∞` of the sizes of the
  finite sets `s` such that for every `u ⊆ s` some `A ∈ C` has `x ∈ A ↔ x ∈ u` for all `x ∈ s`.
  It is copied verbatim into `Suggested.lean`, under this roadmap's namespace. Nothing else is
  assumed of it.

## References

- Shai Shalev-Shwartz and Shai Ben-David, *Understanding Machine Learning: From Theory to
  Algorithms*, Cambridge University Press, 2014, in the version distributed on the first
  author's page at the Hebrew University; Chapter 21, with the definition, theorem, example and
  printed page numbers of that version.
- Mehryar Mohri, Afshin Rostamizadeh and Ameet Talwalkar, *Foundations of Machine Learning*,
  second edition, MIT Press, 2018, in the open-access version (Creative Commons BY-NC-ND licence)
  linked from the first author's page at New York University; Chapter 8.
- Attributions made in prose without a locator: Nick Littlestone, "Learning quickly when
  irrelevant attributes abound: a new linear-threshold algorithm", Machine Learning 2 (1988), for
  the dimension, the halving argument and the standard optimal learner; A. B. J. Novikoff, "On
  convergence proofs on perceptrons" (1962), and Frank Rosenblatt (1958) for the perceptron.
