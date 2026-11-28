import Mathlib

/-!
# Competitive analysis of paging and list update: target signatures

**This file is not the roadmap.** The roadmap is `README.md`. This file states the roadmap's
headline theorems against the pinned Mathlib, each with `sorry`, together with the few
definitions they need; every definition has a real body. Every headline theorem of the README is
statable at the pins and is stated here.

Everything is a statement about request sequences, sequences of lists or caches and their costs.
A list-update schedule is a sequence of actions (paid adjacent exchanges, then an access, then a
free forward move of the accessed item); its costs are the access cost (the position of the item,
counted from `1`), the number of paid exchanges and the number of free exchanges. A paging
schedule for a request sequence is a sequence of caches, each containing its request and of size
at most the capacity, started from the empty cache; its cost is the number of fetches. A
deterministic online paging rule is a map from request prefixes to caches; a randomized one gives
the probability weight of each next cache as a function of the history and the new request.
-/

noncomputable section

open scoped ENNReal

namespace TauCetiRoadmap.CompetitiveAnalysisOfPagingAndListUpdate

variable {α : Type*} [DecidableEq α]

/-! ## Layer 1: list update -/

section Layer1

/-- 1.1 Exchange the entries at positions `i` and `i + 1` (counted from `0`); the list is
unchanged when position `i + 1` does not exist. -/
def swapAdj : List α → ℕ → List α
  | a :: b :: l, 0 => b :: a :: l
  | a :: l, n + 1 => a :: swapAdj l n
  | l, _ => l

/-- 1.1 Move the item `r` forward by `j` places (to the front if `j` is at least its position). -/
def moveForward (L : List α) (r : α) (j : ℕ) : List α :=
  (L.erase r).insertIdx (L.idxOf r - j) r

/-- 1.1 The costs `(C, X, F)` of serving `σ` from the list `L` with the actions `acts`: at time
`t` the action `acts t = (sw, j)` performs the paid exchanges `swapAdj · i` for `i` in `sw`, then
accesses the request at cost its position counted from `1`, then moves it forward by `j` places.
`C` is the total access cost, `X` the number of paid exchanges and `F` the number of free
exchanges actually made. -/
def listCosts : List α → List α → (ℕ → List ℕ × ℕ) → ℕ × ℕ × ℕ
  | _, [], _ => (0, 0, 0)
  | L, r :: σ, acts =>
    let L₁ := (acts 0).1.foldl swapAdj L
    let i := L₁.idxOf r
    let rest := listCosts (moveForward L₁ r (acts 0).2) σ (fun t => acts (t + 1))
    (i + 1 + rest.1, (acts 0).1.length + rest.2.1, min (acts 0).2 i + rest.2.2)

/-- 1.1 The cost of move-to-front on `σ` from the list `L`: access cost only, the accessed item
being moved to the front by free exchanges. -/
def mtfCost : List α → List α → ℕ
  | _, [] => 0
  | L, r :: σ => L.idxOf r + 1 + mtfCost (r :: L.erase r) σ

/-- 1.1 The offline optimum of list update: the least total cost `C + X` (free exchanges are
free) over all action sequences. -/
def listOpt (L σ : List α) : ℕ :=
  sInf {n | ∃ acts : ℕ → List ℕ × ℕ, (listCosts L σ acts).1 + (listCosts L σ acts).2.1 = n}

/-- 1.2 Sleator–Tarjan: for every list `L`, every request sequence `σ` and every action sequence
(offline or online), move-to-front satisfies `C_MF + F + m ≤ 2 C + X`, where `C, X, F` are the
access cost, paid and free exchanges of the action sequence and `m` is the length of `σ`.
Sleator–Tarjan's setting, `L` without repetitions and requests in `L`, is a special case; with
repetitions both sides act on the first occurrence of the request, and a request outside the list
is inserted by both. -/
theorem mtfCost_add_free_add_length_le (L σ : List α) (acts : ℕ → List ℕ × ℕ) :
    mtfCost L σ + (listCosts L σ acts).2.2 + σ.length ≤
      2 * (listCosts L σ acts).1 + (listCosts L σ acts).2.1 := by
  sorry

/-- 1.3 The deterministic lower bound for list update: for every nonempty list `L` of `n`
distinct items and every deterministic online rule (the action at time `t` a function of the
first `t + 1` requests), for every `m` there is a request sequence of length `m` on which the
rule pays at least `n m`, while `2 · OPT ≤ (n + 1) m + n (n − 1)`. -/
theorem exists_listCost_ge_and_two_mul_listOpt_le {L : List α} (hL : L.Nodup) (hne : L ≠ [])
    (rule : List α → List ℕ × ℕ) (m : ℕ) :
    ∃ σ : List α, σ.length = m ∧ (∀ r ∈ σ, r ∈ L) ∧
      L.length * m ≤ (listCosts L σ (fun t => rule (σ.take (t + 1)))).1 +
        (listCosts L σ (fun t => rule (σ.take (t + 1)))).2.1 ∧
      2 * listOpt L σ ≤ (L.length + 1) * m + L.length * (L.length - 1) := by
  sorry

end Layer1

/-! ## Layer 2: paging schedules and the offline optimum -/

section Layer2

/-- 2.1 The number of fetches along the caches `cs`, started from the cache `p`: the sum over
consecutive caches of the number of pages of the new cache absent from the previous one. -/
def fetchCostFrom : Finset α → List (Finset α) → ℕ
  | _, [] => 0
  | p, c :: cs => (c \ p).card + fetchCostFrom c cs

/-- 2.1 The number of fetches along `cs` from the empty cache. -/
def fetchCost (cs : List (Finset α)) : ℕ :=
  fetchCostFrom ∅ cs

/-- 2.1 `cs` is a schedule of capacity `h` for `σ`: one cache per request, each containing its
request and of size at most `h`. -/
def IsSchedule (h : ℕ) (σ : List α) (cs : List (Finset α)) : Prop :=
  List.Forall₂ (fun r c => r ∈ c ∧ c.card ≤ h) σ cs

/-- 2.1 The offline optimum `OPT_h(σ)`: the least number of fetches of a schedule of capacity
`h` for `σ` from the empty cache. For `h = 0` and `σ ≠ []` there is no schedule and the value is
the junk value `0`. -/
def pagingOpt (h : ℕ) (σ : List α) : ℕ :=
  sInf {n | ∃ cs, IsSchedule h σ cs ∧ fetchCost cs = n}

/-- 2.2 `cs` is a furthest-in-future schedule of capacity `h` for `σ` from the cache `C`: a hit
keeps the cache, a miss with room inserts the request, and a miss with a full cache evicts a
cached page whose next request (`List.idxOf`, the length of the rest when there is none) is the
latest among the cached pages. Ties are arbitrary. -/
def IsFurthestInFuture (h : ℕ) : Finset α → List α → List (Finset α) → Prop
  | _, [], [] => True
  | C, r :: σ, c :: cs =>
    (if r ∈ C then c = C
      else if C.card < h then c = insert r C
      else ∃ q ∈ C, (∀ q' ∈ C, σ.idxOf q' ≤ σ.idxOf q) ∧ c = insert r (C.erase q)) ∧
    IsFurthestInFuture h c σ cs
  | _, _, _ => False

/-- 2.2 Belady: every furthest-in-future schedule from the empty cache is a schedule of
capacity `h` whose number of fetches is the offline optimum `OPT_h(σ)`. -/
theorem isSchedule_and_fetchCost_eq_pagingOpt {h : ℕ} {σ : List α} {cs : List (Finset α)}
    (hcs : IsFurthestInFuture h ∅ σ cs) :
    IsSchedule h σ cs ∧ fetchCost cs = pagingOpt h σ := by
  sorry

end Layer2

/-! ## Layer 3: deterministic online paging -/

section Layer3

/-- 3.1 The caches of a deterministic online rule `A : List α → Finset α` along `σ`: after the
`t`-th request the cache is `A` of the first `t + 1` requests. -/
def onlineCaches (A : List α → Finset α) (σ : List α) : List (Finset α) :=
  (List.range σ.length).map fun t => A (σ.take (t + 1))

/-- 3.1 The cost of the rule `A` on `σ`: the number of fetches along its caches, started from
its cache `A []` on the empty prefix. -/
def onlineCost (A : List α → Finset α) (σ : List α) : ℕ :=
  fetchCostFrom (A []) (onlineCaches A σ)

/-- 3.1 Least recently used with capacity `k` from the empty cache: after the prefix `p` the
cache holds the `k` most recently requested distinct pages (`List.dedup` keeps last
occurrences). -/
def lruCache (k : ℕ) (p : List α) : Finset α :=
  (p.dedup.reverse.take k).toFinset

/-- 3.1 The first-in first-out queue of capacity `k` from the empty queue: a hit leaves it, a
miss appends the request, after dropping the oldest page when the queue is full. -/
def fifoQueue (k : ℕ) (p : List α) : List α :=
  p.foldl (fun q r => if r ∈ q then q else if q.length < k then q ++ [r] else q.tail ++ [r]) []

/-- 3.1 The first-in first-out cache of capacity `k` after the prefix `p`. -/
def fifoCache (k : ℕ) (p : List α) : Finset α :=
  (fifoQueue k p).toFinset

/-- 3.2 Sleator–Tarjan for LRU, from the empty cache: for `1 ≤ h ≤ k`,
`(k − h + 1) · LRU_k(σ) ≤ k · OPT_h(σ)`. -/
theorem mul_onlineCost_lruCache_le {h k : ℕ} (hh : 1 ≤ h) (hhk : h ≤ k) (σ : List α) :
    (k - h + 1) * onlineCost (lruCache k) σ ≤ k * pagingOpt h σ := by
  sorry

/-- 3.2 Sleator–Tarjan for FIFO, from the empty cache: for `1 ≤ h ≤ k`,
`(k − h + 1) · FIFO_k(σ) ≤ k · OPT_h(σ)`. -/
theorem mul_onlineCost_fifoCache_le {h k : ℕ} (hh : 1 ≤ h) (hhk : h ≤ k) (σ : List α) :
    (k - h + 1) * onlineCost (fifoCache k) σ ≤ k * pagingOpt h σ := by
  sorry

/-- 3.3 The deterministic lower bound: let `A` be a deterministic online rule of capacity `k`
(its cache after a prefix contains the last request and has at most `k` pages), `S` a set of at
least `k + 1` pages and `h ≥ 1`. For every `N` there is a request sequence of length `k N`
with requests in `S` on which `A` pays at least `k N`, while `OPT_h ≤ (k − h + 1) N + (h − 1)`. -/
theorem exists_onlineCost_ge_and_pagingOpt_le {k h : ℕ} (A : List α → Finset α)
    (hmem : ∀ p r, r ∈ A (p ++ [r])) (hcard : ∀ p, (A p).card ≤ k) (S : Finset α)
    (hS : k + 1 ≤ S.card) (hh : 1 ≤ h) (N : ℕ) :
    ∃ σ : List α, σ.length = k * N ∧ (∀ r ∈ σ, r ∈ S) ∧ k * N ≤ onlineCost A σ ∧
      pagingOpt h σ ≤ (k - h + 1) * N + (h - 1) := by
  sorry

end Layer3

/-! ## Layer 4: randomized paging -/

section Layer4

/-- 4.1 A randomized online paging rule: `A hist r c` is the probability that the next cache is
`c`, given the history `hist` (the earlier requests with the caches after them) and the new
request `r`. -/
abbrev RandomizedPagingRule (α : Type*) := List (α × Finset α) → α → Finset α → ℝ≥0∞

/-- 4.1 The cache at the end of a history; the empty cache for the empty history. -/
def lastCache (hist : List (α × Finset α)) : Finset α :=
  (hist.getLast?.map Prod.snd).getD ∅

/-- 4.1 `A` is a randomized online paging rule of capacity `k`: each step is a probability
distribution on caches, and every cache of positive probability contains the request and has at
most `k` pages. -/
def IsRandomizedPagingRule (k : ℕ) (A : RandomizedPagingRule α) : Prop :=
  ∀ hist r, (∑' c, A hist r c) = 1 ∧ ∀ c, A hist r c ≠ 0 → r ∈ c ∧ c.card ≤ k

/-- 4.1 The probability that `A`, continuing the history `hist`, answers the requests `σ` with the
caches `cs` (zero when the lengths differ). -/
def pathProbFrom (A : RandomizedPagingRule α) :
    List (α × Finset α) → List α → List (Finset α) → ℝ≥0∞
  | _, [], [] => 1
  | hist, r :: σ, c :: cs => A hist r c * pathProbFrom A (hist ++ [(r, c)]) σ cs
  | _, _, _ => 0

/-- 4.1 The expected number of fetches of `A` on `σ`, from the empty cache. -/
def expectedCost (A : RandomizedPagingRule α) (σ : List α) : ℝ≥0∞ :=
  ∑' cs : List (Finset α), pathProbFrom A [] σ cs * (fetchCost cs : ℝ≥0∞)

/-- 4.1 The marked pages after the requests `p`: each request is marked, and when `k + 1` pages
are marked all marks but the last request's are erased. -/
def markSet (k : ℕ) (p : List α) : Finset α :=
  p.foldl (fun M r => if k < (insert r M).card then {r} else insert r M) ∅

/-- 4.1 The marking rule of capacity `k`: a hit keeps the cache; a miss with room inserts the
request; a miss with a full cache evicts a page chosen uniformly among the cached pages that are
unmarked once the request is marked. (For `k ≥ 1` the last branch is reached only by histories the
rule does not produce; it keeps the rule a randomized rule of capacity `k` on every history.) -/
def marking (k : ℕ) : RandomizedPagingRule α := fun hist r c =>
  let C := lastCache hist
  let U := C \ markSet k (hist.map Prod.fst ++ [r])
  if r ∈ C ∧ C.card ≤ k then (if c = C then 1 else 0)
  else if C.card < k then (if c = insert r C then 1 else 0)
  else if C.card = k ∧ U.Nonempty then
    ∑ q ∈ U, if c = insert r (C.erase q) then (U.card : ℝ≥0∞)⁻¹ else 0
  else if c = {r} then 1 else 0

/-- 4.2 Fiat–Karp–Luby–McGeoch–Sleator–Young: from the empty cache, for `k ≥ 1`, the expected
cost of the marking rule is at most `2 H_k · OPT_k(σ)` on every request sequence. -/
theorem expectedCost_marking_le {k : ℕ} (hk : 1 ≤ k) (σ : List α) :
    expectedCost (marking k) σ ≤ 2 * ENNReal.ofReal (harmonic k) * pagingOpt k σ := by
  sorry

/-- 4.3 The randomized lower bound against an oblivious adversary: for every randomized online
paging rule `A` of capacity `k` and every set `S` of at least `k + 1` pages, for every `N` there
is a request sequence with requests in `S`, fixed in advance, on which the expected cost of `A`
is at least `k + H_k N` while `OPT_k ≤ k + N`. -/
theorem exists_expectedCost_ge_and_pagingOpt_le {k : ℕ} {A : RandomizedPagingRule α}
    (hA : IsRandomizedPagingRule k A) (S : Finset α) (hS : k + 1 ≤ S.card) (N : ℕ) :
    ∃ σ : List α, (∀ r ∈ σ, r ∈ S) ∧
      (k : ℝ≥0∞) + ENNReal.ofReal (harmonic k) * N ≤ expectedCost A σ ∧
      pagingOpt k σ ≤ k + N := by
  sorry

end Layer4

end TauCetiRoadmap.CompetitiveAnalysisOfPagingAndListUpdate
