import Mathlib

/-!
# Evidence lower bounds: target signatures

**This file is not the roadmap.** The roadmap is `README.md`. This file states the roadmap's
headline theorems against the pinned Mathlib, each with `sorry`, together with the definitions
they need; every definition has a real body. Every headline theorem of the README is statable at
the pins and is stated here. The README's remaining API lists and Checks are not restated.

Several definitions are verbatim copies, because a roadmap's Lean file cannot import another
roadmap's module: `isWeight`, `isEstimator` and `snisEstimator` from
ImportanceSamplingAndVarianceReduction 1.1 and 2.1; `bit` from QuantumOptimization 1.1; `gibbs`
from SimulatedAnnealing 3.1; `Params`, `energy`, `jointLaw`, `visibleLaw`, `hiddenLaw`,
`hiddenField`, `visibleField`, `hiddenKernel` and `visibleKernel` from
RestrictedBoltzmannMachines 1.1 and 1.2; `obsLikelihood`, `obsLogLikelihood` and `missingLaw`
from MathematicalStatisticsSemiparametric 7.1.

The latent variable lives in a measurable space `Z`. For a fixed observation the model is a
finite measure `p` on `Z` (the joint density at the observation, integrated against a reference
measure), its total mass `p univ` is the evidence and `(p univ)⁻¹ • p` is the posterior. The
proposal `q` is a probability measure on `Z`, and the importance weight is `isWeight p q`, the
Radon–Nikodym derivative `dp/dq` read in `ℝ`. Independent samples are the coordinates of
`Measure.infinitePi fun _ : ℕ ↦ q`.
-/

noncomputable section

open MeasureTheory ProbabilityTheory InformationTheory Filter Finset
open scoped ENNReal NNReal Topology

namespace TauCetiRoadmap.EvidenceLowerBound

section CopiedImportanceSampling

variable {α Ω Ω' : Type*} {mα : MeasurableSpace α} {mΩ : MeasurableSpace Ω}
  {mΩ' : MeasurableSpace Ω'}

/-- 1.1 (copied verbatim from ImportanceSamplingAndVarianceReduction 1.1): the importance weight
(likelihood ratio) `dp/dq`, as a real function. -/
def isWeight (p q : Measure α) (x : α) : ℝ :=
  (p.rnDeriv q x).toReal

/-- 1.1 (copied verbatim from ImportanceSamplingAndVarianceReduction 1.1): the importance
sampling estimate `(1/n) ∑_{i<n} f(Xᵢ) w(Xᵢ)`. -/
def isEstimator (p q : Measure α) (f : α → ℝ) (X : ℕ → Ω → α) (n : ℕ) (ω : Ω) : ℝ :=
  (n : ℝ)⁻¹ * ∑ i ∈ range n, f (X i ω) * isWeight p q (X i ω)

/-- 1.1 (copied verbatim from ImportanceSamplingAndVarianceReduction 2.1): the self-normalized
importance sampling estimate `∑ f(Xᵢ) w(Xᵢ) / ∑ w(Xᵢ)` (`0` when the weights sum to `0`). -/
def snisEstimator (p q : Measure α) (f : α → ℝ) (X : ℕ → Ω → α) (n : ℕ) (ω : Ω) : ℝ :=
  (∑ i ∈ range n, f (X i ω) * isWeight p q (X i ω)) / ∑ i ∈ range n, isWeight p q (X i ω)

end CopiedImportanceSampling

/-! ## Layer 1: importance weights, the posterior and the two bounds -/

section Bayes

/-- 1.2 Bayes' formula with a likelihood density: if every `κ z` has density `ℓ z` with respect
to a σ-finite `ν`, jointly measurable, then for `(κ ∘ₘ μ)`-almost every observation `x` the joint
measure `μ.withDensity (ℓ · x)` has positive finite mass (the evidence) and Mathlib's posterior
`(κ†μ) x` is that measure normalized. -/
theorem posterior_ae_eq_smul_withDensity {Z X : Type*} {mZ : MeasurableSpace Z}
    {mX : MeasurableSpace X} [StandardBorelSpace Z] [Nonempty Z] (μ : Measure Z)
    [IsFiniteMeasure μ] (κ : Kernel Z X) [IsFiniteKernel κ] (ν : Measure X) [SigmaFinite ν]
    (ℓ : Z → X → ℝ≥0∞) (hℓ : Measurable (Function.uncurry ℓ))
    (hκ : ∀ z, κ z = ν.withDensity (ℓ z)) :
    ∀ᵐ x ∂(κ ∘ₘ μ), 0 < (μ.withDensity fun z ↦ ℓ z x) Set.univ ∧
      (μ.withDensity fun z ↦ ℓ z x) Set.univ < ∞ ∧
      (κ†μ) x = ((μ.withDensity fun z ↦ ℓ z x) Set.univ)⁻¹ • μ.withDensity fun z ↦ ℓ z x :=
  sorry

end Bayes

section Bounds

variable {Z : Type*} {mZ : MeasurableSpace Z}

/-- 1.3 The evidence lower bound `∫ log (dp/dr) dr` of a probability measure `r` on the latent
space, for the joint measure `p`. -/
def elbo (p r : Measure Z) : ℝ :=
  ∫ z, Real.log (isWeight p r z) ∂r

/-- 1.3 The importance-weighted bound `L_k = E log ((1/k) ∑_{i<k} w(zᵢ))`, with `z₀, z₁, …`
independent of law `q` (the coordinates of the infinite product). -/
def iwElbo (p q : Measure Z) (k : ℕ) : ℝ :=
  ∫ ω, Real.log (isEstimator p q (fun _ ↦ 1) (fun i ω ↦ ω i) k ω)
    ∂Measure.infinitePi fun _ : ℕ ↦ q

/-! ## Layer 2: the importance-weighted bounds -/

/-- 2.1 Burda–Grosse–Salakhutdinov, Theorem 1 (parts 1 and 2): for `k ≥ 1` the bounds increase
with `k` and lie below the log-evidence, when `q ≪ p` and `log w` is `q`-integrable. -/
theorem iwElbo_monotoneOn_and_le_log (p q : Measure Z) [IsFiniteMeasure p]
    [IsProbabilityMeasure q] (hqp : q ≪ p)
    (hlog : Integrable (fun z ↦ Real.log (isWeight p q z)) q) :
    MonotoneOn (iwElbo p q) (Set.Ici 1) ∧
      ∀ k, 1 ≤ k → iwElbo p q k ≤ Real.log (p.real Set.univ) :=
  sorry

/-- 2.2 Convergence of the importance-weighted bounds to the log-evidence, for mutually
absolutely continuous `p` and `q` with `log w` integrable (in place of the bounded weights of
Burda–Grosse–Salakhutdinov, Theorem 1, part 3). -/
theorem tendsto_iwElbo (p q : Measure Z) [IsFiniteMeasure p] [IsProbabilityMeasure q]
    (hpq : p ≪ q) (hqp : q ≪ p) (hlog : Integrable (fun z ↦ Real.log (isWeight p q z)) q) :
    Tendsto (iwElbo p q) atTop (𝓝 (Real.log (p.real Set.univ))) :=
  sorry

/-- 2.3 Equality and strictness: under the hypotheses of 2.1 (no `p ≪ q`), for `k ≥ 1`, `L_k`
equals the log-evidence exactly when `q` is the posterior; if moreover `p ≪ q` and `q` is not the
posterior, the bounds increase strictly in `k ≥ 1`. -/
theorem iwElbo_eq_log_iff_and_strictMonoOn (p q : Measure Z) [IsFiniteMeasure p]
    [IsProbabilityMeasure q] (hqp : q ≪ p)
    (hlog : Integrable (fun z ↦ Real.log (isWeight p q z)) q) :
    (∀ k, 1 ≤ k → (iwElbo p q k = Real.log (p.real Set.univ) ↔ q = (p Set.univ)⁻¹ • p)) ∧
      (p ≪ q → q ≠ (p Set.univ)⁻¹ • p → StrictMonoOn (iwElbo p q) (Set.Ici 1)) :=
  sorry

/-! ## Layer 3: the augmented proposal -/

/-- 3.1 The augmented proposal `q_{n+1}` on `Z × Zⁿ` (the selected sample and the `n` others):
the product `q ⊗ qⁿ` with density `w(z) / ((n + 1)⁻¹ (w(z) + ∑ᵢ w(zᵢ')))`. -/
def iwJoint (p q : Measure Z) (n : ℕ) : Measure (Z × (Fin n → Z)) :=
  (q.prod (Measure.pi fun _ : Fin n ↦ q)).withDensity fun x ↦
    ENNReal.ofReal (isWeight p q x.1 /
      ((n + 1 : ℝ)⁻¹ * (isWeight p q x.1 + ∑ i, isWeight p q (x.2 i))))

/-- 3.1 Domke–Sheldon, Theorem 1, eq. (6): `iwJoint p q n` is the law of the selection process
(draw `n + 1` independent samples of law `q`, select index `m` with probability proportional to
its weight, put the selected sample first and keep the others in order). -/
theorem iwJoint_eq_bind (p q : Measure Z) [IsProbabilityMeasure q] (n : ℕ) :
    iwJoint p q n = (Measure.pi fun _ : Fin (n + 1) ↦ q).bind fun y ↦
      ∑ m, ENNReal.ofReal (isWeight p q (y m) / ∑ j, isWeight p q (y j)) •
        Measure.dirac (y m, Fin.removeNth m y) :=
  sorry

/-- 3.2 Domke–Sheldon, Theorem 1, eq. (7): `iwJoint p q n` is a probability measure and its
divergence from the augmented posterior `post ⊗ qⁿ` is the gap `log p(Z) − L_{n+1}`. -/
theorem isProbabilityMeasure_iwJoint_and_klDiv_eq (p q : Measure Z) [IsFiniteMeasure p]
    [IsProbabilityMeasure q] (hpq : p ≪ q) (hqp : q ≪ p)
    (hlog : Integrable (fun z ↦ Real.log (isWeight p q z)) q) (n : ℕ) :
    IsProbabilityMeasure (iwJoint p q n) ∧
      klDiv (iwJoint p q n) (((p Set.univ)⁻¹ • p).prod (Measure.pi fun _ : Fin n ↦ q)) =
        ENNReal.ofReal (Real.log (p.real Set.univ) - iwElbo p q (n + 1)) :=
  sorry

/-- 3.3 Domke–Sheldon, Theorem 2 and eq. (8): the augmented divergence splits into the
divergence of the first marginal from the posterior and the divergence of `iwJoint` from the
product of its first marginal with `qⁿ`; hence `L_{n+1}` lies below the evidence lower bound of
the first marginal, which lies below the log-evidence. -/
theorem klDiv_iwJoint_eq_add_and_iwElbo_le_elbo (p q : Measure Z) [IsFiniteMeasure p]
    [IsProbabilityMeasure q] (hpq : p ≪ q) (hqp : q ≪ p)
    (hlog : Integrable (fun z ↦ Real.log (isWeight p q z)) q) (n : ℕ) :
    klDiv (iwJoint p q n) (((p Set.univ)⁻¹ • p).prod (Measure.pi fun _ : Fin n ↦ q)) =
        klDiv (iwJoint p q n).fst ((p Set.univ)⁻¹ • p) +
          klDiv (iwJoint p q n) ((iwJoint p q n).fst.prod (Measure.pi fun _ : Fin n ↦ q)) ∧
      iwElbo p q (n + 1) ≤ elbo p (iwJoint p q n).fst ∧
      elbo p (iwJoint p q n).fst ≤ Real.log (p.real Set.univ) :=
  sorry

/-- 3.4 The first marginal of `iwJoint p q n` integrates a bounded `t` to the mean of the
self-normalized importance sampling estimate with `n + 1` samples (Domke–Sheldon, Lemma 4), and
the bias of that estimate is at most `C √(2 (log p(Z) − L_{n+1}))` when `|t| ≤ C`. -/
theorem integral_fst_iwJoint_eq_and_abs_sub_le (p q : Measure Z) [IsFiniteMeasure p]
    [IsProbabilityMeasure q] (hpq : p ≪ q) (hqp : q ≪ p)
    (hlog : Integrable (fun z ↦ Real.log (isWeight p q z)) q) (n : ℕ) {t : Z → ℝ}
    (ht : Measurable t) {C : ℝ} (htC : ∀ z, |t z| ≤ C) :
    ∫ z, t z ∂(iwJoint p q n).fst =
        ∫ ω, snisEstimator p q t (fun i ω ↦ ω i) (n + 1) ω ∂Measure.infinitePi (fun _ : ℕ ↦ q) ∧
      |∫ ω, snisEstimator p q t (fun i ω ↦ ω i) (n + 1) ω ∂Measure.infinitePi (fun _ : ℕ ↦ q) -
          (p.real Set.univ)⁻¹ * ∫ z, t z ∂p| ≤
        C * √(2 * (Real.log (p.real Set.univ) - iwElbo p q (n + 1))) :=
  sorry

/-- 3.5 The law of the selected sample converges to the posterior in relative entropy. -/
theorem tendsto_klDiv_fst_iwJoint (p q : Measure Z) [IsFiniteMeasure p] [IsProbabilityMeasure q]
    (hpq : p ≪ q) (hqp : q ≪ p) (hlog : Integrable (fun z ↦ Real.log (isWeight p q z)) q) :
    Tendsto (fun n ↦ klDiv (iwJoint p q n).fst ((p Set.univ)⁻¹ • p)) atTop (𝓝 0) :=
  sorry

end Bounds

/-! ## Layer 4: the greedy layer-wise bound for deep belief networks -/

section CopiedBit

variable {ι : Type*} [Fintype ι]

/-- 4.1 (copied verbatim from QuantumOptimization 1.1): the `{0,1}` value of variable `i` in the
configuration `x`: `1` if `x i` is true. -/
def bit (x : ι → Bool) (i : ι) : ℝ := if x i then 1 else 0

end CopiedBit

section CopiedGibbs

variable {S : Type*} [MeasurableSpace S] [MeasurableSingletonClass S]

/-- 4.1 (copied verbatim from SimulatedAnnealing 3.1): the Gibbs measure
`π_β(x) = exp(−β U x) / Σ_y exp(−β U y)` of an energy `U` on a finite set at inverse
temperature `β`. -/
def gibbs [Fintype S] (U : S → ℝ) (β : ℝ) : Measure S :=
  ∑ x, ENNReal.ofReal (Real.exp (-(β * U x)) / ∑ y, Real.exp (-(β * U y))) • Measure.dirac x

end CopiedGibbs

section Model

variable {ι κ : Type*} [Fintype ι] [DecidableEq ι] [Fintype κ] [DecidableEq κ]

/-- 4.1 (copied verbatim from RestrictedBoltzmannMachines 1.1): the parameter space of a machine
with visible units `ι` and hidden units `κ`: weights at `Sum.inl (i, j)`, visible biases at
`Sum.inr (Sum.inl j)`, hidden biases at `Sum.inr (Sum.inr i)`. -/
abbrev Params (ι κ : Type*) [Fintype ι] [Fintype κ] : Type _ :=
  EuclideanSpace ℝ ((κ × ι) ⊕ ι ⊕ κ)

/-- 4.1 (copied verbatim from RestrictedBoltzmannMachines 1.1): the energy
`E(v, h) = −Σ_i Σ_j W i j h_i v_j − Σ_j b_j v_j − Σ_i c_i h_i`. -/
def energy (θ : Params ι κ) (v : ι → Bool) (h : κ → Bool) : ℝ :=
  -(∑ i, ∑ j, θ (Sum.inl (i, j)) * bit h i * bit v j) - ∑ j, θ (Sum.inr (Sum.inl j)) * bit v j
    - ∑ i, θ (Sum.inr (Sum.inr i)) * bit h i

/-- 4.1 (copied verbatim from RestrictedBoltzmannMachines 1.1): the joint law of the visible and
the hidden configuration, the Gibbs measure of the energy at inverse temperature `1`. -/
def jointLaw (θ : Params ι κ) : Measure ((ι → Bool) × (κ → Bool)) :=
  gibbs (fun x ↦ energy θ x.1 x.2) 1

/-- 4.1 (copied verbatim from RestrictedBoltzmannMachines 1.1): the law of the visible
configuration, the first marginal of the joint law. -/
def visibleLaw (θ : Params ι κ) : Measure (ι → Bool) :=
  (jointLaw θ).map Prod.fst

/-- 4.1 (copied verbatim from RestrictedBoltzmannMachines 1.1): the law of the hidden
configuration, the second marginal of the joint law. -/
def hiddenLaw (θ : Params ι κ) : Measure (κ → Bool) :=
  (jointLaw θ).map Prod.snd

/-- 4.1 (copied verbatim from RestrictedBoltzmannMachines 1.2): the input
`c_i + Σ_j W i j v_j` of hidden unit `i` given the visible configuration. -/
def hiddenField (θ : Params ι κ) (v : ι → Bool) (i : κ) : ℝ :=
  θ (Sum.inr (Sum.inr i)) + ∑ j, θ (Sum.inl (i, j)) * bit v j

/-- 4.1 (copied verbatim from RestrictedBoltzmannMachines 1.2): the input
`b_j + Σ_i W i j h_i` of visible unit `j` given the hidden configuration. -/
def visibleField (θ : Params ι κ) (h : κ → Bool) (j : ι) : ℝ :=
  θ (Sum.inr (Sum.inl j)) + ∑ i, θ (Sum.inl (i, j)) * bit h i

/-- 4.1 (copied verbatim from RestrictedBoltzmannMachines 1.2): the product law of the hidden
units given `v`: unit `i` is on with probability `σ(hiddenField θ v i)`, independently of the
others. -/
def hiddenKernel (θ : Params ι κ) : Kernel (ι → Bool) (κ → Bool) :=
  Kernel.ofFunOfCountable fun v ↦
    ∑ h, ENNReal.ofReal (∏ i, Real.sigmoid (if h i then hiddenField θ v i
      else -hiddenField θ v i)) • Measure.dirac h

/-- 4.1 (copied verbatim from RestrictedBoltzmannMachines 1.2): the product law of the visible
units given `h`: unit `j` is on with probability `σ(visibleField θ h j)`, independently of the
others. -/
def visibleKernel (θ : Params ι κ) : Kernel (κ → Bool) (ι → Bool) :=
  Kernel.ofFunOfCountable fun h ↦
    ∑ v, ENNReal.ofReal (∏ j, Real.sigmoid (if v j then visibleField θ h j
      else -visibleField θ h j)) • Measure.dirac v

end Model

section Greedy

variable {ι κ κ' : Type*} [Fintype ι] [DecidableEq ι] [Fintype κ] [DecidableEq κ]
  [Fintype κ'] [DecidableEq κ']

/-- 4.1 The greedy step (Hinton–Osindero–Teh, §4): keep the visible kernel of an RBM and replace
its hidden law by any law `p'` charging every hidden configuration that fits the aggregated
posterior `q.bind (hiddenKernel θ)` at least as well in average log-likelihood; the average
log-likelihood of the data law `q` does not decrease. -/
theorem integral_log_visibleLaw_le_bind_visibleKernel (θ : Params ι κ) (q : Measure (ι → Bool))
    [IsProbabilityMeasure q] (p' : Measure (κ → Bool)) [IsProbabilityMeasure p']
    (hp' : ∀ h, 0 < p' {h})
    (hfit : ∫ h, Real.log ((hiddenLaw θ).real {h}) ∂(q.bind (hiddenKernel θ)) ≤
      ∫ h, Real.log (p'.real {h}) ∂(q.bind (hiddenKernel θ))) :
    ∫ v, Real.log ((visibleLaw θ).real {v}) ∂q ≤
      ∫ v, Real.log ((p'.bind (visibleKernel θ)).real {v}) ∂q :=
  sorry

/-- 4.2 The transposed machine: visible and hidden units exchanged, weights transposed, the two
bias vectors exchanged. -/
def transposeParams (θ : Params ι κ) : Params κ ι :=
  WithLp.toLp 2 (Sum.elim (fun p : ι × κ ↦ θ (Sum.inl (p.2, p.1)))
    (Sum.elim (fun i : κ ↦ θ (Sum.inr (Sum.inr i))) (fun j : ι ↦ θ (Sum.inr (Sum.inl j)))))

/-- 4.2 Adding a layer to a deep belief network (Hinton–Osindero–Teh, §4): if a second RBM
`θ'` on the hidden units fits the aggregated posterior at least as well as the transposed
machine, the two-layer model `(visibleLaw θ').bind (visibleKernel θ)` has average
log-likelihood under `q` at least that of the RBM `θ`. -/
theorem integral_log_visibleLaw_le_dbn (θ : Params ι κ) (θ' : Params κ κ')
    (q : Measure (ι → Bool)) [IsProbabilityMeasure q]
    (hfit : ∫ h, Real.log ((visibleLaw (transposeParams θ)).real {h})
        ∂(q.bind (hiddenKernel θ)) ≤
      ∫ h, Real.log ((visibleLaw θ').real {h}) ∂(q.bind (hiddenKernel θ))) :
    ∫ v, Real.log ((visibleLaw θ).real {v}) ∂q ≤
      ∫ v, Real.log (((visibleLaw θ').bind (visibleKernel θ)).real {v}) ∂q :=
  sorry

end Greedy

/-! ## Layer 5: the free-energy view of EM -/

section CopiedEM

variable {E Z : Type*} [NormedAddCommGroup E] [InnerProductSpace ℝ E] [FiniteDimensional ℝ E]
  [MeasurableSpace Z] (ρ : Measure Z)

/-- 5.1 (copied verbatim from MathematicalStatisticsSemiparametric 7.1): the observed-data
likelihood: the complete-data density, at the fixed observed data, integrated over the missing
part `z`. -/
def obsLikelihood (f : E → Z → ℝ) (θ : E) : ℝ := ∫ z, f θ z ∂ρ

/-- 5.1 (copied verbatim from MathematicalStatisticsSemiparametric 7.1): the observed-data
log-likelihood. -/
def obsLogLikelihood (f : E → Z → ℝ) (θ : E) : ℝ := Real.log (obsLikelihood ρ f θ)

/-- 5.1 (copied verbatim from MathematicalStatisticsSemiparametric 7.1): the conditional law of
the missing part given the observed data, at `θ`. -/
def missingLaw (f : E → Z → ℝ) (θ : E) : Measure Z :=
  ρ.withDensity fun z ↦ ENNReal.ofReal (f θ z / obsLikelihood ρ f θ)

/-- 5.1 Global maxima (Neal–Hinton, Theorem 2, global part, with its converse): a pair
`(q⋆, θ⋆)` maximizes the evidence lower bound over probability measures `q ≪ ρ` and `θ ∈ Θ`
exactly when `θ⋆` maximizes the observed-data log-likelihood over `Θ` and `q⋆` is
`missingLaw ρ f θ⋆`. -/
theorem elbo_le_iff_obsLogLikelihood_le [Fintype Z] [MeasurableSingletonClass Z]
    [IsFiniteMeasure ρ] (f : E → Z → ℝ) (Θ : Set E) (hpos : ∀ θ ∈ Θ, ∀ z, 0 < f θ z)
    (qs : Measure Z) [IsProbabilityMeasure qs] (hqs : qs ≪ ρ) {θs : E} (hθs : θs ∈ Θ) :
    (∀ θ ∈ Θ, ∀ q : Measure Z, IsProbabilityMeasure q → q ≪ ρ →
        elbo (ρ.withDensity fun z ↦ ENNReal.ofReal (f θ z)) q ≤
          elbo (ρ.withDensity fun z ↦ ENNReal.ofReal (f θs z)) qs) ↔
      (∀ θ ∈ Θ, obsLogLikelihood ρ f θ ≤ obsLogLikelihood ρ f θs) ∧ qs = missingLaw ρ f θs :=
  sorry

end CopiedEM

end TauCetiRoadmap.EvidenceLowerBound
