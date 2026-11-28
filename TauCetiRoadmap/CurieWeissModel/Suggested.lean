import Mathlib

/-!
# The Curie–Weiss model: target signatures

**This file is not the roadmap.** The roadmap is `README.md`. This file states the roadmap's
headline theorems against the pinned Mathlib, each with `sorry`, together with the definitions
they need; every definition has a real body. Every headline theorem of the README is statable at
the pins and is stated here. The README's remaining targets, API lists and Checks are not
restated.

Several definitions are verbatim copies of definitions of other roadmaps, which own them and whose
Lean files cannot be imported: `spin` and `ising` (QuantumOptimization 1.1); `gibbs`
(SimulatedAnnealing 3.1); `tvToStationary`, `mixingTime` and `glauber` (MarkovChainMixing 1.2,
1.3 and 6.1).

Configurations of `N` spins are `x : Fin N → Bool`; the spin `spin x i` is `−1` when `x i` is true
and `1` otherwise. The Curie–Weiss law at inverse temperature `β` and field `h` gives `x` a
probability proportional to `exp(β M² / (2N) + h M)`, where `M = Σ_i spin x i`; with this
normalisation the phase transition is at `β = 1`. Total variation is normalised as in
MarkovChainMixing: the distance of two probability measures is `tvDist μ ν / 2`.
-/

noncomputable section

open Filter Topology MeasureTheory ProbabilityTheory Finset
open scoped NNReal ENNReal

namespace TauCetiRoadmap.CurieWeissModel

/-! ## Definitions copied verbatim from QuantumOptimization 1.1 -/

section CopiedFromQuantumOptimization

variable {ι : Type*} [Fintype ι]

/-- 1.1 (copied verbatim from QuantumOptimization 1.1): the spin of variable `i` in the
configuration `x`: `−1` if `x i` is true and `1` otherwise. -/
def spin (x : ι → Bool) (i : ι) : ℝ := if x i then -1 else 1

/-- 1.1 (copied verbatim from QuantumOptimization 1.1): the Ising energy with couplings `J`,
summed over all ordered pairs, and fields `h`. -/
def ising (J : Matrix ι ι ℝ) (h : ι → ℝ) (x : ι → Bool) : ℝ :=
  ∑ i, ∑ j, J i j * spin x i * spin x j + ∑ i, h i * spin x i

end CopiedFromQuantumOptimization

/-! ## Definitions copied verbatim from SimulatedAnnealing 3.1 and MarkovChainMixing -/

section CopiedFromMarkovChainMixing

variable {S : Type*} [MeasurableSpace S] [MeasurableSingletonClass S]

/-- 1.1 (copied verbatim from SimulatedAnnealing 3.1): the Gibbs measure
`π_β(x) = exp(−β U x) / Σ_y exp(−β U y)` of an energy `U` on a finite set at inverse
temperature `β`. -/
def gibbs [Fintype S] (U : S → ℝ) (β : ℝ) : Measure S :=
  ∑ x, ENNReal.ofReal (Real.exp (-(β * U x)) / ∑ y, Real.exp (-(β * U y))) • Measure.dirac x

/-- 1.1 (copied verbatim from MarkovChainMixing 1.2): the distance to stationarity
`d(t) = max_x ‖κ^t(x, ·) − π‖_TV`. -/
def tvToStationary [Fintype S] [Nonempty S] (κ : Kernel S S) (π : Measure S) (t : ℕ) : ℝ :=
  univ.sup' univ_nonempty fun x ↦ tvDist ((κ ^ t) x) π / 2

/-- 1.1 (copied verbatim from MarkovChainMixing 1.3): the mixing time `t_mix(ε)`, the least `t`
with `d(t) ≤ ε`, and `⊤` if there is none. -/
def mixingTime [Fintype S] [Nonempty S] (κ : Kernel S S) (π : Measure S) (ε : ℝ) : ℕ∞ :=
  ⨅ (t : ℕ) (_ : tvToStationary κ π t ≤ ε), (t : ℕ∞)

section Glauber

variable {V A : Type*} [Fintype V] [Countable A] [MeasurableSpace (V → A)]
  [MeasurableSingletonClass (V → A)]

/-- 1.1 (copied verbatim from MarkovChainMixing 6.1): the Glauber dynamics (Gibbs sampler) of a
measure `π` on configurations: a uniform site `v` is chosen and the configuration is redrawn from
`π` conditioned on the configurations that agree with the present one off `v`; where that
conditioning event is `π`-null the configuration is kept. -/
def glauber (π : Measure (V → A)) : Kernel (V → A) (V → A) :=
  Kernel.ofFunOfCountable fun x ↦ (Fintype.card V : ℝ≥0∞)⁻¹ • ∑ v : V,
    if π {y | ∀ w, w ≠ v → y w = x w} = 0 then Measure.dirac x
    else π[|{y | ∀ w, w ≠ v → y w = x w}]

end Glauber

end CopiedFromMarkovChainMixing

/-! ## Layer 1: the Curie–Weiss law and the mean-field free energy -/

/-- 1.1: the Curie–Weiss energy of `N` spins at inverse temperature `β` in the field `h`,
`H(x) = −(β / (2N)) M(x)² − h M(x)` with `M(x) = Σ_i spin x i`: the Ising energy in which every
ordered pair `(i, j)`, the diagonal included, carries the coupling `−β / (2N)` and every site the
field `−h`. -/
def cwEnergy (N : ℕ) (β h : ℝ) : (Fin N → Bool) → ℝ :=
  ising (Matrix.of fun _ _ ↦ -(β / (2 * N))) fun _ ↦ -h

/-- 1.1: the Curie–Weiss law, the Gibbs law of `cwEnergy N β h` at inverse temperature `1`: the
probability of `x` is proportional to `exp(β M(x)² / (2N) + h M(x))`. -/
def curieWeiss (N : ℕ) (β h : ℝ) : Measure (Fin N → Bool) :=
  gibbs (cwEnergy N β h) 1

/-- 1.1: the partition function `Z_N(β, h) = Σ_x exp(−H(x))`. -/
def partitionFunction (N : ℕ) (β h : ℝ) : ℝ :=
  ∑ x, Real.exp (-cwEnergy N β h x)

/-- 1.1: the magnetisation density `m_N(x) = (1/N) Σ_i spin x i`. -/
def magnetization {N : ℕ} (x : Fin N → Bool) : ℝ :=
  (∑ i, spin x i) / N

/-- 1.2: the mean-field free energy `f_β(m) = −β m² / 2 − s(m)`, where
`s(m) = binEntropy ((1 + m) / 2)` is the entropy of a spin of mean `m`. -/
def freeEnergy (β m : ℝ) : ℝ :=
  -(β * m ^ 2 / 2) - Real.binEntropy ((1 + m) / 2)

/-- 1.2: the variational pressure `ψ(β, h) = max_{m ∈ [−1, 1]} (h m − f_β(m))`. -/
def pressure (β h : ℝ) : ℝ :=
  sSup ((fun m ↦ h * m - freeEnergy β m) '' Set.Icc (-1) 1)

/-- 1.2: the rate function `I_{β,h}(m) = f_β(m) − h m + ψ(β, h)`, nonnegative on `[−1, 1]`. -/
def rateFunction (β h m : ℝ) : ℝ :=
  freeEnergy β m - h * m + pressure β h

/-- 1.2: the spontaneous magnetisation `m*(β)`, the largest solution in `[0, 1]` of the
mean-field equation `tanh(β m) = m`. -/
def spontaneousMagnetization (β : ℝ) : ℝ :=
  sSup {m ∈ Set.Icc (0 : ℝ) 1 | Real.tanh (β * m) = m}

/-! ## Layer 2: the mean-field equation -/

/-- 2.1: for `β ≤ 1` the mean-field equation `tanh(β m) = m` has the single solution `0`, and `0`
is the only minimiser of the free energy on `[−1, 1]`. -/
theorem setOf_tanh_mul_eq_self_of_le_one {β : ℝ} (hβ : β ≤ 1) :
    {m : ℝ | Real.tanh (β * m) = m} = {0} ∧
      {m ∈ Set.Icc (-1 : ℝ) 1 | IsMinOn (freeEnergy β) (Set.Icc (-1) 1) m} = {0} :=
  sorry

/-- 2.2: for `β > 1` the spontaneous magnetisation `m*` lies in `(0, 1)`, the solutions of the
mean-field equation are exactly `−m*`, `0` and `m*`, the minimisers of the free energy on
`[−1, 1]` are exactly `±m*`, and `m*² ≤ 3 (β − 1)`. -/
theorem spontaneousMagnetization_spec {β : ℝ} (hβ : 1 < β) :
    0 < spontaneousMagnetization β ∧ spontaneousMagnetization β < 1 ∧
      {m : ℝ | Real.tanh (β * m) = m} =
        {-spontaneousMagnetization β, 0, spontaneousMagnetization β} ∧
      {m ∈ Set.Icc (-1 : ℝ) 1 | IsMinOn (freeEnergy β) (Set.Icc (-1) 1) m} =
        {-spontaneousMagnetization β, spontaneousMagnetization β} ∧
      spontaneousMagnetization β ^ 2 ≤ 3 * (β - 1) :=
  sorry

/-! ## Layer 3: the thermodynamic limit -/

/-- 3.1: the limit of the free energy per spin: `(1/N) log Z_N(β, h) → ψ(β, h)` for every real
`β` and `h`. -/
theorem tendsto_log_partitionFunction_div (β h : ℝ) :
    Tendsto (fun N : ℕ ↦ Real.log (partitionFunction N β h) / N) atTop (𝓝 (pressure β h)) :=
  sorry

/-- 3.2: exponential asymptotics of the magnetisation on intervals: for an interval `J ⊆ [−1, 1]`
with nonempty interior, `(1/N) log μ_N(m_N ∈ J) → −inf_J I_{β,h}`. -/
theorem tendsto_log_measureReal_magnetization_mem_div (β h : ℝ) {J : Set ℝ}
    (hJ : J ⊆ Set.Icc (-1) 1) (hJc : J.OrdConnected) (hJi : (interior J).Nonempty) :
    Tendsto (fun N : ℕ ↦ Real.log ((curieWeiss N β h).real {x | magnetization x ∈ J}) / N)
      atTop (𝓝 (-sInf (rateFunction β h '' J))) :=
  sorry

/-! ## Layer 4: concentration of the magnetisation -/

/-- 4.1: at `β ≤ 1` and zero field the magnetisation concentrates at `0`: for every `ε > 0` there
is `c > 0` with `μ_N(|m_N| < ε) ≥ 1 − 2 e^{−cN}` for all large `N`. -/
theorem exists_one_sub_two_mul_exp_le_measureReal_abs_magnetization_lt {β : ℝ} (hβ : β ≤ 1)
    {ε : ℝ} (hε : 0 < ε) :
    ∃ c > 0, ∀ᶠ N : ℕ in atTop,
      1 - 2 * Real.exp (-(c * N)) ≤ (curieWeiss N β 0).real {x | |magnetization x| < ε} :=
  sorry

/-- 4.2: at `β > 1` and zero field the magnetisation concentrates at `±m*`: for every `ε > 0`
there is `b > 0` with `μ_N(| |m_N| − m* | < ε) ≥ 1 − 2 e^{−bN}` for all large `N`. -/
theorem exists_one_sub_two_mul_exp_le_measureReal_abs_abs_magnetization_sub_lt {β : ℝ}
    (hβ : 1 < β) {ε : ℝ} (hε : 0 < ε) :
    ∃ b > 0, ∀ᶠ N : ℕ in atTop,
      1 - 2 * Real.exp (-(b * N)) ≤
        (curieWeiss N β 0).real {x | |(|magnetization x| - spontaneousMagnetization β)| < ε} :=
  sorry

/-- 4.3: concentration on the mean-field equation at every finite `N ≥ 1`, by an exchangeable
pair: for `β ≥ 0`, every field `h` and every `ε > 0`,
`μ_N(|m_N − tanh(β m_N + h)| > 2ε) ≤ (2 + 2β) / (N ε²)`. -/
theorem measureReal_two_mul_lt_abs_magnetization_sub_tanh_le {N : ℕ} (hN : 0 < N) {β : ℝ}
    (hβ : 0 ≤ β) (h : ℝ) {ε : ℝ} (hε : 0 < ε) :
    (curieWeiss N β h).real
        {x | 2 * ε < |magnetization x - Real.tanh (β * magnetization x + h)|} ≤
      (2 + 2 * β) / (N * ε ^ 2) :=
  sorry

/-! ## Layer 5: slow mixing of the Glauber dynamics at low temperature -/

/-- 5.1: there is a constant `C > 0` such that for every `β > 1` there is `r > 0` with
`t_mix(1/4) ≥ C e^{rN}` for the Glauber dynamics of the zero-field Curie–Weiss law of every
`N ≥ 1` spins. -/
theorem exists_ceil_mul_exp_le_mixingTime_glauber_curieWeiss :
    ∃ C > 0, ∀ β : ℝ, 1 < β → ∃ r > 0, ∀ N : ℕ, 0 < N →
      ((⌈C * Real.exp (r * N)⌉₊ : ℕ) : ℕ∞) ≤
        mixingTime (glauber (curieWeiss N β 0)) (curieWeiss N β 0) (1 / 4) :=
  sorry

end TauCetiRoadmap.CurieWeissModel
