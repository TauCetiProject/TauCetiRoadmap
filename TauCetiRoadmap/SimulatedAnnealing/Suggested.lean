import Mathlib

/-!
# Simulated annealing: target signatures

**This file is not the roadmap.** The roadmap is `README.md`. This file states the roadmap's
headline theorems against the pinned Mathlib, each with `sorry`, together with the definitions
they need; every definition has a real body. Every headline theorem of the README is statable at
the pins and is stated here. The README's remaining targets, API lists and Checks are not
restated.

Total variation is normalized as in the README: the distance of two probability measures is
`tvDist μ ν / 2`, with Mathlib's `MeasureTheory.tvDist`.
-/

noncomputable section

open Filter Topology MeasureTheory ProbabilityTheory Finset

namespace TauCetiRoadmap.SimulatedAnnealing

variable {S : Type*} [MeasurableSpace S] [MeasurableSingletonClass S]

/-! ## Layer 1: Dobrushin's ergodicity coefficient -/

/-- 1.1: Dobrushin's ergodicity coefficient `δ(κ) = max_{x,y} ‖κ(x, ·) − κ(y, ·)‖_TV` of a
kernel on a finite set, with the normalized total variation distance. -/
def dobrushinCoeff [Fintype S] [Nonempty S] (κ : Kernel S S) : ℝ :=
  univ.sup' univ_nonempty fun p : S × S ↦ tvDist (κ p.1) (κ p.2) / 2

/-- 1.2: Dobrushin's contraction: `‖μκ − νκ‖_TV ≤ δ(κ) ‖μ − ν‖_TV` for probability measures
`μ`, `ν` and a Markov kernel `κ` on a finite set. -/
theorem tvDist_bind_le_dobrushinCoeff_mul [Fintype S] [Nonempty S] (κ : Kernel S S)
    [IsMarkovKernel κ] (μ ν : Measure S) [IsProbabilityMeasure μ] [IsProbabilityMeasure ν] :
    tvDist (μ.bind κ) (ν.bind κ) / 2 ≤ dobrushinCoeff κ * (tvDist μ ν / 2) :=
  sorry

/-- 1.3: submultiplicativity for two different kernels: `δ(κη) ≤ δ(κ) δ(η)`, where `κη`, first
`κ` then `η`, is `η ∘ₖ κ`. -/
theorem dobrushinCoeff_comp_le [Fintype S] [Nonempty S] (κ η : Kernel S S) [IsMarkovKernel κ]
    [IsMarkovKernel η] :
    dobrushinCoeff (η ∘ₖ κ) ≤ dobrushinCoeff κ * dobrushinCoeff η :=
  sorry

/-! ## Layer 2: inhomogeneous chains, weak and strong ergodicity -/

/-- 2.1: the `n`-step transition kernel `P_m P_{m+1} ⋯ P_{m+n-1}` of the inhomogeneous chain
with kernels `P k`, started at time `m`; it is the identity kernel for `n = 0`. -/
def inhomProd (P : ℕ → Kernel S S) (m : ℕ) : ℕ → Kernel S S
  | 0 => Kernel.id
  | n + 1 => P (m + n) ∘ₖ inhomProd P m n

/-- 2.2: weak ergodicity: for every starting time `m`, `δ(P_m ⋯ P_{n-1}) → 0` as `n → ∞`. -/
def IsWeaklyErgodic [Fintype S] [Nonempty S] (P : ℕ → Kernel S S) : Prop :=
  ∀ m, Tendsto (fun n ↦ dobrushinCoeff (inhomProd P m n)) atTop (𝓝 0)

/-- 2.2: the block criterion: an inhomogeneous chain of Markov kernels is weakly ergodic if and
only if, for some strictly increasing sequence of times `k j`, the series
`Σ_j (1 − δ(P_{k j} ⋯ P_{k (j+1) − 1}))` diverges. -/
theorem isWeaklyErgodic_iff_exists_strictMono [Fintype S] [Nonempty S] (P : ℕ → Kernel S S)
    [∀ k, IsMarkovKernel (P k)] :
    IsWeaklyErgodic P ↔ ∃ k : ℕ → ℕ, StrictMono k ∧
      ¬ Summable fun j ↦ 1 - dobrushinCoeff (inhomProd P (k j) (k (j + 1) - k j)) :=
  sorry

/-- 2.3: strong ergodicity with limit `π`: `π` is a probability measure and, for every starting
time `m`, `max_x ‖(P_m ⋯ P_{n-1})(x, ·) − π‖_TV → 0` as `n → ∞`. -/
def IsStronglyErgodic [Fintype S] [Nonempty S] (P : ℕ → Kernel S S) (π : Measure S) : Prop :=
  IsProbabilityMeasure π ∧
    ∀ m, Tendsto (fun n ↦ univ.sup' univ_nonempty fun x ↦ tvDist (inhomProd P m n x) π / 2)
      atTop (𝓝 0)

/-- 2.3: the Isaacson–Madsen theorem: a weakly ergodic chain whose kernels `P k` have stationary
probability measures `π k` with `Σ_k ‖π k − π (k+1)‖_TV < ∞` is strongly ergodic, and its limit is
the limit of the `π k`. -/
theorem exists_isStronglyErgodic_of_summable [Fintype S] [Nonempty S] (P : ℕ → Kernel S S)
    [∀ k, IsMarkovKernel (P k)] (hP : IsWeaklyErgodic P) (π : ℕ → Measure S)
    [∀ k, IsProbabilityMeasure (π k)] (hinv : ∀ k, (P k).Invariant (π k))
    (hsum : Summable fun k ↦ tvDist (π k) (π (k + 1))) :
    ∃ π' : Measure S, Tendsto (fun k ↦ tvDist (π k) π') atTop (𝓝 0) ∧ IsStronglyErgodic P π' :=
  sorry

/-! ## Layer 3: Gibbs measures at low temperature -/

/-- 3.1: the Gibbs measure `π_β(x) = exp(−β U x) / Σ_y exp(−β U y)` of an energy `U` on a
finite set at inverse temperature `β`. -/
def gibbs [Fintype S] (U : S → ℝ) (β : ℝ) : Measure S :=
  ∑ x, ENNReal.ofReal (Real.exp (-(β * U x)) / ∑ y, Real.exp (-(β * U y))) • Measure.dirac x

/-- 3.2: as `β → ∞` the Gibbs measures converge in total variation to the uniform law on the set
of global minimizers of `U`. -/
theorem tendsto_tvDist_gibbs_uniformOn [Fintype S] [Nonempty S] (U : S → ℝ) :
    Tendsto (fun β ↦ tvDist (gibbs U β) (uniformOn {x | ∀ y, U x ≤ U y})) atTop (𝓝 0) :=
  sorry

/-- 3.3: along every nondecreasing sequence of inverse temperatures, the total variation
distances between consecutive Gibbs measures are summable. -/
theorem summable_tvDist_gibbs [Fintype S] (U : S → ℝ) {β : ℕ → ℝ} (hβ : Monotone β) :
    Summable fun k ↦ tvDist (gibbs U (β k)) (gibbs U (β (k + 1))) :=
  sorry

/-! ## Layer 4: Metropolis kernels and logarithmic cooling -/

/-- 4.1: the Metropolis kernel at inverse temperature `β` for the energy `U` and the proposal
matrix `q`: from `x` it moves to `y ≠ x` with probability `q x y · exp(−β (U y − U x)⁺)` and
stays at `x` with the remaining probability. -/
def metropolis [Fintype S] [DecidableEq S] (q : S → S → ℝ) (U : S → ℝ) (β : ℝ) :
    Kernel S S :=
  Kernel.ofFunOfCountable fun x ↦ ∑ y, ENNReal.ofReal
    (if y = x then 1 - ∑ w ∈ univ.erase x, q x w * Real.exp (-(β * max (U w - U x) 0))
      else q x y * Real.exp (-(β * max (U y - U x) 0))) • Measure.dirac y

/-- 4.3: logarithmic cooling. Let `q` be a symmetric stochastic proposal matrix, `z` a state
with a proposal neighbour of strictly higher energy, `r` a bound on the eccentricity of `z` in the
proposal graph, and `L` a bound on the energy increase along a proposal. If `r L ≤ c` and the
inverse temperatures `β k` are nonnegative and nondecreasing, tend to infinity and satisfy
`β k ≤ log (k + 1) / c + b`, then the Metropolis chain is strongly ergodic with limit the uniform
law on the global minimizers of `U`. -/
theorem isStronglyErgodic_metropolis [Fintype S] [DecidableEq S] [Nonempty S]
    (q : S → S → ℝ) (hq₀ : ∀ x y, 0 ≤ q x y) (hq₁ : ∀ x, ∑ y, q x y = 1)
    (hqs : ∀ x y, q x y = q y x) (U : S → ℝ) (z y₀ : S) (hzy : 0 < q z y₀) (hU : U z < U y₀)
    (r : ℕ) (hr : (SimpleGraph.fromRel fun x y ↦ 0 < q x y).eccent z ≤ r) (L : ℝ)
    (hL : ∀ x y, 0 < q x y → U y - U x ≤ L) (c b : ℝ) (hc : r * L ≤ c) (β : ℕ → ℝ)
    (hβ₀ : 0 ≤ β 0) (hmono : Monotone β) (htop : Tendsto β atTop atTop)
    (hlog : ∀ k : ℕ, β k ≤ Real.log (k + 1) / c + b) :
    IsStronglyErgodic (fun k ↦ metropolis q U (β k)) (uniformOn {x | ∀ y, U x ≤ U y}) :=
  sorry

/-- 4.3: under the hypotheses of `isStronglyErgodic_metropolis`, for every initial law `μ` the
probability that the annealing chain is at a global minimizer of `U` at time `n` tends to `1`. -/
theorem tendsto_measureReal_argmin_metropolis [Fintype S] [DecidableEq S] [Nonempty S]
    (q : S → S → ℝ) (hq₀ : ∀ x y, 0 ≤ q x y) (hq₁ : ∀ x, ∑ y, q x y = 1)
    (hqs : ∀ x y, q x y = q y x) (U : S → ℝ) (z y₀ : S) (hzy : 0 < q z y₀) (hU : U z < U y₀)
    (r : ℕ) (hr : (SimpleGraph.fromRel fun x y ↦ 0 < q x y).eccent z ≤ r) (L : ℝ)
    (hL : ∀ x y, 0 < q x y → U y - U x ≤ L) (c b : ℝ) (hc : r * L ≤ c) (β : ℕ → ℝ)
    (hβ₀ : 0 ≤ β 0) (hmono : Monotone β) (htop : Tendsto β atTop atTop)
    (hlog : ∀ k : ℕ, β k ≤ Real.log (k + 1) / c + b) (μ : Measure S) [IsProbabilityMeasure μ] :
    Tendsto (fun n ↦ (μ.bind (inhomProd (fun k ↦ metropolis q U (β k)) 0 n)).real
      {x | ∀ y, U x ≤ U y}) atTop (𝓝 1) :=
  sorry

end TauCetiRoadmap.SimulatedAnnealing
