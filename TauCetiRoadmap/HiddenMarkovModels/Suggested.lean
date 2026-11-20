import Mathlib
import TauCeti.Probability.Kernel.PMF
import TauCeti.Probability.Process.MarkovChain

/-!
# Hidden Markov models: target signatures

**This file is not the roadmap.** The roadmap is `README.md`. This file states the roadmap's
headline theorems against the pinned Mathlib and Tau Ceti, each with `sorry`, together with the
definitions they need; every definition has a real body. Every headline theorem of the README is
statable at the pins and is stated here. The README's remaining targets, API lists and Checks are
not restated.

Suppliers used by the README and not restated here: Mathlib `Kernel.compProd`, `Measure.compProd`,
`Kernel.ofFunOfCountable`, `Measure.pi`, `condDistrib`, `condDistrib_ae_eq_of_measure_eq_compProd`,
`ProbabilityTheory.posterior`, `posterior_eq_withDensity_of_countable`, `ENNReal.log`,
`ENNReal.log_mul_add`, `ENNReal.log_strictMono`, `ConcaveOn.le_map_sum`,
`StrictConcaveOn.map_sum_eq_iff` and `strictConcaveOn_log_Ioi`; Tau Ceti `Kernel.ofPMF`,
`TauCeti.Probability.markovChainLaw`, `TauCeti.Probability.markovChainLaw_map_eval_zero`,
`TauCeti.Probability.markovChainLaw_map_prefix_succ_eq_compProd` and
`MeasureTheory.Measure.eq_markovChainLaw`.
-/

noncomputable section

open MeasureTheory ProbabilityTheory Finset Matrix
open scoped NNReal ENNReal

namespace TauCetiRoadmap.HiddenMarkovModels

/-- 1.1: a hidden Markov model with hidden states `S` and observations in `Y`: the initial law,
the transition law of each state, a reference measure on `Y`, and for each state the density of
its emission law with respect to the reference measure. -/
structure HMM (S Y : Type*) [MeasurableSpace Y] where
  init : PMF S
  trans : S → PMF S
  ref : Measure Y
  dens : S → Y → ℝ≥0
  measurable_dens : ∀ s, Measurable (dens s)
  lintegral_dens : ∀ s, ∫⁻ y, (dens s y : ℝ≥0∞) ∂ref = 1

namespace HMM

variable {S Y : Type*} [MeasurableSpace Y]

/-- 1.1: the model with a discrete observation space, counting reference measure and emission
laws given as probability mass functions. -/
def ofPMF [DiscreteMeasurableSpace Y] (init : PMF S) (trans : S → PMF S) (emit : S → PMF Y) :
    HMM S Y where
  init := init
  trans := trans
  ref := Measure.count
  dens s y := (emit s y).toNNReal
  measurable_dens _ := Measurable.of_discrete
  lintegral_dens s := by
    rw [lintegral_count]
    simp only [ENNReal.coe_toNNReal ((emit s).apply_ne_top _)]
    exact (emit s).tsum_coe

variable (M : HMM S Y)

/-! ## Layer 1: the model and its path law -/

/-- 1.1: the joint density at a state path `x` and an observation sequence `y` up to time `n`:
`init (x 0) * dens (x 0) (y 0) * ∏ t < n, trans (x t) (x (t + 1)) * dens (x (t + 1)) (y (t + 1))`. -/
def jointDensity (x : ℕ → S) (y : ℕ → Y) (n : ℕ) : ℝ≥0∞ :=
  M.init (x 0) * M.dens (x 0) (y 0) *
    ∏ t ∈ range n, (M.trans (x t) (x (t + 1)) * M.dens (x (t + 1)) (y (t + 1)))

section Law

variable [MeasurableSpace S] [DiscreteMeasurableSpace S] [Countable S]

/-- 1.2: the transition kernel on the hidden states. -/
abbrev transKernel : Kernel S S := Kernel.ofPMF M.trans

/-- 1.2: the emission kernel `s ↦ ref.withDensity (dens s)`. -/
def emitKernel : Kernel S Y :=
  Kernel.ofFunOfCountable fun s ↦ M.ref.withDensity fun y ↦ (M.dens s y : ℝ≥0∞)

/-- 1.2: the emission kernel is a Markov kernel. -/
instance : IsMarkovKernel M.emitKernel :=
  ⟨fun s ↦ ⟨by
    change (M.ref.withDensity fun y ↦ (M.dens s y : ℝ≥0∞)) Set.univ = 1
    rw [withDensity_apply _ MeasurableSet.univ, Measure.restrict_univ, M.lintegral_dens s]⟩⟩

/-- 1.2: the transition kernel of the pair process: from `(s, y)` draw the next state from
`trans s`, then its observation from the emission law of the new state. -/
def pairKernel : Kernel (S × Y) (S × Y) :=
  (M.transKernel.comap Prod.fst measurable_fst) ⊗ₖ (M.emitKernel.comap Prod.snd measurable_snd)

/-- 1.2: the pair kernel is a Markov kernel. -/
instance : IsMarkovKernel M.pairKernel := by
  unfold pairKernel; infer_instance

/-- 1.2: the law of the pair process `(X n, Y n)` on path space: the homogeneous Markov chain
with initial law `init ⊗ₘ emitKernel` and transition kernel `pairKernel`. -/
def jointLaw : Measure (ℕ → S × Y) :=
  TauCeti.Probability.markovChainLaw (M.init.toMeasure ⊗ₘ M.emitKernel) M.pairKernel

/-- 1.2: the path law is a probability measure. -/
instance : IsProbabilityMeasure M.jointLaw := by
  unfold jointLaw; infer_instance

/-- 1.2: the hidden process is the Markov chain with initial law `init` and kernel
`transKernel`. -/
theorem jointLaw_map_states :
    M.jointLaw.map (fun ω n ↦ (ω n).1) =
      TauCeti.Probability.markovChainLaw M.init.toMeasure M.transKernel :=
  sorry

/-- 1.2: given the hidden states up to time `n`, the observations up to time `n` are independent
and the `i`-th has the emission law of the `i`-th state. -/
theorem jointLaw_map_prefix (n : ℕ) :
    M.jointLaw.map (fun ω ↦ ((fun i : Fin (n + 1) ↦ (ω i).1), fun i : Fin (n + 1) ↦ (ω i).2)) =
      (M.jointLaw.map fun ω (i : Fin (n + 1)) ↦ (ω i).1) ⊗ₘ
        Kernel.ofFunOfCountable fun x ↦ Measure.pi fun i ↦ M.emitKernel (x i) :=
  sorry

/-- 1.3: the state path up to time `n` and the observations up to time `n` lie in `{x} × B` with
probability the integral over `B` of the joint density at `x`. -/
theorem jointLaw_prefix_apply [SigmaFinite M.ref] (n : ℕ) (x : ℕ → S)
    {B : Set (Fin (n + 1) → Y)} (hB : MeasurableSet B) :
    M.jointLaw {ω | (∀ i ≤ n, (ω i).1 = x i) ∧ (fun i : Fin (n + 1) ↦ (ω i).2) ∈ B} =
      ∫⁻ w in B, M.jointDensity x (fun i ↦ w (Fin.clamp i n)) n ∂Measure.pi fun _ ↦ M.ref :=
  sorry

end Law

/-! ## Layer 2: filtering and prediction -/

/-- 2.1: the forward variable `α t s`, the density of the observations up to time `t` jointly
with the event that the state at time `t` is `s`. -/
def forward (y : ℕ → Y) : ℕ → S → ℝ≥0∞
  | 0 => fun s ↦ M.init s * M.dens s (y 0)
  | t + 1 => fun s' ↦ (∑' s, forward y t s * M.trans s s') * M.dens s' (y (t + 1))

/-- 2.1: the likelihood of the observations up to time `n`. -/
def likelihood (y : ℕ → Y) (n : ℕ) : ℝ≥0∞ := ∑' s, M.forward y n s

/-- 2.2: the filter, the normalized forward variable. -/
def filter (y : ℕ → Y) (t : ℕ) (s : S) : ℝ≥0∞ := M.forward y t s / M.likelihood y t

/-- 2.2: the normalizer of the filter recursion at time `t`. -/
def normalizer (y : ℕ → Y) : ℕ → ℝ≥0∞
  | 0 => M.likelihood y 0
  | t + 1 => ∑' s', (∑' s, M.filter y t s * M.trans s s') * M.dens s' (y (t + 1))

/-- 2.1: the forward variable is the sum of the joint density over the state paths that end
in `s`. -/
theorem forward_eq_tsum (y : ℕ → Y) (t : ℕ) (s : S) :
    M.forward y t s =
      ∑' x : {x : Fin (t + 1) → S // x (Fin.last t) = s},
        M.jointDensity (fun i ↦ x.1 (Fin.clamp i t)) y t :=
  sorry

/-- 2.1: the likelihood as a matrix product: the row vector `init * dens · (y 0)`, times the
product over `t < n` of the transition matrix times the diagonal matrix of `dens · (y (t + 1))`,
summed over the final state. -/
theorem likelihood_eq_matrix [Fintype S] [DecidableEq S] (y : ℕ → Y) (n : ℕ) :
    M.likelihood y n =
      ((fun s ↦ M.init s * M.dens s (y 0)) ᵥ*
        (List.ofFn fun t : Fin n ↦ (Matrix.of fun s s' ↦ (M.trans s s' : ℝ≥0∞)) *
          Matrix.diagonal fun s ↦ (M.dens s (y (t + 1)) : ℝ≥0∞)).prod) ⬝ᵥ 1 :=
  sorry

/-- 2.2: the normalized filter recursion: predict with the transition law, weight by the density
of the new observation, normalize. -/
theorem filter_succ (y : ℕ → Y) (t : ℕ) (ht : M.likelihood y t ≠ ⊤) (s' : S) :
    M.filter y (t + 1) s' =
      (∑' s, M.filter y t s * M.trans s s') * M.dens s' (y (t + 1)) / M.normalizer y (t + 1) :=
  sorry

/-- 2.2: the likelihood is the product of the normalizers. -/
theorem likelihood_eq_prod_normalizer (y : ℕ → Y) (n : ℕ)
    (h : ∀ t < n, M.likelihood y t ≠ ⊤) :
    M.likelihood y n = ∏ t ∈ range (n + 1), M.normalizer y t :=
  sorry

section Law

variable [MeasurableSpace S] [DiscreteMeasurableSpace S] [Countable S]

/-- 2.1: the observations up to time `n` have density `likelihood · n` with respect to the
product of the reference measure. -/
theorem jointLaw_map_obs [SigmaFinite M.ref] (n : ℕ) :
    M.jointLaw.map (fun ω (i : Fin (n + 1)) ↦ (ω i).2) =
      (Measure.pi fun _ : Fin (n + 1) ↦ M.ref).withDensity
        fun w ↦ M.likelihood (fun i ↦ w (Fin.clamp i n)) n :=
  sorry

/-- 2.3: the filter is the conditional law of the state at time `t` given the observations up
to time `t`. -/
theorem condDistrib_state_eq_filter [Nonempty S] (t : ℕ) (s : S) :
    ∀ᵐ ω ∂M.jointLaw,
      condDistrib (fun ω ↦ (ω t).1) (fun ω (i : Fin (t + 1)) ↦ (ω i).2) M.jointLaw
          (fun i ↦ (ω i).2) {s} =
        M.filter (fun i ↦ (ω i).2) t s :=
  sorry

/-- 2.3: prediction: the conditional law of the state at time `t + k` given the observations up
to time `t` is the filter at time `t` moved `k` steps by the transition kernel. -/
theorem condDistrib_state_eq_predict [Nonempty S] (t k : ℕ) (s' : S) :
    ∀ᵐ ω ∂M.jointLaw,
      condDistrib (fun ω ↦ (ω (t + k)).1) (fun ω (i : Fin (t + 1)) ↦ (ω i).2) M.jointLaw
          (fun i ↦ (ω i).2) {s'} =
        ∑' s, M.filter (fun i ↦ (ω i).2) t s * (M.transKernel ^ k) s {s'} :=
  sorry

end Law

/-! ## Layer 3: smoothing -/

/-- 3.1: the backward variable `β`: `backward y t k s` is the density of the `k` observations
after time `t` given that the state at time `t` is `s`. -/
def backward (y : ℕ → Y) (t : ℕ) : ℕ → S → ℝ≥0∞
  | 0 => fun _ ↦ 1
  | k + 1 => fun s ↦ ∑' s', M.trans s s' * M.dens s' (y (t + 1)) * backward y (t + 1) k s'

/-- 3.2: the marginal smoothing law at time `t ≤ n` given the observations up to time `n`. -/
def smooth (y : ℕ → Y) (n t : ℕ) (s : S) : ℝ≥0∞ :=
  M.forward y t s * M.backward y t (n - t) s / M.likelihood y n

/-- 3.2: the pairwise smoothing law of the states at times `t` and `t + 1`, for `t < n`, given
the observations up to time `n`. -/
def smoothPair (y : ℕ → Y) (n t : ℕ) (s s' : S) : ℝ≥0∞ :=
  M.forward y t s * M.trans s s' * M.dens s' (y (t + 1)) * M.backward y (t + 1) (n - (t + 1)) s' /
    M.likelihood y n

/-- 3.1: the forward–backward identity. -/
theorem tsum_forward_mul_backward (y : ℕ → Y) (t k : ℕ) :
    ∑' s, M.forward y t s * M.backward y t k s = M.likelihood y (t + k) :=
  sorry

section Law

variable [MeasurableSpace S] [DiscreteMeasurableSpace S] [Countable S]

/-- 3.2: the posterior law of the state path: given the observations up to time `n`, the hidden
path follows `x` up to time `n` with conditional probability
`jointDensity x y n / likelihood y n`. -/
theorem condDistrib_states_cylinder [Nonempty S] (n : ℕ) (x : ℕ → S) :
    ∀ᵐ ω ∂M.jointLaw,
      condDistrib (fun ω i ↦ (ω i).1) (fun ω (i : Fin (n + 1)) ↦ (ω i).2) M.jointLaw
          (fun i ↦ (ω i).2) {x' : ℕ → S | ∀ i ≤ n, x' i = x i} =
        M.jointDensity x (fun i ↦ (ω i).2) n / M.likelihood (fun i ↦ (ω i).2) n :=
  sorry

/-- 3.2: `smooth` is the conditional law of the state at time `t ≤ n` given the observations up
to time `n`. -/
theorem condDistrib_state_eq_smooth [Nonempty S] {n t : ℕ} (ht : t ≤ n) (s : S) :
    ∀ᵐ ω ∂M.jointLaw,
      condDistrib (fun ω ↦ (ω t).1) (fun ω (i : Fin (n + 1)) ↦ (ω i).2) M.jointLaw
          (fun i ↦ (ω i).2) {s} =
        M.smooth (fun i ↦ (ω i).2) n t s :=
  sorry

/-- 3.2: `smoothPair` is the conditional law of the states at times `t` and `t + 1`, for
`t < n`, given the observations up to time `n`. -/
theorem condDistrib_pair_eq_smoothPair [Nonempty S] {n t : ℕ} (ht : t < n) (s s' : S) :
    ∀ᵐ ω ∂M.jointLaw,
      condDistrib (fun ω ↦ ((ω t).1, (ω (t + 1)).1)) (fun ω (i : Fin (n + 1)) ↦ (ω i).2)
          M.jointLaw (fun i ↦ (ω i).2) {(s, s')} =
        M.smoothPair (fun i ↦ (ω i).2) n t s s' :=
  sorry

end Law

/-! ## Layer 4: decoding -/

/-- 4.1: the Viterbi variable `δ t s` in the max-product form. -/
def viterbi (y : ℕ → Y) : ℕ → S → ℝ≥0∞
  | 0 => fun s ↦ M.init s * M.dens s (y 0)
  | t + 1 => fun s' ↦ (⨆ s, viterbi y t s * M.trans s s') * M.dens s' (y (t + 1))

/-- 4.1: the Viterbi variable in the max-sum form, with values in `EReal`. -/
def viterbiLog (y : ℕ → Y) : ℕ → S → EReal
  | 0 => fun s ↦ ENNReal.log (M.init s) + ENNReal.log (M.dens s (y 0))
  | t + 1 => fun s' ↦
      (⨆ s, viterbiLog y t s + ENNReal.log (M.trans s s')) + ENNReal.log (M.dens s' (y (t + 1)))

/-- 4.2: `x` is a Viterbi path up to time `n`: its state at time `n` maximizes `δ n`, and its
state at each time `t < n` maximizes `s ↦ δ t s * trans s (x (t + 1))`. -/
def IsViterbiPath (y : ℕ → Y) (n : ℕ) (x : ℕ → S) : Prop :=
  (∀ s, M.viterbi y n s ≤ M.viterbi y n (x n)) ∧
    ∀ t < n, ∀ s, M.viterbi y t s * M.trans s (x (t + 1)) ≤
      M.viterbi y t (x t) * M.trans (x t) (x (t + 1))

/-- 4.1: the Viterbi variable is the supremum of the joint density over the state paths that
are at `s` at time `t`. -/
theorem viterbi_eq_iSup (y : ℕ → Y) (t : ℕ) (s : S) :
    M.viterbi y t s = ⨆ x : {x : ℕ → S // x t = s}, M.jointDensity x y t :=
  sorry

/-- 4.1: the max-sum recursion computes the logarithm of the max-product one. -/
theorem viterbiLog_eq (y : ℕ → Y) (t : ℕ) (s : S) :
    M.viterbiLog y t s = ENNReal.log (M.viterbi y t s) :=
  sorry

/-- 4.2: a Viterbi path maximizes the joint density over all state paths, and its joint density
is the largest value of the Viterbi variable at the final time. -/
theorem IsViterbiPath.isGreatest {y : ℕ → Y} {n : ℕ} {x : ℕ → S} (h : M.IsViterbiPath y n x) :
    IsGreatest (Set.range fun x' : ℕ → S ↦ M.jointDensity x' y n) (M.jointDensity x y n) ∧
      M.jointDensity x y n = ⨆ s, M.viterbi y n s :=
  sorry

/-- 4.2: on a finite state space a Viterbi path exists. -/
theorem exists_isViterbiPath [Finite S] (y : ℕ → Y) (n : ℕ) : ∃ x, M.IsViterbiPath y n x :=
  sorry

/-- 4.2: a maximizer of the joint density with a positive value is a Viterbi path. -/
theorem isViterbiPath_of_isGreatest {y : ℕ → Y} {n : ℕ} {x : ℕ → S}
    (h : IsGreatest (Set.range fun x' : ℕ → S ↦ M.jointDensity x' y n) (M.jointDensity x y n))
    (hpos : 0 < M.jointDensity x y n) :
    M.IsViterbiPath y n x :=
  sorry

/-! ## Layer 5: Baum–Welch estimation -/

/-- 5.1: Baum's auxiliary function `Q(M, M') = Σ_x p_M(x, y) log p_M'(x, y)`, the sum over the
state paths up to time `n`. -/
def auxiliary [Fintype S] (M M' : HMM S Y) (y : ℕ → Y) (n : ℕ) : ℝ :=
  ∑ x : Fin (n + 1) → S, (M.jointDensity (fun i ↦ x (Fin.clamp i n)) y n).toReal *
    Real.log (M'.jointDensity (fun i ↦ x (Fin.clamp i n)) y n).toReal

/-- 5.2: the expected number of transitions from `s` to `s'` before time `n`, given the
observations up to time `n`. -/
def transCount (y : ℕ → Y) (n : ℕ) (s s' : S) : ℝ≥0∞ :=
  ∑ t ∈ range n, M.smoothPair y n t s s'

/-- 5.2: the expected number of times `t ≤ n` at which the state is `s` and the observation is
`v`, given the observations up to time `n`. -/
def emitCount [DecidableEq Y] (y : ℕ → Y) (n : ℕ) (s : S) (v : Y) : ℝ≥0∞ :=
  ∑ t ∈ range (n + 1) with y t = v, M.smooth y n t s

/-- 5.2: `M'` is a Baum–Welch update of `M` for the observations `y` up to time `n`: each row of
`M'` times the total expected count of that row is the expected count. -/
def IsBaumWelchStep [Fintype S] [Fintype Y] [DecidableEq Y] (M M' : HMM S Y) (y : ℕ → Y)
    (n : ℕ) : Prop :=
  (∀ s, M'.init s * ∑ s₀, M.smooth y n 0 s₀ = M.smooth y n 0 s) ∧
    (∀ s s', M'.trans s s' * ∑ s'', M.transCount y n s s'' = M.transCount y n s s') ∧
      ∀ s v, M'.dens s v * ∑ v', M.emitCount y n s v' = M.emitCount y n s v

/-- 5.1: Baum's inequality: if every state path with positive joint density under `M` has
positive joint density under `M'`, the gain in the auxiliary function bounds the gain in
log-likelihood. -/
theorem auxiliary_sub_le [Fintype S] (M M' : HMM S Y) (y : ℕ → Y) (n : ℕ)
    (hac : ∀ x : ℕ → S, M.jointDensity x y n ≠ 0 → M'.jointDensity x y n ≠ 0) :
    auxiliary M M' y n - auxiliary M M y n ≤
      (M.likelihood y n).toReal *
        (Real.log (M'.likelihood y n).toReal - Real.log (M.likelihood y n).toReal) :=
  sorry

/-- 5.2: the M-step: a Baum–Welch update `M'` of `M` keeps positive every path that is positive
under `M`, and maximizes the auxiliary function among the models with emission mass functions
that do so. -/
theorem auxiliary_le_of_isBaumWelchStep [Fintype S] [Fintype Y] [DecidableEq Y]
    [DiscreteMeasurableSpace Y] {M M' : HMM S Y} {y : ℕ → Y} {n : ℕ}
    (h : IsBaumWelchStep M M' y n) :
    (∀ x : ℕ → S, M.jointDensity x y n ≠ 0 → M'.jointDensity x y n ≠ 0) ∧
      ∀ (init : PMF S) (trans : S → PMF S) (emit : S → PMF Y),
        (∀ x : ℕ → S, M.jointDensity x y n ≠ 0 →
          (ofPMF init trans emit).jointDensity x y n ≠ 0) →
        auxiliary M (ofPMF init trans emit) y n ≤ auxiliary M M' y n :=
  sorry

/-- 5.3: a Baum–Welch update does not decrease the likelihood, and if the likelihood does not
increase then the model satisfies the update equations itself. -/
theorem likelihood_le_of_isBaumWelchStep [Fintype S] [Fintype Y] [DecidableEq Y]
    [DiscreteMeasurableSpace Y] (init : PMF S) (trans : S → PMF S) (emit : S → PMF Y)
    {M' : HMM S Y} {y : ℕ → Y} {n : ℕ}
    (h : IsBaumWelchStep (ofPMF init trans emit) M' y n) :
    (ofPMF init trans emit).likelihood y n ≤ M'.likelihood y n ∧
      ((ofPMF init trans emit).likelihood y n = M'.likelihood y n →
        IsBaumWelchStep (ofPMF init trans emit) (ofPMF init trans emit) y n) :=
  sorry

/-! ## Layer 6: forgetting of the initial law -/

/-- 6.1: contraction under a minorization condition: if every row of `K` dominates `ε * ρ`, then
`ν ↦ ν.bind K` contracts the distance `∑' s, |ν s - ν' s|` by the factor `1 - ε`. -/
theorem tsum_abs_bind_sub_le (ν ν' : PMF S) (K : S → PMF S) (ρ : PMF S) {ε : ℝ≥0∞}
    (hmin : ∀ s s', ε * ρ s' ≤ K s s') :
    ∑' s', |((ν.bind K) s').toReal - ((ν'.bind K) s').toReal| ≤
      (1 - ε.toReal) * ∑' s, |(ν s).toReal - (ν' s).toReal| :=
  sorry

/-- 6.2: filter stability. Two models with the same transition laws and densities, whose
transition laws are bounded below by `ε * ρ` and above by `ε⁻¹ * ρ` for a probability mass
function `ρ`, have filters whose distance contracts by `1 - ε ^ 2` per step, up to the factor
`ε⁻¹ ^ 2`. -/
theorem tsum_abs_filter_sub_le (M M' : HMM S Y) (htrans : M'.trans = M.trans)
    (hdens : M'.dens = M.dens) (ρ : PMF S) {ε : ℝ≥0∞} (hε : ε ≠ 0)
    (hmix : ∀ s s', ε * ρ s' ≤ M.trans s s' ∧ M.trans s s' ≤ ε⁻¹ * ρ s')
    (y : ℕ → Y) {l k : ℕ} (hlk : l ≤ k)
    (hpos : M.likelihood y l ≠ 0) (hfin : M.likelihood y l ≠ ⊤)
    (hpos' : M'.likelihood y l ≠ 0) (hfin' : M'.likelihood y l ≠ ⊤) :
    ∑' s, |(M.filter y k s).toReal - (M'.filter y k s).toReal| ≤
      (ε.toReal⁻¹) ^ 2 * (1 - ε.toReal ^ 2) ^ (k - l) *
        ∑' s, |(M.filter y l s).toReal - (M'.filter y l s).toReal| :=
  sorry

end HMM

end TauCetiRoadmap.HiddenMarkovModels
