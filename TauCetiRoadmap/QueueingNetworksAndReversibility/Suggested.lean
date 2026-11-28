import Mathlib
import TauCeti.Probability.Process.MarkovChain

/-!
# Queueing networks and reversibility: target signatures

**This file is not the roadmap.** The roadmap is `README.md`. This file states the roadmap's
headline theorems against the pinned Mathlib and Tau Ceti, each with `sorry`, together with the
few definitions they need; every definition has a real body. Every headline theorem of the README
is statable at the pins and is stated here. The README's Checks and Examples are not restated.

Rates are functions `q : S → S → ℝ≥0∞` on a type `S` with decidable equality; the diagonal is
ignored. A weight function `π : S → ℝ≥0∞` is *balanced* for `q` when the flow into every state
equals the flow out of it (Kelly's equilibrium equations). The pinned libraries have no
continuous-time Markov process on a countable space; balance is therefore a statement about rates,
and path statements are made for the uniformized chain: for out-rates at most `r`, the Markov
kernel `uniformize q r` jumps from `i` to `j ≠ i` with probability `q i j / r`, and its path law is
Tau Ceti's `markovChainLaw`. The continuous-time chain along a finite grid of times is that chain
run at the jumps of an independent Poisson clock, given by independent Poisson counts of its ticks
in the grid intervals. The definitions `IsMetzler`, `IsQMatrix`, `LeadsTo` and
`IsIrreducibleGenerator` are copied verbatim from ContinuousTimeMarkovChains, Layer 1, 1.1;
`pathEval`, `reverseIndex` and `chainPath` are copied verbatim from TimeReversalOfMarkovChains,
Layer 1, 1.1.
-/

noncomputable section

open MeasureTheory ProbabilityTheory Finset TauCeti.Probability
open scoped ENNReal NNReal Matrix

namespace TauCetiRoadmap.QueueingNetworksAndReversibility

/-! ## Layer 1: balance, reversed rates and truncation -/

section Rates

variable {S : Type*} [DecidableEq S]

/-- 1.1 The **total rate out of** `i`: the sum of `q i j` over `j ≠ i`. -/
def outRate (q : S → S → ℝ≥0∞) (i : S) : ℝ≥0∞ :=
  ∑' j, if j = i then 0 else q i j

/-- 1.1 **Global balance**: for every state `j`, the flow `∑_{i ≠ j} π i q i j` into `j` equals
the flow `π j · outRate q j` out of `j`. -/
def IsBalanced (q : S → S → ℝ≥0∞) (π : S → ℝ≥0∞) : Prop :=
  ∀ j, (∑' i, if i = j then 0 else π i * q i j) = π j * outRate q j

/-- 1.1 The **reversed rates** of `q` with respect to the weights `π`:
`reverseRate q π j k = π k * q k j / π j`. -/
def reverseRate (q : S → S → ℝ≥0∞) (π : S → ℝ≥0∞) : S → S → ℝ≥0∞ :=
  fun j k ↦ π k * q k j / π j

/-- 1.1 **Kelly's reversal lemma.** If rates `q'` have the same out-rates as `q` and
`π j * q j k = π k * q' k j` for all `j ≠ k`, then `π` is balanced for `q` and for `q'`. -/
theorem isBalanced_of_reversed (q q' : S → S → ℝ≥0∞) (π : S → ℝ≥0∞)
    (hout : ∀ j, outRate q' j = outRate q j)
    (hrev : ∀ j k, j ≠ k → π j * q j k = π k * q' k j) :
    IsBalanced q π ∧ IsBalanced q' π :=
  sorry

/-- 1.3 The **truncation** of `q` to `A`: the rates between states of `A`, and `0` otherwise. -/
def truncate (q : S → S → ℝ≥0∞) (A : Set S) : S → S → ℝ≥0∞ :=
  fun i j ↦ (A ×ˢ A).indicator (fun p : S × S ↦ q p.1 p.2) (i, j)

/-- 1.3 **Truncation and partial balance.** Let `π` be balanced for `q` and let
`π j · outRate q j < ⊤` for `j ∈ A`. Then the restriction of `π` to `A` is balanced for the
truncated rates if and only if, at every `j ∈ A`, the flow from `j` to the complement of `A`
equals the flow from the complement into `j`. -/
theorem isBalanced_truncate_iff (q : S → S → ℝ≥0∞) (π : S → ℝ≥0∞) (A : Set S)
    (hbal : IsBalanced q π) (hfin : ∀ j ∈ A, π j * outRate q j ≠ ⊤) :
    IsBalanced (truncate q A) (A.indicator π) ↔
      ∀ j ∈ A, π j * ∑' k, Aᶜ.indicator (q j) k = ∑' k, Aᶜ.indicator (fun k ↦ π k * q k j) k :=
  sorry

end Rates

section Generators

variable {S : Type*} [Fintype S] [DecidableEq S]

/-- 1.2 A real square matrix is **Metzler** when its off-diagonal entries are nonnegative.
(Copied verbatim from ContinuousTimeMarkovChains, Layer 1, Q-matrices, 1.1.) -/
def IsMetzler {S : Type*} (B : Matrix S S ℝ) : Prop :=
  ∀ i j, i ≠ j → 0 ≤ B i j

/-- 1.2 A **Q-matrix** (rate matrix, generator) on a finite state space: a Metzler matrix whose
rows sum to zero. (Copied verbatim from ContinuousTimeMarkovChains, Layer 1, Q-matrices, 1.1.) -/
def IsQMatrix (Q : Matrix S S ℝ) : Prop :=
  IsMetzler Q ∧ ∀ i, ∑ j, Q i j = 0

/-- 1.2 State `i` **leads to** state `j` for the matrix `B` when `j` is reached from `i` by a
finite chain of steps `a → b` with `a ≠ b` and `0 < B a b`; every state leads to itself.
(Copied verbatim from ContinuousTimeMarkovChains, Layer 1, Q-matrices, 1.1.) -/
def LeadsTo {S : Type*} (B : Matrix S S ℝ) (i j : S) : Prop :=
  Relation.ReflTransGen (fun a b => a ≠ b ∧ 0 < B a b) i j

/-- 1.2 A matrix is an **irreducible generator** when every state leads to every state.
(Copied verbatim from ContinuousTimeMarkovChains, Layer 1, Q-matrices, 1.1.) -/
def IsIrreducibleGenerator {S : Type*} (B : Matrix S S ℝ) : Prop :=
  ∀ i j, LeadsTo B i j

/-- 1.2 **Balance for a Q-matrix.** For a Q-matrix `Q` on a finite state space and a nonnegative
row vector `p`, the weights `p` are balanced for the rates `Q i j` (`i ≠ j`) if and only if
`p Q = 0`. -/
theorem isBalanced_ofReal_iff_vecMul_eq_zero {Q : Matrix S S ℝ} (hQ : IsQMatrix Q)
    {p : S → ℝ} (hp : ∀ i, 0 ≤ p i) :
    IsBalanced (fun i j ↦ ENNReal.ofReal (Q i j)) (fun i ↦ ENNReal.ofReal (p i)) ↔
      p ᵥ* Q = 0 :=
  sorry

end Generators

/-! ## Layer 2: product-form networks -/

section Open

variable {J : ℕ}

/-- 2.1 The rates of an **open migration process** (Jackson network) on `Fin J → ℕ`: a customer
moves from colony `j` to colony `k ≠ j` at rate `lam j k * φ j (n j)`, leaves the network from
`j` at rate `μ j * φ j (n j)` (both only when `n j > 0`), and enters colony `k` from outside at
rate `ν k`. -/
def jacksonRate (lam : Fin J → Fin J → ℝ≥0) (μ ν : Fin J → ℝ≥0) (φ : Fin J → ℕ → ℝ≥0)
    (n m : Fin J → ℕ) : ℝ≥0∞ :=
  (∑ j, ∑ k, if j ≠ k ∧ 0 < n j ∧
      m = Function.update (Function.update n j (n j - 1)) k (n k + 1)
    then ((lam j k * φ j (n j) : ℝ≥0) : ℝ≥0∞) else 0) +
  (∑ j, if 0 < n j ∧ m = Function.update n j (n j - 1)
    then ((μ j * φ j (n j) : ℝ≥0) : ℝ≥0∞) else 0) +
  ∑ k, if m = Function.update n k (n k + 1) then ((ν k : ℝ≥0) : ℝ≥0∞) else 0

/-- 2.1 The **weight of colony `j` holding `n` customers**: `∏_{r = 1}^{n} α j / φ j r`. -/
def nodeWeight (α : Fin J → ℝ≥0) (φ : Fin J → ℕ → ℝ≥0) (j : Fin J) (n : ℕ) : ℝ≥0∞ :=
  ∏ r ∈ Icc 1 n, ((α j / φ j r : ℝ≥0) : ℝ≥0∞)

/-- 2.1 The **product weight** of a state: `∏_j nodeWeight α φ j (n j)`. -/
def jacksonWeight (α : Fin J → ℝ≥0) (φ : Fin J → ℕ → ℝ≥0) (n : Fin J → ℕ) : ℝ≥0∞ :=
  ∏ j, nodeWeight α φ j (n j)

/-- 2.1 The **product-form law**: the product weights divided by their sum, as a measure on the
states. -/
def jacksonLaw (α : Fin J → ℝ≥0) (φ : Fin J → ℕ → ℝ≥0) : Measure (Fin J → ℕ) :=
  Measure.sum fun n ↦ (jacksonWeight α φ n / ∑' m, jacksonWeight α φ m) • Measure.dirac n

/-- 2.1 **Jackson's theorem for open migration processes.** Let `φ j r ≠ 0` for `r ≥ 1` and let
`α` solve the traffic equations `α j (μ j + ∑_{k ≠ j} lam j k) = ν j + ∑_{k ≠ j} α k lam k j`.
Then (a) the product weights are balanced; (b) if every colony's weights have a finite sum, the
product-form law is a probability measure, it gives the state `n` the mass
`∏_j nodeWeight α φ j (n j) / ∑_m nodeWeight α φ j m` (the colonies are independent), and it is
balanced. -/
theorem isBalanced_jacksonWeight (lam : Fin J → Fin J → ℝ≥0) (μ ν : Fin J → ℝ≥0)
    (φ : Fin J → ℕ → ℝ≥0) (α : Fin J → ℝ≥0) (hφ : ∀ j r, 1 ≤ r → φ j r ≠ 0)
    (htraffic : ∀ j, α j * (μ j + ∑ k ∈ univ.erase j, lam j k) =
      ν j + ∑ k ∈ univ.erase j, α k * lam k j) :
    IsBalanced (jacksonRate lam μ ν φ) (jacksonWeight α φ) ∧
    ((∀ j, ∑' n, nodeWeight α φ j n ≠ ⊤) →
      IsProbabilityMeasure (jacksonLaw α φ) ∧
      (∀ n, jacksonLaw α φ {n} = ∏ j, nodeWeight α φ j (n j) / ∑' m, nodeWeight α φ j m) ∧
      IsBalanced (jacksonRate lam μ ν φ) fun n ↦ jacksonLaw α φ {n}) :=
  sorry

/-- 2.1 **The reversed open network.** Let `φ j r ≠ 0` for `r ≥ 1` and `α j ≠ 0` for every `j`;
no traffic equations are assumed. For `n ≠ m`, the reversed rates of the open migration process
with respect to the product weights are the rates of the open migration process with routing
`α k lam k j / α j`, exit rates `ν j / α j` and entry rates `α k μ k`. -/
theorem reverseRate_jacksonRate (lam : Fin J → Fin J → ℝ≥0) (μ ν : Fin J → ℝ≥0)
    (φ : Fin J → ℕ → ℝ≥0) (α : Fin J → ℝ≥0) (hφ : ∀ j r, 1 ≤ r → φ j r ≠ 0)
    (hα : ∀ j, α j ≠ 0) (n m : Fin J → ℕ) (hnm : n ≠ m) :
    reverseRate (jacksonRate lam μ ν φ) (jacksonWeight α φ) n m =
      jacksonRate (fun j k ↦ α k * lam k j / α j) (fun j ↦ ν j / α j) (fun k ↦ α k * μ k) φ n m :=
  sorry

end Open

section Closed

variable {J : ℕ}

/-- 2.2 The rates of a **closed migration process**: a customer moves from colony `j` to colony
`k ≠ j` at rate `lam j k * φ j (n j)` when `n j > 0`. -/
def closedRate (lam : Matrix (Fin J) (Fin J) ℝ) (φ : Fin J → ℕ → ℝ) (n m : Fin J → ℕ) : ℝ :=
  ∑ j, ∑ k, if j ≠ k ∧ 0 < n j ∧
      m = Function.update (Function.update n j (n j - 1)) k (n k + 1)
    then lam j k * φ j (n j) else 0

/-- 2.2 The **states of a closed network** with `J` colonies and `N` customers. -/
abbrev ClosedState (J N : ℕ) := {n : Fin J → ℕ // n ∈ Finset.Nat.antidiagonalTuple J N}

/-- 2.2 The **generator of a closed migration process** on its finite state space. -/
def closedGenerator (lam : Matrix (Fin J) (Fin J) ℝ) (φ : Fin J → ℕ → ℝ) (N : ℕ) :
    Matrix (ClosedState J N) (ClosedState J N) ℝ :=
  fun n m ↦ closedRate lam φ n m -
    if n = m then ∑ m' : ClosedState J N, closedRate lam φ n m' else 0

/-- 2.2 The **product weight** `∏_j α j ^ n j / ∏_{r = 1}^{n j} φ j r`. -/
def closedWeight (α : Fin J → ℝ) (φ : Fin J → ℕ → ℝ) (n : Fin J → ℕ) : ℝ :=
  ∏ j, α j ^ n j / ∏ r ∈ Icc 1 (n j), φ j r

/-- 2.2 The **normalising constant** `G(N)`: the sum of the product weights over the states with
`N` customers. -/
def normalizingConstant (α : Fin J → ℝ) (φ : Fin J → ℕ → ℝ) (N : ℕ) : ℝ :=
  ∑ n ∈ Finset.Nat.antidiagonalTuple J N, closedWeight α φ n

/-- 2.2 The **Gordon–Newell law** with `N` customers: `closedWeight α φ n / G(N)` on the states
with `N` customers, and `0` elsewhere. -/
def closedLaw (α : Fin J → ℝ) (φ : Fin J → ℕ → ℝ) (N : ℕ) (n : Fin J → ℕ) : ℝ :=
  if n ∈ Finset.Nat.antidiagonalTuple J N then
    closedWeight α φ n / normalizingConstant α φ N else 0

/-- 2.3 The **mean number of customers** in colony `j` under the Gordon–Newell law. -/
def meanCount (α : Fin J → ℝ) (φ : Fin J → ℕ → ℝ) (N : ℕ) (j : Fin J) : ℝ :=
  ∑ n ∈ Finset.Nat.antidiagonalTuple J N, closedLaw α φ N n * n j

/-- 2.2 **The Gordon–Newell theorem.** Let `J ≥ 1`, let the routing matrix `lam` be Metzler and
irreducible, let `φ j r > 0` for `r ≥ 1`, and let `α` be positive with
`α j ∑_{k ≠ j} lam j k = ∑_{k ≠ j} α k lam k j`. Then for every `N` the generator of the closed
network with `N` customers is an irreducible Q-matrix, and its unique stationary probability vector
is the Gordon–Newell law. -/
theorem stationary_iff_eq_closedLaw [NeZero J] {lam : Matrix (Fin J) (Fin J) ℝ}
    (hlam : IsMetzler lam) (hirr : IsIrreducibleGenerator lam) {φ : Fin J → ℕ → ℝ}
    (hφ : ∀ j r, 1 ≤ r → 0 < φ j r)
    {α : Fin J → ℝ} (hα : ∀ j, 0 < α j)
    (htraffic : ∀ j, α j * ∑ k ∈ univ.erase j, lam j k = ∑ k ∈ univ.erase j, α k * lam k j)
    (N : ℕ) :
    IsQMatrix (closedGenerator lam φ N) ∧ IsIrreducibleGenerator (closedGenerator lam φ N) ∧
      ∀ π : ClosedState J N → ℝ,
        ((∀ n, 0 ≤ π n) ∧ ∑ n, π n = 1 ∧ π ᵥ* closedGenerator lam φ N = 0) ↔
          π = fun n ↦ closedLaw α φ N n.1 :=
  sorry

/-- 2.3 **The generating function of the normalising constants**: for all real `α` and `φ`, the
power series `∑_N G(N) zᴺ` is the product over the colonies of
`∑_n α j ^ n / ∏_{r ≤ n} φ j r · zⁿ`. -/
theorem powerSeries_mk_normalizingConstant (α : Fin J → ℝ) (φ : Fin J → ℕ → ℝ) :
    PowerSeries.mk (normalizingConstant α φ) =
      ∏ j, PowerSeries.mk (fun n ↦ α j ^ n / ∏ r ∈ Icc 1 n, φ j r) :=
  sorry

/-- 2.3 **The arrival theorem for closed networks.** For positive `α`, `φ j r > 0` (`r ≥ 1`) and
`N ≥ 1`, the Gordon–Newell law at `m + e_j`, weighted by the rate `φ j (m j + 1)` at which colony
`j` serves, is `α j G(N − 1) / G(N)` times the law with `N − 1` customers at `m`. -/
theorem closedLaw_add_single_mul {α : Fin J → ℝ} (hα : ∀ j, 0 < α j) {φ : Fin J → ℕ → ℝ}
    (hφ : ∀ j r, 1 ≤ r → 0 < φ j r) {N : ℕ} (hN : 1 ≤ N) (j : Fin J) (m : Fin J → ℕ) :
    closedLaw α φ N (m + Pi.single j 1) * φ j (m j + 1) =
      α j * normalizingConstant α φ (N - 1) / normalizingConstant α φ N *
        closedLaw α φ (N - 1) m :=
  sorry

/-- 2.3 **Mean values for single servers.** For positive `α`, `φ = 1` and `N ≥ 1`, the mean numbers
satisfy `L_j(N) = α j (1 + L_j(N − 1)) G(N − 1) / G(N)` and
`G(N − 1) / G(N) = N / ∑_k α k (1 + L_k(N − 1))`. -/
theorem meanCount_recursion {α : Fin J → ℝ} (hα : ∀ j, 0 < α j) {φ : Fin J → ℕ → ℝ}
    (hφ : ∀ j r, φ j r = 1) {N : ℕ} (hN : 1 ≤ N) (j : Fin J) :
    meanCount α φ N j = α j * (1 + meanCount α φ (N - 1) j) *
        normalizingConstant α φ (N - 1) / normalizingConstant α φ N ∧
      normalizingConstant α φ (N - 1) / normalizingConstant α φ N =
        N / ∑ k, α k * (1 + meanCount α φ (N - 1) k) :=
  sorry

end Closed

/-! ## Layer 3: uniformized time and output theorems -/

section Paths

variable {E : Type*} [MeasurableSpace E]

/-- 3.1 Evaluation of a path at time `i ≤ n`. (Copied verbatim from TimeReversalOfMarkovChains,
Layer 1, 1.1.) -/
def pathEval {n : ℕ} (i : ℕ) (hi : i ≤ n) (x : Π _ : Iic n, E) : E := x ⟨i, mem_Iic.2 hi⟩

/-- 3.1 Time reversal of a path up to time `T`: `(reverseIndex T x) i = x (T - i)`. (Copied
verbatim from TimeReversalOfMarkovChains, Layer 1, 1.1.) -/
def reverseIndex (T : ℕ) (x : Π _ : Iic T, E) : Π _ : Iic T, E :=
  fun i ↦ x ⟨T - i, mem_Iic.2 (Nat.sub_le _ _)⟩

/-- 3.1 The path law up to time `T` of the chain with initial law `μ` and kernels `P`: the
state at time `0` is drawn from `μ`, and the state at time `n + 1` from `P n` at the state at
time `n`. (Copied verbatim from TimeReversalOfMarkovChains, Layer 1, 1.1.) -/
def chainPath (μ : Measure E) (P : ℕ → Kernel E E) (T : ℕ) : Measure (Π _ : Iic T, E) :=
  Kernel.partialTraj (X := fun _ ↦ E)
      (fun n ↦ (P n).comap (pathEval n le_rfl) (measurable_pi_apply _)) 0 T ∘ₘ
    μ.map (fun x (_ : Iic 0) ↦ x)

end Paths

section Uniformized

variable {S : Type*} [DecidableEq S] [MeasurableSpace S] [MeasurableSingletonClass S]
  [Countable S]

/-- 3.1 The **uniformized kernel** of the rates `q` at rate `r`: from `i` it jumps to `j ≠ i`
with probability `q i j / r` and stays at `i` with probability `1 - outRate q i / r`. -/
def uniformize (q : S → S → ℝ≥0∞) (r : ℝ≥0∞) : Kernel S S :=
  Kernel.ofFunOfCountable fun i ↦
    Measure.sum fun j ↦ (if j = i then 1 - outRate q i / r else q i j / r) • Measure.dirac j

/-- 3.1 **The uniformized chain.** Let `r < ⊤` bound every out-rate. Then the uniformized kernel is
a Markov kernel; a measure `π` with finite masses at points is invariant for it if and only if
its point masses are balanced for `q`; and if moreover `π` is finite and positive at every point
and balanced, then for every horizon `T` the stationary uniformized chain read backwards is the
stationary uniformized chain of the reversed rates (through TimeReversalOfMarkovChains 2.1,
`chainPath_map_reverseIndex_of_invariant`). -/
theorem uniformize_markov_invariant_reverse (q : S → S → ℝ≥0∞) {r : ℝ≥0∞} (hr : r ≠ ⊤)
    (hq : ∀ i, outRate q i ≤ r) :
    IsMarkovKernel (uniformize q r) ∧
    ∀ π : Measure S, (∀ i, π {i} ≠ ⊤) →
      ((uniformize q r).Invariant π ↔ IsBalanced q fun i ↦ π {i}) ∧
      (IsFiniteMeasure π → (∀ i, π {i} ≠ 0) → IsBalanced q (fun i ↦ π {i}) → ∀ T,
        (chainPath π (fun _ ↦ uniformize q r) T).map (reverseIndex T) =
          chainPath π (fun _ ↦ uniformize (reverseRate q fun i ↦ π {i}) r) T) :=
  sorry

/-- 3.2 The **reversed output condition** for a classification `mark` of the steps of a chain
into classes `c` with probabilities `p c`: for every class `c` and every state `x`, the
stationary flow into `x` through steps of class `c` is `p c * π {x}`. -/
def IsReversedOutput {C : Type*} [DecidableEq C] (π : Measure S) (K : Kernel S S)
    (mark : S → S → C) (p : C → ℝ≥0∞) : Prop :=
  ∀ c x, ∑' y, (if mark y x = c then π {y} * K y {x} else 0) = p c * π {x}

/-- 3.2 **The discrete output theorem.** Under the reversed output condition, the classes of the
first `T` steps of the chain started from `π` and its state at time `T` have the joint law
`(∏_k p (w k)) * π {x}`: the classes are independent with law `p`, and independent of the state
at time `T`. -/
theorem markovChainLaw_marks_eq {C : Type*} [DecidableEq C] (K : Kernel S S) [IsMarkovKernel K]
    (π : Measure S) [SFinite π] (mark : S → S → C) (p : C → ℝ≥0∞)
    (h : IsReversedOutput π K mark p) (T : ℕ) (w : Fin T → C) (x : S) :
    markovChainLaw π K {ω | (∀ k : Fin T, mark (ω k.val) (ω (k.val + 1)) = w k) ∧ ω T = x} =
      (∏ k, p (w k)) * π {x} :=
  sorry

end Uniformized

section Exits

variable {J : ℕ}

/-- 3.3 The **exit class** of a step `y → x` of an open migration process: `some j` if it removes
a customer from colony `j` (the customer leaves the network), and `none` otherwise. -/
def exitMark (y x : Fin J → ℕ) : Option (Fin J) :=
  if h : ∃ j, 0 < y j ∧ x = Function.update y j (y j - 1) then
    some (Fin.find (fun j ↦ 0 < y j ∧ x = Function.update y j (y j - 1)) h)
  else none

/-- 3.3 The **exit probabilities** of one uniformized step: `α j * μ j / r` for an exit from `j`,
and `1 - ∑_k ν k / r` for no exit. -/
def exitProb (α μ ν : Fin J → ℝ≥0) (r : ℝ≥0∞) (c : Option (Fin J)) : ℝ≥0∞ :=
  c.elim (1 - (∑ k, (ν k : ℝ≥0∞)) / r) fun j ↦ (α j * μ j : ℝ≥0) / r

/-- 3.3 **Exits from a Jackson network in uniformized time.** Under the hypotheses of 2.1 (the
service functions nonzero at positive counts, the traffic equations), for every `r` bounding all
out-rates, the product-form law, the uniformized kernel and the exit classes satisfy the reversed
output condition with the exit probabilities. -/
theorem isReversedOutput_jackson (lam : Fin J → Fin J → ℝ≥0) (μ ν : Fin J → ℝ≥0)
    (φ : Fin J → ℕ → ℝ≥0) (α : Fin J → ℝ≥0) (hφ : ∀ j r, 1 ≤ r → φ j r ≠ 0)
    (htraffic : ∀ j, α j * (μ j + ∑ k ∈ univ.erase j, lam j k) =
      ν j + ∑ k ∈ univ.erase j, α k * lam k j)
    {r : ℝ≥0∞} (hq : ∀ n, outRate (jacksonRate lam μ ν φ) n ≤ r) :
    IsReversedOutput (jacksonLaw α φ) (uniformize (jacksonRate lam μ ν φ) r) exitMark
      (exitProb α μ ν r) :=
  sorry

end Exits

section Clock

variable {S : Type*} [DecidableEq S] [MeasurableSpace S] [MeasurableSingletonClass S]
  [Countable S]

/-- 3.4 The number of steps of class `c` among the steps `a, a + 1, …, b - 1` of the path `ω`. -/
def classCount {C : Type*} [DecidableEq C] (mark : S → S → C) (ω : ℕ → S) (a b : ℕ) (c : C) :
    ℕ :=
  ((Finset.Ico a b).filter fun k ↦ mark (ω k) (ω (k + 1)) = c).card

/-- 3.4 **The output theorem in continuous time.** Run the chain started from the probability
measure `π` at the ticks of an independent rate-`r` Poisson clock, observed on consecutive time
intervals of lengths `s 0, …, s (m - 1)`: the numbers of ticks in the intervals are independent
Poisson counts with means `r * s i`. Under the reversed output condition, the numbers of steps of
each class in each interval and the state at the end are independent; the count of class `c` in
interval `i` is Poisson with mean `p c * r * s i`. -/
theorem prod_pi_poisson_classCount_eq {C : Type*} [Fintype C] [DecidableEq C] (K : Kernel S S)
    [IsMarkovKernel K] (π : Measure S) [IsProbabilityMeasure π] (mark : S → S → C)
    (p : C → ℝ≥0) (h : IsReversedOutput π K mark fun c ↦ p c) (r : ℝ≥0) {m : ℕ}
    (s : Fin m → ℝ≥0) (d : Fin m → C → ℕ) (x : S) :
    ((markovChainLaw π K).prod (Measure.pi fun i ↦ poissonMeasure (r * s i)))
        {ωM | (∀ i c, classCount mark ωM.1 (∑ l ∈ Iio i, ωM.2 l) (∑ l ∈ Iic i, ωM.2 l) c =
            d i c) ∧ ωM.1 (∑ i, ωM.2 i) = x} =
      (∏ i, ∏ c, poissonMeasure (p c * (r * s i)) {d i c}) * π {x} :=
  sorry

end Clock

end TauCetiRoadmap.QueueingNetworksAndReversibility

end
