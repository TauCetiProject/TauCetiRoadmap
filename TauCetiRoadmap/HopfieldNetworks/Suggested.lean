import Mathlib

/-!
# Hopfield networks: target signatures

**This file is not the roadmap.** The roadmap is `README.md`. This file states the roadmap's
headline theorems against the pinned Mathlib, each with `sorry`, together with the definitions
they need; every definition has a real body. `spin` and `ising` are verbatim copies of the
definitions of QuantumOptimization 1.1, a roadmap this one depends on and whose Lean file cannot
be imported. Every headline theorem of the README is statable at the pins and is stated here.
The README's remaining targets, API lists and Checks are not restated.

Configurations are `x : ι → Bool` with spins `spin x i ∈ {1, −1}`, `spin x i = −1` exactly when
`x i` is true (the convention of QuantumOptimization). A unit whose local field vanishes keeps
its state.
-/

noncomputable section

open Filter Topology Finset

namespace TauCetiRoadmap.HopfieldNetworks

/-! ## Layer 1: energy and the single-unit update -/

section Classical

variable {ι : Type*} [Fintype ι]

/-- 1.1 (copied verbatim from QuantumOptimization 1.1): the spin of unit `i` in the
configuration `x`: `−1` if `x i` is true and `1` otherwise. -/
def spin (x : ι → Bool) (i : ι) : ℝ := if x i then -1 else 1

/-- 1.1 (copied verbatim from QuantumOptimization 1.1): the Ising energy with couplings `J`,
summed over all ordered pairs, and fields `h`. -/
def ising (J : Matrix ι ι ℝ) (h : ι → ℝ) (x : ι → Bool) : ℝ :=
  ∑ i, ∑ j, J i j * spin x i * spin x j + ∑ i, h i * spin x i

/-- 1.1: the local field `h_i(x) = Σ_j W i j · s_j + θ i` of unit `i` in the configuration `x`
for the weights `W` and the thresholds `θ`. -/
def localField (W : Matrix ι ι ℝ) (θ : ι → ℝ) (x : ι → Bool) (i : ι) : ℝ :=
  ∑ j, W i j * spin x j + θ i

/-- 1.1: the Hopfield energy `E(x) = −½ Σ_i Σ_j W i j s_i s_j − Σ_i θ i s_i`, the Ising energy
with couplings `−W/2` and fields `−θ`. -/
def hopfieldEnergy (W : Matrix ι ι ℝ) (θ : ι → ℝ) (x : ι → Bool) : ℝ :=
  ising (-(1 / 2 : ℝ) • W) (-θ) x

/-- 1.2: the update of unit `i`: its spin becomes the sign of its local field, and it keeps its
state when the field vanishes; the other units are unchanged. -/
def asyncUpdate [DecidableEq ι] (W : Matrix ι ι ℝ) (θ : ι → ℝ) (i : ι) (x : ι → Bool) :
    ι → Bool :=
  Function.update x i
    (if 0 < localField W θ x i then false else if localField W θ x i < 0 then true else x i)

/-- 1.2: a configuration is stable when no single-unit update changes it. -/
def IsStableState [DecidableEq ι] (W : Matrix ι ι ℝ) (θ : ι → ℝ) (x : ι → Bool) : Prop :=
  ∀ i, asyncUpdate W θ i x = x

/-- 1.3: for symmetric weights with nonnegative diagonal, an update that changes the
configuration strictly lowers the energy. -/
theorem hopfieldEnergy_asyncUpdate_lt [DecidableEq ι] {W : Matrix ι ι ℝ} (hW : W.IsSymm)
    (hdiag : ∀ i, 0 ≤ W i i) (θ : ι → ℝ) (i : ι) (x : ι → Bool)
    (hx : asyncUpdate W θ i x ≠ x) :
    hopfieldEnergy W θ (asyncUpdate W θ i x) < hopfieldEnergy W θ x :=
  sorry

/-! ## Layer 2: asynchronous dynamics -/

/-- 2.1: the asynchronous trajectory from `x` along the schedule `u`: at time `t` the unit
`u t` is updated. -/
def asyncTraj [DecidableEq ι] (W : Matrix ι ι ℝ) (θ : ι → ℝ) (u : ℕ → ι) (x : ι → Bool) :
    ℕ → ι → Bool
  | 0 => x
  | t + 1 => asyncUpdate W θ (u t) (asyncTraj W θ u x t)

/-- 2.1: for symmetric weights with nonnegative diagonal and every schedule, the trajectory
changes at finitely many times, and at most `2 ^ n − 1` of them for `n` units. -/
theorem asyncTraj_changes_finite [DecidableEq ι] {W : Matrix ι ι ℝ} (hW : W.IsSymm)
    (hdiag : ∀ i, 0 ≤ W i i) (θ : ι → ℝ) (u : ℕ → ι) (x : ι → Bool) :
    {t | asyncTraj W θ u x (t + 1) ≠ asyncTraj W θ u x t}.Finite ∧
      {t | asyncTraj W θ u x (t + 1) ≠ asyncTraj W θ u x t}.ncard ≤
        2 ^ Fintype.card ι - 1 :=
  sorry

/-- 2.2: for symmetric weights with nonnegative diagonal and a schedule that updates every
unit infinitely often, the trajectory is eventually constant at a stable configuration. -/
theorem exists_isStableState_asyncTraj [DecidableEq ι] {W : Matrix ι ι ℝ} (hW : W.IsSymm)
    (hdiag : ∀ i, 0 ≤ W i i) (θ : ι → ℝ) {u : ℕ → ι} (hu : ∀ i T, ∃ t, T ≤ t ∧ u t = i)
    (x : ι → Bool) :
    ∃ T, IsStableState W θ (asyncTraj W θ u x T) ∧
      ∀ t, T ≤ t → asyncTraj W θ u x t = asyncTraj W θ u x T :=
  sorry

/-! ## Layer 3: synchronous dynamics -/

/-- 3.1: the synchronous update: every unit is updated at once from the same configuration,
with the tie rule of `asyncUpdate`. -/
def syncUpdate (W : Matrix ι ι ℝ) (θ : ι → ℝ) (x : ι → Bool) : ι → Bool := fun i ↦
  if 0 < localField W θ x i then false else if localField W θ x i < 0 then true else x i

/-- 3.1: for symmetric weights (any diagonal) every synchronous orbit is eventually periodic
with period `1` or `2`. -/
theorem syncUpdate_eventually_period_two {W : Matrix ι ι ℝ} (hW : W.IsSymm) (θ : ι → ℝ)
    (x : ι → Bool) :
    ∃ T, ∀ t, T ≤ t → (syncUpdate W θ)^[t + 2] x = (syncUpdate W θ)^[t] x :=
  sorry

/-! ## Layer 4: Hebbian storage -/

/-- 4.1: the Hebbian weights `W i j = Σ_μ ξ^μ_i ξ^μ_j − p · [i = j]` of the patterns
`ξ 0, …, ξ (p − 1)`, in spins; the diagonal is zero. -/
def hebb [DecidableEq ι] {p : ℕ} (ξ : Fin p → ι → Bool) : Matrix ι ι ℝ :=
  Matrix.of fun i j ↦ ∑ μ, spin (ξ μ) i * spin (ξ μ) j - if i = j then (p : ℝ) else 0

/-- 4.1: for pairwise orthogonal patterns, zero thresholds, every pattern `ξ ν`, every
configuration `x` and every unit `i`, the local field is aligned with `ξ ν` with margin
`n − p (2 d + 1)`, where `d` is the Hamming distance from `x` to `ξ ν` and `n` the number of
units. -/
theorem le_spin_mul_localField_hebb [DecidableEq ι] {p : ℕ} {ξ : Fin p → ι → Bool}
    (hξ : Pairwise fun μ ν ↦ ∑ i, spin (ξ μ) i * spin (ξ ν) i = 0) (ν : Fin p)
    (x : ι → Bool) (i : ι) :
    (Fintype.card ι : ℝ) - p * (2 * hammingDist x (ξ ν) + 1) ≤
      spin (ξ ν) i * localField (hebb ξ) 0 x i :=
  sorry

/-- 4.2: retrieval. For pairwise orthogonal patterns, zero thresholds and a configuration `x`
within Hamming distance `d` of `ξ ν`, if `p (2 d + 1) < n` then one synchronous update returns
`ξ ν`, and along every schedule each unit that has been updated agrees with `ξ ν`. -/
theorem hebb_retrieval [DecidableEq ι] {p : ℕ} {ξ : Fin p → ι → Bool}
    (hξ : Pairwise fun μ ν ↦ ∑ i, spin (ξ μ) i * spin (ξ ν) i = 0) (ν : Fin p)
    (x : ι → Bool) (d : ℕ) (hd : hammingDist x (ξ ν) ≤ d)
    (hn : p * (2 * d + 1) < Fintype.card ι) :
    syncUpdate (hebb ξ) 0 x = ξ ν ∧
      ∀ (u : ℕ → ι) (t : ℕ) (i : ι), (∃ s < t, u s = i) → asyncTraj (hebb ξ) 0 u x t i = ξ ν i :=
  sorry

end Classical

/-! ## Layer 5: the modern Hopfield network -/

section Modern

variable {E : Type*} [NormedAddCommGroup E] [InnerProductSpace ℝ E] {N : ℕ}

/-- 5.1: the largest norm `M = max_j ‖X j‖` of the stored patterns (`0` when there are none). -/
def patternRadius (X : Fin N → E) : ℝ :=
  ((Finset.univ.sup fun j ↦ ‖X j‖₊ : NNReal) : ℝ)

/-- 5.1: the energy `E(ξ) = −β⁻¹ log Σ_j exp(β ⟪X j, ξ⟫) + ‖ξ‖²/2 + β⁻¹ log N + M²/2` of the
state `ξ` for the stored patterns `X` at inverse temperature `β`. -/
def modernEnergy (X : Fin N → E) (β : ℝ) (ξ : E) : ℝ :=
  -(β⁻¹ * Real.log (∑ j, Real.exp (β * inner ℝ (X j) ξ))) + ‖ξ‖ ^ 2 / 2 +
    β⁻¹ * Real.log N + patternRadius X ^ 2 / 2

/-- 5.1: the update `ξ ↦ Σ_j p_j X j` with the weights
`p_j = exp(β ⟪X j, ξ⟫) / Σ_k exp(β ⟪X k, ξ⟫)`. -/
def modernUpdate (X : Fin N → E) (β : ℝ) (ξ : E) : E :=
  ∑ j, (Real.exp (β * inner ℝ (X j) ξ) / ∑ k, Real.exp (β * inner ℝ (X k) ξ)) • X j

/-- 5.2: for `β ≠ 0` the energy is differentiable and its derivative at `ξ` is
`v ↦ ⟪ξ − f(ξ), v⟫`, where `f` is the update: the fixed points of the update are exactly the
stationary points of the energy. -/
theorem hasFDerivAt_modernEnergy (X : Fin N → E) {β : ℝ} (hβ : β ≠ 0) (ξ : E) :
    HasFDerivAt (modernEnergy X β) (innerSL ℝ (ξ - modernUpdate X β ξ)) ξ :=
  sorry

/-- 5.3: for `β > 0` the update is a concave–convex step and lowers the energy by at least half
the squared length of the step: `E(f ξ) + ‖f ξ − ξ‖²/2 ≤ E(ξ)`. -/
theorem modernEnergy_modernUpdate_add_le (X : Fin N → E) {β : ℝ} (hβ : 0 < β) (ξ : E) :
    modernEnergy X β (modernUpdate X β ξ) + ‖modernUpdate X β ξ - ξ‖ ^ 2 / 2 ≤
      modernEnergy X β ξ :=
  sorry

/-- 5.4: global convergence. For `β ≥ 0` and every initial state, along the iterates of the
update the energies converge to some `E*`, the steps tend to zero, and the set of cluster points
is compact, connected (in particular nonempty) and consists of fixed points of energy `E*`. -/
theorem modernUpdate_iterate_clusterPts (X : Fin N → E) {β : ℝ} (hβ : 0 ≤ β) (ξ₀ : E) :
    ∃ Estar : ℝ,
      Tendsto (fun t ↦ modernEnergy X β ((modernUpdate X β)^[t] ξ₀)) atTop (𝓝 Estar) ∧
      Tendsto (fun t ↦ (modernUpdate X β)^[t + 1] ξ₀ - (modernUpdate X β)^[t] ξ₀) atTop
        (𝓝 0) ∧
      IsCompact {z | MapClusterPt z atTop fun t ↦ (modernUpdate X β)^[t] ξ₀} ∧
      IsConnected {z | MapClusterPt z atTop fun t ↦ (modernUpdate X β)^[t] ξ₀} ∧
      {z | MapClusterPt z atTop fun t ↦ (modernUpdate X β)^[t] ξ₀} ⊆
        {z | modernUpdate X β z = z ∧ modernEnergy X β z = Estar} :=
  sorry

/-- 5.4: if the limit `E*` of the energies has only finitely many fixed points at that energy,
the iterates converge to one of them. -/
theorem tendsto_modernUpdate_iterate (X : Fin N → E) {β : ℝ} (hβ : 0 ≤ β) (ξ₀ : E)
    {Estar : ℝ}
    (hE : Tendsto (fun t ↦ modernEnergy X β ((modernUpdate X β)^[t] ξ₀)) atTop (𝓝 Estar))
    (hfin : {z | modernUpdate X β z = z ∧ modernEnergy X β z = Estar}.Finite) :
    ∃ z, modernUpdate X β z = z ∧ modernEnergy X β z = Estar ∧
      Tendsto (fun t ↦ (modernUpdate X β)^[t] ξ₀) atTop (𝓝 z) :=
  sorry

/-- 5.5: one-step retrieval. If `β ≥ 0`, every pattern has norm at most `M`, and pattern `X i`
is separated by `Δ ≤ ⟪X i, X i⟫ − ⟪X i, X j⟫` from every other pattern, then for every state `ξ`
`‖f(ξ) − X i‖ ≤ 2 (N − 1) M exp(−β (Δ − 2 M ‖ξ − X i‖))`. -/
theorem norm_modernUpdate_sub_le (X : Fin N → E) {β : ℝ} (hβ : 0 ≤ β) {M Δ : ℝ}
    (hM : ∀ j, ‖X j‖ ≤ M) (i : Fin N)
    (hΔ : ∀ j, j ≠ i → Δ ≤ inner ℝ (X i) (X i) - inner ℝ (X i) (X j)) (ξ : E) :
    ‖modernUpdate X β ξ - X i‖ ≤
      2 * ((N : ℝ) - 1) * M * Real.exp (-(β * (Δ - 2 * M * ‖ξ - X i‖))) :=
  sorry

/-- 5.6: stored patterns. Under the hypotheses of `norm_modernUpdate_sub_le`, let
`ε = exp(−β (Δ − 2 M r))`. If `2 (N − 1) M ε ≤ r` and `L = 4 β M² (N − 1) ε < 1`, the update has
exactly one fixed point `z` in the closed ball of radius `r` about `X i`; on that ball it
contracts the distance to `z` by the factor `L`, and its iterates from every state of the
ball converge to `z`. -/
theorem exists_unique_fixedPoint_closedBall (X : Fin N → E) {β : ℝ} (hβ : 0 ≤ β) {M Δ r : ℝ}
    (hM : ∀ j, ‖X j‖ ≤ M) (i : Fin N)
    (hΔ : ∀ j, j ≠ i → Δ ≤ inner ℝ (X i) (X i) - inner ℝ (X i) (X j))
    (hself : 2 * ((N : ℝ) - 1) * M * Real.exp (-(β * (Δ - 2 * M * r))) ≤ r)
    (hL : 4 * β * M ^ 2 * ((N : ℝ) - 1) * Real.exp (-(β * (Δ - 2 * M * r))) < 1) :
    ∃ z ∈ Metric.closedBall (X i) r, modernUpdate X β z = z ∧
      (∀ w ∈ Metric.closedBall (X i) r, modernUpdate X β w = w → w = z) ∧
      ∀ ξ ∈ Metric.closedBall (X i) r,
        ‖modernUpdate X β ξ - z‖ ≤
            4 * β * M ^ 2 * ((N : ℝ) - 1) * Real.exp (-(β * (Δ - 2 * M * r))) * ‖ξ - z‖ ∧
          Tendsto (fun t ↦ (modernUpdate X β)^[t] ξ) atTop (𝓝 z) :=
  sorry

end Modern

end TauCetiRoadmap.HopfieldNetworks
