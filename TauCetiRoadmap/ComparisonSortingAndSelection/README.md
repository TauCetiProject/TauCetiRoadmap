# Roadmap: comparison sorting and selection

**Summary.** This roadmap develops the combinatorics of sorting and selecting by pairwise
comparisons. Its objects are finite: a comparison tree on `n` items is a binary tree whose inner
nodes each compare two items and whose leaves carry outputs, and a comparator network on `n`
wires is a finite sequence of comparators, each of which puts the smaller of the values on two
wires on the first and the larger on the second. An input of a tree is a ranking of `n` pairwise
different items, that is, a permutation; an input of a network is any assignment of values from a
linear order to the wires, ties allowed. Every target is a statement about trees, networks,
permutations and linear orders: how many comparisons some tree needs, how many every tree needs,
which networks sort. No program, data structure, machine model or running time is specified.

The headline theorems are these.

- *Lower bounds for sorting.* A comparison tree that determines the ranking of every input of `n`
  pairwise different items makes at least `⌈log₂ n!⌉` comparisons on some input and at least
  `log₂ n!` comparisons on average over the `n!` rankings.
- *Selection.* For `n ≥ 1`, finding the smallest and the largest of `n` items together takes
  exactly `⌈3n/2⌉ − 2` comparisons, and for `n ≥ 2`, finding the second smallest takes exactly
  `n + ⌈log₂ n⌉ − 2`: some comparison tree of that depth solves the problem, and every comparison
  tree that solves it makes at least that many comparisons on some input.
- *The zero–one principle.* A comparator network that sorts every input of zeros and ones sorts
  every input from every linear order.
- *Primitive networks.* A network all of whose comparators join a wire to the next one, with the
  smaller value going to the wire of smaller index, sorts every input if and only if it sorts the
  decreasing input `n − 1, …, 1, 0`; such a sorting network has at least `n(n − 1)/2` comparators,
  and the odd–even transposition network with `n` rounds is one with exactly that many.

The roadmap builds on Mathlib's linear orders, permutations of `Fin n` and integer logarithms, on
Mathlib's Kraft inequality for prefix-free codes, which gives the counting bounds for trees, and
on Tau Ceti's inversions of a map on a finite linearly ordered set, which count the exchanges of a
primitive network. Tau Ceti's description of the symmetric group as a Coxeter group already
identifies the number of inversions of a permutation with the least number of adjacent
transpositions that produce it; that identity is cited here and not proved again.

## How to read the build

Layer 1 below defines comparison trees, the comparison complexity of a problem and the counting
bounds that hold whenever a tree takes different outputs on different inputs. Layer 2 depends on
Layer 1 and treats sorting and merging: the lower bounds, sorting by binary insertion and the
exact complexity of merging two sequences of equal length. Layer 3 depends on Layer 1 only and
treats selection, where the counting bounds are too weak and the lower bounds come from adversary
arguments. Layer 4 defines comparator networks and proves the zero–one principle, the lower
bounds for size and depth, the reduction to standard form and the correctness and size of
Batcher's odd–even merge sort; its size bound uses the sorting bound of Layer 2. Layer 5 depends
on Layer 4 and treats primitive networks through inversions. Within a layer the sections are in
build order.

## Conventions

- **Items and rankings.** The items are indexed by `Fin n`. An input of a comparison tree is a
  ranking `σ : Equiv.Perm (Fin n)`: `σ i` is the rank of item `i`, rank `0` being the smallest, so
  item `i` is smaller than item `j` exactly when `σ i < σ j`. The items of an input are pairwise
  different. Trees are also evaluated on arbitrary functions `x : Fin n → β` into a linear order;
  by 1.1 the result on an injective `x` is the result on its ranking.
- **Comparisons.** A node of a tree is labelled by a pair `(i, j)` of items and has two subtrees:
  the first is followed when item `i` is smaller than item `j`, the second otherwise. The pair
  `(i, i)` is allowed; every input then follows the second subtree.
- **Cost and depth.** The cost of a tree on an input is the number of nodes on the branch the
  input follows. The depth of a tree is the largest number of nodes on any branch, including
  branches no ranking follows. Lower bounds are stated for the cost on some admissible input and
  upper bounds for the depth; each is the stronger form, since the cost is at most the depth.
- **Logarithms.** `⌈log₂ m⌉` is `Nat.clog 2 m`, the least `k` with `m ≤ 2 ^ k`; it is `0` for
  `m ≤ 1`. The real logarithm `log₂` is `Real.logb 2`.
- **Subtraction.** Subtraction of natural numbers is truncated. Each statement that uses it says
  for which arguments the formula is meant and what the truncated value is otherwise.
- **Networks.** The wires are indexed by `Fin n`. A comparator is a pair `(i, j)` of wires: it
  puts the smaller of the two values on wire `i` and the larger on wire `j`. The pair `(i, i)` is
  allowed and changes nothing. A comparator is standard when `i < j`. Values lie in an arbitrary
  linear order `β` and need not be different. An output is sorted when it is monotone as a
  function `Fin n → β`.
- **Binomial coefficients.** `C(a, b)` is `Nat.choose a b`.

## Layer 1: comparison trees and counting bounds

### 1.1 Comparison trees

Define `CompTree n α`, the comparison trees on `n` items with outputs in `α`, inductively: a leaf
`CompTree.leaf a` with `a : α`, or a node `CompTree.node i j l r` with `i j : Fin n` and subtrees
`l`, `r`. For `x : Fin n → β` with `β` a linear order define the output `CompTree.eval t x`, which
is `a` at a leaf and at a node is the output of `l` when `x i < x j` and of `r` otherwise; the
cost `CompTree.cost t x`, the number of nodes passed on the way; and `CompTree.depth t`, which is
`0` at a leaf and one more than the larger depth of the two subtrees at a node.

- For every tree `t` and every `x`, the cost of `t` on `x` is at most the depth of `t`.
- If `f : β → γ` is strictly monotone, the output and the cost of `t` on `f ∘ x` are those on `x`.
  Hence for injective `x` they are the output and the cost on the ranking of `x`, which gives item
  `i` the number of `j` with `x j < x i` as its rank.
- Pruning: for a tree `t` and a nonempty set `A` of rankings there is a tree with the same output
  and the same cost as `t` on every ranking in `A` whose depth is the largest cost of `t` on a
  ranking in `A`. Route: replace by a leaf every subtree that no ranking in `A` enters.
- Reversal: for a tree `t` let `t'` be the tree with every label `(i, j)` replaced by `(j, i)`.
  The output and the cost of `t'` on a ranking `σ` are those of `t` on the reversed ranking
  `i ↦ n − 1 − σ i`, and `t'` has the depth of `t`.

**Checks.**
- On two items, the tree with root `(0, 1)` and leaves `0` and `1` has depth `1`; it outputs `0`
  on the input `(5, 7)` and `1` on `(7, 5)`. On the tie `(5, 5)` it outputs `1`: a tie follows the
  second subtree.
- The tree with root `(0, 0)`, whose first subtree is a node `(0, 1)` and whose second subtree is
  a leaf, has depth `2` and cost `1` on every input. A lower bound on the depth is therefore
  weaker than a lower bound on the cost.

*Needs:* Mathlib `Equiv.Perm`. (Proved here; the model is the comparison tree of Erickson,
Lecture 12, §12.2 and §12.5.)

### 1.2 Problems and comparison complexity

A problem is a set `A` of admissible rankings and a relation `R` between rankings and outputs.
Define `CompTree.Solves t A R`: for every `σ ∈ A`, the output of `t` on `σ` is related to `σ` by
`R`. Define `IsComparisonComplexity A R v` for `v : ℕ`: some tree that solves the problem has
depth at most `v`, and every tree that solves the problem has cost at least `v` on some ranking
in `A`.

- At most one `v` is the comparison complexity of a problem.
- If `A` is nonempty, `v` is the comparison complexity if and only if `v` is the least depth of a
  tree that solves the problem. Route: the cost is at most the depth in one direction, pruning
  (1.1) in the other.

**Checks.**
- Sorting is the problem with all rankings admissible and `R σ τ` meaning `τ = σ`. A leaf solves
  it only for `n ≤ 1`: for `n = 2` a leaf has one output and there are two rankings.
- For the problem in which all rankings are admissible and every output is correct for every
  ranking, with outputs in a nonempty type, the complexity is `0`.
- With no admissible ranking no `v` is the comparison complexity, because the second clause asks
  for an admissible ranking, although every tree solves the problem and, when there is an output,
  the least depth is `0`. This is why the equivalence above assumes `A` nonempty.

*Needs:* 1.1. (Proved here.)

### 1.3 Counting bounds

Let `t` be a tree and `A` a finite set of rankings on which `t` takes pairwise different outputs.

- `CompTree.sum_two_inv_pow_cost_le_one`: the sum over `σ ∈ A` of `2⁻¹ ^ cost t σ` is at most `1`.
- `CompTree.exists_clog_card_le_cost`: if `A` is nonempty, some `σ ∈ A` has cost at least
  `⌈log₂ |A|⌉` (Erickson, Lecture 12, §12.3, for the depth).
- `CompTree.card_mul_logb_card_le_sum_cost`: the sum of the costs over `A` is at least
  `|A| · log₂ |A|`, where the right-hand side is `0` for empty `A`.

Route: send each `σ ∈ A` to the list of answers along its branch, a word in two letters whose
length is the cost. Rankings with different outputs end in different leaves, and the words of
two different leaves are not prefixes of one another, so the set of words is prefix-free and
Kraft's inequality gives the first statement. For the second, if every cost were below
`c = ⌈log₂ |A|⌉`, the sum would be at least `|A| / 2 ^ (c − 1) > 1`. For the third, apply
Jensen's inequality for the logarithm to the numbers `2⁻¹ ^ cost t σ` with equal weights.

**Checks.**
- The hypothesis on the outputs is needed: for a leaf and a set `A` of two rankings the sum of
  the first statement is `2`.
- For the three-item tree that sorts with the least total cost, the costs over the six rankings
  are `2, 2, 3, 3, 3, 3`: the Kraft sum is `1`, the largest cost is `3 = ⌈log₂ 6⌉`, and the total
  `16` exceeds `6 · log₂ 6 ≈ 15.51`.
- For `|A| = 1` the second statement gives cost at least `0` and the third gives `0 ≤` the cost.

*Needs:* 1.1; Mathlib `InformationTheory.IsPrefixFree`,
`InformationTheory.IsPrefixFree.finsetSum_one_div_card_pow_length_le_one`, `Nat.clog`,
`Nat.lt_clog_iff_pow_lt`, `Real.logb`, `ConcaveOn.le_map_sum`, `strictConcaveOn_log_Ioi`.
(Proved here, except as cited.)

### Examples

For the set of all six rankings of three items and the tree that compares `(0, 1)`, then `(1, 2)`
and, where needed, `(0, 2)`, the outputs are pairwise different, two rankings cost `2` and four
cost `3`.

### Dependencies

Mathlib: permutations of `Fin n`, `Nat.clog`, `Real.logb`, Kraft's inequality for prefix-free
codes, Jensen's inequality and the concavity of the logarithm. No other layer.

## Layer 2: sorting and merging

A tree on `n` items with outputs in `Equiv.Perm (Fin n)` sorts when it solves the problem with all
rankings admissible and `R σ τ` meaning `τ = σ`: its output on every ranking is that ranking.

### 2.1 Lower bounds for sorting

- `exists_clog_factorial_le_cost`: a tree that sorts `n` items has cost at least `⌈log₂ n!⌉` on
  some ranking (Erickson, Lecture 12, §12.5; course notes 15-451, Theorem 5.1, for `n ≥ 2` with
  the bound `log₂ n!`).
- `logb_factorial_le_average_cost`: for a tree that sorts `n` items, the sum of the costs over
  all rankings divided by `n!` is at least `log₂ n!` (course notes 15-451, Theorem 5.2, with
  `⌊log₂ n!⌋`; the remark after its proof says the floor can be dropped).
- Consequently, for `n ≥ 1`, a tree that sorts `n` items has cost at least `n log₂ n − n / ln 2`
  on some ranking and on average.

Route: a tree that sorts takes `n!` pairwise different outputs on the `n!` rankings; apply 1.3.
The last bullet follows from the logarithmic form of Stirling's lower bound for `n!`.

**Checks.**
- `⌈log₂ n!⌉` for `n = 0, …, 6` is `0, 0, 1, 3, 5, 7, 10`.
- For `n = 3` every sorting tree has cost `3` on some ranking, while the least average cost is
  `16/6 ≈ 2.667`, above `log₂ 6 ≈ 2.585`; so the average bound is not always attained.
- For `n = 0` and `n = 1` there is one ranking, a leaf sorts, and both bounds are `0`.

*Needs:* 1.3; Mathlib `Fintype.card_perm`, `Stirling.le_log_factorial_stirling`.

### 2.2 Upper bounds for sorting

- `exists_sorting_tree_depth_le`: for every `n` some tree that sorts `n` items has depth at most
  `⌈log₂ 1⌉ + ⌈log₂ 2⌉ + ⋯ + ⌈log₂ n⌉` (binary insertion; course notes 15-451, §6.4.1, where
  `n` is a power of two).
- For `n ≤ 5` the comparison complexity of sorting `n` items is `⌈log₂ n!⌉`.

Route: for the first statement, induction on `n`: below every leaf of a tree that sorts the first
`n − 1` items, find the place of the last item among the `n` gaps of the sorted sequence by
bisection, with `⌈log₂ n⌉` comparisons. For `n ≤ 4` the sum equals `⌈log₂ n!⌉`. For `n = 5` a
tree of depth `7` is needed: compare items `0, 1`, compare items `2, 3`, compare the two larger
ones; this gives a chain of three items and a fourth item known to be below the top of the chain.
Insert item `4` into the chain with two comparisons, then insert the fourth item among the at most
three items below the top of the chain with two comparisons. This way of sorting five items is
known as merge insertion and is attributed to Ford and Johnson.

**Checks.**
- The sum is `0, 0, 1, 3, 5, 8` for `n = 0, …, 5`, so binary insertion is one comparison above
  the complexity `7` for `n = 5`.
- Inserting into a sorted sequence of three items takes two comparisons, since there are four
  gaps; into a sequence of four items it takes three.

*Needs:* 1.1, 1.2, 2.1; Mathlib `Nat.clog`, `Nat.clog_le_iff_le_pow`. (Proved here, except as
cited.)

### 2.3 Merging

For `m k : ℕ` define `mergeInputs m k`, the set of rankings `σ` of `Fin (m + k)` that are
strictly increasing on the items of index below `m` and strictly increasing on the items of index
at least `m`. Merging is the problem with these admissible rankings and `R σ τ` meaning `τ = σ`.

- The set of admissible rankings has `C(m + k, m)` elements and contains the identity.
- `exists_clog_choose_le_cost`: a tree that solves merging has cost at least
  `⌈log₂ C(m + k, m)⌉` on some admissible ranking.
- For all `m`, `k` some tree of depth at most `m + k − 1` solves merging; for `m = k = 0` the
  truncated value is `0` and a leaf solves it.
- `isComparisonComplexity_merge_self`: the comparison complexity of merging for `k = m` is
  `2m − 1` when `m ≥ 1`. For `m = 0` it is `0`, which is also the truncated value of `2m − 1`.
- The comparison complexity of merging for `m = 1` is `⌈log₂ (k + 1)⌉`.

Route: an admissible ranking is determined by the set of ranks of the first `m` items, which
gives the count, and 1.3 gives the lower bound. The tree of depth `m + k − 1` repeatedly compares
the smallest items not yet placed of the two sequences. For the lower bound with `k = m`, take the
admissible ranking `σ` in which the items alternate, the first of the first sequence being the
smallest. For each of the `2m − 1` pairs of items of consecutive rank, exchanging their ranks
gives an admissible ranking that differs from `σ` in the answer to that comparison only; a tree
that does not compare the pair on the branch of `σ` gives both rankings the same output. For
`m = 1`, bisection among the `k + 1` gaps. (Proved here; compare Knuth, *The Art of Computer
Programming*, Volume 3, Section 5.3.2.)

**Checks.**
- For `m = 2`, `k = 1` the admissible rankings are the three rankings `(0, 1, 2)`, `(0, 2, 1)`,
  `(1, 2, 0)` of the items `0, 1, 2`; the ranking `(1, 0, 2)` is not admissible.
- For `m = 0` the identity is the only admissible ranking and a leaf solves merging.
- The counting bound is attained for `k = m ≤ 4`: `⌈log₂ C(2m, m)⌉ = 1, 3, 5, 7`. For `m = 5` it
  gives `⌈log₂ 252⌉ = 8`, below the complexity `9`.
- For `m = 2`, `k = 4` the complexity is `5`, above the counting bound `⌈log₂ 15⌉ = 4` and equal
  to `m + k − 1`.

*Needs:* 1.1, 1.2, 1.3; Mathlib `Finset.card_powersetCard`, `Nat.clog`.

### Examples

Sorting four items: `⌈log₂ 24⌉ = 5`, and binary insertion gives `0 + 1 + 2 + 2 = 5`. Merging
two sequences of three items takes `5` comparisons, the same as the counting bound
`⌈log₂ 20⌉ = 5`.

### Dependencies

Layer 1. Mathlib: `Fintype.card_perm`, `Nat.clog`, the count of subsets of given size, the
logarithmic form of Stirling's lower bound.

## Layer 3: selection

All rankings are admissible in this layer and outputs are items or pairs of items. The item of
rank `k` under `σ` is the `i` with `σ i = k`.

### 3.1 One rank, and the minimum

- `exists_pred_le_cost`: for every `k`, a tree whose output on every ranking is the item of rank
  `k` has cost at least `n − 1` on some ranking.
- `isComparisonComplexity_min`: for `n ≥ 1`, the comparison complexity of finding the item of
  rank `0` is `n − 1` (Erickson, Lecture 12, §12.6, and course notes 15-451, Claims 6.3 and 6.4,
  both for the largest item, the course notes for `n` a power of two).

Route: on a branch with fewer than `n − 1` nodes the pairs compared do not connect the items, so
some item `j` lies in another connected class than the output `i`. Moving the whole class of `j`
above or below all other items, keeping the order inside each class, changes no answer on the
branch and can be done so that the rank of `i` changes. The upper bound compares a running
smallest item with each remaining item. By reversal (1.1) the same holds for the largest item.

**Checks.**
- For `n = 1` a leaf solves the problem and `n − 1 = 0`. For `n = 0` there is no output and no
  tree, which is why the second statement assumes `n ≥ 1`; the first statement is then true for
  want of a tree.
- The counting bound of 1.3 gives only `⌈log₂ n⌉`, since there are `n` outputs: for `n = 4` it
  gives `2` while `3` comparisons are needed.
- For `n = 4` the complexity of finding the item of rank `1` is `4`, so `n − 1` is not the
  complexity for every rank.

*Needs:* 1.1, 1.2. (Proved here, except as cited.)

### 3.2 The minimum and the maximum together

- `isComparisonComplexity_min_max`: for `n ≥ 1`, the comparison complexity of finding a pair
  `(i, j)` with `i` of rank `0` and `j` of rank `n − 1` is `⌈3n/2⌉ − 2`, written
  `(3 * n + 1) / 2 - 2` with division of natural numbers (Erickson, Lecture 13, §13.7).

Route: for the upper bound compare `⌊n/2⌋` disjoint pairs, then find the smallest of the smaller
items and the largest of the larger ones, an unpaired item taking part in both. For the lower
bound an adversary keeps for every item whether it can still be the smallest and whether it can
still be the largest; `2n − 2` of these `2n` possibilities must be excluded, a comparison of two
items for which both possibilities are open excludes two, there are at most `⌊n/2⌋` such
comparisons, and the adversary can answer every other comparison so that at most one is excluded.

**Checks.**
- The values for `n = 1, …, 6` are `0, 1, 3, 4, 6, 7`. For `n = 1` the single item is both. For
  `n = 0` there is no pair of items and no tree.
- With `⌊3n/2⌋` in place of `⌈3n/2⌉` the value for `n = 3` would be `2`; three comparisons are
  needed.
- Finding the two separately costs `2n − 3`, which is `5` for `n = 4`, one more than `4`.

*Needs:* 1.1, 1.2. (Proved here, except as cited.)

### 3.3 The second smallest

- `isComparisonComplexity_second`: for `n ≥ 2`, the comparison complexity of finding the item of
  rank `1` is `n + ⌈log₂ n⌉ − 2` (stated without proof, for the second largest, as Erickson,
  Lecture 13, Exercise 5; the upper bound for `n` a power of two is course notes 15-451,
  Claim 6.7).

Route: for the upper bound run a knockout tournament for the smallest item in which no item
plays more than `⌈log₂ n⌉` times, with `n − 1` comparisons; the second smallest is among the at
most `⌈log₂ n⌉` items that lost to the winner, and its smallest is found with one comparison
fewer than their number. For the lower bound give every item the weight `1`; when two items that
have never been found larger are compared, the adversary declares the heavier one smaller and
adds the weight of the other to it, and answers every other comparison consistently. The item
of rank `0` ends with weight `n` and its weight at most doubles at each comparison, so at least
`⌈log₂ n⌉` items were found larger than it and than nothing else at that moment; all but one of
them must be found larger than some other item, which is `⌈log₂ n⌉ − 1` comparisons beside the
`n − 1` in which an item is found larger for the first time. The lower bound is attributed to
Kislitsyn (course notes 15-451, §6.4.3, the footnote to its last sentence). By reversal (1.1) the
second largest has the same complexity.

**Checks.**
- The values for `n = 2, …, 6` are `1, 3, 4, 6, 7`.
- For `n = 2` one comparison is needed. For `n = 1` no item has rank `1`, so no tree solves the
  problem and no number is its complexity; this is why the statement assumes `n ≥ 2`.
- Finding the smallest and then the smallest of the rest costs `2n − 3`, which is `5` for
  `n = 4`; the complexity is `4`.

*Needs:* 1.1, 1.2; Mathlib `Nat.clog`, `Nat.le_pow_clog`. (Proved here, except as cited.)

### Examples

For `n = 8`: the smallest item costs `7` comparisons, the smallest and the largest together
`10`, the second smallest `9`.

### Dependencies

Layer 1. Mathlib: `Nat.clog`.

## Layer 4: comparator networks

### 4.1 Networks, sorting and depth

Define `Network n` as the type of lists of pairs of elements of `Fin n`. For a pair `p` and
`x : Fin n → β` define `comparator p x`, the function with value `min (x p.1) (x p.2)` at `p.1`,
value `max (x p.1) (x p.2)` at `p.2` when `p.2 ≠ p.1`, and the value of `x` elsewhere. Define
`Network.apply c x` by applying the comparators of `c` in the order of the list, and
`Network.Sorts c β`: for every `x : Fin n → β` the output `Network.apply c x` is monotone. Define
`Network.wireDepth c`, a function `Fin n → ℕ`, by starting from `0` on every wire and letting each
comparator `(i, j)` in turn set the values at `i` and `j` to one more than the larger of the two,
and `Network.depth c`, the largest value of `Network.wireDepth c` (`0` when `n = 0`). Define
`Network.IsStandard c`: every comparator `(i, j)` of `c` has `i < j`. (Lang, *Sorting networks*,
the definitions of a comparator, a comparator stage and a sorting network.)

- The output of a concatenation `c ++ c'` on `x` is the output of `c'` on the output of `c`.
- For every `c` and `x` there is a permutation `π` of the wires with
  `Network.apply c x = x ∘ π`. If the output is monotone it equals `x ∘ Tuple.sort x`.
- A standard network leaves every monotone input unchanged.
- If `β` has two different elements, a network that sorts `β` sorts `Bool`. A network sorts every
  `β` with at most one element.
- The depth of `c` is the least `d` for which the positions of the list `c` can be numbered with
  stages `1, …, d` so that of two comparators that share a wire the earlier one in the list has
  the smaller stage.

**Checks.**
- The network `(0,1), (2,3), (0,2), (1,3), (1,2)` on four wires is standard, has depth `3`, and
  sorts `Bool`. On the input `(3, 1, 2, 0)` its output is `(0, 1, 2, 3)`.
- The comparator `(2, 0)` on three wires sends `(5, 6, 7)` to `(7, 6, 5)`: it is not standard and
  puts the smaller value on wire `2`.
- The network with the single comparator `(0, 2)` on three wires sends `(7, 6, 5)` to
  `(5, 6, 7)` and leaves `(0, 1, 0)` unchanged, so it sorts one input and is not a sorting
  network.
- On one wire the network `(0,0), (0,0)` changes nothing and has depth `2`; the empty network on
  `n` wires has depth `0` and sorts `Bool` exactly when `n ≤ 1`.

*Needs:* Mathlib `Tuple.sort`, `Tuple.monotone_sort`, `Tuple.unique_monotone`. (Proved here,
except as cited.)

### 4.2 The zero–one principle

- For monotone `f : β → γ` and every network `c`: `Network.apply c (f ∘ x) = f ∘ Network.apply c x`
  (Lang, *The 0-1-principle*, the second Lemma).
- `Network.sorts_of_sorts_bool`: a network that sorts `Bool` sorts every linear order `β` (Lang,
  *The 0-1-principle*, Theorem).

Route: a monotone map commutes with `min` and `max`, hence with every comparator. If the output
on `x` has `y k > y (k + 1)`, compose with the monotone map to `Bool` that is true exactly on the
values at least `y k`: the output on the composed input is not monotone.

**Checks.**
- The network `(0, 2)` on three wires fails on `(2, 0, 1)`, whose output is `(1, 0, 2)`; the
  threshold at the value `1` gives the input `(1, 0, 1)`, which the network leaves unchanged and
  which is not monotone.
- A map that is not monotone need not commute: for the comparator `(0, 1)`, the input `(0, 1)`
  and the map exchanging `0` and `1`, applying the map first gives the output `(0, 1)`, applying
  it last gives `(1, 0)`.

*Needs:* 4.1; Mathlib `Monotone.map_min`, `Monotone.map_max`.

### 4.3 Lower bounds for size and depth

- For every network `c` on `n` wires there is a comparison tree `t` on `n` items of depth
  `c.length` with outputs in the permutations of `Fin n` such that
  `Network.apply c σ = σ ∘ t.eval σ` for every ranking `σ`.
- `Network.clog_factorial_le_length`: a network on `n` wires that sorts `Bool` has at least
  `⌈log₂ n!⌉` comparators.
- `Network.clog_le_depth`: a network on `n` wires that sorts `Bool` has depth at least
  `⌈log₂ n⌉`.

Route: the tree follows the comparators in order, compares the two items that sit on the wires
of a comparator and records where each item sits. If the network sorts, then by 4.2 its output
on a ranking `σ` is monotone, so `σ ∘ t.eval σ` is the identity and the output of the tree
determines `σ`; apply 2.1 after composing the outputs with inversion. For the depth, the set of
input wires on which the value on a wire can depend has at most `2 ^ d` elements when the wire
has depth `d`, by induction along the list. The value on wire `0` of the output of a sorting
network is the smallest input value, which depends on every input wire: the input of ones gives
`1` and lowering any one wire to `0` gives `0`. (Proved here.)

**Checks.**
- For `n = 2` both bounds are `1` and the network `(0, 1)` attains them.
- For `n = 4` the bounds are `5` and `2`. The network of the first Check of 4.1 has `5`
  comparators and depth `3`, and no sorting network on four wires has depth `2`, so the depth
  bound is not attained.
- The hypothesis is on `Bool`, which by 4.1 is implied by sorting any linear order with two
  different elements, and the statements hold for networks that are not standard.

*Needs:* 1.1, 2.1, 4.1, 4.2; Mathlib `Nat.clog`, `Nat.clog_le_iff_le_pow`.

### 4.4 Standard form

- `Network.exists_isStandard_sorts`: for every network `c` on `n` wires that sorts `Bool` there
  is a standard network on `n` wires that sorts `Bool`, with at most as many comparators as `c`
  and depth at most the depth of `c`.

Route: delete the comparators `(i, i)`; this does not increase the depth. Then go through the
list from the front: at the first comparator `(i, j)` with `i > j`, replace it by `(j, i)` and
exchange the wires `i` and `j` in all comparators after it. Each step keeps the length. It keeps
the depth as well: immediately after the comparator the wires `i` and `j` have the same depth, so
exchanging them in the later comparators exchanges the final depths of these two wires and
changes no other, and the largest value is the same. (A step does not keep the pairs of
positions that share a wire.) The output of the new network is the
output of the old one with one fixed permutation `ρ` of the wires applied, the same for all
inputs. The final network is standard. On a strictly increasing input the old network, which
sorts it by 4.2, and the new one, which is standard, both return the input, so `ρ` is the
identity. (Proved here; compare Knuth, Volume 3, Section 5.3.4.)

**Checks.**
- The network `(1,0), (0,1)` on two wires sorts `Bool` and is not standard. The route turns it
  into `(0,1), (0,1)`, with the same length `2` and depth `2`.
- The network `(1, 0)` alone does not sort: it sends `(0, 1)` to `(1, 0)`. The statement says
  nothing about it.
- On one wire the network `(0, 0)` sorts and has one comparator; the only standard network on one
  wire is empty, so the number of comparators cannot be required to be equal.

*Needs:* 4.1, 4.2. (Proved here.)

### 4.5 Odd–even merge sort

For `k ≥ 1` the odd–even merge network on `2 ^ k` wires is the single comparator `(0, 1)` when
`k = 1`; for `k ≥ 2` it consists of the odd–even merge network on `2 ^ (k − 1)` wires placed on
the wires of even index, the same network placed on the wires of odd index, and then the
comparators `(i, i + 1)` for the odd `i` with `1 ≤ i ≤ 2 ^ k − 3`. The odd–even merge sorting
network on `2 ^ k` wires is empty for `k = 0`; for `k ≥ 1` it consists of the sorting network on
`2 ^ (k − 1)` wires placed on the first half of the wires, the same placed on the second half,
and then the odd–even merge network. (Lang, *Odd-even mergesort*; the construction is Batcher's.)

- The merge network on `2 ^ k` wires, `k ≥ 1`, is standard, has `(k − 1) · 2 ^ (k − 1) + 1`
  comparators and depth `k`, and sorts every input whose restrictions to the first half and to
  the second half of the wires are monotone (Lang, *Odd-even mergesort*, section Correctness for
  the sorting and section Analysis for the number of comparators; the depth is proved here).
- `Network.exists_isStandard_sorts_two_pow`: for every `k` there is a standard network `c` on
  `2 ^ k` wires that sorts `Bool`, with `(k * (k - 1) + 4) * 2 ^ k = 4 * (c.length + 1)` and
  `2 * c.depth = k * (k + 1)`; that is, with depth `k(k + 1)/2` and with
  `(k² − k + 4) · 2 ^ (k − 2) − 1` comparators for `k ≥ 2`, with `0` comparators for `k = 0` and
  `1` for `k = 1`. The sorting network above is such a network.

Route: by 4.2 take an input of zeros and ones with monotone halves. Its restrictions to the even
and to the odd wires have monotone halves again, and after the two recursive merges the number of
ones on the odd wires exceeds that on the even wires by `0`, `1` or `2`; the final comparators
repair the one place where the output can be out of order. The counts follow from the recursions
`S(k) = 2 S(k − 1) + (k − 1) · 2 ^ (k − 1) + 1` and `D(k) = D(k − 1) + k` with `S(0) = D(0) = 0`.

**Checks.**
- For `k = 0, …, 4` the sorting network has `0, 1, 5, 19, 63` comparators and depth
  `0, 1, 3, 6, 10`; for `k = 6, 8, 10` it has `543`, `3839` and `24063` comparators.
- For `k = 2` it is the network of the first Check of 4.1.
- For `k = 0` the truncated product `k * (k - 1)` is `0` and the first equation reads `4 = 4`;
  for `k = 1` it reads `8 = 8`. The equation is written without `2 ^ (k − 2)` because the truncated
  exponent would give `3` comparators for `k = 1`.
- For `k = 4` the lower bounds of 4.3 are `⌈log₂ 16!⌉ = 45` comparators and depth `4`.

*Needs:* 4.1, 4.2. (Proved here, except as cited.)

### Examples

The odd–even merge network on four wires is `(0,2), (1,3), (1,2)`: on the input `(0, 1, 0, 1)`,
whose halves are monotone, the output is `(0, 0, 1, 1)`.

### Dependencies

Layers 1 and 2 (4.3 uses 1.1 and 2.1). Mathlib: `Tuple.sort`, `Monotone.map_min`,
`Monotone.map_max`, `Nat.clog`.

## Layer 5: primitive networks and inversions

### 5.1 Exchanges and inversions

Define `Network.IsPrimitive c`: every comparator `(i, j)` of `c` has `j = i + 1`. Define
`Network.exchanges c x`, the number of comparators of `c` that, when the network runs on `x`, find
a strictly larger value on their first wire than on their second. The inversions of
`x : Fin n → β` are the pairs `a < b` of wires with `x b < x a`, the finite set
`Finset.univ.inversions x` of Tau Ceti.

- `Network.IsPrimitive.exchanges_add_card_inversions`: for a primitive network `c` and every
  `x : Fin n → β`, the number of exchanges of `c` on `x` plus the number of inversions of the
  output equals the number of inversions of `x`.
- `Network.IsPrimitive.choose_two_le_length`: a primitive network on `n` wires that sorts `Bool`
  has at least `C(n, 2)` comparators.

Route: a comparator `(i, i + 1)` that exchanges removes the inversion `(i, i + 1)` and maps the
other inversions bijectively, since the two values keep their order relative to every other wire;
a comparator that does not exchange changes nothing. For the bound, a monotone output has no
inversion, the decreasing input `n − 1, …, 0` has `C(n, 2)`, the network sorts it by 4.2, and the
number of exchanges is at most the length. (Proved here.)

**Checks.**
- The comparator `(0, 2)`, which is not primitive, sends `(2, 1, 0)` to `(0, 1, 2)`: one exchange
  removes three inversions.
- On the input `(1, 1)` the comparator `(0, 1)` does not exchange, and the input has no
  inversion: ties are neither inversions nor exchanges.
- The statement holds for inputs with repeated values: on `(1, 0, 0)` the primitive network
  `(0,1), (1,2)` makes two exchanges and the input has two inversions.
- The bound needs the network to be primitive: the network of the first Check of 4.1 sorts on
  four wires with `5` comparators, fewer than `C(4, 2) = 6`.

*Needs:* 4.1, 4.2; Tau Ceti `Finset.inversions`, `Finset.mem_inversions`,
`Finset.inversions_eq_empty_of_monotone`.

### 5.2 The decreasing input

- `Network.IsPrimitive.sorts_iff_monotone_apply_revPerm`: a primitive network `c` on `n` wires
  sorts `Bool` if and only if its output on the decreasing input `i ↦ n − 1 − i`, the function
  underlying `Fin.revPerm`, is monotone.

Route: one direction is 4.2. For the other, compare inputs of zeros and ones with the same number
of ones by the numbers of ones among the first `j` wires, for every `j`. A comparator
`(i, i + 1)` changes only the count for `j = i + 1`, to the larger of the count for `j = i` and
the count for `j = i + 2` less one, so it preserves this order between inputs. The inputs with
all ones first are the largest, and they are the images of the decreasing input under the
threshold maps, which commute with the network by 4.2; the monotone inputs are the smallest. If
the network sends the largest input to the smallest, it sends every input with that number of
ones to the smallest. (Proved here; the criterion is attributed to de Bruijn.)

**Checks.**
- The hypothesis is needed: the network `(0, 2)` on three wires sorts the decreasing input
  `(2, 1, 0)` and leaves `(0, 1, 0)` unchanged.
- For `n ≤ 1` both sides hold for every network.
- On three wires the primitive network `(0,1), (1,2)` sends `(2, 1, 0)` to `(1, 0, 2)` and fails
  on the input `(1, 1, 0)` of zeros and ones, whose output is `(1, 0, 1)`.

*Needs:* 4.1, 4.2; Mathlib `Fin.revPerm`, `Fin.revPerm_apply`. (Proved here.)

### 5.3 Odd–even transposition

Define `transpositionRound n r`, the list of the comparators `(i, i + 1)` with `i + 1 < n` and
`i` of the parity of `r`, in increasing order of `i`, and `oddEvenTransposition n`, the
concatenation of the rounds `r = 0, 1, …, n − 1`.

- `oddEvenTransposition_sorts`: the network `oddEvenTransposition n` sorts every linear order
  (Lang, *Odd-even transposition sort*, Proposition, for inputs of zeros and ones; the page does
  not say which parity comes first).
- `oddEvenTransposition_isPrimitive_and_length`: the network `oddEvenTransposition n` is
  primitive and has exactly `C(n, 2)` comparators, so the bound of 5.1 is attained for every `n`.
- It is standard, and its depth is `n` for `n ≥ 3`, `1` for `n = 2` and `0` for `n ≤ 1`.

Route: by 4.2 it is enough to treat inputs of zeros and ones, and for these one argues by
induction on `n`, separating a one from a zero on the last wire. A one there never moves, and
the other wires carry the network on `n − 1` wires followed by one more round. A zero there is
exchanged at every comparator it meets and so reaches wire `0`, and the comparators it does not
meet act on the other values as the network on `n − 1` wires does (Lang, *Odd-even
transposition sort*, Cases 1 and 2 of the proof of the Proposition). By 5.2 it is also enough to
follow the decreasing input. For the count, the `⌈n/2⌉` rounds of even `r` have `⌊n/2⌋`
comparators each and the `⌊n/2⌋` rounds of odd `r` have `⌊(n − 1)/2⌋` each.

**Checks.**
- For `n = 4` the network is `(0,1), (2,3), (1,2), (0,1), (2,3), (1,2)`, with `6 = C(4, 2)`
  comparators and depth `4`; on `(3, 2, 1, 0)` every comparator exchanges.
- The number of rounds matters: for `n = 3` the first two rounds are `(0,1), (1,2)`, which fail on
  `(1, 1, 0)` by the last Check of 5.2.
- For `n = 0` and `n = 1` the network is empty.

*Needs:* 4.1, 4.2, 5.1, 5.2. (Proved here, except as cited.)

### Examples

On five wires the odd–even transposition network has `10` comparators in five rounds of two; on
the decreasing input `(4, 3, 2, 1, 0)` all ten exchange, in agreement with 5.1.

### Dependencies

Layer 4. Tau Ceti: inversions of a map on a finite set. Mathlib: `Fin.revPerm`.

## Scope and ownership

This roadmap owns the definitions and theorems stated above: comparison trees with their cost
and depth, the comparison complexity of a problem, the counting bounds, the bounds for sorting
and merging, the complexity of finding the minimum, the minimum and maximum, and the second
smallest; comparator networks with their depth, the zero–one principle, the lower bounds for
size and depth, the standard form, the odd–even merge sorting network, and the theory of
primitive networks.

Already in the libraries and therefore not targets:

- Kraft's inequality for prefix-free sets of words
  (`InformationTheory.IsPrefixFree.finsetSum_one_div_card_pow_length_le_one`); 1.3 above applies
  it to the branches of a tree.
- The lower bound `n log n − n + (log n)/2 + log(2π)/2 ≤ log n!` for `n ≠ 0`
  (`Stirling.le_log_factorial_stirling`), from which the last bullet of 2.1 above follows.
- A permutation that sorts a tuple and the uniqueness of the sorted rearrangement
  (`Tuple.sort`, `Tuple.monotone_sort`, `Tuple.unique_monotone`).
- Inversions of a map on a finite linearly ordered set (`Finset.inversions`).
- The symmetric group on `Fin n` as a Coxeter group whose simple reflections are the adjacent
  transpositions (`TauCeti.permCoxeterSystem`, `TauCeti.permCoxeterSystem_simple`), and the
  identity between the Coxeter length of a permutation, which is the least number of adjacent
  transpositions with that product, and its number of inversions
  (`TauCeti.permCoxeterSystem_length_eq_card_inversion`). Statement 5.1 above is about the
  exchanges of a network on an arbitrary input, with ties, and does not restate that identity.

Left to other roadmaps: ComputabilityTheory treats computable functions, oracles and degrees;
nothing above refers to a machine or to computability.

Outside the scope: implementations, data structures and running times; randomized comparison
trees; the comparison complexity of sorting more than five items and of merging sequences of
unequal lengths beyond the statements above; selection of other ranks, the median in particular;
partial orders as inputs and the counting of linear extensions; bitonic sorters, Shell's networks
and the networks of Ajtai, Komlós and Szemerédi; optimal networks for particular numbers of
wires; and decision trees for Boolean functions.

## Exact supplier contracts

### From Mathlib

- `Mathlib/Logic/Equiv/Defs.lean`: `Equiv.Perm α`, the type of bijections of `α` with itself; a
  ranking is an element of `Equiv.Perm (Fin n)`.
- `Mathlib/Data/Nat/Log.lean`: `Nat.clog b n`, the least `k` with `n ≤ b ^ k` for `1 < b`, equal
  to `0` for `n ≤ 1`; `Nat.clog_le_iff_le_pow` (for `1 < b`: `Nat.clog b x ≤ y ↔ x ≤ b ^ y`);
  `Nat.lt_clog_iff_pow_lt` (for `1 < b`: `y < Nat.clog b x ↔ b ^ y < x`); `Nat.le_pow_clog` (for
  `1 < b`: `x ≤ b ^ Nat.clog b x`).
- `Mathlib/Analysis/SpecialFunctions/Log/Base.lean`: `Real.logb b x`, the quotient
  `Real.log x / Real.log b`.
- `Mathlib/InformationTheory/Coding/PrefixFree.lean`: `InformationTheory.IsPrefixFree S`, for a
  set `S` of lists: an element of `S` that is a prefix of an element of `S` is equal to it.
  `Mathlib/InformationTheory/Coding/Kraft.lean`:
  `InformationTheory.IsPrefixFree.finsetSum_one_div_card_pow_length_le_one` (for a finite nonempty
  alphabet `α` and a finite prefix-free set `S` of lists over `α`, the sum over `w ∈ S` of
  `(1 / card α) ^ w.length` is at most `1`).
- `Mathlib/Analysis/Convex/Jensen.lean`: `ConcaveOn.le_map_sum` (for a concave function on a
  convex set, weights that are nonnegative and sum to `1` and points in the set, the weighted sum
  of the values is at most the value at the weighted sum).
  `Mathlib/Analysis/Convex/SpecificFunctions/Basic.lean`: `strictConcaveOn_log_Ioi` (the real
  logarithm is strictly concave on the positive reals).
- `Mathlib/Analysis/SpecialFunctions/Stirling.lean`: `Stirling.le_log_factorial_stirling` (for
  `n ≠ 0`: `n * log n - n + log n / 2 + log (2 * π) / 2 ≤ log n !`).
- `Mathlib/Data/Fintype/Perm.lean`: `Fintype.card_perm` (the number of permutations of a finite
  type `α` is the factorial of its cardinality). `Mathlib/Data/Finset/Powerset.lean`:
  `Finset.card_powersetCard` (a finite set with `a` elements has `Nat.choose a b` subsets with `b`
  elements).
- `Mathlib/Order/MinMax.lean`: `Monotone.map_min` and `Monotone.map_max` (a monotone map between
  linear orders commutes with `min` and with `max`).
- `Mathlib/Data/Fin/Tuple/Sort.lean`: `Tuple.sort f`, a permutation of `Fin n` for
  `f : Fin n → α` with `α` a linear order; `Tuple.monotone_sort` (`f ∘ Tuple.sort f` is monotone);
  `Tuple.unique_monotone` (for a partial order, if `f ∘ σ` and `f ∘ τ` are both monotone they are
  equal).
- `Mathlib/Data/Fin/Rev.lean`: `Fin.revPerm`, the permutation `i ↦ n − 1 − i` of `Fin n`, with
  `Fin.revPerm_apply` (`Fin.revPerm i = i.rev`).

### From Tau Ceti

- `TauCeti/Data/Finset/Inversions.lean`: `Finset.inversions f s`, for `f : α → β` between linear
  orders and a finite set `s` of `α`, the finite set of pairs `(a, b)` of elements of `s` with
  `a < b` and `f b < f a`; `Finset.mem_inversions` (membership unfolds to that description);
  `Finset.inversions_eq_empty_of_monotone` (a monotone map has no inversions on any `s`).

## References

- Jeff Erickson, *Algorithms*, lecture notes, Lecture 12, "Lower Bounds", and Lecture 13,
  "Adversary Arguments", the revision marked Fall 2013; freely available from the author's site,
  `jeffe.cs.illinois.edu/teaching/algorithms`, as the files `notes/12-lowerbounds.pdf` and
  `notes/13-adversary.pdf`.
- Lecture notes of the course 15-451, *Algorithms*, Carnegie Mellon University, Fall 2011
  (instructors Avrim Blum and Manuel Blum; the notes name no author), Lecture 5,
  "Comparison-based Lower Bounds for Sorting", and Lecture 6, "Concrete models and tight
  upper/lower bounds"; freely available from the course page of Avrim Blum at
  `www.cs.cmu.edu/~avrim/451f11/lectures`. Cited above as course notes 15-451. Lecture 6 assumes
  from its §6.4.1 on that `n` is a power of two.
- Hans Werner Lang, web pages *Sorting networks*, *The 0-1-principle*, *Odd-even transposition
  sort* and *Odd-even mergesort*, versions updated in February 2023; freely available at
  `hwlang.de/algorithmen/sortieren/networks`.
- Donald E. Knuth, *The Art of Computer Programming*, Volume 3, *Sorting and Searching*, second
  edition, Addison-Wesley, 1998, Section 5.3.
- Kenneth E. Batcher, *Sorting networks and their applications*, Proceedings of the AFIPS Spring
  Joint Computer Conference 32 (1968), 307–314.
- Nicolaas G. de Bruijn, *Sorting by means of swappings*, Discrete Mathematics 9 (1974), 333–339.
- Lester R. Ford and Selmer M. Johnson, *A tournament problem*, American Mathematical Monthly 66
  (1959), 387–389.
- Sergey S. Kislitsyn, *On the selection of the k-th element of an ordered set by pairwise
  comparisons*, Sibirskii Matematicheskii Zhurnal 5 (1964), 557–564.
