import Mathlib
import TauCeti.Analysis.ODE.DysonSeries

/-!
# Time reversal of Markov chains: target signatures

**This file is not the roadmap.** The roadmap is `README.md`. This file states the roadmap's
headline theorems against the pinned Mathlib and Tau Ceti, each with `sorry`, together with the
few definitions they need; every definition has a real body. Every headline theorem of the README
is statable at the pins and is stated here. The README's remaining targets, API lists and Checks
are not restated.

Discrete time: the state space `E` is a measurable space, standard Borel and nonempty wherever a
posterior kernel occurs (Mathlib's `ProbabilityTheory.posterior`, written `κ†μ`, needs this of
its source space). A chain is a family `P : ℕ → Kernel E E` of Markov kernels, `P n` moving the
chain from time `n` to time `n + 1`; its path law up to time `T` is built with Mathlib's
`Kernel.partialTraj` on `Π i : Iic T, E`.

Continuous time: the state space is a finite type `S`, matrices are real, rows index the
starting state, and a distribution is a row vector `p : S → ℝ` evolving as `p ᵥ* M`. The
propagator of a rate function `Q : ℝ → Matrix S S ℝ` is Tau Ceti's Dyson series
`TauCeti.dysonSeries`, taken in the operator norm `Matrix.linftyOpNormedRing`; only its values
appear in the statements. Its composition law is that of the propagator of
DiracScatteringAndNonlinearFourierTransform, Layer 1 (1.3), through the identification of
README 3.1, and is not restated. The definitions `IsMetzler` and `IsQMatrix` are copied verbatim
from ContinuousTimeMarkovChains, Layer 1, Q-matrices (1.1); `pathEval` and `reverseIndex` are
copied verbatim from DenoisingDiffusion, where `E` is `EuclideanSpace ℝ (Fin d)`; here `E` is any
measurable space.
-/

noncomputable section

open MeasureTheory ProbabilityTheory Finset Matrix

namespace TauCetiRoadmap.TimeReversalOfMarkovChains

/-! ## Layer 1: path laws of chains with time-dependent kernels and their reversal -/

section Discrete

variable {E : Type*} [MeasurableSpace E]

/-- 1.1 Evaluation of a path at time `i ≤ n`. (Copied verbatim from DenoisingDiffusion,
Conventions, paths.) -/
def pathEval {n : ℕ} (i : ℕ) (hi : i ≤ n) (x : Π _ : Iic n, E) : E := x ⟨i, mem_Iic.2 hi⟩

/-- 1.1 Time reversal of a path up to time `T`: `(reverseIndex T x) i = x (T - i)`. (Copied
verbatim from DenoisingDiffusion, Layer 4, the variational bound.) -/
def reverseIndex (T : ℕ) (x : Π _ : Iic T, E) : Π _ : Iic T, E :=
  fun i ↦ x ⟨T - i, mem_Iic.2 (Nat.sub_le _ _)⟩

/-- 1.1 The path law up to time `T` of the chain with initial law `μ` and kernels `P`: the
state at time `0` is drawn from `μ`, and the state at time `n + 1` from `P n` at the state at
time `n`. -/
def chainPath (μ : Measure E) (P : ℕ → Kernel E E) (T : ℕ) : Measure (Π _ : Iic T, E) :=
  Kernel.partialTraj (X := fun _ ↦ E)
      (fun n ↦ (P n).comap (pathEval n le_rfl) (measurable_pi_apply _)) 0 T ∘ₘ
    μ.map (fun x (_ : Iic 0) ↦ x)

/-- 1.1 The marginal laws of the chain: `chainMarginal μ P 0 = μ` and
`chainMarginal μ P (t + 1) = P t ∘ₘ chainMarginal μ P t`. -/
def chainMarginal (μ : Measure E) (P : ℕ → Kernel E E) : ℕ → Measure E
  | 0 => μ
  | t + 1 => P t ∘ₘ chainMarginal μ P t

/-- 1.1 The marginals of a finite initial law under Markov kernels are finite. -/
instance isFiniteMeasure_chainMarginal (μ : Measure E) [IsFiniteMeasure μ]
    (P : ℕ → Kernel E E) [∀ n, IsMarkovKernel (P n)] (t : ℕ) :
    IsFiniteMeasure (chainMarginal μ P t) := by
  induction t with
  | zero => simpa [chainMarginal]
  | succ t ih => simp only [chainMarginal]; infer_instance

variable [StandardBorelSpace E] [Nonempty E]

/-- 1.2 The kernels of the reversed chain up to horizon `T`: the step from reversed time `n` to
`n + 1` (forward time `T - n` to `T - n - 1`) is the posterior of `P (T - n - 1)` under the
marginal at time `T - n - 1`. -/
def reversedKernel (μ : Measure E) [IsFiniteMeasure μ] (P : ℕ → Kernel E E)
    [∀ n, IsMarkovKernel (P n)] (T n : ℕ) : Kernel E E :=
  (P (T - n - 1))†(chainMarginal μ P (T - n - 1))

/-- 1.2 **The reverse Markov property.** Read backwards, the chain with initial law `μ` and
kernels `P` is the chain started at its marginal at time `T` whose kernels are the posteriors
(Bayes reversals) of the forward kernels under the forward marginals. -/
theorem chainPath_map_reverseIndex (μ : Measure E) [IsFiniteMeasure μ]
    (P : ℕ → Kernel E E) [∀ n, IsMarkovKernel (P n)] (T : ℕ) :
    (chainPath μ P T).map (reverseIndex T) =
      chainPath (chainMarginal μ P T) (reversedKernel μ P T) T :=
  sorry

omit [StandardBorelSpace E] [Nonempty E] in
/-- 1.3 **Bayes' formula at an atom.** If the law `κ ∘ₘ μ` of the data gives positive mass to
the point `x`, the posterior at `x` gives the point `ω` the mass
`μ {ω} * κ ω {x} / (κ ∘ₘ μ) {x}`. -/
theorem posterior_apply_singleton_eq_div {Ω : Type*} [MeasurableSpace Ω] [StandardBorelSpace Ω]
    [Nonempty Ω] (κ : Kernel Ω E) [IsFiniteKernel κ] (μ : Measure Ω) [IsFiniteMeasure μ]
    [MeasurableSingletonClass E] {x : E} (hx : (κ ∘ₘ μ) {x} ≠ 0) (ω : Ω) :
    (κ†μ) x {ω} = μ {ω} * κ ω {x} / (κ ∘ₘ μ) {x} :=
  sorry

/-! ## Layer 2: stationary chains and reversibility -/

/-- 2.1 **The stationary reversed chain.** If `π` is invariant for `κ`, the stationary chain
read backwards is the stationary chain of the posterior kernel `κ†π`. -/
theorem chainPath_map_reverseIndex_of_invariant (κ : Kernel E E) [IsMarkovKernel κ]
    (π : Measure E) [IsFiniteMeasure π] (hκ : κ.Invariant π) (T : ℕ) :
    (chainPath π (fun _ ↦ κ) T).map (reverseIndex T) = chainPath π (fun _ ↦ κ†π) T :=
  sorry

/-- 2.2 **Reversibility is equality with the reversed kernel.** A Markov kernel is reversible
for a finite measure `π` exactly when `π` is invariant and the reversed kernel `κ†π` agrees with
`κ` at `π`-almost every point. -/
theorem isReversible_iff_invariant_and_ae_eq_posterior (κ : Kernel E E) [IsMarkovKernel κ]
    (π : Measure E) [IsFiniteMeasure π] :
    κ.IsReversible π ↔ κ.Invariant π ∧ κ†π =ᵐ[π] κ :=
  sorry

omit [StandardBorelSpace E] [Nonempty E] in
/-- 2.2 **Reversibility is invariance of the path law under time reversal.** For an invariant
`π` and a horizon `T ≥ 1`, the kernel is reversible for `π` exactly when the stationary path law
up to time `T` is unchanged by reversing time. -/
theorem isReversible_iff_map_reverseIndex_eq (κ : Kernel E E) [IsMarkovKernel κ]
    (π : Measure E) [IsFiniteMeasure π] (hκ : κ.Invariant π) {T : ℕ} (hT : 1 ≤ T) :
    κ.IsReversible π ↔
      (chainPath π (fun _ ↦ κ) T).map (reverseIndex T) = chainPath π (fun _ ↦ κ) T :=
  sorry

end Discrete

/-! ## Layer 3: propagators of time-dependent rates -/

section Rates

variable {S : Type*} [Fintype S] [DecidableEq S]

/-- 3.1 A real square matrix is **Metzler** when its off-diagonal entries are nonnegative.
(Copied verbatim from ContinuousTimeMarkovChains, Layer 1, Q-matrices, 1.1.) -/
def IsMetzler {S : Type*} (B : Matrix S S ℝ) : Prop :=
  ∀ i j, i ≠ j → 0 ≤ B i j

/-- 3.1 A **Q-matrix** (rate matrix, generator) on a finite state space: a Metzler matrix whose
rows sum to zero. (Copied verbatim from ContinuousTimeMarkovChains, Layer 1, Q-matrices, 1.1.) -/
def IsQMatrix (Q : Matrix S S ℝ) : Prop :=
  IsMetzler Q ∧ ∀ i, ∑ j, Q i j = 0

section Propagator

attribute [local instance] Matrix.linftyOpNormedRing Matrix.linftyOpNormedAlgebra

/-- 3.1 The **propagator** `P(s, t)` of the rate function `Q`: the Dyson series of the shifted
path `r ↦ Q (s + r)` at time `t - s`, the solution of `∂ₜ P(s, t) = P(s, t) Q(t)` with
`P(s, s) = 1`. -/
def propagator (Q : ℝ → Matrix S S ℝ) (s t : ℝ) : Matrix S S ℝ :=
  TauCeti.dysonSeries (fun r ↦ Q (s + r)) (t - s)

end Propagator

/-- 3.2 **Marginals evolve by the propagator.** A row vector solving the forward equation
`p' = p Q` on `[a, b]` is `p t = p a ᵥ* P(a, t)` there. -/
theorem eq_vecMul_propagator (Q : ℝ → Matrix S S ℝ) (hQ : ∀ i j, Continuous fun t ↦ Q t i j)
    {a b : ℝ} {p : ℝ → S → ℝ}
    (hp : ∀ t ∈ Set.Icc a b, HasDerivWithinAt p (p t ᵥ* Q t) (Set.Icc a b) t) :
    ∀ t ∈ Set.Icc a b, p t = p a ᵥ* propagator Q a t :=
  sorry

/-- 3.3 **Stochasticity.** If `Q r` is a Q-matrix for every `r ∈ [s, t]` and `s ≤ t`, the
propagator `P(s, t)` is a stochastic matrix. -/
theorem propagator_mem_rowStochastic (Q : ℝ → Matrix S S ℝ)
    (hQ : ∀ i j, Continuous fun t ↦ Q t i j) {s t : ℝ} (hst : s ≤ t)
    (hq : ∀ r ∈ Set.Icc s t, IsQMatrix (Q r)) :
    propagator Q s t ∈ Matrix.rowStochastic ℝ S :=
  sorry

/-! ## Layer 4: time reversal of time-dependent rates -/

/-- 4.1 The **reversed rates** at reversed time `s`, for the horizon `T` and the marginals `p`:
off the diagonal `p (T - s) j * Q (T - s) j i / p (T - s) i`, and on the diagonal minus the sum
of the off-diagonal entries of the row. -/
def reversedRate (Q : ℝ → Matrix S S ℝ) (p : ℝ → S → ℝ) (T s : ℝ) : Matrix S S ℝ :=
  fun i j ↦ if i = j then -∑ k ∈ univ.erase i, p (T - s) k * Q (T - s) k i / p (T - s) i
    else p (T - s) j * Q (T - s) j i / p (T - s) i

/-- 4.1 **Reversed marginals.** If `Q t` is a Q-matrix and `p` is a positive solution of the
forward equation `p' = p Q` on `[0, T]`, then on `[0, T]` the reversed rates form a Q-matrix and
the reversed marginals `s ↦ p (T - s)` solve the forward equation of the reversed rates. -/
theorem isQMatrix_reversedRate_and_hasDerivWithinAt (Q : ℝ → Matrix S S ℝ) {T : ℝ}
    {p : ℝ → S → ℝ} (hq : ∀ t ∈ Set.Icc 0 T, IsQMatrix (Q t))
    (hp : ∀ t ∈ Set.Icc 0 T, HasDerivWithinAt p (p t ᵥ* Q t) (Set.Icc 0 T) t)
    (hpos : ∀ t ∈ Set.Icc 0 T, ∀ i, 0 < p t i) :
    ∀ s ∈ Set.Icc 0 T, IsQMatrix (reversedRate Q p T s) ∧
      HasDerivWithinAt (fun s ↦ p (T - s)) (p (T - s) ᵥ* reversedRate Q p T s)
        (Set.Icc 0 T) s :=
  sorry

/-- 4.2 The **transition function of the reversed chain** between reversed times `u` and `v`:
by Bayes' formula, `p (T - v) j * P(T - v, T - u) j i / p (T - u) i`. -/
def reversedTransition (Q : ℝ → Matrix S S ℝ) (p : ℝ → S → ℝ) (T u v : ℝ) : Matrix S S ℝ :=
  fun i j ↦ p (T - v) j * propagator Q (T - v) (T - u) j i / p (T - u) i

/-- 4.2 **The reversed chain is driven by the reversed rates.** Under the hypotheses of 4.1, with
`Q` continuous, the reversed transition function from reversed time `u ∈ [0, T]` is `1` at `u`,
solves the forward equation of the reversed rates on `[u, T]`, and is a stochastic matrix
there. -/
theorem reversedTransition_forward_and_mem_rowStochastic (Q : ℝ → Matrix S S ℝ)
    (hQ : ∀ i j, Continuous fun t ↦ Q t i j) {T : ℝ} {p : ℝ → S → ℝ}
    (hq : ∀ t ∈ Set.Icc 0 T, IsQMatrix (Q t))
    (hp : ∀ t ∈ Set.Icc 0 T, HasDerivWithinAt p (p t ᵥ* Q t) (Set.Icc 0 T) t)
    (hpos : ∀ t ∈ Set.Icc 0 T, ∀ i, 0 < p t i) {u : ℝ} (hu : u ∈ Set.Icc 0 T) :
    reversedTransition Q p T u u = 1 ∧
      (∀ v ∈ Set.Icc u T, ∀ i j,
        HasDerivWithinAt (fun w ↦ reversedTransition Q p T u w i j)
          ((reversedTransition Q p T u v * reversedRate Q p T v) i j) (Set.Icc u T) v) ∧
      ∀ v ∈ Set.Icc u T, reversedTransition Q p T u v ∈ Matrix.rowStochastic ℝ S :=
  sorry

end Rates

end TauCetiRoadmap.TimeReversalOfMarkovChains

end
