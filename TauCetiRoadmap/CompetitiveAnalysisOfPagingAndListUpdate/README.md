# Roadmap: competitive analysis of paging and list update

**Summary.** A request sequence is served step by step, and each step costs according to the
state chosen. A rule that sees only the requests up to now is compared with the best choice made
knowing the whole sequence: it is competitive with ratio `c` when its cost on every request
sequence is at most `c` times the optimal cost, up to an additive constant. This roadmap proves
the classical ratios for two problems as theorems about request sequences, state sequences and
their costs. An online rule is a function of request prefixes, and the optimum is a
minimum over sequences of states; no algorithm or running time is a target.

In list update the state is an ordering of finitely many items. Accessing an item costs its
position, the item may then be moved forward for free, and every other exchange of neighbours
costs one. Sleator and Tarjan's theorem says that move-to-front, against any other sequence of
actions from the same list, pays at most twice the other's access cost plus its paid exchanges,
minus its free exchanges and the number of requests. So move-to-front is 2-competitive, while no
deterministic online rule on `n` items has a ratio below `2n/(n + 1)`.

In paging the state is a cache of at most `k` pages containing the current request, and the cost
is the number of pages fetched; offline schedules, least recently used, first-in first-out and
the randomized rules start from the empty cache. Belady's rule, which on a miss evicts the page
requested furthest in the future, is optimal offline however ties are broken. For `1 ≤ h ≤ k`,
least recently used and first-in first-out with capacity `k` fetch at most `k/(k − h + 1)` times
as often as the optimum with capacity `h`, and on `k + 1` pages every deterministic online rule
with capacity `k` meets sequences on which this ratio is reached up to an additive constant.

The marking rule, on a miss with a full cache, evicts a uniformly random cached page among those
not requested in the current phase; for `k ≥ 1` its expected cost is at most `2 H_k` times the
optimum, where `H_k = 1 + 1/2 + ⋯ + 1/k`. Conversely, for every randomized online rule with
capacity `k` and every `N` there are sequences on `k + 1` pages, fixed before the random choices,
on which its expected cost is at least `k + H_k N` while the optimum is at most `k + N`.

The roadmap builds on Mathlib for lists, finite sets, harmonic numbers and sums in `[0, ∞]`. It
differs from RegretMinimizationAndEquilibria, which measures online algorithms by regret; the
secretary problem and other online selection problems are not treated here.

Layer 1 treats list update; Layer 2 defines paging schedules and the optimum and proves Belady's
theorem; Layer 3 treats LRU, FIFO and the deterministic lower bound; Layer 4 treats the marking
rule and the lower bound `H_k`; Layers 3 and 4 use Layer 2.

## Conventions

- **Requests and items.** Items and pages form a type `α` with decidable equality; a request
  sequence is `σ : List α` of length `m`. Positions in lists are counted from `0` in Lean
  (`List.idxOf`) and access costs from `1`, so accessing the item at index `i` costs `i + 1`.
- **List update.** A list is `L : List α`. In 1.3 it has no repetitions and requests are items of
  `L`; 1.2 holds for every list and every request sequence (a request outside the list is an
  insertion, and with repetitions the first occurrence of the request is accessed). The
  action at time `t` is a pair `(sw, j)`: first the paid exchanges `swapAdj · i` for the indices
  `i` in `sw`, in order (an index with no right neighbour leaves the list unchanged but is still
  paid), then the access, then a free move of the accessed item `j` places forward (to the front
  if `j` is at least its index). The three costs are the access cost `C`, the number `X` of paid
  exchanges and the number `F` of free exchanges actually made, `min j i`. The offline optimum is
  the least `C + X`; free exchanges cost nothing. Paid exchanges happen after the request is seen,
  so an online rule may use the current request.
- **Paging.** A schedule of capacity `h` for `σ` is a list of caches `c₀, …, c_(m−1)` of type
  `Finset α` with `σ_t ∈ c_t` and `|c_t| ≤ h`, started from the empty cache. Its cost is the number
  of fetches `Σ_t |c_t \ c_(t−1)|` with `c_(−1) = ∅`; a page brought in before it is requested is
  paid when it is brought in. `OPT_h(σ)` is the least cost. For `h = 0` and `σ ≠ []` there is no
  schedule and `OPT_0(σ)` is the junk value `sInf ∅ = 0`; the paging theorems are stated for
  `h ≥ 1`, where `OPT_h` is a genuine minimum (3.2 is false for `h = 0`, Check of 3.2).
- **Cold start.** Offline schedules, LRU, FIFO and every randomized rule start from the empty
  cache; a deterministic rule in 3.3 may start from any cache `A []`. With this convention the
  upper bounds of 3.2 and 4.2 hold with no additive constant; Sleator–Tarjan and Fiat et al. allow
  different initial caches and carry additive terms (see the locators).
- **Online rules.** A deterministic online paging rule is a map `A : List α → Finset α`, the cache
  after each prefix; it is online because its cache after `t + 1` requests depends on those
  requests only. Its cost on `σ` counts fetches from `A []`. A randomized online paging rule is a
  weight function `A hist r c ∈ [0, ∞]`, the probability that the next cache is `c` given the
  history `hist` (earlier requests with the caches after them) and the new request `r`; the
  probability of a run is the product of its steps, and the expected cost is the sum over runs in
  `[0, ∞]`, which needs no summability side condition.
- **Oblivious adversary.** In 4.3 the request sequence is chosen from the rule alone, before any
  random choice is made: it is one fixed list, and the expectation is over the rule's randomness
  on that list. In 1.3 and 3.3 the rule is deterministic, so a sequence built against its answers
  is again one fixed list.
- **Harmonic numbers.** `H_k` is Mathlib's `harmonic k = Σ_(i<k) 1/(i + 1)`, a rational number,
  with `H_0 = 0`; in `[0, ∞]` it enters as `ENNReal.ofReal (harmonic k)`.
- **Natural subtraction.** `k − h + 1` is `(k − h) + 1` in `ℕ`: the usual value for `h ≤ k`, and
  `1` for `h > k`. So 3.2 assumes `h ≤ k` (it is false for `k = 1`, `h = 2`, Check of 3.2),
  while 3.3 holds for every `h ≥ 1`. `h − 1` and `n − 1` are used only with `h, n ≥ 1`.

## Layer 1: list update

### 1.1 Lists, actions and costs

Define `swapAdj L i` (exchange the entries at indices `i` and `i + 1`; `L` itself when index
`i + 1` does not exist), `moveForward L r j` (remove `r` and reinsert it at index `idx r − j`,
natural subtraction), `listCosts L σ acts = (C, X, F)` with the action at time `t` given by
`acts t`, `mtfCost L σ` (access at cost index plus one, then move the item to the front), and
`listOpt L σ`, the `sInf` of `C + X` over all `acts : ℕ → List ℕ × ℕ` (Sleator–Tarjan, §2,
p. 203: access cost `i` for the `i`-th item, free exchanges of the accessed item towards the
front, paid exchanges at cost `1`; no deletions here). With these definitions a request `r` outside
the list costs the length plus one, as the index `List.idxOf r` is then the length; move-to-front
puts `r` at the front, and `moveForward` inserts it at index `length − j`, counting `min j length`
free exchanges. The set of values is never empty (any `acts` gives one), so `listOpt` is a least
element.

**Checks.**

- From `[1, 2, 3]` with requests `3, 3, 2`, move-to-front pays `3 + 1 + 3 = 7`; the action
  `([], 5)` at every time is move-to-front and gives `(C, X, F) = (7, 0, 4)`, the free moves
  being `2, 0, 2`.
- From `[1, 2, 3]` with the single request `3` and the action `([1], 0)`: the paid exchange gives
  `[1, 3, 2]`, so `(C, X, F) = (2, 1, 0)`; one paid exchange saved one unit of access cost.
- `moveForward [1, 2, 3, 4] 4 1 = [1, 2, 4, 3]`, and the free count is `min j i`, not `j`: the
  action `([], 5)` on an item at index `2` counts `2` free exchanges.
- From `[1, 2, 3]` with requests `3, 3, 3`, `listOpt = mtfCost = 5`; with `3, 2, 1`, `listOpt = 6`
  while move-to-front pays `9`.

### 1.2 Move-to-front against every action sequence

Prove `mtfCost_add_free_add_length_le`: for every list `L`, every `σ` and every `acts`, with
`(C, X, F) = listCosts L σ acts`, `mtfCost L σ + F + m ≤ 2 C + X` (Sleator–Tarjan, Theorem 1 and
the paragraph after its proof, p. 204: the bound `C_MF ≤ 2 C_A + X_A − F_A − m` from the empty
set, and from a common nonempty starting list, where the initial number of inversions is `0`).
Since `F ≥ 0` and `X ≤ 2X`, it gives `mtfCost L σ + m ≤ 2 · listOpt L σ`: move-to-front is
2-competitive. Sleator–Tarjan's setting, a list without repetitions and requests to its items, is
the special case; the statement needs neither restriction (route below).

Route (Sleator–Tarjan's, with entries labelled). Run both on `σ`. The two lists always have the
same entries with the same multiplicities: each request either moves one occurrence of `r` in both
lists or, when `r` is in neither, inserts it in both. Match the `j`-th occurrence of each value in
one list with its `j`-th occurrence in the other, and take as potential `Φ` the number of unordered
pairs of matched entries ordered differently in the two lists (the inversions); two occurrences of
one value are never inverted. Every step keeps this matching: an exchange of two equal neighbours
changes nothing, and moving the first occurrence of `r` forward or to the front keeps it the first
occurrence. So the request accesses the same labelled entry in both lists, its first occurrence.
`Φ = 0` at the start, since both start from `L`, and `Φ ≥ 0` at the end. At time `t`, the paid
exchanges of the action sequence come first; each changes `Φ` by at most `1` and costs
move-to-front nothing. Then the request is at index `i` in the action sequence's list (cost
`i + 1`) and at index `k` in move-to-front's list; a request outside the lists counts as appended
at the end of both, `i = k` the length, with no inversion involving it. Let `x` be the number of
entries before it in move-to-front's list and after it in the other. Moving it to the front of
move-to-front's list creates `k − x` inversions and destroys `x`, and `k − x ≤ i`, since the
`k − x` other entries before it in move-to-front's list are also before it in the other list. So
the cost `k + 1` plus the change of `Φ` is `2(k − x) + 1 ≤ 2(i + 1) − 1`. Each free exchange of the
action sequence then moves the requested entry, now first in move-to-front's list, past an entry
before it in the other list, which is not an occurrence of `r`, and removes one inversion. Summing,
`mtfCost L σ + Φ_end ≤ 2C − m + X − F`, and `Φ_end ≥ 0`.

**Checks.**

- Equality: from `[1, 2, 3]` with requests `3, 3` and the action sequence move-to-front itself,
  `mtfCost = 4`, `F = 2`, `m = 2`, `C = 4`, `X = 0`: `4 + 2 + 2 = 8 = 2·4 + 0`.
- The static list `([], 0)` at every time with requests `3, 3, 3`: `C = 9`, `X = F = 0`, and
  `mtfCost + F + m = 5 + 0 + 3 = 8 ≤ 18`.
- A repetition and an insertion: from `[1, 1]` with requests `2, 1`, move-to-front pays
  `3 + 2 = 5`. The action `([], 0)` at every time inserts `2` at the end, `(C, X, F) = (4, 0, 0)`,
  and `5 + 0 + 2 = 7 ≤ 8`; the action `([], 5)` gives `(5, 0, 3)` and the equality `10 = 10`.
- Exhaustive: for all lists of at most four entries over three values, repetitions allowed, and
  requests over four values, one of them never in the list (at most five requests for lists of at
  most one entry, four for two or three entries, three for four), the largest value over all
  action sequences of `mtfCost + F + m + Φ_end − (2C + X)` is `0`, the paid exchanges being any
  sequence of adjacent exchanges.

*Needs:* 1.1.

### 1.3 No deterministic online rule beats `2n/(n + 1)`

Prove `exists_listCost_ge_and_two_mul_listOpt_le`: let `L` be a nonempty list of `n` distinct
items and `rule : List α → List ℕ × ℕ` a deterministic online rule, whose action at time `t` is
`rule` of the first `t + 1` requests. For every `m` there is a request sequence `σ` of length `m`
with items of `L` such that the rule pays `C + X ≥ n m` on `σ` and
`2 · listOpt L σ ≤ (n + 1) m + n (n − 1)`. So no deterministic online rule has competitive ratio
below `2n/(n + 1)` with any additive constant. (Proved here; the bound is attributed to Karp and
Raghavan in the literature, and no source was opened.)

Route. Build `σ` request by request: the next request is the last item of the rule's list before
that step. Whatever paid exchanges the rule then makes, each moves the requested item at most one
place, so after `X_t` of them it is at index at least `n − 1 − X_t` and the step costs
`C_t + X_t ≥ n`. For the optimum, compare with static strategies: for an ordering `π` of `L`, pay
at the first step the adjacent exchanges that sort `L` into `π` (at most `n(n − 1)/2` of them, by
bubble sort: each exchange of an adjacent out-of-order pair removes one inversion), and never move
again. Summed over all `n!` orderings, each request is at each index `n!/n` times, so the access
costs of `σ` sum to `n! · m (n + 1)/2`, and some ordering has access cost at most `m(n + 1)/2`.
Hence `listOpt L σ ≤ m(n + 1)/2 + n(n − 1)/2`.

**Checks.**

- `n = 1`: the rule pays `m`, the optimum is `m`, and `2m ≤ 2m + 0`: both bounds are equalities.
- `n = 3`, `m = 3`: on `3, 2, 1` from `[1, 2, 3]`, the sequence the construction produces against
  move-to-front, move-to-front pays `9 = n m` and `2 · listOpt = 12 ≤ 4·3 + 6 = 18`.
- The bound `2 · listOpt ≤ (n + 1) m + n(n − 1)` holds for every sequence, not only the
  constructed one: checked against an exact dynamic program over all orderings, paid exchanges
  included, for every sequence of length at most `6` on at most four items.
- `L ≠ []` is needed: with `L = []` no request is an item of `L`, so no sequence of length `1`
  exists.

*Needs:* 1.1.

### Examples

- Move-to-front from `[1, 2, 3]` on `3, 3, 2` costs `7`; `3, 2, 1` from the same list costs `9`.

### Dependencies

1.2 and 1.3 use 1.1. Layer 1 uses no other layer.

## Layer 2: paging schedules and the offline optimum

### 2.1 Schedules, fetches and `OPT_h`

Define `fetchCostFrom p cs` (the sum of `|c \ previous|` along `cs`, started from `p`),
`fetchCost cs = fetchCostFrom ∅ cs`, `IsSchedule h σ cs` (`List.Forall₂`: one cache per request,
containing it, of size at most `h`) and `pagingOpt h σ`, the `sInf` of the costs of the schedules
of capacity `h` for `σ`.

- For `h ≥ 1` the singletons `{σ_t}` form a schedule, so the set of costs is nonempty and
  `pagingOpt h σ` is attained.
- Every schedule fetches each distinct requested page at least once, so `OPT_h(σ)` is at least the
  number of distinct pages of `σ`, with equality when that number is at most `h`.

**Checks.**

- `fetchCost [{1}, {1, 2}, {3, 2}] = 1 + 1 + 1 = 3`.
- `OPT_2(1, 2, 3, 1, 2, 3) = 4`, `OPT_1(1, 2, 3, 1, 2, 3) = 6`, `OPT_3(1, 2, 3, 4, 1, 2) = 4`.
- `h = 0`: no schedule serves the single request `1`, and `pagingOpt 0 [1] = 0` is the junk value
  of the empty set.
- Prefetching never helps: for every sequence of length at most `7` on at most three pages and at
  most `6` on four, and every `h ≤ 3`, the minimum over all schedules equals the minimum over
  schedules that fetch only the requested page on a miss.

### 2.2 Belady's furthest-in-future rule is optimal

Define `IsFurthestInFuture h C σ cs`: a hit keeps the cache, a miss with fewer than `h` cached
pages inserts the request, and a miss with a full cache evicts a page `q` whose next request in the
rest of the sequence (`List.idxOf`, equal to the length of the rest when there is none) is at
least that of every cached page; ties are broken arbitrarily. Prove
`isSchedule_and_fetchCost_eq_pagingOpt`: every furthest-in-future schedule from the empty cache is
a schedule of capacity `h` whose cost is `OPT_h(σ)`. For `h ≥ 1` such schedules exist (choose a
page of latest next request at each eviction), and for `h = 0` and `σ ≠ []` there is none.

(Lee–Michaud–Sim–Nyang, Lemma 1 and Theorem 1, pp. 1–3 of the HAL version: among demand policies
from a common full initial cache, the policy evicting a page requested furthest in the future,
with any tie-breaking, has the fewest misses. Sleator–Tarjan, §4, p. 207, state the optimality of
this rule, citing Belady. The reduction to demand schedules and the start from the empty cache are
proved here.)

Route. (i) *Demand schedules suffice.* From a schedule `cs` of capacity `h`, build `ds`: on a hit
keep the cache; on a miss with fewer than `h` pages insert the request; on a miss with `h` pages
evict a page of `ds_(t−1) \ cs_t`, which is nonempty since `σ_t ∈ cs_t \ ds_(t−1)` and
`|cs_t| ≤ h`. Charge each miss of `ds` on a page `p` at time `t` to a fetch of `p` by `cs`: if
`ds` last evicted `p` at time `s < t`, then `p ∉ cs_s`, and `p ∈ cs_t`, so `cs` fetched `p` at a
time in `(s, t]`; if `ds` never held `p`, `cs` fetched `p` at some time `≤ t`. Between these two
times `ds` has no other miss on `p`, so the charging is injective and `ds` costs at most `cs`.
(ii) *Cold start.* Add `h` new pages, never requested, as a full initial cache. Demand schedules of
the kind built in (i) correspond to demand policies of the padded problem with the same misses,
inserting into free room being the eviction of a new page; a furthest-in-future schedule
corresponds to a furthest-in-future policy, since a never-requested page has a latest next request.
(iii) Lee et al.'s Theorem 1 gives that this policy has no more misses than any demand policy, so
by (i) its cost is `OPT_h(σ)`; and by induction its caches contain the request and have at most `h`
pages.

**Checks.**

- Ties do not matter: for every sequence of length at most `7` on at most three pages and at most
  `6` on four, and `h ≤ 3`, every tie-breaking of the rule has the same cost, equal to the exact
  optimum computed by dynamic programming over all caches.
- `σ = 1, 2, 3, 1`, `h = 2`: at the request `3` the cache is `{1, 2}`, page `2` is never requested
  again and is evicted, and the cost is `3 = OPT_2`; evicting `1` instead costs `4`.

*Needs:* 2.1.

### Examples

- `OPT_2(1, 2, 3, 1, 2, 3) = 4`: fetch `1, 2`, at `3` evict `2`, at `2` evict `1`.

### Dependencies

2.2 uses 2.1. Layer 2 uses no other layer.

## Layer 3: deterministic online paging

### 3.1 Online rules, LRU and FIFO

Define `onlineCaches A σ` (the caches `A (σ.take (t + 1))`), `onlineCost A σ` (fetches along them,
from `A []`), `lruCache k p` (the `k` most recently requested distinct pages of `p`, as
`(p.dedup.reverse.take k).toFinset`; `List.dedup` keeps last occurrences), `fifoQueue k p` (a hit
leaves the queue, a miss appends the request after dropping the oldest page when the queue has `k`
pages) and `fifoCache k p`, its set of pages. Both start empty and are deterministic online rules
of capacity `k` for `k ≥ 1`: least recently used evicts the cached page whose latest request is
earliest, first-in first-out the page loaded earliest (Sleator–Tarjan, §4, p. 207).

**Checks.**

- `[1, 0, 2, 2, 1].dedup = [0, 2, 1]`, so `lruCache 2 [1, 2, 1, 3] = {3, 1}` and
  `lruCache 2 [1, 2, 1, 3, 2] = {2, 3}`. The variant `(p.reverse.dedup.take k).toFinset` gives
  `{3, 2}` after `[1, 2, 1, 3]`, keeping `2` although `1` was requested more recently.
- `fifoQueue 2 [1, 2, 1, 3, 1] = [3, 1]`. On `1, 2, 1, 3, 1` with `k = 2`, LRU pays `3` and FIFO
  pays `4`: the hit on `1` refreshes it for LRU and not for FIFO.

### 3.2 LRU and FIFO are `k/(k − h + 1)`-competitive

Prove `mul_onlineCost_lruCache_le` and `mul_onlineCost_fifoCache_le`: for `1 ≤ h ≤ k` and every
`σ`, `(k − h + 1) · LRU_k(σ) ≤ k · OPT_h(σ)`, and the same for FIFO. This is the ratio
`k/(k − h + 1)`, equal to `k` for `h = k` and to `1` for `h = 1`
(Sleator–Tarjan, Theorem 6, p. 207, with proof on pp. 207–208, `F_LRU ≤ k/(k − h + 1) · F_MIN + h`
for arbitrary initial memories; the remark on p. 208 that the additive term disappears when LRU
starts with MIN's pages, and the paragraph extending the proof to FIFO, p. 208. The cold-start
form without additive term is proved here along their route.)

Route. Cut `σ` into phases: each phase is the longest segment, starting where the previous one
ended, with at most `k` distinct pages. Let `q` be the number of phases, so every phase but the last
has exactly `k` distinct pages and the first request of each later phase is a new page. *At most `k`
fetches per phase:* within a phase LRU fetches a page at most once, since a second fetch of `p`
needs `k` other distinct pages requested after the first, inside the phase; FIFO also, since `p` is
dropped only after `k` later loads, of pages loaded after `p` and hence still cached, which are `k`
distinct pages of the phase other than `p`. So both pay at most `k(q − 1) + d`, with `d` the number
of distinct pages of the last phase. *The optimum:* a schedule fetches, during a stretch of
requests, at least the number of distinct pages of the stretch not cached at its start. The first
phase with the first request of the second has `k + 1` distinct pages and starts from the empty
cache. Each later phase without its first request, with the first request of the next phase, has `k`
distinct pages other than the first page of the phase, which is cached at the stretch's start; so at
most `h − 1` of them are cached, and at least `k − h + 1` are fetched. The last phase without its
first request has `d − 1` pages other than its first, and at least `max(0, d − h)` are fetched. With
`g = k − h + 1` and `q ≥ 2`, `k · OPT − g (k(q − 1) + d) ≥ k h + k · max(0, d − h) − g d ≥ 0` (check
the two cases `d ≤ h` and `d > h`, using `g ≤ k`); for `q = 1` both pay `d` fetches at least, the
rule exactly `d`.

**Checks.**

- `k = h = 2`, `σ = 1, 2, 3, 1, 2, 3`: LRU and FIFO pay `6`, `OPT_2 = 4`, and `6 ≤ 8`.
- `k = 2`, `h = 1` on the same `σ`: `2 · 6 = 12 = 2 · 6`, an equality.
- `k = 3`, `h = 2`, `σ = 1, 2, 3, 4, 1, 2, 3, 4`: LRU pays `8`, `OPT_2 = 6`, `2 · 8 = 16 ≤ 18`.
- `h ≥ 1` is needed: for `h = 0`, `k ≥ 1` and `σ = 1`, the left side is `(k + 1) · 1` and the right
  side `k · 0`.
- `h ≤ k` is needed: for `k = 1`, `h = 2` the factor `k − h + 1` is `1` in `ℕ`, and on `1, 2, 1, 2`
  LRU and FIFO pay `4` while `OPT_2 = 2`.
- Exhaustive: for every sequence of length at most `8` on at most five pages, and all
  `1 ≤ h ≤ k ≤ 3`, both inequalities hold.

*Needs:* 2.1, 3.1.

### 3.3 No deterministic online rule does better

Prove `exists_onlineCost_ge_and_pagingOpt_le`: let `A` be a deterministic online rule of capacity
`k` (`r ∈ A (p ++ [r])` and `|A p| ≤ k` for every prefix `p` and request `r`), `S` a set of at
least `k + 1` pages and `h ≥ 1`. For every `N` there is `σ` of length `k N` with requests in `S`
such that `onlineCost A σ ≥ k N` and `OPT_h(σ) ≤ (k − h + 1) N + (h − 1)`. Hence, for `h ≤ k`,
for every `c < k/(k − h + 1)` and every constant `b` some `σ` has cost above `c · OPT_h(σ) + b`
(Sleator–Tarjan, Theorem 5, p. 207, by a construction with fresh pages and arbitrary initial
memories; the version on `k + 1` pages from the empty cache, with the spacing lemma below, is
proved here).

Route. Fix `k + 1` pages of `S`. At each step request a page of these not in `A`'s current cache,
which has at most `k` pages; `A` must then fetch it, so it pays at least one per request. For the
optimum, take the furthest-in-future schedule of 2.2 and prove the *spacing lemma*: on a set of
`k + 1` pages, any `g + 1` consecutive misses `f₀ < ⋯ < f_g` of a furthest-in-future schedule at
which its cache is full (each evicts a page), with `g = k + 1 − h`, satisfy `f_g − f₀ ≥ k`.
(It fails when `f₀` may be the miss that fills the cache: `h = k = 2`, `σ = 1, 2, 3`.) Suppose
`f_g − f₀ ≤ k − 1`. First, for each `i < g` the page `y_i` evicted at `f_i` is not requested in
`(f_i, f_g]`: otherwise take the largest such `i`; every page cached before `f_i` is requested by
the time `y_i` is, so the `h` cached pages and `σ_(f_i)` are requested in `[f_i, f_g]`; the `g − i`
misses in `(f_i, f_g]` are on different pages, all among the `g − 1` pages uncached at `f_i` other
than `σ_(f_i)` together with `y_i`, since later evicted pages are not requested before `f_g`, and
at most one of them, `y_i`, is among the `h` cached pages; this gives
`h + 1 + (g − i − 1) = k + 1 − i` distinct pages in the at most `k − i` requests of
`[f_i, f_g]` (as `f_i ≥ f₀ + i`). Then the `g` misses `f₁, …, f_g` are on different pages uncached
just before `f₀` other than `σ_(f₀)`, of which there are only `g − 1`. Now let `h ≤ k` and
`N ≥ 1` (for `N = 0` the sequence is empty). With the lemma, the schedule fills its cache with `h`
misses, the `h`-th at index at least `h − 1`, and then has at most `g` misses in any `k`
consecutive requests. The later misses lie at the indices `h, …, k N − 1`: at most `g` in each of
the `N − 1` stretches of `k` requests and at most `k − h = g − 1` in the remaining `k − h`
indices, so at most `h + g N − 1` misses in all. For `h > k` the bound reads `OPT_h ≤ N + h − 1`
and holds because only `k + 1 ≤ h` pages are requested: for `N ≥ 1` a schedule that never evicts
pays at most `k + 1`.

**Checks.**

- `k = h = 2` against LRU on `{1, 2, 3}`: the construction gives `1, 2, 3, 1, 2, 3` for `N = 3`,
  LRU pays `6 = k N`, and `OPT_2 = 4 = 1 · 3 + 1`.
- `k = 3`, `h = 2`, `N = 2`, `σ = 1, 2, 3, 4, 1, 2`: `OPT_2 = 5 = 2 · 2 + 1`; with `h = 3`,
  `OPT_3 = 4 = 1 · 2 + 2`. The bound is attained.
- `k = 1`, `h = 2`, `N = 2`: the construction gives two different pages, `OPT_2 = 2`, and the bound
  is `1 · 2 + 1 = 3`; the ratio statement is made only for `h ≤ k`.
- Exhaustive: `OPT_h(σ) ≤ (k − h + 1) N + h − 1` for every `σ` of length `k N` on `k + 1` pages,
  `1 ≤ h ≤ k ≤ 3` and `k N ≤ 8`, not only for the sequences of the construction; the spacing lemma
  holds for every tie-breaking and every `1 ≤ h ≤ k ≤ 4` on all sequences on `k + 1` pages of
  length at most `10` for `k ≤ 2`, `9` for `k = 3` and `8` for `k = 4`.

*Needs:* 2.1, 2.2, 3.1.

### Examples

- On `1, 2, 3, 4, 1, 2, 3, 4` with `k = 3`: LRU and FIFO pay `8`, `OPT_3 = 5`, `OPT_2 = 6`.

### Dependencies

3.1 uses 2.1; 3.2 uses 2.1 and 3.1; 3.3 uses 2.1, 2.2 and 3.1.

## Layer 4: randomized paging

### 4.1 Randomized rules and the marking rule

Define `RandomizedPagingRule α` (weights `A hist r c`), `lastCache hist` (the cache after the last
step of the history, `∅` for the empty history), `IsRandomizedPagingRule k A` (each step sums to
`1` over caches, and each cache of positive weight contains the request and has at most `k`
pages), `pathProbFrom A hist σ cs` (the product of the step weights along `σ` with the caches `cs`,
`0` when the lengths differ) and `expectedCost A σ = Σ' cs, pathProbFrom A [] σ cs · fetchCost cs`.

Define `markSet k p` (each request is marked; when `k + 1` pages are marked, all marks but that of
the last request are erased) and `marking k`: on a hit the cache is kept; on a miss with fewer
than `k` pages the request is inserted; on a miss with `k` pages a page is evicted uniformly from
the cached pages left unmarked once the request is marked (Fiat et al., §3, p. 3, where the
servers start on `k` fixed vertices, all marked; here marks and cache start empty). At such a miss
some cached page is unmarked: at most `k` pages are marked, one of them the request, which is not
cached, so at most `k − 1` of the `k` cached pages are marked. On histories the rule does not
produce, a last branch returns `{r}`, so `marking k` is a randomized rule of capacity `k` for every
`k ≥ 1`.

**Checks.**

- `markSet 2 [1, 2, 1, 3, 4] = {3, 4}`: `{1, 2}` grows to three marks at `3` and is reset to `{3}`.
- `k = 1`: the marking rule is deterministic and pays one per change of request, which is
  `OPT_1`.
- `k = 2`, `σ = 1, 2, 3, 1`: the rule pays `2` to fill, `1` at `3` (evicting `1` or `2` with
  probability `1/2` each, both unmarked after the reset), and `1/2` at the final `1`: expected
  cost `7/2`.

### 4.2 The marking rule is `2 H_k`-competitive

Prove `expectedCost_marking_le`: for `k ≥ 1` and every `σ`,
`expectedCost (marking k) σ ≤ 2 H_k · OPT_k(σ)` (Fiat et al., Theorem 1, p. 3, proof pp. 3–5, with
servers initially on `k` fixed vertices and the constant of competitiveness left implicit; the
cold-start form without additive constant is proved here along their route).

Route. Cut `σ` into the marking phases: a new phase begins at each reset of the marks. Let `l_i` be
the number of *clean* pages of phase `i`: pages requested in the phase and not in phase `i − 1` (in
phase `1` every page is clean). The marked pages are always cached, and at the start of a phase
`i ≥ 2` the cache is the set of the `k` pages of phase `i − 1`. In phase `1` the rule pays exactly
the `l_1 ≤ k` distinct pages. In a later phase, the first requests of clean pages cost `l_i`; the
first request of a *stale* page (requested in the previous phase, not yet in this one) misses with
probability at most `c/s` when `c ≤ l_i` clean pages have already been requested in the phase and
`s` stale pages remain unrequested; later requests in the phase are hits. (Fiat et al., p. 4,
assert this inside the proof of Theorem 1; it is proved here.) The rule is a Markov chain on
caches, the sequence being fixed. Since the cache is full from phase `2` on, the unmarked cached
pages are exactly the unrequested stale pages that are cached, and exactly `c` of the `s`
unrequested stale pages are missing. By induction on the requests of the phase, the set `M` of
missing unrequested stale pages is uniformly distributed among the `c`-subsets of the `s`
unrequested stale pages (at the start of the phase `c = 0` and `M = ∅`); write `C(s, c)` for the
binomial coefficient. So a stale request to `x` misses with probability `P(x ∈ M) = c/s`, and
`c ≤ l_i`. The induction step: a clean request evicts a uniform unmarked cached page, which adds to
`M` a uniform element of its complement in the pool; the result is a uniform `(c + 1)`-subset, each
one arising from `c + 1` choices of probability `1/(C(s, c)(s − c))`. A stale request to `x`
removes `x` from the pool: if `x ∉ M`, then `M` stays; if `x ∈ M`, the eviction replaces `x` by a
uniform element of the `s − c` pool pages outside `M`. Each `c`-subset `T` of the new pool then
has probability `1/C(s, c) + c/(C(s, c)(s − c)) = 1/C(s − 1, c)`, again uniform. With
`s = k, k − 1, …, l_i + 1` the phase costs at most `l_i (1 + 1/(l_i + 1) + ⋯ + 1/k) ≤ l_i H_k`, and
in total `E ≤ H_k Σ_i l_i`. For the optimum, use the furthest-in-future schedule of 2.2, which,
like the marking rule, fetches only on misses and holds exactly the `k` pages of phase `1` at the
end of that phase when it is complete. Let `d_i` be the number of its cached pages not cached by
the marking rule at the start of phase `i ≥ 2`, so `d_2 = 0`. In phase `i ≥ 2` it pays at least
`l_i − d_i`, since the clean pages are outside the marking rule's cache at the start. When phase
`i` is complete, with its set `T` of `k` pages, let `d_(i+1)` of its pages lie outside `T` at the
end; they were cached throughout the phase, as it fetches only requested pages, so at most
`k − d_(i+1)` pages of `T` were cached at the start and it pays at least `d_(i+1)`. So it pays at
least `(l_i − d_i + d_(i+1))/2` in each complete phase `i ≥ 2`, at least `(l_i − d_i)/2` in an
incomplete last phase, and `l_1` in phase `1`; after the telescoping, at least `Σ_i l_i / 2`.
Hence `E ≤ 2 H_k · OPT_k`.

**Checks.**

- `k = 2`, `σ = 1, 2, 3, 1`: expected cost `7/2`, `OPT_2 = 3`, `2 H_2 · 3 = 9`.
- `k = 3`, `σ = 1, 2, 3, 4, 1`: expected cost `13/3`, `OPT_3 = 4`, `2 H_3 · 4 = 44/3`.
- `k ≥ 1` is needed: for `k = 0` and `σ = 1`, the last branch gives cost `1`, while
  `OPT_0 = 0` is the junk value.
- Exhaustive, in exact rational arithmetic: the inequality holds for every `σ` of length at most `8`
  on two or three pages, `7` on four and `6` on five, and `k ≤ 3`; the largest ratios found are
  `7/5` for `k = 2` and `29/24` for `k = 3`.

*Needs:* 2.1, 2.2, 4.1.

### 4.3 No randomized rule beats `H_k` against an oblivious adversary

Prove `exists_expectedCost_ge_and_pagingOpt_le`: let `A` be a randomized online paging rule of
capacity `k` and `S` a set of at least `k + 1` pages. For every `N` there is a request sequence
`σ` with requests in `S`, depending on `A` only, such that
`k + H_k · N ≤ expectedCost A σ` and `OPT_k(σ) ≤ k + N`. Hence no randomized rule has expected cost
at most `c · OPT_k + b` on every sequence for any `c < H_k` and any `b` (Fiat et al., Theorem 4,
p. 6, proof pp. 7–8, for `k = n − 1` servers on `n` vertices, and Corollary 5, p. 8, for `k + 1` of
the `n` vertices; the start from the empty cache and rules whose caches may hold fewer than `k`
pages, or pages outside `S`, are handled here).

Route (Fiat et al.'s nemesis sequence). Fix `k + 1` pages of `S`. Request first `k` distinct pages
of them; each is fetched at or before its request, so these are `k` fetches. A miss at a later
request is a fetch of the requested page at that step, so it is none of these `k` fetches, and the
expected cost is at least `k` plus the sum over the later requests of their probabilities of a
miss; fetches of pages before they are requested are counted too and only add to the cost. Then
keep marks as the marking rule does, and let `p_x` be the probability, under `A` on the requests
made, that page `x` is not cached; the sum of `p_x` over the `k + 1` pages is at least `1`, as every
cache, partly empty or holding pages outside `S` or not, contains at most `k` of them. A request to
`x` misses with probability `p_x`, and afterwards `p_x = 0`; the cost of a subphase below is the sum
of `p_x` over its requests. A *subphase*
with `u` unmarked pages adds expected cost at least `1/u` and ends with a request to an unmarked
page: if the marked pages have total `P = 0`, request an unmarked page with `p_x ≥ 1/u`; otherwise
request a marked page with `ε = p_x > 0`, then repeatedly the marked page of largest `p` while
`P > ε` and the cost of the subphase is at most `1/u`, each step adding at least `ε/k`, so that the
loop stops. If the cost then exceeds `1/u`, request any unmarked page; otherwise `P ≤ ε` and the
unmarked page of largest `p` has `p ≥ (1 − P)/u ≥ (1 − ε)/u`, so the subphase costs at least
`ε + (1 − ε)/u ≥ 1/u`. After the first `k` requests one page is unmarked; a subphase with `u = 1`
ends with a reset of the marks, after which `k` pages are unmarked, and every other subphase lowers
`u` by one. So each cycle of `k` subphases has the values `u = 1, k, k − 1, …, 2` (only `u = 1`
for `k = 1`), which give `H_k`, and `N` cycles give `k + H_k N`. The sequence is computed from
the laws of `A` only, so it is fixed before the random choices. For the optimum, every phase
requests at most `k` of the `k + 1` pages; the schedule that, at the first request of a phase,
evicts a page not requested in that phase pays `k` for the first phase and `1` for each of the `N`
later phase starts.

**Checks.**

- `k = 1`: `H_1 = 1`, the construction gives the alternating sequence `1, 2, 1, 2, …` of length
  `N + 1`, every rule pays at least `1 + N` on it, and `OPT_1 = N + 1`.
- `k = 2`, `N = 1`, against the marking rule: the construction gives a sequence of length `4` with
  expected cost `7/2 = 2 + H_2` and `OPT_2 = 3`; for `N = 3` the cost is `13/2` and `OPT_2 = 5`.
- Computed exactly for `k ≤ 3` and `N ≤ 3` against LRU, a rule that keeps only the request, a
  rule with a fixed cache around the request, the marking rule, uniform random eviction, a rule
  that fetches pages before they are requested, and a rule that sometimes keeps only the request
  and otherwise holds a page outside `S` when it has room: in every case the expected cost is at
  least `k + H_k N` and `OPT_k ≤ k + N`.
- `H_k`, not `2 H_k`: the marking rule attains `k + H_k N` exactly on these sequences.

*Needs:* 2.1, 2.2, 4.1.

### Examples

- The marking rule on `1, 2, 3, 1` with `k = 2` has expected cost `7/2`, and on `1, 2, 3, 1, 2` and
  `1, 2, 3, 2, 1` expected cost `9/2`.

### Dependencies

4.1 uses 2.1; 4.2 and 4.3 use 2.1, 2.2 and 4.1.

## Scope and ownership

- This roadmap owns the cost models of list update and paging, the offline optimum `OPT_h`, the
  online rules LRU, FIFO and marking as maps on request prefixes, and the seven targets above.
  Neither the pinned Mathlib nor Tau Ceti has request sequences, caches, self-organizing lists or
  competitive ratios; no roadmap on main states them.
- RegretMinimizationAndEquilibria (on main) has online algorithms over the probability simplex,
  measured by external and swap regret; that is a different object from the competitive ratio
  against an offline optimum, and nothing of it is used here. Regret bounds of online convex
  optimization and mistake bounds of online learning are likewise other measures and are not
  treated here.
- The secretary problem and other online selection problems are not treated here.
- Yao's principle is neither stated nor used: the lower bound 4.3 is proved by a direct
  construction against the law of the rule.
- Not treated here: deletions in list update (requests outside the list act as insertions; only
  1.2 allows them), convex access costs, transpose and frequency count, the `k`-server problem
  beyond paging, weighted paging, the optimal randomized algorithm with ratio `H_k`, adaptive
  adversaries, the combination of several online rules, and rent-or-buy problems.

## Exact supplier contracts

### From Mathlib

- `List.idxOf`, `List.erase`, `List.insertIdx`, `List.take`, `List.dedup`, `List.reverse`,
  `List.foldl`, `List.getLast?`, `List.Forall₂`, `List.range` (core and
  `Mathlib/Data/List/*`), with `List.dedup` keeping the last occurrence of each element
  (`Mathlib/Data/List/Dedup.lean`).
- `Finset` with `insert`, `erase`, `sdiff`, `card`, `List.toFinset`
  (`Mathlib/Data/Finset/Basic.lean`, `Mathlib/Data/Finset/Card.lean`).
- `Nat.sInf_mem`, `Nat.sInf_le` (`Mathlib/Order/Lattice/Nat.lean`) for `listOpt` and `pagingOpt`.
- `harmonic` (`Mathlib/NumberTheory/Harmonic/Defs.lean`), `ENNReal.ofReal`, `tsum` in `ℝ≥0∞`
  (`ENNReal.tsum_mul_left` in `Mathlib/Topology/Algebra/InfiniteSum/ENNReal.lean`, `tsum_add`) for
  the expected costs.

## References

- D. D. Sleator and R. E. Tarjan, *Amortized efficiency of list update and paging rules*,
  Communications of the ACM 28 (1985), no. 2, 202–208, doi:10.1145/2786.2793; read in the copy on
  D. Sleator's page, https://www.cs.cmu.edu/~sleator/papers/amortized-efficiency.pdf. Used: §2,
  p. 203 (cost model, `C_A`, `X_A`, `F_A`); Theorem 1 and the following paragraph, p. 204; §4,
  p. 207 (paging rules, MIN); Theorems 5 and 6, p. 207; the remarks on the additive term and on
  FIFO, p. 208.
- A. Fiat, R. M. Karp, M. Luby, L. A. McGeoch, D. D. Sleator and N. E. Young, *Competitive paging
  algorithms*, Journal of Algorithms 12 (1991), 685–699, doi:10.1016/0196-6774(91)90041-V; read in
  arXiv:cs/0205038v1, whose page numbers are used. Used: §3, the marking algorithm, p. 3;
  Theorem 1, pp. 3–5 (lazy algorithms and the stale-page probability, p. 4); Theorem 4, p. 6,
  with proof pp. 7–8; Corollary 5, p. 8.
- M.-K. Lee, P. Michaud, J. S. Sim and D. Nyang, *A simple proof of optimality for the MIN cache
  replacement policy*, Information Processing Letters 116 (2016), no. 2, 168–170,
  doi:10.1016/j.ipl.2015.09.004; read in the version hal-01199424v1 (HAL), whose numbering and
  page numbers are used. Used: §1 (demand policies, the MIN policy with arbitrary tie-breaking);
  Lemma 1 and Theorem 1, pp. 1–3.
