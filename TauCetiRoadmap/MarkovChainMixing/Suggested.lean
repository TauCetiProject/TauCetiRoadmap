import Mathlib
import TauCeti.MeasureTheory.OptimalTransport.Wasserstein.Basic
import TauCeti.Probability.Kernel.Matrix
import TauCeti.Probability.MarkovChain.Period
import TauCeti.Probability.Process.MarkovChain

/-!
# Mixing of finite Markov chains: target signatures

**This file is not the roadmap.** The roadmap is `README.md`. This file states the roadmap's
headline theorems against the pinned Mathlib and Tau Ceti, each with `sorry`, together with the
definitions they need; every definition has a real body. Every headline theorem of the README is
statable at the pins and is stated here. The README's remaining targets, API lists and Checks are
not restated.

Suppliers used by the statements: Mathlib `MeasureTheory.tvDist`, `Kernel.Invariant`,
`Kernel.IsReversible`, `Kernel.IsIrreducible`, `Kernel.ofFunOfCountable`,
`Measure.uniformOfFinset`, `bernoulliMeasure`, `ProbabilityTheory.cond`, `variance`, `spectrum`,
`condExp`, `Filtration`, `Adapted`, `IsStoppingTime`, `Metric.diam`, `SimpleGraph.maxDegree` and
`Fin.cycleRange`; Tau Ceti `TauCeti.IsCoupling`, `TauCeti.wassersteinEDist`, `Kernel.toMatrix`,
`Kernel.IsAperiodic` and `TauCeti.Probability.markovChainLaw`.
-/

noncomputable section

open Filter Topology MeasureTheory ProbabilityTheory Finset
open scoped NNReal ENNReal Matrix

namespace TauCetiRoadmap.MarkovChainMixing

variable {S : Type*} [MeasurableSpace S] [MeasurableSingletonClass S]

/-! ## Layer 1: distance to stationarity and mixing times -/

/-- 1.1: half the total variation distance of two probability measures on a countable type is the
least probability of disagreement over their couplings, and it is attained. -/
theorem isLeast_measureReal_ne_of_isCoupling [Countable S] (μ ν : Measure S)
    [IsProbabilityMeasure μ] [IsProbabilityMeasure ν] :
    IsLeast ((fun γ : Measure (S × S) ↦ γ.real {z | z.1 ≠ z.2}) ''
      {γ | TauCeti.IsCoupling γ μ ν}) (tvDist μ ν / 2) :=
  sorry

/-- 1.2: the distance to stationarity `d(t) = max_x ‖κ^t(x, ·) − π‖_TV`. -/
def tvToStationary [Fintype S] [Nonempty S] (κ : Kernel S S) (π : Measure S) (t : ℕ) : ℝ :=
  univ.sup' univ_nonempty fun x ↦ tvDist ((κ ^ t) x) π / 2

/-- 1.2: the distance between starting points `d̄(t) = max_{x,y} ‖κ^t(x, ·) − κ^t(y, ·)‖_TV`. -/
def tvBetweenStarts [Fintype S] [Nonempty S] (κ : Kernel S S) (t : ℕ) : ℝ :=
  univ.sup' univ_nonempty fun p : S × S ↦ tvDist ((κ ^ t) p.1) ((κ ^ t) p.2) / 2

/-- 1.2: `d(t) ≤ d̄(t)` for a stationary `π`. -/
theorem tvToStationary_le_tvBetweenStarts [Fintype S] [Nonempty S] (κ : Kernel S S)
    [IsMarkovKernel κ] (π : Measure S) [IsProbabilityMeasure π] (hπ : κ.Invariant π) (t : ℕ) :
    tvToStationary κ π t ≤ tvBetweenStarts κ t :=
  sorry

/-- 1.2: `d̄` is submultiplicative. -/
theorem tvBetweenStarts_add_le [Fintype S] [Nonempty S] (κ : Kernel S S) [IsMarkovKernel κ]
    (s t : ℕ) :
    tvBetweenStarts κ (s + t) ≤ tvBetweenStarts κ s * tvBetweenStarts κ t :=
  sorry

/-- 1.2: `d(s + t) ≤ d(s) d̄(t)` for a stationary `π`. -/
theorem tvToStationary_add_le [Fintype S] [Nonempty S] (κ : Kernel S S) [IsMarkovKernel κ]
    (π : Measure S) [IsProbabilityMeasure π] (hπ : κ.Invariant π) (s t : ℕ) :
    tvToStationary κ π (s + t) ≤ tvToStationary κ π s * tvBetweenStarts κ t :=
  sorry

/-- 1.3: the mixing time `t_mix(ε)`, the least `t` with `d(t) ≤ ε`, and `⊤` if there is none. -/
def mixingTime [Fintype S] [Nonempty S] (κ : Kernel S S) (π : Measure S) (ε : ℝ) : ℕ∞ :=
  ⨅ (t : ℕ) (_ : tvToStationary κ π t ≤ ε), (t : ℕ∞)

/-- 1.3: `t_mix(ε) ≤ t` exactly when `d(t) ≤ ε`, because `d` is nonincreasing; here `π` is any
measure. -/
theorem mixingTime_le_iff [Fintype S] [Nonempty S] (κ : Kernel S S) [IsMarkovKernel κ]
    (π : Measure S) (ε : ℝ) (t : ℕ) :
    mixingTime κ π ε ≤ t ↔ tvToStationary κ π t ≤ ε :=
  sorry

/-- 1.3: `t_mix(ε) ≤ ⌈log₂ ε⁻¹⌉ t_mix(1/4)`. -/
theorem mixingTime_le_ceil_logb_mul [Fintype S] [Nonempty S] (κ : Kernel S S) [IsMarkovKernel κ]
    (π : Measure S) [IsProbabilityMeasure π] (hπ : κ.Invariant π) {ε : ℝ} (hε : 0 < ε) :
    mixingTime κ π ε ≤ (⌈Real.logb 2 ε⁻¹⌉₊ : ℕ∞) * mixingTime κ π (1 / 4) :=
  sorry

/-! ## Layer 2: spectral theory -/

/-- 2.1: the real transition matrix `P x y = κ x {y}`. -/
def transitionMatrix (κ : Kernel S S) : Matrix S S ℝ :=
  κ.toMatrix.map (↑)

/-- 2.1: a reversible chain with a positive stationary law has an orthonormal basis of `ℓ²(π)`
of real eigenfunctions with eigenvalues in `[-1, 1]`, and its transition probabilities have the
spectral decomposition `κ^t(x, {y}) = π(y) Σ_j λ_j^t f_j(x) f_j(y)`. -/
theorem exists_orthonormal_eigenbasis [Fintype S] [DecidableEq S] (κ : Kernel S S)
    [IsMarkovKernel κ] (π : Measure S) [IsProbabilityMeasure π] (hrev : κ.IsReversible π)
    (hpos : ∀ x, 0 < π {x}) :
    ∃ (l : S → ℝ) (f : S → S → ℝ),
      (∀ j, l j ∈ Set.Icc (-1 : ℝ) 1) ∧
      (∀ i j, ∑ x, f i x * f j x * π.real {x} = if i = j then 1 else 0) ∧
      (∀ j, transitionMatrix κ *ᵥ f j = l j • f j) ∧
      ∀ (t : ℕ) (x y : S),
        ((κ ^ t) x).real {y} = π.real {y} * ∑ j, l j ^ t * f j x * f j y :=
  sorry

/-- 2.2: the absolute spectral gap `γ⋆ = 1 − λ⋆`, where `λ⋆` is the largest modulus of a complex
eigenvalue of the transition matrix other than `1`, and `λ⋆ = 0` if there is none. -/
def absSpectralGap [Fintype S] [DecidableEq S] (κ : Kernel S S) : ℝ :=
  1 - sSup ((‖·‖) '' (spectrum ℂ ((transitionMatrix κ).map ((↑) : ℝ → ℂ)) \ {1}))

/-- 2.2: an irreducible chain has a positive absolute spectral gap exactly when it is
aperiodic. -/
theorem absSpectralGap_pos_iff [Fintype S] [DecidableEq S] (κ : Kernel S S) [IsMarkovKernel κ]
    [Kernel.IsIrreducible Measure.count κ] : 0 < absSpectralGap κ ↔ κ.IsAperiodic :=
  sorry

/-- 2.2: for an irreducible reversible chain, `Var_π(P^t f) ≤ (1 − γ⋆)^(2t) Var_π(f)`. -/
theorem variance_pow_mulVec_le [Fintype S] [DecidableEq S] (κ : Kernel S S) [IsMarkovKernel κ]
    [Kernel.IsIrreducible Measure.count κ] (π : Measure S) [IsProbabilityMeasure π]
    (hrev : κ.IsReversible π) (f : S → ℝ) (t : ℕ) :
    Var[(transitionMatrix κ ^ t) *ᵥ f; π] ≤ (1 - absSpectralGap κ) ^ (2 * t) * Var[f; π] :=
  sorry

/-- 2.3: every eigenvalue `z ≠ 1` of the transition matrix satisfies `|z|^t ≤ 2 d(t)`. -/
theorem norm_pow_le_two_mul_tvToStationary [Fintype S] [DecidableEq S] [Nonempty S] (κ : Kernel S S)
    [IsMarkovKernel κ] (π : Measure S) [IsProbabilityMeasure π] (hπ : κ.Invariant π) {z : ℂ}
    (hz : z ∈ spectrum ℂ ((transitionMatrix κ).map ((↑) : ℝ → ℂ))) (hz1 : z ≠ 1) (t : ℕ) :
    ‖z‖ ^ t ≤ 2 * tvToStationary κ π t :=
  sorry

/-- 2.3: the lower bound `t_mix(ε) ≥ (t_rel − 1) log (1/(2ε))` with `t_rel = 1/γ⋆`. -/
theorem ceil_le_mixingTime_of_absSpectralGap [Fintype S] [DecidableEq S] [Nonempty S]
    (κ : Kernel S S) [IsMarkovKernel κ] (π : Measure S) [IsProbabilityMeasure π]
    (hπ : κ.Invariant π) (hgap : 0 < absSpectralGap κ) (ε : ℝ) :
    ((⌈((absSpectralGap κ)⁻¹ - 1) * Real.log (1 / (2 * ε))⌉₊ : ℕ) : ℕ∞) ≤ mixingTime κ π ε :=
  sorry

/-- 2.3: for an irreducible reversible chain, `d(t) ≤ (1 − γ⋆)^t / (2 √π_min)`. -/
theorem tvToStationary_le_pow_absSpectralGap [Fintype S] [DecidableEq S] [Nonempty S]
    (κ : Kernel S S) [IsMarkovKernel κ] [Kernel.IsIrreducible Measure.count κ] (π : Measure S)
    [IsProbabilityMeasure π] (hrev : κ.IsReversible π) (t : ℕ) :
    tvToStationary κ π t ≤ (1 - absSpectralGap κ) ^ t /
      (2 * √(univ.inf' univ_nonempty fun x ↦ π.real {x})) :=
  sorry

/-- 2.3: the upper bound `t_mix(ε) ≤ ⌈t_rel (½ log (1/π_min) + log (1/(2ε)))⌉` for an
irreducible reversible chain with `γ⋆ > 0`. -/
theorem mixingTime_le_of_absSpectralGap [Fintype S] [DecidableEq S] [Nonempty S] (κ : Kernel S S)
    [IsMarkovKernel κ] [Kernel.IsIrreducible Measure.count κ] (π : Measure S)
    [IsProbabilityMeasure π] (hrev : κ.IsReversible π) (hgap : 0 < absSpectralGap κ) {ε : ℝ}
    (hε : 0 < ε) :
    mixingTime κ π ε ≤ (⌈(absSpectralGap κ)⁻¹ *
      (1 / 2 * Real.log (1 / univ.inf' univ_nonempty fun x ↦ π.real {x}) +
        Real.log (1 / (2 * ε)))⌉₊ : ℕ) :=
  sorry

/-- 2.3: for a reversible chain, `4 ‖κ^t(x, ·) − π‖_TV² ≤ κ^(2t)(x, {x}) / π(x) − 1`. -/
theorem tvDist_sq_le_of_isReversible [Fintype S] (κ : Kernel S S) [IsMarkovKernel κ] (π : Measure S)
    [IsProbabilityMeasure π] (hrev : κ.IsReversible π) (hpos : ∀ x, 0 < π {x}) (x : S) (t : ℕ) :
    tvDist ((κ ^ t) x) π ^ 2 ≤ ((κ ^ (2 * t)) x).real {x} / π.real {x} - 1 :=
  sorry

/-- 2.3: for an irreducible chain, `d(t)^(1/t)` tends to `λ⋆ = 1 − γ⋆`. -/
theorem tendsto_tvToStationary_rpow [Fintype S] [DecidableEq S] [Nonempty S] (κ : Kernel S S)
    [IsMarkovKernel κ] [Kernel.IsIrreducible Measure.count κ] (π : Measure S)
    [IsProbabilityMeasure π] (hπ : κ.Invariant π) :
    Tendsto (fun t : ℕ ↦ tvToStationary κ π t ^ (1 / (t : ℝ))) atTop
      (𝓝 (1 - absSpectralGap κ)) :=
  sorry

/-- 2.4: the Dirichlet form `E(f) = ½ Σ_{x,y} (f x − f y)² π(x) κ(x, {y})`. -/
def dirichletForm [Fintype S] (κ : Kernel S S) (π : Measure S) (f : S → ℝ) : ℝ :=
  2⁻¹ * ∑ x, ∑ y, (f x - f y) ^ 2 * π.real {x} * (κ x).real {y}

/-- 2.4: the spectral gap `γ`, the infimum of `E(f) / Var_π(f)` over the functions of nonzero
variance, and `0` if there is none. -/
def spectralGap [Fintype S] (κ : Kernel S S) (π : Measure S) : ℝ :=
  ⨅ f : {f : S → ℝ // Var[f; π] ≠ 0}, dirichletForm κ π f / Var[f; π]

/-- 2.4: for an irreducible reversible chain on at least two states, `1 − γ` is the largest
eigenvalue of the transition matrix other than `1`. -/
theorem isGreatest_spectrum_diff_one [Fintype S] [DecidableEq S] [Nontrivial S] (κ : Kernel S S)
    [IsMarkovKernel κ] [Kernel.IsIrreducible Measure.count κ] (π : Measure S)
    [IsProbabilityMeasure π] (hrev : κ.IsReversible π) :
    IsGreatest (spectrum ℝ (transitionMatrix κ) \ {1}) (1 - spectralGap κ π) :=
  sorry

/-- 2.4: the lazy chain, which stays put with probability `1/2` and otherwise moves by `κ`. -/
def lazyKernel [Countable S] (κ : Kernel S S) : Kernel S S :=
  Kernel.ofFunOfCountable fun x ↦ (2⁻¹ : ℝ≥0∞) • Measure.dirac x + (2⁻¹ : ℝ≥0∞) • κ x

/-- 2.4: the absolute spectral gap of the lazy chain of an irreducible reversible chain on at
least two states is half the spectral gap of the chain. -/
theorem absSpectralGap_lazyKernel [Fintype S] [DecidableEq S] [Nontrivial S] (κ : Kernel S S)
    [IsMarkovKernel κ] [Kernel.IsIrreducible Measure.count κ] (π : Measure S)
    [IsProbabilityMeasure π] (hrev : κ.IsReversible π) :
    absSpectralGap (lazyKernel κ) = spectralGap κ π / 2 :=
  sorry

/-- 2.4: comparison of spectral gaps from a comparison of Dirichlet forms. Stationarity of `π`
is used when `π` is a point mass, where `spectralGap κ π` is the junk value `0`. -/
theorem spectralGap_le_of_dirichletForm_le [Fintype S] [Nonempty S] (κ : Kernel S S)
    [IsMarkovKernel κ] (π : Measure S) [IsProbabilityMeasure π] (hπ : κ.Invariant π)
    (κ' : Kernel S S) [IsMarkovKernel κ'] (π' : Measure S) [IsProbabilityMeasure π']
    (hpos : ∀ x, 0 < π' {x}) {a : ℝ} (h : ∀ f, dirichletForm κ' π' f ≤ a * dirichletForm κ π f) :
    spectralGap κ' π' ≤
      (univ.sup' univ_nonempty fun x ↦ π.real {x} / π'.real {x}) * a * spectralGap κ π :=
  sorry

/-! ## Layer 3: the bottleneck ratio -/

/-- 3.1: the bottleneck ratio `Φ(A) = Q(A, Aᶜ) / π(A)` of a set of states. -/
def bottleneckRatioOf (κ : Kernel S S) (π : Measure S) (A : Set S) : ℝ :=
  (∫⁻ x in A, κ x Aᶜ ∂π).toReal / π.real A

/-- 3.1: the bottleneck ratio `Φ⋆`, the least `Φ(A)` over the sets with `0 < π(A) ≤ 1/2`, and
`0` if there is none. -/
def bottleneckRatio (κ : Kernel S S) (π : Measure S) : ℝ :=
  ⨅ A : {A : Set S // 0 < π.real A ∧ π.real A ≤ 1 / 2}, bottleneckRatioOf κ π A

/-- 3.1: `d(t) ≥ 1 − t Φ(A) − π(A)` for every set `A` of positive stationary mass. -/
theorem le_tvToStationary_of_bottleneckRatioOf [Fintype S] [Nonempty S] (κ : Kernel S S)
    [IsMarkovKernel κ] (π : Measure S) [IsProbabilityMeasure π] (hπ : κ.Invariant π) (A : Set S)
    (hA : 0 < π.real A) (t : ℕ) :
    1 - t * bottleneckRatioOf κ π A - π.real A ≤ tvToStationary κ π t :=
  sorry

/-- 3.1: `t_mix(1/4) ≥ 1 / (4 Φ⋆)`. -/
theorem ceil_le_mixingTime_of_bottleneckRatio [Fintype S] [Nonempty S] (κ : Kernel S S)
    [IsMarkovKernel κ] (π : Measure S) [IsProbabilityMeasure π] (hπ : κ.Invariant π) :
    ((⌈1 / (4 * bottleneckRatio κ π)⌉₊ : ℕ) : ℕ∞) ≤ mixingTime κ π (1 / 4) :=
  sorry

/-- 3.2: Cheeger's inequality `Φ⋆² / 2 ≤ γ ≤ 2 Φ⋆`. -/
theorem cheeger [Fintype S] (κ : Kernel S S) [IsMarkovKernel κ] (π : Measure S)
    [IsProbabilityMeasure π] (hπ : κ.Invariant π) :
    bottleneckRatio κ π ^ 2 / 2 ≤ spectralGap κ π ∧ spectralGap κ π ≤ 2 * bottleneckRatio κ π :=
  sorry

/-! ## Layer 4: couplings -/

/-- 4.1: `K` is a Markovian coupling of two copies of the chain `κ`: each row `K (x, y)` is a
coupling of `κ x` and `κ y`. For a Markov kernel `κ` every row of `K` is then a probability
measure. -/
def IsMarkovCoupling (κ : Kernel S S) (K : Kernel (S × S) (S × S)) : Prop :=
  ∀ p, TauCeti.IsCoupling (K p) (κ p.1) (κ p.2)

/-- 4.1: the coupling inequality `‖κ^t(x, ·) − κ^t(y, ·)‖_TV ≤ P_{x,y}(X_t ≠ Y_t)`. -/
theorem tvDist_pow_le_of_isMarkovCoupling [Countable S] (κ : Kernel S S) [IsMarkovKernel κ]
    (K : Kernel (S × S) (S × S)) (hK : IsMarkovCoupling κ K) (t : ℕ) (x y : S) :
    tvDist ((κ ^ t) x) ((κ ^ t) y) / 2 ≤ ((K ^ t) (x, y)).real {z | z.1 ≠ z.2} :=
  sorry

/-- 4.1: `d(t) ≤ max_{x,y} P_{x,y}(X_t ≠ Y_t)` for a stationary `π`. -/
theorem tvToStationary_le_of_isMarkovCoupling [Fintype S] [Nonempty S] (κ : Kernel S S)
    [IsMarkovKernel κ] (π : Measure S) [IsProbabilityMeasure π] (hπ : κ.Invariant π)
    (K : Kernel (S × S) (S × S)) (hK : IsMarkovCoupling κ K) (t : ℕ) :
    tvToStationary κ π t ≤
      univ.sup' univ_nonempty fun p : S × S ↦ ((K ^ t) p).real {z | z.1 ≠ z.2} :=
  sorry

/-- 4.2: path coupling. If every pair of distinct points is in `E` or has a third point on a
geodesic between them, a contraction of the transportation distance over the pairs in `E` is a
contraction over all pairs of probability measures. -/
theorem wassersteinEDist_comp_le [Fintype S] [MetricSpace S] (κ : Kernel S S) [IsMarkovKernel κ]
    (E : S → S → Prop)
    (hE : ∀ x y, x ≠ y → E x y ∨ ∃ z, z ≠ x ∧ z ≠ y ∧ dist x z + dist z y = dist x y)
    (c : ℝ≥0) (hc : ∀ x y, E x y → TauCeti.wassersteinEDist 1 (κ x) (κ y) ≤ c * edist x y)
    (μ ν : Measure S) [IsProbabilityMeasure μ] [IsProbabilityMeasure ν] :
    TauCeti.wassersteinEDist 1 (κ ∘ₘ μ) (κ ∘ₘ ν) ≤ c * TauCeti.wassersteinEDist 1 μ ν :=
  sorry

/-- 4.2: under the hypotheses of path coupling and `dist x y ≥ 1` for `x ≠ y`,
`d(t) ≤ c^t diam(S)`. -/
theorem tvToStationary_le_pow_mul_diam [Fintype S] [Nonempty S] [MetricSpace S] (κ : Kernel S S)
    [IsMarkovKernel κ] (π : Measure S) [IsProbabilityMeasure π] (hπ : κ.Invariant π)
    (hone : ∀ x y : S, x ≠ y → 1 ≤ dist x y) (E : S → S → Prop)
    (hE : ∀ x y, x ≠ y → E x y ∨ ∃ z, z ≠ x ∧ z ≠ y ∧ dist x z + dist z y = dist x y)
    (c : ℝ≥0) (hc : ∀ x y, E x y → TauCeti.wassersteinEDist 1 (κ x) (κ y) ≤ c * edist x y)
    (t : ℕ) :
    tvToStationary κ π t ≤ (c : ℝ) ^ t * Metric.diam (Set.univ : Set S) :=
  sorry

/-- 4.3: the lazy walk on the `n`-cycle that stays put with probability `1/2`, steps by `+1`
with probability `p/2` and by `-1` with probability `(1 − p)/2`. -/
def cycleWalk (n : ℕ) [NeZero n] [MeasurableSpace (ZMod n)] [MeasurableSingletonClass (ZMod n)]
    (p : unitInterval) : Kernel (ZMod n) (ZMod n) :=
  Kernel.ofFunOfCountable fun x ↦
    (2⁻¹ : ℝ≥0∞) • Measure.dirac x + (2⁻¹ : ℝ≥0∞) • bernoulliMeasure (x + 1) (x - 1) p

/-- 4.3: the lazy walk on the `n`-cycle has `d(t) ≤ n² / (4t)`. -/
theorem tvToStationary_cycleWalk_le (n : ℕ) [NeZero n] [MeasurableSpace (ZMod n)]
    [MeasurableSingletonClass (ZMod n)] (p : unitInterval) (t : ℕ) :
    4 * t * tvToStationary (cycleWalk n p) (Measure.uniformOfFinset univ) t ≤ (n : ℝ) ^ 2 :=
  sorry

/-! ## Layer 5: strong stationary times -/

/-- 5.1: the separation distance `s_x(t) = max_y (1 − κ^t(x, {y}) / π(y))`. -/
def sepDist [Fintype S] [Nonempty S] (κ : Kernel S S) (π : Measure S) (x : S) (t : ℕ) : ℝ :=
  univ.sup' univ_nonempty fun y ↦ 1 - ((κ ^ t) x).real {y} / π.real {y}

/-- 5.1: total variation distance is at most separation distance. -/
theorem tvDist_le_sepDist [Fintype S] [Nonempty S] (κ : Kernel S S) [IsMarkovKernel κ]
    (π : Measure S) [IsProbabilityMeasure π] (x : S) (t : ℕ) :
    tvDist ((κ ^ t) x) π / 2 ≤ sepDist κ π x t :=
  sorry

/-- 5.1: `s_x(t + u) ≤ s_x(t) max_z s_z(u)` for a stationary `π`. -/
theorem sepDist_add_le [Fintype S] [Nonempty S] (κ : Kernel S S) [IsMarkovKernel κ] (π : Measure S)
    [IsProbabilityMeasure π] (hπ : κ.Invariant π) (x : S) (t u : ℕ) :
    sepDist κ π x (t + u) ≤
      sepDist κ π x t * univ.sup' univ_nonempty fun z ↦ sepDist κ π z u :=
  sorry

/-- 5.1: for a reversible chain with a positive stationary law,
`s_x(2t) ≤ 1 − (1 − d̄(t))²`. -/
theorem sepDist_two_mul_le [Fintype S] [Nonempty S] (κ : Kernel S S) [IsMarkovKernel κ]
    (π : Measure S) [IsProbabilityMeasure π] (hrev : κ.IsReversible π) (hpos : ∀ y, 0 < π {y})
    (x : S) (t : ℕ) :
    sepDist κ π x (2 * t) ≤ 1 - (1 - tvBetweenStarts κ t) ^ 2 :=
  sorry

/-- 5.2: a strong stationary time `τ` for the chain started at `x` bounds the separation
distance: `s_x(t) ≤ P(τ > t)`. The process `X` is a Markov chain with kernel `κ` relative to
the filtration `ℱ`, and `τ` is a stopping time of `ℱ` with `P(τ = t, X_t = y) = P(τ = t) π(y)`. -/
theorem sepDist_le_of_strongStationaryTime [Fintype S] [Nonempty S] (κ : Kernel S S)
    [IsMarkovKernel κ] (π : Measure S) [IsProbabilityMeasure π] (hπ : κ.Invariant π)
    (hpos : ∀ y, 0 < π {y}) {Ω : Type*} {m : MeasurableSpace Ω} (P : Measure Ω)
    [IsProbabilityMeasure P] (ℱ : Filtration ℕ m) (X : ℕ → Ω → S) (hX : Adapted ℱ X) (x : S)
    (h0 : ∀ᵐ ω ∂P, X 0 ω = x)
    (hmarkov : ∀ n y, P[(X (n + 1) ⁻¹' {y}).indicator (fun _ ↦ (1 : ℝ)) | ℱ n] =ᵐ[P]
      fun ω ↦ (κ (X n ω)).real {y})
    (τ : Ω → WithTop ℕ) (hτ : IsStoppingTime ℱ τ)
    (hsst : ∀ (t : ℕ) (y : S), P {ω | τ ω = t ∧ X t ω = y} = P {ω | τ ω = t} * π {y}) (t : ℕ) :
    sepDist κ π x t ≤ P.real {ω | (t : WithTop ℕ) < τ ω} :=
  sorry

/-- 5.3: the lazy walk on the hypercube: a uniform coordinate is replaced by a uniform bit. -/
def hypercubeWalk (n : ℕ) : Kernel (Fin n → Bool) (Fin n → Bool) :=
  Kernel.ofFunOfCountable fun x ↦
    (Measure.uniformOfFinset (univ : Finset (Fin n × Bool))).map fun jb ↦
      Function.update x jb.1 jb.2

/-- 5.3: the lazy walk on the `n`-dimensional hypercube has `s_x(t) ≤ n (1 − 1/n)^t`. -/
theorem sepDist_hypercubeWalk_le (n : ℕ) [NeZero n] (x : Fin n → Bool) (t : ℕ) :
    sepDist (hypercubeWalk n) (Measure.uniformOfFinset univ) x t ≤ n * (1 - 1 / (n : ℝ)) ^ t :=
  sorry

/-- 5.3: the top-to-random shuffle of `n` cards: the top card is inserted at a uniform position.
The state `σ` gives the card `σ i` at position `i`, position `0` being the top. -/
def topToRandom (n : ℕ) [MeasurableSpace (Equiv.Perm (Fin n))]
    [MeasurableSingletonClass (Equiv.Perm (Fin n))] :
    Kernel (Equiv.Perm (Fin n)) (Equiv.Perm (Fin n)) :=
  Kernel.ofFunOfCountable fun σ ↦
    (Measure.uniformOfFinset (univ : Finset (Fin n))).map fun k ↦ σ * Fin.cycleRange k

/-- 5.3: the top-to-random shuffle of `n` cards has `s_σ(t) ≤ n (1 − 1/n)^t`. -/
theorem sepDist_topToRandom_le (n : ℕ) [NeZero n] [MeasurableSpace (Equiv.Perm (Fin n))]
    [MeasurableSingletonClass (Equiv.Perm (Fin n))] (σ : Equiv.Perm (Fin n)) (t : ℕ) :
    sepDist (topToRandom n) (Measure.uniformOfFinset univ) σ t ≤ n * (1 - 1 / (n : ℝ)) ^ t :=
  sorry

/-! ## Layer 6: Monte Carlo samplers -/

section Glauber

variable {V A : Type*} [Fintype V] [Countable A] [MeasurableSpace (V → A)]
  [MeasurableSingletonClass (V → A)]

/-- 6.1: the Glauber dynamics (Gibbs sampler) of a measure `π` on configurations: a uniform site
`v` is chosen and the configuration is redrawn from `π` conditioned on the configurations that
agree with the present one off `v`; where that conditioning event is `π`-null the configuration
is kept. -/
def glauber (π : Measure (V → A)) : Kernel (V → A) (V → A) :=
  Kernel.ofFunOfCountable fun x ↦ (Fintype.card V : ℝ≥0∞)⁻¹ • ∑ v : V,
    if π {y | ∀ w, w ≠ v → y w = x w} = 0 then Measure.dirac x
    else π[|{y | ∀ w, w ≠ v → y w = x w}]

/-- 6.1: the Glauber dynamics is a Markov kernel. -/
theorem isMarkovKernel_glauber [Nonempty V] (π : Measure (V → A)) [IsProbabilityMeasure π] :
    IsMarkovKernel (glauber π) :=
  sorry

/-- 6.1: the Glauber dynamics of `π` is reversible with respect to `π`. -/
theorem isReversible_glauber (π : Measure (V → A)) [IsProbabilityMeasure π] :
    (glauber π).IsReversible π :=
  sorry

end Glauber

section Colourings

variable {V : Type*} [Fintype V] [DecidableEq V] (G : SimpleGraph V) [DecidableRel G.Adj]

/-- 6.2: the colours allowed at the vertex `w` of the colouring `x`: those carried by no
neighbour of `w`. -/
def allowedColours {q : ℕ} (x : V → Fin q) (w : V) : Finset (Fin q) :=
  univ.filter fun c ↦ ∀ u, G.Adj w u → x u ≠ c

/-- 6.2: the Glauber dynamics for `q`-colourings, on all colourings: a uniform vertex is
recoloured with a uniform allowed colour, and is left alone if no colour is allowed. -/
def colouringGlauber (q : ℕ) [MeasurableSpace (V → Fin q)]
    [MeasurableSingletonClass (V → Fin q)] : Kernel (V → Fin q) (V → Fin q) :=
  Kernel.ofFunOfCountable fun x ↦ (Fintype.card V : ℝ≥0∞)⁻¹ • ∑ w : V,
    if (allowedColours G x w).Nonempty then
      (Measure.uniformOfFinset (allowedColours G x w)).map (Function.update x w)
    else Measure.dirac x

/-- 6.2: with more than `2Δ` colours the Glauber dynamics for colourings has
`d(t) ≤ n exp (−(q − 2Δ) t / ((q − Δ) n))`, where `n` is the number of vertices and `Δ` the
maximum degree. -/
theorem tvToStationary_colouringGlauber_le (q : ℕ) [NeZero q] [MeasurableSpace (V → Fin q)]
    [MeasurableSingletonClass (V → Fin q)] (hq : 2 * G.maxDegree < q) (π : Measure (V → Fin q))
    [IsProbabilityMeasure π] (hπ : (colouringGlauber G q).Invariant π) (t : ℕ) :
    tvToStationary (colouringGlauber G q) π t ≤
      Fintype.card V * Real.exp (-((q - 2 * G.maxDegree : ℝ) /
        ((q - G.maxDegree) * Fintype.card V)) * t) :=
  sorry

end Colourings

/-- 6.3: the ergodic theorem for an irreducible chain on a finite type: time averages of a
function converge almost surely to its stationary mean, from every initial law. -/
theorem ae_tendsto_timeAverage [Fintype S] (κ : Kernel S S) [IsMarkovKernel κ]
    [Kernel.IsIrreducible Measure.count κ] (π : Measure S) [IsProbabilityMeasure π]
    (hπ : κ.Invariant π) (ν : Measure S) [IsProbabilityMeasure ν] (f : S → ℝ) :
    ∀ᵐ ω ∂(TauCeti.Probability.markovChainLaw ν κ),
      Tendsto (fun n : ℕ ↦ (∑ k ∈ range n, f (ω k)) / n) atTop (𝓝 (∫ x, f x ∂π)) :=
  sorry

/-- 6.4: for a stationary reversible chain, the centred sum of `f` along `t` steps has second
moment at most `2 t Var_π(f) / γ`. -/
theorem spectralGap_mul_integral_sq_sum_le [Fintype S] (κ : Kernel S S) [IsMarkovKernel κ]
    (π : Measure S) [IsProbabilityMeasure π] (hrev : κ.IsReversible π) (f : S → ℝ) (t : ℕ) :
    spectralGap κ π * ∫ ω, (∑ s ∈ range t, (f (ω s) - ∫ x, f x ∂π)) ^ 2
        ∂(TauCeti.Probability.markovChainLaw π κ) ≤ 2 * t * Var[f; π] :=
  sorry

/-- 6.4: the error of a Markov chain Monte Carlo average. For a reversible chain, after a
burn-in of `r ≥ t_mix(ε/2)` steps, an average over `t ≥ 4 Var_π(f) / (η² ε γ)` steps misses the
stationary mean by `η` or more with probability at most `ε`, from every starting state. -/
theorem measureReal_timeAverage_deviation_le [Fintype S] [Nonempty S] (κ : Kernel S S)
    [IsMarkovKernel κ] (π : Measure S) [IsProbabilityMeasure π] (hrev : κ.IsReversible π)
    (f : S → ℝ) {η ε : ℝ} (hη : 0 < η) (hε : 0 < ε) {r t : ℕ} (ht : 0 < t)
    (hr : mixingTime κ π (ε / 2) ≤ r) (hlen : 4 * Var[f; π] ≤ η ^ 2 * ε * spectralGap κ π * t)
    (x : S) :
    (TauCeti.Probability.markovChainLaw (Measure.dirac x) κ).real
      {ω | η ≤ |(∑ s ∈ range t, f (ω (r + s))) / t - ∫ y, f y ∂π|} ≤ ε :=
  sorry

end TauCetiRoadmap.MarkovChainMixing
