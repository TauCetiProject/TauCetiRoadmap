import Mathlib
import TauCeti.MeasureTheory.OptimalTransport.Wasserstein.Basic
import TauCeti.Probability.Kernel.Matrix

/-!
# Glauber dynamics of the Ising model: target signatures

**This file is not the roadmap.** The roadmap is `README.md`. This file states the roadmap's
headline theorems against the pinned Mathlib and Tau Ceti, each with `sorry`, together with
the definitions they need; every definition has a real body. Every headline theorem of the README is
statable at the pins and is stated here. The README's remaining targets, API lists and Checks are
not restated.

Several definitions are verbatim copies of definitions of other roadmaps, which own them and whose
Lean files cannot be imported: `spin` and `ising` (QuantumOptimization 1.1); `gibbs`
(SimulatedAnnealing 3.1); `tvToStationary`, `mixingTime`, `transitionMatrix`, `absSpectralGap`,
`dirichletForm`, `spectralGap` and `glauber` (MarkovChainMixing 1.2, 1.3, 2.1, 2.2, 2.4 and 6.1);
`backwardMap` and `backwardCoalescenceTime` (CouplingFromThePast 1.1 and 2.1).

Configurations are `x : V → Bool`; the spin `spin x v` is `−1` when `x v` is true and `1`
otherwise. The Ising law of a graph `G` at inverse temperature `β` is the Gibbs law of the energy
`ising (−½ A) 0`, where `A` is the adjacency matrix: `ising` sums over ordered pairs, so this is
`−Σ_{{v,w} ∈ E} σ(v) σ(w)` summed over the edges. Total variation is normalized as in
MarkovChainMixing: the distance of two probability measures is `tvDist μ ν / 2`.
-/

noncomputable section

open Filter Topology MeasureTheory ProbabilityTheory Finset
open scoped NNReal ENNReal Matrix

namespace TauCetiRoadmap.GlauberDynamicsOfTheIsingModel

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

/-- 1.1 (copied verbatim from MarkovChainMixing 2.1): the real transition matrix
`P x y = κ x {y}`. -/
def transitionMatrix (κ : Kernel S S) : Matrix S S ℝ :=
  κ.toMatrix.map (↑)

/-- 1.1 (copied verbatim from MarkovChainMixing 2.2): the absolute spectral gap `γ⋆ = 1 − λ⋆`,
where `λ⋆` is the largest modulus of a complex eigenvalue of the transition matrix other than
`1`, and `λ⋆ = 0` if there is none. -/
def absSpectralGap [Fintype S] [DecidableEq S] (κ : Kernel S S) : ℝ :=
  1 - sSup ((‖·‖) '' (spectrum ℂ ((transitionMatrix κ).map ((↑) : ℝ → ℂ)) \ {1}))

/-- 1.1 (copied verbatim from MarkovChainMixing 2.4): the Dirichlet form
`E(f) = ½ Σ_{x,y} (f x − f y)² π(x) κ(x, {y})`. -/
def dirichletForm [Fintype S] (κ : Kernel S S) (π : Measure S) (f : S → ℝ) : ℝ :=
  2⁻¹ * ∑ x, ∑ y, (f x - f y) ^ 2 * π.real {x} * (κ x).real {y}

/-- 1.1 (copied verbatim from MarkovChainMixing 2.4): the spectral gap `γ`, the infimum of
`E(f) / Var_π(f)` over the functions of nonzero variance, and `0` if there is none. -/
def spectralGap [Fintype S] (κ : Kernel S S) (π : Measure S) : ℝ :=
  ⨅ f : {f : S → ℝ // Var[f; π] ≠ 0}, dirichletForm κ π f / Var[f; π]

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

/-! ## Definitions copied verbatim from CouplingFromThePast 1.1 and 2.1 -/

section CopiedFromCouplingFromThePast

variable {S ξ Ω : Type*}

/-- 1.3 (copied verbatim from CouplingFromThePast 1.1): the backward composition
`F_t = f(·, u 0) ∘ f(·, u 1) ∘ ⋯ ∘ f(·, u (t − 1))`, in which `u k` is the noise of the step from
time `−(k + 1)` to time `−k`. The oldest noise acts first. -/
def backwardMap (f : S → ξ → S) (u : ℕ → ξ) : ℕ → S → S
  | 0 => id
  | t + 1 => fun x => backwardMap f u t (f x (u t))

/-- 1.3 (copied verbatim from CouplingFromThePast 2.1): the backward coalescence time, the least
`t` at which the backward composition is constant, and `⊤` if there is none. -/
def backwardCoalescenceTime (f : S → ξ → S) (u : ℕ → ξ) : ℕ∞ :=
  ⨅ (t : ℕ) (_ : ∀ x y, backwardMap f u t x = backwardMap f u t y), (t : ℕ∞)

end CopiedFromCouplingFromThePast

/-! ## Layer 1: the Ising law and its heat-bath dynamics -/

section Ising

variable {V : Type*} [Fintype V] [DecidableEq V] [MeasurableSpace (V → Bool)]
  [MeasurableSingletonClass (V → Bool)]

/-- 1.1: the Ising law `π_β(σ) ∝ exp(β Σ_{{v,w} ∈ E} σ(v) σ(w))` of a finite simple graph `G`
at inverse temperature `β`, with no external field: the Gibbs law of the energy
`ising (−½ A) 0`, where `A` is the adjacency matrix of `G`. -/
def isingGibbs (G : SimpleGraph V) [DecidableRel G.Adj] (β : ℝ) : Measure (V → Bool) :=
  gibbs (ising (-(1 / 2 : ℝ) • G.adjMatrix ℝ) 0) β

/-- 1.1: the sum `S(x, v) = Σ_{w ∼ v} σ(w)` of the spins of the neighbours of `v`. -/
def neighbourSum (G : SimpleGraph V) [DecidableRel G.Adj] (x : V → Bool) (v : V) : ℝ :=
  ∑ w ∈ G.neighborFinset v, spin x w

/-- 1.2: the heat-bath formula. The Glauber dynamics of the Ising law picks a uniform vertex `v`
and gives it the spin `+1` (the value `false`) with probability `(1 + tanh(β S(x, v)))/2` and the
spin `−1` (the value `true`) with the complementary probability; every real `β` is allowed. -/
theorem glauber_isingGibbs_apply (G : SimpleGraph V) [DecidableRel G.Adj] (β : ℝ)
    (x : V → Bool) :
    glauber (isingGibbs G β) x = (Fintype.card V : ℝ≥0∞)⁻¹ • ∑ v : V,
      (ENNReal.ofReal ((1 + Real.tanh (β * neighbourSum G x v)) / 2) •
          Measure.dirac (Function.update x v false) +
        ENNReal.ofReal ((1 - Real.tanh (β * neighbourSum G x v)) / 2) •
          Measure.dirac (Function.update x v true)) :=
  sorry

/-- 1.3: the heat-bath update driven by a site `v` and a number `u ∈ [0, 1]`: the spin at `v`
becomes `+1` (the value `false`) when `u ≤ (1 + tanh(β S(x, v)))/2` and `−1` (the value `true`)
otherwise; the other spins are kept. -/
def isingUpdate (G : SimpleGraph V) [DecidableRel G.Adj] (β : ℝ) (x : V → Bool)
    (vu : V × unitInterval) : V → Bool :=
  Function.update x vu.1 (decide ((1 + Real.tanh (β * neighbourSum G x vu.1)) / 2 < (vu.2 : ℝ)))

/-- 1.3: with a uniform site and an independent uniform number in `[0, 1]`, the heat-bath update
from `x` has law `glauber (isingGibbs G β) x`: it is a random mapping representation of the
Glauber dynamics. -/
theorem map_isingUpdate [MeasurableSpace V] [MeasurableSingletonClass V] (G : SimpleGraph V)
    [DecidableRel G.Adj] (β : ℝ) (x : V → Bool) :
    ((Measure.uniformOfFinset (univ : Finset V)).prod (volume : Measure unitInterval)).map
      (isingUpdate G β x) = glauber (isingGibbs G β) x :=
  sorry

/-- 1.3: for `β ≥ 0` every heat-bath update is monotone for the coordinatewise order on
`V → Bool` (`false < true`, so more `true` values means more spins `−1`). -/
theorem monotone_isingUpdate (G : SimpleGraph V) [DecidableRel G.Adj] {β : ℝ} (hβ : 0 ≤ β)
    (vu : V × unitInterval) : Monotone fun x ↦ isingUpdate G β x vu :=
  sorry

end Ising

/-! ## Layer 2: contraction -/

section Chen

variable {S : Type*} [MeasurableSpace S] [MeasurableSingletonClass S]

/-- 2.1: Chen's theorem. If the transportation distance between the rows of a Markov kernel on a
finite metric space contracts every distance by the factor `θ`, then every complex eigenvalue
`z ≠ 1` of its transition matrix has `‖z‖ ≤ θ`. -/
theorem norm_le_of_wassersteinEDist_le [Fintype S] [DecidableEq S] [MetricSpace S]
    (κ : Kernel S S) [IsMarkovKernel κ] (θ : ℝ≥0)
    (hθ : ∀ x y, TauCeti.wassersteinEDist 1 (κ x) (κ y) ≤ θ * edist x y) {z : ℂ}
    (hz : z ∈ spectrum ℂ ((transitionMatrix κ).map ((↑) : ℝ → ℂ))) (hz1 : z ≠ 1) :
    ‖z‖ ≤ θ :=
  sorry

end Chen

section Ising

variable {V : Type*} [Fintype V] [DecidableEq V] [MeasurableSpace (V → Bool)]
  [MeasurableSingletonClass (V → Bool)]

/-- 2.2: the one-step coupling of the Ising heat bath. For `β ≥ 0`, two configurations that
differ only at `v` have one-step laws with a coupling whose expected Hamming distance is at most
`1 − (1 − Δ tanh β)/n`. -/
theorem exists_isCoupling_integral_hammingDist_le (G : SimpleGraph V) [DecidableRel G.Adj]
    {β : ℝ} (hβ : 0 ≤ β) (x : V → Bool) (v : V) :
    ∃ γ : Measure ((V → Bool) × (V → Bool)),
      TauCeti.IsCoupling γ (glauber (isingGibbs G β) x)
        (glauber (isingGibbs G β) (Function.update x v (!x v))) ∧
      ∫ p, (hammingDist p.1 p.2 : ℝ) ∂γ ≤
        1 - (1 - G.maxDegree * Real.tanh β) / Fintype.card V :=
  sorry

/-- 2.2: the one-step coupling on a graph all of whose degrees are even: the bound improves to
`1 − (1 − (Δ/2) tanh 2β)/n`. -/
theorem exists_isCoupling_integral_hammingDist_le_of_even (G : SimpleGraph V)
    [DecidableRel G.Adj] (heven : ∀ w, Even (G.degree w)) {β : ℝ} (hβ : 0 ≤ β) (x : V → Bool)
    (v : V) :
    ∃ γ : Measure ((V → Bool) × (V → Bool)),
      TauCeti.IsCoupling γ (glauber (isingGibbs G β) x)
        (glauber (isingGibbs G β) (Function.update x v (!x v))) ∧
      ∫ p, (hammingDist p.1 p.2 : ℝ) ∂γ ≤
        1 - (1 - G.maxDegree / 2 * Real.tanh (2 * β)) / Fintype.card V :=
  sorry

/-! ## Layer 3: fast mixing at high temperature -/

/-- 3.1: fast mixing when `Δ tanh β < 1`. With `c = 1 − Δ tanh β`, the relaxation time is at
most `n / c`, `d(t) ≤ n (1 − c/n)^t`, and `t_mix(ε) ≤ ⌈n (log n + log(1/ε)) / c⌉`. -/
theorem glauber_isingGibbs_fastMixing [Nonempty V] (G : SimpleGraph V) [DecidableRel G.Adj]
    {β : ℝ} (hβ : 0 ≤ β) (hc : G.maxDegree * Real.tanh β < 1) :
    (absSpectralGap (glauber (isingGibbs G β)))⁻¹ ≤
        Fintype.card V / (1 - G.maxDegree * Real.tanh β) ∧
      (∀ t : ℕ, tvToStationary (glauber (isingGibbs G β)) (isingGibbs G β) t ≤
        Fintype.card V * (1 - (1 - G.maxDegree * Real.tanh β) / Fintype.card V) ^ t) ∧
      ∀ ε : ℝ, 0 < ε → mixingTime (glauber (isingGibbs G β)) (isingGibbs G β) ε ≤
        (⌈Fintype.card V * (Real.log (Fintype.card V) + Real.log (1 / ε)) /
          (1 - G.maxDegree * Real.tanh β)⌉₊ : ℕ) :=
  sorry

/-- 3.1: fast mixing on a graph all of whose degrees are even, when `(Δ/2) tanh 2β < 1`: the
three bounds hold with `c_e = 1 − (Δ/2) tanh 2β` in place of `c`. -/
theorem glauber_isingGibbs_fastMixing_of_even [Nonempty V] (G : SimpleGraph V)
    [DecidableRel G.Adj] (heven : ∀ w, Even (G.degree w)) {β : ℝ} (hβ : 0 ≤ β)
    (hc : G.maxDegree / 2 * Real.tanh (2 * β) < 1) :
    (absSpectralGap (glauber (isingGibbs G β)))⁻¹ ≤
        Fintype.card V / (1 - G.maxDegree / 2 * Real.tanh (2 * β)) ∧
      (∀ t : ℕ, tvToStationary (glauber (isingGibbs G β)) (isingGibbs G β) t ≤
        Fintype.card V *
          (1 - (1 - G.maxDegree / 2 * Real.tanh (2 * β)) / Fintype.card V) ^ t) ∧
      ∀ ε : ℝ, 0 < ε → mixingTime (glauber (isingGibbs G β)) (isingGibbs G β) ε ≤
        (⌈Fintype.card V * (Real.log (Fintype.card V) + Real.log (1 / ε)) /
          (1 - G.maxDegree / 2 * Real.tanh (2 * β))⌉₊ : ℕ) :=
  sorry

/-- 3.2: the complete graph at `β = α/n` with `0 ≤ α < 1`:
`t_mix(ε) ≤ ⌈n (log n + log(1/ε)) / (1 − α)⌉`. -/
theorem mixingTime_glauber_isingGibbs_top_le [Nonempty V] {α : ℝ} (hα0 : 0 ≤ α) (hα1 : α < 1)
    {ε : ℝ} (hε : 0 < ε) :
    mixingTime (glauber (isingGibbs (⊤ : SimpleGraph V) (α / Fintype.card V)))
        (isingGibbs (⊤ : SimpleGraph V) (α / Fintype.card V)) ε ≤
      (⌈Fintype.card V * (Real.log (Fintype.card V) + Real.log (1 / ε)) / (1 - α)⌉₊ : ℕ) :=
  sorry

/-- 3.3: exact sampling at high temperature. For `β ≥ 0`, driving the heat-bath updates by
independent uniform pairs (site, number), the backward coalescence time `T` of coupling from the
past satisfies `P(T > t) ≤ 2 n² (1 − c/n)^t` with `c = 1 − Δ tanh β`. -/
theorem measureReal_lt_backwardCoalescenceTime_isingUpdate_le [MeasurableSpace V]
    [MeasurableSingletonClass V] (G : SimpleGraph V) [DecidableRel G.Adj] {β : ℝ} (hβ : 0 ≤ β)
    {Ω : Type*} [MeasurableSpace Ω] {U : ℕ → Ω → V × unitInterval} {P : Measure Ω}
    (hU : ∀ i, Measurable (U i)) (hindep : iIndepFun U P)
    (hlaw : ∀ i, HasLaw (U i)
      ((Measure.uniformOfFinset (univ : Finset V)).prod (volume : Measure unitInterval)) P)
    (t : ℕ) :
    P.real {ω | (t : ℕ∞) < backwardCoalescenceTime (isingUpdate G β) (fun i ↦ U i ω)} ≤
      2 * (Fintype.card V : ℝ) ^ 2 *
        (1 - (1 - G.maxDegree * Real.tanh β) / Fintype.card V) ^ t :=
  sorry

/-! ## Layer 4: the cycle, the tree and the removal of edges -/

/-- 4.3: removing edges. If `G' ≤ G`, `r` edges of `G` are missing from `G'`, `Δ` is the maximum
degree of `G` and `β ≥ 0`, the spectral gaps satisfy `γ' ≤ exp(2β(Δ + 2r)) γ`. -/
theorem spectralGap_glauber_isingGibbs_le_of_le (G G' : SimpleGraph V) [DecidableRel G.Adj]
    [DecidableRel G'.Adj] (hle : G' ≤ G) {β : ℝ} (hβ : 0 ≤ β) :
    spectralGap (glauber (isingGibbs G' β)) (isingGibbs G' β) ≤
      Real.exp (2 * β * (G.maxDegree + 2 * (G.edgeFinset \ G'.edgeFinset).card)) *
        spectralGap (glauber (isingGibbs G β)) (isingGibbs G β) :=
  sorry

end Ising

/-- 4.1: the `n`-cycle with `n ≥ 3` and `β ≥ 0`: the absolute spectral gap of the Glauber
dynamics is exactly `(1 − tanh 2β)/n`, that is, `t_rel = n / (1 − tanh 2β)`. -/
theorem absSpectralGap_glauber_isingGibbs_cycleGraph (n : ℕ) (hn : 3 ≤ n)
    [MeasurableSpace (Fin n → Bool)] [MeasurableSingletonClass (Fin n → Bool)] {β : ℝ}
    (hβ : 0 ≤ β) :
    absSpectralGap (glauber (isingGibbs (SimpleGraph.cycleGraph n) β)) =
      (1 - Real.tanh (2 * β)) / n :=
  sorry

/-- 4.2: the complete rooted `b`-ary tree of depth `k`, on the vertices
`0, 1, …, Σ_{d ≤ k} b^d − 1` numbered level by level: the parent of a vertex `j > 0` is
`(j − 1) / b`. -/
def baryTree (b k : ℕ) : SimpleGraph (Fin (∑ d ∈ range (k + 1), b ^ d)) :=
  SimpleGraph.fromRel fun i j ↦ 0 < j.val ∧ i.val = (j.val - 1) / b

/-- 4.2: the tree at high temperature. With `θ = tanh β`, `β ≥ 0` and `2 θ √b < 1`, the Glauber
dynamics on the `b`-ary tree with `n` vertices has
`t_mix(ε) ≤ ⌈(n / (1 − 2θ√b)) ((3/2) log n + log(1/ε))⌉`. -/
theorem mixingTime_glauber_isingGibbs_baryTree_le (b k : ℕ)
    [MeasurableSpace (Fin (∑ d ∈ range (k + 1), b ^ d) → Bool)]
    [MeasurableSingletonClass (Fin (∑ d ∈ range (k + 1), b ^ d) → Bool)]
    [DecidableRel (baryTree b k).Adj] {β : ℝ} (hβ : 0 ≤ β)
    (hθ : 2 * Real.tanh β * Real.sqrt b < 1) {ε : ℝ} (hε : 0 < ε) :
    mixingTime (glauber (isingGibbs (baryTree b k) β)) (isingGibbs (baryTree b k) β) ε ≤
      (⌈(∑ d ∈ range (k + 1), b ^ d : ℕ) / (1 - 2 * Real.tanh β * Real.sqrt b) *
        (3 / 2 * Real.log (∑ d ∈ range (k + 1), b ^ d : ℕ) + Real.log (1 / ε))⌉₊ : ℕ) :=
  sorry

end TauCetiRoadmap.GlauberDynamicsOfTheIsingModel
