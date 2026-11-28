import Mathlib

/-!
# Restricted Boltzmann machines: target signatures

**This file is not the roadmap.** The roadmap is `README.md`. This file states the roadmap's
headline theorems against the pinned Mathlib, each with `sorry`, together with the definitions
they need; every definition has a real body. Two definitions are verbatim copies, because a
roadmap's Lean file cannot import another roadmap's module: `bit` from QuantumOptimization 1.1
and `gibbs` from SimulatedAnnealing 3.1. Every headline theorem of the README is statable at the
pins and is stated here. The README's remaining targets, API lists and Checks are not restated.

Visible configurations are `v : ι → Bool`, hidden ones `h : κ → Bool`, with `bit` giving the
`{0, 1}` value of a unit. The parameters `θ` of a machine are one vector of the Euclidean space
indexed by `(κ × ι) ⊕ ι ⊕ κ`: the weight `W i j` of the edge between hidden unit `i` and visible
unit `j` is the coordinate `Sum.inl (i, j)`, the visible bias `b j` is `Sum.inr (Sum.inl j)` and
the hidden bias `c i` is `Sum.inr (Sum.inr i)`. Total variation is written `tvDist μ ν / 2`, with
Mathlib's `MeasureTheory.tvDist` (the total variation norm, in `[0, 2]` on probability measures).
-/

noncomputable section

open MeasureTheory ProbabilityTheory InformationTheory Finset

namespace TauCetiRoadmap.RestrictedBoltzmannMachines

section CopiedBit

variable {ι : Type*} [Fintype ι]

/-- 1.1 (copied verbatim from QuantumOptimization 1.1): the `{0,1}` value of variable `i` in the
configuration `x`: `1` if `x i` is true. -/
def bit (x : ι → Bool) (i : ι) : ℝ := if x i then 1 else 0

end CopiedBit

section CopiedGibbs

variable {S : Type*} [MeasurableSpace S] [MeasurableSingletonClass S]

/-- 1.1 (copied verbatim from SimulatedAnnealing 3.1): the Gibbs measure
`π_β(x) = exp(−β U x) / Σ_y exp(−β U y)` of an energy `U` on a finite set at inverse
temperature `β`. -/
def gibbs [Fintype S] (U : S → ℝ) (β : ℝ) : Measure S :=
  ∑ x, ENNReal.ofReal (Real.exp (-(β * U x)) / ∑ y, Real.exp (-(β * U y))) • Measure.dirac x

end CopiedGibbs

/-! ## Layer 1: the model, its conditionals and its free energy -/

section Model

variable {ι κ : Type*} [Fintype ι] [DecidableEq ι] [Fintype κ] [DecidableEq κ]

/-- 1.1: the parameter space of a machine with visible units `ι` and hidden units `κ`: weights
at `Sum.inl (i, j)`, visible biases at `Sum.inr (Sum.inl j)`, hidden biases at
`Sum.inr (Sum.inr i)`. -/
abbrev Params (ι κ : Type*) [Fintype ι] [Fintype κ] : Type _ :=
  EuclideanSpace ℝ ((κ × ι) ⊕ ι ⊕ κ)

/-- 1.1: the energy `E(v, h) = −Σ_i Σ_j W i j h_i v_j − Σ_j b_j v_j − Σ_i c_i h_i`. -/
def energy (θ : Params ι κ) (v : ι → Bool) (h : κ → Bool) : ℝ :=
  -(∑ i, ∑ j, θ (Sum.inl (i, j)) * bit h i * bit v j) - ∑ j, θ (Sum.inr (Sum.inl j)) * bit v j
    - ∑ i, θ (Sum.inr (Sum.inr i)) * bit h i

/-- 1.1: the joint law of the visible and the hidden configuration, the Gibbs measure of the
energy at inverse temperature `1`. -/
def jointLaw (θ : Params ι κ) : Measure ((ι → Bool) × (κ → Bool)) :=
  gibbs (fun x ↦ energy θ x.1 x.2) 1

/-- 1.1: the law of the visible configuration, the first marginal of the joint law. -/
def visibleLaw (θ : Params ι κ) : Measure (ι → Bool) :=
  (jointLaw θ).map Prod.fst

/-- 1.1: the law of the hidden configuration, the second marginal of the joint law. -/
def hiddenLaw (θ : Params ι κ) : Measure (κ → Bool) :=
  (jointLaw θ).map Prod.snd

/-- 1.2: the input `c_i + Σ_j W i j v_j` of hidden unit `i` given the visible configuration. -/
def hiddenField (θ : Params ι κ) (v : ι → Bool) (i : κ) : ℝ :=
  θ (Sum.inr (Sum.inr i)) + ∑ j, θ (Sum.inl (i, j)) * bit v j

/-- 1.2: the input `b_j + Σ_i W i j h_i` of visible unit `j` given the hidden configuration. -/
def visibleField (θ : Params ι κ) (h : κ → Bool) (j : ι) : ℝ :=
  θ (Sum.inr (Sum.inl j)) + ∑ i, θ (Sum.inl (i, j)) * bit h i

/-- 1.2: the product law of the hidden units given `v`: unit `i` is on with probability
`σ(hiddenField θ v i)`, independently of the others. -/
def hiddenKernel (θ : Params ι κ) : Kernel (ι → Bool) (κ → Bool) :=
  Kernel.ofFunOfCountable fun v ↦
    ∑ h, ENNReal.ofReal (∏ i, Real.sigmoid (if h i then hiddenField θ v i
      else -hiddenField θ v i)) • Measure.dirac h

/-- 1.2: the product law of the visible units given `h`: unit `j` is on with probability
`σ(visibleField θ h j)`, independently of the others. -/
def visibleKernel (θ : Params ι κ) : Kernel (κ → Bool) (ι → Bool) :=
  Kernel.ofFunOfCountable fun h ↦
    ∑ v, ENNReal.ofReal (∏ j, Real.sigmoid (if v j then visibleField θ h j
      else -visibleField θ h j)) • Measure.dirac v

/-- 1.2: conditional independence within each layer, with the conditional laws in closed form:
the joint law is the visible law followed by `hiddenKernel`, and, read from the hidden side, the
hidden law followed by `visibleKernel`. -/
theorem jointLaw_eq_compProd (θ : Params ι κ) :
    jointLaw θ = visibleLaw θ ⊗ₘ hiddenKernel θ ∧
      (jointLaw θ).map Prod.swap = hiddenLaw θ ⊗ₘ visibleKernel θ :=
  sorry

/-- 1.3: the free energy `F(v) = −Σ_j b_j v_j − Σ_i log (1 + exp (c_i + Σ_j W i j v_j))`. -/
def freeEnergy (θ : Params ι κ) (v : ι → Bool) : ℝ :=
  -(∑ j, θ (Sum.inr (Sum.inl j)) * bit v j) - ∑ i, Real.log (1 + Real.exp (hiddenField θ v i))

/-- 1.3: the visible law is the Gibbs measure of the free energy:
`p(v) = exp(b · v) Π_i (1 + exp(c_i + Σ_j W i j v_j)) / Z`. -/
theorem visibleLaw_eq_gibbs_freeEnergy (θ : Params ι κ) :
    visibleLaw θ = gibbs (freeEnergy θ) 1 :=
  sorry

end Model

/-! ## Layer 2: the gradient of the log-likelihood -/

section Gradient

variable {ι κ : Type*} [Fintype ι] [DecidableEq ι] [Fintype κ] [DecidableEq κ]

/-- 2.1: the conditional mean, given `v`, of the sufficient statistic `(h_i v_j, v_j, h_i)`:
`σ(hiddenField θ v i) v_j` at a weight, `v_j` at a visible bias and `σ(hiddenField θ v i)` at a
hidden bias. -/
def condStat (θ : Params ι κ) (v : ι → Bool) : Params ι κ :=
  WithLp.toLp 2 (Sum.elim (fun p ↦ Real.sigmoid (hiddenField θ v p.1) * bit v p.2)
    (Sum.elim (fun j ↦ bit v j) (fun i ↦ Real.sigmoid (hiddenField θ v i))))

/-- 2.1: the gradient of the average log-likelihood under a data law `q` is the data mean of
`condStat` minus its mean under the visible law of the machine. -/
theorem hasFDerivAt_integral_log_visibleLaw (q : Measure (ι → Bool)) [IsProbabilityMeasure q]
    (θ : Params ι κ) :
    HasFDerivAt (fun θ' : Params ι κ ↦ ∫ v, Real.log ((visibleLaw θ').real {v}) ∂q)
      (innerSL ℝ ((∫ v, condStat θ v ∂q) - ∫ v, condStat θ v ∂visibleLaw θ)) θ :=
  sorry

end Gradient

/-! ## Layer 3: block Gibbs sampling -/

section Sampling

variable {ι κ : Type*} [Fintype ι] [DecidableEq ι] [Fintype κ] [DecidableEq κ]

/-- 3.1: the block update of the hidden layer: keep `v`, draw a new hidden configuration from
`hiddenKernel θ v`. -/
def hiddenUpdate (θ : Params ι κ) : Kernel ((ι → Bool) × (κ → Bool)) ((ι → Bool) × (κ → Bool)) :=
  Kernel.ofFunOfCountable fun x ↦ (hiddenKernel θ x.1).map (Prod.mk x.1)

/-- 3.1: the block update of the visible layer: keep `h`, draw a new visible configuration from
`visibleKernel θ h`. -/
def visibleUpdate (θ : Params ι κ) : Kernel ((ι → Bool) × (κ → Bool)) ((ι → Bool) × (κ → Bool)) :=
  Kernel.ofFunOfCountable fun x ↦ (visibleKernel θ x.2).map fun v ↦ (v, x.2)

/-- 3.1: each block update is reversible for the joint law. -/
theorem isReversible_hiddenUpdate_and_visibleUpdate (θ : Params ι κ) :
    (hiddenUpdate θ).IsReversible (jointLaw θ) ∧ (visibleUpdate θ).IsReversible (jointLaw θ) :=
  sorry

/-- 3.2: the visible chain `Q(v, v') = Σ_h p(h | v) p(v' | h)` of alternating block Gibbs
sampling: first the hidden layer, then the visible layer. -/
def visibleChain (θ : Params ι κ) : Kernel (ι → Bool) (ι → Bool) :=
  visibleKernel θ ∘ₖ hiddenKernel θ

/-- 3.2: the visible chain is reversible for the visible law. -/
theorem isReversible_visibleChain (θ : Params ι κ) :
    (visibleChain θ).IsReversible (visibleLaw θ) :=
  sorry

end Sampling

/-! ## Layer 4: geometric ergodicity and the bias of contrastive divergence -/

section Contrastive

variable {ι κ : Type*} [Fintype ι] [DecidableEq ι] [Fintype κ] [DecidableEq κ]

/-- 4.1: the minorization constant `Π_j 2 σ(−A_j)` with `A_j = |b_j| + Σ_i |W i j|`; it lies in
`(0, 1]`. -/
def minorizationConst (θ : Params ι κ) : ℝ :=
  ∏ j, 2 * Real.sigmoid (-(|θ (Sum.inr (Sum.inl j))| + ∑ i, |θ (Sum.inl (i, j))|))

/-- 4.1: geometric ergodicity of the visible chain with an explicit rate: after `k` steps the
distance to the visible law has contracted at least by the factor `(1 − minorizationConst θ)^k`. -/
theorem tvDist_bind_visibleChain_pow_le (θ : Params ι κ) (μ : Measure (ι → Bool))
    [IsProbabilityMeasure μ] (k : ℕ) :
    tvDist (μ.bind (visibleChain θ ^ k)) (visibleLaw θ) / 2 ≤
      (1 - minorizationConst θ) ^ k * (tvDist μ (visibleLaw θ) / 2) :=
  sorry

/-- 4.2: the `k`-step contrastive divergence approximation of the gradient of 2.1 for the data
law `q`: the model mean of `condStat` is replaced by its mean after `k` steps of the visible
chain started from `q`. -/
def cdGradient (θ : Params ι κ) (k : ℕ) (q : Measure (ι → Bool)) : Params ι κ :=
  (∫ v, condStat θ v ∂q) - ∫ v, condStat θ v ∂(q.bind (visibleChain θ ^ k))

/-- 4.2: the bias of contrastive divergence: in every coordinate, the gradient of 2.1 and its
`k`-step approximation differ by at most `(1 − minorizationConst θ)^k` times the distance from
the data law to the visible law. -/
theorem abs_sub_cdGradient_le (θ : Params ι κ) (q : Measure (ι → Bool)) [IsProbabilityMeasure q]
    (k : ℕ) (a : (κ × ι) ⊕ ι ⊕ κ) :
    |((∫ v, condStat θ v ∂q) - (∫ v, condStat θ v ∂visibleLaw θ) - cdGradient θ k q) a| ≤
      (1 - minorizationConst θ) ^ k * (tvDist q (visibleLaw θ) / 2) :=
  sorry

end Contrastive

/-! ## Layer 5: representational power -/

section Representation

variable {ι κ : Type*} [Fintype ι] [DecidableEq ι] [Fintype κ] [DecidableEq κ]

/-- 5.1: the machine with one more hidden unit, indexed by `none`, with weights `w` to the
visible units and bias `c`; the other parameters are those of `θ`. -/
def addHidden (θ : Params ι κ) (w : ι → ℝ) (c : ℝ) : Params ι (Option κ) :=
  WithLp.toLp 2 (Sum.elim (fun p ↦ Option.elim p.1 (w p.2) fun i ↦ θ (Sum.inl (i, p.2)))
    (Sum.elim (fun j ↦ θ (Sum.inr (Sum.inl j)))
      (fun o ↦ Option.elim o c fun i ↦ θ (Sum.inr (Sum.inr i)))))

/-- 5.1: adding a hidden unit strictly improves the approximation of every law that the machine
does not represent exactly (Le Roux–Bengio, Theorem 2.3). -/
theorem exists_klDiv_addHidden_lt (θ : Params ι κ) (q : Measure (ι → Bool))
    [IsProbabilityMeasure q] (hq : q ≠ visibleLaw θ) :
    ∃ (w : ι → ℝ) (c : ℝ), klDiv q (visibleLaw (addHidden θ w c)) < klDiv q (visibleLaw θ) :=
  sorry

/-- 5.2: a law whose support lies in the union of `r` edges of the cube `{0, 1}^ι` (the edge `k`
joins `y k` to the configuration that differs from it in the unit `l k` alone) is approximated
arbitrarily well in relative entropy by machines with `r − 1` hidden units (Montúfar–Ay,
Theorem 1). -/
theorem exists_klDiv_lt_of_support_subset_edges (q : Measure (ι → Bool)) [IsProbabilityMeasure q]
    {r : ℕ} (y : Fin r → ι → Bool) (l : Fin r → ι)
    (hq : ∀ v, q {v} ≠ 0 → ∃ k, v = y k ∨ v = Function.update (y k) (l k) (!y k (l k)))
    {ε : ℝ} (hε : 0 < ε) :
    ∃ θ : Params ι (Fin (r - 1)), klDiv q (visibleLaw θ) < ENNReal.ofReal ε :=
  sorry

/-- 5.3: every law on `{0, 1}^ι` is approximated arbitrarily well in relative entropy by machines
with `2^(m − 1) − 1` hidden units, `m` the number of visible units (Montúfar–Ay, Corollary 2). -/
theorem exists_klDiv_lt (q : Measure (ι → Bool)) [IsProbabilityMeasure q] {ε : ℝ} (hε : 0 < ε) :
    ∃ θ : Params ι (Fin (2 ^ (Fintype.card ι - 1) - 1)),
      klDiv q (visibleLaw θ) < ENNReal.ofReal ε :=
  sorry

end Representation

end TauCetiRoadmap.RestrictedBoltzmannMachines
