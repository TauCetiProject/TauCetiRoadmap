import Mathlib
import TauCeti.Analysis.Convex.Conjugate

/-!
# The Hopfield model with finitely many patterns: target signatures

**This file is not the roadmap.** The roadmap is `README.md`. This file states the roadmap's
headline theorems against the pinned Mathlib and Tau Ceti, each with `sorry`, together with the
definitions they need; every definition has a real body. Every headline theorem of the README is
statable at the pins and is stated here. The README's remaining API lists and Checks are not
restated.

Several definitions are verbatim copies, because a roadmap's Lean file cannot import another
roadmap's module: `spin` and `ising` from QuantumOptimization 1.1; `hopfieldEnergy` and `hebb`
from HopfieldNetworks 1.1 and 4.1; `gibbs` from SimulatedAnnealing 3.1; `tvToStationary`,
`mixingTime` and `glauber` from MarkovChainMixing 1.2, 1.3 and 6.1; `freeEnergy`, `pressure` and
`spontaneousMagnetization` from CurieWeissModel 1.2; `LargeDeviationPrinciple` from
RandomMatrices 9.1; `IsGoodRateFunction` and `legendreRate` from LargeDeviations 1.1 and 4.1.

Configurations are `x : ι → Bool` on a finite set `ι` of `N` sites; the spin `spin x i` is `−1`
when `x i` is true and `1` otherwise. Patterns are `ξ : Fin P → ι → Bool`. The Hopfield law at
inverse temperature `β` is the Gibbs law of the Hopfield energy of the Hebbian weights at inverse
temperature `β / N`, so a configuration has probability proportional to
`exp((β / (2N)) Σ_μ (Σ_i ξ^μ_i σ_i)²)`. Overlap vectors live in `EuclideanSpace ℝ (Fin P)`.
-/

noncomputable section

open Filter Topology MeasureTheory ProbabilityTheory Finset
open scoped NNReal ENNReal InnerProductSpace

namespace TauCetiRoadmap.HopfieldModelThermodynamics

/-! ## Definitions copied verbatim from QuantumOptimization and HopfieldNetworks -/

section CopiedFromQuantumOptimization

variable {ι : Type*} [Fintype ι]

/-- 1.1 (copied verbatim from QuantumOptimization 1.1): the spin of variable `i` in the
configuration `x`: `−1` if `x i` is true and `1` otherwise. -/
def spin (x : ι → Bool) (i : ι) : ℝ := if x i then -1 else 1

/-- 1.1 (copied verbatim from QuantumOptimization 1.1): the Ising energy with couplings `J`,
summed over all ordered pairs, and fields `h`. -/
def ising (J : Matrix ι ι ℝ) (h : ι → ℝ) (x : ι → Bool) : ℝ :=
  ∑ i, ∑ j, J i j * spin x i * spin x j + ∑ i, h i * spin x i

/-- 1.1 (copied verbatim from HopfieldNetworks 1.1): the Hopfield energy
`E(x) = −½ Σ_i Σ_j W i j s_i s_j − Σ_i θ i s_i`, the Ising energy with couplings `−W/2` and
fields `−θ`. -/
def hopfieldEnergy (W : Matrix ι ι ℝ) (θ : ι → ℝ) (x : ι → Bool) : ℝ :=
  ising (-(1 / 2 : ℝ) • W) (-θ) x

/-- 1.1 (copied verbatim from HopfieldNetworks 4.1): the Hebbian weights
`W i j = Σ_μ ξ^μ_i ξ^μ_j − p · [i = j]` of the patterns `ξ 0, …, ξ (p − 1)`, in spins; the
diagonal is zero. -/
def hebb [DecidableEq ι] {p : ℕ} (ξ : Fin p → ι → Bool) : Matrix ι ι ℝ :=
  Matrix.of fun i j ↦ ∑ μ, spin (ξ μ) i * spin (ξ μ) j - if i = j then (p : ℝ) else 0

end CopiedFromQuantumOptimization

/-! ## Definitions copied verbatim from SimulatedAnnealing and MarkovChainMixing -/

section CopiedFromMarkovChainMixing

variable {S : Type*} [MeasurableSpace S] [MeasurableSingletonClass S]

/-- 1.1 (copied verbatim from SimulatedAnnealing 3.1): the Gibbs measure
`π_β(x) = exp(−β U x) / Σ_y exp(−β U y)` of an energy `U` on a finite set at inverse
temperature `β`. -/
def gibbs [Fintype S] (U : S → ℝ) (β : ℝ) : Measure S :=
  ∑ x, ENNReal.ofReal (Real.exp (-(β * U x)) / ∑ y, Real.exp (-(β * U y))) • Measure.dirac x

/-- 4.1 (copied verbatim from MarkovChainMixing 1.2): the distance to stationarity
`d(t) = max_x ‖κ^t(x, ·) − π‖_TV`. -/
def tvToStationary [Fintype S] [Nonempty S] (κ : Kernel S S) (π : Measure S) (t : ℕ) : ℝ :=
  univ.sup' univ_nonempty fun x ↦ tvDist ((κ ^ t) x) π / 2

/-- 4.1 (copied verbatim from MarkovChainMixing 1.3): the mixing time `t_mix(ε)`, the least `t`
with `d(t) ≤ ε`, and `⊤` if there is none. -/
def mixingTime [Fintype S] [Nonempty S] (κ : Kernel S S) (π : Measure S) (ε : ℝ) : ℕ∞ :=
  ⨅ (t : ℕ) (_ : tvToStationary κ π t ≤ ε), (t : ℕ∞)

section Glauber

variable {V A : Type*} [Fintype V] [Countable A] [MeasurableSpace (V → A)]
  [MeasurableSingletonClass (V → A)]

/-- 4.1 (copied verbatim from MarkovChainMixing 6.1): the Glauber dynamics (Gibbs sampler) of a
measure `π` on configurations: a uniform site `v` is chosen and the configuration is redrawn from
`π` conditioned on the configurations that agree with the present one off `v`; where that
conditioning event is `π`-null the configuration is kept. -/
def glauber (π : Measure (V → A)) : Kernel (V → A) (V → A) :=
  Kernel.ofFunOfCountable fun x ↦ (Fintype.card V : ℝ≥0∞)⁻¹ • ∑ v : V,
    if π {y | ∀ w, w ≠ v → y w = x w} = 0 then Measure.dirac x
    else π[|{y | ∀ w, w ≠ v → y w = x w}]

end Glauber

end CopiedFromMarkovChainMixing

/-! ## Definitions copied verbatim from CurieWeissModel 1.2 -/

/-- 2.2 (copied verbatim from CurieWeissModel 1.2): the mean-field free energy
`f_β(m) = −β m² / 2 − s(m)`, where `s(m) = binEntropy ((1 + m) / 2)` is the entropy of a spin
of mean `m`. -/
def freeEnergy (β m : ℝ) : ℝ :=
  -(β * m ^ 2 / 2) - Real.binEntropy ((1 + m) / 2)

/-- 2.2 (copied verbatim from CurieWeissModel 1.2): the variational pressure
`ψ(β, h) = max_{m ∈ [−1, 1]} (h m − f_β(m))`. -/
def pressure (β h : ℝ) : ℝ :=
  sSup ((fun m ↦ h * m - freeEnergy β m) '' Set.Icc (-1) 1)

/-- 2.2 (copied verbatim from CurieWeissModel 1.2): the spontaneous magnetisation `m*(β)`, the
largest solution in `[0, 1]` of the mean-field equation `tanh(β m) = m`. -/
def spontaneousMagnetization (β : ℝ) : ℝ :=
  sSup {m ∈ Set.Icc (0 : ℝ) 1 | Real.tanh (β * m) = m}

/-! ## Definitions copied verbatim from RandomMatrices 9.1 and LargeDeviations -/

/-- 3.1 (copied verbatim from RandomMatrices 9.1): a large deviation principle at speed `a`
with rate `I` (AGZ Definition D.1): `I` is lower semicontinuous, every closed `F` satisfies
`limsup a(n)⁻¹ log μₙ(F) ≤ -inf_F I`, and every open `U` satisfies
`-inf_U I ≤ liminf a(n)⁻¹ log μₙ(U)`, with `log 0 = -∞`. -/
def LargeDeviationPrinciple {X : Type*} [TopologicalSpace X] [MeasurableSpace X]
    (μ : ℕ → Measure X) (a : ℕ → ℝ) (I : X → ℝ≥0∞) : Prop :=
  LowerSemicontinuous I ∧
    (∀ F : Set X, IsClosed F →
      limsup (fun n ↦ ((a n)⁻¹ : ℝ) * ENNReal.log (μ n F)) atTop ≤ -(⨅ x ∈ F, (I x : EReal))) ∧
    ∀ U : Set X, IsOpen U →
      -(⨅ x ∈ U, (I x : EReal)) ≤ liminf (fun n ↦ ((a n)⁻¹ : ℝ) * ENNReal.log (μ n U)) atTop

/-- 3.1 (copied verbatim from LargeDeviations 1.1, its local copy of RandomMatrices 9.1): a good
rate function is lower semicontinuous with compact sublevel sets `{x | I x ≤ c}` for every
finite `c` (Anderson–Guionnet–Zeitouni, Definition D.3(b)). -/
def IsGoodRateFunction {Y : Type*} [TopologicalSpace Y] (I : Y → ℝ≥0∞) : Prop :=
  LowerSemicontinuous I ∧ ∀ c : ℝ≥0, IsCompact {x | I x ≤ c}

section CopiedFromLargeDeviations

variable {E : Type*} [NormedAddCommGroup E] [InnerProductSpace ℝ E] [MeasurableSpace E]

/-- 3.1 (copied verbatim from LargeDeviations 4.1): the Legendre transform
`x ↦ sup_t (⟪t, x⟫ - Λ t)` of `Λ : E → EReal`, Tau Ceti's `fenchelConjugate` for the inner
product pairing, truncated below at `0` into `ℝ≥0∞`. The truncation is invisible when
`Λ 0 = 0`, as for every logarithmic moment generating function of a probability law. -/
def legendreRate (Λ : E → EReal) (x : E) : ℝ≥0∞ :=
  (TauCeti.fenchelConjugate (innerₗ E) Λ x).toENNReal

end CopiedFromLargeDeviations

/-! ## Layer 1: the Hopfield law and the Gaussian–binary machine -/

section Model

variable {ι : Type*} [Fintype ι] {P : ℕ}

/-- 1.1: the overlap vector `m_N(x) ∈ ℝ^P`, `m_N(x)_μ = (1/N) Σ_i ξ^μ_i σ_i(x)`; it is `0` when
there are no sites. -/
def overlap (ξ : Fin P → ι → Bool) (x : ι → Bool) : EuclideanSpace ℝ (Fin P) :=
  WithLp.toLp 2 fun μ ↦ (∑ i, spin (ξ μ) i * spin x i) / Fintype.card ι

/-- 1.1: the Hopfield partition function `Z_N(β) = Σ_x exp(β N ‖m_N(x)‖² / 2)
= Σ_x exp((β / (2N)) Σ_μ (Σ_i ξ^μ_i σ_i)²)`, self-couplings included. -/
def hopfieldPartition [DecidableEq ι] (ξ : Fin P → ι → Bool) (β : ℝ) : ℝ :=
  ∑ x : ι → Bool, Real.exp (β * Fintype.card ι * ‖overlap ξ x‖ ^ 2 / 2)

/-- 1.1: the Hopfield law at inverse temperature `β`: the Gibbs law of the Hopfield energy of the
Hebbian weights, with zero thresholds, at inverse temperature `β / N`. -/
def hopfieldLaw [DecidableEq ι] (ξ : Fin P → ι → Bool) (β : ℝ) : Measure (ι → Bool) :=
  gibbs (hopfieldEnergy (hebb ξ) 0) (β / Fintype.card ι)

/-- 1.1: the mean `√(β/N) Σ_i ξ^μ_i σ_i(x)` of the hidden unit `μ` given the visible
configuration `x`. -/
def hiddenMean (ξ : Fin P → ι → Bool) (β : ℝ) (x : ι → Bool) (μ : Fin P) : ℝ :=
  Real.sqrt (β / Fintype.card ι) * ∑ i, spin (ξ μ) i * spin x i

/-- 1.1: the input `√(β/N) Σ_μ z_μ ξ^μ_i` of the visible unit `i` given the hidden vector `z`. -/
def visibleField (ξ : Fin P → ι → Bool) (β : ℝ) (z : Fin P → ℝ) (i : ι) : ℝ :=
  Real.sqrt (β / Fintype.card ι) * ∑ μ, z μ * spin (ξ μ) i

/-- 1.1: the unnormalised density `exp(−‖z‖²/2 + Σ_μ z_μ · √(β/N) Σ_i ξ^μ_i σ_i(x))` of the
Gaussian–binary machine with respect to counting measure times Lebesgue measure. -/
def gaussBinaryWeight (ξ : Fin P → ι → Bool) (β : ℝ) (x : ι → Bool) (z : Fin P → ℝ) : ℝ :=
  Real.exp (-(∑ μ, z μ ^ 2) / 2 + ∑ μ, z μ * hiddenMean ξ β x μ)

/-- 1.1: the joint law of the Gaussian–binary machine with binary visible units and `P` standard
Gaussian hidden units: the normalised measure with density `gaussBinaryWeight` with respect to
counting measure times Lebesgue measure. -/
def gaussBinaryLaw [DecidableEq ι] (ξ : Fin P → ι → Bool) (β : ℝ) :
    Measure ((ι → Bool) × (Fin P → ℝ)) :=
  ((Measure.count.prod volume).withDensity
      (fun p ↦ ENNReal.ofReal (gaussBinaryWeight ξ β p.1 p.2)) Set.univ)⁻¹ •
    (Measure.count.prod volume).withDensity
      (fun p ↦ ENNReal.ofReal (gaussBinaryWeight ξ β p.1 p.2))

/-- 1.1: the hidden units given the visible configuration `x`: independent Gaussians of variance
`1` with means `hiddenMean ξ β x`. -/
def hiddenKernel [DecidableEq ι] (ξ : Fin P → ι → Bool) (β : ℝ) :
    Kernel (ι → Bool) (Fin P → ℝ) :=
  Kernel.ofFunOfCountable fun x ↦ Measure.pi fun μ ↦ gaussianReal (hiddenMean ξ β x μ) 1

/-- 1.1: the visible units given the hidden vector `z`: independent spins, spin `i` equal to `1`
with probability `(1 + tanh(visibleField ξ β z i)) / 2`. -/
def visibleKernel [DecidableEq ι] (ξ : Fin P → ι → Bool) (β : ℝ) :
    Kernel (Fin P → ℝ) (ι → Bool) :=
  Kernel.withDensity (Kernel.const (Fin P → ℝ) Measure.count) fun z x ↦
    ENNReal.ofReal (∏ i, (1 + spin x i * Real.tanh (visibleField ξ β z i)) / 2)

/-- 1.1: the Hubbard–Stratonovich identity. For `β ≥ 0`: the total weight of the Gaussian–binary
machine is `(2π)^{P/2} Z_N(β)`; its joint law is the Hopfield law followed by `hiddenKernel` (so
the visible marginal is the Hopfield law and the hidden units given `x` are Gaussian around
`√(β/N) Σ_i ξ^μ_i σ_i`); read from the hidden side it is the hidden marginal followed by
`visibleKernel`; and the hidden marginal is the law of `hiddenMean ξ β X` for `X` Hopfield,
convolved with the standard Gaussian law on `ℝ^P`. -/
theorem gaussBinaryLaw_hubbardStratonovich [DecidableEq ι] (ξ : Fin P → ι → Bool) {β : ℝ}
    (hβ : 0 ≤ β) :
    ∫ p, gaussBinaryWeight ξ β p.1 p.2 ∂(Measure.count.prod volume) =
        (2 * Real.pi) ^ ((P : ℝ) / 2) * hopfieldPartition ξ β ∧
      gaussBinaryLaw ξ β = hopfieldLaw ξ β ⊗ₘ hiddenKernel ξ β ∧
      (gaussBinaryLaw ξ β).map Prod.swap =
        (gaussBinaryLaw ξ β).map Prod.snd ⊗ₘ visibleKernel ξ β ∧
      (gaussBinaryLaw ξ β).map Prod.snd =
        (hopfieldLaw ξ β).map (hiddenMean ξ β) ∗ Measure.pi fun _ : Fin P ↦ gaussianReal 0 1 :=
  sorry

end Model

/-! ## Layer 2: the free energy with finitely many patterns -/

section FreeEnergy

variable {P : ℕ}

/-- 2.1: the frequency `ν_N(η) = #{i | (ξ^μ_i)_μ = η} / N` of the column type `η` among the
sites; it is `0` when there are no sites. -/
def columnFreq {ι : Type*} [Fintype ι] (ξ : Fin P → ι → Bool) (η : Fin P → Bool) : ℝ :=
  ((univ.filter fun i ↦ (fun μ ↦ ξ μ i) = η).card : ℝ) / Fintype.card ι

/-- 2.1: the column-type spin vector `s(η) ∈ ℝ^P`, with entries `spin η μ`. -/
def spinVec (η : Fin P → Bool) : EuclideanSpace ℝ (Fin P) :=
  WithLp.toLp 2 (spin η)

/-- 2.1: `Λ_ν(t) = Σ_η ν(η) log cosh ⟪t, s(η)⟫` for weights `ν` on the column types. -/
def overlapCumulant (ν : (Fin P → Bool) → ℝ) (t : EuclideanSpace ℝ (Fin P)) : ℝ :=
  ∑ η, ν η * Real.log (Real.cosh ⟪t, spinVec η⟫_ℝ)

/-- 2.1: the variational functional `Φ_ν(m) = log 2 + Λ_ν(β m) − β ‖m‖² / 2`. -/
def pressureFunctional (ν : (Fin P → Bool) → ℝ) (β : ℝ) (m : EuclideanSpace ℝ (Fin P)) : ℝ :=
  Real.log 2 + overlapCumulant ν (β • m) - β * ‖m‖ ^ 2 / 2

/-- 2.1: the lower half of the free-energy sandwich. For `N ≥ 1` sites, `β ≥ 0` and every
`m ∈ ℝ^P`, `Φ_{ν_N}(m) ≤ (1/N) log Z_N(β)`. -/
theorem pressureFunctional_columnFreq_le_log_div {ι : Type*} [Fintype ι] [DecidableEq ι]
    [Nonempty ι]
    (ξ : Fin P → ι → Bool) {β : ℝ} (hβ : 0 ≤ β) (m : EuclideanSpace ℝ (Fin P)) :
    pressureFunctional (columnFreq ξ) β m ≤
      Real.log (hopfieldPartition ξ β) / Fintype.card ι :=
  sorry

/-- 2.1: the upper half of the free-energy sandwich. For every real `β` some `m` in the cube
`[−1, 1]^P` has `(1/N) log Z_N(β) ≤ Φ_{ν_N}(m) + P log(N + 1) / N`. -/
theorem exists_log_hopfieldPartition_div_le {ι : Type*} [Fintype ι] [DecidableEq ι]
    (ξ : Fin P → ι → Bool)
    (β : ℝ) :
    ∃ m : EuclideanSpace ℝ (Fin P), (∀ μ, |m μ| ≤ 1) ∧
      Real.log (hopfieldPartition ξ β) / Fintype.card ι ≤
        pressureFunctional (columnFreq ξ) β m +
          P * Real.log (Fintype.card ι + 1) / Fintype.card ι :=
  sorry

/-- 2.1: the free energy. If the column-type frequencies of patterns `ξ N` on `N` sites converge
to `ν`, then for `β ≥ 0`, `(1/N) log Z_N(β) → sup_m Φ_ν(m)`. -/
theorem tendsto_log_hopfieldPartition_div (ξ : ∀ N : ℕ, Fin P → Fin N → Bool)
    (ν : (Fin P → Bool) → ℝ) (hν : ∀ η, Tendsto (fun N ↦ columnFreq (ξ N) η) atTop (𝓝 (ν η)))
    {β : ℝ} (hβ : 0 ≤ β) :
    Tendsto (fun N : ℕ ↦ Real.log (hopfieldPartition (ξ N) β) / N) atTop
      (𝓝 (⨆ m, pressureFunctional ν β m)) :=
  sorry

/-- 2.2: the Curie–Weiss bound. For a probability vector `ν` on the column types, a bound `λ` on
the quadratic form `m ↦ Σ_η ν(η) ⟪m, s(η)⟫²` by `λ ‖m‖²`, and `β ≥ 0`: `Φ_ν ≤ ψ(βλ, 0)`
everywhere, and if `0 < β` and `βλ ≤ 1` then `Φ_ν(m) < log 2 = Φ_ν(0)` for every `m ≠ 0`. -/
theorem pressureFunctional_le_pressure (ν : (Fin P → Bool) → ℝ) (hν0 : ∀ η, 0 ≤ ν η)
    (hν1 : ∑ η, ν η = 1) {lam : ℝ}
    (hlam : ∀ m : EuclideanSpace ℝ (Fin P), ∑ η, ν η * ⟪m, spinVec η⟫_ℝ ^ 2 ≤ lam * ‖m‖ ^ 2)
    {β : ℝ} (hβ : 0 ≤ β) :
    (∀ m, pressureFunctional ν β m ≤ pressure (β * lam) 0) ∧
      (0 < β → β * lam ≤ 1 → ∀ m, m ≠ 0 → pressureFunctional ν β m < Real.log 2) :=
  sorry

/-- 2.2: the Mattis states. For uniform column types, `P ≥ 1` and `β > 1`, the supremum of `Φ` is
the Curie–Weiss pressure `ψ(β, 0)`, and its maximisers are exactly the `2P` vectors
`± m*(β) e_μ`. -/
theorem isMaxOn_pressureFunctional_uniform_iff (hP : 1 ≤ P) {β : ℝ} (hβ : 1 < β) :
    (⨆ m : EuclideanSpace ℝ (Fin P), pressureFunctional (fun _ ↦ ((2 : ℝ) ^ P)⁻¹) β m) =
      pressure β 0 ∧
      ∀ m : EuclideanSpace ℝ (Fin P),
        IsMaxOn (pressureFunctional (fun _ ↦ ((2 : ℝ) ^ P)⁻¹) β) Set.univ m ↔
          ∃ μ, m = EuclideanSpace.single μ (spontaneousMagnetization β) ∨
            m = EuclideanSpace.single μ (-spontaneousMagnetization β) :=
  sorry

end FreeEnergy

/-! ## Layer 3: large deviations and concentration of the overlaps -/

section Overlaps

variable {P : ℕ}

/-- 3.1: the rate function of the overlaps,
`I(m) = Λ_ν*(m) − β ‖m‖²/2 + sup_y (β ‖y‖²/2 − Λ_ν*(y))`, with `Λ_ν*` the Legendre transform
of `Λ_ν`; it is `⊤` off the convex hull of the column-type spin vectors. -/
def overlapRate (ν : (Fin P → Bool) → ℝ) (β : ℝ) (m : EuclideanSpace ℝ (Fin P)) : ℝ≥0∞ :=
  ((legendreRate (fun t ↦ (overlapCumulant ν t : EReal)) m : EReal) -
      ((β * ‖m‖ ^ 2 / 2 : ℝ) : EReal) +
    ⨆ y, (((β * ‖y‖ ^ 2 / 2 : ℝ) : EReal) -
      legendreRate (fun t ↦ (overlapCumulant ν t : EReal)) y)).toENNReal

/-- 3.1: large deviations of the overlaps. If the column-type frequencies of `ξ N` converge to
`ν`, then for every real `β` the laws of `m_N` under the Hopfield laws satisfy the large
deviation principle at speed `N` with the good rate function `overlapRate ν β`. -/
theorem largeDeviationPrinciple_overlap (ξ : ∀ N : ℕ, Fin P → Fin N → Bool)
    (ν : (Fin P → Bool) → ℝ) (hν : ∀ η, Tendsto (fun N ↦ columnFreq (ξ N) η) atTop (𝓝 (ν η)))
    (β : ℝ) :
    IsGoodRateFunction (overlapRate ν β) ∧
      LargeDeviationPrinciple (fun N ↦ (hopfieldLaw (ξ N) β).map (overlap (ξ N)))
        (fun N ↦ (N : ℝ)) (overlapRate ν β) :=
  sorry

/-- 3.2: the zeros of the rate and exponential concentration. If the column-type frequencies of
`ξ N` converge to `ν` and `β > 0`, then the rate `overlapRate ν β` vanishes exactly at the
maximisers of `Φ_ν`, and for every `ε > 0` there is `c > 0` such that, for all large `N`, the
Hopfield probability that `m_N` lies at distance at least `ε` from those maximisers is at most
`e^{−cN}` (from 3.1, the first clause and LargeDeviations 1.2,
`LargeDeviationPrinciple.exists_pos_eventually_log_le`). Every probability vector `ν` is such a
limit, so the first clause holds for all of them. -/
theorem setOf_overlapRate_eq_zero (ξ : ∀ N : ℕ, Fin P → Fin N → Bool)
    (ν : (Fin P → Bool) → ℝ) (hν : ∀ η, Tendsto (fun N ↦ columnFreq (ξ N) η) atTop (𝓝 (ν η)))
    {β : ℝ} (hβ : 0 < β) :
    {m | overlapRate ν β m = 0} = {m | IsMaxOn (pressureFunctional ν β) Set.univ m} ∧
      ∀ ε : ℝ, 0 < ε → ∃ c > 0, ∀ᶠ N : ℕ in atTop,
        (hopfieldLaw (ξ N) β).real {x | ε ≤ Metric.infDist (overlap (ξ N) x)
          {m | IsMaxOn (pressureFunctional ν β) Set.univ m}} ≤ Real.exp (-(c * N)) :=
  sorry

end Overlaps

/-! ## Layer 4: the Glauber dynamics -/

section Glauber

/-- 4.1: slow mixing at low temperature. If `P ≥ 1`, the column-type frequencies of `ξ N` tend to
the uniform law on `{±1}^P` and `β > 1`, there is `r > 0` with `⌈e^{rN}⌉ ≤ t_mix(1/4)` for the
Glauber dynamics of the Hopfield law, for all large `N`. -/
theorem exp_le_mixingTime_glauber_hopfieldLaw {P : ℕ} (hP : 1 ≤ P)
    (ξ : ∀ N : ℕ, Fin P → Fin N → Bool)
    (hν : ∀ η, Tendsto (fun N ↦ columnFreq (ξ N) η) atTop (𝓝 ((2 : ℝ) ^ P)⁻¹))
    {β : ℝ} (hβ : 1 < β) :
    ∃ r > 0, ∀ᶠ N : ℕ in atTop,
      ((⌈Real.exp (r * N)⌉₊ : ℕ) : ℕ∞) ≤
        mixingTime (glauber (hopfieldLaw (ξ N) β)) (hopfieldLaw (ξ N) β) (1 / 4) :=
  sorry

variable {ι : Type*} [Fintype ι] [DecidableEq ι]

/-- 4.2: fast mixing under a Dobrushin-type condition, and the Hebbian case. On a nonempty set of
`N` sites: for real couplings `J` (the diagonal and the antisymmetric part play no role), real `β`
and `0 < c` with `Σ_{i ≠ v} tanh |β (J i v + J v i)/2| ≤ 1 − c` for every site `v`, the Glauber
dynamics of the Gibbs law `∝ exp(−β ising (−J/2) 0)` has `d(t) ≤ N (1 − c/N)^t` and
`t_mix(ε) ≤ ⌈N (log N + log(1/ε)) / c⌉` for every `ε > 0`; and for `P` patterns and
`|β| P < 1` the Glauber dynamics of the Hopfield law satisfies the same two bounds with
`c = 1 − |β| P`. -/
theorem glauber_gibbs_ising_fastMixing [Nonempty ι] :
    (∀ (J : Matrix ι ι ℝ) (β c : ℝ), 0 < c →
      (∀ v, ∑ i ∈ univ.erase v, Real.tanh |β * (J i v + J v i) / 2| ≤ 1 - c) →
      (∀ t : ℕ, tvToStationary (glauber (gibbs (ising (-(1 / 2 : ℝ) • J) 0) β))
          (gibbs (ising (-(1 / 2 : ℝ) • J) 0) β) t ≤
          Fintype.card ι * (1 - c / Fintype.card ι) ^ t) ∧
        ∀ ε : ℝ, 0 < ε → mixingTime (glauber (gibbs (ising (-(1 / 2 : ℝ) • J) 0) β))
          (gibbs (ising (-(1 / 2 : ℝ) • J) 0) β) ε ≤
          (⌈Fintype.card ι * (Real.log (Fintype.card ι) + Real.log (1 / ε)) / c⌉₊ : ℕ)) ∧
    ∀ (P : ℕ) (ξ : Fin P → ι → Bool) (β : ℝ), |β| * P < 1 →
      (∀ t : ℕ, tvToStationary (glauber (hopfieldLaw ξ β)) (hopfieldLaw ξ β) t ≤
          Fintype.card ι * (1 - (1 - |β| * P) / Fintype.card ι) ^ t) ∧
        ∀ ε : ℝ, 0 < ε → mixingTime (glauber (hopfieldLaw ξ β)) (hopfieldLaw ξ β) ε ≤
          (⌈Fintype.card ι * (Real.log (Fintype.card ι) + Real.log (1 / ε)) /
            (1 - |β| * P)⌉₊ : ℕ) :=
  sorry

end Glauber

end TauCetiRoadmap.HopfieldModelThermodynamics
