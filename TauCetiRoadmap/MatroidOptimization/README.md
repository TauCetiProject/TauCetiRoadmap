# Roadmap: matroid optimization and submodular functions

**Summary.** This roadmap develops the theorems behind optimization over matroids and over
submodular set functions: bases of maximum weight and the greedy theorem with its converse, the
min–max theorems for the intersection and the union of matroids, the Lovász extension and the
base polytope of a submodular function, and the bound for greedy maximization of a monotone
submodular function. Every target is a statement about sets, weights and set functions; no
procedure, data structure or running time is specified. Matroids are those of Mathlib, whose
ground set may be infinite; each statement carries the finiteness it needs. Weights take values
in a linearly ordered commutative monoid, cancellative where a statement characterizes every base
of maximum weight. Set functions are real-valued.

The headline theorems are these.

- *The greedy theorem and its converse.* In any matroid, with weights in a linearly ordered
  commutative monoid, a set built from the empty set by repeatedly adding a heaviest element that
  keeps the set independent has the greatest weight among the independent sets with the same
  number of elements. Conversely, a family of subsets of a finite set that contains the empty set
  and is closed under taking subsets is the family of independent sets of a matroid if and only
  if, for every weight with values in the natural numbers, every maximal member built in this way
  has the greatest weight among all members.
- *Matroid intersection.* For two matroids on one type, the first with finite ground set, there
  are a set `I` independent in both and a set `A` with `|I| = r₁(A) + r₂(Aᶜ)`; no common
  independent set is larger than such a sum, for any `A`.
- *The Lovász extension.* A real-valued function on the subsets of a finite set is submodular if
  and only if its Lovász extension is convex. If it is submodular and vanishes at the empty set,
  the Lovász extension at `w` is the greatest value of `x ↦ ∑ w i * x i` on the base polytope.
- *Greedy maximization.* Let `f` be a monotone submodular function and let `S₀ = ∅, S₁, …, S_l`
  be built by adding at each step an element whose addition gives the greatest value of `f`. Then
  `f(T) − f(S_l) ≤ (1 − 1/k)^l (f(T) − f(∅))` for every `k ≥ 1` and every set `T` with at most `k`
  elements; for `l = k` the factor is at most `1/e`.

The roadmap builds on Mathlib's matroids, with their bases, circuits, rank, duality, minors and
sums, and on Tau Ceti's submodular functions on lattices. GraphConnectivityAndFlows develops
those functions as far as the lattice of minimizers and the cut functions of networks, and proves
capacitated forms of Kőnig's and Hall's theorems; here Hall's theorem reappears as the case of
the free matroid in Rado's theorem, and Kőnig's theorem is not restated. The base polytope is,
after a change of sign, the core of a convex cooperative game; its extreme points are not treated
here.

## How to read the build

Layer 1 below treats bases of maximum weight: the symmetric exchange property, three optimality
criteria and uniqueness. Layer 2 depends on Layer 1 and proves the greedy theorem and its
converse. Layer 3 depends on no other layer: the characterization of rank functions, the
intersection theorem, the union theorem with the packing and covering of bases, and Rado's
theorem on independent transversals. Layer 4 treats submodular set functions: examples, the Lovász
extension, the base polytope, Lovász's theorem and the two minimization theorems; only its last
section, which computes the weight of an optimal base as a Lovász extension, uses Layer 1.
Layer 5, the bound for greedy maximization, depends on no other layer. Within a layer the
sections are in build order.

## Conventions

- **Matroids.** A matroid is a Mathlib `Matroid α`: a ground set `M.E : Set α`, independent sets
  `M.Indep`, bases `M.IsBase`. A basis of a set `X ⊆ M.E` is a maximal independent subset of `X`
  (`M.IsBasis I X`). The rank of a set is `M.eRk X : ℕ∞`, written `r(X)`; it is the rank of
  `X ∩ M.E`, so sets need not lie in the ground set. `M.eRank` is the rank of the ground set.
  For bases, `B − e + f` means `insert f (B \ {e})`.
- **Finiteness.** `[M.Finite]` says that the ground set is finite, `[M.RankFinite]` that the
  bases are finite. A statement assumes neither unless it says so.
- **Weights.** A weight is a total function `w : α → R`; only its values on the ground set enter
  any statement. Statements that say a set has greatest weight assume
  `[AddCommMonoid R] [LinearOrder R] [IsOrderedAddMonoid R]`. Statements that characterize the
  bases of maximum weight also assume cancellation:
  `[AddCommMonoid R] [LinearOrder R] [IsOrderedCancelAddMonoid R]`. The integers, the rationals,
  the reals and the natural numbers are instances of both. Weights may be negative. Reversing the
  order of `R` turns every statement about maximum weight with weights in a general `R` into one
  about minimum weight.
- **Sums of weights.** The weight of a set is a `finsum` over the set. It is used for finite
  sets; on an infinite set whose weights have infinite support the `finsum` is `0` and says
  nothing. So the statements about bases of maximum weight assume `[M.RankFinite]` or a finite
  ground set, and the greedy theorem of 2.1 compares finite sets.
- **Set functions.** A set function is `f : Finset α → ℝ`, or `Finset α → ℕ` for rank functions,
  with `[DecidableEq α]` so that `Finset α` is a lattice. Submodular means
  `TauCeti.IsSubmodular f`: `f (S ∪ T) + f (S ∩ T) ≤ f S + f T` for all `S`, `T`. Monotone means
  Mathlib's `Monotone f`. No normalization is built in: `f ∅ = 0` is a hypothesis where it is
  needed. For a vector `x : α → ℝ` and a finite set `S`, `x(S)` is `∑ i ∈ S, x i`.
- **Optima.** Greatest and least values are stated with `IsGreatest` and `IsLeast`, or by an
  explicit witness with the opposite inequality for all competitors; no supremum or infimum of a
  set of numbers is taken.
- **Names of methods.** "Greedy" refers to a relation between sets and weights defined in 2.1 and
  to sequences of sets in 5.2. The names of Kruskal, Edmonds and others are used only to say which
  theorem underlies which classical method.

## Layer 1: weighted bases and exchange

### 1.1 Weight and bases of maximum weight

Define `weight w X` as the `finsum` of `w` over `X`, and `IsMaxWeightBase w M B`: `B` is a base of
`M` and `weight w B' ≤ weight w B` for every base `B'` of `M`.

- For a finite set `X` and `e ∉ X`: `weight w (insert e X) = w e + weight w X`.
- If `M` has finite ground set and `R` is a linearly ordered commutative monoid, `M` has a base
  of maximum weight.

**Checks.**
- On `{a, b, c}`, let the bases be the three sets with two elements, and let the weights be
  `3, 2, 1`. The bases weigh `5`, `4` and `3`, and `{a, b}` is the only base of maximum weight.
- On `{a, b}` with bases `{a}` and `{b}` and weights `−1, −2`, the base of maximum weight is
  `{a}`, of weight `−1`. The empty set is independent and weighs `0`: a definition that maximizes
  over independent sets would name a different set.
- A matroid all of whose elements are loops, the matroid on the empty type among them, has the
  single base `∅`, of weight `0`.
- On `ℕ` with the one-element sets as bases and `w n = n`, the bases are finite and there is no
  base of maximum weight: the existence statement needs a finite ground set.

*Needs:* Mathlib `Matroid.IsBase`, `Matroid.exists_isBase`, `Matroid.Finite`,
`finsum_mem_insert`, `Set.Finite.finite_subsets`, `Set.exists_max_image`. (Proved here.)

### 1.2 Symmetric exchange

Prove `exists_symm_exchange`: if `B` and `B'` are bases of a matroid and `e ∈ B \ B'`, there is
`f ∈ B' \ B` such that `B − e + f` and `B' − f + e` are both bases. No finiteness is assumed. The
property is due to Brualdi.

Route: `e` is not in `B'`, so `e` together with part of `B'` forms the fundamental circuit `C`
of `e` in `B'`. Let `K` be the fundamental cocircuit of `e` in `B`; it meets `B` in `e` alone. A
circuit and a cocircuit never meet in exactly one element, and `e ∈ C ∩ K`, so there is
`f ≠ e` in `C ∩ K`. Then `f ∈ B'` and `f ∉ B`. Since `f` lies on the fundamental circuit of `e`
in `B'`, the set `B' − f + e` is a base; since `f` lies in the fundamental cocircuit of `e` in
`B`, the element `e` lies on the fundamental circuit of `f` in `B`, and `B − e + f` is a base.
In both cases the set obtained from a base by adding an element outside it and removing an
element of the fundamental circuit so formed is independent, and an independent set of that form
is a base.

**Checks.**
- The element `f` cannot be chosen freely among those for which `B − e + f` is a base. On
  `{0, 1, 2, 3}` let the bases be all sets with two elements except `{0, 1}`. For `B = {0, 2}`,
  `B' = {1, 3}` and `e = 0`, the set `B − 0 + 3 = {2, 3}` is a base but `B' − 3 + 0 = {0, 1}` is
  not. The element `f = 1` serves both: `{1, 2}` and `{0, 3}` are bases.
- When `B \ B'` has one element `e`, `B' \ B` has one element `f`, and the two exchanged sets are
  `B'` and `B`.

*Needs:* Mathlib `Matroid.fundCircuit`, `Matroid.IsBase.fundCircuit_isCircuit`,
`Matroid.fundCircuit_subset_insert`, `Matroid.fundCocircuit`, `Matroid.fundCocircuit_isCocircuit`,
`Matroid.fundCocircuit_inter_eq`, `Matroid.IsCircuit.inter_isCocircuit_ne_singleton`,
`Matroid.IsBase.mem_fundCocircuit_iff_mem_fundCircuit`, `Matroid.Indep.mem_fundCircuit_iff`,
`Matroid.IsBase.closure_eq`, `Matroid.IsBase.exchange_isBase_of_indep`. (Proved here.)

### 1.3 Optimality criteria

Let `M` be a matroid of finite rank and let the weights lie in a linearly ordered cancellative
commutative monoid. For a base `B` the following are equivalent.

1. `B` is a base of maximum weight.
2. *Exchange.* Whenever `e ∉ B`, `f ∈ B` and `B − f + e` is a base, `w e ≤ w f`
   (`isMaxWeightBase_iff_forall_exchange`).
3. *Thresholds.* For every `t : R`, the set `B ∩ {e | t ≤ w e}` is a basis of
   `M.E ∩ {e | t ≤ w e}` (`isMaxWeightBase_iff_forall_isBasis`).
4. *Domination.* For every base `B'` there is a bijection `φ` from `B'` onto `B` with
   `w e ≤ w (φ e)` for all `e ∈ B'` (`isMaxWeightBase_iff_forall_exists_bijOn`).

- For weights in a linearly ordered commutative monoid without cancellation, each of 2, 3 and 4
  still implies 1.

Route: 4 implies 1 by summing. If 1 holds and 2 fails for `e` and `f`, the base `B − f + e` is
strictly heavier, by cancellation. If 2 holds and `B'` is any base, argue by induction on the
number of elements of `B' \ B`: for `e` in it, 1.2 gives `f ∈ B \ B'` with `B' − e + f` and
`B − f + e` both bases; then `w e ≤ w f`, so `B' − e + f` weighs at least as much as `B'` and has
one more element in `B`. If 2 holds and 3 fails at `t`, some `e ∉ B` of weight at least `t` can be
added to `B ∩ {e | t ≤ w e}` keeping independence; its fundamental circuit in `B` is dependent, so
it contains an element `f` of `B` of weight below `t`, and exchanging contradicts 2. If 3 holds,
then for every base `B'` and every `t` the set `B'` has at most as many elements of weight at
least `t` as `B`, and matching the elements of the two bases in order of decreasing weight gives
4.

**Checks.**
- In the first example of 1.1, with weights `3, 2, 1`, the base `{a, c}` fails all three criteria:
  exchanging `c` for `b` gives the base `{a, b}` and `w b = 2 > 1 = w c`; at `t = 2` the set
  `{a}` is not a basis of `{a, b}`; and no bijection from `{a, b}` onto `{a, c}` sends both `a`
  and `b` to elements at least as heavy, since only `a` weighs at least `2`.
- With all weights equal every base satisfies 2, 3 and 4.
- For `t` above every weight, both sets in 3 are empty; for `t` below every weight, 3 says that
  `B` is a basis of the ground set.
- Cancellation is needed for 1 to imply the others. Take weights in `WithTop ℕ`, where
  `⊤ + a = ⊤`, on the same matroid with weights `1, 2, ⊤`. The bases `{a, c}` and `{b, c}` both
  weigh `⊤` and are of maximum weight, but `{a, c}` fails 2: exchanging `a` for `b` gives a base
  and `w b = 2 > 1 = w a`. It also fails 3 at `t = 2`, where `{c}` is not a basis of `{b, c}`.

*Needs:* 1.1, 1.2; Mathlib `Matroid.RankFinite`, `Matroid.IsBase.finite`, `Matroid.IsBasis`,
`Matroid.fundCircuit_subset_insert`, `Matroid.Indep.mem_fundCircuit_iff`,
`Matroid.IsBase.closure_eq`, `Matroid.IsBase.exchange_isBase_of_indep`,
`Matroid.IsBasis.encard_eq_eRk`, `finsum_mem_insert`. (Proved here.)

### 1.4 Uniqueness and the weights of an optimal base

Let `M` be a matroid of finite rank with weights in a linearly ordered cancellative commutative
monoid.

- `IsMaxWeightBase.eq_of_injOn`: if `w` is injective on the ground set, any two bases of maximum
  weight are equal.
- Two bases of maximum weight have, for every `r : R`, the same number of elements of weight `r`.

Route: for two bases `B`, `B'` of maximum weight and `e ∈ B \ B'`, 1.2 gives `f ∈ B' \ B` with
both exchanged sets bases; maximality of `B` and of `B'` gives `w f ≤ w e` and `w e ≤ w f`, which
injectivity forbids. The second statement follows from criterion 3 of 1.3: for every `t` the two
bases have the same number of elements of weight at least `t`, namely the rank of
`M.E ∩ {e | t ≤ w e}`.

**Checks.**
- In the first example of 1.1 with weights `1, 2, 2` the only base of maximum weight is `{b, c}`,
  although the weights are not distinct: injectivity is sufficient and not necessary.
- With weights `1, 1, 1` all three bases are of maximum weight, and each has two elements of
  weight `1`.
- Injectivity is asked on the ground set only: elements outside it may share a weight.

*Needs:* 1.2, 1.3. (Proved here.)

### Examples

The matroid on four elements whose bases are the two-element sets other than one fixed pair: its
five bases, one symmetric exchange, and its bases of maximum weight for a weight with a tie.

### Dependencies

Mathlib `Matroid.IsBase`, `Matroid.exists_isBase`, `Matroid.Finite`, `Matroid.RankFinite`,
`Matroid.IsBase.finite`, `Matroid.IsBasis`, `Matroid.IsBasis.encard_eq_eRk`,
`Matroid.fundCircuit`, `Matroid.IsBase.fundCircuit_isCircuit`, `Matroid.fundCircuit_subset_insert`,
`Matroid.fundCocircuit`, `Matroid.fundCocircuit_isCocircuit`, `Matroid.fundCocircuit_inter_eq`,
`Matroid.IsCircuit.inter_isCocircuit_ne_singleton`,
`Matroid.IsBase.mem_fundCocircuit_iff_mem_fundCircuit`, `Matroid.Indep.mem_fundCircuit_iff`,
`Matroid.IsBase.closure_eq`, `Matroid.IsBase.exchange_isBase_of_indep`, `finsum_mem_insert`,
`Set.Finite.finite_subsets`, `Set.exists_max_image`. No other layer.

## Layer 2: the greedy theorem and its converse

### 2.1 Greedily built sets

For a property `P` of sets and a weight `w : α → R`, define the relation `Greedy P w I`
inductively.

- The empty set: `Greedy P w ∅`.
- *Step.* From `Greedy P w I`, an element `e ∉ I` with `P (insert e I)`, and `w e' ≤ w e` for
  every `e' ∉ I` with `P (insert e' I)`: `Greedy P w (insert e I)`.

A set `I` with `Greedy M.Indep w I` is called greedily built in `M`. The relation is stated for an
arbitrary property because 2.2 applies it to families of sets that are not matroids. Prove, for
weights in a linearly ordered commutative monoid:

- `Greedy.weight_le`: in any matroid `M`, if `I` is greedily built, `J` is independent and
  `J.encard = I.encard`, then `weight w J ≤ weight w I` (Goemans, matroid optimization notes,
  Theorem 4.2, p. 5, for finite matroids and real weights). No finiteness is assumed; a greedily
  built set is finite.
- Hence a greedily built base is a base of maximum weight (Oxley, Lemma 4.7, p. 23, for positive
  real weights), and, when moreover `0 ≤ w e` for all `e ∈ M.E`, it has the greatest weight among
  all independent sets.
- `Greedy.exists_isMaxWeightBase_superset`: if `M` has finite ground set, every greedily built
  set is contained in a base of maximum weight (the induction in the proof of Schrijver,
  Theorem 10.1, p. 175, there for nonnegative real weights).
- If `M` has finite ground set, a greedily built set that is not a base admits a step, so
  greedily built bases exist.

Route for the first statement: the elements of `I` in the order in which they were added,
`e₁, …, e_k`, have nonincreasing weights, because `e_(i+1)` was already a candidate when `e_i` was
chosen. List `J` as `j₁, …, j_k` with nonincreasing weights. If `w j_p > w e_p` for some `p`, take
the least one; the independent set `{j₁, …, j_p}` is larger than `{e₁, …, e_(p−1)}`, so one of its
elements `j_i` can be added to the latter keeping independence, and `w j_i ≥ w j_p > w e_p`
contradicts the choice of `e_p`. So `w j_p ≤ w e_p` for all `p`; sum. For the third statement, if
the greedily built set `I` lies in a base `B` of maximum weight and a step adds `e ∉ B`, there is
`e' ∈ B \ I` with `B − e' + e` a base containing `insert e I`; `e'` was a candidate, so
`w e' ≤ w e` and the new base is of maximum weight.

**Checks.**
- First example of 1.1 with weights `3, 2, 1`: the greedily built sets are `∅`, `{a}` and
  `{a, b}`. With weights `1, 1, 1` every independent set is greedily built.
- Negative weights do not stop the construction. In the free matroid on `{a, b}` with weights
  `1, −5` the greedily built sets are `∅`, `{a}` and `{a, b}`. The base `{a, b}` weighs `−4` and
  is the base of maximum weight, while the independent set of greatest weight is `{a}`; the
  comparison in the first statement is between sets with the same number of elements.
- The candidates of a step are the elements that keep `P`, not all elements outside `I`. On
  `{a, b}` with `b` a loop, `{a}` the only base, and weights `w a = 1`, `w b = 5`, the set `{a}`
  is greedily built; a rule comparing `a` with every element outside `∅` would never add it.

*Needs:* 1.1; Mathlib `Matroid.Indep.subset`, `Matroid.Indep.exists_insert_of_encard_lt`,
`Matroid.Indep.exists_isBase_superset`, `Matroid.IsBase.exchange_isBase_of_indep`,
`Matroid.IsBase.encard_eq_encard_of_isBase`, `finsum_mem_insert`. (Proved here, except as cited.)

### 2.2 The converse of the greedy theorem

Prove `exists_matroid_indep_iff_greedy`: let `α` be a finite type and `P` a property of subsets of
`α` with `P ∅` and such that `P J` and `I ⊆ J` imply `P I`. Then there is a matroid `M` on `α`
with `M.Indep I ↔ P I` for all `I` if and only if, for every `w : α → ℕ` and every `I` with
`Greedy P w I` that is maximal for `P`, every `J` with `P J` has `weight w J ≤ weight w I`
(Schrijver, Theorem 10.1, p. 174, with nonnegative real weights; Oxley, Theorem 4.8, p. 23, with
positive real weights). The theorem is due to Rado and to Edmonds.

- If no such matroid exists, a weight with values in `{0, 1}` already violates the condition.
- If such a matroid exists, the conclusion holds for every weight with `0 ≤ w e` on the ground
  set and values in any linearly ordered commutative monoid, by 2.1. Quantifying over weights in
  `ℕ` asks the least of a family that is to be shown a matroid.

Route: if `P` is `M.Indep`, a maximal greedily built `I` is a base and 2.1 applies, the weights
being nonnegative. Conversely, if `P` is not the independence predicate of a matroid there are a
set `A` and two members `I`, `J` of the family, maximal among the members contained in `A`, with
`I` smaller than `J`. Let `w` be `1` on `A` and `0` elsewhere. The elements of `I` can be added
one by one by steps, each being a candidate of weight `1`; after that no element of `A` is a
candidate, and further steps reach a maximal member whose elements in `A` are those of `I`. Its
weight is the number of elements of `I`, less than the weight of `J`.

**Checks.**
- On `{a, b, c}` let `P` hold for `∅`, the three one-element sets and `{a, b}`. This is no
  matroid: `{c}` is maximal and smaller than `{a, b}`. With all weights `1` the set `{c}` is
  greedily built and maximal, and weighs `1 < 2`.
- `P ∅` is needed: if `P` holds for no set, no matroid exists, while the condition on weights
  holds because no set is maximal for `P`.
- Closure under subsets is needed: on `{a, b}` let `P` hold for `∅` and `{a, b}` only. No matroid
  exists; the only greedily built set is `∅`, which is not maximal, so the condition holds.
- Finiteness is needed: if `P` holds exactly for the finite subsets of an infinite type, no set is
  maximal and the condition holds, but there is no matroid, since a base would be a maximal
  finite set.
- Maximality of `I` is needed in the condition: in the free matroid on `{a, b}` with weights
  `1, 1`, the greedily built set `{a}` weighs less than `{a, b}`.

*Needs:* 2.1; Mathlib `IndepMatroid.ofFinite`, `IndepMatroid.ofFinite_indep`,
`Matroid.Indep.exists_insert_of_encard_lt`. (Proved here, except as cited.)

### Examples

The family on `{p, q, r, s}` whose members are `∅`, the four one-element sets, `{p, s}` and
`{q, r}`: its maximal members, the weight that is `1` on `{p, q, r}` and `0` at `s`, the greedily
built sets for that weight, and the maximal one among them that weighs `1 < 2`.

### Dependencies

Layer 1 (1.1). Mathlib `Matroid.Indep.subset`, `Matroid.Indep.exists_insert_of_encard_lt`,
`Matroid.Indep.exists_isBase_superset`, `Matroid.IsBase.exchange_isBase_of_indep`,
`Matroid.IsBase.encard_eq_encard_of_isBase`, `IndepMatroid.ofFinite`,
`IndepMatroid.ofFinite_indep`, `finsum_mem_insert`.

## Layer 3: rank functions, intersection and union

### 3.1 The characterization of rank functions

Prove `exists_matroid_eRk_eq_iff`: for `r : Finset α → ℕ` there is a matroid `M` on `α` with
`M.eRk S = r S` for every finite set `S` if and only if `r S ≤ S.card` for all `S`, `r` is
monotone and `r` is submodular. No finiteness of `α` is assumed. The characterization is
Whitney's; that rank functions have the three properties is Goemans, matroid optimization notes,
properties (R1) to (R3) and Lemma 4.3, p. 7.

- The three conditions are equivalent to: `r ∅ = 0`; `r S ≤ r (insert e S) ≤ r S + 1`; and
  `r (insert e (insert e' S)) = r S` whenever `r (insert e S) = r S` and `r (insert e' S) = r S`.

Route: one direction follows from Mathlib's lemmas on `Matroid.eRk`. For the other, call a finite
set `I` independent when
`r I = I.card`. Submodularity gives `r J ≤ r I + (J \ I).card` for `I ⊆ J`, so subsets of
independent sets are independent. If `I` is independent and `r (insert e I) = r I` for all `e` in
a finite set `Y`, then `r (I ∪ Y) = r I` by induction on `Y` and submodularity; this gives the
augmentation property, and, applied to a maximal independent subset `I` of `S`, it gives
`r S = I.card`. Mathlib's constructor from independent finite sets produces the matroid.

**Checks.**
- `r S = min S.card 1` on `{a, b}` is the rank function of the matroid with bases `{a}`, `{b}`.
- `r ∅ = r {a} = r {b} = 0`, `r {a, b} = 1` is monotone and bounded by the cardinality but not
  submodular, and is no rank function: if `a` and `b` are loops, `{a, b}` has rank `0`.
- `r S = 2 * min S.card 1` is monotone and submodular but `r {a} = 2 > 1`.
- `r S = 1` for the one-element subsets of `{a, b}` and `0` otherwise is submodular and bounded
  by the cardinality but not monotone.
- The matroid is not determined by `r`: the matroid with empty ground set and the matroid on the
  whole type in which every element is a loop both have `r = 0`.

*Needs:* Mathlib `Matroid.eRk`, `Matroid.eRk_le_encard`, `Matroid.eRk_mono`,
`Matroid.eRk_inter_add_eRk_union_le`, `Matroid.indep_iff_eRk_eq_encard_of_finite`,
`IndepMatroid.ofFinset`, `IndepMatroid.ofFinset_indep`; Tau Ceti `TauCeti.IsSubmodular`. (Proved
here, except as cited.)

### 3.2 The matroid intersection theorem

Prove `exists_indep_encard_eq_eRk_add_eRk_compl`: for matroids `M₁`, `M₂` on `α`, where `M₁` has
finite ground set, there are sets `I` and `A` such that `I` is independent in both matroids and
`I.encard = M₁.eRk A + M₂.eRk Aᶜ` (Schrijver, Theorem 10.9, p. 188; Goemans, matroid intersection
notes, Theorem 5.1, p. 4; both for two matroids on one finite ground set). The theorem is
Edmonds'.

- *Weak duality.* For all matroids `M₁`, `M₂`, every set `I` independent in both and every set
  `A`: `I.encard ≤ M₁.eRk A + M₂.eRk Aᶜ`. So the `I` of the theorem is a common independent set
  with the greatest number of elements, and `A` minimizes the sum of the two ranks.
- When the two ground sets are one set `E`, the set `A` can be taken inside `E`, and
  `M₂.eRk Aᶜ = M₂.eRk (E \ A)`. The form with the complement in `α` makes no assumption on the
  ground sets, and by symmetry it holds as well when `M₂` is the matroid with finite ground set.

Route: weak duality holds because `I ∩ A` is independent in `M₁` and `I \ A` in `M₂`. For the
theorem, restrict both matroids to the intersection `E` of the ground sets, which is finite, and
induct on the number of elements of `E`. Let `k` be the least value of `r₁(A) + r₂(E \ A)`. If no
element is a nonloop of both matroids, the set `A` of loops of `M₁` gives `k = 0`. Otherwise let
`e` be a nonloop of both. If deleting `e` from both leaves the least value at least `k`, induction
gives a common independent set with `k` elements. If contracting `e` in both leaves it at least
`k − 1`, induction gives a common independent set of the contractions with `k − 1` elements, and
adding `e` gives one of the matroids. Otherwise there are `A`, `B ⊆ E \ {e}` with
`r₁(A) + r₂(E \ (A ∪ {e})) ≤ k − 1` and `r₁(B ∪ {e}) + r₂(E \ B) ≤ k`, and adding these and using
the submodularity of both ranks gives two sets with sum of ranks at least `k` each and total at
most `2k − 1`, which is absurd. The rank of a set `X` in the contraction of a nonloop `e` is
`r(X ∪ {e}) − 1`, which follows from Mathlib's description of the independent sets of the
contraction.

**Checks.**
- For `M₁ = M₂`, `A` the ground set and `I` a base give the equality.
- On the three edges `e₁ = (l₁, r₁)`, `e₂ = (l₂, r₁)`, `e₃ = (l₂, r₂)` of a path, let `I` be
  independent in `M₁` when its edges have distinct left ends and in `M₂` when they have distinct
  right ends. The common independent sets are the matchings; `{e₁, e₃}` and `{e₂}` are both
  maximal, so they are not the independent sets of a matroid. The largest has `2` elements, and
  `A = ∅` gives `r₁(∅) + r₂(E) = 0 + 2`.
- The complement is taken in the type. For `M₁` free on `{a}` and `M₂` free on `{b}`, with
  `a ≠ b`, the only common independent set is `∅`; `A = {b}` gives `r₁({b}) + r₂({b}ᶜ) = 0 + 0`,
  while `A = ∅` gives `1`.

*Needs:* Mathlib `Matroid.eRk`, `Matroid.Finite`, `Matroid.restrict`, `Matroid.restrict_indep_iff`,
`Matroid.restrict_eRk_eq'`, `Matroid.delete`, `Matroid.delete_indep_iff`, `Matroid.contract`,
`Matroid.IsNonloop.contractElem_indep_iff`, `Matroid.eRk_inter_add_eRk_union_le`,
`Matroid.eRk_eq_zero_iff'`, `Matroid.Indep.subset`, `Matroid.Indep.eRk_eq_encard`,
`Matroid.eRk_mono`. (Proved here, except as cited.)

### 3.3 The matroid union theorem

Let `M : ι → Matroid α` be a family of matroids on one type, indexed by a finite type.

- `exists_iUnion_indep_encard_eq`: for every finite set `X` there are sets `I i ⊆ X`, with `I i`
  independent in `M i`, and a set `T ⊆ X` such that
  `(⋃ i, I i).encard = (X \ T).encard + ∑ i, (M i).eRk T` (Goemans, matroid intersection notes,
  Theorem 5.10, p. 11, for two matroids, and Exercise 5-2, p. 13, for `k`; Schrijver,
  Exercise 10.27, pp. 188–189). The formula is due to Nash-Williams and to Edmonds.
- *Weak duality.* For all independent `I i ⊆ X` and all `T ⊆ X`:
  `(⋃ i, I i).encard ≤ (X \ T).encard + ∑ i, (M i).eRk T`.
- `exists_matroid_indep_iff_iUnion`: if every `M i` has finite ground set, there is a matroid `N`
  with ground set `⋃ i, (M i).E` whose independent sets are exactly the sets `⋃ i, I i` with
  `I i` independent in `M i` for every `i`.

Route for the formula: weak duality holds because `(⋃ i, I i) ∩ T` is covered by the sets
`I i ∩ T`. For equality apply 3.2 on the type `ι × α` to two matroids restricted to `ι × X`: the
sum of the family, in which a set is independent when its fibre over each `i` is independent in
`M i`, and the matroid in which a set is independent when the projection to `α` is injective on
it. A common independent set is a family of pairwise disjoint independent sets, and every union of
independent sets is also a union of disjoint ones. For the set `A` given by 3.2 let `T` be the
set of `x ∈ X` with `(i, x) ∈ A` for all `i`; then the first rank is at least
`∑ i, (M i).eRk T` and the second is the number of elements of `X \ T`. Route for the matroid:
given two unions `J`, `J'` with `J` smaller, write both as disjoint unions `I i`, `I' i` so that
the total number of elements of the sets `I i ∩ I' i` is greatest. Some `I' i` is larger than
`I i`, so some `e ∈ I' i \ I i` can be added to `I i`. If `e` lay in another `I j`, moving it to
`I i` would increase the total; so `e ∉ J`, and `insert e J` is a union.

**Checks.**
- On `{a, b, c}` let both matroids have the one-element sets as bases. The unions are the sets
  with at most two elements. For `X` the ground set, `T = ∅` gives `3` and `T = X` gives
  `0 + 1 + 1 = 2`, the size of a largest union.
- For matroids with pairwise disjoint finite ground sets the unions are the independent sets of
  the direct sum, and for `X` the union of the ground sets `T = X` gives the sum of the ranks.
- For the empty family the only union is `∅`, and `T = X` gives `0`.
- A union need not be independent in any of the matroids: in the first example `{a, b}` is a
  union and is dependent in both.

*Needs:* 3.2; Mathlib `Matroid.sum'`, `Matroid.sum'_indep_iff`, `Matroid.comap`,
`Matroid.comap_indep_iff`, `Matroid.eRk_comap`, `Matroid.freeOn`, `Matroid.eRk_freeOn`,
`Matroid.restrict`, `Matroid.Indep.subset`, `Matroid.Indep.exists_insert_of_encard_lt`,
`IndepMatroid.ofFinite`, `IndepMatroid.ofFinite_indep`. (Proved here, except as cited.)

### 3.4 Packing and covering with bases

Let `M` be a matroid with finite ground set and `k : ℕ`.

- `exists_pairwise_disjoint_isBase_iff`: `M` has `k` pairwise disjoint bases if and only if
  `k * M.eRank ≤ k * M.eRk T + (M.E \ T).encard` for every set `T`, that is,
  `k (r(E) − r(T)) ≤ |E \ T|` (Schrijver, Exercise 10.31 (i), p. 190, where the inequality is
  printed in the opposite direction; the case `T = ∅` shows which direction is meant, since `k`
  disjoint bases have `k r(E)` elements in all and lie in `E`).
- `exists_iUnion_indep_eq_ground_iff`: the ground set is the union of `k` independent sets if and
  only if `T.encard ≤ k * M.eRk T` for every `T ⊆ M.E` (Schrijver, Exercise 10.28 (i), p. 189).

Both are due to Edmonds. Route: apply 3.3 to the constant family indexed by `Fin k` and
`X = M.E`. There are `k` disjoint bases exactly when some union has `k r(E)` elements, and the
ground set is a union exactly when some union has `|E|` elements.

**Checks.**
- On four elements with all two-element sets as bases there are two disjoint bases and not
  three: `T = ∅` gives `2k ≤ 4`.
- The six edges of the complete graph on four vertices, with the edge sets of the sixteen
  spanning trees as bases: rank `3`, two disjoint bases, and the ground set is the union of two
  independent sets but not of one. For `k = 3` the packing inequality fails at `T = ∅`:
  `9 > 6`.
- A matroid of rank `0` has `k` pairwise disjoint bases for every `k`, all equal to `∅`.
- If `M` has a loop `e`, the ground set is the union of no number of independent sets, and
  `T = {e}` gives `1 ≤ 0`, which is false. Loops do not affect the packing statement.
- `k = 0`: the packing statement holds, and the covering statement says that the ground set is
  empty.

*Needs:* 3.3; Mathlib `Matroid.eRank`, `Matroid.eRank_def`,
`Matroid.IsBase.encard_eq_encard_of_isBase`, `Matroid.Indep.exists_isBase_superset`. (Proved
here, except as cited.)

### 3.5 Independent transversals

Prove `exists_injective_indep_range_iff`: for a matroid `M` on `α` and a family
`t : ι → Finset α` indexed by a finite type, there is an injective `f : ι → α` with `f i ∈ t i`
for all `i` and `M.Indep (Set.range f)` if and only if `s.card ≤ M.eRk (⋃ i ∈ s, t i)` for every
finite set `s` of indices (Schrijver, Exercise 10.26, p. 188, for a matroid on a finite set). The
theorem is Rado's. No finiteness of `M` is assumed.

Route: necessity is immediate. For sufficiency apply 3.2 on `ι × α` to two matroids restricted to
the finite set `G` of pairs `(i, x)` with `x ∈ t i`: the one in which a set is independent when
the projection to `α` is injective on it with independent image in `M`, and the one in which a
set is independent when the projection to `ι` is injective on it. For `A ⊆ G` let `s` be the set
of indices `i` with `(i, x) ∈ A` for all `x ∈ t i`; the first rank of `A` is at least
`M.eRk (⋃ i ∈ s, t i)`, which is at least the number of elements of `s`, and the second rank of
`G \ A` is the number of indices outside `s`.

**Checks.**
- For `M` free on the whole type, `M.eRk` of a finite set is its number of elements, and the
  statement is Hall's theorem in the form of Mathlib's
  `Finset.all_card_le_biUnion_card_iff_existsInjective'`.
- On `{a, b}` with bases `{a}` and `{b}`, the sets `t₁ = {a}`, `t₂ = {b}` satisfy Hall's condition
  and have the transversal `{a, b}`, which is dependent; the union of both sets has rank `1 < 2`.
- An element outside the ground set cannot be chosen: for `t₁ = {c}` with `c ∉ M.E` the rank is
  `0 < 1`.
- For the empty family the empty function serves, and the condition holds.
- The family must be finite. On `ℕ` let the independent sets be the sets that omit at least one
  number; this is the dual of the matroid whose bases are the one-element sets. For `t n = {n}`
  the union of any `k` of the sets is a finite set, which is independent and has rank `k`, but
  the only transversal is `ℕ`, which is dependent.

*Needs:* 3.2; Mathlib `Matroid.comap`, `Matroid.comap_indep_iff`, `Matroid.eRk_comap`,
`Matroid.freeOn`, `Matroid.eRk_freeOn`, `Matroid.restrict`, `Matroid.eRk_mono`. (Proved here,
except as cited.)

### Examples

The matroid of the edges of the complete graph on four vertices, given by its sixteen bases: its
rank function checked against 3.1, two disjoint bases, a cover by two independent sets, and its
intersection with the matroid in which a set of edges is independent when no two of its edges
share their least vertex.

### Dependencies

3.3 and 3.5 use 3.2; 3.4 uses 3.3. Mathlib `Matroid.eRk`, `Matroid.eRank`, `Matroid.eRank_def`,
`Matroid.eRk_le_encard`, `Matroid.eRk_mono`, `Matroid.eRk_inter_add_eRk_union_le`,
`Matroid.eRk_eq_zero_iff'`, `Matroid.indep_iff_eRk_eq_encard_of_finite`,
`Matroid.Indep.eRk_eq_encard`, `Matroid.Indep.subset`,
`Matroid.Indep.exists_insert_of_encard_lt`, `Matroid.Indep.exists_isBase_superset`,
`Matroid.IsBase.encard_eq_encard_of_isBase`, `Matroid.Finite`, `Matroid.restrict`,
`Matroid.restrict_indep_iff`, `Matroid.restrict_eRk_eq'`, `Matroid.delete`,
`Matroid.delete_indep_iff`, `Matroid.contract`, `Matroid.IsNonloop.contractElem_indep_iff`,
`Matroid.sum'`, `Matroid.sum'_indep_iff`, `Matroid.comap`, `Matroid.comap_indep_iff`,
`Matroid.eRk_comap`, `Matroid.freeOn`, `Matroid.eRk_freeOn`, `IndepMatroid.ofFinite`,
`IndepMatroid.ofFinite_indep`, `IndepMatroid.ofFinset`, `IndepMatroid.ofFinset_indep`; Tau Ceti
`TauCeti.IsSubmodular`. No other layer.

## Layer 4: submodular set functions and the Lovász extension

Throughout this layer `α` is a finite type and `f : Finset α → ℝ`.

### 4.1 Examples and closure properties

Prove, for set functions on `Finset α`:

- if `f` is submodular, so is `S ↦ f Sᶜ`;
- if `f` is monotone and submodular and `c : ℝ`, then `S ↦ min (f S) c` is monotone and
  submodular;
- for `g : ℕ → ℝ`, the function `S ↦ g S.card` is submodular if and only if
  `g (k + 2) − g (k + 1) ≤ g (k + 1) − g k` for all `k` with `k + 2 ≤ Fintype.card α` (the
  real-variable form with weighted cardinalities is Bach, Proposition 6.1, p. 52);
- *coverage.* For finite sets `A i` in a type `Ω` and `μ : Ω → ℝ` with `0 ≤ μ`, the function
  `S ↦ ∑ x ∈ S.biUnion A, μ x` is monotone and submodular and vanishes at `∅`;
- if `f` is submodular and `0 ≤ c`, then `S ↦ c * f S` is submodular.

**Checks.**
- `S ↦ min S.card 1` is submodular; `S ↦ S.card ^ 2` is not when `α` has two elements:
  `4 + 0 > 1 + 1`.
- Monotonicity is needed for the truncation. On `{a, b}` the additive function with `f {a} = 2`,
  `f {b} = −1` is submodular, and `min (f ·) 0` takes the values `0, 0, −1, 0` on `∅`, `{a}`,
  `{b}`, `{a, b}`: `0 + 0 > 0 + (−1)`.
- Three sets `A a = {1, 2}`, `A b = {3, 4}`, `A c = {1, 3}` with `μ = 1`: the coverage function
  takes the value `2` on one-element sets, `4` on `{a, b}`, `3` on `{a, c}` and `{b, c}`, and `4`
  on `{a, b, c}`.

*Needs:* Tau Ceti `TauCeti.IsSubmodular`. (Proved here, except as cited.)

### 4.2 The Lovász extension

Define, for `w : α → ℝ`,

    lovaszExtension f w = ∑ t ∈ values of w, t * (f {i | t ≤ w i} − f {i | t < w i}),

the sum running over the finite set of values of `w`.

- *Sorted form.* If `i₁, …, i_n` lists `α` with `w i₁ ≥ … ≥ w i_n` and `S_k = {i₁, …, i_k}`, then
  `lovaszExtension f w = ∑ k, w i_k * (f S_k − f S_(k−1))`; the right side does not depend on the
  order chosen among equal values (Bach, Definition 3.1, equation (3.1), p. 16, for `f ∅ = 0`).
- `lovaszExtension f (indicator of S) = f S − f ∅` (Bach, Proposition 3.1 (f), p. 19, for
  `f ∅ = 0`).
- `lovaszExtension f (c • w) = c * lovaszExtension f w` for `0 ≤ c`; `lovaszExtension f` is
  additive in `f` and homogeneous in `f`; and
  `lovaszExtension f (w + c) = lovaszExtension f w + c * (f univ − f ∅)` for a constant `c`
  (Bach, Proposition 3.1 (a), (d), (e), p. 19, for `f ∅ = 0`).
- `lovaszExtension f` is unchanged when a constant is added to `f`.

**Checks.**
- On `{1, 2}` with `f ∅ = f {1, 2} = 0` and `f {1} = f {2} = 1`, the extension is
  `|w 1 − w 2|`: it is `2` at `(2, 0)`, `0` at `(1, 1)` and `4` at `(−1, 3)`.
- For `f S = min S.card 1` the extension is the greatest coordinate of `w`.
- Equal coordinates need no choice of order: with `f {1} = 1`, `f {2} = 5`, `f {1, 2} = 2`,
  `f ∅ = 0` and `w = (1, 1)` the only value is `1`, and the extension is `1 * (2 − 0) = 2`.
- For the constant function `1` the extension is `0` everywhere, so it takes the value `f S` at
  indicators only when `f ∅ = 0`. The formula `∑ (t_j − t_(j+1)) f {i | t_j ≤ w i}` with a last
  term `t_m f univ`, which agrees with the definition when `f ∅ = 0`, would give the greatest
  coordinate of `w` here.

*Needs:* Mathlib `Finset.sum_range_by_parts`. (Proved here, except as cited.)

### 4.3 The base polytope

Define `basePolytope f` as the set of `x : α → ℝ` with `x(S) ≤ f S` for every finite set `S` and
`x(univ) = f univ` (Bach, Definition 2.2, p. 11, there for a submodular `f` with `f ∅ = 0`; here
the definition is made for every `f`).

- If `f ∅ = 0`, then `∑ i, w i * x i ≤ lovaszExtension f w` for every `x ∈ basePolytope f` and
  every `w`. Submodularity is not needed.
- `isGreatest_image_basePolytope`: if `f` is submodular and `f ∅ = 0`, then for every `w` the
  number `lovaszExtension f w` is the greatest element of the set of values `∑ i, w i * x i`,
  `x ∈ basePolytope f` (Bach, Proposition 3.2 (b), p. 21, and Proposition 4.1 (a), p. 25). In
  particular the base polytope is not empty. The theorem is Edmonds'.
- `basePolytope f` is convex and compact: `x i ≤ f {i}` and
  `x i = x(univ) − x(univ \ {i}) ≥ f univ − f (univ \ {i})` for each of its points.

Route: write the values of `w` as `t₁ > … > t_m` and `S_j = {i | t_j ≤ w i}`. Summation by parts
gives `∑ i, w i * x i = ∑ j < m, (t_j − t_(j+1)) x(S_j) + t_m x(univ)`, and the same identity
with `f` in place of `x` is the definition when `f ∅ = 0`; this proves the first statement. For
the second, order `α` with nonincreasing `w` as in 4.2 and let `x i_k = f S_k − f S_(k−1)`. Then
`x(S_k) = f S_k` for all `k`, so the value at `x` is `lovaszExtension f w`, and `x(S) ≤ f S` for
every `S` by induction on the number of elements of `S`, applying submodularity to `S_(k−1)` and
`S` for the last index `k` with `i_k ∈ S`.

**Checks.**
- For `f S = min S.card 1` on `{1, 2}` the base polytope is the segment from `(1, 0)` to
  `(0, 1)`, and the greatest value of `w 1 * x 1 + w 2 * x 2` on it is the larger of `w 1`,
  `w 2`, as in 4.2.
- For `f {1} = f {2} = 0`, `f {1, 2} = 1`, `f ∅ = 0`, which is not submodular, the base polytope
  is empty.
- `f ∅ = 0` is needed. The constant function `1` is submodular; `(1, 0)` lies in its base polytope
  and gives the value `1` at `w = (1, 0)`, while the extension is `0`.
- The condition at `S = ∅` reads `0 ≤ f ∅`: when `f ∅ < 0` the base polytope is empty.

*Needs:* 4.2; Mathlib `Finset.sum_range_by_parts`; Tau Ceti `TauCeti.IsSubmodular`. (Proved here,
except as cited.)

### 4.4 Lovász's theorem

Prove `convexOn_lovaszExtension_iff`: `lovaszExtension f` is convex on `α → ℝ` if and only if `f`
is submodular (Bach, Proposition 3.6, p. 23, for `f ∅ = 0`). The theorem is Lovász's. No
normalization is assumed, since neither side changes when a constant is added to `f`.

Route: if `f` is submodular, apply 4.3 to `f − f ∅`: at a convex combination of `u` and `v` the
extension is the value of a linear function at some point of the base polytope, and that linear
function is at most the extension at `u` and at `v`. Conversely, a convex function that is
positively homogeneous is subadditive; for the indicators of `S` and `T` the extension of the sum
is `f (S ∪ T) + f (S ∩ T) − 2 f ∅`, by the definition applied to a vector with values `2`, `1`
and `0`, and the sum of the extensions is `f S + f T − 2 f ∅`.

**Checks.**
- `f S = S.card ^ 2` on `{1, 2}`: the extension is `1` at `(1, 0)` and at `(0, 1)` and `2` at
  their midpoint `(1/2, 1/2)`, so it is not convex.
- On a one-element type every `f` is submodular and the extension is linear. On the empty type
  the extension is the function `0` on a one-point space.
- The extension `|w 1 − w 2|` of 4.2 is convex, and its `f` is submodular: `0 + 0 ≤ 1 + 1`.

*Needs:* 4.2, 4.3; Mathlib `ConvexOn`. (Proved here, except as cited.)

### 4.5 Minimization

- `isLeast_image_lovaszExtension_iff`: if `f ∅ = 0`, then for every `m : ℝ`, `m` is the least
  value of `lovaszExtension f` on the cube `Set.Icc 0 1` if and only if `m` is the least value of
  `f` (Bach, Proposition 3.7, p. 23, stated there for submodular `f`; the argument uses only
  `f ∅ = 0`).
- `isGreatest_image_sum_min_basePolytope`: if `f` is submodular, `f ∅ = 0` and `m` is the least
  value of `f`, then `m` is the greatest element of the set of values `∑ i, min (x i) 0`,
  `x ∈ basePolytope f` (Bach, Proposition 10.3, equation (10.1), p. 117). The theorem is
  Edmonds'.
- *Weak duality.* For every `f`, every `x ∈ basePolytope f` and every `S`:
  `∑ i, min (x i) 0 ≤ x(S) ≤ f S`.

Route for the first statement: indicators lie in the cube and the extension takes the value
`f S` at the indicator of `S`. For `w` in the cube with values `t₁ > … > t_m`, summation by parts
writes the extension as a combination of the values `f S_j` with nonnegative coefficients
`t_j − t_(j+1)` and `t_m` of sum `t₁ ≤ 1`, and the remaining weight `1 − t₁` goes to `f ∅ = 0`.
Route for the second: by 4.3 the base polytope is not empty, and it is compact, so some `x` in it
maximizes `∑ i, min (x i) 0`. The sets `S` with `x(S) = f S` are closed under union and
intersection, by submodularity. For `i` with `x i < 0` and `j` with `x j > 0`, moving a small
amount from `j` to `i` would stay in the base polytope unless some such set contains `i` and not
`j`. Intersecting over `j` and uniting over `i` gives a set `S` with `x(S) = f S` that contains
every `i` with `x i < 0` and no `j` with `x j > 0`, so `f S = ∑ i, min (x i) 0`; when no
coordinate is positive take `S = univ`.

**Checks.**
- On `{1, 2}` let `f ∅ = 0`, `f {1} = −1`, `f {2} = 2`, `f {1, 2} = 0`, a submodular function with
  least value `−1`. The base polytope is the segment of points `(x, −x)` with `−2 ≤ x ≤ −1`; the
  sum of negative parts is `x`, with greatest value `−1`. The extension is `−1` at `(1, 0)`, its
  least value on the cube.
- `f ∅ = 0` is needed in both statements: for the constant function `1` the least value of `f`
  is `1`, the extension is `0`, and the point `(1, 0)` of the base polytope gives `0`.
- Submodularity is needed in the second statement: for `f {1} = f {2} = 0`, `f {1, 2} = 1` the
  base polytope is empty and has no greatest value.

*Needs:* 4.2, 4.3; Mathlib `IsCompact.exists_isMaxOn`; Tau Ceti `TauCeti.IsSubmodular`. (Proved
here, except as cited.)

### 4.6 The weight of an optimal base

Prove `IsMaxWeightBase.weight_eq_lovaszExtension`: for a matroid `M` on the finite type `α`, a
weight `w : α → ℝ` and a base `B` of maximum weight, `weight w B` is the Lovász extension at `w`
of the rank function `S ↦ r(S)`, read as a real number.

Route: by criterion 3 of 1.3, `B` has `r({e | t ≤ w e})` elements of weight at least `t`, for
every `t`; so the number of elements of `B` of weight exactly `t` is the difference of ranks in
the definition of 4.2.

**Checks.**
- First example of 1.1 with weights `3, 2, 1`: the terms are `3 * (1 − 0)`, `2 * (2 − 1)` and
  `1 * (2 − 2)`, with sum `5`.
- A loop of weight `10` contributes `10 * (0 − 0) = 0`, and so does an element outside the
  ground set.
- On `{a, b}` with bases `{a}`, `{b}` and weights `−1, −2`: `(−1) * (1 − 0) + (−2) * (1 − 1) = −1`,
  the weight of `{a}`.

*Needs:* 1.3, 4.2; Mathlib `Matroid.eRk`, `Matroid.IsBasis.encard_eq_eRk`. (Proved here.)

### Examples

The cut function of the path with two edges on three vertices: its submodularity, its Lovász
extension `|w 1 − w 2| + |w 2 − w 3|`, the base polytope, and the two minimization theorems for
its sum with an additive function.

### Dependencies

4.6 uses Layer 1 (1.3). Mathlib `ConvexOn`, `IsCompact.exists_isMaxOn`,
`Finset.sum_range_by_parts`, `Matroid.eRk`, `Matroid.IsBasis.encard_eq_eRk`; Tau Ceti
`TauCeti.IsSubmodular`.

## Layer 5: greedy maximization of monotone submodular functions

### 5.1 Marginal values

Prove, for a submodular `f : Finset α → ℝ` on any type and finite sets `S`, `T`:

    f (S ∪ T) − f S ≤ ∑ x ∈ T \ S, (f (insert x S) − f S).

Route: add the elements of `T \ S` to `S` one at a time; the increase at each step is at most the
increase from adding that element to `S` alone, by submodularity applied to the set reached and
`insert x S`, whose intersection is `S`.

**Checks.**
- For the coverage function of 4.1 with `S = ∅` and `T = {a, c}`: `3 ≤ 2 + 2`.
- For `f S = S.card ^ 2`, which is not submodular, `S = ∅` and `T = {a, b}`: `4 > 1 + 1`.

*Needs:* Tau Ceti `TauCeti.IsSubmodular`. (Proved here.)

### 5.2 The bound of Nemhauser, Wolsey and Fisher

Prove `sub_le_pow_mul_sub_of_greedy`: let `f : Finset α → ℝ` be monotone and submodular, let
`s : ℕ → Finset α` and `l : ℕ` be such that `s 0 = ∅` and, for every `i < l`, there is `x` with
`s (i + 1) = insert x (s i)` and `f (insert y (s i)) ≤ f (insert x (s i))` for all `y`. Then for
every `k : ℕ` and every `T` with `T.card ≤ k`,

    f T − f (s l) ≤ (1 − 1 / k) ^ l * (f T − f ∅).

- Hence `f T − f (s l) ≤ Real.exp (−l / k) * (f T − f ∅)`, and for `l = k` and `0 ≤ f ∅`:
  `(1 − Real.exp (−1)) * f T ≤ f (s k)` (Krause and Golovin, Theorem 1.5, pp. 6–7, for nonnegative
  `f` and positive `k`, `l`; Bach, Proposition 11.1, pp. 127–128, for `l = k`).

Route: for `k ≥ 1` and `i < l`, monotonicity and 5.1 give
`f T ≤ f (s i ∪ T) ≤ f (s i) + k * (f (s (i + 1)) − f (s i))`, since each of the at most `k` terms
is at most the increase of the step, which is nonnegative. So
`f T − f (s (i + 1)) ≤ (1 − 1 / k) * (f T − f (s i))`, and induction on `l` finishes. For `k = 0`
the set `T` is empty, the factor is `1` because division by zero gives zero, and the statement is
`f ∅ ≤ f (s l)`.

**Checks.**
- Equality can hold. For the coverage function of 4.1, `s 1 = {c}` and `s 2 = {a, c}` are
  admissible, with `f (s 2) = 3`; for `T = {a, b}` and `k = l = 2`: `4 − 3 = (1/2) ^ 2 * 4`.
- For `k = l = 1` the factor is `0`: `s 1` is a one-element set of greatest value and is at least
  as good as every set with at most one element.
- For `l = 0` the statement is an equality.
- Monotonicity is needed: on a one-element type with `f ∅ = 0`, `f {a} = −1`, the only sequence
  has `s 1 = {a}`, and `T = ∅`, `k = 0`, `l = 1` would give `1 ≤ 0`.
- Submodularity is needed: on `{a, b, c}` let `f S = 1` if `{a, b} ⊆ S` and `0` otherwise, a
  monotone function. The sequence `∅, {c}, {a, c}` is admissible, and `T = {a, b}`,
  `k = l = 2` would give `1 ≤ 1/4`.
- The element `x` of a step may already lie in `s i`; this happens only when no element increases
  `f`.

*Needs:* 5.1; Mathlib `Monotone`, `Real.add_one_le_exp`, `Real.exp_nat_mul`; Tau Ceti
`TauCeti.IsSubmodular`. (Proved here, except as cited.)

### Examples

The coverage function of three sets from 4.1: all admissible sequences, the values along them,
and the bound for `k = 1, 2, 3`.

### Dependencies

Mathlib `Monotone`, `Real.add_one_le_exp`, `Real.exp_nat_mul`; Tau Ceti `TauCeti.IsSubmodular`.
No other layer.

## Scope and ownership

This roadmap owns the definitions and theorems stated above: the weight of a set and bases of
maximum weight with the symmetric exchange property and the optimality criteria; the greedy
relation, the greedy theorem and its converse; the characterization of rank functions, the
intersection and union theorems, the packing and covering of bases and Rado's theorem; the Lovász
extension and the base polytope with the theorems of Edmonds and Lovász; and the bound for greedy
maximization.

Already in the libraries and therefore not targets:

- Matroids with their independent sets, bases, circuits, closure, duals, minors, maps and sums
  (`Mathlib/Combinatorics/Matroid/`), including the one-sided exchange property
  (`Matroid.IsBase.exchange`), the equal cardinality of bases
  (`Matroid.IsBase.encard_eq_encard_of_isBase`), the augmentation property
  (`Matroid.Indep.exists_insert_of_encard_lt`) and the constructors of a matroid from its
  independent sets (`IndepMatroid.ofFinite`, `IndepMatroid.ofFinset`).
- The rank `Matroid.eRk` with its bound by the cardinality (`Matroid.eRk_le_encard`), its
  monotonicity (`Matroid.eRk_mono`), its submodularity (`Matroid.eRk_inter_add_eRk_union_le`) and
  the rank of the dual (`Matroid.eRk_dual_add_eRank`). The direction of 3.1 from a matroid to the
  three properties is these lemmas.
- Hall's theorem (`Finset.all_card_le_biUnion_card_iff_existsInjective'` in
  `Mathlib/Combinatorics/Hall/Finite.lean`), which 3.5 contains as the case of the free matroid.
- Submodular functions on a lattice (`TauCeti.IsSubmodular`), constants
  (`TauCeti.isSubmodular_const`), sums (`TauCeti.IsSubmodular.add`), sums of fixed weights over a
  finite set (`TauCeti.isSubmodular_finsetSum`), precomposition with lattice homomorphisms
  (`TauCeti.IsSubmodular.comp_latticeHom`), which gives `S ↦ f (S ∪ A)` and `S ↦ f (S ∩ A)`, the
  lattice of minimizers (`TauCeti.IsSubmodular.isSublattice_minimizers`), all in
  `TauCeti/Order/Lattice/Submodular.lean`, and the submodularity of the capacity of the arrows
  leaving a set of vertices (`TauCeti.isSubmodular_outgoingArrowSum` in
  `TauCeti/Combinatorics/Network/CutSubmodular.lean`).

Left to other roadmaps:

- GraphConnectivityAndFlows owns submodularity on lattices with the closure lemmas just listed and
  the cut functions (its 4.1), Kőnig's theorem with capacities (its 6.7) and Hall's theorem with
  capacities and deficiency (its 6.8). Kőnig's theorem without capacities is the intersection
  theorem of 3.2 for two matroids of the kind in the second Check of 3.2; it is not restated
  here. That roadmap lists the theorems of Nash-Williams
  and Tutte on disjoint spanning trees as outside its scope. They are the case of 3.4 for the
  matroid of the forests of a graph, and they are outside this roadmap too: that matroid is not
  in Mathlib, and no statement above mentions a graph.

Not treated here: the base polytope of a submodular `f` with `f ∅ = 0` is the image under
`x ↦ −x` of the core of the cooperative game `−f`, which is convex in the sense of game theory.
The core as an object of game theory, the extreme points of the core of a convex game and the
characterization of convexity by increasing marginal values are not targets of this roadmap:
4.3 states only the greatest value of a linear function on the base polytope, and the route of
5.1 applies the submodular inequality directly.

Outside the scope: implementations of any greedy or augmenting method, running times and
oracles; minimum spanning trees and forests of graphs, which are bases of minimum weight in the
matroid of forests, with their cut and cycle properties; weighted matroid intersection and the
polytope of common independent sets; the intersection of three or more matroids; matroid parity
and matching; the intersection and union theorems without the finiteness assumed in 3.2 and 3.3;
polymatroid intersection, total dual integrality and the submodular
flow theorems; minimum-norm points and methods for minimizing a submodular function; maximization
without monotonicity or under constraints other than a bound on the cardinality; curvature and
adaptive variants of the bound of 5.2; the matroids of graphs, of vector configurations and of
transversals as objects of their own.

## Exact supplier contracts

### From Mathlib

- `Mathlib/Combinatorics/Matroid/Basic.lean`: the structure `Matroid α` with ground set `M.E`,
  `Matroid.IsBase` and `Matroid.Indep`; `Matroid.exists_isBase` (every matroid has a base);
  `Matroid.Finite` (the ground set is finite) and `Matroid.RankFinite` (some base is finite);
  `Matroid.IsBase.finite` (for `[M.RankFinite]`, every base is finite);
  `Matroid.IsBase.encard_eq_encard_of_isBase` (two bases have the same `encard`);
  `Matroid.IsBase.exchange_isBase_of_indep` (for a base `B` and
  `f ∉ B`, if `insert f (B \ {e})` is independent it is a base); `Matroid.Indep.subset`;
  `Matroid.Indep.exists_isBase_superset`; `Matroid.IsBasis` (`M.IsBasis I X` means that `I` is
  maximal among the independent subsets of `X`, and `X ⊆ M.E`).
- `Mathlib/Combinatorics/Matroid/Circuit.lean`: `Matroid.fundCircuit`;
  `Matroid.IsBase.fundCircuit_isCircuit` (for a base `B` and `x ∈ M.E \ B`, `M.fundCircuit x B` is
  a circuit); `Matroid.fundCircuit_subset_insert` (`M.fundCircuit e I ⊆ insert e I`);
  `Matroid.fundCocircuit`; `Matroid.fundCocircuit_isCocircuit` (for a base `B` and `e ∈ B`);
  `Matroid.fundCocircuit_inter_eq` (for `e ∈ B`, `M.fundCocircuit e B ∩ B = {e}`);
  `Matroid.IsCircuit.inter_isCocircuit_ne_singleton` (a circuit and a cocircuit do not meet in
  exactly one element); `Matroid.IsBase.mem_fundCocircuit_iff_mem_fundCircuit` (for a base `B`,
  `e ∈ M.fundCocircuit f B ↔ f ∈ M.fundCircuit e B`); `Matroid.Indep.mem_fundCircuit_iff` (for an
  independent `I` and `e ∈ M.closure I` with `e ∉ I`,
  `x ∈ M.fundCircuit e I ↔ M.Indep (insert e I \ {x})`).
- `Mathlib/Combinatorics/Matroid/Closure.lean`: `Matroid.IsBase.closure_eq` (for a base `B`,
  `M.closure B = M.E`).
- `Mathlib/Combinatorics/Matroid/Rank/ENat.lean`: `Matroid.eRk` and `Matroid.eRank`, with values
  in `ℕ∞`; `Matroid.eRank_def` (`M.eRank = M.eRk M.E`); `Matroid.IsBasis.encard_eq_eRk`;
  `Matroid.Indep.eRk_eq_encard`; `Matroid.eRk_le_encard`; `Matroid.eRk_mono`;
  `Matroid.eRk_inter_add_eRk_union_le` (`M.eRk (X ∩ Y) + M.eRk (X ∪ Y) ≤ M.eRk X + M.eRk Y`, no
  hypothesis); `Matroid.eRk_eq_zero_iff'` (`M.eRk X = 0 ↔ X ∩ M.E ⊆ M.loops`);
  `Matroid.indep_iff_eRk_eq_encard_of_finite` (for finite `I`, `M.Indep I ↔ M.eRk I = I.encard`);
  `Matroid.Indep.exists_insert_of_encard_lt` (for independent `I`, `J` with
  `I.encard < J.encard` there is `e ∈ J \ I` with `insert e I` independent);
  `Matroid.restrict_eRk_eq'` (`(M ↾ R).eRk X = M.eRk (X ∩ R)`); `Matroid.eRk_comap`
  (`(M.comap f).eRk X = M.eRk (f '' X)`); `Matroid.eRk_freeOn` (for `X ⊆ Y`,
  `(freeOn Y).eRk X = X.encard`).
- `Mathlib/Combinatorics/Matroid/IndepAxioms.lean`: `IndepMatroid.ofFinite` (a matroid from a
  predicate on subsets of a finite set `E` that holds for `∅`, is closed under subsets and has the
  augmentation property stated with `Set.ncard`) with `IndepMatroid.ofFinite_indep`;
  `IndepMatroid.ofFinset` (for `[DecidableEq α]`, a finitary matroid from a predicate on `Finset α`
  with the same three properties) with `IndepMatroid.ofFinset_indep` (its independent finite sets
  are those satisfying the predicate).
- `Mathlib/Combinatorics/Matroid/Minor/Restrict.lean`: `Matroid.restrict`,
  `Matroid.restrict_indep_iff` (`(M ↾ R).Indep I ↔ M.Indep I ∧ I ⊆ R`).
  `Mathlib/Combinatorics/Matroid/Minor/Delete.lean`: `Matroid.delete`, `Matroid.delete_indep_iff`
  (`(M ＼ D).Indep I ↔ M.Indep I ∧ Disjoint I D`).
  `Mathlib/Combinatorics/Matroid/Minor/Contract.lean`: `Matroid.contract`,
  `Matroid.IsNonloop.contractElem_indep_iff` (for a nonloop `e`,
  `(M ／ {e}).Indep I ↔ e ∉ I ∧ M.Indep (insert e I)`).
- `Mathlib/Combinatorics/Matroid/Sum.lean`: `Matroid.sum'` (for `M : ι → Matroid α`, a matroid on
  `ι × α`) with `Matroid.sum'_indep_iff` (`I` is independent if and only if
  `Prod.mk i ⁻¹' I` is independent in `M i` for all `i`).
  `Mathlib/Combinatorics/Matroid/Map.lean`: `Matroid.comap`, `Matroid.comap_indep_iff`
  (`(N.comap f).Indep I ↔ N.Indep (f '' I) ∧ Set.InjOn f I`).
  `Mathlib/Combinatorics/Matroid/Constructions.lean`: `Matroid.freeOn` (every subset of `E` is
  independent).
- `Mathlib/Algebra/BigOperators/Finprod.lean`: `finsum_mem_insert` (for `a ∉ s` and `s` finite,
  the `finsum` over `insert a s` is `f a` plus the `finsum` over `s`).
  `Mathlib/Data/Set/Finite/Powerset.lean`: `Set.Finite.finite_subsets`.
  `Mathlib/Data/Set/Finite/Lemmas.lean`: `Set.exists_max_image` (a function with values in a
  linear order attains a greatest value on a nonempty finite set).
- `Mathlib/Algebra/BigOperators/Module.lean`: `Finset.sum_range_by_parts` (summation by parts
  over `Finset.range n`).
- `Mathlib/Analysis/Convex/Function.lean`: `ConvexOn`. `Mathlib/Topology/Order/Compact.lean`:
  `IsCompact.exists_isMaxOn` (a function continuous on a nonempty compact set attains a greatest
  value on it). `Mathlib/Order/Monotone/Defs.lean`: `Monotone`.
- `Mathlib/Analysis/Complex/Exponential.lean`: `Real.add_one_le_exp` (`x + 1 ≤ Real.exp x`) and
  `Real.exp_nat_mul` (`Real.exp (n * x) = Real.exp x ^ n`).

### From Tau Ceti

- `TauCeti/Order/Lattice/Submodular.lean`: `TauCeti.IsSubmodular` (for `f : L → K` on a lattice
  `L` with values in a type with addition and an order, `f (a ⊔ b) + f (a ⊓ b) ≤ f a + f b` for
  all `a`, `b`). It is used with `L = Finset α`, where the join is the union and the meet is the
  intersection, and `K = ℝ` or `ℕ`. No other declaration of Tau Ceti is used by a target.

## References

- Francis Bach, *Learning with Submodular Functions: A Convex Optimization Perspective*,
  arXiv:1111.6453, version 2 of October 2013; the page numbers above are those of that version.
- Michel X. Goemans, *Lecture notes on matroid optimization* and *Lecture notes on matroid
  intersection*, handouts 9 and 14 of the course 18.433 Combinatorial Optimization, Massachusetts
  Institute of Technology, March 2011; available from the author's page.
- Andreas Krause and Daniel Golovin, *Submodular Function Maximization*, survey chapter, 2012
  version available from the first author's group page at ETH Zurich; published in *Tractability:
  Practical Approaches to Hard Problems*, Cambridge University Press, 2014.
- James Oxley, *What is a matroid?*, revised version of October 31, 2014, of the paper in
  *Cubo* 5 (2003), 179–218; available from the author's page.
- Alexander Schrijver, *A Course in Combinatorial Optimization*, lecture notes, CWI and University
  of Amsterdam, version of March 23, 2017, Chapter 10; available from the author's page at CWI.
- Attributions made in prose without a locator: Richard A. Brualdi (symmetric exchange, 1969);
  Richard Rado and Jack Edmonds (the converse of the greedy theorem; independent transversals);
  Hassler Whitney (rank functions, 1935); Jack Edmonds (intersection, packing and covering, the
  base polytope and the min–max theorem for submodular functions, 1965 to 1970);
  C. St. J. A. Nash-Williams (the rank of a union, 1967); László Lovász (convexity of the
  extension, 1983); George L. Nemhauser, Laurence A. Wolsey and Marshall L. Fisher (the bound for
  greedy maximization, 1978).
